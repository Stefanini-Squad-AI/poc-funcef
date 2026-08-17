{-------------------------------------------------------------------------------
ALTERAÇÕES / IMPLEMENTAÇÕES ----------------------------------------------------
-------------------------------------------------------------------------------------
N.WO............: WO39052
Data............: 14/04/2026
Responsável.....: Paulo Nobre
Descrição.......: .Criação da Função: ListUltimoAditamentoDisponivel
-------------------------------------------------------------------------------------
N.WO............: WO31928
Data............: 03/02/2026
Responsável.....: Paulo Nobre
Descrição.......: Ajuste na função "AtualizaDataInicioCobranca" para tratar de forma
                  correta a montagem da data quando for ano bisexto.
-------------------------------------------------------------------------------------
N. SIG..........: SIG TIBERO
Data............: 12/06/2018
Responsável.....: Everson Luiz Pereira da Cunha
Descrição.......: Ajustes para adequação ao TIBERO
--------------------------------------------------------------------------------
N. SIG..........: 67505
Data............: 11/05/2018
Responsável.....: Darivaldo Alencar
Descrição.......: Atualizado chaves da tabela CTRLPARCELAMEDICAO após update na
                  tabela OBJETOSXITEMCONTR
--------------------------------------------------------------------------------
N. SIG..........: 30134
Data............: 04/10/2016
Responsável.....: Peterson Victor
Descrição.......: Tratamento do ultimo dia do mes
--------------------------------------------------------------------------------
N. Sol..........: 255656
N. PPM..........: 838765
Data............: 16/06/2015
Responsável.....: Wylliam Leite da Silva
Descrição.......: Correção na rotina de medição
--------------------------------------------------------------------------------
N. Sol..........: 218909/16724
N. PPM..........: 588170
Data............: 20/02/2015
Responsável.....: Felipe A. Santos
Descrição.......: Criação da Control.
--------------------------------------------------------------------------------}

unit uCtrlCtrlParcelaMedicao;

interface

uses sysutils, uCmControlObject, uCmDbObject, uSistema, DB, uDataBase, DbClient,
     uCMClientDataSet, uDbCtrlParcelaMedicao, uCMTypes, dialogs;

type
    TCtrlCtrlParcelaMedicao = class(TCmControlObject)
    private
      sSQL : string;
      FDbCtrlParcelaMedicao : TDbCtrlParcelaMedicao;
      FCdsAlerta: TCMClientDataSet;
    protected
      procedure DoChangeDataBase; override;
    public
      function ListContratosParaMedicao : OleVariant;
      function ListCtrlParcelaMedicao(pIdContrato : Double; const pIdObjeto: Double = -1;
                                                            const pIdItem: Double = -1;
                                                            const pParcelaNum: Double = -1) : OleVariant;
      function CamposAlertaMedicao : OleVariant;
      function ExibeAlerta(pdDiasAlerta : Double; pdDataVencimento : TDateTime) : Boolean;
      function GetDiasEncerramento(pdDataVencimento : TDateTime) : Integer;
      function GetCodDocumento(pIdContrato : Integer) : Integer;
      function GetDadosCtrlParcMedicao(pIdContrato, pIdObjeto, pIdItem : Integer;
                                       const pParcelaNum : Integer = -1;
                                       const pIdAditamento : Integer = -1) : Integer;
      function GetDataVencimento(pIdContrato, pIdObjeto, pIdItem, pParcelaNum : Integer) : TDateTime;
      function GetQuantidadeDiasUteis(pDataIni, pDataFim : TDateTime) : Integer;
      function GetDadosProximaParcela(IdContrato: Integer; const IdItem : Integer = -1; const idObjeto : integer = -1) : OleVariant;
      function AtualizaDataInicioCobranca(DataCobranca: TDateTime): TDateTime;
      function ExisteNoControleDeAlertas(IdContrato, IdObjeto, IdItem : integer) : Boolean;

      procedure InserirCtrlParcelaMedicao( CdsServProdXItemContr, CdsCtrlParcelaMedicao:
                                           TCMClientDataSet; ReiniciarParcelas: Boolean);

      constructor Create; override;
      destructor Destroy; override;

      procedure OnCreateAppServer; override;

      Function ListParcelaMedicao(rIDContrato, rIDObjeto, rIDItem: Double): OleVariant; //Darivaldo Alencar SIG67505

      Function ListUltimoAditamentoDisponivel(pIdContrato: Integer) : OleVariant;        // Paulo Nobre - WO39052

      property CdsAlerta : TCMClientDataSet read FCdsAlerta write FCdsAlerta;
    end;


implementation

{ TCtrlCtrlParcelaMedicao }

function TCtrlCtrlParcelaMedicao.CamposAlertaMedicao: OleVariant;
begin
   sSQL := 'SELECT C.NOMECONTRATO, ' +
           '       CPM.VENCIMENTO, ' +
           '       C.AVISOMEDICAO,  ' +
           '       O.OBSERVACAO, ' +
           '       0 AS DIASENCERRAMENTO, ' +
           '       CPM.PARCELANUM, ' +
           '       CPM.IDCONTRATO, ' +
           '       CPM.IDOBJETO, ' +
           '       CPM.IDITEM, ' +
           '       CPM.IDPARCMEDICAO, ' +
           '       CPM.IDADITAMENTO ' +  
           '  FROM CONTRATOCONTR C, CTRLPARCELAMEDICAO CPM, OBJETOSXITEMCONTR O ' +
           ' WHERE C.IDCONTRATO = CPM.IDCONTRATO ' +
           '   AND C.IDCONTRATO = -1 ' + 
           '   AND CPM.IDCONTRATO = O.IDCONTRATO ' +
           '   AND CPM.IDOBJETO =  O.IDOBJETO ' +
           '   AND CPM.IDITEM = O.IDITEM';

   Result := GetDataPacket(sSQL);
end;

constructor TCtrlCtrlParcelaMedicao.Create;
begin
   inherited Create;
   FDbCtrlParcelaMedicao := TDbCtrlParcelaMedicao.Create(Self);
end;

destructor TCtrlCtrlParcelaMedicao.Destroy;
begin
  FreeAndNil(FDbCtrlParcelaMedicao);
  inherited;

end;

procedure TCtrlCtrlParcelaMedicao.DoChangeDataBase;
var
  sbase : string;
begin
  inherited;
  FDbCtrlParcelaMedicao.DataBaseName := DataBaseName;
end;

function TCtrlCtrlParcelaMedicao.ExibeAlerta(pdDiasAlerta: Double; pdDataVencimento : TDateTime): Boolean;
begin

  // Cálculo o intervalo com base na data atual e a quantidade de dias de antecedência para exibição do alerta.
  sSQL := 'SELECT CM.CALCULA_INTERVALO_UTIL( ' + FloatToStr(pdDiasAlerta) + ') AS DATAALERTA FROM DUAL';

  _cds.Data := GetDataPacket(sSQL);

  // Se a data de vencimento so menor que a data do alerta, significa que o período está no intervalo
  // para exibição do alerta.
  Result :=  (pdDataVencimento < _Cds.FieldByName('DATAALERTA').AsDateTime);
end;

function TCtrlCtrlParcelaMedicao.GetCodDocumento(
  pIdContrato: Integer): Integer;
var
   sSQL : String;
begin
  // select copiada do MSMEDICAO da tela de medição
   sSQL := ' SELECT ' +
           '      DISTINCT ' +
           '     CONTRATOCONTR.NOMECONTRATO, ' +
           '     MEDICAO.DATAMEDICAO, ' +
           '     MEDICAO.DATALANCAMENTO, ' +
           '     MEDICAO.HISTORICOCOMPL, ' +
           '     CONTRATOCONTR.TIPOCONTRATO, ' +
           '     PARCELAMEDICAO.CODDOCUMENTO, ' +
           '     CONTRATOCONTR.IDCONTRATO ' +
           '  FROM  ' +
           '     CONTRATOCONTR,  ' +
           '     MEDICAO, ' +
           '     PARCELAMEDICAO ' +
           ' WHERE ' +
           ' ( CONTRATOCONTR.IDCONTRATO = ' + IntToStr(pIdContrato) + ') AND ' +
           ' ( CONTRATOCONTR.IDCONTRATO = MEDICAO.IDCONTRATO ) AND ' +
           ' ( MEDICAO.IDMEDICAO = PARCELAMEDICAO.IDMEDICAO ) AND ' +
           ' ( NVL(MEDICAO.FLGESTORNADO,0) = 0 ) AND ' +
           ' ( CONTRATOCONTR.FLGFIMCONTRATO <> ''E'' )' ;

   _Cds.Data := GetDataPacket(sSQL);

   Result := (_Cds.FieldByName('CODDOCUMENTO').AsInteger);
end;

function TCtrlCtrlParcelaMedicao.GetDiasEncerramento(
  pdDataVencimento : TDateTime): Integer;
var
   iDiasNaoUteis : integer;
begin
  // cálcula a quantidade de dias uteis entre a data atual e a data de vencimento do contrato

  if Date <= pdDataVencimento then
  begin
     Result := GetQuantidadeDiasUteis(Date, pdDataVencimento);
  end
  else
  begin
     Result := GetQuantidadeDiasUteis(pdDataVencimento, Date) *-1; // passou do dia do vencimento então fica negativo
  end;

end;

function TCtrlCtrlParcelaMedicao.GetDadosCtrlParcMedicao(pIdContrato, pIdObjeto,
  pIdItem: Integer; const pParcelaNum : Integer = -1;
                    const pIdAditamento : Integer = -1): Integer;
var
  sSQL : string;
begin
  sSQL := ' SELECT CPM.IDPARCMEDICAO, ' +
          '        CPM.PARCELANUM, ' +
          '        CPM.VENCIMENTO, ' +
          '        CPM.IDADITAMENTO ' +
          '   FROM CTRLPARCELAMEDICAO CPM, CONTRATOCONTR C ' +
          '  WHERE CPM.IDCONTRATO = ' + IntToStr(pIdContrato) +
          '    AND CPM.IDOBJETO = ' + IntToStr(pIdObjeto) +
          '    AND CPM.IDITEM = ' + IntToStr(pIdItem) +
          '    AND CPM.IDCONTRATO = C.IDCONTRATO ' +
          '    AND CPM.FLGPARCELAMEDIDA = 0 ';

  //Wylliam Leite da Silva - SOL: 255656 PPM: 838765 - Inicio
  sSQL:= sSQL + '    AND C.FLGAVISOMEDICAO in (0, 1) ';
  //Wylliam Leite da Silva - SOL: 255656 PPM: 838765 - Fim

  sSQL:= sSQL + '    AND NVL(CPM.IDADITAMENTO,0) = (SELECT NVL(MAX(IDADITAMENTO),0) FROM CTRLPARCELAMEDICAO CPM2 ' +
          '                                    WHERE CPM2.IDCONTRATO  = CPM.IDCONTRATO ' +
          '                                      AND CPM2.IDOBJETO  = CPM.IDOBJETO ' +
          '                                      AND CPM2.IDITEM  = CPM.IDITEM) ' +
          '    AND (CPM.IDCONTRATO IN (SELECT IDCONTRATO ' +
          '                              FROM CONTRATOUSUARIO '+
          '                             WHERE (IDUSUARIO = '+FloatToStr(Sistema.IdUsuario)+')))';

  // se a parcela for diferente de menos 1, quer dizer que quero pegar o IDPARCMEDICAO da determinada
  // passada como parâmetro, para atualizar a FLGPARCELAMEDIDA e IDMEDICAO da mesma.
  // se não pega o número da parcela vigente.

  if pParcelaNum <> -1 then
  begin
    sSQL := sSQL + '    AND CPM.PARCELANUM = ' + IntToStr(pParcelaNum);
    _Cds.Data := GetDataPacket(sSQL);
    Result := _Cds.FieldByName('IDPARCMEDICAO').AsInteger;
  end
  else if pIdAditamento <> -1 then
  begin
    _Cds.Data := GetDataPacket(sSQL);
    Result := _Cds.FieldByName('IDADITAMENTO').AsInteger;
  end
  else
  begin
    _Cds.Data := GetDataPacket(sSQL);
    Result := _Cds.FieldByName('PARCELANUM').AsInteger;
  end;
end;

function TCtrlCtrlParcelaMedicao.ListContratosParaMedicao: OleVariant;
begin
   sSQL := ' SELECT C.NOMECONTRATO, ' +
           '        CPM.VENCIMENTO, ' +
           '        C.AVISOMEDICAO, ' +
           '        O.OBSERVACAO, ' +
           '        CPM.PARCELANUM, ' + 
           '        CPM.IDADITAMENTO, ' +
           '        CPM.IDCONTRATO, ' +
           '        CPM.IDOBJETO, ' +
           '        CPM.IDITEM, ' +
           '        CPM.IDPARCMEDICAO ' +
           '   FROM CONTRATOCONTR C, CTRLPARCELAMEDICAO CPM, OBJETOSXITEMCONTR O ' +
           '  WHERE C.FLGAVISOMEDICAO = 1 ' +
           '    AND C.FLGFIMCONTRATO <> ''E'' ' +
           '    AND CPM.FLGPARCELAMEDIDA  = 0 ' +
           '    AND (CPM.IDCONTRATO IN (SELECT IDCONTRATO ' +       //Everson TIBERO (Alterada a ordem do AND)
           '                              FROM CONTRATOUSUARIO '+
           '                             WHERE (IDUSUARIO = '+FloatToStr(Sistema.IdUsuario)+'))) ' +
           '    AND NVL(CPM.IDADITAMENTO,0) = (SELECT NVL(MAX(IDADITAMENTO),0) FROM CTRLPARCELAMEDICAO CPM2 ' +
           '                                    WHERE CPM2.IDCONTRATO  = CPM.IDCONTRATO ' +
           '                                      AND CPM2.IDOBJETO  = CPM.IDOBJETO ' +
           '                                      AND CPM2.IDITEM  = CPM.IDITEM) ' +
           '    AND C.IDCONTRATO = CPM.IDCONTRATO ' +
           '    AND CPM.IDCONTRATO = O.IDCONTRATO ' +
           '    AND CPM.IDOBJETO =  O.IDOBJETO ' +
           '    AND CPM.IDITEM = O.IDITEM ' + 
           ' ORDER BY CPM.VENCIMENTO, C.NOMECONTRATO';

   Result := GetDataPacket(sSQL);
end;

function TCtrlCtrlParcelaMedicao.ListCtrlParcelaMedicao(pIdContrato: Double;
                                                        const pIdObjeto: Double = -1;
                                                        const pIdItem: Double = -1;
                                                        const pParcelaNum: Double = -1) : OleVariant;
var
  sSQL : string;
begin
  sSQL := 'SELECT * ' +
          '  FROM CTRLPARCELAMEDICAO  ' +
          ' WHERE IDCONTRATO = ' + FloatToStr(pIdContrato) +
          '   AND FLGPARCELAMEDIDA = 1';

          if pParcelaNum <> -1 then
            sSQL := sSQL + '   AND PARCELANUM = ' + FloatToStr(pParcelaNum);

          if pIdObjeto <> -1 then
             sSQL := sSQL +  '   AND IDOBJETO = ' + FloatToStr(pIdObjeto);

          if pIdItem <> -1 then
             sSQL := sSQL +  '   AND IDITEM = ' + FloatToStr(pIdItem);


  Result := GetDataPacket(sSQL);
end;

procedure TCtrlCtrlParcelaMedicao.OnCreateAppServer;
begin
  inherited;
  FCdsAlerta := TCMClientDataSet.Create(nil);  
end;

function TCtrlCtrlParcelaMedicao.GetDataVencimento(pIdContrato, pIdObjeto,
  pIdItem, pParcelaNum: Integer): TDateTime;
var
   sSQL : String;
begin
  sSQL := ' SELECT CPM.VENCIMENTO ' +
          '   FROM CTRLPARCELAMEDICAO CPM, CONTRATOCONTR C ' +
          '  WHERE CPM.IDCONTRATO = ' + IntToStr(pIdContrato) +
          '    AND CPM.IDOBJETO = ' + IntToStr(pIdObjeto) +
          '    AND CPM.IDITEM = ' + IntToStr(pIdItem) +
          '    AND CPM.IDCONTRATO = C.IDCONTRATO ' +
          '    AND CPM.FLGPARCELAMEDIDA = 0 ';
          
          //Wylliam Leite da Silva - SOL: 255656 PPM: 838765 - Inicio
          sSQL := sSQL + '    AND C.FLGAVISOMEDICAO in (0,1) ';
          //Wylliam Leite da Silva - SOL: 255656 PPM: 838765 - Fim

          sSQL := sSQL + '    AND CPM.PARCELANUM = ' + IntToStr(pParcelaNum);

  _Cds.Data := GetDataPacket(sSQL);

  Result := _Cds.FieldByName('VENCIMENTO').AsDateTime;
end;

function TCtrlCtrlParcelaMedicao.GetQuantidadeDiasUteis(pDataIni,
  pDataFim: TDateTime): Integer;
var
   sSQL : string;
begin
   sSQL := 'SELECT CM.QUANTIDADE_DIAS_UTEIS(' + QuotedStr(DateToStr(pDataIni)) + ', ' + QuotedStr(DateToStr(pDataFim)) + ' ) ' +
           '       AS DIAS FROM DUAL';

   _Cds.Data := GetDataPacket(sSQL);

   Result := _Cds.FieldByName('DIAS').AsInteger;
end;

function TCtrlCtrlParcelaMedicao.GetDadosProximaParcela(IdContrato: Integer; const IdItem : Integer = -1; const idObjeto : integer = -1): OleVariant;
var
  sSQL : string;
begin
  sSQL := 'SELECT CPM.* ' +
          '  FROM CTRLPARCELAMEDICAO CPM ' +
          ' WHERE IDCONTRATO = ' + IntToStr(IdContrato) +
          '   AND PARCELANUM = (SELECT MIN(PARCELANUM) ' +
          '                       FROM CTRLPARCELAMEDICAO CPM2 ' +
          '                      WHERE CPM2.IDCONTRATO = ' + IntToStr(IdContrato) + 
          '                        AND CPM2.FLGPARCELAMEDIDA = 0) ' + 
          '   AND NVL(IDADITAMENTO,0) = (SELECT NVL(MAX(IDADITAMENTO),0) FROM CTRLPARCELAMEDICAO CPM2 ' +
          '                               WHERE CPM2.IDCONTRATO  = CPM.IDCONTRATO ' +
          '                                 AND CPM2.IDOBJETO  = CPM.IDOBJETO ' +
          '                                 AND CPM2.IDITEM  = CPM.IDITEM)';

  if IdObjeto <> -1 then
     sSQL := sSQL + ' AND IDOBJETO = ' + IntToStr(IdObjeto);

  if IdItem <> -1 then
     sSQL := sSQL + ' AND IDITEM = ' + IntToStr(IdItem);

  Result := GetDataPacket(sSQL);
end;

procedure TCtrlCtrlParcelaMedicao.InserirCtrlParcelaMedicao(
  CdsServProdXItemContr, CdsCtrlParcelaMedicao: TCMClientDataSet; ReiniciarParcelas: Boolean);
var
   dDataInicioCobranca : TDateTime;
   iMesesFrequencia, iParcelas, iIdItem, iIdContrato, iIdObjeto, i : Integer;
   sFrequencia : string;
begin
    cdsServProdxItemContr.First;
    while not(cdsServProdxItemContr.Eof) do
    begin
       // pego os valores para inserir todas as parcelas novamente na tabela CTRLPARCELAMEDICAO
       iIdContrato := CdsServProdXItemContr.FieldByName('IDCONTRATO').AsInteger;
       iIdItem := CdsServProdXItemContr.FieldByName('IDITEM').AsInteger;
       iIdObjeto := CdsServProdXItemContr.FieldByName('IDOBJETO').AsInteger;
       dDataInicioCobranca := cdsServProdxItemContr.FieldByName('DATAINICIOCOBR').AsDateTime;
       sFrequencia := cdsServProdxItemContr.FieldByName('FREQUENCIA').AsString;
       iParcelas := cdsServProdxItemContr.FieldByName('NUMPARCELAS').AsInteger;

       if (sFrequencia = 'U') then
          iMesesFrequencia := 0
       else if (sFrequencia = 'M') then
          iMesesFrequencia := 1
       else if (sFrequencia = 'T') then
          iMesesFrequencia := 3
       else if (sFrequencia = 'S') then
          iMesesFrequencia := 6
       else if (sFrequencia = 'A') then
         iMesesFrequencia := 12;

       if (ReiniciarParcelas) then
       begin
         cdsServProdxItemContr.Edit;
         cdsServProdxItemContr.FieldByName('DATAINICIOCOBR').AsString := FormatDateTime('DD/MM/YYYY', AtualizaDataInicioCobranca(dDataInicioCobranca));
         cdsServProdxItemContr.Post;

         // prepara a data inicio para o proximo mês de cobrança da parcela
         dDataInicioCobranca := cdsServProdxItemContr.FieldByName('DATAINICIOCOBR').AsDateTime;
       end;

       for i := 1 to iParcelas do
       begin
         cdsCtrlParcelaMedicao.Insert;
         cdsCtrlParcelaMedicao.FieldByName('IDCONTRATO').AsInteger := iIdContrato;
         cdsCtrlParcelaMedicao.FieldByName('IDITEM').AsInteger := iIdItem;
         cdsCtrlParcelaMedicao.FieldByName('IDOBJETO').AsInteger := iIdObjeto;
         cdsCtrlParcelaMedicao.FieldByName('PARCELANUM').AsInteger := i;
         cdsCtrlParcelaMedicao.FieldByName('VENCIMENTO').AsDateTime := dDataInicioCobranca; //FormatDateTime('DD/MM/YYYY', dDataInicioCobranca);
         cdsCtrlParcelaMedicao.FieldByName('FLGPARCELAMEDIDA').AsInteger := 0;
         cdsCtrlParcelaMedicao.Post;

         // Calculo a data de vencimento com base na frenquência, e na parcela atual.
         dDataInicioCobranca := IncMonth(dDataInicioCobranca, iMesesFrequencia);
       end;

       cdsServProdxItemContr.Next;
    end;
end;

// Paulo Nobre - WO31928 - Inicio
function TCtrlCtrlParcelaMedicao.AtualizaDataInicioCobranca(DataCobranca: TDateTime): TDateTime;
var ano, mes, dia, ano1, mes1, dia1, ano2, mes2, dia2 : word;
    iQtdMeses: Integer;

  function UltimoDiaMes(Mdt: TDateTime) : TDateTime;
  var
    ano, mes, dia : word;
    mDtTemp : TDateTime;
  begin
    Decodedate(mDt, ano, mes, dia);
    mDtTemp := (mDt - dia) + 33;
    Decodedate(mDtTemp, ano, mes, dia);
    Result := mDtTemp - dia;
  end;

  function MonthsBetweenYM(Y1, M1, Y2, M2: Integer): Integer;
  begin
    Result := (Y2 - Y1) * 12 + (M2 - M1);
  end;

begin
  if DataCobranca < Date then
  begin
     //Peterson Victor SIG30134 Inicio
     if UltimoDiaMes(DataCobranca) = DataCobranca then
        Result := UltimoDiaMes(Date)
     else
     begin
        Decodedate(DataCobranca, ano1, mes1, dia1);
        Decodedate(Date, ano2, mes2, dia2);

        iQtdMeses := MonthsBetweenYM(ano1, mes1, ano2, mes2);
        DataCobranca := IncMonth(DataCobranca, iQtdMeses);

        Result := StrToDate(FormatDateTime('DD/', DataCobranca) + FormatDateTime('MM/YYYY', Date));  
     end;
     //Peterson Victor SIG30134 FIM
  end
  else
     Result := DataCobranca;
end;
// Paulo Nobre - WO31928 - Fim

function TCtrlCtrlParcelaMedicao.ExisteNoControleDeAlertas(IdContrato, IdObjeto, IdItem : integer): Boolean;
var
  sSQL : string;
begin
  sSQL := 'SELECT * ' +
          '  FROM  CTRLPARCELAMEDICAO ' +
          ' WHERE IDCONTRATO = ' + IntToStr(IdContrato) +
          '   AND IDOBJETO = ' + IntToStr(IdObjeto) +
          '   AND IDITEM = ' + IntToStr(IdItem);
  _Cds.Data := GetDataPacket(sSQL);

  Result := not(_Cds.IsEmpty);
end;

//Darivaldo Alencar SIG67505 -inicio
function TCtrlCtrlParcelaMedicao.ListParcelaMedicao(rIDContrato, rIDObjeto,  rIDItem: Double): OleVariant;
var sSql: String;
begin
   sSql:= 'SELECT * FROM CTRLPARCELAMEDICAO '+
          ' WHERE '+
          '  IDOBJETO = ' + FloatToStr(rIDObjeto)+
          '  AND IDITEM = ' + FloatToStr(rIDItem)+
          '  AND IDCONTRATO = ' + FloatToStr(rIDContrato);
   Result:=GetDataPacket(sSql);
end;
//Darivaldo Alencar SIG67505 -inicio-fim

// Paulo Nobre - WO39052 - Inicio
function TCtrlCtrlParcelaMedicao.ListUltimoAditamentoDisponivel(pIdContrato: Integer) : OleVariant;
var
  sSQL : string;
begin
  sSQL := 'SELECT MAX(A.IDADITAMENTO) AS IDADITAMENTO            ' +
          'FROM ADITAMENTO A                                     ' +
          'WHERE A.IDCONTRATO = ' + FloatToStr(pIdContrato)        +
          '      AND A.VL_ADITAMENTO > 0                         ' +
          '      AND A.FLGSALDOTRANSFERIDO = ''N''               ' +
          '      AND A.FLGREINICIODASPARCELAS = ''S''            ';

  Result:=GetDataPacket(sSQL);
end;
// Paulo Nobre - WO39052 - Fim

end.
