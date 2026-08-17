// *****************************************************************************
// ***************************** REGISTRO DE ALTERAÇÕES ************************
// ****************************************************************
// Autor(a)    : Fernando Xavier
// Data        : 09/06/2014
// Pendência   : SOL 233634 PPM 410508
// Rotina      : bbtnConfirmarClick
// Descricao   : Erro na contabilização da folha de pagamento
//******************************************************************************
// Autor(a)    : Edilaine Ferraresi
// Data        : 17/03/2013
// Pendência   : SOL 188851 Kintana 1784371
// Rotina      : DFM, bbtnConfirmarClick
// Descricao   : ajuste para o sistema efetuar a avaliação do fornecedor
//******************************************************************************
// Autor(a)    : Thiago Melo
// Data        : 11/04/2014
// Pendência   : 230109 Kintana 347945
// Descricao   : Erro ao gerar a folha "Cannot perform this operation on a
//               closed dataset Endereço".
//-----------------------------------------------------------------------------
// Autor(a)    : Thiago Melo
// Data        : 27/02/2014
// Pendência   : SOL 226384 Kintana 2060867
// Descricao   : A parametrização está sendo desfeita quando muda-se de aba de
//               parametros
//-----------------------------------------------------------------------------
// Autor(a)    : Fábio H B Sampaio
// Data        : 03/12/2013
// Pendência   : SOL 221835 / KTN 2054506
// Descricao   : Implementação para evitar o preparo dos filtros quando a aba
//               de "Seleção de Rubricas e Empregados" estive oculta.
//-----------------------------------------------------------------------------
// Autor(a)    : Felipe A. Santos
// Data        : 25/10/2013
// Pendência   : SOL 218135/15336 kintana 2049538
// Descricao   : Somente enviei para homologação refenrete ao sol 218135
//-----------------------------------------------------------------------------
// Autor(a)    : Fábio H B Sampaio
// Data        : 22/10/2013
// Pendência   : SOL 218135 kintana 2049538
// Descricao   : Implementação para que o filtro das rubricas não impacte na
//               contabilização.
//-----------------------------------------------------------------------------
// Autor(a)    : Felipe A. Santos
// Data        : 29/08/2013
// Pendência   : SOL 218272 KTN 2049247
// Descricao   : correção na lista de rubricas selecionadas
//------------------------------------------------------------------------------
// Autor(a)    : Felipe A. Santos
// Data        : 15/08/2013
// Pendência   : SOL 188078 kintana 1772223
// Descricao   : A obrigatoriedade do tipo de deembolso foi retirado e caso
//               nenhum for selecionado, o sistema irá buscar os mesmos que estão
//               parametrizados para as rubricas selecionadas.
//------------------------------------------------------------------------------
// Autor(a)    : Edilaine Ferraresi
// Data        : 15/08/2013
// Pendência   : SOL 188078 kintana 1772223
// Descricao   : Melhora de performance.
//------------------------------------------------------------------------------
// Autor(a)    : Monica Gonzaga
// Data        : 28/01/2013
// Pendência   : SOL 188078 kintana 1772223
// Descricao   : Inclusao da Aba Seleção de Rubricas e Empregados.
//------------------------------------------------------------------------------
// Autor(a)    : Marcos Luiz de Jesus
// Data        : 22/06/2010
// Pendência   : SOL 134026 KINTANA 837334
// Descricao   : Forçar para aparecer na planilha apenas as rubricas que estão
//               marcadas na lista de TIPO DE FOLHA
//------------------------------------------------------------------------------
// *****************************************************************************
// Autor(a)    :  Ádler Teodoro de Souza
// Data        :  19/02/2009
// Pendência   : SOL 109421 KINTANA 496332
// Descricao   :  Alteração de gravação de arquivos de log na raiz do disco C: .
//------------------------------------------------------------------------------
unit fParamContabFolha;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs, IvDictio, IvMulti,
  IvEMulti, MAHlpBtn, StdCtrls, Buttons, TB97Tlbr, TB97, ExtCtrls, checklst, Spin, wwdblook,
  Db, Wwdatsrc, DBTables, ComCtrls, Gauges, wwdbdatetimepicker, CMDateTimePicker, fcLabel,
  fSairAjuda, DBClient, uCMClientDataSet, uCtrlPeriodo, uCtrlPessoaFilialPessoa, uCtrlMotivo,
  uCtrlListTerceirosRH, uCtrlGlobalRH, uCtrlParamContabFolha, fProgresso_GeraCalc,
  ColorCheckListBox, IniFiles, uCtrlProvDesc, Wwquery,
  uCtrlAvaliacaoFornec, FJustificativa, fCadForne;   //Edilaine - SOL 188851 Kintana 1784371


type
  TfrmParamContabFolha = class(TfrmSairAjuda)
    pnlSelecao: TPanel;
    pnlResult: TPanel;
    memResult: TMemo;
    bbtnVoltar: TBitBtn;
    bbtnConfirmar: TBitBtn;
    ToolbarSep971: TToolbarSep97;
    CdsEstab: TCMClientDataSet;
    CdsTipoOper: TCMClientDataSet;
    CdsTipoDoc: TCMClientDataSet;
    CdsTipoDes: TCMClientDataSet;
    svdlgResult: TOpenDialog;
    bbtnSalvar: TBitBtn;
    bbtnVerResultado: TBitBtn;
    ToolbarSep972: TToolbarSep97;
    gbxMesAnoRef: TGroupBox;
    cmbMes: TComboBox;
    speAno: TSpinEdit;
    rgProcesso: TRadioGroup;
    gbxEstabelecimento: TGroupBox;
    dblckEstab: TwwDBLookupCombo;
    chkCancelProcRubIncompleta: TCheckBox;
    lblCancelProcRubIncompleta: TLabel;
    gbxMotivo: TGroupBox;
    chklstTipoFolha: TColorCheckListBox;
    spbtSelTodos: TBitBtn;
    spbtInvSelecao: TBitBtn;
    pgctrlPrincipal: TPageControl;
    tbshContab: TTabSheet;
    rgConsolida: TRadioGroup;
    gbxTipoPag: TGroupBox;
    dblckTipOper: TwwDBLookupCombo;
    tbshCAP: TTabSheet;
    Bevel1: TBevel;
    Label11: TLabel;
    Label1: TLabel;
    dtPagamento: TCMDateTimePicker;
    dblckTipoDoc: TwwDBLookupCombo;
    chkRateioCC: TCheckBox;
    GroupBox1: TGroupBox;
    chkTipoDes: TColorCheckListBox;
    bbtnSelTipo: TBitBtn;
    bbtnInvTipo: TBitBtn;
    chkConsTipoDesemb: TCheckBox;
    rgMantemCCusto: TRadioGroup;
    tbshSEL: TTabSheet;
    lbl1: TLabel;
    lbl2: TLabel;
    chklstRubrica: TColorCheckListBox;
    chklstFunc: TColorCheckListBox;
    grpTipContr: TGroupBox;
    cbxEfetivos: TCheckBox;
    cbxTemporarios: TCheckBox;
    cbxEstagiarios: TCheckBox;
    cbxTerceiros: TCheckBox;
    cbxAutonomos: TCheckBox;
    cbxPropDirSemVinc: TCheckBox;
    cbxEspeciais: TCheckBox;
    btnSelTudo: TBitBtn;
    btnInverte: TBitBtn;
    btnSelPessoa: TBitBtn;
    btnInvPessoa: TBitBtn;
    edtSelEmpregados: TEdit;
    btnSelEmpregados: TBitBtn;
    CdsRubrica: TCMClientDataSet;
    Label2: TLabel;
    CdsEmpregados: TCMClientDataSet;
    CdsEmpregadosAux: TCMClientDataSet;
    CdsRubricaAux: TCMClientDataSet;
    CdsAux: TCMClientDataSet;
    Cds: TCMClientDataSet;
    cdsAvaliaFornec: TCMClientDataSet;

    procedure FormCreate(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure spbtInvSelecaoClick(Sender: TObject);
    procedure spbtSelTodosClick(Sender: TObject);
    procedure bbtnVoltarClick(Sender: TObject);
    procedure bbtnConfirmarClick(Sender: TObject);
    procedure bbtnSelTipoClick(Sender: TObject);
    procedure bbtnInvTipoClick(Sender: TObject);
    procedure bbtnSalvarClick(Sender: TObject);
    procedure bbtnVerResultadoClick(Sender: TObject);
    procedure lblCancelProcRubIncompletaClick(Sender: TObject);
    procedure chklstRubricaClickCheck(Sender: TObject);
    procedure chklstRubricaDrawItem(Control: TWinControl; Index: Integer;
      Rect: TRect; State: TOwnerDrawState);
    procedure chklstRubricaKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure btnSelTudoClick(Sender: TObject);
    procedure btnInverteClick(Sender: TObject);
    procedure grpTipContrExit(Sender: TObject);

    procedure btnSelEmpregadosClick(Sender: TObject);
    procedure btnSelPessoaClick(Sender: TObject);
    procedure btnInvPessoaClick(Sender: TObject);
    procedure edtSelEmpregadosKeyPress(Sender: TObject; var Key: Char);
    procedure cmbMesChange(Sender: TObject);
    procedure speAnoChange(Sender: TObject);
    procedure rgProcessoClick(Sender: TObject);
    procedure dblckEstabChange(Sender: TObject);
    procedure chklstTipoFolhaClickCheck(Sender: TObject);
    procedure chkTipoDesClickCheck(Sender: TObject);
    procedure FiltraEmpregados(Sender: TObject);
    procedure dblckTipoDocExit(Sender: TObject);
    procedure dblckTipOperExit(Sender: TObject);
    procedure dblckTipOperCloseUp(Sender: TObject; LookupTable,
      FillTable: TDataSet; modified: Boolean);
    procedure dblckTipoDocCloseUp(Sender: TObject; LookupTable,
      FillTable: TDataSet; modified: Boolean); // Felipe A. Santos SOL 188078 kintana 1772223
  private
    CtrlParamContabFolha: TCtrlParamContabFolha;
    CtrlPessoaFilialPessoa: TCtrlPessoaFilialPessoa;
    CtrlListTerceirosRH: TCtrlListTerceirosRH;
    CtrlMotivo: TCtrlMotivo;
    CtrlGlobalRH: TCtrlGlobalRH;
    CtrlPeriodo: TCtrlPeriodo;
    CtrlProvDesc: TCtrlProvDesc;
    CtrAvaliacaoFornecedor : TCtrlAvaliacaoFornec;   //Edilaine - SOL 188851 Kintana 1784371

    ArqConfig: TIniFile;
    TelaProgresso: TfrmProgresso_GeraCalc;
    ListaIdTipoFolha, ListaTipoDesemb,
    ListaMatEmpregado: TStringList;   //Monica Gonzaga SOL 188078 kintana 1772223
    ListaIdEmpregado: TStringList;    //Monica Gonzaga SOL 188078 kintana 1772223
    ListaIdRubrica: String;           //Monica Gonzaga SOL 188078 kintana 1772223
    ListaIdFunc: String;              //Monica Gonzaga SOL 188078 kintana 1772223
    strListaIdTipoFolha: String;      //Monica Gonzaga SOL 188078 kintana 1772223
    sDadosIntegra : TRetornoIntegra;  //Monica Gonzaga SOL 188078 kintana 1772223
    ListaIdRubricaSel : TStringList;  //Felipe Azevedo dos Santos SOL 188078 kintana 1772223

    FOldListaIdIntegraResult: TRetornoIntegra; // FHBS - SOL 221835 / KTN 2054506
    FOldListaIdIntegraPMes: String; // FHBS - SOL 221835 / KTN 2054506
    FOldListaIdIntegraPAno: Integer; // FHBS - SOL 221835 / KTN 2054506
    FOldListaIdIntegraPIdEstab: Integer; // FHBS - SOL 221835 / KTN 2054506
    FOldListaIdIntegraPListaIdTipoFolha: String; // FHBS - SOL 221835 / KTN 2054506
    FOldListaIdIntegraPPrevia: Boolean; // FHBS - SOL 221835 / KTN 2054506
    FOldListaIdIntegraPsListaCODTIPRECDES: String; // FHBS - SOL 221835 / KTN 2054506

    IdPatro, IdPlanoPrev: integer;
    bFazCAP, bFazContab: boolean;

    QryEmpregados: TwwQuery;

    function  VerificaOpcoesOk: boolean;
    procedure Progresso(Args: array of variant);
    procedure CriarListaTipoDesemb;
    procedure CriarListaTipoFolha;
    procedure HabilitarBtResult(Visivel: boolean);
    procedure LeAlteracoes;
    procedure GravaAlteracoes;
    //Inicio - Monica Gonzaga  SOL 188078 kintana 1772223
    procedure FiltraDadosIntegracao;    // Edilaine -  SOL 188078 / KTN 1772223
    procedure CriarListaRubricas;
    procedure CriarListaEmpregados;
    procedure ListRubrica; //Monica
    procedure ListaFolha;   //Monica
    //fim - Monica Gonzaga SOL 188078 kintana 1772223

    // Felipe A. Santos SOL 188078 kintana 1772223
    function TipoDesembEstaSel : boolean;
    function ListaTipoDesembXRub : string;
    // Felipe A. Santos SOL 188078 kintana 1772223 - fim

    procedure FazerAvaliacaoFornecedor(iIdForCli, qtdAvalMes : integer);  //Edilaine - SOL 188851 Kintana 1784371
    procedure CriaFormCadFornecedor(iIdForCli: integer);      //Edilaine - SOL 188851 Kintana 1784371

    procedure HabilitaSelRubricaEmpregado; // FHBS - SOL 218135 / KTN 2049538 - Inicio

  end;

var
  frmParamContabFolha: TfrmParamContabFolha;

implementation

uses uSistema, uMensErro, dCds, uCtrlPadroes, uCtrlParamIntegra, uCtrlFuncoesRH,
  uCtrlUsoGeralRH;

{$R *.DFM}

procedure TfrmParamContabFolha.FormCreate(Sender: TObject);
var
  NormalIni: TDate;
begin
  inherited;
  CtrlParamContabFolha := TCtrlParamContabFolha.Create(CtrlUsoGeralRH.UsuXFilial,
    CtrlUsoGeralRH.UsuXCCusto, CtrlUsoGeralRH.IdUsuarioGeral);
  CtrlParamContabFolha.InitializeAs(Padroes);
  CtrlParamContabFolha.Progresso := Progresso;

  CtrlPessoaFilialPessoa := TCtrlPessoaFilialPessoa.Create(CtrlUsoGeralRH.UsuXFilial,
    CtrlUsoGeralRH.UsuXCCusto, CtrlUsoGeralRH.IdUsuarioGeral);
  CtrlPessoaFilialPessoa.InitializeAs(Padroes);

  CtrlListTerceirosRH := TCtrlListTerceirosRH.Create(CtrlUsoGeralRH.UsuXFilial,
    CtrlUsoGeralRH.UsuXCCusto, CtrlUsoGeralRH.IdUsuarioGeral);
  CtrlListTerceirosRH.InitializeAs(Padroes);

  CtrlMotivo := TCtrlMotivo.Create;
  CtrlMotivo.InitializeAs(Padroes);

  CtrlGlobalRH := TCtrlGlobalRH.Create;
  CtrlGlobalRH.InitializeAs(Padroes);

  CtrlPeriodo := TCtrlPeriodo.Create;
  CtrlPeriodo.InitializeAs(Padroes);

  CtrAvaliacaoFornecedor := TCtrlAvaliacaoFornec.Create;     //Edilaine - SOL 188851 Kintana 1784371
  CtrAvaliacaoFornecedor.InitializeAS( Padroes );            //Edilaine - SOL 188851 Kintana 1784371

  //inicio - Monica Gonzaga SOL 188078 kintana 1772223
  CtrlProvDesc := TCtrlProvDesc.Create;
  CtrlProvDesc.InitializeAs(Padroes);
  //fim - Monica Gonzaga SOL 188078 kintana 1772223

  ListaIdTipoFolha := TStringList.Create;
  ListaTipoDesemb := TStringList.Create;

  ListaIdEmpregado  := TStringList.Create;  //Monica Gonzaga SOL 188078 kintana 1772223
  ListaMatEmpregado := TStringList.Create;  //Monica Gonzaga SOL 188078 kintana 1772223
  ListaIdRubricaSel := TStringList.Create;  //Felipe A. Santos SOL 188078 kintana 1772223

  TelaProgresso := TfrmProgresso_GeraCalc.Create(Self);

  CdsEstab.Data := CtrlPessoaFilialPessoa.ListPessoaEstab(IntToStr(Sistema.IdEmpresa));
  CdsTipoOper.Data := CtrlListTerceirosRH.ListTipoOperacao;
  CdsTipoDoc.Data := CtrlListTerceirosRH.ListTipoDocRecPag('P');

  CriarListaTipoFolha;
  CriarListaTipoDesemb;

  if (Sistema.UsaPlanoPatro) then
  begin
    IdPatro := CtrlListTerceirosRH.GetIdPatro(Sistema.IdEmpresa);
    IdPlanoPrev := CtrlListTerceirosRH.GetIdPlanoPrev(Sistema.IdEmpresa);
  end
  else
  begin
    IdPatro := -1;
    IdPlanoPrev := -1;
  end;

  chkConsTipoDesemb.Hint :=
    'Faz o agrupamento dos Lançamentos de todos os' +CR_LF+
    'Tipos de Desembolso no mesmo Documento para cada Favorecido';

  ParamIntegra.GetParams(Sistema.IdEmpresa, 0, 'INTEGRACONTAB', 'PARAMCAP', tiCAP);
  NormalIni := CtrlGlobalRH.GetNormalIni;
  cmbMes.ItemIndex := FU.ExtraiMes(NormalIni) - 1;
  speAno.Text := IntToStr(FU.ExtraiAno(NormalIni));
  pgctrlPrincipal.ActivePageIndex := 0;
  HabilitarBtResult(false);
  bbtnConfirmar.Enabled := true;
  LeAlteracoes;

  //Monica Gonzaga SOL 188078 kintana 1772223
  dblckEstab.LookupValue := CdsEstab.FieldByName('IDPESSOA').AsString;
  ListaFolha;
  FOldListaIdIntegraResult.sIdPessoa := ''; // FHBS - SOL 221835 / KTN 2054506
  FOldListaIdIntegraResult.sIdRubrica := ''; // FHBS - SOL 221835 / KTN 2054506
  FiltraDadosIntegracao;  // Edilaine -  SOL 188078 / KTN 1772223
//  CriarListaEmpregados;
//  CriarListaRubricas;
  //Monica Gonzaga SOL 188078 kintana 1772223 - fim

  svdlgResult.InitialDir := Sistema.RetornaCaminhoArquivos(Sistema.IdEmpresa);
  //Ádler Teodoro de Souza SOL 109421 KINTANA 496332

  // FHBS - SOL 218135 / KTN 2049538 - Inicio
  HabilitaSelRubricaEmpregado;
end;

procedure TfrmParamContabFolha.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  FreeAndNil(ListaIdTipoFolha);
  FreeAndNil(ListaTipoDesemb);
  FreeAndNil(ListaIdEmpregado); //Monica Gonzaga SOL 188078 kintana 1772223
  FreeAndNil(ListaMatEmpregado); //Monica Gonzaga SOL 188078 kintana 1772223
  FreeAndNil(ListaIdRubricaSel); //Felipe A. Santos SOL 188078 kintana 1772223
  FreeAndNil(QryEmpregados);
  FreeAndNil(TelaProgresso);

  FreeAndNil(CtrAvaliacaoFornecedor);   //Edilaine - SOL 188851 Kintana 1784371
  
  FreeAndNil(CtrlPessoaFilialPessoa);
  FreeAndNil(CtrlListTerceirosRH);
  FreeAndNil(CtrlMotivo);
  FreeAndNil(CtrlGlobalRH);
  FreeAndNil(CtrlPeriodo);
  FreeAndNil(CtrlParamContabFolha);

  GravaAlteracoes;
  inherited;
end;

procedure TfrmParamContabFolha.lblCancelProcRubIncompletaClick(Sender: TObject);
begin
  chkCancelProcRubIncompleta.Checked := not(chkCancelProcRubIncompleta.Checked);
end;

procedure TfrmParamContabFolha.spbtSelTodosClick(Sender: TObject);
var
  c: integer;
begin
  for c:=0 to chklstTipoFolha.Items.Count-1 do
    chklstTipoFolha.Checked[c] := true;
  chklstTipoFolha.Repaint;
  ListaFolha;
  FiltraDadosIntegracao;
//  CriarListaEmpregados; //Monica - SOL 188078 kintana 1772223
//  CriarListaRubricas;   //Monica - SOL 188078 kintana 1772223
end;

procedure TfrmParamContabFolha.spbtInvSelecaoClick(Sender: TObject);
var
  c: integer;
begin
  for c:=0 to chklstTipoFolha.Items.Count-1 do
    chklstTipoFolha.Checked[c] := not(chklstTipoFolha.Checked[c]);
  chklstTipoFolha.Repaint;
  ListaFolha;
  FiltraDadosIntegracao;
//  CriarListaEmpregados;  //Monica - SOL 188078 kintana 1772223
//  CriarListaRubricas;  //Monica - SOL 188078 kintana 1772223
end;

procedure TfrmParamContabFolha.bbtnSelTipoClick(Sender: TObject);
var
  c: integer;
begin
  for c:=0 to chkTipoDes.Items.Count-1 do
    chkTipoDes.Checked[c] := true;
  chkTipoDes.Repaint;
  FiltraDadosIntegracao;
//  CriarListaEmpregados; // Fábio Sampaio SOL 188078 kintana 1772223
//  CriarListaRubricas; // Fábio Sampaio SOL 188078 kintana 1772223
end;

procedure TfrmParamContabFolha.bbtnInvTipoClick(Sender: TObject);
var
  c: integer;
begin
  for c:=0 to chkTipoDes.Items.Count-1 do
    chkTipoDes.Checked[c] := not(chkTipoDes.Checked[c]);
  chkTipoDes.Repaint;
  FiltraDadosIntegracao;
//  CriarListaEmpregados; // Fábio Sampaio SOL 188078 kintana 1772223
//  CriarListaRubricas; // Fábio Sampaio SOL 188078 kintana 1772223
end;

procedure TfrmParamContabFolha.bbtnVoltarClick(Sender: TObject);
begin
  pnlResult.SendToBack;
  HabilitarBtResult(true);
end;

procedure TfrmParamContabFolha.bbtnVerResultadoClick(Sender: TObject);
begin
  pnlSelecao.SendToBack;
  HabilitarBtResult(false);
end;

procedure TfrmParamContabFolha.bbtnSalvarClick(Sender: TObject);
begin
  if (svdlgResult.Execute) then
    memResult.Lines.SaveToFile(svdlgResult.FileName);
end;

procedure TfrmParamContabFolha.bbtnConfirmarClick(Sender: TObject);
var
  wNum: word;
  bOk: boolean;
  bSelTipoDesembolso : boolean; // Felipe Azevedo dos Santos SOL 188078 kintana 1772223
  sTituloGeracao, sListaTipoDesembSel, sListaIdTipoFolhaSel: string;
begin
  bFazCAP := (Trim(dblckTipoDoc.Text) <> '');
  bFazContab := (Trim(dblckTipOper.Text) <> '');

  if not(VerificaOpcoesOk) then
    exit;

  // Felipe A. Santos SOL 188078 kintana 1772223
  bSelTipoDesembolso := TipoDesembEstaSel;

  if not(bSelTipoDesembolso) then
     sListaTipoDesembSel := ListaTipoDesembXRub;
  // Felipe A. Santos SOL 188078 kintana 1772223

  memResult.Lines.Clear;
  // Inicialização da Barra de Processo
  if (bFazContab) then
    sTituloGeracao := sTituloGeracao + 'Contabilização';
  if (bFazCAP) then
    sTituloGeracao := sTituloGeracao + FU.IFF(sTituloGeracao='','',' e ') + 'Contas a Pagar';
  TelaProgresso.Titulo := 'Gerando ' +sTituloGeracao;

  Self.Enabled := false;
  TelaProgresso.HoraIni := Time;
  TelaProgresso.QtdeFunc := -1;
  TelaProgresso.TempoDecorr := '00:00:00';
  TelaProgresso.Progresso := 0;
  TelaProgresso.Processo := 'Processando informações. Aguarde...';
  TelaProgresso.Pessoa := '';
  TelaProgresso.Mostrar;

  // Tipos de Folha selecionados
  wNum := FU.CriaListaOpcoes(chklstTipoFolha, ListaIdTipoFolha, sListaIdTipoFolhaSel, ',', false);
  //Marcos Luiz de Jesus   SOL 134026 KINTANA 837334 - Inicio
  //  if (wNum = ListaIdTipoFolha.Count) then
  //    sListaIdTipoFolhaSel := '';
  //Marcos Luiz de Jesus   SOL 134026 KINTANA 837334 - Fim

  // Tipos de Desembolso
  if (bSelTipoDesembolso) then // Felipe A. Santos SOL 188078 kintana 1772223
     FU.CriaListaOpcoes(chkTipoDes, ListaTipoDesemb, sListaTipoDesembSel, ',', false);

  // funcionários
  ListaIdFunc := '';
  FU.CriaListaOpcoes(chklstFunc, ListaIdEmpregado, ListaIdFunc, ',', false);

  // FHBS - SOL 218135 / KTN 2049538 - Inicio
  // Foi implementado a validaçaõ abaixo pois a rotina não sera processada
  // para ambos os processoas ao mesmo tempo, ou seja, ou FazCAP ou FazContab.
  // Quando for processar a Contabilização, deverá ser feito para todas as rubricas e empregrados
  if bFazContab then
  begin
    ListaIdRubrica := '';
    ListaIdFunc    := '';
  end;
  // FHBS - SOL 218135 / KTN 2049538 - Fim

  CtrlParamContabFolha.MessageInfo := '';    // Monica Gonzaga SOL 188078 kintana 1772223


  //Edilaine - SOL 188851 Kintana 1784371
  if (bFazCAP) then  // SOL 233634 PPM 410508 descomentado.
  begin
    cdsAvaliaFornec.Data := CtrlParamContabFolha.GetListaFornecedores(fu.ExtraiMes(dtPagamento.Date), // cmbMes.ItemIndex+1,
                                                                      fu.ExtraiAno(dtPagamento.Date), // speAno.Value,
                                                                      CdsEstab.FieldByName('IDPESSOA').asInteger,
                                                                      sListaIdTipoFolhaSel,
                                                                      sListaTipoDesembSel,
                                                                      rgProcesso.ItemIndex=0);
    while not cdsAvaliaFornec.eof do
    begin
      FazerAvaliacaoFornecedor(cdsAvaliaFornec.FieldByName('IDFAVORECIDO').AsInteger,
                               cdsAvaliaFornec.FieldByName('QTDAVAL').AsInteger);
      cdsAvaliaFornec.next;
    end;
  end;
  //Edilaine - SOL 188851 Kintana 1784371 - fim


  CtrlParamContabFolha.CreateThreadProgresso;
  bOk := CtrlParamContabFolha.GerarIntegracao(bFazCAP, bFazContab, rgConsolida.ItemIndex=0,
    cmbMes.ItemIndex+1, speAno.Value, Date, dtPagamento.Date, Sistema.IdEmpresa,
    Sistema.IdModulo, Sistema.IdUsuario, CdsEstab.FieldByName('IDPESSOA').asFloat,
    sListaIdTipoFolhaSel, sListaTipoDesembSel, CdsTipoOper.FieldByName('TIPCODIGO').asString,
    ListaIdRubrica,ListaIdFunc,
    rgProcesso.ItemIndex=0, chkCancelProcRubIncompleta.Checked, chkRateioCC.Checked,
    ParamIntegra.ObrigaAbc, ParamIntegra.ObrigaCrespon, ParamIntegra.PlanoPrevGlobal,
    ParamIntegra.PatroGlobal, StrToIntDef(dblckTipoDoc.LookupValue, -1),
    Sistema.UsaPlanoPatro, IdPatro, IdPlanoPrev, chkConsTipoDesemb.Checked,
    rgMantemCCusto.ItemIndex = 0 );
  CtrlParamContabFolha.FreeThreadProgresso;

  FiltraDadosIntegracao; // FHBS - SOL 218135 / KTN 2049538

  Self.Enabled := true;

  if (bOk) then
    MsgDlg(CtrlParamContabFolha.MessageInfo, 'Aviso', mtInformation, [mbOk,mbHelp], 0)
  else
    MsgDlg(CtrlParamContabFolha.MessageInfo, 'Erro', mtError, [mbOk,mbHelp], 0);

  TelaProgresso.Hide;
  HabilitarBtResult(false);
  pnlSelecao.SendToBack;
end;

function TfrmParamContabFolha.VerificaOpcoesOk: boolean;
var
  c,count : integer;
  DataRef: string;
  bListaEmpregados: boolean;
begin
  Result := false;
   // INICIO - Monica Gonzaga - SOL 188078 kintana 1772223

   //Cria a Lista de Rubrica que foram selecionadas;,
    ListRubrica;

    CdsEmpregadosAux.Data := CdsEmpregados.Data;
    if (not CdsEmpregadosAux.IsEmpty) then begin // Thiago Melo SOL 230109 Kintana 347945
      CdsEmpregadosAux.EmptyDataSet;
    end; // Thiago Melo SOL 230109 Kintana 347945

  //Obrigatorio selecionar um empregado.
   bListaEmpregados := false;
   if not CdsEmpregados.IsEmpty then
   begin
          for count:=0 to chklstFunc.Items.Count-1 do
          begin
            if chklstFunc.Checked[count] then
               begin
                 bListaEmpregados := true;
                 break;
                 end;
            end;

          if not bListaEmpregados then
          begin
              MsgDlg('Pelo menos um Empregado deve ser selecionado.',
                'Aviso', mtInformation, [mbOk,mbHelp], 0);
              Abort;
          end;
{
          else
          begin


           //while not(QryEmpregados.EOF) do
            ListaIdFunc := '';
             for count := 0 to chklstFunc.Items.Count - 1  do
             begin
                 if chklstFunc.Checked[count] then
                 begin
                   CdsEmpregados.Filtered := False;
                   CdsEmpregados.Filter := 'NOME = ' + QuotedStr(chklstFunc.Items[count]);
                   CdsEmpregados.Filtered := True;

                   if not CdsEmpregados.IsEmpty then begin
                     CdsEmpregadosAux.Insert;
                     CdsEmpregadosAux.FieldByName('IDPESSOA').asString :=  CdsEmpregados.FieldByName('IDPESSOA').asString;
                     CdsEmpregadosAux.FieldByName('NOME').asString :=  CdsEmpregados.FieldByName('IDPESSOA').asString;
                     CdsEmpregadosAux.Post;

                     ListaIdFunc := ListaIdFunc + QuotedStr(CdsEmpregadosAux.FieldByName('IDPESSOA').asString) + ',';
                   end;
                 end;
             end;
             CdsEmpregados.Filtered := False;
             ListaIdFunc := Copy(ListaIdFunc,1, Length(ListaIdFunc) -1);

          end;
          }

   end;
   //FIM - Monica Gonzaga - SOL 188078 kintana 1772223

  if (Trim(dblckTipOper.Text) = '') and (Trim(dblckTipoDoc.Text) = '') then
  begin
    MsgDlg('Tipo de Documento e Tipo de Operação não foram preenchidos.'+CR_LF+
           'Sem a indicação destes, este processo não pode ser executado.',
           'Aviso', mtWarning, [mbOk,mbHelp], 0);
    pgctrlPrincipal.ActivePage := tbshContab;
    dblckTipOper.SetFocus;
    exit;
  end;

  // FHBS - SOL 218135 / KTN 2049538 - Inicio
  if (Trim(dblckTipOper.Text) <> '') and (Trim(dblckTipoDoc.Text) <> '') then
  begin
    MsgDlg('Não é possível a execução da Contabilização e Geração de AP ao mesmo tempo.',
           'Aviso', mtWarning, [mbOk,mbHelp], 0);
    pgctrlPrincipal.SetFocus;
    exit;
  end;
  // FHBS - SOL 218135 / KTN 2049538 - Fim

  // FHBS - SOL 218135 / KTN 2049538
//  if (Trim(dblckTipOper.Text) = '') then
//  begin
//
//    if (MsgDlg('Tipo de Operação não preenchido.' +CR_LF+
//               'Contabilização não será processada.' +CR_LF+CR_LF+ 'Confirmar?', 'Confirmação',
//               mtConfirmation, [mbYes,mbNo,mbHelp], 0) = mrNo) then
//    begin
//      pgctrlPrincipal.ActivePage := tbshContab;
//      dblckTipOper.SetFocus;
//      exit;
//    end;
//  end;

  // FHBS - SOL 218135 / KTN 2049538
//  if (Trim(dblckTipoDoc.Text) = '') then
//  begin
//    if (MsgDlg('Tipo de Documento não preenchido.' +CR_LF+
//               'Contas a Pagar não será processada.' +CR_LF+CR_LF+
//               'Confirmar?', 'Confirmação',
//               mtConfirmation, [mbYes,mbNo,mbHelp], 0) = mrNo) then
//    begin
//      pgctrlPrincipal.ActivePage := tbshCAP;
//      dblckTipoDoc.SetFocus;
//      exit;
//    end;
//  end;

  // Felipe A. Santos inicio comentario SOL 188078 kintana 1772223

  {if (bFazCAP) then
  begin
    bSelTipoDesemb := false;
    for c:=0 to chkTipoDes.Items.Count-1 do
      if (chkTipoDes.Checked[c]) then
      begin
        bSelTipoDesemb := true;
        break;
      end;

    if not(bSelTipoDesemb) then
    begin
      MsgDlg('Selecione pelo menos um Tipo de Desembolso.',
             'Aviso', mtInformation, [mbOk,mbHelp], 0);
      pgctrlPrincipal.ActivePage := tbshCAP;
      exit;
    end;
  end;}

  // Felipe A. Santos fim comentario SOL 188078 kintana 1772223

  if (bFazContab) then
  begin
    DataRef := IntToStr(FU.TrazUltDiaMes(cmbMes.ItemIndex+1, speAno.Value)) +'/'+
      FU.PoeZero(cmbMes.ItemIndex+1) + '/' + speAno.Text;
    if not(CtrlPeriodo.RetornaPeriodoExercicioData(Sistema.IdEmpresa, DataRef)) then
    begin
      MsgDlg('Não existe Período Contábil aberto para a Referência selecionada.',
             'Aviso', mtInformation, [mbOk,mbHelp], 0);
      cmbMes.SetFocus;
      exit;
    end;
  end;

  if (rgProcesso.ItemIndex = 0) then
  begin
    if (MsgDlg('Você tem certeza de que vai executar a partir da Prévia?', 'Confirmação',
               mtConfirmation, [mbYes,mbNo,mbHelp], 0) = mrNo) then
      exit;

    if (MsgDlg('Esta é a última oportunidade de não executar a partir da Prévia.' +CR_LF+
               'Confirma assim mesmo?', 'Confirmação',
               mtConfirmation, [mbYes,mbNo,mbHelp], 0) = mrNo) then
      exit;
  end;

  Result := true;
end;

procedure TfrmParamContabFolha.Progresso(Args: array of variant);
var
  iNumArgs: integer;
begin
  iNumArgs := High(Args);
  if (iNumArgs >= 0) then
    if (Args[0] <> '') then
      TelaProgresso.Processo := Args[0];

  if (iNumArgs >= 1) then
    if (Args[1] <> '') then
      TelaProgresso.TempoDecorr := Args[1];

  if (iNumArgs >= 2) then
    if (Args[2] > 0) then
      TelaProgresso.MaxProgresso := Args[2];

  if (iNumArgs >= 3) then
    if (Args[3] > 0) then
      TelaProgresso.Progresso := Args[3];

  if (iNumArgs >= 4) then
    if (Args[4] <> '') then
      memResult.Lines.Add(Args[4]);

  Self.Update;
  TelaProgresso.Mostrar;
end;

procedure TfrmParamContabFolha.CriarListaTipoFolha;
begin
  strListaIdTipoFolha := '';
  Cds.Data := CtrlMotivo.ListMotivo_Id_e_Descricao('F,D');

  while not(Cds.EOF) do
  begin
    chklstTipoFolha.Items.Add(Cds.FieldByName('DESCRICAO').asString);
    //chklstTipoFolha.Checked[chklstTipoFolha.Items.Count-1] := true; // Edilaine -  SOL 188078 / KTN 1772223
    ListaIdTipoFolha.Add(Cds.FieldByName('IDMOTIVO').asString);
    strListaIdTipoFolha := strListaIdTipoFolha + Cds.FieldByName('IDMOTIVO').asString + ',';
    Cds.Next;
  end;
   strListaIdTipoFolha := Copy(strListaIdTipoFolha,1, Length(strListaIdTipoFolha) -1);

  //CriarListaEmpregados;   //Monica - SOL 188078 kintana 1772223
  //CriarListaRubricas;   //Monica - SOL 188078 kintana 1772223
end;

procedure TfrmParamContabFolha.CriarListaTipoDesemb;
begin
  dmCds.Cds.Data := CtrlListTerceirosRH.ListTipoCentroRepons(Sistema.IdEmpresa,IntToStr(Sistema.IdUsuario) ,'1');//CtrlListTerceirosRH.ListTipoDocRecebDesembXContabFolha(Sistema.IdEmpresa);
  while not(dmCds.Cds.EOF) do
  begin
    chkTipoDes.Items.Add(dmCds.Cds.FieldByName('DESCRICAO').asString);
    ListaTipoDesemb.Add(dmCds.Cds.FieldByName('CODTIPRECDES').asString);
    dmCds.Cds.Next;
  end;
end;

procedure TfrmParamContabFolha.HabilitarBtResult(Visivel: boolean);
begin
  bbtnVerResultado.Visible := Visivel;
  ToolbarSep972.Visible := Visivel;
  bbtnConfirmar.Enabled := Visivel;
end;

procedure TfrmParamContabFolha.LeAlteracoes;
var
  sIdResp: string;
begin
  // Recupera as últimas alterações das opções
  //ArqConfig := TIniFile.Create('C:\CONFIG_FOLHAPAGTO.INI');
  ArqConfig := TIniFile.Create(Sistema.RetornaCaminhoArquivos(Sistema.IdEmpresa)+'\CONFIG_FOLHAPAGTO.INI');//Ádler Teodoro de Souza SOL 109421 KINTANA 496332

  rgConsolida.ItemIndex := StrToInt(ArqConfig.ReadString('CONTAB_FOLHA', 'Consolida', '0'));
  rgMantemCCusto.ItemIndex := StrToInt(ArqConfig.ReadString('CONTAB_FOLHA', 'MantemCC', '1'));
end;

procedure TfrmParamContabFolha.GravaAlteracoes;
var
  sGravaPadrao: string;
begin
  // Grava as últimas alterações
  ArqConfig.WriteString('CONTAB_FOLHA', 'Consolida', IntToStr(rgConsolida.ItemIndex));
  ArqConfig.WriteString('CONTAB_FOLHA', 'MantemCC', IntToStr(rgMantemCCusto.ItemIndex));

end;
// Inicio - Monica Gonzaga SOL 188078 kintana 1772223
procedure TfrmParamContabFolha.CriarListaRubricas;
var
  mes, sIdRubrica: String;
  sListaTipoDesembSel: string;
begin
  { mes := FU.PoeZero(cmbMes.ItemIndex+1);

   FU.CriaListaOpcoes(chkTipoDes, ListaTipoDesemb, sListaTipoDesembSel, ',', False);

   sIdRubrica := CtrlParamContabFolha.ListaIdIntegra('H.IdRubrica',mes, speAno.Value,
                                                     CdsEstab.FieldByName('IDPESSOA').AsInteger,
                                                     Sistema.IdModulo,
                                                     strListaIdTipoFolha,
                                                     rgProcesso.ItemIndex=0,
                                                     sListaTipoDesembSel);
    }

  CdsRubrica.Data := CtrlProvDesc.ListRubricaEmpresa(IntToStr(Sistema.IdEmpresa),-1,'',-1, sDadosIntegra.sIdRubrica);

  chklstRubrica.Items.Clear;

  CdsRubrica.First;
  while not(CdsRubrica.EOF) do
  begin
    chklstRubrica.Items.Add(CdsRubrica.FieldByName('DESCRPROVDESC').asString);
    chklstRubrica.Checked[chklstRubrica.Items.Count-1] := true;
    CdsRubrica.Next;
  end;
  CdsRubrica.First;
end;


procedure TfrmParamContabFolha.chklstRubricaClickCheck(Sender: TObject);
begin
     FU.InvalidateItemListBox(TCustomListBox(Sender), TCustomListBox(Sender).ItemIndex);
end;

procedure TfrmParamContabFolha.chklstRubricaDrawItem(Control: TWinControl;
  Index: Integer; Rect: TRect; State: TOwnerDrawState);
begin
  with (TColorCheckListBox(Control).Canvas) do
  begin
    if (TColorCheckListBox(Control).Checked[Index]) then
      if (odSelected in State) then
      begin
        Brush.Color := clTeal;
        Font.Color := clWhite;
      end
      else
      begin
        Brush.Color := CL_AMARELO_CLARO;
        Font.Color := clBlack;
      end;

    FillRect(Rect);
    TextOut(Rect.Left, Rect.Top, TColorCheckListBox(Control).Items[Index]);
  end;

end;

procedure TfrmParamContabFolha.chklstRubricaKeyDown(Sender: TObject;
  var Key: Word; Shift: TShiftState);
begin
  if (Key = VK_TAB) then
    chklstRubricaClickCheck(Sender);

end;

procedure TfrmParamContabFolha.btnSelTudoClick(Sender: TObject);
var
  c: integer;
begin
  for c:=0 to chklstRubrica.Items.Count-1 do
    chklstRubrica.Checked[c] := true;
  chklstRubrica.Repaint;
end;

procedure TfrmParamContabFolha.btnInverteClick(Sender: TObject);
var
  c: integer;
begin
  for c:=0 to chklstRubrica.Items.Count-1 do
    chklstRubrica.Checked[c] := not(chklstRubrica.Checked[c]);
  chklstRubrica.Repaint;
end;

procedure TfrmParamContabFolha.grpTipContrExit(Sender: TObject);
begin
  if not(cbxEfetivos.Checked) and not(cbxEspeciais.Checked) and
     not(cbxTemporarios.Checked) and not(cbxTerceiros.Checked) and
     not(cbxPropDirSemVinc.Checked) and not(cbxAutonomos.Checked) and
     not(cbxEstagiarios.Checked) then
  begin
    MsgDlg('Pelo menos um Tipo de Contrato deve ser selecionado.', 'Aviso',
      mtInformation, [mbOk,mbHelp], 0);
    cbxEfetivos.SetFocus;
  end;
  //  CriarListaEmpregados;  //Monica - SOL 188078 kintana 1772223
end;


// Edilaine -  SOL 188078 / KTN 1772223
procedure TfrmParamContabFolha.FiltraDadosIntegracao;
var
  sListaTipoDesembSel, mes: string;
begin
  FU.CriaListaOpcoes(chkTipoDes, ListaTipoDesemb, sListaTipoDesembSel, ',', False);
  mes := FU.PoeZero(cmbMes.ItemIndex+1);

  // Inicio - FHBS - SOL 221835 / KTN 2054506
  HabilitaSelRubricaEmpregado;

  if (tbshSEL.TabVisible) and
     ((FOldListaIdIntegraPMes <> Mes) or
      (FOldListaIdIntegraPAno <> speAno.Value) or
      (FOldListaIdIntegraPIdEstab <> CdsEstab.FieldByName('IDPESSOA').AsInteger) or
      (FOldListaIdIntegraPListaIdTipoFolha <> strListaIdTipoFolha) or
//      (FOldListaIdIntegraPPrevia <> (rgProcesso.ItemIndex=0)) or // Thiago Melo SOL 226384 Kintana 2060867
      (FOldListaIdIntegraPsListaCODTIPRECDES <> sListaTipoDesembSel)
     ) then
  begin
    sDadosIntegra := CtrlParamContabFolha.ListaIdIntegra('H.IdPessoa', Mes, speAno.Value,
                                                         CdsEstab.FieldByName('IDPESSOA').AsInteger,
                                                         Sistema.idmodulo,
                                                         strListaIdTipoFolha,
                                                         rgProcesso.ItemIndex=0,
                                                         sListaTipoDesembSel);
    FOldListaIdIntegraResult := sDadosIntegra;
    FOldListaIdIntegraPMes := Mes;
    FOldListaIdIntegraPAno := speAno.Value;
    FOldListaIdIntegraPIdEstab := CdsEstab.FieldByName('IDPESSOA').AsInteger;
    FOldListaIdIntegraPListaIdTipoFolha := strListaIdTipoFolha;
    FOldListaIdIntegraPPrevia := (rgProcesso.ItemIndex=0);
    FOldListaIdIntegraPsListaCODTIPRECDES := sListaTipoDesembSel;
    // Thiago Melo SOL 226384 Kintana 2060867
    CriarListaEmpregados;
    CriarListaRubricas;
    // Thiago Melo SOL 226384 Kintana 2060867    
  end;

  sDadosIntegra.sIdPessoa  := FOldListaIdIntegraResult.sIdPessoa;
  sDadosIntegra.sIdRubrica := FOldListaIdIntegraResult.sIdRubrica;
  // Fim - FHBS - SOL 221835 / KTN 2054506

//  Thiago Melo SOL 226384 Kintana 2060867
//  CriarListaEmpregados;
//  CriarListaRubricas;
//  Thiago Melo SOL 226384 Kintana 2060867
end;
// Edilaine -  SOL 188078 / KTN 1772223


procedure TfrmParamContabFolha.CriarListaEmpregados;
var
  Result, mes: String;
  sIdPessoa: String;
  //sListaTipoDesembSel: string;
  sListaTipoContr : string;  // edilaine SOL 188078 kintana 1772223
begin
  // edilaine SOL 188078 kintana 1772223
  sListaTipoContr := FU.GerarListaTipoContratoSel(cbxEfetivos.Checked,
     cbxEspeciais.Checked, cbxTemporarios.Checked, cbxTerceiros.Checked,
     cbxPropDirSemVinc.Checked, cbxAutonomos.Checked, cbxEstagiarios.Checked, true);

  if sListaTipoContr = '' then
  begin
     chklstFunc.Items.Clear; // Felipe A. Santos SOL 188078 kintana 1772223
     Exit;
  end;

  {
  FU.CriaListaOpcoes(chkTipoDes, ListaTipoDesemb, sListaTipoDesembSel, ',', False);

  mes := FU.PoeZero(cmbMes.ItemIndex+1);
  //Carregamento dos Empregados
  sIdPessoa := CtrlParamContabFolha.ListaIdIntegra('H.IdPessoa', Mes, speAno.Value,
                                                   CdsEstab.FieldByName('IDPESSOA').AsInteger,
                                                   Sistema.idmodulo,
                                                   strListaIdTipoFolha,
                                                   rgProcesso.ItemIndex=0,
                                                   sListaTipoDesembSel);
  }

  CdsEmpregados.Data := CtrlParamContabFolha.ListaEmpregados(sListaTipoContr, sDadosIntegra.sIdPessoa);

  ListaIdEmpregado.Clear;
  ListaMatEmpregado.Clear;
  chklstFunc.Items.Clear;
  if not CdsEmpregados.IsEmpty then
  begin
    CdsEmpregados.First;
    while not(CdsEmpregados.EOF) do
    begin
      chklstFunc.Items.Add(CdsEmpregados.FieldByName('NOME').asString);
      chklstFunc.Checked[chklstFunc.Items.Count-1] := true;
      ListaMatEmpregado.Add(CdsEmpregados.FieldByName('MATRICULA').asString);
      ListaIdEmpregado.Add(CdsEmpregados.FieldByName('IDPESSOA').asString);
      CdsEmpregados.Next;
    end;
    CdsEmpregados.First;
  end
end;

procedure TfrmParamContabFolha.btnSelEmpregadosClick(Sender: TObject);
var slLista: TStringList;
  x, i, achou: Integer;
  sLin, sIni, sFim, sVal: String;
  bIni, bFim: Boolean;
  sMatErro: String;


  function StrCount(SubStr, S: String): Integer;
  begin
    Result := 0;
    while Pos(SubStr, S) > 0 do
    begin
      Delete(S, Pos(SubStr, S), 1);
      Result := Result + 1;
    end;

  end;

begin
  inherited;

  if Trim(edtSelEmpregados.Text) <> '' then
  begin
    slLista := TStringList.Create;
    try



      sVal := StringReplace(edtSelEmpregados.Text,';', #13#10, [rfReplaceAll]);
      slLista.Text := StringReplace(sVal,'-', #13#10, [rfReplaceAll]);

      // Fazendo a validação dos dados
      //7.4. - Qualquer informação no novo campo texto, diferente de NNN e NNN;NNN;NNN;...
      //       e NNN-NNN e A e A;A;A;A;... e A-A o sistema vai emitir uma mensagem de erro
      //       informando que o formato do campo foi digitado errado pelo usuário
      for x := 0 to slLista.Count-1 do
      begin
        sLin := slLista[x];

        if (Trim(sLin) <> '') then
        begin

          case StrCount('-', sLin) of
            0: begin
                 sIni := sLin;
                 sFim := sLin;
               end;
            1: begin
                 sIni := Copy(sLin, 1, Pos('-', sLin)-1);
                 Delete(sLin, 1, Pos('-', sLin));
                 sFim := sLin;
               end;
          else
            MessageDlg('Formato do campo inválido.', mtError, [mbOK, mbHelp], 0);
            Exit;
          end;

          // Validando dados em branco
          if (Trim(sIni) = '') or (Trim(sFim) = '') then
          begin
            MessageDlg('Formato do campo inválido.', mtError, [mbOK, mbHelp], 0);
            Exit;
          end;

          // Validando dados não numéricos com mais de um caracter: A e A;A;A;A;... e A-A
          if (( (Length(sIni) > 1) and not(sIni[2] in ['0'..'9']) ) or
              ( (Length(sFim) > 1) and not(sFim[2] in ['0'..'9']) ) ) then
          begin
            MessageDlg('Formato do campo inválido.', mtError, [mbOK, mbHelp], 0);
            Exit;
          end;

          // Validando dados numéricos: NNN e NNN;NNN;NNN;... e NNN-NNN
          if (( (sIni[1] in ['0'..'9']) and (StrToIntDef(sIni, -1) = -1) ) or
              ( (sFim[1] in ['0'..'9']) and (StrToIntDef(sFim, -1) = -1) ) ) then
          begin
            MessageDlg('Formato do campo inválido.', mtError, [mbOK, mbHelp], 0);
            Exit;
          end;

        end;
      end;

      sMatErro := '';

      // Selecionando....
      for x := 0 to slLista.Count-1 do
      begin
        sLin := AnsiUpperCase(slLista[x]);

        if StrCount('-', sLin) > 0 then
        begin
          sIni := Copy(sLin, 1, Pos('-', sLin)-1);
          Delete(sLin, 1, Pos('-', sLin));
          sFim := sLin;
        end
        else
        begin
          sIni := sLin;
          sFim := sLin;
        end;

        if (sIni[1] in ['0'..'9']) then
        begin
          bIni := False;
          bFim := (StrToIntDef(sIni,0) = StrToIntDef(sFim,0));  // se for igual só vai validar se existe o sIni

          for i := 0 to chklstFunc.Items.Count-1 do
            if ( (StrToIntDef(ListaMatEmpregado[i],-1) >= StrToIntDef(sIni,0) ) and
                 (StrToIntDef(ListaMatEmpregado[i],-1) <= StrToIntDef(sFim,0) ) ) then
            begin
              if not(bIni) and (StrToIntDef(ListaMatEmpregado[i],-1) = StrToIntDef(sIni,0)) then bIni := True;
              if not(bFim) and (StrToIntDef(ListaMatEmpregado[i],-1) = StrToIntDef(sFim,0)) then bFim := True;
              chklstFunc.Checked[i] := True;
            end;

          if not(bIni) then
            sMatErro := sMatErro + ', ' + sIni;

          if not(bFim) then
            sMatErro := sMatErro + ', ' + sFim;
        end
        else
        begin
          achou := 1;
          for i := 0 to chklstFunc.Items.Count-1 do
            if ( (Copy(ListaMatEmpregado[i], 1, Length(sIni)) >= sIni) and
                 (Copy(ListaMatEmpregado[i], 1, Length(sFim)) <= sFim) ) then
            Begin
              chklstFunc.Checked[i] := True;
              achou := 2;
            End;
        end;

      end;

      if achou = 1 then
      begin
        sMatErro := sMatErro + ', ' + sIni;
        if  sIni <> sFim then
        sMatErro := sMatErro + ', ' + sFim;
      end;

      if Trim(sMatErro) <> '' then
      begin
        Delete(sMatErro, 1, 2);
        MsgDlg('Matrícula(s) '+sMatErro+' não existe(m)', 'Aviso', mtInformation, [mbOk,mbHelp], 0);
      end;

    finally
      FreeAndNil(slLista);
      chklstFunc.Repaint;
    end;
  end;
end;


procedure TfrmParamContabFolha.btnSelPessoaClick(Sender: TObject);
 var  c: integer;
begin
  for c:=0 to chklstFunc.Items.Count-1 do
    chklstFunc.Checked[c] := true;
  chklstFunc.Repaint;

end;

procedure TfrmParamContabFolha.btnInvPessoaClick(Sender: TObject);
var  c: integer;
begin
  for c:=0 to chklstFunc.Items.Count-1 do
    chklstFunc.Checked[c] := not(chklstFunc.Checked[c]);
  chklstFunc.Repaint;
end;

procedure TfrmParamContabFolha.edtSelEmpregadosKeyPress(Sender: TObject;
  var Key: Char);
begin
   if not(key in ['0'..'9', #8]) and (Key <> 'E')  and (Key <> 'e')
   and (Key <> 'C') and (Key <> 'c')  and (Key <> ';') and (Key <> '-') and (Key <> 'BACKSPACE]')  then
        key:=#0;


end;

procedure TfrmParamContabFolha.cmbMesChange(Sender: TObject);
begin
  FiltraDadosIntegracao;
end;

procedure TfrmParamContabFolha.speAnoChange(Sender: TObject);
begin
  FiltraDadosIntegracao;
end;

procedure TfrmParamContabFolha.rgProcessoClick(Sender: TObject);
begin
  FiltraDadosIntegracao;
end;

procedure TfrmParamContabFolha.dblckEstabChange(Sender: TObject);
begin
  FiltraDadosIntegracao;
end;

procedure TfrmParamContabFolha.chklstTipoFolhaClickCheck(Sender: TObject);
begin
  ListaFolha;
  FiltraDadosIntegracao;
//  CriarListaEmpregados;
//  CriarListaRubricas;
end;

procedure TfrmParamContabFolha.ListRubrica;
var
  count: integer;
begin
  //Seleção das Rubricas
  CdsRubricaAux.Data := CdsRubrica.Data;
  if (not CdsRubricaAux.IsEmpty) then begin // Thiago Melo SOL 230109 Kintana 347945
    CdsRubricaAux.EmptyDataSet;
  end; // Thiago Melo SOL 230109 Kintana 347945

  ListaIdRubrica := '';
  ListaIdRubricaSel.Clear; // Felipe A. Santos SOL 218272 KTN 2049247
  for count := 0 to chklstRubrica.Items.Count - 1  do
   begin
     if chklstRubrica.Checked[count] then
     begin
       CdsRubrica.Filtered := False;
       CdsRubrica.Filter := 'DESCRPROVDESC = ' + QuotedStr(chklstRubrica.Items[count]);
       CdsRubrica.Filtered := True;

       if not CdsRubrica.IsEmpty then begin
         CdsRubricaAux.Insert;
         CdsRubricaAux.FieldByName('DESCRPROVDESC').asString := CdsRubrica.FieldByName('DESCRPROVDESC').asString ;
         CdsRubricaAux.FieldByName('IDPROVENTO').asString := CdsRubrica.FieldByName('IDPROVENTO').asString;
         CdsRubricaAux.Post;

         ListaIdRubrica := ListaIdRubrica + QuotedStr(CdsRubricaAux.FieldByName('IDPROVENTO').asString) + ',';
         ListaIdRubricaSel.Add(CdsRubricaAux.FieldByName('IDPROVENTO').asString); // Felipe A. Santos SOL 188078 kintana 1772223
       end;
     end;
   end;
   CdsRubrica.Filtered := False;
   ListaIdRubrica := Copy(ListaIdRubrica,1, Length(ListaIdRubrica) -1);
end;


procedure TfrmParamContabFolha.ListaFolha;
var
  count: integer;
begin
  strListaIdTipoFolha := '';
  FU.CriaListaOpcoes(chklstTipoFolha, ListaIdTipoFolha, strListaIdTipoFolha, ',', false);

{
   //Seleção das Tipo de Folha
   CdsAux.Data := Cds.Data;
   CdsAux.EmptyDataSet;

      strListaIdTipoFolha  := '';
      for count := 0 to chklstTipoFolha.Items.Count - 1  do
       begin
         if chklstTipoFolha.Checked[count] then
         begin
           Cds.Filtered := False;
           Cds.Filter := 'DESCRICAO = ' + QuotedStr(chklstTipoFolha.Items[count]);
           Cds.Filtered := True;

           if not dmCds.Cds.IsEmpty then begin
             CdsAux.Insert;
             CdsAux.FieldByName('DESCRICAO').asString := Cds.FieldByName('DESCRICAO').asString ;
             CdsAux.FieldByName('IDMOTIVO').asString := Cds.FieldByName('IDMOTIVO').asString;
             CdsAux.Post;

             strListaIdTipoFolha := strListaIdTipoFolha + QuotedStr(CdsAux.FieldByName('IDMOTIVO').asString) + ',';
           end;
         end;
       end;
        Cds.Filtered := False;
       strListaIdTipoFolha := Copy(strListaIdTipoFolha,1, Length(strListaIdTipoFolha) -1);

       CriarListaEmpregados; //Monica - SOL 188078 kintana 1772223
       CriarListaRubricas;    //Monica - SOL 188078 kintana 1772223
}
end;
// FIM - Monica Gonzaga SOL 188078 kintana 1772223

procedure TfrmParamContabFolha.chkTipoDesClickCheck(Sender: TObject);
begin
  inherited;
  FiltraDadosIntegracao;
//  CriarListaEmpregados; // Fábio Sampaio SOL 188078 kintana 1772223
//  CriarListaRubricas; // Fábio Sampaio SOL 188078 kintana 1772223
end;

// Felipe Azevedo dos Santos SOL 188078 kintana 1772223

function TfrmParamContabFolha.TipoDesembEstaSel: boolean;
var
   c : integer;
   bSelTipoDesembolso : boolean;
begin
     bSelTipoDesembolso := False;

     for c := 0 to chkTipoDes.Items.Count - 1 do
     begin
          if (chkTipoDes.Checked[c]) then
          begin
               bSelTipoDesembolso := True;
               Break;
          end;
     end;

     result := bSelTipoDesembolso;
end;

function TfrmParamContabFolha.ListaTipoDesembXRub: string;
var
   i : integer;
   sListaDesembXRub, sCodTipRecDes : string;
   ListaDesembXRub : TStringList;
begin
   try
     sListaDesembXRub := '';
     ListaDesembXRub := TStringList.Create;

     for i := 0 to ListaIdRubricaSel.Count -1 do
     begin
       CdsTipoDes.Data := CtrlParamContabFolha.ListaTipoDesembolsoXRubrica(ListaIdRubricaSel.Strings[i]);
       CdsTipoDes.First;
       while not(CdsTipoDes.Eof) do
       begin
          sCodTipRecDes := CdsTipoDes.FieldByName('CODTIPRECDES').AsString;
          if (ListaDesembXRub.IndexOf(sCodTipRecDes) = - 1) then
              ListaDesembXRub.Add(sCodTipRecDes);
          CdsTipoDes.Next;
       end;
     end;

     for i := 0 to ListaDesembXRub.Count -1 do
        sListaDesembXRub := sListaDesembXRub + ListaDesembXRub.Strings[i] + ',';

     Result := Copy(sListaDesembXRub, 0, Length(sListaDesembXRub) -1);
   finally
     FreeAndNil(ListaDesembXRub);
   end;
end;

procedure TfrmParamContabFolha.FiltraEmpregados(Sender: TObject);
begin
  inherited;
  CriarListaEmpregados;
end;
// Felipe Azevedo dos Santos SOL 188078 kintana 1772223 - fim

procedure TfrmParamContabFolha.HabilitaSelRubricaEmpregado;
begin
  // FHBS - SOL 218135 / KTN 2049538 - Inicio
  tbshSEL.TabVisible := (Trim(dblckTipOper.Text) = '') and (Trim(dblckTipoDoc.Text) <> '');
end;

procedure TfrmParamContabFolha.dblckTipoDocExit(Sender: TObject);
begin
  inherited;
  // FHBS - SOL 218135 / KTN 2049538 - Inicio
  HabilitaSelRubricaEmpregado;
  FiltraDadosIntegracao; // FHBS - SOL 221835 / KTN 2054506
end;

procedure TfrmParamContabFolha.dblckTipOperExit(Sender: TObject);
begin
  inherited;
  // FHBS - SOL 218135 / KTN 2049538 - Inicio
  HabilitaSelRubricaEmpregado;
end;

procedure TfrmParamContabFolha.dblckTipOperCloseUp(Sender: TObject;
  LookupTable, FillTable: TDataSet; modified: Boolean);
begin
  inherited;
  // FHBS - SOL 218135 / KTN 2049538 - Inicio
  HabilitaSelRubricaEmpregado;
end;

procedure TfrmParamContabFolha.dblckTipoDocCloseUp(Sender: TObject;
  LookupTable, FillTable: TDataSet; modified: Boolean);
begin
  inherited;
  // FHBS - SOL 218135 / KTN 2049538 - Inicio
  HabilitaSelRubricaEmpregado;
end;


procedure TfrmParamContabFolha.FazerAvaliacaoFornecedor(iIdForCli, qtdAvalMes : integer);
begin

//   if not CtrAvaliacaoFornecedor.TrazMesAtual(iIDFORCLI, Date) then
   if qtdAvalMes = 0 then
   begin
     Application.MessageBox('Para a criação da AP é necessário realizar a avaliação do fornecedor', Pchar(ExtractFileName(Application.Title)), MB_ICONINFORMATION);
     CriaFormCadFornecedor(iIDFORCLI);
   end else
   begin
     if MsgDlg('Deseja avaliar o Fornecedor?', 'Confirmação', mtConfirmation, [mbYes,mbNo],0) = mrYes then
       CriaFormCadFornecedor(iIDFORCLI)
     else
     begin
      Application.CreateForm(TfrmJustificativa, frmJustificativa);
      frmJustificativa.pIdPessoa:= iIDFORCLI;
      frmJustificativa.ShowModal;
      frmJustificativa.Release;
     end;
   end;

end;


procedure TfrmParamContabFolha.CriaFormCadFornecedor(iIdForCli: integer);
var
  frmCadForneAvalia: TfrmCadForne;
begin
  try
    Application.CreateForm(TFrmCadForne, frmCadForneAvalia);
    if frmCadForneAvalia.FormStyle <> fsNormal then
    begin
      frmCadForneAvalia.FormStyle := fsNormal;
      frmCadForneAvalia.Visible := False;
    end;

    frmCadForneAvalia.nConsModulo := 5;
    frmCadForneAvalia.nIdPessoa   := iIdForCli;
    frmCadForneAvalia.DtEmissao   := Date;
    frmCadForneAvalia.WindowState := wsMaximized;

    frmCadForneAvalia.ShowModal;
  finally
    frmCadForneAvalia.Release;
    Self.WindowState := wsNormal;
    Self.Refresh;
  end;
end;


end.

