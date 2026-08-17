// *****************************************************************************
// ***************************** REGISTRO DE ALTERAÇÕES ************************
// *****************************************************************************
// Autor(a)    : Paulo Ramos
// Data        : 20/02/2006
// Pendência   : 21606
// Descricao   : Colocar em qryRelResumoRubrica filtro 1=2, para otimizar abertura do módulo
//------------------------------------------------------------------------------
unit dRelResRubrica;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  dReports, ppVar, ppBands, ppCtrls, ppPrnabl, ppClass, ppCache, ppProd,
  ppReport, Db, DBTables, Wwquery, Wwdatsrc, ppComm, ppRelatv, ppDB,
  ppDBPipe, ppDBBDE;

type
  TDtmRelResRubrica = class(TdtmReports)
    qryRelResumoRubrica: TwwQuery;
    qrRelResumoRubrica: TppReport;
    ppHeaderBand27: TppHeaderBand;
    ppLabel159: TppLabel;
    ppLine59: TppLine;
    lblCaptionPatro: TppLabel;
    ppLine60: TppLine;
    qrRelResumoRubricaLabel1: TppLabel;
    qrRelResumoRubricaLabel2: TppLabel;
    qrlblMesRef: TppLabel;
    qrRelResumoRubricaLabel4: TppLabel;
    qrRelResumoRubricaLabel5: TppLabel;
    qrRelResumoRubricaLabel3: TppLabel;
    qrRelResumoRubricaDBText1: TppDBText;
    qrRelResumoRubricaDBText2: TppDBText;
    qrRelResumoRubricaDBText7: TppDBText;
    qrRelResumoRubricaDBImage1: TppDBImage;
    qrRelResumoRubricaDBText8: TppDBText;
    qrRelResumoRubricaDBText9: TppDBText;
    qrRelResumoRubricaLabel8: TppLabel;
    qrRelResumoRubricaLabel9: TppLabel;
    lblPlano: TppLabel;
    qrRelResumoRubricaDBText10: TppDBText;
    ppDetailBand28: TppDetailBand;
    qrRelResumoRubricaDBText3: TppDBText;
    qrRelResumoRubricaDBText4: TppDBText;
    qrRelResumoRubricaDBText11: TppDBText;
    qrRelResumoRubricaDBText5: TppDBText;
    qrRelResumoRubricaDBText6: TppDBText;
    ppFooterBand27: TppFooterBand;
    ppLine62: TppLine;
    ppLabel174: TppLabel;
    ppCalc43: TppSystemVariable;
    ppCalc44: TppSystemVariable;
    qrRelResumoRubricaGroup1: TppGroup;
    qrRelResumoRubricaGroupHeaderBand1: TppGroupHeaderBand;
    ResTotLoteOuVersao: TppGroupFooterBand;
    lblSomaProventos: TppDBCalc;
    lblSomaDescontos: TppDBCalc;
    lblTotLoteOuVersao: TppLabel;
    lblLiqLoteOuVersao: TppLabel;
    qrRelResumoRubricaDBCalc1: TppDBCalc;
    qrRelResumoRubricaLine1: TppLine;
    qrRelResumoRubricaDBCalc2: TppDBCalc;
    plRelResumoRubrica: TppBDEPipeline;
    dsRelResumoRubrica: TwwDataSource;
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
    ppLine1: TppLine;
    dbHistorico: TppDBText;
    ppGroup1: TppGroup;
    ppGroupHeaderBand1: TppGroupHeaderBand;
    ppGroupFooterBand1: TppGroupFooterBand;
    ppLine2: TppLine;
    lblToPatro: TppLabel;
    ppLine3: TppLine;
    ppDBCalc1: TppDBCalc;
    ppDBCalc2: TppDBCalc;
    ppDBCalc3: TppDBCalc;
    ppSummaryBand1: TppSummaryBand;
    ppLine4: TppLine;
    ppLabel2: TppLabel;
    ppDBCalc4: TppDBCalc;
    ppLabel1: TppLabel;
    ppLabel3: TppLabel;
    ppDBCalc5: TppDBCalc;
    ppDBCalc6: TppDBCalc;
    ppDBCalc7: TppDBCalc;
    ppDBCalc8: TppDBCalc;
    ppLine5: TppLine;
    ppLabel4: TppLabel;
    ppLabel5: TppLabel;
    dbQuantRec: TppDBText;
    ppLabel6: TppLabel;
    ppDBText1: TppDBText;
    ppLabel7: TppLabel;
    ppDBCalc9: TppDBCalc;
    ppDBCalc11: TppDBCalc;
    ppDBCalc13: TppDBCalc;
    ppDBText2: TppDBText;
    ppGroup2: TppGroup;
    ppGroupHeaderBand2: TppGroupHeaderBand;
    ppGroupFooterBand2: TppGroupFooterBand;
    ppLine6: TppLine;
    ppLabel8: TppLabel;
    ppLabel9: TppLabel;
    ppDBCalc10: TppDBCalc;
    ppDBCalc12: TppDBCalc;
    ppDBCalc14: TppDBCalc;
    ppDBCalc15: TppDBCalc;
    ppDBCalc16: TppDBCalc;
    procedure qryRelResumoRubricaAfterClose(DataSet: TDataSet);
    procedure qryRelResumoRubricaAfterOpen(DataSet: TDataSet);
    procedure qryRelResumoRubricaBeforeOpen(DataSet: TDataSet);
    procedure qrRelResumoRubricaBeforePrint(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
    procedure pAbreFundacao;
    procedure pFechaFundacao;
    function MostraParam(Form: string): boolean; override;
  end;

var
  DtmRelResRubrica: TDtmRelResRubrica;

implementation

Uses
  uAdmPrevFB, uMensErro, fAguarde, FParamRelResRubrica;

{$R *.DFM}
function TDtmRelResRubrica.MostraParam(Form: string): boolean;
 Var frm: TForm;
begin
  if UPPERCASE(Form) = 'FRMPARAMRELRESRUBRICA' then frm := TFrmParamRelResRubrica.Create(Application);
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


procedure TDtmRelResRubrica.pAbreFundacao;
begin
  inherited;
  qryFundacao.Close;
  qryFundacao.ParamByName('pFundacao').AsInteger := iIdFundacao;
  qryFundacao.Open;
end;

procedure TDtmRelResRubrica.pFechaFundacao;
begin
  inherited;
  qryFundacao.Close;
end;

procedure TDtmRelResRubrica.qryRelResumoRubricaAfterClose(
  DataSet: TDataSet);
begin
  inherited;
  pFechaFundacao;
end;

procedure TDtmRelResRubrica.qryRelResumoRubricaAfterOpen(
  DataSet: TDataSet);
begin
  inherited;
  frmAguarde.Apaga;
end;

procedure TDtmRelResRubrica.qryRelResumoRubricaBeforeOpen(
  DataSet: TDataSet);
begin
  inherited;
  frmAguarde.Mostra('Aguarde... Montando Relatório.');
  frmAguarde.Repaint;
end;

procedure TDtmRelResRubrica.qrRelResumoRubricaBeforePrint(Sender: TObject);
begin
  inherited;
  pAbreFundacao;
end;

end.
