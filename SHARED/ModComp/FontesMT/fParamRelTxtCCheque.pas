{-------------------------------------------------------------------------------
----------------------------- REGISTRO DE ALTERAÇÕES ---------------------------
--------------------------------------------------------------------------------

 Pendência....: 128495
 Data.........: 26/08/2022
 Responsável..: Everson Cunha
 Descrição....: Ajuste nos campos TipoContrato e SitFunc
--------------------------------------------------------------------------------
Nº SOL....: 191668
Nº KINTANA: 1820235
Data da Alteração: 25/11/2014
Alteração: MontaListaRubricas
Responsável: Edilaine
Descrição:  Trocar o tipo de cadastro de radio group para grid na aba
            "Incidência de Eventos" do cadastro de rubricas salariais
--------------------------------------------------------------------------------
Rotina.........: *.dfm, ckbIntervaloClick, FormCreate
N. Sol..........: 217186-15443
N. Kintana......: 2053651
Data............: 08/08/2014
Responsável.....: Edilaine Ferraresi
Descrição.......: impressão do contra-cheque para mais de um mês
--------------------------------------------------------------------------------
Nº SOL......: 170594
Nº KINTANA..: 1521425
Data........: 06/07/2012
Responsável.: Douglas.Siqueira
Descrição...: Descrição...: Relatório Recibo/Aviso de Férias
--------------------------------------------------------------------------------
Rotina......: -
Nº SOL......: 134951/135037
Nº KINTANA..: 800471/801484
Data........: 26/11/2010
Responsável.: Thaise Amaral Martins
Descrição...: Criação de uma nova opção: Débito em Conta e Excesso de Débito,
              para o relatório ser impresso diante da escolha de um dos dois
              contendo informações somente das rubricas com Excesso de Débito
              ou Débito em Conta.
--------------------------------------------------------------------------------
Rotina.........: TfrmParamRelTxtCCheque.rbtnImprimirClick
N. Sol..........: 127620
N. Kintana......: 678087
Data............: 01/03/2010
Responsável.....: Arnaldo V. Scarin
Descrição.......: Correção da rotina de impressão, vinculando novamente os
                  conselheiros à folha de pagamento mensal.
--------------------------------------------------------------------------------
Rotina........: TfrmParamRelTxtCCheque.rbtnImprimirClick
N. Sol..........: 123490
N. Kintana......: 618054
Data............: 03/09/2009
Responsável.....: Marilza Colpani
Descrição.......: Validações e chamada para exibir o novo relatório de Cedidos.
--------------------------------------------------------------------------------
Rotina........: TfrmParamRelTxtCCheque.rbtnImprimirClick
N. Sol..........: 37978
N. Kintana......: 524455
Data............: 13/08/2009
Responsável.....: Marilza Colpani
Descrição.......: Validações e chamada para exibir o relatório de Conselheiros.
--------------------------------------------------------------------------------
// Autor(a)    :  Ádler Teodoro de Souza
// Data        :  16/03/2009
// Pendência   : SOL 109421 KINTANA 496332
// Descricao   :  Alteração de gravação de arquivos de log na raiz do disco C: .
--------------------------------------------------------------------------------
// Autor(a)    :  Henrique Massão
// Data        :  20/10/2009
// Pendência   : SOL 124276 KINTANA 629634
// Descricao   :  Alteração nos captions dos tipos de contratos.
--------------------------------------------------------------------------------}

unit fParamRelTxtCCheque;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs, MAHlpBtn,
  StdCtrls, Buttons, TB97Tlbr, TB97, ExtCtrls, Db, DBTables, wwdblook, Spin, checklst,
  IvDictio, IvMulti, IvEMulti, uGImp, ExtDlgs, ComCtrls, fSairAjuda, Wwdatsrc, IniFiles,
  DBClient, uCMClientDataSet, uCMFileUtils, uCtrlPessoaFilialPessoa, uCtrlPessoaFuncionario,
  uCtrlMotivo, uCtrlGlobalRH, uCtrlProvDesc, uCtrlParamRelTxtCCheque,
  wwdbdatetimepicker, CMDateTimePicker, ColorCheckListBox, TB97Tlwn,
  Wwquery,uCmControlObject;

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
    bbtnImagem: TBitBtn;
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
    CdsParamRH: TCMClientDataSet;//SOL170594 DOUGLAS.SIQUEIRA
    qryAux: TwwQuery;
    pnlOpcoes: TPanel;
    cbkDbc: TCheckBox;
    cbkDbcExcesso: TCheckBox;
    cbkDbcferias: TCheckBox;
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
    tbshEstabelecimento: TTabSheet;
    chklstEstab: TColorCheckListBox;
    bbtnSelTodosEstab: TBitBtn;
    bbtnInverteSelEstab: TBitBtn;
    gbxOrdImpress: TGroupBox;
    cmbOrderBy: TComboBox;
    edNomeArqFrente: TEdit;
    pnlAltura: TPanel;
    rgImprCab: TRadioGroup;
    rgAltura: TRadioGroup;
    pnlPeriodo: TPanel;
    gbxMesAnoRef: TGroupBox;
    lblMesIni: TLabel;
    lblMesFim: TLabel;
    cmbMes: TComboBox;
    speAno: TSpinEdit;
    ckbIntervalo: TCheckBox;
    cmbMesF: TComboBox;
    speAnoF: TSpinEdit;
    gbxDatas: TGroupBox;
    dtPagamento: TCMDateTimePicker;
    rgProcesso: TRadioGroup;
    edtSelEmpregados: TEdit;
    btnSelEmpregados: TBitBtn;
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
    procedure cbxAutonomosClick(Sender: TObject);
    procedure ValidaAutonomos(Sender: TObject);
    procedure cbkDbcClick(Sender: TObject);
    procedure cbkDbcExcessoClick(Sender: TObject);
    procedure cbkDbcferiasClick(Sender: TObject);
    procedure chklstFuncClickCheck(Sender: TObject);
    procedure cmbMesChange(Sender: TObject);
    procedure ckbIntervaloClick(Sender: TObject);
    procedure btnSelEmpregadosClick(Sender: TObject);
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
//    procedure MontaListaRubricas(DebitoDBC, DebitoDbcEx: Boolean);
    procedure MontaListaRubricas(DebitoDBC, DebitoDbcEx, Ferias: Boolean);///douglas.siqueira

    function  GerarModelo(FileName, AnoMes: string): boolean;

    function  GerarModelo_SERPROS(FileName, AnoMes: string): boolean;
    function  GerarModelo_REFER(FileName, AnoMes: string): boolean;
    function  GerarModelo_FUNCEF(FileName, AnoMes: string): boolean;
    function  GerarModelo_FCRT(FileName, AnoMes: string): boolean;
    function  GerarModelo_CTRQ(FileName, AnoMes: string): boolean;
    function  GerarModelo_CLIENTE_PADRAO(FileName, AnoMes: string): boolean;
    function PermiteCheckBoxAutonomos: Boolean;
    function CriaListaIDFUNC(const CheckList: TCheckListBox; const Lista: TStringList;
      var Valor: string; Separador: string; EntrePliques: boolean;
      UsaNames: boolean = false): word;

    procedure AjustaTela;  // edilaine - SOL 217186-15443 / KTN 2053651

  end;

var
  frmParamRelTxtCCheque: TfrmParamRelTxtCCheque;

implementation

uses fPreview, fAguarde, FileCtrl, uSistema, uMensErro, uCtrlPadroes, uCtrlFuncoesRH,
  uModulo, uCtrlUsoGeralRH, dCds, RReciboPagamentoFuncef, RReciboAutonomo,RReciboCedidos,
  RDebitoConta, RDBCExcesso,RReciboPagamentoFerias;///douglas.siqueira

{$R *.DFM}

function TfrmParamRelTxtCCheque.CriaListaIDFUNC(const CheckList: TCheckListBox;
  const Lista: TStringList; var Valor: string; Separador: string; EntrePliques: boolean;
  UsaNames: boolean): word;
var
  wAux: word;
  I, K: integer;
  AuxValor: string;
begin
  AuxValor := '';
  K := 1;
  wAux := 0;
  for I:=0 to CheckList.Items.Count-1 do
    //if (CheckList.Checked[I]) then
    begin
      if (K = 1) then
      begin
        if (EntrePliques) then
        begin
          if (UsaNames) then
            AuxValor := QuotedStr(Copy(Lista[I], 1, Pos('=',Lista[I])-1))
          else
            AuxValor := QuotedStr(Lista[I]);
        end
        else
        begin
          if (UsaNames) then
            AuxValor := Copy(Lista[I], 1, Pos('=',Lista[I])-1)
          else
            AuxValor := Lista[I];
        end;
        Inc(K);
      end
      else
      begin
        if (EntrePliques) then
        begin
          if (UsaNames) then
            AuxValor := AuxValor +Separador+ QuotedStr(Copy(Lista[I], 1, Pos('=',Lista[I])-1))
          else
            AuxValor := AuxValor +Separador+ QuotedStr(Lista[I]);
        end
        else
        begin
          if (UsaNames) then
            AuxValor := AuxValor +Separador+ Copy(Lista[I], 1, Pos('=',Lista[I])-1)
          else
            AuxValor := AuxValor +Separador+ Lista[I];
        end;
      end;
      Inc(wAux);
    end;

  Valor := AuxValor;
  Result := wAux;
end;


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

  //Thaise: Troca pela procedure MontaListaRubricas - Para o select retornar o
  //excesso de debito caso seja escolhido
  // Monta Lista de Rubricas
  MontaListaRubricas(cbkDbc.Checked, cbkDbcExcesso.Checked,cbkDbcferias.Checked);

  {  chklstRubrica.Items.Clear;
  dmCds.Cds.Data := CtrlProvDesc.ListRubricaEmpresa(IntToStr(Sistema.IdEmpresa));
  while not(dmCds.Cds.EOF) do
  begin
    ListaIdRubrica.Add(dmCds.Cds.FieldByName('CODPROVDESC').asString);
    chklstRubrica.Items.Add(dmCds.Cds.FieldByName('DESCRPROVDESC').asString);
    dmCds.Cds.Next;
  end;
}

  rgAltura.Visible := (Modulo.IdContraCheque = CLIENTE_PADRAO);
  rgImprCab.Visible := (Modulo.IdContraCheque = CLIENTE_PADRAO);
  bbtnImagem.Visible := (Modulo.IdContraCheque = FUNCEF);
  edNomeArqFrente.Visible := (Modulo.IdContraCheque = FUNCEF);
  ToolbarSep974.Visible := not(Modulo.IdContraCheque in [REFER, CTRQ]);
  rbtnImprimir.Visible := not(Modulo.IdContraCheque in [REFER, CTRQ]);
  gbxDatas.Visible := (Modulo.IdContraCheque in [CTRQ, FCRT]);

  // edilaine - SOL 217186-15443 / KTN 2053651 - inicio
  pnlAltura.Visible := rgImprCab.Visible;
  AjustaTela();
  // edilaine - SOL 217186-15443 / KTN 2053651 - fim

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
  FU.CriaListaOpcoes(chklstTipoFolha, ListaIdMotivo, sListaIdMotivoSel, ',', false);///douglas.siqueira
  MontaListaFuncionarios;///douglas.siqueira
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
  FU.CriaListaOpcoes(chklstTipoFolha, ListaIdMotivo, sListaIdMotivoSel, ',', false);///douglas.siqueira
  MontaListaFuncionarios;///douglas.siqueira

end;

procedure TfrmParamRelTxtCCheque.chklstRubricaClickCheck(Sender: TObject);
begin
  inherited;
{  FU.CriaListaOpcoes(chklstRubrica, ListaIdRubrica, sListaIdRubricaSel, ',', false);}

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
  Rpt  : TRptReciboPagamentoFuncef;
  Rpt1 : TRptReciboAutonomo;
  Rpt2 : TRptReciboCedidos;
  Rpt3 : TRptDebitoConta;
  Rpt4 : TRptDBCExcesso;
  Rpt5 : TRptReciboPagamentoFerias;///douglas.siqueira
  PerIni, PerFim : string;  // edilaine - SOL 217186-15443 / KTN 2053651
  iNumMeses : integer;      // edilaine - SOL 217186-15443 / KTN 2053651
begin
  if (Modulo.IdContraCheque = FUNCEF) then
  begin
    // edilaine - SOL 217186-15443 / KTN 2053651 - inicio
    iNumMeses := 0;

    if ckbIntervalo.Checked then
    begin
      PerIni := Trim(speAno.Text)  + fu.RetornaMes(cmbMes.Text);
      PerFim := Trim(speAnoF.Text) + fu.RetornaMes(cmbMesF.Text);

      if (PerFim = EmptyStr) or (PerIni > PerFim) then
      begin
        MessageDlg('O período inicial dever ser menor ou igual ao período Final.', mtWarning, [mbOk], 0);
        Exit;
      end;

      PerIni := '01/' + fu.RetornaMes(cmbMes.Text)  + '/' + Trim(speAno.Text);
      PerFim := '01/' + fu.RetornaMes(cmbMesF.Text) + '/' + Trim(speAnoF.Text);
      iNumMeses := fu.IntervaloMeses(PerIni, PerFim)+1;
    end;

    if iNumMeses = 0 then
       iNumMeses := 1;
    // edilaine - SOL 217186-15443 / KTN 2053651 - fim


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

      wNum := FU.CriaListaOpcoes(chklstRubrica, ListaIdRubrica, sListaIdRubricaSel, ',', True);
      if (wNum = ListaIdRubrica.Count) then
        sListaIdRubricaSel := '';


      bDemInformativo := (wNum > 0);

      // Rubricas para Remuneração selecionadas
      K := FU.CriaListaOpcoes(chklstTipoFolha, ListaIdMotivo, sListaIdMotivoSel, ',', false);
      if (cbkDbc.Checked) then
      begin
        Rpt3 := TRptDebitoConta.Create(Application);
        Rpt3.IdEmpresa := Sistema.IdEmpresa;
        Rpt3.MesRef := cmbMes.ItemIndex + 1;
        Rpt3.AnoRef := speAno.Value;
        Rpt3.TipoPagamento := sListaIdMotivoSel;
        Rpt3.Ordenacao := cmbOrderBy.ItemIndex;

        Rpt3.ListaIdEstab := sListaIdEstabSel;
        Rpt3.ListaIdFunc := sListaIdFuncSel;
        Rpt3.ListaIdRubrica:= sListaIdRubricaSel;
        Rpt3.TipoContrato := FU.GerarListaSitFuncSel(cbxAtivos.Checked, cbxAfastados.Checked, cbxDemitidos.Checked, true);
        Rpt3.SitFunc := FU.GerarListaTipoContratoSel(cbxEfetivos.Checked, cbxEspeciais.Checked,
          cbxTemporarios.Checked, cbxTerceiros.Checked, cbxPropDirSemVinc.Checked,
          cbxAutonomos.Checked, cbxEstagiarios.Checked, true);
        Rpt3.NomeTabela := NomeTabela;
        Rpt3.sFigura1 := edFigura1.Text;
        Rpt3.sFigura2 := edFigura2.Text;
        Rpt3.sFigura3 := edFigura3.Text;

        Rpt3.iNumMeses := iNumMeses;      // edilaine - SOL 217186-15443 / KTN 2053651

        Rpt3.CrmRptCMBeforePrint(Sender);
        TFrmPreview.CreateModalPreview(Application, Rpt3.rpDemonstrativoDBC, 'Débito em Conta');
      end
      else
      if (cbkDbcExcesso.Checked) then
      begin
        Rpt4 := TRptDBCExcesso.Create(Application);
        Rpt4.IdEmpresa := Sistema.IdEmpresa;
        Rpt4.MesRef := cmbMes.ItemIndex + 1;
        Rpt4.AnoRef := speAno.Value;
        Rpt4.TipoPagamento := sListaIdMotivoSel;
        Rpt4.Ordenacao := cmbOrderBy.ItemIndex;

        Rpt4.ListaIdEstab := sListaIdEstabSel;
        Rpt4.ListaIdFunc := sListaIdFuncSel;
        Rpt4.TipoContrato := FU.GerarListaSitFuncSel(cbxAtivos.Checked, cbxAfastados.Checked, cbxDemitidos.Checked, true);
        Rpt4.SitFunc := FU.GerarListaTipoContratoSel(cbxEfetivos.Checked, cbxEspeciais.Checked,
          cbxTemporarios.Checked, cbxTerceiros.Checked, cbxPropDirSemVinc.Checked,
          cbxAutonomos.Checked, cbxEstagiarios.Checked, true);
        Rpt4.NomeTabela := NomeTabela;
        Rpt4.sFigura1 := edFigura1.Text;
        Rpt4.sFigura2 := edFigura2.Text;
        Rpt4.sFigura3 := edFigura3.Text;

        Rpt4.iNumMeses := iNumMeses;      // edilaine - SOL 217186-15443 / KTN 2053651

        Rpt4.CrmRptCMBeforePrint(Sender);
        TFrmPreview.CreateModalPreview(Application, Rpt4.rpDemonstrativoDBCEX, 'Excesso de Débito');
      end
      else

      if (chklstTipoFolha.State[ ListaIdMotivo.IndexOf( '61' ) ] <> cbChecked) and
         (chklstTipoFolha.State[ ListaIdMotivo.IndexOf( '68' ) ] <> cbChecked) then
      begin
        //Marilza Colpani 03/09/2009 N.Sol 123490/N.Kintana 618054
        // Inclusão da validacão para exibição do relatório de Cedidos
        if (cbxTerceiros.Checked or cbxPropDirSemVinc.Checked) and (cbxAutonomos.Checked) and
           (cbxEfetivos.Checked or cbxEspeciais.Checked or cbxTemporarios.Checked or cbxEstagiarios.Checked) then
        begin
          frmAguarde.Apaga;
          MessageDlg('O relatório não pode ser exibido, pois para Tipo de Pagamento de Cedidos e Tipo de Pagamento de Conselheiro existem relatórios específicos.',
                                 mtWarning, [mbOk], 0);
          Exit;
        end;

        if (cbxTerceiros.Checked or cbxPropDirSemVinc.Checked) and (cbxAutonomos.Checked)  then
        begin
          frmAguarde.Apaga;
          MessageDlg('O relatório não pode ser exibido, pois para Tipo de Pagamento de Cedidos e Tipo de Pagamento de Conselheiro existem relatórios específicos.',
                                   mtWarning, [mbOk], 0);
          Exit;
        end;

        if (cbxTerceiros.Checked or cbxPropDirSemVinc.Checked) then
        begin
          frmAguarde.Apaga;
          MessageDlg('O relatório não pode ser exibido, pois para Tipo de Pagamento de Cedidos existe um relatório específico.',
                                   mtWarning, [mbOk], 0);
          Exit;
        end;

        // Alterado por Arnaldo V. Scarin em 25/02/2010
        // SOL: 127620 KTN: 678087
        // A rotina só poderá verificar se o checkbox dos Autonomos está selecionado para os
        // caso de conselheiros no tipo de folha ou no tipo de folha mensal, por isso qeu esse código
        // foi isolado.
//        if (cbxAutonomos.Checked) then
//        begin
//          frmAguarde.Apaga;
//          MessageDlg('O relatório não pode ser exibido, pois para Tipo de Pagamento de Conselheiro existe um relatório específico.',
//                                   mtWarning, [mbOk], 0);
//          Exit;
//        end;

        if (K > 1) and (MsgDlg('Confirma Mesmo Demonstrativo para Mais de um Tipo de Pagamento?',
                               'Confirmação', mtConfirmation, [mbYes,mbNo,mbHelp], 0) <> mrYes) then
        begin
          frmAguarde.Apaga;        // edilaine - SOL 217186-15443 / KTN 2053651
          exit;
        end;

        if (bDemInformativo) and (MsgDlg('Confirma Mesmo Demonstrativo Selecionado e Apenas Informativo?',
                               'Confirmação', mtConfirmation, [mbYes,mbNo,mbHelp], 0) <> mrYes) then
        begin
          frmAguarde.Apaga;        // edilaine - SOL 217186-15443 / KTN 2053651
          exit;
        end;
        
        if (cbxAutonomos.Checked) then
        begin
          Rpt1 := TRptReciboAutonomo.Create(Application);
          Rpt1.IdEmpresa := Sistema.IdEmpresa;
          Rpt1.MesRef := cmbMes.ItemIndex + 1;
          Rpt1.AnoRef := speAno.Value;
          Rpt1.TipoPagamento := sListaIdMotivoSel;
          Rpt1.Ordenacao := cmbOrderBy.ItemIndex;

          Rpt1.ListaIdEstab := sListaIdEstabSel;
          Rpt1.ListaIdFunc := sListaIdFuncSel;
          Rpt1.TipoContrato := FU.GerarListaSitFuncSel(cbxAtivos.Checked, cbxAfastados.Checked, cbxDemitidos.Checked, true);
          Rpt1.SitFunc := FU.GerarListaTipoContratoSel(cbxEfetivos.Checked, cbxEspeciais.Checked,
            cbxTemporarios.Checked, cbxTerceiros.Checked, cbxPropDirSemVinc.Checked,
            cbxAutonomos.Checked, cbxEstagiarios.Checked, true);
          Rpt1.NomeTabela := NomeTabela;
          Rpt1.sFigura1 := edFigura1.Text;
          Rpt1.sFigura2 := edFigura2.Text;
          Rpt1.sFigura3 := edFigura3.Text;

          Rpt1.iNumMeses := iNumMeses;      // edilaine - SOL 217186-15443 / KTN 2053651

          Rpt1.CrmRptCMBeforePrint(Sender);
          TFrmPreview.CreateModalPreview(Application, Rpt1.rpReciboAutonomo,'Recibo de Pagamento a Autônomo');
        end
        else
        if (cbkDbcferias.Checked) then
        begin
          Rpt5 := TRptRecibopagamentoFerias.Create(Application);
          Rpt5.IdEmpresa := Sistema.IdEmpresa;
          Rpt5.MesRef := cmbMes.ItemIndex + 1;
          Rpt5.AnoRef := speAno.Value;
          Rpt5.TipoPagamento := sListaIdMotivoSel;
          Rpt5.Ordenacao := cmbOrderBy.ItemIndex;
//          sListaIdRubricaSel ;
          Rpt5.ListaIdEstab := sListaIdEstabSel;
          Rpt5.ListaIdFunc := sListaIdFuncSel;
//          Rpt5.ListaIdRubrica:=sListaIdRubricaSel;
          Rpt5.TipoContrato := FU.GerarListaSitFuncSel(cbxAtivos.Checked, cbxAfastados.Checked, cbxDemitidos.Checked, true);
          Rpt5.SitFunc := FU.GerarListaTipoContratoSel(cbxEfetivos.Checked, cbxEspeciais.Checked,
            cbxTemporarios.Checked, cbxTerceiros.Checked, cbxPropDirSemVinc.Checked,
            cbxAutonomos.Checked, cbxEstagiarios.Checked, true);
          Rpt5.NomeTabela := NomeTabela;
          Rpt5.sFigura1 := edFigura1.Text;
          Rpt5.sFigura2 := edFigura2.Text;
          Rpt5.sFigura3 := edFigura3.Text;

          Rpt5.iNumMeses := iNumMeses;      // edilaine - SOL 217186-15443 / KTN 2053651

          Rpt5.CrmRptCMBeforePrint(Sender);
          TFrmPreview.CreateModalPreview(Application, Rpt5.rpReciboPagamento, 'RECIBO DE PAGAMENTO DE FÉRIAS');
        end
        else
        begin
          Rpt := TRptReciboPagamentoFuncef.Create(Application);
          Rpt.IdEmpresa := Sistema.IdEmpresa;
          Rpt.MesRef := cmbMes.ItemIndex + 1;
          Rpt.AnoRef := speAno.Value;
          Rpt.TipoPagamento := sListaIdMotivoSel;
          Rpt.Ordenacao := cmbOrderBy.ItemIndex;

          Rpt.ListaIdEstab := sListaIdEstabSel;
          Rpt.ListaIdFunc := sListaIdFuncSel;

          //Everson Cunha - SIG128495 - Ini
          //Rpt.TipoContrato := FU.GerarListaSitFuncSel(cbxAtivos.Checked, cbxAfastados.Checked, cbxDemitidos.Checked, true);
          //Rpt.SitFunc := FU.GerarListaTipoContratoSel(cbxEfetivos.Checked, cbxEspeciais.Checked,
          //  cbxTemporarios.Checked, cbxTerceiros.Checked, cbxPropDirSemVinc.Checked,
          //  cbxAutonomos.Checked, cbxEstagiarios.Checked, true);

          Rpt.SitFunc      := FU.GerarListaSitFuncSel(cbxAtivos.Checked, cbxAfastados.Checked, cbxDemitidos.Checked, true);
          Rpt.TipoContrato := FU.GerarListaTipoContratoSel(cbxEfetivos.Checked, cbxEspeciais.Checked,
            cbxTemporarios.Checked, cbxTerceiros.Checked, cbxPropDirSemVinc.Checked,
            cbxAutonomos.Checked, cbxEstagiarios.Checked, true);
          //Everson Cunha - SIG128495 - Fim

          Rpt.NomeTabela := NomeTabela;
          Rpt.sFigura1 := edFigura1.Text;
          Rpt.sFigura2 := edFigura2.Text;
          Rpt.sFigura3 := edFigura3.Text;

          Rpt.iNumMeses := iNumMeses;      // edilaine - SOL 217186-15443 / KTN 2053651

          Rpt.CrmRptCMBeforePrint(Sender);
          TFrmPreview.CreateModalPreview(Application, Rpt.rpReciboPagamento, 'Demonstrativo de Pagamento');
        end;
      end
      //Marilza Colpani 03/09/2009 N.Sol 123490/N.Kintana 618054
      //Inclusão da validacão para exibição do relatório de Cedidos
      else if (chklstTipoFolha.State[ ListaIdMotivo.IndexOf( '68' ) ] = cbChecked) then
      begin
        if (cbxTerceiros.Checked or cbxPropDirSemVinc.Checked) and (cbxAutonomos.Checked) and
           (cbxEfetivos.Checked or cbxEspeciais.Checked or cbxTemporarios.Checked or cbxEstagiarios.Checked) then
        begin
          frmAguarde.Apaga;
          MessageDlg('O relatório não pode ser exibido, pois para Tipo de Pagamento de Cedidos e Tipo de Pagamento de Conselheiro existem relatórios específicos.',
                                 mtWarning, [mbOk], 0);
          Exit;
        end
        else if (chklstTipoFolha.State[ ListaIdMotivo.IndexOf( '61' ) ] = cbChecked) and
                (chklstTipoFolha.State[ ListaIdMotivo.IndexOf( '68' ) ] = cbChecked ) then
        begin
          frmAguarde.Apaga;
          MessageDlg('O relatório não pode ser exibido, pois para Tipo de Pagamento de Cedidos e Tipo de Pagamento de Conselheiro existem relatórios específicos.',
                                 mtWarning, [mbOk], 0);
          Exit;
        end
        else if (cbxTerceiros.Checked or cbxPropDirSemVinc.Checked) and  (K > 1) and
                ( chklstTipoFolha.State[ ListaIdMotivo.IndexOf( '68' ) ] = cbChecked )  then
        begin
          frmAguarde.Apaga;
          MessageDlg('O relatório não pode ser exibido, pois para Tipo de Pagamento de Cedidos existe um relatório específico.',
                                     mtWarning, [mbOk], 0);
          Exit;
        end
        else if ( chklstTipoFolha.State[ ListaIdMotivo.IndexOf( '68' ) ] = cbChecked ) and
                (cbxAutonomos.Checked) then
        begin
          frmAguarde.Apaga;
          MessageDlg('O relatório não pode ser exibido, pois para Tipo de Pagamento de Cedidos e Tipo de Pagamento de Conselheiro existem relatórios específicos.',
                                         mtWarning, [mbOk], 0);
          Exit;
        end
        else if ( chklstTipoFolha.State[ ListaIdMotivo.IndexOf( '68' ) ] = cbChecked ) and
                (cbxEfetivos.Checked or cbxEspeciais.Checked or
                 cbxTemporarios.Checked or cbxEstagiarios.Checked ) then
        begin
          frmAguarde.Apaga;
          MessageDlg('O relatório não pode ser exibido, pois para Tipo de Pagamento de Cedidos existe um relatório específico.',
                                   mtWarning, [mbOk], 0);
          Exit;
        end;

        Rpt2 := TRptReciboCedidos.Create(Application);
        Rpt2.IdEmpresa := Sistema.IdEmpresa;
        Rpt2.MesRef := cmbMes.ItemIndex + 1;
        Rpt2.AnoRef := speAno.Value;
        Rpt2.TipoPagamento := sListaIdMotivoSel;
        Rpt2.Ordenacao := cmbOrderBy.ItemIndex;

        Rpt2.ListaIdEstab := sListaIdEstabSel;
        Rpt2.ListaIdFunc := sListaIdFuncSel;
        Rpt2.TipoContrato := FU.GerarListaSitFuncSel(cbxAtivos.Checked, cbxAfastados.Checked, cbxDemitidos.Checked, true);
        Rpt2.SitFunc := FU.GerarListaTipoContratoSel(cbxEfetivos.Checked, cbxEspeciais.Checked,
          cbxTemporarios.Checked, cbxTerceiros.Checked, cbxPropDirSemVinc.Checked,
          cbxAutonomos.Checked, cbxEstagiarios.Checked, true);
        Rpt2.NomeTabela := NomeTabela;
        Rpt2.sFigura1 := edFigura1.Text;
        Rpt2.sFigura2 := edFigura2.Text;
        Rpt2.sFigura3 := edFigura3.Text;

        Rpt2.iNumMeses := iNumMeses;      // edilaine - SOL 217186-15443 / KTN 2053651

        Rpt2.CrmRptCMBeforePrint(Sender);
        TFrmPreview.CreateModalPreview(Application, Rpt2.rpReciboCedidos,
          'Recibo de Pagamento a Cedidos');
      end
      else
      // Marilza Colpani 03/09/2009 N.Sol 123490/N.Kintana 618054
      // Inclusão da validacão para exibição do relatório de Cedidos
      begin
        if (chklstTipoFolha.State[ ListaIdMotivo.IndexOf( '61' ) ] = cbChecked) then
        begin
          if (cbxAutonomos.Checked) and (cbxTerceiros.Checked or cbxPropDirSemVinc.Checked) and
              (cbxEfetivos.Checked or cbxEspeciais.Checked or cbxTemporarios.Checked or cbxEstagiarios.Checked) then
          begin
              frmAguarde.Apaga;
              MessageDlg('O relatório não pode ser exibido, pois para Tipo de Pagamento de Cedidos e Tipo de Pagamento de Conselheiro existem relatórios específicos.',
                                     mtWarning, [mbOk], 0);
              Exit;
          end
          else
            if (chklstTipoFolha.State[ ListaIdMotivo.IndexOf( '61' ) ] = cbChecked) and
               (chklstTipoFolha.State[ ListaIdMotivo.IndexOf( '68' ) ] = cbChecked ) then
              begin
                frmAguarde.Apaga;
                MessageDlg('O relatório não pode ser exibido, pois para Tipo de Pagamento de Cedidos e Tipo de Pagamento de Conselheiro existem relatórios específicos.',
                                       mtWarning, [mbOk], 0);
                Exit;
              end
            else
              if cbxAutonomos.Checked and  (K > 1) and
                 (chklstTipoFolha.State[ ListaIdMotivo.IndexOf( '61' ) ] = cbChecked )  then
              begin
                frmAguarde.Apaga;
                MessageDlg('O relatório não pode ser exibido, pois para Tipo de Pagamento de Conselheiro existe um relatório específico.',
                                       mtWarning, [mbOk], 0);
                Exit;
              end
              else
                if ( chklstTipoFolha.State[ ListaIdMotivo.IndexOf( '61' ) ] = cbChecked ) and
                   (cbxTerceiros.Checked or cbxPropDirSemVinc.Checked) then
                  begin
                    frmAguarde.Apaga;
                    MessageDlg('O relatório não pode ser exibido, pois para Tipo de Pagamento de Cedidos e Tipo de Pagamento de Autônomo existem relatórios específicos.',
                                             mtWarning, [mbOk], 0);
                    Exit;
                  end
                else
                  if ( chklstTipoFolha.State[ ListaIdMotivo.IndexOf( '61' ) ] = cbChecked ) and
                     (cbxEfetivos.Checked or cbxEspeciais.Checked or
                      cbxTemporarios.Checked or cbxEstagiarios.Checked ) then
                    begin
                      frmAguarde.Apaga;
                      MessageDlg('O relatório não pode ser exibido, pois para Tipo de Pagamento de Conselheiro existe um relatório específico.',
                                             mtWarning, [mbOk], 0);
                      Exit;
                    end;

          Rpt1 := TRptReciboAutonomo.Create(Application);
          Rpt1.IdEmpresa := Sistema.IdEmpresa;
          Rpt1.MesRef := cmbMes.ItemIndex + 1;
          Rpt1.AnoRef := speAno.Value;
          Rpt1.TipoPagamento := sListaIdMotivoSel;
          Rpt1.Ordenacao := cmbOrderBy.ItemIndex;

          Rpt1.ListaIdEstab := sListaIdEstabSel;
          Rpt1.ListaIdFunc := sListaIdFuncSel;
          Rpt1.TipoContrato := FU.GerarListaSitFuncSel(cbxAtivos.Checked, cbxAfastados.Checked, cbxDemitidos.Checked, true);
          Rpt1.SitFunc := FU.GerarListaTipoContratoSel(cbxEfetivos.Checked, cbxEspeciais.Checked,
            cbxTemporarios.Checked, cbxTerceiros.Checked, cbxPropDirSemVinc.Checked,
            cbxAutonomos.Checked, cbxEstagiarios.Checked, true);
          Rpt1.NomeTabela := NomeTabela;
          Rpt1.sFigura1 := edFigura1.Text;
          Rpt1.sFigura2 := edFigura2.Text;
          Rpt1.sFigura3 := edFigura3.Text;

          Rpt1.iNumMeses := iNumMeses;      // edilaine - SOL 217186-15443 / KTN 2053651

          Rpt1.CrmRptCMBeforePrint(Sender);
          TFrmPreview.CreateModalPreview(Application, Rpt1.rpReciboAutonomo,'Recibo de Pagamento a Autônomo');
        end;
      end;
      FreeAndNil(Rpt);
      FreeAndNil(Rpt1);
      FreeAndNil(Rpt2);
      FreeAndNil(Rpt3);
      FreeAndNil(Rpt4);
      FreeAndNil(Rpt5);///douglas.siqueira      
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
var
  _qryAux:TCMClientDataSet;
  _idpessoa:string;
begin
  _qryAux := TCMClientDataSet.Create(nil);
  // Estabelecimentos selecionados
  FU.CriaListaOpcoes(chklstEstab, ListaIdEstab, sListaIdEstabSel, ',', false);
  K := FU.CriaListaOpcoes(chklstTipoFolha, ListaIdMotivo, sListaIdMotivoSel, ',', false);

  ListaIdFunc.Clear;
  chklstFunc.Items.Clear;

  if (sListaIdEstabSel <> '') then
  begin
    dmCds.Cds.Data := CtrlPessoaFuncionario.ListEmpresaFuncionario_motivo_mes(sListaIdMotivoSel,IntToStr(speAno.Value) +'/'+ FU.PoeZero(cmbMes.ItemIndex + 1),Sistema.IdEmpresa,
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
  qryAux.Free;
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
  //if sListaIdMotivoSel = '61' then sListaIdMotivoSel := '1'; //Thiago

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
    CtrlParamRelTxtCCheque.SQL.SaveToFile('c:\qry.txt');
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
    townTipoImpressaoFuncef.Top  := 200;
    townTipoImpressaoFuncef.Left := (Screen.Width - townTipoImpressaoFuncef.Width) div 2;  // edilaine - SOL 217186-15443 / KTN 2053651
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
  
procedure TfrmParamRelTxtCCheque.cbxAutonomosClick(Sender: TObject);
begin
  inherited;
  If CbxAutonomos.Checked then
    If Not PermiteCheckBoxAutonomos then
    begin
      MessageDlg('Não é possivel emitir o Tipo de Contrato "Autonomos" com outro tipo de Contrato selecionado!',mtWarning, [mbOk], 0);
      CbxAutonomos.Checked := False;
    end;
end;

Function TFrmParamRelTxtCCheque.PermiteCheckBoxAutonomos : Boolean;
begin
  Result := Not (cbxEfetivos.Checked        or
                 cbxEspeciais.Checked       or
                 cbxTemporarios.Checked     or
                 cbxEstagiarios.Checked     or
                 cbxTerceiros.Checked       or
                 cbxPropDirSemVinc.Checked);
end;

procedure TfrmParamRelTxtCCheque.ValidaAutonomos(Sender: TObject);
begin
  inherited;
  If cbxAutonomos.Checked and TCheckBox(Sender).Checked then
  begin
    MessageDlg('Não é possivel emitir o Tipo de Contrato "Autonomos" com outro tipo de Contrato selecionado!',mtWarning, [mbOk], 0);
    TCheckBox(Sender).Checked := False;
  end;
end;

procedure TfrmParamRelTxtCCheque.MontaListaRubricas(DebitoDBC,
  DebitoDbcEx, Ferias: Boolean);
var x: Integer;
begin
  CtrlProvDesc.bUsaDBC:= DebitoDBC;
  CtrlProvDesc.bUsaDBCEx:= DebitoDbcEx;
  // edilaine - SOL 191668 / KTN 1820235 - comentado para remover FLGFERIAS da CtrlProvDesc.ListRubricaEmpresa
  //CtrlProvDesc.bUsaferias:= Ferias;

  chklstRubrica.Items.Clear;
  ListaIdRubrica.Clear;
//SOL170594 DOUGLAS.SIQUEIRA

  if cbkDbcferias.Checked then
     begin
     FU.CriaListaOpcoes(chklstFunc, ListaIdFunc, sListaIdFuncSel, ',', false);
     FU.CriaListaOpcoes(chklstTipoFolha, ListaIdMotivo, sListaIdMotivoSel, ',', false);
     dmCds.Cds.Data :=CtrlProvDesc.ListRubricaEmpresaFerias(IntToStr(Sistema.IdEmpresa),sListaIdFuncSel,IntToStr(speAno.Value) +'/'+ FU.PoeZero(cmbMes.ItemIndex + 1),sListaIdMotivoSel);
     end
  else
    dmCds.Cds.Data := CtrlProvDesc.ListRubricaEmpresa(IntToStr(Sistema.IdEmpresa));
//SOL170594 DOUGLAS.SIQUEIRA
  while not(dmCds.Cds.EOF) do
  begin
    ListaIdRubrica.Add(dmCds.Cds.FieldByName('CODPROVDESC').AsString);
    chklstRubrica.Items.Add(dmCds.Cds.FieldByName('DESCRPROVDESC').AsString);
    dmCds.Cds.Next;
  end;
end;

procedure TfrmParamRelTxtCCheque.cbkDbcClick(Sender: TObject);
begin
  inherited;
  //Verifico as possibilidades dos checks estarem preenchidos;
  //Se nenhum estiver preenchido, chamo as rubricas normalmente, como é padrão;
  if not(cbkDbc.Checked) and not(cbkDbcExcesso.Checked) then
//    MontaListaRubricas(cbkDbc.Checked, cbkDbcExcesso.Checked)
    MontaListaRubricas(cbkDbc.Checked, cbkDbcExcesso.Checked,cbkDbcferias.Checked)//SOL170594 DOUGLAS.SIQUEIRA
  else
  if not(cbkDbc.Checked) then
    Exit;

  cbkDbcExcesso.Checked := False;

//  MontaListaRubricas(cbkDbc.Checked, cbkDbcExcesso.Checked);
    MontaListaRubricas(cbkDbc.Checked, cbkDbcExcesso.Checked,cbkDbcferias.Checked)//SOL170594 DOUGLAS.SIQUEIRA
end;

procedure TfrmParamRelTxtCCheque.cbkDbcExcessoClick(Sender: TObject);
begin
  inherited;
  //Verifico as possibilidades dos checks estarem preenchidos;
  //Se nenhum estiver preenchido, chamo as rubricas normalmente, como é padrão;
  if not(cbkDbc.Checked) and not(cbkDbcExcesso.Checked) then
//    MontaListaRubricas(cbkDbc.Checked, cbkDbcExcesso.Checked)
    MontaListaRubricas(cbkDbc.Checked, cbkDbcExcesso.Checked,cbkDbcferias.Checked)//SOL170594 DOUGLAS.SIQUEIRA
  else
  if not(cbkDbcExcesso.Checked) then
    Exit;

  cbkDbc.Checked:= False;

//  MontaListaRubricas(cbkDbc.Checked, cbkDbcExcesso.Checked);
    MontaListaRubricas(cbkDbc.Checked, cbkDbcExcesso.Checked,cbkDbcferias.Checked)//SOL170594 DOUGLAS.SIQUEIRA
end;

procedure TfrmParamRelTxtCCheque.cbkDbcferiasClick(Sender: TObject);//SOL170594 DOUGLAS.SIQUEIRA
begin
  inherited;
//verificar1.
  cbkDbc.Checked := False;///douglas.siqueira
  cbkDbcExcesso.Checked := False;///douglas.siqueira

  //Verifico as possibilidades dos checks estarem preenchidos;
  //Se nenhum estiver preenchido, chamo as rubricas normalmente, como é padrão;
    MontaListaRubricas(cbkDbc.Checked, cbkDbcExcesso.Checked,cbkDbcferias.Checked)///douglas.siqueira

//  cbkDbc.Checked := False;
//  cbkDbcExcesso.Checked := False;

end;

procedure TfrmParamRelTxtCCheque.chklstFuncClickCheck(Sender: TObject);
begin
  inherited;
   MontaListaRubricas(cbkDbc.Checked, cbkDbcExcesso.Checked,cbkDbcferias.Checked)//SOL170594 DOUGLAS.SIQUEIRA
end;

procedure TfrmParamRelTxtCCheque.cmbMesChange(Sender: TObject);
begin
  inherited;
  FU.CriaListaOpcoes(chklstTipoFolha, ListaIdMotivo, sListaIdMotivoSel, ',', false);//SOL170594 DOUGLAS.SIQUEIRA
  MontaListaFuncionarios;//SOL170594 DOUGLAS.SIQUEIRA
end;

procedure TfrmParamRelTxtCCheque.ckbIntervaloClick(Sender: TObject);
begin
  inherited;
  AjustaTela();
end;

procedure TfrmParamRelTxtCCheque.AjustaTela;
begin
  // edilaine - SOL 217186-15443 / KTN 2053651 - inicio
  if ckbIntervalo.Checked then
  begin
    gbxMesAnoRef.Height := 87;
    cmbMesF.ItemIndex   := FU.ExtraiMes(CdsParamRH.FieldByName('NORMALINI').asDateTime) - 1;
    speAnoF.Value       := FU.ExtraiAno(CdsParamRH.FieldByName('NORMALINI').asDateTime);
  end
  else
     gbxMesAnoRef.Height := 60;

  pnlPeriodo.Height := gbxMesAnoRef.Height+3;
  lblMesIni.Visible := ckbIntervalo.Checked;
  lblMesFim.Visible := ckbIntervalo.Checked;
  cmbMesF.Visible   := ckbIntervalo.Checked;
  speAnoF.Visible   := ckbIntervalo.Checked;
  // edilaine - SOL 217186-15443 / KTN 2053651 - fim
end;

//Everson Cunha - SIG128495 - Ini
//Procedure copiada da tela fGeraCal.pas
procedure TfrmParamRelTxtCCheque.btnSelEmpregadosClick(Sender: TObject);
var
  slLista: TStringList;
  x, i: Integer;
  sLin, sIni, sFim: String;
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
      slLista.Text := StringReplace(edtSelEmpregados.Text, ';', #13#10, [rfReplaceAll]);

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
          if (( (Length(sIni) > 1) and not(sIni[1] in ['0'..'9']) ) or
              ( (Length(sFim) > 1) and not(sFim[1] in ['0'..'9']) ) ) then
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

        for i := 0 to chklstFunc.Items.Count-1 do
          if ( (Copy(chklstFunc.Items[i], 1, Length(sIni)) >= sIni) and
               (Copy(chklstFunc.Items[i], 1, Length(sFim)) <= sFim) ) then
            chklstFunc.Checked[i] := True;
      end;

    finally
      FreeAndNil(slLista);
      chklstFunc.Repaint;
    end;
  end;
end;
//Everson Cunha - SIG128495 - Fim

end.
