unit dRelResumoContratoSaldo;

interface

uses
   Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
   dReports, ppVar, ppBands, ppCtrls, ppPrnabl, ppClass, ppCache, ppProd,
   ppReport, Db, DBTables, Wwquery, Wwdatsrc, ppComm, ppRelatv, ppDB,
   ppDBPipe, ppDBBDE;

type
   TdtmRelResumoContratoSaldo = class(TdtmReports)
      pplResumoContratoSaldo: TppBDEPipeline;
      dtsResumoContratoSaldo: TwwDataSource;
      rptResumoContratoSaldo: TppReport;
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
      ppDBText2: TppDBText;
      ppDBText3: TppDBText;
      ppDBText5: TppDBText;
      ppDBText7: TppDBText;
      ppDBText8: TppDBText;
      ppDBText9: TppDBText;
      ppDBText10: TppDBText;
      ppLine3: TppLine;
      ppLabel122: TppLabel;
      ppLine4: TppLine;
      ppShape3: TppShape;
      ppLabel13: TppLabel;
      ppGroup2: TppGroup;
      ppGroupHeaderBand2: TppGroupHeaderBand;
      ppGroupFooterBand2: TppGroupFooterBand;
      ppShape1: TppShape;
      ppDBText11: TppDBText;
      ppLabel9: TppLabel;
      ppLabel7: TppLabel;
      ppLabel5: TppLabel;
      ppLabel4: TppLabel;
      ppLabel15: TppLabel;
      ppLabel16: TppLabel;
      ppLabel10: TppLabel;
      ppLabel17: TppLabel;
      ppLabel18: TppLabel;
      ppLabel11: TppLabel;
      ppLabel12: TppLabel;
      ppLabel6: TppLabel;
      ppLabel8: TppLabel;
      ppLabel14: TppLabel;
      ppLabel20: TppLabel;
      ppLabel21: TppLabel;
      ppDBText12: TppDBText;
      ppDBText13: TppDBText;
      ppDBText14: TppDBText;
      ppDBText15: TppDBText;
      ppShape5: TppShape;
      ppLine1: TppLine;
      ppDBText39: TppDBText;
      ppDBCalc1: TppDBCalc;
      ppDBCalc2: TppDBCalc;
      ppDBCalc3: TppDBCalc;
      ppDBCalc4: TppDBCalc;
      ppDBCalc5: TppDBCalc;
      ppDBCalc6: TppDBCalc;
      ppDBCalc7: TppDBCalc;
      ppDBCalc8: TppDBCalc;

      qryResumoContratoSaldo: TwwQuery;
      qryResumoContratoSaldoIDCONTRATOEMPTMO: TFloatField;
      qryResumoContratoSaldoNOME: TStringField;
      qryResumoContratoSaldoMATRICULA: TStringField;
      qryResumoContratoSaldoINSCRICAONUMERO: TFloatField;
      qryResumoContratoSaldoDESCTIPOEMPTMO: TStringField;
      qryResumoContratoSaldoTCEDESCRICAO: TStringField;
      qryResumoContratoSaldoSITDESCRICAO: TStringField;
      qryResumoContratoSaldoSALDODEV: TFloatField;
      qryResumoContratoSaldoCONCESSOES: TFloatField;
      qryResumoContratoSaldoPARCELAS: TFloatField;
      qryResumoContratoSaldoAMORTIZACAO: TFloatField;
      qryResumoContratoSaldoQUITACAO: TFloatField;
      qryResumoContratoSaldoQUIT_MORT: TFloatField;
      qryResumoContratoSaldoSALDOATU: TFloatField;
      qryResumoContratoSaldoDIFERENCA: TFloatField;
      qryResumoContratoSaldoNOME_PLANO: TStringField;
      qryResumoContratoSaldoNOME_PATRO: TStringField;
      qryResumoContratoSaldoATU_DIA: TFloatField;
      qryResumoContratoSaldoAJUSTE: TFloatField;

      upd: TUpdateSQL;
      ppLabel19: TppLabel;
      ppGroup3: TppGroup;
      ppGroupHeaderBand3: TppGroupHeaderBand;
      ppGroupFooterBand3: TppGroupFooterBand;
      ppGroup4: TppGroup;
      ppGroupHeaderBand4: TppGroupHeaderBand;
      ppGroupFooterBand4: TppGroupFooterBand;
      ppDBText6: TppDBText;
      ppDBText16: TppDBText;
      ppDBText17: TppDBText;
      ppLabel22: TppLabel;
      ppLabel23: TppLabel;
      ppLabel26: TppLabel;
      ppDBCalc9: TppDBCalc;
      ppDBCalc10: TppDBCalc;
    ppLine5: TppLine;
    ppShape2: TppShape;
    ppDBCalc11: TppDBCalc;
    ppDBCalc12: TppDBCalc;
    ppDBCalc13: TppDBCalc;
    ppDBCalc14: TppDBCalc;
    ppDBCalc15: TppDBCalc;
    ppDBCalc16: TppDBCalc;
    ppDBCalc17: TppDBCalc;
    ppDBCalc18: TppDBCalc;
    ppDBCalc19: TppDBCalc;
    ppDBCalc20: TppDBCalc;
    qryResumoContratoSaldoPLANO_PATRO: TStringField;
    ppShape4: TppShape;
    ppLabel24: TppLabel;
    ppLabel25: TppLabel;
    ppLabel27: TppLabel;
    ppLabel28: TppLabel;
    ppLabel29: TppLabel;
    ppLabel30: TppLabel;
    ppLabel31: TppLabel;
    ppLabel32: TppLabel;
    ppLabel33: TppLabel;
    ppLabel34: TppLabel;
    ppLabel35: TppLabel;
    ppLabel37: TppLabel;
    ppLabel38: TppLabel;
    ppLabel39: TppLabel;
    ppLabel40: TppLabel;
    ppLine6: TppLine;
    ppDBText18: TppDBText;
    qryResumoContratoSaldoATU_DIA_CONTAB: TFloatField;
    qryResumoContratoSaldoCONCESSOES_CONTAB: TFloatField;
    qryResumoContratoSaldoPARCELAS_CONTAB: TFloatField;
    qryResumoContratoSaldoAMORTIZACAO_CONTAB: TFloatField;
    qryResumoContratoSaldoQUITACAO_CONTAB: TFloatField;
    qryResumoContratoSaldoQUIT_MORT_CONTAB: TFloatField;
    qryResumoContratoSaldoAJUSTE_CONTAB: TFloatField;
    ppLine7: TppLine;
    ppDBText19: TppDBText;
    qryResumoContratoSaldoATU_DIA_ESTORNO: TFloatField;
    qryResumoContratoSaldoCONCESSOES_ESTORNO: TFloatField;
    qryResumoContratoSaldoPARCELAS_ESTORNO: TFloatField;
    qryResumoContratoSaldoAMORTIZACAO_ESTORNO: TFloatField;
    qryResumoContratoSaldoQUITACAO_ESTORNO: TFloatField;
    qryResumoContratoSaldoQUIT_MORT_ESTORNO: TFloatField;
    qryResumoContratoSaldoAJUSTE_ESTORNO: TFloatField;

      procedure ppLine4Print(Sender: TObject);
      procedure ppShape3Print(Sender: TObject);
      procedure ppLabel13Print(Sender: TObject);
      procedure ppShape1Print(Sender: TObject);
    procedure ppDetailBand1BeforePrint(Sender: TObject);
    procedure ppGroupHeaderBand3BeforePrint(Sender: TObject);
    procedure ppGroupHeaderBand4BeforePrint(Sender: TObject);
    procedure ppLine1Print(Sender: TObject);
    procedure ppGroupHeaderBand2BeforePrint(Sender: TObject);


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
  dtmRelResumoContratoSaldo: TdtmRelResumoContratoSaldo;



implementation
{$R *.DFM}
uses
   UFuncoesEmptmo, uSistema, cRelResumoContratoSaldo;




function TdtmRelResumoContratoSaldo.MostraParam(Form: string): boolean;
var
   frm : TForm;
begin
   // criação dos forms de configuração de Relatórios

   // Prestação de Contas --------------------------------------------------------------------------------------
   if (LowerCase(Form) = 'cfgrelresumocontratosaldo') then
   begin
      frm := TcfgRelResumoContratoSaldo.Create(Application);
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



procedure TdtmRelResumoContratoSaldo.ppLine4Print(Sender: TObject);
begin
   inherited;
   (Sender as TppLine).Visible := bSeparador;
end;



procedure TdtmRelResumoContratoSaldo.ppShape3Print(Sender: TObject);
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



procedure TdtmRelResumoContratoSaldo.ppLabel13Print(Sender: TObject);
begin
   inherited;
   TppLabel(Sender).Caption := sMesCompetencia;
end;



procedure TdtmRelResumoContratoSaldo.ppShape1Print(Sender: TObject);
begin
   inherited;
   (Sender as TppShape).Brush.Color := clSilver;
end;



procedure TdtmRelResumoContratoSaldo.ppDetailBand1BeforePrint(Sender: TObject);
begin
   inherited;
   (Sender as TppDetailBand).Visible := not(bSintetico);
end;



procedure TdtmRelResumoContratoSaldo.ppGroupHeaderBand3BeforePrint(Sender: TObject);
begin
   inherited;
   (Sender as TppGroupHeaderBand).Visible := bSintetico;
end;



procedure TdtmRelResumoContratoSaldo.ppGroupHeaderBand4BeforePrint(Sender: TObject);
begin
   inherited;
   (Sender as TppGroupHeaderBand).Visible := bSintetico;
end;



procedure TdtmRelResumoContratoSaldo.ppLine1Print(Sender: TObject);
begin
   inherited;
   (Sender as TppLine).Visible := not(bSintetico);
end;



procedure TdtmRelResumoContratoSaldo.ppGroupHeaderBand2BeforePrint(Sender: TObject);
begin
   inherited;
   (Sender as TppGroupHeaderBand).Visible := not(bSintetico);
end;



end.
