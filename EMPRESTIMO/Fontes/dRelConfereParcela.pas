unit dRelConfereParcela;

interface

uses
   Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
   dReports, ppVar, ppBands, ppCtrls, ppPrnabl, ppClass, ppCache, ppProd,
   ppReport, Db, DBTables, Wwquery, Wwdatsrc, ppComm, ppRelatv, ppDB,
   ppDBPipe, ppDBBDE, ppStrtch, ppSubRpt, ppRichTx, ppMemo;

type
   TdtmRelConfereParcela = class(TdtmReports)
      rptConfereParcela: TppReport;
      ppHeaderBand24: TppHeaderBand;
      ppShape1: TppShape;
      LblTiTAdianto: TppLabel;
      ppLabel1: TppLabel;
      ppLabel97: TppLabel;
      ppLabel98: TppLabel;
      ppLabel105: TppLabel;
      ppDetalhe: TppDetailBand;
      ppShape3: TppShape;
      ppLine3: TppLine;
      ppDBNumContrato: TppDBText;
      ppDBText2: TppDBText;
      ppDBText4: TppDBText;
      ppFooterBand24: TppFooterBand;
      ppLine45: TppLine;
      ppLabel3: TppLabel;
      ppCalc43: TppSystemVariable;
      ppCalc44: TppSystemVariable;
      qryConfereParcela: TwwQuery;
      dtsConfereParcela: TwwDataSource;
      pplConfereParcela: TppDBPipeline;
      ppLabel4: TppLabel;
      lblMesCompetencia: TppLabel;
      ppLabel11: TppLabel;
      ppLabel12: TppLabel;
      ppDBText1: TppDBText;
      ppLabel13: TppLabel;
    ppLabel2: TppLabel;
    ppLabel6: TppLabel;
    qryConfereParcelaIDCONTRATOEMPTMO: TFloatField;
    qryConfereParcelaMATRICULA: TStringField;
    qryConfereParcelaNOME: TStringField;
    qryConfereParcelaPREV_ANT: TFloatField;
    qryConfereParcelaPREV_ATU: TFloatField;
    qryConfereParcelaPARC_ANT: TFloatField;
    qryConfereParcelaPARC_ATU: TFloatField;
    qryConfereParcelaPARCS_ANT: TFloatField;
    qryConfereParcelaPARCS_ATU: TFloatField;
    qryConfereParcelaDATA_ANT: TDateTimeField;
    qryConfereParcelaDATA_ATU: TDateTimeField;
    ppLabel7: TppLabel;
    ppLabel8: TppLabel;
    ppLabel10: TppLabel;
    ppDBText5: TppDBText;
    ppDBText6: TppDBText;
    ppDBText7: TppDBText;
    ppLabel15: TppLabel;
    ppDBText3: TppDBText;
    ppLabel14: TppLabel;
    ppDBText8: TppDBText;
    qryConfereParcelaPERC: TFloatField;
    ppDBText9: TppDBText;
    ppLabel5: TppLabel;
    ppSummaryBand1: TppSummaryBand;
    ppLine1: TppLine;
    ppDBCalc1: TppDBCalc;
    ppShape2: TppShape;
    ppLabel9: TppLabel;
    ppDBText10: TppDBText;
    ppLabel16: TppLabel;
    rptConfereParcela_lblFiltroAmortiza: TppLabel;
    qryConfereParcelaSITUACAO: TStringField;
    qryConfereParcelaSUSPENSO: TStringField;
    ppDBText11: TppDBText;
    ppLabel17: TppLabel;
    ppLabel22: TppLabel;
    ppLabel23: TppLabel;
    memPatro: TppRichText;
    memPlano: TppRichText;
    ppLabel56: TppLabel;
    ppLabel57: TppLabel;
    lblTipoEmptmo: TppLabel;
    lblTipoContr: TppLabel;

      procedure ppLine3Print(Sender: TObject);
      procedure ppShape3Print(Sender: TObject);
      procedure ppShape1Print(Sender: TObject);


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

      sDataRef    : String;
      bSeparador  : Boolean;
      CorLinha    : TColor;
      CorAtual    : TColor;
      bCorLinha   : Boolean;

      sTitulo     : String;

      function MostraParam(Form: string): boolean; override;

  end;



var
  dtmRelConfereParcela: TdtmRelConfereParcela;



implementation
{$R *.DFM}
uses
   uSistema, uFuncoesEmptmo, cRelConfereParcela;





function TdtmRelConfereParcela.MostraParam(Form: string): boolean;
var
   frm : TForm;
begin
   // criação dos forms de configuração de Relatórios

   // Prestação de Contas --------------------------------------------------------------------------------------
   if (LowerCase(Form) = 'cfgrelconfereparcela') then
   begin
      frm := TcfgRelConfereParcela.Create(Application);
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

   with frm do begin
      Result := (ShowModal = mrOk);
      Free;
   end;
end;



procedure TdtmRelConfereParcela.ppLine3Print(Sender: TObject);
begin
   inherited;
   (Sender as TppLine).Visible := bSeparador;
end;



procedure TdtmRelConfereParcela.ppShape3Print(Sender: TObject);
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



procedure TdtmRelConfereParcela.ppShape1Print(Sender: TObject);
begin
   inherited;
   CorAtual := clWhite;
end;



end.
