{ ------------------------------------------------------------------------------------------------
N. Sol..........: 171426
N. Kintana......: 1537613
Data............: 01/05/2012
Responsável.....: Edilaine Ferraresi
Descrição.......: Inclusão de novas faixas salariais (de 9 para 20)
--------------------------------------------------------------------------------------------------}

unit fCadRegSolic;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs, fCadastroMT,
  cmseldlg, wwidlg, Db, Wwdatsrc, DBCtrls, MAHlpBtn, StdCtrls, Buttons, ComCtrls, ToolWin,
  ExtCtrls, wwdblook, DBTables, Mask, TB97, wwdbedit, TB97Ctls, TB97Tlbr, IvDictio, IvMulti,
  IvEMulti, CMProcuraSubTipo, wwdbdatetimepicker, CMDateTimePicker, CmEventosCadastro,
  wwDialog, ImgList, MontaSelect, TREdit, DBClient, uCMClientDataSet, uCtrlRegSolic,
  uCtrlListTerceirosRH, uCtrlGlobalRH, uCtrlPessoaFuncionario, uCtrlMotivo, uCtrlCargo,
  uCtrlTabelaHay, uCtrlPessoaFilialPessoa, uCtrlFaixaSal;

type
  TEventoValor = procedure (Sender: TObject; ID: double) of object;
  TCMProcuraSubTipo = class(CMProcuraSubTipo.TCMProcuraSubTipo)
  protected
    FAfterApertouBotao: TEventoValor;
    procedure ApertouBotao; override;
  public
    property AfterApertouBotao: TEventoValor read FAfterApertouBotao write FAfterApertouBotao;
  end;

  TfrmCadRegSolic = class(TfrmCadastroMT)
    gbxIdentif: TGroupBox;
    gbxReq: TGroupBox;
    gbxInd: TGroupBox;
    GroupBox4: TGroupBox;
    gbxOBS: TGroupBox;
    dbedNumero: TDBEdit;
    Label2: TLabel;
    Label1: TLabel;
    dbedData: TCMDateTimePicker;
    Label3: TLabel;
    dblcTipoEv: TwwDBLookupCombo;
    rgSituacao: TDBRadioGroup;
    dbmObser: TDBMemo;
    dsFunc: TwwDataSource;
    CMProcuraReq: TCMProcuraSubTipo;
    CdsFaixaSal: TCMClientDataSet;
    CdsFunc: TCMClientDataSet;
    CdsMotivo: TCMClientDataSet;
    edCargoReq: TEdit;
    CdsCargo: TCMClientDataSet;
    CMProcuraInd: TCMProcuraSubTipo;
    edCargoInd: TEdit;
    dbedDatCargo: TDBEdit;
    dbedSalAtual: TDBRealEdit;
    dbrgTipoSalar: TDBRadioGroup;
    dbedDatSalar: TDBEdit;
    Label5: TLabel;
    dbedDatEfet: TCMDateTimePicker;
    rgAltSalario: TRadioGroup;
    gbxSalario: TGroupBox;
    Label4: TLabel;
    Label6: TLabel;
    dbedTipoSal: TDBRadioGroup;
    dbedSalario: TDBRealEdit;
    dbedPerc: TDBRealEdit;
    gbxStepsFaixa: TGroupBox;
    cmbSteps: TComboBox;
    Label8: TLabel;
    dblcCargo: TwwDBLookupCombo;
    Label9: TLabel;
    dblcEstab: TwwDBLookupCombo;
    dblcLotacao: TwwDBLookupCombo;
    CdsCCusto: TCMClientDataSet;
    CdsEstab: TCMClientDataSet;
    edNomeCCusto: TEdit;
    procedure FormCreate(Sender: TObject);
    procedure bbtnConfirmarClick(Sender: TObject);
    procedure rgSituacaoClick(Sender: TObject);
    procedure sbtnAlterarClick(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure CmeCadastroFind(Sender: TObject);
    procedure dbedSalarioChange(Sender: TObject);
    procedure dbedPercChange(Sender: TObject);
    procedure dblcCargoCloseUp(Sender: TObject; LookupTable, FillTable: TDataSet; modified: Boolean);
    procedure rgAltSalarioClick(Sender: TObject);
    procedure cmbStepsChange(Sender: TObject);
    procedure CdsFuncAfterScroll(DataSet: TDataSet);
    procedure CdsAfterInsert(DataSet: TDataSet);
    procedure CmeCadastroAfterConfirma(Sender: TObject);
    procedure CmeCadastroApplyInsert(sender: TObject; var Accept: Boolean);
    procedure CmeCadastroApplyEdit(sender: TObject; var Accept: Boolean);
    procedure CmeCadastroApplyDelete(sender: TObject; var Accept: Boolean);
    procedure dblcLotacaoChange(Sender: TObject);
    procedure bbtnCancelarClick(Sender: TObject);
    procedure CmeCadastroDelete(Sender: TObject);
    procedure dsStateChange(Sender: TObject);
  private
    CtrlRegSolic: TCtrlRegSolic;
    CtrlListTerceirosRH: TCtrlListTerceirosRH;
    CtrlGlobalRH: TCtrlGlobalRH;
    CtrlPessoaFuncionario: TCtrlPessoaFuncionario;
    CtrlMotivo: TCtrlMotivo;
    CtrlCargo: TCtrlCargo;
    CtrlTabelaHay: TCtrlTabelaHay;
    CtrlPessoaFilialPessoa: TCtrlPessoaFilialPessoa;
    CtrlFaixaSal: TCtrlFaixaSal;

    IndPolitica, NumSteps: integer;

    procedure Sel(Id_Solic_Alter_Func: double);
    procedure ConfirmarFUNCEF;
    procedure ImprimirCarta;
    procedure SetNomeCargoIndicado(ID: double);
    procedure SetNomeCargoRequisitante(ID: double);
    procedure SetNomeCCusto;
    procedure OnClicouBotao(Sender: TObject; ID: double);
    function  GravarRegistro(Exclusao: boolean): boolean;
    procedure LimparNome;
  end;

var
  frmCadRegSolic: TfrmCadRegSolic;

implementation

uses uMensErro, uSistema, uCMTypes, uModulo, uCtrlPadroes, uCtrlFuncoesRH, uCtrlUsoGeralRH,
  fParamCartaComunicado, dCds;

{$R *.DFM}

procedure TfrmCadRegSolic.FormCreate(Sender: TObject);
begin
  inherited;
  CtrlRegSolic := TCtrlRegSolic.Create(Sistema.IdEmpresa, Sistema.TipoEmpresa,
    Sistema.UsaRAD, Sistema.IdUsuario);
  CtrlRegSolic.InitializeAs(Padroes);
  CtrlRegSolic.CdsSolAltFunc := Cds;
  CtrlRegSolic.CdsFunc := CdsFunc;

  CtrlListTerceirosRH := TCtrlListTerceirosRH.Create(CtrlUsoGeralRH.UsuXFilial,
    CtrlUsoGeralRH.UsuXCCusto, CtrlUsoGeralRH.IdUsuarioGeral);
  CtrlListTerceirosRH.InitializeAs(Padroes);

  CtrlGlobalRH := TCtrlGlobalRH.Create;
  CtrlGlobalRH.InitializeAs(Padroes);

  CtrlMotivo := TCtrlMotivo.Create;
  CtrlMotivo.InitializeAs(Padroes);

  CtrlCargo := TCtrlCargo.Create;
  CtrlCargo.InitializeAs(Padroes);

  CtrlTabelaHay := TCtrlTabelaHay.Create;
  CtrlTabelaHay.InitializeAs(Padroes);

  CtrlPessoaFuncionario := TCtrlPessoaFuncionario.Create(CtrlUsoGeralRH.UsuXFilial,
    CtrlUsoGeralRH.UsuXCCusto, CtrlUsoGeralRH.IdUsuarioGeral);
  CtrlPessoaFuncionario.InitializeAs(Padroes);

  CtrlPessoaFilialPessoa := TCtrlPessoaFilialPessoa.Create(CtrlUsoGeralRH.UsuXFilial,
    CtrlUsoGeralRH.UsuXCCusto, CtrlUsoGeralRH.IdUsuarioGeral);
  CtrlPessoaFilialPessoa.InitializeAs(Padroes);

  CtrlFaixaSal := TCtrlFaixaSal.Create(Sistema.IdEmpresa);
  CtrlFaixaSal.InitializeAs(Padroes);

  if (Sistema.IdModulo = MODAUTO) then
    HelpContext := 4170014;

  if (CtrlUsoGeralRH.IdUsuarioGeral <> '') then
  begin
    MsgDlg('Tela de Uso Restrito a Usuários RH e Gestores.', 'Aviso', mtInformation,
      [mbOk,mbHelp], 0);
    Close;
    exit;
  end;

  if (CtrlUsoGeralRH.UsuXCCusto <> '') then
  begin
    CMProcuraInd.MontaSelect.Filtro.Add('FUNCIONARIO.CODCENTROCUSTO IN ' + CtrlUsoGeralRH.UsuXCCusto);
    MontaSelect.Filtro.Add('S.CODCENTROCUSTO IN ' + CtrlUsoGeralRH.UsuXCCusto);
  end;

  if (CtrlUsoGeralRH.UsuXFilial <> '') then
  begin
    CMProcuraInd.MontaSelect.Filtro.Add('FUNCIONARIO.IDESTAB IN ' + CtrlUsoGeralRH.UsuXFilial);
    MontaSelect.Filtro.Add('S.IDESTAB IN ' + CtrlUsoGeralRH.UsuXFilial);
  end;

  if (CtrlUsoGeralRH.UsuXCCusto <> '') or (CtrlUsoGeralRH.UsuXFilial <> '') then
  begin
    CMProcuraReq.MontaSelect.Filtro.Add('FUNCIONARIO.IDPESSOA = ' + IntToStr(Sistema.IdUsuario));
    MontaSelect.Filtro.Add('S.IDREQUISITANTE = ' + IntToStr(Sistema.IdUsuario));
  end;

  Sel(-1);

  dmCds.Cds.Data := CtrlGlobalRH.GetParamRH('NUMSTEPS, INDPOLITICA');
  CdsMotivo.Data := CtrlMotivo.ListMotivo_Id_e_Descricao('A');
  CdsCargo.Data := CtrlCargo.ListCargo;
  CdsCCusto.Data := CtrlListTerceirosRH.ListCCusto(IntToStr(Sistema.IdEmpresa));
  CdsEstab.Data := CtrlPessoaFilialPessoa.ListPessoaEstab(IntToStr(Sistema.IdEmpresa));

  IndPolitica := dmCds.Cds.FieldByName('INDPOLITICA').asInteger;
  NumSteps := dmCds.Cds.FieldByName('NUMSTEPS').asInteger;
  if (IndPolitica = 1) then
  begin
    gbxStepsFaixa.Caption := 'Valor Hay';
    rgAltSalario.Items[3] := 'Hay';
  end;

  CMProcuraInd.AfterApertouBotao := OnClicouBotao;
  CMProcuraReq.AfterApertouBotao := OnClicouBotao;
end;

procedure TfrmCadRegSolic.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  FreeAndNil(CtrlListTerceirosRH);
  FreeAndNil(CtrlRegSolic);
  FreeAndNil(CtrlGlobalRH);
  FreeAndNil(CtrlMotivo);
  FreeAndNil(CtrlCargo);
  FreeAndNil(CtrlTabelaHay);
  FreeAndNil(CtrlPessoaFilialPessoa);
  FreeAndNil(CtrlPessoaFuncionario);
  FreeAndNil(CtrlFaixaSal);
  inherited;
end;

procedure TfrmCadRegSolic.CmeCadastroFind(Sender: TObject);
begin
  inherited;
  if (MontaSelect.RetornouValor) then
    Sel(StrToFloat(MontaSelect.ValoresChave[0]));
end;

procedure TfrmCadRegSolic.CmeCadastroDelete(Sender: TObject);
begin
  inherited;
  CdsFunc.Delete;
  LimparNome;
end;

procedure TfrmCadRegSolic.CmeCadastroAfterConfirma(Sender: TObject);
begin
  //inherited;
end;

procedure TfrmCadRegSolic.CmeCadastroApplyInsert(sender: TObject; var Accept: Boolean);
begin
  inherited;
  Accept := GravarRegistro(false);
end;

procedure TfrmCadRegSolic.CmeCadastroApplyEdit(sender: TObject; var Accept: Boolean);
begin
  inherited;
  Accept := GravarRegistro(false);
end;

procedure TfrmCadRegSolic.CmeCadastroApplyDelete(sender: TObject; var Accept: Boolean);
begin
  inherited;
  Accept := GravarRegistro(true);
end;

procedure TfrmCadRegSolic.dsStateChange(Sender: TObject);
begin
  inherited;
  rgAltSalarioClick(Sender);
end;

procedure TfrmCadRegSolic.CdsFuncAfterScroll(DataSet: TDataSet);
begin
  if (Cds.State = dsInsert) then
  begin
    Cds.FieldByName('IDESTAB').asFloat := CdsFunc.FieldByName('IDESTAB').asFloat;
    Cds.FieldByName('IDEMPRESA').asInteger := CdsFunc.FieldByName('IDEMPRESA').asInteger;
    Cds.FieldByName('CODCENTROCUSTO').asString := CdsFunc.FieldByName('CODCENTROCUSTO').asString;
    Cds.FieldByName('IDCARGO').asFloat := CdsFunc.FieldByName('IDCARGO').asFloat;
    Cds.FieldByName('NOVO_SALARIO').asFloat := CdsFunc.FieldByName('SALARIOATUAL').asFloat;
    Cds.FieldByName('NOVO_TIPO_SAL').asString := CdsFunc.FieldByName('TIPOPAGAMENTO').asString;
    Cds.FieldByName('PERC_REAJ').asFloat := 0;
  end;
end;

procedure TfrmCadRegSolic.CdsAfterInsert(DataSet: TDataSet);
begin
  inherited;
  Cds.FieldByName('ID_SOLIC_ALTER_FUNC').asFloat := CtrlRegSolic.GetProximoID(Date);
  Cds.FieldByName('DATA_SOLIC_ALTER').asDateTime := Date;
  Cds.FieldByName('DATA_EFETIV_ALTER').asDateTime := Date;
  Cds.FieldByName('SITUACAO_SOLIC').asInteger := 0;
  Cds.FieldByName('FLAG_PERC_SALAR').asInteger := 0;

  if (CtrlUsoGeralRH.UsuXCCusto <> '') or (CtrlUsoGeralRH.UsuXFilial <> '') then
    Cds.FieldByName('IDREQUISITANTE').asInteger := Sistema.IdUsuario;

  edCargoInd.Text := '';
  edCargoReq.Text := '';
  edNomeCCusto.Text := '';
  CdsFunc.EmptyDataSet;
end;

procedure TfrmCadRegSolic.dblcLotacaoChange(Sender: TObject);
begin
  SetNomeCCusto;
end;

procedure TfrmCadRegSolic.dbedSalarioChange(Sender: TObject);
begin
  if (ds.State in [dsInsert, dsEdit]) and (rgAltSalario.ItemIndex in [1, 3]) and
     (dbedSalAtual.Value > 0) then
    dbedPerc.Value := (dbedSalario.Value - dbedSalAtual.Value) * 100 / dbedSalAtual.Value;
end;

procedure TfrmCadRegSolic.dbedPercChange(Sender: TObject);
begin
  if (ds.State in [dsInsert, dsEdit]) and (rgAltSalario.ItemIndex = 2) and
     (dbedSalAtual.Value > 0) then
    dbedSalario.Value := (100 + dbedPerc.Value) * dbedSalAtual.Value / 100;
end;

procedure TfrmCadRegSolic.cmbStepsChange(Sender: TObject);
begin
  // Edilaine Ferraresi - SOL 171426 / KTN 1537613
  if (IndPolitica = 0) then
     dbedSalario.Value := StrToFloat(FU.TiraCaracter(Copy(cmbSteps.Text,7,14), '.'))
  else  // Edilaine Ferraresi - SOL 171426 / KTN 1537613 - fim
     dbedSalario.Value := FU.StringToFloat(cmbSteps.Text);
end;

procedure TfrmCadRegSolic.dblcCargoCloseUp(Sender: TObject; LookupTable,
  FillTable: TDataSet; modified: Boolean);
begin
  if (Modified) then
  begin
    if (Modulo.IdContraCheque = FUNCEF) then
      rgAltSalario.ItemIndex := 3;
    rgAltSalarioClick(Sender);
  end;
end;

procedure TfrmCadRegSolic.rgAltSalarioClick(Sender: TObject);
var
  c: integer;
begin
  cmbSteps.Text := '';
  dbedSalario.Enabled := (rgAltSalario.ItemIndex = 1);
  dbedPerc.Enabled := (rgAltSalario.ItemIndex = 2);
  gbxStepsFaixa.Visible := (rgAltSalario.ItemIndex = 3);

  if (rgAltSalario.ItemIndex = 3) then
  begin
    cmbSteps.Items.Clear;
    if (IndPolitica = 0) then // Faixas Salariais do cargo
    begin
      CdsFaixaSal.Data := CtrlFaixaSal.ListFaixaCargo(Cds.FieldByName('IDCARGO').asFloat);

      if not(CdsFaixaSal.IsEmpty) then
      begin
        for c:=1 to NumSteps do
          cmbSteps.Items.Add(IntToStr(c) +'  =  '+
            FloatToStrF(CdsFaixaSal.FieldByName('STEP' +IntToStr(c)).asFloat, ffNumber, 14, 2));

        // PCS da Funcef
        if (Modulo.IdContraCheque = FUNCEF) and (TControl(Sender).Name = 'dblcCargo') then
          dbedSalario.Value := CdsFaixaSal.FieldByName('STEP1').asFloat;
      end
      else
      begin
        MsgDlg('Não Existe Faixa Salarial Associada.', 'Aviso', mtInformation, [mbOk, mbHelp], 0);
        if (rgAltSalario.CanFocus) then
          rgAltSalario.SetFocus;
        exit;
      end;
    end
    else // Tabela Hay
      cmbSteps.Items.Add(FloatToStrF(
        CtrlTabelaHay.GetValorHay(Cds.FieldByName('IDCARGO').asInteger), ffNumber, 14, 2));
  end;
end;

procedure TfrmCadRegSolic.rgSituacaoClick(Sender: TObject);
begin
  if (rgSituacao.ItemIndex = 1) then
  begin
    if (Cds.FieldByName('IDPROCESSO').asInteger > 0) and
       (CtrlListTerceirosRH.GetFlgOk_RAD(Cds.FieldByName('IDPROCESSO').asFloat) = 'N') then
    begin
      MsgDlg('Processo não está concluído.' +CR_LF+ 'Solicitação não pode ser efetivada.',
             'Informação', mtInformation, [mbOk,mbHelp], 0);
      rgSituacao.ItemIndex := 0;
      exit;
    end;

    if (MsgDlg('Confirma a Efetivação?', 'Confirmação', mtConfirmation,
        [mbYes, mbNo], 0) = mrYes) then
    begin
      Cds.FieldByName('SITUACAO_SOLIC').asInteger := 1;
      ImprimirCarta;
      CtrlRegSolic.ImplementarSolicitacao := true;
      bbtnConfirmarClick(rgSituacao);
      CtrlRegSolic.ImplementarSolicitacao := false;
    end
    else
      rgSituacao.ItemIndex := 0;
  end;
end;

procedure TfrmCadRegSolic.sbtnAlterarClick(Sender: TObject);
begin
  if (Cds.FieldByName('SITUACAO_SOLIC').asInteger = 1) then
  begin
    sbtnAlterar.Down := false;
    MsgDlg('Solicitação já efetivada.', 'Aviso', mtInformation, [mbOk, mbHelp], 0);
  end
  else
    inherited;
end;

procedure TfrmCadRegSolic.bbtnConfirmarClick(Sender: TObject);
var
  bInserindo: boolean;
begin
  if (Trim(dblcTipoEv.Text) = '') then
  begin
    MsgDlg('Informe o Tipo de Evento', 'Aviso', mtInformation, [mbOk, mbHelp], 0);
    dblcTipoEv.SetFocus;
  end
  else
  begin
    bInserindo := (Cds.State = dsInsert);
    ConfirmarFUNCEF;
    inherited;
    if not(bInserindo) then
      CmeCadastroFind(Sender);
  end;    
end;

procedure TfrmCadRegSolic.bbtnCancelarClick(Sender: TObject);
var
  ControleAtual: TWinControl;
begin
  ControleAtual := Self.ActiveControl;
  inherited;
  if (Assigned(ControleAtual)) and (TComponent(ControleAtual).Name = 'bbtnCancelar') then
  begin
    if (Cds.FieldByName('ID_SOLIC_ALTER_FUNC').asFloat = 0) then
      Sel(-1)
    else
      Sel(Cds.FieldByName('ID_SOLIC_ALTER_FUNC').asFloat);
  end;    
end;

// -----------------------------------------------------------------------------------------
// Funções do Form
// -----------------------------------------------------------------------------------------

procedure TfrmCadRegSolic.Sel(Id_Solic_Alter_Func: double);
begin
  Cds.Data := CtrlRegSolic.ListRegSolic(Id_Solic_Alter_Func);
  if (Cds.IsEmpty) then
  begin
    LimparNome;
    CdsFunc.Data := CtrlPessoaFuncionario.ListFuncionario('-1');
  end
  else
  begin
    SetNomeCargoIndicado(Cds.FieldByName('IDINDICADO').asFloat);
    SetNomeCargoRequisitante(Cds.FieldByName('IDREQUISITANTE').asFloat);
    SetNomeCCusto;
  end;
end;

function TfrmCadRegSolic.GravarRegistro(Exclusao: boolean): boolean;
var
  sOBS_RAD: string;
begin
  if not(Exclusao) and (Sistema.UsaRAD) then
    sOBS_RAD :=
      'Solicitação de: ' +dblcTipoEv.Text +CR_LF+
      'Indicado: ' +CMProcuraInd.Text +CR_LF+
      'Data da Alteração: ' +dbedDatEfet.Text+
      FU.IFF(edCargoInd.Text = dblcCargo.Text, '', CR_LF+ 'Cargo Atual: '+edCargoInd.Text +CR_LF+
      'Cargo Proposto: '+dblcCargo.Text);

  Result := CtrlRegSolic.GravarRegSolic(sOBS_RAD);
  if (Result) then
  begin
    if (CtrlRegSolic.MessageInfo <> '') then
      MsgDlg(CtrlRegSolic.MessageInfo, 'Aviso', mtInformation, [mbOk, mbHelp], 0);
  end
  else
    raise Exception.Create(CtrlRegSolic.MessageInfo);
end;

procedure TfrmCadRegSolic.SetNomeCargoIndicado(ID: double);
begin
  if Assigned(CtrlCargo) then
  begin
    CdsFunc.Data := CtrlPessoaFuncionario.ListFuncionario(FloatToStr(ID));
    dmCds.Cds.Data := CtrlCargo.ListCargo(CdsFunc.FieldByName('IDCARGO').asFloat);
    edCargoInd.Text := dmCds.Cds.FieldByName('TITULO').asString;
  end;
end;

procedure TfrmCadRegSolic.SetNomeCargoRequisitante(ID: double);
begin
  if Assigned(CtrlPessoaFuncionario) and Assigned(CtrlCargo) then
  begin
    dmCds.Cds.Data := CtrlPessoaFuncionario.ListFuncionario(FloatToStr(ID));
    dmCds.Cds.Data := CtrlCargo.ListCargo(dmCds.Cds.FieldByName('IDCARGO').asFloat);
    edCargoReq.Text := dmCds.Cds.FieldByName('TITULO').asString;
  end;
end;

procedure TfrmCadRegSolic.SetNomeCCusto;
begin
  if Assigned(CtrlListTerceirosRH) then
  begin
    dmCds.Cds.Data := CtrlListTerceirosRH.ListCCusto(IntToStr(Sistema.IdEmpresa),
      dblcLotacao.LookupValue);
    edNomeCCusto.Text := dmCds.Cds.FieldByName('NOME').asString;
  end;
end;

procedure TfrmCadRegSolic.ConfirmarFUNCEF;
var
  NumDias, NumMeses, NumAnos: integer;
begin
  if (Modulo.IdContraCheque = FUNCEF) then // PCS da Funcef
  begin
    FU.CalculaDifData(CdsFunc.FieldByName('DATACARGO').asString, dbedDatEfet.Text,
      NumDias, NumMeses, NumAnos);

    if (edCargoInd.Text <> dblcCargo.Text) and (NumMeses < 12) then
    begin
      MsgDlg('Prazo Mínimo de 12 Meses no Cargo Não Respeitado.', 'Aviso',
        mtInformation, [mbOk,mbHelp], 0);
      exit;
    end;

    FU.CalculaDifData(CdsFunc.FieldByName('DATASALARIO').asString, dbedDatEfet.Text,
      NumDias, NumMeses, NumAnos);

    if (edCargoInd.Text = dblcCargo.Text) and (NumMeses < 12) then
    begin
      MsgDlg('Prazo Mínimo de 12 Meses no Nível Não Respeitado.', 'Aviso',
        mtInformation, [mbOk,mbHelp], 0);
      exit;
    end;

    FU.CalculaDifData(CdsFunc.FieldByName('DATALOTACAO').asString, dbedDatEfet.Text,
      NumDias, NumMeses, NumAnos);

    if (edCargoInd.Text = dblcCargo.Text) and (NumMeses < 6) then
    begin
      MsgDlg('Prazo Mínimo de 6 Meses na Área Não Respeitado.', 'Aviso',
        mtInformation, [mbOk,mbHelp], 0);
      exit;
    end;

    if (edCargoInd.Text = dblcCargo.Text) and (dbedPerc.Value > 13.49) then
    begin
      MsgDlg('Percentual Máximo de 13,49% Não Respeitado.', 'Aviso',
        mtInformation, [mbOk,mbHelp], 0);
      exit;
    end;
  end;
end;

procedure TfrmCadRegSolic.ImprimirCarta;
var
  iNumCarta: integer;
begin
  if (MsgDlg('Imprime a carta correspondente?', 'Aviso', mtConfirmation,
      [mbYes, mbNo], 0) = mrYes) then
  begin
    iNumCarta := CtrlRegSolic.GetNumCartaSolic(Cds.FieldByName('ID_SOLIC_ALTER_FUNC').asFloat);
    if (iNumCarta = 0) then
    begin
      MsgDlg('Não há carta para esta solicitação.', 'Aviso',
        mtInformation, [mbOk, mbHelp], 0);
      exit;
    end;

    with TfrmParamCartaComunicado.Create(Self) do
    try
      Visible := false;
      TipoParam := CARTA_SEM_SEL;
      IdPessoa := Cds.FieldByName('IDINDICADO').asString;
      NumCarta := IntToStr(iNumCarta);
      ShowModal;
    finally
      Free;
    end;
  end;
end;

procedure TfrmCadRegSolic.LimparNome;
begin
  edCargoInd.Text := '';
  edCargoReq.Text := '';
  edNomeCCusto.Text := '';
end;

procedure TCMProcuraSubTipo.ApertouBotao;
begin
  inherited;
  if Assigned(FAfterApertouBotao) and (MontaSelect.RetornouValor) then
    FAfterApertouBotao(Self, StrToFloat(MontaSelect.ValoresChave[0]));
end;

procedure TfrmCadRegSolic.OnClicouBotao(Sender: TObject; ID: double);
begin
  inherited;
  if (TComponent(Sender).Name = 'CMProcuraInd') then
    SetNomeCargoIndicado(ID)
  else
  if (TComponent(Sender).Name = 'CMProcuraReq') then
    SetNomeCargoRequisitante(ID);
end;

end.
