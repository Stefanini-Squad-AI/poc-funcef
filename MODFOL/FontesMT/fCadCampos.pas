unit fCadCampos;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs, fCadastroMT,
  IvDictio, IvMulti, IvEMulti, MontaSelect, DBTables, Db, Wwdatsrc, Wwquery, TB97Ctls,
  MAHlpBtn, StdCtrls, Buttons, TB97Tlbr, TB97, ExtCtrls, wwdblook, DBCtrls, Mask, wwdbedit,
  CmEventosCadastro, ImgList, DBClient, uCMClientDataSet, uCtrlCampos;

type
  TfrmCadCampos = class(TfrmCadastroMT)
    Label4: TLabel;
    CdsTabelas: TCMClientDataSet;
    CdsCampoTabela: TCMClientDataSet;
    CdsGrupos: TCMClientDataSet;
    CdsDet: TCMClientDataSet;
    Label1: TLabel;
    dbedIdCampo: TwwDBEdit;
    Label3: TLabel;
    dbedDescr: TwwDBEdit;
    Label2: TLabel;
    dedApelido: TwwDBEdit;
    Label8: TLabel;
    dblkpGrupo: TwwDBLookupCombo;
    lblLocal: TLabel;
    dblkpcmbArq: TwwDBLookupCombo;
    Label10: TLabel;
    dblkpcmbCampo: TwwDBLookupCombo;
    dbchkCampoObrigatorio: TDBCheckBox;
    dbchkCampoVirtual: TDBCheckBox;
    dbchkCampoChave: TDBCheckBox;
    dbrdTipoDado: TDBRadioGroup;
    procedure bbtnConfirmarClick(Sender: TObject);
    procedure sbtnApagarClick(Sender: TObject);
    procedure dblkpcmbArqExit(Sender: TObject);
    procedure sbtnInserirClick(Sender: TObject);
    procedure sbtnAlterarClick(Sender: TObject);
    procedure bbtnCancelarClick(Sender: TObject);
    Procedure CmeCadastroEdit(Sender: TObject);
    Procedure CmeCadastroFind(Sender: TObject);
    Procedure CmeCadastroInsert(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure CmeCadastroAfterConfirma(Sender: TObject);
    procedure CmeCadastroApplyInsert(sender: TObject; var Accept: Boolean);
    procedure CmeCadastroApplyEdit(sender: TObject; var Accept: Boolean);
    procedure dsStateChange(Sender: TObject);
    procedure CmeCadastroApplyDelete(sender: TObject; var Accept: Boolean);
  private
    CtrlCampos: TCtrlCampos;
    
    procedure Sel(IdCampo, CodGrupoArquivo: string);
    procedure Progresso(Args: array of variant);
    function GravarRegistro: boolean;
  end;

var
  frmCadCampos: TfrmCadCampos;

implementation

uses uSistema, uMensErro, uCtrlPadroes, fAguarde;

{$R *.DFM}

procedure TfrmCadCampos.FormCreate(Sender: TObject);
begin
  inherited;
  CtrlCampos := TCtrlCampos.Create;
  CtrlCampos.InitializeAs(Padroes);
  CtrlCampos.Progresso := Progresso;  
  CtrlCampos.Cds := Cds;
  CtrlCampos.CdsDet := CdsDet;  
  Sel('-1', '-1');

  CdsTabelas.Data := CtrlCampos.ListTabelas;
  CdsGrupos.Data := CtrlCampos.ListGrupos;

  dblkpcmbArqExit(Sender);
end;

procedure TfrmCadCampos.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  FreeAndNil(CtrlCampos);
  inherited;
end;

procedure TfrmCadCampos.CmeCadastroFind(Sender: TObject);
begin
  inherited;
  if (MontaSelect.RetornouValor) then
    Sel(MontaSelect.ValoresChave[0], MontaSelect.ValoresChave[1]);
end;

procedure TfrmCadCampos.CmeCadastroInsert(Sender: TObject);
begin
  inherited;
  Cds.FieldByName('FLGOBRIGATORIO').asInteger := 0;
  Cds.FieldByName('CAMPODOBANCO').asInteger := 1;
  Cds.FieldByName('CHAVE').asInteger := 0;
  Cds.FieldByName('IDTIPODADO').asInteger := 2;
  dblkpGrupo.Text := '';
end;

procedure TfrmCadCampos.CmeCadastroEdit(Sender: TObject);
begin
  inherited;
  dblkpGrupo.LookupValue := CdsDet.FieldByName('CODGRUPOARQUIVO').asString;
  if (CdsGrupos.Locate('CODGRUPOARQUIVO', dblkpGrupo.LookupValue, [])) then
    dblkpGrupo.Text := CdsGrupos.FieldByName('DESCRICAO').asString;
end;

procedure TfrmCadCampos.CmeCadastroAfterConfirma(Sender: TObject);
begin
  //nherited;
end;

procedure TfrmCadCampos.CmeCadastroApplyInsert(sender: TObject; var Accept: Boolean);
begin
  inherited;
  Accept := GravarRegistro;
end;

procedure TfrmCadCampos.CmeCadastroApplyEdit(sender: TObject; var Accept: Boolean);
begin
  inherited;
  Accept := GravarRegistro;
end;

procedure TfrmCadCampos.CmeCadastroApplyDelete(sender: TObject; var Accept: Boolean);
begin
  inherited;
  Accept := GravarRegistro;
end;

procedure TfrmCadCampos.dsStateChange(Sender: TObject);
begin
  inherited;
  if (Cds.State in [dsInsert, dsEdit]) and (dbedIdCampo.CanFocus) then
    dbedIdCampo.SetFocus;
end;

procedure TfrmCadCampos.dblkpcmbArqExit(Sender: TObject);
begin
  if (dblkpcmbArq.Text <> '') then
    CdsCampoTabela.Data := CtrlCampos.ListCamposTabela(
      CdsTabelas.FieldByName('TABLENAME').asString);
end;

procedure TfrmCadCampos.sbtnInserirClick(Sender: TObject);
begin
  inherited;
  dblkpGrupo.Enabled := true;
end;

procedure TfrmCadCampos.sbtnAlterarClick(Sender: TObject);
begin
  inherited;
  dblkpGrupo.Enabled := false;
end;

procedure TfrmCadCampos.bbtnCancelarClick(Sender: TObject);
begin
  inherited;
  dblkpGrupo.Enabled := false;
end;

procedure TfrmCadCampos.sbtnApagarClick(Sender: TObject);
begin
  if (MsgDlg('Deseja realmente excluir este registro?', 'Exclusão',
      mtConfirmation, [mbYes,mbNo],0) = mrYes) then
  begin
    CtrlCampos.CreateThreadProgresso;

    if (CtrlCampos.Excluir(Cds.FieldByName('IDCAMPO').asString,
        CdsGrupos.FieldByName('CODGRUPOARQUIVO').asString)) then
    begin
      CtrlCampos.FreeThreadProgresso;
      frmAguarde.Apaga;
    end
    else
    begin
      CtrlCampos.FreeThreadProgresso;
      frmAguarde.Apaga;
      MsgDlg(CtrlCampos.MessageInfo, 'Erro', mtError, [mbOk,mbHelp], 0)
    end;

    dblkpGrupo.Text := '';
  end;

  sbtnApagar.Down := false;
end;

procedure TfrmCadCampos.bbtnConfirmarClick(Sender: TObject);
begin
  if (Trim(dbedIdCampo.Text) = '') then
  begin
    MsgDlg('Preencha o Código Resumido.', 'Aviso', mtWarning, [mbOk, mbHelp], 0);
    dbedIdCampo.SetFocus;
  end
  else
  if (Trim(dbedDescr.Text) = '') then
  begin
    MsgDlg('Preencha a Descrição.', 'Aviso', mtWarning, [mbOk, mbHelp], 0);
    dbedDescr.SetFocus;
  end
  else
  if (Trim(dblkpGrupo.Text) = '') then
  begin
    MsgDlg('Preencha o Grupo de Dados.', 'Aviso', mtWarning, [mbOk, mbHelp], 0);
    dblkpGrupo.SetFocus;
  end
  else
  if (Trim(dblkpcmbArq.Text) = '') then
  begin
    MsgDlg('Preencha o Arquivo de Dados.', 'Aviso', mtWarning, [mbOk, mbHelp], 0);
    dblkpcmbArq.SetFocus;
  end
  else
  if (Trim(dblkpcmbCampo.Text) = '') then
  begin
    MsgDlg('Preencha o Nome do Campo no Arquivo de Dados.', 'Aviso', mtWarning, [mbOk, mbHelp], 0);
    dblkpcmbCampo.SetFocus;
  end
  else
    inherited;

  if (Cds.State = dsInsert) then
  begin
    dblkpGrupo.Text := '';
    dblkpGrupo.Enabled := true;
    Sel('-1', '-1');
    sbtnInserirClick(Sender);
  end
  else
  begin
    dblkpGrupo.Enabled := false;
    Sel(MontaSelect.ValoresChave[0], MontaSelect.ValoresChave[1]);
//    sbtnAlterarClick(Sender);
  end;
end;

procedure TfrmCadCampos.Sel(IdCampo, CodGrupoArquivo: string);
begin
  Cds.Data := CtrlCampos.ListMestre(IdCampo);
  CdsDet.Data := CtrlCampos.ListDetalhe(IdCampo, CodGrupoArquivo);
  dblkpcmbArqExit(nil);

  if not(CdsDet.IsEmpty) and (CdsGrupos.Locate('CODGRUPOARQUIVO', CodGrupoArquivo, [])) then
    dblkpGrupo.Text := CdsGrupos.FieldByName('DESCRICAO').asString;
end;

// -------------------------------------------------------------------------------------
// Funções do Form
// -------------------------------------------------------------------------------------

procedure TfrmCadCampos.Progresso(Args: array of variant);
begin
  if (Args[0] <> '') then
    frmAguarde.Mostra(Args[0]);
end;

function TfrmCadCampos.GravarRegistro: boolean;
begin
  Result := CtrlCampos.Gravar(CdsGrupos.FieldByName('CODGRUPOARQUIVO').asString);
  if not(Result) then
    raise Exception.Create(CtrlCampos.MessageInfo);
end;

end.
