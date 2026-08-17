// *****************************************************************************
// ***************************** REGISTRO DE ALTERAÇÕES ************************
// *****************************************************************************
// Autor(a)    :  Ádler Teodoro de Souza
// Data        :  19/02/2009
// Pendência   : SOL 109421 KINTANA 496332
// Descricao   :  Alteração de gravação de arquivos de log na raiz do disco C: .
//------------------------------------------------------------------------------
unit fParamGPS;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs, IvDictio,
  IvMulti, IvEMulti, MAHlpBtn, StdCtrls, Buttons, TB97Tlbr, TB97, ExtCtrls, Db, Spin,
  DBTables, Wwquery, TREdit, wwdblook, wwdbdatetimepicker, CMDateTimePicker, fSairAjuda,
  Wwdatsrc, Grids, Wwdbigrd, Wwdbgrid, CheckLst;

type
  TfrmGPS = class(TfrmSairAjuda)
    qryEstab: TwwQuery;
    qryIndexador: TwwQuery;
    qryTestaIndexador: TwwQuery;
    bbtnConfirmar: TBitBtn;
    ToolbarSep971: TToolbarSep97;
    bbtnHistorico: TBitBtn;
    dbgrdHstGPS: TwwDBGrid;
    dsHstGPS: TwwDataSource;
    qryHstGPS: TwwQuery;
    bbtnVoltar: TBitBtn;
    qryHstGPSDATAFIMGRPS: TDateTimeField;
    qryHstGPSDATAVENCGRPS: TDateTimeField;
    qryHstGPSSALARMATERNIDADE: TFloatField;
    qryHstGPSAUXILIONATALIDADE: TFloatField;
    qryHstGPSSALARIOFAMILIA: TFloatField;
    qryHstGPSAUXILIODOENCA: TFloatField;
    qryHstGPSSEGACIDTRABALHO: TFloatField;
    qryHstGPSTOTAL: TFloatField;
    gbxTipoInformacao: TGroupBox;
    cmbxTipoInformacao: TComboBox;
    gbxCodPagamento: TGroupBox;
    edCodPagamento: TEdit;
    rgTipImpressao: TRadioGroup;
    gbxAnoMesRef: TGroupBox;
    cmbMes: TComboBox;
    speAno: TSpinEdit;
    gbxDatasProcess: TGroupBox;
    Label1: TLabel;
    Label2: TLabel;
    dtPagamento: TCMDateTimePicker;
    dtVencimento: TCMDateTimePicker;
    rgGera13: TRadioGroup;
    gbxEstab: TGroupBox;
    dblkcbEstab: TwwDBLookupCombo;
    gbxTipoPag: TGroupBox;
    gbxConfigProcess: TGroupBox;
    chkbxCorrecao: TCheckBox;
    cbJuros: TCheckBox;
    cbMulta: TCheckBox;
    pnlJuros: TPanel;
    rbPercentJuros: TRadioButton;
    rbValorJuros: TRadioButton;
    redJuros: TRealEdit;
    pnlMulta: TPanel;
    rbValorMulta: TRadioButton;
    rbPercentMulta: TRadioButton;
    redMulta: TRealEdit;
    pnlCorrecao: TPanel;
    dblkpCorrecao: TwwDBLookupCombo;
    gbxAdicGPS: TGroupBox;
    Label3: TLabel;
    Label4: TLabel;
    Label7: TLabel;
    Label8: TLabel;
    Label5: TLabel;
    pnlLinha7: TPanel;
    rbTributosLinha7: TRadioButton;
    rbAbatimentoLinha7: TRadioButton;
    pnlLinha8: TPanel;
    rbTributosLinha8: TRadioButton;
    rbAbatimentoLinha8: TRadioButton;
    dtDescricao7: TEdit;
    dtDescricao8: TEdit;
    edValAdicLinha8: TRealEdit;
    edValAdicLinha7: TRealEdit;
    pnlLinha6: TPanel;
    rbTributosLinha6: TRadioButton;
    rbAbatimentoLinha6: TRadioButton;
    edValAdicLinha6: TRealEdit;
    gbxDadosRel: TGroupBox;
    chkbxAtualizacao: TCheckBox;
    chkbxTotal: TCheckBox;
    rgNumVias: TRadioGroup;
    rgProcesso: TRadioGroup;
    gbxTipoPapel: TGroupBox;
    cmbTipoPapel: TComboBox;
    chklstTipoFolha: TCheckListBox;
    procedure FormCreate(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure bbtnConfirmarClick(Sender: TObject);
    procedure chkbxCorrecaoClick(Sender: TObject);
    procedure cbJurosClick(Sender: TObject);
    procedure cbMultaClick(Sender: TObject);
    procedure dblkcbEstabChange(Sender: TObject);
    procedure edCodPagamentoChange(Sender: TObject);
    procedure bbtnVoltarClick(Sender: TObject);
    procedure bbtnHistoricoClick(Sender: TObject);
    procedure chklstTipoFolhaDrawItem(Control: TWinControl; Index: Integer;
      Rect: TRect; State: TOwnerDrawState);
    procedure chklstTipoFolhaKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure chklstTipoFolhaClickCheck(Sender: TObject);
  private
    procedure HabilitaBtOk;
  end;

var
  frmGPS: TfrmGPS;

implementation

uses uSistema, uMensErro, uDataBase, fAguarde, dBaseDados, uFuncoesUteis, UsoGeralRH,
  uComumRelats, dRelatorios2;

{$R *.DFM}

procedure TfrmGPS.FormCreate(Sender: TObject);
var
  iPos: integer;
begin
  inherited;
  if not(Assigned(ListaCodTipoFolha)) then
    ListaCodTipoFolha := TStringList.Create;

  cmbTipoPapel.Items.Assign (dtmRelatorios2.rpGPS.PrinterSetup.PaperNames);

  iPos := ProcuraStList (cmbTipoPapel.Items,'A4');
  if (iPos = -1) then
    cmbTipoPapel. ItemIndex := 0
  else
    cmbTipoPapel. ItemIndex := iPos;

  FazQuery(dtmBaseDados.qry,'SELECT NORMALINI FROM PARAMRH');
  cmbMes.ItemIndex := ExtraiMes(dtmBaseDados.qry.FieldByName('NORMALINI').asDateTime) - 1;
  speAno.Text      := Copy(dtmBaseDados.qry.FieldByName('NORMALINI').AsString,7,4);

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
  qryIndexador.Open;

  // Monto a Lista de Tipos de Folha
  chklstTipoFolha.Items.Clear;
  ListaCodTipoFolha.Clear;
  with (dtmBaseDados.qry) do
  begin
    Close;
    SQL.Clear;
    SQL.Add('SELECT');
    SQL.Add('  IDMOTIVO, DESCRICAO');
    SQL.Add('FROM');
    SQL.Add('  MOTIVO');
    SQL.Add('WHERE');
    SQL.Add('  (GRUPOMOTIVO IN (''F'',''D''))');
    SQL.Add('ORDER BY');
    SQL.Add('  DESCRICAO');
    Open;
    while not(EOF) do
    begin
      ListaCodTipoFolha.Add(FieldByName('IDMOTIVO').asString);
      chklstTipoFolha.Items.Add(FieldByName('DESCRICAO').asString);
      Next;
    end;
  end;

  dtPagamento.Date := Date;
  cmbxTipoInformacao.ItemIndex := 0;
end;

procedure TfrmGPS.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  dtmBaseDados.qry.Close;
  qryEstab.Close;
  qryIndexador.Close;
  inherited;
end;

procedure TfrmGPS.chklstTipoFolhaDrawItem(Control: TWinControl; Index: Integer;
  Rect: TRect; State: TOwnerDrawState);
begin
  with (TCheckListBox(Control).Canvas) do
  begin
    if (TCheckListBox(Control).Checked[Index]) then
      if (odSelected in State) then
      begin
        Brush.Color := clTeal;
        Font.Color := clWhite;
      end
      else
      begin
        Brush.Color := CL_AMARELO_CLARO;
        Font.Color := clBlack;
      end;

    FillRect(Rect);
    TextOut(Rect.Left, Rect.Top, TCheckListBox(Control).Items[Index]);
  end;
end;

procedure TfrmGPS.chklstTipoFolhaKeyDown(Sender: TObject; var Key: Word; Shift: TShiftState);
begin
  if (Key = VK_TAB) then
    InvalidateItemListBox(TCustomListBox(Sender),TCustomListBox(Sender).ItemIndex);
end;

procedure TfrmGPS.edCodPagamentoChange(Sender: TObject);
begin
  HabilitaBtOk;
end;

procedure TfrmGPS.dblkcbEstabChange(Sender: TObject);
begin
  dblkcbEstab.Text := Trim(dblkcbEstab.Text);
  HabilitaBtOk;
end;

procedure TfrmGPS.chklstTipoFolhaClickCheck(Sender: TObject);
begin
  InvalidateItemListBox(TCustomListBox(Sender),TCustomListBox(Sender).ItemIndex);
end;

procedure TfrmGPS.chkbxCorrecaoClick(Sender: TObject);
begin
  pnlCorrecao.Visible := chkbxCorrecao.Checked;
end;

procedure TfrmGPS.cbJurosClick(Sender: TObject);
begin
  pnlJuros.Visible := cbJuros.Checked;
  if (cbJuros.Checked) then
    redJuros.SetFocus;
end;

procedure TfrmGPS.cbMultaClick(Sender: TObject);
begin
  pnlMulta.Visible := cbMulta.Checked;
  if (cbMulta.Checked) then
    redMulta.SetFocus;
end;

procedure TfrmGPS.bbtnHistoricoClick(Sender: TObject);
begin
  frmAguarde.Mostra('Selecionando Dados do Histórico...');
  frmAguarde.Update;
  qryHstGPS.Open;
  dbgrdHstGPS.BringToFront;
  dbgrdHstGPS.Visible   := true;
  bbtnVoltar.Enabled    := true;
  bbtnHistorico.Enabled := false;
  frmAguarde.Apaga;
end;

procedure TfrmGPS.bbtnVoltarClick(Sender: TObject);
begin
  qryHstGPS.Close;
  dbgrdHstGPS.SendToBack;
  dbgrdHstGPS.Visible   := false;
  bbtnVoltar.Enabled    := false;
  bbtnHistorico.Enabled := true;
end;

procedure TfrmGPS.bbtnConfirmarClick(Sender: TObject);
var
  iCorrecao: LongInt;
  wNum: word;
  fJuros, fMulta, fCorrOld, fCorrNew: double;
  sNomeTabela, sMes, sDataPgto, sDataVenc, sTipo: string;
begin
  ModalResult := mrNone;

  if (rgProcesso.ItemIndex = 0) then
    sNomeTabela := 'PREVIAFOLPAG'
  else
    sNomeTabela := 'HISTRUBSAL';

  // Inicializa Variáveis
  fJuros:=0; fMulta:=0; fCorrOld:=0; fCorrNew:=0; sMes:=''; sTipo:='';

  // Confirma os Períodos com o usuário
  if (dtPagamento.Date > dtVencimento.Date) then
    if (MsgDlg('Data do Pagamento DIFERENTE da Data do Vencimento. Continuar ?','Aviso', mtConfirmation,[mbOK,mbCancel],0) = mrCancel) then
      exit;

  // Verifica se os valores Informados são válidos
  // ---------------------------------------------
  // Juros
  if (pnlJuros.Visible) then
  begin
    try
      fJuros := StrToFloat(redJuros.Text);
    except
      MsgDlg('Valor do Juros Vazio ou Inválido !','Aviso', mtInformation,[mbOK,mbHelp],0);
      redJuros.SetFocus;
      exit;
    end;
  end;
  // Multas
  if (pnlMulta.Visible) then
  begin
    try
      fMulta := StrToFloat(redMulta.Text);
    except
      MsgDlg('Valor da Multa Vazia ou Inválida !','Aviso', mtInformation,[mbOK,mbHelp],0);
      redMulta.SetFocus;
      exit;
    end;
  end;

  // Verfica se o Tipo de Correção Monetária foi escolhida
  if (pnlCorrecao.Visible) then
  begin
    if (dblkpCorrecao.Text = '') then
    begin
      MsgDlg ('Tipo de Correção Monetária não escolhida !','Aviso', mtInformation,[mbOK,mbHelp],0);
      dblkpCorrecao.SetFocus;
      exit;
    end
    else
    begin
      iCorrecao := qryIndexador.FieldByName('MOECODIGO').asInteger;

      //******************************************************************************
      // Verfica se Tipo de Correção Monetária é Diário, Mensal, Semestral ou Anual
      // (tirando otipo DIÁRIO, vale sempre o 1º dia do Mês/Semestre/Ano)
      //******************************************************************************

      //***************
      // Vencimento
      //***************
      case (qryIndexador.FieldByName('MOEPERIODICIDADE').asString[1]) of
        'D' : sDataVenc := dtVencimento.Text; // Diário
        'M' : sDataVenc := '01'+Copy(dtVencimento.Text,3,8); // Mensal
        'A' : sDataVenc := '01/01'+Copy(dtVencimento.Text,6,5); // Anual
        'S' : // Semestral
          if (StrToDate(dtVencimento.Text) < StrToDate('01/07'+Copy(dtVencimento.Text,6,5))) then
            sDataVenc := '01/01'+Copy(dtVencimento.Text,6,5) // 1º Semestre
          else
            sDataVenc := '01/07'+Copy(dtVencimento.Text,6,5); // 2º Semestre
      end;

      // Verifica se o Tipo está cadastrado na data referida
      qryTestaIndexador.Close;
      qryTestaIndexador.ParamByName('DATA').asDate         := StrToDate(sDataVenc);
      qryTestaIndexador.ParamByName('MOECODIGO').asInteger := iCorrecao;
      qryTestaIndexador.Open;

      if (qryTestaIndexador.IsEmpty) then
      begin
        MsgDlg ('Tipo de Correção Monetária, para Vencimento, não cadastrado !','Aviso', mtInformation,[mbOK,mbHelp],0);
        exit;
      end
      else
        fCorrOld := qryTestaIndexador.FieldByName('VALOR').AsFloat;

      //***************
      // Pagamento
      //***************
      case (qryIndexador.FieldByName('MOEPERIODICIDADE').asString[1]) of
        'D' : sDataPgto := dtPagamento.Text; // Diário
        'M' : sDataPgto := '01'+Copy(dtPagamento.Text,3,8); // Mensal
        'A' : sDataPgto := '01/01'+Copy(dtPagamento.Text,6,5); // Anual
        'S' : // Semestral
          if (StrToDate(dtPagamento.Text) < StrToDate('01/07'+Copy(dtPagamento.Text,6,5))) then
            sDataPgto := '01/01'+Copy(dtPagamento.Text,6,5)  // 1º Semestre
          else
            sDataPgto := '01/07'+Copy(dtPagamento.Text,6,5); // 2º Semestre
      end;

      // Verifica se o Tipo está cadastrado na data referida
      qryTestaIndexador.Close;
      qryTestaIndexador.ParamByName('DATA').asDate         := StrToDate(sDataPgto);
      qryTestaIndexador.ParamByName('MOECODIGO').asInteger := iCorrecao;
      qryTestaIndexador.Open;

      if (qryTestaIndexador.IsEmpty) then
      begin
        MsgDlg ('Tipo de Correção Monetária, para Pagamento, não cadastrado !','Aviso', mtInformation,[mbOK,mbHelp],0);
        exit;
      end
      else
        fCorrNew := qryTestaIndexador.FieldByName('VALOR').asFloat;
    end;
    dtmRelatorios2.sMoeCodigo := qryIndexador.FieldByName('MOECODIGO').asString;
  end
  else
  begin
    qryIndexador.Locate ('MOEDESC','REAL',[loCaseInsensitive]);
    dtmRelatorios2.sMoeCodigo := qryIndexador.FieldByName('MOECODIGO').asString;
  end;

  // Mês de Referência
  sMes := QuotedStr(IntToStr(speAno.Value) +'/'+ PoeZero(cmbMes.ItemIndex + 1));

  // Tipos de Folha selecionados
  wNum := CriaListaOpcoes (chklstTipoFolha, ListaCodTipoFolha, sCodTipoFolhaSel, ',', false);
  if (wNum = ListaCodTipoFolha.Count) then
    sCodTipoFolhaSel := '';

  // Verifica Qual é o Tipo de Informação que deverá ser processada no Relatório
  dtmRelatorios2.qryGPS.Close;
  with (dtmRelatorios2.qryGPS.SQL) do
  begin
    Clear;
    Add('SELECT DISTINCT');

    if (cmbxTipoInformacao.ItemIndex < 1) then
    begin
      Add('  PJ.IDPESSOA AS IDEMPRESA,');
      Add('  PJ.RAZAOSOCIAL AS EMPRESA,');
      Add('  (''CNPJ: '' || PJ.NUMDOCUMENTO) AS CGC,');
      Add('  RTRIM(E.LOGRADOURO) ||'', ''|| E.NUMERO || DECODE(E.COMPLEMENTO,NULL,NULL,'' - '' ||');
      Add('    RTRIM(E.COMPLEMENTO)) || '' - CEP:'' ||');
      Add('    RTRIM(SUBSTR(E.CEP,1,5)) ||''-''|| RTRIM(SUBSTR(E.CEP,6,3)) AS RUA,');
      Add('  (DECODE(TE.DDD,NULL,NULL,''('' || RTRIM(TE.DDD) || '')'') || TE.NUMERO) AS TELEFONE,');
      Add('  RTRIM(E.BAIRRO) AS BAIRRO,');
      Add('  RTRIM(CIDADES.NOME) AS CIDADE,');
      Add('  ROUND(CALCVLR.SAL_MATERNIDADE,2) AS SAL_MATERNIDADE,');
      Add('  ROUND(CALCVLR.SAL_FAMILIA,2) AS SAL_FAMILIA,');
      Add('  ROUND(CALCVLR.AUX_DOENCA,2) AS AUX_DOENCA,');
      Add('  ROUND(DECODE(SAT.PERCSEGACIDTRAB,NULL,0,SAT.PERCSEGACIDTRAB),2) AS SEG_ACID_TRAB,');
      Add('  ROUND(CALCVLR.VLRBASE,2) AS VLRBASE,');
      Add('  ROUND(CALCVLR.BASEINSS,2) AS BASEINSS,');
      Add('  ROUND(CALCVLR.SEGURO,2) AS SEGURO,');
      Add('  ROUND(CALCVLR.BASERPA,2) AS BASERPA,');
      Add('  ROUND(CALCVLR.FPAS,2) AS FPAS,');
      Add('  ROUND(CALCVLR.VLRBASE*(FP.PERCCONTRIBEMPRES+');
      Add('    DECODE(SAT.PERCSEGACIDTRAB,NULL,0,SAT.PERCSEGACIDTRAB))/100,2)+');
      Add('    ROUND(CALCVLR.BASESEMSAT*FP.PERCCONTRIBEMPRES/100,2) AS VLREMPRESA,');
      Add('  ROUND((CALCVLR.VLRBASE*(CP.PERCCONVPREVID-CP1.PERCCONVPREVID))/100,2) AS TERCEIROS,');
      Add('  ROUND(((CALCVLR.SEGURO+(CALCVLR.VLRBASE*(FP.PERCCONTRIBEMPRES+');
      Add('    DECODE(SAT.PERCSEGACIDTRAB,NULL,0,SAT.PERCSEGACIDTRAB))/100))+');
      Add('    ((CALCVLR.VLRBASE*(CP.PERCCONVPREVID-CP1.PERCCONVPREVID))/100))-CALCVLR.FPAS,2) AS SUBTOTAL');
      // Se Existir Juros
      if (cbJuros.Checked) then
      begin
        Add('  ,(' +QuotedStr(FloatToStr(fJuros))+ ') AS JUROS');
        // Testa se Juros é por Percentual ou Valor
        if (rbPercentJuros.Checked) then
          Add('  ,(''P'') AS TJUROS')
        else
          Add('  ,(''V'') AS TJUROS');
      end
      else
        Add('  ,(0) AS JUROS, (''V'') AS TJUROS');

      // Se Existir Multa
      if (cbMulta.Checked) Then
      begin
        Add('  ,(' +QuotedStr(FloatToStr(fMulta))+ ') AS MULTA');
        // Testa se Juros é por Percentual ou Valor
        if (rbPercentMulta.Checked) then
          Add('  ,(''P'') AS TMULTA')
        else
          Add('  ,(''V'') AS TMULTA');
      end
      else
        Add('  ,(0) AS MULTA, (''V'') AS TMULTA');

      Add('FROM');
      Add('  PESSOA PJ, ENDPESS E, TELENDPESS TE, FILIALPESSOA FI, FPAS FP, SEGACIDTRAB SAT,');
      Add('  CIDADES, CONVPREVID CP1,');
      // ------------------------------------------------------------------------------- //
      Add('  (SELECT IDFPAS, SUM(PERCCONVPREVID) AS PERCCONVPREVID');
      Add('   FROM   CONVPREVID');
      Add('   GROUP BY IDFPAS) CP,');
      // ------------------------------------------------------------------------------- //
      Add('  (SELECT F.IDESTAB AS CODIGO,');
      // Salário Maternidade
      Add('     SUM(DECODE(P.CODRUBCLT,''60570'',H.VALORPROVENTO,0)) AS SAL_MATERNIDADE,');
      // Salário Família
      Add('     SUM(DECODE(P.CODRUBCLT,''40573'',H.VALORPROVENTO,0)) AS SAL_FAMILIA,');
      // Auxílio doença
      Add('     SUM(DECODE(P.CODRUBCLT,''40560'',H.VALORPROVENTO,0)) AS AUX_DOENCA,');
      // VLRBASE = Valor da Base INSS + Valor da Base INSS do 13º + Valor da Base INSS Férias +
      // Valor da Base INSS Salário Maternidade + Valor da Base INSS Diferença Salarial
      Add('     SUM(DECODE(P.CODRUBCLT,''60025'',H.VALORPROVENTO,0)+');
      Add('       DECODE(P.CODRUBCLT,''60017'',H.VALORPROVENTO,0)+');
      Add('       DECODE(P.CODRUBCLT,''60015'',H.VALORPROVENTO,0)+');
      Add('       DECODE(P.CODRUBCLT,''60421'',H.VALORPROVENTO,0)+');
      Add('       DECODE(P.CODRUBCLT,''62016'',H.VALORPROVENTO,0)) AS VLRBASE,');
      // BASESEMSAT = Valor Base da Contribuição Global
      Add('     SUM(DECODE(P.CODRUBCLT,''60030'',H.VALORPROVENTO,0)) AS BASESEMSAT,');
      // Base do INSS = Valor da Base INSS + Valor Base Salário Maternidade
      Add('     SUM(DECODE(P.CODRUBCLT,''60025'',H.VALORPROVENTO,0)+');
      Add('       DECODE(P.CODRUBCLT,''60570'',H.VALORPROVENTO,0)) AS BASEINSS,');
      // Valor Base RPA
      Add('     SUM(DECODE(P.CODRUBCLT,''60002'',H.VALORPROVENTO,0)) AS BASERPA,');
      // Valor do INSS
      Add('     SUM(DECODE(P.CODRUBCLT,''50025'',H.VALORPROVENTO,0)) AS SEGURO,');
      // FPAS = Valor Auxílio Doença + Valor Salário Família + Valor a Descontar por Afastamento +
      //        Maternidade + Valor a Descontar por Afastamento Paternidade
      Add('     SUM(DECODE(P.CODRUBCLT,''40560'',H.VALORPROVENTO,0)+');
      Add('       DECODE(P.CODRUBCLT,''40573'',H.VALORPROVENTO,0)+');
      Add('       DECODE(P.CODRUBCLT,''50570'',H.VALORPROVENTO,0)+');
      Add('       DECODE(P.CODRUBCLT,''50571'',H.VALORPROVENTO,0)) AS FPAS');
      Add('   FROM   ' + sNomeTabela + ' H, PROVDESC P, FUNCIONARIO F');
      Add('   WHERE');
      Add('     (P.CODRUBCLT IN (''60570'',''40573'',''40560'',''60025'',''60030'','+
        '''60002'',''50025'',''50570'',''50571'')) AND');
      Add('     (H.MES        = ' +sMes+ ')  AND');

      if (sCodTipoFolhaSel <> '') then
        if (Pos(',',sCodTipoFolhaSel) > 0) then
          Add('     (H.IDMOTIVO  IN (' +sCodTipoFolhaSel+ ')) AND')
        else
          Add('     (H.IDMOTIVO   = ' +sCodTipoFolhaSel+ ') AND');

      Add('     (H.IDPESSJUR  = ' +IntToStr(Sistema.IDEmpresa)+ ') AND');
      Add('     (H.IDPESSOA   = F.IDPESSOA) AND');
      Add('     (P.IDPROVENTO = H.IDRUBRICA)');
      Add('   GROUP BY F.IDESTAB) CALCVLR');
      // ------------------------------------------------------------------------------- //
      Add('WHERE');
      Add('  (PJ.IDPESSOA       = ' +qryEstab.FieldByName('CODIGO').asString+ ') AND');
      Add('  (PJ.IDPESSOA       = FI.IDFILIALPESSOA) AND');
      Add('  (FI.IDFPAS         = FP.IDFPAS) AND');
      Add('  (FI.IDCONVPREVID   = CP1.IDCONVPREVID) AND');
      Add('  (FP.IDFPAS         = CP1.IDFPAS) AND');
      Add('  (FP.IDFPAS         = CP.IDFPAS) AND');
      Add('  (PJ.IDPESSOA       = E.IDPESSOA) AND');
      Add('  (PJ.IDENDCOMERCIAL = E.IDENDERECO) AND');
      Add('  (E.IDCIDADES       = CIDADES.IDCIDADES) AND');
      Add('  (E.IDENDERECO      = TE.IDENDERECO) AND');
      Add('  (PJ.IDPESSOA       = CALCVLR.CODIGO) AND');
      Add('  (FI.IDSEGACIDTRAB  = SAT.IDSEGACIDTRAB(+)) AND');
      Add('  (ROWNUM            = 1)');
    end
    else
    begin
      // Atribui Variável ( NIT - Autônomo ou CEI )
      if (cmbxTipoInformacao.ItemIndex = 1) then
        sTipo := 'NIT: '
      else
        sTipo := 'CEI: ';

      sTipo := QuotedStr(sTipo);

      // Monta Query
      Add('  PF.NOME AS EMPRESA,');
      Add('  ('+sTipo+'||DO.NUMDOCUMENTO) AS CGC,');
      Add('  RTRIM(E.LOGRADOURO) ||'', ''|| E.NUMERO || DECODE(E.COMPLEMENTO,NULL,NULL,'' - '' ||');
      Add('    RTRIM(E.COMPLEMENTO)) AS RUA,');
      Add('  (DECODE(TE.DDD,NULL,NULL,''('' || RTRIM(TE.DDD) || '')'') || TE.NUMERO) AS TELEFONE,');
      Add('  RTRIM(E.BAIRRO)         AS BAIRRO,');
      Add('  RTRIM(CIDADES.NOME)     AS CIDADE,');
      Add('  NVL(H.VALORPROVENTO,0)  AS SUBTOTAL,');
      Add('  0                       AS TERCEIROS,');
      Add('  0                       AS VLREMPRESA,');
      Add('  0                       AS SEGURO,');
      Add('  0                       AS FPAS');
      // Se Existir Juros
      if (cbJuros.Checked) then
      begin
        Add(', '+QuotedStr(FloatToStr(fJuros))+' AS JUROS');
        // Testa se Juros é por Percentual ou Valor
        if (rbPercentJuros.Checked) then
          Add(', ''P'' AS TJUROS')
        else
          Add(', ''V'' AS TJUROS');
      end
      else
        Add(', 0 AS JUROS, ''V'' AS TJUROS');
      // Se Existir Multa
      if (cbMulta.Checked) then
      begin
        Add(', '+QuotedStr(FloatToStr(fMulta))+' AS MULTA');
        // Testa se Juros é por Percentual ou Valor
        if (rbPercentMulta.Checked) then
          Add(', ''P'' AS TMULTA')
        else
          Add(', ''V'' AS TMULTA');
      end
      else
        Add(', 0 AS MULTA, ''V'' AS TMULTA');

      Add('FROM');
      Add('  ' + sNomeTabela + ' H, PESSOA PJ, PESSOA PF, DOCPESSOA DO, ENDPESS E, TELENDPESS TE,');
      Add('  PROVDESC P, TIPODOCOFICIAL TDO, CIDADES, FILIALPESSOA FI');
      Add('WHERE');
      Add('  (TDO.SIGLADOCUMENTO = '+sTipo+')      AND');
      Add('  (P.CODRUBCLT        = ''60002'')      AND');
      Add('  (PJ.IDPESSOA        = ' +qryEstab.FieldByName('CODIGO').asString+ ') AND');

      if (sCodTipoFolhaSel <> '') then
        if (Pos(',',sCodTipoFolhaSel) > 0) then
          Add('  (H.IDMOTIVO        IN (' +sCodTipoFolhaSel+ ')) AND')
        else
          Add('  (H.IDMOTIVO         = ' +sCodTipoFolhaSel+ ') AND');

      Add('  (H.MES              = '+sMes+')       AND');
      Add('  (TDO.IDDOCUMENTO    = DO.IDDOCUMENTO) AND');
      Add('  (H.IDPESSJUR        = PJ.IDGRUPO)     AND');
      Add('  (H.IDPESSOA         = PF.IDPESSOA)    AND');
      Add('  (P.IDPROVENTO       = H.IDRUBRICA)    AND');
      Add('  (DO.IDPESSOA        = PF.IDPESSOA)    AND');
      Add('  (PF.IDPESSOA        = E.IDPESSOA)        AND');
      Add('  (PF.IDENDCOMERCIAL  = E.IDENDERECO)      AND');
      Add('  (E.IDCIDADES        = CIDADES.IDCIDADES) AND');
      Add('  (E.IDENDERECO       = TE.IDENDERECO)     AND');
      Add('  (ROWNUM             = 1)');
    end;
    Add('ORDER BY EMPRESA');
  end;
  //dtmRelatorios2.qryGPS.SQL.SaveToFile('c:\qry.txt');
  dtmRelatorios2.qryGPS.SQL.SaveToFile(Sistema.RetornaCaminhoArquivos(Sistema.IdEmpresa)+'\qry.txt');//Ádler Teodoro de Souza SOL 109421 KINTANA 496332

  with (dtmRelatorios2) do
  begin
    sDataPag    := dtPagamento.Text;
    sDataVenc   := dtVencimento.Text;
    RefDataPag  := Copy(dtPagamento.Text,4,7);
    RefDataVenc := Copy(dtVencimento.Text,4,7);

    if (rgTipImpressao.ItemIndex = 0) then
      frmAguarde.Mostra ('Relatório GPS (Espelho)')
    else
      frmAguarde.Mostra ('Relatório GPS (Imagem)');

    frmAguarde.Pos := 0;
    qryGPS.Open;
  end;

  if (dtmRelatorios2.qryGPS.IsEmpty) then
  begin
    frmAguarde.Apaga;
    MsgDlg('Não há dados a serem exibidos! Verifique.','Aviso',mtInformation,[mbOk,mbHelp],0);
    exit;
  end
  else
    ModalResult := mrOk;

  with (dtmRelatorios2) do
  begin
    frmAguarde.Max := qryGPS.RecordCount;
    frmAguarde.Min := 0;
    if not(qryGPS.FieldByName('EMPRESA').IsNull) then
      rTotal := qryGPS.FieldByName('SUBTOTAL').asFloat
    else
      rTotal := 0;

    // Passa Variáveis para o DataModule
    rAdicLinha6 := edValAdicLinha6.Value;
    rAdicLinha7 := edValAdicLinha7.Value;
    rAdicLinha8 := edValAdicLinha8.Value;
    rIndiceNew  := fCorrNew;
    rIndiceOld  := fCorrOld;

    // Testa se é Tributo ou Abatimento
    bTributoLinha6 := rbTributosLinha6.Checked;
    bTributoLinha7 := rbTributosLinha7.Checked;
    bTributoLinha8 := rbTributosLinha8.Checked;

    // Passa a Dados para o Relatório
    if (rgGera13.ItemIndex = 0) then
      rpGPSLblMes1.Caption := '13/'+ IntToStr(speAno.Value)
    else
      rpGPSLblMes1.Caption := PoeZero(cmbMes.ItemIndex + 1) +'/'+ IntToStr(speAno.Value);

    rpGPSLblMes2.Caption    := rpGPSLblMes1.Caption;
    rpGPSLblCodPag1.Caption := edCodPagamento.Text;
    rpGPSLblCodPag2.Caption := edCodPagamento.Text;
    rAdicGPSA               := edValAdicLinha7.Value;
    rAdicGPSB               := edValAdicLinha8.Value;
    rpGPSLbl71.Caption      := dtDescricao7.Text;
    rpGPSLbl72.Caption      := dtDescricao7.Text;
    rpGPSLbl81.Caption      := dtDescricao8.Text;
    rpGPSLbl82.Caption      := dtDescricao8.Text;

    rpGPSLbl7Valor1.Caption := ValStr(edValAdicLinha7.Value,12,2,true,',');
    rpGPSLbl7Valor2.Caption := rpGPSLbl7Valor1.Caption;
    rpGPSLbl8Valor1.Caption := ValStr(edValAdicLinha8.Value,12,2,true,',');
    rpGPSLbl8Valor2.Caption := rpGPSLbl8Valor1.Caption;

    // Verifica se a opção de Impressão está habilitada
    rpGPSLblMultaJuros1.Visible := chkbxAtualizacao.Checked;
    rpGPSLblMultaJuros2.Visible := chkbxAtualizacao.Checked;
    rpGPSLblTotal1.Visible      := chkbxTotal.Checked;
    rpGPSLblTotal2.Visible      := chkbxTotal.Checked;

    // Visualizo ou não os componetes de acordo com o modo de impressão (Espelho, Imagem)
    // (para a primeira via da GPS)
    rpGPSImage1.Visible := (rgTipImpressao.ItemIndex = 0);

    rpGPSShape1.Visible := (rgTipImpressao.ItemIndex = 0);
    rpGPSShape2.Visible := rpGPSShape1.Visible;
    rpGPSShape3.Visible := rpGPSShape1.Visible;
    rpGPSShape4.Visible := rpGPSShape1.Visible;
    rpGPSShape5.Visible := rpGPSShape1.Visible;
    rpGPSShape6.Visible := rpGPSShape1.Visible;

    rpGPSLine1.Visible := (rgTipImpressao.ItemIndex = 0);
    rpGPSLine2.Visible := rpGPSLine1.Visible;
    rpGPSLine3.Visible := rpGPSLine1.Visible;

    rpGPSLabel1.Visible  := (rgTipImpressao.ItemIndex = 0);
    rpGPSLabel2.Visible  := rpGPSLabel1.Visible;
    rpGPSLabel3.Visible  := rpGPSLabel1.Visible;
    rpGPSLabel4.Visible  := rpGPSLabel1.Visible;
    rpGPSLabel5.Visible  := rpGPSLabel1.Visible;
    rpGPSLabel6.Visible  := rpGPSLabel1.Visible;
    rpGPSLabel7.Visible  := rpGPSLabel1.Visible;
    rpGPSLabel8.Visible  := rpGPSLabel1.Visible;
    rpGPSLabel9.Visible  := rpGPSLabel1.Visible;
    rpGPSLabel10.Visible := rpGPSLabel1.Visible;
    rpGPSLabel11.Visible := rpGPSLabel1.Visible;
    rpGPSLabel12.Visible := rpGPSLabel1.Visible;
    rpGPSLabel13.Visible := rpGPSLabel1.Visible;
    rpGPSLabel14.Visible := rpGPSLabel1.Visible;
    rpGPSLabel15.Visible := rpGPSLabel1.Visible;
    rpGPSLabel16.Visible := rpGPSLabel1.Visible;
    rpGPSLabel17.Visible := rpGPSLabel1.Visible;
    rpGPSLabel18.Visible := rpGPSLabel1.Visible;
    rpGPSLabel19.Visible := rpGPSLabel1.Visible;
    rpGPSLabel20.Visible := rpGPSLabel1.Visible;
    rpGPSLabel21.Visible := rpGPSLabel1.Visible;

    // Visualizo ou não os componetes de acordo com o modo de impressão (Espelho, Imagem)
    // e Número da Vias a Imprimir (para a segunda via da GPS)
    rpGPSImage2.Visible := (rpGPSImage1.Visible) and (rgNumVias.ItemIndex = 1);

    rpGPSLine4.Visible := (rpGPSLine1.Visible) and (rgNumVias.ItemIndex = 1);
    rpGPSLine5.Visible := (rpGPSLine1.Visible) and (rgNumVias.ItemIndex = 1);
    rpGPSLine6.Visible := (rpGPSLine1.Visible) and (rgNumVias.ItemIndex = 1);

    rpGPSShape7.Visible  := (rpGPSShape1.Visible) and (rgNumVias.ItemIndex = 1);
    rpGPSShape8.Visible  := (rpGPSShape1.Visible) and (rgNumVias.ItemIndex = 1);
    rpGPSShape9.Visible  := (rpGPSShape1.Visible) and (rgNumVias.ItemIndex = 1);
    rpGPSShape10.Visible := (rpGPSShape1.Visible) and (rgNumVias.ItemIndex = 1);
    rpGPSShape11.Visible := (rpGPSShape1.Visible) and (rgNumVias.ItemIndex = 1);
    rpGPSShape12.Visible := (rpGPSShape1.Visible) and (rgNumVias.ItemIndex = 1);

    rpGPSLabel22.Visible := (rpGPSLabel1.Visible) and (rgNumVias.ItemIndex = 1);
    rpGPSLabel23.Visible := (rpGPSLabel1.Visible) and (rgNumVias.ItemIndex = 1);
    rpGPSLabel24.Visible := (rpGPSLabel1.Visible) and (rgNumVias.ItemIndex = 1);
    rpGPSLabel25.Visible := (rpGPSLabel1.Visible) and (rgNumVias.ItemIndex = 1);
    rpGPSLabel26.Visible := (rpGPSLabel1.Visible) and (rgNumVias.ItemIndex = 1);
    rpGPSLabel27.Visible := (rpGPSLabel1.Visible) and (rgNumVias.ItemIndex = 1);
    rpGPSLabel28.Visible := (rpGPSLabel1.Visible) and (rgNumVias.ItemIndex = 1);
    rpGPSLabel29.Visible := (rpGPSLabel1.Visible) and (rgNumVias.ItemIndex = 1);
    rpGPSLabel30.Visible := (rpGPSLabel1.Visible) and (rgNumVias.ItemIndex = 1);
    rpGPSLabel31.Visible := (rpGPSLabel1.Visible) and (rgNumVias.ItemIndex = 1);
    rpGPSLabel32.Visible := (rpGPSLabel1.Visible) and (rgNumVias.ItemIndex = 1);
    rpGPSLabel33.Visible := (rpGPSLabel1.Visible) and (rgNumVias.ItemIndex = 1);
    rpGPSLabel34.Visible := (rpGPSLabel1.Visible) and (rgNumVias.ItemIndex = 1);
    rpGPSLabel35.Visible := (rpGPSLabel1.Visible) and (rgNumVias.ItemIndex = 1);
    rpGPSLabel36.Visible := (rpGPSLabel1.Visible) and (rgNumVias.ItemIndex = 1);
    rpGPSLabel37.Visible := (rpGPSLabel1.Visible) and (rgNumVias.ItemIndex = 1);
    rpGPSLabel38.Visible := (rpGPSLabel1.Visible) and (rgNumVias.ItemIndex = 1);
    rpGPSLabel39.Visible := (rpGPSLabel1.Visible) and (rgNumVias.ItemIndex = 1);
    rpGPSLabel40.Visible := (rpGPSLabel1.Visible) and (rgNumVias.ItemIndex = 1);
    rpGPSLabel41.Visible := (rpGPSLabel1.Visible) and (rgNumVias.ItemIndex = 1);
    rpGPSLabel42.Visible := (rpGPSLabel1.Visible) and (rgNumVias.ItemIndex = 1);

    rpGPSDBText7.Visible        := (rgNumVias.ItemIndex = 1);
    rpGPSDBText8.Visible        := rpGPSDBText7.Visible;
    rpGPSDBText9.Visible        := rpGPSDBText7.Visible;
    rpGPSDBText10.Visible       := rpGPSDBText7.Visible;
    rpGPSDBText11.Visible       := rpGPSDBText7.Visible;
    rpGPSDBText12.Visible       := rpGPSDBText7.Visible;
    rpGPSLblCodPag2.Visible     := rpGPSDBText7.Visible;
    rpGPSLblMes2.Visible        := rpGPSDBText7.Visible;
    rpGPSLblINSS2.Visible       := rpGPSDBText7.Visible;
    rpGPSLbl7Valor2.Visible     := rpGPSDBText7.Visible;
    rpGPSLbl8Valor2.Visible     := rpGPSDBText7.Visible;
    rpGPSLblTerceiros2.Visible  := rpGPSDBText7.Visible;
    rpGPSLblMultaJuros2.Visible := rpGPSDBText7.Visible;
    rpGPSLblTotal2.Visible      := rpGPSDBText7.Visible;

    rpGPS.PrinterSetup.PaperName := cmbTipoPapel.Items[cmbTipoPapel.ItemIndex];
  end;
end;

// -------------------------------------------------------------------------------------
// Funções do Form
// -------------------------------------------------------------------------------------
procedure TfrmGPS.HabilitaBtOk;
begin
  bbtnConfirmar.Enabled := (edCodPagamento.Text <> '') and (dblkcbEstab.Text <> '') and
    (dtVencimento.Text <> '') and (dtPagamento.Text <> '') and (speAno.Text <> '');
end;

end.
