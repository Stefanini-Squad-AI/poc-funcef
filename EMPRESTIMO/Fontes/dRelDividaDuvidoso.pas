{---------------------------Alteração-------------------------------------------
Pendência   : SOL 114575 KINTANA 535771
Responsável : Jéssica Lana
Data        : 24/04/2009
Descrição   : Gravar arquivos com a query de entrada na pasta C:\PLANUS\TEMP.
-------------------------------------------------------------------------------}
unit dRelDividaDuvidoso;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  dReports, ppVar, ppBands, ppCtrls, ppPrnabl, ppClass, ppCache, ppProd,
  ppReport, Db, DBTables, Wwquery, Wwdatsrc, ppComm, ppRelatv, ppDB,
  ppDBPipe, ppDBBDE, ppRichTx, ppStrtch, ppMemo;

type
  TdtmRelDividaDuvidoso = class(TdtmReports)
    pplDividaDuvidoso: TppBDEPipeline;
    dtsDividaDuvidoso: TwwDataSource;
    qryDividaDuvidoso: TwwQuery;
    rptDividaDuvidoso: TppReport;
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
    ppSummaryBand1: TppSummaryBand;
    ppLine5: TppLine;
    ppLabel122: TppLabel;
    rptDividas_lblDataRef: TppLabel;
    ppDBText1: TppDBText;
    ppDBText2: TppDBText;
    ppDBText3: TppDBText;
    ppDBText5: TppDBText;
    ppDBCalc2: TppDBCalc;
    ppShape2: TppShape;
    ppLabel9: TppLabel;
    ppLine3: TppLine;
    ppShape3: TppShape;
    ppDBCalc3: TppDBCalc;
    ppLabel10: TppLabel;
    ppDBText6: TppDBText;
    ppLabel12: TppLabel;
    ppLabel14: TppLabel;
    ppDBCalc4: TppDBCalc;
    ppLabel13: TppLabel;
    ppDBText7: TppDBText;
    ppLabel16: TppLabel;
    ppShape4: TppShape;
    ppDBText8: TppDBText;
    ppLabel6: TppLabel;
    updDividaDuvidoso: TUpdateSQL;
    qryDividaDuvidosoIDCONTRATOEMPTMO: TFloatField;
    qryDividaDuvidosoNOME_TITULAR: TStringField;
    qryDividaDuvidosoNOME_BENEF: TStringField;
    qryDividaDuvidosoSIT_PART: TStringField;
    qryDividaDuvidosoMATRICULA: TStringField;
    qryDividaDuvidosoMATRICULA_TIT: TStringField;
    qryDividaDuvidosoHMEDATAATUALIZA: TDateTimeField;
    qryDividaDuvidosoHMESALDODEV: TFloatField;
    qryDividaDuvidosoHMEPARCELA: TFloatField;
    qryDividaDuvidosoHMENUMPARCELAS: TFloatField;
    qryDividaDuvidosoVALOR_DEVIDO: TFloatField;
    qryDividaDuvidosoTCEDESCRICAO: TStringField;
    qryDividaDuvidosoPERCENT: TFloatField;
    qryDividaDuvidosoPROVISAO: TFloatField;
    qryDividaDuvidosoFAIXA: TStringField;
    qryDividaDuvidosoDATA_PRIM_DIVIDA: TDateTimeField;
    qryDividaDuvidosoDIAS_DIVIDA: TFloatField;
    qryDividaDuvidosoTOTAL: TFloatField;
    ppGroup1: TppGroup;
    ppGroupHeaderBand1: TppGroupHeaderBand;
    ppGroupFooterBand1: TppGroupFooterBand;
    ppDBText9: TppDBText;
    ppLabel7: TppLabel;
    ppShape5: TppShape;
    ppDBCalc6: TppDBCalc;
    ppDBCalc7: TppDBCalc;
    ppDBCalc8: TppDBCalc;
    ppLabel8: TppLabel;
    ppLine4: TppLine;
    ppLabel11: TppLabel;
    ppLabel17: TppLabel;
    ppDBText4: TppDBText;
    ppDBText10: TppDBText;
    ppLabel19: TppLabel;
    ppLabel20: TppLabel;
    ppLabel21: TppLabel;
    ppLabel15: TppLabel;
    ppDBText11: TppDBText;
    ppDBText12: TppDBText;
    ppLabel18: TppLabel;
    qryDividaDuvidosoDATACREDITO: TDateTimeField;
    qryDividaDuvidosoRESERVA: TFloatField;
    ppDBText13: TppDBText;
    ppLabel22: TppLabel;
    ppLabel23: TppLabel;
    ppDBCalc1: TppDBCalc;
    ppDBCalc5: TppDBCalc;
    qryDividaDuvidosoIDPATRO: TFloatField;
    qryDividaDuvidosoIDPLANOPREV: TFloatField;
    qryDividaDuvidosoIDREGRARESERVA: TFloatField;
    qryDividaDuvidosoIDBENEF: TFloatField;
    qryDividaDuvidosoIDPESSOA: TFloatField;
    ppLabel24: TppLabel;
    ppDBText14: TppDBText;
    ppLabel25: TppLabel;
    ppLabel26: TppLabel;
    ppLabel27: TppLabel;
    ppLabel28: TppLabel;
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
    procedure ppShape1Print(Sender: TObject);
    procedure qryDividaDuvidosoBeforeOpen(DataSet: TDataSet);

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
  dtmRelDividaDuvidoso: TdtmRelDividaDuvidoso;



implementation
{$R *.DFM}
uses
   uSistema, uFuncoesEmptmo, cRelDividaDuvidoso;





function TdtmRelDividaDuvidoso.MostraParam(Form: string): boolean;
var
   frm : TForm;
begin
   // criação dos forms de configuração de Relatórios

   // Prestação de Contas --------------------------------------------------------------------------------------
   if (LowerCase(Form) = 'cfgreldividaduvidoso') then begin
      frm := TcfgRelDividaDuvidoso.Create(Application);
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



procedure TdtmRelDividaDuvidoso.rptDividas_lblDataRefPrint(Sender: TObject);
begin
   inherited;
   (Sender as TppLabel).Caption := sDataRef;
end;



procedure TdtmRelDividaDuvidoso.ppLine3Print(Sender: TObject);
begin
   inherited;
   (Sender as TppLine).Visible := bSeparador;
end;



procedure TdtmRelDividaDuvidoso.ppShape3Print(Sender: TObject);
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



procedure TdtmRelDividaDuvidoso.ppShape1Print(Sender: TObject);
begin
   inherited;
   CorAtual := clWhite;
end;



procedure TdtmRelDividaDuvidoso.qryDividaDuvidosoBeforeOpen(DataSet: TDataSet);
begin
   inherited;

   (* Gravando o SQL de entrada para permitir verificação *)
 //Jéssica Lana SOL 114575 Kintana 535771 24/04/2009
 //qryDividaDuvidoso.SQL.SaveToFile(Sistema.TempDir + 'EP-RelProvisaoDuvidoso.txt');
   qryDividaDuvidoso.SQL.SaveToFile(ftempregra + '\' + 'EP-RelProvisaoDuvidoso.txt');
   Application.ProcessMessages;
end;



end.
