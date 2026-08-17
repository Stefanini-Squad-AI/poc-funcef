unit dRelAnaliseContabil;

interface

uses
   Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
   dReports, ppVar, ppBands, ppCtrls, ppPrnabl, ppClass, ppCache, ppProd,
   ppReport, Db, DBTables, Wwquery, Wwdatsrc, ppComm, ppRelatv, ppDB,
   ppDBPipe, ppDBBDE, ppRichTx, ppStrtch, ppMemo;

type
   TdtmRelAnaliseContabil = class(TdtmReports)
      pplAnaliseContabil: TppBDEPipeline;
      dsAnaliseContabil: TwwDataSource;
      qryAnaliseContabil: TwwQuery;
      rptAnaliseContabil: TppReport;
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
      ppDBCalc2: TppDBCalc;
      ppShape2: TppShape;
      ppLabel9: TppLabel;
      ppLine3: TppLine;
      ppShape3: TppShape;
      ppDBCalc3: TppDBCalc;
      ppLabel10: TppLabel;
      ppLabel12: TppLabel;
      ppLabel13: TppLabel;
      ppShape4: TppShape;
      qryAnaliseContabilCONTABAIXA: TStringField;
      qryAnaliseContabilMATRICULA: TStringField;
      qryAnaliseContabilIDCONTRATOEMPTMO: TFloatField;
      qryAnaliseContabilNOME: TStringField;
      qryAnaliseContabilPLNCODIGO: TFloatField;
      qryAnaliseContabilHMEPARCELA: TFloatField;
      qryAnaliseContabilVALOR: TFloatField;
      ppGroup1: TppGroup;
      ppGroupHeaderBand1: TppGroupHeaderBand;
      ppGroupFooterBand1: TppGroupFooterBand;
      ppGroup2: TppGroup;
      ppGroupHeaderBand2: TppGroupHeaderBand;
      ppGroupFooterBand2: TppGroupFooterBand;
      qryAnaliseContabilPLNDATDIA: TDateTimeField;
      ppDBText8: TppDBText;
      ppLabel17: TppLabel;
      ppShape5: TppShape;
      ppShape6: TppShape;
      ppLabel18: TppLabel;
      ppDBText9: TppDBText;
      ppLabel19: TppLabel;
      ppDBText10: TppDBText;
      ppLine4: TppLine;
      ppLine6: TppLine;
      ppLine7: TppLine;
      ppLabel6: TppLabel;
      ppShape1: TppShape;
      ppDBCalc1: TppDBCalc;
      ppLabel8: TppLabel;
      ppShape7: TppShape;
      ppDBCalc4: TppDBCalc;
      qryAnaliseContabilPLNPLANIL: TFloatField;
      ppDBText6: TppDBText;
      ppLabel11: TppLabel;
      qryAnaliseContabilCOMPETENCIA: TStringField;
      qryAnaliseContabilHMEDATAPREVISTA: TDateTimeField;
      ppDBText7: TppDBText;
      ppDBText11: TppDBText;
      ppLabel14: TppLabel;
      ppLabel15: TppLabel;
      ppDBText12: TppDBText;
      ppLabel16: TppLabel;
      qryAnaliseContabilITEDESCRICAO: TStringField;
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

      procedure rptDividas_lblDataRefPrint(Sender: TObject);
      procedure ppLine3Print(Sender: TObject);
      procedure ppShape3Print(Sender: TObject);
      procedure qryAnaliseContabilBeforeOpen(DataSet: TDataSet);

   private // Private declarations

      //    Cores:
      //    ColorA = $FFFFFF   { branco, clWhite }
      //    ColorC = $00C0FFFF { amarelo - pastel }
      //    ColorD = $00C6F9CC { verde - pastel }
      //    ColorE = $00F3E6CD { azul - pastel }
      //    ColorF = $00A0A0A0
      //    ColorG = $00BEBEBE
      //    ColorH = $00D2D2D2
      //    ColorI = $00E3E3E3

   public // Public declarations

      sDataRef    : String;
      bSeparador  : Boolean;
      CorLinha    : TColor;
      CorAtual    : TColor;
      bCorLinha   : Boolean;

      function MostraParam(Form: string): boolean; override;

   end;



var
  dtmRelAnaliseContabil: TdtmRelAnaliseContabil;



implementation
{$R *.DFM}
uses
   UFuncoesEmptmo, uSistema, cRelAnaliseContabil;



function TdtmRelAnaliseContabil.MostraParam(Form: string): boolean;
var
   frm : TForm;
begin
   // criação dos forms de configuração de Relatórios

   // Prestação de Contas --------------------------------------------------------------------------------------
   if (LowerCase(Form) = 'cfgrelanalisecontabil') then begin
      frm := TcfgRelAnaliseContabil.Create(Application);
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



procedure TdtmRelAnaliseContabil.rptDividas_lblDataRefPrint(Sender: TObject);
begin
   inherited;
   (Sender as TppLabel).Caption := sDataRef;
end;



procedure TdtmRelAnaliseContabil.ppLine3Print(Sender: TObject);
begin
   inherited;
   (Sender as TppLine).Visible := bSeparador;
end;



procedure TdtmRelAnaliseContabil.ppShape3Print(Sender: TObject);
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



procedure TdtmRelAnaliseContabil.qryAnaliseContabilBeforeOpen(DataSet: TDataSet);
begin
   inherited;

   // Gravando o SQL do relatório em texto para facilitar verificação
   qryAnaliseContabil.SQL.SaveToFile(Sistema.TempDir + 'EP-RelAnaliseContail.txt');
   Application.ProcessMessages;
end;



end.
