unit dRelConfereEnvioContrato;

// Alterações:
{ --------------------------------------------------------------------------------------------------
Pendência   : SOL 114575 KINTANA 535771
Responsável : Jéssica Lana
Data        : 24/04/2009
Descrição   : Gravar arquivos com a query de entrada na pasta C:\PLANUS\TEMP.
----------------------------------------------------------------------------------------------------
Rotina    :
Data      :
Autor     :
Descrição :
---------------------------------------------------------------------------------------------------}

interface

uses
   Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
   dReports, Db, ppBands, ppPrnabl, ppClass, ppCtrls, ppCache, ppProd,
   ppReport, DBTables, Wwquery, Wwdatsrc, ppComm, ppRelatv, ppDB, ppDBPipe,
   ppDBBDE, ppVar, ppRichTx, ppStrtch, ppMemo;

type
   TdtmRelConfereEnvioContrato = class(TdtmReports)
      qryConfereEnvioContrato: TwwQuery;
      pplConfereEnvioContrato: TppBDEPipeline;
      dtsConfereEnvioContrato: TwwDataSource;
      rptConfereEnvioContrato: TppReport;
      ppHeaderBand1: TppHeaderBand;
      ppLabel1: TppLabel;
      ppLabel2: TppLabel;
      rptConfereEnvioContrato_lblMesCobranca: TppLabel;
      ppLabel122: TppLabel;
      ppDetailBand1: TppDetailBand;
      ppLine4: TppLine;
      ppShape3: TppShape;
      ppDBText1: TppDBText;
      ppDBText3: TppDBText;
      ppDBText4: TppDBText;
      ppDBText7: TppDBText;
      ppDBText8: TppDBText;
      ppDBText10: TppDBText;
      ppDBText12: TppDBText;
      ppDBText2: TppDBText;
      ppDBText5: TppDBText;
      ppDBText9: TppDBText;
      ppFooterBand1: TppFooterBand;
      ppLine2: TppLine;
      ppLabel3: TppLabel;
      ppSystemVariable1: TppSystemVariable;
      ppSystemVariable2: TppSystemVariable;
      ppSummaryBand1: TppSummaryBand;
      ppLine5: TppLine;
      ppLabel19: TppLabel;
      ppShape2: TppShape;
      ppDBCalc7: TppDBCalc;
      ppDBCalc8: TppDBCalc;
      ppDBCalc10: TppDBCalc;
      ppDBCalc11: TppDBCalc;
      ppDBCalc12: TppDBCalc;
      ppDBCalc13: TppDBCalc;
      ppShape6: TppShape;
      ppLabel16: TppLabel;
      ppDBCalc14: TppDBCalc;
      ppGroup3: TppGroup;
      ppGroupHeaderBand3: TppGroupHeaderBand;
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
      ppLabel4: TppLabel;
      ppLabel5: TppLabel;
      ppLabel11: TppLabel;
      ppLine3: TppLine;
      ppLine1: TppLine;
      ppLabel18: TppLabel;
      ppGroupFooterBand3: TppGroupFooterBand;
      ppShape5: TppShape;
      ppShape4: TppShape;
      ppLine7: TppLine;
      ppDBCalc1: TppDBCalc;
      ppDBCalc2: TppDBCalc;
      ppDBCalc3: TppDBCalc;
      ppDBCalc4: TppDBCalc;
      ppDBCalc5: TppDBCalc;
      ppDBCalc6: TppDBCalc;
      ppLabel7: TppLabel;
      ppLabel17: TppLabel;
      ppDBCalc9: TppDBCalc;
      qryConfereEnvioContratoIDCONTRATOEMPTMO: TFloatField;
      qryConfereEnvioContratoIDPATRO: TFloatField;
      qryConfereEnvioContratoPATRO: TStringField;
      qryConfereEnvioContratoIDPLANOPREV: TFloatField;
      qryConfereEnvioContratoPLANO: TStringField;
      qryConfereEnvioContratoNOME: TStringField;
      qryConfereEnvioContratoMATRICULA: TStringField;
      qryConfereEnvioContratoTCEDESCRICAO: TStringField;
      qryConfereEnvioContratoVLR_PREVISTO_BENEF: TFloatField;
      qryConfereEnvioContratoVLR_EFETIVO_BENEF: TFloatField;
      qryConfereEnvioContratoVLR_PREVISTO_PATRO: TFloatField;
      qryConfereEnvioContratoVLR_EFETIVO_PATRO: TFloatField;
      qryConfereEnvioContratoVLR_PREVISTO_TMP: TFloatField;
      qryConfereEnvioContratoVLR_VLREFETIVO_TMP: TFloatField;
      ppDBText11: TppDBText;
      ppDBText13: TppDBText;
      ppLabel13: TppLabel;
      ppLabel22: TppLabel;
      ppLine9: TppLine;
      ppLabel23: TppLabel;
      ppDBCalc15: TppDBCalc;
      ppDBCalc16: TppDBCalc;
      ppDBCalc17: TppDBCalc;
      ppDBCalc18: TppDBCalc;
      ppDBText14: TppDBText;
      ppLabel24: TppLabel;
      qryConfereEnvioContratoVLR_PREVISTO_DIF: TFloatField;
      qryConfereEnvioContratoVLR_EFETIVO_DIF: TFloatField;
    ppLabel25: TppLabel;
    ppLabel26: TppLabel;
    ppMemo2: TppMemo;
    memPatro: TppRichText;
    memPlano: TppRichText;
    ppMemo1: TppMemo;
    ppLabel56: TppLabel;
    ppLabel57: TppLabel;
    lblTipoEmptmo: TppLabel;
    lblTipoContr: TppLabel;

      procedure ppHeaderBand1BeforePrint(Sender: TObject);
      procedure ppLine4Print(Sender: TObject);
      procedure ppShape3Print(Sender: TObject);
    procedure qryConfereEnvioContratoBeforeOpen(DataSet: TDataSet);

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

      bSeparador  : Boolean;
      CorLinha    : TColor;
      CorAtual    : TColor;
      bCorLinha   : Boolean;

      function MostraParam(Form: string): boolean; override;

   end;



var
  dtmRelConfereEnvioContrato: TdtmRelConfereEnvioContrato;


implementation
{$R *.DFM}
uses
   uSistema, uFuncoesEmptmo, cRelConfereEnvioContrato;



function TdtmRelConfereEnvioContrato.MostraParam(Form: string): boolean;
var
   frm : TForm;
begin
   // criação dos forms de configuração de Relatórios

   // Prestação de Contas --------------------------------------------------------------------------------------
   if (LowerCase(Form) = 'cfgrelconfereenviocontrato') then
   begin
      frm := TcfgRelConfereEnvioContrato.Create(Application);
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



procedure TdtmRelConfereEnvioContrato.ppHeaderBand1BeforePrint(Sender: TObject);
begin
   inherited;
   CorAtual := clWhite;
end;



procedure TdtmRelConfereEnvioContrato.ppLine4Print(Sender: TObject);
begin
   inherited;
   (Sender as TppLine).Visible := bSeparador;
end;



procedure TdtmRelConfereEnvioContrato.ppShape3Print(Sender: TObject);
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



procedure TdtmRelConfereEnvioContrato.qryConfereEnvioContratoBeforeOpen(DataSet: TDataSet);
begin
   inherited;
 //Jéssica Lana SOL 114575 Kintana 535771 24/04/2009
 //qryConfereEnvioContrato.SQL.SaveToFile(Sistema.TempDir + 'EP-RelConfereEnvioContrato.txt');
   qryConfereEnvioContrato.SQL.SaveToFile(ftempregra + '\' + 'EP-RelConfereEnvioContrato.txt');
   Application.ProcessMessages;
end;



end.
