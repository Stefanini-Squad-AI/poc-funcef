unit dRelContratoSemParcela;

interface

uses
   Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
   dReports, ppVar, ppBands, ppCtrls, ppPrnabl, ppClass, ppCache, ppProd,
   ppReport, Db, DBTables, Wwquery, Wwdatsrc, ppComm, ppRelatv, ppDB,
   ppDBPipe, ppDBBDE, ppRichTx, ppStrtch, ppMemo;

type
   TdtmRelContratoSemParcela = class(TdtmReports)
      pplContratoSemParcela: TppBDEPipeline;
      dsContratoSemParcela: TwwDataSource;
      rptContratoSemParcela: TppReport;
      ppHeaderBand1: TppHeaderBand;
      ppLabel1: TppLabel;
      ppLabel2: TppLabel;
      ppDetailBand1: TppDetailBand;
      ppFooterBand1: TppFooterBand;
      ppLine2: TppLine;
      ppLabel3: TppLabel;
      ppSystemVariable1: TppSystemVariable;
      ppSystemVariable2: TppSystemVariable;
      rptContrato: TppShape;
      ppLabel122: TppLabel;
      ppLabel872: TppLabel;
      ppLine4: TppLine;
      ppDBText5: TppDBText;
      ppDBText2: TppDBText;
      ppGroup3: TppGroup;
      ppGroupHeaderBand3: TppGroupHeaderBand;
      ppGroupFooterBand3: TppGroupFooterBand;
      qryContratoSemParcela: TwwQuery;
      ppDBText13: TppDBText;
      ppShape1: TppShape;
      ppLine1: TppLine;
      ppLabel5: TppLabel;
      ppDBText1: TppDBText;
      ppDBText4: TppDBText;
      ppLabel7: TppLabel;
      ppLabel9: TppLabel;
      ppLabel11: TppLabel;
      ppDBCalc1: TppDBCalc;
      ppLabel4: TppLabel;
      ppLabel10: TppLabel;
      ppLabel12: TppLabel;
      ppLabel13: TppLabel;
      ppLabel14: TppLabel;
      ppDBText3: TppDBText;
      ppDBText6: TppDBText;
      qryContratoSemParcelaIDCONTRATOEMPTMO: TFloatField;
      qryContratoSemParcelaMATRICULA: TStringField;
      qryContratoSemParcelaNOME: TStringField;
      qryContratoSemParcelaDATACREDITO: TDateTimeField;
      qryContratoSemParcelaDATAPRIMPARC: TDateTimeField;
      qryContratoSemParcelaDATA_PARCELA_ANT: TDateTimeField;
      qryContratoSemParcelaTCEDESCRICAO: TStringField;
      qryContratoSemParcelaSIT_PART: TStringField;
      qryContratoSemParcelaIDTIPOSUSPEMPTMO: TFloatField;
      qryContratoSemParcelaDATAINICIOSUSP: TDateTimeField;
      qryContratoSemParcelaDATAFIMSUSP: TDateTimeField;
      qryContratoSemParcelaTSEDESCRICAO: TStringField;
      qryContratoSemParcelaFLG_INTERNO: TStringField;
      qryContratoSemParcelaFLGSITUACAO: TStringField;
      ppLabel6: TppLabel;
      ppLabel8: TppLabel;
      ppDBText7: TppDBText;
      ppLabel15: TppLabel;
      ppDBText8: TppDBText;
      ppLabel16: TppLabel;
      ppDBText9: TppDBText;
    ppLabel17: TppLabel;
    ppLabel18: TppLabel;
    ppLabel19: TppLabel;
    ppDBText10: TppDBText;
    ppDBText11: TppDBText;
    ppLabel20: TppLabel;
    ppLabel21: TppLabel;
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

      procedure rptContratoPrint(Sender: TObject);
      procedure ppLabel872Print(Sender: TObject);

   private { Private declarations }

      // Cores:
      //    ColorA = $FFFFFF   { branco, clWhite }
      //    ColorC = $00C0FFFF { amarelo - pastel }
      //    ColorD = $00C6F9CC { verde - pastel }
      //    ColorE = $00F3E6CD { azul - pastel }
      //    ColorF = $00A0A0A0
      //    ColorG = $00BEBEBE
      //    ColorH = $00D2D2D2
      //    ColorI = $00E3E3E3

      //             $00E8E8E8   cinza bem claro

   public { Public declarations }

      sMesCompetencia   : String;
      sAnoCompetencia   : String;
      CorLinha          : TColor;
      CorAtual          : TColor;
      bCorLinha         : Boolean;

      function MostraParam(Form: string): boolean; override;

  end;



var
  dtmRelContratoSemParcela: TdtmRelContratoSemParcela;



implementation
{$R *.DFM}
uses
   UFuncoesEmptmo, cRelContratoSemParcela;


function TdtmRelContratoSemParcela.MostraParam(Form: string): boolean;
var
   frm : TForm;
begin
   // criação dos forms de configuração de Relatórios

   if (LowerCase(Form) = 'cfgrelcontratosemparcela') then begin
      frm := TcfgRelContratoSemParcela.Create(Application);
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



procedure TdtmRelContratoSemParcela.rptContratoPrint(Sender: TObject);
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



procedure TdtmRelContratoSemParcela.ppLabel872Print(Sender: TObject);
begin
   inherited;
   (Sender as TppLabel).Caption := sMesCompetencia;
end;



end.
