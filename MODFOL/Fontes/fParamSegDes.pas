// *****************************************************************************
// ***************************** REGISTRO DE ALTERAÇÕES ************************
// *****************************************************************************
// Autor(a)    :  Ádler Teodoro de Souza
// Data        :  19/02/2009
// Pendência   : SOL 109421 KINTANA 496332
// Descricao   :  Alteração de gravação de arquivos de log na raiz do disco C: .
//------------------------------------------------------------------------------
unit fParamSegDes;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs, MAHlpBtn,
  StdCtrls, Buttons, TB97Tlbr, TB97, ExtCtrls, Db, DBTables, Wwquery, wwdblook, Spin,
  checklst, IvDictio, IvMulti, IvEMulti, IniFiles, uGImp, ComCtrls, CMDateTimePicker,
  wwdbdatetimepicker, fSairAjuda;

type
  TfrmParamSegDes = class(TfrmSairAjuda)
    qryFunc: TwwQuery;
    qryEstab: TwwQuery;
    qryParamRH: TwwQuery;
    gbxEstab: TGroupBox;
    dblkcbEstab: TwwDBLookupCombo;
    gbxFunc: TGroupBox;
    chklstFunc: TCheckListBox;
    rbtnGerar: TBitBtn;
    ToolbarSep973: TToolbarSep97;
    btImprimir: TBitBtn;
    svdlgDialogo: TOpenDialog;
    GImp: TGImp;
    qrySegDes: TwwQuery;
    qryRubricas: TwwQuery;
    gbxSeleciona: TGroupBox;
    Paginas: TPageControl;
    tbshMesResc: TTabSheet;
    tbsh2MesesAnt: TTabSheet;
    chklstRubrica1: TCheckListBox;
    chklstRubrica2: TCheckListBox;
    gbDataRef: TGroupBox;
    dtedDataRef: TCMDateTimePicker;
    qryAgBanc: TwwQuery;
    rgAgBanc: TRadioGroup;
    bbtnSelTodosTipoFolha: TBitBtn;
    bbtnInvSelTipoFolha: TBitBtn;
    bbtnSelTodos: TBitBtn;
    bbtnInverteSel: TBitBtn;
    Label1: TLabel;
    edCodRubricas: TEdit;
    sbtnMarcarRub: TBitBtn;
    dblkcbAgencia: TwwDBLookupCombo;
    ToolbarSep971: TToolbarSep97;
    procedure FormCreate(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure btImprimirClick(Sender: TObject);
    procedure rbtnGerarClick(Sender: TObject);
    procedure qrySegDesBeforeOpen(DataSet: TDataSet);
    procedure qrySegDesAfterScroll(DataSet: TDataSet);
    procedure qrySegDesAfterOpen(DataSet: TDataSet);
    procedure dtedDataRefChange(Sender: TObject);
    procedure rgAgBancClick(Sender: TObject);
    procedure chklstFuncDrawItem(Control: TWinControl; Index: Integer;
      Rect: TRect; State: TOwnerDrawState);
    procedure bbtnSelTodosTipoFolhaClick(Sender: TObject);
    procedure bbtnInvSelTipoFolhaClick(Sender: TObject);
    procedure chklstFuncClickCheck(Sender: TObject);
    procedure dblkcbEstabChange(Sender: TObject);
    procedure bbtnSelTodosClick(Sender: TObject);
    procedure bbtnInverteSelClick(Sender: TObject);
    procedure sbtnMarcarRubClick(Sender: TObject);
    procedure chklstRubrica1ClickCheck(Sender: TObject);
    procedure PaginasChange(Sender: TObject);
  private
    ArqConfig: TIniFile;

    ListaRubrica, ListaFunc: TStringList;

    sCodEstab, LiRubrica1, LiRubrica2: string;

    procedure GerarDadosSegDes;
    procedure Imprimir (sDispositivo: string);
    procedure LeAlteracoes;
    procedure GravaAlteracoes;
    procedure MudaListaFuncionarios;
    procedure HabilitaBtOk;
    function  TrataDados(sDado:string; cTipo:char; wTamanho:word): string;
  public
    { Public declarations }
  end;

var
  frmParamSegDes: TfrmParamSegDes;

implementation

uses uSistema, uMensErro, uFuncoesUteis, fAguarde, UsoGeralRH;

{$R *.DFM}

procedure TfrmParamSegDes.LeAlteracoes;
begin
  // Recupera as últimas alterações das opções
  //ArqConfig   := TIniFile.Create('C:\CONFIG_FOLHAPAGTO.INI');
  ArqConfig   := TIniFile.Create(Sistema.RetornaCaminhoArquivos(Sistema.IdEmpresa)+'\CONFIG_FOLHAPAGTO.INI');//Ádler Teodoro de Souza SOL 109421 KINTANA 496332
  LiRubrica1 := ArqConfig.ReadString ('REL_SEGDESEMPREGO', 'Rubricas1', '');
  LiRubrica2 := ArqConfig.ReadString ('REL_SEGDESEMPREGO', 'Rubricas2', '');

  VerificaOpcoes(chklstRubrica1, ListaRubrica, LiRubrica1, ',');
  VerificaOpcoes(chklstRubrica2, ListaRubrica, LiRubrica2, ',');

  edCodRubricas.Text := LiRubrica1;  
end;

procedure TfrmParamSegDes.GravaAlteracoes;
var
  sGravaPadrao: string;
begin
  // Grava as últimas alterações da Opção de Rubricas do Mês da Rescisão
  CriaListaOpcoes (chklstRubrica1, ListaRubrica, sGravaPadrao, ',', false);
  ArqConfig.WriteString ('REL_SEGDESEMPREGO','Rubricas1',sGravaPadrao);

  // Grava as últimas alterações da Opção de Rubricas dos Meses anteriores
  CriaListaOpcoes (chklstRubrica2, ListaRubrica, sGravaPadrao, ',', false);
  ArqConfig.WriteString ('REL_SEGDESEMPREGO','Rubricas2',sGravaPadrao);
end;

procedure TfrmParamSegDes.FormCreate(Sender: TObject);
begin
  inherited;
  ListaFunc    := TStringList.Create;
  ListaRubrica := TStringList.Create;

  // Estabelecimento(s) habilitados para o usuário
  if (sUsuXfilial <> '') then
  begin
    if (Pos(',',sUsuXfilial) > 0) then
      qryEstab.SQL[5] := '  (PJ.IDPESSOA IN ' +sUsuXfilial+ ') AND'
    else
      qryEstab.SQL[5] := '  (PJ.IDPESSOA  = ' +sUsuXfilial+ ') AND';
  end;

  qryEstab.ParamByName('EMPRESA').asInteger := Sistema.IdEmpresa;
  qryEstab.Open;
  qryParamRH.Open;
  qryAgBanc.Open;

  // Preenche ChkList das Rubricas
  chklstRubrica1.Items.Clear;
  chklstRubrica2.Items.Clear;
  with (qryRubricas) do
  begin
    ParamByName('IDEMPRESA').asInteger := Sistema.IdEmpresa;
    Open;
    while not(EOF) do
    begin
      ListaRubrica.Add(FieldByName('CODPROVDESC').asString);
      chklstRubrica1.Items.Add(FieldByName('DESCRPROVDESC').asString);
      chklstRubrica2.Items.Add(FieldByName('DESCRPROVDESC').asString);
      Next;
    end;
  end;

  // Inicializa variáveis e valores dos objetos
  dtedDataRef.Date   := qryParamRH.FieldByName('NORMALINI').asDateTime;
  Paginas.ActivePage := tbshMesResc;

  // Carrega alterações nas opções feitas anteriormente
  LeAlteracoes;
end;

procedure TfrmParamSegDes.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  inherited;
  GravaAlteracoes;

  ListaRubrica.Free;
  ListaFunc.Free;

  qryFunc.Close;
  qryFunc.UnPrepare;
  qryEstab.Close;
  qryParamRH.Close;
  qryAgBanc.Close;
  qryRubricas.Close;
  qrySegDes.Close;
end;

// Cria lista contendo os códigos dos funcionários
procedure TfrmParamSegDes.MudaListaFuncionarios;
begin
  qryFunc.Close;
  ListaFunc.Clear;
  chklstFunc.Items.Clear;

  if (dblkcbEstab.Text <> '') then
  begin
    qryFunc.ParamByName('ESTAB').asString   := qryEstab.FieldByName('CODIGO').asString;
    qryFunc.ParamByName('DATAREF').asString := RetornaAnoMes(dtedDataRef.Date);
    qryFunc.Open;

    while not(qryFunc.EOF) do
    begin
      ListaFunc.Add(QryFunc.FieldByName('IDPESSOA').asString);
      chklstFunc.Items.Add(qryFunc.FieldByName('EMPREGADO').asString);
      qryFunc.Next;
    end;
  end;

  HabilitaBtOk;
end;

procedure TfrmParamSegDes.HabilitaBtOk;
var
  c: integer;
  bSelFunc, bSelRub1, bSelRub2: boolean;
begin
  bSelFunc := false;
  for c:=0 to chklstFunc.Items.Count-1 do
    if (chklstFunc.Checked[c]) then
    begin
      bSelFunc := true;
      break;
    end;

  // Verifica se alguma rubrica foi selecionada para o Mês da Rescisão
  bSelRub1 := false;
  for c:=0 to chklstRubrica1.Items.Count-1 do
    if (chklstRubrica1.Checked[c]) then
    begin
      bSelRub1 := true;
      break;
    end;

  // Verifica se alguma rubrica foi selecionada para os Dois Meses Anteriores à Rescisão
  bSelRub2 := false;
  for c:=0 to chklstRubrica2.Items.Count-1 do
    if (chklstRubrica2.Checked[c]) then
    begin
      bSelRub2 := true;
      break;
    end;

  rbtnGerar.Enabled := (bSelFunc) and (bSelRub1) and (bSelRub2) and
    (Trim(dtedDataRef.Text) <> '');
  btImprimir.Enabled := rbtnGerar.Enabled;
end;

procedure TfrmParamSegDes.chklstFuncDrawItem(Control: TWinControl; Index: Integer; Rect: TRect;
  State: TOwnerDrawState);
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
    TextOut(Rect.Left+1, Rect.Top+1, TCheckListBox(Control).Items[Index]);
  end;
end;

procedure TfrmParamSegDes.dtedDataRefChange(Sender: TObject);
begin
  inherited;
  MudaListaFuncionarios;
end;

procedure TfrmParamSegDes.rgAgBancClick(Sender: TObject);
begin
  inherited;
  dblkcbAgencia.Visible := (rgAgBanc.ItemIndex = 1);
end;

procedure TfrmParamSegDes.bbtnSelTodosTipoFolhaClick(Sender: TObject);
var
  c: integer;
begin
  // Seleciona Todos os Funcionários
  for c:=0 to chklstFunc.Items.Count -1 do
    chklstFunc.Checked[c] := true;

  chklstFunc.Repaint;
  HabilitaBtOk;
end;

procedure TfrmParamSegDes.bbtnInvSelTipoFolhaClick(Sender: TObject);
var
  c: integer;
begin
  // Seleciona Todos os Funcionários
  for c:=0 to chklstFunc.Items.Count -1 do
    chklstFunc.Checked[c] := not(chklstFunc.Checked[c]);

  chklstFunc.Repaint;
  HabilitaBtOk;
end;

procedure TfrmParamSegDes.chklstFuncClickCheck(Sender: TObject);
begin
  HabilitaBtOk;
  InvalidateItemListBox(TCustomListBox(Sender),TCustomListBox(Sender).ItemIndex);
end;

procedure TfrmParamSegDes.dblkcbEstabChange(Sender: TObject);
begin
  inherited;
  dblkcbEstab.Text := Trim(dblkcbEstab.Text);

  if (dblkcbEstab.Text <> sCodEstab) then
  begin
    MudaListaFuncionarios;

    sCodEstab := dblkcbEstab.Text;

    chklstFunc.Repaint;
  end;
end;

procedure TfrmParamSegDes.PaginasChange(Sender: TObject);
begin
  inherited;
  if (Paginas.ActivePage = tbshMesResc) then
    edCodRubricas.Text := LiRubrica1
  else
    edCodRubricas.Text := LiRubrica2;
end;

procedure TfrmParamSegDes.bbtnSelTodosClick(Sender: TObject);
var
  c: integer;
begin
  inherited;
  if (Paginas.ActivePage = tbshMesResc) then
  begin
    for c:=0 to chklstRubrica1.Items.Count-1 do
      chklstRubrica1.Checked[c] := true;

    CriaListaOpcoes (chklstRubrica1, ListaRubrica, LiRubrica1, ',', false);
    edCodRubricas.Text := LiRubrica1;
    HabilitaBtOk;
    chklstRubrica1.Repaint;
  end
  else
  begin
    for c:=0 to chklstRubrica2.Items.Count-1 do
      chklstRubrica2.Checked[c] := true;

    CriaListaOpcoes (chklstRubrica2, ListaRubrica, LiRubrica2, ',', false);
    edCodRubricas.Text := LiRubrica2;
    HabilitaBtOk;
    chklstRubrica2.Repaint;
  end;
end;

procedure TfrmParamSegDes.bbtnInverteSelClick(Sender: TObject);
var
  c: integer;
begin
  inherited;
  if (Paginas.ActivePage = tbshMesResc) then
  begin
    for c:=0 to chklstRubrica1.Items.Count-1 do
      chklstRubrica1.Checked[c] := not(chklstRubrica1.Checked[c]);

    CriaListaOpcoes (chklstRubrica1, ListaRubrica, LiRubrica1, ',', false);
    edCodRubricas.Text := LiRubrica1;
    HabilitaBtOk;
    chklstRubrica1.Repaint;
  end
  else
  begin
    for c:=0 to chklstRubrica2.Items.Count-1 do
      chklstRubrica2.Checked[c] := not(chklstRubrica2.Checked[c]);

    CriaListaOpcoes (chklstRubrica2, ListaRubrica, LiRubrica2, ',', false);
    edCodRubricas.Text := LiRubrica2;
    HabilitaBtOk;
    chklstRubrica2.Repaint;
  end;
end;

procedure TfrmParamSegDes.sbtnMarcarRubClick(Sender: TObject);
begin
  inherited;
  edCodRubricas.Text := Trim(edCodRubricas.Text);

  if (Paginas.ActivePage = tbshMesResc) then
  begin
    VerificaOpcoes (chklstRubrica1, ListaRubrica, edCodRubricas.Text, ',');
    LiRubrica1 := edCodRubricas.Text;
    HabilitaBtOk;
    chklstRubrica1.Repaint;
  end
  else
  begin
    VerificaOpcoes (chklstRubrica2, ListaRubrica, edCodRubricas.Text, ',');
    LiRubrica2 := edCodRubricas.Text;
    HabilitaBtOk;
    chklstRubrica2.Repaint;
  end;
end;

procedure TfrmParamSegDes.chklstRubrica1ClickCheck(Sender: TObject);
begin
  HabilitaBtOk;

  if (Paginas.ActivePage = tbshMesResc) then
  begin
    CriaListaOpcoes (chklstRubrica1, ListaRubrica, LiRubrica1, ',', false);
    edCodRubricas.Text := LiRubrica1;
  end
  else
  begin
    CriaListaOpcoes (chklstRubrica2, ListaRubrica, LiRubrica2, ',', false);
    edCodRubricas.Text := LiRubrica2;
  end;

  InvalidateItemListBox(TCustomListBox(Sender),TCustomListBox(Sender).ItemIndex);
end;

procedure TfrmParamSegDes.btImprimirClick(Sender: TObject);
begin
  inherited;
  // Monta e abre a query
  GerarDadosSegDes;

  if (qrySegDes.IsEmpty) then
    ShowMessage('Não há dados a serem impressos !')
  else
    Imprimir('Imp');

  frmAguarde.Apaga;
end;

procedure TfrmParamSegDes.rbtnGerarClick(Sender: TObject);
begin
  inherited;
  // Verifica o caminho
  if not(SvDlgDialogo.Execute) then
    exit;

  // Verifica se o arquivo existe na pasta escolhida
  if (FileExists(svdlgDialogo.FileName)) then
    if (MsgDlg ('O arquivo já existe na pasta especificada. Você deseja SOBRESCREVÊ-LO ?','Aviso',mtConfirmation,[mbOK,mbCancel],0) = mrCancel) then
      exit;

  // Monta e abre a query
  GerarDadosSegDes;

  if (qrySegDes.IsEmpty) then
    ShowMessage('Não há dados a serem impressos !')
  else
    Imprimir('Arq');

  frmAguarde.Apaga;
end;

procedure TfrmParamSegDes.qrySegDesBeforeOpen(DataSet: TDataSet);
begin
  inherited;
  frmAguarde.Mostra ('Preparando dados...');
  frmAguarde.Pos := 0;
end;

procedure TfrmParamSegDes.qrySegDesAfterOpen(DataSet: TDataSet);
begin
  inherited;
  frmAguarde.Mostra ('Imprimindo dados...');
  frmAguarde.Max := qrySegDes.RecordCount;
  frmAguarde.Min := 0;
  frmAguarde.UpDate;
end;

procedure TfrmParamSegDes.qrySegDesAfterScroll(DataSet: TDataSet);
begin
  inherited;
  frmAguarde.Pos := frmAguarde.Pos + 1;
  frmAguarde.Update;
end;

procedure TfrmParamSegDes.GerarDadosSegDes;
var
  c, K: integer;
  sQuery1, sQuery2, sFunc, sAnoMes: string;
begin
  inherited;
  sFunc := '';

  // Pego o código da(s) rubrica(s) indicada(s)
  K := 1;
  sQuery1 := '          (CODPROVDESC IN (';
  for c:=0 to chklstRubrica1.Items.Count-1 do
    if (chklstRubrica1.Checked[c]) then
    begin
      if (K > 1) then
        sQuery1 := sQuery1 +',';
      sQuery1 := sQuery1 + QuotedStr(ListaRubrica[c]);
      Inc(K);
    end;
  sQuery1 := sQuery1 +')) AND';

  K := 1;
  sQuery2 := '          (CODPROVDESC IN (';
  for c:=0 to chklstRubrica2.Items.Count-1 do
    if (chklstRubrica2.Checked[c]) then
    begin
      if (K > 1) then
        sQuery2 := sQuery2 +',';
      sQuery2 := sQuery2 + QuotedStr(ListaRubrica[c]);
      Inc(K);
    end;
  sQuery2 := sQuery2 +')) AND';

  // Verifica se algum estabelecimento foi escolhido
  if (Trim(dblkcbEstab.Text) <> '') then
  begin
    // Verifica se algum funcionário foi escolhido
    for c:=0 to chklstFunc.Items.Count - 1 do
      if (chklstFunc.Checked[c]) then
        if (sFunc = '') then
          sFunc := ListaFunc.Strings[c]
        else
          sFunc := sFunc + ',' + ListaFunc.Strings[c];
  end;

  // Data de Competência
  sAnoMes := RetornaAnoMes(dtedDataRef.Date);

  // Monta a Query
  qrySegDes.Close;
  with (qrySegDes.SQL) do
  begin
    Clear;
    Add('SELECT DISTINCT');
    Add('  PJ.RAZAOSOCIAL AS ESTAB,');
    Add('  RTRIM(PF.NOME) AS EMPREGADO,');
    Add('  RTRIM(E.LOGRADOURO) || DECODE(E.NUMERO,NULL,'''','', ''|| E.NUMERO) ||');
    Add('    DECODE(E.BAIRRO,NULL,'''','', ''|| RTRIM(E.BAIRRO)) AS ENDERECO,');
    Add('  RTRIM(E.COMPLEMENTO) AS COMPLEMENTO,');
    Add('  RTRIM(SUBSTR(E.CEP,1,5)) AS CEP1, RTRIM(SUBSTR(E.CEP,6,3)) AS CEP2,');
    Add('  ES.CODESTADO AS UF,');
    Add('  CIDADES.NOME AS CIDADE,');
    Add('  RTRIM(TELEFONE.NUMERO) AS TELEFONE,');
    Add('  RTRIM(PEFIS.NOMEMAE)   AS MAE,');
    Add('  DECODE(CGC.NUM,NULL,''2'',''1'')     AS TIPINSCEMP,');
    Add('  DECODE(CGC.NUM,NULL,CEI.NUM,CGC.NUM) AS INSCEMP,');
    Add('  FP.IDITEMCNAE AS CNAE,');
    Add('  PIS.NUM       AS PIS,');
    Add('  RTRIM(CTPS.NUM) AS CTPS,');
    Add('  RTRIM(CTPS.UF)  AS CTPS_UF,');
    Add('  CBO.IDCBO       AS CBO,');
    Add('  RTRIM(C.TITULO) AS OCUPACAO,');
    Add('  TO_CHAR(F.DATAADMISSAO,''DDMMYY'')     AS ADMISSAO,');
    Add('  TO_CHAR(F.DATADESLIGAMENTO,''DDMMYY'') AS DEMISSAO,');
    Add('  DECODE(PEFIS.SEXO,''M'',1,''F'',2) AS SEXO,');
    Add('  RTRIM(GI.IDGRINSTR)                AS GRAUINSTRU,');
    Add('  TO_CHAR(PEFIS.DATANASC,''DDMMYY'') AS NASCIMENTO,');
    Add('  ROUND(HT.JORNADAMENSAL/5) AS HORASEMANA,');
    Add('  VAL_ANTEPENULT_SAL.MES   AS MES_ANTEPENULT_SALARIO,');
    Add('  VAL_ANTEPENULT_SAL.VALOR AS ANTEPENULT_SALARIO,');
    Add('  VAL_PENULT_SAL.MES       AS MES_PENULT_SALARIO,');
    Add('  VAL_PENULT_SAL.VALOR     AS PENULT_SALARIO,');
    Add('  VAL_ULT_SAL.MES          AS MES_ULT_SALARIO,');
    Add('  VAL_ULT_SAL.VALOR        AS ULT_SALARIO,');
    Add('  LEAST(TRUNC(((F.DATADESLIGAMENTO - F.DATAADMISSAO)*12)/365.25),36) AS QUANT_TRAB_36MESES,');
    Add('  DECODE(RECEB_SAL_6.QTDEMES,6,1,2) AS RECEB_SAL_6_MESES,');
    Add('  (''104'') AS N_BANCO,');
    // Se imprime Agência  do Funcionário ...
    case (rgAgBanc.ItemIndex) of
      0 : // Agência do FGTS
      begin
        Add('  SUBSTR(AG.NUMAGENCIA,1,4) ||'' ''|| SUBSTR(AG.NUMAGENCIA,5,1) AS N_AGENCIA,');
        Add('  RTRIM(AGENC.NOME) AS AGENCIA,');
      end;
      1 : // Agência selecionada
      begin
        Add('  ('+Trim(QuotedStr(Copy(qryAgBanc.FieldByName('NUMAGENCIA').asString,1,4)+' '+
                                  Copy(qryAgBanc.FieldByName('NUMAGENCIA').asString,6,1)))+
             ') AS N_AGENCIA,');
        Add('  ('+QuotedStr(qryAgBanc.FieldByName('AGENCIA').asString)+ ') AS AGENCIA,');
      end;
      2 : // Não imprime Agência
      begin
        Add('  ('' '') AS N_AGENCIA,');
        Add('  ('' '') AS AGENCIA,');
      end;
    end;
    Add('  DECODE(F.DATADESLIGAMENTO,F.DATAAVISO,1,2) AS AVISOPREVIO');
    Add('FROM');
    // Se imprime Agência do FGTS do Funcionário ...
    if (rgAgBanc.ItemIndex = 0) then
    begin
      Add('  PESSOA PJ, PESSOA PF, PESSOA AGENC, PESSOAFISICA PEFIS, ENDPESS E,');
      Add('  FUNCIONARIO F, FILIALPESSOA FP, CARGO C, AGENCIABANCARIA AG,');
    end
    else
    begin
      Add('  PESSOA PJ, PESSOA PF, PESSOAFISICA PEFIS, ENDPESS E, FUNCIONARIO F,');
      Add('  FILIALPESSOA FP, CARGO C,');
    end;
    Add('  BANCO B, CIDADES, ESTADO ES, CBO, GRINSTR GI, HORATRAB HT,');
    // -------------------------------------------------------------------------------- //
    // PIS do Funcionário
    Add('  (SELECT F.IDPESSOA, TDP.MASCARA, DP.NUMDOCUMENTO AS NUM');
    Add('   FROM   DOCPESSOA DP, FUNCIONARIO F, TIPODOCPESSOA TDP, TIPODOCOFICIAL TDO');
    Add('   WHERE (TDO.SIGLADOCUMENTO = ''PIS/PASEP:'') AND');
    Add('         (TDO.IDDOCUMENTO    = DP.IDDOCUMENTO) AND');
    Add('         (TDP.IDDOCUMENTO    = DP.IDDOCUMENTO) AND');
    Add('         (DP.IDPESSOA        = F.IDPESSOA)) PIS,');
    // -------------------------------------------------------------------------------- //
    // CTPS do Funcionário
    Add('  (SELECT F.IDPESSOA, DP.NUMDOCUMENTO AS NUM, ES.CODESTADO AS UF');
    Add('   FROM   DOCPESSOA DP, FUNCIONARIO F, TIPODOCOFICIAL TDO, TIPODOCPESSOA TDP,');
    Add('          ESTADO ES, PAIS PA');
    Add('   WHERE (TDO.SIGLADOCUMENTO = ''CTPS:'')      AND');
    Add('         (TDO.IDDOCUMENTO    = DP.IDDOCUMENTO) AND');
    Add('         (TDP.IDDOCUMENTO    = DP.IDDOCUMENTO) AND');
    Add('         (F.IDPESSOA         = DP.IDPESSOA)    AND');
    Add('         (DP.IDPAIS          = PA.IDPAIS)      AND');
    Add('         (ES.IDPAIS          = PA.IDPAIS)      AND');
    Add('         (DP.IDESTADO        = ES.IDESTADO)) CTPS,');
    // -------------------------------------------------------------------------------- //
    // CEI do Estabelecimento
    Add('  (SELECT FP.IDFILIALPESSOA, RTRIM(DO.NUMDOCUMENTO) AS NUM');
    Add('   FROM   DOCPESSOA DO, FILIALPESSOA FP, TIPODOCOFICIAL TDO');
    Add('   WHERE (TDO.SIGLADOCUMENTO = ''CEI:'')       AND');
    Add('         (TDO.IDDOCUMENTO    = DO.IDDOCUMENTO) AND');
    Add('         (FP.IDFILIALPESSOA  = DO.IDPESSOA)) CEI,');
    // -------------------------------------------------------------------------------- //
    // CGC do Estabelecimento
    Add('  (SELECT FP.IDFILIALPESSOA, RTRIM(DO.NUMDOCUMENTO) AS NUM');
    Add('   FROM   DOCPESSOA DO, FILIALPESSOA FP, TIPODOCOFICIAL TDO');
    Add('   WHERE  ((TDO.SIGLADOCUMENTO = ''CNPJ:'')       OR');
    Add('           (TDO.SIGLADOCUMENTO = ''CGC:''))      AND');
    Add('          (TDO.IDDOCUMENTO     = DO.IDDOCUMENTO) AND');
    Add('          (FP.IDFILIALPESSOA   = DO.IDPESSOA)) CGC,');
    // -------------------------------------------------------------------------------- //
    // Telefone a Empresa
    Add('  (SELECT TE.IDENDERECO, TE.NUMERO');
    Add('   FROM   TELENDPESS TE,');
    Add('     (SELECT MIN(IDTELEFONE) AS IDTELEFONE, IDENDERECO');
    Add('      FROM   TELENDPESS');
    Add('      GROUP BY IDENDERECO) END');
    Add('      WHERE (END.IDTELEFONE = TE.IDTELEFONE)) TELEFONE,');
    // -------------------------------------------------------------------------------- //
    // Último salário
    Add('  (SELECT IDPESSOA, SUM(VALORPROVENTO) AS VALOR, SUBSTR(MES,6,2) AS MES');
    Add('   FROM   HISTRUBSAL');
    Add('   WHERE');

    if (sFunc <> '') then
      Add('          (IDPESSOA    IN ('+sFunc+')) AND');

    if (sQuery1 <> '') then
      Add (sQuery1);

    Add('          (MES          = '+QuotedStr(sAnoMes)+')');
    Add('   GROUP BY IDPESSOA, MES) VAL_ULT_SAL,');
    // -------------------------------------------------------------------------------- //
    // Penúltimo salário
    Add('  (SELECT IDPESSOA, SUM(VALORPROVENTO) AS VALOR, SUBSTR(MES,6,2) AS MES');
    Add('   FROM   HISTRUBSAL');
    Add('   WHERE');

    if (sFunc <> '') then
      Add('          (IDPESSOA    IN ('+sFunc+')) AND');

    if (sQuery2 <> '') then
      Add(sQuery2);

    Add('          (MES          = '+QuotedStr(IncDataAM(sAnoMes,-1))+')');
    Add('   GROUP BY IDPESSOA, MES) VAL_PENULT_SAL,');
    // -------------------------------------------------------------------------------- //
    // Antepenúltimo salário
    Add('  (SELECT IDPESSOA, SUM(VALORPROVENTO) AS VALOR, SUBSTR(MES,6,2) AS MES');
    Add('   FROM   HISTRUBSAL');
    Add('   WHERE');

    if (sFunc <> '') then
      Add('          (IDPESSOA    IN ('+sFunc+')) AND');

    if (sQuery2 <> '') then
      Add(sQuery2);

    Add('          (MES          = '+QuotedStr(IncDataAM(sAnoMes,-2))+')');
    Add('   GROUP BY IDPESSOA, MES) VAL_ANTEPENULT_SAL,');
    // -------------------------------------------------------------------------------- //
    // Se recebeu salário nos últimos 6 meses
    Add('  (SELECT IDPESSOA, COUNT(MES) AS QTDEMES');
    Add('   FROM   HISTRUBSAL');
    Add('   WHERE');

    if (sFunc <> '') then
      Add('           (IDPESSOA   IN ('+sFunc+')) AND');

    if (sQuery2 <> '') then
      Add(sQuery2);

    Add('          ((MES        >= '+QuotedStr(IncDataAM(sAnoMes,-7))+') OR');
    Add('           (MES        <= '+QuotedStr(IncDataAM(sAnoMes,-1))+'))');
    Add('   GROUP BY IDPESSOA) RECEB_SAL_6');
    // -------------------------------------------------------------------------------- //
    Add('WHERE');
    Add('  (FP.IDFILIALPESSOA     = '+QryEstab.FieldByName('CODIGO').asString+') AND');

    if (sFunc <> '') then
      Add('  (F.IDPESSOA     IN ('+sFunc+'))         AND');

    Add('  (FP.IDFILIALPESSOA  = PJ.IDPESSOA)         AND');
    Add('  (FP.IDFILIALPESSOA  = CGC.IDFILIALPESSOA)  AND');
    Add('  (F.IDESTAB          = FP.IDFILIALPESSOA)   AND');
    Add('  (F.IDPESSOA         = PF.IDPESSOA)         AND');
    Add('  (F.IDPESSOA         = PEFIS.IDPESSOA)      AND');
    Add('  (F.IDCARGO          = C.IDCARGO)           AND');
    Add('  (F.IDPESSOA         = CTPS.IDPESSOA)       AND');
    Add('  (F.IDPESSOA         = PIS.IDPESSOA)        AND');
    Add('  (F.IDHORARIO        = HT.IDHORARIO)        AND');

    // Se imprime Agência do FGTS do Funcionário ...
    if (rgAgBanc.ItemIndex = 0) then
    begin
      Add ('  (F.IDAGENCIAFGTS    = AG.IDPESSOA)            AND');
      Add ('  (AG.IDBANCO         = B.IDPESSOA)             AND');
      Add ('  (AG.IDPESSOA        = AGENC.IDPESSOA)         AND');
    end;

    Add ('  (E.IDENDERECO       = PF.IDENDRESIDENCIAL) AND');
    Add ('  (E.IDCIDADES        = CIDADES.IDCIDADES)   AND');
    Add ('  (CIDADES.IDESTADO   = ES.IDESTADO)         AND');
    Add ('  (F.IDCARGO          = C.IDCARGO)           AND');
    Add ('  (C.CBO              = CBO.IDCBO)           AND');
    Add ('  (PEFIS.IDGRINSTR    = GI.IDGRINSTR)        AND');
    Add ('  (F.IDPESSOA         = VAL_ULT_SAL.IDPESSOA)        AND');
    Add ('  (F.IDPESSOA         = VAL_PENULT_SAL.IDPESSOA)     AND');
    Add ('  (F.IDPESSOA         = VAL_ANTEPENULT_SAL.IDPESSOA) AND');
    Add ('  (F.IDPESSOA         = RECEB_SAL_6.IDPESSOA)        AND');
    Add ('  (E.IDENDERECO       = TELEFONE.IDENDERECO(+))      AND');
    Add ('  (FP.IDFILIALPESSOA  = CEI.IDFILIALPESSOA(+))       AND');
    Add ('  (FP.IDFILIALPESSOA  = CGC.IDFILIALPESSOA(+))');
    Add ('ORDER BY EMPREGADO');
    //SaveToFile ('c:\qry.txt');
    SaveToFile (Sistema.RetornaCaminhoArquivos(Sistema.IdEmpresa)+'\qry.txt');//Ádler Teodoro de Souza SOL 109421 KINTANA 496332
  end;
  qrySegDes.Open;
end;

function TfrmParamSegDes.TrataDados(sDado:string; cTipo:char; wTamanho:word): string;
var
  c, wMax: word;
  sTempFinal, sTemp: string;
begin
  if (Trim(sDado) <> '') then
  begin
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
      'A' : // Campos Alfanuméricos
      begin
        try
          sDado := UpperCase(NormalizaString(ConverteCar(sDado)));

          for c:=1 to Length(sDado) do
            sTemp := sTemp+sDado[c];

          sTemp := Alinha (Copy(sTemp,1,wMax), wTamanho, 'E', ' ');

          sTempFinal := '';
          for c:=1 to Length(sTemp) do
            if (sTemp[c] = ' ') then
              sTempFinal := sTempFinal + ' '
            else
              sTempFinal := sTempFinal + sTemp[c] + ' ';
        except
          sTempFinal := Replicate(' ', wTamanho);
        end;
      end;
      'N' : // Campos Numéricos
      begin
        try
          for c:=1 to Length(sDado) do
            if (sDado[c] in ['0'..'9']) then
              sTemp := sTemp+sDado[c];

          sTemp := Alinha(Copy(sTemp,1,wMax), wTamanho, 'D', ' ');

          sTempFinal := '';
          for c:=1 to Length(sTemp) do
            if (sTemp[c] = ' ') then
              sTempFinal := sTempFinal + '  '
            else
              sTempFinal := sTempFinal + sTemp[c] + ' ';
        except
          sTempFinal := Replicate(' ', wTamanho);
        end;
      end;
    end;
  end
  else // Se o Dado for em branco preenche com espaços
  begin
    sTempFinal := '';
    for c:=1 to wTamanho do
      sTempFinal := sTempFinal + '  ';
  end;
  Result := sTempFinal;
end;

procedure TfrmParamSegDes.Imprimir (sDispositivo: string);
var
  c: byte;
  oArquivo: TextFile;
begin
  if (sDispositivo = 'Imp') then // Impressora
  begin
    if (GImp.Inicializar) then
    begin
      GImp.EjetarPagina           := false;
      GImp.SaltodeLinhaCondensado := false;
      GImp.TipoFonte              := TfNormal;
      GImp.Condensado             := false;
      GImp.Sublinhado             := false;
      try
        // Imprimo cada linha Funcionário
        while not(qrySegDes.EOF) do
        begin
          // Espaço do Cabeçalho
          for c:=1 to 9 do
            GImp.ImprimirTexto(' ');

          // (01) - Nome do Funcionário
          GImp.ImprimirTexto(Replicate(' ',8)+
            TrataDados(qrySegDes.FieldByName('EMPREGADO').asString,'A',40));

          // (02) - Endereço do Funcionário
          GImp.ImprimirTexto(' ');
          GImp.ImprimirTexto(' ');
          GImp.ImprimirTexto(Replicate(' ',8)+
            TrataDados(qrySegDes.FieldByName('ENDERECO').asString,'A',40));

          // (03) - Cep, UF e Telefone
          GImp.ImprimirTexto(' ');
          GImp.ImprimirTexto(' ');
          GImp.ImprimirTexto(Replicate(' ',8)+
            TrataDados(qrySegDes.FieldByName('COMPLEMENTO').asString,'A',16)+'  '+
            TrataDados(qrySegDes.FieldByName('CEP1').asString       ,'A',06)+' '+
            TrataDados(qrySegDes.FieldByName('CEP2').asString       ,'A',03)+'  '+
            TrataDados(qrySegDes.FieldByName('UF').asString         ,'A',03)+' '+
            TrataDados(qrySegDes.FieldByName('TELEFONE').asString   ,'A',10));

          // (04) - Nome da Mãe do Funcionário
          GImp.ImprimirTexto(' ');
          GImp.ImprimirTexto(' ');
          GImp.ImprimirTexto(Replicate(' ',8)+
            TrataDados(qrySegDes.FieldByName('MAE').asString,'A',40));

          // (05) - CGC/CEI, Nº do CGC/CEI e Atividade Econômica
          GImp.ImprimirTexto(' ');
          GImp.ImprimirTexto(' ');
          GImp.ImprimirTexto(Replicate(' ',16)+
            TrataDados(qrySegDes.FieldByName('TIPINSCEMP').asString,'A',01)+Replicate(' ',4)+
            TrataDados(qrySegDes.FieldByName('INSCEMP').asString   ,'A',14)+Replicate(' ',2)+
            TrataDados(qrySegDes.FieldByName('CNAE').asString      ,'A',5));

          // (06) - PIS/PASEP/NIT e CTPS
          GImp.ImprimirTexto(' ');
          GImp.ImprimirTexto(' ');
          GImp.ImprimirTexto(Replicate(' ',8)+
            TrataDados(qrySegDes.FieldByName('PIS').asString    ,'A',11)+'  '+
            TrataDados(qrySegDes.FieldByName('CTPS').asString   ,'N',07)+
            TrataDados(UltimosCaracteres(qrySegDes.FieldByName('CTPS').asString,3),'N',03)+
            TrataDados(qrySegDes.FieldByName('CTPS_UF').asString,'A',03));

          // (07) - CBO e Ocupação
          GImp.ImprimirTexto(' ');
          GImp.ImprimirTexto(' ');
          GImp.ImprimirTexto(Replicate(' ',8)+
            TrataDados(qrySegDes.FieldByName('CBO').asString,'A',5)+' '+
            Alinha(Copy(qrySegDes.FieldByName('OCUPACAO').asString,1,35),35,'E',' '));

          // (08) - Data Admissão, Data Demissão, Sexo, Grau de Instrução, Data de Nascimento e Horas Trab. por Semana
          GImp.ImprimirTexto(' ');
          GImp.ImprimirTexto(' ');
          GImp.ImprimirTexto(' ');
          GImp.ImprimirTexto(' ');
          GImp.ImprimirTexto(Replicate(' ',8)+
            TrataDados(qrySegDes.FieldByName('ADMISSAO').asString  ,'A',6)+Replicate(' ',04)+
            TrataDados(qrySegDes.FieldByName('DEMISSAO').asString  ,'A',6)+Replicate(' ',12)+
            TrataDados(qrySegDes.FieldByName('SEXO').asString      ,'A',1)+Replicate(' ',08)+
            TrataDados(qrySegDes.FieldByName('GRAUINSTRU').asString,'A',1)+Replicate(' ',04)+
            TrataDados(qrySegDes.FieldByName('NASCIMENTO').asString,'A',8)+Replicate(' ',02)+
            TrataDados(qrySegDes.FieldByName('HORASEMANA').asString,'A',2));

          // (09) - (Mês + Antepenúltimo Sal.), (Mês + Penúltimo Sal.) e (Mês + Último Sal.)
          GImp.ImprimirTexto(' ');
          GImp.ImprimirTexto(' ');
          GImp.ImprimirTexto(Replicate(' ',8)+
            TrataDados(qrySegDes.FieldByName('MES_ANTEPENULT_SALARIO').asString,'A',02)+' '+
            TrataDados(FormatFloat('#########0.00',
                       qrySegDes.FieldByName('ANTEPENULT_SALARIO').asFloat)    ,'N',10)+' '+
            TrataDados(qrySegDes.FieldByName('MES_PENULT_SALARIO').asString    ,'A',02)+' '+
            TrataDados(FormatFloat('#########0.00',
                       qrySegDes.FieldByName('PENULT_SALARIO').asFloat)        ,'N',10)+' '+
            TrataDados(qrySegDes.FieldByName('MES_ULT_SALARIO').asString       ,'A',02)+' '+
            TrataDados(FormatFloat('#########0.00',
                       qrySegDes.FieldByName('ULT_SALARIO').asFloat)           ,'N',10));

          // (10) - Soma Salários, Nº Banco, Nº Agência e Nome do Banco
          GImp.ImprimirTexto(' ');
          GImp.ImprimirTexto(' ');
          GImp.ImprimirTexto(Replicate(' ',8)+
            TrataDados(FormatFloat('#########0.00',
              qrySegDes.FieldByName('ULT_SALARIO').asFloat+
              qrySegDes.FieldByName('PENULT_SALARIO').asFloat+
              qrySegDes.FieldByName('ANTEPENULT_SALARIO').asFloat),'N',11)+'    '+
            TrataDados(qrySegDes.FieldByName('N_BANCO').asString  ,'A',03)+
            TrataDados(Trim(qrySegDes.FieldByName('N_AGENCIA').asString),'A',06)+'   '+
            Alinha(qrySegDes.FieldByName('AGENCIA').asString,20,'E',' '));

          // (11) - Qtd Meses Trab nos últ. 36 mese, Sal. Últ. 6 meses ?, Aviso Prévio Indenizado
          GImp.ImprimirTexto(' ');
          GImp.ImprimirTexto(' ');
          GImp.ImprimirTexto(Replicate(' ',34)+TrataDados(
            IFF ((qrySegDes.FieldByName('AVISOPREVIO').asString='1') and
                 (qrySegDes.FieldByName('QUANT_TRAB_36MESES').asInteger < 36),
                 IntToStr(qrySegDes.FieldByName('QUANT_TRAB_36MESES').asInteger+1),
                 PoeZero(qrySegDes.FieldByName('QUANT_TRAB_36MESES').asInteger)),'A',2)+Replicate(' ',23)+
            '1'+Replicate(' ',24)+
//            TrataDados(qrySegDes.FieldByName('RECEB_SAL_6_MESES').asString ,'A',1)+Replicate(' ',23)+
            TrataDados(qrySegDes.FieldByName('AVISOPREVIO').asString       ,'A',1));

          // Imprimo o final da página
          for c:=1 to 20 do
            GImp.ImprimirTexto(' ');
          GImp.ImprimirTexto(Replicate(' ',8)+
            TrataDados(qrySegDes.FieldByName('PIS').asString,'A',11));
          GImp.ImprimirTexto(' ');
          GImp.ImprimirTexto(' ');
          GImp.ImprimirTexto(Replicate(' ',8)+
            TrataDados(qrySegDes.FieldByName('EMPREGADO').asString,'A',40));
          GImp.ImprimirTexto(' ');
          GImp.ImprimirTexto(Replicate(' ',20)+
            Alinha(qrySegDes.FieldByName('ESTAB').asString,40,'E',' '));
          for c:=1 to 4 do
            GImp.ImprimirTexto(' ');
          GImp.ImprimirTexto(Replicate(' ',8)+
            Alinha(qrySegDes.FieldByName('CIDADE').asString,17,'E',' ')+' '+
            Copy(dtedDataRef.Text,1,2)+'  '+Copy(dtedDataRef.Text,4,2)+'    '+Copy(dtedDataRef.Text,7,10));
          for c:=1 to 3 do
            GImp.ImprimirTexto(' ');
          // Próximo funcionário
          qrySegDes.Next;
        end;
        frmAguarde.Apaga;
        GImp.Finalizar;
        ShowMessage('Dados impressos com sucesso!');
      except
        frmAguarde.Apaga;
        GImp.Finalizar;
        MessageDlg('Ocorreu um Erro ao Imprimir! Verifique a Impressora.', mtWarning, [mbOk], 0);
      end;
    end;
  end
  else // Arquivo
  begin
    try
      AssignFile(oArquivo,SvDlgDialogo.FileName);
      ReWrite(oArquivo,SvDlgDialogo.FileName);

      // Gravo cada linha Funcionário
      while not(qrySegDes.EOF) do
      begin
        // Espaço do Cabeçalho
        for c:=1 to 9 do
          WriteLn(oArquivo,'');

        // (01) - Nome do Funcionário
        WriteLn(oArquivo, Replicate(' ',8)+
          TrataDados(qrySegDes.FieldByName('EMPREGADO').asString,'A',40));

        // (02) - Endereço do Funcionário
        WriteLn(oArquivo,'');
        WriteLn(oArquivo,'');
        WriteLn(oArquivo, Replicate(' ',8)+
          TrataDados(qrySegDes.FieldByName('ENDERECO').asString,'A',40));

        // (03) - Cep, UF e Telefone
        WriteLn(oArquivo,'');
        WriteLn(oArquivo,'');
        WriteLn(oArquivo, Replicate(' ',8)+
          TrataDados(qrySegDes.FieldByName('COMPLEMENTO').asString,'A',16)+'  '+
          TrataDados(qrySegDes.FieldByName('CEP1').asString       ,'A',06)+' '+
          TrataDados(qrySegDes.FieldByName('CEP2').asString       ,'A',03)+'  '+
          TrataDados(qrySegDes.FieldByName('UF').asString         ,'A',03)+' '+
          TrataDados(qrySegDes.FieldByName('TELEFONE').asString   ,'A',10));

        // (04) - Nome da Mãe do Funcionário
        WriteLn(oArquivo,'');
        WriteLn(oArquivo,'');
        WriteLn(oArquivo, Replicate(' ',8)+
          TrataDados(qrySegDes.FieldByName('MAE').asString,'A',40));

        // (05) - CGC/CEI, Nº do CGC/CEI e Atividade Econômica
        WriteLn(oArquivo,'');
        WriteLn(oArquivo,'');
        WriteLn(oArquivo, Replicate(' ',16)+
          TrataDados(qrySegDes.FieldByName('TIPINSCEMP').asString,'A',01)+Replicate(' ',4)+
          TrataDados(qrySegDes.FieldByName('INSCEMP').asString   ,'A',14)+Replicate(' ',2)+
          TrataDados(qrySegDes.FieldByName('CNAE').asString      ,'A',5));

        // (06) - PIS/PASEP/NIT e CTPS
        WriteLn(oArquivo,'');
        WriteLn(oArquivo,'');
        WriteLn(oArquivo, Replicate(' ',8)+
          TrataDados(qrySegDes.FieldByName('PIS').asString    ,'A',11)+'  '+
          TrataDados(qrySegDes.FieldByName('CTPS').asString   ,'N',07)+
          TrataDados(UltimosCaracteres(qrySegDes.FieldByName('CTPS').asString,3),'N',03)+
          TrataDados(qrySegDes.FieldByName('CTPS_UF').asString,'A',03));

        // (07) - CBO e Ocupação
        WriteLn(oArquivo,'');
        WriteLn(oArquivo,'');
        WriteLn(oArquivo, Replicate(' ',8)+
          TrataDados(qrySegDes.FieldByName('CBO').asString,'A',5)+' '+
          Alinha(qrySegDes.FieldByName('OCUPACAO').asString,35,'E',' '));

        // (08) - Data Admissão, Data Demissão, Sexo, Grau de Instrução, Data de Nascimento e Horas Trab. por Semana
        WriteLn(oArquivo,'');
        WriteLn(oArquivo,'');
        WriteLn(oArquivo,'');
        WriteLn(oArquivo,'');
        WriteLn(oArquivo, Replicate(' ',8)+
          TrataDados(qrySegDes.FieldByName('ADMISSAO').asString  ,'A',6)+Replicate(' ',04)+
          TrataDados(qrySegDes.FieldByName('DEMISSAO').asString  ,'A',6)+Replicate(' ',12)+
          TrataDados(qrySegDes.FieldByName('SEXO').asString      ,'A',1)+Replicate(' ',08)+
          TrataDados(qrySegDes.FieldByName('GRAUINSTRU').asString,'A',1)+Replicate(' ',04)+
          TrataDados(qrySegDes.FieldByName('NASCIMENTO').asString,'A',8)+Replicate(' ',02)+
          TrataDados(qrySegDes.FieldByName('HORASEMANA').asString,'A',2));

        // (09) - (Mês + Antepenúltimo Sal.), (Mês + Penúltimo Sal.) e (Mês + Último Sal.)
        WriteLn(oArquivo,'');
        WriteLn(oArquivo,'');
        WriteLn(oArquivo, Replicate(' ',8)+
          TrataDados(qrySegDes.FieldByName('MES_ANTEPENULT_SALARIO').asString,'A',02)+' '+
          TrataDados(FormatFloat('#########0.00',
                     qrySegDes.FieldByName('ANTEPENULT_SALARIO').asFloat)    ,'N',10)+' '+
          TrataDados(qrySegDes.FieldByName('MES_PENULT_SALARIO').asString    ,'A',02)+' '+
          TrataDados(FormatFloat('#########0.00',
                     qrySegDes.FieldByName('PENULT_SALARIO').asFloat)        ,'N',10)+' '+
          TrataDados(qrySegDes.FieldByName('MES_ULT_SALARIO').asString       ,'A',02)+' '+
          TrataDados(FormatFloat('#########0.00',
                     qrySegDes.FieldByName('ULT_SALARIO').asFloat)           ,'N',10));

        // (10) - Soma Salários, Nº Banco, Nº Agência e Nome do Banco
        WriteLn(oArquivo,'');
        WriteLn(oArquivo,'');
        WriteLn(oArquivo, Replicate(' ',8)+
          TrataDados(FormatFloat('#########0.00',
            qrySegDes.FieldByName('ULT_SALARIO').asFloat+
            qrySegDes.FieldByName('PENULT_SALARIO').asFloat+
            qrySegDes.FieldByName('ANTEPENULT_SALARIO').asFloat),'N',11)+'    '+
          TrataDados(qrySegDes.FieldByName('N_BANCO').asString  ,'A',03)+
          TrataDados(Trim(qrySegDes.FieldByName('N_AGENCIA').asString),'A',06)+'   '+
          Alinha(qrySegDes.FieldByName('AGENCIA').asString,20,'E',' '));

        // (11) - Qtd Meses Trab nos últ. 36 meses, Sal. Últ. 6 meses ?, Aviso Prévio Indenizado
        WriteLn(oArquivo,'');
        WriteLn(oArquivo,'');
        WriteLn(oArquivo, Replicate(' ',34)+TrataDados(
          IFF ((qrySegDes.FieldByName('AVISOPREVIO').asString='1') and
               (qrySegDes.FieldByName('QUANT_TRAB_36MESES').asInteger < 36),
               IntToStr(qrySegDes.FieldByName('QUANT_TRAB_36MESES').asInteger+1),
               PoeZero(qrySegDes.FieldByName('QUANT_TRAB_36MESES').asInteger)),'A',2)+Replicate(' ',23)+
          '1'+Replicate(' ',24)+
//          TrataDados(qrySegDes.FieldByName('RECEB_SAL_6_MESES').asString ,'A',1)+Replicate(' ',23)+
          TrataDados(qrySegDes.FieldByName('AVISOPREVIO').asString       ,'A',1));

        // Imprimo o final da página
        for c:=1 to 20 do
          WriteLn(oArquivo,'');
        WriteLn(oArquivo, Replicate(' ',8)+
          TrataDados(qrySegDes.FieldByName('PIS').asString,'A',11));
        WriteLn(oArquivo,'');
        WriteLn(oArquivo,'');
        WriteLn(oArquivo, Replicate(' ',8)+
          TrataDados(qrySegDes.FieldByName('EMPREGADO').asString,'A',40));
        WriteLn(oArquivo,'');
        WriteLn(oArquivo,Replicate(' ',20)+
          Alinha(qrySegDes.FieldByName('ESTAB').asString,40,'E',' '));
        for c:=1 to 4 do
          WriteLn(oArquivo,'');
        WriteLn(oArquivo, Replicate(' ',8)+
          Alinha(qrySegDes.FieldByName('CIDADE').asString,17,'E',' ')+' '+
          Copy(dtedDataRef.Text,1,2)+'  '+Copy(dtedDataRef.Text,4,2)+'    '+Copy(dtedDataRef.Text,7,10));
        for c:=1 to 3 do
          WriteLn(oArquivo,'');
        // Próximo funcionário
        qrySegDes.Next;
      end;

      // Fecha o arquivo texto e notifica ao usuário
      CloseFile(oArquivo);
      frmAguarde.Apaga;
      ShowMessage('Arquivo criado com sucesso!');
    except
      CloseFile(oArquivo);
      frmAguarde.Apaga;
      ShowMessage('Erro durante a criação em '+svdlgDialogo.FileName);
    end;
  end;
end;

end.
