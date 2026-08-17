unit dRelatorios1;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs, dReports,
  ppVar, ppBands, ppCtrls, ppPrnabl, ppClass, ppCache, ppProd, ppReport, Db, DBTables,
  Wwquery, Wwdatsrc, ppComm, ppRelatv, ppDB, ppDBPipe, ppDBBDE, ppStrtch, ppMemo,
  ppSubRpt, ppBarCod, ppRichTx;

type
  TdtmRelatorios1 = class(TdtmReports)
    ppRBBancarioSub: TppBDEPipeline;
    dsRBBancarioSub: TwwDataSource;
    qryRBBancarioSub: TwwQuery;
    updSQL: TUpdateSQL;
    qryAux: TwwQuery;
    ppIMG: TppBDEPipeline;
    dsIMG: TwwDataSource;
    qryIMG: TwwQuery;
    rpRBBancario: TppReport;
    ppHeaderBand5: TppHeaderBand;
    ppDetailBand10: TppDetailBand;
    ppFooterBand5: TppFooterBand;
    ppRBBancario: TppBDEPipeline;
    dsRBBancario: TwwDataSource;
    qryRBBancario: TwwQuery;
    ppGroup1: TppGroup;
    ppGroupHeaderBand1: TppGroupHeaderBand;
    ppGroupFooterBand1: TppGroupFooterBand;
    ppGroup2: TppGroup;
    ppGroupHeaderBand2: TppGroupHeaderBand;
    ppGroupFooterBand2: TppGroupFooterBand;
    ppGroup3: TppGroup;
    ppGroupHeaderBand3: TppGroupHeaderBand;
    ppGroupFooterBand3: TppGroupFooterBand;
    ppGroup4: TppGroup;
    ppGroupHeaderBand4: TppGroupHeaderBand;
    ppGroupFooterBand4: TppGroupFooterBand;
    rpRBBancarioLabel5: TppLabel;
    rpRBBancarioLabel6: TppLabel;
    rpTPagamento: TppLabel;
    rpRBBancarioDBText5: TppDBText;
    rpRBBancarioDBText6: TppDBText;
    rpRBBancarioDBText7: TppDBText;
    rpRBBancarioDBText8: TppDBText;
    rpRBBancariolbMes: TppLabel;
    rpRBBancarioLabel13: TppLabel;
    rpRBBancarioChildReport1Label1: TppLabel;
    rpRBBancarioChildReport1Calc1: TppCalc;
    rpRBBancarioChildReport1Label4: TppLabel;
    rpRBBancarioChildReport1Label5: TppLabel;
    rpRBBancarioChildReport1DBText6: TppDBText;
    rpRBBancarioChildReport1Calc2: TppCalc;
    rpRBBancarioDBText3: TppDBText;
    rpRBBancarioDBText4: TppDBText;
    rpRBBancarioDBText17: TppDBText;
    rpRBBancarioLabel11: TppLabel;
    rpRBBancarioDBText9: TppDBText;
    rpRBBancarioLabel10: TppLabel;
    rpRBBancarioDBText10: TppDBText;
    rpRBBancarioLabel7: TppLabel;
    rpRBBancarioLabel8: TppLabel;
    rpRBBancarioLabel9: TppLabel;
    rpRBBancarioLabel12: TppLabel;
    rpRBBancarioLabel2: TppLabel;
    rpRBBancarioLabel3: TppLabel;
    rpRBBancarioLabel17: TppLabel;
    rpRBBancarioDBText13: TppDBText;
    rpRBBancarioDBText12: TppDBText;
    rpRBBancarioLabel1: TppLabel;
    rpRBBancarioDBText16: TppDBText;
    rpRBBancarioLine1: TppLine;
    rpRBBancarioDBText1: TppDBText;
    rpRBBancarioDBText2: TppDBText;
    rpRBBancarioDBText11: TppDBText;
    rpRBBancarioDBText14: TppDBText;
    rpRBBancarioDBText15: TppDBText;
    rpRBBancarioMemo1: TppMemo;
    rpRBBancarioDBCalc2: TppDBCalc;
    rpRBBancarioExtenso: TppLabel;
    rpRBBancarioSubReport1: TppSubReport;
    rpRBBancarioChildReport1: TppChildReport;
    rpRBBancarioChildReport1HeaderBand1: TppHeaderBand;
    rpRBBancarioChildReport1LabelCODIGO: TppLabel;
    rpRBBancarioChildReport1LabelVALOR: TppLabel;
    rpRBBancarioChildReport1LabelNUMFUNC: TppLabel;
    rpRBBancarioChildReport1LabelAGENCIA: TppLabel;
    rpRBBancarioChildReport1DBText3: TppDBText;
    rpRBBancarioChildReport1Label6: TppLabel;
    rpRBBancarioChildReport1DBText4: TppDBText;
    rpRBBancarioChildReport1Label7: TppLabel;
    rpRBBancarioChildReport1DBText5: TppDBText;
    rpRBBancarioChildReport1LabelMESDE: TppLabel;
    rpRBBancarioChildReport1Memo1: TppMemo;
    rpRBBancarioChildReport1Line1: TppLine;
    rpRBBancarioChildReport1Label8: TppLabel;
    rpRBBancarioChildReport1Label9: TppLabel;
    rpRBBancarioChildReport1Label10: TppLabel;
    rpRBBancarioChildReport1DBText7: TppDBText;
    rpRBBancarioChildReport1Label11: TppLabel;
    rpRBBancarioChildReport1DBText8: TppDBText;
    rpRBBancarioChildReport1DetailBand1: TppDetailBand;
    rpRBBancarioChildReport1FooterBand1: TppFooterBand;
    rpRBBancarioChildReport1SummaryBand1: TppSummaryBand;
    rpRBBancarioChildReport1LabelVALTOT: TppLabel;
    rpRBBancarioChildReport1DBCalc3: TppDBCalc;
    rpRBBancarioChildReport1Line2: TppLine;
    rpRBBancarioChildReport1Line3: TppLine;
    rpRBBancarioChildReport1Line4: TppLine;
    rpRBBancarioChildReport1Label2: TppLabel;
    rpRBBancarioChildReport1Label3: TppLabel;
    rpRBBancarioChildReport1Line5: TppLine;
    rpRBBancarioChildReport1Extenso: TppLabel;
    rpRBBancarioChildReport1DBCalc5: TppDBCalc;
    rpRBBancarioChildReport1Group1: TppGroup;
    rpRBBancarioChildReport1GroupHeaderBand1: TppGroupHeaderBand;
    rpRBBancarioChildReport1GroupFooterBand1: TppGroupFooterBand;
    rpRBBancarioChildReport1DBText1: TppDBText;
    rpRBBancarioChildReport1DBText2: TppDBText;
    rpRBBancarioChildReport1DBCalc1: TppDBCalc;
    rpRBBancarioChildReport1DBText9: TppDBText;
    rpRBBancarioChildReport1Calc3: TppSystemVariable;
    rpRBBancarioChildReport1Calc6: TppSystemVariable;
    rpRBBancarioChildReport1Calc4: TppSystemVariable;
    procedure qryGRCSAfterOpen(DataSet: TDataSet);
    procedure qryGRCSAfterScroll(DataSet: TDataSet);
    procedure ppSummaryBand1AfterPrint(Sender: TObject);
    procedure rpRBBancarioDBCalc2GetText(Sender: TObject; var Text: String);
    procedure rpRBBancarioExtensoPrint(Sender: TObject);
    procedure rpRBBancarioChildReport1DBCalc3GetText(Sender: TObject; var Text: String);
    procedure rpRBBancarioChildReport1ExtensoPrint(Sender: TObject);
    procedure ppHeaderBand5BeforePrint(Sender: TObject);
    procedure rpRBBancarioSubReport1Print(Sender: TObject);
    procedure rpRBBancarioChildReport1HeaderBand1BeforePrint(Sender: TObject);
  public
    sTotLiquidoText, sMesRef, sTipoFolha: string;

    function MostraParam(Form: string): boolean; override;
  end;

var
  dtmRelatorios1: TdtmRelatorios1;

implementation

uses uExtenso, uFuncoesUteisRH, fParamBBancario, fAguarde;

{$R *.DFM}

function TdtmRelatorios1.MostraParam(Form: string): boolean;
var
  frm: TForm;
begin
  if (UPPERCASE(Form) = 'FRMBBANCARIO') then
    frm := TFrmBBancario.Create(Application)
  else
  if (UPPERCASE(Form) = '') then
  begin
    Result := true;
    exit;
  end
  else
    frm := nil;

  if (frm = nil) then
    Result := false
  else
  begin
    with (frm) do
    begin
      Result := (ShowModal = mrOk);
      free;
    end;
  end;
end;

procedure TdtmRelatorios1.qryGRCSAfterOpen(DataSet: TDataSet);
begin
  frmAguarde.Max := DataSet.RecordCount;
  frmAguarde.Min := 0;
end;

procedure TdtmRelatorios1.qryGRCSAfterScroll(DataSet: TDataSet);
begin
  frmAguarde.Pos := frmAguarde.Pos+1;
  frmAguarde.Refresh;
end;

procedure TdtmRelatorios1.ppSummaryBand1AfterPrint(Sender: TObject);
begin
  frmAguarde.Apaga;
end;

// *************************************************************************************
// *************************************************************************************
// Relação do Borderô Bancário
// *************************************************************************************
// *************************************************************************************
procedure TdtmRelatorios1.ppHeaderBand5BeforePrint(Sender: TObject);
begin
  rpTPagamento.Caption := sTipoFolha;
  rpRBBancariolbMes.Caption := sMesRef;
end;

procedure TdtmRelatorios1.rpRBBancarioDBCalc2GetText(Sender: TObject; var Text: String);
begin
  sTotLiquidoText := Text;
end;

procedure TdtmRelatorios1.rpRBBancarioExtensoPrint(Sender: TObject);
begin
  sTotLiquidoText := TiraCaracter(sTotLiquidoText, '.');
  rpRBBancarioExtenso.Caption := '('+ Trim(Extenso.PorExtensoII(StrToFloat(sTotLiquidoText))) +')';
end;

procedure TdtmRelatorios1.rpRBBancarioChildReport1DBCalc3GetText(Sender: TObject; var Text: String);
begin
  sTotLiquidoText := Text;
end;

procedure TdtmRelatorios1.rpRBBancarioChildReport1ExtensoPrint(Sender: TObject);
begin
  sTotLiquidoText := TiraCaracter(sTotLiquidoText, '.');
  rpRBBancarioChildReport1Extenso.Caption := '('+
    Trim(Extenso.PorExtensoII(StrToFloat(sTotLiquidoText))) +')';
  frmAguarde.Apaga;
end;

procedure TdtmRelatorios1.rpRBBancarioSubReport1Print(Sender: TObject);
begin
  if not(qryRBBancario.IsEmpty) then
  begin
    qryRBBancarioSub.Filtered := false;
    qryRBBancarioSub.Filter := 'NUMBANCO = ' +qryRBBancario.FieldByName('NUMBANCO').asString;
    qryRBBancarioSub.Filtered := true;
  end;
end;

procedure TdtmRelatorios1.rpRBBancarioChildReport1HeaderBand1BeforePrint(Sender: TObject);
begin
  rpRBBancarioChildReport1LabelMESDE.Caption :=
    'Relação de Créditos por Agência do mês de '+sMesRef;
end;

end.
