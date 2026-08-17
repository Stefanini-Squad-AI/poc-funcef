unit dRelInscPend;

interface

uses
   Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
   dReports, Provider, DBClient, ppDB, ADODB, Db, ppCtrls, uCmRptManager,
   TXComp, CmParamReport, ppVar, ppBands, ppPrnabl, ppClass, ppCache,
   ppProd, ppReport, DBTables, Wwquery, Wwdatsrc, ppComm, ppRelatv,
   ppDBPipe, ppDBBDE, TXRB, ppStrtch, ppRichTx;

type
   TdtmRelInscPend = class(TdtmReports)
      CmpRptCM: TCmParamReport;
      DevRptCM: TExtraOptions;
      CrmRptCM: TCmRptManager;
      rptInscPend: TppReport;
      ppHeaderBand24: TppHeaderBand;
      ppShape1: TppShape;
      LblTiTAdianto: TppLabel;
      ppLabel1: TppLabel;
      ppLabel97: TppLabel;
      ppLabel98: TppLabel;
      ppLabel105: TppLabel;
      ppLabel106: TppLabel;
      ppLabel107: TppLabel;
      ppDetalhe: TppDetailBand;
      ppDBNumContrato: TppDBText;
      ppDBText2: TppDBText;
      ppDBText4: TppDBText;
      ppDBText5: TppDBText;
      ppFooterBand24: TppFooterBand;
      ppCalc43: TppSystemVariable;
      ppLine45: TppLine;
      ppLabel3: TppLabel;
      ppCalc44: TppSystemVariable;
      DsInscPend: TwwDataSource;
    qryInscPend: TwwQuery;
    qryInscPendDATAINSC: TDateTimeField;
    qryInscPendIDINSCRICAOEMPTMO: TFloatField;
    qryInscPendNOME: TStringField;
    qryInscPendTCEDESCRICAO: TStringField;
    qryInscPendVLRSOLIC: TFloatField;
    qryInscPendNUMPARCELAS: TFloatField;
      AdoQryInscPend: TADOQuery;
      PplInscPend: TppDBPipeline;
      CdsInscPend: TClientDataSet;
      CdsInscPendDATAINSC: TDateTimeField;
      CdsInscPendIDINSCRICAOEMPTMO: TFloatField;
      CdsInscPendNOME: TStringField;
      CdsInscPendTCEDESCRICAO: TStringField;
      CdsInscPendVLRSOLIC: TFloatField;
      CdsInscPendNUMPARCELAS: TFloatField;
      DspInscPend: TDataSetProvider;
      ppShape2: TppShape;
      ppLine1: TppLine;
      ppLine2: TppLine;
      ppDBText1: TppDBText;
    qryInscPendPENDENTE: TStringField;
    ppDBText3: TppDBText;
    CdsInscPendPENDENTE: TStringField;
    ppLabel22: TppLabel;
    ppLabel23: TppLabel;
    memPatro: TppRichText;
    memPlano: TppRichText;
    ppLabel56: TppLabel;
    ppLabel57: TppLabel;
    lblTipoEmptmo: TppLabel;
    lblTipoContr: TppLabel;

      procedure ppLine1Print(Sender: TObject);
      procedure ppShape2Print(Sender: TObject);


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

      bSeparador  : Boolean;
      CorLinha    : TColor;
      CorAtual    : TColor;
      bCorLinha   : Boolean;

      function MostraParam(Form: string): boolean; override;

  end;



var
  dtmRelInscPend: TdtmRelInscPend;



implementation
{$R *.DFM}
uses
   CRelInscPend;



function TdtmRelInscPend.MostraParam(Form: string): boolean;
var
   frm : TForm;
begin
   if (LowerCase(Form) = 'cfgrelinscpend') then begin
      frm := TcfgRelInscPend.Create(Application);
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



procedure TdtmRelInscPend.ppLine1Print(Sender: TObject);
begin
   inherited;
   (Sender as TppLine).Visible := bSeparador;
end;



procedure TdtmRelInscPend.ppShape2Print(Sender: TObject);
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



end.
