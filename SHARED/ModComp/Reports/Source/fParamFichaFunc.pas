// *****************************************************************************
// ***************************** REGISTRO DE ALTERAÇÕES ************************
// *****************************************************************************
// Autor(a)    :  Marcio Sanches Spinosa
// Data        :  07/08/2012
// Pendência   : SOL 155216 KINTANA 1200769
// Descricao   :  Adicionados os botões Selecionar tudo e inverter Seleção.
//------------------------------------------------------------------------------
// Autor(a)    :  Ádler Teodoro de Souza
// Data        :  27/02/2009
// Pendência   : SOL 109421 KINTANA 496332
// Descricao   :  Alteração de gravação de arquivos de log na raiz do disco C: .
//------------------------------------------------------------------------------
unit fParamFichaFunc;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs, fSelPessoalMT,
  Db, DBTables, Wwdatsrc, IvDictio, IvMulti, IvEMulti, MAHlpBtn, StdCtrls, Spin, Buttons,
  TB97Tlbr, TB97, ExtCtrls, wwdblook, TEdNum, wwdbdatetimepicker, ComCtrls, CMDateTimePicker,
  uCmSqlParams, DBClient, uCMClientDataSet, CmParamReport, CheckLst, IniFiles,
  ColorCheckListBox, uCtrlPessoaFuncionario, uCtrlGlobalRH, uCtrlProvDesc;

type
  TfrmParamFichaFunc = class(TfrmSelPessoalMT)
    tbshRelatorio: TTabSheet;
    rgSelecao: TRadioGroup;
    dblckFunc: TwwDBLookupCombo;
    gbxOpcoesImp: TGroupBox;
    cbxDocumentacao: TCheckBox;
    cbxUltEmpr: TCheckBox;
    cbxTreinamento: TCheckBox;
    cbxExper: TCheckBox;
    cbxAval: TCheckBox;
    cbxMedic: TCheckBox;
    cbxEvolFunc: TCheckBox;
    cbxBenef: TCheckBox;
    cbxFerias: TCheckBox;
    cbxSindical: TCheckBox;
    cbxDepen: TCheckBox;
    cbxSitFunc: TCheckBox;
    cbxObserv: TCheckBox;
    cbxDescCargo: TCheckBox;
    cbxCargoAlternativo: TCheckBox;
    CdsFunc: TCMClientDataSet;
    cbxAvalHay: TCheckBox;
    tbshAvalHay: TTabSheet;
    chklstRubrica: TColorCheckListBox;
    Label9: TLabel;
    edCodRubricas: TEdit;
    sbtnMarcarRub: TBitBtn;
    spbtSelTodos: TBitBtn;
    spbtInvSelecao: TBitBtn;
    Label10: TLabel;
    grpMesRef: TGroupBox;
    cmbMes: TComboBox;
    spnedAno: TSpinEdit;
    rgRodape: TRadioGroup;
    btnSelecionarTudo: TBitBtn;
    btnInverterSelecao: TBitBtn;
    chkAdvertenciaSuspensao: TCheckBox;
    procedure bbtnConfirmarClick(Sender: TObject);
    procedure rgSelecaoClick(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure chklstRubricaClickCheck(Sender: TObject);
    procedure spbtSelTodosClick(Sender: TObject);
    procedure spbtInvSelecaoClick(Sender: TObject);
    procedure sbtnMarcarRubClick(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure btnSelecionarTudoClick(Sender: TObject);
    procedure btnInverterSelecaoClick(Sender: TObject);
  private
    CtrlPessoaFuncionario: TCtrlPessoaFuncionario;
    CtrlGlobalRH: TCtrlGlobalRH;
    CtrlProvDesc: TCtrlProvDesc;
    ListaIdRubrica: TStringList;
    ArqConfig: TIniFile;

    sListaIdRubricaSel, LiRubrica: string;

    procedure HabilitaBtOk;
    procedure HabilitaOpcoes(Habilita: boolean);
    procedure LeAlteracoes;
    procedure GravaAlteracoes;
    procedure SelecionarTodos();//MARCIO SANCHES SPINOSA SOL 155216 KINTANA - 1200769
    procedure InverterTodos();//MARCIO SANCHES SPINOSA SOL 155216 KINTANA - 1200769
  public  
    DestruirForm: boolean;
  end;

var
  frmParamFichaFunc: TfrmParamFichaFunc;

implementation

uses uSistema, uMensErro, uCtrlPadroes, fAguarde, uCtrlUsoGeralRH, uCtrlFuncoesRH, dCds;

{$R *.DFM}

procedure TfrmParamFichaFunc.FormCreate(Sender: TObject);
begin
  inherited;
  CtrlPessoaFuncionario := TCtrlPessoaFuncionario.Create(CtrlUsoGeralRH.UsuXFilial,
    CtrlUsoGeralRH.UsuXCCusto, CtrlUsoGeralRH.IdUsuarioGeral);
  CtrlPessoaFuncionario.InitializeAs(Padroes);

  CtrlGlobalRH := TCtrlGlobalRH.Create;
  CtrlGlobalRH.InitializeAs(Padroes);

  CtrlProvDesc := TCtrlProvDesc.Create;
  CtrlProvDesc.InitializeAs(Padroes);

  cbxCargoAlternativo.Visible := cbxCargoAltern.Visible;
  cbxCargoAlternativo.Checked := cbxCargoAltern.Checked;

  dmCds.Cds.Data := CtrlGlobalRH.GetParamRH('INDPOLITICA');
  cbxAvalHay.Visible := (dmCds.Cds.FieldByName('INDPOLITICA').asInteger = 1);
  cbxAvalHay.Checked := (dmCds.Cds.FieldByName('INDPOLITICA').asInteger = 1);
  tbshAvalHay.TabVisible := (dmCds.Cds.FieldByName('INDPOLITICA').asInteger = 1);

  if (tbshAvalHay.TabVisible) then
  begin
    CtrlGlobalRH.DbParamRH.LoadFromDb;
    cmbMes.ItemIndex := FU.ExtraiMes(CtrlGlobalRH.DbParamRH.NormalIni.asDateTime-1) - 1;
    spnedAno.Value := FU.ExtraiAno(CtrlGlobalRH.DbParamRH.NormalIni.asDateTime-1);

    ListaIdRubrica := TStringList.Create;

    // Monto a Lista de Rubricas
    chklstRubrica.Items.Clear;
    dmCds.Cds.Data := CtrlProvDesc.ListRubricaEmpresa(IntToStr(Sistema.IdEmpresa));
    while not(dmCds.Cds.EOF) do
    begin
      ListaIdRubrica.Add(dmCds.Cds.FieldByName('CODPROVDESC').asString);
      chklstRubrica.Items.Add(dmCds.Cds.FieldByName('DESCRPROVDESC').asString);
      dmCds.Cds.Next;
    end;
  end;

  CdsFunc.Data := CtrlPessoaFuncionario.ListEmpresaFuncionario(Sistema.IdEmpresa);
  dblckFunc.LookupValue := CdsFunc.FieldByName('IDPESSOA').asString;
  dblckFunc.Update;
  AbrirQueryPrincipal := false;
  IrPaginaResult := false;
  DestruirForm := true;
  rgSelecaoClick(Sender);

  // Carrega alterações nas opções feitas anteriormente
  LeAlteracoes;
end;

procedure TfrmParamFichaFunc.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  GravaAlteracoes;

  FreeAndNil(CtrlPessoaFuncionario);
  FreeAndNil(CtrlGlobalRH);
  FreeAndNil(CtrlProvDesc);
  if (tbshAvalHay.TabVisible) then
    FreeAndNil(ListaIdRubrica);
  inherited;
  if not(DestruirForm) then
    Action := caHide;
end;

procedure TfrmParamFichaFunc.chklstRubricaClickCheck(Sender: TObject);
begin
  inherited;
  FU.CriaListaOpcoes(chklstRubrica, ListaIdRubrica, sListaIdRubricaSel, ',', false);
  edCodRubricas.Text := sListaIdRubricaSel;
end;

procedure TfrmParamFichaFunc.spbtSelTodosClick(Sender: TObject);
var
  c: integer;
begin
  for c:=0 to chklstRubrica.Items.Count-1 do
    chklstRubrica.Checked[c] := true;
  chklstRubrica.Repaint;

  FU.CriaListaOpcoes(chklstRubrica, ListaIdRubrica, sListaIdRubricaSel, ',', false);
  edCodRubricas.Text := sListaIdRubricaSel;
end;

procedure TfrmParamFichaFunc.spbtInvSelecaoClick(Sender: TObject);
var
  c: integer;
begin
  for c:=0 to chklstRubrica.Items.Count-1 do
    chklstRubrica.Checked[c] := not(chklstRubrica.Checked[c]);
  chklstRubrica.Repaint;

  FU.CriaListaOpcoes(chklstRubrica, ListaIdRubrica, sListaIdRubricaSel, ',', false);
  edCodRubricas.Text := sListaIdRubricaSel;
end;

procedure TfrmParamFichaFunc.sbtnMarcarRubClick(Sender: TObject);
begin
  edCodRubricas.Text := Trim(edCodRubricas.Text);
  FU.VerificaOpcoes(chklstRubrica, ListaIdRubrica, edCodRubricas.Text, ',');
  HabilitaBtOk;
  chklstRubrica.Repaint;
end;

procedure TfrmParamFichaFunc.rgSelecaoClick(Sender: TObject);
begin
  dblckFunc.Visible := (rgSelecao.ItemIndex = 0);
  HabilitaOpcoes(not(dblckFunc.Visible));
  HabilitaBtOk;
end;

procedure TfrmParamFichaFunc.bbtnConfirmarClick(Sender: TObject);
var
  sListaIdPessoa: string;
  wNum: word;
begin
  // Rubrica(s) selecionada(s) para Tabelas Hay
  if (cbxAvalHay.Checked) then
  begin
    wNum := FU.CriaListaOpcoes(chklstRubrica, ListaIdRubrica, sListaIdRubricaSel, ',', true);
    if (wNum = ListaIdRubrica.Count) then
      sListaIdRubricaSel := ''
    else
    if (sListaIdRubricaSel = '') then
    begin
      MsgDlg('Selecione pelo menos uma Rubrica para o Hay.', 'Aviso',
        mtWarning, [mbOk,mbHelp], 0);
      ModalResult := mrNone;
      exit;
    end;
  end
  else
    sListaIdRubricaSel := '';

  frmAguarde.Mostra('Ficha Funcional');
  frmAguarde.Pos := 0;

  inherited;

  if (rgSelecao.ItemIndex = 1) then
  begin
    CdsPrincipal.DisableControls;
    sqlPrincipal.Open;

    sListaIdPessoa := '';
    while not(CdsPrincipal.EOF) do
    begin
      if (sListaIdPessoa = '') then
        sListaIdPessoa := CdsPrincipal.FieldByName('IDPESSOA').asString
      else
        sListaIdPessoa := sListaIdPessoa +','+ CdsPrincipal.FieldByName('IDPESSOA').asString;
      CdsPrincipal.Next;
    end;

    CdsPrincipal.EnableControls;

    if (sListaIdPessoa = '') then
    begin
      MsgDlg('Nenhuma pessoa selecionada com os parâmetros indicados.', 'Aviso',
        mtWarning, [mbOk,mbHelp], 0);
      ModalResult := mrNone;
      exit;
    end;
  end
  else
    sListaIdPessoa := CdsFunc.FieldByName('IDPESSOA').asString;

  Cmp_Padrao.ParamByName('ListaIdPessoa').asString := sListaIdPessoa;
  Cmp_Padrao.ParamByName('ImprimirDocumentacao').asBoolean := cbxDocumentacao.Checked;
  Cmp_Padrao.ParamByName('ImprimirUltEmpregos').asBoolean := cbxUltEmpr.Checked;
  Cmp_Padrao.ParamByName('ImprimirTreinamento').asBoolean := cbxTreinamento.Checked;
  Cmp_Padrao.ParamByName('ImprimirExperiencias').asBoolean := cbxExper.Checked;
  Cmp_Padrao.ParamByName('ImprimirAvaliacoes').asBoolean := cbxAval.Checked;
  Cmp_Padrao.ParamByName('ImprimirOcorrMedicas').asBoolean := cbxMedic.Checked;
  Cmp_Padrao.ParamByName('ImprimirEvolFunc').asBoolean := cbxEvolFunc.Checked;
  Cmp_Padrao.ParamByName('ImprimirBenefSociais').asBoolean := cbxBenef.Checked;
  Cmp_Padrao.ParamByName('ImprimirFerias').asBoolean := cbxFerias.Checked;
  Cmp_Padrao.ParamByName('ImprimirDependentes').asBoolean := cbxDepen.Checked;
  Cmp_Padrao.ParamByName('ImprimirContribSindical').asBoolean := cbxSindical.Checked;
  Cmp_Padrao.ParamByName('ImprimirSitFunc').asBoolean := cbxSitFunc.Checked;
  Cmp_Padrao.ParamByName('ImprimirOBS').asBoolean := cbxObserv.Checked;
  Cmp_Padrao.ParamByName('ImprimirDescCargo').asBoolean := cbxDescCargo.Checked;
  Cmp_Padrao.ParamByName('ImprimirCargoAlternativo').asBoolean := cbxCargoAlternativo.Checked;
  Cmp_Padrao.ParamByName('ImprimirAvalHay').asBoolean := cbxAvalHay.Checked;
  Cmp_Padrao.ParamByName('ImprimirAdvertenciaSuspensao').asBoolean := chkAdvertenciaSuspensao.Checked;
  Cmp_Padrao.ParamByName('ListaIdRubrica').asString := sListaIdRubricaSel;
  Cmp_Padrao.ParamByName('MesRef').asString := spnedAno.Text +'/'+ FU.PoeZero(cmbMes.ItemIndex+1);
  Cmp_Padrao.ParamByName('IncluirRodape').asBoolean := rgRodape.ItemIndex = 0;
end;

procedure TfrmParamFichaFunc.HabilitaBtOk;
begin
  bbtnConfirmar.Enabled := ((rgSelecao.ItemIndex = 0) and (Trim(dblckFunc.Text) <> '')) or
    (rgSelecao.ItemIndex = 1);
end;

procedure TfrmParamFichaFunc.HabilitaOpcoes(Habilita: boolean);
begin
  tsDadosFunc.TabVisible := Habilita;
  tsDadosPess.TabVisible := Habilita;
  tsDadosOutros.TabVisible := Habilita;
  tbsDemit.TabVisible := Habilita;
end;

procedure TfrmParamFichaFunc.LeAlteracoes;
begin
  // Recupera as últimas alterações das opções
  //ArqConfig := TIniFile.Create('C:\CONFIG_FOLHAPAGTO.INI');
  ArqConfig := TIniFile.Create(Sistema.RetornaCaminhoArquivos(Sistema.IdEmpresa) +'\CONFIG_FOLHAPAGTO.INI');//Ádler Teodoro de Souza SOL 109421 KINTANA 496332
  LiRubrica := ArqConfig.ReadString('REL_FICHAFUNC', 'Rubricas', '');

  FU.VerificaOpcoes(chklstRubrica, ListaIdRubrica, LiRubrica, ',');

  edCodRubricas.Text := LiRubrica;
  HabilitaBtOk;
end;

procedure TfrmParamFichaFunc.GravaAlteracoes;
begin
  // Gravar as últimas alterações da Seleção de Rubricas
  FU.CriaListaOpcoes(chklstRubrica, ListaIdRubrica, LiRubrica, ',', false);
  ArqConfig.WriteString('REL_FICHAFUNC', 'Rubricas', LiRubrica);
end;

procedure TfrmParamFichaFunc.FormShow(Sender: TObject);
begin
  inherited;
  cbxObserv.Visible := False;//MARCIO SANCHES SPINOSA SOL 155216 KINTANA - 1200769
  InverterTodos;
end;
//MARCIO SANCHES SPINOSA SOL 155216 KINTANA - 1200769 - INICIO
procedure TfrmParamFichaFunc.SelecionarTodos();
begin
   cbxDocumentacao.Checked     :=  true;
   cbxUltEmpr.Checked          :=  true;
   cbxTreinamento.Checked      :=  true;
   cbxExper.Checked            :=  true;
   cbxAval.Checked             :=  true;
   cbxMedic.Checked            :=  true;
   cbxEvolFunc.Checked         :=  true;
   cbxBenef.Checked            :=  true;
   cbxFerias.Checked           :=  true;
   cbxDepen.Checked            :=  true;
   cbxSindical.Checked         :=  true;
   cbxDescCargo.Checked        :=  true;
   cbxCargoAlternativo.Checked :=  true;
   cbxSitFunc.Checked          :=  true;
   chkAdvertenciaSuspensao.Checked := True;

end;


procedure TfrmParamFichaFunc.InverterTodos;
begin
   cbxDocumentacao.Checked     := not cbxDocumentacao.Checked;
   cbxUltEmpr.Checked          := not cbxUltEmpr.Checked;
   cbxTreinamento.Checked      := not cbxTreinamento.Checked;
   cbxExper.Checked            := not cbxExper.Checked;
   cbxAval.Checked             := not cbxAval.Checked;
   cbxMedic.Checked            := not cbxMedic.Checked;
   cbxEvolFunc.Checked         := not cbxEvolFunc.Checked;
   cbxBenef.Checked            := not cbxBenef.Checked;
   cbxFerias.Checked           := not cbxFerias.Checked;
   cbxDepen.Checked            := not cbxDepen.Checked;
   cbxSindical.Checked         := not cbxSindical.Checked;
   cbxDescCargo.Checked        := not cbxDescCargo.Checked;
   cbxCargoAlternativo.Checked := not cbxCargoAlternativo.Checked;
   cbxSitFunc.Checked          := not cbxSitFunc.Checked;
   chkAdvertenciaSuspensao.Checked := not chkAdvertenciaSuspensao.Checked;

end;

procedure TfrmParamFichaFunc.btnSelecionarTudoClick(Sender: TObject);
begin
  SelecionarTodos();
end;

procedure TfrmParamFichaFunc.btnInverterSelecaoClick(Sender: TObject);
begin
  InverterTodos();
end;
//MARCIO SANCHES SPINOSA SOL 155216 KINTANA - 1200769 - FIM
end.
