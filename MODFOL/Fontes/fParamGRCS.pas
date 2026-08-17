// *****************************************************************************
// ***************************** REGISTRO DE ALTERAÇÕES ************************
// *****************************************************************************
// Autor(a)    :  Ádler Teodoro de Souza
// Data        :  19/02/2009
// Pendência   : SOL 109421 KINTANA 496332
// Descricao   :  Alteração de gravação de arquivos de log na raiz do disco C: .
//------------------------------------------------------------------------------
unit fParamGRCS;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs, IvDictio,
  IvMulti , IvEMulti, MAHlpBtn, StdCtrls, Buttons, TB97Tlbr, TB97, ExtCtrls, Db, Spin,
  Wwdatsrc, DBTables, Wwquery, IniFiles, checklst, TREdit, ComCtrls, fSairAjuda,
  wwdblook, wwdbdatetimepicker, CMDateTimePicker;

type
  TfrmParamGRCS = class(TfrmSairAjuda)
    gbxTipoPapel: TGroupBox;
    cmbTipoPapel: TComboBox;
    gbxDataProcess: TGroupBox;
    Label1: TLabel;
    Label2: TLabel;
    dtPagtoLimite: TCMDateTimePicker;
    dtPagamento: TCMDateTimePicker;
    qrySindicatos: TwwQuery;
    qryRubricas: TwwQuery;
    gbxOpCalculo: TGroupBox;
    chkbxCorrecao: TCheckBox;
    cbJuros: TCheckBox;
    cbMulta: TCheckBox;
    pnlJuros: TPanel;
    rbPercentJuros: TRadioButton;
    rbValorJuros: TRadioButton;
    pnlMulta: TPanel;
    rbValorMulta: TRadioButton;
    rbPercentMulta: TRadioButton;
    pnlCorrecao: TPanel;
    dblkpCorrecao: TwwDBLookupCombo;
    redJuros: TRealEdit;
    redMulta: TRealEdit;
    qryTestaIndexador: TwwQuery;
    qryIndexador: TwwQuery;
    Label3: TLabel;
    dtVencimento: TCMDateTimePicker;
    gbxSindicato: TGroupBox;
    dblkcbSindicato: TwwDBLookupCombo;
    cmbMes: TComboBox;
    speAno: TSpinEdit;
    Label4: TLabel;
    gbxRubricas: TGroupBox;
    Label5: TLabel;
    Paginas: TPageControl;
    tbshRubRem: TTabSheet;
    chklstRubrica1: TCheckListBox;
    tbshRubContrib: TTabSheet;
    chklstRubrica2: TCheckListBox;
    edCodRubricas: TEdit;
    sbtnMarcarRub: TBitBtn;
    bbtnSelTodos: TBitBtn;
    bbtnInverteSel: TBitBtn;
    bbtnConfirmar: TBitBtn;
    ToolbarSep971: TToolbarSep97;
    procedure FormCreate(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure bbtnConfirmarClick(Sender: TObject);
    procedure chkbxCorrecaoClick(Sender: TObject);
    procedure cbJurosClick(Sender: TObject);
    procedure cbMultaClick(Sender: TObject);
    procedure sbtnMarcarRubClick(Sender: TObject);
    procedure chklstRubrica1DrawItem(Control: TWinControl; Index: Integer;
      Rect: TRect; State: TOwnerDrawState);
    procedure PaginasChange(Sender: TObject);
    procedure bbtnSelTodosClick(Sender: TObject);
    procedure bbtnInverteSelClick(Sender: TObject);
    procedure chklstRubrica1ClickCheck(Sender: TObject);
    procedure dblkcbSindicatoChange(Sender: TObject);
    procedure speAnoChange(Sender: TObject);
    procedure chklstRubrica1KeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
  private
    sCodRubricaRemSel, sCodRubricaContribSel: string;

    procedure LeAlteracoes;
    procedure GravaAlteracoes;
    procedure HabilitaBtOk;
    function  VerificaOpcoesOk: boolean;
  end;

var
  frmParamGRCS: TfrmParamGRCS;

implementation

uses uSistema, uMensErro, uDataBase, fAguarde, dBaseDados,
  uFuncoesUteis, uComumRelats, dRelatorios1;

{$R *.DFM}

procedure TfrmParamGRCS.FormCreate(Sender: TObject);
var
  iPos: integer;
begin
  inherited;
  if not(Assigned(ListaCodRubrica)) then
    ListaCodRubrica := TStringList.Create;

  cmbTipoPapel.Items.Assign (dtmRelatorios1.rpGRCS.PrinterSetup.PaperNames);

  iPos := ProcuraStList (cmbTipoPapel.Items,'A4');
  if (iPos = -1) then
    cmbTipoPapel. ItemIndex := 0
  else
    cmbTipoPapel. ItemIndex := iPos;

  FazQuery(dtmBaseDados.qry,'SELECT NORMALINI FROM PARAMRH');
  dtPagamento.Date   := dtmBaseDados.qry.FieldByName('NORMALINI').asDateTime;
  dtPagtoLimite.Date := dtmBaseDados.qry.FieldByName('NORMALINI').asDateTime;
  dtVencimento.Date  := dtmBaseDados.qry.FieldByName('NORMALINI').asDateTime;
  cmbMes.ItemIndex   := ExtraiMes(dtmBaseDados.qry.FieldByName('NORMALINI').asDateTime) - 1;
  speAno.Text        := Copy(dtmBaseDados.qry.FieldByName('NORMALINI').asString,7,4);

  qryIndexador.Open;
  qrySindicatos.Open;

  // Preenche ChkList das Rubricas
  chklstRubrica1.Items.Clear;
  chklstRubrica2.Items.Clear;
  ListaCodRubrica.Clear;
  with (qryRubricas) do
  begin
    ParamByName('IDEMPRESA').asInteger := Sistema.IdEmpresa;
    Open;
    while not(EOF) do
    begin
      ListaCodRubrica.Add(FieldByName('CODPROVDESC').asString);
      chklstRubrica1.Items.Add(FieldByName('DESCRPROVDESC').asString);
      chklstRubrica2.Items.Add(FieldByName('DESCRPROVDESC').asString);
      Next;
    end;
  end;

  Paginas.ActivePageIndex := 0;

  // Carrega alterações nas opções feitas anteriormente
  LeAlteracoes;
end;

procedure TfrmParamGRCS.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  GravaAlteracoes;

  dtmBaseDados.qry.Close;
  qrySindicatos.Close;
  qryRubricas.Close;     
  qryIndexador.Close;
  inherited;
end;

procedure TfrmParamGRCS.chklstRubrica1DrawItem(Control: TWinControl; Index: Integer;
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

procedure TfrmParamGRCS.dblkcbSindicatoChange(Sender: TObject);
begin
  dblkcbSindicato.Text := Trim(dblkcbSindicato.Text);
  HabilitaBtOk;
end;

procedure TfrmParamGRCS.speAnoChange(Sender: TObject);
begin
  HabilitaBtOk;
end;

procedure TfrmParamGRCS.PaginasChange(Sender: TObject);
begin
  if (Paginas.ActivePage = tbshRubRem) then
    edCodRubricas.Text := sCodRubricaRemSel
  else
    edCodRubricas.Text := sCodRubricaContribSel;
end;

procedure TfrmParamGRCS.chklstRubrica1KeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  if (Key = VK_TAB) then
    chklstRubrica1ClickCheck(Sender);
end;

procedure TfrmParamGRCS.chklstRubrica1ClickCheck(Sender: TObject);
begin
  case (Paginas.ActivePageIndex) of
    0 : begin
          CriaListaOpcoes (chklstRubrica1, ListaCodRubrica, sCodRubricaRemSel, ',', false);
          edCodRubricas.Text := sCodRubricaRemSel;
        end;
    1 : begin
          CriaListaOpcoes (chklstRubrica2, ListaCodRubrica, sCodRubricaContribSel, ',', false);
          edCodRubricas.Text := sCodRubricaContribSel;
        end;
  end;
  InvalidateItemListBox(TCustomListBox(Sender),TCustomListBox(Sender).ItemIndex);
  HabilitaBtOk;
end;

procedure TfrmParamGRCS.sbtnMarcarRubClick(Sender: TObject);
begin
  case (Paginas.ActivePageIndex) of
    0 : chkListAux := chklstRubrica1;
    1 : chkListAux := chklstRubrica2;
  end;

  edCodRubricas.Text := Trim(edCodRubricas.Text);
  VerificaOpcoes (chkListAux, ListaCodRubrica, edCodRubricas.Text, ',');

  case (Paginas.ActivePageIndex) of
    0 : sCodRubricaRemSel := edCodRubricas.Text;
    1 : sCodRubricaContribSel  := edCodRubricas.Text;
  end;

  HabilitaBtOk;
  chkListAux.Repaint;
end;

procedure TfrmParamGRCS.bbtnSelTodosClick(Sender: TObject);
var
  c: integer;
begin
  case (Paginas.ActivePageIndex) of
    0 : begin
          for c:=0 to chklstRubrica1.Items.Count-1 do
            chklstRubrica1.Checked[c] := true;

          CriaListaOpcoes (chklstRubrica1, ListaCodRubrica, sCodRubricaRemSel, ',', false);
          edCodRubricas.Text := sCodRubricaRemSel;
          chklstRubrica1.Repaint;
        end;
    1 : begin
          for c:=0 to chklstRubrica2.Items.Count-1 do
            chklstRubrica2.Checked[c] := true;

          CriaListaOpcoes (chklstRubrica2, ListaCodRubrica, sCodRubricaContribSel, ',', false);
          edCodRubricas.Text := sCodRubricaContribSel;
          chklstRubrica2.Repaint;
        end;
  end;

  HabilitaBtOk;
end;

procedure TfrmParamGRCS.bbtnInverteSelClick(Sender: TObject);
var
  c: integer;
begin
  case (Paginas.ActivePageIndex) of
    0 : begin
          for c:=0 to chklstRubrica1.Items.Count-1 do
            chklstRubrica1.Checked[c] := not(chklstRubrica1.Checked[c]);

          CriaListaOpcoes (chklstRubrica1, ListaCodRubrica, sCodRubricaRemSel, ',', false);
          edCodRubricas.Text := sCodRubricaRemSel;
          chklstRubrica1.Repaint;
        end;
    1 : begin
          for c:=0 to chklstRubrica2.Items.Count-1 do
            chklstRubrica2.Checked[c] := not(chklstRubrica2.Checked[c]);

          CriaListaOpcoes (chklstRubrica2, ListaCodRubrica, sCodRubricaContribSel, ',', false);
          edCodRubricas.Text := sCodRubricaContribSel;
          chklstRubrica2.Repaint;
        end;
  end;

  HabilitaBtOk;
end;

procedure TfrmParamGRCS.chkbxCorrecaoClick(Sender: TObject);
begin
  pnlCorrecao.Visible := chkbxCorrecao.Checked;
end;

procedure TfrmParamGRCS.cbJurosClick(Sender: TObject);
begin
  pnlJuros.Visible := cbJuros.Checked;
  if (cbJuros.Checked) then
    redJuros.SetFocus;
end;

procedure TfrmParamGRCS.cbMultaClick(Sender: TObject);
begin
  pnlMulta.Visible := cbMulta.Checked;
  if (cbMulta.Checked) then
    redMulta.SetFocus;
end;

function TfrmParamGRCS.VerificaOpcoesOk: boolean;
var
  iCorrecao: integer;
  sDataVenc, sDataPgto: string;
begin
  Result := false;

  // Verifica se os valores Informados são válidos
  // Juros
  if (pnlJuros.Visible) then
  begin
    if (redJuros.Value = 0) then
    begin
      MsgDlg('Valor do Juros não pode ser vazio !','Erro', mtInformation,[mbOK,mbHelp],0);
      redJuros.SetFocus;
      exit;
    end;
  end;
  // Multas
  if (pnlMulta.Visible) then
  begin
    if (redMulta.Value = 0) then
    begin
      MsgDlg('Valor da Multa não pode ser Vazio !','Erro', mtInformation,[mbOK,mbHelp],0);
      redMulta.SetFocus;
      exit;
    end;
  end;

  // Verfica se o Tipo de Correção Monetária foi escolhida
  if (pnlCorrecao.Visible) then
  begin
    if (dblkpCorrecao.Text = '') then
    begin
      MsgDlg ('Tipo de Correção Monetária não escolhida !','Erro', mtInformation,[mbOK,mbHelp],0);
      dblkpCorrecao.SetFocus;
      exit;
    end
    else
    begin
      iCorrecao := qryIndexador.FieldByName('MOECODIGO').asInteger;

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
      qryTestaIndexador.ParamByName('MOECODIGO').asInteger := iCorrecao;
      qryTestaIndexador.ParamByName('DATA').asDate         := StrToDate(sDataVenc);
      qryTestaIndexador.Open;

      if (qryTestaIndexador.IsEmpty) then
      begin
        MsgDlg ('Tipo de Correção Monetária, para Vencimento, não cadastrado !','Aviso', mtInformation,[mbOK,mbHelp],0);
        exit;
      end
      else
        dtmRelatorios1.rCorrMonetVenc := qryTestaIndexador.FieldByName('VALOR').asFloat;

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
      qryTestaIndexador.ParamByName('MOECODIGO').asInteger := iCorrecao;
      qryTestaIndexador.ParamByName('DATA').asDate         := StrToDate(sDataPgto);
      qryTestaIndexador.Open;

      if (qryTestaIndexador.IsEmpty) then
      begin
        MsgDlg ('Tipo de Correção Monetária, para Pagamento, não cadastrado !','Aviso', mtInformation,[mbOK,mbHelp],0);
        exit;
      end
      else
        dtmRelatorios1.rCorrMonetPag := qryTestaIndexador.FieldByName('VALOR').asFloat;
    end;
  end
  else
    qryIndexador.Locate ('MOEDESC','REAL',[loCaseInsensitive]);

  Result := true;
end;

procedure TfrmParamGRCS.bbtnConfirmarClick(Sender: TObject);
var
  sPeriodo: string;
begin
  // Verifica se as opções selecionadas estão corretamente selecionadas
  if not(VerificaOpcoesOk) then
  begin
    ModalResult := mrNone;
    exit;
  end;  

  // Rubricas para Remuneração selecionadas
  CriaListaOpcoes (chklstRubrica1, ListaCodRubrica, sCodRubricaRemSel, ',', true);

  // Rubricas para Contribuição selecionadas
  CriaListaOpcoes (chklstRubrica2, ListaCodRubrica, sCodRubricaContribSel, ',', true);
    
  // Guarda o Período escolhido
  sPeriodo := speAno.Text +'/'+ PoeZero(cmbMes.ItemIndex+1);

  dtmRelatorios1.qryGRCS.Close;
  with (dtmRelatorios1.qryGRCS.SQL) do
  begin
    Clear;
    Add('SELECT DISTINCT');
    // Dados do Estabelecimento
    Add('  UPPER(PJ.RAZAOSOCIAL)    AS NOME_ESTAB,');
    Add('  CGC_ESTAB.NUM            AS CGC_ESTAB,');
    Add('  UPPER(E.LOGRADOURO)      AS ENDERECO_ESTAB,');
    Add('  E.NUMERO                 AS NUMERO_ESTAB,');
    Add('  UPPER(E.COMPLEMENTO)     AS COMPLEMENTO_ESTAB,');
    Add('  UPPER(E.BAIRRO)          AS BAIRRO_ESTAB,');
    Add('  UPPER(CIDADES.NOME)      AS CIDADE_ESTAB,');
    Add('  RTRIM(SUBSTR(E.CEP,1,5)) ||''-''|| RTRIM(SUBSTR(E.CEP,6,3)) AS CEP_ESTAB,');
    Add('  ES.CODESTADO             AS UF_ESTAB,');
    // Dados do Sindicato
    Add('  UPPER(PS.RAZAOSOCIAL)    AS NOME_SINDI,');
    Add('  CGC_SINDI.NUM            AS CGC_SINDI,');
    Add('  UPPER(END.LOGRADOURO)    AS ENDERECO_SINDI,');
    Add('  END.NUMERO               AS NUMERO_SINDI,');
    Add('  UPPER(END.COMPLEMENTO)   AS COMPLEMENTO_SINDI,');
    Add('  UPPER(END.BAIRRO)        AS BAIRRO_SINDI,');
    Add('  UPPER(CID.NOME)          AS CIDADE_SINDI,');
    Add('  RTRIM(SUBSTR(END.CEP,1,5)) ||''-''|| RTRIM(SUBSTR(END.CEP,6,3)) AS CEP_SINDI,');
    Add('  ESS.CODESTADO             AS UF_SINDI,');
    Add('  S.REGISTROMT              AS COD_SINDI,');
    Add('  UPPER(ITEMCNAE.DESCRICAO) AS CNAE_NOME,');
    Add('  FP.IDITEMCNAE             AS CNAE_COD,');
    Add('  ('+QuotedStr(dtPagamento.Text)+') AS DATA_LIM_PAG,');
    Add('  ('+QuotedStr(Copy(dtPagamento.Text,7,4))+') AS EXERCICIO,');
    Add('  ('+QuotedStr(Copy(dtPagamento.Text,1,2)+', '+
      MesExtensoAno(Copy(dtPagamento.Text,7,4) +'/'+ Copy(dtPagamento.Text,4,2)))+') AS DATA,');
    Add('  FP.DATAINICIOATIV     AS DATA_INI_ATIVID,');
    Add('  TOT_EMPREGADOS.NUMERO AS NUM_TOT_EMPREGADOS,');
    Add('  TOT_EMPR_CONTR.NUMERO AS NUM_TOT_EMPR_CONTR,');
    Add('  (TOT_EMPREGADOS.NUMERO - TOT_EMPR_CONTR.NUMERO) AS NUM_TOT_EMPR_NAO_CONTR,');
    Add('  (NVL(NUM_FILIAIS.NUM,0)+1) AS NUM_ESTAB,');
    Add('  FP.INDTIPOEMPRESA,');
    Add('  VLR_TOT_REM.VALOR     AS TOT_REM,');
    Add('  VLR_TOT_CONTRIB.VALOR AS VAL_CONTRIB,');
    // ------------------------------------------------------------------ //
    // Se Existir Juros
    if (cbJuros.Checked) then
    begin
      Add('  ('+QuotedStr(FloatToStr(redJuros.Value))+') AS JUROS,');
      // Testa se Juros é por Percentual ou Valor
      if (rbPercentJuros.Checked) then
        Add('  (''P'') AS TJUROS,')
      else
        Add('  (''V'') AS TJUROS,');
    end
    else
      Add('  (0) AS JUROS, (''V'') AS TJUROS,');
    // ------------------------------------------------------------------ //
    // Se Existir Multa
    if (cbMulta.Checked) Then
    begin
      Add('  ('+QuotedStr(FloatToStr(redMulta.Value))+') AS MULTA,');
      // Testa se Juros é por Percentual ou Valor
      if (rbPercentMulta.Checked) then
        Add('  (''P'') AS TMULTA')
      else
        Add('  (''V'') AS TMULTA');
    end
    else
      Add('  (0) AS MULTA, (''V'') AS TMULTA');
    // ------------------------------------------------------------------ //
    Add('FROM');
    Add('  PESSOA PS, PESSOA PJ, ENDPESS E, ENDPESS END, CIDADES, CIDADES CID,');
    Add('  ESTADO ES, ESTADO ESS, ITEMCNAE, FILIALPESSOA FP, SINDICATO S,');
    // -------------------------------------------------------------------- //
    // CGC da Empresa
    Add('  (SELECT FP.IDFILIALPESSOA AS IDPESSOA, RTRIM(DO.NUMDOCUMENTO) AS NUM');
    Add('   FROM   DOCPESSOA DO, TIPODOCOFICIAL TDO, FILIALPESSOA FP');
    Add('   WHERE ((TDO.SIGLADOCUMENTO = ''CNPJ:'')       OR');
    Add('          (TDO.SIGLADOCUMENTO = ''CGC:''))      AND');
    Add('         (TDO.IDDOCUMENTO     = DO.IDDOCUMENTO) AND');
    Add('         (FP.IDFILIALPESSOA   = DO.IDPESSOA)) CGC_ESTAB,');
    // -------------------------------------------------------------------- //
    // CGC da Empresa
    Add('  (SELECT S.IDPESSOA, RTRIM(DO.NUMDOCUMENTO) AS NUM');
    Add('   FROM   DOCPESSOA DO, TIPODOCOFICIAL TDO, SINDICATO S');
    Add('   WHERE ((TDO.SIGLADOCUMENTO = ''CNPJ:'')  OR');
    Add('          (TDO.SIGLADOCUMENTO = ''CGC:'')) AND');
    Add('         (TDO.IDDOCUMENTO     = DO.IDDOCUMENTO) AND');
    Add('         (S.IDPESSOA          = DO.IDPESSOA)) CGC_SINDI,');
    // -------------------------------------------------------------------- //
    // Número Total de Funcionários no mês anterior ao Pagamento
    Add('  (SELECT PEFIS.IDSINDICATO, COUNT(F.IDPESSOA) AS NUMERO');
    Add('   FROM');
    Add('     HISTRUBSAL H, PESSOAFISICA PEFIS, RUBRICAXPESS RP, FUNCIONARIO F,');
    Add('     SITFUNC ST, SINDICATO S');
    Add('   WHERE');
    Add('     (S.IDPESSOA        = '+qrySindicatos.FieldByName('IDPESSOA').asString+') AND');
    Add('     ((ST.TIPOSIT      <> ''D'')           OR');
    Add('      ((TO_CHAR(F.DATADESLIGAMENTO,''YYYY/MM/DD'') > '''+
      sPeriodo +'/'+ PoeZero(TrazUltDiaMes(cmbMes.ItemIndex+1, speAno.Value)) +''')  AND');
    Add('       (ST.TIPOSIT      = ''D'')))        AND');
    Add('     (F.TIPOCONTRATO   <> ''G'')          AND');
    Add('     (TO_CHAR(F.DATAADMISSAO,''YYYY/MM/DD'') <= '''+
      sPeriodo +'/'+ PoeZero(TrazUltDiaMes(cmbMes.ItemIndex+1, speAno.Value)) +''')  AND');

    if (Pos(',',sCodRubricaContribSel) > 0) then
      Add('     (RP.CODPROVDESC   IN (' +sCodRubricaContribSel+ ')) AND')
    else
      Add('     (RP.CODPROVDESC    = ' +sCodRubricaContribSel+ ') AND');

    Add('     (H.MES             = '+QuotedStr(sPeriodo)+') AND');
    Add('     (ST.IDSITFUNC      = F.IDSITFUNC)       AND');
    Add('     (F.IDPESSOA        = PEFIS.IDPESSOA)    AND');
    Add('     (S.IDPESSOA        = PEFIS.IDSINDICATO) AND');
    Add('     (RP.IDRUBRICA      = H.IDRUBRICA)       AND');
    Add('     (F.IDPESSOA        = H.IDPESSOA)');
    Add('   GROUP BY PEFIS.IDSINDICATO) TOT_EMPR_CONTR,');
    // -------------------------------------------------------------------- //
    // Número de Funcionários Contribuintes no mês anterior ao Pagamento
    Add('  (SELECT FP.IDFILIALPESSOA AS IDEMPRESA, COUNT(F.IDPESSOA) AS NUMERO');
    Add('   FROM');
    Add('     FUNCIONARIO F, SITFUNC ST, FILIALPESSOA FP');
    Add('   WHERE');
    Add('     ((ST.TIPOSIT    <> ''D'')    OR');
    Add('      ((TO_CHAR(F.DATADESLIGAMENTO,''YYYY/MM/DD'') > '''+
      sPeriodo +'/'+ PoeZero(TrazUltDiaMes(cmbMes.ItemIndex+1, speAno.Value)) +''') AND');
    Add('       (ST.TIPOSIT    = ''D''))) AND');
    Add('     (F.TIPOCONTRATO <> ''G'')   AND');
    Add('     (TO_CHAR(F.DATAADMISSAO,''YYYY/MM/DD'') <= '''+
      sPeriodo +'/'+ PoeZero(TrazUltDiaMes(cmbMes.ItemIndex+1, speAno.Value)) +''') AND');

    Add('     (ST.IDSITFUNC   = F.IDSITFUNC) AND');
    Add('     (F.IDESTAB      = FP.IDFILIALPESSOA)');
    Add('   GROUP BY FP.IDFILIALPESSOA) TOT_EMPREGADOS,');
    // -------------------------------------------------------------------------------- //
    // Total da Contribuição por Sindicato
    Add('  (SELECT S.IDPESSOA, SUM(H.VALORPROVENTO) AS VALOR');
    Add('   FROM   HISTRUBSAL H, PESSOAFISICA P, FUNCIONARIO F, RUBRICAXPESS RP, SINDICATO S');
    Add('   WHERE');
    Add('     (S.IDPESSOA      = ' +qrySindicatos.FieldByName('IDPESSOA').asString+') AND');
    if (Pos(',',sCodRubricaContribSel) > 0) then
      Add('     (RP.CODPROVDESC IN (' +sCodRubricaContribSel+ ')) AND')
    else
      Add('     (RP.CODPROVDESC  = ' +sCodRubricaContribSel+ ') AND');
    Add('     (H.MES           = '+QuotedStr(sPeriodo)+') AND');
    Add('     (RP.IDRUBRICA    = H.IDRUBRICA) AND');
    Add('     (F.IDPESSOA      = P.IDPESSOA)  AND');
    Add('     (P.IDPESSOA      = H.IDPESSOA)  AND');
    Add('     (P.IDSINDICATO   = S.IDPESSOA)');
    Add('   GROUP BY S.IDPESSOA) VLR_TOT_CONTRIB,');
    // -------------------------------------------------------------------------------- //
    // Total da Remuneração por Sindicato
    Add('  (SELECT S.IDPESSOA, SUM(H.VALORPROVENTO) AS VALOR');
    Add('   FROM');
    Add('     HISTRUBSAL H, PESSOAFISICA PEFIS, RUBRICAXPESS RP, FUNCIONARIO F,');
    Add('     SITFUNC ST, SINDICATO S,');
    Add('     (SELECT PEFIS.IDPESSOA');
    Add('      FROM');
    Add('        HISTRUBSAL H, PESSOAFISICA PEFIS, RUBRICAXPESS RP, FUNCIONARIO F,');
    Add('        SITFUNC ST');
    Add('      WHERE');
    Add('        (PEFIS.IDSINDICATO = '+qrySindicatos.FieldByName('IDPESSOA').asString+') AND');
    Add('        ((ST.TIPOSIT      <> ''D'')           OR');
    Add('        ((TO_CHAR(F.DATADESLIGAMENTO,''YYYY/MM/DD'') > '''+
      sPeriodo +'/'+ PoeZero(TrazUltDiaMes(cmbMes.ItemIndex+1, speAno.Value)) +''')  AND');
    Add('         (ST.TIPOSIT       = ''D'')))        AND');
    Add('        (F.TIPOCONTRATO   <> ''G'')          AND');
    if (Pos(',',sCodRubricaContribSel) > 0) then
      Add('        (RP.CODPROVDESC IN (' +sCodRubricaContribSel+ ')) AND')
    else
      Add('        (RP.CODPROVDESC    = ' +sCodRubricaContribSel+ ') AND');
    Add('        (TO_CHAR(F.DATAADMISSAO,''YYYY/MM/DD'') <= '''+
      sPeriodo +'/'+ PoeZero(TrazUltDiaMes(cmbMes.ItemIndex+1, speAno.Value)) +''')  AND');
    Add('        (H.MES             = '+QuotedStr(sPeriodo)+') AND');
    Add('        (RP.IDRUBRICA      = H.IDRUBRICA) AND');
    Add('        (ST.IDSITFUNC      = F.IDSITFUNC)       AND');
    Add('        (F.IDPESSOA        = PEFIS.IDPESSOA)    AND');
    Add('        (F.IDPESSOA        = H.IDPESSOA)) NAO_TEM');
    Add('   WHERE');
    Add('     (S.IDPESSOA        = '+qrySindicatos.FieldByName('IDPESSOA').asString+') AND');
    Add('     ((ST.TIPOSIT      <> ''D'')           OR');
    Add('     ((TO_CHAR(F.DATADESLIGAMENTO,''YYYY/MM/DD'') > '''+
      sPeriodo +'/'+ PoeZero(TrazUltDiaMes(cmbMes.ItemIndex+1, speAno.Value)) +''')  AND');
    Add('      (ST.TIPOSIT       = ''D'')))        AND');
    Add('     (F.TIPOCONTRATO   <> ''G'')          AND');
    if (Pos(',',sCodRubricaRemSel) > 0) then
      Add('     (RP.CODPROVDESC IN (' +sCodRubricaRemSel+ ')) AND')
    else
      Add('     (RP.CODPROVDESC    = ' +sCodRubricaRemSel+ ') AND');
    Add('     (TO_CHAR(F.DATAADMISSAO,''YYYY/MM/DD'') <= '''+
      sPeriodo +'/'+ PoeZero(TrazUltDiaMes(cmbMes.ItemIndex+1, speAno.Value)) +''')  AND');
    Add('     (H.MES             = '+QuotedStr(sPeriodo)+') AND');
    Add('     (RP.IDRUBRICA      = H.IDRUBRICA) AND');
    Add('     (ST.IDSITFUNC      = F.IDSITFUNC)       AND');
    Add('     (F.IDPESSOA        = PEFIS.IDPESSOA)    AND');
    Add('     (S.IDPESSOA        = PEFIS.IDSINDICATO) AND');
    Add('     (F.IDPESSOA        = H.IDPESSOA)        AND');
    Add('     (F.IDPESSOA        = NAO_TEM.IDPESSOA)');
    Add('   GROUP BY S.IDPESSOA) VLR_TOT_REM,');
    // -------------------------------------------------------------------------------- //
    // Número de Filiais do Estabalecimento
    Add('  (SELECT FP1.IDFILIALPESSOA AS IDPESSOA, COUNT(P.IDPESSOA) AS NUM');
    Add('   FROM   PESSOA P, FILIALPESSOA FP1, FILIALPESSOA FP2');
    Add('   WHERE (FP1.IDFILIALPESSOA = P.IDPESSOA) AND');
    Add('         (FP2.IDFILIALPESSOA = P.IDGRUPO)');
    Add('   GROUP BY FP1.IDFILIALPESSOA) NUM_FILIAIS');
    // ------------------------------------------------------------------ //
    Add('WHERE');
    Add('  (S.IDPESSOA            = ' +qrySindicatos.FieldByName('IDPESSOA').asString+ ') AND');
    Add('  (FP.IDITEMCNAE         = ITEMCNAE.IDITEMCNAE) AND');
    Add('  (FP.IDFILIALPESSOA     = PJ.IDPESSOA)         AND');
    Add('  (PJ.IDPESSOA           = CGC_ESTAB.IDPESSOA)  AND');
    Add('  (PJ.IDPESSOA           = TOT_EMPREGADOS.IDEMPRESA) AND');
    Add('  (PJ.IDPESSOA           = E.IDPESSOA)          AND');
    Add('  (PJ.IDENDCOMERCIAL     = E.IDENDERECO)        AND');
    Add('  (E.IDCIDADES           = CIDADES.IDCIDADES)   AND');
    Add('  (CIDADES.IDESTADO      = ES.IDESTADO)         AND');
    Add('  (TOT_EMPR_CONTR.IDSINDICATO = S.IDPESSOA)     AND');
    Add('  (S.IDPESSOA            = PS.IDPESSOA)         AND');
    Add('  (VLR_TOT_REM.IDPESSOA  = PS.IDPESSOA)         AND');
    Add('  (VLR_TOT_CONTRIB.IDPESSOA = PS.IDPESSOA)      AND');
    Add('  (PS.IDPESSOA           = END.IDPESSOA)        AND');
    Add('  (PS.IDENDCOMERCIAL     = END.IDENDERECO)      AND');
    Add('  (END.IDCIDADES         = CID.IDCIDADES)       AND');
    Add('  (CID.IDESTADO          = ESS.IDESTADO)        AND');
    Add('  (FP.IDFILIALPESSOA     = NUM_FILIAIS.IDPESSOA(+)) AND');
    Add('  (S.IDPESSOA            = CGC_SINDI.IDPESSOA(+))');
    Add('ORDER BY NOME_SINDI');
    //SaveToFile ('c:\qry.txt');
    SaveToFile (Sistema.RetornaCaminhoArquivos(Sistema.IdEmpresa)+'\qry.txt'); //Ádler Teodoro de Souza SOL 109421 KINTANA 496332
  end;

  dtmRelatorios1.rpGRCS.PrinterSetup.PaperName := cmbTipoPapel.Items[cmbTipoPapel.ItemIndex];

  frmAguarde.Mostra('Impresso GRCS');
  frmAguarde.Pos := 0;
  dtmRelatorios1.qryGRCS.Open;

  if (dtmRelatorios1.qryGRCS.IsEmpty) then
  begin
    ModalResult := mrNone;
    frmAguarde.Apaga;
    MsgDlg('Não há dados a serem exibidos! Verifique.','Aviso',mtInformation,[mbOk,mbHelp],0);
  end
  else
    ModalResult := mrOk;
end;

// -------------------------------------------------------------------------------------
// Funções do Form
// -------------------------------------------------------------------------------------
procedure TfrmParamGRCS.LeAlteracoes;
begin
  // Recupera as últimas alterações das opções
  //ArqConfig := TIniFile.Create('C:\CONFIG_FOLHAPAGTO.INI');
  ArqConfig := TIniFile.Create(Sistema.RetornaCaminhoArquivos(Sistema.IdEmpresa)+'\CONFIG_FOLHAPAGTO.INI');//Ádler Teodoro de Souza SOL 109421 KINTANA 496332

  sCodRubricaRemSel := ArqConfig.ReadString ('REL_GRCS', 'RubRem', '');
  VerificaOpcoes(chklstRubrica1, ListaCodRubrica, sCodRubricaRemSel, ',');

  sCodRubricaContribSel := ArqConfig.ReadString ('REL_GRCS', 'RubContrib', '');
  VerificaOpcoes(chklstRubrica2, ListaCodRubrica, sCodRubricaContribSel, ',');

  edCodRubricas.Text := sCodRubricaRemSel;
end;

procedure TfrmParamGRCS.GravaAlteracoes;
var
  sGravaPadrao: string;
begin
  // Grava as últimas alterações da Opção de Rubricas para Remuneração
  CriaListaOpcoes (chklstRubrica1, ListaCodRubrica, sGravaPadrao, ',', false);
  ArqConfig.WriteString ('REL_GRCS','RubRem',sGravaPadrao);

  // Grava as últimas alterações da Opção de Rubricas para Cotribuição
  CriaListaOpcoes (chklstRubrica2, ListaCodRubrica, sGravaPadrao, ',', false);
  ArqConfig.WriteString ('REL_GRCS','RubContrib',sGravaPadrao);
end;

procedure TfrmParamGRCS.HabilitaBtOk;
var
  c: integer;
  bSelRub1, bSelRub2: boolean;
begin
  bSelRub1 := false;
  for c:=0 to chklstRubrica1.Items.Count-1 do
    if (chklstRubrica1.Checked[c]) then
    begin
      bSelRub1 := true;
      break;
    end;

  bSelRub2 := false;
  for c:=0 to chklstRubrica2.Items.Count-1 do
    if (chklstRubrica2.Checked[c]) then
    begin
      bSelRub2 := true;
      break;
    end;

  bbtnConfirmar.Enabled := (bSelRub1) and (bSelRub2) and
    (Trim(dblkcbSindicato.Text) <> '') and (Trim(speAno.Text)        <> '') and
    (Trim(dtVencimento.Text)    <> '') and (Trim(dtPagtoLimite.Text) <> '') and
    (Trim(dtPagamento.Text)     <> '');
end;

end.
