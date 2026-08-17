unit RAcessoEstacao;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs, FCmReport,
  uCmRptManager, TXComp, CmParamReport, Db, DBClient, uCMClientDataSet, uCmSqlParams,
  Wwdatsrc, ppDB, ppDBPipe, ppDBBDE, ppCtrls, ppBands, ppClass, ppVar, ppPrnabl, ppCache,
  ppComm, ppRelatv, ppProd, ppReport, IvDictio, IvMulti, TXRB;

type
  TRptAcessoEstacao = class(TFrmCmReport)
    rpAcessoEstacao: TppReport;
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
    rpOcorrPessLbl6: TppLabel;
    rpOcorrPessLbl7: TppLabel;
    ppShape1: TppShape;
    rpOcorrPessDBTxt3: TppDBText;
    rpOcorrPessDBTxt4: TppDBText;
    rpOcorrPessLbl9: TppLabel;
    rpOcorrPessLbl10: TppLabel;
    ppLabel4: TppLabel;
    ppAcessoEstacao: TppBDEPipeline;
    dsAcessoEstacao: TwwDataSource;
    sqlAcessoEstacao: TCMSqlParams;
    CdsAcessoEstacao: TCMClientDataSet;
    ppLabel2: TppLabel;
    ppDBText2: TppDBText;
    ppGroup1: TppGroup;
    ppGroupHeaderBand1: TppGroupHeaderBand;
    ppGroupFooterBand1: TppGroupFooterBand;
    ppLabel3: TppLabel;
    ppLabel5: TppLabel;
    ppDBCalc1: TppDBCalc;
    ppDBCalc2: TppDBCalc;
    rpdTit1: TppDBText;
    rpCalc1: TppDBCalc;
    rpdTit2: TppDBText;
    rpCalc2: TppDBCalc;
    rpdTit3: TppDBText;
    rpCalc3: TppDBCalc;
    rpdbTit4: TppDBText;
    rpCalc4: TppDBCalc;
    rpdTit1Tot: TppDBText;
    rpCalc1Tot: TppDBCalc;
    rpdTit2Tot: TppDBText;
    rpCalc2Tot: TppDBCalc;
    rpdTit3Tot: TppDBText;
    rpCalc3Tot: TppDBCalc;
    rpdbTit4Tot: TppDBText;
    rpCalc4Tot: TppDBCalc;
    ppLabel6: TppLabel;
    ppDBText3: TppDBText;
    ppFooterBand1: TppFooterBand;
    ppLabel7: TppLabel;
    ppLine1: TppLine;
    ppLabel8: TppLabel;
    ppDBText4: TppDBText;
    ppLabel9: TppLabel;
    ppDBText5: TppDBText;
    procedure CrmRptCMBeforePrint(Sender: TObject);
    procedure CdsAcessoEstacaoAfterScroll(DataSet: TDataSet);
  end;

var
  RptAcessoEstacao: TRptAcessoEstacao;

implementation

uses uCtrlFuncoesRH, fAguarde, dCds;

{$R *.DFM}

procedure TRptAcessoEstacao.CrmRptCMBeforePrint(Sender: TObject);
begin
  inherited;
  ppGroupHeaderBand1.Visible := (CmpRptCM.ParamByName('TipoRel').asInteger = 0);
  rpOcorrPessDtlBnd.Visible := (CmpRptCM.ParamByName('TipoRel').asInteger = 0);

  rpCalc1.Visible := (CmpRptCM.ParamByName('Nome1').asString <> '');
  rpCalc1Tot.Visible := (CmpRptCM.ParamByName('Nome1').asString <> '');
  rpCalc2.Visible := (CmpRptCM.ParamByName('Nome2').asString <> '');
  rpCalc2Tot.Visible := (CmpRptCM.ParamByName('Nome2').asString <> '');
  rpCalc3.Visible := (CmpRptCM.ParamByName('Nome3').asString <> '');
  rpCalc3Tot.Visible := (CmpRptCM.ParamByName('Nome3').asString <> '');
  rpCalc4.Visible := (CmpRptCM.ParamByName('Nome1').asString <> '') or
                     (CmpRptCM.ParamByName('Nome2').asString <> '') or
                     (CmpRptCM.ParamByName('Nome3').asString <> '');
  rpCalc4Tot.Visible := (CmpRptCM.ParamByName('Nome1').asString <> '') or
                        (CmpRptCM.ParamByName('Nome2').asString <> '') or
                        (CmpRptCM.ParamByName('Nome3').asString <> '');
  rpdbTit4.Visible := (CmpRptCM.ParamByName('Nome1').asString <> '') or
                      (CmpRptCM.ParamByName('Nome2').asString <> '') or
                      (CmpRptCM.ParamByName('Nome3').asString <> '');
  rpdbTit4Tot.Visible := (CmpRptCM.ParamByName('Nome1').asString <> '') or
                         (CmpRptCM.ParamByName('Nome2').asString <> '') or
                         (CmpRptCM.ParamByName('Nome3').asString <> '');

  with (sqlAcessoEstacao.SQL) do
  begin
    Clear;
    Add('SELECT');
    Add('  ' +QuotedStr(CmpRptCM.ParamByName('NomeEmpresa').asString)+ ' AS EMPRESA,');
    Add('  ' +QuotedStr(CmpRptCM.ParamByName('Nome1').asString)+ ' AS TITULO1,');
    Add('  ' +QuotedStr(CmpRptCM.ParamByName('Nome2').asString)+ ' AS TITULO2,');
    Add('  ' +QuotedStr(CmpRptCM.ParamByName('Nome3').asString)+ ' AS TITULO3,');
    Add('  ' +QuotedStr(FU.CMTranslate('Fora de Hora'))+ ' AS TITULO4,');
    Add('  (CASE');
    Add('     WHEN TO_CHAR(AF.ENTRADA,''HH24:MI'') BETWEEN '+
      QuotedStr(CmpRptCM.ParamByName('Inicio1').asString)+ ' AND '+
      QuotedStr(CmpRptCM.ParamByName('Final1').asString)+ ' THEN 1');
    Add('     ELSE 0');
    Add('   END) AS CONTA1,');
    Add('  (CASE');
    Add('     WHEN TO_CHAR(AF.ENTRADA,''HH24:MI'') BETWEEN '+
      QuotedStr(CmpRptCM.ParamByName('Inicio2').asString)+ ' AND '+
      QuotedStr(CmpRptCM.ParamByName('Final2').asString)+ ' THEN 1');
    Add('     ELSE 0');
    Add('   END) AS CONTA2,');
    Add('  (CASE');
    Add('     WHEN TO_CHAR(AF.ENTRADA,''HH24:MI'') BETWEEN '+
      QuotedStr(CmpRptCM.ParamByName('Inicio3').asString)+ ' AND '+
      QuotedStr(CmpRptCM.ParamByName('Final3').asString)+ ' THEN 1');
    Add('     ELSE 0');
    Add('   END) AS CONTA3,');
    Add('  (CASE');
    Add('     WHEN TO_CHAR(AF.ENTRADA,''HH24:MI'') BETWEEN '+
      QuotedStr(CmpRptCM.ParamByName('Inicio1').asString)+ ' AND '+
      QuotedStr(CmpRptCM.ParamByName('Final1').asString));
    Add('       OR TO_CHAR(AF.ENTRADA,''HH24:MI'') BETWEEN '+
      QuotedStr(CmpRptCM.ParamByName('Inicio2').asString)+ ' AND '+
      QuotedStr(CmpRptCM.ParamByName('Final2').asString));
    Add('       OR TO_CHAR(AF.ENTRADA,''HH24:MI'') BETWEEN '+
      QuotedStr(CmpRptCM.ParamByName('Inicio3').asString)+ ' AND '+
      QuotedStr(CmpRptCM.ParamByName('Final3').asString)+ ' THEN 0');
    Add('     ELSE 1');
    Add('   END) AS CONTA4,');
    Add('  F.IDPESSOA,');
    Add('  F.MATRICULA,');
    Add('  RTRIM(PF.NOME) AS NOME,');
    Add('  C.TITULO AS CARGO,');
    Add('  AF.ENTRADA, AF.SAIDAINTERVALO, AF.RETORNOINTERVALO,');
    Add('  AF.SAIDA, AF.INDPASSAGEM,');
    Add('  DECODE(AF.INDFUNCAO,''A'',' +QuotedStr(FU.CMTranslate('Acesso'))+
                                   ',' +QuotedStr(FU.CMTranslate('Ponto'))+ ') AS TIPO,');
    Add('  DECODE(EA.ESTACAO,NULL,''BATIDA EDITADA'',EA.ESTACAO || '' - '' || EA.DESCRICAO) AS DESCRICAO');
    Add('FROM');
    Add('  PESSOA PF, PESSOAFISICA PEFIS, FUNCIONARIO F, ACESSOFUNC AF,');
    Add('  ESTACAOACESSO EA, CARGO C');
    // -------------------------------------------------------------------- //
    Add('WHERE');

    // Estações selecionadas
    if (CmpRptCM.ParamByName('ListaCodEstacao').asString <> '') then
      Add(FU.MontaLinhaSelSQL('  (AF.IDESTACAOACESSO',CmpRptCM.ParamByName('ListaCodEstacao').asString,1));

    // Funcionários/Candidatos selecionados
    if (CmpRptCM.ParamByName('ListaIdFunc').asString <> '') then
      Add(FU.MontaLinhaSelSQL('  (PF.IDPESSOA',CmpRptCM.ParamByName('ListaIdFunc').asString,8))
    else
      Add('  (PF.IDPESSOA         = -1) AND');

    Add('  (AF.ENTRADA         >= TO_DATE(' +
      QuotedStr(CmpRptCM.ParamByName('DataInicial').asString)+ ',''DD/MM/YYYY'')) AND');
    Add('  (AF.ENTRADA         <= TO_DATE(' +
      QuotedStr(CmpRptCM.ParamByName('DataFinal').asString)+ ',''DD/MM/YYYY'')+1) AND');
    Add('  (PF.IDPESSOA         = F.IDPESSOA) AND');
    Add('  (PF.IDPESSOA         = PEFIS.IDPESSOA) AND');
    Add('  (PF.IDPESSOA         = AF.IDPESSOA) AND');
    Add('  (AF.IDESTACAOACESSO  = EA.IDESTACAOACESSO(+)) AND');
    Add('  (AF.INDFUNCAO       <> ''Q'') AND');

    if (CmpRptCM.ParamByName('TipoEstacao').asInteger <> 2) then
      if (CmpRptCM.ParamByName('TipoEstacao').asInteger = 0) then
        Add('  (AF.INDFUNCAO        = ''A'') AND')
      else
        Add('  (AF.INDFUNCAO        = ''P'') AND');

    Add('  (F.IDCARGO           = C.IDCARGO(+))');
    Add('ORDER BY');
    Add('  DESCRICAO, UPPER(NOME), AF.ENTRADA');
    SaveToFile(FU.DirTempLog + '\qry.txt');
  end;
  sqlAcessoEstacao.Open;
  frmAguarde.Min := 0;
  frmAguarde.Max := CdsAcessoEstacao.RecordCount;

  rpOcorrPessLblDATAINI.Caption := CmpRptCM.ParamByName('DataInicial').asString;
  rpOcorrPessLblDATAFINAL.Caption := CmpRptCM.ParamByName('DataFinal').asString;
  frmAguarde.Apaga;
end;

procedure TRptAcessoEstacao.CdsAcessoEstacaoAfterScroll(DataSet: TDataSet);
begin
  frmAguarde.Pos := frmAguarde.Pos + 1;
  frmAguarde.Update;
end;

end.
