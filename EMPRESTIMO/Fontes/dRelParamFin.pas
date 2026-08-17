unit dRelParamFin;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  dReports, ppVar, ppBands, ppCtrls, ppPrnabl, ppClass, ppCache, ppProd,
  ppReport, Db, DBTables, Wwquery, Wwdatsrc, ppComm, ppRelatv, ppDB,
  ppDBPipe, ppDBBDE, ADODB, DBClient, Provider, FCmReport, uCmRptManager,
  TXComp, CmParamReport;

type
  TdtmRelParamFin = class(TdtmReports)
    dtsParamFin: TwwDataSource;
    qryParamFin: TwwQuery;
    rptParamFin: TppReport;
    dtpParamFin: TDataSetProvider;
    cdsParamFin: TClientDataSet;
    adoqryParamFin: TADOQuery;
    pplParamFin: TppBDEPipeline;
    qryParamFinITCEVENTO: TFloatField;
    qryParamFinDESCR_CONTRATO: TStringField;
    qryParamFinDESCR_ITEM: TStringField;
    qryParamFinIDTIPOCONTREMPTMO: TFloatField;
    qryParamFinIDPATRO: TFloatField;
    qryParamFinIDPLANOPREV: TFloatField;
    qryParamFinRECPAG: TStringField;
    qryParamFinCONTABAIXA: TStringField;
    qryParamFinRUBRICAN: TFloatField;
    qryParamFinRUBRICAD: TFloatField;
    qryParamFinRUBRICAA: TFloatField;
    qryParamFinIDREGRACALC: TFloatField;
    qryParamFinCRED_APROPRIACAO: TStringField;
    qryParamFinDEB_APROPRIACAO: TStringField;
    qryParamFinCRED_PATRO: TStringField;
    qryParamFinDEB_PATRO: TStringField;
    qryParamFinTIPORECDESFINAN: TStringField;
    qryParamFinTIPORECDESFOLHA: TStringField;
    qryParamFinUNIDNEGOC: TFloatField;
    qryParamFinNOME: TStringField;
    ppHeaderBand1: TppHeaderBand;
    ppLabel1: TppLabel;
    ppLabel2: TppLabel;
    ppLabel4: TppLabel;
    ppLabel5: TppLabel;
    ppLabel7: TppLabel;
    ppLabel8: TppLabel;
    ppLabel9: TppLabel;
    ppLabel10: TppLabel;
    ppLabel11: TppLabel;
    ppLabel12: TppLabel;
    ppLabel13: TppLabel;
    ppLabel14: TppLabel;
    ppLabel15: TppLabel;
    ppLabel16: TppLabel;
    ppDetailBand1: TppDetailBand;
    ppDBText3: TppDBText;
    ppDBCCApropDebito: TppDBText;
    ppDBCCApropCredito: TppDBText;
    ppDBCCPatroDeb: TppDBText;
    ppDBCCPatroCred: TppDBText;
    ppDBCCBaixa: TppDBText;
    ppDBText11: TppDBText;
    ppDBText12: TppDBText;
    ppDBText13: TppDBText;
    ppDBText14: TppDBText;
    ppDBText15: TppDBText;
    ppDBTPDesRecFinan: TppDBText;
    ppDBTPDesRecFolha: TppDBText;
    ppDBText4: TppDBText;
    ppDBText5: TppDBText;
    ppDBText18: TppDBText;
    ppFooterBand1: TppFooterBand;
    ppLine2: TppLine;
    ppSystemVariable1: TppSystemVariable;
    ppSystemVariable2: TppSystemVariable;
    ppDBText2: TppDBText;
    rptParamFinShapeDet: TppShape;
    ppLabel17: TppLabel;
    qryParamFinNOMEPATRO: TStringField;
    qryParamFinNOMEPLANO: TStringField;
    cdsParamFinITCEVENTO: TFloatField;
    cdsParamFinDESCR_CONTRATO: TStringField;
    cdsParamFinDESCR_ITEM: TStringField;
    cdsParamFinIDTIPOCONTREMPTMO: TFloatField;
    cdsParamFinIDPATRO: TFloatField;
    cdsParamFinIDPLANOPREV: TFloatField;
    cdsParamFinRECPAG: TStringField;
    cdsParamFinCONTABAIXA: TStringField;
    cdsParamFinRUBRICAN: TFloatField;
    cdsParamFinRUBRICAD: TFloatField;
    cdsParamFinRUBRICAA: TFloatField;
    cdsParamFinIDREGRACALC: TFloatField;
    cdsParamFinCRED_APROPRIACAO: TStringField;
    cdsParamFinDEB_APROPRIACAO: TStringField;
    cdsParamFinCRED_PATRO: TStringField;
    cdsParamFinDEB_PATRO: TStringField;
    cdsParamFinTIPORECDESFINAN: TStringField;
    cdsParamFinTIPORECDESFOLHA: TStringField;
    cdsParamFinUNIDNEGOC: TFloatField;
    cdsParamFinNOME: TStringField;
    cdsParamFinNOMEPATRO: TStringField;
    cdsParamFinNOMEPLANO: TStringField;
    ppLabel18: TppLabel;
    ppLabel19: TppLabel;
    ppLabel20: TppLabel;
    ppLabel21: TppLabel;
    ppLabel22: TppLabel;
    ppShape1: TppShape;
    ppLabel6: TppLabel;
    ppLabel23: TppLabel;
    qryParamFinIDITEMEMPTMO: TFloatField;
    cdsParamFinIDITEMEMPTMO: TFloatField;
    ppLabel3: TppLabel;
    ppLine1: TppLine;

    procedure rptContratosAdminSint_CabecalhoRelatBeforePrint(Sender: TObject);
    procedure rptParamFinShapeDetPrint(Sender: TObject);
    procedure ppDetailBand1BeforePrint(Sender: TObject);
    procedure rptParamFinBeforePrint(Sender: TObject);


  private // Private declarations

    CorAtual: TColor;

    FIdContrato         : Int64;
    FTipoRelatorio      : String;
    FMesCompetencia     : String;


  public  // Public declarations

    wCorLinha : TColor;
    wIsCorLinha         : Boolean;
    property IdContrato : Int64 read FIdContrato write FIdContrato;
    property TipoRelatorio : String read FTipoRelatorio write FTipoRelatorio;
    property MesCompetencia : String read FMesCompetencia write FMesCompetencia;

    function MostraParam(Form: string): boolean; override;


  end;




var
  dtmRelParamFin: TdtmRelParamFin;



implementation
{$R *.DFM}
uses
  CRelContrConc, USistema, CRelValCred, CRelParamFin, UModulo, uIntegraBack;



function TdtmRelParamFin.MostraParam(Form: string): boolean;
var
   frm : TForm;
begin
   // criação dos forms de configuração de Relatórios

   // Prestação de Contas --------------------------------------------------------------------------------------
   if (LowerCase(Form) = 'cfgrelparamfin') then begin
      frm := TcfgRelParamFin.Create(Application);
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


procedure TdtmRelParamFin.rptContratosAdminSint_CabecalhoRelatBeforePrint(
  Sender: TObject);
begin
   inherited;
   CorAtual := clWhite;
end;


procedure TdtmRelParamFin.rptParamFinShapeDetPrint(Sender: TObject);
begin
  inherited;
   if wIsCorLinha then begin
      if CorAtual = clWhite then begin
         CorAtual := wCorLinha
      end else begin
         CorAtual := clWhite;
      end;
   end else begin
      CorAtual := clWhite;
   end;
   (Sender as TppShape).Brush.Color := CorAtual;
end;



procedure TdtmRelParamFin.ppDetailBand1BeforePrint(Sender: TObject);
begin
   inherited;

   // Colocação das mascaras das contas de Desenbolso/Recebimento
   if Trim(qryParamFinRECPAG.AsString) = 'R' then
      ppDBTPDesRecFinan.DisplayFormat := Modulo.sMascaraReceb + ';0;'
   else
      ppDBTPDesRecFinan.DisplayFormat := Modulo.sMascaraDesemb + ';0;';
end;



procedure TdtmRelParamFin.rptParamFinBeforePrint(Sender: TObject);
begin
   inherited;

   // Colocação das mascaras das contas contábeis e de desenbolso/recebimento
   ppDBCCApropDebito.DisplayFormat := IntegraBack.MascaraPlano + ';0;';
   ppDBCCApropCredito.DisplayFormat := IntegraBack.MascaraPlano + ';0;';
   ppDBCCBaixa.DisplayFormat := IntegraBack.MascaraPlano + ';0;';
   ppDBCCPatroDeb.DisplayFormat := IntegraBack.MascaraPlano + ';0;';
   ppDBCCPatroCred.DisplayFormat := IntegraBack.MascaraPlano + ';0;';

   ppDBTPDesRecFolha.DisplayFormat := Modulo.sMascaraDesemb + ';0;';
end;



end.
