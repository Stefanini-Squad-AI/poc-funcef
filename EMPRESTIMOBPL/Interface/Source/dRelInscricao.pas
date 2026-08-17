unit dRelInscricao;
//------------------------------------------------------------------------------
//Alteração:
// Autor(a)    :  Jéssica Lana
// Data        :  26/02/2009
// Pendência   :  SOL 109421 KINTANA 496332
// Descricao   :  Alteração de gravação de arquivos de log na raiz do disco C:
//------------------------------------------------------------------------------

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  dReports, ppVar, ppBands, ppCtrls, ppPrnabl, ppClass, ppCache, ppProd,
  ppReport, Db, DBTables, Wwquery, Wwdatsrc, ppComm, ppRelatv, ppDB,
  ppDBPipe, ppDBBDE, ppRichTx, ppStrtch, ppRegion, Usistema;

type
  TdtmRelInscricao = class(TdtmReports)
    pplInscricao: TppBDEPipeline;
    dsInscricao: TwwDataSource;
    qryInscricao: TwwQuery;
    rptInscricao: TppReport;
    updInscricao: TUpdateSQL;
    qryInscricaoDEVEDOR: TStringField;
    qryInscricaoPATRO: TStringField;
    qryInscricaoMATRICULA: TStringField;
    qryInscricaoDATASOLIC: TDateTimeField;
    qryInscricaoDATACREDITO: TDateTimeField;
    qryInscricaoTAXAJUROS: TFloatField;
    qryInscricaoVALORSOLIC: TFloatField;
    qryInscricaoSALDOEPANTERIOR: TFloatField;
    qryInscricaoVALORLIQUIDO: TFloatField;
    qryInscricaoNUMPARCELAS: TFloatField;
    qryInscricaoVALORPARCELA: TFloatField;
    qryInscricaoIDINSCRICAOEMPTMO: TFloatField;
    qryInscricaoENDERECO: TStringField;
    qryInscricaoBAIRRO: TStringField;
    qryInscricaoCIDADE: TStringField;
    qryInscricaoESTADO: TStringField;
    qryInscricaoCEP: TStringField;
    qryInscricaoCPF: TStringField;
    qryInscricaoBANCO: TStringField;
    qryInscricaoNUMAGENCIA: TStringField;
    qryInscricaoCONTA: TStringField;
    qryInscricaoTIPOCONTA: TStringField;
    qryInscricaoDATAPRIMPARC: TDateTimeField;
    qryInscricaoITEM: TStringField;
    qryInscricaoVLR_ITEM: TFloatField;
    qryInscricaoINSCRICAONUMERO: TFloatField;
    qryInscricaoSIT_PART: TStringField;
    ppHeaderBand1: TppHeaderBand;
    ppDBText17: TppDBText;
    ppDBText18: TppDBText;
    ppDBText19: TppDBText;
    ppDBText20: TppDBText;
    ppDBText21: TppDBText;
    ppLine23: TppLine;
    ppLine11: TppLine;
    ppDBText9: TppDBText;
    ppDetailBand1: TppDetailBand;
    ppRegion8: TppRegion;
    ppDBText23: TppDBText;
    ppDBText30: TppDBText;
    ppRegion9: TppRegion;
    ppLabel14: TppLabel;
    ppFooterBand1: TppFooterBand;
    ppSummaryBand1: TppSummaryBand;
    ppLine22: TppLine;
    ppLine1: TppLine;
    ppGroup1: TppGroup;
    ppGroupHeaderBand1: TppGroupHeaderBand;
    ppLabel2: TppLabel;
    ppRegion1: TppRegion;
    ppLabel1: TppLabel;
    ppLabel37: TppLabel;
    ppDBText28: TppDBText;
    ppRegion2: TppRegion;
    ppLabel4: TppLabel;
    ppLine2: TppLine;
    ppLabel6: TppLabel;
    ppLine3: TppLine;
    ppLine4: TppLine;
    ppLabel5: TppLabel;
    ppLine5: TppLine;
    ppLabel7: TppLabel;
    ppLine6: TppLine;
    ppLine7: TppLine;
    ppLabel8: TppLabel;
    ppLabel9: TppLabel;
    ppLabel34: TppLabel;
    ppLabel33: TppLabel;
    ppLabel3: TppLabel;
    ppDBText1: TppDBText;
    ppDBText2: TppDBText;
    ppDBText3: TppDBText;
    ppDBText4: TppDBText;
    ppDBText5: TppDBText;
    ppDBText6: TppDBText;
    ppDBText7: TppDBText;
    ppDBText8: TppDBText;
    ppDBText16: TppDBText;
    ppDBText15: TppDBText;
    ppRegion4: TppRegion;
    ppLabel10: TppLabel;
    ppRegion3: TppRegion;
    ppLine8: TppLine;
    ppLabel11: TppLabel;
    ppLabel12: TppLabel;
    ppLabel17: TppLabel;
    ppLabel18: TppLabel;
    ppLabel38: TppLabel;
    ppDBText10: TppDBText;
    ppDBText11: TppDBText;
    ppDBText12: TppDBText;
    ppDBText13: TppDBText;
    ppDBText14: TppDBText;
    ppLabel15: TppLabel;
    ppDBText27: TppDBText;
    ppLine9: TppLine;
    ppLine10: TppLine;
    ppLine12: TppLine;
    ppLine13: TppLine;
    ppGroupFooterBand1: TppGroupFooterBand;
    ppRegion7: TppRegion;
    ppLabel22: TppLabel;
    ppLine17: TppLine;
    ppLine20: TppLine;
    ppLabel24: TppLabel;
    ppLabel25: TppLabel;
    ppLabel30: TppLabel;
    ppRichText2: TppRichText;
    ppRegion6: TppRegion;
    ppLabel21: TppLabel;
    ppShape1: TppShape;
    ppRegion5: TppRegion;
    ppLabel20: TppLabel;
    ppShape2: TppShape;
    ppRichText1: TppRichText;

    procedure rptDividas_lblDataRefPrint(Sender: TObject);
    procedure ppLine3Print(Sender: TObject);
    procedure ppShape3Print(Sender: TObject);
    procedure FormCreate(Sender: TObject);

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
   UFuncoesEmptmo;


function TdtmRelInscricao.MostraParam(Form: string): boolean;
var
   frm : TForm;
begin
   // criação dos forms de configuração de Relatórios

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



procedure TdtmRelInscricao.FormCreate(Sender: TObject);
begin
  inherited;
        //Jéssica Lana Nunes dos Santos SOL 109421 KINTANA 496332
        rptInscricao.Template.FileName:= Sistema.RetornaCaminhoArquivos(Sistema.IdEmpresa)+'\INSCRICAO.rtm';

end;

end.
