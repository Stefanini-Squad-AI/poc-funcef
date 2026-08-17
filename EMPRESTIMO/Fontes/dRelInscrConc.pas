unit dRelInscrConc;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  dReports, ppVar, ppBands, ppCtrls, ppPrnabl, ppClass, ppCache, ppProd,
  ppReport, Db, DBTables, Wwquery, Wwdatsrc, ppComm, ppRelatv, ppDB,
  ppDBPipe, ppDBBDE, ADODB, DBClient, Provider;

type
  TdtmRelInscrConc = class(TdtmReports)
    pplInscrConc: TppBDEPipeline;
    dtsInscrConc: TwwDataSource;
    qryInscrConc: TwwQuery;
    rpInscrConc: TppReport;
    rptContratosAdminSint_CabecalhoRelat: TppHeaderBand;
    pplbTitulo: TppLabel;
    pplbNomeEmpresa: TppLabel;
    rptContratosLocatarioLabel3: TppLabel;
    pplbidInscricao: TppLabel;
    rptContratosAdminSint_LinhaTitulo: TppLine;
    rptContratosAdminSintLabel17: TppLabel;
    rptContratosAdminSintLabel18: TppLabel;
    rptContratosAdminSintLabel19: TppLabel;
    rptContratosAdminSintLabel23: TppLabel;
    pplbDataInscricao: TppLabel;
    ppLabel1: TppLabel;
    ppLabel3: TppLabel;
    ppItensContrato: TppDetailBand;
    rptContrato: TppShape;
    rptContratosAdminSint_Separador: TppLine;
    ppFooterBand12: TppFooterBand;
    ppLine37: TppLine;
    pplbNomeSistema: TppLabel;
    ppCalc23: TppSystemVariable;
    rptContratosAdminSintSummaryBand1: TppSummaryBand;
    rptContratosAdminSintLine1: TppLine;
    dtpInscrConc: TDataSetProvider;
    cdsInscrConc: TClientDataSet;
    adoqryInscrConc: TADOQuery;
    ppDBText9: TppDBText;
    ppDBText10: TppDBText;
    ppDBText11: TppDBText;
    ppDBText12: TppDBText;
    ppDBText14: TppDBText;
    qryInscrConcIDINSCRICAOEMPTMO: TFloatField;
    qryInscrConcBENEFICIARIO: TStringField;
    qryInscrConcPATROCINADORA: TStringField;
    qryInscrConcPLANO: TStringField;
    qryInscrConcIDCBANCARIA: TFloatField;
    qryInscrConcFLGSITUACAO: TStringField;
    qryInscrConcFLGFORMAPAG: TStringField;
    qryInscrConcDATAINSC: TDateTimeField;
    qryInscrConcVLRSOLIC: TFloatField;
    qryInscrConcNUMPARCELAS: TFloatField;
    cdsInscrConcIDINSCRICAOEMPTMO: TFloatField;
    cdsInscrConcBENEFICIARIO: TStringField;
    cdsInscrConcPATROCINADORA: TStringField;
    cdsInscrConcPLANO: TStringField;
    cdsInscrConcIDCBANCARIA: TFloatField;
    cdsInscrConcFLGSITUACAO: TStringField;
    cdsInscrConcFLGFORMAPAG: TStringField;
    cdsInscrConcDATAINSC: TDateTimeField;
    cdsInscrConcVLRSOLIC: TFloatField;
    cdsInscrConcNUMPARCELAS: TFloatField;
    ppSystemVariable1: TppSystemVariable;
    procedure ppShape1Print(Sender: TObject);
    procedure rptContratosAdminSint_CabecalhoRelatBeforePrint(Sender: TObject);
  private
    CorAtual, FCorLinha : TColor;
    FIsCorLinha         : Boolean;

    FIdInscricao         : Int64;
    FDataIniInsc,
    FDataFimInsc         : String;
    { Private declarations }
  public
    property IdInscricao : Int64  read FIdInscricao   write FIdInscricao ;
    property DataIniInsc : String read FDataIniInsc write FDataIniInsc;
    property DataFimInsc : String read FDataFimInsc write FDataFimInsc;
    property CorLinha : TColor read FCorLinha write FCorLinha;
    property IsCorLinha : Boolean read FIsCorLinha write FIsCorLinha;

    function MostraParam(Form: string): boolean; override;
    { Public declarations }
  end;

var
  dtmRelInscrConc: TdtmRelInscrConc;

implementation
uses USistema, CRelInscrConc;
{$R *.DFM}




function TdtmRelInscrConc.MostraParam(Form: string): boolean;
var
   frm : TForm;
begin
   // criação dos forms de configuração de Relatórios

   // Prestação de Contas --------------------------------------------------------------------------------------
   if (LowerCase(Form) = 'cfgrelinscrconc') then begin
      frm := TcfgRelInscrConc.Create(Application);
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


procedure TdtmRelInscrConc.ppShape1Print(Sender: TObject);
begin
  inherited;
   if FIsCorLinha then begin

      if CorAtual = clWhite then begin
         CorAtual := FCorLinha;
      end else begin
         CorAtual := clWhite;
      end;

   end else begin
      CorAtual := clWhite;
   end;

   (Sender as TppShape).Brush.Color := CorAtual;

end;

procedure TdtmRelInscrConc.rptContratosAdminSint_CabecalhoRelatBeforePrint(
  Sender: TObject);
begin
  inherited;

   pplbTitulo.Caption      := 'Inscrições pendentes por faixa de datas';
   if FIdInscricao <> -1 then
      pplbidInscricao.Caption   := IntToStr(FIdInscricao);
   if FDataIniInsc <> '' then
      pplbDataInscricao.Caption := FDataIniInsc + ' a ' + FDataFimInsc;

end;

end.
