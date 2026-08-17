//******************************************************************************
// Data     : 03/01/2007
// Código   : AL_3
// Pendencia: 24099
// SOL      :
// Desc     : Retirada da obrigatoriedade do Plano / Patro na qryBoleta, qryHistoricos
//******************************************************************************
// Data     : 27/10/2006
// Código   : AL_2
// Pendencia: 22989
// SOL      :
// Desc     : Segregação de Planos
//*****************************************************************************

unit FDmRelLanContRVOPE;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  FDMRelatoriosInv, ppVar, ppBands, ppCtrls, ppPrnabl, ppClass, ppCache,
  ppProd, ppReport, Db, DBTables, Wwquery, Wwdatsrc, ppComm, ppRelatv,
  ppDB, ppDBPipe, ppDBBDE, ppStrtch, ppSubRpt, ppRegion;

type
  TDmRelLanContRVOPE = class(TDmRelatoriosInv)
    qryBoletas: TwwQuery;
    dsBoletas: TwwDataSource;
    pplBoletas: TppBDEPipeline;
    pprLanContRVOPE: TppReport;
    ppHeaderBand2: TppHeaderBand;
    ppLabel12: TppLabel;
    ppLabel16: TppLabel;
    ppLabel17: TppLabel;
    ppLabel18: TppLabel;
    ppLabel21: TppLabel;
    ppLabel22: TppLabel;
    ppDBText11: TppDBText;
    ppLabel23: TppLabel;
    ppLabel26: TppLabel;
    ppDetailBand2: TppDetailBand;
    ppShape3: TppShape;
    ppDBText13: TppDBText;
    ppDBText14: TppDBText;
    ppFooterBand2: TppFooterBand;
    ppSystemVariable3: TppSystemVariable;
    ppLine1: TppLine;
    ppLabel28: TppLabel;
    ppSystemVariable4: TppSystemVariable;
    qryHistoricos: TwwQuery;
    dsHistoricos: TwwDataSource;
    pplHistoricos: TppBDEPipeline;
    qryHistoricosPLNCODIGO: TFloatField;
    qryHistoricosDATAMOVCARTINV: TDateTimeField;
    qryHistoricosVALOR: TFloatField;
    qryHistoricosHISTMOVCARTINV: TStringField;
    qryHistoricosTIPMOVCARTINV: TStringField;
    qryHistoricosIDINVESTIMENTO: TFloatField;
    qryHistoricosIDCARTEIRAINVEST: TFloatField;
    qryHistoricosIDOPERACAOINVEST: TFloatField;
    qryHistoricosIDOPERCUSTODIA: TFloatField;
    qryHistoricosIDBOLETA: TStringField;
    qryLancamento: TwwQuery;
    dsLancamento: TwwDataSource;
    pplLancamento: TppBDEPipeline;
    qryLancamentoHISTORICO: TStringField;
    qryLancamentoLANCAMENTO: TFloatField;
    qryBoletasIDBOLETA: TStringField;
    qryBoletasCODDOCUMENTO: TFloatField;
    qryBoletasPLNCODIGO: TFloatField;
    qryBoletasPLANO: TFloatField;
    qryBoletasTIPMOVBOLETA: TStringField;
    qryBoletasSTATUS: TStringField;
    qryBoletasFORCLI: TStringField;
    qryBoletasOBSERVACAO: TMemoField;
    ppDBText1: TppDBText;
    ppDBText2: TppDBText;
    ppDBText3: TppDBText;
    ppDBText4: TppDBText;
    updHistoricos: TUpdateSQL;
    updBoletas: TUpdateSQL;
    qryLancamentoCOR: TFloatField;
    qryHistoricosCOR: TFloatField;
    qryBoletasCOR: TFloatField;
    qryBoletasDATABOLETA: TStringField;
    ppRegion2: TppRegion;
    ppRegion1: TppRegion;
    srptHistorico: TppSubReport;
    srptHistoricos: TppChildReport;
    ppTitleBand1: TppTitleBand;
    ppShape4: TppShape;
    ppLabel2: TppLabel;
    ppLabel1: TppLabel;
    ppDetailBand1: TppDetailBand;
    shpDetHistoricos: TppShape;
    ppDBText5: TppDBText;
    ppDBText6: TppDBText;
    ppSummaryBand1: TppSummaryBand;
    ppDBCalc2: TppDBCalc;
    srptLancamentos: TppSubReport;
    srptLancamento: TppChildReport;
    ppTitleBand3: TppTitleBand;
    ppDetailBand4: TppDetailBand;
    ppSummaryBand3: TppSummaryBand;
    ppShape7: TppShape;
    ppLabel5: TppLabel;
    ppLabel6: TppLabel;
    ppShape8: TppShape;
    ppDBText9: TppDBText;
    ppDBText10: TppDBText;
    ppDBCalc3: TppDBCalc;
    ppLabel3: TppLabel;
    ppGroup1: TppGroup;
    ppGroupHeaderBand1: TppGroupHeaderBand;
    ppGroupFooterBand1: TppGroupFooterBand;
    ppLine2: TppLine;
    ppShape1: TppShape;
    ppLabel4: TppLabel;
    ppShape2: TppShape;
    ppLabel7: TppLabel;
    QryPlanoPatro: TwwQuery;
    QryPlanoPatroPLANPRVCONTABPATRO: TStringField;
    QryPlanoPatroIDPLANPREVCTBPATR: TFloatField;
    QryPlanoPatroIDPLANOPREV: TFloatField;
    QryPlanoPatroIDPATRO: TFloatField;
    ppDBImage3: TppDBImage;
    qryHistoricosPLANPRVCONTABPATRO: TStringField;
    //AL_3
    qryBoletasPLANPRVCONTABPATRO: TStringField;
    //AL_3
    ppGroup2: TppGroup;
    ppGroupHeaderBand2: TppGroupHeaderBand;
    ppGroupFooterBand2: TppGroupFooterBand;
    ppdbPlanoPatro: TppDBText;
    procedure qryBoletasAfterScroll(DataSet: TDataSet);
    procedure qryBoletasAfterOpen(DataSet: TDataSet);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  DmRelLanContRVOPE: TDmRelLanContRVOPE;

const
  clCorAmarelo: TColor = $00C0FFFF;

implementation

uses UOperComum;

{$R *.DFM}

procedure TDmRelLanContRVOPE.qryBoletasAfterScroll(DataSet: TDataSet);
var iInvestimento: Integer;
    clCorLinha: TColor;
begin
   inherited;
   qryHistoricos.Filter := 'IDBOLETA = ''' + qryBoletasIDBOLETA.AsString + '''';

   if qryHistoricos.Active then
   begin
      qryHistoricos.First;
      iInvestimento := 0;
      clCorLinha := clWhite;
      while not qryHistoricos.Eof do
      begin
         if not (qryHistoricosIDINVESTIMENTO.AsInteger = iInvestimento) then
         begin
            if clCorLinha = clCorAmarelo then
               clCorLinha := clWhite
            else
               clCorLinha := clCorAmarelo;

            iInvestimento := qryHistoricosIDINVESTIMENTO.AsInteger;
         end;

         qryHistoricos.Edit;
         qryHistoricosCOR.AsInteger := clCorLinha;
         qryHistoricos.Post;

         qryHistoricos.Next;
      end;
      qryHistoricos.First;
   end;

   OperComum.LimpaParametros(qryLancamento);
   qryLancamento.ParamByName('PLNCODIGO').AsInteger := qryBoletasPLNCODIGO.AsInteger;
   qryLancamento.Open;

end;

procedure TDmRelLanContRVOPE.qryBoletasAfterOpen(DataSet: TDataSet);
begin
  inherited;
  qryHistoricos.Filter := 'IDBOLETA = ''' + qryBoletasIDBOLETA.AsString + '''';
  OperComum.LimpaParametros(qryLancamento);
  qryLancamento.ParamByName('PLNCODIGO').AsInteger := qryBoletasPLNCODIGO.AsInteger;
  qryLancamento.Open;
end;

end.
