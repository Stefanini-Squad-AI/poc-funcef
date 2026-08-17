{---------------------------Alteração-------------------------------------------
Pendência   : SOL 114575 KINTANA 535771
Responsável : Jéssica Lana
Data        : 24/04/2009
Descrição   : Gravar arquivos com a query de entrada na pasta C:\PLANUS\TEMP.
-------------------------------------------------------------------------------}
unit dRelParcGerPatro;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  dReports, ppVar, ppBands, ppCtrls, ppPrnabl, ppClass, ppCache, ppProd,
  ppReport, Db, DBTables, Wwquery, Wwdatsrc, ppComm, ppRelatv, ppDB,
  ppDBPipe, ppDBBDE, ppStrtch, ppSubRpt, ppMemo, ppRichTx;

type
  TdtmRelParcGerPatro = class(TdtmReports)
    rptParcGerPatro: TppReport;
    ppHeaderBand24: TppHeaderBand;
    ppShape1: TppShape;
    LblTiTAdianto: TppLabel;
    ppLabel1: TppLabel;
    ppLabel97: TppLabel;
    ppLabel98: TppLabel;
    ppLabel102: TppLabel;
    ppLabel105: TppLabel;
    ppLabel107: TppLabel;
    ppLabel109: TppLabel;
    ppLabel2: TppLabel;
    ppDetalhe: TppDetailBand;
    ppShape3: TppShape;
    ppLine3: TppLine;
    ppDBNumContrato: TppDBText;
    ppDBText2: TppDBText;
    ppDBText3: TppDBText;
    ppDBText4: TppDBText;
    ppDBText5: TppDBText;
    ppDBText8: TppDBText;
    ppDBText9: TppDBText;
    ppFooterBand24: TppFooterBand;
    ppLine45: TppLine;
    ppLabel3: TppLabel;
    ppCalc43: TppSystemVariable;
    ppCalc44: TppSystemVariable;
    ppSummaryBand2: TppSummaryBand;
    ppShape2: TppShape;
    ppShape4: TppShape;
    ppLabel9: TppLabel;
    ppDBCalc1: TppDBCalc;
    ppDBCalc5: TppDBCalc;
    ppLabel5: TppLabel;
    ppLine2: TppLine;
    qryParcGerPatro: TwwQuery;
    dtsParcGerPatro: TwwDataSource;
    pplParcGerPatro: TppDBPipeline;
    ppDBCalc2: TppDBCalc;
    ppLabel4: TppLabel;
    ppLabel6: TppLabel;
    lblMesCompetencia: TppLabel;
    lblItemEmptmo: TppLabel;
    qryParcGerPatroNOME_PATRO: TStringField;
    qryParcGerPatroIDCONTRATOEMPTMO: TFloatField;
    qryParcGerPatroNOME: TStringField;
    qryParcGerPatroITEM: TStringField;
    qryParcGerPatroPARCELA: TStringField;
    qryParcGerPatroHMEVLRPREVISTO: TFloatField;
    qryParcGerPatroCOBRANCA: TStringField;
    qryParcGerPatroENVIADO: TStringField;
    qryParcGerPatroRECEBIDO: TStringField;
    qryParcGerPatroTXJUROS: TFloatField;
    qryParcGerPatroSALDODEV: TFloatField;
    qryParcGerPatroPLANILHA: TStringField;
    qryParcGerPatroHMEANOCOMPETENCIA: TFloatField;
    qryParcGerPatroHMEMESCOMPETENCIA: TFloatField;
    ppGroup1: TppGroup;
    ppGroupHeaderBand1: TppGroupHeaderBand;
    ppGroupFooterBand1: TppGroupFooterBand;
    ppDBText1: TppDBText;
    ppShape5: TppShape;
    ppShape6: TppShape;
    ppLabel7: TppLabel;
    ppDBCalc3: TppDBCalc;
    ppDBCalc4: TppDBCalc;
    ppLabel8: TppLabel;
    ppDBCalc6: TppDBCalc;
    ppLine1: TppLine;
    ppLabel22: TppLabel;
    ppLabel23: TppLabel;
    memPatro: TppRichText;
    memPlano: TppRichText;
    ppLabel56: TppLabel;
    ppLabel57: TppLabel;
    lblTipoEmptmo: TppLabel;
    lblTipoContr: TppLabel;
    ppMemo2: TppMemo;
    ppMemo1: TppMemo;

    procedure ppLine3Print(Sender: TObject);
    procedure ppShape3Print(Sender: TObject);
    procedure ppShape1Print(Sender: TObject);
    procedure qryParcGerPatroBeforeOpen(DataSet: TDataSet);


   private { Private declarations }

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

   public { Public declarations }

      sDataRef    : String;
      bSeparador  : Boolean;
      CorLinha    : TColor;
      CorAtual    : TColor;
      bCorLinha   : Boolean;

      sTitulo     : String;

      function MostraParam(Form: string): boolean; override;

  end;



var
  dtmRelParcGerPatro: TdtmRelParcGerPatro;



implementation
{$R *.DFM}
uses
   uSistema, uFuncoesEmptmo, cRelParcGerPatro;





function TdtmRelParcGerPatro.MostraParam(Form: string): boolean;
var
   frm : TForm;
begin
   // criação dos forms de configuração de Relatórios

   // Prestação de Contas --------------------------------------------------------------------------------------
   if (LowerCase(Form) = 'cfgrelparcgerpatro') then begin
      frm := TcfgRelParcGerPatro.Create(Application);
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



procedure TdtmRelParcGerPatro.ppLine3Print(Sender: TObject);
begin
   inherited;
   (Sender as TppLine).Visible := bSeparador;
end;



procedure TdtmRelParcGerPatro.ppShape3Print(Sender: TObject);
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



procedure TdtmRelParcGerPatro.ppShape1Print(Sender: TObject);
begin
   inherited;
   CorAtual := clWhite;
end;



procedure TdtmRelParcGerPatro.qryParcGerPatroBeforeOpen(DataSet: TDataSet);
begin
   inherited;

   // Gravando o SQL de entrada para permitir verificação
   // Jéssica Lana SOL 114575 Kintana 535771 24/04/2009
   // qryParcGerPatro.SQL.SaveToFile(Sistema.TempDir + 'EP-RelParcelasGeradas.txt');
      qryParcGerPatro.SQL.SaveToFile(ftempregra + '\' + 'EP-RelParcelasGeradas.txt');
   Application.ProcessMessages;
end;



end.
