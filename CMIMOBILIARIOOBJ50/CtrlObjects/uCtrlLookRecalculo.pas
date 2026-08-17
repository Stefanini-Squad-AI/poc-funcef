unit uCtrlLookRecalculo;

interface

Uses                                                                         

  sysutils, uCmControlObject, uCmDbObject, uCmClientDataSet, uComunsImobiliarioDB, uComunsImobiliario,
  uCtrlParamIntegra, uCMFileUtils, uCtrlModuloImobiliario, uCMTypes;


Type TCtrlLookRecalculo = class(TCmControlObject)
     private

        ParamSistema          : TParamSistema;
        ComunsImobiliarioDB   : TComunsImobiliarioDB;
        CtrlParamIntegra      : TCtrlParamIntegra;
        CtrlModuloImobiliario : TCtrlModuloImobiliario;

     protected
        procedure AfterInitialize;  Override;
        procedure OnCreateAppServer; Override;

     public
        constructor Create(const iIdEmpresa,
                                 iIdModulo,
                                 iIdUsuario,
                                 iIdEspAcesso,
                                 iIdPlanoPrev,
                                 iIdPatro: Integer;
                           const bUsaPlanoPatro: Boolean); reintroduce;
                           
        destructor  Destroy; override;

        function    LookupDocumento(const iDocumento : Integer) : OleVariant;

        function    LookupLancamentos(const iDocumento : Integer) : OleVariant;

        function    LookupAlteradoresDoc(const iDocumento : Integer) : OleVariant;

        function    LookupContrato(const iContrato : Integer) : OleVariant;

        function    LookupUltimaBaixa(const iDocumento : Integer) : OleVariant;

        function    LookupTotalInadimplencia(const iContrato  : Integer;
                                             const dDataIni   : TDateTime;
                                             const dDataFim   : TDateTime;
                                             const iDocumento : Integer) : OleVariant;

        function    LookupAlteradores(const iDocumento : Integer) : OleVariant;

        function    LookupAlteradoresLancados(const iDocumento : Integer) : OleVariant;

        function    LookupPortadorForma : OleVariant;

        function    LookupMoeda : OleVariant;

        function    UpdateDocumento(const iDocumento : Integer) : Boolean;

        function    UpdateMensagemCnab(const iCodGrupo  : Integer = -1;
                                       const iDocumento : Integer = -1;
                                       const sMensagem1 : String  = '';
                                       const sMensagem2 : String  = '';
                                       const sMensagem3 : String  = '';
                                       const sMensagem4 : String  = '';
                                       const sMensagem5 : String  = '';
                                       const sMensagem6 : String  = '';
                                       const sMensagem7 : String  = '';
                                       const sMensagem8 : String  = '';
                                       const sMensagem9 : String  = '') : Boolean;

        function    UpdatePortadorForma(const iDocumento  : Integer;
                                        const iPortadorAnt: Integer;
                                        const iPortador   : Integer;
                                        const bAlteraData : Boolean;
                                        const dNovaData   : TDateTime ) : Boolean;

     published

end;



implementation

{ TCtrlLookRecalculo }



procedure TCtrlLookRecalculo.AfterInitialize;
begin
   inherited;
   ComunsImobiliarioDB.InitializeAs( Self );
   CtrlParamIntegra.InitializeAs( Self );
   CtrlModuloImobiliario.InitializeAs( Self );

   CtrlModuloImobiliario.AdminImob.GetParam(ParamSistema.idEmpresa);
   CtrlModuloImobiliario.Alienacao.GetParam(ParamSistema.idEmpresa);
end;



constructor TCtrlLookRecalculo.Create(const iIdEmpresa, iIdModulo, iIdUsuario, iIdEspAcesso, iIdPlanoPrev, iIdPatro: Integer; const bUsaPlanoPatro: Boolean);
begin
   inherited Create;
   ComunsImobiliarioDB   := TComunsImobiliarioDB.Create(iIdEmpresa, iIdModulo, iIdUsuario, iIdEspAcesso, bUsaPlanoPatro);
   ComunsImobiliarioDB   := TComunsImobiliarioDB.Create(iIdEmpresa, iIdModulo, iIdUsuario, iIdEspAcesso, bUsaPlanoPatro);
   CtrlParamIntegra      := TCtrlParamIntegra.Create;
   CtrlModuloImobiliario := TCtrlModuloImobiliario.Create;

   ParamSistema.idEmpresa     := iIdEmpresa;
   ParamSistema.idModulo      := iIdModulo;
   ParamSistema.idUsuario     := iIdUsuario;
   ParamSistema.idEspAcesso   := iIdEspAcesso;

   // Busca parämetros globais
   CtrlParamIntegra.GetParams(ParamSistema.idEmpresa,0,'','', tiSistema);
end;



destructor TCtrlLookRecalculo.Destroy;
begin
   FreeAndNil( ComunsImobiliarioDB );
   FreeAndNil( CtrlParamIntegra );
   FreeAndNil( CtrlModuloImobiliario );
   inherited;
end;



procedure TCtrlLookRecalculo.OnCreateAppServer;
begin
   inherited;

end;



function TCtrlLookRecalculo.LookupAlteradoresDoc(const iDocumento: Integer): OleVariant;
var
   sSQL : String;
begin
   if ParamSistema.idModulo = 64 then
   begin
      sSQL :=
      'SELECT DISTINCT LD.CODDOCUMENTO,'                                                                           + #13+
      '                DECODE(LD.DEBCRE,''D'',''Acréscimo'',''Desconto'') AS DEBCRE,'                              + #13+
      '                LD.VALOR,'                                                                                  + #13+
      '                LD.NUMLANCTO,'                                                                              + #13+
      '                A.DESCRICAO'                                                                                + #13+
      'FROM LANCTODOCUM LD, LANCAMENTOSIMOVEL L, TIPOIMOVEL T, TIPOALTERADOR A'                                    + #13+
      'WHERE ( LD.CODALTERADOR  = A.CODALTERADOR )'                                                                + #13+
      '  AND ( LD.CODDOCUMENTO  = L.CODDOCUMENTO )'                                                                + #13+
      '  AND ( L.CODTIPIMOVEL   = T.CODTIPIMOVEL )'                                                                + #13+
      '  AND RTRIM(LD.OPERACAO) = ''4'''                                                                           + #13+
      '  AND LD.DATALANCTO  < SYSDATE'                                                                             + #13+
      '  AND LD.CODDOCUMENTO = ' + IntToStr(iDocumento)                                                            + #13+
      '  AND LD.ESTORNO IS NULL'                                                                                   + #13+
      '  AND NVL(LD.CODALTERADOR,0) <> T.CODALTMULTA'                                                              + #13+
      '  AND NVL(LD.CODALTERADOR,0) <> T.CODALTJUROS'                                                              + #13+
      '  AND NVL(LD.CODALTERADOR,0) <> T.CODALTCORRMON'                                                            + #13;
   end
   else
   begin
      sSQL :=
      'SELECT DISTINCT LD.CODDOCUMENTO,'                                                                           + #13+
      '                DECODE(LD.DEBCRE,''D'',''Acréscimo'',''Desconto'') AS DEBCRE,'                              + #13+
      '                LD.VALOR,'                                                                                  + #13+
      '                LD.NUMLANCTO,'                                                                              + #13+
      '                A.DESCRICAO'                                                                                + #13+
      'FROM LANCTODOCUM LD, PARCFINANCIMOV L, CONDPAGIMOVEL CP,'                                                   + #13+
      '     CONTRATOXIMOVEL CI, IMOVEL I, TIPOIMOVEL T, TIPOALTERADOR A'                                           + #13+
      'WHERE ( LD.CODALTERADOR  = A.CODALTERADOR )'                                                                + #13+
      '  AND ( LD.CODDOCUMENTO  = L.CODDOCUMENTO )'                                                                + #13+
      '  AND ( I.CODTIPIMOVEL   = T.CODTIPIMOVEL )'                                                                + #13+
      '  AND RTRIM(LD.OPERACAO) = ''4'''                                                                           + #13+
      '  AND LD.DATALANCTO  < SYSDATE'                                                                             + #13+
      '  AND L.IDCONDPAGIMOVEL = CP.IDCONDPAGIMOVEL'                                                               + #13+
      '  AND CI.IDCONTRATOIMOVEL = CP.IDCONTRATOIMOVEL'                                                            + #13+
      '  AND I.IDIMOVEL = CI.IDIMOVEL'                                                                             + #13+
      '  AND LD.CODDOCUMENTO = ' + IntToStr(iDocumento)                                                            + #13+
      '  AND LD.ESTORNO IS NULL'                                                                                   + #13+
      '  AND NVL(LD.CODALTERADOR,0) <> T.CODALTMTAL'                                                               + #13+
      '  AND NVL(LD.CODALTERADOR,0) <> T.CODALTJRAL'                                                               + #13+
      '  AND NVL(LD.CODALTERADOR,0) <> T.CODALTCMAL'                                                               + #13;
   end;

   Result := GetDataPacket(sSQL);


end;

function TCtrlLookRecalculo.LookupDocumento( const iDocumento: Integer): OleVariant;
var
   sSQL : String;
begin

   if ParamSistema.idModulo = 64 then
   begin
      sSQL :=
      'SELECT VW.DESCCUSTORECIMO,   VW.RECPAG,         VW.FORCLI_DOC,     VW.STATUS_DOC,        VW.PLNPLANIL,'           + #13+
      '       VW.PLNCODIGO,         VW.CODDOCUMENTO,   VW.IDDOCUMENTO,    VW.NODOCUMENTO,       VW.PORTADOR_FORMA,'      + #13+
      '       VW.CODPORTFORMA_LANC, VW.MOEDA_LANC,     VW.COD_MOEDA,      VW.IDTIPOCUSTORECIMO, VW.IDFORCLI,'            + #13+
      '       VW.NF_FORCLI,         VW.RS_FORCLI,      VW.DATALANCAMENTO, VW.DATAVENCIMENTO,    VW.DATA_BAIXA,'          + #13+
      '       VW.MESCOMPETENCIA,    VW.ANOCOMPETENCIA, VW.FLGORIGEMLANC,  VW.CODTIPIMOVEL, '                             + #13+
      '       VW.DOC_CAPCAR,        VW.NUMAPGR,        VW.NOSSONUMERO,    VW.CODGRUPOCNAB,      VW.DATALIMITE,'          + #13+
      '       VW.EFETIVO AS VALOR_RECEBIDO, VW.CONTRATO_EXTENSO, VW.IDCONTRATOIMOVEL,  '                                 + #13+
      '       VW.LOGIN_USUARIO, VW.NF_USUARIO, VW.TRGDTINCLUSAO, VW.IDCONFIGBARRAS, VW.FLGTIPOCONTRATO, 0 AS NUMPARCELA,'+ #13+
      '       SUM(VW.VALOR_LANC) AS VALOR_TOTAL,'                                                                        + #13+
      '       SUM(DECODE(LD.DEBCRE,''D'',LD.VALOR,LD.VALOR*-1)) AS TOT_ALTERADOR,'                                       + #13+
      '       NVL(SUM(VW.VALOR_LANC),0) + NVL(SUM(DECODE(LD.DEBCRE,''D'',LD.VALOR,LD.VALOR*-1)),0) AS VALOR_LIQUIDO,'    + #13+
      'FROM VWLANCAMENTO VW,'                                                                                            + #13+
      '   ( SELECT DISTINCT LD.CODDOCUMENTO, LD.DEBCRE, LD.VALOR, LD.NUMLANCTO'                                          + #13+
      '     FROM LANCTODOCUM LD, LANCAMENTOSIMOVEL L, TIPOIMOVEL T'                                                      + #13+
      '     WHERE LD.CODDOCUMENTO    = L.CODDOCUMENTO'                                                                   + #13+
      '       AND L.CODTIPIMOVEL    = T.CODTIPIMOVEL'                                                                    + #13+
      '       AND RTRIM(LD.OPERACAO) = ''4'''                                                                            + #13+
      '       AND LD.DATALANCTO  < SYSDATE'                                                                              + #13+
      '       AND LD.ESTORNO IS NULL'                                                                                    + #13+
      '       AND NVL(LD.CODALTERADOR,0) <> T.CODALTMULTA'                                                               + #13+
      '       AND NVL(LD.CODALTERADOR,0) <> T.CODALTJUROS'                                                               + #13+
      '       AND NVL(LD.CODALTERADOR,0) <> T.CODALTCORRMON ) LD'                                                        + #13+
      'WHERE  VW.CODDOCUMENTO = LD.CODDOCUMENTO(+)'                                                                      + #13+
      '  AND  VW.IDPESSOA        = ' + IntToStr(ParamSistema.idEmpresa)                                                  + #13+
      '  AND  VW.IDDOCUMENTO     = ' + IntToStr(iDocumento)                                                              + #13+
      'GROUP BY VW.DESCCUSTORECIMO, VW.RECPAG,         VW.FORCLI_DOC,     VW.STATUS_DOC,        VW.PLNPLANIL,'           + #13+
      '       VW.PLNCODIGO,         VW.CODDOCUMENTO,   VW.IDDOCUMENTO,    VW.NODOCUMENTO,       VW.PORTADOR_FORMA,'      + #13+
      '       VW.CODPORTFORMA_LANC, VW.MOEDA_LANC,     VW.COD_MOEDA,      VW.IDTIPOCUSTORECIMO, VW.IDFORCLI,'            + #13+
      '       VW.NF_FORCLI,         VW.RS_FORCLI,      VW.DATALANCAMENTO, VW.DATAVENCIMENTO,    VW.DATA_BAIXA,'          + #13+
      '       VW.MESCOMPETENCIA,    VW.ANOCOMPETENCIA, VW.FLGORIGEMLANC,  VW.CODTIPIMOVEL, '                             + #13+
      '       VW.DOC_CAPCAR,        VW.NUMAPGR,        VW.NOSSONUMERO,    VW.CODGRUPOCNAB,      VW.DATALIMITE,'          + #13+
      '       VW.EFETIVO AS VALOR_RECEBIDO, VW.CONTRATO_EXTENSO, VW.IDCONTRATOIMOVEL,  '                                 + #13+
      '       VW.LOGIN_USUARIO, VW.NF_USUARIO, VW.TRGDTINCLUSAO, VW.IDCONFIGBARRAS, VW.FLGTIPOCONTRATO'                  + #13;
   end
   else
   begin
      sSQL :=
      'SELECT /*+ INDEX (L) INDEX(PLN) INDEX (D, XPKDOCUMENTO) INDEX(PFC) INDEX(PU) INDEX(T) */'                         + #13+
      '   DECODE(L.FLGTIPOLANC, 1,''Saldo Inicial'','                                                                    + #13+
      '                         2,''Sinal'','                                                                            + #13+
      '                         3,''Parc. Gerada'','                                                                     + #13+
      '                         4,''Parc. Projetada'','                                                                  + #13+
      '                         5,''Amort. Extra'','                                                                     + #13+
      '                         6,''Acerto Divergência'','                                                               + #13+
      '                         7,''Venda a Vista'','                                                                    + #13+
      '                         8,''Caução'','                                                                           + #13+
      '                         9,''Parc. Antecipada'','                                                                 + #13+
      '                        10,''Pagto Resíduo'','                                                                    + #13+
      '                        11,''Atualização de Saldo'','                                                             + #13+
      '                        12,''Ajuste de Saldo'') AS DESCCUSTORECIMO,'                                              + #13+
      '   D.RECPAG, D.IDFORCLI AS FORCLI_DOC, RTRIM(D.STATUS) AS STATUS_DOC, PLN.PLNPLANIL, PLN.PLNCODIGO,'              + #13+
      '   D.CODDOCUMENTO, D.CODDOCUMENTO AS IDDOCUMENTO, D.NODOCUMENTO, PF.DESCRICAO AS PORTADOR_FORMA,'                 + #13+
      '   D.CODPORTFORMA AS CODPORTFORMA_LANC, DECODE(D.RECPAG, ''R'', MR.MOESIGLA, MP.MOESIGLA) AS MOEDA_LANC,'         + #13+
      '   DECODE(D.RECPAG, ''R'', MR.MOECODIGO, MP.MOECODIGO) AS COD_MOEDA, -1 AS IDTIPOCUSTORECIMO, D.IDFORCLI,'        + #13+
      '   PFC.NOME AS NF_FORCLI, PFC.RAZAOSOCIAL AS RS_FORCLI, LD.DATALANCTO AS DATALANCAMENTO,'                         + #13+
      '   D.DATAVENCTO AS DATAVENCIMENTO, DECODE(RTRIM(D.STATUS), ''2'', BX.DATABAIXA, NULL) AS DATA_BAIXA,'             + #13+
      '   SUBSTR(TO_CHAR(D.DATAVENCTO),4,2) AS MESCOMPETENCIA,'                                                          + #13+
      '   SUBSTR(TO_CHAR(D.DATAVENCTO),7,4) AS ANOCOMPETENCIA,'                                                          + #13+
      '   D.NODOCUMENTO AS DOC_CAPCAR, D.NUMAPGR, D.NOSSONUMERO, D.CODGRUPOCNAB, '                                       + #13+
      '   DECODE(D.RECPAG, ''R'', VAL.TOT_RECEBIDO, VAL.TOT_PAGO) AS VALOR_RECEBIDO,'                                    + #13+
      '   DECODE(C.CONNUMERO, NULL, C.CONNOME, C.CONNUMERO||'' - ''||C.CONNOME) AS CONTRATO_EXTENSO,'                    + #13+
      '   CP.IDCONTRATOIMOVEL, I.CODTIPIMOVEL, '                                                                         + #13+
      '   VAL.TOT_RECEBER AS VALOR_TOTAL,'                                                                               + #13+
      '   VAL.TOT_ALTERADOR,'                                                                                            + #13+
      '   VAL.TOT_RECEBER + NVL(ALT.TOT_ALTERADOR,0) - VAL.TOT_RECEBIDO AS VALOR_LIQUIDO,'                                      + #13+
      '   U.NOMEUSUARIO AS LOGIN_USUARIO,'                                                                               + #13+
      '   PU.NOME AS NF_USUARIO,'                                                                                        + #13+
      '   D.TRGDTINCLUSAO, PF.IDCONFIGBARRAS, C.FLGTIPOCONTRATO, L.DATALIMITE, '                                         + #13+
      '   DECODE(L.NUMPARCELA,0,NULL,TO_CHAR(L.NUMPARCELA) || ''/'' || TO_CHAR(CP.NUMPARCELAS)) AS NUMPARCELA '          + #13+
      'FROM'                                                                                                             + #13+
      '   PESSOA PFC,'                                                                                                   + #13+
      '   PESSOA PU,'                                                                                                    + #13+
      '   DOCUMENTO D, PLANILHA PLN,'                                                                                    + #13+
      '   PARCFINANCIMOV L,'                                                                                             + #13+
      '   IMOVEL I, IMOVEL IM, CONTRATOIMOVEL C,'                                                                        + #13+
      '   CONTRATOXIMOVEL CI,'                                                                                           + #13+
      '   MOEDA MR, MOEDA MP, PORTADORFORMA PF, PORTADORFORMA PFL,'                                                      + #13+
      '   FORMARECPAG FRP,'                                                                                              + #13+
      '   CENTCUST CC,'                                                                                                  + #13+
      '   USUARIOSISTEMA U,'                                                                                             + #13+
      '   CONDPAGIMOVEL CP,'                                                                                             + #13+
      '   LANCTODOCUM LD,'                                                                                               + #13+
      '   ('                                                                                                             + #13+
      '   SELECT /*+ INDEX(D1) INDEX(LD) */'                                                                             + #13+
      '          D1.CODDOCUMENTO, D1.FLGNAOCONCILIADO, D1.STATUS,'                                                       + #13+
      '          SUM(LD.VALOR)      AS VALORPAGO,'                                                                       + #13+
      '          DECODE( MIN(MMM.DATALANCFINAN),NULL,MIN(LD.DATALANCTO), MIN(MMM.DATALANCFINAN)'                         + #13+
      '                 ) AS DATABAIXA'                                                                                  + #13+
      '     FROM DOCUMENTO D1, LANCTODOCUM LD,'                                                                          + #13+
      '         ('                                                                                                       + #13+
      '          SELECT XX.IDRELACIONANI,'                                                                               + #13+
      '                 XX.MOVIN_FINAN,'                                                                                 + #13+
      '                 XX.DATALANCFINAN,'                                                                               + #13+
      '                 MM.CODDOCUMENTO'                                                                                 + #13+
      '            FROM'                                                                                                 + #13+
      '                 ('                                                                                               + #13+
      '                  SELECT R2.IDRELACIONANI,'                                                                       + #13+
      '                         R2.CODLANCFINANC AS MOVIN_FINAN,'                                                        + #13+
      '                         M.DATALANCFINAN,'                                                                        + #13+
      '                         R2.FLGNI'                                                                                + #13+
      '                    FROM RELACIONANI R2,'                                                                         + #13+
      '                         MOVIMFINANC M'                                                                           + #13+
      '                   WHERE R2.CODLANCFINANC = M.CODLANCFINANC'                                                      + #13+
      '                     AND R2.IDRELACIONANI IN ('                                                                   + #13+
      '                                              SELECT /*+ INDEX(RB) */'                                            + #13+
      '                                                     R3.IDRELACIONANI'                                            + #13+
      '                                                FROM RELACIONANI R3,'                                             + #13+
      '                                                     RECBTOPAGTO RB'                                              + #13+
      '                                               WHERE R3.CODLANCFINANC = RB.CODLANCFINANC'                         + #13+
      '                                              )'                                                                  + #13+
      '                 ) XX,'                                                                                           + #13+
      '                  ('                                                                                              + #13+
      '                  SELECT CJ1.IDRELACIONANI, CJ1.MOVIN_FINAN,'                                                     + #13+
      '                         CJ2.CODDOCUMENTO'                                                                        + #13+
      '                    FROM ('                                                                                       + #13+
      '                          SELECT R2.IDRELACIONANI,'                                                               + #13+
      '                                 R2.CODLANCFINANC AS MOVIN_FINAN,'                                                + #13+
      '                                 M.DATALANCFINAN,'                                                                + #13+
      '                                 R2.FLGNI'                                                                        + #13+
      '                            FROM RELACIONANI R2,'                                                                 + #13+
      '                                 MOVIMFINANC M'                                                                   + #13+
      '                           WHERE R2.CODLANCFINANC = M.CODLANCFINANC'                                              + #13+
      '                             AND R2.IDRELACIONANI IN ('                                                           + #13+
      '                                                      SELECT R3.IDRELACIONANI'                                    + #13+
      '                                                        FROM RELACIONANI R3,'                                     + #13+
      '                                                             RECBTOPAGTO RB'                                      + #13+
      '                                                       WHERE R3.CODLANCFINANC = RB.CODLANCFINANC'                 + #13+
      '                                                      )'                                                          + #13+
      '                         ) CJ1,'                                                                                  + #13+
      '                          ('                                                                                      + #13+
      '                          SELECT  /*+ INDEX(R, XPKRECBTOPAGTO) */'                                                + #13+
      '                                 DISTINCT R.CODDOCUMENTO,'                                                        + #13+
      '                                          R.CODLANCFINANC AS MOVIN_DOCUM'                                         + #13+
      '                                     FROM RECBTOPAGTO R,'                                                         + #13+
      '                                          PARCFINANCIMOV DD'                                                      + #13+
      '                                    WHERE R.CODDOCUMENTO = DD.CODDOCUMENTO'                                       + #13+
      '                         ) CJ2'                                                                                   + #13+
      '                   WHERE CJ2.MOVIN_DOCUM = CJ1.MOVIN_FINAN'                                                       + #13+
      '                 ) MM'                                                                                            + #13+
      '          WHERE MM.IDRELACIONANI = XX.IDRELACIONANI'                                                              + #13+
      '            AND XX.FLGNI = ''I'''                                                                                 + #13+
      '          ) MMM'                                                                                                  + #13+
      '    WHERE ( D1.IDMODULO = 135 )'                                                                                  + #13+
      '      AND ( RTRIM(LD.OPERACAO) = ''5'' )'                                                                         + #13+
      '      AND ( LD.ESTORNO IS NULL )'                                                                                 + #13+
      '      AND ( D1.CODDOCUMENTO = LD.CODDOCUMENTO )'                                                                  + #13+
      '      AND ( D1.CODDOCUMENTO = MMM.CODDOCUMENTO(+) )'                                                              + #13+
      '   GROUP BY D1.CODDOCUMENTO, D1.FLGNAOCONCILIADO, D1.STATUS'                                                      + #13+
      '  ) BX,'                                                                                                          + #13+
      '  ('                                                                                                              + #13+
      '   SELECT /*+ INDEX (D, XPKDOCUMENTO) INDEX(LD) */'                                                               + #13+
      '      D.CODDOCUMENTO,'                                                                                            + #13+
      '      SUM('                                                                                                       + #13+
      '      DECODE(RTRIM(LD.OPERACAO),  ''1'', DECODE(D.RECPAG, ''R'', DECODE(LD.DEBCRE, ''D'', LD.VALOR, LD.VALOR * -1), 0), 0) +' + #13+
      '      DECODE(RTRIM(LD.OPERACAO),  ''2'', DECODE(D.RECPAG, ''R'', DECODE(LD.DEBCRE, ''D'', LD.VALOR, LD.VALOR * -1), 0), 0) +' + #13+
      '      DECODE(RTRIM(LD.OPERACAO),  ''3'', DECODE(D.RECPAG, ''R'', DECODE(LD.DEBCRE, ''D'', LD.VALOR, LD.VALOR * -1), 0), 0) +' + #13+
      '      DECODE(RTRIM(LD.OPERACAO), ''12'', DECODE(D.RECPAG, ''R'', DECODE(LD.DEBCRE, ''D'', LD.VALOR, LD.VALOR * -1), 0), 0)'   + #13+
      '      ) AS TOT_RECEBER,'                                                                                          + #13+
      '      SUM('                                                                                                       + #13+
      '      DECODE(RTRIM(LD.OPERACAO),  ''4'', DECODE(D.RECPAG, ''R'', DECODE(LD.DEBCRE, ''D'', LD.VALOR, LD.VALOR * -1),' + #13+
      '                                                                 DECODE(LD.DEBCRE, ''C'', LD.VALOR, LD.VALOR * -1) ), 0)' + #13+
      '      ) AS TOT_ALTERADOR,'                                                                                        + #13+
      '      SUM('                                                                                                       + #13+
      '      DECODE(RTRIM(LD.OPERACAO), ''5'', DECODE(D.RECPAG, ''R'', DECODE(LD.DEBCRE, ''C'', LD.VALOR, LD.VALOR * -1), 0), 0)' + #13+
      '      ) AS TOT_RECEBIDO,'                                                                                         + #13+
      '      SUM('                                                                                                       + #13+
      '      DECODE(RTRIM(LD.OPERACAO),  ''1'', DECODE(D.RECPAG, ''P'', DECODE(LD.DEBCRE, ''C'', LD.VALOR, LD.VALOR * -1), 0), 0) +' + #13+
      '      DECODE(RTRIM(LD.OPERACAO),  ''2'', DECODE(D.RECPAG, ''P'', DECODE(LD.DEBCRE, ''C'', LD.VALOR, LD.VALOR * -1), 0), 0) +' + #13+
      '      DECODE(RTRIM(LD.OPERACAO),  ''3'', DECODE(D.RECPAG, ''P'', DECODE(LD.DEBCRE, ''C'', LD.VALOR, LD.VALOR * -1), 0), 0) +' + #13+
      '      DECODE(RTRIM(LD.OPERACAO), ''12'', DECODE(D.RECPAG, ''P'', DECODE(LD.DEBCRE, ''C'', LD.VALOR, LD.VALOR * -1), 0), 0)'   + #13+
      '      ) AS TOT_PAGAR,'                                                                                            + #13+
      '      SUM('                                                                                                       + #13+
      '      DECODE(RTRIM(LD.OPERACAO), ''5'', DECODE(D.RECPAG, ''P'', DECODE(LD.DEBCRE, ''D'', LD.VALOR, LD.VALOR * -1), 0), 0)' + #13+
      '      ) AS TOT_PAGO'                                                                                              + #13+
      '   FROM'                                                                                                          + #13+
      '      DOCUMENTO D, LANCTODOCUM LD'                                                                                + #13+
      '   WHERE'                                                                                                         + #13+
      '      ( D.IDMODULO = 135 )'                                                                                       + #13+
      '      AND ( D.CODDOCUMENTO = LD.CODDOCUMENTO )'                                                                   + #13+
      '   GROUP BY'                                                                                                      + #13+
      '      D.CODDOCUMENTO'                                                                                             + #13+
      '   ) VAL,'                                                                                                        + #13+

      '   (SELECT'                                                                                                       + #13+
      '       LD.CODDOCUMENTO, SUM(LD.VALOR) AS TOT_ALTERADOR'                                                           + #13+
      '    FROM'                                                                                                         + #13+
      '       LANCTODOCUM LD,'                                                                                           + #13+
      '       ( SELECT T.CODALTMTAL, T.CODALTJRAL, T.CODALTCMAL'                                                         + #13+
      '           FROM PARCFINANCIMOV L, CONDPAGIMOVEL CP,'                                                              + #13+
      '                CONTRATOXIMOVEL CI, IMOVEL I, TIPOIMOVEL T, TIPOALTERADOR A'                                      + #13+
      '          WHERE ( I.CODTIPIMOVEL    = T.CODTIPIMOVEL )'                                                           + #13+
      '            AND L.IDCONDPAGIMOVEL   = CP.IDCONDPAGIMOVEL'                                                         + #13+
      '            AND CI.IDCONTRATOIMOVEL = CP.IDCONTRATOIMOVEL'                                                        + #13+
      '            AND I.IDIMOVEL          = CI.IDIMOVEL'                                                                + #13+
      '            AND L.CODDOCUMENTO      = ' + IntToStr(iDocumento)                                                    + #13+
      '          GROUP BY T.CODALTMTAL, T.CODALTJRAL, T.CODALTCMAL ) TA'                                                 + #13+
      '    WHERE'                                                                                                        + #13+
      '          LD.CODDOCUMENTO   = ' + IntToStr(iDocumento)                                                            + #13+
      '       AND ( LD.OPERACAO    = ''4 '' )'                                                                           + #13+
      '       AND ( LD.CODALTERADOR NOT IN (TA.CODALTMTAL, TA.CODALTJRAL, TA.CODALTCMAL) )'                              + #13+
      '    GROUP BY LD.CODDOCUMENTO) ALT'                                                                                + #13+

      'WHERE'                                                                                                            + #13+
      '       ( I.FLGTIPOIMOVEL = 1 )'                                                                                   + #13+
      '   AND ( IM.FLGTIPOIMOVEL = 0 )'                                                                                  + #13+
      '   AND ( CI.IDIMOVEL = I.IDIMOVEL )'                                                                              + #13+
      '   AND ( I.IDIMOVELMESTRE = IM.IDIMOVEL )'                                                                        + #13+
      '   AND ( CP.IDCONTRATOIMOVEL = C.IDCONTRATOIMOVEL )'                                                              + #13+
      '   AND ( D.MOECODIGO = MR.MOECODIGO(+) )'                                                                         + #13+
      '   AND ( D.MOECODIGO = MP.MOECODIGO(+) )'                                                                         + #13+
      '   AND ( D.IDFORCLI = PFC.IDPESSOA )'                                                                             + #13+
      '   AND ( D.IDUSUARIOINCLUSAO = U.IDUSUARIO(+) )'                                                                  + #13+
      '   AND ( U.IDUSUARIO = PU.IDPESSOA )'                                                                             + #13+
      '   AND ( L.PLNCODIGO = PLN.PLNCODIGO(+) )'                                                                        + #13+
      '   AND ( D.CODFORMA = FRP.CODFORMA(+) )'                                                                          + #13+
      '   AND ( D.CODCENTROCUSTO = CC.CODCENTROCUSTO(+) )'                                                               + #13+
      '   AND ( D.IDEMPRESA = CC.IDEMPRESA(+) )'                                                                         + #13+
      '   AND ( D.CODPORTFORMA = PFL.CODPORTFORMA(+) )'                                                                  + #13+
      '   AND ( D.CODPORTFORMA = PF.CODPORTFORMA(+) )'                                                                   + #13+
      '   AND ( L.CODDOCUMENTO = D.CODDOCUMENTO(+) )'                                                                    + #13+
      '   AND ( D.CODDOCUMENTO = BX.CODDOCUMENTO(+) )'                                                                   + #13+
      '   AND ( D.CODDOCUMENTO = VAL.CODDOCUMENTO(+) )'                                                                  + #13+
      '   AND ( D.CODDOCUMENTO = ALT.CODDOCUMENTO(+) )'                                                                  + #13+
      '   AND CP.IDCONDPAGIMOVEL = L.IDCONDPAGIMOVEL'                                                                    + #13+
      '   AND CI.IDCONTRATOIMOVEL = C.IDCONTRATOIMOVEL'                                                                  + #13+
      '   AND LD.CODDOCUMENTO = D.CODDOCUMENTO'                                                                          + #13+
      '   AND LD.OPERACAO = 2'                                                                                           + #13+
      '   AND D.CODDOCUMENTO = ' + IntToStr(iDocumento)                                                                  + #13;
   end;

   Result := GetDataPacket(sSQL);
end;




function TCtrlLookRecalculo.LookupLancamentos(const iDocumento: Integer): OleVariant;
var
   sSQL : String;
begin
   if ParamSistema.idModulo = 64 then
   begin
      sSQL :=
      'SELECT'                                    + #13+
      '   L.IMOVEL_EXTENSO,'                      + #13+
      '   L.CONTRATO_EXTENSO,'                    + #13+
      '   L.IMOCODIGO,'                           + #13+
      '   L.VALOR_LANC'                           + #13+
      'FROM'                                      + #13+
      '   VWLANCAMENTO L'                         + #13+
      'WHERE'                                     + #13+
      '   CODDOCUMENTO = ' + IntToStr(iDocumento) + #13;
   end
   else
   begin
      sSQL :=
      'SELECT /*+ INDEX (L) */'                                                                         + #13+
      '   IM.IMONOME||'' - ''||I.IMONOME AS IMOVEL_EXTENSO,'                                            + #13+
      '   I.IMOCODIGO,'                                                                                 + #13+
      '   DECODE(C.CONNUMERO, NULL, C.CONNOME, C.CONNUMERO||'' - ''||C.CONNOME) AS CONTRATO_EXTENSO,'   + #13+
      '   L.VLRPRESTACAO AS VALOR_LANC'                                                                 + #13+
      'FROM'                                                                                            + #13+
      '   PARCFINANCIMOV L,'                                                                            + #13+
      '   IMOVEL I, IMOVEL IM, CONTRATOIMOVEL C,'                                                       + #13+
      '   CONTRATOXIMOVEL CI,'                                                                          + #13+
      '   CONDPAGIMOVEL CP'                                                                             + #13+
      'WHERE'                                                                                           + #13+
      '       ( I.FLGTIPOIMOVEL = 1 )'                                                                  + #13+
      '   AND ( IM.FLGTIPOIMOVEL = 0 )'                                                                 + #13+
      '   AND ( CI.IDIMOVEL = I.IDIMOVEL )'                                                             + #13+
      '   AND ( I.IDIMOVELMESTRE = IM.IDIMOVEL )'                                                       + #13+
      '   AND ( CP.IDCONTRATOIMOVEL = C.IDCONTRATOIMOVEL )'                                             + #13+
      '   AND CP.IDCONDPAGIMOVEL = L.IDCONDPAGIMOVEL'                                                   + #13+
      '   AND CI.IDCONTRATOIMOVEL = C.IDCONTRATOIMOVEL'                                                 + #13+
      '   AND L.CODDOCUMENTO = ' + IntToStr(iDocumento)                                                 + #13;
   end;

   Result := GetDataPacket(sSQL);
end;



function TCtrlLookRecalculo.LookupContrato(const iContrato: Integer): OleVariant;
var
   sSQL : String;
begin
   sSQL :=
   'SELECT'                                                     + #13+
   '   IDINDCORRECAO, CONMESREFREAJUSTE, CONVLRMULTA,'          + #13+
   '   CONMOEDAMULTA, CONPERCENTMULTA, CONVLRMORA,'             + #13+
   '   CONMOEDAMORA, CONPERCENTMORA, FLGMORAPROPORC,'           + #13+
   '   CONPERMORA,   IDPAIS, CODESTADO, IDCIDADES,'             + #13+
   '   CONDIASTOLERANCIA, CONDIASREPASSE, FLGTIPODIATOLERA'     + #13+
   'FROM'                                                       + #13+
   '   CONTRATOIMOVEL'                                          + #13+
   'WHERE'                                                      + #13+
   '  IDCONTRATOIMOVEL = ' + IntToStr(iContrato)                + #13;

   Result := GetDataPacket(sSQL);

end;



function TCtrlLookRecalculo.LookupUltimaBaixa(const iDocumento: Integer): OleVariant;
var
   sSQL : String;
begin

   sSQL :=
   'SELECT R.DATABAIXA'                                 + #13+
   '  FROM LANCTODOCUM L, RECBTOPAGTO R'                + #13+
   ' WHERE L.CODDOCUMENTO = R.CODDOCUMENTO'             + #13+
   '   AND L.NUMLANCTO    = R.NUMLANCTO'                + #13+
   '   AND RTRIM(L.OPERACAO) = ''5'''                   + #13+
   '   AND L.CODDOCUMENTO = ' + IntToStr(iDocumento)    + #13+
   ' ORDER BY R.DATABAIXA DESC'                         + #13;

   Result := GetDataPacket(sSQL);

end;



function TCtrlLookRecalculo.LookupTotalInadimplencia(const iContrato: Integer;
                                                     const dDataIni, dDataFim: TDateTime;
                                                     const iDocumento: Integer): OleVariant;
var
   sSQL     : String;
   sDataIni : String;
   sDataFim : String;
begin

   sDataIni := 'TO_DATE(' + QuotedStr(FormatDateTime('dd/mm/yyyy',dDataIni)) + ',''DD/MM/YYYY'')';
   sDataFim := 'TO_DATE(' + QuotedStr(FormatDateTime('dd/mm/yyyy',dDataFim)) + ',''DD/MM/YYYY'')';

   if ParamSistema.IdModulo = 64 then
   begin
   sSQL :=
      'SELECT IDCONTRATOIMOVEL, NVL(COUNT(*),0) AS QTDE'                        + #13+
      'FROM'                                                                    + #13+
      '   ( SELECT DISTINCT CODDOCUMENTO, IDCONTRATOIMOVEL'                     + #13+
      '     FROM VWLANCAMENTO'                                                  + #13+
      '     WHERE (DATA_BAIXA > DATALIMITE OR'                                  + #13+
      '             (DATA_BAIXA IS NULL AND ' + sDataFim + ' > DATALIMITE))'    + #13+
      '     AND DATALIMITE BETWEEN ' + sDataIni + ' AND ' + sDataFim            + #13+
      '     AND IDCONTRATOIMOVEL = ' + IntToStr(iContrato)                      + #13+
      '     AND CODDOCUMENTO <> ' + IntToStr(iDocumento)                        + #13+
      '   )'                                                                    + #13+
      'GROUP BY IDCONTRATOIMOVEL'                                               + #13;
   end
   else
   begin
      sSQL :=
      'SELECT IDCONTRATOIMOVEL, NVL(COUNT(*),0) AS QTDE'                        + #13+
      'FROM'                                                                    + #13+
      '   ( SELECT DISTINCT PF.CODDOCUMENTO, CP.IDCONTRATOIMOVEL'               + #13+
      '     FROM PARCFINANCIMOV PF, CONDPAGIMOVEL CP'                           + #13+
      '     WHERE (DATAPAGAMENTO > DATALIMITE OR'                               + #13+
      '             (DATAPAGAMENTO IS NULL AND ' + sDataFim + ' > DATALIMITE))' + #13+
      '     AND DATALIMITE BETWEEN ' + sDataIni + ' AND ' + sDataFim            + #13+
      '     AND CP.IDCONDPAGIMOVEL = PF.IDCONDPAGIMOVEL'                        + #13+
      '     AND CP.IDCONTRATOIMOVEL = ' + IntToStr(iContrato)                   + #13+
      '     AND PF.CODDOCUMENTO <> ' + IntToStr(iDocumento)                     + #13+
      '   )'                                                                    + #13+
      'GROUP BY IDCONTRATOIMOVEL'                                               + #13;
   end;

   Result := GetDataPacket(sSQL);

end;



function TCtrlLookRecalculo.LookupAlteradores(const iDocumento :  Integer): OleVariant;
var
   sSQL : String;
begin

   if ParamSistema.idModulo = 64 then
   begin
      sSQL :=
      'SELECT'                                                                          + #13+
      '    ALTMULTA.CODALTMULTA,'                                                       + #13+
      '    ALTMULTA.ALTERADOR_MULTA,'                                                   + #13+
      '    ALTJUROS.CODALTJUROS,'                                                       + #13+
      '    ALTJUROS.ALTERADOR_JUROS,'                                                   + #13+
      '    ALTCM.CODALTCM,'                                                             + #13+
      '    ALTCM.ALTERADOR_CM'                                                          + #13+
      'FROM'                                                                            + #13+
      '     ('                                                                          + #13+
      '      SELECT A.CODALTERADOR AS CODALTMULTA,'                                     + #13+
      '             A.DESCRICAO AS ALTERADOR_MULTA'                                     + #13+
      '        FROM LANCAMENTOSIMOVEL L, TIPOIMOVEL T, TIPOALTERADOR A'                 + #13+
      '       WHERE L.CODTIPIMOVEL   = T.CODTIPIMOVEL '                                 + #13+
      '         AND L.CODDOCUMENTO   = ' + IntToStr(iDocumento)                         + #13+
      '         AND A.CODALTERADOR   = T.CODALTMULTA'                                   + #13+
      '      ) ALTMULTA,'                                                               + #13+
      '     ('                                                                          + #13+
      '      SELECT A.CODALTERADOR AS CODALTJUROS,'                                     + #13+
      '             A.DESCRICAO AS ALTERADOR_JUROS'                                     + #13+
      '        FROM LANCAMENTOSIMOVEL L, TIPOIMOVEL T, TIPOALTERADOR A'                 + #13+
      '        WHERE L.CODTIPIMOVEL   = T.CODTIPIMOVEL '                                + #13+
      '          AND L.CODDOCUMENTO   = ' + IntToStr(iDocumento)                        + #13+
      '          AND A.CODALTERADOR   = T.CODALTJUROS'                                  + #13+
      '      ) ALTJUROS,'                                                               + #13+
      '     ('                                                                          + #13+
      '      SELECT A.CODALTERADOR AS CODALTCM,'                                        + #13+
      '             A.DESCRICAO AS ALTERADOR_CM'                                        + #13+
      '          FROM LANCAMENTOSIMOVEL L, TIPOIMOVEL T, TIPOALTERADOR A'               + #13+
      '         WHERE L.CODTIPIMOVEL   = T.CODTIPIMOVEL '                               + #13+
      '           AND L.CODDOCUMENTO   = ' + IntToStr(iDocumento)                       + #13+
      '           AND A.CODALTERADOR   = T.CODALTCORRMON'                               + #13+
      '      ) ALTCM'                                                                   + #13;
   end
   else
   begin
      sSQL :=
      'SELECT'                                                                          + #13+
      '    ALTMULTA.CODALTMULTA,'                                                       + #13+
      '    ALTMULTA.ALTERADOR_MULTA,'                                                   + #13+
      '    ALTJUROS.CODALTJUROS,'                                                       + #13+
      '    ALTJUROS.ALTERADOR_JUROS,'                                                   + #13+
      '    ALTCM.CODALTCM,'                                                             + #13+
      '    ALTCM.ALTERADOR_CM'                                                          + #13+
      'FROM'                                                                            + #13+
      '     ('                                                                          + #13+
      '      SELECT A.CODALTERADOR AS CODALTMULTA,'                                     + #13+
      '             A.DESCRICAO AS ALTERADOR_MULTA'                                     + #13+
      '      FROM PARCFINANCIMOV L, CONDPAGIMOVEL CP,'                                  + #13+
      '           CONTRATOXIMOVEL CI, IMOVEL I, TIPOIMOVEL T, TIPOALTERADOR A'          + #13+
      '      WHERE ( I.CODTIPIMOVEL    = T.CODTIPIMOVEL )'                              + #13+
      '        AND L.IDCONDPAGIMOVEL   = CP.IDCONDPAGIMOVEL'                            + #13+
      '        AND CI.IDCONTRATOIMOVEL = CP.IDCONTRATOIMOVEL'                           + #13+
      '        AND I.IDIMOVEL          = CI.IDIMOVEL'                                   + #13+
      '        AND L.CODDOCUMENTO   = ' + IntToStr(iDocumento)                          + #13+
      '        AND A.CODALTERADOR      = T.CODALTMTAL'                                  + #13+
      '      ) ALTMULTA,'                                                               + #13+
      '     ('                                                                          + #13+
      '      SELECT A.CODALTERADOR AS CODALTJUROS,'                                     + #13+
      '             A.DESCRICAO AS ALTERADOR_JUROS'                                     + #13+
      '      FROM PARCFINANCIMOV L, CONDPAGIMOVEL CP,'                                  + #13+
      '           CONTRATOXIMOVEL CI, IMOVEL I, TIPOIMOVEL T, TIPOALTERADOR A'          + #13+
      '      WHERE ( I.CODTIPIMOVEL    = T.CODTIPIMOVEL )'                              + #13+
      '        AND L.IDCONDPAGIMOVEL   = CP.IDCONDPAGIMOVEL'                            + #13+
      '        AND CI.IDCONTRATOIMOVEL = CP.IDCONTRATOIMOVEL'                           + #13+
      '        AND I.IDIMOVEL          = CI.IDIMOVEL'                                   + #13+
      '        AND L.CODDOCUMENTO   = ' + IntToStr(iDocumento)                          + #13+
      '        AND A.CODALTERADOR      = CODALTJRAL'                                    + #13+
      '      ) ALTJUROS,'                                                               + #13+
      '     ('                                                                          + #13+
      '      SELECT A.CODALTERADOR AS CODALTCM,'                                        + #13+
      '             A.DESCRICAO AS ALTERADOR_CM'                                        + #13+
      '      FROM PARCFINANCIMOV L, CONDPAGIMOVEL CP,'                                  + #13+
      '           CONTRATOXIMOVEL CI, IMOVEL I, TIPOIMOVEL T, TIPOALTERADOR A'          + #13+
      '      WHERE ( I.CODTIPIMOVEL    = T.CODTIPIMOVEL )'                              + #13+
      '        AND L.IDCONDPAGIMOVEL   = CP.IDCONDPAGIMOVEL'                            + #13+
      '        AND CI.IDCONTRATOIMOVEL = CP.IDCONTRATOIMOVEL'                           + #13+
      '        AND I.IDIMOVEL          = CI.IDIMOVEL'                                   + #13+
      '        AND L.CODDOCUMENTO   = ' + IntToStr(iDocumento)                          + #13+
      '        AND A.CODALTERADOR      = T.CODALTCMAL'                                  + #13+
      '      ) ALTCM'                                                                   + #13;
   end;

   Result := GetDataPacket(sSQL);

end;

function TCtrlLookRecalculo.LookupAlteradoresLancados(const iDocumento: Integer): OleVariant;
var
   sSQL : String;
begin

   if ParamSistema.IdModulo = 64 then
   begin
      sSQL :=
      'SELECT'                                                                                + #13+
      '   LD.CODDOCUMENTO, LD.NUMLANCTO,'                                                     + #13+
      '   LD.CODALTERADOR, LD.PLNCODIGO,'                                                     + #13+
      '   LD.DATALANCTO, SUM(LD.VALOR) AS VALOR, LD.VALOROUTRAMOEDA,'                         + #13+
      '   LD.DEBCRE, LD.OPERACAO, LD.HISTORICOCOMPL,'                                         + #13+
      '   A.DESCRICAO'                                                                        + #13+
      'FROM'                                                                                  + #13+
      '   LANCTODOCUM LD, TIPOALTERADOR A,'                                                   + #13+
      '   ( SELECT T.CODALTMULTA, T.CODALTJUROS, T.CODALTCORRMON'                             + #13+
      '       FROM LANCAMENTOSIMOVEL L, TIPOIMOVEL T'                                         + #13+
      '      WHERE L.CODTIPIMOVEL = T.CODTIPIMOVEL'                                           + #13+
      '        AND L.CODDOCUMENTO   = ' + IntToStr(iDocumento)                                + #13+
      '      GROUP BY T.CODALTMULTA, T.CODALTJUROS, T.CODALTCORRMON ) TA'                     + #13+
      'WHERE'                                                                                 + #13+
      '      LD.CODDOCUMENTO   = ' + IntToStr(iDocumento)                                     + #13+
      '   AND ( LD.OPERACAO = ''4 '' )'                                                       + #13+
      '   AND ( LD.CODALTERADOR = A.CODALTERADOR )'                                           + #13+
      '   AND ( LD.CODALTERADOR IN (TA.CODALTMULTA, TA.CODALTJUROS, TA.CODALTCORRMON) )'      + #13+
      'GROUP BY'                                                                              + #13+
      '   LD.CODDOCUMENTO, LD.NUMLANCTO,'                                                     + #13+
      '   LD.CODALTERADOR, LD.PLNCODIGO,'                                                     + #13+
      '   LD.DATALANCTO, LD.VALOROUTRAMOEDA,'                                                 + #13+
      '   LD.DEBCRE, LD.OPERACAO, LD.HISTORICOCOMPL,'                                         + #13+
      '   A.DESCRICAO'                                                                        + #13+
      'ORDER BY'                                                                              + #13+
      '   LD.DATALANCTO, A.DESCRICAO'                                                         + #13;
   end
   else
   begin
      sSQL :=
      'SELECT'                                                                                + #13+
      '   LD.CODDOCUMENTO, LD.NUMLANCTO,'                                                     + #13+
      '   LD.CODALTERADOR, LD.PLNCODIGO,'                                                     + #13+
      '   LD.DATALANCTO, LD.VALOR, LD.VALOROUTRAMOEDA,'                                       + #13+
      '   LD.DEBCRE, LD.OPERACAO, LD.HISTORICOCOMPL,'                                         + #13+
      '   A.DESCRICAO'                                                                        + #13+
      'FROM'                                                                                  + #13+
      '   LANCTODOCUM LD, TIPOALTERADOR A,'                                                   + #13+
      '   ( SELECT T.CODALTMTAL, T.CODALTJRAL, T.CODALTCMAL'                                  + #13+
      '       FROM PARCFINANCIMOV L, CONDPAGIMOVEL CP,'                                       + #13+
      '            CONTRATOXIMOVEL CI, IMOVEL I, TIPOIMOVEL T, TIPOALTERADOR A'               + #13+
      '      WHERE ( I.CODTIPIMOVEL    = T.CODTIPIMOVEL )'                                    + #13+
      '        AND L.IDCONDPAGIMOVEL   = CP.IDCONDPAGIMOVEL'                                  + #13+
      '        AND CI.IDCONTRATOIMOVEL = CP.IDCONTRATOIMOVEL'                                 + #13+
      '        AND I.IDIMOVEL          = CI.IDIMOVEL'                                         + #13+
      '        AND L.CODDOCUMENTO   = ' + IntToStr(iDocumento)                                + #13+
      '      GROUP BY T.CODALTMTAL, T.CODALTJRAL, T.CODALTCMAL ) TA'                          + #13+
      'WHERE'                                                                                 + #13+
      '      LD.CODDOCUMENTO   = ' + IntToStr(iDocumento)                                     + #13+
      '   AND ( LD.OPERACAO = ''4 '' )'                                                       + #13+
      '   AND ( LD.CODALTERADOR = A.CODALTERADOR )'                                           + #13+
      '   AND ( LD.CODALTERADOR IN (TA.CODALTMTAL, TA.CODALTJRAL, TA.CODALTCMAL) )'           + #13+
      'ORDER BY'                                                                              + #13+
      '   LD.DATALANCTO, A.DESCRICAO'                                                         + #13;
   end;

   Result := GetDataPacket(sSQL);

end;

function TCtrlLookRecalculo.UpdateMensagemCnab(const iCodGrupo, iDocumento: Integer;
                                               const sMensagem1, sMensagem2, sMensagem3,
                                                     sMensagem4, sMensagem5, sMensagem6,
                                                     sMensagem7, sMensagem8, sMensagem9: String): Boolean;

var
   sSQL : String;
begin
   sSQL :=
   'UPDATE'                                        + #13+
   '   MENSAGENSCNAB'                              + #13+
   'SET'                                           + #13+
   '   MENSAGEM1 = ' + QuotedStr(sMensagem1) + ',' + #13+
   '   MENSAGEM2 = ' + QuotedStr(sMensagem2) + ',' + #13+
   '   MENSAGEM3 = ' + QuotedStr(sMensagem3) + ',' + #13+
   '   MENSAGEM4 = ' + QuotedStr(sMensagem4) + ',' + #13+
   '   MENSAGEM5 = ' + QuotedStr(sMensagem5) + ',' + #13+
   '   MENSAGEM6 = ' + QuotedStr(sMensagem6) + ',' + #13+
   '   MENSAGEM7 = ' + QuotedStr(sMensagem7) + ',' + #13+
   '   MENSAGEM8 = ' + QuotedStr(sMensagem8) + ',' + #13+
   '   MENSAGEM9 = ' + QuotedStr(sMensagem9)       + #13+
   'WHERE'                                         + #13;

   if iCodGrupo  <> -1 then sSQL := sSQL + 'CODGRUPOCNAB = ' + IntToStr(iCodGrupo);
   if iDocumento <> -1 then sSQL := sSQL + 'CODDOCUMENTO = ' + IntToStr(iDocumento);

   try
      Result := ExecSql(sSQL);
   except
      MessageInfo := 'Erro ao gravar mensagens'
   end;
end;



function TCtrlLookRecalculo.UpdateDocumento(const iDocumento: Integer): Boolean;
var
   sSQL : String;
begin
   sSQL :=
   'UPDATE'                                     + #13+
   '   DOCUMENTO'                               + #13+
   'SET'                                        + #13+
   '   EMISBLOQ = ''N'','                       + #13+
   '   CONTROLEREMESSA = NULL'                  + #13+
   'WHERE'                                      + #13+
   '   CODDOCUMENTO = ' + IntToStr(iDocumento)  + #13;
   try
      Result := ExecSql(sSQL);
   except
      MessageInfo := 'Erro ao gravar documento';
   end;
end;



function TCtrlLookRecalculo.UpdatePortadorForma(const iDocumento,iPortadorAnt, iPortador: Integer; const bAlteraData: Boolean; const dNovaData: TDateTime): Boolean;
var
   sSql : String;
begin
   try
      // Altera o Portador Forma
      if iPortadorAnt <> iPortador then begin
         if ParamSistema.IdModulo = 64 then
         begin
            sSql := 'UPDATE LANCAMENTOSIMOVEL SET CODPORTFORMA = ' + IntToStr(iPortador) +
                    ' WHERE CODDOCUMENTO = ' + IntToStr(iDocumento);
            ExecSql(sSql);
         end;

         sSql := 'UPDATE DOCUMENTO           '+#13+
                 '   SET NOSSONUMERO = NULL, '+#13+
                 '       CODPORTFORMA = ' + IntToStr(iPortador) +
                 ' WHERE CODDOCUMENTO = ' + IntToStr(iDocumento);
         ExecSql(sSql);
      end;

      // Altera a Data Programada
      if bAlteraData then begin
         sSql := 'UPDATE DOCUMENTO           '+#13+
                 '   SET DATAPROGRAMADA = TO_DATE(' + QuotedStr(FormatDateTime('DD/MM/YYYY',dNovaData)) + ',''DD/MM/YYYY'') ' +#13+
                 ' WHERE CODDOCUMENTO = ' + IntToStr(iDocumento);
         ExecSql(sSql);
      end;
      Result := True;

   except
      MessageInfo := 'Não foi possível alterar a Forma de Recebimento';
      Result := False;
   end;

end;



function TCtrlLookRecalculo.LookupPortadorForma: OleVariant;
var
   sSQL : String;
begin
   sSQL :=
   'SELECT'                                                     + #13+
   '   PF.CODPORTFORMA, PF.DESCRICAO, PF.IDCONFIGBARRAS'        + #13+
   'FROM'                                                       + #13+
   '   PORTADORFORMA PF'                                        + #13+
   'WHERE'                                                      + #13+
   '    PF.IDPESSOA = ' + IntToStr(ParamSistema.IdEmpresa)      + #13+
   'AND NVL(FLGATIVO, ''S'') = ''S'''                           + #13+
   'AND ( PF.RECPAG = ''R'' )'                                  + #13+
   'ORDER BY'                                                   + #13+
   '   PF.DESCRICAO'                                            + #13;

   Result := GetDataPacket(sSQL);
end;

function TCtrlLookRecalculo.LookupMoeda: OleVariant;
var
   sSQL : String;
begin
   sSQL :=
   'SELECT'                                     + #13+
   '   MOECODIGO, MOEDESC, MOESIGLA,'           + #13+
   '   MOEPERIODICIDADE, MOEINATIVO,'           + #13+
   '   FLGPERCVALOR, DATAINICIO, DATAFIM'       + #13+
   'FROM'                                       + #13+
   '   MOEDA'                                   + #13+
   'ORDER BY'                                   + #13+
   '   MOESIGLA'                                + #13;

   Result := GetDataPacket(sSQL);

end;

end.









