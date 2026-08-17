{-------------------------------------------------------------------------------
ALTERAÇÕES / IMPLEMENTAÇÕES ----------------------------------------------------
--------------------------------------------------------------------------------
Pendência   : 24872
Responsável : Daniel Simões
Data        : 16/08/2007
Descrição   : Foram acrescentados os campos IDDOCUMENTO e OBSERVACAO na query da
              função 'LookupIndicadorXApur' ...
--------------------------------------------------------------------------------
-------------------------------------------------------------------------------}

unit uCtrlIndicadorImovel;

interface

uses
  sysutils, uCmControlObject, uCmDbObject, uSistema, DB, uDataBase, dbClient, provider,
  wwQuery, uCMClientDataSet, uCMTypes, Windows, JCLSysUtils, uCtrlContratoImovel,
  uDbIndicadorImovel, uDbIndicadorXTipoImo, uDbIndicadorXApur, uCtrlInadimplencia,
  JCLStrings, uCMMath, uDiasUteis, uComunsImobiliario;

type


  TMensagemParaUsuario = procedure( const Mensagem : string ) of object;
  TAtualizaProgresso   = procedure( const Titulo : string; const Total, Atual : integer ) of object;

  TCtrlIndicadorImovel = class(TCmControlObject)
  private

    CtrlInadimplencia  : TCtrlInadimplencia;
    CtrlContratoImovel : TCtrlContratoImovel;
    DiasUteis          : TDiasUteis;
    ParamSistema       : TParamSistema;

    FCdsIndicadorImovel: TCMClientDataSet;
    FDbIndicadorImovel: TDbIndicadorImovel;
    FCdsIndicadorXTipoImo: TCMClientDataSet;
    FDbIndicadorXTipoimo: TDbIndicadorXTipoimo;
    FCdsIndicadorXApur: TCMClientDataSet;
    FDbIndicadorXApur: TDbIndicadorXApur;
    procedure SetCdsIndicadorImovel(const Value: TCMClientDataSet);
    procedure SetDbIndicadorImovel(const Value: TDbIndicadorImovel);
    procedure SetCdsIndicadorXTipoImo(const Value: TCMClientDataSet);
    procedure SetDbIndicadorXTipoimo(const Value: TDbIndicadorXTipoimo);
    procedure SetCdsIndicadorXApur(const Value: TCMClientDataSet);
    procedure SetDbIndicadorXApur(const Value: TDbIndicadorXApur);

  protected
    procedure onCreateAppServer; override;
    procedure AfterInitialize; override;

  public

    MensagemParaUsuario : TMensagemParaUsuario;
    AtualizaProgresso   : TAtualizaProgresso;

    procedure EnviaMsg( Mensagem : string );
    procedure EnviaAtualizacao( const Titulo : string; const Total, Atual : integer );

    constructor Create (const iIdEmpresa, iIdModulo, iIdUsuario, iIdEspAcesso: Integer; const bUsaPlanoPatro: Boolean); reintroduce;
    destructor Destroy; override;

    // tabela IndicadorImovel
    property DbIndicadorImovel: TDbIndicadorImovel read FDbIndicadorImovel write SetDbIndicadorImovel;
    property CdsIndicadorImovel: TCMClientDataSet read FCdsIndicadorImovel write SetCdsIndicadorImovel;

    // tabela IndicadorXTipoImo
    property DbIndicadorXTipoimo: TDbIndicadorXTipoimo read FDbIndicadorXTipoimo write SetDbIndicadorXTipoimo;
    property CdsIndicadorXTipoImo: TCMClientDataSet read FCdsIndicadorXTipoImo write SetCdsIndicadorXTipoImo;

    // tabela IndicadorXApur
    property DbIndicadorXApur: TDbIndicadorXApur read FDbIndicadorXApur write SetDbIndicadorXApur;
    property CdsIndicadorXApur: TCMClientDataSet read FCdsIndicadorXApur write SetCdsIndicadorXApur;

    function GravaIndicadorImovel: boolean;
    function GravaIndicadorXTipoimo: boolean;
    function GravaIndicadorXApur( bInTransaction : boolean = False ) : boolean;

    function SelecionaIndicadorXTipoImovel(const iIdIndicadorImovel: integer; const sCodTipoImovel: string): OleVariant;
    function LookupIndicadorImovel(const sCodTipoImo: string = ''; const iIdIndicadorImovel: integer = -1; const bUnidaut: boolean = false): OleVariant;
    function LookupIndicadorXApur(const iIdImovel: integer = -1; const iIdUnidaut: integer = -1; const iIdIndicadorImovel: integer = -1; const iIdIndicadorXApur: integer = -1): OleVariant;

    function ApuraIndicadores( iMes, iAno : integer; dDataApuracao : TDateTime; bCFinan : boolean; sFLGCALCINADIMP : string ) : OLEVariant;

    function VerificaJaApurados( iMes, iAno : integer ) : boolean;

    function GravaApuracao( iMes, iAno : integer; Apuracao : OLEVariant ) : boolean;

    function RecuperaApuracoes( sTipoContrato : string; sAnoMesIni, sAnoMesFim : string ) : OLEVariant;

    procedure PreencheDocumentos( cdsDoc             : TCMClientDataSet;
                                  iIDCONTRATOIMOVEL  : integer;
                                  sFLGTIPOCONTRATO   : string;
                                  sCONMESREFREAJUSTE : string;
                                  iIDINDCORRECAO     : integer;
                                  fCONVLRMULTA       : extended;
                                  fCONPERCENTMULTA   : extended;
                                  iCONMOEDAMULTA     : integer;
                                  fCONVLRMORA        : extended;
                                  fCONPERCENTMORA    : extended;
                                  iCONMOEDAMORA      : integer;
                                  iFLGMORAPROPORC    : integer;
                                  iIDCIDADES         : integer;
                                  iIDPAIS            : integer;
                                  iCONDIASTOLERANCIA : integer;
                                  iCONDIASREPASSE    : integer;
                                  sCONPERMORA        : string;
                                  sCODESTADO         : string;
                                  sFLGTIPODIATOLERA  : string;
                                  sFLGCALCINADIMP    : string;
                                  dData              : TDateTime;
                                  bApenasAbertos     : boolean;
                                  bCFinan            : boolean );


  published
end;

implementation

{ TCtrlIndicadorImovel }


constructor tCtrlIndicadorImovel.Create(const iIdEmpresa, iIdModulo, iIdUsuario, iIdEspAcesso: Integer; const bUsaPlanoPatro: Boolean);
begin
  inherited Create;
  CtrlInadimplencia  := TCtrlInadimplencia.Create(iIdEmpresa, iIdModulo, iIdUsuario, iIdEspAcesso, bUsaPlanoPatro);
  DiasUteis          := TDiasUteis.Create;
  CtrlContratoImovel := TCtrlContratoImovel.Create( iIdEmpresa, iIdModulo, iIdUsuario,
                                                    iIdEspAcesso, bUsaPlanoPatro );

  FdbIndicadorImovel   := TDbIndicadorImovel.Create( Self );
  FDbIndicadorXTipoimo := TDbIndicadorXTipoimo.Create( Self );
  FDbIndicadorXApur    := TDbIndicadorXApur.Create( Self );

  // Carrega Variáveis Globais
  ParamSistema.idEmpresa     := iIdEmpresa;
  ParamSistema.idModulo      := iIdModulo;
  ParamSistema.idUsuario     := iIdUsuario;
  ParamSistema.idEspAcesso   := iIdEspAcesso;
  ParamSistema.UsaPlanoPatro := bUsaPlanoPatro;
end;


procedure tCtrlIndicadorImovel.onCreateAppServer;
begin
  inherited;
  FCdsIndicadorImovel := TCMClientDataSet.Create (nil);
  FCdsIndicadorXTipoImo := TCMClientDataSet.Create (nil);
  FCdsIndicadorXApur := TCMClientDataSet.Create (nil);
end;

destructor tCtrlIndicadorImovel.Destroy;
begin
  FreeAndNil(CtrlInadimplencia);
  FreeAndNil(CtrlContratoImovel);
  FreeAndNil(DiasUteis);


  FreeAndNil(FdbIndicadorImovel);
  FreeAndNil(FdbIndicadorXTipoimo);
  FreeAndNil(FDbIndicadorXApur);

  if isAppServer then begin
    FreeAndNil(FCdsIndicadorImovel);
    FreeAndNil(FCdsIndicadorXTipoimo);
    FreeAndNil(FCdsIndicadorXApur);
  end;

  inherited;
end;

procedure tCtrlIndicadorImovel.AfterInitialize;
begin
  inherited;
  CtrlInadimplencia.InitializeAs( Self );
  CtrlContratoImovel.InitializeAs( Self );
  DiasUteis.InitializeAs( Self );

  FdbIndicadorImovel.DataBaseName := DataBaseName;
  FDbIndicadorXTipoimo.DataBaseName := DataBaseName;
  FDbIndicadorXApur.DataBaseName := DataBaseName;
end;


function tCtrlIndicadorImovel.GravaIndicadorImovel: boolean;
var
  sMsg : string;
begin
    if ConnectionSide = cnsclient then begin
    Result := Connection.AppServer.GravaIndicadorImovel (CdsIndicadorImovel.Data);
    if not Result then
      MessageInfo := Connection.AppServer.MessageInfo;
  end else begin
    try
      StartTransaction;
      Result := ApplyCds(CdsIndicadorImovel, dbIndicadorImovel, [], []);
      sMsg := dbIndicadorImovel.MessageInfo;

      if  not Result then raise Exception.Create(sMsg);

      Commit;
    except
      on E:Exception do begin
        Result := false;
        Rollback;
        MessageInfo := E.Message;
      end;
    end;
  end;
end;


function TCtrlIndicadorImovel.GravaIndicadorXTipoimo: boolean;
var
  sMsg : string;
begin
    if ConnectionSide = cnsclient then begin
    Result := Connection.AppServer.GravaIndicadorXTipoimo (CdsIndicadorXTipoImo.Data);
    if not Result then
      MessageInfo := Connection.AppServer.MessageInfo;
  end else begin
    try
      StartTransaction;
      Result := ApplyCds(CdsIndicadorXTipoImo, DbIndicadorXTipoimo, [], []);
      sMsg := DbIndicadorXTipoimo.MessageInfo;

      if  not Result then raise Exception.Create(sMsg);

      Commit;
    except
      on E:Exception do begin
        Result := false;
        Rollback;
        MessageInfo := E.Message;
      end;
    end;
  end;
end;


function TCtrlIndicadorImovel.GravaIndicadorXApur( bInTransaction : boolean = False ): boolean;
var
  sMsg : string;
begin
    if ConnectionSide = cnsclient then begin
    Result := Connection.AppServer.GravaIndicadorXApur (CdsIndicadorXApur.Data);
    if not Result then
      MessageInfo := Connection.AppServer.MessageInfo;
  end else begin
    try
      if not bInTransaction then
        StartTransaction;

      Result := ApplyCds(CdsIndicadorXApur, DbIndicadorXApur, [], []);
      sMsg := DbIndicadorXApur.MessageInfo;

      if  not Result then raise Exception.Create(sMsg);

      if not bInTransaction then
        Commit;
    except
      on E:Exception do begin
        Result := false;
        if not bInTransaction then
          Rollback;
        MessageInfo := E.Message;
      end;
    end;
  end;
end;


function TCtrlIndicadorImovel.SelecionaIndicadorXTipoImovel(const iIdIndicadorImovel: integer; const sCodTipoImovel: string): OleVariant;
begin
  FDbIndicadorXTipoimo.Idindicadorimovel.AsInteger := iIdIndicadorImovel;
  FDbIndicadorXTipoimo.Codtipimovel.AsString := sCodTipoImovel;

  result := GetDataPacket (FDbIndicadorXTipoimo.SSqlSelect);
end;

{ APENAS UM DOS PARÂMETROS DEVE SER PREENCHIDO }
function TCtrlIndicadorImovel.LookupIndicadorImovel(const sCodTipoImo: string; const iIdIndicadorImovel: integer; const bUnidaut: boolean): OleVariant;
var
  sSql: string;
begin
  if sCodTipoImo <> '' then begin   // selecionar indicadores por tipo de imóvel
    sSql := 'SELECT I.IDINDICADORIMOVEL, I.INMDESCRICAO, I.FLGTIPOVALOR, I.RECPAG, I.FLGUNIDAUT, I.CODINTERNO, '+
            '       DECODE(I.FLGTIPOVALOR,''M'',''Monetário'',''P'',''Percentual'',''Quantitativo'') AS DSC_TIPOVALOR, '+
            '       DECODE(I.RECPAG,''R'',''Receita'',''D'',''Despesa'',''Desempenho'') AS DSC_RECPAG '+
            'FROM INDICADORIMOVEL I, INDICADORXTIPOIMO IT '+
            'WHERE I.IDINDICADORIMOVEL = IT.IDINDICADORIMOVEL '+
            'AND IT.CODTIPIMOVEL = '+QuotedStr(sCodTipoImo)+
            'ORDER BY I.INMDESCRICAO ';
  end else begin
    if iIdIndicadorImovel = -1 then begin
      sSql := 'SELECT IDINDICADORIMOVEL, INMDESCRICAO, FLGTIPOVALOR, RECPAG, FLGUNIDAUT, CODINTERNO, '+
            '       DECODE(FLGTIPOVALOR,''M'',''Monetário'',''P'',''Percentual'',''Quantitativo'') AS DSC_TIPOVALOR, '+
            '       DECODE(RECPAG,''R'',''Receita'',''D'',''Despesa'',''Desempenho'') AS DSC_RECPAG '+
              'FROM INDICADORIMOVEL ';
      if bUnidaut then
        sSql := sSql + 'WHERE FLGUNIDAUT = 1 ';

      sSql := sSql + 'ORDER BY INMDESCRICAO ';
    end else begin // NECESSÁRIO DEVIDO A BUG NO PADRÃO - TELA fCadOutroDadoMT
      sSql := 'SELECT IDINDICADORIMOVEL, INMDESCRICAO, FLGTIPOVALOR, RECPAG, FLGUNIDAUT, CODINTERNO, '+
            '       DECODE(FLGTIPOVALOR,''M'',''Monetário'',''P'',''Percentual'',''Quantitativo'') AS DSC_TIPOVALOR, '+
            '       DECODE(RECPAG,''R'',''Receita'',''D'',''Despesa'',''Desempenho'') AS DSC_RECPAG '+
              'FROM INDICADORIMOVEL '+
              'WHERE IDINDICADORIMOVEL = '+QuotedStr(IntToStr(iIdIndicadorImovel));
    end;
  end;

  Result := GetDataPacket(sSql);
end;


function TCtrlIndicadorImovel.LookupIndicadorXApur(const iIdImovel: integer; const iIdUnidaut: Integer; const iIdIndicadorImovel: integer; const iIdIndicadorXApur: integer): OleVariant;
var
  sFiltro, sSql: string;
begin
  sFiltro := '';
  if iIdIndicadorXApur  <> -1 then sFiltro := sFiltro + '   AND IA.IDINDICADORXAPUR = '  + IntToStr(iIdIndicadorXApur);
  if iIdIndicadorImovel <> -1 then sFiltro := sFiltro + '   AND IA.IDINDICADORIMOVEL = ' + IntToStr(iIdIndicadorImovel);
  if iIdImovel          <> -1 then sFiltro := sFiltro + '   AND IA.IDIMOVEL = '          + IntToStr(iIdImovel);
  if iIdUnidaut         <> -1 then sFiltro := sFiltro + '   AND IA.IDUNIDAUT = '         + IntToStr(iIdUnidaut);

  sSql := 'SELECT '+
          '   IA.IDDOCUMENTO, IA.OBSERVACAO, '+ // Daniel - 24872
          '   IA.IDINDICADORXAPUR,    IA.IDIMOVEL,         IA.IDUNIDAUT, '+
          '   IA.MESCOMPETENCIA,      IA.ANOCOMPETENCIA,   IA.VLRAPURADO, '+
          '   IA.DATAAPURADO,         IA.FLGPREVREAL,      IA.IDINDICADORIMOVEL, '+
          '   IA.FLGTIPOAPURACAO, '+
          '   I.INMDESCRICAO,         I.FLGTIPOVALOR,      I.RECPAG, '+
          '   DECODE(I.FLGTIPOVALOR, ''M'',''Monet'',''P'',''Percent'',''Quant'')  AS DSC_TIPOVALOR, '+
          '   DECODE(I.RECPAG, ''R'',''Receita'',''D'',''Despesa'',''Desempenho'') AS DSC_RECPAG, '+
          '   DECODE(IA.FLGPREVREAL, ''P'',''Previsto'',''Realizado'')             AS DSC_PREVREAL, '+
          '   DECODE(IA.FLGTIPOAPURACAO, ''A'',''Automático'',''Manual'')             AS DSC_TIPOAPURACAO '+
          'FROM '+
          '   INDICADORXAPUR IA, INDICADORIMOVEL I '+
          'WHERE '+
          '   IA.IDINDICADORIMOVEL = I.IDINDICADORIMOVEL '+
          sFiltro+
          ' ORDER BY I.INMDESCRICAO, IA.ANOCOMPETENCIA, IA.MESCOMPETENCIA ';

  Result := GetDataPacket(sSql);
end;


procedure TCtrlIndicadorImovel.SetCdsIndicadorImovel(
  const Value: TCMClientDataSet);
begin
  FCdsIndicadorImovel := Value;
end;

procedure TCtrlIndicadorImovel.SetDbIndicadorImovel(
  const Value: TDbIndicadorImovel);
begin
  FDbIndicadorImovel := Value;
end;

procedure TCtrlIndicadorImovel.SetCdsIndicadorXTipoImo(
  const Value: TCMClientDataSet);
begin
  FCdsIndicadorXTipoImo := Value;
end;

procedure TCtrlIndicadorImovel.SetDbIndicadorXTipoimo(
  const Value: TDbIndicadorXTipoimo);
begin
  FDbIndicadorXTipoimo := Value;
end;



procedure TCtrlIndicadorImovel.SetCdsIndicadorXApur(
  const Value: TCMClientDataSet);
begin
  FCdsIndicadorXApur := Value;
end;

procedure TCtrlIndicadorImovel.SetDbIndicadorXApur(
  const Value: TDbIndicadorXApur);
begin
  FDbIndicadorXApur := Value;
end;


function TCtrlIndicadorImovel.ApuraIndicadores(iMes, iAno: integer;
          dDataApuracao: TDateTime; bCFinan : boolean; sFLGCALCINADIMP : string ): OLEVariant;
var
  cdsIndicadores   ,
  cdsContratos     ,
  cdsDocumentos    ,
  cdsResult        : TCMClientDataset;
  dUltDia          : TDateTime;
  iQtdeDocLoc      ,
  iQtdeInadLoc     ,
  iQtdeDocAli      ,
  iQtdeInadAli     : integer;
  fValorDocLoc     ,
  fValorInadimpLoc ,
  fValorDocAli     ,
  fValorInadimpAli : extended;

  procedure InsereIndicador( iCodInterno : integer; fValor : extended );
  begin
    if cdsIndicadores.Locate( 'CODINTERNO', iCodInterno, [] ) then
    begin
      cdsResult.Append;
      cdsResult.FieldByName('IDINDICADORIMOVEL').AsInteger := cdsIndicadores.FieldByName('IDINDICADORIMOVEL').AsInteger;
      cdsResult.FieldByName('INMDESCRICAO').AsString       := cdsIndicadores.FieldByName('INMDESCRICAO').AsString;
      cdsResult.FieldByName('MESCOMPETENCIA').AsInteger    := iMes;
      cdsResult.FieldByName('ANOCOMPETENCIA').AsInteger    := iAno;
      cdsResult.FieldByName('VLRAPURADO').AsFloat          := fValor;
      cdsResult.FieldByName('DATAAPURADO').AsDateTime      := dDataApuracao;
      cdsResult.Post;
    end;
  end;

begin
  cdsIndicadores := TCMClientDataset.Create( nil );
  cdsContratos   := TCMClientDataset.Create( nil );
  cdsDocumentos  := TCMClientDataset.Create( nil );
  cdsResult      := TCMClientDataset.Create( nil );
  try

    dUltDia := DiasUteis.UltDiaMes( iAno, iMes );

    iQtdeDocLoc       := 0;
    fValorDocLoc      := 0;
    iQtdeDocAli       := 0;
    fValorDocAli      := 0;
    iQtdeInadLoc      := 0;
    fValorInadimpLoc  := 0;
    iQtdeInadAli      := 0;
    fValorInadimpAli  := 0;

    cdsResult.Data := GetDataPacket( ' select ia.IDINDICADORIMOVEL, ' +
                                     '        im.INMDESCRICAO,      ' +
                                     '        ia.MESCOMPETENCIA,    ' +
                                     '        ia.ANOCOMPETENCIA,    ' +
                                     '        ia.VLRAPURADO,        ' +
                                     '        ia.DATAAPURADO        ' +
                                     ' from   INDICADORXAPUR  ia,   ' +
                                     '        INDICADORIMOVEL im    ' +
                                     ' where  1 = 2                 ' );

    cdsIndicadores.Data := GetDataPacket( ' select IDINDICADORIMOVEL,     ' +
                                          '        INMDESCRICAO,          ' +
                                          '        CODINTERNO             ' +
                                          ' from   INDICADORIMOVEL        ' +
                                          ' where  CODINTERNO is not null ' );

    EnviaMsg( 'Recuperando documentos com vencimento no período...');

    cdsDocumentos.Data := GetDataPacket(
     ' select   FLGTIPOCONTRATO,                                                                               ' +
     '          count(*) as QTDE,                                                                              ' +
     '          sum( TOT_RECEBER ) as SOMA                                                                     ' +
     ' from ( SELECT   D.CODDOCUMENTO,                                                                         ' +
     '                 ''L'' AS FLGTIPOCONTRATO,                                                               ' +
     '                 SUM( DECODE( RTRIM( LD.OPERACAO ), ''2'', DECODE( D.RECPAG, ''R'', LD.VALOR, 0 ), 0 ) + ' +
     '                  DECODE( RTRIM( LD.OPERACAO ), ''4'', DECODE( D.RECPAG, ''R'',                          ' +
     '                  DECODE( LD.DEBCRE, ''D'', LD.VALOR, LD.VALOR * -1 ), 0 ), 0 ) ) AS TOT_RECEBER         ' +
     '        FROM     DOCUMENTO          D,                                                                   ' +
     '                 LANCTODOCUM        LD,                                                                  ' +
     '                 CONTRATOIMOVEL     CI,                                                                  ' +
     '                 LANCAMENTOSIMOVEL  LI                                                                   ' +
     '        WHERE    ( LI.IDCONTRATOIMOVEL IS NOT NULL )                                                     ' +
     '          AND    ( LI.CODDOCUMENTO = D.CODDOCUMENTO                    )                                 ' +
     '          AND    ( D.CODDOCUMENTO  = LD.CODDOCUMENTO                   )                                 ' +
     '          AND    ( D.RECPAG        = ''R''                             )                                 ' +
     '          AND    ( LI.IDCONTRATOIMOVEL = CI.IDCONTRATOIMOVEL           )                                 ' +
     '          AND    ( CI.FLGTIPOCONTRATO  = ''L''                         )                                 ' +
     '          AND    ( TO_CHAR( LI.DATAVENCIMENTO, ''YYYYMM'' ) = '                                            +
     QuotedStr( FormatFloat( '0000', iAno ) + FormatFloat( '00', iMes ) )   + ' )                              ' +
     '        GROUP BY D.CODDOCUMENTO                                                                          ' +
     '        UNION                                                                                            ' +
     '               SELECT   D.CODDOCUMENTO,                                                                  ' +
     '                 ''A'' AS FLGTIPOCONTRATO,                                                               ' +
     '                 SUM( DECODE( PF.FLGTIPOLANC, 9, PF.VLRAMORTIZACAO, PF.VLRPRESTACAO ) ) AS TOTAL         ' +
     '        FROM     DOCUMENTO          D,                                                                   ' +
     '                 PARCFINANCIMOV     PF,                                                                  ' +
     '                 CONDPAGIMOVEL      CP,                                                                  ' +
     '                 CONTRATOIMOVEL     CI                                                                   ' +
     '        WHERE    ( PF.FLGTIPOLANC      IN ( 2, 3, 5, 6, 7, 8, 9 )      )                                 ' +
     '          AND    ( D.CODDOCUMENTO      = PF.CODDOCUMENTO               )                                 ' +
     '          AND    ( PF.IDCONDPAGIMOVEL  = CP.IDCONDPAGIMOVEL            )                                 ' +
     '          AND    ( CP.IDCONTRATOIMOVEL = CI.IDCONTRATOIMOVEL           )                                 ' +
     '          AND    ( CI.FLGTIPOCONTRATO  = ''C''                         )                                 ' +
     '          AND    ( TO_CHAR( PF.DATAVENCIMENTO, ''YYYYMM'' ) = '                                            +
     QuotedStr( FormatFloat( '0000', iAno ) + FormatFloat( '00', iMes ) )   + ' )                              ' +
     '        GROUP BY D.CODDOCUMENTO  )                                                                       ' +
     ' group by FLGTIPOCONTRATO                                                                                ' );

    cdsDocumentos.First;    
    if cdsDocumentos.Locate( 'FLGTIPOCONTRATO', 'L', [] ) then
    begin
      iQtdeDocLoc  := cdsDocumentos.FieldByName('QTDE').AsInteger;
      fValorDocLoc := cdsDocumentos.FieldByName('SOMA').AsFloat;
    end;

    cdsDocumentos.First;    
    if cdsDocumentos.Locate( 'FLGTIPOCONTRATO', 'A', [] ) then
    begin
      iQtdeDocAli  := cdsDocumentos.FieldByName('QTDE').AsInteger;
      fValorDocAli := cdsDocumentos.FieldByName('SOMA').AsFloat;
    end;

    EnviaMsg( 'Selecionando contratos inadimplentes...');

    cdsContratos.Data := CtrlInadimplencia.RecuperaContratos( '', '', '', '',
                                                              '', 0, 0, 0, '',
                                                              'T', 0, dUltDia,
                                                              True, bCFinan, False );

    EnviaMsg( '' );

    EnviaAtualizacao( 'Processando documentos inadimplentes...', cdsContratos.RecordCount, 0 );

    cdsContratos.First;
    while not cdsContratos.Eof do
    begin
      PreencheDocumentos( cdsDocumentos,
                          cdsContratos.FieldByName('IDCONTRATOIMOVEL').AsInteger,
                          cdsContratos.FieldByName('FLGTIPOCONTRATO').AsString,
                          cdsContratos.FieldByName('CONMESREFREAJUSTE').AsString,
                          cdsContratos.FieldByName('IDINDCORRECAO').AsInteger,
                          cdsContratos.FieldByName('CONVLRMULTA').AsFloat,
                          cdsContratos.FieldByName('CONPERCENTMULTA').AsFloat,
                          cdsContratos.FieldByName('CONMOEDAMULTA').AsInteger,
                          cdsContratos.FieldByName('CONVLRMORA').AsFloat,
                          cdsContratos.FieldByName('CONPERCENTMORA').AsFloat,
                          cdsContratos.FieldByName('CONMOEDAMORA').AsInteger,
                          cdsContratos.FieldByName('FLGMORAPROPORC').AsInteger,
                          cdsContratos.FieldByName('IDCIDADES').AsInteger,
                          cdsContratos.FieldByName('IDPAIS').AsInteger,
                          cdsContratos.FieldByName('CONDIASTOLERANCIA').AsInteger,
                          cdsContratos.FieldByName('CONDIASREPASSE').AsInteger,
                          cdsContratos.FieldByName('CONPERMORA').AsString,
                          cdsContratos.FieldByName('CODESTADO').AsString,
                          cdsContratos.FieldByName('FLGTIPODIATOLERA').AsString,
                          sFLGCALCINADIMP, 
                          dUltDia, True, bCFinan );

      cdsDocumentos.First;
      while not cdsDocumentos.Eof do
      begin
        if cdsContratos.FieldByName('FLGTIPOCONTRATO').AsString = 'L' then
        begin
          inc( iQtdeInadLoc );
          fValorInadimpLoc := fValorInadimpLoc + cdsDocumentos.FieldByName('VALORDIVERGATUAL').AsFloat;
        end
        else
        begin
          inc( iQtdeInadAli );
          fValorInadimpAli := fValorInadimpAli + cdsDocumentos.FieldByName('VALORDIVERGATUAL').AsFloat;
        end;
        cdsDocumentos.Next;
      end;

      EnviaAtualizacao( 'Processando documentos inadimplentes...', cdsContratos.RecordCount, cdsContratos.RecNo );

      cdsContratos.Next;
    end;

    EnviaAtualizacao( '', 0, 0 );

    InsereIndicador( 1, iQtdeDocLoc                    );
    InsereIndicador( 2, iQtdeInadLoc                   );
    InsereIndicador( 3, RoundCM( fValorDocLoc, 2 )     );
    InsereIndicador( 4, RoundCM( fValorInadimpLoc, 2 ) );
    InsereIndicador( 5, iQtdeDocAli                    );
    InsereIndicador( 6, iQtdeInadAli                   );
    InsereIndicador( 7, RoundCM( fValorDocAli, 2 )     );
    InsereIndicador( 8, RoundCM( fValorInadimpAli, 2 ) );

    Result := cdsResult.Data;

  finally
    EnviaMsg( '' );
    cdsIndicadores.Free;
    cdsContratos.Free;
    cdsDocumentos.Free;
    cdsResult.Free;
  end;

end;

procedure TCtrlIndicadorImovel.EnviaMsg(Mensagem: string);
begin
  if Assigned( MensagemParaUsuario ) then
    MensagemParaUsuario( Mensagem );
end;

procedure TCtrlIndicadorImovel.EnviaAtualizacao(const Titulo : string; const Total, Atual: integer);
begin
  if Assigned( AtualizaProgresso ) then
    AtualizaProgresso( Titulo, Total, Atual );
end;

procedure TCtrlIndicadorImovel.PreencheDocumentos(cdsDoc: TCMClientDataSet;
  iIDCONTRATOIMOVEL: integer; sFLGTIPOCONTRATO, sCONMESREFREAJUSTE: string;
  iIDINDCORRECAO: integer; fCONVLRMULTA, fCONPERCENTMULTA: extended;
  iCONMOEDAMULTA: integer; fCONVLRMORA, fCONPERCENTMORA: extended;
  iCONMOEDAMORA, iFLGMORAPROPORC, iIDCIDADES, iIDPAIS, iCONDIASTOLERANCIA,
  iCONDIASREPASSE: integer; sCONPERMORA, sCODESTADO,
  sFLGTIPODIATOLERA, sFLGCALCINADIMP : string; dData: TDateTime; bApenasAbertos : boolean; bCFinan: boolean);
var
  iMESESANTERIORES  : integer;
  fVALORORIGINAL    ,
  fVALORRECEBIDO    : extended;
  bTEMBAIXAPARCIAL  : boolean;
  dDATAVENCIMENTO   ,
  dDATALIMITE       : TDateTime;
  sFLGTIPODIAREPASS : string;
  iIdParcFinancImov : Integer;
  fValorAtual,
  fMulta, fJuros, fCorrecaoMonet,
  fMultaDif, fJurosDif, fCorrecaoMonetDif,
  fProporcao, fValorDiverg, fValorDivergAtual : extended;
  
  cdsDadosParaAlienacao : TCMClientDataset;
  dDataCalculo : TDateTime;
begin
  cdsDoc.Close;
  if sFLGTIPOCONTRATO = 'L' then
    cdsDoc.Data := CtrlInadimplencia.RecuperaDocumentosImob( iIDCONTRATOIMOVEL, dData, bApenasAbertos, bCFinan )
  else
    cdsDoc.Data := CtrlInadimplencia.RecuperaDocumentosAliena( iIDCONTRATOIMOVEL, dData, bApenasAbertos );

  while not cdsDoc.Eof do
  begin
    iIdParcFinancImov  := -1;
    iMESESANTERIORES   := Iff( sCONMESREFREAJUSTE = 'A', 1, 0 );
    iIDINDCORRECAO     := iIDINDCORRECAO;
    fCONVLRMULTA       := fCONVLRMULTA;
    fCONPERCENTMULTA   := fCONPERCENTMULTA;
    iCONMOEDAMULTA     := iCONMOEDAMULTA;
    fCONVLRMORA        := fCONVLRMORA;
    fCONPERCENTMORA    := fCONPERCENTMORA;
    iCONMOEDAMORA      := iCONMOEDAMORA;
    iFLGMORAPROPORC    := iFLGMORAPROPORC;
    iIDCIDADES         := iIDCIDADES;
    iIDPAIS            := iIDPAIS;
    iCONDIASTOLERANCIA := iCONDIASTOLERANCIA;
    iCONDIASREPASSE    := iCONDIASREPASSE;
    fVALORORIGINAL     := cdsDoc.FieldByName('VALOR_ORIGINAL').AsFloat;
    fVALORRECEBIDO     := cdsDoc.FieldByName('VALOR_RECEBIDO').AsFloat;
    bTEMBAIXAPARCIAL   := ( fVALORRECEBIDO <> 0 );
    dDATAVENCIMENTO    := cdsDoc.FieldByName('DATAVENCTO').AsDateTime;
    dDATALIMITE        := cdsDoc.FieldByName('DATALIMITE').AsDateTime;
    sCONPERMORA        := sCONPERMORA;
    sCODESTADO         := sCODESTADO;
    sFLGTIPODIATOLERA  := sFLGTIPODIATOLERA;
    sFLGTIPODIAREPASS  := sFLGTIPODIATOLERA;

    if sFLGTIPOCONTRATO = 'C' then
    begin
      cdsDadosParaAlienacao := TCMClientDataset.Create( nil );
      try
        cdsDadosParaAlienacao.Data := CtrlContratoImovel.BuscaParamCMJurosMulta( iIDCONTRATOIMOVEL, dData );

        iMESESANTERIORES   := cdsDadosParaAlienacao.FieldByName('MESREFCORRECAO').AsInteger;
        iIDINDCORRECAO     := cdsDadosParaAlienacao.FieldByName('IDINDCORRECAO').AsInteger;
        fCONVLRMULTA       := cdsDadosParaAlienacao.FieldByName('VLRMULTA').AsFloat;
        fCONPERCENTMULTA   := cdsDadosParaAlienacao.FieldByName('PERCMULTA').AsFloat;
        iCONMOEDAMULTA     := cdsDadosParaAlienacao.FieldByName('MOEDAMULTA').AsInteger;
        fCONVLRMORA        := cdsDadosParaAlienacao.FieldByName('VLRJUROS').AsFloat;
        fCONPERCENTMORA    := cdsDadosParaAlienacao.FieldByName('PERCJUROS').AsFloat;
        iCONMOEDAMORA      := cdsDadosParaAlienacao.FieldByName('MOEDAJUROS').AsInteger;
        iFLGMORAPROPORC    := Iff( cdsDadosParaAlienacao.FieldByName('FLGJUROSPROPORC').AsString = 'S', 1, 0 );
        sCONPERMORA        := cdsDadosParaAlienacao.FieldByName('PERIODOJUROS').AsString;
        iCONDIASTOLERANCIA := cdsDadosParaAlienacao.FieldByName('DIASTOLERANCIA').AsInteger;
        iCONDIASREPASSE    := cdsDadosParaAlienacao.FieldByName('DIASREPASSE').AsInteger;
        sFLGTIPODIATOLERA  := cdsDadosParaAlienacao.FieldByName('FLGTIPODIATOLERA').AsString;
        sFLGTIPODIAREPASS  := cdsDadosParaAlienacao.FieldByName('FLGTIPODIAREPASS').AsString;

        // Busca o Id da Parcela
        iIdParcFinancImov  := cdsDoc.FieldByName('IDPARCFINANCIMOV').AsInteger;
      finally
        cdsDadosParaAlienacao.Free;
      end;
    end;

    fMulta         := 0;
    fJuros         := 0;
    fCorrecaoMonet := 0;

    CtrlInadimplencia.DadosDocsVencidos( cdsDoc.FieldByName('CODDOCUMENTO').AsInteger,
                                         iIdParcFinancImov,
                                         dData,
                                         iMESESANTERIORES,
                                         iIDINDCORRECAO,
                                         fCONVLRMULTA,
                                         fCONPERCENTMULTA,
                                         iCONMOEDAMULTA,
                                         fCONVLRMORA,
                                         fCONPERCENTMORA,
                                         iCONMOEDAMORA,
                                         iFLGMORAPROPORC,              
                                         iIDCIDADES,
                                         iIDPAIS,
                                         iCONDIASTOLERANCIA,
                                         iCONDIASREPASSE,
                                         bTEMBAIXAPARCIAL,
                                         fVALORORIGINAL,
                                         fVALORRECEBIDO,
                                         dDATAVENCIMENTO,
                                         dDATALIMITE,
                                         sCONPERMORA,
                                         sCODESTADO,
                                         sFLGTIPODIATOLERA,
                                         sFLGTIPODIAREPASS,
                                         sFLGTIPOCONTRATO,
                                         sFLGCALCINADIMP,
                                         False,
                                         fValorAtual,
                                         fMulta, fJuros, fCorrecaoMonet,
                                         fMultaDif, fJurosDif, fCorrecaoMonetDif, fProporcao,
                                         fValorDiverg, fValorDivergAtual,
                                         dDataCalculo );

    cdsDoc.Edit;
    if sFLGTIPOCONTRATO = 'C' then
      cdsDoc.FieldByName('DESCCUSTORECIMO').AsString := CtrlInadimplencia.TipoParcela( cdsDoc.FieldByName('FLGTIPOLANC').AsInteger );
    cdsDoc.FieldByName('MULTA').AsFloat            := fMulta;
    cdsDoc.FieldByName('JUROS').AsFloat            := fJuros;
    cdsDoc.FieldByName('CORRECMONET').AsFloat      := fCorrecaoMonet;
    cdsDoc.FieldByName('MULTADIF').AsFloat         := fMultaDif;
    cdsDoc.FieldByName('JUROSDIF').AsFloat         := fJurosDif;
    cdsDoc.FieldByName('CORRECMONETDIF').AsFloat   := fCorrecaoMonetDif;
    cdsDoc.FieldByName('PROPORCAO').AsFloat        := fProporcao;
    cdsDoc.FieldByName('VALORATUAL').AsFloat       := fValorAtual;
    cdsDoc.FieldByName('VALORDIVERG').AsFloat      := fValorDiverg;
    cdsDoc.FieldByName('VALORDIVERGATUAL').AsFloat := fValorDivergAtual;
    cdsDoc.FieldByName('DATACALCULO').AsDateTime   := dDataCalculo;
    cdsDoc.Post;
    cdsDoc.Next;
  end;
  cdsDoc.First;
end;


function TCtrlIndicadorImovel.VerificaJaApurados(iMes, iAno: integer): boolean;
var
  cdsLocal : TCmClientDataSet;
  sSQL : string;
begin
  cdsLocal := TCmClientDataSet.Create( nil );
  try
    sSQL := ' SELECT IA.IDINDICADORIMOVEL                             ' +
            ' FROM   INDICADORXAPUR  IA,                              ' +
            '        INDICADORIMOVEL IM                               ' +
            ' WHERE  IA.IDINDICADORIMOVEL = IM.IDINDICADORIMOVEL      ' +
            '   AND  IM.CODINTERNO        IS NOT NULL                 ' +
            '   AND  TO_CHAR( IA.ANOCOMPETENCIA ) ||                  ' +
            '        LTRIM( TO_CHAR( IA.MESCOMPETENCIA, ''00'' ) ) >= ' +
            QuotedStr( FormatFloat( '0000', iAno ) + FormatFloat( '00', iMes ) );

    cdsLocal.Data := GetDataPacket( sSQL );

    Result := not cdsLocal.IsEmpty;

  finally
    cdsLocal.Free;
  end;
end;

function TCtrlIndicadorImovel.GravaApuracao( iMes, iAno : integer; Apuracao : OLEVariant ) : boolean;
var
  cdsApuracao,
  cdsDados : TCMClientDataset;
begin
  Result := False;
  cdsApuracao := TCMClientDataset.Create( nil );
  cdsDados    := TCMClientDataset.Create( nil );
  try
    cdsApuracao.Data := Apuracao;
    cdsIndicadorXApur := cdsDados;

    cdsDados.Close;
    DbIndicadorXApur.Idindicadorxapur.AsInteger := -1;
    cdsDados.Data := GetDataPacket( DbIndicadorXApur.SSqlSelect );

    StartTransaction;
    try
      ExecSQL( ' DELETE FROM INDICADORXAPUR                                    ' +
               ' WHERE  IDINDICADORIMOVEL IN ( SELECT IDINDICADORIMOVEL        ' +
               '                               FROM   INDICADORIMOVEL          ' +
               '                               WHERE  CODINTERNO IS NOT NULL ) ' +
               '   AND TO_CHAR( ANOCOMPETENCIA ) ||                            ' +
               '        LTRIM( TO_CHAR( MESCOMPETENCIA, ''00'' ) ) >=          ' +
               QuotedStr( FormatFloat( '0000', iAno ) + FormatFloat( '00', iMes ) ) );

      cdsApuracao.First;
      while not cdsApuracao.Eof do
      begin
        cdsDados.Append;
        cdsDados.FieldByName('IDINDICADORIMOVEL').AsInteger := cdsApuracao.FieldByName('IDINDICADORIMOVEL').AsInteger;
        cdsDados.FieldByName('MESCOMPETENCIA').AsInteger    := cdsApuracao.FieldByName('MESCOMPETENCIA').AsInteger;
        cdsDados.FieldByName('ANOCOMPETENCIA').AsInteger    := cdsApuracao.FieldByName('ANOCOMPETENCIA').AsInteger;
        cdsDados.FieldByName('VLRAPURADO').AsFloat          := cdsApuracao.FieldByName('VLRAPURADO').AsFloat;
        cdsDados.FieldByName('DATAAPURADO').AsDateTime      := cdsApuracao.FieldByName('DATAAPURADO').AsDateTime;
        cdsDados.FieldByName('FLGPREVREAL').AsString        := 'R';
        cdsDados.FieldByName('FLGTIPOAPURACAO').AsString    := 'A';
        cdsDados.Post;
        cdsApuracao.Next;
      end;

      if not GravaIndicadorXApur( True ) then
        raise Exception.Create( MessageInfo );

      Commit;

      Result := True;

    except
      on E:Exception do
      begin
        Result := False;
        Rollback;
      end;
    end;

  finally
    FreeAndNil( cdsApuracao );
    FreeAndNil( cdsDados );
  end;
end;

function TCtrlIndicadorImovel.RecuperaApuracoes( sTipoContrato : string; sAnoMesIni, sAnoMesFim : string ) : OLEVariant;
var
  cdsIndicadores,
  cdsResult : TCMClientDataset;
  sAnoMes : string;
  sSQL : string;
begin
  cdsResult      := TCMClientDataset.Create( nil );
  cdsIndicadores := TCMClientDataset.Create( nil );
  try
    cdsResult.Data := GetDataPacket( ' select ''123456'' as ANOMES, ' +
                                     '        0          as QTDDOC, ' +
                                     '        0          as QTDINA, ' +
                                     '        0          as VALDOC, ' +
                                     '        0          as VALINA  ' +
                                     ' from   DUAL                  ' +
                                     ' where  1 = 2                 ' );

    sSQL :=
     ' SELECT   TO_CHAR( ANOCOMPETENCIA ) ||  LTRIM( TO_CHAR( MESCOMPETENCIA, ''00'' ) ) as ANOMES, ' +
     '          IA.MESCOMPETENCIA,                                                                  ' +
     '          IA.ANOCOMPETENCIA,                                                                  ' +
     '          IA.VLRAPURADO,                                                                      ' +
     '          IA.DATAAPURADO,                                                                     ' +
     '          IM.CODINTERNO                                                                       ' +
     ' FROM     INDICADORXAPUR  IA,                                                                 ' +
     '          INDICADORIMOVEL IM                                                                  ' +
     ' WHERE    IA.IDINDICADORIMOVEL = IM.IDINDICADORIMOVEL                                         ' +
     '   AND    IM.CODINTERNO IN ( ' ;

    if ( sTipoContrato = 'T' ) or ( sTipoContrato = 'L' ) then
      sSQL := sSQL + ' 1, 2, 3, 4 ';

    if ( sTipoContrato = 'T' ) then
      sSQL := sSQL + ', ';

    if ( sTipoContrato = 'T' ) or ( sTipoContrato = 'A' ) then
      sSQL := sSQL + ' 5, 6, 7, 8 ';

    sSQL := sSQL +       
     '  )                                         ' +
     '   AND    TO_CHAR( ANOCOMPETENCIA ) ||  LTRIM( TO_CHAR( MESCOMPETENCIA, ''00'' ) )            ' +
     '           BETWEEN ' + sAnoMesIni + ' AND ' + sAnoMesFim                                        +
     ' ORDER BY TO_CHAR( ANOCOMPETENCIA ) ||  LTRIM( TO_CHAR( MESCOMPETENCIA, ''00'' ) )            ' ;

    cdsIndicadores.Data := GetDataPacket( sSQL );     

    sAnoMes := sAnoMesIni;
    repeat
      cdsIndicadores.Filter   := 'ANOMES=' + QuotedStr( sAnoMes );
      cdsIndicadores.Filtered := True;

      if not cdsIndicadores.IsEmpty then
      begin
        cdsResult.Append;

        cdsResult.FieldByName('ANOMES').AsString := sAnoMes;

        cdsIndicadores.First;
        if cdsIndicadores.Locate( 'CODINTERNO', 1, [] ) then
          cdsResult.FieldByName('QTDDOC').AsInteger := cdsIndicadores.FieldByName('VLRAPURADO').AsInteger
        else
          cdsResult.FieldByName('QTDDOC').AsInteger := 0;

        cdsIndicadores.First;
        if cdsIndicadores.Locate( 'CODINTERNO', 2, [] ) then
          cdsResult.FieldByName('QTDINA').AsInteger := cdsIndicadores.FieldByName('VLRAPURADO').AsInteger
        else
          cdsResult.FieldByName('QTDINA').AsInteger := 0;

        cdsIndicadores.First;
        if cdsIndicadores.Locate( 'CODINTERNO', 3, [] ) then
          cdsResult.FieldByName('VALDOC').AsFloat := cdsIndicadores.FieldByName('VLRAPURADO').AsFloat
        else
          cdsResult.FieldByName('VALDOC').AsFloat := 0;

        cdsIndicadores.First;
        if cdsIndicadores.Locate( 'CODINTERNO', 4, [] ) then
          cdsResult.FieldByName('VALINA').AsFloat := cdsIndicadores.FieldByName('VLRAPURADO').AsFloat
        else
          cdsResult.FieldByName('VALINA').AsFloat := 0;

        cdsResult.Post;
        
      end;

      cdsIndicadores.Filtered := False;

      sAnoMes := FormatDateTime( 'yyyymm', DiasUteis.SomaMeses( EncodeDate( StrToInt( StrLeft( sAnoMes, 4 ) ),
       StrToInt( StrRight( sAnoMes, 2 ) ), 1 ), 1 ) );

    until sAnoMes > sAnoMesFim;

    Result := cdsResult.Data;

  finally
    cdsIndicadores.Free;
  end;
end;


end.
