// *****************************************************************************
// ***************************** REGISTRO DE ALTERAÇÕES ************************
// *****************************************************************************
//------------------------------------------------------------------------------
//Autor(a)   : Douglas Siqueira
//Data       : 21/12/2012
//Pendência  : SOL 108804 KTN 494141	
//Descricao  : Retirar visualização na Folha de Pagamento de dados de outros módulos, 
//tais como: layout de arquivos TXT, tabelas genéricas, rubricas, formas de cálculo etc.
// Menus: * Cadastro / Tabelas Auxiliares / Tabela REGRA/Forma de Cálculo - Forma de Cálculo
// e Tabela Genérica * Sistema / Utilitários / Layout de Arquivos TXT * Cadastros / Rubricas
// por Empresa * Cadastros / Rubricas Salariais * Cadastros / Motivos e Ações Impedir o mesmo
//acesso aos dados da folha por outros módulos.
//------------------------------------------------------------------------------
// Autor(a)    :  Ádler Teodoro de Souza
// Data        :  19/02/2009
// Pendência   : SOL 109421 KINTANA 496332
// Descricao   :  Alteração de gravação de arquivos de log na raiz do disco C: .
//------------------------------------------------------------------------------
//Analista  : Marcus Oliveira
//Pendência : 24125
//Data      : 12/02/2007
//Descrição : Criado filtro das tabelas genericas. O Filtro funciona com usuário
//            logado. No sistema de regra o usuario associa a tabela que tem
//            direito de acesso.
//------------------------------------------------------------------------------
unit fCadTabGener;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs, fCadastroMT,
  wwdblook, StdCtrls, Mask, wwdbedit, DBCtrls, Grids, Wwdbigrd, Wwdbgrid, ComCtrls, ImgList,
  CmEventosCadastro, Db, Wwdatsrc, MontaSelect, DBTables, IvDictio, IvMulti, IvEMulti,
  MAHlpBtn, Buttons, TB97Tlbr, TB97Ctls, TB97, ExtCtrls, Menus, TabControlDetalhe, DBCGrids,
  fcLabel, CheckLst, DBClient, uCMClientDataSet, TB97Tlwn, uCtrlTabGener, uCtrlCadRegra,
  uCtrlListTerceirosRH, ColorCheckListBox, uSistema;

type
  TfrmCadTabGener = class(TfrmCadastroMT)
    pnlMestre: TPanel;
    Label1: TLabel;
    Label2: TLabel;
    dbedNome: TwwDBEdit;
    dbedDescricao: TwwDBEdit;
    dsCampos: TwwDataSource;
    dsRubricas: TwwDataSource;
    dsFormaCalc: TwwDataSource;
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
    tbshRubricas: TTabSheet;
    dbrgRubricas: TwwDBGrid;
    tbshFormaCalc: TTabSheet;
    dbgrFormaCalc: TwwDBGrid;
    dc97OkCancel: TDock97;
    tb97Detalhe: TToolbar97;
    bbtnOkDet: TBitBtn;
    bbtnCancelarDet: TBitBtn;
    Sd: TSaveDialog;
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
    CdsTipoDado: TCMClientDataSet;
    CdsCampos: TCMClientDataSet;
    CdsRubricas: TCMClientDataSet;
    CdsFormaCalc: TCMClientDataSet;
    CdsLinhas: TCMClientDataSet;
    tb97IE: TToolWindow97;
    Bevel1: TBevel;
    tbbtSelArq: TToolbarButton97;
    lblDescrArqIE: TLabel;
    Label8: TLabel;
    lblArquivoSel: TLabel;
    pbProgresso: TProgressBar;
    bbtnOkDir: TBitBtn;
    bbtnSairDir: TBitBtn;
    bvFundo2: TBevel;
    sbtnExcluirLinhas: TToolbarButton97;
    chklstCampos: TColorCheckListBox;
    procedure FormCreate(Sender: TObject);
    procedure dsStateChange(Sender: TObject);
    procedure CmeCadastroFind(Sender: TObject);
    procedure CmeCadastroAtualizaBotoes(Sender: TObject);
    procedure CmeCadastroInsert(Sender: TObject);
    procedure CmeCadastroEdit(Sender: TObject);
    procedure CmeCadastroConfirma(Sender: TObject);
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
    procedure mnuiInserirAntesClick(Sender: TObject);
    procedure mnuiExcluirClick(Sender: TObject);
    procedure dbgrdCamposDblClick(Sender: TObject);
    procedure mnuiInserirDepoisClick(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure bbtnConfirmarClick(Sender: TObject);
    procedure bbtnSairDirClick(Sender: TObject);
    procedure bbtnOkDirClick(Sender: TObject);
    procedure tbbtSelArqClick(Sender: TObject);
    procedure chklstCamposClickCheck(Sender: TObject);
    procedure sbtnImportarClick(Sender: TObject);
    procedure bbtnCancelarClick(Sender: TObject);
    procedure sbtnExcluirLinhasClick(Sender: TObject);
  private
    CtrlTabGener: TCtrlTabGener;
    CtrlListTerceirosRH: TCtrlListTerceirosRH;
    CtrlCadRegra: TCtrlCadRegra;

    LinhasArquivo, lstCodCampo: TStringList;

    sColuna, sLinha, sArquivo, sOldCodCampo: string;
    bImportacao: boolean;

    procedure SelTabGener(CodTabela: string);
    procedure CarregaListaCodCampo(CodTabela: string);
    procedure ApagaLinhas(ApagaDescricao: boolean = true);
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
    procedure Progresso(Arg: array of variant);
  end;

var
  frmCadTabGener: TfrmCadTabGener;

implementation

uses uCMTypes, FileCtrl, uMensErro, uCtrlFuncoesRH, uAutorizacao, uCtrlPadroes,
  fAguarde, uCtrlUsoGeralRH, dCds;

{$R *.DFM}

procedure TfrmCadTabGener.FormCreate(Sender: TObject);
begin
  inherited;
  CtrlTabGener := TCtrlTabGener.Create;
  CtrlTabGener.InitializeAs(Padroes);
  CtrlTabGener.Progresso := Progresso;
  CtrlTabGener.CdsTabGener := Cds;
  CtrlTabGener.CdsLinhas := CdsLinhas;
  CtrlTabGener.CdsCampos := CdsCampos;

  CtrlListTerceirosRH := TCtrlListTerceirosRH.Create(CtrlUsoGeralRH.UsuXFilial,
    CtrlUsoGeralRH.UsuXCCusto, CtrlUsoGeralRH.IdUsuarioGeral);
  CtrlListTerceirosRH.InitializeAs(Padroes);

  CtrlCadRegra := TCtrlCadRegra.Create;
  CtrlCadRegra.InitializeAs(Padroes);

  LinhasArquivo := TStringList.Create;
  lstCodCampo := TStringList.Create;

  CdsTipoDado.Data := CtrlListTerceirosRH.ListTipoDadoTabGener;
  SelTabGener('-1');

  // Apagar o índice se este existir
  dmCds.Cds.IndexName := '';
  if (dmCds.Cds.IndexDefs.IndexOf('Index1') > 0) then
    dmCds.Cds.DeleteIndex('Index1');

  pnlControlesCampos.SendToBack;
  pgctrlDetalhe.ActivePageIndex := 0;

  //Marcus Oliveira P. 24125 12/02/2007
  MontaSelect.Filtro.Add('TABGENERUSUARIO.IDUSUARIO = '+ IntToStr(Sistema.IdUsuario));


  Sd.InitialDir := Sistema.RetornaCaminhoArquivos(Sistema.IdEmpresa);
  //Ádler Teodoro de Souza SOL 109421 KINTANA 496332
  lblArquivoSel.Caption :=  Sistema.RetornaCaminhoArquivos(Sistema.IdEmpresa);
  //Ádler Teodoro de Souza SOL 109421 KINTANA 496332
end;

procedure TfrmCadTabGener.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  FreeAndNil(CtrlTabGener);
  FreeAndNil(CtrlListTerceirosRH);
  FreeAndNil(CtrlCadRegra);
  FreeAndNil(LinhasArquivo);
  FreeAndNil(lstCodCampo);
  inherited;
end;

procedure TfrmCadTabGener.dsStateChange(Sender: TObject);
begin
  inherited;
  sbtnAlterar.Enabled := not(Cds.IsEmpty);
  sbtnApagar.Enabled := not(Cds.IsEmpty);
  sbtnExcluirLinhas.Enabled := not(Cds.State in [dsInsert, dsEdit]) and not(Cds.IsEmpty);
  if (Cds.State in [dsInsert, dsEdit]) then
  begin
    sgdrLinhas.Options := sgdrLinhas.Options + [goEditing];
    sgdrLinhas.PopupMenu := pmnuLinhas;
  end
  else
  begin
    sgdrLinhas.Options := sgdrLinhas.Options - [goEditing];
    sgdrLinhas.PopupMenu := nil;
  end;

  AtualizaBotoesDetalhe;
  tbshDet.Enabled := not(CdsCampos.IsEmpty);
end;

procedure TfrmCadTabGener.CmeCadastroFind(Sender: TObject);
begin
  inherited;
  if (MontaSelect.RetornouValor) then
  begin
    CarregaListaCodCampo(MontaSelect.ValoresChave[0]);
    SelTabGener(MontaSelect.ValoresChave[0]);
    pgctrlDetalhe.ActivePageIndex := 0;
  end;
  sbtnImportar.Enabled := false;
  sbtnExportar.Enabled := not(Cds.IsEmpty);
  //sArquivo := 'C:\'+Trim(dbedNome.Text)+'.TXT';;
  sArquivo := Sistema.RetornaCaminhoArquivos(Sistema.IdEmpresa)+'\'+Trim(dbedNome.Text)+'.TXT';//Ádler Teodoro de Souza SOL 109421 KINTANA 496332
end;

procedure TfrmCadTabGener.CmeCadastroAtualizaBotoes(Sender: TObject);
begin
  inherited;
  AtualizaBotoesDetalhe;
  pnlMestre.Enabled := pnlFundo.Enabled;
  pnlFundo.Enabled := true;
end;

procedure TfrmCadTabGener.CmeCadastroInsert(Sender: TObject);
begin
  inherited;
  sbtnImportar.Enabled := not(Cds.IsEmpty);
  pgctrlDetalhe.ActivePageIndex := 1;
  AtualizaBotoesDetalhe;
  dbedNome.ReadOnly := false;
  dbedNome.SetFocus;
end;

procedure TfrmCadTabGener.CmeCadastroEdit(Sender: TObject);
begin
  inherited;
  sbtnImportar.Enabled := not(Cds.IsEmpty);
  sbtnInserirDet.Enabled := true;
  sbtnAlterarDet.Enabled := not(CdsCampos.IsEmpty);
  sbtnExcluirDet.Enabled := not(CdsCampos.IsEmpty);
  dbedNome.ReadOnly := not(CdsCampos.IsEmpty);

  if (dbedNome.ReadOnly) then
    dbedDescricao.SetFocus
  else
    dbedNome.SetFocus;
end;

procedure TfrmCadTabGener.CmeCadastroConfirma(Sender: TObject);
var
  x, y: integer;
  sValor: string;
  bInserindo: boolean;
begin
  bInserindo := (Cds.State = dsInsert);
  FazerVoltarDet;
  AtualizaBotoesDetalhe;

  frmAguarde.Mostra('Gravando Dados...');
  frmAguarde.Pos := 0;
  frmAguarde.Min := 0;
  frmAguarde.Max := sgdrLinhas.RowCount-1;
  frmAguarde.Refresh;

  if (Cds.State = dsEdit) or ((Cds.State = dsInsert) and
     (sgdrLinhas.RowCount >= 2) and not(LinhaVazia(1))) then
  begin
    if (sgdrLinhas.RowCount >= 2) and not(LinhaVazia(1)) then
    begin
      CdsLinhas.EmptyDataSet;
      for y:=1 to sgdrLinhas.RowCount-1 do
      begin
        frmAguarde.Pos := frmAguarde.Pos + 1;

        for x:=1 to sgdrLinhas.ColCount-1 do
        begin
          if (CdsCampos.Locate('CODCAMPO', sgdrLinhas.Cells[x,0], [])) and
             (Copy(CdsCampos.FieldByName('TIPODADO').asString,1,1) = 'N') then
            sValor := FU.TrocaCaracter(sgdrLinhas.Cells[x,y], ',', '.')
          else
            sValor := sgdrLinhas.Cells[x,y];

          CdsLinhas.Insert;
          CdsLinhas.FieldByName('CODTABELA').asString := Cds.FieldByName('CODTABELA').asString;
          CdsLinhas.FieldByName('NUMLINHA').asString := sgdrLinhas.Cells[0,y];
          CdsLinhas.FieldByName('CODCAMPO').asString := sgdrLinhas.Cells[x,0];
          CdsLinhas.FieldByName('VALOR').asString := sValor;
          CdsLinhas.Post;
        end;
      end;
    end;

    frmAguarde.Mostra('Efetivando gravação...');
    frmAguarde.pbAguarde.Visible := false;
    frmAguarde.Refresh;
    Cds.FieldByName('IDMODULO').asString:='21';//DOUGLAS
    if not(CtrlTabGener.GravarTabGener) then
    begin
      frmAguarde.Apaga;
      raise Exception.Create('Ocorreu um erro na gravação desta tabela.'+CR_LF+
        'Erro:' +CR_LF+ CtrlTabGener.MessageInfo);
    end
    else
    if (bInserindo) then
      CtrlTabGener.GravarTabGenerUsuario(Sistema.IdUsuario, Cds.FieldByName('CODTABELA').asString);

    CdsLinhas.Data := CtrlTabGener.ListLinhasTabGener(Cds.FieldByName('CODTABELA').asString);
    CarregaListaCodCampo(Cds.FieldByName('CODTABELA').asString);
    CarregaLinhas;
  end
  else
  begin
    frmAguarde.Mostra('Efetivando gravação...');
    frmAguarde.pbAguarde.Visible := false;
    frmAguarde.Refresh;
    Cds.FieldByName('IDMODULO').asString:='21';//DOUGLAS
    if not(CtrlTabGener.GravarTabGener) then
    begin
      frmAguarde.Apaga;
      raise Exception.Create('Ocorreu um erro na gravação desta tabela.'+CR_LF+
        'Erro:' +CR_LF+ CtrlTabGener.MessageInfo);
    end
    else
    if (bInserindo) then
      CtrlTabGener.GravarTabGenerUsuario(Sistema.IdUsuario, Cds.FieldByName('CODTABELA').asString);
  end;
  inherited;
  frmAguarde.pbAguarde.Visible := true;
  frmAguarde.Apaga;
end;

procedure TfrmCadTabGener.pgctrlDetalheChanging(Sender: TObject; var AllowChange: Boolean);
begin
  AllowChange := not(CdsCampos.State in [dsInsert, dsEdit]) and
    ((Trim(dbedNome.Text) <> '') or (Cds.IsEmpty));
end;

procedure TfrmCadTabGener.sgdrLinhasDrawCell(Sender: TObject; ACol, ARow: Integer;
  Rect: TRect; State: TGridDrawState);
begin
  with (sgdrLinhas.Canvas) do
  begin
    if (ACol = 0) or (ARow = 0) then
    begin
      Brush.Color := clBtnFace;
      Font.Color := clBlack;
      Font.Style := [fsBold];

      FillRect(Rect);
      if (ACol = 0) and (ARow > 0) then
      begin
        Pen.Color := clBlack;
        FU.DrawLine(sgdrLinhas.Canvas, Rect.Left,  Rect.Bottom, Rect.Right, Rect.Bottom);
        FU.DrawLine(sgdrLinhas.Canvas, Rect.Right, Rect.Bottom, Rect.Right, Rect.Top);
        Pen.Color := clWhite;
        FU.DrawLine(sgdrLinhas.Canvas, Rect.Left, Rect.Top, Rect.Right, Rect.Top);
        FU.DrawLine(sgdrLinhas.Canvas, Rect.Left, Rect.Top, Rect.Left, Rect.Bottom);
      end;
    end
    else
      FillRect(Rect);

    TextOut(Rect.Left+2, Rect.Top+2, sgdrLinhas.Cells[ACol, ARow]);
  end;
end;

procedure TfrmCadTabGener.sgdrLinhasSelectCell(Sender: TObject; ACol, ARow: Integer;
  var CanSelect: Boolean);
begin // Não permite a seleção da primeira coluna
  CanSelect := (ACol > 0) and (ARow > 0);
end;

procedure TfrmCadTabGener.sgdrLinhasGetEditMask(Sender: TObject; ACol, ARow: Integer;
  var Value: String);
begin
  // Indica a máscara para a edição de uma Data
  if (CdsCampos.Locate('CODCAMPO',sgdrLinhas.Cells[ACol,0],[])) and
     (Copy(CdsCampos.FieldByName('TIPODADO').asString,1,1) = 'D') then
    Value := '00/00/0000;1';
end;

procedure TfrmCadTabGener.sgdrLinhasKeyPress(Sender: TObject; var Key: Char);
begin
  if not(goEditing in sgdrLinhas.Options) then
    exit;

  if (goEditing in sgdrLinhas.Options) and (sgdrLinhas.RowCount = 2) and
     (Trim(sgdrLinhas.Cells[0,1]) = '') then
    sgdrLinhas.Cells[0,1] := '1';

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
     ((CdsCampos.Locate('CODCAMPO', sgdrLinhas.Cells[sgdrLinhas.Col,0], [])) and
      (Copy(CdsCampos.FieldByName('TIPODADO').asString,1,1) = 'N') and
      (not(Key in ['0'..'9','-',',']) or
      ((Key = ',') and (Pos(',',sgdrLinhas.Cells[sgdrLinhas.Col,sgdrLinhas.Row]) > 0)))) then
    Key := #0;

  // Se for uma tecla válida ponho a letra em maiúsculo
  if (Key <> #0) and (Ord(Key) <> VK_RETURN) then
    Key := UpCase(Key);
end;

procedure TfrmCadTabGener.sbtnExcluirLinhasClick(Sender: TObject);
begin
  if (MsgDlg('Deseja realmente excluir TODAS as linhas desta tabela?',
      'Exclusão', mtConfirmation, [mbYes,mbNo], 0) = mrNo) then
  begin
    sbtnExcluirLinhas.Down := false;
    exit;
  end;

  frmAguarde.Mostra('Apagando Linhas...');
  frmAguarde.Refresh;
  frmAguarde.pbAguarde.Visible := false;

  if not(CtrlTabGener.ExcluirLinhasTabGener(Cds.FieldByName('CODTABELA').asString)) then
  begin
    frmAguarde.Apaga;
    raise Exception.Create('Ocorreu um erro na exclusão das linhas desta tabela.'+CR_LF+
      'Erro:' +CR_LF+ CtrlTabGener.MessageInfo);
  end;

  ApagaLinhas(false);

  frmAguarde.pbAguarde.Visible := true;
  frmAguarde.Apaga;
  sbtnExcluirLinhas.Down := false;
end;

procedure TfrmCadTabGener.sbtnInserirClick(Sender: TObject);
begin
  if not(Cds.IsEmpty) then
  begin
    lstCodCampo.Clear;
    SelTabGener('-1');
  end;
  inherited;
end;

procedure TfrmCadTabGener.sbtnApagarClick(Sender: TObject);
begin
  if (not(CdsFormaCalc.IsEmpty) and (MsgDlg('Há' +FU.IFF(CdsFormaCalc.IsEmpty,'',' Formas de Cálculo')+
      FU.IFF(CdsRubricas.IsEmpty, '', FU.IFF(CdsFormaCalc.IsEmpty,'','e')+ ' Rubricas ')+
      'que utilizam esta tabela genérica.' +CR_LF+ 'Deseja excluir assim mesmo?',
      'Exclusão', mtConfirmation, [mbYes, mbNo],0) = mrNo)) then
  begin
    sbtnApagar.Down := false;
    exit;
  end;

  if ((CdsRubricas.IsEmpty) or (CdsFormaCalc.IsEmpty)) and
     (MsgDlg('Deseja realmente excluir esta tabela?', 'Exclusão', mtConfirmation,
     [mbYes,mbNo], 0) = mrNo) then
  begin
    sbtnApagar.Down := false;
    exit;
  end;

  frmAguarde.Mostra('Apagando Dados...');
  frmAguarde.Refresh;
  frmAguarde.Pos := 0;
  frmAguarde.Min := 0;
  frmAguarde.Max := 4;

  if not(CtrlTabGener.ExcluirTabGener(Cds.FieldByName('CODTABELA').asString)) then
  begin
    frmAguarde.Apaga;
    raise Exception.Create('Ocorreu um erro na exclusão desta tabela.'+CR_LF+
      'Erro:' +CR_LF+ CtrlTabGener.MessageInfo);
  end    
  else
    lstCodCampo.Clear;

  SelTabGener('-1');

  frmAguarde.Pos := frmAguarde.Pos + 1;
  frmAguarde.Apaga;
  sbtnApagar.Down := false;
end;

procedure TfrmCadTabGener.sbtnInserirDetClick(Sender: TObject);
begin
  sbtnInserirDet.Enabled := false;
  sbtnInserirDet.Down := true;
  sbtnAlterarDet.Enabled := false;
  sbtnExcluirDet.Enabled := false;

  dbgrdCampos.SendToBack;
  dbedCodigoCampo.SetFocus;
  tb97Detalhe.Visible := true;
  dc97OkCancel.Visible := true;

  CdsCampos.Insert;
end;

procedure TfrmCadTabGener.sbtnAlterarDetClick(Sender: TObject);
begin
  sbtnAlterarDet.Down := true;
  sbtnInserirDet.Enabled := false;
  sbtnAlterarDet.Enabled := false;
  sbtnExcluirDet.Enabled := false;

  dbgrdCampos.SendToBack;
  dbedCodigoCampo.SetFocus;
  tb97Detalhe.Visible := true;
  dc97OkCancel.Visible := true;

  sOldCodCampo := CdsCampos.FieldByName('CODCAMPO').asString;
  CdsCampos.Edit;
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
      if (sgdrLinhas.Cells[x,0] = CdsCampos.FieldByName('CODCAMPO').asString) then
        iNumCol := x;

    // Substitui coluna
    for x:=iNumCol to sgdrLinhas.ColCount-2 do
    begin
      frmAguarde.Pos := frmAguarde.Pos + 1;

      for y:=0 to sgdrLinhas.RowCount-1 do
      begin
        sgdrLinhas.Cells[x,y] := sgdrLinhas.Cells[x+1,y];
        sgdrLinhas.Cells[x+1,y] := '';
      end;
    end;

    sgdrLinhas.ColCount := sgdrLinhas.ColCount - 1;

    CdsCampos.Delete;
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
    MsgDlg('Falta indicar o Código do Campo.', 'Aviso', mtWarning, [mbOk,mbHelp], 0);
    dbedCodigoCampo.SetFocus;
    exit;
  end;

  if (Trim(dblkcmbTipoCampo.Text) = '') then
  begin
    MsgDlg('Falta selecionar o Tipo de Dado.', 'Aviso', mtWarning, [mbOk,mbHelp], 0);
    dblkcmbTipoCampo.SetFocus;
    exit;
  end;

  CdsCampos.FieldByName('CODTABELA').asString := Cds.FieldByName('CODTABELA').asString;
  CdsCampos.FieldByName('TIPODADO').asString := CdsTipoDado.FieldByName('NOMETIPODADO').asString;

  // Na inserção de um campo procure o campo em ordem alfabética
  if (CdsCampos.State = dsInsert) then
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
        if (sgdrLinhas.Cells[x,0] < CdsCampos.FieldByName('CODCAMPO').asString) then
          iNumCol := x+1
        else
          iNumCol := x;
      end
      else
      if (CdsCampos.FieldByName('CODCAMPO').asString < sgdrLinhas.Cells[x,0]) then
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
          sgdrLinhas.Cells[x,y] := '';
        end;
    end;

    // Atribuo o título da coluna
    sgdrLinhas.Cells[iNumCol,0] := CdsCampos.FieldByName('CODCAMPO').asString;

    frmAguarde.pbAguarde.Visible := true;
    frmAguarde.Apaga;
  end
  else
  begin // Na edição de um campo troque o CODCAMPO das LinhasArquivo referentes
    for x:=1 to sgdrLinhas.ColCount-1 do
      if (sgdrLinhas.Cells[x,0] = sOldCodCampo) then
        sgdrLinhas.Cells[x,0] := CdsCampos.FieldByName('CODCAMPO').asString;
  end;

  if (CdsCampos.State in [dsInsert, dsEdit]) then
  begin
    UltEstadoQuery := CdsCampos.State;
    try
      CdsCampos.Post;
      if (UltEstadoQuery = dsInsert) then // Repete a inserção do detalhe se for inserção
      begin
        CdsCampos.Insert;
        dbedCodigoCampo.SetFocus;
      end
      else
        FazerVoltarDet;
    except
      on E: Exception do
        ShowMessage(E.Message);
    end;
    AtualizaBotoesDetalhe;
    tbshDet.Enabled := not(CdsCampos.IsEmpty);
  end;
end;

procedure TfrmCadTabGener.bbtnCancelarDetClick(Sender: TObject);
begin
  CancelDetalhe;
end;

procedure TfrmCadTabGener.bbtnConfirmarClick(Sender: TObject);
begin
  if (Trim(dbedNome.Text) = '') then
  begin
    MsgDlg('Primeiro indique o nome da tabela.', 'Aviso', mtWarning, [mbOk,mbHelp], 0);
    dbedNome.SetFocus;
  end  
  else
    inherited;
end;

procedure TfrmCadTabGener.bbtnCancelarClick(Sender: TObject);
begin
  if (Assigned(Self.ActiveControl)) and
     (TComponent(Self.ActiveControl).Name = 'bbtnCancelar') and
     not(Cds.FieldByName('CODTABELA').IsNull) then
  begin
    CancelDetalhe;
    sgdrLinhas.Options := sgdrLinhas.Options - [goEditing];

    Cds.CancelUpdates;
    CdsCampos.CancelUpdates;

    CarregaLinhas;
  end;
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

    sgdrLinhas.Cells[0,sgdrLinhas.RowCount-1] := IntToStr(sgdrLinhas.RowCount-1);

    // Apago todas as strings que possam existir na linha inserida
    for x:=1 to sgdrLinhas.ColCount-1 do
      sgdrLinhas.Cells[x,sgdrLinhas.Row] := '';
  end;
  sgdrLinhas.Col := 1;
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

    sgdrLinhas.Cells[0,sgdrLinhas.RowCount-1] := IntToStr(sgdrLinhas.RowCount-1);

    // Apago todas as strings que possam existir na linha inserida
    sgdrLinhas.Row := sgdrLinhas.Row + 1;
    for x:=1 to sgdrLinhas.ColCount-1 do
      sgdrLinhas.Cells[x,sgdrLinhas.Row] := '';
  end;
  sgdrLinhas.Col := 1;
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
      sgdrLinhas.Cells[x,sgdrLinhas.RowCount-1] := '';

    if (sgdrLinhas.RowCount > 2) then
      sgdrLinhas.RowCount := sgdrLinhas.RowCount - 1
    else
      sgdrLinhas.Cells[0,1] := '';
  end;
end;

procedure TfrmCadTabGener.sbtnImportarClick(Sender: TObject);
var
  c: integer;
begin
  if (Trim(dbedNome.Text) = '') then
  begin
    MsgDlg('Primeiro indique o nome da tabela.', 'Aviso', mtWarning, [mbOk,mbHelp], 0);
    exit;
  end;
  
  chklstCampos.Items.Clear;

  if (TComponent(Sender).Name = 'sbtnImportar') then
  begin
    bbtnOkDir.Enabled := FileExists(sArquivo);
    bImportacao := true;
    AtualizarCamposIE;
    lblDescrArqIE.Caption := 'Arquivo de Destino';
    tb97IE.Caption := 'Importação de Tabela Genérica';
  end
  else
  begin
    bImportacao := false;
    chklstCampos.Items.Clear;
    CdsCampos.First;
    repeat
      chklstCampos.Items.Add(CdsCampos.FieldByName('CODCAMPO').asString);
      CdsCampos.Next;
    until (CdsCampos.EOF);

    lblDescrArqIE.Caption := 'Arquivo de Origem';
    tb97IE.Caption := 'Exportação de Tabela Genérica';

    if (chklstCampos.Items.Count > 0) then
      for c:=0 to chklstCampos.Items.Count-1 do
        chklstCampos.Checked[c] := true;
  end;

  lblArquivoSel.Caption := MinimizeName(sArquivo, lblArquivoSel.Canvas, lblArquivoSel.Width);
  HabilitaBotoes(false);
  tb97IE.Top := Self.Top + 130;
  tb97IE.Left := Self.Left + 128;
  pbProgresso.Position := 0;
  Self.Enabled := false;
  tb97IE.Visible := true;
end;

procedure TfrmCadTabGener.tbbtSelArqClick(Sender: TObject);
begin
  Sd.FileName := lblArquivoSel.Caption;
  if (Sd.Execute) then
  begin
    sArquivo := Sd.FileName;
    AtualizarCamposIE;
    bbtnOkDir.Enabled := FileExists(sArquivo);
    lblArquivoSel.Caption := MinimizeName(Sd.FileName, lblArquivoSel.Canvas,
      lblArquivoSel.Width);
  end;
  tbbtSelArq.Down := false;
end;

procedure TfrmCadTabGener.dbgrdCamposDblClick(Sender: TObject);
begin
  if (Cds.State in [dsInsert,dsEdit]) then
    sbtnAlterarDet.Click;
end;

procedure TfrmCadTabGener.chklstCamposClickCheck(Sender: TObject);
begin
  inherited;
  HabilitaBtOkIE;
end;

procedure TfrmCadTabGener.bbtnOkDirClick(Sender: TObject);
var
  x, y: LongInt;
  byNumCampos: byte;
begin
  //if (sArquivo <> 'C:\') then
  if (sArquivo <> (Sistema.RetornaCaminhoArquivos(Sistema.IdEmpresa)+'\')) then //Ádler Teodoro de Souza SOL 109421 KINTANA 496332
  begin
    pbProgresso.Position := 0;
    pbProgresso.Min := 0;

    if (bImportacao) then
      pbProgresso.Max := LinhasArquivo.Count-1
    else
      pbProgresso.Max := sgdrLinhas.RowCount-1;

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
          FU.ExtraiString(sLinha,sColuna,#1#2);
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
            sLinha := sLinha + Trim(sgdrLinhas.Cells[x, y]) + FU.IFF(x > byNumCampos,'',#1#2);

        LinhasArquivo.Add(sLinha);
        pbProgresso.Position := pbProgresso.Position + 1;
      end;
      LinhasArquivo.SaveToFile(sArquivo);
    end;
    Beep;
    ShowMessage('Processo concluído com sucesso.');
    pbProgresso.Position := 0;
  end;
  chklstCampos.Repaint;
end;

procedure TfrmCadTabGener.bbtnSairDirClick(Sender: TObject);
begin
  Self.Enabled := true;
  HabilitaBotoes(true);
  tb97IE.Visible := false;
  bbtnOkDir.Enabled := true;
end;

// ----------------------------------------------------------------------------------------
// Funções do Form
// ----------------------------------------------------------------------------------------

procedure TfrmCadTabGener.SelTabGener(CodTabela: string);
begin
  Refresh;
  
  frmAguarde.Mostra('Selecionando Tabela...');
  frmAguarde.Pos := 0;
  frmAguarde.Min := 0;
  frmAguarde.Max := 5;
  frmAguarde.Refresh;
  Cds.Data := CtrlTabGener.ListTabGener(CodTabela);

  frmAguarde.Mostra('Selecionando Linhas...');
  frmAguarde.Refresh;
  CdsLinhas.Data := CtrlTabGener.ListLinhasTabGener(CodTabela);
  frmAguarde.Pos := frmAguarde.Pos + 1;
  frmAguarde.Refresh;

  frmAguarde.Mostra('Selecionando Campos...');
  frmAguarde.Refresh;
  CdsCampos.Data := CtrlTabGener.ListCampoTabGener(CodTabela);
  frmAguarde.Pos := frmAguarde.Pos + 1;
  frmAguarde.Refresh;

  frmAguarde.Mostra('Selecionando Formas de Cálculo...');
  frmAguarde.Refresh;
  CdsFormaCalc.Data := CtrlCadRegra.ListFormaCalcAssocTabGener(CodTabela);
  frmAguarde.Pos := frmAguarde.Pos + 1;
  frmAguarde.Refresh;

  frmAguarde.Mostra('Selecionando Rubricas...');
  frmAguarde.Refresh;
  CdsRubricas.Data := CtrlCadRegra.ListRubricasAssocTabGener(CodTabela);
  frmAguarde.Pos := frmAguarde.Pos + 1;
  frmAguarde.Refresh;

  CarregaLinhas;
  frmAguarde.Apaga;

  tbshDet.Enabled := not(CdsCampos.IsEmpty);
end;

procedure TfrmCadTabGener.CarregaListaCodCampo(CodTabela: string);
begin
  dmCds.Cds.Data := CtrlTabGener.ListCodCampoTabGener(CodTabela);
  if not(dmCds.Cds.IsEmpty) then
  begin
    lstCodCampo.Clear;
    repeat
      lstCodCampo.Add(dmCds.Cds.FieldByName('CODCAMPO').asString);
      dmCds.Cds.Next;
    until (dmCds.Cds.EOF);
  end;
end;

procedure TfrmCadTabGener.ApagaLinhas(ApagaDescricao: boolean);
var
  x, y: LongInt;
begin
  // Apagar todos os campos do StringGrid
  for x:=1 to sgdrLinhas.ColCount-1 do
    for y:=1 to sgdrLinhas.RowCount-1 do
      sgdrLinhas.Cells[x, y] := '';

  // Preencher a primeira coluna do grid
  if (ApagaDescricao) then
    sgdrLinhas.ColCount := 1;
  sgdrLinhas.RowCount := 2;
  sgdrLinhas.Cells[0,0] := 'Linha';
end;

procedure TfrmCadTabGener.CarregaLinhas;
var
  y, x: LongInt;
begin
  ApagaLinhas;

  if (lstCodCampo.Count > 0) then
  begin
    frmAguarde.Mostra('Montando Linhas...');
    frmAguarde.Refresh;
    frmAguarde.Pos := 0;
    frmAguarde.Min := 0;

    try
      frmAguarde.Max := CdsLinhas.RecordCount;
    except
      frmAguarde.Max := 1;
    end;

    CdsCampos.DisableControls;

    // Preencho as colunas do grid
    for x:=1 to lstCodCampo.Count do
    begin
      sgdrLinhas.ColCount := sgdrLinhas.ColCount + 1;
      sgdrLinhas.Cells[x,0] := lstCodCampo[x-1];
    end;

    CdsLinhas.First;
    sgdrLinhas.Visible := false;
    if not(CdsLinhas.IsEmpty) then
    begin
      y := 1;
      repeat
        x := 1;
        // Obtenho o número da linha atual
        sgdrLinhas.Cells[0,y] := CdsLinhas.FieldByName('NUMLINHA').asString;

        // Obtenho a linha atual
        while (CdsLinhas.FieldByName('NUMLINHA').asInteger = y) and not(CdsLinhas.EOF) do
        begin
          if (CdsCampos.Locate('CODCAMPO',sgdrLinhas.Cells[x,0],[])) and
             (Copy(CdsCampos.FieldByName('TIPODADO').asString,1,1) = 'N') then
            sgdrLinhas.Cells[x,y] := FU.TrocaCaracter(CdsLinhas.FieldByName('VALOR').asString,'.',',')
          else
            sgdrLinhas.Cells[x,y] := CdsLinhas.FieldByName('VALOR').asString;

          Inc(x);
          CdsLinhas.Next;
          frmAguarde.Pos := frmAguarde.Pos + 1;
        end;
        Inc(y);

        if not(CdsLinhas.EOF) then
          sgdrLinhas.RowCount := sgdrLinhas.RowCount + 1;
      until (CdsLinhas.EOF);
    end;
    CdsCampos.EnableControls;
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
  if (Cds.Active) then
  begin
    if (Cds.State in ([dsInsert,dsEdit])) then
      Result := true
    else
      Result := not(Cds.IsEmpty);
  end
  else
    Result := false;
end;

procedure TfrmCadTabGener.FazerVoltarDet;
begin
  if (CdsCampos.State in [dsEdit,dsInsert]) then
    CdsCampos.Cancel;

  tb97Detalhe.Visible := false;

  dbgrdCampos.BringToFront;
  AtualizaBotoesDetalhe;
end;

procedure TfrmCadTabGener.AtualizaBotoesDetalhe;
begin
  if (CmeCadastro.Operacao in [opInserir,opAlterar]) and (VerificaMestre) then
  begin
    sbtnInserirDet.Enabled := (Cds.State in [dsInsert,dsEdit]);
    sbtnAlterarDet.Enabled := (Cds.State in [dsInsert,dsEdit]) and not(CdsCampos.IsEmpty);
    sbtnExcluirDet.Enabled := (Cds.State in [dsInsert,dsEdit]) and not(CdsCampos.IsEmpty);
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
  CdsCampos.Cancel;
  dbgrdCampos.BringToFront;

  tb97Detalhe.Visible := false;
  dc97OkCancel.Visible := false;
  AtualizaBotoesDetalhe;
end;

procedure TfrmCadTabGener.HabilitaBotoes(Opcao: boolean);
begin
  sbtnInserir.Enabled := Opcao;
  sbtnAlterar.Enabled := Opcao;
  sbtnApagar.Enabled := Opcao;
  sbtnProcurar.Enabled := Opcao;

  bbtnConfirmar.Enabled := (Opcao) and (Cds.State in [dsInsert, dsEdit]);
  bbtnCancelar.Enabled := (Opcao) and (Cds.State in [dsInsert, dsEdit]);
  bbtnSair.Enabled := Opcao;
  bbtnAjuda.Enabled := Opcao;

  sbtnExportar.Enabled := Opcao;
  sbtnImportar.Enabled := Opcao;
  pnlFundo.Enabled := Opcao;
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
      break;
    end;
  bbtnOkDir.Enabled := bAchou;
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
      FU.ExtraiString(sLinha,sColuna,#1#2);
      chklstCampos.Items.Add(sColuna);
    until (sLinha = '') or (sLinha = #1#2);

    if (chklstCampos.Items.Count > 0) then
      for c:=0 to chklstCampos.Items.Count-1 do
        chklstCampos.Checked[c] := true;
    chklstCampos.Repaint;
  except
  end;
end;

procedure TfrmCadTabGener.Progresso(Arg: array of variant);
begin
  frmAguarde.Pos := frmAguarde.Pos + 1;
  Self.Update;
end;

end.
