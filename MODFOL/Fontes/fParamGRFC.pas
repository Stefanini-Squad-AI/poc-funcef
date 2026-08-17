// *****************************************************************************
// ***************************** REGISTRO DE ALTERAÇÕES ************************
// *****************************************************************************
// Autor(a)    :  Ádler Teodoro de Souza
// Data        :  19/02/2009
// Pendência   : SOL 109421 KINTANA 496332
// Descricao   :  Alteração de gravação de arquivos de log na raiz do disco C: .
//------------------------------------------------------------------------------
unit fParamGRFC;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs, MAHlpBtn,
  StdCtrls, Buttons, TB97Tlbr, TB97, ExtCtrls, Db, DBTables, Wwquery, Wwdatsrc,
  wwdblook, checklst, TREdit, IvDictio, IvMulti, IvEMulti, IniFiles, ComCtrls,
  wwdbdatetimepicker, CMDateTimePicker, fSairAjuda;

type
  TfrmParamGRFC = class(TfrmSairAjuda)
    qryEstab: TwwQuery;
    qryResp: TwwQuery;
    bbtnConfirmar: TBitBtn;
    ToolbarSep971: TToolbarSep97;
    gbxEstab: TGroupBox;
    dblkcbEstab: TwwDBLookupCombo;
    gbDataRef: TGroupBox;
    dtedDataRef: TCMDateTimePicker;
    gbxResp: TGroupBox;
    dblkcbResp: TwwDBLookupCombo;
    rgFGTSAnt: TRadioGroup;
    rbxDisAcordo: TGroupBox;
    rbRecDisAcordo: TRadioButton;
    rbNaoRecDisAcordo: TRadioButton;
    dtedDataDisAcordo: TCMDateTimePicker;
    gbxTipoPapel: TGroupBox;
    cmbTipoPapel: TComboBox;
    gbxFunc: TGroupBox;
    chklstFunc: TCheckListBox;
    bbtnSelTodosFunc: TBitBtn;
    bbtnInverteSelFunc: TBitBtn;
    gbxRubricas: TGroupBox;
    Label1: TLabel;
    edCodRubricas: TEdit;
    sbtnMarcarRub: TBitBtn;
    Paginas: TPageControl;
    tbshRubrica1: TTabSheet;
    chklstRubrica1: TCheckListBox;
    tbshRubrica2: TTabSheet;
    chklstRubrica2: TCheckListBox;
    tbshRubrica3: TTabSheet;
    chklstRubrica3: TCheckListBox;
    tbshRubrica4: TTabSheet;
    chklstRubrica4: TCheckListBox;
    GroupBox1: TGroupBox;
    redPerc: TRealEdit;
    tbshAdto13: TTabSheet;
    chklstRubrica5: TCheckListBox;
    rgProcesso: TRadioGroup;
    procedure FormCreate(Sender: TObject);
    procedure bbtnConfirmarClick(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure dblkcbEstabChange(Sender: TObject);
    procedure chklstRubrica1DrawItem(Control: TWinControl; Index: Integer;
      Rect: TRect; State: TOwnerDrawState);
    procedure PaginasChange(Sender: TObject);
    procedure sbtnMarcarRubClick(Sender: TObject);
    procedure chklstRubrica1ClickCheck(Sender: TObject);
    procedure bbtnSelTodosFuncClick(Sender: TObject);
    procedure bbtnInverteSelFuncClick(Sender: TObject);
    procedure chklstFuncClickCheck(Sender: TObject);
    procedure dblkcbRespChange(Sender: TObject);
    procedure dtedDataRefChange(Sender: TObject);
    procedure chklstFuncKeyDown(Sender: TObject; var Key: Word; Shift: TShiftState);
    procedure chklstRubrica1KeyDown(Sender: TObject; var Key: Word; Shift: TShiftState);
    procedure rbRecDisAcordoClick(Sender: TObject);
    procedure dtedDataDisAcordoChange(Sender: TObject);
    procedure rgFGTSAntClick(Sender: TObject);
  private
    rRemMesAnt, rRemMesRes, rAvisoPrevio, rSaldoRes, rMultaRes: real;
    sAnoMes, sMesAnt, sMesAtual, LiRubrica1, LiRubrica2, LiRubrica3, LiRubrica4, LiRubrica5: string;

    procedure LeAlteracoes;
    procedure GravaAlteracoes;
    procedure GravaDadosQuery;
    procedure MontaListaFuncionarios;
    procedure HabilitaBtOk;
  end;

var
  frmParamGRFC: TfrmParamGRFC;

implementation

uses uSistema, uMensErro, uDataBase, fAguarde, dBaseDados, uFuncoesUteis, UsoGeralRH,
  uComumRelats, dRelatorios2;

{$R *.DFM}

procedure TfrmParamGRFC.FormCreate(Sender: TObject);
var
  iPos: integer;
begin
  inherited;
  if not(Assigned(ListaCodFunc)) then
    ListaCodFunc := TStringList.Create;
  if not(Assigned(ListaCodRubrica)) then
    ListaCodRubrica := TStringList.Create;
  IDEstab := -1;

  cmbTipoPapel.Items.Assign(dtmRelatorios2.rpGRFC.PrinterSetup.PaperNames);

  iPos := ProcuraStList(cmbTipoPapel.Items,'A4');
  if (iPos = -1) then
    cmbTipoPapel.ItemIndex := 0
  else
    cmbTipoPapel.ItemIndex := iPos;

  FazQuery(dtmBaseDados.qry, 'SELECT NORMALINI FROM PARAMRH');
  dtedDataRef.Date := dtmBaseDados.qry.FieldByName('NORMALINI').asDateTime;

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
  qryResp.Open;

  // Monto a Lista de Rubricas
  chklstRubrica1.Items.Clear;
  chklstRubrica2.Items.Clear;
  chklstRubrica3.Items.Clear;
  chklstRubrica4.Items.Clear;
  chklstRubrica5.Items.Clear;
  ListaCodRubrica.Clear;
  with (dtmBaseDados.qry) do
  begin
    Close;
    SQL.Clear;
    SQL.Add('SELECT');
    SQL.Add('  RP.CODPROVDESC, RP.DESCRPROVDESC');
    SQL.Add('FROM');
    SQL.Add('  RUBRICAXPESS RP, PROVDESC PD');
    SQL.Add('WHERE');
    SQL.Add('  (RP.IDPESSOA    = ' +IntToStr(Sistema.IdEmpresa)+ ') AND');
    SQL.Add('  (PD.FLGTPRUBRICA LIKE ''%F%'') AND');
    SQL.Add('  (PD.IDPROVENTO  = RP.IDRUBRICA)');
    SQL.Add('ORDER BY');
    SQL.Add('  UPPER(DESCRPROVDESC)');
    Open;
    while not(EOF) do
    begin
      ListaCodRubrica.Add(FieldByName('CODPROVDESC').asString);
      chklstRubrica1.Items.Add(FieldByName('DESCRPROVDESC').asString);
      chklstRubrica2.Items.Add(FieldByName('DESCRPROVDESC').asString);
      chklstRubrica3.Items.Add(FieldByName('DESCRPROVDESC').asString);
      chklstRubrica4.Items.Add(FieldByName('DESCRPROVDESC').asString);
      chklstRubrica5.Items.Add(FieldByName('DESCRPROVDESC').asString);      
      Next;
    end;
  end;

  dblkcbResp.Text := qryResp.FieldByName('NOME').asString;
  Paginas.ActivePageIndex := 0;

  // Carrega alterações nas opções feitas anteriormente
  LeAlteracoes;
end;

procedure TfrmParamGRFC.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  GravaAlteracoes;

  dtmBaseDados.qry.Close;
  qryEstab.Close;
  qryResp.Close;
  inherited;
end;

procedure TfrmParamGRFC.chklstRubrica1DrawItem(Control: TWinControl; Index: Integer;
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

procedure TfrmParamGRFC.dblkcbEstabChange(Sender: TObject);
begin
  if (qryEstab.FieldByName('IDPESSOA').asInteger <> IDEstab) then
  begin
    MontaListaFuncionarios;
    IDEstab := qryEstab.FieldByName('IDPESSOA').asInteger;
    chklstFunc.Repaint;
  end;
end;

procedure TfrmParamGRFC.dblkcbRespChange(Sender: TObject);
begin
  dblkcbResp.Text := Trim(dblkcbResp.Text);
  HabilitaBtOk;
end;

procedure TfrmParamGRFC.PaginasChange(Sender: TObject);
begin
  case (Paginas.ActivePageIndex) of
    0 : edCodRubricas.Text := LiRubrica1;
    1 : edCodRubricas.Text := LiRubrica2;
    2 : edCodRubricas.Text := LiRubrica3;
    3 : edCodRubricas.Text := LiRubrica4;
    4 : edCodRubricas.Text := LiRubrica5;    
  end;
end;

procedure TfrmParamGRFC.dtedDataRefChange(Sender: TObject);
begin
  try
    StrToDate(dtedDataRef.Text);
    MontaListaFuncionarios;
  except
  end;
end;

procedure TfrmParamGRFC.dtedDataDisAcordoChange(Sender: TObject);
begin
  try
    StrToDate(dtedDataDisAcordo.Text);
    HabilitaBtOk;
  except
  end;
end;

procedure TfrmParamGRFC.chklstFuncKeyDown(Sender: TObject; var Key: Word; Shift: TShiftState);
begin
  if (Key = VK_TAB) then
    chklstFuncClickCheck(Sender);
end;

procedure TfrmParamGRFC.chklstRubrica1KeyDown(Sender: TObject; var Key: Word; Shift: TShiftState);
begin
  if (Key = VK_TAB) then
    chklstRubrica1ClickCheck(Sender);
end;

procedure TfrmParamGRFC.chklstFuncClickCheck(Sender: TObject);
begin
  InvalidateItemListBox(TCustomListBox(Sender), TCustomListBox(Sender).ItemIndex);
  HabilitaBtOk;
end;

procedure TfrmParamGRFC.chklstRubrica1ClickCheck(Sender: TObject);
begin
  case (Paginas.ActivePageIndex) of
    0 : begin
          CriaListaOpcoes(chklstRubrica1, ListaCodRubrica, LiRubrica1, ',', false);
          edCodRubricas.Text := LiRubrica1;
        end;
    1 : begin
          CriaListaOpcoes(chklstRubrica2, ListaCodRubrica, LiRubrica2, ',', false);
          edCodRubricas.Text := LiRubrica2;
        end;
    2 : begin
          CriaListaOpcoes(chklstRubrica3, ListaCodRubrica, LiRubrica3, ',', false);
          edCodRubricas.Text := LiRubrica3;
        end;
    3 : begin
          CriaListaOpcoes(chklstRubrica4, ListaCodRubrica, LiRubrica4, ',', false);
          edCodRubricas.Text := LiRubrica4;
        end;
    4 : begin
          CriaListaOpcoes(chklstRubrica5, ListaCodRubrica, LiRubrica5, ',', false);
          edCodRubricas.Text := LiRubrica5;
        end;
  end;

  InvalidateItemListBox(TCustomListBox(Sender), TCustomListBox(Sender).ItemIndex);
  HabilitaBtOk;
end;

procedure TfrmParamGRFC.sbtnMarcarRubClick(Sender: TObject);
begin
  edCodRubricas.Text := Trim(edCodRubricas.Text);

  case (Paginas.ActivePageIndex) of
    0 : begin
          VerificaOpcoes(chklstRubrica1, ListaCodRubrica, edCodRubricas.Text, ',');
          LiRubrica1 := edCodRubricas.Text;
          chklstRubrica1.Repaint;
        end;
    1 : begin
          VerificaOpcoes(chklstRubrica2, ListaCodRubrica, edCodRubricas.Text, ',');
          LiRubrica2 := edCodRubricas.Text;
          chklstRubrica2.Repaint;
        end;
    2 : begin
          VerificaOpcoes(chklstRubrica3, ListaCodRubrica, edCodRubricas.Text, ',');
          LiRubrica3 := edCodRubricas.Text;
          chklstRubrica3.Repaint;
        end;
    3 : begin
          VerificaOpcoes(chklstRubrica4, ListaCodRubrica, edCodRubricas.Text, ',');
          LiRubrica4 := edCodRubricas.Text;
          chklstRubrica4.Repaint;
        end;
    4 : begin
          VerificaOpcoes(chklstRubrica5, ListaCodRubrica, edCodRubricas.Text, ',');
          LiRubrica5 := edCodRubricas.Text;
          chklstRubrica5.Repaint;
        end;
  end;
  HabilitaBtOk;
end;

procedure TfrmParamGRFC.bbtnSelTodosFuncClick(Sender: TObject);
var
  c: integer;
begin
  for c:=0 to chklstFunc.Items.Count-1 do
    chklstFunc.Checked[c] := true;
  chklstFunc.Repaint;
  HabilitaBtOk;
end;

procedure TfrmParamGRFC.bbtnInverteSelFuncClick(Sender: TObject);
var
  c: integer;
begin
  for c:=0 to chklstFunc.Items.Count-1 do
    chklstFunc.Checked[c] := not(chklstFunc.Checked[c]);
  chklstFunc.Repaint;
  HabilitaBtOk;
end;

procedure TfrmParamGRFC.rbRecDisAcordoClick(Sender: TObject);
begin
  dtedDataDisAcordo.Visible := rbRecDisAcordo.Checked;
  HabilitaBtOk;
end;

procedure TfrmParamGRFC.bbtnConfirmarClick(Sender: TObject);
var
  I, K: integer;
  sQueryRecFGTS, NomeTabela: string;
begin
  if (rgProcesso.ItemIndex = 0) then
    NomeTabela := 'PREVIAFOLPAG'
  else
    NomeTabela := 'HISTRUBSAL';

  // Rubricas para Rem. Sem 13º selecionadas
  CriaListaOpcoes(chklstRubrica1, ListaCodRubrica, LiRubrica1, ',', true);

  // Rubricas para Remuneração Somente Parcela do 13º selecionadas
  CriaListaOpcoes(chklstRubrica2, ListaCodRubrica, LiRubrica2, ',', true);

  // Rubricas para Verbas Indenizatórias (34) selecionadas
  CriaListaOpcoes(chklstRubrica3, ListaCodRubrica, LiRubrica3, ',', true);

  // Rubricas para Verbas Indenizatórias (35) selecionadas
  CriaListaOpcoes(chklstRubrica4, ListaCodRubrica, LiRubrica4, ',', true);

  // Rubricas para Adiantamentos 13º selecionadas
  CriaListaOpcoes(chklstRubrica5, ListaCodRubrica, LiRubrica5, ',', true);

  // Empregados selecionados
  CriaListaOpcoes(chklstFunc, ListaCodFunc, sCodFuncSel, ',', false);

  // Pego todas as Rubricas Selecionadas para...
//  sQueryRecFGTS := LiRubrica1 + LiRubrica2 + LiRubrica3 + LiRubrica4;

  // Remuneração sem 13º
  K := 1;
  for I:=0 to chklstRubrica1.Items.Count - 1 do
    if (chklstRubrica1.Checked[I]) then
      if (K = 1) then
      begin
        sQueryRecFGTS := QuotedStr(ListaCodRubrica.Strings[I]);
        Inc(K);
      end
      else
        sQueryRecFGTS := sQueryRecFGTS +','+ QuotedStr(ListaCodRubrica.Strings[I]);

  // Remuneração somente parcela do 13º
  K := 1;
  for I:=0 to chklstRubrica2.Items.Count - 1 do
    if (chklstRubrica2.Checked[I]) then
      if (K = 1) then
      begin
        sQueryRecFGTS := QuotedStr(ListaCodRubrica.Strings[I]);
        Inc(K);
      end
      else
        sQueryRecFGTS := sQueryRecFGTS +','+ QuotedStr(ListaCodRubrica.Strings[I]);

  // Verbas Indenizatórias (34)
  for I:=0 to chklstRubrica3.Items.Count - 1 do
    if (chklstRubrica3.Checked[I]) then
      sQueryRecFGTS := sQueryRecFGTS +','+ QuotedStr(ListaCodRubrica.Strings[I]);

  // Verbas Indenizatórias (35)
  for I:=0 to chklstRubrica4.Items.Count - 1 do
    if (chklstRubrica4.Checked[I]) then
      sQueryRecFGTS := sQueryRecFGTS +','+ QuotedStr(ListaCodRubrica.Strings[I]);

  sAnoMes := RetornaAnoMes(dtedDataRef.Date);

  dtmBaseDados.qry.Close;
  with (dtmBaseDados.qry.SQL) do
  begin
    Clear;
    Add('SELECT');
    // Dados do Estabelecimento
    Add('  UPPER(RTRIM(PJ.RAZAOSOCIAL)) AS EMPRESA,');
    Add('  DECODE(PJ.NUMDOCUMENTO,NULL,'''',PJ.NUMDOCUMENTO) AS INSCRICAO,');
    Add('  TEL.DDD AS DDD,');
    Add('  TEL.NUMERO AS TELEFONE,');
    Add('  UPPER(RTRIM(E.LOGRADOURO) ||'', ''|| E.NUMERO ||');
    Add('    DECODE(E.COMPLEMENTO,NULL,NULL,'' - '' || RTRIM(E.COMPLEMENTO))) AS ENDERECO,');
    Add('  UPPER(E.BAIRRO) AS BAIRRO,');
    Add('  UPPER(CIDADES.NOME) AS CIDADE,');
    Add('  ES.CODESTADO AS UF,');
    Add('  RTRIM(SUBSTR(E.CEP,1,5)) ||''-''|| RTRIM(SUBSTR(E.CEP,6,3)) AS CEP,');
    Add('  FP.IDITEMCNAE AS CNAE,');
    Add('  FP.IDFPAS AS FPAS,');
    Add('  DECODE(F.TIPOCONTRATO,''3'',');
    Add('    DECODE(PF.NUMDOCUMENTO,NULL,'''',PF.NUMDOCUMENTO),');
    Add('    ''A'',');
    Add('    CEI_TOMADOR.NUM,'''') AS INSCRICAO_TOMADOR,');
    Add('  UPPER(DECODE(F.TIPOCONTRATO,''3'',RTRIM(PF.NOME),''A'',RTRIM(PF.NOME),'''')) AS NOME_TOMADOR,');
    // Dados do Contato do Estabelecimento
    Add('  UPPER(SUBSTR('+QuotedStr(qryResp.FieldByName('NOME').asString)+',1,30))  AS CONTATO_NOME,');
    // Dados do Empregado
    Add('  F.MATRICULA,');
    Add('  UPPER(RTRIM(PF.NOME)) AS EMPREGADO,');
    Add('  RTRIM(CTPS.NUM)                          AS CTPS_NUM,');
    Add('  DECODE(CTPS.UF,'''','''',''/''||CTPS.UF) AS CTPS_UF,');
    Add('  CTPS.MASCARA    AS MASCARA_CTPS,');
    Add('  PIS.NUM         AS PIS,');
    Add('  PIS.MASCARA     AS MASCARA_PIS,');
    Add('  TO_CHAR(F.DATAADMISSAO,''DD/MM/YYYY'')     AS DATAADMISSAO,');
    Add('  TO_CHAR(F.DATAOPCAOFGTS,''DD/MM/YYYY'')    AS DATAOPCAOFGTS,');
    Add('  TO_CHAR(F.DATADESLIGAMENTO,''DD/MM/YYYY'') AS DATADESLIGAMENTO,');
    Add('  TO_CHAR(PFIS.DATANASC,''DD/MM/YYYY'')      AS DATANASC,');
    Add('  DECODE(F.DATADESLIGAMENTO,F.DATAAVISO,''2'',DECODE(F.DATAAVISO,'''',''3'',''1'')) AS TIPO_AVISO,');
    Add('  NVL(F.IDCATEMPRGRE,1) AS CATEGORIA,');
    { Código da Rescisão
    I1 - Rescisão, sem justa causa, por iniciativa do empregador, inclusive a rescisão antecipada de contrato a termo
    I2 - Rescisão, por culpa recíproca ou força maior
    I3 - Rescisão por término de contrato de trabalho por prazo determinado
    I4 - Rescisão, sem justa causa, do contrato de trabalho do trabalhador doméstico, por iniciativa do empregador
    L  - Outros motivos de rescisão do contrato de trabalho}
    Add('  MO.MOTIVOFGTS,');
    Add('  P.FLGDESCONTO,');
    // Cálculos da guia
    // Remuneração mês anterior à rescisão
    if (rgFGTSAnt.ItemIndex = 1) then
    begin
      K := 1;
      Add('  NVL(DECODE(H.MES,'+QuotedStr(IncDataAM(sAnoMes,-1))+',');
      Add('    DECODE(RP.CODPROVDESC,');
      for I:=0 to chklstRubrica1.Items.Count - 1 do
        if (chklstRubrica1.Checked[I]) then
        begin
          Add('      '+IFF(k = 1,'',',')+QuotedStr(ListaCodRubrica.Strings[I])+',H.VALORPROVENTO');
          Inc(k);
        end;
      Add('  )),0) REM_MES_ANT,');
    end
    else
      Add('  (0) REM_MES_ANT,');

    // Remuneração mês de rescisão
    K := 1;
    Add('  NVL(DECODE(H.MES,'+QuotedStr(sAnoMes)+',');
    Add('    DECODE(RP.CODPROVDESC,');
    for I:=0 to chklstRubrica2.Items.Count - 1 do
      if (chklstRubrica2.Checked[I]) then
      begin
        Add('      '+IFF(k = 1,'',',')+QuotedStr(ListaCodRubrica.Strings[I])+',H.VALORPROVENTO');
        Inc(k);
      end;
    Add('  )),0) REM_MES_RES,');

    // Aviso prévio indenizado
    K := 1;
    Add('  NVL(DECODE(H.MES,'+QuotedStr(sAnoMes)+',');
    Add('    DECODE(RP.CODPROVDESC,');
    for I:=0 to chklstRubrica3.Items.Count - 1 do
      if (chklstRubrica3.Checked[I]) then
      begin
        Add('      '+IFF(k = 1,'',',')+QuotedStr(ListaCodRubrica.Strings[I])+',H.VALORPROVENTO');
        Inc(k);
      end;
    Add('  )),0) AVISO_PREVIO,');

    // Saldo para fins rescisórios
    K := 1;
    Add('  NVL(DECODE(H.MES,'+QuotedStr(sAnoMes)+',');
    Add('    DECODE(RP.CODPROVDESC,');
    for I:=0 to chklstRubrica4.Items.Count - 1 do
      if (chklstRubrica4.Checked[I]) then
      begin
        Add('      '+IFF(k = 1,'',',')+QuotedStr(ListaCodRubrica.Strings[I])+',H.VALORPROVENTO');
        Inc(k);
      end;
    Add('  )),0) SALDO_RES,');

    // Multa Rescisória
    Add('  NVL(DECODE(H.MES,'+QuotedStr(sAnoMes)+',');
    Add('    DECODE(P.CODRUBCLT,''43689'',H.VALORPROVENTO)),0) MULTA_RES,');

    // Adiantamentos 13º
    if (LiRubrica5 <> '') then
      Add('  VLR_ADTO13.VALOR AS ADTO13')
    else
      Add('  (0) ADTO13');
    // -------------------------------------------------------------------------- //
    Add('FROM');
    Add('  '+NomeTabela+' H, PESSOA PJ, PESSOA PF, PESSOAFISICA PFIS, RUBRICAXPESS RP, PROVDESC P,');
    Add('  ENDPESS E, FUNCIONARIO F, CIDADES, ESTADO ES, FPAS,');
    Add('  MOTIVO MO, FILIALPESSOA FP,');
    // -------------------------------------------------------------------------- //
    // Valor do Adiantamento do 13º
    if (LiRubrica5 <> '') then
    begin
      Add('  (SELECT H.IDPESSOA,');
      Add('     SUM(DECODE(PD.FLGDESCONTO,0,H.VALORPROVENTO,1,-H.VALORPROVENTO)) AS VALOR');
      Add('   FROM HISTRUBSAL H, PROVDESC PD');

      if (Pos(',',sCodFuncSel) = 0) then
        Add('   WHERE  (H.IDPESSOA     = ' +sCodFuncSel+ ') AND')
      else
        Add('   WHERE  (H.IDPESSOA    IN (' +sCodFuncSel+ ')) AND');

      if (Pos(',',LiRubrica5) > 0) then
        Add('          (H.CODPROVDESC IN (' +LiRubrica5+ ')) AND')
      else
        Add('          (H.CODPROVDESC  = ' +LiRubrica5+ ') AND');

      Add('          (H.MES         >= ' +QuotedStr(Copy(sAnoMes,1,4)+'/'+'01')+ ') AND');
      Add('          (H.MES         <= ' +QuotedStr(Copy(sAnoMes,1,4)+'/'+'12')+ ') AND');
      Add('          (H.IDRUBRICA    = PD.IDPROVENTO)');
      Add('   GROUP BY H.IDPESSOA) VLR_ADTO13,');
    end;
    // -------------------------------------------------------------------------- //
    // Telefone do Estabelecimento
    Add('  (SELECT TE.IDENDERECO, TE.IDTELEFONE, TE.DDD, TE.NUMERO');
    Add('   FROM');
    Add('     TELENDPESS TE,');
    Add('     (SELECT   MIN(IDTELEFONE) AS IDTELEFONE, IDENDERECO');
    Add('      FROM     TELENDPESS');
    Add('      GROUP BY IDENDERECO) END');
    Add('   WHERE');
    Add('     (END.IDTELEFONE = TE.IDTELEFONE)) TEL,');
    // -------------------------------------------------------------------------- //
    // CTPS do Funcionário
    Add('  (SELECT F.IDPESSOA, TDP.MASCARA, DP.NUMDOCUMENTO AS NUM, ES.CODESTADO AS UF');
    Add('   FROM   DOCPESSOA DP, FUNCIONARIO F, ESTADO ES, TIPODOCOFICIAL TDO, TIPODOCPESSOA TDP, PAIS PA');
    Add('   WHERE (TDO.SIGLADOCUMENTO = ''CTPS:'') AND');
    Add('         (TDO.IDDOCUMENTO    = DP.IDDOCUMENTO) AND');
    Add('         (DP.IDDOCUMENTO     = TDP.IDDOCUMENTO) AND');
    Add('         (DP.IDPESSOA        = F.IDPESSOA) AND');
    Add('         (DP.IDPAIS          = PA.IDPAIS) AND');
    Add('         (ES.IDPAIS          = PA.IDPAIS) AND');
    Add('         (DP.IDESTADO        = ES.IDESTADO)) CTPS,');
    // -------------------------------------------------------------------------- //
    // PIS do Funcionário
    Add('  (SELECT F.IDPESSOA, TDP.MASCARA, DP.NUMDOCUMENTO AS NUM');
    Add('   FROM   DOCPESSOA DP, FUNCIONARIO F, TIPODOCPESSOA TDP, TIPODOCOFICIAL TDO');
    Add('   WHERE ((TDO.SIGLADOCUMENTO = ''PIS:'') OR');
    Add('          (TDO.SIGLADOCUMENTO = ''PIS/PASEP:'')) AND');
    Add('         (TDO.IDDOCUMENTO     = DP.IDDOCUMENTO) AND');
    Add('         (TDO.IDDOCUMENTO     = TDP.IDDOCUMENTO) AND');
    Add('         (DP.IDPESSOA         = F.IDPESSOA)) PIS,');
    // -------------------------------------------------------------------------- //
    // CEI do Tomador de Serviços
    Add('  (SELECT F.IDPESSOA, RTRIM(DO.NUMDOCUMENTO) AS NUM');
    Add('   FROM   DOCPESSOA DO, FUNCIONARIO F, TIPODOCOFICIAL TDO');
    Add('   WHERE (TDO.SIGLADOCUMENTO = ''CEI:'') AND');
    Add('         (TDO.IDDOCUMENTO    = DO.IDDOCUMENTO) AND');
    Add('         (DO.IDPESSOA        = F.IDPESSOA)) CEI_TOMADOR');
    // -------------------------------------------------------------------------- //
    Add('WHERE');
    // Estabelecimento selecionado
    Add('  (PJ.IDPESSOA         = ' +qryEstab.FieldByName('IDPESSOA').asString+ ') AND');

    // Funcionário selecionado
    if (sCodFuncSel <> '') then
    begin
      if (Pos(',',sCodFuncSel) = 0) then
        Add('  (PF.IDPESSOA  = ' +sCodFuncSel+ ') AND')
      else
        Add('  (PF.IDPESSOA IN (' +sCodFuncSel+ ')) AND');
    end
    else
    begin
      // C. de Custo(s) habilitados para o usuário
      if (sUsuXccusto <> '') then
        Add('  (F.CODCENTROCUSTO IN ' +sUsuXccusto+ ') AND');
    end;

    Add('  ((P.CODRUBCLT       = ''43689'') OR');
    Add('   (RP.CODPROVDESC   IN (' +sQueryRecFGTS+ '))) AND');

    // Selecionou Recolhimento de FGTS no mês anterior ?
    if (rgFGTSAnt.ItemIndex = 1) then
    begin
      Add('  ((H.MES             = ' +QuotedStr(IncDataAM(sAnoMes,-1))+ ') OR');
      Add('   (H.MES             = ' +QuotedStr(sAnoMes)+ ')) AND');
    end
    else
      Add('  (H.MES             = ' +QuotedStr(sAnoMes)+ ') AND');

    Add('  (F.IDMOTIVODESLIGRAIS = MO.IDMOTIVO) AND');
    Add('  (PJ.IDPESSOA       = FP.IDFILIALPESSOA) AND');
    Add('  (PF.IDPESSOA       = H.IDPESSOA) AND');
    Add('  (P.IDPROVENTO      = RP.IDRUBRICA) AND');
    Add('  (P.IDPROVENTO      = H.IDRUBRICA) AND');
    Add('  (FP.IDFPAS         = FPAS.IDFPAS) AND');
    Add('  (PF.IDPESSOA       = F.IDPESSOA) AND');
    Add('  (F.IDESTAB         = PJ.IDPESSOA) AND');
    Add('  (F.IDPESSOA        = PFIS.IDPESSOA) AND');
    Add('  (F.IDPESSOA        = CTPS.IDPESSOA) AND');
    Add('  (F.IDPESSOA        = PIS.IDPESSOA) AND');
    Add('  (FP.IDFILIALPESSOA = E.IDPESSOA) AND');
    Add('  (PJ.IDENDCOMERCIAL = E.IDENDERECO) AND');
    Add('  (E.IDCIDADES       = CIDADES.IDCIDADES) AND');
    Add('  (CIDADES.IDESTADO  = ES.IDESTADO) AND');

    // Selecionou Adiantamento de 13º?
    if (LiRubrica5 <> '') then
      Add('  (F.IDPESSOA        = VLR_ADTO13.IDPESSOA(+)) AND');

    Add('  (PJ.IDENDCOMERCIAL = TEL.IDENDERECO(+)) AND');
    Add('  (PF.IDPESSOA       = CEI_TOMADOR.IDPESSOA(+))');
    Add('ORDER BY EMPREGADO');
    //SaveToFile('c:\qry.txt');
    SaveToFile(Sistema.RetornaCaminhoArquivos(Sistema.IdEmpresa)+'\qry.txt');//Ádler Teodoro de Souza SOL 109421 KINTANA 496332
  end;

  // Monta Query Principal  
  with (dtmRelatorios2) do
  begin
    frmAguarde.Mostra('Impresso GRFC');
    frmAguarde.Pos := 0;

    // Aponto o UpdateSQL para a query Principal
    qryGRFC.UpdateObject := updSQL;

    if not(qryGRFC.IsEmpty) then
      qryGRFC.CancelUpdates;
    qryGRFC.Close;
    qryGRFC.Open;

    // Processa dados para a geração da query
    dtmBaseDados.qry.Open;
    GravaDadosQuery;
    qryGRFC.First;

    // Especifico Configurações do Relatório
    if (Trim(dtmBaseDados.qry.FieldByName('MASCARA_CTPS').asString) <> '') then
      rpGRFCDBTextCTPS_NUM.DisplayFormat := dtmBaseDados.qry.FieldByName('MASCARA_CTPS').asString+';0;_';
    if (Trim(dtmBaseDados.qry.FieldByName('MASCARA_PIS').asString) <> '') then
      rpGRFCDBTextPIS.DisplayFormat := dtmBaseDados.qry.FieldByName('MASCARA_PIS').asString+';0;_';

    bFGTSAnt := (rgFGTSAnt.ItemIndex = 1);

    rpGRFC.PrinterSetup.PaperName := cmbTipoPapel.Items[cmbTipoPapel.ItemIndex];
  end;
end;

procedure TfrmParamGRFC.GravaDadosQuery;
var
  sMatrFunc: string;
begin
  with (dtmRelatorios2.qryGRFC) do
  begin
    if not(dtmBaseDados.qry.IsEmpty) then
    begin
      frmAguarde.Min := 0;
      frmAguarde.Max := dtmBaseDados.qry.RecordCount;

      repeat
        Insert;
        FieldByName('EMPRESA').asString := dtmBaseDados.qry.FieldByName('EMPRESA').asString;
        FieldByName('INSCRICAO').asString := dtmBaseDados.qry.FieldByName('INSCRICAO').asString;
        FieldByName('CONTATO_NOME').asString := dtmBaseDados.qry.FieldByName('CONTATO_NOME').asString;
        FieldByName('DDD').asString := dtmBaseDados.qry.FieldByName('DDD').asString;
        FieldByName('TELEFONE').asString := dtmBaseDados.qry.FieldByName('TELEFONE').asString;
        FieldByName('ENDERECO').asString := dtmBaseDados.qry.FieldByName('ENDERECO').asString;
        FieldByName('BAIRRO').asString := dtmBaseDados.qry.FieldByName('BAIRRO').asString;
        FieldByName('CIDADE').asString := dtmBaseDados.qry.FieldByName('CIDADE').asString;
        FieldByName('UF').asString := dtmBaseDados.qry.FieldByName('UF').asString;
        FieldByName('CEP').asString := dtmBaseDados.qry.FieldByName('CEP').asString;
        FieldByName('INSCRICAO_TOMADOR').asString := dtmBaseDados.qry.FieldByName('INSCRICAO_TOMADOR').asString;
        FieldByName('NOME_TOMADOR').asString := dtmBaseDados.qry.FieldByName('NOME_TOMADOR').asString;
        FieldByName('FPAS').asString := dtmBaseDados.qry.FieldByName('FPAS').asString;
        FieldByName('SIMPLES').asString := 'NÃO';
        FieldByName('CNAE').asString := dtmBaseDados.qry.FieldByName('CNAE').asString;
        FieldByName('EMPREGADO').asString := dtmBaseDados.qry.FieldByName('EMPREGADO').asString;
        FieldByName('PIS').asString := dtmBaseDados.qry.FieldByName('PIS').asString;
        FieldByName('DATAADMISSAO').asString := dtmBaseDados.qry.FieldByName('DATAADMISSAO').asString;
        FieldByName('CATEGORIA').asString := dtmBaseDados.qry.FieldByName('CATEGORIA').asString;
        FieldByName('DATADESLIGAMENTO').asString := dtmBaseDados.qry.FieldByName('DATADESLIGAMENTO').asString;
        FieldByName('CODIGO_MOV').asString := Trim(dtmBaseDados.qry.FieldByName('MOTIVOFGTS').asString);
        FieldByName('TIPO_AVISO').asString := dtmBaseDados.qry.FieldByName('TIPO_AVISO').asString;
        if (rbRecDisAcordo.Checked) then
          FieldByName('DISSIDIO').asString := dtedDataDisAcordo.Text
        else
          FieldByName('DISSIDIO').asString := '';
        FieldByName('DATANASC').asString := dtmBaseDados.qry.FieldByName('DATANASC').asString;
        FieldByName('CTPS_NUM').asString := dtmBaseDados.qry.FieldByName('CTPS_NUM').asString;
        FieldByName('CTPS_UF').asString := dtmBaseDados.qry.FieldByName('CTPS_UF').asString;
        FieldByName('DATAOPCAOFGTS').asString := dtmBaseDados.qry.FieldByName('DATAOPCAOFGTS').asString;
        FieldByName('LOCAL_DATA').asString := dtmBaseDados.qry.FieldByName('CIDADE').asString +
          '  ' + Copy(dtedDataRef.Text,1,2) + ', '+MesExtensoAno(sAnoMes);

        sMatrFunc := dtmBaseDados.qry.FieldByName('MATRICULA').asString;
        sMesAnt := Copy(IncDataAM(sAnoMes,-1),6,2)+'/'+Copy(IncDataAM(sAnoMes,-1),1,4);
        sMesAtual := Copy(dtedDataRef.Text,4,7);
        rRemMesAnt := 0;
        rRemMesRes := 0;
        rAvisoPrevio := 0;
        rSaldoRes := 0;
        rMultaRes := 0;

        repeat
          if (dtmBaseDados.qry.FieldByName('FLGDESCONTO').asString = '0') then
          begin
            rRemMesAnt := rRemMesAnt + dtmBaseDados.qry.FieldByName('REM_MES_ANT').asFloat;
            rRemMesRes := rRemMesRes + dtmBaseDados.qry.FieldByName('REM_MES_RES').asFloat;
            rAvisoPrevio := rAvisoPrevio + dtmBaseDados.qry.FieldByName('AVISO_PREVIO').asFloat;
            rSaldoRes := rSaldoRes + dtmBaseDados.qry.FieldByName('SALDO_RES').asFloat;
            rMultaRes := rMultaRes + dtmBaseDados.qry.FieldByName('MULTA_RES').asFloat;
          end
          else
          if (dtmBaseDados.qry.FieldByName('FLGDESCONTO').asString = '1') then
          begin
            rRemMesAnt := rRemMesAnt - dtmBaseDados.qry.FieldByName('REM_MES_ANT').asFloat;
            rRemMesRes := rRemMesRes - dtmBaseDados.qry.FieldByName('REM_MES_RES').asFloat;
            rAvisoPrevio := rAvisoPrevio - dtmBaseDados.qry.FieldByName('AVISO_PREVIO').asFloat;
            rSaldoRes := rSaldoRes - dtmBaseDados.qry.FieldByName('SALDO_RES').asFloat;
            rMultaRes := rMultaRes - dtmBaseDados.qry.FieldByName('MULTA_RES').asFloat;
          end
          else
          begin
            if (dtmBaseDados.qry.FieldByName('SALDO_RES').asFloat > 0) then
              rSaldoRes := dtmBaseDados.qry.FieldByName('SALDO_RES').asFloat;
            if (dtmBaseDados.qry.FieldByName('MULTA_RES').asFloat > 0) then
              rMultaRes := dtmBaseDados.qry.FieldByName('MULTA_RES').asFloat;
          end;

          dtmBaseDados.qry.Next;
        until (dtmBaseDados.qry.EOF) or
              (dtmBaseDados.qry.FieldByName('MATRICULA').asString <> sMatrFunc);

        rRemMesRes := rRemMesRes - dtmBaseDados.qry.FieldByName('ADTO13').asFloat;

        FieldByName('REM_MES_ANT').asFloat := rRemMesAnt;
        FieldByName('REM_MES_RES').asFloat := rRemMesRes;
        FieldByName('AVISO_PREVIO').asFloat := rAvisoPrevio;
        FieldByName('SALDO_RES').asFloat := rSaldoRes;
        FieldByName('SOMA25A28').asFloat := rRemMesAnt + rRemMesRes + rAvisoPrevio + rSaldoRes;
        FieldByName('MULTA_RES').asFloat := rMultaRes;
        FieldByName('REM_MES_ANT2').asFloat := rRemMesAnt*(redPerc.Value/100);   
        FieldByName('REM_MES_RES2').asFloat := rRemMesRes*(redPerc.Value/100);
        FieldByName('AVISO_PREVIO2').asFloat := rAvisoPrevio*(redPerc.Value/100);
        FieldByName('TOTAL_REC').asFloat := (rRemMesAnt*(redPerc.Value/100)) +
          (rRemMesRes*(redPerc.Value/100)) + (rAvisoPrevio*(redPerc.Value/100)) + (rMultaRes);
        Post;
      until (dtmBaseDados.qry.EOF);
    end
    else
    begin
      ModalResult := mrNone;
      frmAguarde.Apaga;
      MsgDlg('Não há dados a serem exibidos.'+CR_LF+
        'Verifique.', 'Aviso', mtInformation, [mbOk,mbHelp], 0);
    end;
  end;
end;

// -------------------------------------------------------------------------------------
// Funções do Form
// -------------------------------------------------------------------------------------
procedure TfrmParamGRFC.LeAlteracoes;
var
  sEstab: string;
begin
  // Recupera as últimas alterações das opções
  //ArqConfig  := TIniFile.Create('C:\CONFIG_FOLHAPAGTO.INI');
  ArqConfig  := TIniFile.Create(Sistema.RetornaCaminhoArquivos(Sistema.IdEmpresa)+'\CONFIG_FOLHAPAGTO.INI');//Ádler Teodoro de Souza SOL 109421 KINTANA 496332
  sEstab     := ArqConfig.ReadString('REL_GRFC', 'Estabelec', '');
  LiRubrica1 := ArqConfig.ReadString('REL_GRFC', 'Rubricas1', '');
  LiRubrica2 := ArqConfig.ReadString('REL_GRFC', 'Rubricas2', '');
  LiRubrica3 := ArqConfig.ReadString('REL_GRFC', 'Rubricas3', '');
  LiRubrica4 := ArqConfig.ReadString('REL_GRFC', 'Rubricas4', '');
  LiRubrica5 := ArqConfig.ReadString('REL_GRFC', 'Rubricas5', '');
  redPerc.Value := StrToFloat(ArqConfig.ReadString('REL_GRFC', 'Percentual', '8'+DecimalSeparator+'5'));

  VerificaOpcoes(chklstRubrica1, ListaCodRubrica, LiRubrica1, ',');
  VerificaOpcoes(chklstRubrica2, ListaCodRubrica, LiRubrica2, ',');
  VerificaOpcoes(chklstRubrica3, ListaCodRubrica, LiRubrica3, ',');
  VerificaOpcoes(chklstRubrica4, ListaCodRubrica, LiRubrica4, ',');
  VerificaOpcoes(chklstRubrica5, ListaCodRubrica, LiRubrica5, ',');  

  if (sEstab = '') then
  begin
    qryEstab.First;
    sEstab := qryEstab.FieldByName('IDPESSOA').asString;
  end;
  dblkcbEstab.LookUpValue := sEstab;
  dblkcbEstab.UpDate;

  edCodRubricas.Text := LiRubrica1;

  HabilitaBtOk;
end;

procedure TfrmParamGRFC.GravaAlteracoes;
var
  sGravaPadrao: string;
begin
  // Grava as últimas alterações da Opção de Rubricas para ...

  // Remuneração sem 13º
  CriaListaOpcoes(chklstRubrica1, ListaCodRubrica, sGravaPadrao, ',', false);
  ArqConfig.WriteString('REL_GRFC', 'Rubricas1', sGravaPadrao);

  // Remuneração somente parcela de 13º
  CriaListaOpcoes(chklstRubrica2, ListaCodRubrica, sGravaPadrao, ',', false);
  ArqConfig.WriteString('REL_GRFC', 'Rubricas2', sGravaPadrao);

  // Verbas Indenizatórias (34)
  CriaListaOpcoes(chklstRubrica3, ListaCodRubrica, sGravaPadrao, ',', false);
  ArqConfig.WriteString('REL_GRFC', 'Rubricas3', sGravaPadrao);

  // Verbas Indenizatórias (35)
  CriaListaOpcoes(chklstRubrica4, ListaCodRubrica, sGravaPadrao, ',', false);
  ArqConfig.WriteString('REL_GRFC', 'Rubricas4', sGravaPadrao);

  // Adiantamentos 13º
  CriaListaOpcoes(chklstRubrica5, ListaCodRubrica, sGravaPadrao, ',', false);
  ArqConfig.WriteString('REL_GRFC', 'Rubricas5', sGravaPadrao);

  ArqConfig.WriteString('REL_GRFC', 'Estabelec', qryEstab.FieldByName('IDPESSOA').asString);
  ArqConfig.WriteString('REL_GRFC', 'Percentual', FloatToStr(redPerc.Value));
end;

procedure TfrmParamGRFC.MontaListaFuncionarios;
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
      Add('  PESSOA PF, FUNCIONARIO F, SITFUNC ST, MOTIVO MO');
      Add('WHERE');
      Add('  (F.IDESTAB         = ' +qryEstab.FieldByName('IDPESSOA').asString+ ') AND');

      // C. de Custo(s) habilitados para o usuário
      if (sUsuXccusto <> '') then
      begin
        if (Pos(',',sUsuXccusto) > 0) then
          Add('  (F.CODCENTROCUSTO IN ' +sUsuXccusto+ ') AND')
        else
          Add('  (F.CODCENTROCUSTO  = ' +sUsuXccusto+ ') AND');
      end;

      Add('  (TO_CHAR(F.DATADESLIGAMENTO,''YYYY/MM'') = '+
        QuotedStr(RetornaAnoMes(dtedDataRef.Date))+') AND');

      Add('  (MO.MOTIVOFGTS    IN (''I1'',''I2'',''I3'',''I4'',''L'')) AND');
      Add('  (ST.TIPOSIT        = ''D'')       AND');
      Add('  (ST.IDSITFUNC      = F.IDSITFUNC) AND');
      Add('  (MO.IDMOTIVO       = F.IDMOTIVODESLIGRAIS) AND');
      Add('  (F.IDPESSOA        = PF.IDPESSOA)');
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
  end;
  HabilitaBtOk;
end;

procedure TfrmParamGRFC.HabilitaBtOk;
var
  c: integer;
  bSelFunc, bSelRub1, bSelRub2, bSelRub3, bSelRub4: boolean;
begin
  // Verifica se algum Funcionário foi selecionado
  bSelFunc := false;
  for c:=0 to chklstFunc.Items.Count-1 do
    if (chklstFunc.Checked[c]) then
    begin
      bSelFunc := true;
      break;
    end;

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

  bSelRub3 := false;
  for c:=0 to chklstRubrica3.Items.Count-1 do
    if (chklstRubrica3.Checked[c]) then
    begin
      bSelRub3 := true;
      break;
    end;

  bSelRub4 := false;
  for c:=0 to chklstRubrica4.Items.Count-1 do
    if (chklstRubrica4.Checked[c]) then
    begin
      bSelRub4 := true;
      break;
    end;

  bbtnConfirmar.Enabled := (bSelFunc) and (bSelRub2) and (bSelRub3) and (bSelRub4) and
    ((rgFGTSAnt.ItemIndex = 0) or ((rgFGTSAnt.ItemIndex = 1) and (bSelRub1))) and
    (dblkcbEstab.Text <> '') and (dblkcbResp.Text <> '') and
    (((rbRecDisAcordo.Checked) and (dtedDataDisAcordo.Text <> '')) or
     not(rbRecDisAcordo.Checked));
end;

procedure TfrmParamGRFC.rgFGTSAntClick(Sender: TObject);
begin
  HabilitaBtOk;
end;

end.
