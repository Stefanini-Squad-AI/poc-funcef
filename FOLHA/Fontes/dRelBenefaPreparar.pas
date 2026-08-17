unit dRelBenefaPreparar;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  dReports, ppVar, ppBands, ppCtrls, ppPrnabl, ppClass, ppCache, ppProd,
  ppReport, Db, DBTables, Wwquery, Wwdatsrc, ppComm, ppRelatv, ppDB,
  ppDBPipe, ppDBBDE;

type
  TdtmRelBenefaPreparar = class(TdtmReports)
    rpBenefaPreparar: TppReport;
    ppBenefaPreparar: TppBDEPipeline;
    dsBenefaPreparar: TwwDataSource;
    qryBenefaPreparar: TwwQuery;
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
    rpRelPensAlimDBImage1: TppDBImage;
    rpRelPensAlimDBText2: TppDBText;
    rpRelPensAlimDBText5: TppDBText;
    rpRelPensAlimDBText4: TppDBText;
    rpRelPensAlimDBText3: TppDBText;
    rpRelPensAlimDBText1: TppDBText;
    lblTitulo: TppLabel;
    lneTitulo: TppLine;
    lblMesRef: TppLabel;
    lblMostraMesRef: TppLabel;
    lblMatricula: TppLabel;
    ppLine1: TppLine;
    lblInscricao: TppLabel;
    lblBeneficiario: TppLabel;
    lblValAtual: TppLabel;
    lblDataInicio: TppLabel;
    lblDataFinal: TppLabel;
    lblUltimoMesPreparo: TppLabel;
    lblValorTot: TppLabel;
    lblValorSRB: TppLabel;
    lblValorInss: TppLabel;
    dbMatricula: TppDBText;
    dbInscricao: TppDBText;
    dbNome: TppDBText;
    dbDataInicio: TppDBText;
    dbDataFinal: TppDBText;
    dbUltPreparo: TppDBText;
    dbValorAtual: TppDBText;
    dbValorTotal: TppDBText;
    dbValorSRB: TppDBText;
    dbValorInss: TppDBText;
    lneRodape: TppLine;
    lblRodapeRelat: TppLabel;
    ppCalc45: TppSystemVariable;
    ppCalc46: TppSystemVariable;
    shpCor: TppShape;
    lblBeneficio: TppLabel;
    dbBeneficio: TppDBText;
    ppGroup1: TppGroup;
    ppGroupHeaderBand1: TppGroupHeaderBand;
    ppGroupFooterBand1: TppGroupFooterBand;
    lblPlano: TppLabel;
    dbPlano: TppDBText;
    lblTotPlano: TppLabel;
    ppLine2: TppLine;
    dbSumVlrAtual: TppDBCalc;
    dbSumVlrSRB: TppDBCalc;
    dbSumVlrInss: TppDBCalc;
    function MostraParam(Form: string): boolean; override;
    procedure pAbreFundacao;
    procedure pFechaFundacao;
    procedure qryBenefaPrepararAfterClose(DataSet: TDataSet);
    procedure qryBenefaPrepararBeforeOpen(DataSet: TDataSet);
    procedure rpBenefaPrepararBeforePrint(Sender: TObject);
    procedure qryBenefaPrepararAfterOpen(DataSet: TDataSet);
    procedure shpCorPrint(Sender: TObject);
    procedure rpBenefaPrepararStartPage(Sender: TObject);
  private
    { Private declarations }
    cMudaCor : TColor;
    MudaCor  : TColor;
    procedure SetColor(Cor: TColor);

  public
    { Public declarations }

  published
    property CorZebra: TColor read cMudaCor write SetColor;

  end;

var
  dtmRelBenefaPreparar: TdtmRelBenefaPreparar;

implementation

Uses FPRelBenefaPreparar, uAdmPrevFB, fAguarde;

{$R *.DFM}

{ TdtmRelBenefaPreparar }

function TdtmRelBenefaPreparar.MostraParam(Form: string): boolean;
Var
  Frm : TForm;

begin
  If UPPERCASE(Form) = 'FRMPRELBENEFAPREPARAR' Then Frm := TFrmPRelBenefaPreparar.Create(Application);
  If Frm = Nil Then Result := True
  Else
  Begin
    With Frm Do
    Begin
      Result := (ShowModal = mrOk);
      Free;
    End;
  End;
end;

procedure TdtmRelBenefaPreparar.pAbreFundacao;
begin
  qryFundacao.Close;
  qryFundacao.ParamByName('pFundacao').AsInteger := iIdFundacao;
  qryFundacao.Open;
end;

procedure TdtmRelBenefaPreparar.pFechaFundacao;
begin
  qryFundacao.Close;
end;

procedure TdtmRelBenefaPreparar.qryBenefaPrepararAfterClose(
  DataSet: TDataSet);
begin
  inherited;
  pFechaFundacao;
end;

procedure TdtmRelBenefaPreparar.qryBenefaPrepararBeforeOpen(
  DataSet: TDataSet);
begin
  inherited;
  frmAguarde.Mostra('Aguarde... Montando Relatório.');
  frmAguarde.Repaint;
end;

procedure TdtmRelBenefaPreparar.rpBenefaPrepararBeforePrint(
  Sender: TObject);
begin
  inherited;
  pAbreFundacao;
end;

procedure TdtmRelBenefaPreparar.qryBenefaPrepararAfterOpen(
  DataSet: TDataSet);
begin
  inherited;
  frmAguarde.Apaga;
end;

procedure TdtmRelBenefaPreparar.SetColor(Cor: TColor);
begin
  cMudaCor := Cor;
end;

procedure TdtmRelBenefaPreparar.shpCorPrint(Sender: TObject);
begin
  inherited;
  if MudaCor = CorZebra Then
    MudaCor := clWhite
  else
    MudaCor := CorZebra;
  TppShape(Sender).Brush.Color := MudaCor;
end;

procedure TdtmRelBenefaPreparar.rpBenefaPrepararStartPage(Sender: TObject);
begin
  inherited;
  MudaCor := CorZebra;
  shpCor.Brush.Color := clWhite;
end;

end.
