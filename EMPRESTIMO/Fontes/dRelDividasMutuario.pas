unit dRelDividasMutuario;

// Alterações:
{
 --------------------------------------------------------------------------------------------------
Pendência   : SOL 253185 PPM 771995
Responsável : William Moreira da Silva
Data        : 17/06/2015
Descrição   : Reestruturação da HistMovEmptmo(*Retirada dos Hint's)
 --------------------------------------------------------------------------------------------------}

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  dReports, ppVar, ppBands, ppCtrls, ppPrnabl, ppClass, ppCache, ppProd,
  ppReport, Db, DBTables, Wwquery, Wwdatsrc, ppComm, ppRelatv, ppDB,
  ppDBPipe, ppDBBDE, ppRichTx, ppStrtch, ppMemo;

type
  TdtmRelDividasMutuario = class(TdtmReports)
    pplDividas: TppBDEPipeline;
    dsDividas: TwwDataSource;
    qryDividas: TwwQuery;
    rptDividasMutuario: TppReport;
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
    ppLabel122: TppLabel;
    rptDividas_lblDataRef: TppLabel;
    ppDBText1: TppDBText;
    ppDBText5: TppDBText;
    ppLine3: TppLine;
    ppShape3: TppShape;
    ppLabel11: TppLabel;
    ppLabel8: TppLabel;
    ppLabel12: TppLabel;
    ppLabel13: TppLabel;
    ppDBText7: TppDBText;
    ppLabel15: TppLabel;
    ppGroup1: TppGroup;
    ppGroupHeaderBand1: TppGroupHeaderBand;
    ppGroupFooterBand1: TppGroupFooterBand;
    ppDBText8: TppDBText;
    ppLine4: TppLine;
    ppGroup2: TppGroup;
    ppGroupHeaderBand2: TppGroupHeaderBand;
    ppGroupFooterBand2: TppGroupFooterBand;
    ppDBText10: TppDBText;
    ppDBText11: TppDBText;
    ppLabel18: TppLabel;
    ppShape7: TppShape;
    ppLabel19: TppLabel;
    qryDividasIDCONTRATOEMPTMO: TFloatField;
    qryDividasNOME: TStringField;
    qryDividasMATRICULA: TStringField;
    qryDividasTCEDESCRICAO: TStringField;
    qryDividasSITDESCRICAO: TStringField;
    qryDividasHMEDATAATUALIZA: TDateTimeField;
    qryDividasHMESALDODEV: TFloatField;
    qryDividasPARCELA: TFloatField;
    qryDividasCOMPETENCIA: TStringField;
    qryDividasHMEVLRPREVISTO: TFloatField;
    qryDividasHMESEQCOBRANCA: TFloatField;
    ppShape1: TppShape;
    ppLabel6: TppLabel;
    ppDBText2: TppDBText;
    ppDBText3: TppDBText;
    qryDividasITEDESCRICAO: TStringField;
    ppDBText4: TppDBText;
    ppDBText6: TppDBText;
    ppDBText9: TppDBText;
    ppLabel7: TppLabel;
    ppLabel9: TppLabel;
    ppDBCalc1: TppDBCalc;
    qryDividasVLRCONTRATO: TFloatField;
    ppLabel10: TppLabel;
    ppDBText12: TppDBText;
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
    ppLabel14: TppLabel;
    ppLabel16: TppLabel;
    ppMemo3: TppMemo;
    ppRichText1: TppRichText;
    ppRichText2: TppRichText;
    ppMemo4: TppMemo;
    ppLabel17: TppLabel;
    ppLabel20: TppLabel;
    ppLabel21: TppLabel;
    ppLabel24: TppLabel;
    qryDividasSTATUSCONTR: TStringField;
    ppLabel25: TppLabel;
    ppDBText13: TppDBText;
    upd: TUpdateSQL;

    procedure rptDividas_lblDataRefPrint(Sender: TObject);
    procedure ppLine3Print(Sender: TObject);
    procedure ppShape3Print(Sender: TObject);
    procedure ppGroupHeaderBand2AfterPrint(Sender: TObject);

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

      sDataRef    : String;
      bSeparador  : Boolean;
      CorLinha    : TColor;
      CorAtual    : TColor;
      bCorLinha   : Boolean;

      function MostraParam(Form: string): boolean; override;

  end;



var
  dtmRelDividasMutuario: TdtmRelDividasMutuario;



implementation
{$R *.DFM}
uses
   UFuncoesEmptmo, cRelDividasMutuario;



function TdtmRelDividasMutuario.MostraParam(Form: string): boolean;
var
   frm : TForm;
begin
   // criação dos forms de configuração de Relatórios

   // Prestação de Contas --------------------------------------------------------------------------------------
   if (LowerCase(Form) = 'cfgreldividasmutuario') then begin
      frm := TcfgRelDividasMutuario.Create(Application);
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



procedure TdtmRelDividasMutuario.rptDividas_lblDataRefPrint(Sender: TObject);
begin
   inherited;
   (Sender as TppLabel).Caption := sDataRef;
end;



procedure TdtmRelDividasMutuario.ppLine3Print(Sender: TObject);
begin
   inherited;
   (Sender as TppLine).Visible := bSeparador;
end;



procedure TdtmRelDividasMutuario.ppShape3Print(Sender: TObject);
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



procedure TdtmRelDividasMutuario.ppGroupHeaderBand2AfterPrint(Sender: TObject);
begin
   inherited;
   CorAtual := clWhite;
end;



end.
