unit dRelTotalItem;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  dReports, ppVar, ppBands, ppCtrls, ppPrnabl, ppClass, ppCache, ppProd,
  ppReport, Db, DBTables, Wwquery, Wwdatsrc, ppComm, ppRelatv, ppDB,
  ppDBPipe, ppDBBDE, ADODB, DBClient, Provider, FCmReport, uCmRptManager,
  TXComp, CmParamReport;

type
  TdtmRelTotalItem = class(TdtmReports)
    dtsTotalItem: TwwDataSource;
    qryTotalItem: TwwQuery;
    rptTotalItem: TppReport;
    dtpTotalItem: TDataSetProvider;
    cdsTotalItem: TClientDataSet;
    adoqryTotalItem: TADOQuery;
    pplTotalItem: TppBDEPipeline;
    qryTotalItemDESCRICAO: TStringField;
    qryTotalItemIDTIPOCONTREMPTMO: TFloatField;
    qryTotalItemTCEDESCRICAO: TStringField;
    qryTotalItemIDITEMEMPTMO: TFloatField;
    qryTotalItemITEDESCRICAO: TStringField;
    qryTotalItemSUMHHMEVLRPREVISTO: TFloatField;
    qryTotalItemPLNDATDIA: TDateTimeField;
    cdsTotalItemDESCRICAO: TStringField;
    cdsTotalItemIDTIPOCONTREMPTMO: TFloatField;
    cdsTotalItemTCEDESCRICAO: TStringField;
    cdsTotalItemIDITEMEMPTMO: TFloatField;
    cdsTotalItemITEDESCRICAO: TStringField;
    cdsTotalItemSUMHHMEVLRPREVISTO: TFloatField;
    cdsTotalItemPLNDATDIA: TDateTimeField;
    ppHeaderBand1: TppHeaderBand;
    ppLabel1: TppLabel;
    ppLine1: TppLine;
    ppLabel2: TppLabel;
    ppDetailBand1: TppDetailBand;
    ppDBText3: TppDBText;
    ppDBText4: TppDBText;
    ppDBText5: TppDBText;
    ppDBText6: TppDBText;
    ppFooterBand1: TppFooterBand;
    ppLine2: TppLine;
    ppLabel3: TppLabel;
    ppSystemVariable1: TppSystemVariable;
    ppSystemVariable2: TppSystemVariable;
    ppGroup1: TppGroup;
    ppGroupHeaderBand1: TppGroupHeaderBand;
    ppDBText2: TppDBText;
    ppDBText1: TppDBText;
    ppLine3: TppLine;
    ppGroupFooterBand1: TppGroupFooterBand;
    procedure rptContratosAdminSint_CabecalhoRelatBeforePrint(
      Sender: TObject);
    procedure rptTotalItemShapeDetPrint(Sender: TObject);
    procedure ppDetailBand1BeforePrint(Sender: TObject);
    procedure rptTotalItemBeforePrint(Sender: TObject);
  private
    { Private declarations }
    CorAtual, FCorLinha : TColor;
    FIsCorLinha         : Boolean;

    FIdContrato         : Int64;
    FTipoRelatorio      : String;
    FMesCompetencia     : String;
  public
    property IdContrato : Int64 read FIdContrato write FIdContrato;
    property TipoRelatorio : String read FTipoRelatorio write FTipoRelatorio;
    property MesCompetencia : String read FMesCompetencia write FMesCompetencia;
    property CorLinha : TColor read FCorLinha write FCorLinha;
    property IsCorLinha : Boolean read FIsCorLinha write FIsCorLinha;

    function MostraParam(Form: string): boolean; override;
    { Public declarations }
  end;

var
  dtmRelTotalItem: TdtmRelTotalItem;

implementation
uses CRelContrConc, USistema, CRelValCred, CRelTotalItem, UModulo, uIntegraBack;
{$R *.DFM}


function TdtmRelTotalItem.MostraParam(Form: string): boolean;
var
   frm : TForm;
begin
   // criação dos forms de configuração de Relatórios

   // Prestação de Contas --------------------------------------------------------------------------------------
   if (LowerCase(Form) = 'cfgrelValCred') then begin
      frm := TcfgRelValCred.Create(Application);
   end else begin
      frm := nil;
   end;

   if frm = nil then begin
      Result := False;
      Exit;
   end;

   with frm do begin
      Result := (ShowModal = mrOk);
      Free;
   end;

end;


procedure TdtmRelTotalItem.rptContratosAdminSint_CabecalhoRelatBeforePrint(
  Sender: TObject);
begin
   inherited;
   CorAtual := clWhite;
end;


procedure TdtmRelTotalItem.rptTotalItemShapeDetPrint(Sender: TObject);
begin
  inherited;
   if cfgRelTotalItem.chkCorLinha.Checked then begin
      if CorAtual = clWhite then begin
         CorAtual := cfgRelTotalItem.cboCorLinha.SelectedColor
      end else begin
         CorAtual := clWhite;
      end;
   end else begin
      CorAtual := clWhite;
   end;
   (Sender as TppShape).Brush.Color := CorAtual;

end;



procedure TdtmRelTotalItem.ppDetailBand1BeforePrint(Sender: TObject);
begin
  inherited;
{
  // Colocação das mascaras das contas de Desenbolso/Recebimento
  if Trim(qryTotalItemRECPAG.AsString) = 'R' then
     ppDBTPDesRecFinan.DisplayFormat := Modulo.sMascaraReceb
  else
     ppDBTPDesRecFinan.DisplayFormat := Modulo.sMascaraDesemb;
}     
end;



procedure TdtmRelTotalItem.rptTotalItemBeforePrint(Sender: TObject);
begin
  inherited;
  // Colocação das mascaras das contas contábeis e de desenbolso/recebimento
  ppDBCCApropDebito.DisplayFormat := IntegraBack.MascaraPlano;
  ppDBCCApropCredito.DisplayFormat := IntegraBack.MascaraPlano;
  ppDBCCBaixa.DisplayFormat := IntegraBack.MascaraPlano;
  ppDBCCPatroDeb.DisplayFormat := IntegraBack.MascaraPlano;
  ppDBCCPatroCred.DisplayFormat := IntegraBack.MascaraPlano;

  ppDBTPDesRecFolha.DisplayFormat := Modulo.sMascaraDesemb;
end;

end.

