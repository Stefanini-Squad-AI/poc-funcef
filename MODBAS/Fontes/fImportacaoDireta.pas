unit FImportacaoDireta;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  FOkCancelar, MAHlpBtn, StdCtrls, Buttons, TB97, ExtCtrls, Db, DBTables,
  Wwquery, Wwdatsrc, ComCtrls, Gauges, Grids, DBCtrls, TB97Tlbr, fcLabel,
  IvDictio, IvMulti, IvEMulti, fcTreeView, Menus, ImgList;

type
  TfrmImportacaoDireta = class(TfrmOkCancelar)
    dsColunas: TwwDataSource;
    qryColunas: TwwQuery;
    OpenDlg: TOpenDialog;
    imlstGrupos: TImageList;
    qryAux: TwwQuery;
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
    procedure lstColunasKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
  private
    OldIndex: integer;
    iIndice: LongInt;

    sCampoSeq, sNomeArq, sNomeTabela: string;

    procedure SelecionaColunas;
    procedure InserirCampo(iLinha:integer; sItem:string);
    procedure ApagarCampo(iLinha: integer);
    function  TrataCampo(sLinha:string; var sErro:string): boolean;
    function  VerificaCampos: boolean;
    function  InListTiposString(sString: string): boolean;
    function  VerificaCampoNotNull: boolean;
    function  CampoExiste(sNomeColuna: string): boolean;

    procedure LerNomeArquivo(sTitulo: string);
    procedure ImportarArquivo(sImportacao: string);
    procedure LimpaGrid;
    procedure HabilitaBtCampos;
  public
    { Public declarations }
  end;

var
  frmImportacaoDireta: TfrmImportacaoDireta;

implementation

uses uSistema, uMensErro, uDataBase, uFuncoesUteis;

const
  MAX_TIPO_DADO = 4;
  TiposDeDado: array[1..MAX_TIPO_DADO] of string = ('VARCHAR2','CHAR','VARCHAR','LONG');

{$R *.DFM}

procedure TfrmImportacaoDireta.FormCreate(Sender: TObject);
begin
  inherited;
  strColunas.ColWidths[1] := 33;
  bbtnVoltar.Enabled   := false;
  pbProgresso.Position := 0;
  sCampoSeq            := '';

  pnlOpcoes.BringToFront;  
  LimpaGrid;
end;

procedure TfrmImportacaoDireta.HabilitaBtCampos;
begin
  sbtnSalvarConfig.Enabled := (strColunas.RowCount > 1) or
    ((strColunas.RowCount = 1) and (Trim(strColunas.Cells[0,0]) <> ''));

  sbtnAdicionarCampo.Enabled       := (lstColunas.Items.Count > 0);
  sbtnAdicionarTodosCampos.Enabled := (lstColunas.Items.Count > 0);
  sbtnRemoverCampo.Enabled         := sbtnSalvarConfig.Enabled;
  sbtnRemoverTodosCampos.Enabled   := sbtnSalvarConfig.Enabled;
  sbtnSelCampoSeq.Enabled          := (sCampoSeq = '') and (lstColunas.Items.Count > 0);
  sbtnRetornaCampoSeq.Enabled      := (sCampoSeq <> '');  
end;

procedure TfrmImportacaoDireta.lstColunasDrawItem(Control: TWinControl;
  Index: Integer; Rect: TRect; State: TOwnerDrawState);
begin
  inherited;
  with (TListBox(Control).Canvas) do
  begin
    if (TListBox(Control).ItemIndex = Index) then
    begin
      Brush.Color := clTeal;
      Font.Color  := clWhite;
    end
    else
    begin
      Brush.Color := clWhite;
      Font.Color  := clBlack;
    end;

    FillRect(Rect);
    TextOut(Rect.Left, Rect.Top, TListBox(Control).Items[Index]);
  end;

  HabilitaBtCampos;
end;

procedure TfrmImportacaoDireta.strColunasDrawCell(Sender:TObject; Col,Row:Integer;
  Rect:TRect; State:TGridDrawState);
begin
  inherited;
  HabilitaBtCampos;
end;

procedure TfrmImportacaoDireta.strColunasSelectCell(Sender:TObject; Col,Row:Integer;
  var CanSelect:Boolean);
begin
  inherited;
  CanSelect := (Col = 1);
end;

procedure TfrmImportacaoDireta.chkExibirLinhasClick(Sender: TObject);
begin
  inherited;
  chkPararEmErro.Enabled := (chkExibirLinhas.Checked);
end;

procedure TfrmImportacaoDireta.lstColunasKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  inherited;
  if (Key = VK_UP) or (Key = VK_DOWN) then
    lstColunas.Repaint;
end;

procedure TfrmImportacaoDireta.lstColunasMouseDown(Sender: TObject; Button: TMouseButton;
  Shift: TShiftState; X, Y: Integer);
begin
  inherited;
  lstColunas.Repaint;
end;

procedure TfrmImportacaoDireta.chkExibirLinhasKeyPress(Sender: TObject; var Key: Char);
begin
  inherited;
  chkPararEmErro.Enabled := (chkExibirLinhas.Checked);
end;

procedure TfrmImportacaoDireta.bbtnImportarClick(Sender: TObject);
begin
  inherited;
  if (rgrpOperacao.ItemIndex = 1) then
  begin
    if (MsgDlg(' Todas as linhas da tabela no Banco de Dados serão apagadas. '+
               'Deseja continuar ? ','Confirmação',mtConfirmation,[mbYes,mbNo,mbHelp],0) = mrNo) then
      exit;
  end;

  // Verificar se todas as colunas a importar estão com tamanho preenchido
  if not(VerificaCampos) then
    exit;

  // Verificar se os campos NOT NULL estão na lista de colunas a importar
  if not(VerificaCampoNotNull) then
    exit;

  LerNomeArquivo(sNomeTabela);

  if (sNomeArq <> '') then
    ImportarArquivo(sNomeTabela);
end;

procedure TfrmImportacaoDireta.bbtnVoltarClick(Sender: TObject);
begin
  inherited;
  pnlOpcoes.BringToFront;
  bbtnSalvarLOG.Enabled  := false;
  bbtnVoltar.Enabled     := false;
  bbtnImportar.Enabled   := true;
  pbProgresso.Position   := 0;
  imgApagandoTab.Picture := imgUnChecked.Picture;
  imgGerandoReg.Picture  := imgUnChecked.Picture;
  lblApagandoTab.Font.Style := [];
  rgrpOperacao.Enabled    := true;
  chkExibirLinhas.Enabled := true;
  if (chkExibirLinhas.Checked) then
    chkPararEmErro.Enabled := true;
end;

procedure TfrmImportacaoDireta.bbtnSalvarLOGClick(Sender: TObject);
begin
  inherited;
  if (SaveDlg.Execute) then
    memResult.Lines.SaveToFile(SaveDlg.FileName);
end;

procedure TfrmImportacaoDireta.sbtnSelCampoSeqClick(Sender: TObject);
begin
  inherited;
  if (sCampoSeq = '') and (lstColunas.ItemIndex > -1) then
  begin
    sCampoSeq := lstColunas.Items[lstColunas.ItemIndex];
    lblColunaSeq.Caption := 'Sequencial : [' +sCampoSeq+ ']';

    OldIndex := lstColunas.ItemIndex;

    // Apago a coluna da lista de colunas a selecionar
    lstColunas.Items.Delete(lstColunas.ItemIndex);

    if (lstColunas.Items.Count > 0) then
      lstColunas.ItemIndex := OldIndex;
  end;
end;

procedure TfrmImportacaoDireta.sbtnRetornaCampoSeqClick(Sender: TObject);
begin
  inherited;
  if (sCampoSeq <> '') then
  begin
    // Insiro a coluna da lista de colunas a selecionar
    lstColunas.ItemIndex := lstColunas.Items.Add (sCampoSeq);

    sCampoSeq := '';
    lblColunaSeq.Caption := 'Sequencial : []';    
  end;
end;

procedure TfrmImportacaoDireta.sbtnAdicionarCampoClick(Sender: TObject);
var
  c: integer;
begin
  inherited;
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
  inherited;
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
  inherited;
  // Somente prossigo se existir dados a manipular
  if (strColunas.RowCount > 1) or
     ((strColunas.RowCount = 1) and (Trim(strColunas.Cells[0,0]) <> '')) then
  begin
    // Insiro o Campo na posição mais parecida com que estava
    lstColunas.ItemIndex := lstColunas.Items.Add (strColunas.Cells[0,strColunas.Row]);
    ApagarCampo(strColunas.Row);

    // Atualizo a mensagem que contém os campos selecionados
    lblMensagem.Caption := 'Campos: ';
    for C:=0 to strColunas.RowCount-1 do
      lblMensagem.Caption := lblMensagem.Caption + strColunas.Cells[0,C] + ',';
    lblMensagem.Caption := lblMensagem.Caption + '#';

    if (strColunas.RowCount = 1) and (Trim(strColunas.Cells[0,0]) = '') then
    begin
      bbtnImportar.Enabled := false;
      lblMensagem.Caption  := 'Colunas disponíveis... Selecione as colunas a importar...';
    end;
  end;
end;

procedure TfrmImportacaoDireta.sbtnRemoverTodosCamposClick(Sender: TObject);
var
  c: integer;
begin
  inherited;
  // Somente prossigo se existir dados a manipular
  if (strColunas.RowCount > 1) or
     ((strColunas.RowCount = 1) and (Trim(strColunas.Cells[0,0]) <> '')) then
  begin
    for c:=0 to strColunas.RowCount-1 do
      lstColunas.Items.Add(strColunas.Cells[0,c]);

    LimpaGrid;
    lstColunas.ItemIndex := 0;
    bbtnImportar.Enabled := false;
    lblMensagem.Caption  := 'Colunas disponíveis... Selecione as colunas a importar...';
  end;
end;

procedure TfrmImportacaoDireta.sbtnAbrirConfigClick(Sender: TObject);
var
  F: TextFile;
  bAchou: boolean;
  iPosDelim, C: integer;
  sArqConfig, sLinha, sNomeColuna, sTamColuna: string;
begin
  inherited;
  OpenDlg.Title := 'Abrir uma Configuração de Importação';

  if not(OpenDlg.Execute) then
    sArqConfig := ''
  else
    sArqConfig := OpenDlg.FileName;

  if (sArqConfig <> '') then
    if (FileExists(sArqConfig)) then
    begin
      // Abro o arquivo de configuração
      {$I-}
      AssignFile(F, sArqConfig);
      Reset(F);
      {$I+}

      // Leio o nome da Tabela e verifico se está na lista de Tabelas
      ReadLn(F, sLinha);

      sNomeTabela := TiraCaracter(TiraCaracter(TiraCaracter(sLinha,' '),'['),']');
      bAchou      := false;
      for C:=0 to fctrvImportar.Items.Count-1 do
        if (sNomeTabela = fctrvImportar.Items.Item[C].StringData) then
        begin
          bAchou := true;
          break;
        end;

      if not(bAchou) then
      begin
        MsgDlg('Nome da Tabela não consta na lista !', 'Aviso',mtInformation,[mbOk,mbHelp],0);
        CloseFile(F);
        exit;
      end;

      lblTabela.Caption := 'Tabela : [' +sNomeTabela+ ']';

      // Seleciono campos da tabela
      SelecionaColunas;
      strColunas.RowCount := 1;

      // Leio o nome do campo sequencial da Tabela e verifico se está na lista de campos desta
      ReadLn(F, sLinha);
      sCampoSeq := TiraCaracter(TiraCaracter(TiraCaracter(sLinha,' '),'*'),'*');
      bAchou    := false;

      for C:=0 to lstColunas.Items.Count-1 do
        if (sCampoSeq = lstColunas.Items[C]) then
        begin
          bAchou := true;
          break;
        end;

      if not(bAchou) then
      begin
        MsgDlg('Nome do campo sequencial não consta na lista de campos da Tabela !', 'Aviso',mtInformation,[mbOk,mbHelp],0);
        sCampoSeq := '';
      end
      else
      begin
        lblColunaSeq.Caption := 'Sequencial : [' +sCampoSeq+ ']';
        lstColunas.Items.Delete(lstColunas.Items.IndexOf(sCampoSeq));
      end;

      while not EOF(F) do
      begin
        ReadLn(F, sLinha);

        iPosDelim   := Pos('=',sLinha);
        sNomeColuna := Copy(sLinha,1,iPosDelim-1);
        sTamColuna  := Copy(sLinha,iPosDelim+1,Length(sLinha)-iPosDelim+1);

        if (strColunas.RowCount > 1) then
          strColunas.RowCount := strColunas.RowCount + 1;

        lstColunas.Items.Delete(lstColunas.Items.IndexOf(sNomeColuna));

        strColunas.Cells[0, strColunas.RowCount-1] := sNomeColuna;
        strColunas.Cells[1, strColunas.RowCount-1] := sTamColuna;

        // Exibo mensagem com os campos selecionados
        lblMensagem.Caption := 'Campos: ';
        for C:=0 to strColunas.RowCount-1 do
          lblMensagem.Caption := lblMensagem.Caption + strColunas.Cells[0,C] + ',';
        lblMensagem.Caption := lblMensagem.Caption + '#';

        bbtnImportar.Enabled := true;
      end;
      CloseFile(F);
    end
    else
      MsgDlg('O Caminho ou arquivo especificado não existe !',
             'Aviso', mtInformation,[mbOk,mbHelp],0);
end;

procedure TfrmImportacaoDireta.sbtnSalvarConfigClick(Sender: TObject);
var
  F: TextFile;
  C: integer;
  sArqConfig, sLinha: string;
begin
  inherited;
  SaveDlg.Title := 'Salvar as Configurações de Importação da Tabela selecionada';

  if not(SaveDlg.Execute) then
    sArqConfig := ''
  else
    sArqConfig := SaveDlg.FileName;

  if (sArqConfig <> '') then
    if (FileExists(sArqConfig)) then
    begin
      // Abro o arquivo de configuração
      {$I-}
      AssignFile(F, sArqConfig);
      Rewrite(F);
      {$I+}

      // Leio o nome da Tabela e verifico se está na lista de Tabelas
      WriteLn(F, '[' +sNomeTabela+ ']');

      if (sCampoSeq <> '') then
        WriteLn(F, '*' +sCampoSeq+ '*');

      for C:=0 to strColunas.RowCount-1 do
      begin
        sLinha := strColunas.Cells[0, C] +'='+ strColunas.Cells[1, C];
        WriteLn(F, sLinha);
      end;

      CloseFile(F);
    end
    else
      MsgDlg('O Caminho ou arquivo especificado não existe !',
             'Aviso', mtInformation,[mbOk,mbHelp],0);
end;

procedure TfrmImportacaoDireta.fctrvImportarClick(Sender: TObject);
begin
  inherited;
  sNomeTabela := fctrvImportar.Items.Item[fctrvImportar.Selected.AbsoluteIndex].StringData;

  if (Trim(sNomeTabela) <> '') then
  begin
    lblMensagem.Caption := 'Selecionando colunas... Aguarde...';

    SelecionaColunas;

    lblMensagem.Caption  := 'Colunas disponíveis... Selecione as colunas a importar...';
    lstColunas.ItemIndex := 0;
  end
  else
  begin
    lblMensagem.Caption  := '';
    lstColunas.ItemIndex := -1;
  end;

  lblTabela.Caption    := 'Tabela : [' +sNomeTabela+ ']';
  lblColunaSeq.Caption := 'Sequencial : []';
  sCampoSeq            := '';
  bbtnImportar.Enabled := false;

  LimpaGrid;
end;

procedure TfrmImportacaoDireta.SelecionaColunas;
begin
  qryColunas.Close;
  qryColunas.ParamByName('Entidade').asString := sNomeTabela;
  qryColunas.Open;

  lstColunas.Items.Clear;
  repeat
    lstColunas.Items.Add(qryColunas.FieldByName('COLUMN_NAME').asString);
    qryColunas.Next;
  until (qryColunas.EOF);
  qryColunas.First;
end;

procedure TfrmImportacaoDireta.LimpaGrid;
begin
  strColunas.RowCount   := 1;
  strColunas.Cells[0,0] := '';
  strColunas.Cells[1,0] := '';
end;

function TfrmImportacaoDireta.VerificaCampos: boolean;
var
  C: integer;
begin
  Result := false;
  for C:=0 to strColunas.RowCount-1 do
  begin
    if (Trim(strColunas.Cells[1,C]) = '') then
    begin
      MsgDlg('Tamanho da Coluna '+strColunas.Cells[0,C]+' não preenchido !',
             'Aviso', mtInformation,[mbOk,mbHelp],0);
      exit;
    end;
  end;
  Result := true;
end;

function TfrmImportacaoDireta.VerificaCampoNotNull: boolean;
begin
  Result := false;

  qryColunas.First;
  while not(qryColunas.EOF) do
  begin
    if (qryColunas.FieldByName('NullAble').asString = 'N') then
    begin
      if not(CampoExiste(qryColunas.FieldByName('Column_Name').asString)) then
      begin
        MsgDlg('A coluna '+qryColunas.FieldByName('Column_Name').asString+
               ' é obrigatória e não foi encontrada na lista de colunas a importar !',
               'Aviso', mtInformation,[mbOk,mbHelp],0);
        exit;
      end;
    end;
    qryColunas.Next;
  end;

  Result := true;
end;

function TfrmImportacaoDireta.CampoExiste(sNomeColuna: string): boolean;
var
  C: integer;
begin
  Result := false;

  for C:=0 to strColunas.RowCount-1 do
  begin
    if (strColunas.Cells[0,C] = Trim(sNomeColuna)) or (sCampoSeq = Trim(sNomeColuna)) then
    begin
      Result := true;
      break;
    end;
  end;
end;

function TfrmImportacaoDireta.InListTiposString(sString: string): boolean;
var
  C: integer;
begin
  Result := false;

  for C:=1 to MAX_TIPO_DADO do
    if (TiposDeDado[C] = sString) then
    begin
      Result := true;
      break;
    end;
end;

procedure TfrmImportacaoDireta.LerNomeArquivo(sTitulo: string);
begin
  OpenDlg.Title := 'Importação Direta de Dados - ' + sTitulo;

  if not(OpenDlg.Execute) then
    sNomeArq := ''
  else
    sNomeArq := OpenDlg.FileName;
end;

procedure TfrmImportacaoDireta.InserirCampo(iLinha:integer; sItem:string);
var
  C: integer;
begin
  for C:=strColunas.RowCount-1 DownTo iLinha do
    strColunas.Cells[0,C+1] := strColunas.Cells[0,C];
  strColunas.Cells[0,iLinha] := sItem;
end;

procedure TfrmImportacaoDireta.ApagarCampo(iLinha: integer);
var
  c: integer;
begin
  // Se a linha a apagar for a ultima, basta diminuir o RowCount
  // Senao, as linhas posteriores devem ser deslocadas de uma posição
  if (iLinha <> strColunas.RowCount-1) then
    for c:=iLinha to strColunas.RowCount-1 do
    begin
      strColunas.Cells[0,c] := strColunas.Cells[0,c+1];
      strColunas.Cells[1,c] := strColunas.Cells[1,c+1];
    end;

  strColunas.Cells[0,strColunas.RowCount-1] := '';
  strColunas.RowCount := strColunas.RowCount - 1;
end;

function TfrmImportacaoDireta.TrataCampo(sLinha:string; var sErro:string): boolean;
var
  iTamConteudo, iUltPosicao, C: integer;
  sConteudo, sSQLFields, sSQLValues: string;
begin
  Result := false;

  // ler campo a campo da linha formando a string a inserir
  sSQLFields:=''; sSQLValues:=''; iUltPosicao:=1;

  if (sCampoSeq <> '') then
  begin
    sSQLFields := sCampoSeq;

    Inc(iIndice);

    sSQLValues := IntToStr(iIndice);
  end;

  for C:=0 to strColunas.RowCount-1 do
  begin

    if (sSQLFields = '') then
      sSQLFields := strColunas.Cells[0,C]
    else
      sSQLFields := sSQLFields +','+ strColunas.Cells[0,C];

    iTamConteudo := StrToInt(strColunas.Cells[1,C]);
    sConteudo    := Copy(sLinha,iUltPosicao,iTamConteudo);
    iUltPosicao  := iUltPosicao + iTamConteudo;

    // Adicionar o conteudo a string de conteudos de acordo com o seu tipo
    if not(qryColunas.Locate('COLUMN_NAME',Trim(strColunas.Cells[0,C]),[loCaseInsensitive])) then
      exit;

    if (Trim(sConteudo) = '') then
    begin
      sConteudo := 'NULL';
      if (sSQLValues = '') then
        sSQLValues := sConteudo
      else
        sSQLValues := sSQLValues+', '+sConteudo;
    end
    else
    begin
      if (InlistTiposString(qryColunas.FieldByName('DATA_TYPE').asString)) then
      begin //conteudo é do tipo String
        if (sSQLValues = '') then
          sSQLValues := QuotedStr(sConteudo)
        else
          sSQLValues := sSQLValues +', '+ QuotedStr(sConteudo);
      end
      else
      begin
        if (qryColunas.FieldByName('DATA_TYPE').asString = 'DATE') then
        begin // conteudo é do tipo Data
          if (sSQLValues = '') then
            sSQLValues := 'TO_DATE(' +QuotedStr(sConteudo)+ ',''DD/MM/YYYY'')'
          else
            sSQLValues := sSQLValues + ', TO_DATE('+QuotedStr(sConteudo)+ ',''DD/MM/YYYY'')';
        end
        else
        begin // conteudo é do tipo Numerico
          if (sSQLValues = '') then
            sSQLValues := sConteudo
          else
            sSQLValues := sSQLValues +', '+ sConteudo
        end;
      end;
    end;
  end;

  // Gravar linha
  with (qryAux) do
  begin
    Close;
    SQL.Clear;
    SQL.Add(' INSERT INTO ' +sNomeTabela+ '(' +sSQLFields+ ') VALUES (' +sSQLValues+ ')');
    try
      ExecSQL;
    except
      on E: EDBEngineError do
      begin
        sErro := E.Message;
        exit;
      end;
    end;
  end;

  Result := true;
end;

procedure TfrmImportacaoDireta.ImportarArquivo(sImportacao: string);
var
  F: TextFile;
  sErro, sLinha: string;
  c: integer;
  iSequence, iNumRegistros, iLinha: LongInt;
begin
  rgrpOperacao.Enabled    := false;
  chkExibirLinhas.Enabled := false;
  if (chkExibirLinhas.Checked) then
    chkPararEmErro.Enabled := false;

  if (rgrpOperacao.ItemIndex = 0) then
    lblApagandoTab.Font.Style := [fsStrikeOut];

  if (chkExibirLinhas.Checked) then
  begin
    bbtnVoltar.Enabled   := true;
    bbtnImportar.Enabled := false;
    pnlOpcoes.SendToBack;
    pnlResult.BringToFront;
  end;

  memResult.Lines.Clear;
  memResult.Lines.Add('Importação Direta de Dados - Data : '+DateTimeToStr(date)+' - Usuário : '+Sistema.NomeUsuario);
  memResult.Lines.Add('   Arquivo : '+sImportacao+' ['+sNomeArq+']');
  memResult.Lines.Add(Replicate('_',63));
  memResult.Lines.Add('');

  pbProgresso.Position := 0;

  {$I-}
  AssignFile(F, sNomeArq);
  Reset(F);
  {$I+}

  // Pega o número de registros do arquivo
  iNumRegistros := 0;
  while not EOF(F) do
  begin
    ReadLn(F, sLinha);
    Inc (iNumRegistros);
  end;
  pbProgresso.Max := iNumRegistros;

  if (iNumRegistros = 0) then
  begin
    MsgDlg('Arquivo não contém dados !', 'Aviso', mtInformation,[mbOk,mbHelp],0);
    exit;
  end;

  if (rgrpOperacao.ItemIndex = 1) then
  begin
    lblApagandoTab.Font.Color := clRed;
    lblApagandoTab.Repaint;
    qryAux.Close;
    qryAux.SQL.Clear;
    qryAux.SQL.Add('DELETE FROM '+sNomeTabela);
    try
      qryAux.ExecSQL;
    except
      MsgDlg('Não pude excluir os dados da tabela: '+sNomeTabela+' !', 'Aviso', mtInformation,[mbOk,mbHelp],0);
      exit;
    end;
    imgApagandoTab.Picture := imgChecked.Picture;
    imgApagandoTab.Repaint;
    lblApagandoTab.Font.Color := clNavy;
    lblApagandoTab.Repaint;
  end;

  if (sCampoSeq <> '') then
  begin
    if (rgrpOperacao.ItemIndex = 1) then
      iIndice := 0
    else
    begin
      iSequence := LeUltRegistro(nil,sNomeTabela);
      with (qryAux.SQL) do
      begin
        Clear;
        Add ('SELECT NVL(MAX(' +sCampoSeq+ '),0) AS ULTIMO FROM ' +sNomeTabela);
      end;
      qryAux.Open;
      iIndice := Trunc(qryAux.FieldByName('ULTIMO').asFloat);

      if (iIndice > iSequence) then
        for c:=iSequence to iIndice do
          LeUltRegistro(nil,sNomeTabela)
      else
        iIndice := LeUltRegistro(nil,sNomeTabela);

      Dec(iIndice);
    end;
  end;

  lblGerandoReg.Font.Color := clRed;
  lblGerandoReg.Repaint;

  // Fecho e Abro novamente o arquivo para consulta das linhas
  CloseFile(F);
  {$I-}
  AssignFile(F, sNomeArq);
  Reset(F);
  {$I+}

  iLinha:=1;
  while not EOF(F) do
  begin
    ReadLn(F, sLinha);

    if not(TrataCampo(sLinha, sErro)) then
    begin
      memResult.Lines.Add('Erro [linha '+IntToStr(iLinha)+']: '+sLinha);
      memResult.Lines.Add('     ----------------------------------------------------------');
      memResult.Lines.Add('     Mensagem de Erro do Banco de Dados para a linha anterior :');
      memResult.Lines.Add('     MSG : '+sErro);
      memResult.Lines.Add('     ----------------------------------------------------------');

      if (chkExibirLinhas.Checked) and (chkPararEmErro.Checked) then
      begin
        if (MsgDlg('Erro [linha '+IntToStr(iLinha)+']. Deseja continuar ? ','Erro',
            mtError,[mbYes,mbNo,mbHelp],0) = mrNo) then
        begin
          CloseFile(F);
          exit;
        end;
      end;
    end
    else
      memResult.Lines.Add(' OK   [linha '+IntToStr(iLinha)+']: '+sLinha);

    inc(iLinha);

    pbProgresso.StepIt;
  end;
  CloseFile(F);
  imgGerandoReg.Picture := imgChecked.Picture;

  if not(chkExibirLinhas.Checked) then
  begin
    bbtnVoltar.Enabled   := true;
    bbtnImportar.Enabled := false;
    pnlOpcoes.SendToBack;
    pnlResult.BringToFront;
  end;

  lblGerandoReg.Font.Color := clNavy;
  lblGerandoReg.Repaint;
  bbtnSalvarLOG.Enabled := true;
end;

end.
