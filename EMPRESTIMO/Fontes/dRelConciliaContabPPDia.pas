unit dRelConciliaContabPPDia;

interface

uses
   Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
   dReports, ppCtrls, ppBands, ppVar, ppPrnabl, ppClass, ppCache, ppProd,
   ppReport, Db, DBTables, Wwquery, Wwdatsrc, ppComm, ppRelatv, ppDB,
   ppDBPipe, ppDBBDE, ppRichTx, ppStrtch, ppMemo;

type
   TdtmRelConciliaContabPPDia = class(TdtmReports)
    pplConciliaContabPPDia: TppBDEPipeline;
    dtsConciliaContabPPDia: TwwDataSource;
    qryConciliaContabPPDia: TwwQuery;
    rptConciliaContabPPDia: TppReport;
      ppHeaderBand1: TppHeaderBand;
      ppLabel1: TppLabel;
      ppLabel2: TppLabel;
      ppDetailBand1: TppDetailBand;
      ppShape3: TppShape;
      ppLine3: TppLine;
      ppFooterBand1: TppFooterBand;
      ppLine2: TppLine;
      ppLabel3: TppLabel;
      ppSystemVariable1: TppSystemVariable;
      ppSystemVariable2: TppSystemVariable;
    qryConciliaContabPPDiaDATA: TDateTimeField;
    qryConciliaContabPPDiaCONTACONTABIL: TStringField;
    qryConciliaContabPPDiaNOMEPLANO: TStringField;
    qryConciliaContabPPDiaNOMEPATRO: TStringField;
    qryConciliaContabPPDiaEPDEB: TFloatField;
    qryConciliaContabPPDiaEPCRED: TFloatField;
    qryConciliaContabPPDiaCONTABDEB: TFloatField;
    qryConciliaContabPPDiaCONTABCRED: TFloatField;
    qryConciliaContabPPDiaDIFDEB: TFloatField;
    qryConciliaContabPPDiaDIFCRED: TFloatField;
      ppGroup1: TppGroup;
      ppGroupHeaderBand1: TppGroupHeaderBand;
      ppGroupFooterBand1: TppGroupFooterBand;
      ppGroup2: TppGroup;
      ppGroupHeaderBand2: TppGroupHeaderBand;
      ppGroupFooterBand2: TppGroupFooterBand;
      ppGroup3: TppGroup;
      ppGroupHeaderBand3: TppGroupHeaderBand;
      ppGroupFooterBand3: TppGroupFooterBand;
      ppDBText1: TppDBText;
      ppDBText2: TppDBText;
    ppDBtxtContaContabil: TppDBText;
      ppShape1: TppShape;
      ppLabel9: TppLabel;
      ppLabel8: TppLabel;
      ppLabel10: TppLabel;
      ppLabel11: TppLabel;
      ppDBText4: TppDBText;
      ppDBText5: TppDBText;
      ppDBText6: TppDBText;
      ppDBText7: TppDBText;
      ppLabel12: TppLabel;
      ppLabel13: TppLabel;
      ppDBText8: TppDBText;
      ppDBText9: TppDBText;
      ppLine4: TppLine;
      ppLine5: TppLine;
      ppLine6: TppLine;
      ppLabel14: TppLabel;
      ppLabel15: TppLabel;
      ppLabel16: TppLabel;
      ppGroup4: TppGroup;
      ppGroupHeaderBand4: TppGroupHeaderBand;
      ppGroupFooterBand4: TppGroupFooterBand;
      ppShape2: TppShape;
      ppDBText10: TppDBText;
    ppLine7: TppLine;
    rptConciliaContabPPlblDataIni: TppLabel;
    ppLabel5: TppLabel;
    rptConciliaContabPPlblDataFim: TppLabel;
    lblContaEP: TppLabel;
    lblLancamentoEP: TppLabel;
    lblPlnCodigo: TppLabel;
    lblContaDiverg: TppLabel;
    ppLabel18: TppLabel;
    ppLabel19: TppLabel;
    ppLabel20: TppLabel;
    lblContaContabil: TppLabel;
    ppLabel7: TppLabel;
    ppLabel4: TppLabel;
    ppLabel17: TppLabel;
    ppDBText3: TppDBText;
    ppDBText11: TppDBText;
    qryConciliaContabPPDiaPLANOME: TStringField;
    qryConciliaContabPPDiaNOMEMODULO: TStringField;
    ppLabel6: TppLabel;
    ppLabel21: TppLabel;
    ppMemo2: TppMemo;
    memPatro: TppRichText;
    memPlano: TppRichText;
    ppMemo1: TppMemo;

      procedure ppDetailBand1BeforePrint(Sender: TObject);
    procedure ppLine3Print(Sender: TObject);
    procedure ppShape3Print(Sender: TObject);


   private  // Private declarations

      //    Cores:
      //    ColorA = $FFFFFF   { branco, clWhite }
      //    ColorC = $00C0FFFF { amarelo - pastel }
      //    ColorD = $00C6F9CC { verde - pastel }
      //    ColorE = $00F3E6CD { azul - pastel }
      //    ColorF = $00A0A0A0
      //    ColorG = $00BEBEBE
      //    ColorH = $00D2D2D2
      //    ColorI = $00E3E3E3

      //             $00E8E8E8   cinza bem claro

   public   // Public declarations

      bSeparador        : Boolean;
      CorLinha          : TColor;
      CorAtual          : TColor;
      bCorLinha         : Boolean;

      function MostraParam(Form: String): Boolean; override;


   end;



var
  dtmRelConciliaContabPPDia: TdtmRelConciliaContabPPDia;



implementation
{$R *.DFM}
uses
   UFuncoesEmptmo, uSistema, cRelConciliaContabPPDia, uIntegraBack;



function TdtmRelConciliaContabPPDia.MostraParam(Form: string): boolean;
var
   frm : TForm;
begin
   // criação dos forms de configuração de Relatórios

   // Prestação de Contas --------------------------------------------------------------------------------------
   if (LowerCase(Form) = 'cfgrelconciliacontabppdia') then
   begin
      frm := TcfgRelConciliaContabPPDia.Create(Application);
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



procedure TdtmRelConciliaContabPPDia.ppDetailBand1BeforePrint(Sender: TObject);
begin
   inherited;
   ppDBtxtContaContabil.DisplayFormat := IntegraBack.MascaraPlano + ';0;';
end;



procedure TdtmRelConciliaContabPPDia.ppLine3Print(Sender: TObject);
begin
   inherited;
   (Sender as TppLine).Visible := bSeparador;
end;



procedure TdtmRelConciliaContabPPDia.ppShape3Print(Sender: TObject);
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



end.
