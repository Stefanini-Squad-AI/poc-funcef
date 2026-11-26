{====>   DESENVOLVEDOR NÃO ESQUEÇA DE COMENTAR SUAS ALTERAÇÕES AO LONGO DO
         CÓDIGO, ASSIM COMO COLOCAR A DESCRIÇÃO DA IMPLEMENTAÇÃO/ALTERAÇÃO
         NO HISTÓRICO DE ALTERAÇÕES NO FINAL DESTE ARQUIVO ********************}
unit dRelGeral;

interface

uses
  Windows , Messages, SysUtils, Classes , Graphics, Controls, Forms   , Dialogs,
  dReports, ppCtrls , ppBands , ppPrnabl, ppClass , ppProd  , ppReport, Db     ,
  DBTables, Wwquery , Wwdatsrc, ppComm  , ppCache , ppDB    , ppDBBDE,
  ppSubRpt, ppStrtch, ppRegion, uSistema, UAdmPrevFB, ppVar, ppRelatv,
  ppDBPipe;

type
  TdtmRelGeral = class(TdtmReports)
    qryFundacao                              : TwwQuery;
    dsFundacao                               : TwwDataSource;
    ppFundacao                               : TppBDEPipeline;
    qryIndice: TwwQuery;
    qryEmprestimo: TwwQuery;
    qryIR: TwwQuery;
    qryCredito: TwwQuery;
    qryDebito: TwwQuery;
    qryCorrecao: TwwQuery;
    qryArqPagEletr: TwwQuery;
    dsArqPagEletr: TwwDataSource;
    ppArqPagEletr: TppReport;
    ppHeaderBand1: TppHeaderBand;
    ppReport4DBText1: TppDBText;
    ppReport4DBText2: TppDBText;
    ppReport4DBText3: TppDBText;
    ppReport4DBImage1: TppDBImage;
    ppReport4DBText4: TppDBText;
    ppReport4DBText5: TppDBText;
    ppArqPagEletrLabel1: TppLabel;
    ppArqPagEletrLabel2: TppLabel;
    ppArqPagEletrLabel3: TppLabel;
    ppArqPagEletrLabel4: TppLabel;
    ppDetailBand1: TppDetailBand;
    ppFooterBand1: TppFooterBand;
    ppArqPagEletrDBCalc1: TppDBCalc;
    ppArqPagEletrDBCalc2: TppDBCalc;
    ppArqPagEletrLabel5: TppLabel;
    ppArqPagEletrGroup1: TppGroup;
    ppArqPagEletrGroupHeaderBand1: TppGroupHeaderBand;
    ppArqPagEletrGroupFooterBand1: TppGroupFooterBand;
    ppArqPagEletrDBText1: TppDBText;
    ppArqPagEletrDBText2: TppDBText;
    ppArqPagEletrDBText3: TppDBText;
    plArqPagEletr: TppBDEPipeline;
    updArqPagEletr: TUpdateSQL;
    ppArqPagEletrLine1: TppLine;
    ppArqPagEletrLine2: TppLine;
    ppArqPagEletrLabel6: TppLabel;
    ppArqPagEletrLine3: TppLine;
    ppArqPagEletrCalc1: TppSystemVariable;
    ppArqPagEletrCalc2: TppSystemVariable;
    rptFontePagadora: TppReport;
    ppHeaderBand3: TppHeaderBand;
    ppLabel6: TppLabel;
    ppLine1: TppLine;
    ppLine5: TppLine;
    ppLabel10: TppLabel;
    ppLabel11: TppLabel;
    ppLabel12: TppLabel;
    ppDetailBand3: TppDetailBand;
    ppDBText7: TppDBText;
    ppDBText8: TppDBText;
    ppDBText9: TppDBText;
    ppFooterBand3: TppFooterBand;
    ppLine4: TppLine;
    ppLabel8: TppLabel;
    ppSystemVariable1: TppSystemVariable;
    ppSystemVariable2: TppSystemVariable;
    qryFontePagadora: TwwQuery;
    dsFontepagadora: TwwDataSource;
    ppFontePagadora: TppBDEPipeline;
    ppDBText10: TppDBText;
    ppDBText11: TppDBText;
    ppDBText12: TppDBText;
    ppDBImage2: TppDBImage;
    ppDBText13: TppDBText;
    ppDBText14: TppDBText;
  function MostraParam(Form: string): boolean; override;
    procedure ppFooterBand1AfterPrint(Sender: TObject);
    procedure qryArqPagEletrAfterOpen(DataSet: TDataSet);
    procedure ppFooterBand2AfterPrint(Sender: TObject);
    procedure qryPagtoIndivAfterOpen(DataSet: TDataSet);
    procedure qryPagtoIndivAfterClose(DataSet: TDataSet);
    procedure qryDemoCalculoReservaAfterOpen(DataSet: TDataSet);
    procedure qryDemoCalculoReservaAfterClose(DataSet: TDataSet);
    procedure qryArqPagEletrAfterClose(DataSet: TDataSet);
  private
    { Private declarations }
    procedure pAbreFundacao;
    procedure pFechaFundacao;
  public
    { Public declarations }
  end;

var dtmRelGeral: TdtmRelGeral;

implementation

uses fAguarde, fPRelArqPagEletr, fParamrelRubFontePag;

{$R *.DFM}
function TdtmRelGeral.MostraParam(Form: string): boolean;
var frm : TForm;
begin
  If UPPERCASE(Form) = 'FRMPRELARQPAGELETR' then
    frm:=TfrmPRelArqPagEletr.Create(Application)
  Else
  if UPPERCASE(Form) = 'FRMPARAMRELRUBFONTEPAG' then
    frm:=TfrmParamrelRubFontePag.Create(Application)
  Else frm := nil;

  If frm = nil Then Result := true
  Else
   Begin
     With frm do
      Begin
        Result := (ShowModal = mrOk);
        free;
      End;
   End;
end;

procedure TdtmRelGeral.ppFooterBand1AfterPrint(Sender: TObject);
begin
  inherited;
  frmAguarde.Apaga;

end;

procedure TdtmRelGeral.pAbreFundacao;
begin
  inherited;
  QryFundacao.Close;
  QryFundacao.ParamByName('pFundacao').AsInteger := iIdFundacao;
  QryFundacao.Open;
end;

procedure TdtmRelGeral.pFechaFundacao;
begin
  inherited;
  QryFundacao.Close;
end;

procedure TdtmRelGeral.qryArqPagEletrAfterOpen(DataSet: TDataSet);
begin
  inherited;
  pAbreFundacao;
  frmAguarde.Mostra('Aguarde... Montando Relatório.');
  frmAguarde.Repaint;
end;

procedure TdtmRelGeral.qryArqPagEletrAfterClose(DataSet: TDataSet);
begin
  inherited;
  pFechaFundacao;
end;

procedure TdtmRelGeral.ppFooterBand2AfterPrint(Sender: TObject);
begin
  inherited;
  frmAguarde.Apaga;
end;

procedure TdtmRelGeral.qryPagtoIndivAfterOpen(DataSet: TDataSet);
begin
  inherited;
  pAbreFundacao;
  frmAguarde.Mostra('Aguarde... Montando Relatório.');
  frmAguarde.Repaint;
end;

procedure TdtmRelGeral.qryPagtoIndivAfterClose(DataSet: TDataSet);
begin
  inherited;
  pFechaFundacao;
end;

procedure TdtmRelGeral.qryDemoCalculoReservaAfterOpen(DataSet: TDataSet);
begin
  inherited;
  pAbreFundacao;
  frmAguarde.Mostra('Aguarde... Montando Relatório.');
  frmAguarde.Repaint;
end;

procedure TdtmRelGeral.qryDemoCalculoReservaAfterClose(DataSet: TDataSet);
begin
  inherited;
  pFechaFundacao;
end;

end.
