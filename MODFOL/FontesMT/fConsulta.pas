unit fConsulta;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs, fSairAjuda,
  Db, DBTables, ComCtrls, IvDictio, IvMulti, IvEMulti, MAHlpBtn, StdCtrls, Buttons, TB97Tlbr,
  TB97, ExtCtrls, Wwdatsrc, DBCtrls, FileCtrl, ImgList, DBClient, uCMClientDataSet,
  uCtrlListTerceirosRH;

type
  TNoArvore = ^string;

  TfrmConsulta = class(TfrmSairAjuda)
    dsTabela: TwwDataSource;
    dsCampo: TwwDataSource;
    ImgLstCampos: TImageList;
    bbtnAtualizar: TBitBtn;
    pgtrlPrincipal: TPageControl;
    tbshCampos: TTabSheet;
    tbshTabela: TTabSheet;
    trvCampos: TTreeView;
    trvTabela: TTreeView;
    CdsCampo: TCMClientDataSet;
    CdsTabela: TCMClientDataSet;
    bbtnConfirmar: TBitBtn;
    ToolbarSep971: TToolbarSep97;
    procedure FormCreate(Sender: TObject);
    procedure trvTabelaExpanding(Sender: TObject; Node: TTreeNode;
      var AllowExpansion: Boolean);
    procedure trvCamposDblClick(Sender: TObject);
    procedure trvTabelaDblClick(Sender: TObject);
    procedure bbtnConfirmarClick(Sender: TObject);
    procedure bbtnSairClick(Sender: TObject);
    procedure bbtnAtualizarClick(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure FormDestroy(Sender: TObject);
    procedure FormShow(Sender: TObject);
  private
    CtrlListTerceirosRH: TCtrlListTerceirosRH;

    FTipoCampo, FChaveCampo: string;

    procedure PreencherNo_Tabela;
    procedure PreencherNo_Campo;
    procedure PreencherTree(var Arvore: TTreeView; Cds: TCMClientDataSet;
      Chave, Descricao, DescricaoGrupo: string; Aguarde: boolean);
    procedure PreencheUmNivel(var Arvore: TTreeView; Cds: TCMClientDataSet;
      Chave, Descricao, DescricaoGrupo: string; Aguarde: boolean);
    procedure SetarValoresCampo(TipoCampo, ChaveCampo: string);
  public
    property TipoCampo: string read FTipoCampo;
    property ChaveCampo: string read FChaveCampo;
  end;

var
  frmConsulta: TfrmConsulta;

implementation

uses fAguarde, uCtrlPadroes, uCtrlUsoGeralRH;

{$R *.DFM}

procedure TfrmConsulta.FormCreate(Sender: TObject);
begin
  CtrlListTerceirosRH := TCtrlListTerceirosRH.Create(CtrlUsoGeralRH.UsuXFilial,
    CtrlUsoGeralRH.UsuXCCusto, CtrlUsoGeralRH.IdUsuarioGeral);
  CtrlListTerceirosRH.InitializeAs(Padroes);

  pgtrlPrincipal.ActivePageIndex := 0;
end;

procedure TfrmConsulta.FormDestroy(Sender: TObject);
begin
  FreeAndNil(CtrlListTerceirosRH);
  inherited;
end;

procedure TfrmConsulta.FormShow(Sender: TObject);
begin
  if not(CdsCampo.Active) then
  begin
    frmAguarde.Mostra('Atualizando Dados...');
    frmAguarde.Refresh;
    CdsCampo.Data := CtrlListTerceirosRH.ListCamposCM;
    CdsTabela.Data := CtrlListTerceirosRH.ListTabela_Generica_E_Longa;

    frmAguarde.Mostra('Preenchendo Componentes...');
    frmAguarde.Refresh;
    PreencherTree(trvCampos, CdsCampo, 'CODGRUPOARQUIVO', 'DESCRICAODOCAMPO',
      'DESCGRUPOARQUIVO', false);
    PreencherTree(trvTabela, CdsTabela, 'CODGRUPOFORMULA', 'DESCRICAOFORMULA',
      'DESCGRUPOFORMULA', false);
    frmAguarde.Apaga;  
  end;
  inherited;
end;

procedure TfrmConsulta.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  // inherited; Só para inibir o Action := caFree;
  Action := caHide;
end;

procedure TfrmConsulta.trvTabelaExpanding(Sender: TObject; Node: TTreeNode;
  var AllowExpansion: Boolean);
begin
  Node.Selected := true;
end;

procedure TfrmConsulta.trvCamposDblClick(Sender: TObject);
begin
  trvCampos.Selected.Selected := true;

  if (trvCampos.Items.Count <> 0) then
  begin
    if (trvCampos.Selected.Level = 0) then
    begin
      if not(trvCampos.Selected.haschildren) then
      begin
        frmAguarde.Mostra('Selecionando Dados...');
        frmAguarde.Refresh;
        PreencherNo_Campo;
        frmAguarde.Apaga;
      end;

      if (trvCampos.Selected.Level = 1) then
      begin
        CdsCampo.Data := CtrlListTerceirosRH.ListCamposCM;
        if (CdsCampo.Locate('DESCRICAODOCAMPO', trvCampos.Selected.Text, [loCaseInsensitive])) then
          SetarValoresCampo('C', CdsCampo.FieldByName('NomedoCampo').asString)
        else
          SetarValoresCampo('', '');

        Close;
      end;
    end
    else
    begin
      CdsCampo.Data := CtrlListTerceirosRH.ListCamposCM;
      if (CdsCampo.Locate('DESCRICAODOCAMPO', trvCampos.Selected.Text, [loCaseInsensitive])) then
        SetarValoresCampo('C', CdsCampo.FieldByName('NomedoCampo').asString)
      else
        SetarValoresCampo('', '');
        
      Close;
    end;
  end;
end;

procedure TfrmConsulta.trvTabelaDblClick(Sender: TObject);
begin
  if (trvTabela.Selected.Level = 1) then
  begin
    CdsTabela.Data := CtrlListTerceirosRH.ListTabela_Generica_E_Longa;
    if (CdsTabela.Locate('DescricaoFormula', trvTabela.Selected.Text, [loCaseInsensitive])) then
      SetarValoresCampo('F', CdsTabela.FieldByName('IdFormula').asString)
    else
      SetarValoresCampo('', '');

    Close;
  end
  else
  begin
    if not(trvTabela.Selected.haschildren) then
    begin
      frmAguarde.Mostra('Selecionando Dados...');
      frmAguarde.Refresh;
      PreencherNo_Tabela;
      frmAguarde.Apaga;
    end
    else
      trvTabela.Selected.DeleteChildren;
  end;
end;

procedure TfrmConsulta.bbtnAtualizarClick(Sender: TObject);
begin
  frmAguarde.Mostra('Atualizando Dados...');
  frmAguarde.Refresh;
  case (pgtrlPrincipal.ActivePageIndex) of
    0 :
    begin
      CdsCampo.Data := CtrlListTerceirosRH.ListCamposCM;
      frmAguarde.Mostra('Preenchendo Componentes...');
      frmAguarde.Refresh;
      PreencherTree(trvCampos, CdsCampo, 'CODGRUPOARQUIVO', 'DESCRICAODOCAMPO',
        'DESCGRUPOARQUIVO', true);
    end;
    2 :
    begin
      CdsTabela.Data := CtrlListTerceirosRH.ListTabela_Generica_E_Longa;
      frmAguarde.Mostra('Preenchendo Componentes...');
      frmAguarde.Refresh;
      PreencherTree(trvTabela, CdsTabela, 'CODGRUPOFORMULA', 'DESCRICAOFORMULA',
        'DESCGRUPOFORMULA', true);
    end;
  end;
  frmAguarde.Apaga;
end;

procedure TfrmConsulta.bbtnConfirmarClick(Sender: TObject);
begin
  if (pgtrlPrincipal.ActivePageIndex = 0) then
    PreencherNo_Campo
  else
    PreencherNo_Tabela;

  Close;
end;

procedure TfrmConsulta.bbtnSairClick(Sender: TObject);
begin
  SetarValoresCampo('', '');
  Close;
end;

// -----------------------------------------------------------------------------------------
// Funções do Form
// -----------------------------------------------------------------------------------------

procedure TfrmConsulta.PreencherTree(var Arvore: TTreeView; Cds: TCMClientDataSet;
  Chave, Descricao, DescricaoGrupo: string; Aguarde: boolean);
var
  sCodAnterior, sDescInsert: string;
  iUltIndNivel1, iUltInsert: integer;
  NoArvore: TNoArvore;
begin
  Arvore.Items.Clear;
  sCodAnterior := '';
  iUltIndNivel1 := -1;
  iUltInsert := -1;

  Cds.First;
  if (Aguarde) then
  begin
    frmAguarde.Pos := 0;
    frmAguarde.Max := Cds.RecordCount;
    frmAguarde.Min := 0;
  end;

  while not(Cds.EOF) do
  begin
    if (Aguarde) then
      frmAguarde.Pos := frmAguarde.Pos + 1;

    New(NoArvore);
    NoArvore^ := Cds.FieldByName(Chave).asString;

    if (sCodAnterior <> Cds.FieldByName(Chave).asString) then
    begin
      sCodAnterior := Cds.FieldByName(Chave).asString;

      if (Trim(Cds.FieldByName(DescricaoGrupo).asString) = '') then
        sDescInsert := 'Grupo Indeterminado'
      else
        sDescInsert := Cds.FieldByName(DescricaoGrupo).asString;

      if (iUltIndNivel1 = -1) then
      begin
        Arvore.Items.Addobject(nil, sDescInsert, NoArvore);
        Inc(iUltIndNivel1);
        Inc(iUltInsert);
        Arvore.Items[iUltIndNivel1].ImageIndex := 0;
      end
      else
      begin
        Arvore.Items.AddObject(Arvore.items[0], sDescInsert, NoArvore);
        Inc(iUltInsert);
        iUltIndNivel1 := iUltInsert;
        Arvore.Items[iUltIndNivel1].ImageIndex := 0;
        Arvore.Items[iUltInsert].selectedIndex := 3;
      end;
    end;
    Cds.Next;
  end;

  if (Aguarde) then
  begin
    frmAguarde.Min := -1;
    frmAguarde.Apaga;
  end;
end;

procedure TfrmConsulta.PreencheUmNivel(var Arvore: TTreeView; Cds: TCMClientDataSet;
  Chave,Descricao,DescricaoGrupo:string; Aguarde:boolean);
var
  NoArvore: TNoArvore;
  c: integer;
begin
  if (Aguarde) then
  begin
    frmAguarde.Pos := 0;
    frmAguarde.Max := Cds.RecordCount;
    frmAguarde.Min := 0;
  end;

  Arvore.Selected.DeleteChildren;
  Cds.First;
  c := Arvore.Selected.AbsoluteIndex;
  while not(Cds.EOF) do
  begin
    if (Aguarde) then
      frmAguarde.Pos := frmAguarde.Pos + 1;

    New(NoArvore);
    NoArvore^ := Cds.FieldByName(Chave).asString;
    Arvore.Items.AddChildobject(Arvore.Selected, Cds.FieldByName(Descricao).asString, NoArvore);
    Inc(c);
    Arvore.Items[c].ImageIndex := 1;
    Arvore.Items[c].SelectedIndex := 2;
    Cds.Next;
  end;
  Arvore.Selected.Expand(true);

  if (Aguarde) then
  begin
    frmAguarde.Min := -1;
    frmAguarde.Apaga;
  end;
end;

procedure TfrmConsulta.PreencherNo_Campo;
begin
  if (trvCampos.Items.Count <> 0) then
  begin
    if (trvCampos.Selected.Level = 0) then
    begin
      if not(trvCampos.Selected.HasChildren) then
      begin
        CdsCampo.Data := CtrlListTerceirosRH.ListCamposCM(
          TNoArvore(trvCampos.Selected.Data)^);
        PreencheUmNivel(trvCampos, CdsCampo, 'CODGRUPOARQUIVO', 'DESCRICAODOCAMPO',
          'DESCGRUPOARQUIVO', true);
      end;
    end
    else
    begin
      CdsCampo.Data := CtrlListTerceirosRH.ListCamposCM;
      if (CdsCampo.Locate('DescricaoDoCampo', trvCampos.Selected.Text,
          [loCaseInsensitive])) then
        SetarValoresCampo('C', CdsCampo.FieldByName('NomedoCampo').asString)
      else
        SetarValoresCampo('', '');

      Close;
    end;
  end;
end;

procedure TfrmConsulta.PreencherNo_Tabela;
begin
  if (trvTabela.Selected.level = 0) then
  begin
    if not(trvTabela.Selected.HasChildren) then
    begin
      CdsTabela.Data := CtrlListTerceirosRH.ListTabela_Generica_E_Longa(
        TNoArvore(trvTabela.Selected.Data)^);
      PreencheUmNivel(trvTabela, CdsTabela, 'CodGrupoFormula', 'DescricaoFormula',
        'DescGrupoFormula', true);
    end;
    SetarValoresCampo('F', TNoArvore(trvTabela.Selected.Data)^);
  end
  else
  begin
    CdsTabela.Data := CtrlListTerceirosRH.ListTabela_Generica_E_Longa;
    if (CdsTabela.Locate('CodGrupoFormula;DescricaoFormula', VarArrayOf([
        TNoArvore(trvTabela.Selected.Data)^, trvTabela.Selected.Text]),
        [loCaseInsensitive])) then
      SetarValoresCampo('F', CdsTabela.FieldByName('IdFormula').asString)
    else
      SetarValoresCampo('', '');

    Close;
  end;
end;

procedure TfrmConsulta.SetarValoresCampo(TipoCampo, ChaveCampo: string);
begin
  FChaveCampo := ChaveCampo;
  FTipoCampo := TipoCampo;
end;

end.
