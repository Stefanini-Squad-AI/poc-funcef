// *****************************************************************************
// ***************************** REGISTRO DE ALTERAÇÕES ************************
// *****************************************************************************
// Autor(a)    :  Ádler Teodoro de Souza
// Data        :  19/02/2009
// Pendência   : SOL 109421 KINTANA 496332
// Descricao   :  Alteração de gravação de arquivos de log na raiz do disco C: .
//------------------------------------------------------------------------------
unit fParamFeriasProgram;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs, MAHlpBtn, TB97,
  TB97Tlbr, StdCtrls, Buttons, ExtCtrls, Db, DBTables, Wwquery, wwdblook, Spin, checklst,
  IvDictio, IvMulti, IvEMulti, ComCtrls, wwdbdatetimepicker, fSairAjuda, CMDateTimePicker;

type
  TfrmParamFeriasProgram = class(TfrmSairAjuda)
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
    procedure HabilitaBtOk;
    procedure GravaDadosQuery;
    procedure MontaListaFuncionarios;
    function  SelecionaTipoContrato: string;
    function  SelecionaSitFunc: string;
  end;

var
  frmParamFeriasProgram: TfrmParamFeriasProgram;

implementation

uses uSistema, uMensErro, uDataBase, fAguarde, dBaseDados, uFuncoesUteis, UsoGeralRH,
  uComumRelats, dRelatorios;

{$R *.DFM}

procedure TfrmParamFeriasProgram.FormCreate(Sender: TObject);
var
  iPos: integer;
begin
  inherited;
  if not(Assigned(ListaCodFunc)) then
    ListaCodFunc := TStringList.Create;
  if not(Assigned(ListaCodCCusto)) then
    ListaCodCCusto := TStringList.Create;
  IdEstab := -1;

  cmbTipoPapel.Items.Assign(dtmRelatorios.rpFeriasProgram.PrinterSetup.PaperNames);

  iPos := ProcuraStList(cmbTipoPapel.Items, 'A4');
  if (iPos = -1) then
    cmbTipoPapel. ItemIndex := 0
  else
    cmbTipoPapel. ItemIndex := iPos;

  FazQuery(dtmBaseDados.qry,'SELECT NORMALINI, NORMALFIM FROM PARAMRH');
  dtedIni.Text := dtmBaseDados.qry.FieldByName('NORMALINI').asString;
  dtedFin.Text := dtmBaseDados.qry.FieldByName('NORMALFIM').asString;

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

procedure TfrmParamFeriasProgram.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  dtmBaseDados.qry.Close;
  qryEstab.Close;
  inherited;
end;

procedure TfrmParamFeriasProgram.chklstFuncDrawItem(Control: TWinControl; Index: Integer;
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

procedure TfrmParamFeriasProgram.dblkcbEstabChange(Sender: TObject);
begin
  if (qryEstab.FieldByName('IDPESSOA').asInteger <> IdEstab) then
  begin
    MontaListaFuncionarios;
    IdEstab := qryEstab.FieldByName('IDPESSOA').asInteger;

    if (pgctrlEmpregados.ActivePageIndex = 0) then
      chklstFunc.Repaint;
  end;
end;

procedure TfrmParamFeriasProgram.pgctrlEmpregadosChange(Sender: TObject);
begin
  bbtnSelTodos.Visible := (pgctrlEmpregados.ActivePageIndex in [0,2]);
  bbtnInverteSel.Visible := bbtnSelTodos.Visible;
end;

procedure TfrmParamFeriasProgram.dtedIniChange(Sender: TObject);
begin
  try
    StrToDate(TEdit(Sender).Text);
    MontaListaFuncionarios;
  except
  end;
end;

procedure TfrmParamFeriasProgram.gbxTipContraEnter(Sender: TObject);
begin
  bTipContrEfet := cbxEfetivos.Checked;
  bTipContrEspec := cbxEspeciais.Checked;
  bTipContrTemp := cbxTemporarios.Checked;
  bTipContrEst := cbxEstagiarios.Checked;
  bTipContrTerc := cbxTerceiros.Checked;
  bTipContrProp := cbxPropDirSemVinc.Checked;
  bTipContrAut := cbxAutonomos.Checked;
end;

procedure TfrmParamFeriasProgram.gbxTipContraExit(Sender: TObject);
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

procedure TfrmParamFeriasProgram.gbxSituacaoEnter(Sender: TObject);
begin
  bSitAtivo := (cbxAtivos.Checked);
  bSitAfast := (cbxAfastados.Checked);
  bSitDemit := (cbxDemitidos.Checked);
end;

procedure TfrmParamFeriasProgram.gbxSituacaoExit(Sender: TObject);
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

procedure TfrmParamFeriasProgram.chklstFuncKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  if (Key = VK_TAB) then
    chklstFuncClickCheck(Sender);
end;

procedure TfrmParamFeriasProgram.chklstFuncClickCheck(Sender: TObject);
begin
  InvalidateItemListBox(TCustomListBox(Sender), TCustomListBox(Sender).ItemIndex);
  HabilitaBtOk;
end;

procedure TfrmParamFeriasProgram.chklstCCustoClickCheck(Sender: TObject);
begin
  InvalidateItemListBox(TCustomListBox(Sender), TCustomListBox(Sender).ItemIndex);
  MontaListaFuncionarios;
end;

procedure TfrmParamFeriasProgram.bbtnSelTodosClick(Sender: TObject);
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

procedure TfrmParamFeriasProgram.bbtnInverteSelClick(Sender: TObject);
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

procedure TfrmParamFeriasProgram.bbtnConfirmarClick(Sender: TObject);
var
  wNum: word;
begin
  // Funcionários escolhidos
  wNum := CriaListaOpcoes (chklstFunc, ListaCodFunc, sCodFuncSel, ',', false);
  if (wNum = ListaCodFunc.Count) then
    sCodFuncSel := '';

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
    Add('  ('+QuotedStr(dtedIni.Text +' / '+ dtedFin.Text)+') AS REFERENCIA,');
    Add('  F.MATRICULA,F.CODCENTROCUSTO,');
    Add('  DECODE(FERIAS.FLGABONO,0,''NÃO'', 1,''SIM'') AS ABONO_PEC,');
    Add('  FERIAS.QTDPARCDEVOL,');
    Add('  FERIAS.INIPERIODOFERIAS, FERIAS.INIGOZOFERIAS, FERIAS.FIMGOZOFERIAS,');
    Add('  DECODE(FERIAS.FLGOCORRIDA,0,''NÃO'', 1,''SIM'') AS FERIAS_PROP');
    Add('FROM');
    Add('  PESSOA PJ, PESSOA PF, FUNCIONARIO F, ENDPESS E, CIDADES, ESTADO ES, FERIAS,');
    Add('  SITFUNC ST,');
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
    Add('         (TD.IDDOCUMENTO    = D.IDDOCUMENTO)) MUNICIPAL');
    // -------------------------------------------------------------------------- //
    Add('WHERE');
    Add('  (PJ.IDPESSOA           = '+qryEstab.FieldByName('IDPESSOA').asString+') AND');
    Add('  (FERIAS.INIGOZOFERIAS BETWEEN TO_DATE('+QuotedStr(dtedIni.Text)+',''DD/MM/YYYY'') AND '+
      'TO_DATE('+QuotedStr(dtedFin.Text)+',''DD/MM/YYYY'')) AND');

    // Funcionário(s) selecionado(s)
    if (sCodFuncSel <> '') then
    begin
      if (Pos(',',sCodFuncSel) > 0) then
        Add('  (F.IDPESSOA IN (' +sCodFuncSel+ ')) AND')
      else
        Add('  (F.IDPESSOA  = ' +sCodFuncSel+ ') AND');
    end
    else
    begin
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
    Add('  (FERIAS.IDPESSOA   = F.IDPESSOA) AND');
    Add('  (F.IDESTAB         = PJ.IDPESSOA) AND');
    Add('  (F.IDPESSOA        = PF.IDPESSOA) AND');
    Add('  (PJ.IDPESSOA       = E.IDPESSOA) AND');
    Add('  (PJ.IDENDCOMERCIAL = E.IDENDERECO) AND');
    Add('  (E.IDCIDADES       = CIDADES.IDCIDADES) AND');
    Add('  (CIDADES.IDESTADO  = ES.IDESTADO) AND');
    Add('  (PJ.IDPESSOA       = ESTADUAL.IDPESSOA(+)) AND');
    Add('  (PJ.IDPESSOA       = MUNICIPAL.IDPESSOA(+))');
    Add('ORDER BY');
    case (cmbOrderBy.ItemIndex) of
      0 : Add('  EMPRESA, EMPREGADO, MATRICULA');
      1 : Add('  EMPRESA, MATRICULA, EMPREGADO');
      2 : Add('  EMPRESA, CODCENTROCUSTO, EMPREGADO');
      3 : Add('  EMPRESA, CODCENTROCUSTO, MATRICULA');
      4 : Add('  EMPRESA, CODCENTROCUSTO, INIGOZOFERIAS, EMPREGADO');
      5 : Add('  EMPRESA, CODCENTROCUSTO, INIGOZOFERIAS, MATRICULA');
      6 : Add('  INIGOZOFERIAS, EMPRESA, EMPREGADO');
      7 : Add('  INIGOZOFERIAS, EMPRESA, MATRICULA');
      8 : Add('  INIGOZOFERIAS, EMPRESA, CODCENTROCUSTO, EMPREGADO');
      9 : Add('  INIGOZOFERIAS, EMPRESA, CODCENTROCUSTO, MATRICULA');
    end;
    //SaveToFile('c:\qry.txt');
    SaveToFile(Sistema.RetornaCaminhoArquivos(Sistema.IdEmpresa)+'\qry.txt');//Ádler Teodoro de Souza SOL 109421 KINTANA 496332
  end;

  // Monta Query Principal
  with (dtmRelatorios) do
  begin
    frmAguarde.Mostra('Férias Programadas');
    frmAguarde.Pos := 0;

    // Aponto o UpdateSQL para a query Principal
    qryFeriasProgram.UpdateObject := updSQL;

    if not(qryFeriasProgram.IsEmpty) then
      qryFeriasProgram.CancelUpdates;
    qryFeriasProgram.Close;
    qryFeriasProgram.Open;

    // Processa dados para a geração da query
    dtmBaseDados.qry.Open;
    GravaDadosQuery;
    qryFeriasProgram.First;

    // Especifico Configurações do Relatório
    rpFeriasProgram.PrinterSetup.PaperName := cmbTipoPapel.Items[cmbTipoPapel.ItemIndex];
  end;
end;

// -------------------------------------------------------------------------------------
// Funções do Form
// -------------------------------------------------------------------------------------
procedure TfrmParamFeriasProgram.GravaDadosQuery;
var
  dtPerAquiFinal: TDateTime;
begin
  with (dtmRelatorios.qryFeriasProgram) do
  begin
    if not(dtmBaseDados.qry.IsEmpty) then
    begin
      frmAguarde.Min := 0;
      frmAguarde.Max := dtmBaseDados.qry.RecordCount;

      repeat
        Insert;
        FieldByName('EMPREGADO').asString := dtmBaseDados.qry.FieldByName('EMPREGADO').asString;
        FieldByName('MATRICULA').asString := dtmBaseDados.qry.FieldByName('MATRICULA').asString;
        FieldByName('REFERENCIA').asString := dtmBaseDados.qry.FieldByName('REFERENCIA').asString;
        FieldByName('ABONO_PEC').asString := dtmBaseDados.qry.FieldByName('ABONO_PEC').asString;
        FieldByName('EMPRESA').asString := dtmBaseDados.qry.FieldByName('EMPRESA').asString;
        FieldByName('CGC').asString := dtmBaseDados.qry.FieldByName('CGC').asString;
        FieldByName('INSCRICAO').asString := dtmBaseDados.qry.FieldByName('ESTADUALMUNICIPAL').asString;
        FieldByName('ENDERECO').asString := dtmBaseDados.qry.FieldByName('ENDERECO').asString;
        FieldByName('UF').asString := dtmBaseDados.qry.FieldByName('UF').asString;
        FieldByName('QTDPARCDEVOL').asInteger := dtmBaseDados.qry.FieldByName('QTDPARCDEVOL').asInteger;
        FieldByName('FERIAS_PROP').asString := dtmBaseDados.qry.FieldByName('FERIAS_PROP').asString;
        FieldByName('INIGOZOFERIAS').asString := dtmBaseDados.qry.FieldByName('INIGOZOFERIAS').asString;
        FieldByName('FIMGOZOFERIAS').asString := dtmBaseDados.qry.FieldByName('FIMGOZOFERIAS').asString;
        FieldByName('DATA_LIMITE').asString :=
          IncData(dtmBaseDados.qry.FieldByName('INIPERIODOFERIAS').asString,0,23,0);
        FieldByName('INIPERIODOFERIAS').asString := dtmBaseDados.qry.FieldByName('INIPERIODOFERIAS').asString;

        dtPerAquiFinal := StrToDate(IncData(dtmBaseDados.qry.FieldByName('INIPERIODOFERIAS').asString,0,0,1))-1;
        if (dtPerAquiFinal >= dtmBaseDados.qry.FieldByName('INIGOZOFERIAS').asDateTime) then
          FieldByName('FIMPERIODOFERIAS').asString :=
            DateToStr(dtmBaseDados.qry.FieldByName('INIGOZOFERIAS').asDateTime-1)
        else
          FieldByName('FIMPERIODOFERIAS').asString := DateToStr(dtPerAquiFinal);

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

procedure TfrmParamFeriasProgram.HabilitaBtOk;
begin
  bbtnConfirmar.Enabled := (Trim(dtedIni.Text) <> '') and (Trim(dtedFin.Text) <> '') and
    (Trim(dblkcbEstab.Text) <> '') and (SelecionaSitFunc <> '');
end;

procedure TfrmParamFeriasProgram.MontaListaFuncionarios;
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
      Add('  PESSOA PF, FUNCIONARIO F, FERIAS FE, SITFUNC ST');
      Add('WHERE');
      Add('  (F.IDESTAB         = ' +qryEstab.FieldByName('IDPESSOA').asString+ ') AND');

      sAux := SelecionaSitFunc;
      if (Pos(',',sAux) > 0) then
        Add('  (ST.TIPOSIT        IN (' +sAux+ ')) AND')
      else
        Add('  (ST.TIPOSIT         = ' +sAux+ ') AND');
      
      CriaListaOpcoes(chklstCCusto, ListaCodCCusto, sCodCCustoSel, ',', true);
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

      Add('  (FE.INIGOZOFERIAS BETWEEN TO_DATE(' + QuotedStr(dtedIni.Text) +
          ',''DD/MM/YYYY'') AND ' +
          'TO_DATE('+QuotedStr(dtedFin.Text)+',''DD/MM/YYYY'')) AND');
      Add('  (ST.IDSITFUNC   = F.IDSITFUNC) AND');
      Add('  (FE.IDPESSOA    = F.IDPESSOA)  AND');
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

function TfrmParamFeriasProgram.SelecionaTipoContrato: string;
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

function TfrmParamFeriasProgram.SelecionaSitFunc: string;
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
