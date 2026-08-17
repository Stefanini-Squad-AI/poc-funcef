unit FCadRegEvol;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  fCadastroCS, FCadMestreDetCS, IvDictio, IvMulti, IvEMulti, MontaSelect, DBTables, Db,
  Wwdatsrc, Wwquery, TB97Ctls, MAHlpBtn, TB97Tlbr, StdCtrls, Buttons, TB97,
  Grids, Wwdbigrd, Wwdbgrid, ComCtrls, TabControlDetalhe, ExtCtrls,
  Mask, DBCtrls, Wwtable, CMProcura, wwdbedit, TREdit,
  wwdbdatetimepicker, CMDateTimePicker, wwdblook, CmEventosCadastro,
  ImgList;

type
  TfrmCadRegEvol = class(TfrmCadMestreDetalheCS)
    Label1: TLabel;
    Label10: TLabel;
    updDet: TUpdateSQL;
    qryMotivo: TwwQuery;
    Label2: TLabel;
    dblcTipoEv: TwwDBLookupCombo;
    rgAltSalario: TRadioGroup;
    gbxSalario: TGroupBox;
    Label5: TLabel;
    Label8: TLabel;
    dbrgTipoSalar: TDBRadioGroup;
    gbxCargo: TGroupBox;
    qryCargo: TwwQuery;
    dblcCargo: TwwDBLookupCombo;
    gbxLotacao: TGroupBox;
    qryEstab: TwwQuery;
    qryLotac: TwwQuery;
    dblcEstab: TwwDBLookupCombo;
    dblcLotac: TwwDBLookupCombo;
    qryFaixa: TwwQuery;
    Label4: TLabel;
    dbedDatEfet: TCMDateTimePicker;
    Label3: TLabel;
    Label7: TLabel;
    dbedSalario: TDBRealEdit;
    dbedPerc: TDBRealEdit;
    gbxStepsFaixa: TGroupBox;
    cmbSteps: TComboBox;
    qryCesAux: TwwQuery;
    qryDet: TwwQuery;
    qryParamRH: TwwQuery;
    qryDetIDPESSOA: TFloatField;
    qryDetDATAALTERFUNC: TDateTimeField;
    qryDetIDEMPRESA: TFloatField;
    qryDetCODCENTROCUSTO: TStringField;
    qryDetSALARIO: TFloatField;
    qryDetIDMOTIVO: TFloatField;
    qryDetIDESTAB: TFloatField;
    qryDetIDCARGO: TFloatField;
    qryDetTIPOPAGAMENTO: TStringField;
    qryDetPERC_REAJ: TFloatField;
    qryDetDESCRICAO: TStringField;
    qryDetTITULO: TStringField;
    qryDetFILIAL: TStringField;
    qryDetCENTROCUSTO: TStringField;
    dbedMat: TwwDBEdit;
    dbedNome: TwwDBEdit;
    dbedSitFunc: TwwDBEdit;
    dbedCargo: TwwDBEdit;
    dbedNomeCC: TwwDBEdit;
    Toolbar972: TToolbar97;
    sbtnImprimirEtiqueta: TSpeedButton;
    sbtnConfigEtiqueta: TSpeedButton;
    sbtnDesfConfigEtiqueta: TSpeedButton;
    gbxCargo2: TGroupBox;
    dblcFuncao: TwwDBLookupCombo;
    qryDetIDFUNCAO: TFloatField;
    qryCargo2: TwwQuery;
    qryDetFUNCAO: TStringField;
    procedure FormCreate(Sender: TObject);
    procedure rgAltSalarioClick(Sender: TObject);
    procedure cmbStepsChange(Sender: TObject);
    procedure bbtnOkDetClick(Sender: TObject);
    procedure dsDetStateChange(Sender: TObject);
    procedure dblcCargoCloseUp(Sender: TObject; LookupTable,
      FillTable: TDataSet; modified: Boolean);
    procedure dbedSalarioChange(Sender: TObject);
    procedure dbedPercChange(Sender: TObject);
    procedure dblcLotacCloseUp(Sender: TObject; LookupTable,
      FillTable: TDataSet; modified: Boolean);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure dbedDatEfetExit(Sender: TObject);
    procedure qryDetBeforePost(DataSet: TDataSet);
    procedure sbtnProcurarClick(Sender: TObject);
    procedure sbtnImprimirEtiquetaClick(Sender: TObject);
    procedure sbtnConfigEtiquetaClick(Sender: TObject);
    procedure sbtnDesfConfigEtiquetaClick(Sender: TObject);
    procedure CmeCadastroConfirma(Sender: TObject);
    procedure CmeDetalheInsert(Sender: TObject);
    procedure CmeCadastroFind(Sender: TObject);
  private
    SalRef: real;

    procedure AtualizarDetalhe(IdPessoa: integer);
  end;

var
  frmCadRegEvol: TfrmCadRegEvol;

implementation

uses uCMTypes, uSistema, uMensErro, uDataBase, dBaseDados, uFuncoesUteis, UsoGeralRH,
  uImprimeRelatorio, dRelatorioEtiqAltCTPS, uIntegraPrevRH;

{$R *.DFM}

procedure TfrmCadRegEvol.AtualizarDetalhe (IDPessoa: integer);
begin
  qry.Close;
  qry.ParamByName('IDPESSOA').asInteger := IDPessoa;
  qry.Open;

  qryDet.Close;
  qryDet.ParamByName('IDPESSOA').asInteger := IDPessoa;
  qryDet.Open;
end;

procedure TfrmCadRegEvol.FormCreate(Sender: TObject);
begin
  inherited;
  ImprimeRelatorio := TImprimeRelatorio.Create;
  // Registro o Form de visualização das Etiquetas e Carrego a configuração destas
  with (dtmRelatorioEtiqAltCTPS) do
    ImprimeRelatorio.Iniciar(dsgnEtiquetasAltCTPS, rpEtiquetasAltCTPS, ppEtiquetasAltCTPS,
      qryEtiquetasAltCTPS, GetLayoutPadrao, 'Etiquetas para Atualização de CTPS',
      'rpEtiquetasAltCTPS', 'Etiquetas.tmp', 21);

  // Monto o filtro para os funcionários
  MontaSelect.Filtro.Clear;

  if (sUsuXccusto <> '') then
    MontaSelect.Filtro.Add('FUNCIONARIO.CODCENTROCUSTO IN ' +sUsuXccusto);

  if (sUsuXfilial <> '') then
    MontaSelect.Filtro.Add('FUNCIONARIO.IDESTAB IN ' +sUsuXfilial);

  with (MontaSelect.Filtro) do
  begin
    Add ('EMPRESAPROP.IDPESSOA = FUNCIONARIO.IDEMPRESA');
    Add ('CARGO.IDCARGO        = FUNCIONARIO.IDCARGO');
    Add ('FUNCIONARIO.IDPESSOA = PESSOA.IDPESSOA');
  end;

  // Estabelecimento(s) habilitados para o usuário
  if (sUsuXfilial <> '') then
  begin
    if (Pos(',',sUsuXfilial) > 0) then
      qryEstab.SQL[5] := '  (PJ.IDPESSOA IN ' +sUsuXfilial+ ') AND'
    else
      qryEstab.SQL[5] := '  (PJ.IDPESSOA  = ' +sUsuXfilial+ ') AND';
  end;

  qryEstab.ParamByName('EMPRESA').asInteger := Sistema.IdEmpresa;
  qryEstab.Open;

  // Abro demais Querys
  qryLotac.ParamByName('EMPRESA').Value := Sistema.IdEmpresa;
  qryLotac.Open;

  qryParamRH.Open;
  gbxCargo2.Visible := (qryParamRH.FieldByName('FLGDOISCARGOS').asInteger = 1);

  qryDet.Close;

  if (qryParamRH.FieldByName('FLGDOISCARGOS').asInteger = 1) then
     qryCargo2.Open
  else
  with dbgrdDet, dbgrdDet.DataSource.DataSet do
  begin
    DisableControls;
    Selected.Delete(6);
    EnableControls;
  end;

  qryMotivo.Open;
  qryCargo.Open;

  qry.Close;
  qry.Prepare;
  qryDet.Close;
  qryDet.Prepare;

  // Apresento o MontaSelect antes de visualizar o Form
  sbtnProcurarClick(Self);

  if (MontaSelect.ValoresChave.Count = 0) or (MontaSelect.ValoresChave[0] = '') then
    AtualizarDetalhe (-1);
end;

procedure TfrmCadRegEvol.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  ImprimeRelatorio.free;
  qryParamRH.Close;
  qryMotivo.Close;
  qryCargo.Close;
  qryCargo2.Close;
  qryLotac.Close;
  qryEstab.Close;
  qry.Close;
  qry.UnPrepare;
  qryDet.Close;
  qryDet.UnPrepare;
  inherited;
end;

procedure TfrmCadRegEvol.sbtnProcurarClick(Sender: TObject);
begin
  inherited;
  // Para fazer a procura na criação do Formulário
end;

procedure TfrmCadRegEvol.CmeCadastroFind(Sender: TObject);
begin
  if (MontaSelect.ValoresChave.Count > 0) and (MontaSelect.ValoresChave[0] <> '')  then
    AtualizarDetalhe (StrToInt(MontaSelect.ValoresChave[0]));
end;

procedure TfrmCadRegEvol.CmeDetalheInsert(Sender: TObject);
begin
  inherited;
  qryDet.FieldByName('IdPessoa').asInteger      := qry.FieldByName('IdPessoa').asInteger;
  qryDet.FieldByName('IdEmpresa').asInteger     := qry.FieldByName('IdEmpresa').asInteger;
  qryDet.FieldByName('CodCentroCusto').asString := qry.FieldByName('CodCentroCusto').asString;
  qryDet.FieldByName('CentroCusto').asString    := qry.FieldByName('CentroCusto').asString;
  qryDet.FieldByName('IdCargo').asInteger       := qry.FieldByName('IdCargo').asInteger;
  if (qryParamRH.FieldByName('FLGDOISCARGOS').asInteger = 1) then
     qryDet.FieldByName('IdFuncao').asString       := qry.FieldByName('IdFuncao').asString;
  qryDet.FieldByName('IdEstab').asInteger       := qry.FieldByName('IdEstab').asInteger;
  qryDet.FieldByName('Salario').asFloat         := qry.FieldByName('SalarioAtual').asFloat;
  qryDet.FieldByName('TipoPagamento').asString  := qry.FieldByName('TipoPagamento').asString;
  qryDet.FieldByName('Perc_Reaj').asFloat       := 0;
end;

procedure TfrmCadRegEvol.qryDetBeforePost(DataSet: TDataSet);
begin
  inherited;
  qryDet.FieldByName('DESCRICAO').asString   := qryMotivo.FieldByName('DESCRICAO').asString;
  qryDet.FieldByName('TITULO').asString      := qryCargo.FieldByName('TITULO').asString;
  if (qryParamRH.FieldByName('FLGDOISCARGOS').asInteger = 1) then
     qryDet.FieldByName('FUNCAO').asString      := qryCargo2.FieldByName('TITULO').asString;
  qryDet.FieldByName('FILIAL').asString      := qryEstab.FieldByName('NOME').asString;
  qryDet.FieldByName('CENTROCUSTO').asString := qryLotac.FieldByName('NOME').asString;

  if (qryDet.FieldByName('DATAALTERFUNC').Value >= qry.FieldByName('DATASALARIO').Value) and
     (qryDet.FieldByName('SALARIO').asFloat <> qry.FieldByName('SALARIOATUAL').asFloat) then
  begin
    qry.FieldByName('DATASALARIO').Value    := qryDet.FieldByName('DATAALTERFUNC').Value;
    qry.FieldByName('SALARIOATUAL').asFloat := qryDet.FieldByName('SALARIO').asFloat;
    qry.FieldByName('TIPOPAGAMENTO').Value  := qryDet.FieldByName('TIPOPAGAMENTO').Value;
  end;


  if (qryDet.FieldByName('DATAALTERFUNC').Value >= qry.FieldByName('DATACARGO').Value) and
     (qryDet.FieldByName('IDCARGO').Value <> qry.FieldByName('IDCARGO').Value) then
  begin
    qry.FieldByName('DATACARGO').Value := qryDet.FieldByName('DATAALTERFUNC').Value;
    qry.FieldByName('IDCARGO').Value   := qryDet.FieldByName('IDCARGO').Value;
  end;

  if (qryParamRH.FieldByName('FLGDOISCARGOS').asInteger = 1) and
     (qryDet.FieldByName('DATAALTERFUNC').Value >= qry.FieldByName('DATACARGO2').Value) and
     (qryDet.FieldByName('IDFUNCAO').Value <> qry.FieldByName('IDFUNCAO').Value) then
  begin
    qry.FieldByName('DATACARGO2').Value := qryDet.FieldByName('DATAALTERFUNC').Value;
    qry.FieldByName('IDFUNCAO').Value   := qryDet.FieldByName('IDFUNCAO').Value;
  end;


  if (qryDet.FieldByName('DATAALTERFUNC').Value >= qry.FieldByName('DATALOTACAO').Value) and
     ((qryDet.FieldByName('CODCENTROCUSTO').Value <> qry.FieldByName('CODCENTROCUSTO').Value) or
      (qryDet.FieldByName('IDESTAB').Value <> qry.FieldByName('IDESTAB').Value)) then
  begin
    qry.FieldByName('DATALOTACAO').Value    := qryDet.FieldByName('DATAALTERFUNC').Value;
    qry.FieldByName('IDESTAB').Value        := qryDet.FieldByName('IDESTAB').Value;
//    qry.FieldByName('IDEMPRESA').Value      := qryDet.FieldByName('IDEMPRESA').Value;
    qry.FieldByName('CODCENTROCUSTO').Value := qryDet.FieldByName('CODCENTROCUSTO').Value;
  end;
end;

procedure TfrmCadRegEvol.dsDetStateChange(Sender: TObject);
begin
  inherited;
  if (dsDet.State in [dsInsert, dsEdit]) then
  begin
    rgAltSalario.Enabled := (Trim(qryDet.FieldByName('DATAALTERFUNC').asString) <> '');
    gbxSalario.Enabled   := (Trim(qryDet.FieldByName('DATAALTERFUNC').asString) <> '');

    rgAltSalario.ItemIndex := 0;
    rgAltSalarioClick(Self);
  end;
end;

procedure TfrmCadRegEvol.cmbStepsChange(Sender: TObject);
begin
  inherited;
  dbedSalario.Value := StrToFloat(TiraCaracter(copy(cmbSteps.Text,7,14),'.'));
end;

procedure TfrmCadRegEvol.dbedSalarioChange(Sender: TObject);
begin
  inherited;
  if (dsDet.State in [dsInsert, dsEdit]) and (rgAltSalario.ItemIndex in [1, 3]) and
     (SalRef > 0) then
    dbedPerc.Value := (dbedSalario.Value - SalRef) * 100 / SalRef;
end;

procedure TfrmCadRegEvol.dbedPercChange(Sender: TObject);
begin
  inherited;
  if (dsDet.State in [dsInsert, dsEdit]) and (rgAltSalario.ItemIndex = 2) and
     (SalRef > 0) then
    dbedSalario.Value := (100 + dbedPerc.Value) * SalRef / 100;
end;

procedure TfrmCadRegEvol.dblcCargoCloseUp(Sender: TObject; LookupTable,
  FillTable: TDataSet; modified: Boolean);
begin
  inherited;
  if (Modified) then
    rgAltSalarioClick(Self);
end;

procedure TfrmCadRegEvol.dblcLotacCloseUp(Sender: TObject; LookupTable,
  FillTable: TDataSet; modified: Boolean);
begin
  inherited;
  if (Modified) then
    qryDet.FieldByName('CENTROCUSTO').asString := qryLotac.FieldByName('NOME').asString;
end;

procedure TfrmCadRegEvol.dbedDatEfetExit(Sender: TObject);
begin
  inherited;
  SalRef := 0;
  if (dbedDatEfet.Text = '') then
    exit;

  qryCesAux.Close;
  qryCesAux.ParamByName('IdPessoa').asInteger := StrToInt(MontaSelect.ValoresChave[0]);
  qryCesAux.ParamByName('DataRef').Value := StrToDate(dbedDatEfet.Text);
  qryCesAux.Open;

  if not(qryCesAux.IsEmpty) then
    SalRef := qryCesAux.FieldByName('Salario').asFloat
  else
    SalRef := qry.FieldByName('SalarioAtual').asFloat;

  rgAltSalario.Enabled := true;
  gbxSalario.Enabled := true;
end;

procedure TfrmCadRegEvol.sbtnImprimirEtiquetaClick(Sender: TObject);
begin
  with (ImprimeRelatorio.QueryDados) do
  begin
    Clear;
    Add('SELECT');
    Add('  TO_CHAR(H.DATAALTERFUNC,''DD/MM/YYYY'') AS DATA,');
    Add('  DECODE(E2.IDCARGO,C.IDCARGO,''A mesma'',C.TITULO) AS NOVAFUNCAO,');
    Add('  H.SALARIO    AS NOVOSALARIO,');
    Add('  ('''+Replicate(' ',24)+' || ''Por motivo de: '' || MO.DESCRICAO) AS MOTIVO,');
    Add('  C.CBO');
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
                                       QuotedStr(qryDet.FieldByName('DATAALTERFUNC').asString)+
                                       ',''DD/MM/YYYY''))))) E2');
    Add('WHERE');
    Add('  (MO.GRUPOMOTIVO IN (''A'',''D''))      AND');
    Add('  (H.DATAALTERFUNC = TO_DATE(' +
      QuotedStr(qryDet.FieldByName('DATAALTERFUNC').asString)+ ',''DD/MM/YYYY'')) AND');
    Add('  (H.IDPESSOA      = ' +qryDet.FieldByName('IDPESSOA').asString+ ') AND');
    Add('  (H.IDPESSOA      = F.IDPESSOA) AND');
    Add('  (H.IDPESSOA      = E2.IDPESSOA(+)) AND');
    Add('  (H.IDMOTIVO      = MO.IDMOTIVO(+)) AND');
    Add('  (H.IDCARGO       = C.IDCARGO(+))');
  end;

  ImprimeRelatorio.Imprimir([NULL]);
end;

procedure TfrmCadRegEvol.sbtnConfigEtiquetaClick(Sender: TObject);
begin
  ImprimeRelatorio.Configurar;
end;

procedure TfrmCadRegEvol.sbtnDesfConfigEtiquetaClick(Sender: TObject);
begin
  ImprimeRelatorio.RestaurarConfiguracao;
end;

procedure TfrmCadRegEvol.rgAltSalarioClick(Sender: TObject);
var
  i: integer;
begin
  inherited;
  cmbSteps.Text := '';
  dbedSalario.Enabled   := (rgAltSalario.ItemIndex = 1);
  dbedPerc.Enabled      := (rgAltSalario.ItemIndex = 2);
  gbxStepsFaixa.Visible := (rgAltSalario.ItemIndex = 3);

  if (rgAltSalario.ItemIndex = 3) then
  begin
    cmbSteps.Items.Clear;

    qryFaixa.Close;
    qryFaixa.ParamByName('IdCargo').asInteger := qryDet.FieldByName('IdCargo').asInteger;
    qryFaixa.Open;

    if not(qryFaixa.IsEmpty) then
      for i:=1 to qryParamRH.FieldByName('NUMSTEPS').asInteger do
        cmbSteps.Items.Add(IntToStr(i) + '  =  ' +
                 FloatToStrF(qryFaixa.FieldByName('Step' +IntToStr(i)).asFloat,ffNumber,14,2))
    else
    begin
      MsgDlg('Não Existe Faixa Salarial Associada', 'Aviso',mtInformation, [mbOk, mbHelp], 0);
      rgAltSalario.SetFocus;
      exit;
    end;
  end;
end;

procedure TfrmCadRegEvol.bbtnOkDetClick(Sender: TObject);
begin
  if (Trim(dblcTipoEv.Text) = '') then
  begin
    MsgDlg('Informe o Tipo de Evento', 'Aviso', mtInformation, [mbOk, mbHelp], 0);
    dblcTipoEv.SetFocus;
    exit;
  end;

  if (qryDet.FieldByName('DATAALTERFUNC').Value = Null) then
  begin
    MsgDlg('Informe a Data de Efetivação', 'Aviso', mtInformation, [mbOk, mbHelp], 0);
    dbedDatEfet.SetFocus;
    exit;
  end;

  if (qryDet.FieldByName('DATAALTERFUNC').Value > Date) then
    if (MsgDlg('Evento para Data Futura. Confirma ?', LerMensagem(4),
              mtConfirmation, [mbYes, mbNo], 0) = mrNo) then
    begin
      dbedDatEfet.SetFocus;
      exit;
    end;

  if (Trim(dbedSalario.Text) = '') or (StrToFloat(dbedSalario.Text) = 0) then
    if (MsgDlg('Sem Valor de Salário. Confirma ?', LerMensagem(4),
               mtConfirmation, [mbYes, mbNo], 0) = mrNo) then
    begin
      dbedSalario.SetFocus;
      exit;
    end;

  inherited;
end;

procedure TfrmCadRegEvol.CmeCadastroConfirma(Sender: TObject);
var
  sIdPessoa, sIdEmpresa: string;
  bFazIntegraPrevRH: boolean;
begin
  if (CmeCadastro.Operacao in [OpInserir, OpAlterar]) then
    AplicaAlteracoes([qry, qryDet])
  else
    AplicaAlteracoes([qryDet, qry]);

  sIdPessoa  := qry.FieldByName('IDPESSOA').asString;
  sIdEmpresa := qry.FieldByName('IDEMPRESA').asString;

  inherited;
  // Chama a rotina de integraçao dos sistemas previdenciarios com os sistemas
  // de RH e Folha de Pagamento de uma Fundação
  if (sIdEmpresa <> '') then
  begin
    dtmBaseDados.qry.Close;
    with (dtmBaseDados.qry.SQL) do
    begin
      Clear;
      Add('SELECT TIPOEMPRESA ');
      Add('FROM EMPRESAPROP ');
      Add('WHERE IDPESSOA = ' + sIdEmpresa);
    end;
    dtmBaseDados.qry.Open;
    bFazIntegraPrevRH := (dtmBaseDados.qry.FieldByName('TIPOEMPRESA').asString = 'P');
    dtmBaseDados.qry.Close;
    if (bFazIntegraPrevRH) then
    begin
      dtmBaseDados.dbBaseDados.StartTransaction;
      if (AtualizaDadosPrevFuncionario(StrToInt(sIdEmpresa), StrToInt(sIdPessoa))) then
        dtmBaseDados.dbBaseDados.Commit
      else
        dtmBaseDados.dbBaseDados.RollBack;
    end;
  end;

end;

end.
