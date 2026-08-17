// *****************************************************************************
// ***************************** REGISTRO DE ALTERAÇÕES ************************
// *****************************************************************************
// Autor(a)    :  Ádler Teodoro de Souza
// Data        :  19/02/2009
// Pendência   : SOL 109421 KINTANA 496332
// Descricao   :  Alteração de gravação de arquivos de log na raiz do disco C: .
//------------------------------------------------------------------------------
unit fParamFichaFinanc;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs, IvDictio,
  IvMulti, IvEMulti, MAHlpBtn, StdCtrls, Buttons, TB97Tlbr, TB97, ExtCtrls, Db, Spin,
  DBTables, Wwquery, wwdblook, checklst, TREdit, ComCtrls, IniFiles, fSairAjuda;

type
  TfrmParamFichaFinanc = class(TfrmSairAjuda)
    qryEstab: TwwQuery;
    gbxEstab: TGroupBox;
    dblkcbEstab: TwwDBLookupCombo;
    gbxMesAnoRef: TGroupBox;
    cmbMes: TComboBox;
    speAno: TSpinEdit;
    gbxFunc: TGroupBox;
    pgctrlEmpregados: TPageControl;
    tbshListaFunc: TTabSheet;
    chklstFunc: TCheckListBox;
    bbtnSelTodosFunc: TBitBtn;
    bbtnInverteSelFunc: TBitBtn;
    tbshFiltroFunc: TTabSheet;
    gbxTipContra: TGroupBox;
    cbxEfetivos: TCheckBox;
    cbxEspeciais: TCheckBox;
    cbxTemporarios: TCheckBox;
    cbxEstagiarios: TCheckBox;
    cbxTerceiros: TCheckBox;
    cbxPropDirSemVinc: TCheckBox;
    cbxAutonomos: TCheckBox;
    gbxSituacao: TGroupBox;
    cbxAtivos: TCheckBox;
    cbxAfastados: TCheckBox;
    cbxDemitidos: TCheckBox;
    gbxRubrica: TGroupBox;
    Label2: TLabel;
    edCodRubricas: TEdit;
    sbtnMarcarRub: TBitBtn;
    chklstRubrica: TCheckListBox;
    bbtnSelTodosRub: TBitBtn;
    bbtnInverteSelRub: TBitBtn;
    gbxOrdem: TGroupBox;
    cmbOrderBy: TComboBox;
    gbxTipoPapel: TGroupBox;
    cmbTipoPapel: TComboBox;
    chkListaOutros: TCheckBox;
    bbtnConfirmar: TBitBtn;
    ToolbarSep971: TToolbarSep97;
    procedure bbtnConfirmarClick(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure dblkcbEstabChange(Sender: TObject);
    procedure chklstFuncDrawItem(Control: TWinControl; Index: Integer;
      Rect: TRect; State: TOwnerDrawState);
    procedure gbxSituacaoEnter(Sender: TObject);
    procedure gbxSituacaoExit(Sender: TObject);
    procedure gbxTipContraEnter(Sender: TObject);
    procedure gbxTipContraExit(Sender: TObject);
    procedure chklstFuncClickCheck(Sender: TObject);
    procedure bbtnSelTodosFuncClick(Sender: TObject);
    procedure bbtnInverteSelFuncClick(Sender: TObject);
    procedure chklstRubricaClickCheck(Sender: TObject);
    procedure sbtnMarcarRubClick(Sender: TObject);
    procedure bbtnSelTodosRubClick(Sender: TObject);
    procedure bbtnInverteSelRubClick(Sender: TObject);
    procedure speAnoChange(Sender: TObject);
    procedure chklstFuncKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
  private
    procedure LeAlteracoes;
    procedure GravaAlteracoes;
    procedure HabilitaBtOk;
    procedure GravaDadosQuery;
    procedure MontaListaFuncionarios;
    function  SelecionaTipoContrato: string;
    function  SelecionaSitFunc: string;
  end;

var
  frmParamFichaFinanc: TfrmParamFichaFinanc;

implementation

uses uSistema, uMensErro, uDataBase, fAguarde, dBaseDados,
  uFuncoesUteis, UsoGeralRH, uComumRelats, dRelatorios2;

{$R *.DFM}

procedure TfrmParamFichaFinanc.FormCreate(Sender: TObject);
var
  iPos: integer;
begin
  inherited;
  if not(Assigned(ListaCodFunc)) then
    ListaCodFunc := TStringList.Create;
  if not(Assigned(ListaCodRubrica)) then
    ListaCodRubrica := TStringList.Create;
  IDEstab := -1;

  cmbTipoPapel.Items.Assign (dtmRelatorios2.rpFichaFinanc.PrinterSetup.PaperNames);

  iPos := ProcuraStList (cmbTipoPapel.Items,'A4');
  if (iPos = -1) then
    cmbTipoPapel. ItemIndex := 0
  else
    cmbTipoPapel. ItemIndex := iPos;

  FazQuery(dtmBaseDados.qry,'SELECT NORMALINI FROM PARAMRH');
  cmbMes.ItemIndex := ExtraiMes(dtmBaseDados.qry.FieldByName('NORMALINI').asDateTime) - 1;
  speAno.Text      := Copy(dtmBaseDados.qry.FieldByName('NORMALINI').asString,7,4);

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

  // Monto a Lista de Rubricas
  chklstRubrica.Items.Clear;
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
      chklstRubrica.Items.Add(FieldByName('DESCRPROVDESC').asString);
      Next;
    end;
  end;

  cmbOrderBy.ItemIndex := 0;
  pgctrlEmpregados.ActivePageIndex := 0;

  // Carrega alterações nas opções feitas anteriormente
  LeAlteracoes;

  HabilitaBtOk;
end;

procedure TfrmParamFichaFinanc.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  GravaAlteracoes;

  dtmBaseDados.qry.Close;
  qryEstab.Close;
  inherited;
end;

procedure TfrmParamFichaFinanc.chklstFuncDrawItem(Control: TWinControl; Index: Integer;
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

procedure TfrmParamFichaFinanc.dblkcbEstabChange(Sender: TObject);
begin
  if (qryEstab.FieldByName('IDPESSOA').asInteger <> IDEstab) then
  begin
    MontaListaFuncionarios;
    IDEstab := qryEstab.FieldByName('IDPESSOA').asInteger;

    if (pgctrlEmpregados.ActivePageIndex = 0) then
      chklstFunc.Repaint;
  end;
end;

procedure TfrmParamFichaFinanc.speAnoChange(Sender: TObject);
begin
  HabilitaBtOk;
end;

procedure TfrmParamFichaFinanc.gbxTipContraEnter(Sender: TObject);
begin
  bTipContrEfet  := cbxEfetivos.Checked;
  bTipContrEspec := cbxEspeciais.Checked;
  bTipContrTemp  := cbxTemporarios.Checked;
  bTipContrEst   := cbxEstagiarios.Checked;
  bTipContrTerc  := cbxTerceiros.Checked;
  bTipContrProp  := cbxPropDirSemVinc.Checked;
  bTipContrAut   := cbxAutonomos.Checked;
end;

procedure TfrmParamFichaFinanc.gbxTipContraExit(Sender: TObject);
begin
  if not(cbxEfetivos.Checked)       and not(cbxEspeciais.Checked) and
     not(cbxTemporarios.Checked)    and not(cbxTerceiros.Checked) and
     not(cbxPropDirSemVinc.Checked) and not(cbxAutonomos.Checked) and
     not(cbxEstagiarios.Checked) then
  begin
    MsgDlg ('Pelo menos um Tipo de Contrato deve ser selecionado !','Aviso',
      mtInformation,[mbOk,mbHelp],0);
    cbxEfetivos.SetFocus;
  end
  else
  begin
    if (bTipContrEfet <> cbxEfetivos.Checked)    or (bTipContrEspec <> cbxEspeciais.Checked)      or
       (bTipContrTemp <> cbxTemporarios.Checked) or (bTipContrEst   <> cbxEstagiarios.Checked)    or
       (bTipContrTerc <> cbxTerceiros.Checked)   or (bTipContrProp  <> cbxPropDirSemVinc.Checked) or
       (bTipContrAut  <> cbxAutonomos.Checked) then
      MontaListaFuncionarios;
  end;
end;

procedure TfrmParamFichaFinanc.gbxSituacaoEnter(Sender: TObject);
begin
  bSitAtivo := (cbxAtivos.Checked);
  bSitAfast := (cbxAfastados.Checked);
  bSitDemit := (cbxDemitidos.Checked);
end;

procedure TfrmParamFichaFinanc.gbxSituacaoExit(Sender: TObject);
begin
  if not(cbxAtivos.Checked) and not(cbxAfastados.Checked) and not(cbxDemitidos.Checked) then
  begin
    MsgDlg ('Pelo menos um Tipo de Situação deve ser selecionado !', 'Aviso',
      mtInformation, [mbOk,mbHelp], 0);
    cbxAtivos.SetFocus;
  end
  else
  if (bSitAtivo <> cbxAtivos.Checked) or (bSitAfast <> cbxAfastados.Checked) or
     (bSitDemit <> cbxDemitidos.Checked) then
    MontaListaFuncionarios;
end;

procedure TfrmParamFichaFinanc.chklstFuncKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  if (Key = VK_TAB) then
    InvalidateItemListBox(TCustomListBox(Sender),TCustomListBox(Sender).ItemIndex);
end;

procedure TfrmParamFichaFinanc.chklstFuncClickCheck(Sender: TObject);
begin
  InvalidateItemListBox(TCustomListBox(Sender),TCustomListBox(Sender).ItemIndex);
  HabilitaBtOk;
end;

procedure TfrmParamFichaFinanc.chklstRubricaClickCheck(Sender: TObject);
begin
  CriaListaOpcoes (chklstRubrica, ListaCodRubrica, sCodRubricaSel, ',', false);
  edCodRubricas.Text := sCodRubricaSel;
  InvalidateItemListBox(TCustomListBox(Sender),TCustomListBox(Sender).ItemIndex);
  HabilitaBtOk;
end;

procedure TfrmParamFichaFinanc.sbtnMarcarRubClick(Sender: TObject);
begin
  edCodRubricas.Text := Trim(edCodRubricas.Text);
  VerificaOpcoes(chklstRubrica, ListaCodRubrica, edCodRubricas.Text, ',');
  HabilitaBtOk;
  chklstRubrica.Repaint;
end;

procedure TfrmParamFichaFinanc.bbtnSelTodosFuncClick(Sender: TObject);
var
  c: integer;
begin
  for c:=0 to chklstFunc.Items.Count-1 do
    chklstFunc.Checked[c] := true;

  chklstFunc.Repaint;
  HabilitaBtOk;
end;

procedure TfrmParamFichaFinanc.bbtnInverteSelFuncClick(Sender: TObject);
var
  c: integer;
begin
  for c:=0 to chklstFunc.Items.Count-1 do
    chklstFunc.Checked[c] := not(chklstFunc.Checked[c]);

  chklstFunc.Repaint;
  HabilitaBtOk;
end;

procedure TfrmParamFichaFinanc.bbtnSelTodosRubClick(Sender: TObject);
var
  c: integer;
begin
  CriaListaOpcoes (chklstRubrica, ListaCodRubrica, sCodRubricaSel, ',', false);
  edCodRubricas.Text := sCodRubricaSel;

  for c:=0 to chklstRubrica.Items.Count-1 do
    chklstRubrica.Checked[c] := true;

  chklstRubrica.Repaint;
  HabilitaBtOk;
end;

procedure TfrmParamFichaFinanc.bbtnInverteSelRubClick(Sender: TObject);
var
  c: integer;
begin
  CriaListaOpcoes (chklstRubrica, ListaCodRubrica, sCodRubricaSel, ',', false);
  edCodRubricas.Text := sCodRubricaSel;

  for c:=0 to chklstRubrica.Items.Count-1 do
    chklstRubrica.Checked[c] := not(chklstRubrica.Checked[c]);

  chklstRubrica.Repaint;
  HabilitaBtOk;
end;

procedure TfrmParamFichaFinanc.bbtnConfirmarClick(Sender: TObject);
var
  wNum: word;
begin
  // Funcionários escolhidos
  wNum := CriaListaOpcoes (chklstFunc, ListaCodFunc, sCodFuncSel, ',', false);
  if (wNum = ListaCodFunc.Count) then
    sCodFuncSel := '';

  // Rubricas para Remuneração selecionadas
  wNum := CriaListaOpcoes (chklstRubrica, ListaCodRubrica, sCodRubricaSel, ',', true);
  if (wNum = ListaCodRubrica.Count) then
    sCodRubricaSel := '';

  // Monta Query Auxiliar
  dtmBaseDados.qry.Close;
  with (dtmBaseDados.qry.SQL) do
  begin
    Clear;
    Add('SELECT DISTINCT');
    Add('  RTRIM(PJ.RAZAOSOCIAL) AS EMPRESA,');
    Add('  DECODE(PJ.NUMDOCUMENTO,NULL,'''',''CNPJ: '' || PJ.NUMDOCUMENTO) AS CGC,');
    Add('  ES.CODESTADO AS UF,');
    Add('  RTRIM(DECODE(RTRIM(ESTADUAL.NUMDOCUMENTO),'''',');
    Add('    DECODE(RTRIM(MUNICIPAL.NUMDOCUMENTO),'''','''',');
    Add('    ''Inscrição Municipal: ''|| MUNICIPAL.NUMDOCUMENTO),');
    Add('    ''Inscrição Estadual: '' || ESTADUAL.NUMDOCUMENTO)) AS ESTADUALMUNICIPAL,');
    Add('  RTRIM(E.LOGRADOURO) ||'', ''|| E.NUMERO ||');
    Add('    DECODE(RTRIM(E.COMPLEMENTO),NULL,'''','' - '' || RTRIM(E.COMPLEMENTO)) ||');
    Add('    DECODE(RTRIM(E.BAIRRO),     NULL,'''','' - '' || RTRIM(E.BAIRRO)) ||');
    Add('    DECODE(RTRIM(CIDADES.NOME), NULL,'''','' - '' || RTRIM(CIDADES.NOME)) ||');
    Add('    '' - CEP:'' || RTRIM(SUBSTR(E.CEP,1,5)) ||''-''|| RTRIM(SUBSTR(E.CEP,6,3)) AS ENDERECO,');
    Add('  HIST.MES,');
    Add('  F.MATRICULA,');
    Add('  PF.NOME          AS FUNCIONARIO,');
    Add('  CC.NOME          AS NOMECENTROCUSTO,');
    Add('  C.TITULO         AS NOMECARGO,');
    Add('  HIST.DESCRICAO   AS RUBRICA,');
    Add('  HIST.FLGDESCONTO AS TIPORUBRICA,');
    Add('  HIST.VALOR');
    Add('FROM');
    Add('  PESSOA PJ, PESSOA PF, ENDPESS E, FUNCIONARIO F, CIDADES, CENTCUST CC,');
    Add('  CARGO C, ESTADO ES, SITFUNC ST,');
    // -------------------------------------------------------------------------------- //
    Add('  (SELECT D.IDPESSOA, TD.CODDOCUMENTO, D.NUMDOCUMENTO, UPPER(TD.SIGLADOCUMENTO)');
    Add('   FROM   DOCPESSOA D, TIPODOCOFICIAL TD');
    Add('   WHERE (TD.SIGLADOCUMENTO = ''ESTADUAL'') AND');
    Add('         (D.IDPESSOA        = '+qryEstab.FieldByName('IDPESSOA').asString+') AND');
    Add('         (TD.IDDOCUMENTO    = D.IDDOCUMENTO)) ESTADUAL,');
    // -------------------------------------------------------------------------- //
    Add('  (SELECT D.IDPESSOA, TD.CODDOCUMENTO, D.NUMDOCUMENTO, UPPER(TD.SIGLADOCUMENTO)');
    Add('   FROM   DOCPESSOA D, TIPODOCOFICIAL TD');
    Add('   WHERE (TD.SIGLADOCUMENTO = ''MUNICIPAL'') AND');
    Add('         (D.IDPESSOA        = '+qryEstab.FieldByName('IDPESSOA').asString+') AND');    
    Add('         (TD.IDDOCUMENTO    = D.IDDOCUMENTO)) MUNICIPAL,');
    // -------------------------------------------------------------------------------- //
    Add('  (SELECT DISTINCT');
    Add('     F.IDPESSOA, H.MES, P.DESCRICAO, P.FLGDESCONTO, SUM(H.VALORPROVENTO) AS VALOR');
    Add('   FROM');
    Add('     HISTRUBSAL H, PROVDESC P, FUNCIONARIO F, SITFUNC ST');
    Add('   WHERE');
    Add('     (F.IDESTAB         = ' +qryEstab.FieldByName('IDPESSOA').asString+ ') AND');

    // Funcionário selecionado
    if (sCodFuncSel <> '') then
    begin
      if (Pos(',',sCodFuncSel) > 0) then
        Add('     (F.IDPESSOA       IN (' +sCodFuncSel+ ')) AND')
      else
        Add('     (F.IDPESSOA        = ' +sCodFuncSel+ ') AND');
    end
    else
    begin
      // C. de Custo(s) habilitados para o usuário
      if (sUsuXccusto <> '') then
      begin
        if (Pos(',',sUsuXccusto) > 0) then
          Add('     (F.CODCENTROCUSTO IN ' +sUsuXccusto+ ') AND')
        else
          Add('     (F.CODCENTROCUSTO  = ' +sUsuXccusto+ ') AND');
      end;

      sAux := SelecionaSitFunc;
      if (sAux <> '') then
        if (Pos(',',sAux) > 0) then
          Add('     (ST.TIPOSIT       IN (' +sAux+ ')) AND')
        else
          Add('     (ST.TIPOSIT        = ' +sAux+ ') AND');

      sAux := SelecionaTipoContrato;
      if (Pos(',',sAux) > 0) then
        Add('     (F.TIPOCONTRATO   IN (' +sAux+ ')) AND')
      else
        Add('     (F.TIPOCONTRATO    = ' +sAux+ ') AND');
    end;

    if not(chkListaOutros.Checked) then
      Add('     (P.FLGDESCONTO     < 2)          AND');

    if (sCodRubricaSel <> '') then
      if (Pos(',',sCodRubricaSel) > 0) then
        Add('     (H.CODPROVDESC    IN (' +sCodRubricaSel+ ')) AND')
      else
        Add('     (H.CODPROVDESC     = ' +sCodRubricaSel+ ') AND');

    Add('     (H.MES       BETWEEN ' +QuotedStr(speAno.Text +'/'+ PoeZero(cmbMes.ItemIndex+1))+ ' AND '+
      QuotedStr(IncDataAM(speAno.Text +'/'+ PoeZero(cmbMes.ItemIndex+1),11))+ ') AND');
    Add('     (ST.IDSITFUNC      = F.IDSITFUNC) AND');
    Add('     (F.IDPESSOA        = H.IDPESSOA)  AND');
    Add('     (H.IDRUBRICA       = P.IDPROVENTO)');
    Add('   GROUP BY');
    Add('     F.IDPESSOA, H.MES, P.DESCRICAO, P.FLGDESCONTO) HIST');
    // -------------------------------------------------------------------------------- //
    Add('WHERE');
    Add('  (PJ.IDPESSOA         = '+qryEstab.FieldByName('IDPESSOA').asString+') AND');

    // Funcionário selecionado
    if (sCodFuncSel <> '') then
    begin
      if (Pos(',',sCodFuncSel) > 0) then
        Add('  (F.IDPESSOA         IN (' +sCodFuncSel+ ')) AND')
      else
        Add('  (F.IDPESSOA          = ' +sCodFuncSel+ ') AND');
        
      Add('  (F.IDSITFUNC        = ST.IDSITFUNC)          AND');
    end
    else
    begin
      // C. de Custo(s) habilitados para o usuário
      if (sUsuXccusto <> '') then
      begin
        if (Pos(',',sUsuXccusto) > 0) then
          Add('  (F.CODCENTROCUSTO IN ' +sUsuXccusto+ ') AND')
        else
          Add('  (F.CODCENTROCUSTO  = ' +sUsuXccusto+ ') AND');
      end;

      sAux := SelecionaSitFunc;
      if (sAux <> '') then
        if (Pos(',',sAux) > 0) then
          Add('  (ST.TIPOSIT         IN (' +sAux+ ')) AND')
        else
          Add('  (ST.TIPOSIT          = ' +sAux+ ') AND');

      sAux := SelecionaTipoContrato;
      if (Pos(',',sAux) > 0) then
        Add('  (F.TIPOCONTRATO     IN (' +sAux+ ')) AND')
      else
        Add('  (F.TIPOCONTRATO      = ' +sAux+ ') AND');
      Add('  (ST.IDSITFUNC        = F.IDSITFUNC)          AND');
    end;

    Add('  (F.IDESTAB           = PJ.IDPESSOA)          AND');
    Add('  (F.IDPESSOA          = PF.IDPESSOA)          AND');
    Add('  (F.IDCARGO           = C.IDCARGO)            AND');
    Add('  (F.CODCENTROCUSTO    = CC.CODCENTROCUSTO)    AND');
    Add('  (F.IDPESSOA          = HIST.IDPESSOA)        AND');
    Add('  (PJ.IDENDCOMERCIAL   = E.IDENDERECO)         AND');
    Add('  (PJ.IDPESSOA         = E.IDPESSOA)           AND');
    Add('  (E.IDCIDADES         = CIDADES.IDCIDADES)    AND');
    Add('  (CIDADES.IDESTADO    = ES.IDESTADO)          AND');
    Add('  (PJ.IDPESSOA         = ESTADUAL.IDPESSOA(+)) AND');
    Add('  (PJ.IDPESSOA         = MUNICIPAL.IDPESSOA(+))');
    Add('ORDER BY');
    case (cmbOrderBy.ItemIndex) of
      0 : Add('  UPPER(FUNCIONARIO), FLGDESCONTO, UPPER(RUBRICA), MES');
      1 : Add('  MATRICULA, FLGDESCONTO, UPPER(RUBRICA), MES');
    end;
    //SaveToFile ('c:\qry.txt');
    SaveToFile (Sistema.RetornaCaminhoArquivos(Sistema.IdEmpresa)+'\qry.txt');//Ádler Teodoro de Souza SOL 109421 KINTANA 496332
  end;

  // Monta Query Principal
  with (dtmRelatorios2) do
  begin
    frmAguarde.Mostra('Ficha Financeira por Funcionário');
    frmAguarde.Pos := 0;

    // Aponto o UpdateSQL para a query principal
    qryFichaFinanc.UpdateObject := updSQL;

    if not(qryFichaFinanc.IsEmpty) then
      qryFichaFinanc.CancelUpdates;
    qryFichaFinanc.Close;
    qryFichaFinanc.Open;

    // Processa dados para a geração da query
    dtmBaseDados.qry.Open;
    GravaDadosQuery;
    qryFichaFinanc.First;

    // Especifico Configurações do Relatório
    rpFichaFinanc.PrinterSetup.PaperName := cmbTipoPapel.Items[cmbTipoPapel.ItemIndex];
    rpFichaFinancLblMESREF.Caption := 'FICHA FINANCEIRA POR FUNCIONÁRIO - ' +
      PoeZero(cmbMes.ItemIndex+1) +'/'+ speAno.Text +' A '+
      Copy(IncData('01/'+ PoeZero(cmbMes.ItemIndex+1) +'/'+ speAno.Text,0,11,0),4,7);
  end;
end;

// -------------------------------------------------------------------------------------
// Funções do Form
// -------------------------------------------------------------------------------------
procedure TfrmParamFichaFinanc.GravaDadosQuery;
const
  MES: array[1..12] of string[2] =
    ('01', '02', '03', '04', '05', '06', '07', '08', '09', '10', '11', '12');
  ANOMES: array[1..12] of string[7] =
    ('2000/03', '2000/04', '2000/05', '2000/06', '2000/07', '2000/08', '2000/09',
     '2000/10', '2000/11', '2000/12' ,'2001/01' ,'2001/02');
var
  c, iTipoRubrica: integer;
  sDataRef, sRubrica, sMatricula: string;
  rProv, rDesc, rOutr, rTot: array[1..12] of real;
  rTotAux: real;
begin
  with (dtmRelatorios2.qryFichaFinanc) do
  begin
    if not(dtmBaseDados.qry.IsEmpty) then
    begin
      frmAguarde.Min := 0;
      frmAguarde.Max := dtmBaseDados.qry.RecordCount;

      // Arrumo os Ponteiros dos meses
      sDataRef := speAno.Text +'/'+ PoeZero(cmbMes.ItemIndex + 1);
      for c:=1 to 12 do
      begin
        ANOMES[c] := sDataRef;
        MES[c]    := Copy(sDataRef,6,2);
        sDataRef  := IncDataAM(sDataRef,1);
      end;

      // Zero todos os Totais
      for c:=1 to 12 do
        rTot[c] := 0;

      // LOOP para todas as linhas
      repeat
        Insert;
        FieldByName('EMPRESA').asString          := dtmBaseDados.qry.FieldByName('EMPRESA').asString;
        FieldByName('CGC').asString              := dtmBaseDados.qry.FieldByName('CGC').asString;
        FieldByName('UF').asString               := dtmBaseDados.qry.FieldByName('UF').asString;
        FieldByName('INSCRICAO').asString        := dtmBaseDados.qry.FieldByName('ESTADUALMUNICIPAL').asString;
        FieldByName('ENDERECO').asString         := dtmBaseDados.qry.FieldByName('ENDERECO').asString;
        FieldByName('MATRICULA').asString        := dtmBaseDados.qry.FieldByName('MATRICULA').asString;
        FieldByName('FUNCIONARIO').asString      := dtmBaseDados.qry.FieldByName('FUNCIONARIO').asString;
        FieldByName('NOMECENTROCUSTO').asString  := dtmBaseDados.qry.FieldByName('NOMECENTROCUSTO').asString;
        FieldByName('NOMECARGO').asString        := dtmBaseDados.qry.FieldByName('NOMECARGO').asString;
        FieldByName('RUBRICA').asString          := dtmBaseDados.qry.FieldByName('RUBRICA').asString;

        case (dtmBaseDados.qry.FieldByName('TIPORUBRICA').asInteger) of
          0 : FieldByName('PROVENTODESCONTO').asString := 'PROVENTOS';
          1 : FieldByName('PROVENTODESCONTO').asString := 'DESCONTOS';
          2 : FieldByName('PROVENTODESCONTO').asString := 'OUTROS';
        end;

        // Labels dos Meses escolhidos pelo usuário
        for c:=1 to 12 do
          FieldByName('MES_'+PoeZero(c)).asString := MesCurto[StrToInt(MES[c])];

        iTipoRubrica := dtmBaseDados.qry.FieldByName('TIPORUBRICA').asInteger;
        sRubrica     := Trim(dtmBaseDados.qry.FieldByName('RUBRICA').asString);
        sMatricula   := dtmBaseDados.qry.FieldByName('MATRICULA').asString;

        // Zero totalizadores das Rubricas
        for c:=1 to 12 do
        begin
          rProv[c] := 0;
          rDesc[c] := 0;
          rOutr[c] := 0;
        end;

        // Preencho UMA Linha do MÊS ATUAL para a Rubrica do Funcionário
        repeat
          for c:=1 to 12 do
            if (ANOMES[c] = dtmBaseDados.qry.FieldByName('MES').asString) then
              break;

          case (dtmBaseDados.qry.FieldByName('TIPORUBRICA').asInteger) of
            0 : rProv[c] := dtmBaseDados.qry.FieldByName('VALOR').asFloat;
            1 : rDesc[c] := dtmBaseDados.qry.FieldByName('VALOR').asFloat;
            2 : rOutr[c] := dtmBaseDados.qry.FieldByName('VALOR').asFloat;
          end;

          frmAguarde.Pos := frmAguarde.Pos+1;
          dtmBaseDados.qry.Next;
        until (sMatricula <> dtmBaseDados.qry.FieldByName('MATRICULA').asString)     or
              (sRubrica   <> Trim(dtmBaseDados.qry.FieldByName('RUBRICA').asString)) or
              (dtmBaseDados.qry.EOF);

        case (iTipoRubrica) of
          0 : begin
                for c:=1 to 12 do
                  FieldByName('VALOR_' +PoeZero(c)).asFloat := rProv[c];

                for c:=1 to 12 do
                  rTot[c] := rTot[c] + rProv[c];
              end;
          1 : begin
                for c:=1 to 12 do
                  FieldByName('VALOR_' +PoeZero(c)).asFloat := rDesc[c];

                for c:=1 to 12 do
                  rTot[c] := rTot[c] - rDesc[c];
              end;
          2 : for c:=1 to 12 do
                FieldByName('VALOR_' +PoeZero(c)).asFloat := rOutr[c];
        end;

        rTotAux := 0;
        for c:=1 to 12 do
          rTotAux := rTotAux + (rProv[c] - rDesc[c]) + rOutr[c];
        FieldByName('TOT_LINHA').asFloat := rTotAux;

        if (sMatricula <> dtmBaseDados.qry.FieldByName('MATRICULA').asString) or
           (dtmBaseDados.qry.EOF) then
        begin
          for c:=1 to 12 do
            FieldByName('VALOR_TOT_' +PoeZero(c)).asFloat := rTot[c];

          rTotAux := 0;
          for c:=1 to 12 do
            rTotAux := rTotAux + rTot[c];
          FieldByName('TOT_LIQUIDO').asFloat := rTotAux;

          for c:=1 to 12 do
            rTot[c] := 0;
        end;
        Post;
      until (dtmBaseDados.qry.EOF);
    end
    else
    begin
      ModalResult := mrNone;
      frmAguarde.Apaga;
      MsgDlg('Não há dados a serem exibidos! Verifique.','Aviso',mtInformation,[mbOk,mbHelp],0);
    end;
  end;
end;

procedure TfrmParamFichaFinanc.LeAlteracoes;
var
  sEstab: string;
begin
  // Recupera as últimas alterações das opções
  //ArqConfig   := TIniFile.Create('C:\CONFIG_FOLHAPAGTO.INI');
  ArqConfig   := TIniFile.Create(Sistema.RetornaCaminhoArquivos(Sistema.IdEmpresa)+'\CONFIG_FOLHAPAGTO.INI');//Ádler Teodoro de Souza SOL 109421 KINTANA 496332
  sEstab      := ArqConfig.ReadString ('REL_FICHAFINANC', 'Estabelec', '');
  sCodRubricaSel := ArqConfig.ReadString ('REL_FICHAFINANC', 'Rubricas' , '');

  VerificaOpcoes(chklstRubrica, ListaCodRubrica,  sCodRubricaSel, ',');

  if (sEstab = '') then
  begin
    qryEstab.First;
    sEstab := qryEstab.FieldByName('IDPESSOA').asString;
  end;
  dblkcbEstab.LookUpValue := sEstab;
  dblkcbEstab.UpDate;

  edCodRubricas.Text := sCodRubricaSel;
end;

procedure TfrmParamFichaFinanc.GravaAlteracoes;
begin
  CriaListaOpcoes (chklstRubrica, ListaCodRubrica, sCodRubricaSel, ',', false);
  ArqConfig.WriteString ('REL_FICHAFINANC','Rubricas',sCodRubricaSel);

  ArqConfig.WriteString ('REL_FICHAFINANC','Estabelec',qryEstab.FieldByName('IDPESSOA').asString);
  ArqConfig.Free;
end;

procedure TfrmParamFichaFinanc.MontaListaFuncionarios;
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
      Add('  (F.IDESTAB         = ' +qryEstab.FieldByName('IDPESSOA').asString+ ') AND');

      // C. de Custo(s) habilitados para o usuário
      if (sUsuXccusto <> '') then
      begin
        if (Pos(',',sUsuXccusto) > 0) then
          Add('  (F.CODCENTROCUSTO IN ' +sUsuXccusto+ ') AND')
        else
          Add('  (F.CODCENTROCUSTO  = ' +sUsuXccusto+ ') AND');
      end;

      sAux := SelecionaSitFunc;
      if (Pos(',',sAux) > 0) then
        Add('  (ST.TIPOSIT        IN (' +sAux+ ')) AND')
      else
        Add('  (ST.TIPOSIT         = ' +sAux+ ') AND');

      sAux := SelecionaTipoContrato;
      if (Pos(',',sAux) > 0) then
        Add('  (F.TIPOCONTRATO    IN (' +sAux+ ')) AND')
      else
        Add('  (F.TIPOCONTRATO     = ' +sAux+ ') AND');

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
  end;
  HabilitaBtOk;
end;

procedure TfrmParamFichaFinanc.HabilitaBtOk;
begin
  bbtnConfirmar.Enabled := (dblkcbEstab.Text <> '') and (Trim(speAno.Text) <> '');
end;

function TfrmParamFichaFinanc.SelecionaTipoContrato: string;
begin
  sAux := '';
  if (cbxEfetivos.Checked) then
    sAux := QuotedStr('E');

  if (cbxEspeciais.Checked) then
    if (length(sAux) > 0) then
      sAux := sAux +','+ QuotedStr('S')
    else
      sAux := QuotedStr('S');

  if (cbxTemporarios.Checked) then
    if (length(sAux) > 0) then
      sAux := sAux +','+ QuotedStr('T')
    else
      sAux := QuotedStr('T');

  if (cbxTerceiros.Checked) then
    if (length(sAux) > 0) then
      sAux := sAux +','+ QuotedStr('3')
    else
      sAux := QuotedStr('3');

  if (cbxPropDirSemVinc.Checked) then
    if (length(sAux) > 0) then
      sAux := sAux +','+ QuotedStr('P')
    else
      sAux := QuotedStr('P');

  if (cbxAutonomos.Checked) then
    if (length(sAux) > 0) then
      sAux := sAux +','+ QuotedStr('A')
    else
      sAux := QuotedStr('A');

  if (cbxEstagiarios.Checked) then
    if (length(sAux) > 0) then
      sAux := sAux +','+ QuotedStr('G')
    else
      sAux := QuotedStr('G');

  Result := sAux;
end;

function TfrmParamFichaFinanc.SelecionaSitFunc: string;
begin
  sAux := '';
  if (cbxAtivos.Checked) then
    sAux := QuotedStr('A');

  if (cbxAfastados.Checked) then
    if (length(sAux) > 0) then
      sAux := sAux +','+ QuotedStr('F')
    else
      sAux := QuotedStr('F');

  if (cbxDemitidos.Checked) then
    if (length(sAux) > 0) then
      sAux := sAux +','+ QuotedStr('D')
    else
      sAux := QuotedStr('D');

  Result := sAux;
end;

end.
