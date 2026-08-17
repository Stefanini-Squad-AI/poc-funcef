// *****************************************************************************
// ***************************** REGISTRO DE ALTERAÇÕES ************************
// *****************************************************************************
// Autor(a)    :  Ádler Teodoro de Souza
// Data        :  27/02/2009
// Pendência   : SOL 109421 KINTANA 496332
// Descricao   :  Alteração de gravação de arquivos de log na raiz do disco C: .
//------------------------------------------------------------------------------
unit ROcorrExames;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs, FCmReport, Db,
  DBClient, uCMClientDataSet, uCmSqlParams, Wwdatsrc, ppDB, ppDBPipe, ppDBBDE, ppCtrls,
  ppBands, ppClass, ppVar, ppPrnabl, ppCache, ppComm, ppRelatv, ppProd, ppReport, TXComp,
  uCmRptManager, CmParamReport, TXRB, USistema;

type
  TRptOcorrExames = class(TFrmCmReport)
    rpOcorrExames: TppReport;
    rpOcorrExamesHdrBnd: TppHeaderBand;
    rpOcorrExamesLbl1: TppLabel;
    rpOcorrExamesLbl2: TppLabel;
    rpOcorrExamesLbl3: TppLabel;
    rpOcorrExamesDBTxt1: TppDBText;
    ppSystemVariable1: TppSystemVariable;
    ppSystemVariable2: TppSystemVariable;
    ppLine1: TppLine;
    rpOcorrExamesLbl4: TppLabel;
    rpOcorrExamesLbl5: TppLabel;
    rpOcorrExamesLbl6: TppLabel;
    ppDetailBand1: TppDetailBand;
    ppDBText2: TppDBText;
    ppDBText3: TppDBText;
    ppDBText4: TppDBText;
    ppSummaryBand1: TppSummaryBand;
    rpOcorrExamesGroup: TppGroup;
    ppGroupHeaderBand1: TppGroupHeaderBand;
    rpOcorrExamesGrpFootBnd: TppGroupFooterBand;
    rpOcorrExamesLbl7: TppLabel;
    ppDBCalc2: TppDBCalc;
    ppOcorrExames: TppBDEPipeline;
    dsOcorrExames: TwwDataSource;
    sqlOcorrExames: TCMSqlParams;
    CdsOcorrExames: TCMClientDataSet;
    procedure CrmRptCMBeforePrint(Sender: TObject);
    procedure CdsOcorrExamesAfterOpen(DataSet: TDataSet);
    procedure CdsOcorrExamesAfterScroll(DataSet: TDataSet);
    procedure ppSummaryBand1AfterPrint(Sender: TObject);
  end;

var
  RptOcorrExames: TRptOcorrExames;

implementation

uses fAguarde;

{$R *.DFM}

procedure TRptOcorrExames.CrmRptCMBeforePrint(Sender: TObject);
begin
  inherited;
  with (sqlOcorrExames.SQL) do
  begin
    Clear;
    Add('SELECT');
    Add('  (' +QuotedStr(CmpRptCM.ParamByName('NomeEmpresa').asString)+ ') AS EMPRESA,');
    Add('  CODTIPOOCMED, DESCRTIPOOCMED, AVALMIN');
    Add('FROM');
    Add('  TIPOCMED');

    // Ocorrências selecionada(s)
    if (CmpRptCM.ParamByName('ListaCodTipOcMed').asString <> '') then
    begin
      Add('WHERE');
      if (Pos(',', CmpRptCM.ParamByName('ListaCodTipOcMed').asString) > 0) then
        Add('  (CODTIPOOCMED IN (' +CmpRptCM.ParamByName('ListaCodTipOcMed').asString+ '))')
      else
        Add('  (CODTIPOOCMED = ' +CmpRptCM.ParamByName('ListaCodTipOcMed').asString+ ')');
    end;

    Add('ORDER BY');
    case (CmpRptCM.ParamByName('Ordenacao').asInteger) of
      0 : Add('  CODTIPOOCMED');
      1 : Add('  UPPER(DESCRTIPOOCMED)');
    end;
    //SaveToFile('c:\qry.txt');
    SaveToFile(Sistema.RetornaCaminhoArquivos(Sistema.IdEmpresa)+'\qry.txt');//Ádler Teodoro de Souza SOL 109421 KINTANA 496332
  end;
  sqlOcorrExames.Open;
end;

procedure TRptOcorrExames.CdsOcorrExamesAfterOpen(DataSet: TDataSet);
begin
  frmAguarde.Max := DataSet.RecordCount;
  frmAguarde.Min := 0;
end;

procedure TRptOcorrExames.CdsOcorrExamesAfterScroll(DataSet: TDataSet);
begin
  frmAguarde.Pos := frmAguarde.Pos + 1;
  frmAguarde.Update;
end;

procedure TRptOcorrExames.ppSummaryBand1AfterPrint(Sender: TObject);
begin
  frmAguarde.Apaga;
end;

end.
