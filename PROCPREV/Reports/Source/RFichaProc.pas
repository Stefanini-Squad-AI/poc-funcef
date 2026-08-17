unit RFichaProc;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs, FCmReport, ppComm,
  ppRelatv, ppProd, ppClass, ppReport, uCmRptManager, TXComp, CmParamReport, ppDB, ppDBPipe,
  ppDBBDE, Db, Wwdatsrc, DBClient, uCMClientDataSet, uCmSqlParams, ppBands, ppCache, ppPrnabl,
  ppCtrls, DBTables, ppStrtch, ppSubRpt, ppMemo, uCtrlListTerceirosRH, uCtrlProcessoTrab,
  uCtrlCustomProcTrab, uCtrlHonorarioProcesso;

type
  TRptFichaProc = class(TFrmCmReport)
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
    rpFichaProcDBTxt6: TppDBText;
    rpFichaProcDBTxt5: TppDBText;
    rpFichaProcLine2: TppLine;
    rpFichaProcDBImage1: TppDBImage;
    rpFichaProcGroup1: TppGroup;
    rpFichaProcGrpHdrBnd: TppGroupHeaderBand;
    rpFichaProcGrpFootBnd: TppGroupFooterBand;
    rpFichaProcLbl11: TppLabel;
    rpFichaProcLbl12: TppLabel;
    rpFichaProcDBTxt9: TppDBText;
    rpFichaProcDBTxt10: TppDBText;
    rpFichaProcDBTxt19: TppDBText;
    rpFichaProcDBTxt20: TppDBText;
    rpFichaProcDBTxt21: TppDBText;
    rpFichaProcDBTxt22: TppDBText;
    rpFichaProcDBTxt12: TppDBText;
    rpFichaProcDBTxt13: TppDBText;
    rpFichaProcDBTxt14: TppDBText;
    rpFichaProcDBTxt23: TppDBText;
    rpFichaProcLine3: TppLine;
    rpFichaProcLine4: TppLine;
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
    ppDBText2: TppDBText;
    rpFichaProcSR2DBMemo1: TppDBMemo;
    ppLabel1: TppLabel;
    ppDBText1: TppDBText;
    ppLabel2: TppLabel;
    ppDBText3: TppDBText;
    rpFichaProcLbl13: TppLabel;
    rpFichaProcLbl14: TppLabel;
    rpFichaProcLbl17: TppLabel;
    rpFichaProcDBTxt15: TppDBText;
    rpFichaProcDBTxt16: TppDBText;
    rpFichaProcDBTxt24: TppDBText;
    rpFichaProcLbl19: TppLabel;
    rpFichaProcDBTxt27: TppDBText;
    rpFichaProcLbl15: TppLabel;
    rpFichaProcDBTxt17: TppDBText;
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
    
    procedure GerarDadosObjetos;
  end;

var
  RptFichaProc: TRptFichaProc;

implementation

uses uSistema, uCtrlPadroes, fAguarde, uCtrlFuncoesRH, uCtrlUsoGeralRH, uModulo;

{$R *.DFM}

procedure TRptFichaProc.FormCreate(Sender: TObject);
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
end;

procedure TRptFichaProc.FormDestroy(Sender: TObject);
begin
  CtrlListTerceirosRH.Free;
  CtrlProcessoTrab.Free;
  CtrlCustomProcTrab.Free;
  CtrlHonorarioProcesso.Free;
  inherited;
end;

procedure TRptFichaProc.CrmRptCMBeforePrint(Sender: TObject);
begin
  inherited;
  rpFichaProcSR2Lbl2.Caption := 'Valor '+FU.IFF(Modulo.IdContraCheque=REFER,'da Causa','Reclamado');
  with (sqlFichaProc.SQL) do
  begin
    Clear;
    Add('SELECT');
    Add('  PT.NUMPROCTRAB, VJ.DESCRICAO AS NOMEVARAJUSTICA, PT.NUMVARAJUSTICA,');
    Add('  PT.DATANOTIF, DECODE(PT.FLGSITPROC,0,''Aberto'',''Encerrado'') AS SITUACAO,');
    Add('  DECODE(PT.INDMATERIA,');
    Add('    3,''Previdenciária e Trabalhista'',');
    Add('    ''Previdenciária Apenas'') AS MATERIA,');
    Add('  P1.IDPESSOA, P1.NOME, PF.DATANASC,');
    Add('  DECODE(PF.SEXO,''F'',''Feminino'',''M'',''Masculino'','''') AS SEXO,');
    Add('  DECODE(PF.ESTCIVIL,');
    Add('    ''S'',''Solteir'' || DECODE(PF.SEXO,''F'',''a'',''o''),');
    Add('    ''C'',''Casad'' || DECODE(PF.SEXO,''F'',''a'',''o''),');
    Add('    ''D'',''Separad'' || DECODE(PF.SEXO,''F'',''a'',''o''),');
    Add('    ''J'',''Separad'' || DECODE(PF.SEXO,''F'',''a'',''o'') || '' Judicialmente'',');
    Add('    ''E'',''Desquitad'' || DECODE(PF.SEXO,''F'',''a'',''o''),');
    Add('    ''V'',''Viúv'' || DECODE(PF.SEXO,''F'',''a'',''o''),');
    Add('    ''O'',''Outro'') AS ESTCIVIL,');
    Add('  IMG.IMAGEM AS FOTO, E.LOGRADOURO, E.BAIRRO, E.CEP, E.NUMERO,');
    Add('  CI.NOME AS CIDADE, E.CODESTADO, E.COMPLEMENTO,');
    Add('  DECODE(RTRIM(TELEFONE.DDI),NULL,'''',''(''||RTRIM(TELEFONE.DDI)||'')'') AS DDI,');
    Add('  DECODE(RTRIM(TELEFONE.DDD),NULL,'''',''(''||RTRIM(TELEFONE.DDD)||'')'') AS DDD,');
    Add('  RTRIM(TELEFONE.NUMERO) AS TELEFONE,');
    Add('  PJ.NOME AS ESTAB, C.TITULO AS CARGO, PFS.DESCRICAO AS PROFISSAO,');
    Add('  CC.NOME AS C_CUSTO, GR.DESCRICAO AS GRAUINSTR, PT.DATAEFETENC,');
    Add('  PT.IDPROCVINCULADO, PT.PROCJCJNUM, PT.IDENTPASTA, PT.MOEDAPROCTRAB,');
    Add('  PT.IDREGRA, PT.INDTAXACONV');
    Add('FROM');
    Add('  PESSOA PJ, PESSOA P1, PESSOAFISICA PF, PROCESSOTRAB PT, IMAGENS IMG,');
    Add('  ENDPESS E, ELEGPATRO EP, PROFISS PFS, VARAJUSTICA VJ, CARGO C, CIDADES CI,');
    Add('  CENTCUST CC, GRINSTR GR,');
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
    Add('  (PT.IDVARAJUSTICA    = VJ.IDVARAJUSTICA) AND');
    Add('  (PT.IDRECLAMANTE     = P1.IDPESSOA) AND');
    Add('  (PT.IDRECLAMANTE     = PF.IDPESSOA(+)) AND');
    Add('  (PT.IDRECLAMANTE     = EP.IDPESSOA(+)) AND');
    Add('  (EP.IDESTAB          = PJ.IDPESSOA(+)) AND');
    Add('  (EP.IDCARGOEXT       = C.IDCARGO(+)) AND');
    Add('  (EP.CODCENTROCUSTO   = CC.CODCENTROCUSTO(+)) AND');
    Add('  (EP.IDPESSJUR        = CC.IDEMPRESA(+)) AND');
    Add('  (PF.IDPROFISS        = PFS.IDPROFISS(+)) AND');
    Add('  (PF.IDGRINSTR        = GR.IDGRINSTR(+)) AND');
    Add('  (P1.IDIMAGEM         = IMG.IDIMAGEM(+)) AND');
    Add('  (P1.IDPESSOA         = E.IDPESSOA(+)) AND');

    if (CmpRptCM.ParamByName('TipoContraparte').asString = 'F') then
    begin
      Add('  (P1.IDENDRESIDENCIAL = E.IDENDERECO(+)) AND');
      Add('  (P1.IDENDRESIDENCIAL = TELEFONE.IDENDERECO(+)) AND');
    end
    else
    begin
      Add('  (P1.IDENDCOMERCIAL   = E.IDENDERECO(+)) AND');
      Add('  (P1.IDENDCOMERCIAL   = TELEFONE.IDENDERECO(+)) AND');
    end;
    
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
  lblFichaProcLbl_Titulo.Caption := 'Ficha do Processo ' +
    CdsFichaProc.FieldByName('PROCJCJNUM').asString;
  if (CdsFichaProc.FieldByName('IDENTPASTA').asString <> '') then
    lblFichaProcLbl_Titulo.Caption := lblFichaProcLbl_Titulo.Caption +' Pasta: '+
      Trim(CdsFichaProc.FieldByName('IDENTPASTA').asString);

  // Nome do Advogado Responsável
  rpFichaProcLbl_Escritorio.Caption := CmpRptCM.ParamByName('NomeContraparte').asString;

  // Imprimir ou não o Valor Real
  rpFichaProcSR2DBTxt_Val_Real.Visible :=
    (CdsFichaProc.FieldByName('SITUACAO').asString = 'Encerrado');
  rpFichaProcSR2Lbl_Val_Real.Visible := rpFichaProcSR2DBTxt_Val_Real.Visible;
  rpFichaProcSR2DBCalc_Val_Real.Visible := rpFichaProcSR2DBTxt_Val_Real.Visible;

  // Imprimir ou não a Observação dos Objetos
  rpFichaProcSR2DBMemo1.Visible := CmpRptCM.ParamByName('ImprimirOBSObjeto').asBoolean;

  // Imprimir ou não a Observação das Etapas
  rpFichaProcSR3DBMemo1.Visible := CmpRptCM.ParamByName('ImprimirOBSEtapa').asBoolean;

  // Imprimir ou não o Honorário
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

procedure TRptFichaProc.CdsFichaProcAfterScroll(DataSet: TDataSet);
begin
  frmAguarde.Pos := frmAguarde.Pos + 1;
  frmAguarde.Update;
end;

procedure TRptFichaProc.rpFichaProcSmryBndAfterPrint(Sender: TObject);
begin
  frmAguarde.Apaga;
end;

procedure TRptFichaProc.GerarDadosObjetos;
var
  dValorReclamado, dValEsperado, dValorReal: double;
  DataHist1, DataHist2: TDateTime;
begin
  sqlFichaProc2.Prepare;
  sqlFichaProc2.ParamByName('NUMPROCTRAB').asFloat := CdsFichaProc.FieldByName('NUMPROCTRAB').asFloat;
  sqlFichaProc2.Open;

  if (CdsFichaProc.FieldByName('DATANOTIF').asString <> '') then
    DataHist1 := StrToDate(Copy(CdsFichaProc.FieldByName('DATANOTIF').asString,1,Length(ShortDateFormat)))
  else
    DataHist1 := 0;

  if (CdsFichaProc.FieldByName('SITUACAO').asString = 'Aberto') then
  begin
    if (CdsFichaProc.FieldByName('DATANOTIF').asString <> '') then
      DataHist2 := StrToDate(Copy(CdsFichaProc.FieldByName('DATANOTIF').asString,1,Length(ShortDateFormat)))
    else
      DataHist2 := 0;
  end
  else
  begin
    if (CdsFichaProc.FieldByName('DATAEFETENC').asString <> '') then
      DataHist2 := StrToDate(Copy(CdsFichaProc.FieldByName('DATAEFETENC').asString,1,Length(ShortDateFormat)))
    else
      DataHist2 := 0;
  end;

  while not(CdsFichaProc2.EOF) do
  begin
    dValorReclamado := CtrlCustomProcTrab.GetValorAtual(
      CdsFichaProc2.FieldByName('VALORRECL').asFloat,
      DataHist1,
      CdsFichaProc.FieldByName('MOEDAPROCTRAB').asInteger,
      CdsFichaProc.FieldByName('IDREGRA').asFloat,
      CdsFichaProc.FieldByName('NUMPROCTRAB').asFloat,
      CdsFichaProc.FieldByName('INDTAXACONV').asInteger);

    dValEsperado := (dValorReclamado * CdsFichaProc2.FieldByName('PERCPROB').asFloat) / 100;

    if (CdsFichaProc.FieldByName('SITUACAO').asString = 'Aberto') then
      dValorReal := CtrlCustomProcTrab.GetValorAtual(
        dValEsperado,
        DataHist2,
        CdsFichaProc.FieldByName('MOEDAPROCTRAB').asInteger,
        CdsFichaProc.FieldByName('IDREGRA').asFloat,
        CdsFichaProc.FieldByName('NUMPROCTRAB').asFloat,
        CdsFichaProc.FieldByName('INDTAXACONV').asInteger)
    else    
      dValorReal := CtrlCustomProcTrab.GetValorAtual(
        CdsFichaProc2.FieldByName('VALORSENTENCA').asFloat,
        DataHist2,
        CdsFichaProc.FieldByName('MOEDAPROCTRAB').asInteger,
        CdsFichaProc.FieldByName('IDREGRA').asFloat,
        CdsFichaProc.FieldByName('NUMPROCTRAB').asFloat,
        CdsFichaProc.FieldByName('INDTAXACONV').asInteger);


    CdsFichaProc2.Edit;
    CdsFichaProc2.FieldByName('VAL_RECLAMADO').asFloat := dValorReclamado;
    CdsFichaProc2.FieldByName('VAL_ESPERADO').asFloat := dValEsperado;
    CdsFichaProc2.FieldByName('VAL_REAL').asFloat := dValorReal;
    CdsFichaProc2.Post;
    CdsFichaProc2.Next;
  end;
  CdsFichaProc2.First;
end;

end.
