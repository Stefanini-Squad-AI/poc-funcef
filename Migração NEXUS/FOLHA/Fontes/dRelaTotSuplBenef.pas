// *****************************************************************************
// ***************************** REGISTRO DE ALTERAÇÕES ************************
// *****************************************************************************
// Autor(a)    : Paulo Ramos
// Data        : 20/02/2006
// Pendência   : 21606
// Descricao   : Colocar em qryRelaTotSupl filtro 1=2, para otimizar abertura do módulo
//------------------------------------------------------------------------------
unit dRelaTotSuplBenef;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  dReports, ppVar, ppBands, ppCtrls, ppPrnabl, ppClass, ppCache, ppProd,
  ppReport, Db, DBTables, Wwquery, Wwdatsrc, ppComm, ppRelatv, ppDB,
  ppDBPipe, ppDBBDE, DRelFolha;

type
  TdtmRelaTotSuplBenef = class(TdtmReports)
    qryHstFolhaBenef: TwwQuery;
    qryRelaTotSupl: TwwQuery;
    DSRelaTotSupl: TwwDataSource;
    DsHstFolhaBenef: TwwDataSource;
    ppBDEPipeline5: TppBDEPipeline;
    ppRRelaTotSupl: TppReport;
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
    ppDBText102: TppDBText;
    ppDBText101: TppDBText;
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
    gfbTotPatro: TppGroupFooterBand;
    ppGroup5: TppGroup;
    ppGroupHeaderBand5: TppGroupHeaderBand;
    ppDBText76: TppDBText;
    ppLabel107: TppLabel;
    ppLabel108: TppLabel;
    ppLabel106: TppLabel;
    ppLabel109: TppLabel;
    ppLabel111: TppLabel;
    ppLine74: TppLine;
    ppLabel110: TppLabel;
    ppGroupFooterBand5: TppGroupFooterBand;
    ppDBCalc5: TppDBCalc;
    ppLine75: TppLine;
    ppLine76: TppLine;
    ppDBCalc16: TppDBCalc;
    ppLine77: TppLine;
    ppDBCalc6: TppDBCalc;
    ppLine78: TppLine;
    ppDBCalc17: TppDBCalc;
    lblTotPlano: TppLabel;
    ppLabel1: TppLabel;
    ppDBText1: TppDBText;
    ppDBCalc1: TppDBCalc;
    ppLine1: TppLine;
    ppLabel2: TppLabel;
    ppDBCalc2: TppDBCalc;
    ppLine2: TppLine;
    ppDBText2: TppDBText;
    ppSummaryBand1: TppSummaryBand;
    lblTotalGeral: TppLabel;
    ppDBCalc3: TppDBCalc;
    ppDBCalc4: TppDBCalc;
    ppDBCalc7: TppDBCalc;
    ppDBCalc8: TppDBCalc;
    ppDBCalc9: TppDBCalc;
    ppDBCalc10: TppDBCalc;
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
    lblTotPatro: TppLabel;
    dbQuant: TppDBCalc;
    LneQuant: TppLine;
    dbTotSRB: TppDBCalc;
    LneTotSRB: TppLine;
    dbTotINSS: TppDBCalc;
    LneTotINSS: TppLine;
    dbTotProv: TppDBCalc;
    LneTotProv: TppLine;
    dbTotDesc: TppDBCalc;
    LneTotDesc: TppLine;
    dbTotLiq: TppDBCalc;
    LneTotLiq: TppLine;
    ppLine3: TppLine;
    ppLine4: TppLine;
    ppLine5: TppLine;
    ppLine6: TppLine;
    ppLine7: TppLine;
    ppLine8: TppLine;
    procedure pAbreFundacao;
    procedure pFechaFundacao;
    function MostraParam(Form: string): boolean; override;
    procedure qryRelaTotSuplBeforeOpen(DataSet: TDataSet);
    procedure qryRelaTotSuplAfterOpen(DataSet: TDataSet);
    procedure ppRRelaTotSuplBeforePrint(Sender: TObject);
    procedure qryRelaTotSuplAfterClose(DataSet: TDataSet);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  dtmRelaTotSuplBenef: TdtmRelaTotSuplBenef;

implementation

uses FFiltroRelaTotSupl, fAguarde, uAdmPrevFB;

{$R *.DFM}

function TdtmRelaTotSuplBenef.MostraParam(Form: string): boolean;
Var
  Frm: TForm;

begin
  If UPPERCASE(Form) = 'FRMFILTRORELATOTSUPL' Then Frm := TFrmFiltroRelaTotSupl.Create(Application);
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

procedure TdtmRelaTotSuplBenef.pAbreFundacao;
begin
  qryFundacao.Close;
  qryFundacao.ParamByName('PFUNDACAO').AsInteger := iIdFundacao;
  qryFundacao.Open;
end;

procedure TdtmRelaTotSuplBenef.pFechaFundacao;
begin
  qryFundacao.Close;
end;

procedure TdtmRelaTotSuplBenef.qryRelaTotSuplBeforeOpen(DataSet: TDataSet);
begin
  inherited;
  frmAguarde.Mostra('Aguarde... Montando Relatório.');
  frmAguarde.Repaint;
end;

procedure TdtmRelaTotSuplBenef.qryRelaTotSuplAfterOpen(DataSet: TDataSet);
begin
  inherited;
  frmAguarde.Apaga;
end;

procedure TdtmRelaTotSuplBenef.ppRRelaTotSuplBeforePrint(Sender: TObject);
begin
  inherited;
  pAbreFundacao;
end;

procedure TdtmRelaTotSuplBenef.qryRelaTotSuplAfterClose(DataSet: TDataSet);
begin
  inherited;
  pFechaFundacao;
end;

end.
