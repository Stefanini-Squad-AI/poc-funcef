// *****************************************************************************
// ***************************** REGISTRO DE ALTERAÇÕES ************************
// *****************************************************************************
// Autor(a)    :  Ádler Teodoro de Souza
// Data        :  19/02/2009
// Pendência   : SOL 109421 KINTANA 496332
// Descricao   :  Alteração de gravação de arquivos de log na raiz do disco C: .
//------------------------------------------------------------------------------

unit fCadTabGener;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs, fCadastroCS,
  wwdblook, StdCtrls, Mask, wwdbedit, DBCtrls, Grids, Wwdbigrd, Wwdbgrid, ComCtrls,
  CmEventosCadastro, ImgList, Db, Wwdatsrc, MontaSelect, DBTables, IvDictio, IvMulti,
  IvEMulti, Wwquery, MAHlpBtn, Buttons, TB97Tlbr, TB97Ctls, TB97, ExtCtrls, Menus,
  TabControlDetalhe, DBCGrids, fcLabel, CheckLst, USistema;

type
  TfrmCadTabGener = class(TfrmCadastroCS)
    pnlMestre: TPanel;
    Label1: TLabel;
    Label2: TLabel;
    dbedNome: TwwDBEdit;
    dbedDescricao: TwwDBEdit;
    qryTipoDado: TwwQuery;
    dsCampos: TwwDataSource;
    qryCampos: TwwQuery;
    updCampos: TUpdateSQL;
    qryLinhas: TwwQuery;
    dsFormulas: TwwDataSource;
    qryFormulas: TwwQuery;
    dsRegras: TwwDataSource;
    qryRegras: TwwQuery;
    pgctrlDetalhe: TPageControl;
    tbshDet: TTabSheet;
    tbshCampos: TTabSheet;
    dbgrdCampos: TwwDBGrid;
    pnlControlesCampos: TPanel;
    Label3: TLabel;
    Label4: TLabel;
    Label5: TLabel;
    dbedCodigoCampo: TwwDBEdit;
    dbedDescrCampo: TwwDBEdit;
    dblkcmbTipoCampo: TwwDBLookupCombo;
    dc97Col: TDock97;
    tb97Col: TToolbar97;
    sbtnInserirDet: TToolbarButton97;
    sbtnAlterarDet: TToolbarButton97;
    sbtnExcluirDet: TToolbarButton97;
    tbshFormulas: TTabSheet;
    dbrgFormulas: TwwDBGrid;
    tbshRegras: TTabSheet;
    dbgrRegras: TwwDBGrid;
    dc97OkCancel: TDock97;
    tb97Detalhe: TToolbar97;
    bbtnOkDet: TBitBtn;
    bbtnCancelarDet: TBitBtn;
    Sd: TSaveDialog;
    qryAux: TwwQuery;
    sgdrLinhas: TStringGrid;
    pmnuLinhas: TPopupMenu;
    mnuiInserirAntes: TMenuItem;
    mnuiExcluir: TMenuItem;
    mnuiInserirDepois: TMenuItem;
    mnuiLine: TMenuItem;
    Toolbar972: TToolbar97;
    sbtnExportar: TSpeedButton;
    sbtnImportar: TSpeedButton;
    ToolbarSep973: TToolbarSep97;
    pnlIE: TPanel;
    bvFundo1: TBevel;
    bvFundo2: TBevel;
    btnOk: TBitBtn;
    btnSair: TBitBtn;
    lblTituloIE: TLabel;
    tbbtSelArq: TToolbarButton97;
    lblDescrArqIE: TLabel;
    chklstCampos: TCheckListBox;
    Label8: TLabel;
    pbProgresso: TProgressBar;
    lblArquivoSel: TLabel;
    Bevel1: TBevel;
    procedure FormCreate(Sender: TObject);
    procedure dsStateChange(Sender: TObject);
    procedure CmeCadastroFind(Sender: TObject);
    procedure CmeCadastroAtualizaBotoes(Sender: TObject);
    procedure CmeCadastroInsert(Sender: TObject);
    procedure CmeCadastroEdit(Sender: TObject);
    procedure CmeCadastroConfirma(Sender: TObject);
    procedure CmeCadastroCancel(Sender: TObject);
    procedure pgctrlDetalheChanging(Sender: TObject; var AllowChange: Boolean);
    procedure sgdrLinhasDrawCell(Sender: TObject; ACol, ARow: Integer; Rect: TRect;
      State: TGridDrawState);
    procedure sgdrLinhasSelectCell(Sender: TObject; ACol, ARow: Integer; var
      CanSelect: Boolean);
    procedure sgdrLinhasGetEditMask(Sender: TObject; ACol, ARow: Integer; var Value: String);
    procedure sgdrLinhasKeyPress(Sender: TObject; var Key: Char);
    procedure sbtnInserirClick(Sender: TObject);
    procedure sbtnApagarClick(Sender: TObject);
    procedure sbtnInserirDetClick(Sender: TObject);
    procedure sbtnAlterarDetClick(Sender: TObject);
    procedure sbtnExcluirDetClick(Sender: TObject);
    procedure bbtnOkDetClick(Sender: TObject);
    procedure bbtnCancelarDetClick(Sender: TObject);
    procedure bbtnSairClick(Sender: TObject);
    procedure mnuiInserirAntesClick(Sender: TObject);
    procedure mnuiExcluirClick(Sender: TObject);
    procedure dbgrdCamposDblClick(Sender: TObject);
    procedure mnuiInserirDepoisClick(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure bbtnConfirmarClick(Sender: TObject);
    procedure btnSairClick(Sender: TObject);
    procedure btnOkClick(Sender: TObject);
    procedure tbbtSelArqClick(Sender: TObject);
    procedure chklstCamposDrawItem(Control: TWinControl;
      Index: Integer; Rect: TRect; State: TOwnerDrawState);
    procedure chklstCamposClickCheck(Sender: TObject);
    procedure chklstCamposKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure sbtnImportarClick(Sender: TObject);
  private
    LinhasArquivo, lstCodCampo: TStringList;
    sColuna, sLinha, sArquivo, sOldCodCampo: string;
    bImportacao, bSairCadastro: boolean;

    procedure SelecionarTabelas(ID: string);
    procedure CarregaListaCodCampo(ID: string);
    procedure ApagaLinhas;
    procedure CarregaLinhas;
    function  LinhaVazia(Linha: integer): boolean;
    function  ExisteLinhaVazia: boolean;
    function  VerificaMestre: boolean;
    procedure FazerVoltarDet;
    procedure AtualizaBotoesDetalhe;
    procedure CancelDetalhe;
    procedure HabilitaBotoes(Opcao: boolean);
    procedure HabilitaBtOkIE;
    procedure AtualizarCamposIE;
  end;

var
  frmCadTabGener: TfrmCadTabGener;

implementation

uses uCMTypes, FileCtrl, uMensErro, uDataBase, uFuncoesUteisRH, uAutorizacao, dBaseDados,
  fAguarde;

{$R *.DFM}

procedure TfrmCadTabGener.FormCreate(Sender: TObject);
begin
  inherited;
  LinhasArquivo := TStringList.Create;
  lstCodCampo   := TStringList.Create;

  qryTipoDado.Open;
  SelecionarTabelas('-7777777');

  pnlControlesCampos.SendToBack;
  pgctrlDetalhe.ActivePageIndex := 0;
  bSairCadastro := false;
end;

procedure TfrmCadTabGener.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  inherited;
  LinhasArquivo.Free;
  lstCodCampo.Free;
end;

procedure TfrmCadTabGener.chklstCamposDrawItem(Control: TWinControl;
  Index: Integer; Rect: TRect; State: TOwnerDrawState);
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

procedure TfrmCadTabGener.dsStateChange(Sender: TObject);
begin
  inherited;
  if (qry.State in [dsInsert, dsEdit]) then
  begin
    sgdrLinhas.Options   := sgdrLinhas.Options + [goEditing];
    sgdrLinhas.PopupMenu := pmnuLinhas;
  end
  else
  begin
    sgdrLinhas.Options   := sgdrLinhas.Options - [goEditing];
    sgdrLinhas.PopupMenu := nil;
  end;

  AtualizaBotoesDetalhe;
  tbshDet.Enabled := not(qryCampos.IsEmpty);
end;

procedure TfrmCadTabGener.chklstCamposKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  if (Key = VK_TAB) then
    chklstCamposClickCheck(Sender);
end;

procedure TfrmCadTabGener.CmeCadastroFind(Sender: TObject);
begin
  inherited;
  if (MontaSelect.RetornouValor) then
  begin
    CarregaListaCodCampo(MontaSelect.ValoresChave[0]);
    SelecionarTabelas(MontaSelect.ValoresChave[0]);
    pgctrlDetalhe.ActivePageIndex := 0;
  end;
  sbtnImportar.Enabled := false;
  sbtnExportar.Enabled := not(qry.IsEmpty);
//  sArquivo := 'C:\'+Trim(dbedNome.Text)+'.TXT';
  sArquivo := Sistema.RetornaCaminhoArquivos(Sistema.IdEmpresa)+ Trim('\'+dbedNome.Text)+'.TXT'; //Ádler Teodoro de Souza SOL 109421 KINTANA 496332

end;

procedure TfrmCadTabGener.CmeCadastroAtualizaBotoes(Sender: TObject);
begin
  inherited;
  AtualizaBotoesDetalhe;
  pnlMestre.Enabled := pnlFundo.Enabled;
  pnlFundo.Enabled  := true;
end;

procedure TfrmCadTabGener.CmeCadastroInsert(Sender: TObject);
begin
  inherited;
  sbtnImportar.Enabled := not(qry.IsEmpty);
  pgctrlDetalhe.ActivePageIndex := 1;
  AtualizaBotoesDetalhe;
  dbedNome.ReadOnly := false;
  dbedNome.SetFocus;
end;

procedure TfrmCadTabGener.CmeCadastroEdit(Sender: TObject);
begin
  inherited;
  sbtnImportar.Enabled   := not(qry.IsEmpty);  
  sbtnInserirDet.Enabled := true;
  sbtnAlterarDet.Enabled := not(qryCampos.IsEmpty);
  sbtnExcluirDet.Enabled := not(qryCampos.IsEmpty);
  dbedNome.ReadOnly      := not(qryCampos.IsEmpty);

  if (dbedNome.ReadOnly) then
    dbedDescricao.SetFocus
  else
    dbedNome.SetFocus;
end;

procedure TfrmCadTabGener.CmeCadastroConfirma(Sender: TObject);
var
  x, y: integer;
  sValor: string;  
begin
  FazerVoltarDet;
  AtualizaBotoesDetalhe;

  frmAguarde.Mostra('Gravando Dados...');
  frmAguarde.Refresh;
  frmAguarde.Pos := 0;
  frmAguarde.Min := 0;
  frmAguarde.Max := sgdrLinhas.RowCount;

  if (qry.State = dsEdit) or ((qry.State = dsInsert) and
     (sgdrLinhas.RowCount >= 2) and not(LinhaVazia(1))) then
  begin
    try
      qryAux.SQL.Clear;
      qryAux.SQL.Add ('DELETE VALTABGENER WHERE CODTABELA = ' +QuotedStr(qry.FieldByName('CODTABELA').asString));
      qryAux.ExecSQL;

      qryCampos.First;
      while not(qryCampos.EOF) do
      begin
        qryCampos.Edit;
        qryCampos.FieldByName('CODTABELA').asString := qry.FieldByName('CODTABELA').asString;
        qryCampos.Post;
        qryCampos.Next;
      end;

      AplicaAlteracoes([qry, qryCampos]);

      if (sgdrLinhas.RowCount >= 2) and not(LinhaVazia(1)) then
        for y:=1 to sgdrLinhas.RowCount-1 do
        begin
          frmAguarde.Pos := frmAguarde.Pos + 1;

          for x:=1 to sgdrLinhas.ColCount-1 do
          begin
            if (qryCampos.Locate('CODCAMPO',sgdrLinhas.Cells[x,0],[])) and
               (Copy(qryCampos.FieldByName('TIPODADO').asString,1,1) = 'N') then
              sValor := TrocaCaracter(sgdrLinhas.Cells[x,y],',','.')
            else
              sValor := sgdrLinhas.Cells[x,y];

            qryAux.SQL.Clear;
            qryAux.SQL.Add ('INSERT INTO VALTABGENER (CODTABELA, NUMLINHA, CODCAMPO, VALOR) VALUES (' +
              QuotedStr(qry.FieldByName('CODTABELA').asString) +', '+
              sgdrLinhas.Cells[0,y] +', '+
              QuotedStr(sgdrLinhas.Cells[x,0]) +', '+
              QuotedStr(sValor) +')');
            qryAux.ExecSQL;
          end;
        end;
    except
      MsgDlg('Ocorreu algum erro na gravação final desta tabela !', 'Erro', mtError, [mbOk],0);
    end;

    qryLinhas.Close;
    qryLinhas.Open;
    CarregaListaCodCampo(qry.FieldByName('CODTABELA').asString);
    CarregaLinhas;
  end
  else
  begin
    try
      AplicaAlteracoes([qry, qryCampos]);
    except
      MsgDlg( 'Ocorreu algum erro na gravação final desta tabela !', 'Erro', mtError, [mbOk],0);
    end;
  end;

  inherited;  
  frmAguarde.Apaga;
end;

procedure TfrmCadTabGener.CmeCadastroCancel(Sender: TObject);
begin
  if not(bSairCadastro) then
  begin
    CancelDetalhe;
    sgdrLinhas.Options := sgdrLinhas.Options - [goEditing];

    qry.CancelUpdates;
    qryCampos.CancelUpdates;

    CarregaLinhas;
  end;
  inherited;
end;

procedure TfrmCadTabGener.pgctrlDetalheChanging(Sender: TObject; var AllowChange: Boolean);
begin
  AllowChange := not(qryCampos.State in [dsInsert, dsEdit]) and
    ((Trim(dbedNome.Text) <> '') or (qry.IsEmpty));
end;

procedure TfrmCadTabGener.sgdrLinhasDrawCell(Sender: TObject; ACol, ARow: Integer;
  Rect: TRect; State: TGridDrawState);
begin
  with (sgdrLinhas.Canvas) do
  begin
    if (ACol = 0) or (ARow = 0) then
    begin
      Brush.Color := clBtnFace;
      Font.Color  := clBlack;
      Font.Style  := [fsBold];

      FillRect (Rect);
      if (ACol = 0) and (ARow > 0) then
      begin
        Pen.Color := clBlack;
        DrawLine(sgdrLinhas.Canvas, Rect.Left,  Rect.Bottom, Rect.Right, Rect.Bottom);
        DrawLine(sgdrLinhas.Canvas, Rect.Right, Rect.Bottom, Rect.Right, Rect.Top);
        Pen.Color := clWhite;
        DrawLine(sgdrLinhas.Canvas, Rect.Left, Rect.Top, Rect.Right, Rect.Top);
        DrawLine(sgdrLinhas.Canvas, Rect.Left, Rect.Top, Rect.Left, Rect.Bottom);
      end;
    end
    else
      FillRect (Rect);

    TextOut(Rect.Left+2, Rect.Top+2, sgdrLinhas.Cells[ACol, ARow]);
  end;
end;

procedure TfrmCadTabGener.sgdrLinhasSelectCell(Sender: TObject; ACol, ARow: Integer;
  var CanSelect: Boolean);
begin  // Não permite a seleção da primeira coluna
  CanSelect := (ACol > 0) and (ARow > 0);
end;

procedure TfrmCadTabGener.sgdrLinhasGetEditMask(Sender: TObject; ACol, ARow: Integer;
  var Value: String);
begin
  // Indica a máscara para a edição de uma Data
  if (qryCampos.Locate('CODCAMPO',sgdrLinhas.Cells[ACol, 0],[])) and
     (Copy(qryCampos.FieldByName('TIPODADO').asString,1,1) = 'D') then
    Value := '00/00/0000;1';
end;

procedure TfrmCadTabGener.sgdrLinhasKeyPress(Sender: TObject; var Key: Char);
begin
  if not(goEditing in sgdrLinhas.Options) then
    exit;

  if (goEditing in sgdrLinhas.Options) and (sgdrLinhas.RowCount = 2) and
     (Trim(sgdrLinhas.Cells[0, 1]) = '') then
    sgdrLinhas.Cells[0, 1] := '1';

  // Somente permite Inserir uma Linha se for pressionado as teclas DOWN ou ENTER,
  // estiver em modo de edição e a linha atual for a última do Grid
  if (Ord(Key) = VK_RETURN) and not(goEditing  in sgdrLinhas.Options) and
     (sgdrLinhas.Row = sgdrLinhas.RowCount-1) then
    Key := #0;

  // Permite entrada dos caracteres de movimentação, inserir um caracter se o campo atual
  // for deste tipo
  // Para Alfanumérico (A) -> Todos
  // Para Data         (D) -> Todos (pois já formatei este campo no evento "OnGetEditMask")
  // Para Numérico     (N) -> Números de 0 a 9 e os caracteres "-" e ","
  if not(Ord(Key) in [VK_TAB, VK_BACK, VK_SPACE, VK_RETURN]) and
     ((qryCampos.Locate('CODCAMPO',sgdrLinhas.Cells[sgdrLinhas.Col, 0],[])) and
      (Copy(qryCampos.FieldByName('TIPODADO').asString,1,1) = 'N') and
      (not(Key in ['0'..'9','-',',']) or
       ((Key = ',') and (Pos(',',sgdrLinhas.Cells[sgdrLinhas.Col, sgdrLinhas.Row]) > 0)))) then
    Key := #0;

  // Se for uma tecla válida ponho a letra em maiúsculo
  if (Key <> #0) and (Ord(Key) <> VK_RETURN) then
    Key := UpCase(Key);
end;

procedure TfrmCadTabGener.sbtnInserirClick(Sender: TObject);
begin
  if not(qry.IsEmpty) then
  begin
    lstCodCampo.Clear;
    SelecionarTabelas('-7777777');
  end;
  inherited;
end;

procedure TfrmCadTabGener.sbtnApagarClick(Sender: TObject);
begin
  if (not(qryRegras.IsEmpty) and (MsgDlg('Há' +IFF(qryRegras.IsEmpty,'',' Regras ')+
      IFF(qryFormulas.IsEmpty, '', IFF(qryRegras.IsEmpty,'','e')+ ' Fórmulas ')+
      'que utilizam esta tabela genérica!' +CR_LF+ 'Deseja excluir assim mesmo?',
      'Exclusão', mtConfirmation, [mbYes, mbNo],0) = mrNo)) then
  begin
    sbtnApagar.Down := false;
    exit;
  end;

  if ((qryFormulas.IsEmpty) or (qryRegras.IsEmpty)) and
     (MsgDlg('Deseja realmente excluir este registro ?', 'Exclusão', mtConfirmation,
     [mbYes,mbNo],0) = mrNo) then
  begin
    sbtnApagar.Down := false;
    exit;
  end;

  frmAguarde.Mostra('Apagando Dados...');
  frmAguarde.Refresh;
  frmAguarde.Pos := 0;
  frmAguarde.Min := 0;
  frmAguarde.Max := 5;

  try
    qryAux.SQL.Clear;
    qryAux.SQL.Add ('DELETE VALTABGENER WHERE CODTABELA = ' +QuotedStr(qry.FieldByName('CODTABELA').asString));
    qryAux.ExecSQL;

    frmAguarde.Pos := frmAguarde.Pos + 1;

    qryAux.SQL.Clear;
    qryAux.SQL.Add ('DELETE CAMPOTABGENER WHERE CODTABELA = ' +QuotedStr(qry.FieldByName('CODTABELA').asString));
    qryAux.ExecSQL;

    frmAguarde.Pos := frmAguarde.Pos + 1;

    qry.Delete;

    frmAguarde.Pos := frmAguarde.Pos + 1;

    AplicaAlteracoes([qry]);

    frmAguarde.Pos := frmAguarde.Pos + 1;
  finally
    lstCodCampo.Clear;
  end;

  SelecionarTabelas('-7777777');

  frmAguarde.Pos := frmAguarde.Pos + 1;
  frmAguarde.Apaga;
  sbtnApagar.Down := false;
end;

procedure TfrmCadTabGener.sbtnInserirDetClick(Sender: TObject);
begin
  sbtnInserirDet.Enabled := false;
  sbtnInserirDet.Down    := true;  
  sbtnAlterarDet.Enabled := false;
  sbtnExcluirDet.Enabled := false;

  dbgrdCampos.SendToBack;
  dbedCodigoCampo.SetFocus;
  tb97Detalhe.Visible  := true;
  dc97OkCancel.Visible := true;

  qryCampos.Insert;
end;

procedure TfrmCadTabGener.sbtnAlterarDetClick(Sender: TObject);
begin
  sbtnAlterarDet.Down    := true;
  sbtnInserirDet.Enabled := false;
  sbtnAlterarDet.Enabled := false;
  sbtnExcluirDet.Enabled := false;

  dbgrdCampos.SendToBack;
  dbedCodigoCampo.SetFocus;
  tb97Detalhe.Visible  := true;
  dc97OkCancel.Visible := true;

  sOldCodCampo := qryCampos.FieldByName('CODCAMPO').asString;  
  qryCampos.Edit;
end;

procedure TfrmCadTabGener.sbtnExcluirDetClick(Sender: TObject);
var
  x, y, iNumCol: integer;
begin
  if (MsgDlg('Deseja excluir este campo?', 'Exclusão', mtConfirmation, [mbYes,mbNo],0) = mrYes) then
  begin
    frmAguarde.Mostra('Apagando Campo...');
    frmAguarde.Refresh;
    frmAguarde.pbAguarde.Visible := false;

    // Procura o campo
    iNumCol := 1;
    for x:=1 to sgdrLinhas.ColCount-1 do
      if (sgdrLinhas.Cells[x,0] = qryCampos.FieldByName('CODCAMPO').asString) then
        iNumCol := x;

    // Substitui coluna
    for x:=iNumCol to sgdrLinhas.ColCount-2 do
    begin
      frmAguarde.Pos := frmAguarde.Pos + 1;

      for y:=0 to sgdrLinhas.RowCount-1 do
      begin
        sgdrLinhas.Cells[x,y]   := sgdrLinhas.Cells[x+1,y];
        sgdrLinhas.Cells[x+1,y] := '';
      end;
    end;

    sgdrLinhas.ColCount := sgdrLinhas.ColCount - 1;

    qryCampos.Delete;
    AtualizaBotoesDetalhe;

    frmAguarde.pbAguarde.Visible := true;
    frmAguarde.Apaga;
  end;

  sbtnExcluirDet.Down := false;
end;

procedure TfrmCadTabGener.bbtnOkDetClick(Sender: TObject);
var
  x, y, iNumCol: integer;
  UltEstadoQuery: TDataSetState;
begin
  if (Trim(dbedCodigoCampo.Text) = '') then
  begin
    MsgDlg('Falta indicar o Código do Campo !', 'Erro', mtError, [mbOk],0);
    dbedCodigoCampo.SetFocus;
    exit;
  end;

  if (Trim(dblkcmbTipoCampo.Text) = '') then
  begin
    MsgDlg('Falta selecionar o Tipo de Dado !', 'Erro', mtError, [mbOk],0);
    dblkcmbTipoCampo.SetFocus;
    exit;
  end;

  qryCampos.FieldByName('CODTABELA').asString := qry.FieldByName('CODTABELA').asString;
  qryCampos.FieldByName('TIPODADO').asString  := qryTipoDado.FieldByName('NOMETIPODADO').asString;

  // Na inserção de um campo procure o campo em ordem alfabética
  if (qryCampos.State = dsInsert) then
  begin
    frmAguarde.Mostra('Incluindo Campo...');
    frmAguarde.Refresh;
    frmAguarde.pbAguarde.Visible := false;

    // Obtenho a posição ordenada do Campo dentro do Grid
    iNumCol := 1;
    for x:=1 to sgdrLinhas.ColCount-1 do
    begin
      if (x = sgdrLinhas.ColCount-1) then // Se estou na última coluna...
      begin
        if (sgdrLinhas.Cells[x,0] < qryCampos.FieldByName('CODCAMPO').asString) then
          iNumCol := x+1
        else
          iNumCol := x;
      end
      else
      if (qryCampos.FieldByName('CODCAMPO').asString < sgdrLinhas.Cells[x,0]) then
      begin
        iNumCol := x;
        break;
      end;
    end;

    // Insiro uma coluna
    sgdrLinhas.ColCount := sgdrLinhas.ColCount + 1;

    // Desloco as colunas necessárias
    if (iNumCol < sgdrLinhas.ColCount-1) then
    begin
      for x:=sgdrLinhas.ColCount-1 DownTo iNumCol do
        for y:=0 to sgdrLinhas.RowCount-1 do
        begin
          sgdrLinhas.Cells[x+1,y] := sgdrLinhas.Cells[x,y];
          sgdrLinhas.Cells[x,y]   := '';
        end;
    end;

    // Atribuo o título da coluna
    sgdrLinhas.Cells[iNumCol,0] := qryCampos.FieldByName('CODCAMPO').asString;

    frmAguarde.pbAguarde.Visible := true;
    frmAguarde.Apaga;
  end
  else
  begin // Na edição de um campo troque o CODCAMPO das LinhasArquivo referentes
    for x:=1 to sgdrLinhas.ColCount-1 do
      if (sgdrLinhas.Cells[x,0] = sOldCodCampo) then
        sgdrLinhas.Cells[x,0] := qryCampos.FieldByName('CODCAMPO').asString;
  end;

  if (qryCampos.State in [dsInsert, dsEdit]) then
  begin
    UltEstadoQuery := qryCampos.State;
    try
      qryCampos.Post;
      if (UltEstadoQuery = dsInsert) then // Repete a inserção do detalhe se for inserção
      begin
        qryCampos.Insert;
        dbedCodigoCampo.SetFocus;
      end
      else
        FazerVoltarDet;
    except
      on E: Exception do
        ShowMessage(E.Message);
    end;
    AtualizaBotoesDetalhe;
  end;
end;

procedure TfrmCadTabGener.bbtnCancelarDetClick(Sender: TObject);
begin
  CancelDetalhe;
end;

procedure TfrmCadTabGener.bbtnConfirmarClick(Sender: TObject);
begin
  if (Trim(dbedNome.Text) = '') then
    MsgDlg('Primeiro indique o nome da tabela!', 'Erro', mtError, [mbOk],0)
  else
    inherited;
end;

procedure TfrmCadTabGener.bbtnSairClick(Sender: TObject);
begin
  bSairCadastro := true;
  inherited;
end;

procedure TfrmCadTabGener.mnuiInserirAntesClick(Sender: TObject);
var
  x, y: integer;
begin
  // Crio uma nova linha em branco antes da linha atualmente posicionada no Grid
  // se não houver LinhasArquivo vazias
  if not(ExisteLinhaVazia) then
  begin
    sgdrLinhas.RowCount := sgdrLinhas.RowCount + 1;

    // Insiro uma linha no meio do grid
    for y:=sgdrLinhas.RowCount-1 DownTo sgdrLinhas.Row do
      for x:=1 to sgdrLinhas.ColCount-1 do
        sgdrLinhas.Cells[x,y] := sgdrLinhas.Cells[x,y-1];

    sgdrLinhas.Cells[0, sgdrLinhas.RowCount-1] := IntToStr(sgdrLinhas.RowCount-1);

    // Apago todas as strings que possam existir na linha inserida
    for x:=1 to sgdrLinhas.ColCount-1 do
      sgdrLinhas.Cells[x, sgdrLinhas.Row] := '';
  end;
end;

procedure TfrmCadTabGener.mnuiInserirDepoisClick(Sender: TObject);
var
  x, y: integer;
begin
  // Crio uma nova linha em branco depois da linha atualmente posicionada no Grid
  // se não houver LinhasArquivo vazias
  if not(ExisteLinhaVazia) then
  begin
    sgdrLinhas.RowCount := sgdrLinhas.RowCount + 1;

    // Insiro uma linha no meio do grid
    for y:=sgdrLinhas.RowCount-2 DownTo sgdrLinhas.Row+1 do
      for x:=1 to sgdrLinhas.ColCount-1 do
        sgdrLinhas.Cells[x,y+1] := sgdrLinhas.Cells[x,y];

    sgdrLinhas.Cells[0, sgdrLinhas.RowCount-1] := IntToStr(sgdrLinhas.RowCount-1);

    // Apago todas as strings que possam existir na linha inserida
    sgdrLinhas.Row := sgdrLinhas.Row + 1;
    for x:=1 to sgdrLinhas.ColCount-1 do
      sgdrLinhas.Cells[x, sgdrLinhas.Row] := '';
  end;
end;

procedure TfrmCadTabGener.mnuiExcluirClick(Sender: TObject);
var
  x,y: integer;
begin
  if (MsgDlg('Deseja excluir esta linha?', 'Exclusão', mtConfirmation, [mbYes,mbNo],0) = mrYes) then
  begin
    for y:=sgdrLinhas.Row to sgdrLinhas.RowCount-2 do
      for x:=1 to sgdrLinhas.ColCount-1 do
        sgdrLinhas.Cells[x,y] := sgdrLinhas.Cells[x,y+1];

    for x:=1 to sgdrLinhas.ColCount-1 do
      sgdrLinhas.Cells[x, sgdrLinhas.RowCount-1] := '';

    if (sgdrLinhas.RowCount > 2) then
      sgdrLinhas.RowCount := sgdrLinhas.RowCount - 1
    else
      sgdrLinhas.Cells[0, 1] := '';
  end;
end;

procedure TfrmCadTabGener.sbtnImportarClick(Sender: TObject);
var
  c: integer;
begin
  if (Trim(dbedNome.Text) = '') then
  begin
    MsgDlg('Primeiro indique o nome da tabela!', 'Erro', mtError, [mbOk],0);
    exit;
  end;

  chklstCampos.Items.Clear;

  if (TComponent(Sender).Name = 'sbtnImportar') then
  begin
    btnOk.Enabled := FileExists(sArquivo);
    bImportacao   := true;
    AtualizarCamposIE;
    lblDescrArqIE.Caption := 'Arquivo de Destino';
    lblTituloIE.Caption   := 'Importação de Tabela Genérica';
  end
  else
  begin
    bImportacao := false;
    chklstCampos.Items.Clear;
    qryCampos.First;
    repeat
      chklstCampos.Items.Add(qryCampos.FieldByName('CODCAMPO').asString);
      qryCampos.Next;
    until (qryCampos.EOF);

    lblDescrArqIE.Caption := 'Arquivo de Origem';
    lblTituloIE.Caption   := 'Exportação de Tabela Genérica';

    if (chklstCampos.Items.Count > 0) then
      for c:=0 to chklstCampos.Items.Count-1 do
        chklstCampos.Checked[c] := true;
  end;

  lblArquivoSel.Caption := MinimizeName(sArquivo,lblArquivoSel.Canvas,lblArquivoSel.Width);
  HabilitaBotoes(false);
  pnlIE.Top            := 72;
  pnlIE.Left           := 128;
  pbProgresso.Position := 0;
  pnlIE.Visible        := true;
end;

procedure TfrmCadTabGener.btnOkClick(Sender: TObject);
var
  x, y: LongInt;
  byNumCampos: byte;
begin
//  if (sArquivo <> 'C:\') then
  if (sArquivo <> Sistema.RetornaCaminhoArquivos(Sistema.IdEmpresa)+'\') then //Ádler Teodoro de Souza SOL 109421 KINTANA 496332

  begin
    pbProgresso.Position := 0;
    pbProgresso.Min      := 0;

    if (bImportacao) then
      pbProgresso.Max := LinhasArquivo.Count
    else
      pbProgresso.Max := sgdrLinhas.RowCount;

    if (pgctrlDetalhe.ActivePageIndex = 0) then
      sgdrLinhas.Refresh;

    if (bImportacao) then
    begin
      AtualizarCamposIE;
      // Gravo os Campos da Tabela
      for y:=1 to LinhasArquivo.Count-1 do
      begin
        sLinha := LinhasArquivo[y];
        sgdrLinhas.Cells[0,sgdrLinhas.RowCount-1] := IntToStr(sgdrLinhas.RowCount-1);
        x := 1;
        repeat
          ExtraiString(sLinha,sColuna,#1#2);
          sgdrLinhas.Cells[x,sgdrLinhas.RowCount-1] := sColuna;
          Inc(x);
        until (sLinha = '') or (sLinha = #1#2);
        pbProgresso.Position := pbProgresso.Position + 1;
        
        if (y < LinhasArquivo.Count-1) then
          sgdrLinhas.RowCount := sgdrLinhas.RowCount + 1;
      end;
    end
    else
    begin
      byNumCampos := 0;
      for x:=chklstCampos.Items.Count-1 DownTo 0 do
        if (chklstCampos.Checked[x]) then
        begin
          byNumCampos := x;
          break;
        end;

      LinhasArquivo.Clear;
      // Gravo os Campos no arquivo
      for y:=0 to sgdrLinhas.RowCount-1 do
      begin
        sLinha:='';
        for x:=1 to sgdrLinhas.ColCount-1 do
          if (chklstCampos.Checked[x-1]) then
            sLinha := sLinha + Trim(sgdrLinhas.Cells[x, y]) + IFF(x > byNumCampos,'',#1#2);

        LinhasArquivo.Add(sLinha);
        pbProgresso.Position := pbProgresso.Position + 1;
      end;
      LinhasArquivo.SaveToFile(sArquivo);
    end;
    Beep;
    ShowMessage('Processo Concluído com Sucesso');
    pbProgresso.Position := 0;
  end;
  chklstCampos.Repaint;
end;

procedure TfrmCadTabGener.tbbtSelArqClick(Sender: TObject);
begin
  Sd.FileName := lblArquivoSel.Caption;
  if (Sd.Execute) then
  begin
    sArquivo := Sd.FileName;
    AtualizarCamposIE;
    btnOk.Enabled         := FileExists(sArquivo);
    lblArquivoSel.Caption := MinimizeName(Sd.FileName,lblArquivoSel.Canvas,
      lblArquivoSel.Width);
  end;
  tbbtSelArq.Down := false;
end;

procedure TfrmCadTabGener.dbgrdCamposDblClick(Sender: TObject);
begin
  if (qry.State in [dsInsert,dsEdit]) then
    sbtnAlterarDet.Click;
end;

procedure TfrmCadTabGener.SelecionarTabelas(ID: string);
begin
  Refresh;

  with (qry) do
  begin
    Close;
    Params[0].asString := ID;
    Open;
  end;

  with (qryCampos) do
  begin
    Close;
    Params[0].asString := ID;
    Open;
  end;

  with (qryLinhas) do
  begin
    Close;
    Params[0].asString := ID;
    Open;
  end;

  with (qryRegras) do
  begin
    Close;
    Params[0].asString := '%' +ID+ '%';
    Open;
  end;

  with (qryFormulas) do
  begin
    Close;
    Params[0].asString := '%' +ID+ '%';
    Open;
  end;

  CarregaLinhas;

  tbshDet.Enabled := not(qryCampos.IsEmpty);
end;

procedure TfrmCadTabGener.CarregaListaCodCampo(ID: string);
begin
  qryAux.SQL.Clear;
  qryAux.SQL.Add('SELECT CODCAMPO FROM CAMPOTABGENER');
  qryAux.SQL.Add('WHERE  (CODTABELA = ' +QuotedStr(ID)+ ')');
  qryAux.SQL.Add('ORDER BY CODCAMPO');
  qryAux.Open;

  if not(qryAux.IsEmpty) then
  begin
    lstCodCampo.Clear;
    repeat
      lstCodCampo.Add(qryAux.FieldByName('CODCAMPO').asString);
      qryAux.Next;
    until (qryAux.EOF);
  end;
  qryAux.Close;
end;

procedure TfrmCadTabGener.ApagaLinhas;
var
  x, y: LongInt;
begin
  // "Apago" todos os campos do StringGrid
  for x:=1 to sgdrLinhas.ColCount-1 do
    for y:=1 to sgdrLinhas.RowCount-1 do
      sgdrLinhas.Cells[x, y] := '';

  // Preencho a primeira coluna do grid
  sgdrLinhas.ColCount   := 1;
  sgdrLinhas.RowCount   := 2;
  sgdrLinhas.Cells[0,0] := 'Linha';
end;

procedure TfrmCadTabGener.CarregaLinhas;
var
  y, x: LongInt;
begin
  ApagaLinhas;

  if (lstCodCampo.Count > 0) then
  begin
    frmAguarde.Mostra('Selecionando Dados...');
    frmAguarde.Refresh;
    frmAguarde.Pos := 0;
    frmAguarde.Min := 0;

    try
      frmAguarde.Max := qryLinhas.RecordCount;
    except
      frmAguarde.Max := 1;
    end;

    // Preencho as colunas do grid
    for x:=1 to lstCodCampo.Count do
    begin
      sgdrLinhas.ColCount    := sgdrLinhas.ColCount + 1;
      sgdrLinhas.Cells[x, 0] := lstCodCampo[x-1];
    end;

    qryLinhas.First;
    sgdrLinhas.Visible := false;
    if not(qryLinhas.IsEmpty) then
    begin
      y := 1;
      repeat
        x := 1;

        // Obtenho o número da linha atual
        sgdrLinhas.Cells[0, y] := qryLinhas.FieldByName('NUMLINHA').asString;

        // Obtenho a linha atual
        while (qryLinhas.FieldByName('NUMLINHA').asInteger = y) and not(qryLinhas.EOF) do
        begin
          if (qryCampos.Locate('CODCAMPO',sgdrLinhas.Cells[x, 0],[])) and
             (Copy(qryCampos.FieldByName('TIPODADO').asString,1,1) = 'N') then
            sgdrLinhas.Cells[x, y] := TrocaCaracter(qryLinhas.FieldByName('VALOR').asString,'.',',')
          else
            sgdrLinhas.Cells[x, y] := qryLinhas.FieldByName('VALOR').asString;
          Inc(x);

          qryLinhas.Next;
          frmAguarde.Pos := frmAguarde.Pos + 1;
        end;

        Inc(y);

        if not(qryLinhas.EOF) then
          sgdrLinhas.RowCount := sgdrLinhas.RowCount + 1;

      until (qryLinhas.EOF);
    end;
    sgdrLinhas.Visible := true;

    frmAguarde.Apaga;
  end;

  sgdrLinhas.Refresh;
end;

function TfrmCadTabGener.LinhaVazia(Linha: integer): boolean;
var
  x, iNumColVazias: integer;
begin
  iNumColVazias := 0;
  for x:=1 to sgdrLinhas.ColCount-1 do
    if (sgdrLinhas.Cells[x, Linha] = '') then
      Inc(iNumColVazias);

  Result := (iNumColVazias = sgdrLinhas.ColCount-1);
end;

function TfrmCadTabGener.ExisteLinhaVazia: boolean;
var
  y: integer;
begin
  Result := false;
  for y:=1 to sgdrLinhas.RowCount-1 do
  begin
    if (LinhaVazia(y)) then
    begin
      Result := true;
      break;
    end;
  end;
end;

function TfrmCadTabGener.VerificaMestre: boolean;
begin
  if (qry.Active) then
  begin
    if (qry.State in ([dsInsert,dsEdit])) then
      Result := true
    else
      Result := not(qry.IsEmpty);
  end
  else
    Result := false;
end;

procedure TfrmCadTabGener.FazerVoltarDet;
begin
  if (qryCampos.State in [dsEdit,dsInsert]) then
    qryCampos.Cancel;

  tb97Detalhe.Visible := false;

  dbgrdCampos.BringToFront;
  AtualizaBotoesDetalhe;
end;

procedure TfrmCadTabGener.AtualizaBotoesDetalhe;
begin
  if (CmeCadastro.Operacao in [opInserir,opAlterar]) and (VerificaMestre) then
  begin
    sbtnInserirDet.Enabled := (qry.State in [dsInsert,dsEdit]);
    sbtnAlterarDet.Enabled := (qry.State in [dsInsert,dsEdit]) and not(qryCampos.IsEmpty);
    sbtnExcluirDet.Enabled := (qry.State in [dsInsert,dsEdit]) and not(qryCampos.IsEmpty);
  end
  else
  begin
    sbtnInserirDet.Enabled := false;
    sbtnAlterarDet.Enabled := false;
    sbtnExcluirDet.Enabled := false;
  end;

  sbtnInserirDet.Down := false;
  sbtnAlterarDet.Down := false;
  sbtnExcluirDet.Down := false;

  AutorizarForm(afSoDesabilitar);
end;

procedure TfrmCadTabGener.CancelDetalhe;
begin
  qryCampos.Cancel;
  dbgrdCampos.BringToFront;

  tb97Detalhe.Visible  := false;
  dc97OkCancel.Visible := false;
  AtualizaBotoesDetalhe;
end;

procedure TfrmCadTabGener.HabilitaBotoes(Opcao: boolean);
begin
  sbtnInserir.Enabled  := Opcao;
  sbtnAlterar.Enabled  := Opcao;
  sbtnApagar.Enabled   := Opcao;
  sbtnProcurar.Enabled := Opcao;

  bbtnConfirmar.Enabled := (Opcao) and (qry.State in [dsInsert, dsEdit]);
  bbtnCancelar.Enabled  := (Opcao) and (qry.State in [dsInsert, dsEdit]);
  bbtnSair.Enabled      := Opcao;
  bbtnAjuda.Enabled     := Opcao;

  sbtnExportar.Enabled := Opcao;
  sbtnImportar.Enabled := Opcao;
  pnlFundo.Enabled     := Opcao;
end;

procedure TfrmCadTabGener.btnSairClick(Sender: TObject);
begin
  HabilitaBotoes(true);
  pnlIE.Visible := false;
  btnOk.Enabled := true;
end;

procedure TfrmCadTabGener.chklstCamposClickCheck(Sender: TObject);
begin
  InvalidateItemListBox(TCustomListBox(Sender),TCustomListBox(Sender).ItemIndex);
  HabilitaBtOkIE;
end;

procedure TfrmCadTabGener.HabilitaBtOkIE;
var
  c: byte;
  bAchou: boolean;
begin
  bAchou := false;
  for c:=0 to chklstCampos.Items.Count-1 do
    if (chklstCampos.Checked[c]) then
    begin
      bAchou := true;
    end;
  btnOk.Enabled := bAchou;
end;

procedure TfrmCadTabGener.AtualizarCamposIE;
var
  c: integer;
begin
  try
    LinhasArquivo.LoadFromFile(sArquivo);
    chklstCampos.Items.Clear;
    sLinha := LinhasArquivo[0];
    repeat
      ExtraiString(sLinha,sColuna,#1#2);
      chklstCampos.Items.Add(sColuna);
    until (sLinha = '') or (sLinha = #1#2);

    if (chklstCampos.Items.Count > 0) then
      for c:=0 to chklstCampos.Items.Count-1 do
        chklstCampos.Checked[c] := true;
    chklstCampos.Repaint;
  except
  end;
end;

end.
