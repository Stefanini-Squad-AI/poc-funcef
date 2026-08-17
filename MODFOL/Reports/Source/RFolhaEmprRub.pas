// *****************************************************************************
// ***************************** REGISTRO DE ALTERAÇÕES ************************
// *****************************************************************************
// Autor(a)    :  Arnaldo Vicente Scarin
// Data        :  26/02/2009
// Pendência   :  SOL 98241 KTN: 492499
// Descricao   :  Alteração da consulta do relatório, para que possa ser mostrado
//                corretamente o local de trabalho, em detrimento da data de
//                execução do relatório               
//------------------------------------------------------------------------------
// Autor(a)    :  Ádler Teodoro de Souza
// Data        :  19/02/2009
// Pendência   :  SOL 109421 KINTANA 496332
// Descricao   :  Alteração de gravação de arquivos de log na raiz do disco C: .
//------------------------------------------------------------------------------
unit RFolhaEmprRub;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs, FCmReport,
  uCmRptManager, TXComp, CmParamReport, Db, DBClient, uCMClientDataSet, uCmSqlParams, ppDB,
  ppDBPipe, ppDBBDE, ppCtrls, ppBands, ppClass, ppVar, ppPrnabl, ppCache, ppComm, ppRelatv,
  ppProd, ppReport, ppTypes, TXRB, ppModule, daDataModule;

type
  TRptFolhaEmprRub = class(TFrmCmReport)
    rpFolhaEmprRub: TppReport;
    rpFolhaEmprRubHdrBnd: TppHeaderBand;
    rpFolhaEmprRubDBLbl2: TppLabel;
    rpFolhaEmprRubDBLbl4: TppLabel;
    rpFolhaEmprRubDBLbl5: TppLabel;
    rpFolhaEmprRubDBLbl1: TppLabel;
    rpFolhaEmprRubDBLbl3: TppLabel;
    rpFolhaEmprRubDBTxt1: TppDBText;
    rpFolhaEmprRubDBTxt2: TppDBText;
    rpFolhaEmprRubDBTxt4: TppDBText;
    rpFolhaEmprRubDBTxt3: TppDBText;
    rpFolhaEmprRubDBTxt5: TppDBText;
    rpFolhaEmprRubSysVar1: TppSystemVariable;
    rpFolhaEmprRubSysVar2: TppSystemVariable;
    rpFolhaEmprRubDtlBnd: TppDetailBand;
    rpFolhaEmprRubDBTxt10: TppDBText;
    rpFolhaEmprRubDBTxt11: TppDBText;
    rpFolhaEmprRubDBTxt12: TppDBText;
    rpFolhaEmprRubFootBnd: TppFooterBand;
    rpFolhaEmprRubSmryBnd: TppSummaryBand;
    rpFolhaEmprRubGrp2: TppGroup;
    rpFolhaEmprRubGrpHdrBnd1: TppGroupHeaderBand;
    rpFolhaEmprRubShape1: TppShape;
    rpFolhaEmprRubDBTxt6: TppDBText;
    rpFolhaEmprRubDBTxt7: TppDBText;
    rpFolhaEmprRubLine1: TppLine;
    rpFolhaEmprRubLbl7: TppLabel;
    rpFolhaEmprRubLbl6: TppLabel;
    rpFolhaEmprRubLbl8: TppLabel;
    rpFolhaEmprRubLbl16: TppLabel;
    rpFolhaEmprRubLbl17: TppLabel;
    rpFolhaEmprRubGrpFootBnd1: TppGroupFooterBand;
    rpFolhaEmprRubLine4: TppLine;
    rpFolhaEmprRubLbl15: TppLabel;
    rpFolhaEmprRubDBCalc4: TppDBCalc;
    rpFolhaEmprRubLbl14: TppLabel;
    rpFolhaEmprRubDBCalc3: TppDBCalc;
    rpFolhaEmprRubGrp1: TppGroup;
    rpFolhaEmprRubGrpHdrBnd2: TppGroupHeaderBand;
    rpFolhaEmprRubShape2: TppShape;
    rpFolhaEmprRubDBTxt8: TppDBText;
    rpFolhaEmprRubDBTxt9: TppDBText;
    rpFolhaEmprRubLbl9: TppLabel;
    rpFolhaEmprRubLbl10: TppLabel;
    rpFolhaEmprRubLbl11: TppLabel;
    rpFolhaEmprRubLine2: TppLine;
    rpFolhaEmprRubGrpFootBnd2: TppGroupFooterBand;
    rpFolhaEmprRubDBTxt13: TppDBText;
    rpFolhaEmprRubDBTxt14: TppDBText;
    rpFolhaEmprRubLbl13: TppLabel;
    rpFolhaEmprRubDBCalc2: TppDBCalc;
    rpFolhaEmprRubDBCalc1: TppDBCalc;
    rpFolhaEmprRubLbl12: TppLabel;
    rpFolhaEmprRubLine3: TppLine;
    ppFolhaEmprRub: TppBDEPipeline;
    dsFolhaEmprRub: TDataSource;
    sqlFolhaEmprRub: TCMSqlParams;
    CdsFolhaEmprRub: TCMClientDataSet;
    rpFolhaEmprRubLblPROCESSO: TppLabel;
    rpFolhaEmprRubLbl20: TppLabel;
    ppDBText1: TppDBText;
    ppLabel2: TppLabel;
    daDataModule1: TdaDataModule;
    procedure CrmRptCMBeforePrint(Sender: TObject);
    procedure CdsFolhaEmprRubAfterScroll(DataSet: TDataSet);
    procedure rpFolhaEmprRubSmryBndAfterPrint(Sender: TObject);
    procedure rpFolhaEmprRubGrpHdrBnd1AfterPrint(Sender: TObject);
    procedure rpFolhaEmprRubLblPROCESSOPrint(Sender: TObject);
  end;

var
  RptFolhaEmprRub: TRptFolhaEmprRub;

implementation

uses fAguarde, uCtrlFuncoesRH, uCtrlUsoGeralRH, uModulo;

{$R *.DFM}

procedure TRptFolhaEmprRub.CrmRptCMBeforePrint(Sender: TObject);
var
  iMes, iAno: integer;
begin
  inherited;
  iMes := CmpRptCM.ParamByName('MesRef').asInteger;
  iAno := CmpRptCM.ParamByName('AnoRef').asInteger;

  rpFolhaEmprRubDBTxt2.Visible := Pos(',', CmpRptCM.ParamByName('ListaIdEstab').asString) = 0;
  rpFolhaEmprRubDBTxt3.Visible := Pos(',', CmpRptCM.ParamByName('ListaIdEstab').asString) = 0;
  rpFolhaEmprRubDBLbl2.Visible := Pos(',', CmpRptCM.ParamByName('ListaIdEstab').asString) = 0;
  rpFolhaEmprRubDBTxt4.Visible := Pos(',', CmpRptCM.ParamByName('ListaIdEstab').asString) = 0;

  with (sqlFolhaEmprRub.SQL) do
  begin
    Clear;

    // Alterado por Arnaldo V. Scarin em 26/02/2008 - SOL 98241 KTN: 492499
    if (CmpRptCM.ParamByName('BuscaHist').asBoolean) then
    begin
      Add('SELECT EMPRESA,CGC,UF,ENDERECO,COD_RUBRICA,NOME_RUBRICA,MES_REF,SEQRUBRICA,REFERENCIA,VALOR');
      Add('      ,MATRICULA,FUNCIONARIO');
      Add('      ,DECODE(HST_CODCENTROCUSTO,NULL,M.CODCENTROCUSTO,HST_CODCENTROCUSTO) AS CODCENTROCUSTO');
      Add('      ,CC.NOME AS NOMECENTROCUSTO,CARGO,NIVEL');
      if (CmpRptCM.ParamByName('Ordenacao').asInteger = 8) then // Agrupar por Programa
        Add('  ,CODPROGRAMA,DESCPROGRAMA');
      Add('from (');
    end;
    // Fim Alteração

    Add('SELECT DISTINCT');
    // Dados do Estabelecimento
    Add('  PJ.RAZAOSOCIAL  AS EMPRESA,');
    Add('  (''CNPJ: '' || PJ.NUMDOCUMENTO) AS CGC,');
    Add('  ES.CODESTADO AS UF,');
    Add('  RTRIM(E.LOGRADOURO) ||'', ''|| E.NUMERO || DECODE(E.COMPLEMENTO,'' '','' - '' ||');
    Add('    RTRIM(E.COMPLEMENTO)) ||'' - ''|| RTRIM(E.BAIRRO) ||'' - ''|| RTRIM(CIDADES.NOME) ||');
    Add('    '' - CEP: '' || RTRIM(SUBSTR(E.CEP,1,5)) ||''-''|| RTRIM(SUBSTR(E.CEP,6,3)) AS ENDERECO,');
    // Dados da Rubrica
    Add('  RP.CODPROVDESC AS COD_RUBRICA,');
    Add('  PD.DESCRICAO AS NOME_RUBRICA,');
    Add('  ('+QuotedStr(FU.MesExtensoAno(CmpRptCM.ParamByName('AnoRef').asString +'/'+
      FU.PoeZero(CmpRptCM.ParamByName('MesRef').asInteger)))+') AS MES_REF,');
    Add('  H.SEQRUBRICA, H.REFERENCIA,');
    Add('  H.VALORPROVENTO AS VALOR,');
    // Dados do Funcionário
    Add('  F.MATRICULA,');
    Add('  UPPER(PF.NOME) AS FUNCIONARIO,');

    // Alterado por Arnaldo V. Scarin em 26/02/2008 - SOL 98241 KTN: 492499
    if (CmpRptCM.ParamByName('BuscaHist').asBoolean) then
    begin
      Add('  (Select codcentrocusto from (Select idPessoa,codcentrocusto,dataalterfunc from evolfunc');
      Add('                               where dataalterfunc < to_date('+
              QuotedStr(IntToStr(FU.TrazUltDiaMes(iMes, iAno)) +'/'+ FU.PoeZero(iMes) +'/'+
              IntToStr(iAno))+ ',''DD/MM/YYYY'')');
      Add('                                 and idpessoa = IDPESSOA order by dataalterfunc desc)');
      Add('   where idPessoa = F.Idpessoa and rownum = 1) as HST_CODCENTROCUSTO,');
    end;
    // Fim Alteração

    Add('  CC.CODCENTROCUSTO,');
    Add('  CC.NOME AS NOMECENTROCUSTO');

    if (Modulo.IdContraCheque = FUNCEF) then
    begin
      if (CmpRptCM.ParamByName('BuscaHist').asBoolean) then
      begin
        Add('  ,C.TITULO AS CARGO,');
        Add('  CASE WHEN DECODE(HST.SALARIO, NULL, F.SALARIOATUAL, HST.SALARIO)<=FX.STEP1 THEN ''1''');
        Add('       WHEN DECODE(HST.SALARIO, NULL, F.SALARIOATUAL, HST.SALARIO)<=FX.STEP2 THEN ''2''');
        Add('       WHEN DECODE(HST.SALARIO, NULL, F.SALARIOATUAL, HST.SALARIO)<=FX.STEP3 THEN ''3''');
        Add('       WHEN DECODE(HST.SALARIO, NULL, F.SALARIOATUAL, HST.SALARIO)<=FX.STEP4 THEN ''4''');
        Add('       WHEN DECODE(HST.SALARIO, NULL, F.SALARIOATUAL, HST.SALARIO)<=FX.STEP5 THEN ''5''');
        Add('       ELSE ''6''');
        Add('  END AS NIVEL');
      end
      else
      begin
        Add('  ,C.TITULO AS CARGO,');
        Add('  CASE WHEN F.SALARIOATUAL<=FX.STEP1 THEN ''1''');
        Add('       WHEN F.SALARIOATUAL<=FX.STEP2 THEN ''2''');
        Add('       WHEN F.SALARIOATUAL<=FX.STEP3 THEN ''3''');
        Add('       WHEN F.SALARIOATUAL<=FX.STEP4 THEN ''4''');
        Add('       WHEN F.SALARIOATUAL<=FX.STEP5 THEN ''5''');
        Add('       ELSE ''6''');
        Add('  END AS NIVEL');
      end;
    end;

    if (CmpRptCM.ParamByName('Ordenacao').asInteger = 8) then // Agrupar por Programa
      Add('  ,PG.CODPROGRAMA ,PG.DESCPROGRAMA');

    Add('FROM');
    Add('  ' +CmpRptCM.ParamByName('NomeTabela').asString+ ' H, PESSOA PJ, PESSOA PF, ENDPESS E,');

    if (Modulo.IdContraCheque = FUNCEF) then
      Add('  CARGO C, FAIXASAL FX,');

    Add('  PROVDESC PD, RUBRICAXPESS RP, FUNCIONARIO F, CIDADES, ESTADO ES, CENTCUST CC,');

    if (CmpRptCM.ParamByName('BuscaHist').asBoolean) then
    begin
      Add('  FILIALPESSOA FP,' +
        // Agrupar por Programa
        FU.IFF(CmpRptCM.ParamByName('Ordenacao').asInteger = 8,' PROGRAMA PG,',''));

      // Última evolução Funcional do Funcionário
      // --------------------------------------------------------------------------------------
      Add('  (SELECT EF.SALARIO, EF.IDCARGO, EF.IDPESSOA, EF.IDEMPRESA, EF.CODCENTROCUSTO');
      Add('   FROM   EVOLFUNC EF,');
      Add('          (SELECT MAX(DATAALTERFUNC) AS DATAALTERFUNC, IDPESSOA');
      Add('           FROM   EVOLFUNC');
      Add('           WHERE  (DATAALTERFUNC <= TO_DATE('+
        QuotedStr(IntToStr(FU.TrazUltDiaMes(iMes, iAno)) +'/'+ FU.PoeZero(iMes) +'/'+
        IntToStr(iAno))+ ',''DD/MM/YYYY''))');
      Add('           GROUP BY IDPESSOA) HST2,');
      Add('          (SELECT MAX(TRGDTINCLUSAO) AS DATAINCLUSAO, IDPESSOA');
      Add('           FROM   EVOLFUNC');
      Add('           WHERE  (DATAALTERFUNC <= TO_DATE('+
        QuotedStr(IntToStr(FU.TrazUltDiaMes(iMes, iAno)) +'/'+ FU.PoeZero(iMes) +'/'+
        IntToStr(iAno))+ ',''DD/MM/YYYY''))');
      Add('           GROUP BY IDPESSOA) HST3');
      Add('    WHERE  (EF.DATAALTERFUNC = HST2.DATAALTERFUNC) AND');
      Add('           (EF.IDPESSOA      = HST2.IDPESSOA) AND');
      Add('           (EF.TRGDTINCLUSAO = HST3.DATAINCLUSAO) AND');
      Add('           (EF.IDPESSOA      = HST3.IDPESSOA)) HST');
    end
    else
      Add('  FILIALPESSOA FP' +
        // Agrupar por Programa
        FU.IFF(CmpRptCM.ParamByName('Ordenacao').asInteger = 8,', PROGRAMA PG',''));
    // -----------------------------------------------------------------------
    Add('WHERE');
    Add('  (RP.IDPESSOA       = ' +CmpRptCM.ParamByName('IdEmpresa').asString+ ') AND');
    Add('  (PJ.IDPESSOA      IN (' +CmpRptCM.ParamByName('ListaIdEstab').asString+ ')) AND');

    // Rubrica(s) selecionada(s)
    if (CmpRptCM.ParamByName('ListaIdRubrica').asString <> '') then
      if (Pos(',', CmpRptCM.ParamByName('ListaIdRubrica').asString) > 0) then
      begin
        Add('  (H.CODPROVDESC    IN (' +CmpRptCM.ParamByName('ListaIdRubrica').asString+ ')) AND');
        Add('  (RP.CODPROVDESC   IN (' +CmpRptCM.ParamByName('ListaIdRubrica').asString+ ')) AND');
      end
      else
      begin
        Add('  (H.CODPROVDESC     = ' +CmpRptCM.ParamByName('ListaIdRubrica').asString+ ') AND');
        Add('  (RP.CODPROVDESC    = ' +CmpRptCM.ParamByName('ListaIdRubrica').asString+ ') AND');
      end;

    Add('  (H.MES             = '+QuotedStr(CmpRptCM.ParamByName('AnoRef').asString +'/'+
      FU.PoeZero(CmpRptCM.ParamByName('MesRef').asInteger))+ ') AND');

    if (CmpRptCM.ParamByName('ListaTipoFolha').asString <> '') then
    begin
      if (Pos(',', CmpRptCM.ParamByName('ListaTipoFolha').asString) > 0) then
        Add('  (H.IDMOTIVO       IN (' +CmpRptCM.ParamByName('ListaTipoFolha').asString+ ')) AND')
      else
        Add('  (H.IDMOTIVO        = ' +CmpRptCM.ParamByName('ListaTipoFolha').asString+ ') AND');
    end;

    Add('  (PJ.IDPESSOA       = FP.IDFILIALPESSOA) AND');
    Add('  (PJ.IDPESSOA       = F.IDESTAB) AND');
    Add('  (PJ.IDPESSOA       = E.IDPESSOA) AND');
    Add('  (PJ.IDENDCOMERCIAL = E.IDENDERECO) AND');
    Add('  (E.IDCIDADES       = CIDADES.IDCIDADES) AND');
    Add('  (CIDADES.IDESTADO  = ES.IDESTADO) AND');
    if (CmpRptCM.ParamByName('BuscaHist').asBoolean) then
    begin
      // C. Custo(s) selecionado(s)
      if (CmpRptCM.ParamByName('ListaCodCCusto').asString <> '') then
      begin
        if (Pos(',', CmpRptCM.ParamByName('ListaCodCCusto').asString) > 0) then
          Add('  (TRIM(DECODE(HST.CODCENTROCUSTO,NULL,F.CODCENTROCUSTO,HST.CODCENTROCUSTO)) IN (' +CmpRptCM.ParamByName('ListaCodCCusto').asString+ ')) AND')
        else
          Add('  (TRIM(DECODE(HST.CODCENTROCUSTO,NULL,F.CODCENTROCUSTO,HST.CODCENTROCUSTO))  = ' +CmpRptCM.ParamByName('ListaCodCCusto').asString+ ') AND');
      end
      else
      begin
        // C. de Custo(s) habilitados para o usuário
        if (CtrlUsoGeralRH.UsuXCCusto <> '') then
          if (Pos(',', CtrlUsoGeralRH.UsuXCCusto) > 0) then
            Add('  (TRIM(DECODE(HST.CODCENTROCUSTO,NULL,F.CODCENTROCUSTO,HST.CODCENTROCUSTO)) IN ' +CtrlUsoGeralRH.UsuXCCusto+ ') AND')
          else
            Add('  (TRIM(DECODE(HST.CODCENTROCUSTO,NULL,F.CODCENTROCUSTO,HST.CODCENTROCUSTO))  = ' +CtrlUsoGeralRH.UsuXCCusto+ ') AND');
      end;
      Add('  (DECODE(HST.CODCENTROCUSTO,NULL,F.CODCENTROCUSTO,HST.CODCENTROCUSTO) = CC.CODCENTROCUSTO) AND');
      Add('  (DECODE(HST.IDEMPRESA,NULL,F.IDEMPRESA,HST.IDEMPRESA) = RP.IDPESSOA) AND');
      Add('  (DECODE(HST.IDEMPRESA,NULL,F.IDEMPRESA,HST.IDEMPRESA) = CC.IDEMPRESA) AND');
    end
    else
    begin
      // C. Custo(s) selecionado(s)
      if (CmpRptCM.ParamByName('ListaCodCCusto').asString <> '') then
        Add(FU.MontaLinhaSelSQL(
          '  (TRIM(F.CODCENTROCUSTO)',CmpRptCM.ParamByName('ListaCodCCusto').asString,1))
      else
      // C. de Custo(s) habilitados para o usuário
      if (CtrlUsoGeralRH.UsuXCCusto <> '') then
        Add(FU.MontaLinhaSelSQL(
          '  (TRIM(F.CODCENTROCUSTO)',CtrlUsoGeralRH.UsuXCCusto,1));

      Add('  (F.CODCENTROCUSTO  = CC.CODCENTROCUSTO) AND');
      Add('  (F.IDEMPRESA       = CC.IDEMPRESA) AND');
      Add('  (F.IDEMPRESA       = RP.IDPESSOA) AND');
    end;

    if (CmpRptCM.ParamByName('Ordenacao').asInteger = 8) then // Agrupar por Programa
      Add('  (PG.IDPROGRAMA     = CC.IDPROGRAMA) AND');

    Add('  (F.IDPESSOA        = PF.IDPESSOA) AND');
    Add('  (F.IDPESSOA        = H.IDPESSOA) AND');
    Add('  (H.IDRUBRICA       = PD.IDPROVENTO) AND');

    if (Modulo.IdContraCheque = FUNCEF) then
      Add('  (C.IDFAIXASALARIAL  = FX.IDFAIXASALARIAL(+)) AND');

    if (CmpRptCM.ParamByName('BuscaHist').asBoolean) then
    begin
      if (Modulo.IdContraCheque = FUNCEF) then
        Add('  (DECODE(HST.IDCARGO,NULL,F.IDCARGO,HST.IDCARGO) = C.IDCARGO) AND');
      Add('  (PD.IDPROVENTO     = RP.IDRUBRICA) AND');
      Add('  (F.IDPESSOA        = HST.IDPESSOA(+))');
    end
    else
    begin
      if (Modulo.IdContraCheque = FUNCEF) then
        Add('  (F.IDCARGO = C.IDCARGO) AND');
      Add('  (PD.IDPROVENTO     = RP.IDRUBRICA)');
    end;

    Add('ORDER BY');
    case (CmpRptCM.ParamByName('Ordenacao').asInteger) of
      0 : Add('  COD_RUBRICA, UPPER(FUNCIONARIO)');
      1 : Add('  COD_RUBRICA, MATRICULA');
      2 : Add('  UPPER(NOME_RUBRICA), UPPER(FUNCIONARIO)');
      3 : Add('  UPPER(NOME_RUBRICA), MATRICULA');
      4 : Add('  COD_RUBRICA, CODCENTROCUSTO, UPPER(FUNCIONARIO)');
      5 : Add('  COD_RUBRICA, CODCENTROCUSTO, MATRICULA');
      6 : Add('  UPPER(NOME_RUBRICA), UPPER(NOMECENTROCUSTO), UPPER(FUNCIONARIO)');
      7 : Add('  UPPER(NOME_RUBRICA), UPPER(NOMECENTROCUSTO), MATRICULA');
      8 : Add('  UPPER(NOME_RUBRICA), UPPER(DESCPROGRAMA), MATRICULA');
    end;

    // Alterado por Arnaldo V. Scarin em 26/02/2008 - SOL 98241 KTN: 492499
    if (CmpRptCM.ParamByName('BuscaHist').asBoolean) then
    begin;
      Add(') M,');
      Add('CENTCUST CC');

      Add('WHERE (DECODE(HST_CODCENTROCUSTO,NULL,M.CODCENTROCUSTO,HST_CODCENTROCUSTO) = CC.CODCENTROCUSTO)');
      Add('  AND (IDEMPRESA = CC.IDEMPRESA)');
      Add('ORDER BY');
      case (CmpRptCM.ParamByName('Ordenacao').asInteger) of
        0 : Add('  COD_RUBRICA, UPPER(FUNCIONARIO)');
        1 : Add('  COD_RUBRICA, MATRICULA');
        2 : Add('  UPPER(NOME_RUBRICA), UPPER(FUNCIONARIO)');
        3 : Add('  UPPER(NOME_RUBRICA), MATRICULA');
        4 : Add('  COD_RUBRICA, CODCENTROCUSTO, UPPER(FUNCIONARIO)');
        5 : Add('  COD_RUBRICA, CODCENTROCUSTO, MATRICULA');
        6 : Add('  UPPER(NOME_RUBRICA), UPPER(NOMECENTROCUSTO), UPPER(FUNCIONARIO)');
        7 : Add('  UPPER(NOME_RUBRICA), UPPER(NOMECENTROCUSTO), MATRICULA');
        8 : Add('  UPPER(NOME_RUBRICA), UPPER(DESCPROGRAMA), MATRICULA');
      end;
    end;
    // Fim da Alteração.
    //SaveToFile('c:\qry.txt');
    //SaveToFile(Sistema.RetornaCaminhoArquivos(Sistema.IdEmpresa)+ '\qry.txt');//Ádler Teodoro de Souza SOL 109421 KINTANA 496332

  end;
  sqlFolhaEmprRub.Open;

  frmAguarde.Max := CdsFolhaEmprRub.RecordCount;
  frmAguarde.Min := 0;

  case (CmpRptCM.ParamByName('Ordenacao').asInteger) of
    4..7 :
    begin
      rpFolhaEmprRubGrp1.BreakName := 'CODCENTROCUSTO';
      rpFolhaEmprRubDBTxt8.DataField := 'CODCENTROCUSTO';
      rpFolhaEmprRubDBTxt9.DataField := 'NOMECENTROCUSTO';
      rpFolhaEmprRubDBTxt13.DataField := 'CODCENTROCUSTO';
      rpFolhaEmprRubDBTxt14.DataField := 'NOMECENTROCUSTO';
    end;
    8 :
    begin
      rpFolhaEmprRubGrp1.BreakName := 'CODPROGRAMA';
      rpFolhaEmprRubDBTxt8.DataField := 'CODPROGRAMA';
      rpFolhaEmprRubDBTxt9.DataField := 'DESCPROGRAMA';
      rpFolhaEmprRubDBTxt13.DataField := 'CODPROGRAMA';
      rpFolhaEmprRubDBTxt14.DataField := 'DESCPROGRAMA';
    end;
  end;

  rpFolhaEmprRubGrpHdrBnd2.Visible :=
    (CmpRptCM.ParamByName('Ordenacao').asInteger in [4..8]) and
    (CmpRptCM.ParamByName('TipoRelatorio').asInteger = 0);
  rpFolhaEmprRubGrpFootBnd2.Visible :=
    (CmpRptCM.ParamByName('Ordenacao').asInteger in [4..8]);
  rpFolhaEmprRubDtlBnd.Visible :=
    (CmpRptCM.ParamByName('Ordenacao').asInteger in [0..3]) or
    (CmpRptCM.ParamByName('TipoRelatorio').asInteger = 0);

  // Tratamento do abrupamento por Rubrica
  if (CmpRptCM.ParamByName('Ordenacao').asInteger in [0..3]) and
     (CmpRptCM.ParamByName('TipoRelatorio').asInteger = 0) then
    rpFolhaEmprRubGrpHdrBnd1.Height := 13.229
  else
  begin
    if (CmpRptCM.ParamByName('TipoRelatorio').asInteger = 0) then
      rpFolhaEmprRubGrpFootBnd2.Height := 10.848
    else
      rpFolhaEmprRubGrpFootBnd2.Height := 7.408;

    rpFolhaEmprRubGrpHdrBnd1.Height := 6.35;
  end;
  
  // Isto é necessário porquê o RBuilder muda também a posição dos componentes que estão
  // fora da área da Banda Pai quando esta tiver seu tamanho diminuído a ponto de cobrir
  // o componente, que é o caso aqui.
  rpFolhaEmprRubLbl6.Top := 0;
  rpFolhaEmprRubLbl6.Top := 7.673;
  rpFolhaEmprRubLbl7.Top := 7.673;
  rpFolhaEmprRubLbl20.Top:= 7.673;
  rpFolhaEmprRubLbl8.Top := 7.673;
  rpFolhaEmprRubLine1.Top := 12.171;

  rpFolhaEmprRubLbl6.Visible :=
    (CmpRptCM.ParamByName('Ordenacao').asInteger in [0..3]) and
    (CmpRptCM.ParamByName('TipoRelatorio').asInteger = 0);
  rpFolhaEmprRubLbl7.Visible := rpFolhaEmprRubLbl6.Visible;
  rpFolhaEmprRubLbl8.Visible := rpFolhaEmprRubLbl6.Visible;
  rpFolhaEmprRubLbl20.Visible:= rpFolhaEmprRubLbl6.Visible;
  rpFolhaEmprRubLbl16.Visible := (CmpRptCM.ParamByName('TipoRelatorio').asInteger = 1);
  rpFolhaEmprRubLbl17.Visible := (CmpRptCM.ParamByName('TipoRelatorio').asInteger = 1);

  rpFolhaEmprRubLine1.Visible := rpFolhaEmprRubLbl6.Visible;
  rpFolhaEmprRubLine3.Visible := (CmpRptCM.ParamByName('TipoRelatorio').asInteger = 0);
  rpFolhaEmprRubLbl12.Visible := rpFolhaEmprRubLine3.Visible;
  rpFolhaEmprRubLbl13.Visible := rpFolhaEmprRubLine3.Visible;

  if (CmpRptCM.ParamByName('TipoRelatorio').asInteger = 1) then
  begin
    rpFolhaEmprRubDBTxt14.Width := rpFolhaEmprRubLbl7.Width;

    rpFolhaEmprRubDBCalc1.Left := rpFolhaEmprRubLbl16.Left;
    rpFolhaEmprRubDBCalc1.Width := rpFolhaEmprRubLbl16.Width;

    rpFolhaEmprRubDBCalc2.Left := rpFolhaEmprRubLbl17.Left;
    rpFolhaEmprRubDBCalc2.Width := rpFolhaEmprRubLbl17.Width;
  end
  else
  begin
    rpFolhaEmprRubDBCalc1.Left := 120.65;
    rpFolhaEmprRubDBCalc1.Width := 14.817;

    rpFolhaEmprRubDBCalc2.Left := 169.863;
    rpFolhaEmprRubDBCalc2.Width := 23.283;
  end;

  rpFolhaEmprRubDBTxt13.Visible :=
    (CmpRptCM.ParamByName('Ordenacao').asInteger in [4..8]) and
    (CmpRptCM.ParamByName('TipoRelatorio').asInteger = 1);
  rpFolhaEmprRubDBTxt14.Visible := rpFolhaEmprRubDBTxt13.Visible;
end;

procedure TRptFolhaEmprRub.CdsFolhaEmprRubAfterScroll(DataSet: TDataSet);
begin
  frmAguarde.Pos := frmAguarde.Pos + 1;
  frmAguarde.Update;
end;

procedure TRptFolhaEmprRub.rpFolhaEmprRubLblPROCESSOPrint(Sender: TObject);
begin
  rpFolhaEmprRubLblPROCESSO.Visible := CmpRptCM.ParamByName('ImprimeTipoProcesso').asBoolean;
  if (rpFolhaEmprRubLblPROCESSO.Visible) then
    if (CmpRptCM.ParamByName('NomeTabela').asString = 'PREVIAFOLPAG') then
      rpFolhaEmprRubLblPROCESSO.Caption := 'Processo: PRÉVIA'
    else
      rpFolhaEmprRubLblPROCESSO.Caption := 'Processo: FINAL';
end;

procedure TRptFolhaEmprRub.rpFolhaEmprRubGrpHdrBnd1AfterPrint(Sender: TObject);
begin
  if (rpFolhaEmprRubLbl16.Visible) then
    rpFolhaEmprRubDBCalc1.TextAlignment := taCentered
  else
    rpFolhaEmprRubDBCalc1.TextAlignment := taLeftJustified;
end;

procedure TRptFolhaEmprRub.rpFolhaEmprRubSmryBndAfterPrint(Sender: TObject);
begin
  frmAguarde.Apaga;
end;

end.
