// *****************************************************************************
// ***************************** REGISTRO DE ALTERAÇÕES ************************
// *****************************************************************************
// Autor(a)    : Paulo Ramos
// Data        : 20/02/2006
// Pendência   : 21606
// Descricao   : Colocar em qryFichaFinanc filtro 1=2, para otimizar abertura do módulo
//------------------------------------------------------------------------------
unit dRelFichaFinanc;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  dReports, ppDB, Db, ppBands, ppClass, ppCtrls, ppReport, ppStrtch,
  ppSubRpt, ppVar, ppPrnabl, ppCache, ppProd, DBTables, Wwquery, Wwdatsrc,
  ppComm, ppRelatv, ppDBPipe, ppDBBDE;

type
  TdtmRelFichaFinanc = class(TdtmReports)
    ppFichaFinanc: TppBDEPipeline;
    dsFichaFinanc: TwwDataSource;
    qryFichaFinanc: TwwQuery;
    rpFichaFinanc: TppReport;
    ppHeaderBand7: TppHeaderBand;
    ppLabel50: TppLabel;
    ppLine15: TppLine;
    rpFichaFinancDBImage1: TppDBImage;
    rpFichaFinancDBText1: TppDBText;
    rpFichaFinancDBText2: TppDBText;
    rpFichaFinancDBText3: TppDBText;
    rpFichaFinancDBText4: TppDBText;
    rpFichaFinancLabel2: TppLabel;
    rpFichaFinancDBText5: TppDBText;
    rpFichaFinancDBText6: TppDBText;
    rpFichaFinancDBText7: TppDBText;
    rpFichaFinancDBText8: TppDBText;
    ppDetailBand8: TppDetailBand;
    rpFichaFinancDBText11: TppDBText;
    rpFichaFinancDBText12: TppDBText;
    rpFichaFinancDBText13: TppDBText;
    rpFichaFinancDBText14: TppDBText;
    ppFooterBand7: TppFooterBand;
    ppLine16: TppLine;
    ppLabel52: TppLabel;
    ppCalc15: TppSystemVariable;
    ppCalc16: TppSystemVariable;
    rpFichaFinancSummaryBand1: TppSummaryBand;
    rpFichaFinancSubReport1: TppSubReport;
    rpFichaFinancChildReport1: TppChildReport;
    rpFichaFinancChildReport1TitleBand1: TppTitleBand;
    rpFichaFinancChildReport1Label1: TppLabel;
    rpFichaFinancChildReport1Label2: TppLabel;
    rpFichaFinancChildReport1Label3: TppLabel;
    rpFichaFinancChildReport1Label4: TppLabel;
    rpFichaFinancChildReport1Label5: TppLabel;
    ppLine63: TppLine;
    rpFichaFinancChildReport1DetailBand1: TppDetailBand;
    rpFichaFinancChildReport1DBText1: TppDBText;
    rpFichaFinancChildReport1DBText2: TppDBText;
    rpFichaFinancChildReport1DBText3: TppDBText;
    rpFichaFinancChildReport1DBText4: TppDBText;
    rpFichaFinancChildReport1SummaryBand1: TppSummaryBand;
    lbprovento1: TppDBCalc;
    lbdesconto1: TppDBCalc;
    rpFichaFinancChildReport1Label6: TppLabel;
    rpFichaFinancChildReport1Label7: TppLabel;
    lbliquido1: TppLabel;
    ppLine70: TppLine;
    rpFichaFinancGroup1: TppGroup;
    rpFichaFinancGroupHeaderBand1: TppGroupHeaderBand;
    rpFichaFinancDBText9: TppDBText;
    rpFichaFinancLabel1: TppLabel;
    rpFichaFinancGroupFooterBand1: TppGroupFooterBand;
    rpFichaFinancLine3: TppLine;
    rpFichaFinancGroup2: TppGroup;
    rpFichaFinancGroupHeaderBand2: TppGroupHeaderBand;
    rpFichaFinancDBText10: TppDBText;
    rpFichaFinancLabel3: TppLabel;
    rpFichaFinancLabel4: TppLabel;
    rpFichaFinancLabel5: TppLabel;
    Provento: TppLabel;
    Desconto: TppLabel;
    rpFichaFinancLine1: TppLine;
    rpFichaFinancGroupFooterBand2: TppGroupFooterBand;
    lbprovento: TppDBCalc;
    lbdesconto: TppDBCalc;
    rpFichaFinancLine2: TppLine;
    rpFichaFinancLabel6: TppLabel;
    rpFichaFinancLabel8: TppLabel;
    lbliquido: TppLabel;
    plAgrupaRub: TppBDEPipeline;
    dsAgrupaRub: TwwDataSource;
    qryAgrupaRub: TwwQuery;
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
    lblInformativa: TppLabel;
    ppDBText1: TppDBText;
    ppDBImage1: TppDBImage;
    ppDBText2: TppDBText;
    ppDBText3: TppDBText;
    ppDBText4: TppDBText;
    ppDBText5: TppDBText;
    ppLabel1: TppLabel;
    ppDBText6: TppDBText;
    ppDBText7: TppDBText;
    ppDBText8: TppDBText;
    ppDBText9: TppDBText;
    ppFooterBand1: TppFooterBand;
    ppSystemVariable1: TppSystemVariable;
    ppSystemVariable2: TppSystemVariable;
    ppLine1: TppLine;
    ppLabel2: TppLabel;
    function MostraParam(Form: string): boolean; override;
    procedure pAbreFundacao;
    procedure pFechaFundacao;
    procedure rpFichaFinancGroupFooterBand2BeforePrint(Sender: TObject);
    procedure qryFichaFinancAfterClose(DataSet: TDataSet);
    procedure rpFichaFinancBeforePrint(Sender: TObject);
    procedure qryFichaFinancBeforeOpen(DataSet: TDataSet);
    procedure qryAgrupaRubAfterOpen(DataSet: TDataSet);
    procedure rpFichaFinancChildReport1SummaryBand1BeforePrint(
      Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  dtmRelFichaFinanc: TdtmRelFichaFinanc;

implementation

uses FParamRelFicha, uAdmPrevFB, FAguarde;

{$R *.DFM}

function TdtmRelFichaFinanc.MostraParam(Form: string): boolean;
Var
  Frm : TForm;

begin
  If UPPERCASE(Form) = 'FRMPARAMRELFICHA' Then
    Frm := TFrmParamRelFicha.Create(Application);

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

procedure TdtmRelFichaFinanc.rpFichaFinancGroupFooterBand2BeforePrint(
  Sender: TObject);
begin
  inherited;
  lbliquido.caption := floattostr(strtofloat(lbprovento.text) -
                       strtofloat(lbdesconto.text));
end;

procedure TdtmRelFichaFinanc.pAbreFundacao;
begin
  qryFundacao.Close;
  qryFundacao.ParamByName('PFUNDACAO').AsInteger := iIdFundacao;
  qryFundacao.Open
end;

procedure TdtmRelFichaFinanc.pFechaFundacao;
begin
  qryFundacao.Close;
end;

procedure TdtmRelFichaFinanc.qryFichaFinancAfterClose(DataSet: TDataSet);
begin
  inherited;
  pFechaFundacao;
end;

procedure TdtmRelFichaFinanc.rpFichaFinancBeforePrint(Sender: TObject);
begin
  inherited;
  pAbreFundacao;
end;

procedure TdtmRelFichaFinanc.qryFichaFinancBeforeOpen(DataSet: TDataSet);
begin
  inherited;
  frmAguarde.Mostra('Aguarde... Montando Relatório.');
  frmAguarde.Repaint;
end;

procedure TdtmRelFichaFinanc.qryAgrupaRubAfterOpen(DataSet: TDataSet);
begin
  inherited;
  frmAguarde.Apaga;
end;

procedure TdtmRelFichaFinanc.rpFichaFinancChildReport1SummaryBand1BeforePrint(
  Sender: TObject);
begin
  inherited;
  lbliquido1.caption := floattostr(strtofloat(lbprovento1.text) -
                        strtofloat(lbdesconto1.text));
end;

end.
