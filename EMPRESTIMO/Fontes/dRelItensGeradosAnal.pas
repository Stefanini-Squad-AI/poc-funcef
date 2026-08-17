unit dRelItensGeradosAnal;

//--------------------------------------------------------------------------------
//Alteracao   : qryItensGeradosAnal
//SIG         : 131775
//Autor(a)    : Leandro                 
//Data        : 02/08/2023
//Alteração   : Alteração query obter campo ORIGEM
//--------------------------------------------------------------------------------

interface

uses
   Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
   dReports, ppDB, ppVar, ppBands, ppCtrls, ppPrnabl, ppClass, ppCache,
   ppProd, ppReport, Db, DBTables, Wwquery, Wwdatsrc, ppComm, ppRelatv,
   ppDBPipe, ppDBBDE, ppRichTx, ppStrtch, ppMemo;

type
   TdtmRelItensGeradosAnal = class(TdtmReports)
      pplItensGeradosAnal: TppBDEPipeline;
      dtsItensGeradosAnal: TwwDataSource;
      qryItensGeradosAnal: TwwQuery;
      rptItensGeradosAnal: TppReport;
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
      ppShape1: TppShape;
      ppShape3: TppShape;
      ppLine3: TppLine;
      ppLine4: TppLine;
      ppDBText1: TppDBText;
      ppLabel4: TppLabel;
      ppLabel5: TppLabel;
      ppLabel6: TppLabel;
      ppLabel7: TppLabel;
      ppLabel8: TppLabel;
      ppLabel9: TppLabel;
      ppLabel10: TppLabel;
      ppLabel11: TppLabel;
      ppDBText3: TppDBText;
      ppDBText4: TppDBText;
      ppDBText5: TppDBText;
      ppDBText6: TppDBText;
      ppDBText7: TppDBText;
      ppLabel12: TppLabel;
      ppDBText2: TppDBText;
      ppLabel13: TppLabel;
      ppDBText8: TppDBText;
      ppDBText9: TppDBText;
      ppDBText10: TppDBText;
      ppLabel14: TppLabel;
      ppLabel15: TppLabel;
      ppDBText11: TppDBText;
      ppLabel17: TppLabel;
      ppDBText12: TppDBText;
      ppLabel18: TppLabel;
      ppDBText13: TppDBText;
      ppLabel19: TppLabel;
      ppLabel20: TppLabel;
      ppDBText14: TppDBText;
      ppLabel21: TppLabel;
      ppLabel22: TppLabel;
      ppDBCalc1: TppDBCalc;
      ppDBCalc2: TppDBCalc;
      ppDBCalc3: TppDBCalc;
      ppShape2: TppShape;
      ppLabel16: TppLabel;
      ppLine1: TppLine;
      ppGroup2: TppGroup;
      ppGroupHeaderBand2: TppGroupHeaderBand;
      ppGroupFooterBand2: TppGroupFooterBand;
      ppLine5: TppLine;
    ppDBText15: TppDBText;
    ppLabel23: TppLabel;
    ppLabel24: TppLabel;
    ppDBCalc4: TppDBCalc;
    ppLabel25: TppLabel;
    ppLabel26: TppLabel;
    rptItensGeradosAnal_lblPeriodo: TppLabel;
    rptItensGeradosAnal_lblEvento: TppLabel;
    ppLabel27: TppLabel;
    rptItensGeradosAnal_lblCompetencia: TppLabel;
    ppLabel56: TppLabel;
    ppLabel57: TppLabel;
    lblTipoEmptmo: TppLabel;
    lblTipoContr: TppLabel;
    ppLabel28: TppLabel;
    ppLabel29: TppLabel;
    ppMemo2: TppMemo;
    memPatro: TppRichText;
    memPlano: TppRichText;
    ppMemo1: TppMemo;

      procedure ppLine4Print(Sender: TObject);
      procedure ppShape3Print(Sender: TObject);
      procedure ppLine3Print(Sender: TObject);


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
  dtmRelItensGeradosAnal: TdtmRelItensGeradosAnal;



implementation
{$R *.DFM}
uses
   UFuncoesEmptmo, cRelItensGeradosAnal;



function TdtmRelItensGeradosAnal.MostraParam(Form: string): boolean;
var
   frm : TForm;
begin
   // criação dos forms de configuração de Relatórios

   // Prestação de Contas --------------------------------------------------------------------------------------
   if (LowerCase(Form) = 'cfgrelitensgeradosanal') then begin
      frm := TcfgRelItensGeradosAnal.Create(Application);
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



procedure TdtmRelItensGeradosAnal.ppLine4Print(Sender: TObject);
begin
   inherited;
   (Sender as TppLine).Visible := bSeparador;
end;



procedure TdtmRelItensGeradosAnal.ppShape3Print(Sender: TObject);
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



procedure TdtmRelItensGeradosAnal.ppLine3Print(Sender: TObject);
begin
   inherited;
   CorAtual := clWhite;
end;



end.
