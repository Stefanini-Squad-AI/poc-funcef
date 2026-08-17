unit dRelLancNaoProcessados;

// *****************************************************************************
// ***************************** REGISTRO DE ALTERAÇÕES ************************
// *****************************************************************************
// Autor(a)  : Paulo Ramos
// Rotina    : Ajuste em querys
// Data      : 15/01/2007
// Pendencia : 18554
// Alteração : Tratar o campo SITENVIO como CHAR, colocando plics quando
//   necessário.
//-----------------------------------------------------------------------------

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  dReports, ppVar, ppBands, ppCtrls, ppPrnabl, ppClass, ppCache, ppProd,
  ppReport, Db, DBTables, Wwquery, Wwdatsrc, ppComm, ppRelatv, ppDB,
  ppDBPipe, ppDBBDE, UadmPrevFB, fAguarde;

type
  TdtmRelLancNaoProcessados = class(TdtmReports)
    qryPrincipal: TwwQuery;
    dsPrincipal: TwwDataSource;
    ppPrincipal: TppBDEPipeline;
    rpPrincipal: TppReport;
    ppHeaderBand1: TppHeaderBand;
    ppLabel1: TppLabel;
    ppLine1: TppLine;
    ppDetailBand1: TppDetailBand;
    ppFooterBand1: TppFooterBand;
    ppLine2: TppLine;
    ppLabel3: TppLabel;
    ppSystemVariable1: TppSystemVariable;
    ppSystemVariable2: TppSystemVariable;
    ppFundacao: TppBDEPipeline;
    dsFundacao: TwwDataSource;
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
    rpRelaEntSaiFolhaDBText7: TppDBText;
    rpRelaEntSaiFolhaDBText10: TppDBText;
    rpRelaEntSaiFolhaDBText9: TppDBText;
    rpRelaEntSaiFolhaDBText8: TppDBText;
    rpRelaEntSaiFolhaDBText1: TppDBText;
    ppDBImage7: TppDBImage;
    ppGroup2: TppGroup;
    ppGroupHeaderBand2: TppGroupHeaderBand;
    ppGroupFooterBand2: TppGroupFooterBand;
    ppGroup1: TppGroup;
    ppGroupHeaderBand1: TppGroupHeaderBand;
    ppGroupFooterBand1: TppGroupFooterBand;
    ppDBText1: TppDBText;
    ppLabel2: TppLabel;
    ppLabel4: TppLabel;
    ppDBText2: TppDBText;
    ppLine3: TppLine;
    ppGroup3: TppGroup;
    ppGroupHeaderBand3: TppGroupHeaderBand;
    ppGroupFooterBand3: TppGroupFooterBand;
    ppLabel5: TppLabel;
    ppDBText3: TppDBText;
    ppDBText4: TppDBText;
    ppDBText5: TppDBText;
    ppDBText6: TppDBText;
    ppDBText7: TppDBText;
    ppDBText8: TppDBText;
    ppLine5: TppLine;
    ppLine4: TppLine;
    ppLabel6: TppLabel;
    ppDBText9: TppDBText;
    ppLabel7: TppLabel;
    ppLabel8: TppLabel;
    ppLabel9: TppLabel;
    ppLabel10: TppLabel;
    ppLine6: TppLine;
    ppLabel11: TppLabel;
    ppLabel12: TppLabel;
    ppLabel13: TppLabel;
    ppDBText10: TppDBText;
    ppDBText11: TppDBText;
    procedure pAbreFundacao;
    procedure qryPrincipalAfterOpen(DataSet: TDataSet);
    function MostraParam(Form: string): boolean; override;
    procedure qryPrincipalBeforeOpen(DataSet: TDataSet);
  private
    { Private declarations }
  public
    { Public declarations }
     procedure pFechaFundacao;
  end;

var
  dtmRelLancNaoProcessados: TdtmRelLancNaoProcessados;

implementation

uses FParamRelLancnaoProcessados;

{$R *.DFM}


function TdtmRelLancNaoProcessados.MostraParam(Form: string): boolean;
 var frm: TForm;
begin
  if UPPERCASE(Form) = 'FRMPARAMRELLANCNAOPROCECSSADOS'   then frm := TFrmParamRelLancNaoProcecssados.Create(Application)
  else
    frm:=nil;

  if frm = nil then
    Result:= true
  else
  begin
    with frm do
    begin
      Result:= (ShowModal = mrOk);
      free;
    end;
  end;
end;

procedure TdtmRelLancNaoProcessados.pAbreFundacao;
begin
  inherited;
  qryFundacao.Close;
  qryFundacao.ParamByName('pFundacao').AsInteger := iIdFundacao;
  qryFundacao.Open;
end;

procedure TdtmRelLancNaoProcessados.pFechaFundacao;
begin
  qryFundacao.Close;
end;

procedure TdtmRelLancNaoProcessados.qryPrincipalAfterOpen(
  DataSet: TDataSet);
begin
  inherited;
  frmAguarde.Apaga;
end;

procedure TdtmRelLancNaoProcessados.qryPrincipalBeforeOpen(
  DataSet: TDataSet);
begin
  inherited;
  pAbreFundacao;
  frmAguarde.Mostra('Aguarde... Montando Relatório.');
  frmAguarde.Repaint;

end;

end.
