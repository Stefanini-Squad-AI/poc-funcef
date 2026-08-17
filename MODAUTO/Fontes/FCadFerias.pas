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
    rgAdto13: TRadioGroup;
    qryDetIDPROCESSO: TFloatField;
    qryAntec13: TwwQuery;
    updAntec13: TUpdateSQL;
    sbtnAvisoFerias: TSpeedButton;
    dbedFimPeriodo: TCMDateTimePicker;
    qryDetQTDIASGOZO: TFloatField;
    sbtnEtiquetaFerias: TSpeedButton;
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
    procedure CmeDetalheConfirma(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure sbtnAvisoFeriasClick(Sender: TObject);
    procedure CmeCadastroCancel(Sender: TObject);
    procedure dbedIniGozoExit(Sender: TObject);
    procedure sbtnEtiquetaFeriasClick(Sender: TObject);
  private
    ProxNum, NumDiasGozo, NumDiasGozo3, DiasSaldoFerias, DiasFeriasAgora, LimDias: integer;
    UltData, DatIni, dUltIniPer, dUltIniGozo : TDate;
    wModelo, Ano1, Mes1, Dia1, Ano2, Mes2, Dia2: word;

    procedure AtualizarDetalhe (IDPessoa: integer);
    function GetLayoutPadrao: TStringList;
  public
    { Public declarations }
  end;

var
  frmCadFerias: TfrmCadFerias;
  iIdTipoProcesso : LongInt;
  sCadFerRegPessoa : String;

implementation

uses uMensErro, uDataBase, DBaseDados, uSistema, uFuncoesUteisRH, uDiasUteis, UsoGeralRH, fPrincipal, uRAD,
  fParamAvisoFerias, dRelatoriosModAuto, uImprimeRelatorio, fAguarde,
  REtiquetaFerias;

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

  if (sUsoGeralIdPessoa <> '') then
  begin
    MontaSelect.Filtro.Add('FUNCIONARIO.IDPESSOA = ' +sUsoGeralIdPessoa);
    dbedIniPeriodo.TabStop  := False;
    dbedIniPeriodo.ReadOnly := True;
  end;

  if (sCadFerRegPessoa <> '') then
    MontaSelect.Filtro.Add('FUNCIONARIO.IDPESSOA = ' +sUsoGeralIdPessoa);

  with (MontaSelect.Filtro) do
  begin
    Add ('EMPRESAPROP.IDPESSOA = FUNCIONARIO.IDEMPRESA');
    Add ('CARGO.IDCARGO        = FUNCIONARIO.IDCARGO');
    Add ('FUNCIONARIO.IDPESSOA = PESSOA.IDPESSOA');
  end;

  //qryRubFalta.Open;
  //rgFaltas.Visible := not(qryRubFalta.IsEmpty);

  iIdTipoProcesso := -1;
  If Sistema.UsaRAD Then
  Begin
     Rad := TRad.Create;
     If Fazquery(DtmBaseDados.qry,
          'SELECT TP.IDTIPOPROCESSO'+#13+
          'FROM RADTIPOPROCESSO TP, RADRESPONXGRP GR'+#13+
          'WHERE (TP.IDGRPCRIAPROCESSO = GR.IDGRPRESPON) AND'+#13+
          '      (GR.IDUSUARIO = ' +IntToStr(Sistema.IdUsuario)+ ') AND'+#13+
          '      (TP.IDREFERENCIA = 16)') Then
        iIdTipoProcesso := DtmBaseDados.qry.FieldByName('IDTIPOPROCESSO').asInteger;

  End;

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

  if (sCadFerRegPessoa = '') then
  begin
     sbtnProcurarClick(Sender);
     if (MontaSelect.ValoresChave.Count = 0) or (MontaSelect.ValoresChave[0] = '') then
        AtualizarDetalhe (-1);
  end
  else
     AtualizarDetalhe(StrToInt(sCadFerRegPessoa));

  CmeDetalhe.RepetirInsert := (sCadFerRegPessoa = '');

end;

procedure TfrmCadFerias.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  qry.Close;
  qry.UnPrepare;
  qryDet.Close;
  qryDet.UnPrepare;
  qryRubFalta.Close;
  sCadFerRegPessoa := '';
  inherited;
end;

procedure TfrmCadFerias.dbrgAbonoChange(Sender: TObject);
begin
  dbspedDiasAbono.Visible := (dbrgAbono.ItemIndex = 0);
  if (dbrgAbono.ItemIndex = 0) and (spedDias.Value > 0) and (dbspedDiasAbono.Value = 0) then
    dbspedDiasAbono.Value := spedDias.Value div 2;

  if (dbrgAbono.ItemIndex = 1) then
     dbspedDiasAbono.Value := 0;
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
  inherited;
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
    if (MsgDlg('Situação Funcional Não Permite Gozo de Férias !'+CR_LF+
    'Confirma Alteração ?', 'Aviso', mtInformation,[mbYes,mbNo],0) = mrNo) then
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
  iDia,iMes,iIdade: Integer;
begin
  with (qryDet) do
  begin
    if (FieldByName('INIGOZOFERIAS').IsNull) then
    begin
      MsgDlg('Informe a Data de Início de Gozo das Férias',
             'Aviso', mtInformation,[mbOk,mbHelp],0);
      dbedIniGozo.SetFocus;
      exit;
    end;

    if (FieldByName('FIMGOZOFERIAS').IsNull) then
    begin
      MsgDlg('Informe a Data Final de Gozo das Férias',
             'Aviso', mtInformation,[mbOk,mbHelp],0);
      dbedFimGozo.SetFocus;
      exit;
    end;

    if (FieldByName('INIPERIODOFERIAS').IsNull) then
    begin
      MsgDlg('Informe a Data de Início do Período Aquisitivo das Férias',
             'Aviso', mtInformation,[mbOk,mbHelp],0);
      dbedIniPeriodo.SetFocus;
      exit;
    end;

    if (FieldByName('INIGOZOFERIAS').Value    > FieldByName('FIMGOZOFERIAS').Value) or
       (FieldByName('INIPERIODOFERIAS').Value > FieldByName('INIGOZOFERIAS').Value) then
    begin
      MsgDlg('Incompatibilidade Entre as Datas para Férias. Verifique !',
             'Aviso', mtInformation,[mbOk,mbHelp],0);
      dbedIniPeriodo.SetFocus;
      exit;
    end;

    LimDias := iff(DiasSaldoFerias > 0, DiasSaldoFerias, 30);
    if (spedDias.Value + dbspedDiasAbono.Value > LimDias) then
    begin
      MsgDlg('Dias de Gozo das Férias mais Dias de Abono Não Pode Exceder a ' +
              IntToStr(LimDias) + ' !',
             'Aviso', mtInformation,[mbOk,mbHelp],0);
      spedDias.SetFocus;
      exit;
    end;

    if (DiasSaldoFerias > 0) and (spedDias.Value + dbspedDiasAbono.Value < LimDias) then
    begin
      MsgDlg('Dias de Gozo das Férias mais Dias de Abono Deve Ser Igual a ' +
              IntToStr(LimDias) + ' !',
             'Aviso', mtInformation,[mbOk,mbHelp],0);
      spedDias.SetFocus;
      exit;
    end;

    if (spedDias.Value + dbspedDiasAbono.Value < 10) then
    begin
      MsgDlg('Dias de Gozo das Férias mais Dias de Abono Não Pode Ser Inferior a 10 !',
             'Aviso', mtInformation,[mbOk,mbHelp],0);
      spedDias.SetFocus;
      exit;
    end;

    if (wModelo = 3) and (spedDias.Value + dbspedDiasAbono.Value < 30) then
      If Fazquery(DtmBaseDados.qry,'SELECT DATANASC FROM PESSOAFISICA ' +
                                  'WHERE (IDPESSOA = '+
                                  qry.FieldByName('IdPessoa').AsString + ')') Then
        if CalculaData(DtmBaseDados.qry.FieldByName('DATANASC').asString,
                              dbedIniGozo.Text,iDia,iMes,iIdade)  then
           if iIdade >= 50 then
           begin
              if (sUsuXfilial = '') and (sUsuXccusto = '') and (sUsoGeralIdPessoa = '') then
              begin
                 if (MsgDlg('Idade Não Permite Parcelamento do Gozo de Férias !'+CR_LF+
                 'Confirma Assim Mesmo ?', 'Aviso', mtInformation,[mbYes,mbNo],0) = mrNo) then
                   exit;
              end
              else begin
                 MsgDlg('Idade Não Permite Parcelamento do Gozo de Férias !','Aviso',
                        mtInformation,[mbOk,mbHelp],0);
                 dbedFimGozo.SetFocus;
                 exit;
              end;
           end;


      If (wModelo = 3) and (qryDet.State = dsInsert) and
         (Fazquery(DtmBaseDados.qry,'SELECT INIPERIODOFERIAS,INIGOZOFERIAS FROM FERIAS ' +
                                    'WHERE (IDPESSOA = '+
                                    qry.FieldByName('IdPessoa').AsString +
                                    ') ORDER BY INIGOZOFERIAS DESC')) Then
        if (iff(dUltIniPer > DtmBaseDados.qry.FieldByName('INIPERIODOFERIAS').asDateTime,
             DateToStr(dUltIniPer),DtmBaseDados.qry.FieldByName('INIPERIODOFERIAS').asString) =
             dbedIniPeriodo.Text) and
           (CalculaData(iff(dUltIniPer > DtmBaseDados.qry.FieldByName('INIPERIODOFERIAS').asDateTime,
             DateToStr(dUltIniGozo),DtmBaseDados.qry.FieldByName('INIGOZOFERIAS').asString),
                              dbedIniGozo.Text,iDia,iMes,iIdade))  then
           if iDia < 60 then
           begin
              if (sUsuXfilial = '') and (sUsuXccusto = '') and (sUsoGeralIdPessoa = '') then
              begin
                 if (MsgDlg('Parcelamento do Gozo de Férias em 2 períodos '+CR_LF+
                 'deve ter intervalo mínimo de 60 dias !' +CR_LF+
                 'Confirma Assim Mesmo ?', 'Aviso', mtInformation,[mbYes,mbNo],0) = mrNo) then
                   exit;
              end
              else begin
                 MsgDlg('Parcelamento do Gozo de Férias em 2 períodos '+CR_LF+
                        'deve ter intervalo mínimo de 60 dias !','Aviso',
                         mtInformation,[mbOk,mbHelp],0);
                 exit;
              end;
           end;



    if (wModelo = 3) and (NumDiasGozo3 > 14) and (dbspeParcFer.Value = 1) then
      MsgDlg('Serão pagos apenas 70% do adiantamento de férias !','Aviso', mtInformation,[mbOk,mbHelp],0);

    if (wModelo = 3) and (rgAdto13.ItemIndex = 0) and
       (copy(dbedIniGozo.Text,4,2) <> '01') then
    begin
      MsgDlg('Solicitação de Adto 13º Salário Somente para Férias em Janeiro !','Aviso', mtInformation,[mbOk,mbHelp],0);
      exit;
    end;

    if ((FieldByName('INIPERIODOFERIAS').Value + 365) > FieldByName('INIGOZOFERIAS').Value) then
      if (sUsoGeralIdPessoa = '') then
      begin
        if (MsgDlg('Gozo das Férias Dentro do Período Aquisitivo. Confirma ?', LerMensagem(4),
          mtConfirmation,[mbYes, mbNo], 0) <> mrYes) then
        exit;
      end
      else begin
         MsgDlg('Gozo das Férias Dentro do Período Aquisitivo Não é Permitido !','Aviso',
                mtInformation,[mbOk,mbHelp],0);
         exit;
      end;

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

  if (rgAdto13.ItemIndex = 0) then
  begin
     qryAntec13.Close;
     qryAntec13.ParamByName('IdPessoa').AsString := qry.FieldByName('IdPessoa').AsString;
     qryAntec13.ParamByName('Ano').AsString := copy(dbedIniGozo.Text,7,4);
     qryAntec13.Open;
     if (qryAntec13.IsEmpty) or (qryAntec13.FieldByName('FlgOcorrida').AsInteger = 0) then
     begin
       if qryAntec13.IsEmpty then
          qryAntec13.Insert
       else
          qryAntec13.Edit;
       qryAntec13.FieldByName('IdPessoa').AsString := qry.FieldByName('IdPessoa').AsString;
       qryAntec13.FieldByName('Ano').AsString := copy(dbedIniGozo.Text,7,4);
       qryAntec13.FieldByName('Mes').AsString := copy(dbedIniGozo.Text,4,2);
       qryAntec13.FieldByName('FlgOcorrida').AsInteger := 0;
       qryAntec13.Post;
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
    // Rotina para verificar dias pendentes de férias
    dtmBaseDados.qry.Close;
    dtmBaseDados.qry.SQL.Clear;
    dtmBaseDados.qry.SQL.Add(
      'SELECT '+
      '  MOD(SUM(FIMGOZOFERIAS - INIGOZOFERIAS + 1 + '+
      '  DECODE(FLGABONO,0,0,DECODE(NVL(QTDIASABONO,0),0,trunc((FIMGOZOFERIAS - INIGOZOFERIAS + 1)/2), QTDIASABONO))),30) '+
      '  AS DIASACUMFERIAS '+
      '  FROM  FERIAS      '+
      'WHERE '+
      '  (FERIAS.IDPESSOA    = ' + qry.FieldByName('IDPESSOA').asString + ')');

    dtmBaseDados.qry.Open;

    DiasSaldoFerias := dtmBaseDados.qry.FieldByName('DIASACUMFERIAS').asInteger + DiasFeriasAgora;
    if (DiasSaldoFerias > 0) then
      DiasSaldoFerias := 30 - DiasSaldoFerias;

    DatIni := UltData + iff(DiasSaldoFerias = 0, 365, 0);

    DecodeDate(UltData, Ano1, Mes1, Dia1);
    DecodeDate(DatIni, Ano2, Mes2, Dia2);

    if (Dia2 <> Dia1) then
      DatIni := DatIni+1;
  end;
end;

procedure TfrmCadFerias.qryDetAfterInsert(DataSet: TDataSet);
begin
  inherited;
  //spedDias.Value := 0;
  spedDias.Value  := DiasSaldoFerias;

  qryDet.FieldByName('IDPESSOA').asInteger := qry.FieldByName('IDPESSOA').asInteger;
  qryDet.FieldByName('NUMSEQ').asInteger   := ProxNum;
  if (wModelo = 3) then // Testa Modelo FUNCEF
  begin
    qryDet.FieldByName('QTDPARCDEVOL').asInteger := 10;
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
var
  sRadOBS, sSql: String;
begin
  If ( Sistema.UsaRAD ) And (iIdTipoProcesso > 0) then
  Begin
    qryDet.First;
    while not qryDet.Eof do
    Begin
      if (qryDet.FieldByName('FLGOCORRIDA').AsInteger = 0) Then
      Begin
        if (qryDet.FieldByName('IDPROCESSO').AsInteger <= 0) Then
        Begin
           Rad.TipoProcesso    := iIdTipoProcesso;
           Rad.IdPessoa        := Sistema.IdEmpresa;
           Rad.IdPessResp      := trunc(qry.FieldByName('IDPESSOA').asFloat);
           //Rad.CodCentroRespon := dblcCentRespon.LookupValue;
           //Rad.UnidNegoc       := StrToInt(dblcAtiv.LookupValue);
           Rad.OBS             := 'Férias de: '+trim(dbedNome.Text)+CR_LF+
                                  'Período Aquisitivo: '+qryDet.FieldByName('INIPERIODOFERIAS').AsString+
                                  ' a '+qryDet.FieldByName('FimPeriodoFerias').AsString+CR_LF+
                                  'Período de Gozo: '+qryDet.FieldByName('INIGOZOFERIAS').AsString+
                                  ' a '+qryDet.FieldByName('FIMGOZOFERIAS').AsString+CR_LF+
                                  'Dias de Gozo: '+IntToStr(qryDet.FieldByName('FIMGOZOFERIAS').Value -
                                                    qryDet.FieldByName('INIGOZOFERIAS').Value + 1)+CR_LF+
                                  'Dias de Abono Pecuniário: '+qryDet.FieldByName('QTDIASABONO').AsString+CR_LF+
                                  'Parcelas Dev. Adto Férias: '+qryDet.FieldByName('QTDPARCDEVOL').AsString;
           with (DtmBaseDados.qry) do
           begin
              Close;
              SQL.Clear;
              SQL.Add('SELECT IDEMPRESA, CODCENTROCUSTO FROM FUNCIONARIO WHERE IDPESSOA = '+
                       qry.FieldByName('IDPESSOA').asString);
              Open;
              if not IsEmpty then
              begin
                 Rad.IdEmpresa       := FieldByName('IDEMPRESA').AsInteger;
                 Rad.CodCentroCusto  := FieldByName('CODCENTROCUSTO').AsString;
              end;
              Close;
           end;
           qryDet.Edit;
           qryDet.FieldByName('IDPROCESSO').AsInteger :=  Rad.IniciarProcesso;
           qryDet.Post;
           if qryDet.FieldByName('IDPROCESSO').AsInteger < 0 Then
           Begin
              MsgDlg('Erro ao tentar instanciar o processo no R.A.D.','Erro',mtError,[mbOK],0);
              Abort;
           End
           Else
              MsgDlg('Processo RAD Nº '+qryDet.FieldByName('IDPROCESSO').AsString+' foi criado.', 'Aviso', mtWarning, [mbOk, mbHelp], 0);
        End
        else
        Begin
          sRadOBS :=  'Férias de: '+trim(dbedNome.Text)+CR_LF+
                      'Período Aquisitivo: '+qryDet.FieldByName('INIPERIODOFERIAS').AsString+
                      ' a '+qryDet.FieldByName('FimPeriodoFerias').AsString+CR_LF+
                      'Período de Gozo: '+qryDet.FieldByName('INIGOZOFERIAS').AsString+
                      ' a '+qryDet.FieldByName('FIMGOZOFERIAS').AsString+CR_LF+
                      'Dias de Gozo: '+IntToStr(qryDet.FieldByName('FIMGOZOFERIAS').Value -
                                        qryDet.FieldByName('INIGOZOFERIAS').Value + 1)+CR_LF+
                      'Dias de Abono Pecuniário: '+qryDet.FieldByName('QTDIASABONO').AsString+CR_LF+
                      'Parcelas Dev. Adto Férias: '+qryDet.FieldByName('QTDPARCDEVOL').AsString;

          sSQL :=  'UPDATE RADINSTPROCESSO SET OBS = ' +
                    QuotedStr(sRadOBS) +
                    ' WHERE IDPROCESSO = ' + qryDet.FieldByName('IDPROCESSO').AsString;

          DtmBaseDados.qry.Close;
          DtmBaseDados.qry.SQL.Clear;
          DtmBaseDados.qry.SQL.Add(sSQL);
          try
            if sSQL <> ''
            then DtmBaseDados.qry.ExecSQL;
          except
                MsgDlg('Erro ao tentar atualizar o processo no R.A.D.','Erro',mtError,[mbOK],0);
                Abort;
          end;//try
        End;
      End;
      qryDet.Next;
    End;
    qryDet.First;
  End;

  try
    AplicaAlteracoes([qryDet, qryAntec13]);
  except
    raise;
  end;
  dUltIniPer  := 0;
  dUltIniGozo := 0;
  DiasFeriasAgora := 0;

  inherited;
  if (sCadFerRegPessoa <> '') then
     sbtnAvisoFerias.Click;


end;

procedure TfrmCadFerias.CmeDetalheConfirma(Sender: TObject);
begin
  if (qryDet.State = dsInsert) then
  begin
    dUltIniPer  := dbedIniPeriodo.Date;
    dUltIniGozo := dbedIniGozo.Date;
    DiasFeriasAgora := DiasFeriasAgora + round(spedDias.Value + dbspedDiasAbono.Value);
    if DiasFeriasAgora > 30 then
       DiasFeriasAgora := DiasFeriasAgora - 30;
  end;

  inherited;

  if (sCadFerRegPessoa <> '') then
  begin
//    bbtnConfirmar.Click;
//    sbtnAvisoFerias.Click;
  end;


end;

procedure TfrmCadFerias.FormShow(Sender: TObject);
begin
  inherited;
  if (sCadFerRegPessoa <> '') then
  begin
    sbtnAlterarClick(Self);
    sbtnInsDet.Click;
  end;
end;

procedure TfrmCadFerias.sbtnAvisoFeriasClick(Sender: TObject);
begin
  inherited;
  if (qryDet.FieldByName('FLGOCORRIDA').AsInteger <> 0) Then
  begin
    MsgDlg('Férias Processadas! Impressão Não Permitida','Aviso', mtInformation,[mbOk,mbHelp],0);
    exit;
  end;
  sParamFerRegPessoa := qry.FieldByName('IDPESSOA').asString;
  sParamFerIniGozo   := qryDet.FieldByName('INIGOZOFERIAS').asString;
  sParamFerAno13     := copy(sParamFerIniGozo,7,4);

  with (dtmRelatoriosModAuto) do
  begin
    dsgnRelatorios.Report := rpAvisoFerias;
    ImprimeRelatorio.Iniciar(dsgnRelatorios, rpAvisoFerias, ppAvisoFerias,
      qryAvisoFerias, GetLayoutPadrao, 'Aviso de Férias',
      'rpAvisoFerias', 'Aviso de Férias.tmp', 417);
  end;

  with TfrmParamAvisoFerias.Create(Application) do
  begin
    ImprimeRelatorio.TipoImpressao := tpQueryComDados;
    ImprimeRelatorio.QueryDados.Assign(dtmRelatoriosModAuto.qryAvisoFerias.SQL);
    ImprimeRelatorio.Imprimir([null]);
    frmAguarde.Apaga;
    Free;
  end;  
end;

function TfrmCadFerias.GetLayoutPadrao: TStringList;
var
  Aux: TStringList;
begin
  Aux := TStringList.Create;
  Aux.Add('');
  Result := Aux;
end;

procedure TfrmCadFerias.CmeCadastroCancel(Sender: TObject);
begin
  inherited;
  dUltIniPer  := 0;
  dUltIniGozo := 0;
  DiasFeriasAgora := 0;

end;

procedure TfrmCadFerias.dbedIniGozoExit(Sender: TObject);
begin
  inherited;
  if (DiasSaldoFerias > 0) and (dbedIniGozo.Text <> '') then
     qryDet.FieldByName('FIMGOZOFERIAS').Value :=
       StrToDate(dbedIniGozo.Text) + StrToInt(spedDias.Text) - 1;
end;

procedure TfrmCadFerias.sbtnEtiquetaFeriasClick(Sender: TObject);
begin
  inherited;
  with (rptEtiquetaFerias) do
  begin
    dsgnRelatorios.Report := rpEtiquetas;
    ImprimeRelatorio.Iniciar(dsgnRelatorios, rpEtiquetas, ppEtiquetas,
      qryEtiquetas, GetLayoutPadrao, 'Etiqueta de Férias',
      'rpEtiquetas', 'Etiqueta de Férias.tmp', 417);

    qryEtiquetas.Close;
    qryEtiquetas.ParamByName('IDPESSOA').asString := qry.FieldByName('IDPESSOA').asString;
    qryEtiquetas.ParamByName('DATINI').asString   := qryDet.FieldByName('INIGOZOFERIAS').asString;
    qryEtiquetas.Open;

  end;

  ImprimeRelatorio.TipoImpressao := tpQueryComDados;
  ImprimeRelatorio.QueryDados.Assign(rptEtiquetaFerias.qryEtiquetas.SQL);
  ImprimeRelatorio.Imprimir([null]);
  frmAguarde.Apaga;
end;

end.
