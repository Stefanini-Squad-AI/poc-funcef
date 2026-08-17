// *****************************************************************************
// ***************************** REGISTRO DE ALTERAÇÕES ************************
// *****************************************************************************
// Autor(a)    :  Ádler Teodoro de Souza
// Data        :  19/02/2009
// Pendência   : SOL 109421 KINTANA 496332
// Descricao   :  Alteração de gravação de arquivos de log na raiz do disco C: .
//------------------------------------------------------------------------------
unit fParamGRFP;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs, MAHlpBtn,
  StdCtrls, Buttons, TB97Tlbr, TB97, ExtCtrls, Db, DBTables, Wwquery, Wwdatsrc,  
  wwdblook, checklst, TREdit, IvDictio, IvMulti, IvEMulti, IniFiles, ComCtrls,
  wwdbdatetimepicker, CMDateTimePicker, fSairAjuda;

type
  TfrmParamGRFP = class(TfrmSairAjuda)
    qryFunc: TwwQuery;
    qryEstab: TwwQuery;
    qryRubricas: TwwQuery;
    qryResp: TwwQuery;
    qryMotivo: TwwQuery;
    gbxEstab: TGroupBox;
    dblkcbEstab: TwwDBLookupCombo;
    gbDataRef: TGroupBox;
    dtedDataRef: TCMDateTimePicker;
    gbxResp: TGroupBox;
    dblkcbResp: TwwDBLookupCombo;
    gbxFunc: TGroupBox;
    chklstFunc: TCheckListBox;
    bbtnSelTodosFunc: TBitBtn;
    bbtnInverteSelFunc: TBitBtn;
    rgMotivo: TRadioGroup;
    gbxFolhaResc: TGroupBox;
    dblcMotivo: TwwDBLookupCombo;
    gbCodOp: TGroupBox;
    edCodOp: TEdit;
    gbxPercFPAS: TGroupBox;
    redPercFPAS: TRealEdit;
    rgFGTSAnt: TRadioGroup;
    gbxRubricas: TGroupBox;
    Label1: TLabel;
    edCodRubricas: TEdit;
    sbtnMarcarRub: TBitBtn;
    gbxTipoPapel: TGroupBox;
    cmbTipoPapel: TComboBox;
    Paginas: TPageControl;
    tbshRubrica1: TTabSheet;
    chklstRubrica1: TCheckListBox;
    tbshRubrica2: TTabSheet;
    chklstRubrica2: TCheckListBox;
    tbshRubrica3: TTabSheet;
    chklstRubrica3: TCheckListBox;
    tbshRubrica4: TTabSheet;
    chklstRubrica4: TCheckListBox;
    chkCalcValDevPrevSoc: TCheckBox;
    tbshAdto13: TTabSheet;
    chklstRubrica5: TCheckListBox;
    bbtnConfirmar: TBitBtn;
    ToolbarSep971: TToolbarSep97;
    procedure FormCreate(Sender: TObject);
    procedure bbtnConfirmarClick(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure dblkcbEstabChange(Sender: TObject);
    procedure rgMotivoClick(Sender: TObject);
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
    procedure chklstFuncKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure chklstRubrica1KeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
  private
    LiRubrica1, LiRubrica2, LiRubrica3, LiRubrica4, LiRubrica5: string;

    procedure LeAlteracoes;
    procedure GravaAlteracoes;
    procedure MontaListaFuncionarios;
    procedure HabilitaBtOk;
  end;

var
  frmParamGRFP: TfrmParamGRFP;

implementation

uses uSistema, uMensErro, uDataBase, fAguarde, dBaseDados,
  uFuncoesUteis, UsoGeralRH, uComumRelats, dRelatorios2;

{$R *.DFM}

procedure TfrmParamGRFP.FormCreate(Sender: TObject);
var
  iPos: integer;
begin
  inherited;
  if not(Assigned(ListaCodFunc)) then
    ListaCodFunc := TStringList.Create;
  if not(Assigned(ListaCodRubrica)) then
    ListaCodRubrica := TStringList.Create;
  IDEstab := -1;

  cmbTipoPapel.Items.Assign (dtmRelatorios2.rpGRFP.PrinterSetup.PaperNames);

  iPos := ProcuraStList (cmbTipoPapel.Items,'A4');
  if (iPos = -1) then
    cmbTipoPapel. ItemIndex := 0
  else
    cmbTipoPapel. ItemIndex := iPos;

  FazQuery(dtmBaseDados.qry,'SELECT NORMALINI FROM PARAMRH');
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

procedure TfrmParamGRFP.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  GravaAlteracoes;

  dtmBaseDados.qry.Close;
  qryEstab.Close;
  qryResp.Close;
  inherited;
end;

procedure TfrmParamGRFP.chklstRubrica1DrawItem(Control: TWinControl; Index: Integer;
  Rect: TRect; State: TOwnerDrawState);
begin
  with (TCheckListBox(Control).Canvas) do
  begin
    if (TCheckListBox(Control).Checked[Index]) then
    begin
      Brush.Color := CL_AMARELO_CLARO;
      Font.Color  := clBlack;
    end;

    FillRect(Rect);
    TextOut(Rect.Left, Rect.Top, TCheckListBox(Control).Items[Index]);
  end;
end;

procedure TfrmParamGRFP.dblkcbEstabChange(Sender: TObject);
begin
  if (qryEstab.FieldByName('IDPESSOA').asInteger <> IDEstab) then
  begin
    MontaListaFuncionarios;
    IDEstab := qryEstab.FieldByName('IDPESSOA').asInteger;
    chklstFunc.Repaint;
  end;
end;

procedure TfrmParamGRFP.dblkcbRespChange(Sender: TObject);
begin
  dblkcbResp.Text := Trim(dblkcbResp.Text);
  HabilitaBtOk;
end;

procedure TfrmParamGRFP.PaginasChange(Sender: TObject);
begin
  case (Paginas.ActivePageIndex) of
    0 : edCodRubricas.Text := LiRubrica1;
    1 : edCodRubricas.Text := LiRubrica2;
    2 : edCodRubricas.Text := LiRubrica3;
    3 : edCodRubricas.Text := LiRubrica4;
    4 : edCodRubricas.Text := LiRubrica5;
  end;
end;

procedure TfrmParamGRFP.dtedDataRefChange(Sender: TObject);
begin
  try
    StrToDate(dtedDataRef.Text);
    MontaListaFuncionarios;
  except
  end;
end;

procedure TfrmParamGRFP.chklstFuncKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  if (Key = VK_TAB) then
    chklstFuncClickCheck(Sender);
end;

procedure TfrmParamGRFP.chklstRubrica1KeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  if (Key = VK_TAB) then
    chklstRubrica1ClickCheck(Sender);
end;

procedure TfrmParamGRFP.chklstFuncClickCheck(Sender: TObject);
begin
  InvalidateItemListBox(TCustomListBox(Sender),TCustomListBox(Sender).ItemIndex);
  HabilitaBtOk;
end;

procedure TfrmParamGRFP.chklstRubrica1ClickCheck(Sender: TObject);
begin
  case (Paginas.ActivePageIndex) of
    0 : begin
          CriaListaOpcoes (chklstRubrica1, ListaCodRubrica, LiRubrica1, ',', false);
          edCodRubricas.Text := LiRubrica1;
        end;
    1 : begin
          CriaListaOpcoes (chklstRubrica2, ListaCodRubrica, LiRubrica2, ',', false);
          edCodRubricas.Text := LiRubrica2;
        end;
    2 : begin
          CriaListaOpcoes (chklstRubrica3, ListaCodRubrica, LiRubrica3, ',', false);
          edCodRubricas.Text := LiRubrica3;
        end;
    3 : begin
          CriaListaOpcoes (chklstRubrica4, ListaCodRubrica, LiRubrica4, ',', false);
          edCodRubricas.Text := LiRubrica4;
        end;
    4 : begin
          CriaListaOpcoes (chklstRubrica5, ListaCodRubrica, LiRubrica5, ',', false);
          edCodRubricas.Text := LiRubrica5;
        end;
  end;

  InvalidateItemListBox(TCustomListBox(Sender),TCustomListBox(Sender).ItemIndex);
  HabilitaBtOk;
end;

procedure TfrmParamGRFP.sbtnMarcarRubClick(Sender: TObject);
begin
  edCodRubricas.Text := Trim(edCodRubricas.Text);

  case (Paginas.ActivePageIndex) of
    0 : begin
          VerificaOpcoes (chklstRubrica1, ListaCodRubrica, edCodRubricas.Text, ',');
          LiRubrica1 := edCodRubricas.Text;
          chklstRubrica1.Repaint;
        end;
    1 : begin
          VerificaOpcoes (chklstRubrica2, ListaCodRubrica, edCodRubricas.Text, ',');
          LiRubrica2 := edCodRubricas.Text;
          chklstRubrica2.Repaint;
        end;
    2 : begin
          VerificaOpcoes (chklstRubrica3, ListaCodRubrica, edCodRubricas.Text, ',');
          LiRubrica3 := edCodRubricas.Text;
          chklstRubrica3.Repaint;
        end;
    3 : begin
          VerificaOpcoes (chklstRubrica4, ListaCodRubrica, edCodRubricas.Text, ',');
          LiRubrica4 := edCodRubricas.Text;
          chklstRubrica4.Repaint;
        end;
    4 : begin
          VerificaOpcoes (chklstRubrica5, ListaCodRubrica, edCodRubricas.Text, ',');
          LiRubrica5 := edCodRubricas.Text;
          chklstRubrica5.Repaint;
        end;
  end;
  HabilitaBtOk;
end;

procedure TfrmParamGRFP.bbtnSelTodosFuncClick(Sender: TObject);
var
  c: integer;
begin
  for c:=0 to chklstFunc.Items.Count-1 do
    chklstFunc.Checked[c] := true;
  chklstFunc.Repaint;
  HabilitaBtOk;
end;

procedure TfrmParamGRFP.bbtnInverteSelFuncClick(Sender: TObject);
var
  c: integer;
begin
  for c:=0 to chklstFunc.Items.Count-1 do
    chklstFunc.Checked[c] := not(chklstFunc.Checked[c]);
  chklstFunc.Repaint;
  HabilitaBtOk;
end;

procedure TfrmParamGRFP.rgMotivoClick(Sender: TObject);
begin
  gbxFolhaResc.Visible := (rgMotivo.ItemIndex = 2);
  if (rgMotivo.ItemIndex = 2) and not(qryMotivo.Active) then
    qryMotivo.Open;
end;

procedure TfrmParamGRFP.bbtnConfirmarClick(Sender: TObject);
var
  I, K: integer;
  sQueryRecFGTS, sAnoMes: string;
begin
  // Rubricas para Rem. Sem 13º selecionadas
  CriaListaOpcoes (chklstRubrica1, ListaCodRubrica, LiRubrica1, ',', true);

  // Rubricas para Remuneração Somente Parcela do 13º selecionadas
  CriaListaOpcoes (chklstRubrica2, ListaCodRubrica, LiRubrica2, ',', true);

  // Rubricas para Verbas Indenizatórias (34) selecionadas
  CriaListaOpcoes (chklstRubrica3, ListaCodRubrica, LiRubrica3, ',', true);

  // Rubricas para Verbas Indenizatórias (35) selecionadas
  CriaListaOpcoes (chklstRubrica4, ListaCodRubrica, LiRubrica4, ',', true);

  // Rubricas para Adiantamentos 13º selecionadas
  CriaListaOpcoes (chklstRubrica5, ListaCodRubrica, LiRubrica5, ',', true);

  // Empregados selecionados
  CriaListaOpcoes (chklstFunc, ListaCodFunc, sCodFuncSel, ',', false);

  // Pego todas as Rubricas Selecionadas para...

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
  for I:=0 to chklstRubrica2.Items.Count - 1 do
    if (chklstRubrica2.Checked[I]) then
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

  dtmRelatorios2.bFGTSAnt               := (rgFGTSAnt.ItemIndex = 1);
  dtmRelatorios2.rpGRFPlblCodOp.Caption := edCodOp.Text;
  dtmRelatorios2.qryGRFP.Close;
  with (dtmRelatorios2.qryGRFP.SQL) do
  begin
    Clear;
    Add('SELECT');
    // Dados do Estabelecimento
    Add('  UPPER(RTRIM(PJ.RAZAOSOCIAL)) AS EMPRESA,');
    Add('    DECODE(PJ.NUMDOCUMENTO,NULL,'''',PJ.NUMDOCUMENTO) AS CGC,');
    Add('  TEL.DDD    AS DDD,');
    Add('  TEL.NUMERO AS TELEFONE,');
    Add('  UPPER(RTRIM(E.LOGRADOURO) ||'', ''|| E.NUMERO ||''''||');
    Add('    DECODE(E.COMPLEMENTO,'' '','' - '' ||''''|| RTRIM(E.COMPLEMENTO))) AS ENDERECO,');
    Add('  UPPER(E.BAIRRO)     AS BAIRRO,');
    Add('  UPPER(CIDADES.NOME) AS CIDADE,');
    Add('  (RTRIM(CIDADES.NOME) ||''  '' || '+QuotedStr(Copy(dtedDataRef.Text,1,2)+
      ', '+MesExtensoAno(sAnoMes))+') AS LOCAL_DATA,');
    Add('  ES.CODESTADO AS UF,');
    Add('  RTRIM(SUBSTR(E.CEP,1,5)) ||''-''|| RTRIM(SUBSTR(E.CEP,6,3)) AS CEP,');
    Add('  FP.IDCONVPREVID        AS COD_TERCEIROS,');
    Add('  FP.IDITEMCNAE          AS CNAE,');

    if (redPercFPAS.Value = 0) then
      Add('  (CP.PERCCONVPREVID)  AS PERC_FPAS,')
    else
      Add('  ('+QuotedStr(FormatFloat('0.00',redPercFPAS.Value))+') AS PERC_FPAS,');

    Add('  FP.IDFPAS              AS FPAS,');
    Add('  SAT.PERCSEGACIDTRAB    AS SAT,');
    Add('  NVL(F.IDSITRISCO,NULL) AS OCORRENCIA,');
    Add('  (''NÃO'') AS SIMPLES,');
    Add('  (''1'') AS DISSIDIO,');
    Add('  DECODE(F.TIPOCONTRATO,''3'',');
    Add('      DECODE(PF.NUMDOCUMENTO,NULL,'''',PF.NUMDOCUMENTO),');
    Add('    ''A'',');
    Add('      CEI_TOMADOR.NUM,'''') AS INSCRICAO_TOMADOR,');
    Add('  UPPER(DECODE(F.TIPOCONTRATO,''3'',RTRIM(PF.NOME),''A'',RTRIM(PF.NOME),'''')) AS NOME_TOMADOR,');
    // Dados do Contato do Estabelecimento
    Add('  UPPER(SUBSTR('+QuotedStr(qryResp.FieldByName('NOME').asString)+',1,30))  AS CONTATO_NOME,');
    // Dados do Empregado
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
    Add('  MO.MOTIVOFGTS,');
    Add('  P.FLGDESCONTO,');
    Add('  ('+QuotedStr(Copy(dtedDataRef.Text,4,7))+') MES_ATUAL,');
    Add('  ('+QuotedStr(Copy(IncDataAM(sAnoMes,-1),6,2)+'/'+Copy(IncDataAM(sAnoMes,-1),1,4))+') MES_ANTERIOR,');

    // Cálculos da guia
    // (34) - Remuneração SEM 13º Salário (Mês Anterior)
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
      Add('  )),0) REM_SEM13_ANT,');
    end
    else
      Add('  (0) REM_SEM13_ANT,');

    // (34) - Remuneração SEM 13º Salário
    K := 1;
    Add('  NVL(DECODE(H.MES,'+QuotedStr(sAnoMes)+',');
    Add('    DECODE(RP.CODPROVDESC,');
    for I:=0 to chklstRubrica1.Items.Count - 1 do
      if (chklstRubrica1.Checked[I]) then
      begin
        Add('      '+IFF(k = 1,'',',')+QuotedStr(ListaCodRubrica.Strings[I])+',H.VALORPROVENTO');
        Inc(k);
      end;
    Add('  )),0) REM_SEM13,');

    // (35) - Remuneração SOMENTE parcela do 13º Salário (Mês Anterior)
    if (rgFGTSAnt.ItemIndex = 1) then
    begin
      K := 1;
      Add('  NVL(DECODE(H.MES,'+QuotedStr(IncDataAM(sAnoMes,-1))+',');
      Add('    DECODE(RP.CODPROVDESC,');
      for I:=0 to chklstRubrica2.Items.Count - 1 do
        if (chklstRubrica2.Checked[I]) then
        begin
          Add('      '+IFF(k = 1,'',',')+QuotedStr(ListaCodRubrica.Strings[I])+',H.VALORPROVENTO');
          Inc(k);
        end;
      Add('  )),0) REM_SOBRE13_ANT,');
    end
    else
      Add('  (0) REM_SOBRE13_ANT,');

    // (35) - Remuneração SOMENTE parcela do 13º Salário
    K := 1;
    Add('  NVL(DECODE(H.MES,'+QuotedStr(sAnoMes)+',');
    Add('    DECODE(RP.CODPROVDESC,');
    for I:=0 to chklstRubrica2.Items.Count - 1 do
      if (chklstRubrica2.Checked[I]) then
      begin
        Add('      '+IFF(k = 1,'',',')+QuotedStr(ListaCodRubrica.Strings[I])+',H.VALORPROVENTO');
        Inc(k);
      end;
    Add('  )),0) REM_SOBRE13,');

    // Adiantamentos 13º
    if (LiRubrica5 <> '') then
      Add('  VLR_ADTO13.VALOR AS ADTO13,')
    else
      Add('  (0) ADTO13,');    

    // (34) - Remuneração SEM 13º Salário (Verbas Indenizatórias)
    K := 1;
    Add('  NVL(DECODE(H.MES,'+QuotedStr(sAnoMes)+',');
    Add('    DECODE(RP.CODPROVDESC,');
    for I:=0 to chklstRubrica3.Items.Count - 1 do
      if (chklstRubrica3.Checked[I]) then
      begin
        Add('      '+IFF(k = 1,'',',')+QuotedStr(ListaCodRubrica.Strings[I])+',H.VALORPROVENTO');
        Inc(k);
      end;
    Add('  )),0) REM_SEM13_VERBINDENIZ,');

    // (35) - Remuneração SOBRE 13º Salário (Verbas Indenizatórias)
    K := 1;
    Add('  NVL(DECODE(H.MES,'+QuotedStr(sAnoMes)+',');
    Add('    DECODE(RP.CODPROVDESC,');
    for I:=0 to chklstRubrica4.Items.Count - 1 do
      if (chklstRubrica4.Checked[I]) then
      begin
        Add('      '+IFF(k = 1,'',',')+QuotedStr(ListaCodRubrica.Strings[I])+',H.VALORPROVENTO');
        Inc(k);
      end;
    Add('  )),0) REM_SOBRE13_VERBINDENIZ,');

    // (18) - Contribuição Descontada do Empregado
    Add('  NVL(DECODE(H.MES,'+QuotedStr(sAnoMes)+',');
    Add('    DECODE(P.CODRUBCLT,''50025'',H.VALORPROVENTO)),0) CONT_DESC_EMPR,');

    // (38) - Recolhimento da Multa Rescisória
    Add('  NVL(DECODE(H.MES,'+QuotedStr(sAnoMes)+',');
    Add('    DECODE(P.CODRUBCLT,''43689'',H.VALORPROVENTO)),0) MULTA_RES,');

    // (19) - Salário Família do Funcionário
    Add('  NVL(DECODE(H.MES,'+QuotedStr(sAnoMes)+',');
    Add('    DECODE(P.CODRUBCLT,''40573'',H.VALORPROVENTO)),0) SALARIO_FAM');
    // -------------------------------------------------------------------------- //
    Add('FROM');
    Add('  HISTRUBSAL H, PESSOA PJ, PESSOA PF, PESSOAFISICA PFIS, RUBRICAXPESS RP, PROVDESC P,');
    if (redPercFPAS.Value = 0) then
      Add('  ENDPESS E, FUNCIONARIO F, CIDADES, ESTADO ES, CONVPREVID CP, FPAS, SEGACIDTRAB SAT,')
    else
      Add('  ENDPESS E, FUNCIONARIO F, CIDADES, ESTADO ES, FPAS, SEGACIDTRAB SAT,');

    Add('  MOTIVO MO, FILIALPESSOA FP,');
    // -------------------------------------------------------------------------- //
    // Valor do Adiantamento do 13º
    if (LiRubrica5 <> '') then
    begin
      Add('  (SELECT H.IDPESSOA, SUM(DECODE(PD.FLGDESCONTO,0,H.VALORPROVENTO,1,-H.VALORPROVENTO)) AS VALOR');
      Add('   FROM   HISTRUBSAL H, PROVDESC PD');

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
    Add('   WHERE (TDO.SIGLADOCUMENTO = ''CTPS:'')       AND');
    Add('         (TDO.IDDOCUMENTO    = DP.IDDOCUMENTO)  AND');
    Add('         (DP.IDDOCUMENTO     = TDP.IDDOCUMENTO) AND');
    Add('         (DP.IDPESSOA        = F.IDPESSOA)      AND');
    Add('         (DP.IDPAIS          = PA.IDPAIS)       AND');
    Add('         (ES.IDPAIS          = PA.IDPAIS)       AND');
    Add('         (DP.IDESTADO        = ES.IDESTADO)) CTPS,');
    // -------------------------------------------------------------------------- //
    // PIS do Funcionário
    Add('  (SELECT F.IDPESSOA, TDP.MASCARA, DP.NUMDOCUMENTO AS NUM');
    Add('   FROM   DOCPESSOA DP, FUNCIONARIO F, TIPODOCPESSOA TDP, TIPODOCOFICIAL TDO');
    Add('   WHERE ((TDO.SIGLADOCUMENTO = ''PIS:'')         OR');
    Add('          (TDO.SIGLADOCUMENTO = ''PIS/PASEP:'')) AND');
    Add('         (TDO.IDDOCUMENTO     = DP.IDDOCUMENTO)  AND');
    Add('         (TDO.IDDOCUMENTO     = TDP.IDDOCUMENTO) AND');
    Add('         (DP.IDPESSOA         = F.IDPESSOA)) PIS,');
    // -------------------------------------------------------------------------- //
    // CEI do Tomador de Serviços
    Add('  (SELECT F.IDPESSOA, RTRIM(DO.NUMDOCUMENTO) AS NUM');
    Add('   FROM   DOCPESSOA DO, FUNCIONARIO F, TIPODOCOFICIAL TDO');
    Add('   WHERE (TDO.SIGLADOCUMENTO = ''CEI:'')       AND');
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

    Add('  ((P.CODRUBCLT      IN (''43689'',''50025'',''62022'',''40573'',');
    Add('                         ''60695'',''60696'',''60697'',''60698'')) OR');
    Add('   (RP.CODPROVDESC   IN (' +sQueryRecFGTS+ '))) AND');

    // Selecionou Recolhimento de FGTS no mês anterior ?
    if (rgFGTSAnt.ItemIndex = 1) then
    begin
      Add('  ((H.MES             = ' +QuotedStr(IncDataAM(sAnoMes,-1))+ ')         OR');
      Add('   (H.MES             = ' +QuotedStr(sAnoMes)+ '))       AND');
    end
    else
      Add('  (H.MES             = ' +QuotedStr(sAnoMes)+ ')        AND');

    Add('  (F.IDMOTIVODESLIGRAIS = MO.IDMOTIVO)    AND');
    Add('  (PJ.IDPESSOA       = FP.IDFILIALPESSOA) AND');
    Add('  (PF.IDPESSOA       = H.IDPESSOA)        AND');
    Add('  (P.IDPROVENTO      = RP.IDRUBRICA)      AND');
    Add('  (P.IDPROVENTO      = H.IDRUBRICA)       AND');
    Add('  (FP.IDFPAS         = FPAS.IDFPAS)       AND');
    if (redPercFPAS.Value = 0) then
    begin
      Add('  (FP.IDFPAS         = CP.IDFPAS)         AND');
      Add('  (FP.IDCONVPREVID   = CP.IDCONVPREVID)   AND');
    end;
    Add('  (PF.IDPESSOA       = F.IDPESSOA)     AND');
    Add('  (F.IDESTAB         = PJ.IDPESSOA)    AND');
    Add('  (F.IDPESSOA        = PFIS.IDPESSOA)  AND');
    Add('  (F.IDPESSOA        = CTPS.IDPESSOA)  AND');
    Add('  (F.IDPESSOA        = PIS.IDPESSOA)   AND');
    Add('  (FP.IDFILIALPESSOA = E.IDPESSOA)        AND');
    Add('  (PJ.IDENDCOMERCIAL = E.IDENDERECO)      AND');
    Add('  (E.IDCIDADES       = CIDADES.IDCIDADES) AND');
    Add('  (CIDADES.IDESTADO  = ES.IDESTADO)       AND');

    // Selecionou Adiantamento de 13º ?
    if (LiRubrica5 <> '') then
      Add('  (F.IDPESSOA        = VLR_ADTO13.IDPESSOA(+)) AND');

    Add('  (PJ.IDENDCOMERCIAL = TEL.IDENDERECO(+)) AND');
    Add('  (PF.IDPESSOA       = CEI_TOMADOR.IDPESSOA(+)) AND');
    Add('  (FP.IDSEGACIDTRAB  = SAT.IDSEGACIDTRAB(+))');
    Add('ORDER BY EMPREGADO');
    //SaveToFile('c:\qry.txt');
    SaveToFile(Sistema.RetornaCaminhoArquivos(Sistema.IdEmpresa)+'\qry.txt');//Ádler Teodoro de Souza SOL 109421 KINTANA 496332
  end;

  frmAguarde.Mostra('Impresso GRFP');
  frmAguarde.Pos := 0;
  dtmRelatorios2.qryGRFP.Open;

  if (dtmRelatorios2.qryGRFP.IsEmpty) then
  begin
    ModalResult := mrNone;
    frmAguarde.Apaga;
    MsgDlg('Não há dados a serem exibidos! Verifique.','Aviso',mtInformation,[mbOk,mbHelp],0);
  end
  else
    ModalResult := mrOk;

  with (dtmRelatorios2) do
  begin
    if (Trim(qryGRFP.FieldByName('MASCARA_CTPS').asString) <> '') then
      rpGRFPDBTextCTPS_NUM.DisplayFormat := qryGRFP.FieldByName('MASCARA_CTPS').asString+';0;_';
    if (Trim(qryGRFP.FieldByName('MASCARA_PIS').asString) <> '') then
      rpGRFPDBTextPIS.DisplayFormat := qryGRFP.FieldByName('MASCARA_PIS').asString+';0;_';

    bCalcValDevPrevSoc := chkCalcValDevPrevSoc.Checked;

    rpGRFP.PrinterSetup.PaperName := cmbTipoPapel.Items[cmbTipoPapel.ItemIndex];
  end;
end;

// -------------------------------------------------------------------------------------
// Funções do Form
// -------------------------------------------------------------------------------------
procedure TfrmParamGRFP.LeAlteracoes;
var
  sEstab: string;
begin
  // Recupera as últimas alterações das opções
  //ArqConfig  := TIniFile.Create('C:\CONFIG_FOLHAPAGTO.INI');
  ArqConfig  := TIniFile.Create(Sistema.RetornaCaminhoArquivos(Sistema.IdEmpresa)+'\CONFIG_FOLHAPAGTO.INI');//Ádler Teodoro de Souza SOL 109421 KINTANA 496332
  sEstab     := ArqConfig.ReadString ('REL_GRFP', 'Estabelec', '');
  LiRubrica1 := ArqConfig.ReadString ('REL_GRFP', 'Rubricas1', '');
  LiRubrica2 := ArqConfig.ReadString ('REL_GRFP', 'Rubricas2', '');
  LiRubrica3 := ArqConfig.ReadString ('REL_GRFP', 'Rubricas3', '');
  LiRubrica4 := ArqConfig.ReadString ('REL_GRFP', 'Rubricas4', '');
  LiRubrica5 := ArqConfig.ReadString ('REL_GRFP', 'Rubricas5', '');

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

  chkCalcValDevPrevSoc.Checked := (ArqConfig.ReadString ('REL_GRFP', 'CalcValDevPrevSoc', 'F') = 'V');

  edCodRubricas.Text := LiRubrica1;

  HabilitaBtOk;
end;

procedure TfrmParamGRFP.GravaAlteracoes;
var
  sGravaPadrao: string;
begin
  // Grava as últimas alterações da Opção de Rubricas para ...

  // Remuneração sem 13º
  CriaListaOpcoes (chklstRubrica1, ListaCodRubrica, sGravaPadrao, ',', false);
  ArqConfig.WriteString ('REL_GRFP','Rubricas1',sGravaPadrao);

  // Remuneração somente parcela de 13º
  CriaListaOpcoes (chklstRubrica2, ListaCodRubrica, sGravaPadrao, ',', false);
  ArqConfig.WriteString ('REL_GRFP','Rubricas2',sGravaPadrao);

  // Verbas Indenizatórias (34)
  CriaListaOpcoes (chklstRubrica3, ListaCodRubrica, sGravaPadrao, ',', false);
  ArqConfig.WriteString ('REL_GRFP','Rubricas3',sGravaPadrao);

  // Verbas Indenizatórias (35)
  CriaListaOpcoes (chklstRubrica4, ListaCodRubrica, sGravaPadrao, ',', false);
  ArqConfig.WriteString ('REL_GRFP','Rubricas4',sGravaPadrao);

  // Adiantamentos 13º
  CriaListaOpcoes (chklstRubrica5, ListaCodRubrica, sGravaPadrao, ',', false);
  ArqConfig.WriteString ('REL_GRFP','Rubricas5',sGravaPadrao);

  ArqConfig.WriteString ('REL_GRFP','Estabelec',qryEstab.FieldByName('IDPESSOA').asString);

  sGravaPadrao := IFF(chkCalcValDevPrevSoc.Checked,'V','F');
  ArqConfig.WriteString ('REL_GRFP', 'CalcValDevPrevSoc', sGravaPadrao);
end;

procedure TfrmParamGRFP.MontaListaFuncionarios;
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

      Add('  (MO.MOTIVOFGTS    IN (''I'',''L'')) AND');
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

procedure TfrmParamGRFP.HabilitaBtOk;
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

  bbtnConfirmar.Enabled := (bSelFunc) and (bSelRub1) and (bSelRub2) and (bSelRub3) and
    (bSelRub4) and (dblkcbEstab.Text <> '') and (dblkcbResp.Text <> '');
end;

end.
