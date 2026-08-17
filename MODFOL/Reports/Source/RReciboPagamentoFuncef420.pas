// *****************************************************************************
// ***************************** REGISTRO DE ALTERAÇÕES ************************
// *****************************************************************************
// Autor(a)    :  Ádler Teodoro de Souza
// Data        :  19/02/2009
// Pendência   : SOL 109421 KINTANA 496332
// Descricao   :  Alteração de gravação de arquivos de log na raiz do disco C: .
//------------------------------------------------------------------------------
unit RReciboPagamentoFuncef;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs, FCmReport,
  uCmRptManager, TXComp, CmParamReport, Db, Wwdatsrc, ppDB, ppDBPipe, ppDBBDE, ppBands,
  ppCtrls, ppPrnabl, ppClass, ppCache, ppComm, ppRelatv, ppProd, ppReport, DBClient,
  uCMClientDataSet, uCmSqlParams, ppStrtch, ppSubRpt, ppRegion, TXRB;

type
  TRptReciboPagamentoFuncef = class(TFrmCmReport)
    rpReciboPagamento: TppReport;
    ppDetailBand10: TppDetailBand;
    rpReciboPagamentoSmryBnd: TppSummaryBand;
    ppGroup10: TppGroup;
    ppGroupHeaderBand10: TppGroupHeaderBand;
    shpReciboPagamento12: TppShape;
    shpReciboPagamento2: TppShape;
    lblReciboPagamentoNOME: TppLabel;
    lblReciboPagamentoCARGO: TppLabel;
    lblReciboPagamentoC_CUSTO: TppLabel;
    dbtxtReciboPagamentoEMPRESA: TppDBText;
    dbtxtReciboPagamentoCGC: TppDBText;
    dbtxtReciboPagamentoMATRICULA: TppDBText;
    dbtxtReciboPagamentoEMPREGADO: TppDBText;
    dbtxtReciboPagamentoCARGO: TppDBText;
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
    lblReciboPagamentoTOT_LIQ: TppLabel;
    lblReciboPagamentoBASE_IRRF: TppLabel;
    lblReciboPagamentoFGTS_MES: TppLabel;
    lblReciboPagamentoMARGEM1: TppLabel;
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
    dbtxtReciboPagamentoMARGEM1: TppDBText;
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
    ppFooterBand1: TppFooterBand;
    ppColumnHeaderBand1: TppColumnHeaderBand;
    ppColumnFooterBand1: TppColumnFooterBand;
    Figura1: TppImage;
    Figura2: TppImage;
    Figura3: TppImage;
    ppShape1: TppShape;
    ppLabel7: TppLabel;
    ppLine1: TppLine;
    dbtxtReciboPagamentoCODRUBRICA16: TppDBText;
    dbtxtReciboPagamentoRUBRICA16: TppDBText;
    dbtxtReciboPagamentoREFERENCIA16: TppDBText;
    dbtxtReciboPagamentoPROVENTO16: TppDBText;
    dbtxtReciboPagamentoDESCONTO16: TppDBText;
    dbtxtReciboPagamentoCODRUBRICA17: TppDBText;
    dbtxtReciboPagamentoRUBRICA17: TppDBText;
    dbtxtReciboPagamentoREFERENCIA17: TppDBText;
    dbtxtReciboPagamentoPROVENTO17: TppDBText;
    dbtxtReciboPagamentoDESCONTO17: TppDBText;
    dbtxtReciboPagamentoCODRUBRICA18: TppDBText;
    dbtxtReciboPagamentoRUBRICA18: TppDBText;
    dbtxtReciboPagamentoREFERENCIA18: TppDBText;
    dbtxtReciboPagamentoPROVENTO18: TppDBText;
    dbtxtReciboPagamentoDESCONTO18: TppDBText;
    dbtxtReciboPagamentoCODRUBRICA19: TppDBText;
    dbtxtReciboPagamentoRUBRICA24: TppDBText;
    dbtxtReciboPagamentoREFERENCIA19: TppDBText;
    dbtxtReciboPagamentoPROVENTO19: TppDBText;
    dbtxtReciboPagamentoDESCONTO19: TppDBText;
    dbtxtReciboPagamentoCODRUBRICA20: TppDBText;
    dbtxtReciboPagamentoRUBRICA19: TppDBText;
    dbtxtReciboPagamentoREFERENCIA20: TppDBText;
    dbtxtReciboPagamentoPROVENTO20: TppDBText;
    dbtxtReciboPagamentoDESCONTO20: TppDBText;
    dbtxtReciboPagamentoCODRUBRICA21: TppDBText;
    dbtxtReciboPagamentoRUBRICA20: TppDBText;
    dbtxtReciboPagamentoREFERENCIA21: TppDBText;
    dbtxtReciboPagamentoPROVENTO21: TppDBText;
    dbtxtReciboPagamentoDESCONTO21: TppDBText;
    dbtxtReciboPagamentoCODRUBRICA22: TppDBText;
    dbtxtReciboPagamentoRUBRICA21: TppDBText;
    dbtxtReciboPagamentoREFERENCIA22: TppDBText;
    dbtxtReciboPagamentoPROVENTO22: TppDBText;
    dbtxtReciboPagamentoDESCONTO22: TppDBText;
    dbtxtReciboPagamentoCODRUBRICA23: TppDBText;
    dbtxtReciboPagamentoRUBRICA22: TppDBText;
    dbtxtReciboPagamentoREFERENCIA23: TppDBText;
    dbtxtReciboPagamentoPROVENTO23: TppDBText;
    dbtxtReciboPagamentoDESCONTO23: TppDBText;
    dbtxtReciboPagamentoCODRUBRICA24: TppDBText;
    dbtxtReciboPagamentoRUBRICA23: TppDBText;
    dbtxtReciboPagamentoREFERENCIA24: TppDBText;
    dbtxtReciboPagamentoPROVENTO24: TppDBText;
    dbtxtReciboPagamentoDESCONTO24: TppDBText;
    dbtxtReciboPagamentoCODRUBRICA25: TppDBText;
    dbtxtReciboPagamentoRUBRICA25: TppDBText;
    dbtxtReciboPagamentoREFERENCIA25: TppDBText;
    dbtxtReciboPagamentoPROVENTO25: TppDBText;
    dbtxtReciboPagamentoDESCONTO25: TppDBText;
    lblReciboPagamentoAgencia: TppLabel;
    ppLabel8: TppLabel;
    ppLine2: TppLine;
    ppLine3: TppLine;
    ppLine4: TppLine;
    ppLine5: TppLine;
    ppLine6: TppLine;
    lblReciboPagamentoSFAM: TppLabel;
    ppLabel10: TppLabel;
    ppImage1: TppImage;
    ppImage2: TppImage;
    ppDBText6: TppDBText;
    ppShape2: TppShape;
    ppLabel11: TppLabel;
    lblReciboPagamentoC_CUSTO2: TppLabel;
    dbtxtReciboPagamentoMATR2: TppDBText;
    dbtxtReciboPagamentoNOME2: TppDBText;
    dbtxtReciboPagamentoC_CUSTO2: TppDBText;
    ppLabel14: TppLabel;
    ppLabel15: TppLabel;
    lblReciboPagamentoCODCUSTO: TppLabel;
    ppLine7: TppLine;
    ppLine8: TppLine;
    ppLine10: TppLine;
    ppLine9: TppLine;
    dbtxtReciboPagamentoAGENCIA: TppDBText;
    dbtxtReciboPagamentoCONTA: TppDBText;
    dbtxtReciboPagamentoSFAM: TppDBText;
    dbtxtReciboPagamentoDEPIR: TppDBText;
    dbtxtReciboPagamentoCODCUSTO: TppDBText;
    lblReciboPagamentoSAL_PART1: TppLabel;
    dbtxtReciboPagamentoSALPART: TppDBText;
    lblReciboPagamentoMARGEM22: TppLabel;
    dbtxtReciboPagamentoMARGEM2: TppDBText;
    ppLine11: TppLine;
    ppLine12: TppLine;
    ppLine13: TppLine;
    ppLine14: TppLine;
    ppLine15: TppLine;
    ppLine16: TppLine;
    ppLabel3: TppLabel;
    lblReciboPagamentoSAL_PART2: TppLabel;
    lblReciboPagamentoBASE_IRRF2: TppLabel;
    lblReciboPagamentoMARGEM2: TppLabel;
    lblReciboPagamentoSAL_BASE2: TppLabel;
    lblReciboPagamentoFGTS_MES2: TppLabel;
    lblReciboPagamentoMARGEM12: TppLabel;
    ppLine17: TppLine;
    procedure CrmRptCMBeforePrint(Sender: TObject);
    procedure CdsReciboPagamentoAfterOpen(DataSet: TDataSet);
    procedure CdsReciboPagamentoAfterScroll(DataSet: TDataSet);
    procedure rpReciboPagamentoSmryBndAfterPrint(Sender: TObject);
    procedure ppGroupHeaderBand10BeforePrint(Sender: TObject);
  private
    procedure GravarDadosRelatorio;
    procedure DuplicarDadosRelatorio;
  public
    IdEmpresa, MesRef, AnoRef, Ordenacao: integer;
    ListaIdEstab, ListaIdFunc, TipoContrato, SitFunc, NomeTabela, TipoPagamento,
    sFigura1, sFigura2, sFigura3: string;

  end;

var
  RptReciboPagamentoFuncef: TRptReciboPagamentoFuncef;

implementation

uses uCtrlFuncoesRH, dCds, fAguarde, uCtrlUsoGeralRH;

{$R *.DFM}

procedure TRptReciboPagamentoFuncef.CrmRptCMBeforePrint(Sender: TObject);
var
  DocID: array[1..2] of integer;
  iMes, iAno: integer;
begin
  inherited;
  Figura1.Picture.LoadFromFile(sFigura1);
  Figura2.Picture.LoadFromFile(sFigura2);
  Figura3.Picture.LoadFromFile(sFigura3);

  DocID[1] := 0;
  DocID[2] := 0;

  iMes := MesRef;
  iAno := AnoRef;

  with (dmCds.sql.SQL) do
  begin
    Clear;
    Add('SELECT DISTINCT');
    Add('  PJ.RAZAOSOCIAL AS EMPRESA,');
    Add('  PF.NOME AS EMPREGADO,');
    Add('  P.FLGDESCONTO AS TIPORUBRICA,');
    Add('  RTRIM(DECODE(RTRIM(H.REFERENCIA),''***'','''',''Ferias'','''',''Férias'','''',');
    Add('    ''Rescisao'','''',''Rescisão'','''',''13.o Salar'','''',H.REFERENCIA)) AS REFERENCIA,');
    Add('  F.MATRICULA, F.TIPOCONTRATO,');
    Add('  F.NUMCONTASALARIO, AG.NUMAGENCIA, BA.NUMBANCO,');
    Add('  CC.CODCENTROCUSTO, CC.NOME AS NOMECENTROCUSTO,');
    Add('  PFIS.NUMDEPIRRF, PFIS.NUMDEPSALF,');
    Add('  C.TITULO,');
    Add('  P.CODRUBCLT AS CODRUBRICA,');
    Add('  RP.CODPROVDESC AS CODRUBRICACLIENTE,');
    Add('  RP.DESCRPROVDESC AS RUBRICA,');
    Add('  (''CNPJ:'' || PJ.NUMDOCUMENTO) AS CGC,');
    Add('  PF.NUMDOCUMENTO AS CPF, PIS.NUM AS PIS,');
    Add('  H.VALORPROVENTO AS VALOR,');
    Add('  MARGEM1.VALORMARGEM AS VALORMARGEM1, MARGEM2.VALORMARGEM AS VALORMARGEM2,');
    Add('  (F.SALARIOATUAL * DECODE(F.TIPOPAGAMENTO,''M'',1,HT.JORNADAMENSAL)) AS SALBASE');
    Add('FROM');
    Add('  ' +NomeTabela+ ' H, PESSOA PJ, PESSOA PF,  PESSOAFISICA PFIS, PROVDESC P,');
    Add('  RUBRICAXPESS RP, FUNCIONARIO F, CARGO C, MOTIVO MO, CIDADES, HORATRAB HT,');
    Add('  CENTCUST CC, SITFUNC ST, AGENCIABANCARIA AG, BANCO BA,');
    // Última evolução Funcional do Funcionário
    // --------------------------------------------------------------------------------------
    Add('  (SELECT EVOL.IDCARGO, EVOL.IDPESSOA, EVOL.IDEMPRESA, EVOL.CODCENTROCUSTO');
    Add('    FROM   EVOLFUNC EVOL,');
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
    Add('    WHERE  (EVOL.DATAALTERFUNC = HST2.DATAALTERFUNC) AND');
    Add('           (EVOL.IDPESSOA      = HST2.IDPESSOA) AND');
    Add('           (EVOL.TRGDTINCLUSAO = HST3.DATAINCLUSAO) AND');
    Add('           (EVOL.IDPESSOA      = HST3.IDPESSOA)) HST,');
    // -------------------------------------------------------------------------- //
    // Margem 1 (CLT = 90010)
    Add('  (SELECT DISTINCT');
    Add('   H.IDPESSOA, H.VALORPROVENTO AS VALORMARGEM');
    Add('   FROM');
    Add('  ' +NomeTabela+ ' H, PROVDESC P');
    Add('   WHERE');
    Add('   (H.MES        = ' +QuotedStr(IntToStr(AnoRef) +'/'+
      FU.PoeZero(MesRef))+ ') AND');
    Add('   (H.IDMOTIVO   IN (' +TipoPagamento+ ')) AND');
    Add('   (P.CODRUBCLT  = ''90010'') AND');
    Add('   (P.IDPROVENTO = H.IDRUBRICA)) MARGEM1,');
    // -------------------------------------------------------------------------- //
    // Margem 2 (CLT = 90012)
    Add('  (SELECT DISTINCT');
    Add('   H.IDPESSOA, H.VALORPROVENTO AS VALORMARGEM');
    Add('   FROM');
    Add('  ' +NomeTabela+ ' H, PROVDESC P');
    Add('   WHERE');
    Add('   (H.MES        = ' +QuotedStr(IntToStr(AnoRef) +'/'+
      FU.PoeZero(MesRef))+ ') AND');
    Add('   (H.IDMOTIVO   IN (' +TipoPagamento+ ')) AND');
    Add('   (P.CODRUBCLT  = ''90012'') AND');
    Add('   (P.IDPROVENTO = H.IDRUBRICA)) MARGEM2,');
    // -------------------------------------------------------------------------- //
    // PIS do Funcionário
    Add('  (SELECT F.IDPESSOA, DP.NUMDOCUMENTO AS NUM');
    Add('   FROM   DOCPESSOA DP, FUNCIONARIO F, TIPODOCOFICIAL TDO');
    Add('   WHERE ((TDO.SIGLADOCUMENTO = ''PIS:'') OR');
    Add('          (TDO.SIGLADOCUMENTO = ''PIS/PASEP:'')) AND');
    Add('         (TDO.IDDOCUMENTO     = DP.IDDOCUMENTO) AND');
    Add('         (DP.IDPESSOA         = F.IDPESSOA)) PIS');
    // -------------------------------------------------------------------------- //
    Add('WHERE');
    Add('  (PJ.IDPESSOA      IN (' +ListaIdEstab+ ')) AND');
    Add('  (MO.IDMOTIVO      IN (' +TipoPagamento+ ')) AND');
    Add('  (H.IDPESSJUR       = ' +IntToStr(IdEmpresa)+ ') AND');

    // Funcionário(s) selecionado(s) (para HISTRUBSAL)
    if (ListaIdFunc <> '') then
      if (Pos(',', ListaIdFunc) > 0) then
        Add('  (H.IDPESSOA IN (' +ListaIdFunc+ ')) AND')
      else
        Add('  (H.IDPESSOA  = ' +ListaIdFunc+ ') AND');

    Add('  (H.MES             = '+QuotedStr(IntToStr(AnoRef) +'/'+
      FU.PoeZero(MesRef))+ ') AND');

    // Funcionário(s) selecionado(s) (para PESSOA)
    if (ListaIdFunc <> '') then
    begin
      if (Pos(',', ListaIdFunc) > 0) then
        Add('  (F.IDPESSOA IN (' +ListaIdFunc+ ')) AND')
      else
        Add('  (F.IDPESSOA  = ' +ListaIdFunc+ ') AND');
    end
    else
    begin
      // C. de Custo(s) habilitados para o usuário
      if (CtrlUsoGeralRH.UsuXCCusto <> '') then
        if (Pos(',', CtrlUsoGeralRH.UsuXCCusto) > 0) then
          Add('  (TRIM(DECODE(HST.CODCENTROCUSTO,NULL,F.CODCENTROCUSTO,HST.CODCENTROCUSTO)) IN ' +CtrlUsoGeralRH.UsuXCCusto+ ') AND')
        else
          Add('  (TRIM(DECODE(HST.CODCENTROCUSTO,NULL,F.CODCENTROCUSTO,HST.CODCENTROCUSTO)) = ' +CtrlUsoGeralRH.UsuXCCusto+ ') AND');

      if (SitFunc <> '') then
        if (Pos(',', SitFunc) > 0) then
          Add('  (ST.TIPOSIT IN (' +SitFunc+ ')) AND')
        else
          Add('  (ST.TIPOSIT  = ' +SitFunc+ ') AND');

      if (TipoContrato <> '') then
        if (Pos(',', TipoContrato) > 0) then
          Add('  (F.TIPOCONTRATO IN (' +TipoContrato+ ')) AND')
        else
          Add('  (F.TIPOCONTRATO  = ' +TipoContrato+ ') AND');
    end;

    Add('  (ST.IDSITFUNC      = F.IDSITFUNC) AND');
    Add('  (PJ.IDPESSOA       = F.IDESTAB) AND');
    Add('  (PF.IDPESSOA       = F.IDPESSOA) AND');
    Add('  (PF.IDPESSOA       = PFIS.IDPESSOA) AND');
    Add('  (H.IDPESSOA        = PF.IDPESSOA) AND');
    Add('  (DECODE(HST.IDCARGO,NULL,F.IDCARGO,HST.IDCARGO) = C.IDCARGO) AND');
    Add('  (H.IDMOTIVO        = MO.IDMOTIVO) AND');
    Add('  (H.IDRUBRICA       = RP.IDRUBRICA) AND');
    Add('  (DECODE(HST.IDEMPRESA,NULL,F.IDEMPRESA,HST.IDEMPRESA) = CC.IDEMPRESA) AND');
    Add('  (DECODE(HST.CODCENTROCUSTO,NULL,F.CODCENTROCUSTO,HST.CODCENTROCUSTO) = CC.CODCENTROCUSTO) AND');
    Add('  (H.IDRUBRICA       = P.IDPROVENTO) AND');
    Add('  (RP.IDPESSOA       = DECODE(HST.IDEMPRESA,NULL,F.IDEMPRESA,HST.IDEMPRESA)) AND');
    Add('  (HT.IDHORARIO      = F.IDHORARIO) AND');
    Add('  (F.IDPESSOA        = PIS.IDPESSOA(+)) AND');
    Add('  (F.IDAGENCIASALARIO= AG.IDPESSOA(+)) AND');
    Add('  (AG.IDBANCO        = BA.IDPESSOA(+)) AND');
    Add('  (F.IDPESSOA        = MARGEM1.IDPESSOA(+)) AND');
    Add('  (F.IDPESSOA        = MARGEM2.IDPESSOA(+)) AND');
    Add('  (F.IDPESSOA        = HST.IDPESSOA(+))');

    Add('ORDER BY');
    case (Ordenacao) of
      0 : Add('  EMPRESA, EMPREGADO, TIPORUBRICA, CODRUBRICACLIENTE');
      1 : Add('  EMPRESA, NOMECENTROCUSTO, EMPREGADO, TIPORUBRICA, CODRUBRICACLIENTE');
      2 : Add('  EMPRESA, NOMECENTROCUSTO, MATRICULA, TIPORUBRICA, CODRUBRICACLIENTE');
      3 : Add('  EMPRESA, MATRICULA, TIPORUBRICA, CODRUBRICACLIENTE');
    end;
    //SaveToFile('c:\qry.txt');
    SaveToFile(Sistema.RetornaCaminhoArquivos(Sistema.IdEmpresa)+'\qry.txt');//Ádler Teodoro de Souza SOL 109421 KINTANA 496332
  end;
  dmCds.sql.Open;

  ppGroup10.NewPage := false; //not(CmpRptCM.ParamByName('DoisRecPorFolha').asBoolean);

  // Monta Query Principal
  GravarDadosRelatorio;
  CdsReciboPagamento.First;
end;

procedure TRptReciboPagamentoFuncef.CdsReciboPagamentoAfterOpen(DataSet: TDataSet);
begin
  frmAguarde.Max := DataSet.RecordCount;
  frmAguarde.Min := 0;
end;

procedure TRptReciboPagamentoFuncef.CdsReciboPagamentoAfterScroll(DataSet: TDataSet);
begin
  frmAguarde.Pos := frmAguarde.Pos + 1;
  frmAguarde.Update;
end;

procedure TRptReciboPagamentoFuncef.rpReciboPagamentoSmryBndAfterPrint(Sender: TObject);
begin
  frmAguarde.Apaga;
end;

procedure TRptReciboPagamentoFuncef.GravarDadosRelatorio;
var
  wTotPagEmpregado: word;
  sMatricula: string;
  rSalBase, rBaseINSS, rBaseFGTS, rFGTSMes, rBaseIRRF, rProventos, rDescontos,
  rMargem1, rMargem2, rSalPart: real;
  iPaginaAtual, iPagina, iRubrica: integer;
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

      if (iRubrica in [01..25]) then wTotPagEmpregado := 1
      else
      if (iRubrica in [26..50]) then wTotPagEmpregado := 2
      else
      if (iRubrica in [51..75]) then wTotPagEmpregado := 3
      else
      if (iRubrica in [76..100]) then wTotPagEmpregado := 4
      else
      if (iRubrica in [101..125]) then wTotPagEmpregado := 5;
      dmCds.Cds.GotoBookmark(Marca);
      dmCds.Cds.FreeBookmark(Marca);

      rBaseINSS:=0; rSalPart:=0; rBaseFGTS:=0; rFGTSMes:=0; rBaseIRRF:=0;
      rProventos:=0; rDescontos:=0;

      // Monto as informações em Páginas por Funcionário
      repeat
        CdsReciboPagamento.Append;
        CdsReciboPagamento.FieldByName('EMPREGADO').asString := dmCds.Cds.FieldByName('EMPREGADO').asString;
        CdsReciboPagamento.FieldByName('PAGINA').asInteger := iPaginaAtual;
        CdsReciboPagamento.FieldByName('FOLHA').asString :=
          'Folha: '+IntToStr(iPagina)+' de '+ IntToStr(wTotPagEmpregado);
        CdsReciboPagamento.FieldByName('MES_REF').asString :=
          FU.MesExtensoAno(IntToStr(AnoRef) +'/'+
          FU.PoeZero(MesRef));
        CdsReciboPagamento.FieldByName('MATRICULA').asString := dmCds.Cds.FieldByName('MATRICULA').asString;
        CdsReciboPagamento.FieldByName('CODCENTROCUSTO').asString := dmCds.Cds.FieldByName('CODCENTROCUSTO').asString;
        CdsReciboPagamento.FieldByName('NUMAGENCIA').asString := dmCds.Cds.FieldByName('NUMAGENCIA').asString;
        CdsReciboPagamento.FieldByName('NUMCONTASALARIO').asString := dmCds.Cds.FieldByName('NUMCONTASALARIO').asString;
        CdsReciboPagamento.FieldByName('TIPOCONTRATO').asString := dmCds.Cds.FieldByName('TIPOCONTRATO').asString;
        CdsReciboPagamento.FieldByName('NUMDEPSALF').asInteger := dmCds.Cds.FieldByName('NUMDEPSALF').asInteger;
        CdsReciboPagamento.FieldByName('NUMDEPIRRF').asInteger := dmCds.Cds.FieldByName('NUMDEPIRRF').asInteger;
        CdsReciboPagamento.FieldByName('EMPRESA').asString := dmCds.Cds.FieldByName('EMPRESA').asString;
        CdsReciboPagamento.FieldByName('CGC').asString := dmCds.Cds.FieldByName('CGC').asString;

        if dmCds.Cds.FieldByName('TIPOCONTRATO').asString <> 'A' then
        begin
          CdsReciboPagamento.FieldByName('C_CUSTO').asString := dmCds.Cds.FieldByName('NOMECENTROCUSTO').asString;
          CdsReciboPagamento.FieldByName('CARGO').asString := dmCds.Cds.FieldByName('TITULO').asString;
          CdsReciboPagamento.FieldByName('NUMAGENCIA').asString := dmCds.Cds.FieldByName('NUMAGENCIA').asString;
        end
        else
        begin
          CdsReciboPagamento.FieldByName('C_CUSTO').asString := dmCds.Cds.FieldByName('TITULO').asString;
          CdsReciboPagamento.FieldByName('CARGO').asString :=
            dmCds.Cds.FieldByName('PIS').asString +
            '                                '+
            dmCds.Cds.FieldByName('CPF').asString;
          CdsReciboPagamento.FieldByName('NUMAGENCIA').asString :=
            dmCds.Cds.FieldByName('NUMBANCO').asString + ' / ' +
            dmCds.Cds.FieldByName('NUMAGENCIA').asString;
        end;

        rSalBase := dmCds.Cds.FieldByName('SALBASE').asFloat;
        rMargem1 := dmCds.Cds.FieldByName('VALORMARGEM1').asFloat;
        rMargem2 := dmCds.Cds.FieldByName('VALORMARGEM2').asFloat;

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
              rBaseINSS := dmCds.Cds.FieldByName('VALOR').asFloat
            else
            // Base Prev. Priv.
            if (dmCds.Cds.FieldByName('CODRUBRICA').asString = '90011') then
              rSalPart := dmCds.Cds.FieldByName('VALOR').asFloat
            else
            // FGTS do Mês
            if (dmCds.Cds.FieldByName('CODRUBRICA').asString = '40695') or
               (dmCds.Cds.FieldByName('CODRUBRICA').asString = '43696') or
               (dmCds.Cds.FieldByName('CODRUBRICA').asString = '43700') then
              rFGTSMes := dmCds.Cds.FieldByName('VALOR').asFloat
            else
            // Remuneração para Autônomo
            if (dmCds.Cds.FieldByName('CODRUBRICA').asString = '60052') and
               (dmCds.Cds.FieldByName('TIPOCONTRATO').asString = 'A') then
              rSalBase := dmCds.Cds.FieldByName('VALOR').asFloat
            else
            // Base do FGTS
            if (dmCds.Cds.FieldByName('CODRUBRICA').asString = '60695') then
              rBaseFGTS := dmCds.Cds.FieldByName('VALOR').asFloat
            else
            // Base do IRRF
            if (dmCds.Cds.FieldByName('CODRUBRICA').asString = '60026') or
               (dmCds.Cds.FieldByName('CODRUBRICA').asString = '60028') or
               (dmCds.Cds.FieldByName('CODRUBRICA').asString = '62026') then
              rBaseIRRF := dmCds.Cds.FieldByName('VALOR').asFloat;
          end;
          sMatricula := dmCds.Cds.FieldByName('MATRICULA').asString;

          dmCds.Cds.Next;
        until (sMatricula <> dmCds.Cds.FieldByName('MATRICULA').asString) or
              (dmCds.Cds.EOF) or
              ((sMatricula = dmCds.Cds.FieldByName('MATRICULA').asString) and
               (dmCds.Cds.FieldByName('TIPORUBRICA').asInteger < 2) and
               (iRubrica = 26));

        if (sMatricula <> dmCds.Cds.FieldByName('MATRICULA').asString) or
           (dmCds.Cds.EOF) then
        begin
          CdsReciboPagamento.FieldByName('SALBASE').asFloat := rSalBase;
          CdsReciboPagamento.FieldByName('VALORMARGEM1').asFloat := rMargem1;
          CdsReciboPagamento.FieldByName('VALORMARGEM2').asFloat := rMargem2;
          CdsReciboPagamento.FieldByName('BASEINSS').asFloat := rBaseINSS;
          CdsReciboPagamento.FieldByName('SALPART').asFloat := rSalPart;
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
    CdsReciboPagamento.Append;
    CdsReciboPagamento.Post;
  end;

  DuplicarDadosRelatorio;
end;

procedure TRptReciboPagamentoFuncef.DuplicarDadosRelatorio;
var
  c: byte;
  sIndice: string;
  CdsAux: TCMClientDataSet;
begin
  if (false) and  //(CmpRptCM.ParamByName('ImprimirDuplicado').asBoolean) and
     (CdsReciboPagamento.FieldByName('EMPRESA').asString <> '') then
  begin
    CdsAux := TCMClientDataSet.Create(Self);
    CdsAux.Data := CdsReciboPagamento.Data;
    CdsAux.First;

    repeat
      CdsReciboPagamento.Append;
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

    case (Ordenacao) of
      0 : sIndice := '  EMPRESA;EMPREGADO';
      1 : sIndice := '  EMPRESA;NOMECENTROCUSTO;EMPREGADO';
      2 : sIndice := '  EMPRESA;NOMECENTROCUSTO;MATRICULA';
      3 : sIndice := '  EMPRESA;MATRICULA';
    end;
    CdsReciboPagamento.IndexDefs.Items[0].Fields := sIndice;
    CdsReciboPagamento.IndexName := 'IndicePrimario';
    CdsAux.Free;
  end;
end;

procedure TRptReciboPagamentoFuncef.ppGroupHeaderBand10BeforePrint(
  Sender: TObject);
begin
  inherited;
  if CdsReciboPagamento.FieldByName('TIPOCONTRATO').asString <> 'A' then
  begin
    lblReciboPagamentoC_CUSTO.Caption :=  'Unidade da Lotação';
    lblReciboPagamentoC_CUSTO2.Caption :=  'Unidade da Lotação';
    lblReciboPagamentoAgencia.Caption :=  'Cod. Agência';
    lblReciboPagamentoCARGO.Caption :=  'Cargo';
    lblReciboPagamentoSFAM.Visible := true;
    dbtxtReciboPagamentoSFAM.Visible := true;
    lblReciboPagamentoSAL_BASE.Caption :=  'Salário';
    lblReciboPagamentoSAL_BASE2.Caption :=  'Base';
    lblReciboPagamentoSAL_PART1.Caption :=  'Salário.Contr.';
    lblReciboPagamentoSAL_PART2.Caption :=  'Previd. Privada';
    lblReciboPagamentoBASE_IRRF.Caption :=  'Salário Base';
    lblReciboPagamentoFGTS_MES.Visible := true;
    lblReciboPagamentoFGTS_MES2.Visible := true;
    dbtxtReciboPagamentoFGTS_MES.Visible := true;
    lblReciboPagamentoMARGEM1.Visible := true;
    lblReciboPagamentoMARGEM12.Visible := true;
    lblReciboPagamentoMARGEM2.Visible := true;
    lblReciboPagamentoMARGEM22.Visible := true;
    dbtxtReciboPagamentoMARGEM1.Visible := true;
    dbtxtReciboPagamentoMARGEM2.Visible := true;
    lblReciboPagamentoCODCUSTO.Visible := true;
    dbtxtReciboPagamentoCODCUSTO.Visible := true;
  end
  else
  begin
    lblReciboPagamentoC_CUSTO.Caption := 'Natureza do Serviço';
    lblReciboPagamentoC_CUSTO2.Caption :=  'Natureza do Serviço';
    lblReciboPagamentoAgencia.Caption :=  'Banco/Agência';
    lblReciboPagamentoCARGO.Caption :=  'Nº de Inscrição no INSS                 CPF';
    lblReciboPagamentoSFAM.Visible := false;
    dbtxtReciboPagamentoSFAM.Visible := false;
    lblReciboPagamentoSAL_BASE.Caption :=  'Remuneração';
    lblReciboPagamentoSAL_BASE2.Caption :=  '';
    lblReciboPagamentoSAL_PART1.Caption :=  'Base de Cálculo';
    lblReciboPagamentoSAL_PART2.Caption :=  'do ISS';
    lblReciboPagamentoBASE_IRRF.Caption :=  'Base de Cálculo';
    lblReciboPagamentoFGTS_MES.Visible := false;
    lblReciboPagamentoFGTS_MES2.Visible := false;
    dbtxtReciboPagamentoFGTS_MES.Visible := false;
    lblReciboPagamentoMARGEM1.Visible := false;
    lblReciboPagamentoMARGEM12.Visible := false;
    lblReciboPagamentoMARGEM2.Visible := false;
    lblReciboPagamentoMARGEM22.Visible := false;
    dbtxtReciboPagamentoMARGEM1.Visible := false;
    dbtxtReciboPagamentoMARGEM2.Visible := false;
    lblReciboPagamentoCODCUSTO.Visible := false;
    dbtxtReciboPagamentoCODCUSTO.Visible := false;
  end;
end;

end.
