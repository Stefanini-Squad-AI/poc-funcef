unit RFichaProc_ModCon;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs, FCmReport, ppComm,
  ppRelatv, ppProd, ppClass, ppReport, uCmRptManager, TXComp, CmParamReport, ppDB, ppDBPipe,
  ppDBBDE, Db, Wwdatsrc, DBClient, uCMClientDataSet, uCmSqlParams, ppBands, ppCache, ppPrnabl,
  ppCtrls, DBTables, ppStrtch, ppSubRpt, ppMemo, uCtrlListTerceirosRH, uCtrlProcessoTrab,
  uCtrlCustomProcTrab, uCtrlHonorarioProcesso, uCtrlRateioProcTrab;

type
  TRptFichaProc_ModCon = class(TFrmCmReport)
    rpFichaProc: TppReport;
    sqlFichaProc: TCMSqlParams;
    CdsFichaProc: TCMClientDataSet;
    dsFichaProc: TwwDataSource;
    ppFichaProc: TppBDEPipeline;
    rpFichaProcHdrBnd: TppHeaderBand;
    rpFichaProcDtlBnd: TppDetailBand;
    rpFichaProcFootBnd: TppFooterBand;
    rpFichaProcSmryBnd: TppSummaryBand;
    lblFichaProcLbl_Titulo: TppLabel;
    lblFichaProcLbl_NomeEmpresa: TppLabel;
    rpFichaProcLbl1: TppLabel;
    rpFichaProcLbl2: TppLabel;
    rpFichaProcLbl3: TppLabel;
    rpFichaProcLbl4: TppLabel;
    rpFichaProcLbl5: TppLabel;
    rpFichaProcDBTxt1: TppDBText;
    rpFichaProcDBTxt2: TppDBText;
    rpFichaProcLbl_Escritorio: TppLabel;
    rpFichaProcDBTxt3: TppDBText;
    rpFichaProcDBTxt4: TppDBText;
    rpFichaProcLine1: TppLine;
    rpFichaProcLbl6: TppLabel;
    rpFichaProcLbl7: TppLabel;
    rpFichaProcLbl8: TppLabel;
    rpFichaProcLbl9: TppLabel;
    rpFichaProcLbl10: TppLabel;
    rpFichaProcDBTxt6: TppDBText;
    rpFichaProcDBTxt7: TppDBText;
    rpFichaProcDBTxt5: TppDBText;
    rpFichaProcDBTxt8: TppDBText;
    rpFichaProcLine2: TppLine;
    rpFichaProcDBImage1: TppDBImage;
    rpFichaProcGroup1: TppGroup;
    rpFichaProcGrpHdrBnd: TppGroupHeaderBand;
    rpFichaProcGrpFootBnd: TppGroupFooterBand;
    rpFichaProcLbl11: TppLabel;
    rpFichaProcLbl12: TppLabel;
    rpFichaProcLbl13: TppLabel;
    rpFichaProcLbl14: TppLabel;
    rpFichaProcLbl17: TppLabel;
    rpFichaProcLbl18: TppLabel;
    rpFichaProcDBTxt9: TppDBText;
    rpFichaProcDBTxt10: TppDBText;
    rpFichaProcDBTxt19: TppDBText;
    rpFichaProcDBTxt20: TppDBText;
    rpFichaProcDBTxt21: TppDBText;
    rpFichaProcDBTxt22: TppDBText;
    rpFichaProcDBTxt15: TppDBText;
    rpFichaProcDBTxt16: TppDBText;
    rpFichaProcDBTxt24: TppDBText;
    rpFichaProcDBTxt25: TppDBText;
    rpFichaProcDBTxt26: TppDBText;
    rpFichaProcDBTxt12: TppDBText;
    rpFichaProcDBTxt13: TppDBText;
    rpFichaProcDBTxt14: TppDBText;
    rpFichaProcDBTxt23: TppDBText;
    rpFichaProcLbl19: TppLabel;
    rpFichaProcDBTxt27: TppDBText;
    rpFichaProcLbl16: TppLabel;
    rpFichaProcDBTxt18: TppDBText;
    rpFichaProcLine3: TppLine;
    rpFichaProcLbl15: TppLabel;
    rpFichaProcDBTxt17: TppDBText;
    rpFichaProcLine4: TppLine;
    rpFichaProcLbl20: TppLabel;
    rpFichaProcDBTxt28: TppDBText;
    dsFichaProc1: TwwDataSource;
    ppFichaProc1: TppBDEPipeline;
    rpFichaProcSR1: TppSubReport;
    rpFichaProcCR1: TppChildReport;
    rpFichaProcSR1DtlBnd: TppDetailBand;
    rpFichaProcSR1DBTxt1: TppDBText;
    rpFichaProcSR1DBTxt2: TppDBText;
    rpFichaProcSR1DBTxt3: TppDBText;
    rpFichaProcSR1DBTxt4: TppDBText;
    rpFichaProcSR1DBTxt5: TppDBText;
    rpFichaProcGrp1: TppGroup;
    rpFichaProcSR1GrpHdrBnd: TppGroupHeaderBand;
    rpFichaProcSR1Lbl1: TppLabel;
    rpFichaProcSR1Lbl2: TppLabel;
    rpFichaProcSR1Lbl3: TppLabel;
    rpFichaProcSR1Lbl4: TppLabel;
    rpFichaProcSR1Lbl5: TppLabel;
    rpFichaProcSR1GrpFootBnd: TppGroupFooterBand;
    rpFichaProcSR2: TppSubReport;
    rpFichaProcCR2: TppChildReport;
    rpFichaProcSR2DtlBnd: TppDetailBand;
    rpFichaProcSR2DBTxt1: TppDBText;
    rpFichaProcSR2DBTxt2: TppDBText;
    rpFichaProcSR2DBTxt3: TppDBText;
    rpFichaProcSR2DBTxt4: TppDBText;
    rpFichaProcSR2DBTxt_Val_Real: TppDBText;
    rpFichaProcGroup2: TppGroup;
    rpFichaProcSR2GrpHdrBnd1: TppGroupHeaderBand;
    rpFichaProcSR2Lbl1: TppLabel;
    rpFichaProcSR2Lbl2: TppLabel;
    rpFichaProcSR2Lbl3: TppLabel;
    rpFichaProcSR2Lbl4: TppLabel;
    rpFichaProcSR2Lbl_Val_Real: TppLabel;
    rpFichaProcSR2GrpFootBnd1: TppGroupFooterBand;
    dsFichaProc2: TwwDataSource;
    ppFichaProc2: TppBDEPipeline;
    CdsFichaProc1: TCMClientDataSet;
    CdsFichaProc2: TCMClientDataSet;
    sqlFichaProc2: TCMSqlParams;
    rpFichaProcSR2DBCalc1: TppDBCalc;
    rpFichaProcSR2DBCalc2: TppDBCalc;
    rpFichaProcSR2DBCalc3: TppDBCalc;
    rpFichaProcSR2DBCalc_Val_Real: TppDBCalc;
    rpFichaProcSR2Lbl5: TppLabel;
    rpFichaProcSR2Line1: TppLine;
    rpFichaProcSR3: TppSubReport;
    rpFichaProcCR3: TppChildReport;
    rpFichaProcSR3DtlBnd: TppDetailBand;
    rpFichaProcSR3DBTxt1: TppDBText;
    rpFichaProcSR3DBTxt3: TppDBText;
    rpFichaProcSR3Lbl1: TppLabel;
    rpFichaProcSR3Lbl2: TppLabel;
    rpFichaProcSR3DBMemo1: TppDBMemo;
    rpFichaProcSR3TitBnd: TppTitleBand;
    rpFichaProcSR3DBTxt2: TppDBText;
    sqlFichaProc3: TCMSqlParams;
    CdsFichaProc3: TCMClientDataSet;
    dsFichaProc3: TwwDataSource;
    ppFichaProc3: TppBDEPipeline;
    rpFichaProcSR4: TppSubReport;
    rpFichaProcCR4: TppChildReport;
    rpFichaProcSR4TitBnd: TppTitleBand;
    rpFichaProcSR4Lbl1: TppLabel;
    rpFichaProcSR4DtlBnd: TppDetailBand;
    rpFichaProcSR4DBTxt1: TppDBText;
    rpFichaProcSR4DBTxt2: TppDBText;
    CdsFichaProc4: TCMClientDataSet;
    dsFichaProc4: TwwDataSource;
    ppFichaProc4: TppBDEPipeline;
    rpFichaProcSR4Lbl2: TppLabel;
    rpFichaProcSR4Lbl3: TppLabel;
    rpFichaProcSR5: TppSubReport;
    rpFichaProcCR5: TppChildReport;
    rpFichaProcSR5TitBnd: TppTitleBand;
    rpFichaProcSR5Lbl1: TppLabel;
    rpFichaProcSR5Lbl2: TppLabel;
    rpFichaProcSR5Lbl3: TppLabel;
    rpFichaProcSR5DtlBnd: TppDetailBand;
    rpFichaProcSR5DBTxt1: TppDBText;
    rpFichaProcSR5DBTxt2: TppDBText;
    CdsFichaProc5: TCMClientDataSet;
    dsFichaProc5: TwwDataSource;
    ppFichaProc5: TppBDEPipeline;
    CdsFichaProc6: TCMClientDataSet;
    dsFichaProc6: TwwDataSource;
    ppFichaProc6: TppBDEPipeline;
    rpFichaProcSR6: TppSubReport;
    rpFichaProcCR6: TppChildReport;
    rpFichaProcSR6TitBnd: TppTitleBand;
    rpFichaProcSR6Lbl1: TppLabel;
    rpFichaProcSR6DtlBnd: TppDetailBand;
    rpFichaProcSR6DBTxt1: TppDBText;
    rpFichaProcSR6DBTxt2: TppDBText;
    CdsFichaProc7: TCMClientDataSet;
    dsFichaProc7: TwwDataSource;
    ppFichaProc7: TppBDEPipeline;
    rpFichaProcSR7: TppSubReport;
    rpFichaProcCR7: TppChildReport;
    rpFichaProcSR7DtlBnd: TppDetailBand;
    rpFichaProcSR7DBTxt1: TppDBText;
    rpFichaProcSR7DBTxt2: TppDBText;
    rpFichaProcSR7DBTxt3: TppDBText;
    rpFichaProcGroup3: TppGroup;
    rpFichaProcSR7GrpHdrBnd: TppGroupHeaderBand;
    rpFichaProcSR7Lbl1: TppLabel;
    rpFichaProcSR7Lbl2: TppLabel;
    rpFichaProcSR7Lbl3: TppLabel;
    rpFichaProcSR7GrpFootBnd: TppGroupFooterBand;
    rpFichaProcSR7DBCalc1: TppDBCalc;
    rpFichaProcSR7Lbl4: TppLabel;
    rpFichaProcSR7Line1: TppLine;
    ppDBText1: TppDBText;
    CdsRateio: TCMClientDataSet;
    dsRateio: TwwDataSource;
    ppRateio: TppBDEPipeline;
    ppGroup1: TppGroup;
    rpFichaProcSR2GrpHdrBnd0: TppGroupHeaderBand;
    rpFichaProcSR2GrpFootBnd0: TppGroupFooterBand;
    rpFichaProcSR2Lbl6: TppLabel;
    rpFichaProcSR2DBTxt5: TppDBText;
    rpFichaProcSR2Lbl7: TppLabel;
    rpFichaProcSR2DBTxt_RatIndRecl: TppDBText;
    rpFichaProcSR2DBTxt_RatIndProv: TppDBText;
    rpFichaProcSR2DBTxt_RatIndReal: TppDBText;
    rpFichaProcSR2DBTxt_RatPercRecl: TppDBText;
    rpFichaProcSR2DBTxt_RatPercProv: TppDBText;
    rpFichaProcSR2DBTxt_RatPercReal: TppDBText;
    procedure CrmRptCMBeforePrint(Sender: TObject);
    procedure CdsFichaProcAfterScroll(DataSet: TDataSet);
    procedure rpFichaProcSmryBndAfterPrint(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure FormDestroy(Sender: TObject);
  private
    CtrlListTerceirosRH: TCtrlListTerceirosRH;
    CtrlProcessoTrab: TCtrlProcessoTrab;
    CtrlCustomProcTrab: TCtrlCustomProcTrab;
    CtrlHonorarioProcesso: TCtrlHonorarioProcesso;
    CtrlRateioProcTrab: TCtrlRateioProcTrab;
    
    procedure GerarDadosObjetos;
    procedure GerarDadosRateio;
    function GetPercRateio(Valor: double; DataAdmissao,
      DataDemissao: TDate): double;
  end;

var
  RptFichaProc_ModCon: TRptFichaProc_ModCon;

implementation

uses uSistema, uCtrlPadroes, fAguarde, uCtrlFuncoesRH, uCtrlUsoGeralRH;

{$R *.DFM}

procedure TRptFichaProc_ModCon.FormCreate(Sender: TObject);
begin
  inherited;
  CtrlListTerceirosRH := TCtrlListTerceirosRH.Create(CtrlUsoGeralRH.UsuXFilial,
    CtrlUsoGeralRH.UsuXCCusto, CtrlUsoGeralRH.IdUsuarioGeral);
  CtrlListTerceirosRH.InitializeAs(Padroes);

  CtrlProcessoTrab := TCtrlProcessoTrab.Create(Sistema.IdModulo, Sistema.IdUsuario,
    Sistema.IdEmpresa, Sistema.UsaPlanoPatro, CtrlUsoGeralRH.UsuXFilial,
    CtrlUsoGeralRH.UsuXCCusto, CtrlUsoGeralRH.IdUsuarioGeral);
  CtrlProcessoTrab.InitializeAs(Padroes);

  CtrlCustomProcTrab := TCtrlCustomProcTrab.Create(Sistema.IdEmpresa, Sistema.TipoEmpresa);
  CtrlCustomProcTrab.InitializeAs(Padroes);

  CtrlHonorarioProcesso := TCtrlHonorarioProcesso.Create(CtrlUsoGeralRH.UsuXFilial,
    CtrlUsoGeralRH.UsuXCCusto, CtrlUsoGeralRH.IdUsuarioGeral);
  CtrlHonorarioProcesso.InitializeAs(Padroes);

  CtrlRateioProcTrab := TCtrlRateioProcTrab.Create;
  CtrlRateioProcTrab.InitializeAs(Padroes);
end;

procedure TRptFichaProc_ModCon.FormDestroy(Sender: TObject);
begin
  CtrlListTerceirosRH.Free;
  CtrlProcessoTrab.Free;
  CtrlCustomProcTrab.Free;
  CtrlHonorarioProcesso.Free;
  CtrlRateioProcTrab.Free;
  inherited;
end;

procedure TRptFichaProc_ModCon.CrmRptCMBeforePrint(Sender: TObject);
begin
  inherited;
  with (sqlFichaProc.SQL) do
  begin
    Clear;
    Add('SELECT');
    Add('  PR.IDPESSOA, F.IDESTAB, PJ.NOME AS ESTAB,');
    Add('  PT.*, DECODE(PT.FLGSITPROC,0,''Aberto'',''Encerrado'') AS SITUACAO,');
    Add('  TRT.DESCRICAO AS TRT, PR.NOME AS NOME,');
    Add('  PF.DATANASC,');
    Add('  DECODE(PF.ESTCIVIL,');
    Add('    ''S'',''Solteir'' || DECODE(PF.SEXO,''F'',''a'',''o''),');
    Add('    ''C'',''Casad'' || DECODE(PF.SEXO,''F'',''a'',''o''),');
    Add('    ''D'',''Separad'' || DECODE(PF.SEXO,''F'',''a'',''o''),');
    Add('    ''J'',''Separad'' || DECODE(PF.SEXO,''F'',''a'',''o'') || '' Judicialmente'',');
    Add('    ''E'',''Desquitad'' || DECODE(PF.SEXO,''F'',''a'',''o''),');
    Add('    ''V'',''Viúv'' || DECODE(PF.SEXO,''F'',''a'',''o''),');
    Add('    ''O'',''Outro'') AS ESTCIVIL,');
    Add('  DECODE(PF.SEXO,''F'',''Feminino'',''M'',''Masculino'','''') AS SEXO,');
    Add('  IMG.IMAGEM AS FOTO,');
    Add('  E.LOGRADOURO, E.BAIRRO, E.CEP, E.NUMERO, CI.NOME AS CIDADE,');
    Add('  E.CODESTADO, E.COMPLEMENTO,');
    Add('  DECODE(RTRIM(TELEFONE.DDI),NULL,'''',''(''||RTRIM(TELEFONE.DDI)||'')'') AS DDI,');
    Add('  DECODE(RTRIM(TELEFONE.DDD),NULL,'''',''(''||RTRIM(TELEFONE.DDD)||'')'') AS DDD,');
    Add('  RTRIM(TELEFONE.NUMERO) AS TELEFONE,');
    Add('  C.TITULO AS CARGO, PFS.DESCRICAO AS PROFISSAO, F.DATAADMISSAO,');
    Add('  F.DATADESLIGAMENTO AS DATADEMISSAO,');
    Add('  RTRIM(SF.DESCRICAO) AS SITUACAO_FUNC, SF.TIPOSIT,');
    Add('  CC.NOME AS C_CUSTO, NVL(F.SALARIOATUAL,0) AS SALARIOATUAL,');
    Add('  DECODE(F.TIPOPAGAMENTO, NULL,'''',');
    Add('    ''('' || DECODE(F.TIPOPAGAMENTO, ''H'',''Horista'', ''D'',''Diarista'',');
    Add('    ''M'', ''Mensalista'', ''T'',''Tarefa'') || '')'') AS TIPOPAGAMENTO,');
    Add('  GR.DESCRICAO AS GRAUINSTR');
    Add('FROM');
    Add('  PESSOA PJ, PESSOA PR, PESSOAFISICA PF, IMAGENS IMG, ENDPESS E,');
    Add('  PROCESSOTRAB PT, FUNCIONARIO F, TRT, CARGO C, CIDADES CI, PROFISS PFS,');
    Add('  CENTCUST CC, GRINSTR GR, SITFUNC SF,');
    // -------------------------------------------------------------------- //
    // Telefone do Funcionário
    Add('  (SELECT TE.IDENDERECO, TE.IDTELEFONE, TE.DDD, TE.DDI, TE.NUMERO');
    Add('   FROM');
    Add('     TELENDPESS TE,');
    Add('     (SELECT   MIN(IDTELEFONE) AS IDTELEFONE, IDENDERECO');
    Add('      FROM     TELENDPESS');
    Add('      GROUP BY IDENDERECO) END');
    Add('   WHERE');
    Add('     (END.IDTELEFONE = TE.IDTELEFONE)) TELEFONE');
    // -------------------------------------------------------------------- //
    Add('WHERE');
    Add('  (PT.NUMPROCTRAB      = ' +CmpRptCM.ParamByName('NumProcesso').asString+ ') AND');
    Add('  (PT.CODIGOTRT        = TRT.CODIGOTRT) AND');
    Add('  (PT.IDRECLAMANTE     = PF.IDPESSOA) AND');
    Add('  (PT.IDRECLAMANTE     = PR.IDPESSOA) AND');
    Add('  (PT.IDRECLAMANTE     = F.IDPESSOA) AND');
    Add('  (F.IDSITFUNC         = SF.IDSITFUNC) AND');
    Add('  (F.IDESTAB           = PJ.IDPESSOA) AND');
    Add('  (F.IDCARGO           = C.IDCARGO) AND');
    Add('  (F.CODCENTROCUSTO    = CC.CODCENTROCUSTO(+)) AND');
    Add('  (F.IDEMPRESA         = CC.IDEMPRESA(+)) AND');
    Add('  (PF.IDPROFISS        = PFS.IDPROFISS(+)) AND');
    Add('  (PF.IDGRINSTR        = GR.IDGRINSTR(+)) AND');
    Add('  (PR.IDIMAGEM         = IMG.IDIMAGEM(+)) AND');
    Add('  (PR.IDPESSOA         = E.IDPESSOA(+)) AND');
    Add('  (PR.IDENDRESIDENCIAL = E.IDENDERECO(+)) AND');
    Add('  (PR.IDENDRESIDENCIAL = TELEFONE.IDENDERECO(+)) AND');
    Add('  (E.IDCIDADES         = CI.IDCIDADES(+))');
    SaveToFile('c:\qry.txt');
  end;
  sqlFichaProc.Open;

  CdsFichaProc1.Data := CtrlListTerceirosRH.ListDocPessoa(
    CdsFichaProc.FieldByName('IDPESSOA').asFloat);

  GerarDadosObjetos;

  sqlFichaProc3.Prepare;
  sqlFichaProc3.ParamByName('NUMPROCTRAB').asFloat :=
    CdsFichaProc.FieldByName('NUMPROCTRAB').asFloat;
  sqlFichaProc3.Open;

  CdsFichaProc4.Data := CtrlProcessoTrab.ListProcessosVinculados(
    CdsFichaProc.FieldByName('NUMPROCTRAB').asFloat);

  CdsFichaProc5.Data := CtrlProcessoTrab.ListReclamantesDoProcesso(
    CdsFichaProc.FieldByName('IDPROCVINCULADO').asFloat);

  CdsFichaProc6.Data := CtrlProcessoTrab.ListDadosLitisconsortes(
    CdsFichaProc.FieldByName('NUMPROCTRAB').asFloat);

  frmAguarde.Max := CdsFichaProc.RecordCount;
  frmAguarde.Update;

  // Título do Relatório
  lblFichaProcLbl_NomeEmpresa.Caption := Sistema.NomeEmpresa;
  lblFichaProcLbl_Titulo.Caption := 'Ficha do Processo ' +
    CdsFichaProc.FieldByName('PROCJCJNUM').asString;
  rpFichaProcLbl_Escritorio.Caption := CmpRptCM.ParamByName('NomeAdvogado').asString;

  rpFichaProcSR2DBTxt_Val_Real.Visible :=
    (CdsFichaProc.FieldByName('FLGSITPROC').asInteger = 1);
  rpFichaProcSR2Lbl_Val_Real.Visible := rpFichaProcSR2DBTxt_Val_Real.Visible;
  rpFichaProcSR2DBCalc_Val_Real.Visible := rpFichaProcSR2DBTxt_Val_Real.Visible;

  rpFichaProcSR2GrpFootBnd0.Visible := CmpRptCM.ParamByName('ImprimirRateio').asBoolean;
  if (rpFichaProcSR2GrpFootBnd0.Visible) then
  begin
    CdsRateio.Data := CtrlRateioProcTrab.ListRateioDoEstab(
      CdsFichaProc.FieldByName('IDESTAB').asFloat);
    GerarDadosRateio;
  end
  else
    CdsRateio.Data := CtrlRateioProcTrab.ListRateioDoEstab(-1);

  rpFichaProcSR3DBMemo1.Visible := CmpRptCM.ParamByName('ImprimirOBSEtapa').asBoolean;

  rpFichaProcSR7.Visible := CmpRptCM.ParamByName('ImprimirHonorario').asBoolean;
  if (rpFichaProcSR7.Visible) then
  begin
    CdsFichaProc7.Data := CtrlHonorarioProcesso.ListHonorario(
      CdsFichaProc.FieldByName('NUMPROCTRAB').asFloat);
    rpFichaProcSR7.DataPipeLine := ppFichaProc7;
  end  
  else
    rpFichaProcSR7.DataPipeLine := nil;
end;

procedure TRptFichaProc_ModCon.CdsFichaProcAfterScroll(DataSet: TDataSet);
begin
  frmAguarde.Pos := frmAguarde.Pos + 1;
  frmAguarde.Update;
end;

procedure TRptFichaProc_ModCon.rpFichaProcSmryBndAfterPrint(Sender: TObject);
begin
  frmAguarde.Apaga;
end;

procedure TRptFichaProc_ModCon.GerarDadosObjetos;
var
  dValorReclamado, dValorReal, dValorProvavel, dValorOriginal: double;
  DataHist1, DataHist2: TDateTime;
begin
  sqlFichaProc2.Prepare;
  sqlFichaProc2.ParamByName('NUMPROCTRAB').asFloat := CdsFichaProc.FieldByName('NUMPROCTRAB').asFloat;
  sqlFichaProc2.Open;

  if (CdsFichaProc.FieldByName('DATADEMISSAO').asString <> '') then
    DataHist1 := StrToDate(Copy(CdsFichaProc.FieldByName('DATADEMISSAO').asString,1,Length(ShortDateFormat)))
  else
  if (CdsFichaProc.FieldByName('DATANOTIF').asString <> '') then
    DataHist1 := StrToDate(Copy(CdsFichaProc.FieldByName('DATANOTIF').asString,1,Length(ShortDateFormat)))
  else
    DataHist1 := 0;

  if (CdsFichaProc.FieldByName('DATAEFETENC').asString <> '') then
    DataHist2 := StrToDate(Copy(CdsFichaProc.FieldByName('DATAEFETENC').asString,1,Length(ShortDateFormat)))
  else
    DataHist2 := 0;

  while not(CdsFichaProc2.EOF) do
  begin
    dValorReclamado := CtrlCustomProcTrab.GetValorAtual(
      CdsFichaProc2.FieldByName('VALORRECL').asFloat,
      DataHist1,
      CdsFichaProc.FieldByName('MOEDAPROCTRAB').asInteger,
      CdsFichaProc.FieldByName('IDREGRA').asFloat,
      CdsFichaProc.FieldByName('NUMPROCTRAB').asFloat,
      CdsFichaProc.FieldByName('INDTAXACONV').asInteger);

    dValorReal := CtrlCustomProcTrab.GetValorAtual(
      CdsFichaProc2.FieldByName('VALORSENTENCA').asFloat,
      DataHist2,
      CdsFichaProc.FieldByName('MOEDAPROCTRAB').asInteger,
      CdsFichaProc.FieldByName('IDREGRA').asFloat,
      CdsFichaProc.FieldByName('NUMPROCTRAB').asFloat,
      CdsFichaProc.FieldByName('INDTAXACONV').asInteger);

    dValorProvavel :=  dValorReclamado -
      ((100 - CdsFichaProc2.FieldByName('PERCPROB').asFloat) * dValorReclamado / 100);
    dValorOriginal :=  dValorReclamado -
      ((100 - CdsFichaProc2.FieldByName('PERCORIG').asFloat) * dValorReclamado / 100);

    CdsFichaProc2.Edit;               
    CdsFichaProc2.FieldByName('VAL_RECLAMADO').asFloat := dValorReclamado;
    CdsFichaProc2.FieldByName('VAL_PROVAVEL_ORIG').asFloat := dValorOriginal;
    CdsFichaProc2.FieldByName('VAL_PROVAVEL').asFloat := dValorProvavel;
    CdsFichaProc2.FieldByName('VAL_REAL').asFloat := dValorReal;
    CdsFichaProc2.Post;
    CdsFichaProc2.Next;
  end;
  CdsFichaProc2.First;
end;

procedure TRptFichaProc_ModCon.GerarDadosRateio;
var
  dPercRateio, dValorReclamado, dValorProvavel, dValorReal: double;
  DataAdmissao, DataDemissao: TDateTime;
begin
  rpFichaProcSR2DBTxt_RatIndReal.Visible :=
    (CdsFichaProc.FieldByName('FLGSITPROC').asInteger = 1);
  rpFichaProcSR2DBTxt_RatPercReal.Visible :=
    (CdsFichaProc.FieldByName('FLGSITPROC').asInteger = 1);

  if not(CdsFichaProc.FieldByName('DATAADMISSAO').IsNull) then
    DataAdmissao := CdsFichaProc.FieldByName('DATAADMISSAO').asDateTime
  else
    DataAdmissao := Date-365*20;

  if (CdsFichaProc.FieldByName('TIPOSIT').asString = 'D') and
     not(CdsFichaProc.FieldByName('DATADEMISSAO').IsNull) then
    DataDemissao := CdsFichaProc.FieldByName('DATADEMISSAO').asDateTime
  else
    DataDemissao := Date;

  dValorReclamado := 0;
  dValorProvavel := 0;
  dValorReal := 0;
  CdsFichaProc2.First;
  while not(CdsFichaProc2.EOF) do
  begin
    dValorReclamado := dValorReclamado +
      CdsFichaProc2.FieldByName('VAL_RECLAMADO').asFloat;
    dValorProvavel := dValorProvavel +
      CdsFichaProc2.FieldByName('VAL_PROVAVEL').asFloat;
    dValorReal := dValorReal +
      CdsFichaProc2.FieldByName('VAL_REAL').asFloat;
    CdsFichaProc2.Next;
  end;
  CdsFichaProc2.First;

  CdsRateio.Edit;
  if (CdsRateio.FieldByName('TIPORATEIO').asInteger = 1) then
  begin
    dPercRateio := GetPercRateio(0, DataAdmissao, DataDemissao);
    if (dPercRateio > 0) then
    begin
      CdsRateio.FieldByName('RAT_IND_RECL').asFloat := (dValorReclamado * dPercRateio / 100);
      CdsRateio.FieldByName('RAT_IND_PROV').asFloat := (dValorProvavel * dPercRateio / 100);
      CdsRateio.FieldByName('RAT_IND_REAL').asFloat := (dValorReal * dPercRateio / 100);

      if (dValorReclamado <> 0) then
        CdsRateio.FieldByName('RAT_PERC_RECL').asFloat := dPercRateio;
      if (dValorProvavel <> 0) then
        CdsRateio.FieldByName('RAT_PERC_PROV').asFloat := dPercRateio;
      if (dValorReal <> 0) then
        CdsRateio.FieldByName('RAT_PERC_REAL').asFloat := dPercRateio;
    end;
  end
  else
  begin
    // Valor Reclamado
    dPercRateio := GetPercRateio(dValorReclamado, DataAdmissao, DataDemissao);
    if (dPercRateio > 0) then
      CdsRateio.FieldByName('RAT_IND_RECL').asFloat := dPercRateio;
    if (dValorReclamado <> 0) then
      CdsRateio.FieldByName('RAT_PERC_RECL').asFloat := (dPercRateio * 100 / dValorReclamado);

    // Último Valor Provável
    dPercRateio := GetPercRateio(dValorProvavel, DataAdmissao, DataDemissao);
    if (dPercRateio > 0) then
      CdsRateio.FieldByName('RAT_IND_PROV').asFloat := dPercRateio;
    if (dValorProvavel <> 0) then
      CdsRateio.FieldByName('RAT_PERC_PROV').asFloat := (dPercRateio * 100 / dValorProvavel);

    // Valor Real
    dPercRateio := GetPercRateio(dValorReal, DataAdmissao, DataDemissao);
    if (dPercRateio > 0) then
      CdsRateio.FieldByName('RAT_IND_REAL').asFloat := dPercRateio;
    if (dValorReal <> 0) then
      CdsRateio.FieldByName('RAT_PERC_REAL').asFloat := (dPercRateio * 100 / dValorReal);
  end;
  CdsRateio.Post;
end;

function TRptFichaProc_ModCon.GetPercRateio(Valor: double; DataAdmissao, DataDemissao: TDate): double;
begin
  Result := CtrlRateioProcTrab.RateioCusto(Valor, DataAdmissao, DataDemissao,
    CdsFichaProc.FieldByName('DATANOTIF').asDateTime,
    CdsRateio.FieldByName('DATABASE').asDateTime,
    CdsRateio.FieldByName('TIPORATEIO').asInteger,
    CdsRateio.FieldByName('PERIODO').asInteger,
    CdsRateio.FieldByName('PERCENT1').asFloat,
    CdsRateio.FieldByName('VALORBASE1').asFloat,
    CdsRateio.FieldByName('PERCENT2').asFloat,
    CdsRateio.FieldByName('VALORBASE2').asFloat,
    CdsRateio.FieldByName('PERCENT3').asFloat,
    CdsRateio.FieldByName('VALORBASE3').asFloat,
    CdsRateio.FieldByName('PERCENT4').asFloat,
    CdsRateio.FieldByName('VALORBASE4').asFloat,
    CdsRateio.FieldByName('PERCENT5').asFloat,
    CdsRateio.FieldByName('VALORBASE5').asFloat);
end;

end.
