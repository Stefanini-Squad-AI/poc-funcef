unit fCadFerias;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  FCadMestreDetCS, IvDictio, IvMulti, IvEMulti, MontaSelect, DBTables, Db,
  Wwdatsrc, Wwquery, TB97Ctls, MAHlpBtn, TB97Tlbr, StdCtrls, Buttons, TB97,
  Grids, Wwdbigrd, Wwdbgrid, ComCtrls, TabControlDetalhe, ExtCtrls,
  Mask, DBCtrls, Wwtable, CMProcura, wwdbedit, Wwdbspin,
  Spin, wwdbdatetimepicker, CMDateTimePicker, CmEventosCadastro, ImgList;

type
  TfrmCadFerias = class(TfrmCadMestreDetalheCS)
    Label1: TLabel;
    Label10: TLabel;
    qryDet: TwwQuery;
    updDet: TUpdateSQL;
    Label4: TLabel;
    Label5: TLabel;
    Label3: TLabel;
    Label6: TLabel;
    dbedIniGozo: TCMDateTimePicker;
    dbedFimGozo: TCMDateTimePicker;
    dbedIniPeriodo: TCMDateTimePicker;
    dbrgProc: TDBRadioGroup;
    dbrgAbono: TDBRadioGroup;
    rgFaltas: TRadioGroup;
    dbspeParcFer: TwwDBSpinEdit;
    qryParamRH: TwwQuery;
    dbtxtSituacao: TDBText;
    qryDetIDPESSOA: TFloatField;
    qryDetINIPERIODOFERIAS: TDateTimeField;
    qryDetNUMSEQ: TFloatField;
    qryDetINIGOZOFERIAS: TDateTimeField;
    qryDetFIMGOZOFERIAS: TDateTimeField;
    qryDetFLGOCORRIDA: TFloatField;
    qryDetFLGABONO: TFloatField;
    qryDetQTDPARCDEVOL: TFloatField;
    qryDetFimPeriodoFerias: TDateField;
    qryRubFalta: TwwQuery;
    qryDiasFalta: TwwQuery;
    spedDias: TSpinEdit;
    dbedMat: TwwDBEdit;
    dbedNome: TwwDBEdit;
    dbspedDiasAbono: TwwDBSpinEdit;
    qryDetQTDIASABONO: TFloatField;
    qryDetQTDIASGOZO: TFloatField;
    procedure FormCreate(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure sbtnProcurarClick(Sender: TObject);
    procedure qryDetCalcFields(DataSet: TDataSet);
    procedure qryDetBeforeInsert(DataSet: TDataSet);
    procedure dbrgProcClick(Sender: TObject);
    procedure sbtnAltDetClick(Sender: TObject);
    procedure sbtnAlterarClick(Sender: TObject);
    procedure qryDetAfterInsert(DataSet: TDataSet);
    procedure dbedFimGozoExit(Sender: TObject);
    procedure spedDiasExit(Sender: TObject);
    procedure bbtnOkDetClick(Sender: TObject);
    Procedure CmeCadastroConfirma(Sender: TObject);
    Procedure CmeDetalheInsert(Sender: TObject);
    Procedure CmeCadastroFind(Sender: TObject);
    procedure dbrgAbonoChange(Sender: TObject);
  private
    ProxNum, NumDiasGozo, NumDiasGozo3: integer;
    UltData, DatIni: TDateTime;
    wModelo, Ano1, Mes1, Dia1, Ano2, Mes2, Dia2: word;

    procedure AtualizarDetalhe (IDPessoa: integer);
  end;

var
  frmCadFerias: TfrmCadFerias;

implementation

uses uMensErro, uDataBase, uSistema, uFuncoesUteis, uDiasUteis, UsoGeralRH, fPrincipal;

{$R *.DFM}

procedure TfrmCadFerias.AtualizarDetalhe (IDPessoa: integer);
begin
  qry.Close;
  qry.ParamByName('IDPESSOA').asInteger := IDPessoa;
  qry.Open;

  qryDet.Close;
  qryDet.ParamByName('IDPESSOA').asInteger := IDPessoa;
  qryDet.Open;

//  dbrgAbonoChange(Self);
end;

procedure TfrmCadFerias.FormCreate(Sender: TObject);
begin
  qryParamRH.Open;
  if (qryParamRH.FieldByName('FERIASINI').Value = Null) or
     (qryParamRH.FieldByName('FERIASFIM').Value = Null) then
    MsgDlg('Não Há Período Aberto para Cálculo de Férias! Verifique Oportunamente',
           'Aviso', mtInformation,[mbOk,mbHelp],0);
  qryParamRH.Close;

  inherited;
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

  qryRubFalta.Open;
  rgFaltas.Visible := not(qryRubFalta.IsEmpty);

  // PEGA O MODELO
  wModelo := frmPrincipal.iIDContraCheque;

  if (wModelo = 3) then // Testa Modelo FUNCEF
    dbspeParcFer.MaxValue := 5
  else
    dbspeParcFer.MaxValue := 20;

  qry.Close;
  qry.Prepare;
  qryDet.Close;
  qryDet.Prepare;

  sbtnProcurarClick(Sender);

  if (MontaSelect.ValoresChave.Count = 0) or (MontaSelect.ValoresChave[0] = '') then
    AtualizarDetalhe (-1);
end;

procedure TfrmCadFerias.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  qry.Close;
  qry.UnPrepare;
  qryDet.Close;
  qryDet.UnPrepare;
  qryRubFalta.Close;
  inherited;  
end;

procedure TfrmCadFerias.dbrgAbonoChange(Sender: TObject);
begin
  dbspedDiasAbono.Visible := (dbrgAbono.ItemIndex = 0);
  if (dbrgAbono.ItemIndex = 0) and (spedDias.Value > 0) and (dbspedDiasAbono.Value = 0) then
    dbspedDiasAbono.Value := spedDias.Value div 2;
end;

procedure TfrmCadFerias.sbtnProcurarClick(Sender: TObject);
begin
  inherited;
  // Para fazer a procura na criação do Formulário
end;

procedure TfrmCadFerias.CmeCadastroFind(Sender: TObject);
begin
  if (MontaSelect.ValoresChave.Count > 0) and (MontaSelect.ValoresChave[0] <> '') then
  begin
    AtualizarDetalhe (StrToInt(MontaSelect.ValoresChave[0]));

    if (qry.FieldByName('TIPOSIT').asString = 'D') then
      dbtxtSituacao.Font.Color := clRed
    else
    if (qry.FieldByName('TIPOSIT').asString = 'F') then
      dbtxtSituacao.Font.Color := clGreen
    else
    if (qry.FieldByName('TIPOSIT').asString = 'A') then
      dbtxtSituacao.Font.Color := clBlue;
  end;
end;

procedure TfrmCadFerias.dbedFimGozoExit(Sender: TObject);
begin
  if (Trim(dbedFimGozo.Text) <> '') and (Trim(dbedIniGozo.Text) <> '') then
  begin
    NumDiasGozo := DiasUteis.IntervaloDias(StrToDate(dbedIniGozo.Text),StrToDate(dbedFimGozo.Text))+1;
    if (wModelo = 3) then
    begin
      NumDiasGozo3 := NumDiasGozo + IFF(dbrgAbono.ItemIndex=1,0,Integer(Round(Int(NumDiasGozo/2))));
      if (NumDiasGozo3 < 10) then
      begin
        MsgDlg('Número de Dias de Gozo não pode ser menor que 10 !','Aviso', mtInformation,[mbOk,mbHelp],0);
        dbedFimGozo.SetFocus;
        exit;
      end
      else
      if (NumDiasGozo3 < 15) then
      begin
        qryDet.FieldByName('QTDPARCDEVOL').Value := 1;
        dbspeParcFer.Value   := 1;
        dbspeParcFer.Enabled := false;
        dbspeParcFer.Color   := clBtnFace;
      end
      else
      begin
        dbspeParcFer.Enabled := true;
        dbspeParcFer.Color   := clWhite;
      end;
    end;

    spedDias.Value := NumDiasGozo;
  end
  else
    spedDias.Value := 0;
end;

procedure TfrmCadFerias.spedDiasExit(Sender: TObject);
begin
  inherited;
  if (Trim(spedDias.Text) <> '') and (Trim(dbedIniGozo.Text) <> '') then
  begin
    if (wModelo = 3) then
    begin
      NumDiasGozo3 := spedDias.Value + IFF(dbrgAbono.ItemIndex=1,0,Integer(Round(Int(spedDias.Value/2))));
      if (NumDiasGozo3 < 10) then
      begin
        MsgDlg('Número de Dias de Gozo não pode ser menor que 10 !','Aviso', mtInformation,[mbOk,mbHelp],0);
        spedDias.SetFocus;
        exit;
      end
      else
      if (NumDiasGozo3 < 15) then
      begin
        qryDet.FieldByName('QTDPARCDEVOL').Value := 1;
        dbspeParcFer.Value   := 1;
        dbspeParcFer.Enabled := false;
        dbspeParcFer.Color   := clBtnFace;
      end
      else
      begin
        dbspeParcFer.Enabled := true;
        dbspeParcFer.Color   := clWhite;
      end;
    end;

    qryDet.FieldByName('FIMGOZOFERIAS').Value :=
      StrToDate(dbedIniGozo.Text) + StrToInt(spedDias.Text) - 1;
  end
  else
    spedDias.Value := 0;
end;

procedure TfrmCadFerias.sbtnAlterarClick(Sender: TObject);
begin
  if (qry.FieldByName('TIPOSIT').Value <> 'A') then
  begin
    if (MsgDlg('Situação Funcional Não Permite Gozo de Férias!'+CR_LF+
    'Confirma Alteração?', 'Aviso', mtInformation,[mbYes,mbNo],0) = mrNo) then
    begin
      sbtnAlterar.Down := false;
      exit;
    end
    else
      sbtnAlterar.Down := false;
  end;
      
  inherited;
end;

procedure TfrmCadFerias.sbtnAltDetClick(Sender: TObject);
begin
  if (dbrgProc.ItemIndex = 0) then
  begin
    MsgDlg('Férias Processadas! Alteração Não Permitida','Aviso', mtInformation,[mbOk,mbHelp],0);
    sbtnAltDet.Down := false;
    exit;
  end;
  inherited;
  dbedFimGozoExit(Sender);
end;

procedure TfrmCadFerias.dbrgProcClick(Sender: TObject);
begin
  if (qryDet.FieldByName('FIMGOZOFERIAS').asDateTime > Date) and
     (dbrgProc.ItemIndex = 0) then
  begin
    if (MsgDlg('Férias normalmente são processadas na Geração da Folha !'+CR_LF+
               'Confirma Alteração ?', 'Aviso', mtInformation,[mbYes,mbNo],0) = mrNo) then
    dbrgProc.ItemIndex := 1;
  end;
  inherited;
end;

procedure TfrmCadFerias.bbtnOkDetClick(Sender: TObject);
var
  AnoMes1, AnoMes2: string;
begin
  with (qryDet) do
  begin
    if (wModelo = 3) and (NumDiasGozo3 > 14) and (dbspeParcFer.Value = 1) then
      MsgDlg('Serão pagos apenas 70% do adiantamento de férias.', 'Aviso',
        mtInformation, [mbOk,mbHelp], 0);

    if (FieldByName('INIGOZOFERIAS').IsNull) then
    begin
      MsgDlg('Informe a Data de Início de Gozo das Férias.', 'Aviso',
        mtInformation, [mbOk,mbHelp], 0);
      dbedIniGozo.SetFocus;
      exit;
    end;

    if (FieldByName('FIMGOZOFERIAS').IsNull) then
    begin
      MsgDlg('Informe a Data Final de Gozo das Férias.', 'Aviso',
        mtInformation, [mbOk,mbHelp], 0);
      dbedFimGozo.SetFocus;
      exit;
    end;

    if (FieldByName('INIPERIODOFERIAS').IsNull) then
    begin
      MsgDlg('Informe a Data de Início do Período Aquisitivo das Férias.', 'Aviso',
        mtInformation, [mbOk,mbHelp], 0);
      dbedIniPeriodo.SetFocus;
      exit;
    end;

    if (FieldByName('INIGOZOFERIAS').Value    > FieldByName('FIMGOZOFERIAS').Value) or
       (FieldByName('INIPERIODOFERIAS').Value > FieldByName('INIGOZOFERIAS').Value) then
    begin
      MsgDlg('Incompatibilidade Entre as Datas para Férias'+CR_LF+'Verifique.', 'Aviso',
        mtInformation, [mbOk,mbHelp], 0);
      dbedIniPeriodo.SetFocus;
      exit;
    end;

    if ((FieldByName('INIPERIODOFERIAS').Value + 365) > FieldByName('INIGOZOFERIAS').Value) then
      if (MsgDlg('Gozo das Férias Dentro do Período Aquisitivo.'+CR_LF+'Confirma?',
          LerMensagem(4), mtConfirmation, [mbYes, mbNo], 0) <> mrYes) then
        exit;

    if ((StrToDate(IncData(FieldByName('INIPERIODOFERIAS').asString,0,0,2))-spedDias.Value) <
        FieldByName('INIGOZOFERIAS').Value) then
      if (MsgDlg('Gozo das Férias além do Período Permitido.'+CR_LF+'Confirma?',
          LerMensagem(4), mtConfirmation, [mbYes, mbNo], 0) <> mrYes) then
        exit;

    FieldByName('QTDIASGOZO').asInteger := spedDias.Value;
  end;

  inherited;

  // Calcula Faltas
  if (rgFaltas.Visible) and (rgFaltas.ItemIndex < 2) then
  begin
    qryDiasFalta.Close;

    with (qryDiasFalta.SQL) do
    begin
      if (rgFaltas.ItemIndex = 0) then
      begin
        AnoMes1 := QuotedStr(RetornaAnoMes(StrToDate(dbedIniPeriodo.Text)));
        AnoMes2 := QuotedStr(RetornaAnoMes(StrToDate(IncData(dbedIniPeriodo.Text,0,11,0))));
      end
      else
      begin
        AnoMes2 := QuotedStr(RetornaAnoMes(StrToDate(dbedIniGozo.Text)));
        AnoMes1 := QuotedStr(RetornaAnoMes(StrToDate(IncData(dbedIniGozo.Text,0,-11,0))));
      end;
      Clear;
      Add ('SELECT SUM(H.VALORPROVENTO) AS TOTALFALTA FROM HISTRUBSAL H');
      Add ('WHERE (H.IDRUBRICA = ' +qryRubFalta.FieldByName('IDPROVENTO').asString+ ') AND');
      Add ('      (H.IDPESSOA  = ' +MontaSelect.ValoresChave[0]+ ') AND');
      Add ('      (H.MES      >= ' +AnoMes1+ ') AND');
      Add ('      (H.MES      <= ' +AnoMes2+ ')');

      qryDiasFalta.Open;
      if (qryDiasFalta.IsEmpty) or (qryDiasFalta.FieldByName('TOTALFALTA').asInteger = 0) then
        MsgDlg('Não Há Dias de Falta no Período','Aviso', mtInformation,[mbOk,mbHelp],0)
      else
        MsgDlg('Há ' +qryDiasFalta.FieldByName('TOTALFALTA').asString+
               ' Dia(s) de Falta no Período. Revise o Período de Gozo se Necessário',
               'Aviso', mtInformation,[mbOk,mbHelp],0);
    end;
  end;

end;

procedure TfrmCadFerias.qryDetCalcFields(DataSet: TDataSet);
begin
  inherited;
  try
    // Calcula o fim do período aquisitivo
    qryDet.FieldByName('FimPeriodoFerias').asString :=
      DateToStr(qryDet.FieldByName('INIPERIODOFERIAS').asDateTime + 365);

    DecodeDate(qryDet.FieldByName('INIPERIODOFERIAS').asDateTime, Ano1, Mes1, Dia1);
    DecodeDate(qryDet.FieldByName('FimPeriodoFerias').asDateTime, Ano2, Mes2, Dia2);

    if (Dia2 = Dia1) then
      qryDet.FieldByName('FimPeriodoFerias').asDateTime :=
        qryDet.FieldByName('FimPeriodoFerias').asDateTime - 1;
  except
  end;
end;

procedure TfrmCadFerias.qryDetBeforeInsert(DataSet: TDataSet);
var
  iUltNum: integer;
  dtUltData: TDateTime;
begin
  inherited;
  qryDet.First;
  iUltNum   := qryDet.FieldByName('NUMSEQ').asInteger;
  dtUltData := qryDet.FieldByName('INIPERIODOFERIAS').asDateTime;
  qryDet.Next;
  while not(qryDet.EOF) do
  begin
    if (iUltNum < qryDet.FieldByName('NUMSEQ').asInteger) then
      iUltNum := qryDet.FieldByName('NUMSEQ').asInteger;

    if (dtUltData < qryDet.FieldByName('INIPERIODOFERIAS').asDateTime) then
      dtUltData := qryDet.FieldByName('INIPERIODOFERIAS').asDateTime;
    qryDet.Next;
  end;
  qryDet.Last;

  ProxNum := iUltNum + 1;
  UltData := dtUltData;
  DatIni  := qry.FieldByName('DATAADMISSAO').Value;
  if not(qryDet.IsEmpty) then
  begin
    DatIni := UltData + 365;

    DecodeDate(UltData, Ano1, Mes1, Dia1);
    DecodeDate(DatIni, Ano2, Mes2, Dia2);

    if (Dia2 <> Dia1) then
      DatIni := DatIni+1;
  end;
end;

procedure TfrmCadFerias.qryDetAfterInsert(DataSet: TDataSet);
begin
  inherited;
  spedDias.Value := 0;  
  qryDet.FieldByName('IDPESSOA').asInteger := qry.FieldByName('IDPESSOA').asInteger;
  qryDet.FieldByName('NUMSEQ').asInteger   := ProxNum;
  if (wModelo = 3) then // Testa Modelo FUNCEF
  begin
    qryDet.FieldByName('QTDPARCDEVOL').asInteger := 5;
    dbspeParcFer.Value := 5;
  end;
  if (wModelo < 3) then // Testa Modelo REFER/SERPROS
  begin
    qryDet.FieldByName('QTDPARCDEVOL').asInteger := 6;
    dbspeParcFer.Value := 6;
  end;
  if (wModelo > 3) then // Testa Modelo OUTROS
  begin
    qryDet.FieldByName('QTDPARCDEVOL').asInteger := 1;
    dbspeParcFer.Value := 1;
  end;
end;

procedure TfrmCadFerias.CmeDetalheInsert(Sender: TObject);
begin
  inherited;
  qryDet.FieldByName('INIPERIODOFERIAS').Value := DatIni;
  qryDet.FieldByName('FLGOCORRIDA').asInteger  := 0;
  qryDet.FieldByName('FLGABONO').asInteger     := 0;
  //qryDet.FieldByName('QTDPARCDEVOL').asInteger := 1;
end;

procedure TfrmCadFerias.CmeCadastroConfirma(Sender: TObject);
begin
  try
    AplicaAlteracoes([qryDet]);
  except
    raise;
  end;
end;

end.
