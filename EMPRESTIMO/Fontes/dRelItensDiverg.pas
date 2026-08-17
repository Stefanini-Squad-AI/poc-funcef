{---------------------------Alteração-------------------------------------------
Pendência   : SOL 114575 KINTANA 535771
Responsável : Jéssica Lana
Data        : 24/04/2009
Descrição   : Gravar arquivos com a query de entrada na pasta C:\PLANUS\TEMP.
-------------------------------------------------------------------------------}
unit dRelItensDiverg;

interface

uses
   Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
   dReports, Provider, DBClient, ppDB, ADODB, Db, ppCtrls, uCmRptManager,
   TXComp, CmParamReport, ppVar, ppBands, ppPrnabl, ppClass, ppCache,
   ppProd, ppReport, DBTables, Wwquery, Wwdatsrc, ppComm, ppRelatv,
   ppDBPipe, ppDBBDE, TXRb, ppRichTx, ppStrtch, ppMemo;

type
   TdtmRelItensDiverg = class(TdtmReports)
      CmpRptCM: TCmParamReport;
      DevRptCM: TExtraOptions;
      CrmRptCM: TCmRptManager;
      rptItensDiverg: TppReport;
      dtsItensDiverg: TwwDataSource;
      qryItensDiverg: TwwQuery;
      AdoQryInscPend: TADOQuery;
      pplItensDiverg: TppDBPipeline;
      CdsInscPend: TClientDataSet;
      CdsInscPendDATAINSC: TDateTimeField;
      CdsInscPendIDINSCRICAOEMPTMO: TFloatField;
      CdsInscPendNOME: TStringField;
      CdsInscPendTCEDESCRICAO: TStringField;
      CdsInscPendVLRSOLIC: TFloatField;
      CdsInscPendNUMPARCELAS: TFloatField;
      DspInscPend: TDataSetProvider;
      qryItensDivergMATRICULA: TStringField;
      qryItensDivergIDCONTRATOEMPTMO: TFloatField;
      qryItensDivergNOME: TStringField;
      qryItensDivergCOMPETENCIA: TStringField;
      qryItensDivergCOBRANCA: TStringField;
      qryItensDivergHMEVLRPREVISTO: TFloatField;
      qryItensDivergHMEVLREFETIVO: TFloatField;
      qryItensDivergHMEDATAPREVISTA: TDateTimeField;
      qryItensDivergHMEDATAEFETIVA: TDateTimeField;
      qryItensDivergDESC_EVENTO: TStringField;
      qryItensDivergITEDESCRICAO: TStringField;
      ppHeaderBand24: TppHeaderBand;
      ppShape1: TppShape;
      LblTiTAdianto: TppLabel;
      ppLabel1: TppLabel;
      ppLabel97: TppLabel;
      ppLabel98: TppLabel;
      ppLabel105: TppLabel;
      ppLabel106: TppLabel;
      ppLabel107: TppLabel;
      ppLine2: TppLine;
      ppLabel2: TppLabel;
      ppLabel4: TppLabel;
      ppLabel8: TppLabel;
      ppLabel9: TppLabel;
      ppLabel10: TppLabel;
      ppLabel11: TppLabel;
      ppLabel12: TppLabel;
      ppLabel13: TppLabel;
      ppLabel14: TppLabel;
      ppLabel15: TppLabel;
      ppLabel16: TppLabel;
      ppLabel6: TppLabel;
      ppLabel7: TppLabel;
      ppDetalhe: TppDetailBand;
      ppLine1: TppLine;
      ppShape2: TppShape;
      ppDBNumContrato: TppDBText;
      ppDBText2: TppDBText;
      ppDBText4: TppDBText;
      ppDBText5: TppDBText;
      ppDBText1: TppDBText;
      ppDBText3: TppDBText;
      ppDBText6: TppDBText;
      ppDBText7: TppDBText;
      ppDBText8: TppDBText;
      ppDBText9: TppDBText;
      ppDBText10: TppDBText;
      ppDBText11: TppDBText;
      ppDBText12: TppDBText;
      ppDBText13: TppDBText;
      ppFooterBand24: TppFooterBand;
      ppCalc43: TppSystemVariable;
      ppLine45: TppLine;
      ppLabel3: TppLabel;
      ppCalc44: TppSystemVariable;
      ppSummaryBand1: TppSummaryBand;
      ppLine3: TppLine;
      ppDBCalc1: TppDBCalc;
      ppLabel5: TppLabel;
      qryItensDivergINSCRICAONUMERO: TFloatField;
      qryItensDivergTIPO_DIVERG: TStringField;
      ppDBText14: TppDBText;
      ppLabel17: TppLabel;
      ppLabel18: TppLabel;
      ppDBText15: TppDBText;
      ppLabel19: TppLabel;
      qryItensDivergHMEPARCELA: TFloatField;
      qryItensDivergHMENUMPARCELAS: TFloatField;
      qryItensDivergHMEDATAVENCTO: TDateTimeField;
      ppDBText16: TppDBText;
      ppLabel20: TppLabel;
      ppLabel21: TppLabel;
      qryItensDivergDESCSITCONTRATO: TStringField;
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

      procedure ppLine1Print(Sender: TObject);
      procedure ppShape2Print(Sender: TObject);
      procedure qryItensDivergBeforeOpen(DataSet: TDataSet);


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

      bSeparador  : Boolean;
      CorLinha    : TColor;
      CorAtual    : TColor;
      bCorLinha   : Boolean;

      function MostraParam(Form: string): boolean; override;

  end;



var
  dtmRelItensDiverg: TdtmRelItensDiverg;



implementation
{$R *.DFM}
uses
   uSistema, CRelItensDiverg, uFuncoesEmptmo;



function TdtmRelItensDiverg.MostraParam(Form: string): boolean;
var
   frm : TForm;
begin
   if (LowerCase(Form) = 'cfgrelitensdiverg') then
   begin
      frm := TcfgRelItensDiverg.Create(Application);
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



procedure TdtmRelItensDiverg.ppLine1Print(Sender: TObject);
begin
   inherited;
   (Sender as TppLine).Visible := bSeparador;
end;



procedure TdtmRelItensDiverg.ppShape2Print(Sender: TObject);
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



procedure TdtmRelItensDiverg.qryItensDivergBeforeOpen(DataSet: TDataSet);
begin
   inherited;

   // Grava o SQL na pasta TEMP
   // Jéssica Lana SOL 114575 Kintana 535771 24/04/2009
   // qryItensDiverg.SQL.SaveToFile(Sistema.TempDir + 'EP-RelItensDiverg.txt');
      qryItensDiverg.SQL.SaveToFile(ftempregra + '\' + 'EP-RelItensDiverg.txt');
   Application.ProcessMessages;
end;



end.
