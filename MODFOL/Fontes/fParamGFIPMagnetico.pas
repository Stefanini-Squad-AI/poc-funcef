// *****************************************************************************
// ***************************** REGISTRO DE ALTERAÇÕES ************************
// *****************************************************************************
// Autor(a)    :  Ádler Teodoro de Souza
// Data        :  19/02/2009
// Pendência   : SOL 109421 KINTANA 496332
// Descricao   :  Alteração de gravação de arquivos de log na raiz do disco C: .
//------------------------------------------------------------------------------
unit fParamGFIPMagnetico;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs, IvDictio, IvMulti,
  IvEMulti, MAHlpBtn, StdCtrls, Buttons, TB97Tlbr, TB97, ExtCtrls, Spin, Mask, wwdblook, Db,
  DBTables, checklst, ComCtrls, Wwquery, CMDateTimePicker, fSairAjuda, wwdbdatetimepicker,
  IniFiles;

type
  TfrmParamGFIPMagnetico = class(TfrmSairAjuda)
    svdlgDialogo: TOpenDialog;
    rbtnGerar: TBitBtn;
    ToolbarSep972: TToolbarSep97;
    qryGPS: TwwQuery;
    qryResp: TwwQuery;
    qryEstab: TwwQuery;
    qryRespAux: TwwQuery;
    qryAltCad: TwwQuery;
    pnlHorario: TPanel;
    pgctrlSel: TPageControl;
    tbshEstab: TTabSheet;
    chklstEstab: TCheckListBox;
    tbshCCusto: TTabSheet;
    chklstCCusto: TCheckListBox;
    bbtnSelTodos: TBitBtn;
    bbtnInverteSel: TBitBtn;
    gbxAnoMesRef: TGroupBox;
    cmbMes: TComboBox;
    speAno: TSpinEdit;
    gbxDataProcess: TGroupBox;
    Label1: TLabel;
    Label2: TLabel;
    dtVencimento: TCMDateTimePicker;
    dtPagamento: TCMDateTimePicker;
    gbxResponsavel: TGroupBox;
    dblkcbResponsavel: TwwDBLookupCombo;
    rgGeraReg14: TRadioGroup;
    rgTipoInscricaoResp: TRadioGroup;
    gbxCodRec: TGroupBox;
    speCodRec: TSpinEdit;
    gbxCodEmprCAIXA: TGroupBox;
    mkedCodEmpreCAIXA: TMaskEdit;
    gbxDiaLimiteGRFC: TGroupBox;
    spedDiaLimiteGRFC: TSpinEdit;
    rgSimples: TRadioGroup;
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure FormCreate(Sender: TObject);
    procedure rbtnGerarClick(Sender: TObject);
    procedure bbtnSelTodosClick(Sender: TObject);
    procedure bbtnInverteSelClick(Sender: TObject);
    procedure chklstEstabDrawItem(Control: TWinControl; Index: Integer; Rect: TRect;
      State: TOwnerDrawState);
    procedure chklstEstabClickCheck(Sender: TObject);
    procedure dtVencimentoChange(Sender: TObject);
    procedure speCodRecExit(Sender: TObject);
  private
    fGFIP: TextFile; // Arquivo de Saída
    ArqConfig: TIniFile; // Arquivo de Configuração

    iInicio, iFim: integer;
    wHora, wMin, wSeg, wMSeg, wDiaComp, wMesComp, wAnoComp: word;

    iCodRec,             // Código de Recolhimento da GRE
    wNum: word;          // Número de C. Custos selecionados
    bArqAberto: boolean; // Indica se o Arquivo de Saída já foi aberto
    sIdEstab,            // Estabelecimento atualmente posicionado na geração
    sRemSem13,           // Remuneração sem 13º
    sRemSobre13,         // Remuneração sobre 13º
    sDtComp,             // Data da Competência
    sDtRecPrev,          // Data de recolhimento Prev. Social
    sDtAdmissao,         // Data de Admissão
    sOcorrencia,         // Indica se o Trabalhador está exposto a agente nocivo
    sClassContrib,       // Classe de Contribuição para Trabalhador autônomo
    sFPAS,               // Código de FPAS
    sInscrForn,          // Incrição do Fornecedor da Folha (Responsável)
    sIndRecFGTS,         // Indicador de recolhimento FGTS
    sRegitroAltTrab,     // Contém a(s) Movimentação(ões) dos Empregados
    sMes: string;        // Mês de Referência
    cTipInscrForn,       // Tipo da Incrição do Fornecedor da Folha (Responsável)
    cIndRecPrev: char;   // Indicador de Recolhimento da Perv. Social
    IniFuncEstab: TBookMark; // Marca a posição na Query Principal para que sejam gerados
                             // todos os Registros 13 e 14 para cada Estabelecimento

    procedure HabilitaBtOk;
    procedure LeAlteracoes;
    procedure GravaAlteracoes;
    function  VerificaOpcoesOk: boolean;
    procedure SelecionaResponsavel;
    procedure GerarRegistro00;
    procedure GerarRegistro10;
//    procedure GerarRegistro13;
    procedure GerarRegistro14;
    procedure GerarRegistro30;
    function  GerarRegistro32: string;
    procedure GerarRegistro90;
    procedure Finaliza(Msg: string);

    // Valida os dados do GFIP MAGNÉTICO
    function fValidaDadosGFIPMag(cTipo:char; sDado:string; wTamanho:word; Ch:char): string;

    // Rotinas de Validação de Dados
    function Val_CEP(CEP: string): string;
    //
    function Val_DtComp(Campo: string): string;
    //
    function Val_IndiRecFGTS(DtPag,DtComp: TDateTime): string;
    //
    function Val_DtRecFGTS(DtVenc,DtPag: TDateTime): string;
    //
    function Val_IndiRecPrevSoc(DtPag,Campo: TDateTime): char;
    //
    function Val_DtRecPrevSoc(Campo: string): string;
    //
    function Val_IndiAlteracao(Altera: char): char;
    //
    function Val_AliqSAT(Campo: real): string;
    //
    function Val_CodCentral(TipInscr,Campo: string): string;
    //
    function Val_FPAS(Campo: string): string;
    //
    function Val_CodTerceiros(Campo: string): string;
    //
    function Val_CodPagGPS10(Campo: string): string;
    //
    function Val_IsencFilant(Campo: real): string;
    //
    function Val_SalFamilia10(Campo: string): string;
    //
    function Val_SalMaternidade(Campo: string): string;
    //
    function Val_ContDescEmpregado10(Campo: string): string;
    //
    function Val_ValorDevPrev_Neg_Pos10(Campo: real): string;
    //
    function Val_ValorDevPrev10(Campo: string): string;
    //
    function Val_DtAdmissao(Categoria:integer; Campo:TDateTime): string;
    //
    function Val_MatrEmpregado(Categoria:integer; Campo:string): string;
    //
    function Val_CTPS(Categoria:integer; Ini,Tam:byte; Campo:string): string;
    //
    function Val_DtOpcao(Categoria:integer; Campo,DtAdmissao:TDateTime): string;
    //
    function Val_DtNascimento(Categoria:integer; DtAdmissao,Campo:TDateTime): string;
    //
    function Val_RemSem13(Campo: string): string;
    //
    function Val_RemSobre13(Categoria:integer; Campo:string): string;
    //
    function Val_ClassContrib(Categoria:integer; Campo:string): string;
    //
    function Val_Ocorrencia(Categoria:integer; Campo:string): string;
    //
    function Val_30_21(Categoria:integer; Campo: string): string;
    //
    function Val_BaseCalc13(Categoria:integer; Campo,Motivo:string): string;
    //
    function Val_30_23(Categoria:integer; Campo:string): string;
  end;

var
  frmParamGFIPMagnetico: TfrmParamGFIPMagnetico;

implementation

uses FileCtrl, uSistema, uMensErro, uDataBase, fAguarde, dBaseDados, uFuncoesUteisRH,
  UsoGeralRH, uComumRelats;

{$R *.DFM}

procedure TfrmParamGFIPMagnetico.FormCreate(Sender: TObject);
begin
  inherited;
  if not(Assigned(ListaCodEstab)) then
    ListaCodEstab := TStringList.Create;
  if not(Assigned(ListaCodCCusto)) then
    ListaCodCCusto := TStringList.Create;

  FazQuery(dtmBaseDados.qry,'SELECT NORMALINI FROM PARAMRH');
  cmbMes.ItemIndex := ExtraiMes(dtmBaseDados.qry.FieldByName('NORMALINI').asDateTime) - 1;
  speAno.Text := Copy(dtmBaseDados.qry.FieldByName('NORMALINI').asString,7,4);

  qryResp.Open;

  qryRespAux.Prepare;
  qryGPS.Prepare;

  // Monta Lista de Estabelecimentos
  dtmBaseDados.qry.Close;
  with (dtmBaseDados.qry) do
  begin
    SQL.Clear;
    SQL.Add('SELECT');
    SQL.Add('  PJ.IDPESSOA, PJ.NOME');
    SQL.Add('FROM');
    SQL.Add('  PESSOA PJ, FILIALPESSOA FP');
    SQL.Add('WHERE');
    // Estabelecimento(s) habilitado(s) para o usuário
    if (sUsuXfilial <> '') then
    begin
      if (Pos(',',sUsuXfilial) > 0) then
        SQL.Add('  (PJ.IDPESSOA IN ' +sUsuXfilial+ ') AND')
      else
        SQL.Add('  (PJ.IDPESSOA  = ' +sUsuXfilial+ ') AND');
    end;
    SQL.Add('  (PJ.IDGRUPO        = ' +IntToStr(Sistema.IdEmpresa)+ ') AND');
    SQL.Add('  (FP.IDFILIALPESSOA = PJ.IDPESSOA)');
    Open;
    chklstEstab.Items.Clear;
    ListaCodEstab.Clear;
    while not(EOF) do
    begin
      ListaCodEstab.Add(FieldByName('IDPESSOA').asString);
      chklstEstab.Items.Add(FieldByName('NOME').asString);
      Next;
    end;
  end;

  // Monta Lista de C. de Custos
  dtmBaseDados.qry.Close;
  with (dtmBaseDados.qry) do
  begin
    SQL.Clear;
    SQL.Add('SELECT');
    SQL.Add('  CODCENTROCUSTO, NOME');
    SQL.Add('FROM');
    SQL.Add('  CENTCUST');
    // C. de Custo(s) habilitado(s) para o usuário
    if (sUsuXccusto <> '') then
    begin
      if (Pos(',',sUsuXccusto) > 0) then
        SQL.Add('WHERE (CODCENTROCUSTO IN ' +sUsuXccusto+ ')')
      else
        SQL.Add('WHERE (CODCENTROCUSTO  = ' +sUsuXccusto+ ')');
    end;
    SQL.Add('ORDER BY');
    SQL.Add('  UPPER(NOME)');
    Open;
    chklstCCusto.Items.Clear;
    ListaCodCCusto.Clear;
    while not(EOF) do
    begin
      ListaCodCCusto.Add(FieldByName('CODCENTROCUSTO').asString);
      chklstCCusto.Items.Add(FieldByName('NOME').asString);
      Next;
    end;
  end;

  dblkcbResponsavel.Text := qryResp.FieldByName('NOME').asString;
  mkedCodEmpreCAIXA.Text := '';
  dtPagamento.Text := '07/'+Copy(DateToStr(Date),4,2)+'/'+Copy(DateToStr(Date),7,4);
  dtVencimento.Text := dtPagamento.Text;
  pnlHorario.Caption := '';
  pgctrlSel.ActivePageIndex := 0;

  LeAlteracoes;
  HabilitaBtOk;
end;

procedure TfrmParamGFIPMagnetico.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  GravaAlteracoes;
  qryRespAux.Close;
  qryEstab.Close;
  qryGPS.Close;
  qryResp.Close;

  qryRespAux.UnPrepare;
  qryGPS.UnPrepare;
  inherited;
end;

procedure TfrmParamGFIPMagnetico.chklstEstabDrawItem(Control: TWinControl; Index: Integer;
  Rect: TRect; State: TOwnerDrawState);
begin
  with (TCheckListBox(Control).Canvas) do
  begin
    if (TCheckListBox(Control).Checked[Index]) then
      if (odSelected in State) then
      begin
        Brush.Color := clTeal;
        Font.Color := clWhite;
      end
      else
      begin
        Brush.Color := CL_AMARELO_CLARO;
        Font.Color := clBlack;
      end;

    FillRect(Rect);
    TextOut(Rect.Left, Rect.Top, TCheckListBox(Control).Items[Index]);
  end;
end;

procedure TfrmParamGFIPMagnetico.dtVencimentoChange(Sender: TObject);
begin
  if (speCodRec.Value <> 906) then
    HabilitaBtOk;
end;

procedure TfrmParamGFIPMagnetico.speCodRecExit(Sender: TObject);
begin
  if (speCodRec.Value = 906) then
  begin
    MsgDlg('Este código é utilizado somente na Entrada de Dados do SEFIP', 'Aviso',
           mtInformation, [mbOk,mbHelp], 0);
    speCodRec.SetFocus;
  end;
end;

procedure TfrmParamGFIPMagnetico.chklstEstabClickCheck(Sender: TObject);
begin
  InvalidateItemListBox(TCustomListBox(Sender),TCustomListBox(Sender).ItemIndex);
  HabilitaBtOk;
end;

procedure TfrmParamGFIPMagnetico.bbtnSelTodosClick(Sender: TObject);
var
  c: integer;
  AuxObj: TCheckListBox;
begin
  if (pgctrlSel.ActivePageIndex = 0) then
    AuxObj := chklstEstab
  else
    AuxObj := chklstCCusto;

  for c:=0 to AuxObj.Items.Count-1 do
    AuxObj.Checked[c] := true;

  HabilitaBtOk;
  AuxObj.Repaint;
end;

procedure TfrmParamGFIPMagnetico.bbtnInverteSelClick(Sender: TObject);
var
  c: integer;
  AuxObj: TCheckListBox;
begin
  if (pgctrlSel.ActivePageIndex = 0) then
    AuxObj := chklstEstab
  else
    AuxObj := chklstCCusto;

  for c:=0 to AuxObj.Items.Count-1 do
    AuxObj.Checked[c] := not(AuxObj.Checked[c]);

  HabilitaBtOk;
  AuxObj.Repaint;
end;

procedure TfrmParamGFIPMagnetico.rbtnGerarClick(Sender: TObject);
begin
  // Verifica se as opções selecionadas estão corretamente selecionadas
  if not(VerificaOpcoesOk) then
  begin
    frmAguarde.Apaga;
    pnlHorario.Caption := '';
    exit;
  end;

  // Estabelecimentos selecionados
  CriaListaOpcoes(chklstEstab, ListaCodEstab, sCodEstabSel, ',', false);

  // C. de Custo selecionados
  wNum := CriaListaOpcoes(chklstCCusto, ListaCodCCusto, sCodCCustoSel, ',', true);
  if (wNum = ListaCodCCusto.Count) then
    sCodCCustoSel := '';

  // Inicializa variáveis
  sMes := QuotedStr(speAno.Text +'/'+ PoeZero(cmbMes.ItemIndex + 1));

  // *******************
  // Monta Query da GFIP
  // *******************
  with (dtmBaseDados.qry.SQL) do
  begin
    Clear;
    Add('SELECT DISTINCT');
    // Dados do Estabelecimento
    Add('  PJ.IDPESSOA AS IDESTAB,');
    Add('  NVL(FP.INDTIPOEMPRESA,0) AS COD_CENTRALIZACAO,');
    Add('  COD_TERC.COD_TERCEIROS,');
    Add('  FP.CUSTOPATROC AS PERC_ISENC_FILANT,');
    Add('  FPAS.IDFPAS AS FPAS,');
    Add('  FP.IDITEMCNAE AS CNAE,');
    Add('  NVL(VLR_SALARIO_FAM.VALOR,0) AS SALARIO_FAM,');
    Add('  NVL(VLR_SALARIO_MAT.VALOR,0) AS SALARIO_MAT,');
    Add('  NVL(VLR_CONT_DESC_EMPR.VALOR,0) AS CONT_DESC_EMPR,');
    // Dados do Funcionário
    Add('  F.IDPESSOA,');
    Add('  DECODE(F.TIPOCONTRATO,''3'',1,''A'',2,'''') AS TIPO_INSCRICAO_TOMADOR,');
    Add('  DECODE(F.TIPOCONTRATO,''3'',CGC_TOMADOR.NUM,''A'',CEI_TOMADOR.NUM,'''') AS INSCRICAO_TOMADOR,');
    Add('  RTRIM(F.MATRICULA) AS MATRICULA,');
    Add('  RTRIM(PF.NOME) AS TRABALHADOR,');
    Add('  CTPS.NUM AS CTPS,');
    Add('  PIS.NUM AS PIS,');
    Add('  ''0'' || SUBSTR(TO_CHAR(C.CBO2002),1,4) AS CBO,');
    Add('  NVL(F.IDCATEMPRGRE,1) AS CATEGORIA,');
    Add('  NVL(F.IDSITRISCO,-1) AS OCORRENCIA,');
    Add('  PESFIS.DATANASC,');
    Add('  F.DATAADMISSAO,');
    Add('  F.DATAOPCAOFGTS,');
    Add('  F.NUMCONTAFGTS,');
    Add('  F.NUMCONTASALARIO,');
    Add('  END.LOGRADOURO AS ENDERECO,');
    Add('  END.BAIRRO,');
    Add('  END.CEP,');
    Add('  END.CIDADE,');
    Add('  END.UF,');
    Add('  ST.TIPOSIT,');
    Add('  MO.MOTIVOFGTS,');
    Add('  HIST_SIT.MOTIVOFGTS AS MOTIVOFGTS_HIST,');
    Add('  F.DATADESLIGAMENTO,');
    Add('  F.DATARETORNO,');
    Add('  SAT.PERCSEGACIDTRAB AS SAT,');
    Add('  NVL(VLR_REM_SEM13.VALOR,0) AS REM_SEM13,');
    Add('  NVL(VLR_REM_SOBRE13.VALOR,0) AS REM_SOBRE13,');
    Add('  NVL(VLR_RET_SEG_MULT_VINC.VALOR,0) AS RET_SEG,');
    Add('  NVL(VLR_REM_CONTRIB_PREV.VALOR,0) AS REM_CONTRIB_PREV,');
    Add('  NVL(VLR_BASE13_PREV_SOC.VALOR,0) AS BASE13_PREV_SOC,');
    Add('  NVL(VLR_REM13_PREV_SOC.VALOR,0) AS REM13_PREV_SOC');
    // -------------------------------------------------------------------- //
    Add('FROM');
    Add('  PESSOA PJ, PESSOA PF, PESSOAFISICA PESFIS, FUNCIONARIO F, MOTIVO MO,');
    Add('  SITFUNC ST, CARGO C, FPAS, FILIALPESSOA FP, SEGACIDTRAB SAT,');
    // -------------------------------------------------------------------- //
    // Endereço de Alteração
    Add('  (SELECT');
    Add('     F.IDPESSOA,');
    Add('     DECODE(E.LOGRADOURO,NULL,'''',RTRIM(E.LOGRADOURO) ||'', ''|| E.NUMERO ||');
    Add('       DECODE(E.COMPLEMENTO,NULL,'''','' - '' || RTRIM(E.COMPLEMENTO))) AS LOGRADOURO,');
    Add('     E.BAIRRO, E.CEP, CI.NOME AS CIDADE, ES.CODESTADO AS UF');
    Add('   FROM');
    Add('     PESSOA PF, ENDPESS E, FUNCIONARIO F, CIDADES CI, ESTADO ES');
    Add('   WHERE');

    // C. Custo(s) selecionado(s)
    if (sCodCCustoSel <> '') then
    begin
      if (Pos(',',sCodCCustoSel) > 0) then
        Add('     (F.CODCENTROCUSTO   IN (' +sCodCCustoSel+ ')) AND')
      else
        Add('     (F.CODCENTROCUSTO    = ' +sCodCCustoSel+ ') AND');
    end;

    Add('     (F.TIPOCONTRATO     <> ''G'') AND');
    Add('     (F.IDPESSOA          = PF.IDPESSOA) AND');
    Add('     (PF.IDENDRESIDENCIAL = E.IDENDERECO) AND');
    Add('     (PF.IDPESSOA         = E.IDPESSOA) AND');
    Add('     (E.IDCIDADES         = CI.IDCIDADES) AND');
    Add('     (CI.IDESTADO         = ES.IDESTADO)) END,');
    // -------------------------------------------------------------------- //
    // CGC do Tomador de Serviços
    Add('  (SELECT FP.IDFILIALPESSOA AS IDPESSOA, RTRIM(DP.NUMDOCUMENTO) AS NUM');
    Add('   FROM   DOCPESSOA DP, FILIALPESSOA FP, TIPODOCOFICIAL TDO');
    Add('   WHERE ((TDO.SIGLADOCUMENTO = ''CNPJ:'') OR');
    Add('          (TDO.SIGLADOCUMENTO = ''CGC:'')) AND');
    Add('         (TDO.IDDOCUMENTO     = DP.IDDOCUMENTO) AND');
    Add('         (FP.IDFILIALPESSOA   = DP.IDPESSOA)) CGC_TOMADOR,');
    // -------------------------------------------------------------------- //
    // CEI do Tomador de Serviços
    Add('  (SELECT FP.IDFILIALPESSOA AS IDPESSOA, RTRIM(DP.NUMDOCUMENTO) AS NUM');
    Add('   FROM   DOCPESSOA DP, FILIALPESSOA FP, TIPODOCOFICIAL TDO');
    Add('   WHERE (TDO.SIGLADOCUMENTO = ''CEI:'') AND');
    Add('         (TDO.IDDOCUMENTO    = DP.IDDOCUMENTO) AND');
    Add('         (FP.IDFILIALPESSOA  = DP.IDPESSOA)) CEI_TOMADOR,');
    // -------------------------------------------------------------------- //
    // CTPS do Funcionário
    Add('  (SELECT F.IDPESSOA, DP.NUMDOCUMENTO AS NUM');
    Add('   FROM   DOCPESSOA DP, FUNCIONARIO F, TIPODOCOFICIAL TDO');
    Add('   WHERE (TDO.SIGLADOCUMENTO = ''CTPS:'') AND');
    Add('         (TDO.IDDOCUMENTO    = DP.IDDOCUMENTO) AND');
    Add('         (DP.IDPESSOA        = F.IDPESSOA)) CTPS,');
    // -------------------------------------------------------------------- //
    // PIS do Funcionário
    Add('  (SELECT F.IDPESSOA, DP.NUMDOCUMENTO AS NUM');
    Add('   FROM   DOCPESSOA DP, FUNCIONARIO F, TIPODOCOFICIAL TDO');
    Add('   WHERE (TDO.SIGLADOCUMENTO = ''PIS/PASEP:'') AND');
    Add('         (TDO.IDDOCUMENTO    = DP.IDDOCUMENTO) AND');
    Add('         (DP.IDPESSOA        = F.IDPESSOA)) PIS,');
    // -------------------------------------------------------------------- //
    // Valor do Sal. Família
    Add('  (SELECT');
    Add('     H.IDPESSJUR, SUM(H.VALORPROVENTO) AS VALOR');
    Add('   FROM');
    Add('     HISTRUBSAL H, PROVDESC P');
    Add('   WHERE');
    Add('     (P.CODRUBCLT = ''40573'') AND');
    Add('     (H.IDPESSJUR = '+IntToStr(Sistema.IdEmpresa)+') AND');
    Add('     (H.MES       = '+sMes+') AND');
    Add('     (H.IDRUBRICA = P.IDPROVENTO)');
    Add('   GROUP BY');
    Add('     H.IDPESSJUR) VLR_SALARIO_FAM,');
    // -------------------------------------------------------------------- //
    // Valor do Sal. Maternidade
    Add('  (SELECT');
    Add('     H.IDPESSJUR, SUM(H.VALORPROVENTO) AS VALOR');
    Add('   FROM');
    Add('     HISTRUBSAL H, PROVDESC P');
    Add('   WHERE');
    Add('     (P.CODRUBCLT  = ''40570'') AND');
    Add('     (H.IDPESSJUR  = '+IntToStr(Sistema.IdEmpresa)+') AND');
    Add('     (H.MES        = '+sMes+') AND');
    Add('     (P.IDPROVENTO = H.IDRUBRICA)');
    Add('   GROUP BY');
    Add('     H.IDPESSJUR) VLR_SALARIO_MAT,');
    // -------------------------------------------------------------------- //
    // Valor Contrib. Desc. Trabalhador
    Add('  (SELECT');
    Add('     H.IDPESSJUR, SUM(DECODE(P.FLGDESCONTO,1,-H.VALORPROVENTO,H.VALORPROVENTO)) AS VALOR');
    Add('   FROM');
    Add('     HISTRUBSAL H, PROVDESC P');
    Add('   WHERE');
    Add('     (P.CODRUBCLT         = ''50025'') AND');
    Add('     (H.IDPESSJUR         = ' +IntToStr(Sistema.IdEmpresa)+ ') AND');
    Add('     (H.MES               = ' +sMes+ ') AND');
    //Add('     (RTRIM(H.REFERENCIA) = ''13.o Salar'') AND');
    Add('     (P.IDPROVENTO        = H.IDRUBRICA)');
    Add('   GROUP BY');
    Add('      H.IDPESSJUR) VLR_CONT_DESC_EMPR,');
    // -------------------------------------------------------------------- //
    // Remuneração SEM 13º Salário
//    Add ('         ((P.CODRUBCLT  = ''40695'') OR (P.CODRUBCLT  = ''43701'')) AND');
    Add('  (SELECT');
    Add('     H.IDPESSOA, SUM(H.VALORPROVENTO) AS VALOR');
    Add('   FROM');
    Add('     HISTRUBSAL H, PROVDESC P');
    Add('   WHERE');
    Add('     (P.CODRUBCLT IN (''60695'',''60696'',''60697'',''60698'')) AND');
    Add('     (H.IDPESSJUR  = '+IntToStr(Sistema.IdEmpresa)+') AND');
    Add('     (H.MES        = '+sMes+') AND');
    Add('     (P.IDPROVENTO = H.IDRUBRICA)');
    Add('   GROUP BY');
    Add('     H.IDPESSOA) VLR_REM_SEM13,');
    // -------------------------------------------------------------------- //
    // Remuneração COM 13º Salário (Base de Cálculo para o FGTS)
//    Add ('         ((P.CODRUBCLT  = ''43696'') OR (P.CODRUBCLT  = ''43700'')) AND');
    Add('  (SELECT');
    Add('     H.IDPESSOA, SUM(DECODE(P.FLGDESCONTO,1,-H.VALORPROVENTO,H.VALORPROVENTO)) AS VALOR');
    Add('   FROM');
    Add('     HISTRUBSAL H, PROVDESC P');
    Add('   WHERE');
    Add('     (P.CODRUBCLT  = ''62022'') AND');
    Add('     (H.IDPESSJUR  = ' +IntToStr(Sistema.IdEmpresa)+ ') AND');
    Add('     (H.MES        = ' +sMes+ ') AND');
    Add('     (P.IDPROVENTO = H.IDRUBRICA)');
    Add('   GROUP BY');
    Add('     H.IDPESSOA) VLR_REM_SOBRE13,');
    // -------------------------------------------------------------------- //
    // Valor Retido Segurado - Multiplos Vínculos
    Add('  (SELECT');
    Add('     H.IDPESSOA, SUM(H.VALORPROVENTO) AS VALOR');
    Add('   FROM');
    Add('     HISTRUBSAL H, PROVDESC P');
    Add('   WHERE');
    Add('     (P.CODRUBCLT  = ''50035'') AND'); // 60423 era a que estava antes
    Add('     (H.IDPESSJUR  = ' +IntToStr(Sistema.IdEmpresa)+ ') AND');
    Add('     (H.MES        = ' +sMes+ ') AND');
    Add('     (P.IDPROVENTO = H.IDRUBRICA)');
    Add('   GROUP BY');
    Add('     H.IDPESSOA) VLR_RET_SEG_MULT_VINC,');
    // -------------------------------------------------------------------- //
    // Remuneração para cálculo da Contribuição Previdenciária
    Add('  (SELECT');
    Add('     H.IDPESSOA, SUM(H.VALORPROVENTO) AS VALOR');
    Add('   FROM');
    Add('     HISTRUBSAL H, PROVDESC P');
    Add('   WHERE');
    Add('     (P.CODRUBCLT IN (''60696'',''60697'')) AND');
    Add('     (H.IDPESSJUR  = '+IntToStr(Sistema.IdEmpresa)+') AND');
    Add('     (H.MES        = '+sMes+') AND');
    Add('     (P.IDPROVENTO = H.IDRUBRICA)');
    Add('   GROUP BY');
    Add('     H.IDPESSOA) VLR_REM_CONTRIB_PREV,');
    // -------------------------------------------------------------------- //
    // Base de cálculo 13º Prev. Soc.
    Add('  (SELECT');
    Add('     H.IDPESSOA, SUM(H.VALORPROVENTO) AS VALOR');
    Add('   FROM');
    Add('     HISTRUBSAL H, PROVDESC P, FUNCIONARIO F, SITFUNC SF');
    Add('   WHERE');
    Add('     (SF.TIPOSIT   = ''D'') AND');
    Add('     (P.CODRUBCLT  = ''62016'') AND');
    Add('     (H.IDPESSJUR  = ' +IntToStr(Sistema.IdEmpresa)+ ') AND');
    Add('     (H.MES        = ' +sMes+ ') AND');
    Add('     (F.IDSITFUNC  = SF.IDSITFUNC) AND');
    Add('     (F.IDPESSOA   = H.IDPESSOA) AND');
    Add('     (P.IDPROVENTO = H.IDRUBRICA)');
    Add('   GROUP BY');
    Add('     H.IDPESSOA) VLR_BASE13_PREV_SOC,');
    // -------------------------------------------------------------------- //
    // Remuneração de cálculo 13º Prev. Soc.
    Add('  (SELECT');
    Add('     H.IDPESSOA, SUM(H.VALORPROVENTO) AS VALOR');
    Add('   FROM');
    Add('     HISTRUBSAL H, PROVDESC P, FUNCIONARIO F, SITFUNC SF');
    Add('   WHERE');
    Add('     (SF.TIPOSIT   = ''D'') AND');
    Add('     (P.CODRUBCLT  = ''60421'') AND');
    Add('     (H.IDPESSJUR  = ' +IntToStr(Sistema.IdEmpresa)+ ') AND');
    Add('     (H.MES        = ' +sMes+ ') AND');
    Add('     (F.IDSITFUNC  = SF.IDSITFUNC) AND');
    Add('     (F.IDPESSOA   = H.IDPESSOA) AND');
    Add('     (P.IDPROVENTO = H.IDRUBRICA)');
    Add('   GROUP BY H.IDPESSOA) VLR_REM13_PREV_SOC,');
    // -------------------------------------------------------------------- //
    // Verifica se tem algum movimento para a pessoa
    Add('  (SELECT DISTINCT H.IDPESSOA');
    Add('   FROM   HISTRUBSAL H, MOTIVO MO');
    Add('   WHERE (MO.GRUPOMOTIVO IN (''F'',''D'')) AND');
    Add('         (H.IDPESSJUR     = '+IntToStr(Sistema.IdEmpresa)+') AND');
    Add('         (H.MES           = '+sMes+') AND');
    Add('         (MO.IDMOTIVO     = H.IDMOTIVO)');
    Add('   GROUP BY H.IDPESSOA) TEM_MOVIMENTO,');
    // -------------------------------------------------------------------- //
    // Pega a última situação funcional do Funcionário
    Add('  (SELECT DISTINCT H.IDPESSOA, MO.MOTIVOFGTS');
    Add('   FROM   FUNCIONARIO F, HSTSITFUNC H, MOTIVO MO');
    Add('   WHERE (H.IDPESSOA     = F.IDPESSOA) AND');
    Add('         (H.DATASITFUNC  = F.DATADESLIGAMENTO) AND');
    Add('         (H.IDMOTIVOOFIC = MO.IDMOTIVO)) HIST_SIT,');
    // -------------------------------------------------------------------- //
    // Código de Terceiros
    Add('  (SELECT');
    Add('     FP.IDFILIALPESSOA, MIN(CP.IDCONVPREVID) AS COD_TERCEIROS');
    Add('   FROM');
    Add('     FILIALPESSOA FP, CONVPREVID CP');
    Add('   WHERE');

    if (Pos(',',sCodEstabSel) > 0) then
      Add('     (FP.IDFILIALPESSOA IN (' +sCodEstabSel+ ')) AND')
    else
      Add('     (FP.IDFILIALPESSOA  = ' +sCodEstabSel+ ') AND');
      
    Add('     (FP.IDCONVPREVID   <> CP.IDCONVPREVID) AND');
    Add('     (FP.IDFPAS          = CP.IDFPAS)');
    Add('   GROUP BY');
    Add('     FP.IDFILIALPESSOA) COD_TERC');
    // -------------------------------------------------------------------- //
    Add('WHERE');
    if (Pos(',',sCodEstabSel) > 0) then
      Add('  (PJ.IDPESSOA            IN (' +sCodEstabSel+ ')) AND')
    else
      Add('  (PJ.IDPESSOA             = ' +sCodEstabSel+ ') AND');

    // C. Custo(s) selecionado(s)
    if (sCodCCustoSel <> '') then
    begin
      if (Pos(',',sCodCCustoSel) > 0) then
        Add('  (F.CODCENTROCUSTO    IN (' +sCodCCustoSel+ ')) AND')
      else
        Add('  (F.CODCENTROCUSTO     = ' +sCodCCustoSel+ ') AND');
    end;

    Add('  (F.TIPOCONTRATO      <> ''G'') AND');
    Add('  (FP.IDFILIALPESSOA    = PJ.IDPESSOA) AND');
    Add('  (FP.IDFPAS            = FPAS.IDFPAS) AND');
    Add('  (FP.IDFILIALPESSOA    = COD_TERC.IDFILIALPESSOA) AND');
    Add('  (PJ.IDPESSOA          = F.IDESTAB) AND');
    Add('  (F.IDPESSOA           = PF.IDPESSOA) AND');
    Add('  (F.IDPESSOA           = PESFIS.IDPESSOA) AND');
    Add('  (F.IDPESSOA           = TEM_MOVIMENTO.IDPESSOA) AND');
    Add('  (F.IDSITFUNC          = ST.IDSITFUNC) AND');
    Add('  (C.IDCARGO            = F.IDCARGO) AND');
    Add('  (F.IDPESSOA           = HIST_SIT.IDPESSOA(+)) AND');
    Add('  (F.IDPESSOA           = END.IDPESSOA(+)) AND');
    Add('  (F.IDMOTIVODESLIGRAIS = MO.IDMOTIVO(+)) AND');
    Add('  (PF.IDPESSOA          = CTPS.IDPESSOA(+)) AND');
    Add('  (PF.IDPESSOA          = PIS.IDPESSOA(+)) AND');
    Add('  (FP.IDSEGACIDTRAB     = SAT.IDSEGACIDTRAB(+)) AND');
    Add('  (PF.IDPESSOA          = CGC_TOMADOR.IDPESSOA(+)) AND');
    Add('  (PF.IDPESSOA          = CEI_TOMADOR.IDPESSOA(+)) AND');
    Add('  (PJ.IDGRUPO           = VLR_SALARIO_FAM.IDPESSJUR(+)) AND');
    Add('  (PJ.IDGRUPO           = VLR_SALARIO_MAT.IDPESSJUR(+)) AND');
    Add('  (PJ.IDGRUPO           = VLR_CONT_DESC_EMPR.IDPESSJUR(+)) AND');
    Add('  (PF.IDPESSOA          = VLR_REM_SEM13.IDPESSOA(+)) AND');
    Add('  (PF.IDPESSOA          = VLR_REM_SOBRE13.IDPESSOA(+)) AND');
    Add('  (PF.IDPESSOA          = VLR_RET_SEG_MULT_VINC.IDPESSOA(+)) AND');
    Add('  (PF.IDPESSOA          = VLR_REM_CONTRIB_PREV.IDPESSOA(+)) AND');
    Add('  (PF.IDPESSOA          = VLR_BASE13_PREV_SOC.IDPESSOA(+)) AND');
    Add('  (PF.IDPESSOA          = VLR_REM13_PREV_SOC.IDPESSOA(+))');
    Add('ORDER BY');
    Add('  IDESTAB, PIS');
    //SaveToFile('C:\QRY.TXT');
    SaveToFile(Sistema.RetornaCaminhoArquivos(Sistema.IdEmpresa)+'\QRY.TXT');//Ádler Teodoro de Souza SOL 109421 KINTANA 496332
  end;
  frmAguarde.Mostra('Selecionando dados da GFIP...');
  frmAguarde.Update;
  dtmBaseDados.qry.Open;

  // Inicializa variáveis globais do método
  bArqAberto := false;
  sFPAS := Val_FPAS(dtmBaseDados.qry.FieldByName('FPAS').asString);

  // Processa dados para a geração do arquivo, se estes existirem
  if not(dtmBaseDados.qry.IsEmpty) then
  begin
    try
      frmAguarde.Mostra('Processando dados da GFIP...');
      frmAguarde.Update;
      frmAguarde.Pos := 0;

      frmAguarde.Max := dtmBaseDados.qry.RecordCount;
      frmAguarde.Min := 0;

      // Associa e Cria/Recria o arquivo de GFIP
      AssignFile(fGFIP, svdlgDialogo.FileName);
      ReWrite(fGFIP);
      bArqAberto := true;

      // Loop para gerar o subarquivo de todos os estabelecimentos selecionados
      repeat
        // Não gerar para quem não tem valor de FGTS
        if ((dtmBaseDados.qry.FieldByName('REM_SEM13').asFloat +
             dtmBaseDados.qry.FieldByName('REM_SOBRE13').asFloat +
             dtmBaseDados.qry.FieldByName('REM_CONTRIB_PREV').asFloat) = 0) or
           (
             (dtmBaseDados.qry.FieldByName('TIPOSIT').asString = 'D') and
             ((UpperCase(Copy(dtmBaseDados.qry.FieldByName('MOTIVOFGTS').asString,1,1)) = 'I')  or
              (UpperCase(Trim(dtmBaseDados.qry.FieldByName('MOTIVOFGTS').asString))     = 'L')) and
             (QuotedStr(RetornaAnoMes(StrToDate(IncData(dtmBaseDados.qry.FieldByName('DATADESLIGAMENTO').asString,0,-1,0)))) = sMes) and
             (ExtraiDia(dtmBaseDados.qry.FieldByName('DATADESLIGAMENTO').asDateTime) <= spedDiaLimiteGRFC.Value)
           ) then
        begin
          frmAguarde.Pos := frmAguarde.Pos+1;
          dtmBaseDados.qry.Next;
          Continue;
        end;

        // Posiciono no Estabelecimento correto
        qryEstab.Locate('IDPESSOA', dtmBaseDados.qry.FieldByName('IDESTAB').asString, []);

        // Informações do responsável (header do arquivo)
        GerarRegistro00;
        // Informações da Empresa (header da Empresa)
        GerarRegistro10;

        if (rgGeraReg14.ItemIndex = 0) then
        begin
          // Loop para todos os funcionários deste estabelecimento (PARA GERAÇÃO DO REGISTRO 13)
          sIdEstab := dtmBaseDados.qry.FieldByName('IDESTAB').asString;
          IniFuncEstab := dtmBaseDados.qry.GetBookMark;
          repeat
            // 6-Data de Admissão
            sDtAdmissao := Val_DtAdmissao(dtmBaseDados.qry.FieldByName('CATEGORIA').asInteger,
              dtmBaseDados.qry.FieldByName('DATAADMISSAO').asDateTime);

            // Alteração cadastral do trabalhador
  //          GerarRegistro13;
            // Inclusão/Alteração do endereço do trabalhador
            GerarRegistro14;

            // Próximo Registro
            dtmBaseDados.qry.Next;
          until (dtmBaseDados.qry.EOF) or
                (sIdEstab <> dtmBaseDados.qry.FieldByName('IDESTAB').asString);
          dtmBaseDados.qry.GotoBookMark(IniFuncEstab);
          dtmBaseDados.qry.FreeBookMark(IniFuncEstab);
        end;

        // Loop para todos os funcionários deste estabelecimento (PARA GERAÇÃO DOS DEMAIS REGISTROS)
        sIdEstab := dtmBaseDados.qry.FieldByName('IDESTAB').asString;
        repeat
          // Pular quem não tem valor de FGTS
          if (dtmBaseDados.qry.FieldByName('REM_SEM13').asFloat +
              dtmBaseDados.qry.FieldByName('REM_SOBRE13').asFloat = 0) or
             (
               (dtmBaseDados.qry.FieldByName('TIPOSIT').asString = 'D') and
               (QuotedStr(RetornaAnoMes(StrToDate(IncData(dtmBaseDados.qry.FieldByName('DATADESLIGAMENTO').asString,0,-1,0)))) = sMes) and
               (ExtraiDia(dtmBaseDados.qry.FieldByName('DATADESLIGAMENTO').asDateTime) <= spedDiaLimiteGRFC.Value)
             ) then
          begin
            frmAguarde.Pos := frmAguarde.Pos+1;
            dtmBaseDados.qry.Next;
            Continue;
          end;

          // 6-Data de Admissão
          sDtAdmissao := Val_DtAdmissao(dtmBaseDados.qry.FieldByName('CATEGORIA').asInteger,
            dtmBaseDados.qry.FieldByName('DATAADMISSAO').asDateTime);

          // OBS: É feito desta maneira, pois preciso saber se o empregado teve movimentação
          // Gerar Registro de Movimentação do Trabalhador
          sRegitroAltTrab := GerarRegistro32;
          // Registro do Trabalhador
          GerarRegistro30;
          // Gravar Registro de Movimentação do Trabalhador
          if (sRegitroAltTrab <> '') then
            Write(fGFIP, sRegitroAltTrab);

          // Próximo Registro
          frmAguarde.Pos := frmAguarde.Pos+1;
          dtmBaseDados.qry.Next;
        until (dtmBaseDados.qry.EOF) or
              (sIdEstab <> dtmBaseDados.qry.FieldByName('IDESTAB').asString);

        // *************************************
        // Registro Tipo '90' - Registro Trailer
        // *************************************
        GerarRegistro90;

        // Próximo estabelecimento se não for o final do arquivo
        frmAguarde.Pos := frmAguarde.Pos+1;
        dtmBaseDados.qry.Next;
      until (dtmBaseDados.qry.EOF);

      Finaliza('Arquivo SEFIP.RE gerado com sucesso.');
    except
      on e: exception do
        Finaliza('Ocorreu um erro durante a geração do arquivo para o' +CR_LF+
          'Trabalhador: '+UpperCase(dtmBaseDados.qry.FieldByName('TRABALHADOR').asString) +
          CR_LF+CR_LF+ 'Descrição:' +CR_LF+
          E.Message);
    end;
  end
  else
    Finaliza('Não há dados a serem processados.');

  // Finalizo o método adequadamente
  frmAguarde.Apaga;
  qryGPS.Close;
  dtmBaseDados.qry.Close;
  if (bArqAberto) then
    CloseFile(fGFIP);

  pnlHorario.Caption := 'Tempo de Processamento: ' +TempoDecorrido(iFim - iInicio);
end;

procedure TfrmParamGFIPMagnetico.Finaliza(Msg: string);
begin
  DecodeTime(Time, wHora, wMin, wSeg, wMSeg);
  iFim := wMSeg + 1000 * wSeg + 60000 * wMin + 3600000 * wHora;

  frmAguarde.Apaga;
  Beep;
  ShowMessage(Msg);
end;

// *******************************************************************
// Registro Tipo '00' - Informações do responsável (header do arquivo)
// *******************************************************************
procedure TfrmParamGFIPMagnetico.GerarRegistro00;
begin
  // 16-Código de recolhimento
  iCodRec := speCodRec.Value;

  // 15-Data da competência
  wDiaComp := TrazUltDiaMes(cmbMes.ItemIndex+1, speAno.Value);
  wMesComp := cmbMes.ItemIndex+1;
  wAnoComp := speAno.Value;
  sDtComp := Val_DtComp(IntToStr(speAno.Value)+PoeZero(cmbMes.ItemIndex+1));

  // 17-Indicador de recolhimento do FGTS
  sIndRecFGTS := Val_IndiRecFGTS(dtPagamento.Date,dtVencimento.Date);

  // 20-Indicador de recolhimento Prev. Social
  cIndRecPrev := Val_IndiRecPrevSoc(qryGPS.FieldByName('DATAVENCGRPS').asDateTime,
    qryGPS.FieldByName('DATAFIMGRPS').asDateTime);

  // 21-Data de recolhimento Prev. Social
  sDtRecPrev := Val_DtRecPrevSoc(qryGPS.FieldByName('DATAFIMGRPS').asString);

  cTipInscrForn := '1'; // Tipo de Incrição da CM
  sInscrForn := '29185659000141'; //CNPJ da CM

  // Gravo o registro
  Write(fGFIP,
    // 01-Tipo do registro
    '00'+
    // 02-Brancos
    Replicate(' ',51)+
    // 03-Tipo de Remessa
    '1'+
    // 04-Tipo de inscrição-responsável (1->CNPJ; 2->CEI; 3->CPF)
    IFF(rgTipoInscricaoResp.ItemIndex = 0,
      fValidaDadosGFIPMag('N', qryRespAux.FieldByName('TIPO_INSCRICAO').asString, 1,' '),
      fValidaDadosGFIPMag('N', qryEstab.FieldByName('TIPO_INSCRICAO').asString, 1,' '))+
    // 05-Inscrição do responsável
    IFF(rgTipoInscricaoResp.ItemIndex = 0,
      fValidaDadosGFIPMag('N', qryRespAux.FieldByName('INSCRICAO').asString, 14,' '),
      fValidaDadosGFIPMag('N', qryEstab.FieldByName('INSCRICAO').asString, 14,' '))+
    // 06-Nome do responsável (Razão social)
    fValidaDadosGFIPMag('*', qryEstab.FieldByName('RAZAO').asString, 30,' ')+
    // 07-Nome da pessoa de contato
    fValidaDadosGFIPMag('A', qryRespAux.FieldByName('NOME').asString, 20,' ')+
    // 08-RUA = Logradouro + Rua + nº + andar + apartamento
    fValidaDadosGFIPMag('*', qryEstab.FieldByName('ENDERECO').asString, 50,' ')+
    // 09-Bairro
    fValidaDadosGFIPMag('*', qryEstab.FieldByName('BAIRRO').asString, 20,' ')+
    // 10-Cep
    Val_CEP(qryEstab.FieldByName('CEP').asString)+
    // 11-Cidade
    fValidaDadosGFIPMag('*', qryEstab.FieldByName('CIDADE').asString, 20,' ')+
    // 12-UF
    fValidaDadosGFIPMag('A', qryEstab.FieldByName('UF').asString, 2,' ')+
    // 13-Telefone de contato (DDD)
    fValidaDadosGFIPMag('N', qryEstab.FieldByName('DDD').asString, 3,' ')+
    // 13-Telefone de contato (Número)
    fValidaDadosGFIPMag('N', qryEstab.FieldByName('TELEFONE').asString, 9,' ')+
    // 14-Endereço INTERNET de contato
    Alinha(qryRespAux.FieldByName('EMAIL').asString, 60, 'E', ' ')+
    // 15-Data da competência
    sDtComp+
    // 16-Código de recolhimento
    IntToStr(iCodRec)+
    // 17-Indicador de recolhimento do FGTS
    sIndRecFGTS+
    // 18-Modalidade de Parcelamento do FGTS
    ' '+
    // 19-Data de recolhimento do FGTS
    Val_DtRecFGTS(dtVencimento.Date, dtPagamento.Date)+
    // 20-Indicador de recolhimento Prev. Social
    cIndRecPrev+
    // 21-Data de recolhimento Prev. Social
    sDtRecPrev+
    // 22-Indice de recolhimento em atraso da Prev. Social
    '       '+ // EM BRANCO
    // 23-Tipo de Inscrição - Fornecedor Folha de Pagmento
    cTipInscrForn+
    // 24-Inscrição do Fornecedor - Folha de Pagamento
    sInscrForn+
    // 25-Brancos
    Replicate(' ',18)+
    // 26-Final de linha
    '*'+CR_LF);
end;

// ***************************************************************
// Registro Tipo '10' - Informações da Empresa (header da Empresa)
// ***************************************************************
procedure TfrmParamGFIPMagnetico.GerarRegistro10;
begin
  // Gravo o registro
  Write(fGFIP,
    // 01-Tipo do registro
    '10'+
    // 02-Tipo de inscrição empresa (1->CNPJ; 2->CEI)
    fValidaDadosGFIPMag('N', qryEstab.FieldByName('TIPO_INSCRICAO').asString, 1,' ')+
    // 03-Inscrição do empresa
    fValidaDadosGFIPMag('N', qryEstab.FieldByName('INSCRICAO').asString, 14,' ')+
    // 04-Zeros
    Replicate('0',36)+
    // 05-Razão social
    fValidaDadosGFIPMag('*', qryEstab.FieldByName('RAZAO').asString, 40,' ')+
    // 06-RUA = Logradouro + Rua + nº + andar + apartamento
    fValidaDadosGFIPMag('*', qryEstab.FieldByName('ENDERECO').asString, 50,' ')+
    // 07-Bairro
    fValidaDadosGFIPMag('*', qryEstab.FieldByName('BAIRRO').asString, 20,' ')+
    // 08-Cep
    Val_CEP(qryEstab.FieldByName('CEP').asString)+
    // 09-Cidade
    fValidaDadosGFIPMag('*', qryEstab.FieldByName('CIDADE').asString, 20,' ')+
    // 10-UF
    fValidaDadosGFIPMag('A', qryEstab.FieldByName('UF').asString, 2,' ')+
    // 11-Contato Telefone (DDD)
    fValidaDadosGFIPMag('V', qryEstab.FieldByName('DDD').asString, 3,'0')+
    // 11-Contato Telefone (Número)
    fValidaDadosGFIPMag('V', qryEstab.FieldByName('TELEFONE').asString, 9,'0')+
    // 12-Indicador de alteração de endereço
    Val_IndiAlteracao('N')+ // FALTA FAZER
    // 13-CNAE
    Alinha(dtmBaseDados.qry.FieldByName('CNAE').asString,7,'E','0')+
    // 14-Indicador de alteração CNAE
    Val_IndiAlteracao('N')+ // FALTA FAZER
    // 15-Alíquota SAT
    Val_AliqSAT(qryGPS.FieldByName('SEGACIDTRABALHO').asFloat)+
    // 16-Código de centralização
    Val_CodCentral(qryEstab.FieldByName('TIPO_INSCRICAO').asString,
                   dtmBaseDados.qry.FieldByName('COD_CENTRALIZACAO').asString)+
    // 17-SIMPLES
    IntToStr(rgSimples.ItemIndex+1)+
    // 18-FPAS
    sFPAS+
    // 19-Código de terceiros
    Val_CodTerceiros(dtmBaseDados.qry.FieldByName('COD_TERCEIROS').asString)+
    // 20-Código de Pagamento GPS
    Val_CodPagGPS10(qryGPS.FieldByName('CODIGOPAG').asString)+
    // 21-Percentual de Inseção de Filantropia
    Val_IsencFilant(dtmBaseDados.qry.FieldByName('PERC_ISENC_FILANT').asFloat)+
    // 22-Salário família
    Val_SalFamilia10(FormatFloat('#########0.00',
      dtmBaseDados.qry.FieldByName('SALARIO_FAM').asFloat))+
    // 23-Salário Maternidade
    Val_SalMaternidade(dtmBaseDados.qry.FieldByName('SALARIO_MAT').asString)+
    // 24-Contrib. Desc. Trabalhador Referente à Competência 13
    Val_ContDescEmpregado10(dtmBaseDados.qry.FieldByName('CONT_DESC_EMPR').asString)+
    // 25-Indicador de valor negativo ou imposto
    Val_ValorDevPrev_Neg_Pos10(qryGPS.FieldByName('TOTAL').asFloat)+
    // 26-Valor devido à Prev. Soc. referente à Com. 13
    Val_ValorDevPrev10(FormatFloat('#########0.00',qryGPS.FieldByName('TOTAL').asFloat))+
    // 27-Banco para débito em conta corrente. (IMPLEMENTAÇÃO FUTURA)
    Replicate(' ', 3)+
    // 28-Agência para débito em conta corrente. (IMPLEMENTAÇÃO FUTURA)
    Replicate(' ', 4)+
    // 29-Conta para débito em conta corrente. (IMPLEMENTAÇÃO FUTURA)
    Replicate(' ', 9)+
    // 30-(IMPLEMENTAÇÃO FUTURA)
    Replicate('0', 15)+
    // 31-(IMPLEMENTAÇÃO FUTURA)
    Replicate('0', 15)+
    // 32-(IMPLEMENTAÇÃO FUTURA)
    Replicate('0', 15)+
    // 33-Brancos
    Replicate(' ', 4)+
    // 34-Final de linha
    '*'+CR_LF);
end;

// *******************************************************
// Registro Tipo '13' - Alteração cadastral do trabalhador
// *******************************************************
{procedure TfrmParamGFIPMagnetico.GerarRegistro13;
begin
  if not(dtmBaseDados.qry.FieldByName('CATEGORIA').asInteger in [11..21]) and
     (Comparar(iCodRec, [130,150,155,317,337,608,907,908,909,910]).Achou) and (wMesComp <> 13) then
  begin
    qryAltCad.Close;
    qryAltCad.ParamByName('IDPESSOA').asString := dtmBaseDados.qry.FieldByName('IDPESSOA').asString;
    qryAltCad.ParamByName('MES').asString := speAno.Text +'/'+ PoeZero(cmbMes.ItemIndex + 1);
    qryAltCad.Open;
    while not(qryAltCad.EOF) do
    begin
      // Gravo o registro no arquivo
      Write(fGFIP,
        // 01-Tipo do registro
        '13'+
        // 02-Tipo de inscrição (1->CNPJ; 2->CEI)
        fValidaDadosGFIPMag('N', qryEstab.FieldByName('TIPO_INSCRICAO').asString, 1, ' ')+
        // 03-Inscrição da Empresa
        fValidaDadosGFIPMag('N', qryEstab.FieldByName('INSCRICAO').asString, 14, ' ')+
        // 04-Zeros
        Replicate('0',36)+
        // 05-PIS/PASEP/CI
        fValidaDadosGFIPMag('N', dtmBaseDados.qry.FieldByName('PIS').asString, 11, ' ')+
        // 06-Data de admissão
        sDtAdmissao+
        // 07-Categoria do trabalhador
        fValidaDadosGFIPMag('N', dtmBaseDados.qry.FieldByName('CATEGORIA').asString, 2, '0')+
        // 08-Matrícula do trabalhador
        fValidaDadosGFIPMag('N', dtmBaseDados.qry.FieldByName('MATRICULA').asString, 11, ' ')+
        // 09-Número da CTPS
        Val_CTPS(dtmBaseDados.qry.FieldByName('CATEGORIA').asInteger, 1, 7, Trim(dtmBaseDados.qry.FieldByName('CTPS').asString))+
        // 10-Série da CTPS
        Val_CTPS(dtmBaseDados.qry.FieldByName('CATEGORIA').asInteger, 8, 5, Trim(dtmBaseDados.qry.FieldByName('CTPS').asString))+
        // 11-Nome do trabalhador
        fValidaDadosGFIPMag('A',dtmBaseDados.qry.FieldByName('TRABALHADOR').asString, 70, ' ')+
        // 12-Código empresa CAIXA // FALTA FAZER
        '              '+
        // 13-Código Trabalhador CAIXA
        fValidaDadosGFIPMag('N',dtmBaseDados.qry.FieldByName('NUMCONTAFGTS').asString, 11, '0')+
        // 14-Código de alteração cadastral
        fValidaDadosGFIPMag('N',qryAltCad.FieldByName('CODALTERACAO').asString, 3, '0')+
        // 15-Novo conteúdo do campo
        fValidaDadosGFIPMag('*',qryAltCad.FieldByName('ALTERACAO').asString, 70, ' ')+
        // 16-Brancos
        Replicate(' ',94)+
        // 17-Final de linha
        '*'+CR_LF);
      qryAltCad.Next;
    end;
  end;
end;}

// ******************************************************************
// Registro Tipo '14' - Inclusão/Alteração do endereço do trabalhador
// ******************************************************************
procedure TfrmParamGFIPMagnetico.GerarRegistro14;
begin
  if not(dtmBaseDados.qry.FieldByName('ENDERECO').IsNull) and (wMesComp <> 13) and
     (dtmBaseDados.qry.FieldByName('CATEGORIA').asInteger in [1..7,11,12,19,20,21]) and
     not(Comparar(iCodRec, [130,150,155,317,337,608,907,908,909,910]).Achou) then
    // Gravo o registro no arquivo
    Write(fGFIP,
      // 01-Tipo do registro
      '14'+
      // 02-Tipo de inscrição empresa (1->CNPJ; 2->CEI)
      fValidaDadosGFIPMag('N', qryEstab.FieldByName('TIPO_INSCRICAO').asString, 1,' ')+
      // 03-Inscrição do empresa
      fValidaDadosGFIPMag('N', qryEstab.FieldByName('INSCRICAO').asString, 14,' ')+
      // 04-Zeros
      Replicate('0',36)+
      // 05-PIS/PASEP/CI
      fValidaDadosGFIPMag('N', dtmBaseDados.qry.FieldByName('PIS').asString, 11,' ')+
      // 06-Data de admissão
      sDtAdmissao+
      // 07-Categoria do trabalhador
      fValidaDadosGFIPMag('N', dtmBaseDados.qry.FieldByName('CATEGORIA').asString, 2,'0')+
      // 08-Nome do trabalhador
      fValidaDadosGFIPMag('A', dtmBaseDados.qry.FieldByName('TRABALHADOR').asString, 70,' ')+
      // 09-Número da CTPS
      Val_CTPS(dtmBaseDados.qry.FieldByName('CATEGORIA').asInteger, 1, 7,
        Trim(dtmBaseDados.qry.FieldByName('CTPS').asString))+
      // 10-Série da CTPS
      Val_CTPS(dtmBaseDados.qry.FieldByName('CATEGORIA').asInteger, 8, 5,
        Trim(dtmBaseDados.qry.FieldByName('CTPS').asString))+
      // 11-RUA = Logradouro + Rua + nº + andar + apartamento
      fValidaDadosGFIPMag('*',dtmBaseDados.qry.FieldByName('ENDERECO').asString, 50, ' ')+
      // 12-Bairro
      fValidaDadosGFIPMag('*',dtmBaseDados.qry.FieldByName('BAIRRO').asString, 20, ' ')+
      // 13-CEP
      Val_CEP(dtmBaseDados.qry.FieldByName('CEP').asString)+
      // 14-Cidade
      fValidaDadosGFIPMag('*',dtmBaseDados.qry.FieldByName('CIDADE').asString, 20, ' ')+
      // 15-UF
      fValidaDadosGFIPMag('A', dtmBaseDados.qry.FieldByName('UF').asString, 2, ' ')+
      // 16-Brancos
      Replicate (' ',103)+
      // 17-Final de linha
      '*'+CR_LF);
end;

// ********************************************
// Registro Tipo '30' - Registro do trabalhador
// ********************************************
procedure TfrmParamGFIPMagnetico.GerarRegistro30;
begin
  // 16-Remuneração sem 13º
  sRemSem13 := Val_RemSem13(FormatFloat('#########0.00',
    dtmBaseDados.qry.FieldByName('REM_SEM13').asFloat));

  // 17-Remuneração sobre 13º
  sRemSobre13 := Val_RemSobre13(dtmBaseDados.qry.FieldByName('CATEGORIA').asInteger,
    FormatFloat('#########0.00', dtmBaseDados.qry.FieldByName('REM_SOBRE13').asFloat));

  // 18-Classe de Contribuição
  sClassContrib := Val_ClassContrib(dtmBaseDados.qry.FieldByName('CATEGORIA').asInteger, ' ');

  // 19-Ocorrência
  sOcorrencia := Val_Ocorrencia(dtmBaseDados.qry.FieldByName('CATEGORIA').asInteger,
    dtmBaseDados.qry.FieldByName('OCORRENCIA').asString);

  // Gravo o registro no arquivo
  Write(fGFIP,
    // 01-Tipo do registro
    '30'+
    // 02-Tipo de inscrição-empresa (1->CNPJ; 2->CEI)
    fValidaDadosGFIPMag('N', qryEstab.FieldByName('TIPO_INSCRICAO').asString, 1, ' ')+
    // 03-Inscrição do responsável
    fValidaDadosGFIPMag('N', qryEstab.FieldByName('INSCRICAO').asString, 14, ' ')+
    // 04-Tipo de inscrição - tomador
    fValidaDadosGFIPMag('N', dtmBaseDados.qry.FieldByName('TIPO_INSCRICAO_TOMADOR').asString, 1, ' ')+
    // 05-Inscrição tomador
    fValidaDadosGFIPMag('N', dtmBaseDados.qry.FieldByName('INSCRICAO_TOMADOR').asString, 14, ' ')+
    // 06-PIS/PASEP/CI
    fValidaDadosGFIPMag('N', dtmBaseDados.qry.FieldByName('PIS').asString, 11, ' ')+
    // 07-Data de admissão
    sDtAdmissao+
    // 08-Categoria do trabalhador
    fValidaDadosGFIPMag('N', dtmBaseDados.qry.FieldByName('CATEGORIA').asString, 2, '0')+
    // 09-Nome do trabalhador
    fValidaDadosGFIPMag('A', dtmBaseDados.qry.FieldByName('TRABALHADOR').asString, 70, ' ')+
    // 10-Matrícula do Trabalhador
    Val_MatrEmpregado(dtmBaseDados.qry.FieldByName('CATEGORIA').asInteger,
      dtmBaseDados.qry.FieldByName('MATRICULA').asString)+
    // 11-Número da CTPS
    Val_CTPS(dtmBaseDados.qry.FieldByName('CATEGORIA').asInteger, 1, 7,
      Trim(dtmBaseDados.qry.FieldByName('CTPS').asString))+
    // 12-Série da CTPS
    Val_CTPS(dtmBaseDados.qry.FieldByName('CATEGORIA').asInteger, 8, 5,
      Trim(dtmBaseDados.qry.FieldByName('CTPS').asString))+
    // 13-Data de opção
    Val_DtOpcao(dtmBaseDados.qry.FieldByName('CATEGORIA').asInteger,
      dtmBaseDados.qry.FieldByName('DATAOPCAOFGTS').asDateTime,
      dtmBaseDados.qry.FieldByName('DATAADMISSAO').asDateTime)+
    // 14-Data de nascimento
    Val_DtNascimento(dtmBaseDados.qry.FieldByName('CATEGORIA').asInteger,
      dtmBaseDados.qry.FieldByName('DATAADMISSAO').asDateTime,
      dtmBaseDados.qry.FieldByName('DATANASC').asDateTime)+
    // 15-CBO
    Alinha(dtmBaseDados.qry.FieldByName('CBO').asString, 5, 'D', '0')+
    // 16-Remuneração sem 13º
    sRemSem13+
    // 17-Remuneração sobre 13º
    sRemSobre13+
    // 18-Classe de contribuição
    sClassContrib+
    // 19-Ocorrência
    sOcorrencia+
    // 20-Valor Descontado do Segurado - Multiplos Vínculos
    fValidaDadosGFIPMag('N', FormatFloat('#########0.00',
      dtmBaseDados.qry.FieldByName('RET_SEG').asFloat), 15, '0')+
    // 21-Remuneração para cálculo da Contribuição Previdenciária
    Val_30_21(dtmBaseDados.qry.FieldByName('CATEGORIA').asInteger,
      dtmBaseDados.qry.FieldByName('REM_CONTRIB_PREV').asString)+
    // 22-Base de cálculo 13º salário Prev. Soc. -
    Val_BaseCalc13(dtmBaseDados.qry.FieldByName('CATEGORIA').asInteger,
      FormatFloat('#########0.00', dtmBaseDados.qry.FieldByName('BASE13_PREV_SOC').asFloat),
      dtmBaseDados.qry.FieldByName('MOTIVOFGTS').asString)+
    // 23-Remuneração 13º salário Prev. Soc. - Base de Cálculo para a competência 13
    Val_30_23(dtmBaseDados.qry.FieldByName('CATEGORIA').asInteger,
      FormatFloat('#########0.00', dtmBaseDados.qry.FieldByName('REM13_PREV_SOC').asFloat))+
    // 24-Brancos
    Replicate(' ',98)+
    // 25-Final de linha
    '*'+CR_LF);
end;

// *********************************************************
// Registro Tipo '32' - Registro de movimentação trabalhador
// *********************************************************
function TfrmParamGFIPMagnetico.GerarRegistro32: string;
var
  c, byNumReg: byte;
  DtMov, CodMov: array [1..2] of string;
  sDataAfast, sDataRet, sAux: string;
  cIndRecFGTS: char;
begin
  // Seleciono a data de início do afastamento ou data de demissão
  if (Trim(dtmBaseDados.qry.FieldByName('DATADESLIGAMENTO').asString) <> '') then
    sDataAfast := DateToStr(dtmBaseDados.qry.FieldByName('DATADESLIGAMENTO').asDateTime)
  else
    sDataAfast := '';

  // Seleciono a data de retorno do afastamento
  if (Trim(dtmBaseDados.qry.FieldByName('DATARETORNO').asString) <> '') then
    sDataRet := DateToStr(dtmBaseDados.qry.FieldByName('DATARETORNO').asDateTime)
  else
    sDataRet := '';

  // Se for afastamento, as dastas devem indicar o último dia trabalhado e o último
  // dia de afastamento respectivamente
  if (Trim(dtmBaseDados.qry.FieldByName('TIPOSIT').asString) <> 'D') and
     (Trim(dtmBaseDados.qry.FieldByName('DATADESLIGAMENTO').asString) <> '') then
  begin
    sDataAfast := IncData(sDataAfast,-1,0,0);
    sDataRet := IncData(sDataRet,-1,0,0);
  end;

  // Caso o trabalhador tenha sido afastado e retornado na competência, indico que serão
  // gerados dois registros. Um inicial com a data de afastamento e um final com a data
  // de retorno
  if ((Trim(dtmBaseDados.qry.FieldByName('TIPOSIT').asString) = 'A') and (sDataRet <> '') and
     (Copy(sDataRet,7,4)+Copy(sDataRet,4,2) = sDtComp)) then
  begin
    DtMov[1] := TiraBarra(sDataAfast);
    DtMov[2] := TiraBarra(sDataRet);
    byNumReg := 2;
  end
  else
  // Caso o trabalhador foi demitido ou está afastado, indico que será gravado apenas um
  // registro contendo a movimentação de demissão ou afastamento
  if (dtmBaseDados.qry.FieldByName('TIPOSIT').asString[1] in ['F','D']) and
     (sDataAfast <> '') and
     ((dtmBaseDados.qry.FieldByName('MOTIVOFGTS').asString = 'O1') or
      (dtmBaseDados.qry.FieldByName('MOTIVOFGTS').asString = 'O2') or
      (dtmBaseDados.qry.FieldByName('MOTIVOFGTS').asString = 'Q1') or
      (dtmBaseDados.qry.FieldByName('MOTIVOFGTS').asString = 'R') or
      (dtmBaseDados.qry.FieldByName('MOTIVOFGTS').asString =
       dtmBaseDados.qry.FieldByName('MOTIVOFGTS_HIST').asString) or
      (Copy(sDataAfast,7,4) + Copy(sDataAfast,4,2) = sDtComp)) then
  begin
    DtMov[1] := TiraBarra(sDataAfast);
    byNumReg := 1;
  end
  else
    byNumReg := 0;

  // Se houver movimentação para o trabalhador gravo o(s) registro(s)
  sAux := '';
  if (byNumReg > 0) and (wMesComp <> 13) and
     (dtmBaseDados.qry.FieldByName('CATEGORIA').asInteger in [1..5,11,12]) then
  begin
    // 10-Código de movimentação
    if (byNumReg = 2) then
    begin
      CodMov[1] := UpperCase(Trim(dtmBaseDados.qry.FieldByName('MOTIVOFGTS_HIST').asString));
      CodMov[2] := UpperCase(Trim(dtmBaseDados.qry.FieldByName('MOTIVOFGTS').asString));
    end
    else
      CodMov[1] := UpperCase(Trim(dtmBaseDados.qry.FieldByName('MOTIVOFGTS').asString));

    // 12-Indicativo de recolhimento do FGTS
    if (sDtComp > '199801') and ((Copy(CodMov[1],1,1) = 'I') or (Trim(CodMov[1]) = 'L')) then
      cIndRecFGTS := 'S'
    else
      cIndRecFGTS := ' ';

    // Geração do registro
    for c:=1 to byNumReg do
      sAux := sAux +
        // 01-Tipo do registro
        '32'+
        // 02-Tipo de inscrição-empresa (1->CGC/CNPJ; 2->CEI)
        fValidaDadosGFIPMag('N', qryEstab.FieldByName('TIPO_INSCRICAO').asString, 1,' ')+
        // 03-Inscrição do empresa
        fValidaDadosGFIPMag('N', qryEstab.FieldByName('INSCRICAO').asString, 14,' ')+
        // 04-Tipo de inscrição - tomador
        fValidaDadosGFIPMag('N',
          dtmBaseDados.qry.FieldByName('TIPO_INSCRICAO_TOMADOR').asString, 1, ' ')+
        // 05-Inscrição tomador
        fValidaDadosGFIPMag('N', dtmBaseDados.qry.FieldByName('INSCRICAO_TOMADOR').asString, 14, ' ')+
        // 06-PIS/PASEP/CI
        fValidaDadosGFIPMag('N', dtmBaseDados.qry.FieldByName('PIS').asString, 11, ' ')+
        // 07-Data de admissão
        sDtAdmissao+
        // 08-Categoria do trabalhador
        fValidaDadosGFIPMag('N', dtmBaseDados.qry.FieldByName('CATEGORIA').asString, 2, '0')+
        // 09-Nome do trabalhador
        fValidaDadosGFIPMag('A', dtmBaseDados.qry.FieldByName('TRABALHADOR').asString, 70, ' ')+
        // 10-Código de movimentação
        fValidaDadosGFIPMag('*', CodMov[c], 2, ' ')+
        // 11-Data de movimentação
        DtMov[c]+
        // 12-Indicativo de recolhimento do FGTS
        cIndRecFGTS+
        // 13-Brancos
        Replicate(' ', 225)+
        // 14-Final de linha
        '*'+CR_LF;
  end;

  Result := sAux;
end;

procedure TfrmParamGFIPMagnetico.GerarRegistro90;
begin
  Write(fGFIP,
    // 01-Tipo do registro
    '90'+
    // 02-Repetição do caracter nove
    Replicate('9',  51)+
    // 03-Brancos
    Replicate(' ', 306)+
    // 04-Final de linha
    '*'+CR_LF);
end;

procedure TfrmParamGFIPMagnetico.HabilitaBtOk;
var
  c: integer;
  bSelEstab: boolean;
begin
  bSelEstab := false;
  for c:=0 to chklstEstab.Items.Count-1 do
    if (chklstEstab.Checked[c]) then
    begin
      bSelEstab := true;
      break;
    end;

  rbtnGerar.Enabled := (bSelEstab) and (Trim(speAno.Text) <> '') and
    (Trim(dtVencimento.Text) <> '') and (Trim(dtPagamento.Text) <> '') and
    (Trim(dblkcbResponsavel.Text) <> '') and (Trim(speCodRec.Text) <> '');
end;

function TfrmParamGFIPMagnetico.VerificaOpcoesOk: boolean;
var
  wOpcao: word;
begin
  Result := false;

  // Confirma os períodos com o usuário
  if (StrToDate(dtPagamento.Text) <> StrToDate(dtVencimento.Text)) then
    if (MsgDlg('Data do Pagamento diferente da Data do Vencimento. Continuar?', 'Aviso',
               mtConfirmation, [mbYes,mbNo], 0) = mrNo) then
      exit;

  // Abro o diálogo de seleção do arquivo
  //if not(DirectoryExists('C:\SEFIP')) then
  if not(DirectoryExists(Sistema.RetornaCaminhoArquivos(Sistema.IdEmpresa)+'\SEFIP')) then //Ádler Teodoro de Souza SOL 109421 KINTANA 496332
  begin
   // wOpcao := MsgDlg('Pasta C:\SEFIP não foi encontrada.' +CR_LF+
   //                  'Deseja Criá-la agora?', 'Aviso', mtInformation, [mbYes,mbNo,mbCancel], 0);
    wOpcao := MsgDlg('Pasta'+ Sistema.RetornaCaminhoArquivos(Sistema.IdEmpresa) +'\SEFIP não foi encontrada.' +CR_LF+ //Ádler Teodoro de Souza SOL 109421 KINTANA 496332
                     'Deseja Criá-la agora?', 'Aviso', mtInformation, [mbYes,mbNo,mbCancel], 0);

    if (wOpcao = mrYes) then
      //CreateDir('C:\SEFIP\')
      CreateDir(Sistema.RetornaCaminhoArquivos(Sistema.IdEmpresa)+'\SEFIP\') //Ádler Teodoro de Souza SOL 109421 KINTANA 496332

    else
    if (wOpcao = mrCancel) or ((wOpcao = mrNo) and not(svdlgDialogo.Execute)) then
      exit;
  end;

  // Verifica se o arquivo existe na pasta escolhida
  if (FileExists(svdlgDialogo.FileName)) then
    if (MsgDlg('O arquivo já existe na pasta especificada. Você deseja sobrescrevê-lo?',
               'Aviso', mtConfirmation, [mbYes,mbNo], 0) = mrNo) then
      exit;

  // Verifica se há alguma GRPS cadastrada na data
  qryGPS.ParamByName('DATA').asString := Copy(dtVencimento.Text,4,8);

  frmAguarde.pbAguarde.Visible := false;
  frmAguarde.Mostra('Verificando geração de GPS...');

  qryGPS.Open;
  if (qryGPS.IsEmpty) then
  begin
    MsgDlg ('GPS do Mês selecionado não foi gerada.', 'Aviso', mtInformation, [mbOK,mbHelp], 0);
    qryGPS.Close;
    exit;
  end;

  DecodeTime(Time, wHora, wMin, wSeg, wMSeg);
  iInicio := wMSeg + 1000 * wSeg + 60000 * wMin + 3600000 * wHora;

  // Seleciona o Responsável pela informação
  SelecionaResponsavel;
  if (qryRespAux.IsEmpty) then
  begin
    MsgDlg('Dados do Responsável selecionado não estão completos.'+CR_LF+
           'Verifique e tente novamente.', 'Aviso', mtInformation, [mbOK,mbHelp], 0);
    dblkcbResponsavel.SetFocus;
    exit;
  end;

  Result := true;
end;

procedure TfrmParamGFIPMagnetico.SelecionaResponsavel;
begin
  frmAguarde.Mostra('Verificando seleção do Estabelecimento...');
  CriaListaOpcoes(chklstEstab, ListaCodEstab, sCodEstabSel, ',', false);
  qryEstab.Close;
  if (Pos(',',sCodEstabSel) > 0) then
    qryEstab.SQL[39] := '  (PJ.IDPESSOA       IN (' +sCodEstabSel+ ')) AND'
  else
    qryEstab.SQL[39] := '  (PJ.IDPESSOA        = ' +sCodEstabSel+ ') AND';
  qryEstab.Open;

  frmAguarde.Mostra('Verificando seleção do Responsável...');
  frmAguarde.Update;
  qryRespAux.Close;
  qryRespAux.ParamByName('IDPESSOA').asString := qryResp.FieldByName('IDPESSOA').asString;
  qryRespAux.Open;
end;

// *************************************************************************************
// Parâmetros: sTipo          - A, AN, N, V, D (Vide Manual da SEFIP, pág.13)
//             sDado          - Dado a ser validado
//             iTamanho       - Tamanho de retorno da string validada
// *************************************************************************************
function TfrmParamGFIPMagnetico.fValidaDadosGFIPMag(cTipo:char; sDado:string; wTamanho:word;
  Ch:char): string;
var
  sTemp: string;
  c, wMax: word;
begin
  Result := 'ERRO VALIDA GFIP';
  // Faz Validação básica para a utilização da Função
  // Verifica se o tamanho é válido
  if not(cTipo in ['*','A','N','V','D']) or (wTamanho <= 0) then
    exit;

  // Inicializa Variáveis
  sTemp := '';
  cTipo := UpCase(cTipo);
  sDado := Trim(sDado);

  // Atribuo o maior tamanho verificável possível
  if (wTamanho > Length(sDado)) then
    wMax := Length(sDado)
  else
    wMax := wTamanho;

  // ******************************
  // Faz tratamento das informações
  // ******************************
  case (cTipo) of
    '*','A' : // Campos Alfanuméricos e Alfabéticos
    begin
      try
        sDado := UpperCase(NormalizaString(ConverteCar(TiraCarRepetidos(sDado, 2))));

        for c:=1 to length(sDado) do
          if ((cTipo = 'A') and (sDado[c] in [' ','A'..'Z'])) or
             ((cTipo = '*') and (sDado[c] in [' ','A'..'Z','0'..'9'])) then
            sTemp := sTemp+sDado[c];

        sTemp := Alinha(TiraCarRepetidos(Copy(sTemp,1,wMax),1), wTamanho, 'E', Ch);
      except
        sTemp := Replicate(Ch, wTamanho);
      end;
    end;
    'N' : // Campos Numéricos
    begin
      try
        for c:=1 to length(sDado) do
          if (sDado[c] in ['0'..'9']) then
            sTemp := sTemp+sDado[c];

        sTemp := Alinha(Copy(sTemp,1,wMax), wTamanho, 'D', Ch);
      except
        sTemp := Replicate(Ch, wTamanho);
      end;
    end;
    'V' : // Campos de Valor
    begin
      try
        for c:=1 to length(sDado) do
          if (sDado[c] in ['0'..'9']) then
            sTemp := sTemp+sDado[c];

        sTemp := Alinha(Copy(sTemp,1,wMax), wTamanho, 'D', Ch);
      except
        sTemp := Replicate(Ch, wTamanho);
      end;
    end;
    'D' : // Campos Data
    begin
      try
        StrToDate (sTemp);
        sTemp := Alinha(TiraBarra(sTemp), wTamanho, 'D', Ch);
      except
        sTemp := Replicate(Ch, wTamanho);
      end;
    end;
  end;
  Result := sTemp;
end;

function TfrmParamGFIPMagnetico.Val_CEP(CEP: string): string;
begin
  if (CEP <> '20000000') and (CEP <> '30000000') and (CEP <> '70000000') and
     (CEP <> '80000000') then
    Result := fValidaDadosGFIPMag('N', CEP, 8,' ')
  else
    Result := '        ';
end;

function TfrmParamGFIPMagnetico.Val_DtComp(Campo: string): string;
begin
  if ((wMesComp = 13) and (wAnoComp < 1998)) or
     ((Comparar(iCodRec, [130,145,244,122,327,337,345,640,650,660,904,909,911]).Achou) and
      (wMesComp = 13)) or
     ((iCodRec = 904) and (wMesComp <= 10) and (wAnoComp <= 1998)) or
     ((iCodRec = 911) and (wMesComp <= 03) and (wAnoComp <= 2000)) or
     ((iCodRec = 640) and (wMesComp >= 10) and (wAnoComp >= 1988)) then
    Result := '      '
  else
    Result := Campo;
end;

function TfrmParamGFIPMagnetico.Val_IndiRecFGTS(DtPag,DtComp: TDateTime): string;
begin
  if (wMesComp = 13) or (Comparar(iCodRec, [903,904,905,907,908,909,910,911]).Achou) then
    Result := ' '  // BRANCO
  else
  if (Comparar(iCodRec,[145,307,317,327,337,345,640]).Achou) or (DtPag > DtComp) then
    Result := '2'  // GFIP em atraso
  else
    Result := '1'; // GFIP no prazo
end;

function TfrmParamGFIPMagnetico.Val_DtRecFGTS(DtVenc,DtPag: TDateTime): string;
begin
  if (sIndRecFGTS = '2') and (DtVenc < DtPag) then
    Result := TiraBarra(DateToStr(DtPag))
  else
    Result := '        ';
end;

function TfrmParamGFIPMagnetico.Val_IndiRecPrevSoc(DtPag,Campo: TDateTime): char;
begin
  if ((wMesComp < 10) and (wAnoComp <= 1998)) or
     (Comparar(iCodRec, [145,317,337,345,640,660]).Achou) or (Campo = 0) then
    Result := '3'    // Não gerou GPS
  else
  begin
    if (DtPag <= Campo) then
      Result := '1'  // no prazo
    else
      Result := '2'; // em atraso
  end;
end;

function TfrmParamGFIPMagnetico.Val_DtRecPrevSoc(Campo: string): string;
begin
  if (cIndRecPrev <> '2') then
    Result := '        '
  else
    Result := TiraBarra(Campo);
end;

function TfrmParamGFIPMagnetico.Val_IndiAlteracao(Altera: char): char;
begin
  if (wMesComp = 13) or (Altera = 'N') then
    Result := 'N'
  else
    Result := 'S';
end;

function TfrmParamGFIPMagnetico.Val_AliqSAT(Campo: real): string;
{-->}function ConverteSAT(Aliq: real): string;
     var
       sAux: string;
       byPos: byte;
     begin
       sAux := Float2String (Aliq);
       byPos := Pos ('.', sAux);
       Result := sAux[1] + Copy(sAux, byPos+1, 1);
{-->}end;
begin
  if (sFPAS = '604') or (sFPAS = '647') or ((rgSimples.ItemIndex+1) in [2,3]) or
     (Campo = 0) or ((wMesComp < 10) and (wAnoComp <= 1998)) or
     (Comparar(iCodRec, [604,647,825,833,868]).Achou) then
    Result := '  '
  else  // Se não, formata a alíquota
    Result := ConverteSAT(Campo);
end;

function TfrmParamGFIPMagnetico.Val_CodCentral(TipInscr,Campo: string): string;
begin // 0 (não centralizada), 1 (centralizadora), 2 (centralizada)
  if (Comparar(iCodRec, [130,150,155,317,337,608,903,904,907,908,909,910,911]).Achou) or
     (TipInscr = '2') or (Trim(Campo) = '') then
    Result := '0'
  else // Preenche com o código correto
    Result := Copy(Campo,1,1);
end;

function TfrmParamGFIPMagnetico.Val_FPAS(Campo: string): string;
begin
  if (Campo = '620') or (Campo = '744') or (Campo = '779') then
    Result := '   '
  else
    Result := fValidaDadosGFIPMag('N', Campo, 3, '0');
end;

function TfrmParamGFIPMagnetico.Val_CodTerceiros(Campo: string): string;
begin
  if not(Comparar(iCodRec, [145,345,640,660]).Achou) and
     not((rgSimples.ItemIndex+1) in [2,3]) and
     ((IntToStr(wAnoComp) + PoeZero(wMesComp)) >= '199810') then
    Result := fValidaDadosGFIPMag('N', Campo, 4, '0')
  else
    Result := '0000';
end;

function TfrmParamGFIPMagnetico.Val_CodPagGPS10(Campo:string): string;
begin
  if (Comparar(iCodRec, [115,150,307,327,650,903,904,905,907]).Achou) then
    Result := fValidaDadosGFIPMag('N', Campo, 4,' ')
  else
    Result := '    ';
end;

function TfrmParamGFIPMagnetico.Val_IsencFilant(Campo: real): string;
{-->}function ConverteIsencFilant(Aliq: real): string;
     var
       sAux: string;
       byPos: byte;
     begin
       sAux := Float2String(Aliq);
       byPos := Pos('.', sAux);
       if (byPos > 4) then
         Result := Copy(sAux,1,3) + Copy(sAux,byPos+1,2)
       else
         Result := Alinha(Copy(sAux,1,byPos-1), 3, 'D', '0') + Copy(sAux,byPos+1,2);
{-->}end;
begin
  if (sFPAS = '639') and (wMesComp > 4) and (wAnoComp <= 1999) then
    Result := ConverteIsencFilant(Campo)
  else
    Result := '     ';
end;

function TfrmParamGFIPMagnetico.Val_SalFamilia10(Campo: string): string;
begin
  if (wMesComp = 13) or ((wMesComp < 10) and (wAnoComp <= 1998)) or
     (Comparar(iCodRec, [145,345,640,650,660,904]).Achou) then
    Result := '000000000000000'
  else
    Result := fValidaDadosGFIPMag('V', Campo, 15, '0');
end;

function TfrmParamGFIPMagnetico.Val_SalMaternidade(Campo: string): string;
begin
  if ((wMesComp < 10) and (wAnoComp <= 1998)) or
     (Comparar(iCodRec, [130,145,345,640,650,660,904,909,911]).Achou) then
    Result := '000000000000000'
  else
    Result := fValidaDadosGFIPMag('V', Campo, 15, '0');
end;

function TfrmParamGFIPMagnetico.Val_ContDescEmpregado10(Campo:string): string;
begin
  if (Comparar(iCodRec, [115,307,327,903,905]).Achou) and (wMesComp = 12) then
    Result := fValidaDadosGFIPMag('V', Campo, 15, '0')
  else
    Result := '000000000000000';
end;

function TfrmParamGFIPMagnetico.Val_ValorDevPrev_Neg_Pos10(Campo: real): string;
begin
  if not(Comparar(iCodRec, [115,307,327,903,905]).Achou) and (wMesComp = 12) then
  begin
    if (Campo >= 0) then
      Result := '0'
    else
      Result := '1';
  end
  else
    Result := '0';
end;

function TfrmParamGFIPMagnetico.Val_ValorDevPrev10(Campo: string): string;
begin
  if not(Comparar(iCodRec, [145,345,640,660]).Achou) and (wMesComp = 12) then
    Result := fValidaDadosGFIPMag('V', Campo, 14, '0')
  else
    Result := '00000000000000';
end;

function TfrmParamGFIPMagnetico.Val_MatrEmpregado(Categoria:integer; Campo:string): string;
begin
  if (Categoria in [6,13..16]) then
    Result := '           '
  else
    Result := fValidaDadosGFIPMag('N', Campo, 11, ' ');
end;

function TfrmParamGFIPMagnetico.Val_CTPS(Categoria:integer; Ini,Tam:byte; Campo:string): string;
var
  c: byte;
  sAux: string;
begin
  if (Categoria <> 5) then
  begin
    for c:=1 to length(Campo) do
      if (Campo[c] in ['0'..'9']) then
        sAux := sAux + Campo[c];
    Result := Replicate ('0', Abs(Tam-Length(Copy(sAux,Ini,Tam)))) + Copy(sAux,Ini,Tam);
  end
  else
    Result := Replicate(' ', Tam)
end;

function TfrmParamGFIPMagnetico.Val_DtOpcao(Categoria:integer; Campo,DtAdmissao:TDateTime): string;
begin
  if (Categoria in [1,3,4,5,6,7]) and (Campo >= DtAdmissao) and (iCodRec <> 640) then
    Result := TiraBarra (DateTimeToStr(Campo))
  else
    Result := Replicate(' ', 8);
end;

function TfrmParamGFIPMagnetico.Val_DtNascimento(Categoria:integer;
  DtAdmissao,Campo:TDateTime): string;
begin
  if (Categoria in [1..7,12,19..21]) and (Campo < DtAdmissao) and
     (Campo >= StrToDate('01/01/1900')) then
    Result := TiraBarra(DateToStr(Campo))
  else
    Result := Replicate(' ', 8);
end;

function TfrmParamGFIPMagnetico.Val_RemSem13(Campo: string): string;
begin
  if (wMesComp <> 13) then
    Result := fValidaDadosGFIPMag('V', Campo, 15, '0')
  else
    Result := '000000000000000';
end;

function TfrmParamGFIPMagnetico.Val_RemSobre13(Categoria:integer; Campo:string): string;
begin
  if (wMesComp <> 13) and (Categoria in [1..7,11,12,19,20,21]) then
    Result := fValidaDadosGFIPMag('V', Campo, 15, '0')
  else
    Result := '000000000000000';
end;

function TfrmParamGFIPMagnetico.Val_ClassContrib(Categoria:integer; Campo:string): string;
begin
  if (wMesComp <> 13) and (Categoria in [14,16]) then
    Result := fValidaDadosGFIPMag('N', Campo, 2, ' ')
  else
    Result := '  ';
end;

function TfrmParamGFIPMagnetico.Val_Ocorrencia(Categoria:integer; Campo:string): string;
begin
  if (Categoria in [1,3,4,6,7,12,19,20,21]) and (Campo <> '-1') then
    Result := fValidaDadosGFIPMag('V', Campo, 2, '0')
  else
    Result := '  ';
end;

function TfrmParamGFIPMagnetico.Val_30_21(Categoria:integer; Campo:string): string;
begin
  if (Categoria in [1,4,6,7,12,19,20,21]) and (wMesComp <> 13) and (sRegitroAltTrab <> '') then
    Result := fValidaDadosGFIPMag('V', Campo, 15, '0')
  else
    Result := '000000000000000';
end;

function TfrmParamGFIPMagnetico.Val_BaseCalc13(Categoria:integer; Campo,Motivo:string): string;
begin
  if (Categoria in [1,2,4..7,11,12,19,20,21]) and (Motivo <> 'H') then
    Result := fValidaDadosGFIPMag('V', Campo, 15, '0')
  else
    Result := '000000000000000';
end;

function TfrmParamGFIPMagnetico.Val_30_23(Categoria:integer; Campo:string): string;
begin
  if (wMesComp = 12) and (Categoria in [1,2,4,12]) then
    Result := fValidaDadosGFIPMag('V', Campo, 15, '0')
  else
    Result := '000000000000000';
end;

function TfrmParamGFIPMagnetico.Val_DtAdmissao(Categoria:integer; Campo:TDateTime): string;
begin
  Result := '        ';
  if (Categoria <> 2) and //(Categoria in [1,3,4,5,6,7,11,12,19,20,21]) and
     (Campo <= StrToDate(PoeZero(wDiaComp)+'/'+PoeZero(wMesComp)+'/'+IntToStr(wAnoComp))) then
    case (Categoria) of
      4 : if (Campo >= StrToDate('22/01/1998')) then
            Result := fValidaDadosGFIPMag('N', DateToStr(Campo), 8, ' ');
      7 : if (Campo >= StrToDate('20/12/2000')) then
            Result := fValidaDadosGFIPMag('N', DateToStr(Campo), 8, ' ');
      else Result := fValidaDadosGFIPMag('N', DateToStr(Campo), 8, ' ')
    end;
end;

procedure TfrmParamGFIPMagnetico.LeAlteracoes;
begin
  // Recupera as últimas alterações das opções
  //ArqConfig := TIniFile.Create('C:\CONFIG_FOLHAPAGTO.INI');
  ArqConfig := TIniFile.Create(Sistema.RetornaCaminhoArquivos(Sistema.IdEmpresa)+'\CONFIG_FOLHAPAGTO.INI'); //Ádler Teodoro de Souza SOL 109421 KINTANA 496332
  rgTipoInscricaoResp.ItemIndex := StrToInt(ArqConfig.ReadString('GFIP_MAGNETICO', 'TipoInscricaoResp', '0'));
  speCodRec.Value := StrToInt(ArqConfig.ReadString('GFIP_MAGNETICO', 'CodigoRec', '115'));
  mkedCodEmpreCAIXA.Text := ArqConfig.ReadString('GFIP_MAGNETICO', 'CodigoEmpresaCAIXA', '');
end;

procedure TfrmParamGFIPMagnetico.GravaAlteracoes;
var
  sGravaPadrao: string;
begin
  sGravaPadrao := IntToStr(rgTipoInscricaoResp.ItemIndex);
  ArqConfig.WriteString('GFIP_MAGNETICO', 'TipoInscricaoResp', sGravaPadrao);

  sGravaPadrao := speCodRec.Text;
  ArqConfig.WriteString('GFIP_MAGNETICO', 'CodigoRec', sGravaPadrao);

  sGravaPadrao := mkedCodEmpreCAIXA.Text;
  ArqConfig.WriteString('GFIP_MAGNETICO', 'CodigoEmpresaCAIXA', sGravaPadrao);
end;

end.
