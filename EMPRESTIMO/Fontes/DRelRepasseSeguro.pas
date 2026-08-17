unit DRelRepasseSeguro;

interface

uses
   Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
   dReports, ppVar, ppBands, ppCtrls, ppPrnabl, ppClass, ppCache, ppProd,
   ppReport, Db, DBTables, Wwquery, Wwdatsrc, ppComm, ppRelatv, ppDB,
   ppDBPipe, ppDBBDE, ppModule, raCodMod, ppMemo, ppStrtch, ppRichTx;

type
   TdtmRelRepasseSeguro = class(TdtmReports)
      qryRepasse: TwwQuery;
      dsRepasse: TwwDataSource;
      pplRepasse: TppBDEPipeline;
      rptRepasse: TppReport;
      qryRepasseIDCONTRATOEMPTMO: TFloatField;
      qryRepasseMATRICULA: TStringField;
      qryRepasseNOME: TStringField;
      qryRepasseTCEDESCRICAO: TStringField;
      qryRepasseVLRCONTRATO: TFloatField;
      qryRepasseDATACREDITO: TDateTimeField;
      qryRepasseHMEVLRPREVISTO: TFloatField;
      qryRepasseHMEDATAPREVISTA: TDateTimeField;
      qryRepasseDATAMORTE: TDateTimeField;
      qryRepasseVLRREPASSE: TFloatField;
      qryRepasseVLRSALDOREC: TFloatField;
      qryRepasseNOME_MUTUARIO: TStringField;
      qryRepasseNUMBANCO: TFloatField;
      qryRepasseCODAGENCIA: TStringField;
      qryRepasseCONTACORRENTE: TStringField;
      qryRepasseOBS: TStringField;
      qryRepasseNIME_BENEF: TStringField;
      qryRepasseVLR_ATUALIZADO: TFloatField;
      qryRepassePERCINDENIZACAO: TFloatField;
      ppHeaderBand1: TppHeaderBand;
      ppLabel1: TppLabel;
      ppLabel2: TppLabel;
      ppDetailBand1: TppDetailBand;
      ppDBText7: TppDBText;
      ppDBText8: TppDBText;
      ppLabel19: TppLabel;
      ppDBText10: TppDBText;
      ppFooterBand1: TppFooterBand;
      ppLine2: TppLine;
      ppLabel3: TppLabel;
      ppSystemVariable1: TppSystemVariable;
      ppSystemVariable2: TppSystemVariable;
      ppGroup1: TppGroup;
      ppGroupHeaderBand1: TppGroupHeaderBand;
      ppLine4: TppLine;
      ppDBText3: TppDBText;
      ppDBText4: TppDBText;
      ppDBText5: TppDBText;
      ppDBText6: TppDBText;
      ppDBText9: TppDBText;
      ppLabel16: TppLabel;
      ppDBText11: TppDBText;
      ppDBText12: TppDBText;
      ppDBText2: TppDBText;
      ppDBText1: TppDBText;
      ppLabel20: TppLabel;
      ppDBText13: TppDBText;
      ppLabel13: TppLabel;
      ppLabel6: TppLabel;
      ppLabel7: TppLabel;
      ppLabel21: TppLabel;
      ppLabel5: TppLabel;
      ppLabel4: TppLabel;
      ppLabel8: TppLabel;
      ppLabel12: TppLabel;
      ppLabel10: TppLabel;
      ppLabel14: TppLabel;
      ppGroupFooterBand1: TppGroupFooterBand;
      ppDBCalc1: TppDBCalc;
      ppLine1: TppLine;
      ppLine3: TppLine;
    ppShape1: TppShape;
    ppShape2: TppShape;
    ppLabel56: TppLabel;
    ppLabel57: TppLabel;
    lblTipoEmptmo: TppLabel;
    lblTipoContr: TppLabel;
    ppLabel22: TppLabel;
    ppLabel23: TppLabel;
    memPatro: TppRichText;
    memPlano: TppRichText;
    ppMemo2: TppMemo;
    ppMemo1: TppMemo;

      procedure ppShape1Print(Sender: TObject);
      procedure FormCreate(Sender: TObject);

   private  // Private declarations }

      //    Cores:
      //    ColorA = $FFFFFF   { branco, clWhite }
      //    ColorC = $00C0FFFF { amarelo - pastel }
      //    ColorD = $00C6F9CC { verde - pastel }
      //    ColorE = $00F3E6CD { azul - pastel }
      //    ColorF = $00A0A0A0
      //    ColorG = $00BEBEBE
      //    ColorH = $00D2D2D2
      //    ColorI = $00E3E3E3

   public   // Public declarations

      bSeparador        : Boolean;
      CorLinha          : TColor;
      CorAtual          : TColor;
      bCorLinha         : Boolean;

      function MostraParam(Form: string): boolean; override;

  end;



var
  dtmRelRepasseSeguro: TdtmRelRepasseSeguro;



implementation
{$R *.DFM}
uses
   cRelRepasseSeguro;



function TdtmRelRepasseSeguro.MostraParam(Form: string): boolean;
var
   frm : TForm;
begin
   // criação dos forms de configuração de Relatórios

   // Prestação de Contas --------------------------------------------------------------------------------------
   if (LowerCase(Form) = 'cfgrelrepasseseguro') then
   begin
      frm := TcfgRelRepasseSeguro.Create(Application);
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



procedure TdtmRelRepasseSeguro.ppShape1Print(Sender: TObject);
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



procedure TdtmRelRepasseSeguro.FormCreate(Sender: TObject);
begin
   inherited;

   CorLinha  := $00E3E3E3;
   bCorLinha := True;
end;



end.
