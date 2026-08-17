// *****************************************************************************
// ***************************** REGISTRO DE ALTERAÇÕES ************************
// *****************************************************************************
// Autor(a)    :  Ádler Teodoro de Souza
// Data        :  19/02/2009
// Pendência   : SOL 109421 KINTANA 496332
// Descricao   :  Alteração de gravação de arquivos de log na raiz do disco C: .
//------------------------------------------------------------------------------
unit fParamCAGEDMagnetico;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs, IvDictio, IvMulti,
  IvEMulti, MAHlpBtn, StdCtrls, Buttons, TB97Tlbr, TB97, ExtCtrls, Spin, Db, wwdblook, Mask,
  DBTables, Wwdatsrc, FileCtrl, checklst, DBCtrls, Grids, DBGrids, ComCtrls, IniFiles,
  Wwquery, fSairAjuda;

type
  TfrmParamCAGEDMagnetico = class(TfrmSairAjuda)
    gbxEstab: TGroupBox;
    gbxAnoMesRef: TGroupBox;
    cmbMes: TComboBox;
    speAno: TSpinEdit;
    svdlgDialogo: TOpenDialog;
    chklstEstab: TCheckListBox;
    rbtnGerar: TBitBtn;
    ToolbarSep972: TToolbarSep97;
    gbxResp: TGroupBox;
    qryParamRH: TwwQuery;
    qryCAGED: TwwQuery;
    dblkcbResp: TwwDBLookupCombo;
    qryNomeResp: TwwQuery;
    qryResp: TwwQuery;
    gbxNumAutoriz: TGroupBox;
    mkedNumAutoriz: TMaskEdit;
    qryNomeEstab: TwwQuery;
    qryEstab: TwwQuery;
    gbxAlteracao: TGroupBox;
    rgTipoDeclarac: TRadioGroup;
    pgctrlAltCad: TPageControl;
    tbshResponsavel: TTabSheet;
    tbshEstab: TTabSheet;
    cmbAlteracaoResp: TComboBox;
    cmbAlteracaoEstab: TComboBox;
    rgMeioInf: TRadioGroup;
    rgMicroEmpr: TRadioGroup;
    speDia: TSpinEdit;
    qryRubrica: TwwQuery;
    gbxRubSal: TGroupBox;
    chklstRubrica: TCheckListBox;
    gbxTipoFunc: TGroupBox;
    cbxEfetivos: TCheckBox;
    cbxEspeciais: TCheckBox;
    cbxTemporarios: TCheckBox;
    cbxTerceiros: TCheckBox;
    cbxEstagiarios: TCheckBox;
    cbxProprietarios: TCheckBox;
    cbxAutonomos: TCheckBox;
    pnlHorario: TPanel;
    bbtnSelTodos: TBitBtn;
    bbtnInverteSel: TBitBtn;
    Label1: TLabel;
    edCodRubricas: TEdit;
    sbtnMarcarRub: TBitBtn;
    rgTipoInf: TRadioGroup;
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure FormCreate(Sender: TObject);
    procedure qryCAGEDBeforeOpen(DataSet: TDataSet);
    procedure qryCAGEDAfterOpen(DataSet: TDataSet);
    procedure qryCAGEDAfterScroll(DataSet: TDataSet);
    procedure rbtnGerarClick(Sender: TObject);
    procedure qryRespBeforeOpen(DataSet: TDataSet);
    procedure qryEstabBeforeOpen(DataSet: TDataSet);
    procedure chklstEstabDrawItem(Control: TWinControl; Index: Integer; Rect: TRect;
      State: TOwnerDrawState);
    procedure bbtnSelTodosClick(Sender: TObject);
    procedure bbtnInverteSelClick(Sender: TObject);
    procedure chklstEstabClickCheck(Sender: TObject);
    procedure chklstRubricaClickCheck(Sender: TObject);
    procedure speAnoChange(Sender: TObject);
    procedure rgTipoInfExit(Sender: TObject);
    procedure sbtnMarcarRubClick(Sender: TObject);
  private
    fCAGED: TextFile;
    ArqConfig: TIniFile;
    sDtComp,
    LiRubSal, LiEstab: string;
    ListaEstab, ListaRubrica: TStringList;
    iNumEstab,
    iInicio, iFim: integer;
    wNumMoviment, wNumRegistro,
    wHora, wMin, wSeg, wMSeg: word;

    procedure GerarRegistroA;
    procedure GerarRegistroB;
    procedure GerarRegistroC(DataAdm,DataDesl,TipoMov: string);
    procedure GerarRegistroX(DataAdm,DataDesl,DataComp,TipoMov: string);

    function  Val_CTPS(Ini, Tam: byte; Campo: string): string;    
    procedure Finaliza(Msg: string);
    procedure SelecionaResponsavel;
    function  VerificaOpcoesOk: boolean;
    procedure LeAlteracoes;
    procedure GravaAlteracoes;
    procedure HabilitaBtOk;
  end;

var
  frmParamCAGEDMagnetico: TfrmParamCAGEDMagnetico;

implementation

uses uSistema, uMensErro, fAguarde, uFuncoesUteis, fMensValor, UsoGeralRH;

{$R *.DFM}

procedure TfrmParamCAGEDMagnetico.FormCreate(Sender: TObject);
begin
  inherited;
  ListaEstab := TStringList.Create;
  ListaRubrica := TStringList.Create;

  // Estabelecimento(s) habilitados para o usuário
  if (sUsuXfilial <> '') then
  begin
    if (Pos(',',sUsuXfilial) > 0) then
    begin
      qryNomeEstab.SQL[5] := '  (PJ.IDPESSOA IN ' +sUsuXfilial+ ') AND';
      qryNomeResp.SQL[5]  := '  (PJ.IDPESSOA IN ' +sUsuXfilial+ ') AND';
    end
    else
    begin
      qryNomeEstab.SQL[5] := '  (PJ.IDPESSOA  = ' +sUsuXfilial+ ') AND';
      qryNomeResp.SQL[5]  := '  (PJ.IDPESSOA  = ' +sUsuXfilial+ ') AND';
    end;
  end;

  qryNomeEstab.ParamByName('EMPRESA').asInteger := Sistema.IdEmpresa;
  qryNomeEstab.Open;
  qryNomeResp.ParamByName('EMPRESA').asInteger := Sistema.IdEmpresa;
  qryNomeResp.Open;
  qryParamRH.Open;

  // Monta ChekListBox dos Estabelecimentos
  chklstEstab.Items.Clear;
  ListaEstab.Clear;
  while not(qryNomeEstab.EOF) do
  begin
    chklstEstab.Items.Add(qryNomeEstab.FieldByName('NOME').asString);
    ListaEstab.Add(qryNomeEstab.FieldByName('CODIGO').asString);
    qryNomeEstab.Next;
  end;

  // Monta ChekListBox das Rubricas
  chklstRubrica.Items.Clear;
  ListaRubrica.Clear;
  with (qryRubrica) do
  begin
    ParamByName('IDEMPRESA').asInteger := Sistema.IdEmpresa;
    Open;
    while not(qryRubrica.EOF) do
    begin
      ListaRubrica.Add(qryRubrica.FieldByName('CODPROVDESC').asString);
      chklstRubrica.Items.Add(qryRubrica.FieldByName('DESCRPROVDESC').asString);
      qryRubrica.Next;
    end;
  end;  

  rgTipoInfExit(Sender);

  // Inicializa variáveis
  mkedNumAutoriz.Text := '';
  dblkcbResp.Text := qryNomeResp.FieldByName('NOME').asString;
  cmbMes.ItemIndex := ExtraiMes(qryParamRH.FieldByName('NORMALINI').asDateTime) - 1;
  speAno.Text := Copy(qryParamRH.FieldByName('NORMALINI').asString,7,4);
  pnlHorario.Caption := '';
  speDia.Value := ExtraiDia(Date);
  pgctrlAltCad.ActivePageIndex := 0;
  cmbAlteracaoResp.ItemIndex := 0;
  cmbAlteracaoEstab.ItemIndex := 0;

  // Carrega alterações nas opções feitas anteriormente
  LeAlteracoes;
end;

procedure TfrmParamCAGEDMagnetico.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  GravaAlteracoes;

  ListaEstab.Free;
  ListaRubrica.Free;

  qryResp.Close;
  qryResp.UnPrepare;
  qryEstab.Close;
  qryEstab.UnPrepare;
  qryParamRH.Close;
  qryNomeResp.Close;
  qryNomeEstab.Close;
  qryRubrica.Close;
  inherited;
end;

procedure TfrmParamCAGEDMagnetico.chklstEstabDrawItem(Control: TWinControl; Index: Integer;
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

procedure TfrmParamCAGEDMagnetico.qryEstabBeforeOpen(DataSet: TDataSet);
begin
  frmAguarde.Pos := frmAguarde.Min;
  frmAguarde.pbAguarde.Visible := false;
  frmAguarde.Mostra('Verificando seleção do Estabelecimento...');
  frmAguarde.UpDate;
end;

procedure TfrmParamCAGEDMagnetico.qryRespBeforeOpen(DataSet: TDataSet);
begin
  frmAguarde.Mostra('Verificando seleção do Responsável...');
  frmAguarde.Update;
end;

procedure TfrmParamCAGEDMagnetico.qryCAGEDBeforeOpen(DataSet: TDataSet);
begin
  frmAguarde.Mostra('Processando dados do CAGED...');
  frmAguarde.Update;
  frmAguarde.Pos := 0;
end;

procedure TfrmParamCAGEDMagnetico.qryCAGEDAfterOpen(DataSet: TDataSet);
begin
  frmAguarde.Max := qryCAGED.RecordCount;
  frmAguarde.Min := 0;
end;

procedure TfrmParamCAGEDMagnetico.qryCAGEDAfterScroll(DataSet: TDataSet);
begin
  if (qryCAGED.BOF) then
    frmAguarde.pbAguarde.Visible := true
  else
  if (frmAguarde.Pos >= frmAguarde.Max) then
    frmAguarde.Pos := frmAguarde.Min
  else
  if (qryCAGED.EOF) then
    frmAguarde.Pos := frmAguarde.Max
  else
    frmAguarde.Pos := frmAguarde.Pos+1;
  frmAguarde.Update;
end;

procedure TfrmParamCAGEDMagnetico.speAnoChange(Sender: TObject);
begin
  HabilitaBtOk;
end;

procedure TfrmParamCAGEDMagnetico.rgTipoInfExit(Sender: TObject);
begin
  speDia.Visible := (rgTipoInf.ItemIndex = 1);
  if (speDia.Visible)  then
  begin
    cmbMes.Left := 54;
    cmbMes.Width := 94;
  end
  else
  begin
    cmbMes.Left := 8;
    cmbMes.Width := 140;
  end;
end;

procedure TfrmParamCAGEDMagnetico.chklstEstabClickCheck(Sender: TObject);
begin
  HabilitaBtOk;
  InvalidateItemListBox(TCustomListBox(Sender), TCustomListBox(Sender).ItemIndex);
end;

procedure TfrmParamCAGEDMagnetico.chklstRubricaClickCheck(Sender: TObject);
begin
  HabilitaBtOk;
  CriaListaOpcoes (chklstRubrica, ListaRubrica, LiRubSal, ',', false);
  edCodRubricas.Text := LiRubSal;
  InvalidateItemListBox(TCustomListBox(Sender), TCustomListBox(Sender).ItemIndex);
end;

procedure TfrmParamCAGEDMagnetico.bbtnSelTodosClick(Sender: TObject);
var
  c: integer;
begin
  for c:=0 to chklstEstab.Items.Count-1 do
    chklstEstab.Checked[c] := true;
  chklstEstab.Repaint;
  HabilitaBtOk;
end;

procedure TfrmParamCAGEDMagnetico.bbtnInverteSelClick(Sender: TObject);
var
  c: integer;
begin
  for c:=0 to chklstEstab.Items.Count-1 do
    chklstEstab.Checked[c] := not(chklstEstab.Checked[c]);
  chklstEstab.Repaint;
  HabilitaBtOk;
end;

procedure TfrmParamCAGEDMagnetico.sbtnMarcarRubClick(Sender: TObject);
begin
  edCodRubricas.Text := Trim(edCodRubricas.Text);
  VerificaOpcoes(chklstRubrica, ListaRubrica, edCodRubricas.Text, ',');
  LiRubSal := edCodRubricas.Text;
  HabilitaBtOk;
  chklstRubrica.Repaint;
end;

procedure TfrmParamCAGEDMagnetico.rbtnGerarClick(Sender: TObject);
var
  bArqAberto, bCancelarGeracao: boolean;
  sTipoMovAnt, sTipoMovAtu, sIdEstab, sMesRef, sSelTipoContr: string;
begin
  // Verifica se as opções selecionadas estão corretamente selecionadas
  if not(VerificaOpcoesOk) then
  begin
    frmAguarde.Apaga;
    exit;
  end;

  // Inicializa variáveis
  sMesRef := speAno.Text +'/'+ PoeZero(cmbMes.ItemIndex+1);
  sDtComp := PoeZero(cmbMes.ItemIndex+1) +'/'+ speAno.Text;
  bArqAberto := false;
  bCancelarGeracao := false;

  // Rubricas para Salário selecionadas
  CriaListaOpcoes(chklstRubrica, ListaRubrica, LiRubSal, ',', true);

  // Pego os empregados somente com Tipo de Contrato selecionado
  sSelTipoContr := '';
  if (cbxEfetivos.Checked) then
    sSelTipoContr := sSelTipoContr + QuotedStr('E');
  if (cbxEspeciais.Checked) then
    sSelTipoContr := sSelTipoContr +IFF(sSelTipoContr <> '',',','')+ QuotedStr('S');
  if (cbxTemporarios.Checked) then
    sSelTipoContr := sSelTipoContr +IFF(sSelTipoContr <> '',',','')+ QuotedStr('T');
  if (cbxTerceiros.Checked) then
    sSelTipoContr := sSelTipoContr +IFF(sSelTipoContr <> '',',','')+ QuotedStr('3');
  if (cbxProprietarios.Checked) then
    sSelTipoContr := sSelTipoContr +IFF(sSelTipoContr <> '',',','')+ QuotedStr('P');
  if (cbxAutonomos.Checked) then
    sSelTipoContr := sSelTipoContr +IFF(sSelTipoContr <> '',',','')+ QuotedStr('A');
  if (cbxEstagiarios.Checked) then
    sSelTipoContr := sSelTipoContr +IFF(sSelTipoContr <> '',',','')+ QuotedStr('G');
  sSelTipoContr := '  (F.TIPOCONTRATO IN ('+sSelTipoContr+')) AND';

  // ********************
  // Monta Query do CAGED
  // ********************
  with (qryCAGED.SQL) do
  begin
    Clear;
    Add('SELECT DISTINCT');
    Add('  FP.IDFILIALPESSOA AS IDESTAB,');
    Add('  RTRIM(PF.NOME) AS EMPREGADO,');
    Add('  CTPS.NUM AS CTPS,');
    Add('  CTPS.UF AS CTPS_UF,');
    Add('  PIS.NUM AS PIS,');
    Add('  CBO.IDCBO AS CBO,');
    // Se não possuir Grau de Instrução, indico o grau ZERO para que seja gerado um erro
    Add('  DECODE(SUBSTR(GR.CODRAIS,1,1),'''',0,SUBSTR(GR.CODRAIS,1,1)) AS GRAU_INSTR,');
    Add('  ST.TIPOSIT AS SITUACAO,');
    Add('  DECODE(PESFIS.SEXO,''M'',''1'',''2'') AS SEXO,');
    Add('  PESFIS.DATANASC,');
    Add('  F.DATAADMISSAO,');
    Add('  F.DATARETORNO,');
    Add('  DECODE(TO_CHAR(F.DATADESLIGAMENTO,''MM/YYYY''),'+QuotedStr(sDtComp)+',');
    Add('    F.DATADESLIGAMENTO,'''') AS DATADESLIGAMENTO,');
    Add('  NVL(PESFIS.CORPESSOA,9) AS CORPESSOA,');
    Add('  DECODE(PESFIS.FLGDEFICIENTE,NULL,''2'',0,''1'',''2'') AS DEFICIENTE,');
    Add('  (HT.JORNADAMENSAL / 5) AS HRS_TRAB,');
    Add('  HIST_SIT.IDMOVCONTRCAGED AS TIPO_MOVIMENTACAO_HIST,');
    Add('  F.IDMOVCONTRCAGED AS TIPO_MOVIMENTACAO,');
    Add('  TOT_EMPREGADOS.NUMERO AS POS_ANTERIOR,');
    if (LiRubSal = '') then
    begin
      Add('  DECODE(F.DATADESLIGAMENTO,NULL,');
      Add('    DECODE(F.TIPOPAGAMENTO,''M'',F.SALARIOATUAL,');
      Add('    HT.JORNADAMENSAL * F.SALARIOATUAL),VAL_REM_DEM.VALOR) AS REMUNERACAO');
    end
    else
      Add('  DECODE(F.DATADESLIGAMENTO,NULL,VAL_REM.VALOR,VAL_REM_DEM.VALOR) AS REMUNERACAO');
    // -------------------------------------------------------------------- //
    Add('FROM');
    Add('  PESSOA PF, PESSOAFISICA PESFIS, CBO, FUNCIONARIO F, CARGO C,');
    Add('  HORATRAB HT, SITFUNC ST, FILIALPESSOA FP, GRINSTR GR,');
    // -------------------------------------------------------------------- //
    // Posição de Funcionários anterior anterior ao mês informado
    Add('  (SELECT F.IDESTAB AS IDEMPRESA, COUNT(F.IDPESSOA) AS NUMERO');
    Add('   FROM');
    Add('     FUNCIONARIO F, SITFUNC ST');
    Add('   WHERE');

    if (Pos(',',LiEstab) > 0) then
      Add('     (F.IDESTAB IN (' +LiEstab+ ')) AND')
    else
      Add('     (F.IDESTAB  = ' +LiEstab+ ') AND');

    // Pego os funcionários somente com Tipo de Contrato selecionado
    Add('   '+sSelTipoContr);
    Add('     (TO_CHAR(F.DATAADMISSAO,''YYYY/MM/DD'') < '''+sMesRef+'/01'') AND');
    Add('     (ST.IDSITFUNC     = F.IDSITFUNC) AND');
    Add('     (');
    Add('       (ST.TIPOSIT    IN (''A'',''F'')) OR');
    Add('       (');
    Add('         (ST.TIPOSIT   = ''D'') AND');
    Add('         (TO_CHAR(F.DATADESLIGAMENTO,''YYYY/MM/DD'') >= '''+sMesRef+'/01'')');
    Add('       )');
    Add('     )');
    Add('   GROUP BY');
    Add('     F.IDESTAB) TOT_EMPREGADOS,');
    // -------------------------------------------------------------------- //
    // Remuneração do Funcionário Normal
    if (LiRubSal <> '') then
    begin
      Add('  (SELECT H.IDPESSOA, SUM(DECODE(P.FLGDESCONTO,0,H.VALORPROVENTO,-H.VALORPROVENTO)) AS VALOR');
      Add('   FROM   HISTRUBSAL H, PROVDESC P, FUNCIONARIO F, SITFUNC ST');
      Add('   WHERE  (ST.TIPOSIT     <> ''D'') AND');
      // Pego os funcionários somente com Tipo de Contrato selecionado
      Add('        '+sSelTipoContr);

      if (Pos(',',LiRubSal) > 0) then
        Add('          (H.CODPROVDESC IN (' +LiRubSal+ ')) AND')
      else
        Add('          (H.CODPROVDESC IN (' +LiRubSal+ ')) AND');

      Add('          (H.IDPESSJUR     = '+IntToStr(Sistema.IdEmpresa)+') AND');
      Add('          (H.MES           = '+QuotedStr(sMesRef)+') AND');
      Add('          (ST.IDSITFUNC    = F.IDSITFUNC) AND');
      Add('          (P.IDPROVENTO    = H.IDRUBRICA) AND');
      Add('          (F.IDPESSOA      = H.IDPESSOA)');
      Add('   GROUP BY');
      Add('     H.IDPESSOA) VAL_REM,');
    end;
    // -------------------------------------------------------------------- //
    // Remuneração do Funcionário para Demissão
    Add('  (SELECT H.IDPESSOA, SUM(H.VALORPROVENTO) AS VALOR');
    Add('   FROM   HISTRUBSAL H, FUNCIONARIO F, PROVDESC P, SITFUNC ST');
    Add('   WHERE  (P.CODRUBCLT     = ''63012'') AND');
    Add('          (H.IDPESSJUR     = '+IntToStr(Sistema.IdEmpresa)+') AND');
    Add('          (H.MES           = '+QuotedStr(sMesRef)+') AND');
    Add('          (F.DATADESLIGAMENTO IS NOT NULL) AND');
    Add('          (ST.TIPOSIT      = ''D'') AND');
    // Pego os funcionários somente com Tipo de Contrato selecionado
    Add('        '+sSelTipoContr);
    Add('          (ST.IDSITFUNC    = F.IDSITFUNC) AND');
    Add('          (H.IDRUBRICA     = P.IDPROVENTO) AND');
    Add('          (F.IDPESSOA      = H.IDPESSOA)');
    Add('   GROUP BY');
    Add('     H.IDPESSOA) VAL_REM_DEM,');
    // -------------------------------------------------------------------- //
    // Pega a última situação funcional do Funcionário
    Add('  (SELECT DISTINCT H.IDPESSOA, H.IDMOVCONTRCAGED');
    Add('   FROM   HSTSITFUNC H,');
    Add('     (SELECT IDPESSOA, MAX(DATASITFUNC) DATA_MAX');
    Add('      FROM   HSTSITFUNC');
    Add('      GROUP BY IDPESSOA) MAX_HIST');
    Add('   WHERE (H.IDPESSOA     = MAX_HIST.IDPESSOA) AND');
    Add('         (H.DATASITFUNC  = MAX_HIST.DATA_MAX)) HIST_SIT,');
    // -------------------------------------------------------------------- //
    // CTPS do Funcionário
    Add('  (SELECT F.IDPESSOA, TDP.MASCARA, DP.NUMDOCUMENTO AS NUM, ES.CODESTADO AS UF');
    Add('   FROM   DOCPESSOA DP, FUNCIONARIO F, TIPODOCOFICIAL TDO, TIPODOCPESSOA TDP,');
    Add('          ESTADO ES, PAIS PA');
    Add('   WHERE (TDO.SIGLADOCUMENTO = ''CTPS:'') AND');
    Add('         (TDO.IDDOCUMENTO    = DP.IDDOCUMENTO) AND');
    Add('         (TDP.IDDOCUMENTO    = DP.IDDOCUMENTO) AND');
    Add('         (F.IDPESSOA         = DP.IDPESSOA) AND');
    Add('         (DP.IDPAIS          = PA.IDPAIS) AND');
    Add('         (ES.IDPAIS          = PA.IDPAIS) AND');
    Add('         (DP.IDESTADO        = ES.IDESTADO)) CTPS,');
    // -------------------------------------------------------------------- //
    // PIS do Funcionário
    Add('  (SELECT F.IDPESSOA, DP.NUMDOCUMENTO AS NUM');
    Add('   FROM   DOCPESSOA DP, FUNCIONARIO F, TIPODOCOFICIAL TDO');
    Add('   WHERE (TDO.SIGLADOCUMENTO = ''PIS/PASEP:'') AND');
    Add('         (TDO.IDDOCUMENTO    = DP.IDDOCUMENTO) AND');
    Add('         (DP.IDPESSOA        = F.IDPESSOA)) PIS');
    // -------------------------------------------------------------------- //
    Add('WHERE');

    if (Pos(',',LiEstab) > 0) then
      Add('   (F.IDESTAB IN (' +LiEstab+ ')) AND')
    else
      Add('   (F.IDESTAB  = ' +LiEstab+ ') AND');

    // Pego os funcionários somente com Tipo de Contrato selecionado
    Add(sSelTipoContr);
    Add('  ((TO_CHAR(F.DATAADMISSAO,''MM/YYYY'')     = '+QuotedStr(sDtComp)+') OR');
    Add('   (TO_CHAR(F.DATADESLIGAMENTO,''MM/YYYY'') = '+QuotedStr(sDtComp)+')) AND');
    Add('  (F.IDESTAB         = FP.IDFILIALPESSOA) AND');
    Add('  (F.IDHORARIO       = HT.IDHORARIO) AND');
    Add('  (FP.IDFILIALPESSOA = TOT_EMPREGADOS.IDEMPRESA) AND');
    Add('  (F.IDPESSOA        = PF.IDPESSOA) AND');
    Add('  (F.IDPESSOA        = PESFIS.IDPESSOA) AND');
    Add('  (PESFIS.IDGRINSTR  = GR.IDGRINSTR) AND');
    Add('  (F.IDCARGO         = C.IDCARGO) AND');
    Add('  (C.CBO             = CBO.IDCBO) AND');
    Add('  (PF.IDPESSOA       = CTPS.IDPESSOA) AND');
    Add('  (PF.IDPESSOA       = PIS.IDPESSOA) AND');
    Add('  (ST.IDSITFUNC      = F.IDSITFUNC) AND');
    if (LiRubSal <> '') then
      Add('  (F.IDPESSOA        = VAL_REM.IDPESSOA(+)) AND');
    Add('  (F.IDPESSOA        = HIST_SIT.IDPESSOA(+)) AND');
    Add('  (F.IDPESSOA        = VAL_REM_DEM.IDPESSOA(+))');
    Add('ORDER BY');
    Add('  IDESTAB');
    //SaveToFile('c:\qry.txt');
    SaveToFile(Sistema.RetornaCaminhoArquivos(Sistema.IdEmpresa)+ '\qry.txt'); //Ádler Teodoro de Souza SOL 109421 KINTANA 496332

  end;
  qryCAGED.Open;

  // Processa dados para a geração do arquivo, se estes existirem
  if not(qryCAGED.IsEmpty) then
  begin
    try
      // Contabiliza quantos dos estabelecimentos selecionados têm informações a gerar
      sIdEstab := qryCAGED.FieldByName('IDESTAB').asString;
      iNumEstab := 1;
      wNumRegistro := 1;
      wNumMoviment := 0;
      repeat
        if (qryCAGED.FieldByName('IDESTAB').asString <> sIdEstab) then
        begin
          sIdEstab := qryCAGED.FieldByName('IDESTAB').asString;
          Inc(iNumEstab);
        end;

        if (Copy(TiraBarra(qryCAGED.FieldByName('DATAADMISSAO').asString),3,6) =
            TiraBarra(sDtComp)) then
          Inc(wNumMoviment);
        if (qryCAGED.FieldByName('DATADESLIGAMENTO').asString <> '' ) and
           (qryCAGED.FieldByName('DATARETORNO').asString       = '' ) and
           (qryCAGED.FieldByName('SITUACAO').asString          = 'D') then
          Inc(wNumMoviment);
        qryCAGED.Next;
      until (qryCAGED.EOF);
      qryCAGED.First;

      if (rgTipoInf.ItemIndex = 1) then
        iNumEstab := 0;

      // Associa e Cria/Recria o arquivo de CAGED
      AssignFile(fCAGED, svdlgDialogo.FileName);
      ReWrite(fCAGED);
      bArqAberto := true;

      // ***************************************************************************
      // Registro Tipo 'A' - Informações do estabelecimento responsável pelo arquivo
      // ***************************************************************************
      GerarRegistroA;

      // Loop para gerar o subarquivo de todos os estabelecimentos selecionados
      repeat
        // ***************************************************************
        // Registro Tipo 'B' - Informações do Estabelecimento que
        // admitiu ou desligou empregados
        // ***************************************************************
        GerarRegistroB;

        // Loop para todos os funcionários deste estabelecimento
        sIdEstab := qryCAGED.FieldByName('IDESTAB').asString;
        repeat
          // **************************************************************
          // Registro Tipo 'C' - Informações de movimentação do trabalhador
          // **************************************************************
          sTipoMovAtu := qryCAGED.FieldByName('TIPO_MOVIMENTACAO').asString;
          sTipoMovAnt := qryCAGED.FieldByName('TIPO_MOVIMENTACAO_HIST').asString;

          if (Copy(TiraBarra(qryCAGED.FieldByName('DATAADMISSAO').asString),3,6) =
              TiraBarra(sDtComp)) and
             (qryCAGED.FieldByName('DATADESLIGAMENTO').asString <> '') and
             (Trim(sTipoMovAnt) = '') then
          begin
            frmAguarde.Hide;
            sTipoMovAnt := MostrarMensValor('Aviso','  O Empregado '+
              UpperCase(qryCAGED.FieldByName('EMPREGADO').asString)+
              ' possui mais de uma movimentação no mês.'+CR_LF+CR_LF+
              '  Indique o código da movimentação CAGED anterior para prosseguir.',
              '','99;0;_');
              
            if (Trim(sTipoMovAnt) = '') then
            begin
              bCancelarGeracao := true;
              break;
            end
            else
              frmAguarde.Show;
          end;

          if (Copy(TiraBarra(qryCAGED.FieldByName('DATAADMISSAO').asString),3,6) =
              TiraBarra(sDtComp)) then
          begin
            Inc(wNumRegistro);
            if (rgTipoInf.ItemIndex = 0) then
              GerarRegistroC(TiraBarra(qryCAGED.FieldByName('DATAADMISSAO').asString), '  ',
                IFF(Trim(sTipoMovAnt) <> '', sTipoMovAnt, sTipoMovAtu))
            else
              GerarRegistroX(TiraBarra(qryCAGED.FieldByName('DATAADMISSAO').asString), '  ',
                PoeZero(cmbMes.ItemIndex+1)+IntToStr(speAno.Value),
                IFF(Trim(sTipoMovAnt) <> '', sTipoMovAnt, sTipoMovAtu));
          end;

          if (qryCAGED.FieldByName('DATADESLIGAMENTO').asString <> '' ) and
             (qryCAGED.FieldByName('DATARETORNO').asString       = '' ) and
             (qryCAGED.FieldByName('SITUACAO').asString          = 'D') then
          begin
            Inc(wNumRegistro);
            if (rgTipoInf.ItemIndex = 0) then
              GerarRegistroC(TiraBarra(qryCAGED.FieldByName('DATAADMISSAO').asString),
                PoeZero(ExtraiDia(qryCAGED.FieldByName('DATADESLIGAMENTO').asDateTime)),
                sTipoMovAtu)
            else
              GerarRegistroX(TiraBarra(qryCAGED.FieldByName('DATAADMISSAO').asString),
                PoeZero(ExtraiDia(qryCAGED.FieldByName('DATADESLIGAMENTO').asDateTime)),
                PoeZero(cmbMes.ItemIndex+1)+IntToStr(speAno.Value),
                IFF(Trim(sTipoMovAnt) <> '', sTipoMovAnt, sTipoMovAtu));
          end;

          // Próximo Registro
          qryCAGED.Next;
        until (qryCAGED.EOF) or (sIdEstab <> qryCAGED.FieldByName('IDESTAB').asString);

        if (bCancelarGeracao) then
          break;
      until (qryCAGED.EOF);

      if (bCancelarGeracao) then
        Finaliza('Geração do CAGED cancelada.')
      else
      if (rgTipoInf.ItemIndex = 0) then
        Finaliza('Arquivo CGED'+IntToStr(speAno.Value)+'.M'+PoeZero(cmbMes.ItemIndex+1)+
          ' gerado com sucesso.')
      else
        Finaliza('Arquivo A'+PoeZero(speDia.Value)+IntToStr(speAno.Value)+'.M'+
          PoeZero(cmbMes.ItemIndex+1)+' gerado com sucesso.')
    except
      on e: exception do
        Finaliza('Ocorreu um erro durante a geração do arquivo para o' +CR_LF+
          'Empregado: '+UpperCase(qryCAGED.FieldByName('EMPREGADO').asString) +CR_LF+CR_LF+
          'Descrição:'+CR_LF+
          E.Message);
    end;
  end
  else
    Finaliza('Não há dados a serem processados.');

  // Finalizo o método adequadamente
  frmAguarde.Apaga;
  qryCAGED.Close;
  if (bArqAberto) then
    CloseFile (fCAGED);

  pnlHorario.Caption := 'Tempo de Processamento: ' +TempoDecorrido(iFim - iInicio);    
end;

procedure TfrmParamCAGEDMagnetico.LeAlteracoes;
var
  LiResp: string;
begin
  // Recupera as últimas alterações das opções
  //ArqConfig := TIniFile.Create('C:\CONFIG_FOLHAPAGTO.INI');
  ArqConfig := TIniFile.Create(Sistema.RetornaCaminhoArquivos(Sistema.IdEmpresa)+'\CONFIG_FOLHAPAGTO.INI'); //Ádler Teodoro de Souza SOL 109421 KINTANA 496332
  LiRubSal := ArqConfig.ReadString ('CAGED_MAG', 'Rubricas'   , '');
  LiEstab  := ArqConfig.ReadString ('CAGED_MAG', 'Estabelec'  , '');
  LiResp   := ArqConfig.ReadString ('CAGED_MAG', 'Responsavel', '');
  mkedNumAutoriz.Text := ArqConfig.ReadString ('CAGED_MAG', 'NumAutoriz', '');

  cbxEfetivos.Checked      := (ArqConfig.ReadString ('CAGED_MAG', 'Efetivos'     , 'V') = 'V');
  cbxEspeciais.Checked     := (ArqConfig.ReadString ('CAGED_MAG', 'Especiais'    , 'V') = 'V');
  cbxTemporarios.Checked   := (ArqConfig.ReadString ('CAGED_MAG', 'Temporarios'  , 'F') = 'V');
  cbxTerceiros.Checked     := (ArqConfig.ReadString ('CAGED_MAG', 'Terceiros'    , 'F') = 'V');
  cbxEstagiarios.Checked   := (ArqConfig.ReadString ('CAGED_MAG', 'Estagiarios'  , 'F') = 'V');
  cbxProprietarios.Checked := (ArqConfig.ReadString ('CAGED_MAG', 'Proprietarios', 'F') = 'V');
  cbxAutonomos.Checked     := (ArqConfig.ReadString ('CAGED_MAG', 'Autonomos'    , 'F') = 'V');

  VerificaOpcoes(chklstRubrica, ListaRubrica, LiRubSal, ',');
  VerificaOpcoes(chklstEstab,   ListaEstab,   LiEstab,  ',');
  
  if (LiResp = '') then
  begin
    qryNomeResp.First;
    LiResp := qryNomeResp.FieldByName('CODIGO').asString;
  end;
  dblkcbResp.LookUpValue := LiResp;
  dblkcbResp.UpDate;

  edCodRubricas.Text := LiRubSal;

  HabilitaBtOk;
end;

procedure TfrmParamCAGEDMagnetico.GravaAlteracoes;
var
  sGravaPadrao: string;
begin
  // Grava as últimas alterações da Opção de Rubricas
  CriaListaOpcoes (chklstRubrica, ListaRubrica, sGravaPadrao, ',', false);
  ArqConfig.WriteString ('CAGED_MAG','Rubricas',sGravaPadrao);

  // Grava as últimas alterações dos Estabelecimento
  CriaListaOpcoes (chklstEstab, ListaEstab, sGravaPadrao, ',', false);
  ArqConfig.WriteString ('CAGED_MAG','Estabelec',sGravaPadrao);

  if (Trim(dblkcbResp.Text) <> '') then
    ArqConfig.WriteString ('CAGED_MAG','Responsavel',qryNomeResp.FieldByName('CODIGO').asString);

  ArqConfig.WriteString ('CAGED_MAG','NumAutoriz',mkedNumAutoriz.Text);

  ArqConfig.WriteString ('CAGED_MAG', 'Efetivos'     , IFF(cbxEfetivos.Checked,'V','F'));
  ArqConfig.WriteString ('CAGED_MAG', 'Especiais'    , IFF(cbxEspeciais.Checked,'V','F'));
  ArqConfig.WriteString ('CAGED_MAG', 'Temporarios'  , IFF(cbxTemporarios.Checked,'V','F'));
  ArqConfig.WriteString ('CAGED_MAG', 'Terceiros'    , IFF(cbxTerceiros.Checked,'V','F'));
  ArqConfig.WriteString ('CAGED_MAG', 'Estagiarios'  , IFF(cbxEstagiarios.Checked,'V','F'));
  ArqConfig.WriteString ('CAGED_MAG', 'Proprietarios', IFF(cbxProprietarios.Checked,'V','F'));
  ArqConfig.WriteString ('CAGED_MAG', 'Autonomos'    , IFF(cbxAutonomos.Checked,'V','F'));
end;

procedure TfrmParamCAGEDMagnetico.HabilitaBtOk;
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
    (Trim(dblkcbResp.Text) <> '') and (cbxEfetivos.Checked or cbxEspeciais.Checked or
    cbxTemporarios.Checked or cbxTerceiros.Checked or cbxEstagiarios.Checked or
    cbxProprietarios.Checked or cbxAutonomos.Checked);
end;

function TfrmParamCAGEDMagnetico.VerificaOpcoesOk: boolean;
var
  iFile: integer;
begin
  Result := false;

  if (rgTipoInf.ItemIndex = 0) then
    //svdlgDialogo.FileName := 'C:\CAGED\CGED'+IntToStr(speAno.Value)+'.M'+PoeZero(cmbMes.ItemIndex+1)
    svdlgDialogo.FileName :=  Sistema.RetornaCaminhoArquivos(Sistema.IdEmpresa)+ '\CAGED\CGED'+IntToStr(speAno.Value)+'.M'+PoeZero(cmbMes.ItemIndex+1) //Ádler Teodoro de Souza SOL 109421 KINTANA 496332
  else
    //svdlgDialogo.FileName := 'C:\CAGED\A'+PoeZero(speDia.Value)+IntToStr(speAno.Value)+'.M'+PoeZero(cmbMes.ItemIndex+1);
    svdlgDialogo.FileName := Sistema.RetornaCaminhoArquivos(Sistema.IdEmpresa)+ '\CAGED\A'+PoeZero(speDia.Value)+IntToStr(speAno.Value)+'.M'+PoeZero(cmbMes.ItemIndex+1); //Ádler Teodoro de Souza SOL 109421 KINTANA 496332

  // Abro o diálogo de seleção do arquivo
  //iFile := FileCreate('C:\CAGED\CAGED.TST');
  iFile := FileCreate(Sistema.RetornaCaminhoArquivos(Sistema.IdEmpresa)+ '\CAGED\CAGED.TST'); //Ádler Teodoro de Souza SOL 109421 KINTANA 496332
  if (iFile = -1) then
  begin
    //if (MsgDlg('Pasta C:\CAGED\ não foi encontrada! Deseja criá-la ?','Aviso', mtInformation,[mbYes,mbNo],0) = mrYes) then
      if (MsgDlg('Pasta'+Sistema.RetornaCaminhoArquivos(Sistema.IdEmpresa)+'\CAGED\ não foi encontrada! Deseja criá-la ?','Aviso', mtInformation,[mbYes,mbNo],0) = mrYes) then //Ádler Teodoro de Souza SOL 109421 KINTANA 496332
      //CreateDir ('C:\CAGED\')
      CreateDir (Sistema.RetornaCaminhoArquivos(Sistema.IdEmpresa)+ '\CAGED\') //Ádler Teodoro de Souza SOL 109421 KINTANA 496332
    else
    if not(svdlgDialogo.Execute) then
      exit;
  end;
  FileClose (iFile);
  //DeleteFile('C:\CAGED\CAGED.TST');
  DeleteFile(Sistema.RetornaCaminhoArquivos(Sistema.IdEmpresa)+'\CAGED\CAGED.TST'); //Ádler Teodoro de Souza SOL 109421 KINTANA 496332

  // Verifica se o arquivo existe na pasta escolhida
  if (FileExists(svdlgDialogo.FileName)) then
    if (MsgDlg ('O arquivo já existe na pasta especificada! Deseja SOBRESCREVÊ-LO ?','Aviso',mtConfirmation,[mbYes,mbNo],0) = mrNo) then
      exit;

  if (Trim(mkedNumAutoriz.Text) = '') then
    if (MsgDlg ('Número da Autorização não foi digitado! Deseja continuar ?','Erro', mtInformation,[mbYes,mbNo],0) = mrNo) then
    begin
      mkedNumAutoriz.SetFocus;
      exit;
    end;

  DecodeTime(Time, wHora, wMin, wSeg, wMSeg);
  iInicio := wMSeg + 1000 * wSeg + 60000 * wMin + 3600000 * wHora;

  // Verifica se o Responsável pela informação foi selecionado
  SelecionaResponsavel;
  if (qryResp.IsEmpty) then
  begin
    MsgDlg ('Dados do Responsável selecionado não estão completos! Verifique e tente novamente.','Erro', mtInformation,[mbOK,mbHelp],0);
    dblkcbResp.SetFocus;
    exit;
  end;

  Result := true;
end;

procedure TfrmParamCAGEDMagnetico.SelecionaResponsavel;
begin
  // Estabelecimentos selecionados
  CriaListaOpcoes(chklstEstab, ListaEstab, LiEstab, ',', false);

  qryEstab.Close;
  with (qryEstab.SQL) do
  begin
    Clear;
    Add('SELECT DISTINCT');
    Add('  PJ.IDPESSOA AS IDESTAB,');
    Add('  RTRIM(PJ.RAZAOSOCIAL) AS NOME,');
    Add('  DECODE(CGC.NUM,NULL,''2'',''1'') AS TIPO_INSCRICAO,');
    Add('  DECODE(CGC.NUM,NULL,CEI.NUM,CGC.NUM) AS INSCRICAO,');
    Add('  DECODE(E.LOGRADOURO,NULL,'''',RTRIM(E.LOGRADOURO) ||'', ''|| E.NUMERO ||''''||');
    Add('    DECODE(E.COMPLEMENTO,'' '','' - '' ||''''|| RTRIM(E.COMPLEMENTO))) AS ENDERECO,');
    Add('  FP.IDITEMCNAE          AS CNAE,');
    Add('  RTRIM(E.BAIRRO)        AS BAIRRO,');
    Add('  RTRIM(E.CEP)           AS CEP,');
    Add('  RTRIM(CI.NOME)         AS CIDADE,');
    Add('  (ES.CODESTADO)         AS UF,');
    Add('  RTRIM(TELEFONE.DDD)    AS DDD,');
    Add('  RTRIM(TELEFONE.NUMERO) AS TELEFONE');
    Add('FROM');
    Add('  PESSOA PJ, ENDPESS E, CIDADES CI, ESTADO ES, FILIALPESSOA FP,');
    // -------------------------------------------------------------------------- //
    // CGC da Empresa
    Add('  (SELECT FP.IDFILIALPESSOA AS IDPESSOA, DP.NUMDOCUMENTO AS NUM');
    Add('   FROM   DOCPESSOA DP, TIPODOCOFICIAL TDO, FILIALPESSOA FP');
    Add('   WHERE  ((TDO.SIGLADOCUMENTO = ''CNPJ:'')       OR');
    Add('           (TDO.SIGLADOCUMENTO = ''CGC:''))      AND');
    Add('          (TDO.IDDOCUMENTO     = DP.IDDOCUMENTO) AND');
    Add('          (FP.IDFILIALPESSOA   = DP.IDPESSOA)) CGC,');
    // -------------------------------------------------------------------------- //
    // CEI da Empresa
    Add('  (SELECT FP.IDFILIALPESSOA AS IDPESSOA, DP.NUMDOCUMENTO AS NUM');
    Add('   FROM   DOCPESSOA DP, TIPODOCOFICIAL TDO, FILIALPESSOA FP');
    Add('   WHERE  (TDO.SIGLADOCUMENTO = ''CEI:'')       AND');
    Add('          (TDO.IDDOCUMENTO    = DP.IDDOCUMENTO) AND');
    Add('          (FP.IDFILIALPESSOA  = DP.IDPESSOA)) CEI,');
    // -------------------------------------------------------------------------- //
    // Telefone da Empresa
    Add('  (SELECT TE.IDENDERECO, TE.IDTELEFONE, TE.DDD, TE.NUMERO');
    Add('   FROM');
    Add('     TELENDPESS TE,');
    Add('     (SELECT   MIN(IDTELEFONE) AS IDTELEFONE, IDENDERECO');
    Add('      FROM     TELENDPESS');
    Add('      GROUP BY IDENDERECO) END');
    Add('   WHERE');
    Add('     (END.IDTELEFONE = TE.IDTELEFONE)) TELEFONE');
    // -------------------------------------------------------------------------- //
    Add('WHERE');

    if (Pos(',',LiEstab) > 0) then
      Add('  (PJ.IDPESSOA       IN (' +LiEstab+ ')) AND')
    else
      Add('  (PJ.IDPESSOA        = ' +LiEstab+ ') AND');

    Add('  (PJ.NUMDOCUMENTO   IS NOT NULL)            AND');
    Add('  (PJ.IDPESSOA        = FP.IDFILIALPESSOA)   AND');
    Add('  (PJ.IDENDCOMERCIAL  = E.IDENDERECO)        AND');
    Add('  (PJ.IDPESSOA        = E.IDPESSOA)          AND');
    Add('  (PJ.IDENDCOMERCIAL  = TELEFONE.IDENDERECO) AND');
    Add('  (E.IDCIDADES        = CI.IDCIDADES)        AND');
    Add('  (CI.IDESTADO        = ES.IDESTADO)         AND');
    Add('  (PJ.IDPESSOA        = CEI.IDPESSOA(+))     AND');
    Add('  (PJ.IDPESSOA        = CGC.IDPESSOA(+))');
  end;
  qryEstab.Open;

  qryResp.Close;
  with (qryResp.SQL) do
  begin
    Clear;
    Add('SELECT DISTINCT');
    Add('  DECODE(CGC.NUM,NULL,''2'',''1'') AS TIPO_INSCRICAO,');
    Add('  DECODE(CGC.NUM,NULL,CEI.NUM,CGC.NUM) AS INSCRICAO,');
    Add('  RTRIM(PJ.RAZAOSOCIAL) AS NOME,');
    Add('  DECODE(E.LOGRADOURO,NULL,NULL,RTRIM(E.LOGRADOURO) ||'', ''|| E.NUMERO ||');
    Add('    DECODE(E.COMPLEMENTO,NULL,NULL,'' - '' || RTRIM(E.COMPLEMENTO))) AS ENDERECO,');
    Add('  RTRIM(E.CEP)           AS CEP,');
    Add('  ES.CODESTADO           AS UF,');
    Add('  RTRIM(TELEFONE.DDD)    AS DDD,');
    Add('  RTRIM(TELEFONE.NUMERO) AS TELEFONE,');
    Add('  RTRIM(TELEFONE.RAMAL)  AS RAMAL');
    Add('FROM');
    Add('  PESSOA PJ, ENDPESS E, CIDADES CI, ESTADO ES,');
    // -------------------------------------------------------------------------- //
    // CGC da Empresa
    Add('  (SELECT FP.IDFILIALPESSOA AS IDPESSOA, DP.NUMDOCUMENTO AS NUM');
    Add('   FROM   DOCPESSOA DP, TIPODOCOFICIAL TDO, FILIALPESSOA FP');
    Add('   WHERE  ((TDO.SIGLADOCUMENTO = ''CNPJ:'')       OR');
    Add('           (TDO.SIGLADOCUMENTO = ''CGC:''))      AND');
    Add('          (TDO.IDDOCUMENTO     = DP.IDDOCUMENTO) AND');
    Add('          (FP.IDFILIALPESSOA   = DP.IDPESSOA)) CGC,');
    // -------------------------------------------------------------------------- //
    // CEI da Empresa
    Add('  (SELECT FP.IDFILIALPESSOA AS IDPESSOA, DP.NUMDOCUMENTO AS NUM');
    Add('   FROM   DOCPESSOA DP, TIPODOCOFICIAL TDO, FILIALPESSOA FP');
    Add('   WHERE  (TDO.SIGLADOCUMENTO = ''CEI:'')       AND');
    Add('          (TDO.IDDOCUMENTO    = DP.IDDOCUMENTO) AND');
    Add('          (FP.IDFILIALPESSOA  = DP.IDPESSOA)) CEI,');
    // -------------------------------------------------------------------------- //
    // Telefone da Empresa
    Add('  (SELECT TE.IDENDERECO, TE.IDTELEFONE, TE.DDD, TE.NUMERO, TEC.RAMAL');
    Add('   FROM');
    Add('     TELENDPESS TE, CONTATOPESS CPE, TELCONTATO TEC,');
    Add('     (SELECT   MIN(IDTELEFONE) AS IDTELEFONE, IDENDERECO');
    Add('      FROM     TELENDPESS');
    Add('      GROUP BY IDENDERECO) END');
    Add('   WHERE');
    Add('     (END.IDTELEFONE = TE.IDTELEFONE) AND');
    Add('     (TE.IDTELEFONE  = TEC.IDTELEFONE(+)) AND');
    Add('     (TEC.IDCONTATO  = CPE.IDCONTATO(+))) TELEFONE');
    // -------------------------------------------------------------------------- //
    Add('WHERE');
    Add('  (PJ.IDPESSOA        = ' +qryNomeResp.FieldByName('CODIGO').asString+ ') AND');
    Add('  (PJ.IDENDCOMERCIAL  = E.IDENDERECO)        AND');
    Add('  (PJ.IDPESSOA        = E.IDPESSOA)          AND');
    Add('  (PJ.IDENDCOMERCIAL  = TELEFONE.IDENDERECO) AND');
    Add('  (E.IDCIDADES        = CI.IDCIDADES)        AND');
    Add('  (CI.IDESTADO        = ES.IDESTADO)         AND');
    Add('  (PJ.IDPESSOA        = CEI.IDPESSOA(+))     AND');
    Add('  (PJ.IDPESSOA        = CGC.IDPESSOA(+))     AND');
    Add('  (ROWNUM = 1)');
  end;
  qryResp.Open;
end;

procedure TfrmParamCAGEDMagnetico.GerarRegistroA;
begin
  Write(fCAGED,
    // 01-Tipo do registro
    'A'+
    // 02-Meio Informado (2->Disquete; 3->Fita; 4->Outros)
    IntToStr(rgMeioInf.ItemIndex+2)+
    // 03-Número de Autorização
    fValidaDados('N', mkedNumAutoriz.Text, 7)+
    // 04-Data da competência
    IFF(rgTipoInf.ItemIndex = 0,TiraBarra(sDtComp),'      ')+
    // 05-Alteração de dados cadastrais
    IntToStr(cmbAlteracaoResp.ItemIndex+1)+
    // 06-Sequência (Número seqüencial no arquivo)
    fValidaDados('N', IntToStr(wNumRegistro), 5)+
    // 07-Tipo de inscrição do responsável (1->CGC/CNPJ; 2->CEI)
    qryResp.FieldByName('TIPO_INSCRICAO').asString+
    // 08-Inscrição do responsável
    fValidaDados('N', qryResp.FieldByName('INSCRICAO').asString, 14)+
    // 09-Nome do responsável (Razão social)
    fValidaDados('A', qryResp.FieldByName('NOME').asString, 35)+
    // 10-Endereço
    fValidaDados('*', qryResp.FieldByName('ENDERECO').asString, 40)+
    // 11-CEP
    fValidaDados('*', qryResp.FieldByName('CEP').asString, 8)+
    // 12-UF
    fValidaDados('A', qryResp.FieldByName('UF').asString, 2)+
    // 13-DDD
    fValidaDados('N', qryResp.FieldByName('DDD').asString, 4)+
    // 14-Telefone
    fValidaDados('N', qryResp.FieldByName('TELEFONE').asString, 8)+
    // 15-Ramal
    fValidaDados('N', qryResp.FieldByName('RAMAL').asString, 5)+
    // 16-Total de Estabelecimentos informados (Quantidade de Registros B)
    fValidaDados('N', IntToStr(iNumEstab), 5)+
    // 17-Total de Movimentações informadas (Quantidade de Registros C)
    fValidaDados('N', IntToStr(wNumMoviment), 5)+
    // 18-Final de linha
    '  '+CR_LF);
end;

procedure TfrmParamCAGEDMagnetico.GerarRegistroB;
var
  cMicroEmpr: char;
begin
  // Posiciono no Estabelecimento correto
  qryEstab.Locate('IDESTAB', qryCAGED.FieldByName('IDESTAB').asString, [loCaseInsensitive]);

  if (rgTipoInf.ItemIndex = 0) then
  begin
    Inc(wNumRegistro);
    if(rgMicroEmpr.ItemIndex = 0) then
      cMicroEmpr := '1'
    else
      cMicroEmpr := '2';

    Write(fCAGED,
      // 01-Tipo do registro
      'B'+
      // 02-Tipo de inscrição (1->CGC/CNPJ; 2->CEI)
      qryEstab.FieldByName('TIPO_INSCRICAO').asString+
      // 03-Inscrição
      fValidaDados('N', qryEstab.FieldByName('INSCRICAO').asString, 14)+
      // 04-Sequência (Número seqüencial no arquivo)
      fValidaDados('N', IntToStr(wNumRegistro), 5)+
      // 05-1ª Declaração
      IntToStr(rgTipoDeclarac.ItemIndex+1)+
      // 06-Alteração de dados cadastrais
      IntToStr(cmbAlteracaoEstab.ItemIndex+1)+
      // 07-CEP
      fValidaDados('N', qryEstab.FieldByName('CEP').asString, 8)+
      // 08-Atividade Econômica
      fValidaDados('N', qryEstab.FieldByName('CNAE').asString, 5)+
      // 09-Nome do Estabelecimento (Razão social)
      fValidaDados('A', qryEstab.FieldByName('NOME').asString, 40)+
      // 10-Endereço
      fValidaDados('*', qryEstab.FieldByName('ENDERECO').asString, 40)+
      // 11-Bairro
      fValidaDados('A', qryEstab.FieldByName('BAIRRO').asString, 20)+
      // 12-UF
      fValidaDados('A', qryEstab.FieldByName('UF').asString, 2)+
      // 13-Total de Empregados existentes no 1º dia
      fValidaDados('N', qryCAGED.FieldByName('POS_ANTERIOR').asString, 5)+
      // 14-Se é Pequena ou Micro Empresa (S->Sim; N->Não)
      cMicroEmpr+
      // 14-Final de linha
      '      '+CR_LF);
  end;      
end;

procedure TfrmParamCAGEDMagnetico.GerarRegistroC(DataAdm, DataDesl, TipoMov: string);
begin
  Write(fCAGED,
    // 01-Tipo do registro
    'C'+
    // 02-Tipo de inscrição do Estabelecimento (1->CGC/CNPJ; 2->CEI)
    qryEstab.FieldByName('TIPO_INSCRICAO').asString+
    // 03-Inscrição do Estabelecimento
    fValidaDados('N', qryEstab.FieldByName('INSCRICAO').asString, 14)+
    // 04-Sequência (Número seqüencial no arquivo)
    fValidaDados('N', IntToStr(wNumRegistro), 5)+
    // 05-PIS/PASEP
    fValidaDados('N', qryCAGED.FieldByName('PIS').asString, 11)+
    // 06-Sexo
    qryCAGED.FieldByName('SEXO').asString+
    // 07-Data de nascimento
    fValidaDados('N', TiraBarra(qryCAGED.FieldByName('DATANASC').asString), 8)+
    // 08-Grau de Instrução
    qryCAGED.FieldByName('GRAU_INSTR').asString+
    // 09-CBO
    fValidaDados('N', qryCAGED.FieldByName('CBO').asString, 5)+
    // 10-Remuneração
    fValidaDados('N', FormatFloat('#########0.00',qryCAGED.FieldByName('REMUNERACAO').asFloat), 8)+
    // 11-Horas Trabalhadas
    fValidaDados('N', qryCAGED.FieldByName('HRS_TRAB').asString, 2)+
    // 12-Data de admissão
    DataAdm+
    // 13-Tipo de Movimentação
    fValidaDados('N', TipoMov, 2)+
    // 14-Dia de Desligamento
    IFF(DataDesl = '','  ',DataDesl)+
    // 15-Nome do Empregado
    fValidaDados('A', qryCAGED.FieldByName('EMPREGADO').asString, 40)+
    // 16-Número da CTPS
    Val_CTPS(1, 7, qryCAGED.FieldByName('CTPS').asString)+
    // 17-Série da CTPS
    Val_CTPS(8, 3, qryCAGED.FieldByName('CTPS').asString)+
    // 18-UF da CTPS
    fValidaDados('N', qryCAGED.FieldByName('CTPS_UF').asString, 2)+
    // 19-Brancos
    '       '+
    // 20-Raça/Cor (2->Branca; 4->Preta; 6->Amarela; 8->Parda; 0->Indígena)
    qryCAGED.FieldByName('CORPESSOA').asString+
    // 21-Deficiente físico (1->SIM; 2->NÃO)
    //   Preencher com, no módulo gerador (S->SIM; N->NÃO)
    qryCAGED.FieldByName('DEFICIENTE').asString+
    // 22-Final de linha
    Replicate(' ',22)+CR_LF);
end;

procedure TfrmParamCAGEDMagnetico.GerarRegistroX(DataAdm, DataDesl, DataComp, TipoMov: string);
begin
  Write(fCAGED,
    // 01-Tipo do registro
    'X'+
    // 02-Tipo de inscrição do Estabelecimento (1->CGC/CNPJ; 2->CEI)
    qryEstab.FieldByName('TIPO_INSCRICAO').asString+
    // 03-Inscrição do Estabelecimento
    fValidaDados('N', qryEstab.FieldByName('INSCRICAO').asString, 14)+
    // 04-Sequência (Número seqüencial no arquivo)
    fValidaDados('N', IntToStr(wNumRegistro), 5)+
    // 05-PIS/PASEP
    fValidaDados('N', qryCAGED.FieldByName('PIS').asString, 11)+
    // 06-Sexo
    qryCAGED.FieldByName('SEXO').asString+
    // 07-Data de nascimento
    fValidaDados('N', TiraBarra(qryCAGED.FieldByName('DATANASC').asString), 8)+
    // 08-Grau de Instrução
    qryCAGED.FieldByName('GRAU_INSTR').asString+
    // 09-CBO
    fValidaDados('N', qryCAGED.FieldByName('CBO').asString, 5)+
    // 10-Remuneração
    fValidaDados('N', FormatFloat('#########0.00',
      qryCAGED.FieldByName('REMUNERACAO').asFloat), 8)+
    // 11-Horas Trabalhadas
    fValidaDados('N', qryCAGED.FieldByName('HRS_TRAB').asString, 2)+
    // 12-Data de admissão
    DataAdm+
    // 13-Tipo de Movimentação
    fValidaDados('N', TipoMov, 2)+
    // 14-Dia de Desligamento
    IFF(DataDesl = '', '  ', DataDesl)+
    // 15-Nome do Empregado
    fValidaDados('A', qryCAGED.FieldByName('EMPREGADO').asString, 40)+
    // 16-Número da CTPS
    Val_CTPS(1, 7, qryCAGED.FieldByName('CTPS').asString)+
    // 17-Série da CTPS
    Val_CTPS(8, 3, qryCAGED.FieldByName('CTPS').asString)+
    // 18-UF da CTPS
    fValidaDados('N', qryCAGED.FieldByName('CTPS_UF').asString, 2)+
    // 19-Atualização, numérico, 1 posição
    // Informar o procedimento a ser seguido:
    // 1 - exclusão de registro
    // 2 - inclusão de registro
    // 3 - alteração de registro
    '2'+
    // 20-Competência
    DataComp+
    // 21-Raça/Cor (1->Indígena; 2->Branca; 4->Preta; 6->Amarela; 8->Parda; 9->Não informado)
    qryCAGED.FieldByName('CORPESSOA').asString+
    // 22-Deficiente físico (1->SIM; 2->NÃO) / Preencher com, no módulo gerador (S->SIM; N->NÃO)
    qryCAGED.FieldByName('DEFICIENTE').asString+
    // 23-Final de linha
    Replicate(' ',22)+CR_LF);
end;

procedure TfrmParamCAGEDMagnetico.Finaliza(Msg: string);
begin
  DecodeTime(Time, wHora, wMin, wSeg, wMSeg);
  iFim := wMSeg + 1000 * wSeg + 60000 * wMin + 3600000 * wHora;

  frmAguarde.Apaga;
  Beep;
  ShowMessage(Msg);
end;

function TfrmParamCAGEDMagnetico.Val_CTPS(Ini,Tam:byte; Campo:string): string;
var
  c: byte;
  sAux: string;
begin
  for c:=1 to length(Campo) do
    if (Campo[c] in ['0'..'9']) then
      sAux := sAux + Campo[c];
  Result := Replicate('0', Abs(Tam-Length(Copy(sAux,Ini,Tam)))) + Copy(sAux,Ini,Tam);
end;
end.
