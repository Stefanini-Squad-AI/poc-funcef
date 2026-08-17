// *****************************************************************************
// ***************************** REGISTRO DE ALTERAÇÕES ************************
// *****************************************************************************
// Autor(a)    :  Everson Luiz Pereira da Cunha
// Data        :  05/06/2018
// Pendência   :  SIG TIBERO
// Descricao   :  Retirada do 'NLS_DATE_LANGUAGE = portuguese'
//------------------------------------------------------------------------------

unit RProgTipo;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs, FCmReport,
  uCmRptManager, TXComp, CmParamReport, ppBands, ppCache, ppClass, ppProd, ppReport, ppDB,
  ppComm, ppRelatv, ppDBPipe, ppDBBDE, Db, Wwdatsrc, DBClient, uCMClientDataSet, uCmSqlParams,
  ppCtrls, ppPrnabl, uCtrlPadroes, uCtrlRegOcorr;

type
  TRptProgTipo = class(TFrmCmReport)
    sqlProgTipo: TCMSqlParams;
    CdsProgTipo: TCMClientDataSet;
    dsProgTipo: TwwDataSource;
    ppProgTipo: TppBDEPipeline;
    rpProgTipo: TppReport;
    rpProgTipoDtlBnd: TppDetailBand;
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
    ppGroup1: TppGroup;
    ppGroupHeaderBand1: TppGroupHeaderBand;
    ppGroupFooterBand1: TppGroupFooterBand;
    ppDBText6: TppDBText;
    ppLabel8: TppLabel;
    ppDBText7: TppDBText;
    rpProgTipoLblObserv: TppLabel;
    procedure CrmRptCMBeforePrint(Sender: TObject);
    procedure rpProgTipoDtlBndBeforePrint(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure FormDestroy(Sender: TObject);
    procedure CdsProgTipoAfterOpen(DataSet: TDataSet);
    procedure CdsProgTipoAfterScroll(DataSet: TDataSet);
    procedure rpProgTipoSmryBndAfterPrint(Sender: TObject);
  private
    CtrlRegOcorr: TCtrlRegOcorr;
  end;

var
  RptProgTipo: TRptProgTipo;

implementation

uses dCds, fAguarde;

{$R *.DFM}

procedure TRptProgTipo.FormCreate(Sender: TObject);
begin
  inherited;
  if (CmpRptCM.ParamByName('CriaPrograma').asInteger = 0) then
  begin
    CtrlRegOcorr := TCtrlRegOcorr.Create;
    CtrlRegOcorr.InitializeAs(Padroes);
    CtrlRegOcorr.CdsHstAsMed := TCMClientDataSet(dmCds.Cds);
  end;
end;

procedure TRptProgTipo.FormDestroy(Sender: TObject);
begin
  if (CmpRptCM.ParamByName('CriaPrograma').asInteger = 0) then
    FreeAndNil(CtrlRegOcorr);
  inherited;
end;

procedure TRptProgTipo.CrmRptCMBeforePrint(Sender: TObject);
begin
  inherited;
  with (sqlProgTipo.SQL) do
  begin
    Clear;
    Add('SELECT');
    Add('  PJ. RAZAOSOCIAL AS EMPRESA, PF.NOME AS EMPREGADO, C.TITULO AS CARGO,');
    Add('  TP.DESCRTIPOOCMED AS DESCRICAO, TP.CODTIPOOCMED,');
    Add('  PR.DATPLAN, F.IDPESSOA');

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
      Add('  DESCRICAO, EMPREGADO, PR.DATPLAN')
    else
      Add('  DESCRICAO, PR.DATPLAN, EMPREGADO');

    SaveToFile('c:\qry.txt');
  end;
  sqlProgTipo.Open;
end;

procedure TRptProgTipo.rpProgTipoDtlBndBeforePrint(Sender: TObject);
begin
  if (CdsProgTipo.IsEmpty) then
    exit;

  with (sqlAux.SQL) do
  begin
    Clear;
    Add('SELECT');
    Add('  IDPESSOA');
    Add('FROM');
    Add('  HSTASMED');
    Add('WHERE');
    Add('  (IDPESSOA     = ' +CdsProgTipo.FieldByName('IdPessoa').asString+ ') AND');
    Add('  (DATAREAL    IS NULL) AND');    
    Add('  (CODTIPOOCMED = ' +CdsProgTipo.FieldByName('CODTIPOOCMED').asString+ ') AND');
    Add('  (DATAPLAN     = TO_DATE(' +QuotedStr(CdsProgTipo.FieldByName('DatPlan').asString)+
//      ',''DD/MM/YYYY HH24:MI:SS'', ''NLS_DATE_LANGUAGE = Portuguese''))'); //Everson TIBERO
        ',''DD/MM/YYYY HH24:MI:SS''))');                                     //Everson TIBERO
  end;
  sqlAux.Open;

  rpProgTipoLblObserv.Caption := '';
  if not(CdsAux.IsEmpty) then
    rpProgTipoLblObserv.Caption := 'Programado'
  else
  if (CmpRptCM.ParamByName('CriaPrograma').asInteger = 0) then // Gravação
  begin
    dmCds.Cds.Data := CtrlRegOcorr.ListRegOcorr(-1);
    with (dmCds.Cds) do
    begin
      Insert;
      FieldByName('NUMSEQ').asInteger := CtrlRegOcorr.GetProxNumSeq(
        CdsProgTipo.FieldByName('IdPessoa').asFloat,
        CdsProgTipo.FieldByName('CODTIPOOCMED').asInteger);
      FieldByName('IdPessoa').asFloat := CdsProgTipo.FieldByName('IdPessoa').asFloat;
      FieldByName('CODTIPOOCMED').asInteger := CdsProgTipo.FieldByName('CODTIPOOCMED').asInteger;
      FieldByName('DATAPLAN').asString := CdsProgTipo.FieldByName('DATPLAN').asString;
      Post;
    end;

    if (CtrlRegOcorr.GravarRegOcorr) then
      rpProgTipoLblObserv.Caption := 'Progr. Agora';
  end
  else
    rpProgTipoLblObserv.Caption := 'A Programar';
end;

procedure TRptProgTipo.CdsProgTipoAfterOpen(DataSet: TDataSet);
begin
  frmAguarde.Max := DataSet.RecordCount;
  frmAguarde.Min := 0;
end;

procedure TRptProgTipo.CdsProgTipoAfterScroll(DataSet: TDataSet);
begin
  frmAguarde.Pos := frmAguarde.Pos + 1;
  frmAguarde.Update;
end;

procedure TRptProgTipo.rpProgTipoSmryBndAfterPrint(Sender: TObject);
begin
  frmAguarde.Apaga;
end;

end.
