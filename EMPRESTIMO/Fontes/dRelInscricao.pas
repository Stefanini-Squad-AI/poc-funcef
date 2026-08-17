unit dRelInscricao;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  dReports, ppVar, ppBands, ppCtrls, ppPrnabl, ppClass, ppCache, ppProd,
  ppReport, Db, DBTables, Wwquery, Wwdatsrc, ppComm, ppRelatv, ppDB,
  ppDBPipe, ppDBBDE;

type
  TdtmRelInscricao = class(TdtmReports)
    pplInscricao: TppBDEPipeline;
    dsInscricao: TwwDataSource;
    qryInscricao: TwwQuery;
    rptInscricao: TppReport;
    ppHeaderBand1: TppHeaderBand;
    ppLabel2: TppLabel;
    ppDetailBand1: TppDetailBand;
    ppFooterBand1: TppFooterBand;
    ppSummaryBand1: TppSummaryBand;
    ppGroup1: TppGroup;
    ppGroupHeaderBand1: TppGroupHeaderBand;
    ppGroupFooterBand1: TppGroupFooterBand;
    ppDBText8: TppDBText;
    ppLabel17: TppLabel;
    qryInscricaoDEVEDOR: TStringField;
    qryInscricaoEMPRESA: TStringField;
    qryInscricaoMATRICULA: TFloatField;
    qryInscricaoINSCRICAO: TFloatField;
    qryInscricaoSITUACAO: TStringField;
    qryInscricaoDATASOLIC: TStringField;
    qryInscricaoDATACREDITO: TStringField;
    qryInscricaoTAXAJUROS: TFloatField;
    qryInscricaoVALORSOLIC: TFloatField;
    qryInscricaoSALDOEPANTERIOR: TFloatField;
    qryInscricaoITEM: TStringField;
    qryInscricaoVALORITEM: TFloatField;
    qryInscricaoVALORLIQUIDO: TFloatField;
    qryInscricaoNUMPARCELAS: TFloatField;
    qryInscricaoVALORPARCELA: TFloatField;
    qryInscricaoIDINSCRICAOEMPTMO: TFloatField;
    ppLabel1: TppLabel;
    ppLabel4: TppLabel;
    ppLabel5: TppLabel;
    ppShape1: TppShape;
    ppLabel3: TppLabel;
    ppDBText1: TppDBText;
    ppDBText2: TppDBText;
    ppDBText3: TppDBText;
    ppDBText4: TppDBText;
    ppDBText5: TppDBText;
    ppLabel6: TppLabel;
    ppLabel7: TppLabel;
    ppLabel8: TppLabel;
    ppDBText6: TppDBText;
    ppDBText7: TppDBText;
    ppDBText9: TppDBText;
    ppLabel9: TppLabel;
    ppLabel10: TppLabel;
    ppLabel11: TppLabel;
    ppLabel12: TppLabel;
    ppDBText10: TppDBText;
    ppDBText11: TppDBText;
    ppDBText12: TppDBText;
    ppDBText13: TppDBText;
    ppLabel13: TppLabel;
    ppDBText14: TppDBText;
    ppDBText15: TppDBText;
    ppLabel14: TppLabel;
    UpdateInscricao: TUpdateSQL;

    procedure rptDividas_lblDataRefPrint(Sender: TObject);
    procedure ppLine3Print(Sender: TObject);
    procedure ppShape3Print(Sender: TObject);

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

      sDataRef    : String;
      bSeparador  : Boolean;
      CorLinha    : TColor;
      CorAtual    : TColor;
      bCorLinha   : Boolean;

      function MostraParam(Form: string): boolean; override;

  end;



var
  dtmRelInscricao: TdtmRelInscricao;



implementation
{$R *.DFM}
uses
   UFuncoesEmptmo, cRelAnaliseContabil;


function TdtmRelInscricao.MostraParam(Form: string): boolean;
var
   frm : TForm;
begin
   // criação dos forms de configuração de Relatórios

   // Prestação de Contas --------------------------------------------------------------------------------------
   if (LowerCase(Form) = 'cfgrelanalisecontabil') then begin
      frm := TcfgRelAnaliseContabil.Create(Application);
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



procedure TdtmRelInscricao.rptDividas_lblDataRefPrint(Sender: TObject);
begin
   inherited;
   (Sender as TppLabel).Caption := sDataRef;
end;



procedure TdtmRelInscricao.ppLine3Print(Sender: TObject);
begin
   inherited;
   (Sender as TppLine).Visible := bSeparador;
end;



procedure TdtmRelInscricao.ppShape3Print(Sender: TObject);
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
