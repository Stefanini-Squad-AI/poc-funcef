unit fImportacaoDireta;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs, MAHlpBtn,
  StdCtrls, Buttons, TB97, ExtCtrls, Db, DBTables, Wwdatsrc, ComCtrls, Gauges, Grids,
  DBCtrls, TB97Tlbr, fcLabel, IvDictio, IvMulti, IvEMulti, fcTreeView, Menus, ImgList,
  DBClient, uCMClientDataSet, fSairAjuda, uCtrlImportacaoDiretaRH;

type
  TfrmImportacaoDireta = class(TfrmSairAjuda)
    dsColunas: TwwDataSource;
    OpenDlg: TOpenDialog;
    imlstGrupos: TImageList;
    pnlResult: TPanel;
    pnlOpcoes: TPanel;
    Bevel1: TBevel;
    grpColunasBanco: TGroupBox;
    GroupBox1: TGroupBox;
    sbtnAdicionarCampo: TSpeedButton;
    sbtnAdicionarTodosCampos: TSpeedButton;
    sbtnRemoverCampo: TSpeedButton;
    sbtnRemoverTodosCampos: TSpeedButton;
    Label1: TLabel;
    Bevel4: TBevel;
    lblMensagem: TLabel;
    Bevel2: TBevel;
    bbtnImportar: TBitBtn;
    bbtnVoltar: TBitBtn;
    Bevel3: TBevel;
    fcLabel1: TfcLabel;
    rgrpOperacao: TRadioGroup;
    chkExibirLinhas: TCheckBox;
    chkPararEmErro: TCheckBox;
    memResult: TMemo;
    fctrvImportar: TfcTreeView;
    imgChecked: TImage;
    imgUnChecked: TImage;
    lblApagandoTab: TLabel;
    lblGerandoReg: TLabel;
    Bevel5: TBevel;
    pbProgresso: TProgressBar;
    imgApagandoTab: TImage;
    imgGerandoReg: TImage;
    Bevel6: TBevel;
    bbtnSalvarLOG: TBitBtn;
    SaveDlg: TSaveDialog;
    lblTabela: TLabel;
    sbtnSalvarConfig: TSpeedButton;
    sbtnAbrirConfig: TSpeedButton;
    Bevel7: TBevel;
    sbtnSelCampoSeq: TSpeedButton;
    lblColunaSeq: TLabel;
    lstColunas: TListBox;
    sbtnRetornaCampoSeq: TSpeedButton;
    Panel1: TPanel;
    Panel2: TPanel;
    strColunas: TStringGrid;
    CdsColunas: TCMClientDataSet;
    procedure bbtnImportarClick(Sender: TObject);
    procedure sbtnRemoverCampoClick(Sender: TObject);
    procedure sbtnRemoverTodosCamposClick(Sender: TObject);
    procedure sbtnAdicionarTodosCamposClick(Sender: TObject);
    procedure bbtnVoltarClick(Sender: TObject);
    procedure fctrvImportarClick(Sender: TObject);
    procedure sbtnAdicionarCampoClick(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure chkExibirLinhasClick(Sender: TObject);
    procedure chkExibirLinhasKeyPress(Sender: TObject; var Key: Char);
    procedure bbtnSalvarLOGClick(Sender: TObject);
    procedure sbtnSalvarConfigClick(Sender: TObject);
    procedure sbtnAbrirConfigClick(Sender: TObject);
    procedure sbtnSelCampoSeqClick(Sender: TObject);
    procedure sbtnRetornaCampoSeqClick(Sender: TObject);
    procedure strColunasDrawCell(Sender: TObject; Col, Row: Integer;
      Rect: TRect; State: TGridDrawState);
    procedure lstColunasDrawItem(Control: TWinControl; Index: Integer;
      Rect: TRect; State: TOwnerDrawState);
    procedure strColunasSelectCell(Sender: TObject; Col, Row: Integer;
      var CanSelect: Boolean);
    procedure lstColunasMouseDown(Sender: TObject; Button: TMouseButton;
      Shift: TShiftState; X, Y: Integer);
    procedure lstColunasKeyDown(Sender: TObject; var Key: Word; Shift: TShiftState);
  private
    CtrlImportacaoDiretaRH: TCtrlImportacaoDiretaRH;

    OldIndex: integer;

    procedure SelColunas;
    procedure InserirCampo(Linha: integer; Item: string);
    procedure ApagarCampo(Linha: integer);
    function  VerificaCampos: boolean;
    function  VerificaCampoNotNull: boolean;
    function  CampoExiste(NomeColuna: string): boolean;

    procedure LerNomeArquivo;
    procedure ImportarArquivo;
    procedure LimparGrid;
    procedure HabilitaBtCampos;
    procedure Progresso(Args: array of Variant);
  end;

var
  frmImportacaoDireta: TfrmImportacaoDireta;

implementation

uses uSistema, uMensErro, uCtrlPadroes, uCtrlFuncoesRH;

{$R *.DFM}

procedure TfrmImportacaoDireta.FormCreate(Sender: TObject);
begin
  inherited;
  CtrlImportacaoDiretaRH := TCtrlImportacaoDiretaRH.Create;
  CtrlImportacaoDiretaRH.InitializeAs(Padroes);
  CtrlImportacaoDiretaRH.CdsColunas := CdsColunas;
  CtrlImportacaoDiretaRH.Progresso := Progresso;

  strColunas.ColWidths[1] := 33;
  bbtnVoltar.Enabled := false;
  pbProgresso.Position := 0;
  CtrlImportacaoDiretaRH.CampoSeq := '';

  pnlOpcoes.BringToFront;
  LimparGrid;

  case (Sistema.IdModulo) of
    MODBAS : HelpContext := 690004;
    MODFOL : HelpContext := 210005;
  end;
end;

procedure TfrmImportacaoDireta.lstColunasDrawItem(Control: TWinControl;
  Index: Integer; Rect: TRect; State: TOwnerDrawState);
begin
  with (TListBox(Control).Canvas) do
  begin
    if (TListBox(Control).ItemIndex = Index) then
    begin
      Brush.Color := clTeal;
      Font.Color := clWhite;
    end
    else
    begin
      Brush.Color := clWhite;
      Font.Color := clBlack;
    end;

    FillRect(Rect);
    TextOut(Rect.Left, Rect.Top, TListBox(Control).Items[Index]);
  end;

  HabilitaBtCampos;
end;

procedure TfrmImportacaoDireta.strColunasDrawCell(Sender:TObject; Col,Row:Integer;
  Rect:TRect; State:TGridDrawState);
begin
  HabilitaBtCampos;
end;

procedure TfrmImportacaoDireta.strColunasSelectCell(Sender:TObject; Col,Row:Integer;
  var CanSelect:Boolean);
begin
  CanSelect := (Col = 1);
end;

procedure TfrmImportacaoDireta.chkExibirLinhasClick(Sender: TObject);
begin
  chkPararEmErro.Enabled := (chkExibirLinhas.Checked);
end;

procedure TfrmImportacaoDireta.lstColunasKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  if (Key = VK_UP) or (Key = VK_DOWN) then
    lstColunas.Repaint;
end;

procedure TfrmImportacaoDireta.lstColunasMouseDown(Sender: TObject; Button: TMouseButton;
  Shift: TShiftState; X, Y: Integer);
begin
  lstColunas.Repaint;
end;

procedure TfrmImportacaoDireta.chkExibirLinhasKeyPress(Sender: TObject; var Key: Char);
begin
  chkPararEmErro.Enabled := (chkExibirLinhas.Checked);
end;

procedure TfrmImportacaoDireta.bbtnImportarClick(Sender: TObject);
begin
  if (rgrpOperacao.ItemIndex = 1) and
     (MsgDlg('Todas as linhas da tabela no Banco de Dados serão apagadas.'+CR_LF+
             'Deseja continuar?', 'Confirmação', mtConfirmation,
             [mbYes,mbNo,mbHelp], 0) = mrNo) then
    exit;

  // Verificar se todas as colunas a importar estão com tamanho preenchido
  if not(VerificaCampos) then
    exit;

  // Verificar se os campos NOT NULL estão na lista de colunas a importar
  if not(VerificaCampoNotNull) then
    exit;

  LerNomeArquivo;

  if (CtrlImportacaoDiretaRH.NomeArq <> '') then
    ImportarArquivo;
end;

procedure TfrmImportacaoDireta.bbtnVoltarClick(Sender: TObject);
begin
  pnlOpcoes.BringToFront;
  bbtnSalvarLOG.Enabled := false;
  bbtnVoltar.Enabled := false;
  bbtnImportar.Enabled := true;
  pbProgresso.Position := 0;
  imgApagandoTab.Picture := imgUnChecked.Picture;
  imgGerandoReg.Picture := imgUnChecked.Picture;
  lblApagandoTab.Font.Style := [];
  rgrpOperacao.Enabled := true;
  chkExibirLinhas.Enabled := true;
  if (chkExibirLinhas.Checked) then
    chkPararEmErro.Enabled := true;
end;

procedure TfrmImportacaoDireta.bbtnSalvarLOGClick(Sender: TObject);
begin
  if (SaveDlg.Execute) then
    memResult.Lines.SaveToFile(SaveDlg.FileName);
end;

procedure TfrmImportacaoDireta.sbtnAdicionarCampoClick(Sender: TObject);
var
  c: integer;
begin
  // Somente prossigo se existir dados a manipular
  if (lstColunas.ItemIndex > -1) then
  begin
    OldIndex := lstColunas.ItemIndex;

    // Insiro a linha selecionada na posição atual
    if (strColunas.RowCount = 1) and (strColunas.Cells[0,strColunas.Row] = '') then
      strColunas.Cells[0,strColunas.Row] := lstColunas.Items[lstColunas.ItemIndex]
    else
    begin
      strColunas.RowCount := strColunas.RowCount + 1;
      InserirCampo(strColunas.Row+1, lstColunas.Items[lstColunas.ItemIndex]);
      strColunas.Row := strColunas.Row + 1;
    end;

    // Atualizo a mensagem que contém os campos selecionados
    lblMensagem.Caption := 'Campos: ';
    for C:=0 to strColunas.RowCount-1 do
      lblMensagem.Caption := lblMensagem.Caption + strColunas.Cells[0,C] + ',';
    lblMensagem.Caption := lblMensagem.Caption + '#';

    // Apago a coluna da lista de colunas a selecionar
    lstColunas.Items.Delete(lstColunas.ItemIndex);

    if (lstColunas.Items.Count > 0) then
    begin
      if (OldIndex > lstColunas.Items.Count-1) then
        lstColunas.ItemIndex := OldIndex-1
      else
        lstColunas.ItemIndex := OldIndex;
    end
    else
      lstColunas.ItemIndex := 0;

    bbtnImportar.Enabled := true;
  end;  
end;

procedure TfrmImportacaoDireta.sbtnAdicionarTodosCamposClick(Sender: TObject);
var
  c: integer;
begin
  // Somente prossigo se existir dados a manipular
  if (lstColunas.Items.Count > 0) then
  begin
    // Insiro cada linha na lista acima
    for c:=0 to lstColunas.Items.Count-1 do
    begin
      if (c > 0) and (Trim(strColunas.Cells[0,strColunas.RowCount-1]) <> '') then
        strColunas.RowCount := strColunas.RowCount + 1;

      strColunas.Cells[0,strColunas.RowCount-1] := lstColunas.Items[c];
    end;
    lstColunas.Items.Clear;

    // Atualizo a mensagem que contém os campos selecionados
    lblMensagem.Caption := 'Campos: ';
    for c:=0 to strColunas.RowCount-1 do
      lblMensagem.Caption := lblMensagem.Caption + strColunas.Cells[0,C] + ',';
    lblMensagem.Caption := lblMensagem.Caption + '#';

    bbtnImportar.Enabled := true;
  end;
end;

procedure TfrmImportacaoDireta.sbtnRemoverCampoClick(Sender: TObject);
var
  c: integer;
begin
  // Somente prossigo se existir dados a manipular
  if (strColunas.RowCount > 1) or
     ((strColunas.RowCount = 1) and (Trim(strColunas.Cells[0,0]) <> '')) then
  begin
    // Insiro o Campo na posição mais parecida com que estava
    lstColunas.ItemIndex := lstColunas.Items.Add (strColunas.Cells[0,strColunas.Row]);
    ApagarCampo(strColunas.Row);

    // Atualizo a mensagem que contém os campos selecionados
    lblMensagem.Caption := 'Campos: ';
    for c:=0 to strColunas.RowCount-1 do
      lblMensagem.Caption := lblMensagem.Caption + strColunas.Cells[0,c] + ',';
    lblMensagem.Caption := lblMensagem.Caption + '#';

    if (strColunas.RowCount = 1) and (Trim(strColunas.Cells[0,0]) = '') then
    begin
      bbtnImportar.Enabled := false;
      lblMensagem.Caption := 'Colunas disponíveis... Selecione as colunas a importar...';
    end;
  end;
end;

procedure TfrmImportacaoDireta.sbtnRemoverTodosCamposClick(Sender: TObject);
var
  c: integer;
begin
  // Somente prossigo se existir dados a manipular
  if (strColunas.RowCount > 1) or
     ((strColunas.RowCount = 1) and (Trim(strColunas.Cells[0,0]) <> '')) then
  begin
    for c:=0 to strColunas.RowCount-1 do
      lstColunas.Items.Add(strColunas.Cells[0,c]);

    LimparGrid;
    lstColunas.ItemIndex := 0;
    bbtnImportar.Enabled := false;
    lblMensagem.Caption := 'Colunas disponíveis... Selecione as colunas a importar...';
  end;
end;

procedure TfrmImportacaoDireta.sbtnSelCampoSeqClick(Sender: TObject);
begin
  if (CtrlImportacaoDiretaRH.CampoSeq = '') and (lstColunas.ItemIndex > -1) then
  begin
    CtrlImportacaoDiretaRH.CampoSeq := lstColunas.Items[lstColunas.ItemIndex];
    lblColunaSeq.Caption := 'Sequencial : [' +CtrlImportacaoDiretaRH.CampoSeq+ ']';

    OldIndex := lstColunas.ItemIndex;

    // Apago a coluna da lista de colunas a selecionar
    lstColunas.Items.Delete(lstColunas.ItemIndex);

    if (lstColunas.Items.Count > 0) then
      lstColunas.ItemIndex := OldIndex;
  end;
end;

procedure TfrmImportacaoDireta.sbtnRetornaCampoSeqClick(Sender: TObject);
begin
  if (CtrlImportacaoDiretaRH.CampoSeq <> '') then
  begin
    // Insiro a coluna da lista de colunas a selecionar
    lstColunas.ItemIndex := lstColunas.Items.Add(CtrlImportacaoDiretaRH.CampoSeq);

    CtrlImportacaoDiretaRH.CampoSeq := '';
    lblColunaSeq.Caption := 'Sequencial : []';
  end;
end;

procedure TfrmImportacaoDireta.sbtnAbrirConfigClick(Sender: TObject);
var
  _Arq: TStringList;
  bAchou: boolean;
  iPosDelim, c, I, iPosIni: integer;
  sArqConfig, sLinha, sNomeColuna, sTamColuna: string;
begin
  OpenDlg.Title := 'Abrir uma Configuração de Importação';

  if (OpenDlg.Execute) then
    sArqConfig := OpenDlg.FileName
  else
    sArqConfig := '';

  if (sArqConfig <> '') then
  begin
    if (FileExists(sArqConfig)) then
    begin
      _Arq := TStringList.Create;
      // Abro o arquivo de configuração
      _Arq.LoadFromFile(sArqConfig);

      // Leio o nome da Tabela e verifico se está na lista de Tabelas
      sLinha := _Arq[0];

      CtrlImportacaoDiretaRH.NomeTabela :=
        FU.TiraCaracter(FU.TiraCaracter(FU.TiraCaracter(sLinha,' '),'['),']');
      bAchou := false;
      for c:=0 to fctrvImportar.Items.Count-1 do
        if (CtrlImportacaoDiretaRH.NomeTabela = fctrvImportar.Items.Item[c].StringData) then
        begin
          bAchou := true;
          break;
        end;

      if not(bAchou) then
      begin
        MsgDlg('Nome da Tabela não consta na lista.', 'Aviso', mtInformation, [mbOk,mbHelp], 0);
        _Arq.Free;
        exit;
      end;

      lblTabela.Caption := 'Tabela : [' +CtrlImportacaoDiretaRH.NomeTabela+ ']';

      // Seleciono campos da tabela
      SelColunas;
      strColunas.RowCount := 1;

      // Leio o nome do campo sequencial da Tabela e verifico se está na lista de campos desta
      sLinha := _Arq[1];
      CtrlImportacaoDiretaRH.CampoSeq :=
        FU.TiraCaracter(FU.TiraCaracter(FU.TiraCaracter(sLinha,' '),'*'),'*');
      bAchou := false;

      for c:=0 to lstColunas.Items.Count-1 do
        if (CtrlImportacaoDiretaRH.CampoSeq = lstColunas.Items[c]) then
        begin
          bAchou := true;
          break;
        end;

      if not(bAchou) then
        CtrlImportacaoDiretaRH.CampoSeq := ''
      else
      begin
        lblColunaSeq.Caption := 'Sequencial : [' +CtrlImportacaoDiretaRH.CampoSeq+ ']';
        lstColunas.Items.Delete(lstColunas.Items.IndexOf(CtrlImportacaoDiretaRH.CampoSeq));
      end;

      if (CtrlImportacaoDiretaRH.CampoSeq = '') then
        iPosIni := 1
      else
        iPosIni := 2;

      strColunas.RowCount := _Arq.Count - iPosIni;
      for c:=iPosIni to _Arq.Count-1 do
      begin
        sLinha := _Arq[c];

        iPosDelim := Pos('=', sLinha);
        sNomeColuna := Copy(sLinha, 1, iPosDelim-1);
        sTamColuna := Copy(sLinha, iPosDelim+1, Length(sLinha)-iPosDelim+1);

        lstColunas.Items.Delete(lstColunas.Items.IndexOf(sNomeColuna));

        strColunas.Cells[0, c-1] := sNomeColuna;
        strColunas.Cells[1, c-1] := sTamColuna;
      end;

      // Exibir mensagem com os campos selecionados
        lblMensagem.Caption := 'Campos: ';
      for I:=0 to strColunas.RowCount-1 do
        lblMensagem.Caption := lblMensagem.Caption + strColunas.Cells[0,I] + ',';
        lblMensagem.Caption := lblMensagem.Caption + '#';

        bbtnImportar.Enabled := true;

      _Arq.Free;
    end
    else
      MsgDlg('O Caminho ou arquivo especificado não existe.',
             'Aviso', mtWarning, [mbOk,mbHelp], 0);
  end;
end;

procedure TfrmImportacaoDireta.sbtnSalvarConfigClick(Sender: TObject);
var
  _Arq: TStringList;
  c: integer;
  sArqConfig, sLinha: string;
begin
  SaveDlg.Title := 'Salvar as Configurações de Importação da Tabela selecionada';

  if (SaveDlg.Execute) then
    sArqConfig := SaveDlg.FileName
  else
    sArqConfig := '';

  if (sArqConfig <> '') then
  begin
    try
      _Arq := TStringList.Create;

      // Gravar nome da Tabela
      _Arq.Add('[' +CtrlImportacaoDiretaRH.NomeTabela+ ']');

      // Gravar campo Sequencial
      if (CtrlImportacaoDiretaRH.CampoSeq <> '') then
        _Arq.Add('*' +CtrlImportacaoDiretaRH.CampoSeq+ '*');

      // Gravar colunas
      for c:=0 to strColunas.RowCount-1 do
      begin
        sLinha := strColunas.Cells[0, c] +'='+ strColunas.Cells[1, c];
        _Arq.Add(sLinha);
      end;

      // Salvar arquivo de configuração
      _Arq.SaveToFile(sArqConfig);
      _Arq.Free;
    except
      MsgDlg('Ocorreu um erro ao tentar gravar o arquivo de Layout.',
             'Erro', mtError, [mbOk,mbHelp], 0);
    end;
  end;
end;

procedure TfrmImportacaoDireta.fctrvImportarClick(Sender: TObject);
begin
  CtrlImportacaoDiretaRH.NomeTabela :=
    fctrvImportar.Items.Item[fctrvImportar.Selected.AbsoluteIndex].StringData;

  if (Trim(CtrlImportacaoDiretaRH.NomeTabela) <> '') then
  begin
    lblMensagem.Caption := 'Selecionando colunas... Aguarde...';

    SelColunas;

    lblMensagem.Caption := 'Colunas disponíveis... Selecione as colunas a importar...';
    lstColunas.ItemIndex := 0;
  end
  else
  begin
    lblMensagem.Caption := '';
    lstColunas.ItemIndex := -1;
  end;

  lblTabela.Caption := 'Tabela : [' +CtrlImportacaoDiretaRH.NomeTabela+ ']';
  lblColunaSeq.Caption := 'Sequencial : []';
  CtrlImportacaoDiretaRH.CampoSeq := '';
  bbtnImportar.Enabled := false;

  LimparGrid;
end;

procedure TfrmImportacaoDireta.ImportarArquivo;
var
  Arq: TStringList;
  bOk: boolean;
  c, iNumErros: integer;
  ListaCampos, ListaTamCampos: string;
begin
  Arq := TStringList.Create;

  rgrpOperacao.Enabled := false;
  chkExibirLinhas.Enabled := false;
  if (chkExibirLinhas.Checked) then
    chkPararEmErro.Enabled := false;

  if (rgrpOperacao.ItemIndex = 0) then
    lblApagandoTab.Font.Style := [fsStrikeOut];

  if (chkExibirLinhas.Checked) then
  begin
    bbtnVoltar.Enabled := true;
    bbtnImportar.Enabled := false;
    pnlOpcoes.SendToBack;
    pnlResult.BringToFront;
  end;

  memResult.Lines.Clear;
  memResult.Lines.Add('Importação Direta de Dados - Data : ' +DateTimeToStr(date)+
    ' - Usuário : ' +Sistema.NomeUsuario);
  memResult.Lines.Add('   Arquivo : ' +
    CtrlImportacaoDiretaRH.NomeTabela+ ' [' +CtrlImportacaoDiretaRH.NomeArq+ ']');
  memResult.Lines.Add(FU.Replicate('_',63));
  memResult.Lines.Add('');

  // Verifica se o arquivo está vazio
  Arq.LoadFromFile(CtrlImportacaoDiretaRH.NomeArq);

  if (Trim(Arq.Text) = '') then
  begin
    MsgDlg('Arquivo não contém dados.', 'Aviso', mtInformation, [mbOk,mbHelp], 0);
    exit;
  end;

  // Preencho variáveis com o Nome e Tamanho de cada campo selecionado
  ListaCampos := '';
  ListaTamCampos := '';
  for c:=0 to strColunas.RowCount-1 do
  begin
    if (ListaCampos = '') then
      ListaCampos := Trim(strColunas.Cells[0,c])
    else
      ListaCampos := ListaCampos +','+ Trim(strColunas.Cells[0,c]);

    if (ListaTamCampos = '') then
      ListaTamCampos := strColunas.Cells[1,c]
    else
      ListaTamCampos := ListaTamCampos +','+ strColunas.Cells[1,c];
  end;

  // Iniciar o Processamento
  pbProgresso.Position := 0;
  pbProgresso.Max := Arq.Count;

  if (rgrpOperacao.ItemIndex = 1) then
  begin
    lblApagandoTab.Font.Color := clRed;
    lblApagandoTab.Repaint;
  end;

  CtrlImportacaoDiretaRH.CreateThreadProgresso;
  CtrlImportacaoDiretaRH.StartTransaction;
  bOk := CtrlImportacaoDiretaRH.IniciarImportacao(Arq.Text, ListaCampos, ListaTamCampos,
    rgrpOperacao.ItemIndex = 1);

  iNumErros := 0;    
  if (bOk) then
  begin
    if (rgrpOperacao.ItemIndex = 1) then
    begin
      imgApagandoTab.Picture := imgChecked.Picture;
      imgApagandoTab.Repaint;
      lblApagandoTab.Font.Color := clNavy;
      lblApagandoTab.Repaint;

      lblGerandoReg.Font.Color := clRed;
    end;

    // Processar cada registro
    for c:=0 to Arq.Count-1 do
    begin
      bOk := CtrlImportacaoDiretaRH.ImportacaoLinha(Arq[c]);

      if not(bOk) then
      begin
        Inc(iNumErros);
        if (chkPararEmErro.Checked) and
           (MsgDlg('Erro [linha ' +IntToStr(CtrlImportacaoDiretaRH.LinhaAtual)+ '].' +CR_LF+
            'Deseja continuar?', 'Erro', mtError, [mbYes,mbNo,mbHelp], 0) = mrNo) then
          break;
      end;

      pbProgresso.StepIt;
    end;
  end;  

  // Gravar efetivamente no BD
  if (bOk) then
  begin
    CtrlImportacaoDiretaRH.Commit;
    CtrlImportacaoDiretaRH.FreeThreadProgresso;
    if (iNumErros > 0) then
      MsgDlg('Importação executada com ' +IntToStr(iNumErros)+ ' erros.', 'Aviso',
        mtWarning, [mbOk,mbHelp], 0)
    else
      MsgDlg('Importação executada com sucesso.', 'Aviso', mtWarning, [mbOk,mbHelp], 0);
  end
  else
  begin
    CtrlImportacaoDiretaRH.Rollback;
    CtrlImportacaoDiretaRH.FreeThreadProgresso;
    MsgDlg(CtrlImportacaoDiretaRH.MessageInfo, 'Erro', mtError, [mbOk,mbHelp], 0);
  end;

  imgGerandoReg.Picture := imgChecked.Picture;

  if not(chkExibirLinhas.Checked) then
  begin
    bbtnVoltar.Enabled := true;
    bbtnImportar.Enabled := false;
    pnlOpcoes.SendToBack;
    pnlResult.BringToFront;
  end;

  lblGerandoReg.Font.Color := clNavy;
  lblGerandoReg.Repaint;
  bbtnSalvarLOG.Enabled := true;

  Arq.Free;
end;

procedure TfrmImportacaoDireta.SelColunas;
begin
  CdsColunas.Data := CtrlImportacaoDiretaRH.ListTabela(CtrlImportacaoDiretaRH.NomeTabela);

  lstColunas.Items.Clear;
  repeat
    lstColunas.Items.Add(CdsColunas.FieldByName('COLUMN_NAME').asString);
    CdsColunas.Next;
  until (CdsColunas.EOF);
  CdsColunas.First;
end;

procedure TfrmImportacaoDireta.HabilitaBtCampos;
begin
  sbtnSalvarConfig.Enabled := (strColunas.RowCount > 1) or
    ((strColunas.RowCount = 1) and (Trim(strColunas.Cells[0,0]) <> ''));

  sbtnAdicionarCampo.Enabled := (lstColunas.Items.Count > 0);
  sbtnAdicionarTodosCampos.Enabled := (lstColunas.Items.Count > 0);
  sbtnRemoverCampo.Enabled := sbtnSalvarConfig.Enabled;
  sbtnRemoverTodosCampos.Enabled := sbtnSalvarConfig.Enabled;
  sbtnSelCampoSeq.Enabled := (CtrlImportacaoDiretaRH.CampoSeq = '') and
    (lstColunas.Items.Count > 0);
  sbtnRetornaCampoSeq.Enabled := (CtrlImportacaoDiretaRH.CampoSeq <> '');
end;

procedure TfrmImportacaoDireta.LimparGrid;
begin
  strColunas.RowCount := 1;
  strColunas.Cells[0,0] := '';
  strColunas.Cells[1,0] := '';
end;

procedure TfrmImportacaoDireta.LerNomeArquivo;
begin
  OpenDlg.Title := 'Importação Direta de Dados - ' +CtrlImportacaoDiretaRH.NomeTabela;

  if not(OpenDlg.Execute) then
    CtrlImportacaoDiretaRH.NomeArq := ''
  else
    CtrlImportacaoDiretaRH.NomeArq := OpenDlg.FileName;
end;

procedure TfrmImportacaoDireta.InserirCampo(Linha: integer; Item: string);
var
  c: integer;
begin
  for c:=strColunas.RowCount-1 DownTo Linha do
    strColunas.Cells[0,c+1] := strColunas.Cells[0,c];
  strColunas.Cells[0,Linha] := Item;
end;

procedure TfrmImportacaoDireta.ApagarCampo(Linha: integer);
var
  c: integer;
begin
  // Se a linha a apagar for a ultima, basta diminuir o RowCount
  // Senao, as linhas posteriores devem ser deslocadas de uma posição
  if (Linha <> strColunas.RowCount-1) then
    for c:=Linha to strColunas.RowCount-1 do
    begin
      strColunas.Cells[0,c] := strColunas.Cells[0,c+1];
      strColunas.Cells[1,c] := strColunas.Cells[1,c+1];
    end;

  strColunas.Cells[0,strColunas.RowCount-1] := '';
  strColunas.RowCount := strColunas.RowCount - 1;
end;

function TfrmImportacaoDireta.VerificaCampos: boolean;
var
  c: integer;
begin
  for c:=0 to strColunas.RowCount-1 do
  begin
    if (Trim(strColunas.Cells[1,c]) = '') then
    begin
      MsgDlg('Tamanho da Coluna ' +strColunas.Cells[0,c]+ ' não preenchido.',
             'Aviso', mtInformation, [mbOk,mbHelp], 0);
      Result := false;
      exit;
    end;
  end;
  Result := true;
end;

function TfrmImportacaoDireta.VerificaCampoNotNull: boolean;
begin
  Result := false;

  CdsColunas.First;
  while not(CdsColunas.EOF) do
  begin
    if (CdsColunas.FieldByName('NullAble').asString = 'N') then
    begin
      if not(CampoExiste(CdsColunas.FieldByName('Column_Name').asString)) then
      begin
        MsgDlg('A coluna ' +CdsColunas.FieldByName('Column_Name').asString+
               ' é obrigatória e não foi encontrada na lista de colunas a importar.',
               'Aviso', mtInformation, [mbOk,mbHelp], 0);
        exit;
      end;
    end;
    CdsColunas.Next;
  end;

  Result := true;
end;

function TfrmImportacaoDireta.CampoExiste(NomeColuna: string): boolean;
var
  c: integer;
begin
  Result := false;

  for c:=0 to strColunas.RowCount-1 do
  begin
    if (Trim(NomeColuna) = strColunas.Cells[0,c]) or
       (Trim(NomeColuna) = CtrlImportacaoDiretaRH.CampoSeq) then
    begin
      Result := true;
      break;
    end;
  end;
end;

procedure TfrmImportacaoDireta.Progresso(Args: array of Variant);
begin
  if (Args[0] <> '') then
    memResult.Lines.Add(Args[0]);

  Self.Repaint;
end;

end.
