 unit dRelContratoDuplicidade;

interface

uses
   Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
   dReports, ppBands, ppPrnabl, ppClass, ppCtrls, ppCache, ppProd, ppReport,
   Db, DBTables, Wwquery, Wwdatsrc, ppComm, ppRelatv, ppDB, ppDBPipe,
   ppDBBDE, ppVar, ppStrtch, ppRichTx;

type
   TdtmRelContratoDuplicidade = class(TdtmReports)
      qryContratoDuplicidade: TwwQuery;
      pplContratoDuplicidade: TppBDEPipeline;
      dtsContratoDuplicidade: TwwDataSource;
      rptContratoDuplicidade: TppReport;
      ppHeaderBand1: TppHeaderBand;
      ppLabel1: TppLabel;
      ppLabel2: TppLabel;
      ppDetailBand1: TppDetailBand;
      ppFooterBand1: TppFooterBand;
      ppLine2: TppLine;
      ppLabel3: TppLabel;
      ppSystemVariable1: TppSystemVariable;
      ppSystemVariable2: TppSystemVariable;
      ppLabel122: TppLabel;
    rptContratoDuplicidade_lblDataIni: TppLabel;
    rptContratoDuplicidade_lblDataFim: TppLabel;
      ppLabel13: TppLabel;
      ppLine1: TppLine;
      ppShape1: TppShape;
      ppDBText2: TppDBText;
      ppDBText12: TppDBText;
      ppDBText10: TppDBText;
      qryContratoDuplicidadeIDCONTRATOEMPTMO: TFloatField;
      qryContratoDuplicidadeMATRICULA: TStringField;
      qryContratoDuplicidadeFLGSITUACAO: TStringField;
      qryContratoDuplicidadeNOME: TStringField;
      qryContratoDuplicidadeDATACREDITO: TDateTimeField;
      qryContratoDuplicidadePAGO: TStringField;
      qryContratoDuplicidadeENVIADO: TStringField;
      qryContratoDuplicidadeHMEDATAVENCTO: TDateTimeField;
      qryContratoDuplicidadeHMEVLRPREVISTO: TFloatField;
      ppGroup5: TppGroup;
      ppGroupHeaderBand5: TppGroupHeaderBand;
      ppGroupFooterBand5: TppGroupFooterBand;
      ppDBText1: TppDBText;
      ppDBText9: TppDBText;
      ppDBText3: TppDBText;
      ppDBText4: TppDBText;
      ppDBText5: TppDBText;
      ppDBText6: TppDBText;
      ppLabel4: TppLabel;
      ppLabel5: TppLabel;
      ppLabel6: TppLabel;
      ppLabel7: TppLabel;
      ppLabel8: TppLabel;
      ppLabel9: TppLabel;
      ppLabel10: TppLabel;
      ppLabel11: TppLabel;
      ppLabel12: TppLabel;
    ppLine3: TppLine;
    ppLine4: TppLine;
    ppLabel22: TppLabel;
    ppLabel23: TppLabel;
    memPatro: TppRichText;
    memPlano: TppRichText;
    ppLabel56: TppLabel;
    ppLabel57: TppLabel;
    lblTipoEmptmo: TppLabel;
    lblTipoContr: TppLabel;

      procedure ppLine1Print(Sender: TObject);
      procedure ppShape1Print(Sender: TObject);
      procedure ppGroupHeaderBand2BeforePrint(Sender: TObject);


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
      bSintetico  : Boolean;

      function MostraParam(Form: string): boolean; override;

   end;



var
  dtmRelContratoDuplicidade: TdtmRelContratoDuplicidade;



implementation
{$R *.DFM}
uses
   CRelContratoDuplicidade, USistema;



function TdtmRelContratoDuplicidade.MostraParam(Form: string): boolean;
var
   frm : TForm;
begin
   // criação dos forms de configuração de Relatórios

   // Prestação de Contas --------------------------------------------------------------------------------------
   if (LowerCase(Form) = 'cfgrelcontratoduplicidade') then begin
      frm := TcfgRelContratoDuplicidade.Create(Application);
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



procedure TdtmRelContratoDuplicidade.ppLine1Print(Sender: TObject);
begin
   inherited;
   (Sender as TppLine).Visible := bSeparador;
end;



procedure TdtmRelContratoDuplicidade.ppShape1Print(Sender: TObject);
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



procedure TdtmRelContratoDuplicidade.ppGroupHeaderBand2BeforePrint(Sender: TObject);
begin
   inherited;
   CorAtual := clWhite;
end;



end.
