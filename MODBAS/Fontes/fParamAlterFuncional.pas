unit fParamAlterFuncional;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs, MAHlpBtn, TB97,
  TB97Tlbr, StdCtrls, Buttons, ExtCtrls, Db, DBTables, Wwquery, wwdblook, Spin, checklst,
  IvDictio, IvMulti, IvEMulti, ComCtrls, wwdbdatetimepicker, fSairAjuda, CMDateTimePicker;

type
  TfrmParamAlterFuncional = class(TfrmSairAjuda)
    qryEstab: TwwQuery;
    gbxEstab: TGroupBox;
    dblkcbEstab: TwwDBLookupCombo;
    gbxIntervRef: TGroupBox;
    Label1: TLabel;
    Label2: TLabel;
    dtedIni: TCMDateTimePicker;
    dtedFin: TCMDateTimePicker;
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
    gbxOrdem: TGroupBox;
    cmbOrderBy: TComboBox;
    gbxTipoPapel: TGroupBox;
    cmbTipoPapel: TComboBox;
    gbxSituacao: TGroupBox;
    cbxAtivos: TCheckBox;
    cbxAfastados: TCheckBox;
    cbxDemitidos: TCheckBox;
    tbshCCusto: TTabSheet;
    chklstCCusto: TCheckListBox;
    bbtnSelTodos: TBitBtn;
    bbtnInverteSel: TBitBtn;
    bbtnConfirmar: TBitBtn;
    ToolbarSep971: TToolbarSep97;
    tbshMotivo: TTabSheet;
    chklstMotivo: TCheckListBox;
    qryMotivo: TwwQuery;
    procedure FormCreate(Sender: TObject);
    procedure bbtnConfirmarClick(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure chklstFuncDrawItem(Control: TWinControl; Index: Integer; Rect: TRect;
      State: TOwnerDrawState);
    procedure dblkcbEstabChange(Sender: TObject);
    procedure gbxTipContraEnter(Sender: TObject);
    procedure gbxTipContraExit(Sender: TObject);
    procedure chklstFuncClickCheck(Sender: TObject);
    procedure bbtnSelTodosClick(Sender: TObject);
    procedure bbtnInverteSelClick(Sender: TObject);
    procedure dtedIniChange(Sender: TObject);
    procedure gbxSituacaoEnter(Sender: TObject);
    procedure gbxSituacaoExit(Sender: TObject);
    procedure pgctrlEmpregadosChange(Sender: TObject);
    procedure chklstCCustoClickCheck(Sender: TObject);
    procedure chklstFuncKeyDown(Sender: TObject; var Key: Word; Shift: TShiftState);
  private
    ListaIdFunc: TStringList;
    ListaIdTipoFolha: TStringList;
    ListaCodCCusto: TStringList;
    chkListAux: TCheckListBox;

    sAux, sListaIdFuncSel, sListaIdTipoFolhaSel, sListaCodCCustoSel: string;
    IdEstab: double;
    bSitAtivo, bSitAfast, bSitDemit, bTipContrEfet, bTipContrEspec, bTipContrTemp,
    bTipContrEst, bTipContrTerc, bTipContrProp, bTipContrAut: boolean;

    procedure HabilitaBtOk;
    procedure GravaDadosQuery;
    procedure MontaListaFuncionarios;
    function  SelecionaTipoContrato: string;
    function  SelecionaSitFunc: string;
  end;

var
  frmParamAlterFuncional: TfrmParamAlterFuncional;

implementation

uses uSistema, uMensErro, uDataBase, fAguarde, dBaseDados, uFuncoesUteisRH, UsoGeralRH,
  RAlterFuncional;

{$R *.DFM}

procedure TfrmParamAlterFuncional.FormCreate(Sender: TObject);
var
  iPos: integer;
begin
  inherited;
  ListaIdFunc := TStringList.Create;
  ListaIdTipoFolha := TStringList.Create;
  ListaCodCCusto := TStringList.Create;
  IdEstab := -1;

  cmbTipoPapel.Items.Assign(rptAlterFuncional.rpAlterFuncional.PrinterSetup.PaperNames);

  iPos := ProcuraStList(cmbTipoPapel.Items, 'A4');
  if (iPos = -1) then
    cmbTipoPapel. ItemIndex := 0
  else
    cmbTipoPapel. ItemIndex := iPos;

  //FazQuery(dtmBaseDados.qry,'SELECT NORMALINI, NORMALFIM FROM PARAMRH');
  //dtedIni.Text := dtmBaseDados.qry.FieldByName('NORMALINI').asString;
  //dtedFin.Text := dtmBaseDados.qry.FieldByName('NORMALFIM').asString;
  dtedIni.Date := Date - 365;
  dtedFin.Date := Date;

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

  dblkcbEstab.LookupValue := qryEstab.FieldByName('IDPESSOA').asString;
  dblkcbEstab.Update;

  // Monto a Lista de Motivos
  qryMotivo.Open;
  while not(qryMotivo.EOF) do
  begin
    ListaIdTipoFolha.Add(qryMotivo.FieldByName('IDMOTIVO').asString);
    chklstMotivo.Items.Add(qryMotivo.FieldByName('DESCRICAO').asString);
    qryMotivo.Next;
  end;
    
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

procedure TfrmParamAlterFuncional.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  dtmBaseDados.qry.Close;
  qryEstab.Close;
  inherited;
end;

procedure TfrmParamAlterFuncional.chklstFuncDrawItem(Control: TWinControl; Index: Integer;
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

procedure TfrmParamAlterFuncional.dblkcbEstabChange(Sender: TObject);
begin
  if (qryEstab.FieldByName('IDPESSOA').asInteger <> IdEstab) then
  begin
    MontaListaFuncionarios;
    IdEstab := qryEstab.FieldByName('IDPESSOA').asInteger;

    if (pgctrlEmpregados.ActivePageIndex = 0) then
      chklstFunc.Repaint;
  end;
end;

procedure TfrmParamAlterFuncional.pgctrlEmpregadosChange(Sender: TObject);
begin
  bbtnSelTodos.Visible := (pgctrlEmpregados.ActivePageIndex in [0,1,3]);
  bbtnInverteSel.Visible := bbtnSelTodos.Visible;
end;

procedure TfrmParamAlterFuncional.dtedIniChange(Sender: TObject);
begin
  try
    StrToDate(TEdit(Sender).Text);
    MontaListaFuncionarios;
  except
  end;
end;

procedure TfrmParamAlterFuncional.gbxTipContraEnter(Sender: TObject);
begin
  bTipContrEfet := cbxEfetivos.Checked;
  bTipContrEspec := cbxEspeciais.Checked;
  bTipContrTemp := cbxTemporarios.Checked;
  bTipContrEst := cbxEstagiarios.Checked;
  bTipContrTerc := cbxTerceiros.Checked;
  bTipContrProp := cbxPropDirSemVinc.Checked;
  bTipContrAut := cbxAutonomos.Checked;
end;

procedure TfrmParamAlterFuncional.gbxTipContraExit(Sender: TObject);
begin
  if not(cbxEfetivos.Checked) and not(cbxEspeciais.Checked) and
     not(cbxTemporarios.Checked) and not(cbxTerceiros.Checked) and
     not(cbxPropDirSemVinc.Checked) and not(cbxAutonomos.Checked) and
     not(cbxEstagiarios.Checked) then
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

procedure TfrmParamAlterFuncional.gbxSituacaoEnter(Sender: TObject);
begin
  bSitAtivo := (cbxAtivos.Checked);
  bSitAfast := (cbxAfastados.Checked);
  bSitDemit := (cbxDemitidos.Checked);
end;

procedure TfrmParamAlterFuncional.gbxSituacaoExit(Sender: TObject);
begin
  if not(cbxAtivos.Checked) and not(cbxAfastados.Checked) and not(cbxDemitidos.Checked) then
  begin
    MsgDlg ('Pelo menos um Tipo de Situação deve ser selecionado.', 'Aviso',
      mtInformation, [mbOk,mbHelp], 0);
    cbxAtivos.SetFocus;
  end
  else
  if (bSitAtivo <> cbxAtivos.Checked) or (bSitAfast <> cbxAfastados.Checked) or
     (bSitDemit <> cbxDemitidos.Checked) then
    MontaListaFuncionarios;
end;

procedure TfrmParamAlterFuncional.chklstFuncKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  if (Key = VK_TAB) then
    chklstFuncClickCheck(Sender);
end;

procedure TfrmParamAlterFuncional.chklstFuncClickCheck(Sender: TObject);
begin
  InvalidateItemListBox(TCustomListBox(Sender), TCustomListBox(Sender).ItemIndex);
  HabilitaBtOk;
end;

procedure TfrmParamAlterFuncional.chklstCCustoClickCheck(Sender: TObject);
begin
  InvalidateItemListBox(TCustomListBox(Sender), TCustomListBox(Sender).ItemIndex);
  MontaListaFuncionarios;
end;

procedure TfrmParamAlterFuncional.bbtnSelTodosClick(Sender: TObject);
var
  c: integer;
begin
  case (pgctrlEmpregados.ActivePageIndex) of
    0 : chkListAux := chklstMotivo;
    1 : chkListAux := chklstFunc;
    3 : chkListAux := chklstCCusto;
  end;

  for c:=0 to chkListAux.Items.Count-1 do
    chkListAux.Checked[c] := true;
  chkListAux.Repaint;

  if (pgctrlEmpregados.ActivePageIndex = 3) then
    MontaListaFuncionarios
  else
    HabilitaBtOk;
end;

procedure TfrmParamAlterFuncional.bbtnInverteSelClick(Sender: TObject);
var
  c: integer;
begin
  case (pgctrlEmpregados.ActivePageIndex) of
    0 : chkListAux := chklstMotivo;
    1 : chkListAux := chklstFunc;
    3 : chkListAux := chklstCCusto;
  end;

  for c:=0 to chkListAux.Items.Count-1 do
    chkListAux.Checked[c] := not(chkListAux.Checked[c]);
  chkListAux.Repaint;

  if (pgctrlEmpregados.ActivePageIndex = 3) then
    MontaListaFuncionarios
  else
    HabilitaBtOk;
end;

procedure TfrmParamAlterFuncional.bbtnConfirmarClick(Sender: TObject);
var
  wNum: word;
begin
  // Funcionários escolhidos
  wNum := CriaListaOpcoes (chklstFunc, ListaIdFunc, sListaIdFuncSel, ',', false);
  if (wNum = ListaIdFunc.Count) then
    sListaIdFuncSel := '';

  // Motivos escolhidos
  wNum := CriaListaOpcoes (chklstMotivo, ListaIdTipoFolha, sListaIdTipoFolhaSel, ',', false);
  if (wNum = ListaIdTipoFolha.Count) then
    sListaIdTipoFolhaSel := '';


  // Monta Query Auxiliar
  dtmBaseDados.qry.Close;
  with (dtmBaseDados.qry.SQL) do
  begin
    Clear;
    Add('SELECT DISTINCT');
    Add('  RTRIM(PJ.RAZAOSOCIAL) AS EMPRESA,');
    Add('  RTRIM(DECODE(RTRIM(ESTADUAL.NUMDOCUMENTO),NULL,');
    Add('    DECODE(RTRIM(MUNICIPAL.NUMDOCUMENTO),NULL,'''',');
    Add('    ''Inscrição Municipal: ''|| MUNICIPAL.NUMDOCUMENTO),');
    Add('    ''Inscrição Estadual: '' || ESTADUAL.NUMDOCUMENTO)) AS ESTADUALMUNICIPAL,');
    Add('  RTRIM(E.LOGRADOURO) ||'', ''|| E.NUMERO ||');
    Add('    DECODE(RTRIM(E.COMPLEMENTO),NULL,'''','' - '' || RTRIM(E.COMPLEMENTO)) ||');
    Add('    DECODE(RTRIM(E.BAIRRO),     NULL,'''','' - '' || RTRIM(E.BAIRRO)) ||');
    Add('    DECODE(RTRIM(CIDADES.NOME), NULL,'''','' - '' || RTRIM(CIDADES.NOME)) ||');
    Add('    '' - CEP:'' || RTRIM(SUBSTR(E.CEP,1,5)) ||''-''|| RTRIM(SUBSTR(E.CEP,6,3)) AS ENDERECO,');
    Add('  ES.CODESTADO AS UF,');
    Add('  ''CNPJ: '' || PJ.NUMDOCUMENTO AS CGC,');
    Add('  RTRIM(PF.NOME) AS EMPREGADO,');
    Add('  EF.DATAALTERFUNC, EF.SALARIO, EF.PERC_REAJ, EF.TIPOPAGAMENTO, ');
    Add('  M.DESCRICAO AS MOTIVO, C1.TITULO AS CARGO, ');
    Add('  DECODE(EF.IDFUNCAO,NULL,'''',C2.TITULO) AS FUNCAO, ');
    Add('  ('+QuotedStr(dtedIni.Text +' / '+ dtedFin.Text)+') AS REFERENCIA,');
    Add('  F.MATRICULA,EF.CODCENTROCUSTO,F.IDPESSOA,EF.IDCARGO, EF.IDFUNCAO ');
    Add('FROM');
    Add('  PESSOA PJ, PESSOA PF, FUNCIONARIO F, ENDPESS E, CIDADES, ESTADO ES,');
    Add('  SITFUNC ST, EVOLFUNC EF, MOTIVO M, CARGO C1, CARGO C2,');
    // -------------------------------------------------------------------------- //
    // Inscrição Estadual
    Add('  (SELECT D.IDPESSOA, TD.CODDOCUMENTO, D.NUMDOCUMENTO');
    Add('   FROM   DOCPESSOA D, TIPODOCOFICIAL TD');
    Add('   WHERE (TD.SIGLADOCUMENTO = ''ESTADUAL:'') AND');
    Add('         (TD.IDDOCUMENTO    = D.IDDOCUMENTO)) ESTADUAL,');
    // -------------------------------------------------------------------------- //
    // Inscrição Municipal
    Add('  (SELECT D.IDPESSOA, TD.CODDOCUMENTO, D.NUMDOCUMENTO');
    Add('   FROM   DOCPESSOA D, TIPODOCOFICIAL TD');
    Add('   WHERE (TD.SIGLADOCUMENTO = ''MUNICIPAL:'') AND');
    Add('         (TD.IDDOCUMENTO    = D.IDDOCUMENTO)) MUNICIPAL ');
    // -------------------------------------------------------------------------- //
    Add('WHERE');
    Add('  (PJ.IDPESSOA           = '+qryEstab.FieldByName('IDPESSOA').asString+') AND');
    Add('  (EF.DATAALTERFUNC BETWEEN TO_DATE('+QuotedStr(dtedIni.Text)+',''DD/MM/YYYY'') AND '+
      'TO_DATE('+QuotedStr(dtedFin.Text)+',''DD/MM/YYYY'')) AND');

    if (sListaIdTipoFolhaSel <> '') then
    begin
      if (Pos(',',sListaIdTipoFolhaSel) > 0) then
        Add('  (EF.IDMOTIVO IN (' +sListaIdTipoFolhaSel+ ')) AND')
      else
        Add('  (EF.IDMOTIVO  = ' +sListaIdTipoFolhaSel+ ') AND');
    end;


    // Funcionário(s) selecionado(s)
    if (sListaIdFuncSel <> '') then
    begin
      if (Pos(',',sListaIdFuncSel) > 0) then
        Add('  (EF.IDPESSOA IN (' +sListaIdFuncSel+ ')) AND')
      else
        Add('  (EF.IDPESSOA  = ' +sListaIdFuncSel+ ') AND');
    end
    else
    begin
      CriaListaOpcoes (chklstCCusto, ListaCodCCusto, sListaCodCCustoSel, ',', true);
      if (sListaCodCCustoSel <> '') then
      begin
        if (Pos(',',sListaCodCCustoSel) > 0) then
          Add('  (EF.CODCENTROCUSTO IN (' +sListaCodCCustoSel+ ')) AND')
        else
          Add('  (EF.CODCENTROCUSTO  = ' +sListaCodCCustoSel+ ') AND');
      end
      else
      begin
        // C. de Custo(s) habilitados para o usuário
        if (sUsuXccusto <> '') then
        begin
          if (Pos(',',sUsuXccusto) > 0) then
            Add('  (EF.CODCENTROCUSTO IN ' +sUsuXccusto+ ') AND')
          else
            Add('  (EF.CODCENTROCUSTO  = ' +sUsuXccusto+ ') AND');
        end;
      end;

      sAux := SelecionaSitFunc;
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
    Add('  (EF.IDPESSOA       = F.IDPESSOA) AND');
    Add('  (F.IDESTAB         = PJ.IDPESSOA) AND');
    Add('  (F.IDPESSOA        = PF.IDPESSOA) AND');
    Add('  (EF.IDMOTIVO       = M.IDMOTIVO) AND');
    Add('  (EF.IDCARGO        = C1.IDCARGO) AND');
    Add('  (EF.IDFUNCAO       = C2.IDCARGO(+)) AND');
    Add('  (PJ.IDPESSOA       = E.IDPESSOA) AND');
    Add('  (PJ.IDENDCOMERCIAL = E.IDENDERECO) AND');
    Add('  (E.IDCIDADES       = CIDADES.IDCIDADES) AND');
    Add('  (CIDADES.IDESTADO  = ES.IDESTADO) AND');
    Add('  (PJ.IDPESSOA       = ESTADUAL.IDPESSOA(+)) AND');
    Add('  (PJ.IDPESSOA       = MUNICIPAL.IDPESSOA(+))');
    Add('ORDER BY');
    case (cmbOrderBy.ItemIndex) of
      0 : Add('  EMPREGADO, DATAALTERFUNC, MOTIVO');
      1 : Add('  EMPREGADO, MOTIVO, DATAALTERFUNC');
      2 : Add('  CODCENTROCUSTO, EMPREGADO, DATAALTERFUNC');
      3 : Add('  CODCENTROCUSTO, MOTIVO, DATAALTERFUNC');
      4 : Add('  CODCENTROCUSTO, DATAALTERFUNC, EMPREGADO');
      5 : Add('  CODCENTROCUSTO, DATAALTERFUNC, MOTIVO');
      6 : Add('  DATAALTERFUNC, EMPREGADO, MOTIVO');
      7 : Add('  DATAALTERFUNC, MOTIVO, EMPREGADO');
      8 : Add('  DATAALTERFUNC, CODCENTROCUSTO, EMPREGADO, MOTIVO');
      9 : Add('  DATAALTERFUNC, CODCENTROCUSTO, MOTIVO, EMPREGADO');
     10 : Add('  MOTIVO, DATAALTERFUNC, EMPREGADO');
     11 : Add('  MOTIVO, EMPREGADO, DATAALTERFUNC');
     12 : Add('  MOTIVO, DATAALTERFUNC, CODCENTROCUSTO, EMPREGADO');
     13 : Add('  MOTIVO, CODCENTROCUSTO, DATAALTERFUNC, EMPREGADO');
    end;
    SaveToFile('c:\qry.txt');
  end;

  // Monta Query Principal
  with (rptAlterFuncional) do
  begin
    AlterFuncionalppFooterBand.Visible := True;
    if  (cmbOrderBy.ItemIndex >= 2) and (cmbOrderBy.ItemIndex <= 5) then
        ppAlterFuncionalGroup.BreakName    := 'CODCENTROCUSTO'
    else  if  (cmbOrderBy.ItemIndex >= 10) then
        ppAlterFuncionalGroup.BreakName    := 'MOTIVO'
    else
    begin
        ppAlterFuncionalGroup.BreakName    := '';
        AlterFuncionalppFooterBand.Visible := False;
    end;



    frmAguarde.Mostra('Alterações Funcionais');
    frmAguarde.Pos := 0;

    // Aponto o UpdateSQL para a query Principal
    qryAlterFuncional.UpdateObject := updSQL;

    if not(qryAlterFuncional.IsEmpty) then
      qryAlterFuncional.CancelUpdates;
    qryAlterFuncional.Close;
    qryAlterFuncional.Open;

    // Processa dados para a geração da query
    dtmBaseDados.qry.Open;
    GravaDadosQuery;
    qryAlterFuncional.First;

    // Especifico Configurações do Relatório
    rpAlterFuncional.PrinterSetup.PaperName := cmbTipoPapel.Items[cmbTipoPapel.ItemIndex];
  end;
end;

// -------------------------------------------------------------------------------------
// Funções do Form
// -------------------------------------------------------------------------------------
procedure TfrmParamAlterFuncional.GravaDadosQuery;
var
  dtPerAquiFinal: TDateTime;
begin
  with (rptAlterFuncional.qryAlterFuncional) do
  begin
    if not(dtmBaseDados.qry.IsEmpty) then
    begin
      frmAguarde.Min := 0;
      frmAguarde.Max := dtmBaseDados.qry.RecordCount;
// PAREI AQUI !!!
      repeat
        Insert;
        FieldByName('IDPESSOA').asString   := dtmBaseDados.qry.FieldByName('IDPESSOA').asString;
        FieldByName('IDCARGO').asString    := dtmBaseDados.qry.FieldByName('IDCARGO').asString;
        FieldByName('IDFUNCAO').asString   := dtmBaseDados.qry.FieldByName('IDFUNCAO').asString;
        FieldByName('EMPREGADO').asString  := dtmBaseDados.qry.FieldByName('EMPREGADO').asString;
        FieldByName('MATRICULA').asString  := dtmBaseDados.qry.FieldByName('MATRICULA').asString;
        FieldByName('REFERENCIA').asString := dtmBaseDados.qry.FieldByName('REFERENCIA').asString;
        FieldByName('MOTIVO').asString     := dtmBaseDados.qry.FieldByName('MOTIVO').asString;
        FieldByName('EMPRESA').asString    := dtmBaseDados.qry.FieldByName('EMPRESA').asString;
        FieldByName('CGC').asString        := dtmBaseDados.qry.FieldByName('CGC').asString;
        FieldByName('CODCENTROCUSTO').asString:= dtmBaseDados.qry.FieldByName('CODCENTROCUSTO').asString;
        FieldByName('INSCRICAO').asString  := dtmBaseDados.qry.FieldByName('ESTADUALMUNICIPAL').asString;
        FieldByName('ENDERECO').asString   := dtmBaseDados.qry.FieldByName('ENDERECO').asString;
        FieldByName('UF').asString         := dtmBaseDados.qry.FieldByName('UF').asString;
        FieldByName('DATAALTERFUNC').asString := dtmBaseDados.qry.FieldByName('DATAALTERFUNC').asString;
        FieldByName('CARGO').asString      := dtmBaseDados.qry.FieldByName('CARGO').asString;
        FieldByName('FUNCAO').asString     := dtmBaseDados.qry.FieldByName('FUNCAO').asString;
        FieldByName('TIPOPAGAMENTO').asString := dtmBaseDados.qry.FieldByName('TIPOPAGAMENTO').asString;
        FieldByName('SALARIO').asFloat     := dtmBaseDados.qry.FieldByName('SALARIO').asFloat;
        FieldByName('PERC_REAJ').asFloat   := dtmBaseDados.qry.FieldByName('PERC_REAJ').asFloat;

        Post;

        frmAguarde.Pos := frmAguarde.Pos+1;
        dtmBaseDados.qry.Next;
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

procedure TfrmParamAlterFuncional.HabilitaBtOk;
begin
  bbtnConfirmar.Enabled := (Trim(dtedIni.Text) <> '') and (Trim(dtedFin.Text) <> '') and
    (Trim(dblkcbEstab.Text) <> '') and (SelecionaSitFunc <> '');
end;

procedure TfrmParamAlterFuncional.MontaListaFuncionarios;
begin
  if (dblkcbEstab.Text <> '') then
  begin
    dtmBaseDados.qry.Close;
    ListaIdFunc.Clear;
    chklstFunc.Items.Clear;

    with (dtmBaseDados.qry.SQL) do
    begin
      Clear;
      Add('SELECT DISTINCT');
      Add('  PF.IDPESSOA, PF.NOME');
      Add('FROM');
      Add('  PESSOA PF, FUNCIONARIO F, EVOLFUNC EF, SITFUNC ST');
      Add('WHERE');
      Add('  (EF.IDESTAB         = ' +qryEstab.FieldByName('IDPESSOA').asString+ ') AND');

      sAux := SelecionaSitFunc;
      if (Pos(',',sAux) > 0) then
        Add('  (ST.TIPOSIT        IN (' +sAux+ ')) AND')
      else
        Add('  (ST.TIPOSIT         = ' +sAux+ ') AND');

      CriaListaOpcoes(chklstMotivo, ListaIdTipoFolha, sListaIdTipoFolhaSel, ',', true);
      if (sListaIdTipoFolhaSel <> '') then
      begin
        if (Pos(',',sListaIdTipoFolhaSel) > 0) then
          Add('  (EF.IDMOTIVO IN (' +sListaIdTipoFolhaSel+ ')) AND')
        else
          Add('  (EF.IDMOTIVO  = ' +sListaIdTipoFolhaSel+ ') AND');
      end;

      CriaListaOpcoes(chklstCCusto, ListaCodCCusto, sListaCodCCustoSel, ',', true);
      if (sListaCodCCustoSel <> '') then
      begin
        if (Pos(',',sListaCodCCustoSel) > 0) then
          Add('  (EF.CODCENTROCUSTO IN (' +sListaCodCCustoSel+ ')) AND')
        else
          Add('  (EF.CODCENTROCUSTO  = ' +sListaCodCCustoSel+ ') AND');
      end
      else
      begin
        // C. de Custo(s) habilitados para o usuário
        if (sUsuXccusto <> '') then
        begin
          if (Pos(',',sUsuXccusto) > 0) then
            Add('  (EF.CODCENTROCUSTO IN ' +sUsuXccusto+ ') AND')
          else
            Add('  (EF.CODCENTROCUSTO  = ' +sUsuXccusto+ ') AND');
        end;
      end;

      sAux := SelecionaTipoContrato;
      if (Pos(',',sAux) > 0) then
        Add('  (F.TIPOCONTRATO    IN (' +sAux+ ')) AND')
      else
        Add('  (F.TIPOCONTRATO     = ' +sAux+ ') AND');

      Add('  (EF.DATAALTERFUNC BETWEEN TO_DATE(' + QuotedStr(dtedIni.Text) +
          ',''DD/MM/YYYY'') AND ' +
          'TO_DATE('+QuotedStr(dtedFin.Text)+',''DD/MM/YYYY'')) AND');
      Add('  (ST.IDSITFUNC   = F.IDSITFUNC) AND');
      Add('  (EF.IDPESSOA    = F.IDPESSOA)  AND');
      Add('  (F.IDPESSOA     = PF.IDPESSOA)');
      Add('ORDER BY');
      Add('  UPPER(NOME)');
    end;
    dtmBaseDados.qry.Open;

    while not(dtmBaseDados.qry.EOF) do
    begin
      ListaIdFunc.Add(dtmBaseDados.qry.FieldByName('IDPESSOA').asString);
      chklstFunc.Items.Add(dtmBaseDados.qry.FieldByName('NOME').asString);
      dtmBaseDados.qry.Next;
    end;
  end;
  HabilitaBtOk;
end;

function TfrmParamAlterFuncional.SelecionaTipoContrato: string;
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

function TfrmParamAlterFuncional.SelecionaSitFunc: string;
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
