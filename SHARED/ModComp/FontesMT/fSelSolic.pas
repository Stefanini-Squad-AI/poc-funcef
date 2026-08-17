unit fSelSolic;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs, fSairAjuda,
  MAHlpBtn, StdCtrls, Buttons, ExtCtrls, Db, DBTables, wwdblook, TB97, IvDictio, IvMulti,
  IvEMulti, TB97Tlbr, checklst, wwdbdatetimepicker, CMDateTimePicker, ColorCheckListBox,
  uCtrlMotivo, uCtrlPessoaFuncionario;

type
  TfrmSelSolic = class(TfrmSairAjuda)
    gbxFaixaData: TGroupBox;
    Label1: TLabel;
    edData1: TCMDateTimePicker;
    edData2: TCMDateTimePicker;
    rgSelIndic: TRadioGroup;
    gbxSit: TGroupBox;
    cbxProposta: TCheckBox;
    cbxEfetiv: TCheckBox;
    gbxRequisit: TGroupBox;
    chklstRequisit: TColorCheckListBox;
    bbtnInverteSelRequisit: TBitBtn;
    bbtnSelTodosRequisit: TBitBtn;
    gbxAcoes: TGroupBox;
    chklstAcoes: TColorCheckListBox;
    bbtnInverteSelAcoes: TBitBtn;
    bbtnSelTodosAcoes: TBitBtn;
    bbtnConfirmar: TBitBtn;
    ToolbarSep971: TToolbarSep97;
    procedure FormCreate(Sender: TObject);
    procedure edData1Change(Sender: TObject);
    procedure bbtnConfirmarClick(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure bbtnSelTodosRequisitClick(Sender: TObject);
    procedure bbtnInverteSelRequisitClick(Sender: TObject);
  private
    CtrlMotivo: TCtrlMotivo;
    CtrlPessoaFuncionario: TCtrlPessoaFuncionario;

    procedure HabilitaBtOk;
  public
    ListaIdFunc, ListaIdMotivo: TStringList;
  end;

var
  frmSelSolic: TfrmSelSolic;

implementation

uses uSistema, uMensErro, uCtrlPadroes, dCds, uCtrlFuncoesRH, uCtrlUsoGeralRH, fAnalSolic;

{$R *.DFM}

procedure TfrmSelSolic.FormCreate(Sender: TObject);
begin
  inherited;
  if (CtrlUsoGeralRH.IdUsuarioGeral <> '') then
  begin
    MsgDlg('Tela de uso restrito a Usuários RH e Gestores.', 'Aviso',
      mtInformation, [mbOk,mbHelp], 0);
    Close;
    exit;
  end;

  CtrlMotivo := TCtrlMotivo.Create;
  CtrlMotivo.InitializeAs(Padroes);

  CtrlPessoaFuncionario := TCtrlPessoaFuncionario.Create(CtrlUsoGeralRH.UsuXFilial,
    CtrlUsoGeralRH.UsuXCCusto, '');
  CtrlPessoaFuncionario.InitializeAs(Padroes);

  frmAnalSolic := TfrmAnalSolic.Create(Application);

  ListaIdFunc := TStringList.Create;
  ListaIdMotivo := TStringList.Create;

  // Criar a lista de Motivos a selecionar
  dmCds.Cds.Data := CtrlMotivo.ListMotivo_Id_e_Descricao('A');
  while not(dmCds.Cds.EOF) do
  begin
    ListaIdMotivo.Add(dmCds.Cds.FieldByName('IDMOTIVO').asString);
    chklstAcoes.Items.Add(dmCds.Cds.FieldByName('DESCRICAO').asString);
    dmCds.Cds.Next;
  end;

  // Criar a lista de Pessoas a selecionar
  dmCds.Cds.Data := CtrlPessoaFuncionario.ListEmpresaFuncionario(Sistema.IdEmpresa,
    '', '', '', '', '', '', '', '', '', false, 0, 0, -1, -1, '', 0, 0, 0, 0, false, '',
    '', 0, 0, Sistema.IdUsuario);
  while not(dmCds.Cds.EOF) do
  begin
    ListaIdFunc.Add(dmCds.Cds.FieldByName('IDPESSOA').asString);
    chklstRequisit.Items.Add(dmCds.Cds.FieldByName('NOME').asString);
    dmCds.Cds.Next;
  end;

  edData1.Date := Date;
  edData2.Date := Date + 30;
  if (Sistema.IdModulo = MODAUTO) then
    HelpContext := 4170015;
end;

procedure TfrmSelSolic.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  inherited;
  FreeAndNil(ListaIdFunc);
  FreeAndNil(ListaIdMotivo);
  FreeAndNil(frmAnalSolic);
  FreeAndNil(CtrlMotivo);
  FreeAndNil(CtrlPessoaFuncionario);
end;

procedure TfrmSelSolic.edData1Change(Sender: TObject);
begin
  try
    StrToDate(TCMDateTimePicker(Sender).Text);
    HabilitaBtOk;
  except
  end;
end;

procedure TfrmSelSolic.bbtnSelTodosRequisitClick(Sender: TObject);
var
  c: integer;
begin
  if (TBitBtn(Sender).Name = 'bbtnSelTodosRequisit') then
  begin
    for c:=0 to chklstRequisit.Items.Count-1 do
      chklstRequisit.Checked[c] := true;
    chklstRequisit.Repaint;
  end
  else
  begin
    for c:=0 to chklstAcoes.Items.Count-1 do
      chklstAcoes.Checked[c] := true;
    chklstAcoes.Repaint;
  end;
end;

procedure TfrmSelSolic.bbtnInverteSelRequisitClick(Sender: TObject);
var
  c: integer;
begin
  if (TBitBtn(Sender).Name = 'bbtnInverteSelRequisit') then
  begin
    for c:=0 to chklstRequisit.Items.Count-1 do
      chklstRequisit.Checked[c] := not(chklstRequisit.Checked[c]);
    chklstRequisit.Repaint;
  end
  else
  begin
    for c:=0 to chklstAcoes.Items.Count-1 do
      chklstAcoes.Checked[c] := not(chklstAcoes.Checked[c]);
    chklstAcoes.Repaint;
  end
end;

procedure TfrmSelSolic.bbtnConfirmarClick(Sender: TObject);
var
  sListaIdFuncSel, sListaIdMotivoSel: string;
begin
  // Lista dos Requisitantes
  FU.CriaListaOpcoes(chklstRequisit, ListaIdFunc, sListaIdFuncSel, ',', false);

  // Lista das Ações
  FU.CriaListaOpcoes(chklstAcoes, ListaIdMotivo, sListaIdMotivoSel, ',', false);

  frmAnalSolic.SelIndicados := (rgSelIndic.ItemIndex = 1);
  frmAnalSolic.SelSolicPropostas := cbxProposta.Checked;
  frmAnalSolic.SelSolicEfetivadas := cbxEfetiv.Checked;
  frmAnalSolic.DataIni := edData1.Date;
  frmAnalSolic.DataFim := edData2.Date;
  frmAnalSolic.ListaIdFuncSel := sListaIdFuncSel;
  frmAnalSolic.ListaIdMotivoSel := sListaIdMotivoSel;
  frmAnalSolic.ShowModal;
end;

procedure TfrmSelSolic.HabilitaBtOk;
begin
  bbtnConfirmar.Enabled := (EdData1.Text <> '') and (EdData2.Text <> '') and
    (EdData1.Date <= EdData2.Date);
end;

end.
