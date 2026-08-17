// *****************************************************************************
// ***************************** REGISTRO DE ALTERAÇÕES ************************
// *****************************************************************************
// Autor(a)    :  Ádler Teodoro de Souza
// Data        :  27/02/2009
// Pendência   : SOL 109421 KINTANA 496332
// Descricao   :  Alteração de gravação de arquivos de log na raiz do disco C: .
//------------------------------------------------------------------------------
unit RResFolComp;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs, FCmReport,
  uCmRptManager, TXComp, CmParamReport, Db, DBClient, uCMClientDataSet, uCmSqlParams, ppDB,
  ppDBPipe, ppDBBDE, ppCtrls, ppBands, ppClass, ppVar, ppPrnabl, ppCache, ppComm, ppRelatv,
  ppProd, ppReport, TXRB, USistema;

type
  TRptResFolComp = class(TFrmCmReport)
    rpResFolComp: TppReport;
    rpResFolCompHdrBnd1: TppHeaderBand;
    rpResFolCompLbl5: TppLabel;
    rpResFolCompLbl2: TppLabel;
    rpResFolCompLbl3: TppLabel;
    rpResFolCompLbl7: TppLabel;
    rpResFolCompLbl8: TppLabel;
    rpResFolCompLbl11: TppLabel;
    rpResFolCompLblTipoPag: TppLabel;
    rpResFolCompDBTxt2: TppDBText;
    rpResFolCompDBTxt1: TppDBText;
    rpResFolCompDBTxt4: TppDBText;
    rpResFolCompDBTxt3: TppDBText;
    rpResFolCompLbl1: TppLabel;
    rpResFolCompDBTxt5: TppDBText;
    rpResFolCompLbl6: TppLabel;
    rpResFolCompDBTxt6: TppDBText;
    rpResFolCompDBTxt7: TppDBText;
    rpResFolCompDBTxt8: TppDBText;
    rpResFolCompLbl9: TppLabel;
    rpResFolCompLbl10: TppLabel;
    rpResFolCompLbl12: TppLabel;
    rpResFolCompLbl14: TppLabel;
    rpResFolCompLbl13: TppLabel;
    rpResFolCompSysVar1: TppSystemVariable;
    rpResFolCompSysVar2: TppSystemVariable;
    rpResFolCompLine1: TppLine;
    rpResFolCompDtlBnd1: TppDetailBand;
    rpResFolCompDBTxt14: TppDBText;
    rpResFolCompDBTxt18: TppDBText;
    rpResFolCompDBTxt13: TppDBText;
    rpResFolCompDBTxt15: TppDBText;
    rpResFolCompDBTxt16: TppDBText;
    rpResFolCompDBTxt17: TppDBText;
    rpResFolCompFootBnd1: TppFooterBand;
    rpResFolCompSmryBnd1: TppSummaryBand;
    rpResFolCompLine6: TppLine;
    rpResFolCompLbl29: TppLabel;
    rpResFolCompLbl30: TppLabel;
    rpResFolCompLbl28: TppLabel;
    rpResFolCompLine7: TppLine;
    rpResFolCompLblTOT_GERAL_VALOR_VAR_PROV: TppLabel;
    rpResFolCompLblTOT_GERAL_VALOR_VAR_DESC: TppLabel;
    rpResFolCompLblTOT_GERAL_VALOR_VAR_LIQ: TppLabel;
    rpResFolCompLblTOT_GERAL_PERC_VAR_PROV: TppLabel;
    rpResFolCompLblTOT_GERAL_PERC_VAR_DESC: TppLabel;
    rpResFolCompLblTOT_GERAL_PERC_VAR_LIQ: TppLabel;
    rpResFolCompLblTOT_GERAL_PROV1: TppLabel;
    rpResFolCompLblTOT_GERAL_PROV2: TppLabel;
    rpResFolCompLblTOT_GERAL_DESC1: TppLabel;
    rpResFolCompLblTOT_GERAL_DESC2: TppLabel;
    rpResFolCompLblTOT_GERAL_LIQ1: TppLabel;
    rpResFolCompLblTOT_GERAL_LIQ2: TppLabel;
    rpResFolCompGroup1: TppGroup;
    rpResFolCompGrpHdrBnd0: TppGroupHeaderBand;
    rpResFolCompLbl15: TppLabel;
    rpResFolCompDBTxt9: TppDBText;
    rpResFolCompLbl16: TppLabel;
    rpResFolCompLbl17: TppLabel;
    rpResFolCompLbl20: TppLabel;
    rpResFolCompDBTxt10: TppDBText;
    rpResFolCompDBTxt11: TppDBText;
    rpResFolCompLbl18: TppLabel;
    rpResFolCompLbl19: TppLabel;
    rpResFolCompLbl21: TppLabel;
    rpResFolCompLbl23: TppLabel;
    rpResFolCompLbl22: TppLabel;
    rpResFolCompLine2: TppLine;
    rpResFolCompGrpFootBnd0: TppGroupFooterBand;
    rpResFolCompLbl25: TppLabel;
    rpResFolCompLbl26: TppLabel;
    rpResFolCompLine5: TppLine;
    rpResFolCompLbl27: TppLabel;
    rpResFolCompLblTOT_VALOR_VAR_PROV: TppLabel;
    rpResFolCompLblTOT_VALOR_VAR_DESC: TppLabel;
    rpResFolCompLblTOT_VALOR_VAR_LIQ: TppLabel;
    rpResFolCompLblTOT_PERC_VAR_PROV: TppLabel;
    rpResFolCompLblTOT_PERC_VAR_DESC: TppLabel;
    rpResFolCompLblTOT_PERC_VAR_LIQ: TppLabel;
    rpResFolCompLblTOT_PROV1: TppLabel;
    rpResFolCompLblTOT_PROV2: TppLabel;
    rpResFolCompLblTOT_DESC1: TppLabel;
    rpResFolCompLblTOT_DESC2: TppLabel;
    rpResFolCompLblTOT_LIQ1: TppLabel;
    rpResFolCompLblTOT_LIQ2: TppLabel;
    rpResFolCompGroup2: TppGroup;
    rpResFolCompGrpHdrBand1: TppGroupHeaderBand;
    rpResFolCompDBTxt12: TppDBText;
    rpResFolCompGrpFootBnd1: TppGroupFooterBand;
    rpResFolCompLine3: TppLine;
    rpResFolCompTotProvDesc: TppLabel;
    rpResFolCompLine4: TppLine;
    rpResFolCompDBCalcVALOR1: TppDBCalc;
    rpResFolCompDBCalcVALOR2: TppDBCalc;
    rpResFolCompLblPERC_VAR: TppLabel;
    rpResFolCompLblVALOR_VAR: TppLabel;
    ppResFolComp: TppBDEPipeline;
    dsResFolComp: TDataSource;
    sqlResFolComp: TCMSqlParams;
    CdsResFolComp: TCMClientDataSet;
    procedure CrmRptCMBeforePrint(Sender: TObject);
    procedure CdsResFolCompBeforeOpen(DataSet: TDataSet);
    procedure CdsResFolCompAfterOpen(DataSet: TDataSet);
    procedure CdsResFolCompAfterScroll(DataSet: TDataSet);
    procedure rpResFolCompGrpFootBnd0BeforePrint(Sender: TObject);
    procedure rpResFolCompGrpFootBnd0AfterPrint(Sender: TObject);
    procedure rpResFolCompSmryBnd1BeforePrint(Sender: TObject);
    procedure rpResFolCompSmryBnd1AfterPrint(Sender: TObject);
    procedure rpResFolCompGrpFootBnd1BeforePrint(Sender: TObject);
    procedure rpResFolCompGrpFootBnd1AfterPrint(Sender: TObject);
    procedure rpResFolCompGrpHdrBand1BeforePrint(Sender: TObject);
    procedure rpResFolCompDtlBnd1AfterPrint(Sender: TObject);
  private
    // Total por Grupo das Rubricas
    rTotProvGrupo1, rTotDescGrupo1, rTotProvGrupo2, rTotDescGrupo2,
    rTotOutrGrupo1, rTotOutrGrupo2,
    // Total Geral das Rubricas
    rTotProv1, rTotDesc1, rTotProv2, rTotDesc2, rTotOutr1, rTotOutr2: real;
    bPrimeiraVez: boolean;
    Periodo: array [1..2] of string;

    procedure GerarDadosRelat;
    procedure CalcVariacao(Val1,Val2: real; var ValResultVal, ValResultPerc: string);
    procedure ConfigLayoutRelatorio;
  end;

var
  RptResFolComp: TRptResFolComp;

implementation

uses uModulo, uCtrlFuncoesRH, dCds, fAguarde, uCtrlUsoGeralRH;

{$R *.DFM}

procedure TRptResFolComp.CrmRptCMBeforePrint(Sender: TObject);
var
  iMes, iAno, iMes2, iAno2: integer;
begin
  inherited;
  rpResFolCompDBTxt1.Visible := Pos(',', CmpRptCM.ParamByName('ListaIdEstab').asString) = 0;
  rpResFolCompDBTxt3.Visible := Pos(',', CmpRptCM.ParamByName('ListaIdEstab').asString) = 0;
  rpResFolCompDBTxt4.Visible := Pos(',', CmpRptCM.ParamByName('ListaIdEstab').asString) = 0;

  // Guarda o Período escolhido
  Periodo[1] := CmpRptCM.ParamByName('AnoInicial').asString +'/'+
    FU.PoeZero(CmpRptCM.ParamByName('MesInicial').asInteger);
  Periodo[2] := CmpRptCM.ParamByName('AnoFinal').asString +'/'+
    FU.PoeZero(CmpRptCM.ParamByName('MesFinal').asInteger);

  iMes := CmpRptCM.ParamByName('MesInicial').asInteger;
  iAno := CmpRptCM.ParamByName('AnoInicial').asInteger;
  iMes2:= CmpRptCM.ParamByName('MesFinal').asInteger;
  iAno2:= CmpRptCM.ParamByName('AnoFinal').asInteger;

  with (dmCds.sql.SQL) do
  begin
    if CmpRptCM.ParamByName('BuscaHist').asInteger = 0 then
    begin // busca ESTAB e CCUSTO no histórico
      Clear;
      Add('SELECT DISTINCT');
      Add('  PJ.RAZAOSOCIAL AS ESTAB,');
      Add('  DECODE(PJ.NUMDOCUMENTO,NULL,NULL, ''CNPJ: '' || PJ.NUMDOCUMENTO) AS CGC,');
      Add('  RTRIM(DECODE(RTRIM(ESTADUAL.NUMDOCUMENTO),NULL,');
      Add('    DECODE(RTRIM(MUNICIPAL.NUMDOCUMENTO),NULL,NULL,');
      Add('    ''Inscrição Municipal: '' || MUNICIPAL.NUMDOCUMENTO),');
      Add('    ''Inscrição Estadual: '' || ESTADUAL.NUMDOCUMENTO)) AS INSCRICAO,');
      Add('  RTRIM(E.LOGRADOURO) ||'', ''|| E.NUMERO ||');
      Add('    DECODE(E.COMPLEMENTO,NULL,NULL,'' - '' || RTRIM(E.COMPLEMENTO)) ||'' - ''||');
      Add('    RTRIM(E.BAIRRO) ||'' - ''|| RTRIM(CIDADES.NOME) || '' - CEP:'' ||');
      Add('    RTRIM(SUBSTR(E.CEP,1,5)) ||''-''|| RTRIM(SUBSTR(E.CEP,6,3)) AS ENDERECO,');
      Add('  ES.CODESTADO AS UF,');
      Add('  P.FLGDESCONTO AS TIPOPROVDESC,');
      Add('  HIST.DESCRPROVDESC AS RUBRICA,');
      Add('  HIST.CODPROVDESC AS CODRUBRICA,');
      Add('  HIST.MES AS MES_REF,');

      if (CmpRptCM.ParamByName('AgruparPor').asInteger = 1) then
        Add('  CC.NOME AS NOMECENTROCUSTO,');

      Add('  QTDE_FUNC.QTDE AS QTDE_FUNCIONARIOS,');
      Add('  HIST.VALOR');
      // ------------------------------------------------------------------------------- //
      Add('FROM');
      Add('  PESSOA PJ, ENDPESS E, PROVDESC P, CIDADES, ESTADO ES,'+
        FU.IFF((CmpRptCM.ParamByName('AgruparPor').asInteger = 1),' CENTCUST CC,',''));
      // ------------------------------------------------------------------------------- //
      // Total de funcionários que compuseram  a Folha
      if (CmpRptCM.ParamByName('AgruparPor').asInteger = 1) then // Agrupando por Centro de Custo
      begin
        Add('  (SELECT FP.IDFILIALPESSOA, PESSOAS.MES, CC.CODCENTROCUSTO, COUNT(PESSOAS.IDPESSOA) QTDE');
        Add('   FROM   CENTCUST CC, FILIALPESSOA FP,');
        // Pessoas para o período
        Add('     (SELECT FP.IDFILIALPESSOA, F.IDPESSOA, CC.CODCENTROCUSTO, H.MES');
        Add('      FROM   HISTRUBSAL H, FUNCIONARIO F, FILIALPESSOA FP, CENTCUST CC,');
        // Última evolução Funcional do Funcionário
        // --------------------------------------------------------------------------------------
        Add('     (SELECT EVOL.IDESTAB, EVOL.IDPESSOA, EVOL.IDEMPRESA, EVOL.CODCENTROCUSTO');
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
        Add('           (EVOL.IDPESSOA      = HST3.IDPESSOA)) HST,');
        // ------------------------------------------------------------------------------- //
        Add('     (SELECT EVOL.IDESTAB, EVOL.IDPESSOA, EVOL.IDEMPRESA, EVOL.CODCENTROCUSTO');
        Add('    FROM   EVOLFUNC EVOL,');
        Add('          (SELECT MAX(DATAALTERFUNC) AS DATAALTERFUNC, IDPESSOA');
        Add('           FROM   EVOLFUNC');
        Add('           WHERE');
        Add('            (DATAALTERFUNC <= TO_DATE('+
          QuotedStr(IntToStr(FU.TrazUltDiaMes(iMes2, iAno2)) +'/'+ FU.PoeZero(iMes2) +'/'+ IntToStr(iAno2))+
          ',''DD/MM/YYYY''))');
        Add('           GROUP BY IDPESSOA) HST2,');
        Add('          (SELECT MAX(TRGDTINCLUSAO) AS DATAINCLUSAO, IDPESSOA');
        Add('           FROM   EVOLFUNC');
        Add('           WHERE  (DATAALTERFUNC <= TO_DATE('+
          QuotedStr(IntToStr(FU.TrazUltDiaMes(iMes2, iAno2)) +'/'+ FU.PoeZero(iMes2) +'/'+
          IntToStr(iAno2))+ ',''DD/MM/YYYY''))');
        Add('           GROUP BY IDPESSOA) HST3');
        Add('    WHERE  (EVOL.DATAALTERFUNC = HST2.DATAALTERFUNC) AND');
        Add('           (EVOL.IDPESSOA      = HST2.IDPESSOA) AND');
        Add('           (EVOL.TRGDTINCLUSAO = HST3.DATAINCLUSAO) AND');
        Add('           (EVOL.IDPESSOA      = HST3.IDPESSOA)) HST2');
        // ------------------------------------------------------------------------------- //
        Add('      WHERE');

        // Estabelecimento selecionado
        if (CmpRptCM.ParamByName('ListaIdEstab').asString <> '') then
        begin
          Add('       ((DECODE(HST.IDESTAB,NULL,F.IDESTAB,HST.IDESTAB) IN (' +CmpRptCM.ParamByName('ListaIdEstab').asString+ ')) OR');
          Add('        (DECODE(HST2.IDESTAB,NULL,F.IDESTAB,HST2.IDESTAB) IN (' +CmpRptCM.ParamByName('ListaIdEstab').asString+ '))) AND');
        end
        else
        begin
          // Estabelecimento(s) habilitados para o usuário
          if (CtrlUsoGeralRH.UsuXFilial <> '') then
            if (Pos(',', CtrlUsoGeralRH.UsuXFilial) > 0) then
            begin
              Add('       ((DECODE(HST.IDESTAB,NULL,F.IDESTAB,HST.IDESTAB) IN (' +CtrlUsoGeralRH.UsuXFilial+ ')) OR');
              Add('        (DECODE(HST2.IDESTAB,NULL,F.IDESTAB,HST2.IDESTAB) IN (' +CtrlUsoGeralRH.UsuXFilial+ '))) AND');
            end
            else
            begin
              Add('       ((DECODE(HST.IDESTAB,NULL,F.IDESTAB,HST.IDESTAB) = ' +CtrlUsoGeralRH.UsuXFilial+ ') OR');
              Add('        (DECODE(HST2.IDESTAB,NULL,F.IDESTAB,HST2.IDESTAB) = ' +CtrlUsoGeralRH.UsuXFilial+ ')) AND');
            end;
        end;

        // C. Custo(s) selecionado(s)
        if (CmpRptCM.ParamByName('ListaCodCCusto').asString <> '') then
        begin
          if (Pos(',', CmpRptCM.ParamByName('ListaCodCCusto').asString) > 0) then
          begin
            Add('       ((TRIM(DECODE(HST.CODCENTROCUSTO,NULL,F.CODCENTROCUSTO,HST.CODCENTROCUSTO)) IN (' +CmpRptCM.ParamByName('ListaCodCCusto').asString+ ')) OR');
            Add('        (TRIM(DECODE(HST2.CODCENTROCUSTO,NULL,F.CODCENTROCUSTO,HST2.CODCENTROCUSTO)) IN (' +CmpRptCM.ParamByName('ListaCodCCusto').asString+ '))) AND');
          end
          else
          begin
            Add('       ((TRIM(DECODE(HST.CODCENTROCUSTO,NULL,F.CODCENTROCUSTO,HST.CODCENTROCUSTO)) = ' +CmpRptCM.ParamByName('ListaCodCCusto').asString+ ') OR');
            Add('        (TRIM(DECODE(HST2.CODCENTROCUSTO,NULL,F.CODCENTROCUSTO,HST2.CODCENTROCUSTO)) = ' +CmpRptCM.ParamByName('ListaCodCCusto').asString+ ')) AND');
          end;
        end
        else
        begin
          // C. de Custo(s) habilitados para o usuário
          if (CtrlUsoGeralRH.UsuXCCusto <> '') then
            if (Pos(',', CtrlUsoGeralRH.UsuXCCusto) > 0) then
            begin
              Add('       ((TRIM(DECODE(HST.CODCENTROCUSTO,NULL,F.CODCENTROCUSTO,HST.CODCENTROCUSTO)) IN (' +CtrlUsoGeralRH.UsuXCCusto+ ')) OR');
              Add('        (TRIM(DECODE(HST2.CODCENTROCUSTO,NULL,F.CODCENTROCUSTO,HST2.CODCENTROCUSTO)) IN (' +CtrlUsoGeralRH.UsuXCCusto+ '))) AND');
            end
            else
            begin
              Add('       ((TRIM(DECODE(HST.CODCENTROCUSTO,NULL,F.CODCENTROCUSTO,HST.CODCENTROCUSTO)) = ' +CtrlUsoGeralRH.UsuXCCusto+ ') OR');
              Add('        (TRIM(DECODE(HST2.CODCENTROCUSTO,NULL,F.CODCENTROCUSTO,HST2.CODCENTROCUSTO)) = ' +CtrlUsoGeralRH.UsuXCCusto+ ')) AND');
            end;
        end;

        // Rubrica(s) selecionada(s)
        if (CmpRptCM.ParamByName('ListaIdRubrica').asString <> '') then
          if (Pos(',', CmpRptCM.ParamByName('ListaIdRubrica').asString) > 0) then
            Add('        (H.CODPROVDESC    IN (' +CmpRptCM.ParamByName('ListaIdRubrica').asString+ ')) AND')
          else
            Add('        (H.CODPROVDESC     = ' +CmpRptCM.ParamByName('ListaIdRubrica').asString+ ') AND');

        Add('        ((H.MES       = ' +QuotedStr(Periodo[1])+ ') OR');
        Add('         (H.MES       = ' +QuotedStr(Periodo[2])+ ')) AND');

        if (CmpRptCM.ParamByName('ListaIdTipoFolha').asString <> '') then
          if (Pos(',', CmpRptCM.ParamByName('ListaIdTipoFolha').asString) > 0) then
            Add('        (H.IDMOTIVO  IN (' +CmpRptCM.ParamByName('ListaIdTipoFolha').asString+ ')) AND')
          else
            Add('        (H.IDMOTIVO   = ' +CmpRptCM.ParamByName('ListaIdTipoFolha').asString+ ') AND');

        Add('        (F.IDPESSOA        = H.IDPESSOA) AND');
        Add('        ((FP.IDFILIALPESSOA = DECODE(HST.IDESTAB,NULL,F.IDESTAB,HST.IDESTAB) AND H.MES = ' +QuotedStr(Periodo[1])+ ') OR');
        Add('         (FP.IDFILIALPESSOA = DECODE(HST2.IDESTAB,NULL,F.IDESTAB,HST2.IDESTAB) AND H.MES = ' +QuotedStr(Periodo[2])+ ')) AND');
        Add('        ((DECODE(HST.IDEMPRESA,NULL,F.IDEMPRESA,HST.IDEMPRESA)  = CC.IDEMPRESA AND H.MES = ' +QuotedStr(Periodo[1])+ ') OR');
        Add('         (DECODE(HST2.IDEMPRESA,NULL,F.IDEMPRESA,HST2.IDEMPRESA)  = CC.IDEMPRESA AND H.MES = ' +QuotedStr(Periodo[2])+ ')) AND');
        Add('        ((CC.CODCENTROCUSTO = DECODE(HST.CODCENTROCUSTO,NULL,F.CODCENTROCUSTO,HST.CODCENTROCUSTO) AND H.MES = ' +QuotedStr(Periodo[1])+ ') OR');
        Add('         (CC.CODCENTROCUSTO = DECODE(HST2.CODCENTROCUSTO,NULL,F.CODCENTROCUSTO,HST2.CODCENTROCUSTO) AND H.MES = ' +QuotedStr(Periodo[2])+ ')) AND');
        Add('        (F.IDPESSOA        = HST.IDPESSOA(+)) AND');
        Add('        (F.IDPESSOA        = HST2.IDPESSOA(+))');
        Add('      GROUP BY');
        Add('        FP.IDFILIALPESSOA, F.IDPESSOA, CC.CODCENTROCUSTO, H.MES) PESSOAS');
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

        Add('     (CC.IDEMPRESA           = ' +CmpRptCM.ParamByName('IdEmpresa').asString+ ') AND');
        Add('     (PESSOAS.IDFILIALPESSOA = FP.IDFILIALPESSOA) AND');
        Add('     (PESSOAS.CODCENTROCUSTO = CC.CODCENTROCUSTO)');
        Add('   GROUP BY');
        Add('     CC.CODCENTROCUSTO, FP.IDFILIALPESSOA, PESSOAS.MES) QTDE_FUNC,');
      end
      else // Não Agrupando por Centro de Custo
      begin
        Add('  (SELECT FP.IDFILIALPESSOA, PESSOAS.MES, COUNT(PESSOAS.IDPESSOA) QTDE');
        Add('   FROM   FILIALPESSOA FP,');
        // Pessoas para o período
        Add('     (SELECT FP.IDFILIALPESSOA, F.IDPESSOA, H.MES');
        Add('      FROM   HISTRUBSAL H, FUNCIONARIO F, FILIALPESSOA FP,');
        // Última evolução Funcional do Funcionário
        // --------------------------------------------------------------------------------------
        Add('     (SELECT EVOL.IDESTAB, EVOL.IDPESSOA, EVOL.IDEMPRESA, EVOL.CODCENTROCUSTO');
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
        Add('           (EVOL.IDPESSOA      = HST3.IDPESSOA)) HST,');
        // ------------------------------------------------------------------------------- //
        Add('     (SELECT EVOL.IDESTAB, EVOL.IDPESSOA, EVOL.IDEMPRESA, EVOL.CODCENTROCUSTO');
        Add('    FROM   EVOLFUNC EVOL,');
        Add('          (SELECT MAX(DATAALTERFUNC) AS DATAALTERFUNC, IDPESSOA');
        Add('           FROM   EVOLFUNC');
        Add('           WHERE');
        Add('            (DATAALTERFUNC <= TO_DATE('+
          QuotedStr(IntToStr(FU.TrazUltDiaMes(iMes2, iAno2)) +'/'+ FU.PoeZero(iMes2) +'/'+ IntToStr(iAno2))+
          ',''DD/MM/YYYY''))');
        Add('           GROUP BY IDPESSOA) HST2,');
        Add('          (SELECT MAX(TRGDTINCLUSAO) AS DATAINCLUSAO, IDPESSOA');
        Add('           FROM   EVOLFUNC');
        Add('           WHERE  (DATAALTERFUNC <= TO_DATE('+
          QuotedStr(IntToStr(FU.TrazUltDiaMes(iMes2, iAno2)) +'/'+ FU.PoeZero(iMes2) +'/'+
          IntToStr(iAno2))+ ',''DD/MM/YYYY''))');
        Add('           GROUP BY IDPESSOA) HST3');
        Add('    WHERE  (EVOL.DATAALTERFUNC = HST2.DATAALTERFUNC) AND');
        Add('           (EVOL.IDPESSOA      = HST2.IDPESSOA) AND');
        Add('           (EVOL.TRGDTINCLUSAO = HST3.DATAINCLUSAO) AND');
        Add('           (EVOL.IDPESSOA      = HST3.IDPESSOA)) HST2');
        // ------------------------------------------------------------------------------- //
        Add('      WHERE');

        // Estabelecimento selecionado
        if (CmpRptCM.ParamByName('ListaIdEstab').asString <> '') then
          Add('        (FP.IDFILIALPESSOA IN (' +CmpRptCM.ParamByName('ListaIdEstab').asString+ ')) AND')
        else
        begin
          // Estabelecimento(s) habilitados para o usuário
          if (CtrlUsoGeralRH.UsuXFilial <> '') then
            if (Pos(',', CtrlUsoGeralRH.UsuXFilial) > 0) then
              Add('        (FP.IDFILIALPESSOA  IN ' +CtrlUsoGeralRH.UsuXFilial+ ') AND')
            else
              Add('        (FP.IDFILIALPESSOA = ' +CtrlUsoGeralRH.UsuXFilial+ ') AND');
        end;

        // C. Custo(s) selecionado(s)
        if (CmpRptCM.ParamByName('ListaCodCCusto').asString <> '') then
        begin
          if (Pos(',', CmpRptCM.ParamByName('ListaCodCCusto').asString) > 0) then
          begin
            Add('       ((TRIM(DECODE(HST.CODCENTROCUSTO,NULL,F.CODCENTROCUSTO,HST.CODCENTROCUSTO)) IN (' +CmpRptCM.ParamByName('ListaCodCCusto').asString+ ')) OR');
            Add('        (TRIM(DECODE(HST2.CODCENTROCUSTO,NULL,F.CODCENTROCUSTO,HST2.CODCENTROCUSTO)) IN (' +CmpRptCM.ParamByName('ListaCodCCusto').asString+ '))) AND');
          end
          else
          begin
            Add('       ((TRIM(DECODE(HST.CODCENTROCUSTO,NULL,F.CODCENTROCUSTO,HST.CODCENTROCUSTO)) = ' +CmpRptCM.ParamByName('ListaCodCCusto').asString+ ') OR');
            Add('        (TRIM(DECODE(HST2.CODCENTROCUSTO,NULL,F.CODCENTROCUSTO,HST2.CODCENTROCUSTO)) = ' +CmpRptCM.ParamByName('ListaCodCCusto').asString+ ')) AND');
          end;
        end
        else
        begin
          // C. de Custo(s) habilitados para o usuário
          if (CtrlUsoGeralRH.UsuXCCusto <> '') then
            if (Pos(',', CtrlUsoGeralRH.UsuXCCusto) > 0) then
            begin
              Add('       ((TRIM(DECODE(HST.CODCENTROCUSTO,NULL,F.CODCENTROCUSTO,HST.CODCENTROCUSTO)) IN (' +CtrlUsoGeralRH.UsuXCCusto+ ')) OR');
              Add('        (TRIM(DECODE(HST2.CODCENTROCUSTO,NULL,F.CODCENTROCUSTO,HST2.CODCENTROCUSTO)) IN (' +CtrlUsoGeralRH.UsuXCCusto+ '))) AND');
            end
            else
            begin
              Add('       ((TRIM(DECODE(HST.CODCENTROCUSTO,NULL,F.CODCENTROCUSTO,HST.CODCENTROCUSTO)) = ' +CtrlUsoGeralRH.UsuXCCusto+ ') OR');
              Add('        (TRIM(DECODE(HST2.CODCENTROCUSTO,NULL,F.CODCENTROCUSTO,HST2.CODCENTROCUSTO)) = ' +CtrlUsoGeralRH.UsuXCCusto+ ')) AND');
            end;
        end;

        // Rubrica(s) selecionada(s)
        if (CmpRptCM.ParamByName('ListaIdRubrica').asString <> '') then
          if (Pos(',',CmpRptCM.ParamByName('ListaIdRubrica').asString) > 0) then
            Add('        (H.CODPROVDESC    IN (' +CmpRptCM.ParamByName('ListaIdRubrica').asString+ ')) AND')
          else
            Add('        (H.CODPROVDESC     = ' +CmpRptCM.ParamByName('ListaIdRubrica').asString+ ') AND');

        Add('        ((H.MES       = ' +QuotedStr(Periodo[1])+ ') OR');
        Add('         (H.MES       = ' +QuotedStr(Periodo[2])+ ')) AND');

        if (CmpRptCM.ParamByName('ListaIdTipoFolha').asString <> '') then
          if (Pos(',', CmpRptCM.ParamByName('ListaIdTipoFolha').asString) > 0) then
            Add('        (H.IDMOTIVO  IN (' +CmpRptCM.ParamByName('ListaIdTipoFolha').asString+ ')) AND')
          else
            Add('        (H.IDMOTIVO   = ' +CmpRptCM.ParamByName('ListaIdTipoFolha').asString+ ') AND');

        Add('        (F.IDPESSOA        = H.IDPESSOA) AND');
        Add('        ((FP.IDFILIALPESSOA = DECODE(HST.IDESTAB,NULL,F.IDESTAB,HST.IDESTAB) AND H.MES = ' +QuotedStr(Periodo[1])+ ') OR');
        Add('         (FP.IDFILIALPESSOA = DECODE(HST2.IDESTAB,NULL,F.IDESTAB,HST2.IDESTAB) AND H.MES = ' +QuotedStr(Periodo[2])+ ')) AND');
        Add('        (F.IDPESSOA        = HST.IDPESSOA(+)) AND');
        Add('        (F.IDPESSOA        = HST2.IDPESSOA(+))');
        Add('      GROUP BY');
        Add('        FP.IDFILIALPESSOA, F.IDPESSOA, H.MES) PESSOAS');
        Add('   WHERE');
        Add('     (FP.IDFILIALPESSOA = PESSOAS.IDFILIALPESSOA)');
        Add('   GROUP BY');
        Add('     FP.IDFILIALPESSOA, PESSOAS.MES) QTDE_FUNC,');
      end;
      // ------------------------------------------------------------------------------- //
      // Rubricas da Folha
      Add('  (SELECT');
      Add('     '+FU.IFF((CmpRptCM.ParamByName('AgruparPor').asInteger = 1),'CC.CODCENTROCUSTO, ','')+
           'FP.IDFILIALPESSOA AS IDPESSOA, H.IDRUBRICA, RP.CODPROVDESC,');
      Add('     RP.DESCRPROVDESC, SUM(H.VALORPROVENTO) AS VALOR, H.MES');
      Add('   FROM HISTRUBSAL H, RUBRICAXPESS RP, FUNCIONARIO F, FILIALPESSOA FP, CENTCUST CC,');
      // Última evolução Funcional do Funcionário
      // --------------------------------------------------------------------------------------
      Add('       (SELECT EVOL.IDESTAB, EVOL.IDPESSOA, EVOL.IDEMPRESA, EVOL.CODCENTROCUSTO');
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
      Add('           (EVOL.IDPESSOA      = HST3.IDPESSOA)) HST,');
      // ------------------------------------------------------------------------------- //
        Add('     (SELECT EVOL.IDESTAB, EVOL.IDPESSOA, EVOL.IDEMPRESA, EVOL.CODCENTROCUSTO');
        Add('    FROM   EVOLFUNC EVOL,');
        Add('          (SELECT MAX(DATAALTERFUNC) AS DATAALTERFUNC, IDPESSOA');
        Add('           FROM   EVOLFUNC');
        Add('           WHERE');
        Add('            (DATAALTERFUNC <= TO_DATE('+
          QuotedStr(IntToStr(FU.TrazUltDiaMes(iMes2, iAno2)) +'/'+ FU.PoeZero(iMes2) +'/'+ IntToStr(iAno2))+
          ',''DD/MM/YYYY''))');
        Add('           GROUP BY IDPESSOA) HST2,');
        Add('          (SELECT MAX(TRGDTINCLUSAO) AS DATAINCLUSAO, IDPESSOA');
        Add('           FROM   EVOLFUNC');
        Add('           WHERE  (DATAALTERFUNC <= TO_DATE('+
          QuotedStr(IntToStr(FU.TrazUltDiaMes(iMes2, iAno2)) +'/'+ FU.PoeZero(iMes2) +'/'+
          IntToStr(iAno2))+ ',''DD/MM/YYYY''))');
        Add('           GROUP BY IDPESSOA) HST3');
        Add('    WHERE  (EVOL.DATAALTERFUNC = HST2.DATAALTERFUNC) AND');
        Add('           (EVOL.IDPESSOA      = HST2.IDPESSOA) AND');
        Add('           (EVOL.TRGDTINCLUSAO = HST3.DATAINCLUSAO) AND');
        Add('           (EVOL.IDPESSOA      = HST3.IDPESSOA)) HST2');
      // ------------------------------------------------------------------------------- //
      Add('   WHERE');

      Add('   ((DECODE(HST.IDEMPRESA,NULL,F.IDEMPRESA,HST.IDEMPRESA) = ' +CmpRptCM.ParamByName('IdEmpresa').asString+ ') OR');
      Add('    (DECODE(HST2.IDEMPRESA,NULL,F.IDEMPRESA,HST2.IDEMPRESA) = ' +CmpRptCM.ParamByName('IdEmpresa').asString+ ')) AND');

      Add('   (RP.IDPESSOA = ' +CmpRptCM.ParamByName('IdEmpresa').asString+ ') AND');

      if (CmpRptCM.ParamByName('ListaIdEstab').asString <> '') then
      begin
        Add('       ((DECODE(HST.IDESTAB,NULL,F.IDESTAB,HST.IDESTAB) IN (' +CmpRptCM.ParamByName('ListaIdEstab').asString+ ')) OR');
        Add('        (DECODE(HST2.IDESTAB,NULL,F.IDESTAB,HST2.IDESTAB) IN (' +CmpRptCM.ParamByName('ListaIdEstab').asString+ '))) AND');
      end
      else
      begin
        // Estabelecimento(s) habilitados para o usuário
        if (CtrlUsoGeralRH.UsuXFilial <> '') then
          if (Pos(',', CtrlUsoGeralRH.UsuXFilial) > 0) then
          begin
            Add('       ((DECODE(HST.IDESTAB,NULL,F.IDESTAB,HST.IDESTAB) IN ' +CtrlUsoGeralRH.UsuXFilial+ ') OR');
            Add('        (DECODE(HST2.IDESTAB,NULL,F.IDESTAB,HST2.IDESTAB) IN ' +CtrlUsoGeralRH.UsuXFilial+ ')) AND');
          end
          else
          begin
            Add('       ((DECODE(HST.IDESTAB,NULL,F.IDESTAB,HST.IDESTAB) = ' +CtrlUsoGeralRH.UsuXFilial+ ') OR');
            Add('        (DECODE(HST2.IDESTAB,NULL,F.IDESTAB,HST2.IDESTAB) = ' +CtrlUsoGeralRH.UsuXFilial+ ')) AND');
          end;
      end;

      // C. Custo(s) selecionado(s)
      if (CmpRptCM.ParamByName('ListaCodCCusto').asString <> '') then
      begin
        if (Pos(',', CmpRptCM.ParamByName('ListaCodCCusto').asString) > 0) then
        begin
          Add('       ((TRIM(DECODE(HST.CODCENTROCUSTO,NULL,F.CODCENTROCUSTO,HST.CODCENTROCUSTO)) IN (' +CmpRptCM.ParamByName('ListaCodCCusto').asString+ ')) OR');
          Add('        (TRIM(DECODE(HST2.CODCENTROCUSTO,NULL,F.CODCENTROCUSTO,HST2.CODCENTROCUSTO)) IN (' +CmpRptCM.ParamByName('ListaCodCCusto').asString+ '))) AND');
        end
        else
        begin
          Add('       ((TRIM(DECODE(HST.CODCENTROCUSTO,NULL,F.CODCENTROCUSTO,HST.CODCENTROCUSTO)) = ' +CmpRptCM.ParamByName('ListaCodCCusto').asString+ ') OR');
          Add('        (TRIM(DECODE(HST2.CODCENTROCUSTO,NULL,F.CODCENTROCUSTO,HST2.CODCENTROCUSTO)) = ' +CmpRptCM.ParamByName('ListaCodCCusto').asString+ ')) AND');
        end;
      end
      else
      begin
        // C. de Custo(s) habilitados para o usuário
        if (CtrlUsoGeralRH.UsuXCCusto <> '') then
          if (Pos(',', CtrlUsoGeralRH.UsuXCCusto) > 0) then
          begin
            Add('       ((TRIM(DECODE(HST.CODCENTROCUSTO,NULL,F.CODCENTROCUSTO,HST.CODCENTROCUSTO)) IN (' +CtrlUsoGeralRH.UsuXCCusto+ ')) OR');
            Add('        (TRIM(DECODE(HST2.CODCENTROCUSTO,NULL,F.CODCENTROCUSTO,HST2.CODCENTROCUSTO)) IN (' +CtrlUsoGeralRH.UsuXCCusto+ '))) AND');
          end
          else
          begin
            Add('       ((TRIM(DECODE(HST.CODCENTROCUSTO,NULL,F.CODCENTROCUSTO,HST.CODCENTROCUSTO)) = ' +CtrlUsoGeralRH.UsuXCCusto+ ') OR');
            Add('        (TRIM(DECODE(HST2.CODCENTROCUSTO,NULL,F.CODCENTROCUSTO,HST2.CODCENTROCUSTO)) = ' +CtrlUsoGeralRH.UsuXCCusto+ ')) AND');
          end;
      end;

      // Rubrica(s) selecionada(s)
      if (CmpRptCM.ParamByName('ListaIdRubrica').asString <> '') then
        if (Pos(',', CmpRptCM.ParamByName('ListaIdRubrica').asString) > 0) then
          Add('        (H.CODPROVDESC    IN (' +CmpRptCM.ParamByName('ListaIdRubrica').asString+ ')) AND')
        else
          Add('        (H.CODPROVDESC     = ' +CmpRptCM.ParamByName('ListaIdRubrica').asString+ ') AND');

      Add('     ((H.MES       = ' +QuotedStr(Periodo[1])+ ') OR');
      Add('      (H.MES       = ' +QuotedStr(Periodo[2])+ ')) AND');

      if (CmpRptCM.ParamByName('ListaIdTipoFolha').asString <> '') then
        if (Pos(',', CmpRptCM.ParamByName('ListaIdTipoFolha').asString) > 0) then
          Add('     (H.IDMOTIVO  IN (' +CmpRptCM.ParamByName('ListaIdTipoFolha').asString+ ')) AND')
        else
          Add('     (H.IDMOTIVO   = ' +CmpRptCM.ParamByName('ListaIdTipoFolha').asString+ ') AND');

      Add('     (RP.IDRUBRICA = H.IDRUBRICA) AND');
      Add('     (H.IDPESSOA   = F.IDPESSOA) AND');
      Add('     ((FP.IDFILIALPESSOA = DECODE(HST.IDESTAB,NULL,F.IDESTAB,HST.IDESTAB) AND H.MES = ' +QuotedStr(Periodo[1])+ ') OR');
      Add('      (FP.IDFILIALPESSOA = DECODE(HST2.IDESTAB,NULL,F.IDESTAB,HST2.IDESTAB) AND H.MES = ' +QuotedStr(Periodo[2])+ ')) AND');
      Add('     ((DECODE(HST.IDEMPRESA,NULL,F.IDEMPRESA,HST.IDEMPRESA)  = CC.IDEMPRESA AND H.MES = ' +QuotedStr(Periodo[1])+ ') OR');
      Add('      (DECODE(HST2.IDEMPRESA,NULL,F.IDEMPRESA,HST2.IDEMPRESA)  = CC.IDEMPRESA AND H.MES = ' +QuotedStr(Periodo[2])+ ')) AND');
      Add('     ((CC.CODCENTROCUSTO = DECODE(HST.CODCENTROCUSTO,NULL,F.CODCENTROCUSTO,HST.CODCENTROCUSTO) AND H.MES = ' +QuotedStr(Periodo[1])+ ') OR');
      Add('      (CC.CODCENTROCUSTO = DECODE(HST2.CODCENTROCUSTO,NULL,F.CODCENTROCUSTO,HST2.CODCENTROCUSTO) AND H.MES = ' +QuotedStr(Periodo[2])+ ')) AND');
      Add('     (F.IDPESSOA        = HST.IDPESSOA(+)) AND');
      Add('     (F.IDPESSOA        = HST2.IDPESSOA(+))');
      Add('   GROUP BY');

      Add('     ' +FU.IFF((CmpRptCM.ParamByName('AgruparPor').asInteger = 1),'CC.CODCENTROCUSTO, ','')+
        'H.IDRUBRICA, FP.IDFILIALPESSOA, H.MES, RP.CODPROVDESC, RP.DESCRPROVDESC) HIST,');
      // ------------------------------------------------------------------------------- //
      // Inscrição Estadual
      Add('  (SELECT D.IDPESSOA, D.NUMDOCUMENTO');
      Add('   FROM   DOCPESSOA D, TIPODOCOFICIAL TD');
      Add('   WHERE (TD.SIGLADOCUMENTO = ''ESTADUAL:'') AND');
      Add('         (D.IDPESSOA       IN (' +CmpRptCM.ParamByName('ListaIdEstab').asString+ ')) AND');
      Add('         (TD.IDDOCUMENTO    = D.IDDOCUMENTO)) ESTADUAL,');
      // ------------------------------------------------------------------------------- //
      // Inscrição Municipal
      Add('  (SELECT D.IDPESSOA, D.NUMDOCUMENTO');
      Add('   FROM   DOCPESSOA D, TIPODOCOFICIAL TD');
      Add('   WHERE (TD.SIGLADOCUMENTO = ''MUNICIPAL:'') AND');
      Add('         (D.IDPESSOA       IN (' +CmpRptCM.ParamByName('ListaIdEstab').asString+ ')) AND');
      Add('         (TD.IDDOCUMENTO    = D.IDDOCUMENTO)) MUNICIPAL');
      // ------------------------------------------------------------------------------- //
      Add('WHERE');

      // Estabelecimento selecionado
      if (CmpRptCM.ParamByName('ListaIdEstab').asString <> '') then
        Add('  (PJ.IDPESSOA      IN (' +CmpRptCM.ParamByName('ListaIdEstab').asString+ ')) AND')
      else
      begin
        // Estabelecimento(s) habilitados para o usuário
        if (CtrlUsoGeralRH.UsuXFilial <> '') then
          if (Pos(',', CtrlUsoGeralRH.UsuXFilial) > 0) then
            Add('  (PJ.IDPESSOA      IN ' +CtrlUsoGeralRH.UsuXFilial+ ') AND')
          else
            Add('  (PJ.IDPESSOA       = ' +CtrlUsoGeralRH.UsuXFilial+ ') AND');
      end;

      // Testa se o usuário quer somente PROVENTOS e DESCONTOS ou + OUTROS
      if (CmpRptCM.ParamByName('SelRubricaApoio').asBoolean) then
        Add('  (P.FLGDESCONTO     < 2) AND');

      // C. Custo(s) selecionado(s) - (Testa se está agrupando por Centro de Custo)
      if (CmpRptCM.ParamByName('AgruparPor').asInteger = 1) and
         (CmpRptCM.ParamByName('ListaCodCCusto').asString <> '') then
      begin
        if (Pos(',', CmpRptCM.ParamByName('ListaCodCCusto').asString) > 0) then
          Add('  (TRIM(CC.CODCENTROCUSTO) IN (' +CmpRptCM.ParamByName('ListaCodCCusto').asString+ ')) AND')
        else
          Add('  (TRIM(CC.CODCENTROCUSTO) = ' +CmpRptCM.ParamByName('ListaCodCCusto').asString+ ') AND');
      end;

      if (CmpRptCM.ParamByName('AgruparPor').asInteger = 1) then
        Add('  (CC.IDEMPRESA      = ' +CmpRptCM.ParamByName('IdEmpresa').asString+ ') AND');

      Add('  (PJ.IDPESSOA       = HIST.IDPESSOA) AND');
      Add('  (P.IDPROVENTO      = HIST.IDRUBRICA) AND');
      Add('  (PJ.IDPESSOA       = QTDE_FUNC.IDFILIALPESSOA) AND');
      Add('  (QTDE_FUNC.MES     = HIST.MES) AND');

      // Testa se está agrupando por Centro de Custo
      if (CmpRptCM.ParamByName('AgruparPor').asInteger = 1) then
      begin
        Add('  (CC.CODCENTROCUSTO = QTDE_FUNC.CODCENTROCUSTO) AND');
        Add('  (CC.CODCENTROCUSTO = HIST.CODCENTROCUSTO) AND');
      end;

      Add('  (PJ.IDPESSOA       = E.IDPESSOA) AND');
      Add('  (PJ.IDENDCOMERCIAL = E.IDENDERECO) AND');
      Add('  (E.IDCIDADES       = CIDADES.IDCIDADES) AND');
      Add('  (CIDADES.IDESTADO  = ES.IDESTADO) AND');
      Add('  (PJ.IDPESSOA       = ESTADUAL.IDPESSOA(+)) AND');
      Add('  (PJ.IDPESSOA       = MUNICIPAL.IDPESSOA(+))');
      Add('ORDER BY');

      if (CmpRptCM.ParamByName('AgruparPor').asInteger = 1) then
        Add('  NOMECENTROCUSTO, TIPOPROVDESC, RUBRICA')
      else
        Add('  TIPOPROVDESC, RUBRICA');
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
      Add('  PJ.RAZAOSOCIAL AS ESTAB,');
      Add('  DECODE(PJ.NUMDOCUMENTO,NULL,NULL, ''CNPJ: '' || PJ.NUMDOCUMENTO) AS CGC,');
      Add('  RTRIM(DECODE(RTRIM(ESTADUAL.NUMDOCUMENTO),NULL,');
      Add('    DECODE(RTRIM(MUNICIPAL.NUMDOCUMENTO),NULL,NULL,');
      Add('    ''Inscrição Municipal: '' || MUNICIPAL.NUMDOCUMENTO),');
      Add('    ''Inscrição Estadual: '' || ESTADUAL.NUMDOCUMENTO)) AS INSCRICAO,');
      Add('  RTRIM(E.LOGRADOURO) ||'', ''|| E.NUMERO ||');
      Add('    DECODE(E.COMPLEMENTO,NULL,NULL,'' - '' || RTRIM(E.COMPLEMENTO)) ||'' - ''||');
      Add('    RTRIM(E.BAIRRO) ||'' - ''|| RTRIM(CIDADES.NOME) || '' - CEP:'' ||');
      Add('    RTRIM(SUBSTR(E.CEP,1,5)) ||''-''|| RTRIM(SUBSTR(E.CEP,6,3)) AS ENDERECO,');
      Add('  ES.CODESTADO AS UF,');
      Add('  P.FLGDESCONTO AS TIPOPROVDESC,');
      Add('  HIST.DESCRPROVDESC AS RUBRICA,');
      Add('  HIST.CODPROVDESC AS CODRUBRICA,');
      Add('  HIST.MES AS MES_REF,');

      if (CmpRptCM.ParamByName('AgruparPor').asInteger = 1) then
        Add('  CC.NOME AS NOMECENTROCUSTO,');

      Add('  QTDE_FUNC.QTDE AS QTDE_FUNCIONARIOS,');
      Add('  HIST.VALOR');
      // ------------------------------------------------------------------------------- //
      Add('FROM');
      Add('  PESSOA PJ, ENDPESS E, PROVDESC P, CIDADES, ESTADO ES,'+
        FU.IFF((CmpRptCM.ParamByName('AgruparPor').asInteger = 1),' CENTCUST CC,',''));
      // ------------------------------------------------------------------------------- //
      // Total de funcionários que compuseram  a Folha
      if (CmpRptCM.ParamByName('AgruparPor').asInteger = 1) then // Agrupando por Centro de Custo
      begin
        Add('  (SELECT FP.IDFILIALPESSOA, PESSOAS.MES, CC.CODCENTROCUSTO, COUNT(PESSOAS.IDPESSOA) QTDE');
        Add('   FROM   CENTCUST CC, FILIALPESSOA FP,');
        // Pessoas para o período
        Add('     (SELECT F.IDESTAB, F.IDPESSOA, F.CODCENTROCUSTO, H.MES');
        Add('      FROM   HISTRUBSAL H, FUNCIONARIO F');
        Add('      WHERE');

        // Estabelecimento selecionado
        if (CmpRptCM.ParamByName('ListaIdEstab').asString <> '') then
          Add('        (F.IDESTAB   IN (' +CmpRptCM.ParamByName('ListaIdEstab').asString+ ')) AND')
        else
        begin
          // Estabelecimento(s) habilitados para o usuário
          if (CtrlUsoGeralRH.UsuXFilial <> '') then
            if (Pos(',', CtrlUsoGeralRH.UsuXFilial) > 0) then
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
            if (Pos(',', CtrlUsoGeralRH.UsuXCCusto) > 0) then
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

        Add('        ((H.MES       = ' +QuotedStr(Periodo[1])+ ') OR');
        Add('         (H.MES       = ' +QuotedStr(Periodo[2])+ ')) AND');

        if (CmpRptCM.ParamByName('ListaIdTipoFolha').asString <> '') then
          if (Pos(',', CmpRptCM.ParamByName('ListaIdTipoFolha').asString) > 0) then
            Add('        (H.IDMOTIVO  IN (' +CmpRptCM.ParamByName('ListaIdTipoFolha').asString+ ')) AND')
          else
            Add('        (H.IDMOTIVO   = ' +CmpRptCM.ParamByName('ListaIdTipoFolha').asString+ ') AND');

        Add('        (F.IDPESSOA   = H.IDPESSOA)');
        Add('      GROUP BY');
        Add('        F.IDESTAB, F.IDPESSOA, F.CODCENTROCUSTO, H.MES) PESSOAS');
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

        Add('     (CC.IDEMPRESA           = ' +CmpRptCM.ParamByName('IdEmpresa').asString+ ') AND');
        Add('     (PESSOAS.IDESTAB        = FP.IDFILIALPESSOA) AND');
        Add('     (PESSOAS.CODCENTROCUSTO = CC.CODCENTROCUSTO)');
        Add('   GROUP BY');
        Add('     CC.CODCENTROCUSTO, FP.IDFILIALPESSOA, PESSOAS.MES) QTDE_FUNC,');
      end
      else // Não Agrupando por Centro de Custo
      begin
        Add('  (SELECT FP.IDFILIALPESSOA, PESSOAS.MES, COUNT(PESSOAS.IDPESSOA) QTDE');
        Add('   FROM   FILIALPESSOA FP,');
        // Pessoas para o período
        Add('     (SELECT F.IDESTAB, F.IDPESSOA, H.MES');
        Add('      FROM   HISTRUBSAL H, FUNCIONARIO F');
        Add('      WHERE');

        // Estabelecimento selecionado
        if (CmpRptCM.ParamByName('ListaIdEstab').asString <> '') then
          Add('        (F.IDESTAB   IN (' +CmpRptCM.ParamByName('ListaIdEstab').asString+ ')) AND')
        else
        begin
          // Estabelecimento(s) habilitados para o usuário
          if (CtrlUsoGeralRH.UsuXFilial <> '') then
            if (Pos(',', CtrlUsoGeralRH.UsuXFilial) > 0) then
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
            if (Pos(',', CtrlUsoGeralRH.UsuXCCusto) > 0) then
              Add('        (TRIM(F.CODCENTROCUSTO) IN ' +CtrlUsoGeralRH.UsuXCCusto+ ') AND')
            else
              Add('        (TRIM(F.CODCENTROCUSTO)  = ' +CtrlUsoGeralRH.UsuXCCusto+ ') AND');
        end;

        // Rubrica(s) selecionada(s)
        if (CmpRptCM.ParamByName('ListaIdRubrica').asString <> '') then
          if (Pos(',',CmpRptCM.ParamByName('ListaIdRubrica').asString) > 0) then
            Add('        (H.CODPROVDESC    IN (' +CmpRptCM.ParamByName('ListaIdRubrica').asString+ ')) AND')
          else
            Add('        (H.CODPROVDESC     = ' +CmpRptCM.ParamByName('ListaIdRubrica').asString+ ') AND');

        Add('        ((H.MES       = ' +QuotedStr(Periodo[1])+ ') OR');
        Add('         (H.MES       = ' +QuotedStr(Periodo[2])+ ')) AND');

        if (CmpRptCM.ParamByName('ListaIdTipoFolha').asString <> '') then
          if (Pos(',', CmpRptCM.ParamByName('ListaIdTipoFolha').asString) > 0) then
            Add('        (H.IDMOTIVO  IN (' +CmpRptCM.ParamByName('ListaIdTipoFolha').asString+ ')) AND')
          else
            Add('        (H.IDMOTIVO   = ' +CmpRptCM.ParamByName('ListaIdTipoFolha').asString+ ') AND');

        Add('        (F.IDPESSOA   = H.IDPESSOA)');
        Add('      GROUP BY');
        Add('        F.IDESTAB, F.IDPESSOA, H.MES) PESSOAS');
        Add('   WHERE');
        Add('     (FP.IDFILIALPESSOA = PESSOAS.IDESTAB)');
        Add('   GROUP BY');
        Add('     FP.IDFILIALPESSOA, PESSOAS.MES) QTDE_FUNC,');
      end;
      // ------------------------------------------------------------------------------- //
      // Rubricas da Folha
      Add('  (SELECT');
      Add('     '+FU.IFF((CmpRptCM.ParamByName('AgruparPor').asInteger = 1),'F.CODCENTROCUSTO, ','')+
           'F.IDESTAB AS IDPESSOA, H.IDRUBRICA, RP.CODPROVDESC,');
      Add('     RP.DESCRPROVDESC, SUM(H.VALORPROVENTO) AS VALOR, H.MES');
      Add('   FROM HISTRUBSAL H, RUBRICAXPESS RP, FUNCIONARIO F');
      Add('   WHERE');

      Add('   (F.IDEMPRESA = ' +CmpRptCM.ParamByName('IdEmpresa').asString+ ') AND');
      Add('   (RP.IDPESSOA = ' +CmpRptCM.ParamByName('IdEmpresa').asString+ ') AND');

      // Estabelecimento selecionado
      if (CmpRptCM.ParamByName('ListaIdEstab').asString <> '') then
        Add('     (F.IDESTAB   IN (' +CmpRptCM.ParamByName('ListaIdEstab').asString+ ')) AND')
      else
      begin
        // Estabelecimento(s) habilitados para o usuário
        if (CtrlUsoGeralRH.UsuXFilial <> '') then
          if (Pos(',', CtrlUsoGeralRH.UsuXFilial) > 0) then
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
          Add('        (H.CODPROVDESC    IN (' +CmpRptCM.ParamByName('ListaIdRubrica').asString+ ')) AND')
        else
          Add('        (H.CODPROVDESC     = ' +CmpRptCM.ParamByName('ListaIdRubrica').asString+ ') AND');

      Add('     ((H.MES       = ' +QuotedStr(Periodo[1])+ ') OR');
      Add('      (H.MES       = ' +QuotedStr(Periodo[2])+ ')) AND');

      if (CmpRptCM.ParamByName('ListaIdTipoFolha').asString <> '') then
        if (Pos(',', CmpRptCM.ParamByName('ListaIdTipoFolha').asString) > 0) then
          Add('     (H.IDMOTIVO  IN (' +CmpRptCM.ParamByName('ListaIdTipoFolha').asString+ ')) AND')
        else
          Add('     (H.IDMOTIVO   = ' +CmpRptCM.ParamByName('ListaIdTipoFolha').asString+ ') AND');

      Add('     (RP.IDRUBRICA = H.IDRUBRICA) AND');
      Add('     (H.IDPESSOA   = F.IDPESSOA)');
      Add('   GROUP BY');

      Add('     ' +FU.IFF((CmpRptCM.ParamByName('AgruparPor').asInteger = 1),'F.CODCENTROCUSTO, ','')+
        'H.IDRUBRICA, F.IDESTAB, H.MES, RP.CODPROVDESC, RP.DESCRPROVDESC) HIST,');
      // ------------------------------------------------------------------------------- //
      // Inscrição Estadual
      Add('  (SELECT D.IDPESSOA, D.NUMDOCUMENTO');
      Add('   FROM   DOCPESSOA D, TIPODOCOFICIAL TD');
      Add('   WHERE (TD.SIGLADOCUMENTO = ''ESTADUAL:'') AND');
      Add('         (D.IDPESSOA       IN (' +CmpRptCM.ParamByName('ListaIdEstab').asString+ ')) AND');
      Add('         (TD.IDDOCUMENTO    = D.IDDOCUMENTO)) ESTADUAL,');
      // ------------------------------------------------------------------------------- //
      // Inscrição Municipal
      Add('  (SELECT D.IDPESSOA, D.NUMDOCUMENTO');
      Add('   FROM   DOCPESSOA D, TIPODOCOFICIAL TD');
      Add('   WHERE (TD.SIGLADOCUMENTO = ''MUNICIPAL:'') AND');
      Add('         (D.IDPESSOA       IN (' +CmpRptCM.ParamByName('ListaIdEstab').asString+ ')) AND');
      Add('         (TD.IDDOCUMENTO    = D.IDDOCUMENTO)) MUNICIPAL');
      // ------------------------------------------------------------------------------- //
      Add('WHERE');

      // Estabelecimento selecionado
      if (CmpRptCM.ParamByName('ListaIdEstab').asString <> '') then
        Add('  (PJ.IDPESSOA      IN (' +CmpRptCM.ParamByName('ListaIdEstab').asString+ ')) AND')
      else
      begin
        // Estabelecimento(s) habilitados para o usuário
        if (CtrlUsoGeralRH.UsuXFilial <> '') then
          if (Pos(',', CtrlUsoGeralRH.UsuXFilial) > 0) then
            Add('  (PJ.IDPESSOA      IN ' +CtrlUsoGeralRH.UsuXFilial+ ') AND')
          else
            Add('  (PJ.IDPESSOA       = ' +CtrlUsoGeralRH.UsuXFilial+ ') AND');
      end;

      // Testa se o usuário quer somente PROVENTOS e DESCONTOS ou + OUTROS
      if (CmpRptCM.ParamByName('SelRubricaApoio').asBoolean) then
        Add('  (P.FLGDESCONTO     < 2) AND');

      // C. Custo(s) selecionado(s) - (Testa se está agrupando por Centro de Custo)
      if (CmpRptCM.ParamByName('AgruparPor').asInteger = 1) and
         (CmpRptCM.ParamByName('ListaCodCCusto').asString <> '') then
      begin
        if (Pos(',', CmpRptCM.ParamByName('ListaCodCCusto').asString) > 0) then
          Add('  (TRIM(CC.CODCENTROCUSTO) IN (' +CmpRptCM.ParamByName('ListaCodCCusto').asString+ ')) AND')
        else
          Add('  (TRIM(CC.CODCENTROCUSTO) = ' +CmpRptCM.ParamByName('ListaCodCCusto').asString+ ') AND');
      end;

      if (CmpRptCM.ParamByName('AgruparPor').asInteger = 1) then
        Add('  (CC.IDEMPRESA      = ' +CmpRptCM.ParamByName('IdEmpresa').asString+ ') AND');

      Add('  (PJ.IDPESSOA       = HIST.IDPESSOA) AND');
      Add('  (P.IDPROVENTO      = HIST.IDRUBRICA) AND');
      Add('  (PJ.IDPESSOA       = QTDE_FUNC.IDFILIALPESSOA) AND');
      Add('  (QTDE_FUNC.MES     = HIST.MES) AND');

      // Testa se está agrupando por Centro de Custo
      if (CmpRptCM.ParamByName('AgruparPor').asInteger = 1) then
      begin
        Add('  (CC.CODCENTROCUSTO = QTDE_FUNC.CODCENTROCUSTO) AND');
        Add('  (CC.CODCENTROCUSTO = HIST.CODCENTROCUSTO) AND');
      end;

      Add('  (PJ.IDPESSOA       = E.IDPESSOA) AND');
      Add('  (PJ.IDENDCOMERCIAL = E.IDENDERECO) AND');
      Add('  (E.IDCIDADES       = CIDADES.IDCIDADES) AND');
      Add('  (CIDADES.IDESTADO  = ES.IDESTADO) AND');
      Add('  (PJ.IDPESSOA       = ESTADUAL.IDPESSOA(+)) AND');
      Add('  (PJ.IDPESSOA       = MUNICIPAL.IDPESSOA(+))');
      Add('ORDER BY');

      if (CmpRptCM.ParamByName('AgruparPor').asInteger = 1) then
        Add('  NOMECENTROCUSTO, TIPOPROVDESC, RUBRICA')
      else
        Add('  TIPOPROVDESC, RUBRICA');
      //SaveToFile('c:\qry.txt');
      SaveToFile(Sistema.RetornaCaminhoArquivos(Sistema.IdEmpresa)+'\qry.txt');//Ádler Teodoro de Souza SOL 109421 KINTANA 496332
    end;
  end;

  // Monta Query Principal
  GerarDadosRelat;
end;

procedure TRptResFolComp.CdsResFolCompBeforeOpen(DataSet: TDataSet);
begin
  frmAguarde.Pos := 0;
  rTotProv1 := 0;
  rTotProv2 := 0;
  rTotDesc1 := 0;
  rTotDesc2 := 0;
  rTotOutr1 := 0;
  rTotOutr2 := 0;
  rTotProvGrupo1 := 0;
  rTotProvGrupo2 := 0;
  rTotDescGrupo1 := 0;
  rTotDescGrupo2 := 0;
  rTotOutrGrupo1 := 0;
  rTotOutrGrupo2 := 0;
  bPrimeiraVez := true;
end;

procedure TRptResFolComp.CdsResFolCompAfterOpen(DataSet: TDataSet);
begin
  frmAguarde.Max := DataSet.RecordCount;
  frmAguarde.Min := 0;
end;

procedure TRptResFolComp.CdsResFolCompAfterScroll(DataSet: TDataSet);
begin
  frmAguarde.Pos := frmAguarde.Pos + 1;
  frmAguarde.Update;
end;

procedure TRptResFolComp.rpResFolCompGrpHdrBand1BeforePrint(Sender: TObject);
begin
  // Imprime o tipo de rubrica usada em cada grupo no SEU RODAPÉ
  if (CdsResFolComp.FieldByName('PROVENTODESCONTO').asString = 'PROVENTOS') then
  begin
    rpResFolCompTotProvDesc.Caption := 'TOTAL PROVENTOS:';
    rpResFolCompLine4.Visible := true;
  end
  else
  if (CdsResFolComp.FieldByName('PROVENTODESCONTO').asString = 'DESCONTOS') then
  begin
    rpResFolCompTotProvDesc.Caption := 'TOTAL DESCONTOS:';
    rpResFolCompLine4.Visible := true;
  end
  else
  begin
    rpResFolCompTotProvDesc.Caption := '';
    rpResFolCompLine4.Visible := false;
  end;
end;

procedure TRptResFolComp.rpResFolCompDtlBnd1AfterPrint(Sender: TObject);
begin
  if (CdsResFolComp.FieldByName('PROVENTODESCONTO').asString = 'OUTROS') and
     (CmpRptCM.ParamByName('ImprimeTotalUnico').asBoolean) then
  begin
    rTotOutrGrupo1 := rTotOutrGrupo1 + CdsResFolComp.FieldByName('VALOR1').asFloat;
    rTotOutrGrupo2 := rTotOutrGrupo2 + CdsResFolComp.FieldByName('VALOR2').asFloat;
  end;
end;

procedure TRptResFolComp.rpResFolCompGrpFootBnd1BeforePrint(Sender: TObject);
var
  rRub1, rRub2: real;
  sVarVal, sVarPerc: string;
begin
  if (CdsResFolComp.FieldByName('PROVENTODESCONTO').asString <> 'OUTROS') then
  begin
    rRub1 := rpResFolCompDBCalcVALOR1.Value;
    rRub2 := rpResFolCompDBCalcVALOR2.Value;

    CalcVariacao(rRub1, rRub2, sVarVal, sVarPerc);

    rpResFolCompLblPERC_VAR.Caption := sVarPerc;
    rpResFolCompLblVALOR_VAR.Caption := sVarVal;
  end;

  rpResFolCompDBCalcVALOR1.Visible :=
    (CdsResFolComp.FieldByName('PROVENTODESCONTO').asString <> 'OUTROS') and
    not(CmpRptCM.ParamByName('ImprimeTotalUnico').asBoolean);
  rpResFolCompDBCalcVALOR2.Visible := rpResFolCompDBCalcVALOR1.Visible;
  rpResFolCompLblPERC_VAR.Visible := rpResFolCompDBCalcVALOR1.Visible;
  rpResFolCompLblVALOR_VAR.Visible := rpResFolCompDBCalcVALOR1.Visible;
end;

procedure TRptResFolComp.rpResFolCompGrpFootBnd1AfterPrint(Sender: TObject);
begin
  // Acumula para o Totalizador
  if (CmpRptCM.ParamByName('AgruparPor').asInteger = 0) then
  begin
    if (CdsResFolComp.FieldByName('PROVENTODESCONTO').asString = 'PROVENTOS') then
    begin
      rTotProv1 := rpResFolCompDBCalcVALOR1.Value;
      rTotProv2 := rpResFolCompDBCalcVALOR2.Value;
    end
    else
    if (CdsResFolComp.FieldByName('PROVENTODESCONTO').asString = 'DESCONTOS') then
    begin
      rTotDesc1 := rpResFolCompDBCalcVALOR1.Value;
      rTotDesc2 := rpResFolCompDBCalcVALOR2.Value;
    end;
  end
  else
  begin
    if (CdsResFolComp.FieldByName('PROVENTODESCONTO').asString = 'PROVENTOS') then
    begin
      rTotProvGrupo1 := rpResFolCompDBCalcVALOR1.Value;
      rTotProvGrupo2 := rpResFolCompDBCalcVALOR2.Value;
    end
    else
    if (CdsResFolComp.FieldByName('PROVENTODESCONTO').asString = 'DESCONTOS') then
    begin
      rTotDescGrupo1 := rpResFolCompDBCalcVALOR1.Value;
      rTotDescGrupo2 := rpResFolCompDBCalcVALOR2.Value;
    end;

    if (bPrimeiraVez) then
    begin
      if (CdsResFolComp.FieldByName('PROVENTODESCONTO').asString = 'PROVENTOS') then
      begin
        rTotProv1 := rTotProv1 + rpResFolCompDBCalcVALOR1.Value;
        rTotProv2 := rTotProv2 + rpResFolCompDBCalcVALOR2.Value;
      end
      else
      if (CdsResFolComp.FieldByName('PROVENTODESCONTO').asString = 'DESCONTOS') then
      begin
        rTotDesc1 := rTotDesc1 + rpResFolCompDBCalcVALOR1.Value;
        rTotDesc2 := rTotDesc2 + rpResFolCompDBCalcVALOR2.Value;
      end;
    end;
  end;
end;

procedure TRptResFolComp.rpResFolCompGrpFootBnd0BeforePrint(Sender: TObject);
var
  sVarVal, sVarPerc: string;
begin
  if (CmpRptCM.ParamByName('ImprimeTotalUnico').asBoolean) then
  begin
    if (bPrimeiraVez) then
    begin
      rTotOutr1 := rTotOutr1 + rTotOutrGrupo1;
      rTotOutr2 := rTotOutr2 + rTotOutrGrupo2;
    end;

    rpResFolCompLblTOT_LIQ1.Caption :=
      FU.ValStr(rTotProvGrupo1 + rTotOutrGrupo1 - rTotDescGrupo1,12,2,true,',');
    rpResFolCompLblTOT_LIQ2.Caption :=
      FU.ValStr(rTotProvGrupo2 + rTotOutrGrupo2 - rTotDescGrupo2,12,2,true,',');

    CalcVariacao(rTotProvGrupo1 + rTotOutrGrupo1,
      rTotProvGrupo1 + rTotOutrGrupo2, sVarVal, sVarPerc);
    rpResFolCompLblTOT_PERC_VAR_PROV.Caption := sVarPerc;
    rpResFolCompLblTOT_VALOR_VAR_PROV.Caption := sVarVal;

    CalcVariacao(rTotProvGrupo1 + rTotOutrGrupo1 - rTotDescGrupo1,
      rTotProvGrupo2 + rTotOutrGrupo2 - rTotDescGrupo2, sVarVal, sVarPerc);
    rpResFolCompLblTOT_PERC_VAR_LIQ.Caption := sVarPerc;
    rpResFolCompLblTOT_VALOR_VAR_LIQ.Caption := sVarVal;
  end
  else
  begin
    rpResFolCompLblTOT_PROV1.Caption := FU.ValStr(rTotProvGrupo1,12,2,true,',');
    rpResFolCompLblTOT_DESC1.Caption := FU.ValStr(rTotDescGrupo1,12,2,true,',');
    rpResFolCompLblTOT_LIQ1.Caption := FU.ValStr(rTotProvGrupo1 - rTotDescGrupo1,12,2,true,',');

    rpResFolCompLblTOT_PROV2.Caption := FU.ValStr(rTotProvGrupo2,12,2,true,',');
    rpResFolCompLblTOT_DESC2.Caption := FU.ValStr(rTotDescGrupo2,12,2,true,',');
    rpResFolCompLblTOT_LIQ2.Caption := FU.ValStr(rTotProvGrupo2 - rTotDescGrupo2,12,2,true,',');

    CalcVariacao(rTotProvGrupo1, rTotProvGrupo2, sVarVal, sVarPerc);
    rpResFolCompLblTOT_PERC_VAR_PROV.Caption := sVarPerc;
    rpResFolCompLblTOT_VALOR_VAR_PROV.Caption := sVarVal;

    CalcVariacao(rTotProvGrupo1 - rTotDescGrupo1,
      rTotProvGrupo2 - rTotDescGrupo2, sVarVal, sVarPerc);
    rpResFolCompLblTOT_PERC_VAR_LIQ.Caption := sVarPerc;
    rpResFolCompLblTOT_VALOR_VAR_LIQ.Caption := sVarVal;
  end;

  CalcVariacao(rTotDescGrupo1, rTotDescGrupo2, sVarVal, sVarPerc);
  rpResFolCompLblTOT_PERC_VAR_DESC.Caption := sVarPerc;
  rpResFolCompLblTOT_VALOR_VAR_DESC.Caption := sVarVal;
end;

procedure TRptResFolComp.rpResFolCompGrpFootBnd0AfterPrint(Sender: TObject);
begin
  rTotProvGrupo1 := 0;
  rTotProvGrupo2 := 0;
  rTotDescGrupo1 := 0;
  rTotDescGrupo2 := 0;
  rTotOutrGrupo1 := 0;
  rTotOutrGrupo2 := 0;
end;

procedure TRptResFolComp.rpResFolCompSmryBnd1BeforePrint(Sender: TObject);
var
  sVarVal, sVarPerc: string;
begin
  rpResFolCompLblTOT_GERAL_PROV1.Caption := FU.ValStr(rTotProv1 + rTotOutr1,12,2,true,',');
  rpResFolCompLblTOT_GERAL_DESC1.Caption := FU.ValStr(rTotDesc1,12,2,true,',');
  rpResFolCompLblTOT_GERAL_LIQ1.Caption := FU.ValStr(rTotProv1 + rTotOutr1 - rTotDesc1,12,2,true,',');

  rpResFolCompLblTOT_GERAL_PROV2.Caption := FU.ValStr(rTotProv2 + rTotOutr2,12,2,true,',');
  rpResFolCompLblTOT_GERAL_DESC2.Caption := FU.ValStr(rTotDesc2,12,2,true,',');
  rpResFolCompLblTOT_GERAL_LIQ2.Caption := FU.ValStr(rTotProv2 + rTotOutr2 - rTotDesc2,12,2,true,',');

  CalcVariacao(rTotProv1 + rTotOutr1, rTotProv2 + rTotOutr2, sVarVal, sVarPerc);
  rpResFolCompLblTOT_GERAL_PERC_VAR_PROV.Caption := sVarPerc;
  rpResFolCompLblTOT_GERAL_VALOR_VAR_PROV.Caption := sVarVal;

  CalcVariacao(rTotDesc1, rTotDesc2, sVarVal, sVarPerc);
  rpResFolCompLblTOT_GERAL_PERC_VAR_DESC.Caption := sVarPerc;
  rpResFolCompLblTOT_GERAL_VALOR_VAR_DESC.Caption := sVarVal;

  CalcVariacao(rTotProv1 + rTotOutr1 - rTotDesc1,
    rTotProv2 + rTotOutr2 - rTotDesc2, sVarVal, sVarPerc);
  rpResFolCompLblTOT_GERAL_PERC_VAR_LIQ.Caption := sVarPerc;
  rpResFolCompLblTOT_GERAL_VALOR_VAR_LIQ.Caption := sVarVal;
end;

procedure TRptResFolComp.rpResFolCompSmryBnd1AfterPrint(Sender: TObject);
begin
  bPrimeiraVez := false;
  rpResFolCompGrpFootBnd0AfterPrint(Sender);
  frmAguarde.Apaga;
end;

procedure TRptResFolComp.GerarDadosRelat;
var
  c: byte;
  iNumRegistro: integer;
  PontoDePartida: TBookMark;
  ListaNumFuncCCusto, ListaNomeCCusto: TStringList;
  sCCusto, sQtdeFunc, sCodRubrica, sValResultVal, sValResultPerc: string;
begin
  dmCds.sql.Open;
  sqlResFolComp.Open;
  if not(dmCds.Cds.IsEmpty) then
  begin
    ListaNumFuncCCusto := TStringList.Create;
    ListaNomeCCusto := TStringList.Create;

    iNumRegistro := 0;
    sQtdeFunc := '';
    // Verifico o número de Funcionários em cada mês se o tipo de Relatório NÃO É AGRUPADO
    if (CmpRptCM.ParamByName('AgruparPor').asInteger = 0) then
    begin
      repeat
        if (Periodo[1] = dmCds.Cds.FieldByName('MES_REF').asString) then
        begin
          sQtdeFunc := IntToStr(dmCds.Cds.FieldByName('QTDE_FUNCIONARIOS').asInteger);
          break;
        end;
        dmCds.Cds.Next;
      until (dmCds.Cds.EOF);

      dmCds.Cds.First;
      repeat
        if (Periodo[2] = dmCds.Cds.FieldByName('MES_REF').asString) then
        begin
          sQtdeFunc := sQtdeFunc +' / '+
            IntToStr(dmCds.Cds.FieldByName('QTDE_FUNCIONARIOS').asInteger);
          break;
        end;
        dmCds.Cds.Next;
      until (dmCds.Cds.EOF);
    end
    else
    // Verifico o número de Funcionários em cada mês se o tipo de Relatório É AGRUPADO
    begin
      repeat
        sCCusto := dmCds.Cds.FieldByName('NOMECENTROCUSTO').asString;
        PontoDePartida := dmCds.Cds.GetBookmark;
        repeat
          if (Periodo[1] = dmCds.Cds.FieldByName('MES_REF').asString) then
          begin
            sQtdeFunc := IntToStr(dmCds.Cds.FieldByName('QTDE_FUNCIONARIOS').asInteger);
            break;
          end;
          dmCds.Cds.Next;
        until (sCCusto <> dmCds.Cds.FieldByName('NOMECENTROCUSTO').asString) or
              (dmCds.Cds.EOF);

        if (sQtdeFunc = '') then
          sQtdeFunc := '0';

        dmCds.Cds.GotoBookmark(PontoDePartida);

        repeat
          if (Periodo[2] = dmCds.Cds.FieldByName('MES_REF').asString) then
          begin
            sQtdeFunc := sQtdeFunc +' / '+
              IntToStr(dmCds.Cds.FieldByName('QTDE_FUNCIONARIOS').asInteger);
            break;
          end;
          dmCds.Cds.Next;
        until (sCCusto <> dmCds.Cds.FieldByName('NOMECENTROCUSTO').asString) or
              (dmCds.Cds.EOF);

        if (Pos('/',sQtdeFunc) = 0) then
          sQtdeFunc := sQtdeFunc + ' / 0';

        ListaNomeCCusto.Add(sCCusto);
        ListaNumFuncCCusto.Add(sQtdeFunc);

        repeat
          dmCds.Cds.Next;
        until (sCCusto <> dmCds.Cds.FieldByName('NOMECENTROCUSTO').asString) or
              (dmCds.Cds.EOF);

        sQtdeFunc := '';
      until (dmCds.Cds.EOF);

      dmCds.Cds.FreeBookmark(PontoDePartida);
    end;

    dmCds.Cds.First;
    repeat
      Inc(iNumRegistro);
      CdsResFolComp.Insert;
      CdsResFolComp.FieldByName('ESTAB').asString := dmCds.Cds.FieldByName('ESTAB').asString;
      CdsResFolComp.FieldByName('CGC').asString := dmCds.Cds.FieldByName('CGC').asString;
      CdsResFolComp.FieldByName('INSCRICAO').asString := dmCds.Cds.FieldByName('INSCRICAO').asString;
      CdsResFolComp.FieldByName('ENDERECO').asString := dmCds.Cds.FieldByName('ENDERECO').asString;
      CdsResFolComp.FieldByName('UF').asString := dmCds.Cds.FieldByName('UF').asString;
      CdsResFolComp.FieldByName('NUM_REGISTRO').asInteger := iNumRegistro;

      if (CmpRptCM.ParamByName('AgruparPor').asInteger = 1) then
        CdsResFolComp.FieldByName('NOMECENTROCUSTO').asString := dmCds.Cds.FieldByName('NOMECENTROCUSTO').asString;

      case (dmCds.Cds.FieldByName('TIPOPROVDESC').asInteger) of
        0 :  CdsResFolComp.FieldByName('PROVENTODESCONTO').asString := 'PROVENTOS';
        1 :  CdsResFolComp.FieldByName('PROVENTODESCONTO').asString := 'DESCONTOS';
        else CdsResFolComp.FieldByName('PROVENTODESCONTO').asString := 'OUTROS';
      end;

      CdsResFolComp.FieldByName('TIPOPROVDESC').asInteger := dmCds.Cds.FieldByName('TIPOPROVDESC').asInteger;
      CdsResFolComp.FieldByName('CODRUBRICA').asString := dmCds.Cds.FieldByName('CODRUBRICA').asString;
      CdsResFolComp.FieldByName('RUBRICA').asString := dmCds.Cds.FieldByName('RUBRICA').asString;

      if (CmpRptCM.ParamByName('AgruparPor').asInteger = 0) then
        CdsResFolComp.FieldByName('QTDE_FUNCIONARIOS').asString := sQtdeFunc
      else
        CdsResFolComp.FieldByName('QTDE_FUNCIONARIOS').asString := ListaNumFuncCCusto[
          ListaNomeCCusto.IndexOf (dmCds.Cds.FieldByName('NOMECENTROCUSTO').asString)];

      // "Pego" os meses correspondentes e os atribuo à REFERÊNCIA1 e REFERÊNCIA2
      sCodRubrica := dmCds.Cds.FieldByName('CODRUBRICA').asString;
      for c:=1 to 2 do
      begin
        CdsResFolComp.FieldByName('MES_REF'+IntToStr(c)).asString :=
          Copy(Periodo[c],6,2) +'/'+ Copy(Periodo[c],1,4);

        if (Periodo[1] <> dmCds.Cds.FieldByName('MES_REF').asString) and (c = 1) then
          CdsResFolComp.FieldByName('VALOR1').asInteger := 0
        else
        if (sCodRubrica = dmCds.Cds.FieldByName('CODRUBRICA').asString) then
        begin
          if (Periodo[2] <> dmCds.Cds.FieldByName('MES_REF').asString) and (c = 2) then
            CdsResFolComp.FieldByName('VALOR2').asInteger := 0
          else
          begin
            CdsResFolComp.FieldByName('VALOR'+IntToStr(c)).asFloat := dmCds.Cds.FieldByName('VALOR').asFloat;
            dmCds.Cds.Next;
          end;
        end
        else
          CdsResFolComp.FieldByName('VALOR2').asInteger := 0;
      end;

      // Calcula a Variação
      CalcVariacao(CdsResFolComp.FieldByName('VALOR1').asFloat,
                   CdsResFolComp.FieldByName('VALOR2').asFloat,
                   sValResultVal, sValResultPerc);

      CdsResFolComp.FieldByName('VALOR_VAR').asString := sValResultVal;
      sValResultVal := FU.ValidaCaracteres(sValResultVal, 'N', '');
      CdsResFolComp.FieldByName('VALOR_VAR_NUM').asFloat := FU.StringToFloat(sValResultVal);

      CdsResFolComp.FieldByName('PERC_VAR').asString := sValResultPerc;
      if (sValResultPerc = '-') then
        sValResultPerc := ''
      else
        sValResultPerc := FU.ValidaCaracteres(sValResultPerc, 'N', '');

      CdsResFolComp.FieldByName('PERC_VAR_NUM').asFloat := FU.StringToFloat(sValResultPerc);

      CdsResFolComp.Post;
    until (dmCds.Cds.EOF);

    // ------------------------------------------------------------------------
    // Faço as modificações no Layout do Relatório conforme opções selecionadas
    // ------------------------------------------------------------------------
    ConfigLayoutRelatorio;

    ListaNumFuncCCusto.Free;
    ListaNomeCCusto.Free;
  end
  else
  begin
    CdsResFolComp.Insert;
    CdsResFolComp.Post;
  end;
  CdsResFolComp.First;
end;

procedure TRptResFolComp.ConfigLayoutRelatorio;
begin
  if (CmpRptCM.ParamByName('AgruparPor').asInteger = 0) then
  begin
    rpResFolCompLine1.Top := 40.746;
    rpResFolCompLine2.Pen.Width := 2;
    rpResFolCompHdrBnd1.Height := 41.275;
  end
  else
  begin
    rpResFolCompLine1.Top := 33.1;
    rpResFolCompLine2.Pen.Width := 1;
    rpResFolCompHdrBnd1.Height := 33.629;
  end;

  rpResFolCompGrpHdrBnd0.Visible := (CmpRptCM.ParamByName('AgruparPor').asInteger = 1);
  rpResFolCompGrpFootBnd0.Visible := rpResFolCompGrpHdrBnd0.Visible;
  rpResFolCompLine4.Visible := (CmpRptCM.ParamByName('AgruparPor').asInteger = 0);

  rpResFolCompLbl7.Visible := rpResFolCompLine4.Visible;
  rpResFolCompLbl8.Visible := rpResFolCompLine4.Visible;
  rpResFolCompLbl9.Visible := rpResFolCompLine4.Visible;
  rpResFolCompLbl10.Visible := rpResFolCompLine4.Visible;
  rpResFolCompLbl11.Visible := rpResFolCompLine4.Visible;
  rpResFolCompLbl12.Visible := rpResFolCompLine4.Visible;
  rpResFolCompLbl13.Visible := rpResFolCompLine4.Visible;
  rpResFolCompLbl14.Visible := rpResFolCompLine4.Visible;

  rpResFolCompDBTxt7.Visible := rpResFolCompLine4.Visible;
  rpResFolCompDBTxt8.Visible := rpResFolCompLine4.Visible;

  if (CmpRptCM.ParamByName('ImprimeTotalUnico').asBoolean) then
  begin
    rpResFolCompGrpFootBnd0.Height := 7.408;
    rpResFolCompSmryBnd1.Height := 15.081;

    rpResFolCompLbl27.Caption := 'TOTAL:';
    rpResFolCompLbl27.Top := 2.117;
    rpResFolCompLine5.Top := 0;
    rpResFolCompLblTOT_LIQ1.Top := 2.117;
    rpResFolCompLblTOT_LIQ2.Top := 2.117;
    rpResFolCompLblTOT_PERC_VAR_LIQ.Top := 2.117;
    rpResFolCompLblTOT_VALOR_VAR_LIQ.Top := 2.117;

    rpResFolCompLbl30.Caption := 'TOTAL GERAL:';
    rpResFolCompLbl30.Top := 9.525;
    rpResFolCompLblTOT_GERAL_LIQ1.Top := 9.525;
    rpResFolCompLblTOT_GERAL_LIQ2.Top := 9.525;
    rpResFolCompLblTOT_GERAL_PERC_VAR_LIQ.Top := 9.525;
    rpResFolCompLblTOT_GERAL_VALOR_VAR_LIQ.Top := 9.525;
  end
  else
  begin
    rpResFolCompGrpFootBnd0.Height := 20.638;
    rpResFolCompSmryBnd1.Height := 28.84;

    rpResFolCompLbl27.Caption := 'TOTAL LÍQUIDO:';
    rpResFolCompLbl27.Top := 15.081;
    rpResFolCompLine5.Top := 12.7;
    rpResFolCompLblTOT_LIQ1.Top := 15.081;
    rpResFolCompLblTOT_LIQ2.Top := 15.081;
    rpResFolCompLblTOT_PERC_VAR_LIQ.Top := 15.081;
    rpResFolCompLblTOT_VALOR_VAR_LIQ.Top := 15.081;

    rpResFolCompLbl30.Caption := 'TOTAL GERAL LÍQUIDO:';
    rpResFolCompLbl30.Top := 22.49;
    rpResFolCompLblTOT_GERAL_DESC1.Top := 15.081;
    rpResFolCompLblTOT_GERAL_DESC2.Top := 15.081;
    rpResFolCompLblTOT_GERAL_PERC_VAR_DESC.Top := 15.081;
    rpResFolCompLblTOT_GERAL_VALOR_VAR_DESC.Top := 15.081;

    rpResFolCompLine7.Top := 20.638;
    rpResFolCompLbl29.Top := 15.081;
    rpResFolCompLbl26.Top := 7.144;

    rpResFolCompLblTOT_DESC1.Top := 7.144;
    rpResFolCompLblTOT_DESC2.Top := 7.144;
    rpResFolCompLblTOT_PERC_VAR_DESC.Top := 7.144;
    rpResFolCompLblTOT_VALOR_VAR_DESC.Top := 7.144;

    rpResFolCompLblTOT_GERAL_LIQ1.Top := 22.49;
    rpResFolCompLblTOT_GERAL_LIQ2.Top := 22.49;
    rpResFolCompLblTOT_GERAL_PERC_VAR_LIQ.Top := 22.49;
    rpResFolCompLblTOT_GERAL_VALOR_VAR_LIQ.Top := 22.49;

    rpResFolCompLine3.Top := 0.529;
    rpResFolCompLine3.Left := 2.381;
    rpResFolCompTotProvDesc.Top := 1.852;
    rpResFolCompTotProvDesc.Left := 2.381;
    rpResFolCompDBCalcVALOR1.Top := 2.117;
    rpResFolCompDBCalcVALOR1.Left := 93.134;
    rpResFolCompDBCalcVALOR2.Top := 2.117;
    rpResFolCompDBCalcVALOR2.Left := 122.238;
    rpResFolCompLblPERC_VAR.Top := 2.117;
    rpResFolCompLblPERC_VAR.Left := 152.136;
    rpResFolCompLblVALOR_VAR.Top := 2.117;
    rpResFolCompLblVALOR_VAR.Left := 173.567;
  end;

  rpResFolCompLine3.Visible := not(CmpRptCM.ParamByName('ImprimeTotalUnico').asBoolean);
  rpResFolCompTotProvDesc.Visible := rpResFolCompLine3.Visible;
  rpResFolCompLbl25.Visible := rpResFolCompLine3.Visible;
  rpResFolCompLbl26.Visible := rpResFolCompLine3.Visible;
  rpResFolCompLbl28.Visible := rpResFolCompLine3.Visible;
  rpResFolCompLbl29.Visible := rpResFolCompLine3.Visible;

  rpResFolCompLblTOT_PROV1.Visible := rpResFolCompLine3.Visible;
  rpResFolCompLblTOT_DESC1.Visible := rpResFolCompLine3.Visible;
  rpResFolCompLblTOT_PROV2.Visible := rpResFolCompLine3.Visible;
  rpResFolCompLblTOT_DESC2.Visible := rpResFolCompLine3.Visible;
  rpResFolCompLblTOT_PERC_VAR_PROV.Visible := rpResFolCompLine3.Visible;
  rpResFolCompLblTOT_PERC_VAR_DESC.Visible := rpResFolCompLine3.Visible;
  rpResFolCompLblTOT_VALOR_VAR_PROV.Visible := rpResFolCompLine3.Visible;
  rpResFolCompLblTOT_VALOR_VAR_DESC.Visible := rpResFolCompLine3.Visible;
  rpResFolCompLblTOT_GERAL_PROV1.Visible := rpResFolCompLine3.Visible;
  rpResFolCompLblTOT_GERAL_DESC1.Visible := rpResFolCompLine3.Visible;
  rpResFolCompLblTOT_GERAL_PROV2.Visible := rpResFolCompLine3.Visible;
  rpResFolCompLblTOT_GERAL_DESC2.Visible := rpResFolCompLine3.Visible;
  rpResFolCompLblTOT_GERAL_PERC_VAR_PROV.Visible := rpResFolCompLine3.Visible;
  rpResFolCompLblTOT_GERAL_PERC_VAR_DESC.Visible := rpResFolCompLine3.Visible;
  rpResFolCompLblTOT_GERAL_VALOR_VAR_PROV.Visible := rpResFolCompLine3.Visible;
  rpResFolCompLblTOT_GERAL_VALOR_VAR_DESC.Visible := rpResFolCompLine3.Visible;
  rpResFolCompLine7.Visible := rpResFolCompLine3.Visible;

  rpResFolCompLblTipoPag.Caption := CmpRptCM.ParamByName('ListaNomeTipoFolha').asString;

  rpResFolCompLbl9.Top := 32.279;
  rpResFolCompLbl10.Top := rpResFolCompLbl9.Top;
  rpResFolCompLbl11.Top := rpResFolCompLbl9.Top;
  rpResFolCompLbl13.Top := rpResFolCompLbl9.Top;
  rpResFolCompLbl7.Top := 36.248;
  rpResFolCompLbl8.Top := rpResFolCompLbl7.Top;
  rpResFolCompLbl12.Top := rpResFolCompLbl7.Top;
  rpResFolCompLbl14.Top := rpResFolCompLbl7.Top;
  rpResFolCompDBTxt7.Top := rpResFolCompLbl7.Top;
  rpResFolCompDBTxt8.Top := rpResFolCompLbl7.Top;
end;

procedure TRptResFolComp.CalcVariacao(Val1, Val2: real; var ValResultVal, ValResultPerc: string);
var
  rVariacao: real;
begin
  // Calcula Variação em Valor
  rVariacao := Val2 - Val1;

  // Calcula Variação em Percentual
  if (Val1 > 0) then
    ValResultPerc := FU.IFF(rVariacao > 0,'+','') +
      FU.ValStr(((rVariacao * 100) / Val1),12,2,true,',') + ' %'
  else
    ValResultPerc := '-';

  // Retorna a variação em Valor
  ValResultVal := FU.IFF(rVariacao > 0,'+','') + FU.ValStr(rVariacao,12,2,true,',');
end;

end.
