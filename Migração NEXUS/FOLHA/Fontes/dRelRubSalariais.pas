unit dRelRubSalariais;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  dReports, ppVar, ppBands, ppCtrls, ppPrnabl, ppClass, ppCache, ppProd,
  ppReport, Db, DBTables, Wwquery, Wwdatsrc, ppComm, ppRelatv, ppDB,
  ppDBPipe, ppDBBDE;

type
  TdtmRelRubSalariais = class(TdtmReports)
    qryRelRubSalariais: TwwQuery;
    dsRelRubSalariais: TwwDataSource;
    pplRelRubSalariais: TppBDEPipeline;
    rpRelRubSalariais: TppReport;
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
    ppHeaderBand1: TppHeaderBand;
    ppDetailBand1: TppDetailBand;
    ppFooterBand1: TppFooterBand;
    rpBenefProvDBText10: TppDBText;
    rpBenefProvDBText11: TppDBText;
    rpBenefProvDBText12: TppDBText;
    rpBenefProvDBImage1: TppDBImage;
    rpBenefRetidosDBText7: TppDBText;
    rpBenefRetidosDBText8: TppDBText;
    lblTitulo: TppLabel;
    lblCodIntRub: TppLabel;
    lbldescrint: TppLabel;
    lblDescrExt: TppLabel;
    lblCodExtRub: TppLabel;
    lblCompoeIR: TppLabel;
    lblCompoePensAlim: TppLabel;
    lblTpRubrica: TppLabel;
    lblGrupoRubrica: TppLabel;
    lblInforme: TppLabel;
    ppLine1: TppLine;
    ppDBText1: TppDBText;
    ppDBText2: TppDBText;
    ppDBText3: TppDBText;
    ppDBText4: TppDBText;
    ppDBText5: TppDBText;
    ppDBText6: TppDBText;
    ppDBText7: TppDBText;
    ppDBText8: TppDBText;
    ppDBText9: TppDBText;
    lneRodape: TppLine;
    lblRodapeRelat: TppLabel;
    ppCalc46: TppSystemVariable;
    ppCalc45: TppSystemVariable;
    function MostraParam(Form: string): boolean; override;
    procedure pAbreFundacao;
    procedure pFechaFundacao;
    procedure qryRelRubSalariaisBeforeOpen(DataSet: TDataSet);
    procedure qryRelRubSalariaisAfterOpen(DataSet: TDataSet);
    procedure rpRelRubSalariaisBeforePrint(Sender: TObject);
    procedure qryRelRubSalariaisAfterClose(DataSet: TDataSet);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  dtmRelRubSalariais: TdtmRelRubSalariais;

implementation

Uses FPRelRubSalariais, uAdmPrevFB, FAguarde;

{$R *.DFM}

{ TdtmRelRubSalariais }

function TdtmRelRubSalariais.MostraParam(Form: string): boolean;
Var
  Frm : TForm;

begin
  If UpperCase(Form) = 'FRMRELRUBSALARIAIS' Then
    Frm := TFRMRELRUBSALARIAIS.Create(Application);

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

procedure TdtmRelRubSalariais.pAbreFundacao;
begin
  qryFundacao.Close;
  qryFundacao.ParamByName('PFUNDACAO').AsInteger := iIdFundacao;
  qryFundacao.Open;
end;

procedure TdtmRelRubSalariais.pFechaFundacao;
begin
  qryFundacao.Close;
end;

procedure TdtmRelRubSalariais.qryRelRubSalariaisBeforeOpen(
  DataSet: TDataSet);
begin
  inherited;
  frmAguarde.Mostra('Aguarde... Montando Relatório.');
  frmAguarde.Repaint;
end;

procedure TdtmRelRubSalariais.qryRelRubSalariaisAfterOpen(
  DataSet: TDataSet);
begin
  inherited;
  frmAguarde.Apaga;
end;

procedure TdtmRelRubSalariais.rpRelRubSalariaisBeforePrint(
  Sender: TObject);
begin
  inherited;
  pAbreFundacao;
end;

procedure TdtmRelRubSalariais.qryRelRubSalariaisAfterClose(
  DataSet: TDataSet);
begin
  inherited;
  pFechaFundacao;
end;

end.
