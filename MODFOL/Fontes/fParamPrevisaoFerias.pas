// *****************************************************************************
// ***************************** REGISTRO DE ALTERAÇÕES ************************
// *****************************************************************************
// Autor(a)    :  Ádler Teodoro de Souza
// Data        :  19/02/2009
// Pendência   : SOL 109421 KINTANA 496332
// Descricao   :  Alteração de gravação de arquivos de log na raiz do disco C: .
//------------------------------------------------------------------------------

unit fParamPrevisaoFerias;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs, MAHlpBtn,
  StdCtrls, Buttons, TB97Tlbr, TB97, ExtCtrls, Db, DBTables, Wwquery, wwdblook, Spin,
  checklst, IvDictio, IvMulti, IvEMulti, DBGrids, ComCtrls, fSairAjuda,
  wwdbdatetimepicker, CMDateTimePicker;

type
  TfrmParamPrevisaoFerias = class(TfrmSairAjuda)
    qryEstab: TwwQuery;
    bbtnConfirmar: TBitBtn;
    ToolbarSep971: TToolbarSep97;
    gbxEstab: TGroupBox;
    dblkcbEstab: TwwDBLookupCombo;
    gbDataRef: TGroupBox;
    dtedDataRef: TCMDateTimePicker;
    rgSelDataLim: TRadioGroup;
    dtedDataLimIni: TCMDateTimePicker;
    stlblDataLim: TStaticText;
    dtedDataLimFin: TCMDateTimePicker;
    gbxFunc: TGroupBox;
    pgctrlEmpregados: TPageControl;
    tbshListaFunc: TTabSheet;
    chklstFunc: TCheckListBox;
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
    tbshCCusto: TTabSheet;
    chklstCCusto: TCheckListBox;
    cbkExibeDataProg: TCheckBox;
    bbtnSelTodos: TBitBtn;
    bbtnInverteSel: TBitBtn;
    gbxOrdem: TGroupBox;
    cmbOrderBy: TComboBox;
    gbxTipoPapel: TGroupBox;
    cmbTipoPapel: TComboBox;
    procedure FormCreate(Sender: TObject);
    procedure bbtnConfirmarClick(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure dblkcbEstabChange(Sender: TObject);
    procedure chklstFuncDrawItem(Control: TWinControl; Index: Integer; Rect: TRect;
      State: TOwnerDrawState);
    procedure gbxSituacaoEnter(Sender: TObject);
    procedure gbxSituacaoExit(Sender: TObject);
    procedure gbxTipContraEnter(Sender: TObject);
    procedure gbxTipContraExit(Sender: TObject);
    procedure chklstCCustoClickCheck(Sender: TObject);
    procedure bbtnSelTodosClick(Sender: TObject);
    procedure bbtnInverteSelClick(Sender: TObject);
    procedure dtedDataRefChange(Sender: TObject);
    procedure chklstFuncClickCheck(Sender: TObject);
    procedure rgSelDataLimClick(Sender: TObject);
    procedure pgctrlEmpregadosChange(Sender: TObject);
    procedure chklstFuncKeyDown(Sender: TObject; var Key: Word; Shift: TShiftState);
    procedure chklstCCustoKeyDown(Sender: TObject; var Key: Word; Shift: TShiftState);
  private
    procedure HabilitaBtOk;
    function  CalculaDatas: boolean;
    procedure GravaDadosQuery;
    procedure MontaListaFuncionarios;
    function  SelecionaTipoContrato: string;
    function  SelecionaSitFunc: string;
  end;

var
  frmParamPrevisaoFerias: TfrmParamPrevisaoFerias;

implementation

uses uSistema, uMensErro, uDiasUteis, uDataBase, uFuncoesUteis, UsoGeralRH, uComumRelats,
  fAguarde, dBaseDados, dFolha, dRelatorios1;

{$R *.DFM}

procedure TfrmParamPrevisaoFerias.FormCreate(Sender: TObject);
var
  iPos: integer;
begin
  inherited;
  if not(Assigned(ListaCodFunc)) then
    ListaCodFunc := TStringList.Create;
  if not(Assigned(ListaCodCCusto)) then
    ListaCodCCusto := TStringList.Create;
  IdEstab := -1;

  cmbTipoPapel.Items.Assign(dtmRelatorios1.rpPrevisaoFerias.PrinterSetup.PaperNames);

  iPos := ProcuraStList(cmbTipoPapel.Items, 'A4');
  if (iPos = -1) then
    cmbTipoPapel.ItemIndex := 0
  else
    cmbTipoPapel.ItemIndex := iPos;

  FazQuery(dtmBaseDados.qry, 'SELECT NORMALINI, NORMALFIM FROM PARAMRH');
  dtedDataRef.Date := dtmBaseDados.qry.FieldByName('NORMALINI').asDateTime;
  dtedDataLimIni.Date := dtmBaseDados.qry.FieldByName('NORMALINI').asDateTime;
  dtedDataLimFin.Date := dtmBaseDados.qry.FieldByName('NORMALFIM').asDateTime;

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

  // Monto a Lista de C. Custo
  chklstCCusto.Items.Clear;
  ListaCodCCusto.Clear;
  with (dtmBaseDados.qry) do
  begin
    Close;
    SQL.Clear;
    SQL.Add('SELECT');
    SQL.Add('  CODCENTROCUSTO, NOME');
    SQL.Add('FROM');
    SQL.Add('  CENTCUST');

    // C. de Custo(s) habilitado(s) para o usuário
    if (sUsuXccusto <> '') then
    begin
      if (Pos(',',sUsuXccusto) > 0) then
        SQL.Add('WHERE (CODCENTROCUSTO IN ' +sUsuXccusto+ ')')
      else
        SQL.Add('WHERE (CODCENTROCUSTO  = ' +sUsuXccusto+ ')');
    end;
    SQL.Add('ORDER BY');
    SQL.Add('  UPPER(NOME)');
    Open;
    while not(EOF) do
    begin
      ListaCodCCusto.Add(FieldByName('CODCENTROCUSTO').asString);
      chklstCCusto.Items.Add(FieldByName('NOME').asString);
      Next;
    end;
  end;

  cmbOrderBy.ItemIndex := 0;
  pgctrlEmpregados.ActivePageIndex := 0;

  HabilitaBtOk;
end;

procedure TfrmParamPrevisaoFerias.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  dtmBaseDados.qry.Close;
  qryEstab.Close;
  inherited;
end;

procedure TfrmParamPrevisaoFerias.chklstFuncDrawItem(Control: TWinControl; Index: Integer;
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

procedure TfrmParamPrevisaoFerias.dblkcbEstabChange(Sender: TObject);
begin
  if (qryEstab.FieldByName('IDPESSOA').asInteger <> IdEstab) then
  begin
    MontaListaFuncionarios;
    IdEstab := qryEstab.FieldByName('IDPESSOA').asInteger;

    if (pgctrlEmpregados.ActivePageIndex = 0) then
      chklstFunc.Repaint;
  end;
end;

procedure TfrmParamPrevisaoFerias.pgctrlEmpregadosChange(Sender: TObject);
begin
  bbtnSelTodos.Visible := (pgctrlEmpregados.ActivePageIndex in [0,2]);
  bbtnInverteSel.Visible := (pgctrlEmpregados.ActivePageIndex in [0,2]);
end;

procedure TfrmParamPrevisaoFerias.dtedDataRefChange(Sender: TObject);
begin
  HabilitaBtOk;
end;

procedure TfrmParamPrevisaoFerias.gbxTipContraEnter(Sender: TObject);
begin
  bTipContrEfet := cbxEfetivos.Checked;
  bTipContrEspec := cbxEspeciais.Checked;
  bTipContrTemp := cbxTemporarios.Checked;
  bTipContrEst := cbxEstagiarios.Checked;
  bTipContrTerc := cbxTerceiros.Checked;
  bTipContrProp := cbxPropDirSemVinc.Checked;
  bTipContrAut := cbxAutonomos.Checked;
end;

procedure TfrmParamPrevisaoFerias.gbxTipContraExit(Sender: TObject);
begin
  if not(cbxEfetivos.Checked) and not(cbxEspeciais.Checked) and not(cbxTemporarios.Checked) and
     not(cbxTerceiros.Checked) and not(cbxPropDirSemVinc.Checked) and
     not(cbxAutonomos.Checked) and not(cbxEstagiarios.Checked) then
  begin
    MsgDlg('Pelo menos um Tipo de Contrato deve ser selecionado.', 'Aviso',
      mtInformation, [mbOk,mbHelp], 0);
    cbxEfetivos.SetFocus;
  end
  else
  if (bTipContrEfet <> cbxEfetivos.Checked) or (bTipContrEspec <> cbxEspeciais.Checked) or
     (bTipContrTemp <> cbxTemporarios.Checked) or (bTipContrEst <> cbxEstagiarios.Checked) or
     (bTipContrTerc <> cbxTerceiros.Checked) or (bTipContrProp <> cbxPropDirSemVinc.Checked) or
     (bTipContrAut <> cbxAutonomos.Checked) then
    MontaListaFuncionarios;
end;

procedure TfrmParamPrevisaoFerias.gbxSituacaoEnter(Sender: TObject);
begin
  bSitAtivo := (cbxAtivos.Checked);
  bSitAfast := (cbxAfastados.Checked);
end;

procedure TfrmParamPrevisaoFerias.gbxSituacaoExit(Sender: TObject);
begin
  if not(cbxAtivos.Checked) and not(cbxAfastados.Checked) then
  begin
    MsgDlg('Pelo menos um Tipo de Situação deve ser selecionado.', 'Aviso',
      mtInformation, [mbOk,mbHelp], 0);
    cbxAtivos.SetFocus;
  end
  else
  if (bSitAtivo <> cbxAtivos.Checked) or (bSitAfast <> cbxAfastados.Checked) then
    MontaListaFuncionarios;
end;

procedure TfrmParamPrevisaoFerias.chklstFuncKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  if (Key = VK_TAB) then
    InvalidateItemListBox(TCustomListBox(Sender), TCustomListBox(Sender).ItemIndex);
end;

procedure TfrmParamPrevisaoFerias.chklstCCustoKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  if (Key = VK_TAB) then
    chklstCCustoClickCheck(Sender);
end;

procedure TfrmParamPrevisaoFerias.chklstFuncClickCheck(Sender: TObject);
begin
  InvalidateItemListBox(TCustomListBox(Sender), TCustomListBox(Sender).ItemIndex);
end;

procedure TfrmParamPrevisaoFerias.chklstCCustoClickCheck(Sender: TObject);
begin
  InvalidateItemListBox(TCustomListBox(Sender), TCustomListBox(Sender).ItemIndex);
  MontaListaFuncionarios;
end;

procedure TfrmParamPrevisaoFerias.bbtnSelTodosClick(Sender: TObject);
var
  c: integer;
begin
  case (pgctrlEmpregados.ActivePageIndex) of
    0 : chkListAux := chklstFunc;
    1 : chkListAux := chklstCCusto;
  end;

  for c:=0 to chkListAux.Items.Count-1 do
    chkListAux.Checked[c] := true;
  chkListAux.Repaint;

  if (pgctrlEmpregados.ActivePageIndex = 2) then
    MontaListaFuncionarios
  else
    HabilitaBtOk;
end;

procedure TfrmParamPrevisaoFerias.bbtnInverteSelClick(Sender: TObject);
var
  c: integer;
begin
  case (pgctrlEmpregados.ActivePageIndex) of
    0 : chkListAux := chklstFunc;
    1 : chkListAux := chklstCCusto;
  end;

  for c:=0 to chkListAux.Items.Count-1 do
    chkListAux.Checked[c] := not(chkListAux.Checked[c]);
  chkListAux.Repaint;

  if (pgctrlEmpregados.ActivePageIndex = 2) then
    MontaListaFuncionarios
  else
    HabilitaBtOk;
end;

procedure TfrmParamPrevisaoFerias.rgSelDataLimClick(Sender: TObject);
begin
  dtedDataLimIni.Visible := (rgSelDataLim.ItemIndex = 0);
  dtedDataLimFin.Visible := (rgSelDataLim.ItemIndex = 0);
  stlblDataLim.Visible := (rgSelDataLim.ItemIndex = 0);
end;

procedure TfrmParamPrevisaoFerias.bbtnConfirmarClick(Sender: TObject);
var
  wNum: word;
begin
  // C. de Custo selecionados
  CriaListaOpcoes(chklstCCusto, ListaCodCCusto, sCodCCustoSel, ',', true);

  // Funcionários escolhidos
  wNum := CriaListaOpcoes(chklstFunc, ListaCodFunc, sCodFuncSel, ',', false);
  if (wNum = ListaCodFunc.Count) then
    sCodFuncSel := '';

  // Monta Query
  dtmBaseDados.qry.Close;
  with (dtmBaseDados.qry.SQL) do
  begin
    Clear;
    Add('SELECT DISTINCT');
    // Dados do Estabelecimento
    Add('  RTRIM(PJ.RAZAOSOCIAL) AS ESTAB,');
    Add('  CGC.NUM AS CGC,');
    Add('  DECODE(NVL(SALDOFERIAS.DIASACUMFERIAS,0),0,');
    Add('  DECODE(TRUNC(TO_NUMBER(TO_CHAR(TO_DATE('+QuotedStr(dtedDataRef.Text));
    Add(',''DD/MM/YYYY''),''J'')) / TO_NUMBER(TO_CHAR(ADD_MONTHS(DECODE(FERIAS.DATA,'''',');
    Add('  ADD_MONTHS(F.DATAADMISSAO,-12),FERIAS.DATA),24),''J''))),0,0,30),30-SALDOFERIAS.DIASACUMFERIAS) AS SALDOFERIAS,');
    Add('  RTRIM(DECODE(RTRIM(ESTADUAL.NUMDOCUMENTO),'''',');
    Add('    DECODE(RTRIM(MUNICIPAL.NUMDOCUMENTO),'''','''',');
    Add('    ''Inscrição Municipal: ''|| MUNICIPAL.NUMDOCUMENTO),');
    Add('    ''Inscrição Estadual: '' || ESTADUAL.NUMDOCUMENTO)) AS ESTADUALMUNICIPAL,');
    Add('  RTRIM(E.LOGRADOURO) ||'', ''|| E.NUMERO ||');
    Add('    DECODE(RTRIM(E.COMPLEMENTO),NULL,'''','' - '' || RTRIM(E.COMPLEMENTO)) ||');
    Add('    DECODE(RTRIM(E.BAIRRO),NULL,'''','' - '' || RTRIM(E.BAIRRO)) ||');
    Add('    DECODE(RTRIM(CIDADES.NOME),NULL,'''','' - '' || RTRIM(CIDADES.NOME)) ||');
    Add('    '' - CEP:'' || RTRIM(SUBSTR(E.CEP,1,5)) ||''-''|| RTRIM(SUBSTR(E.CEP,6,3)) AS ENDERECO,');
    Add('  ES.CODESTADO AS UF,');
    // Dados do Funcionário
    Add('  F.MATRICULA,');
    Add('  UPPER(PF.NOME) AS EMPREGADO,');
    Add('  CC.CODCENTROCUSTO,');
    Add('  RTRIM(CC.NOME) AS NOMECENTROCUSTO,');
    Add('  TO_CHAR(F.DATAADMISSAO,''DD/MM/YYYY'') AS DATAADMISSAO,');
    Add('  TO_CHAR(FERIAS_EM_ABERTO.DATA,''DD/MM/YYYY'') AS DT_FERIAS_EM_ABERTO,');

    if (cbkExibeDataProg.Checked) then
    begin
      Add('  TO_CHAR(FERIAS_EM_ABERTO.GOZO,''DD'') AS DIA_DT_PROG,');
      Add('  TO_CHAR(FERIAS_EM_ABERTO.GOZO,''MM'') AS MES_DT_PROG,');
      Add('  TO_CHAR(FERIAS_EM_ABERTO.GOZO,''YYYY'') AS ANO_DT_PROG,');
    end;
    Add('  TO_CHAR(FERIAS.DATA,''DD/MM/YYYY'') AS DT_FERIAS,');
    Add('  TO_CHAR(FERIAS.ULT_FERIAS,''DD/MM/YYYY'') AS ULT_FERIAS');
    Add('FROM');
    Add('  PESSOA PJ, PESSOA PF, ENDPESS E, FUNCIONARIO F, CIDADES, ESTADO ES, CENTCUST CC,');
    Add('  SITFUNC ST,');
    // -------------------------------------------------------------------------- //
    // Férias gozadas do Funcionário
    Add('  (SELECT IDPESSOA, MAX(INIGOZOFERIAS) AS ULT_FERIAS, MAX(INIPERIODOFERIAS) AS DATA');
    Add('   FROM   FERIAS');
    Add('   WHERE');

    // Funcionário(s) selecionado(s)
    if (sCodFuncSel <> '') then
    begin
      if (Pos(',',sCodFuncSel) > 0) then
        Add('     (IDPESSOA         IN (' +sCodFuncSel+ ')) AND')
      else
        Add('     (IDPESSOA          = ' +sCodFuncSel+ ') AND');
    end;

    Add('     (FLGOCORRIDA       = 1) AND');
    Add('     (INIPERIODOFERIAS <= TO_DATE('+QuotedStr(dtedDataRef.Text)+',''DD/MM/YYYY''))');
    Add('   GROUP BY IDPESSOA) FERIAS,');
    // -------------------------------------------------------------------------- //
    // Férias em Aberto do Funcionário
    if (cbkExibeDataProg.Checked) then
      Add('  (SELECT IDPESSOA, MAX(INIPERIODOFERIAS) AS DATA, MAX(INIGOZOFERIAS) GOZO')
    else
      Add('  (SELECT IDPESSOA, MAX(INIPERIODOFERIAS) AS DATA');

    Add('   FROM FERIAS');
    Add('   WHERE');

    // Funcionário(s) selecionado(s)
    if (sCodFuncSel <> '') then
    begin
      if (Pos(',',sCodFuncSel) > 0) then
        Add('     (IDPESSOA         IN (' +sCodFuncSel+ ')) AND')
      else
        Add('     (IDPESSOA          = ' +sCodFuncSel+ ') AND');
    end;

    Add('     (FLGOCORRIDA       = 0) AND');
    Add('     (INIPERIODOFERIAS <= TO_DATE('+QuotedStr(dtedDataRef.Text)+',''DD/MM/YYYY''))');
    Add('   GROUP BY IDPESSOA) FERIAS_EM_ABERTO,');
    // -------------------------------------------------------------------------- //
    // Saldo de Férias do Funcionário
    Add('  (SELECT IDPESSOA,');
    Add('    MOD(SUM(FIMGOZOFERIAS - INIGOZOFERIAS + 1 +');
    Add('    DECODE(FLGABONO,0,0,DECODE(NVL(QTDIASABONO,0),0,');
    Add('    TRUNC((FIMGOZOFERIAS - INIGOZOFERIAS + 1)/2), QTDIASABONO))),30)');
    Add('    AS DIASACUMFERIAS');
    Add('   FROM  FERIAS');
    Add('   WHERE ');

    // Funcionário(s) selecionado(s)
    if (sCodFuncSel <> '') then
    begin
      if (Pos(',',sCodFuncSel) > 0) then
        Add('     (IDPESSOA         IN (' +sCodFuncSel+ ')) AND')
      else
        Add('     (IDPESSOA          = ' +sCodFuncSel+ ') AND');
    end;

    Add('     (INIPERIODOFERIAS <= TO_DATE('+QuotedStr(dtedDataRef.Text)+',''DD/MM/YYYY''))');
    Add('   GROUP BY IDPESSOA) SALDOFERIAS, ');
    // -------------------------------------------------------------------------- //
    // CGC/CNPJ do(s) Estabelecimento(s)
    Add('  (SELECT FP.IDFILIALPESSOA AS IDPESSOA,');
    Add('          RTRIM(TDO.SIGLADOCUMENTO ||'' ''|| DO.NUMDOCUMENTO) AS NUM');
    Add('   FROM   DOCPESSOA DO, TIPODOCOFICIAL TDO, FILIALPESSOA FP');
    Add('   WHERE  ((TDO.SIGLADOCUMENTO = ''CNPJ:'') OR');
    Add('           (TDO.SIGLADOCUMENTO = ''CGC:'')) AND');
    Add('          (TDO.IDDOCUMENTO     = DO.IDDOCUMENTO) AND');
    Add('          (FP.IDFILIALPESSOA   = DO.IDPESSOA)) CGC,');
    // ------------------------------------------------------------------------------- //
    // Inscrição Estadual do(s) Estabelecimento(s)
    Add('  (SELECT DO.IDPESSOA, TDO.CODDOCUMENTO, DO.NUMDOCUMENTO');
    Add('   FROM   DOCPESSOA DO, TIPODOCOFICIAL TDO');
    Add('   WHERE (TDO.SIGLADOCUMENTO = ''ESTADUAL:'') AND');
    Add('         (TDO.IDDOCUMENTO    = DO.IDDOCUMENTO)) ESTADUAL,');
    // -------------------------------------------------------------------------- //
    // Inscrição Municipal do(s) Estabelecimento(s)
    Add('  (SELECT DO.IDPESSOA, TDO.CODDOCUMENTO, DO.NUMDOCUMENTO');
    Add('   FROM   DOCPESSOA DO, TIPODOCOFICIAL TDO');
    Add('   WHERE (TDO.SIGLADOCUMENTO = ''MUNICIPAL:'') AND');
    Add('         (TDO.IDDOCUMENTO    = DO.IDDOCUMENTO)) MUNICIPAL');
    // -------------------------------------------------------------------------- //
    Add('WHERE');
    Add('  (PJ.IDPESSOA       = '+qryEstab.FieldByName('IDPESSOA').asString+') AND');

    // C. Custo(s) selecionado(s)
    if (sCodCCustoSel <> '') then
    begin
      if (Pos(',',sCodCCustoSel) > 0) then
        Add('  (CC.CODCENTROCUSTO  IN (' +sCodCCustoSel+ ')) AND')
      else
        Add('  (CC.CODCENTROCUSTO   = ' +sCodCCustoSel+ ') AND');
    end
    else
    begin
      // C. de Custo(s) habilitado(s) para o usuário
      if (sUsuXccusto <> '') then
        Add('  (F.CODCENTROCUSTO IN ' +sUsuXccusto+ ') AND');
    end;

    // Funcionário(s) selecionado(s)
    if (sCodFuncSel <> '') then
    begin
      if (Pos(',',sCodFuncSel) > 0) then
      begin
        Add('  (F.IDPESSOA         IN (' +sCodFuncSel+ ')) AND');
        Add('  (PF.IDPESSOA        IN (' +sCodFuncSel+ ')) AND');
      end
      else
      begin
        Add('  (F.IDPESSOA          = ' +sCodFuncSel+ ') AND');
        Add('  (PF.IDPESSOA         = ' +sCodFuncSel+ ') AND');
      end;
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
          Add('  (ST.TIPOSIT       IN (' +sAux+ ')) AND')
        else
          Add('  (ST.TIPOSIT        = ' +sAux+ ') AND');

      sAux := SelecionaTipoContrato;
      if (Pos(',',sAux) > 0) then
        Add('  (F.TIPOCONTRATO   IN (' +sAux+ ')) AND')
      else
        Add('  (F.TIPOCONTRATO    = ' +sAux+ ') AND');
    end;

    Add('  (ST.IDSITFUNC      = F.IDSITFUNC) AND');
    Add('  (PJ.IDPESSOA       = CGC.IDPESSOA) AND');
    Add('  (PJ.IDPESSOA       = F.IDESTAB) AND');
    Add('  (PJ.IDPESSOA       = E.IDPESSOA) AND');
    Add('  (PJ.IDENDCOMERCIAL = E.IDENDERECO) AND');
    Add('  (E.IDCIDADES       = CIDADES.IDCIDADES) AND');
    Add('  (CIDADES.IDESTADO  = ES.IDESTADO) AND');
    Add('  (F.CODCENTROCUSTO  = CC.CODCENTROCUSTO) AND');
    Add('  (F.IDPESSOA        = PF.IDPESSOA) AND');
    Add('  (F.IDPESSOA        = FERIAS.IDPESSOA(+)) AND');
    Add('  (F.IDPESSOA        = FERIAS_EM_ABERTO.IDPESSOA(+)) AND');
    Add('  (F.IDPESSOA        = SALDOFERIAS.IDPESSOA(+)) AND');
    Add('  (PJ.IDPESSOA       = ESTADUAL.IDPESSOA(+)) AND');
    Add('  (PJ.IDPESSOA       = MUNICIPAL.IDPESSOA(+))');
    Add('ORDER BY');
    case (cmbOrderBy.ItemIndex) of
      0 : Add('  NOMECENTROCUSTO, EMPREGADO');
      1 : Add('  NOMECENTROCUSTO, MATRICULA');
      2 : Add('  CODCENTROCUSTO, EMPREGADO');
      3 : Add('  CODCENTROCUSTO, MATRICULA');
      4 : Add('  EMPREGADO');
      5 : Add('  MATRICULA');
    end;
    //SaveToFile('c:\qry.txt');
    SaveToFile(Sistema.RetornaCaminhoArquivos(Sistema.IdEmpresa)+'\qry.txt');//Ádler Teodoro de Souza SOL 109421 KINTANA 496332
  end;

  with (dtmRelatorios1) do
  begin
    frmAguarde.Mostra('Previsão de Férias');
    frmAguarde.Pos := 0;

    // Aponto o UpdateSQL para a query principal
    qryPrevisaoFerias.UpdateObject := updSQL;

    if not(qryPrevisaoFerias.IsEmpty) then
      qryPrevisaoFerias.CancelUpdates;
    qryPrevisaoFerias.Close;
    qryPrevisaoFerias.Open;

    // Processa dados para a geração da query
    dtmBaseDados.qry.Open;
    GravaDadosQuery;
    qryPrevisaoFerias.First;

    // Especifico Configurações do Relatório
    rpPrevisaoFeriasLbl6.Visible := (cmbOrderBy.ItemIndex < 4);
    rpPrevisaoFeriasDBTxt7.Visible := (cmbOrderBy.ItemIndex < 4);
    rpPrevisaoFeriasDBTxt8.Visible := (cmbOrderBy.ItemIndex < 4);
    if (cmbOrderBy.ItemIndex < 4) then
      rpPrevisaoFeriasGrp1.BreakName := 'NOMECENTROCUSTO'
    else
      rpPrevisaoFeriasGrp1.BreakName := '';

    rpPrevisaoFerias.PrinterSetup.PaperName := cmbTipoPapel.Items[cmbTipoPapel.ItemIndex];
  end;
end;

// -------------------------------------------------------------------------------------
// Funções do Form
// -------------------------------------------------------------------------------------
procedure TfrmParamPrevisaoFerias.GravaDadosQuery;
begin
  with (dtmRelatorios1.qryPrevisaoFerias) do
  begin
    if not(dtmBaseDados.qry.IsEmpty) then
    begin
      frmAguarde.Min := 0;
      frmAguarde.Max := dtmBaseDados.qry.RecordCount;

      repeat
        Insert;
        if (CalculaDatas) then
        begin
          FieldByName('EMPRESA').asString := Sistema.NomeEmpresa;
          // Dados do Estabelecimento
          FieldByName('ESTAB').asString := dtmBaseDados.qry.FieldByName('ESTAB').asString;
          FieldByName('CGC').asString := dtmBaseDados.qry.FieldByName('CGC').asString;
          FieldByName('ESTADUALMUNICIPAL').asString := dtmBaseDados.qry.FieldByName('ESTADUALMUNICIPAL').asString;
          FieldByName('ENDERECO').asString := dtmBaseDados.qry.FieldByName('ENDERECO').asString;
          FieldByName('UF').asString := dtmBaseDados.qry.FieldByName('UF').asString;
          // Dados do Funcionário
          FieldByName('MATRICULA').asString := dtmBaseDados.qry.FieldByName('MATRICULA').asString;
          FieldByName('EMPREGADO').asString := dtmBaseDados.qry.FieldByName('EMPREGADO').asString;
          FieldByName('CODCENTROCUSTO').asString := dtmBaseDados.qry.FieldByName('CODCENTROCUSTO').asString;
          FieldByName('NOMECENTROCUSTO').asString := dtmBaseDados.qry.FieldByName('NOMECENTROCUSTO').asString;
          FieldByName('DATAADMISSAO').asString := dtmBaseDados.qry.FieldByName('DATAADMISSAO').asString;
          FieldByName('DT_FERIAS_EM_ABERTO').asString := dtmBaseDados.qry.FieldByName('DT_FERIAS_EM_ABERTO').asString;
          FieldByName('DT_FERIAS').asString := dtmBaseDados.qry.FieldByName('DT_FERIAS').asString;
          FieldByName('SALDOFERIAS').asInteger := dtmBaseDados.qry.FieldByName('SALDOFERIAS').asInteger;
          FieldByName('ULT_FERIAS').asString := dtmBaseDados.qry.FieldByName('ULT_FERIAS').asString;
          FieldByName('DATA_REF').asString := dtedDataRef.Text;

          if (cbkExibeDataProg.Checked) then
          begin
            FieldByName('DIA_DT_PROG').asString := dtmBaseDados.qry.FieldByName('DIA_DT_PROG').asString;
            FieldByName('MES_DT_PROG').asString := dtmBaseDados.qry.FieldByName('MES_DT_PROG').asString;
            FieldByName('ANO_DT_PROG').asString := dtmBaseDados.qry.FieldByName('ANO_DT_PROG').asString;
          end;

          Post;
        end
        else
          Cancel;

        frmAguarde.Pos := frmAguarde.Pos+1;

        dtmBaseDados.qry.Next;
      until (dtmBaseDados.qry.EOF);
    end;

    if (dtmBaseDados.qry.IsEmpty) or (IsEmpty) then
    begin
      ModalResult := mrNone;
      frmAguarde.Apaga;
      MsgDlg('Não há dados a serem exibidos.', 'Aviso', mtInformation, [mbOk,mbHelp], 0);
    end;
  end;
end;

function TfrmParamPrevisaoFerias.CalculaDatas: boolean;
var
  FeriasProp, FeriasVenc: integer;
  AuxFeriasProp, AuxDataRef: TDate;
  sDataLimite, sDataPerAquis: string;
begin
  // Seleciono qual data usar como Início do Período Aquisitivo
  if (Trim(dtmBaseDados.qry.FieldByName('DT_FERIAS_EM_ABERTO').asString) <> '') then
    sDataPerAquis := dtmBaseDados.qry.FieldByName('DT_FERIAS_EM_ABERTO').asString
  else
  if (Trim(dtmBaseDados.qry.FieldByName('DT_FERIAS').asString) <> '') then
  begin
    sDataPerAquis := dtmBaseDados.qry.FieldByName('DT_FERIAS').asString;
    if dtmBaseDados.qry.FieldByName('SALDOFERIAS').asInteger = 30 then
      sDataPerAquis := IncData(dtmBaseDados.qry.FieldByName('DT_FERIAS').asString,0,0,1);
    if dtmBaseDados.qry.FieldByName('SALDOFERIAS').asInteger =  0 then
      sDataPerAquis := IncData(dtmBaseDados.qry.FieldByName('DT_FERIAS').asString,0,0,1);
  end
  else
    sDataPerAquis := dtmBaseDados.qry.FieldByName('DATAADMISSAO').asString;


  // Calculo a Data Limite
  sDataLimite := IncData(sDataPerAquis,
                  iff(dtmBaseDados.qry.FieldByName('SALDOFERIAS').asInteger = 0, -30,
                       -dtmBaseDados.qry.FieldByName('SALDOFERIAS').asInteger),
                  24,0);

  Result := (rgSelDataLim.ItemIndex = 1) or
            ((StrToDate(sDataLimite) >= dtedDataLimIni.Date) and
             (StrToDate(sDataLimite) <= dtedDataLimFin.Date));

  if (Result) then
  begin
    // Calculo as férias vencidas
    FeriasVenc := (DiasUteis.IntervaloMeses(StrToDate(sDataPerAquis),
      StrToDate(dtedDataRef.Text)) div 12);

    // ----------------------------------------------------------------------------------
    // Calculo as férias proporcionais
    FeriasProp := 0;
    AuxFeriasProp := StrToDate(IncData(sDataPerAquis,0,0,FeriasVenc));
    AuxDataRef := StrToDate(dtedDataRef.Text);

    // Incremento o Contador das férias proporcionais até que as férias proporcionais sejam
    // maiores ou igual à data de referência
    while (AuxFeriasProp < AuxDataRef) do
    begin
      AuxFeriasProp := StrToDate(IncData(DateToStr(AuxFeriasProp),0,1,0));
      if (AuxFeriasProp < AuxDataRef) then
        Inc(FeriasProp);
    end;

    // Faço o acerto do Contador das férias proporcionais
    // Ex: Ini Per Aquis (11/07/2000) - Data Ref (31/07/2000)
    // Tem mais de quinze (15) dias entre eles, por isso incrementa o Contador das férias proporcionais
    AuxFeriasProp := StrToDate(IncData(DateToStr(AuxFeriasProp),0,-1,0));
    if ((AuxDataRef - AuxFeriasProp) >= 15) then
      Inc(FeriasProp);
    // Se após a contagem das férias proporcionais, esta for maior ou igual a um ano
    // acrescente um às férias vencidas
    if (FeriasProp >= 12) then
    begin
      FeriasProp := 0;
      Inc(FeriasVenc);
    end;
    // ----------------------------------------------------------------------------------

    // Gravo os dados
    with (dtmRelatorios1.qryPrevisaoFerias) do
    begin
      FieldByName('PER_AQUIS_INI').asString := sDataPerAquis;
      FieldByName('PER_AQUIS_FIN').asString := DateToStr(StrToDate(IncData(sDataPerAquis,0,0,1))-1);
      FieldByName('DATA_LIMITE').asString := sDataLimite;

      FieldByName('FERIAS_VENC').asInteger := FeriasVenc;
      FieldByName('FERIAS_PROP').asInteger := FeriasProp;
    end;
  end;    
end;

procedure TfrmParamPrevisaoFerias.HabilitaBtOk;
begin
  bbtnConfirmar.Enabled := (Trim(dblkcbEstab.Text) <> '') and
    (Trim(dtedDataRef.Text) <> '') and ((rgSelDataLim.ItemIndex = 1) or
    ((rgSelDataLim.ItemIndex = 0) and (Trim(dtedDataLimIni.Text) <> '') and
    (Trim(dtedDataLimFin.Text) <> '')));
end;

procedure TfrmParamPrevisaoFerias.MontaListaFuncionarios;
begin
  if (dblkcbEstab.Text <> '') then
  begin
    dtmBaseDados.qry.Close;
    ListaCodFunc.Clear;
    chklstFunc.Items.Clear;

    with (dtmBaseDados.qry.SQL) do
    begin
      Clear;
      Add('SELECT');
      Add('  PF.IDPESSOA, PF.NOME');
      Add('FROM');
      Add('  PESSOA PF, FUNCIONARIO F, SITFUNC ST');
      Add('WHERE');
      Add('  (F.IDESTAB         = ' +qryEstab.FieldByName('IDPESSOA').asString+ ') AND');

      sAux := SelecionaSitFunc;
      if (Pos(',',sAux) > 0) then
        Add('  (ST.TIPOSIT        IN (' +sAux+ ')) AND')
      else
        Add('  (ST.TIPOSIT         = ' +sAux+ ') AND');

      CriaListaOpcoes (chklstCCusto, ListaCodCCusto, sCodCCustoSel, ',', true);
      if (sCodCCustoSel <> '') then
      begin
        if (Pos(',',sCodCCustoSel) > 0) then
          Add('  (F.CODCENTROCUSTO IN (' +sCodCCustoSel+ ')) AND')
        else
          Add('  (F.CODCENTROCUSTO  = ' +sCodCCustoSel+ ') AND');
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
      end;

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

function TfrmParamPrevisaoFerias.SelecionaTipoContrato: string;
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

function TfrmParamPrevisaoFerias.SelecionaSitFunc: string;
begin
  sAux := '';
  if (cbxAtivos.Checked) then
    sAux := QuotedStr('A');

  if (cbxAfastados.Checked) then
    if (length(sAux) > 0) then
      sAux := sAux +','+ QuotedStr('F')
    else
      sAux := QuotedStr('F');

  Result := sAux;
end;

end.
