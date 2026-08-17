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
    qrRelResumoRubricaGroupFooterBand1: TppGroupFooterBand;
    lblSomaProventos: TppDBCalc;
    lblSomaDescontos: TppDBCalc;
    qrRelResumoRubricaLabel6: TppLabel;
    qrRelResumoRubricaLabel7: TppLabel;
    qrRelResumoRubricaDBCalc1: TppDBCalc;
    qrRelResumoRubricaLine1: TppLine;
    qrRelResumoRubricaDBCalc2: TppDBCalc;
    qrRelResumoRubricaLine2: TppLine;
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
    ppLine1: TppLine;
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
  uAdmPrev, uMensErro, fAguarde, FParamRelResRubrica;

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
