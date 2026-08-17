unit fCadRegSolic;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs, fCadastroCS,
  cmseldlg, wwidlg, Db, Wwdatsrc, DBCtrls, MAHlpBtn, StdCtrls, Buttons, ComCtrls, ToolWin,
  ExtCtrls, wwdblook, DBTables, Mask, Wwtable, TB97, wwdbedit, TB97Ctls, TB97Tlbr, IvDictio,
  IvMulti, IvEMulti, CMProcuraSubTipo, Wwquery, wwdbdatetimepicker, CMDateTimePicker,
  CmEventosCadastro, wwDialog, ImgList, MontaSelect, TREdit;

type
  TfrmCadRegSolic = class(TfrmCadastroCS)
    GroupBox1: TGroupBox;
    GroupBox2: TGroupBox;
    GroupBox3: TGroupBox;
    GroupBox4: TGroupBox;
    GroupBox5: TGroupBox;
    dbedNumero: TDBEdit;
    Label2: TLabel;
    Label1: TLabel;
    dbedData: TCMDateTimePicker;
    Label3: TLabel;
    qryMotac: TwwQuery;
    dblcTipoEv: TwwDBLookupCombo;
    rgSituacao: TDBRadioGroup;
    dbmObser: TDBMemo;
    dbedDatEfet: TCMDateTimePicker;
    qryCargo: TwwQuery;
    dblcCargo: TwwDBLookupCombo;
    Label5: TLabel;
    Label8: TLabel;
    Label9: TLabel;
    dblcEstab: TwwDBLookupCombo;
    dblcLotacao: TwwDBLookupCombo;
    ds5: TwwDataSource;
    tblFuncio2: TwwTable;
    ds3: TwwDataSource;
    dbrgTipoSalar: TDBRadioGroup;
    dbedDatSalar: TDBEdit;
    ds9: TwwDataSource;
    tblCargo2: TwwTable;
    dbedCargoI: TDBEdit;
    dbedDatCargo: TDBEdit;
    ds8: TwwDataSource;
    dbedCargoR: TDBEdit;
    tblHstces: TwwTable;
    qryEstab: TwwQuery;
    qryCust: TwwQuery;
    dsLot: TwwDataSource;
    tblLotacao: TwwTable;
    dbedNomeCC: TwwDBEdit;
    CMProcuraReq: TCMProcuraSubTipo;
    CMProcuraInd: TCMProcuraSubTipo;
    Toolbar972: TToolbar97;
    ToolbarSep972: TToolbarSep97;
    sbtnConfigEtiqueta: TSpeedButton;
    sbtnDesfConfigCartaComunic: TSpeedButton;
    qryAux: TwwQuery;
    dbedSalAtual: TDBRealEdit;
    qryAux2: TwwQuery;
    rgAltSalario: TRadioGroup;
    gbxSalario: TGroupBox;
    Label4: TLabel;
    Label6: TLabel;
    dbedTipoSal: TDBRadioGroup;
    dbedSalario: TDBRealEdit;
    dbedPerc: TDBRealEdit;
    gbxStepsFaixa: TGroupBox;
    cmbSteps: TComboBox;
    qryFaixa: TwwQuery;
    qryParamRH: TwwQuery;
    qryCargo2: TwwQuery;
    procedure FormCreate(Sender: TObject);
    procedure bbtnConfirmarClick(Sender: TObject);
    procedure ImplementaSolicitacao;
    procedure rgSituacaoClick(Sender: TObject);
    procedure sbtnAlterarClick(Sender: TObject);
    procedure CMProcuraIndExit(Sender: TObject);
    procedure tblFuncio2AfterScroll(DataSet: TDataSet);
    procedure sbtnConfigEtiquetaClick(Sender: TObject);
    procedure sbtnDesfConfigCartaComunicClick(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure CmeCadastroFind(Sender: TObject);
    procedure qryAfterInsert(DataSet: TDataSet);
    procedure qryBeforeInsert(DataSet: TDataSet);
    procedure CmeCadastroConfirma(Sender: TObject);
    procedure dbedSalarioChange(Sender: TObject);
    procedure dbedPercChange(Sender: TObject);
    procedure dblcCargoCloseUp(Sender: TObject; LookupTable,
      FillTable: TDataSet; modified: Boolean);
    procedure rgAltSalarioClick(Sender: TObject);
    procedure cmbStepsChange(Sender: TObject);
  private
    Ano, Mes, Dia, Ano1, Mes1, Dia1: word;
    UltNum: double;
    iIdTipoProcesso: LongInt;
    sSql: string;
    IndPolitica: integer;
  end;

var
  frmCadRegSolic: TfrmCadRegSolic;

implementation

uses uMensErro, uRAD, uDataBase, uSistema, uIntegraPrevRH, fTelaAut, uImprimeRelatorio,
  uFuncoesUteisRH, UsoGeralRH, fParamCartaComun, dRelatorioCartaComun, dBaseDados, fPrincipal;

{$R *.DFM}

procedure TfrmCadRegSolic.FormCreate(Sender: TObject);
begin
  inherited;
  if (Sistema.IdModulo = 417) then
    HelpContext := 4170014;

  if (sUsoGeralIdPessoa <> '') then
  begin
    MsgDlg('Tela de Uso Restrito a Usuários RH e Gestores.', 'Aviso', mtInformation,
    [mbOk,mbHelp], 0);
    Close;
    exit;
  end;

  ImprimeRelatorio := TImprimeRelatorio.Create;
  // Registro o Form de visualização das Etiquetas e Carrego a configuração destas
  with (dtmRelatorioCartaComun) do
  begin
    ImprimeRelatorio.Iniciar(dsgnCartaComun, rpCartaComun, ppCartaComun,
      qryCartaComun, GetLayoutPadrao, 'Cartas ou Comunicados',
      'rpCartaComun', 'CartaComun.tmp', 74);
  end;

  if (sUsuXccusto <> '') then
  begin
    CMProcuraInd.MontaSelect.Filtro.Add('FUNCIONARIO.CODCENTROCUSTO IN ' + sUsuXccusto);
    MontaSelect.Filtro.Add('S.CODCENTROCUSTO IN ' + sUsuXccusto);
  end;

  if (sUsuXfilial <> '') then
  begin
    CMProcuraInd.MontaSelect.Filtro.Add('FUNCIONARIO.IDESTAB IN ' + sUsuXfilial);
    MontaSelect.Filtro.Add('S.IDESTAB IN ' + sUsuXfilial + ')');
  end;

  if (sUsuXccusto <> '') or (sUsuXfilial <> '') then
  begin
    CMProcuraReq.MontaSelect.Filtro.Add('FUNCIONARIO.IDPESSOA = ' + IntToStr(Sistema.IdUsuario));
    MontaSelect.Filtro.Add('S.IDREQUISITANTE = ' + IntToStr(Sistema.IdUsuario));
  end;

  iIdTipoProcesso := -1;
  if (Sistema.UsaRAD) then
  begin
    Rad := TRad.Create;
     If Fazquery(DtmBaseDados.qry,
          'SELECT TP.IDTIPOPROCESSO'+#13+
          'FROM RADTIPOPROCESSO TP, RADRESPONXGRP GR'+#13+
          'WHERE (TP.IDGRPCRIAPROCESSO = GR.IDGRPRESPON) AND'+#13+
          '      (GR.IDUSUARIO = ' +IntToStr(Sistema.IdUsuario)+ ') AND'+#13+
          '      (TP.IDREFERENCIA = 15)') Then
      iIdTipoProcesso := DtmBaseDados.qry.FieldByName('IDTIPOPROCESSO').asInteger;
  end;

  qry.Close;
  qry.ParamByName('IDSOLIC').asInteger := -1;
  qry.Open;

  qryParamRH.Open;
  tblFuncio2.Open;
  qryMotac.Open;
  qryCargo.Open;
  qryCargo2.Open;
  tblCargo2.Open;
  tblHstces.Open;
  qryCust.ParamByName('IdEmpresaProp').Value  := Sistema.IdEmpresa;
  qryEstab.ParamByName('IdEmpresaProp').Value := Sistema.IdEmpresa;
  qryCust.Open;
  qryEstab.Open;
  tblLotacao.Open;

  IndPolitica := qryParamRH.FieldByName('INDPOLITICA').asInteger;
  if IndPolitica = 1 then
  begin
    gbxStepsFaixa.Caption := 'Valor Hay';
    rgAltSalario.Items[3] := 'Hay';
  end;

end;

procedure TfrmCadRegSolic.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  inherited;
  ImprimeRelatorio.Free;
end;

procedure TfrmCadRegSolic.tblFuncio2AfterScroll(DataSet: TDataSet);
begin
  inherited;
  if (ds.Dataset.State = dsInsert) then
  begin
    ds.Dataset.FieldByName('IDESTAB').asFloat := ds5.Dataset.FieldByName('IDESTAB').asFloat;
    ds.Dataset.FieldByName('IDEMPRESA').asInteger := ds5.Dataset.FieldByName('IDEMPRESA').asInteger;
    ds.Dataset.FieldByName('CODCENTROCUSTO').asString:= ds5.Dataset.FieldByName('CODCENTROCUSTO').asString;
    ds.Dataset.FieldByName('IDCARGO').asFloat := ds5.Dataset.FieldByName('IDCARGO').asFloat;
    ds.Dataset.FieldByName('NOVO_SALARIO').asFloat := ds5.Dataset.FieldByName('SALARIOATUAL').asFloat;
    ds.Dataset.FieldByName('NOVO_TIPO_SAL').Value := ds5.Dataset.FieldByName('TIPOPAGAMENTO').Value;
    ds.Dataset.FieldByName('PERC_REAJ').asFloat := 0;
  end;
end;

procedure TfrmCadRegSolic.CMProcuraIndExit(Sender: TObject);
begin
  inherited;
{  if (ds.Dataset.State = dsInsert) then
  begin
    ds.Dataset.FieldByName('IDESTAB').Value        := ds5.Dataset.FieldByName('IDESTAB').Value;
    ds.Dataset.FieldByName('IDEMPRESA').Value      := ds5.Dataset.FieldByName('IDEMPRESA').Value;
    ds.Dataset.FieldByName('CODCENTROCUSTO').Value := ds5.Dataset.FieldByName('CODCENTROCUSTO').Value;
    ds.Dataset.FieldByName('IDCARGO').Value        := ds5.Dataset.FieldByName('IDCARGO').Value;
    ds.Dataset.FieldByName('NOVO_SALARIO').Value   := ds5.Dataset.FieldByName('SALARIOATUAL').Value;
    ds.Dataset.FieldByName('NOVO_TIPO_SAL').Value  := ds5.Dataset.FieldByName('TIPOPAGAMENTO').Value;
    ds.Dataset.FieldByName('PERC_REAJ').Value      := 0;
  end;}
end;

procedure TfrmCadRegSolic.sbtnAlterarClick(Sender: TObject);
begin
  if (qry.FieldByName('SITUACAO_SOLIC').Value = 1) then
  begin
    sbtnAlterar.Down := false;
    MsgDlg('Solicitação Já Efetivada.', 'Aviso', mtInformation, [mbOk, mbHelp], 0);
  end
  else
    inherited;
end;

procedure TfrmCadRegSolic.bbtnConfirmarClick(Sender: TObject);
var
  NumDias,NumMeses,NumAnos:integer;
begin
  if (Trim(dblcTipoEv.Text) = '') then
  begin
    MsgDlg('Informe o Tipo de Evento', 'Aviso', mtInformation, [mbOk, mbHelp], 0);
    dblcTipoEv.SetFocus;
    exit;
  end;

  if (frmPrincipal.iIDContraCheque = 3) then // PCS da Funcef
  begin
    CalculaDifData(tblFuncio2.FieldByName('DATACARGO').asString, dbedDatEfet.Text,
      NumDias, NumMeses, NumAnos);

    if (dbedCargoI.Text <> dblcCargo.Text) and (NumMeses < 12) then
    begin
      MsgDlg('Prazo Mínimo de 12 Meses no Cargo Não Respeitado.', 'Aviso',
        mtInformation, [mbOk,mbHelp], 0);
      exit;
    end;

    CalculaDifData(tblFuncio2.FieldByName('DATASALARIO').asString, dbedDatEfet.Text,
      NumDias, NumMeses, NumAnos);

    if (dbedCargoI.Text = dblcCargo.Text) and (NumMeses < 12) then
    begin
      MsgDlg('Prazo Mínimo de 12 Meses no Nível Não Respeitado.', 'Aviso',
        mtInformation, [mbOk,mbHelp], 0);
      exit;
    end;

    CalculaDifData(tblFuncio2.FieldByName('DATALOTACAO').asString, dbedDatEfet.Text,
      NumDias, NumMeses, NumAnos);

    if (dbedCargoI.Text = dblcCargo.Text) and (NumMeses < 6) then
    begin
      MsgDlg('Prazo Mínimo de 6 Meses na Área Não Respeitado.', 'Aviso',
        mtInformation, [mbOk,mbHelp], 0);
      exit;
    end;

    if (dbedCargoI.Text = dblcCargo.Text) and (dbedPerc.Value  > 13.49) then
    begin
      MsgDlg('Percentual Máximo de 13,49% Não Respeitado.', 'Aviso',
        mtInformation, [mbOk,mbHelp], 0);
      exit;
    end;
  end;
  inherited;
end;

procedure TfrmCadRegSolic.rgSituacaoClick(Sender: TObject);
var
  sFlgOk: string;
begin
  if (rgSituacao.ItemIndex = 1) then
  begin
    if (qry.FieldByName('IDPROCESSO').asInteger > 0) then
    begin
      sFlgOk := 'S';
      if Fazquery(DtmBaseDados.qry,'SELECT FLGOK FROM RADINSTPROCESSO WHERE IDPROCESSO = '+
        qry.FieldByName('IDPROCESSO').AsString) Then
        sFlgOk := DtmBaseDados.qry.FieldByName('FLGOK').asString;

      if (sFlgOk <> 'S') then
      begin
        MsgDlg('Processo não está concluído. Solicitação não pode ser efetivada.',
               'Informação', mtInformation, [mbOk,mbHelp], 0);
        rgSituacao.ItemIndex := 0;
        exit;
      end;
    end;

    if (MsgDlg('Confirma a Efetivação?', 'Confirmação', mtConfirmation,
        [mbYes, mbNo], 0) = mrYes) then
    begin
      qry.FieldByName('SITUACAO_SOLIC').asInteger := 1;
      ImplementaSolicitacao;
      bbtnConfirmarClick(rgSituacao);
    end
    else
      rgSituacao.ItemIndex := 0;
  end;
end;

procedure TfrmCadRegSolic.sbtnConfigEtiquetaClick(Sender: TObject);
begin
  ImprimeRelatorio.Configurar;
end;

procedure TfrmCadRegSolic.sbtnDesfConfigCartaComunicClick(Sender: TObject);
begin
  ImprimeRelatorio.RestaurarConfiguracao;
end;

procedure TfrmCadRegSolic.ImplementaSolicitacao;
var
  bImprimeCarta: boolean;
  sIDPessoal, sIDCarta, sSolicitSemCarta: string;

  sIdPessoa, sIdEmpresa: string;
  bFazIntegraPrevRH: boolean;
begin
  // Imprime Carta
  if (MsgDlg('Imprime a Carta Correspondente ?', LerMensagem(4), mtConfirmation,
      [mbYes, mbNo], 0) = mrYes) then
  begin
    bImprimeCarta := false;
    with TfrmParamCartaComun.Create(Self) do
    try
      Visible := false;
      TipoParam := 3;

      if (ShowModal = mrOk) then
      begin
        qryAux.Close;
        qryAux.ParamByName('ID_SOLIC_ALTER_FUNC').asInteger := qry.FieldByName('ID_SOLIC_ALTER_FUNC').asInteger;
        qryAux.Open;

        if (qryAux.IsEmpty) then
          sSolicitSemCarta := qry.FieldByName('ID_SOLIC_ALTER_FUNC').asString
        else
        begin
          sIdPessoal := qry.FieldByName('IDINDICADO').asString;
          sIdCarta := qryAux.FieldByName('NUMCARTA').asString;
        end;

        if (sSolicitSemCarta <> '') then
          MsgDlg('Não Há Carta para esta Solicitação.', 'Aviso',
            mtInformation, [mbOk, mbHelp], 0)
        else
        if (sIdPessoal <> '') then
        begin
          dtmRelatorioCartaComun.qryCartaComun.SQL[176] := '  (CARTA.NUMCARTA     = '+sIDCarta+') AND';
          dtmRelatorioCartaComun.qryCartaComun.SQL[177] := '  (P.IDPESSOA         = '+sIDPessoal+') AND';
          ImprimeRelatorio.QueryDados.Assign(dtmRelatorioCartaComun.qryCartaComun.SQL);
          bImprimeCarta := true;
        end;
      end;
    finally
      Free;
    end;

    if (Trim(sIDPessoal) <> '') and (bImprimeCarta) then
      ImprimeRelatorio.Imprimir([sIDPessoal, sIDCarta]);
  end;

  with (tblHstces) do
  begin
    //Cria Histórico
    Insert;
    FieldByName('IDPESSOA').Value       := qry.FieldByName('IDINDICADO').Value;
    FieldByName('DATAALTERFUNC').Value  := qry.FieldByName('DATA_EFETIV_ALTER').Value;
    FieldByName('IDESTAB').Value        := qry.FieldByName('IDESTAB').Value;
    FieldByName('IDEMPRESA').Value      := qry.FieldByName('IDEMPRESA').Value;
    FieldByName('CODCENTROCUSTO').Value := qry.FieldByName('CODCENTROCUSTO').Value;
    FieldByName('IDCARGO').Value        := qry.FieldByName('IDCARGO').Value;
    FieldByName('SALARIO').Value        := qry.FieldByName('NOVO_SALARIO').Value;
    FieldByName('IDMOTIVO').Value       := qry.FieldByName('IDMOTIVO').Value;
    FieldByName('PERC_REAJ').Value      := qry.FieldByName('PERC_REAJ').Value;
    FieldByName('TIPOPAGAMENTO').Value  := qry.FieldByName('NOVO_TIPO_SAL').Value;
    Post;

    //Atualiza Cadastro
    if (FieldByName('DATAALTERFUNC').Value >= tblFuncio2.FieldByName('DATASALARIO').Value) and
       (FieldByName('SALARIO').Value       <> tblFuncio2.FieldByName('SALARIOATUAL').Value) then
    begin
      tblFuncio2.Edit;
      tblFuncio2.FieldByName('DATASALARIO').Value   := FieldByName('DATAALTERFUNC').Value;
      tblFuncio2.FieldByName('SALARIOATUAL').Value  := FieldByName('SALARIO').Value;
      tblFuncio2.FieldByName('TIPOPAGAMENTO').Value := FieldByName('TIPOPAGAMENTO').Value;
    end;

    if (FieldByName('DATAALTERFUNC').Value >= tblFuncio2.FieldByName('DATACARGO').Value) and
       (FieldByName('IDCARGO').Value       <> tblFuncio2.FieldByName('IDCARGO').Value) then
    begin
      tblFuncio2.Edit;
      tblFuncio2.FieldByName('DATACARGO').Value := FieldByName('DATAALTERFUNC').Value;
      tblFuncio2.FieldByName('IDCARGO').Value   := FieldByName('IDCARGO').Value;
    end;

    if (FieldByName('DATAALTERFUNC').Value   >= tblFuncio2.FieldByName('DATALOTACAO').Value) and
       ((FieldByName('CODCENTROCUSTO').Value <> tblFuncio2.FieldByName('CODCENTROCUSTO').Value) or
        (FieldByName('IDESTAB').Value        <> tblFuncio2.FieldByName('IDESTAB').Value)) then
    begin
      tblFuncio2.Edit;
      tblFuncio2.FieldByName('DATALOTACAO').Value    := FieldByName('DATAALTERFUNC').Value;
      tblFuncio2.FieldByName('IDESTAB').Value        := FieldByName('IDESTAB').Value;
      tblFuncio2.FieldByName('IDEMPRESA').Value      := FieldByName('IDEMPRESA').Value;
      tblFuncio2.FieldByName('CODCENTROCUSTO').Value := FieldByName('CODCENTROCUSTO').Value;
    end;
  end;

  if (tblFuncio2.State = dsEdit) then
    tblFuncio2.Post;

  sIdPessoa  := tblFuncio2.FieldByName('IDPESSOA').asString;
  sIdEmpresa := tblFuncio2.FieldByName('IDEMPRESA').asString;
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

procedure TfrmCadRegSolic.CmeCadastroFind(Sender: TObject);
begin
  inherited;
  if (MontaSelect.RetornouValor)  then
  begin
    qry.Close;
    qry.ParamByName('IDSOLIC').asInteger := StrToInt(MontaSelect.ValoresChave[0]);
    qry.Open;
  end;
end;

procedure TfrmCadRegSolic.qryAfterInsert(DataSet: TDataSet);
begin
  inherited;
  qry.FieldByName('ID_SOLIC_ALTER_FUNC').Value := UltNum;
  qry.FieldByName('DATA_SOLIC_ALTER').asDateTime := Date;
  qry.FieldByName('DATA_EFETIV_ALTER').asDateTime := Date;
  qry.FieldByName('SITUACAO_SOLIC').Value := 0;
  qry.FieldByName('FLAG_PERC_SALAR').Value := 0;

  if (sUsuXccusto <> '') or (sUsuXfilial <> '') then
    qry.FieldByName('IDREQUISITANTE').asInteger := Sistema.IdUsuario;
end;

procedure TfrmCadRegSolic.qryBeforeInsert(DataSet: TDataSet);
begin
  inherited;
  qryAux2.Close;
  qryAux2.Open;
  Ano1:=0; UltNum:=0;

  if (qryAux2.FieldByName('ID_SOLIC_ALTER_FUNC').AsInteger > 0) then
  begin
    DecodeDate(qryAux2.FieldByName('DATA_SOLIC_ALTER').Value, Ano1, Mes1, Dia1);
    UltNum := qryAux2.FieldByName('ID_SOLIC_ALTER_FUNC').Value;
  end;

  UltNum := UltNum + 1;
  DecodeDate(Date, Ano, Mes, Dia);

  if (Ano <> Ano1) then
  begin
    //Ano := (Ano mod 100);
    UltNum := Ano * 10000 + 1;
  end;
end;

procedure TfrmCadRegSolic.CmeCadastroConfirma(Sender: TObject);
begin
  if (Sistema.UsaRAD) and (iIdTipoProcesso > 0) and
     (qry.FieldByName('IDPROCESSO').asInteger <= 0) then
  begin
    Rad.TipoProcesso    := iIdTipoProcesso;
    Rad.IdPessoa        := Sistema.IdEmpresa;
    Rad.IdPessResp      := trunc(qry.FieldByName('IDINDICADO').asFloat);
    //Rad.CodCentroRespon := dblcCentRespon.LookupValue;
    //Rad.UnidNegoc       := StrToInt(dblcAtiv.LookupValue);
    Rad.OBS             :=
      'Solicitação de: ' +dblcTipoEv.Text+CR_LF+
      'Indicado: ' +CMProcuraInd.Text+CR_LF+
      'Data da Alteração: ' +dbedDatEfet.Text+
      iff(dbedCargoI.Text = dblcCargo.Text,'',CR_LF+
      'Cargo Atual: '+dbedCargoI.Text+CR_LF+
      'Cargo Proposto: '+dblcCargo.Text);
    Rad.Valor           := dbedSalario.Value;

    with (dtmBaseDados.qry) do
    begin
      Close;
      SQL.Clear;
      SQL.Add('SELECT IDEMPRESA, CODCENTROCUSTO FROM FUNCIONARIO WHERE IDPESSOA = '+
        qry.FieldByName('IDINDICADO').asString);
      Open;

      if not(IsEmpty) then
      begin
        Rad.IdEmpresa := FieldByName('IDEMPRESA').asInteger;
        Rad.CodCentroCusto := FieldByName('CODCENTROCUSTO').asString;
      end;
      Close;
    end;

    //Rad.CodGrupoProd    := sGrupoProd;
    //qry.Edit;
    qry.FieldByName('IDPROCESSO').asInteger :=  Rad.IniciarProcesso;
    //qry.Post;

    if (qry.FieldByName('IDPROCESSO').asInteger < 0) then
    begin
      MsgDlg('Erro ao tentar instanciar o processo no RAD.', 'Erro', mtError, [mbOK], 0);
      Abort;
    end
    else
      MsgDlg('Processo RAD Nº '+qry.FieldByName('IDPROCESSO').AsString+' foi criado.', 'Aviso', mtWarning, [mbOk, mbHelp], 0);
  end
  else
  if (qry.FieldByName('IDPROCESSO').asInteger > 0) then
  begin
    sSQL :=
      'UPDATE RADINSTPROCESSO SET VLRPROC = ' +
      OraNumero(FloatToStr(dbedSalario.Value)) +
      ' WHERE IDPROCESSO = ' + qry.FieldByName('IDPROCESSO').AsString;

    dtmBaseDados.qry.Close;
    dtmBaseDados.qry.SQL.Clear;
    dtmBaseDados.qry.SQL.Add(sSQL);
    try
      if (sSQL <> '') then
        dtmBaseDados.qry.ExecSQL;
    except
      MsgDlg('Erro ao tentar atualizar o processo no RAD.', 'Erro', mtError, [mbOK], 0);
      Abort;
    end;
  end;
  inherited;
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

procedure TfrmCadRegSolic.dblcCargoCloseUp(Sender: TObject; LookupTable,
  FillTable: TDataSet; modified: Boolean);
begin
  if (Modified) then
  begin
    if (frmPrincipal.iIDContraCheque = 3) then // PCS da Funcef
      rgAltSalario.ItemIndex := 3;
    rgAltSalarioClick(Sender);
  end;
end;

procedure TfrmCadRegSolic.rgAltSalarioClick(Sender: TObject);
var
  c: integer;
begin
  inherited;
  cmbSteps.Text := '';
  dbedSalario.Enabled := (rgAltSalario.ItemIndex = 1);
  dbedPerc.Enabled := (rgAltSalario.ItemIndex = 2);
  gbxStepsFaixa.Visible := (rgAltSalario.ItemIndex = 3);

  if (rgAltSalario.ItemIndex = 3) then
  begin
    cmbSteps.Items.Clear;

    if IndPolitica = 0 then // Faixas Salariais do cargo
    begin

      qryFaixa.Close;
      qryFaixa.ParamByName('IdCargo').asInteger := qry.FieldByName('IdCargo').asInteger;
      qryFaixa.Open;

      if not(qryFaixa.IsEmpty) then
      begin
        for c:=1 to qryParamRH.FieldByName('NUMSTEPS').asInteger do
          cmbSteps.Items.Add(IntToStr(c) +'  =  '+
            FloatToStrF(qryFaixa.FieldByName('Step' +IntToStr(c)).asFloat, ffNumber, 14, 2));

        // PCS da Funcef
        if (frmPrincipal.iIDContraCheque = 3) and (TControl(Sender).Name = 'dblcCargo') then
          dbedSalario.Value := qryFaixa.FieldByName('Step1').asFloat;
      end
      else
      begin
        MsgDlg('Não Existe Faixa Salarial Associada.', 'Aviso', mtInformation, [mbOk, mbHelp], 0);
        rgAltSalario.SetFocus;
        exit;
      end;
    end
    else // Tabela Hay
      cmbSteps.Items.Add(FloatToStrF(ValorHay(qry.FieldByName('IdCargo').AsInteger), ffNumber, 14, 2));
  end;
end;

procedure TfrmCadRegSolic.cmbStepsChange(Sender: TObject);
begin
  dbedSalario.Value := StrToFloat(TiraCaracter(Copy(cmbSteps.Text,7,14), '.'));
end;

end.
