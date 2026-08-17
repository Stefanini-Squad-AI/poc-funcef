//------------------------------------------------------------------------------
//Pendência   : SOL 114575 KINTANA 535771
//Responsável : Jésica Lana
//Data        : 24/04/2009
//Descrição   : Gravar arquivos com a query de entrada na pasta C:\PLANUS\TEMP.
//------------------------------------------------------------------------------
unit dRelDividas;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  dReports, ppVar, ppBands, ppCtrls, ppPrnabl, ppClass, ppCache, ppProd,
  ppReport, Db, DBTables, Wwquery, Wwdatsrc, ppComm, ppRelatv, ppDB,
  ppDBPipe, ppDBBDE;

type
  TdtmRelDividas = class(TdtmReports)
    pplDividas: TppBDEPipeline;
    dsDividas: TwwDataSource;
    qryDividas: TwwQuery;
    rptDividas: TppReport;
    ppHeaderBand1: TppHeaderBand;
    ppLabel1: TppLabel;
    ppLine1: TppLine;
    ppLabel2: TppLabel;
    ppDetailBand1: TppDetailBand;
    ppFooterBand1: TppFooterBand;
    ppLine2: TppLine;
    ppLabel3: TppLabel;
    ppSystemVariable1: TppSystemVariable;
    ppSystemVariable2: TppSystemVariable;
    ppShape1: TppShape;
    ppLabel4: TppLabel;
    ppLabel5: TppLabel;
    ppLabel7: TppLabel;
    ppSummaryBand1: TppSummaryBand;
    ppLine5: TppLine;
    ppLabel122: TppLabel;
    rptDividas_lblDataRef: TppLabel;
    ppDBText1: TppDBText;
    ppDBText2: TppDBText;
    ppDBText3: TppDBText;
    ppDBText4: TppDBText;
    ppDBText5: TppDBText;
    ppDBCalc1: TppDBCalc;
    ppDBCalc2: TppDBCalc;
    ppShape2: TppShape;
    ppLabel9: TppLabel;
    ppLine3: TppLine;
    ppShape3: TppShape;
    ppDBCalc3: TppDBCalc;
    ppLabel10: TppLabel;
    ppDBText6: TppDBText;
    ppLabel11: TppLabel;
    ppLabel8: TppLabel;
    ppLabel12: TppLabel;
    ppLabel14: TppLabel;
    ppDBCalc4: TppDBCalc;
    ppLabel13: TppLabel;
    ppDBText7: TppDBText;
    ppLabel16: TppLabel;
    ppShape4: TppShape;
    ppDBText8: TppDBText;
    ppLabel6: TppLabel;
    qryDividasIDCONTRATOEMPTMO: TFloatField;
    qryDividasNOME_TITULAR: TStringField;
    qryDividasNOME_BENEF: TStringField;
    qryDividasSIT_PART: TStringField;
    qryDividasMATRICULA: TStringField;
    qryDividasMATRICULA_TIT: TStringField;
    qryDividasHMEDATAATUALIZA: TDateTimeField;
    qryDividasHMESALDODEV: TFloatField;
    qryDividasHMEPARCELA: TFloatField;
    qryDividasHMENUMPARCELAS: TFloatField;
    qryDividasTCEDESCRICAO: TStringField;
    qryDividasDEVE: TFloatField;
    qryDividasTOTAL_DEV: TFloatField;
    qryDividasVLR_PAG: TFloatField;
    qryDividasVLRCONTRATO: TFloatField;
    ppLabel15: TppLabel;
    ppLabel17: TppLabel;
    ppDBText9: TppDBText;
    ppDBText10: TppDBText;
    ppLabel18: TppLabel;
    ppLabel19: TppLabel;

    procedure rptDividas_lblDataRefPrint(Sender: TObject);
    procedure ppLine3Print(Sender: TObject);
    procedure ppShape3Print(Sender: TObject);
    procedure ppShape1Print(Sender: TObject);
    procedure qryDividasBeforeOpen(DataSet: TDataSet);

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

      sDataRef    : String;
      bSeparador  : Boolean;
      CorLinha    : TColor;
      CorAtual    : TColor;
      bCorLinha   : Boolean;

      function MostraParam(Form: string): boolean; override;

  end;



var
  dtmRelDividas: TdtmRelDividas;



implementation
{$R *.DFM}
uses
   uSistema, uFuncoesEmptmo, cRelDividas;





function TdtmRelDividas.MostraParam(Form: string): boolean;
var
   frm : TForm;
begin
   // criação dos forms de configuração de Relatórios

   // Prestação de Contas --------------------------------------------------------------------------------------
   if (LowerCase(Form) = 'cfgreldividas') then
   begin
      frm := TcfgRelDividas.Create(Application);
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



procedure TdtmRelDividas.rptDividas_lblDataRefPrint(Sender: TObject);
begin
   inherited;
   (Sender as TppLabel).Caption := sDataRef;
end;



procedure TdtmRelDividas.ppLine3Print(Sender: TObject);
begin
   inherited;
   (Sender as TppLine).Visible := bSeparador;
end;



procedure TdtmRelDividas.ppShape3Print(Sender: TObject);
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



procedure TdtmRelDividas.ppShape1Print(Sender: TObject);
begin
   inherited;
   CorAtual := clWhite;
end;



procedure TdtmRelDividas.qryDividasBeforeOpen(DataSet: TDataSet);
begin
   inherited;

   //Gravando o SQL do relatório em texto para facilitar verificação
   //Jéssica Lana SOL 114575 24/04/2009
   //qryDividas.SQL.SaveToFile(Sistema.TempDir + 'EP-RelDividas.txt');
     qryDividas.SQL.SaveToFile(ftempregra + '\' + 'EP-RelDividas.txt');
   Application.ProcessMessages;
end;



end.
