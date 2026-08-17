{-------------------------------------------------------------------------------
 N. Chamado.: 2950
 Data.......: 14/09/2023
 Responsável: Everson Cunha
 Descrição..: Ajuste tipagem campo FLGPERMANENTE de String para Integer e
              alteração da chamada do messageInfo que estava para CtrlProvDesc
              para o correto CtrlRubricaIndiv
--------------------------------------------------------------------------------}

unit fLancaRub;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs, Grids, ExtCtrls,
  StdCtrls, CmEventosCadastro, ImgList, MontaSelect, DBTables, IvDictio, IvMulti, IvEMulti,
  Db, Wwdatsrc, MAHlpBtn, TB97Tlbr, Mask, Buttons, TB97Ctls, TB97, Wwdbigrd, Wwdbgrid,
  ComCtrls, TabControlDetalhe, wwdbedit, TREdit, CMProcuraSubTipo, Spin, DBCtrls, wwdblook,
  fcLabel, FCadastroMestreDetMT, DBClient, uCMClientDataSet, uCtrlProvDesc, uCtrlGlobalRH,
  uCtrlRubricaIndiv, uCtrlPessoaFuncionario, uCtrlCadRegra, uCtrlFaltasTrab, uCtrlFerias,
  uCtrlTurnoSem, uCtrlListTerceirosRH, uCtrlCalcRub;

type
  TfrmLancaRub = class(TFrmCadastroMestreDetMT)
    Label1: TLabel;
    dbedMat: TwwDBEdit;
    Label10: TLabel;
    dbedNome: TwwDBEdit;
    pnlMesLanc: TPanel;
    Calendario: TStringGrid;
    Shape1: TShape;
    Label4: TLabel;
    Shape5: TShape;
    Label12: TLabel;
    Shape7: TShape;
    Label14: TLabel;
    Shape6: TShape;
    Label13: TLabel;
    Shape3: TShape;
    Label8: TLabel;
    Shape4: TShape;
    Label11: TLabel;
    Shape2: TShape;
    Label6: TLabel;
    Label2: TLabel;
    dblckcmbRubrica: TwwDBLookupCombo;
    Label16: TLabel;
    dbedSeq: TwwDBEdit;
    grpMesInicio: TGroupBox;
    cmbMes: TComboBox;
    spnedAno: TSpinEdit;
    lblParcelas: TLabel;
    spedParcelas: TSpinEdit;
    Label3: TLabel;
    dbedOcorr: TwwDBEdit;
    chkRubPermanente: TCheckBox;
    gbxValInf: TGroupBox;
    gbxValCalc: TGroupBox;
    spdbtnValCalc: TSpeedButton;
    edTotProventos: TRealEdit;
    Label9: TLabel;
    dblckcmbRegra: TwwDBLookupCombo;
    ProcuraFavorecido: TCMProcuraForCli;
    Bevel1: TBevel;
    lblMesLanc: TLabel;
    tb97BotaoIncRubVarPess: TToolbar97;
    sbtnIncRubVarPess: TToolbarButton97;
    dbedValor: TDBRealEdit;
    CdsParamRH: TCMClientDataSet;
    CdsRubrica: TCMClientDataSet;
    CdsDet: TCMClientDataSet;
    CdsFalta: TCMClientDataSet;
    CdsHstFer: TCMClientDataSet;
    CdsTurnoSem: TCMClientDataSet;
    CdsFeriado: TCMClientDataSet;
    CdsRegra: TCMClientDataSet;
    procedure FormCreate(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure FormShow(Sender: TObject);
    procedure CalendarioSelectCell(Sender: TObject; ACol, ARow: Integer;
      var CanSelect: Boolean);
    procedure CmeCadastroFind(Sender: TObject);
    procedure CmeDetalheInsert(Sender: TObject);
    procedure CmeDetalheEdit(Sender: TObject);
    procedure dsDetStateChange(Sender: TObject);
    procedure cmbMesChange(Sender: TObject);
    procedure spnedAnoChange(Sender: TObject);
    procedure dblckcmbRubricaChange(Sender: TObject);
    procedure dblckcmbRegraChange(Sender: TObject);
    procedure ProcuraFavorecidoExit(Sender: TObject);
    procedure dblckcmbRubricaExit(Sender: TObject);
    procedure chkRubPermanenteClick(Sender: TObject);
    procedure spdbtnValCalcClick(Sender: TObject);
    procedure bbtnOkDetClick(Sender: TObject);
    procedure bbtnCancelarDetClick(Sender: TObject);
    procedure bbtnVoltarDetClick(Sender: TObject);
    procedure bbtnCancelarClick(Sender: TObject);
    procedure sbtnIncRubVarPessClick(Sender: TObject);
    procedure bbtnConfirmarClick(Sender: TObject);
    procedure CalendarioDblClick(Sender: TObject);
    procedure CmeDetalheAtualizaBotoes(Sender: TObject);
    procedure CalendarioDrawCell(Sender: TObject; ACol, ARow: Integer;
      Rect: TRect; State: TGridDrawState);
    procedure CmeCadastroAfterConfirma(Sender: TObject);
    procedure CmeCadastroApplyEdit(sender: TObject; var Accept: Boolean);
  private
    CtrlCalcRub: TCtrlCalcRub;
    CtrlRubricaIndiv: TCtrlRubricaIndiv;
    CtrlProvDesc: TCtrlProvDesc;
    CtrlGlobalRH: TCtrlGlobalRH;
    CtrlPessoaFuncionario: TCtrlPessoaFuncionario;
    CtrlCadRegra: TCtrlCadRegra;
    CtrlFaltasTrab: TCtrlFaltasTrab;
    CtrlFerias: TCtrlFerias;
    CtrlTurnoSem: TCtrlTurnoSem;
    CtrlListTerceirosRH: TCtrlListTerceirosRH;

    dtDataIni, dtDataFim: TDateTime;
    ArrCores: array[0..6,0..6] of TColor;
    wDia, wMes, wAno, wDiaParam, wMesParam, wAnoParam: word;
    iDiaSemana, iTemLanc: integer;

    procedure Sel(IdPessoa: double);
    procedure AtualizaAnoMesInicio;
    procedure SetaBtIncRubVarPess(OpDown: boolean);
    procedure AssociaCorDia(x, y: integer);
    procedure InitCores;
  public
    bIncRubVarPess: boolean;
  end;

var
  frmLancaRub: TfrmLancaRub;

implementation

uses uCMTypes, uSistema, uMensErro, uCtrlFuncoesRH, fIncRubrica, uCtrlPadroes, uCtrlUsoGeralRH;

{$R *.DFM}

procedure TfrmLancaRub.FormCreate(Sender: TObject);
begin
  inherited;
  CtrlRubricaIndiv := TCtrlRubricaIndiv.Create(CtrlUsoGeralRH.UsuXFilial,
    CtrlUsoGeralRH.UsuXCCusto, CtrlUsoGeralRH.IdUsuarioGeral);
  CtrlRubricaIndiv.InitializeAs(Padroes);
  CtrlRubricaIndiv.CdsRubricaIndiv := CdsDet;

  CtrlFaltasTrab := TCtrlFaltasTrab.Create;
  CtrlFaltasTrab.InitializeAs(Padroes);
  CtrlFaltasTrab.CdsFaltasTrab := CdsFalta;

  CtrlProvDesc := TCtrlProvDesc.Create;
  CtrlProvDesc.InitializeAs(Padroes);

  CtrlGlobalRH := TCtrlGlobalRH.Create;
  CtrlGlobalRH.InitializeAs(Padroes);

  CtrlPessoaFuncionario := TCtrlPessoaFuncionario.Create(CtrlUsoGeralRH.UsuXFilial,
    CtrlUsoGeralRH.UsuXCCusto, CtrlUsoGeralRH.IdUsuarioGeral);
  CtrlPessoaFuncionario.InitializeAs(Padroes);

  CtrlCadRegra := TCtrlCadRegra.Create;
  CtrlCadRegra.InitializeAs(Padroes);

  CtrlFerias := TCtrlFerias.Create;
  CtrlFerias.InitializeAs(Padroes);

  CtrlTurnoSem := TCtrlTurnoSem.Create;
  CtrlTurnoSem.InitializeAs(Padroes);

  CtrlListTerceirosRH := TCtrlListTerceirosRH.Create(CtrlUsoGeralRH.UsuXFilial,
    CtrlUsoGeralRH.UsuXCCusto, CtrlUsoGeralRH.IdUsuarioGeral);
  CtrlListTerceirosRH.InitializeAs(Padroes);

  CtrlCalcRub := TCtrlCalcRub.Create;
  CtrlCalcRub.InitializeAs(Padroes);

  CdsRegra.Data := CtrlCadRegra.ListaRegra;
  CdsRubrica.Data := CtrlProvDesc.ListRubricaEmpresa(IntToStr(Sistema.IdEmpresa), 1,
    '  RP.IDPESSOA, RP.IDRUBRICA, RP.DESCRPROVDESC,'+CR_LF+
    '  PD.FLGOBRIGAFAVOREC, PD.IDREGRA');

  CdsParamRH.Data := CtrlGlobalRH.GetParamRH('NORMALINI, NORMALFIM, IDRUBFALTA');
  if (CdsParamRH.FieldByName('NORMALINI').IsNull) or
     (CdsParamRH.FieldByName('NORMALFIM').IsNull) then
  begin
    MsgDlg('Não Há Período Aberto.' +CR_LF+
      'Verifique e tente novamente.', 'Aviso', mtWarning, [mbOk,mbHelp], 0);
    Close;
    Exit;
  end;

  if (CdsParamRH.FieldByName('IDRUBFALTA').IsNull) then
    MsgDlg('Rubrica de Faltas Omitida em Parâmetros.' +CR_LF+
           'O Lançamento de Faltas Pelo Calendário Estará Inibido.',
           'Aviso', mtInformation, [mbOk,mbHelp], 0);

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

    Add('FUNCIONARIO.IDEMPRESA = ' + IntToStr(Sistema.IdEmpresa));
    Add('FUNCIONARIO.IDPESSOA  = PESSOA.IDPESSOA');
    Add('FUNCIONARIO.IDSITFUNC = SITFUNC.IDSITFUNC');
    Add('FUNCIONARIO.IDCARGO   = CARGO.IDCARGO(+)');
  end;

  lblMesLanc.Caption := 'Período Aberto: ' +CdsParamRH.FieldByName('NORMALINI').asString+
                        ' a ' +CdsParamRH.FieldByName('NORMALFIM').asString;

  dtDataIni := CdsParamRH.FieldByName('NORMALINI').asDateTime;
  dtDataFim := CdsParamRH.FieldByName('NORMALFIM').asDateTime;
  DecodeDate(dtDataFim, wAnoParam, wMesParam, wDiaParam);
  iDiaSemana := DayOfWeek(dtDataIni);
  iTemLanc := 1;
  bIncRubVarPess := false;

  sbtnProcurarClick(Self);
  if not(MontaSelect.RetornouValor) then
    Sel(-1);
end;

procedure TfrmLancaRub.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  FreeAndNil(CtrlRubricaIndiv);
  FreeAndNil(CtrlProvDesc);
  FreeAndNil(CtrlGlobalRH);
  FreeAndNil(CtrlPessoaFuncionario);
  FreeAndNil(CtrlCadRegra);
  FreeAndNil(CtrlFaltasTrab);
  FreeAndNil(CtrlFerias);
  FreeAndNil(CtrlTurnoSem);
  FreeAndNil(CtrlListTerceirosRH);
  FreeAndNil(CtrlCalcRub);
  inherited;
end;

procedure TfrmLancaRub.FormShow(Sender: TObject);
begin
  inherited;
  InitCores;
  Calendario.SetFocus;
end;

procedure TfrmLancaRub.CalendarioDrawCell(Sender: TObject; ACol, ARow: Integer;
  Rect: TRect; State: TGridDrawState);
var
  iLargTexto: integer;
begin
  if (iDiaSemana <= (ARow-1)*7+ACol+1) and (wDiaParam >= (ARow-1)*7+ACol+2-iDiaSemana) then
  begin
    if (Calendario.Row = ARow) and (Calendario.Col = ACol) and
       (ArrCores[ACol, ARow] = clWhite) then
    begin
      Calendario.Canvas.Brush.Color := clNavy;
      Calendario.Canvas.Font.Color  := clWhite;
    end
    else
      Calendario.Canvas.Brush.Color := ArrCores[ACol, ARow];
  end;

  Calendario.Canvas.FillRect(Rect);
  iLargTexto := Calendario.Canvas.TextWidth(Calendario.Cells[ACol, ARow]);
  Calendario.Canvas.TextOut(Rect.Left + Round((Rect.Right - Rect.Left) / 2) -
    Round(iLargTexto / 2), Rect.Top + 1, Calendario.Cells[ACol, ARow]);
end;

procedure TfrmLancaRub.CalendarioSelectCell(Sender: TObject; ACol, ARow: Integer;
  var CanSelect: Boolean);
begin
  CanSelect := (iDiaSemana <= (ARow-1) * 7 + ACol + 1) and
               (wDiaParam  >= (ARow-1) * 7 + ACol + 2 - iDiaSemana) and
               ((ArrCores[ACol, ARow] = clWhite) or
                (ArrCores[ACol, ARow] = clOlive));

  if not(CanSelect) then
    exit;
end;

procedure TfrmLancaRub.CmeCadastroFind(Sender: TObject);
begin
  if (MontaSelect.RetornouValor) then
    Sel(StrToFloat(MontaSelect.ValoresChave[0]));
end;

procedure TfrmLancaRub.CmeDetalheAtualizaBotoes(Sender: TObject);
begin
  inherited;
  sbtnIncRubVarPess.Enabled := (Cds.State = dsEdit);
  SetaBtIncRubVarPess((Cds.State = dsEdit) and (bIncRubVarPess));
  sbtnInsDet.Down := (Cds.State = dsInsert) and not(sbtnIncRubVarPess.Down);
end;

procedure TfrmLancaRub.CmeDetalheInsert(Sender: TObject);
begin
  inherited;
  edTotProventos.Text := '';
  bIncRubVarPess := sbtnIncRubVarPess.Down;
  ProcuraFavorecido.Visible := false;

  CdsDet.FieldByName('IDPESSOA').asFloat := Cds.FieldByName('IDPESSOA').asFloat;
  CdsDet.FieldByName('IDEMPRESA').asInteger := Sistema.IdEmpresa;
  CdsDet.FieldByName('FLGTPRUBMANUT').asInteger := 2;
  CdsDet.FieldByName('NUMOCORRENCIAS').asInteger := 0;

  AtualizaAnoMesInicio;
  spedParcelas.Value := 1;
  chkRubPermanente.Checked := false;
  dblckcmbRubrica.SetFocus;
end;

procedure TfrmLancaRub.CmeDetalheEdit(Sender: TObject);
begin
  inherited;
  spedParcelas.Value := CdsDet.FieldByName('PARCELAS').asInteger;
  chkRubPermanente.Checked := (CdsDet.FieldByName('FLGPERMANENTE').asInteger = 1);
  AtualizaAnoMesInicio;
end;

procedure TfrmLancaRub.CmeCadastroAfterConfirma(Sender: TObject);
begin
  //inherited;
end;

procedure TfrmLancaRub.CmeCadastroApplyEdit(sender: TObject; var Accept: Boolean);
begin
  inherited;
  Accept := (CtrlRubricaIndiv.GravarRubricaIndiv);
  if (Accept) then
    Accept := (CtrlFaltasTrab.GravarFaltasTrab);
  if not(Accept) then
    MsgDlg('Ocorreu um erro ao tentar Inserir/Alterar Lançamento(s).' +CR_LF+ 'Erro:' +CR_LF+
      CtrlRubricaIndiv.MessageInfo, 'Erro', mtError, [mbOk,mbHelp], 0);
end;

procedure TfrmLancaRub.dsDetStateChange(Sender: TObject);
begin
  inherited;
  edTotProventos.Value := 0;
  ProcuraFavorecido.Visible := (CdsRubrica.FieldByName('FLGOBRIGAFAVOREC').asInteger = 1);
  spdbtnValCalc.Enabled := (CdsDet.FieldByName('IDREGRACALCULO').asString <> '') and
    (CdsDet.State = dsEdit);
end;

procedure TfrmLancaRub.cmbMesChange(Sender: TObject);
begin
  wMes := cmbMes.ItemIndex + 1;
end;

procedure TfrmLancaRub.spnedAnoChange(Sender: TObject);
begin
  wAno := spnedAno.Value;
end;

procedure TfrmLancaRub.dblckcmbRubricaChange(Sender: TObject);
begin
  if (CdsDet.State in [dsInsert, dsEdit]) then
  begin
    ProcuraFavorecido.Visible := (CdsRubrica.FieldByName('FLGOBRIGAFAVOREC').asInteger = 1);

    if (CdsRubrica.FieldByName('IDREGRA').asFloat <> 0) then
      CdsDet.FieldByName('IDREGRACALCULO').asFloat := CdsRubrica.FieldByName('IDREGRA').asFloat
    else
      CdsDet.FieldByName('IDREGRACALCULO').Clear;  

    CdsDet.FieldByName('RUBRICA').asString := Trim(dblckcmbRubrica.Text);
  end;
end;

procedure TfrmLancaRub.dblckcmbRegraChange(Sender: TObject);
begin
  spdbtnValCalc.Enabled := (Trim(dblckcmbRegra.Text) <> '');
end;

procedure TfrmLancaRub.ProcuraFavorecidoExit(Sender: TObject);
begin
  if (ProcuraFavorecido.Valida <> vcOk) then
    exit;
end;

procedure TfrmLancaRub.dblckcmbRubricaExit(Sender: TObject);
begin
  ProcuraFavorecido.Visible := (CdsRubrica.FieldByName('FLGOBRIGAFAVOREC').asInteger = 1);
end;

procedure TfrmLancaRub.CalendarioDblClick(Sender: TObject);
var
  Rect: TRect;
  iTotFalta: integer;
begin
  if (Cds.State = dsEdit) and (CdsDet.RecordCount > 0) and
     (Calendario.Cells[Calendario.Col, Calendario.Row] <> '') then
  begin
    if (ArrCores[Calendario.Col, Calendario.Row] = clWhite) then
    begin
      if (CdsParamRH.FieldByName('IDRUBFALTA').IsNull) then
      begin
        MsgDlg('Rubrica de Faltas Omitida em Parâmetros.' +CR_LF+
          'Ação Não Permitida.', 'Aviso', mtWarning, [mbOk,mbHelp], 0);
        exit;
      end;

      if not(CdsParamRH.FieldByName('IDRUBFALTA').IsNull) and
         ((CdsRubrica.FieldByName('IDRUBRICA').asFloat <>
           CdsParamRH.FieldByName('IDRUBFALTA').asFloat) or
         (Trim(dblckcmbRubrica.Text) = '')) then
      begin
        MsgDlg('Rubrica de Faltas Não Posicionada para Lançamento.' +CR_LF+
          'Ação Não Permitida.', 'Aviso', mtWarning, [mbOk,mbHelp], 0);
        exit;
      end;

      // Checar a Coerencia do Ano/Mes do Lançamento
      if (wAno > wAnoParam) or ((wAno = wAnoParam) and (wMes > wMesParam)) or
         (not(chkRubPermanente.Checked) and
          (spedParcelas.Value <= CdsDet.FieldByName('NUMOCORRENCIAS').asInteger)) then
      begin
        MsgDlg('Datas Inconsistentes para Lançamento de Falta.' +CR_LF+
          'Ação Não Permitida.', 'Aviso', mtWarning, [mbOk,mbHelp], 0);
        exit;
      end;

      if (MsgDlg('Deseja Informar Falta Nesse Dia?', 'Confirmação', mtConfirmation,
          [mbYes, mbNo], 0) <> mrYes) then
        exit;

      CdsFalta.Insert;
      CdsFalta.FieldByName('IDPESSOA').asFloat := Cds.FieldByName('IDPESSOA').asFloat;
      CdsFalta.FieldByName('DATAFALTA').asDateTime := dtDataIni + (Calendario.Row-1) * 7 + Calendario.Col + 1 - iDiaSemana;
      CdsFalta.Post;

      ArrCores[Calendario.Col, Calendario.Row] := clOlive;
    end
    else
    if (ArrCores[Calendario.Col, Calendario.Row] = clOlive) then
    begin
      if (MsgDlg('Deseja Excluir a Falta Nesse Dia?', 'Confirmação', mtConfirmation,
          [mbYes, mbNo], 0) <> mrYes) then
        exit;

      if (CdsFalta.Locate('IDPESSOA;DATAFALTA',
          VarArrayOf([Cds.FieldByName('IDPESSOA').asFloat,
          DateToStr(dtDataIni + (Calendario.Row-1) * 7 + Calendario.Col + 1 - iDiaSemana)]),
          [])) then
      begin
        ArrCores[Calendario.Col, Calendario.Row] := clWhite;
        CdsFalta.Delete;
      end;
    end;

    iTotFalta := 0;
    CdsFalta.First;
    while not(CdsFalta.EOF) do
    begin
      Inc(iTotFalta);
      CdsFalta.Next;
    end;

    CdsFalta.First;

    if (CdsDet.State = dsBrowse) then
      CdsDet.Edit;

    CdsDet.FieldByName('VALORRUBRICA').asInteger := iTotFalta;

    Rect := Calendario.CellRect(Calendario.Row, Calendario.Col);
    InvalidateRect(Calendario.Handle, @Rect, false);
    Calendario.SetFocus;
  end;
end;

procedure TfrmLancaRub.chkRubPermanenteClick(Sender: TObject);
begin
  spedParcelas.Visible := not(chkRubPermanente.Checked);
  lblParcelas.Visible := not(chkRubPermanente.Checked);
end;

procedure TfrmLancaRub.spdbtnValCalcClick(Sender: TObject);
var
  dValCalc: double;
begin
  if not(CdsDet.FieldByName('VALORRUBRICA').IsNull) then
    dValCalc := CdsDet.FieldByName('VALORRUBRICA').asFloat
  else
    dValCalc := 0;

  try
    if not(CdsDet.FieldByName('IDREGRACALCULO').IsNull) then
    begin
      CtrlCalcRub.IniFormaCalc(GERACAO_NORMAL); 
      CtrlCalcRub.CalcBeneficio(
        0, CdsDet.FieldByName('IDREGRACALCULO').asString,
        CdsDet.FieldByName('IDPESSOA').asString, dValCalc, 0, 1,
        CdsDet.FieldByName('PARCELAS').asInteger,
        CdsDet.FieldByName('NumOcorrencias').asInteger, 0, 0);

      if (CtrlCalcRub.ErroExecucao) then
        MsgDlg(CtrlCalcRub.MessageInfo, 'Erro', mtError, [mbOk, mbHelp], 0);
    end;
  except
  end;

  edTotProventos.Value := dValCalc;
end;

procedure TfrmLancaRub.sbtnIncRubVarPessClick(Sender: TObject);
begin
  if (sbtnIncRubVarPess.Down) then
  begin
    dbgrdDet.SendToBack;
    tb97Detalhe.Visible := true;
    CmeDetalhe.Insert(Self);
    CmeDetalhe.Atualizabotoes(Self)
  end
  else
    sbtnIncRubVarPess.Down := true;
end;

procedure TfrmLancaRub.bbtnOkDetClick(Sender: TObject);
var
  iProxSeq, iNumParcelas, iNumOcorrencias: integer;
  dIdPessoa, dIdRubrica, dIdRegra, dValor: double;
  bInserindo, bRubPermanente: boolean;
begin
  if (Trim(dblckcmbRubrica.Text) = '') then
  begin
    MsgDlg('Rubrica Não Identificada.', 'Aviso', mtWarning, [mbOk,mbHelp], 0);
    dblckcmbRubrica.SetFocus;
    exit;
  end;

  ProcuraFavorecido.PermiteChaveEmBranco := false;
  if (CdsRubrica.FieldByName('FLGOBRIGAFAVOREC').asInteger = 1) and
     (ProcuraFavorecido.Valida <> vcOk) then
  begin
    ProcuraFavorecido.PermiteChaveEmBranco := true;    
    exit;
  end;
  ProcuraFavorecido.PermiteChaveEmBranco := true;

  if (dbedValor.Value = 0) and (Trim(dblckcmbRegra.Text) = '') then
  begin
    MsgDlg('Informe Valor e/ou Regra.', 'Aviso', mtWarning, [mbOk,mbHelp], 0);
    dbedValor.SetFocus;
    exit;
  end;

  if (bIncRubVarPess) then
  begin
    iNumOcorrencias := CdsDet.FieldByName('NUMOCORRENCIAS').asInteger;
    dIdRubrica := CdsRubrica.FieldByName('IDRUBRICA').asFloat;
    iNumParcelas := spedParcelas.Value;
    bRubPermanente := chkRubPermanente.Checked;
    dValor := dbedValor.Value;

    if (Trim(dblckcmbRegra.Text) <> '') then
      dIdRegra := CdsRegra.FieldByName('IDREGRA').asFloat
    else
      dIdRegra := 0;

    bbtnCancelarClick(bbtnConfirmar);

    if (IncluirBeneficios(dIdRubrica, Trim(spnedAno.Text) +'/'+ FU.RetornaMes(Trim(cmbMes.Text)),
        iNumParcelas, bRubPermanente, dIdRegra, iNumOcorrencias, dValor) and
       (MsgDlg('Deseja fazer a atualização da tela agora?', 'Confirmação',
        mtConfirmation, [mbYes,mbNo], 0) = mrYes)) then
      Sel(StrToFloat(MontaSelect.ValoresChave[0]));
  end
  else
  begin
    // Geração do Próximo Número de Sequência
    bInserindo := (CdsDet.State = dsInsert);
    if (bInserindo) then
    begin
      CdsDet.DisableControls;
      dIdPessoa := CdsDet.FieldByName('IDPESSOA').asFloat;
      dIdRubrica := CdsDet.FieldByName('IDRUBRICA').asFloat;

      CdsDet.Post;
      CdsDet.Filter := 'IDPESSOA = '+ FloatToStr(dIdPessoa) +' AND '+
                       'IDRUBRICA = '+ FloatToStr(dIdRubrica);
      CdsDet.Filtered := true;
      if (CdsDet.IsEmpty) then
        iProxSeq := 1
      else
      begin
        iProxSeq := 0;
        CdsDet.First;
        repeat
          if (iProxSeq < CdsDet.FieldByName('SEQRUBRICAINDIV').asInteger) then
            iProxSeq := CdsDet.FieldByName('SEQRUBRICAINDIV').asInteger;
          CdsDet.Next;
        until (CdsDet.EOF);
        iProxSeq := iProxSeq + 1;
      end;

      CdsDet.Filtered := false;
      CdsDet.Locate('IDEMPRESA;IDPESSOA;IDRUBRICA;SEQRUBRICAINDIV', VarArrayOf([
        Sistema.IdEmpresa, dIdPessoa, dIdRubrica, 0]), []);

      CdsDet.Edit;
      CdsDet.EnableControls;

      CdsDet.FieldByName('SEQRUBRICAINDIV').asInteger := iProxSeq;
    end;

    CdsDet.FieldByName('ANOMESINICIO').asString :=
      Trim(spnedAno.Text) + '/' + FU.RetornaMes(Trim(cmbMes.Text));

    CdsDet.FieldByName('IDEMPRESA').asInteger := Sistema.IdEmpresa;
    CdsDet.FieldByName('PARCELAS').asInteger := spedParcelas.Value;

    if (chkRubPermanente.Checked) then
      CdsDet.FieldByName('FLGPERMANENTE').asInteger := 1
    else
      CdsDet.FieldByName('FLGPERMANENTE').asInteger := 0;
    inherited;
    if (bInserindo) then
    begin
      sbtnInsDet.Down := true;
      sbtnInsDetClick(sbtnInsDet);
    end;
  end;
end;

procedure TfrmLancaRub.bbtnCancelarDetClick(Sender: TObject);
begin
  inherited;
  SetaBtIncRubVarPess(false);
end;

procedure TfrmLancaRub.bbtnVoltarDetClick(Sender: TObject);
begin
  inherited;
  SetaBtIncRubVarPess(false);
end;

procedure TfrmLancaRub.bbtnConfirmarClick(Sender: TObject);
begin
  inherited;
  Cds.Cancel;
  InitCores;
  SetaBtIncRubVarPess(false);
  sbtnIncRubVarPess.Enabled := false;
end;

procedure TfrmLancaRub.bbtnCancelarClick(Sender: TObject);
begin
  inherited;
  InitCores;
  SetaBtIncRubVarPess(false);
  sbtnIncRubVarPess.Enabled := false;
end;

// ------------------------------------------------------------------------------------------
// Funções do Form
// ------------------------------------------------------------------------------------------

procedure TfrmLancaRub.Sel(IdPessoa: double);
begin
  Cds.Data := CtrlPessoaFuncionario.ListEnderecoEmpresaFuncionario(IdPessoa,
    '  F.IDPESSOA, F.MATRICULA, F.DATADESLIGAMENTO,'+CR_LF+
    '  F.DATARETORNO, F.IDHORARIO, PF.NOME, ST.TIPOSIT,'+CR_LF+
    '  DECODE(C.IDPAIS,NULL,ES.IDPAIS,C.IDPAIS) AS IDPAIS,'+CR_LF+
    '  E.IDCIDADES, RTRIM(ES.CODESTADO) AS UF');
  CdsDet.Data := CtrlRubricaIndiv.ListRubricaXRubricaIndiv(IdPessoa, Sistema.IdEmpresa);
  CdsFalta.Data := CtrlFaltasTrab.ListFaltasNaCompetencia(IdPessoa);
  CdsHstFer.Data := CtrlFerias.ListFeriasNoPeriodo(FloatToStr(IdPessoa),
    CdsParamRH.FieldByName('NORMALINI').asDateTime,
    CdsParamRH.FieldByName('NORMALFIM').asDateTime);
  CdsTurnoSem.Data := CtrlTurnoSem.ListDiasDaSemana(Cds.FieldByName('IDHORARIO').asInteger);

  if (IdPessoa <> -1) then
    CdsFeriado.Data := CtrlListTerceirosRH.ListFeriados(
      Cds.FieldByName('IDCIDADES').asInteger, Cds.FieldByName('IDPAIS').asInteger,
      Cds.FieldByName('UF').asString, dtDataIni, dtDataFim);

  sbtnAlterar.Enabled := not(CdsDet.EOF);
  sbtnApagar.Enabled := not(CdsDet.EOF);

  Calendario.Row := 0;
  Calendario.Col := 0;
  InitCores;
end;

procedure TfrmLancaRub.AtualizaAnoMesInicio;
begin
  if (Trim(CdsDet.FieldByName('ANOMESINICIO').asString) = '') then
    DecodeDate(dtDataFim, wAno, wMes, wDia)
  else
  begin
    wMes := FU.StrInt(Copy(CdsDet.FieldByName('ANOMESINICIO').asString,6,2));
    wAno := FU.StrInt(Copy(CdsDet.FieldByName('ANOMESINICIO').asString,1,4));
  end;
  cmbMes.ItemIndex := wMes - 1;
  spnedAno.Value := wAno;
end;

procedure TfrmLancaRub.SetaBtIncRubVarPess(OpDown: boolean);
begin
  sbtnIncRubVarPess.Down := OpDown;
  bIncRubVarPess := OpDown;
end;

procedure TfrmLancaRub.InitCores;
var
  x, y: byte;
begin
  for y:=0 to 6 do
    for x:=0 to 6 do
      ArrCores[x, y] := clWhite;

  if (MontaSelect.RetornouValor) then
    for y:=0 to 6 do
      for x:=0 to 6 do
        if (y = 0) then
          Calendario.Cells[x, y] := ' ' + ShortDayNames[x + 1]
        else
        if (iDiaSemana <= (y-1)*7+x+1) and (wDiaParam >= (y-1)*7+x+2-iDiaSemana) then
        begin
          Calendario.Cells[x, y] := IntToStr((y-1)*7+x+2-iDiaSemana);
          AssociaCorDia(x, y);
        end;
end;

procedure TfrmLancaRub.AssociaCorDia(x, y: integer);
var
  bAchei: boolean;
begin
  if (iDiaSemana <= (y-1)*7+x+1) and (wDiaParam >= (y-1)*7+x+2-iDiaSemana) then
  begin
    Calendario.Canvas.Brush.Color := clWhite;
    ArrCores[x, y] := clWhite;

    // Turno Semanal
    if (CdsTurnoSem.EOF) and
       ((DayOfWeek(dtDataIni+(y-1)*7+x+1-iDiaSemana) = 1) or
        (DayOfWeek(dtDataIni+(y-1)*7+x+1-iDiaSemana) = 7)) then
      ArrCores[x, y] := clLime;

    if not(CdsTurnoSem.EOF) then
    begin
      CdsTurnoSem.First;
      bAchei := false;

      while not(CdsTurnoSem.EOF) do
      begin
        if (DayOfWeek(dtDataIni+(y-1)*7+x+1-iDiaSemana) =
            CdsTurnoSem.FieldByName('IDDIASEMANA').asInteger) then
        begin
          bAchei := true;
          break;
        end;

        CdsTurnoSem.Next;
      end;

      CdsTurnoSem.First;
      if not(bAchei) then
        ArrCores[x, y] := clLime;
    end;

    // Feriados
    if (CdsFeriado.Locate('DATAFERIADO', DateToStr(dtDataIni+(y-1)*7+x+1-iDiaSemana), [])) then
      ArrCores[x, y] := clAqua;

    if (Cds.FieldByName('TIPOSIT').asString = 'F') and
       not(Cds.FieldByName('DATADESLIGAMENTO').IsNull) and
       (Cds.FieldByName('DATADESLIGAMENTO').asDateTime <= dtDataIni+(y-1)*7+x+1-iDiaSemana) and
       ((Cds.FieldByName('DATARETORNO').IsNull) or
        (Cds.FieldByName('DATARETORNO').asDateTime > dtDataIni+(y-1)*7+x+1-iDiaSemana)) then
      ArrCores[x, y] := clYellow
    else
    if (Cds.FieldByName('TIPOSIT').asString = 'D') and
       not(Cds.FieldByName('DATADESLIGAMENTO').IsNull) and
       (Cds.FieldByName('DATADESLIGAMENTO').asDateTime <= dtDataIni+(y-1)*7+x+1-iDiaSemana) then
      ArrCores[x, y] := clRed;

    // Férias
    if not(CdsHstFer.EOF) then
      if (CdsHstFer.FieldByName('FIMGOZOFERIAS').asDateTime >=
          dtDataIni+(y-1)*7+x+1-iDiaSemana) and
         (CdsHstFer.FieldByName('INIGOZOFERIAS').asDateTime <=
          dtDataIni+(y-1)*7+x+1-iDiaSemana) then
        ArrCores[x, y] := clFuchsia;

    if not(CdsFalta.EOF) then  // Faltas
      if (CdsFalta.Locate('IDPESSOA;DATAFALTA',
          VarArrayOf([Cds.FieldByName('IDPESSOA').asFloat,
          DateToStr(dtDataIni + (y - 1) * 7 + x + 1 - iDiaSemana)]), [])) then
        ArrCores[x, y] := clOlive;
  end;
end;

end.
