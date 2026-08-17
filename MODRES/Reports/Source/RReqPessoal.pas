unit RReqPessoal;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs, FCmReport,
  uCmRptManager, TXComp, CmParamReport, Db, DBClient, uCMClientDataSet, uCmSqlParams, ppVar,
  ppBands, ppCtrls, ppStrtch, ppMemo, ppPrnabl, ppClass, ppCache, ppProd, ppReport, Wwdatsrc,
  ppComm, ppRelatv, ppDB, ppDBPipe, ppDBBDE, ppSubRpt;

type
  TRptReqPessoal = class(TFrmCmReport)
    ppReqPessoal: TppBDEPipeline;
    dsReqPessoal: TwwDataSource;
    rpReqPessoal: TppReport;
    rpReqPessoalHdrBnd: TppHeaderBand;
    rpReqPessoalLbl2: TppLabel;
    rpReqPessoalLbl1: TppLabel;
    rpReqPessoalDtlBnd: TppDetailBand;
    rpReqPessoalShp1: TppShape;
    rpReqPessoalLbl3: TppLabel;
    rpReqPessoalDBTxt1: TppDBText;
    rpReqPessoalLbl4: TppLabel;
    rpReqPessoalDBTxt2: TppDBText;
    rpReqPessoalLbl5: TppLabel;
    rpReqPessoalDBTxt3: TppDBText;
    rpReqPessoalLbl6: TppLabel;
    rpReqPessoalDBTxt4: TppDBText;
    rpReqPessoalLbl7: TppLabel;
    rpReqPessoalDBTxt5: TppDBText;
    rpReqPessoalLbl8: TppLabel;
    rpReqPessoalDBTxt6: TppDBText;
    rpReqPessoalLbl12: TppLabel;
    rpReqPessoalDBTxt10: TppDBText;
    rpReqPessoalLbl13: TppLabel;
    rpReqPessoalDBTxt11: TppDBText;
    rpReqPessoalLbl11: TppLabel;
    rpReqPessoalDBTxt9: TppDBText;
    rpReqPessoalLbl9: TppLabel;
    rpReqPessoalDBTxt7: TppDBText;
    rpReqPessoalLbl10: TppLabel;
    rpReqPessoalDBTxt8: TppDBText;
    rpReqPessoalLine3: TppLine;
    rpReqPessoalLine4: TppLine;
    rpReqPessoalLine5: TppLine;
    rpReqPessoalLine2: TppLine;
    rpReqPessoalLine1: TppLine;
    ppFooterBand1: TppFooterBand;
    rpReqPessoalLine6: TppLine;
    ppLabel3: TppLabel;
    ppSystemVariable1: TppSystemVariable;
    ppSystemVariable2: TppSystemVariable;
    sqlReqPessoal: TCMSqlParams;
    CdsReqPessoal: TCMClientDataSet;
    ppLine1: TppLine;
    ppLabel1: TppLabel;
    ppDBText1: TppDBText;
    ppLabel2: TppLabel;
    ppDBText2: TppDBText;
    ppSubReport1: TppSubReport;
    ppChildReport1: TppChildReport;
    ppTitleBand1: TppTitleBand;
    ppDetailBand1: TppDetailBand;
    ppSummaryBand1: TppSummaryBand;
    rpReqPessoalLbl14: TppLabel;
    rpReqPessoalDBMemo1: TppDBMemo;
    ppSubReport2: TppSubReport;
    ppChildReport2: TppChildReport;
    ppTitleBand2: TppTitleBand;
    ppDetailBand2: TppDetailBand;
    ppSummaryBand2: TppSummaryBand;
    rpReqPessoalLbl15: TppLabel;
    rpReqPessoalDBMemo2: TppDBMemo;
    ppSubReport3: TppSubReport;
    ppChildReport3: TppChildReport;
    ppTitleBand3: TppTitleBand;
    ppDetailBand3: TppDetailBand;
    ppSummaryBand3: TppSummaryBand;
    rpReqPessoalLbl16: TppLabel;
    rpReqPessoalDBMemo3: TppDBMemo;
    ppSubReport4: TppSubReport;
    ppChildReport4: TppChildReport;
    ppTitleBand4: TppTitleBand;
    ppLabel4: TppLabel;
    ppDetailBand4: TppDetailBand;
    ppDBMemo1: TppDBMemo;
    ppSummaryBand4: TppSummaryBand;
    ppSubReport5: TppSubReport;
    ppChildReport5: TppChildReport;
    ppTitleBand5: TppTitleBand;
    ppLabel5: TppLabel;
    ppDetailBand5: TppDetailBand;
    ppDBMemo2: TppDBMemo;
    ppSummaryBand5: TppSummaryBand;
    procedure CrmRptCMBeforePrint(Sender: TObject);
  public
    NumRequisicao, NomeEstab, NomeCurso, NomeCargo, NomeGrauInstrucao, TipoRequisicao,
    TipoAmpliacao, Situacao, TipoContrato, Sexo, NomeNovoOcupante, NomeSubstituido,
    NomeResponsavel, NomeSupervisor: string;
  end;

var
  RptReqPessoal: TRptReqPessoal;

implementation

uses uSistema;

{$R *.DFM}

procedure TRptReqPessoal.CrmRptCMBeforePrint(Sender: TObject);
begin
  inherited;
  rpReqPessoalLbl1.Caption := Sistema.NomeEmpresa;
  with (sqlReqPessoal.SQL) do
  begin
    Clear;
    Add('SELECT');
    Add('  NUMREQ,');
    Add('  '+QuotedStr(Trim(NomeCurso))+' AS NOMECENTROCUSTO,');
    Add('  '+QuotedStr(Trim(NomeEstab))+' AS ESTABABELECIMENTO,');
    Add('  '+QuotedStr(Trim(NomeGrauInstrucao))+' AS GRAUINSTRUCAO,');
    Add('  '+QuotedStr(Trim(NomeCargo))+' AS CARGO,');
    Add('  DATAREQ,');
    Add('  '+QuotedStr(Trim(TipoRequisicao))+' AS NOMETIPOREQ,');
    Add('  '+QuotedStr(Trim(TipoAmpliacao))+' AS NOMETIPOAMPL,');
    Add('  '+QuotedStr(Trim(Situacao))+' AS SITUACAO,');
    Add('  '+QuotedStr(Trim(TipoContrato))+' AS NOMETIPOCONTRATO,');
    Add('  '+QuotedStr(Trim(Sexo))+' AS SEXO,');
    Add('  '+QuotedStr(Trim(NomeNovoOcupante))+' AS NOVOOCUPANTE,');
    Add('  '+QuotedStr(Trim(NomeSubstituido))+' AS SUBSTITUIDO,');
    Add('  '+QuotedStr(Trim(NomeResponsavel))+' AS RESPONSAVEL,');
    Add('  '+QuotedStr(Trim(NomeSupervisor))+' AS SUPERVISOR,');
    Add('  DATAPLAN, OBSERV, OBSERV2, OBSERV3, OBSERV4, OBSERV5, IDPROCESSO');
    Add('FROM');
    Add('  REQUIPES');
    Add('WHERE');
    Add('  (NUMREQ = ' +NumRequisicao+ ')');
  end;
  sqlReqPessoal.Open;
end;

end.
