// *****************************************************************************
// ***************************** REGISTRO DE ALTERAÇÕES ************************
// *****************************************************************************
// Autor(a)    :  Ádler Teodoro de Souza
// Data        :  19/02/2009
// Pendência   : SOL 109421 KINTANA 496332
// Descricao   :  Alteração de gravação de arquivos de log na raiz do disco C: .
//------------------------------------------------------------------------------
unit RCadFormaCalc;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs, FCmReport, TXComp,
  uCmRptManager, CmParamReport, Db, Wwdatsrc, ppDB, ppComm, ppRelatv, ppDBPipe, ppDBBDE,
  ppMemo, DBClient, uCMClientDataSet, uCmSqlParams, ppBands, ppCtrls, ppClass, ppReport,
  ppStrtch, ppSubRpt, ppPrnabl, ppCache, ppProd, ppVar, DBTables, IvDictio, IvMulti, ppRichTx,
  TXRB;

type
  TRptCadFormaCalc = class(TFrmCmReport)
    rpCadFormaCalc: TppReport;
    rpCadFormaCalcHdrBnd: TppHeaderBand;
    ppLabel24: TppLabel;
    ppLabel27: TppLabel;
    ppLabel28: TppLabel;
    rpCadFormaCalcDBText25: TppDBText;
    rpCadFormaCalcSysVar1: TppSystemVariable;
    rpCadFormaCalcSysVar2: TppSystemVariable;
    rpCadFormaCalcDtlBnd: TppDetailBand;
    rpCadFormaCalcFootBnd: TppFooterBand;
    rpCadFormaCalcSmryBnd: TppSummaryBand;
    rpCadFormaCalcGroup1: TppGroup;
    rpCadFormaCalcGrpHdrBnd1: TppGroupHeaderBand;
    rpCadFormaCalcShape6: TppShape;
    rpCadFormaCalcShape4: TppShape;
    rpCadFormaCalcDBText26: TppDBText;
    rpCadFormaCalcDBText27: TppDBText;
    rpCadFormaCalcDBText2: TppDBText;
    rpCadFormaCalcDBText7: TppDBText;
    rpCadFormaCalcLabel1: TppLabel;
    rpCadFormaCalcLabel2: TppLabel;
    rpCadFormaCalcLabel3: TppLabel;
    rpCadFormaCalcLabel8: TppLabel;
    rpCadFormaCalcGrpFootBnd1: TppGroupFooterBand;
    ppCadFormaCalc: TppBDEPipeline;
    dsCadFormaCalc: TDataSource;
    sqlCadFormaCalc: TCMSqlParams;
    CdsCadFormaCalc: TCMClientDataSet;
    rpCadFormaCalcDbRcTxtExpressao: TppDBRichText;
    procedure CrmRptCMBeforePrint(Sender: TObject);
    procedure CdsCadFormaCalcAfterScroll(DataSet: TDataSet);
    procedure rpCadFormaCalcSmryBndAfterPrint(Sender: TObject);
  private
    procedure GerarDadosRelat;
  end;

var
  RptCadFormaCalc: TRptCadFormaCalc;

implementation

uses uSistema, fAguarde, uCtrlFuncoesRH, dCds;

{$R *.DFM}

procedure TRptCadFormaCalc.CrmRptCMBeforePrint(Sender: TObject);
begin
  inherited;
  with (dmCds.sql.SQL) do
  begin
    Clear;
    Add('SELECT');
    Add('  ' +QuotedStr(Sistema.NomeEmpresa)+ ' AS EMPRESA,');
    Add('  R.IDREGRA AS NUMERO,');
    Add('  R.NOMEREGRA AS NOME,');
    Add('  (CASE');
    Add('     WHEN R.PUBLICADA = 1 THEN ''SIM''');
    Add('     ELSE ''NÃO''');
    Add('   END) AS PUBLICADA,');
    Add('  TR.DESCREGRA AS TIPO,');
    Add('  R.DESCRICAOREGRA AS EXPRESSAO');
    Add('FROM');
    Add('  REGRA R, TIPOREGRA TR');
    Add('WHERE');

    // Forma(s) de Cálculo selecionada(s)
    if (Trim(CmpRptCM.ParamByName('ListaIdFormaCalc').asString) <> '') then
      Add(FU.MontaLinhaSelSQL('  (R.IDREGRA',CmpRptCM.ParamByName('ListaIdFormaCalc').asString, 8));

    // Tipo(s) de Forma(s) de Cálculo selecionado(s)
    if (Trim(CmpRptCM.ParamByName('ListaIdTipoFormaCalc').asString) <> '') then
      Add(FU.MontaLinhaSelSQL('  (R.IDTIPOREGRA',CmpRptCM.ParamByName('ListaIdTipoFormaCalc').asString, 4));

    // Situacao das Formas de Cálculo:
    //   Situacao = 0 --> Publicadas
    //   Situacao = 1 --> NÃO Publicadas
    //   Situacao = 2 --> Ambas
    case (CmpRptCM.ParamByName('SituacaoRubSel').asInteger) of
      0 : Add('  (R.PUBLICADA       = 1) AND');
      1 : Add('  (R.PUBLICADA       = 0) AND');
    end;

    Add('  (R.IDTIPOREGRA     = TR.IDTIPOREGRA) AND');
    Add('  (NOT          EXISTS (SELECT DISTINCT IDREGRA');
    Add('                        FROM   ALGREGRA A');
    Add('                        WHERE  (A.IDREGRA = R.IDREGRA)))');
    Add('ORDER BY');
    case (CmpRptCM.ParamByName('Ordenacao').asInteger) of
      0 : Add('  NUMERO, NOME');
      1 : Add('  NOME');
      2 : Add('  TIPO, NUMERO');
      3 : Add('  TIPO, NOME');
    end;
    //SaveToFile('c:\qry.txt');
    SaveToFile(Sistema.RetornaCaminhoArquivos(Sistema.IdEmpresa)+'\qry.txt');//Ádler Teodoro de Souza SOL 109421 KINTANA 496332
  end;
  GerarDadosRelat;
  frmAguarde.Min := 0;
  frmAguarde.Max := CdsCadFormaCalc.RecordCount;
end;

procedure TRptCadFormaCalc.CdsCadFormaCalcAfterScroll(DataSet: TDataSet);
begin
  frmAguarde.Pos := frmAguarde.Pos + 1;
  frmAguarde.Update;
end;

procedure TRptCadFormaCalc.rpCadFormaCalcSmryBndAfterPrint(Sender: TObject);
begin
  frmAguarde.Apaga;
end;

procedure TRptCadFormaCalc.GerarDadosRelat;
var
  c: byte;
begin
  dmCds.sql.Open;
  CdsCadFormaCalc.Data := dmCds.Cds.Data;
  CdsCadFormaCalc.EmptyDataSet;
  while not(dmCds.Cds.EOF) do
  begin
    if (Trim(dmCds.Cds.FieldByName('EXPRESSAO').asString) <> '') and
       ((CmpRptCM.ParamByName('Expressao').asString = '') or
        (Pos(CmpRptCM.ParamByName('Expressao').asString,
             Trim(dmCds.Cds.FieldByName('EXPRESSAO').asString)) > 0)) then
    begin
      CdsCadFormaCalc.Append;
      for c:=0 to CdsCadFormaCalc.FieldCount-1 do
        CdsCadFormaCalc.Fields[c].Value := dmCds.Cds.Fields[c].Value;
      CdsCadFormaCalc.Post;
    end;
    dmCds.Cds.Next;
  end;
end;

end.
