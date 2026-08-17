// *****************************************************************************
// ***************************** REGISTRO DE ALTERAÇÕES ************************
// *****************************************************************************
// Autor(a)    :  Ádler Teodoro de Souza
// Data        :  26/02/2009
// Pendência   : SOL 109421 KINTANA 496332
// Descricao   :  Alteração de gravação de arquivos de log na raiz do disco C: .
//------------------------------------------------------------------------------
unit fCadTabLonga;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs, fCadastroMT,
  Spin, StdCtrls, Mask, wwdbedit, IvDictio, IvMulti, IvEMulti, MontaSelect, DBTables, Db,
  Wwdatsrc, TB97Ctls, MAHlpBtn, TB97Tlbr, Buttons, TB97, Grids, Wwdbigrd, Wwdbgrid, ComCtrls,
  TabControlDetalhe, ExtCtrls, Menus, DBGrids, CmEventosCadastro, ImgList, DBClient,
  uCMClientDataSet, uCtrlTabLonga, USistema;
    
type
  TfrmCadTabLonga = class(TFrmCadastroMT)
    dedNome: TwwDBEdit;
    Label1: TLabel;
    Label2: TLabel;
    wwDBEdit2: TwwDBEdit;
    Label3: TLabel;
    Spin: TSpinEdit;
    dsCmp: TwwDataSource;
    ppmTab: TPopupMenu;
    mnuIncluirCampo: TMenuItem;
    mnuAlterarCampo: TMenuItem;
    mnuVisualizarCampos: TMenuItem;
    mnuExcluirCampo: TMenuItem;
    bbtnExportar: TBitBtn;
    SaveDialog: TSaveDialog;
    CdsCmp: TCMClientDataSet;
    dsDet: TwwDataSource;
    Panel1: TPanel;
    sbtnInsDet: TToolbarButton97;
    sbtnAltDet: TToolbarButton97;
    sbtnExcDet: TToolbarButton97;
    ntbDetalhes: TNotebook;
    dbgrdDet: TwwDBGrid;
    dbgdCmp: TwwDBGrid;
    lblOBS: TLabel;
    CdsDet: TCMClientDataSet;
    N1: TMenuItem;
    sbtnCopiar: TToolbarButton97;
    procedure mnuVisualizarCamposClick(Sender: TObject);
    procedure mnuAlterarCampoClick(Sender: TObject);
    procedure mnuIncluirCampoClick(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure sbtnExcDetClick(Sender: TObject);
    procedure sbtnInsDetClick(Sender: TObject);
    procedure sbtnAltDetClick(Sender: TObject);
    procedure bbtnConfirmarClick(Sender: TObject);
    procedure bbtnCancelarClick(Sender: TObject);
    procedure sbtnCopiarClick(Sender: TObject);
    procedure bbtnExportarClick(Sender: TObject);
    procedure sbtnApagarClick(Sender: TObject);
    Procedure CmeCadastroFind(Sender: TObject);
    Procedure CmeCadastroInsert(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure CmeCadastroApplyInsert(sender: TObject; var Accept: Boolean);
    procedure CmeCadastroApplyEdit(sender: TObject; var Accept: Boolean);
    procedure CmeCadastroAfterConfirma(Sender: TObject);
    procedure dsStateChange(Sender: TObject);
    procedure mnuExcluirCampoClick(Sender: TObject);
    procedure CmeCadastroAtualizaBotoes(Sender: TObject);
    procedure CmeCadastroEdit(Sender: TObject);
  private
    CtrlTabLonga: TCtrlTabLonga;

    bInclusao: boolean;
    iProxNumLinha: integer;
    sNomeCampoNovo, sNomeCampoAtual: string;

    procedure Sel(SelPrincipal: boolean; IdTabela: double);
    function  GravarRegistro: boolean;
  end;

var
  frmCadTabLonga: TfrmCadTabLonga;

implementation

uses uMensErro, fAguarde, uCtrlFuncoesRH, uCtrlPadroes;

{$R *.DFM}

procedure TfrmCadTabLonga.FormCreate(Sender: TObject);
begin
  inherited;
  CtrlTabLonga := TCtrlTabLonga.Create;
  CtrlTabLonga.InitializeAs(Padroes);
  CtrlTabLonga.CdsLongTabGener := Cds;
  CtrlTabLonga.CdsLongValTabGener := CdsDet;
  CtrlTabLonga.CdsLongCmpTabGener := CdsCmp;

  Sel(true, -1);
  ntbDetalhes.ActivePage := 'Valores';

  SaveDialog.InitialDir := Sistema.RetornaCaminhoArquivos(Sistema.IdEmpresa);
  //Ádler Teodoro de Souza SOL 109421 KINTANA 496332

end;

procedure TfrmCadTabLonga.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  FreeAndNil(CtrlTabLonga);
  inherited;
end;

procedure TfrmCadTabLonga.CmeCadastroAtualizaBotoes(Sender: TObject);
begin
  inherited;
  pnlFundo.Enabled := true;
  sbtnInsDet.Enabled := (Cds.State in [dsInsert,dsEdit]);
  sbtnAltDet.Enabled := (Cds.State in [dsInsert,dsEdit]);
  sbtnExcDet.Enabled := (Cds.State in [dsInsert,dsEdit]);
end;

procedure TfrmCadTabLonga.CmeCadastroFind(Sender: TObject);
begin
  inherited;
  if (MontaSelect.RetornouValor) then
    Sel(true, StrToFloat(MontaSelect.ValoresChave[0]));
end;

procedure TfrmCadTabLonga.CmeCadastroInsert(Sender: TObject);
begin
  inherited;
  Sel(false, -1);
  dbgrdDet.PopupMenu := ppmTab;
  dbgdCmp.PopupMenu := ppmTab;
  bInclusao := true;
end;

procedure TfrmCadTabLonga.CmeCadastroEdit(Sender: TObject);
begin
  inherited;
  dbgrdDet.PopupMenu := ppmTab;
  dbgdCmp.PopupMenu := ppmTab;
  bInclusao := false;
end;

procedure TfrmCadTabLonga.CmeCadastroAfterConfirma(Sender: TObject);
begin
  //inherited;
end;

procedure TfrmCadTabLonga.CmeCadastroApplyInsert(sender: TObject; var Accept: Boolean);
begin
  inherited;
  Accept := GravarRegistro;
end;

procedure TfrmCadTabLonga.CmeCadastroApplyEdit(sender: TObject; var Accept: Boolean);
begin
  inherited;
  Accept := GravarRegistro;
end;

procedure TfrmCadTabLonga.dsStateChange(Sender: TObject);
begin
  inherited;
  sbtnCopiar.Enabled := (Cds.State = dsBrowse) and not(Cds.IsEmpty);
  if (Cds.State in [dsInsert,dsEdit]) and (dedNome.CanFocus) then
    dedNome.SetFocus;
end;

procedure TfrmCadTabLonga.sbtnApagarClick(Sender: TObject);
var
  bOk: boolean;
begin
  if (MsgDlg('Deseja excluir tabela?', 'Exclusão', mtConfirmation, [mbYes,mbNo],0) = mrYes) then
  begin
    frmAguarde.Mostra('Excluindo Tabela Longa...');
    frmAguarde.pbAguarde.Visible := false;
    frmAguarde.Refresh;

    bOk := CtrlTabLonga.ExcluirTabGener;

    frmAguarde.pbAguarde.Visible := true;
    frmAguarde.Apaga;

    sbtnApagar.Down := false;
    if not(bOk) then
    begin
      Cds.CancelUpdates;
      CdsDet.CancelUpdates;
      CdsCmp.CancelUpdates;
      raise Exception.Create('Tabela não pode ser excluída.');
    end
    else
    begin
      Cds.EmptyDataSet;
      Sel(false, -1);
    end;
  end;
end;

procedure TfrmCadTabLonga.sbtnInsDetClick(Sender: TObject);
begin
  CdsDet.Append;
  CdsDet.FieldByName('NUMLINHA').asInteger := iProxNumLinha;
  Inc(iProxNumLinha);
  sbtnInsDet.Down := false;
end;

procedure TfrmCadTabLonga.sbtnAltDetClick(Sender: TObject);
begin
  CdsDet.Edit;
  sbtnAltDet.Down := false;
end;

procedure TfrmCadTabLonga.sbtnExcDetClick(Sender: TObject);
begin
  if (ntbDetalhes.ActivePage = 'Valores') and
     (MsgDlg('Deseja excluir linha da tabela?', 'Exclusão', mtConfirmation,
      [mbYes,mbNo], 0) = mrYes) then
    CdsDet.Delete;

  sbtnExcDet.Down := false;
end;

procedure TfrmCadTabLonga.mnuIncluirCampoClick(Sender: TObject);
var
  i, iNumCampo: LongInt;
begin
  iNumCampo := 2;
  for i:=2 to CdsDet.FieldCount do
  begin
    if not(CdsDet.Fields[i].Visible) then
      break;
    Inc(iNumCampo);
  end;

  sNomeCampoAtual := CdsDet.Fields[iNumCampo].DisplayLabel;
  if not(InputQuery('Nomear campo', 'Informe o nome do campo:', sNomeCampoAtual)) then
    exit;
  sNomeCampoNovo := sNomeCampoAtual;

  CdsDet.Fields[iNumCampo].Visible := true;
  CdsDet.Fields[iNumCampo].DisplayLabel := UpperCase(sNomeCampoNovo);

  if not(CdsCmp.Locate('IDCAMPO', iNumCampo-1, [])) then
  begin
    CdsCmp.Insert;
    CdsCmp.FieldByName('IDCAMPO').asInteger := iNumCampo-1;
    CdsCmp.FieldByName('DESCRICAO').asString := UpperCase(sNomeCampoNovo);
    CdsCmp.Post;
  end;

  Spin.Value := Spin.Value + 1;  
end;

procedure TfrmCadTabLonga.mnuAlterarCampoClick(Sender: TObject);
begin
  sNomeCampoAtual := dbgrdDet.SelectedField.DisplayLabel;
  if not(InputQuery('Nomear campo', 'Informe o nome do campo:', sNomeCampoAtual)) then
    exit;
  sNomeCampoNovo := sNomeCampoAtual;

  dbgrdDet.SelectedField.DisplayLabel := UpperCase(sNomeCampoNovo);
  if CdsCmp.Locate('DESCRICAO', sNomeCampoAtual, []) then
  begin
    CdsCmp.Edit;
    CdsCmp.FieldByName('DESCRICAO').asString := UpperCase(sNomeCampoNovo);
    CdsCmp.Post;
  end;
end;

procedure TfrmCadTabLonga.mnuExcluirCampoClick(Sender: TObject);
var
  sNomeCampo: string;
begin
  CdsCmp.Locate('DESCRICAO', dbgrdDet.SelectedField.DisplayLabel, []);
  if (MsgDlg('Deseja excluir o campo ' +CdsCmp.FieldByName('DESCRICAO').asString+ '?',
     'Exclusão', mtConfirmation, [mbYes,mbNo],0) = mrYes) then
  begin
    CdsCmp.Delete;

    sNomeCampo := dbgrdDet.SelectedField.FieldName;

    CdsDet.DisableControls;
    CdsDet.First;
    while not(CdsDet.EOF) do
    begin
      CdsDet.Edit;
      CdsDet.FieldByName(sNomeCampo).asString := '';
      CdsDet.Post;
      CdsDet.Next;
    end;
    CdsDet.First;
    CdsDet.EnableControls;
    
    dbgrdDet.SelectedField.Visible := false;
    Spin.Value := Spin.Value - 1;
  end;
end;

procedure TfrmCadTabLonga.mnuVisualizarCamposClick(Sender: TObject);
begin
  if (mnuIncluirCampo.Visible) then
  begin
    mnuIncluirCampo.Visible := false;
    mnuAlterarCampo.Visible := false;
    mnuExcluirCampo.Visible := false;
    sbtnInsDet.Enabled := false;
    sbtnAltDet.Enabled := false;
    sbtnExcDet.Enabled := false;
    mnuVisualizarCampos.Caption := '&Voltar';
    dbgdCmp.BringToFront;
    ntbDetalhes.ActivePage := 'Campos';
  end
  else
  begin
    mnuIncluirCampo.Visible := true;
    mnuAlterarCampo.Visible := true;
    mnuExcluirCampo.Visible := true;
    sbtnInsDet.Enabled := true;
    sbtnAltDet.Enabled := true;
    sbtnExcDet.Enabled := true;
    mnuVisualizarCampos.Caption := '&Visualizar Campos';
    dbgrdDet.BringToFront;
    ntbDetalhes.ActivePage := 'Valores';
  end;
end;

procedure TfrmCadTabLonga.sbtnCopiarClick(Sender: TObject);
var
  bOk: boolean;
begin
  if (MsgDlg('Deseja copiar esta tabela?', 'Confirmação', mtConfirmation,
      [mbYes,mbNo],0) = mrYes) then
  begin
    frmAguarde.Mostra('Copiando Tabela Longa...');
    frmAguarde.Refresh;

    bOk := CtrlTabLonga.CopiarTabLonga;
    frmAguarde.Apaga;

    if (bOk) then
      MsgDlg(CtrlTabLonga.MessageInfo, 'Aviso', mtInformation, [mbOk,mbHelp], 0)
    else
      MsgDlg(CtrlTabLonga.MessageInfo, 'Erro', mtError, [mbOk,mbHelp], 0);
  end;  
  sbtnCopiar.Down := false;
end;

procedure TfrmCadTabLonga.bbtnExportarClick(Sender: TObject);
var
  Aux: TStringList;
  c: byte;
  sLinha: string;
  wAcerto: LongInt;
begin
  Aux := TStringList.Create;

  try
    CdsDet.DisableControls;
    SaveDialog.FileName := FU.TrocaCaracter(Trim(dedNome.Text), ' ','_') + '.TXT';
    if (SaveDialog.Execute) then
    begin
      frmAguarde.Pos := 0;
      frmAguarde.Min := 0;
      frmAguarde.Max := CdsDet.RecordCount;
      frmAguarde.Mostra('Salvando Arquivo ' +SaveDialog.FileName+ '...');
      frmAguarde.Refresh;

      CdsDet.First;
      sLinha := '';
      for c:=2 to 101 do
      begin
        if (CdsDet.Fields[c].Visible) then
        begin
          wAcerto := 20 - Length(CdsDet.Fields[c].DisplayLabel);
          sLinha := sLinha + Trim(CdsDet.Fields[c].DisplayLabel) +' '+ FU.Replicate(' ',wAcerto);
        end;
      end;
      Aux.Add(sLinha);

      while not(CdsDet.EOF) do
      begin
        sLinha := '';
        for c:=0 to dbgrdDet.FieldCount-1 do
        begin
          try
            if (dbgrdDet.Fields[c].asString <> '') then
            begin
              wAcerto := 20 - Length(dbgrdDet.Fields[c].asString);
              sLinha := sLinha + Trim(dbgrdDet.Fields[c].asString)+' '+ FU.Replicate(' ',wAcerto);
            end;
          except
            raise;
          end;
        end;
        Aux.Add(sLinha);
        CdsDet.Next;
        frmAguarde.Pos := frmAguarde.Pos + 1;
      end;
      CdsDet.First;

      Aux.SaveToFile(SaveDialog.FileName);

      frmAguarde.Apaga;
      MsgDlg('Arquivo gerado com sucesso.', 'Aviso', mtInformation, [mbOk,mbHelp], 0);
    end;
    CdsDet.EnableControls;
  except
    on E: Exception do
      raise Exception.Create('Ocorreu um erro ao tentar exportar a Tabela Longa.'+CR_LF+
        'Erro:' +CR_LF+ E.Message);
  end;
  Aux.Free;
end;

procedure TfrmCadTabLonga.bbtnConfirmarClick(Sender: TObject);
begin
  if (Trim(dedNome.Text) = '') then
  begin
    MsgDlg('Preencha o nome.', 'Aviso', mtInformation, [mbOk, mbHelp], 0);
    exit;
  end;
  inherited;
  if not(bInclusao) and (MontaSelect.RetornouValor) then
  begin
    Sel(true, StrToFloat(MontaSelect.ValoresChave[0]));
    dbgrdDet.PopupMenu := nil;
    dbgdCmp.PopupMenu := nil;
  end;
end;

procedure TfrmCadTabLonga.bbtnCancelarClick(Sender: TObject);
begin
  inherited;
  dbgrdDet.PopupMenu := nil;
  dbgdCmp.PopupMenu := nil;
  CmeCadastroFind(Self);
  if (bInclusao) then
    bInclusao := false;
end;

// -----------------------------------------------------------------------------------------
// Funções do Form
// -----------------------------------------------------------------------------------------

procedure TfrmCadTabLonga.Sel(SelPrincipal: boolean; IdTabela: double);
var
  c: LongInt;
begin
  Cds.DisableControls;
  CdsDet.DisableControls;
  CdsCmp.DisableControls;

  frmAguarde.Mostra('Abrindo Tabelas ...');
  Self.Refresh;

  if (SelPrincipal) then
    Cds.Data := CtrlTabLonga.ListLongTabGener(IdTabela);

  CdsDet.Data := CtrlTabLonga.ListLongValTabGener(IdTabela);
  for c:=0 to 101 do
    CdsDet.Fields[c].Visible := false;

  CdsCmp.Data := CtrlTabLonga.ListLongCampoTabGener(IdTabela);
  c := 0;
  while not(CdsCmp.EOF) do
  begin
    if (CdsCmp.FieldByName('IDCAMPO').asInteger > 0) then
    begin
      CdsDet.Fields[CdsCmp.FieldByName('IDCAMPO').asInteger + 1].Visible := true;
      CdsDet.Fields[CdsCmp.FieldByName('IDCAMPO').asInteger + 1].DisplayLabel :=
        CdsCmp.FieldByName('DESCRICAO').asString;
      Inc(c);
    end;
    CdsCmp.Next;
  end;
  Spin.Value := c;
  dsStateChange(nil);

  // Pega o último número de Linha
  iProxNumLinha := CtrlTabLonga.GetProxNumLinhaLongValTabGener(IdTabela);

  Cds.EnableControls;
  CdsDet.EnableControls;
  CdsCmp.EnableControls;

  frmAguarde.Apaga;
end;

function TfrmCadTabLonga.GravarRegistro: boolean;
begin
  Result := CtrlTabLonga.GravarTabGener(Cds.Data, CdsCmp.Data, CdsDet.Data);
  if not(Result) then
    raise Exception.Create(CtrlTabLonga.MessageInfo);
end;

end.
