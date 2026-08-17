unit fLancaRubPorRub;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  FCadMestreDetCS, IvDictio, IvMulti, IvEMulti, MontaSelect, DBTables, Db,
  Wwdatsrc, Wwquery, TB97Ctls, MAHlpBtn, TB97Tlbr, StdCtrls, Buttons, TB97,
  Grids, Wwdbigrd, Wwdbgrid, ComCtrls, TabControlDetalhe, ExtCtrls, Mask,
  DBCtrls, Spin, CMProcuraSubTipo, wwdbedit, wwdblook, TREdit, URegra,
  CmEventosCadastro, ImgList;

type
  TfrmLancaRubPorRub = class(TfrmCadMestreDetalheCS)
    Label10: TLabel;
    Label1: TLabel;
    Label2: TLabel;
    dblkpcmbEmpregado: TwwDBLookupCombo;
    lblSeq: TLabel;
    chkRubPermanente: TCheckBox;
    lblRegra: TLabel;
    dblkcmbRegra: TwwDBLookupCombo;
    lblValorInf: TLabel;
    grpMesInicio: TGroupBox;
    Label5: TLabel;
    Label7: TLabel;
    cmbMes: TComboBox;
    spnedAno: TSpinEdit;
    lblParcelas: TLabel;
    spedParcelas: TSpinEdit;
    lblOcorr: TLabel;
    dbedOcorr: TwwDBEdit;
    qryParamRH: TwwQuery;
    qryFunc: TwwQuery;
    qryRegra: TwwQuery;
    lblMesLanc: TLabel;
    qryDet: TwwQuery;
    updDet: TUpdateSQL;
    qryProxSeq: TwwQuery;
    Bevel1: TBevel;
    qryDetIDPESSOA: TFloatField;
    qryDetIDEMPRESA: TFloatField;
    qryDetIDRUBRICA: TFloatField;
    qryDetNUMOCORRENCIAS: TFloatField;
    qryDetSEQRUBRICAINDIV: TFloatField;
    qryDetIDFAVORECIDO: TFloatField;
    qryDetIDREGRACALCULO: TFloatField;
    qryDetVALORRUBRICA: TFloatField;
    qryDetANOMESINICIO: TStringField;
    qryDetFLGPERMANENTE: TFloatField;
    qryDetPARCELAS: TFloatField;
    qryDetFLGTPRUBMANUT: TStringField;
    qryDetFUNCIONARIO: TStringField;
    ProcuraFavorecido: TCMProcuraForCli;
    gbxValCalc: TGroupBox;
    edTotProventos: TRealEdit;
    spdbtnValCalc: TSpeedButton;
    qryIn: TwwQuery;
    Regra: TRegra;
    dbedDescricao: TwwDBEdit;
    dbedCodigo: TwwDBEdit;
    dbedSeq: TwwDBEdit;
    dbedValor: TDBRealEdit;
    procedure FormCreate(Sender: TObject);
    procedure sbtnProcurarClick(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure chkRubPermanenteClick(Sender: TObject);
    procedure ProcuraFavorecidoExit(Sender: TObject);
    procedure cmbMesExit(Sender: TObject);
    procedure spnedAnoExit(Sender: TObject);
    procedure bbtnOkDetClick(Sender: TObject);
    procedure dblkcmbRegraChange(Sender: TObject);
    procedure dsDetStateChange(Sender: TObject);
    procedure spdbtnValCalcClick(Sender: TObject);
    Procedure CmeCadastroConfirma(Sender: TObject);
    Procedure CmeCadastroFind(Sender: TObject);
    Procedure CmeDetalheEdit(Sender: TObject);
    Procedure CmeDetalheInsert(Sender: TObject);
    procedure dblkpcmbEmpregadoChange(Sender: TObject);
  private
    sAnoMes: string;
    DataFim: TDateTime;
    wDia, wMes, wAno: word;

    procedure AtualizarDetalhe(ID:integer; qryPrincipal:boolean);
    procedure AtualizaAnoMesInicio;
    procedure CalculaRegra;
  end;

var
  frmLancaRubPorRub: TfrmLancaRubPorRub;

implementation

uses uCMTypes, uMensErro, uDataBase, uSistema, uFuncoesUteis, uCalcRub, UsoGeralRH;

{$R *.DFM}

procedure TfrmLancaRubPorRub.FormCreate(Sender: TObject);
begin
  InicializaFormula1;

  if (Sistema.IdModulo = 417) then
     HelpContext := 4170026;

  qryParamRH.Open;
  if (qryParamRH.FieldByName('NORMALINI').IsNull) or
     (qryParamRH.FieldByName('NORMALFIM').IsNull) then
  begin
    MsgDlg('Não Há Período Aberto! Verifique e tente novamente.','Aviso', mtInformation,[mbOk,mbHelp],0);
    close;
    exit;
  end;

  inherited;
  with (MontaSelect.Filtro) do
  begin
    Clear;
    Add('RUBRICAXPESS.IDRUBRICA IS NULL OR RUBRICAXPESS.IDPESSOA = '+IntToStr(Sistema.IdEmpresa));
    Add('PROVDESC.FLGTPRUBRICA LIKE (''%F%'')');
    Add('PROVDESC.IDPROVENTO = RUBRICAXPESS.IDRUBRICA');
    if Sistema.IdModulo = 417 then
    begin
       Add('PROVDESC.CODRUBCLT = ''50490''');
       lblSeq.Visible           := False;
       dbedSeq.Visible          := False;
       chkRubPermanente.Visible := False;
       gbxValCalc.Visible       := False;
       grpMesInicio.Visible     := False;
       lblParcelas.Visible      := False;
       spedParcelas.Visible     := False;
       lblOcorr.Visible         := False;
       dbedOcorr.Visible        := False;
       lblRegra.Visible         := False;
       dblkcmbRegra.Visible     := False;
       lblValorInf.Top  := 109;
       lblValorInf.Left := 70;
       dbedValor.Top    := 123;
       dbedValor.Left   := 70;
    end;
  end;

  lblMesLanc.Caption := 'Período Aberto: ' + qryParamRH.FieldbyName('NORMALINI').asString+
                        ' a '+ qryParamRH.FieldbyName('NORMALFIM').asString;

  sAnoMes := RetornaAnoMes(qryParamRH.FieldbyName('NORMALINI').asDateTime);
  DataFim := qryParamRH.FieldbyName('NORMALFIM').Value;
  qryParamRH.Close;

  if sUsoGeralIdPessoa <> '' then
  begin
     qryDet.Sql[8]  := '  (F.IDPESSOA   = ' +  sUsoGeralIdPessoa + ') AND ';
     qryFunc.Sql[5] := '  (F.IDPESSOA   = ' +  sUsoGeralIdPessoa + ') AND ';
  end;

  if sUsuXccusto <> '' then
  begin
     qryDet.Sql[8]  := '  (F.CODCENTROCUSTO IN ' + sUsuXccusto + ') AND ';
     qryFunc.Sql[5] := '  (F.CODCENTROCUSTO IN ' + sUsuXccusto + ') AND ';
  end;

  if sUsuXfilial <> '' then
  begin
     qryDet.Sql[9]  := '  (F.IDESTAB IN ' + sUsuXfilial + ') AND ';
     qryFunc.Sql[6] := '  (F.IDESTAB IN ' + sUsuXfilial + ') AND ';
  end;

  qryFunc.ParamByName('IDEMPRESA').asInteger := Sistema.IdEmpresa;
  qryFunc.Open;
  qryRegra.Open;

  qry.Prepare;
  qryDet.Prepare;

  AtualizarDetalhe(-1, true);

  sbtnProcurarClick(Self);

  // Atribuo componentes Regra do Form para o Cálculo
  compRegra  := Regra;
  qryInRegra := qryIn;
end;

procedure TfrmLancaRubPorRub.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  inherited;
  qry.Close;
  qry.UnPrepare;
  qryDet.Close;
  qryDet.UnPrepare;
  qryFunc.Close;
  qryRegra.Close;

  FinalizaFormula1;  
end;

procedure TfrmLancaRubPorRub.sbtnProcurarClick(Sender: TObject);
begin
  inherited;
  // Para fazer a procura na criação do Formulário
end;

procedure TfrmLancaRubPorRub.CmeCadastroFind(Sender: TObject);
begin
  if (MontaSelect.RetornouValor) then
    AtualizarDetalhe(StrToInt(MontaSelect.ValoresChave[1]), true);
end;

procedure TfrmLancaRubPorRub.AtualizarDetalhe(ID:integer; qryPrincipal:boolean);
begin
  if (qryPrincipal) then
  begin
    qry.Close;
    qry.ParamByName('IDEMPRESA').asInteger  := Sistema.IdEmpresa;
    qry.ParamByName('IDPROVENTO').asInteger := ID;
    qry.Open;
  end;

  qryDet.Close;
  qryDet.ParamByName('IDEMPRESA').asInteger  := Sistema.IdEmpresa;
  qryDet.ParamByName('IDPROVENTO').asInteger := ID;
  qryDet.Open;

  ProcuraFavorecido.Visible := (qry.FieldByName('FLGOBRIGAFAVOREC').asInteger = 1);
end;

procedure TfrmLancaRubPorRub.CalculaRegra;
var
  ValCalc1, ValBase: double;
  TemLanc, QtdParc, QtdOcor : integer;
  RegRegra, RegPessoa: string;
begin
  if not(qryDet.FieldByName('VALORRUBRICA').IsNull) then
    ValCalc1 := qryDet.FieldByName('VALORRUBRICA').Value
  else
    ValCalc1 := 0;

  try
    if not(qryDet.FieldByName('IDREGRACALCULO').IsNull) then
    begin
      RegRegra  := qryDet.FieldByName('IDREGRACALCULO').asString;
      RegPessoa := qryDet.FieldByName('IDPESSOA').asString;
      QtdParc   := 1;
      ValBase   := 0;
      QtdParc   := qryDet.FieldByName('PARCELAS').asInteger;
      QtdOcor   := qryDet.FieldByName('NumOcorrencias').asInteger;

      CalcBenef (False, RegRegra, RegPessoa, ValCalc1, ValBase, TemLanc, QtdParc, QtdOcor,0,0);
    end;
  except
  end;

  edTotProventos.Value := ValCalc1;
end;

procedure TfrmLancaRubPorRub.dblkpcmbEmpregadoChange(Sender: TObject);
begin
  if (qryDet.State in [dsInsert, dsEdit]) then
    qryDet.FieldByName('FUNCIONARIO').asString := dblkpcmbEmpregado.Text;
end;

procedure TfrmLancaRubPorRub.chkRubPermanenteClick(Sender: TObject);
begin
  spedParcelas.Visible := not(chkRubPermanente.Checked);
  lblParcelas.Visible  := not(chkRubPermanente.Checked);
end;

procedure TfrmLancaRubPorRub.ProcuraFavorecidoExit(Sender: TObject);
begin
  if (ProcuraFavorecido.Valida <> vcOk) then
    exit;
end;

procedure TfrmLancaRubPorRub.cmbMesExit(Sender: TObject);
begin
  wMes := cmbMes.ItemIndex + 1;
end;

procedure TfrmLancaRubPorRub.spnedAnoExit(Sender: TObject);
begin
  wAno := spnedAno.Value;
end;

procedure TfrmLancaRubPorRub.dsDetStateChange(Sender: TObject);
begin
  inherited;
  edTotProventos.Value := 0;
  
  case (qryDet.State) of
    dsInsert : spdbtnValCalc.Enabled := false;
    dsEdit   : spdbtnValCalc.Enabled := (qryDet.FieldByName('IDREGRACALCULO').asString <> '');
  end;
end;

procedure TfrmLancaRubPorRub.dblkcmbRegraChange(Sender: TObject);
begin
  spdbtnValCalc.Enabled := (Trim(dblkcmbRegra.Text) <> '');
end;

procedure TfrmLancaRubPorRub.spdbtnValCalcClick(Sender: TObject);
begin
  CalculaRegra;
end;

procedure TfrmLancaRubPorRub.AtualizaAnoMesInicio;
begin
  if (qryDet.FieldByName('ANOMESINICIO').IsNull) then
    DecodeDate(DataFim, wAno, wMes, wDia)
  else
  begin
    wMes := StrToInt(Copy(qryDet.FieldByName('ANOMESINICIO').asString,6,2));
    wAno := StrToInt(Copy(qryDet.FieldByName('ANOMESINICIO').asString,1,4));
  end;
  cmbMes.ItemIndex := wMes - 1;
  spnedAno.Value   := wAno;
end;

procedure TfrmLancaRubPorRub.CmeDetalheEdit(Sender: TObject);
begin
  inherited;
  spedParcelas.Value       := qryDet.FieldByName('PARCELAS').asInteger;
  chkRubPermanente.Checked := (qryDet.FieldByName('FLGPERMANENTE').asInteger = 1);
  AtualizaAnoMesInicio;
end;

procedure TfrmLancaRubPorRub.CmeDetalheInsert(Sender: TObject);
begin
  inherited;
  with (qryDet) do
  begin
    if (qry.FieldByName('IDREGRA').IsNull) then
      FieldByName('IDREGRACALCULO').Clear
    else
      FieldByName('IDREGRACALCULO').asInteger := qry.FieldByName('IDREGRA').asInteger;

    FieldByName('IDRUBRICA').asInteger      := qry.FieldByName('IDRUBRICA').asInteger;
    FieldByName('IDEMPRESA').asInteger      := Sistema.IdEmpresa;
    FieldByName('FLGTPRUBMANUT').asString   := '2';
    FieldByName('ANOMESINICIO').asString    := sAnoMes;
    FieldByName('NUMOCORRENCIAS').asInteger := 0;
  end;
  AtualizaAnoMesInicio;
  spedParcelas.Value       := 1;
  chkRubPermanente.Checked := false;
  dblkpcmbEmpregado.SetFocus;
end;

procedure TfrmLancaRubPorRub.bbtnOkDetClick(Sender: TObject);
var
  ProxSeq: integer;
begin
  if (Trim(dblkpcmbEmpregado.Text) = '') then
  begin
    MsgDlg('Pessoa Não Identificada !','Aviso', mtInformation,[mbOk,mbHelp],0);
    dblkpcmbEmpregado.SetFocus;
    exit;
  end;

  if (qry.FieldByName('FLGOBRIGAFAVOREC').asInteger = 1) and
     (ProcuraFavorecido.Valida <> vcOK) then
  begin
    MsgDlg('Informe o Favorecido !','Aviso', mtInformation,[mbOk,mbHelp],0);
    ProcuraFavorecido.SetFocus;
    exit;
  end;

  if (dbedValor.Value = 0) and (Trim(dblkcmbRegra.Text) = '') then
  begin
    MsgDlg('Informe Valor e/ou Regra !','Aviso', mtInformation,[mbOk,mbHelp],0);
    dbedValor.SetFocus;
    exit;
  end;

  if (dbedValor.Value <> 0) and (Trim(dblkcmbRegra.Text) <> '') then
    if (MsgDlg('Confirma Ambos: Valor e Regra ?', LerMensagem(4), mtConfirmation,
             [mbYes, mbNo], 0) <> mrYes) then
    begin
      dblkcmbRegra.SetFocus;
      exit;
    end;

  if (qryDet.State = dsInsert) then
  begin
    with (qryProxSeq.SQL) do
    begin
      Clear;
      Add('SELECT MAX(SEQRUBRICAINDIV)+1 AS PROXNUM FROM RUBRICAINDIV');
      Add('WHERE (IDPESSOA  = ' +qryFunc.FieldByName('IDPESSOA').asString +') AND');
      Add('      (IDRUBRICA = ' +qry.FieldByName('IDRUBRICA').asString+') AND');
      Add('      (IDEMPRESA = ' +IntToStr(Sistema.IdEmpresa)+')');
    end;
    qryProxSeq.Open;

    if (qryProxSeq.FieldByName('PROXNUM').IsNull) then
      ProxSeq := 1
    else
      ProxSeq := qryProxSeq.FieldByName('PROXNUM').asInteger;

    qryProxSeq.Close;
    qryDet.FieldByName('SEQRUBRICAINDIV').asInteger := ProxSeq;
  end;

  qryDet.FieldByName('ANOMESINICIO').asString :=
    Trim(spnedAno.Text) +'/'+ RetornaMes(Trim(cmbMes.Text));

  qryDet.FieldByName('IDEMPRESA').Value := Sistema.IdEmpresa;
  qryDet.FieldByName('PARCELAS').Value  := spedParcelas.Value;

  if (chkRubPermanente.Checked) then
    qryDet.FieldByName('FLGPERMANENTE').Value := 1
  else
    qryDet.FieldByName('FLGPERMANENTE').Value := 0;

  if (Trim(dblkcmbRegra.Text) <> '') then
    qryDet.FieldbyName('IDREGRACALCULO').asInteger := qryRegra.FieldbyName('IDREGRA').asInteger;
  inherited;
end;

procedure TfrmLancaRubPorRub.CmeCadastroConfirma(Sender: TObject);
begin
  try
    AplicaAlteracoes([qryDet]);
  except
    raise;
  end;
end;

end.
