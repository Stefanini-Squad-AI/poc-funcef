unit dRelAlteracaoBenefPagos;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  dReports, ppVar, ppBands, ppCtrls, ppPrnabl, ppClass, ppCache, ppProd,
  ppReport, Db, DBTables, Wwquery, Wwdatsrc, ppComm, ppRelatv, ppDB,
  ppDBPipe, ppDBBDE;

type
  TdtmRelAlteracaoBenefPagos = class(TdtmReports)
    ppBenefAlter: TppBDEPipeline;
    dsBenefAlter: TwwDataSource;
    qryBenefAlter: TwwQuery;
    rpBenefAlter: TppReport;
    ppHeaderBand6: TppHeaderBand;
    rpBenefAlterLabel10: TppLabel;
    rpBenefAlterDBImage1: TppDBImage;
    rpBenefAlterDBText9: TppDBText;
    rpBenefAlterDBText10: TppDBText;
    rpBenefAlterDBText11: TppDBText;
    rpBenefAlterDBText12: TppDBText;
    rpBenefAlterLabel9: TppLabel;
    rpBenefAlterDBText13: TppDBText;
    rpBenefAlterDBText14: TppDBText;
    rpBenefAlterDBText15: TppDBText;
    rpBenefAlterDBText16: TppDBText;
    rpBenefAlterLabel16: TppLabel;
    lblReferencia: TppLabel;
    ppDetailBand4: TppDetailBand;
    rpBenefAlterDBText4: TppDBText;
    rpBenefAlterDBText5: TppDBText;
    rpBenefAlterDBText6: TppDBText;
    rpBenefAlterDBText7: TppDBText;
    rpBenefAlterDBText8: TppDBText;
    rpBenefAlterDBText17: TppDBText;
    rpBenefAlterDBText18: TppDBText;
    ppFooterBand6: TppFooterBand;
    ppLabel15: TppLabel;
    ppLine14: TppLine;
    ppCalc13: TppSystemVariable;
    ppCalc14: TppSystemVariable;
    rpBenefAlterSummaryBand1: TppSummaryBand;
    rpBenefAlterGroup1: TppGroup;
    rpBenefAlterGroupHeaderBand1: TppGroupHeaderBand;
    rpBenefAlterLabel1: TppLabel;
    rpBenefAlterDBText1: TppDBText;
    rpBenefAlterGroupFooterBand1: TppGroupFooterBand;
    rpBenefAlterLabel15: TppLabel;
    rpBenefAlterDBCalc3: TppDBCalc;
    rpBenefAlterGroup2: TppGroup;
    rpBenefAlterGroupHeaderBand2: TppGroupHeaderBand;
    rpBenefAlterLabel2: TppLabel;
    rpBenefAlterDBText2: TppDBText;
    rpBenefAlterGroupFooterBand2: TppGroupFooterBand;
    rpBenefAlterDBCalc2: TppDBCalc;
    rpBenefAlterLabel14: TppLabel;
    rpBenefAlterGroup3: TppGroup;
    rpBenefAlterGroupHeaderBand3: TppGroupHeaderBand;
    rpBenefAlterLabel3: TppLabel;
    rpBenefAlterDBText3: TppDBText;
    rpBenefAlterLine1: TppLine;
    rpBenefAlterLabel4: TppLabel;
    rpBenefAlterLabel5: TppLabel;
    rpBenefAlterLabel6: TppLabel;
    rpBenefAlterLabel7: TppLabel;
    rpBenefAlterLabel8: TppLabel;
    rpBenefAlterLabel11: TppLabel;
    rpBenefAlterLabel12: TppLabel;
    rpBenefAlterGroupFooterBand3: TppGroupFooterBand;
    rpBenefAlterLabel13: TppLabel;
    rpBenefAlterDBCalc1: TppDBCalc;
    qryFundacao: TwwQuery;
    qryFundacaoNOME: TStringField;
    qryFundacaoRAZAOSOCIAL: TStringField;
    qryFundacaoLOGRADOURO: TStringField;
    qryFundacaoNUMERO: TStringField;
    qryFundacaoCOMPLEMENTO: TStringField;
    qryFundacaoBAIRRO: TStringField;
    qryFundacaoCIDADE: TStringField;
    qryFundacaoCODESTADO: TStringField;
    qryFundacaoCEP: TStringField;
    qryFundacaoIMAGEM: TBlobField;
    qryFundacaoENDERECO: TStringField;
    qryFundacaoBARCIDUF: TStringField;
    dsFundacao: TwwDataSource;
    ppFundacao: TppBDEPipeline;
    ppFundacaoppField1: TppField;
    ppFundacaoppField2: TppField;
    ppFundacaoppField3: TppField;
    ppFundacaoppField4: TppField;
    ppFundacaoppField5: TppField;
    ppFundacaoppField6: TppField;
    ppFundacaoppField7: TppField;
    ppFundacaoppField8: TppField;
    ppFundacaoppField9: TppField;
    ppFundacaoppField10: TppField;
    ppFundacaoppField11: TppField;
    ppFundacaoppField12: TppField;
    function MostraParam(Form: string): boolean; override;
    procedure rpBenefAlterChildReport1TitleBand1BeforePrint(Sender: TObject);
    procedure pAbreFundacao;
    procedure pFechaFundacao;
    procedure rpBenefAlterBeforePrint(Sender: TObject);
    procedure qryBenefAlterAfterClose(DataSet: TDataSet);
    procedure qryBenefAlterBeforeOpen(DataSet: TDataSet);
    procedure qryBenefAlterAfterOpen(DataSet: TDataSet);
  private
    { Private declarations }
    Total4, Total5 : Real;
  public
    { Public declarations }
  end;

var
  dtmRelAlteracaoBenefPagos: TdtmRelAlteracaoBenefPagos;

implementation

uses uAdmPrevFB, fAguarde, FPRelAlteracaoBenefPagos;

{$R *.DFM}


{ TdtmRelAlteracaoBenefPagos }

function TdtmRelAlteracaoBenefPagos.MostraParam(Form: string): boolean;
Var
  Frm : TForm;

begin
  If UPPERCASE(Form) = 'FRMPRELALTERACAOBENEFPAGOS' Then
    Frm := TFrmPRelAlteracaoBenefPagos.Create(Application);

  If Frm = Nil Then
    Result := True
  Else
  Begin
    With Frm Do
    Begin
      Result := (ShowModal = mrOk);
      Free;
    End;
  End;
end;

procedure TdtmRelAlteracaoBenefPagos.pAbreFundacao;
begin
  qryFundacao.Close;
  qryFundacao.ParamByName('PFUNDACAO').AsInteger := iIdFundacao;
  qryFundacao.Open
end;

procedure TdtmRelAlteracaoBenefPagos.pFechaFundacao;
begin
  qryFundacao.Close;
end;

procedure TdtmRelAlteracaoBenefPagos.rpBenefAlterChildReport1TitleBand1BeforePrint(
  Sender: TObject);
begin
  Total4 := 0;
  Total5 := 0;
end;

procedure TdtmRelAlteracaoBenefPagos.rpBenefAlterBeforePrint(
  Sender: TObject);
begin
  inherited;
  pAbreFundacao;
end;

procedure TdtmRelAlteracaoBenefPagos.qryBenefAlterAfterClose(
  DataSet: TDataSet);
begin
  inherited;
  pFechaFundacao;
end;

procedure TdtmRelAlteracaoBenefPagos.qryBenefAlterBeforeOpen(
  DataSet: TDataSet);
begin
  inherited;
  frmAguarde.Mostra('Aguarde... Montando Relatório.');
  frmAguarde.Repaint;
end;

procedure TdtmRelAlteracaoBenefPagos.qryBenefAlterAfterOpen(
  DataSet: TDataSet);
begin
  inherited;
  frmAguarde.Apaga;
end;

end.
