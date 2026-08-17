{--------------------------------------------------------------------------------
ALTERAÇÕES / IMPLEMENTAÇÕES ----------------------------------------------------
--------------------------------------------------------------------------------
Rotina......: -
Nº SOL......: 172902 e 172902/8221 Admin e Alien
Nº KINTANA..: 1577381 e 1577344
Data........: 14/03/2012
Responsável.: Helen V. Bianchi
Descrição...: Não deixar fazer lançamentos com Período contabil Bloqueado
-------------------------------------------------------------------------------
Rotina............: FormCreate
N. Sol.............: 92381
N. Kintana......: 394180
Data...............: 18/09/2008
Responsável...: Cássio Camargo
Descrição........: Inclusão do Control Object CtrlImobDocumento, com o
                     objetivo de internalizar funcionalidades.
--------------------------------------------------------------------------------}

unit uCtrlPrevImob;

interface

uses
  sysutils, uCmControlObject, uCmDbObject, uSistema, DB, uDataBase, dbClient,
  provider, wwQuery, uCMClientDataSet, uCMTypes, uDBPrevImob, uDbLancPrevPerImob,
  uDBLancPrevImob, uDBLancprevDiaImob, uDBLancPrevContImob, uCtrlLancamento,
  uIntegraBack, uCtrlPadrLancImovel, uDiasUteis, uComunsImobiliario,
  uCtrlLancamentosImovel, JCLSysUtils, JclDateTime, uDbParamImovel, uDbParamAlienacao,
  uDbEstornoPrevImob, uCtrlParcFinancImov,
  //Cássio Camargo - 18/09/2008 - N. Sol 92381 -  N. Kintana 394180
  uCtrlImobLancamento,
  // Helen - SOL: 172902 , 172902/8221 KTN: 1577344 , 1577381
  uCtrlContab;

type
  TCtrlPrevImob = class(TCmControlObject)
  private
    FCdsPrevImob: TCMClientDataSet;
    FdbPrevImob: TDbPrevImob;
    FdbLancPrevContImob: TDbLancPrevContImob;
    FdbLancPrevDiaImob: TDbLancPrevDiaImob;
    FdbLancPrevImob: TDbLancPrevImob;
    Lancamento: TCtrlLancamento;
    ImobLancamento : TCtrlImobLancamento;
    CtrlPadrLancImovel: TCtrlPadrLancImovel;
    CtrlLancamentosImovel: TCtrlLancamentosImovel;
    CtrlParcFinancImov: TCtrlParcFinancImov;
    FdbParamImovel: TDbParamImovel;
    FdbParamAlienacao: TDbParamAlienacao;
    FdbLancPrevPerImob: TDbLancPrevPerImob;
    CtrlContab   : TCtrlContab; // Helen - SOL: 172902 , 172902/8221 KTN: 1577344 , 1577381

    ParamSistema : TParamSistema;

    procedure SetCdsPrevImob(const Value: TCMClientDataSet);
    procedure SetdbPrevImob(const Value: TDbPrevImob);
    procedure SetdbLancPrevContImob(const Value: TDbLancPrevContImob);
    procedure SetdbLancPrevDiaImob(const Value: TDbLancPrevDiaImob);
    procedure SetdbLancPrevImob(const Value: TDbLancPrevImob);
    procedure SetdbParamImovel(const Value: TDbParamImovel);
    procedure SetdbParamAlienacao(const Value: TDbParamAlienacao);
    procedure SetdbLancPrevPerImob(const Value: TDbLancPrevPerImob);

    function TotalLancPrevImob(const iIdModulo, iMesCompetencia, iAnoCompetencia: integer; const dIniCtb, dFimCtb: TDateTime; const iIdTipocustoRecImo: integer; const sCodTipImovel: string): Extended;
    function GravaLancPrevContImob(const iIdModulo: integer; const dDataLancto: TDateTime; var iIdLancPrevContImob: integer): boolean;
    function GravaLancPrevPerImob(const iIdModulo, iIdLancPrevImob, iAnoCompetencia, iMesCompetencia: integer; const sCodTipImovel: string; const dIniCtb, dFimCtb: TDateTime; const sFlgAjusteAnual: string; const fVlrMes: Extended): boolean;
    function GravaLancPrevImob(const iIdModulo, iIdUsuario, iIdTipoCustoRecImo, iAnoCompetencia, iMesCompetencia: integer; const sCodTipImovel: string; const dIniCtb, dFimCtb: TDateTime; const fVlrMes: Extended; const fVlrAno: Extended; const bUsaPlanoPatro: Boolean): boolean;
    function DeletePrevImob(const sFlgDiario: string; const iIdModulo: integer; const iIdTipoCustoRecImo: integer = -1; const iAnoCompetencia: integer = -1; const iMesCompetencia: integer = -1; const sCodTipImovel: string = ''; const dIniCtb:TDateTime = -1; const dFimCtb:TDateTime = -1; const sFlgAjusteAnual: string = '';const iImovelMestre: integer = -1; const iImovel: integer = -1): boolean;
    function DeleteLancPrevImob(const sFlgDiario: string; const iIdTipoCustoRecImo: integer = -1; const iAnoCompetencia: integer = -1; const iMesCompetencia: integer = -1; const bExcluiPlanilha: boolean = false; const sCodTipImovel: string = ''; const sFlgAjusteAnual: string = ''): boolean;
    function BuscaLancPrevDiaImob(const iIdModulo, iMesCompetencia, iAnoCompetencia, iIdTipoCustoRecImo: Integer; const sCodTipImovel, sFlgAjusteAnual: String; const bIntegrados: Boolean): OleVariant;
    function ExcluiLancContab(const iIdModulo, iIdUsuario, iMesCompetencia, iAnoCompetencia, iIdTipoCustoRecImo: Integer; const sCodTipImovel, sFlgAjusteAnual: String; const bUsaPlanoPatro: Boolean) : Boolean;

    function LookupLancPrevDiaImob(const sFlgDiario: string; const iIdModulo: integer; const iIdTipocustoRecImo: integer = -1; const iMesCompetencia: integer = -1; const iAnoCompetencia: integer = -1; const sCodTipImovel: string = ''; const sFlgAjusteAnual: string = ''): OleVariant;
    function LookupLancPrevDiaImobNova(const iIdLancPrevContImob,iIdTipoCustoRecImo:Integer; const sCodTipImovel, sFlgAjusteAnual:String) : OLEVariant;
    function LookupCountLancPrevPerImob(const iIdModulo, iMesCompetencia, iAnoCompetencia: integer; const iIdTipoCustoRecImo: integer = -1): OLEVariant;
    function LookupCountPrevImob(const iIdModulo, iMesCompetencia, iAnoCompetencia: integer; const iIdTipocustoRecImo: integer = -1): OleVariant;
    function LookupLancPrevContImob(const iIdModulo, iMesCompetencia, iAnoCompetencia: integer; const dDataLancto: TDateTime = -1): OleVariant;
    function LookupLancPrevImob(const iIdModulo, iAnoCompetencia, iMesCompetencia: integer; const iIdtipoCustoRecImo: integer = -1; const sCodTipImovel: string = ''; const dIniCtb: TDateTime = -1; const dFimCtb: TDateTime = -1; const sFlgAjusteAnual: string = ''; const bParaContab: boolean = true): OLEVariant;
    function LookupLancPrevImobUnico(const iIdModulo, iAnoCompetencia, iMesCompetencia: integer; const iIdtipoCustoRecImo: integer = -1): OLEVariant;

  protected
    procedure onCreateAppServer; override;
    procedure AfterInitialize; override;

  public
    constructor Create (const iIdEmpresa, iIdModulo, iIdUsuario, iIdEspAcesso: Integer; const bUsaPlanoPatro: Boolean); reintroduce;
    destructor  Destroy; override;

    // tabela PrevImob
    property dbPrevImob: TDbPrevImob read FdbPrevImob write SetdbPrevImob;
    property CdsPrevImob: TCMClientDataSet read FCdsPrevImob write SetCdsPrevImob;

    // tabela LancPrevImob
    property dbLancPrevImob: TDbLancPrevImob read FdbLancPrevImob write SetdbLancPrevImob;

    // tabela LancPrevDiaImob
    property dbLancPrevDiaImob: TDbLancPrevDiaImob read FdbLancPrevDiaImob write SetdbLancPrevDiaImob;

    // tablela LancPrevPerImob
    property dbLancPrevPerImob : TDbLancPrevPerImob read FdbLancPrevPerImob write SetdbLancPrevPerImob;

    // tabela LancPrevContImob
    property dbLancPrevContImob: TDbLancPrevContImob read FdbLancPrevContImob write SetdbLancPrevContImob;

    // tabela ParamImovel
    property dbParamImovel: TDbParamImovel read FdbParamImovel write SetdbParamImovel;

    // tabela ParamAlienacao
    property dbParamAlienacao: TDbParamAlienacao read FdbParamAlienacao write SetdbParamAlienacao;

    function GravaPrevImob (const bTransacao: boolean = true): boolean;

    // exclui lancprevdiaimob, lancamento, lancprevimob  e "previmob"
    function ExcluiLancPrevImob(sNomeBilhete: string; const bTransacao: boolean; const sFlgDiario: string; const iIdModulo, iIdUsuario: integer; const iIdTipoCustoRecImo: integer = -1; const iAnoCompetencia: integer = -1; const iMesCompetencia: integer = -1; const bUsaPlanoPatro: Boolean = True; const bExcluiPlanilha: boolean = false; const bExcluiPrevImob: boolean = false; const sCodTipImovel: string = ''; const dIniCtb: TDateTime = -1; const dFimCtb: TDateTime = -1; const sFlgAjusteAnual: string = ''): boolean;

    // registra previsão diária baseada na previsão anterior ou na lancamentosimovel
    function RegistraPrevImob(sNomeBilhete: string; const bTransacao: boolean; const sFlgDiario: string; const iIdModulo, iAnoCompetencia, iMesCompetencia: integer; const iIdTipoCustoRecImo: integer = - 1; const iImovelMestre: integer = -1; const iImovel: integer = -1): boolean;

    // função de olha para o realizado do mês atual e ajusta a previsão de despesas/receitas
    function AjustaPrevImob(sNomeBilhete: string; const bTransacao: boolean; const sFlgDiario: string; const iIdModulo, iAnoCompetencia, iMesCompetencia: integer; const iIdTipoCustoRecImo: integer = - 1; const iImovelMestre: integer = -1; const iImovel: integer = -1; const bEncerr: boolean = false): boolean;

    // monta a tabela lancprevimob baseada na previmob
    function ConsolidaLancPrevImob(sNomeBilhete: string; const bTransacao, bUsaPlanoPatro: boolean; const iIdModulo, iIdUsuario, iAnoCompetencia, iMesCompetencia: integer; const iIdTipoCustoRecImo: integer = - 1): boolean;

    // encerra a competência atual abrindo uma nova
    function EncerraCompetencia (sNomeBilhete: string; const bTransacao: boolean; const iIdEmpresa, iIdModulo, iAnoCompetencia, iMesCompetencia: integer): boolean;
    function DesfazEncerraCompetencia (sNomeBilhete: string; const bTransacao: boolean; const iIdEmpresa, iIdModulo, iIdUsuario, iAnoCompetencia, iMesCompetencia: integer; const bUsaPlanoPatro, bExcluiPlanilha: boolean): boolean;

    // integra Lançamento diário
    function IntegraLancDiario(sNomeBilhete: string; const iIdEmpresa, iIdModulo, iIdUsuario, iAnoCompetencia, iMesCompetencia, iPlanoPrev, iPatro: integer;
                               const sPlanoPrev, sPatro : String; const bUsaPlanoPatro: Boolean; const iIdTipoCustoRecImo: integer = - 1): boolean;

    function RegistraEstornoPrevImob(const iCodDoc, iPlnCodigo: Extended; const bTransacao:Boolean = True) : Boolean;

    function LookupPrevImob(const iIdPrevImob: integer = -1; const iIdModulo: integer = -1; const iIdTipocustoRecImo: integer = -1; const sCodTipImovel:String = ''; const dIniCtb:TDateTime = -1; const dFimCtb:TDateTime = -1; const iAnoCompetencia: integer = -1; const iMesCompetencia: integer = -1; const sFlgDiario: string = ''; const iImovelMestre: integer = -1; const iImovel: integer = -1): OleVariant;

  published
end;

implementation

{ TCtrlPrevImob }

procedure TCtrlPrevImob.AfterInitialize;
begin
  inherited;
  FdbPrevImob.DataBaseName         := DataBaseName;
  FdbLancPrevContImob.DataBaseName := DataBaseName;
  FdbLancPrevDiaImob.DataBaseName  := DataBaseName;
  FdbLancPrevPerImob.DataBaseName  := DataBaseName;
  FdbLancPrevImob.DataBaseName     := DataBaseName;
  FdbParamImovel.DataBaseName      := DataBaseName;
  FdbParamAlienacao.DataBaseName   := DataBaseName;
  //Cássio Camargo - 18/09/2008 - N. Sol 92381 -  N. Kintana 394180
  Lancamento.InitializeAs( Self );
  ImobLancamento.InitializeAs(Self);
  CtrlPadrLancImovel.InitializeAs( Self );
  CtrlLancamentosImovel.InitializeAs( Self );
  CtrlParcFinancImov.InitializeAs( Self );
  CtrlContab.InitializeAs( Self ); // Helen - SOL: 172902 , 172902/8221 KTN: 1577344 , 1577381
end;

constructor TCtrlPrevImob.Create(const iIdEmpresa, iIdModulo, iIdUsuario, iIdEspAcesso: Integer; const bUsaPlanoPatro: Boolean);
begin
  inherited Create;
  FdbPrevImob         := TDbPrevImob.Create( Self );
  FdbLancPrevContImob := TDbLancPrevContimob.Create ( Self );
  FdbLancPrevDiaImob  := TDbLancPrevDiaImob.Create ( Self );
  FdbLancPrevPerImob  := TDbLancPrevPerImob.Create ( Self );
  FdbLancPrevImob     := TDbLancPrevimob.Create ( Self );
  FdbParamImovel      := TDbParamImovel.Create ( Self );
  FdbParamAlienacao   := TDbParamAlienacao.Create( Self );

  Lancamento            := TCtrlLancamento.Create;
  ImobLancamento        := TCtrlImoblancamento.Create;
  CtrlPadrLancImovel    := TCtrlPadrLancImovel.Create(iIdEmpresa, iIdModulo );
  CtrlLancamentosImovel := TCtrlLancamentosImovel.Create( iIdEmpresa, iIdModulo, iIdUsuario, iIdEspAcesso, bUsaPlanoPatro);
  CtrlParcFinancImov    := TCtrlParcFinancImov.Create;
  CtrlContab     := TCtrlContab.Create;// Helen - SOL: 172902 , 172902/8221 KTN: 1577344 , 1577381

  // Carrega Variáveis Globais
  ParamSistema.idEmpresa      := iIdEmpresa;
  ParamSistema.idModulo       := iIdModulo;
  ParamSistema.idUsuario      := iIdUsuario;
  ParamSistema.idUsuario      := iIdEspAcesso;
  ParamSistema.UsaPlanoPatro  := bUsaPlanoPatro;
end;

destructor TCtrlPrevImob.Destroy;
begin
  FreeAndNil( FdbPrevImob );
  FreeAndNil( FdbLancPrevContImob );
  FreeAndNil( FdbLancPrevDiaImob );
  FreeAndNil( FdbLancPrevPerImob );
  FreeAndNil( FdbLancPrevImob );
  FreeAndNil( FdbParamImovel );
  FreeAndNil( FdbParamAlienacao );
  FreeAndNil( Lancamento );
  FreeAndNil( ImobLancamento );
  FreeAndNil( CtrlPadrLancImovel );
  FreeAndNil( CtrlLancamentosImovel );
  FreeAndNil( CtrlParcFinancImov );
   FreeAndNil(CtrlContab); // Helen - SOL: 172902 , 172902/8221 KTN: 1577344 , 1577381

  if isAppServer then begin
    FreeAndNil(FCdsPrevImob);
  end;

  inherited;
end;


procedure TCtrlPrevImob.onCreateAppServer;
begin
  inherited;
  FCdsPrevImob := TCMClientDataSet.Create (nil);
end;


function TCtrlPrevImob.GravaPrevImob(const bTransacao: boolean): boolean;
var
  sMsg : string;
begin
  if ConnectionSide = cnsclient then begin
    Result := Connection.AppServer.GravaPrevImob (CdsPrevImob.Data, bTransacao);
    if not Result then
      MessageInfo := Connection.AppServer.MessageInfo;
  end else begin
    try
      if bTransacao then StartTransaction;
      Result := ApplyCds(CdsPrevImob, dbPrevImob, [], []);
      sMsg := dbPrevImob.MessageInfo;

      if  not Result then raise Exception.Create(sMsg);

      if bTransacao then Commit;
    except
      on E:Exception do begin
        Result := false;
        if bTransacao then Rollback;
        MessageInfo := E.Message;
      end;
    end;
  end;
end;


function TCtrlPrevImob.LookupCountPrevImob(const iIdModulo, iMesCompetencia, iAnoCompetencia, iIdTipocustoRecImo: integer): OleVariant;
var
  sSql,sParam : String;
begin
  sParam := '';
  if iIdTipocustoRecImo  <> -1 then sParam := sParam + '  AND ( PRE.IDTIPOCUSTORECIMO = ' + IntToStr(iIdTipocustoRecImo) +') '+#13;


  sSql := 'SELECT ' + #13 +
          '   PRE.CODTIPIMOVEL, PRE.IDTIPOCUSTORECIMO, PRE.DTINICTBDIARIA, PRE.DTFIMCTBDIARIA, ' +#13+
          '   SUM(PRE.VLRMES) AS TOTAL, SUM(PRE.VLRANO) AS TOTAL_ANO ' + #13 +
          'FROM ' + #13 +
          '   PREVIMOB PRE, TIPOCUSTORECIMOV T ' + #13 +
          'WHERE ' + #13 +
          '   ( PRE.IDTIPOCUSTORECIMO = T.IDTIPOCUSTORECIMO ) ' + #13 +
          '   AND ( PRE.MESCOMPETENCIA = '    + IntToStr(iMesCompetencia) + ' ) ' + #13 +
          '   AND ( PRE.ANOCOMPETENCIA = '    + IntToStr(iAnoCompetencia) + ' ) ' + #13 +
          '   AND ( T.IDMODULO = ' + IntToStr (iIdModulo) + ' ) ' + #13 +
          sParam +
          'GROUP BY ' + #13 +
          '   PRE.CODTIPIMOVEL, PRE.IDTIPOCUSTORECIMO, PRE.DTINICTBDIARIA, PRE.DTFIMCTBDIARIA';

  Result := GetDataPacket( sSql );
end;


function TCtrlPrevImob.TotalLancPrevImob(const iIdModulo, iMesCompetencia, iAnoCompetencia : Integer;
                                         const dIniCtb, dFimCtb : TDateTime;
                                         const iIdTipocustoRecImo: integer;
                                         const sCodTipImovel: string): Extended;
var
  sSql : String;
  _CdsLocal: TCMClientDataSet;
  sAnoMesCompetencia : String;
begin
  try
    _CdsLocal := TCMClientDataSet.Create ( nil );

    sAnoMesCompetencia := FormatFloat('0000', StrToFloat(IntToStr(iAnoCompetencia))) +
                          FormatFloat('00'   , StrToFloat(IntToStr(iMesCompetencia)));
    sSql := 'SELECT ' + #13 +
            '   L.IDTIPOCUSTORECIMO, SUM(L.VLRMES) AS TOTAL ' + #13 +
            'FROM ' + #13 +
            '   LANCPREVIMOB L, TIPOCUSTORECIMOV T ' + #13 +
            'WHERE ' + #13 +
            '   ( L.IDTIPOCUSTORECIMO = T.IDTIPOCUSTORECIMO ) ' + #13 +
            '   AND ( L.DTINICTBDIARIA = TO_DATE(' + QuotedStr(DateToStr(dIniCtb)) + ',''DD/MM/YYYY'') )' + #13 +
            '   AND ( L.DTFIMCTBDIARIA = TO_DATE(' + QuotedStr(DateToStr(dFimCtb)) + ',''DD/MM/YYYY'') )' + #13 +

            '   AND ( TO_NUMBER(TO_CHAR(L.ANOCOMPETENCIA,''0999'') || TRIM(TO_CHAR(L.MESCOMPETENCIA,''09''))) < '    + sAnoMesCompetencia + ' ) ' + #13 +

            '   AND ( L.IDTIPOCUSTORECIMO = ' + IntToStr(iIdTipocustoRecImo) + ' ) '+#13 +
            '   AND ( L.CODTIPIMOVEL = '  + QuotedStr(sCodTipImovel) + ' ) '+#13 +
            '   AND ( T.IDMODULO = '      + IntToStr (iIdModulo) + ' ) ' + #13 +
            'GROUP BY ' + #13 +
            '   L.IDTIPOCUSTORECIMO ';

    _CdsLocal.Data := GetDataPacket( sSql );
    Result := _CdsLocal.FieldByName('TOTAL').AsFloat;
  finally
    FreeAndNil ( _CdsLocal );
  end;
end;


function TCtrlPrevImob.LookupPrevImob(const iIdPrevImob, iIdModulo, iIdTipocustoRecImo: integer;
         const sCodTipImovel:String; const dIniCtb,dFimCtb:TDateTime;
         const iAnoCompetencia, iMesCompetencia: integer; const sFlgDiario: string;
         const iImovelMestre, iImovel: integer): OleVariant;
var
  sSql,sParam : String;
begin
  sParam := '';
  if iIdPrevImob <> -1         then sParam := sParam + '  AND ( PRE.IDPREVIMOB = '        + IntToStr(iIdPrevImob) +') '+#13;
  if iIdTipocustoRecImo  <> -1 then sParam := sParam + '  AND ( PRE.IDTIPOCUSTORECIMO = ' + IntToStr(iIdTipocustoRecImo) +') '+#13;
  if sCodTipImovel <> ''       then sParam := sParam + '  AND ( PRE.CODTIPIMOVEL = '      + QuotedStr(sCodTipImovel) +') '+#13;
  if dIniCtb <> -1             then sParam := sParam + '  AND ( PRE.DTINICTBDIARIA = TO_DATE(' + QuotedStr(FormatDateTime('DD/MM/YYYY',dIniCtb)) + ',''DD/MM/YYYY'') )' +#13;
  if dFimCtb <> -1             then sParam := sParam + '  AND ( PRE.DTFIMCTBDIARIA = TO_DATE(' + QuotedStr(FormatDateTime('DD/MM/YYYY',dFimCtb)) + ',''DD/MM/YYYY'') )' +#13;
  if iMesCompetencia <> -1     then sParam := sParam + '  AND ( PRE.MESCOMPETENCIA = '    + IntToStr(iMesCompetencia) +') '+#13;
  if iAnoCompetencia <> -1     then sParam := sParam + '  AND ( PRE.ANOCOMPETENCIA = '    + IntToStr(iAnoCompetencia) +') '+#13;
  if iIdModulo <> -1           then sParam := sParam + '  AND ( T.IDMODULO = '            + IntToStr(iIdModulo) +') '+#13;
  if sFlgDiario <> ''          then sParam := sParam + '  AND ( T.FLGDIARIO = '           + QuotedStr(sFlgDiario) +') '+#13;
  if iImovelMestre <> -1       then sParam := sParam + '  AND ( I.IDIMOVELMESTRE = '      + IntToStr(iImovelMestre) +') '+#13;
  if iImovel <> -1             then sParam := sParam + '  AND ( I.IDIMOVEL = '            + IntToStr(iImovel) +') '+#13;


  sSql := 'SELECT '+#13+
          '  PRE.IDPREVIMOB        , PRE.CODTIPIMOVEL      , PRE.IDIMOVEL      , PRE.IDTIPOCUSTORECIMO , '+#13+
          '  PRE.MESCOMPETENCIA    , PRE.ANOCOMPETENCIA    , PRE.VLRANO        , PRE.VLRMES            , '+#13+
          '  PRE.DTINICTBDIARIA    , PRE.DTFIMCTBDIARIA    , T.DESCCUSTORECIMO , PRE.FLGTIPOLANC       , '+#13+
          '  T.FLGDIARIO           , I.CODTIPIMOVEL AS CODTIPIMOVEL_ATU '+#13+
          'FROM '+#13+
          '  PREVIMOB PRE, TIPOCUSTORECIMOV T, IMOVEL I '+#13+
          'WHERE '+#13+
          '   ( PRE.IDTIPOCUSTORECIMO = T.IDTIPOCUSTORECIMO ) '+#13+
          '   AND ( PRE.IDIMOVEL = I.IDIMOVEL ) '+ #13 +
          sParam+
          'ORDER BY ' +#13+
          '   PRE.IDIMOVEL, PRE.IDTIPOCUSTORECIMO, PRE.CODTIPIMOVEL, PRE.DTINICTBDIARIA, PRE.DTFIMCTBDIARIA ' + #13;

  Result := GetDataPacket( sSql );
end;


{ bParaContab = true - seleciona lançamentos para integração contábil }
function TCtrlPrevImob.LookupLancPrevImob(const iIdModulo, iAnoCompetencia,
         iMesCompetencia, iIdtipoCustoRecImo: integer; const sCodTipImovel: String;
         const dIniCtb, dFimCtb : TDateTime; const sFlgAjusteAnual: string;
         const bParaContab: boolean): OleVariant;
var
  sSql, sFiltro: string;
begin
  sFiltro := '';
  if iIdTipoCustoRecImo <> -1 then sFiltro := sFiltro + '   AND ( L.IDTIPOCUSTORECIMO = ' + IntToStr(iIdTipoCustoRecImo) + ' ) ' + #13;
  if sCodTipImovel      <> '' then sFiltro := sFiltro + '   AND ( L.CODTIPIMOVEL = ' + QuotedStr(sCodTipImovel) + ' ) ' + #13;
  if bParaContab              then sFiltro := sFiltro + '   AND ( L.FLGSITUACAO IN (''E'',''N'') ) ' + #13;
  if sFlgAjusteAnual    <> '' then sFiltro := sFiltro + '   AND ( L.FLGAJUSTEANUAL = ' + QuotedStr(sFlgAjusteAnual) + ' ) ' + #13;
  if dIniCtb            <> -1 then sFiltro := sFiltro + '   AND ( L.DTINICTBDIARIA = TO_DATE(' + QuotedStr(FormatDateTime('DD/MM/YYYY',dIniCtb)) + ',''DD/MM/YYYY'') )' +#13;
  if dFimCtb            <> -1 then sFiltro := sFiltro + '   AND ( L.DTFIMCTBDIARIA = TO_DATE(' + QuotedStr(FormatDateTime('DD/MM/YYYY',dFimCtb)) + ',''DD/MM/YYYY'') )' +#13;

  // montar a query para contabilizacao
  sSql := 'SELECT ' + #13 +
          '   L.IDLANCPREVIMOB, L.IDTIPOCUSTORECIMO, L.CODTIPIMOVEL, '+ #13 +
          '   L.ANOCOMPETENCIA, L.MESCOMPETENCIA, L.VLRMES, L.FLGAJUSTEANUAL, '+ #13 +
          '   T.RECCUSTO , T.DESCCUSTORECIMO, T.FLGDIARIO, L.DTINICTBDIARIA, L.DTFIMCTBDIARIA '+ #13 +
          'FROM ' + #13 +
          '   LANCPREVIMOB L, TIPOCUSTORECIMOV T ' + #13 +
          'WHERE ' + #13 +
          '   ( L.IDTIPOCUSTORECIMO = T.IDTIPOCUSTORECIMO ) '+ #13 +
          '   AND ( L.ANOCOMPETENCIA = ' + IntToStr(iAnoCompetencia) + ' ) ' + #13 +
          '   AND ( L.MESCOMPETENCIA = ' + IntToStr(iMesCompetencia) + ' ) ' + #13 +
          '   AND ( T.IDMODULO = ' + IntToStr(iIdModulo) + ' ) ' + #13 +
          sFiltro +
          'ORDER BY ' + #13 +
          '   L.IDLANCPREVIMOB ';

  result := GetDataPacket (sSql);

end;


function TCtrlPrevImob.LookupLancPrevImobUnico(const iIdModulo, iAnoCompetencia,
                                  iMesCompetencia, iIdtipoCustoRecImo: integer): OleVariant;
var
  sSql, sParam: string;
begin
  sParam := ' AND T.IDMODULO = ' + IntToStr(iIdModulo) +#13+
            ' AND L.ANOCOMPETENCIA = ' + IntToStr(iAnoCompetencia) +#13+
            ' AND L.MESCOMPETENCIA = ' + IntToStr(iMesCompetencia);

  if iIdTipoCustoRecImo <> -1 then sParam := sParam + ' AND L.IDTIPOCUSTORECIMO = ' + IntToStr(iIdTipoCustoRecImo) +#13;

  // montar a query para contabilizacao
  sSql := 'SELECT L.IDTIPOCUSTORECIMO, L.CODTIPIMOVEL,   T.RECCUSTO,             ' +#13+
          '       L.ANOCOMPETENCIA,    L.MESCOMPETENCIA, L.FLGAJUSTEANUAL,       ' +#13+
          '       T.DESCCUSTORECIMO,   T.FLGDIARIO,      SUM(L.VLRMES) AS VLRMES ' +#13+
          '  FROM LANCPREVIMOB L, TIPOCUSTORECIMOV T        ' +#13+
          ' WHERE L.IDTIPOCUSTORECIMO = T.IDTIPOCUSTORECIMO ' +#13+
          '   AND L.FLGSITUACAO IN (''E'',''N'') ' +#13+ sParam +
          'GROUP BY L.IDTIPOCUSTORECIMO, L.CODTIPIMOVEL,   T.RECCUSTO,       ' +#13+
          '         L.ANOCOMPETENCIA,    L.MESCOMPETENCIA, L.FLGAJUSTEANUAL, ' +#13+
          '         T.DESCCUSTORECIMO,   T.FLGDIARIO ';

  Result := GetDataPacket (sSql);
end;



function TCtrlPrevImob.LookupLancPrevDiaImob(const sFlgDiario: string;
  const iIdModulo, iIdTipocustoRecImo, iMesCompetencia, iAnoCompetencia: integer;
  const sCodTipImovel, sFlgAjusteAnual: string): OleVariant;
var
  sSql, sFiltro: string;
begin
  sFiltro := '';
  if iAnoCompetencia     <> -1 then sFiltro := sFiltro + '   AND ( L.ANOCOMPETENCIA = ' + IntToStr(iAnoCompetencia) + ' ) ' + #13;
  if iMesCompetencia     <> -1 then sFiltro := sFiltro + '   AND ( L.MESCOMPETENCIA = ' + IntToStr(iMesCompetencia) + ' ) ' + #13;
  if iIdTipoCustoRecImo  <> -1 then sFiltro := sFiltro + '   AND ( D.IDTIPOCUSTORECIMO = ' + IntToStr(iIdTipoCustoRecImo) + ' ) ' + #13;
  if sCodTipImovel       <> '' then sFiltro := sFiltro + '   AND ( D.CODTIPIMOVEL = '   + QuotedStr(sCodTipImovel) + ' ) ' + #13;
  if sFlgAjusteAnual     <> '' then sFiltro := sFiltro + '   AND ( D.FLGAJUSTEANUAL = ' + QuotedStr(sFlgAjusteAnual) + ' ) ' + #13;
  if sFlgDiario          <> '' then sFiltro := sFiltro + '   AND ( T.FLGDIARIO = ' + QuotedStr(sFlgDiario) + ' ) ' + #13;

  // montar a query para exclusão
  sSql := 'SELECT DISTINCT '+#13+
          '       C.IDLANCPREVCONTIMOB, C.PLNCODIGO, D.LANCNUMLAN, C.DATALANCTO '+#13+
          '  FROM LANCPREVIMOB L, LANCPREVDIAIMOB D, LANCPREVPERIMOB P, '+#13+
          '       LANCPREVCONTIMOB C, TIPOCUSTORECIMOV T '+#13+
          ' WHERE L.IDTIPOCUSTORECIMO = T.IDTIPOCUSTORECIMO '+#13+
          '   AND D.IDLANCPREVCONTIMOB = C.IDLANCPREVCONTIMOB (+) '+#13+
          '   AND D.IDLANCPREVCONTIMOB = P.IDLANCPREVCONTIMO '+#13+
          '   AND L.IDLANCPREVIMOB = P.IDLANCPREVIMOB(+) '+#13+ sFiltro;

  result := GetDataPacket (sSql);
end;

function TCtrlPrevImob.LookupLancPrevDiaImobNova(const iIdLancPrevContImob, iIdTipoCustoRecImo: Integer;
                                                 const sCodTipImovel, sFlgAjusteAnual: String ): OLEVariant;
var sSql: string;
begin
  sSql := 'SELECT IDLANCPREVDIAIMOB, VLRDIA ' +#13+
          '  FROM LANCPREVDIAIMOB ' +#13+
          ' WHERE IDLANCPREVCONTIMOB = ' + IntToStr(iIdLancPrevContImob) +#13+
          '   AND CODTIPIMOVEL       = ' + QuotedStr(sCodTipImovel)      +#13+
          '   AND FLGAJUSTEANUAL     = ' + QuotedStr(sFlgAjusteAnual)    +#13+
          '   AND IDTIPOCUSTORECIMO  = ' + IntToStr(iIdTipoCustoRecImo);

  Result := GetDataPacket( sSql );
end;


function TCtrlPrevImob.LookupLancPrevContImob(const iIdModulo, iMesCompetencia, iAnoCompetencia: integer; const dDataLancto: TDateTime): OleVariant;
var
  sSql, sFiltro: string;
  dDataIni, dDataFim: TDateTime;
  sDataIni, sDataFim: string;
begin
  if dDataLancto = -1 then begin
    dDataIni := EncodeDate(iAnoCompetencia, iMesCompetencia, 1);
    dDataFim := DiasUteis.UltDiaMes(iAnoCompetencia, iMesCompetencia);
    sDataIni := FormatDateTime('dd/mm/yyyy',dDataIni);
    sDataFim := FormatDateTime('dd/mm/yyyy',dDataFim);
    sFiltro  := '   AND ( C.DATALANCTO BETWEEN TO_DATE(' + QuotedStr(sDataIni) + ', ''DD/MM/YYYY'') '+ #13 +
                '                      AND TO_DATE(' + QuotedStr(sDataFim) + ', ''DD/MM/YYYY'') )'+ #13;
  end else begin
    sDataIni := FormatDateTime('dd/mm/yyyy',dDataLancto );
    sFiltro  := '   AND ( C.DATALANCTO = TO_DATE(' + QuotedStr(sDataIni) + ', ''DD/MM/YYYY'') ) '+ #13;
  end;

  // montar a query para exclusão da planilha
  sSql := 'SELECT ' + #13 +
          '   C.IDLANCPREVCONTIMOB, C.IDMODULO, C.PLNCODIGO, C.DATALANCTO '+ #13 +
          'FROM ' + #13 +
          '   LANCPREVCONTIMOB C ' + #13 +
          'WHERE ' + #13 +
          '   ( IDMODULO = ' + IntToStr(iIdModulo) + ' ) ' + #13 +
          sFiltro;

  result := GetDataPacket (sSql);

end;


procedure TCtrlPrevImob.SetCdsPrevImob(const Value: TCMClientDataSet);
begin
  FCdsPrevImob := Value;
end;

procedure TCtrlPrevImob.SetdbPrevImob(const Value: TDbPrevImob);
begin
  FdbPrevImob := Value;
end;

procedure TCtrlPrevImob.SetdbLancPrevContImob(
  const Value: TDbLancPrevContImob);
begin
  FdbLancPrevContImob := Value;
end;

procedure TCtrlPrevImob.SetdbLancPrevDiaImob(
  const Value: TDbLancPrevDiaImob);
begin
  FdbLancPrevDiaImob := Value;
end;

procedure TCtrlPrevImob.SetdbLancPrevImob(const Value: TDbLancPrevImob);
begin
  FdbLancPrevImob := Value;
end;

{ Este método apaga o lançamento contábil, a LANCPREVDIAIMOB e a LANCPREVIMOB
  SE bExcluiPlanilha ==>> as planilhas contábeis, bem como todos os lançamentos serão excluídos
     iAnoCompetencia, iMesCompetencia ==>> obrigatórios
     iIdTipoCustoRecImo ==>> parâmetro ignorado
  SE bExcluiPrevImob ==>> exclui tabela PREVIMOB
}
function TCtrlPrevImob.ExcluiLancPrevImob(sNomeBilhete: string;
  const bTransacao: boolean; const sFlgDiario: string;
  const iIdModulo, iIdUsuario, iIdTipoCustoRecImo, iAnoCompetencia, iMesCompetencia: integer;
  const bUsaPlanoPatro, bExcluiPlanilha: boolean; const bExcluiPrevImob: boolean;
  const sCodTipImovel: String; const dIniCtb, dFimCtb:TDateTime; const sFlgAjusteAnual: string): boolean;
var
  _CdsLancPrevImob: TCMClientDataSet;
  iQuant, iAtual, i: integer;
  sSql: string;
begin
  if ConnectionSide = cnsclient then begin
    Result := Connection.AppServer.ExcluiLancPrevImob (sNomeBilhete, bTransacao, sFlgDiario, iIdModulo, iIdUsuario, iIdTipoCustoRecImo, iAnoCompetencia, iMesCompetencia, bUsaPlanoPatro, bExcluiPlanilha, bExcluiPrevImob, sCodTipImovel, sFlgAjusteAnual);
    if not Result then
      MessageInfo := Connection.AppServer.MessageInfo;
  end else begin
    try
      _CdsLancPrevImob := TCMClientDataSet.Create (nil);
      try
        if bTransacao then StartTransaction;

        if bExcluiPrevImob then
          if not DeletePrevImob (sFlgDiario, iIdModulo, iIdTipoCustoRecImo, iAnoCompetencia, iMesCompetencia, sCodTipImovel, dIniCtb, dFimCtb, sFlgAjusteAnual) then
            raise Exception.Create ( MessageInfo );

        if bExcluiPlanilha then begin
          _CdsLancPrevImob.Data := LookupLancPrevContImob(iIdModulo, iMesCompetencia, iAnoCompetencia)
        end else
          _CdsLancPrevImob.Data := LookupLancPrevDiaImob(sFlgDiario, iIdModulo, iIdTipoCustoRecImo, iMesCompetencia, iAnoCompetencia, sCodTipImovel, sFlgAjusteAnual);

        iQuant := _CdsLancPrevImob.RecordCount;
        iAtual := 0;
        while not _CdsLancPrevImob.Eof do begin
          inc(iAtual); 
          if sNomeBilhete <> '' then DoProgresso ([sNomeBilhete, iAtual, iQuant, -1, -1]);

          // excluir PLANILHA contabil
          if bExcluiPlanilha then begin

            // excluir os registro de lancprevdiaimob - antes da lancprevcontimob - CONSTRAINT
            sSql := 'DELETE FROM LANCPREVDIAIMOB WHERE IDLANCPREVCONTIMOB = ' + _CdsLancPrevImob.FieldByName('IDLANCPREVCONTIMOB').AsString;
            if not ExecSQL(sSql) then raise Exception.Create ( MessageInfo );

            // excluir os registro de lancprevperimob - antes da lancprevcontimob - CONSTRAINT
            sSql := 'DELETE FROM LANCPREVPERIMOB WHERE IDLANCPREVCONTIMO = ' + _CdsLancPrevImob.FieldByName('IDLANCPREVCONTIMOB').AsString;
            if not ExecSQL(sSql) then raise Exception.Create ( MessageInfo );

            // excluir o registro de lancprevcontimob - antes da planilha - CONSTRAINT
            FdbLancPrevContImob.Idlancprevcontimob.AsInteger := _CdsLancPrevImob.FieldByName('IDLANCPREVCONTIMOB').AsInteger;
            if not FdbLancPrevContImob.Delete then raise Exception.Create ( FdbLancPrevContImob.MessageInfo );

            // somente excluir a planilha se a mesma existir
            if not _CdsLancPrevImob.FieldByName('PLNCODIGO').IsNull then
            //Cássio Camargo - 18/09/2008 - N. Sol 92381 -  N. Kintana 394180
//              result := Lancamento.ExcluiLancaContab (iIdUsuario,
              Result :=  ImobLancamento.ExcluiLancaContab(iIdUsuario,
                                          _CdsLancPrevImob.FieldByName('PLNCODIGO').AsFloat,
                                          iIdModulo, 0, bUsaPlanoPatro, true)
            else
              result := true;  // o registro ainda não foi integrado
          end else begin

          // excluir LANCAMENTO contabil
            if not _CdsLancPrevImob.FieldByName('LANCNUMLAN').IsNull then begin
              //Cássio Camargo - 18/09/2008 - N. Sol 92381 -  N. Kintana 394180
              result := Lancamento.ExcluiLancaContab (iIdUsuario,
              //Result := ImobLancamento.ExcluiLancaContab(iIdUsuario,
                                            _CdsLancPrevImob.FieldByName('PLNCODIGO').AsFloat,
                                            iIdModulo,
                                            _CdsLancPrevImob.FieldByName('LANCNUMLAN').AsInteger,
                                            bUsaPlanoPatro, false);
            end else
              result := true;  // o registro ainda não foi integrado
          end;
          //Cássio Camargo - 18/09/2008 - N. Sol 92381 -  N. Kintana 394180
          //if not result then raise Exception.Create ( Lancamento.MessageInfo );
          if not Result then
            raise Exception.Create(ImobLancamento.MessageInfo);

          _CdsLancPrevImob.Next;
        end;

        if not DeleteLancPrevImob(sFlgDiario, iIdTipoCustoRecImo, iAnoCompetencia, iMesCompetencia, bExcluiPlanilha, sCodTipImovel, sFlgAjusteAnual) then
          raise Exception.Create (MessageInfo);

        if bTransacao then Commit;
        Result := true;
      except
        on E:Exception do begin
          Result := false;
          if bTransacao then Rollback;
          MessageInfo := E.Message;
        end;
      end;
    finally
      FreeAndNil(_CdsLancPrevImob);
      if FileExists(sNomeBilhete) then DeleteFile(sNomeBilhete);
    end;
  end;
end;


function TCtrlPrevImob.ConsolidaLancPrevImob(sNomeBilhete: string;
         const bTransacao, bUsaPlanoPatro: boolean;
         const iIdModulo, iIdUsuario, iAnoCompetencia, iMesCompetencia,
               iIdTipoCustoRecImo: integer): boolean;
var
  _CdsLanvPrevImob, _CdsPer, _CdsPrev, _CdsLanc: TCMClientDataSet;
  iQuant, iAtual: integer;
begin
  if ConnectionSide = cnsclient then begin
    Connection.AppServer.ConsolidaLancPrevImob (sNomeBilhete, bTransacao, bUsaPlanoPatro, iIdModulo, iIdUsuario, iAnoCompetencia, iMesCompetencia, iIdTipoCustoRecImo);
  end else begin
    try
      _CdsLanvPrevImob := TCMClientDataSet.Create( nil );
      _CdsPer  := TCMClientDataSet.Create( nil );
      _CdsPrev := TCMClientDataSet.Create( nil );
      _CdsLanc := TCMClientDataSet.Create( nil );
      try
        if bTransacao then StartTransaction;

        // Exclui os lançamentos em LancPrevImob que foram excluídos do PrevImob
        _CdsLanc.Data := LookupLancPrevImob(iIdModulo, iAnoCompetencia, iMesCompetencia,
                                           iIdTipoCustoRecImo, '', -1, -1, 'N', false);
        while not _CdsLanc.Eof do begin
          _CdsPrev.Data := LookupPrevImob(-1,iIdModulo,
                                          _CdsLanc.FieldByName('IDTIPOCUSTORECIMO').AsInteger,
                                          _CdsLanc.FieldByName('CODTIPIMOVEL').AsString,
                                          _CdsLanc.FieldByName('DTINICTBDIARIA').AsDateTime,
                                          _CdsLanc.FieldByName('DTFIMCTBDIARIA').AsDateTime,
                                          iAnoCompetencia, iMesCompetencia);

          // Se não encontrar movimentação, apaga o Lançamento
          if _CdsPrev.IsEmpty then begin
            if not ExcluiLancPrevImob('', false,
                                      _CdsLanc.FieldByName('FLGDIARIO').AsString,
                                      iIdModulo, iIdUsuario,
                                      _CdsLanc.FieldByName('IDTIPOCUSTORECIMO').AsInteger,
                                      iAnoCompetencia, iMesCompetencia, bUsaPlanoPatro, False, False,
                                      _CdsLanc.FieldByName('CODTIPIMOVEL').AsString,
                                      _CdsLanc.FieldByName('DTINICTBDIARIA').AsDateTime,
                                      _CdsLanc.FieldByName('DTFIMCTBDIARIA').AsDateTime) then
              raise Exception.Create (MessageInfo);
          end;
          _CdsLanc.Next;
        end;

        // Lança nova Movimentação
        _CdsLanvPrevImob.Data := LookupCountPrevImob (iIdModulo, iMesCompetencia, iAnoCompetencia, iIdTipoCustoRecImo);
        iQuant := _CdsLanvPrevImob.RecordCount;
        iAtual := 0;
        while not _CdsLanvPrevImob.Eof do begin
          inc(iAtual);
          if sNomeBilhete <> '' then DoProgresso ([sNomeBilhete, iAtual, iQuant, -1, -1]);

          if not GravaLancPrevImob(iIdModulo, iIdUsuario,
                                   _CdsLanvPrevImob.FieldByName('IDTIPOCUSTORECIMO').AsInteger,
                                   iAnoCompetencia, iMesCompetencia,
                                   _CdsLanvPrevImob.FieldByName('CODTIPIMOVEL').AsString,
                                   _CdsLanvPrevImob.FieldByName('DTINICTBDIARIA').AsDateTime,
                                   _CdsLanvPrevImob.FieldByName('DTFIMCTBDIARIA').AsDateTime,
                                   _CdsLanvPrevImob.FieldByName('TOTAL').AsFloat,
                                   _CdsLanvPrevImob.FieldByName('TOTAL_ANO').AsFloat,
                                   bUsaPlanoPatro) then
            raise Exception.Create ( MessageInfo );

          _CdsLanvPrevImob.Next;
        end;

        // Totaliza LancPrevPerImob em LancPrevDiaImob
        _CdsPer.Data := LookupCountLancPrevPerImob(iIdModulo, iMesCompetencia, iAnoCompetencia, iIdTipoCustoRecImo);
        while not _CdsPer.Eof do begin
          // Verifica se o total do dia já existe para a Receita/TipoImovel
          _CdsLanvPrevImob.Data := LookupLancPrevDiaImobNova(_CdsPer.FieldByName('IDLANCPREVCONTIMOB').AsInteger,
                                                             _CdsPer.FieldByName('IDTIPOCUSTORECIMO').AsInteger,
                                                             _CdsPer.FieldByName('CODTIPIMOVEL').AsString,
                                                             _CdsPer.FieldByName('FLGAJUSTEANUAL').AsString);

          if _CdsLanvPrevImob.IsEmpty then begin
            dbLancPrevDiaImob.Idlancprevcontimob.AsInteger := _CdsPer.FieldByName('IDLANCPREVCONTIMOB').AsInteger;
            dbLancPrevDiaImob.IdTipoCustoRecImo.AsInteger  := _CdsPer.FieldByName('IDTIPOCUSTORECIMO').AsInteger;
            dbLancPrevDiaImob.CodTipImovel.AsString        := _CdsPer.FieldByName('CODTIPIMOVEL').AsString;
            dbLancPrevDiaImob.FlgAjusteAnual.AsString      := _CdsPer.FieldByName('FLGAJUSTEANUAL').AsString;
            dbLancPrevDiaImob.Vlrdia.AsFloat               := _CdsPer.FieldByName('TOT_DIA').AsFloat;
            if not dbLancPrevDiaImob.Insert then raise Exception.Create( dbLancPrevDiaImob.MessageInfo );
          end else begin
            // Se o valor diário tiver alterado, atualiza em LancPrevDiaImob
            if _CdsLanvPrevImob.FieldByName('VLRDIA').AsFloat <> _CdsPer.FieldByName('TOT_DIA').AsFloat then begin
              dbLancPrevDiaImob.Idlancprevdiaimob.AsInteger := _CdsLanvPrevImob.FieldByName('IDLANCPREVDIAIMOB').AsInteger;
              dbLancPrevDiaImob.LoadFromDb;
              dbLancPrevDiaImob.Vlrdia.AsFloat := _CdsPer.FieldByName('TOT_DIA').AsFloat;
              if not dbLancPrevDiaImob.Update then raise Exception.Create( dbLancPrevDiaImob.MessageInfo );

              // Exclui o Lançamento já integrado para integrar novamente com o novo valor
              if not dbLancPrevDiaImob.Lancnumlan.IsNull then begin
                if not ExcluiLancContab(iIdModulo, iIdUsuario, iMesCompetencia, iAnoCompetencia,
                                        dbLancPrevDiaImob.Idtipocustorecimo.AsInteger,
                                        dbLancPrevDiaImob.Codtipimovel.AsString,
                                        dbLancPrevDiaImob.FlgAjusteAnual.AsString, bUsaPlanoPatro) then
                  raise Exception.Create( 'Não foi possível excluir o Lançamento da Planilha' );
              end;
            end;
          end;

          _CdsPer.Next;
        end;

        if bTransacao then Commit;
        Result := True;
      except
        on E:Exception do begin
          Result := false;
          if bTransacao then Rollback;
          MessageInfo := E.Message;
        end;
      end;
    finally
      FreeAndNil( _CdsLanvPrevImob );
      FreeAndNil( _CdsPer );
      FreeAndNil( _CdsPrev );
      FreeAndNil( _CdsLanc );
    end;
  end;
end;


function TCtrlPrevImob.ExcluiLancContab(const iIdModulo, iIdUsuario, iMesCompetencia,
                                              iAnoCompetencia, iIdTipoCustoRecImo: Integer;
                                              const sCodTipImovel, sFlgAjusteAnual: String; const bUsaPlanoPatro: Boolean): Boolean;
var sSql : String;
    _cdsLancPrevDia: TCMClientDataSet;

begin
  Result := True;
  try
    try
      _cdsLancPrevDia := TCMClientDataSet.Create( nil );

      // gravar o flgsituacao = N  ( não integrada )
      sSql := 'UPDATE LANCPREVIMOB        '+#13+
              '   SET FLGSITUACAO = ''N'' '+#13+
              ' WHERE IDLANCPREVIMOB IN( SELECT IDLANCPREVIMOB '+#13+
              '                            FROM LANCPREVIMOB L, TIPOCUSTORECIMOV T '+#13+
              '                           WHERE L.IDTIPOCUSTORECIMO = T.IDTIPOCUSTORECIMO '            +#13+
              '                             AND L.MESCOMPETENCIA    = ' + IntToStr(iMesCompetencia)    +#13+
              '                             AND L.ANOCOMPETENCIA    = ' + IntToStr(iAnoCompetencia)    +#13+
              '                             AND L.IDTIPOCUSTORECIMO = ' + IntToStr(iIdTipoCustoRecImo) +#13+
              '                             AND L.CODTIPIMOVEL      = ' + QuotedStr(sCodTipImovel)     +#13+
              '                             AND L.FLGAJUSTEANUAL    = ' + QuotedStr(sFlgAjusteAnual)   +#13+
              '                             AND T.IDMODULO          = ' + IntToStr(iIdModulo) + ')';
      if not ExecSQL(sSql) then raise Exception.Create ( MessageInfo );

      // Busca todos os lançamentos da Receita / Despesa alterada na competencia
      _cdsLancPrevDia.Data := BuscaLancPrevDiaImob(iIdModulo, iMesCompetencia, iAnoCompetencia,
                                                   iIdTipoCustoRecImo, sCodTipImovel, sFlgAjusteAnual, True);

      // excluir LANCAMENTO contabil
      while not _cdsLancPrevDia.Eof do begin
        //Cássio Camargo - 18/09/2008 - N. Sol 92381 -  N. Kintana 394180
        //if not Lancamento.ExcluiLancaContab(iIdUsuario,
        if not ImobLancamento.ExcluiLancaContab(iIdUsuario,
                                            _cdsLancPrevDia.FieldByName('PLNCODIGO').AsFloat,
                                            iIdModulo,
                                            _CdsLancPrevDia.FieldByName('LANCNUMLAN').AsInteger,
                                            bUsaPlanoPatro, False) then
        //Cássio Camargo - 18/09/2008 - N. Sol 92381 -  N. Kintana 394180
          //raise Exception.Create ( Lancamento.MessageInfo );
          raise Exception.Create(ImobLancamento.MessageInfo);

        // Apaga o Nr. do lançamento na tabela LANCPREVDIAIMOB para integrar novamente
        sSql := 'UPDATE LANCPREVDIAIMOB SET LANCNUMLAN = NULL ' +#13+
                ' WHERE IDLANCPREVDIAIMOB = ' + _cdsLancPrevDia.FieldByName('IDLANCPREVDIAIMOB').AsString;
        if not ExecSQL(sSql) then raise Exception.Create ( MessageInfo );

        _cdsLancPrevDia.Next;
      end;
    except
      on E:Exception do begin
        Result := false;
        MessageInfo := E.Message;
      end;
    end;
  finally
    FreeAndNil( _cdsLancPrevDia );
  end;
end;


function TCtrlPrevImob.EncerraCompetencia(sNomeBilhete: string;
         const bTransacao: boolean; const iIdEmpresa, iIdModulo, iAnoCompetencia,
         iMesCompetencia: integer): boolean;
var
  _CdsPrevImobAtu, _CdsPrevImobNew: TCMClientDataSet;
  iQuant, iAtual: integer;
  sSql: string;
  dDataAux,dUltDiaMes: TDateTime;
  iAnoAtu, iMesAtu, iDiaAtu, iAnoNew, iMesNew, iDiaNew: word;
  bCriaNew : Boolean;
begin
  if ConnectionSide = cnsclient then begin
    Connection.AppServer.EncerraCompetencia(sNomeBilhete, bTransacao, iIdEmpresa, iIdModulo, iAnoCompetencia, iMesCompetencia);
  end else begin
    try
      _CdsPrevImobAtu := TCMClientDataSet.Create(nil);
      _CdsPrevImobNew := TCMClientDataSet.Create(nil);
      // esta associação será necessário por causa do applycds
      CdsPrevImob := _CdsPrevImobNew;
      try
        if bTransacao then StartTransaction;

        dDataAux   := EncodeDate(iAnoCompetencia, iMesCompetencia, 1);
        DecodeDate(dDataAux, iAnoatu, iMesAtu, iDiaAtu);
        dUltdiaMes := DiasUteis.UltDiaMes(iAnoAtu, iMesAtu);

        dDataAux := IncMonth (dDataAux, 1);
        DecodeDate(dDataAux, iAnoNew, iMesNew, iDiaNew);

        _CdsPrevImobAtu.Data := LookupPrevImob (-1, iIdModulo, -1, '', -1, -1, iAnoCompetencia, iMesCompetencia, '');
        iQuant := _CdsPrevImobAtu.RecordCount;
        iAtual := 0;

        // abrir o _CdsPrevImovNew para poder inserir os dados nele
        _CdsPrevImobNew.Data := LookupPrevImob(-2);  // abrir em branco IdPrevImob = -2

        while not _CdsPrevImobAtu.Eof do begin
          inc(iAtual);
          if sNomeBilhete <> '' then DoProgresso ([sNomeBilhete, iAtual, iQuant, -1, -1]);

          bCriaNew := False;
          // Apenas registra a previsão para Mensal - teve a despesa até o fim do mês
          if (_CdsPrevImobAtu.FieldByName('FLGDIARIO').AsString = 'M') and
             (_CdsPrevImobAtu.FieldByName('DTFIMCTBDIARIA').AsDateTime = dUltDiaMes) then begin
            bCriaNew := True;
          end;

          // Apenas registra a previsão para Anual - Nova competencia compreendida entre o período da contabilização
          if (_CdsPrevImobAtu.FieldByName('FLGDIARIO').AsString = 'A') and
             (_CdsPrevImobAtu.FieldByName('DTINICTBDIARIA').AsDateTime < dDataAux ) and
             (_CdsPrevImobAtu.FieldByName('DTFIMCTBDIARIA').AsDateTime > dDataAux ) then begin
            bCriaNew := True;
          end;

          if bCriaNew then begin
            _CdsPrevImobNew.Insert;
            _CdsPrevImobNew.FieldByName('CODTIPIMOVEL').AsString := _CdsPrevImobAtu.FieldByName('CODTIPIMOVEL_ATU').AsString;
            _CdsPrevImobNew.FieldByName('IDIMOVEL').AsInteger := _CdsPrevImobAtu.FieldByName('IDIMOVEL').AsInteger;
            _CdsPrevImobNew.FieldByName('IDTIPOCUSTORECIMO').AsInteger := _CdsPrevImobAtu.FieldByName('IDTIPOCUSTORECIMO').AsInteger;
            _CdsPrevImobNew.FieldByName('MESCOMPETENCIA').AsInteger := iMesNew;
            _CdsPrevImobNew.FieldByName('ANOCOMPETENCIA').AsInteger := iAnoNew;
            _CdsPrevImobNew.FieldByName('VLRMES').AsFloat := _CdsPrevImobAtu.FieldByName('VLRMES').AsFloat;
            _CdsPrevImobNew.FieldByName('VLRANO').AsFloat := _CdsPrevImobAtu.FieldByName('VLRANO').AsFloat;

            if _CdsPrevImobAtu.FieldByName('FLGDIARIO').AsString = 'M' then begin
              _CdsPrevImobNew.FieldByName('DTINICTBDIARIA').AsDateTime := StrToDate( '01/'+ IntToStrZeroPad(iMesNew,2) + '/' + IntToStrZeroPad(iAnoNew,4) );
              _CdsPrevImobNew.FieldByName('DTFIMCTBDIARIA').AsDateTime := DiasUteis.UltDiaMes(iAnoNew, iMesNew);
            end else begin
              _CdsPrevImobNew.FieldByName('DTINICTBDIARIA').AsDateTime := _CdsPrevImobAtu.FieldByName('DTINICTBDIARIA').AsDateTime;
              _CdsPrevImobNew.FieldByName('DTFIMCTBDIARIA').AsDateTime := _CdsPrevImobAtu.FieldByName('DTFIMCTBDIARIA').AsDateTime;
            end;
            _CdsPrevImobNew.Post;
          end;
          _CdsPrevImobAtu.Next;
        end;

        if not GravaPrevImob (false) then
          raise Exception.Create ( MessageInfo );

        // atualizar os parâmetros do sistema
        if iIdModulo = 64 then begin
          FdbParamImovel.Idpessoa.AsInteger := iIdEmpresa;
          if not FdbParamImovel.LoadFromDb then
            raise Exception.Create (FdbParamImovel.MessageInfo);
          FdbParamImovel.Mescompetencia.AsInteger := iMesCompetencia;
          FdbParamImovel.Anocompetencia.AsInteger := iAnoCompetencia;
          if not FdbParamImovel.Update then
            raise Exception.Create (FdbParamImovel.MessageInfo);
        end else begin
          FdbParamAlienacao.Idpessoa.AsInteger := iIdEmpresa;
          if not FdbParamAlienacao.LoadFromDb then
            raise Exception.Create (FdbParamAlienacao.MessageInfo);
          FdbParamAlienacao.MesCompetencia.AsInteger := iMesCompetencia;
          FdbParamAlienacao.Anocompetencia.AsInteger := iAnoCompetencia;
          if not FdbParamAlienacao.Update then
            raise Exception.Create (FdbParamAlienacao.MessageInfo);
        end;

        if bTransacao then Commit;
        Result := True;
      except
        on E:Exception do begin
          Result := false;
          if bTransacao then Rollback;
          MessageInfo := E.Message;
        end;
      end;
    finally
      FreeAndNil (_CdsPrevImobAtu);
      FreeAndNil (_CdsPrevImobNew);
    end;
  end;
end;


function TCtrlPrevImob.DesfazEncerraCompetencia(sNomeBilhete: string;
  const bTransacao: boolean; const iIdEmpresa, iIdModulo, iIdUsuario, iAnoCompetencia,
  iMesCompetencia: integer; const bUsaPlanoPatro, bExcluiPlanilha: boolean): boolean;
var
  iQuant, iAtual: integer;
  dDataAux: TDateTime;
  iAnoNew, iMesNew, iDiaNew: word;
begin
  if ConnectionSide = cnsclient then begin
    Connection.AppServer.DesfazEncerraCompetencia(sNomeBilhete, bTransacao, iIdEmpresa, iIdModulo, iIdUsuario, iAnoCompetencia, iMesCompetencia, bUsaPlanoPatro, bExcluiPlanilha);
  end else begin
    try
      if bTransacao then StartTransaction;

      dDataAux := EncodeDate(iAnoCompetencia, iMesCompetencia, 1);
      dDataAux := IncMonth (dDataAux, -2);
      DecodeDate(dDataAux, iAnoNew, iMesNew, iDiaNew);

      // Helen - SOL: 172902 , 172902/8221 KTN: 1577344 , 1577381 - Inicio
      if (iMesCompetencia > 0) and (iAnoCompetencia > 0) then
      begin
          if not CtrlContab.TestaDataBloqueadaProc(Sistema.idEmpresa,Sistema.idModulo,('01/'+ IntToStr(iMesCompetencia) +'/'+ IntToStr(iAnoCompetencia))) then
             raise exception.Create ( 'Período contábil bloqueado. Não será possível excluir lançamentos.' );
      end;
      // Helen - SOL: 172902 , 172902/8221 KTN: 1577344 , 1577381 - Fim

      if not ExcluiLancPrevImob(sNomeBilhete, false, '', iIdModulo, iIdUsuario, -1, iAnoCompetencia,
                                iMesCompetencia, bUsaPlanoPatro, bExcluiPlanilha, true, '', -1, -1, '') then
        raise exception.Create ( MessageInfo );

      // atualizar os parâmetros do sistema
      if iIdModulo = 64 then begin
        FdbParamImovel.Idpessoa.AsInteger := iIdEmpresa;
        if not FdbParamImovel.LoadFromDb then
          raise Exception.Create (FdbParamImovel.MessageInfo);
        FdbParamImovel.Mescompetencia.AsInteger := iMesNew;
        FdbParamImovel.Anocompetencia.AsInteger := iAnoNew;
        if not FdbParamImovel.Update then
          raise Exception.Create (FdbParamImovel.MessageInfo);
      end else begin
        FdbParamAlienacao.Idpessoa.AsInteger := iIdEmpresa;
        if not FdbParamAlienacao.LoadFromDb then
          raise Exception.Create (FdbParamAlienacao.MessageInfo);
        FdbParamAlienacao.Mescompetencia.AsInteger := iMesNew;
        FdbParamAlienacao.Anocompetencia.AsInteger := iAnoNew;
        if not FdbParamAlienacao.Update then
          raise Exception.Create (FdbParamAlienacao.MessageInfo);
      end;

      if bTransacao then Commit;
      Result := True;
    except
      on E:Exception do begin
        Result := false;
        if bTransacao then Rollback;
        MessageInfo := E.Message;
      end;
    end;
  end;
end;


function TCtrlPrevImob.RegistraPrevImob(sNomeBilhete: string;
         const bTransacao: boolean; const sFlgDiario: string;
         const iIdModulo, iAnoCompetencia, iMesCompetencia,
         iIdTipoCustoRecImo, iImovelMestre, iImovel: integer): boolean;
var
  _CdsLancamentosImovel: TCMClientDataSet;
  iQuant, iAtual, iMeses: integer;
  iDiaAnt, iMesAnt, iAnoAnt: Integer;
  dDataAux: TDateTime;
  dIniCtbNew, dFimCtbNew : TDateTime;
begin
  try
    try
      _CdsLancamentosImovel := TCMClientDataSet.Create(nil);

      if bTransacao then StartTransaction;

      if sFlgDiario = 'M' then begin
        // para calcular a previsão o mês é o anterior
        dDataAux := EncodeDate(iAnoCompetencia, iMesCompetencia, 1);
        dDataAux := IncMonth(dDataAux, -1);
        DecodeDate(dDataAux, iAnoAnt, iMesAnt, iDiaAnt);
      end else begin
        iAnoAnt := iAnoCompetencia - 1;
        iMesAnt := -1;
        iDiaAnt := -1;
      end;

      if iIdModulo = 64 then begin
        _CdsLancamentosImovel.Data := CtrlLancamentosImovel.LookupLancamentosDiarios
                                      (iAnoAnt, iMesAnt, sFlgDiario,
                                      iIdTipoCustoRecImo, iImovelMestre, iImovel);
      end else begin
        _CdsLancamentosImovel.Data := CtrlParcFinancImov.MontaLancamentosDiarios(
                                      iAnoCompetencia, iMesCompetencia,
                                      sFlgDiario,iIdTipoCustoRecImo,-1);
      end;
      iQuant := _CdsLancamentosImovel.RecordCount + 1;
      iAtual := 1;

      DoProgresso ([sNomeBilhete, iAtual, iQuant, -1, -1]);

      // deletar o REGISTRO dA PREVISÃO ANTERIOR
      if not DeletePrevImob (sFlgDiario, iIdModulo, iIdTipoCustoRecImo, iAnoCompetencia,
                      iMesCompetencia, '',  -1, -1, '', iImovelMestre, iImovel) then
        raise Exception.Create ( MessageInfo );

      while not _CdsLancamentosImovel.Eof do begin
        Inc(iAtual);
        DoProgresso ([sNomeBilhete, iAtual, iQuant, -1, -1]);

        // Só gera a previsão se a competencia da contab. do mes anterior for o mes cheio
        if _CdsLancamentosImovel.FieldByName('DTFIMCTBDIARIA').AsDateTime = DiasUteis.UltDiaMes(iAnoAnt, iMesAnt) then begin

          // define novo periodo de competencia da contab. diaria
          if sFlgDiario = 'M' then begin
            dIniCtbNew := EncodeDate(iAnoCompetencia, iMesCompetencia, 1);
            dFimCtbNew := DiasUteis.UltDiaMes(iAnoCompetencia, iMesCompetencia);
          end else begin
            if _CdsLancamentosImovel.FieldByName('DTINICTBDIARIA').IsNull then begin
              dIniCtbNew := StrToDate('01/01/' + IntToStr(iAnoCompetencia) );
              dFimCtbNew := StrToDate('31/12/' + IntToStr(iAnoCompetencia) );
            end else begin
              dIniCtbNew := _CdsLancamentosImovel.FieldByName('DTINICTBDIARIA').AsDateTime;
              dFimCtbNew := _CdsLancamentosImovel.FieldByName('DTFIMCTBDIARIA').AsDateTime;
            end;
          end;

          FdbPrevImob.Codtipimovel.AsString       := _CdsLancamentosImovel.FieldByName('CODTIPIMOVEL').AsString;
          FdbPrevImob.Idimovel.AsInteger          := _CdsLancamentosImovel.FieldByName('IDIMOVEL').AsInteger;
          FdbPrevImob.Idtipocustorecimo.AsInteger := _CdsLancamentosImovel.FieldByName('IDTIPOCUSTORECIMO').AsInteger;
          FdbPrevImob.Mescompetencia.AsInteger    := iMesCompetencia;
          FdbPrevImob.Anocompetencia.AsInteger    := iAnoCompetencia;
          FdbPrevImob.Dtinictbdiaria.AsDateTime   := dIniCtbNew;
          FdbPrevImob.Dtfimctbdiaria.AsDateTime   := dFimCtbNew;
          FdbPrevImob.FlgTipoLanc.AsString        := 'P';

          // se anual gravar o vlrano e vlrmes = vlrano / Nr. de Meses do período ( geralmente 12 )
          if sFlgDiario = 'M' then
            FdbPrevImob.Vlrmes.AsFloat := _CdsLancamentosImovel.FieldByName('VLRTOTAL').AsFloat
          else begin
            iMeses := DiasUteis.IntervaloMeses(dIniCtbNew, dFimCtbNew) + 1 ;
            FdbPrevImob.Vlrmes.AsFloat := ComunsImobiliario.Arredonda(_CdsLancamentosImovel.FieldByName('VLRTOTAL').AsFloat / iMeses, 2);
            FdbPrevImob.Vlrano.AsFloat := _CdsLancamentosImovel.FieldByName('VLRTOTAL').AsFloat
          end;

          if not FdbPrevImob.Insert then raise Exception.Create ( FdbPrevImob.MessageInfo );
        end;
        _CdsLancamentosImovel.Next;
      end;
      if bTransacao then Commit;
      Result := True;
    except
      on E:Exception do begin
        Result := false;
        if bTransacao then Rollback;
        MessageInfo := E.Message;
      end;
    end;
  finally
    FreeAndNil (_CdsLancamentosImovel);
  end;
end;


// verificar com Vinícius a possibilidade de se colocar filtros de imovel e mestre
function TCtrlPrevImob.AjustaPrevImob(sNomeBilhete: string;
         const bTransacao: boolean; const sFlgDiario: string; const iIdModulo,
         iAnoCompetencia, iMesCompetencia, iIdTipoCustoRecImo, iImovelMestre, iImovel: integer;
         const bEncerr: boolean): boolean;
var
  iQuant, iAtual, iMeses: integer;
  _CdsPrevImob, _CdsPrevImobComp: TCMClientDataSet;
  iIdImovelAtu, iIdImovelComp, iIdTipoCustoRecImoAtu, iIdTipoCustoRecImoComp: integer;
  sChaveAtu, sChaveComp: string;
  sCodTipImovelAtu, sCodTipImovelComp: string;
  dIniCtbAtu, dFimCtbAtu, dIniCtbComp, dFimCtbComp: TDateTime;
  iDia, iMes, iAno, iDia2, iMes2, iAno2 : integer;
begin
  if ConnectionSide = cnsclient then begin
    Connection.AppServer.AjustaPrevImob(sNomeBilhete, bTransacao, sFlgDiario, iIdModulo, iAnoCompetencia, iMesCompetencia, iIdTipoCustoRecImo, bEncerr);
  end else begin
    try
      if bTransacao then StartTransaction;
      try
        _CdsPrevImob     := TCMClientDataSet.Create (nil);
        _CdsPrevImobComp := TCMClientDataSet.Create (nil);

        // esta associação será necessário por causa do applycds
        CdsPrevImob := _CdsPrevImobComp;

        // o clientDataSet deve estar ordenado para a execução dos lotes encaixantes
        _CdsPrevImob.IndexFieldNames := 'IDIMOVEL;IDTIPOCUSTORECIMO;CODTIPIMOVEL;DTINICTBDIARIA;DTFIMCTBDIARIA';
        _CdsPrevImobComp.IndexDefs.Add('Indice', 'IDIMOVEL;IDTIPOCUSTORECIMO;CODTIPIMOVEL;DTINICTBDIARIA;DTFIMCTBDIARIA', [ixUnique]);
        _CdsPrevImobComp.IndexName :=  'Indice';

        // montar clientDataSet com resultado da previsão atual
        _CdsPrevImobComp.Data := LookupPrevImob(-1, iIdModulo, iIdTipoCustoRecImo, '', -1, -1,
                                    iAnoCompetencia, iMesCompetencia, sFlgDiario);
        // montar clientDataSet com resultado efetivo do mês/ano
        if iIdModulo = 64 then begin
          _CdsPrevImob.Data := CtrlLancamentosImovel.LookupLancamentosDiarios(
                                 iAnoCompetencia,iMesCompetencia, sFlgDiario,
                                 iIdTipoCustoRecImo, iImovelMestre, iImovel);
        end else begin
          _CdsPrevImob.Data := CtrlParcFinancImov.MontaLancamentosDiarios(
                                 iAnoCompetencia, iMesCompetencia,
                                 sFlgDiario,iIdTipoCustoRecImo,-1);
        end;
        iQuant := _CdsPrevImobComp.RecordCount;
        iAtual := 0;

        // montar o lotes encaixantes
        while not _CdsPrevImobComp.Eof do begin
          Inc(iAtual);
          DoProgresso ([sNomeBilhete, iAtual, iQuant, -1, -1]);
          iIdImovelComp          := _CdsPrevImobComp.FieldByName('IDIMOVEL').AsInteger;
          iIdTipoCustoRecImoComp := _CdsPrevImobComp.FieldByName('IDTIPOCUSTORECIMO').AsInteger;
          sCodTipImovelComp      := _CdsPrevImobComp.FieldByName('CODTIPIMOVEL').AsString;
          dIniCtbComp            := _CdsPrevImobComp.FieldByName('DTINICTBDIARIA').AsDatetime;
          dFimCtbComp            := _CdsPrevImobComp.FieldByName('DTFIMCTBDIARIA').AsDatetime;

          iIdImovelAtu          := _CdsPrevImob.FieldByName('IDIMOVEL').AsInteger;
          iIdTipoCustoRecImoAtu := _CdsPrevImob.FieldByName('IDTIPOCUSTORECIMO').AsInteger;
          sCodTipImovelAtu      := _CdsPrevImob.FieldByName('CODTIPIMOVEL').AsString;
          dIniCtbAtu            := _CdsPrevImob.FieldByName('DTINICTBDIARIA').AsDatetime;
          dFimCtbAtu            := _CdsPrevImob.FieldByName('DTFIMCTBDIARIA').AsDatetime;

          // Define nr. de meses para rateio das despesas anuais
          iMeses := DiasUteis.IntervaloMeses(dIniCtbAtu, dFimCtbAtu) + 1;
          // Ajuste bug do padrão ( soma um mes a menos quando o periodo encerra no dia
          // anterior em anos diferentes. Ex.: 20/02/2003 a 19/01/2004 = 11 meses
          DecodeDate(dFimCtbAtu, iAno, iMes, iDia );
          DecodeDate((dIniCtbAtu - 1), iAno2, iMes2, iDia2 );
          if (iAno <> iAno2) and (iDia = iDia2) and (iMes = iMes2-1) then Inc(iMeses);

          sChaveAtu := IntToStrZeroPad (iIdImovelAtu, 10) +
                       IntToStrZeroPad (iIdTipoCustoRecImoAtu, 10)+
                       sCodTipImovelAtu + FormatDateTime('YYYY/MM/DD', dIniCtbAtu) +
                       FormatDateTime('YYYY/MM/DD', dFimCtbAtu);

          sChaveComp := IntToStrZeroPad (iIdImovelComp, 10) +
                        IntToStrZeroPad (iIdTipoCustoRecImoComp, 10)+
                        sCodTipImovelComp + FormatDateTime('YYYY/MM/DD', dIniCtbComp) +
                        FormatDateTime('YYYY/MM/DD', dFimCtbComp);

          // verificar se o _CdsPrevImob ( ATU ) for eof
          // neste caso gravar o VLRMES com 0
          if _CdsPrevImob.Eof then begin
            // zerar a previsão apenas no encerramento
            if bEncerr then begin
              _CdsPrevImobComp.Edit;
              _CdsPrevImobComp.FieldByName('VLRMES').AsFloat := 0;
              _CdsPrevImobComp.FieldByName('VLRANO').AsFloat := 0;
              _CdsPrevImobComp.Post;
            end;
            _CdsPrevImobComp.Next;

          // verificação se existe no ( efetivo = ATU ) e não existe no ( previsto = COMP )
          // ATU < COMP
          // neste caso o registro deverá ser incluído
          end else if sChaveAtu < sChaveComp then begin

            // Se alterou apenas o periodo da contabilização, edita os valores
            if copy(sChaveAtu,1,25) = copy(sChaveComp,1,25) then begin
              _CdsPrevImobComp.Edit;
            end else begin
              _CdsPrevImobComp.Insert;
              _CdsPrevImobComp.FieldByName('CODTIPIMOVEL').AsString       := sCodTipImovelAtu;
              _CdsPrevImobComp.FieldByName('IDIMOVEL').AsInteger          := iIdImovelAtu;
              _CdsPrevImobComp.FieldByName('IDTIPOCUSTORECIMO').AsInteger := iIdTipoCustoRecImoAtu;
            end;

            _CdsPrevImobComp.FieldByName('MESCOMPETENCIA').AsInteger    := iMesCompetencia;
            _CdsPrevImobComp.FieldByName('ANOCOMPETENCIA').AsInteger    := iAnoCompetencia;
            _CdsPrevImobComp.FieldByName('DTINICTBDIARIA').AsDateTime   := dIniCtbAtu;
            _CdsPrevImobComp.FieldByName('DTFIMCTBDIARIA').AsDateTime   := dFimCtbAtu;
            _CdsPrevImobComp.FieldByName('FLGTIPOLANC').AsString        := 'R';

            if sFlgDiario = 'A' then begin
              _CdsPrevImobComp.FieldByName('VLRANO').AsFloat := _CdsPrevImob.FieldByName('VLRTOTAL').AsFloat;
              _CdsPrevImobComp.FieldByName('VLRMES').AsFloat := ComunsImobiliario.Arredonda(_CdsPrevImob.FieldByName('VLRTOTAL').AsFloat / iMeses, 2);
            end else
              _CdsPrevImobComp.FieldByName('VLRMES').AsFloat := _CdsPrevImob.FieldByName('VLRTOTAL').AsFloat;

            _CdsPrevImobComp.Post;

            _CdsPrevImobComp.Next;
            _CdsPrevImob.Next;

          // verificação se existe no ( previsto = COMP ) e não existe no ( efetivo = ATU )
          // ATU > COMP
          // neste caso atualizar o VLRMES com 0
          end else if sChaveAtu > sChaveComp then begin

            // Se foi alterado apenas as data da contabilização, ou se
            // o lançamento previsto já foi realizado, exclui o registro
            if (copy(sChaveAtu,1,25) = copy(sChaveComp,1,25)) or
               (_CdsPrevImobComp.FieldByName('FLGTIPOLANC').AsString = 'R') then begin
              _CdsPrevImobComp.Delete;
            end else begin
              // zerar a previsão apenas no encerramento
              if bEncerr then begin
                _CdsPrevImobComp.Edit;
                _CdsPrevImobComp.FieldByName('VLRMES').AsFloat := 0;
                _CdsPrevImobComp.FieldByName('VLRANO').AsFloat := 0;
                _CdsPrevImobComp.Post;
              end;
              _CdsPrevImobComp.Next;
            end;

          // verificar se existe na previsão (COMP) e existe no realizado (ATU)
          // COMP = ATU
          // Neste caso apenas atualizar o COMP.VLRMES com ATU.VLRTOTAL
          end else if sChaveComp = sChaveAtu then begin
            _CdsPrevImobComp.Edit;
            _CdsPrevImobComp.FieldByName('FLGTIPOLANC').AsString := 'R';
            if sFlgDiario = 'A' then begin   // anual
              // valor mensal
              _CdsPrevImobComp.FieldByName('VLRANO').AsFloat := _CdsPrevImob.FieldByName('VLRTOTAL').AsFloat;
              _CdsPrevImobComp.FieldByName('VLRMES').AsFloat := ComunsImobiliario.Arredonda(_CdsPrevImob.FieldByName('VLRTOTAL').AsFloat/iMeses, 2);;
            end else
              _CdsPrevImobComp.FieldByName('VLRMES').AsFloat := _CdsPrevImob.FieldByName('VLRTOTAL').AsFloat;

            _CdsPrevImobComp.Post;

            _CdsPrevImobComp.Next;
            _CdsPrevImob.Next;
          end;
        end;

        // varrer o _CdsPrevImob (EFETIVO) até eof para gravar o final do registro, se for o caso
        while not _CdsPrevImob.Eof do begin
          dIniCtbAtu := _CdsPrevImob.FieldByName('DTINICTBDIARIA').AsDatetime;
          dFimCtbAtu := _CdsPrevImob.FieldByName('DTFIMCTBDIARIA').AsDatetime;

          // Define nr. de meses para rateio das despesas anuais
          iMeses := DiasUteis.IntervaloMeses(dIniCtbAtu, dFimCtbAtu) + 1;
          // Ajuste bug do padrão ( soma um mes a menos quando o periodo encerra no dia
          // anterior em anos diferentes. Ex.: 20/02/2003 a 19/01/2004 = 11 meses
          DecodeDate(dFimCtbAtu, iAno, iMes, iDia );
          DecodeDate((dIniCtbAtu - 1), iAno2, iMes2, iDia2 );
          if (iAno <> iAno2) and (iDia = iDia2) and (iMes = iMes2-1) then Inc(iMeses);

          _CdsPrevImobComp.Insert;
          _CdsPrevImobComp.FieldByName('CODTIPIMOVEL').AsString       := _CdsPrevImob.FieldByName('CODTIPIMOVEL').AsString;
          _CdsPrevImobComp.FieldByName('IDIMOVEL').AsInteger          := _CdsPrevImob.FieldByName('IDIMOVEL').AsInteger;
          _CdsPrevImobComp.FieldByName('IDTIPOCUSTORECIMO').AsInteger := _CdsPrevImob.FieldByName('IDTIPOCUSTORECIMO').AsInteger;
          _CdsPrevImobComp.FieldByName('MESCOMPETENCIA').AsInteger    := iMesCompetencia;
          _CdsPrevImobComp.FieldByName('ANOCOMPETENCIA').AsInteger    := iAnoCompetencia;
          _CdsPrevImobComp.FieldByName('DTINICTBDIARIA').AsDateTime   := dIniCtbAtu;
          _CdsPrevImobComp.FieldByName('DTFIMCTBDIARIA').AsDateTime   := dFimCtbAtu;
          _CdsPrevImobComp.FieldByName('FLGTIPOLANC').AsString        := 'R';

          if sFlgDiario = 'A' then begin   // anual
            _CdsPrevImobComp.FieldByName('VLRANO').AsFloat := _CdsPrevImob.FieldByName('VLRTOTAL').AsFloat;
            _CdsPrevImobComp.FieldByName('VLRMES').AsFloat := ComunsImobiliario.Arredonda(_CdsPrevImob.FieldByName('VLRTOTAL').AsFloat / iMeses, 2);
          end else
            _CdsPrevImobComp.FieldByName('VLRMES').AsFloat := _CdsPrevImob.FieldByName('VLRTOTAL').AsFloat;

          _CdsPrevImobComp.Post;

          _CdsPrevImob.Next;
        end;

        // aplica as alterações e inserções
        if not GravaPrevImob(false) then
          raise Exception.Create ( MessageInfo );

        if bTransacao then Commit;
        Result := True;
      except
        on E:Exception do begin
          Result := false;
          if bTransacao then Rollback;
          MessageInfo := E.Message;
        end;
      end;
    finally
      FreeAndNil (_CdsPrevImob);
      FreeAndNil (_CdsPrevImobComp);
    end;
  end;
end;


{ Result = true - nenhum dos lançamentos deu erro
  Result = true - algum dos lançamentos deu erro
  Atenção, mesmo que exista algum erro em um lançamento o processo não é
  abortado, executando a tentativa de integração dos demais lançamentos
}
function TCtrlPrevImob.IntegraLancDiario(sNomeBilhete: string; const iIdEmpresa, iIdModulo, iIdUsuario, iAnoCompetencia, iMesCompetencia, iPlanoPrev, iPatro : Integer;
                                         const sPlanoPrev, sPatro : String; const bUsaPlanoPatro:Boolean; const iIdTipoCustoRecImo: integer): boolean;
var
  _CdsLancPrevImob, _CdsLancPrevDiaImob: TCMClientDataSet;
  iQuant, iAtual, iPlanilha, iCodErro: integer;
  sMsg, sRecPag, sSql: string;
  ParamContabeis: TParamContabeisMT;
  sCCDeb, sCCCre, sCtaDeb, sCtaCre: string;
  fValorLanc: Extended;
begin
  if ConnectionSide = cnsclient then begin
    Connection.AppServer.IntegraLancDiario (sNomeBilhete, iIdEmpresa, iIdModulo, iIdUsuario, iAnoCompetencia, iMesCompetencia, bUsaPlanoPatro, iIdTipoCustoRecImo);
  end else begin
    Result := True;
    try
      _CdsLancPrevImob      := TCMClientDataSet.Create( nil );
      _CdsLancPrevDiaImob   := TCMClientDataSet.Create( nil );
      _CdsLancPrevImob.Data := LookupLancPrevImobUnico(iIdModulo, iAnoCompetencia, iMesCompetencia, iIdTipoCustoRecImo);
      iQuant := _CdsLancPrevImob.RecordCount;
      iAtual := 1;
      // força um do progresso para montar a tela
      DoProgresso ([sNomeBilhete, iAtual, iQuant, -1, -1, '']);

      while not _CdsLancPrevImob.Eof do begin
        StartTransaction;
        try
          // seta se é a (R)receber ou (P)pagar
          if _CdsLancPrevImob.FieldByName('RECCUSTO').AsString = 'R' then
               sRecPag := 'R'
          else sRecPag := 'P';

          // zera parametros contabeis
          CtrlPadrLancImovel.ZeraPadrLancContabil (ParamContabeis);

          // definir parâmetros contábeis
          if not CtrlPadrLancImovel.BuscaPadrLancContabil(ParamContabeis, iCodErro,
                      sRecPag, True, iIdEmpresa, iIdModulo,
                      _CdsLancPrevImob.FieldByName('IDTIPOCUSTORECIMO').AsInteger,
                      _CdsLancPrevImob.FieldByName('CODTIPIMOVEL').AsString) then
            raise Exception.Create ( CtrlPadrLancImovel.MessageInfo );

          // verificar se valor negativo = ESTORNO
          if _CdsLancPrevImob.FieldByName('VLRMES').AsFloat < 0 then begin
            sCtaCre := ParamContabeis.sContaContabilDebito;
            sCtaDeb := ParamContabeis.sContaContabilCredito;
            sCCCre  := ParamContabeis.sCentroCustoDebito;
            sCCDeb  := ParamContabeis.sCentroCustoCredito;
          end else begin
            sCtaCre := ParamContabeis.sContaContabilCredito;
            sCtaDeb := ParamContabeis.sContaContabilDebito;
            sCCCre  := ParamContabeis.sCentroCustoCredito;
            sCCDeb  := ParamContabeis.sCentroCustoDebito;
          end;

          // definir histórico contábil - Adriana Funcef
          if _CdsLancPrevImob.FieldByName('FLGAJUSTEANUAL').AsString = 'N' then
            ParamContabeis.sHistoricoCtb := _CdsLancPrevImob.FieldByName('CODTIPIMOVEL').AsString + ' - ' +
                                            _CdsLancPrevImob.FieldByName('DESCCUSTORECIMO').AsString + ' - ' +
                                            sPlanoPrev + '/' + sPatro
          else  // ajuste anual
            ParamContabeis.sHistoricoCtb := 'AJUSTE ANUAL - ' +
                                            _CdsLancPrevImob.FieldByName('CODTIPIMOVEL').AsString + ' - ' +
                                            _CdsLancPrevImob.FieldByName('DESCCUSTORECIMO').AsString + ' - ' +
                                            sPlanoPrev + '/' + sPatro;

          // se parametrização ok integrar lançamento
          _CdsLancPrevDiaImob.Data := BuscaLancPrevDiaImob(iIdModulo, iMesCompetencia, iAnoCompetencia,
                                                           _CdsLancPrevImob.FieldByName('IDTIPOCUSTORECIMO').AsInteger,
                                                           _CdsLancPrevImob.FieldByName('CODTIPIMOVEL').AsString,
                                                           _CdsLancPrevImob.FieldByName('FLGAJUSTEANUAL').AsString, False);
          while not _CdsLancPrevDiaImob.Eof do begin
            fValorLanc := _CdsLancPrevDiaImob.FieldByName('VLRDIA').AsFloat;
            if fValorLanc < 0 then fValorLanc := fValorLanc * -1;

            // integrar contabilidade
            iPlanilha := _CdsLancPrevDiaImob.FieldByName('PLNCODIGO').AsInteger;
            //Cássio Camargo - 18/09/2008 - N. Sol 92381 -  N. Kintana 394180
            if not Lancamento.InsereLancaContab ( '2', iIdEmpresa,
//            if not ImobLancamento.InsereLancaContab('2', iIdEmpresa,
                                iIdModulo, iIdUsuario,
                                IntegraBack.Plano,
                                ParamContabeis.iUnidNegoc, 0, 0,
                                iPlanoPrev,
                                iPatro,
                                iPlanilha, 0,
                                DateToStr(_CdsLancPrevDiaImob.FieldByName('DATALANCTO').AsDateTime),
                                '', ParamContabeis.sHistoricoCtb, '', '', '', '',
                                '', sCCDeb, sCtaDeb, sCCCre, sCtaCre, '',
                                fValorLanc, false, bUsaPlanoPatro,
                                ParamContabeis.iIdSegregaCriter,
                                _CdsLancPrevDiaImob.FieldByName('DATALANCTO').AsDateTime) then
              //Cássio Camargo - 18/09/2008 - N. Sol 92381 -  N. Kintana 394180
              raise Exception.Create ( Lancamento.MessageInfo )
              //raise Exception.Create(ImobLancamento.MessageInfo)
            else begin
              // Gravar lancprevcontimob
              if iPlanilha = 0 then begin
                sSql := 'UPDATE LANCPREVCONTIMOB ' + #13 +
                //Cássio Camargo - 18/09/2008 - N. Sol 92381 -  N. Kintana 394180
                        'SET PLNCODIGO = ' + FloatToStr(Lancamento.RetornoPlnCodigo)+ #13+
                //        '  SET PLNCODIGO = ' + FloatToStr(ImobLancamento.RetornoPlnCodigo) + #13 +
                        'WHERE IDLANCPREVCONTIMOB = ' + _CdsLancPrevDiaImob.FieldByName('IDLANCPREVCONTIMOB').AsString + #13;
                if not ExecSQL(sSql) then raise Exception.Create ( MessageInfo );
              end;

              // Grava o Nr. do Lançamento
              sSql := 'UPDATE LANCPREVDIAIMOB ' + #13 +
              //Cássio Camargo - 18/09/2008 - N. Sol 92381 -  N. Kintana 394180
                      'SET LANCNUMLAN = ' + IntToStr ( Lancamento.NumLancamento ) + #13 +
              //        '  SET LANCNUMLAN = ' + IntToStr(ImobLancamento.NumLancamento) + #13 +
                      'WHERE IDLANCPREVDIAIMOB = ' + _CdsLancPrevDiaImob.FieldByName('IDLANCPREVDIAIMOB').AsString + #13;
              if not ExecSQL(sSql) then raise Exception.Create ( MessageInfo );
            end;

            _CdsLancPrevDiaImob.Next;
          end;

          // gravar o flgsituacao = I  ( integrada )
          sSql := 'UPDATE LANCPREVIMOB        '+#13+
                  '   SET FLGSITUACAO = ''I'' '+#13+
                  ' WHERE IDLANCPREVIMOB IN( SELECT IDLANCPREVIMOB '+#13+
                  '                            FROM LANCPREVIMOB L, TIPOCUSTORECIMOV T '+#13+
                  '                           WHERE L.IDTIPOCUSTORECIMO = T.IDTIPOCUSTORECIMO '      +#13+
                  '                             AND L.MESCOMPETENCIA    = ' + IntToStr(iMesCompetencia) +#13+
                  '                             AND L.ANOCOMPETENCIA    = ' + IntToStr(iAnoCompetencia) +#13+
                  '                             AND L.IDTIPOCUSTORECIMO = ' + IntToStr(_CdsLancPrevImob.FieldByName('IDTIPOCUSTORECIMO').AsInteger) +#13+
                  '                             AND L.CODTIPIMOVEL      = ' + QuotedStr(_CdsLancPrevImob.FieldByName('CODTIPIMOVEL').AsString) +#13+
                  '                             AND L.FLGAJUSTEANUAL    = ' + QuotedStr(_CdsLancPrevImob.FieldByName('FLGAJUSTEANUAL').AsString) +#13+
                  '                             AND T.IDMODULO          = ' + IntToStr(iIdModulo) + ')';
          if not ExecSQL(sSql) then raise Exception.Create ( MessageInfo );

          sMsg := 'Receita/Despesa: ' + _CdsLancPrevImob.FieldByName('DESCCUSTORECIMO').AsString +
                  ' Tipo Imóvel: ' + _CdsLancPrevImob.FieldByName('CODTIPIMOVEL').AsString + ' OK';
          Commit;
        except
          on E:Exception do begin
            result := false;
            Rollback;
            // registrar erro tabela LANCPREVIMOB
            sSql := 'UPDATE LANCPREVIMOB        '+#13+
                    '   SET FLGSITUACAO = ''E'' '+#13+
                    ' WHERE IDLANCPREVIMOB IN( SELECT IDLANCPREVIMOB '+#13+
                    '                            FROM LANCPREVIMOB L, TIPOCUSTORECIMOV T '+#13+
                    '                           WHERE L.IDTIPOCUSTORECIMO = T.IDTIPOCUSTORECIMO '      +#13+
                    '                             AND L.MESCOMPETENCIA    = ' + IntToStr(iMesCompetencia) +#13+
                    '                             AND L.ANOCOMPETENCIA    = ' + IntToStr(iAnoCompetencia) +#13+
                    '                             AND L.IDTIPOCUSTORECIMO = ' + IntToStr(_CdsLancPrevImob.FieldByName('IDTIPOCUSTORECIMO').AsInteger) +#13+
                    '                             AND L.CODTIPIMOVEL      = ' + QuotedStr(_CdsLancPrevImob.FieldByName('CODTIPIMOVEL').AsString) +#13+
                    '                             AND L.FLGAJUSTEANUAL    = ' + QuotedStr(_CdsLancPrevImob.FieldByName('FLGAJUSTEANUAL').AsString) +#13+
                    '                             AND T.IDMODULO          = ' + IntToStr(iIdModulo) + ')';
            ExecSQL(sSql);

            // registrar erro
            sMsg := '---------------------------------------------------------'+ #13#10+
                    'ERRO - Receita/Despesa: ' + _CdsLancPrevImob.FieldByName('DESCCUSTORECIMO').AsString +
                    ' Tipo Imóvel: ' + _CdsLancPrevImob.FieldByName('CODTIPIMOVEL').AsString + #13#10 +
                    E.Message + #13#10 +
                    '---------------------------------------------------------';
          end;
        end;

        _CdsLancPrevImob.Next;
        // o último parâmetro será utilizado para passar a mensagem do processamento
        Inc (iAtual);
        DoProgresso ([sNomeBilhete, iAtual, iQuant, -1, -1, sMsg]);
      end;
    finally
      FreeAndNil(_CdsLancPrevImob);
      FreeAndNil(_CdsLancPrevDiaImob);
      if FileExists(sNomeBilhete) then DeleteFile(sNomeBilhete);
    end;
  end;
end;


function TCtrlPrevImob.RegistraEstornoPrevImob(const iCodDoc,
  iPlnCodigo: Extended; const bTransacao: Boolean): Boolean;
var
  _dbEstorno : TDbEstornoPrevImob;
begin
  Result := False;
  try
    try
      // Cria o dbControl
      _dbEstorno := TDbEstornoPrevImob.Create( Self );
      _dbEstorno.DataBaseName := DataBaseName;

      if bTransacao then StartTransaction;

      // Registra o Estorno
      _dbEstorno.Iddocumento.AsFloat := iCodDoc;
      _dbEstorno.Plncodigo.AsFloat   := iPlnCodigo;
      if not _dbEstorno.Insert then raise Exception.Create ( _dbEstorno.MessageInfo );

      if bTransacao then Commit;
      Result := True;
    except
      on E:Exception do begin
        Result := false;
        if bTransacao then Rollback;
        MessageInfo := E.Message;
      end;
    end;
  finally
    FreeAndNil( _dbEstorno );
  end;
end;


function TCtrlPrevImob.BuscaLancPrevDiaImob(const iIdModulo, iMesCompetencia, iAnoCompetencia, iIdTipoCustoRecImo: Integer;
                                            const sCodTipImovel, sFlgAjusteAnual: String;
                                            const bIntegrados: Boolean): OleVariant;
var sSql: string;
begin
  sSql := 'SELECT DISTINCT '+#13+
          '       PD.IDLANCPREVDIAIMOB,  PD.LANCNUMLAN, PD.VLRDIA,     '+#13+
          '       PC.IDLANCPREVCONTIMOB, PC.PLNCODIGO,  PC.DATALANCTO, '+#13+
          '       PD.IDTIPOCUSTORECIMO,  PD.CODTIPIMOVEL               '+#13+
          '  FROM LANCPREVCONTIMOB PC, LANCPREVPERIMOB PP,             '+#13+
          '       LANCPREVIMOB LP, LANCPREVDIAIMOB PD                  '+#13+
          ' WHERE PC.IDLANCPREVCONTIMOB = PP.IDLANCPREVCONTIMO         '+#13+
          '   AND PP.IDLANCPREVIMOB     = LP.IDLANCPREVIMOB            '+#13+
          '   AND PD.IDLANCPREVCONTIMOB = PC.IDLANCPREVCONTIMOB        '+#13+
          '   AND PD.IDTIPOCUSTORECIMO  = LP.IDTIPOCUSTORECIMO         '+#13+
          '   AND PD.CODTIPIMOVEL       = LP.CODTIPIMOVEL              '+#13+
          '   AND PD.CODTIPIMOVEL       = ' + QuotedStr(sCodTipImovel)     +#13+
          '   AND PD.IDTIPOCUSTORECIMO  = ' + IntToStr(iIdTipoCustoRecImo) +#13+
          '   AND LP.MESCOMPETENCIA     = ' + IntToStr(iMesCompetencia)    +#13+
          '   AND LP.ANOCOMPETENCIA     = ' + IntToStr(iAnoCompetencia)    +#13+
          '   AND PC.IDMODULO           = ' + IntToStr(iIdModulo)          +#13;

   if sFlgAjusteAnual <> '' then
     sSql := sSql + ' AND PD.FLGAJUSTEANUAL = ' + QuotedStr(sFlgAjusteAnual) +#13;

   if bIntegrados then
     sSql := sSql + ' AND PD.LANCNUMLAN IS NOT NULL ' +#13;

   sSql := sSql + ' ORDER BY PC.DATALANCTO, PD.IDTIPOCUSTORECIMO, PD.CODTIPIMOVEL ';

  Result := GetDataPacket ( sSql ) ;
end;


function TCtrlPrevImob.GravaLancPrevContImob(const iIdModulo: integer;
         const dDataLancto: TDateTime; var iIdLancPrevContImob: integer): boolean;
var
  _CdsLancPrevContImob: TCMClientDataSet;
begin
  try
    try
      _CdsLancPrevContImob := TCMClientDataSet.Create(nil);

      _CdsLancPrevContImob.Data := LookupLancPrevContImob (iIdModulo, -1, -1, dDataLancto);
      if _CdsLancPrevContImob.IsEmpty then begin
        // inserir registro na LANCPREVCONTIMOB
        FdbLancPrevContImob.Idmodulo.AsInteger := iIdModulo;
        FdbLancPrevContImob.Datalancto.AsDateTime := dDataLancto;
        if not FdbLancPrevContImob.Insert then
          raise Exception.Create ( FdbLancPrevContImob.MessageInfo );

        Result := True;
        iIdLancPrevContImob := FdbLancPrevContImob.Idlancprevcontimob.AsInteger;
      end else begin
        Result := True;
        iIdLancPrevContImob := _CdsLancPrevContImob.FieldByName('IDLANCPREVCONTIMOB').AsInteger;
      end;
    except
      on E:Exception do begin
        Result := false;
        iIdLancPrevContImob := -1;
        MessageInfo := E.Message;
      end;
    end;
  finally
    FreeAndNil(_CdsLancPrevContImob);
  end;
end;


function TCtrlPrevImob.GravaLancPrevPerImob(const iIdModulo,
         iIdLancPrevImob, iAnoCompetencia, iMesCompetencia: integer;
         const sCodTipImovel: string; const dIniCtb, dFimCtb: TDateTime;
         const sFlgAjusteAnual: string; const fVlrMes: Extended): boolean;
var
  iIdLancPrevContImob, iNumDias, i: integer;
  dDataLancto, dIni, dFim: TDateTime;
  fLancTotal, fLancDia: Extended;
  iDiaIni,iMesIni,iAnoIni : Integer;
begin
  try
     // define data inicial e final para lançamento no mes de competencia
     dIni := EncodeDate(iAnoCompetencia, iMesCompetencia, 1);
     dFim := DiasUteis.UltDiaMes(iAnoCompetencia, iMesCompetencia);

     if (dFimCtb > 0) and (dFimCtb < dFim)     then dFim := dFimCtb;
     if (dIniCtb > dIni) and (dIniCtb <= dFim) then dIni := dIniCtb;

     // define Nr. de dias para Rateio, ajuste anual será feito no primeiro dia do mes
     if sFlgAjusteAnual = 'N' then begin
       iNumDias := DiasUteis.IntervaloDias(dIni, dFim) + 1;
     end else begin
       iNumDias := 1;
     end;

     fLancDia   := ComunsImobiliario.Arredonda(fVlrMes / iNumDias, 2);
     fLancTotal := 0;
     DecodeDate(dIni, iAnoIni, iMesIni, iDiaIni);
     iDiaIni := iDiaIni - 1;

     for i := 1 to iNumDias do begin

       // Ajusta o valor no último registro ( dif centavos )
       if i = iNumDias then fLancDia := ComunsImobiliario.Arredonda(fVlrMes - fLancTotal, 2);

       // obter o idlancprevcontimob
       dDataLancto := EncodeDate(iAnoCompetencia, iMesCompetencia, (iDiaIni + i));
       iIdLancPrevContImob := -1;

       if not GravaLancPrevContImob (iIdModulo, dDataLancto, iIdLancPrevContImob) then
         raise Exception.Create ( MessageInfo );

       // inserir o lançamento em LancPrevPerImob
       FdbLancPrevPerImob.Idlancprevcontimo.AsInteger  := iIdLancPrevContImob;
       FdbLancPrevPerImob.Idlancprevimob.AsInteger     := iIdLancPrevImob;
       FdbLancPrevPerImob.Vlrdia.AsFloat               := fLancDia;
       if not FdbLancPrevPerImob.Insert then raise Exception.Create ( FdbLancPrevPerImob.MessageInfo );

       fLancTotal := ComunsImobiliario.Arredonda(fLancTotal + fLancDia, 2);
     end;
     Result := true;
  except
    on E:Exception do begin
      Result := false;
      MessageInfo := E.Message;
    end;
  end;

end;


function TCtrlPrevImob.GravaLancPrevImob(const iIdModulo, iIdUsuario, iIdTipoCustoRecImo,
         iAnoCompetencia, iMesCompetencia: integer; const sCodTipImovel: string; const dIniCtb, dFimCtb: TDateTime;
         const fVlrMes, fVlrAno: Extended; const bUsaPlanoPatro: Boolean): boolean;
var
  _CdsLancPrevImob: TCMClientDataSet;
  bGravaRegistro, bProvisionaDiferenca : boolean;
  fTotalLancado, fTotalEfetivo, fTotalAnual: Extended;
  iMesesTot, iMesesEfet, iDia, iMes, iAno, iDia2, iMes2, iAno2 : Integer;
  dIniComp : TDateTime;
begin
  try
    try
      _CdsLancPrevImob := TCMClientDataSet.Create(nil);
      _CdsLancPrevImob.Data := LookupLancPrevImob(iIdModulo, iAnoCompetencia, iMesCompetencia,
                                                  iIdTipoCustoRecImo, sCodTipImovel, dIniCtb, dFimCtb,
                                                  'N', false);

      // verifica e elimina a duplicidade
      if not _CdsLancPrevImob.IsEmpty then begin

        if (fVlrMes <> _CdsLancPrevImob.FieldByName('VLRMES').AsFloat) then begin

          if not ExcluiLancPrevImob('', false,
                                    _CdsLancPrevImob.FieldByName('FLGDIARIO').AsString,
                                    iIdModulo, iIdUsuario, iIdTipoCustoRecImo,
                                    iAnoCompetencia, iMesCompetencia,
                                    bUsaPlanoPatro, False, False,
                                    sCodTipImovel, dIniCtb, dFimCtb) then
            raise Exception.Create (MessageInfo);

          bGravaRegistro := true;
        end else bGravaRegistro := false;
      end else bGravaRegistro := true;

      // grava o registro
      if (bGravaRegistro) and (fVlrMes <> 0) then begin
        // gravar em LANCPREVIMOB
        FdbLancPrevImob.Idtipocustorecimo.AsInteger := iIdTipoCustoRecImo;
        FdbLancPrevImob.Codtipimovel.AsString       := sCodTipImovel;
        FdbLancPrevImob.Anocompetencia.AsInteger    := iAnoCompetencia;
        FdbLancPrevImob.Mescompetencia.AsInteger    := iMesCompetencia;
        FdbLancPrevImob.DtIniCtbDiaria.AsDateTime   := dIniCtb;
        FdbLancPrevImob.DtFimCtbDiaria.AsDateTime   := dFimCtb;
        FdbLancPrevImob.Vlrmes.AsFloat              := fVlrMes;
        FdbLancPrevImob.Flgsituacao.AsString        := 'N';
        FdbLancPrevImob.Flgajusteanual.AsString     := 'N';
        if not FdbLancPrevImob.Insert then raise Exception.Create ( FdbLancPrevImob.MessageInfo );

        // GRAVAR EM LANCPREVPERIMOB E LANCPREVCONTIMOB
        if not GravaLancPrevPerImob(iIdModulo,
                                    FdbLancPrevImob.Idlancprevimob.AsInteger,
                                    iAnoCompetencia, iMesCompetencia,
                                    sCodTipImovel, dIniCtb, dFimCtb, 'N', fVlrMes ) then
          raise Exception.Create ( MessageInfo );

        { **********************************************************************
                                 AJUSTE PREVISAO ANUAL
          ALEX AQUI NESTE MOMENTO VC TEM QUE PENSAR NO RATEIO ANUAL VLR LANCADO
          ANO X VLR PROVISIONADO X (COMPETENCIA = 12)
          *********************************************************************}
        if _CdsLancPrevImob.FieldByName('FLGDIARIO').AsString = 'A' then begin

          // EXCLUI OS AJUSTES ANTERIORES QUE POR VENTURA TENHAM
          if not ExcluiLancPrevImob ('', false, 'A', iIdModulo, iIdUsuario, iIdTipoCustoRecImo,
                                     iAnoCompetencia, iMesCompetencia, bUsaPlanoPatro, false, false,
                                     sCodTipImovel, dIniCtb, dFimCtb, 'S') then
            raise Exception.Create ( MessageInfo );


          // Define nr. de meses total do período para rateio das despesas anuais
          iMesesTot := DiasUteis.IntervaloMeses(dIniCtb, dFimCtb) + 1;
          // Ajuste bug do padrão ( soma um mes a menos quando o periodo encerra no dia
          // anterior em anos diferentes. Ex.: 20/02/2003 a 19/01/2004 = 11 meses
          DecodeDate(dFimCtb, iAno, iMes, iDia );
          DecodeDate((dIniCtb - 1), iAno2, iMes2, iDia2 );
          if (iAno <> iAno2) and (iDia = iDia2) and (iMes = iMes2-1) then Inc(iMesesTot);

          // Define Nr. de meses já vencidos do período para rateio até a competencia
          dIniComp   := EncodeDate(iAnoCompetencia, iMesCompetencia, 1);
          iMesesEfet := DiasUteis.IntervaloMeses(dIniCtb, dIniComp) + 1;
          // Considera um mes quando nr. de dias for inferior a 30
          if ((dIniComp - dIniCtb) < 31) and (iMesesEfet = 1) then Inc(iMesesEfet);

          // totalizar o valor lançado do ano para ver se precisa fazer ajuste neste mês
          fTotalLancado := TotalLancPrevImob ( iIdModulo, iMesCompetencia, iAnoCompetencia, dIniCtb, dFimCtb, iIdTipoCustoRecImo, sCodTipImovel );
          fTotalEfetivo := ComunsImobiliario.Arredonda( (fVlrAno / iMesesTot) * (iMesesEfet -1), 2 );
          fTotalAnual   := fTotalEfetivo - fTotalLancado;

          // se for o ultimo mes de lançamento e possuir diferença ==> acertar
          DecodeDate(dFimCtb, iAno, iMes, iDia );
          if (iMesCompetencia = iMes) and (iAnoCompetencia = iAno) and (fTotalAnual <> 0) then
            bProvisionaDiferenca := true
          else if (fTotalAnual <= -5) or (fTotalAnual >= 5)  then  // somente acertar se a diferença for maior que 5,00 ou mes 12
            bProvisionaDiferenca := true
          else
            bProvisionaDiferenca := false;

          // excluir o ajuste anual anterior
          if bProvisionaDiferenca then begin

            // gravar o provisonamento da diferença
            // gravar em LANCPREVIMOB
            FdbLancPrevImob.Idtipocustorecimo.AsInteger := iIdTipoCustoRecImo;
            FdbLancPrevImob.Codtipimovel.AsString       := sCodTipImovel;
            FdbLancPrevImob.Anocompetencia.AsInteger    := iAnoCompetencia;
            FdbLancPrevImob.Mescompetencia.AsInteger    := iMesCompetencia;
            FdbLancPrevImob.DtIniCtbDiaria.AsDateTime   := dIniCtb;
            FdbLancPrevImob.DtFimCtbDiaria.AsDateTime   := dFimCtb;
            FdbLancPrevImob.Vlrmes.AsFloat              := fTotalAnual;  // PODE SER NEGATIVO
            FdbLancPrevImob.Flgsituacao.AsString        := 'N';
            FdbLancPrevImob.Flgajusteanual.AsString     := 'S';
            if not FdbLancPrevImob.Insert then
              raise Exception.Create ( FdbLancPrevImob.MessageInfo );

            // GRAVAR EM LANCPREVPERIMOB E LANCPREVCONTIMOB
            // pode ter deixado de haver o codtipimovel para a receita/despesa
            if not GravaLancPrevPerImob(iIdModulo,
                                    FdbLancPrevImob.Idlancprevimob.AsInteger,
                                    iAnoCompetencia, iMesCompetencia,
                                    sCodTipImovel, dIniCtb, dFimCtb, 'S', fTotalAnual ) then
              raise Exception.Create ( MessageInfo );
          end;
        end;

      end;

      Result := True;
    except
      on E:Exception do begin
        Result := false;
        MessageInfo := E.Message;
      end;
    end;
  finally
    FreeAndNil(_CdsLancPrevImob);
  end;
end;

// Totaliza os lançamentos de LancPrevPerImob por dia
function TCtrlPrevImob.LookupCountLancPrevPerImob(const iIdModulo, iMesCompetencia, iAnoCompetencia: integer;
                                                  const iIdTipoCustoRecImo: integer = -1): OLEVariant;
var sSql, sParam : String;
begin
  sParam := ' AND PC.IDMODULO = ' + IntToStr(iIdModulo) +#13+
            ' AND LP.MESCOMPETENCIA = ' + IntToStr(iMesCompetencia) +#13+
            ' AND LP.ANOCOMPETENCIA = ' + IntToStr(iAnoCompetencia) +#13;

  if iIdTipocustoRecImo  <> -1 then sParam := sParam + ' AND PRE.IDTIPOCUSTORECIMO = ' + IntToStr(iIdTipocustoRecImo) +#13;

  sSql := 'SELECT PC.IDLANCPREVCONTIMOB, PC.DATALANCTO, LP.IDTIPOCUSTORECIMO, '+#13+
          '       LP.CODTIPIMOVEL, LP.FLGAJUSTEANUAL, SUM(PP.VLRDIA) AS TOT_DIA '+#13+
          '  FROM LANCPREVPERIMOB PP, LANCPREVCONTIMOB PC, LANCPREVIMOB LP '+#13+
          ' WHERE PP.IDLANCPREVCONTIMO = PC.IDLANCPREVCONTIMOB '+#13+
          '   AND PP.IDLANCPREVIMOB = LP.IDLANCPREVIMOB '+#13+ sParam +
          ' GROUP BY PC.IDLANCPREVCONTIMOB, PC.DATALANCTO, LP.IDTIPOCUSTORECIMO, '+#13+
          '       LP.CODTIPIMOVEL, LP.FLGAJUSTEANUAL';


  Result := GetDataPacket( sSql );
end;


// exclui as tabelas lancprevdiaimob , lancprevimob e lancprevperimob
function TCtrlPrevImob.DeleteLancPrevImob(const sFlgDiario: string;
  const iIdTipoCustoRecImo, iAnoCompetencia, iMesCompetencia: integer;
  const bExcluiPlanilha: boolean; const sCodTipImovel, sFlgAjusteAnual: string): boolean;
var
  sSql, sFiltro, sFiltro2: string;
begin

  sFiltro := '';
  if iIdTipoCustoRecImo <> -1 then sFiltro := sFiltro + '   AND ( IDTIPOCUSTORECIMO = ' + IntToStr(iIdTipoCustoRecImo) + ' ) ' + #13;
  if iAnoCompetencia    <> -1 then sFiltro := sFiltro + '   AND ( ANOCOMPETENCIA = ' + IntToStr(iAnoCompetencia) + ' ) ' + #13;
  if iMesCompetencia    <> -1 then sFiltro := sFiltro + '   AND ( MESCOMPETENCIA = ' + IntToStr(iMesCompetencia) + ' ) ' + #13;
  if sCodTipImovel      <> '' then sFiltro := sFiltro + '   AND ( CODTIPIMOVEL = '   + QuotedStr(sCodTipImovel) + ' ) ' + #13;
  if sFlgAjusteAnual    <> '' then sFiltro := sFiltro + '   AND ( FLGAJUSTEANUAL = ' + QuotedStr(sFlgAjusteAnual) + ' ) ' + #13;

  sFiltro2 := '';
  if iIdTipoCustoRecImo <> -1 then sFiltro2 := sFiltro2 + ' AND ( P.IDTIPOCUSTORECIMO = ' + IntToStr(iIdTipoCustoRecImo) + ' ) ' + #13;
  if iAnoCompetencia    <> -1 then sFiltro2 := sFiltro2 + ' AND ( P.ANOCOMPETENCIA = ' + IntToStr(iAnoCompetencia) + ' ) ' + #13;
  if iMesCompetencia    <> -1 then sFiltro2 := sFiltro2 + ' AND ( P.MESCOMPETENCIA = ' + IntToStr(iMesCompetencia) + ' ) ' + #13;
  if sCodTipImovel      <> '' then sFiltro2 := sFiltro2 + ' AND ( P.CODTIPIMOVEL = '   + QuotedStr(sCodTipImovel) + ' ) ' + #13;
  if sFlgAjusteAnual    <> '' then sFiltro2 := sFiltro2 + ' AND ( P.FLGAJUSTEANUAL = ' + QuotedStr(sFlgAjusteAnual) + ' ) ' + #13;

  // excluir lancprevdiaimob, se bExcluiPlanilha = true lançamentos ja foram excluidos em LANCPREVDIAIMOB
  if not bExcluiPlanilha then begin
    sSql := 'DELETE FROM LANCPREVDIAIMOB ' +#13+
            ' WHERE IDLANCPREVCONTIMOB IN ( ' +#13+
            '                              SELECT DISTINCT PP.IDLANCPREVCONTIMO ' +#13+
            '                                FROM LANCPREVPERIMOB PP, LANCPREVIMOB P ' +#13+
            '                               WHERE PP.IDLANCPREVIMOB = P.IDLANCPREVIMOB ' +#13+ sFiltro2 +#13+
            '                              ) ';
    if sCodTipImovel <> ''      then sSql := sSql + ' AND CODTIPIMOVEL = ' + QuotedStr(sCodTipImovel);
    if iIdTipoCustoRecimo <> -1 then sSql := sSql + ' AND IDTIPOCUSTORECIMO = ' + IntToStr(iIdTipoCustoRecimo);

    if ExecSQL(sSql) then Result := true
    else Result := false;
  end;

  // excluir lancprevperimob, se bExcluiPlanilha = true lançamentos ja foram excluidos em LANCPREVDIAIMOB
  if not bExcluiPlanilha then begin
    sSql := 'DELETE FROM LANCPREVPERIMOB ' + #13 +
            'WHERE IDLANCPREVIMOB IN ' + #13 +
            '   ( ' + #13 +
            '     SELECT IDLANCPREVIMOB ' + #13 +
            '     FROM LANCPREVIMOB ' + #13 +
            '     WHERE 1=1 '+ #13 +
            sFiltro + #13 +
            '    ) ' + #13;

    if ExecSQL(sSql) then Result := true
    else Result := false;
  end;

  // excluir lancprevimob = filtro = anterior
  if Result then begin
    sSql := 'DELETE FROM LANCPREVIMOB ' + #13 +
            'WHERE 1=1 ' + #13 +
            sFiltro;

    if ExecSQL(sSql) then Result := true
    else Result := false;
  end;

end;


{ sFlgDiario = ''  exclui todos os lançamentos independente periodicidade
             = 'M' exclui lançamentos com periodicidade mensal
             = 'A' exclui lançamentos com periodicidade anual
}
function TCtrlPrevImob.DeletePrevImob(const sFlgDiario: string;
  const iIdModulo, iIdTipoCustoRecImo, iAnoCompetencia, iMesCompetencia: integer;
  const sCodTipImovel: String; const dIniCtb, dFimCtb:TDateTime; const sFlgAjusteAnual: string; const iImovelMestre, iImovel: integer): boolean;
var
  sSql, sFiltro, sFiltro1, sFiltro2: string;
begin
  sFiltro := '';
  if iIdTipoCustoRecImo <> -1 then sFiltro := sFiltro + '   AND ( IDTIPOCUSTORECIMO = ' + IntToStr (iIdTipoCustoRecImo) + ' ) ' + #13;
  if iAnoCompetencia    <> -1 then sFiltro := sFiltro + '   AND ( ANOCOMPETENCIA = ' + IntToStr(iAnoCompetencia) + ' ) ' + #13;
  if iMesCompetencia    <> -1 then sFiltro := sFiltro + '   AND ( MESCOMPETENCIA = ' + IntToStr(iMesCompetencia) + ' ) ' + #13;
  if sCodTipImovel      <> '' then sFiltro := sFiltro + '   AND ( CODTIPIMOVEL = '   + QuotedStr(sCodTipImovel) + ' ) ' + #13;
  if sFlgAjusteAnual    <> '' then sFiltro := sFiltro + '   AND ( FLGAJUSTEANUAL = ' + QuotedStr(sFlgAjusteAnual) + ' ) ' + #13;
  if iImovel            <> -1 then sFiltro := sFiltro + '   AND ( IDIMOVEL = ' + IntToStr(iImovel) + ' ) ' + #13;
  if dIniCtb            <> -1 then sFiltro := sFiltro + '   AND ( DTINICTBDIARIA = TO_DATE(' + QuotedStr(FormatDateTime('DD/MM/YYYY',dIniCtb)) + ',''DD/MM/YYYY'') )' +#13;
  if dFimCtb            <> -1 then sFiltro := sFiltro + '   AND ( DTFIMCTBDIARIA = TO_DATE(' + QuotedStr(FormatDateTime('DD/MM/YYYY',dFimCtb)) + ',''DD/MM/YYYY'') )' +#13;


  // se a exclusão for de planilha todos os lançamentos, mensais e anuais serão excluídos
  sFiltro1 := '';
  if sFlgDiario         <> '' then sFiltro1 := '          AND ( FLGDIARIO = ' + QuotedStr(sFlgDiario) + ' ) ' + #13;

  // se a exclusão for de imovel mestre
  sFiltro2 := '';
  if iImovelMestre <> -1 then begin
    sFiltro2 := '  AND ( IDIMOVEL IN ' + #13 +
                '      ( SELECT IDIMOVEL FROM IMOVEL ' + #13 +
                '        WHERE ( IDIMOVELMESTRE = ' + IntToStr (iImovelMestre) + ' ) ' + #13 +
                '      ) ) ' + #13;
  end;

  sSql := 'DELETE FROM PREVIMOB ' + #13+
          'WHERE 1=1 ' + #13 +
          sFiltro +
          '  AND ( IDTIPOCUSTORECIMO IN ' + #13 +
          '      ( SELECT IDTIPOCUSTORECIMO FROM TIPOCUSTORECIMOV ' + #13 +
          '        WHERE ( IDMODULO = ' + IntToStr (iIdModulo) + ' ) ' + #13 +
          sFiltro1 +
          '       ) ) '+ #13 +
          sFiltro2;

  if ExecSQL(sSql) then Result := true
  else Result := False;
end;

procedure TCtrlPrevImob.SetdbParamImovel(const Value: TDbParamImovel);
begin
  FdbParamImovel := Value;
end;

procedure TCtrlPrevImob.SetdbParamAlienacao( const Value: TDbParamAlienacao);
begin
  FdbParamAlienacao := Value;
end;

procedure TCtrlPrevImob.SetdbLancPrevPerImob(const Value: TDbLancPrevPerImob);
begin
  FdbLancPrevPerImob := Value;
end;



end.
