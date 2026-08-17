// *****************************************************************************
// ***************************** REGISTRO DE ALTERAÇÕES ************************
// *****************************************************************************
// Autor(a)    :  Ádler Teodoro de Souza
// Data        :  19/02/2009
// Pendência   : SOL 109421 KINTANA 496332
// Descricao   :  Alteração de gravação de arquivos de log na raiz do disco C: .
//------------------------------------------------------------------------------
unit RResFol;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs, FCmReport,
  uCmRptManager, TXComp, CmParamReport, Db, ppDB, ppDBPipe, ppDBBDE, ppCtrls, ppBands,
  ppClass, ppVar, ppPrnabl, ppCache, ppComm, ppRelatv, ppProd, ppReport, DBClient,
  uCMClientDataSet, uCmSqlParams, uCtrlPadroes, uCtrlListTerceirosRH, TXRB, USistema;

type
  TRptResFol = class(TFrmCmReport)
    rpResFol: TppReport;
    ResFolppHeaderBand5: TppHeaderBand;
    ResFolppLabel3: TppLabel;
    ResFolrpLabel1: TppLabel;
    ResFolrpLabel2: TppLabel;
    ResFolrpLabel3: TppLabel;
    ResFolrpLabel4: TppLabel;
    ResFolrpLabel6: TppLabel;
    ResFolrpLabel7: TppLabel;
    rpResFolLine2: TppLine;
    rpResFolLabelTipoPag: TppLabel;
    rpResFolDBText3: TppDBText;
    rpResFolDBText4: TppDBText;
    rpResFolDBText5: TppDBText;
    rpResFolDBText6: TppDBText;
    rpGerencialChildReport1Label4: TppLabel;
    rpGerencialChildReport1DBText4: TppDBText;
    rpResFolLabel7: TppLabel;
    rpResFolDBText7: TppDBText;
    rpResFolLabel12: TppLabel;
    ResFolrpCalc1: TppSystemVariable;
    ResFolrpCalc2: TppSystemVariable;
    rpResFolDBTxtMES_REF_INI: TppDBText;
    rpResFolDBTxtMES_REF_FIN: TppDBText;
    rpResFolLblPROCESSO: TppLabel;
    ResFolppDetailBand15: TppDetailBand;
    ResFolrpDBText1: TppDBText;
    ResFoldpDBtxtVALOR: TppDBText;
    rpResFolDBText2: TppDBText;
    rpResFolDBText9: TppDBText;
    ResFolppFooterBand3: TppFooterBand;
    ResFolrpSummaryBand1: TppSummaryBand;
    rpResFolGroup1: TppGroup;
    rpResFolGroupHeaderBand1: TppGroupHeaderBand;
    rpResFolGroupFooterBand1: TppGroupFooterBand;
    ResFolrpShape1: TppShape;
    ResFolrpShape2: TppShape;
    ResFolrpShape3: TppShape;
    ResFolrpShape4: TppShape;
    ResFolrpLabel10: TppLabel;
    ResFolrpLabel11: TppLabel;
    ResFolrpLabel12: TppLabel;
    ResFolrpLabel13: TppLabel;
    ResFolrpLabel14: TppLabel;
    rpResFolLabel8: TppLabel;
    rpResFolLabel9: TppLabel;
    rpResFolLine1: TppLine;
    rpResFolLabel10: TppLabel;
    rpResFolLine5: TppLine;
    rpResFolDBCalcTotalProventos: TppDBCalc;
    rpResFolDBCalcTotalDescontos: TppDBCalc;
    rpResFolDBCalcTotal: TppDBCalc;
    ResFolppGroup3: TppGroup;
    ResFolppGroupHeaderBandCENTROCUSTO: TppGroupHeaderBand;
    rpResFolLabelNomeGrupo: TppLabel;
    rpResFolDBTextNOMEGRUPO: TppDBText;
    rpResFolLabel4: TppLabel;
    rpResFolLabel5: TppLabel;
    rpResFolLine4: TppLine;
    rpResFolLabel6: TppLabel;
    rpResFolLabel11: TppLabel;
    ResFolppGroupFooterBand3: TppGroupFooterBand;
    ResFolrpLabel5: TppLabel;
    ResFolrpLabel8: TppLabel;
    ResFolrpResfolLine3: TppLine;
    ResFolrpLabel9: TppLabel;
    rpResFolDBCalcSubTotalProventos: TppDBCalc;
    rpResFolDBCalcSubTotalDescontos: TppDBCalc;
    rpResFolDBCalcSubTotal: TppDBCalc;
    ResFolppGroup4: TppGroup;
    ResFolppGroupHeaderBand4: TppGroupHeaderBand;
    rpResFolDBText1: TppDBText;
    ResFolppGroupFooterBand4: TppGroupFooterBand;
    ResFolrpResfolLine2: TppLine;
    ResFolrplbTotProvDesc: TppLabel;
    rpResFolDBCalc1: TppDBCalc;
    rpResFolLine3: TppLine;
    ppResFol: TppBDEPipeline;
    dsResFol: TDataSource;
    sqlResFol: TCMSqlParams;
    CdsResFol: TCMClientDataSet;
    CdsAux: TCMClientDataSet;
    procedure CrmRptCMBeforePrint(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure FormDestroy(Sender: TObject);
    procedure CdsResFolAfterOpen(DataSet: TDataSet);
    procedure CdsResFolAfterScroll(DataSet: TDataSet);
    procedure ResFolrpSummaryBand1AfterPrint(Sender: TObject);
    procedure rpResFolBeforePrint(Sender: TObject);
    procedure ResFolppGroupHeaderBand4BeforePrint(Sender: TObject);
    procedure ResFolppGroupFooterBand4BeforePrint(Sender: TObject);
  private
    CtrlListTerceirosRH: TCtrlListTerceirosRH;

    byNumCarMascCCSint: byte;
    iQtdeFunc: integer;
    lstCodCCusto, lstNomeCCusto, lstNumFunc, lstRubProcess: TStringList;
    sListaIdRubricaSel, sCodCCAtual, sCodCCSintAtual, sCodRub: string;

    procedure NumCaracCCSintetico;
    procedure GeraListaCodCCusto;
    procedure GeraNumFuncCCusto;
    procedure AgrupaCCustoSintetico;
  end;

var
  RptResFol: TRptResFol;

implementation

uses uModulo, uCtrlFuncoesRH, dCds, fAguarde, uCtrlUsoGeralRH;

{$R *.DFM}

procedure TRptResFol.FormCreate(Sender: TObject);
begin
  inherited;
  CtrlListTerceirosRH := TCtrlListTerceirosRH.Create(CtrlUsoGeralRH.UsuXFilial,
    CtrlUsoGeralRH.UsuXCCusto, CtrlUsoGeralRH.IdUsuarioGeral);
  CtrlListTerceirosRH.InitializeAs(Padroes);
end;

procedure TRptResFol.FormDestroy(Sender: TObject);
begin
  FreeAndNil(CtrlListTerceirosRH);
  inherited;
end;

procedure TRptResFol.CrmRptCMBeforePrint(Sender: TObject);
var
  sPeriodoIni, sPeriodoFin: string;
  iMes, iAno: integer;
begin
  inherited;
  sPeriodoIni := QuotedStr(CmpRptCM.ParamByName('AnoInicial').asString +'/'+
    FU.PoeZero(CmpRptCM.ParamByName('MesInicial').asInteger));
  sPeriodoFin := QuotedStr(CmpRptCM.ParamByName('AnoFinal').asString +'/'+
    FU.PoeZero(CmpRptCM.ParamByName('MesFinal').asInteger));

  iMes := CmpRptCM.ParamByName('MesInicial').asInteger;
  iAno := CmpRptCM.ParamByName('AnoInicial').asInteger;

  with (dmCds.sql.SQL) do
  begin
    if (CmpRptCM.ParamByName('BuscaHist').asBoolean) then
    begin // busca ESTAB e CCUSTO no histórico
      Clear;
      Add('SELECT DISTINCT');
      Add('  PJ.RAZAOSOCIAL AS EMPRESA,');
      Add('  DECODE(PJ.NUMDOCUMENTO,NULL,NULL, ''CNPJ: '' || PJ.NUMDOCUMENTO) AS CGCCPF,');
      Add('  RTRIM(DECODE(RTRIM(ESTADUAL.NUMDOCUMENTO),NULL,');
      Add('    DECODE(RTRIM(MUNICIPAL.NUMDOCUMENTO),NULL,NULL,');
      Add('    ''Inscrição Municipal: '' || MUNICIPAL.NUMDOCUMENTO),');
      Add('    ''Inscrição Estadual: '' || ESTADUAL.NUMDOCUMENTO)) AS ESTADUALMUNICIPAL,');
      Add('  RTRIM(E.LOGRADOURO) ||'', ''|| E.NUMERO || DECODE(E.COMPLEMENTO,NULL,NULL,'' - '' ||');
      Add('    RTRIM(E.COMPLEMENTO)) ||'' - ''|| RTRIM(E.BAIRRO) ||'' - ''|| RTRIM(CIDADES.NOME) ||');
      Add('    '' - CEP:'' || RTRIM(SUBSTR(E.CEP,1,5)) ||''-''|| RTRIM(SUBSTR(E.CEP,6,3)) AS ENDERECO,');
      Add('  ES.CODESTADO AS UF,');
      Add('  DECODE(P.FLGDESCONTO,0,''PROVENTOS'',1,''DESCONTOS'',''OUTROS'') AS PROVENTODESCONTO,');
      Add('  P.FLGDESCONTO AS TIPOPROVDESC,');
      Add('  RTRIM(RP.DESCRPROVDESC) AS RUBRICA,');
      Add('  RTRIM(RP.CODPROVDESC) AS CODRUBRICA,');
      Add('  (' +QuotedStr(FU.MesExtensoAno(CmpRptCM.ParamByName('AnoInicial').asString +'/'+
        FU.PoeZero(CmpRptCM.ParamByName('MesInicial').asInteger))) +') AS MES_REF_INI,');

      if (CmpRptCM.ParamByName('SelIntervalo').asBoolean) and (sPeriodoIni <> sPeriodoFin) then
        Add('  (' +QuotedStr(' a '+ CmpRptCM.ParamByName('AnoFinal').asString +'/'+
          FU.PoeZero(CmpRptCM.ParamByName('MesFinal').asInteger)) +') AS MES_REF_FIN,')
      else
        Add('  ('' '') AS MES_REF_FIN,');

      if (CmpRptCM.ParamByName('AgruparPor').asInteger = 2) then
        Add('  CC.CODCENTROCUSTO,');

      if (CmpRptCM.ParamByName('AgruparPor').asInteger in [1,2]) then
        Add('  CC.NOME AS NOMEGRUPO,');

      if (CmpRptCM.ParamByName('AgruparPor').asInteger = 3) then
        Add('  PR.DESCPROGRAMA AS NOMEGRUPO,');

      Add('  QTDE_FUNC.QTDE AS QTDE_FUNCIONARIOS,');
      Add('  DECODE(P.FLGDESCONTO,0,HIST.VALOR,0) AS VALORPROVENTO,');
      Add('  DECODE(P.FLGDESCONTO,1,HIST.VALOR,0) AS VALORDESCONTO,');
      Add('  HIST.VALOR,');
      Add('  DECODE(P.FLGDESCONTO,0,HIST.VALOR,1,-HIST.VALOR,0) AS VALORREAL,');
      Add('  HIST.QTDE_FUNC_RUB');
      // ------------------------------------------------------------------ //
      Add('FROM');
      Add(' PESSOA PJ, ENDPESS E, RUBRICAXPESS RP, PROVDESC P,');
      Add('  CIDADES, ESTADO ES,'+
        FU.IFF((CmpRptCM.ParamByName('AgruparPor').asInteger <> 0),' CENTCUST CC,','')+
        FU.IFF((CmpRptCM.ParamByName('AgruparPor').asInteger  = 3),' PROGRAMA PR,',''));
      // ------------------------------------------------------------------ //
      // Total de funcionários que compuseram  a Folha
      if (CmpRptCM.ParamByName('AgruparPor').asInteger <> 0) then // Agrupando por Centro de Custo
      begin
        Add('  (SELECT FP.IDFILIALPESSOA, '+
          FU.IFF((CmpRptCM.ParamByName('AgruparPor').asInteger  = 3),'CC.IDPROGRAMA, ','CC.CODCENTROCUSTO, ')+
          'COUNT(PESSOAS.IDPESSOA) QTDE');
        Add('   FROM   CENTCUST CC, FILIALPESSOA FP,');
        // Pessoas para o período
        Add('     (SELECT  DISTINCT F.IDPESSOA,');
        Add('      DECODE(HST.IDESTAB,NULL,F.IDESTAB,HST.IDESTAB) AS IDESTAB,');
        Add('      DECODE(HST.CODCENTROCUSTO,NULL,F.CODCENTROCUSTO,HST.CODCENTROCUSTO) AS CODCENTROCUSTO');
        Add('      FROM   ' +CmpRptCM.ParamByName('NomeTabela').asString+ ' H, FUNCIONARIO F,');
        // Última evolução Funcional do Funcionário
        // --------------------------------------------------------------------------------------
        Add('  (SELECT EVOL.IDESTAB, EVOL.IDPESSOA, EVOL.IDEMPRESA, EVOL.CODCENTROCUSTO');
        Add('    FROM   EVOLFUNC EVOL,');
        Add('          (SELECT MAX(DATAALTERFUNC) AS DATAALTERFUNC, IDPESSOA');
        Add('           FROM   EVOLFUNC');
        Add('           WHERE');
        Add('            (DATAALTERFUNC <= TO_DATE('+
          QuotedStr(IntToStr(FU.TrazUltDiaMes(iMes, iAno)) +'/'+ FU.PoeZero(iMes) +'/'+ IntToStr(iAno))+
          ',''DD/MM/YYYY''))');
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
        Add('           (EVOL.IDPESSOA      = HST3.IDPESSOA)) HST');
        // ------------------------------------------------------------------------------- //
        Add('      WHERE');
        // Estabelecimento selecionado
        if (CmpRptCM.ParamByName('IdEstab').asString <> '') then
          Add('        (DECODE(HST.IDESTAB,NULL,F.IDESTAB,HST.IDESTAB) = ' +CmpRptCM.ParamByName('IdEstab').asString+ ') AND')
        else
        begin
          // Estabelecimento(s) habilitados para o usuário
          if (CtrlUsoGeralRH.UsuXFilial <> '') then
            if (Pos(',',CtrlUsoGeralRH.UsuXFilial) > 0) then
              Add('        (DECODE(HST.IDESTAB,NULL,F.IDESTAB,HST.IDESTAB) IN ' +CtrlUsoGeralRH.UsuXFilial+ ') AND')
            else
              Add('        (DECODE(HST.IDESTAB,NULL,F.IDESTAB,HST.IDESTAB) = ' +CtrlUsoGeralRH.UsuXFilial+ ') AND');
        end;

        // C. Custo(s) selecionado(s)
        if (CmpRptCM.ParamByName('ListaCodCCusto').asString <> '') then
        begin
          if (Pos(',', CmpRptCM.ParamByName('ListaCodCCusto').asString) > 0) then
            Add('        (TRIM(DECODE(HST.CODCENTROCUSTO,NULL,F.CODCENTROCUSTO,HST.CODCENTROCUSTO)) IN (' +CmpRptCM.ParamByName('ListaCodCCusto').asString+ ')) AND')
          else
            Add('        (TRIM(DECODE(HST.CODCENTROCUSTO,NULL,F.CODCENTROCUSTO,HST.CODCENTROCUSTO)) = ' +CmpRptCM.ParamByName('ListaCodCCusto').asString+ ') AND');
        end
        else
        begin
          // C. de Custo(s) habilitados para o usuário
          if (CtrlUsoGeralRH.UsuXCCusto <> '') then
            if (Pos(',',CtrlUsoGeralRH.UsuXCCusto) > 0) then
              Add('    (TRIM(DECODE(HST.CODCENTROCUSTO,NULL,F.CODCENTROCUSTO,HST.CODCENTROCUSTO)) IN ' +CtrlUsoGeralRH.UsuXCCusto+ ') AND')
            else
              Add('    (TRIM(DECODE(HST.CODCENTROCUSTO,NULL,F.CODCENTROCUSTO,HST.CODCENTROCUSTO)) = ' +CtrlUsoGeralRH.UsuXCCusto+ ') AND');
        end;

        // Rubrica(s) selecionada(s)
        if (sListaIdRubricaSel <> '') then
          if (Pos(',',CmpRptCM.ParamByName('ListaIdRubrica').asString) > 0) then
            Add('        (H.CODPROVDESC    IN (' +CmpRptCM.ParamByName('ListaIdRubrica').asString+ ')) AND')
          else
            Add('        (H.CODPROVDESC     = ' +CmpRptCM.ParamByName('ListaIdRubrica').asString+ ') AND');

        Add('        (DECODE(HST.IDEMPRESA,NULL,F.IDEMPRESA,HST.IDEMPRESA) = ' +CmpRptCM.ParamByName('IdEmpresa').asString+ ') AND');
        Add('        (H.IDPESSJUR  = ' +CmpRptCM.ParamByName('IdEmpresa').asString+ ') AND');

        if (CmpRptCM.ParamByName('SelIntervalo').asBoolean) and (sPeriodoIni <> sPeriodoFin) then
          Add('        (H.MES  BETWEEN ' +sPeriodoIni+ ' AND ' +sPeriodoFin+ ') AND')
        else
          Add('        (H.MES        = ' +sPeriodoIni+ ') AND');

        if (CmpRptCM.ParamByName('ListaIdTipoFolha').asString <> '') then
          if (Pos(',', CmpRptCM.ParamByName('ListaIdTipoFolha').asString) > 0) then
            Add('        (H.IDMOTIVO  IN (' +CmpRptCM.ParamByName('ListaIdTipoFolha').asString+ ')) AND')
          else
            Add('        (H.IDMOTIVO   = ' +CmpRptCM.ParamByName('ListaIdTipoFolha').asString+ ') AND');

        Add('        (F.IDPESSOA   = H.IDPESSOA) AND');
        Add(FU.MontaLinhaSelSQL('  (F.TIPOCONTRATO',CmpRptCM.ParamByName('TipoContrato').asString,3));
        Add('        (F.IDPESSOA   = HST.IDPESSOA(+))) PESSOAS');
        Add('   WHERE');

        // C. Custo(s) selecionado(s)
        if (CmpRptCM.ParamByName('ListaCodCCusto').asString <> '') then
        begin
          if (Pos(',', CmpRptCM.ParamByName('ListaCodCCusto').asString) > 0) then
            Add('     (TRIM(CC.CODCENTROCUSTO) IN (' +CmpRptCM.ParamByName('ListaCodCCusto').asString+ ')) AND')
          else
            Add('     (TRIM(CC.CODCENTROCUSTO) = ' +CmpRptCM.ParamByName('ListaCodCCusto').asString+ ') AND');
        end
        else
        begin
          // C. de Custo(s) habilitados para o usuário
          if (CtrlUsoGeralRH.UsuXCCusto <> '') then
            if (Pos(',',CtrlUsoGeralRH.UsuXCCusto) > 0) then
              Add('     (TRIM(CC.CODCENTROCUSTO) IN ' +CtrlUsoGeralRH.UsuXCCusto+ ') AND')
            else
              Add('     (TRIM(CC.CODCENTROCUSTO)  = ' +CtrlUsoGeralRH.UsuXCCusto+ ') AND');
        end;

        Add('     (CC.IDEMPRESA           = '+CmpRptCM.ParamByName('IdEmpresa').asString+') AND');
        Add('     (PESSOAS.IDESTAB        = FP.IDFILIALPESSOA) AND');
        Add('     (PESSOAS.CODCENTROCUSTO = CC.CODCENTROCUSTO)');
        Add('   GROUP BY');
        Add('     ' +FU.IFF((CmpRptCM.ParamByName('AgruparPor').asInteger  = 3),'CC.IDPROGRAMA, ','CC.CODCENTROCUSTO, ')+
            'FP.IDFILIALPESSOA) QTDE_FUNC,');
      end
      else // Não Agrupando por Centro de Custo
      begin
        Add('  (SELECT FP.IDFILIALPESSOA, COUNT(PESSOAS.IDPESSOA) QTDE');
        Add('   FROM   FILIALPESSOA FP,');
        // Pessoas para o período
        Add('     (SELECT DISTINCT F.IDPESSOA,');
        Add('      DECODE(HST.IDESTAB,NULL,F.IDESTAB,HST.IDESTAB) AS IDESTAB,');
        Add('      DECODE(HST.CODCENTROCUSTO,NULL,F.CODCENTROCUSTO,HST.CODCENTROCUSTO) AS CODCENTROCUSTO');
        Add('      FROM   ' +CmpRptCM.ParamByName('NomeTabela').asString+ ' H, FUNCIONARIO F,');
        // Última evolução Funcional do Funcionário
        // --------------------------------------------------------------------------------------
        Add('  (SELECT EVOL.IDESTAB, EVOL.IDPESSOA, EVOL.IDEMPRESA, EVOL.CODCENTROCUSTO');
        Add('    FROM   EVOLFUNC EVOL,');
        Add('          (SELECT MAX(DATAALTERFUNC) AS DATAALTERFUNC, IDPESSOA');
        Add('           FROM   EVOLFUNC');
        Add('           WHERE');
        Add('            (DATAALTERFUNC <= TO_DATE('+
          QuotedStr(IntToStr(FU.TrazUltDiaMes(iMes, iAno)) +'/'+ FU.PoeZero(iMes) +'/'+ IntToStr(iAno))+
          ',''DD/MM/YYYY''))');
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
        Add('           (EVOL.IDPESSOA      = HST3.IDPESSOA)) HST');
        // ------------------------------------------------------------------------------- //

        Add('      WHERE');

        // Estabelecimento selecionado
        if (CmpRptCM.ParamByName('IdEstab').asString <> '') then
          Add('        (DECODE(HST.IDESTAB,NULL,F.IDESTAB,HST.IDESTAB) = ' +CmpRptCM.ParamByName('IdEstab').asString+ ') AND')
        else
        begin
          // Estabelecimento(s) habilitados para o usuário
          if (CtrlUsoGeralRH.UsuXFilial <> '') then
            if (Pos(',',CtrlUsoGeralRH.UsuXFilial) > 0) then
              Add('        (DECODE(HST.IDESTAB,NULL,F.IDESTAB,HST.IDESTAB) IN ' +CtrlUsoGeralRH.UsuXFilial+ ') AND')
            else
              Add('        (DECODE(HST.IDESTAB,NULL,F.IDESTAB,HST.IDESTAB) = ' +CtrlUsoGeralRH.UsuXFilial+ ') AND');
        end;

        // C. Custo(s) selecionado(s)
        if (CmpRptCM.ParamByName('ListaCodCCusto').asString <> '') then
        begin
          if (Pos(',', CmpRptCM.ParamByName('ListaCodCCusto').asString) > 0) then
            Add('        (TRIM(DECODE(HST.CODCENTROCUSTO,NULL,F.CODCENTROCUSTO,HST.CODCENTROCUSTO)) IN (' +CmpRptCM.ParamByName('ListaCodCCusto').asString+ ')) AND')
          else
            Add('        (TRIM(DECODE(HST.CODCENTROCUSTO,NULL,F.CODCENTROCUSTO,HST.CODCENTROCUSTO)) = ' +CmpRptCM.ParamByName('ListaCodCCusto').asString+ ') AND');
        end
        else
        begin
          // C. de Custo(s) habilitados para o usuário
          if (CtrlUsoGeralRH.UsuXCCusto <> '') then
            if (Pos(',',CtrlUsoGeralRH.UsuXCCusto) > 0) then
              Add('    (TRIM(DECODE(HST.CODCENTROCUSTO,NULL,F.CODCENTROCUSTO,HST.CODCENTROCUSTO)) IN ' +CtrlUsoGeralRH.UsuXCCusto+ ') AND')
            else
              Add('    (TRIM(DECODE(HST.CODCENTROCUSTO,NULL,F.CODCENTROCUSTO,HST.CODCENTROCUSTO)) = ' +CtrlUsoGeralRH.UsuXCCusto+ ') AND');
        end;

        // Rubrica(s) selecionada(s)
        if (CmpRptCM.ParamByName('ListaIdRubrica').asString <> '') then
          if (Pos(',', CmpRptCM.ParamByName('ListaIdRubrica').asString) > 0) then
            Add('        (H.CODPROVDESC    IN (' +CmpRptCM.ParamByName('ListaIdRubrica').asString+ ')) AND')
          else
            Add('        (H.CODPROVDESC     = ' +CmpRptCM.ParamByName('ListaIdRubrica').asString+ ') AND');

        Add('        (DECODE(HST.IDEMPRESA,NULL,F.IDEMPRESA,HST.IDEMPRESA) = ' +CmpRptCM.ParamByName('IdEmpresa').asString+ ') AND');
        Add('        (H.IDPESSJUR  = ' +CmpRptCM.ParamByName('IdEmpresa').asString+ ') AND');

        if (CmpRptCM.ParamByName('SelIntervalo').asBoolean) and (sPeriodoIni <> sPeriodoFin) then
          Add('        (H.MES  BETWEEN ' +sPeriodoIni+ ' AND ' +sPeriodoFin+ ') AND')
        else
          Add('        (H.MES        = ' +sPeriodoIni+ ') AND');

        if (CmpRptCM.ParamByName('ListaIdTipoFolha').asString <> '') then
          if (Pos(',', CmpRptCM.ParamByName('ListaIdTipoFolha').asString) > 0) then
            Add('        (H.IDMOTIVO  IN (' +CmpRptCM.ParamByName('ListaIdTipoFolha').asString+ ')) AND')
          else
            Add('        (H.IDMOTIVO   = ' +CmpRptCM.ParamByName('ListaIdTipoFolha').asString+ ') AND');

        Add('        (F.IDPESSOA   = H.IDPESSOA) AND');
        Add(FU.MontaLinhaSelSQL('  (F.TIPOCONTRATO',CmpRptCM.ParamByName('TipoContrato').asString,3));
        Add('        (F.IDPESSOA   = HST.IDPESSOA(+))) PESSOAS');

        Add('   WHERE');
        Add('     (FP.IDFILIALPESSOA = PESSOAS.IDESTAB)');
        Add('   GROUP BY');
        Add('     FP.IDFILIALPESSOA) QTDE_FUNC,');
      end;
      // ------------------------------------------------------------------ //
      // Rubricas da Folha
      Add('  (SELECT');
      Add('     '+FU.IFF(CmpRptCM.ParamByName('AgruparPor').asInteger in [1,2],
        'CC.CODCENTROCUSTO, ',
        FU.IFF(CmpRptCM.ParamByName('AgruparPor').asInteger = 3,'CC.IDPROGRAMA, ',''))+
        FU.IFF(CmpRptCM.ParamByName('AgruparPor').asInteger > 0,'CC.IDEMPRESA, ','')+
        'FP.IDFILIALPESSOA, COUNT(*) AS QTDE_FUNC_RUB, H.IDRUBRICA,');
      Add('     SUM(H.VALORPROVENTO) AS VALOR');
      Add('   FROM '+CmpRptCM.ParamByName('NomeTabela').asString+ ' H, RUBRICAXPESS RP,');
      Add('    FUNCIONARIO F, FILIALPESSOA FP' +
        FU.IFF(CmpRptCM.ParamByName('AgruparPor').asInteger <> 0,', CENTCUST CC',''));
      // Última evolução Funcional do Funcionário
      // --------------------------------------------------------------------------------------
      Add(' , (SELECT EVOL.IDESTAB, EVOL.IDPESSOA, EVOL.IDEMPRESA, EVOL.CODCENTROCUSTO');
      Add('    FROM   EVOLFUNC EVOL,');
      Add('          (SELECT MAX(DATAALTERFUNC) AS DATAALTERFUNC, IDPESSOA');
      Add('           FROM   EVOLFUNC');
      Add('           WHERE');
      Add('            (DATAALTERFUNC <= TO_DATE('+
        QuotedStr(IntToStr(FU.TrazUltDiaMes(iMes, iAno)) +'/'+ FU.PoeZero(iMes) +'/'+ IntToStr(iAno))+
        ',''DD/MM/YYYY''))');
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
      Add('           (EVOL.IDPESSOA      = HST3.IDPESSOA)) HST');
      // ------------------------------------------------------------------------------- //
      Add('   WHERE');

      // Estabelecimento selecionado
      if (CmpRptCM.ParamByName('IdEstab').asString <> '') then
        Add('     (DECODE(HST.IDESTAB,NULL,F.IDESTAB,HST.IDESTAB) = ' +CmpRptCM.ParamByName('IdEstab').asString+ ') AND')
      else
      begin
        // Estabelecimento(s) habilitados para o usuário
        if (CtrlUsoGeralRH.UsuXFilial <> '') then
          if (Pos(',',CtrlUsoGeralRH.UsuXFilial) > 0) then
            Add('     (DECODE(HST.IDESTAB,NULL,F.IDESTAB,HST.IDESTAB) IN ' +CtrlUsoGeralRH.UsuXFilial+ ') AND')
          else
            Add('     (DECODE(HST.IDESTAB,NULL,F.IDESTAB,HST.IDESTAB)  = ' +CtrlUsoGeralRH.UsuXFilial+ ') AND');
      end;

      // C. Custo(s) selecionado(s)
      if (CmpRptCM.ParamByName('ListaCodCCusto').asString <> '') then
      begin
        if (Pos(',', CmpRptCM.ParamByName('ListaCodCCusto').asString) > 0) then
          Add('     (TRIM(DECODE(HST.CODCENTROCUSTO,NULL,F.CODCENTROCUSTO,HST.CODCENTROCUSTO)) IN (' +CmpRptCM.ParamByName('ListaCodCCusto').asString+ ')) AND')
        else
          Add('     (TRIM(DECODE(HST.CODCENTROCUSTO,NULL,F.CODCENTROCUSTO,HST.CODCENTROCUSTO)) = ' +CmpRptCM.ParamByName('ListaCodCCusto').asString+ ') AND');
      end
      else
      begin
        // C. de Custo(s) habilitados para o usuário
        if (CtrlUsoGeralRH.UsuXCCusto <> '') then
          if (Pos(',', CtrlUsoGeralRH.UsuXCCusto) > 0) then
            Add('     (TRIM(DECODE(HST.CODCENTROCUSTO,NULL,F.CODCENTROCUSTO,HST.CODCENTROCUSTO)) IN ' +CtrlUsoGeralRH.UsuXCCusto+ ') AND')
          else
            Add('     (TRIM(DECODE(HST.CODCENTROCUSTO,NULL,F.CODCENTROCUSTO,HST.CODCENTROCUSTO)) = ' +CtrlUsoGeralRH.UsuXCCusto+ ') AND');
      end;

      // Rubrica(s) selecionada(s)
      if (CmpRptCM.ParamByName('ListaIdRubrica').asString <> '') then
        if (Pos(',', CmpRptCM.ParamByName('ListaIdRubrica').asString) > 0) then
          Add('     (H.CODPROVDESC IN (' +CmpRptCM.ParamByName('ListaIdRubrica').asString+ ')) AND')
        else
          Add('     (H.CODPROVDESC  = ' +CmpRptCM.ParamByName('ListaIdRubrica').asString+ ') AND');

      Add('     (DECODE(HST.IDEMPRESA,NULL,F.IDEMPRESA,HST.IDEMPRESA) = ' +CmpRptCM.ParamByName('IdEmpresa').asString+ ') AND');
      Add('     (RP.IDPESSOA  = ' +CmpRptCM.ParamByName('IdEmpresa').asString+ ') AND');
      Add('     (H.IDPESSJUR  = ' +CmpRptCM.ParamByName('IdEmpresa').asString+ ') AND');

      if (CmpRptCM.ParamByName('SelIntervalo').asBoolean) and (sPeriodoIni <> sPeriodoFin) then
        Add('     (H.MES  BETWEEN ' +sPeriodoIni+ ' AND ' +sPeriodoFin+ ') AND')
      else
        Add('     (H.MES        = ' +sPeriodoIni+ ') AND');

      if (CmpRptCM.ParamByName('ListaIdTipoFolha').asString <> '') then
        if (Pos(',',CmpRptCM.ParamByName('ListaIdTipoFolha').asString) > 0) then
          Add('     (H.IDMOTIVO  IN (' +CmpRptCM.ParamByName('ListaIdTipoFolha').asString+ ')) AND')
        else
          Add('     (H.IDMOTIVO   = ' +CmpRptCM.ParamByName('ListaIdTipoFolha').asString+ ') AND');

      Add('     (RP.IDRUBRICA = H.IDRUBRICA) AND');
      Add('     (H.IDPESSOA   = F.IDPESSOA)  AND');
      Add(FU.MontaLinhaSelSQL('  (F.TIPOCONTRATO',CmpRptCM.ParamByName('TipoContrato').asString,3));
      Add('     (DECODE(HST.IDESTAB,NULL,F.IDESTAB,HST.IDESTAB) = FP.IDFILIALPESSOA) AND');
      Add('     (F.IDPESSOA   = HST.IDPESSOA(+))');

      if (CmpRptCM.ParamByName('AgruparPor').asInteger <> 0) then
      begin
        Add('     AND (CC.IDEMPRESA     = '+CmpRptCM.ParamByName('IdEmpresa').asString+')');
        Add('     AND (DECODE(HST.CODCENTROCUSTO,NULL,F.CODCENTROCUSTO,HST.CODCENTROCUSTO) = CC.CODCENTROCUSTO)');
      end;

      Add('   GROUP BY');
      Add('     ' +FU.IFF(CmpRptCM.ParamByName('AgruparPor').asInteger in [1,2], 'CC.CODCENTROCUSTO, ',
        FU.IFF(CmpRptCM.ParamByName('AgruparPor').asInteger = 3,'CC.IDPROGRAMA, ',''))+
        FU.IFF(CmpRptCM.ParamByName('AgruparPor').asInteger > 0,'CC.IDEMPRESA, ','')+
        'H.IDRUBRICA, FP.IDFILIALPESSOA) HIST,');
      // --------------------------------------------------------------------------------- //
      // Inscrição Estadual
      Add('  (SELECT D.IDPESSOA, D.NUMDOCUMENTO');
      Add('   FROM   DOCPESSOA D, TIPODOCOFICIAL TD');
      Add('   WHERE (TD.SIGLADOCUMENTO = ''ESTADUAL:'') AND');
      Add('         (D.IDPESSOA        = ' +CmpRptCM.ParamByName('IdEstab').asString+ ') AND');
      Add('         (TD.IDDOCUMENTO    = D.IDDOCUMENTO)) ESTADUAL,');
      // -------------------------------------------------------------------------- //
      // Inscrição Municipal
      Add('  (SELECT D.IDPESSOA, D.NUMDOCUMENTO');
      Add('   FROM   DOCPESSOA D, TIPODOCOFICIAL TD');
      Add('   WHERE (TD.SIGLADOCUMENTO = ''MUNICIPAL:'') AND');
      Add('         (D.IDPESSOA        = ' +CmpRptCM.ParamByName('IdEstab').asString+ ') AND');
      Add('         (TD.IDDOCUMENTO    = D.IDDOCUMENTO)) MUNICIPAL');
      // ------------------------------------------------------------------ //
      Add('WHERE');

      // Estabelecimento selecionado
      if (CmpRptCM.ParamByName('IdEstab').asString <> '') then
      begin
        Add('  (PJ.IDPESSOA       = ' +CmpRptCM.ParamByName('IdEstab').asString+ ') AND');
      end
      else
      begin
        // Estabelecimento(s) habilitados para o usuário
        if (CtrlUsoGeralRH.UsuXFilial <> '') then
          if (Pos(',', CtrlUsoGeralRH.UsuXFilial) > 0) then
          begin
            Add('  (PJ.IDPESSOA      IN ' +CtrlUsoGeralRH.UsuXFilial+ ') AND');
          end
          else
          begin
            Add('  (PJ.IDPESSOA       = ' +CtrlUsoGeralRH.UsuXFilial+ ') AND');
          end;
      end;

      // Testa se o usuário quer somente PROVENTOS e DESCONTOS ou + OUTROS
      if (CmpRptCM.ParamByName('SelRubricaApoio').asBoolean) then
        Add('  (P.FLGDESCONTO     < 2) AND');

      if (CmpRptCM.ParamByName('AgruparPor').asInteger <> 0) then
      begin
        Add('  (CC.IDEMPRESA      = ' +CmpRptCM.ParamByName('IdEmpresa').asString+ ') AND');
        Add('  (CC.IDEMPRESA      = HIST.IDEMPRESA) AND');
        if (CmpRptCM.ParamByName('AgruparPor').asInteger <> 3) then
          Add('  (CC.CODCENTROCUSTO = HIST.CODCENTROCUSTO) AND')
        else
          Add('  (CC.IDPROGRAMA     = HIST.IDPROGRAMA) AND');
      end;

      Add('  (PJ.IDGRUPO        = ' +CmpRptCM.ParamByName('IdEmpresa').asString+ ') AND');
      Add('  (RP.IDPESSOA       = ' +CmpRptCM.ParamByName('IdEmpresa').asString+ ') AND');

      Add('  (PJ.IDPESSOA       = HIST.IDFILIALPESSOA)  AND');
      Add('  (RP.IDRUBRICA      = HIST.IDRUBRICA) AND');
      Add('  (P.IDPROVENTO      = HIST.IDRUBRICA) AND');
      Add('  (PJ.IDPESSOA       = QTDE_FUNC.IDFILIALPESSOA) AND');

      // Testa se está agrupando por Centro de Custo
      if (CmpRptCM.ParamByName('AgruparPor').asInteger <> 0) then
      begin
        if (CmpRptCM.ParamByName('AgruparPor').asInteger = 3) then
        begin
          Add('  (QTDE_FUNC.IDPROGRAMA = CC.IDPROGRAMA) AND');
          Add('  (CC.IDPROGRAMA        = PR.IDPROGRAMA) AND');
          Add('  (CC.IDPROGRAMA        = HIST.IDPROGRAMA) AND');
        end
        else
        begin
          Add('  (QTDE_FUNC.CODCENTROCUSTO = HIST.CODCENTROCUSTO) AND');
        end;
      end;

      Add('  (PJ.IDPESSOA       = E.IDPESSOA) AND');
      Add('  (PJ.IDENDCOMERCIAL = E.IDENDERECO) AND');
      Add('  (E.IDCIDADES       = CIDADES.IDCIDADES) AND');
      Add('  (CIDADES.IDESTADO  = ES.IDESTADO) AND');
      Add('  (HIST.IDRUBRICA    = RP.IDRUBRICA) AND');
      Add('  (HIST.IDRUBRICA    = P.IDPROVENTO) AND');
      Add('  (PJ.IDPESSOA       = ESTADUAL.IDPESSOA(+)) AND');
      Add('  (PJ.IDPESSOA       = MUNICIPAL.IDPESSOA(+))');
      Add('ORDER BY');
      case (CmpRptCM.ParamByName('AgruparPor').asInteger) of
        0   : Add('  TIPOPROVDESC, RUBRICA');
        1,3 : Add('  NOMEGRUPO, TIPOPROVDESC, RUBRICA');
        2   :
        begin
          // Máscara do C. de Custo Sintético
          NumCaracCCSintetico;
          Add('  SUBSTR(CODCENTROCUSTO,1,' +IntToStr(byNumCarMascCCSint)+ '), TIPOPROVDESC, '+
              'UPPER(RUBRICA)');
        end;
      end;
      //SaveToFile('c:\qry.txt');
      SaveToFile(Sistema.RetornaCaminhoArquivos(Sistema.IdEmpresa)+'\qry.txt');//Ádler Teodoro de Souza SOL 109421 KINTANA 496332
    end
    else
    begin // sem buscar ESTAB e CCUSTO no histórico
      Clear;
      // Modelo Padrão (Ex: Praia Clube)
      if (Modulo.IdContraCheque = 99) then
        Add('SELECT DISTINCT')
      else
        Add('SELECT /*+ OPTIMIZER_MODE RULE */ DISTINCT');
      Add('  PJ.RAZAOSOCIAL AS EMPRESA,');
      Add('  DECODE(PJ.NUMDOCUMENTO,NULL,NULL, ''CNPJ: '' || PJ.NUMDOCUMENTO) AS CGCCPF,');
      Add('  RTRIM(DECODE(RTRIM(ESTADUAL.NUMDOCUMENTO),NULL,');
      Add('    DECODE(RTRIM(MUNICIPAL.NUMDOCUMENTO),NULL,NULL,');
      Add('    ''Inscrição Municipal: '' || MUNICIPAL.NUMDOCUMENTO),');
      Add('    ''Inscrição Estadual: '' || ESTADUAL.NUMDOCUMENTO)) AS ESTADUALMUNICIPAL,');
      Add('  RTRIM(E.LOGRADOURO) ||'', ''|| E.NUMERO || DECODE(E.COMPLEMENTO,NULL,NULL,'' - '' ||');
      Add('    RTRIM(E.COMPLEMENTO)) ||'' - ''|| RTRIM(E.BAIRRO) ||'' - ''|| RTRIM(CIDADES.NOME) ||');
      Add('    '' - CEP:'' || RTRIM(SUBSTR(E.CEP,1,5)) ||''-''|| RTRIM(SUBSTR(E.CEP,6,3)) AS ENDERECO,');
      Add('  ES.CODESTADO AS UF,');
      Add('  DECODE(P.FLGDESCONTO,0,''PROVENTOS'',1,''DESCONTOS'',''OUTROS'') AS PROVENTODESCONTO,');
      Add('  P.FLGDESCONTO AS TIPOPROVDESC,');
      Add('  RTRIM(RP.DESCRPROVDESC) AS RUBRICA,');
      Add('  RTRIM(RP.CODPROVDESC) AS CODRUBRICA,');
      Add('  (' +QuotedStr(FU.MesExtensoAno(CmpRptCM.ParamByName('AnoInicial').asString +'/'+
        FU.PoeZero(CmpRptCM.ParamByName('MesInicial').asInteger))) +') AS MES_REF_INI,');

      if (CmpRptCM.ParamByName('SelIntervalo').asBoolean) and (sPeriodoIni <> sPeriodoFin) then
        Add('  (' +QuotedStr(' a '+ CmpRptCM.ParamByName('AnoFinal').asString +'/'+
          FU.PoeZero(CmpRptCM.ParamByName('MesFinal').asInteger)) +') AS MES_REF_FIN,')
      else
        Add('  ('' '') AS MES_REF_FIN,');

      if (CmpRptCM.ParamByName('AgruparPor').asInteger = 2) then
        Add('  CC.CODCENTROCUSTO,');

      if (CmpRptCM.ParamByName('AgruparPor').asInteger in [1,2]) then
        Add('  CC.NOME AS NOMEGRUPO,');

      if (CmpRptCM.ParamByName('AgruparPor').asInteger = 3) then
        Add('  PR.DESCPROGRAMA AS NOMEGRUPO,');

      Add('  QTDE_FUNC.QTDE AS QTDE_FUNCIONARIOS,');
      Add('  DECODE(P.FLGDESCONTO,0,HIST.VALOR,0) AS VALORPROVENTO,');
      Add('  DECODE(P.FLGDESCONTO,1,HIST.VALOR,0) AS VALORDESCONTO,');
      Add('  HIST.VALOR,');
      Add('  DECODE(P.FLGDESCONTO,0,HIST.VALOR,1,-HIST.VALOR,0) AS VALORREAL,');
      Add('  HIST.QTDE_FUNC_RUB');
      // ------------------------------------------------------------------ //
      Add('FROM');
      Add('  ' +CmpRptCM.ParamByName('NomeTabela').asString+ ' H, PESSOA PJ, ENDPESS E,'+
        ' RUBRICAXPESS RP, PROVDESC P,');
      Add('  FUNCIONARIO F, CIDADES, ESTADO ES,'+
        FU.IFF((CmpRptCM.ParamByName('AgruparPor').asInteger <> 0),' CENTCUST CC,','')+' MOTIVO MO,'+
        FU.IFF((CmpRptCM.ParamByName('AgruparPor').asInteger  = 3),' PROGRAMA PR,',''));
      // ------------------------------------------------------------------ //
      // Total de funcionários que compuseram  a Folha
      if (CmpRptCM.ParamByName('AgruparPor').asInteger <> 0) then // Agrupando por Centro de Custo
      begin
        Add('  (SELECT FP.IDFILIALPESSOA, '+
          FU.IFF((CmpRptCM.ParamByName('AgruparPor').asInteger  = 3),'CC.IDPROGRAMA, ','CC.CODCENTROCUSTO, ')+
          'COUNT(PESSOAS.IDPESSOA) QTDE');
        Add('   FROM   CENTCUST CC, FILIALPESSOA FP,');
        // Pessoas para o período
        Add('     (SELECT DISTINCT F.IDESTAB, F.IDPESSOA, F.CODCENTROCUSTO');
        Add('      FROM   ' +CmpRptCM.ParamByName('NomeTabela').asString+ ' H, FUNCIONARIO F');
        Add('      WHERE');
        // Estabelecimento selecionado
        if (CmpRptCM.ParamByName('IdEstab').asString <> '') then
          Add('        (F.IDESTAB    = ' +CmpRptCM.ParamByName('IdEstab').asString+ ') AND')
        else
        begin
          // Estabelecimento(s) habilitados para o usuário
          if (CtrlUsoGeralRH.UsuXFilial <> '') then
            if (Pos(',',CtrlUsoGeralRH.UsuXFilial) > 0) then
              Add('        (F.IDESTAB   IN ' +CtrlUsoGeralRH.UsuXFilial+ ') AND')
            else
              Add('        (F.IDESTAB    = ' +CtrlUsoGeralRH.UsuXFilial+ ') AND');
        end;

        // C. Custo(s) selecionado(s)
        if (CmpRptCM.ParamByName('ListaCodCCusto').asString <> '') then
        begin
          if (Pos(',', CmpRptCM.ParamByName('ListaCodCCusto').asString) > 0) then
            Add('        (TRIM(F.CODCENTROCUSTO) IN (' +CmpRptCM.ParamByName('ListaCodCCusto').asString+ ')) AND')
          else
            Add('        (TRIM(F.CODCENTROCUSTO)  = ' +CmpRptCM.ParamByName('ListaCodCCusto').asString+ ') AND');
        end
        else
        begin
          // C. de Custo(s) habilitados para o usuário
          if (CtrlUsoGeralRH.UsuXCCusto <> '') then
            if (Pos(',',CtrlUsoGeralRH.UsuXCCusto) > 0) then
              Add('        (TRIM(F.CODCENTROCUSTO) IN ' +CtrlUsoGeralRH.UsuXCCusto+ ') AND')
            else
              Add('        (TRIM(F.CODCENTROCUSTO)  = ' +CtrlUsoGeralRH.UsuXCCusto+ ') AND');
        end;

        // Rubrica(s) selecionada(s)
        if (sListaIdRubricaSel <> '') then
          if (Pos(',',CmpRptCM.ParamByName('ListaIdRubrica').asString) > 0) then
            Add('        (H.CODPROVDESC    IN (' +CmpRptCM.ParamByName('ListaIdRubrica').asString+ ')) AND')
          else
            Add('        (H.CODPROVDESC     = ' +CmpRptCM.ParamByName('ListaIdRubrica').asString+ ') AND');

        Add('        (F.IDEMPRESA  = ' +CmpRptCM.ParamByName('IdEmpresa').asString+ ') AND');
        Add('        (H.IDPESSJUR  = ' +CmpRptCM.ParamByName('IdEmpresa').asString+ ') AND');

        if (CmpRptCM.ParamByName('SelIntervalo').asBoolean) and (sPeriodoIni <> sPeriodoFin) then
          Add('        (H.MES  BETWEEN ' +sPeriodoIni+ ' AND ' +sPeriodoFin+ ') AND')
        else
          Add('        (H.MES        = ' +sPeriodoIni+ ') AND');

        if (CmpRptCM.ParamByName('ListaIdTipoFolha').asString <> '') then
          if (Pos(',', CmpRptCM.ParamByName('ListaIdTipoFolha').asString) > 0) then
            Add('        (H.IDMOTIVO  IN (' +CmpRptCM.ParamByName('ListaIdTipoFolha').asString+ ')) AND')
          else
            Add('        (H.IDMOTIVO   = ' +CmpRptCM.ParamByName('ListaIdTipoFolha').asString+ ') AND');

        Add(FU.MontaLinhaSelSQL('  (F.TIPOCONTRATO',CmpRptCM.ParamByName('TipoContrato').asString,3));
        Add('        (F.IDPESSOA   = H.IDPESSOA)) PESSOAS');
        Add('   WHERE');

        // C. Custo(s) selecionado(s)
        if (CmpRptCM.ParamByName('ListaCodCCusto').asString <> '') then
        begin
          if (Pos(',', CmpRptCM.ParamByName('ListaCodCCusto').asString) > 0) then
            Add('     (TRIM(CC.CODCENTROCUSTO) IN (' +CmpRptCM.ParamByName('ListaCodCCusto').asString+ ')) AND')
          else
            Add('     (TRIM(CC.CODCENTROCUSTO) = ' +CmpRptCM.ParamByName('ListaCodCCusto').asString+ ') AND');
        end
        else
        begin
          // C. de Custo(s) habilitados para o usuário
          if (CtrlUsoGeralRH.UsuXCCusto <> '') then
            if (Pos(',',CtrlUsoGeralRH.UsuXCCusto) > 0) then
              Add('     (TRIM(CC.CODCENTROCUSTO) IN ' +CtrlUsoGeralRH.UsuXCCusto+ ') AND')
            else
              Add('     (TRIM(CC.CODCENTROCUSTO)  = ' +CtrlUsoGeralRH.UsuXCCusto+ ') AND');
        end;

        Add('     (CC.IDEMPRESA           = '+CmpRptCM.ParamByName('IdEmpresa').asString+') AND');
        Add('     (PESSOAS.IDESTAB        = FP.IDFILIALPESSOA) AND');
        Add('     (PESSOAS.CODCENTROCUSTO = CC.CODCENTROCUSTO)');
        Add('   GROUP BY');
        Add('     ' +FU.IFF((CmpRptCM.ParamByName('AgruparPor').asInteger  = 3),'CC.IDPROGRAMA, ','CC.CODCENTROCUSTO, ')+
            'FP.IDFILIALPESSOA) QTDE_FUNC,');
      end
      else // Não Agrupando por Centro de Custo
      begin
        Add('  (SELECT FP.IDFILIALPESSOA, COUNT(PESSOAS.IDPESSOA) QTDE');
        Add('   FROM   FILIALPESSOA FP,');
        // Pessoas para o período
        Add('     (SELECT DISTINCT F.IDESTAB, F.IDPESSOA');
        Add('      FROM   ' +CmpRptCM.ParamByName('NomeTabela').asString+ ' H, FUNCIONARIO F');
        Add('      WHERE');

        // Estabelecimento selecionado
        if (CmpRptCM.ParamByName('IdEstab').asString <> '') then
          Add('        (F.IDESTAB    = ' +CmpRptCM.ParamByName('IdEstab').asString+ ') AND')
        else
        begin
          // Estabelecimento(s) habilitados para o usuário
          if (CtrlUsoGeralRH.UsuXFilial <> '') then
            if (Pos(',',CtrlUsoGeralRH.UsuXFilial) > 0) then
              Add('        (F.IDESTAB    IN ' +CtrlUsoGeralRH.UsuXFilial+ ') AND')
            else
              Add('        (F.IDESTAB     = ' +CtrlUsoGeralRH.UsuXFilial+ ') AND');
        end;

        // C. Custo(s) selecionado(s)
        if (CmpRptCM.ParamByName('ListaCodCCusto').asString <> '') then
        begin
          if (Pos(',', CmpRptCM.ParamByName('ListaCodCCusto').asString) > 0) then
            Add('        (TRIM(F.CODCENTROCUSTO) IN (' +CmpRptCM.ParamByName('ListaCodCCusto').asString+ ')) AND')
          else
            Add('        (TRIM(F.CODCENTROCUSTO)  = ' +CmpRptCM.ParamByName('ListaCodCCusto').asString+ ') AND');
        end
        else
        begin
          // C. de Custo(s) habilitados para o usuário
          if (CtrlUsoGeralRH.UsuXCCusto <> '') then
            if (Pos(',',CtrlUsoGeralRH.UsuXCCusto) > 0) then
              Add('        (TRIM(F.CODCENTROCUSTO) IN ' +CtrlUsoGeralRH.UsuXCCusto+ ') AND')
            else
              Add('        (TRIM(F.CODCENTROCUSTO)  = ' +CtrlUsoGeralRH.UsuXCCusto+ ') AND');
        end;

        // Rubrica(s) selecionada(s)
        if (CmpRptCM.ParamByName('ListaIdRubrica').asString <> '') then
          if (Pos(',', CmpRptCM.ParamByName('ListaIdRubrica').asString) > 0) then
            Add('        (H.CODPROVDESC    IN (' +CmpRptCM.ParamByName('ListaIdRubrica').asString+ ')) AND')
          else
            Add('        (H.CODPROVDESC     = ' +CmpRptCM.ParamByName('ListaIdRubrica').asString+ ') AND');

        Add('        (F.IDEMPRESA  = ' +CmpRptCM.ParamByName('IdEmpresa').asString+ ') AND');
        Add('        (H.IDPESSJUR  = ' +CmpRptCM.ParamByName('IdEmpresa').asString+ ') AND');

        if (CmpRptCM.ParamByName('SelIntervalo').asBoolean) and (sPeriodoIni <> sPeriodoFin) then
          Add('        (H.MES  BETWEEN ' +sPeriodoIni+ ' AND ' +sPeriodoFin+ ') AND')
        else
          Add('        (H.MES        = ' +sPeriodoIni+ ') AND');

        if (CmpRptCM.ParamByName('ListaIdTipoFolha').asString <> '') then
          if (Pos(',', CmpRptCM.ParamByName('ListaIdTipoFolha').asString) > 0) then
            Add('        (H.IDMOTIVO  IN (' +CmpRptCM.ParamByName('ListaIdTipoFolha').asString+ ')) AND')
          else
            Add('        (H.IDMOTIVO   = ' +CmpRptCM.ParamByName('ListaIdTipoFolha').asString+ ') AND');

        Add(FU.MontaLinhaSelSQL('  (F.TIPOCONTRATO',CmpRptCM.ParamByName('TipoContrato').asString,3));
        Add('        (F.IDPESSOA   = H.IDPESSOA)) PESSOAS');
        Add('   WHERE');
        Add('     (FP.IDFILIALPESSOA = PESSOAS.IDESTAB)');
        Add('   GROUP BY');
        Add('     FP.IDFILIALPESSOA) QTDE_FUNC,');
      end;
      // ------------------------------------------------------------------ //
      // Rubricas da Folha
      Add('  (SELECT');
      Add('     '+FU.IFF(CmpRptCM.ParamByName('AgruparPor').asInteger in [1,2],'F.CODCENTROCUSTO, ',
        FU.IFF(CmpRptCM.ParamByName('AgruparPor').asInteger = 3,'CC.IDPROGRAMA, ',''))+
        'F.IDESTAB AS IDPESSOA, COUNT(*) AS QTDE_FUNC_RUB, H.IDRUBRICA,');
      Add('     SUM(H.VALORPROVENTO) AS VALOR');
      Add('   FROM '+CmpRptCM.ParamByName('NomeTabela').asString+ ' H, RUBRICAXPESS RP, FUNCIONARIO F' +
        FU.IFF(CmpRptCM.ParamByName('AgruparPor').asInteger = 3,', CENTCUST CC',''));
      Add('   WHERE');

      // Estabelecimento selecionado
      if (CmpRptCM.ParamByName('IdEstab').asString <> '') then
        Add('     (F.IDESTAB    = ' +CmpRptCM.ParamByName('IdEstab').asString+ ') AND')
      else
      begin
        // Estabelecimento(s) habilitados para o usuário
        if (CtrlUsoGeralRH.UsuXFilial <> '') then
          if (Pos(',',CtrlUsoGeralRH.UsuXFilial) > 0) then
            Add('     (F.IDESTAB   IN ' +CtrlUsoGeralRH.UsuXFilial+ ') AND')
          else
            Add('     (F.IDESTAB    = ' +CtrlUsoGeralRH.UsuXFilial+ ') AND');
      end;

      // C. Custo(s) selecionado(s)
      if (CmpRptCM.ParamByName('ListaCodCCusto').asString <> '') then
      begin
        if (Pos(',', CmpRptCM.ParamByName('ListaCodCCusto').asString) > 0) then
          Add('     (TRIM(F.CODCENTROCUSTO) IN (' +CmpRptCM.ParamByName('ListaCodCCusto').asString+ ')) AND')
        else
          Add('     (TRIM(F.CODCENTROCUSTO)  = ' +CmpRptCM.ParamByName('ListaCodCCusto').asString+ ') AND');
      end
      else
      begin
        // C. de Custo(s) habilitados para o usuário
        if (CtrlUsoGeralRH.UsuXCCusto <> '') then
          if (Pos(',', CtrlUsoGeralRH.UsuXCCusto) > 0) then
            Add('     (TRIM(F.CODCENTROCUSTO) IN ' +CtrlUsoGeralRH.UsuXCCusto+ ') AND')
          else
            Add('     (TRIM(F.CODCENTROCUSTO)  = ' +CtrlUsoGeralRH.UsuXCCusto+ ') AND');
      end;

      // Rubrica(s) selecionada(s)
      if (CmpRptCM.ParamByName('ListaIdRubrica').asString <> '') then
        if (Pos(',', CmpRptCM.ParamByName('ListaIdRubrica').asString) > 0) then
          Add('     (H.CODPROVDESC IN (' +CmpRptCM.ParamByName('ListaIdRubrica').asString+ ')) AND')
        else
          Add('     (H.CODPROVDESC  = ' +CmpRptCM.ParamByName('ListaIdRubrica').asString+ ') AND');

      Add('     (F.IDEMPRESA  = ' +CmpRptCM.ParamByName('IdEmpresa').asString+ ') AND');
      Add('     (RP.IDPESSOA  = ' +CmpRptCM.ParamByName('IdEmpresa').asString+ ') AND');
      Add('     (H.IDPESSJUR  = ' +CmpRptCM.ParamByName('IdEmpresa').asString+ ') AND');

      if (CmpRptCM.ParamByName('SelIntervalo').asBoolean) and (sPeriodoIni <> sPeriodoFin) then
        Add('     (H.MES  BETWEEN ' +sPeriodoIni+ ' AND ' +sPeriodoFin+ ') AND')
      else
        Add('     (H.MES        = ' +sPeriodoIni+ ') AND');

      if (CmpRptCM.ParamByName('ListaIdTipoFolha').asString <> '') then
        if (Pos(',',CmpRptCM.ParamByName('ListaIdTipoFolha').asString) > 0) then
          Add('     (H.IDMOTIVO  IN (' +CmpRptCM.ParamByName('ListaIdTipoFolha').asString+ ')) AND')
        else
          Add('     (H.IDMOTIVO   = ' +CmpRptCM.ParamByName('ListaIdTipoFolha').asString+ ') AND');

      Add('     (RP.IDRUBRICA = H.IDRUBRICA) AND');
      Add(FU.MontaLinhaSelSQL('  (F.TIPOCONTRATO',CmpRptCM.ParamByName('TipoContrato').asString,3));
      Add('     (H.IDPESSOA   = F.IDPESSOA)');

      if (CmpRptCM.ParamByName('AgruparPor').asInteger = 3) then
      begin
        Add('     AND (CC.IDEMPRESA     = '+CmpRptCM.ParamByName('IdEmpresa').asString+')');
        Add('     AND (F.CODCENTROCUSTO = CC.CODCENTROCUSTO)');
      end;

      Add('   GROUP BY');
      Add('     ' +FU.IFF(CmpRptCM.ParamByName('AgruparPor').asInteger in [1,2], 'F.CODCENTROCUSTO, ',
        FU.IFF(CmpRptCM.ParamByName('AgruparPor').asInteger = 3,'CC.IDPROGRAMA, ',''))+
        'H.IDRUBRICA, F.IDESTAB) HIST,');
      // --------------------------------------------------------------------------------- //
      // Inscrição Estadual
      Add('  (SELECT D.IDPESSOA, D.NUMDOCUMENTO');
      Add('   FROM   DOCPESSOA D, TIPODOCOFICIAL TD');
      Add('   WHERE (TD.SIGLADOCUMENTO = ''ESTADUAL:'') AND');
      Add('         (D.IDPESSOA        = ' +CmpRptCM.ParamByName('IdEstab').asString+ ') AND');
      Add('         (TD.IDDOCUMENTO    = D.IDDOCUMENTO)) ESTADUAL,');
      // -------------------------------------------------------------------------- //
      // Inscrição Municipal
      Add('  (SELECT D.IDPESSOA, D.NUMDOCUMENTO');
      Add('   FROM   DOCPESSOA D, TIPODOCOFICIAL TD');
      Add('   WHERE (TD.SIGLADOCUMENTO = ''MUNICIPAL:'') AND');
      Add('         (D.IDPESSOA        = ' +CmpRptCM.ParamByName('IdEstab').asString+ ') AND');
      Add('         (TD.IDDOCUMENTO    = D.IDDOCUMENTO)) MUNICIPAL');
      // ------------------------------------------------------------------ //
      Add('WHERE');

      // Estabelecimento selecionado
      if (CmpRptCM.ParamByName('IdEstab').asString <> '') then
      begin
        Add('  (PJ.IDPESSOA       = ' +CmpRptCM.ParamByName('IdEstab').asString+ ') AND');
        Add('  (F.IDESTAB         = ' +CmpRptCM.ParamByName('IdEstab').asString+ ') AND');
      end
      else
      begin
        // Estabelecimento(s) habilitados para o usuário
        if (CtrlUsoGeralRH.UsuXFilial <> '') then
          if (Pos(',', CtrlUsoGeralRH.UsuXFilial) > 0) then
          begin
            Add('  (PJ.IDPESSOA      IN ' +CtrlUsoGeralRH.UsuXFilial+ ') AND');
            Add('  (F.IDESTAB        IN ' +CtrlUsoGeralRH.UsuXFilial+ ') AND');
          end
          else
          begin
            Add('  (PJ.IDPESSOA       = ' +CtrlUsoGeralRH.UsuXFilial+ ') AND');
            Add('  (F.IDESTAB         = ' +CtrlUsoGeralRH.UsuXFilial+ ') AND');
          end;
      end;

      // Testa se o usuário quer somente PROVENTOS e DESCONTOS ou + OUTROS
      if (CmpRptCM.ParamByName('SelRubricaApoio').asBoolean) then
        Add('  (P.FLGDESCONTO     < 2) AND');

      // C. de Custo selecionados
      if (CmpRptCM.ParamByName('ListaCodCCusto').asString <> '') then
        Add('  (F.CODCENTROCUSTO IN (' +CmpRptCM.ParamByName('ListaCodCCusto').asString+ ')) AND')
      else
      begin
        // C. de Custo(s) habilitados para o usuário
        if (CtrlUsoGeralRH.UsuXCCusto <> '') then
          if (Pos(',', CtrlUsoGeralRH.UsuXCCusto) > 0) then
            Add('  (TRIM(F.CODCENTROCUSTO) IN ' +CtrlUsoGeralRH.UsuXCCusto+ ') AND')
          else
            Add('  (TRIM(F.CODCENTROCUSTO) = ' +CtrlUsoGeralRH.UsuXCCusto+ ') AND');
      end;

      if (CmpRptCM.ParamByName('ListaIdTipoFolha').asString <> '') then
        if (Pos(',', CmpRptCM.ParamByName('ListaIdTipoFolha').asString) > 0) then
          Add('  (MO.IDMOTIVO      IN (' +CmpRptCM.ParamByName('ListaIdTipoFolha').asString+ ')) AND')
        else
          Add('  (MO.IDMOTIVO       = ' +CmpRptCM.ParamByName('ListaIdTipoFolha').asString+ ') AND');

      if (CmpRptCM.ParamByName('AgruparPor').asInteger <> 0) then
        Add('  (CC.IDEMPRESA      = ' +CmpRptCM.ParamByName('IdEmpresa').asString+ ') AND');

      Add('  (F.IDEMPRESA       = ' +CmpRptCM.ParamByName('IdEmpresa').asString+ ') AND');
      Add('  (RP.IDPESSOA       = ' +CmpRptCM.ParamByName('IdEmpresa').asString+ ') AND');

      if (CmpRptCM.ParamByName('SelIntervalo').asBoolean) and (sPeriodoIni <> sPeriodoFin) then
        Add('  (H.MES       BETWEEN ' +sPeriodoIni+ ' AND ' +sPeriodoFin+ ') AND')
      else
        Add('  (H.MES             = ' +sPeriodoIni+ ') AND');

      Add('  (H.IDPESSJUR       = ' +CmpRptCM.ParamByName('IdEmpresa').asString+ ') AND');
      Add('  (PJ.IDPESSOA       = HIST.IDPESSOA)  AND');
      Add('  (RP.IDRUBRICA      = HIST.IDRUBRICA) AND');
      Add('  (P.IDPROVENTO      = HIST.IDRUBRICA) AND');
      Add('  (PJ.IDPESSOA       = QTDE_FUNC.IDFILIALPESSOA) AND');

      // Testa se está agrupando por Centro de Custo
      if (CmpRptCM.ParamByName('AgruparPor').asInteger <> 0) then
      begin
        if (CmpRptCM.ParamByName('AgruparPor').asInteger = 3) then
        begin
          Add('  (QTDE_FUNC.IDPROGRAMA = CC.IDPROGRAMA) AND');
          Add('  (CC.IDPROGRAMA        = PR.IDPROGRAMA) AND');
          Add('  (CC.IDPROGRAMA        = HIST.IDPROGRAMA) AND');
        end
        else
        begin
          Add('  (QTDE_FUNC.CODCENTROCUSTO = F.CODCENTROCUSTO) AND');
          Add('  (F.CODCENTROCUSTO         = HIST.CODCENTROCUSTO) AND');
        end;

        Add('  (CC.CODCENTROCUSTO = F.CODCENTROCUSTO) AND');
      end;

      Add('  (PJ.IDPESSOA       = F.IDESTAB) AND');
      Add('  (PJ.IDPESSOA       = E.IDPESSOA) AND');
      Add('  (PJ.IDENDCOMERCIAL = E.IDENDERECO) AND');
      Add('  (E.IDCIDADES       = CIDADES.IDCIDADES) AND');
      Add('  (CIDADES.IDESTADO  = ES.IDESTADO) AND');
      Add('  (MO.IDMOTIVO       = H.IDMOTIVO) AND');
      Add('  (F.IDPESSOA        = H.IDPESSOA) AND');
      Add(FU.MontaLinhaSelSQL('  (F.TIPOCONTRATO',CmpRptCM.ParamByName('TipoContrato').asString,3));
      Add('  (H.IDRUBRICA       = RP.IDRUBRICA) AND');
      Add('  (H.IDRUBRICA       = P.IDPROVENTO) AND');
      Add('  (PJ.IDPESSOA       = ESTADUAL.IDPESSOA(+)) AND');
      Add('  (PJ.IDPESSOA       = MUNICIPAL.IDPESSOA(+))');
      Add('ORDER BY');
      case (CmpRptCM.ParamByName('AgruparPor').asInteger) of
        0   : Add('  TIPOPROVDESC, RUBRICA');
        1,3 : Add('  NOMEGRUPO, TIPOPROVDESC, RUBRICA');
        2   :
        begin
          // Máscara do C. de Custo Sintético
          NumCaracCCSintetico;
          Add('  SUBSTR(CODCENTROCUSTO,1,' +IntToStr(byNumCarMascCCSint)+ '), TIPOPROVDESC, '+
              'UPPER(RUBRICA)');
        end;
      end;
      //SaveToFile('c:\qry.txt');
      SaveToFile(Sistema.RetornaCaminhoArquivos(Sistema.IdEmpresa)+'\qry.txt');//Ádler Teodoro de Souza SOL 109421 KINTANA 496332

    end;
  end;

  dmCds.sql.Open;

  // Monta Query Principal
  CdsResFol.IndexName := '';
  if (CmpRptCM.ParamByName('AgruparPor').asInteger = 2) then
    AgrupaCCustoSintetico
  else
    CdsResFol.Data := dmCds.Cds.Data;

  // Rodapé de Autorizações é impresso ou não
  ResFolrpLabel10.Visible := CmpRptCM.ParamByName('ImprimeRodape').asBoolean;
  ResFolrpLabel11.Visible := ResFolrpLabel10.Visible;
  ResFolrpLabel12.Visible := ResFolrpLabel10.Visible;
  ResFolrpLabel13.Visible := ResFolrpLabel10.Visible;
  ResFolrpLabel14.Visible := ResFolrpLabel10.Visible;
  ResFolrpShape1.Visible := ResFolrpLabel10.Visible;
  ResFolrpShape2.Visible := ResFolrpLabel10.Visible;
  ResFolrpShape3.Visible := ResFolrpLabel10.Visible;
  ResFolrpShape4.Visible := ResFolrpLabel10.Visible;

  rpResFolLabelTipoPag.Caption := CmpRptCM.ParamByName('ListaNomeTipoFolha').asString;

  if (CmpRptCM.ParamByName('AgruparPor').asInteger = 0) then
  begin
    rpResFolLine4.Pen.Width := 2;
    ResFolppHeaderBand5.Height := 42.863;
    ResFolrpLabel4.Top := 38.1;
    ResFolrpLabel6.Top := 38.1;
    rpResFolLabel12.Top := 38.1;
    ResFolrpLabel7.Top := 38.1;
    rpResFolLine2.Top := 42.333;
  end
  else
  begin
    rpResFolLine4.Pen.Width := 1;
    ResFolppHeaderBand5.Height := 36.629;
  end;

  ResFolppGroupHeaderBandCENTROCUSTO.Visible := (CmpRptCM.ParamByName('AgruparPor').asInteger > 0);
  rpResFolLine5.Visible := (CmpRptCM.ParamByName('AgruparPor').asInteger > 0);
  ResFolrpResfolLine2.Visible := (CmpRptCM.ParamByName('AgruparPor').asInteger = 0);
  rpResFolLine3.Visible := ResFolrpResfolLine2.Visible;
  ResFolrpLabel4.Visible := ResFolrpResfolLine2.Visible;
  ResFolrpLabel6.Visible := ResFolrpResfolLine2.Visible;
  ResFolrpLabel7.Visible := ResFolrpResfolLine2.Visible;
  rpResFolLabel12.Visible := ResFolrpResfolLine2.Visible;

  rpResFolLblPROCESSO.Visible := CmpRptCM.ParamByName('ImprimeTipoProcesso').asBoolean;
  if (rpResFolLblPROCESSO.Visible) then
    if (CmpRptCM.ParamByName('NomeTabela').asString = 'PREVIAFOLPAG') then
      rpResFolLblPROCESSO.Caption := 'Processo: PRÉVIA'
    else
      rpResFolLblPROCESSO.Caption := 'Processo: FINAL';
end;

procedure TRptResFol.NumCaracCCSintetico;
var
  c: byte;
begin
  CdsAux.Data := CtrlListTerceirosRH.ListMarcaraCCustoSintetico(
  CmpRptCM.ParamByName('IdEmpresa').asInteger);

  c := 0;
  if not(CdsAux.IsEmpty) then
    repeat
      Inc(c);
    until (CdsAux.FieldByName('MASCARACC').asString[c+1] = '.');

  byNumCarMascCCSint := c;
end;

procedure TRptResFol.GeraListaCodCCusto;
var
  c: integer;
  lstCodCCustoAux, lstNomeCCustoAux: TStringList;
begin
  lstCodCCustoAux := TStringList.Create;
  lstNomeCCustoAux := TStringList.Create;

  repeat
    if (Length(CdsAux.FieldByName('CODCENTROCUSTO').asString) = byNumCarMascCCSint) then
    begin
      lstCodCCustoAux.Add(CdsAux.FieldByName('CODCENTROCUSTO').asString);
      lstNomeCCustoAux.Add(CdsAux.FieldByName('NOME').asString);
    end;
    CdsAux.Next;
  until (CdsAux.EOF);

  lstCodCCusto.Clear;
  lstNomeCCusto.Clear;
  for c:=0 to lstCodCCustoAux.Count-1 do
  begin
    // Pego o Dígito Identificador do C. de Custo Sintético atual
    sCodCCSintAtual := Copy(lstCodCCustoAux[c], 1, byNumCarMascCCSint);

    if (dmCds.Cds.Locate('CODCENTROCUSTO', sCodCCSintAtual, [loPartialKey])) then
    begin
      lstCodCCusto.Add(lstCodCCustoAux[c]);
      lstNomeCCusto.Add(lstNomeCCustoAux[c]);
    end;
  end;
  dmCds.Cds.First;

  lstCodCCustoAux.Free;
  lstNomeCCustoAux.Free;
end;

procedure TRptResFol.GeraNumFuncCCusto;
var
  c: byte;
  lstListaCC: TStringList;
begin
  lstListaCC := TStringList.Create;
  lstNumFunc.Clear;

  for c:=0 to lstCodCCusto.Count-1 do
  begin
    // Pego o Dígito Identificador do C. de Custo Sintético atual
    sCodCCSintAtual := Copy(lstCodCCusto[c], 1, byNumCarMascCCSint);

    iQtdeFunc := 0;
    repeat
      // Pego o C. de Custo atual
      sCodCCAtual := Copy(dmCds.Cds.FieldByName('CODCENTROCUSTO').asString, 1, byNumCarMascCCSint);

      if (lstListaCC.IndexOf(dmCds.Cds.FieldByName('CODCENTROCUSTO').asString) = -1) and
         (sCodCCAtual = sCodCCSintAtual) then
      begin
        // Soma cada Rubrica do C. de Custo Sintético atual
        iQtdeFunc := iQtdeFunc + dmCds.Cds.FieldByName('QTDE_FUNCIONARIOS').asInteger;

        lstListaCC.Add(dmCds.Cds.FieldByName('CODCENTROCUSTO').asString);
      end;

      dmCds.Cds.Next;

      // Pego o primeiro Dígito Identificador do C. de Custo Analítico atual
      sCodCCAtual := Copy(dmCds.Cds.FieldByName('CODCENTROCUSTO').asString, 1, byNumCarMascCCSint);
    until (dmCds.Cds.EOF) or (sCodCCAtual <> sCodCCSintAtual);

    // Adiciono a quantidade gerada à lista
    lstNumFunc.Add(IntToStr(iQtdeFunc));
  end;
  dmCds.Cds.First;

  lstListaCC.Free;
end;

procedure TRptResFol.AgrupaCCustoSintetico;
var
  dValor: double;
  c: integer;
  iTipoRubrica, iNumRegistro: integer;
begin
  lstCodCCusto := TStringList.Create;
  lstNomeCCusto := TStringList.Create;
  lstNumFunc := TStringList.Create;
  lstRubProcess := TStringList.Create;

  sqlResFol.Open;
  if not(dmCds.Cds.IsEmpty) then
  begin
    iNumRegistro := 0;

    // Geração da lista dos códigos C. de Custos válidos
    GeraListaCodCCusto;

    // Geração dos Números de Funcionários em cada C. de Custo
    GeraNumFuncCCusto;

    // Geração de todas as linhas de Rubricas
    for c:=0 to lstCodCCusto.Count-1 do
    begin
      // Pego o Dígito Identificador do C. de Custo Sintético atual
      sCodCCSintAtual := Copy(lstCodCCusto[c], 1, byNumCarMascCCSint);
      // Apago a lista de Rubricas já processadas
      lstRubProcess.Clear;

      repeat
        sCodRub := dmCds.Cds.FieldByName('CODRUBRICA').asString;
        iQtdeFunc := 0;
        dValor := 0;

        Inc(iNumRegistro);
        CdsResFol.Insert;
        CdsResFol.FieldByName('EMPRESA').asString := dmCds.Cds.FieldByName('EMPRESA').asString;
        CdsResFol.FieldByName('CGCCPF').asString := dmCds.Cds.FieldByName('CGCCPF').asString;
        CdsResFol.FieldByName('UF').asString := dmCds.Cds.FieldByName('UF').asString;
        CdsResFol.FieldByName('ESTADUALMUNICIPAL').asString := dmCds.Cds.FieldByName('ESTADUALMUNICIPAL').asString;
        CdsResFol.FieldByName('ENDERECO').asString := dmCds.Cds.FieldByName('ENDERECO').asString;
        CdsResFol.FieldByName('PROVENTODESCONTO').asString := dmCds.Cds.FieldByName('PROVENTODESCONTO').asString;
        CdsResFol.FieldByName('TIPOPROVDESC').asInteger := dmCds.Cds.FieldByName('TIPOPROVDESC').asInteger;
        CdsResFol.FieldByName('RUBRICA').asString := dmCds.Cds.FieldByName('RUBRICA').asString;
        CdsResFol.FieldByName('CODRUBRICA').asString := dmCds.Cds.FieldByName('CODRUBRICA').asString;
        CdsResFol.FieldByName('MES_REF_INI').asString := dmCds.Cds.FieldByName('MES_REF_INI').asString;
        CdsResFol.FieldByName('MES_REF_FIN').asString := dmCds.Cds.FieldByName('MES_REF_FIN').asString;
        CdsResFol.FieldByName('NOMEGRUPO').asString := lstNomeCCusto[c];
        CdsResFol.FieldByName('QTDE_FUNCIONARIOS').asString := lstNumFunc[c];
        CdsResFol.FieldByName('NUM_REGISTRO').asInteger := iNumRegistro;

        // Somo os Valores de cada rubrica para o C. de Custo Sintético atual
        iTipoRubrica := dmCds.Cds.FieldByName('TIPOPROVDESC').asInteger;
        repeat
          if (lstRubProcess.IndexOf(sCodRub) = -1) and
             (dmCds.Cds.FieldByName('CODRUBRICA').asString = sCodRub) then
          begin
            iQtdeFunc := iQtdeFunc + dmCds.Cds.FieldByName('QTDE_FUNC_RUB').asInteger;
            dValor := dValor + dmCds.Cds.FieldByName('VALOR').asFloat;
          end;

          dmCds.Cds.Next;

          // Pego o primeiro Dígito Identificador do C. de Custo Analítico atual
          sCodCCAtual := Copy(dmCds.Cds.FieldByName('CODCENTROCUSTO').asString, 1, byNumCarMascCCSint);
        until (dmCds.Cds.EOF) or (sCodCCAtual <> sCodCCSintAtual) or
              (sCodRub <> dmCds.Cds.FieldByName('CODRUBRICA').asString);

        // Informo que a Rubrica atual não deve ser mais considerada
        lstRubProcess.Add(sCodRub);

        CdsResFol.FieldByName('QTDE_FUNC_RUB').asInteger := iQtdeFunc;
        CdsResFol.FieldByName('VALOR').asFloat := dValor;

        case (iTipoRubrica) of
          0 : begin
                CdsResFol.FieldByName('VALORREAL').asFloat := dValor;
                CdsResFol.FieldByName('VALORPROVENTO').asFloat := dValor;
                CdsResFol.FieldByName('VALORDESCONTO').asFloat := 0;
              end;
          1 : begin
                CdsResFol.FieldByName('VALORREAL').asFloat := -dValor;
                CdsResFol.FieldByName('VALORPROVENTO').asFloat := 0;
                CdsResFol.FieldByName('VALORDESCONTO').asFloat := dValor;
              end;
        end;

        CdsResFol.Post;
      until (dmCds.Cds.EOF) or (sCodCCAtual <> sCodCCSintAtual);
    end;
  end
  else
  begin
    CdsResFol.Insert;
    CdsResFol.Post;
  end;

  CdsResFol.IndexName := 'Index1';
  CdsResFol.First;

  FreeAndNil(lstRubProcess);
  FreeAndNil(lstCodCCusto);
  FreeAndNil(lstNomeCCusto);
  FreeAndNil(lstNumFunc);
end;

procedure TRptResFol.CdsResFolAfterOpen(DataSet: TDataSet);
begin
  frmAguarde.Max := DataSet.RecordCount;
  frmAguarde.Min := 0;
end;

procedure TRptResFol.CdsResFolAfterScroll(DataSet: TDataSet);
begin
  frmAguarde.Pos := frmAguarde.Pos + 1;
  frmAguarde.Update;
end;

procedure TRptResFol.rpResFolBeforePrint(Sender: TObject);
begin
  ResFolppGroupFooterBand3.Visible := (CmpRptCM.ParamByName('AgruparPor').asInteger > 0);

  if (CmpRptCM.ParamByName('AgruparPor').asInteger = 3) then
    rpResFolLabelNomeGrupo.Caption := 'PROGRAMA:'
  else
    rpResFolLabelNomeGrupo.Caption := 'CENTRO DE CUSTO:';
end;

procedure TRptResFol.ResFolppGroupHeaderBand4BeforePrint(Sender: TObject);
begin
  // Imprime o tipo de rubrica usada em cada grupo no SEU RODAPÉ
  if (CdsResFol.FieldByName('PROVENTODESCONTO').asString = 'PROVENTOS') then
  begin
    ResFolrplbTotProvDesc.Caption := 'TOTAL PROVENTOS:';
    rpResFolLine3.Visible := true;
  end
  else
  if (CdsResFol.FieldByName('PROVENTODESCONTO').asString = 'DESCONTOS') then
  begin
    ResFolrplbTotProvDesc.Caption := 'TOTAL DESCONTOS:';
    rpResFolLine3.Visible := true;
  end
  else
  begin
    ResfolrplbTotProvDesc.Caption := '';
    rpResFolLine3.Visible := false;
  end;
end;

procedure TRptResFol.ResFolppGroupFooterBand4BeforePrint(Sender: TObject);
begin
  rpResFolDBCalc1.Visible := not(CdsResFol.FieldByName('PROVENTODESCONTO').asString = 'OUTROS');
  ResFolrplbTotProvDesc.Visible := not(CdsResFol.FieldByName('PROVENTODESCONTO').asString = 'OUTROS');
end;

procedure TRptResFol.ResFolrpSummaryBand1AfterPrint(Sender: TObject);
begin
  frmAguarde.Apaga;
end;

end.
