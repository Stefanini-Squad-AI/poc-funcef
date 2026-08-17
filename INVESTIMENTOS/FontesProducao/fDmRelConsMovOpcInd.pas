unit FDmRelConsMovOpcInd;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  FDMRelatoriosInv, ppCtrls, ppDB, ppVar, ppBands, ppPrnabl, ppClass,
  ppCache, ppProd, ppReport, Db, DBTables, Wwquery, Wwdatsrc, ppComm,
  ppRelatv, ppDBPipe, ppDBBDE, ppStrtch, ppSubRpt;

type
  TDmRelConsMovOpcInd = class(TDmRelatoriosInv)
    pplConsMovOrdens: TppBDEPipeline;
    rpConsMovOpcInd: TppReport;
    ppHeaderBand1: TppHeaderBand;
    ppLabel1: TppLabel;
    ppLabel2: TppLabel;
    ppDBImage1: TppDBImage;
    ppDetailBand1: TppDetailBand;
    ppFooterBand1: TppFooterBand;
    ppLine2: TppLine;
    ppLabel5: TppLabel;
    ppSystemVariable1: TppSystemVariable;
    ppSystemVariable2: TppSystemVariable;
    ppGroup1: TppGroup;
    ppGroupHeaderBand1: TppGroupHeaderBand;
    ppGroupFooterBand1: TppGroupFooterBand;
    ppDBText1: TppDBText;
    ppDBText7: TppDBText;
    ppDBText9: TppDBText;
    dsOrdem: TwwDataSource;
    ppGroup2: TppGroup;
    ppGroupHeaderBand2: TppGroupHeaderBand;
    ppGroupFooterBand2: TppGroupFooterBand;
    ppDBText8: TppDBText;
    ppLabel9: TppLabel;
    ppLine6: TppLine;
    ppLine1: TppLine;
    ppLine3: TppLine;
    ppShape8: TppShape;
    ppLabel6: TppLabel;
    ppLabel7: TppLabel;
    ppLabel8: TppLabel;
    ppLine7: TppLine;
    ppLabel4: TppLabel;
    ppLabel3: TppLabel;
    qryOrdem: TwwQuery;
    qryOrdemDESCINVESTIMENTO: TStringField;
    qryOrdemDESCTIPOOPERACAO: TStringField;
    qryOrdemPREMIO: TFloatField;
    qryOrdemQUANTIDADE: TFloatField;
    qryOrdemVALOR: TFloatField;
    qryOrdemCARTEIRA: TStringField;
    qryOrdemDATAORDEM: TDateTimeField;
    qryOrdemIDBOLETA: TStringField;
    qryOrdemIDINVESTIMENTO: TFloatField;
    qryOrdemIDORDEMOPCIND: TFloatField;
    qryOrdemIDCORRETVALORES: TFloatField;
    qryOrdemIDTIPOOPERACAO: TFloatField;
    qryOrdemIDTIPOINVEST: TFloatField;
    qryOrdemOBSERVACAO: TMemoField;
    qryOrdemSTATUS: TStringField;
    qryOrdemIDUSUARIO: TFloatField;
    qryOrdemIDPLANPREVCTBPATR: TFloatField;
    qryOrdemSTACONFIRMA: TStringField;
    qryOrdemSTAAUTORIZA: TStringField;
    qryOrdemIDCESTAOPCIND: TFloatField;
    qryOrdemIDCARTEIRAGERENC: TFloatField;
    qryOrdemSGLCORRETVALORES: TStringField;
    qryOrdemDESCCARTINVEST: TStringField;
    qryOrdemIDCARTEIRAINVEST: TFloatField;
    qryOrdemIDLOTE: TStringField;
    ppGroup3: TppGroup;
    ppGroupHeaderBand3: TppGroupHeaderBand;
    ppGroupFooterBand3: TppGroupFooterBand;
    dsCesta: TwwDataSource;
    qryCesta: TwwQuery;
    qryCestaDATAVIGENCIA: TDateTimeField;
    qryCestaDESCINVESTIMENTO: TStringField;
    qryCestaQUANTIDADE: TFloatField;
    qryCestaCOTACAO: TFloatField;
    qryCestaVALOR: TFloatField;
    qryCestaSGLCUSTODIANTE: TStringField;
    qryCestaCARTEIRA: TStringField;
    qryCestaIDCESTAOPCIND: TFloatField;
    qryCestaIDINVESTIMENTO: TFloatField;
    qryCestaIDCUSTODIANTE: TFloatField;
    qryCestaIDCARTEIRAINVEST: TFloatField;
    qryCestaIDCARTEIRAGERENC: TFloatField;
    pplCesta: TppBDEPipeline;
    ppDBText2: TppDBText;
    ppDBText3: TppDBText;
    ppDBText4: TppDBText;
    ppDBText5: TppDBText;
    ppDBText6: TppDBText;
    ppCesta: TppSubReport;
    ppChildReport1: TppChildReport;
    ppTitleBand1: TppTitleBand;
    ppShape1: TppShape;
    ppLabel10: TppLabel;
    ppLabel11: TppLabel;
    ppLabel12: TppLabel;
    ppLabel13: TppLabel;
    ppLabel14: TppLabel;
    ppLabel15: TppLabel;
    ppLabel16: TppLabel;
    ppLabel17: TppLabel;
    ppLabel18: TppLabel;
    ppLVlrMin: TppLabel;
    ppLVlrMax: TppLabel;
    ppLVlrAtual: TppLabel;
    ppLabel19: TppLabel;
    ppDetailBand2: TppDetailBand;
    shpDetalhe: TppShape;
    ppDBText11: TppDBText;
    ppDBText12: TppDBText;
    ppDBText13: TppDBText;
    ppDBText14: TppDBText;
    ppDBText15: TppDBText;
    ppDBText16: TppDBText;
    ppSummaryBand1: TppSummaryBand;
    ppDBVlrValor: TppDBCalc;
    ppSummaryBand2: TppSummaryBand;
    ppFooterBand2: TppFooterBand;
    QryMaxMinCesta: TwwQuery;
    QryMaxMinCestaIDORDEMOPCIND: TFloatField;
    QryMaxMinCestaIDCARTEIRAINVEST: TFloatField;
    QryMaxMinCestaIDCARTEIRAGERENC: TFloatField;
    QryMaxMinCestaIDCESTAOPCIND: TFloatField;
    QryMaxMinCestaDATAVIGENCIA: TDateTimeField;
    QryMaxMinCestaIDINVESTIMENTO: TFloatField;
    QryMaxMinCestaIDPLANPREVCTBPATR: TFloatField;
    QryMaxMinCestaIDTIPOINVEST: TFloatField;
    QryMaxMinCestaIDTIPOOPERACAO: TFloatField;
    QryMaxMinCestaIDCORRETVALORES: TFloatField;
    QryMaxMinCestaDATAORDEM: TDateTimeField;
    QryMaxMinCestaIDBOLETA: TStringField;
    QryMaxMinCestaQUANTIDADE: TFloatField;
    QryMaxMinCestaPREMIO: TFloatField;
    QryMaxMinCestaVALOR: TFloatField;
    QryMaxMinCestaOBSERVACAO: TMemoField;
    QryMaxMinCestaSTATUS: TStringField;
    QryMaxMinCestaIDUSUARIO: TFloatField;
    QryMaxMinCestaSTACONFIRMA: TStringField;
    QryMaxMinCestaSTAAUTORIZA: TStringField;
    QryMaxMinCestaIDLOTE: TStringField;
    QryMaxMinCestaTRGDTINCLUSAO: TDateTimeField;
    QryMaxMinCestaTRGUSERINCLUSAO: TStringField;
    ppDBText10: TppDBText;
    ppLabel20: TppLabel;
    procedure rpConsMovOpcIndStartPage(Sender: TObject);
    procedure shpDetalhePrint(Sender: TObject);
    procedure ppGroupFooterBand3BeforePrint(Sender: TObject);
    procedure ppTitleBand1BeforePrint(Sender: TObject);
  private
    { Private declarations }
    cCorZebra : TColor;
  public
    { Public declarations }
  end;

var
  DmRelConsMovOpcInd: TDmRelConsMovOpcInd;

implementation

Uses uBibliotecaInvest, FCadOrdemOpcInd, UOperComum, UOpcaoIndice,
     UOperacaoInvest;

{$R *.DFM}

procedure TDmRelConsMovOpcInd.rpConsMovOpcIndStartPage(Sender: TObject);
begin
  inherited;
   cCorZebra := $00E3E3E3;

end;

procedure TDmRelConsMovOpcInd.shpDetalhePrint(Sender: TObject);
begin
  inherited;
   if cCorZebra = ClWhite then
      cCorZebra := $00E3E3E3
   else
      cCorZebra := ClWhite;

  TppShape(Sender).Brush.Color := cCorZebra;

end;

procedure TDmRelConsMovOpcInd.ppGroupFooterBand3BeforePrint(
  Sender: TObject);
begin
  inherited;
   qryCesta.Filter := 'IDCESTAOPCIND = '+qryOrdemIDCESTAOPCIND.AsString;
end;

procedure TDmRelConsMovOpcInd.ppTitleBand1BeforePrint(Sender: TObject);
var
   fVlrMaior, fVlrMenor, fVlrCesta, fValor, fMinCesta, fMaxCesta : Double;
   bFirst : boolean;
   sLote  : String;
   bmReg  : TBookmark;
   sVlrCesta,sVlrMaior,sVlrMenor : String;
begin

  inherited;

   fVlrMaior := 0;
   fVlrMenor := 0;
   fVlrCesta := 0;
   bFirst    := True;

   QryMaxMinCesta.Close;
   QryMaxMinCesta.ParamByName('IDBOLETA').AsString := qryOrdem.FieldByName('IDBOLETA').AsString;
   QryMaxMinCesta.ParamByName('IDLOTE').AsString   := qryOrdem.FieldByName('IDLOTE').AsString;
   QryMaxMinCesta.Open;

   QryMaxMinCesta.First;
   while not QryMaxMinCesta.Eof do
   begin
      sLote := QryMaxMinCesta.FieldByName('IDLOTE').AsString;
      while ((not QryMaxMinCesta.Eof) and
             (sLote = QryMaxMinCesta.FieldByName('IDLOTE').AsString)) do
      begin
         if not QryMaxMinCesta.FieldByName('IDCESTAOPCIND').IsNull then
            fVlrCesta := OpcaoIndice.BuscaValorCesta(QryMaxMinCesta.FieldByName('IDCESTAOPCIND').AsInteger,
                                                     qryOrdem.FieldByName('DATAORDEM').AsDateTime);

         fValor := OpcaoIndice.BuscaValorMaxCesta(QryMaxMinCesta.FieldByName('IDORDEMOPCIND').AsInteger);

         if bFirst then
         begin
             fVlrMaior := fValor;
             fVlrMenor := fValor;
             bFirst    := False;
         end
         else
         begin
            if fValor > fVlrMaior then
               fVlrMaior := fValor;
            if fValor < fVlrMenor then
               fVlrMenor := fValor;
         end;

         QryMaxMinCesta.Next;
      end;

      fMinCesta := fVlrMenor;
      fMaxCesta := fVlrMaior;

      if (fVlrCesta <> 0) and (fMinCesta <> fMaxCesta)then
      begin
         sVlrCesta := FormatFloat('###,###,###,###,##0.00',fVlrCesta);
         sVlrMaior := FormatFloat('###,###,###,###,##0.00',fVlrMaior);
         sVlrMenor := FormatFloat('###,###,###,###,##0.00',fVlrMenor);
      end;
   end;


   ppLVlrMin.Caption   := sVlrMenor;

   ppLVlrMax.Caption   := sVlrMaior;

   ppLVlrAtual.Caption := sVlrCesta;

end;

end.
