unit fLancaRub;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs, Grids, ExtCtrls,
  StdCtrls, CmEventosCadastro, ImgList, MontaSelect, DBTables, IvDictio, IvMulti, IvEMulti,
  Db, Wwdatsrc, Wwquery, MAHlpBtn, TB97Tlbr, Buttons, TB97Ctls, TB97, Wwdbigrd, Wwdbgrid,
  ComCtrls, TabControlDetalhe, Mask, wwdbedit, TREdit, CMProcuraSubTipo, Spin, DBCtrls,
  wwdblook, URegra, FCadMestreDetCS, fcLabel;

type
  TfrmLancaRub = class(TfrmCadMestreDetalheCS)
    Label1: TLabel;
    dbedMat: TwwDBEdit;
    Label10: TLabel;
    dbedNome: TwwDBEdit;
    qryDet: TwwQuery;
    updDet: TUpdateSQL;
    qryIn: TwwQuery;
    Regra: TRegra;
    qryParamRH: TwwQuery;
    qryProxSeq: TwwQuery;
    qryRegra: TwwQuery;
    qryRubrica: TwwQuery;
    qryTurnoSem: TwwQuery;
    qryHstFer: TwwQuery;
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
    qryFalta: TwwQuery;
    updFalta: TUpdateSQL;
    tb97BotaoIncRubVarPess: TToolbar97;
    sbtnIncRubVarPess: TToolbarButton97;
    qryFeriado: TwwQuery;
    dbedValor: TDBRealEdit;
    procedure FormCreate(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure FormShow(Sender: TObject);
    procedure CalendarioSelectCell(Sender: TObject; ACol, ARow: Integer;
      var CanSelect: Boolean);
    procedure CmeCadastroFind(Sender: TObject);
    procedure CmeDetalheInsert(Sender: TObject);
    procedure CmeDetalheEdit(Sender: TObject);
    procedure CmeCadastroConfirma(Sender: TObject);
    procedure qryAfterScroll(DataSet: TDataSet);
    procedure qryDetAfterScroll(DataSet: TDataSet);
    procedure qryDetBeforeInsert(DataSet: TDataSet);
    procedure qryDetAfterInsert(DataSet: TDataSet);
    procedure dsDetStateChange(Sender: TObject);
    procedure cmbMesChange(Sender: TObject);
    procedure spnedAnoChange(Sender: TObject);
    procedure dblckcmbRubricaChange(Sender: TObject);
    procedure dblckcmbRegraChange(Sender: TObject);
    procedure ProcuraFavorecidoExit(Sender: TObject);
    procedure dblckcmbRubricaExit(Sender: TObject);
    procedure sbtnProcurarClick(Sender: TObject);
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
  private
    dtDataIni, dtDataFim: TDateTime;
    ArrCores: array[0..6,0..6] of TColor;
    wDia, wMes, wAno, wDiaParam, wMesParam, wAnoParam: word;
    bPrimVez: boolean;
    iDiaSemana, iTemLanc, iQtdParc: integer;
    sRegRegra, sRegPessoa: string;

    procedure AtualizarDados (ID:LongInt; qryPrincipal:boolean);
    procedure AtualizaAnoMesInicio;
    procedure SetaBtIncRubVarPess(OpDown: boolean);
    procedure AssociaCorDia(x, y: integer);
    procedure InitCores;
  public
    dValCalc1, dValCalc2: double;
    bIncRubVarPess, bGravou: boolean;
    iCodBen, iIDPessoa, iFlgPerm, iProxSeq, iQtdOcor: integer;
    sCodRegra, sAnoMesSel, sNumParc, sValFun: string;
  end;

var
  frmLancaRub: TfrmLancaRub;

implementation

uses uCMTypes, uSistema, uDataBase, uMensErro, uDiasUteis, uFuncoesUteisRH, uCalcRub,
  UsoGeralRH, fIncRubrica;

{$R *.DFM}

procedure TfrmLancaRub.FormCreate(Sender: TObject);
begin
  InicializaFormula1;

  bPrimVez := true;
  qry.DisableControls;
  qryDet.DisableControls;

  qryParamRH.Open;
  if (qryParamRH.FieldByName('NORMALINI').IsNull) or
     (qryParamRH.FieldByName('NORMALFIM').IsNull) then
  begin
    MsgDlg('Não Há Período Aberto! Verifique e tente novamente.','Aviso', mtInformation,[mbOk,mbHelp],0);
    Close;
    exit;
  end;

  if (qryParamRH.FieldByName('IDRUBFALTA').IsNull) then
    MsgDlg('Rubrica de Faltas Omitida em Parâmetros: ' +
           'Lançamento de Faltas Pelo Calendário Estará Inibido !',
           'Aviso', mtInformation,[mbOk,mbHelp],0);

  qryRubrica.ParamByName('IDEMPRESA').asInteger := Sistema.IdEmpresa;
  qryRubrica.Open;
  qryRegra.Open;

  with (MontaSelect.Filtro) do
  begin
    Clear;
    // Estabelecimento(s) habilitados para o usuário
    if (sUsuXfilial <> '') then
      Add('FUNCIONARIO.IDESTAB IN ' +sUsuXfilial);

    // C. de Custo(s) habilitado(s) para o usuário
    if (sUsuXccusto <> '') then
      Add('FUNCIONARIO.CODCENTROCUSTO IN ' +sUsuXccusto);

    Add('FUNCIONARIO.IDEMPRESA = '+IntToStr(Sistema.IdEmpresa));
    Add('CARGO.IDCARGO         = FUNCIONARIO.IDCARGO');
    Add('FUNCIONARIO.IDPESSOA  = PESSOA.IDPESSOA');
  end;

  qry.Prepare;
  qryDet.Prepare;

  AtualizarDados(-1, true);

  lblMesLanc.Caption := 'Período Aberto: ' + qryParamRH.FieldByName('NORMALINI').asString +
                        ' a ' + qryParamRH.FieldByName('NORMALFIM').asString;

  dtDataIni := qryParamRH.FieldByName('NORMALINI').asDateTime;
  dtDataFim := qryParamRH.FieldByName('NORMALFIM').asDateTime;
  DecodeDate (dtDataFim, wAnoParam, wMesParam, wDiaParam);
  iDiaSemana := DayOfWeek(dtDataIni);

  sbtnProcurarClick(Self);

  iTemLanc := 1;
  bIncRubVarPess := false;

  // Atribuo componentes Regra do Form para o Cálculo
  compRegra  := Regra;
  qryInRegra := qryIn;
  inherited;
  qry.EnableControls;
  qryDet.EnableControls;
end;

procedure TfrmLancaRub.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  inherited;
  qry.DisableControls;
  qryDet.DisableControls;

  qry.Close;
  qryDet.Close;
  qryRubrica.Close;
  qryRegra.Close;
  qryFalta.Close;
  qryHstFer.Close;
  qryTurnoSem.Close;

  qry.UnPrepare;
  qryDet.UnPrepare;

  FinalizaFormula1;
end;

procedure TfrmLancaRub.FormShow(Sender: TObject);
begin
  inherited;
  InitCores;
  Calendario.SetFocus;
  bPrimVez := false;
end;

procedure TfrmLancaRub.CalendarioDrawCell(Sender: TObject; ACol, ARow: Integer;
  Rect: TRect; State: TGridDrawState);
var
  iLargTexto: integer;
begin
  inherited;
  if (iDiaSemana <= (ARow-1)*7+ACol+1) and (wDiaParam >= (ARow-1)*7+ACol+2-iDiaSemana) then
  begin
    if (Calendario.Row = ARow) and (Calendario.Col = ACol) and
       (ArrCores[ARow, ACol] = clWhite) then
    begin
      Calendario.Canvas.Brush.Color := clNavy;
      Calendario.Canvas.Font.Color  := clWhite;
    end
    else
      Calendario.Canvas.Brush.Color := ArrCores[ARow, ACol];
  end;

  Calendario.Canvas.FillRect(Rect);

  iLargTexto := Calendario.Canvas.TextWidth(Calendario.Cells[ACol, ARow]);

  Calendario.Canvas.TextOut(Rect.Left+Round((Rect.Right-Rect.Left)/2)-Round(iLargTexto/2),
                             Rect.Top+1, Calendario.Cells[ACol, ARow]);
end;

procedure TfrmLancaRub.CalendarioSelectCell(Sender: TObject; ACol, ARow: Integer;
  var CanSelect: Boolean);
begin
  CanSelect := (iDiaSemana <= (ARow-1) * 7 + ACol + 1) and
               (wDiaParam  >= (ARow-1) * 7 + ACol + 2 - iDiaSemana) and
               ((ArrCores[ARow, ACol] = clWhite) or
                (ArrCores[ARow, ACol] = clOlive));

  if not(CanSelect) then
    exit;
end;

procedure TfrmLancaRub.CmeCadastroFind(Sender: TObject);
begin
  if (MontaSelect.ValoresChave.Count > 0) and (MontaSelect.RetornouValor) then
    AtualizarDados (StrToInt(MontaSelect.ValoresChave[0]), true);
end;

procedure TfrmLancaRub.CmeDetalheInsert(Sender: TObject);
begin
  inherited;
  with (qryDet) do
  begin
    FieldByName('IDPESSOA').asFloat         := qry.FieldByName('IDPESSOA').asFloat;
    FieldByName('IDEMPRESA').asInteger      := Sistema.IdEmpresa;
    FieldByName('FLGTPRUBMANUT').asString   := '2';
    FieldByName('ANOMESINICIO').asString    := sAnoMesSel;
    FieldByName('NUMOCORRENCIAS').asInteger := 0;
  end;
  AtualizaAnoMesInicio;
  spedParcelas.Value       := 1;
  chkRubPermanente.Checked := false;
  dblckcmbRubrica.SetFocus;
end;

procedure TfrmLancaRub.CmeDetalheEdit(Sender: TObject);
begin
  inherited;
  spedParcelas.Value       := qryDet.FieldByName('PARCELAS').asInteger;
  chkRubPermanente.Checked := (qryDet.FieldByName('FLGPERMANENTE').asInteger = 1);
  AtualizaAnoMesInicio;
end;

procedure TfrmLancaRub.CmeCadastroConfirma(Sender: TObject);
begin
  try
    AplicaAlteracoes([qryDet,qryFalta]);
  except
    raise;
  end;
end;

procedure TfrmLancaRub.qryAfterScroll(DataSet: TDataSet);
begin
  if (bPrimVez) then
    exit;

  sbtnAlterar.Enabled := not(qryDet.EOF);
  sbtnApagar.Enabled  := not(qryDet.EOF);

  Calendario.Row := 0;
  Calendario.Col := 0;
  Calendario.SetFocus;
end;

procedure TfrmLancaRub.qryDetAfterScroll(DataSet: TDataSet);
begin
  inherited;
  ProcuraFavorecido.Visible := (qryRubrica.FieldByName('FLGOBRIGAFAVOREC').asInteger = 1);
end;

procedure TfrmLancaRub.qryDetBeforeInsert(DataSet: TDataSet);
begin
  inherited;
  edTotProventos.Text := '';
  bIncRubVarPess := sbtnIncRubVarPess.Down;
  ProcuraFavorecido.Visible := false;
end;

procedure TfrmLancaRub.qryDetAfterInsert(DataSet: TDataSet);
begin
  inherited;
  qryDet.FieldByName('IDPESSOA').asInteger     := StrToInt(MontaSelect.ValoresChave[0]);
  qryDet.FieldByName('FLGTPRUBMANUT').asString := '2';
end;

procedure TfrmLancaRub.dsDetStateChange(Sender: TObject);
begin
  inherited;
  edTotProventos.Value := 0;

  case (qryDet.State) of
    dsInsert : spdbtnValCalc.Enabled := false;
    dsEdit   : spdbtnValCalc.Enabled := (qryDet.FieldByName('IDREGRACALCULO').asString <> '');
  end;
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
  ProcuraFavorecido.Visible := (qryRubrica.FieldByName('FLGOBRIGAFAVOREC').asInteger = 1);

  if (qryDet.State in [dsInsert, dsEdit]) then
  begin
    if (qryRubrica.FieldByName('IDREGRA').asFloat <> 0) then
      qryDet.FieldByName('IDREGRACALCULO').asFloat := qryRubrica.FieldByName('IDREGRA').asFloat
    else
      qryDet.FieldByName('IDREGRACALCULO').Clear;  

    qryDet.FieldByName('RUBRICA').asString := dblckcmbRubrica.Text;
  end;
end;

procedure TfrmLancaRub.dblckcmbRegraChange(Sender: TObject);
begin
  spdbtnValCalc.Enabled := (Trim(dblckcmbRegra.Text) <> '');
end;

procedure TfrmLancaRub.CalendarioDblClick(Sender: TObject);
var
  Rect: TRect;
  iTotFalta: integer;
begin
  inherited;
  if (qry.State in [dsInsert, dsEdit]) and (qryDet.RecordCount > 0) and
     (Calendario.Cells[Calendario.Row, Calendario.Col] <> '') then
  begin
    if (ArrCores[Calendario.Row, Calendario.Col] = clWhite) then
    begin
      if (qryParamRH.FieldByName('IDRUBFALTA').IsNull) then
      begin
        MsgDlg('Rubrica de Faltas Omitida em Parâmetros: Ação Não Permitida !','Aviso', mtInformation,[mbOk,mbHelp],0);
        exit;
      end;

      if not(qryParamRH.FieldByName('IDRUBFALTA').IsNull) and
         ((qryRubrica.FieldByName('IDRUBRICA').asFloat <>
           qryParamRH.FieldByName('IDRUBFALTA').asFloat) or
         (Trim(dblckcmbRubrica.Text) = '')) then
      begin
        MsgDlg('Rubrica de Faltas Não Posicionada para Lançamento: Ação Não Permitida !','Aviso', mtInformation,[mbOk,mbHelp],0);
        exit;
      end;

      // Checar a Coerencia do Ano/Mes do Lançamento
      if (wAno > wAnoParam) or ((wAno = wAnoParam) and (wMes > wMesParam)) or
         (not(chkRubPermanente.Checked) and
         (spedParcelas.Value <= qryDet.FieldByName('NUMOCORRENCIAS').asInteger)) then
      begin
        MsgDlg('Datas Inconsistentes para Lançamento de Falta: Ação Não Permitida !','Aviso', mtInformation,[mbOk,mbHelp],0);
        exit;
      end;

      if (MsgDlg('Deseja Informar Falta Nesse Dia ?', LerMensagem(4), mtConfirmation,
                 [mbYes, mbNo], 0) <> mrYes) then
        exit;

      qryFalta.Insert;
      qryFalta.FieldByName('IDPESSOA').asFloat     := qry.FieldByName('IDPESSOA').asFloat;
      qryFalta.FieldByName('DATAFALTA').asDateTime := dtDataIni + (Calendario.Row-1) * 7 + Calendario.Col + 1 - iDiaSemana;
      qryFalta.Post;

      ArrCores[Calendario.Row, Calendario.Col] := clOlive;
    end
    else
    if (ArrCores[Calendario.Row, Calendario.Col] = clOlive) then
    begin
      if (MsgDlg('Deseja Excluir a Falta Nesse Dia ?', LerMensagem(4), mtConfirmation,
                 [mbYes, mbNo], 0) <> mrYes) then
        exit;

      if (qryFalta.Locate('IDPESSOA;DATAFALTA',VarArrayOf([qry.FieldByName('IDPESSOA').asFloat,
                           dtDataIni + (Calendario.Row-1) * 7 + Calendario.Col + 1 - iDiaSemana]),[])) then
      begin
        ArrCores[Calendario.Row, Calendario.Col] := clWhite;
        qryFalta.Delete;
      end;
    end;

    iTotFalta := 0;
    qryFalta.First;
    while not(qryFalta.EOF) do
    begin
      Inc(iTotFalta);
      qryFalta.Next;
    end;

    qryFalta.First;

    if (qryDet.State = dsBrowse) then
      qryDet.Edit;

    qryDet.FieldByName('VALORRUBRICA').asInteger := iTotFalta;

    Rect := Calendario.CellRect(Calendario.Row, Calendario.Col);
    InvalidateRect(Calendario.Handle, @Rect, false);
    Calendario.SetFocus;
  end;  
end;

procedure TfrmLancaRub.ProcuraFavorecidoExit(Sender: TObject);
begin
  if (ProcuraFavorecido.Valida <> vcOk) then
    exit;
end;

procedure TfrmLancaRub.dblckcmbRubricaExit(Sender: TObject);
begin
  ProcuraFavorecido.Visible := (qryRubrica.FieldByName('FLGOBRIGAFAVOREC').asInteger = 1);
end;

procedure TfrmLancaRub.sbtnProcurarClick(Sender: TObject);
begin
  inherited;
  // Para fazer a procura na criação do Formulário
end;

procedure TfrmLancaRub.chkRubPermanenteClick(Sender: TObject);
begin
  spedParcelas.Visible := not(chkRubPermanente.Checked);
  lblParcelas.Visible  := not(chkRubPermanente.Checked);
end;

procedure TfrmLancaRub.spdbtnValCalcClick(Sender: TObject);
var
  ValCalc, ValBase: double;
begin
  if not(qryDet.FieldByName('VALORRUBRICA').IsNull) then
    ValCalc := qryDet.FieldByName('VALORRUBRICA').Value
  else
    ValCalc := 0;

  try
    if not(qryDet.FieldByName('IDREGRACALCULO').IsNull) then
    begin
      sRegRegra  := qryDet.FieldByName('IDREGRACALCULO').asString;
      sRegPessoa := qryDet.FieldByName('IDPESSOA').asString;
      iQtdParc   := 1;
      ValBase    := 0;
      iQtdParc   := qryDet.FieldByName('PARCELAS').asInteger;
      iQtdOcor   := qryDet.FieldByName('NumOcorrencias').asInteger;

      CalcBenef (false, sRegRegra, sRegPessoa, ValCalc, ValBase, iTemLanc, iQtdParc, iQtdOcor, 0, 0);
    end;
  except
  end;

  edTotProventos.Value := ValCalc;
end;

procedure TfrmLancaRub.bbtnOkDetClick(Sender: TObject);
{var
  MarcaReg: TBookMark;}
begin
  if (Trim(dblckcmbRubrica.Text) = '') then
  begin
    MsgDlg('Rubrica Não Identificada!','Aviso', mtInformation,[mbOk,mbHelp],0);
    dblckcmbRubrica.SetFocus;
    exit;
  end;

  ProcuraFavorecido.PermiteChaveEmBranco := false;
  if (qryRubrica.FieldByName('FLGOBRIGAFAVOREC').asInteger = 1) and
     (ProcuraFavorecido.Valida <> vcOk) then
  begin
    ProcuraFavorecido.PermiteChaveEmBranco := true;    
    exit;
  end;
  ProcuraFavorecido.PermiteChaveEmBranco := true;

  if (dbedValor.Value = 0) and (Trim(dblckcmbRegra.Text) = '') then
  begin
    MsgDlg('Informe Valor e/ou Regra','Aviso', mtInformation,[mbOk,mbHelp],0);
    dbedValor.SetFocus;
    exit;
  end;

  if (dbedValor.Value <> 0) and (Trim(dblckcmbRegra.Text) <> '') then
    if (MsgDlg('Confirma Ambos: Valor e Regra ?', LerMensagem(4), mtConfirmation,
               [mbYes, mbNo], 0) <> mrYes) then
    begin
      dbedValor.SetFocus;
      exit;
    end;

  if (bIncRubVarPess) then
  begin
    sAnoMesSel := Trim(spnedAno.Text) +'/'+ RetornaMes(Trim(cmbMes.Text));
    sNumParc   := spedParcelas.Text;
    sValFun    := FloatToStr(dbedValor.Value);
    iCodBen    := qryRubrica.FieldByName('IDRUBRICA').asInteger;

    if (chkRubPermanente.Checked) then
      iFlgPerm := 1
    else
      iFlgPerm := 0;

    sCodRegra := '';
    iQtdOcor  := qryDet.FieldByName('NUMOCORRENCIAS').asInteger;

    if (Trim(dblckcmbRegra.Text) <> '') then
      sCodRegra := qryRegra.FieldByName('IDREGRA').asString;

    bbtnCancelarClick(bbtnConfirmar);
    bGravou := false;
    iIDPessoa := 0;

    frmIncRubrica := TfrmIncRubrica.Create(Self);
    frmIncRubrica.ShowModal;
    frmIncRubrica.Free;

    if (bGravou) then
      qryDet.Locate('IDPESSOA', iIDPessoa, []);
  end
  else
  begin
    if (qryDet.State = dsInsert) then
    begin
{     QUANDO FOR MUDADO PARA 3 CAMADAS
      --------------------------------
      qryDet.DisableControls;
      MarcaReg := qryDet.GetBookmark;
      qryDet.Post;
      qryDet.Filter := 'IDPESSOA = ' + qry.FieldByName('IDPESSOA').asString+' AND '+
                       'IDRUBRICA = ' + qryRubrica.FieldByName('IDRUBRICA').asString;
      qryDet.Filtered := true;
      if (qryDet.IsEmpty) then
        iProxSeq := 1
      else
      begin
        iProxSeq := 0;
        qryDet.First;
        repeat
          if (iProxSeq < qryDet.FieldByName('SEQRUBRICAINDIV').asInteger) then
            iProxSeq := qryDet.FieldByName('SEQRUBRICAINDIV').asInteger;
          qryDet.Next;
        until (qryDet.EOF);
      end;

      qryDet.Filtered := false;
      qryDet.GotoBookmark(MarcaReg);
      qryDet.FreeBookmark(MarcaReg);
      qryDet.Edit;
      qryDet.EnableControls;}
      qryProxSeq.SQL.Clear;
      qryProxSeq.SQL.Add('SELECT MAX(SEQRUBRICAINDIV)+1 AS PROXNUM FROM RUBRICAINDIV');
      qryProxSeq.SQL.Add('WHERE (IDPESSOA  = ' + qry.FieldByName('IDPESSOA').asString+ ') AND');
      qryProxSeq.SQL.Add('      (IDRUBRICA = ' + qryRubrica.FieldByName('IDRUBRICA').asString+ ') AND');
      qryProxSeq.SQL.Add('      (IDEMPRESA = ' + IntToStr(Sistema.IdEmpresa){qry.FieldByName('IDEMPRESA').asString}+ ')');
      qryProxSeq.Open;

      if (qryProxSeq.FieldByName('PROXNUM').IsNull) then
        iProxSeq := 1
      else
        iProxSeq := qryProxSeq.FieldByName('PROXNUM').asInteger;

      qryProxSeq.Close;
      qryDet.FieldByName('SEQRUBRICAINDIV').asInteger := iProxSeq;
    end;

    qryDet.FieldByName('ANOMESINICIO').asString :=
      Trim(spnedAno.Text) + '/' + RetornaMes(Trim(cmbMes.Text));

    qryDet.FieldByName('IDEMPRESA').asInteger := Sistema.IdEmpresa;
    qryDet.FieldByName('PARCELAS').asInteger  := spedParcelas.Value;

    if (chkRubPermanente.Checked) then
      qryDet.FieldByName('FLGPERMANENTE').asInteger := 1
    else
      qryDet.FieldByName('FLGPERMANENTE').asInteger := 0;
    inherited;
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
  qry.Cancel;
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

procedure TfrmLancaRub.AtualizarDados(ID:LongInt; qryPrincipal:boolean);
begin
  qry.Close;
  qry.ParamByName('IDPESSOA').asInteger := ID;
  qry.Open;

  qryDet.Close;
  qryDet.ParamByName('IDPESSOA').asInteger  := ID;
  qryDet.ParamByName('IDEMPRESA').asInteger := Sistema.IdEmpresa;
  qryDet.Open;

  qryFalta.Close;
  qryFalta.ParamByName('IDPESSOA').asInteger := ID;
  qryFalta.Open;

  qryHstFer.Close;
  qryHstFer.ParamByName('IDPESSOA').asInteger   := ID;
  qryHstFer.ParamByName('NORMALINI').asDateTime := qryParamRH.FieldByName('NORMALINI').asDateTime;
  qryHstFer.ParamByName('NORMALFIM').asDateTime := qryParamRH.FieldByName('NORMALFIM').asDateTime;
  qryHstFer.Open;

  qryTurnoSem.Close;
  qryTurnoSem.ParamByName('IDHORARIO').asInteger := qry.FieldByName('IDHORARIO').asInteger;
  qryTurnoSem.Open;

  if (ID <> -1) then
    with (qryFeriado) do
    begin
      Close;
      SQL.Clear;
      SQL.Add('SELECT DATAFERIADO, FLGTIPO');
      SQL.Add('FROM FERIADOS');
      SQL.Add('WHERE');
      SQL.Add('  (DATAFERIADO >= TO_DATE('+QuotedStr(DateToStr(dtDataIni))+',''DD/MM/YYYY'')) AND');
      SQL.Add('  (DATAFERIADO <= TO_DATE('+QuotedStr(DateToStr(dtDataFim))+',''DD/MM/YYYY'')) AND');
      SQL.Add('  (IDPAIS       = '+qry.FieldByName('IDPAIS').asString+') AND');
      SQL.Add('  (((FLGAMBITO  = ''M'') AND (IDCIDADES = '+qry.FieldByName('IDCIDADES').asString+')) OR');
      SQL.Add('   ((FLGAMBITO  = ''E'') AND (CODESTADO = '+QuotedStr(qry.FieldByName('UF').asString)+')) OR');
      SQL.Add('   (FLGAMBITO   = ''F''))');
      SQL.Add('ORDER BY');
      SQL.Add('  DATAFERIADO, FLGTIPO');
      Open;
    end;

  InitCores;
  Calendario.Repaint;
end;

procedure TfrmLancaRub.AtualizaAnoMesInicio;
begin
  if (Trim(qryDet.FieldByName('ANOMESINICIO').asString) = '') then
    DecodeDate(dtDataFim, wAno, wMes, wDia)
  else
  begin
    wMes := StrInt(Copy(qryDet.FieldByName('ANOMESINICIO').asString,6,2));
    wAno := StrInt(Copy(qryDet.FieldByName('ANOMESINICIO').asString,1,4));
  end;
  cmbMes.ItemIndex := wMes - 1;
  spnedAno.Value   := wAno;
end;

procedure TfrmLancaRub.SetaBtIncRubVarPess(OpDown: boolean);
begin
  sbtnIncRubVarPess.Down := OpDown;
  bIncRubVarPess         := OpDown;
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
    ArrCores[y, x] := clWhite;

    if (qryTurnoSem.EOF) and
       ((DayOfWeek(dtDataIni+(y-1)*7+x+1-iDiaSemana) = 1) or
        (DayOfWeek(dtDataIni+(y-1)*7+x+1-iDiaSemana) = 7)) then
      ArrCores[y, x] := clLime;

    if not(qryTurnoSem.EOF) then
    begin
      qryTurnoSem.First;
      bAchei := false;

      while not(qryTurnoSem.EOF) do
      begin
        if (DayOfWeek(dtDataIni+(y-1)*7+x+1-iDiaSemana) =
            qryTurnoSem.FieldByName('IDDIASEMANA').asInteger) then
        begin
          bAchei := true;
          break;
        end;

        qryTurnoSem.Next;
      end;

      qryTurnoSem.First;
      if not(bAchei) then
        ArrCores[y, x] := clLime;
    end;

    // Feriados
    if (qryFeriado.Locate('DATAFERIADO',dtDataIni+(y-1)*7+x+1-iDiaSemana,[])) then
{    if (DiasUteis.Feriado(dtDataIni+(y-1)*7+x+1-iDiaSemana,
        qry.FieldByName('IDCIDADES').asInteger,
        qry.FieldByName('IDPAIS').asInteger,
        qry.FieldByName('UF').asString, false,true)) then}
      ArrCores[y, x] := clAqua;

    if (qry.FieldByName('TIPOSIT').asString = 'F') and
       not(qry.FieldByName('DATADESLIGAMENTO').IsNull) and
       (qry.FieldByName('DATADESLIGAMENTO').asDateTime <= dtDataIni+(y-1)*7+x+1-iDiaSemana) and
       ((qry.FieldByName('DATARETORNO').IsNull) or
        (qry.FieldByName('DATARETORNO').asDateTime >
         dtDataIni+(y-1)*7+x+1-iDiaSemana)) then
      ArrCores[y, x] := clYellow
    else
    if (qry.FieldByName('TIPOSIT').asString = 'D') and
       not(qry.FieldByName('DATADESLIGAMENTO').IsNull) and
       (qry.FieldByName('DATADESLIGAMENTO').asDateTime <=
        dtDataIni+(y-1)*7+x+1-iDiaSemana) then
      ArrCores[y, x] := clRed;

    if not(qryHstFer.EOF) then  // Em Férias
      if (qryHstFer.FieldByName('FIMGOZOFERIAS').asDateTime >=
          dtDataIni+(y-1)*7+x+1-iDiaSemana) and
         (qryHstFer.FieldByName('INIGOZOFERIAS').asDateTime <=
          dtDataIni+(y-1)*7+x+1-iDiaSemana) then
        ArrCores[y, x] := clFuchsia;

    if not(qryFalta.EOF) then  // Faltas
      if (qryFalta.Locate('IDPESSOA;DATAFALTA', VarArrayOf([qry.FieldByName('IDPESSOA').asFloat,
          dtDataIni+(y-1)*7+x+1-iDiaSemana]),[])) then
        ArrCores[y, x] := clOlive;
  end;
end;

procedure TfrmLancaRub.CmeDetalheAtualizaBotoes(Sender: TObject);
begin
  inherited;
  sbtnIncRubVarPess.Enabled := (qry.State = dsEdit);
  SetaBtIncRubVarPess((qry.State = dsEdit) and (bIncRubVarPess));
  sbtnInsDet.Down := (qry.State = dsInsert) and not(sbtnIncRubVarPess.Down);
end;

end.
