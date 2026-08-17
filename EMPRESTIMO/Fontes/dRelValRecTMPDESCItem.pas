unit dRelValRecTMPDESCItem;

// Alterações:
{ --------------------------------------------------------------------------------------------------
Pendência   : SOL 114575 KINTANA 535771
Responsável : Jéssica Lana
Data        : 24/04/2009
Descrição   : Gravar arquivos com a query de entrada na pasta C:\PLANUS\TEMP.
----------------------------------------------------------------------------------------------------
Rotina    : -
Data      : 24/10/2002
Autor     : André Pontes
Descrição : Quebra e Totalização por Patrocinadora
----------------------------------------------------------------------------------------------------
Rotina    : -
Data      : 01/10/2002
Autor     : André Pontes
Descrição : Quebra e Totalização por Patrocinadora
---------------------------------------------------------------------------------------------------}

interface

uses
   Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
   dReports, Db, ppBands, ppPrnabl, ppClass, ppCtrls, ppCache, ppProd,
   ppReport, DBTables, Wwquery, Wwdatsrc, ppComm, ppRelatv, ppDB, ppDBPipe,
   ppDBBDE, ppVar;

type
   TdtmRelValRecTMPDESCItem = class(TdtmReports)
      qryValRecTMPDESC: TwwQuery;
      qryValRecTMPDESCNOME_MUTUARIO: TStringField;
      qryValRecTMPDESCTCEDESCRICAO: TStringField;
      qryValRecTMPDESCNOME: TStringField;
      qryValRecTMPDESCIDMODULO: TFloatField;
      qryValRecTMPDESCSITENVIO: TStringField;
      qryValRecTMPDESCMATRICULA: TStringField;
      qryValRecTMPDESCIDDESCONTO: TFloatField;
      qryValRecTMPDESCVALOR: TFloatField;
      qryValRecTMPDESCVALORRECEBIDO: TFloatField;
      qryValRecTMPDESCIDPROVENTO: TFloatField;
      qryValRecTMPDESCCODPROVDESC: TStringField;
      qryValRecTMPDESCMESCOBRANCA: TStringField;
      qryValRecTMPDESCMESREFERENCIA: TStringField;
      qryValRecTMPDESCIDPESSOA: TFloatField;
      qryValRecTMPDESCIDTITULAR: TFloatField;
      qryValRecTMPDESCRECPAG: TStringField;
      qryValRecTMPDESCFLGTIPODESC: TStringField;
      qryValRecTMPDESCDATARECEBIMENTO: TDateTimeField;
      qryValRecTMPDESCIDPLANOPREV: TFloatField;
      qryValRecTMPDESCINSCRICAONUMERO: TFloatField;
      qryValRecTMPDESCFLGDESCONTO: TFloatField;
      qryValRecTMPDESCFLGDESCFOLHA: TStringField;
      qryValRecTMPDESCDATAREFERENCIA: TDateTimeField;
      qryValRecTMPDESCDESCRICAO: TStringField;
      qryValRecTMPDESCREFERENCIA: TStringField;
      qryValRecTMPDESCDATACOBRANCA: TDateTimeField;
      qryValRecTMPDESCNODOCUMENTO: TFloatField;
      qryValRecTMPDESCIDLOTE: TFloatField;
      qryValRecTMPDESCLOTEPREVIA: TFloatField;
      pplValRecTMPDESC: TppBDEPipeline;
      dtsValRecTMPDESC: TwwDataSource;
      rptValRecTMPDESC: TppReport;
      ppHeaderBand1: TppHeaderBand;
      ppLabel1: TppLabel;
      ppLabel4: TppLabel;
      rptValRecTMPDESC_lblMesCobranca: TppLabel;
      ppLabel5: TppLabel;
      ppLabel9: TppLabel;
      ppLabel10: TppLabel;
      ppLabel11: TppLabel;
      ppLabel12: TppLabel;
      ppLabel13: TppLabel;
      ppLabel15: TppLabel;
      ppLabel6: TppLabel;
      ppLabel7: TppLabel;
      ppLabel8: TppLabel;
      ppLabel14: TppLabel;
      ppLabel16: TppLabel;
      ppLabel17: TppLabel;
      ppLabel19: TppLabel;
      ppDetailBand1: TppDetailBand;
      ppShape3: TppShape;
      ppLine4: TppLine;
      ppDBText1: TppDBText;
      ppDBText7: TppDBText;
      ppDBText2: TppDBText;
      ppDBText5: TppDBText;
      ppDBText9: TppDBText;
      ppDBText8: TppDBText;
      ppDBText6: TppDBText;
      ppDBText3: TppDBText;
      ppDBText4: TppDBText;
      ppFooterBand1: TppFooterBand;
      ppLine2: TppLine;
      ppLabel3: TppLabel;
      ppSystemVariable1: TppSystemVariable;
      ppSystemVariable2: TppSystemVariable;
      ppLabel2: TppLabel;
      ppSummaryBand1: TppSummaryBand;
      ppLine3: TppLine;
      ppLabel18: TppLabel;
      ppLabel20: TppLabel;
      ppDBCalc1: TppDBCalc;
      ppDBCalc2: TppDBCalc;
      ppDBText10: TppDBText;
      qryValRecTMPDESCTIPO_FOLHA: TStringField;
      ppShape1: TppShape;
      ppLabel21: TppLabel;
      qryValRecTMPDESCSIT_TITULAR: TStringField;
      qryValRecTMPDESCSITDESCRICAO: TStringField;
      qryValRecTMPDESCRESIDUO: TFloatField;
      ppLabel23: TppLabel;
      ppDBText11: TppDBText;
      ppDBCalc3: TppDBCalc;
      ppDBText12: TppDBText;
      ppLabel22: TppLabel;
      ppGroup1: TppGroup;
      ppGroupHeaderBand1: TppGroupHeaderBand;
      ppGroupFooterBand1: TppGroupFooterBand;
      ppDBText13: TppDBText;
      ppShape2: TppShape;
      ppLine1: TppLine;
      ppLabel24: TppLabel;
      ppDBCalc4: TppDBCalc;
      ppDBCalc5: TppDBCalc;
      ppDBCalc6: TppDBCalc;
    ppShape4: TppShape;
    ppLine5: TppLine;
    ppDBCalc7: TppDBCalc;
    ppLabel25: TppLabel;
    qryValRecTMPDESCPARCELA: TFloatField;
    qryValRecTMPDESCNUMPARCELAS: TFloatField;
    qryValRecTMPDESCPARC_RESTA: TFloatField;
    ppLabel26: TppLabel;
    ppDBText14: TppDBText;
    ppLabel27: TppLabel;
    ppDBText15: TppDBText;

      procedure ppHeaderBand1BeforePrint(Sender: TObject);
      procedure ppLine4Print(Sender: TObject);
      procedure ppShape3Print(Sender: TObject);
    procedure ppDetailBand1BeforePrint(Sender: TObject);
    procedure qryValRecTMPDESCBeforeOpen(DataSet: TDataSet);

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

      bSintetico  : Boolean;
      bSeparador  : Boolean;
      CorLinha    : TColor;
      CorAtual    : TColor;
      bCorLinha   : Boolean;

      function MostraParam(Form: string): boolean; override;

   end;



var
  dtmRelValRecTMPDESCItem: TdtmRelValRecTMPDESCItem;


implementation
{$R *.DFM}
uses
   uSistema, uFuncoesEmptmo, cRelValRecTMPDESC;



function TdtmRelValRecTMPDESCItem.MostraParam(Form: string): boolean;
var
   frm : TForm;
begin
   // criação dos forms de configuração de Relatórios

   // Prestação de Contas --------------------------------------------------------------------------------------
   if (LowerCase(Form) = 'cfgrelvalrectmpdesc') then begin
      frm := TcfgRelValRecTMPDESC.Create(Application);
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



procedure TdtmRelValRecTMPDESCItem.ppHeaderBand1BeforePrint(Sender: TObject);
begin
   inherited;
   CorAtual := clWhite;
end;



procedure TdtmRelValRecTMPDESCItem.ppLine4Print(Sender: TObject);
begin
   inherited;
   (Sender as TppLine).Visible := bSeparador;
end;



procedure TdtmRelValRecTMPDESCItem.ppShape3Print(Sender: TObject);
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



procedure TdtmRelValRecTMPDESCItem.ppDetailBand1BeforePrint(Sender: TObject);
begin
   inherited;
   (Sender as TppDetailBand).Visible := not(bSintetico);
end;



procedure TdtmRelValRecTMPDESCItem.qryValRecTMPDESCBeforeOpen(DataSet: TDataSet);
begin
   inherited;

   (* Gravando o SQL de entrada para permitir verificação *)
 // Jéssica Lana SOL 114575 Kintana 535771 24/04/2009
 // qryValRecTMPDESC.SQL.SaveToFile(Sistema.TempDir + 'EP-RelValoresReceber-Folhas.txt');
    qryValRecTMPDESC.SQL.SaveToFile(ftempregra + '\' + 'EP-RelValoresReceber-Folhas.txt');
    Application.ProcessMessages;
end;



end.
