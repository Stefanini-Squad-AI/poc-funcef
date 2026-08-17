// *****************************************************************************
// ***************************** REGISTRO DE ALTERAÇÕES ************************
// *****************************************************************************
// Autor(a)    :  Ádler Teodoro de Souza
// Data        :  19/02/2009
// Pendência   : SOL 109421 KINTANA 496332
// Descricao   :  Alteração de gravação de arquivos de log na raiz do disco C: .
//------------------------------------------------------------------------------
unit fParamRelTxtCCheque;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs, MAHlpBtn,
  StdCtrls, Buttons, TB97Tlbr, TB97, ExtCtrls, Db, DBTables, wwdblook, Spin, checklst,
  IvDictio, IvMulti, IvEMulti, uGImp, ExtDlgs, ComCtrls, fSairAjuda, Wwdatsrc, IniFiles,
  DBClient, uCMClientDataSet, uCMFileUtils, uCtrlPessoaFilialPessoa, uCtrlPessoaFuncionario,
  uCtrlMotivo, uCtrlGlobalRH, uCtrlProvDesc, uCtrlParamRelTxtCCheque,
  wwdbdatetimepicker, CMDateTimePicker, ColorCheckListBox, TB97Tlwn;

type
  TfrmParamRelTxtCCheque = class(TfrmSairAjuda)
    GImp: TGImp;
    svArquivo: TSaveDialog;
    opArquivo: TOpenPictureDialog;
    opAplicativo: TOpenDialog;
    bbtnGerar: TBitBtn;
    rbtnImprimir: TBitBtn;
    ToolbarSep973: TToolbarSep97;
    ToolbarSep974: TToolbarSep97;
    gbxTipPag: TGroupBox;
    chklstTipoFolha: TColorCheckListBox;
    bbtnSelTodosTipoFolha: TBitBtn;
    bbtnInvSelTipoFolha: TBitBtn;
    gbxMesAnoRef: TGroupBox;
    cmbMes: TComboBox;
    speAno: TSpinEdit;
    rgProcesso: TRadioGroup;
    gbxOrdImpress: TGroupBox;
    cmbOrderBy: TComboBox;
    rgImprCab: TRadioGroup;
    gbxDatas: TGroupBox;
    dtPagamento: TCMDateTimePicker;
    rgAltura: TRadioGroup;
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
    cbxPropDirSemVinc: TCheckBox;
    cbxAutonomos: TCheckBox;
    gbxSituacao: TGroupBox;
    cbxAtivos: TCheckBox;
    cbxAfastados: TCheckBox;
    cbxDemitidos: TCheckBox;
    Rubricas: TTabSheet;
    chklstRubrica: TColorCheckListBox;
    bbtnSelTodosRub: TBitBtn;
    bbtnInverteSelRub: TBitBtn;
    edNomeArqFrente: TEdit;
    bbtnImagem: TBitBtn;
    tbshEstabelecimento: TTabSheet;
    chklstEstab: TColorCheckListBox;
    bbtnSelTodosEstab: TBitBtn;
    bbtnInverteSelEstab: TBitBtn;
    townTipoImpressaoFuncef: TToolWindow97;
    btnFecharTipoCCheque: TBitBtn;
    rgTipoImpressaoFuncef: TRadioGroup;
    gbxFiguras: TGroupBox;
    edFigura1: TEdit;
    bbtnFigura1: TBitBtn;
    Label1: TLabel;
    Label2: TLabel;
    edFigura2: TEdit;
    bbtnFigura2: TBitBtn;
    Label3: TLabel;
    edFigura3: TEdit;
    bbtnFigura3: TBitBtn;
    CdsEstab: TCMClientDataSet;
    CdsParamRH: TCMClientDataSet;
    procedure FormCreate(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure bbtnGerarClick(Sender: TObject);
    procedure rbtnImprimirClick(Sender: TObject);
    procedure bbtnImagemClick(Sender: TObject);
    procedure bbtnSelTodosTipoFolhaClick(Sender: TObject);
    procedure bbtnInvSelTipoFolhaClick(Sender: TObject);
    procedure chklstTipoFolhaClickCheck(Sender: TObject);
    procedure speAnoChange(Sender: TObject);
    procedure gbxSituacaoEnter(Sender: TObject);
    procedure gbxSituacaoExit(Sender: TObject);
    procedure gbxTipContraEnter(Sender: TObject);
    procedure gbxTipContraExit(Sender: TObject);
    procedure bbtnSelTodosFuncClick(Sender: TObject);
    procedure bbtnInverteSelFuncClick(Sender: TObject);
    procedure bbtnSelTodosRubClick(Sender: TObject);
    procedure bbtnInverteSelRubClick(Sender: TObject);
    procedure chklstRubricaClickCheck(Sender: TObject);
    procedure bbtnSelTodosEstabClick(Sender: TObject);
    procedure bbtnInverteSelEstabClick(Sender: TObject);
    procedure chklstEstabClickCheck(Sender: TObject);
    procedure rgTipoImpressaoFuncefClick(Sender: TObject);
    procedure bbtnFigura1Click(Sender: TObject);
    procedure bbtnFigura2Click(Sender: TObject);
    procedure bbtnFigura3Click(Sender: TObject);
    procedure btnFecharTipoCChequeClick(Sender: TObject);
    procedure FormShow(Sender: TObject);
  private
    CtrlParamRelTxtCCheque: TCtrlParamRelTxtCCheque;
    CtrlPessoaFilialPessoa: TCtrlPessoaFilialPessoa;
    CtrlPessoaFuncionario: TCtrlPessoaFuncionario;
    CtrlGlobalRH: TCtrlGlobalRH;
    CtrlMotivo: TCtrlMotivo;
    CtrlProvDesc: TCtrlProvDesc;

    ArqConfig: TIniFile;
    ListaIdFunc, ListaIdMotivo, ListaIdRubrica, ListaIdEstab: TStringList;

    sListaIdEstabSel, sListaIdRubricaSel, Msg, Msg1, Msg2, AnoBarraMes, MesBarraAno,
    NomeTabela, sListaIdFuncSel, sListaIdMotivoSel: string;

    wNum: word;
    K: integer;

    bGravouTxtMod3, bSitAtivo, bSitDemit, bSitAfast, bTipContrEfet, bTipContrEspec,
    bTipContrTemp, bTipContrEst, bTipContrTerc, bTipContrProp, bTipContrAut,
    bDemInformativo: boolean;

    procedure MontaListaFuncionarios;
    procedure HabilitaBtOk;
    procedure GerarQuery;
    procedure Progresso(Arg: array of variant);
    procedure LeAlteracoes;
    procedure GravaAlteracoes;

    function  GerarModelo(FileName, AnoMes: string): boolean;

    function  GerarModelo_SERPROS(FileName, AnoMes: string): boolean;
    function  GerarModelo_REFER(FileName, AnoMes: string): boolean;
    function  GerarModelo_FUNCEF(FileName, AnoMes: string): boolean;
    function  GerarModelo_FCRT(FileName, AnoMes: string): boolean;
    function  GerarModelo_CTRQ(FileName, AnoMes: string): boolean;
    function  GerarModelo_CLIENTE_PADRAO(FileName, AnoMes: string): boolean;
  end;

var
  frmParamRelTxtCCheque: TfrmParamRelTxtCCheque;

implementation

uses fPreview, fAguarde, FileCtrl, uSistema, uMensErro, uCtrlPadroes, uCtrlFuncoesRH,
  uModulo, uCtrlUsoGeralRH, dCds, RReciboPagamentoFuncef;

{$R *.DFM}

procedure TfrmParamRelTxtCCheque.FormCreate(Sender: TObject);
var
  NormalIni: TDateTime;
  c: byte;
begin
  inherited;
  ListaIdEstab := TStringList.Create;
  ListaIdMotivo := TStringList.Create;
  ListaIdFunc := TStringList.Create;
  ListaIdRubrica := TStringList.Create;

  CtrlParamRelTxtCCheque := TCtrlParamRelTxtCCheque.Create(CtrlUsoGeralRH.UsuXFilial,
    CtrlUsoGeralRH.UsuXCCusto, CtrlUsoGeralRH.IdUsuarioGeral);
  CtrlParamRelTxtCCheque.InitializeAs(Padroes);
  CtrlParamRelTxtCCheque.Progresso := Progresso;

  CtrlPessoaFilialPessoa := TCtrlPessoaFilialPessoa.Create(CtrlUsoGeralRH.UsuXFilial,
    CtrlUsoGeralRH.UsuXCCusto, CtrlUsoGeralRH.IdUsuarioGeral);
  CtrlPessoaFilialPessoa.InitializeAs(Padroes);

  CtrlPessoaFuncionario := TCtrlPessoaFuncionario.Create(CtrlUsoGeralRH.UsuXFilial,
    CtrlUsoGeralRH.UsuXCCusto, CtrlUsoGeralRH.IdUsuarioGeral);
  CtrlPessoaFuncionario.InitializeAs(Padroes);

  CtrlGlobalRH := TCtrlGlobalRH.Create;
  CtrlGlobalRH.InitializeAs(Padroes);

  CtrlMotivo := TCtrlMotivo.Create;
  CtrlMotivo.InitializeAs(Padroes);

  CtrlProvDesc := TCtrlProvDesc.Create;
  CtrlProvDesc.InitializeAs(Padroes);

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

  // Monta Lista de Tipos de Folha
  dmCds.Cds.Data := CtrlMotivo.ListMotivo_Id_e_Descricao('F');
  chklstTipoFolha.Items.Clear;
  while not(dmCds.Cds.EOF) do
  begin
    ListaIdMotivo.Add(dmCds.Cds.FieldByName('IDMOTIVO').asString);
    chklstTipoFolha.Items.Add(dmCds.Cds.FieldByName('DESCRICAO').asString);
    dmCds.Cds.Next;
  end;

  // Monta Lista de Rubricas
  chklstRubrica.Items.Clear;
  dmCds.Cds.Data := CtrlProvDesc.ListRubricaEmpresa(IntToStr(Sistema.IdEmpresa));
  while not(dmCds.Cds.EOF) do
  begin
    ListaIdRubrica.Add(dmCds.Cds.FieldByName('CODPROVDESC').asString);
    chklstRubrica.Items.Add(dmCds.Cds.FieldByName('DESCRPROVDESC').asString);
    dmCds.Cds.Next;
  end;

  rgAltura.Visible := (Modulo.IdContraCheque = CLIENTE_PADRAO);
  rgImprCab.Visible := (Modulo.IdContraCheque = CLIENTE_PADRAO);
  bbtnImagem.Visible := (Modulo.IdContraCheque = FUNCEF);
  edNomeArqFrente.Visible := (Modulo.IdContraCheque = FUNCEF);
  ToolbarSep974.Visible := not(Modulo.IdContraCheque in [REFER, CTRQ]);
  rbtnImprimir.Visible := not(Modulo.IdContraCheque in [REFER, CTRQ]);
  gbxDatas.Visible := (Modulo.IdContraCheque in [CTRQ, FCRT]);

  CdsParamRH.Data := CtrlGlobalRH.GetParamRH('NORMALINI, NORMALFIM, IDMOTIVO');
  bGravouTxtMod3 := false;
  NormalIni := CdsParamRH.FieldByName('NORMALINI').asDateTime;
  cmbMes.ItemIndex := FU.ExtraiMes(NormalIni) - 1;
  speAno.Value := FU.ExtraiAno(NormalIni);
  dtPagamento.Date := CdsParamRH.FieldByName('NORMALFIM').asDateTime;
  cmbOrderBy.ItemIndex := 0;

  LeAlteracoes;
  MontaListaFuncionarios;

  if (Sistema.IdModulo = MODFOL) then
    HelpContext := 210075
  else
    HelpContext := 4170034;
end;

procedure TfrmParamRelTxtCCheque.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  FreeAndNil(ListaIdFunc);
  FreeAndNil(ListaIdMotivo);
  FreeAndNil(ListaIdRubrica);
  FreeAndNil(ListaIdEstab);

  FreeAndNil(CtrlPessoaFilialPessoa);
  FreeAndNil(CtrlGlobalRH);
  FreeAndNil(CtrlMotivo);
  FreeAndNil(CtrlProvDesc);
  FreeAndNil(CtrlParamRelTxtCCheque);
  FreeAndNil(CtrlPessoaFuncionario);

  GravaAlteracoes;
  inherited;
end;

procedure TfrmParamRelTxtCCheque.speAnoChange(Sender: TObject);
begin
  HabilitaBtOk;
end;

procedure TfrmParamRelTxtCCheque.gbxSituacaoEnter(Sender: TObject);
begin
  bSitAtivo := cbxAtivos.Checked;
  bSitAfast := cbxAfastados.Checked;
  bSitDemit := cbxDemitidos.Checked;
end;

procedure TfrmParamRelTxtCCheque.gbxTipContraEnter(Sender: TObject);
begin
  bTipContrEfet := cbxEfetivos.Checked;
  bTipContrEspec := cbxEspeciais.Checked;
  bTipContrTemp := cbxTemporarios.Checked;
  bTipContrEst := cbxEstagiarios.Checked;
  bTipContrTerc := cbxTerceiros.Checked;
  bTipContrProp := cbxPropDirSemVinc.Checked;
  bTipContrAut := cbxAutonomos.Checked;
end;

procedure TfrmParamRelTxtCCheque.gbxSituacaoExit(Sender: TObject);
begin
  if not(cbxAtivos.Checked) and not(cbxAfastados.Checked) and not(cbxDemitidos.Checked) then
  begin
    MsgDlg('Pelo menos um Tipo de Situação deve ser selecionado.', 'Aviso',
      mtWarning, [mbOk,mbHelp], 0);
    gbxSituacao.SetFocus;
  end
  else
  if (bSitAtivo <> cbxAtivos.Checked) or (bSitAfast <> cbxAfastados.Checked) or
     (bSitDemit <> cbxDemitidos.Checked) then
    MontaListaFuncionarios;
end;

procedure TfrmParamRelTxtCCheque.gbxTipContraExit(Sender: TObject);
begin
  if not(cbxEfetivos.Checked) and not(cbxEspeciais.Checked) and
     not(cbxTemporarios.Checked) and not(cbxTerceiros.Checked) and
     not(cbxPropDirSemVinc.Checked) and not(cbxAutonomos.Checked) and
     not(cbxEstagiarios.Checked) then
  begin
    MsgDlg('Pelo menos um Tipo de Contrato deve ser selecionado.', 'Aviso',
      mtWarning, [mbOk,mbHelp], 0);
    cbxEfetivos.SetFocus;
  end
  else
  if (bTipContrEfet <> cbxEfetivos.Checked) or (bTipContrEspec <> cbxEspeciais.Checked) or
     (bTipContrTemp <> cbxTemporarios.Checked) or (bTipContrEst <> cbxEstagiarios.Checked) or
     (bTipContrTerc <> cbxTerceiros.Checked) or (bTipContrProp <> cbxPropDirSemVinc.Checked) or
     (bTipContrAut <> cbxAutonomos.Checked) then
    MontaListaFuncionarios;
end;

procedure TfrmParamRelTxtCCheque.chklstTipoFolhaClickCheck(Sender: TObject);
begin
  inherited;
  HabilitaBtOk;
end;

procedure TfrmParamRelTxtCCheque.chklstRubricaClickCheck(Sender: TObject);
begin
  inherited;
  FU.CriaListaOpcoes(chklstRubrica, ListaIdRubrica, sListaIdRubricaSel, ',', false);
  HabilitaBtOk;
end;

procedure TfrmParamRelTxtCCheque.bbtnSelTodosTipoFolhaClick(Sender: TObject);
var
  c: integer;
begin
  for c:=0 to chklstTipoFolha.Items.Count-1 do
    chklstTipoFolha.Checked[c] := true;
  chklstTipoFolhaClickCheck(Sender);
  chklstTipoFolha.Repaint;
end;

procedure TfrmParamRelTxtCCheque.bbtnInvSelTipoFolhaClick(Sender: TObject);
var
  c: integer;
begin
  for c:=0 to chklstTipoFolha.Items.Count-1 do
    chklstTipoFolha.Checked[c] := not(chklstTipoFolha.Checked[c]);
  chklstTipoFolhaClickCheck(Sender);
  chklstTipoFolha.Repaint;
end;

procedure TfrmParamRelTxtCCheque.bbtnSelTodosFuncClick(Sender: TObject);
var
  c: integer;
begin
  for c:=0 to chklstFunc.Items.Count-1 do
    chklstFunc.Checked[c] := true;
  if (Paginas.ActivePage = tbshListaFunc) then
    chklstFunc.Repaint;
end;

procedure TfrmParamRelTxtCCheque.bbtnInverteSelFuncClick(Sender: TObject);
var
  c: integer;
begin
  for c:=0 to chklstFunc.Items.Count-1 do
    chklstFunc.Checked[c] := not(chklstFunc.Checked[c]);
  if (Paginas.ActivePage = tbshListaFunc) then
    chklstFunc.Repaint;
end;

procedure TfrmParamRelTxtCCheque.bbtnSelTodosRubClick(Sender: TObject);
var
  c: integer;
begin
  for c:=0 to chklstRubrica.Items.Count-1 do
    chklstRubrica.Checked[c] := true;
  chklstRubrica.Repaint;
  FU.CriaListaOpcoes(chklstRubrica, ListaIdRubrica, sListaIdRubricaSel, ',', false);
end;

procedure TfrmParamRelTxtCCheque.bbtnInverteSelRubClick(Sender: TObject);
var
  c: integer;
begin
  for c:=0 to chklstRubrica.Items.Count-1 do
    chklstRubrica.Checked[c] := not(chklstRubrica.Checked[c]);
  chklstRubrica.Repaint;
  FU.CriaListaOpcoes(chklstRubrica, ListaIdRubrica, sListaIdRubricaSel, ',', false);
end;

procedure TfrmParamRelTxtCCheque.bbtnImagemClick(Sender: TObject);
begin
  if (opArquivo.Execute) then
    edNomeArqFrente.Text :=
      MinimizeName(opArquivo.FileName, Self.Canvas, edNomeArqFrente.Width)
  else
    edNomeArqFrente.Text := '';
end;

procedure TfrmParamRelTxtCCheque.bbtnGerarClick(Sender: TObject);
begin
  if (Modulo.IdContraCheque = FUNCEF) and (edNomeArqFrente.Text = '') then
  begin
    MsgDlg('Imagem não foi informada.', 'Aviso', mtWarning, [mbOk,mbHelp], 0);
    bbtnImagem.SetFocus;
    ModalResult := mrNone;
    exit;
  end;

  GerarQuery;
  svArquivo.InitialDir := ExtractFilePath(Application.ExeName);

  if (svArquivo.Execute) and (GerarModelo(svArquivo.FileName, AnoBarraMes)) and
     (Modulo.IdContraCheque <> FUNCEF) then
    Close;
end;

procedure TfrmParamRelTxtCCheque.rbtnImprimirClick(Sender: TObject);
var
  Rpt: TRptReciboPagamentoFuncef;
begin
  if (Modulo.IdContraCheque = FUNCEF) then
  begin
    frmAguarde.Mostra('Processando...');
    if (rgTipoImpressaoFuncef.ItemIndex = 0) then
    begin
      if (rgProcesso.ItemIndex = 0) then
        NomeTabela := 'PREVIAFOLPAG'
      else
        NomeTabela := 'HISTRUBSAL';

      // Funcionários escolhidos
      wNum := FU.CriaListaOpcoes(chklstFunc, ListaIdFunc, sListaIdFuncSel, ',', false);
      if (wNum = ListaIdFunc.Count) then
        sListaIdFuncSel := '';

      wNum := FU.CriaListaOpcoes(chklstRubrica, ListaIdRubrica, sListaIdRubricaSel, ',', false);

      bDemInformativo := (wNum > 0);

      // Rubricas para Remuneração selecionadas
      K := FU.CriaListaOpcoes(chklstTipoFolha, ListaIdMotivo, sListaIdMotivoSel, ',', false);

      if (K > 1) and (MsgDlg('Confirma Mesmo Demonstrativo para Mais de um Tipo de Pagamento?',
                             'Confirmação', mtConfirmation, [mbYes,mbNo,mbHelp], 0) <> mrYes) then
        exit;

      if (bDemInformativo) and (MsgDlg('Confirma Mesmo Demonstrativo Selecionado e Apenas Informativo?',
                             'Confirmação', mtConfirmation, [mbYes,mbNo,mbHelp], 0) <> mrYes) then
        exit;

      Rpt := TRptReciboPagamentoFuncef.Create(Application);
      Rpt.IdEmpresa := Sistema.IdEmpresa;
      Rpt.MesRef := cmbMes.ItemIndex + 1;
      Rpt.AnoRef := speAno.Value;
      Rpt.TipoPagamento := sListaIdMotivoSel;
      Rpt.Ordenacao := cmbOrderBy.ItemIndex;

      Rpt.ListaIdEstab := sListaIdEstabSel;
      Rpt.ListaIdFunc := sListaIdFuncSel;
      Rpt.TipoContrato := FU.GerarListaSitFuncSel(cbxAtivos.Checked, cbxAfastados.Checked, cbxDemitidos.Checked, true);
      Rpt.SitFunc := FU.GerarListaTipoContratoSel(cbxEfetivos.Checked, cbxEspeciais.Checked,
        cbxTemporarios.Checked, cbxTerceiros.Checked, cbxPropDirSemVinc.Checked,
        cbxAutonomos.Checked, cbxEstagiarios.Checked, true);
      Rpt.NomeTabela := NomeTabela;
      Rpt.sFigura1 := edFigura1.Text;
      Rpt.sFigura2 := edFigura2.Text;
      Rpt.sFigura3 := edFigura3.Text;

{      Rpt.CrmRptCM.IdReports := 3674;
      Rpt.CrmRptCM.IdEmpresa := Sistema.IdEmpresa;
      Rpt.CrmRptCM.OrigemCM := 1;
      Rpt.CrmRptCM.IdModulo := Sistema.IdModulo;
      Rpt.CrmRptCM.IdUsuario := Sistema.IdUsuario;
      Rpt.CrmRptCM.Print;}

      Rpt.CrmRptCMBeforePrint(Sender);
      TFrmPreview.CreateModalPreview(Application, Rpt.rpReciboPagamento,
        'Demonstrativo de Pagamento');

      FreeAndNil(Rpt);
    end
    else
    if not(bGravouTxtMod3) then
      MsgDlg('Primeiro Grave o Arquivo.', 'Aviso', mtWarning, [mbOk], 0)
    else
    begin
      MsgDlg('Busque o Aplicativo da Impressora.', 'Aviso', mtInformation, [mbOk], 0);
      if (opAplicativo.Execute) then
        ShellExecuteFile(opAplicativo.FileName, '', '', SW_SHOW);
    end;
  end
  else
  begin
    GerarQuery;
    GerarModelo('IMPRESSORA', AnoBarraMes);
  end;       
end;

// ------------------------------------------------------------------------------------------
// Funções do Form
// ------------------------------------------------------------------------------------------

// Cria lista contendo os códigos dos funcionários
procedure TfrmParamRelTxtCCheque.MontaListaFuncionarios;
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

procedure TfrmParamRelTxtCCheque.HabilitaBtOk;
var
  c: integer;
  bSel: boolean;
begin
  bSel := false;
  for c:=0 to chklstTipoFolha.Items.Count-1 do
    if (chklstTipoFolha.Checked[c]) then
    begin
      bSel := true;
      break;
    end;

  bbtnGerar.Enabled := (bSel) and (sListaIdEstabSel <> '') and (Trim(speAno.Text) <> '');
  rbtnImprimir.Enabled := bbtnGerar.Enabled;
end;

procedure TfrmParamRelTxtCCheque.Progresso(Arg: array of variant);
begin
  frmAguarde.Pos := frmAguarde.Pos + 1;
end;

procedure TfrmParamRelTxtCCheque.LeAlteracoes;
begin
  // Recupera as últimas alterações das opções
  //ArqConfig := TIniFile.Create('C:\CONFIG_FOLHAPAGTO.INI');
  ArqConfig := TIniFile.Create(Sistema.RetornaCaminhoArquivos(Sistema.IdEmpresa)+'\CONFIG_FOLHAPAGTO.INI');//Ádler Teodoro de Souza SOL 109421 KINTANA 496332
  rgAltura.ItemIndex := StrToInt(ArqConfig.ReadString('REL_TXTCCHEQUE', 'Altura', '0'));
  rgImprCab.ItemIndex := StrToInt(ArqConfig.ReadString('REL_TXTCCHEQUE', 'ImprimeCab', '0'));
  Msg  := ArqConfig.ReadString('REL_TXTCCHEQUE', 'Mensagem', '');
  Msg1 := ArqConfig.ReadString('REL_TXTCCHEQUE', 'Mensagem 1', '');
  Msg2 := ArqConfig.ReadString('REL_TXTCCHEQUE', 'Mensagem 2', '');
  // Funcef
  rgTipoImpressaoFuncef.ItemIndex := StrToInt(ArqConfig.ReadString('REL_TXTCCHEQUE', 'TipoImpressao', '0'));
  gbxFiguras.Visible := rgTipoImpressaoFuncef.ItemIndex = 0;
  edFigura1.Text := ArqConfig.ReadString('REL_TXTCCHEQUE', 'Figura1', '');
  edFigura2.Text := ArqConfig.ReadString('REL_TXTCCHEQUE', 'Figura2', '');
  edFigura3.Text := ArqConfig.ReadString('REL_TXTCCHEQUE', 'Figura3', '');
end;

procedure TfrmParamRelTxtCCheque.GravaAlteracoes;
begin
  // Grava as últimas alterações da Opção de Altura e mensagens
  ArqConfig.WriteString('REL_TXTCCHEQUE', 'Altura', IntToStr(rgAltura.ItemIndex));
  ArqConfig.WriteString('REL_TXTCCHEQUE', 'ImprimeCab', IntToStr(rgImprCab.ItemIndex));
  ArqConfig.WriteString('REL_TXTCCHEQUE', 'Mensagem', Msg);
  ArqConfig.WriteString('REL_TXTCCHEQUE', 'Mensagem 1', Msg1);
  ArqConfig.WriteString('REL_TXTCCHEQUE', 'Mensagem 2', Msg2);
  // Funcef
  ArqConfig.WriteString('REL_TXTCCHEQUE', 'TipoImpressao', IntToStr(rgTipoImpressaoFuncef.ItemIndex));
  ArqConfig.WriteString('REL_TXTCCHEQUE', 'Figura1', edFigura1.Text);
  ArqConfig.WriteString('REL_TXTCCHEQUE', 'Figura2', edFigura2.Text);
  ArqConfig.WriteString('REL_TXTCCHEQUE', 'Figura3', edFigura3.Text);
end;

procedure TfrmParamRelTxtCCheque.GerarQuery;
begin
  if (rgProcesso.ItemIndex = 0) then
    NomeTabela := 'PREVIAFOLPAG'
  else
    NomeTabela := 'HISTRUBSAL';

  AnoBarraMes := IntToStr(speAno.Value) +'/'+ FU.PoeZero(cmbMes.ItemIndex + 1);
  MesBarraAno := FU.PoeZero(cmbMes.ItemIndex + 1) +'/'+ IntToStr(speAno.Value);

  // Funcionários escolhidos
  wNum := FU.CriaListaOpcoes(chklstFunc, ListaIdFunc, sListaIdFuncSel, ',', false);
  if (wNum = ListaIdFunc.Count) then
    sListaIdFuncSel := '';

  wNum := FU.CriaListaOpcoes(chklstRubrica, ListaIdRubrica, sListaIdRubricaSel, ',', false);

  bDemInformativo := (wNum > 0);

  // Rubricas para Remuneração selecionadas
  K := FU.CriaListaOpcoes(chklstTipoFolha, ListaIdMotivo, sListaIdMotivoSel, ',', true);

  if (K > 1) and (MsgDlg('Confirma Mesmo Demonstrativo para Mais de um Tipo de Pagamento?',
                         'Confirmação', mtConfirmation, [mbYes,mbNo,mbHelp], 0) <> mrYes) then
    exit;

  if (bDemInformativo) and (MsgDlg('Confirma Mesmo Demonstrativo Selecionado e Apenas Informativo?',
                         'Confirmação', mtConfirmation, [mbYes,mbNo,mbHelp], 0) <> mrYes) then
    exit;

  if (K > 0) then
  begin
    frmAguarde.pbAguarde.Visible := false;

    CtrlParamRelTxtCCheque.InitDadosQuerysPessoas(sListaIdFuncSel, Modulo.IdContraCheque,
      Sistema.IdEmpresa, sListaIdEstabSel, AnoBarraMes, NomeTabela,
      FU.GerarListaSitFuncSel(cbxAtivos.Checked, cbxAfastados.Checked, cbxDemitidos.Checked, true),
      FU.GerarListaTipoContratoSel(cbxEfetivos.Checked, cbxEspeciais.Checked,
      cbxTemporarios.Checked, cbxTerceiros.Checked, cbxPropDirSemVinc.Checked,
      cbxAutonomos.Checked, cbxEstagiarios.Checked, true), sListaIdMotivoSel,
      cmbOrderBy.ItemIndex, bDemInformativo, sListaIdRubricaSel,
      rgImprCab.ItemIndex=0, dtPagamento.Date);

    frmAguarde.Mostra('Gerando dados...');
    frmAguarde.Update;
    CtrlParamRelTxtCCheque.CdsPessoa.Data :=
      CtrlParamRelTxtCCheque.ListPessoas(cbxAutonomos.Checked);
    //CtrlParamRelTxtCCheque.SQL.SaveToFile('c:\qry.txt');
    CtrlParamRelTxtCCheque.SQL.SaveToFile(Sistema.RetornaCaminhoArquivos(Sistema.IdEmpresa)+'\qry.txt');//Ádler Teodoro de Souza SOL 109421 KINTANA 496332
    CtrlParamRelTxtCCheque.SelecionarRubricasPessoa;

    frmAguarde.Apaga;
  end
  else
  begin
    MsgDlg('Nenhum Tipo de Pagamento foi escolhido.','Aviso', mtInformation,[mbOk,mbHelp],0);
    ModalResult := mrNone;
  end;
end;

function TfrmParamRelTxtCCheque.GerarModelo(FileName, AnoMes: string): boolean;
begin
  case (Modulo.IdContraCheque) of
    SERPROS        : Result := GerarModelo_SERPROS(FileName, AnoMes);
    REFER          : Result := GerarModelo_REFER(FileName, AnoMes);
    FUNCEF         : Result := GerarModelo_FUNCEF(FileName, AnoMes);
    FCRT           : Result := GerarModelo_FCRT(FileName, AnoMes);
    CTRQ           : Result := GerarModelo_CTRQ(FileName, AnoMes);
    CLIENTE_PADRAO : Result := GerarModelo_CLIENTE_PADRAO(FileName, AnoMes);
    else             Result := false;
  end;
end;

function TfrmParamRelTxtCCheque.GerarModelo_SERPROS(FileName,AnoMes: string): boolean;
var
  Arq: TStringList;
begin
  Result := false;
  if (InputQuery('Demonstrativo de Pagamento', 'Entre a MENSAGEM:', Msg)) then
  begin
    Arq := TStringList.Create;
    if (FileName <> 'IMPRESSORA') then
    begin
      try
        frmAguarde.Pos := 0;
        frmAguarde.Mostra('Gerando Arquivo...');
        frmAguarde.Max := CtrlParamRelTxtCCheque.CdsPessoa.RecordCount;
        frmAguarde.Min := 0;
        frmAguarde.Update;

        CtrlParamRelTxtCCheque.CdsPessoa.First;
        CtrlParamRelTxtCCheque.TotalDesc := 0;
        CtrlParamRelTxtCCheque.TotalProv := 0;
        while not(CtrlParamRelTxtCCheque.CdsPessoa.EOF) do
        begin
          Arq.Text := Arq.Text + CtrlParamRelTxtCCheque.GerarModelo_SERPROS(AnoMes, Msg);

          // Próxima Pessoa se acabaram os detalhes
          if (CtrlParamRelTxtCCheque.CdsProventos.EOF) and
             (CtrlParamRelTxtCCheque.CdsDescontos.EOF) then
          begin
            CtrlParamRelTxtCCheque.TotalDesc := 0;
            CtrlParamRelTxtCCheque.TotalProv := 0;
            frmAguarde.Pos := frmAguarde.Pos + 1;
            CtrlParamRelTxtCCheque.CdsPessoa.Next;
            CtrlParamRelTxtCCheque.SelecionarRubricasPessoa;
          end;
        end;

        Arq.SaveToFile(FileName);
        Result := true;
        frmAguarde.Apaga;
        MsgDlg('Arquivo criado com sucesso.', 'Informação', mtInformation, [mbOk, mbHelp], 0);
      except
        on E: Exception do
        begin
          frmAguarde.Apaga;
          raise Exception.Create('Erro durante a criação em ' +FileName +CR_LF+
            'Erro:' +CR_LF+CR_LF+ E.Message);
        end;
      end;
    end
    else
    if (GImp.Inicializar) then
    begin
      try
        GImp.EjetarPagina := false;
        GImp.SaltodeLinhaCondensado := false;
        GImp.TipoFonte := TfNormal;
        GImp.Condensado := true;
        GImp.Sublinhado := false;

        frmAguarde.Pos := 0;
        frmAguarde.Mostra('Imprimindo Dados...');
        frmAguarde.Max := CtrlParamRelTxtCCheque.CdsPessoa.RecordCount;
        frmAguarde.Min := 0;
        frmAguarde.Update;

        CtrlParamRelTxtCCheque.CdsPessoa.First;
        CtrlParamRelTxtCCheque.TotalDesc := 0;
        CtrlParamRelTxtCCheque.TotalProv := 0;
        while not(CtrlParamRelTxtCCheque.CdsPessoa.EOF) do
        begin
          Arq.Text := FU.ConverteCar(CtrlParamRelTxtCCheque.GerarModelo_SERPROS(AnoMes, Msg));

          Arq.SaveToFile(FileName);
          GImp.ImprimirArquivo(FileName);
          // Próxima Pessoa se acabaram os detalhes
          if (CtrlParamRelTxtCCheque.CdsProventos.EOF) and
             (CtrlParamRelTxtCCheque.CdsDescontos.EOF) then
          begin
            CtrlParamRelTxtCCheque.TotalDesc := 0;
            CtrlParamRelTxtCCheque.TotalProv := 0;
            frmAguarde.Pos := frmAguarde.Pos + 1;
            CtrlParamRelTxtCCheque.CdsPessoa.Next;
            CtrlParamRelTxtCCheque.SelecionarRubricasPessoa;
          end;
        end;

        DeleteFile(FileName);
        GImp.Finalizar;
        Result := true;
        frmAguarde.Apaga;
        MsgDlg('Dados impressos com sucesso.', 'Informação', mtInformation, [mbOk, mbHelp], 0);
      except
        on E: Exception do
        begin
          DeleteFile(FileName);
          GImp.Finalizar;
          frmAguarde.Apaga;
          raise Exception.Create('Ocorreu um Erro ao Imprimir.'+CR_LF+
            'Verifique a Impressora e tente novamente.' +CR_LF+ 'Erro:' +
            CR_LF+CR_LF+ E.Message);
        end;
      end;
    end;
    Arq.Free;
  end;
end;

function TfrmParamRelTxtCCheque.GerarModelo_REFER(FileName,AnoMes: string): boolean;
var
  Arq: TStringList;
begin
  Result := false;
  if (InputQuery('Demonstrativo de Pagamento', 'Entre a MENSAGEM:', Msg)) then
  begin
    Arq := TStringList.Create;
    try
      frmAguarde.Pos := 0;
      frmAguarde.Mostra('Gerando Arquivo...');
      frmAguarde.Max := CtrlParamRelTxtCCheque.CdsPessoa.RecordCount;
      frmAguarde.Min := 0;
      frmAguarde.Update;

      CtrlParamRelTxtCCheque.CreateThreadProgresso;
      Arq.Text := CtrlParamRelTxtCCheque.GerarModelo_REFER(AnoMes, Msg);
      CtrlParamRelTxtCCheque.FreeThreadProgresso;
      Arq.SaveToFile(FileName);
      Result := true;
      frmAguarde.Apaga;
      MsgDlg('Arquivo criado com sucesso.', 'Informação', mtInformation, [mbOk, mbHelp], 0);
    except
      on E: Exception do
      begin
        frmAguarde.Apaga;
        raise Exception.Create('Erro durante a criação em ' +FileName +CR_LF+
          'Erro:' +CR_LF+CR_LF+ E.Message);
      end;
    end;
    Arq.Free;
  end;
end;

function TfrmParamRelTxtCCheque.GerarModelo_FUNCEF(FileName,AnoMes: string): Boolean;
var
  Arq: TStringList;
  iPos: integer;
  NomeArqFrente, NomeArqVerso: string;
begin
  Result := false;
  NomeArqFrente := Trim(edNomeArqFrente.Text);
  NomeArqVerso := Trim(edNomeArqFrente.Text);

  while (true) do
  begin
    iPos := pos('\', NomeArqFrente);
    if (iPos > 0) then
      NomeArqFrente := Copy(NomeArqFrente, iPos+1, Length(NomeArqFrente) - iPos)
    else
      break;
  end;

  NomeArqFrente := '/var/spool/' +NomeArqFrente+ '_dir/'+
    NomeArqFrente + '.p00000002.tif';

  while (true) do
  begin
    iPos := pos('\', NomeArqVerso);
    if (iPos > 0) then
      NomeArqVerso := Copy(NomeArqVerso, iPos+1, Length(NomeArqVerso)-iPos)
    else
      break;
  end;
  NomeArqVerso := '/var/spool/' +NomeArqVerso+ '_dir/' +
    NomeArqVerso + '.p00000001.tif';

  if not(InputQuery('Caminho e Nome do Arquivo para a Frente',
                    'Confirme ou Altere:', NomeArqFrente)) then
    exit;

  if not(InputQuery('Caminho e Nome do Arquivo para o Verso',
                    'Confirme ou Altere:', NomeArqVerso)) then
    exit;

  Arq := TStringList.Create;
  try
    frmAguarde.Pos := 0;
    frmAguarde.Mostra('Gerando Arquivo...');
    frmAguarde.Max := CtrlParamRelTxtCCheque.CdsPessoa.RecordCount;
    frmAguarde.Min := 0;
    frmAguarde.Update;

    CtrlParamRelTxtCCheque.CreateThreadProgresso;
    Arq.Text := CtrlParamRelTxtCCheque.GerarModelo_FUNCEF(AnoBarraMes, NomeArqFrente,
      NomeArqVerso, cbxAutonomos.Checked);
    CtrlParamRelTxtCCheque.FreeThreadProgresso;
    Arq.SaveToFile(FileName);
    bGravouTxtMod3 := true;
    Result := true;
    frmAguarde.Apaga;
    MsgDlg('Arquivo criado com sucesso.', 'Informação', mtInformation, [mbOk, mbHelp], 0);
  except
    on E: Exception do
    begin
      frmAguarde.Apaga;
      raise Exception.Create('Erro durante a criação em ' +FileName +CR_LF+
        'Erro:' +CR_LF+CR_LF+ E.Message);
    end;
  end;
  Arq.Free;
end;

function TfrmParamRelTxtCCheque.GerarModelo_FCRT(FileName,AnoMes: string): boolean;
var
  Arq: TStringList;
begin
  Arq := TStringList.Create;
  Result := false;
  if (FileName <> 'IMPRESSORA') then
  begin
    try
      frmAguarde.Pos := 0;
      frmAguarde.Mostra('Gerando Arquivo...');
      frmAguarde.Max := CtrlParamRelTxtCCheque.CdsPessoa.RecordCount;
      frmAguarde.Min := 0;
      frmAguarde.Update;

      CtrlParamRelTxtCCheque.CreateThreadProgresso;
      Arq.Text := CtrlParamRelTxtCCheque.GerarModelo_FCRT(AnoMes, dtPagamento.Date);
      CtrlParamRelTxtCCheque.FreeThreadProgresso;
      Arq.SaveToFile(FileName);
      Result := true;
      frmAguarde.Apaga;
      MsgDlg('Arquivo criado com sucesso.', 'Informação', mtInformation, [mbOk, mbHelp], 0);
    except
      on E: Exception do
      begin
        frmAguarde.Apaga;
        raise Exception.Create('Erro durante a criação em ' +FileName +CR_LF+
          'Erro:' +CR_LF+CR_LF+ E.Message);
      end;
    end;
  end
  else
  if (GImp.Inicializar) then
  begin
    try
      GImp.EjetarPagina := false;
      GImp.SaltodeLinhaCondensado := false;
      GImp.TipoFonte := TfNormal;
      GImp.Condensado := true;
      GImp.Sublinhado := false;

      frmAguarde.Pos := 0;
      frmAguarde.Mostra('Imprimindo Dados...');
      frmAguarde.Max := CtrlParamRelTxtCCheque.CdsPessoa.RecordCount;
      frmAguarde.Min := 0;
      frmAguarde.Update;

      CtrlParamRelTxtCCheque.CreateThreadProgresso;
      Arq.Text := FU.ConverteCar(CtrlParamRelTxtCCheque.GerarModelo_FCRT(AnoMes, dtPagamento.Date));
      CtrlParamRelTxtCCheque.FreeThreadProgresso;
      Arq.SaveToFile(FileName);
      GImp.ImprimirArquivo(FileName);
      DeleteFile(FileName);
      GImp.Finalizar;
      Result := true;
      frmAguarde.Apaga;
      MsgDlg('Dados impressos com sucesso.', 'Informação', mtInformation, [mbOk, mbHelp], 0);
    except
      on E: Exception do
      begin
        DeleteFile(FileName);
        GImp.Finalizar;
        frmAguarde.Apaga;
        raise Exception.Create('Ocorreu um Erro ao Imprimir.'+CR_LF+
          'Verifique a Impressora e tente novamente.' +CR_LF+ 'Erro:'+ CR_LF+CR_LF+ E.Message);
      end;
    end;
  end;
  Arq.Free;
end;

function TfrmParamRelTxtCCheque.GerarModelo_CTRQ(FileName, AnoMes: string): boolean;
var
  Arq: TStringList;
  i: integer;
  bSelPeriodo: boolean;
begin
  i := ListaIdMotivo.IndexOf(CdsParamRH.FieldByName('IDMOTIVO').asString);
  bSelPeriodo := (i = -1) or (chklstTipoFolha.Checked[i]);
  Result := false;
  if (InputQuery('Demonstrativo de Pagamento', 'Entre a MENSAGEM:', Msg)) then
  begin
    Arq := TStringList.Create;
    try
      frmAguarde.Pos := 0;
      frmAguarde.Mostra('Gerando Arquivo...');
      frmAguarde.Max := CtrlParamRelTxtCCheque.CdsPessoa.RecordCount;
      frmAguarde.Min := 0;
      frmAguarde.Update;

      CtrlParamRelTxtCCheque.CreateThreadProgresso;
      Arq.Text := CtrlParamRelTxtCCheque.GerarModelo_CTRQ(AnoMes, Sistema.NomeEmpresa, Msg,
        dtPagamento.Date, bSelPeriodo);
      CtrlParamRelTxtCCheque.FreeThreadProgresso;
      Arq.SaveToFile(FileName);
      Result := true;
      frmAguarde.Apaga;
      MsgDlg('Arquivo criado com sucesso.', 'Informação', mtInformation, [mbOk, mbHelp], 0);
    except
      on E: Exception do
      begin
        frmAguarde.Apaga;
        raise Exception.Create('Erro durante a criação em ' +FileName +CR_LF+
          'Erro:' +CR_LF+CR_LF+ E.Message);
      end;
    end;
    Arq.Free;
  end;
end;

function TfrmParamRelTxtCCheque.GerarModelo_CLIENTE_PADRAO(FileName,AnoMes: string): boolean;
var
  Arq: TStringList;
begin
  Result := false;
  if not(InputQuery('Demonstrativo de Pagamento',
         'Entre com a 1a. linha da MENSAGEM (até 70 pos.)', Msg1)) then
    exit;

  if not(InputQuery('Demonstrativo de Pagamento',
         'Entre com a 2a. linha da MENSAGEM (até 70 pos.)', Msg2)) then
    exit;

  Arq := TStringList.Create;

  if (FileName <> 'IMPRESSORA') then
  begin
    try
      frmAguarde.Pos := 0;
      frmAguarde.Mostra('Gerando Arquivo...');
      frmAguarde.Max := CtrlParamRelTxtCCheque.CdsPessoa.RecordCount;
      frmAguarde.Min := 0;
      frmAguarde.Update;

      CtrlParamRelTxtCCheque.CreateThreadProgresso;
      Arq.Text := CtrlParamRelTxtCCheque.GerarModelo_CLIENTE_PADRAO(AnoMes, Msg1, Msg2,
        rgAltura.ItemIndex = 1);
      CtrlParamRelTxtCCheque.FreeThreadProgresso;
      Arq.SaveToFile(FileName);
      Result := true;
      frmAguarde.Apaga;
      MsgDlg('Arquivo criado com sucesso.', 'Informação', mtInformation, [mbOk, mbHelp], 0);
    except
      on E: Exception do
      begin
        frmAguarde.Apaga;
        raise Exception.Create('Erro durante a criação em ' +FileName +CR_LF+
          'Erro:' +CR_LF+CR_LF+ E.Message);
      end;
    end;
  end
  else
  if (GImp.Inicializar) then
  begin
    try
      GImp.EjetarPagina := false;
      GImp.SaltodeLinhaCondensado := false;
      GImp.TipoFonte := TfNormal;
      GImp.Condensado := true;
      GImp.Sublinhado := false;

      frmAguarde.Pos := 0;
      frmAguarde.Mostra('Imprimindo Dados...');
      frmAguarde.Max := CtrlParamRelTxtCCheque.CdsPessoa.RecordCount;
      frmAguarde.Min := 0;
      frmAguarde.Update;

      CtrlParamRelTxtCCheque.CreateThreadProgresso;
      Arq.Text := FU.ConverteCar(CtrlParamRelTxtCCheque.GerarModelo_CLIENTE_PADRAO(AnoMes, Msg1, Msg2,
        rgAltura.ItemIndex = 1));
      CtrlParamRelTxtCCheque.FreeThreadProgresso;
      Arq.SaveToFile(FileName);
      GImp.ImprimirArquivo(FileName);
      DeleteFile(FileName);
      GImp.Finalizar;
      Result := true;
      frmAguarde.Apaga;
      MsgDlg('Dados impressos com sucesso.', 'Informação', mtInformation, [mbOk, mbHelp], 0);
    except
      on E: Exception do
      begin
        DeleteFile(FileName);
        GImp.Finalizar;
        frmAguarde.Apaga;
        raise Exception.Create('Ocorreu um Erro ao Imprimir.'+CR_LF+
          'Verifique a Impressora e tente novamente.' +CR_LF+
          'Erro:' +CR_LF+CR_LF+ E.Message);
      end;
    end;
  end;
  Arq.Free;
end;

procedure TfrmParamRelTxtCCheque.bbtnSelTodosEstabClick(Sender: TObject);
var
  c: integer;
begin
  for c:=0 to chklstEstab.Items.Count-1 do
    chklstEstab.Checked[c] := true;
  chklstEstab.Repaint;
  MontaListaFuncionarios;
end;

procedure TfrmParamRelTxtCCheque.bbtnInverteSelEstabClick(Sender: TObject);
var
  c: integer;
begin
  for c:=0 to chklstEstab.Items.Count-1 do
    chklstEstab.Checked[c] := not(chklstEstab.Checked[c]);
  chklstEstab.Repaint;
  MontaListaFuncionarios;
end;

procedure TfrmParamRelTxtCCheque.chklstEstabClickCheck(Sender: TObject);
begin
  inherited;
  MontaListaFuncionarios;
end;

procedure TfrmParamRelTxtCCheque.rgTipoImpressaoFuncefClick(
  Sender: TObject);
begin
  inherited;
  gbxFiguras.Visible := rgTipoImpressaoFuncef.ItemIndex = 0;
end;

procedure TfrmParamRelTxtCCheque.bbtnFigura1Click(Sender: TObject);
begin
  inherited;
  if (opArquivo.Execute) then
    edFigura1.Text :=
      MinimizeName(opArquivo.FileName, Self.Canvas, edFigura1.Width)
  else
    edFigura1.Text := '';
end;

procedure TfrmParamRelTxtCCheque.bbtnFigura2Click(Sender: TObject);
begin
  inherited;
  if (opArquivo.Execute) then
    edFigura2.Text :=
      MinimizeName(opArquivo.FileName, Self.Canvas, edFigura2.Width)
  else
    edFigura2.Text := '';
end;

procedure TfrmParamRelTxtCCheque.bbtnFigura3Click(Sender: TObject);
begin
  inherited;
  if (opArquivo.Execute) then
    edFigura3.Text :=
      MinimizeName(opArquivo.FileName, Self.Canvas, edFigura3.Width)
  else
    edFigura3.Text := '';
end;

procedure TfrmParamRelTxtCCheque.FormShow(Sender: TObject);
begin
  inherited;
  if (Modulo.IdContraCheque = FUNCEF) then
  begin
    townTipoImpressaoFuncef.Top := 200;
    townTipoImpressaoFuncef.BringToFront;
    townTipoImpressaoFuncef.Visible := true;
    Self.Enabled := false;
  end;
end;

procedure TfrmParamRelTxtCCheque.btnFecharTipoCChequeClick(
  Sender: TObject);
begin
  inherited;
  Self.Enabled := true;
  townTipoImpressaoFuncef.Visible := false;
  if (rgTipoImpressaoFuncef.ItemIndex = 0) then
  begin
    bbtnGerar.Visible := False;
    edNomeArqFrente.Visible := False;
    bbtnImagem.Visible := False;
  end;
end;

end.
