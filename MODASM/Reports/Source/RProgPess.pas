// *****************************************************************************
// ***************************** REGISTRO DE ALTERAÇÕES ************************
// *****************************************************************************
// Autor(a)    :  Everson Luiz Pereira da Cunha
// Data        :  05/06/2018
// Pendência   :  SIG TIBERO
// Descricao   :  Retirada do 'NLS_DATE_LANGUAGE = portuguese'
//------------------------------------------------------------------------------
// Autor(a)    :  Ádler Teodoro de Souza
// Data        :  27/02/2009
// Pendência   : SOL 109421 KINTANA 496332
// Descricao   :  Alteração de gravação de arquivos de log na raiz do disco C: .
//------------------------------------------------------------------------------
unit RProgPess;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs, FCmReport,
  uCmRptManager, TXComp, CmParamReport, ppBands, ppCache, ppClass, ppProd, ppReport, ppDB,
  ppComm, ppRelatv, ppDBPipe, ppDBBDE, Db, Wwdatsrc, DBClient, uCMClientDataSet, uCmSqlParams,
  ppCtrls, ppPrnabl, uCtrlPadroes, uCtrlRegOcorr, TXRB, USistema;

type
  TRptProgPess = class(TFrmCmReport)
    sqlProgPess: TCMSqlParams;
    CdsProgPess: TCMClientDataSet;
    dsProgPess: TwwDataSource;
    ppProgPess: TppBDEPipeline;
    rpProgPess: TppReport;
    rpProgPessDtlBnd: TppDetailBand;
    rpProgTipoSmryBnd: TppSummaryBand;
    CdsAux: TCMClientDataSet;
    sqlAux: TCMSqlParams;
    ppHeaderBand1: TppHeaderBand;
    ppDBText1: TppDBText;
    ppLabel1: TppLabel;
    ppLabel2: TppLabel;
    ppDBText2: TppDBText;
    ppLabel3: TppLabel;
    ppLabel4: TppLabel;
    ppLabel5: TppLabel;
    ppLabel6: TppLabel;
    ppLine1: TppLine;
    ppDBText3: TppDBText;
    ppDBText4: TppDBText;
    ppDBText5: TppDBText;
    ppDBText6: TppDBText;
    ppLabel8: TppLabel;
    ppDBText7: TppDBText;
    ppGroup2: TppGroup;
    ppGroupHeaderBand2: TppGroupHeaderBand;
    ppGroupFooterBand2: TppGroupFooterBand;
    rpProgPessLblObserv: TppLabel;
    procedure CrmRptCMBeforePrint(Sender: TObject);
    procedure rpProgPessDtlBndBeforePrint(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure FormDestroy(Sender: TObject);
    procedure CdsProgPessAfterOpen(DataSet: TDataSet);
    procedure CdsProgPessAfterScroll(DataSet: TDataSet);
    procedure rpProgTipoSmryBndAfterPrint(Sender: TObject);
  private
    CtrlRegOcorr: TCtrlRegOcorr;
  end;

var
  RptProgPess: TRptProgPess;

implementation

uses dCds, fAguarde;

{$R *.DFM}

procedure TRptProgPess.FormCreate(Sender: TObject);
begin
  inherited;
  if (CmpRptCM.ParamByName('CriaPrograma').asInteger = 0) then
  begin
    CtrlRegOcorr := TCtrlRegOcorr.Create;
    CtrlRegOcorr.InitializeAs(Padroes);
    CtrlRegOcorr.CdsHstAsMed := TCMClientDataSet(dmCds.Cds);
  end;
end;

procedure TRptProgPess.FormDestroy(Sender: TObject);
begin
  if (CmpRptCM.ParamByName('CriaPrograma').asInteger = 0) then
    FreeAndNil(CtrlRegOcorr);
  inherited;
end;

procedure TRptProgPess.CrmRptCMBeforePrint(Sender: TObject);
begin
  inherited;
  with (sqlProgPess.SQL) do
  begin
    Clear;
    Add('SELECT');
    Add('  PJ. RAZAOSOCIAL AS EMPRESA, PF.NOME AS EMPREGADO, C.TITULO AS CARGO,');
    Add('  TP.DESCRTIPOOCMED AS DESCRICAO, TP.CODTIPOOCMED, PR.DATPLAN, F.IDPESSOA');

    if (CmpRptCM.ParamByName('DataIni').asString <> '') then
      Add(',' +QuotedStr(CmpRptCM.ParamByName('DataIni').asString)+ ' AS PERIODOINI, '+
        QuotedStr(CmpRptCM.ParamByName('DatafIM').asString)+ ' AS PERIODOFIM');

    Add('FROM');
    Add('  PESSOA PJ, PESSOA PF, FUNCIONARIO F, CARGO C, TIPOCMED TP,');
    // --------------------------------------------------------------------------------------
    Add('  (');
    Add('    (SELECT F.IDPESSOA, PE.CODTIPOOCMED,');

    if (CmpRptCM.ParamByName('DataIni').asString <> '') then
    begin
      Add('       ADD_MONTHS(DECODE(DT.ULTDATA,NULL,F.DATAADMISSAO,DT.ULTDATA),');
      Add('         TRUNC((TO_DATE(' +QuotedStr(CmpRptCM.ParamByName('DataFim').asString)+
          ',''DD/MM/YYYY'') - DECODE(DT.ULTDATA,NULL,F.DATAADMISSAO,DT.ULTDATA) + 1) /');
      Add('         365.25 * 12 /PE.PERIODO) * PE.PERIODO) AS DATPLAN');
    end
    else
      Add('       ADD_MONTHS(DECODE(DT.ULTDATA,NULL,F.DATAADMISSAO,DT.ULTDATA), PE.PERIODO) AS DATPLAN');

    Add('     FROM PESSOAFISICA PFIS, FUNCIONARIO F, PEREXAME PE,');
    Add('       (SELECT TP.CODTIPOOCMED, H.IDPESSOA, H.ULTDATA');
    Add('        FROM   TIPOCMED TP,');
    Add('          (SELECT IDPESSOA, CODTIPOOCMED, MAX(DATAREAL) AS ULTDATA');
    Add('           FROM   HSTASMED');
    Add('           GROUP BY IDPESSOA, CODTIPOOCMED) H');
    Add('        WHERE');
    Add('          (TP.FLGTIPOCOR   = 0) AND');
    Add('          (TP.CODTIPOOCMED = H.CODTIPOOCMED(+))) DT');
    Add('     WHERE');
    Add('       ((PE.CODTIPOOCMED = DT.CODTIPOOCMED) OR');
    Add('        (NOT EXISTS (SELECT IDPESSOA');
    Add('                     FROM   HSTASMED');
    Add('                     WHERE');
    Add('                       (IDPESSOA     = F.IDPESSOA) AND');
    Add('                       (CODTIPOOCMED = PE.CODTIPOOCMED)))) AND');
    Add('       (F.IDPESSOA  = PFIS.IDPESSOA) AND');
    Add('       (PE.IDCARGO IS NULL OR PE.IDCARGO = F.IDCARGO) AND');
    Add('       (F.IDPESSOA  = DT.IDPESSOA(+)) AND');
    Add('       (TRUNC((SYSDATE-1-DECODE(PE.INDTEMPO,1,PFIS.DATANASC,F.DATAADMISSAO))/365.25) >= PE.LIMINFERIOR) AND');
    Add('       (TRUNC((SYSDATE-1-DECODE(PE.INDTEMPO,1,PFIS.DATANASC,F.DATAADMISSAO))/365.25) <= PE.LIMSUPERIOR)');
    Add('    )');
    Add('    UNION');
    Add('    (SELECT H.IDPESSOA, H.CODTIPOOCMED, H.DATAPLAN AS DATPLAN');
    Add('     FROM   HSTASMED H, TIPOCMED TP');
    Add('     WHERE');
    Add('       (H.DATAREAL   IS NULL) AND');
    Add('       (H.DATAPLAN   IS NOT NULL) AND');
    Add('       (TP.FLGTIPOCOR = 0) AND');

    if (CmpRptCM.ParamByName('DataIni').asString <> '') then
      Add('       (H.DATAPLAN BETWEEN TO_DATE(' +
        QuotedStr(CmpRptCM.ParamByName('DataIni').asString)+ ',''DD/MM/YYYY'') AND TO_DATE('+
        QuotedStr(CmpRptCM.ParamByName('DataFim').asString)+ ',''DD/MM/YYYY'')) AND');

    Add('       (TP.CODTIPOOCMED = H.CODTIPOOCMED)');
    Add('    )');
    Add('  ) PR');
    // --------------------------------------------------------------------------------------
    Add('WHERE');

    if (Trim(CmpRptCM.ParamByName('ListaTipoOcorr').asString) <> '') then
      if (Pos(',', CmpRptCM.ParamByName('ListaTipoOcorr').asString) > 0) then
        Add('  (TP.CODTIPOOCMED IN (' +CmpRptCM.ParamByName('ListaTipoOcorr').asString+ ')) AND')
      else
        Add('  (TP.CODTIPOOCMED  = ' +CmpRptCM.ParamByName('ListaTipoOcorr').asString+ ') AND');

    if (Trim(CmpRptCM.ParamByName('ListaIdFunc').asString) <> '') then
      if (Pos(',', CmpRptCM.ParamByName('ListaIdFunc').asString) > 0) then
        Add('  (F.IDPESSOA      IN (' +CmpRptCM.ParamByName('ListaIdFunc').asString+ ')) AND')
      else
        Add('  (F.IDPESSOA       = ' +CmpRptCM.ParamByName('ListaIdFunc').asString+ ') AND');

    if (CmpRptCM.ParamByName('DataIni').asString <> '') then
      Add('  (PR.DATPLAN BETWEEN TO_DATE(' +
        QuotedStr(CmpRptCM.ParamByName('DataIni').asString)+ ',''DD/MM/YYYY'') AND TO_DATE('+
        QuotedStr(CmpRptCM.ParamByName('DataFim').asString)+ ',''DD/MM/YYYY'')) AND');

    Add('  (TP.CODTIPOOCMED = PR.CODTIPOOCMED) AND');
    Add('  (PR.IDPESSOA     = F.IDPESSOA) AND');
    Add('  (F.IDCARGO       = C.IDCARGO) AND');
    Add('  (F.IDPESSOA      = PF.IDPESSOA) AND');
    Add('  (F.IDESTAB       = PJ.IDPESSOA)');
    Add('ORDER BY');
    
    if (CmpRptCM.ParamByName('SeqRelat').asInteger = 0) then
      Add('  EMPREGADO, PR.DATPLAN, DESCRICAO')
    else
      Add('  EMPREGADO, DESCRICAO, PR.DATPLAN');

    //SaveToFile('c:\qry.txt');
    SaveToFile(Sistema.RetornaCaminhoArquivos(Sistema.IdEmpresa)+'\qry.txt');//Ádler Teodoro de Souza SOL 109421 KINTANA 496332
  end;
  sqlProgPess.Open;
end;

procedure TRptProgPess.rpProgPessDtlBndBeforePrint(Sender: TObject);
begin
  if (CdsProgPess.IsEmpty) then
    exit;

  with (sqlAux.SQL) do
  begin
    Clear;
    Add('SELECT');
    Add('  IDPESSOA');
    Add('FROM');
    Add('  HSTASMED');
    Add('WHERE');
    Add('  (IDPESSOA     = ' +CdsProgPess.FieldByName('IdPessoa').asString+ ') AND');
    Add('  (DATAREAL    IS NULL) AND');    
    Add('  (CODTIPOOCMED = ' +CdsProgPess.FieldByName('CODTIPOOCMED').asString+ ') AND');
    Add('  (DATAPLAN     = TO_DATE(' +QuotedStr(CdsProgPess.FieldByName('DatPlan').asString)+
//      ',''DD/MM/YYYY HH24:MI:SS'', ''NLS_DATE_LANGUAGE = Portuguese''))'); //Everson TIBERO
        ',''DD/MM/YYYY HH24:MI:SS''))');                                     //Everson TIBERO
  end;
  sqlAux.Open;

  rpProgPessLblObserv.Caption := '';
  if not(CdsAux.IsEmpty) then
    rpProgPessLblObserv.Caption := 'Programado'
  else
  if (CmpRptCM.ParamByName('CriaPrograma').asInteger = 0) then // Gravação
  begin
    dmCds.Cds.Data := CtrlRegOcorr.ListRegOcorr(-1);
    with (dmCds.Cds) do
    begin
      Insert;
      FieldByName('NUMSEQ').asInteger := CtrlRegOcorr.GetProxNumSeq(
        CdsProgPess.FieldByName('IdPessoa').asFloat,
        CdsProgPess.FieldByName('CODTIPOOCMED').asInteger);
      FieldByName('IdPessoa').asFloat := CdsProgPess.FieldByName('IdPessoa').asFloat;
      FieldByName('CODTIPOOCMED').asInteger := CdsProgPess.FieldByName('CODTIPOOCMED').asInteger;
      FieldByName('DATAPLAN').asString := CdsProgPess.FieldByName('DATPLAN').asString;
      Post;
    end;

    if (CtrlRegOcorr.GravarRegOcorr) then
      rpProgPessLblObserv.Caption := 'Progr. Agora';
  end
  else
    rpProgPessLblObserv.Caption := 'A Programar';
end;

procedure TRptProgPess.CdsProgPessAfterOpen(DataSet: TDataSet);
begin
  frmAguarde.Max := DataSet.RecordCount;
  frmAguarde.Min := 0;
end;

procedure TRptProgPess.CdsProgPessAfterScroll(DataSet: TDataSet);
begin
  frmAguarde.Pos := frmAguarde.Pos + 1;
  frmAguarde.Update;
end;

procedure TRptProgPess.rpProgTipoSmryBndAfterPrint(Sender: TObject);
begin
  frmAguarde.Apaga;
end;

end.
