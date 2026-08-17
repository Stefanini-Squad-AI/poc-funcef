unit RPresencaCasa;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs, FCmReport,
  uCmRptManager, TXComp, CmParamReport, Db, DBClient, uCMClientDataSet, uCmSqlParams,
  Wwdatsrc, ppDB, ppDBPipe, ppDBBDE, ppCtrls, ppBands, ppClass, ppVar, ppPrnabl, ppCache,
  ppComm, ppRelatv, ppProd, ppReport, ppStrtch, ppRegion, IvDictio, IvMulti,
  TXRB;

type
  TRptPresencaCasa = class(TFrmCmReport)
    rpPresencaCasa: TppReport;
    rpOcorrPessHdrBnd: TppHeaderBand;
    ppLabel1: TppLabel;
    rpOcorrPessLbl2: TppLabel;
    rpOcorrPessLbl3: TppLabel;
    rpOcorrPessDBTxt1: TppDBText;
    rpOcorrPessSysVar1: TppSystemVariable;
    rpOcorrPessSysVar2: TppSystemVariable;
    rpOcorrPessLbl4: TppLabel;
    rpOcorrPessLblDATAINI: TppLabel;
    rpOcorrPessLbl5: TppLabel;
    rpOcorrPessLblDATAFINAL: TppLabel;
    rpOcorrPessDtlBnd: TppDetailBand;
    rpOcorrPessDBTxt6: TppDBText;
    rpOcorrPessDBTxt7: TppDBText;
    ppDBText1: TppDBText;
    rpOcorrPessSmryBnd: TppSummaryBand;
    rpOcorrPessGrp1: TppGroup;
    rpOcorrPessGrpHdrBnd1: TppGroupHeaderBand;
    rpOcorrPessGrpFootBnd1: TppGroupFooterBand;
    rpOcorrPessLbl14: TppLabel;
    rpOcorrPessGrp2: TppGroup;
    rpOcorrPessGrpHdrBnd2: TppGroupHeaderBand;
    rpOcorrPessLbl6: TppLabel;
    rpOcorrPessLbl7: TppLabel;
    rpOcorrPessLbl8: TppLabel;
    rpOcorrPessDBTxt3: TppDBText;
    rpOcorrPessDBTxt4: TppDBText;
    rpOcorrPessDBTxt5: TppDBText;
    rpOcorrPessGrpFootBnd2: TppGroupFooterBand;
    ppPresencaCasa: TppBDEPipeline;
    dsPresencaCasa: TwwDataSource;
    sqlPresencaCasa: TCMSqlParams;
    CdsPresencaCasa: TCMClientDataSet;
    rpOcorrPessLbl9: TppLabel;
    ppLabel4: TppLabel;
    rpOcorrPessLbl10: TppLabel;
    ppDBCalc3: TppDBCalc;
    ppLine1: TppLine;
    ppFooterBand1: TppFooterBand;
    ppLabel8: TppLabel;
    ppDBText4: TppDBText;
    ppLabel9: TppLabel;
    ppDBText5: TppDBText;
    ppLblAgora: TppLabel;
    ppDBText2: TppDBText;
    ppLine2: TppLine;
    ppLabel2: TppLabel;
    ppDBCalc1: TppDBCalc;
    ppLine3: TppLine;
    ppLabel3: TppLabel;
    ppDBCalc2: TppDBCalc;
    ppLine4: TppLine;
    procedure CrmRptCMBeforePrint(Sender: TObject);
    procedure CdsPresencaCasaAfterScroll(DataSet: TDataSet);
  end;

var
  RptPresencaCasa: TRptPresencaCasa;

implementation

uses uCtrlFuncoesRH, fAguarde, dCds;

{$R *.DFM}

procedure TRptPresencaCasa.CrmRptCMBeforePrint(Sender: TObject);
begin
  inherited;
  rpOcorrPessLblDATAINI.Caption := CmpRptCM.ParamByName('DataInicial').asString;
  rpOcorrPessLblDATAFINAL.Caption := CmpRptCM.ParamByName('DataFinal').asString;

  rpOcorrPessLbl4.Visible := (CmpRptCM.ParamByName('Opcao').asInteger = 1);
  rpOcorrPessLblDATAINI.Visible := (CmpRptCM.ParamByName('Opcao').asInteger = 1);
  rpOcorrPessLbl5.Visible := (CmpRptCM.ParamByName('Opcao').asInteger = 1);
  rpOcorrPessLblDATAFINAL.Visible := (CmpRptCM.ParamByName('Opcao').asInteger = 1);
  ppLblAgora.Visible := (CmpRptCM.ParamByName('Opcao').asInteger = 0);

  with (sqlPresencaCasa.SQL) do
  begin
    Clear;
    Add('SELECT');
    Add('  F.IDPESSOA,');
    Add('  F.MATRICULA,');
    Add('  RTRIM(PF.NOME) AS EMPREGADO,');
    Add('  RTRIM(CC.NOME) AS NOME,');
    Add('  RTRIM(PJ.NOME) AS EMPRESA,');
    Add('  C.TITULO AS CARGO,');
    Add('  AF.ENTRADA, AF.SAIDAINTERVALO, AF.RETORNOINTERVALO, AF.SAIDA,');
    Add('  DECODE(EA.ESTACAO,NULL,''BATIDA EDITADA'',EA.ESTACAO) AS DESCRICAO');
    Add('FROM');
    Add('  PESSOA PF, PESSOA PJ, PESSOAFISICA PEFIS, FUNCIONARIO F, ACESSOFUNC AF,');
    Add('  ESTACAOACESSO EA, CARGO C, CENTCUST CC');
    // -------------------------------------------------------------------- //
    Add('WHERE');

    // Estaçôes selecionadas
    if (CmpRptCM.ParamByName('ListaCodEstacao').asString <> '') then
      Add(FU.MontaLinhaSelSQL('  (AF.IDESTACAOACESSO',CmpRptCM.ParamByName('ListaCodEstacao').asString,1));

    // Funcionários selecionados
    if (CmpRptCM.ParamByName('ListaIdFunc').asString <> '') then
      Add(FU.MontaLinhaSelSQL('  (PF.IDPESSOA',CmpRptCM.ParamByName('ListaIdFunc').asString,8))
    else
      Add('  (PF.IDPESSOA         = -1) AND');

    if (CmpRptCM.ParamByName('Opcao').asInteger = 1) then // Período Selecionado
    begin
      Add('  ((AF.SAIDA     IS NULL) OR');
      Add('   (AF.SAIDA          >= TO_DATE(' +
        QuotedStr(CmpRptCM.ParamByName('DataInicial').asString)+ ',''DD/MM/YYYY HH24:MI''))) AND');
      Add('  (AF.ENTRADA         <= TO_DATE(' +
        QuotedStr(CmpRptCM.ParamByName('DataFinal').asString)+ ',''DD/MM/YYYY HH24:MI'')) AND');
    end
    else  // Neste Momento
    begin
      Add('  (AF.SAIDA     IS NULL) AND');
      Add('  (AF.ENTRADA   <= SYSDATE) AND');
    end;

    Add('  (PF.IDPESSOA         = AF.IDPESSOA) AND');
    Add('  (PF.IDPESSOA         = F.IDPESSOA) AND');
    Add('  (PF.IDPESSOA         = PEFIS.IDPESSOA) AND');
    Add('  (PF.IDPESSOA         = F.IDPESSOA) AND');
    Add('  (F.IDESTAB           = PJ.IDPESSOA) AND');
    Add('  (F.IDEMPRESA         = CC.IDEMPRESA) AND');
    Add('  (F.CODCENTROCUSTO    = CC.CODCENTROCUSTO) AND');
    Add('  (AF.IDESTACAOACESSO  = EA.IDESTACAOACESSO(+)) AND');
    Add('  (AF.INDFUNCAO        = ''P'') AND');
    Add('  (F.IDCARGO           = C.IDCARGO(+))');
    Add('ORDER BY');

    if (CmpRptCM.ParamByName('Sequencia').asInteger = 0) then
      Add('  EMPRESA, UPPER(NOME), EMPREGADO, AF.ENTRADA')
    else
      Add('  EMPRESA, UPPER(NOME), AF.ENTRADA, EMPREGADO');

    SaveToFile(FU.DirTempLog + '\qry.txt');
  end;
  sqlPresencaCasa.Open;
  frmAguarde.Min := 0;
  frmAguarde.Max := CdsPresencaCasa.RecordCount;

  frmAguarde.Apaga;
end;

procedure TRptPresencaCasa.CdsPresencaCasaAfterScroll(DataSet: TDataSet);
begin
  frmAguarde.Pos := frmAguarde.Pos + 1;
  frmAguarde.Update;
end;

end.
