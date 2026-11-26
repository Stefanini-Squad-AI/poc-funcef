unit dRelBenefRetidos;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  dReports, ppCtrls, ppBands, ppClass, ppVar, ppPrnabl, ppCache, ppProd,
  ppReport, Db, DBTables, Wwquery, Wwdatsrc, ppComm, ppRelatv, ppDB,
  ppDBPipe, ppDBBDE, URegra, uSistema;

type
  TdtmRelBenefRetidos = class(TdtmReports)
    plBenefRetidos: TppBDEPipeline;
    dsBenefRetidos: TwwDataSource;
    qryBenefRetidos: TwwQuery;
    rpBenefRetidos: TppReport;
    ppHeaderBand20: TppHeaderBand;
    rpBenefRetidosLabel10: TppLabel;
    rpBenefProvDBText10: TppDBText;
    rpBenefProvDBText11: TppDBText;
    rpBenefProvDBText12: TppDBText;
    rpBenefProvDBImage1: TppDBImage;
    rpBenefRetidosDBText7: TppDBText;
    rpBenefRetidosDBText8: TppDBText;
    ppDetailBand21: TppDetailBand;
    rpBenefRetidosDBText3: TppDBText;
    rpBenefRetidosDBText4: TppDBText;
    rpBenefRetidosDBText5: TppDBText;
    rpBenefRetidosDBText6: TppDBText;
    ppFooterBand20: TppFooterBand;
    ppLabel94: TppLabel;
    ppLine40: TppLine;
    ppCalc31: TppSystemVariable;
    ppCalc32: TppSystemVariable;
    rpBenefRetidosGroup1: TppGroup;
    rpBenefRetidosGroupHeaderBand1: TppGroupHeaderBand;
    rpBenefRetidosGroupFooterBand1: TppGroupFooterBand;
    rpBenefRetidosLabel9: TppLabel;
    rpBenefRetidosDBCalc2: TppDBCalc;
    rpBenefRetidosLine3: TppLine;
    rpBenefRetidosGroup2: TppGroup;
    rpBenefRetidosGroupHeaderBand2: TppGroupHeaderBand;
    rpBenefRetidosLabel2: TppLabel;
    rpBenefRetidosLabel3: TppLabel;
    rpBenefRetidosDBText1: TppDBText;
    rpBenefRetidosDBText2: TppDBText;
    rpBenefRetidosLine1: TppLine;
    rpBenefRetidosLabel4: TppLabel;
    rpBenefRetidosLabel5: TppLabel;
    rpBenefRetidosLabel6: TppLabel;
    rpBenefRetidosLabel7: TppLabel;
    rpBenefRetidosLine5: TppLine;
    rpBenefRetidosGroupFooterBand2: TppGroupFooterBand;
    rpBenefRetidosLabel8: TppLabel;
    rpBenefRetidosDBCalc1: TppDBCalc;
    rpBenefRetidosLine2: TppLine;
    rpBenefRetidosGroup3: TppGroup;
    rpBenefRetidosGroupHeaderBand3: TppGroupHeaderBand;
    rpBenefRetidosGroupFooterBand3: TppGroupFooterBand;
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
    lblDataRetencao: TppLabel;
    dbDataRetencao: TppDBText;
    lblMatricula: TppLabel;
    dbMatricula: TppDBText;
    function MostraParam(Form: string): boolean; override;
    procedure pAbreFundacao;
    procedure pFechaFundacao;
    procedure qryBenefRetidosBeforeOpen(DataSet: TDataSet);
    procedure qryBenefRetidosAfterOpen(DataSet: TDataSet);
    procedure rpBenefRetidosBeforePrint(Sender: TObject);
    procedure qryBenefRetidosAfterClose(DataSet: TDataSet);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  dtmRelBenefRetidos: TdtmRelBenefRetidos;

implementation

uses FParamRelBenefRetidos, uAdmPrevFB, FAguarde;

{$R *.DFM}

function TdtmRelBenefRetidos.MostraParam(Form: string): boolean;
Var
  Frm : TForm;

begin
  If UPPERCASE(Form) = 'FRMPARAMRELBENEFRETIDO' Then Frm := TFrmParamRelBenefRetido.Create(Application);
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

procedure TdtmRelBenefRetidos.pAbreFundacao;
begin
  qryFundacao.Close;
  qryFundacao.ParamByName('PFUNDACAO').AsInteger := iIdFundacao;
  qryFundacao.Open;
end;

procedure TdtmRelBenefRetidos.pFechaFundacao;
begin
  qryFundacao.Close;
end;

procedure TdtmRelBenefRetidos.qryBenefRetidosBeforeOpen(DataSet: TDataSet);
begin
  inherited;
  frmAguarde.Mostra('Aguarde... Montando Relatório.');
  frmAguarde.Repaint;
end;

procedure TdtmRelBenefRetidos.qryBenefRetidosAfterOpen(DataSet: TDataSet);
begin
  inherited;
  frmAguarde.Apaga;
end;

procedure TdtmRelBenefRetidos.rpBenefRetidosBeforePrint(Sender: TObject);
begin
  inherited;
  pAbreFundacao;
end;

procedure TdtmRelBenefRetidos.qryBenefRetidosAfterClose(DataSet: TDataSet);
begin
  inherited;
  pFechaFundacao;
end;

end.
