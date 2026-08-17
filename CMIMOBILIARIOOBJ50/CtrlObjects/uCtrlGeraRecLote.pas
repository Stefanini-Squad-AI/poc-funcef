{-------------------------------------------------------------------------------

        OBJETO DE CONTROLE DE GERAÇÃO DE RECEITAS EM LOTE  ( MT )

        Módulo          :  Comuns Imobiliário
        Autor           :  Daniel Simões Braga
        Data de Término :  27/08/2007

        FUNÇÕES PUBLICADAS:

--------------------------------------------------------------------------------
-------------------------------------------------------------------------------}

unit uCtrlGeraRecLote;

interface

uses SysUtils, uCmControlObject, uCmDbObject, DB, uDataBase, dbClient, Provider,
     wwQuery, uCMClientDataSet, uCMTypes, uComunsImobiliarioDB, uComunsImobiliario,
     uDiasUteis, uCtrlParamIntegra, uCtrlModuloImobiliario, uCmFileUtils;

type
  TCtrlGeraRecLote = class(TCmControlObject)

  protected
    procedure AfterInitialize; override;
    procedure onCreateAppServer; override;

  private
    ParamSistema          : TParamSistema;
    CtrlModuloImobiliario : TCtrlModuloImobiliario;
    CtrlParamIntegra      : TCtrlParamIntegra;
    ComunsImobiliarioDB   : TComunsImobiliarioDB;

  public
    CdsGeraRecLote : TCMClientDataSet;

    constructor Create(const iIdEmpresa,iIdModulo,iIdUsuario,iIdEspAcesso:Integer; const bUsaPlanoPatro:Boolean); reintroduce;
    destructor Destroy; override;

    function LookupLancamentosAGerar(const iImovel:Integer=-1; const iContrato:Integer=-1;        const iResponsavel:Integer=-1;
                                     const iAno:Integer=-1;    const iMes:Integer=-1;             const iAnoI:Integer=-1;
                                     const iMesI:Integer=-1;   const iIndicadorImovel:Integer=-1; const fDesconto:Double=0): OLEVariant;

end;

implementation

{ TCtrlGeraRecLote }

procedure TCtrlGeraRecLote.AfterInitialize;
begin
  inherited;
  CtrlModuloImobiliario.InitializeAs(Self);
  CtrlParamIntegra.InitializeAs(Self);
  ComunsImobiliarioDB.InitializeAs(Self);

  CtrlModuloImobiliario.OnMessageInfo := nil;
  CtrlParamIntegra.OnMessageInfo      := nil;
  ComunsImobiliarioDB.OnMessageInfo   := nil;

  CtrlModuloImobiliario.AdminImob.GetParam(ParamSistema.idEmpresa);
  CtrlParamIntegra.GetParams(ParamSistema.idEmpresa,0,'','',tiSistema);
end;

constructor TCtrlGeraRecLote.Create(const iIdEmpresa,iIdModulo,iIdUsuario,iIdEspAcesso:Integer;
                                    const bUsaPlanoPatro:Boolean);
begin
  inherited Create;

  CtrlModuloImobiliario := TCtrlModuloImobiliario.Create;
  CtrlParamIntegra      := TCtrlParamIntegra.Create;
  ComunsImobiliarioDB   := TComunsImobiliarioDB.Create(iIdEmpresa,
                                                       iIdModulo,
                                                       iIdUsuario,
                                                       iIdEspAcesso,
                                                       bUsaPlanoPatro);

  // Carrega Variáveis Globais
  ParamSistema.IdEmpresa      := iIdEmpresa;
  ParamSistema.IdModulo       := iIdModulo;
  ParamSistema.IdUsuario      := iIdUsuario;
  ParamSistema.IdEspAcesso    := iIdEspAcesso;
  ParamSistema.UsaPlanoPatro  := bUsaPlanoPatro;
end;

destructor TCtrlGeraRecLote.Destroy;
begin
  FreeAndNil(CtrlModuloImobiliario);
  FreeAndNil(CtrlParamIntegra);
  FreeAndNil(ComunsImobiliarioDB);

  inherited;
end;

function TCtrlGeraRecLote.LookupLancamentosAGerar(const iImovel,iContrato,iResponsavel,iAno,iMes,iAnoI,iMesI,iIndicadorImovel:Integer;
                                                  const fDesconto:Double): OLEVariant;
var sSql, sParam, sParam2, sAnoMes, sPerc : String;
begin
  sSql    := '';
  sParam  := '';
  sParam2 := '';
  sPerc   := '0';
  sAnoMes := FormatFloat('0000',iAno)+FormatFloat('00',iMes);

  if (fDesconto>0)        then sPerc  := FloatToStr(fDesconto);
  if (iImovel>0)          then sParam := sParam+'  AND I.IDIMOVEL          = '+QuotedStr(IntToStr(iImovel))          +#13;
  if (iContrato>0)        then sParam := sParam+'  AND C.IDCONTRATOIMOVEL  = '+QuotedStr(IntToStr(iContrato))        +#13;
  if (iResponsavel>0)     then sParam := sParam+'  AND C.IDRESPONSAVEL     = '+QuotedStr(IntToStr(iResponsavel))     +#13;
  if (iIndicadorImovel>0) then sParam := sParam+'  AND A.IDINDICADORIMOVEL = '+QuotedStr(IntToStr(iIndicadorImovel)) +#13;

  if (iAno>0) and (iMes>0) then begin
    sParam := sParam+'  AND A.ANOCOMPETENCIA    = '+QuotedStr(IntToStr(iAnoI))                                  +#13;
    sParam := sParam+'  AND A.MESCOMPETENCIA    = '+QuotedStr(IntToStr(iMesI))                                  +#13;

    sParam := sParam+'  AND ((CXI.CIMDTFIM IS NOT NULL AND ( '+QuotedStr(sAnoMes)+' BETWEEN '                   +
                     'TO_CHAR(CXI.CIMDTINI,''YYYYMM'') AND TO_CHAR(CXI.CIMDTFIM,''YYYYMM''))) OR '              +
                     '(CXI.CIMDTFIM IS NULL AND '+QuotedStr(sAnoMes)+' >= TO_CHAR(CXI.CIMDTINI,''YYYYMM'')) ) ' +#13;

    sParam2 := sParam2+'  AND I.ANOCOMPETENCIA  = '+IntToStr(iAno)                                              +#13+
                       '  AND I.MESCOMPETENCIA  = '+IntToStr(iMes)                                              +#13;
  end;

  sSql := 'SELECT C.CONNUMERO, C.CONNOME, (IM.IMONOME||'' - ''||I.IMONOME) AS IMOVEL, '               +#13+
          '       A.VLRAPURADO AS VLR_INDICADOR, DECODE(NVL(CXI.FLGRATEIO,0),0,100, '                 +#13+
          '                                                 CXI.CIMPERCENTRATEIO) AS PERC_RATEIO, '   +#13+
          '       DECODE(NVL(CXI.FLGRATEIO,0),0,A.VLRAPURADO, '                                       +#13+
          '              ROUND(A.VLRAPURADO*(CXI.CIMPERCENTRATEIO/100),2)) AS VLR_LANC_ORIG, '        +#13+
          '       ROUND(DECODE(NVL(CXI.FLGRATEIO,0),0,A.VLRAPURADO, '                                 +
          'ROUND(A.VLRAPURADO*(CXI.CIMPERCENTRATEIO/100),2)) / 100 * '+sPerc+',2) AS VLR_DESC, '      +#13+

          '       ROUND( DECODE(NVL(CXI.FLGRATEIO,0),0,A.VLRAPURADO, '                                +#13+
          '                     ROUND(A.VLRAPURADO*(CXI.CIMPERCENTRATEIO/100),2)) - '                 +#13+

          '              ROUND(DECODE(NVL(CXI.FLGRATEIO,0),0,A.VLRAPURADO, '                          +
          'ROUND(A.VLRAPURADO*(CXI.CIMPERCENTRATEIO/100),2)) / 100 * '+sPerc+',2),2) AS VLR_LANC, '   +#13+

          '       CXI.CIMDTINI, CXI.CIMDTFIM, A.IDIMOVEL, CXI.IDCONTRATOIMOVEL, C.IDLOCATARIO, '      +#13+
          '       C.CODPORTFORMA, I.CODTIPIMOVEL, 0 AS CODDOCUMENTO, A.IDINDICADORIMOVEL, '           +#13+
          '       A.OBSERVACAO, A.FLGPREVREAL, A.FLGTIPOAPURACAO, A.MESCOMPETENCIA, '                 +#13+
          '       A.ANOCOMPETENCIA, A.DATAAPURADO '                                                   +#13+
          'FROM INDICADORXAPUR A, CONTRATOXIMOVEL CXI, CONTRATOIMOVEL C, IMOVEL I, IMOVEL IM '        +#13+
          'WHERE A.FLGPREVREAL        = ''P'' '                                                       +#13+
          '  AND A.IDINDICADORIMOVEL  NOT IN ( SELECT IDINDICADORIMOVEL '                             +#13+
          '                                    FROM INDICADORXAPUR I '                                +#13+
          '                                    WHERE I.IDIMOVEL        = CXI.IDIMOVEL '               +#13+
          '                                      AND I.FLGPREVREAL     = ''R'' '                      +#13+sParam2+
          '                                      AND IDINDICADORIMOVEL = '+IntToStr(iIndicadorImovel) +
          '                                  ) '                                                      +#13+
          '  AND A.IDIMOVEL           = CXI.IDIMOVEL '                                                +#13+
          '  AND CXI.IDCONTRATOIMOVEL = C.IDCONTRATOIMOVEL '                                          +#13+
          '  AND CXI.IDIMOVEL         = I.IDIMOVEL '                                                  +#13+
          '  AND I.IDIMOVELMESTRE     = IM.IDIMOVEL '                                                 +#13+sParam+

          '  AND TO_CHAR(C.CONDATACARENCIA,''YYYYMM'') < '+QuotedStr(sAnoMes)                         +#13+
          'ORDER BY CONNUMERO, IMOVEL '                                                               +#13;

  Result := GetDataPacket(sSql);
end;

procedure TCtrlGeraRecLote.onCreateAppServer;
begin
  inherited;
end;

end.
