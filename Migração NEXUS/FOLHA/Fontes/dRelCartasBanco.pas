unit dRelCartasBanco;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  dReports, ppVar, ppBands, ppCtrls, ppPrnabl, ppClass, ppCache, ppProd,
  ppReport, Db, DBTables, Wwquery, Wwdatsrc, ppComm, ppRelatv, ppDB,
  ppDBPipe, ppDBBDE, ppStrtch, ppRichTx;

type
  TdtmRelCartasBanco = class(TdtmReports)
    rpCartasBanco: TppReport;
    ppCartasBanco: TppBDEPipeline;
    dsCartasBanco: TwwDataSource;
    qryCartasBanco: TwwQuery;
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
    qrRelResumoRubricaDBText1: TppDBText;
    qrRelResumoRubricaDBText7: TppDBText;
    qrRelResumoRubricaDBText8: TppDBText;
    qrRelResumoRubricaDBText9: TppDBText;
    qrRelResumoRubricaDBText2: TppDBText;
    ppLabel1: TppLabel;
    ppLblDia: TppLabel;
    ppLabel2: TppLabel;
    ppLblMes: TppLabel;
    ppLabel3: TppLabel;
    ppLblAno: TppLabel;
    ppLabel4: TppLabel;
    ppLblNumCarta: TppLabel;
    ppLabelPotadorForma: TppLabel;
    ppDbDataPrev: TppDBText;
    ppLblVersao: TppLabel;
    ppLblValorLiq: TppLabel;
    ppLblDataPagto: TppLabel;
    ppLabel17: TppLabel;
    ppDbVersao: TppDBText;
    ppDbListaDataPrev: TppDBText;
    ppDbQuant: TppDBText;
    ppSummaryBand1: TppSummaryBand;
    ppLabel174: TppLabel;
    ppCalc44: TppSystemVariable;
    ppCalc43: TppSystemVariable;
    ppLine62: TppLine;
    ppLabel14: TppLabel;
    ppDbValorLiq: TppDBText;
    ppLabel15: TppLabel;
    ppDBImage7: TppDBImage;
    ppRichText1: TppRichText;
    ppLabel6: TppLabel;
    ppDBText1: TppDBText;
    ppDBText2: TppDBText;
    ppLabel7: TppLabel;
    ppDBText3: TppDBText;
    ppDBText4: TppDBText;
    ppRichText2: TppRichText;
    procedure pAbreFundacao;
    procedure pFechaFundacao;
    procedure qryCartasBancoAfterClose(DataSet: TDataSet);
    procedure qryCartasBancoAfterOpen(DataSet: TDataSet);
    procedure qryCartasBancoBeforeOpen(DataSet: TDataSet);
    procedure rpCartasBancoBeforePrint(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
    function MostraParam(Form: string): boolean; override;
  end;

var
  dtmRelCartasBanco: TdtmRelCartasBanco;

implementation

Uses uAdmPrevFB, FPRelCartasBanco, fAguarde;

{$R *.DFM}

{ TdtmRelCartasBanco }

function TdtmRelCartasBanco.MostraParam(Form: string): boolean;
Var
  Frm : TForm;

begin
  If UpperCase(Form) = 'FRMPRELCARTASBANCO' Then
    Frm := TFrmPRelCartasBanco.Create(Application);

  If Frm = nil Then
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

procedure TdtmRelCartasBanco.pAbreFundacao;
begin
  qryFundacao.Close;
  qryFundacao.ParamByName('pFundacao').AsInteger := iIdFundacao;
  qryFundacao.Open;
end;

procedure TdtmRelCartasBanco.pFechaFundacao;
begin
  qryFundacao.Close;
end;

procedure TdtmRelCartasBanco.qryCartasBancoAfterClose(DataSet: TDataSet);
begin
  inherited;
  pFechaFundacao;
end;

procedure TdtmRelCartasBanco.qryCartasBancoAfterOpen(DataSet: TDataSet);
begin
  inherited;
  frmAguarde.Apaga;
end;

procedure TdtmRelCartasBanco.qryCartasBancoBeforeOpen(DataSet: TDataSet);
begin
  inherited;
  frmAguarde.Mostra('Aguarde... Montando Relatório.');
  frmAguarde.Repaint;
end;

procedure TdtmRelCartasBanco.rpCartasBancoBeforePrint(Sender: TObject);
begin
  inherited;
  pAbreFundacao;
end;

end.
