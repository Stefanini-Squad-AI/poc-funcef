unit dRelItensGeradosSintPP;

interface

uses
   Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
   dReports, ppBands, ppClass, ppCtrls, Db, ppVar, ppPrnabl, ppCache,
   ppProd, ppReport, DBTables, Wwquery, Wwdatsrc, ppComm, ppRelatv, ppDB,
   ppDBPipe, ppDBBDE, ppRichTx, ppStrtch, ppMemo;

type
   TdtmRelItensGeradosSintPP = class(TdtmReports)
      pplItensGeradosSintPP: TppBDEPipeline;
      dtsItensGeradosSintPP: TwwDataSource;
      qryItensGeradosSintPP: TwwQuery;
    qryItensGeradosSintPPNOMEPLANO: TStringField;
    qryItensGeradosSintPPNOMEPATRO: TStringField;
    qryItensGeradosSintPPPLANO_PATRO: TStringField;
    qryItensGeradosSintPPEVENTO: TFloatField;
    qryItensGeradosSintPPDESC_EVENTO: TStringField;
    qryItensGeradosSintPPIDITEMEMPTMO: TFloatField;
    qryItensGeradosSintPPITEDESCRICAO: TStringField;
    qryItensGeradosSintPPVALOR_AGRUPADO: TFloatField;
    qryItensGeradosSintPPVALOR_CENTRALIZA: TFloatField;
    qryItensGeradosSintPPVALOR_AGRUPADO_CONTAB: TFloatField;
    qryItensGeradosSintPPVALOR_EFETIVO: TFloatField;
    qryItensGeradosSintPPVALOR_ABONADO: TFloatField;
    qryItensGeradosSintPPVALOR_ABONADO_CONTAB: TFloatField;
    qryItensGeradosSintPPABONO_CONTAB: TFloatField;
    qryItensGeradosSintPPVALOR_ESTORNADO_CONTAB: TFloatField;
    qryItensGeradosSintPPESTORNO_CONTAB: TFloatField;
    rptItensGeradosSintPP: TppReport;
    ppHeaderBand2: TppHeaderBand;
    ppLabel13: TppLabel;
    ppLabel15: TppLabel;
    ppLabel16: TppLabel;
    ppLabel17: TppLabel;
    lblPeriodo: TppLabel;
    lblEvento: TppLabel;
    lblCompetencia: TppLabel;
    ppLabel22: TppLabel;
    ppLabel23: TppLabel;
    ppMemo2: TppMemo;
    memPatro: TppRichText;
    memPlano: TppRichText;
    ppMemo1: TppMemo;
    ppLabel18: TppLabel;
    ppDetailBand2: TppDetailBand;
    ppShape5: TppShape;
    ppLine8: TppLine;
    ppDBText11: TppDBText;
    ppDBText12: TppDBText;
    ppDBText13: TppDBText;
    ppDBText14: TppDBText;
    ppDBText15: TppDBText;
    ppDBText16: TppDBText;
    ppDBText17: TppDBText;
    ppDBText20: TppDBText;
    ppDBText21: TppDBText;
    ppDBText22: TppDBText;
    ppDBText23: TppDBText;
    ppFooterBand2: TppFooterBand;
    ppLine9: TppLine;
    ppLabel19: TppLabel;
    ppSystemVariable3: TppSystemVariable;
    ppSystemVariable4: TppSystemVariable;
    ppGroup6: TppGroup;
    ppGroupHeaderBand6: TppGroupHeaderBand;
    ppGroupFooterBand6: TppGroupFooterBand;
    ppGroup7: TppGroup;
    ppGroupHeaderBand7: TppGroupHeaderBand;
    ppDBText25: TppDBText;
    ppGroupFooterBand7: TppGroupFooterBand;
    ppLine10: TppLine;
    ppShape7: TppShape;
    ppDBCalc13: TppDBCalc;
    ppDBCalc14: TppDBCalc;
    ppDBCalc15: TppDBCalc;
    ppDBCalc16: TppDBCalc;
    ppDBCalc17: TppDBCalc;
    ppDBCalc18: TppDBCalc;
    ppDBCalc19: TppDBCalc;
    ppDBCalc20: TppDBCalc;
    ppDBCalc21: TppDBCalc;
    ppDBText26: TppDBText;
    ppGroup8: TppGroup;
    ppGroupHeaderBand8: TppGroupHeaderBand;
    ppShape8: TppShape;
    ppLabel32: TppLabel;
    ppLabel31: TppLabel;
    ppLabel21: TppLabel;
    ppLabel24: TppLabel;
    ppLabel27: TppLabel;
    ppLabel28: TppLabel;
    ppLabel29: TppLabel;
    ppLabel30: TppLabel;
    ppLabel33: TppLabel;
    ppLabel34: TppLabel;
    ppLabel38: TppLabel;
    ppLabel39: TppLabel;
    ppLabel40: TppLabel;
    ppLabel41: TppLabel;
    ppLabel42: TppLabel;
    ppLabel43: TppLabel;
    ppLabel44: TppLabel;
    ppLabel45: TppLabel;
    ppLabel46: TppLabel;
    ppLabel47: TppLabel;
    ppLabel48: TppLabel;
    ppLabel49: TppLabel;
    ppLabel50: TppLabel;
    ppDBText27: TppDBText;
    ppGroupFooterBand8: TppGroupFooterBand;
    ppLine11: TppLine;
    ppShape9: TppShape;
    ppDBCalc22: TppDBCalc;
    ppDBCalc23: TppDBCalc;
    ppDBCalc24: TppDBCalc;
    ppDBCalc25: TppDBCalc;
    ppDBCalc26: TppDBCalc;
    ppDBCalc27: TppDBCalc;
    ppDBCalc28: TppDBCalc;
    ppDBCalc29: TppDBCalc;
    ppDBCalc30: TppDBCalc;
    ppDBText28: TppDBText;
    ppDBText29: TppDBText;
    ppLabel56: TppLabel;
    ppLabel57: TppLabel;
    lblTipoEmptmo: TppLabel;
    lblTipoContr: TppLabel;

      procedure ppLine4Print(Sender: TObject);
      procedure ppShape3Print(Sender: TObject);
      procedure ppShape2Print(Sender: TObject);
    procedure ppGroupHeaderBand3BeforePrint(Sender: TObject);


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
  dtmRelItensGeradosSintPP: TdtmRelItensGeradosSintPP;



implementation
{$R *.DFM}
uses
   uSistema, uFuncoesEmptmo, cRelItensGeradosSintPP;



function TdtmRelItensGeradosSintPP.MostraParam(Form: string): boolean;
var
   frm : TForm;
begin
   // criação dos forms de configuração de Relatórios

   // Prestação de Contas --------------------------------------------------------------------------------------
   if (LowerCase(Form) = 'cfgrelitensgeradossintpp') then begin
      frm := TcfgRelItensGeradosSintPP.Create(Application);
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



procedure TdtmRelItensGeradosSintPP.ppLine4Print(Sender: TObject);
begin
   inherited;
   (Sender as TppLine).Visible := bSeparador;
end;



procedure TdtmRelItensGeradosSintPP.ppShape3Print(Sender: TObject);
begin
   inherited;

   if bCorLinha then begin
      if CorAtual = clWhite then begin
         CorAtual := CorLinha;
      end else begin
         CorAtual := clWhite;
      end;
   end else begin
      CorAtual := clWhite;
   end;

   (Sender as TppShape).Brush.Color := CorAtual;
end;



procedure TdtmRelItensGeradosSintPP.ppShape2Print(Sender: TObject);
begin
   inherited;
   CorAtual := clWhite;
end;



procedure TdtmRelItensGeradosSintPP.ppGroupHeaderBand3BeforePrint(Sender: TObject);
begin
   inherited;
   (Sender as TppGroupHeaderBand).Visible := not(bQuebraPatro);
end;



end.
