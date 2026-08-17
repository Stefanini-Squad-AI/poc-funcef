// *****************************************************************************
// ***************************** REGISTRO DE ALTERAÇÕES ************************
// *****************************************************************************
// Autor(a)    : Fábio Sampaio
// Data        : 11/03/2019
// SIG.........: 81086
// Descricao   : Criação do parametro TOTALIdFunc
//------------------------------------------------------------------------------
// Autor(a)    :  Felipe A. Santos
// Data        :  06/01/2014
// Pendência   : SOL 201660 KTN 1963920
// Descricao   : Foi criado as abas de proventos, descontos, apoio.
//------------------------------------------------------------------------------
// Autor(a)    :  Ádler Teodoro de Souza
// Data        :  19/02/2009
// Pendência   : SOL 109421 KINTANA 496332
// Descricao   :  Alteração de gravação de arquivos de log na raiz do disco C: .
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

//------------------------------------------------------------------------------
unit fParamFichaFinanc;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs, IvDictio,
  IvMulti, IvEMulti, MAHlpBtn, StdCtrls, Buttons, TB97Tlbr, TB97, ExtCtrls, Db, Spin,
  DBTables, wwdblook, checklst, TREdit, ComCtrls, IniFileEx, DBClient, uCMClientDataSet,
  fParamReports_Padrao, CmParamReport, uCtrlPessoaFilialPessoa, uCtrlGlobalRH,
  uCtrlPessoaFuncionario, uCtrlListTerceirosRH, uCtrlProvDesc, uCtrlMotivo, ColorCheckListBox;

type
  TfrmParamFichaFinanc = class(TfrmParamReports_Padrao)
    gbxMesAnoRef: TGroupBox;
    cmbMes: TComboBox;
    speAno: TSpinEdit;
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
    gbxRubrica: TGroupBox;
    CdsEstab: TCMClientDataSet;
    tbshEstabelecimento: TTabSheet;
    chklstEstab: TColorCheckListBox;
    bbtnSelTodosEstab: TBitBtn;
    bbtnInverteSelEstab: TBitBtn;
    tbshTipoFolha: TTabSheet;
    chklstTipoFolha: TColorCheckListBox;
    spbtSelTodos: TBitBtn;
    spbtInvSelecao: TBitBtn;
    tbshCCusto: TTabSheet;
    chklstCCusto: TColorCheckListBox;
    bbtnSelTodosCC: TBitBtn;
    bbtnInverteSelCC: TBitBtn;
    pgctrlRubricas: TPageControl;
    tbsProventos: TTabSheet;
    lblRubCodProv: TLabel;
    chklstRubrica01: TColorCheckListBox;
    bbtnSelTodosRubProv: TBitBtn;
    bbtnInverteSelRubProv: TBitBtn;
    sbtnMarcarRubProv: TBitBtn;
    edCodRubricas01: TEdit;
    tbsDescontos: TTabSheet;
    edCodRubricas02: TEdit;
    chklstRubrica02: TColorCheckListBox;
    tbsApoio: TTabSheet;
    edCodRubricas03: TEdit;
    chklstRubrica03: TColorCheckListBox;
    gbxOrdem: TGroupBox;
    cmbOrderBy: TComboBox;
    lblRubCodDes: TLabel;
    lblRubCodApoio: TLabel;
    bbtnSelTodosRubDes: TBitBtn;
    bbtnInverteSelRubDes: TBitBtn;
    sbtnMarcarRubDes: TBitBtn;
    bbtnSelTodosRubApoio: TBitBtn;
    bbtnInverteSelRubApoio: TBitBtn;
    sbtnMarcarRubApoio: TBitBtn;
    procedure bbtnConfirmarClick(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure gbxSituacaoEnter(Sender: TObject);
    procedure gbxSituacaoExit(Sender: TObject);
    procedure gbxTipContraEnter(Sender: TObject);
    procedure gbxTipContraExit(Sender: TObject);
    procedure chklstFuncClickCheck(Sender: TObject);
    procedure bbtnSelTodosFuncClick(Sender: TObject);
    procedure bbtnInverteSelFuncClick(Sender: TObject);
    procedure CheckarRubrica(Sender: TObject);
    procedure MarcarRub(Sender: TObject);
    procedure SelTodosRub(Sender: TObject);
    procedure InverteSelRub(Sender: TObject);
    procedure speAnoChange(Sender: TObject);
    procedure bbtnSelTodosEstabClick(Sender: TObject);
    procedure bbtnInverteSelEstabClick(Sender: TObject);
    procedure chklstEstabClickCheck(Sender: TObject);
    procedure spbtSelTodosClick(Sender: TObject);
    procedure spbtInvSelecaoClick(Sender: TObject);
    procedure chklstTipoFolhaClickCheck(Sender: TObject);
    procedure chklstCCustoClickCheck(Sender: TObject);
    procedure bbtnSelTodosCCClick(Sender: TObject);
    procedure bbtnInverteSelCCClick(Sender: TObject);
    procedure pgctrlRubricasChange(Sender: TObject);
  private
    CtrlPessoaFilialPessoa: TCtrlPessoaFilialPessoa;
    CtrlGlobalRH: TCtrlGlobalRH;
    CtrlPessoaFuncionario: TCtrlPessoaFuncionario;
    CtrlListTerceirosRH: TCtrlListTerceirosRH;
    CtrlProvDesc: TCtrlProvDesc;
    CtrlMotivo: TCtrlMotivo;

    ArqConfig: TIniFileEx;
    ListaIdTipoFolha, ListaIdFunc, {ListaIdRubrica, // Felipe A. Santos SOL 201660 KTN 1963920}
    ListaIdEstab, ListaCodCCusto: TStringList;

    ListaIdRubrica01, ListaIdRubrica02, ListaIdRubrica03 : TStringList;// Felipe A. Santos SOL 201660 KTN 1963920
    ListaIdRubricaSel, ListaCodProvDescSel : array of string; // Felipe A. Santos SOL 201660 KTN 1963920
    ListaCodProvDesc01, ListaCodProvDesc02, ListaCodProvDesc03  : TStringList; // Felipe A. Santos SOL 201660 KTN 1963920


    sListaIdRubricaSel, sListaIdEstabSel, sListaCodCCustoSel: string;
    bSitAtivo, bSitAfast, bSitDemit, bTipContrEfet, bTipContrEspec, bTipContrTemp,
    bTipContrEst, bTipContrTerc, bTipContrProp, bTipContrAut: boolean;

    chkPos : TColorCheckListBox; // Felipe A. Santos SOL 201660 KTN 1963920
    edCodRubPos : TEdit; // Felipe A. Santos SOL 201660 KTN 1963920
    ListaPos : TStringList; // Felipe A. Santos SOL 201660 KTN 1963920

    procedure ComponentesPagRub(PageIndex : integer); // Felipe A. Santos SOL 201660 KTN 1963920
    procedure MontaListaFuncionarios;
    procedure HabilitaBtOk;
    procedure LeAlteracoes;
    procedure GravaAlteracoes;
  end;

var
  frmParamFichaFinanc: TfrmParamFichaFinanc;

implementation

uses uSistema, uMensErro, fAguarde, dCds, uCtrlPadroes, uCtrlFuncoesRH, uCtrlUsoGeralRH;

{$R *.DFM}

procedure TfrmParamFichaFinanc.FormCreate(Sender: TObject);
var
  NormalIni: TDate;
  c: byte;
begin
  inherited;
  ListaIdTipoFolha := TStringList.Create;
  ListaIdFunc := TStringList.Create;

  // Felipe A. Santos SOL 201660 KTN 1963920
  //ListaIdRubrica := TStringList.Create;
  ListaIdRubrica01 := TStringList.Create;
  ListaIdRubrica02 := TStringList.Create;
  ListaIdRubrica03 := TStringList.Create;
  ListaCodProvDesc01 := TStringList.Create;
  ListaCodProvDesc02 := TStringList.Create;
  ListaCodProvDesc03 := TStringList.Create;
  // Felipe A. Santos SOL 201660 KTN 1963920 - fim

  ListaIdEstab := TStringList.Create;
  ListaCodCCusto := TStringList.Create;

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

  CtrlProvDesc := TCtrlProvDesc.Create;
  CtrlProvDesc.InitializeAs(Padroes);

  CtrlMotivo := TCtrlMotivo.Create;
  CtrlMotivo.InitializeAs(Padroes);

  // Lista de Tipos de Folha
  chklstTipoFolha.Items.Clear;
  ListaIdTipoFolha.Clear;
  dmCds.Cds.Data := CtrlMotivo.ListMotivo_Id_e_Descricao('F,D');
  while not(dmCds.Cds.EOF) do
  begin
    ListaIdTipoFolha.Add(dmCds.Cds.FieldByName('IDMOTIVO').asString);
    chklstTipoFolha.Items.Add(dmCds.Cds.FieldByName('DESCRICAO').asString);
    dmCds.Cds.Next;
  end;

  // Montar a Lista de Rubricas

  // Alterado Por Felipe A. Santos SOL 201660 KTN 1963920

   // Cria as posições do array de acordo com a quantidade de paginas do pagecontrol
  SetLength(ListaIdRubricaSel, pgctrlRubricas.PageCount); // Felipe A. Santos SOL 201660 KTN 1963920
  SetLength(ListaCodProvDescSel, pgctrlRubricas.PageCount); // Felipe A. Santos SOL 201660 KTN 1963920

  // proventos
  chklstRubrica01.Items.Clear;
  dmCds.Cds.Data := CtrlProvDesc.ListRubricaEmpresa(IntToStr(Sistema.IdEmpresa), -1, '', -1, '', 0);
  while not(dmCds.Cds.EOF) do
  begin
    ListaIdRubrica01.Add(dmCds.Cds.FieldByName('IDRUBRICA').asString);
    ListaCodProvDesc01.Add(dmCds.Cds.FieldByName('CODPROVDESC').asString);
    chklstRubrica01.Items.Add(dmCds.Cds.FieldByName('DESCRPROVDESC').asString);
    dmCds.Cds.Next;
  end;
  
  // descontos
  chklstRubrica02.Items.Clear;
  dmCds.Cds.Data := CtrlProvDesc.ListRubricaEmpresa(IntToStr(Sistema.IdEmpresa), -1, '', -1, '', 1);
  while not(dmCds.Cds.EOF) do
  begin
    ListaIdRubrica02.Add(dmCds.Cds.FieldByName('IDRUBRICA').asString);
    ListaCodProvDesc02.Add(dmCds.Cds.FieldByName('CODPROVDESC').asString);
    chklstRubrica02.Items.Add(dmCds.Cds.FieldByName('DESCRPROVDESC').asString);
    dmCds.Cds.Next;
  end;

  // apoio
  chklstRubrica03.Items.Clear;
  dmCds.Cds.Data := CtrlProvDesc.ListRubricaEmpresa(IntToStr(Sistema.IdEmpresa), -1, '', -1, '', 2);
  while not(dmCds.Cds.EOF) do
  begin
    ListaIdRubrica03.Add(dmCds.Cds.FieldByName('IDRUBRICA').asString);
    ListaCodProvDesc03.Add(dmCds.Cds.FieldByName('CODPROVDESC').asString);
    chklstRubrica03.Items.Add(dmCds.Cds.FieldByName('DESCRPROVDESC').asString);
    dmCds.Cds.Next;
  end;

  // Felipe A. Santos SOL 201660 KTN 1963920 - fim

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

  // Monto a Lista de C. Custo
  chklstCCusto.Items.Clear;
  ListaCodCCusto.Clear;
  dmCds.Cds.Data := CtrlListTerceirosRH.ListCCusto(IntToStr(Sistema.IdEmpresa));
  while not(dmCds.Cds.EOF) do
  begin
    ListaCodCCusto.Add(dmCds.Cds.FieldByName('CODCENTROCUSTO').asString);
    chklstCCusto.Items.Add(dmCds.Cds.FieldByName('NOME').asString);
    dmCds.Cds.Next;
  end;

  NormalIni := CtrlGlobalRH.GetNormalIni;
  cmbMes.ItemIndex := FU.ExtraiMes(NormalIni) - 1;
  speAno.Text := IntToStr(FU.ExtraiAno(NormalIni));

  cmbOrderBy.ItemIndex := 0;
  pgctrlEmpregados.ActivePageIndex := 0;
  pgctrlRubricas.ActivePageIndex := 0; // Felipe A. Santos SOL 201660 KTN 1963920
  dmCds.Cds.EmptyDataSet; // Felipe A. Santos SOL 201660 KTN 1963920

  // Carrega alterações nas opções feitas anteriormente
  LeAlteracoes;

  // atribui referencia dos componentes de acordo com a pagina de rubricas posicionado
  ComponentesPagRub(pgctrlRubricas.ActivePageIndex); // Felipe A. Santos SOL 201660 KTN 1963920

  MontaListaFuncionarios;
end;

procedure TfrmParamFichaFinanc.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  GravaAlteracoes;   

  FreeAndNil(CtrlMotivo);
  FreeAndNil(CtrlPessoaFilialPessoa);
  FreeAndNil(CtrlGlobalRH);
  FreeAndNil(CtrlPessoaFuncionario);
  FreeAndNil(CtrlListTerceirosRH);
  FreeAndNil(CtrlProvDesc);
  FreeAndNil(ListaIdFunc);

  // Felipe A. Santos SOL 201660 KTN 1963920
  //FreeAndNil(ListaIdRubrica); 
  FreeAndNil(ListaIdRubrica01);
  FreeAndNil(ListaIdRubrica02);
  FreeAndNil(ListaIdRubrica03);
  FreeAndNil(ListaCodProvDesc01);
  FreeAndNil(ListaCodProvDesc02);
  FreeAndNil(ListaCodProvDesc03);
  // Felipe A. Santos SOL 201660 KTN 1963920

  FreeAndNil(ListaIdEstab);
  FreeAndNil(ListaIdTipoFolha);
  FreeAndNil(ListaCodCCusto);
  inherited;
end;

procedure TfrmParamFichaFinanc.speAnoChange(Sender: TObject);
begin
  HabilitaBtOk;
end;

procedure TfrmParamFichaFinanc.gbxTipContraEnter(Sender: TObject);
begin
  bTipContrEfet := cbxEfetivos.Checked;
  bTipContrEspec := cbxEspeciais.Checked;
  bTipContrTemp := cbxTemporarios.Checked;
  bTipContrEst := cbxEstagiarios.Checked;
  bTipContrTerc := cbxTerceiros.Checked;
  bTipContrProp := cbxPropDirSemVinc.Checked;
  bTipContrAut := cbxAutonomos.Checked;
end;

procedure TfrmParamFichaFinanc.gbxSituacaoEnter(Sender: TObject);
begin
  bSitAtivo := (cbxAtivos.Checked);
  bSitAfast := (cbxAfastados.Checked);
  bSitDemit := (cbxDemitidos.Checked);
end;

procedure TfrmParamFichaFinanc.gbxTipContraExit(Sender: TObject);
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

procedure TfrmParamFichaFinanc.gbxSituacaoExit(Sender: TObject);
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

procedure TfrmParamFichaFinanc.chklstFuncClickCheck(Sender: TObject);
begin
  inherited;
  HabilitaBtOk;
end;

procedure TfrmParamFichaFinanc.CheckarRubrica(Sender: TObject);
begin
  inherited;
  // Alterado por Felipe A. Santos SOL 201660 KTN 1963920
  FU.CriaListaOpcoes(chkPos, ListaPos, ListaCodProvDescSel[pgctrlRubricas.ActivePageIndex], ',', false);
  edCodRubPos.Text := ListaCodProvDescSel[pgctrlRubricas.ActivePageIndex];
  HabilitaBtOk;  
  // Alterado por Felipe A. Santos SOL 201660 KTN 1963920 - fim
end;

procedure TfrmParamFichaFinanc.MarcarRub(Sender: TObject);
begin
  // Alterado por Felipe A. Santos SOL 201660 KTN 1963920
  ListaCodProvDescSel[pgctrlRubricas.ActivePageIndex] := Trim(edCodRubPos.Text);
  FU.VerificaOpcoes(chkPos, ListaPos, ListaCodProvDescSel[pgctrlRubricas.ActivePageIndex], ',');
  HabilitaBtOk;
  chkPos.Repaint;
  // Alterado por Felipe A. Santos SOL 201660 KTN 1963920 - fim
end;

procedure TfrmParamFichaFinanc.bbtnSelTodosFuncClick(Sender: TObject);
var
  c: integer;
begin
  for c:=0 to chklstFunc.Items.Count-1 do
    chklstFunc.Checked[c] := true;
  chklstFunc.Repaint;
  HabilitaBtOk;
end;

procedure TfrmParamFichaFinanc.bbtnInverteSelFuncClick(Sender: TObject);
var
  c: integer;
begin
  for c:=0 to chklstFunc.Items.Count-1 do
    chklstFunc.Checked[c] := not(chklstFunc.Checked[c]);
  chklstFunc.Repaint;
  HabilitaBtOk;
end;

procedure TfrmParamFichaFinanc.SelTodosRub(Sender: TObject);
var
  c: integer;
begin
  // alterado por Felipe A. Santos SOL 201660 KTN 1963920
  for c:=0 to chkPos.Items.Count-1 do
    chkPos.Checked[c] := true;

  FU.CriaListaOpcoes(chkPos, ListaPos, ListaCodProvDescSel[pgctrlRubricas.ActivePageIndex], ',', false);
  edCodRubPos.Text := ListaCodProvDescSel[pgctrlRubricas.ActivePageIndex];
  chkPos.Repaint;
  HabilitaBtOk;
  // Felipe A. Santos SOL 201660 KTN 1963920 - fim

end;

procedure TfrmParamFichaFinanc.InverteSelRub(Sender: TObject);
var
  c: integer;
begin
  // alterado por Felipe A. Santos SOL 201660 KTN 1963920
  for c:=0 to chkPos.Items.Count-1 do
    chkPos.Checked[c] := not(chkPos.Checked[c]);

  FU.CriaListaOpcoes(chkPos, ListaPos, ListaCodProvDescSel[pgctrlRubricas.ActivePageIndex], ',', false);
  edCodRubPos.Text := ListaCodProvDescSel[pgctrlRubricas.ActivePageIndex];
  chkPos.Repaint;
  HabilitaBtOk;
  // Felipe A. Santos SOL 201660 KTN 1963920 - fim
end;

procedure TfrmParamFichaFinanc.bbtnConfirmarClick(Sender: TObject);
var
  iRub, iQtdTotRub : integer; // Felipe A. Santos SOL 201660 KTN 1963920
  i: Integer;
  wNum: word;
  sListaIdTipoFolhaSel, sListaIdFuncSel, 
  sTOTALIdFunc, // Alterado por FHBS - 11/03/2019 - SIG81086
  sRubNull{Felipe A. Santos SOL 201660 KTN 1963920} : string;
begin
  // Funcionários escolhidos

  // Felipe A. Santos SOL 201660 KTN 1963920
  //wNum := FU.CriaListaOpcoes(chklstFunc, ListaIdFunc, sListaIdFuncSel, ',', false);
  FU.CriaListaOpcoes(chklstFunc, ListaIdFunc, sListaIdFuncSel, ',', false);
  // Felipe A. Santos SOL 201660 KTN 1963920 - fim

  // Alterado por FHBS - 11/03/2019 - SIG81086
  sTOTALIdFunc := '';
  for i:= 0 to ListaIdFunc.Count - 1 do
  begin
    if i > 0 then sTOTALIdFunc := sTOTALIdFunc + ',';

    sTOTALIdFunc := sTOTALIdFunc + ListaIdFunc[i]
  end;
  // Fim - Alterado por FHBS - 11/03/2019 - SIG81086

  //  if (wNum = ListaIdFunc.Count) then
  //    sListaIdFuncSel := '';

  // Rubricas para Remuneração selecionadas

  // Felipe A. Santos SOL 201660 KTN 1963920
  
  sRubNull := QuotedStr('-1');
  sListaIdRubricaSel := sRubNull;
  for iRub := 0 to pgctrlRubricas.PageCount - 1 do
  begin
      chkPos := TColorCheckListBox(Self.FindComponent('chklstRubrica0' + IntToStr(iRub + 1))); // pega o checklist das rubricas
      case iRub + 1 of
          1 : listaPos := ListaIdRubrica01;
          2 : listaPos := ListaIdRubrica02;
          3 : listaPos := ListaIdRubrica03;
      end;
      wNum := (wNum + FU.CriaListaOpcoes(chkPos, listaPos, ListaIdRubricaSel[iRub], ',', True));
      iQtdTotRub := (iQtdTotRub + ListaPos.Count);

      if ListaIdRubricaSel[iRub] <> '' then
          sListaIdRubricaSel := sListaIdRubricaSel + ',' +  ListaIdRubricaSel[iRub];
  end;

  ComponentesPagRub(pgctrlRubricas.ActivePageIndex); // pega os componentes em que a página de rubricas está posicionada
  if (sListaIdRubricaSel = sRubNull) or (wNum = iQtdTotRub) then // verifica se tem que passar os idrubrica como filtro na SQL
     sListaIdRubricaSel := '';

  {wNum := FU.CriaListaOpcoes(chklstRubrica, ListaIdRubrica, sListaIdRubricaSel, ',', true);
  if (wNum = ListaIdRubrica.Count) then
    sListaIdRubricaSel := '';
   }
  // Felipe A. Santos SOL 201660 KTN 1963920 - fim

  // Tipos de Folha selecionados
  wNum := FU.CriaListaOpcoes(chklstTipoFolha, ListaIdTipoFolha, sListaIdTipoFolhaSel, ',', false);
  if (wNum = ListaIdTipoFolha.Count) then
    sListaIdTipoFolhaSel := '';

  // Centros de Custo escolhidos
  FU.CriaListaOpcoes(chklstCCusto, ListaCodCCusto, sListaCodCCustoSel, ',', true);

  Cmp_Padrao.ParamByName('ListaIdEstab').asString := sListaIdEstabSel;
  Cmp_Padrao.ParamByName('ListaIdFunc').asString := sListaIdFuncSel;
  Cmp_Padrao.ParamByName('ListaCodCCusto').asString := sListaCodCCustoSel;
  Cmp_Padrao.ParamByName('TipoContrato').asString := FU.GerarListaTipoContratoSel(
    cbxEfetivos.Checked, cbxEspeciais.Checked, cbxTemporarios.Checked, cbxTerceiros.Checked,
    cbxPropDirSemVinc.Checked, cbxAutonomos.Checked, cbxEstagiarios.Checked, true);
  Cmp_Padrao.ParamByName('SitFunc').asString := FU.GerarListaSitFuncSel(cbxAtivos.Checked,
    cbxAfastados.Checked, cbxDemitidos.Checked, true);
  Cmp_Padrao.ParamByName('ListaIdRubrica').asString := sListaIdRubricaSel;
  Cmp_Padrao.ParamByName('ListaTipoFolha').asString := sListaIdTipoFolhaSel;
  Cmp_Padrao.ParamByName('SelRubricaApoio').asBoolean := True; // chkListaOutros.Checked; // Felipe A. Santos SOL 201660 KTN 1963920
  Cmp_Padrao.ParamByName('AnoRef').asInteger := speAno.Value;
  Cmp_Padrao.ParamByName('MesRef').asInteger := cmbMes.ItemIndex+1;
  Cmp_Padrao.ParamByName('Ordenacao').asInteger := cmbOrderBy.ItemIndex;
  Cmp_Padrao.ParamByName('TOTALIdFunc').AsString := sTOTALIdFunc; // Alterado por FHBS - 11/03/2019 - SIG81086

  frmAguarde.Mostra('Ficha Financeira por Funcionário');
  frmAguarde.Pos := 0;
end;

// -------------------------------------------------------------------------------------
// Funções do Form
// -------------------------------------------------------------------------------------

procedure TfrmParamFichaFinanc.MontaListaFuncionarios;
begin
  // Estabelecimentos selecionados
  FU.CriaListaOpcoes(chklstEstab, ListaIdEstab, sListaIdEstabSel, ',', false);

  ListaIdFunc.Clear;
  chklstFunc.Items.Clear;

  if (sListaIdEstabSel <> '') then
  begin
    FU.CriaListaOpcoes(chklstCCusto, ListaCodCCusto, sListaCodCCustoSel, ',', false);

    dmCds.Cds.Data := CtrlPessoaFuncionario.ListEmpresaFuncionario(Sistema.IdEmpresa,
      '', sListaIdEstabSel, FU.GerarListaSitFuncSel(cbxAtivos.Checked,
      cbxAfastados.Checked, cbxDemitidos.Checked), FU.GerarListaTipoContratoSel(
      cbxEfetivos.Checked, cbxEspeciais.Checked, cbxTemporarios.Checked, cbxTerceiros.Checked,
      cbxPropDirSemVinc.Checked, cbxAutonomos.Checked, cbxEstagiarios.Checked),
      '',sListaCodCCustoSel);

    while not(dmCds.Cds.EOF) do
    begin
      ListaIdFunc.Add(dmCds.Cds.FieldByName('IDPESSOA').asString);
      chklstFunc.Items.Add(dmCds.Cds.FieldByName('NOME').asString);
      dmCds.Cds.Next;
    end;
  end;
  HabilitaBtOk;
end;

procedure TfrmParamFichaFinanc.HabilitaBtOk;
begin
  bbtnConfirmar.Enabled := (sListaIdEstabSel <> '') and (Trim(speAno.Text) <> '');
end;

procedure TfrmParamFichaFinanc.LeAlteracoes;
var
   iCod : integer; //Felipe A. Santos SOL 201660 KTN 1963920
   sParametrizar : string; //Felipe A. Santos SOL 201660 KTN 1963920
begin
  // Recupera as últimas alterações das opções
  //ArqConfig := TIniFileEx.Create('C:\CONFIG_FOLHAPAGTO.INI');
  ArqConfig := TIniFileEx.Create(Sistema.RetornaCaminhoArquivos(Sistema.IdEmpresa)+ '\CONFIG_FOLHAPAGTO.INI');//Ádler Teodoro de Souza SOL 109421 KINTANA 496332

  // alterado por Felipe A. Santos SOL 201660 KTN 1963920
  sParametrizar := ArqConfig.ReadString('REL_FICHAFINANC', 'FLGPARAMETRIZARRUB', 'N');

  if sParametrizar = 'S' then
  begin
    for iCod := 0 to pgctrlRubricas.PageCount - 1  do
    begin
         ComponentesPagRub(iCod);  // pega os componentes de acordo com a posição passada

         ListaCodProvDescSel[iCod] := ArqConfig.ReadString('REL_FICHAFINANC', 'Rubricas0' + IntToStr(iCod + 1), '');
         FU.VerificaOpcoes(chkPos, ListaPos, ListaCodProvDescSel[iCod], ',');
         edCodRubPos.Text := ListaCodProvDescSel[iCod];
    end;
  end
  else // se não tiver nada parametrizado então seleciona as rubricas por default(Proventos e Descontos)
  begin
     for iCod := 0 to 1 do
     begin
          ComponentesPagRub(iCod);
          SelTodosRub(Self);
     end;
  end;
  //Felipe A. Santos SOL 201660 KTN 1963920 - fim
end;

procedure TfrmParamFichaFinanc.GravaAlteracoes;
var
   iCod : integer; //Felipe A. Santos SOL 201660 KTN 1963920
begin
  // alterado por Felipe A. Santos SOL 201660 KTN 1963920
  for iCod := 0 to pgctrlRubricas.PageCount - 1 do
  begin
       ComponentesPagRub(iCod);  // pega os componentes de acordo com a posição passada

       FU.CriaListaOpcoes(chkPos, ListaPos, ListaCodProvDescSel[iCod], ',', false);
       ArqConfig.WriteString('REL_FICHAFINANC', 'Rubricas0' + IntToStr(iCod + 1), ListaCodProvDescSel[iCod]);

  end;
  ArqConfig.WriteString('REL_FICHAFINANC', 'FLGPARAMETRIZARRUB', 'S');
  ArqConfig.Free;
  // Felipe A. Santos SOL 201660 KTN 1963920 - fim
end;

procedure TfrmParamFichaFinanc.bbtnSelTodosEstabClick(Sender: TObject);
var
  c: integer;
begin
  for c:=0 to chklstEstab.Items.Count-1 do
    chklstEstab.Checked[c] := true;
  chklstEstab.Repaint;
  MontaListaFuncionarios;
end;

procedure TfrmParamFichaFinanc.bbtnInverteSelEstabClick(Sender: TObject);
var
  c: integer;
begin
  for c:=0 to chklstEstab.Items.Count-1 do
    chklstEstab.Checked[c] := not(chklstEstab.Checked[c]);
  chklstEstab.Repaint;
  MontaListaFuncionarios;
end;

procedure TfrmParamFichaFinanc.chklstEstabClickCheck(Sender: TObject);
begin
  inherited;
  MontaListaFuncionarios;
end;

procedure TfrmParamFichaFinanc.spbtSelTodosClick(Sender: TObject);
var
  c: integer;
begin
  for c:=0 to chklstTipoFolha.Items.Count-1 do
    chklstTipoFolha.Checked[c] := true;
  chklstTipoFolha.Repaint;
  HabilitaBtOk;
end;

procedure TfrmParamFichaFinanc.spbtInvSelecaoClick(Sender: TObject);
var
  c: integer;
begin
  for c:=0 to chklstTipoFolha.Items.Count-1 do
    chklstTipoFolha.Checked[c] := not(chklstTipoFolha.Checked[c]);
  chklstTipoFolha.Repaint;
  HabilitaBtOk;
end;

procedure TfrmParamFichaFinanc.chklstTipoFolhaClickCheck(Sender: TObject);
begin
  inherited;
  HabilitaBtOk;
end;

procedure TfrmParamFichaFinanc.chklstCCustoClickCheck(Sender: TObject);
begin
  inherited;
  MontaListaFuncionarios;
end;

procedure TfrmParamFichaFinanc.bbtnSelTodosCCClick(Sender: TObject);
var
  c: integer;
begin
  for c:=0 to chklstCCusto.Items.Count-1 do
    chklstCCusto.Checked[c] := true;
  chklstCCusto.Repaint;

  MontaListaFuncionarios;
end;

procedure TfrmParamFichaFinanc.bbtnInverteSelCCClick(Sender: TObject);
var
  c: integer;
begin
  for c:=0 to chklstCCusto.Items.Count-1 do
    chklstCCusto.Checked[c] := not(chklstCCusto.Checked[c]);
  chklstCCusto.Repaint;

  MontaListaFuncionarios;
end;

procedure TfrmParamFichaFinanc.pgctrlRubricasChange(Sender: TObject);
begin
  inherited;
  ComponentesPagRub(pgctrlRubricas.ActivePageIndex); // Felipe A. Santos SOL 201660 KTN 1963920
end;

procedure TfrmParamFichaFinanc.ComponentesPagRub(PageIndex : integer);
var
  Posicao : integer; // Felipe A. Santos SOL 201660 KTN 1963920
begin
  // Felipe A. Santos SOL 201660 KTN 1963920
  Posicao := PageIndex + 1;

  // pega os componentes de acordo com a página selecionada
  chkPos := TColorCheckListBox(Self.FindComponent('chklstRubrica0' + IntToStr(Posicao)));
  edCodRubPos := TEdit(Self.FindComponent('edCodRubricas0' + IntToStr(Posicao)));

  case Posicao of
    1 : listaPos := ListaCodProvDesc01;
    2 : listaPos := ListaCodProvDesc02;
    3 : listaPos := ListaCodProvDesc03;
  end;
  // Felipe A. Santos SOL 201660 KTN 1963920 - fim
end;

end.
