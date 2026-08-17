// *****************************************************************************
// ***************************** REGISTRO DE ALTERAÇÕES ************************
// *****************************************************************************
// Autor(a)    :  Ádler Teodoro de Souza
// Data        :  19/02/2009
// Pendência   : SOL 109421 KINTANA 496332
// Descricao   :  Alteração de gravação de arquivos de log na raiz do disco C: .
//------------------------------------------------------------------------------
unit fParamTermRescisContr;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs, MAHlpBtn, StdCtrls,
  Buttons, TB97Tlbr, TB97, ExtCtrls, Db, DBTables, Wwquery, wwdblook, Spin, checklst, IvDictio,
  IvMulti, IvEMulti, wwdbdatetimepicker, CMDateTimePicker, fSairAjuda;

type
  TfrmParamTermRescisContr = class(TfrmSairAjuda)
    qryEstab: TwwQuery;
    gbxEstab: TGroupBox;
    dblkcbEstab: TwwDBLookupCombo;
    gbxFunc: TGroupBox;
    chklstFunc: TCheckListBox;
    gbxAnoMesRef: TGroupBox;
    gbxTipoPapel: TGroupBox;
    cmbMes: TComboBox;
    speAno: TSpinEdit;
    cmbTipoPapel: TComboBox;
    gbxResp: TGroupBox;
    dblkcbResp: TwwDBLookupCombo;
    qryResp: TwwQuery;
    rgExibeCCusto: TRadioGroup;
    rgProcesso: TRadioGroup;
    rgMotivo: TRadioGroup;
    qryMotivo: TwwQuery;
    gbxFolhaResc: TGroupBox;
    dblcMotivo: TwwDBLookupCombo;
    bbtnSelTodosFunc: TBitBtn;
    bbtnInverteSelFunc: TBitBtn;
    gbxIntervRef: TGroupBox;
    Label1: TLabel;
    Label2: TLabel;
    dtedIni: TCMDateTimePicker;
    dtedFin: TCMDateTimePicker;
    bbtnConfirmar: TBitBtn;
    ToolbarSep971: TToolbarSep97;
    procedure FormCreate(Sender: TObject);
    procedure bbtnConfirmarClick(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure dblkcbEstabChange(Sender: TObject);
    procedure rgMotivoClick(Sender: TObject);
    procedure chklstFuncDrawItem(Control: TWinControl; Index: Integer; Rect: TRect;
      State: TOwnerDrawState);
    procedure dblkcbRespChange(Sender: TObject);
    procedure bbtnSelTodosFuncClick(Sender: TObject);
    procedure bbtnInverteSelFuncClick(Sender: TObject);
    procedure cmbMesChange(Sender: TObject);
    procedure chklstFuncClickCheck(Sender: TObject);
    procedure dtedIniChange(Sender: TObject);
    procedure chklstFuncKeyDown(Sender: TObject; var Key: Word; Shift: TShiftState);
  private
    procedure HabilitaBtOk;
    procedure MontaListaFuncionarios;
  end;

var
  frmParamTermRescisContr: TfrmParamTermRescisContr;

implementation

uses uSistema, uMensErro, uDataBase, uFuncoesUteis, UsoGeralRH, uComumRelats, fAguarde,
  dBaseDados, dRelatorios2;

{$R *.DFM}

procedure TfrmParamTermRescisContr.FormCreate(Sender: TObject);
var
  iPos: integer;
begin
  inherited;
  if not(Assigned(ListaCodFunc)) then
    ListaCodFunc := TStringList.Create;
  IDEstab := -1;

  cmbTipoPapel.Items.Assign(dtmRelatorios2.rpTermRescisContr.PrinterSetup.PaperNames);

  iPos := ProcuraStList(cmbTipoPapel.Items, 'A4');
  if (iPos = -1) then
    cmbTipoPapel.ItemIndex := 0
  else
    cmbTipoPapel.ItemIndex := iPos;

  FazQuery(dtmBaseDados.qry,'SELECT NORMALINI,NORMALFIM FROM PARAMRH');
  cmbMes.ItemIndex := ExtraiMes(dtmBaseDados.qry.FieldByName('NORMALINI').asDateTime) - 1;
  speAno.Text := Copy(dtmBaseDados.qry.FieldByName('NORMALINI').asString,7,4);
  dtedIni.Date := dtmBaseDados.qry.FieldByName('NORMALINI').asDateTime;
  dtedFin.Date := dtmBaseDados.qry.FieldByName('NORMALFIM').asDateTime;

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

  HabilitaBtOk;
end;

procedure TfrmParamTermRescisContr.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  dtmBaseDados.qry.Close;
  qryEstab.Close;
  qryMotivo.Close;
  qryResp.Close;
  inherited;
end;

procedure TfrmParamTermRescisContr.chklstFuncDrawItem(Control: TWinControl; Index: Integer;
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

procedure TfrmParamTermRescisContr.dblkcbEstabChange(Sender: TObject);
begin
  if (qryEstab.FieldByName('IDPESSOA').asInteger <> IDEstab) then
  begin
    MontaListaFuncionarios;
    IDEstab := qryEstab.FieldByName('IDPESSOA').asInteger;
    chklstFunc.Repaint;
  end;
end;

procedure TfrmParamTermRescisContr.cmbMesChange(Sender: TObject);
begin
  MontaListaFuncionarios;
end;

procedure TfrmParamTermRescisContr.dtedIniChange(Sender: TObject);
begin
  try
    StrToDate(TEdit(Sender).Text);
    MontaListaFuncionarios;
  except
  end;
end;

procedure TfrmParamTermRescisContr.dblkcbRespChange(Sender: TObject);
begin
  HabilitaBtOk;
end;

procedure TfrmParamTermRescisContr.chklstFuncKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  if (Key = VK_TAB) then
    chklstFuncClickCheck(Sender);
end;

procedure TfrmParamTermRescisContr.chklstFuncClickCheck(Sender: TObject);
begin
  InvalidateItemListBox(TCustomListBox(Sender),TCustomListBox(Sender).ItemIndex);
  HabilitaBtOk;
end;

procedure TfrmParamTermRescisContr.bbtnSelTodosFuncClick(Sender: TObject);
var
  c: integer;
begin
  for c:=0 to chklstFunc.Items.Count-1 do
    chklstFunc.Checked[c] := true;
  chklstFunc.Repaint;
  HabilitaBtOk;
end;

procedure TfrmParamTermRescisContr.bbtnInverteSelFuncClick(Sender: TObject);
var
  c: integer;
begin
  for c:=0 to chklstFunc.Items.Count-1 do
    chklstFunc.Checked[c] := not(chklstFunc.Checked[c]);
  chklstFunc.Repaint;
  HabilitaBtOk;
end;

procedure TfrmParamTermRescisContr.rgMotivoClick(Sender: TObject);
begin
  gbxFolhaResc.Visible := (rgMotivo.ItemIndex = 2);
  if (rgMotivo.ItemIndex = 2) and not(qryMotivo.Active) then
    qryMotivo.Open;
end;

procedure TfrmParamTermRescisContr.bbtnConfirmarClick(Sender: TObject);
var
  NomeTabela: string;
begin
  if (rgProcesso.ItemIndex = 0) then
    NomeTabela := ' PREVIAFOLPAG '
  else
    NomeTabela := ' HISTRUBSAL ';

  // Funcionário selecionados
  CriaListaOpcoes(chklstFunc, ListaCodFunc, sCodFuncSel, ',', false);

  // Monta a Query
  dtmRelatorios2.qryTermRescisContr.Close;
  with (dtmRelatorios2.qryTermRescisContr.SQL) do
  begin
    Clear;
    Add('SELECT DISTINCT');
    Add('  RTRIM(PJ.RAZAOSOCIAL) AS EMPRESA,');
    Add('  RTRIM(CONTATO.NOME) || DECODE(RTRIM(CONTATO.CARGO),NULL,NULL,'' - ''||RTRIM(CONTATO.CARGO)) AS CONTATO,');
    Add('  DECODE(PJ.NUMDOCUMENTO,NULL,NULL,''CNPJ: '' || PJ.NUMDOCUMENTO) AS CGC,');
    Add('  FP.IDITEMCNAE,');
    Add('  RTRIM(E.LOGRADOURO) ||'', ''|| E.NUMERO || DECODE(E.COMPLEMENTO,NULL,NULL,'' - '' ||');
    Add('    RTRIM(E.COMPLEMENTO)) AS ENDERECO,');
    Add('  E.BAIRRO,');
    Add('  CIDADES.NOME AS CIDADE,');
    Add('  ES.CODESTADO AS UF,');
    Add('  RTRIM(SUBSTR(E.CEP,1,5)) ||''-''|| RTRIM(SUBSTR(E.CEP,6,3)) AS CEP,');
    Add('  RTRIM(PF.NOME) AS EMPREGADO,');
    Add('  (NVL(PENSAOALIM.VALOR,0) || '' %'') AS PENSAOALIM,');
    if (rgExibeCCusto.ItemIndex = 0) then
      Add('  RTRIM(CC.NOME) AS C_CUSTO,');
    Add('  C.TITULO AS FUNCAO,');
    Add('  RTRIM(CTPS.NUM) AS CTPS_NUM,');
    Add('  DECODE(CTPS.UF,NULL,NULL,''/''||CTPS.UF) AS CTPS_UF,');
    Add('  CTPS.MASCARA AS MASCARA_CTPS,');
    Add('  PIS.NUM AS PIS,');
    Add('  PIS.MASCARA AS MASCARA_PIS,');
    Add('  F.MATRICULA, F.DATAADMISSAO, F.DATAOPCAOFGTS, F.DATAAVISO,');
    Add('  F.CODCENTROCUSTO AS DIVISAO, F.DATADESLIGAMENTO, PFIS.DATANASC,');
    Add('  F.HOMOLOGACAONUMERO AS DATAHOMOLOGACAO,');
    Add('  MO_SAI.DESCRICAO AS MOTIVOSAIDA,');
    Add('  F.IDFORMARESC AS MOTIVOFGTS,');
    Add('  AG.NUMAGENCIA,');
    Add('  PA.NOME AS NOMEAGENCIA,');
    Add('  PB.NOME AS NOMEBANCO,');
    Add('  RP.CODPROVDESC AS CODRUBRICA,');
    Add('  RP.DESCRPROVDESC AS RUBRICA,');
    Add('  P.FLGDESCONTO AS TIPORUBRICA,');
    Add('  NVL(MAIOR_REM.VALOR,0) AS MAIOR_REMUNERACAO,');
    Add('  RTRIM(DECODE(RTRIM(H.REFERENCIA),''***'','''',''Ferias'','''',''Férias'','''',');
    Add('    ''13.o Salar'','''',''Rescisao'','''',''Rescisão'','''',H.REFERENCIA)) AS REFERENCIA,');
    Add('  DECODE(P.FLGDESCONTO,0,H.VALORPROVENTO,-H.VALORPROVENTO) AS VALOR,');
    Add('  DECODE(P.FLGDESCONTO,0,H.VALORPROVENTO,0) AS PROVENTOS,');
    Add('  DECODE(P.FLGDESCONTO,1,H.VALORPROVENTO,0) AS DESCONTOS');
    Add('FROM');
    Add('  ' +NomeTabela+ ' H, PESSOA PJ, PESSOA PF, PESSOA PB, PESSOA PA, PROVDESC P,');
    Add('  RUBRICAXPESS RP, PESSOAFISICA PFIS, FUNCIONARIO F, CARGO C, ENDPESS E,');
    Add('  BANCO B, AGENCIABANCARIA AG, CIDADES, ESTADO ES, MOTIVO MO, MOTIVO MO_SAI, ' +
      IFF(rgExibeCCusto.ItemIndex = 0,'CENTCUST CC, ','')+ 'SITFUNC S, FILIALPESSOA FP,');
    // -------------------------------------------------------------------- //
    // Percentual de Pensão Alimentícia do Funcionário
    Add('  (SELECT RI.IDPESSOA, RI.VALORRUBRICA AS VALOR');
    Add('   FROM   RUBRICAINDIV RI, PROVDESC PD');
    Add('   WHERE (PD.CODRUBCLT    = ''50018'') AND');

    // Funcionários escolhidos
    if (Pos(',',sCodFuncSel) > 0) then
      Add('         (RI.IDPESSOA    IN (' +sCodFuncSel+ ')) AND')
    else
      Add('         (RI.IDPESSOA     = ' +sCodFuncSel+ ') AND');

    Add('         (RI.VALORRUBRICA < 100) AND');
    Add('         (PD.IDPROVENTO   = RI.IDRUBRICA)) PENSAOALIM,');
    // ------------------------------------------------------------------- //
    // Contato do Funcionário
    Add('  (SELECT IDENDERECO, NOME, CARGO');
    Add('   FROM   CONTATOPESS');
    Add('   WHERE (IDCONTATO = '+qryResp.FieldByName('IDCONTATO').asString+')) CONTATO,');
    // -------------------------------------------------------------------- //
    // Maior Remuneração do Funcionário
    Add('  (SELECT H.IDPESSOA, SUM(H.VALORPROVENTO) AS VALOR');
    Add('   FROM   ' +NomeTabela+ ' H, PROVDESC P, FUNCIONARIO F');
    Add('   WHERE  (P.CODRUBCLT  = ''63012'') AND');

    // Funcionários escolhidos
    if (Pos(',',sCodFuncSel) > 0) then
      Add('          (H.IDPESSOA  IN (' +sCodFuncSel+ ')) AND')
    else
      Add('          (H.IDPESSOA   = ' +sCodFuncSel+ ') AND');

    Add('          (H.IDPESSOA   = F.IDPESSOA) AND');  
    case (rgMotivo.ItemIndex) of
      0 : Add('          (H.IDMOTIVO   = F.IDMOTIVODESLIGRAIS) AND');
      1 : Add('          (H.IDMOTIVO   = F.IDMOTIVODESLIGGERENCIAL) AND');
      2 : Add('          (H.IDMOTIVO   = ' +qryMotivo.FieldByName('IDMOTIVO').asString+ ') AND');
    end;

    Add('          (H.MES        = '+QuotedStr(IntToStr(speAno.Value) +'/'+
      PoeZero(cmbMes.ItemIndex+1))+') AND');
    Add('          (P.IDPROVENTO = H.IDRUBRICA)');
    Add('   GROUP BY');
    Add('     H.IDPESSOA, P.IDPROVENTO) MAIOR_REM,');
    // -------------------------------------------------------------------- //
    // CTPS do Funcionário
    Add('  (SELECT DP.IDPESSOA, TDP.MASCARA, DP.NUMDOCUMENTO AS NUM, ES.CODESTADO AS UF');
    Add('   FROM   DOCPESSOA DP, ESTADO ES, TIPODOCPESSOA TDP, TIPODOCOFICIAL TDO, PAIS PA');
    Add('   WHERE (TDO.SIGLADOCUMENTO = ''CTPS:'') AND');
    Add('         (TDO.IDDOCUMENTO    = TDP.IDDOCUMENTO) AND');
    Add('         (TDO.IDDOCUMENTO    = DP.IDDOCUMENTO) AND');
    Add('         (DP.IDPAIS          = PA.IDPAIS) AND');
    Add('         (PA.IDPAIS          = ES.IDPAIS) AND');
    Add('         (DP.IDESTADO        = ES.IDESTADO)) CTPS,');
    // -------------------------------------------------------------------- //
    // PIS do Funcionário
    Add('  (SELECT DO.IDPESSOA, TDP.MASCARA, RTRIM(DO.NUMDOCUMENTO) AS NUM');
    Add('   FROM   DOCPESSOA DO, TIPODOCPESSOA TDP, TIPODOCOFICIAL TDO');
    Add('   WHERE  ((TDO.SIGLADOCUMENTO = ''PIS:'') OR');
    Add('           (TDO.SIGLADOCUMENTO = ''PIS/PASEP:'')) AND');
    Add('          (TDO.IDDOCUMENTO     = DO.IDDOCUMENTO) AND');
    Add('          (TDP.IDDOCUMENTO     = DO.IDDOCUMENTO)) PIS');
    // -------------------------------------------------------------------------- //
    Add('WHERE');
    Add('  (PJ.IDPESSOA                 = '+qryEstab.FieldByName('IDPESSOA').asString+') AND');

    // Funcionários escolhidos
    if (Pos(',',sCodFuncSel) > 0) then
    begin
      Add('  (F.IDPESSOA          IN (' +sCodFuncSel+ ')) AND');
      Add('  (PF.IDPESSOA         IN (' +sCodFuncSel+ ')) AND');
    end
    else
    begin
      Add('  (F.IDPESSOA           = ' +sCodFuncSel+ ') AND');
      Add('  (PF.IDPESSOA          = ' +sCodFuncSel+ ') AND');
    end;

    Add('  (S.TIPOSIT            = ''D'') AND');
    Add('  ((P.CODRUBCLT        <> ''63012'') OR');
    Add('   (P.CODRUBCLT        IS NULL)) AND');
    Add('  (P.FLGDESCONTO        < 2) AND');
    Add('  (H.IDPESSJUR          = ' +IntToStr(Sistema.IDEmpresa)+ ') AND');
    Add('  (H.MES                = ' +QuotedStr(IntToStr(speAno.Value) +'/'+ PoeZero(cmbMes.ItemIndex+1))+ ') AND');
    Add('  (PJ.IDPESSOA          = FP.IDFILIALPESSOA) AND');
    Add('  (S.IDSITFUNC          = F.IDSITFUNC) AND');
    Add('  (F.IDMOTIVODESLIGRAIS = MO_SAI.IDMOTIVO) AND');

    case (rgMotivo.ItemIndex) of
      0 :
      begin
        Add('  (F.IDMOTIVODESLIGRAIS = H.IDMOTIVO) AND');
        Add('  (F.IDMOTIVODESLIGRAIS = MO.IDMOTIVO) AND');
      end;
      1 :
      begin
        Add('  (F.IDMOTIVODESLIGGERENCIAL = H.IDMOTIVO) AND');
        Add('  (F.IDMOTIVODESLIGGERENCIAL = MO.IDMOTIVO) AND');
      end;
      2 :
      begin
        Add('  (H.IDMOTIVO   = ' +qryMotivo.FieldByName('IDMOTIVO').asString+ ') AND');
        Add('  (MO.IDMOTIVO  = ' +qryMotivo.FieldByName('IDMOTIVO').asString+ ') AND');
      end;
    end;

    Add('  (F.IDAGENCIAFGTS      = AG.IDPESSOA) AND');
    Add('  (B.IDPESSOA           = PB.IDPESSOA) AND');
    Add('  (B.IDPESSOA           = AG.IDBANCO) AND');
    Add('  (AG.IDPESSOA          = PA.IDPESSOA) AND');
    Add('  (P.IDPROVENTO         = H.IDRUBRICA) AND');
    Add('  (H.IDRUBRICA          = RP.IDRUBRICA) AND');
    Add('  (RP.IDPESSOA          = F.IDEMPRESA) AND');
    Add('  (PF.IDPESSOA          = CTPS.IDPESSOA) AND');
    Add('  (PJ.IDPESSOA          = F.IDESTAB) AND');
    Add('  (PF.IDPESSOA          = F.IDPESSOA) AND');
    Add('  (PFIS.IDPESSOA        = F.IDPESSOA) AND');
    Add('  (PF.IDPESSOA          = H.IDPESSOA) AND');
    Add('  (F.IDCARGO            = C.IDCARGO) AND');

    if (rgExibeCCusto.ItemIndex = 0) then
    begin
      Add('  (F.CODCENTROCUSTO        = CC.CODCENTROCUSTO) AND');
      Add('  (F.IDEMPRESA             = CC.IDEMPRESA) AND');
    end;

    Add('  (PJ.IDPESSOA             = E.IDPESSOA) AND');
    Add('  (PJ.IDENDCOMERCIAL       = E.IDENDERECO) AND');
    Add('  (E.IDCIDADES             = CIDADES.IDCIDADES) AND');
    Add('  (E.IDENDERECO            = CONTATO.IDENDERECO) AND');
    Add('  (CIDADES.IDESTADO        = ES.IDESTADO) AND');
    Add('  (F.IDPESSOA              = PENSAOALIM.IDPESSOA(+)) AND');
    Add('  (PF.IDPESSOA             = MAIOR_REM.IDPESSOA(+)) AND');
    Add('  (PF.IDPESSOA             = PIS.IDPESSOA(+))');
    Add('ORDER BY');
    Add('  EMPREGADO, TIPORUBRICA, CODRUBRICA');
    //SaveToFile ('c:\qry.txt');
    SaveToFile (Sistema.RetornaCaminhoArquivos(Sistema.IdEmpresa)+'\qry.txt');//Ádler Teodoro de Souza SOL 109421 KINTANA 496332
  end;

  frmAguarde.Mostra ('Termo de Rescisão Contratual');
  frmAguarde.Pos := 0;
  dtmRelatorios2.qryTermRescisContr.Open;

  if (dtmRelatorios2.qryTermRescisContr.IsEmpty) then
  begin
    ModalResult := mrNone;
    frmAguarde.Apaga;
    MsgDlg('Não há dados a serem exibidos! Verifique.','Aviso',mtInformation,[mbOk,mbHelp],0);
    exit;
  end;

  with (dtmRelatorios2) do
  begin
    if (Trim(qryTermRescisContr.FieldByName('MASCARA_CTPS').asString) <> '') then
      rpTermRescisContrDBTextCTPS.DisplayFormat := qryTermRescisContr.FieldByName('MASCARA_CTPS').asString+';0;_';
    if (Trim(qryTermRescisContr.FieldByName('MASCARA_PIS').asString) <> '') then
      rpTermRescisContrDBTextPIS.DisplayFormat := qryTermRescisContr.FieldByName('MASCARA_PIS').asString+';0;_';

    rpTermRescisContr.PrinterSetup.PaperName := cmbTipoPapel.Items[cmbTipoPapel.ItemIndex];
  end;
end;

// -------------------------------------------------------------------------------------
// Funções do Form
// -------------------------------------------------------------------------------------
procedure TfrmParamTermRescisContr.MontaListaFuncionarios;
begin
  if (dblkcbEstab.Text <> '') then
  begin
    dtmBaseDados.qry.Close;
    ListaCodFunc.Clear;
    chklstFunc.Items.Clear;

    with (dtmBaseDados.qry.SQL) do
    begin
      Clear;
      Add('SELECT DISTINCT');
      Add('  PF.IDPESSOA, PF.NOME');
      Add('FROM');
      Add('  PESSOA PF, FUNCIONARIO F, SITFUNC ST');
      Add('WHERE');
      Add('  (ST.TIPOSIT        = ''D'')   AND');
      Add('  (F.IDESTAB         = ' +qryEstab.FieldByName('IDPESSOA').asString+ ') AND');
      Add('  (F.DATADESLIGAMENTO BETWEEN TO_DATE('+QuotedStr(dtedIni.Text)+',''DD/MM/YYYY'') AND '+
          'TO_DATE('+QuotedStr(dtedFin.Text)+',''DD/MM/YYYY'')) AND');

      // C. de Custo(s) habilitados para o usuário
      if (sUsuXccusto <> '') then
      begin
        if (Pos(',',sUsuXccusto) > 0) then
          Add('  (F.CODCENTROCUSTO IN ' +sUsuXccusto+ ') AND')
        else
          Add('  (F.CODCENTROCUSTO  = ' +sUsuXccusto+ ') AND');
      end;

      Add('  (ST.IDSITFUNC   = F.IDSITFUNC) AND');
      Add('  (F.IDPESSOA     = PF.IDPESSOA)');
      Add('ORDER BY');
      Add('  UPPER(NOME)');
    end;
    dtmBaseDados.qry.Open;

    while not(dtmBaseDados.qry.EOF) do
    begin
      ListaCodFunc.Add(dtmBaseDados.qry.FieldByName('IDPESSOA').asString);
      chklstFunc.Items.Add(dtmBaseDados.qry.FieldByName('NOME').asString);
      dtmBaseDados.qry.Next;
    end;
    bbtnSelTodosFuncClick(Self);

    if (qryEstab.FieldByName('IDPESSOA').asInteger <> IDEstab) then
    begin
      qryResp.Close;
      qryResp.ParamByName('ESTAB').asInteger := qryEstab.FieldByName('IDPESSOA').asInteger;
      qryResp.Open;
      dblkcbResp.Enabled := not(qryResp.IsEmpty);
    end;
  end;
  HabilitaBtOk;
end;

procedure TfrmParamTermRescisContr.HabilitaBtOk;
var
  c: integer;
  bSelFunc: boolean;
begin
  // Verifica se algum Funcionário foi selecionado
  bSelFunc := false;
  for c:=0 to chklstFunc.Items.Count-1 do
    if (chklstFunc.Checked[c]) then
    begin
      bSelFunc := true;
      break;
    end;

  bbtnConfirmar.Enabled := (bSelFunc) and (Trim(speAno.Text) <> '') and
    (Trim(dblkcbResp.Text) <> '') and (Trim(speAno.Text) <> '') and
    (Trim(dblkcbResp.Text) <> '') and (dtedIni.Date <= dtedFin.Date);
end;

end.
