unit dRelDivergContrib;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  dReports, ppVar, ppBands, ppCtrls, ppPrnabl, ppClass, ppCache, ppProd,
  ppReport, Db, DBTables, Wwquery, Wwdatsrc, ppComm, ppRelatv, ppDB,
  ppDBPipe, ppDBBDE;

type
  TdtmRelDivergContrib = class(TdtmReports)
    qryRelDivergContrib: TwwQuery;
    dsRelDivergContrib: TwwDataSource;
    ppRelDivergContrib: TppBDEPipeline;
    rpRelDivergContrib: TppReport;
    ppHeaderBand1: TppHeaderBand;
    ppDetailBand1: TppDetailBand;
    ppFooterBand1: TppFooterBand;
    ppDBImage7: TppDBImage;
    rpRelaEntSaiFolhaDBText7: TppDBText;
    rpRelaEntSaiFolhaDBText10: TppDBText;
    rpRelaEntSaiFolhaDBText9: TppDBText;
    rpRelaEntSaiFolhaDBText8: TppDBText;
    rpRelaEntSaiFolhaDBText1: TppDBText;
    lblTituloRel: TppLabel;
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
    lblMatricula: TppLabel;
    lblInscricao: TppLabel;
    lblNome: TppLabel;
    lblContrib: TppLabel;
    lblMesAtual: TppLabel;
    lblVlrMesAnt: TppLabel;
    lblDif: TppLabel;
    dbMatric: TppDBText;
    dbInscricao: TppDBText;
    dbNome: TppDBText;
    dbContrib: TppDBText;
    lblValor1: TppLabel;
    lblValor2: TppLabel;
    dbMesAtual: TppDBText;
    dbMesAnt: TppDBText;
    dbDif: TppDBText;
    rpRelaEntSaiFolhaCalc2: TppSystemVariable;
    rpRelaEntSaiFolhaLine2: TppLine;
    ppLabel175: TppLabel;
    ppCalc46: TppSystemVariable;
    ppSummaryBand1: TppSummaryBand;
    lblValoresTotais: TppLabel;
    dbCalcTotMesAtual: TppDBCalc;
    dbCalcTotMesAnt: TppDBCalc;
    dbCalcTotDif: TppDBCalc;
    shpCor: TppShape;
    ppLine2: TppLine;
    ppLine3: TppLine;
    ppLine4: TppLine;
    lblLoteRef: TppLabel;
    lblMostraLoteRef: TppLabel;
    ppGroup1: TppGroup;
    ppGroupHeaderBand1: TppGroupHeaderBand;
    ppGroupFooterBand1: TppGroupFooterBand;
    lblQuant: TppLabel;
    dbQuant: TppDBCalc;
    lblVlrMesAtual: TppLabel;
    dbCalcTotContribMesAtual: TppDBCalc;
    dbCalcTotContribMesAnt: TppDBCalc;
    dbCalcTotContribDif: TppDBCalc;
    ppLine5: TppLine;
    ppLine6: TppLine;
    function MostraParam(Form : String): Boolean; Override;
    procedure pAbreFundacao;
    procedure pFechaFundacao;
    procedure qryRelDivergContribBeforeOpen(DataSet: TDataSet);
    procedure qryRelDivergContribAfterOpen(DataSet: TDataSet);
    procedure rpRelDivergContribBeforePrint(Sender: TObject);
    procedure qryRelDivergContribAfterClose(DataSet: TDataSet);
    procedure shpCorPrint(Sender: TObject);
    procedure rpRelDivergContribStartPage(Sender: TObject);
  private
    { Private declarations }
    cMudaCor : TColor;
    MudaCor  : TColor;
    procedure SetColor(Cor: TColor);
    
  public
    { Public declarations }
  published
    { Published declarations }
    property CorZebra: TColor read cMudacor write SetColor;

  end;

var
  dtmRelDivergContrib: TdtmRelDivergContrib;

implementation

Uses uAdmPrevFB, FPRelDivergContrib, FAguarde;

{$R *.DFM}

{ TdtmRelDivergContrib }

function TdtmRelDivergContrib.MostraParam(Form: String): Boolean;
Var
  Frm : TForm;

begin
  If UPPERCASE(Form) = 'FRMPRELDIVERGCONTRIB' Then Frm := TFrmPRelDivergContrib.Create(Application);
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

procedure TdtmRelDivergContrib.pAbreFundacao;
begin
  qryFundacao.Close;
  qryFundacao.ParamByName('PFUNDACAO').AsInteger := iIdFundacao;
  qryFundacao.Open;
end;

procedure TdtmRelDivergContrib.pFechaFundacao;
begin
  qryFundacao.Close;
end;

procedure TdtmRelDivergContrib.qryRelDivergContribBeforeOpen(
  DataSet: TDataSet);
begin
  inherited;
  FrmAguarde.Mostra('Aguarde... Montando Relatório.');
  FrmAguarde.Repaint;
end;

procedure TdtmRelDivergContrib.qryRelDivergContribAfterOpen(
  DataSet: TDataSet);
begin
  inherited;
  FrmAguarde.Apaga;
end;

procedure TdtmRelDivergContrib.rpRelDivergContribBeforePrint(
  Sender: TObject);
begin
  inherited;
  pAbreFundacao;
end;

procedure TdtmRelDivergContrib.qryRelDivergContribAfterClose(
  DataSet: TDataSet);
begin
  inherited;
  pFechaFundacao;
end;

procedure TdtmRelDivergContrib.shpCorPrint(Sender: TObject);
begin
  inherited;
  If MudaCor = CorZebra Then
    MudaCor := clWhite
  Else
    MudaCor := CorZebra;
  TppShape(Sender).Brush.Color := MudaCor;
end;

procedure TdtmRelDivergContrib.rpRelDivergContribStartPage(
  Sender: TObject);
begin
  inherited;
  MudaCor := CorZebra;
  shpCor.Brush.Color := clWhite;
end;

procedure TdtmRelDivergContrib.SetColor(Cor: TColor);
begin
  cMudaCor := Cor;
end;

end.
