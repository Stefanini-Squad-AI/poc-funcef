unit dRelItensGeradosTipoContr;

interface

uses
   Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
   dReports, ppBands, ppClass, ppCtrls, Db, ppVar, ppPrnabl, ppCache,
   ppProd, ppReport, DBTables, Wwquery, Wwdatsrc, ppComm, ppRelatv, ppDB,
   ppDBPipe, ppDBBDE, ppRichTx, ppStrtch, ppMemo;

type
   TdtmRelItensGeradosTipoContr = class(TdtmReports)
    pplItensGeradosTipoContr: TppBDEPipeline;
    dtsItensGeradosTipoContr: TwwDataSource;
    qryItensGeradosTipoContr: TwwQuery;
    rptItensGeradosTipoContr: TppReport;
    ppHeaderBand2: TppHeaderBand;
    ppLabel13: TppLabel;
    ppLabel15: TppLabel;
    ppLabel16: TppLabel;
    ppLabel17: TppLabel;
    rptItensGeradosTipoContr_lblPeriodo: TppLabel;
    rptItensGeradosTipoContr_lblEvento: TppLabel;
    ppLabel18: TppLabel;
    rptItensGeradosTipoContr_lblCompetencia: TppLabel;
    ppLabel22: TppLabel;
    ppLabel23: TppLabel;
    ppMemo2: TppMemo;
    memPatro: TppRichText;
    memPlano: TppRichText;
    ppMemo1: TppMemo;
    ppDetailBand2: TppDetailBand;
    ppShape5: TppShape;
    ppLine5: TppLine;
    ppDBText8: TppDBText;
    ppDBText10: TppDBText;
    ppDBText11: TppDBText;
    ppDBText12: TppDBText;
    ppDBText13: TppDBText;
    ppDBText14: TppDBText;
    ppDBText15: TppDBText;
    ppDBText16: TppDBText;
    ppDBText17: TppDBText;
    ppDBText18: TppDBText;
    ppDBText19: TppDBText;
    ppFooterBand2: TppFooterBand;
    ppLine6: TppLine;
    ppLabel19: TppLabel;
    ppSystemVariable3: TppSystemVariable;
    ppSystemVariable4: TppSystemVariable;
    ppGroup4: TppGroup;
    ppGroupHeaderBand4: TppGroupHeaderBand;
    ppShape6: TppShape;
    ppDBText20: TppDBText;
    ppGroupFooterBand4: TppGroupFooterBand;
    ppGroup5: TppGroup;
    ppGroupHeaderBand5: TppGroupHeaderBand;
    ppGroupFooterBand5: TppGroupFooterBand;
    ppGroup6: TppGroup;
    ppGroupHeaderBand6: TppGroupHeaderBand;
    ppShape7: TppShape;
    ppDBText21: TppDBText;
    ppLabel21: TppLabel;
    ppLabel24: TppLabel;
    ppLabel27: TppLabel;
    ppLabel28: TppLabel;
    ppLabel29: TppLabel;
    ppLabel30: TppLabel;
    ppLabel31: TppLabel;
    ppLabel32: TppLabel;
    ppLabel33: TppLabel;
    ppLabel34: TppLabel;
    ppLabel35: TppLabel;
    ppLabel36: TppLabel;
    ppLabel37: TppLabel;
    ppLabel38: TppLabel;
    ppLabel39: TppLabel;
    ppLabel40: TppLabel;
    ppLabel41: TppLabel;
    ppLabel42: TppLabel;
    ppLabel43: TppLabel;
    ppLabel44: TppLabel;
    ppLabel45: TppLabel;
    ppLabel46: TppLabel;
    ppLabel47: TppLabel;
    ppGroupFooterBand6: TppGroupFooterBand;
    ppLine7: TppLine;
    ppShape8: TppShape;
    ppDBCalc5: TppDBCalc;
    ppDBCalc6: TppDBCalc;
    ppDBCalc7: TppDBCalc;
    ppDBCalc8: TppDBCalc;
    ppDBCalc9: TppDBCalc;
    ppDBCalc10: TppDBCalc;
    ppDBCalc11: TppDBCalc;
    ppDBCalc12: TppDBCalc;
    ppDBCalc13: TppDBCalc;
    qryItensGeradosTipoContrIDTIPOCONTREMPTMO: TFloatField;
    qryItensGeradosTipoContrTCEDESCRICAO: TStringField;
    qryItensGeradosTipoContrEVENTO: TFloatField;
    qryItensGeradosTipoContrDESC_EVENTO: TStringField;
    qryItensGeradosTipoContrIDITEMEMPTMO: TFloatField;
    qryItensGeradosTipoContrITEDESCRICAO: TStringField;
    qryItensGeradosTipoContrVALOR_AGRUPADO: TFloatField;
    qryItensGeradosTipoContrVALOR_CENTRALIZA: TFloatField;
    qryItensGeradosTipoContrVALOR_AGRUPADO_CONTAB: TFloatField;
    qryItensGeradosTipoContrVALOR_EFETIVO: TFloatField;
    qryItensGeradosTipoContrVALOR_ABONADO: TFloatField;
    qryItensGeradosTipoContrVALOR_ABONADO_CONTAB: TFloatField;
    qryItensGeradosTipoContrABONO_CONTAB: TFloatField;
    qryItensGeradosTipoContrVALOR_ESTORNADO_CONTAB: TFloatField;
    qryItensGeradosTipoContrESTORNO_CONTAB: TFloatField;
    ppLabel56: TppLabel;
    ppLabel57: TppLabel;
    lblTipoEmptmo: TppLabel;
    lblTipoContr: TppLabel;

      procedure ppLine4Print(Sender: TObject);
      procedure ppShape3Print(Sender: TObject);
      procedure ppShape2Print(Sender: TObject);


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

      bSeparador  : Boolean;
      CorLinha    : TColor;
      CorAtual    : TColor;
      bCorLinha   : Boolean;

      function MostraParam(Form: string): boolean; override;

   end;



var
  dtmRelItensGeradosTipoContr: TdtmRelItensGeradosTipoContr;



implementation
{$R *.DFM}
uses
   UFuncoesEmptmo, cRelItensGeradosTipoContr;



function TdtmRelItensGeradosTipoContr.MostraParam(Form: string): boolean;
var
   frm : TForm;
begin
   // criação dos forms de configuração de Relatórios

   // Prestação de Contas --------------------------------------------------------------------------------------
   if (LowerCase(Form) = 'cfgrelitensgeradostipocontr') then begin
      frm := TcfgRelItensGeradosTipoContr.Create(Application);
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



procedure TdtmRelItensGeradosTipoContr.ppLine4Print(Sender: TObject);
begin
   inherited;
   (Sender as TppLine).Visible := bSeparador;
end;



procedure TdtmRelItensGeradosTipoContr.ppShape3Print(Sender: TObject);
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



procedure TdtmRelItensGeradosTipoContr.ppShape2Print(Sender: TObject);
begin
   inherited;
   CorAtual := clWhite;
end;



end.
