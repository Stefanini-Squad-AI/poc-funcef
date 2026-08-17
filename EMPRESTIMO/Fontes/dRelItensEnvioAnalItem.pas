{---------------------------Alteração-------------------------------------------
Pendência   : SOL 114575 KINTANA 535771
Responsável : Jéssica Lana
Data        : 24/04/2009
Descrição   : Gravar arquivos com a query de entrada na pasta C:\PLANUS\TEMP.
-------------------------------------------------------------------------------}
unit dRelItensEnvioAnalItem;

interface

uses
   Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
   dReports, ppVar, ppBands, ppCtrls, ppPrnabl, ppClass, ppCache, ppProd,
   ppReport, Db, DBTables, Wwquery, Wwdatsrc, ppComm, ppRelatv, ppDB,
   ppDBPipe, ppDBBDE, ppModule, raCodMod;

type
   TdtmRelItensEnvioAnalItem = class(TdtmReports)
      pplItensEnvioAnal: TppBDEPipeline;
      dtsItensEnvioAnal: TwwDataSource;
      rptItensEnvioAnal: TppReport;
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
      ppLabel13: TppLabel;
      ppLabel19: TppLabel;
      qryItensEnvioAnal: TwwQuery;
      ppDBText3: TppDBText;
      ppDBText4: TppDBText;
      ppDBText7: TppDBText;
      ppDBText8: TppDBText;
      ppDBText10: TppDBText;
      ppDBText12: TppDBText;
      ppGroup3: TppGroup;
      ppGroupHeaderBand3: TppGroupHeaderBand;
      ppGroupFooterBand3: TppGroupFooterBand;
      ppShape1: TppShape;
      ppDBText6: TppDBText;
      ppLine6: TppLine;
      ppLabel12: TppLabel;
      ppLabel14: TppLabel;
      ppLabel15: TppLabel;
      ppLabel9: TppLabel;
      ppLabel10: TppLabel;
      ppLabel20: TppLabel;
      ppLabel8: TppLabel;
      ppLabel6: TppLabel;
      ppLine8: TppLine;
      ppLabel21: TppLabel;
      ppShape2: TppShape;
      ppLabel4: TppLabel;
      ppLabel5: TppLabel;
      ppDBText2: TppDBText;
      ppDBText5: TppDBText;
      ppLabel11: TppLabel;
      ppLine1: TppLine;
      ppLine3: TppLine;
      ppLine7: TppLine;
      ppDBCalc1: TppDBCalc;
      ppDBCalc2: TppDBCalc;
      ppDBCalc3: TppDBCalc;
      ppDBCalc4: TppDBCalc;
      ppDBCalc5: TppDBCalc;
      ppDBCalc6: TppDBCalc;
      ppDBCalc7: TppDBCalc;
      ppDBCalc8: TppDBCalc;
      ppDBCalc10: TppDBCalc;
      ppDBCalc11: TppDBCalc;
      ppDBCalc12: TppDBCalc;
      ppDBCalc13: TppDBCalc;
      ppShape4: TppShape;
      ppLabel7: TppLabel;
      ppShape6: TppShape;
      ppLabel16: TppLabel;
      ppLabel17: TppLabel;
      ppShape5: TppShape;
      ppDBCalc9: TppDBCalc;
      ppDBCalc14: TppDBCalc;
    ppLabel18: TppLabel;
    ppDBText9: TppDBText;
    qryItensEnvioAnalIDCONTRATOEMPTMO: TFloatField;
    qryItensEnvioAnalIDPATRO: TFloatField;
    qryItensEnvioAnalPATRO: TStringField;
    qryItensEnvioAnalIDPLANOPREV: TFloatField;
    qryItensEnvioAnalPLANO: TStringField;
    qryItensEnvioAnalNOME: TStringField;
    qryItensEnvioAnalMATRICULA: TStringField;
    qryItensEnvioAnalTCEDESCRICAO: TStringField;
    qryItensEnvioAnalVLR_PREV_BENEF: TFloatField;
    qryItensEnvioAnalVLR_EFET_BENEF: TFloatField;
    qryItensEnvioAnalVLR_PREV_PATRO: TFloatField;
    qryItensEnvioAnalVLR_EFET_PATRO: TFloatField;
    qryItensEnvioAnalVLR_PREV_FIN: TFloatField;
    qryItensEnvioAnalVLR_EFET_FIN: TFloatField;

      procedure ppLine4Print(Sender: TObject);
      procedure ppShape3Print(Sender: TObject);
      procedure ppLabel13Print(Sender: TObject);
      procedure ppShape1Print(Sender: TObject);
    procedure qryItensEnvioAnalBeforeOpen(DataSet: TDataSet);


   private { Private declarations }

      //    Cores:
      //    ColorA = $FFFFFF   { branco, clWhite }
      //    ColorC = $00C0FFFF { amarelo - pastel }
      //    ColorD = $00C6F9CC { verde - pastel }
      //    ColorE = $00F3E6CD { azul - pastel }
      //    ColorF = $00A0A0A0
      //    ColorG = $00BEBEBE
      //    ColorH = $00D2D2D2
      //    ColorI = $00E3E3E3

   public { Public declarations }

      sMesCobranca      : String;
      bSeparador        : Boolean;
      CorLinha          : TColor;
      CorAtual          : TColor;
      bCorLinha         : Boolean;

      function MostraParam(Form: string): boolean; override;

   end;



var
  dtmRelItensEnvioAnalItem: TdtmRelItensEnvioAnalItem;



implementation
{$R *.DFM}
uses
   UFuncoesEmptmo, uSistema, cRelItensEnvioAnal;




function TdtmRelItensEnvioAnalItem.MostraParam(Form: string): boolean;
var
   frm : TForm;
begin
   // criação dos forms de configuração de Relatórios

   if (LowerCase(Form) = 'cfgrelitensenvioanal') then begin
      frm := TcfgRelItensEnvioAnal.Create(Application);
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



procedure TdtmRelItensEnvioAnalItem.ppLine4Print(Sender: TObject);
begin
   inherited;
   (Sender as TppLine).Visible := bSeparador;
end;



procedure TdtmRelItensEnvioAnalItem.ppShape3Print(Sender: TObject);
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



procedure TdtmRelItensEnvioAnalItem.ppLabel13Print(Sender: TObject);
begin
   inherited;
   TppLabel(Sender).Caption := sMesCobranca;
end;



procedure TdtmRelItensEnvioAnalItem.ppShape1Print(Sender: TObject);
begin
   inherited;
   (Sender as TppShape).Brush.Color := clSilver;
end;



procedure TdtmRelItensEnvioAnalItem.qryItensEnvioAnalBeforeOpen(DataSet: TDataSet);
begin
   inherited;

   // Gravando o SQL do relatório em texto para facilitar verificação
   // Jéssica Lana SOL 114575 Kintana 535771 24/04/2009
   // qryItensEnvioAnal.SQL.SaveToFile(Sistema.TempDir + 'EP-RelItensEnvioAnal.txt');
      qryItensEnvioAnal.SQL.SaveToFile(ftempregra + '\' + 'EP-RelItensEnvioAnal.txt');
   Application.ProcessMessages;
end;



end.
