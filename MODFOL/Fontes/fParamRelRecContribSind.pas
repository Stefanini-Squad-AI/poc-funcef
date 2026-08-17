// *****************************************************************************
// ***************************** REGISTRO DE ALTERAÇÕES ************************
// *****************************************************************************
// Autor(a)    :  Ádler Teodoro de Souza
// Data        :  19/02/2009
// Pendência   : SOL 109421 KINTANA 496332
// Descricao   :  Alteração de gravação de arquivos de log na raiz do disco C: .
//------------------------------------------------------------------------------

unit fParamRelRecContribSind;

interface

uses
  Windows, Messages, SysUtils, Classes , Graphics, Controls, Forms, Dialogs, IvDictio,
  IvMulti , IvEMulti, MAHlpBtn, StdCtrls, Buttons, TB97Tlbr, TB97, ExtCtrls, Db, Spin,
  DBTables, Wwquery, IniFiles, checklst, TREdit, ComCtrls, wwdbdatetimepicker,
  CMDateTimePicker, fSairAjuda, wwdblook;

type
  TfrmParamRelRecContribSind = class(TfrmSairAjuda)
    gbxSindicato: TGroupBox;
    chklstSindicato: TCheckListBox;
    bbtnSelTodosSindi: TBitBtn;
    bbtnInverteSelSindi: TBitBtn;
    gbxDataProcess: TGroupBox;
    cmbMes: TComboBox;
    speAno: TSpinEdit;
    gbxTipoPapel: TGroupBox;
    cmbTipoPapel: TComboBox;
    gbxRubricas: TGroupBox;
    Label5: TLabel;
    pgctrlRubricas: TPageControl;
    tbshRubRem: TTabSheet;
    chklstRubrica1: TCheckListBox;
    tbshRubContrib: TTabSheet;
    chklstRubrica2: TCheckListBox;
    edCodRubricas: TEdit;
    sbtnMarcarRub: TBitBtn;
    bbtnSelTodasRub: TBitBtn;
    bbtnInverteSelRub: TBitBtn;
    bbtnConfirmar: TBitBtn;
    ToolbarSep971: TToolbarSep97;
    chkbTipoFolha: TCheckBox;
    dblkcbMotivo: TwwDBLookupCombo;
    qryMotivo: TwwQuery;
    procedure FormCreate(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure bbtnConfirmarClick(Sender: TObject);
    procedure sbtnMarcarRubClick(Sender: TObject);
    procedure chklstRubrica1DrawItem(Control: TWinControl; Index: Integer; Rect: TRect;
      State: TOwnerDrawState);
    procedure pgctrlRubricasChange(Sender: TObject);
    procedure bbtnSelTodasRubClick(Sender: TObject);
    procedure bbtnInverteSelRubClick(Sender: TObject);
    procedure chklstRubrica1ClickCheck(Sender: TObject);
    procedure speAnoChange(Sender: TObject);
    procedure chklstSindicatoClickCheck(Sender: TObject);
    procedure bbtnSelTodosSindiClick(Sender: TObject);
    procedure bbtnInverteSelSindiClick(Sender: TObject);
    procedure chklstRubrica1KeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure chklstSindicatoKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure chkbTipoFolhaClick(Sender: TObject);
  private
    ListaCodSind: TStringList;
    sCodSindSel, sCodRubricaSel2: string;

    procedure LeAlteracoes;
    procedure GravaAlteracoes;
    procedure HabilitaBtOk;
  end;

var
  frmParamRelRecContribSind: TfrmParamRelRecContribSind;

implementation

uses uSistema, uMensErro, uDataBase, fAguarde, dBaseDados,
  uFuncoesUteis, uComumRelats, dRelatorios;

{$R *.DFM}

procedure TfrmParamRelRecContribSind.FormCreate(Sender: TObject);
var
  iPos: integer;
begin
  inherited;
  if not(Assigned(ListaCodRubrica)) then
    ListaCodRubrica := TStringList.Create;
  ListaCodSind := TStringList.Create;

  cmbTipoPapel.Items.Assign (dtmRelatorios.rpRelRecContribSind.PrinterSetup.PaperNames);

  iPos := ProcuraStList (cmbTipoPapel.Items,'A4');
  if (iPos = -1) then
    cmbTipoPapel. ItemIndex := 0
  else
    cmbTipoPapel. ItemIndex := iPos;

  FazQuery(dtmBaseDados.qry,'SELECT NORMALINI FROM PARAMRH');
  cmbMes.ItemIndex := ExtraiMes(dtmBaseDados.qry.FieldByName('NORMALINI').asDateTime) - 1;
  speAno.Text      := Copy(dtmBaseDados.qry.FieldByName('NORMALINI').asString,7,4);

  // Monto a Lista de Sindicatos
  chklstSindicato.Items.Clear;
  ListaCodSind.Clear;
  with (dtmBaseDados.qry) do
  begin
    Close;
    SQL.Clear;
    SQL.Add('SELECT DISTINCT');
    SQL.Add('  P.IDPESSOA, P.NOME');
    SQL.Add('FROM');
    SQL.Add('  PESSOA P, PESSOAFISICA PEFIS, FUNCIONARIO F, SINDICATO S, FILIALPESSOA FP');
    SQL.Add('WHERE');
    SQL.Add('  (FP.IDFILIALPESSOA = F.IDESTAB)         AND');
    SQL.Add('  (F.IDPESSOA        = PEFIS.IDPESSOA)    AND');
    SQL.Add('  (S.IDPESSOA        = PEFIS.IDSINDICATO) AND');
    SQL.Add('  (S.IDPESSOA        = P.IDPESSOA)');
    SQL.Add('ORDER BY');
    SQL.Add('  UPPER(NOME)');
    Open;
    while not(EOF) do
    begin
      ListaCodSind.Add(FieldByName('IDPESSOA').asString);
      chklstSindicato.Items.Add(FieldByName('NOME').asString);
      Next;
    end;
  end;

  // Monto a Lista de Rubricas
  chklstRubrica1.Items.Clear;
  chklstRubrica2.Items.Clear;
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
      Next;
    end;
  end;

  pgctrlRubricas.ActivePageIndex := 0;

  // Carrega alterações nas opções feitas anteriormente
  LeAlteracoes;
end;

procedure TfrmParamRelRecContribSind.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  GravaAlteracoes;

  dtmBaseDados.qry.Close;

  if (chkbTipoFolha.Checked) then
    qryMotivo.Close;
  inherited;
  ListaCodSind.Free;
end;

procedure TfrmParamRelRecContribSind.chklstRubrica1DrawItem(Control: TWinControl; Index: Integer;
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

procedure TfrmParamRelRecContribSind.speAnoChange(Sender: TObject);
begin
  HabilitaBtOk;
end;

procedure TfrmParamRelRecContribSind.pgctrlRubricasChange(Sender: TObject);
begin
  edCodRubricas.Text := IFF(pgctrlRubricas.ActivePageIndex=0, sCodRubricaSel, sCodRubricaSel2);
end;

procedure TfrmParamRelRecContribSind.chklstSindicatoKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  if (Key = VK_TAB) then
    chklstSindicatoClickCheck(Sender);
end;

procedure TfrmParamRelRecContribSind.chklstRubrica1KeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  if (Key = VK_TAB) then
    chklstRubrica1ClickCheck(Sender);
end;

procedure TfrmParamRelRecContribSind.chklstSindicatoClickCheck(Sender: TObject);
begin
  InvalidateItemListBox(TCustomListBox(Sender),TCustomListBox(Sender).ItemIndex);
  HabilitaBtOk;
end;

procedure TfrmParamRelRecContribSind.chklstRubrica1ClickCheck(Sender: TObject);
begin
  if (pgctrlRubricas.ActivePageIndex = 0) then
  begin
    CriaListaOpcoes (chklstRubrica1, ListaCodRubrica, sCodRubricaSel, ',', false);
    edCodRubricas.Text := sCodRubricaSel;
  end
  else
  begin
    CriaListaOpcoes (chklstRubrica2, ListaCodRubrica, sCodRubricaSel2, ',', false);
    edCodRubricas.Text := sCodRubricaSel2;
  end;                            
  InvalidateItemListBox(TCustomListBox(Sender),TCustomListBox(Sender).ItemIndex);
  HabilitaBtOk;
end;

procedure TfrmParamRelRecContribSind.bbtnSelTodosSindiClick(Sender: TObject);
var
  c: integer;
begin
  for c:=0 to chklstSindicato.Items.Count-1 do
    chklstSindicato.Checked[c] := true;
  chklstSindicato.Repaint;
  HabilitaBtOk;
end;

procedure TfrmParamRelRecContribSind.bbtnInverteSelSindiClick(Sender: TObject);
var
  c: integer;
begin
  for c:=0 to chklstSindicato.Items.Count-1 do
    chklstSindicato.Checked[c] := not(chklstSindicato.Checked[c]);
  chklstSindicato.Repaint;
  HabilitaBtOk;
end;

procedure TfrmParamRelRecContribSind.bbtnSelTodasRubClick(Sender: TObject);
var
  c: integer;
begin
  if (pgctrlRubricas.ActivePageIndex = 0) then
  begin
    for c:=0 to chklstRubrica1.Items.Count-1 do
      chklstRubrica1.Checked[c] := true;

    CriaListaOpcoes (chklstRubrica1, ListaCodRubrica, sCodRubricaSel, ',', false);
    edCodRubricas.Text := sCodRubricaSel;
    chklstRubrica1.Repaint;
  end
  else
  begin
    for c:=0 to chklstRubrica2.Items.Count-1 do
      chklstRubrica2.Checked[c] := true;

    CriaListaOpcoes (chklstRubrica2, ListaCodRubrica, sCodRubricaSel2, ',', false);
    edCodRubricas.Text := sCodRubricaSel2;
    chklstRubrica2.Repaint;
  end;                    
  HabilitaBtOk;
end;

procedure TfrmParamRelRecContribSind.bbtnInverteSelRubClick(Sender: TObject);
var
  c: integer;
begin
  inherited;
  if (pgctrlRubricas.ActivePageIndex = 0) then
  begin
    for c:=0 to chklstRubrica1.Items.Count-1 do
      chklstRubrica1.Checked[c] := not(chklstRubrica1.Checked[c]);

    CriaListaOpcoes (chklstRubrica1, ListaCodRubrica, sCodRubricaSel, ',', false);
    edCodRubricas.Text := sCodRubricaSel;
    chklstRubrica1.Repaint;
  end
  else
  begin
    for c:=0 to chklstRubrica2.Items.Count-1 do
      chklstRubrica2.Checked[c] := not(chklstRubrica2.Checked[c]);

    CriaListaOpcoes (chklstRubrica2, ListaCodRubrica, sCodRubricaSel2, ',', false);
    edCodRubricas.Text := sCodRubricaSel2;
    chklstRubrica2.Repaint;
  end;
  HabilitaBtOk;
end;

procedure TfrmParamRelRecContribSind.sbtnMarcarRubClick(Sender: TObject);
begin
  edCodRubricas.Text := Trim(edCodRubricas.Text);

  if (pgctrlRubricas.ActivePageIndex = 0) then
  begin
    VerificaOpcoes (chklstRubrica1, ListaCodRubrica, edCodRubricas.Text, ',');
    sCodRubricaSel := edCodRubricas.Text;
    chklstRubrica1.Repaint;
  end
  else
  begin
    VerificaOpcoes (chklstRubrica2, ListaCodRubrica, edCodRubricas.Text, ',');
    sCodRubricaSel2 := edCodRubricas.Text;
    chklstRubrica2.Repaint;
  end;  
  HabilitaBtOk;  
end;

procedure TfrmParamRelRecContribSind.bbtnConfirmarClick(Sender: TObject);
var
  sPeriodo: string;
begin
  // Sindicatos selecionados
  CriaListaOpcoes (chklstSindicato, ListaCodSind, sCodSindSel, ',', false);

  // Rubricas para Remuneração selecionadas
  CriaListaOpcoes (chklstRubrica1, ListaCodRubrica, sCodRubricaSel, ',', true);

  // Rubricas para Contribuição selecionadas
  CriaListaOpcoes (chklstRubrica2, ListaCodRubrica, sCodRubricaSel2, ',', true);

  // Guarda o Período escolhido
  sPeriodo := speAno.Text +'/'+ PoeZero(cmbMes.ItemIndex+1);

  dtmRelatorios.qryRelRecContribSind.Close;
  with (dtmRelatorios.qryRelRecContribSind.SQL) do
  begin
    Clear;
    Add('SELECT');
    // Dados do Estabelecimento
    Add('  PJ.RAZAOSOCIAL AS EMPRESA,');
    Add('  ''CNPJ: ''|| DECODE(RTRIM(PJ.NUMDOCUMENTO),NULL,NULL,RTRIM(PJ.NUMDOCUMENTO)) AS CNPJ,');
    Add('  RTRIM(E.LOGRADOURO) ||'', ''|| E.NUMERO || DECODE(RTRIM(E.COMPLEMENTO),NULL,NULL,');
    Add('    '' - '' || RTRIM(E.COMPLEMENTO ||'' - '')) || RTRIM(E.BAIRRO) ||'' - ''||');
    Add('    RTRIM(CIDADES.NOME) ||'' - CEP:''|| RTRIM(SUBSTR(E.CEP,1,5)) ||''-''||');
    Add('    RTRIM(SUBSTR(E.CEP,6,3) || DECODE(ES.CODESTADO,NULL,NULL,'' - '' || ES.CODESTADO)) AS ENDERECO,');
    // Dados do Sindicato
    Add('  UPPER(PS.RAZAOSOCIAL) AS SINDICATO,');
    // Dados do Empregado
    Add('  PF.NOME  AS EMPREGADO,');
    Add('  C.TITULO AS CARGO,');
    Add('  ('+QuotedStr(MesExtensoAno(speAno.Text +'/'+ PoeZero(cmbMes.ItemIndex+1)))+') AS MES_REF,');
    Add('  VLR_REM.VALOR     AS REMUNERACAO,');
    Add('  VLR_CONTRIB.VALOR AS CONTRIBUICAO');
    // ------------------------------------------------------------------ //
    Add('FROM');
    Add('  PESSOA PS, PESSOA PJ, PESSOA PF, PESSOAFISICA PEFIS, FUNCIONARIO F,');
    Add('  ENDPESS E, CIDADES, ESTADO ES, CARGO C, FILIALPESSOA FP,');
    // -------------------------------------------------------------------------------- //
    // Contribuição de cada Empregado
    Add('  (SELECT F.IDPESSOA, F.IDESTAB, SUM(H.VALORPROVENTO) AS VALOR');
    Add('   FROM   HISTRUBSAL H, PESSOAFISICA P, FUNCIONARIO F, RUBRICAXPESS RP, SINDICATO S');
    Add('   WHERE');

    if (Pos(',',sCodSindSel) > 0) then
      Add('     (S.IDPESSOA     IN (' +sCodSindSel+ ')) AND')
    else
      Add('     (S.IDPESSOA      = ' +sCodSindSel+ ') AND');

    if (Pos(',',sCodRubricaSel2) > 0) then
      Add('     (RP.CODPROVDESC IN (' +sCodRubricaSel2+ ')) AND')
    else
      Add('     (RP.CODPROVDESC  = ' +sCodRubricaSel2+ ') AND');

    Add('     (H.MES           = '+QuotedStr(sPeriodo)+') AND');

    if (chkbTipoFolha.Checked) then
      Add('     (H.IDMOTIVO      = ' +qryMotivo.FieldByName('IDMOTIVO').asString+ ') AND');
      
    Add('     (RP.IDRUBRICA    = H.IDRUBRICA) AND');
    Add('     (F.IDPESSOA      = P.IDPESSOA)  AND');
    Add('     (P.IDPESSOA      = H.IDPESSOA)  AND');
    Add('     (P.IDSINDICATO   = S.IDPESSOA)');
    Add('   GROUP BY F.IDPESSOA, F.IDESTAB) VLR_CONTRIB,');
    // -------------------------------------------------------------------------------- //
    // Remuneração de cada Empregado
    Add('  (SELECT F.IDPESSOA, F.IDESTAB, SUM(H.VALORPROVENTO) AS VALOR');
    Add('   FROM   HISTRUBSAL H, PESSOAFISICA P, FUNCIONARIO F, RUBRICAXPESS RP, SINDICATO S');
    Add('   WHERE');

    if (Pos(',',sCodSindSel) > 0) then
      Add('     (S.IDPESSOA     IN (' +sCodSindSel+ ')) AND')
    else
      Add('     (S.IDPESSOA      = ' +sCodSindSel+ ') AND');

    if (Pos(',',sCodRubricaSel) > 0) then
      Add('     (RP.CODPROVDESC IN (' +sCodRubricaSel+ ')) AND')
    else
      Add('     (RP.CODPROVDESC  = ' +sCodRubricaSel+ ') AND');

    Add('     (H.MES           = '+QuotedStr(sPeriodo)+') AND');

    if (chkbTipoFolha.Checked) then
      Add('     (H.IDMOTIVO      = ' +qryMotivo.FieldByName('IDMOTIVO').asString+ ') AND');

    Add('     (RP.IDRUBRICA    = H.IDRUBRICA) AND');
    Add('     (F.IDPESSOA      = P.IDPESSOA)  AND');
    Add('     (P.IDPESSOA      = H.IDPESSOA)  AND');
    Add('     (P.IDSINDICATO   = S.IDPESSOA)');
    Add('   GROUP BY F.IDPESSOA, F.IDESTAB) VLR_REM');
    // ------------------------------------------------------------------ //
    Add('WHERE');

    if (Pos(',',sCodSindSel) > 0) then
      Add('  (PS.IDPESSOA      IN (' +sCodSindSel+ ')) AND')
    else
      Add('  (PS.IDPESSOA       = ' +sCodSindSel+ ') AND');

    Add('  (FP.IDFILIALPESSOA = VLR_REM.IDESTAB)     AND');
    Add('  (FP.IDFILIALPESSOA = VLR_CONTRIB.IDESTAB) AND');
    Add('  (FP.IDFILIALPESSOA = PJ.IDPESSOA)         AND');
    Add('  (FP.IDFILIALPESSOA = F.IDESTAB)           AND');
    Add('  (FP.IDFILIALPESSOA = E.IDPESSOA)          AND');
    Add('  (PJ.IDENDCOMERCIAL = E.IDENDERECO)        AND');
    Add('  (E.IDCIDADES       = CIDADES.IDCIDADES)   AND');
    Add('  (CIDADES.IDESTADO  = ES.IDESTADO)         AND');
    Add('  (F.IDCARGO         = C.IDCARGO)           AND');
    Add('  (F.IDPESSOA        = PF.IDPESSOA)         AND');
    Add('  (F.IDPESSOA        = PEFIS.IDPESSOA)      AND');
    Add('  (PEFIS.IDSINDICATO = PS.IDPESSOA)         AND');
    Add('  (PF.IDPESSOA       = VLR_REM.IDPESSOA)    AND');
    Add('  (PF.IDPESSOA       = VLR_CONTRIB.IDPESSOA)');
    Add('ORDER BY SINDICATO, EMPREGADO');
    //SaveToFile ('c:\qry.txt');
    SaveToFile (Sistema.RetornaCaminhoArquivos(Sistema.IdEmpresa)+'\qry.txt');//Ádler Teodoro de Souza SOL 109421 KINTANA 496332

  end;

  frmAguarde.Mostra('Recolhimento da Contrib. Sindical');
  frmAguarde.Pos := 0;
  dtmRelatorios.qryRelRecContribSind.Open;
  frmAguarde.Max := dtmRelatorios.qryRelRecContribSind.RecordCount;
  frmAguarde.Min := 0;

  if (dtmRelatorios.qryRelRecContribSind.IsEmpty) then
  begin
    ModalResult := mrNone;
    frmAguarde.Apaga;
    MsgDlg('Não há dados a serem exibidos! Verifique.','Aviso',mtInformation,[mbOk,mbHelp],0);
  end
  else
    ModalResult := mrOk;

  dtmRelatorios.rpRelRecContribSind.PrinterSetup.PaperName := cmbTipoPapel.Items[cmbTipoPapel.ItemIndex];
end;

// -------------------------------------------------------------------------------------
// Funções do Form
// -------------------------------------------------------------------------------------
procedure TfrmParamRelRecContribSind.LeAlteracoes;
begin
  // Recupera as últimas alterações das opções
  //ArqConfig := TIniFile.Create('C:\CONFIG_FOLHAPAGTO.INI');
  ArqConfig := TIniFile.Create(Sistema.RetornaCaminhoArquivos(Sistema.IdEmpresa)+ '\CONFIG_FOLHAPAGTO.INI');//Ádler Teodoro de Souza SOL 109421 KINTANA 496332

  chkbTipoFolha.Checked := (ArqConfig.ReadString ('REL_RELRECCONTRIBSIND','SomenteTipoFolha','F') = 'V');
  if (chkbTipoFolha.Checked) then
  begin
    qryMotivo.Open;
    sAux := ArqConfig.ReadString ('REL_RELRECCONTRIBSIND', 'TipoFolha', '');
    if (sAux = '') then
    begin
      qryMotivo.First;
      sAux := qryMotivo.FieldByName('IDMOTIVO').asString;
    end;
    dblkcbMotivo.LookUpValue := sAux;
    dblkcbMotivo.Update;
    qryMotivo.Open;
  end;
  dblkcbMotivo.Visible := chkbTipoFolha.Checked;

  sCodRubricaSel2 := ArqConfig.ReadString ('REL_RELRECCONTRIBSIND', 'RubRem', '');
  VerificaOpcoes(chklstRubrica1, ListaCodRubrica, sCodRubricaSel2, ',');

  sCodRubricaSel := ArqConfig.ReadString ('REL_RELRECCONTRIBSIND', 'RubContrib', '');
  VerificaOpcoes(chklstRubrica2, ListaCodRubrica, sCodRubricaSel, ',');

  edCodRubricas.Text := sCodRubricaSel2;
end;

procedure TfrmParamRelRecContribSind.GravaAlteracoes;
var
  sGravaPadrao: string;
begin
  sGravaPadrao := IFF(chkbTipoFolha.Checked,'V','F');
  ArqConfig.WriteString ('REL_RELRECCONTRIBSIND','SomenteTipoFolha', sGravaPadrao);

  if (chkbTipoFolha.Checked) then
    ArqConfig.WriteString ('REL_RELRECCONTRIBSIND', 'TipoFolha', qryMotivo.FieldByName('IDMOTIVO').asString);

  // Grava as últimas alterações da Opção de Rubricas para Remuneração
  CriaListaOpcoes (chklstRubrica1, ListaCodRubrica, sGravaPadrao, ',', false);
  ArqConfig.WriteString ('REL_RELRECCONTRIBSIND','RubRem',sGravaPadrao);

  // Grava as últimas alterações da Opção de Rubricas para Cotribuição
  CriaListaOpcoes (chklstRubrica2, ListaCodRubrica, sGravaPadrao, ',', false);
  ArqConfig.WriteString ('REL_RELRECCONTRIBSIND','RubContrib',sGravaPadrao);
end;

procedure TfrmParamRelRecContribSind.HabilitaBtOk;
var
  c: integer;
  bSelSind, bSelRub1, bSelRub2: boolean;
begin
  bSelSind := false;
  for c:=0 to chklstSindicato.Items.Count-1 do
    if (chklstSindicato.Checked[c]) then
    begin
      bSelSind := true;
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

  bbtnConfirmar.Enabled := (bSelSind) and (bSelRub1) and (bSelRub2) and (Trim(speAno.Text) <> '');
end;

procedure TfrmParamRelRecContribSind.chkbTipoFolhaClick(Sender: TObject);
begin
  dblkcbMotivo.Visible := chkbTipoFolha.Checked;
  if (chkbTipoFolha.Checked) and not(qryMotivo.Active) then
    qryMotivo.Open;
end;

end.
