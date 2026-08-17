// *****************************************************************************
// ***************************** REGISTRO DE ALTERAÇÕES ************************
// *****************************************************************************
// Autor(a)    : Paulo Ramos
// Data        : 20/02/2006
// Pendência   : 21606
// Descricao   : Colocar em qryRendasAlteradas filtro 1=2, para otimizar abertura do módulo
//------------------------------------------------------------------------------
unit dRelRendasAlteradas;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  dReports, ppDB, Db, ppCtrls, ppBands, ppClass, ppVar, ppPrnabl, ppCache,
  ppProd, ppReport, DBTables, Wwquery, Wwdatsrc, ppComm, ppRelatv,
  ppDBPipe, ppDBBDE;

type
  TdtmRelRendasAlteradas = class(TdtmReports)
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
    ppRendasAlteradas: TppBDEPipeline;
    dsRendasAlteradas: TwwDataSource;
    qryRendasAlteradas: TwwQuery;
    rpRendasAlteradas: TppReport;
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
    rpBenefAlterGroup2: TppGroup;
    rpBenefAlterGroupHeaderBand2: TppGroupHeaderBand;
    rpBenefAlterLabel2: TppLabel;
    rpBenefAlterDBText2: TppDBText;
    rpBenefAlterGroupFooterBand2: TppGroupFooterBand;
    rpBenefAlterDBCalc2: TppDBCalc;
    rpBenefAlterLabel14: TppLabel;
    rpBenefAlterLine1: TppLine;
    rpBenefAlterLabel4: TppLabel;
    rpBenefAlterLabel5: TppLabel;
    rpBenefAlterLabel6: TppLabel;
    rpBenefAlterLabel7: TppLabel;
    rpBenefAlterLabel8: TppLabel;
    rpBenefAlterLabel11: TppLabel;
    rpBenefAlterLabel12: TppLabel;
    lblVariacao: TppLabel;
    dbVariacao: TppDBText;
    ppDBCalc1: TppDBCalc;
    lblFiltroSel: TppLabel;
    lblMostraFiltroSel: TppLabel;
    lblQtdRegistros: TppLabel;
    procedure pAbreFundacao;
    procedure pFechaFundacao;
    function MostraParam(Form: string): boolean; override;
    procedure rpRendasAlteradasBeforePrint(Sender: TObject);
    procedure qryRendasAlteradasAfterClose(DataSet: TDataSet);

  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  dtmRelRendasAlteradas: TdtmRelRendasAlteradas;

implementation

uses FParamRelRendasAlteradas, uAdmPrevFB, fAguarde;

{$R *.DFM}

{ TdtmRelRendasAlteradas }

function TdtmRelRendasAlteradas.MostraParam(Form: string): boolean;
Var
  Frm : TForm;

begin
  If UPPERCASE(Form) = 'FRMPRELRENDASALTERADAS' then frm := TFrmPRelRendasAlteradas.Create(Application);
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

procedure TdtmRelRendasAlteradas.pAbreFundacao;
begin
  qryFundacao.Close;
  qryFundacao.ParamByName('pFundacao').AsInteger := iIdFundacao;
  qryFundacao.Open;
end;

procedure TdtmRelRendasAlteradas.pFechaFundacao;
begin
  qryFundacao.Close;
end;

procedure TdtmRelRendasAlteradas.rpRendasAlteradasBeforePrint(
  Sender: TObject);
begin
  inherited;
  pAbreFundacao;
end;

procedure TdtmRelRendasAlteradas.qryRendasAlteradasAfterClose(
  DataSet: TDataSet);
begin
  inherited;
  pFechaFundacao;
end;

end.
