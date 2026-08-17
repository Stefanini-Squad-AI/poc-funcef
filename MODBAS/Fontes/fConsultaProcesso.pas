unit FConsultaProcesso;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs, fCadMestreDetCS,
  IvDictio, IvMulti, IvEMulti, MontaSelect, DBTables, Db, Wwdatsrc, Wwquery, TB97Ctls, TB97,
  MAHlpBtn, TB97Tlbr, StdCtrls, Buttons, Grids, Wwdbigrd, Wwdbgrid, ComCtrls, Wwtable, Mask,
  TabControlDetalhe, ExtCtrls, CMProcura, wwdblook, Wwdbspin, wwdbedit, TREdit, DBCtrls,
  CMProcuraSubTipo, wwdbdatetimepicker, CMDateTimePicker, CmEventosCadastro, ImgList, uRegra;

type
  TfrmConsultaProcesso = class(TfrmCadMestreDetalheCS)
    MontaSelectCidade: TMontaSelect;
    ds2: TwwDataSource;
    tblTipRec: TwwTable;
    qryProcVinc: TwwQuery;
    qryPartic: TwwQuery;
    ds5: TwwDataSource;
    qryTipAcao: TwwQuery;
    ds4: TwwDataSource;
    tblTipSent: TwwTable;
    dsProcVinc: TwwDataSource;
    qryAdvCasa: TwwQuery;
    qryTipoProc: TwwQuery;
    tblObjeto: TwwTable;
    tblObjetoDescricao: TStringField;
    tblObjetoVALORRECL: TFloatField;
    tblObjetoPERCPROB: TFloatField;
    tblObjetoValorEsperado: TFloatField;
    tblObjetoVALORSENTENCA: TFloatField;
    tblObjetoNUMPROCTRAB: TFloatField;
    tblObjetoCODTIPOOBJETO: TFloatField;
    tblObjetoOBSERVACAO: TStringField;
    tblTipObj: TwwTable;
    Label1: TLabel;
    dbedNumero: TDBEdit;
    Label2: TLabel;
    dbedDataAju: TCMDateTimePicker;
    rgSituacao: TDBRadioGroup;
    Label19: TLabel;
    dbedDataNot: TCMDateTimePicker;
    Label30: TLabel;
    dbedNumJCJ: TDBEdit;
    rgAtivo: TDBRadioGroup;
    dbrgMateria: TDBRadioGroup;
    tbshOutrosDados: TTabSheet;
    tbshEncer: TTabSheet;
    tbsEtapas: TTabSheet;
    tbsObsEtp: TTabSheet;
    tbshVinculos: TTabSheet;
    dblcVara: TwwDBLookupCombo;
    Label3: TLabel;
    dbedPost: TCMDateTimePicker;
    Label16: TLabel;
    dbedNumTRT: TDBEdit;
    Label18: TLabel;
    dbedQtde: TDBEdit;
    Label17: TLabel;
    dbedNumTST: TDBEdit;
    Label31: TLabel;
    dblcTipProc: TwwDBLookupCombo;
    Label33: TLabel;
    dblcTipAcao: TwwDBLookupCombo;
    Label34: TLabel;
    dblcAdvCasa: TwwDBLookupCombo;
    Label35: TLabel;
    dbedPasta: TDBEdit;
    Label36: TLabel;
    ProcuraCidade: TCMProcura;
    Label8: TLabel;
    dbreDespesa: TDBRealEdit;
    dbedNumVara: TwwDBEdit;
    Label4: TLabel;
    Label5: TLabel;
    dblcTipObj: TwwDBLookupCombo;
    Label6: TLabel;
    dbedValRecl: TDBEdit;
    Label7: TLabel;
    dbedPerc: TDBEdit;
    Label24: TLabel;
    edValor: TRealEdit;
    lblValReal: TLabel;
    dbedValReal: TDBEdit;
    Label39: TLabel;
    dbmemObserv: TDBMemo;
    rgTipEncer: TDBRadioGroup;
    gbxAcordo: TGroupBox;
    sbspeParc: TwwDBSpinEdit;
    gbxDataEncer: TGroupBox;
    dbedEncerr: TCMDateTimePicker;
    gbxSent: TGroupBox;
    dblcTipSent: TwwDBLookupCombo;
    Label15: TLabel;
    dbedPrevEnc: TCMDateTimePicker;
    dbGrdEtapa: TwwDBGrid;
    Label25: TLabel;
    DBEdit1: TDBEdit;
    Label26: TLabel;
    DBEdit2: TDBEdit;
    Label27: TLabel;
    DBEdit4: TDBEdit;
    Label29: TLabel;
    DBMemo1: TDBMemo;
    pnlLigado: TPanel;
    Label37: TLabel;
    Label38: TLabel;
    spbProcVinc: TSpeedButton;
    spbApagaVinc: TSpeedButton;
    dbrgVinc: TDBRadioGroup;
    dbedNumVinc: TDBEdit;
    gbxVinculados: TGroupBox;
    wwDBGrid1: TwwDBGrid;
    CMProcuraAdv1: TCMProcuraSubTipo;
    CMProcuraAdv2: TCMProcuraSubTipo;
    CMProcuraAssist: TCMProcuraSubTipo;
    qryTipoObj: TwwQuery;
    qryVara: TwwQuery;
    tbsLitisconsortes: TTabSheet;
    pnlDet2: TPanel;
    dbgrDet2: TwwDBGrid;
    dsDet2: TwwDataSource;
    qryLitis: TwwQuery;
    updLitis: TUpdateSQL;
    CMProcuraLitis: TCMProcuraSubTipo;
    qryEtapa: TwwQuery;
    UpdEtapa: TUpdateSQL;
    pnlEtapas: TPanel;
    Label22: TLabel;
    Label20: TLabel;
    Label41: TLabel;
    Label42: TLabel;
    lblHonor: TLabel;
    Label43: TLabel;
    dblcTipoEtp: TwwDBLookupCombo;
    dtedDataReal: TCMDateTimePicker;
    mskedHora: TMaskEdit;
    dbedAssunto: TDBEdit;
    dbedValRec: TwwDBEdit;
    redHonor: TRealEdit;
    dbmObserv: TDBMemo;
    qryTipoEtapa: TwwQuery;
    tblHonor: TwwTable;
    qryNumSeq: TwwQuery;
    dbedNome: TwwDBEdit;
    Label9: TLabel;
    procedure tblObjetoCalcFields(DataSet: TDataSet);
    procedure rgTipEncerClick(Sender: TObject);
    procedure tblObjetoAfterPost(DataSet: TDataSet);
    procedure tblObjetoBeforeEdit(DataSet: TDataSet);
    procedure CmeCadastroEdit(Sender: TObject);
    procedure CmeCadastroFind(Sender: TObject);
    procedure CmeCadastroConfirma(Sender: TObject);
    procedure CmeDetalheInsert(Sender: TObject);
    procedure tblObjetoAfterInsert(DataSet: TDataSet);
    procedure qryAfterScroll(DataSet: TDataSet);
    procedure bbtnOkDetClick(Sender: TObject);
    procedure qryAfterInsert(DataSet: TDataSet);
    procedure sbtnAltDetClick(Sender: TObject);
    procedure spbProcVincClick(Sender: TObject);
    procedure rgSituacaoClick(Sender: TObject);
    procedure spbApagaVincClick(Sender: TObject);
    procedure qryAfterOpen(DataSet: TDataSet);
    procedure CMProcuraRequerenteExit(Sender: TObject);
    procedure qryLitisBeforePost(DataSet: TDataSet);
    procedure sbtnProcurarClick(Sender: TObject);
    procedure qryEtapaBeforeEdit(DataSet: TDataSet);
    procedure dblcTipoEtpCloseUp(Sender: TObject; LookupTable, FillTable: TDataSet;
      modified: Boolean);
    procedure qryEtapaAfterScroll(DataSet: TDataSet);
    procedure qryEtapaBeforePost(DataSet: TDataSet);
    procedure qryEtapaBeforeInsert(DataSet: TDataSet);
    procedure bbtnCancelarClick(Sender: TObject);
    procedure bbtnCancelarDetClick(Sender: TObject);
    procedure qryEtapaAfterInsert(DataSet: TDataSet);
    procedure bbtnVoltarDetClick(Sender: TObject);
    procedure FormCreate(Sender: TObject);
  private
    procedure MudaReclamante;
  end;

var
  frmConsultaProcesso: TfrmConsultaProcesso;
  ValAntes: double;
  ProxSeq: integer;

implementation

uses uSistema, uCMTypes, uMensErro, uDataBase, uFuncoesUteisRH;

{$R *.DFM}

procedure TfrmConsultaProcesso.FormCreate(Sender: TObject);
begin
  inherited;
  tblTipObj.Open;
  qryTipoObj.Open;
  qryVara.Open;
  tblTipSent.Open;

  qry.Close;
  qry.ParamByName('NumProcTrab').Value := 0;
  qry.Open;

  qryLitis.Close;
  qryLitis.ParamByName('NumProcTrab').Value := 0;
  qryLitis.Open;

  qryEtapa.Close;
  qryEtapa.ParamByName('NumProcTrab').Value := 0;
  qryEtapa.Open;

  tblObjeto.Open;
  tblTipRec.Open;
  qryTipoProc.Open;
  qryAdvCasa.Open;
  qryTipAcao.Open;

  case (Sistema.IdModulo) of
    MODCON : HelpContext := 760025;
    PROCPREV, PROCJUD : HelpContext := 1100019;
  end;
end;

procedure TfrmConsultaProcesso.tblObjetoCalcFields(DataSet: TDataSet);
begin
  inherited;
  tblObjetoVALORESPERADO.Value := (tblObjetoVALORRECL.Value * tblObjetoPERCPROB.Value) / 100;
  edValor.Value := tblObjetoVALORESPERADO.Value;
end;

procedure TfrmConsultaProcesso.rgTipEncerClick(Sender: TObject);
begin
  inherited;
  if  (rgTipEncer.ItemIndex = 1) or (rgTipEncer.ItemIndex = 3) then
  begin
    MsgDlg('Não Esqueça de Atualizar os Valores Reais dos Objetos',
           'Aviso', mtInformation, [mbOk, mbHelp], 0);
  end;

  gbxAcordo.Visible := (rgTipEncer.ItemIndex = 1);
  gbxSent.Visible := (rgTipEncer.ItemIndex = 3);
end;

procedure TfrmConsultaProcesso.tblObjetoAfterPost(DataSet: TDataSet);
begin
  inherited;
  qry.FieldByName('CUSTOPROC').Value := qry.FieldByName('CUSTOPROC').Value +
    (1 - rgSituacao.ItemIndex) * tblObjetoVALORESPERADO.Value  +
    rgSituacao.ItemIndex * tblObjetoVALORSENTENCA.Value - ValAntes;
end;

procedure TfrmConsultaProcesso.tblObjetoBeforeEdit(DataSet: TDataSet);
begin
  inherited;
  if (tblObjetoVALORSENTENCA.Value = 0) then
    ValAntes := tblObjetoVALORESPERADO.Value
  else
    ValAntes := tblObjetoVALORSENTENCA.Value;
end;

procedure TfrmConsultaProcesso.CmeCadastroFind(Sender: TObject);
begin
  if (MontaSelect.ValoresChave.Count > 0) and (MontaSelect.ValoresChave[0] <> '')  then
  begin
    qry.Close;
    qry.ParamByName('NumProcTrab').Value := StrToFloat(MontaSelect.ValoresChave[0]);
    qry.Open;

    qryLitis.Close;
    qryLitis.ParamByName('NumProcTrab').Value := StrToFloat(MontaSelect.ValoresChave[0]);
    qryLitis.Open;

    tblObjeto.Close;
    tblObjeto.Open;

    if not(qryTipoEtapa.Active) then
      qryTipoEtapa.Open;

    qryNumSeq.Close;
    qryNumSeq.ParamByName('NumProc').Value := StrToFloat(MontaSelect.ValoresChave[0]);
    qryNumSeq.Open;
    ProxSeq := qryNumSeq.FieldByName('ULTSEQ').AsInteger;
    qryAfterScroll(ds.Dataset);
  end;
end;

procedure TfrmConsultaProcesso.tblObjetoAfterInsert(DataSet: TDataSet);
begin
  inherited;
  tblObjetoVALORSENTENCA.Value := 0;
end;

procedure TfrmConsultaProcesso.qryAfterScroll(DataSet: TDataSet);
begin
  inherited;
  qryEtapa.Close;
  qryEtapa.ParamByName('NumProcTrab').asFloat := qry.FieldByName('NUMPROCTRAB').asFloat;
  qryEtapa.Open;

  tbshEncer.Visible := rgSituacao.ItemIndex = 1;
  rgTipEncer.Visible := rgSituacao.ItemIndex = 1;
  gbxDataEncer.Visible := rgSituacao.ItemIndex = 1;
  gbxAcordo.Visible := rgTipEncer.ItemIndex = 1;
  gbxSent.Visible := rgTipEncer.ItemIndex = 3;
  lblValReal.Visible := rgSituacao.ItemIndex = 1;
  dbedValReal.Visible := rgSituacao.ItemIndex = 1;
  MudaReclamante;
  spbApagaVinc.Enabled := qry.FieldByName('IDPROCVINCULADO').Value <> Null;
end;

procedure TfrmConsultaProcesso.bbtnOkDetClick(Sender: TObject);
begin
  if (pgctrlDetalhe.ActivePage = tbsDet) and (Trim(dblcTipObj.Text) = '') then
  begin
    MsgDlg('Tipo de Objeto Não Identificado', 'Aviso', mtInformation, [mbOk,mbHelp], 0);
    dblcTipObj.SetFocus;
    Exit;
  end;

  if (pgctrlDetalhe.ActivePage = tbsDet) and (Trim(dbedValRecl.Text) = '') then
  begin
    MsgDlg('Valor Reclamado Não Informado', 'Aviso', mtInformation, [mbOk,mbHelp], 0);
    dbedValRecl.SetFocus;
    Exit;
  end;

  if (pgctrlDetalhe.ActivePage = tbsDet) and (Trim(edValor.Text) = '') and
     (Trim(dbedPerc.Text) = '') then
  begin
    MsgDlg('Informe Percentual ou Valor Esperado', 'Aviso', mtInformation, [mbOk,mbHelp], 0);
    dbedPerc.SetFocus;
    Exit;
  end;

  if (pgctrlDetalhe.ActivePage = tbsDet) and (Trim(edValor.Text) <> '') and
     (Trim(dbedPerc.Text) = '') then
    dbedPerc.Text := FloatToStr(edValor.Value * 100 / StrToFloat(dbedValRecl.Text));

  if (pgctrlDetalhe.ActivePage = tbsEtapas) then
  begin
    if (dtedDataReal.Text = '') then
    begin
      MsgDlg('Preencha a Data (Prevista ou Real)', 'Aviso', mtInformation, [mbOk,mbHelp], 0);
      dtedDataReal.SetFocus;
      Exit;
    end;

    if (dblcTipoEtp.Text = '') then
    begin
      MsgDlg('Preencha o Tipo de Etapa', 'Aviso', mtInformation, [mbOk,mbHelp], 0);
      dblcTipoEtp.SetFocus;
      Exit;
    end;

    if (dbedAssunto.Text = '') then
    begin
      MsgDlg('Preencha o Assunto', 'Aviso', mtInformation, [mbOk,mbHelp], 0);
      dbedAssunto.SetFocus;
      Exit;
    end;
  end;
  inherited;
end;

procedure TfrmConsultaProcesso.qryAfterInsert(DataSet: TDataSet);
begin
  inherited;
  qry.FieldByName('NUMPROCTRAB').Value := LeUltRegistro(nil,'PROCESSOTRAB');
  qry.FieldByName('FLGSITPROC').Value := 0;
  qry.FieldByName('CUSTOPROC').Value := 0;
  qry.FieldByName('DESPESAPROC').Value := 0;
  qry.FieldByName('DATAPREVENCER').Value := Date + round(365.25 * 5);
  qry.FieldByName('INDMATERIA').Value := 4;
end;

procedure TfrmConsultaProcesso.sbtnAltDetClick(Sender: TObject);
begin
  inherited;
  if (pgctrlDetalhe.ActivePage = tbsDet) then
    dblcTipObj.SetFocus;
  if (pgctrlDetalhe.ActivePage = tbsEtapas) then
    dblcTipoEtp.SetFocus;
end;

procedure TfrmConsultaProcesso.spbProcVincClick(Sender: TObject);
begin
  inherited;
  MontaSelect.Executar;
  if (MontaSelect.ValoresChave.Count > 0) and
     (MontaSelect.ValoresChave[0] <> '')  and
     ((ds.Dataset.State = dsInsert) or (ds.Dataset.State = dsEdit)) then
  begin
    qry.FieldByName('IDPROCVINCULADO').Value := StrToFloat(MontaSelect.ValoresChave[0]);
    spbApagaVinc.Enabled := True;
  end;
end;

procedure TfrmConsultaProcesso.rgSituacaoClick(Sender: TObject);
begin
  inherited;
  if rgSituacao.ItemIndex = 0 then
  begin
    if MsgDlg('Deseja Reabrir o Processo ?', LerMensagem(4),
              mtConfirmation, [mbYes, mbNo], 0) = mrYes then
    begin
      qry.FieldByName('FLGSITPROC').Value  := 0;
      qry.FieldByName('DATAEFETENC').Value := Null;
      bbtnConfirmarClick(rgSituacao);
    end
    else
    begin
      rgSituacao.OnClick := Nil;
      rgSituacao.ItemIndex := 1;
      rgSituacao.OnClick := rgSituacaoClick;
    end;
  end
  else
  begin
    if MsgDlg('Deseja Encerrar o Processo ?', LerMensagem(4),
              mtConfirmation, [mbYes, mbNo], 0) <> mrYes then
    begin
      bbtnCancelarClick(rgSituacao);
      rgSituacao.OnClick := Nil;
      rgSituacao.ItemIndex := 0;
      rgSituacao.OnClick := rgSituacaoClick;
    end
    else
    begin
      qry.FieldByName('DATAEFETENC').Value := date;
      pgctrlDetalhe.ActivePage := tbshEncer;
    end;
  end;
  tbshEncer.Visible    := rgSituacao.ItemIndex = 1;
  rgTipEncer.Visible   := rgSituacao.ItemIndex = 1;
  gbxDataEncer.Visible := rgSituacao.ItemIndex = 1;
  lblValReal.Visible   := rgSituacao.ItemIndex = 1;
  dbedValReal.Visible  := rgSituacao.ItemIndex = 1;
end;

procedure TfrmConsultaProcesso.MudaReclamante;
begin
  qryPartic.Close;
  qryPartic.ParamByName('IDRECLAMANTE').AsInteger := qry.FieldByName('IDRECLAMANTE').AsInteger;
  qryPartic.Open;
end;

procedure TfrmConsultaProcesso.spbApagaVincClick(Sender: TObject);
begin
  inherited;
  if MsgDlg('Confirma a Excluão do Vínculo ?', LerMensagem(4),
             mtConfirmation, [mbYes, mbNo], 0) <> mrYes
  then  exit;

  if (ds.State <> dsEdit) and (ds.State <> dsInsert) then
    ds.Dataset.Edit;
  qry.FieldByName('IDPROCVINCULADO').Value := Null;
  qry.FieldByName('FLGVINCULADO').Value    := Null;
  spbApagaVinc.Enabled := false;
end;

procedure TfrmConsultaProcesso.qryAfterOpen(DataSet: TDataSet);
begin
  inherited;
  qryProcVinc.Open;
end;

procedure TfrmConsultaProcesso.CmeCadastroEdit(Sender: TObject);
begin
  inherited;
  if pgctrlDetalhe.ActivePage = tbsDet then
     if dblcTipObj.CanFocus then dblcTipObj.SetFocus;
  if pgctrlDetalhe.ActivePage = tbsLitisconsortes then
     if CMProcuraLitis.CanFocus then CMProcuraLitis.SetFocus;
  if pgctrlDetalhe.ActivePage = tbsEtapas then
     if dblcTipoEtp.CanFocus then dblcTipoEtp.SetFocus;
end;

procedure TfrmConsultaProcesso.CmeCadastroConfirma(Sender: TObject);
begin
  inherited;
  try
    AplicaAlteracoes([tblObjeto, qryLitis, qryEtapa]);
  except
    raise;
  end;
end;

procedure TfrmConsultaProcesso.CmeDetalheInsert(Sender: TObject);
begin
  inherited;
  if pgctrlDetalhe.ActivePage = tbsDet then
     if dblcTipObj.CanFocus then dblcTipObj.SetFocus;

  if pgctrlDetalhe.ActivePage = tbsLitisconsortes then begin
     qryLitis.FieldByName('NUMPROCTRAB').AsString  :=
              qry.FieldByName('NUMPROCTRAB').AsString;
     if CMProcuraLitis.CanFocus then CMProcuraLitis.SetFocus;
  end;

  if pgctrlDetalhe.ActivePage = tbsEtapas then begin
     qryEtapa.FieldByName('NUMPROCTRAB').AsString  :=
              qry.FieldByName('NUMPROCTRAB').AsString;
     if dblcTipoEtp.CanFocus then dblcTipoEtp.SetFocus;
  end;
end;

procedure TfrmConsultaProcesso.CMProcuraRequerenteExit(Sender: TObject);
begin
  inherited;
  MudaReclamante;
end;

procedure TfrmConsultaProcesso.qryLitisBeforePost(DataSet: TDataSet);
begin
  inherited;
  qryLitis.FieldByName('NOME').AsString := CMProcuraLitis.Text;
end;

procedure TfrmConsultaProcesso.sbtnProcurarClick(Sender: TObject);
begin
  if (MsgDlg('Deseja Buscar Contra-Parte por Nome, Incluindo Litisconsortes ? (Bem Mais Demorado)',
             LerMensagem(4), mtConfirmation, [mbYes, mbNo], 0) <> mrYes) then
  begin
      MontaSelect.Filtro.Clear;
      MontaSelect.Filtro.Add('PROCESSOTRAB.IDRECLAMANTE  = PESSOA.IDPESSOA');
      MontaSelect.Filtro.Add('PROCESSOTRAB.IDVARAJUSTICA = VARAJUSTICA .IDVARAJUSTICA (+)');
      MontaSelect.Tabelas.Clear;
      MontaSelect.Tabelas.Add('PESSOA');
      MontaSelect.Tabelas.Add('PROCESSOTRAB');
      MontaSelect.Tabelas.Add('VARAJUSTICA');
  end
  else
  begin
      MontaSelect.Filtro.Clear;
      MontaSelect.Filtro.Add('(PROCESSOTRAB.IDRECLAMANTE = PESSOA.IDPESSOA) OR (COPARTPROCTRAB.IDPESSOA   = PESSOA.IDPESSOA)');
      MontaSelect.Filtro.Add('PROCESSOTRAB.NUMPROCTRAB   = COPARTPROCTRAB.NUMPROCTRAB(+)');
      MontaSelect.Filtro.Add('PROCESSOTRAB.IDVARAJUSTICA = VARAJUSTICA .IDVARAJUSTICA (+)');
      MontaSelect.Tabelas.Clear;
      MontaSelect.Tabelas.Add('PESSOA');
      MontaSelect.Tabelas.Add('PROCESSOTRAB');
      MontaSelect.Tabelas.Add('VARAJUSTICA');
      MontaSelect.Tabelas.Add('COPARTPROCTRAB');
  end;
  inherited;
end;

procedure TfrmConsultaProcesso.qryEtapaBeforeEdit(DataSet: TDataSet);
begin
  inherited;
  ValAntes := qryEtapa.FieldByName('VALORREC').AsFloat;
end;

procedure TfrmConsultaProcesso.dblcTipoEtpCloseUp(Sender: TObject; LookupTable,
  FillTable: TDataSet; modified: Boolean);
begin
  inherited;
  if  (sbtnInsDet.Down) and (qryEtapa.FieldByName('ValorHonor').AsFloat <> 0)  then
  begin
     lblHonor.Visible := True;
     redHonor.Visible := True;
     redHonor.Value  := qryEtapa.FieldByName('ValorHonor').AsFloat;
  end;
end;

procedure TfrmConsultaProcesso.qryEtapaAfterScroll(DataSet: TDataSet);
begin
  inherited;
  dtedDataReal.Text := '';
  mskedHora.Text    := '';
  if qryEtapa.FieldByName('DATAREALOCOR').Value <> Null then begin
     dtedDataReal.Date  := StrToDate(DateToStr(qryEtapa.FieldByName('DATAREALOCOR').AsDateTime));
     //mskedHora.Text     := TimeToStr(qryEtapa.FieldByName('DATAREALOCOR').AsDateTime);
     mskedHora.Text     := copy(qryEtapa.FieldByName('DATAREALOCOR').AsString,12,5);
  end;
end;

procedure TfrmConsultaProcesso.qryEtapaBeforePost(DataSet: TDataSet);
begin
  inherited;
  if (qryEtapa.State = dsInsert) then
  begin
    qryEtapa.FieldByName('NumProcTrab').Value := qry.FieldByName('NumProcTrab').Value;
  end;
  qryEtapa.FieldByName('Descricao').AsString := qryTipoEtapa.FieldByName('Descricao').AsString;

  // Deposito e Despesa entram no campo DESPESAPROC
  //qry.Edit;

  qry.FieldByName('DESPESAPROC').AsFloat :=
              qry.FieldByName('DESPESAPROC').AsFloat +
              qryEtapa.FieldByName('VALORREC').AsFloat - ValAntes;

  //qry.Post;

  if  (redHonor.Value  <> 0) and (redHonor.Visible) and
      (qry.FieldByName('IDADVOGRECDA').Value <> Null) then
  begin
      if  not  tblHonor.Active  then  tblHonor.Open;
      tblHonor.Insert;
      tblHonor.FieldByName('NUMPROCTRAB').Value := qry.FieldByName('NUMPROCTRAB').Value;
      tblHonor.FieldByName('DATAPAGTOHONOR').Value := Date;
      tblHonor.FieldByName('IDFORNSERV').Value :=  qry.FieldByName('IDADVOGRECDA').Value;
      tblHonor.FieldByName('VALORHONOR').AsFloat :=  redHonor.Value;
      tblHonor.Post;
  end;
  lblHonor.Visible := False;
  redHonor.Visible := False;
  redHonor.Value  := 0;

  if mskedHora.Text = '  :  ' then
     qryEtapa.FieldByName('DATAREALOCOR').Value := dtedDataReal.Date
  else
     qryEtapa.FieldByName('DATAREALOCOR').AsDateTime := dtedDataReal.Date +
                                                        StrToTime(mskedHora.Text);
end;

procedure TfrmConsultaProcesso.qryEtapaBeforeInsert(DataSet: TDataSet);
begin
  inherited;
  ProxSeq := ProxSeq + 1;
end;

procedure TfrmConsultaProcesso.bbtnCancelarClick(Sender: TObject);
begin
  inherited;
  qryNumSeq.Close;
  qryNumSeq.ParamByName('NumProc').AsString := qry.FieldByName('NUMPROCTRAB').AsString;
  qryNumSeq.Open;
  ProxSeq := qryNumSeq.FieldByName('ULTSEQ').AsInteger;
end;

procedure TfrmConsultaProcesso.bbtnCancelarDetClick(Sender: TObject);
begin
  if (ds2.Dataset.State = dsInsert) and (pgctrlDetalhe.ActivePage = tbsEtapas) then
    ProxSeq := ProxSeq - 1;
  inherited;
end;

procedure TfrmConsultaProcesso.qryEtapaAfterInsert(DataSet: TDataSet);
begin
  inherited;
  qryEtapa.FieldByName('NUMSEQ').Value := ProxSeq;
end;

procedure TfrmConsultaProcesso.bbtnVoltarDetClick(Sender: TObject);
begin
  if (ds2.Dataset.State = dsInsert) and (pgctrlDetalhe.ActivePage = tbsEtapas) then
    ProxSeq := ProxSeq - 1;
  inherited;
end;

end.
