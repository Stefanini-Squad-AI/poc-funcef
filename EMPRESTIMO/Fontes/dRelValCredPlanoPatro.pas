 unit dRelValCredPlanoPatro;

 // Alterações:
{
 --------------------------------------------------------------------------------------------------
Pendência   : SIG66626
Responsável : Taffarel Sevaybriker
Data        : 24/04/2018
Descrição   : Alteração para inclusão do campo perfil de investimento (.dfm)
 --------------------------------------------------------------------------------------------------
Pendência   : SOL 253185 PPM 771995
Responsável : William Moreira da Silva
Data        : 17/06/2015
Descrição   : Reestruturação da HistMovEmptmo(*Retirada dos Hint's)
 --------------------------------------------------------------------------------------------------}

interface

uses
   Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
   dReports, ppBands, ppPrnabl, ppClass, ppCtrls, ppCache, ppProd, ppReport,
   Db, DBTables, Wwquery, Wwdatsrc, ppComm, ppRelatv, ppDB, ppDBPipe,
   ppDBBDE, ppVar, ppModule, daDataModule;

type
   TdtmRelValCredPlanoPatro = class(TdtmReports)
      qryValCredPlanoPatro: TwwQuery;
      pplValCredPlanoPatro: TppBDEPipeline;
      dtsValCredPlanoPatro: TwwDataSource;
      rptValCredPlanoPatro: TppReport;
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
      rptValCred_lblDataIni: TppLabel;
      rptValCred_lblDataFim: TppLabel;
      ppLabel13: TppLabel;
      ppLabel14: TppLabel;
      rptValCred_lblFormaCred: TppLabel;
      ppGroup2: TppGroup;
      ppGroupHeaderBand2: TppGroupHeaderBand;
      ppGroupFooterBand2: TppGroupFooterBand;
      ppGroup4: TppGroup;
      ppGroupHeaderBand4: TppGroupHeaderBand;
      ppGroupFooterBand4: TppGroupFooterBand;
      ppLine1: TppLine;
      ppShape1: TppShape;
      ppDBText1: TppDBText;
      ppLabel4: TppLabel;
      ppDBText2: TppDBText;
      ppDBText3: TppDBText;
      ppDBText4: TppDBText;
      ppDBText5: TppDBText;
      ppDBText6: TppDBText;
      ppDBText7: TppDBText;
      ppDBText8: TppDBText;
      ppDBText12: TppDBText;
      ppLabel21: TppLabel;
      ppLine8: TppLine;
      ppLabel22: TppLabel;
      ppLabel23: TppLabel;
      ppLabel24: TppLabel;
      ppLabel25: TppLabel;
      ppLabel26: TppLabel;
      ppLabel27: TppLabel;
      ppLabel28: TppLabel;
      ppLabel29: TppLabel;
      ppGroup1: TppGroup;
      ppGroupHeaderBand1: TppGroupHeaderBand;
      ppGroupFooterBand1: TppGroupFooterBand;
      ppShape2: TppShape;
      ppShape5: TppShape;
      ppDBText9: TppDBText;
      ppDBText10: TppDBText;
      ppDBCalc3: TppDBCalc;
      ppLabel7: TppLabel;
      ppLabel8: TppLabel;
      ppShape4: TppShape;
      ppDBCalc1: TppDBCalc;
      ppLine4: TppLine;
      ppDBCalc2: TppDBCalc;
      ppLabel5: TppLabel;
      ppShape6: TppShape;
      ppLabel6: TppLabel;
      ppDBCalc4: TppDBCalc;
      ppShape7: TppShape;
      ppLine6: TppLine;
      ppShape8: TppShape;
      ppGroup3: TppGroup;
      ppGroupHeaderBand3: TppGroupHeaderBand;
      ppGroupFooterBand3: TppGroupFooterBand;
      ppGroup5: TppGroup;
      ppGroupHeaderBand5: TppGroupHeaderBand;
      ppGroupFooterBand5: TppGroupFooterBand;
      ppGroup6: TppGroup;
      ppGroupHeaderBand6: TppGroupHeaderBand;
      ppGroupFooterBand6: TppGroupFooterBand;
      ppDBText13: TppDBText;
      ppDBText14: TppDBText;
      ppLabel9: TppLabel;
      ppLabel10: TppLabel;
      ppLabel11: TppLabel;
      ppLabel12: TppLabel;
      ppLabel15: TppLabel;
      ppLine3: TppLine;
      ppLabel16: TppLabel;
      ppLabel17: TppLabel;
      ppLabel18: TppLabel;
      ppLabel19: TppLabel;
      ppShape3: TppShape;
      ppDBText15: TppDBText;
      ppDBText11: TppDBText;
      ppGroup7: TppGroup;
      ppGroupHeaderBand7: TppGroupHeaderBand;
      ppGroupFooterBand7: TppGroupFooterBand;
      ppDBText16: TppDBText;
      ppDBText17: TppDBText;
      ppDBText18: TppDBText;
      ppLabel20: TppLabel;
      ppLabel30: TppLabel;
      ppDBText19: TppDBText;
      ppLabel31: TppLabel;
      ppLabel32: TppLabel;
      ppDBText20: TppDBText;


      qryValCredPlanoPatroPLANO: TStringField;
      qryValCredPlanoPatroPATRO: TStringField;
      qryValCredPlanoPatroPLANO_PATRO: TStringField;
      qryValCredPlanoPatroIDCONTRATOEMPTMO: TFloatField;
      qryValCredPlanoPatroMATRICULA: TStringField;
      qryValCredPlanoPatroNOME: TStringField;
      qryValCredPlanoPatroTCEDESCRICAO: TStringField;
      qryValCredPlanoPatroFLGFORMAPAG: TStringField;
      qryValCredPlanoPatroDESCFORMAPAG: TStringField;
      qryValCredPlanoPatroDATACREDITO: TDateTimeField;
      qryValCredPlanoPatroPORTFORMAPAG: TFloatField;
      qryValCredPlanoPatroCODFORMAPAG: TFloatField;
      qryValCredPlanoPatroNUMBANCO: TStringField;
      qryValCredPlanoPatroNUMAGENCIA: TStringField;
      qryValCredPlanoPatroCONTACORRENTE: TStringField;
      qryValCredPlanoPatroPORTADOR_FORMA: TStringField;
      qryValCredPlanoPatroFORMA: TStringField;
      qryValCredPlanoPatroPAGO: TStringField;
      qryValCredPlanoPatroORIGEM: TStringField;
      qryValCredPlanoPatroEVENTO: TStringField;
      qryValCredPlanoPatroORIGEM_EVENTO: TStringField;
      qryValCredPlanoPatroHMEDATAVENCTO: TDateTimeField;
      qryValCredPlanoPatroHMEVLRPREVISTO: TFloatField;
      qryValCredPlanoPatroITEDESCRICAO: TStringField;
      qryValCredPlanoPatroNOMEUSUARIO: TStringField;
    ppLine5: TppLine;
    ppShape9: TppShape;
    ppLabel33: TppLabel;
    ppDBCalc5: TppDBCalc;
    ppDBText21: TppDBText;
    ppShape10: TppShape;
    ppDBText22: TppDBText;
    ppLabel34: TppLabel;
    qryValCredPlanoPatroNOMEPERFIL: TStringField;
    daDataModule1: TdaDataModule;


      procedure ppLine1Print(Sender: TObject);
      procedure ppShape1Print(Sender: TObject);
      procedure ppGroupHeaderBand2BeforePrint(Sender: TObject);
      procedure ppDetailBand1BeforePrint(Sender: TObject);
    procedure ppGroupHeaderBand7BeforePrint(Sender: TObject);
    procedure ppGroupHeaderBand3BeforePrint(Sender: TObject);
    procedure ppGroupFooterBand7BeforePrint(Sender: TObject);
    procedure ppGroupFooterBand1BeforePrint(Sender: TObject);


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
  dtmRelValCredPlanoPatro: TdtmRelValCredPlanoPatro;



implementation
{$R *.DFM}
uses
   CRelValCredPlanoPatro, USistema;



function TdtmRelValCredPlanoPatro.MostraParam(Form: string): boolean;
var
   frm : TForm;
begin
   // criação dos forms de configuração de Relatórios

   // Prestação de Contas --------------------------------------------------------------------------------------
   if (LowerCase(Form) = 'cfgrelvalcredplanopatro') then
   begin
      frm := TcfgRelValCredPlanoPatro.Create(Application);
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



procedure TdtmRelValCredPlanoPatro.ppLine1Print(Sender: TObject);
begin
   inherited;
   (Sender as TppLine).Visible := bSeparador;
end;



procedure TdtmRelValCredPlanoPatro.ppShape1Print(Sender: TObject);
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



procedure TdtmRelValCredPlanoPatro.ppGroupHeaderBand2BeforePrint(Sender: TObject);
begin
   inherited;
   CorAtual := clWhite;
end;



procedure TdtmRelValCredPlanoPatro.ppDetailBand1BeforePrint(Sender: TObject);
begin
   inherited;
   (Sender as TppDetailBand).Visible := not(bSintetico);
end;



procedure TdtmRelValCredPlanoPatro.ppGroupHeaderBand7BeforePrint(Sender: TObject);
begin
   inherited;
   (Sender as TppGroupHeaderBand).Visible := not(bSintetico);
end;



procedure TdtmRelValCredPlanoPatro.ppGroupHeaderBand3BeforePrint(Sender: TObject);
begin
   inherited;
   (Sender as TppGroupHeaderBand).Visible := not(bSintetico);
end;



procedure TdtmRelValCredPlanoPatro.ppGroupFooterBand7BeforePrint(Sender: TObject);
begin
   inherited;

   (Sender as TppGroupFooterBand).Height := 52;
   if bSintetico then (Sender as TppGroupFooterBand).Height := 31;
end;



procedure TdtmRelValCredPlanoPatro.ppGroupFooterBand1BeforePrint(Sender: TObject);
begin
   inherited;

   (Sender as TppGroupFooterBand).Height := 52;
   if bSintetico then (Sender as TppGroupFooterBand).Height := 31;
end;



end.
