unit fElimHistRubSal;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs, fSairAjuda,
  MAHlpBtn, StdCtrls, Buttons, TB97Tlbr, TB97, ExtCtrls, Db, DBTables, Wwdatsrc, Mask,
  wwdbedit, Wwdotdot, Wwdbcomb, Machklb, wwdblook, checklst, Spin, IvDictio, IvMulti,
  IvEMulti, Grids, ComCtrls, DBClient, uCMClientDataSet, ColorCheckListBox, uCtrlMotivo,
  uCtrlElimHistRubSal, uCtrlGlobalRH, uCtrlPessoaFilialPessoa, uCtrlPessoaFuncionario,
  uCtrlProvDesc;

type
  TfrmElimHistRubSal = class(TfrmSairAjuda)
    CdsEstab: TCMClientDataSet;
    CdsMotivo: TCMClientDataSet;
    bbtnConfirmar: TBitBtn;
    ToolbarSep971: TToolbarSep97;
    CdsFunc: TCMClientDataSet;
    gbxTipoPag: TGroupBox;
    dblkcbMotivo: TwwDBLookupCombo;
    gbxEstab: TGroupBox;
    dblkcbEstab: TwwDBLookupCombo;
    gbxAnoMesRef: TGroupBox;
    cmbMes: TComboBox;
    speAno: TSpinEdit;
    rgDesfazerLancamentos: TRadioGroup;
    gbxFunc: TGroupBox;
    Paginas: TPageControl;
    tbshListaFunc: TTabSheet;
    chklstFunc: TColorCheckListBox;
    bbtnSelTodosFunc: TBitBtn;
    bbtnInverteSelFunc: TBitBtn;
    tbshFiltroFunc: TTabSheet;
    gbxTipContra: TGroupBox;
    cbxEfetivos: TCheckBox;
    cbxEspeciais: TCheckBox;
    cbxTemporarios: TCheckBox;
    cbxEstagiarios: TCheckBox;
    cbxTerceiros: TCheckBox;
    cbxProprietarios: TCheckBox;
    cbxAutonomos: TCheckBox;
    gbxSituacao: TGroupBox;
    cbxAtivos: TCheckBox;
    cbxAfastados: TCheckBox;
    cbxDemitidos: TCheckBox;
    tbshRubricas: TTabSheet;
    Label1: TLabel;
    chklstRubrica: TColorCheckListBox;
    edCodRubricas: TEdit;
    sbtnMarcarRub: TBitBtn;
    bbtnSelRub: TBitBtn;
    bbtnInvRub: TBitBtn;
    procedure FormCreate(Sender: TObject);
    procedure bbtnConfirmarClick(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure speAnoChange(Sender: TObject);
    procedure dblkcbEstabChange(Sender: TObject);
    procedure gbxSituacaoEnter(Sender: TObject);
    procedure gbxSituacaoExit(Sender: TObject);
    procedure gbxTipContraEnter(Sender: TObject);
    procedure gbxTipContraExit(Sender: TObject);
    procedure chklstFuncClickCheck(Sender: TObject);
    procedure bbtnSelTodosFuncClick(Sender: TObject);
    procedure bbtnInverteSelFuncClick(Sender: TObject);
    procedure bbtnSelRubClick(Sender: TObject);
    procedure bbtnInvRubClick(Sender: TObject);
    procedure chklstRubricaClickCheck(Sender: TObject);
    procedure sbtnMarcarRubClick(Sender: TObject);
    procedure chklstFuncKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure chklstRubricaKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
  private
    CtrlElimHistRubSal: TCtrlElimHistRubSal;
    CtrlMotivo: TCtrlMotivo;
    CtrlGlobalRH: TCtrlGlobalRH;
    CtrlPessoaFilialPessoa: TCtrlPessoaFilialPessoa;
    CtrlPessoaFuncionario: TCtrlPessoaFuncionario;
    CtrlProvDesc: TCtrlProvDesc;

    bSitAtivo, bSitAfast, bSitDemit, bTipContrEfet, bTipContrEspec, bTipContrTemp,
    bTipContrEst, bTipContrTerc, bTipContrProp, bTipContrAut: boolean;
    ListaFunc, ListaIdRubrica: TStringList;
    sIdEstab, sListaIdRubricaSel: string;

    procedure MudaListaFuncionarios;
    procedure HabilitaBtOk;
    procedure HabilitaDesfazerLancamentos;
  end;

var
  frmElimHistRubSal: TfrmElimHistRubSal;

implementation

uses uSistema, uMensErro, uCtrlPadroes, uCtrlFuncoesRH, fAguarde, dCds, uCtrlUsoGeralRH;

{$R *.DFM}

procedure TfrmElimHistRubSal.FormCreate(Sender: TObject);
var
  NormalIni: TDateTime;
begin
  inherited;
  ListaFunc := TStringList.Create;
  ListaIdRubrica := TStringList.Create;

  CtrlMotivo := TCtrlMotivo.Create;
  CtrlMotivo.InitializeAs(Padroes);

  CtrlGlobalRH := TCtrlGlobalRH.Create;
  CtrlGlobalRH.InitializeAs(Padroes);

  CtrlProvDesc := TCtrlProvDesc.Create;
  CtrlProvDesc.InitializeAs(Padroes);

  CtrlPessoaFuncionario := TCtrlPessoaFuncionario.Create(CtrlUsoGeralRH.UsuXFilial,
    CtrlUsoGeralRH.UsuXCCusto, CtrlUsoGeralRH.IdUsuarioGeral);
  CtrlPessoaFuncionario.InitializeAs(Padroes);

  CtrlPessoaFilialPessoa := TCtrlPessoaFilialPessoa.Create(CtrlUsoGeralRH.UsuXFilial,
    CtrlUsoGeralRH.UsuXCCusto, CtrlUsoGeralRH.IdUsuarioGeral);
  CtrlPessoaFilialPessoa.InitializeAs(Padroes);

  CtrlElimHistRubSal := TCtrlElimHistRubSal.Create;
  CtrlElimHistRubSal.InitializeAs(Padroes);

  CdsEstab.Data := CtrlPessoaFilialPessoa.ListPessoaEstab(IntToStr(Sistema.IdEmpresa));
  CdsMotivo.Data := CtrlMotivo.ListMotivo_Id_e_Descricao('F');

  // Monto a Lista de Rubricas
  chklstRubrica.Items.Clear;
  dmCds.Cds.Data := CtrlProvDesc.ListRubricaEmpresa(IntToStr(Sistema.IdEmpresa));
  while not(dmCds.Cds.EOF) do
  begin
    ListaIdRubrica.Add(dmCds.Cds.FieldByName('CODPROVDESC').asString);
    chklstRubrica.Items.Add(dmCds.Cds.FieldByName('DESCRPROVDESC').asString);
    dmCds.Cds.Next;
  end;

  sIdEstab := '';
  NormalIni := CtrlGlobalRH.GetNormalIni;
  cmbMes.ItemIndex := FU.ExtraiMes(NormalIni) - 1;
  speAno.Text := IntToStr(FU.ExtraiAno(NormalIni));

  Paginas.ActivePageIndex := 0;

  HabilitaBtOk;
end;

procedure TfrmElimHistRubSal.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  FreeAndNil(CtrlElimHistRubSal);
  FreeAndNil(CtrlMotivo);
  FreeAndNil(ListaFunc);
  FreeAndNil(ListaIdRubrica);
  FreeAndNil(CtrlGlobalRH);
  FreeAndNil(CtrlPessoaFilialPessoa);
  FreeAndNil(CtrlPessoaFuncionario);
  FreeAndNil(CtrlProvDesc);
  inherited;
end;

procedure TfrmElimHistRubSal.speAnoChange(Sender: TObject);
begin
  HabilitaBtOk;
end;

procedure TfrmElimHistRubSal.dblkcbEstabChange(Sender: TObject);
begin
  dblkcbEstab.Text := Trim(dblkcbEstab.Text);

  if (dblkcbEstab.Text <> sIdEstab) then
  begin
    MudaListaFuncionarios;
    sIdEstab := dblkcbEstab.Text;

    if (Paginas.ActivePage = tbshListaFunc) then
      chklstFunc.Repaint;
  end;
end;

procedure TfrmElimHistRubSal.chklstFuncKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  if (Key = VK_TAB) then
    chklstFuncClickCheck(Sender);
end;

procedure TfrmElimHistRubSal.chklstRubricaKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  if (Key = VK_TAB) then
    chklstRubricaClickCheck(Sender);
end;

procedure TfrmElimHistRubSal.gbxSituacaoEnter(Sender: TObject);
begin
  bSitAtivo := cbxAtivos.Checked;
  bSitAfast := cbxAfastados.Checked;
  bSitDemit := cbxDemitidos.Checked;
end;

procedure TfrmElimHistRubSal.gbxSituacaoExit(Sender: TObject);
begin
  if not(cbxAtivos.Checked) and not(cbxAfastados.Checked) and not(cbxDemitidos.Checked) then
  begin
    MsgDlg ('Pelo menos um Tipo de Situação deve ser selecionado.', 'Aviso',
      mtWarning, [mbOk,mbHelp], 0);
    gbxSituacao.SetFocus;
  end
  else
  if (bSitAtivo <> cbxAtivos.Checked) or (bSitAfast <> cbxAfastados.Checked) or
     (bSitDemit <> cbxDemitidos.Checked) then
    MudaListaFuncionarios;
end;

procedure TfrmElimHistRubSal.gbxTipContraEnter(Sender: TObject);
begin
  bTipContrEfet := cbxEfetivos.Checked;
  bTipContrEspec := cbxEspeciais.Checked;
  bTipContrTemp := cbxTemporarios.Checked;
  bTipContrEst := cbxEstagiarios.Checked;
  bTipContrTerc := cbxTerceiros.Checked;
  bTipContrProp := cbxProprietarios.Checked;
  bTipContrAut := cbxAutonomos.Checked;
end;

procedure TfrmElimHistRubSal.gbxTipContraExit(Sender: TObject);
begin
  if not(cbxEfetivos.Checked) and not(cbxEspeciais.Checked) and
     not(cbxTemporarios.Checked) and not(cbxTerceiros.Checked) and
     not(cbxProprietarios.Checked) and not(cbxAutonomos.Checked) and
     not(cbxEstagiarios.Checked) then
  begin
    MsgDlg('Pelo menos um Tipo de Contrato deve ser selecionado.', 'Aviso', mtWarning,
      [mbOk,mbHelp], 0);
    cbxEfetivos.SetFocus;
  end
  else
  if (bTipContrEfet <> cbxEfetivos.Checked) or (bTipContrEspec <> cbxEspeciais.Checked) or
     (bTipContrTemp <> cbxTemporarios.Checked) or (bTipContrEst <> cbxEstagiarios.Checked) or
     (bTipContrTerc <> cbxTerceiros.Checked) or (bTipContrProp <> cbxProprietarios.Checked) or
     (bTipContrAut <> cbxAutonomos.Checked) then
    MudaListaFuncionarios;
end;

procedure TfrmElimHistRubSal.chklstFuncClickCheck(Sender: TObject);
begin
  inherited;
  HabilitaBtOk;
end;

procedure TfrmElimHistRubSal.bbtnSelTodosFuncClick(Sender: TObject);
var
  c: integer;
begin
  for c:=0 to chklstFunc.Items.Count-1 do
    chklstFunc.Checked[c] := true;
  chklstFunc.Repaint;
  HabilitaBtOk;
end;

procedure TfrmElimHistRubSal.bbtnInverteSelFuncClick(Sender: TObject);
var
  c: integer;
begin
  for c:=0 to chklstFunc.Items.Count-1 do
    chklstFunc.Checked[c] := not(chklstFunc.Checked[c]);
  chklstFunc.Repaint;
  HabilitaBtOk;
end;

procedure TfrmElimHistRubSal.bbtnSelRubClick(Sender: TObject);
var
  c: integer;
begin
  for c:=0 to chklstRubrica.Items.Count-1 do
    chklstRubrica.Checked[c] := true;
  chklstRubrica.Repaint;
  FU.CriaListaOpcoes(chklstRubrica, ListaIdRubrica, sListaIdRubricaSel, ',', false);
  edCodRubricas.Text := sListaIdRubricaSel;
  HabilitaDesfazerLancamentos;
end;

procedure TfrmElimHistRubSal.bbtnInvRubClick(Sender: TObject);
var
  c: integer;
begin
  for c:=0 to chklstRubrica.Items.Count-1 do
    chklstRubrica.Checked[c] := not(chklstRubrica.Checked[c]);
  chklstRubrica.Repaint;
  FU.CriaListaOpcoes(chklstRubrica, ListaIdRubrica, sListaIdRubricaSel, ',', false);
  edCodRubricas.Text := sListaIdRubricaSel;
  HabilitaDesfazerLancamentos;
end;

procedure TfrmElimHistRubSal.chklstRubricaClickCheck(Sender: TObject);
begin
  FU.CriaListaOpcoes(chklstRubrica, ListaIdRubrica, sListaIdRubricaSel, ',', false);
  edCodRubricas.Text := sListaIdRubricaSel;
  HabilitaDesfazerLancamentos;
end;

procedure TfrmElimHistRubSal.sbtnMarcarRubClick(Sender: TObject);
begin
  edCodRubricas.Text := Trim(edCodRubricas.Text);
  FU.VerificaOpcoes(chklstRubrica, ListaIdRubrica, edCodRubricas.Text, ',');
  HabilitaBtOk;
  chklstRubrica.Repaint;
end;

procedure TfrmElimHistRubSal.bbtnConfirmarClick(Sender: TObject);
var
  wRub: word;
  iTotReg: integer;
  sIdFuncSel: string;
begin
  inherited;
  if (MsgDlg('Você está prestes a executar um procedimento que vai apagar as'+CR_LF+
            'rubricas já processadas para o(s) empregado(s) selecionado(s).'+CR_LF+
            'Confirma a execução?', 'Confirmação',
             mtConfirmation, [mbYes,mbNo,mbHelp], 0) = mrYes) then
  begin
    frmAguarde.Mostra('Obtendo e Contando as Rubricas Salariais...');
    frmAguarde.Pos := 0;

    // Funcionários escolhidos
    FU.CriaListaOpcoes(chklstFunc, ListaFunc, sIdFuncSel, ',', false);

    // Rubricas escolhidas
    wRub := FU.CriaListaOpcoes(chklstRubrica, ListaIdRubrica, sListaIdRubricaSel, ',', true);
    if (wRub = ListaIdRubrica.Count) then
      sListaIdRubricaSel := '';

    iTotReg := CtrlElimHistRubSal.ContarRubricas(sListaIdRubricaSel, sIdFuncSel,
      cmbMes.ItemIndex+1, StrToInt(speAno.Text), CdsMotivo.FieldByName('IDMOTIVO').asInteger);

    frmAguarde.Apaga;  
    if (iTotReg = 0) then
      MsgDlg('Nenhum registro a excluir foi encontrado.', 'Aviso', mtWarning, [mbOk,mbHelp], 0)
    else
    if (MsgDlg('Quantidade a Excluir = ' +IntToStr(iTotReg)+CR_LF+
               'Esta é uma segunda chance para se arrepender.'+CR_LF+CR_LF+
               'Confirma a execução?', 'Confirmação', mtConfirmation,
               [mbYes,mbNo,mbHelp], 0) = mrYes) then
    begin
      frmAguarde.Mostra('Excluindo as Rubricas Salariais...');

      if (CtrlElimHistRubSal.EliminarRubricas(rgDesfazerLancamentos.ItemIndex = 0,
          sListaIdRubricaSel, sIdFuncSel, cmbMes.ItemIndex+1, StrToInt(speAno.Text),
          CdsMotivo.FieldByName('IDMOTIVO').asInteger, Sistema.TipoEmpresa)) then
      begin
        frmAguarde.Apaga;
        MsgDlg(CtrlElimHistRubSal.MessageInfo, 'Informação', mtInformation, [mbOk,mbHelp], 0);
      end
      else
      begin
        frmAguarde.Apaga;
        MsgDlg('Não Foi Possível Eliminar os Registros.'+CR_LF+
               'Processo Cancelado.'+CR_LF+CR_LF+'Erro:'+CR_LF+CtrlElimHistRubSal.MessageInfo,
               'Erro', mtError, [mbOk,mbHelp], 0);
      end;
    end;
  end;
end;

// -------------------------------------------------------------------------------------
// Funções do Form
// -------------------------------------------------------------------------------------

procedure TfrmElimHistRubSal.HabilitaBtOk;
var
  c: integer;
  bSelFunc: boolean;
begin
  // Verifica se algum Funcionário foi selecionado
  bSelFunc := false;
  for c:=0 to chklstFunc.Items.Count-1 do
    if (chklstFunc.Checked[c]) then
    begin
      bSelFunc := true;
      break;
    end;

  bbtnConfirmar.Enabled := (bSelFunc) and (dblkcbMotivo.Text <> '') and
    (Trim(speAno.Text) <> '');
end;

procedure TfrmElimHistRubSal.MudaListaFuncionarios;
begin
  ListaFunc.Clear;
  chklstFunc.Items.Clear;

  if (dblkcbEstab.Text <> '') then
  begin
    CdsFunc.Data := CtrlPessoaFuncionario.ListEmpresaFuncionario(Sistema.IdEmpresa, '',
      CdsEstab.FieldByName('IDPESSOA').asString,
      FU.GerarListaSitFuncSel(cbxAtivos.Checked, cbxAfastados.Checked, cbxDemitidos.Checked),
      FU.GerarListaTipoContratoSel(cbxEfetivos.Checked, cbxEspeciais.Checked,
        cbxTemporarios.Checked, cbxTerceiros.Checked, cbxProprietarios.Checked,
        cbxAutonomos.Checked, cbxEstagiarios.Checked));

    while not(CdsFunc.EOF) do
    begin
      ListaFunc.Add(CdsFunc.FieldByName('IDPESSOA').asString);
      chklstFunc.Items.Add(CdsFunc.FieldByName('NOME').asString);
      CdsFunc.Next;
    end;
  end;

  HabilitaBtOk;
end;

procedure TfrmElimHistRubSal.HabilitaDesfazerLancamentos;
begin
  if (Trim(edCodRubricas.Text) <> '') then
  begin
    rgDesfazerLancamentos.Enabled := false;
    rgDesfazerLancamentos.ItemIndex := 1;
  end
  else
  begin
    rgDesfazerLancamentos.Enabled := true;
    rgDesfazerLancamentos.ItemIndex := 0;
  end;
end;

end.
