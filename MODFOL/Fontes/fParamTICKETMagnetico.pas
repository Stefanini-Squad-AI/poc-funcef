// *****************************************************************************
// ***************************** REGISTRO DE ALTERAÇÕES ************************
// *****************************************************************************
// Autor(a)    :  Ádler Teodoro de Souza
// Data        :  19/02/2009
// Pendência   : SOL 109421 KINTANA 496332
// Descricao   :  Alteração de gravação de arquivos de log na raiz do disco C: .
//------------------------------------------------------------------------------
// Autor(a)    :  Henrique Massão
// Data        :  20/10/2009
// Pendência   : SOL 124276 KINTANA 629634
// Descricao   :  Alteração nos captions dos tipos de contratos
//------------------------------------------------------------------------------
unit fParamTICKETMagnetico;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs, IvDictio,
  IvMulti, IvEMulti, MAHlpBtn, StdCtrls, Buttons, TB97Tlbr, TB97, ExtCtrls, Spin, Db,
  wwdblook, DBTables, checklst, ComCtrls, IniFiles, CMProcuraSubTipo, Wwquery, TREdit,
  wwdbdatetimepicker, CMDateTimePicker, fSairAjuda, BfDialogs, BrowseFolder, uProcuraDir,
  uCtrlListTerceirosRH, ColorCheckListBox;

type
  TfrmParamTICKETMagnetico = class(TfrmSairAjuda)
    svdlgDialogo: TOpenDialog;
    bbtnGerar: TBitBtn;
    ToolbarSep972: TToolbarSep97;
    qryTicket: TwwQuery;
    qryNomeResp: TwwQuery;
    qryNomeEstab: TwwQuery;
    qryEstab: TwwQuery;
    pgctrlPaginas: TPageControl;
    tbshPrincipal: TTabSheet;
    tbshOpcoes: TTabSheet;
    tbshPedidoSup: TTabSheet;
    Label3: TLabel;
    Label12: TLabel;
    rgTipSigla: TRadioGroup;
    gbxImprime: TGroupBox;
    cbxRecEncar: TCheckBox;
    cbxRelAssinat: TCheckBox;
    cbxRelGer: TCheckBox;
    cbxRelResUnid: TCheckBox;
    GroupBox1: TGroupBox;
    Label6: TLabel;
    Label7: TLabel;
    Label8: TLabel;
    Label9: TLabel;
    Label10: TLabel;
    edPersTicket: TEdit;
    cmbPersLinhaTkt1: TComboBox;
    cmbPersLinhaTkt2: TComboBox;
    cmbPersLinhaRot1: TComboBox;
    cmbPersLinhaRot2: TComboBox;
    qryTipoDoc: TwwQuery;
    tbshIntegraCAP: TTabSheet;
    sbshResult: TTabSheet;
    memResult: TMemo;
    bbtnSalvar: TBitBtn;
    Bevel1: TBevel;
    qryTipoDesenb: TwwQuery;
    Label13: TLabel;
    dblkcbEstab: TwwDBLookupCombo;
    gbxMesAnoRef: TGroupBox;
    cmbMes: TComboBox;
    speAno: TSpinEdit;
    Label16: TLabel;
    dtedDataPedido: TCMDateTimePicker;
    Label4: TLabel;
    dtedDataEntrega: TCMDateTimePicker;
    Label11: TLabel;
    edCodCli: TEdit;
    Label14: TLabel;
    dblkcbResp: TwwDBLookupCombo;
    gbxFunc: TGroupBox;
    gpctrlEmpregados: TPageControl;
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
    rgFazIntegraCAP: TRadioGroup;
    chkRateioCC: TCheckBox;
    Label19: TLabel;
    dtPagamento: TCMDateTimePicker;
    Label20: TLabel;
    dblcTipoDoc: TwwDBLookupCombo;
    cmprocFonecedor: TCMProcuraForCli;
    Label15: TLabel;
    bdlckTipoDesemb: TwwDBLookupCombo;
    tblDocumentos: TTable;
    ProcuraDirDlg: TProcuraDirDlg;
    rgPedSupl: TRadioGroup;
    rgSomentePedSupl: TRadioGroup;
    gbxCCusto: TGroupBox;
    chklstCCusto: TColorCheckListBox;
    bbtnSelTodosCCusto: TBitBtn;
    bbtnInverteSelCCusto: TBitBtn;
    Label1: TLabel;
    spedNumTicketsSupl: TSpinEdit;
    Label5: TLabel;
    spedNumTicketsCarnet: TSpinEdit;
    Label2: TLabel;
    redValUnit: TRealEdit;
    rgAcabSuplem: TRadioGroup;
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure FormCreate(Sender: TObject);
    procedure bbtnGerarClick(Sender: TObject);
    procedure gbxTipContraEnter(Sender: TObject);
    procedure gbxTipContraExit(Sender: TObject);
    procedure dblkcbEstabChange(Sender: TObject);
    procedure bbtnSelTodosFuncClick(Sender: TObject);
    procedure bbtnInverteSelFuncClick(Sender: TObject);
    procedure bbtnSelTodosCCustoClick(Sender: TObject);
    procedure bbtnInverteSelCCustoClick(Sender: TObject);
    procedure rgFazIntegraCAPClick(Sender: TObject);
    procedure bbtnSalvarClick(Sender: TObject);
    procedure cmprocFonecedorChange(Sender: TObject);
    procedure rgPedSuplClick(Sender: TObject);
  private
    CtrlListTerceirosRH: TCtrlListTerceirosRH;

    ArqConfig: TIniFile;

    ListaCCusto,
    ListaCodFunc: TStringList;
    fTicketR, fTicketA: TextFile; // Arquivo de Saída
    dUltValorProvento: double;
    rValorTotRegTipo1, rValorTotRegTipo3: real;
    iQuantTot,
    iQuantEmpregados: integer;
    NumRegistro: word;
    bTipContrEfet,
    bTipContrEspec,
    bTipContrTemp,
    bTipContrEst,
    bTipContrTerc,
    bTipContrProp,
    bTipContrAut: boolean;
    sAux, // Variável auxiliar geral
    sNomeUnidEntrega,
    sCodEstab: string;
    prmUnidNegoc: integer;
    prmCodCentroRespon: string;

    procedure LeAlteracoes;
    procedure GravaAlteracoes;
    function  GerarRegistro0_R: string;
    function  GerarRegistro0_A: string;
    function  GerarRegistro1(CCusto: string): string;
    function  GerarRegistro2: string;
    function  GerarRegistro3_R: string;
    function  GerarRegistro3_A: string;
    function  GerarRegistro9_R: string;
    function  GerarRegistro9_A: string;
    procedure MontaListaFuncionarios;
    function  SelTipoContrato: string;
    procedure SelecionaEstab;
    function  VerificaOpcoesOk: boolean;
    function  Val_End(sEnd: string): string;
    procedure FazIntegraCAP;
    function  FinalizarIntegraCAP: boolean;
  end;

var
  frmParamTICKETMagnetico: TfrmParamTICKETMagnetico;

implementation

uses uSistema, uCMTypes, FileCtrl, uMensErro, uFuncoesUteisRH, UsoGeralRH, dCds,
  uDocumento, uDataBase, fAguarde, uCtrlPadroes, uCtrlUsoGeralRH;

{$R *.DFM}

{ Esquema das Tabelas Genéricas Envolvidas
  ****************************************
  UNIDENTREGA --> Unidade de Entrega do Ticket (Centros de Custo)
  -----------
  CODUNIDENTREGA - A (Código do Centro de Custo)
  NOME           - A
  LOGRADOURO     - A
  NUMERO         - N
  COMPLEMENTO    - A
  BAIRRO         - A
  CEP            - N
  ESTADO         - A
  CIDADE         - A

  OPCAOALIMENT --> Opções de Cada Empregado
  ------------
  MATRICULA      - A (Matrícula do Empregado)
  CODUNIDENTREGA - A (Código da Unidade de Entrega
                   OBS: Quando não informado será gravado o Próprio Estabelecimento)
  OPCAO1         - A (1ª Opção - Código da tabela OPCAOTICKET)
  OPCAO2         - A (1ª Opção - Código da tabela OPCAOTICKET)

  OPCAOTICKET --> Descrição das Opções Disponíveis
  -----------
  CODIGO     - A (Código para referência externa. Ex: R11, A11, V24)
  PRODUTO    - A (A->Alimentação V->Combutível R->Refeição)
  ACABAMENTO - A (C->Carnet B->Blocado S->Solto)
  BLOCAGEM   - N (Número de Tickets por Carnet)
  VLRFACIAL  - N (Valor Unitário) }

procedure TfrmParamTICKETMagnetico.FormCreate(Sender: TObject);
begin
  inherited;
  CtrlListTerceirosRH := TCtrlListTerceirosRH.Create(CtrlUsoGeralRH.UsuXFilial,
    CtrlUsoGeralRH.UsuXCCusto, CtrlUsoGeralRH.IdUsuarioGeral);
  CtrlListTerceirosRH.InitializeAs(Padroes);

  ListaCodFunc := TStringList.Create;
  ListaCCusto := TStringList.Create;

  if not(Assigned(Documento)) then
    Documento := TDocumento.Create;

  qryNomeEstab.ParamByName('EMPRESA').asInteger := Sistema.IdEmpresa;
  qryNomeEstab.Open;
  qryNomeResp.ParamByName('EMPRESA').asInteger := Sistema.IdEmpresa;
  qryNomeResp.Open;
  qryTipoDoc.Open;

  // Preenche ChkList dos C. Custo
  chklstCCusto.Items.Clear;
  with (dmCds.qry) do
  begin
    SQL.Clear;
    SQL.Add('SELECT');
    SQL.Add('  CODCENTROCUSTO, NOME');
    SQL.Add('FROM');
    SQL.Add('  CENTCUST');

    // C. de Custo(s) habilitado(s) para o usuário
    if (sUsuXccusto <> '') then
    begin
      if (Pos(',',sUsuXccusto) > 0) then
        SQL.Add('WHERE (CODCENTROCUSTO IN ' +sUsuXccusto+ ')')
      else
        SQL.Add('WHERE (CODCENTROCUSTO  = ' +sUsuXccusto+ ')');
    end;

    SQL.Add('ORDER BY');
    SQL.Add('  UPPER(NOME)');
    Open;

    while not(EOF) do
    begin
      ListaCCusto.Add(FieldByName('CODCENTROCUSTO').asString);
      chklstCCusto.Items.Add(FieldByName('NOME').asString);
      Next;
    end;
  end;

  // Inicializa variáveis
  FazQuery(dmCds.qry,'SELECT NORMALINI FROM PARAMRH');
  cmbMes.ItemIndex     := ExtraiMes(dmCds.qry.FieldByName('NORMALINI').asDateTime)-1;
  speAno.Value         := ExtraiAno(dmCds.qry.FieldByName('NORMALINI').asDateTime);

  dblkcbEstab.Text     := qryNomeEstab.FieldByName('NOME').asString;
  dtedDataPedido.Date  := Date;
  dtedDataEntrega.Date := Date+7;
  pgctrlPaginas.ActivePageIndex    := 0;
  gpctrlEmpregados.ActivePageIndex := 0;

  rgPedSuplClick(Sender);

  dmCds.Cds.Data := CtrlListTerceirosRH.ListParamGlobal(Sistema.IdEmpresa);
  if (dmCds.Cds.IsEmpty) then
  begin
    prmUnidNegoc := -1;
    prmCodCentroRespon := '';
  end
  else
  begin
    if (Trim(dmCds.Cds.FieldByName('UNIDNEGOC').asString) <> '') then
      prmUnidNegoc := dmCds.Cds.FieldByName('UNIDNEGOC').asInteger
    else
      prmUnidNegoc := -1;

    if (Trim(dmCds.Cds.FieldByName('CODCENTRORESPON').asString) <> '') then
      prmCodCentroRespon := dmCds.Cds.FieldByName('CODCENTRORESPON').asString
    else
      prmCodCentroRespon := '-1';
  end;

  // Carrega alterações nas opções feitas anteriormente
  LeAlteracoes;

  svdlgDialogo.InitialDir := Sistema.RetornaCaminhoArquivos(Sistema.IdEmpresa);
  //Ádler Teodoro de Souza SOL 109421 KINTANA 496332
end;

procedure TfrmParamTICKETMagnetico.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  GravaAlteracoes;

  FreeAndNil(CtrlListTerceirosRH);
  FreeAndNil(Documento);
  FreeAndNil(ArqConfig);
  FreeAndNil(ListaCodFunc);
  FreeAndNil(ListaCCusto);

  qryTipoDoc.Close;
  qryNomeResp.Close;
  qryNomeEstab.Close;
  qryEstab.Close;
  dmCds.qry.Close;
  inherited;
end;

procedure TfrmParamTICKETMagnetico.dblkcbEstabChange(Sender: TObject);
begin
  dblkcbEstab.Text := Trim(dblkcbEstab.Text);

  if (dblkcbEstab.Text <> sCodEstab) then
  begin
    MontaListaFuncionarios;
    sCodEstab := dblkcbEstab.Text;
  end;

  if (gpctrlEmpregados.ActivePageIndex = 0) then
    chklstFunc.Repaint;
end;

procedure TfrmParamTICKETMagnetico.cmprocFonecedorChange(Sender: TObject);
begin
  if (cmprocFonecedor.Valida = vcOk) then
  begin
    if not(FazQuery(qryTipoDesenb,
      'SELECT '+
      '  F.IDFORNXDESEMB, F.CODTIPRECDES, F.RECPAG, F.IDPESSOA, F.IDEMPRESAPROP, '+
      '  TP.DESCRICAO, TP.ANASINT '+
      'FROM '+
      '  TIPORECEBDESEMB TP, FORNXDESEMB F '+
      'WHERE '+
      '  (TP.ANASINT      = ''A'') AND '+
      '  (TP.RECPAG       = ''P'') AND '+
      '  (TP.IDPESSOA     = ' +IntToStr(Sistema.idEmpresa)+ ') AND '+
      '  (F.IDPESSOA      = ' +IntToStr(cmprocFonecedor.ForCliReg.Id)+ ') AND '+
      '  (F.RECPAG        = TP.RECPAG)   AND '+
      '  (F.IDEMPRESAPROP = TP.IDPESSOA) AND '+
      '  (F.CODTIPRECDES  = TP.CODTIPRECDES) '+
      'ORDER BY TP.DESCRICAO')) then
    begin
      if not(FazQuery(qryTipoDesenb,
        'SELECT DISTINCT T.CODTIPRECDES, T.RECPAG, T.IDPESSOA, T.PLANO, T.PLACONTA, '+
        'T.IDUSUARIOINCLUSAO, T.DESCRICAO, T.ANASINT, T.PLACONTACREDITO, T.FLGOBRIGARESERVA, '+
        'T.FLGCALCULAIMPOSTO, T.HITCODHIST '+
        'FROM TIPORECEBDESEMB T, RAMOXDESEMB R '+
        'WHERE (T.ANASINT           = ''A'') AND '+
        '      (T.RECPAG            = ''P'') AND '+
        '      (T.IDPESSOA          = ' +IntToStr(Sistema.idEmpresa)+ ') AND '+
        '      (R.IDRAMOFORNECEDOR IN (SELECT IDRAMOFORNECEDOR FROM FORNXRAMO WHERE IDPESSOA = ' +IntToStr(cmprocFonecedor.ForCliReg.Id)+ ')) AND '+
        '      (R.RECPAG            = T.RECPAG) AND '+
        '      (R.IDPESSOA          = T.IDPESSOA) AND '+
        '      (R.CODTIPRECDES      = T.CODTIPRECDES) '+
        'ORDER BY T.DESCRICAO')) then
      begin
        FazQuery(qryTipoDesenb,
          'SELECT CODTIPRECDES, RECPAG, PLACONTACREDITO, PLANO, PLACONTA, DESCRICAO, ANASINT, '+
          'FLGOBRIGARESERVA, FLGCALCULAIMPOSTO, HITCODHIST '+
          'FROM TIPORECEBDESEMB '+
          'WHERE (ANASINT  = ''A'') AND '+
          '      (RECPAG   = ''P'') AND '+
          '      (IDPESSOA = ' +IntToStr(Sistema.idEmpresa)+ ') '+
          'ORDER BY DESCRICAO');
      end;
    end;
  end
  else
    qryTipoDesenb.Close;

  bdlckTipoDesemb.Enabled := (cmprocFonecedor.Valida = vcOk);
end;

procedure TfrmParamTICKETMagnetico.gbxTipContraEnter(Sender: TObject);
begin
  bTipContrEfet  := cbxEfetivos.Checked;
  bTipContrEspec := cbxEspeciais.Checked;
  bTipContrTemp  := cbxTemporarios.Checked;
  bTipContrEst   := cbxEstagiarios.Checked;
  bTipContrTerc  := cbxTerceiros.Checked;
  bTipContrProp  := cbxProprietarios.Checked;
  bTipContrAut   := cbxAutonomos.Checked;
end;

procedure TfrmParamTICKETMagnetico.gbxTipContraExit(Sender: TObject);
begin
  if not(cbxEfetivos.Checked)      and not(cbxEspeciais.Checked) and
     not(cbxTemporarios.Checked)   and not(cbxTerceiros.Checked) and
     not(cbxProprietarios.Checked) and not(cbxAutonomos.Checked) and
     not(cbxEstagiarios.Checked) then
  begin
    MsgDlg ('Pelo menos um Tipo de Contrato deve ser selecionado!','Aviso', mtInformation,[mbOk,mbHelp],0);
    cbxEfetivos.SetFocus;
  end
  else
  begin
    if (bTipContrEfet <> cbxEfetivos.Checked)    or (bTipContrEspec <> cbxEspeciais.Checked)     or
       (bTipContrTemp <> cbxTemporarios.Checked) or (bTipContrEst   <> cbxEstagiarios.Checked)   or
       (bTipContrTerc <> cbxTerceiros.Checked)   or (bTipContrProp  <> cbxProprietarios.Checked) or
       (bTipContrAut  <> cbxAutonomos.Checked) then
      MontaListaFuncionarios;
  end;
end;

procedure TfrmParamTICKETMagnetico.bbtnSelTodosCCustoClick(Sender: TObject);
var
  c: integer;
begin
  for c:=0 to chklstCCusto.Items.Count-1 do
    chklstCCusto.Checked[c] := true;
  chklstCCusto.Repaint;
end;

procedure TfrmParamTICKETMagnetico.bbtnInverteSelCCustoClick(Sender: TObject);
var
  c: integer;
begin
  for c:=0 to chklstCCusto.Items.Count-1 do
    chklstCCusto.Checked[c] := not(chklstCCusto.Checked[c]);
  chklstCCusto.Repaint;
end;

procedure TfrmParamTICKETMagnetico.bbtnSelTodosFuncClick(Sender: TObject);
var
  c: integer;
begin
  for c:=0 to chklstFunc.Items.Count-1 do
    chklstFunc.Checked[c] := true;

  if (gpctrlEmpregados.ActivePageIndex = 0) then
    chklstFunc.Repaint;
end;

procedure TfrmParamTICKETMagnetico.bbtnInverteSelFuncClick(Sender: TObject);
var
  c: integer;
begin
  for c:=0 to chklstFunc.Items.Count-1 do
    chklstFunc.Checked[c] := not(chklstFunc.Checked[c]);

  if (gpctrlEmpregados.ActivePageIndex = 0) then
    chklstFunc.Repaint;
end;

procedure TfrmParamTICKETMagnetico.rgPedSuplClick(Sender: TObject);
begin
  rgSomentePedSupl.Enabled     := (rgPedSupl.ItemIndex = 0);
  gbxCCusto.Enabled            := (rgPedSupl.ItemIndex = 0);
  spedNumTicketsSupl.Enabled   := (rgPedSupl.ItemIndex = 0);
  spedNumTicketsCarnet.Enabled := (rgPedSupl.ItemIndex = 0);
  redValUnit.Enabled           := (rgPedSupl.ItemIndex = 0);
  rgAcabSuplem.Enabled         := (rgPedSupl.ItemIndex = 0);
end;

procedure TfrmParamTICKETMagnetico.rgFazIntegraCAPClick(Sender: TObject);
begin
  dtPagamento.Enabled     := (rgFazIntegraCAP.ItemIndex = 0);
  dblcTipoDoc.Enabled     := (rgFazIntegraCAP.ItemIndex = 0);
  cmprocFonecedor.Enabled := (rgFazIntegraCAP.ItemIndex = 0);
  chkRateioCC.Enabled     := (rgFazIntegraCAP.ItemIndex = 0);
end;

procedure TfrmParamTICKETMagnetico.bbtnSalvarClick(Sender: TObject);
begin
  if (svdlgDialogo.Execute) then
    memResult.Lines.SaveToFile(svdlgDialogo.FileName);
end;

procedure TfrmParamTICKETMagnetico.bbtnGerarClick(Sender: TObject);
var
  bArqAberto: boolean;
  wNum: word;
  c: integer;
  sCodFuncSel: string;
  bPossuiRegR, bPossuiRegA: boolean;
begin
  // Verifica se as opções selecionadas estão corretamente selecionadas
  if not(VerificaOpcoesOk) then
    exit;

  // Funcionários escolhidos
  wNum := CriaListaOpcoes(chklstFunc, ListaCodFunc, sCodFuncSel, ',', false);
  if (wNum = ListaCodFunc.Count) then
    sCodFuncSel := '';

  // *********************
  // Monta Query do TICKET
  // *********************
  with (qryTicket.SQL) do
  begin
    Clear;
    Add('SELECT');
    Add('  RTRIM(PF.NOME) AS EMPREGADO,');
    Add('  F.MATRICULA,');
    Add('  F.CODCENTROCUSTO,');

    if (rgTipSigla.ItemIndex = 0) then
      Add('  CC.NOME        AS C_CUSTO,')
    else
      Add('  CC.CODREDUZIDO AS C_CUSTO,');

    Add('  PEFIS.DATANASC,');
    Add('  TIPO_OPCAO.PRODUTO,');
    Add('  TIPO_OPCAO.ACABAMENTO,');
    Add('  TIPO_OPCAO.BLOCAGEM,');
    Add('  TIPO_OPCAO.VLRFACIAL,');
    Add('  UE.NOME AS UNIDENTREGA,');
    Add('  UE.LOGRADOURO,');
    Add('  UE.NUMERO,');
    Add('  UE.COMPLEMENTO,');
    Add('  UE.BAIRRO,');
    Add('  UE.CEP,');
    Add('  UE.ESTADO,');
    Add('  UE.CIDADE');
    Add('FROM');
    Add('  PESSOA PF, PESSOAFISICA PEFIS, VALTABGENER F1, VALTABGENER F2,');
    Add('  FUNCIONARIO F, CENTCUST CC, SITFUNC ST,');
    // -------------------------------------------------------------------- //
    // Opção de Ticket
    Add('  (SELECT');
    Add('     F1.VALOR AS MATRICULA, F2.VALOR AS OPCAO');
    Add('   FROM');
    Add('     VALTABGENER F1, VALTABGENER F2');
    Add('   WHERE');
    Add('     (F1.CODTABELA = ''OPCAOALIMENT'') AND');
    Add('     (F2.CODTABELA = ''OPCAOALIMENT'') AND');
    Add('     (F1.CODCAMPO  = ''MATRICULA'') AND');
    Add('     (F2.CODCAMPO IN (''OPCAO1'',''OPCAO2'')) AND');
    Add('     (RTRIM(F2.VALOR) IS NOT NULL) AND');
    Add('     (F1.NUMLINHA  = F2.NUMLINHA)');
    Add('   ORDER BY');
    Add('     F1.VALOR) OPCAO,');
    // -------------------------------------------------------------------- //
    // Tipo da Opção

    Add('  (SELECT');
    Add('     P1.VALOR AS OPCAO,');
    Add('     P2.VALOR AS PRODUTO,');
    Add('     P3.VALOR AS ACABAMENTO,');
    Add('     P4.VALOR AS BLOCAGEM,');
    Add('     P5.VALOR AS VLRFACIAL');
    Add('   FROM');
    Add('    VALTABGENER P1, VALTABGENER P2, VALTABGENER P3, VALTABGENER P4, VALTABGENER P5');
    Add('   WHERE');
    Add('     (P1.CODTABELA     = ''OPCAOTICKET'') AND');
    Add('     (P1.CODCAMPO      = ''CODIGO'') AND');
    Add('     (P2.CODTABELA     = ''OPCAOTICKET'') AND');
    Add('     (P2.CODCAMPO      = ''PRODUTO'') AND');
    Add('     (P3.CODTABELA     = ''OPCAOTICKET'') AND');
    Add('     (P3.CODCAMPO      = ''ACABAMENTO'') AND');
    Add('     (P4.CODTABELA     = ''OPCAOTICKET'') AND');
    Add('     (P4.CODCAMPO      = ''BLOCAGEM'') AND');
    Add('     (P5.CODTABELA     = ''OPCAOTICKET'') AND');
    Add('     (P5.CODCAMPO      = ''VLRFACIAL'') AND');
    Add('     (P1.NUMLINHA      = P2.NUMLINHA) AND');
    Add('     (P1.NUMLINHA      = P3.NUMLINHA) AND');
    Add('     (P1.NUMLINHA      = P4.NUMLINHA) AND');
    Add('     (P1.NUMLINHA      = P5.NUMLINHA)');
    Add('   ORDER BY');
    Add('     OPCAO) TIPO_OPCAO,');
    // -------------------------------------------------------------------- //
    // Dados da Unidade de Entrega
    Add('  (SELECT');
    Add('     RTRIM(VT_COD.VALOR) AS CODUNIDENTREGA, VT_NOM.VALOR AS NOME,');
    Add('     VT_LOG.VALOR AS LOGRADOURO, VT_NUM.VALOR AS NUMERO,');
    Add('     VT_COM.VALOR AS COMPLEMENTO, VT_BAI.VALOR AS BAIRRO,');
    Add('     VT_CEP.VALOR AS CEP, VT_EST.VALOR AS ESTADO, VT_CID.VALOR AS CIDADE');
    Add('   FROM');
    Add('     VALTABGENER VT_COD, VALTABGENER VT_NOM, VALTABGENER VT_LOG, VALTABGENER VT_NUM,');
    Add('     VALTABGENER VT_COM, VALTABGENER VT_BAI, VALTABGENER VT_CEP, VALTABGENER VT_EST,');
    Add('     VALTABGENER VT_CID');
    Add('   WHERE');
    Add('     (VT_COD.CODTABELA = ''UNIDENTREGA'') AND');
    Add('     (VT_NOM.CODTABELA = ''UNIDENTREGA'') AND');
    Add('     (VT_LOG.CODTABELA = ''UNIDENTREGA'') AND');
    Add('     (VT_NUM.CODTABELA = ''UNIDENTREGA'') AND');
    Add('     (VT_COM.CODTABELA = ''UNIDENTREGA'') AND');
    Add('     (VT_BAI.CODTABELA = ''UNIDENTREGA'') AND');
    Add('     (VT_CEP.CODTABELA = ''UNIDENTREGA'') AND');
    Add('     (VT_EST.CODTABELA = ''UNIDENTREGA'') AND');
    Add('     (VT_CID.CODTABELA = ''UNIDENTREGA'') AND');
    Add('     (VT_COD.CODCAMPO  = ''CODUNIDENTREGA'') AND');
    Add('     (VT_NOM.CODCAMPO  = ''NOME'') AND');
    Add('     (VT_LOG.CODCAMPO  = ''LOGRADOURO'') AND');
    Add('     (VT_NUM.CODCAMPO  = ''NUMERO'') AND');
    Add('     (VT_COM.CODCAMPO  = ''COMPLEMENTO'') AND');
    Add('     (VT_BAI.CODCAMPO  = ''BAIRRO'') AND');
    Add('     (VT_CEP.CODCAMPO  = ''CEP'') AND');
    Add('     (VT_EST.CODCAMPO  = ''ESTADO'') AND');
    Add('     (VT_CID.CODCAMPO  = ''CIDADE'') AND');
    Add('     (VT_COD.NUMLINHA  = VT_NOM.NUMLINHA) AND');
    Add('     (VT_COD.NUMLINHA  = VT_LOG.NUMLINHA) AND');
    Add('     (VT_COD.NUMLINHA  = VT_NUM.NUMLINHA) AND');
    Add('     (VT_COD.NUMLINHA  = VT_COM.NUMLINHA) AND');
    Add('     (VT_COD.NUMLINHA  = VT_BAI.NUMLINHA) AND');
    Add('     (VT_COD.NUMLINHA  = VT_CEP.NUMLINHA) AND');
    Add('     (VT_COD.NUMLINHA  = VT_EST.NUMLINHA) AND');
    Add('     (VT_COD.NUMLINHA  = VT_CID.NUMLINHA)) UE');
    // -------------------------------------------------------------------- //
    Add('WHERE');
    Add('  (ST.TIPOSIT       = ''A'') AND');

    if (sCodFuncSel <> '') then
    begin
      if (Pos(',',sCodFuncSel) > 0) then
        Add('  (F.IDPESSOA     IN (' +sCodFuncSel+ ')) AND')
      else
        Add('  (F.IDPESSOA      = ' +sCodFuncSel+ ') AND');
    end
    else
    begin
      // C. de Custo(s) habilitados para o usuário
      if (sUsuXccusto <> '') then
      begin
        if (Pos(',',sUsuXccusto) > 0) then
          Add('  (F.CODCENTROCUSTO IN ' +sUsuXccusto+ ') AND')
        else
          Add('  (F.CODCENTROCUSTO = ' +sUsuXccusto+ ') AND');
      end;

      sAux := SelTipoContrato;
      if (Pos(',',sAux) > 0) then
        Add('  (F.TIPOCONTRATO  IN (' +sAux+ ')) AND')
      else
        Add('  (F.TIPOCONTRATO   = ' +sAux+ ') AND');
    end;

    Add('  (F1.CODTABELA     = ''OPCAOALIMENT'') AND');
    Add('  (F1.CODCAMPO      = ''MATRICULA'') AND');
    Add('  (F2.CODTABELA     = ''OPCAOALIMENT'') AND');
    Add('  (F2.CODCAMPO      = ''CODUNIDENTREGA'') AND');
    Add('  (F1.NUMLINHA      = F2.NUMLINHA) AND');
    Add('  (F1.VALOR         = OPCAO.MATRICULA) AND');
    Add('  (F1.VALOR         = F.MATRICULA) AND');
    Add('  (OPCAO.OPCAO      = TIPO_OPCAO.OPCAO) AND');
    Add('  (ST.IDSITFUNC     = F.IDSITFUNC) AND');
    Add('  (F.CODCENTROCUSTO = CC.CODCENTROCUSTO) AND');
    Add('  (F.IDEMPRESA      = CC.IDEMPRESA) AND');
    Add('  (F.IDPESSOA       = PEFIS.IDPESSOA) AND');
    Add('  (F.IDPESSOA       = PF.IDPESSOA) AND');
    Add('  (F2.VALOR         = UE.CODUNIDENTREGA(+))');
    Add('ORDER BY');
    Add('  TIPO_OPCAO.OPCAO, UPPER(UNIDENTREGA), UPPER(EMPREGADO)');
    //SaveToFile('c:\qry.txt');
    SaveToFile(Sistema.RetornaCaminhoArquivos(Sistema.IdEmpresa)+'\qry.txt');//Ádler Teodoro de Souza SOL 109421 KINTANA 496332

  end;

  bArqAberto := false;

  frmAguarde.Mostra('Processando Tickets...');
  frmAguarde.Update;
  frmAguarde.Pos := 0;
  qryTicket.Open;
  frmAguarde.pbAguarde.Visible := true;
  frmAguarde.Max := qryTicket.RecordCount;
  frmAguarde.Min := 0;

  bPossuiRegR := qryTicket.Locate('PRODUTO', 'R', [loCaseInsensitive]);
  bPossuiRegA := qryTicket.Locate('PRODUTO', 'A', [loCaseInsensitive]);

  // Processa dados para a geração do arquivo, se estes existirem
  if not(qryTicket.IsEmpty) and (bPossuiRegR or bPossuiRegA) then
  begin
    try
      // Associa e Cria/Recria o arquivos a serem gerados
      if (bPossuiRegR) then
      try
        AssignFile(fTicketR, ProcuraDirDlg.Directory+'\TicketR.TXT');
        ReWrite(fTicketR);
      except
        memResult.Lines.Add('[Erro] Ao tentar criar/sobrescrever o arquivo TicketR.TXT');
        memResult.Lines.Add(Replicate('-', 105));
      end;

      if (bPossuiRegA) then
      try
        AssignFile(fTicketA, ProcuraDirDlg.Directory+'\TicketA.TXT');
        ReWrite(fTicketA);
      except
        memResult.Lines.Add('[Erro] Ao tentar criar/sobrescrever o arquivo TicketA.TXT');
        memResult.Lines.Add(Replicate('-', 105));
      end;

      bArqAberto := true;
      iQuantTot := 0;
      rValorTotRegTipo1 := 0;
      rValorTotRegTipo3 := 0;
      iQuantEmpregados := 0;

      memResult.Lines.Clear;
      qryTicket.First;

      // *************************************
      // Registro Tipo '0' - Header da Empresa
      // *************************************
      NumRegistro := 1;
      if (bPossuiRegR) then
      begin
        try
          Write(fTicketR, GerarRegistro0_R);
          memResult.Lines.Add('[Ok] Geração do Registro Header');
          memResult.Lines.Add('Empresa..: ' +Trim(qryNomeEstab.FieldByName('NOME').asString));
          memResult.Lines.Add(Replicate('-', 105));
        except
          memResult.Lines.Add('[Erro] Geração do Registro Header');
          memResult.Lines.Add('Empresa..: ' +Trim(qryNomeEstab.FieldByName('NOME').asString));
          memResult.Lines.Add(Replicate('-', 105));
        end;

        // **************************************
        // Registro Tipo '1' - Pedido Suplementar
        // **************************************
        try
          if (rgPedSupl.ItemIndex = 0) then
            for c:=0 to chklstCCusto.Items.Count-1 do
              if (chklstCCusto.Checked[c]) then
              begin
                Inc(NumRegistro);
                Write(fTicketR, GerarRegistro1(chklstCCusto.Items[c]));

                dUltValorProvento := StrToInt(spedNumTicketsCarnet.Text) *
                                     StringToFloat(redValUnit.Text);

                iQuantTot := iQuantTot + StrToInt(spedNumTicketsCarnet.Text);
                rValorTotRegTipo1 := rValorTotRegTipo1 + dUltValorProvento;

                if (rgFazIntegraCAP.ItemIndex = 0) then
                  FazIntegraCAP;
              end;
          memResult.Lines.Add('[Ok] Geração dos Registros do Pedido Suplementar');
          memResult.Lines.Add(Replicate('-', 105));
        except
          memResult.Lines.Add('[Erro] Geração dos Registros do Pedido Suplementar');
          memResult.Lines.Add(Replicate('-', 105));
        end;
      end;

      if (bPossuiRegA) then
      try
        Write(fTicketA, GerarRegistro0_A);
        memResult.Lines.Add('[Ok] Geração do Registro Header');
        memResult.Lines.Add('Empresa..: ' +Trim(qryNomeEstab.FieldByName('NOME').asString));
        memResult.Lines.Add(Replicate('-', 105));
      except
        memResult.Lines.Add('[Erro] Geração do Registro Header');
        memResult.Lines.Add('Empresa..: ' +Trim(qryNomeEstab.FieldByName('NOME').asString));
        memResult.Lines.Add(Replicate('-', 105));
      end;

      // LOOP para todos os Registros selecionados
      repeat
        if (Trim(qryTicket.FieldByName('UNIDENTREGA').asString) <> '') then
          sNomeUnidEntrega := Trim(qryTicket.FieldByName('UNIDENTREGA').asString)
        else
          sNomeUnidEntrega := Trim(qryNomeEstab.FieldByName('NOME').asString);

        if (rgSomentePedSupl.ItemIndex = 1) then
        begin
          // **************************************
          // Registro Tipo '2' - Unidade de Entrega
          // **************************************
          Inc(NumRegistro);
          try
            if (Trim(qryTicket.FieldByName('PRODUTO').asString) = 'R') then
              Write(fTicketR, GerarRegistro2)
            else
              Write(fTicketA, GerarRegistro2);
            memResult.Lines.Add('[Ok] Geração do Registro da Unidade de Entrega');
            memResult.Lines.Add('Empresa..: ' +
              IFF(Trim(qryTicket.FieldByName('UNIDENTREGA').asString) = '',
              qryNomeEstab.FieldByName('NOME').asString,
              qryTicket.FieldByName('UNIDENTREGA').asString));
            memResult.Lines.Add(Replicate('-', 105));
          except
            memResult.Lines.Add('[Erro] Geração do Registro da Unidade de Entrega');
            memResult.Lines.Add('Empresa..: ' +
              IFF(Trim(qryTicket.FieldByName('UNIDENTREGA').asString) = '',
              qryNomeEstab.FieldByName('NOME').asString,
              qryTicket.FieldByName('UNIDENTREGA').asString));
            memResult.Lines.Add(Replicate('-', 105));
          end;

          // ******************************************
          // Registro Tipo '3' - Pedido por Funcionário
          // ******************************************
          // Loop para todos os funcionários
          sAux := Trim(qryTicket.FieldByName('UNIDENTREGA').asString);
          repeat
            Inc(NumRegistro);

            try
              if (Trim(qryTicket.FieldByName('PRODUTO').asString) = 'R') then
                Write(fTicketR, GerarRegistro3_R)
              else
                Write(fTicketA, GerarRegistro3_A);
              memResult.Lines.Add('[Ok] Geração do Registro do Empregado');
              memResult.Lines.Add('Empregado..: ' +Trim(qryTicket.FieldByName('EMPREGADO').asString));
              memResult.Lines.Add(Replicate('-', 105));
            except
              memResult.Lines.Add('[Erro] Geração do Registro do Empregado');
              memResult.Lines.Add('Empregado..: ' +Trim(qryTicket.FieldByName('EMPREGADO').asString));
              memResult.Lines.Add(Replicate('-', 105));
            end;

            dUltValorProvento := qryTicket.FieldByName('BLOCAGEM').asInteger *
              String2Float(qryTicket.FieldByName('VLRFACIAL').asString);

            iQuantTot := iQuantTot + qryTicket.FieldByName('BLOCAGEM').asInteger;
            rValorTotRegTipo3 := rValorTotRegTipo3 + dUltValorProvento;
            Inc(iQuantEmpregados);

            if (rgFazIntegraCAP.ItemIndex = 0) then
              FazIntegraCAP;

            // Próximo Registro
            qryTicket.Next;
            frmAguarde.Pos := frmAguarde.Pos+1;
            frmAguarde.Update;
          until (qryTicket.EOF) or
                (Trim(qryTicket.FieldByName('UNIDENTREGA').asString) <> sAux);
        end
        else
          qryTicket.Last;
      until (qryTicket.EOF);

      // *************************************
      // Registro Tipo '9' - Registro Trailler
      // *************************************
      Inc(NumRegistro);

      try
        if (bPossuiRegR) then
          Write(fTicketR, GerarRegistro9_R);
        if (bPossuiRegA) then
          Write(fTicketA, GerarRegistro9_A);
        memResult.Lines.Add('[Ok] Geração do Registro Trailler');
        memResult.Lines.Add(Replicate('-', 105));
      except
        memResult.Lines.Add('[Erro] Geração do Registro Trailler');
        memResult.Lines.Add(Replicate('-', 105));
      end;

      frmAguarde.Apaga;
      // Finalizar a Integração com o CAP
      if (rgFazIntegraCAP.ItemIndex = 0) then
      begin
        if (FinalizarIntegraCAP) then
          ShowMessage('Arquivos e Integração com o Contas a Pagar gerados com sucesso!')
        else
          ShowMessage('Erros na geração da Integração com o Contas a Pagar!'+CR_LF+
                      'Arquivos Ticket gerados com sucesso!');
      end
      else
        ShowMessage('Arquivos gerados com sucesso!');
    except
      ShowMessage('Ocorreu um erro desconhecido durante a criação dos arquivos Ticket!');
    end;
  end
  else
    ShowMessage('Não há dados a serem processados ou estes estão incompletos!');

  // Finalizo o método adequadamente
  frmAguarde.Apaga;
  qryTicket.Close;
  if (bArqAberto) then
  begin
    if (bPossuiRegR) then
      CloseFile(fTicketR);
    if (bPossuiRegA) then
      CloseFile(fTicketA);
  end;

  pgctrlPaginas.ActivePageIndex := 4;
  bbtnSalvar.Enabled := true;
end;

function TfrmParamTICKETMagnetico.GerarRegistro0_R: string;
begin
  Result :=
    // 01-Tipo do registro
    '0'+
    // 02-Tipo de Ticket (Referição)
    'R'+
    // 03-Código do Cliente
    fValidaDados('N', edCodCli.Text, 10)+
    // 04-Nome da Empresa
    fValidaDados('A', qryNomeEstab.FieldByName('NOME').asString, 30)+
    // 05-Data do Pedido
    RetornaDataAMD(dtedDataPedido.Date,false)+
    // 06-Data da Entrega
    RetornaDataAMD(dtedDataEntrega.Date,false)+
    // 07-Tipo de Pedido (A-Comum)
    'A'+
    // 08-Espaços
    ' '+
    // 09-Relat. p/Assinat. (S / N)
    IFF(cbxRelAssinat.Checked,'S','N')+
    // 10-Pers. Linha 1 tkt
    IntToStr(cmbPersLinhaTkt1.ItemIndex)+
    // 11-Pers. Linha 2 tkt
    IntToStr(cmbPersLinhaTkt2.ItemIndex)+
    // 12-Pers. Linha 1 rot
    IntToStr(cmbPersLinhaRot1.ItemIndex)+
    // 13-Pers. Linha 2 rot
    IntToStr(cmbPersLinhaRot2.ItemIndex)+
    // 14-Recibo Encarte (S / N)
    IFF(cbxRecEncar.Checked,'S','N')+
    // 15-Relat. Gerencial (S / N)
    IFF(cbxRelGer.Checked,'S','N')+
    // 16-Relat. Resumo Unid (S / N)
    IFF(cbxRelResUnid.Checked,'S','N')+
    // 17-Espaços
    Replicate(' ',7)+
    // 17-Mês de Referência do Tickets
    PoeZero(cmbMes.ItemIndex+1)+
    // 18-Espaços
    Replicate(' ',19)+
    // 19-Tipo de Layout
    '04'+
    // 20-Espaços
    Replicate(' ',56)+
    // 21-Sequência (Número seqüencial no arquivo)
    Alinha(IntToStr(NumRegistro),6,'D','0')+CR_LF;
end;

function TfrmParamTICKETMagnetico.GerarRegistro0_A: string;
begin
  Result :=
    // 01-Tipo do registro
    '0'+
    // 02-Tipo de Ticket (Alimentação)
    'A'+
    // 03-Código do Cliente
    fValidaDados('N', edCodCli.Text, 10)+
    // 04-Nome da Empresa
    fValidaDados('A', qryNomeEstab.FieldByName('NOME').asString, 24)+
    // 05-Reservado
    Replicate(' ',6)+
    // 06-Data do Pedido
    RetornaDataAMD(dtedDataPedido.Date,false)+
    // 07-Data da Entrega
    RetornaDataAMD(dtedDataEntrega.Date,false)+
    // 08-Tipo de Pedido (Cartão)
    'C'+
    // 09-Reservado
    Replicate(' ',16)+
    // 10-Mês de Referência
    PoeZero(cmbMes.ItemIndex + 1)+
    // 11-Reservado
    Replicate(' ',19)+
    // 12-Tipo de Layout
    '04'+
    // 13-Tipo de Cartão
    '33'+
    // 14-Reservado
    Replicate(' ',54)+
    // 15-Sequência (Número seqüencial no arquivo)
    Alinha(IntToStr(NumRegistro),6,'D','0')+CR_LF;
end;

function TfrmParamTICKETMagnetico.GerarRegistro1(CCusto: string): string;
begin
  Result :=
    // 01-Tipo do registro
    '1'+
    // 02-Quantidade de Tickets
    fValidaDados('N', spedNumTicketsSupl.Text, 6)+
    // 03-Valor Unitário c/ 2 casa decimais
    fValidaDados('N', redValUnit.Text, 9)+
    // 04-Tipo de Ticket (R-Referição; A-Alimentação; V-Combustível)
    'R'+
    // 05-Acabamento (C-Car net; B-Blocado; S-Soldo)
    IFF(rgAcabSuplem.ItemIndex=0, 'C', IFF(rgAcabSuplem.ItemIndex=1, 'B', 'S'))+
    // 06-Quantidade de Tickets por Carnet
    fValidaDados('N', spedNumTicketsCarnet.Text, 2)+
    // 07-Nome da Unidade identico ao tipo 2
    fValidaDados('*', CCusto, 26)+
    // 08-Espaços
    Replicate(' ',108)+
    // 09-Sequência (Número seqüencial no arquivo)
    Alinha(IntToStr(NumRegistro),6,'D','0')+CR_LF;
end;

function TfrmParamTICKETMagnetico.GerarRegistro2: string;
var
  qryAux: TwwQuery;
  sUnidade, sCEP, sComplemCEP: string;
begin
  if (Trim(qryTicket.FieldByName('UNIDENTREGA').asString) = '') then
  begin
    qryAux      := qryEstab;
    sUnidade    := qryNomeEstab.FieldByName('NOME').asString;
    sCEP        := qryEstab.FieldByName('CEP').asString;
    sComplemCEP := qryEstab.FieldByName('CEP_COMPLEM').asString;
  end
  else
  begin
    qryAux      := qryTicket;
    sUnidade    := qryTicket.FieldByName('UNIDENTREGA').asString;
    sCEP        := Copy(qryTicket.FieldByName('CEP').asString,1,5);
    sComplemCEP := Copy(qryTicket.FieldByName('CEP').asString,7,3);
  end;

  Result :=
    // 01-Tipo do registro
    '2'+
    // 02-Nome da Unidade
    fValidaDados('*', sUnidade, 26)+
    // 03-Tipo do Logradouro e 04-Logradouro Propriamente Dito
    Val_End(qryAux.FieldByName('LOGRADOURO').asString)+
    // 05-Número
    fValidaDados('N', qryAux.FieldByName('NUMERO').asString, 6)+
    // 06-Complemento
    fValidaDados('A', qryAux.FieldByName('COMPLEMENTO').asString, 10)+
    // 07-Município
    fValidaDados('A', qryAux.FieldByName('CIDADE').asString, 25)+
    // 08-Bairro
    fValidaDados('A', qryAux.FieldByName('BAIRRO').asString, 15)+
    // 09-CEP
    fValidaDados('N', sCEP, 5)+
    // 10-UF
    fValidaDados('A', qryAux.FieldByName('ESTADO').asString, 2)+
    // 11-Interlocutor Resp. na Unidade
    fValidaDados('A', qryNomeResp.FieldByName('NOME').asString, 20)+
    // 12-Complem. CEP
    fValidaDados('N', sComplemCEP, 3)+
    // 13-Espaços
    Replicate(' ',7)+
    // 14-Sequência (Número seqüencial no arquivo)
    Alinha(IntToStr(NumRegistro),6,'D','0')+CR_LF;
end;

function TfrmParamTICKETMagnetico.GerarRegistro3_R: string;
begin
  Result :=
    // 01-Tipo do registro
    '3'+
    // 02-Código do Depto.
    fValidaDados('A', qryTicket.FieldByName('C_CUSTO').asString, 26)+
    // 03-Número de Identif. do Funcionário
    fValidaDados('N', qryTicket.FieldByName('MATRICULA').asString, 12)+
    // 04-Personalização montada pelo cliente
    fValidaDados('A', edPersTicket.Text, 26)+
    // 05-Nome da Unidade do Funcionário
    fValidaDados('*', sNomeUnidEntrega, 26)+
    // 06-Total de Tickets dos carnês do Funcionário
    // OBS: De acordo com a FUNCEF, este campo deve ser igual ao próximo
    fValidaDados('N', qryTicket.FieldByName('BLOCAGEM').asString, 3)+
    // 07-Quant. de Tickets deste valor facial
    fValidaDados('N', qryTicket.FieldByName('BLOCAGEM').asString, 2)+
    // 08-Valor Facial do Ticket
    fValidaDados('N', FormatFloat('#########0.00',
      String2Float(qryTicket.FieldByName('VLRFACIAL').asString)), 9)+
    // 09-Produto (R, L, A, V)
    qryTicket.FieldByName('PRODUTO').asString+
    // 10-Acabamento
    qryTicket.FieldByName('ACABAMENTO').asString+
    // 11-Nome do Funcionário
    fValidaDados('A', qryTicket.FieldByName('EMPREGADO').asString, 30)+
    // 12-Reservado
    Replicate(' ',17)+
    // 13-Sequência (Número seqüencial no arquivo)
    Alinha(IntToStr(NumRegistro),6,'D','0')+CR_LF;
end;

function TfrmParamTICKETMagnetico.GerarRegistro3_A: string;
begin
  Result :=
    // 01-Tipo do registro
    '3'+
    // 02-Código do Depto.
    fValidaDados('A', qryTicket.FieldByName('C_CUSTO').asString, 26)+
    // 03-Número de Identif. do Funcionário
    fValidaDados('N', qryTicket.FieldByName('MATRICULA').asString, 12)+
    // 04-Data de Nascimento
    fValidaDados('N', qryTicket.FieldByName('DATANASC').asString, 8)+
    // 05-Reservado
    Replicate(' ',18)+
    // 06-Nome da Unidade do Funcionário
    fValidaDados('*', sNomeUnidEntrega, 26)+
    // 07-Fixo
    '00101'+
    // 08-Valor
    fValidaDados('N', FormatFloat('#########0.00',
      qryTicket.FieldByName('BLOCAGEM').asInteger *
      String2Float(qryTicket.FieldByName('VLRFACIAL').asString)), 9)+
    // 09-Produto
    'A'+
    // 10-Fixo
    'E'+
    // 11-Nome do Funcionário
    fValidaDados('A', qryTicket.FieldByName('EMPREGADO').asString, 30)+
    // 12-Reservado
    Replicate(' ',17)+
    // 13-Sequência (Número seqüencial no arquivo)
    Alinha(IntToStr(NumRegistro),6,'D','0')+CR_LF;
end;

function TfrmParamTICKETMagnetico.GerarRegistro9_R: string;
begin
  Result :=
    // 01-Tipo do registro
    '9'+
    // 02-Quantidade Total dos Tickets solicitados
    fValidaDados('N', IntToStr(iQuantEmpregados), 8)+
    // 03-Valor da Total dos Tickets
    fValidaDados('N', FormatFloat('#########0.00',rValorTotRegTipo1 + rValorTotRegTipo3), 14)+
    // 04-Espaços
    Replicate(' ',131)+
    // 05-Sequência (Número seqüencial no arquivo)
    Alinha(IntToStr(NumRegistro),6,'D','0')+CR_LF;
end;

function TfrmParamTICKETMagnetico.GerarRegistro9_A: string;
begin
  Result :=
    // 01-Tipo do registro
    '9'+
    // 02-Quantidade Total de Empregados (Total de Registros Tipo 3)
    fValidaDados('N', IntToStr(iQuantTot), 8)+
    // 03-Valor da Total dos Tickets
    fValidaDados('N', FormatFloat('#########0.00',rValorTotRegTipo3), 14)+
    // 04-Reservado
    Replicate(' ',131)+
    // 05-Sequência (Número seqüencial no arquivo)
    Alinha(IntToStr(NumRegistro),6,'D','0')+CR_LF;
end;

procedure TfrmParamTICKETMagnetico.LeAlteracoes;
var
  sLePadrao: string;
begin
  // Recupera as últimas alterações das opções
  //ArqConfig := TIniFile.Create('C:\CONFIG_FOLHAPAGTO.INI');
  ArqConfig := TIniFile.Create(Sistema.RetornaCaminhoArquivos(Sistema.IdEmpresa)+'\CONFIG_FOLHAPAGTO.INI');//Ádler Teodoro de Souza SOL 109421 KINTANA 496332

  edCodCli.Text     := ArqConfig.ReadString('MAG_TICKET', 'CodCliente', '');
  edPersTicket.Text := ArqConfig.ReadString('MAG_TICKET', 'PersTicket', '');

  cbxRecEncar.Checked   := (ArqConfig.ReadString('MAG_TICKET', 'ReciboEncarte'  , 'F') = 'V');
  cbxRelAssinat.Checked := (ArqConfig.ReadString('MAG_TICKET', 'RelatAssinatura', 'F') = 'V');
  cbxRelGer.Checked     := (ArqConfig.ReadString('MAG_TICKET', 'RelatGerencial' , 'F') = 'V');
  cbxRelResUnid.Checked := (ArqConfig.ReadString('MAG_TICKET', 'RelatResumoUnid', 'F') = 'V');

  rgTipSigla.ItemIndex       := StrToInt(ArqConfig.ReadString('MAG_TICKET', 'TipSiglaCCust', '0'));
  cmbPersLinhaTkt1.ItemIndex := StrToInt(ArqConfig.ReadString('MAG_TICKET', 'PersLinhaTkt1', '0'));
  cmbPersLinhaTkt2.ItemIndex := StrToInt(ArqConfig.ReadString('MAG_TICKET', 'PersLinhaTkt2', '0'));
  cmbPersLinhaRot1.ItemIndex := StrToInt(ArqConfig.ReadString('MAG_TICKET', 'PersLinhaRot1', '0'));
  cmbPersLinhaRot2.ItemIndex := StrToInt(ArqConfig.ReadString('MAG_TICKET', 'PersLinhaRot2', '0'));

  sLePadrao := ArqConfig.ReadString('MAG_TICKET', 'Estabelecimento', '');
  if (sLePadrao = '') then
  begin
    qryNomeEstab.First;
    sLePadrao := qryNomeEstab.FieldByName('IDPESSOA').asString;
  end
  else
    qryNomeEstab.Locate('IDPESSOA', sLePadrao, [loCaseInsensitive]);
  dblkcbEstab.LookUpValue := sLePadrao;
  dblkcbEstab.UpDate;

  sLePadrao := ArqConfig.ReadString('MAG_TICKET', 'Responsavel', '');
  if (sLePadrao = '') then
  begin
    qryNomeResp.First;
    sLePadrao := qryNomeResp.FieldByName('IDPESSOA').asString;
  end
  else
    qryNomeResp.Locate('IDPESSOA', sLePadrao, [loCaseInsensitive]);
  dblkcbResp.LookUpValue := sLePadrao;
  dblkcbResp.UpDate;
end;

procedure TfrmParamTICKETMagnetico.GravaAlteracoes;
var
  sGravaPadrao: string;
begin
  ArqConfig.WriteString('MAG_TICKET', 'CodCliente', edCodCli.Text);
  ArqConfig.WriteString('MAG_TICKET', 'PersTicket', edPersTicket.Text);

  sGravaPadrao := IFF(cbxRecEncar.Checked,'V','F');
  ArqConfig.WriteString('MAG_TICKET', 'ReciboEncarte'  , sGravaPadrao);

  sGravaPadrao := IFF(cbxRelAssinat.Checked,'V','F');
  ArqConfig.WriteString('MAG_TICKET', 'RelatAssinatura', sGravaPadrao);

  sGravaPadrao := IFF(cbxRelGer.Checked,'V','F');
  ArqConfig.WriteString('MAG_TICKET', 'RelatGerencial' , sGravaPadrao);

  sGravaPadrao := IFF(cbxRelResUnid.Checked,'V','F');
  ArqConfig.WriteString('MAG_TICKET', 'RelatResumoUnid', sGravaPadrao);

  sGravaPadrao := IntToStr(rgTipSigla.ItemIndex);
  ArqConfig.WriteString('MAG_TICKET', 'TipSiglaCCust', sGravaPadrao);

  sGravaPadrao := IntToStr(cmbPersLinhaTkt1.ItemIndex);
  ArqConfig.WriteString('MAG_TICKET', 'PersLinhaTkt1', sGravaPadrao);

  sGravaPadrao := IntToStr(cmbPersLinhaTkt2.ItemIndex);
  ArqConfig.WriteString('MAG_TICKET', 'PersLinhaTkt2', sGravaPadrao);

  sGravaPadrao := IntToStr(cmbPersLinhaRot1.ItemIndex);
  ArqConfig.WriteString('MAG_TICKET', 'PersLinhaRot1', sGravaPadrao);

  sGravaPadrao := IntToStr(cmbPersLinhaRot2.ItemIndex);
  ArqConfig.WriteString('MAG_TICKET', 'PersLinhaRot2', sGravaPadrao);

  ArqConfig.WriteString('MAG_TICKET', 'Estabelecimento',qryNomeEstab.FieldByName('IDPESSOA').asString);
  ArqConfig.WriteString('MAG_TICKET', 'Responsavel'    ,qryNomeResp.FieldByName('IDPESSOA').asString);
end;

function TfrmParamTICKETMagnetico.SelTipoContrato: string;
begin
  sAux := '';
  if (cbxEfetivos.Checked) then
    sAux := QuotedStr('E');

  if (cbxEspeciais.Checked) then
    if (length(sAux) > 0) then
      sAux := sAux +','+ QuotedStr('S')
    else
      sAux := QuotedStr('S');

  if (cbxTemporarios.Checked) then
    if (length(sAux) > 0) then
      sAux := sAux +','+ QuotedStr('T')
    else
      sAux := QuotedStr('T');

  if (cbxTerceiros.Checked) then
    if (length(sAux) > 0) then
      sAux := sAux +','+ QuotedStr('3')
    else
      sAux := QuotedStr('3');

  if (cbxProprietarios.Checked) then
    if (length(sAux) > 0) then
      sAux := sAux +','+ QuotedStr('P')
    else
      sAux := QuotedStr('P');

  if (cbxAutonomos.Checked) then
    if (length(sAux) > 0) then
      sAux := sAux +','+ QuotedStr('A')
    else
      sAux := QuotedStr('A');

  if (cbxEstagiarios.Checked) then
    if (length(sAux) > 0) then
      sAux := sAux +','+ QuotedStr('G')
    else
      sAux := QuotedStr('G');

  Result := sAux;
end;

procedure TfrmParamTICKETMagnetico.MontaListaFuncionarios;
begin
  if (dblkcbEstab.Text <> '') then
  begin
    dmCds.qry.Close;
    ListaCodFunc.Clear;
    chklstFunc.Items.Clear;

    with (dmCds.qry.SQL) do
    begin
      Clear;
      Add('SELECT');
      Add('  PF.IDPESSOA, PF.NOME');
      Add('FROM');
      Add('  PESSOA PF, FUNCIONARIO F, SITFUNC ST');
      Add('WHERE');
      Add('  (F.IDESTAB         = ' +qryNomeEstab.FieldByName('IDPESSOA').asString+ ') AND');
      Add('  (ST.TIPOSIT        = ''A'') AND');

      // C. de Custo(s) habilitados para o usuário
      if (sUsuXccusto <> '') then
      begin
        if (Pos(',',sUsuXccusto) > 0) then
          Add('  (F.CODCENTROCUSTO IN ' +sUsuXccusto+ ') AND')
        else
          Add('  (F.CODCENTROCUSTO  = ' +sUsuXccusto+ ') AND');
      end;

      sAux := SelTipoContrato;
      if (Pos(',',sAux) > 0) then
        Add('  (F.TIPOCONTRATO    IN (' +sAux+ ')) AND')
      else
        Add('  (F.TIPOCONTRATO     = ' +sAux+ ') AND');

      Add('  (ST.IDSITFUNC      = F.IDSITFUNC) AND');
      Add('  (F.IDPESSOA        = PF.IDPESSOA)');
      Add('ORDER BY');
      Add('  UPPER(NOME)');
    end;
    dmCds.qry.Open;

    while not(dmCds.qry.EOF) do
    begin
      ListaCodFunc.Add(dmCds.qry.FieldByName('IDPESSOA').asString);
      chklstFunc.Items.Add(dmCds.qry.FieldByName('NOME').asString);
      dmCds.qry.Next;
    end;
  end;
end;

procedure TfrmParamTICKETMagnetico.SelecionaEstab;
begin
  frmAguarde.Pos := frmAguarde.Min;
  frmAguarde.pbAguarde.Visible := false;
  frmAguarde.Mostra('Selecionando Estabelecimento...');
  frmAguarde.Update;

  qryEstab.Close;
  qryEstab.ParamByName('IDPESSOA').asString := qryNomeEstab.FieldByName('IDPESSOA').asString;
  qryEstab.Open;

  frmAguarde.Apaga;
end;

function TfrmParamTICKETMagnetico.VerificaOpcoesOk: boolean;
begin
  Result := false;
  frmAguarde.Apaga;

  // Verifica o Código do Cliente preenchido
  if (Trim(edCodCli.Text) = '') then
  begin
    MsgDlg('Código do Cliente não preenchido!','Erro', mtInformation,[mbOK,mbHelp],0);
    pgctrlPaginas.ActivePageIndex := 0;
    edCodCli.SetFocus;
    exit;
  end;

  // Verifica o Estabelecimento selecionado
  if (Trim(dblkcbEstab.Text) = '') then
  begin
    MsgDlg('Estabelecimento não foi selecionado!','Erro', mtInformation,[mbOK,mbHelp],0);
    pgctrlPaginas.ActivePageIndex := 0;
    dblkcbEstab.SetFocus;
    exit;
  end;

  SelecionaEstab;
  // Verifica os dados do Estabelecimento selecionado
  if (qryEstab.IsEmpty) then
  begin
    MsgDlg('Dados do Estabelecimento selecionado não estão completos!','Erro', mtInformation,[mbOK,mbHelp],0);
    pgctrlPaginas.ActivePageIndex := 0;
    dblkcbResp.SetFocus;
    exit;
  end;

  // Verifica o Responsável pela informação
  if (Trim(dblkcbResp.Text) = '') then
  begin
    MsgDlg('Dados do Responsável selecionado não foi preenchido!','Erro', mtInformation, [mbOK,mbHelp],0);
    pgctrlPaginas.ActivePageIndex := 0;
    dblkcbResp.SetFocus;
    exit;
  end;

  // Verifica a Personalização do Ticket preenchido
  if (spedNumTicketsSupl.Value > 0) then
  begin
    if (redValUnit.Value <= 0) then
    begin
      MsgDlg('Valor Unitário para o pedido suplementar não foi preenchido!','Erro', mtInformation, [mbOK,mbHelp], 0);
      pgctrlPaginas.ActivePageIndex := 2;
      redValUnit.SetFocus;
      exit;
    end;

    if (spedNumTicketsCarnet.Value <= 0) then
    begin
      MsgDlg('Quantidade de Tickets por Carnê não foi preenchido !','Erro', mtInformation, [mbOK,mbHelp], 0);
      pgctrlPaginas.ActivePageIndex := 2;
      spedNumTicketsCarnet.SetFocus;
      exit;
    end;
  end;

  // Verifica a Personalização do Ticket preenchido
  if (Trim(edPersTicket.Text) = '') and
     (MsgDlg('Personalização do Ticket não foi preenchida! Deseja continuar?', 'Aviso', mtInformation, [mbYes,mbNo], 0) = mrNo) then
  begin
    pgctrlPaginas.ActivePageIndex := 1;
    edPersTicket.SetFocus;
    exit;
  end;

  // Abro o diálogo de seleção do arquivo
  //if not(DirectoryExists('C:\TICKET')) then
  if not(DirectoryExists(Sistema.RetornaCaminhoArquivos(Sistema.IdEmpresa)+'\TICKET')) then //Ádler Teodoro de Souza SOL 109421 KINTANA 496332
  begin
    //ProcuraDirDlg.Directory := 'C:\';
    ProcuraDirDlg.Directory := Sistema.RetornaCaminhoArquivos(Sistema.IdEmpresa)+ '\';//Ádler Teodoro de Souza SOL 109421 KINTANA 496332
    //if (MsgDlg('Pasta C:\TICKET não foi encontrada!'+CR_LF+
    if (MsgDlg('Pasta '+ Sistema.RetornaCaminhoArquivos(Sistema.IdEmpresa)+ '\TICKET não foi encontrada!'+CR_LF+ //Ádler Teodoro de Souza SOL 109421 KINTANA 496332
               'Deseja criá-la agora?', 'Aviso', mtInformation, [mbYes,mbNo], 0) = mrYes) then
    begin
      //CreateDir('C:\TICKET');
      CreateDir(Sistema.RetornaCaminhoArquivos(Sistema.IdEmpresa)+'\TICKET');//Ádler Teodoro de Souza SOL 109421 KINTANA 496332
      //ProcuraDirDlg.Directory := 'C:\TICKET';
      ProcuraDirDlg.Directory := Sistema.RetornaCaminhoArquivos(Sistema.IdEmpresa)+'\TICKET';//Ádler Teodoro de Souza SOL 109421 KINTANA 496332


    end
    else
    if not(ProcuraDirDlg.Execute) then
      exit;
  end;

  // Verifica se o arquivo existe na pasta escolhida
  if ((FileExists(ProcuraDirDlg.Directory+'TicketR.TXT')) or
      (FileExists(ProcuraDirDlg.Directory+'TicketA.TXT'))) and
     (MsgDlg('Já existem arquivos com nomes iguais aos que serão gerados na pasta indicada!'+CR_LF+
             'Deseja sobrescrevê-los?', 'Aviso', mtConfirmation, [mbYes,mbNo], 0) = mrNo) then
    exit;

  Result := true;
end;

function TfrmParamTICKETMagnetico.Val_End(sEnd: string): string;
var
  c: byte;
  sTipoEnd: string;
begin
  sTipoEnd := '';
  for c:=1 to length(sEnd) do
    if (sEnd[c] <> ' ') then
      sTipoEnd := sTipoEnd + sEnd[c]
    else
      break;

  sAux   := Copy(sEnd, c+1, length(sEnd)-c);
  Result := ConverteCar(Alinha(UpperCase(Copy(sTipoEnd,1,4)), 4,'E',' ') +
            Alinha(UpperCase(Copy(sAux,1,30))   ,30,'E',' '));
end;

function TfrmParamTICKETMagnetico.FinalizarIntegraCAP: boolean;
begin
(*var
  sMesRef: string;
  dTotal: double;
  iUltIdBanco, iPortadorFormaDefault, iCodDocumento: integer;
begin
  sMesRef := speAno.Text +'/'+ PoeZero(cmbMes.ItemIndex + 1);

  AbreTempDocum(tblDocumentos); // query que contém todos os documentos
  // criados neste processo, que serão (ao final do mesmo) atualizados
  // com o número da planilha contábil (plncodigo) gerada na contabilização

  with (dmCds.qry) do
  begin
    iPortadorFormaDefault:=0; iUltIdBanco:=0;
    Close;
    SQL.Clear;
    SQL.Add('SELECT CODPORTFORMA FROM BANCOPORTFOLHA WHERE (IDBANCO IS NULL)');
    Open;

    if not(IsEmpty) then
      iPortadorFormaDefault := FieldByName('CODPORTFORMA').asInteger;

    Close;

    SQL.Clear;
    SQL.Add('SELECT PC.IDBANCO');
    SQL.Add('FROM');
    SQL.Add('  PORTADORFORMA PF, PORTADORCONTA PC');
    SQL.Add('WHERE');
    SQL.Add('  (PF.CODPORTFORMA = ' +IntToStr(iPortadorFormaDefault)+ ') AND');
    SQL.Add('  (PF.CODPORTADOR  = PC.CODPORTADOR)');
    Open;

    if not(IsEmpty) then
      iUltIdBanco := FieldByName('IDBANCO').asInteger;

    Close;
  end;

  tblDocumentos.First;
  dTotal:=0;
  while not(tblDocumentos.EOF) do
  begin
    if (tblDocumentos.FieldByName('DEBCRE').asString = 'D') then
       dTotal := dTotal + tblDocumentos.FieldByName('VALOR').asFloat
    else
       dTotal := dTotal - tblDocumentos.FieldByName('VALOR').asFloat;

    tblDocumentos.Next;
  end;

  try
    iCodDocumento := DescarregaQryDocumentos(tblDocumentos, iUltIdBanco, 0,
      IntToStr(iPortadorFormaDefault), Copy(sMesRef,5,2), Copy(sMesRef,1,4),
      dTotal, StrToDate(dtPagamento.Text), Documento, chkRateioCC.Checked);

    dmCds.dbBaseDados.Commit;
    Result := true;
  except
    dmCds.dbBaseDados.Rollback;
    Result := false;
  end;*)
  Result := true;
end;

procedure TfrmParamTICKETMagnetico.FazIntegraCAP;
begin
(*var
  sMensagemErroCAP: string;
begin
  if not(AlimentaQryDocumentos(tblDocumentos,
         -1,
         -1,
         -1,
         IFF(frmPrincipal.prmUnidNegoc <> 0, frmPrincipal.prmUnidNegoc, -1),
         iPortadorFormaDefault,
         cmprocFonecedor.ForCliReg.Id,
         '',
         frmPrincipal.prmCodCentroRespon,
         qryTipoDesenb.FieldByName('CODTIPRECDES').asString,
         'D',
         dUltValorProvento,
         sMensagemErroCAP,
         0,
         IFF(chkRateioCC.Checked,qryTicket.FieldByName('CODCENTROCUSTO').asString,''))) then
  begin
    memResult.Lines.Add('[Erro] Geração dos dados para o Contas a Pagar');
    memResult.Lines.Add('Empregado..: ' +qryTicket.FieldByName('EMPREGADO').asString);
    memResult.Lines.Add(sMensagemErroCAP);
    memResult.Lines.Add('---------------------------------------------------');
  end
  else
  begin
    memResult.Lines.Add('[Ok] Geração dos dados para o Contas a Pagar');
    memResult.Lines.Add('Empregado..: ' +qryTicket.FieldByName('EMPREGADO').asString);
    memResult.Lines.Add('---------------------------------------------------');
  end;*)
end;

end.
