unit dRelConfereEnvioFolhaAnal;

interface

uses
   Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
   dReports, ppVar, ppBands, ppCtrls, ppPrnabl, ppClass, ppCache, ppProd,
   ppReport, Db, DBTables, Wwquery, Wwdatsrc, ppComm, ppRelatv, ppDB,
   ppDBPipe, ppDBBDE;

type
   TdtmRelConfereEnvioFolhaAnal = class(TdtmReports)
    pplConfereEnvioFolhaAnal: TppBDEPipeline;
    dsConfereEnvioFolhaAnal: TwwDataSource;
    qryConfereEnvioFolhaAnal: TwwQuery;
    rptConfereEnvioFolhaAnal: TppReport;
      ppHeaderBand1: TppHeaderBand;
      ppLabel1: TppLabel;
      ppLabel2: TppLabel;
      ppDetailBand1: TppDetailBand;
      ppFooterBand1: TppFooterBand;
      ppLine2: TppLine;
      ppLabel3: TppLabel;
      ppSystemVariable1: TppSystemVariable;
      ppSystemVariable2: TppSystemVariable;
      ppShape1: TppShape;
      ppGroup1: TppGroup;
      ppGroupHeaderBand1: TppGroupHeaderBand;
      ppGroupFooterBand1: TppGroupFooterBand;
      ppLine3: TppLine;
      ppLabel7: TppLabel;
      ppSummaryBand1: TppSummaryBand;
      ppLine5: TppLine;
      ppLabel122: TppLabel;
      rptContratosAdminAnal_lblAdministradora: TppLabel;
      rptContratosAdminAnalShape1: TppShape;
      ppShape2: TppShape;
      ppDBText11: TppDBText;
      ppDBText13: TppDBText;
      ppDBText5: TppDBText;
      ppLabel4: TppLabel;
      ppDBCalc3: TppDBCalc;
      ppDBCalc10: TppDBCalc;
      ppDBText3: TppDBText;
      ppDBCalc25: TppDBCalc;
      ppDBCalc31: TppDBCalc;
      ppLine7: TppLine;
      ppLabel6: TppLabel;
      ppLabel12: TppLabel;
    ppLine1: TppLine;
    ppShape3: TppShape;
    qryConfereEnvioFolhaAnalIDCONTRATOEMPTMO: TFloatField;
    qryConfereEnvioFolhaAnalMATRICULA: TStringField;
    qryConfereEnvioFolhaAnalNOME: TStringField;
    qryConfereEnvioFolhaAnalIDRUBRICA: TFloatField;
    qryConfereEnvioFolhaAnalITEDESCRICAO: TStringField;
    qryConfereEnvioFolhaAnalHMEVLRPREVISTO: TFloatField;
    qryConfereEnvioFolhaAnalVALOR: TFloatField;
    ppDBText1: TppDBText;
    ppDBText2: TppDBText;
    ppLabel5: TppLabel;
    ppLabel8: TppLabel;
    ppLabel9: TppLabel;
    procedure ppLine1Print(Sender: TObject);
    procedure ppShape3Print(Sender: TObject);
    procedure rptContratosAdminAnal_lblAdministradoraPrint(
      Sender: TObject);

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

      sCompetencia   : String;
      bSeparador     : Boolean;
      CorLinha       : TColor;
      CorAtual       : TColor;
      bCorLinha      : Boolean;

      function MostraParam(Form: string): boolean; override;

  end;



var
  dtmRelConfereEnvioFolhaAnal: TdtmRelConfereEnvioFolhaAnal;



implementation
{$R *.DFM}
uses
   UFuncoesEmptmo, cRelConfereEnvioFolhaAnal;



function TdtmRelConfereEnvioFolhaAnal.MostraParam(Form: string): boolean;
var
   frm : TForm;
begin
   // criação dos forms de configuração de Relatórios

   if (LowerCase(Form) = 'cfgrelconfereenviofolhaanal') then begin
      frm := TcfgRelConfereEnvioFolhaAnal.Create(Application);
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



procedure TdtmRelConfereEnvioFolhaAnal.ppLine1Print(Sender: TObject);
begin
   inherited;
   (Sender as TppLine).Visible := bSeparador;
end;



procedure TdtmRelConfereEnvioFolhaAnal.ppShape3Print(Sender: TObject);
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



procedure TdtmRelConfereEnvioFolhaAnal.rptContratosAdminAnal_lblAdministradoraPrint(
  Sender: TObject);
begin
  inherited;
   rptContratosAdminAnal_lblAdministradora.Caption := sCompetencia;
end;

end.


