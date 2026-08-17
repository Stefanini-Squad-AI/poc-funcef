unit dRelResumoContratoCaixa;

interface

uses
   Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
   dReports, ppVar, ppBands, ppCtrls, ppPrnabl, ppClass, ppCache, ppProd,
   ppReport, Db, DBTables, Wwquery, Wwdatsrc, ppComm, ppRelatv, ppDB,
   ppDBPipe, ppDBBDE, ppMemo, ppStrtch, ppRichTx;

type
   TdtmRelResumoContratoCaixa = class(TdtmReports)
      pplResumoContratoCaixa: TppBDEPipeline;
      dsResumoContratoCaixa: TwwDataSource;
      rptResumoContratoCaixa: TppReport;
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
      ppLine4: TppLine;
      ppShape3: TppShape;
      qryResumoContratoCaixa: TwwQuery;
      ppGroup2: TppGroup;
      ppGroupHeaderBand2: TppGroupHeaderBand;
      ppGroupFooterBand2: TppGroupFooterBand;
      ppShape4: TppShape;
      ppDBCalc9: TppDBCalc;
      ppDBCalc18: TppDBCalc;
      ppDBCalc20: TppDBCalc;
      ppDBCalc21: TppDBCalc;
      ppDBCalc24: TppDBCalc;
      ppDBCalc25: TppDBCalc;
      ppDBCalc38: TppDBCalc;
      ppDBCalc42: TppDBCalc;
      ppDBCalc44: TppDBCalc;
      ppDBCalc46: TppDBCalc;
      ppLine7: TppLine;
      ppLabel27: TppLabel;
      ppDBText6: TppDBText;
      ppDBText9: TppDBText;
      ppDBText13: TppDBText;
      ppLabel28: TppLabel;
      ppLabel29: TppLabel;
      ppLabel30: TppLabel;
      ppShape5: TppShape;
      upd: TUpdateSQL;
      ppDBText21: TppDBText;
      ppDBText5: TppDBText;
      ppDBText10: TppDBText;
      ppDBText7: TppDBText;
      ppDBText8: TppDBText;
      ppDBText12: TppDBText;
      ppDBText19: TppDBText;
      ppDBText27: TppDBText;
      ppDBText25: TppDBText;
      ppDBText4: TppDBText;
    qryResumoContratoCaixaIDCONTRATOEMPTMO: TFloatField;
    qryResumoContratoCaixaNOME: TStringField;
    qryResumoContratoCaixaMATRICULA: TStringField;
    qryResumoContratoCaixaINSCRICAONUMERO: TFloatField;
    qryResumoContratoCaixaDESCTIPOEMPTMO: TStringField;
    qryResumoContratoCaixaTCEDESCRICAO: TStringField;
    qryResumoContratoCaixaNOME_PLANO: TStringField;
    qryResumoContratoCaixaNOME_PATRO: TStringField;
    qryResumoContratoCaixaSITDESCRICAO: TStringField;
    qryResumoContratoCaixaSALDO_ANT: TFloatField;
    qryResumoContratoCaixaCONCESSOES: TFloatField;
    qryResumoContratoCaixaPARCELAS: TFloatField;
    qryResumoContratoCaixaENCARGOS: TFloatField;
    qryResumoContratoCaixaAMORTIZACAO: TFloatField;
    qryResumoContratoCaixaQUITACAO: TFloatField;
    qryResumoContratoCaixaAJUSTES: TFloatField;
    qryResumoContratoCaixaREC_PARC: TFloatField;
    qryResumoContratoCaixaREC_ENC: TFloatField;
    qryResumoContratoCaixaREC_AMORT: TFloatField;
    qryResumoContratoCaixaREC_QUIT: TFloatField;
    qryResumoContratoCaixaSALDO_DEV: TFloatField;
    qryResumoContratoCaixaREC_AJUSTES: TFloatField;
    qryResumoContratoCaixaABONADO: TFloatField;
    qryResumoContratoCaixaQUITADO: TFloatField;
    ppGroup3: TppGroup;
    ppGroupHeaderBand3: TppGroupHeaderBand;
    ppGroupFooterBand3: TppGroupFooterBand;
    ppGroup4: TppGroup;
    ppGroupHeaderBand4: TppGroupHeaderBand;
    ppGroupFooterBand4: TppGroupFooterBand;
    ppDBText3: TppDBText;
    ppDBText11: TppDBText;
    ppDBText14: TppDBText;
    ppDBCalc1: TppDBCalc;
    ppDBText15: TppDBText;
    ppDBCalc2: TppDBCalc;
    ppLabel13: TppLabel;
    ppLabel122: TppLabel;
    memPlano: TppRichText;
    ppLabel53: TppLabel;
    ppLabel54: TppLabel;
    ppMemo2: TppMemo;
    memPatro: TppRichText;
    ppMemo1: TppMemo;
    ppLabel56: TppLabel;
    ppLabel57: TppLabel;
    lblTipoEmptmo: TppLabel;
    lblTipoContr: TppLabel;
    ppLabel9: TppLabel;
    ppLabel4: TppLabel;
    ppLabel15: TppLabel;
    ppLabel16: TppLabel;
    ppLabel17: TppLabel;
    ppLabel12: TppLabel;
    ppLabel20: TppLabel;
    ppLine6: TppLine;
    ppLabel23: TppLabel;
    ppLabel10: TppLabel;
    ppLabel25: TppLabel;
    ppLabel6: TppLabel;
    ppLabel5: TppLabel;
    ppLabel7: TppLabel;
    ppLabel8: TppLabel;
    ppLabel18: TppLabel;
    ppLabel24: TppLabel;
    ppLabel11: TppLabel;
    ppDBText2: TppDBText;
    ppDBText16: TppDBText;
    ppLabel14: TppLabel;
    ppDBCalc3: TppDBCalc;
    ppDBCalc4: TppDBCalc;
    ppLabel19: TppLabel;
    lblApropriado: TppLabel;
    lblAbonoContab: TppLabel;
    lblRenovacao: TppLabel;
    ppDBCalc5: TppDBCalc;
    ppLabel21: TppLabel;
    lblEmAberto: TppLabel;

      procedure ppLine4Print(Sender: TObject);
      procedure ppShape3Print(Sender: TObject);
      procedure ppLabel13Print(Sender: TObject);
      procedure ppShape1Print(Sender: TObject);
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

      sMesCompetencia   : String;
      bSeparador        : Boolean;
      CorLinha          : TColor;
      CorAtual          : TColor;
      bCorLinha         : Boolean;

      bSintetico        : Boolean;

      function MostraParam(Form: string): boolean; override;

   end;



var
  dtmRelResumoContratoCaixa: TdtmRelResumoContratoCaixa;



implementation
{$R *.DFM}
uses
   UFuncoesEmptmo, uSistema, cRelResumoContratoCaixa;




function TdtmRelResumoContratoCaixa.MostraParam(Form: string): boolean;
var
   frm : TForm;
begin
   // criação dos forms de configuração de Relatórios

   // Prestação de Contas --------------------------------------------------------------------------------------
   if (LowerCase(Form) = 'cfgrelresumocontratocaixa') then begin
      frm := TcfgRelResumoContratoCaixa.Create(Application);
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



procedure TdtmRelResumoContratoCaixa.ppLine4Print(Sender: TObject);
begin
   inherited;
   (Sender as TppLine).Visible := bSeparador;
end;



procedure TdtmRelResumoContratoCaixa.ppShape3Print(Sender: TObject);
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



procedure TdtmRelResumoContratoCaixa.ppLabel13Print(Sender: TObject);
begin
   inherited;
   TppLabel(Sender).Caption := sMesCompetencia;
end;



procedure TdtmRelResumoContratoCaixa.ppShape1Print(Sender: TObject);
begin
   inherited;
   (Sender as TppShape).Brush.Color := clSilver;
end;



procedure TdtmRelResumoContratoCaixa.ppDetailBand1BeforePrint(Sender: TObject);
begin
   inherited;
   (Sender as TppDetailBand).Visible := not(bSintetico);
end;



end.
