{-------------------------------------------------------------------------------
-------------------------------- ALTERAÇÃO -------------------------------------
--------------------------------------------------------------------------------
Nº SIG............: 122027
Data da Alteração.: 12/02/2020
Alteração Form....:
Responsável.......: Andre Imakawa
Descrição.........: Ajuste para verificar se Cds possui registro.
--------------------------------------------------------------------------------
Nº SIG............: 82785
Data da Alteração.: 12/02/2020
Alteração Form....: frmCadFerias
Responsável.......: Fabio Sampaio
Descrição.........: Inclusão dos campos INIABONO e FIMABONO na consulta
                    ListFerias()
--------------------------------------------------------------------------------
Nº SIG............: 99768
Data da Alteração.: 19/05/2020
Responsável.......: Everson Cunha
Descrição.........: Criar marcação para receber ou não adiantamento do pagamento
                    de férias
--------------------------------------------------------------------------------
Nº SIG............: 88290
Data da Alteração.: 26/12/2019
Alteração Form....: frmCadFerias
Responsável.......: Everson Cunha
Descrição.........: Erro no lançamento das férias dos estagiários (perda de
                    período aquisitivo)
--------------------------------------------------------------------------------
Nº SIG............: 91932
Data da Alteração.: 20/09/2019
Alteração Form....: sbtnExcluiDetClick
Responsável.......: Taffarel Sevaybriker
Descrição.........: Erro ao consultar férias com Cds vazio.
--------------------------------------------------------------------------------
Nº SIG............: 86355
Data da Alteração.: 16/05/2019
Responsável.......: Everson Cunha
Descrição.........: Correção no cálculo da rubrica PF - AVOS FERIAS
--------------------------------------------------------------------------------
Alteração ........: VerificaFeriasFracionadas
Nº SIG............: 75052
Data da Alteração.: 11/09/2018
Responsável.......: Edilaine
Descrição.........: Erro ao inserir primeiro registro de férias
--------------------------------------------------------------------------------
Nº SIG............: 73819
Data da Alteração.: 27/08/2018
Responsável.......: Edilaine
Descrição.........: Adequacao novas regras da CLT para ferias
--------------------------------------------------------------------------------
Nº SIG............: 20674
Data da Alteração.: 20/09/2016
Alteração Form....: frmCadFerias
Responsável.......: Darivaldo Alencar
Descrição.........: Perda do período aquisitivo de férias. Conforme previsto na
                    legislação trabalhista, art. 133
--------------------------------------------------------------------------------
RESPONSÁVEL.: Higor Nayde Ferreira
Nº SOL......: 217671/16092
Nº KINTANA..: 396727
Data........: 12/09/2012
Descrição...: Criação de validação para pessoas menores de 18 anos e acima
              de 50 anos
--------------------------------------------------------------------------------

{*******************************************************}
{                                                       }
{ CM Soluções Informática                               }
{ ** Todos os Direitos Reservados                       }
{ Analista Responsável: Raniere S. M. da Silva          }
{ Criado Em: 11/06/2002                                 }
{                                                       }
{*******************************************************}

unit uCtrlFerias;

interface

uses SysUtils, Controls, uSistema, uCmDbObject, uCmControlObject, uCMClientDataSet,
  uCtrlCustomRH, uCtrlListTerceirosRH, uCtrlRad, uDbFerias, uCtrlAntec13, uMensErro, Messages, uCtrlParamRH, uCtrlPadroes;

type
  TCtrlFerias = class(TCtrlCustomRH)
  protected
    procedure DoChangeDataBase; override;
    procedure AfterInitialize; override;
    procedure OnCreateAppServer; override;
  private
    //Darivaldo Alencar SIG 20674 -inicio
    fDtRetorno: tDate;
    fDtPeriodoAberto: TDate;
    fFracionouFerias: boolean;
    fPrimeiroRegistro: boolean;
    //Darivaldo Alencar SIG 20674 -fim
    FCtrlAntec13: TCtrlAntec13;
    FCtrlRad: TCtrlRad;
    FCtrlListTerceirosRH: TCtrlListTerceirosRH;

    FDbFerias: TDbFerias;

    FCdsFerias: TCMClientDataSet;
    FCdsAntec13: TCMClientDataSet;
    FCdsFunc: TCMClientDataSet;

    FIdRubricaFalta: double;
    FIdEmpresa: integer;
    FIntegraRAD: boolean;
    FIdUsuario: integer;
    FIdTipoProcesso: integer;

    CtrlParamRH : TCtrlParamRH; //Everson Cunha - SIG86355

    function GetIdRubricaFalta: double;
    function GerarProcessoRAD: boolean;
  public
    constructor Create(IdEmpresa: integer = 0; IntegraRAD: boolean = false;
      IdUsuario: integer = 0); reintroduce;
    destructor  Destroy; override;

    function ListFerias(IdPessoa: double): OleVariant;
    function ListFeriasNoPeriodo(ListaIdPessoa: string; DataIni, DataFin: TDateTime): OleVariant;
    //Luiz Carlos - SIG73819 - Inicio
    function TotalFeriasPeriodo(CdsDet: TCmClientDataSet; DataIni: String): Integer;
    function QtdeDiasPeriodoAquisitivo(CdsDet: TCmClientDataSet; DataIni: String; ultdias: integer; texto : string): Boolean;
    procedure VerificaFeriasFracionadas(CdsDet: TCmClientDataSet; DataIni: String);
    //Luiz Carlos - SIG73819 - Fim
    function GetTotalDeFaltas(IdPessoa: double; AnoMes1,AnoMes2: string): integer;
    function GetPeriodoAquisitivo(IdPessoa: double; FeriasJaOcorridas,
      UltimaDataFerias: boolean): TDate;

    function Gravar: boolean;

    property CdsFunc: TCMClientDataSet read FCdsFunc write FCdsFunc;
    property CdsFerias: TCMClientDataSet read FCdsFerias write FCdsFerias;
    property CdsAntec13: TCMClientDataSet read FCdsAntec13 write FCdsAntec13;

    property IdRubricaFalta: double read GetIdRubricaFalta;
    function NaoParcelarFeriasMenordeidade(idPessoa : Double) : Boolean;
    function ParcelarFeriasMaiordeidade(idPessoa : Double) : Boolean;
    //Darivaldo Alencar SIG 20674 -inicio
    function QtdeDiasAfastamento(idPessoa : Double;dataI,dataF: TDate):Integer;
    function GetDiasGozadosPeriodo(CdsDet: TCmClientDataSet;Dti: String; TpBusca: Integer;sSeq:String): Integer;
    function FeriasFracionadas(CdsDet: TCmClientDataSet;DiasInsertAtual: Integer;Dti,DtiG,DtfG: String): boolean;
    property dDtRetorno:TDate read fDtRetorno write fDtRetorno;
    property dDtPeriodoAberto: TDate read  fDtPeriodoAberto write fDtPeriodoAberto;
    property bFracionouFerias: boolean read fFracionouFerias write fFracionouFerias;
    property bPrimeiroRegistro: boolean read fPrimeiroRegistro write fPrimeiroRegistro;
    //Darivaldo Alencar SIG 20674 -fim

  end;

implementation

uses Db, uCMTypes, uCtrlFuncoesRH;

{ TCtrlFerias }

constructor TCtrlFerias.Create(IdEmpresa: integer; IntegraRAD: boolean; IdUsuario: integer);
begin
  inherited Create;
  FCtrlAntec13 := TCtrlAntec13.Create;
  FCtrlListTerceirosRH := TCtrlListTerceirosRH.Create('', '', '');

  //Everson Cunha - SIG86355 - Início
  CtrlParamRH := TCtrlParamRH.Create; 
  CtrlParamRH.InitializeAs(Padroes); 
  //Everson Cunha - SIG86355 - Fim

  FDbFerias := TDbFerias.Create(Self);

  FIdRubricaFalta := -1;

  FIdEmpresa := IdEmpresa;
  FIntegraRAD := IntegraRAD;
  FIdUsuario := IdUsuario;

  // Somente cria o RAD se estiver na Aplicação Servidora ou estiver
  // no modo de execução Cliente Servidor em Duas Camadas
  if (FIntegraRAD) and ((IsAppServer) or (ConnectionSide <> cnsClient)) then
    FCtrlRad := TCtrlRad.Create;
end;

destructor TCtrlFerias.Destroy;
begin
  FCtrlAntec13.Free;
  FCtrlListTerceirosRH.Free;

  FreeAndNil(CtrlParamRH); //Everson Cunha - SIG86355

  FDbFerias.Free;

  // Somente destrói o RAD se estiver na Aplicação Servidora ou estiver
  // no modo de execução Cliente Servidor em Duas Camadas
  if (FIntegraRAD) and ((IsAppServer) or (ConnectionSide <> cnsClient)) then
    FCtrlRad.Free;

  if (IsAppServer) then
  begin
    FCdsFunc.Free;
    FCdsFerias.Free;
  end;
  inherited;
end;

procedure TCtrlFerias.OnCreateAppServer;
begin
  inherited;
  FCdsFunc := TCMClientDataSet.Create(nil);
  FCdsFerias := TCMClientDataSet.Create(nil);
  FCdsAntec13 := TCMClientDataSet.Create(nil);
end;

procedure TCtrlFerias.AfterInitialize;
begin
  inherited;
  FCtrlAntec13.InitializeAs(Self);
  FCtrlAntec13.OpenTransaction := false;

  FCtrlListTerceirosRH.InitializeAs(Self);
  // Somente procura o IdTipoProcesso se estiver na Aplicação Servidora ou estiver
  // no modo de execução Cliente Servidor em Duas Camadas
  if (IsAppServer) or (ConnectionSide <> cnsClient) then
  begin
    if (FIntegraRAD) then
    begin
      FCtrlRad.InitializeAs(Self);
      FCtrlRad.OpenTransaction := false;
      FIdTipoProcesso := FCtrlListTerceirosRH.GetIdTipoProcesso(FIdUsuario, 16);
    end
    else
      FIdTipoProcesso := -1;
  end;
end;

procedure TCtrlFerias.DoChangeDataBase;
begin
  inherited;
  FDbFerias.DataBaseName := DataBaseName;
  FCtrlAntec13.DataBase := DataBase;
  FCtrlListTerceirosRH.DataBase := DataBase;
  // Somente muda o DataBaseName do RAD se estiver na Aplicação Servidora ou estiver
  // no modo de execução Cliente Servidor em Duas Camadas
  if (FIntegraRAD) and ((IsAppServer) or (ConnectionSide <> cnsClient)) then
    FCtrlRad.DataBase := DataBase;
end;

function TCtrlFerias.GetIdRubricaFalta: double;
begin
  if (FIdRubricaFalta = -1) then
  begin
    _Cds.Close;
    _Cds.Data := GetDataPacket(
      'SELECT IDPROVENTO'+CR_LF+
      'FROM   PROVDESC'+CR_LF+
      'WHERE  (CODRUBCLT = ''00001'') AND'+CR_LF+
      '       (ROWNUM    = 1)');

    if (_Cds.IsEmpty) then
      FIdRubricaFalta := -1
    else
      FIdRubricaFalta := _Cds.FieldByName('IDPROVENTO').asFloat;
  end;
  Result := FIdRubricaFalta;
end;

function TCtrlFerias.ListFerias(IdPessoa: double): OleVariant;
begin
  Result := GetDataPacket(
    'SELECT'+CR_LF+
    '  IDPESSOA, NUMSEQ, INIPERIODOFERIAS,'+CR_LF+
    //Darivaldo Alencar SIG 20674 -inicio
    //'  TO_CHAR(ADD_MONTHS(INIPERIODOFERIAS,12)-1,''DD/MM/YYYY'') AS FIMPERIODOFERIAS,'+CR_LF+
    ' TO_DATE(ADD_MONTHS(INIPERIODOFERIAS,12)-1,''DD/MM/RRRR'') AS FIMPERIODOFERIAS, FLGPERDAPERIODOAQUISITIVO,'+CR_LF+
    //Darivaldo Alencar SIG 20674 -fim
    '  INIGOZOFERIAS, FIMGOZOFERIAS, FLGOCORRIDA, FLGABONO, QTDPARCDEVOL, IDPROCESSO,'+CR_LF+
    '  QTDIASABONO, TO_NUMBER(FIMGOZOFERIAS - INIGOZOFERIAS)+1 AS QTDIASGOZO, INDMESDEVOL'+CR_LF+
    '  ,INIABONO, FIMABONO'+CR_LF+ // Alterado por FHBS - 12/02/2020 - SIG82785
    '  , FLGADIANTAPAGTOFERIAS ' + CR_LF + //Everson Cunha - SIG99768
    'FROM'+CR_LF+
    '  FERIAS'+CR_LF+
    'WHERE'+CR_LF+
    '  (IDPESSOA = ' +FloatToStr(IdPessoa)+ ')');
end;

function TCtrlFerias.ListFeriasNoPeriodo(ListaIdPessoa: string; DataIni,
  DataFin: TDateTime): OleVariant;
var
  sSQL: string;
begin
  if (ListaIdPessoa <> '') then
    if (Pos(',', ListaIdPessoa) > 0) then
      sSQL := '  (IDPESSOA      IN ('+ListaIdPessoa+')) AND'+CR_LF
    else
      sSQL := '  (IDPESSOA       = ' +ListaIdPessoa+ ') AND'+CR_LF;

  Result := GetDataPacket(
    'SELECT'+CR_LF+
    '  IDPESSOA, INIGOZOFERIAS, FIMGOZOFERIAS'+CR_LF+
    'FROM'+CR_LF+
    '  FERIAS'+CR_LF+
    'WHERE'+CR_LF+
    sSQL+
    '  ('+CR_LF+
    '    ((INIGOZOFERIAS >= TO_DATE('+QuotedStr(DateToStr(DataIni))+',''DD/MM/YYYY'')) AND'+CR_LF+
    '     (INIGOZOFERIAS <= TO_DATE('+QuotedStr(DateToStr(DataFin))+',''DD/MM/YYYY''))) OR'+CR_LF+
    '    ((FIMGOZOFERIAS >= TO_DATE('+QuotedStr(DateToStr(DataIni))+',''DD/MM/YYYY'')) AND'+CR_LF+
    '     (FIMGOZOFERIAS <= TO_DATE('+QuotedStr(DateToStr(DataFin))+',''DD/MM/YYYY'')))'+CR_LF+
    '  )');
end;

function TCtrlFerias.GetTotalDeFaltas(IdPessoa: double; AnoMes1,AnoMes2: string): integer;
begin
  _Cds.Close;
  _Cds.Data := GetDataPacket(
    'SELECT SUM(VALORPROVENTO) AS TOTALFALTA'+CR_LF+
    'FROM   HISTRUBSAL'+CR_LF+
    'WHERE (IDRUBRICA = ' +FloatToStr(FIdRubricaFalta)+ ') AND'+CR_LF+
    '      (IDPESSOA  = ' +FloatToStr(IdPessoa)+ ') AND'+CR_LF+
    '      (MES      >= ' +QuotedStr(AnoMes1)+ ') AND'+CR_LF+
    '      (MES      <= ' +QuotedStr(AnoMes2)+ ')');

  Result := _Cds.FieldByName('TOTALFALTA').asInteger;
end;

function TCtrlFerias.GetPeriodoAquisitivo(IdPessoa: double; FeriasJaOcorridas,
  UltimaDataFerias: boolean): TDate;
begin
  _Cds.Close;
  _Cds.Data := GetDataPacket(
    'SELECT'+CR_LF+
    '  ' +IFF(UltimaDataFerias, 'MAX', 'MIN')+ '(INIPERIODOFERIAS) AS PERIODO'+CR_LF+
    'FROM'+CR_LF+
    '  FERIAS'+CR_LF+
    'WHERE'+CR_LF+
    '  (IDPESSOA    = ' +FloatToStr(IdPessoa)+ ') AND'+CR_LF+
    '  (FLGOCORRIDA = ' +IFF(FeriasJaOcorridas, '1', '0')+ ')');

  if (_Cds.IsEmpty) then
    Result := 0
  else
    Result := _Cds.FieldByName('PERIODO').asDateTime;
end;

function TCtrlFerias.GerarProcessoRAD: boolean;
var
  bOk: boolean;
  sOBS: string;
begin
  MessageInfo := '';
  try
    if (FIdTipoProcesso > 0) then
    begin
      FCdsFerias.DisableControls;
      FCdsFerias.First;
      while not(FCdsFerias.EOF) do
      begin
        if (FCdsFerias.FieldByName('FLGOCORRIDA').asFloat = 0) then
        begin
          sOBS :=
            'Férias de: ' + Trim(FCdsFunc.FieldByName('NOME').asString) +CR_LF+
            'Período Aquisitivo: ' + FCdsFerias.FieldByName('INIPERIODOFERIAS').asString+
            ' a ' + FCdsFerias.FieldByName('FIMPERIODOFERIAS').asString +CR_LF+
            'Período de Gozo: ' + FCdsFerias.FieldByName('INIGOZOFERIAS').asString +
            ' a '+ FCdsFerias.FieldByName('FIMGOZOFERIAS').asString +CR_LF+
            'Dias de Gozo: ' + FCdsFerias.FieldByName('QTDIASGOZO').asString +CR_LF+
            'Dias de Abono Pecuniário: ' + FCdsFerias.FieldByName('QTDIASABONO').asString +CR_LF+
            'Parcelas Dev. Adto Férias: ' + FCdsFerias.FieldByName('QTDPARCDEVOL').asString;

          if (FCdsFerias.FieldByName('IDPROCESSO').asInteger <= 0) then
          begin
            FCtrlRad.TipoProcesso := FIdTipoProcesso;
            FCtrlRad.IdPessoa := FIdEmpresa;
            FCtrlRad.IdUsuario := FIdUsuario;
            FCtrlRad.IdPessResp := Trunc(FCdsFerias.FieldByName('IDPESSOA').asFloat);
            FCtrlRad.OBS := sOBS;
            FCtrlRad.IdEmpresa := FCdsFunc.FieldByName('IDEMPRESA').asInteger;
            FCtrlRad.CodCentroCusto := FCdsFunc.FieldByName('CODCENTROCUSTO').asString;

            if not(FCdsFerias.State in [dsInsert,dsEdit]) then
              FCdsFerias.Edit;
            FCdsFerias.FieldByName('IDPROCESSO').asInteger := FCtrlRad.IniciarProcesso;
            FCdsFerias.Post;

            if (FCdsFerias.FieldByName('IDPROCESSO').asInteger < 0) then
              raise Exception.Create('Erro ao tentar instanciar o processo no RAD.'+
                CR_LF + FCtrlRad.MessageInfo)
            else
            begin
              if (MessageInfo = '') then
                MessageInfo := 'Nº do(s) Processo(s) RAD Gerado(s):' +CR_LF+
                  FCdsFerias.FieldByName('IDPROCESSO').asString
              else
                MessageInfo := MessageInfo +', '+
                  FCdsFerias.FieldByName('IDPROCESSO').asString;
            end;
          end
          else
          begin
            bOk := ExecSQL('UPDATE RADINSTPROCESSO SET OBS = ' +QuotedStr(sOBS)+
                           ' WHERE IDPROCESSO = ' +FCdsFerias.FieldByName('IDPROCESSO').asString);
            if not(bOk) then
              raise Exception.Create('Erro ao tentar atualizar o processo no RAD.'+
                CR_LF + MessageInfo);
          end;
        end;
        FCdsFerias.Next;
      end;
      FCdsFerias.StatusFilter := [];
      FCdsFerias.First;
      FCdsFerias.EnableControls;
    end;
    Result := true;
  except
    on E: Exception do
    begin
      Result := false;
      MessageInfo := E.Message;
    end;
  end;
end;

function TCtrlFerias.Gravar: boolean;
begin
  if (ConnectionSide = cnsClient) then
  begin
    Result := Connection.AppServer.GravarFerias(FCdsFunc.Data,
      FCdsFerias.Data, FCdsAntec13.Data, FIntegraRAD, FIdUsuario, FIdEmpresa);
    MessageInfo := Connection.AppServer.MessageInfo;
  end
  else
  begin
    try
      StartTransaction;

      if (FIntegraRAD) then
        if not(GerarProcessoRAD) then
          raise Exception.Create(MessageInfo);

      Result := ApplyCds(FCdsFerias, FDbFerias, [], []);
      if not(Result) then
        raise Exception.Create(FDbFerias.MessageInfo);

      FCtrlAntec13.CdsAntecip13 := FCdsAntec13;
      Result := FCtrlAntec13.Gravar;
      if not(Result) then
        raise Exception.Create(FCtrlAntec13.MessageInfo);

      Commit;
    except
      on E: Exception do
      begin
        Rollback;
        Result := false;
        MessageInfo := E.Message;
      end;
    end;
  end;
end;

function TCtrlFerias.NaoParcelarFeriasMenordeidade(idPessoa: Double): Boolean;
begin
   //Higor Nayde Ferreira SOL.217671/16092
  _Cds.Close;
  _Cds.Data := GetDataPacket(
            ' SELECT trunc((months_between(to_date(TO_char(SYSDATE, ''DD/MM/YYYY'')), DATANASC))/12) AS IDADE '+
            ' FROM PESSOAFISICA                                                                              '+
            ' WHERE IDPESSOA = '+FloatToStr(idPessoa));

  if (_Cds.FieldByName('IDADE').asinteger <18) then
      Result := True
  else
      Result := False;
   //Higor Nayde Ferreira SOL.217671/16092
end;

function TCtrlFerias.ParcelarFeriasMaiordeidade(idPessoa: Double): Boolean;
begin
     //Higor Nayde Ferreira SOL.217671/16092
  _Cds.Close;
  _Cds.Data := GetDataPacket(
            ' SELECT trunc((months_between(to_date(TO_char(SYSDATE, ''DD/MM/YYYY'')), DATANASC))/12) AS IDADE '+
            ' FROM PESSOAFISICA                                                                              '+
            ' WHERE IDPESSOA = '+FloatToStr(idPessoa));

  if (_Cds.FieldByName('IDADE').asinteger >50) then
      Result := True
  else
      Result := False;
     //Higor Nayde Ferreira SOL.217671/16092
end;

//Darivaldo Alencar SIG 20674 -incio
function TCtrlFerias.QtdeDiasAfastamento(idPessoa: Double; dataI,dataF: TDate): Integer;
var
   iQtdeDiasAfastados : integer;
   dtSaida, DtNormalFim: TDate;
   bConta, bVerifica: boolean;
begin
   iQtdeDiasAfastados:= 0;

   if not _Cds.IsEmpty then //Everson Cunha - SIG86355
     _Cds.EmptyDataSet;

  //Everson Cunha - SIG86355 - Início
  bVerifica := True;

  _Cds.Data := CtrlParamRH.ListParamRH;
  DtNormalFim:= _Cds.FieldByName('NORMALFIM').AsDateTime;
  //Everson Cunha - SIG86355 - Fim

  _cds.EmptyDataSet;
  _Cds.Close;
  _Cds.Data := GetDataPacket(' SELECT H.DATASITFUNC,IDSITFUNC FROM HSTSITFUNC H '+
                             //' WHERE H.IDSITFUNC IN (4,5,1) AND IDPESSOA = '+ FloatToStr(idPessoa)+   //Everson Cunha - SIG88290
                             ' WHERE H.IDSITFUNC IN (4,5,1,29) AND IDPESSOA = '+ FloatToStr(idPessoa)+  //Everson Cunha - SIG88290
                             ' ORDER BY H.DATASITFUNC');
  while not(_Cds.eof) do
  begin
    //if(_Cds.FieldByName('IDSITFUNC').AsInteger <> 1) then                                                    //Everson Cunha - SIG88290
    if(_Cds.FieldByName('IDSITFUNC').AsInteger <> 1) and (_Cds.FieldByName('IDSITFUNC').AsInteger <> 29) then  //Everson Cunha - SIG88290
    begin
      bConta:= true;
      {Data de Afastamento Menor Que Período Aquisitivo 4-5}
      if (_Cds.FieldByName('DATASITFUNC').AsDateTime < dataI) then
      begin
        dtSaida:= dataI;
        bConta:= false;
      end;

     //{Data Afastamento Maior Que Período Aquisitivo 4-5}
      if (_Cds.FieldByName('DATASITFUNC').AsDateTime > dataF) then
         break;

     {Data de Afastamento - "4" ou "5"}
      if (bConta) then
        dtSaida := _Cds.FieldByName('DATASITFUNC').AsDateTime;

      _Cds.next;
      bConta:= true;

     {Data de Retorno Fora do Período Aquisitivo}
      if (_Cds.FieldByName('DATASITFUNC').AsDateTime < dataI) then
      begin
        _Cds.next;
        continue;
      end;

      {Data de Retorno Após Período Aquisitivo }
      if (_Cds.FieldByName('DATASITFUNC').AsDateTime > dataF) then
      begin
        dDtRetorno:= dataF; //Everson Cunha - SIG86355
        //dDtRetorno:= _Cds.FieldByName('DATASITFUNC').AsDateTime; //Everson Cunha - SIG86355
        bVerifica := False; //Everson Cunha - SIG86355
        bConta:= false;
      end;

     {Data de Retorno - "1"}
      if (bConta) then
        dDtRetorno:= _Cds.FieldByName('DATASITFUNC').AsDateTime;

      {Total de Dias Afastado}
      iQtdeDiasAfastados:= iQtdeDiasAfastados + DiasUteis.IntervaloDias(dtSaida,dDtRetorno);
    end;
    _Cds.next;
  end;

  // Andre Imakawa - SIG 122027 - Inicio
  if not(_Cds.IsEmpty) then
  begin
    //Everson Cunha - SIG86355 - Início
    // Verifica se a última linha lançada não é de retorno ao trabalho
    if bVerifica then
    begin
      _Cds.First;
      _Cds.Filter := ' DATASITFUNC <= ' + QuotedStr(DateToStr(dataF));
      _Cds.Filtered := true;
      _Cds.Last;

      //if (_Cds.FieldByName('IDSITFUNC').AsInteger <> 1) then                                                    //Everson Cunha - SIG88290
      if (_Cds.FieldByName('IDSITFUNC').AsInteger <> 1) and (_Cds.FieldByName('IDSITFUNC').AsInteger <> 29) then  //Everson Cunha - SIG88290
      begin
        dDtRetorno := IFF(dataF < DtNormalFim, strtodate(IncData(datetostr(dataF), 1,0,0)), DtNormalFim);

        {Total de Dias Afastado}
        iQtdeDiasAfastados:= iQtdeDiasAfastados + DiasUteis.IntervaloDias(_Cds.FieldByName('DATASITFUNC').AsDateTime, dDtRetorno);
      end;

      _Cds.Filter := '';
      _Cds.Filtered := false;
    end;
    //Everson Cunha - SIG86355 - Fim
  end;
  // Andre Imakawa - SIG 122027 - Fim

  result:= iQtdeDiasAfastados;
end;

function TCtrlFerias.GetDiasGozadosPeriodo(CdsDet: TCmClientDataSet; Dti: String; TpBusca: Integer;sSeq:String): Integer;
var
  iConta: Integer;
  CdsAux: TCmClientDataSet;
begin
    iConta:= 0;

    if(Dti <> EmptyStr) then
    begin
      CdsAux:= TCmClientDataSet.create(nil);
      CdsAux.CloneCursor(CdsDet, false ,true);

     if (CdsDet.state  = dsInsert) or (sSeq = '') then
        begin
          CdsAux.Filtered := False;
          CdsAux.Filter  := ' INIPERIODOFERIAS >= ' + QuotedStr(Dti);
          CdsAux.Filtered:= True;
        end
     else //Não contabilizar dias que constava no ClientDataset antes de alterar
      begin
         CdsAux.Filtered := False;
         CdsAux.Filter  := ' INIPERIODOFERIAS >= ' + QuotedStr(Dti) + ' AND NUMSEQ <> ' +sSeq;
         CdsAux.Filtered:= True;
      end;
      CdsAux.First;

      while  not(CdsAux.eof) do
        begin
          if (TpBusca = 1) then
             iConta:= iConta + DiasUteis.IntervaloDias(CdsAux.FieldByName('INIGOZOFERIAS').AsDateTime,
                                                       CdsAux.FieldByName('FIMGOZOFERIAS').AsDateTime)
                                                       + 1 //Se não somar é contabilizado intervalo errado
          else
             iConta:= iConta + CdsAux.FieldByName('QTDIASABONO').AsInteger;
          CdsAux.next;

        end;

      FreeAndNil(CdsAux);
    end;

    result := iConta;
end;

function TCtrlFerias.FeriasFracionadas(CdsDet: TCmClientDataSet;DiasInsertAtual: Integer; Dti,DtiG,DtfG: String): boolean;
var
  uIntervalo,aIntervalo,tIntervalo: Integer; //ultimo e penultimo intervalo de dias gozados
  uData, aData: TDate;                       //ultima e penultimo registro de periodo gozado mesmo q seja iguais
  CdsAux: TCmClientDataSet;
begin
  bFracionouFerias := true;
  bPrimeiroRegistro:= true;
  if (DtiG = EmptyStr) then
    exit;

  //Edilaine - SIG73819 - Inicio
  uIntervalo := 0;
  aIntervalo := 0;
  tIntervalo := 0;
  //Edilaine - SIG73819 - Fim

  try
    CdsAux:= TCmClientDataSet.create(nil);
    CdsAux.CloneCursor(CdsDet, false ,true);

    //Luiz Carlos - SIG73819 - Inicio
    CdsAux.Filtered := False;
    CdsAux.Filter  := ' INIPERIODOFERIAS >= ' + QuotedStr(Dti);
    CdsAux.Filtered:= True;
    CdsAux.first;

    while not(CdsAux.Eof) do
    begin
      if (CdsDet.state = dsInsert) or (CdsDet.state = dsBrowse) then
        begin
          uData      := StrToDate(Dti);
          uIntervalo := uIntervalo + DiasUteis.IntervaloDias(StrToDate(DtiG),StrToDate(DtfG))  + 1 + DiasInsertAtual;
        end
      else
        begin
          uData      := CdsAux.fieldbyname('iniperiodoferias').AsDateTime;
          uIntervalo := uIntervalo + DiasUteis.IntervaloDias(CdsAux.FieldByName('INIGOZOFERIAS').AsDateTime,
                                                             CdsAux.FieldByName('FIMGOZOFERIAS').AsDateTime)
                                                             + 1 + CdsAux.FieldByName('qtdiasabono').asInteger;
        end;
      CdsAux.next;
    end;
    CdsAux.First;
    //Luiz Carlos - SIG73819 - Fim

    aData      := CdsAux.fieldbyname('iniperiodoferias').AsDateTime;
    aIntervalo := DiasUteis.IntervaloDias(CdsAux.FieldByName('INIGOZOFERIAS').AsDateTime,
                                          CdsAux.FieldByName('FIMGOZOFERIAS').AsDateTime)
                                          + 1 + CdsAux.FieldByName('qtdiasabono').asInteger;
    tIntervalo:= 0;

    if (CdsAux.RecordCount = 0 ) then
       bFracionouFerias := false
    //Luiz Carlos - SIG73819 - Inicio/Fim
    else if (aData = uData) and (CdsAux.RecordCount > 1) and (uIntervalo < 30) then
      begin
        bPrimeiroRegistro:= false;
        bFracionouFerias := true;

         CdsAux.next;
         //Luiz Carlos - SIG73819 - Inicio/Fim
         if ((aData = CdsAux.fieldbyname('iniperiodoferias').asDateTime) and (CdsAux.RecordCount >= 3)) then
            begin
              tIntervalo:= DiasUteis.IntervaloDias(CdsAux.FieldByName('INIGOZOFERIAS').AsDateTime,
                                          CdsAux.FieldByName('FIMGOZOFERIAS').AsDateTime)
                                          + 1 + CdsAux.FieldByName('qtdiasabono').asInteger;
              bFracionouFerias:= false;
            end;
             CdsAux.first;
      end
    else
       begin
          bPrimeiroRegistro:= true;
          if (uIntervalo < 30) then
             bFracionouFerias := true
          else begin
             bFracionouFerias := false;
          end;
       end;

    dDtPeriodoAberto := uData;
  finally
    result:= bFracionouFerias;
    freeandnil(CdsAux);
  end;
end;
//Darivaldo Alencar SIG 20674 -fim
//Luiz Carlos - SIG73819 - Inicio
function TCtrlFerias.TotalFeriasPeriodo(CdsDet: TCmClientDataSet; DataIni: String): Integer;
var
   CdsAux: TCmClientDataSet;
begin
  try
    CdsAux:= TCmClientDataSet.create(nil);
    CdsAux.CloneCursor(CdsDet, false ,true);

    CdsAux.first;

    CdsAux.Filtered := False;
    CdsAux.Filter  := ' INIPERIODOFERIAS >= ' + QuotedStr(DataIni);
    CdsAux.Filtered:= True;

  finally
    result:= CdsAux.RecordCount;
    freeandnil(CdsAux);
  end;
end;

function TCtrlFerias.QtdeDiasPeriodoAquisitivo(CdsDet: TCmClientDataSet; DataIni: String; ultdias : integer; texto : string): Boolean;
var
   CdsAux: TCmClientDataSet;
   dias : Integer;
begin
  try
    CdsAux:= TCmClientDataSet.create(nil);
    CdsAux.CloneCursor(CdsDet, false ,true);

    CdsAux.Filtered := False;
    if texto <> '' then
      CdsAux.Filter  := ' INIPERIODOFERIAS >= ' + QuotedStr(DataIni) + ' AND NUMSEQ <> ' +texto
    else
      CdsAux.Filter  := ' INIPERIODOFERIAS >= ' + QuotedStr(DataIni);

    CdsAux.Filtered:= True;
    CdsAux.first;

    while not(CdsAux.Eof) do
    begin
       dias := 0;
       dias := dias + DiasUteis.IntervaloDias(CdsAux.FieldByName('INIGOZOFERIAS').AsDateTime,
                                             CdsAux.FieldByName('FIMGOZOFERIAS').AsDateTime)
                                             + 1; //Se não somar é contabilizado intervalo errado

      if dias >= 14 then
      begin
        Result := True;
        Exit;
      end
      else
        Result := False;

      CdsAux.next;
    end;
  finally
    if (ultdias >= 14) then
      Result := True;

    freeandnil(CdsAux);
  end;
end;

procedure TCtrlFerias.VerificaFeriasFracionadas(CdsDet: TCmClientDataSet; DataIni: String);
var
   CdsAux: TCmClientDataSet;
   totaldias, totalabono, total : Integer;
begin
  bFracionouFerias  := False;
  bPrimeiroRegistro := true;
  totaldias  := 0;
  totalabono := 0;
  total      := 0;

  //edilaine - SIG75052 - inicio
  if CdsDet.isEmpty then
     exit;
  //edilaine - SIG75052 - fim

  try
    CdsAux:= TCmClientDataSet.create(nil);
    CdsAux.CloneCursor(CdsDet, false ,true);

    CdsAux.Filtered := False;
    CdsAux.Filter  := ' INIPERIODOFERIAS >= ' + QuotedStr(DataIni);
    CdsAux.Filtered:= True;
    CdsAux.first;

    while not(CdsAux.Eof) do
    begin
       totaldias := totaldias + DiasUteis.IntervaloDias(CdsAux.FieldByName('INIGOZOFERIAS').AsDateTime,
                                                        CdsAux.FieldByName('FIMGOZOFERIAS').AsDateTime)
                                                        + 1;
       totaldias := totaldias + CdsAux.FieldByName('QTDIASABONO').AsInteger;
      CdsAux.Next;
    end;

    total := totaldias + totalabono;

    if (total > 0) and (total < 30) then
    begin
      bFracionouFerias  := True;
      bPrimeiroRegistro := False;
      Exit;
    end;
   finally
    freeandnil(CdsAux);
  end;

end;
//Luiz Carlos - SIG73819 - Fim
end.
