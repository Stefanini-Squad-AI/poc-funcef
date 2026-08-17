// *****************************************************************************
// ***************************** REGISTRO DE ALTERAÇÕES ************************
// *****************************************************************************
// Autor(a)    :  Ádler Teodoro de Souza
// Data        :  19/02/2009
// Pendência   : SOL 109421 KINTANA 496332
// Descricao   :  Alteração de gravação de arquivos de log na raiz do disco C: .
//------------------------------------------------------------------------------
unit RAlfabMensal;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs, FCmReport,
  uCmRptManager, TXComp, CmParamReport, Db, Wwdatsrc, ppDB, ppDBPipe, ppDBBDE, ppCtrls,
  ppBands, ppVar, ppPrnabl, ppClass, ppCache, ppComm, ppRelatv, ppProd, ppReport, DBClient,
  uCMClientDataSet, uCmSqlParams, TXRB, USistema;

type
  TRptAlfabMensal = class(TFrmCmReport)
    rpAlfabMensal: TppReport;
    rpAlfabMensalHdrBnd: TppHeaderBand;
    rpAlfabMensalLblTITULO: TppLabel;
    rpAlfabMensalCalc1: TppCalc;
    rpAlfabMensalCalc2: TppCalc;
    rpAlfabMensalLbl3: TppLabel;
    rpAlfabMensalLblMesRef: TppLabel;
    rpAlfabMensalDBTxt1: TppDBText;
    rpAlfabMensalDBTxt2: TppDBText;
    rpAlfabMensalDBTxt3: TppDBText;
    rpAlfabMensalLbl1: TppLabel;
    rpAlfabMensalDBTxt4: TppDBText;
    rpAlfabMensalLbl2: TppLabel;
    rpAlfabMensalLbl4: TppLabel;
    rpAlfabMensalLbl5: TppLabel;
    rpAlfabMensalLbl6: TppLabel;
    rpAlfabMensalLbl7: TppLabel;
    rpAlfabMensalLblTitulo1Linha2: TppLabel;
    rpAlfabMensalLblTitulo2Linha2: TppLabel;
    rpAlfabMensalLblTitulo3Linha2: TppLabel;
    rpAlfabMensalLbl8: TppLabel;
    rpAlfabMensalLblTitulo2Linha1: TppLabel;
    rpAlfabMensalLine1: TppLine;
    rpAlfabMensalLblTitulo1Linha1: TppLabel;
    rpAlfabMensalLblTitulo3Linha1: TppLabel;
    rpAlfabMensalDtlBnd: TppDetailBand;
    rpAlfabMensalDBTxt5: TppDBText;
    rpAlfabMensalDBTxt6: TppDBText;
    rpAlfabMensalDBTxt7: TppDBText;
    rpAlfabMensalDBTxt8: TppDBText;
    rpAlfabMensalDBTxt9: TppDBText;
    rpAlfabMensalDBTxt10: TppDBText;
    rpAlfabMensalDBTxt11: TppDBText;
    rpAlfabMensalDBTxt12: TppDBText;
    rpAlfabMensalFootBnd: TppFooterBand;
    rpAlfabMensalSmryBnd: TppSummaryBand;
    rpAlfabMensalLine2: TppLine;
    rpAlfabMensalDBCalc2: TppDBCalc;
    rpAlfabMensalDBCalc3: TppDBCalc;
    rpAlfabMensalLbl12: TppLabel;
    rpAlfabMensalDBCalc4: TppDBCalc;
    rpAlfabMensalDBCalc5: TppDBCalc;
    rpAlfabMensalDBCalc6: TppDBCalc;
    rpAlfabMensalDBCalc7: TppDBCalc;
    rpAlfabMensalLbl10: TppLabel;
    rpAlfabMensalLbl11: TppLabel;
    rpAlfabMensalLbl9: TppLabel;
    rpAlfabMensalDBCalc1: TppDBCalc;
    rpAlfabMensalLine3: TppLine;
    rpAlfabMensalLine4: TppLine;
    rpAlfabMensalLine5: TppLine;
    ppAlfabMensal: TppBDEPipeline;
    ppAlfabMensalppField1: TppField;
    ppAlfabMensalppField2: TppField;
    ppAlfabMensalppField3: TppField;
    ppAlfabMensalppField4: TppField;
    ppAlfabMensalppField5: TppField;
    ppAlfabMensalppField6: TppField;
    ppAlfabMensalppField7: TppField;
    ppAlfabMensalppField8: TppField;
    ppAlfabMensalppField9: TppField;
    ppAlfabMensalppField10: TppField;
    ppAlfabMensalppField11: TppField;
    ppAlfabMensalppField12: TppField;
    ppAlfabMensalppField13: TppField;
    ppAlfabMensalppField14: TppField;
    dsAlfabMensal: TwwDataSource;
    sqlAlfabMensal: TCMSqlParams;
    CdsAlfabMensal: TCMClientDataSet;
    procedure CrmRptCMBeforePrint(Sender: TObject);
    procedure CdsAlfabMensalAfterScroll(DataSet: TDataSet);
    procedure rpAlfabMensalSmryBndAfterPrint(Sender: TObject);
  end;

var
  RptAlfabMensal: TRptAlfabMensal;

implementation

uses uCtrlFuncoesRH, fAguarde, uCtrlUsoGeralRH;

{$R *.DFM}

procedure TRptAlfabMensal.CrmRptCMBeforePrint(Sender: TObject);
var
  sMes: string;
begin
  inherited;
  rpAlfabMensalDBTxt2.Visible := Pos(',', CmpRptCM.ParamByName('ListaIdEstab').asString) = 0;
  rpAlfabMensalDBTxt3.Visible := Pos(',', CmpRptCM.ParamByName('ListaIdEstab').asString) = 0;
  
  sMes := QuotedStr(CmpRptCM.ParamByName('AnoRef').asString +'/'+
    FU.PoeZero(CmpRptCM.ParamByName('MesRef').asInteger));

  with (sqlAlfabMensal.SQL) do
  begin
    Clear;
    Add('SELECT DISTINCT');
    Add('  PJ.RAZAOSOCIAL AS EMPRESA,');
    Add('  RTRIM(E.LOGRADOURO) ||'', ''|| E.NUMERO || DECODE(E.COMPLEMENTO,NULL,NULL,'' - '' ||');
    Add('    RTRIM(E.COMPLEMENTO)) ||'' - ''|| RTRIM(E.BAIRRO) ||'' - ''||');
    Add('    RTRIM(CIDADES.NOME) || '' - CEP:'' ||');
    Add('    RTRIM(SUBSTR(E.CEP,1,5)) ||''-''|| RTRIM(SUBSTR(E.CEP,6,3)) AS ENDERECO,');
    Add('  ES.CODESTADO AS UF,');
    Add('  DECODE(PJ.NUMDOCUMENTO,NULL,NULL,''CNPJ: '' || PJ.NUMDOCUMENTO) AS CGC,');
    Add('  F.MATRICULA,');
    Add('  UPPER(RTRIM(PF.NOME)) AS EMPREGADO,');
    Add('  UPPER(RTRIM(CC.NOME)) AS NOMECENTROCUSTO, CC.CODREDUZIDO,');
    Add('  F.DATAADMISSAO,');
    Add('  RTRIM(DECODE(HST_CARGO.TITULO,NULL,C.TITULO,HST_CARGO.TITULO)) AS CARGO,');
    Add('  DECODE(VALSALARIO.VALOR,NULL,F.SALARIOATUAL,VALSALARIO.VALOR) AS VAL_SALARIO,');
    Add('  NVL(GRATIFFUNC.VALOR,0) AS GRATIF_FUNC,');
    Add('  NVL(ANUENIO.VALOR,0) AS VAL_ANUENIO,');
    Add('  (DECODE(VALSALARIO.VALOR,NULL,F.SALARIOATUAL,VALSALARIO.VALOR) +');
    Add('     NVL(GRATIFFUNC.VALOR,0) + NVL(ANUENIO.VALOR,0)) AS VAL_TOTAL');
    Add('FROM');
    Add('  PESSOA PJ, PESSOA PF, ENDPESS E, FUNCIONARIO F, ESTADO ES, CIDADES,');
    Add('  CARGO C, CENTCUST CC, SITFUNC ST,');
    // -----------------------------------------------------------------------
    Add('  (SELECT H.MES, H.IDPESSOA, SUM(H.VALORPROVENTO) AS VALOR');
    Add('   FROM   HISTRUBSAL H, FUNCIONARIO F, SITFUNC ST');
    Add('   WHERE  (F.IDESTAB        IN (' +CmpRptCM.ParamByName('ListaIdEstab').asString+ ')) AND');

    if (CmpRptCM.ParamByName('SitFunc').asString <> '') then
      if (Pos(',', CmpRptCM.ParamByName('SitFunc').asString) > 0) then
        Add('          (ST.TIPOSIT       IN (' +CmpRptCM.ParamByName('SitFunc').asString+ ')) AND')
      else
        Add('          (ST.TIPOSIT        = ' +CmpRptCM.ParamByName('SitFunc').asString+ ') AND');

    if (CmpRptCM.ParamByName('TipoContrato').asString <> '') then
      if (Pos(',', CmpRptCM.ParamByName('TipoContrato').asString) > 0) then
        Add('          (F.TIPOCONTRATO   IN (' +CmpRptCM.ParamByName('TipoContrato').asString+ ')) AND')
      else
        Add('          (F.TIPOCONTRATO    = ' +CmpRptCM.ParamByName('TipoContrato').asString+ ') AND');

    // C. de Custo(s) habilitado(s) para o usuário
    if (CtrlUsoGeralRH.UsuXCCusto <> '') then
      if (Pos(',', CtrlUsoGeralRH.UsuXCCusto) > 0) then
        Add('          (F.CODCENTROCUSTO IN ' +CtrlUsoGeralRH.UsuXCCusto+ ') AND')
      else
        Add('          (F.CODCENTROCUSTO IN ' +CtrlUsoGeralRH.UsuXCCusto+ ') AND');

    if (Pos(',', CmpRptCM.ParamByName('ListaIdRubrica1').asString) > 0) then
      Add('          (H.CODPROVDESC    IN (' +CmpRptCM.ParamByName('ListaIdRubrica1').asString+ ')) AND')
    else
      Add('          (H.CODPROVDESC     = ' +CmpRptCM.ParamByName('ListaIdRubrica1').asString+ ') AND');

    Add('          (H.MES             = '+sMes+') AND');
    Add('          (ST.IDSITFUNC      = F.IDSITFUNC) AND');
    Add('          (F.IDPESSOA        = H.IDPESSOA)');
    Add('   GROUP BY H.MES, H.IDPESSOA) VALSALARIO,');
    // -----------------------------------------------------------------------
    Add('  (SELECT H.MES, H.IDPESSOA, SUM(H.VALORPROVENTO) AS VALOR');
    Add('   FROM   HISTRUBSAL H, FUNCIONARIO F, SITFUNC ST');
    Add('   WHERE  (F.IDESTAB        IN (' +CmpRptCM.ParamByName('ListaIdEstab').asString+ ')) AND');

    if (CmpRptCM.ParamByName('SitFunc').asString <> '') then
      if (Pos(',', CmpRptCM.ParamByName('SitFunc').asString) > 0) then
        Add('          (ST.TIPOSIT       IN (' +CmpRptCM.ParamByName('SitFunc').asString+ ')) AND')
      else
        Add('          (ST.TIPOSIT        = ' +CmpRptCM.ParamByName('SitFunc').asString+ ') AND');

    if (CmpRptCM.ParamByName('TipoContrato').asString <> '') then
      if (Pos(',', CmpRptCM.ParamByName('TipoContrato').asString) > 0) then
        Add('          (F.TIPOCONTRATO   IN (' +CmpRptCM.ParamByName('TipoContrato').asString+ ')) AND')
      else
        Add('          (F.TIPOCONTRATO    = ' +CmpRptCM.ParamByName('TipoContrato').asString+ ') AND');

    // C. de Custo(s) habilitado(s) para o usuário
    if (CtrlUsoGeralRH.UsuXCCusto <> '') then
      if (Pos(',', CtrlUsoGeralRH.UsuXCCusto) > 0) then
        Add('          (F.CODCENTROCUSTO IN ' +CtrlUsoGeralRH.UsuXCCusto+ ') AND')
      else
        Add('          (F.CODCENTROCUSTO IN ' +CtrlUsoGeralRH.UsuXCCusto+ ') AND');

    if (Pos(',', CmpRptCM.ParamByName('ListaIdRubrica2').asString) > 0) then
      Add('          (H.CODPROVDESC    IN (' +CmpRptCM.ParamByName('ListaIdRubrica2').asString+ ')) AND')
    else
      Add('          (H.CODPROVDESC     = ' +CmpRptCM.ParamByName('ListaIdRubrica2').asString+ ') AND');

    Add('          (H.MES             = '+sMes+') AND');
    Add('          (ST.IDSITFUNC      = F.IDSITFUNC) AND');
    Add('          (F.IDPESSOA        = H.IDPESSOA)');
    Add('   GROUP BY H.MES, H.IDPESSOA) GRATIFFUNC,');
    // -----------------------------------------------------------------------
    Add('  (SELECT H.MES, H.IDPESSOA, SUM(H.VALORPROVENTO) AS VALOR');
    Add('   FROM   HISTRUBSAL H, FUNCIONARIO F, SITFUNC ST');
    Add('   WHERE  (F.IDESTAB        IN (' +CmpRptCM.ParamByName('ListaIdEstab').asString+ ')) AND');

    if (CmpRptCM.ParamByName('SitFunc').asString <> '') then
      if (Pos(',', CmpRptCM.ParamByName('SitFunc').asString) > 0) then
        Add('          (ST.TIPOSIT       IN (' +CmpRptCM.ParamByName('SitFunc').asString+ ')) AND')
      else
        Add('          (ST.TIPOSIT        = ' +CmpRptCM.ParamByName('SitFunc').asString+ ') AND');

    if (CmpRptCM.ParamByName('TipoContrato').asString <> '') then
      if (Pos(',', CmpRptCM.ParamByName('TipoContrato').asString) > 0) then
        Add('          (F.TIPOCONTRATO   IN (' +CmpRptCM.ParamByName('TipoContrato').asString+ ')) AND')
      else
        Add('          (F.TIPOCONTRATO    = ' +CmpRptCM.ParamByName('TipoContrato').asString+ ') AND');

    // C. de Custo(s) habilitado(s) para o usuário
    if (CtrlUsoGeralRH.UsuXCCusto <> '') then
      if (Pos(',', CtrlUsoGeralRH.UsuXCCusto) > 0) then
        Add('          (F.CODCENTROCUSTO IN ' +CtrlUsoGeralRH.UsuXCCusto+ ') AND')
      else
        Add('          (F.CODCENTROCUSTO IN ' +CtrlUsoGeralRH.UsuXCCusto+ ') AND');

    if (Pos(',', CmpRptCM.ParamByName('ListaIdRubrica3').asString) > 0) then
      Add('          (H.CODPROVDESC    IN (' +CmpRptCM.ParamByName('ListaIdRubrica3').asString+ ')) AND')
    else
      Add('          (H.CODPROVDESC     = ' +CmpRptCM.ParamByName('ListaIdRubrica3').asString+ ') AND');

    Add('          (H.MES             = '+sMes+') AND');
    Add('          (ST.IDSITFUNC      = F.IDSITFUNC) AND');
    Add('          (F.IDPESSOA        = H.IDPESSOA)');
    Add('   GROUP BY H.MES, H.IDPESSOA) ANUENIO,');
    // -----------------------------------------------------------------------
    // Última evolução Funcional do Funcionário
    Add('  (SELECT CARGO.IDCARGO, CARGO.TITULO, EVOL.IDPESSOA, EVOL.IDEMPRESA, EVOL.CODCENTROCUSTO');
    Add('   FROM   EVOLFUNC EVOL, CARGO');
    Add('   WHERE  (CARGO.IDCARGO      = EVOL.IDCARGO) AND');
    Add('          (EVOL.DATAALTERFUNC = (SELECT MAX(DATAALTERFUNC)');
    Add('                                 FROM   EVOLFUNC');
    Add('                                 WHERE  (EVOLFUNC.IDPESSOA       = EVOL.IDPESSOA) AND');
    Add('                                        (EVOLFUNC.DATAALTERFUNC <= TO_DATE('+
      QuotedStr(IntToStr(FU.TrazUltDiaMes(CmpRptCM.ParamByName('MesRef').asInteger,
      CmpRptCM.ParamByName('AnoRef').asInteger)) +'/'+
      FU.PoeZero(CmpRptCM.ParamByName('MesRef').asInteger) +'/'+
      CmpRptCM.ParamByName('AnoRef').asString)+
      ',''DD/MM/YYYY''))))) HST_CARGO');
    // -----------------------------------------------------------------------
    Add('WHERE');
    Add('  (PJ.IDPESSOA      IN (' +CmpRptCM.ParamByName('ListaIdEstab').asString+ ')) AND');

    if (CmpRptCM.ParamByName('SitFunc').asString <> '') then
      if (Pos(',', CmpRptCM.ParamByName('SitFunc').asString) > 0) then
        Add('  (ST.TIPOSIT       IN (' +CmpRptCM.ParamByName('SitFunc').asString+ ')) AND')
      else
        Add('  (ST.TIPOSIT        = ' +CmpRptCM.ParamByName('SitFunc').asString+ ') AND');

    if (CmpRptCM.ParamByName('TipoContrato').asString <> '') then
      if (Pos(',', CmpRptCM.ParamByName('TipoContrato').asString) > 0) then
        Add('  (F.TIPOCONTRATO   IN (' +CmpRptCM.ParamByName('TipoContrato').asString+ ')) AND')
      else
        Add('  (F.TIPOCONTRATO    = ' +CmpRptCM.ParamByName('TipoContrato').asString+ ') AND');

    // C. de Custo(s) habilitado(s) para o usuário
    if (CtrlUsoGeralRH.UsuXCCusto <> '') then
      if (Pos(',', CtrlUsoGeralRH.UsuXCCusto) > 0) then
        Add('  (F.CODCENTROCUSTO IN ' +CtrlUsoGeralRH.UsuXCCusto+ ') AND')
      else
        Add('  (F.CODCENTROCUSTO IN ' +CtrlUsoGeralRH.UsuXCCusto+ ') AND');

    Add('  (F.DATAADMISSAO   <= TO_DATE(' +
      QuotedStr(IntToStr(FU.TrazUltDiaMes(CmpRptCM.ParamByName('MesRef').asInteger,
      CmpRptCM.ParamByName('AnoRef').asInteger)) +'/'+
      FU.PoeZero(CmpRptCM.ParamByName('MesRef').asInteger) +'/'+
      CmpRptCM.ParamByName('AnoRef').asString)+
      ',''DD/MM/YYYY'')) AND');

    Add('  (ST.IDSITFUNC      = F.IDSITFUNC) AND');
    Add('  (PJ.IDPESSOA       = E.IDPESSOA) AND');
    Add('  (PJ.IDENDCOMERCIAL = E.IDENDERECO) AND');
    Add('  (E.IDCIDADES       = CIDADES.IDCIDADES) AND');
    Add('  (CIDADES.IDESTADO  = ES.IDESTADO) AND');
    Add('  (PJ.IDPESSOA       = F.IDESTAB) AND');
    Add('  (F.IDPESSOA        = PF.IDPESSOA) AND');
    Add('  (DECODE(HST_CARGO.IDEMPRESA,NULL,F.IDEMPRESA,HST_CARGO.IDEMPRESA) = CC.IDEMPRESA) AND');
    Add('  (DECODE(HST_CARGO.CODCENTROCUSTO,NULL,F.CODCENTROCUSTO,HST_CARGO.CODCENTROCUSTO) = CC.CODCENTROCUSTO) AND');
    Add('  (F.IDCARGO         = C.IDCARGO) AND');
    Add('  (F.IDPESSOA        = HST_CARGO.IDPESSOA(+)) AND');
    Add('  (F.IDPESSOA        = VALSALARIO.IDPESSOA(+)) AND');
    Add('  (F.IDPESSOA        = ANUENIO.IDPESSOA(+)) AND');
    Add('  (F.IDPESSOA        = GRATIFFUNC.IDPESSOA(+))');
    Add('ORDER BY');
    case (CmpRptCM.ParamByName('Ordenacao').asInteger) of
      0 : Add('  UPPER(EMPREGADO)');
      1 : Add('  MATRICULA');
      2 : Add('  UPPER(CARGO), UPPER(EMPREGADO)');
      3 : Add('  UPPER(CARGO), UPPER(MATRICULA)');
      4 : Add('  UPPER(NOMECENTROCUSTO), UPPER(EMPREGADO)');
      5 : Add('  UPPER(NOMECENTROCUSTO), MATRICULA');
    end;
    //SaveToFile('c:\qry.txt');
    SaveToFile(Sistema.RetornaCaminhoArquivos(Sistema.IdEmpresa)+'\qry.txt');//Ádler Teodoro de Souza SOL 109421 KINTANA 496332
  end;
  sqlAlfabMensal.Open;

  frmAguarde.Max := CdsAlfabMensal.RecordCount;
  frmAguarde.Min := 0;

  rpAlfabMensalLblTitulo1Linha1.Caption := CmpRptCM.ParamByName('Titulo1Linha1').asString;
  rpAlfabMensalLblTitulo1Linha2.Caption := CmpRptCM.ParamByName('Titulo1Linha2').asString;
  rpAlfabMensalLblTitulo2Linha1.Caption := CmpRptCM.ParamByName('Titulo2Linha1').asString;
  rpAlfabMensalLblTitulo2Linha2.Caption := CmpRptCM.ParamByName('Titulo2Linha2').asString;
  rpAlfabMensalLblTitulo3Linha1.Caption := CmpRptCM.ParamByName('Titulo3Linha1').asString;
  rpAlfabMensalLblTitulo3Linha2.Caption := CmpRptCM.ParamByName('Titulo3Linha2').asString;

  rpAlfabMensalLblTITULO.Caption := CmpRptCM.ParamByName('TituloRelatorio').asString;
  rpAlfabMensallblMesRef.Caption := 'Mês de Referência : '+
    FU.MesExtensoAno(CmpRptCM.ParamByName('AnoRef').asString +'/'+
    FU.PoeZero(CmpRptCM.ParamByName('MesRef').asInteger));
end;

procedure TRptAlfabMensal.CdsAlfabMensalAfterScroll(DataSet: TDataSet);
begin
  frmAguarde.Pos := frmAguarde.Pos + 1;
  frmAguarde.Update;
end;

procedure TRptAlfabMensal.rpAlfabMensalSmryBndAfterPrint(Sender: TObject);
begin
  frmAguarde.Apaga;
end;

end.
