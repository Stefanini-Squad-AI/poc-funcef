// *****************************************************************************
// ***************************** REGISTRO DE ALTERAÇÕES ************************
// *****************************************************************************
// Autor(a)    : Paulo Ramos
// Data        : 20/02/2006
// Pendência   : 21606
// Descricao   : Colocar em qryRubricas filtro 1=2, para otimizar abertura do módulo
//------------------------------------------------------------------------------
unit dRelRubricas;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  dReports, ppVar, ppBands, ppCtrls, ppPrnabl, ppClass, ppCache, ppProd,
  ppReport, Db, DBTables, Wwquery, Wwdatsrc, ppComm, ppRelatv, ppDB,
  ppDBPipe, ppDBBDE;

type
  TdtmRelRubricas = class(TdtmReports)
    qryRubricas: TwwQuery;
    dsRubricas: TwwDataSource;
    plRubricas: TppBDEPipeline;
    ppRubricas: TppReport;
    ppHeaderBand28: TppHeaderBand;
    ppLabel165: TppLabel;
    ppLine61: TppLine;
    ppLine64: TppLine;
    ppDBText18: TppDBText;
    ppDBText22: TppDBText;
    ppDBText76: TppDBText;
    ppDBImage7: TppDBImage;
    ppDBText77: TppDBText;
    ppDBText78: TppDBText;
    ppDetailBand29: TppDetailBand;
    ppDBText101: TppDBText;
    ppDBText102: TppDBText;
    ppRubricasDBText1: TppDBText;
    ppRubricasDBText2: TppDBText;
    ppRubricasDBText5: TppDBText;
    ppFooterBand28: TppFooterBand;
    ppLabel175: TppLabel;
    ppLine65: TppLine;
    ppCalc45: TppSystemVariable;
    ppCalc46: TppSystemVariable;
    ppRubricasSummaryBand1: TppSummaryBand;
    ppRubricasDBCalc2: TppDBCalc;
    ppRubricasLabel1: TppLabel;
    ppRubricasDBCalc4: TppDBCalc;
    ppdbCalcTotalGeral: TppDBCalc;
    ppRubricasGroup1: TppGroup;
    ppRubricasGroupHeaderBand1: TppGroupHeaderBand;
    ppRubricasLabel3: TppLabel;
    ppRubricasLine1: TppLine;
    ppRubricasLabel7: TppLabel;
    ppRubricasDBText6: TppDBText;
    ppRubricasDBText7: TppDBText;
    ppRubricasDBText3: TppDBText;
    ppRubricasDBText4: TppDBText;
    ppRubricasGroupFooterBand1: TppGroupFooterBand;
    ppdbCalcTotalPatro: TppDBCalc;
    ppRubricasLabel6: TppLabel;
    ppRubricasLine2: TppLine;
    ppdbCalcResiduoPatro: TppDBCalc;
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
    ppLblMesRef: TppLabel;
    ppLblPatro: TppLabel;
    ppLblPlano: TppLabel;
    qrlblMesRef: TppLabel;
    qrDbTxtNomePatro: TppDBText;
    qrLblPlano: TppLabel;
    ppGroup1: TppGroup;
    ppGroupHeaderBand1: TppGroupHeaderBand;
    ppGroupFooterBand1: TppGroupFooterBand;
    ppLabel1: TppLabel;
    ppDBText1: TppDBText;
    ppLine1: TppLine;
    ppLabel2: TppLabel;
    ppdbCalcQuantPatro: TppDBCalc;
    ppLabel3: TppLabel;
    ppdbCalcQuantGeral: TppDBCalc;
    ppdbCalcResiduoGeral: TppDBCalc;
    ppLine2: TppLine;
    ppLabel4: TppLabel;
    pplblPlanoContabil: TppLabel;
    function MostraParam(Form: string): boolean; override;
    procedure ppRubricasDBText4Print(Sender: TObject);
    procedure qryRubricasAfterClose(DataSet: TDataSet);
    procedure pAbreFundacao;
    procedure pFechaFundacao;
    procedure ppRubricasBeforePrint(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  dtmRelRubricas: TdtmRelRubricas;

implementation

uses uAdmPrevFB, FPRelRubrica, fAguarde;

{$R *.DFM}

{ TdtmRelRubricas }

function TdtmRelRubricas.MostraParam(Form: string): boolean;
 Var frm: TForm;
begin
  if UPPERCASE(Form) = 'FRMPRELRUBRICA' then frm := TfrmPRelRubrica.Create(Application);
  if frm = nil then Result := true
  else
  begin
    with frm do
    begin
      Result := (ShowModal = mrOk);
      free;
    end;
  end;
end;

procedure TdtmRelRubricas.pAbreFundacao;
begin
  inherited;
  QryFundacao.Close;
  QryFundacao.ParamByName('pFundacao').AsInteger := iIdFundacao;
  QryFundacao.Open;
end;

procedure TdtmRelRubricas.pFechaFundacao;
begin
  inherited;
  QryFundacao.Close;
end;

procedure TdtmRelRubricas.ppRubricasDBText4Print(Sender: TObject);
begin
  inherited;
  ppDBText101.visible:=dtmRelRubricas.qryRubricas.fieldbyname('TITULO3').asstring<>'';
  ppdbCalcResiduoPatro.visible:=dtmRelRubricas.qryRubricas.fieldbyname('TITULO3').asstring<>'';
  ppdbCalcResiduoGeral.visible:=dtmRelRubricas.qryRubricas.fieldbyname('TITULO3').asstring<>'';
end;

procedure TdtmRelRubricas.qryRubricasAfterClose(DataSet: TDataSet);
begin
  inherited;
  pFechaFundacao;
end;

procedure TdtmRelRubricas.ppRubricasBeforePrint(Sender: TObject);
begin
  inherited;
  pAbreFundacao;
end;

end.

