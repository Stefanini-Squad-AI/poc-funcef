unit dRelItensGeradosSint;

interface

uses
   Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
   dReports, ppBands, ppClass, ppCtrls, Db, ppVar, ppPrnabl, ppCache,
   ppProd, ppReport, DBTables, Wwquery, Wwdatsrc, ppComm, ppRelatv, ppDB,
   ppDBPipe, ppDBBDE, ppRichTx, ppStrtch, ppMemo;

type
   TdtmRelItensGeradosSint = class(TdtmReports)
      pplItensGeradosSint: TppBDEPipeline;
      dtsItensGeradosSint: TwwDataSource;
      qryItensGeradosSint: TwwQuery;
      rptItensGeradosSint: TppReport;
      ppHeaderBand1: TppHeaderBand;
      ppLabel1: TppLabel;
      ppLabel2: TppLabel;
      ppDetailBand1: TppDetailBand;
      ppFooterBand1: TppFooterBand;
      ppLine2: TppLine;
      ppLabel3: TppLabel;
      ppSystemVariable1: TppSystemVariable;
      ppSystemVariable2: TppSystemVariable;
      ppGroup2: TppGroup;
      ppGroupHeaderBand2: TppGroupHeaderBand;
      ppGroupFooterBand2: TppGroupFooterBand;
    ppLabel25: TppLabel;
    ppLabel26: TppLabel;
    rptItensGeradosSint_lblPeriodo: TppLabel;
    rptItensGeradosSint_lblEvento: TppLabel;
    rptItensGeradosSint_lblCompetencia: TppLabel;
    ppGroup1: TppGroup;
    ppGroupHeaderBand1: TppGroupHeaderBand;
    ppGroupFooterBand1: TppGroupFooterBand;
    ppLabel22: TppLabel;
    ppLabel23: TppLabel;
    ppMemo2: TppMemo;
    memPatro: TppRichText;
    memPlano: TppRichText;
    ppMemo1: TppMemo;
    ppLabel13: TppLabel;
    ppShape2: TppShape;
    ppDBText1: TppDBText;
    ppLabel5: TppLabel;
    ppLabel14: TppLabel;
    ppLabel7: TppLabel;
    ppLabel6: TppLabel;
    ppLabel8: TppLabel;
    ppLabel11: TppLabel;
    ppLabel4: TppLabel;
    ppLabel18: TppLabel;
    ppLabel15: TppLabel;
    ppLabel19: TppLabel;
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
    ppLabel9: TppLabel;
    ppLabel16: TppLabel;
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
    ppLine1: TppLine;
    ppShape4: TppShape;
    ppDBCalc2: TppDBCalc;
    ppDBCalc3: TppDBCalc;
    ppDBCalc5: TppDBCalc;
    ppDBCalc6: TppDBCalc;
    ppDBCalc7: TppDBCalc;
    ppDBCalc8: TppDBCalc;
    ppDBCalc9: TppDBCalc;
    ppDBCalc1: TppDBCalc;
    ppDBCalc4: TppDBCalc;
    qryItensGeradosSintEVENTO: TFloatField;
    qryItensGeradosSintDESC_EVENTO: TStringField;
    qryItensGeradosSintIDITEMEMPTMO: TFloatField;
    qryItensGeradosSintITEDESCRICAO: TStringField;
    qryItensGeradosSintVALOR_AGRUPADO: TFloatField;
    qryItensGeradosSintVALOR_CENTRALIZA: TFloatField;
    qryItensGeradosSintVALOR_AGRUPADO_CONTAB: TFloatField;
    qryItensGeradosSintVALOR_EFETIVO: TFloatField;
    qryItensGeradosSintVALOR_ABONADO: TFloatField;
    qryItensGeradosSintVALOR_ABONADO_CONTAB: TFloatField;
    qryItensGeradosSintABONO_CONTAB: TFloatField;
    qryItensGeradosSintVALOR_ESTORNADO_CONTAB: TFloatField;
    qryItensGeradosSintESTORNO_CONTAB: TFloatField;
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
  dtmRelItensGeradosSint: TdtmRelItensGeradosSint;



implementation
{$R *.DFM}
uses
   uSistema, uFuncoesEmptmo, cRelItensGeradosSint;



function TdtmRelItensGeradosSint.MostraParam(Form: string): boolean;
var
   frm : TForm;
begin
   // criação dos forms de configuração de Relatórios

   // Prestação de Contas --------------------------------------------------------------------------------------
   if (LowerCase(Form) = 'cfgrelitensgeradossint') then begin
      frm := TcfgRelItensGeradosSint.Create(Application);
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



procedure TdtmRelItensGeradosSint.ppLine4Print(Sender: TObject);
begin
   inherited;
   (Sender as TppLine).Visible := bSeparador;
end;



procedure TdtmRelItensGeradosSint.ppShape3Print(Sender: TObject);
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



procedure TdtmRelItensGeradosSint.ppShape2Print(Sender: TObject);
begin
   inherited;
   CorAtual := clWhite;
end;



end.
