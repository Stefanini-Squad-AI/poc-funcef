{
--------------------------------------------------------------------------------------------------
Atender.....: WO8140
Data........: 22/02/2024
Responsável.: Helen Bianchi
Descrição...: Ajuste para atualizar IDMOTIVO e DATAALTERFUNC (Campos chaves)
--------------------------------------------------------------------------------------------------
Nº SIG......: 43010
Data........: 01/09/2022
Responsável.: Luis Ferrari
Descrição...: Incluir novo na tabela Evolfunc e alterado pergunta de lugar com nova variavel no CmeCadastroConfirma
--------------------------------------------------------------------------------
N. SIG..........: 27758
Data............: 25/10/2016
Responsável.....: MSMT - Michelle Mota
Descrição.......: Add campos de diretoria, nível salarial do cargo e da função do empregado.
                  Opção de maximizar o tamanho da janela da funcionalidade. Alguns ajustes de leiaute
                  da tela também serão realizados.
Local alterações: DFM - RNG01, dsDetStateChange, AtualizaDiretoria, Sel, dblcLotacChange, FormCreate,
                  sbtnExcluiDetClick, sbtnInsDetClick, dbedDatEfetExit, rgAltSalarioClick,
                  dblcLotacChange e sbtnAltDetClick .
--------------------------------------------------------------------------------------------------
N. Sol..........: 221471
N. Kintana......: 2054151
Data............: 29/11/2013
Responsável.....: Fernando Xavier
Descrição.......: Incluir novos campos das telas de Registro de Alteração Funcional e Cadastro de Pessoal.
--------------------------------------------------------------------------------------------------
N. Sol..........: 188194
N. Kintana......: 1779198
Data............: 25/03/2013
Responsável.....: Higor Nayde Ferreira
Descrição.......: Incluir novos campos das telas de Registro de Alteração Funcional e Cadastro de Pessoal.
--------------------------------------------------------------------------------------------------
N. Sol..........: 205930
N. Kintana......: 1991130
Data............: 02/05/2013
Responsável.....: Thiago Melo
Descrição.......: Não esta sendo persistido o tipo de envento no cadastro de Registro de Alteração
----------------------------------------------------------------------------------------------------
N. Sol..........: 177516
N. Kintana......: 1658128 
Data............: 02/10/2012
Responsável.....: Thiago Melo
Descrição.......: Erro no percentual de reajuste da alteração funciona
{ --------------------------------------------------------------------------------------------------
N. Sol..........: 188047
N. Kintana......: 1774190
Data............: 23/08/2012
Responsável.....: Mosé Cornetta
Descrição.......: Apenas trazer analiticos e ativos
{ --------------------------------------------------------------------------------------------------
N. Sol..........: 177441
N. Kintana......: 1635442
Data............: 14/06/2012
Responsável.....: Felipe Santos
DFM.............: Alteração somente em DFM    
Descrição.......: No campo centro de custo foi alterado a busca, que agora é feita por nome
                  não mais pelo Código, o campo cinza ao lado ficou com a propriedade visible false.
{ --------------------------------------------------------------------------------------------------
N. Sol..........: 171426
N. Kintana......: 1537613
Data............: 10/03/2012
Responsável.....: Edilaine Ferraresi
Descrição.......: Inclusão de novas faixas salariais (de 9 para 20)
{ --------------------------------------------------------------------------------------------------
Rotina......: CmeDetalheInsert
Nº SOL......: 142865
Nº KINTANA..: 917808
Data........: 12/07/2011
Responsável.: Thaise Amaral Martins
Descrição...: O campo IDCHEFE da tabela Funcionario passará a receber o ID correspondente ao
              responsável do respectivo Centro de Custo Vinculado.
-------------------------------------------------------------------------------------------------- }
unit fCadRegEvol;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs, IvDictio, IvMulti,
  MontaSelect, DBTables, Db, Wwdatsrc, TB97Ctls, MAHlpBtn, TB97Tlbr, StdCtrls, TB97, Buttons,
  Grids, Wwdbigrd, Wwdbgrid, ComCtrls, TabControlDetalhe, ExtCtrls, Mask, DBCtrls, CMProcura,
  wwdbedit, TREdit, wwdbdatetimepicker, CMDateTimePicker, wwdblook, ImgList, DBClient,
  CmEventosCadastro, uCMClientDataSet, fCadastroMestreDetMT, TB97Tlwn, Wwdbspin,
  uCtrlCargo, uCtrlGlobalRH, uCtrlPessoaFilialPessoa, uCtrlPessoaFuncionario, uCtrlMotivo,
  uCtrlFaixaSal, uCtrlListTerceirosRH, uCtrlEvolFunc, uCtrlSitFunc, uCtrlTabelaHay,
  uCtrlPpraCipa, uCtrlIntegraPrevRH, IvEMulti, Wwquery;

type
  TfrmCadRegEvol = class(TFrmCadastroMestreDetMT)
    Label2: TLabel;
    dblcTipoEv: TwwDBLookupCombo;
    rgAltSalario: TRadioGroup;
    gbxSalario: TGroupBox;
    Label5: TLabel;
    Label8: TLabel;
    gbxCargo: TGroupBox;
    dblcCargo: TwwDBLookupCombo;
    gbxLotacao: TGroupBox;
    dblcEstab: TwwDBLookupCombo;
    dblcLotac: TwwDBLookupCombo;
    Label4: TLabel;
    dbedDatEfet: TCMDateTimePicker;
    Label3: TLabel;
    Label7: TLabel;
    dbedSalario: TDBRealEdit;
    dbedPerc: TDBRealEdit;
    gbxStepsFaixa: TGroupBox;
    cmbSteps: TComboBox;
    dbedNomeCC: TwwDBEdit;
    Toolbar972: TToolbar97;
    sbtnImprimirEtiqueta: TSpeedButton;
    gbxCargo2: TGroupBox;
    CdsDet: TCMClientDataSet;
    CdsMotivo: TCMClientDataSet;
    CdsEstab: TCMClientDataSet;
    CdsCargo2: TCMClientDataSet;
    CdsLotacao: TCMClientDataSet;
    CdsFaixa: TCMClientDataSet;
    CdsCargo: TCMClientDataSet;
    CdsParamRH: TCMClientDataSet;
    Label1: TLabel;
    Label10: TLabel;
    dbedMat: TwwDBEdit;
    dbedNome: TwwDBEdit;
    edSitFunc: TEdit;
    edCargo: TEdit;
    bbtnEmpresas: TBitBtn;
    CdsEmpresa: TCMClientDataSet;
    townEmpresas: TToolWindow97;
    btnOkMudar: TBitBtn;
    btnCancelarMudar: TBitBtn;
    gbxEmpresas: TGroupBox;
    dblcEmpresas: TwwDBLookupCombo;
    gbxTransfer: TGroupBox;
    cbxFichaFin: TCheckBox;
    cbxLancamentos: TCheckBox;
    townCargoAlternativo: TToolWindow97;
    bbtnFechar: TBitBtn;
    gbxCargoAlt: TGroupBox;
    dblcFuncao: TwwDBLookupCombo;
    gbxFaixa2: TGroupBox;
    Label28: TLabel;
    dbspeStep2: TwwDBSpinEdit;
    dblckFaixa2: TwwDBLookupCombo;
    bbtnAtivarCargoAlt: TBitBtn;
    CdsFaixa2: TCMClientDataSet;
    gbxFaixa1: TGroupBox;
    Label27: TLabel;
    dbspeStep1: TwwDBSpinEdit;
    dblckFaixa1: TwwDBLookupCombo;
    dbrgTipoSalar: TDBRadioGroup;
    dbedFuncao: TDBRealEdit;
    dbedPercFuncao: TDBRealEdit;
    Label6: TLabel;
    Label9: TLabel;
    dbedSalTotal: TDBRealEdit;
    Label11: TLabel;
    dbgrdDetIButton: TwwIButton;
    Panel1: TPanel;
    Panel2: TPanel;
    Label12: TLabel;
    Label13: TLabel;
    lblDiretoria: TLabel;
    edtDIRETORIA: TwwDBEdit;
    CdsAux: TCMClientDataSet;
    qryAux: TwwQuery;
    procedure FormCreate(Sender: TObject);
    procedure rgAltSalarioClick(Sender: TObject);
    procedure cmbStepsChange(Sender: TObject);
    procedure bbtnOkDetClick(Sender: TObject);
    procedure dsDetStateChange(Sender: TObject);
    procedure dbedSalarioChange(Sender: TObject);
    procedure dbedPercChange(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure dbedDatEfetExit(Sender: TObject);
    procedure sbtnImprimirEtiquetaClick(Sender: TObject);
    procedure CmeCadastroConfirma(Sender: TObject);
    procedure CmeDetalheInsert(Sender: TObject);
    procedure CmeCadastroFind(Sender: TObject);
    procedure CdsDetBeforePost(DataSet: TDataSet);
    procedure dblcCargoChange(Sender: TObject);
    procedure CmeCadastroAfterConfirma(Sender: TObject);
    procedure CmeCadastroApplyEdit(sender: TObject; var Accept: Boolean);
    procedure dblcTipoEvChange(Sender: TObject);
    procedure dblcFuncaoChange(Sender: TObject);
    procedure dblcEstabChange(Sender: TObject);
    procedure dblcLotacChange(Sender: TObject);
    procedure bbtnConfirmarClick(Sender: TObject);
    procedure btnOkMudarClick(Sender: TObject);
    procedure btnCancelarMudarClick(Sender: TObject);
    procedure bbtnEmpresasClick(Sender: TObject);
    procedure bbtnCancelarDetClick(Sender: TObject);
    procedure bbtnVoltarDetClick(Sender: TObject);
    procedure bbtnAtivarCargoAltClick(Sender: TObject);
    procedure bbtnFecharClick(Sender: TObject);
    procedure dblckFaixa1Change(Sender: TObject);
	//Monica - 142865/6462
    procedure sbtnExcluiDetClick(Sender: TObject);
    procedure sbtnInsDetClick(Sender: TObject);
    procedure sbtnAltDetClick(Sender: TObject);
    procedure bbtnCancelarClick(Sender: TObject);
    procedure CdsDetAfterDelete(DataSet: TDataSet);
    procedure CdsDetAfterPost(DataSet: TDataSet);
    procedure dbedFuncaoChange(Sender: TObject); 		//Higor Nayde Ferreira Sol 188194 - Kintana 1779198
    procedure dbedPercFuncaoChange(Sender: TObject);
    procedure CdsDetBeforeDelete(DataSet: TDataSet);
    procedure dbedDatEfetKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure dbedDatEfetChange(Sender: TObject);
    procedure dblcCargoExit(Sender: TObject);	//Higor Nayde Ferreira Sol 188194 - Kintana 1779198

    private
    CtrlEvolFunc: TCtrlEvolFunc;
    CtrlPessoaFuncionario: TCtrlPessoaFuncionario;
    CtrlPessoaFilialPessoa: TCtrlPessoaFilialPessoa;
    CtrlMotivo: TCtrlMotivo;
    CtrlFaixaSal: TCtrlFaixaSal;
    CtrlCargo: TCtrlCargo;
    CtrlListTerceirosRH: TCtrlListTerceirosRH;
    CtrlGlobalRH: TCtrlGlobalRH;
    CtrlSitFunc: TCtrlSitFunc;
    CtrlTabelaHay: TCtrlTabelaHay;
    CtrlPpraCipa: TCtrlPpraCipa;
    CtrlIntegraPrevRH: TCtrlIntegraPrevRH;

    IndPolitica: integer;
    SalRef: real;
    FunRef: real;			//Higor Nayde Ferreira Sol 188194 - Kintana 1779198
    SalFunant: real;
    CargoSal : integer;
    SalarioAtual : real;
    DataSalario :string;
    DataSalario2 :string;
    Funcao : Integer;
    SalFunAtual:real;
    bMudouEmpresa: boolean;	//Higor Nayde Ferreira Sol 188194 - Kintana 1779198
    sintegra : Boolean;       // SIG 43010

    bexclui: Boolean;//Monica - 142865/6462
    iIdMotivo      : Integer; //Helen- WO8140
    dDataAlterFunc : tDateTime;    //Helen - WO8140
    procedure Sel(IdPessoa: double);
    function  GravarRegistro: boolean;
    procedure TestaSeMudouEmpresa;
    procedure AtualizaDiretoria; // Michelle Mota - SIG27758 - RNG04
  end;

var
  frmCadRegEvol: TfrmCadRegEvol;
  GuardaCCusto: string;
  AlteraRegistro : Boolean; // Michelle Mota - SIG27758

implementation

uses uCMTypes, uModulo, uSistema, uMensErro, uCtrlPadroes, uCtrlFuncoesRH, dCds, fAguarde,
  REtiquetaAlteracaoCTPS, uCtrlUsoGeralRH;

{$R *.DFM}

procedure TfrmCadRegEvol.FormCreate(Sender: TObject);
var
  c: integer;
begin
  inherited;
  bMudouEmpresa := False;
  CtrlEvolFunc := TCtrlEvolFunc.Create;
  CtrlEvolFunc.InitializeAs(Padroes);
  CtrlEvolFunc.CdsFuncionario := Cds;
  CtrlEvolFunc.CdsEvolFunc := CdsDet;

  CtrlPessoaFuncionario := TCtrlPessoaFuncionario.Create(CtrlUsoGeralRH.UsuXFilial,
    CtrlUsoGeralRH.UsuXCCusto, CtrlUsoGeralRH.IdUsuarioGeral);
  CtrlPessoaFuncionario.InitializeAs(Padroes);

  CtrlPessoaFilialPessoa := TCtrlPessoaFilialPessoa.Create(CtrlUsoGeralRH.UsuXFilial,
    CtrlUsoGeralRH.UsuXCCusto, CtrlUsoGeralRH.IdUsuarioGeral);
  CtrlPessoaFilialPessoa.InitializeAs(Padroes);

  CtrlMotivo := TCtrlMotivo.Create;
  CtrlMotivo.InitializeAs(Padroes);

  CtrlFaixaSal := TCtrlFaixaSal.Create(Sistema.IdEmpresa);
  CtrlFaixaSal.InitializeAs(Padroes);

  CtrlCargo := TCtrlCargo.Create;
  CtrlCargo.InitializeAs(Padroes);

  CtrlListTerceirosRH := TCtrlListTerceirosRH.Create(CtrlUsoGeralRH.UsuXFilial,
    CtrlUsoGeralRH.UsuXCCusto, CtrlUsoGeralRH.IdUsuarioGeral);
  CtrlListTerceirosRH.InitializeAs(Padroes);

  CtrlGlobalRH := TCtrlGlobalRH.Create;
  CtrlGlobalRH.InitializeAs(Padroes);

  CtrlSitFunc := TCtrlSitFunc.Create;
  CtrlSitFunc.InitializeAs(Padroes);

  CtrlTabelaHay := TCtrlTabelaHay.Create;
  CtrlTabelaHay.InitializeAs(Padroes);

  CtrlPpraCipa := TCtrlPpraCipa.Create;
  CtrlPpraCipa.InitializeAs(Padroes);

  CtrlIntegraPrevRH := TCtrlIntegraPrevRH.Create;
  CtrlIntegraPrevRH.InitializeAs(Padroes);

  CdsEmpresa.Data := CtrlPpraCipa.ListEmpresaProp;
  bbtnEmpresas.Visible := (CdsEmpresa.RecordCount > 1);

  CdsEstab.Data := CtrlPessoaFilialPessoa.ListPessoaEstab(IntToStr(Sistema.IdEmpresa));
  CdsLotacao.Data := CtrlListTerceirosRH.ListCCusto(IntToStr(Sistema.IdEmpresa));

  CdsParamRH.Data := CtrlGlobalRH.GetParamRH('NUMSTEPS, FLGDOISCARGOS, FLGNIVELINDIV,'+
    'INDPOLITICA, TITSTEP1, TITSTEP2, TITSTEP3, TITSTEP4, TITSTEP5, TITSTEP6, '+
    'TITSTEP7, TITSTEP8, TITSTEP9,'+
    'TITSTEP10, TITSTEP11, TITSTEP12, TITSTEP13, TITSTEP14, TITSTEP15, TITSTEP16, '+ // Edilaine Ferraresi - SOL 171426 / KTN 1537613
    'TITSTEP17, TITSTEP18, TITSTEP19, TITSTEP20'); // Edilaine Ferraresi - SOL 171426 / KTN 1537613
  CdsMotivo.Data := CtrlMotivo.ListMotivo_Id_e_Descricao('A');
  CdsCargo.Data := CtrlCargo.ListCargo;

  dbspeStep2.MaxValue := CdsParamRH.FieldByName('NUMSTEPS').asInteger;
  if (CdsParamRH.FieldByName('FLGNIVELINDIV').asInteger = 1) or
     (CdsParamRH.FieldByName('FLGDOISCARGOS').asInteger = 1) then
  begin
    dblckFaixa2.Selected.Clear;
    dblckFaixa2.Selected.Add('IDFAIXASALARIAL' +#9+'06'+#9+ 'Código');
    dblckFaixa2.Selected.Add('DATAEFETIV' +#9+'15'+#9+ 'Data Efetivação');

    for c:=1 to CdsParamRH.FieldByName('NUMSTEPS').asInteger do
      dblckFaixa2.Selected.Add('STEP' + IntToStr(c) +#9+'15'+#9+
        CdsParamRH.FieldByName('TITSTEP' + IntToStr(c)).asString);
    if (CdsParamRH.FieldByName('FLGNIVELINDIV').asInteger = 1) then
    begin
      CdsFaixa2.Data := CtrlFaixaSal.ListFaixaSal;
      dbspeStep1.MaxValue := CdsParamRH.FieldByName('NUMSTEPS').asInteger;
      dblckFaixa1.Selected.Clear;
      dblckFaixa1.Selected.Add('IDFAIXASALARIAL' +#9+'06'+#9+ 'Código');
      dblckFaixa1.Selected.Add('DATAEFETIV' +#9+'15'+#9+ 'Data Efetivação');

      for c:=1 to CdsParamRH.FieldByName('NUMSTEPS').asInteger do
        dblckFaixa1.Selected.Add('STEP' + IntToStr(c) +#9+'15'+#9+
          CdsParamRH.FieldByName('TITSTEP' + IntToStr(c)).asString);
    end;
  end;

  IndPolitica := CdsParamRH.FieldByName('INDPOLITICA').asInteger;
  if (IndPolitica = 1) then
  begin
    gbxStepsFaixa.Caption := 'Valor Hay';
    rgAltSalario.Items[3] := 'Hay';
  end;

  gbxCargo2.Visible := (CdsParamRH.FieldByName('FLGDOISCARGOS').asInteger = 1);
  if (CdsParamRH.FieldByName('FLGDOISCARGOS').asInteger = 1) then
    CdsCargo2.Data := CdsCargo.Data
  else
  with dbgrdDet, dbgrdDet.DataSource.DataSet do
  begin
    DisableControls;
    Selected.Delete(6);
    EnableControls;
  end;

  with (MontaSelect.Filtro) do
  begin
    Clear;
    // Estabelecimento(s) habilitados para o usuário
    if (CtrlUsoGeralRH.UsuXFilial <> '') then
      Add('FUNCIONARIO.IDESTAB IN ' +CtrlUsoGeralRH.UsuXFilial);

    // C. de Custo(s) habilitado(s) para o usuário
    if (CtrlUsoGeralRH.UsuXCCusto <> '') then
      Add('FUNCIONARIO.CODCENTROCUSTO IN ' +CtrlUsoGeralRH.UsuXCCusto);

    // Usuário Individual
    if (CtrlUsoGeralRH.IdUsuarioGeral <> '') then
      Add('FUNCIONARIO.IDPESSOA = ' + CtrlUsoGeralRH.IdUsuarioGeral);

    // Usuário RH
    if not(CtrlUsoGeralRH.UsuarioRH) or (Sistema.IdModulo = MODFOL) then
      Add('FUNCIONARIO.IDEMPRESA = ' + IntToStr(Sistema.IdEmpresa));

    Add('FUNCIONARIO.IDPESSOA  = PESSOA.IDPESSOA');
    Add('FUNCIONARIO.IDCARGO   = CARGO.IDCARGO(+)');
  end;

  // Apresento o MontaSelect antes de visualizar o Form
  sbtnProcurarClick(Self);
  if not(MontaSelect.RetornouValor) then
    Sel(-1);

  case (Sistema.IdModulo) of
    MODCES : HelpContext := 740015;
    MODFOL : HelpContext := 210065;
  end;

  AlteraRegistro := False; // Michelle Mota - SIG27758
end;

procedure TfrmCadRegEvol.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  FreeAndNil(CtrlEvolFunc);
  FreeAndNil(CtrlPessoaFuncionario);
  FreeAndNil(CtrlPessoaFilialPessoa);
  FreeAndNil(CtrlMotivo);
  FreeAndNil(CtrlFaixaSal);
  FreeAndNil(CtrlCargo);
  FreeAndNil(CtrlGlobalRH);
  FreeAndNil(CtrlListTerceirosRH);
  FreeAndNil(CtrlSitFunc);
  FreeAndNil(CtrlTabelaHay);
  FreeAndNil(CtrlPpraCipa);
  FreeAndNil(CtrlIntegraPrevRH);
  inherited;
end;

procedure TfrmCadRegEvol.CmeCadastroFind(Sender: TObject);
begin
  if (MontaSelect.RetornouValor) then
  begin
    Sel(StrToFloat(MontaSelect.ValoresChave[0]));

    dmCds.Cds.Data := CtrlSitFunc.ListGeral(Cds.FieldByName('IDSITFUNC').asInteger);
    if not(dmCds.Cds.IsEmpty) then
      edSitFunc.Text := dmCds.Cds.FieldByName('DESCRICAO').asString
    else
      edSitFunc.Text := '';

    if (CdsCargo.Locate('IDCARGO', Cds.FieldByName('IDCARGO').asFloat, [])) then
      edCargo.Text := CdsCargo.FieldByName('TITULO').asString
    else
      edCargo.Text := '';

    SalRef := cdsDet.FieldByName('Salario').AsFloat;
    FunRef := cdsDet.FieldByName('VLRFUNCAO').AsFloat; //Higor Nayde Ferreira Sol 188194 - Kintana 1779198
  end;
end;

procedure TfrmCadRegEvol.CmeDetalheInsert(Sender: TObject);
begin
  inherited;
  CdsDet.FieldByName('IDFUNCAO').asFloat := Cds.FieldByName('IDFUNCAO').asFloat;
  CdsDet.FieldByName('IDPESSOA').asFloat := Cds.FieldByName('IDPESSOA').asFloat;
  CdsDet.FieldByName('IDEMPRESA').asInteger := Cds.FieldByName('IDEMPRESA').asInteger;
  CdsDet.FieldByName('CODCENTROCUSTO').asString := Cds.FieldByName('CODCENTROCUSTO').asString;
  if (CdsLotacao.Locate('CODCENTROCUSTO', Cds.FieldByName('CODCENTROCUSTO').asString, [])) then
    CdsDet.FieldByName('CENTROCUSTO').asString := CdsLotacao.FieldByName('NOME').asString;
  CdsDet.FieldByName('IDCARGO').asFloat := Cds.FieldByName('IDCARGO').asFloat;
//Higor Nayde Ferreira Sol 188194 - Kintana 1779198 INICIO
  CdsDet.FieldByName('VLRFUNCAO').asFloat;
  CdsDet.FieldByName('PERC_REAJFUNCAO').asFloat;
  CdsDet.FieldByName('VLRSALARIOFUNCAO').asFloat;

//Higor Nayde Ferreira Sol 188194 - Kintana 1779198 fim
  if (CdsParamRH.FieldByName('FLGDOISCARGOS').asInteger = 1) then
  begin
    CdsDet.FieldByName('IDFUNCAO').asFloat := Cds.FieldByName('IDFUNCAO').asFloat;
    if (CdsParamRH.FieldByName('FLGNIVELINDIV').asInteger = 1) then
      CdsDet.FieldByName('IDFAIXAFUNCAO').asFloat := Cds.FieldByName('IDFAIXAFUNCAO').asFloat;
    CdsDet.FieldByName('NIVELINDIV2').asFloat := Cds.FieldByName('NIVELINDIV2').asFloat;
  end;

  if (CdsParamRH.FieldByName('FLGNIVELINDIV').asInteger = 1) or
     (Modulo.IdContraCheque = FUNCEF) then
  begin
    if (CdsParamRH.FieldByName('FLGNIVELINDIV').asInteger = 1) then
      CdsDet.FieldByName('IDFAIXACARGO').asFloat := Cds.FieldByName('IDFAIXACARGO').asFloat;
    CdsDet.FieldByName('NIVELINDIV1').asFloat := Cds.FieldByName('NIVELINDIV1').asFloat;
  end;

  CdsDet.FieldByName('IDESTAB').asFloat := Cds.FieldByName('IDESTAB').asFloat;
  CdsDet.FieldByName('SALARIO').asFloat := Cds.FieldByName('SALARIOATUAL').asFloat;
  CdsDet.FieldByName('TIPOPAGAMENTO').asString := Cds.FieldByName('TIPOPAGAMENTO').asString;
  CdsDet.FieldByName('PERC_REAJ').asFloat := 0;
  //Thaise Sol 142865 - Atualizar o IdChefe da tabela Funcionario
  Cds.FieldByName('IDCHEFE').AsString:= CtrlEvolFunc.CodResponsavel(CdsDet.FieldByName('CODCENTROCUSTO').asString);



  CdsDet.FieldByName('VLRFUNCAO').asFloat := Cds.FieldByName('VLRFUNCAO').asFloat;


end;

procedure TfrmCadRegEvol.CmeCadastroConfirma(Sender: TObject);
begin
  inherited;
  // Chama a rotina de integraçao dos sistemas previdenciarios com os sistemas
  // de RH e Folha de Pagamento de uma Fundação
  if sintegra then        // sig 43010 Ferrari
  begin
    frmAguarde.Mostra('Atualizando o Histórico das Faixas');
    frmAguarde.Pos := 0;
    //Monica - 142865/6462 - adicionado o if de exclusao
    if bexclui = False then
    begin
        if not(CtrlIntegraPrevRH.AtualizaDadosPrevFuncionario(
            Cds.FieldByName('IDEMPRESA').asInteger,
            Cds.FieldByName('IDPESSOA').asInteger)) then
          raise Exception.Create(CtrlIntegraPrevRH.MessageInfo);
    end
    else
    begin
      // Thiago Melo SOL 205930 Kintana 1991130
      if (Cds.FieldByName('IDEMPRESA').asInteger <> 0) and (Cds.FieldByName('IDPESSOA').asInteger <> 0) then begin
        if not(CtrlIntegraPrevRH.AtualizaDadosPrevFuncionario(
              Cds.FieldByName('IDEMPRESA').asInteger,
              Cds.FieldByName('IDPESSOA').asInteger,'',True,false)) then
            raise Exception.Create(CtrlIntegraPrevRH.MessageInfo);
        end ;
      // Thiago Melo SOL 205930 Kintana 1991130
      end;

      

 
    frmAguarde.Apaga;
  end;

  // Verifica se transfere Histórico e Lançamentos para outra empresa
  if (cbxFichaFin.Checked) and (MsgDlg('Confirma Transferência da Ficha Financeira ?',
      'Confirmação', mtConfirmation, [mbYes, mbNo], 0) <> mrNo) then
    if CtrlEvolFunc.TransfereHistoricoRubricas(
       Cds.FieldByName('IDPESSOA').asFloat, CdsEmpresa.FieldByName('IDPESSOA').asInteger) then
         MsgDlg('Transferência da Ficha Financeira Efetuada.', 'Aviso', mtInformation, [mbOk, mbHelp], 0)
    else
         MsgDlg('Não Foi Possível Efetuar a Transferência da Ficha Financeira.', 'Aviso', mtInformation, [mbOk, mbHelp], 0);

  if (cbxLancamentos.Checked) and (MsgDlg('Confirma Transferência dos Lançamentos Pendentes ?',
      'Confirmação', mtConfirmation, [mbYes, mbNo], 0) <> mrNo) then
    if CtrlEvolFunc.TransfereLancamentoRubricas(
       Cds.FieldByName('IDPESSOA').asFloat, CdsEmpresa.FieldByName('IDPESSOA').asInteger) then
         MsgDlg('Transferência dos Lançamentos Pendentes Efetuada.', 'Aviso', mtInformation, [mbOk, mbHelp], 0)
    else
         MsgDlg('Não Foi Possível Efetuar a Transferência dos Lançamentos Pendentes.', 'Aviso', mtInformation, [mbOk, mbHelp], 0);

end;

procedure TfrmCadRegEvol.CmeCadastroAfterConfirma(Sender: TObject);
begin
  //inherited;
end;

procedure TfrmCadRegEvol.CmeCadastroApplyEdit(sender: TObject; var Accept: Boolean);
begin
  inherited;
  // Thiago Melo SOL 205930 Ktn 1991130
  // SOL 221471
  {
  if (not CtrlEvolFunc.validaEvolFunc(CdsDet)) then begin
  begin
      begin
        MsgDlg('O histórico referente à Admissão não pode ser excluído.', 'Aviso', mtInformation, [mbOk, mbHelp], 0);
        Accept := False;
        Exit;
      end;
    end;
  end;
  // Thiago Melo SOL 205930 Ktn 1991130}
  // SOL 221471
  Accept := GravarRegistro;
end;

procedure TfrmCadRegEvol.dsDetStateChange(Sender: TObject);
begin
  inherited;
  if (CdsDet.State in [dsInsert, dsEdit]) then
  begin
    rgAltSalario.Enabled := (Trim(CdsDet.FieldByName('DATAALTERFUNC').asString) <> '');
    gbxSalario.Enabled := rgAltSalario.Enabled;
    {Início - Michelle Mota - SIG27758 - RNG04}
    //rgAltSalario.ItemIndex := 0;
    rgAltSalario.ItemIndex := 3;
    {Término - Michelle Mota - SIG27758 - RNG04}
    rgAltSalarioClick(Self);

    if (dblcTipoEv.CanFocus) then
      dblcTipoEv.SetFocus;
  end;
end;

procedure TfrmCadRegEvol.CdsDetBeforePost(DataSet: TDataSet);
var
  sSalDet, sSalCad: string;
begin
  inherited;
  sSalDet := CdsDet.FieldByName('SALARIO').asString;
  sSalCad := Cds.FieldByName('SALARIOATUAL').asString;
  if (CdsDet.FieldByName('DATAALTERFUNC').asDateTime >= Cds.FieldByName('DATASALARIO').asDateTime) and
     (sSalDet <> sSalCad) then
  begin
    Cds.FieldByName('DATASALARIO').asDateTime := CdsDet.FieldByName('DATAALTERFUNC').asDateTime;
    Cds.FieldByName('SALARIOATUAL').asFloat := CdsDet.FieldByName('SALARIO').asFloat;
    Cds.FieldByName('TIPOPAGAMENTO').asString := CdsDet.FieldByName('TIPOPAGAMENTO').asString;
    if (CdsParamRH.FieldByName('FLGNIVELINDIV').asInteger = 1) then
    begin
      if (CdsDet.FieldByName('IDFAIXACARGO').asFloat <> Cds.FieldByName('IDFAIXACARGO').asFloat) then
        Cds.FieldByName('IDFAIXACARGO').asFloat := CdsDet.FieldByName('IDFAIXACARGO').asFloat;
      if (CdsDet.FieldByName('NIVELINDIV1').asFloat <> Cds.FieldByName('NIVELINDIV1').asFloat) then
        Cds.FieldByName('NIVELINDIV1').asFloat := CdsDet.FieldByName('NIVELINDIV1').asFloat;
    end;
    if (Modulo.IdContraCheque = FUNCEF) then
      if (CdsDet.FieldByName('NIVELINDIV1').asFloat <> Cds.FieldByName('NIVELINDIV1').asFloat) then
        Cds.FieldByName('NIVELINDIV1').asFloat := CdsDet.FieldByName('NIVELINDIV1').asFloat;
  end;

  if (CdsDet.FieldByName('DATAALTERFUNC').asDateTime >= Cds.FieldByName('DATACARGO').asDateTime) and
     (CdsDet.FieldByName('IDCARGO').asFloat <> Cds.FieldByName('IDCARGO').asFloat) then
  begin
    Cds.FieldByName('DATACARGO').asDateTime := CdsDet.FieldByName('DATAALTERFUNC').asDateTime;
    Cds.FieldByName('IDCARGO').asFloat := CdsDet.FieldByName('IDCARGO').asFloat;
  end;

  if (CdsParamRH.FieldByName('FLGDOISCARGOS').asInteger = 1) and
     (CdsDet.FieldByName('DATAALTERFUNC').asDateTime >= Cds.FieldByName('DATACARGO2').asDateTime) then
  begin
    if (CdsDet.FieldByName('IDFUNCAO').asFloat <> Cds.FieldByName('IDFUNCAO').asFloat) then
    begin
      Cds.FieldByName('DATACARGO2').asDateTime := CdsDet.FieldByName('DATAALTERFUNC').asDateTime;
      Cds.FieldByName('IDFUNCAO').asFloat := CdsDet.FieldByName('IDFUNCAO').asFloat;
    end;
    if (CdsDet.FieldByName('NIVELINDIV2').asFloat <> Cds.FieldByName('NIVELINDIV2').asFloat) then
      Cds.FieldByName('NIVELINDIV2').asFloat := CdsDet.FieldByName('NIVELINDIV2').asFloat;
    if (CdsParamRH.FieldByName('FLGNIVELINDIV').asInteger = 1) and
       (CdsDet.FieldByName('IDFAIXAFUNCAO').asFloat <> Cds.FieldByName('IDFAIXAFUNCAO').asFloat) then
        Cds.FieldByName('IDFAIXAFUNCAO').asFloat := CdsDet.FieldByName('IDFAIXAFUNCAO').asFloat;
  end;

  if (CdsDet.FieldByName('DATAALTERFUNC').asDateTime >= Cds.FieldByName('DATALOTACAO').asDateTime) and
     ((CdsDet.FieldByName('CODCENTROCUSTO').asString <> Cds.FieldByName('CODCENTROCUSTO').asString) or
      (CdsDet.FieldByName('IDEMPRESA').asFloat <> Cds.FieldByName('IDEMPRESA').asFloat) or
      (CdsDet.FieldByName('IDESTAB').asFloat <> Cds.FieldByName('IDESTAB').asFloat)) then
  begin
    Cds.FieldByName('DATALOTACAO').asDateTime := CdsDet.FieldByName('DATAALTERFUNC').asDateTime;
    Cds.FieldByName('IDESTAB').asFloat := CdsDet.FieldByName('IDESTAB').asFloat;
    Cds.FieldByName('IDEMPRESA').asFloat := CdsDet.FieldByName('IDEMPRESA').asFloat;
    Cds.FieldByName('CODCENTROCUSTO').asString := CdsDet.FieldByName('CODCENTROCUSTO').asString;
  end;
end;

procedure TfrmCadRegEvol.cmbStepsChange(Sender: TObject);
begin
  if (IndPolitica = 0) then
  begin
    dbedSalario.Value := StrToFloat(FU.TiraCaracter(Copy(cmbSteps.Text,7,14), '.'));
    if (Modulo.IdContraCheque = FUNCEF) then
      CdsDet.FieldByName('NIVELINDIV1').asFloat := StrToFloat(Trim(Copy(cmbSteps.Text,1,2)));  // Edilaine Ferraresi - SOL 171426 / KTN 1537613
  end
  else
    dbedSalario.Value := StrToFloat(FU.TiraCaracter(cmbSteps.Text, '.'));
if((dbspeStep2.Value <> 0) and (dblckFaixa2.Text <> ''))then begin
  if ((CtrlEvolFunc.SelecionaFaixa(FloatToStr(dbspeStep2.Value),dblckFaixa2.Value) <> 0 )) then
    dbedFuncao.Value := ((CtrlEvolFunc.SelecionaFaixa(FloatToStr(dbspeStep2.Value),dblckFaixa2.Value))- (cdsDet.FieldByName('Salario').AsFloat))
  else
    dbedFuncao.Value := 0.00;
end;

  if  (dbedFuncao.Value <= 0) then
      dbedSalTotal.Value :=  dbedSalario.Value
  else
      dbedSalTotal.Value:= dbedSalario.Value + dbedFuncao.Value;

end;

procedure TfrmCadRegEvol.dbedSalarioChange(Sender: TObject);
begin
  if (CdsDet.State in [dsInsert, dsEdit]) and (rgAltSalario.ItemIndex in [1, 3]) and
     (SalRef > 0) then
         dbedPerc.Value := (dbedSalario.Value - SalRef) * 100 / SalRef;
	//Higor Nayde Ferreira Sol 188194 - Kintana 1779198 INICIO
  //dbedFuncao.Value := ((CtrlEvolFunc.SelecionaFaixa(FloatToStr(dbspeStep2.Value),dblckFaixa2.Value))- (cdsDet.FieldByName('Salario').AsFloat));
  if dbedFuncao.Value < 0 then
     dbedFuncao.Value := dbedFuncao.Value *-1;

  if  (dbedFuncao.Value <= 0) then
      dbedSalTotal.Value :=  dbedSalario.Value
  else
      dbedSalTotal.Value:= dbedSalario.Value + dbedFuncao.Value;
	//Higor Nayde Ferreira Sol 188194 - Kintana 1779198 FIM
end;

procedure TfrmCadRegEvol.dbedPercChange(Sender: TObject);
begin
  if (CdsDet.State in [dsInsert, dsEdit]) and (rgAltSalario.ItemIndex = 2) and
     (SalRef > 0) then
    dbedSalario.Value := (100 + dbedPerc.Value) * SalRef / 100;

if(dblckFaixa2.Value <>'')then begin
  if ((CtrlEvolFunc.SelecionaFaixa(FloatToStr(dbspeStep2.Value),dblckFaixa2.Value) <> 0 )) then
    dbedFuncao.Value := ((CtrlEvolFunc.SelecionaFaixa(FloatToStr(dbspeStep2.Value),dblckFaixa2.Value))- (cdsDet.FieldByName('Salario').AsFloat))
  else
    dbedFuncao.Value := 0.00;
  end;
  if  (dbedFuncao.Value <= 0) then
      dbedSalTotal.Value :=  dbedSalario.Value
  else
      dbedSalTotal.Value:= dbedSalario.Value + dbedFuncao.Value;


end;

procedure TfrmCadRegEvol.dblcCargoChange(Sender: TObject);
begin
  {if (CdsDet.State in [dsInsert, dsEdit]) then
  begin
    CdsDet.FieldByName('TITULO').asString := CdsCargo.FieldByName('TITULO').asString;
    rgAltSalarioClick(Self);
  end; } // Michelle Mota - SIG27758 - mudança a pedido do usuário - usabilidade
end;

procedure TfrmCadRegEvol.dblcTipoEvChange(Sender: TObject);
begin
  if (CdsDet.State in [dsInsert, dsEdit]) then
    CdsDet.FieldByName('DESCRICAO').asString := CdsMotivo.FieldByName('DESCRICAO').asString;
end;

procedure TfrmCadRegEvol.dblcFuncaoChange(Sender: TObject);
begin
  if (CdsDet.State in [dsInsert, dsEdit]) then BEGIN
    CdsDet.FieldByName('FUNCAO').asString := CdsCargo2.FieldByName('TITULO').asString;
    if(dblcFuncao.Text = '')then  begin
     CdsDet.FieldByName('FUNCAO').asString := '';
     CdsDet.FieldByName('IDFUNCAO').asString := '';
     end;
  end;
  if (CdsDet.Active) and (CdsParamRH.FieldByName('FLGNIVELINDIV').asInteger = 0) then
    CdsFaixa2.Data := CtrlFaixaSal.ListFaixaCargo(FU.StrFloat(dblcFuncao.LookupValue));
end;

procedure TfrmCadRegEvol.dblcEstabChange(Sender: TObject);
begin
  if (CdsDet.State in [dsInsert, dsEdit]) then
    CdsDet.FieldByName('FILIAL').asString := CdsEstab.FieldByName('NOME').asString;
end;

procedure TfrmCadRegEvol.dblcLotacChange(Sender: TObject);
begin
  if (CdsDet.State in [dsInsert, dsEdit]) then
    begin
    //Mose - SOL : 188047 KTN 1774190 inicio
      CdsDet.FieldByName('CENTROCUSTO').asString := CdsLotacao.FieldByName('NOME').asString;
      if (CdsDet.State in [dsEdit]) then
      begin
      if ((GuardaCCusto <> dblcLotac.Text) or (GuardaCCusto<>'')) then
         begin
              if ((CdsLotacao.FieldByName('ATIVO').asString = 'Não') or (CdsLotacao.FieldByName('STATUSGRUPOCDC').asString = 'S'))  then
              begin
                if (dblcLotac.Text <> GuardaCCusto) then
                   begin
                   MsgDlg('Não é permitido alterar para um centro de custo inativo ou sintético', 'Aviso', mtWarning, [mbOk], 0);
                   dblcLotac.Text := GuardaCCusto;
                   exit;
                   end;
                end;
         end;

      end
    //Mose - SOL : 188047 KTN 1774190 Fim
    end; // Michelle Mota - SIG27758 - Add ponto e vírgula - Erro Missing operator or semicolon
  AtualizaDiretoria; // Michelle Mota - SIG27758 - RNG04
end;

procedure TfrmCadRegEvol.dbedDatEfetExit(Sender: TObject);
begin
  {Início - Michelle Mota - SIG 27758}
 { if (Trim(dbedDatEfet.Text) <> '') then
  begin
//    SalRef := CtrlEvolFunc.GetSalarioEvolFunc(StrToFloat(MontaSelect.ValoresChave[0]),
//      StrToDate(dbedDatEfet.Text));

    if (SalRef = 0) then
      SalRef := Cds.FieldByName('SalarioAtual').asFloat;

    rgAltSalario.Enabled := true;
    gbxSalario.Enabled := true;
  end
  else
    SalRef := 0;  }

  
  {Término - Michelle Mota - SIG 27758}
end;

procedure TfrmCadRegEvol.sbtnImprimirEtiquetaClick(Sender: TObject);
begin
  if (CdsDet.IsEmpty) then
    MsgDlg('Para imprimir a carta deve existir alguma solicitação.',
      'Aviso', mtInformation, [mbOk, mbHelp], 0)
  else
  begin
    RptEtiquetaAlteracaoCTPS := TRptEtiquetaAlteracaoCTPS.Create(Self);
    with (RptEtiquetaAlteracaoCTPS.sqlEtiquetaAlteracaoCTPS.SQL) do
    begin
      Clear;
      Add('SELECT');  
      Add('  TO_CHAR(H.DATAALTERFUNC,''DD/MM/YYYY'') AS DATA,');
      Add('  DECODE(E2.IDCARGO,C.IDCARGO,''A mesma'',C.TITULO) AS NOVAFUNCAO,');
      Add('  H.SALARIO AS NOVOSALARIO, F.MATRICULA,');
      Add('  (' +QuotedStr(FU.Replicate(' ',24))+ ' || :MOTIVO || MO.DESCRICAO) AS MOTIVO,');
      Add('  C.CBO2002 AS CBO');
      Add('FROM');
      Add('  EVOLFUNC H, FUNCIONARIO F, MOTIVO MO, CARGO C,');
      Add('  (SELECT');
      Add('     IDCARGO, IDPESSOA');
      Add('   FROM');
      Add('     EVOLFUNC');
      Add('   WHERE');
      Add('     (IDPESSOA      = 10485) AND');
      Add('     (DATAALTERFUNC = (SELECT MAX(DATAALTERFUNC)');
      Add('                       FROM   EVOLFUNC');
      Add('                       WHERE  (IDPESSOA      = 10485) AND');
      Add('                              (DATAALTERFUNC < TO_DATE('+
        QuotedStr(CdsDet.FieldByName('DATAALTERFUNC').asString)+ ',''DD/MM/YYYY''))))) E2');
      Add('WHERE');
      Add('  (MO.GRUPOMOTIVO IN (''A'',''D'')) AND');
      Add('  (H.DATAALTERFUNC = TO_DATE(' +
        QuotedStr(CdsDet.FieldByName('DATAALTERFUNC').asString)+ ',''DD/MM/YYYY'')) AND');
      Add('  (H.IDPESSOA      = ' +CdsDet.FieldByName('IDPESSOA').asString+ ') AND');
      Add('  (H.IDPESSOA      = F.IDPESSOA) AND');
      Add('  (H.IDPESSOA      = E2.IDPESSOA(+)) AND');
      Add('  (H.IDMOTIVO      = MO.IDMOTIVO(+)) AND');
      Add('  (H.IDCARGO       = C.IDCARGO(+))');
    end;
    RptEtiquetaAlteracaoCTPS.sqlEtiquetaAlteracaoCTPS.Prepare;
    RptEtiquetaAlteracaoCTPS.sqlEtiquetaAlteracaoCTPS.ParamByName('MOTIVO').asString :=
      'Por motivo de: ';

    RptEtiquetaAlteracaoCTPS.CrmRptCM.IdReports := 3674;
    RptEtiquetaAlteracaoCTPS.CrmRptCM.IdEmpresa := Sistema.IdEmpresa;
    RptEtiquetaAlteracaoCTPS.CrmRptCM.OrigemCM := 1;
    RptEtiquetaAlteracaoCTPS.CrmRptCM.IdModulo := Sistema.IdModulo;
    RptEtiquetaAlteracaoCTPS.CrmRptCM.IdUsuario := Sistema.IdUsuario;
    RptEtiquetaAlteracaoCTPS.CrmRptCM.Print;
    FreeAndNil(RptEtiquetaAlteracaoCTPS);
  end;
end;

procedure TfrmCadRegEvol.rgAltSalarioClick(Sender: TObject);
var
  c: byte;
  RecuperaTextoSelecionado: string; // Michelle Mota - SIG27758
begin
  cmbSteps.Text := '';
  RecuperaTextoSelecionado := ''; // Michelle Mota - SIG27758
  dbedSalario.Enabled := (rgAltSalario.ItemIndex = 1);
  dbedPerc.Enabled := (rgAltSalario.ItemIndex = 2);
  gbxStepsFaixa.Visible := (rgAltSalario.ItemIndex = 3);


  //Higor Nayde Ferreira Sol 188194 - Kintana 1779198 INICIO
  dbedFuncao.Enabled := (rgAltSalario.ItemIndex = 1);
  dbedPercFuncao.Enabled := (rgAltSalario.ItemIndex = 2);

  dbedFuncao.Visible := True;
  Label6.visible:= True;
  dbedPercFuncao.Visible := True;
  Label9.visible:= True;
  dbedSalTotal.Visible := True;
  Label11.Visible := True;

  cmbSteps.Enabled := rgAltSalario.Enabled; // Michelle Mota - SIG27758
  gbxSalario.Enabled := rgAltSalario.Enabled; // Michelle Mota - SIG27758
  
  if (rgAltSalario.ItemIndex = 3) then
  begin
    cmbSteps.Items.Clear;
    dbedFuncao.Visible := false;
    dbedPercFuncao.Visible := false;
    dbedSalTotal.Visible := false;
    Label9.visible:= false;
    Label6.visible:= false;
    Label11.Visible := false;
  //Higor Nayde Ferreira Sol 188194 - Kintana 1779198  FIM
    if (IndPolitica = 0) then // Faixas Salariais
    begin
      gbxFaixa1.SendToBack;
      if (CdsParamRH.FieldByName('FLGNIVELINDIV').asInteger = 0) then // Por Cargo
      begin
        //CdsFaixa.Data := CtrlFaixaSal.ListFaixaCargo(CdsDet.FieldByName('IdCargo').asFloat);  // Michelle Mota - SIG27758
        CdsFaixa.Data := CtrlFaixaSal.ListFaixaCargo(CdsCargo.FieldByName('IdCargo').asFloat);  // Michelle Mota - SIG27758
        if not(CdsFaixa.IsEmpty) then
          for c:=1 to CdsParamRH.FieldByName('NUMSTEPS').asInteger do
            begin
              cmbSteps.Items.Add(IntToStr(c) +'  =  '+
              FloatToStrF(CdsFaixa.FieldByName('Step' +IntToStr(c)).asFloat, ffNumber, 14, 2));
              {Início - Michelle Mota - SIG27758}
              if (AlteraRegistro) and (CdsDet.FieldByName('NIVELINDIV1').asFloat = c) then
                RecuperaTextoSelecionado := (IntToStr(c) +'  =  '+
                                            FloatToStrF(CdsFaixa.FieldByName('Step' +IntToStr(c)).asFloat, ffNumber, 14, 2))
              {Término - Michelle Mota - SIG27758}
            end
        else
        begin
          MsgDlg('Não Existe Faixa Salarial Associada.', 'Aviso', mtInformation, [mbOk, mbHelp], 0);
          //rgAltSalario.SetFocus; // Michelle Mota - SIG27758 - Erro ao inserir - Foco em campo bloqueado - RNG04
          exit;
        end;
      end
      else   // Individuais
        gbxFaixa1.BringToFront;
    end
    else // Tabela Hay
      cmbSteps.Items.Add(FloatToStrF(CtrlTabelaHay.GetValorHay(
        CdsDet.FieldByName('IDCARGO').asInteger), ffNumber, 14, 2));

    {Início - Michelle Mota - SIG27758}
    if (AlteraRegistro) and (RecuperaTextoSelecionado <> '') then
      begin
        cmbSteps.ItemIndex := cmbSteps.Items.IndexOf(RecuperaTextoSelecionado);
      end;
    {Término - Michelle Mota - SIG27758}
  end
  else
    gbxFaixa1.SendToBack;
end;

procedure TfrmCadRegEvol.btnOkMudarClick(Sender: TObject);
begin
  if (dblcEmpresas.Text = '') then
  begin
    MsgDlg('Escolha a Empresa.', 'Aviso', mtInformation, [mbOk, mbHelp], 0);
    dblcEmpresas.SetFocus;
    exit;
  end;

  Self.Enabled := true;
  townEmpresas.Visible := false;
  CdsEstab.Data := CtrlPessoaFilialPessoa.ListPessoaEstab(CdsEmpresa.FieldByName('IDPESSOA').asString);
  CdsLotacao.Data := CtrlListTerceirosRH.ListCCusto(CdsEmpresa.FieldByName('IDPESSOA').asString);
  bMudouEmpresa := True;
end;

procedure TfrmCadRegEvol.btnCancelarMudarClick(Sender: TObject);
begin
  Self.Enabled := true;
  townEmpresas.Visible := false;
  bMudouEmpresa := False;
  cbxFichaFin.Checked := False;
  cbxLancamentos.Checked := False;
  CdsEstab.Data := CtrlPessoaFilialPessoa.ListPessoaEstab(IntToStr(Sistema.IdEmpresa));
  CdsLotacao.Data := CtrlListTerceirosRH.ListCCusto(IntToStr(Sistema.IdEmpresa));
end;

procedure TfrmCadRegEvol.bbtnEmpresasClick(Sender: TObject);
begin
  townEmpresas.Top := 140;
  townEmpresas.Visible := True;
end;

procedure TfrmCadRegEvol.bbtnOkDetClick(Sender: TObject);
var sSql : String;  //WO8140 - Helen V Bianchi
begin
  if (Trim(dblcTipoEv.Text) = '') then
  begin
    MsgDlg('Informe o Tipo de Evento.', 'Aviso', mtWarning, [mbOk, mbHelp], 0);
    dblcTipoEv.SetFocus;
    exit;
  end;

  if (CdsDet.FieldByName('DATAALTERFUNC').IsNull) then
  begin
    MsgDlg('Informe a Data de Efetivação.', 'Aviso', mtWarning, [mbOk, mbHelp], 0);
    dbedDatEfet.SetFocus;
    exit;
  end;

  if (CdsDet.FieldByName('DATAALTERFUNC').asDateTime > Date) then
    if (MsgDlg('Evento para Data Futura.' +CR_LF+ 'Confirma?', 'Confirmação',
      mtConfirmation, [mbYes, mbNo], 0) = mrNo) then
    begin
      dbedDatEfet.SetFocus;
      exit;
    end;

  if (Trim(dbedSalario.Text) = '') or (StrToFloat(dbedSalario.Text) = 0) then
    if (MsgDlg('Sem Valor de Salário.' +CR_LF+ 'Confirma?', 'Confirmação',
      mtConfirmation, [mbYes, mbNo], 0) = mrNo) then
    begin
      dbedSalario.SetFocus;
      exit;
    end;

  if (bMudouEmpresa) then
    CdsDet.FieldByName('IdEmpresa').asInteger := CdsEmpresa.FieldByName('IdPessoa').asInteger;

  if (CdsDet.State in [dsInsert,dsEdit]) then
    CdsDet.FieldByName('TRGDTINCLUSAO').asDateTime := Now;

  //WO8140 - Helen V Bianchi - Inicio
  if (CdsDet.State in [dsEdit]) AND
     ((dDataAlterFunc <> CdsDet.FieldByName('DATAALTERFUNC').asDateTime) OR
      (iIdMotivo      <> CdsDet.FieldByName('IDMOTIVO').asInteger) )then
  begin
      qryAux.Close;
      qryAux.SQL.Clear;
      sSql := ' ';
      sSql := 'update EVOLFUNC SET '     +
                '   DATAALTERFUNC =  ''' +  CdsDet.FieldByName('DATAALTERFUNC').asString + ''''+
                '   , IDMOTIVO      =  ' +  CdsDet.FieldByName('IDMOTIVO').asString +
                ' WHERE IDPESSOA =    '  + CdsDet.FieldByName('IDPESSOA').asString +
                ' AND DATAALTERFUNC = '''+  DateToStr(dDataAlterFunc) +''''+
                ' AND IDMOTIVO =      '  + IntToStr(iIdMotivo) ;

      qryAux.SQL.Add(sSql);
      qryAux.ExecSQL;
      qryAux.Close;
  end;
   //WO8140 - Helen V Bianchi - Fim

  inherited;
  TestaSeMudouEmpresa;
  //Higor Nayde Ferreira Sol 188194 - Kintana 1779198
   {if (CdsDet.State in [dsInsert])then begin
      if (SalFunant <> SalFunAtual)then begin
            CtrlEvolFunc.GravarDataFunc(CdsDet.FieldByName('DATAALTERFUNC').asString,CdsDet.FieldByName('IDPESSOA').asFloat);
      end;
      CtrlEvolFunc.GravarFunc(CdsDet.FieldByName('VLRFUNCAO').AsString,CdsDet.FieldByName('VLRSALARIOFUNCAO').AsString,CdsDet.FieldByName('IDPESSOA').AsString);
   end;}
   //Higor Nayde Ferreira Sol 188194 - Kintana 1779198

end;

procedure TfrmCadRegEvol.bbtnCancelarDetClick(Sender: TObject);
begin
  inherited;
  TestaSeMudouEmpresa;
  //Mosé - SOL : 188047 KTN 1774190 inicio
  GuardaCCusto := '';
  With CdsLotacao do
     begin

       Filter := ' ATIVO = ''Sim'' AND  STATUSGRUPOCDC = ''A'' ';
       Filtered := False;

     end;
//Mosé - SOL : 188047 KTN 1774190 Fim
end;

procedure TfrmCadRegEvol.bbtnVoltarDetClick(Sender: TObject);
begin
  inherited;
  TestaSeMudouEmpresa;
  //Mosé - SOL : 188047 KTN 1774190 inicio
  GuardaCCusto := '';
  With CdsLotacao do
     begin

       Filter := ' ATIVO = ''Sim'' AND  STATUSGRUPOCDC = ''A'' ';
       Filtered := False;

     end;
//Mosé - SOL : 188047 KTN 1774190 Fim
end;

procedure TfrmCadRegEvol.bbtnConfirmarClick(Sender: TObject);
begin
  // Inicio SIG 43010 Ferrari
  if (Cds.FieldByName('IDEMPRESA').asString <> '') and (Sistema.TipoEmpresa = 'P') then
    sintegra := (MsgDlg('Deseja Acionar a Rotina de Integração com o Previdenciário ?'+CR_LF+
             '(Compatibilização dos Dados com Evolução do Elegível)', 'Confirmação',
         mtConfirmation, [mbYes, mbNo], 0) = mrYes)
  else
    sintegra := False;
  CdsDet.edit;
  if sintegra then
    CdsDet.FieldByName('FLGATUDADOSPREV').asInteger := 1
  else
    CdsDet.FieldByName('FLGATUDADOSPREV').asInteger := 0;
  CdsDet.Post;
  // Fim

  if (CdsDet.State in [dsInsert,dsEdit]) then
  begin
    bbtnOkDetClick(Sender);
    bbtnCancelarDetClick(Sender);
  end;
  inherited;
  Sel(StrToFloat(MontaSelect.ValoresChave[0]));
  CtrlEvolFunc.GravarDataCargo2(CdsDet.FieldByName('IDPESSOA').asFloat);
end;

// -------------------------------------------------------------------------------------
// Funções do Form
// -------------------------------------------------------------------------------------

procedure TfrmCadRegEvol.Sel(IDPessoa: double);
begin
  Cds.Data := CtrlPessoaFuncionario.ListPesFisFuncionario(IdPessoa,
    'P.NOME, F.*, '' '' AS CENTROCUSTO');
  CdsDet.Data := CtrlEvolFunc.ListHistoricoEvolFunc(IdPessoa);
  SalFunant:= CdsDet.FieldByName('VLRFUNCAO').asFloat; //Higor Nayde Ferreira Sol 188194 - Kintana 1779198 INICIO
  Funcao := CdsDet.FieldByName('IDFUNCAO').asInteger;
  TFloatField(CdsDet.FieldByName('SALARIO')).DisplayFormat := '###,###,##0.00';
  TFloatField(CdsDet.FieldByName('PERC_REAJ')).DisplayFormat := '###,###,##0.00';
  SalarioAtual := CdsDet.FieldByName('SALARIO').asFloat;
  CargoSal :=   CdsDet.FieldByName('IDCARGO').asInteger;
//  DataSalario :=
//  DataSalario2 :=


  TFloatField(CdsDet.FieldByName('VLRFUNCAO')).DisplayFormat := '###,###,##0.00';
  TFloatField(CdsDet.FieldByName('PERC_REAJFUNCAO')).DisplayFormat := '###,###,##0.00';
  TFloatField(CdsDet.FieldByName('VLRSALARIOFUNCAO')).DisplayFormat := '###,###,##0.00';
//Higor Nayde Ferreira Sol 188194 - Kintana 1779198 FIM
 //Monica - 142865/6462
  bexclui := False;
  AtualizaDiretoria; // Michelle Mota - SIG27758 - RNG04
end;

function TfrmCadRegEvol.GravarRegistro: boolean;
begin
//Monica - 142865/6462 - Inicio
  if bexclui = True then
  begin
    Cds.FieldByName('IDPESSOA').asFloat := CdsDet.FieldByName('IDPESSOA').asFloat;
  Cds.FieldByName('IDEMPRESA').asInteger := CdsDet.FieldByName('IDEMPRESA').asInteger;
  Cds.FieldByName('CODCENTROCUSTO').asString := CdsDet.FieldByName('CODCENTROCUSTO').asString;
  if (CdsLotacao.Locate('CODCENTROCUSTO', CdsDet.FieldByName('CODCENTROCUSTO').asString, [])) then
    Cds.FieldByName('CENTROCUSTO').asString := CdsLotacao.FieldByName('NOME').asString;
  Cds.FieldByName('IDCARGO').asFloat := CdsDet.FieldByName('IDCARGO').asFloat;

  if (CdsParamRH.FieldByName('FLGDOISCARGOS').asInteger = 1) then
  begin
    Cds.FieldByName('IDFUNCAO').asFloat := CdsDet.FieldByName('IDFUNCAO').asFloat;
    if (CdsParamRH.FieldByName('FLGNIVELINDIV').asInteger = 1) then
      Cds.FieldByName('IDFAIXAFUNCAO').asFloat := CdsDet.FieldByName('IDFAIXAFUNCAO').asFloat;
    Cds.FieldByName('NIVELINDIV2').asFloat := CdsDet.FieldByName('NIVELINDIV2').asFloat;
  end;

  if (CdsParamRH.FieldByName('FLGNIVELINDIV').asInteger = 1) or
     (Modulo.IdContraCheque = FUNCEF) then
  begin
    if (CdsParamRH.FieldByName('FLGNIVELINDIV').asInteger = 1) then
      Cds.FieldByName('IDFAIXACARGO').asFloat := CdsDet.FieldByName('IDFAIXACARGO').asFloat;
    Cds.FieldByName('NIVELINDIV1').asFloat := CdsDet.FieldByName('NIVELINDIV1').asFloat;
  end;
  //Higor Nayde Ferreira Sol 188194 Ktn 1779198
  Cds.FieldByName('IDESTAB').asFloat := CdsDet.FieldByName('IDESTAB').asFloat;
  Cds.FieldByName('SALARIOATUAL').asFloat := CdsDet.FieldByName('SALARIO').asFloat;
  Cds.FieldByName('TIPOPAGAMENTO').asString := CdsDet.FieldByName('TIPOPAGAMENTO').asString;
 // CdsDet.FieldByName('PERC_REAJ').asFloat := 0;
  //Thaise Sol 142865 - Atualizar o IdChefe da tabela Funcionario
  Cds.FieldByName('IDCHEFE').AsString:= CtrlEvolFunc.CodResponsavel(CdsDet.FieldByName('CODCENTROCUSTO').asString);
     {
    Cds.FieldByName('CODCENTROCUSTO').asString := CdsDet.FieldByName('CODCENTROCUSTO').asString;
      Cds.FieldByName('IDCHEFE').AsString:= CtrlEvolFunc.CodResponsavel(CdsDet.FieldByName('CODCENTROCUSTO').asString);
  if (CdsLotacao.Locate('CODCENTROCUSTO', CdsDet.FieldByName('CODCENTROCUSTO').asString, [])) then
    Cds.FieldByName('CENTROCUSTO').asString := CdsLotacao.FieldByName('NOME').asString;
  Cds.FieldByName('IDCARGO').asFloat := CdsDet.FieldByName('IDCARGO').asFloat;
      }
    Cds.FieldByName('VLRFUNCAO').AsString := CdsDet.FieldByName('VLRFUNCAO').AsString;
    Cds.FieldByName('VLRSALARIOFUNCAO').AsString := CdsDet.FieldByName('VLRSALARIOFUNCAO').AsString;

    //Cds.FieldByName('DATAALTERFUNC').asString := CdsDet.FieldByName('DATAALTERFUNC').asString;
  end;
//Monica - 142865/6462 - FIM
//Higor Nayde Ferreira Sol 188194 - Kintana 1779198 INCIO
  Result := CtrlEvolFunc.GravarEvolFunc(true);
  if not(Result) then
    MsgDlg(CtrlEvolFunc.MessageInfo, 'Erro', mtError, [mbOk,mbHelp], 0);

  if (SalFunant <> CdsDet.FieldByName('VLRFUNCAO').asFloat) and (CdsDet.FieldByName('VLRFUNCAO').asFloat <> 0.00 ) then begin
     CtrlEvolFunc.GravarDataFunc(CdsDet.FieldByName('DATAALTERFUNC').asString,CdsDet.FieldByName('IDPESSOA').asFloat);
     if (Funcao <> CdsDet.FieldByName('VLRFUNCAO').asInteger) then
     CtrlEvolFunc.GravarDataFunc2(CdsDet.FieldByName('DATAALTERFUNC').asString,CdsDet.FieldByName('IDPESSOA').asFloat);
  end;
  if (CdsDet.FieldByName('VLRFUNCAO').asFloat = 0.00 )then begin
     CtrlEvolFunc.GravarDataFunc('',CdsDet.FieldByName('IDPESSOA').asFloat);
     CtrlEvolFunc.GravarDataFunc2('',CdsDet.FieldByName('IDPESSOA').asFloat);
  end;

//Higor Nrenayde Ferreira Sol 188194 - Kintana 1779198 FIM

  CtrlEvolFunc.GravarFunc(CdsDet.FieldByName('VLRFUNCAO').AsString,CdsDet.FieldByName('VLRSALARIOFUNCAO').AsString,CdsDet.FieldByName('IDPESSOA').AsString);

//Higor Nayde Ferreira Sol 188194 Ktn 1779198
end;

procedure TfrmCadRegEvol.TestaSeMudouEmpresa;
begin
  if (bMudouEmpresa) then
  begin
    bMudouEmpresa := False;
    CdsEstab.Data := CtrlPessoaFilialPessoa.ListPessoaEstab(IntToStr(Sistema.IdEmpresa));
    CdsLotacao.Data := CtrlListTerceirosRH.ListCCusto(IntToStr(Sistema.IdEmpresa));
  end;
end;

procedure TfrmCadRegEvol.bbtnAtivarCargoAltClick(Sender: TObject);
begin
  inherited;
  Self.Enabled := false;
  townCargoAlternativo.Top := 140;
  townCargoAlternativo.Visible := True;
end;

procedure TfrmCadRegEvol.bbtnFecharClick(Sender: TObject);
begin
  inherited;
  Self.Enabled := true;
  townCargoAlternativo.Visible := false;//Higor Nayde Ferreira Sol 188194 - Kintana 1779198 INICIO
  if (dbspeStep2.Value <> 0) and (dblckFaixa2.Value <> '')then begin
        if ((CtrlEvolFunc.SelecionaFaixa(FloatToStr(dbspeStep2.Value),dblckFaixa2.Value) <> 0 )) then
           dbedFuncao.Value := ((CtrlEvolFunc.SelecionaFaixa(FloatToStr(dbspeStep2.Value),dblckFaixa2.Value))- (cdsDet.FieldByName('Salario').AsFloat))
        else
           dbedFuncao.Value := 0.00;
  end
  else
  begin
      dbedFuncao.Value := 0.00;
  end;
     if dbedFuncao.Value < 0 then
        dbedFuncao.Value := dbedFuncao.Value *-1;//Higor Nayde Ferreira Sol 188194 - Kintana 1779198 FIM

end;


procedure TfrmCadRegEvol.dblckFaixa1Change(Sender: TObject);
begin
  inherited;
  if (CdsDet.State in [dsInsert, dsEdit]) then
    dbedSalario.Value := CdsFaixa2.FieldByName('STEP'+ FloatToStr(dbspeStep1.Value)).AsFloat;
end;
//Monica - 142865/6462 - Inicio
procedure TfrmCadRegEvol.sbtnExcluiDetClick(Sender: TObject);
begin
  AlteraRegistro := False; // Michelle Mota - SIG27758
  inherited;
  bexclui:= True;
end;
//Monica - 142865/6462 - FIM

procedure TfrmCadRegEvol.sbtnInsDetClick(Sender: TObject);
begin
  inherited;
  //Mosé - SOL : 188047 KTN 1774190 inicio
   dblcLotac.Text:='';
  With CdsLotacao do
     begin

       Filter := ' ATIVO = ''Sim'' AND  STATUSGRUPOCDC = ''A'' ';
       Filtered := True;
       //Filtered := False;
       //Filter := '';

     end;
   //Mose - SOL : 188047 KTN 1774190 fim
  AlteraRegistro := False; // Michelle Mota - SIG27758
end;

procedure TfrmCadRegEvol.sbtnAltDetClick(Sender: TObject);
begin
  AlteraRegistro := True; // Michelle Mota - SIG27758
  iIdMotivo      :=  CdsDet.FieldByName('IDMOTIVO').AsInteger;        //Helen - WO8140
  dDataAlterFunc :=  CdsDet.FieldByName('DATAALTERFUNC').asDateTime; //Helen - WO8140
  inherited;
  //Mosé - SOL : 188047 KTN 1774190 fim
   GuardaCCusto:= dblcLotac.Text;
 //Mosé - SOL : 188047 KTN 1774190 fim
end;

procedure TfrmCadRegEvol.bbtnCancelarClick(Sender: TObject);
begin
  inherited;
  //Mosé - SOL : 188047 KTN 1774190 inicio
  GuardaCCusto := '';
  With CdsLotacao do
     begin

       Filter := ' ATIVO = ''Sim'' AND  STATUSGRUPOCDC = ''A'' ';
       Filtered := False;

     end;
//Mosé - SOL : 188047 KTN 1774190 Fim
end;

procedure TfrmCadRegEvol.CdsDetAfterDelete(DataSet: TDataSet);
begin
  inherited;
  CdsDet.First;
  SalRef := cdsDet.FieldByName('Salario').AsFloat;
  FunRef := cdsDet.FieldByName('VLRFUNCAO').AsFloat; //Higor Nayde Ferreira Sol 188194 - Kintana 1779198
end;

procedure TfrmCadRegEvol.CdsDetAfterPost(DataSet: TDataSet);
begin
  inherited;
  SalRef := cdsDet.FieldByName('Salario').AsFloat;
  FunRef := cdsDet.FieldByName('VLRFUNCAO').AsFloat; //Higor Nayde Ferreira Sol 188194 - Kintana 1779198
end;
//Higor Nayde Ferreira Sol 188194 - Kintana 1779198 INICIO
procedure TfrmCadRegEvol.dbedFuncaoChange(Sender: TObject);
begin
  if (CdsDet.State in [dsInsert, dsEdit]) and (rgAltSalario.ItemIndex in [1, 3]) and
     (FunRef > 0) then   begin
    dbedPercFuncao.Value := ((dbedFuncao.Value - FunRef) * 100 / FunRef);
   // dbedFuncao.Value := ((CtrlEvolFunc.SelecionaFaixa(FloatToStr(dbspeStep2.Value),dblckFaixa2.Value))- (cdsDet.FieldByName('Salario').AsFloat));
    if dbedFuncao.Value < 0 then
       dbedFuncao.Value := dbedFuncao.Value *-1;
  end;
  if  (dbedFuncao.Value <= 0)then
      dbedSalTotal.Value := dbedSalario.Value
  else
      dbedSalTotal.Value:= dbedSalario.Value + dbedFuncao.Value;


 // dbedSalTotal.Value := dbedSalario.Value + dbedFuncao.Value;
  SalFunAtual :=  dbedFuncao.Value;
end;

procedure TfrmCadRegEvol.dbedPercFuncaoChange(Sender: TObject);
begin
  if (CdsDet.State in [dsInsert, dsEdit]) and (rgAltSalario.ItemIndex = 2) and
     (FunRef > 0) then  begin
       if FunRef >0 then
          dbedFuncao.Value := (100 + dbedPercFuncao.Value) * FunRef / 100
       else
       dbedFuncao.Value := 0.00;
         //dbedFuncao.Value := ((CtrlEvolFunc.SelecionaFaixa(FloatToStr(dbspeStep2.Value),dblckFaixa2.Value))- (cdsDet.FieldByName('Salario').AsFloat));
          if dbedFuncao.Value < 0 then
             dbedFuncao.Value := dbedFuncao.Value *-1;
          if  (dbedFuncao.Value <= 0)then
              dbedSalTotal.Value := dbedSalario.Value
          else
              dbedSalTotal.Value:= dbedSalario.Value + dbedFuncao.Value;

         //    dbedSalTotal.Value := dbedSalario.Value + dbedFuncao.Value;
   end;
end;
//Higor Nayde Ferreira Sol 188194 - Kintana 1779198 FIM


procedure TfrmCadRegEvol.CdsDetBeforeDelete(DataSet: TDataSet);
begin

  if (CdsDet.FieldByName('IDMOTIVO').AsInteger = 25)or (CdsDet.FieldByName('IDMOTIVO').AsInteger = 29)or (CdsDet.FieldByName('IDMOTIVO').AsInteger = 67) then    // SOL 221471
  begin
       MsgDlg('O histórico referente à Admissão não pode ser excluído.', 'Aviso', mtInformation, [mbOk, mbHelp], 0);
       if (MontaSelect.RetornouValor) then
       begin
           Sel(StrToFloat(MontaSelect.ValoresChave[0]));
       end;
       Exit;
  end;
  inherited;
end;

procedure TfrmCadRegEvol.AtualizaDiretoria;
begin
  {Início - Michelle Mota - SIG27758 - RNG04}
  CdsAux.Data := CtrlEvolFunc.ListDiretoriaEvolFunc(CdsLotacao.FieldByName('CODCENTROCUSTO').AsInteger);
  if (dblcLotac.text <> '') then
    begin
      edtDIRETORIA.Text := CdsAux.FieldByName('DIRETORIA').AsString;
      if (CdsDet.State in [dsInsert, dsEdit]) then
        CdsDet.FieldByName('DIRETORIA').AsString := CdsAux.FieldByName('DIRETORIA').AsString;
    end
  else
    edtDIRETORIA.Text := '';
  {Término - Michelle Mota - SIG27758 - RNG04}
end;

procedure TfrmCadRegEvol.dbedDatEfetKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  inherited;
  {Início - Michelle Mota - SIG 27758}
  if ((Trim(dbedDatEfet.Text) <> '') or (Length(Trim(dbedDatEfet.Text))>9)) and
     (Key <> VK_DELETE) then
    begin
      if (SalRef = 0) then
        SalRef := Cds.FieldByName('SalarioAtual').asFloat;
      rgAltSalario.Enabled := true;
      gbxSalario.Enabled := true;
      cmbSteps.Enabled := true;
    end
    else
      begin
        rgAltSalario.Enabled := False;
        gbxSalario.Enabled := False;
        cmbSteps.Enabled := False;
        SalRef := 0;
      end;         
  {Término - Michelle Mota - SIG 27758} 
end;

procedure TfrmCadRegEvol.dbedDatEfetChange(Sender: TObject);
begin
  inherited;
    {Início - Michelle Mota - SIG 27758}
  if ((Trim(dbedDatEfet.Text) <> '') or (Length(Trim(dbedDatEfet.Text))>9)) then
    begin
      if (SalRef = 0) then
        SalRef := Cds.FieldByName('SalarioAtual').asFloat;
      rgAltSalario.Enabled := true;
      gbxSalario.Enabled := true;
      cmbSteps.Enabled := true;
    end
    else
      begin
        rgAltSalario.Enabled := False;
        gbxSalario.Enabled := False;
        cmbSteps.Enabled := False;
        SalRef := 0;
      end;         
  {Término - Michelle Mota - SIG 27758}
end;

procedure TfrmCadRegEvol.dblcCargoExit(Sender: TObject);
begin
  inherited;
  {Início - Michelle Mota - SIG27758}
  if (CdsDet.State in [dsInsert, dsEdit]) then
  begin
    CdsDet.FieldByName('TITULO').asString := CdsCargo.FieldByName('TITULO').asString;
    rgAltSalarioClick(Self);
  end;
  {Término - Michelle Mota - SIG27758}
end;

end.
