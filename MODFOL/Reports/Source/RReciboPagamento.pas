unit RReciboPagamento;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs, FCmReport,
  uCmRptManager, TXComp, CmParamReport, Db, Wwdatsrc, ppDB, ppDBPipe, ppDBBDE, ppBands,
  ppCtrls, ppPrnabl, ppClass, ppCache, ppComm, ppRelatv, ppProd, ppReport, DBClient,
  uCMClientDataSet, uCmSqlParams;

type
  TRptReciboPagamento = class(TFrmCmReport)
    rpReciboPagamento: TppReport;
    ppDetailBand10: TppDetailBand;
    rpReciboPagamentoSmryBnd: TppSummaryBand;
    ppGroup10: TppGroup;
    ppGroupHeaderBand10: TppGroupHeaderBand;
    shpReciboPagamento12: TppShape;
    shpReciboPagamento3: TppShape;
    lnReciboPagamento7: TppLine;
    lnReciboPagamento5: TppLine;
    lnReciboPagamento6: TppLine;
    lnReciboPagamento4: TppLine;
    shpReciboPagamento1: TppShape;
    shpReciboPagamento2: TppShape;
    lblReciboPagamentoNOME: TppLabel;
    lblReciboPagamentoCARGO: TppLabel;
    lblReciboPagamentoC_CUSTO: TppLabel;
    dbtxtReciboPagamentoEMPRESA: TppDBText;
    dbtxtReciboPagamentoCGC: TppDBText;
    dbtxtReciboPagamentoINSCRICAO: TppDBText;
    dbtxtReciboPagamentoMATRICULA: TppDBText;
    dbtxtReciboPagamentoEMPREGADO: TppDBText;
    dbtxtReciboPagamentoCARGO: TppDBText;
    dbtxtReciboPagamentoENDERECO: TppDBText;
    dbtxtReciboPagamentoC_CUSTO: TppDBText;
    lblReciboPagamentoMES_REF: TppLabel;
    lblReciboPagamentoCOD: TppLabel;
    shpReciboPagamento4: TppShape;
    shpReciboPagamento6: TppShape;
    shpReciboPagamento5: TppShape;
    lblReciboPagamentoCODIGO: TppLabel;
    lblReciboPagamentoDESCRICAO: TppLabel;
    lblReciboPagamentoREF: TppLabel;
    lblReciboPagamentoPROV: TppLabel;
    lblReciboPagamentoDESC: TppLabel;
    lnReciboPagamento3: TppLine;
    lnReciboPagamento1: TppLine;
    lnReciboPagamento2: TppLine;
    shpReciboPagamento7: TppShape;
    shpReciboPagamento8: TppShape;
    shpReciboPagamento10: TppShape;
    lblReciboPagamentoTOT_PROV: TppLabel;
    lblReciboPagamentoTOT_DESC: TppLabel;
    shpReciboPagamento11: TppShape;
    shpReciboPagamento9: TppShape;
    lblReciboPagamentoTOT_LIQ: TppLabel;
    lblReciboPagamentoBASE_IRRF: TppLabel;
    lblReciboPagamentoFGTS_MES: TppLabel;
    lblReciboPagamentoBASE_FGTS: TppLabel;
    lblReciboPagamentoBASE_INSS: TppLabel;
    lblReciboPagamentoSAL_BASE: TppLabel;
    dbtxtReciboPagamentoDESCONTO1: TppDBText;
    dbtxtReciboPagamentoDESCONTO2: TppDBText;
    dbtxtReciboPagamentoDESCONTO3: TppDBText;
    dbtxtReciboPagamentoDESCONTO4: TppDBText;
    dbtxtReciboPagamentoDESCONTO5: TppDBText;
    dbtxtReciboPagamentoDESCONTO6: TppDBText;
    dbtxtReciboPagamentoDESCONTO7: TppDBText;
    dbtxtReciboPagamentoDESCONTO8: TppDBText;
    dbtxtReciboPagamentoDESCONTO9: TppDBText;
    dbtxtReciboPagamentoDESCONTO10: TppDBText;
    dbtxtReciboPagamentoDESCONTO11: TppDBText;
    dbtxtReciboPagamentoDESCONTO12: TppDBText;
    dbtxtReciboPagamentoDESCONTO13: TppDBText;
    dbtxtReciboPagamentoDESCONTO14: TppDBText;
    dbtxtReciboPagamentoDESCONTO15: TppDBText;
    dbtxtReciboPagamentoPROVENTO1: TppDBText;
    dbtxtReciboPagamentoPROVENTO2: TppDBText;
    dbtxtReciboPagamentoPROVENTO3: TppDBText;
    dbtxtReciboPagamentoPROVENTO4: TppDBText;
    dbtxtReciboPagamentoPROVENTO5: TppDBText;
    dbtxtReciboPagamentoPROVENTO6: TppDBText;
    dbtxtReciboPagamentoPROVENTO7: TppDBText;
    dbtxtReciboPagamentoPROVENTO8: TppDBText;
    dbtxtReciboPagamentoPROVENTO9: TppDBText;
    dbtxtReciboPagamentoPROVENTO10: TppDBText;
    dbtxtReciboPagamentoPROVENTO11: TppDBText;
    dbtxtReciboPagamentoPROVENTO12: TppDBText;
    dbtxtReciboPagamentoPROVENTO13: TppDBText;
    dbtxtReciboPagamentoPROVENTO14: TppDBText;
    dbtxtReciboPagamentoPROVENTO15: TppDBText;
    dbtxtReciboPagamentoREFERENCIA1: TppDBText;
    dbtxtReciboPagamentoREFERENCIA2: TppDBText;
    dbtxtReciboPagamentoREFERENCIA3: TppDBText;
    dbtxtReciboPagamentoREFERENCIA4: TppDBText;
    dbtxtReciboPagamentoREFERENCIA5: TppDBText;
    dbtxtReciboPagamentoREFERENCIA6: TppDBText;
    dbtxtReciboPagamentoREFERENCIA7: TppDBText;
    dbtxtReciboPagamentoREFERENCIA8: TppDBText;
    dbtxtReciboPagamentoREFERENCIA9: TppDBText;
    dbtxtReciboPagamentoREFERENCIA10: TppDBText;
    dbtxtReciboPagamentoREFERENCIA11: TppDBText;
    dbtxtReciboPagamentoREFERENCIA12: TppDBText;
    dbtxtReciboPagamentoREFERENCIA13: TppDBText;
    dbtxtReciboPagamentoREFERENCIA14: TppDBText;
    dbtxtReciboPagamentoREFERENCIA15: TppDBText;
    dbtxtReciboPagamentoRUBRICA1: TppDBText;
    dbtxtReciboPagamentoRUBRICA2: TppDBText;
    dbtxtReciboPagamentoRUBRICA3: TppDBText;
    dbtxtReciboPagamentoRUBRICA4: TppDBText;
    dbtxtReciboPagamentoRUBRICA5: TppDBText;
    dbtxtReciboPagamentoRUBRICA6: TppDBText;
    dbtxtReciboPagamentoRUBRICA7: TppDBText;
    dbtxtReciboPagamentoRUBRICA8: TppDBText;
    dbtxtReciboPagamentoRUBRICA9: TppDBText;
    dbtxtReciboPagamentoRUBRICA10: TppDBText;
    dbtxtReciboPagamentoRUBRICA11: TppDBText;
    dbtxtReciboPagamentoRUBRICA12: TppDBText;
    dbtxtReciboPagamentoRUBRICA13: TppDBText;
    dbtxtReciboPagamentoRUBRICA14: TppDBText;
    dbtxtReciboPagamentoRUBRICA15: TppDBText;
    dbtxtReciboPagamentoCODRUBRICA1: TppDBText;
    dbtxtReciboPagamentoCODRUBRICA2: TppDBText;
    dbtxtReciboPagamentoCODRUBRICA3: TppDBText;
    dbtxtReciboPagamentoCODRUBRICA4: TppDBText;
    dbtxtReciboPagamentoCODRUBRICA5: TppDBText;
    dbtxtReciboPagamentoCODRUBRICA6: TppDBText;
    dbtxtReciboPagamentoCODRUBRICA7: TppDBText;
    dbtxtReciboPagamentoCODRUBRICA8: TppDBText;
    dbtxtReciboPagamentoCODRUBRICA9: TppDBText;
    dbtxtReciboPagamentoCODRUBRICA10: TppDBText;
    dbtxtReciboPagamentoCODRUBRICA11: TppDBText;
    dbtxtReciboPagamentoCODRUBRICA12: TppDBText;
    dbtxtReciboPagamentoCODRUBRICA13: TppDBText;
    dbtxtReciboPagamentoCODRUBRICA14: TppDBText;
    dbtxtReciboPagamentoCODRUBRICA15: TppDBText;
    dbtxtReciboPagamentoFOLHA: TppDBText;
    dbtxtReciboPagamentoSAL_BASE: TppDBText;
    dbtxtReciboPagamentoBASE_INSS: TppDBText;
    dbtxtReciboPagamentoBASE_FGTS: TppDBText;
    dbtxtReciboPagamentoFGTS_MES: TppDBText;
    dbtxtReciboPagamentoBASE_IRRF: TppDBText;
    dbtxtReciboPagamentoTOT_PROVENTOS: TppDBText;
    dbtxtReciboPagamentoTOT_DESCONTOS: TppDBText;
    dbtxtReciboPagamentoTOT_GERAL: TppDBText;
    dbtxtReciboPagamentoMES_REF: TppDBText;
    ppGroupFooterBand10: TppGroupFooterBand;
    ppReciboPagamento: TppBDEPipeline;
    dsReciboPagamento: TwwDataSource;
    sqlReciboPagamento: TCMSqlParams;
    CdsReciboPagamento: TCMClientDataSet;
    ppDBText1: TppDBText;
    lblNumDepIRRF: TppLabel;
    rpReciboPagamentoNUMDEPIRRF: TppDBText;
    lblReciboPagamentoBASEPREV: TppLabel;
    rpReciboPagamentoBASEPREV: TppDBText;
    procedure CrmRptCMBeforePrint(Sender: TObject);
    procedure CdsReciboPagamentoAfterOpen(DataSet: TDataSet);
    procedure CdsReciboPagamentoAfterScroll(DataSet: TDataSet);
    procedure rpReciboPagamentoSmryBndAfterPrint(Sender: TObject);
    procedure ppGroupHeaderBand10BeforePrint(Sender: TObject);
  private
    procedure GravarDadosRelatorio;
    procedure DuplicarDadosRelatorio;
  end;

var
  RptReciboPagamento: TRptReciboPagamento;

implementation

uses uCtrlFuncoesRH, dCds, fAguarde, uCtrlUsoGeralRH;

{$R *.DFM}

procedure TRptReciboPagamento.CrmRptCMBeforePrint(Sender: TObject);
var
  DocID: array[1..2] of integer;
  iMes, iAno: integer;
begin
  inherited;
  lblNumDepIRRF.Visible := (lblNumDepIRRF.Visible) and
    (CmpRptCM.ParamByName('NumDepIRRF').asBoolean);
  rpReciboPagamentoNUMDEPIRRF.Visible := (rpReciboPagamentoNUMDEPIRRF.Visible) and
    (CmpRptCM.ParamByName('NumDepIRRF').asBoolean);

  DocID[1] := 0;
  DocID[2] := 0;

  iMes := CmpRptCM.ParamByName('MesRef').asInteger;
  iAno := CmpRptCM.ParamByName('AnoRef').asInteger;

  // Documentos
  with (dmCds.sql) do
  begin
    Close;
    SQL.Clear;
    SQL.Add('SELECT TDO.IDDOCUMENTO, TDO.SIGLADOCUMENTO');
    SQL.Add('FROM   TIPODOCPESSOA TDP, TIPODOCOFICIAL TDO');
    SQL.Add('WHERE ((TDO.SIGLADOCUMENTO = ''ESTADUAL:'') OR');
    SQL.Add('       (TDO.SIGLADOCUMENTO = ''MUNICIPAL:'')) AND');
    SQL.Add('      (TDO.IDDOCUMENTO     = TDP.IDDOCUMENTO)');
    Open;
  end;
  
  with (dmCds.Cds) do
  begin
    while not(EOF) do
    begin
      if (FieldByName('SIGLADOCUMENTO').asString = 'ESTADUAL:') then
        DocID[1] := FieldByName('IDDOCUMENTO').asInteger
      else
      if (FieldByName('SIGLADOCUMENTO').asString = 'MUNICIPAL:') then
        DocID[2] := FieldByName('IDDOCUMENTO').asInteger;
      Next;
    end;
  end;

  with (dmCds.sql.SQL) do
  begin
    Clear;
    Add('SELECT DISTINCT');
    Add('  PJ.RAZAOSOCIAL AS EMPRESA,');
    Add('  PF.NOME AS EMPREGADO,');
    Add('  P.FLGDESCONTO AS TIPORUBRICA,');
    Add('  RTRIM(DECODE(RTRIM(H.REFERENCIA),''***'','''',''Ferias'','''',''Férias'','''',');
    Add('    ''Rescisao'','''',''Rescisão'','''',''13.o Salar'','''',H.REFERENCIA)) AS REFERENCIA,');
    Add('  F.MATRICULA, PFIS.NUMDEPIRRF,');
    Add('  CC.NOME AS NOMECENTROCUSTO,');
    Add('  C.TITULO, C2.TITULO AS FUNCAO,');
    Add('  P.CODRUBCLT AS CODRUBRICA,');
    Add('  RP.CODPROVDESC AS CODRUBRICACLIENTE,');
    Add('  RP.DESCRPROVDESC AS RUBRICA,');
    Add('  (''CNPJ:'' || PJ.NUMDOCUMENTO) AS CGC,');
    Add('  RTRIM(DECODE(RTRIM(ESTADUAL.NUM),NULL,');
    Add('    DECODE(RTRIM(MUNICIPAL.NUM),NULL,NULL,');
    Add('    ''Inscrição Municipal: '' || MUNICIPAL.NUM),');
    Add('    ''Inscrição Estadual: '' || ESTADUAL.NUM)) AS ESTADUALMUNICIPAL,');
    Add('  RTRIM(END.LOGRADOURO) ||'', ''|| END.NUMERO || DECODE(END.COMPLEMENTO,NULL,NULL,'' - '' ||');
    Add('    RTRIM(END.COMPLEMENTO)) ||'' - ''|| RTRIM(END.BAIRRO) ||'' - ''|| RTRIM(CIDADES.NOME) ||');
    Add('    '' - CEP:'' || RTRIM(SUBSTR(END.CEP,1,5)) ||''-''|| RTRIM(SUBSTR(END.CEP,6,3)) AS ENDERECO,');
    Add('  H.VALORPROVENTO AS VALOR,');
    Add('  BASEPREVID.BASEPREVPRIV,');
    Add('  MARGEM1.VALORMARGEM AS VALORMARGEM1, MARGEM2.VALORMARGEM AS VALORMARGEM2,');
    Add('  (DECODE(SALCONTRA.SALARIOCONTRATUAL,NULL, F.SALARIOATUAL * (CASE');
    Add('                       WHEN F.TIPOPAGAMENTO = ''M'' THEN 1');
    Add('                       WHEN F.TIPOPAGAMENTO = ''D'' THEN 30');
    Add('                       WHEN F.TIPOPAGAMENTO = ''T'' THEN 1');
    Add('                       ELSE HT.JORNADAMENSAL');
    Add('                     END),SALCONTRA.SALARIOCONTRATUAL)) AS SALBASE');
    Add('FROM');
    Add('  ' +CmpRptCM.ParamByName('NomeTabela').asString+ ' H, PESSOA PJ, PESSOA PF,'+
      ' PESSOAFISICA PFIS, ENDPESS END, PROVDESC P,');
    Add('  RUBRICAXPESS RP, FUNCIONARIO F, CARGO C, MOTIVO MO, CIDADES, HORATRAB HT,');
    Add('  CENTCUST CC, SITFUNC ST, CARGO C2,');
    // Última evolução Funcional do Funcionário
    // --------------------------------------------------------------------------------------
    Add('  (SELECT DECODE(HST.IDCARGO,NULL,F.IDCARGO,HST.IDCARGO) AS IDCARGO,');
    Add('          DECODE(HST.IDEMPRESA,NULL,F.IDEMPRESA,HST.IDEMPRESA) AS IDEMPRESA,');
    Add('          DECODE(HST.CODCENTROCUSTO,NULL,F.CODCENTROCUSTO,HST.CODCENTROCUSTO) AS CODCENTROCUSTO,');
    Add('          DECODE(HST.IDFUNCAO,NULL,F.IDFUNCAO,HST.IDFUNCAO) AS IDFUNCAO, F.IDPESSOA');
    Add('   FROM FUNCIONARIO F,');
    Add('   (SELECT EVOL.IDCARGO, EVOL.IDPESSOA, EVOL.IDEMPRESA, EVOL.CODCENTROCUSTO,');
    Add('    EVOL.IDFUNCAO FROM   EVOLFUNC EVOL,');
    Add('          (SELECT MAX(DATAALTERFUNC) AS DATAALTERFUNC, IDPESSOA');
    Add('           FROM   EVOLFUNC');
    Add('           WHERE');
    Add('            (DATAALTERFUNC <= TO_DATE('+
      QuotedStr(IntToStr(FU.TrazUltDiaMes(iMes, iAno)) +'/'+ FU.PoeZero(iMes) +'/'+
      IntToStr(iAno))+ ',''DD/MM/YYYY''))');
    Add('           GROUP BY IDPESSOA) HST2,');
    Add('          (SELECT MAX(TRGDTINCLUSAO) AS DATAINCLUSAO, IDPESSOA');
    Add('           FROM   EVOLFUNC');
    Add('           WHERE  (DATAALTERFUNC <= TO_DATE('+
      QuotedStr(IntToStr(FU.TrazUltDiaMes(iMes, iAno)) +'/'+ FU.PoeZero(iMes) +'/'+
      IntToStr(iAno))+ ',''DD/MM/YYYY''))');
    Add('           GROUP BY IDPESSOA) HST3');
    Add('     WHERE  (EVOL.DATAALTERFUNC = HST2.DATAALTERFUNC) AND');
    Add('           (EVOL.IDPESSOA      = HST2.IDPESSOA) AND');
    Add('           (EVOL.TRGDTINCLUSAO = HST3.DATAINCLUSAO) AND');
    Add('           (EVOL.IDPESSOA      = HST3.IDPESSOA)) HST');
    Add('   WHERE  (F.IDPESSOA      = HST.IDPESSOA(+))) HIST,');
    // -------------------------------------------------------------------------- //
    // Margem 1 (CLT = 90010)
    Add('  (SELECT DISTINCT');
    Add('   H.IDPESSOA, H.VALORPROVENTO AS VALORMARGEM');
    Add('   FROM');
    Add('  ' +CmpRptCM.ParamByName('NomeTabela').asString+ ' H, PROVDESC P');
    Add('   WHERE');
    Add('   (H.MES        = ' +QuotedStr(CmpRptCM.ParamByName('AnoRef').asString +'/'+
      FU.PoeZero(CmpRptCM.ParamByName('MesRef').asInteger))+ ') AND');
    Add('   (H.IDMOTIVO  IN (' +CmpRptCM.ParamByName('ListaIdMotivo').asString+ ')) AND');
    Add('   (P.CODRUBCLT  = ''90010'') AND');
    Add('   (P.IDPROVENTO = H.IDRUBRICA)) MARGEM1,');
    // -------------------------------------------------------------------------- //
    // Margem 2 (CLT = 90012)
    Add('  (SELECT DISTINCT');
    Add('   H.IDPESSOA, H.VALORPROVENTO AS VALORMARGEM');
    Add('   FROM');
    Add('  ' +CmpRptCM.ParamByName('NomeTabela').asString+ ' H, PROVDESC P');
    Add('   WHERE');
    Add('   (H.MES        = ' +QuotedStr(CmpRptCM.ParamByName('AnoRef').asString +'/'+
      FU.PoeZero(CmpRptCM.ParamByName('MesRef').asInteger))+ ') AND');
    Add('   (H.IDMOTIVO  IN (' +CmpRptCM.ParamByName('ListaIdMotivo').asString+ ')) AND');
    Add('   (P.CODRUBCLT  = ''90012'') AND');
    Add('   (P.IDPROVENTO = H.IDRUBRICA)) MARGEM2,');
    // -------------------------------------------------------------------------- //
    // Salario Contratual (CLT = 60052)
    Add('  (SELECT DISTINCT');
    Add('     H.IDPESSOA, H.VALORPROVENTO AS SALARIOCONTRATUAL');
    Add('   FROM');
    Add('     ' +CmpRptCM.ParamByName('NomeTabela').asString+ ' H, PROVDESC P');
    Add('   WHERE');
    Add('     (H.MES        = ' +QuotedStr(CmpRptCM.ParamByName('AnoRef').asString +'/'+
      FU.PoeZero(CmpRptCM.ParamByName('MesRef').asInteger))+ ') AND');
    Add('     (H.IDMOTIVO  IN (' +CmpRptCM.ParamByName('ListaIdMotivo').asString+ ')) AND');
    Add('     (P.CODRUBCLT  = ''60052'') AND');
    Add('     (P.IDPROVENTO = H.IDRUBRICA)) SALCONTRA,');
    // -------------------------------------------------------------------------- //
    // Base Prev. Privada (CLT = 90011)
    Add('  (SELECT');
    Add('     H.IDPESSOA, SUM(H.VALORPROVENTO) AS BASEPREVPRIV');
    Add('   FROM');
    Add('     ' +CmpRptCM.ParamByName('NomeTabela').asString+ ' H, PROVDESC P');
    Add('   WHERE');
    Add('     (H.MES        = ' +QuotedStr(CmpRptCM.ParamByName('AnoRef').asString +'/'+
      FU.PoeZero(CmpRptCM.ParamByName('MesRef').asInteger))+ ') AND');
    Add('     (H.IDMOTIVO  IN (' +CmpRptCM.ParamByName('ListaIdMotivo').asString+ ')) AND');
    Add('     (P.CODRUBCLT  = ''90011'') AND');
    Add('     (P.IDPROVENTO = H.IDRUBRICA) GROUP BY H.IDPESSOA) BASEPREVID,');
    // -------------------------------------------------------------------------- //
    // Inscrição Estadual
    Add('  (SELECT IDPESSOA, NUMDOCUMENTO AS NUM');
    Add('   FROM   DOCPESSOA');
    Add('   WHERE (IDPESSOA   IN (' +CmpRptCM.ParamByName('ListaIdEstab').asString+ ')) AND');
    Add('         (IDDOCUMENTO = ' +IntToStr(DocID[1])+ ')) ESTADUAL,');
    // -------------------------------------------------------------------------- //
    // Inscrição Municipal
    Add('  (SELECT IDPESSOA, NUMDOCUMENTO AS NUM');
    Add('   FROM   DOCPESSOA');
    Add('   WHERE (IDPESSOA   IN (' +CmpRptCM.ParamByName('ListaIdEstab').asString+ ')) AND');
    Add('         (IDDOCUMENTO = ' +IntToStr(DocID[2])+ ')) MUNICIPAL');
    // -------------------------------------------------------------------------- //
    Add('WHERE');
    Add('  (PJ.IDPESSOA      IN (' +CmpRptCM.ParamByName('ListaIdEstab').asString+ ')) AND');
    Add('  (MO.IDMOTIVO      IN (' +CmpRptCM.ParamByName('ListaIdMotivo').asString+ ')) AND');
    Add('  (H.IDPESSJUR       = ' +CmpRptCM.ParamByName('IdEmpresa').asString+ ') AND');

    // Funcionário(s) selecionado(s) (para HISTRUBSAL)
    if (CmpRptCM.ParamByName('ListaIdFunc').asString <> '') then
      if (Pos(',', CmpRptCM.ParamByName('ListaIdFunc').asString) > 0) then
        Add('  (H.IDPESSOA IN (' +CmpRptCM.ParamByName('ListaIdFunc').asString+ ')) AND')
      else
        Add('  (H.IDPESSOA  = ' +CmpRptCM.ParamByName('ListaIdFunc').asString+ ') AND');

    Add('  (H.MES             = '+QuotedStr(CmpRptCM.ParamByName('AnoRef').asString +'/'+
      FU.PoeZero(CmpRptCM.ParamByName('MesRef').asInteger))+ ') AND');

    // Funcionário(s) selecionado(s) (para PESSOA)
    if (CmpRptCM.ParamByName('ListaIdFunc').asString <> '') then
    begin
      if (Pos(',', CmpRptCM.ParamByName('ListaIdFunc').asString) > 0) then
        Add('  (F.IDPESSOA IN (' +CmpRptCM.ParamByName('ListaIdFunc').asString+ ')) AND')
      else
        Add('  (F.IDPESSOA  = ' +CmpRptCM.ParamByName('ListaIdFunc').asString+ ') AND');
    end
    else
    begin
      // C. de Custo(s) habilitados para o usuário
      if (CtrlUsoGeralRH.UsuXCCusto <> '') then
        if (Pos(',', CtrlUsoGeralRH.UsuXCCusto) > 0) then
          Add('  (TRIM(DECODE(HST.CODCENTROCUSTO,NULL,F.CODCENTROCUSTO,HST.CODCENTROCUSTO)) IN ' +CtrlUsoGeralRH.UsuXCCusto+ ') AND')
        else
          Add('  (TRIM(DECODE(HST.CODCENTROCUSTO,NULL,F.CODCENTROCUSTO,HST.CODCENTROCUSTO)) = ' +CtrlUsoGeralRH.UsuXCCusto+ ') AND');

      if (CmpRptCM.ParamByName('SitFunc').asString <> '') then
        if (Pos(',', CmpRptCM.ParamByName('SitFunc').asString) > 0) then
          Add('  (ST.TIPOSIT IN (' +CmpRptCM.ParamByName('SitFunc').asString+ ')) AND')
        else
          Add('  (ST.TIPOSIT  = ' +CmpRptCM.ParamByName('SitFunc').asString+ ') AND');

      if (CmpRptCM.ParamByName('TipoContrato').asString <> '') then
        if (Pos(',', CmpRptCM.ParamByName('TipoContrato').asString) > 0) then
          Add('  (F.TIPOCONTRATO IN (' +CmpRptCM.ParamByName('TipoContrato').asString+ ')) AND')
        else
          Add('  (F.TIPOCONTRATO  = ' +CmpRptCM.ParamByName('TipoContrato').asString+ ') AND');
    end;

    Add('  (ST.IDSITFUNC      = F.IDSITFUNC) AND');
    Add('  (PJ.IDPESSOA       = F.IDESTAB) AND');
    Add('  (PF.IDPESSOA       = F.IDPESSOA) AND');
    Add('  (PFIS.IDPESSOA     = F.IDPESSOA) AND');
    Add('  (H.IDPESSOA        = PF.IDPESSOA) AND');
    Add('  (F.IDPESSOA        = HIST.IDPESSOA) AND');
    Add('  (HIST.IDCARGO      = C.IDCARGO) AND');
    Add('  (H.IDMOTIVO        = MO.IDMOTIVO) AND');
    Add('  (H.IDRUBRICA       = RP.IDRUBRICA) AND');
    Add('  (HIST.IDEMPRESA    = CC.IDEMPRESA) AND');
    Add('  (HIST.CODCENTROCUSTO = CC.CODCENTROCUSTO) AND');
    Add('  (H.IDRUBRICA       = P.IDPROVENTO) AND');
    Add('  (RP.IDPESSOA       = HIST.IDEMPRESA) AND');
    Add('  (HT.IDHORARIO      = F.IDHORARIO) AND');
    Add('  (PJ.IDPESSOA       = END.IDPESSOA(+)) AND');
    Add('  (PJ.IDENDCOMERCIAL = END.IDENDERECO(+)) AND');
    Add('  (END.IDCIDADES     = CIDADES.IDCIDADES(+)) AND');
    Add('  (PJ.IDPESSOA       = ESTADUAL.IDPESSOA(+)) AND');
    Add('  (PJ.IDPESSOA       = MUNICIPAL.IDPESSOA(+)) AND');
    Add('  (F.IDPESSOA        = SALCONTRA.IDPESSOA(+)) AND');
    Add('  (F.IDPESSOA        = MARGEM1.IDPESSOA(+)) AND');
    Add('  (F.IDPESSOA        = MARGEM2.IDPESSOA(+)) AND');
    Add('  (F.IDPESSOA        = BASEPREVID.IDPESSOA(+)) AND');
    Add('  (HIST.IDFUNCAO     = C2.IDCARGO(+))');

    Add('ORDER BY');
    case (CmpRptCM.ParamByName('Ordenacao').asInteger) of
      0 : Add('  EMPRESA, EMPREGADO, TIPORUBRICA, CODRUBRICACLIENTE');
      1 : Add('  EMPRESA, MATRICULA, TIPORUBRICA, CODRUBRICACLIENTE');
      2 : Add('  EMPRESA, NOMECENTROCUSTO, EMPREGADO, TIPORUBRICA, CODRUBRICACLIENTE');
      3 : Add('  EMPRESA, NOMECENTROCUSTO, MATRICULA, TIPORUBRICA, CODRUBRICACLIENTE');
    end;
    SaveToFile('c:\qry.txt');
  end;
  dmCds.sql.Open;

  ppGroup10.NewPage := not(CmpRptCM.ParamByName('DoisRecPorFolha').asBoolean);

  // Monta Query Principal
  GravarDadosRelatorio;
  CdsReciboPagamento.First;
end;

procedure TRptReciboPagamento.CdsReciboPagamentoAfterOpen(DataSet: TDataSet);
begin
  frmAguarde.Max := DataSet.RecordCount;
  frmAguarde.Min := 0;
end;

procedure TRptReciboPagamento.CdsReciboPagamentoAfterScroll(DataSet: TDataSet);
begin
  frmAguarde.Pos := frmAguarde.Pos + 1;
  frmAguarde.Update;
end;

procedure TRptReciboPagamento.rpReciboPagamentoSmryBndAfterPrint(Sender: TObject);
begin
  frmAguarde.Apaga;
end;

procedure TRptReciboPagamento.GravarDadosRelatorio;
var
  wTotPagEmpregado: word;
  sMatricula: string;
  rSalBase, rBaseINSS, rBaseFGTS, rFGTSMes, rBaseIRRF, rProventos, rDescontos,
  rMargem1, rMargem2, rBasePrv: real;
  iPaginaAtual, iPagina, iRubrica, iNumDep: integer;
  Marca: TBookmark;
begin
  sqlReciboPagamento.Open;
  if not(dmCds.Cds.IsEmpty) then
  begin
    CdsReciboPagamento.IndexName := '';
    iPaginaAtual := 1;
    while not(dmCds.Cds.EOF) do
    begin
      sMatricula := dmCds.Cds.FieldByName('MATRICULA').asString;
      Marca := dmCds.Cds.GetBookMark;
      iPagina := 1;
      wTotPagEmpregado := 1;
      iRubrica := 0;

      // Calculo todas as páginas do Funcionário
      repeat
        if (dmCds.Cds.FieldByName('TIPORUBRICA').asInteger < 2) then
          Inc(iRubrica);
        dmCds.Cds.Next;
      until (sMatricula <> dmCds.Cds.FieldByName('MATRICULA').asString) or
            (dmCds.Cds.EOF);

      if (iRubrica in [01..15]) then wTotPagEmpregado := 1
      else
      if (iRubrica in [16..30]) then wTotPagEmpregado := 2
      else
      if (iRubrica in [31..45]) then wTotPagEmpregado := 3
      else
      if (iRubrica in [46..60]) then wTotPagEmpregado := 4
      else
      if (iRubrica in [61..75]) then wTotPagEmpregado := 5;
      dmCds.Cds.GotoBookmark(Marca);
      dmCds.Cds.FreeBookmark(Marca);

      rBaseINSS:=0; rBaseFGTS:=0; rFGTSMes:=0; rBaseIRRF:=0;
      rProventos:=0; rDescontos:=0;

      // Monto as informações em Páginas por Funcionário
      repeat
        CdsReciboPagamento.Append;
        CdsReciboPagamento.FieldByName('EMPREGADO').asString := dmCds.Cds.FieldByName('EMPREGADO').asString;
        CdsReciboPagamento.FieldByName('PAGINA').asInteger := iPaginaAtual;
        CdsReciboPagamento.FieldByName('FOLHA').asString :=
          'Folha: '+IntToStr(iPagina)+' de '+ IntToStr(wTotPagEmpregado);
        CdsReciboPagamento.FieldByName('MES_REF').asString :=
          FU.MesExtensoAno(CmpRptCM.ParamByName('AnoRef').asString +'/'+
          FU.PoeZero(CmpRptCM.ParamByName('MesRef').asInteger));
        CdsReciboPagamento.FieldByName('MATRICULA').asString := dmCds.Cds.FieldByName('MATRICULA').asString;
        CdsReciboPagamento.FieldByName('C_CUSTO').asString := dmCds.Cds.FieldByName('NOMECENTROCUSTO').asString;
        CdsReciboPagamento.FieldByName('CARGO').asString := dmCds.Cds.FieldByName('TITULO').asString;
        if dmCds.Cds.FieldByName('FUNCAO').asString = '' then
          CdsReciboPagamento.FieldByName('FUNCAO').asString := ''
        else
          CdsReciboPagamento.FieldByName('FUNCAO').asString := 'Função: '+dmCds.Cds.FieldByName('FUNCAO').asString;
        CdsReciboPagamento.FieldByName('EMPRESA').asString := dmCds.Cds.FieldByName('EMPRESA').asString;
        CdsReciboPagamento.FieldByName('CGC').asString := dmCds.Cds.FieldByName('CGC').asString;
        CdsReciboPagamento.FieldByName('INSCRICAO').asString := dmCds.Cds.FieldByName('ESTADUALMUNICIPAL').asString;
        CdsReciboPagamento.FieldByName('ENDERECO').asString := dmCds.Cds.FieldByName('ENDERECO').asString;

        rSalBase := dmCds.Cds.FieldByName('SALBASE').asFloat;
        rMargem1 := dmCds.Cds.FieldByName('VALORMARGEM1').asFloat;
        rMargem2 := dmCds.Cds.FieldByName('VALORMARGEM2').asFloat;
        rBasePrv := dmCds.Cds.FieldByName('BASEPREVPRIV').asFloat;
        iNumDep  := dmCds.Cds.FieldByName('NUMDEPIRRF').asInteger;

        // Preencho cada Linha da Página do Funcionário com suas Rubricas
        iRubrica := 1;
        repeat
          if (dmCds.Cds.FieldByName('TIPORUBRICA').asInteger < 2) then
          begin
            CdsReciboPagamento.FieldByName('CODRUBRICA'+IntToStr(iRubrica)).asString := dmCds.Cds.FieldByName('CODRUBRICACLIENTE').asString;
            CdsReciboPagamento.FieldByName('RUBRICA'+IntToStr(iRubrica)).asString := dmCds.Cds.FieldByName('RUBRICA').asString;
            CdsReciboPagamento.FieldByName('REFERENCIA'+IntToStr(iRubrica)).asString := dmCds.Cds.FieldByName('REFERENCIA').asString;

            if (dmCds.Cds.FieldByName('TIPORUBRICA').asInteger = 0) then
            begin
              CdsReciboPagamento.FieldByName('PROVENTO'+IntToStr(iRubrica)).asFloat := dmCds.Cds.FieldByName('VALOR').asFloat;
              rProventos := rProventos + dmCds.Cds.FieldByName('VALOR').asFloat;
            end
            else
            begin
              CdsReciboPagamento.FieldByName('DESCONTO'+IntToStr(iRubrica)).asFloat := dmCds.Cds.FieldByName('VALOR').asFloat;
              rDescontos := rDescontos + dmCds.Cds.FieldByName('VALOR').asFloat;
            end;
            Inc(iRubrica);
          end
          else
          begin
            // Base do INSS
            if (dmCds.Cds.FieldByName('CODRUBRICA').asString = '60025') or
               (dmCds.Cds.FieldByName('CODRUBRICA').asString = '62016') then
              rBaseINSS := rBaseINSS + dmCds.Cds.FieldByName('VALOR').asFloat
            else
            // FGTS do Mês
            if (dmCds.Cds.FieldByName('CODRUBRICA').asString = '40695') or
               (dmCds.Cds.FieldByName('CODRUBRICA').asString = '43696') or
               (dmCds.Cds.FieldByName('CODRUBRICA').asString = '43700') then
              rFGTSMes := rFGTSMes + dmCds.Cds.FieldByName('VALOR').asFloat
            else
            // Base do FGTS
            if (dmCds.Cds.FieldByName('CODRUBRICA').asString = '60695') or
               (dmCds.Cds.FieldByName('CODRUBRICA').asString = '62022') then
              rBaseFGTS := rBaseFGTS + dmCds.Cds.FieldByName('VALOR').asFloat
            else
            // Base do IRRF
            if (dmCds.Cds.FieldByName('CODRUBRICA').asString = '60026') or
               (dmCds.Cds.FieldByName('CODRUBRICA').asString = '60028') or
               (dmCds.Cds.FieldByName('CODRUBRICA').asString = '62026') then
              rBaseIRRF := rBaseIRRF + dmCds.Cds.FieldByName('VALOR').asFloat;
          end;
          sMatricula := dmCds.Cds.FieldByName('MATRICULA').asString;

          dmCds.Cds.Next;
        until (sMatricula <> dmCds.Cds.FieldByName('MATRICULA').asString) or
              (dmCds.Cds.EOF) or
              ((sMatricula = dmCds.Cds.FieldByName('MATRICULA').asString) and
               (dmCds.Cds.FieldByName('TIPORUBRICA').asInteger < 2) and
               (iRubrica = 16));

        if (sMatricula <> dmCds.Cds.FieldByName('MATRICULA').asString) or
           (dmCds.Cds.EOF) then
        begin
          CdsReciboPagamento.FieldByName('NUMDEPIRRF').asInteger := iNumDep;
          CdsReciboPagamento.FieldByName('SALBASE').asFloat := rSalBase;
          CdsReciboPagamento.FieldByName('VALORMARGEM1').asFloat := rMargem1;
          CdsReciboPagamento.FieldByName('VALORMARGEM2').asFloat := rMargem2;
          CdsReciboPagamento.FieldByName('BASEPREVPRIV').asFloat := rBasePrv;
          CdsReciboPagamento.FieldByName('BASEINSS').asFloat := rBaseINSS;
          CdsReciboPagamento.FieldByName('BASEFGTS').asFloat := rBaseFGTS;
          CdsReciboPagamento.FieldByName('FGTSMES').asFloat := rFGTSMes;
          CdsReciboPagamento.FieldByName('BASEIRRF').asFloat := rBaseIRRF;
          CdsReciboPagamento.FieldByName('TOT_PROVENTOS').asFloat := rProventos;
          CdsReciboPagamento.FieldByName('TOT_DESCONTOS').asFloat := rDescontos;
          CdsReciboPagamento.FieldByName('TOT_GERAL').asString :=
            FU.ValStr(rProventos - rDescontos, 12, 2, true, ',');
        end
        else
          CdsReciboPagamento.FieldByName('TOT_GERAL').asString := 'CONTINUA       ';

        CdsReciboPagamento.Post;

        Inc(iPagina);
        iPaginaAtual := iPaginaAtual + 2;
      until (sMatricula <> dmCds.Cds.FieldByName('MATRICULA').asString) or
            (dmCds.Cds.EOF);
    end;
  end
  else
  begin
    CdsReciboPagamento.Insert;
    CdsReciboPagamento.Post;
  end;

  DuplicarDadosRelatorio;
end;

procedure TRptReciboPagamento.DuplicarDadosRelatorio;
var
  c: byte;
  sIndice: string;
  CdsAux: TCMClientDataSet;
begin
  if (CmpRptCM.ParamByName('ImprimirDuplicado').asBoolean) and
     (CdsReciboPagamento.FieldByName('EMPRESA').asString <> '') then
  begin
    CdsAux := TCMClientDataSet.Create(Self);
    CdsAux.Data := CdsReciboPagamento.Data;
    CdsAux.First;

    repeat
      CdsReciboPagamento.Insert;
      for c:=0 to CdsAux.FieldCount-1 do
      begin
        if (CdsReciboPagamento.Fields[c].FieldName = 'PAGINA') then
          CdsReciboPagamento.Fields[c].Value := CdsAux.Fields[c].Value + 1
        else
          CdsReciboPagamento.Fields[c].Value := CdsAux.Fields[c].Value;
      end;
      CdsReciboPagamento.Post;
      CdsAux.Next;
    until (CdsAux.EOF);

    case (CmpRptCM.ParamByName('Ordenacao').asInteger) of
      0 : sIndice := '  EMPRESA;EMPREGADO';
      1 : sIndice := '  EMPRESA;MATRICULA';
      2 : sIndice := '  EMPRESA;NOMECENTROCUSTO;EMPREGADO';
      3 : sIndice := '  EMPRESA;NOMECENTROCUSTO;MATRICULA';
    end;
    CdsReciboPagamento.IndexDefs.Items[0].Fields := sIndice;
    CdsReciboPagamento.IndexName := 'IndicePrimario';
    CdsAux.Free;
  end;
end;

procedure TRptReciboPagamento.ppGroupHeaderBand10BeforePrint(
  Sender: TObject);
begin
  inherited;
  lblReciboPagamentoBASEPREV.Visible := CdsReciboPagamento.FieldByName('BASEPREVPRIV').asFloat > 0;
  rpReciboPagamentoBASEPREV.Visible := CdsReciboPagamento.FieldByName('BASEPREVPRIV').asFloat > 0;
end;

end.
