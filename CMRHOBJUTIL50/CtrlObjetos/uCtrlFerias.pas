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

uses SysUtils, Controls, uCmDbObject, uCMControlObject, IvDictio,
  uCMClientDataSet, uCtrlCustomRH, uCtrlRad, uCtrlListTerceirosRH, uDbFerias, uCtrlAntec13;

type
  TCtrlFerias = class(TCtrlCustomRH)
  protected
    procedure DoChangeDataBase; override;
    procedure AfterInitialize; override;
    procedure OnCreateAppServer; override;
  private
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
    FIdUsuario: double;
    FIdTipoProcesso: integer;

    function GetIdRubricaFalta: double;
    function GerarProcessoRAD: boolean;
  public
    constructor Create(IdEmpresa: integer = 0; IntegraRAD: boolean = false;
      IdUsuario: double = 0); reintroduce;
    destructor  Destroy; override;

    function ListFerias(IdPessoa: double): OleVariant;
    function ListFeriasSemIndCompleta: OleVariant;
    function ListFeriasNoPeriodo(ListaIdPessoa: string; DataIni, DataFin: TDateTime): OleVariant;
    function ListFeriasNoDia(ListaIdPessoa: string; DataRef: TDateTime): OleVariant;

    function GetTotalDeFaltas(IdPessoa: double; AnoMes1, AnoMes2: string): integer;
    function GetPeriodoAquisitivo(IdPessoa: double; FeriasJaOcorridas,
      UltimaDataFerias: boolean): TDate;

    // Cuba: verifica dias acum ferias baseado na CLT 00018
    function GetTotalDiasAcum(IdPessoa: double; AnoMes: string): integer;

    function GetDiasFerias(const IniGozo, FimGozo: TDate; const Abono: boolean;
      const QuantDiasAbono: double): double;

    function Gravar: boolean;

    property CdsFunc: TCMClientDataSet read FCdsFunc write FCdsFunc;
    property CdsFerias: TCMClientDataSet read FCdsFerias write FCdsFerias;
    property CdsAntec13: TCMClientDataSet read FCdsAntec13 write FCdsAntec13;

    property IdRubricaFalta: double read GetIdRubricaFalta;
  end;

implementation

uses  Db,  uCMTypes, uCtrlFuncoesRH;
//*DateUtils, uCMTraduzSql,
const
  // Constantes que são concatenadas durante o processamento de uma função. Usadas desta
  // forma para a melhor tradução pelo padrão.
  MSG_PER_AQUIS = 'Período Aquisitivo: :1 a :2';
  MSG_PER_GOZO = 'Período de Gozo: :1 a :2';

{ TCtrlFerias }

constructor TCtrlFerias.Create(IdEmpresa: integer; IntegraRAD: boolean; IdUsuario: double);
begin
  inherited Create;
  FCtrlAntec13 := TCtrlAntec13.Create;
  FCtrlListTerceirosRH := TCtrlListTerceirosRH.Create('', '', '');

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
      FIdTipoProcesso := FCtrlListTerceirosRH.GetIdTipoProcesso(FIdEmpresa, FIdUsuario, 16);
    end
    else
      FIdTipoProcesso := -1;
  end;
end;

procedure TCtrlFerias.DoChangeDataBase;
begin
  inherited;
  FDbFerias.DataBaseName := DataBaseName;
  //*FCtrlAntec13.DataBaseName := DataBaseName;
  //*FCtrlListTerceirosRH.DataBaseName := DataBaseName;
  // Somente muda o DataBaseName do RAD se estiver na Aplicação Servidora ou estiver
  // no modo de execução Cliente Servidor em Duas Camadas
  if (FIntegraRAD) and ((IsAppServer) or (ConnectionSide <> cnsClient)) then
   //* FCtrlRad.DataBaseName := DataBaseName;
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
    '  IDPESSOA, NUMSEQ, INDCOMPLETA, INIPERIODOFERIAS,'+CR_LF+
    '  TO_CHAR(ADD_MONTHS(INIPERIODOFERIAS,12)-1,''DD/MM/YYYY'') AS FIMPERIODOFERIAS,'+CR_LF+
    '  INIGOZOFERIAS, FIMGOZOFERIAS, FLGOCORRIDA, FLGABONO, QTDPARCDEVOL, IDPROCESSO,'+CR_LF+
    '  QTDIASABONO, TO_NUMBER(FIMGOZOFERIAS - INIGOZOFERIAS)+1 AS QTDIASGOZO'+CR_LF+
    'FROM'+CR_LF+
    '  FERIAS'+CR_LF+
    'WHERE'+CR_LF+
    '  (IDPESSOA = ' +FloatToStr(IdPessoa)+ ')');
end;

function TCtrlFerias.ListFeriasSemIndCompleta: OleVariant;
begin
  Result := GetDataPacket(
    'SELECT *'+CR_LF+
    'FROM   FERIAS'+CR_LF+
    'WHERE  (INDCOMPLETA IS NULL)'+CR_LF+
    'ORDER BY IDPESSOA, INIGOZOFERIAS');
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

function TCtrlFerias.ListFeriasNoDia(ListaIdPessoa: string; DataRef: TDateTime): OleVariant;
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
    '     (INIGOZOFERIAS <= TO_DATE('+QuotedStr(DateToStr(DataRef))+',''DD/MM/YYYY'')) AND'+CR_LF+
    '     (FIMGOZOFERIAS >= TO_DATE('+QuotedStr(DateToStr(DataRef))+',''DD/MM/YYYY''))'+CR_LF+
    '  )');
end;

function TCtrlFerias.GetTotalDeFaltas(IdPessoa: double; AnoMes1, AnoMes2: string): integer;
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

// Cuba: verifica dias acum ferias baseado na existencia da CLT 00018, mas busca
// a CLT 60695 (no Brasil é a BASE FGTS, mas em Cuba ficou DIAS ACUM FERIAS)
function TCtrlFerias.GetTotalDiasAcum(IdPessoa: double; AnoMes: string): integer;
begin
  _Cds.Close;
  _Cds.Data := GetDataPacket(
    'SELECT CODRUBCLT'+CR_LF+
    'FROM   RUBRICACLT'+CR_LF+
    'WHERE (CODRUBCLT = ''00018'')');

  if (_Cds.IsEmpty) then
  begin
    Result := 9999;
    exit;
  end;

  _Cds.Close;
  _Cds.Data := GetDataPacket(
    'SELECT VALORPROVENTO AS DIASACUM' +CR_LF+
    'FROM   HISTRUBSAL H, PROVDESC P' +CR_LF+
    'WHERE (H.IDPESSOA  = ' +FloatToStr(IdPessoa)+ ') AND' +CR_LF+
    '      (H.MES      <= ' +QuotedStr(AnoMes)+ ') AND' +CR_LF+
    '      (P.CODRUBCLT = ''60695'') AND' +CR_LF+
    '      (H.IDRUBRICA = P.IDPROVENTO)' +CR_LF+
    'ORDER BY H.MES DESC');

  Result := Trunc(_Cds.FieldByName('DIASACUM').asFloat);
end;

function TCtrlFerias.GetDiasFerias(const IniGozo, FimGozo: TDate; const Abono: boolean;
  const QuantDiasAbono: double): double;
var
  iQuantDiasGozo: double;
begin
  iQuantDiasGozo :=(FimGozo - IniGozo) + 1;

  // Recuperar a quantidade de dias de Abono:
  //   1 -> Se a quantidade não tiver sido informada, calcular a metade da quantidade
  //        de dias do gozo (Abono deve ser 1/3 dos dias de gozo)
  //   2 -> Caso contrário, usar a quantidade informada
  if (Abono) then
  begin
    if (QuantDiasAbono = 0) then
      Result := Trunc(iQuantDiasGozo / 2)
    else
      Result := (iQuantDiasGozo + QuantDiasAbono);
  end
  else
    Result := iQuantDiasGozo;
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
        //*  sOBS :=
        //*    ('Férias de: ')+ Trim(FCdsFunc.FieldByName('NOME').asString) +CR_LF+
        //*    (MSG_PER_AQUIS, [
        //*       FCdsFerias.FieldByName('INIPERIODOFERIAS').asString,
        //*      FCdsFerias.FieldByName('FIMPERIODOFERIAS').asString])+CR_LF+
        //*    (MSG_PER_GOZO, [
        //*      FCdsFerias.FieldByName('INIGOZOFERIAS').asString,
        //*      FCdsFerias.FieldByName('FIMGOZOFERIAS').asString])+CR_LF+
        //*    ('Dias de Gozo: ')+ FCdsFerias.FieldByName('QTDIASGOZO').asString +CR_LF+
        //*    ('Dias de Abono Pecuniário: ')+ FCdsFerias.FieldByName('QTDIASABONO').asString +CR_LF+
        //*    ('Parcelas Dev. Adto Férias: ')+ FCdsFerias.FieldByName('QTDPARCDEVOL').asString;

          if (FCdsFerias.FieldByName('IDPROCESSO').asInteger <= 0) then
          begin
            FCtrlRad.TipoProcesso := FIdTipoProcesso;
            FCtrlRad.IdPessoa := FIdEmpresa;
           //* FCtrlRad.IdUsuario := FIdUsuario;
            FCtrlRad.IdPessResp := Trunc(FCdsFerias.FieldByName('IDPESSOA').asFloat);
            FCtrlRad.OBS := sOBS;
            FCtrlRad.IdEmpresa := FCdsFunc.FieldByName('IDEMPRESA').asInteger;
            FCtrlRad.CodCentroCusto := FCdsFunc.FieldByName('CODCENTROCUSTO').asString;

            if not(FCdsFerias.State in [dsInsert,dsEdit]) then
              FCdsFerias.Edit;
            FCdsFerias.FieldByName('IDPROCESSO').asInteger := FCtrlRad.IniciarProcesso;
            FCdsFerias.Post;

            if (FCdsFerias.FieldByName('IDPROCESSO').asInteger < 0) then
              raise Exception.Create(('Erro ao tentar instanciar o processo no RAD.')+
                CR_LF + FCtrlRad.MessageInfo)
            else
            begin
              if (MessageInfo = '') then
                MessageInfo := ('Nº do(s) Processo(s) RAD Gerado(s):') +CR_LF+
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
              raise Exception.Create(('Erro ao tentar atualizar o processo no RAD.')+
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

      if (Assigned(FCdsAntec13)) then
      begin
        FCtrlAntec13.CdsAntecip13 := FCdsAntec13;
        Result := FCtrlAntec13.Gravar;
        if not(Result) then
          raise Exception.Create(FCtrlAntec13.MessageInfo);
      end;
      
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

end.
