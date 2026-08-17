unit dRelItensGeradosDiaPP;

interface

uses
   Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
   dReports, ppBands, ppClass, ppCtrls, Db, ppVar, ppPrnabl, ppCache,
   ppProd, ppReport, DBTables, Wwquery, Wwdatsrc, ppComm, ppRelatv, ppDB,
   ppDBPipe, ppDBBDE, raCodMod, ppModule, daDataModule, ppRichTx, ppStrtch,
  ppMemo;

type
   TdtmRelItensGeradosDiaPP = class(TdtmReports)
      pplItensGeradosDiaPP: TppBDEPipeline;
      dtsItensGeradosDiaPP: TwwDataSource;
      qryItensGeradosDiaPP: TwwQuery;
      rptItensGeradosDiaPP: TppReport;
      ppHeaderBand1: TppHeaderBand;
      ppLabel1: TppLabel;
      ppLabel2: TppLabel;
      ppDetailBand1: TppDetailBand;
      ppFooterBand1: TppFooterBand;
      ppLine2: TppLine;
      ppLabel3: TppLabel;
      ppSystemVariable1: TppSystemVariable;
      ppSystemVariable2: TppSystemVariable;
      ppGroup1: TppGroup;
      ppGroupHeaderBand1: TppGroupHeaderBand;
      ppGroupFooterBand1: TppGroupFooterBand;
      ppGroup2: TppGroup;
      ppGroupHeaderBand2: TppGroupHeaderBand;
      ppGroupFooterBand2: TppGroupFooterBand;
      ppShape1: TppShape;
      ppLabel25: TppLabel;
      ppLabel26: TppLabel;
      rptItensGeradosDia_lblPeriodo: TppLabel;
      rptItensGeradosDia_lblEvento: TppLabel;
      rptItensGeradosDia_lblCompetencia: TppLabel;
      ppGroup4: TppGroup;
      ppGroupHeaderBand4: TppGroupHeaderBand;
      ppGroupFooterBand4: TppGroupFooterBand;
      ppGroup5: TppGroup;
      ppGroupHeaderBand5: TppGroupHeaderBand;
      ppGroupFooterBand5: TppGroupFooterBand;
      ppLabel22: TppLabel;
      ppLabel23: TppLabel;
      ppMemo2: TppMemo;
      memPatro: TppRichText;
      memPlano: TppRichText;
      ppMemo1: TppMemo;
      ppLabel4: TppLabel;
      ppLabel19: TppLabel;
      ppDBText2: TppDBText;
      qryItensGeradosDiaPPNOMEPLANO: TStringField;
      qryItensGeradosDiaPPNOMEPATRO: TStringField;
      qryItensGeradosDiaPPPLANO_PATRO: TStringField;
      qryItensGeradosDiaPPEVENTO: TFloatField;
      qryItensGeradosDiaPPDESC_EVENTO: TStringField;
      qryItensGeradosDiaPPIDITEMEMPTMO: TFloatField;
      qryItensGeradosDiaPPITEDESCRICAO: TStringField;
      qryItensGeradosDiaPPHMEDATAPREVISTA: TDateTimeField;
      qryItensGeradosDiaPPVALOR_AGRUPADO: TFloatField;
      qryItensGeradosDiaPPVALOR_CENTRALIZA: TFloatField;
      qryItensGeradosDiaPPVALOR_AGRUPADO_CONTAB: TFloatField;
      qryItensGeradosDiaPPVALOR_EFETIVO: TFloatField;
      qryItensGeradosDiaPPVALOR_ABONADO: TFloatField;
      qryItensGeradosDiaPPVALOR_ABONADO_CONTAB: TFloatField;
      qryItensGeradosDiaPPABONO_CONTAB: TFloatField;
      qryItensGeradosDiaPPVALOR_ESTORNADO_CONTAB: TFloatField;
      qryItensGeradosDiaPPESTORNO_CONTAB: TFloatField;
      ppLabel31: TppLabel;
      ppShape3: TppShape;
      ppLine4: TppLine;
      ppDBText6: TppDBText;
      ppDBText7: TppDBText;
      ppDBText9: TppDBText;
      ppDBText5: TppDBText;
      ppDBText3: TppDBText;
      ppDBText10: TppDBText;
      ppDBText8: TppDBText;
      ppDBText11: TppDBText;
      ppDBText12: TppDBText;
      ppDBText4: TppDBText;
      ppDBText13: TppDBText;
      ppShape2: TppShape;
      ppDBText1: TppDBText;
      ppLabel5: TppLabel;
      ppLabel14: TppLabel;
      ppLabel7: TppLabel;
      ppLabel6: TppLabel;
      ppLabel8: TppLabel;
      ppLabel11: TppLabel;
      ppLabel12: TppLabel;
      ppLabel18: TppLabel;
      ppLabel15: TppLabel;
      ppLabel9: TppLabel;
      ppLabel28: TppLabel;
      ppLabel29: TppLabel;
      ppLabel30: TppLabel;
      ppLabel20: TppLabel;
      ppLabel32: TppLabel;
      ppLabel33: TppLabel;
      ppLabel24: TppLabel;
      ppLabel10: TppLabel;
      ppLabel17: TppLabel;
      ppLabel27: TppLabel;
      ppLabel21: TppLabel;
      ppLabel34: TppLabel;
      ppDBText14: TppDBText;
      ppLine1: TppLine;
      ppShape4: TppShape;
      ppDBCalc2: TppDBCalc;
      ppDBCalc3: TppDBCalc;
      ppDBCalc4: TppDBCalc;
      ppDBCalc5: TppDBCalc;
      ppDBCalc6: TppDBCalc;
      ppDBCalc7: TppDBCalc;
      ppDBCalc8: TppDBCalc;
      ppDBCalc9: TppDBCalc;
      ppDBCalc1: TppDBCalc;
      ppLine3: TppLine;
      ppShape5: TppShape;
      ppDBCalc10: TppDBCalc;
      ppDBCalc11: TppDBCalc;
      ppDBCalc12: TppDBCalc;
      ppDBCalc13: TppDBCalc;
      ppDBCalc14: TppDBCalc;
      ppDBCalc15: TppDBCalc;
      ppDBCalc16: TppDBCalc;
      ppDBCalc17: TppDBCalc;
      ppDBCalc18: TppDBCalc;
      ppDBText15: TppDBText;
      ppDBText16: TppDBText;
      ppDBText17: TppDBText;
    ppLabel56: TppLabel;
    ppLabel57: TppLabel;
    lblTipoEmptmo: TppLabel;
    lblTipoContr: TppLabel;

      procedure ppLine4Print(Sender: TObject);
      procedure ppShape3Print(Sender: TObject);
      procedure ppShape2Print(Sender: TObject);


   private  // Private declarations

      //    Cores:
      //    ColorA = $FFFFFF     branco, clWhite
      //    ColorC = $00C0FFFF   amarelo - pastel
      //    ColorD = $00C6F9CC   verde - pastel
      //    ColorE = $00F3E6CD   azul - pastel
      //    ColorF = $00A0A0A0
      //    ColorG = $00BEBEBE
      //    ColorH = $00D2D2D2
      //    ColorI = $00E3E3E3

      //             $00E8E8E8   cinza bem claro


   public   // Public declarations

      bSeparador     : Boolean;
      bQuebraPatro   : Boolean;

      CorLinha       : TColor;
      CorAtual       : TColor;
      bCorLinha      : Boolean;

      function MostraParam(Form: string): boolean; override;


   end;



var
  dtmRelItensGeradosDiaPP: TdtmRelItensGeradosDiaPP;



implementation
{$R *.DFM}
uses
   UFuncoesEmptmo, cRelItensGeradosDiaPP;



function TdtmRelItensGeradosDiaPP.MostraParam(Form: string): boolean;
var
   frm : TForm;
begin
   // criação dos forms de configuração de Relatórios

   // Prestação de Contas --------------------------------------------------------------------------------------
   if (LowerCase(Form) = 'cfgrelitensgeradosdiapp') then
   begin
      frm := TcfgRelItensGeradosDiaPP.Create(Application);
   end
   else
   begin
      frm := nil;
   end;

   if frm = nil then
   begin
      Result := False;
      Exit;
   end;

   with frm do
   begin
      Result := (ShowModal = mrOk);
      Free;
   end;
end;



procedure TdtmRelItensGeradosDiaPP.ppLine4Print(Sender: TObject);
begin
   inherited;
   (Sender as TppLine).Visible := bSeparador;
end;



procedure TdtmRelItensGeradosDiaPP.ppShape3Print(Sender: TObject);
begin
   inherited;

   if bCorLinha then
   begin
      if CorAtual = clWhite then
      begin
         CorAtual := CorLinha;
      end
      else
      begin
         CorAtual := clWhite;
      end;
   end
   else
   begin
      CorAtual := clWhite;
   end;

   (Sender as TppShape).Brush.Color := CorAtual;
end;



procedure TdtmRelItensGeradosDiaPP.ppShape2Print(Sender: TObject);
begin
   inherited;
   CorAtual := clWhite;
end;



end.
