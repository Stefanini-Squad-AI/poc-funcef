unit dRelQuitacaoComSaldoDevedor;

// Alterações:
{
 --------------------------------------------------------------------------------------------------
Pendência   : SOL 253185 PPM 771995
Responsável : William Moreira da Silva
Data        : 17/06/2015
Descrição   : Reestruturação da HistMovEmptmo(*Retirada dos Hint's)
 --------------------------------------------------------------------------------------------------}

interface

uses
   Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
   dReports, ppVar, ppBands, ppCtrls, ppPrnabl, ppClass, ppCache, ppProd,
   ppReport, Db, DBTables, Wwquery, Wwdatsrc, ppComm, ppRelatv, ppDB,
   ppDBPipe, ppDBBDE;

type
   TdtmRelQuitacaoComSaldoDevedor = class(TdtmReports)
      pplQuitacaoComSaldoDevedor: TppBDEPipeline;
      dsQuitacaoComSaldoDevedor: TwwDataSource;
      rptQuitacaoComSaldoDevedor: TppReport;
      ppHeaderBand1: TppHeaderBand;
      ppLabel1: TppLabel;
      ppLabel2: TppLabel;
      ppDetailBand1: TppDetailBand;
      ppFooterBand1: TppFooterBand;
      ppLine2: TppLine;
      ppLabel3: TppLabel;
      ppSystemVariable1: TppSystemVariable;
      ppSystemVariable2: TppSystemVariable;
      ppSummaryBand1: TppSummaryBand;
      rptContrato: TppShape;
      ppLine4: TppLine;
      ppDBText5: TppDBText;
      ppDBText2: TppDBText;
      ppDBText3: TppDBText;
      qryQuitacaoComSaldoDevedor: TwwQuery;
      ppLabel5: TppLabel;
      ppDBText1: TppDBText;
      ppDBText4: TppDBText;
      ppLabel7: TppLabel;
      ppLabel9: TppLabel;
      ppLabel10: TppLabel;
      ppLabel11: TppLabel;
      ppLine3: TppLine;
      qryQuitacaoComSaldoDevedorIDCONTRATOEMPTMO: TFloatField;
      qryQuitacaoComSaldoDevedorNOME: TStringField;
      qryQuitacaoComSaldoDevedorMATRICULA: TStringField;
      qryQuitacaoComSaldoDevedorHMEDATAPREVISTA: TDateTimeField;
      qryQuitacaoComSaldoDevedorSIT_CONTRATO: TStringField;
      qryQuitacaoComSaldoDevedorSALDODEV: TFloatField;
      qryQuitacaoComSaldoDevedorVALORDEV: TFloatField;
      ppDBText6: TppDBText;
      ppLabel4: TppLabel;
      upd: TUpdateSQL;
    ppGroup1: TppGroup;
    ppGroupHeaderBand1: TppGroupHeaderBand;
    ppGroupFooterBand1: TppGroupFooterBand;
    ppLabel6: TppLabel;
    ppDBText7: TppDBText;

      procedure rptContratoPrint(Sender: TObject);
      procedure ppLine3Print(Sender: TObject);

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

      bSeparador  : Boolean;
      CorLinha    : TColor;
      CorAtual    : TColor;
      bCorLinha   : Boolean;

      function MostraParam(Form: string): boolean; override;

  end;



var
  dtmRelQuitacaoComSaldoDevedor: TdtmRelQuitacaoComSaldoDevedor;



implementation
{$R *.DFM}
uses
   UFuncoesEmptmo, cRelQuitacaoComSaldoDevedor, uSistema;


function TdtmRelQuitacaoComSaldoDevedor.MostraParam(Form: string): boolean;
var
   frm : TForm;
begin
   // criação dos forms de configuração de Relatórios

   if (LowerCase(Form) = 'cfgrelquitacaocomsaldodevedor') then begin
      frm := TcfgRelQuitacaoComSaldoDevedor.Create(Application);
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



procedure TdtmRelQuitacaoComSaldoDevedor.rptContratoPrint(Sender: TObject);
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



procedure TdtmRelQuitacaoComSaldoDevedor.ppLine3Print(Sender: TObject);
begin
   inherited;
   (Sender as TppLine).Visible := bSeparador;
end;



end.


