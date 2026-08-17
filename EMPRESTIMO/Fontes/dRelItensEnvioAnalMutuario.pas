unit dRelItensEnvioAnalMutuario;

interface

uses
   Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
   dReports, ppVar, ppBands, ppCtrls, ppPrnabl, ppClass, ppCache, ppProd,
   ppReport, Db, DBTables, Wwquery, Wwdatsrc, ppComm, ppRelatv, ppDB,
   ppDBPipe, ppDBBDE, ppModule, raCodMod;

type
   TdtmRelItensEnvioAnalMutuario = class(TdtmReports)
      pplItensEnvioAnalMutuario: TppBDEPipeline;
      dtsItensEnvioAnalMutuario: TwwDataSource;
      rptItensEnvioAnalMutuario: TppReport;
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
      qryItensEnvioAnalMutuario: TwwQuery;
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
      ppLabel5: TppLabel;
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
      qryItensEnvioAnalMutuarioIDPATRO: TFloatField;
      qryItensEnvioAnalMutuarioPATRO: TStringField;
      qryItensEnvioAnalMutuarioIDPLANOPREV: TFloatField;
      qryItensEnvioAnalMutuarioPLANO: TStringField;
      qryItensEnvioAnalMutuarioNOME: TStringField;
      qryItensEnvioAnalMutuarioMATRICULA: TStringField;
      qryItensEnvioAnalMutuarioVLR_PREV_BENEF: TFloatField;
      qryItensEnvioAnalMutuarioVLR_EFET_BENEF: TFloatField;
      qryItensEnvioAnalMutuarioVLR_PREV_PATRO: TFloatField;
      qryItensEnvioAnalMutuarioVLR_EFET_PATRO: TFloatField;
      qryItensEnvioAnalMutuarioVLR_PREV_FIN: TFloatField;
      qryItensEnvioAnalMutuarioVLR_EFET_FIN: TFloatField;
      ppShape5: TppShape;
      ppLabel17: TppLabel;
      ppShape6: TppShape;
      ppLabel4: TppLabel;
      ppDBCalc14: TppDBCalc;
      ppDBCalc9: TppDBCalc;

      procedure ppLine4Print(Sender: TObject);
      procedure ppShape3Print(Sender: TObject);
      procedure ppLabel13Print(Sender: TObject);
      procedure ppShape1Print(Sender: TObject);


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
  dtmRelItensEnvioAnalMutuario: TdtmRelItensEnvioAnalMutuario;



implementation
{$R *.DFM}
uses
   UFuncoesEmptmo, uSistema, cRelItensEnvioAnalMutuario;




function TdtmRelItensEnvioAnalMutuario.MostraParam(Form: string): boolean;
var
   frm : TForm;
begin
   // criação dos forms de configuração de Relatórios

   if (LowerCase(Form) = 'cfgrelitensenvioanalmutuario') then begin
      frm := TcfgRelItensEnvioAnalMutuario.Create(Application);
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



procedure TdtmRelItensEnvioAnalMutuario.ppLine4Print(Sender: TObject);
begin
   inherited;
   (Sender as TppLine).Visible := bSeparador;
end;



procedure TdtmRelItensEnvioAnalMutuario.ppShape3Print(Sender: TObject);
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



procedure TdtmRelItensEnvioAnalMutuario.ppLabel13Print(Sender: TObject);
begin
   inherited;
   TppLabel(Sender).Caption := sMesCobranca;
end;



procedure TdtmRelItensEnvioAnalMutuario.ppShape1Print(Sender: TObject);
begin
   inherited;
   (Sender as TppShape).Brush.Color := clSilver;
end;



end.
