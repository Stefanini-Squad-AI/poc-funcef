// *****************************************************************************
// ***************************** REGISTRO DE ALTERAÇÕES ************************
// *****************************************************************************
// Autor(a)    :  Ádler Teodoro de Souza
// Data        :  19/02/2009
// Pendência   : SOL 109421 KINTANA 496332
// Descricao   :  Alteração de gravação de arquivos de log na raiz do disco C: .
//------------------------------------------------------------------------------
unit RConsAnalCPMF;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  FCmReport, uCmRptManager, TXComp, CmParamReport, Db, DBTables, Wwquery,
  Wwdatsrc, ppComm, ppRelatv, ppDB, ppDBPipe, ppDBBDE, ppVar, ppCtrls,
  ppBands, ppPrnabl, ppClass, ppCache, ppProd, ppReport, TXRB, USistema;

type
  TRptConsAnalCPMF = class(TFrmCmReport)
    PpConsCPMF: TppBDEPipeline;
    DsConsCPMF: TwwDataSource;
    QryConsCPMF: TwwQuery;
    RptConsCpmf: TppReport;
    HeaderBand1: TppHeaderBand;
    LblEmpresa: TppLabel;
    DetRateio: TppDetailBand;
    FooterBand1: TppFooterBand;
    Line2: TppLine;
    LblSistema: TppLabel;
    Calc2: TppSystemVariable;
    Calc1: TppSystemVariable;
    ppLabel1: TppLabel;
    QryConsCPMFDATAPROGRAMADA: TDateTimeField;
    QryConsCPMFRAZAOSOCIAL: TStringField;
    QryConsCPMFIDPESSOA: TFloatField;
    QryConsCPMFCODDOCUMENTO: TFloatField;
    QryConsCPMFNODOCUMENTO: TFloatField;
    QryConsCPMFCOMPLDOCUMENTO: TStringField;
    QryConsCPMFNUMLOTE: TFloatField;
    QryConsCPMFTIPOLOTE: TStringField;
    ppGroup1: TppGroup;
    ppGroupHeaderBand1: TppGroupHeaderBand;
    ppGroupFooterBand1: TppGroupFooterBand;
    ppLabel2: TppLabel;
    ppLabel3: TppLabel;
    ppLabel4: TppLabel;
    ppLabel5: TppLabel;
    ppLabel6: TppLabel;
    ppDBText2: TppDBText;
    ppDBText3: TppDBText;
    ppLabel7: TppLabel;
    ppLabel8: TppLabel;
    ppDBText1: TppDBText;
    ppLabel9: TppLabel;
    ppDBText4: TppDBText;
    ppDBText5: TppDBText;
    ppDBText6: TppDBText;
    QryConsCPMFVALOR: TFloatField;
    QryConsCPMFVLRPREVISTO: TFloatField;
    QryConsCPMFVLREFETIVO: TFloatField;
    ppDBText7: TppDBText;
    ppDBText8: TppDBText;
    ppLabel10: TppLabel;
    ppDBText9: TppDBText;
    ppDBCalc1: TppDBCalc;
    ppDBCalc2: TppDBCalc;
    ppDBCalc3: TppDBCalc;
    ppGroup2: TppGroup;
    ppGroupHeaderBand2: TppGroupHeaderBand;
    ppGroupFooterBand2: TppGroupFooterBand;
    ppLine1: TppLine;
    ppLabel11: TppLabel;
    ppDBText10: TppDBText;
    ppDBCalc4: TppDBCalc;
    ppDBCalc5: TppDBCalc;
    ppDBCalc6: TppDBCalc;
    ppSummaryBand1: TppSummaryBand;
    ppLabel12: TppLabel;
    ppDBCalc7: TppDBCalc;
    ppDBCalc8: TppDBCalc;
    ppDBCalc9: TppDBCalc;
    QryConsCPMFDATARETENCAO: TDateTimeField;
    procedure CrmRptCMChangeDataBaseName(Sender: TObject;
      sDataBaseName: String);
    procedure CrmRptCMBeforePrint(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  RptConsAnalCPMF: TRptConsAnalCPMF;

implementation

{$R *.DFM}

procedure TRptConsAnalCPMF.CrmRptCMChangeDataBaseName(Sender: TObject;
  sDataBaseName: String);
begin                                                          
  inherited;
  If QryConsCPMF.Active Then QryConsCPMF.Close;
  QryConsCPMF.DataBaseName := sDataBaseName;
end;

procedure TRptConsAnalCPMF.CrmRptCMBeforePrint(Sender: TObject);
Var
  sLinhaFiltro: String;
  X: Integer;
  bFiltraPorData, bFiltraPorLote: Boolean;
begin
  inherited;
  {**
    -- #INSERENUMLOTEMANUAL
    -- #INSERENUMLOTE

    Marcas para inserção de números do lote para o filtro do relatório.
    Caso o filtro seja pelo número do lote, desconsiderar a data.
    Caso o filtro seja pela data selecionar os números de lote manual ou
    lote emitidos com data de retenção até aquela data
  **}

  If QryConsCPMF.Active Then QryConsCPMF.Close;

  bFiltraPorData := Not CmpRptCM.ParamValues[0].IsNull;
  bFiltraPorLote := Not CmpRptCM.ParamValues[1].IsNull;

  X := QryConsCPMF.SQL.IndexOf('-- #INSERENUMLOTE');
  If X <> -1 Then
  Begin
     sLinhaFiltro := '';

     If bFiltraPorData Then
        sLinhaFiltro := ' I.DATARETENCAO ' + CmpRptCM.ParamValues[0].Comparador + ' TO_DATE(' + QuotedStr(CmpRptCM.ParamValues[0].AsString) + ',' + QuotedStr('DD/MM/YYYY') + ') AND ';

     If bFiltraPorLote Then
        sLinhaFiltro := sLinhaFiltro + ' LP.NUMLOTE ' + CmpRptCM.ParamValues[1].Comparador + ' ' + CmpRptCM.ParamValues[1].AsString + ' AND ';

     QryConsCPMF.SQL[x] := sLinhaFiltro;
  End;

  X := QryConsCPMF.SQL.IndexOf('-- #INSERENUMLOTE');
  If X <> -1 Then
  Begin
     sLinhaFiltro := '';

     If bFiltraPorData Then
        sLinhaFiltro := ' I.DATARETENCAO ' + CmpRptCM.ParamValues[0].Comparador + ' TO_DATE(' + QuotedStr(CmpRptCM.ParamValues[0].AsString) + ',' + QuotedStr('DD/MM/YYYY') + ') AND ';

     If bFiltraPorLote Then
        sLinhaFiltro := sLinhaFiltro + ' LP.NUMLOTE ' + CmpRptCM.ParamValues[1].Comparador + ' ' + CmpRptCM.ParamValues[1].AsString + ' AND ';

     QryConsCPMF.SQL[x] := sLinhaFiltro;
  End;

  X := QryConsCPMF.SQL.IndexOf('-- #INSERENUMLOTEMANUAL');
  If X <> -1 Then
  Begin
     sLinhaFiltro := '';

     If bFiltraPorData Then
        sLinhaFiltro := ' I.DATARETENCAO ' + CmpRptCM.ParamValues[0].Comparador + ' TO_DATE(' + QuotedStr(CmpRptCM.ParamValues[0].AsString) + ',' + QuotedStr('DD/MM/YYYY') + ') AND ';

     If bFiltraPorLote Then
        sLinhaFiltro := sLinhaFiltro + ' LB.NUMLOTEMANUAL ' + CmpRptCM.ParamValues[1].Comparador + ' ' + CmpRptCM.ParamValues[1].AsString + ' AND ';

     QryConsCPMF.SQL[x] := sLinhaFiltro;
  End;

  X := QryConsCPMF.SQL.IndexOf('-- #INSERENUMLOTEMANUAL');
  If X <> -1 Then
  Begin
     sLinhaFiltro := '';

     If bFiltraPorData Then
        sLinhaFiltro := ' I.DATARETENCAO ' + CmpRptCM.ParamValues[0].Comparador + ' TO_DATE(' + QuotedStr(CmpRptCM.ParamValues[0].AsString) + ',' + QuotedStr('DD/MM/YYYY') + ') AND ';

     If bFiltraPorLote Then
        sLinhaFiltro := sLinhaFiltro + ' LB.NUMLOTEMANUAL ' + CmpRptCM.ParamValues[1].Comparador + ' ' + CmpRptCM.ParamValues[1].AsString + ' AND ';

     QryConsCPMF.SQL[x] := sLinhaFiltro;
  End;


  //QryConsCPMF.Sql.SaveToFile('C:\CPMF.TXT');
  QryConsCPMF.Sql.SaveToFile(Sistema.RetornaCaminhoArquivos(Sistema.IdEmpresa) + '\CPMF.TXT');//Ádler Teodoro de Souza SOL 109421 KINTANA 496332
end;

end.
