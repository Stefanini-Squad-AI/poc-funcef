{Nome     : Henrique Massão
SOL       : 117141
Kintana   : 594895
Data:     : 20/08/2009
Rotina    : gbxTipContra
Descrição :  Alterar os tipos de contrato no módulo conforme segue: Efetivo - manter o mesmo
  Efetivo Especial - alterar para LEF
  Temporário - alterar para Terceirizado
  Estagiário - manter o mesmo
  Terceiro - alterar para Cessão
  Prop/Dir s/Vinc - manter o mesmo
  Autônomo - - manter o mesmo
  Não é necessário alterar a nomenclatura utilizada nas fórmulas de cálculo das rubricas,
  mas em todos os relatórios e telas em que a informação aparece.}

unit fParamCompSaldo;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs, IvDictio,
  IvMulti, IvEMulti, MAHlpBtn, StdCtrls, Buttons, TB97Tlbr, TB97, ExtCtrls, Db, Spin,
  DBTables, wwdblook, checklst, ComCtrls, wwdbdatetimepicker, CMDateTimePicker, DBClient,
  uCMClientDataSet, fParamReports_Padrao, CmParamReport, uCtrlProvDesc, uCtrlGlobalRH,
  uCtrlPessoaFilialPessoa, uCtrlPessoaFuncionario, ColorCheckListBox;

type
  TfrmParamCompSaldo = class(TfrmParamReports_Padrao)
    gbxAnoMesRef: TGroupBox;
    Label1: TLabel;
    Label2: TLabel;
    dtedInicio: TCMDateTimePicker;
    dtedFim: TCMDateTimePicker;
    gbxOrdem: TGroupBox;
    cmbOrderBy: TComboBox;
    gbxRubBase: TGroupBox;
    dblkcbRubBase: TwwDBLookupCombo;
    gbxRubReportada: TGroupBox;
    dblkcbRubReportada: TwwDBLookupCombo;
    gbxFunc: TGroupBox;
    pgctrlEmpregados: TPageControl;
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
    cbxPropDirSemVinc: TCheckBox;
    cbxAutonomos: TCheckBox;
    gbxSituacao: TGroupBox;
    cbxAtivos: TCheckBox;
    cbxAfastados: TCheckBox;
    cbxDemitidos: TCheckBox;
    CdsEstab: TCMClientDataSet;
    CdsRubBase: TCMClientDataSet;
    CdsRubReportada: TCMClientDataSet;
    tbshEstabelecimento: TTabSheet;
    chklstEstab: TColorCheckListBox;
    bbtnSelTodosEstab: TBitBtn;
    bbtnInverteSelEstab: TBitBtn;
    procedure bbtnConfirmarClick(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure dblkcbRubBaseChange(Sender: TObject);
    procedure gbxSituacaoEnter(Sender: TObject);
    procedure gbxSituacaoExit(Sender: TObject);
    procedure gbxTipContraEnter(Sender: TObject);
    procedure gbxTipContraExit(Sender: TObject);
    procedure bbtnSelTodosFuncClick(Sender: TObject);
    procedure bbtnInverteSelFuncClick(Sender: TObject);
    procedure bbtnSelTodosEstabClick(Sender: TObject);
    procedure bbtnInverteSelEstabClick(Sender: TObject);
    procedure chklstEstabClickCheck(Sender: TObject);
  private
    CtrlProvDesc: TCtrlProvDesc;
    CtrlGlobalRH: TCtrlGlobalRH;
    CtrlPessoaFilialPessoa: TCtrlPessoaFilialPessoa;
    CtrlPessoaFuncionario: TCtrlPessoaFuncionario;

    ListaIdRubrica, ListaIdFunc, ListaIdEstab: TStringList;

    sListaIdEstabSel: string;
    bSitAtivo, bSitAfast, bSitDemit, bTipContrEfet, bTipContrEspec, bTipContrTemp,
    bTipContrEst, bTipContrTerc, bTipContrProp, bTipContrAut: boolean;

    procedure MontaListaFuncionarios;
    procedure HabilitaBtOk;
    function  VerificaOpcoesOk: boolean;
  end;

var
  frmParamCompSaldo: TfrmParamCompSaldo;

implementation

uses uSistema, uMensErro, dCds, uCtrlPadroes, uCtrlFuncoesRH, uCtrlUsoGeralRH;

{$R *.DFM}

procedure TfrmParamCompSaldo.FormCreate(Sender: TObject);
var
  NormalIni, NormalFim: TDate;
  c: byte;
begin
  inherited;
  CtrlProvDesc := TCtrlProvDesc.Create;
  CtrlProvDesc.InitializeAs(Padroes);

  CtrlGlobalRH := TCtrlGlobalRH.Create;
  CtrlGlobalRH.InitializeAs(Padroes);

  CtrlPessoaFilialPessoa := TCtrlPessoaFilialPessoa.Create(CtrlUsoGeralRH.UsuXFilial,
    CtrlUsoGeralRH.UsuXCCusto, CtrlUsoGeralRH.IdUsuarioGeral);
  CtrlPessoaFilialPessoa.InitializeAs(Padroes);

  CtrlPessoaFuncionario := TCtrlPessoaFuncionario.Create(CtrlUsoGeralRH.UsuXFilial,
    CtrlUsoGeralRH.UsuXCCusto, CtrlUsoGeralRH.IdUsuarioGeral);
  CtrlPessoaFuncionario.InitializeAs(Padroes);

  ListaIdRubrica := TStringList.Create;
  ListaIdFunc := TStringList.Create;
  ListaIdEstab := TStringList.Create;

  // Preenche ChkList de Estabelecimentos
  c := 0;
  CdsEstab.Data := CtrlPessoaFilialPessoa.ListPessoaEstab(IntToStr(Sistema.IdEmpresa));
  while not(CdsEstab.EOF) do
  begin
    ListaIdEstab.Add(CdsEstab.FieldByName('IDPESSOA').asString);
    chklstEstab.Items.Add(CdsEstab.FieldByName('NOME').asString);
    chklstEstab.Checked[c] := true;
    CdsEstab.Next;
    Inc(c);
  end;

  CdsRubBase.Data := CtrlProvDesc.ListRubricaEmpresa(IntToStr(Sistema.IdEmpresa), -1,
    'RP.CODPROVDESC, RP.DESCRPROVDESC');
  CdsRubReportada.Data := CdsRubBase.Data;

  NormalIni := CtrlGlobalRH.GetNormalIni;
  NormalFim := CtrlGlobalRH.GetNormalFim;
  dtedFim.Date := NormalFim;
  dtedInicio.Date := StrToDate(FU.IncData(DateToStr(NormalIni),
    0, -FU.ExtraiMes(NormalIni)+1, 0));

  cmbOrderBy.ItemIndex := 0;
  pgctrlEmpregados.ActivePageIndex := 0;

  MontaListaFuncionarios;
end;

procedure TfrmParamCompSaldo.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  FreeAndNil(CtrlGlobalRH);
  FreeAndNil(CtrlProvDesc);
  FreeAndNil(CtrlPessoaFilialPessoa);
  FreeAndNil(CtrlPessoaFuncionario);
  FreeAndNil(ListaIdRubrica);
  FreeAndNil(ListaIdFunc);
  FreeAndNil(ListaIdEstab);
  inherited;
end;

procedure TfrmParamCompSaldo.dblkcbRubBaseChange(Sender: TObject);
begin
  HabilitaBtOk;
end;

procedure TfrmParamCompSaldo.gbxTipContraEnter(Sender: TObject);
begin
  bTipContrEfet := cbxEfetivos.Checked;
  bTipContrEspec := cbxEspeciais.Checked;
  bTipContrTemp := cbxTemporarios.Checked;
  bTipContrEst := cbxEstagiarios.Checked;
  bTipContrTerc := cbxTerceiros.Checked;
  bTipContrProp := cbxPropDirSemVinc.Checked;
  bTipContrAut := cbxAutonomos.Checked;
end;

procedure TfrmParamCompSaldo.gbxSituacaoEnter(Sender: TObject);
begin
  bSitAtivo := cbxAtivos.Checked;
  bSitAfast := cbxAfastados.Checked;
  bSitDemit := cbxDemitidos.Checked;
end;

procedure TfrmParamCompSaldo.gbxTipContraExit(Sender: TObject);
begin
  if not(cbxEfetivos.Checked) and not(cbxEspeciais.Checked) and
     not(cbxTemporarios.Checked) and not(cbxTerceiros.Checked) and
     not(cbxPropDirSemVinc.Checked) and not(cbxAutonomos.Checked) and
     not(cbxEstagiarios.Checked) then
  begin
    MsgDlg ('Pelo menos um Tipo de Contrato deve ser selecionado.', 'Aviso',
      mtWarning, [mbOk,mbHelp], 0);
    cbxEfetivos.SetFocus;
  end
  else
  if (bTipContrEfet <> cbxEfetivos.Checked) or (bTipContrEspec <> cbxEspeciais.Checked)  or
     (bTipContrTemp <> cbxTemporarios.Checked) or (bTipContrEst <> cbxEstagiarios.Checked) or
     (bTipContrTerc <> cbxTerceiros.Checked) or (bTipContrProp <> cbxPropDirSemVinc.Checked) or
     (bTipContrAut <> cbxAutonomos.Checked) then
    MontaListaFuncionarios;
end;

procedure TfrmParamCompSaldo.gbxSituacaoExit(Sender: TObject);
begin
  if not(cbxAtivos.Checked) and not(cbxAfastados.Checked) and not(cbxDemitidos.Checked) then
  begin
    MsgDlg ('Pelo menos um Tipo de Situação deve ser selecionado.', 'Aviso',
      mtWarning, [mbOk,mbHelp], 0);
    cbxAtivos.SetFocus;
  end
  else
  if (bSitAtivo <> cbxAtivos.Checked) or (bSitAfast <> cbxAfastados.Checked) or
     (bSitDemit <> cbxDemitidos.Checked) then
    MontaListaFuncionarios;
end;

procedure TfrmParamCompSaldo.bbtnSelTodosFuncClick(Sender: TObject);
var
  c: integer;
begin
  for c:=0 to chklstFunc.Items.Count-1 do
    chklstFunc.Checked[c] := true;
  chklstFunc.Repaint;
end;

procedure TfrmParamCompSaldo.bbtnInverteSelFuncClick(Sender: TObject);
var
  c: integer;
begin
  for c:=0 to chklstFunc.Items.Count-1 do
    chklstFunc.Checked[c] := not(chklstFunc.Checked[c]);
  chklstFunc.Repaint;
end;

procedure TfrmParamCompSaldo.bbtnConfirmarClick(Sender: TObject);
var
  wNum: word;
  sListaIdFuncSel: string;
begin
  // Verifica se as opções selecionadas estão corretamente selecionadas
  if not(VerificaOpcoesOk) then
  begin
    ModalResult := mrNone;
    exit;
  end;

  // Funcionários escolhidos
  wNum := FU.CriaListaOpcoes(chklstFunc, ListaIdFunc, sListaIdFuncSel, ',', false);
  if (wNum = ListaIdFunc.Count) then
    sListaIdFuncSel := '';

  Cmp_Padrao.ParamByName('ListaIdEstab').asString := sListaIdEstabSel;
  Cmp_Padrao.ParamByName('ListaIdFunc').asString := sListaIdFuncSel;
  Cmp_Padrao.ParamByName('ListaSitFunc').asString :=
    FU.GerarListaSitFuncSel(cbxAtivos.Checked, cbxAfastados.Checked, cbxDemitidos.Checked);
  Cmp_Padrao.ParamByName('ListaTipoContrato').asString :=
    FU.GerarListaTipoContratoSel(cbxEfetivos.Checked, cbxEspeciais.Checked,
      cbxTemporarios.Checked, cbxTerceiros.Checked, cbxPropDirSemVinc.Checked,
      cbxAutonomos.Checked, cbxEstagiarios.Checked);
  Cmp_Padrao.ParamByName('CodRubBase').asString := CdsRubBase.FieldByName('CODPROVDESC').asString;
  Cmp_Padrao.ParamByName('CodRubReportada').asString := CdsRubReportada.FieldByName('CODPROVDESC').asString;
  Cmp_Padrao.ParamByName('DataIni').asDateTime := dtedInicio.Date;
  Cmp_Padrao.ParamByName('DataFim').asDateTime := dtedFim.Date;
  Cmp_Padrao.ParamByName('Ordenacao').asInteger := cmbOrderBy.ItemIndex;
  inherited;
end;

// -------------------------------------------------------------------------------------
// Funções do Form
// -------------------------------------------------------------------------------------

procedure TfrmParamCompSaldo.MontaListaFuncionarios;
begin
  // Estabelecimentos selecionados
  FU.CriaListaOpcoes(chklstEstab, ListaIdEstab, sListaIdEstabSel, ',', false);

  ListaIdFunc.Clear;
  chklstFunc.Items.Clear;

  if (sListaIdEstabSel <> '') then
  begin
    dmCds.Cds.Data := CtrlPessoaFuncionario.ListEmpresaFuncionario(Sistema.IdEmpresa,
      '', sListaIdEstabSel, FU.GerarListaSitFuncSel(cbxAtivos.Checked,
      cbxAfastados.Checked, cbxDemitidos.Checked), FU.GerarListaTipoContratoSel(
      cbxEfetivos.Checked, cbxEspeciais.Checked, cbxTemporarios.Checked, cbxTerceiros.Checked,
      cbxPropDirSemVinc.Checked, cbxAutonomos.Checked, cbxEstagiarios.Checked));

    while not(dmCds.Cds.EOF) do
    begin
      ListaIdFunc.Add(dmCds.Cds.FieldByName('IDPESSOA').asString);
      chklstFunc.Items.Add(dmCds.Cds.FieldByName('NOME').asString);
      dmCds.Cds.Next;
    end;
  end;
  HabilitaBtOk;
end;

procedure TfrmParamCompSaldo.HabilitaBtOk;
begin
  bbtnConfirmar.Enabled := (Trim(dblkcbRubBase.Text) <> '') and (Trim(dtedFim.Text) <> '') and
    (Trim(dblkcbRubReportada.Text) <> '') and (Trim(dtedInicio.Text) <> '') and
    (sListaIdEstabSel <> '') and (chklstFunc.Items.Count > 0);
end;

function TfrmParamCompSaldo.VerificaOpcoesOk: boolean;
begin
  Result := false;

  // Testa se Data Final é MENOR do que a Data Inicial
  if (dtedFim.Date < dtedInicio.Date) then
  begin
    MsgDlg('Data Final MENOR que a Inicial.', 'Aviso', mtWarning, [mbOk,mbHelp], 0);
    dtedInicio.SetFocus;
    exit;
  end;

  Result := true;
end;

procedure TfrmParamCompSaldo.bbtnSelTodosEstabClick(Sender: TObject);
var
  c: integer;
begin
  for c:=0 to chklstEstab.Items.Count-1 do
    chklstEstab.Checked[c] := true;
  chklstEstab.Repaint;
  MontaListaFuncionarios;
end;

procedure TfrmParamCompSaldo.bbtnInverteSelEstabClick(Sender: TObject);
var
  c: integer;
begin
  for c:=0 to chklstEstab.Items.Count-1 do
    chklstEstab.Checked[c] := not(chklstEstab.Checked[c]);
  chklstEstab.Repaint;
  MontaListaFuncionarios;
end;

procedure TfrmParamCompSaldo.chklstEstabClickCheck(Sender: TObject);
begin
  inherited;
  MontaListaFuncionarios;
end;

end.
