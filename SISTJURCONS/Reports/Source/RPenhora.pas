// *****************************************************************************
// ***************************** REGISTRO DE ALTERAÇÕES ************************
// *****************************************************************************
// Autor(a)    :  Ádler Teodoro de Souza
// Data        :  27/02/2009
// Pendência   : SOL 109421 KINTANA 496332
// Descricao   :  Alteração de gravação de arquivos de log na raiz do disco C: .
//------------------------------------------------------------------------------
unit RPenhora;
//4519
interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  FCmReport, uCmRptManager, TXComp, CmParamReport, uCmSqlParams, Db,
  DBClient, uCMClientDataSet, Wwdatsrc, ppDB, ppDBPipe, ppDBBDE, ppCtrls,
  ppBands, ppClass, ppStrtch, ppMemo, ppVar, ppPrnabl, ppCache, ppComm,
  ppRelatv, ppProd, ppReport, TXRB;

type
  TRptPenhora = class(TFrmCmReport)
    rpPenhora: TppReport;
    rpPenhoraHdrBnd: TppHeaderBand;
    rpPenhoraLbl1: TppLabel;
    rpPenhoraLbl2: TppLabel;
    rpPenhoraLbl3: TppLabel;
    rpPenhoraLbl4: TppLabel;
    rpPenhoraLbl5: TppLabel;
    rpPenhoraLine1: TppLine;
    rpPenhoraDBTxt1: TppDBText;
    rpPenhoraLbl6: TppLabel;
    rpPenhoraSysVar1: TppSystemVariable;
    rpPenhoraSysVar2: TppSystemVariable;
    rpPenhoraDtlBnd: TppDetailBand;
    rpPenhoraDBTxt3: TppDBText;
    rpPenhoraDBTxt2: TppDBText;
    rpPenhoraFootBnd: TppFooterBand;
    rpPenhoraSmryBnd: TppSummaryBand;
    rpPenhoraGrp1: TppGroup;
    rpPenhoraGrpHdrBnd: TppGroupHeaderBand;
    rpPenhoraGrpFootBnd: TppGroupFooterBand;
    rpPenhoraLbl7: TppLabel;
    rpPenhoraDBCalc1: TppDBCalc;
    ppPenhora: TppBDEPipeline;
    dsPenhora: TwwDataSource;
    CdsPenhora: TCMClientDataSet;
    sqlPenhora: TCMSqlParams;
    ppLabel1: TppLabel;
    ppLabel2: TppLabel;
    ppDBText1: TppDBText;
    ppDBText2: TppDBText;
    dbTxtDiferenca: TppDBText;
    LblDesvio: TppLabel;
    procedure CrmRptCMBeforePrint(Sender: TObject);
    procedure CdsPenhoraAfterOpen(DataSet: TDataSet);
    procedure CdsPenhoraAfterScroll(DataSet: TDataSet);
    procedure rpPenhoraSmryBndAfterPrint(Sender: TObject);
    procedure rpPenhoraDtlBndBeforePrint(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  RptPenhora: TRptPenhora;

implementation

uses fAguarde, uSistema, uCtrlFuncoesRH;

{$R *.DFM}

procedure TRptPenhora.CrmRptCMBeforePrint(Sender: TObject);
begin
  inherited;
  LblDesvio.Caption := 'Desvio Acima de '+CmpRptCM.ParamByName('Desvio').asString+'%';
  
  with (sqlPenhora.SQL) do
  begin
    Clear;
    Add('SELECT');
    Add('  (' +QuotedStr(Sistema.NomeEmpresa)+ ') AS EMPRESA,');
    Add('  PT.PROCJCJNUM, P.NOME AS CONTRAPARTE, PT.NUMPROCTRAB,');
    Add('  OBJ.VALOR AS ESTIMADO, PNH.VALOR AS PENHORADO,');
    Add('  PNH.VALOR - OBJ.VALOR AS DIFERENCA');
    Add('FROM');
    Add('  PROCESSOTRAB PT, PESSOA P, ');
    Add('  (SELECT NUMPROCTRAB, SUM(VALORRECL * PERCORIG * PERCPROB / 10000) AS VALOR'); // CÁLCULO PARA FUNCEF
    Add('   FROM OBJPROCTRAB');
    Add('   WHERE');
    Add(FU.QuebrarListaFiltro(2,'(NUMPROCTRAB ', CmpRptCM.ParamByName('NumProcessos').asString, 500));
    Add('   GROUP BY NUMPROCTRAB) OBJ,');
    Add('  (SELECT NUMPROCTRAB, SUM(VALORREC) AS VALOR'); // CÁLCULO PARA FUNCEF
    Add('   FROM ETAPAPROCTRAB');
    Add('   WHERE');
    Add(FU.QuebrarListaFiltro(2,'(NUMPROCTRAB ', CmpRptCM.ParamByName('NumProcessos').asString, 500)+ ' AND');
    Add('    (FLGVALORABATE = 2)');
    Add('   GROUP BY NUMPROCTRAB) PNH');
    Add('WHERE');
    Add(FU.QuebrarListaFiltro(2,'(PT.NUMPROCTRAB ', CmpRptCM.ParamByName('NumProcessos').asString, 500)+ ' AND');
    Add('  (PT.IDRECLAMANTE = P.IDPESSOA) AND');
    Add('  (PT.NUMPROCTRAB  = PNH.NUMPROCTRAB) AND');
    Add('  (PNH.VALOR       > 0) AND');
    Add('  (OBJ.VALOR       > 0) AND');
    case (CmpRptCM.ParamByName('Selecao').asInteger) of
      0 : Add('  ((PNH.VALOR - OBJ.VALOR)*100/OBJ.VALOR > '+FU.OraNumero(CmpRptCM.ParamByName('Desvio').asString)+') AND');
      1 : Add('  ((OBJ.VALOR - PNH.VALOR)*100/OBJ.VALOR > '+FU.OraNumero(CmpRptCM.ParamByName('Desvio').asString)+') AND');
      2 : Add('  (ABS(PNH.VALOR - OBJ.VALOR)*100/OBJ.VALOR > '+FU.OraNumero(CmpRptCM.ParamByName('Desvio').asString)+') AND');
    end;
    Add('  (PT.NUMPROCTRAB = OBJ.NUMPROCTRAB(+))');
    Add('ORDER BY CONTRAPARTE');
    //SaveToFile('c:\qry.txt');
    SaveToFile(Sistema.RetornaCaminhoArquivos(Sistema.IdEmpresa)+'\qry.txt');//Ádler Teodoro de Souza SOL 109421 KINTANA 496332
  end;

  sqlPenhora.Open;

  frmAguarde.Mostra('Excesso ou Insuficiência de Penhora');
  frmAguarde.Pos := 0;
end;

procedure TRptPenhora.CdsPenhoraAfterOpen(DataSet: TDataSet);
begin
  inherited;
  frmAguarde.Max := DataSet.RecordCount;
  frmAguarde.Min := 0;
end;

procedure TRptPenhora.CdsPenhoraAfterScroll(DataSet: TDataSet);
begin
  inherited;
  frmAguarde.Pos := frmAguarde.Pos + 1;
  frmAguarde.Update;
end;

procedure TRptPenhora.rpPenhoraSmryBndAfterPrint(Sender: TObject);
begin
  inherited;
  frmAguarde.Apaga;
end;

procedure TRptPenhora.rpPenhoraDtlBndBeforePrint(Sender: TObject);
begin
  inherited;
  if CdsPenhora.FieldByName('DIFERENCA').asFloat < 0 then
    //dbTxtDiferenca.Font.Color := clRed
    dbTxtDiferenca.Left := 161.5
  else
    //dbTxtDiferenca.Font.Color := clBlack;
    dbTxtDiferenca.Left := 160;
end;

end.
