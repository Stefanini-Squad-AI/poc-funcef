// *****************************************************************************
// ***************************** REGISTRO DE ALTERAÇÕES ************************
// *****************************************************************************
// Autor(a)    :  Ádler Teodoro de Souza
// Data        :  19/02/2009
// Pendência   : SOL 109421 KINTANA 496332
// Descricao   :  Alteração de gravação de arquivos de log na raiz do disco C: .
//------------------------------------------------------------------------------
unit fParamAcompEscalaFerias;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  FOkCancelar, MAHlpBtn, StdCtrls, Buttons, TB97Tlbr, TB97, ExtCtrls, Db,
  DBTables, Wwquery, Wwdatsrc, Mask, wwdbedit, Wwdotdot, Wwdbcomb, Machklb,
  wwdblook, checklst, Spin, IvDictio, IvMulti, IvEMulti, Grids,
  Wwdbigrd, Wwdbgrid, DBGrids, fcCombo, fcColorCombo, IniFiles, ComCtrls,
  FSairAjuda, USistema;

type
  TfrmParamAcompEscalaFerias = class(TfrmSairAjuda)
    gbxEstab: TGroupBox;
    dblkcbEstab: TwwDBLookupCombo;
    qryEstab: TwwQuery;
    gbxOrdem: TGroupBox;
    cmbOrderBy: TComboBox;
    gbxTipoPapel: TGroupBox;
    cmbTipoPapel: TComboBox;
    gbxFiltroCCusto: TGroupBox;
    chklstCCusto: TCheckListBox;
    gbxIntervRef: TGroupBox;
    Label2: TLabel;
    gbxCorBar: TGroupBox;
    fcJaProcess: TfcColorCombo;
    fcNaoProcess: TfcColorCombo;
    Label3: TLabel;
    Label4: TLabel;
    cmbMes: TComboBox;
    speAno: TSpinEdit;
    bbtnSelTodosCCusto: TBitBtn;
    bbtnInverteSelCCusto: TBitBtn;
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
    bbtnConfirmar: TBitBtn;
    ToolbarSep971: TToolbarSep97;
    procedure FormCreate(Sender: TObject);
    procedure bbtnConfirmarClick(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure dblkcbEstabChange(Sender: TObject);
    procedure bbtnSelTodosCCustoClick(Sender: TObject);
    procedure bbtnInverteSelCCustoClick(Sender: TObject);
    procedure bbtnSelTodosFuncClick(Sender: TObject);
    procedure bbtnInverteSelFuncClick(Sender: TObject);
    procedure gbxTipContraExit(Sender: TObject);
    procedure chklstFuncDrawItem(Control: TWinControl; Index: Integer;
      Rect: TRect; State: TOwnerDrawState);
    procedure gbxSituacaoEnter(Sender: TObject);
    procedure gbxSituacaoExit(Sender: TObject);
    procedure gbxTipContraEnter(Sender: TObject);
    procedure chklstCCustoClickCheck(Sender: TObject);
    procedure speAnoChange(Sender: TObject);
    procedure chklstCCustoKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure chklstFuncKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure chklstFuncClickCheck(Sender: TObject);
  private
    sDataInicial, sDataFinal: string;

    procedure LeAlteracoes;
    procedure GravaAlteracoes;
    procedure HabilitaBtOk;
    procedure GravaDadosQuery;
    procedure MontaListaFuncionarios;
    function  SelecionaTipoContrato: string;
    function  SelecionaSitFunc: string;
  end;

var
  frmParamAcompEscalaFerias: TfrmParamAcompEscalaFerias;

implementation

uses uSistema, uMensErro, uDataBase, uDiasUteis, fAguarde, dBaseDados,
  uFuncoesUteis, UsoGeralRH, uComumRelats, dRelatorios1;

{$R *.DFM}

procedure TfrmParamAcompEscalaFerias.FormCreate(Sender: TObject);
var
  iPos: integer;
begin
  inherited;
  if not(Assigned(ListaCodCCusto)) then
    ListaCodCCusto := TStringList.Create;
  if not(Assigned(ListaCodFunc)) then
    ListaCodFunc := TStringList.Create;
  IDEstab := -1;

  cmbTipoPapel.Items.Assign (dtmRelatorios1.rpAcompEscalaFerias.PrinterSetup.PaperNames);

  iPos := ProcuraStList (cmbTipoPapel.Items,'A4');
  if (iPos = -1) then
    cmbTipoPapel. ItemIndex := 0
  else
    cmbTipoPapel. ItemIndex := iPos;
                        
  FazQuery(dtmBaseDados.qry,'SELECT NORMALINI FROM PARAMRH');
  speAno.Text := Copy(dtmBaseDados.qry.FieldByName('NORMALINI').asString,7,4);

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

  cmbMes.ItemIndex := 0;
  cmbOrderBy.ItemIndex := 0;
  pgctrlEmpregados.ActivePageIndex := 0;

  // Carrega alterações nas opções feitas anteriormente
  LeAlteracoes;

  HabilitaBtOk;
end;

procedure TfrmParamAcompEscalaFerias.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  GravaAlteracoes;

  dtmBaseDados.qry.Close;
  qryEstab.Close;
  inherited;
end;

procedure TfrmParamAcompEscalaFerias.chklstFuncDrawItem(Control: TWinControl; Index: Integer;
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

    FillRect (Rect);
    TextOut(Rect.Left, Rect.Top, TCheckListBox(Control).Items[Index]);
  end;
end;

procedure TfrmParamAcompEscalaFerias.dblkcbEstabChange(Sender: TObject);
begin
  if (qryEstab.FieldByName('IDPESSOA').asInteger <> IDEstab) then
  begin
    MontaListaFuncionarios;
    IDEstab := qryEstab.FieldByName('IDPESSOA').asInteger;

    if (pgctrlEmpregados.ActivePageIndex = 0) then
      chklstFunc.Repaint;
  end;
end;

procedure TfrmParamAcompEscalaFerias.speAnoChange(Sender: TObject);
begin
  HabilitaBtOk;
end;

procedure TfrmParamAcompEscalaFerias.gbxTipContraEnter(Sender: TObject);
begin
  bTipContrEfet  := cbxEfetivos.Checked;
  bTipContrEspec := cbxEspeciais.Checked;
  bTipContrTemp  := cbxTemporarios.Checked;
  bTipContrEst   := cbxEstagiarios.Checked;
  bTipContrTerc  := cbxTerceiros.Checked;
  bTipContrProp  := cbxPropDirSemVinc.Checked;
  bTipContrAut   := cbxAutonomos.Checked;
end;

procedure TfrmParamAcompEscalaFerias.gbxTipContraExit(Sender: TObject);
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

procedure TfrmParamAcompEscalaFerias.gbxSituacaoEnter(Sender: TObject);
begin
  bSitAtivo := (cbxAtivos.Checked);
  bSitAfast := (cbxAfastados.Checked);
end;

procedure TfrmParamAcompEscalaFerias.gbxSituacaoExit(Sender: TObject);
begin
  if not(cbxAtivos.Checked) and not(cbxAfastados.Checked) then
  begin
    MsgDlg ('Pelo menos um Tipo de Situação deve ser selecionado !', 'Aviso',
      mtInformation, [mbOk,mbHelp], 0);
    cbxAtivos.SetFocus;
  end
  else
  if (bSitAtivo <> cbxAtivos.Checked) or (bSitAfast <> cbxAfastados.Checked) then
    MontaListaFuncionarios;
end;

procedure TfrmParamAcompEscalaFerias.chklstCCustoKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  if (Key = VK_TAB) then
    chklstCCustoClickCheck(Sender);
end;

procedure TfrmParamAcompEscalaFerias.chklstFuncKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  if (Key = VK_TAB) then
    InvalidateItemListBox(TCustomListBox(Sender),TCustomListBox(Sender).ItemIndex);
end;

procedure TfrmParamAcompEscalaFerias.chklstCCustoClickCheck(Sender: TObject);
begin
  InvalidateItemListBox(TCustomListBox(Sender),TCustomListBox(Sender).ItemIndex);
  MontaListaFuncionarios;
end;

procedure TfrmParamAcompEscalaFerias.chklstFuncClickCheck(Sender: TObject);
begin
  InvalidateItemListBox(TCustomListBox(Sender),TCustomListBox(Sender).ItemIndex);
end;

procedure TfrmParamAcompEscalaFerias.bbtnSelTodosCCustoClick(Sender: TObject);
var
  c: integer;
begin
  for c:=0 to chklstCCusto.Items.Count-1 do
    chklstCCusto.Checked[c] := true;

  chklstCCusto.Repaint;
  MontaListaFuncionarios;
end;

procedure TfrmParamAcompEscalaFerias.bbtnInverteSelCCustoClick(Sender: TObject);
var
  c: integer;
begin
  for c:=0 to chklstCCusto.Items.Count-1 do
    chklstCCusto.Checked[c] := not(chklstCCusto.Checked[c]);

  chklstCCusto.Repaint;
  MontaListaFuncionarios;
end;

procedure TfrmParamAcompEscalaFerias.bbtnSelTodosFuncClick(Sender: TObject);
var
  c: integer;
begin
  for c:=0 to chklstFunc.Items.Count-1 do
    chklstFunc.Checked[c] := true;

  chklstFunc.Repaint;
  HabilitaBtOk;  
end;

procedure TfrmParamAcompEscalaFerias.bbtnInverteSelFuncClick(Sender: TObject);
var
  c: integer;
begin
  for c:=0 to chklstFunc.Items.Count-1 do
    chklstFunc.Checked[c] := not(chklstFunc.Checked[c]);

  chklstFunc.Repaint;
  HabilitaBtOk;  
end;

procedure TfrmParamAcompEscalaFerias.bbtnConfirmarClick(Sender: TObject);
var
  wNum: word;
begin
  // C. de Custo selecionados
  CriaListaOpcoes (chklstCCusto, ListaCodCCusto, sCodCCustoSel, ',', true);

  // Funcionários escolhidos
  wNum := CriaListaOpcoes (chklstFunc, ListaCodFunc, sCodFuncSel, ',', false);
  if (wNum = ListaCodFunc.Count) then
    sCodFuncSel := '';

  sDataInicial := '01/'+PoeZero(cmbMes.ItemIndex+1) +'/'+ speAno.Text;
  sDataFinal   := DateToStr(StrToDate(IncData(sDataInicial,0,0,1))-1);

  // Monta Query
  dtmBaseDados.qry.Close;
  with (dtmBaseDados.qry.SQL) do
  begin
    Clear;
    Add('SELECT DISTINCT');
    // Dados do Estabelecimento
    Add('  RTRIM(PJ.RAZAOSOCIAL) AS EMPRESA,');
    Add('  DECODE(PJ.NUMDOCUMENTO,NULL,NULL,''CNPJ: '' || PJ.NUMDOCUMENTO) AS CGC,');
    Add('  RTRIM(DECODE(RTRIM(ESTADUAL.NUMDOCUMENTO),NULL,');
    Add('    DECODE(RTRIM(MUNICIPAL.NUMDOCUMENTO),NULL,NULL,');
    Add('    ''Inscrição Municipal: ''|| MUNICIPAL.NUMDOCUMENTO),');
    Add('    ''Inscrição Estadual: '' || ESTADUAL.NUMDOCUMENTO)) AS ESTADUALMUNICIPAL,');
    Add('  RTRIM(END.LOGRADOURO) ||'', ''|| END.NUMERO || DECODE(END.COMPLEMENTO,NULL,NULL,'' - '' ||');
    Add('    RTRIM(END.COMPLEMENTO)) ||'' - ''|| RTRIM(END.BAIRRO) ||'' - ''|| RTRIM(CIDADES.NOME) ||'' - CEP:''||');
    Add('    RTRIM(SUBSTR(END.CEP,1,5)) ||''-''|| RTRIM(SUBSTR(END.CEP,6,3)) AS ENDERECO,');
    Add('  ES.CODESTADO AS UF,');
    // Dados do Funcionário
    Add('  F.MATRICULA,');
    Add('  UPPER(PF.NOME) AS EMPREGADO,');
    Add('  RTRIM(CC.NOME) AS NOMECENTROCUSTO,');
    Add('  CC.CODCENTROCUSTO,');
    Add('  FE.FLGOCORRIDA,');
    Add('  FE.INIGOZOFERIAS,');
    Add('  FE.FIMGOZOFERIAS,');
    Add('  TO_CHAR(FE.INIGOZOFERIAS,''DD/MM/YYYY'') AS INI_PER,');
    Add('  TO_CHAR(FE.FIMGOZOFERIAS,''DD/MM/YYYY'') AS FIN_PER');
    Add('FROM');
    Add('  PESSOA PJ, PESSOA PF, ENDPESS END, FUNCIONARIO F, FERIAS FE, CIDADES,');
    Add('  ESTADO ES, CENTCUST CC, SITFUNC ST,');
    // ------------------------------------------------------------------------------- //
    // Inscrição Estadual do(s) Estabelecimento(s)
    Add('  (SELECT D.IDPESSOA, TD.CODDOCUMENTO, D.NUMDOCUMENTO');
    Add('   FROM   DOCPESSOA D, TIPODOCOFICIAL TD');
    Add('   WHERE (TD.SIGLADOCUMENTO = ''ESTADUAL:'') AND');
    Add('         (D.IDPESSOA        = '+qryEstab.FieldByName('IDPESSOA').asString+') AND');
    Add('         (TD.IDDOCUMENTO    = D.IDDOCUMENTO)) ESTADUAL,');
    // -------------------------------------------------------------------------- //
    // Inscrição Municipal do(s) Estabelecimento(s)
    Add('  (SELECT D.IDPESSOA, TD.CODDOCUMENTO, D.NUMDOCUMENTO');
    Add('   FROM   DOCPESSOA D, TIPODOCOFICIAL TD');
    Add('   WHERE (TD.SIGLADOCUMENTO = ''MUNICIPAL:'') AND');
    Add('         (D.IDPESSOA        = '+qryEstab.FieldByName('IDPESSOA').asString+') AND');
    Add('         (TD.IDDOCUMENTO    = D.IDDOCUMENTO)) MUNICIPAL');
    // -------------------------------------------------------------------------- //
    Add('WHERE');
    Add('  (PJ.IDPESSOA = '+qryEstab.FieldByName('IDPESSOA').asString+') AND');

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

    Add('  (((TO_CHAR(FE.INIGOZOFERIAS,''YYYY/MM/DD'') >= '+
      QuotedStr(FormatDateTime('YYYY/MM/DD',StrToDate(sDataInicial)))+') AND');
    Add('    (TO_CHAR(FE.INIGOZOFERIAS,''YYYY/MM/DD'') <= '+
      QuotedStr(FormatDateTime('YYYY/MM/DD',StrToDate(sDataFinal)))+')) OR');

    Add('  ((TO_CHAR(FE.FIMGOZOFERIAS,''YYYY/MM/DD'') >= '+
      QuotedStr(FormatDateTime('YYYY/MM/DD',StrToDate(sDataInicial)))+') AND');
    Add('   (TO_CHAR(FE.FIMGOZOFERIAS,''YYYY/MM/DD'') <= '+
      QuotedStr(FormatDateTime('YYYY/MM/DD',StrToDate(sDataFinal)))+'))) AND');

    Add('  (ST.IDSITFUNC      = F.IDSITFUNC)          AND');
    Add('  (F.IDESTAB         = PJ.IDPESSOA)          AND');
    Add('  (F.CODCENTROCUSTO  = CC.CODCENTROCUSTO)    AND');
    Add('  (F.IDPESSOA        = PF.IDPESSOA)          AND');
    Add('  (F.IDPESSOA        = FE.IDPESSOA)          AND');
    Add('  (PJ.IDPESSOA       = END.IDPESSOA(+))      AND');
    Add('  (PJ.IDENDCOMERCIAL = END.IDENDERECO(+))    AND');
    Add('  (END.IDCIDADES     = CIDADES.IDCIDADES(+)) AND');
    Add('  (CIDADES.IDESTADO  = ES.IDESTADO(+))       AND');
    Add('  (PJ.IDPESSOA       = ESTADUAL.IDPESSOA(+)) AND');
    Add('  (PJ.IDPESSOA       = MUNICIPAL.IDPESSOA(+))');
    Add('ORDER BY');
    case (cmbOrderBy.ItemIndex) of
      0 : Add('  NOMECENTROCUSTO, EMPREGADO, FE.INIGOZOFERIAS');
      1 : Add('  NOMECENTROCUSTO, MATRICULA, FE.INIGOZOFERIAS');
      2 : Add('  CODCENTROCUSTO, EMPREGADO, FE.INIGOZOFERIAS');
      3 : Add('  CODCENTROCUSTO, MATRICULA, FE.INIGOZOFERIAS');
    end;
    //SaveToFile ('c:\qry.txt');
    SaveToFile (Sistema.RetornaCaminhoArquivos(Sistema.IdEmpresa)+ '\qry.txt'); //Ádler Teodoro de Souza SOL 109421 KINTANA 496332
  end;

  // Monta Query Secundária
  with (dtmRelatorios1) do
  begin
    frmAguarde.Mostra('Acompanhamento de Escala de Férias');
    frmAguarde.Pos := 0;

    // Aponto o UpdateSQL para a query principal
    qryAcompEscalaFerias.UpdateObject := updSQL;

    if not(qryAcompEscalaFerias.IsEmpty) then
      qryAcompEscalaFerias.CancelUpdates;
    qryAcompEscalaFerias.Close;
    qryAcompEscalaFerias.Open;

    // Processa dados para a geração da query
    dtmBaseDados.qry.Open;
    GravaDadosQuery;
    qryAcompEscalaFerias.First;

    // Especifico Configurações do Relatório
    cJaProcess  := fcJaProcess.SelectedColor;
    cNaoProcess := fcNaoProcess.SelectedColor;
    rpAcompEscalaFerias.PrinterSetup.PaperName := cmbTipoPapel.Items[cmbTipoPapel.ItemIndex];
  end;
end;

// -------------------------------------------------------------------------------------
// Funções do Form
// -------------------------------------------------------------------------------------
procedure TfrmParamAcompEscalaFerias.GravaDadosQuery;
const
  MES: array[1..12] of string =
    ('01' ,'02' ,'03' ,'04' ,'05' ,'06' ,'07' ,'08' ,'09' ,'10' ,'11' ,'12');
var
  dtDataIni, dtDataFin: TDateTime;
  c, iMes, iOcorrida: integer;
  sDataRef, sDia, sMatricula, sDataGozoIni, sDataGozoFin: string;
begin
  with (dtmRelatorios1.qryAcompEscalaFerias) do
  begin
    if not(dtmBaseDados.qry.IsEmpty) then
    begin
      frmAguarde.Min := 0;
      frmAguarde.Max := dtmBaseDados.qry.RecordCount;

      dtDataIni := StrToDate(sDataInicial);
      dtDataFin := StrToDate(sDataFinal);

      // Arrumo os Ponteiros dos meses
      sDataRef := sDataInicial;
      for c:=1 to 12 do
      begin
        MES[c] := Copy(sDataRef,4,2);
        sDataRef := IncData(sDataRef,0,1,0);
      end;

      // LOOP para todos os funcionários
      while not(dtmBaseDados.qry.EOF) do
      begin
        Insert;
        // Dados do Estabelecimento
        FieldByName('EMPRESA').asString           := dtmBaseDados.qry.FieldByName('EMPRESA').asString;
        FieldByName('CGC').asString               := dtmBaseDados.qry.FieldByName('CGC').asString;
        FieldByName('ESTADUALMUNICIPAL').asString := dtmBaseDados.qry.FieldByName('ESTADUALMUNICIPAL').asString;
        FieldByName('ENDERECO').asString          := dtmBaseDados.qry.FieldByName('ENDERECO').asString;
        FieldByName('UF').asString                := dtmBaseDados.qry.FieldByName('UF').asString;
        // Dados do Funcionário
        FieldByName('MATRICULA').asString         := dtmBaseDados.qry.FieldByName('MATRICULA').asString;
        FieldByName('EMPREGADO').asString         := dtmBaseDados.qry.FieldByName('EMPREGADO').asString;
        FieldByName('CODCENTROCUSTO').asString    := dtmBaseDados.qry.FieldByName('CODCENTROCUSTO').asString;
        FieldByName('NOMECENTROCUSTO').asString   := dtmBaseDados.qry.FieldByName('NOMECENTROCUSTO').asString;
        FieldByName('DATA_REF_INI').asString      := sDataInicial;
        FieldByName('DATA_REF_FIN').asString      := sDataFinal;

        // Labels dos Meses escolhidos pelo usuário
        for c:=1 to 12 do
          FieldByName('NOME_MES_'+PoeZero(c)).asString := MesCurto[StrToInt(MES[c])];

        // Gravo os períodos do funcionário atual
        sMatricula := dtmBaseDados.qry.FieldByName('MATRICULA').asString;
        repeat
          iOcorrida    := dtmBaseDados.qry.FieldByName('FLGOCORRIDA').asInteger;
          sDataGozoIni := dtmBaseDados.qry.FieldByName('INI_PER').asString;
          sDataGozoFin := dtmBaseDados.qry.FieldByName('FIN_PER').asString;

          if (StrToDate(sDataGozoIni) >= dtDataIni) then
          begin
            // Assumo que este é o período inicial
            iMes := StrToInt(Copy(sDataGozoIni,4,2));
            sDia := Copy(sDataGozoIni,1,2);

            for c:=1 to 12 do
              if (MES[c] = PoeZero(iMes)) then
                break;

            FieldByName('TIPO_PERIODO_' +PoeZero(c)).asString := 'INICIAL';
            FieldByName('PERIODO_' +PoeZero(c)).asString      := sDia;
            FieldByName('OCORRIDA_'+PoeZero(c)).asInteger     := iOcorrida;
          end;

          if (StrToDate(sDataGozoFin) <= dtDataFin) then
          begin
            // Vejo se é período final ou (Inicial x Final)
            iMes := StrToInt(Copy(sDataGozoFin,4,2));
            sDia := Copy(sDataGozoFin,1,2);

            for c:=1 to 12 do
              if (MES[c] = PoeZero(iMes)) then
                break;

            if (Trim(FieldByName('PERIODO_'+PoeZero(c)).asString) <> '') then
            begin
              FieldByName('TIPO_PERIODO_' +PoeZero(c)).asString := 'INI_FIN';
              FieldByName('PERIODO_' +PoeZero(c)).asString :=
                FieldByName('PERIODO_' +PoeZero(c)).asString +'      '+ sDia;
            end
            else
            begin
              FieldByName('TIPO_PERIODO_' +PoeZero(c)).asString := 'FINAL';
              FieldByName('PERIODO_' +PoeZero(c)).asString := sDia;
            end;
          end;

          frmAguarde.Pos := frmAguarde.Pos + 1;
          dtmBaseDados.qry.Next;
        until (dtmBaseDados.qry.EOF) or
              (dtmBaseDados.qry.FieldByName('MATRICULA').asString <> sMatricula);
        Post;
      end;
    end
    else
    begin
      ModalResult := mrNone;
      frmAguarde.Apaga;
      MsgDlg('Não há dados a serem exibidos! Verifique.','Aviso',mtInformation,[mbOk,mbHelp],0);
    end;
  end;
end;

procedure TfrmParamAcompEscalaFerias.LeAlteracoes;
var
  iCor: LongInt;
  LiEstabelec: string;
begin
  // Recupera as últimas alterações das opções
  //ArqConfig := TIniFile.Create('C:\CONFIG_FOLHAPAGTO.INI');
  ArqConfig := TIniFile.Create(Sistema.RetornaCaminhoArquivos(Sistema.IdEmpresa) + '\CONFIG_FOLHAPAGTO.INI'); //Ádler Teodoro de Souza SOL 109421 KINTANA 496332

  iCor := StrToInt(ArqConfig.ReadString('REL_ACOMPESCFERIAS','CorJaProcess','-1'));
  if (iCor = -1) then
    fcJaProcess.SelectedColor := clBlue
  else
    fcJaProcess.SelectedColor := iCor;

  iCor := StrToInt(ArqConfig.ReadString('REL_ACOMPESCFERIAS','CorNaoProcess','-1'));
  if (iCor = -1) then
    fcNaoProcess.SelectedColor := clLime
  else
    fcNaoProcess.SelectedColor := iCor;

  cmbOrderBy.ItemIndex := StrToInt(ArqConfig.ReadString('REL_ACOMPESCFERIAS','OrdemRel', '0'));

  LiEstabelec := ArqConfig.ReadString ('REL_ACOMPESCFERIAS', 'Estabelec', '');
  if (LiEstabelec = '') then
  begin
    qryEstab.First;
    LiEstabelec := qryEstab.FieldByName('IDPESSOA').asString;
  end;
  dblkcbEstab.LookUpValue := LiEstabelec;
  dblkcbEstab.UpDate;
end;

procedure TfrmParamAcompEscalaFerias.GravaAlteracoes;
var
  sGravaPadrao: string;
begin
  ArqConfig.WriteString ('REL_ACOMPESCFERIAS', 'CorJaProcess' , IntToStr(fcJaProcess.SelectedColor));
  ArqConfig.WriteString ('REL_ACOMPESCFERIAS', 'CorNaoProcess', IntToStr(fcNaoProcess.SelectedColor));

  sGravaPadrao := IntToStr(cmbOrderBy.ItemIndex);
  ArqConfig.WriteString ('REL_ACOMPESCFERIAS', 'OrdemRel', sGravaPadrao);

  if (Trim(dblkcbEstab.Text) <> '') then
    ArqConfig.WriteString ('REL_ACOMPESCFERIAS', 'Estabelec', qryEstab.FieldByName('IDPESSOA').asString);
end;

procedure TfrmParamAcompEscalaFerias.MontaListaFuncionarios;
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
      if (sAux <> '') then
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

procedure TfrmParamAcompEscalaFerias.HabilitaBtOk;
begin
  bbtnConfirmar.Enabled := (Trim(dblkcbEstab.Text) <> '') and (Trim(speAno.Text) <> '');
end;

function TfrmParamAcompEscalaFerias.SelecionaTipoContrato: string;
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

function TfrmParamAcompEscalaFerias.SelecionaSitFunc: string;
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
