unit uCtrlEmprestimo;


interface

uses SysUtils, uCMControlObject, uCMDbObject, uCMClientDataSet,
     uCMTypes;

type

  // variáveis globais ao objeto, obrigatórias pela criação do mesmo
  TParamObjeto = record
    iIdEmpresa: Integer;
  end;

  TCtrlEmprestimo = class(TCMControlObject)

  private
    // variáveis globais ao objeto, obrigatórias pela criação do mesmo
    ParamObjeto : TParamObjeto;


  protected
    procedure AfterInitialize; Override;
    procedure OnCreateAppServer; Override;

  public
    constructor Create (const iIdEmpresa: integer); reintroduce;
    destructor  Destroy; override;

    function ValoresCarteira(const dData: TDateTime): OleVariant;

  published

end;

implementation

{ TCtrlEmprestimo }

function TCtrlEmprestimo.ValoresCarteira(const dData: TDateTime): OleVariant;
var
  sData, sAno, sMes, sSql: string;
begin
   sData := QuotedStr(FormatDateTime('DD/MM/YYYY', dData));
   sAno  := FormatDateTime('YYYY', dData);
   sMes  := FormatDateTime('MM', dData);

   sSQL :=
   'SELECT DM.CODINDEXADOR, SUM(SS.HMESALDODEV), SUM(SS.VALOR_DEVIDO) ' + #13 +
   'FROM DAIEAMOEDA DM, ' + #13 +
   '( ' + #13 +
   'SELECT '                                                                                       + #13 +
   '   CON.IDCONTRATOEMPTMO, '                                                                     + #13 +
   '   CON.VLRCONTRATO, '                                                                          + #13 +
   '   CON.IDTIPOEMPTMO, CON.DESCTIPOEMPTMO, '                                                     + #13 +
   '   CON.MOECODIGO, '                                                                            + #13 +
   '   SLD.HMESALDODEV, '                                                                          + #13 +
   '   (NVL(PAR_DEV.VLR_DEV, 0) - NVL(PAR_PAG.VLR_PAG, 0)) AS VALOR_DEVIDO, '                      + #13 +
   '   (NVL(SLD.HMESALDODEV, 0) + (NVL(PAR_DEV.VLR_DEV, 0) - NVL(PAR_PAG.VLR_PAG, 0))) AS TOTAL, ' + #13 +
   '   PAR_PAG.VLR_PAG '                                                                           + #13 +
   'FROM '                                                                                         + #13 +
   '   VWCONTRATOEP  CON, '                                                                        + #13 +
   '   ( '                                                                                         + #13 +
   '   SELECT '                                                                                    + #13 +
   '      CON.IDCONTRATOEMPTMO, '                                                                  + #13 +
   '      HME.HMESALDODEV '                                                                        + #13 +
   '   FROM '                                                                                      + #13 +
   '      HISTMOVEMPTMO HME, CONTRATOEMPTMO CON, '                                                 + #13 +
   '      ( '                                                                                      + #13 +
   '      SELECT '                                                                                 + #13 +
   '         CON.IDCONTRATOEMPTMO, MAX(IDHISTMOVEMPTMO) AS IDHISTMOVEMPTMO '                       + #13 +
   '      FROM '                                                                                   + #13 +
   '         HISTMOVEMPTMO HME, CONTRATOEMPTMO CON, '                                              + #13 +
   '         ITEMXTIPOCONTR ITC, ITEMEMPTMO ITE, TIPOCONTREMPTMO TCE '                             + #13 +
   '      WHERE '                                                                                  + #13 +
   '             CON.FLGSITUACAO         <> ''C'' '                                                + #13 +

   '         AND ITC.ITCTRATASALDODEV    <> 0 '                                                    + #13 +
   '         AND ( (HME.FLGESTORNADO      IS NULL) OR (HME.FLGESTORNADO = 0) ) '                   + #13 +
   '         AND ( HME.HMEDATAATUALIZA    <= '                                                     + #13 +
   '               ( '                                                                             + #13 +
   '               SELECT '                                                                        + #13 +
   '                  DECODE(MAX(H.HMEDATAATUALIZA), NULL, TO_DATE(' + sData + ', ''DD/MM/YYYY''), '     + #13 +
   '                                                       MAX(H.HMEDATAATUALIZA)) '                     + #13 +
   '               FROM '                                                                          + #13 +
   '                  HISTMOVEMPTMO   H, '                                                         + #13 +
   '                  CONTRATOEMPTMO  C, '                                                         + #13 +
   '                  ITEMXTIPOCONTR  IT '                                                         + #13 +
   '               WHERE '                                                                         + #13 +
   '                      C.IDCONTRATOEMPTMO    = CON.IDCONTRATOEMPTMO '                           + #13 +
   '                  AND H.HMEDATAATUALIZA    <= TO_DATE(' + sData + ', ''DD/MM/YYYY'') '         + #13 +
   '                  AND IT.ITCTRATASALDODEV  <> 0 '                                              + #13 +
   '                  AND HME.HMEANOCOMPETENCIA = ' + sAno                                         + #13 +
   '                  AND HME.HMEMESCOMPETENCIA = ' + sMes                                         + #13 +
   '                  AND ( H.FLGESTORNADO      = 0 OR H.FLGESTORNADO IS NULL ) '                  + #13 +
   '                  AND H.IDCONTRATOEMPTMO    = C.IDCONTRATOEMPTMO '                             + #13 +
   '                  AND C.IDTIPOCONTREMPTMO   = IT.IDTIPOCONTREMPTMO '                           + #13 +
   '                  AND H.IDITEMEMPTMO        = IT.IDITEMEMPTMO '                                + #13 +
   '               ) '                                                                             + #13 +
   '             ) '                                                                               + #13 +

   '         AND ( (RTRIM(LTRIM(HME.HMEANOCOMPETENCIA))) || (RTRIM(LTRIM(HME.HMEMESCOMPETENCIA))) ) <= ' + (sAno + sMes) + #13 +

   '         AND ( HME.IDCONTRATOEMPTMO   = CON.IDCONTRATOEMPTMO ) '                               + #13 +
   '         AND ( CON.IDTIPOCONTREMPTMO  = ITC.IDTIPOCONTREMPTMO ) '                              + #13 +
   '         AND ( CON.IDTIPOCONTREMPTMO  = TCE.IDTIPOCONTREMPTMO ) '                              + #13 +
   '         AND ( TCE.IDTIPOCONTREMPTMO  = ITC.IDTIPOCONTREMPTMO ) '                              + #13 +
   '         AND ( HME.IDITEMEMPTMO       = ITE.IDITEMEMPTMO ) '                                   + #13 +
   '         AND ( ITE.IDITEMEMPTMO       = ITC.IDITEMEMPTMO ) '                                   + #13 +
   '         AND ( HME.IDITEMEMPTMO       = ITC.IDITEMEMPTMO ) '                                   + #13 +
   '      GROUP BY '                                                                               + #13 +
   '         CON.IDCONTRATOEMPTMO '                                                                + #13 +
   '      ) MAX '                                                                                  + #13 +
   '   WHERE '                                                                                     + #13 +
   '          CON.FLGSITUACAO         <> ''C'' '                                                   + #13 +

   '      AND ( CON.IDCONTRATOEMPTMO   = HME.IDCONTRATOEMPTMO ) '                                  + #13 +
   '      AND ( CON.IDCONTRATOEMPTMO   = MAX.IDCONTRATOEMPTMO ) '                                  + #13 +
   '      AND ( HME.IDHISTMOVEMPTMO    = MAX.IDHISTMOVEMPTMO ) '                                   + #13 +
   '   ) SLD, '                                                                                    + #13 +

   '   ( '                                                                                         + #13 +
   '   SELECT '                                                                                    + #13 +
   '      CON.IDCONTRATOEMPTMO, SUM(NVL(HME.HMEVLRPREVISTO, 0)) AS VLR_DEV '                       + #13 +
   '   FROM '                                                                                      + #13 +
   '      HISTMOVEMPTMO HME, CONTRATOEMPTMO CON '                                                  + #13 +
   '   WHERE '                                                                                     + #13 +
   '          CON.FLGSITUACAO        <> ''C'' '                                                    + #13 +

   '      AND HMETIPOMOV             IN (1, 2, 3, 4) '                                             + #13 +
   '      AND HME.HMESEQCOBRANCA     = 1 '                                                         + #13 +
   '      AND ( (HME.HMECENTRALIZA   = 1) OR (HME.HMEDESTACADO = 1) ) '                            + #13 +
   '      AND ( (HME.FLGESTORNADO    = 0) OR (HME.FLGESTORNADO IS NULL) ) '                        + #13 +


   '      AND ( HME.HMEDATAPREVISTA  <= TO_DATE(' + sData + ', ''DD/MM/YYYY'') ) '                 + #13 +


   '      AND ( CON.IDCONTRATOEMPTMO = HME.IDCONTRATOEMPTMO ) '                                    + #13 +
   '   GROUP BY '                                                                                  + #13 +
   '      CON.IDCONTRATOEMPTMO '                                                                   + #13 +
   '   ) PAR_DEV, '                                                                                + #13 +

   '   ( '                                                                                         + #13 +
   '   SELECT '                                                                                    + #13 +
   '      CON.IDCONTRATOEMPTMO, '                                                                  + #13 +

   '      SUM(DECODE(FLGQUITADO, 1, NVL(HME.HMEVLRPREVISTO, 0), '                                     + #13 +
                                   'DECODE(FLGABONADO, 1, NVL(HME.HMEVLRPREVISTO, 0), '               + #13 +
                                                         'NVL(HME.HMEVLREFETIVO, 0)))) AS VLR_PAG '   + #13 +

   '   FROM '                                                                                      + #13 +
   '      HISTMOVEMPTMO HME, CONTRATOEMPTMO CON '                                                  + #13 +
   '   WHERE '                                                                                     + #13 +
   '          CON.FLGSITUACAO        <> ''C'' '                                                    + #13 +

   '      AND HME.HMETIPOMOV         IN (1, 2, 3, 4) '                                             + #13 +
   '      AND ( (HME.HMECENTRALIZA   = 1) OR (HME.HMEDESTACADO = 1) ) '                            + #13 +
   '      AND ( (HME.FLGESTORNADO    = 0) OR (HME.FLGESTORNADO IS NULL) ) '                        + #13 +

   '      AND HME.HMEDATAPREVISTA    <= TO_DATE(' + sData + ', ''DD/MM/YYYY'') '                   + #13 +

   '      AND ( '                                                                                              + #13 +
   '          (HME.HMEDATAEFETIVA    <= TO_DATE(' + sData + ', ''DD/MM/YYYY'')) '                              + #13 +
   '       OR ( (HME.FLGQUITADO = 1) AND (HME.HMEDATAQUITABONO <= TO_DATE(' + sData + ',''DD/MM/YYYY'')) ) '   + #13 +
   '       OR ( (HME.FLGABONADO = 1) AND (HME.HMEDATAQUITABONO <= TO_DATE(' + sData + ',''DD/MM/YYYY'')) ) '   + #13 +
   '          ) '                                                                                              + #13 +

   '      AND ( CON.IDCONTRATOEMPTMO = HME.IDCONTRATOEMPTMO ) '                                    + #13 +
   '   GROUP BY '                                                                                  + #13 +
   '      CON.IDCONTRATOEMPTMO '                                                                   + #13 +
   '   ) PAR_PAG '                                                                                 + #13 +

   'WHERE '                                                                                        + #13 +

   // filtro por Empresa Proprietátia
   '       CON.IDEMPRESAPROP        = ' + IntToStr(ParamObjeto.iIdEmpresa)                         + #13 +

   '   AND ( CON.FLGSITUACAO        <> ''C'' ) '                                                   + #13 +

   '   AND EXISTS '                                                                                + #13 +
   '       ( '                                                                                     + #13 +
   '       SELECT '                                                                                + #13 +
   '          HE.HMEDATAPREVISTA '                                                                 + #13 +
   '       FROM '                                                                                  + #13 +
   '          HISTMOVEMPTMO HE '                                                                   + #13 +
   '       WHERE '                                                                                 + #13 +
   '              HE.HMETIPOMOV        IN (1, 2, 3, 4) '                                           + #13 +
   '          AND ( HE.HMECENTRALIZA   = 1 OR HE.HMEDESTACADO = 1 ) '                              + #13 +
   '          AND ( HE.FLGESTORNADO    = 0 OR HE.FLGESTORNADO IS NULL ) '                          + #13 +
   '          AND HE.HMEDATAPREVISTA    <= TO_DATE(' + sData + ', ''DD/MM/YYYY'') '                + #13 +

   '          AND ( (HE.HMEDATAEFETIVA  IS NULL) OR (HE.HMEDATAEFETIVA > TO_DATE(' + sData + ', ''DD/MM/YYYY'')) ) '                                                 + #13 +
   '          AND ( (HE.HMEVLREFETIVO   IS NULL) OR (HE.HMEDATAEFETIVA > TO_DATE(' + sData + ', ''DD/MM/YYYY'')) ) '                                                 + #13 +

   '          AND ( (HE.FLGQUITADO      IS NULL OR HE.FLGQUITADO = 0) OR ((HE.FLGQUITADO = 1) AND (HE.HMEDATAQUITABONO > TO_DATE(' + sData + ',''DD/MM/YYYY''))) ) ' + #13 +
   '          AND ( (HE.FLGABONADO      IS NULL OR HE.FLGABONADO = 0) OR ((HE.FLGABONADO = 1) AND (HE.HMEDATAQUITABONO > TO_DATE(' + sData + ',''DD/MM/YYYY''))) ) ' + #13 +

   '          AND HE.IDCONTRATOEMPTMO   = CON.IDCONTRATOEMPTMO '                                   + #13 +
   '       ) '                                                                                     + #13 +

   '   AND ( CON.IDCONTRATOEMPTMO   = SLD.IDCONTRATOEMPTMO ) '                                     + #13 +
   '   AND ( CON.IDCONTRATOEMPTMO   = PAR_DEV.IDCONTRATOEMPTMO(+) ) '                              + #13 +
   '   AND ( CON.IDCONTRATOEMPTMO   = PAR_PAG.IDCONTRATOEMPTMO(+) ) '                              + #13 +
   ') SS ' + #13 +
   'WHERE DM.MOECODIGO = SS.MOECODIGO ' + #13 +
   ' GROUP BY CODINDEXADOR ';
   result := GetDataPacket(sSql);
end;

procedure TCtrlEmprestimo.AfterInitialize;
begin
  inherited;
// inicializar os dbObjects  FDbPlanPrev.DataBaseName := DataBaseName;
end;

constructor TCtrlEmprestimo.Create;
begin
  inherited Create;
  ParamObjeto.iIdEmpresa := iIdEmpresa;
end;

destructor TCtrlEmprestimo.Destroy;
begin
// Destruir os componentes  FreeAndNil(FDbPlanPrev);
  // Destrói os Cds criados somente se os mesmos foram criados pelo CtrlObject
//  if isAppServer then FreeAndNil(FCdsPlanPrev);
  inherited;
end;


procedure TCtrlEmprestimo.OnCreateAppServer;
begin
  inherited;
// Criar o cliente data set  FCdsPlanPrev := TCMClientDataSet.Create( nil );
end;

end.
