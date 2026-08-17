{---------------------------Alteração-------------------------------------------
Pendência   : SOL 114575 KINTANA 535771
Responsável : Jéssica Lana
Data        : 24/04/2009
Descrição   : Gravar arquivos com a query de entrada na pasta C:\PLANUS\TEMP.
-------------------------------------------------------------------------------}
unit dRelItensEnvioSint;

interface

uses
   Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
   dReports, ppVar, ppBands, ppCtrls, ppPrnabl, ppClass, ppCache, ppProd,
   ppReport, Db, DBTables, Wwquery, Wwdatsrc, ppComm, ppRelatv, ppDB,
   ppDBPipe, ppDBBDE;

type
   TdtmRelItensEnvioSint = class(TdtmReports)
      pplItensEnvioSint: TppBDEPipeline;
      dtsItensEnvioSint: TwwDataSource;
      rptItensEnviadosSint: TppReport;
      ppHeaderBand1: TppHeaderBand;
      ppLabel1: TppLabel;
      ppLabel2: TppLabel;
      ppDetailBand1: TppDetailBand;
      ppFooterBand1: TppFooterBand;
      ppLine2: TppLine;
      ppLabel3: TppLabel;
      ppSystemVariable1: TppSystemVariable;
      ppSystemVariable2: TppSystemVariable;
      ppDBText1: TppDBText;
      ppSummaryBand1: TppSummaryBand;
      ppLine5: TppLine;
      ppLabel122: TppLabel;
      ppLine4: TppLine;
      ppShape3: TppShape;
      lblMesCobranca: TppLabel;
      ppLabel19: TppLabel;
      qryItensEnvioSint: TwwQuery;
      ppGroup2: TppGroup;
      ppGroupHeaderBand2: TppGroupHeaderBand;
      ppGroupFooterBand2: TppGroupFooterBand;
      qryItensEnvioSintDESCTIPOEMPTMO: TStringField;
      qryItensEnvioSintTCEDESCRICAO: TStringField;
      qryItensEnvioSintITEDESCRICAO: TStringField;
      qryItensEnvioSintQUANT_PATRO: TFloatField;
      qryItensEnvioSintVLR_PATRO: TFloatField;
      qryItensEnvioSintVLR_REC_PATRO: TFloatField;
      qryItensEnvioSintQUANT_BENEF: TFloatField;
      qryItensEnvioSintVLR_BENEF: TFloatField;
      qryItensEnvioSintVLR_REC_BENEF: TFloatField;
      qryItensEnvioSintQUANT_CAR: TFloatField;
      qryItensEnvioSintVLR_CAR: TFloatField;
      qryItensEnvioSintVLR_REC_CAR: TFloatField;
      ppDBText2: TppDBText;
      ppDBText3: TppDBText;
      ppDBText4: TppDBText;
      ppDBText5: TppDBText;
      ppDBText7: TppDBText;
      ppDBText8: TppDBText;
      UpdateSQL: TUpdateSQL;
      ppGroup3: TppGroup;
      ppGroupHeaderBand3: TppGroupHeaderBand;
      ppGroupFooterBand3: TppGroupFooterBand;
      ppShape1: TppShape;
      ppDBText6: TppDBText;
      ppLine6: TppLine;
      ppLabel11: TppLabel;
      ppLabel12: TppLabel;
      ppLine7: TppLine;
      ppLabel14: TppLabel;
      ppLabel15: TppLabel;
      ppLabel7: TppLabel;
      ppLine1: TppLine;
      ppLabel9: TppLabel;
      ppLabel10: TppLabel;
      ppLabel20: TppLabel;
      ppDBText13: TppDBText;
      ppShape2: TppShape;
      ppDBCalc55: TppDBCalc;
      ppDBCalc1: TppDBCalc;
      ppDBCalc2: TppDBCalc;
      ppDBCalc3: TppDBCalc;
      ppDBCalc4: TppDBCalc;
      ppDBCalc5: TppDBCalc;
      qryItensEnvioSintPATRO: TStringField;
      ppGroup1: TppGroup;
      ppGroupHeaderBand1: TppGroupHeaderBand;
      ppGroupFooterBand1: TppGroupFooterBand;
      ppDBText11: TppDBText;
      ppLabel4: TppLabel;
      ppShape4: TppShape;
      ppDBCalc9: TppDBCalc;
      ppDBCalc10: TppDBCalc;
      ppDBCalc11: TppDBCalc;
      ppDBCalc12: TppDBCalc;
      ppDBCalc13: TppDBCalc;
      ppDBCalc14: TppDBCalc;
      ppDBText14: TppDBText;
      ppShape5: TppShape;
      ppLabel16: TppLabel;
      lblDataIni: TppLabel;
      ppLabel23: TppLabel;
      lblDataFim: TppLabel;
    lblPositivoNegativo: TppLabel;

      procedure ppLine4Print(Sender: TObject);
      procedure ppShape3Print(Sender: TObject);
      procedure qryItensEnvioSintBeforeOpen(DataSet: TDataSet);


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

      bSeparador        : Boolean;
      CorLinha          : TColor;
      CorAtual          : TColor;
      bCorLinha         : Boolean;

      function MostraParam(Form: string): boolean; override;

   end;



var
  dtmRelItensEnvioSint: TdtmRelItensEnvioSint;



implementation
{$R *.DFM}
uses
   UFuncoesEmptmo, uSistema, cRelItensEnvioSint;




function TdtmRelItensEnvioSint.MostraParam(Form: string): boolean;
var
   frm : TForm;
begin
   // criação dos forms de configuração de Relatórios

   // Prestação de Contas --------------------------------------------------------------------------------------
   if (LowerCase(Form) = 'cfgrelitensenviosint') then
   begin
      frm := Tcfgrelitensenviosint.Create(Application);
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



procedure TdtmRelItensEnvioSint.ppLine4Print(Sender: TObject);
begin
   inherited;
   (Sender as TppLine).Visible := bSeparador;
end;



procedure TdtmRelItensEnvioSint.ppShape3Print(Sender: TObject);
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



procedure TdtmRelItensEnvioSint.qryItensEnvioSintBeforeOpen(DataSet: TDataSet);
begin
   inherited;

   (* Gravando o SQL de entrada para permitir verificação *)
 //Jéssica Lana SOL 114575 Kintana 535771 24/04/2009
 //qryItensEnvioSint.SQL.SaveToFile(Sistema.TempDir + 'EP - RelItensEnvioSint.txt');
   qryItensEnvioSint.SQL.SaveToFile(ftempregra + '\' + 'EP - RelItensEnvioSint.txt');
   Application.ProcessMessages;
end;



end.
