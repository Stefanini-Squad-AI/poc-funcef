{ --------------------------------------------------------------------------------------------------
Nº SOL......: 107772/5704
Nº KINTANA..: 1360314
Data........: 25/05/2012
Responsável.: André Oliveira
Descrição...: Trazer apenas alteradores de desconto concedido, passar para 4 casas decimais
os campos de divergencias
---------------------------------------------------------------------------------------------------}

{ --------------------------------------------------------------------------------------------------
Nº SOL......: 84903
Nº KINTANA..: 523148
Data........: 24/06/2010
Responsável.: Fábio Henrique Beccaria Sampaio
Descrição...: Divergência dos Saldos Operacional e Contábil
---------------------------------------------------------------------------------------------------}

unit uCtrlConsSaldoDiverg;

interface

uses
  SysUtils, uCmControlObject, uCmDbObject, uCmClientDataSet, uCMTypes,
  Classes;

type
  TCtrlConsSaldoDiverg = class(TCmControlObject)
  private
    FCdsAux: TCMClientDataSet;
    FCdsSaldo: TCMClientDataSet;
    FCdsDocumento: TCMClientDataSet;
    FCdsDivergencia: TCMClientDataSet;
    FMovIdImovel: Integer;
    FMovIdBem: Integer;
    FMovDtIni: TDateTime;
    FMovDtFim: TDateTime;
    FRegDiverg: Boolean;
    FIdContratoImovel : Integer;
  protected
    procedure AfterInitialize;  Override;
    procedure OnCreateAppServer; Override;

  public

    procedure SaveSQL(FileName, SQL: String);

    constructor Create; override;
    destructor Destroy; override;

    function ListaContratos(iIdImovel, iIdImovelMestre: Integer; dDataIni, dDataFim: TDateTime; iIdContratoImovel: Integer = -1; sCodTipImovel: String = '') : OleVariant;
    function ListaImovel(idImovel: Integer = -1; idImovelMestre: Integer = -1; CodTipImovel: String = ''): OleVariant;


    function ListaSaldos(idImovel, idBem: Integer; dDataIni, dDataFim: TDateTime; iIdContratoImovel: Integer = -1): OleVariant;
    //--
    function GetSaldoContratoOperacional(iIdContratoImovel: Integer; dData: TDateTime): Double;
    function GetSaldoContratoContabil(iIdContratoImovel: Integer; dData: TDateTime): Double;


    procedure PegaMovimentacao(idImovel, idBem: Integer; dDataIni, dDataFim: TDateTime; iIdContratoImovel: Integer = -1);
    //--
    function RetornaSQLSaldoAlienacao(iIdContratoImovel: Integer; dDataFinal, dDataInicio: TDateTime): string;
    function RetornaSQLSaldoAdminImob(iIdContratoImovel: Integer; dDataFinal, dDataInicio: TDateTime): string;
    procedure AtualizaPlanoDepara_Imob;


    function ListaDocumento(idImovel, idBem: Integer; dDataIni, dDataFim: TDateTime; iIdContratoImovel: Integer = -1): OleVariant;
    //--


    function ListaAlteradoresDoc(iCodDocumento: Integer; iIdContratoImovel: Integer = -1): OleVariant;

    function ListaDivergencia(idImovel, idBem: Integer; dDataIni, dDataFim: TDateTime; iIdContratoImovel : Integer = -1): OleVariant;
    //--








    function ListaAlteradores(idImovel, idBem, iAno, iMes: Integer): OleVariant;

    function RetornaSQLSaldoInvestImob(iIdBem, iIdImovel, iPlano : Integer; dData : TDateTime): string;




    function MontaPlanoContas: string;

    function RetornaPlanoCorrente: Integer;

    function PegarContasContabeis(iIdContratoImovel : Integer; dDataAssinatura, dDataFim : TDateTime) : String;
    function PegaDataAssinatura (iIdContratoImovel : Integer) : TDateTime;
    function PegaDataInicioContratoAluguel (iIdContratoImovel : Integer) : TDateTime;

  published
    property RegDiverg: Boolean read FRegDiverg write FRegDiverg;
    property MovIdImovel: Integer read FMovIdiMovel write FMovIdiMovel;
    property MovIdBem: Integer read FMovIdBem write FMovIdBem;
    property MovDtIni: TDateTime read FMovDtIni write FMovDtIni;
    property MovDtFim: TDateTime read FMovDtFim write FMovDtFim;
    property IdContratoImovel : Integer read FIdContratoImovel write FIdContratoImovel;
  end;

const
  CR_LF = #13#10;
  
implementation


uses uFuncoesImob, uData, uSistema, DB, uComunsImobiliario;

{ TCtrlConsSaldoDiverg }

constructor TCtrlConsSaldoDiverg.Create;
begin
  inherited;
  FCdsAux := TCMClientDataSet.Create(nil);
  FCdsSaldo := TCMClientDataSet.Create(nil);
  FCdsDocumento := TCMClientDataSet.Create(nil);
  FCdsDivergencia := TCMClientDataSet.Create(nil);
  FMovIdImovel := -1;
  FMovIdBem := -1;
  FMovDtIni := -1;
  FMovDtFim := -1;
end;

destructor TCtrlConsSaldoDiverg.Destroy;
begin
  if FCdsDivergencia.Active then FCdsDivergencia.Close;
  if FCdsDocumento.Active then FCdsDocumento.Close;
  if FCdsSaldo.Active then FCdsSaldo.Close;
  if FCdsAux.Active then FCdsAux.Close;
  FCdsDivergencia.Free;
  FCdsDocumento.Free;
  FCdsSaldo.Free;
  FCdsAux.Free;
  inherited;
end;

procedure TCtrlConsSaldoDiverg.OnCreateAppServer;
begin
  inherited;
  // Cria os Cds somente no caso de execução pela aplicação servidora, pois na
  // aplicação cliente, os mesmos já foram criados.
end;

procedure TCtrlConsSaldoDiverg.AfterInitialize;
begin
  inherited;
  //
end;

function TCtrlConsSaldoDiverg.ListaImovel(idImovel,
  idImovelMestre: Integer; CodTipImovel: String): OleVariant;
var
  sSql, sParam : String;
begin
  sParam := '';
  if idImovel <> -1 then sParam := sParam + ' AND I.IDIMOVEL = ' + IntToStr(IdImovel);
  if idImovelMestre <> -1 then sParam := sParam + ' AND I.IDIMOVELMESTRE = ' + IntToStr(idImovelMestre);
  if CodTipImovel <> '' then sParam := sParam + ' AND I.CODTIPIMOVEL = ' + QuotedStr(CodTipImovel);

  sSql := 'SELECT '+CR_LF+
          '  I.IDIMOVEL, I.IMOCODIGO, I.IMONOME, IB.IDBEM,'+CR_LF+
          '  IM.IMONOME AS IMOVELMESTRE, '+CR_LF+
          '  G.NOME AS GRUPOCONTAB '+CR_LF+
          'FROM '+CR_LF+
          '  IMOVEL I, '+CR_LF+
          '  IMOVEL IM, '+CR_LF+
          '  IMOVELXBEM IB, '+CR_LF+
          '  BEM B, '+CR_LF+
          '  GRUPO G '+CR_LF+
          'WHERE '+CR_LF+
          '  I.IDIMOVEL = IB.IDIMOVEL(+) AND '+CR_LF+
          '  IB.IDBEM = B.IDBEM(+) AND '+CR_LF+
          '  B.IDGRUPO = G.IDGRUPO(+) AND '+CR_LF+
          '  I.IDIMOVELMESTRE = IM.IDIMOVEL(+) ' +CR_LF+ sParam;

  Result := GetDataPacket( sSql );
end;

procedure TCtrlConsSaldoDiverg.PegaMovimentacao(idImovel, idBem: Integer;
  dDataIni, dDataFim: TDateTime; iIdContratoImovel: Integer);
var
  sSql: String;
begin
  if FCdsAux.Active then FCdsAux.Close;

  case Sistema.IdModulo of
//     54 : FCdsAux.Data := GetDataPacket(RetornaSQLSaldoInvestImob(idBem, idImovel, FPlano, dDataFim));
     64 : FCdsAux.Data := GetDataPacket(RetornaSQLSaldoAdminImob(iIdContratoImovel, dDataFim, dDataIni));
    135 : FCdsAux.Data := GetDataPacket(RetornaSQLSaldoAlienacao(iIdContratoImovel, dDataFim, dDataIni));
  end;

  FMovIdImovel := IdImovel;
  FMovIdBem := IdBem;
  FMovDtIni := dDataIni;
  FMovDtFim := dDataFim;
  FIdContratoImovel := iIdContratoImovel;
end;

function TCtrlConsSaldoDiverg.ListaSaldos(idImovel, idBem: Integer;
  dDataIni, dDataFim: TDateTime; iIdContratoImovel : Integer = -1): OleVariant;
var
  Cds: TCMClientDataSet;
  dSaldoAntOpe, dSaldoAntCont: Double;
  dSaldoOpe, dSaldoCont: Double;
begin
  if (FMovIdImovel <> IdImovel) or (FMovIdBem <> IdBem) or (FIdContratoIMovel <> iIdContratoImovel) or
     (FMovDtIni <> dDataIni) or (FMovDtFim <> dDataFim) or
     not(FCdsAux.Active) then
  begin
    PegaMovimentacao(idImovel, idBem, dDataIni, dDataFim, iIdContratoImovel);
  end;

  if FCdsSaldo.Active then FCdsSaldo.Close;

  FCdsSaldo.FieldDefs.Clear;
  FCdsSaldo.FieldDefs.Add('SaldoAntOpe', ftFloat);
  FCdsSaldo.FieldDefs.Add('SaldoAntCont', ftFloat);
  FCdsSaldo.FieldDefs.Add('SaldoOpe', ftFloat);
  FCdsSaldo.FieldDefs.Add('SaldoCont', ftFloat);

  FCdsSaldo.CreateDataSet;

  dSaldoAntOpe  := 0;
  dSaldoAntCont := 0;
  dSaldoOpe     := 0;
  dSaldoCont    := 0;

  if Sistema.IdModulo = 135 then
  begin

    dSaldoAntOpe  := GetSaldoContratoOperacional(iIdContratoImovel, dDataIni);
    dSaldoAntCont := GetSaldoContratoContabil(iIdContratoImovel, dDataIni);

    dSaldoOpe     := GetSaldoContratoOperacional(iIdContratoImovel, dDataFim);
    dSaldoCont    := GetSaldoContratoContabil(iIdContratoImovel, dDataFim);

  end
  else
  if Sistema.IdModulo = 64 then
  begin
    FCdsAux.First;
    while not(FCdsAux.Eof) do
    begin
      if FCdsAux.FieldByName('DATALANC').AsDateTime < dDataIni then
      begin
        if FCdsAux.FieldByName('RECPAG').AsString = 'P' then
        begin
          dSaldoAntOpe := dSaldoAntOpe -
                          FCdsAux.FieldByName('VLR_LANC_OPER_ANT').AsFloat +
                          FCdsAux.FieldByName('VLR_ALT_OPER_ANT').AsFloat;

          dSaldoAntCont := dSaldoAntCont -
                           FCdsAux.FieldByName('VLR_LANC_CONT_ANT').AsFloat +
                           FCdsAux.FieldByName('VLR_ALT_CONT_ANT').AsFloat;
        end
        else
        begin
          dSaldoAntOpe := dSaldoAntOpe +
                          FCdsAux.FieldByName('VLR_LANC_OPER_ANT').AsFloat +
                          FCdsAux.FieldByName('VLR_ALT_OPER_ANT').AsFloat;

          dSaldoAntCont := dSaldoAntCont +
                           FCdsAux.FieldByName('VLR_LANC_CONT_ANT').AsFloat +
                           FCdsAux.FieldByName('VLR_ALT_CONT_ANT').AsFloat;
        end;

      end;

      if FCdsAux.FieldByName('RECPAG').AsString = 'P' then
      begin
        dSaldoOpe := dSaldoOpe -
                     FCdsAux.FieldByName('VLR_LANC_OPER_ATU').AsFloat +
                     FCdsAux.FieldByName('VLR_ALT_OPER_ATU').AsFloat;

        dSaldoCont := dSaldoCont -
                      FCdsAux.FieldByName('VLR_LANC_CONT_ATU').AsFloat +
                      FCdsAux.FieldByName('VLR_ALT_CONT_ATU').AsFloat;
      end
      else
      begin
        dSaldoOpe := dSaldoOpe +
                     FCdsAux.FieldByName('VLR_LANC_OPER_ATU').AsFloat +
                     FCdsAux.FieldByName('VLR_ALT_OPER_ATU').AsFloat;

        dSaldoCont := dSaldoCont +
                      FCdsAux.FieldByName('VLR_LANC_CONT_ATU').AsFloat +
                      FCdsAux.FieldByName('VLR_ALT_CONT_ATU').AsFloat;
      end;

      FCdsAux.Next;
    end;
  end;

  FCdsSaldo.Insert;

  FCdsSaldo.FieldByName('SaldoAntOpe').AsFloat  := dSaldoAntOpe;
  FCdsSaldo.FieldByName('SaldoAntCont').AsFloat := dSaldoAntCont;
  FCdsSaldo.FieldByName('SaldoOpe').AsFloat     := dSaldoOpe;
  FCdsSaldo.FieldByName('SaldoCont').AsFloat    := dSaldoCont;

  FCdsSaldo.Post;

  Result := FCdsSaldo.Data;
end;

function TCtrlConsSaldoDiverg.ListaAlteradores(idImovel, idBem, iAno, iMes: Integer): OleVariant;
var
  sSql: String;
  dData1, dData2: TDateTime;
begin
  if iMes > 0 then begin
    dData1 := EncodeDate(iAno, iMes, 1) -1;
    dData2 := UltimoDiaMes( EncodeDate(iAno, iMes, 1) )
  end else begin
    dData1 := EncodeDate(iAno, 1, 1) - 1;
    dData2 := UltimoDiaMes( EncodeDate(iAno, 12, 1) );
  end;

  sSql := 'SELECT LD.DATALANCTO,' + CR_LF +
          '       TA.DESCRICAO,' + CR_LF +
          '       LD.CODALTERADOR,' + CR_LF +
          '       DECODE(LD.DEBCRE, ''P'', LD.VALOR, 0) AS VALOR_PAGA,' + CR_LF +
          '       DECODE(LD.DEBCRE, ''P'', 0, LD.VALOR) AS VALOR_RECEBE' + CR_LF +
          '  FROM LANCTODOCUM LD, TIPOALTERADOR TA' + CR_LF +
          ' WHERE (LD.CODALTERADOR = TA.CODALTERADOR)' + CR_LF +
          '   AND (LD.OPERACAO = 4)' + CR_LF +
          '   AND (LD.DATALANCTO > to_date('+QuotedStr(DateTimeToStr(dData1))+', ''DD/MM/YYYY''))' + CR_LF +
          '   AND (LD.DATALANCTO <= to_date('+QuotedStr(DateTimeToStr(dData2))+', ''DD/MM/YYYY''))' + CR_LF +
          '   AND LD.CODDOCUMENTO IN' + CR_LF +
          '       (SELECT CODDOCUMENTO FROM LANCAMENTOSIMOVEL' + CR_LF +
          '         WHERE CODDOCUMENTO IS NOT NULL' + CR_LF +
          '           AND PLNCODIGO IS NOT NULL' + CR_LF +
          '           AND IDMODULO = ' + IntToStr(Sistema.IdModulo) + CR_LF +
          '           AND DATALANCAMENTO > to_date('+QuotedStr(DateTimeToStr(dData1))+', ''DD/MM/YYYY'')' + CR_LF +
          '           AND DATALANCAMENTO <= to_date('+QuotedStr(DateTimeToStr(dData2))+', ''DD/MM/YYYY'')' + CR_LF +
          '           AND IDIMOVEL = ' + IntToStr(idImovel) + ')' + CR_LF +
          '   AND  LD.PLANCODIGO IS NOT NULL ' + CR_LF +
          ' ORDER BY LD.DATALANCTO';

  Result := GetDataPacket( sSql );
end;

function TCtrlConsSaldoDiverg.ListaDivergencia(idImovel, idBem: Integer;
  dDataIni, dDataFim: TDateTime; iIdContratoImovel : Integer = -1): OleVariant;
var
  Contador: Integer;
begin
  if (FMovIdImovel <> IdImovel) or (FMovIdBem <> IdBem) or (FIdContratoIMovel <> iIdContratoImovel) or
     (FMovDtIni <> dDataIni) or (FMovDtFim <> dDataFim) or
     not(FCdsAux.Active) then
  begin
    if iIdContratoImovel = -1 then
      PegaMovimentacao(idImovel, idBem, dDataIni, dDataFim)
    else
      PegaMovimentacao(-1, -1, dDataIni, dDataFim, iIdContratoImovel);
  end;

  if FCdsDivergencia.Active then FCdsDivergencia.Close;

  FCdsDivergencia.FieldDefs.Clear;
  FCdsDivergencia.FieldDefs.Add('DataLanc', FCdsAux.FieldByName('DATALANC').DataType, FCdsAux.FieldByName('DATALANC').Size);
  FCdsDivergencia.FieldDefs.Add('DataBaixa', FCdsAux.FieldByName('DATABAIXA').DataType, FCdsAux.FieldByName('DATABAIXA').Size);
  FCdsDivergencia.FieldDefs.Add('CodDocumento', FCdsAux.FieldByName('CODDOCUMENTO').DataType, FCdsAux.FieldByName('CODDOCUMENTO').Size);
  FCdsDivergencia.FieldDefs.Add('RECPAG', FCdsAux.FieldByName('RECPAG').DataType, FCdsAux.FieldByName('RECPAG').Size);
  FCdsDivergencia.FieldDefs.Add('VLR_LANC_OPER', FCdsAux.FieldByName('VLR_LANC_OPER_ATU').DataType, FCdsAux.FieldByName('VLR_LANC_OPER_ATU').Size);
  FCdsDivergencia.FieldDefs.Add('VLR_LANC_CONT', FCdsAux.FieldByName('VLR_LANC_CONT_ATU').DataType, FCdsAux.FieldByName('VLR_LANC_CONT_ATU').Size);
  FCdsDivergencia.FieldDefs.Add('VLR_ALT_OPER', FCdsAux.FieldByName('VLR_ALT_OPER_ATU').DataType, FCdsAux.FieldByName('VLR_ALT_OPER_ATU').Size);
  FCdsDivergencia.FieldDefs.Add('VLR_ALT_CONT', FCdsAux.FieldByName('VLR_ALT_CONT_ATU').DataType, FCdsAux.FieldByName('VLR_ALT_CONT_ATU').Size);
  FCdsDivergencia.FieldDefs.Add('VLR_BAIXA_OPER', FCdsAux.FieldByName('VLR_BAIXA_OPER_ATU').DataType, FCdsAux.FieldByName('VLR_BAIXA_OPER_ATU').Size);
  FCdsDivergencia.FieldDefs.Add('VLR_BAIXA_CONT', FCdsAux.FieldByName('VLR_BAIXA_CONT_ATU').DataType, FCdsAux.FieldByName('VLR_BAIXA_CONT_ATU').Size);

  FCdsDivergencia.CreateDataSet;

  FCdsAux.First;
  while not(FCdsAux.Eof) do
  begin
    if ( ( (FCdsAux.FieldByName('DATALANC').AsDateTime >= dDataIni) and (FCdsAux.FieldByName('DATALANC').AsDateTime <= dDataFim) ) or
         ( (FCdsAux.FieldByName('DATABAIXA').AsDateTime >= dDataIni) and (FCdsAux.FieldByName('DATABAIXA').AsDateTime <= dDataFim) )
        ) and (

       //(FCdsAux.FieldByName('VLR_LANC_OPER_ANT').AsFloat <> FCdsAux.FieldByName('VLR_LANC_CONT_ANT').AsFloat) or
       (FCdsAux.FieldByName('VLR_LANC_OPER_ATU').AsFloat <> FCdsAux.FieldByName('VLR_LANC_CONT_ATU').AsFloat) or

       //(FCdsAux.FieldByName('VLR_ALT_OPER_ANT').AsFloat <> FCdsAux.FieldByName('VLR_ALT_CONT_ANT').AsFloat) or
       (FCdsAux.FieldByName('VLR_ALT_OPER_ATU').AsFloat <> FCdsAux.FieldByName('VLR_ALT_CONT_ATU').AsFloat) or

       //(FCdsAux.FieldByName('VLR_BAIXA_OPER_ANT').AsFloat <> FCdsAux.FieldByName('VLR_BAIXA_CONT_ANT').AsFloat) or
       (FCdsAux.FieldByName('VLR_BAIXA_OPER_ATU').AsFloat <> FCdsAux.FieldByName('VLR_BAIXA_CONT_ATU').AsFloat) ) then
    begin
      FCdsDivergencia.Insert;

      FCdsDivergencia.FieldByName('DATALANC').Value         := FCdsAux.FieldByName('DATALANC').Value;
      FCdsDivergencia.FieldByName('DATABAIXA').Value        := FCdsAux.FieldByName('DATABAIXA').Value;
      FCdsDivergencia.FieldByName('CODDOCUMENTO').AsString  := FCdsAux.FieldByName('CODDOCUMENTO').AsString;
      FCdsDivergencia.FieldByName('RECPAG').AsString        := FCdsAux.FieldByName('RECPAG').AsString;

      FCdsDivergencia.FieldByName('VLR_LANC_OPER').AsFloat  := FCdsAux.FieldByName('VLR_LANC_OPER_ATU').AsFloat;
      FCdsDivergencia.FieldByName('VLR_LANC_CONT').AsFloat  := FCdsAux.FieldByName('VLR_LANC_CONT_ATU').AsFloat;
      FCdsDivergencia.FieldByName('VLR_ALT_OPER').AsFloat   := FCdsAux.FieldByName('VLR_ALT_OPER_ATU').AsFloat;
      FCdsDivergencia.FieldByName('VLR_ALT_CONT').AsFloat   := FCdsAux.FieldByName('VLR_ALT_CONT_ATU').AsFloat;
      FCdsDivergencia.FieldByName('VLR_BAIXA_OPER').AsFloat := FCdsAux.FieldByName('VLR_BAIXA_OPER_ATU').AsFloat;
      FCdsDivergencia.FieldByName('VLR_BAIXA_CONT').AsFloat := FCdsAux.FieldByName('VLR_BAIXA_CONT_ATU').AsFloat;

      FCdsDivergencia.Post;
    end;

    FCdsAux.Next;
  end;

  Result := FCdsDivergencia.Data;
end;

procedure TCtrlConsSaldoDiverg.SaveSQL(FileName, SQL: String);
var
  StringList: TStringList;
begin
  StringList := TStringList.Create;
  try
    StringList.Text := SQL;
    StringList.SaveToFile(Sistema.RetornaCaminhoArquivos(Sistema.IdEmpresa) + '\' + FileName);
  finally
    StringList.Free;
  end;
end;

function TCtrlConsSaldoDiverg.ListaContratos(iIdImovel, iIdImovelMestre: Integer;
  dDataIni, dDataFim: TDateTime; iIdContratoImovel: Integer; sCodTipImovel: String): OleVariant;
var
  sSQL : string;
begin
  AtualizaPlanoDepara_Imob;

  sSQL := 'select distinct IMO.IMOCODIGO,' +CR_LF+
          '       CIM.IDCONTRATOIMOVEL,' +CR_LF+
          '       CIM.CONNUMERO AS NUMERO_CONTRATO,' +CR_LF+
          '       CIM.CONNOME AS NOME_CONTRATO,' +CR_LF+
          '       PES1.NUMDOCUMENTO AS DOCUMENTO,' +CR_LF+
          '       PES1.NOME AS NOME_COMPRADOR,' +CR_LF+
          '       PES2.NOME AS NOME_RESPONSAVEL,' +CR_LF;

  if RegDiverg then
    sSQL := sSQL + '       ''S'' as DIVERGENCIA ' +CR_LF
  else
    case Sistema.IdModulo of
       64: sSQL := sSQL +
          '       PCK_IMO_DIVERGENCIA.FN_DVG_ADMINIMOB(' + IntToStr(Sistema.IdEmpresa) + ',' + CR_LF +
          '                                            CIM.IDCONTRATOIMOVEL,' + CR_LF +
          '                                            to_date(' + QuotedStr(DateToStr(dDataIni)) + ', ''DD/MM/YYYY''),' + CR_LF +
          '                                            to_date(' + QuotedStr(DateToStr(dDataFim)) + ', ''DD/MM/YYYY'')) as DIVERGENCIA' + CR_LF;

      135: sSQL := sSQL +
          '       PCK_IMO_DIVERGENCIA.FN_DVG_ALIENACAO(' + IntToStr(Sistema.IdEmpresa) + ',' + CR_LF +
          '                                            CIM.IDCONTRATOIMOVEL,' + CR_LF +
          '                                            to_date(' + QuotedStr(DateToStr(dDataIni)) + ', ''DD/MM/YYYY''),' + CR_LF +
          '                                            to_date(' + QuotedStr(DateToStr(dDataFim)) + ', ''DD/MM/YYYY'')) as DIVERGENCIA' + CR_LF;
    end;


  sSQL := sSQL +
          '  from CONTRATOIMOVEL CIM,' +CR_LF+
          '       CONTRATOXIMOVEL CXI,' +CR_LF+
          '       IMOVEL IMO,' +CR_LF+
          '       PESSOA PES1,' +CR_LF+
          '       PESSOA PES2,' +CR_LF+
          '       LOCATARIO LOC' +CR_LF;

  sSQL := sSQL +
          ' where PES2.IDPESSOA(+) = CIM.IDRESPONSAVEL' +CR_LF+
          '   and LOC.IDLOCATARIO = CIM.IDLOCATARIO' +CR_LF+
          '   and PES1.IDPESSOA = LOC.IDLOCATARIO' +CR_LF+
          '   and CXI.IDCONTRATOIMOVEL = CIM.IDCONTRATOIMOVEL' +CR_LF+
          '   and IMO.IDIMOVEL = CXI.IDIMOVEL' +CR_LF;

  case Sistema.IdModulo of
     64: sSQL := sSQL + '   and CIM.FLGTIPOCONTRATO in (''L'', ''D'')' +CR_LF;
    135: sSQL := sSQL + '   and CIM.FLGTIPOCONTRATO = ''C''' +CR_LF
  end;

  if iIdImovelMestre <> -1 then
    sSQL := sSQL + '   and CXI.IDIMOVEL in (select IDIMOVEL from IMOVEL where IDIMOVELMESTRE = ' + IntToStr(iIdImovelMestre)+')' +CR_LF;

  if iIdImovel <> -1 then
    sSQL := sSQL + '   and CXI.IDIMOVEL = ' + IntToStr(iIdImovel) +CR_LF;

  if iIdContratoImovel <> -1 then
    sSQL := sSQL + '   and CIM.IDCONTRATOIMOVEL = ' + IntToStr(iIdContratoImovel) +CR_LF;

  if sCodTipImovel <> '' then
    sSQL := sSQL + '   and CXI.IDIMOVEL in (select IDIMOVEL from IMOVEL where CODTIPIMOVEL = ' + QuotedStr(sCodTipImovel) + ')' +CR_LF;


  case Sistema.IdModulo of
     64: sSQL := sSQL +
          '   and ((CIM.CONDATAINICIO <= ' + QuotedStr(DateToStr(dDataFim)) + ') or' +CR_LF+
          '        ((select min(RP.DATABAIXA)' +CR_LF+
          '             from LANCAMENTOSIMOVEL LI, RECBTOPAGTO RP' +CR_LF+
          '            where RP.CODDOCUMENTO = LI.CODDOCUMENTO' +CR_LF+
          '              and LI.IDCONTRATOIMOVEL = CIM.IDCONTRATOIMOVEL) <= ' + QuotedStr(DateToStr(dDataFim)) + '))' +CR_LF;
          
    135: sSQL := sSQL +
          '   and ((CIM.CONDATAASSINATURA <= ' + QuotedStr(DateToStr(dDataFim)) + ') or' +CR_LF+
          '        ((select min(RP.DATABAIXA)' +CR_LF+
          '             from PARCFINANCIMOV PF, CONDPAGIMOVEL CP, RECBTOPAGTO RP' +CR_LF+
          '            where CP.IDCONDPAGIMOVEL = PF.IDCONDPAGIMOVEL' +CR_LF+
          '              and PF.CODDOCUMENTO = RP.CODDOCUMENTO' +CR_LF+
          '              and CP.IDCONTRATOIMOVEL = CIM.IDCONTRATOIMOVEL) <= ' + QuotedStr(DateToStr(dDataFim)) + '))' +CR_LF;
  end;

  if RegDiverg then
    case Sistema.IdModulo of
       64: sSQL := sSQL +
          '   and PCK_IMO_DIVERGENCIA.FN_DVG_ADMINIMOB(' + IntToStr(Sistema.IdEmpresa) + ',' + CR_LF +
          '                                            CIM.IDCONTRATOIMOVEL,' + CR_LF +
          '                                            to_date(' + QuotedStr(DateToStr(dDataIni)) + ', ''DD/MM/YYYY''),' + CR_LF +
          '                                            to_date(' + QuotedStr(DateToStr(dDataFim)) + ', ''DD/MM/YYYY'')) = ''S''' + CR_LF;

      135: sSQL := sSQL +
          '   and PCK_IMO_DIVERGENCIA.FN_DVG_ALIENACAO(' + IntToStr(Sistema.IdEmpresa) + ',' + CR_LF +
          '                                            CIM.IDCONTRATOIMOVEL,' + CR_LF +
          '                                            to_date(' + QuotedStr(DateToStr(dDataIni)) + ', ''DD/MM/YYYY''),' + CR_LF +
          '                                            to_date(' + QuotedStr(DateToStr(dDataFim)) + ', ''DD/MM/YYYY'')) = ''S''' + CR_LF;
    end;
  
  sSQL := sSQL +
          ' order by CIM.CONNUMERO, IMO.IMOCODIGO';

  SaveSQL('ListaContratos.sql', sSQL);

  Result := GetDataPacket(sSQL);
end;

function TCtrlConsSaldoDiverg.RetornaSQLSaldoInvestImob(iIdBem,
  iIdImovel, iPlano: Integer; dData: TDateTime): string;
begin
  Result := 'SELECT' + CR_LF +
            '  VW.IDIMOVEL,' + CR_LF +
            '  VW.IMOCODIGO,' + CR_LF +
            '  VW.IDMODULO,' + CR_LF +
            '  VW.DATAMOV,' + CR_LF +
            '  VW.NUMEROMOV,' + CR_LF +
            '  VW.DESCMOV,' + CR_LF +
            '  VW.RECPAG,' + CR_LF +
            // Valor Lançamento Operacional
            '  VW.VALOR_LANC_OPER,' + CR_LF +
            // Valor Total Operacional
            '  VW.VALOR_TOTAL_OPER,' + CR_LF +
            // Valor Lançamento Contabil
            '  PL.LACVALOR * (VW.VALOR_LANC_OPER / VW.VALOR_TOTAL_OPER) AS VALOR_LANC_CONTAB,' + CR_LF +
            // Valor Total Contabil
            '  PL.LACVALOR AS VALOR_TOTAL_CONTAB' + CR_LF +
            'FROM' + CR_LF +

            '  (SELECT IB.IDIMOVEL,' + CR_LF +
            '          H.IDBEM,' + CR_LF +
            '          I.IMOCODIGO,' + CR_LF +
            '          H.PLNCODIGO,' + CR_LF +
            '          H.IDMODULO,' + CR_LF +
            '          H.DATAMOVIMENTACAO AS DATAMOV,' + CR_LF +
            '          T.DESCTIPOMOVIMENTACAO AS DESCMOV,' + CR_LF +
            '          H.IDMOVIMENTACAO AS NUMEROMOV,' + CR_LF +
            '          DECODE(SIGN(V.VALOR), -1, ''D'', ''C'') AS RECPAG,' + CR_LF +
            '          V.VALOR AS VALOR_LANC_OPER,' + CR_LF +
            '          (SELECT SUM(V1.VALOR) FROM VLRHISTMOVBEM V1, HISTORICOMOVIMENTACAO H1' + CR_LF +
            '            WHERE H1.IDMOVIMENTACAO = V1.IDMOVIMENTACAO' + CR_LF +
            '              AND H1.PLNCODIGO = H.PLNCODIGO) AS VALOR_TOTAL_OPER' + CR_LF +
            '     FROM HISTORICOMOVIMENTACAO H,' + CR_LF +
            '          TIPOMOVIMENTACAO      T,' + CR_LF +
            '          VLRHISTMOVBEM         V,' + CR_LF +
            '          IMOVELXBEM            IB,' + CR_LF +
            '          IMOVEL                I' + CR_LF +
            '    WHERE H.IDBEM = ' + IntToStr(iIdBem) + CR_LF +
            '      AND H.IDTIPOMOVIMENTACAO = T.IDTIPOMOVIMENTACAO' + CR_LF +
            '      AND H.PLNCODIGO IS NOT NULL' + CR_LF +
            '      AND H.IDMOVIMENTACAO = V.IDMOVIMENTACAO' + CR_LF +
            '      AND IB.IDBEM = H.IDBEM' + CR_LF +
            '      AND I.IDIMOVEL = IB.IDIMOVEL' + CR_LF +
            '      AND H.DATAMOVIMENTACAO <= to_date('+QuotedStr(DateTimeToStr(dData))+',''DD/MM/YYYY'')' + CR_LF +
            '      AND H.IDMODULO = ' + IntToStr(Sistema.IdModulo) + CR_LF +

            '   UNION ALL' + CR_LF +

            '   SELECT CO.IDIMOVEL,' + CR_LF +
            '          NULL AS IDBEM,' + CR_LF +
            '          I.IMOCODIGO,' + CR_LF +
            '          CL.PLNCODIGO,' + CR_LF +
            '          LI.IDMODULO,' + CR_LF +
            '          CL.DTALANCAMENTO AS DATAMOV,' + CR_LF +
            '          CE.DESCOBRATIPOETAPA AS DESCMOV,' + CR_LF +
            '          LI.NODOCUMENTO AS NUMEROMOV,' + CR_LF +
            '          LI.RECPAG,' + CR_LF +
            '          CL.VALOFI AS VALOR_LANC_OPER,' + CR_LF +
            '          (SELECT SUM(VALOFI) FROM CAFOBRALANC' + CR_LF +
            '             WHERE PLNCODIGO = CL.PLNCODIGO) AS VALOR_TOTAL_OPER' + CR_LF +
            '     FROM CAFOBRALANC       CL,' + CR_LF +
            '          CAFOBRA           CO,' + CR_LF +
            '          LANCAMENTOSIMOVEL LI,' + CR_LF +
            '          CAFOBRATIPOETAPA  CE,' + CR_LF +
            '          IMOVEL            I' + CR_LF +
            '    WHERE CL.IDCAFOBRA = CO.IDCAFOBRA' + CR_LF +
            '      AND LI.IDLANCIMOVEL = CL.IDLANCIMOVEL' + CR_LF +
            '      AND CE.IDOBRATIPOETAPA = CL.IDOBRATIPOETAPA' + CR_LF +
            '      AND I.IDIMOVEL = LI.IDIMOVEL' + CR_LF +
            '      AND CL.DTALANCAMENTO <= to_date('+QuotedStr(DateTimeToStr(dData))+',''DD/MM/YYYY'')' + CR_LF +
            '      AND LI.IDMODULO = ' + IntToStr(Sistema.IdModulo) + CR_LF +
            '      AND CO.IDIMOVEL = ' + IntToStr(iIdImovel) + ') VW,' + CR_LF +

            '  (SELECT L.PLNCODIGO, SUM(L.LACVALOR) AS LACVALOR' + CR_LF +
            '   FROM LANCAMENTO L,' + CR_LF +
            '       (SELECT PLANO1 AS PLANODE,   CONTA1 AS CONTADE,' + CR_LF +
            '               PLANO2 AS PLANOPARA, CONTA2 AS CONTAPARA' + CR_LF +
            //'        FROM '+sDePara+' ) DP' + CR_LF +
            '        FROM '+MontaPlanoContas+' ) DP' + CR_LF +
            '   WHERE L.PLANO = DP.PLANODE(+)' + CR_LF +
            '     AND L.PLACONTA = DP.CONTADE(+)' + CR_LF +
            '     AND L.LACDEBCRE = ''C''' + CR_LF +
            '     AND NVL(DP.CONTAPARA,L.PLACONTA) NOT IN (SELECT CONTADEBCRE FROM PADRLANCIMOVEL' + CR_LF +
            '                                              WHERE PLANO = ' + IntToStr(iPlano) + CR_LF +
            '                                                AND CONTADEBCRE IS NOT NULL' + CR_LF +
            '                                                AND IDTIPOCUSTORECIMO IN (SELECT IDOPERCONTAB FROM TIPOCUSTORECIMOV' + CR_LF +
            '                                                                           WHERE IDOPERCONTAB IS NOT NULL)' + CR_LF +
            '                                              UNION' + CR_LF +
            '                                              SELECT CONTARESULT FROM PADRLANCIMOVEL' + CR_LF +
            '                                              WHERE PLANO = ' + IntToStr(iPlano) + CR_LF +
            '                                                AND CONTARESULT IS NOT NULL' + CR_LF +
            '                                                AND IDTIPOCUSTORECIMO IN (SELECT IDOPERCONTAB FROM TIPOCUSTORECIMOV' + CR_LF +
            '                                                                           WHERE IDOPERCONTAB IS NOT NULL) )' + CR_LF +
            '   GROUP BY L.PLNCODIGO' + CR_LF +
            '   ) PL' + CR_LF +
            'WHERE VW.PLNCODIGO = PL.PLNCODIGO' + CR_LF +
            '  AND VW.DATAMOV <= to_date('+QuotedStr(DateTimeToStr(dData))+',''DD/MM/YYYY'')' + CR_LF +
            '  AND VW.IDMODULO = ' + IntToStr(Sistema.IdModulo) + CR_LF +
            '  AND VW.IDIMOVEL = ' + IntToStr(iIdImovel) + CR_LF +
            'ORDER BY VW.DATAMOV, VW.DESCMOV';

end;

function TCtrlConsSaldoDiverg.MontaPlanoContas: string;
const
  cDePara = '( SELECT A.PLANO1, A.CONTA1, NVL(B.PLANO2, A.PLANO2) AS PLANO2, NVL(B.CONTA2, A.CONTA2) AS CONTA2' + CR_LF +
            '<1><i>  FROM <PLANODEPARA1> A,' + CR_LF +
            '<1><i>       PLANODEPARA B' + CR_LF +
            '<1><i>  WHERE A.PLANO2 = B.PLANO1(+) AND A.CONTA2 = B.CONTA1(+) )';
var
  _cds : TCMClientDataSet;
  i : Integer;
  sDePara, sIdent : string;
begin
  _cds := TCMClientDataSet.Create(nil);
  sIdent := '';
  sDePara := '';
  i := 1;
  try
    // Verificando a quantidade de De/Para
    _cds.Data := GetDataPacket('SELECT DISTINCT PLANO1, PLANO2 FROM PLANODEPARA');
    _cds.First;
    while not(_cds.Eof) do begin
      if i = _cds.RecordCount then
        sDePara := StringReplace(sDePara, '<PLANODEPARA1>', 'PLANODEPARA', [])
      else begin
        sIdent := sIdent + '<i>';
        if i = 1 then
          sDePara := cDePara
        else
          sDePara := StringReplace(sDePara, '<PLANODEPARA1>', StringReplace(StringReplace(cDePara,'<1>','',[rfReplaceAll]),'<i>',sIdent,[rfReplaceAll]), []);
      end;
      _cds.Next;
      Inc(i);
    end;
    sDePara := StringReplace(sDePara, '<i>', '      ', [rfReplaceAll]);
    sDePara := StringReplace(sDePara, '<1>', '             ', [rfReplaceAll]);
    Result := sDePara;
  finally
    _cds.Free;
  end;
end;

function TCtrlConsSaldoDiverg.RetornaPlanoCorrente: Integer;
var
  _cdsPlano : TCMClientDataSet;
begin
  _cdsPlano := TCMClientDataSet.Create(nil);
  try
    _cdsPlano.Data := GetDataPacket('SELECT PLANO FROM PARAMCONTAB WHERE IDPESSOA = ' + IntToStr(Sistema.IdEmpresa));
    Result := _cdsPlano.FieldByName('PLANO').asInteger
  finally
    _cdsPlano.Free;
  end;
end;


function TCtrlConsSaldoDiverg.PegarContasContabeis(
  iIdContratoImovel: Integer; dDataAssinatura,
  dDataFim: TDateTime): String;
var
  sSQL : string;
  _cds : TCMClientDataSet;
  sParam, sParam2 : string;
begin
  Result := '';
  _cds := TCMClientDataSet.Create(nil);

//  if Sistema.IdModulo = 135 then
//  begin
//    sParam := 'PARCFINANCIMOV PAR, CONDPAGIMOVEL  COD, ';
//    sParam2 := '   AND ((TO_CHAR(PAR.CODDOCUMENTO) = LAC.LACNUMDOC)                   '+CR_LF+
//               '         OR (LAC.CODDOCUMENTO = PAR.CODDOCUMENTO))                    '+CR_LF+
//               '   AND PAR.PLNCODIGO = PLN.PLNCODIGO                                  '+CR_LF+
//               '   AND COD.IDCONDPAGIMOVEL = PAR.IDCONDPAGIMOVEL                      '+CR_LF+
//               '   AND CON.IDCONTRATOIMOVEL = COD.IDCONTRATOIMOVEL                    ';
//  end
//  else
//  begin
//    sParam  := ' LANCAMENTOSIMOVEL LI,                                               '+CR_LF+
//               ' TIPOCUSTORECIMOV  TC,                                               '+CR_LF+
//               ' PADRLANCIMOVEL    PAD,                                              ';
//
//    sParam2 := '   AND ((TO_CHAR(LI.CODDOCUMENTO) = LAC.LACNUMDOC)                   '+CR_LF+
//               '         OR (LAC.CODDOCUMENTO = LI.CODDOCUMENTO))                    '+CR_LF+
//               '   AND LI.PLNCODIGO = PLN.PLNCODIGO                                  '+CR_LF+
//               '   AND LI.FLGTIPOLANCAMENTO = ''A''                                  '+CR_LF+
//               '   AND CON.IDCONTRATOIMOVEL = LI.IDCONTRATOIMOVEL                    '+CR_LF+
//               '   AND TC.IDTIPOCUSTORECIMO = CON.IDTIPOCUSTORECIMO                  '+CR_LF+
//               '   AND PAD.IDTIPOCUSTORECIMO = TC.IDTIPOCUSTORECIMO                  '+CR_LF+
//               '   AND PAD.CONTADEBCRE  = PLA.PLACONTA                               ';
//  end;

  try
//    sSQL := 'SELECT DISTINCT NVL(DP.CONTA2, PLA.PLACONTA) AS PLACONTA              '+CR_LF+
//            '  FROM LANCAMENTO     LAC,                                            '+CR_LF+
//            '       PLANILHA       PLN,                                            '+CR_LF+
//                    sParam                                                          +CR_LF+
//            '       CONTRATOIMOVEL CON,                                            '+CR_LF+
//            '       PLANOCONTA     PLA,                                            '+CR_LF+
//            '       PLANODEPARA    DP                                              ';
//
//            if iIdContratoImovel <> -1 then
//              sSQL := sSQL + ' WHERE CON.IDCONTRATOIMOVEL = ' + IntToStr(iIdContratoImovel) +CR_LF+
//                             '   AND LAC.PLNCODIGO = PLN.PLNCODIGO                         '+CR_LF
//            else
//              sSQL := sSQL + 'WHERE LAC.PLNCODIGO = PLN.PLNCODIGO ';
//
//            sSQL := sSQL +
//            '   AND LAC.PLNCODIGO = PLN.PLNCODIGO                                  '+CR_LF+
//            '   AND PLN.PLNDATDIA >= '+ QuotedStr(DateToStr(dDataAssinatura))       +CR_LF+
//            '   AND PLN.PLNDATDIA <= '+ QuotedStr(DateToStr(dDataFim))              +CR_LF+
//                sParam2                                                             +CR_LF+
//            '   AND LAC.PLANO = DP.PLANO1(+)                                       '+CR_LF+
//            '   AND LAC.PLACONTA = DP.CONTA1(+)                                    '+CR_LF+
//            '   AND PLA.PLANO = NVL(DP.PLANO2, LAC.PLANO)                          '+CR_LF+
//            '   AND PLA.PLACONTA = NVL(DP.CONTA2, LAC.PLACONTA)                    ';

//    sSQL := 'select distinct CONTADEBCRE as PLACONTA' + CR_LF +
//            '  from PADRLANCIMOVEL' + CR_LF +
//            ' where PLACONTAANT is not null' + CR_LF +
//            '   and IDMODULO = ' + IntToStr(Sistema.IdModulo);

    sSQL := 'select distinct CONTARESULT as PLACONTA' + CR_LF +
            '  from PADRLANCIMOVEL' + CR_LF +
            ' where RECPAG = ''R''' + CR_LF +
            '   and IDPESSOA = ' + IntToStr(Sistema.IdEmpresa) + CR_LF +
            '   and IDMODULO = ' + IntToStr(Sistema.IdModulo);

    SaveSQL('PegarContasContabeis.sql', sSQL);

    _cds.Data := GetDataPacket(sSQL);

    while not _cds.Eof do
    begin
     if Result = '' then
      Result := QuotedStr(CompletaFim(_cds.FieldByName('PLACONTA').asString, ' ', 18))
     else
      Result := Result + ',' + QuotedStr(CompletaFim(_cds.FieldByName('PLACONTA').asString, ' ', 18));
      _cds.Next;
    end;
  finally
    FreeAndNil(_cds);
  end;
end;

function TCtrlConsSaldoDiverg.PegaDataAssinatura(
  iIdContratoImovel: Integer): TDateTime;
var
  _cds : TCMClientDataSet;
begin
  _cds := TCMClientDataSet.Create(nil);
  try
    _cds.Data := GetDataPacket('SELECT CONDATAASSINATURA FROM CONTRATOIMOVEL ' +CR_LF+
                                ' WHERE IDCONTRATOIMOVEL = ' + IntToStr(iIdContratoImovel));
    if not _cds.IsEmpty then
      Result := _cds.FieldByName('CONDATAASSINATURA').asDateTime
    else
      Result := EncodeDate(Year(Now), 1, 1);
  finally
    FreeAndNil(_cds);
  end;

end;

function TCtrlConsSaldoDiverg.PegaDataInicioContratoAluguel(
  iIdContratoImovel: Integer): TDateTime;
var
  _cds : TCMClientDataSet;
begin
  _cds := TCMClientDataSet.Create(nil);
  try
    _cds.Data := GetDataPacket('SELECT CONDATAINICIO FROM CONTRATOIMOVEL ' +CR_LF+
                                ' WHERE IDCONTRATOIMOVEL = ' + IntToStr(iIdContratoImovel));
    if not _cds.IsEmpty then
      Result := _cds.FieldByName('CONDATAINICIO').asDateTime
    else
      Result := EncodeDate(Year(Now), 1, 1);
  finally
    FreeAndNil(_cds);
  end;

end;

function TCtrlConsSaldoDiverg.ListaAlteradoresDoc(iCodDocumento, iIdContratoImovel: Integer): OleVariant;
begin
  if (Sistema.IdModulo = 64) and (iIdContratoImovel <> -1) then
    Result := GetDataPacket('select LD.DATALANCTO, LD.CODDOCUMENTO, LD.CODALTERADOR, TA.DESCRICAO, LD.DEBCRE, round((LD.VALOR * LI.VLRPERC),2) as VALOR' + CR_LF +
                            '  from LANCTODOCUM LD,' + CR_LF +
                            '       TIPOALTERADOR TA,' + CR_LF +
                            '       (select sum(decode(LI.RECPAG, ''P'', LI.VLRLANCPAGAR, LI.VLRLANCRECEB)) /' + CR_LF +
                            '               (select sum(decode(RECPAG, ''P'', VLRLANCPAGAR, VLRLANCRECEB))' + CR_LF +
                            '                  from LANCAMENTOSIMOVEL' + CR_LF +
                            '                 where IDDOCUMENTO = LI.IDDOCUMENTO) as VLRPERC' + CR_LF +
                            '          from LANCAMENTOSIMOVEL LI' + CR_LF +
                            '         where LI.IDCONTRATOIMOVEL = ' + IntToStr(iIdContratoImovel) + CR_LF +
                            '           and LI.IDDOCUMENTO = ' + IntToStr(iCodDocumento) + CR_LF +
                            '         group by LI.IDDOCUMENTO) LI' + CR_LF +
                            ' where LD.CODALTERADOR = TA.CODALTERADOR' + CR_LF +
                            '   and LD.OPERACAO = 4' + CR_LF +
                            '   and LD.PLNCODIGO IS NOT NULL' + CR_LF +  //André Oliveira  SOL107772/5704 KIN 1360314
                            '   and LD.CODDOCUMENTO = ' + IntToStr(iCodDocumento) + CR_LF +
                            ' order by LD.DATALANCTO')
  else
    Result := GetDataPacket('select LD.DATALANCTO,' + CR_LF +
                            '       LD.CODDOCUMENTO,' + CR_LF +
                            '       LD.CODALTERADOR,' + CR_LF +
                            '       TA.DESCRICAO,' + CR_LF +
                            '       LD.DEBCRE,' + CR_LF +
                            '       LD.VALOR' + CR_LF +
                            '  from LANCTODOCUM LD, TIPOALTERADOR TA' + CR_LF +
                            ' where LD.CODALTERADOR = TA.CODALTERADOR' + CR_LF +
                            '   and LD.OPERACAO = 4' + CR_LF +
                            '   and LD.CODDOCUMENTO = ' + IntToStr(iCodDocumento) + CR_LF +
                            '   and LD.PLNCODIGO IS NOT NULL' + CR_LF + //André Oliveira  SOL107772/5704 KIN 1360314
                            ' order by LD.DATALANCTO');
end;

function TCtrlConsSaldoDiverg.GetSaldoContratoOperacional(iIdContratoImovel: Integer; dData: TDateTime): Double;
var
  Cds: TCMClientDataSet;
  sSQL: String;
begin
  Cds := TCMClientDataSet.Create(nil);
  Result := 0;
  try
    sSQL := 'select PCK_IMO_DIVERGENCIA.FN_SLD_CONTRATO_OPER(' +
            IntToStr(iIdContratoImovel) + ', ' +
            'to_date(' + QuotedStr(FormatDateTime('DD/MM/YYYY', dData)) + ', ''DD/MM/YYYY'')) from DUAL';

    Cds.Data := GetDataPacket(sSQL);
    Result := Cds.Fields[0].AsFloat;
    Cds.Close;
  finally
    FreeAndNil(Cds);
  end;
end;

function TCtrlConsSaldoDiverg.GetSaldoContratoContabil(iIdContratoImovel: Integer; dData: TDateTime): Double;
var
  Cds: TCMClientDataSet;
  sSQL: String;
begin
  Cds := TCMClientDataSet.Create(nil);
  Result := 0;
  try
    sSQL := 'select PCK_IMO_DIVERGENCIA.FN_SLD_CONTRATO_CONT(' +
            IntToStr(Sistema.IdEmpresa) + ', ' +
            IntToStr(iIdContratoImovel) + ', ' +
            'to_date(' + QuotedStr(FormatDateTime('DD/MM/YYYY', dData)) + ', ''DD/MM/YYYY'')) from DUAL';

    Cds.Data := GetDataPacket( sSQL );
    Result := Cds.Fields[0].AsFloat;
    Cds.Close;
  finally
    FreeAndNil(Cds);
  end;
end;

function TCtrlConsSaldoDiverg.RetornaSQLSaldoAlienacao(iIdContratoImovel: Integer;
  dDataFinal, dDataInicio: TDateTime): string;
var
  sSQL: String;
begin
  // Para diferenciar o tipo do lançamento na planilha, foi acordado de colocar
  // no campo LacNumDoc da tabela LANCAMENTO o código do documento antecedido com
  // o tipo do lançamento, sendo:
  // L - Lançamento   Ex.: L1447646
  // A - Alterador    Ex.: A1447646
  // B - Baixa        Ex.: B1447646

  AtualizaPlanoDepara_Imob;

  sSQL := 'select CODDOCUMENTO,' + CR_LF +
          '       RECPAG,' + CR_LF +
          '       DATALANC,' + CR_LF +
          '       DATABAIXA,' + CR_LF +
          '       DESCRICAO,' + CR_LF +
          '       VLR_LANC_OPER_ANT,' + CR_LF +
          '       VLR_LANC_OPER_ANT + VLR_LANC_OPER_ATU as VLR_LANC_OPER_ATU,' + CR_LF +
          '       VLR_LANC_CONT_ANT,' + CR_LF +
          '       VLR_LANC_CONT_ANT + VLR_LANC_CONT_ATU as VLR_LANC_CONT_ATU,' + CR_LF +
          '       VLR_ALT_OPER_ANT,' + CR_LF +
          '       VLR_ALT_OPER_ANT + VLR_ALT_OPER_ATU as VLR_ALT_OPER_ATU,' + CR_LF +
          '       VLR_ALT_CONT_ANT,' + CR_LF +
          '       VLR_ALT_CONT_ANT + VLR_ALT_CONT_ATU as VLR_ALT_CONT_ATU,' + CR_LF +
          '       VLR_BAIXA_OPER_ANT,' + CR_LF +
          '       VLR_BAIXA_OPER_ANT + VLR_BAIXA_OPER_ATU as VLR_BAIXA_OPER_ATU,' + CR_LF +
          '       VLR_BAIXA_CONT_ANT,' + CR_LF +
          '       VLR_BAIXA_CONT_ANT + VLR_BAIXA_CONT_ATU as VLR_BAIXA_CONT_ATU' + CR_LF +
          '  from (' + CR_LF +

          'select CI.IDCONTRATOIMOVEL,' + CR_LF +
          '       PF.CODDOCUMENTO,' + CR_LF +
          '       PCK_IMO_DIVERGENCIA.FN_RECPAG(PF.CODDOCUMENTO) as RECPAG,' + CR_LF +
          '       PF.DATAVENCIMENTO as DATALANC,' + CR_LF +

          '       PCK_IMO_DIVERGENCIA.FN_DATABAIXA(PF.CODDOCUMENTO, ' + CR_LF +
          '                                        to_date('+QuotedStr(DateToStr(dDataFinal))+', ''DD/MM/YYYY'')) as DATABAIXA,' + CR_LF +

          '       PCK_IMO_DIVERGENCIA.FN_DESCRICAO(PF.PLNCODIGO, ' + CR_LF +
          '                                        PF.CODDOCUMENTO) as DESCRICAO,' + CR_LF +

          '       PCK_IMO_DIVERGENCIA.FN_VLR_LANC_OPER(PF.CODDOCUMENTO,' + CR_LF +
          '                                            null,' + CR_LF +
          '                                            to_date('+QuotedStr(DateToStr(dDataInicio))+', ''DD/MM/YYYY''),' + CR_LF +
          '                                            1) as VLR_LANC_OPER_ANT,' + CR_LF +

          '       PCK_IMO_DIVERGENCIA.FN_VLR_LANC_OPER(PF.CODDOCUMENTO,' + CR_LF +
          '                                            to_date('+QuotedStr(DateToStr(dDataInicio))+', ''DD/MM/YYYY''),' + CR_LF +
          '                                            to_date('+QuotedStr(DateToStr(dDataFinal))+', ''DD/MM/YYYY''),' + CR_LF +
          '                                            1) as VLR_LANC_OPER_ATU,' + CR_LF +

          '       PCK_IMO_DIVERGENCIA.FN_VLR_LANC_CONT('+IntToStr(Sistema.IdEmpresa)+',' + CR_LF +
          '                                            PF.CODDOCUMENTO,' + CR_LF +
          '                                            null,' + CR_LF +
          '                                            to_date('+QuotedStr(DateToStr(dDataInicio))+', ''DD/MM/YYYY''),' + CR_LF +
          '                                            1) as VLR_LANC_CONT_ANT,' + CR_LF +

          '       PCK_IMO_DIVERGENCIA.FN_VLR_LANC_CONT('+IntToStr(Sistema.IdEmpresa)+',' + CR_LF +
          '                                            PF.CODDOCUMENTO,' + CR_LF +
          '                                            to_date('+QuotedStr(DateToStr(dDataInicio))+', ''DD/MM/YYYY''),' + CR_LF +
          '                                            to_date('+QuotedStr(DateToStr(dDataFinal))+', ''DD/MM/YYYY''),' + CR_LF +
          '                                            1) as VLR_LANC_CONT_ATU,' + CR_LF +

          '       PCK_IMO_DIVERGENCIA.FN_VLR_ALT_OPER(PF.CODDOCUMENTO,' + CR_LF +
          '                                           null,' + CR_LF +
          '                                           to_date('+QuotedStr(DateToStr(dDataInicio))+', ''DD/MM/YYYY''),' + CR_LF +
          '                                           1) as VLR_ALT_OPER_ANT,' + CR_LF +

          '       PCK_IMO_DIVERGENCIA.FN_VLR_ALT_OPER(PF.CODDOCUMENTO,' + CR_LF +
          '                                           to_date('+QuotedStr(DateToStr(dDataInicio))+', ''DD/MM/YYYY''),' + CR_LF +
          '                                           to_date('+QuotedStr(DateToStr(dDataFinal))+', ''DD/MM/YYYY''),' + CR_LF +
          '                                           1) as VLR_ALT_OPER_ATU,' + CR_LF +

          '       PCK_IMO_DIVERGENCIA.FN_VLR_ALT_CONT('+IntToStr(Sistema.IdEmpresa)+',' + CR_LF +
          '                                           PF.CODDOCUMENTO,' + CR_LF +
          '                                           null,' + CR_LF +
          '                                           to_date('+QuotedStr(DateToStr(dDataInicio))+', ''DD/MM/YYYY''),' + CR_LF +
          '                                           1) as VLR_ALT_CONT_ANT,' + CR_LF +

          '       PCK_IMO_DIVERGENCIA.FN_VLR_ALT_CONT('+IntToStr(Sistema.IdEmpresa)+',' + CR_LF +
          '                                           PF.CODDOCUMENTO,' + CR_LF +
          '                                           to_date('+QuotedStr(DateToStr(dDataInicio))+', ''DD/MM/YYYY''),' + CR_LF +
          '                                           to_date('+QuotedStr(DateToStr(dDataFinal))+', ''DD/MM/YYYY''),' + CR_LF +
          '                                           1) as VLR_ALT_CONT_ATU,' + CR_LF +

          '       PCK_IMO_DIVERGENCIA.FN_VLR_BAIXA_OPER(PF.CODDOCUMENTO,' + CR_LF +
          '                                             null,' + CR_LF +
          '                                             to_date('+QuotedStr(DateToStr(dDataInicio))+', ''DD/MM/YYYY''),' + CR_LF +
          '                                             1) as VLR_BAIXA_OPER_ANT,' + CR_LF +

          '       PCK_IMO_DIVERGENCIA.FN_VLR_BAIXA_OPER(PF.CODDOCUMENTO,' + CR_LF +
          '                                             to_date('+QuotedStr(DateToStr(dDataInicio))+', ''DD/MM/YYYY''),' + CR_LF +
          '                                             to_date('+QuotedStr(DateToStr(dDataFinal))+', ''DD/MM/YYYY''),' + CR_LF +
          '                                             1) as VLR_BAIXA_OPER_ATU,' + CR_LF +

          '       PCK_IMO_DIVERGENCIA.FN_VLR_BAIXA_CONT('+IntToStr(Sistema.IdEmpresa)+',' + CR_LF +
          '                                             PF.CODDOCUMENTO,' + CR_LF +
          '                                             null,' + CR_LF +
          '                                             to_date('+QuotedStr(DateToStr(dDataInicio))+', ''DD/MM/YYYY''),' + CR_LF +
          '                                             1) as VLR_BAIXA_CONT_ANT,' + CR_LF +

          '       PCK_IMO_DIVERGENCIA.FN_VLR_BAIXA_CONT('+IntToStr(Sistema.IdEmpresa)+',' + CR_LF +
          '                                             PF.CODDOCUMENTO,' + CR_LF +
          '                                             to_date('+QuotedStr(DateToStr(dDataInicio))+', ''DD/MM/YYYY''),' + CR_LF +
          '                                             to_date('+QuotedStr(DateToStr(dDataFinal))+', ''DD/MM/YYYY''),' + CR_LF +
          '                                             1) as VLR_BAIXA_CONT_ATU' + CR_LF +

          '  from PARCFINANCIMOV PF, CONDPAGIMOVEL CP, CONTRATOIMOVEL CI' + CR_LF +
          ' where CP.IDCONDPAGIMOVEL = PF.IDCONDPAGIMOVEL' + CR_LF +
          '   and CI.IDCONTRATOIMOVEL = CP.IDCONTRATOIMOVEL' + CR_LF +
          '   and PF.CODDOCUMENTO is not null' + CR_LF +
          '   and CI.FLGTIPOCONTRATO = ''C''' + CR_LF;

  if iIdContratoImovel <> -1 then
    sSQL := sSQL +
          '   and CI.IDCONTRATOIMOVEL = ' + IntToStr(iIdContratoImovel) + CR_LF;

  sSQL := sSQL +
          '   and PF.DATAVENCIMENTO <= to_date(' + QuotedStr(DateToStr(dDataFinal)) + ', ''DD/MM/YYYY'')' + CR_LF +
          '   and PF.FLGTIPOLANC in (2, 3, 4, 5, 6, 7, 8, 9, 10, 12)' + CR_LF +

          ' order by PF.IDCONDPAGIMOVEL,' + CR_LF +
          '          PF.DATAVENCIMENTO,' + CR_LF +
          '          decode(PF.FLGTIPOLANC, 5, 999, PF.NUMPARCELA),' + CR_LF +
          '          decode(PF.FLGTIPOLANC, 11, 0, decode(PF.FLGTIPOLANC, 5, 4))' + CR_LF + ')';

  SaveSQL('RetornaSQLSaldoAlienacao.sql', sSQL);
  Result := sSQL;
end;

function TCtrlConsSaldoDiverg.ListaDocumento(idImovel, idBem: Integer;
  dDataIni, dDataFim: TDateTime; iIdContratoImovel: Integer): OleVariant;
var
  Contador: Integer;
begin
  if (FMovIdImovel <> IdImovel) or (FMovIdBem <> IdBem) or (FIdContratoIMovel <> iIdContratoImovel) or
     (FMovDtIni <> dDataIni) or (FMovDtFim <> dDataFim) or
     not(FCdsAux.Active) then
  begin
    if iIdContratoImovel = -1 then
      PegaMovimentacao(idImovel, idBem, dDataIni, dDataFim)
    else
      PegaMovimentacao(-1, -1, dDataIni, dDataFim, iIdContratoImovel);
  end;

  if FCdsDocumento.Active then FCdsDocumento.Close;

  FCdsDocumento.FieldDefs.Clear;
  FCdsDocumento.FieldDefs.Add('DataLanc', FCdsAux.FieldByName('DATALANC').DataType, FCdsAux.FieldByName('DATALANC').Size);
  FCdsDocumento.FieldDefs.Add('DataBaixa', FCdsAux.FieldByName('DATABAIXA').DataType, FCdsAux.FieldByName('DATABAIXA').Size);
  FCdsDocumento.FieldDefs.Add('CodDocumento', FCdsAux.FieldByName('CODDOCUMENTO').DataType, FCdsAux.FieldByName('CODDOCUMENTO').Size);
  FCdsDocumento.FieldDefs.Add('Descricao', FCdsAux.FieldByName('DESCRICAO').DataType, FCdsAux.FieldByName('DESCRICAO').Size);
  FCdsDocumento.FieldDefs.Add('RecPag', FCdsAux.FieldByName('RECPAG').DataType, FCdsAux.FieldByName('RECPAG').Size);
  FCdsDocumento.FieldDefs.Add('ValorLanc', FCdsAux.FieldByName('VLR_LANC_OPER_ATU').DataType, FCdsAux.FieldByName('VLR_LANC_OPER_ATU').Size);
  FCdsDocumento.FieldDefs.Add('ValorBaixa', FCdsAux.FieldByName('VLR_BAIXA_OPER_ATU').DataType, FCdsAux.FieldByName('VLR_BAIXA_OPER_ATU').Size);

  FCdsDocumento.CreateDataSet;

  FCdsAux.First;
  while not(FCdsAux.Eof) do begin
    if (FCdsAux.FieldByName('DATALANC').AsDateTime >= dDataIni) or
       (FCdsAux.FieldByName('DATABAIXA').AsDateTime >= dDataIni) then
    begin
      FCdsDocumento.Insert;

      FCdsDocumento.FieldByName('DataLanc').Value        := FCdsAux.FieldByName('DATALANC').Value;
      FCdsDocumento.FieldByName('DataBaixa').Value       := FCdsAux.FieldByName('DATABAIXA').Value;
      FCdsDocumento.FieldByName('CodDocumento').AsString := FCdsAux.FieldByName('CODDOCUMENTO').AsString;
      FCdsDocumento.FieldByName('Descricao').AsString    := FCdsAux.FieldByName('DESCRICAO').AsString;
      FCdsDocumento.FieldByName('RecPag').AsString       := FCdsAux.FieldByName('RECPAG').AsString;
      FCdsDocumento.FieldByName('ValorLanc').AsFloat     := FCdsAux.FieldByName('VLR_LANC_OPER_ATU').AsFloat;
      FCdsDocumento.FieldByName('ValorBaixa').AsFloat    := FCdsAux.FieldByName('VLR_BAIXA_OPER_ATU').AsFloat;

      FCdsDocumento.Post;
    end;

    FCdsAux.Next;
  end;

  Result := FCdsDocumento.Data;
end;

procedure TCtrlConsSaldoDiverg.AtualizaPlanoDepara_Imob;
begin
  ExecSQL('begin PCK_IMO_DIVERGENCIA.PR_ATUALIZA_PLANODEPARA; end;');
end;

function TCtrlConsSaldoDiverg.RetornaSQLSaldoAdminImob(iIdContratoImovel: Integer;
  dDataFinal, dDataInicio: TDateTime): string;
var
  sSQL : String;
begin
  AtualizaPlanoDepara_Imob;

  sSQL := 'select CODDOCUMENTO,' + CR_LF +
          '       RECPAG,' + CR_LF +
          '       DATALANC,' + CR_LF +
          '       DATABAIXA,' + CR_LF +
          '       DESCRICAO,' + CR_LF +
          '       VLR_LANC_OPER_ANT,' + CR_LF +
          '       VLR_LANC_OPER_ANT + VLR_LANC_OPER_ATU as VLR_LANC_OPER_ATU,' + CR_LF +
          '       VLR_LANC_CONT_ANT,' + CR_LF +
          '       VLR_LANC_CONT_ANT + VLR_LANC_CONT_ATU as VLR_LANC_CONT_ATU,' + CR_LF +
          '       VLR_ALT_OPER_ANT,' + CR_LF +
          '       VLR_ALT_OPER_ANT + VLR_ALT_OPER_ATU as VLR_ALT_OPER_ATU,' + CR_LF +
          '       VLR_ALT_CONT_ANT,' + CR_LF +
          '       VLR_ALT_CONT_ANT + VLR_ALT_CONT_ATU as VLR_ALT_CONT_ATU,' + CR_LF +
          '       VLR_BAIXA_OPER_ANT,' + CR_LF +
          '       VLR_BAIXA_OPER_ANT + VLR_BAIXA_OPER_ATU as VLR_BAIXA_OPER_ATU,' + CR_LF +
          '       VLR_BAIXA_CONT_ANT,' + CR_LF +
          '       VLR_BAIXA_CONT_ANT + VLR_BAIXA_CONT_ATU as VLR_BAIXA_CONT_ATU' + CR_LF +
          '  from (' + CR_LF +

          'select LI.IDDOCUMENTO as CODDOCUMENTO,' + CR_LF +
          '       LI.RECPAG,' + CR_LF +
          '       LI.DATAVENCIMENTO as DATALANC,' + CR_LF +

          '       PCK_IMO_DIVERGENCIA.FN_DATABAIXA(LI.IDDOCUMENTO, ' + CR_LF +
          '                                        to_date('+QuotedStr(DateToStr(dDataFinal))+', ''DD/MM/YYYY'')) as DATABAIXA,' + CR_LF +

          '       PCK_IMO_DIVERGENCIA.FN_DESCRICAO(LI.PLNCODIGO, LI.IDDOCUMENTO) as DESCRICAO,' + CR_LF +

          '       PCK_IMO_DIVERGENCIA.FN_VLR_LANC_OPER(LI.IDDOCUMENTO,' + CR_LF +
          '                                            null,' + CR_LF +
          '                                            to_date('+QuotedStr(DateToStr(dDataInicio))+', ''DD/MM/YYYY''),' + CR_LF +
          '                                            LI.VLRPERC) as VLR_LANC_OPER_ANT,' + CR_LF +

          '       PCK_IMO_DIVERGENCIA.FN_VLR_LANC_OPER(LI.IDDOCUMENTO,' + CR_LF +
          '                                            to_date('+QuotedStr(DateToStr(dDataInicio))+', ''DD/MM/YYYY''),' + CR_LF +
          '                                            to_date('+QuotedStr(DateToStr(dDataFinal))+', ''DD/MM/YYYY''),' + CR_LF +
          '                                            LI.VLRPERC) as VLR_LANC_OPER_ATU,' + CR_LF +

          '       PCK_IMO_DIVERGENCIA.FN_VLR_LANC_CONT('+IntToStr(Sistema.IdEmpresa)+',' + CR_LF +
          '                                            LI.IDDOCUMENTO,' + CR_LF +
          '                                            null,' + CR_LF +
          '                                            to_date('+QuotedStr(DateToStr(dDataInicio))+', ''DD/MM/YYYY''),' + CR_LF +
          '                                            LI.VLRPERC) as VLR_LANC_CONT_ANT,' + CR_LF +

          '       PCK_IMO_DIVERGENCIA.FN_VLR_LANC_CONT('+IntToStr(Sistema.IdEmpresa)+',' + CR_LF +
          '                                            LI.IDDOCUMENTO,' + CR_LF +
          '                                            to_date('+QuotedStr(DateToStr(dDataInicio))+', ''DD/MM/YYYY''),' + CR_LF +
          '                                            to_date('+QuotedStr(DateToStr(dDataFinal))+', ''DD/MM/YYYY''),' + CR_LF +
          '                                            LI.VLRPERC) as VLR_LANC_CONT_ATU,' + CR_LF +

          '       PCK_IMO_DIVERGENCIA.FN_VLR_ALT_OPER(LI.IDDOCUMENTO,' + CR_LF +
          '                                           null,' + CR_LF +
          '                                           to_date('+QuotedStr(DateToStr(dDataInicio))+', ''DD/MM/YYYY''),' + CR_LF +
          '                                           LI.VLRPERC) as VLR_ALT_OPER_ANT,' + CR_LF +

          '       PCK_IMO_DIVERGENCIA.FN_VLR_ALT_OPER(LI.IDDOCUMENTO,' + CR_LF +
          '                                           to_date('+QuotedStr(DateToStr(dDataInicio))+', ''DD/MM/YYYY''),' + CR_LF +
          '                                           to_date('+QuotedStr(DateToStr(dDataFinal))+', ''DD/MM/YYYY''),' + CR_LF +
          '                                           LI.VLRPERC) as VLR_ALT_OPER_ATU,' + CR_LF +

          '       PCK_IMO_DIVERGENCIA.FN_VLR_ALT_CONT('+IntToStr(Sistema.IdEmpresa)+',' + CR_LF +
          '                                           LI.IDDOCUMENTO,' + CR_LF +
          '                                           null,' + CR_LF +
          '                                           to_date('+QuotedStr(DateToStr(dDataInicio))+', ''DD/MM/YYYY''),' + CR_LF +
          '                                           LI.VLRPERC) as VLR_ALT_CONT_ANT,' + CR_LF +

          '       PCK_IMO_DIVERGENCIA.FN_VLR_ALT_CONT('+IntToStr(Sistema.IdEmpresa)+',' + CR_LF +
          '                                           LI.IDDOCUMENTO,' + CR_LF +
          '                                           to_date('+QuotedStr(DateToStr(dDataInicio))+', ''DD/MM/YYYY''),' + CR_LF +
          '                                           to_date('+QuotedStr(DateToStr(dDataFinal))+', ''DD/MM/YYYY''),' + CR_LF +
          '                                           LI.VLRPERC) as VLR_ALT_CONT_ATU,' + CR_LF +

          '       PCK_IMO_DIVERGENCIA.FN_VLR_BAIXA_OPER(LI.IDDOCUMENTO,' + CR_LF +
          '                                             null,' + CR_LF +
          '                                             to_date('+QuotedStr(DateToStr(dDataInicio))+', ''DD/MM/YYYY''),' + CR_LF +
          '                                             LI.VLRPERC) as VLR_BAIXA_OPER_ANT,' + CR_LF +

          '       PCK_IMO_DIVERGENCIA.FN_VLR_BAIXA_OPER(LI.IDDOCUMENTO,' + CR_LF +
          '                                             to_date('+QuotedStr(DateToStr(dDataInicio))+', ''DD/MM/YYYY''),' + CR_LF +
          '                                             to_date('+QuotedStr(DateToStr(dDataFinal))+', ''DD/MM/YYYY''),' + CR_LF +
          '                                             LI.VLRPERC) as VLR_BAIXA_OPER_ATU,' + CR_LF +

          '       PCK_IMO_DIVERGENCIA.FN_VLR_BAIXA_CONT('+IntToStr(Sistema.IdEmpresa)+',' + CR_LF +
          '                                             LI.IDDOCUMENTO,' + CR_LF +
          '                                             null,' + CR_LF +
          '                                             to_date('+QuotedStr(DateToStr(dDataInicio))+', ''DD/MM/YYYY''),' + CR_LF +
          '                                             LI.VLRPERC) as VLR_BAIXA_CONT_ANT,' + CR_LF +

          '       PCK_IMO_DIVERGENCIA.FN_VLR_BAIXA_CONT('+IntToStr(Sistema.IdEmpresa)+',' + CR_LF +
          '                                             LI.IDDOCUMENTO,' + CR_LF +
          '                                             to_date('+QuotedStr(DateToStr(dDataInicio))+', ''DD/MM/YYYY''),' + CR_LF +
          '                                             to_date('+QuotedStr(DateToStr(dDataFinal))+', ''DD/MM/YYYY''),' + CR_LF +
          '                                             LI.VLRPERC) as VLR_BAIXA_CONT_ATU' + CR_LF +

          '  from (select LI.IDCONTRATOIMOVEL, LI.IDDOCUMENTO, LI.PLNCODIGO, LI.RECPAG, LI.DATAVENCIMENTO,' + CR_LF +
          '               sum(decode(LI.RECPAG, ''P'', LI.VLRLANCPAGAR, LI.VLRLANCRECEB)) /' + CR_LF +
          '               (select sum(decode(RECPAG, ''P'', VLRLANCPAGAR, VLRLANCRECEB))' + CR_LF +
          '                  from LANCAMENTOSIMOVEL' + CR_LF +
          '                 where iddocumento = LI.IDDOCUMENTO) as VLRPERC' + CR_LF +
          '          from LANCAMENTOSIMOVEL LI' + CR_LF;

  if iIdContratoImovel <> -1 then
    sSQL := sSQL +
          '         where LI.IDCONTRATOIMOVEL = ' + IntToStr(iIdContratoImovel) + CR_LF;

  sSQL := sSQL +
          '         group by LI.IDCONTRATOIMOVEL, LI.IDDOCUMENTO, LI.PLNCODIGO, LI.RECPAG, LI.DATAVENCIMENTO' + CR_LF +
          '        ) LI' + CR_LF +

          ' order by DATALANC, CODDOCUMENTO' + CR_LF + ')';

  Result := sSQL;

  SaveSQL('RetornaSQLSaldoAdminImob.sql', Result);
end;

end.


