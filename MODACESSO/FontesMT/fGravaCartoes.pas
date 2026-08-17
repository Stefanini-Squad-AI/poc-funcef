unit fGravaCartoes;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs, MAHlpBtn,
  StdCtrls, Buttons, TB97Tlbr, TB97, ExtCtrls, Db, DBTables, wwdblook, Spin, checklst,
  IvDictio, IvMulti, ComCtrls, fSairAjuda, fParamReports_Padrao, CmParamReport, DBClient,
  uCMClientDataSet, ColorCheckListBox, TREdit, wwdbdatetimepicker,
  CMDateTimePicker, uCtrlPessoaFilialPessoa, uCtrlGlobalRH, uCtrlPessoaFuncionario,
  uCtrlCargo, uCtrlListTerceirosRH, uGravaCartoes, IvEMulti;

type
  TfrmGravaCartoes = class(TfrmParamReports_Padrao)
    gbxFunc: TGroupBox;
    pgctrlEmpregados: TPageControl;
    tbshListaFunc: TTabSheet;
    chklstFunc: TColorCheckListBox;
    tbshFiltroFunc: TTabSheet;
    gbxTipContra: TGroupBox;
    cbxEfetivos: TCheckBox;
    cbxEspeciais: TCheckBox;
    cbxTemporarios: TCheckBox;
    cbxEstagiarios: TCheckBox;
    cbxTerceiros: TCheckBox;
    cbxPropDirSemVinc: TCheckBox;
    cbxAutonomos: TCheckBox;
    gbxSituacao: TGroupBox;
    cbxAtivos: TCheckBox;
    cbxAfastados: TCheckBox;
    cbxDemitidos: TCheckBox;
    tbshCargos: TTabSheet;
    chklstCargo: TColorCheckListBox;
    tbshEstabelecimento: TTabSheet;
    chklstEstab: TColorCheckListBox;
    bbtnSelTodos: TBitBtn;
    bbtnInverteSel: TBitBtn;
    tbshCCusto: TTabSheet;
    chklstCCusto: TColorCheckListBox;
    procedure FormCreate(Sender: TObject);
    procedure bbtnConfirmarClick(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure gbxSituacaoEnter(Sender: TObject);
    procedure gbxSituacaoExit(Sender: TObject);
    procedure gbxTipContraEnter(Sender: TObject);
    procedure gbxTipContraExit(Sender: TObject);
    procedure chklstFuncClickCheck(Sender: TObject);
    procedure bbtnSelTodosClick(Sender: TObject);
    procedure bbtnInverteSelClick(Sender: TObject);
    procedure chklstEstabClickCheck(Sender: TObject);
    procedure pgctrlEmpregadosChange(Sender: TObject);
  private
    CtrlPessoaFilialPessoa: TCtrlPessoaFilialPessoa;
    CtrlGlobalRH: TCtrlGlobalRH;
    CtrlPessoaFuncionario: TCtrlPessoaFuncionario;
    CtrlCargo: TCtrlCargo;
    CtrlListTerceirosRH: TCtrlListTerceirosRH;
    GravaCartoes: TGravaCartoes;

    chkListAux: TColorCheckListBox;
    ListaMatriculaFunc, ListaIdCargo, ListaIdEstab, ListaCodCCusto: TStringList;

    sListaMatriculaFuncSel, sListaIdEstabSel,sListaIdCargoSel, sListaCodCCustoSel: string;
    bSitAtivo, bSitAfast, bSitDemit, bTipContrEfet, bTipContrEspec, bTipContrTemp,
    bTipContrEst, bTipContrTerc, bTipContrProp, bTipContrAut: boolean;

    procedure MontaListaFuncionarios;
    procedure HabilitaBtOk;
  end;

var
  frmGravaCartoes: TfrmGravaCartoes;

implementation

uses uSistema, uMensErro, uCtrlPadroes, uCtrlFuncoesRH, fAguarde, dCds, uCtrlUsoGeralRH;

const
  MSG_GRAVACAO_CARTAO =
    'Gravando cartão de :1';

{$R *.DFM}

procedure TfrmGravaCartoes.FormCreate(Sender: TObject);
begin
  inherited;
  GravaCartoes := TGravaCartoes.Create(ObjConexaoGravadora);//('172.27.171.164');

  CtrlCargo := TCtrlCargo.Create;
  CtrlCargo.InitializeAs(Padroes);

  CtrlPessoaFilialPessoa := TCtrlPessoaFilialPessoa.Create(CtrlUsoGeralRH.UsuXFilial,
    CtrlUsoGeralRH.UsuXCCusto, CtrlUsoGeralRH.IdUsuarioGeral);
  CtrlPessoaFilialPessoa.InitializeAs(Padroes);

  CtrlGlobalRH := TCtrlGlobalRH.Create;
  CtrlGlobalRH.InitializeAs(Padroes);

  CtrlPessoaFuncionario := TCtrlPessoaFuncionario.Create(CtrlUsoGeralRH.UsuXFilial,
    CtrlUsoGeralRH.UsuXCCusto, CtrlUsoGeralRH.IdUsuarioGeral);
  CtrlPessoaFuncionario.InitializeAs(Padroes);

  CtrlListTerceirosRH := TCtrlListTerceirosRH.Create(CtrlUsoGeralRH.UsuXFilial,
    CtrlUsoGeralRH.UsuXCCusto, CtrlUsoGeralRH.IdUsuarioGeral);
  CtrlListTerceirosRH.InitializeAs(Padroes);

  ListaIdEstab := TStringList.Create;
  ListaIdCargo := TStringList.Create;
  ListaMatriculaFunc := TStringList.Create;
  ListaCodCCusto := TStringList.Create;

  // Lista de Cargos
  chklstCargo.Items.BeginUpdate;
  dmCds.Cds.Data := CtrlCargo.ListCargo;
  chklstCargo.Items.Clear;
  while not(dmCds.Cds.EOF) do
  begin
    ListaIdCargo.Add(dmCds.Cds.FieldByName('IDCARGO').asString);
    chklstCargo.Items.Add(dmCds.Cds.FieldByName('TITULO').asString);
    dmCds.Cds.Next;
  end;
  chklstCargo.Items.EndUpdate;

  // Lista de Centros de Custo
  chklstCCusto.Items.Clear;
  ListaCodCCusto.Clear;
  dmCds.Cds.Data := CtrlListTerceirosRH.ListCCusto(IntToStr(Sistema.IdEmpresa));
  while not(dmCds.Cds.EOF) do
  begin
    ListaCodCCusto.Add(dmCds.Cds.FieldByName('CODCENTROCUSTO').asString);
    chklstCCusto.Items.Add(dmCds.Cds.FieldByName('NOME').asString);
    dmCds.Cds.Next;
  end;

  // Lista de Estabelecimentos
  dmCds.Cds.Data := CtrlPessoaFilialPessoa.ListPessoaEstab(IntToStr(Sistema.IdEmpresa));
  while not(dmCds.Cds.EOF) do
  begin
    ListaIdEstab.Add(dmCds.Cds.FieldByName('IDPESSOA').asString);
    chklstEstab.Items.Add(dmCds.Cds.FieldByName('NOME').asString);
    chklstEstab.Checked[chklstEstab.Items.Count-1] := true;
    dmCds.Cds.Next;
  end;

  pgctrlEmpregados.ActivePageIndex := 0;
  MontaListaFuncionarios;
  pgctrlEmpregadosChange(nil);
end;

procedure TfrmGravaCartoes.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  FreeAndNil(ListaMatriculaFunc);
  FreeAndNil(ListaIdCargo);
  FreeAndNil(ListaIdEstab);
  FreeAndNil(ListaCodCCusto);

  FreeAndNil(CtrlPessoaFilialPessoa);
  FreeAndNil(CtrlGlobalRH);
  FreeAndNil(CtrlPessoaFuncionario);
  FreeAndNil(CtrlCargo);
  FreeAndNil(CtrlListTerceirosRH);
  FreeAndNil(GravaCartoes);
  inherited;
end;

procedure TfrmGravaCartoes.pgctrlEmpregadosChange(Sender: TObject);
begin
  bbtnSelTodos.Visible := (pgctrlEmpregados.ActivePageIndex in [0,2,3,4]);
  bbtnInverteSel.Visible := bbtnSelTodos.Visible;

  case (pgctrlEmpregados.ActivePageIndex) of
    0 : chkListAux := chklstFunc;
    2 : chkListAux := chklstCargo;
    3 : chkListAux := chklstEstab;
    4 : chkListAux := chklstCCusto;
  end;
end;

procedure TfrmGravaCartoes.gbxTipContraEnter(Sender: TObject);
begin
  bTipContrEfet := cbxEfetivos.Checked;
  bTipContrEspec := cbxEspeciais.Checked;
  bTipContrTemp := cbxTemporarios.Checked;
  bTipContrEst := cbxEstagiarios.Checked;
  bTipContrTerc := cbxTerceiros.Checked;
  bTipContrProp := cbxPropDirSemVinc.Checked;
  bTipContrAut := cbxAutonomos.Checked;
end;

procedure TfrmGravaCartoes.gbxSituacaoEnter(Sender: TObject);
begin
  bSitAtivo := cbxAtivos.Checked;
  bSitAfast := cbxAfastados.Checked;
  bSitDemit := cbxDemitidos.Checked;
end;

procedure TfrmGravaCartoes.gbxTipContraExit(Sender: TObject);
begin
  if not(cbxEfetivos.Checked) and not(cbxEspeciais.Checked) and
     not(cbxTemporarios.Checked) and not(cbxTerceiros.Checked) and
     not(cbxPropDirSemVinc.Checked) and not(cbxAutonomos.Checked) and
     not(cbxEstagiarios.Checked) then
  begin
    MsgDlg(fu.CMTranslate('Pelo menos um Tipo de Contrato deve ser selecionado.'),
      fu.CMTranslate('Aviso'), mtInformation, [mbOk,mbHelp], 0);
    cbxEfetivos.SetFocus;
  end
  else
  if (bTipContrEfet <> cbxEfetivos.Checked) or (bTipContrEspec <> cbxEspeciais.Checked) or
     (bTipContrTemp <> cbxTemporarios.Checked) or (bTipContrEst <> cbxEstagiarios.Checked) or
     (bTipContrTerc <> cbxTerceiros.Checked) or (bTipContrProp <> cbxPropDirSemVinc.Checked) or
     (bTipContrAut <> cbxAutonomos.Checked) then
    MontaListaFuncionarios;
end;

procedure TfrmGravaCartoes.gbxSituacaoExit(Sender: TObject);
begin
  if not(cbxAtivos.Checked) and not(cbxAfastados.Checked) and not(cbxDemitidos.Checked) then
  begin
    MsgDlg(fu.CMTranslate('Pelo menos um Tipo de Situação deve ser selecionado.'),
      fu.CMTranslate('Aviso'), mtInformation, [mbOk,mbHelp], 0);
    cbxAtivos.SetFocus;
  end
  else
  if (bSitAtivo <> cbxAtivos.Checked) or (bSitAfast <> cbxAfastados.Checked) or
     (bSitDemit <> cbxDemitidos.Checked) then
    MontaListaFuncionarios;
end;

procedure TfrmGravaCartoes.chklstEstabClickCheck(Sender: TObject);
begin
  MontaListaFuncionarios;
end;

procedure TfrmGravaCartoes.chklstFuncClickCheck(Sender: TObject);
begin
  HabilitaBtOk;
end;

procedure TfrmGravaCartoes.bbtnSelTodosClick(Sender: TObject);
var
  c: integer;
begin
  for c:=0 to chkListAux.Items.Count-1 do
    chkListAux.Checked[c] := true;
  chkListAux.Repaint;
  HabilitaBtOk;
end;

procedure TfrmGravaCartoes.bbtnInverteSelClick(Sender: TObject);
var
  c: integer;
begin
  for c:=0 to chkListAux.Items.Count-1 do
    chkListAux.Checked[c] := not(chkListAux.Checked[c]);
  chkListAux.Repaint;
  HabilitaBtOk;
end;

procedure TfrmGravaCartoes.bbtnConfirmarClick(Sender: TObject);
var
  c: integer;
begin
  frmAguarde.pbAguarde.Visible := false;

  for c:=0 to chklstFunc.Items.Count-1 do
    if (chklstFunc.Checked[c]) then
    begin
      frmAguarde.Mostra(fu.CMTranslateMsg(MSG_GRAVACAO_CARTAO, [chklstFunc.Items[c]]));
      if not(GravaCartoes.GravaCartao(ListaMatriculaFunc[c])) then
      begin
        frmAguarde.Apaga;
        dmCds.CmErroDlg.ErrorMesage.Text := GravaCartoes.MsgErro;
        dmCds.CmErroDlg.Execute;
      end;
    end;

  frmAguarde.Apaga;
  frmAguarde.pbAguarde.Visible := true;
  
  ModalResult := mrNone;
end;

// -------------------------------------------------------------------------------------
// Funções do Form
// -------------------------------------------------------------------------------------

procedure TfrmGravaCartoes.MontaListaFuncionarios;
begin
  // Estabelecimentos selecionados
  FU.CriaListaOpcoes(chklstEstab, ListaIdEstab, sListaIdEstabSel, ',', false);

  ListaMatriculaFunc.Clear;
  chklstFunc.Items.BeginUpdate;
  chklstFunc.Items.Clear;

  if (sListaIdEstabSel <> '') then
  begin
    FU.CriaListaOpcoes(chklstCCusto, ListaCodCCusto, sListaCodCCustoSel, ',', false);
    FU.CriaListaOpcoes(chklstCargo, ListaIdCargo, sListaIdCargoSel, ',', false);

    dmCds.Cds.Data := CtrlPessoaFuncionario.ListEmpresaFuncionario(Sistema.IdEmpresa,
      'F.MATRICULA, P.NOME', sListaIdEstabSel, FU.GerarListaSitFuncSel(cbxAtivos.Checked,
      cbxAfastados.Checked, cbxDemitidos.Checked), FU.GerarListaTipoContratoSel(
      cbxEfetivos.Checked, cbxEspeciais.Checked, cbxTemporarios.Checked, cbxTerceiros.Checked,
      cbxPropDirSemVinc.Checked, cbxAutonomos.Checked, cbxEstagiarios.Checked),
      '', sListaCodCCustoSel, '', '', '', false, 0, 0, -1, -1, '', 0, 0, 0, 0, false, '',
      '', 0, 0, 0, true, 0, sListaIdCargoSel);

    while not(dmCds.Cds.EOF) do
    begin
      ListaMatriculaFunc.Add(dmCds.Cds.FieldByName('MATRICULA').asString);
      chklstFunc.Items.Add(dmCds.Cds.FieldByName('NOME').asString);
      chklstFunc.Checked[chklstFunc.Items.Count-1] := true;
      dmCds.Cds.Next;
    end;
  end;

  // Empregados escolhidos
  FU.CriaListaOpcoes(chklstFunc, ListaMatriculaFunc, sListaMatriculaFuncSel, ',', false);

  HabilitaBtOk;
  chklstFunc.Items.EndUpdate;
end;

procedure TfrmGravaCartoes.HabilitaBtOk;
begin
  bbtnConfirmar.Enabled := (sListaMatriculaFuncSel <> '');
end;

end.
