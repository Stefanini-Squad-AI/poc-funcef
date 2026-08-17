// *****************************************************************************
// ***************************** REGISTRO DE ALTERAÇÕES ************************
// *****************************************************************************
// Autor(a)    : Paulo Ramos
// Data        : 20/02/2006
// Pendência   : 21606
// Descricao   : Colocar em qryTotSuplemInt filtro 1=2, para otimizar abertura do módulo
//------------------------------------------------------------------------------
unit dRelTotSuplemInt;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  dReports, Db, ppCtrls, ppBands, ppClass, ppDB, ppVar, ppPrnabl, ppCache,
  ppProd, ppReport, DBTables, Wwquery, Wwdatsrc, ppComm, ppRelatv,
  ppDBPipe, ppDBBDE;

type
  TdtmRelTotSuplemInt = class(TdtmReports)
    qryTotSuplemInt: TwwQuery;
    dsTotSuplemInt: TwwDataSource;
    ppTotSuplemInt: TppBDEPipeline;
    rpTotSuplemInt: TppReport;
    ppHeaderBand28: TppHeaderBand;
    ppDBImage11: TppDBImage;
    ppDBText110: TppDBText;
    ppDBText116: TppDBText;
    ppDBText117: TppDBText;
    ppDBText118: TppDBText;
    ppDBText120: TppDBText;
    ppLabel113: TppLabel;
    ppDetailBand29: TppDetailBand;
    ppDBText54: TppDBText;
    ppDBText77: TppDBText;
    ppDBText78: TppDBText;
    ppDBText101: TppDBText;
    ppDBText2: TppDBText;
    ppFooterBand28: TppFooterBand;
    ppSystemVariable5: TppSystemVariable;
    ppSystemVariable6: TppSystemVariable;
    ppLabel114: TppLabel;
    ppLine79: TppLine;
    ppGroup6: TppGroup;
    ppGroupHeaderBand6: TppGroupHeaderBand;
    ppLabel105: TppLabel;
    ppDBText53: TppDBText;
    ppLine73: TppLine;
    LbVersao: TppLabel;
    ppGroupFooterBand6: TppGroupFooterBand;
    ppGroup5: TppGroup;
    ppGroupHeaderBand5: TppGroupHeaderBand;
    ppDBText76: TppDBText;
    ppLabel107: TppLabel;
    ppLabel108: TppLabel;
    ppLabel106: TppLabel;
    ppLabel109: TppLabel;
    ppLine74: TppLine;
    ppLabel110: TppLabel;
    ppLabel2: TppLabel;
    ppGroupFooterBand5: TppGroupFooterBand;
    ppDBCalc5: TppDBCalc;
    ppLine75: TppLine;
    ppLine76: TppLine;
    ppDBCalc6: TppDBCalc;
    ppLine78: TppLine;
    ppDBCalc17: TppDBCalc;
    lblTotPlano: TppLabel;
    ppDBCalc2: TppDBCalc;
    ppLine2: TppLine;
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
    lblTotPatro: TppLabel;
    dbQuant: TppDBCalc;
    dbTotSRB: TppDBCalc;
    dbTotINSS: TppDBCalc;
    dbTotProv: TppDBCalc;
    LneQuant: TppLine;
    LneTotSRB: TppLine;
    LneTotINSS: TppLine;
    LneTotProv: TppLine;
    ppSummaryBand1: TppSummaryBand;
    ppLabel1: TppLabel;
    ppDBCalc1: TppDBCalc;
    ppLine1: TppLine;
    ppDBCalc3: TppDBCalc;
    ppLine3: TppLine;
    ppDBCalc4: TppDBCalc;
    ppLine4: TppLine;
    ppDBCalc7: TppDBCalc;
    ppLine5: TppLine;
    Function MostraParam(Form: String): Boolean; OverRide;
    procedure pAbreFundacao;
    procedure pFechaFundacao;
    procedure rpTotSuplemIntBeforePrint(Sender: TObject);
    procedure qryTotSuplemIntAfterOpen(DataSet: TDataSet);
    procedure qryTotSuplemIntBeforeOpen(DataSet: TDataSet);
    procedure qryTotSuplemIntAfterClose(DataSet: TDataSet);

  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  dtmRelTotSuplemInt: TdtmRelTotSuplemInt;

implementation

Uses uAdmPrevFB, FAguarde, FPRelTotSuplemInt;

{$R *.DFM}

{ TdtmRelTotSuplemInt }

function TdtmRelTotSuplemInt.MostraParam(Form: String): Boolean;
Var
  Frm : TForm;

begin
  If UPPERCASE(Form) = 'FRMPRELTOTSUPLEMINT' Then Frm := TFrmPrelTotSuplemInt.Create(Application);
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

procedure TdtmRelTotSuplemInt.pAbreFundacao;
begin
  qryFundacao.Close;
  qryFundacao.ParamByName('pFundacao').AsInteger := iIdFundacao;
  qryFundacao.Open;
end;

procedure TdtmRelTotSuplemInt.pFechaFundacao;
begin
  qryFundacao.Close;
end;

procedure TdtmRelTotSuplemInt.rpTotSuplemIntBeforePrint(Sender: TObject);
begin
  inherited;
  pAbreFundacao;
end;

procedure TdtmRelTotSuplemInt.qryTotSuplemIntAfterOpen(DataSet: TDataSet);
begin
  inherited;
  frmAguarde.Apaga;
end;

procedure TdtmRelTotSuplemInt.qryTotSuplemIntBeforeOpen(DataSet: TDataSet);
begin
  inherited;
  frmAguarde.Mostra('Aguarde... Montando Relatório.');
  frmAguarde.Repaint;
end;

procedure TdtmRelTotSuplemInt.qryTotSuplemIntAfterClose(DataSet: TDataSet);
begin
  inherited;
  pFechaFundacao;
end;

end.

