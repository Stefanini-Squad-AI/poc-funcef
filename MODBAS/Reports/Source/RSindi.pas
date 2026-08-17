unit RSindi;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs, FCmReport, Db,
  DBClient, uCMClientDataSet, uCmSqlParams, Wwdatsrc, ppDB, ppDBPipe, ppDBBDE, ppCtrls,
  ppBands, ppClass, ppVar, ppPrnabl, ppCache, ppComm, ppRelatv, ppProd, ppReport,
  uCmRptManager, TXComp, CmParamReport;

type
  TRptSindi = class(TFrmCmReport)
    rpSindi: TppReport;
    SindiHdrBnd1: TppHeaderBand;
    SindiLbl1: TppLabel;
    SindiLbl2: TppLabel;
    SindiLbl3: TppLabel;
    SindiLbl4: TppLabel;
    SindiLabel5: TppLabel;
    SindiLine1: TppLine;
    SindiDBTxt1: TppDBText;
    SindiLbl6: TppLabel;
    SindiCalc1: TppSystemVariable;
    SindiCalc2: TppSystemVariable;
    SindiDtlBnd1: TppDetailBand;
    SindiDBTxt2: TppDBText;
    SindiDBTxt3: TppDBText;
    SindiDBTxt4: TppDBText;
    rpSindiDBText1: TppDBText;
    ppFooterBand1: TppFooterBand;
    ppSummaryBand1: TppSummaryBand;
    ppGroup1: TppGroup;
    SindiGrpHdrBnd1: TppGroupHeaderBand;
    SindiGrpFootBnd1: TppGroupFooterBand;
    SindiLbl7: TppLabel;
    SindiDBCalc1: TppDBCalc;
    ppSindi: TppBDEPipeline;
    dsSindi: TwwDataSource;
    sqlSindi: TCMSqlParams;
    CdsSindi: TCMClientDataSet;
    procedure CrmRptCMBeforePrint(Sender: TObject);
    procedure CdsSindiAfterOpen(DataSet: TDataSet);
    procedure CdsSindiAfterScroll(DataSet: TDataSet);
    procedure ppSummaryBand1AfterPrint(Sender: TObject);
  end;

var
  RptSindi: TRptSindi;

implementation

uses uSistema, fAguarde;

{$R *.DFM}

procedure TRptSindi.CrmRptCMBeforePrint(Sender: TObject);
begin
  inherited;
  with (sqlSindi.SQL) do
  begin
    Clear;
    Add('SELECT');
    Add('  (' +QuotedStr(Sistema.NomeEmpresa)+ ') AS EMPRESA,');
    Add('  S.IDPESSOA, P.NOME, P.RAZAOSOCIAL,');
    Add('  DECODE(S.MESBASE, 1,''Janeiro'', 2,''Fevereiro'', 3,''Março'', 4,''Abril'', '+
      '5,''Maio'', 6,''Junho'', 7,''Julho'', 8,''Agosto'', 9,''Setembro'', 10,''Outubro'', '+
      '11,''Novembro'', 12,''Dezembro'') AS MESBASE');
    Add('FROM');
    Add('  PESSOA P, SINDICATO S');
    Add('WHERE');
    Add('  (S.IDPESSOA = P.IDPESSOA)');
    Add('ORDER BY');
    case (CmpRptCM.ParamByName('Ordenacao').asInteger) of
      0 : Add('  S.IDPESSOA');
      1 : Add('  P.NOME');
    end;
    SaveToFile('c:\qry.txt');
  end;
  sqlSindi.Open;

  frmAguarde.Mostra('Listagem de Sindicatos');
  frmAguarde.Pos := 0;
end;

procedure TRptSindi.CdsSindiAfterOpen(DataSet: TDataSet);
begin
  frmAguarde.Max := DataSet.RecordCount;
  frmAguarde.Min := 0;
end;

procedure TRptSindi.CdsSindiAfterScroll(DataSet: TDataSet);
begin
  frmAguarde.Pos := frmAguarde.Pos + 1;
  frmAguarde.Update;
end;

procedure TRptSindi.ppSummaryBand1AfterPrint(Sender: TObject);
begin
  frmAguarde.Apaga;
end;

end.
