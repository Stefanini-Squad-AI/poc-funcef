{--------------------------------------------------------------------------------
  Desenvolvedor: Monica Gonzaga
  SOL / Kintana: 203289 / 1966419
  Alteração....: Alteração apenas no .dfm
--------------------------------------------------------------------------------  }
unit dRelHistXTmpDesc;

interface

uses
   Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
   dReports, Provider, DBClient, ppDB, ADODB, Db, ppCtrls, uCmRptManager,
   TXComp, CmParamReport, ppVar, ppBands, ppPrnabl, ppClass, ppCache,
   ppProd, ppReport, DBTables, Wwquery, Wwdatsrc, ppComm, ppRelatv,
   ppDBPipe, ppDBBDE, TXRb;

type
   TdtmRelHistXTmpDesc = class(TdtmReports)
      CmpRptCM: TCmParamReport;
      DevRptCM: TExtraOptions;
      CrmRptCM: TCmRptManager;
    rptDivergencia: TppReport;
      ppHeaderBand24: TppHeaderBand;
      ppShape1: TppShape;
      LblTiTAdianto: TppLabel;
      ppLabel1: TppLabel;
      ppLabel97: TppLabel;
      ppLabel98: TppLabel;
      ppLabel105: TppLabel;
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
    DsDivergencia: TwwDataSource;
      AdoQryInscPend: TADOQuery;
    PplDivergencia: TppDBPipeline;
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
    CdsInscPendPENDENTE: TStringField;
    qryDivergencia: TwwQuery;
    qryDivergenciaERRO: TStringField;
    qryDivergenciaREFERENCIA: TStringField;
    qryDivergenciaCONTRATO: TFloatField;
    qryDivergenciaCOBRANCA: TStringField;
    qryDivergenciaRUBRICA: TFloatField;
    qryDivergenciaVALOR: TFloatField;
    updDivergencia: TUpdateSQL;
    ppLabel2: TppLabel;
    ppLabel4: TppLabel;
    ppDBText1: TppDBText;
    ppDBText3: TppDBText;
    ppShape3: TppShape;
    ppLabel5: TppLabel;
    ppDBCalc1: TppDBCalc;
    ppSummaryBand1: TppSummaryBand;

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
  dtmRelHistXTmpDesc: TdtmRelHistXTmpDesc;



implementation
{$R *.DFM}
uses
   CRelHistXTmpDesc;



function TdtmRelHistXTmpDesc.MostraParam(Form: string): boolean;
var
   frm : TForm;
begin
   if (LowerCase(Form) = 'cfgrelhistxtmpdesc') then begin
      frm := TcfgRelHistXTmpDesc.Create(Application);
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



procedure TdtmRelHistXTmpDesc.ppLine1Print(Sender: TObject);
begin
   inherited;
   (Sender as TppLine).Visible := bSeparador;
end;



procedure TdtmRelHistXTmpDesc.ppShape2Print(Sender: TObject);
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
