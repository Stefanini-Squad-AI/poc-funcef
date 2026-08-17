unit fParamRAISMagnetico;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs, IvDictio,
  IvMulti, IvEMulti, MAHlpBtn, StdCtrls, Buttons, TB97Tlbr, TB97, ExtCtrls, Spin, Db,
  DBTables, checklst, ComCtrls, IniFiles, fcLabel, Gauges, Wwquery, wwdblook, TREdit,
  wwdbdatetimepicker, CMDateTimePicker, fSairAjuda;

type
  TfrmParamRAISMagnetico = class(TfrmSairAjuda)
    svdlgDialogo: TOpenDialog;
    rbtnGerar: TBitBtn;
    ToolbarSep972: TToolbarSep97;
    qryParamRH: TwwQuery;
    qryNomeResp: TwwQuery;
    qryResp: TwwQuery;
    qryNomeEstab: TwwQuery;
    qryEstab: TwwQuery;
    qryRubrica: TwwQuery;
    qryNumProp: TwwQuery;
    pnlHorario: TPanel;
    pnlProgresso: TPanel;
    fclblTitulo: TfcLabel;
    Bevel11: TBevel;
    lblProcesso: TLabel;
    lblHoraIni: TLabel;
    Bevel1: TBevel;
    gagTotal: TGauge;
    Label18: TLabel;
    lblTempoDecorr: TLabel;
    pgctrlPrincipal: TPageControl;
    tbshPrincipal: TTabSheet;
    tbshOutros: TTabSheet;
    gbxRubSal: TGroupBox;
    lblDescricao1: TLabel;
    edCodRubricas: TEdit;
    sbtnMarcarRub: TBitBtn;
    pgctrlRubricas: TPageControl;
    tbshFolhaNormal: TTabSheet;
    chklstRubrica1: TCheckListBox;
    tbsh1Parc13: TTabSheet;
    chklstRubrica2: TCheckListBox;
    tbsh2Parc13: TTabSheet;
    chklstRubrica3: TCheckListBox;
    bbtnSelTodasRub: TBitBtn;
    bbtnInverteSelRub: TBitBtn;
    gbxEstab: TGroupBox;
    chklstEstab: TCheckListBox;
    bbtnSelTodos: TBitBtn;
    bbtnInverteSel: TBitBtn;
    gbxAnoMesRef: TGroupBox;
    speAno: TSpinEdit;
    rgParticipaPAT: TRadioGroup;
    gbxResp: TGroupBox;
    dblkcbResp: TwwDBLookupCombo;
    rgTipoInf: TRadioGroup;
    gbxDataRetif: TGroupBox;
    dtedRetif: TCMDateTimePicker;
    gbxMesDataBase: TGroupBox;
    cmbMesDataBase: TComboBox;
    gbxNumProp: TGroupBox;
    spedNumProp: TSpinEdit;
    rgIndicador1: TRadioGroup;
    rgTipoDeclarac: TRadioGroup;
    gbxSalMinAtual: TGroupBox;
    gbxTipContra: TGroupBox;
    cbxEfetivos: TCheckBox;
    cbxEspeciais: TCheckBox;
    cbxTemporarios: TCheckBox;
    cbxEstagiarios: TCheckBox;
    cbxTerceiros: TCheckBox;
    cbxProprietarios: TCheckBox;
    cbxAutonomos: TCheckBox;
    tbshValeAlim: TTabSheet;
    chklstRubrica4: TCheckListBox;
    TabSheet1: TTabSheet;
    chklstRubrica5: TCheckListBox;
    gbxDataEncerr: TGroupBox;
    dtedDataEncerr: TCMDateTimePicker;
    qryAvisoPrevioIndeniz: TwwQuery;
    qryPAT: TwwQuery;
    qryRem13SegParc: TwwQuery;
    qryRem13PrimParc: TwwQuery;
    qryRemNormal: TwwQuery;
    qryRAIS: TwwQuery;
    gbxPorcent: TGroupBox;
    rgMicroEmpr: TRadioGroup;
    rgSimples: TRadioGroup;
    redSalMinAtual: TRealEdit;
    Label1: TLabel;
    redPorc1: TRealEdit;
    Label2: TLabel;
    redPorc2: TRealEdit;
    Label3: TLabel;
    redPorc3: TRealEdit;
    Label4: TLabel;
    redPorc4: TRealEdit;
    Label5: TLabel;
    redPorc5: TRealEdit;
    Label6: TLabel;
    redPorc6: TRealEdit;
    qryTipoFolha: TwwQuery;
    stxtTipoFolha: TStaticText;
    dblkcbTipoFolha: TwwDBLookupCombo;
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure FormCreate(Sender: TObject);
    procedure rbtnGerarClick(Sender: TObject);
    procedure rgTipoInfExit(Sender: TObject);
    procedure bbtnSelTodosClick(Sender: TObject);
    procedure bbtnInverteSelClick(Sender: TObject);
    procedure chklstEstabDrawItem(Control: TWinControl; Index: Integer; Rect: TRect;
      State: TOwnerDrawState);
    procedure chklstEstabClickCheck(Sender: TObject);
    procedure speAnoChange(Sender: TObject);
    procedure dtedRetifChange(Sender: TObject);
    procedure sbtnMarcarRubClick(Sender: TObject);
    procedure chklstRubrica1ClickCheck(Sender: TObject);
    procedure bbtnSelTodasRubClick(Sender: TObject);
    procedure bbtnInverteSelRubClick(Sender: TObject);
    procedure pgctrlRubricasChange(Sender: TObject);
    procedure rgTipoDeclaracExit(Sender: TObject);
    procedure dtedDataEncerrChange(Sender: TObject);
    procedure redSalMinAtualChange(Sender: TObject);
    procedure dblkcbTipoFolhaChange(Sender: TObject);
    procedure chklstRubrica1KeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure chklstRubrica1Click(Sender: TObject);
  private
    fRAIS: TextFile; // Arquivo TXT a ser gravado
    ArqConfig: TIniFile; // Arquivo de alterações

    // Lista de Códigos dos Itens Selecionados em...
    sCodEstabSel: string; // Estabelecimentos
    sCodRubSel: array[0..4] of string; // Rubricas

    chklstRubrica: array[0..4] of TCheckListBox; // CheckLists auxiliares

    // Lista dos Códigos de Todos os Itens de...
    lstCodEstab: TStringList; // Estabelecimentos
    lstCodRubrica: array[0..4] of TStringList; // Rubricas (Código da Rubrica +'='+
                                               //           Código do Tipo Folha)

    // Variáveis que guardam os itens atuais das listas de...
    chklstRubricaAtual: TCheckListBox; // Rubricas
    lstCodRubricaAtual: TStringList; // Código das Rubricas da Página Atual
    sCodRubSelAtual: string; // Código de Rubricas Selecionadas

    iMesRem13Adiant, // Mês em que foi paga a 1º parcela do 13º salário
    iMesRem13Final, // Mês em que foi paga a 2º parcela do 13º salário
    iHoraIni, iHoraFin, iHoraAtual, // Usadas para determinar o tempo decorrido no processo
    iNumEmprPATMenos5Sal, // Informa quantos empregados que ganham MENOS que um salário
                          // mínimo participam do PAT
    iNumEmprPATMais5Sal,  // Informa quantos empregados que ganham MAIS que um salário
                          // mínimo participam do PAT
    iNumFuncAddProgress,  // Informa uma média de empregados que foram processados para que
                          // a barra de progresso seja incrementada
    iNumFuncAtual,        // Número de empregados já processados (trabalha em conjunto com
                          // a variável iNumFuncAddProgress para incrementar a barra de
                          // progresso)
    iNumEstab,            // Número total de Estabelecimentos processados
    iNumFunc: integer;    // Número total de Empregados processados
    wNumRegistroAtual,    // Número do registro atual
    wHora, wMin, wSeg, wMSeg: word; // Usadas no desmembramento da hora atual para serem
                                    // utilizadas na contagem do tempo decorrido

    // Variáveis totalizadoras das  remunerações dos empregados em cada mês
    rRemJan, rRemFev, rRemMar, rRemAbr, rRemMai, rRemJun, rRemJul,
    rRemAgo, rRemSet, rRemOut, rRemNov, rRemDez, rRem13Adiant, rRem13Final: real;

    // Geração dos registros do arquivo
    procedure GerarRegistro0;
    procedure GerarRegistro1;
    procedure GerarRegistro2;
    procedure GerarRegistro9;
    // Executa a Query referente ao seguinte(pro terem SQL iguais):
    // * Remuneração do Empregado Normal
    // * Remuneração do Empregado Normal para 1º parcela do 13º
    // * Remuneração do Empregado Normal para 2º parcela do 13º
    procedure ExecSel(Msg:string; qry:TwwQuery; Num,Progresso:integer);
    // Executa a Query referente ao PAT
    procedure ExecSelPAT;
    // Executa a Query referente ao Aviso Prévio Indenizado
    procedure ExecSelAvisoPrevioIndeniz;
    // Valida o CTPS encontrado e o ajusta(corta) para o tamanho especificado
    function  Val_CTPS(Tam:byte; Campo:string): string;
    // Retorna uma os códigos dos Tipos de Contrato marcados
    function  SelTipoContrato: string;
    // Seleciona dados do estabelecimento
    procedure SelEstab;
    // Seleciona dados do responsável
    procedure SelResp;
    // Executa algumas verificações iniciais incluindo se dados do Responsável e
    // Estabelecimento estão corretos
    function  VerificaOpcoesOk: boolean;
    // Lê alterações a partir do arquivo de configurações
    procedure LeAlteracoes;
    // Grava alterações feitas na tela no arquivo de configurações
    procedure GravaAlteracoes;
    // Habilita o botão de Ok de acordo com as seleções mínimas necessárias
    procedure HabilitaBtOk;
    // Habilita o Combo de Tipos de Folha e Seleciona (caso já tenha sido feito anteriormente)
    // o registro correspondente
    procedure SelTipoFolha;
    // Atualiza uma lista de códigos das rubricas para incluir o correspondente Tipo de Folha
    // recuperado a partir do arquivo de configuração
    procedure SelTipoFolhaRub(Lista: TStringList; Valor: string);
    // Retorna uma lista de códigos das rubricas a partir de uma que é composta de
    // Código da Rubrica=Tipo de Folha. Usada na formatação das listas de Rubricas
    // selecionadas que foram recuperadas a partir do arquivo de configuração
    function  NormalizaLiRubrica(Valor: string): string;
  end;

var
  frmParamRAISMagnetico: TfrmParamRAISMagnetico;

implementation

uses uSistema, uMensErro, uFuncoesUteisRH, UsoGeralRH, dBaseDados;

{$R *.DFM}

procedure TfrmParamRAISMagnetico.FormCreate(Sender: TObject);
var
  c: byte;
begin
  inherited;
  lstCodEstab := TStringList.Create;
  for c:=0 to 4 do
    lstCodRubrica[c] := TStringList.Create;

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
  qryTipoFolha.Open;

  // Obtenho o nº de proprietários
  qryNumProp.Open;
  spedNumProp.Value := qryNumProp.FieldByName('NUMPROP').asInteger;
  qryNumProp.Close;

  // Monta ChekListBox dos Estabelecimentos
  chklstEstab.Items.Clear;
  lstCodEstab.Clear;
  while not(qryNomeEstab.EOF) do
  begin
    chklstEstab.Items.Add(qryNomeEstab.FieldByName('NOME').asString);
    lstCodEstab.Add(qryNomeEstab.FieldByName('CODIGO').asString);
    qryNomeEstab.Next;
  end;

  // Monta ChekListBox das Rubricas
  chklstRubrica[0] := chklstRubrica1;
  chklstRubrica[1] := chklstRubrica2;
  chklstRubrica[2] := chklstRubrica3;
  chklstRubrica[3] := chklstRubrica4;
  chklstRubrica[4] := chklstRubrica5;

  with (qryRubrica) do
  begin
    ParamByName('IDEMPRESA').asInteger := Sistema.IdEmpresa;
    Open;
    while not(qryRubrica.EOF) do
    begin
      for c:=0 to 4 do
      begin
        chklstRubrica[c].Items.Add(qryRubrica.FieldByName('DESCRPROVDESC').asString);
        lstCodRubrica[c].Add(qryRubrica.FieldByName('CODPROVDESC').asString +'=');
      end;
      qryRubrica.Next;
    end;
  end;

  // Inicializa variáveis
  dtedRetif.Text := qryParamRH.FieldByName('NORMALINI').asString;
  dblkcbResp.Text := qryNomeResp.FieldByName('NOME').asString;
  speAno.Text := Copy(qryParamRH.FieldByName('NORMALINI').asString,7,4);
  pnlHorario.Caption := '';
  pgctrlRubricas.ActivePageIndex := 0;
  pgctrlPrincipal.ActivePageIndex := 0;

  chklstRubricaAtual := chklstRubrica[0];
  lstCodRubricaAtual := lstCodRubrica[0];
  sCodRubSelAtual := sCodRubSel[0];

  // Carrega alterações nas opções feitas anteriormente
  LeAlteracoes;

  for c:=0 to 4 do
    if (chklstRubrica1.Items.Count > 0) then
      chklstRubrica[c].ItemIndex := 0;

  rgTipoInfExit(Sender);
  rgTipoDeclaracExit(Sender);
  chklstRubrica1Click(Sender);

  dtedRetif.OnChange := dtedRetifChange;
  dblkcbResp.OnChange := speAnoChange;
  speAno.OnChange := speAnoChange;
  dtedDataEncerr.OnChange := dtedDataEncerrChange;
  stxtTipoFolha.Visible := (chklstRubrica1.Checked[0]);
  dblkcbTipoFolha.Visible := (chklstRubrica1.Checked[0]);
end;

procedure TfrmParamRAISMagnetico.FormClose(Sender: TObject; var Action: TCloseAction);
var
  c: byte;
begin
  GravaAlteracoes;

  for c:=0 to 4 do
    lstCodRubrica[c].Free;
  lstCodEstab.Free;

  qryPAT.Close;  
  qryTipoFolha.Close;
  qryParamRH.Close;
  qryNomeResp.Close;
  qryResp.Close;
  qryNomeEstab.Close;
  qryEstab.Close;
  qryRubrica.Close;

  qryResp.UnPrepare;  
  inherited;
end;

procedure TfrmParamRAISMagnetico.chklstEstabDrawItem(Control: TWinControl; Index: Integer;
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

procedure TfrmParamRAISMagnetico.speAnoChange(Sender: TObject);
begin
  HabilitaBtOk;
end;

procedure TfrmParamRAISMagnetico.dtedRetifChange(Sender: TObject);
begin
  HabilitaBtOk;
  rbtnGerar.Enabled := (rbtnGerar.Enabled) and (Trim(dtedRetif.Text) <> '');
end;

procedure TfrmParamRAISMagnetico.dtedDataEncerrChange(Sender: TObject);
begin
  HabilitaBtOk;
  rbtnGerar.Enabled := (rbtnGerar.Enabled) and (Trim(dtedDataEncerr.Text) <> '');
end;

procedure TfrmParamRAISMagnetico.redSalMinAtualChange(Sender: TObject);
begin
  HabilitaBtOk;
  rbtnGerar.Enabled := (rbtnGerar.Enabled) and (Trim(redSalMinAtual.Text) <> '');
end;

procedure TfrmParamRAISMagnetico.pgctrlRubricasChange(Sender: TObject);
begin
  chklstRubricaAtual := chklstRubrica[pgctrlRubricas.ActivePageIndex];
  lstCodRubricaAtual := lstCodRubrica[pgctrlRubricas.ActivePageIndex];
  sCodRubSelAtual := sCodRubSel[pgctrlRubricas.ActivePageIndex];

  CriaListaOpcoes(chklstRubricaAtual, lstCodRubricaAtual, sCodRubSelAtual, ',', false, true);
  edCodRubricas.Text := sCodRubSelAtual;
  SelTipoFolha;
end;

procedure TfrmParamRAISMagnetico.dblkcbTipoFolhaChange(Sender: TObject);
begin
  if (Trim(dblkcbTipoFolha.Text) <> '') then
    lstCodRubricaAtual[chklstRubricaAtual.ItemIndex] :=
      Copy(lstCodRubricaAtual[chklstRubricaAtual.ItemIndex],0,
        Pos('=',lstCodRubricaAtual[chklstRubricaAtual.ItemIndex]))+
      dblkcbTipoFolha.LookupValue
  else
    lstCodRubricaAtual[chklstRubricaAtual.ItemIndex] :=
      Copy(lstCodRubricaAtual[chklstRubricaAtual.ItemIndex],0,
        Pos('=',lstCodRubricaAtual[chklstRubricaAtual.ItemIndex]));
end;

procedure TfrmParamRAISMagnetico.chklstRubrica1KeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  if (Key in [VK_UP,VK_DOWN]) then
    SelTipoFolha;
end;

procedure TfrmParamRAISMagnetico.chklstEstabClickCheck(Sender: TObject);
begin
  HabilitaBtOk;
  InvalidateItemListBox(chklstRubricaAtual, chklstRubricaAtual.ItemIndex);
end;

procedure TfrmParamRAISMagnetico.chklstRubrica1ClickCheck(Sender: TObject);
begin
  HabilitaBtOk;
  CriaListaOpcoes(chklstRubricaAtual, lstCodRubricaAtual, sCodRubSelAtual, ',', false, true);
  edCodRubricas.Text := sCodRubSelAtual;
  InvalidateItemListBox(chklstRubricaAtual, chklstRubricaAtual.ItemIndex);
  SelTipoFolha;
end;

procedure TfrmParamRAISMagnetico.rgTipoInfExit(Sender: TObject);
begin
  dtedRetif.Enabled := (rgTipoInf.ItemIndex = 1);
  if (dtedRetif.Enabled) then
    dtedRetifChange(Sender);
end;

procedure TfrmParamRAISMagnetico.rgTipoDeclaracExit(Sender: TObject);
begin
  dtedDataEncerr.Enabled := (rgTipoDeclarac.ItemIndex = 1);
  if (dtedDataEncerr.Enabled) then
    dtedDataEncerrChange(Sender);
end;

procedure TfrmParamRAISMagnetico.bbtnSelTodosClick(Sender: TObject);
var
  c: integer;
begin
  for c:=0 to chklstEstab.Items.Count-1 do
    chklstEstab.Checked[c] := true;
  HabilitaBtOk;
  chklstEstab.Repaint;
end;

procedure TfrmParamRAISMagnetico.bbtnInverteSelClick(Sender: TObject);
var
  c: integer;
begin
  for c:=0 to chklstEstab.Items.Count-1 do
    chklstEstab.Checked[c] := not(chklstEstab.Checked[c]);
  HabilitaBtOk;
  chklstEstab.Repaint;
end;

procedure TfrmParamRAISMagnetico.bbtnSelTodasRubClick(Sender: TObject);
var
  c: integer;
begin
  for c:=0 to chklstRubricaAtual.Items.Count-1 do
    chklstRubricaAtual.Checked[c] := true;

  CriaListaOpcoes(chklstRubricaAtual, lstCodRubricaAtual, sCodRubSelAtual, ',', false, true);
  edCodRubricas.Text := sCodRubSelAtual;
  HabilitaBtOk;
  chklstRubricaAtual.Repaint;
end;

procedure TfrmParamRAISMagnetico.bbtnInverteSelRubClick(Sender: TObject);
var
  c: integer;
begin
  for c:=0 to chklstRubricaAtual.Items.Count-1 do
    chklstRubricaAtual.Checked[c] := not(chklstRubricaAtual.Checked[c]);

  CriaListaOpcoes(chklstRubricaAtual, lstCodRubricaAtual, sCodRubSelAtual, ',', false, true);
  edCodRubricas.Text := sCodRubSelAtual;
  HabilitaBtOk;
  chklstRubricaAtual.Repaint;
end;

procedure TfrmParamRAISMagnetico.sbtnMarcarRubClick(Sender: TObject);
begin
  edCodRubricas.Text := Trim(edCodRubricas.Text);
  VerificaOpcoes(chklstRubricaAtual, lstCodRubricaAtual, edCodRubricas.Text, ',');
  sCodRubSelAtual := edCodRubricas.Text;
  HabilitaBtOk;
  chklstRubricaAtual.Repaint;
end;

procedure TfrmParamRAISMagnetico.chklstRubrica1Click(Sender: TObject);
begin
  SelTipoFolha;
end;

procedure TfrmParamRAISMagnetico.rbtnGerarClick(Sender: TObject);
var
  c: byte;
  bArqAberto, bExibeCancel: boolean;
  sIdFunc, sIdEstab, sAux: string;
begin
  // Verifica se as opções selecionadas estão corretamente selecionadas
  if not(VerificaOpcoesOk) then
  begin
    pnlHorario.Caption := '';
    exit;
  end;

  // Inicializa variáveis
  bArqAberto := false;
  bExibeCancel := false;

  // Rubricas selecionadas
  for c:=0 to 4 do
    CriaListaOpcoes(chklstRubrica[c], lstCodRubrica[c], sCodRubSel[c], ',', true, true);

  // Inicio a Barra de Progresso
  lblProcesso.Caption := 'Preparando Dados dos Empregados...';
  pnlProgresso.Update;

  // *****************************
  // Monta Query Principal da RAIS
  // *****************************
  with (qryRAIS.SQL) do
  begin
    Clear;
    Add('SELECT DISTINCT');
    Add('  F.IDESTAB AS IDESTABELECIMENTO,');
    Add('  F.IDPESSOA,');
    Add('  RTRIM(PF.NOME) AS FUNCIONARIO,');
    Add('  DECODE(ESTR.ANOCHEGADA,NULL,'''',TO_CHAR(ESTR.ANOCHEGADA,''YYYY'')) ANOCHEGADA,');
    Add('  PF.NUMDOCUMENTO AS CPF,');
    Add('  CTPS.NUM AS CTPS,');
    Add('  PIS.NUM AS PIS,');
    Add('  CBO.IDCBO AS CBO,');
    Add('  SUBSTR(GI.CODRAIS,1,1) AS GRAU_INSTR,');
    Add('  PAIS.CODRECEITAFEDERAL AS NACIONALIDADE,');
    Add('  F.IDVINCEMPREG AS VINC_EMPREG,');
    Add('  DECODE(HST_SITUACAO.MOTIVORAIS,NULL,2,HST_SITUACAO.MOTIVORAIS) AS TIPO_ADMISSAO,');
    Add('  CAUSA_DESLIG.MOTIVORAIS AS MOTIVODESLIGRAIS,');
    Add('  F.MATRICULA,');
    Add('  PESFIS.DATANASC,');
    Add('  PESFIS.SEXO,');
    Add('  F.TIPOCONTRATO,');
    Add('  NVL(PESFIS.FLGDEFICIENTE,2) AS FLGDEFICIENTE,');
    Add('  F.DATAADMISSAO,');
    Add('  DECODE(F.TIPOPAGAMENTO,''H'',''5'',''D'',''4'',''M'',''1'',''T'',''6'') TIPO_SAL_CONTR,');

    Add('  DECODE(ST.TIPOSIT,''D'',DECODE(TO_CHAR(F.DATADESLIGAMENTO,''YYYY''),'+
      QuotedStr(speAno.Text)+',TO_CHAR(F.DATADESLIGAMENTO,''DD/MM''),''''),'''') AS DATADESLIGAMENTO,');

    // (1->Indígena; 2->Branca; 4->Negra; 6->Amarela; 8->Parda; 9->Não informado)
    Add('  DECODE(PESFIS.CORPESSOA,NULL,9,0,1,PESFIS.CORPESSOA) COR,');
    Add('  (HT.JORNADAMENSAL / 5) AS HRS_TRAB,');
    Add('  F.SALARIOATUAL AS SALARIO_CONTR');
    // -------------------------------------------------------------------- //
    Add('FROM');
    Add('  PESSOA PF, PESSOAFISICA PESFIS, CBO, FUNCIONARIO F, CARGO C,');
    Add('  HORATRAB HT, PAIS, ESTRANGEIRO ESTR, SITFUNC ST, GRINSTR GI,');
    // -------------------------------------------------------------------- //
    // CTPS do Funcionário
    Add('  (SELECT F.IDPESSOA, DP.NUMDOCUMENTO AS NUM');
    Add('   FROM   DOCPESSOA DP, FUNCIONARIO F, TIPODOCOFICIAL TDO');
    Add('   WHERE (TDO.SIGLADOCUMENTO = ''CTPS:'') AND');

    if (Pos(',',sCodEstabSel) > 0) then
      Add('         (F.IDESTAB         IN (' +sCodEstabSel+ ')) AND')
    else
      Add('         (F.IDESTAB          = ' +sCodEstabSel+ ') AND');

    sAux := SelTipoContrato;
    if (Pos(',',sAux) > 0) then
      Add('         (F.TIPOCONTRATO    IN (' +sAux+ ')) AND')
    else
      Add('         (F.TIPOCONTRATO     = ' +sAux+ ') AND');

    Add('         (TDO.IDDOCUMENTO    = DP.IDDOCUMENTO) AND');
    Add('         (F.IDPESSOA         = DP.IDPESSOA)) CTPS,');
    // -------------------------------------------------------------------- //
    // PIS do Funcionário
    Add('  (SELECT F.IDPESSOA, DP.NUMDOCUMENTO AS NUM');
    Add('   FROM   DOCPESSOA DP, FUNCIONARIO F, TIPODOCOFICIAL TDO');
    Add('   WHERE (TDO.SIGLADOCUMENTO = ''PIS/PASEP:'') AND');

    if (Pos(',',sCodEstabSel) > 0) then
      Add('         (F.IDESTAB         IN (' +sCodEstabSel+ ')) AND')
    else
      Add('         (F.IDESTAB          = ' +sCodEstabSel+ ') AND');

    if (Pos(',',sAux) > 0) then
      Add('         (F.TIPOCONTRATO    IN (' +sAux+ ')) AND')
    else
      Add('         (F.TIPOCONTRATO     = ' +sAux+ ') AND');

    Add('         (TDO.IDDOCUMENTO    = DP.IDDOCUMENTO) AND');
    Add('         (F.IDPESSOA         = DP.IDPESSOA)) PIS,');
    // -------------------------------------------------------------------- //
    // Tipo de Admissão
    Add('  (SELECT F.IDPESSOA, MO.MOTIVORAIS');
    Add('   FROM   FUNCIONARIO F, HSTSITFUNC HST, MOTIVO MO');
    Add('   WHERE');

    if (Pos(',',sCodEstabSel) > 0) then
      Add('         (F.IDESTAB       IN (' +sCodEstabSel+ ')) AND')
    else
      Add('         (F.IDESTAB        = ' +sCodEstabSel+ ') AND');

    if (Pos(',',sAux) > 0) then
      Add('         (F.TIPOCONTRATO  IN (' +sAux+ ')) AND')
    else
      Add('         (F.TIPOCONTRATO   = ' +sAux+ ') AND');

    Add('         (MO.MOTIVORAIS   IS NOT NULL)        AND');
    Add('         (F.IDPESSOA       = HST.IDPESSOA)    AND');
//    Add('         (F.IDSITFUNC      = HST.IDSITFUNC)   AND');
    Add('         (F.DATAADMISSAO   = HST.DATASITFUNC) AND');
    Add('         (HST.IDMOTIVOOFIC = MO.IDMOTIVO)) HST_SITUACAO,');
    // -------------------------------------------------------------------- //
    // Causa do Desligamento do Funcionário
    Add('  (SELECT F.IDPESSOA, MO.MOTIVORAIS');
    Add('   FROM   FUNCIONARIO F, SITFUNC ST, MOTIVO MO');
    Add('   WHERE (ST.TIPOSIT           = ''D'') AND');
    Add('         (TO_CHAR(F.DATADESLIGAMENTO,''YYYY'') = '+QuotedStr(speAno.Text)+') AND');

    if (Pos(',',sCodEstabSel) > 0) then
      Add('         (F.IDESTAB           IN (' +sCodEstabSel+ ')) AND')
    else
      Add('         (F.IDESTAB            = ' +sCodEstabSel+ ') AND');

    if (Pos(',',sAux) > 0) then
      Add('         (F.TIPOCONTRATO  IN (' +sAux+ ')) AND')
    else
      Add('         (F.TIPOCONTRATO   = ' +sAux+ ') AND');

    Add('         (ST.IDSITFUNC         = F.IDSITFUNC) AND');
    Add('         (F.IDMOTIVODESLIGRAIS = MO.IDMOTIVO)) CAUSA_DESLIG');
    // -------------------------------------------------------------------- //
    Add('WHERE');
    Add('  (((ST.TIPOSIT <> ''D'') AND');
    Add('    (TO_CHAR(DATAADMISSAO,''YYYY'')       <= ' +QuotedStr(speAno.Text)+ ')) OR');
    Add('   ((ST.TIPOSIT  = ''D'') AND');
    Add('    (TO_CHAR(F.DATADESLIGAMENTO,''YYYY'') >= ' +QuotedStr(speAno.Text)+ '))) AND');

    if (Pos(',',sCodEstabSel) > 0) then
      Add('  (F.IDESTAB      IN (' +sCodEstabSel+ ')) AND')
    else
      Add('  (F.IDESTAB       = ' +sCodEstabSel+ ') AND');

    if (Pos(',',sAux) > 0) then
      Add('  (F.TIPOCONTRATO IN (' +sAux+ ')) AND')
    else
      Add('  (F.TIPOCONTRATO  = ' +sAux+ ') AND');

    Add('  (HT.IDHORARIO    = F.IDHORARIO) AND');
    Add('  (C.IDCARGO       = F.IDCARGO) AND');
    Add('  (C.CBO           = CBO.IDCBO) AND');
    Add('  (PESFIS.IDGRINSTR = GI.IDGRINSTR) AND');
    Add('  (F.IDSITFUNC     = ST.IDSITFUNC) AND');
    Add('  (F.IDPESSOA      = CTPS.IDPESSOA) AND');
    Add('  (F.IDPESSOA      = PIS.IDPESSOA) AND');
    Add('  (F.IDPESSOA      = PESFIS.IDPESSOA) AND');
    Add('  (F.IDPESSOA      = PF.IDPESSOA) AND');
    Add('  (PAIS.IDPAIS     = PESFIS.IDPAIS) AND');
    Add('  (F.IDPESSOA      = ESTR.IDPESSOA(+)) AND');
    Add('  (F.IDPESSOA      = CAUSA_DESLIG.IDPESSOA(+)) AND');
    Add('  (F.IDPESSOA      = HST_SITUACAO.IDPESSOA(+))');
    Add('ORDER BY');
    Add('  IDESTABELECIMENTO, PIS, DATAADMISSAO');
    SaveToFile('c:\qry.txt');
  end;
  qryRAIS.Open;

  gagTotal.AddProgress(5);
  DecodeTime(Time, wHora, wMin, wSeg, wMSeg);
  iHoraAtual := wMSeg + 1000 * wSeg + 60000 * wMin + 3600000 * wHora;
  lblTempoDecorr.Caption := TempoDecorridoHMS(iHoraAtual - iHoraIni, false);
  pnlProgresso.Update;

  if not(qryRAIS.IsEmpty) then
  begin
    // **********************************************************
    // Monta Querys das Remunerações dos Funcionários para a RAIS
    // **********************************************************

    // Remuneração do Empregado Normal
    ExecSel('Preparando Remuneração Normal dos Empregados...', qryRemNormal, 0, 12);

    // Remuneração do Empregado Normal para 1º parcela do 13º
    ExecSel('Preparando Remuneração da Primeira Parcela do 13º dos Empregados...',
      qryRem13PrimParc, 1, 5);

    // Remuneração do Empregado Normal para 2º parcela do 13º
    ExecSel('Preparando Remuneração da Segunda Parcela do 13º dos Empregados...',
      qryRem13SegParc, 2, 5);

    // Verificando quantos empregados participam do PAT
    ExecSelPAT;

    // Aviso Prévio Indenizado
    ExecSelAvisoPrevioIndeniz;

    // Processa dados para a geração do arquivo
    lblProcesso.Caption := 'Gerando dados dos Empregados...';
    pnlProgresso.Update;

    try
      // Contabiliza quantos dos estabelecimentos selecionados têm informações a gerar
      sIdEstab := qryRAIS.FieldByName('IDESTABELECIMENTO').asString;
      iNumEstab := 0;
      wNumRegistroAtual := 0;
      iNumFuncAddProgress := Round(qryRAIS.RecordCount / 50);
      iNumFuncAtual := 0;

      // Associa e Cria/Recria o arquivo de RAIS
      AssignFile(fRAIS,svdlgDialogo.FileName);
      ReWrite(fRAIS);
      bArqAberto := true;

      // **************************************************************
      // Registro Tipo '0' - Informações do estabelecimento responsável
      // **************************************************************
      // Incremento o número de registros
      Inc(wNumRegistroAtual);
      // Gravo o registro
      GerarRegistro0;

      // Loop para gerar o subarquivo de todos os estabelecimentos selecionados
      repeat
        // **************************************************
        // Registro Tipo '1' - Informações do Estabelecimento
        // **************************************************
        // Posiciono no Estabelecimento correto
        qryEstab.Locate('IDESTABELECIMENTO',qryRAIS.FieldByName('IDESTABELECIMENTO').asString,[]);

        // Incremento o número de Estabelecimentos
        Inc(iNumEstab);
        // Incremento o número de registros
        Inc(wNumRegistroAtual);
        // Gravo o registro
        GerarRegistro1;

        // Loop para todos os funcionários deste estabelecimento
        sIdEstab := qryRAIS.FieldByName('IDESTABELECIMENTO').asString;
        iNumFunc := 0;
        repeat
          sIdFunc := qryRAIS.FieldByName('IDPESSOA').asString;
          rRemJan:=0; rRemFev:=0; rRemMar:=0; rRemAbr:=0; rRemMai:=0; rRemJun:=0;
          rRemJul:=0; rRemAgo:=0; rRemSet:=0; rRemOut:=0; rRemNov:=0; rRemDez:=0;
          iMesRem13Adiant:=0; rRem13Adiant:=0; iMesRem13Final:=0; rRem13Final:=0;

          // Remuneraçõa Normal do funcionário atual
          if (qryRemNormal.Locate('IDPESSOA',qryRAIS.FieldByName('IDPESSOA').asString,[])) then
          begin
            repeat
              case (StrToInt(Copy(qryRemNormal.FieldByName('MES').asString,6,2))) of
                1 : rRemJan := qryRemNormal.FieldByName('VALOR').asFloat;
                2 : rRemFev := qryRemNormal.FieldByName('VALOR').asFloat;
                3 : rRemMar := qryRemNormal.FieldByName('VALOR').asFloat;
                4 : rRemAbr := qryRemNormal.FieldByName('VALOR').asFloat;
                5 : rRemMai := qryRemNormal.FieldByName('VALOR').asFloat;
                6 : rRemJun := qryRemNormal.FieldByName('VALOR').asFloat;
                7 : rRemJul := qryRemNormal.FieldByName('VALOR').asFloat;
                8 : rRemAgo := qryRemNormal.FieldByName('VALOR').asFloat;
                9 : rRemSet := qryRemNormal.FieldByName('VALOR').asFloat;
                10: rRemOut := qryRemNormal.FieldByName('VALOR').asFloat;
                11: rRemNov := qryRemNormal.FieldByName('VALOR').asFloat;
                12: rRemDez := qryRemNormal.FieldByName('VALOR').asFloat;
              end;

              qryRemNormal.Next;
            until (qryRemNormal.EOF) or (sIdFunc <> qryRemNormal.FieldByName('IDPESSOA').asString);

            // 13º Adiantamento do funcionário atual
            if (qryRem13PrimParc.Locate('IDPESSOA',qryRAIS.FieldByName('IDPESSOA').asString,[])) then
            begin
              iMesRem13Adiant := StrToInt(Copy(qryRem13PrimParc.FieldByName('MES').asString,6,2));
              rRem13Adiant := qryRem13PrimParc.FieldByName('VALOR').asFloat;
            end;

            // 13º Final do funcionário atual
            if (qryRem13SegParc.Locate('IDPESSOA',qryRAIS.FieldByName('IDPESSOA').asString,[])) then
            begin
              iMesRem13Final := StrToInt(Copy(qryRem13SegParc.FieldByName('MES').asString,6,2));
              rRem13Final := qryRem13SegParc.FieldByName('VALOR').asFloat;
            end;

            if (rRemJan < 0) then rRemJan:=0;
            if (rRemFev < 0) then rRemFev:=0;
            if (rRemMar < 0) then rRemMar:=0;
            if (rRemAbr < 0) then rRemAbr:=0;
            if (rRemMai < 0) then rRemMai:=0;
            if (rRemJun < 0) then rRemJun:=0;
            if (rRemJul < 0) then rRemJul:=0;
            if (rRemAgo < 0) then rRemAgo:=0;
            if (rRemSet < 0) then rRemSet:=0;
            if (rRemOut < 0) then rRemOut:=0;
            if (rRemNov < 0) then rRemNov:=0;
            if (rRemDez < 0) then rRemDez:=0;
            if (rRem13Adiant < 0) then rRem13Adiant:=0;
            if (rRem13Final < 0) then rRem13Final:=0;

            // ********************************
            // Registro Tipo '2' - Funcionários
            // ********************************

            // Incremento o número de Funcionários
            Inc (iNumFunc);
            // Incremento o número de registros
            Inc(wNumRegistroAtual);
            // Gravo o registro
            GerarRegistro2;
          end;

          // Próximo Registro
          qryRAIS.Next;
          if (iNumFuncAtual >= iNumFuncAddProgress) then
          begin
            gagTotal.AddProgress(1);
            DecodeTime(Time, wHora, wMin, wSeg, wMSeg);
            iHoraAtual := wMSeg + 1000 * wSeg + 60000 * wMin + 3600000 * wHora;
            lblTempoDecorr.Caption := TempoDecorridoHMS(iHoraAtual - iHoraIni, false);
            pnlProgresso.Update;
            iNumFuncAtual := 0;
          end
          else
            Inc(iNumFuncAtual);
        until (qryRAIS.EOF) or (sIdEstab <> qryRAIS.FieldByName('IDESTABELECIMENTO').asString);
      until (qryRAIS.EOF);

      // **********************
      // '9' - Registro Trailer
      // **********************
      Inc(wNumRegistroAtual);
      GerarRegistro9;

      DecodeTime(Time, wHora, wMin, wSeg, wMSeg);
      iHoraFin := wMSeg + 1000 * wSeg + 60000 * wMin + 3600000 * wHora;

      gagTotal.Progress := 100;
      DecodeTime(Time, wHora, wMin, wSeg, wMSeg);
      iHoraAtual := wMSeg + 1000 * wSeg + 60000 * wMin + 3600000 * wHora;
      lblTempoDecorr.Caption := TempoDecorridoHMS(iHoraAtual - iHoraIni, false);
      pnlProgresso.Update;

      if (bArqAberto) then
        CloseFile(fRAIS);

      if (bExibeCancel) then
        ShowMessage('Geração do RAIS cancelada.')
      else
        ShowMessage('Arquivo RAIS' +speAno.Text+ '.TXT gerado com sucesso.')
    except
      DecodeTime(Time,wHora,wMin,wSeg,wMSeg);
      iHoraFin := wMSeg + 1000 * wSeg + 60000 * wMin + 3600000 * wHora;

      DecodeTime(Time, wHora, wMin, wSeg, wMSeg);
      iHoraAtual := wMSeg + 1000 * wSeg + 60000 * wMin + 3600000 * wHora;
      lblTempoDecorr.Caption := TempoDecorridoHMS(iHoraAtual - iHoraIni, false);
      pnlProgresso.Update;

      if (bArqAberto) then
        CloseFile(fRAIS);

      ShowMessage('Erro durante a criação em '+svdlgDialogo.FileName);
    end;
  end
  else
  begin
    DecodeTime(Time,wHora,wMin,wSeg,wMSeg);
    iHoraFin := wMSeg + 1000 * wSeg + 60000 * wMin + 3600000 * wHora;

    DecodeTime(Time, wHora, wMin, wSeg, wMSeg);
    iHoraAtual := wMSeg + 1000 * wSeg + 60000 * wMin + 3600000 * wHora;
    lblTempoDecorr.Caption := TempoDecorridoHMS(iHoraAtual - iHoraIni, false);
    pnlProgresso.Update;

    if (bArqAberto) then
      CloseFile(fRAIS);

    ShowMessage('Não há dados a serem processados.');
  end;

  // Finalizo o método adequadamente
  pnlProgresso.SendToBack;
  pnlProgresso.Visible := false;

  qryRAIS.Close;
  qryRemNormal.Close;
  qryRem13PrimParc.Close;
  qryRem13SegParc.Close;

  pnlHorario.Caption := 'Tempo de Processamento: ' +TempoDecorrido(iHoraFin - iHoraIni);
end;

procedure TfrmParamRAISMagnetico.LeAlteracoes;
var
  c: byte;
  LiResp: string;
begin
  // Recupera as últimas alterações das opções
  ArqConfig := TIniFile.Create('C:\CONFIG_FOLHAPAGTO.INI');

  for c:=0 to 4 do
    sCodRubSel[c] := ArqConfig.ReadString('RAIS_MAG', 'Rubricas'+IntToStr(c+1), '');

  sCodEstabSel := ArqConfig.ReadString('RAIS_MAG', 'Estabelec', '');

  LiResp := ArqConfig.ReadString('RAIS_MAG', 'Responsavel', '');

  cbxEfetivos.Checked := (ArqConfig.ReadString('RAIS_MAG', 'Efetivos', 'V') = 'V');
  cbxEspeciais.Checked := (ArqConfig.ReadString('RAIS_MAG', 'Especiais', 'V') = 'V');
  cbxTemporarios.Checked := (ArqConfig.ReadString('RAIS_MAG', 'Temporarios', 'V') = 'V');
  cbxEstagiarios.Checked := (ArqConfig.ReadString('RAIS_MAG', 'Estagiarios', 'F') = 'V');
  cbxTerceiros.Checked := (ArqConfig.ReadString('RAIS_MAG', 'Terceiros', 'F') = 'V');
  cbxProprietarios.Checked := (ArqConfig.ReadString('RAIS_MAG', 'Proprietarios', 'F') = 'V');
  cbxAutonomos.Checked := (ArqConfig.ReadString('RAIS_MAG', 'Autonomos', 'F') = 'V');

  cmbMesDataBase.ItemIndex := StrToInt(ArqConfig.ReadString('RAIS_MAG', 'DataBase', '0'));

  redSalMinAtual.Value := StrToFloat(ArqConfig.ReadString('RAIS_MAG', 'SalMinAtual', '180'));

  for c:=0 to 4 do
  begin
    SelTipoFolhaRub(lstCodRubrica[c], sCodRubSel[c]);
    VerificaOpcoes(chklstRubrica[c], lstCodRubrica[c], sCodRubSel[c], ',');
    sCodRubSel[c] := NormalizaLiRubrica(sCodRubSel[c]);
  end;

  VerificaOpcoes(chklstEstab, lstCodEstab, sCodEstabSel, ',');

  if (LiResp = '') then
  begin
    qryNomeResp.First;
    LiResp := qryNomeResp.FieldByName('CODIGO').asString;
  end;
  dblkcbResp.LookUpValue := LiResp;
  dblkcbResp.UpDate;

  edCodRubricas.Text := sCodRubSel[0];

  HabilitaBtOk;
end;

procedure TfrmParamRAISMagnetico.GravaAlteracoes;
var
  c: byte;
  sGravaPadrao: string;
begin
  // Grava as últimas alterações da Opção de Rubricas
  for c:=0 to 4 do
  begin
    CriaListaOpcoes(chklstRubrica[c], lstCodRubrica[c], sGravaPadrao, ',', false);
    ArqConfig.WriteString('RAIS_MAG', 'Rubricas'+IntToStr(c+1), sGravaPadrao);
  end;

  // Grava as últimas alterações dos Estabelecimento
  CriaListaOpcoes(chklstEstab, lstCodEstab, sGravaPadrao, ',', false);
  ArqConfig.WriteString('RAIS_MAG', 'Estabelec', sGravaPadrao);

  // Data-base do dissídio
  ArqConfig.WriteString('RAIS_MAG', 'DataBase', IntToStr(cmbMesDataBase.ItemIndex));

  // Grava as últimas alterações do Responsável
  if (Trim(dblkcbResp.Text) <> '') then
    ArqConfig.WriteString('RAIS_MAG', 'Responsavel', qryNomeResp.FieldByName('CODIGO').asString);

  // Grava a última alteração do Salário Mínimo Atual
  ArqConfig.WriteString('RAIS_MAG', 'SalMinAtual', FloatToStr(redSalMinAtual.Value));

  ArqConfig.WriteString('RAIS_MAG', 'Efetivos', IFF(cbxEfetivos.Checked, 'V', 'F'));
  ArqConfig.WriteString('RAIS_MAG', 'Especiais', IFF(cbxEspeciais.Checked, 'V', 'F'));
  ArqConfig.WriteString('RAIS_MAG', 'Temporarios', IFF(cbxTemporarios.Checked, 'V', 'F'));
  ArqConfig.WriteString('RAIS_MAG', 'Estagiarios', IFF(cbxEstagiarios.Checked, 'V', 'F'));
  ArqConfig.WriteString('RAIS_MAG', 'Terceiros', IFF(cbxTerceiros.Checked, 'V', 'F'));
  ArqConfig.WriteString('RAIS_MAG', 'Proprietarios', IFF(cbxProprietarios.Checked, 'V', 'F'));
  ArqConfig.WriteString('RAIS_MAG', 'Autonomos', IFF(cbxAutonomos.Checked, 'V', 'F'));
end;

procedure TfrmParamRAISMagnetico.HabilitaBtOk;
var
  i,c: integer;
  bSelEstab: boolean;
  bSelRub: array[0..4] of boolean;
begin
  bSelEstab := false;
  for c:=0 to chklstEstab.Items.Count-1 do
    if (chklstEstab.Checked[c]) then
    begin
      bSelEstab := true;
      break;
    end;

  for i:=0 to 4 do
  begin
    bSelRub[i] := false;
    for c:=0 to chklstRubrica[i].Items.Count-1 do
      if (chklstRubrica[i].Checked[c]) or (i = 3) then // Passa a seleção das Rubricas para o PAT
      begin
        bSelRub[i] := true;
        break;
      end;
  end;

  rbtnGerar.Enabled := (bSelEstab) and (bSelRub[0]) and (bSelRub[1]) and (bSelRub[2]) and
    (bSelRub[4]) and (Trim(speAno.Text) <> '') and (Trim(dblkcbResp.Text) <> '');
end;

function TfrmParamRAISMagnetico.SelTipoContrato: string;
begin
  Result := '';
  if (cbxEfetivos.Checked) then
    Result := QuotedStr('E');

  if (cbxEspeciais.Checked) then
    if (length(Result) > 0) then
      Result := Result +','+ QuotedStr('S')
    else
      Result := QuotedStr('S');

  if (cbxTemporarios.Checked) then
    if (length(Result) > 0) then
      Result := Result +','+ QuotedStr('T')
    else
      Result := QuotedStr('T');

  if (cbxTerceiros.Checked) then
    if (length(Result) > 0) then
      Result := Result +','+ QuotedStr('3')
    else
      Result := QuotedStr('3');

  if (cbxProprietarios.Checked) then
    if (length(Result) > 0) then
      Result := Result +','+ QuotedStr('P')
    else
      Result := QuotedStr('P');

  if (cbxAutonomos.Checked) then
    if (length(Result) > 0) then
      Result := Result +','+ QuotedStr('A')
    else
      Result := QuotedStr('A');

  if (cbxEstagiarios.Checked) then
    if (length(Result) > 0) then
      Result := Result +','+ QuotedStr('G')
    else
      Result := QuotedStr('G');
end;

function TfrmParamRAISMagnetico.VerificaOpcoesOk: boolean;
var
  iFile: integer;
begin
  Result := false;
  svdlgDialogo.FileName := 'C:\RAIS\RAIS'+IntToStr(speAno.Value)+'.TXT';

  // Abro o diálogo de seleção do arquivo
  iFile := FileCreate('C:\RAIS\RAIS.TST');
  if (iFile = -1) then
  begin
    if (MsgDlg('Pasta C:\RAIS\ não foi encontrada.'+CR_LF+
               'Deseja criá-la?', 'Aviso', mtInformation, [mbYes,mbNo], 0) = mrYes) then
      CreateDir('C:\RAIS\')
    else
    if not(svdlgDialogo.Execute) then
      exit;
  end;
  FileClose(iFile);
  DeleteFile('C:\RAIS\RAIS.TST');

  // Verifica se o arquivo existe na pasta escolhida
  if (FileExists(svdlgDialogo.FileName)) then
    if (MsgDlg('O arquivo já existe na pasta especificada.'+CR_LF+
               'Deseja sobrescrevê-lo?', 'Aviso', mtConfirmation, [mbYes,mbNo], 0) = mrNo) then
      exit;

  DecodeTime(Time, wHora, wMin, wSeg, wMSeg);
  iHoraIni := wMSeg + 1000 * wSeg + 60000 * wMin + 3600000 * wHora;
  iHoraAtual := 0;

  fclblTitulo.Caption := 'Gerando RAIS do ano de ' + speAno.Text;
  gagTotal.Progress := 0;
  gagTotal.MaxValue := 100;
  lblHoraIni.Caption := 'Hora de Início: ' + TimeToStr(Time);
  lblTempoDecorr.Caption := TempoDecorridoHMS(0, false);

  pnlProgresso.Top := 160;
  pnlProgresso.Visible := true;
  pnlProgresso.BringToFront;
  pnlProgresso.Update;

  // Verifica se o Responsável pela informação foi selecionado
  SelEstab;  
  SelResp;
  if (qryResp.IsEmpty) then
  begin
    MsgDlg('Dados do Responsável selecionado podem não estar completos.'+CR_LF+
           'Verifique e tente novamente.', 'Aviso', mtInformation, [mbOK,mbHelp], 0);
    pnlProgresso.Visible := false;
    dblkcbResp.SetFocus;
    exit;
  end;

  Result := true;
end;

procedure TfrmParamRAISMagnetico.SelEstab;
begin
  lblProcesso.Caption := 'Verificando seleção do(s) Estabelecimento(s)...';
  pnlProgresso.Update;

  // Estabelecimentos selecionados
  CriaListaOpcoes(chklstEstab, lstCodEstab, sCodEstabSel, ',', false);

  qryEstab.Close;
  with (qryEstab.SQL) do
  begin
    Clear;
    Add('SELECT');
    Add('  PJ.IDPESSOA AS IDESTABELECIMENTO,');
    Add('  DECODE(CGC.NUM,NULL,''3'',''1'') AS TIPO_INSCRICAO,');
    Add('  DECODE(CGC.NUM,NULL,CEI.NUM,CGC.NUM) AS INSCRICAO,');
    Add('  DECODE(CGC.NUM,NULL,'''',CEI.NUM) AS MATRICULA_CEI,');
    Add('  RTRIM(PJ.RAZAOSOCIAL) AS NOME,');
    Add('  RTRIM(E.LOGRADOURO) AS ENDERECO,');
    Add('  E.NUMERO,');
    Add('  RTRIM(E.COMPLEMENTO) AS COMPLEMENTO,');
    Add('  RTRIM(E.BAIRRO) AS BAIRRO,');
    Add('  RTRIM(E.CEP) AS CEP,');
    Add('  RTRIM(CI.CODMUNICIPIO) AS COD_MUNICIPIO,');
    Add('  RTRIM(CI.NOME) AS NOM_MUNICIPIO,');
    Add('  ES.CODESTADO AS UF,');
    Add('  RTRIM(TEL.DDD) AS DDD,');
    Add('  RTRIM(TEL.NUMERO) AS TELEFONE,');
    Add('  FP.IDITEMCNAE AS CNAE,');
    Add('  FP.IDNATEMPRE AS NAT_JURIDICA');
    Add('FROM');
    Add('  PESSOA PJ, ENDPESS E, CIDADES CI, ESTADO ES, FILIALPESSOA FP,');
    // -------------------------------------------------------------------------- //
    // CGC da Empresa
    Add('  (SELECT FP.IDFILIALPESSOA AS IDPESSOA, DP.NUMDOCUMENTO AS NUM');
    Add('   FROM   DOCPESSOA DP, TIPODOCOFICIAL TDO, FILIALPESSOA FP');
    Add('   WHERE  ((TDO.SIGLADOCUMENTO = ''CNPJ:'') OR');
    Add('           (TDO.SIGLADOCUMENTO = ''CGC:'')) AND');
    Add('          (TDO.IDDOCUMENTO     = DP.IDDOCUMENTO) AND');
    Add('          (FP.IDFILIALPESSOA   = DP.IDPESSOA)) CGC,');
    // -------------------------------------------------------------------------- //
    // CEI da Empresa
    Add('  (SELECT FP.IDFILIALPESSOA AS IDPESSOA, DP.NUMDOCUMENTO AS NUM');
    Add('   FROM   DOCPESSOA DP, TIPODOCOFICIAL TDO, FILIALPESSOA FP');
    Add('   WHERE  (TDO.SIGLADOCUMENTO = ''CEI:'') AND');
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
    Add('     (END.IDTELEFONE = TE.IDTELEFONE)) TEL');
    // -------------------------------------------------------------------------- //
    Add('WHERE');

    if (Pos(',',sCodEstabSel) > 0) then
      Add('  (PJ.IDPESSOA      IN (' +sCodEstabSel+ ')) AND')
    else
      Add('  (PJ.IDPESSOA       = ' +sCodEstabSel+ ') AND');

    Add('  (PJ.NUMDOCUMENTO   IS NOT NULL) AND');
    Add('  (PJ.IDPESSOA       = FP.IDFILIALPESSOA) AND');
    Add('  (PJ.IDENDCOMERCIAL = E.IDENDERECO) AND');
    Add('  (PJ.IDPESSOA       = E.IDPESSOA) AND');
    Add('  (PJ.IDENDCOMERCIAL = TEL.IDENDERECO) AND');
    Add('  (E.IDCIDADES       = CI.IDCIDADES) AND');
    Add('  (CI.IDESTADO       = ES.IDESTADO) AND');
    Add('  (PJ.IDPESSOA       = CEI.IDPESSOA(+)) AND');
    Add('  (PJ.IDPESSOA       = CGC.IDPESSOA(+))');
    SaveToFile('c:\qryEstabRAIS.txt');
  end;
  qryEstab.Open;

  gagTotal.AddProgress(5);
  DecodeTime(Time, wHora, wMin, wSeg, wMSeg);
  iHoraAtual := wMSeg + 1000 * wSeg + 60000 * wMin + 3600000 * wHora;
  lblTempoDecorr.Caption := TempoDecorridoHMS(iHoraAtual - iHoraIni, false);
  pnlProgresso.Update;

  gagTotal.AddProgress(5);
  DecodeTime(Time, wHora, wMin, wSeg, wMSeg);
  iHoraAtual := wMSeg + 1000 * wSeg + 60000 * wMin + 3600000 * wHora;
  lblTempoDecorr.Caption := TempoDecorridoHMS(iHoraAtual - iHoraIni, false);
  pnlProgresso.Update;
end;

procedure TfrmParamRAISMagnetico.SelResp;
begin
  lblProcesso.Caption := 'Verificando seleção do Responsável...';
  pnlProgresso.Update;

  qryResp.Close;
  with (qryResp.SQL) do
  begin
    Clear;
    Add('SELECT');
    Add('  DECODE(CGC.NUM,NULL,''3'',''1'') AS TIPO_INSCRICAO,');
    Add('  DECODE(CGC.NUM,NULL,CEI.NUM,CGC.NUM) AS INSCRICAO,');
    Add('  RTRIM(PJ.RAZAOSOCIAL) AS NOME,');
    Add('  RTRIM(E.LOGRADOURO) AS ENDERECO,');
    Add('  E.NUMERO,');
    Add('  RTRIM(E.COMPLEMENTO) AS COMPLEMENTO,');
    Add('  RTRIM(E.BAIRRO) AS BAIRRO,');
    Add('  RTRIM(E.CEP) AS CEP,');
    Add('  RTRIM(CI.CODMUNICIPIO) AS COD_MUNICIPIO,');
    Add('  RTRIM(CI.NOME) AS NOM_MUNICIPIO,');
    Add('  ES.CODESTADO AS UF,');
    Add('  RTRIM(TEL.DDD) AS DDD,');
    Add('  RTRIM(TEL.NUMERO) AS TELEFONE,');
    Add('  RTRIM(PJ.HOMEPAGE) AS EMAIL');
    Add('FROM');
    Add('  PESSOA PJ, ENDPESS E, CIDADES CI, ESTADO ES,');
    // -------------------------------------------------------------------------- //
    // CGC da Empresa
    Add('  (SELECT FP.IDFILIALPESSOA AS IDPESSOA, DP.NUMDOCUMENTO AS NUM');
    Add('   FROM   DOCPESSOA DP, TIPODOCOFICIAL TDO, FILIALPESSOA FP');
    Add('   WHERE  ((TDO.SIGLADOCUMENTO = ''CNPJ:'') OR');
    Add('           (TDO.SIGLADOCUMENTO = ''CGC:'')) AND');
    Add('          (TDO.IDDOCUMENTO     = DP.IDDOCUMENTO) AND');
    Add('          (FP.IDFILIALPESSOA   = DP.IDPESSOA)) CGC,');
    // -------------------------------------------------------------------------- //
    // CEI da Empresa
    Add('  (SELECT FP.IDFILIALPESSOA AS IDPESSOA, DP.NUMDOCUMENTO AS NUM');
    Add('   FROM   DOCPESSOA DP, TIPODOCOFICIAL TDO, FILIALPESSOA FP');
    Add('   WHERE  (TDO.SIGLADOCUMENTO = ''CEI:'') AND');
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
    Add('     (END.IDTELEFONE = TE.IDTELEFONE)) TEL');
    // -------------------------------------------------------------------------- //
    Add('WHERE');
    Add('  (PJ.IDPESSOA       = ' +qryNomeResp.FieldByName('CODIGO').asString+ ') AND');
    Add('  (PJ.IDENDCOMERCIAL = E.IDENDERECO) AND');
    Add('  (PJ.IDPESSOA       = E.IDPESSOA) AND');
    Add('  (PJ.IDENDCOMERCIAL = TEL.IDENDERECO) AND');
    Add('  (E.IDCIDADES       = CI.IDCIDADES) AND');
    Add('  (CI.IDESTADO       = ES.IDESTADO) AND');
    Add('  (PJ.IDPESSOA       = CEI.IDPESSOA(+)) AND');
    Add('  (PJ.IDPESSOA       = CGC.IDPESSOA(+)) AND');
    Add('  (ROWNUM = 1)');
    SaveToFile('c:\qryRespRAIS.txt');
  end;
  qryResp.Open;

  gagTotal.AddProgress(5);
  DecodeTime(Time, wHora, wMin, wSeg, wMSeg);
  iHoraAtual := wMSeg + 1000 * wSeg + 60000 * wMin + 3600000 * wHora;
  lblTempoDecorr.Caption := TempoDecorridoHMS(iHoraAtual - iHoraIni, false);
  pnlProgresso.Update;
end;

procedure TfrmParamRAISMagnetico.SelTipoFolha;
begin
  if (chklstRubricaAtual.ItemIndex >= 0) then
  begin
    stxtTipoFolha.Visible := (chklstRubricaAtual.Checked[chklstRubricaAtual.ItemIndex]);
    dblkcbTipoFolha.Visible := stxtTipoFolha.Visible;

    dblkcbTipoFolha.OnChange := nil;
    if (stxtTipoFolha.Visible) then
      dblkcbTipoFolha.LookupValue :=
        Copy(lstCodRubricaAtual[chklstRubricaAtual.ItemIndex],
          Pos('=',lstCodRubricaAtual[chklstRubricaAtual.ItemIndex])+1,
          Length(lstCodRubricaAtual[chklstRubricaAtual.ItemIndex]) -
          Pos('=',lstCodRubricaAtual[chklstRubricaAtual.ItemIndex]))
    else
      dblkcbTipoFolha.LookupValue := '';
    dblkcbTipoFolha.OnChange := dblkcbTipoFolhaChange;
  end;
end;

procedure TfrmParamRAISMagnetico.SelTipoFolhaRub(Lista: TStringList; Valor: string);
var
  iPos: integer;
  ValorAtual: string;
begin
  while (Trim(Valor) <> '') do
  begin
    ExtraiString(Valor, ValorAtual, ',');
    iPos := Lista.IndexOf(Copy(ValorAtual, 1, Pos('=', ValorAtual)));
    if (iPos > -1) then
      Lista[iPos] := ValorAtual;
  end;
end;

function TfrmParamRAISMagnetico.NormalizaLiRubrica(Valor: string): string;
var
  ValorAtual: string;
begin
  Result := '';
  while (Trim(Valor) <> '') do
  begin
    ExtraiString(Valor, ValorAtual, ',');
    Result := Result + Copy(ValorAtual, 1, IFF(Pos('=', ValorAtual) > 0,
      Pos('=', ValorAtual)-1, Length(ValorAtual))) + IFF((Trim(Valor) = ''), '', ',');
  end;
end;

function TfrmParamRAISMagnetico.Val_CTPS(Tam:byte; Campo:string): string;
var
  Pos, c: byte;
  wMax: word;
  sAux, sAux2: string;
begin
  try
    for c:=1 to length(Campo) do
      if (Campo[c] in ['0'..'9']) then
        sAux := sAux + Campo[c];

    // Atribuo o maior tamanho verificável possível
    if (Tam > length(sAux)) then
      wMax := length(sAux)
    else
      wMax := Tam;

    c := length(sAux);
    for Pos:= 1 to wMax do
    begin
      sAux2 := sAux[c] + sAux2;
      Dec(c);
    end;

    Result := Alinha (sAux2, Tam, 'D', '0');
  except
    Result := Replicate(' ', Tam);
  end;
end;

procedure TfrmParamRAISMagnetico.ExecSel(Msg:string; qry:TwwQuery; Num,Progresso:integer);
var
  c, iPos: integer;
  sSQL, sCodRubrica, sCodTipFol: string;
begin
  // Para os adiantamentos do 13º (Num = 1), não é feito um agrupamento pelo mês por quê
  // pode ocorrer de ser pago em meses difirentes. Neste caso, o mês de referência é tido
  // como o último mês encontrado usando MAX(MES) ao invés de somente MES (como é para a
  // remuneração normal) e o valor será a soma aritmética dos valores encontrados.
  lblProcesso.Caption := Msg;
  pnlProgresso.Update;

  qry.Close;  
  with (qry.SQL) do
  begin
    Clear;
    Add('SELECT');
    Add('  H.IDPESSOA,'+IFF(Num=0,' H.MES,',' MAX(H.MES) AS MES,'));
    Add('  SUM(DECODE(PD.FLGDESCONTO,1,-H.VALORPROVENTO,H.VALORPROVENTO)) AS VALOR');
    Add('FROM');
    Add('  HISTRUBSAL H, PROVDESC PD, FUNCIONARIO F, SITFUNC ST');
    Add('WHERE');
    Add('  (((ST.TIPOSIT <> ''D'') AND');
    Add('    (TO_CHAR(F.DATAADMISSAO,''YYYY'')     <= ' +QuotedStr(speAno.Text)+ ')) OR');
    Add('   ((ST.TIPOSIT  = ''D'') AND');
    Add('    (TO_CHAR(F.DATADESLIGAMENTO,''YYYY'') >= ' +QuotedStr(speAno.Text)+ '))) AND');

    sSQL := '';
    for c:=0 to chklstRubrica[Num].Items.Count-1 do
      if (chklstRubrica[Num].Checked[c]) then
      begin
        iPos := Pos('=', lstCodRubrica[Num][c]);
        // Pego o Código da Rubrica Atual
        if (iPos = 0) then
          sCodRubrica := lstCodRubrica[Num][c]
        else
          sCodRubrica := Copy(lstCodRubrica[Num][c], 1, iPos-1);
        // Pego o Código do Tipo de Folha Atual
        if (iPos = 0) then
          sCodTipFol := ''
        else
          sCodTipFol := Copy(lstCodRubrica[Num][c], iPos+1,
            Length(lstCodRubrica[Num][c]) - iPos+1);

        if (sCodTipFol <> '') then
          sSQL := sSQL +' '+ IFF(sSQL = '', '  ', 'OR')+
               ' ((H.CODPROVDESC = ' +QuotedStr(sCodRubrica)+ ') AND'+CR_LF+
            '     (H.IDMOTIVO    = ' +sCodTipFol+ '))'+CR_LF
        else
          sSQL := sSQL +' '+ IFF(sSQL = '', '  ', 'OR')+
               ' (H.CODPROVDESC  = ' +QuotedStr(sCodRubrica)+ ')'+CR_LF;
      end;

    if (sSQL <> '') then
      Add('  (' +CR_LF+ sSQL +'  ) AND');

    Add('  (H.IDPESSJUR    = ' +IntToStr(Sistema.IdEmpresa)+ ') AND');
    Add('  (H.MES    BETWEEN ' +QuotedStr(speAno.Text+'/01')+ ' AND '+
      QuotedStr(speAno.Text+'/12')+ ') AND');
    Add('  (ST.IDSITFUNC   = F.IDSITFUNC) AND');
    Add('  (F.IDPESSOA     = H.IDPESSOA) AND');
    Add('  (H.IDRUBRICA    = PD.IDPROVENTO)');
    Add('GROUP BY');
    Add('  H.IDPESSOA'+IFF(Num=0,', H.MES',''));
    SaveToFile('c:\qry'+IntToStr(Num+1)+'.txt');
  end;
  qry.Open;

  gagTotal.AddProgress(Progresso);
  DecodeTime(Time, wHora, wMin, wSeg, wMSeg);
  iHoraAtual := wMSeg + 1000 * wSeg + 60000 * wMin + 3600000 * wHora;
  lblTempoDecorr.Caption := TempoDecorridoHMS(iHoraAtual - iHoraIni, false);
end;

procedure TfrmParamRAISMagnetico.ExecSelPAT;
var
  dMediaSal, dIdPessoa: double;
  c, iPos, iNumDenom: integer;
  sSQL, sCodRubrica, sCodTipFol: string;
begin
  lblProcesso.Caption := 'Verificando quantos Empregados participam do PAT...';
  pnlProgresso.Update;

  iNumEmprPATMenos5Sal := 0;
  iNumEmprPATMais5Sal := 0;

  qryPAT.Close;
  if (sCodRubSel[3] <> '') then
  begin
    with (qryPAT.SQL) do
    begin
      Clear;
      Add('SELECT');
      Add('  H.IDPESSOA');
      Add('FROM');
      Add('  HISTRUBSAL H, FUNCIONARIO F, SITFUNC ST');
      Add('WHERE');
      Add('  (((ST.TIPOSIT <> ''D'') AND');
      Add('    (TO_CHAR(DATAADMISSAO,''YYYY'')       <= ' +QuotedStr(speAno.Text)+ ')) OR');
      Add('   ((ST.TIPOSIT  = ''D'') AND');
      Add('    (TO_CHAR(F.DATADESLIGAMENTO,''YYYY'') >= ' +QuotedStr(speAno.Text)+ '))) AND');

      sSQL := '';
      for c:=0 to chklstRubrica[3].Items.Count-1 do
        if (chklstRubrica[3].Checked[c]) then
        begin
          iPos := Pos('=', lstCodRubrica[3][c]);
          // Pego o Código da Rubrica Atual
          if (iPos = 0) then
            sCodRubrica := lstCodRubrica[3][c]
          else
            sCodRubrica := Copy(lstCodRubrica[3][c], 1, iPos-1);
          // Pego o Código do Tipo de Folha Atual
          if (iPos = 0) then
            sCodTipFol := ''
          else
            sCodTipFol := Copy(lstCodRubrica[3][c], iPos+1,
              Length(lstCodRubrica[3][c]) - iPos+1);

          if (sCodTipFol <> '') then
            sSQL := sSQL +' '+ IFF(sSQL = '', '  ', 'OR')+
                 ' ((H.CODPROVDESC  = ' +QuotedStr(sCodRubrica)+ ') AND'+CR_LF+
              '     (H.IDMOTIVO     = ' +sCodTipFol+ '))'+CR_LF
          else
            sSQL := sSQL +' '+ IFF(sSQL = '', '  ', 'OR')+
                 ' (H.CODPROVDESC   = ' +QuotedStr(sCodRubrica)+ ')'+CR_LF;
        end;

      if (sSQL <> '') then
        Add('  (' +CR_LF+ sSQL +'  ) AND');

      Add('  (H.IDPESSJUR  = '+IntToStr(Sistema.IdEmpresa)+') AND');
      Add('  (H.MES  BETWEEN ' +QuotedStr(speAno.Text+'/01')+ ' AND '+
        QuotedStr(speAno.Text+'/12')+ ') AND');
      Add('  (ST.IDSITFUNC = F.IDSITFUNC) AND');
      Add('  (F.IDPESSOA   = H.IDPESSOA)');
      Add('GROUP BY');
      Add('  H.IDPESSOA');
      SaveToFile('c:\qry4.txt');
    end;
    qryPAT.Open;

    while not(qryPAT.EOF) do
    begin
      if (qryRemNormal.Locate('IDPESSOA',qryPAT.FieldByName('IDPESSOA').asString,[])) then
      begin
        // Calculo a média dos salários da pessoa
        iNumDenom := 0;
        dIdPessoa := qryRemNormal.FieldByName('IDPESSOA').asFloat;
        repeat
          dMediaSal := dMediaSal + qryRemNormal.FieldByName('VALOR').asFloat;
          if (qryRemNormal.FieldByName('VALOR').asFloat > 0) then
            Inc(iNumDenom);
          qryRemNormal.Next;
        until (qryRemNormal.EOF) or (dIdPessoa <> qryRemNormal.FieldByName('IDPESSOA').asFloat);
        dMediaSal := dMediaSal / iNumDenom;

        // Verifico se a pessoa teve média salarial maior ou menor que cinco salários mínimos
        if (dMediaSal <= redSalMinAtual.Value*5) then
          Inc(iNumEmprPATMenos5Sal)
        else
          Inc(iNumEmprPATMais5Sal);
      end;
      qryPAT.Next;
    end;
    qryRemNormal.First;
  end;

  gagTotal.AddProgress(8);
  DecodeTime(Time, wHora, wMin, wSeg, wMSeg);
  iHoraAtual := wMSeg + 1000 * wSeg + 60000 * wMin + 3600000 * wHora;
  lblTempoDecorr.Caption := TempoDecorridoHMS(iHoraAtual - iHoraIni, false);
end;

procedure TfrmParamRAISMagnetico.ExecSelAvisoPrevioIndeniz;
var
  c, iPos: integer;
  sSQL, sCodRubrica, sCodTipFol: string;
begin
  lblProcesso.Caption := 'Preparando Aviso Prévio Indenizado dos Empregados...';
  pnlProgresso.Update;

  qryAvisoPrevioIndeniz.Close;  
  with (qryAvisoPrevioIndeniz.SQL) do
  begin
    Clear;
    Add('SELECT');
    Add('  H.IDPESSOA,');
    Add('  SUM(DECODE(PD.FLGDESCONTO,1,-H.VALORPROVENTO,H.VALORPROVENTO)) AS VALOR');
    Add('FROM');
    Add('  HISTRUBSAL H, PROVDESC PD, FUNCIONARIO F, SITFUNC ST');
    Add('WHERE');
    Add('  (ST.TIPOSIT = ''D'') AND');
    Add('  (TO_CHAR(F.DATADESLIGAMENTO,''YYYY'') = ' +QuotedStr(speAno.Text)+ ') AND');

    sSQL := '';
    for c:=0 to chklstRubrica[4].Items.Count-1 do
      if (chklstRubrica[4].Checked[c]) then
      begin
        iPos := Pos('=', lstCodRubrica[4][c]);
        // Pego o Código da Rubrica Atual
        if (iPos = 0) then
          sCodRubrica := lstCodRubrica[4][c]
        else
          sCodRubrica := Copy(lstCodRubrica[4][c], 1, iPos-1);
        // Pego o Código do Tipo de Folha Atual
        if (iPos = 0) then
          sCodTipFol := ''
        else
          sCodTipFol := Copy(lstCodRubrica[4][c], iPos+1,
            Length(lstCodRubrica[4][c]) - iPos+1);

        if (sCodTipFol <> '') then
          sSQL := sSQL +' '+ IFF(sSQL = '', '  ', 'OR')+
               ' ((H.CODPROVDESC  = ' +QuotedStr(sCodRubrica)+ ') AND'+CR_LF+
            '     (H.IDMOTIVO     = ' +sCodTipFol+ '))'+CR_LF
        else
          sSQL := sSQL +' '+ IFF(sSQL = '', '  ', 'OR')+
               ' (H.CODPROVDESC   = ' +QuotedStr(sCodRubrica)+ ')'+CR_LF;
      end;

    if (sSQL <> '') then
      Add('  (' +CR_LF+ sSQL +'  ) AND');

    Add('  (H.IDPESSJUR  = '+IntToStr(Sistema.IdEmpresa)+') AND');
    Add('  (H.MES  BETWEEN ' +QuotedStr(speAno.Text+'/01')+ ' AND '+
      QuotedStr(speAno.Text+'/12')+ ') AND');
    Add('  (ST.IDSITFUNC = F.IDSITFUNC) AND');
    Add('  (F.IDPESSOA   = H.IDPESSOA) AND');
    Add('  (H.IDRUBRICA  = PD.IDPROVENTO)');
    Add('GROUP BY');
    Add('  H.IDPESSOA');
    SaveToFile('c:\qry5.txt');
  end;
  qryAvisoPrevioIndeniz.Open;

  gagTotal.AddProgress(5);
  DecodeTime(Time, wHora, wMin, wSeg, wMSeg);
  iHoraAtual := wMSeg + 1000 * wSeg + 60000 * wMin + 3600000 * wHora;
  lblTempoDecorr.Caption := TempoDecorridoHMS(iHoraAtual - iHoraIni, false);
end;

procedure TfrmParamRAISMagnetico.GerarRegistro0;
begin
  Write(fRAIS,
    // 01-Número do registro no arquivo
    fValidaDados('N', IntToStr(wNumRegistroAtual), 6)+
    // 02-Inscrição CGC/CNPJ/CEI do primeiro estabelecimento do arquivo
    fValidaDados('N', qryResp.FieldByName('INSCRICAO').asString, 14)+
    // 03-Prefixo do primeiro estabelecimento do arquivo
    '00'+
    // 04-Tipo do registro
    '0'+
    // 05-Indicador p/envio do recibo definitivo
    // 1 - o recibo será enviado pelo correio para o endereço do responsável
    // 2 - o recibo será enviado pelo correio para o endereço do estabelecimento
    IFF(rgIndicador1.ItemIndex=0,'2','1')+
    // 06-Inscrição CNPJ/CEI/CPF do responsável
    fValidaDados('N', qryResp.FieldByName('INSCRICAO').asString, 14)+
    // 07-Tipo de Inscrição do responsável
    // 1 - CNPJ
    // 3 - CEI
    // 4 - CPF
    fValidaDados('N', qryResp.FieldByName('TIPO_INSCRICAO').asString, 1)+
    // 08-Nome do responsável (Razão social)
    fValidaDados('A', qryResp.FieldByName('NOME').asString, 40)+
    // 09-Endereço do responsável
    fValidaDados('A', qryResp.FieldByName('ENDERECO').asString, 40)+
    // 10-Número
    fValidaDados('N', qryResp.FieldByName('NUMERO').asString, 6)+
    // 11-Complemento
    fValidaDados('A', qryResp.FieldByName('COMPLEMENTO').asString, 21)+
    // 12-Bairro
    fValidaDados('A', qryResp.FieldByName('BAIRRO').asString, 19)+
    // 13-CEP
    fValidaDados('N', qryResp.FieldByName('CEP').asString, 8)+
    // 14-Código do Município
    fValidaDados('N', qryResp.FieldByName('COD_MUNICIPIO').asString, 7)+
    // 15-Nome do Município
    fValidaDados('A', qryResp.FieldByName('NOM_MUNICIPIO').asString, 30)+
    // 16-UF
    fValidaDados('A', qryResp.FieldByName('UF').asString, 2)+
    // 17-DDD
    fValidaDados('N', qryResp.FieldByName('DDD').asString, 2)+
    // 18-Telefone
    fValidaDados('N', qryResp.FieldByName('TELEFONE').asString, 8)+
    // 19-Indicador de retificação de declaração
    // 1 - este arquivo retifica a declaração dos estabelecimentos presentes
    // 2 - a declaração não é de retificação (é primeira entrega)
    // no arquivo e que foram entregues anteriormente
    IFF(rgTipoInf.ItemIndex=0,'2','1')+
    // 19-Data da retificação dos estabelecimentos relacionados abaixo (DDMMAAAA)
    IFF(rgTipoInf.ItemIndex=1,TiraBarra(dtedRetif.Text),'00000000')+
    // 20-Data da geração do arquivo
    TiraBarra(TiraBarra(DateToStr(Date)))+
    // 21-E-MAIL do responsável
    fValidaDados('*', qryResp.FieldByName('EMAIL').asString, 39)+
    // 22-Espaços
    Replicate(' ',28)+
    // Final de linha
    CR_LF);
end;

procedure TfrmParamRAISMagnetico.GerarRegistro1;
begin
  Write(fRAIS,
    // 01-Número do registro no arquivo
    fValidaDados('N', IntToStr(wNumRegistroAtual), 6)+
    // 02-Inscrição CGC/CNPJ/CEI do estabelecimento
    fValidaDados('N', qryEstab.FieldByName('INSCRICAO').asString, 14)+
    // 03-Prefixo do estabelecimento
    '00'+
    // 04-Tipo do registro
    '1'+
    // 05-Nome / Rasão Social
    fValidaDados('A', qryEstab.FieldByName('NOME').asString, 52)+
    // 07-Endereço do responsável
    fValidaDados('A', qryEstab.FieldByName('ENDERECO').asString, 40)+
    // 08-Número
    fValidaDados('N', qryEstab.FieldByName('NUMERO').asString, 6)+
    // 09-Complemento
    fValidaDados('A', qryEstab.FieldByName('COMPLEMENTO').asString, 21)+
    // 10-Bairro
    fValidaDados('A', qryEstab.FieldByName('BAIRRO').asString, 19)+
    // 11-CEP
    fValidaDados('N', qryEstab.FieldByName('CEP').asString, 8)+
    // 12-Código do Município
    fValidaDados('N', qryEstab.FieldByName('COD_MUNICIPIO').asString, 7)+
    // 13-Nome do Município
    fValidaDados('A', qryEstab.FieldByName('NOM_MUNICIPIO').asString, 30)+
    // 14-UF
    fValidaDados('A', qryEstab.FieldByName('UF').asString, 2)+
    // 15-DDD
    fValidaDados('N', qryEstab.FieldByName('DDD').asString, 2)+
    // 16-Telefone
    fValidaDados('N', qryEstab.FieldByName('TELEFONE').asString, 8)+
    // 17-Código CNAE
    fValidaDados('N', qryEstab.FieldByName('CNAE').asString, 5)+
    // 18-Natureza Jurídica
    fValidaDados('N', qryEstab.FieldByName('NAT_JURIDICA').asString, 4)+
    // 19-Número de Proprietários
    PoeZero(spedNumProp.Value)+
    // 20-Mês da Data-Base
    PoeZero(cmbMesDataBase.ItemIndex+1)+
    // 21-Tipo de inscrição do Estabelecimento (1->CGC/CNPJ; 3->CEI)
    qryEstab.FieldByName('TIPO_INSCRICAO').asString+
    // 22-Tipo de RAIS (0->Estab. com empregados; 1->Estab. sem empregados)
    '0'+
    // 23-Zeros
    '00'+
    // 24-Matrícula CEI vinculada a uma inscrição CGC
    fValidaDados('N', qryEstab.FieldByName('MATRICULA_CEI').asString, 12)+
    // 25-Competência (Ano-Base)
    speAno.Text+
    // 26-Indicador de Porte da Empresa
    // 1 - Micro-empresa
    // 2 - Empresa de Pequeno Porte
    // 3 - Empresa não classificada nos ítens anteriores
    IntToStr(rgMicroEmpr.ItemIndex+1)+
    // 27-Indicador de Optante pelo Simples
    // 1 - Sim
    // 2 - Não
    IntToStr(rgSimples.ItemIndex+1)+
    // 28-Indicador de Participação no PAT (Programa de Alimentação do Trabalhador)
    // 1 - Sim
    // 2 - Não
    IntToStr(rgParticipaPAT.ItemIndex+1)+
    // 29-Vínculos que Participam do PAT que recebem salários até 5 salários mínimos
    fValidaDados('N', IntToStr(iNumEmprPATMenos5Sal), 6)+
    // 30-Vínculo que Participam do PAT que recebem salários acima de 5 salários mínimos
    fValidaDados('N', IntToStr(iNumEmprPATMais5Sal), 6)+
    // 31-Porcentagem de Serviço Próprio
    fValidaDados('N', redPorc1.Text, 3)+
    // 32-Porcentagem de Administração de cozinha
    fValidaDados('N', redPorc2.Text, 3)+
    // 33-Porcentagem de Refeição convênio
    fValidaDados('N', redPorc3.Text, 3)+
    // 34-Porcentagem de Refeição transportadora
    fValidaDados('N', redPorc4.Text, 3)+
    // 35-Porcentagem de Cesta alimento
    fValidaDados('N', redPorc5.Text, 3)+
    // 36-Porcentagem de Alimentação convênio
    fValidaDados('N', redPorc6.Text, 3)+
    // 37-Indicador de Encerramento de Atividades
    IFF(rgTipoDeclarac.ItemIndex=0,'2','1')+
    // 38-Data de Encerramento de Atividades
    fValidaDados('N', TiraBarra(dtedDataEncerr.Text), 8)+
    // 39-Espaço
    ' '+
    // 40-Reservado para informação de uso exclusivo da empresa
    Replicate(' ',12)+
    // Final de linha
    CR_LF);
end;

procedure TfrmParamRAISMagnetico.GerarRegistro2;
var
  rAvisoPrevioIndeniz: real;
  iHorasTrab, iNumDias, iNumMeses, iNumAnos: integer;
begin
  CalculaDifData(qryRAIS.FieldByName('DATAADMISSAO').asString, DateToStr(Date),
    iNumDias, iNumMeses, iNumAnos);

  if (qryAvisoPrevioIndeniz.Locate('IdPessoa',qryRAIS.FieldByName('IdPessoa').asString,[])) then
    rAvisoPrevioIndeniz := qryAvisoPrevioIndeniz.FieldByName('VALOR').asFloat
  else
    rAvisoPrevioIndeniz := 0;

  iHorasTrab := Round(qryRAIS.FieldByName('HRS_TRAB').asFloat);
  if (iHorasTrab = 0) then
    iHorasTrab := 1;

  Write(fRAIS,
    // 01-Número do registro no arquivo
    fValidaDados('N', IntToStr(wNumRegistroAtual), 6)+
    // 02-Inscrição CGC/CNPJ/CEI do estabelecimento
    fValidaDados('N', qryEstab.FieldByName('INSCRICAO').asString, 14)+
    // 03-Prefixo do estabelecimento
    '00'+
    // 04-Tipo do registro
    '2'+
    // 05-PIS/PASEP
    fValidaDados('N', qryRAIS.FieldByName('PIS').asString, 11)+
    // 06-Nome do Empregado
    fValidaDados('A', qryRAIS.FieldByName('FUNCIONARIO').asString, 30)+
    // 07-Data de nascimento
    fValidaDados('N', TiraBarra(qryRAIS.FieldByName('DATANASC').asString), 8)+
    // 08-Nacionalidade
    fValidaDados('N', qryRAIS.FieldByName('NACIONALIDADE').asString, 2)+
    // 09-Ano de chegada ao país
    fValidaDados('N', qryRAIS.FieldByName('ANOCHEGADA').asString, 4)+
    // 10-Grau de instrução
    fValidaDados('N', qryRAIS.FieldByName('GRAU_INSTR').asString, 1)+
    // 11-CPF
    fValidaDados('N', qryRAIS.FieldByName('CPF').asString, 11)+
    // 12-Espaço
    ' '+
    // 13-Número da CTPS
    Val_CTPS(11, Trim(qryRAIS.FieldByName('CTPS').asString))+
    // 14-Data de admissão / transferência
    fValidaDados('N', TiraBarra(qryRAIS.FieldByName('DATAADMISSAO').asString), 8)+
    // 15-Tipo de admissão
    fValidaDados('N', qryRAIS.FieldByName('TIPO_ADMISSAO').asString, 1)+
    // 16-Salário Contratual
    fValidaDados('N', FormatFloat('#########0.00',qryRAIS.FieldByName('SALARIO_CONTR').asFloat), 9)+
    // 17-Tipo de Salário Contratual
    fValidaDados('N', qryRAIS.FieldByName('TIPO_SAL_CONTR').asString, 1)+
    // 18-Horas Semanais
    fValidaDados('N', IntToStr(iHorasTrab), 2)+
    // 19-CBO
    fValidaDados('N', qryRAIS.FieldByName('CBO').asString, 5)+
    // 20-Vínculo
    fValidaDados('N', qryRAIS.FieldByName('VINC_EMPREG').asString, 2)+
    // 21-Código do Desligamento
    fValidaDados('N', qryRAIS.FieldByName('MOTIVODESLIGRAIS').asString, 2)+
    // 22-Data de Desligamento
    fValidaDados('N', qryRAIS.FieldByName('DATADESLIGAMENTO').asString, 4)+
    // 23-Remuneração JANEIRO
    fValidaDados('N', FormatFloat('#########0.00',rRemJan), 9)+
    // 24-Remuneração FEVEREIRO
    fValidaDados('N', FormatFloat('#########0.00',rRemFev), 9)+
    // 25-Remuneração MARÇO
    fValidaDados('N', FormatFloat('#########0.00',rRemMar), 9)+
    // 26-Remuneração ABRIL
    fValidaDados('N', FormatFloat('#########0.00',rRemAbr), 9)+
    // 27-Remuneração MAIO
    fValidaDados('N', FormatFloat('#########0.00',rRemMai), 9)+
    // 28-Remuneração JUNHO
    fValidaDados('N', FormatFloat('#########0.00',rRemJun), 9)+
    // 29-Remuneração JULHO
    fValidaDados('N', FormatFloat('#########0.00',rRemJul), 9)+
    // 30-Remuneração AGOSTO
    fValidaDados('N', FormatFloat('#########0.00',rRemAgo), 9)+
    // 31-Remuneração SETEMBRO
    fValidaDados('N', FormatFloat('#########0.00',rRemSet), 9)+
    // 32-Remuneração OUTUBRO
    fValidaDados('N', FormatFloat('#########0.00',rRemOut), 9)+
    // 33-Remuneração NOVEMBRO
    fValidaDados('N', FormatFloat('#########0.00',rRemNov), 9)+
    // 34-Remuneração DEZEMBRO
    fValidaDados('N', FormatFloat('#########0.00',rRemDez), 9)+
    // 35-Remuneração do 13º Adiantamento
    fValidaDados('N', FormatFloat('#########0.00',rRem13Adiant), 9)+
    // 36-Mês de Pagamento do 13º Adiantamento
    PoeZero(iMesRem13Adiant)+
    // 37-Remuneração do 13º Final
    fValidaDados('N', FormatFloat('#########0.00',rRem13Final), 9)+
    // 38-Mês de Pagamento do 13º Final
    PoeZero(iMesRem13Final)+
    // 39-Raça/Cor
    qryRAIS.FieldByName('COR').asString+
    // 40-Deficiente Físico
    // 1 - Sim
    // 2 - Não
    qryRAIS.FieldByName('FLGDEFICIENTE').asString+
    // 41-Indicador de Alvará Judicial para Trabalhar
    // 1 - Sim
    // 2 - Não
    IFF((iNumAnos < 16) and
        ((qryRAIS.FieldByName('TIPOCONTRATO').asString = 'G') or
         (qryRAIS.FieldByName('TIPOCONTRATO').asString = '3')),'1','2')+
    // 42-Aviso Prévio Indenizado
    fValidaDados('N', FormatFloat('#########0.00',rAvisoPrevioIndeniz), 9)+
    // 43-Sexo
    IFF(qryRAIS.FieldByName('SEXO').asString='M','1','2')+
    // 44-Espaços
    Replicate(' ',15)+
    // 45-Reservado para informação de uso exclusivo da empresa
    fValidaDados('*', qryRAIS.FieldByName('MATRICULA').asString, 12)+
    // Final de linha
    CR_LF);
end;

procedure TfrmParamRAISMagnetico.GerarRegistro9;
begin
  Write(fRAIS,
    // 01-Número do registro no arquivo
    fValidaDados('N', IntToStr(wNumRegistroAtual), 6)+
    // 02-Inscrição CGC/CNPJ/CEI do último estabelecimento do arquivo
    fValidaDados('N', qryResp.FieldByName('INSCRICAO').asString, 14)+
    // 03-Prefixo do último estabelecimento do arquivo
    '00'+
    // 04-Tipo do registro
    '9'+
    // 05-Número de registros Tipo 1
    fValidaDados('N', IntToStr(iNumEstab), 6)+
    // 06-Número de registros Tipo 2
    fValidaDados('N', IntToStr(iNumFunc), 6)+
    // 07-Final de linha
    Replicate(' ',271)+CR_LF);
end;

end.
