{---------------------------Alteração-------------------------------------------
Pendência   : SOL 114575 KINTANA 535771
Responsável : Jéssica Lana
Data        : 24/04/2009
Descrição   : Gravar arquivos com a query de entrada na pasta C:\PLANUS\TEMP.
-------------------------------------------------------------------------------}
unit dRelItensEnvioContrato;

interface

uses
   Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
   dReports, ppVar, ppBands, ppCtrls, ppPrnabl, ppClass, ppCache, ppProd,
   ppReport, Db, DBTables, Wwquery, Wwdatsrc, ppComm, ppRelatv, ppDB,
   ppDBPipe, ppDBBDE, ppModule, raCodMod, ppRichTx, ppStrtch, ppMemo;

type
   TdtmRelItensEnvioContrato = class(TdtmReports)
    pplItensEnvioContrato: TppBDEPipeline;
    dtsItensEnvioContrato: TwwDataSource;
    rtpItensEnvioContrato: TppReport;
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
      ppLine4: TppLine;
      ppShape3: TppShape;
      ppLabel13: TppLabel;
      ppLabel19: TppLabel;
    qryItensEnvioContrato: TwwQuery;
      ppDBText3: TppDBText;
      ppDBText4: TppDBText;
      ppDBText7: TppDBText;
      ppDBText8: TppDBText;
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
      ppDBCalc5: TppDBCalc;
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
      qryItensEnvioContratoIDCONTRATOEMPTMO: TFloatField;
      qryItensEnvioContratoIDPATRO: TFloatField;
      qryItensEnvioContratoPATRO: TStringField;
      qryItensEnvioContratoIDPLANOPREV: TFloatField;
      qryItensEnvioContratoPLANO: TStringField;
      qryItensEnvioContratoNOME: TStringField;
      qryItensEnvioContratoMATRICULA: TStringField;
      qryItensEnvioContratoTCEDESCRICAO: TStringField;
      qryItensEnvioContratoVLR_PREV_BENEF: TFloatField;
      qryItensEnvioContratoVLR_EFET_BENEF: TFloatField;
      qryItensEnvioContratoVLR_PREV_PATRO: TFloatField;
      qryItensEnvioContratoVLR_EFET_PATRO: TFloatField;
    ppLabel26: TppLabel;
    ppLabel122: TppLabel;
    dtmRelItensEnviolContrato_lblSitPart: TppLabel;
    ppLabel22: TppLabel;
    ppLabel23: TppLabel;
    ppMemo2: TppMemo;
    memPatro: TppRichText;
    memPlano: TppRichText;
    ppMemo1: TppMemo;
    ppLabel56: TppLabel;
    ppLabel57: TppLabel;
    lblTipoEmptmo: TppLabel;
    lblTipoContr: TppLabel;

      procedure ppLine4Print(Sender: TObject);
      procedure ppShape3Print(Sender: TObject);
      procedure ppLabel13Print(Sender: TObject);
      procedure ppShape1Print(Sender: TObject);
      procedure qryItensEnvioContratoBeforeOpen(DataSet: TDataSet);
      procedure ppDetailBand1BeforePrint(Sender: TObject);


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

      bSintetico        : Boolean;

      sMesCobranca      : String;
      bSeparador        : Boolean;
      CorLinha          : TColor;
      CorAtual          : TColor;
      bCorLinha         : Boolean;

      function MostraParam(Form: string): boolean; override;

   end;



var
  dtmRelItensEnvioContrato: TdtmRelItensEnvioContrato;



implementation
{$R *.DFM}
uses
   UFuncoesEmptmo, uSistema, cRelItensEnvioContrato;




function TdtmRelItensEnvioContrato.MostraParam(Form: string): boolean;
var
   frm : TForm;
begin
   // criação dos forms de configuração de Relatórios

   if (LowerCase(Form) = 'cfgrelitensenviocontrato') then begin
      frm := TcfgRelItensEnvioContrato.Create(Application);
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



procedure TdtmRelItensEnvioContrato.ppLine4Print(Sender: TObject);
begin
   inherited;
   (Sender as TppLine).Visible := bSeparador;
end;



procedure TdtmRelItensEnvioContrato.ppShape3Print(Sender: TObject);
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



procedure TdtmRelItensEnvioContrato.ppLabel13Print(Sender: TObject);
begin
   inherited;
   TppLabel(Sender).Caption := sMesCobranca;
end;



procedure TdtmRelItensEnvioContrato.ppShape1Print(Sender: TObject);
begin
   inherited;
   (Sender as TppShape).Brush.Color := clSilver;
end;



procedure TdtmRelItensEnvioContrato.qryItensEnvioContratoBeforeOpen(DataSet: TDataSet);
begin
   inherited;

   // Gravando o SQL do relatório em texto para facilitar verificação
   // Jéssica Lana SOL 114575 Kintana 535771 24/04/2009
   // qryItensEnvioContrato.SQL.SaveToFile(Sistema.TempDir + 'EP-RelItensEnvioContrato.txt');
      qryItensEnvioContrato.SQL.SaveToFile(ftempregra + '\' + 'EP-RelItensEnvioContrato.txt');
   Application.ProcessMessages;
end;



procedure TdtmRelItensEnvioContrato.ppDetailBand1BeforePrint(Sender: TObject);
begin
   inherited;
   (Sender as TppDetailBand).Visible := not(bSintetico);
end;



end.
