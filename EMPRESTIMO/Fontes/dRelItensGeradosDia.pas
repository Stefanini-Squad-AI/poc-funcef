unit dRelItensGeradosDia;

interface

uses
   Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
   dReports, ppBands, ppClass, ppCtrls, Db, ppVar, ppPrnabl, ppCache,
   ppProd, ppReport, DBTables, Wwquery, Wwdatsrc, ppComm, ppRelatv, ppDB,
   ppDBPipe, ppDBBDE, raCodMod, ppModule, daDataModule, ppRichTx, ppStrtch, ppMemo;

type
   TdtmRelItensGeradosDia = class(TdtmReports)
      pplItensGeradosDia: TppBDEPipeline;
      dtsItensGeradosDia: TwwDataSource;
      qryItensGeradosDia: TwwQuery;
      rptItensGeradosDia: TppReport;
      ppHeaderBand1: TppHeaderBand;
      ppLabel1: TppLabel;
      ppLabel2: TppLabel;
      ppDetailBand1: TppDetailBand;
      ppShape3: TppShape;
      ppLine4: TppLine;
      ppDBText6: TppDBText;
      ppDBText7: TppDBText;
      ppDBText9: TppDBText;
      ppFooterBand1: TppFooterBand;
      ppLine2: TppLine;
      ppLabel3: TppLabel;
      ppSystemVariable1: TppSystemVariable;
      ppSystemVariable2: TppSystemVariable;
      ppGroup1: TppGroup;
      ppGroupHeaderBand1: TppGroupHeaderBand;
      ppLabel14: TppLabel;
      ppGroupFooterBand1: TppGroupFooterBand;
      ppGroup2: TppGroup;
      ppGroupHeaderBand2: TppGroupHeaderBand;
      ppGroupFooterBand2: TppGroupFooterBand;
      ppLabel5: TppLabel;
      ppLabel7: TppLabel;
      ppShape2: TppShape;
      ppDBText1: TppDBText;
      ppDBText2: TppDBText;
      ppLabel4: TppLabel;
      ppShape1: TppShape;
      ppLabel6: TppLabel;
      ppLabel8: TppLabel;
      ppDBCalc2: TppDBCalc;
      ppShape4: TppShape;
      ppLine1: TppLine;
      ppLabel9: TppLabel;
      ppDBText5: TppDBText;
      ppDBText3: TppDBText;
      ppDBText10: TppDBText;
      ppLabel11: TppLabel;
      ppLabel12: TppLabel;
      ppDBCalc3: TppDBCalc;
      ppDBCalc4: TppDBCalc;
      ppLabel25: TppLabel;
      ppLabel26: TppLabel;
      rptItensGeradosDia_lblPeriodo: TppLabel;
      rptItensGeradosDia_lblEvento: TppLabel;
      ppLabel13: TppLabel;
      rptItensGeradosDia_lblCompetencia: TppLabel;
    ppDBText8: TppDBText;
    ppLabel16: TppLabel;
    ppLabel18: TppLabel;
    ppLabel15: TppLabel;
    ppDBCalc5: TppDBCalc;
    ppDBCalc6: TppDBCalc;
    ppGroup3: TppGroup;
    ppGroupHeaderBand3: TppGroupHeaderBand;
    ppGroupFooterBand3: TppGroupFooterBand;
    ppDBText11: TppDBText;
    ppDBText12: TppDBText;
    ppLabel19: TppLabel;
    ppLabel28: TppLabel;
    ppLabel29: TppLabel;
    ppLabel30: TppLabel;
    ppLabel20: TppLabel;
    ppDBText13: TppDBText;
    ppLabel31: TppLabel;
    ppLabel32: TppLabel;
    ppLabel33: TppLabel;
    ppDBCalc7: TppDBCalc;
    ppDBCalc8: TppDBCalc;
    ppDBCalc9: TppDBCalc;
    ppLabel22: TppLabel;
    ppLabel23: TppLabel;
    ppMemo2: TppMemo;
    memPatro: TppRichText;
    memPlano: TppRichText;
    ppMemo1: TppMemo;
    ppLabel24: TppLabel;
    ppLabel10: TppLabel;
    ppLabel17: TppLabel;
    ppLabel27: TppLabel;
    ppDBText4: TppDBText;
    ppDBCalc1: TppDBCalc;
    qryItensGeradosDiaEVENTO: TFloatField;
    qryItensGeradosDiaDESC_EVENTO: TStringField;
    qryItensGeradosDiaIDITEMEMPTMO: TFloatField;
    qryItensGeradosDiaITEDESCRICAO: TStringField;
    qryItensGeradosDiaHMEDATAPREVISTA: TDateTimeField;
    qryItensGeradosDiaVALOR_AGRUPADO: TFloatField;
    qryItensGeradosDiaVALOR_CENTRALIZA: TFloatField;
    qryItensGeradosDiaVALOR_AGRUPADO_CONTAB: TFloatField;
    qryItensGeradosDiaVALOR_EFETIVO: TFloatField;
    qryItensGeradosDiaVALOR_ABONADO: TFloatField;
    qryItensGeradosDiaVALOR_ABONADO_CONTAB: TFloatField;
    qryItensGeradosDiaABONO_CONTAB: TFloatField;
    qryItensGeradosDiaVALOR_ESTORNADO_CONTAB: TFloatField;
    qryItensGeradosDiaESTORNO_CONTAB: TFloatField;
    ppLabel56: TppLabel;
    ppLabel57: TppLabel;
    lblTipoEmptmo: TppLabel;
    lblTipoContr: TppLabel;

      procedure ppLine4Print(Sender: TObject);
      procedure ppShape3Print(Sender: TObject);
      procedure ppShape2Print(Sender: TObject);


   private { Private declarations }

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

   public { Public declarations }

      bSeparador  : Boolean;
      CorLinha    : TColor;
      CorAtual    : TColor;
      bCorLinha   : Boolean;

      function MostraParam(Form: string): boolean; override;

   end;



var
  dtmRelItensGeradosDia: TdtmRelItensGeradosDia;



implementation
{$R *.DFM}
uses
   UFuncoesEmptmo, cRelItensGeradosDia;



function TdtmRelItensGeradosDia.MostraParam(Form: string): boolean;
var
   frm : TForm;
begin
   // criação dos forms de configuração de Relatórios

   // Prestação de Contas --------------------------------------------------------------------------------------
   if (LowerCase(Form) = 'cfgrelitensgeradosdia') then begin
      frm := TcfgRelItensGeradosDia.Create(Application);
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



procedure TdtmRelItensGeradosDia.ppLine4Print(Sender: TObject);
begin
   inherited;
   (Sender as TppLine).Visible := bSeparador;
end;



procedure TdtmRelItensGeradosDia.ppShape3Print(Sender: TObject);
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



procedure TdtmRelItensGeradosDia.ppShape2Print(Sender: TObject);
begin
   inherited;
   CorAtual := clWhite;
end;



end.
