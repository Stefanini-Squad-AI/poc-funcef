// *****************************************************************************
// ***************************** REGISTRO DE ALTERAÇÕES ************************
// *****************************************************************************
// Autor(a)    :  Ádler Teodoro de Souza
// Data        :  27/02/2009
// Pendência   : SOL 109421 KINTANA 496332
// Descricao   :  Alteração de gravação de arquivos de log na raiz do disco C: .
//------------------------------------------------------------------------------
unit RFichaProc;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs, FCmReport, ppComm,
  ppRelatv, ppProd, ppClass, ppReport, uCmRptManager, TXComp, CmParamReport, ppDB, ppDBPipe,
  ppDBBDE, Db, Wwdatsrc, DBClient, uCMClientDataSet, uCmSqlParams, ppBands, ppCache, ppPrnabl,
  ppCtrls, DBTables, ppStrtch, ppSubRpt, ppMemo, uCtrlCustomProcTrab, uCtrlGlobalRH, Wwquery,
  TXRB;
 // TXRB;

type
  TRptFichaProc = class(TFrmCmReport)
    rpFichaProc: TppReport;
    sqlFichaProc: TCMSqlParams;
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
    lblFichaProcLbl_RzSoc: TppLabel;
    lblFichaProcDbt_RzSoc: TppDBText;
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
    dsFichaProc3: TwwDataSource;
    ppFichaProc3: TppBDEPipeline;
    rpFichaProcSR4: TppSubReport;
    rpFichaProcCR4: TppChildReport;
    rpFichaProcSR4TitBnd: TppTitleBand;
    rpFichaProcSR4Lbl1: TppLabel;
    rpFichaProcSR4DtlBnd: TppDetailBand;
    rpFichaProcSR4DBTxt1: TppDBText;
    rpFichaProcSR4DBTxt2: TppDBText;
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
    dsFichaProc5: TwwDataSource;
    ppFichaProc5: TppBDEPipeline;
    dsFichaProc6: TwwDataSource;
    ppFichaProc6: TppBDEPipeline;
    rpFichaProcSR6: TppSubReport;
    rpFichaProcCR6: TppChildReport;
    rpFichaProcSR6TitBnd: TppTitleBand;
    rpFichaProcSR6Lbl1: TppLabel;
    rpFichaProcSR6DtlBnd: TppDetailBand;
    rpFichaProcSR6DBTxt1: TppDBText;
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
    dsFichaProc8: TwwDataSource;
    ppFichaProc8: TppBDEPipeline;
    ppDBText1: TppDBText;
    ppLabel1: TppLabel;
    CdsParamRH: TCMClientDataSet;
    qryFichaProc1: TwwQuery;
    qryFichaProc2: TwwQuery;
    qryFichaProc3: TwwQuery;
    qryFichaProc4: TwwQuery;
    qryFichaProc5: TwwQuery;
    qryFichaProc6: TwwQuery;
    qryFichaProc7: TwwQuery;
    qryFichaProc8: TwwQuery;
    qryFichaProc: TwwQuery;
    updFichaProc2: TUpdateSQL;
    ppDBText3: TppDBText;
    ppLabel2: TppLabel;
    ppLabel3: TppLabel;
    ppDBText4: TppDBText;
    ppLabel4: TppLabel;
    ppDBText5: TppDBText;
    ppLabel5: TppLabel;
    ppDBText6: TppDBText;
    lblFichaProcLbl_Numero: TppLabel;
    lblFichaProcLbl_Plano: TppLabel;
    lblFichaProcDbt_Plano: TppDBText;
    ppLabel6: TppLabel;
    ppDBText7: TppDBText;
    ppLabel7: TppLabel;
    ppDBText8: TppDBText;
    ppLabel8: TppLabel;
    ppDBText9: TppDBText;
    ppLabel9: TppLabel;
    ppDBText10: TppDBText;
    ppLabel10: TppLabel;
    ppDBText11: TppDBText;
    ppLabel11: TppLabel;
    ppDBText12: TppDBText;
    ppDBText13: TppDBText;
    procedure CrmRptCMBeforePrint(Sender: TObject);
    procedure rpFichaProcSmryBndAfterPrint(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure FormDestroy(Sender: TObject);
    procedure qryFichaProcAfterScroll(DataSet: TDataSet);
    procedure ppFichaProcTraversal(Sender: TObject);
  private
    CtrlCustomProcTrab: TCtrlCustomProcTrab;
    CtrlGlobalRH: TCtrlGlobalRH;

    procedure GerarDadosObjetos;
  end;

var
  RptFichaProc: TRptFichaProc;

implementation

uses uSistema, uCtrlPadroes, fAguarde, uModulo2,
uCtrlFuncoesRH, uCtrlUsoGeralRH;

{$R *.DFM}

procedure TRptFichaProc.FormCreate(Sender: TObject);
begin
  inherited;
  CtrlGlobalRH := TCtrlGlobalRH.Create;
  CtrlGlobalRH.InitializeAs(Padroes);
  CdsParamRH.Data := CtrlGlobalRH.GetParamRH('FLGPERCPROB');
  if (CdsParamRH.FieldByName('FLGPERCPROB').asInteger = 1) then  // sobre Estim. Original
    rpFichaProcSR2Lbl2.Caption := 'Valor Original'
  else if (Modulo2.IdContraCheque = REFER) or (Modulo2.IdContraCheque = FUNCEF) then
    rpFichaProcSR2Lbl2.Caption := 'Valor Da Causa'
  else
    rpFichaProcSR2Lbl2.Caption := 'Valor Reclamado';

  CtrlCustomProcTrab := TCtrlCustomProcTrab.Create(Sistema.IdEmpresa, Sistema.TipoEmpresa);
  CtrlCustomProcTrab.InitializeAs(Padroes);

end;

procedure TRptFichaProc.FormDestroy(Sender: TObject);
begin
  CtrlCustomProcTrab.Free;
  FreeAndNil(CtrlGlobalRH);
  inherited;
end;

procedure TRptFichaProc.CrmRptCMBeforePrint(Sender: TObject);
begin
  inherited;
  // Imprimir ou não a Observação dos Objetos
  rpFichaProcSR2DBMemo1.Visible := CmpRptCM.ParamByName('ImprimirOBSObjeto').asBoolean;

  // Imprimir ou não a Observação das Etapas
  rpFichaProcSR3DBMemo1.Visible := CmpRptCM.ParamByName('ImprimirOBSEtapa').asBoolean;

  // Imprimir ou não o Honorário
  rpFichaProcSR7.Visible := CmpRptCM.ParamByName('ImprimirHonorario').asBoolean;

  // Imprimir ou não Litisconsortes
  rpFichaProcSR6.Visible := CmpRptCM.ParamByName('ImprimirLitis').asBoolean;

  lblFichaProcLbl_NomeEmpresa.Caption := Sistema.NomeEmpresa;

  with (qryFichaProc.SQL) do
  begin
    Clear;
    Add('SELECT');
    Add('  PT.NUMPROCTRAB, VJ.DESCRICAO AS NOMEVARAJUSTICA, PT.NUMVARAJUSTICA, PT.DATANOTIF,');
    Add('  PT.DATAEFETENC, DECODE(PT.FLGSITPROC,0,''Aberto'',''Encerrado'') AS SITUACAO,');
    Add('  DECODE(PT.INDMATERIA,');
    Add('    1,''Trabalhista'',');
    Add('    2,''Previdenciária'',');
    Add('    3,''Prev./Trabalhista'',');
    Add('    5,''Comercial'',');
    Add('    6,''Tributária'',');
    Add('    7,''Penal'',');
    Add('    ''Civil'') AS MATERIA,');
    Add('  DECODE(PT.FLGPARTEATIVA,0,''Passiva'',1,''Ativa'',''Interessada'') AS PARTE,');
    Add('  PCP.IDPESSOA, PCP.NOME, PCP.RAZAOSOCIAL, IMG.IMAGEM AS FOTO,');
    Add('  DECODE(PCP.IDENDRESIDENCIAL, NULL, PCP.IDENDCOMERCIAL, PCP.IDENDRESIDENCIAL) AS IDENDERECO,');
    Add('  ADV.NOME AS ESCRITORIO,');
    Add('  PP.NOME AS PLANO,');
    Add('  MO.MOEDESC AS INDICE, PT.TAXAJUROS,');
    Add('  RTRIM(CI.NOME) || '' '' || ES.CODESTADO AS CIDADE,');
    Add('  TP.NOMETIPOPROC AS TIPOPROCESSO,');
    Add('  PT.IDPROCVINCULADO, PT.PROCJCJNUM, PCP.TIPO,');
    Add('  PT.IDENTPASTA, PT.MOEDAPROCTRAB, PT.IDREGRA, PT.INDTAXACONV, PT.DATAJUIZO');
    Add('FROM');
    Add('  PESSOA PCP, PESSOA ADV, PROCESSOTRAB PT, IMAGENS IMG, VARAJUSTICA VJ,');
    Add('  TIPOPROCESSO TP, PLANPREV PP, CIDADES CI, ESTADO ES, MOEDA MO');
    Add('WHERE');
    if Pos(',', CmpRptCM.ParamByName('NumProcesso').asString) = 0 then
      Add('  (PT.NUMPROCTRAB         = ' +CmpRptCM.ParamByName('NumProcesso').asString+ ') AND')
    else
      Add(FU.QuebrarListaFiltro(1, '(PT.NUMPROCTRAB  ', CmpRptCM.ParamByName('NumProcesso').asString, 500)+' AND');
    Add('  (PT.IDRECLAMANTE        = PCP.IDPESSOA) AND');
    Add('  (PCP.IDIMAGEM           = IMG.IDIMAGEM(+)) AND');
    Add('  (PT.IDVARAJUSTICA       = VJ.IDVARAJUSTICA(+)) AND');
    Add('  (PT.IDPLANOPREV         = PP.IDPLANOPREV(+)) AND');
    Add('  (PT.IDTIPOPROC          = TP.IDTIPOPROC(+)) AND');
    Add('  (PT.MOEDAPROCTRAB       = MO.MOECODIGO(+)) AND');
    Add('  (PT.IDCIDADES           = CI.IDCIDADES(+)) AND');
    Add('  (CI.IDESTADO            = ES.IDESTADO) AND');
    Add('  (PT.IDADVOGRECDA        = ADV.IDPESSOA(+))');
    //SaveToFile('c:\qry.txt');
    SaveToFile(Sistema.RetornaCaminhoArquivos(Sistema.IdEmpresa)+'\qry.txt');//Ádler Teodoro de Souza SOL 109421 KINTANA 496332
  end;
  qryFichaProc.Open;

  frmAguarde.Max := qryFichaProc.RecordCount;
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
  if (qryFichaProc.FieldByName('DATANOTIF').asString <> '') then
    DataHist1 := StrToDate(Copy(qryFichaProc.FieldByName('DATANOTIF').asString,1,Length(ShortDateFormat)))
  else
    DataHist1 := 0;

  if (qryFichaProc.FieldByName('SITUACAO').asString = 'Aberto') then
  begin
    if (qryFichaProc.FieldByName('DATANOTIF').asString <> '') then
      DataHist2 := StrToDate(Copy(qryFichaProc.FieldByName('DATANOTIF').asString,1,Length(ShortDateFormat)))
    else
      DataHist2 := 0;
  end
  else
  begin
    if (qryFichaProc.FieldByName('DATAEFETENC').asString <> '') then
      DataHist2 := StrToDate(Copy(qryFichaProc.FieldByName('DATAEFETENC').asString,1,Length(ShortDateFormat)))
    else
      DataHist2 := 0;
  end;

  while not(qryFichaProc2.EOF) do
  begin
    if (Modulo2.IdContraCheque = FUNCEF) then
      dValorReclamado := qryFichaProc2.FieldByName('VALORRECL').asFloat
    else
      dValorReclamado := CtrlCustomProcTrab.GetValorAtual(
        qryFichaProc2.FieldByName('VALORRECL').asFloat,
        DataHist1,
        qryFichaProc.FieldByName('MOEDAPROCTRAB').asInteger,
        qryFichaProc.FieldByName('IDREGRA').asFloat,
        qryFichaProc.FieldByName('NUMPROCTRAB').asFloat,
        qryFichaProc.FieldByName('INDTAXACONV').asInteger);

    if (CdsParamRH.FieldByName('FLGPERCPROB').asInteger = 1) then  // sobre Estim.Original
      dValorReclamado := (dValorReclamado * qryFichaProc2.FieldByName('PERCORIG').asFloat) / 100;

    dValEsperado := (dValorReclamado * qryFichaProc2.FieldByName('PERCPROB').asFloat) / 100;

    if (qryFichaProc.FieldByName('SITUACAO').asString = 'Aberto') then
    begin
      if (Modulo2.IdContraCheque = FUNCEF) then
        dValorReal := dValEsperado
      else
        dValorReal := CtrlCustomProcTrab.GetValorAtual(
          dValEsperado,
          DataHist2,
          qryFichaProc.FieldByName('MOEDAPROCTRAB').asInteger,
          qryFichaProc.FieldByName('IDREGRA').asFloat,
          qryFichaProc.FieldByName('NUMPROCTRAB').asFloat,
          qryFichaProc.FieldByName('INDTAXACONV').asInteger);
    end
    else
      if (Modulo2.IdContraCheque = FUNCEF) then
        dValorReal := qryFichaProc2.FieldByName('VALORSENTENCA').asFloat
      else
        dValorReal := CtrlCustomProcTrab.GetValorAtual(
          qryFichaProc2.FieldByName('VALORSENTENCA').asFloat,
          DataHist2,
          qryFichaProc.FieldByName('MOEDAPROCTRAB').asInteger,
          qryFichaProc.FieldByName('IDREGRA').asFloat,
          qryFichaProc.FieldByName('NUMPROCTRAB').asFloat,
          qryFichaProc.FieldByName('INDTAXACONV').asInteger);


    qryFichaProc2.Edit;
    qryFichaProc2.FieldByName('VAL_RECLAMADO').asFloat := dValorReclamado;
    qryFichaProc2.FieldByName('VAL_ESPERADO').asFloat := dValEsperado;
    qryFichaProc2.FieldByName('VAL_REAL').asFloat := dValorReal;
    qryFichaProc2.Post;
    qryFichaProc2.Next;
  end;
  if qryFichaProc2.Active then
    qryFichaProc2.First;
end;

procedure TRptFichaProc.qryFichaProcAfterScroll(DataSet: TDataSet);
begin
  inherited;
  frmAguarde.Pos := frmAguarde.Pos + 1;
  frmAguarde.Update;
end;

procedure TRptFichaProc.ppFichaProcTraversal(Sender: TObject);
begin
  inherited;
  GerarDadosObjetos;

  // Título do Relatório
  lblFichaProcLbl_Titulo.Caption := 'Ficha do Processo ' +
    qryFichaProc.FieldByName('PROCJCJNUM').asString;
  lblFichaProcLbl_Numero.Caption := '(Número Interno ' +
    qryFichaProc.FieldByName('NUMPROCTRAB').asString + ')';
  if (qryFichaProc.FieldByName('IDENTPASTA').asString <> '') then
    lblFichaProcLbl_Titulo.Caption := lblFichaProcLbl_Titulo.Caption +' Pasta: '+
      Trim(qryFichaProc.FieldByName('IDENTPASTA').asString);

  // Nome do Advogado Responsável
  rpFichaProcLbl_Escritorio.Caption := qryFichaProc.FieldByName('ESCRITORIO').asString;

  // Imprimir ou não a Razão Soc.
  lblFichaProcLbl_RzSoc.Visible := (qryFichaProc.FieldByName('TIPO').asString = 'J');
  lblFichaProcDbt_RzSoc.Visible := (qryFichaProc.FieldByName('TIPO').asString = 'J');

  // Imprimir ou não o Plano Prev.
  lblFichaProcLbl_Plano.Visible := (qryFichaProc.FieldByName('PLANO').asString <> '');
  lblFichaProcDbt_Plano.Visible := (qryFichaProc.FieldByName('PLANO').asString <> '');

  // Imprimir ou não o Valor Real
  rpFichaProcSR2DBTxt_Val_Real.Visible :=
    (qryFichaProc.FieldByName('SITUACAO').asString = 'Encerrado');
  rpFichaProcSR2Lbl_Val_Real.Visible := rpFichaProcSR2DBTxt_Val_Real.Visible;
  rpFichaProcSR2DBCalc_Val_Real.Visible := rpFichaProcSR2DBTxt_Val_Real.Visible;

  // Imprimir ou não o Processo Vinculado
  rpFichaProcSR5.Visible := trim(qryFichaProc5.FieldByName('PROCJCJNUM').asString) <> '';

  // Ao Imprimir o Honorário
  if (rpFichaProcSR7.Visible) then
  begin
    rpFichaProcSR7.DataPipeLine := ppFichaProc7;
  end
  else
    rpFichaProcSR7.DataPipeLine := nil;
end;

end.
