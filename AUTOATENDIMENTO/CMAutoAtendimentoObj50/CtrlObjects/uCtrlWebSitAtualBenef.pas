unit uCtrlWebSitAtualBenef;

interface

Uses SysUtils, uCmControlObject, uCmDbObject, uCmClientDataSet,
     uCmTypes;

Type
  TCtrlWebSitAtualBenef = class( TCmControlObject )
  private

  protected

  public

    function SituacaoAtualBeneficio( iIdPessoa       , iIdBeneficio    , iIdSitBeneficio ,
                                     iNumeroProcesso , iIdPlanoPrev    , iIdTitular      ,
                                     iIdPessJur      , iSeqProposta    , iIdPlanoOrigem  : integer ) : OleVariant;

  published

end;


implementation

{ TCtrlWebSitAtualBenef }

function TCtrlWebSitAtualBenef.SituacaoAtualBeneficio( iIdPessoa       , iIdBeneficio    , iIdSitBeneficio ,
                                                       iNumeroProcesso , iIdPlanoPrev    , iIdTitular      ,
                                                       iIdPessJur      , iSeqProposta    , iIdPlanoOrigem  : integer ) : OleVariant;
var
  sSQL : string;
begin
  sSQL := 
   ' SELECT ' +
   '   B.IDBENEFICIO, ' +
   '   B.IDSITBENEFICIO, ' +
   '   B.IDPLANOPREV, ' +
   '   B.IDPLANOORIGEM, ' +
   '   B.IDPESSJUR, ' +
   '   B.IDTITULAR, ' +
   '   B.IDPESSOA, ' +
   '   B.SEQPROPOSTA, ' +
   '   B.NUMEROPROCESSO, ' +
   '   B.NUMPROCINSS, ' +
   '   BN.NOME AS BENEFICIO, ' +
   '   SB.DESCRICAO AS SITBENEFICIO, ' +
   '   TPG.NOME AS TIPOPAGBENEF, ' +
   '   B.DATAINICIOFUND AS DATAINICIOBENEF, ' +
   '   B.DATAINICIO  AS DATAINICIOPAG, ' +
   '   B.DATAFINAL, ' +
   '   B.DATAFINALPREVISTA, ' +
   '   B.DATAREQUERIMENTO, ' +
   '   B.DATACONCESSAO, ' +
   '   B.DATAINICIOFUND, ' +
   '   B.VALORATUAL, ' +
   '   B.VALORCOTAS, ' +
   '   B.VALORTOTAL, ' +
   '   B.VALORCALCULADO, ' +
   '   B.VALORSRB, ' +
   '   B.ULTMESPREPARO, ' +
   '   B.DATAULTREAJUSTE, ' +
   '   DECODE(B.FLGFORMAPAGTO, ''F'', ''Folha de beneficio'', ''R'', ''Recibo'', ''C'', ''Conta Corrente'' ) AS FORMAPGTO, ' +
   '   DECODE(B.IDTITULAR,B.IDPESSOA,BPP.VALORBASE1,B.VALORBASE1) AS VALORBASE1, ' +
   '   DECODE(B.IDTITULAR,B.IDPESSOA,BPP.VALORBASE2,B.VALORBASE2) AS VALORBASE2, ' +
   '   DECODE(B.IDTITULAR,B.IDPESSOA,BPP.VALORBASE3,B.VALORBASE3) AS VALORBASE3, ' +
   '   NVL(BPPREV.NOMEVALORBASE1, ''Valor Opção 1'') AS NOMEVALORBASE1, ' +
   '   NVL(BPPREV.NOMEVALORBASE2, ''Valor Opção 2'') AS NOMEVALORBASE2, ' +
   '   NVL(BPPREV.NOMEVALORBASE3, ''Valor Opção 3'') AS NOMEVALORBASE3, ' +
   '   B.DATAINICIOINSS, ' +
   '   B.VLRCALCINSS, ' +
   '   B.VLRINFINSS, ' +
   '   B.MOTIVOCANCELAMEN, ' +
   '   NVL(B.FLGPROVISORIO, 0) AS FLGPROVISORIO, ' +
   '   B.PERCPROVISORIO, ' +
   '   B.PRAZOPROVISORIO, ' +
   '   B.DIBBENEFANT AS DATAINICIOBENEFANT, ' +
   '   B.VALORBENEFANT, ' +
   '   B.ULTMESREAJUSTE, ' +
   '   NVL (B.FLGPOSSUIACOMPINSS, 0) AS FLGPOSSUIACOMPINSS, ' +
   '   B.VALORNADIB AS VALBENEFINICIAL, ' +
   '   BFT.PERCENTUAL AS PERCGRUPOFAMILIAR, ' +
   '   BENEFANT.NUMPROCINSS  AS NUMPROCINSSBENANTERIOR, ' +
   '   BENEFANT.PERCENTUAL  AS PERCBENANTERIOR ' +
   ' FROM BENEFBFCIARIO B, BENEFICIO BN, ' +
   '      SITBENEFICIO SB,  TPPAGTOBENEFICIO TPG, ' +
   '      BENEFPLANOPART BPP, BENEFPLANPREV BPPREV, BFCIARIOTITPLAN BFT, ' +
   '   (SELECT BF.NUMPROCINSS, BF.IDBENEFICIO,  BF.IDPLANOPREV, BF.PERCENTUAL, BPP.FLGREFERENCIA FROM BENEFBFCIARIO BF, BENEFPLANPREV BPP ' +
   '     WHERE BF.IDSITBENEFICIO = 3 AND ' +
   '           BF.DATAINICIO = (SELECT MAX(DATAINICIO) FROM BENEFBFCIARIO WHERE IDSITBENEFICIO = 3 AND IDPESSOA = 468601) AND ' +
   '           BF.IDPLANOPREV = BPP.IDPLANOPREV AND ' +
   '           BF.IDBENEFICIO = BPP.IDBENEFICIO AND ' +
   '                         BF.IDPESSOA         = ' + IntToStr( iIdPessoa ) + '  ) BENEFANT ' +
   ' WHERE ' +
   '   B.IDBENEFICIO          = BN.IDBENEFICIO ' +
   '   AND B.IDSITBENEFICIO   = SB.IDSITBENEFICIO(+) ' +
   '   AND B.IDTPPAGTOBENEFIC = TPG.IDTPPAGTOBENEFIC(+) ' +
   '   AND B.IDPESSOA         = BPP.IDPESSOA(+) ' +
   '   AND B.IDPLANOPREV      = BPP.IDPLANOPREV(+) ' +
   '   AND B.IDPESSJUR        = BPP.IDPESSJUR(+) ' +
   '   AND B.SEQPROPOSTA      = BPP.SEQPROPOSTA(+) ' +
   '   AND B.IDBENEFICIO      = BPP.IDBENEFICIO(+) ' +
   '   AND B.IDPLANOPREV      = BPPREV.IDPLANOPREV(+) ' +
   '   AND B.IDBENEFICIO      = BPPREV.IDBENEFICIO(+) ' +
   '   AND B.IDPESSOA         = BFT.IDPESSOA ' +
   '   AND B.IDPLANOPREV      = BFT.IDPLANOPREV ' +
   '   AND B.IDPESSJUR        = BFT.IDPESSJUR ' +
   '   AND B.SEQPROPOSTA      = BFT.SEQPROPOSTA ' +
   '   AND B.IDBENEFICIO      = BFT.IDBENEFICIO ' +
   '   AND BENEFANT.FLGREFERENCIA(+) = BPPREV.FLGREFERENCIA ' ;

  if iIdPessoa       > 0 then sSQL := sSQL + ' AND B.IDPESSOA       = ' + IntToStr( iIdPessoa       );

  if iIdBeneficio    > 0 then sSQL := sSQL + ' AND B.IDBENEFICIO    = ' + IntToStr( iIdBeneficio    );

  if iIdSitBeneficio > 0 then sSQL := sSQL + ' AND B.IDSITBENEFICIO = ' + IntToStr( iIdSitBeneficio );

  if iNumeroProcesso > 0 then sSQL := sSQL + ' AND B.NUMEROPROCESSO = ' + IntToStr( iNumeroProcesso );

  if iIdPlanoPrev    > 0 then sSQL := sSQL + ' AND B.IDPLANOPREV    = ' + IntToStr( iIdPlanoPrev    );

  if iIdTitular      > 0 then sSQL := sSQL + ' AND B.IDTITULAR      = ' + IntToStr( iIdTitular      );

  if iIdPessJur      > 0 then sSQL := sSQL + ' AND B.IDPESSJUR      = ' + IntToStr( iIdPessJur      );

  if iSeqProposta    > 0 then sSQL := sSQL + ' AND B.SEQPROPOSTA    = ' + IntToStr( iSeqProposta    );

  if iIdPlanoOrigem  > 0 then sSQL := sSQL + ' AND B.IDPLANOORIGEM  = ' + IntToStr( iIdPlanoOrigem  );

  sSQL := sSQL +
   ' ORDER BY B.DATAINICIO ASC ' ;

  Result := GetDataPacket( sSQL );
end;

end.

