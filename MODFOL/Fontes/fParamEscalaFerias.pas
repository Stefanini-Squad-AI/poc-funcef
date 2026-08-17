// *****************************************************************************
// ***************************** REGISTRO DE ALTERAÇÕES ************************
// *****************************************************************************
// Autor(a)    :  Ádler Teodoro de Souza
// Data        :  19/02/2009
// Pendência   : SOL 109421 KINTANA 496332
// Descricao   :  Alteração de gravação de arquivos de log na raiz do disco C: .
//------------------------------------------------------------------------------
unit fParamEscalaFerias;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  MAHlpBtn, StdCtrls, Buttons, TB97Tlbr, TB97, ExtCtrls, Db, DBTables, Spin,
  Wwquery, Wwdatsrc, Mask, wwdbedit, Wwdotdot, Wwdbcomb, Machklb, wwdblook,
  checklst, IvDictio, IvMulti, IvEMulti, ComCtrls, wwdbdatetimepicker,
  CMDateTimePicker, fSairAjuda;

type
  TfrmParamEscalaFerias = class(TfrmSairAjuda)
    gbxEstab: TGroupBox;
    dblkcbEstab: TwwDBLookupCombo;
    qryEstab: TwwQuery;
    gbxOrdem: TGroupBox;
    cmbOrderBy: TComboBox;
    gbxTipoPapel: TGroupBox;
    cmbTipoPapel: TComboBox;
    gbDataRef: TGroupBox;
    dtedDataRef: TCMDateTimePicker;
    gbxFiltroCCusto: TGroupBox;
    chklstCCusto: TCheckListBox;
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
    procedure chklstCCustoDrawItem(Control: TWinControl; Index: Integer;
      Rect: TRect; State: TOwnerDrawState);
    procedure dtedDataRefChange(Sender: TObject);
    procedure gbxSituacaoEnter(Sender: TObject);
    procedure gbxSituacaoExit(Sender: TObject);
    procedure gbxTipContraEnter(Sender: TObject);
    procedure gbxTipContraExit(Sender: TObject);
    procedure chklstCCustoClickCheck(Sender: TObject);
    procedure bbtnSelTodosCCustoClick(Sender: TObject);
    procedure bbtnInverteSelCCustoClick(Sender: TObject);
    procedure bbtnSelTodosFuncClick(Sender: TObject);
    procedure bbtnInverteSelFuncClick(Sender: TObject);
    procedure chklstCCustoKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure chklstFuncKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure chklstFuncClickCheck(Sender: TObject);
  private
    procedure HabilitaBtOk;
    procedure GravaDadosQuery;
    procedure MontaListaFuncionarios;
    function  SelecionaTipoContrato: string;
    function  SelecionaSitFunc: string;
  end;

var
  frmParamEscalaFerias: TfrmParamEscalaFerias;

implementation

uses uSistema, uMensErro, uDataBase, uDiasUteis, fAguarde, dBaseDados,
  uFuncoesUteis, UsoGeralRH, uComumRelats, dRelatorios1;

{$R *.DFM}

procedure TfrmParamEscalaFerias.FormCreate(Sender: TObject);
var
  iPos: integer;
begin
  inherited;
  if not(Assigned(ListaCodCCusto)) then
    ListaCodCCusto := TStringList.Create;
  if not(Assigned(ListaCodFunc)) then
    ListaCodFunc := TStringList.Create;
  IDEstab := -1;

  cmbTipoPapel.Items.Assign (dtmRelatorios1.rpEscalaFerias.PrinterSetup.PaperNames);

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

procedure TfrmParamEscalaFerias.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  dtmBaseDados.qry.Close;
  qryEstab.Close;
  inherited;
end;

procedure TfrmParamEscalaFerias.chklstCCustoDrawItem(Control: TWinControl; Index: Integer;
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

procedure TfrmParamEscalaFerias.dblkcbEstabChange(Sender: TObject);
begin
  if (qryEstab.FieldByName('IDPESSOA').asInteger <> IDEstab) then
  begin
    MontaListaFuncionarios;
    IDEstab := qryEstab.FieldByName('IDPESSOA').asInteger;

    if (pgctrlEmpregados.ActivePageIndex = 0) then
      chklstFunc.Repaint;
  end;
end;

procedure TfrmParamEscalaFerias.dtedDataRefChange(Sender: TObject);
begin
  HabilitaBtOk;
end;

procedure TfrmParamEscalaFerias.gbxTipContraEnter(Sender: TObject);
begin
  bTipContrEfet  := cbxEfetivos.Checked;
  bTipContrEspec := cbxEspeciais.Checked;
  bTipContrTemp  := cbxTemporarios.Checked;
  bTipContrEst   := cbxEstagiarios.Checked;
  bTipContrTerc  := cbxTerceiros.Checked;
  bTipContrProp  := cbxPropDirSemVinc.Checked;
  bTipContrAut   := cbxAutonomos.Checked;
end;

procedure TfrmParamEscalaFerias.gbxTipContraExit(Sender: TObject);
begin
  if not(cbxEfetivos.Checked)       and not(cbxEspeciais.Checked) and
     not(cbxTemporarios.Checked)    and not(cbxTerceiros.Checked) and
     not(cbxPropDirSemVinc.Checked) and not(cbxAutonomos.Checked) and
     not(cbxEstagiarios.Checked) then
  begin
    MsgDlg ('Pelo menos um Tipo de Contrato deve ser selecionado !','Aviso', mtInformation,[mbOk,mbHelp],0);
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

procedure TfrmParamEscalaFerias.gbxSituacaoEnter(Sender: TObject);
begin
  bSitAtivo := (cbxAtivos.Checked);
  bSitAfast := (cbxAfastados.Checked);
end;

procedure TfrmParamEscalaFerias.gbxSituacaoExit(Sender: TObject);
begin
  if not(cbxAtivos.Checked) and not(cbxAfastados.Checked) then
  begin
    MsgDlg ('Pelo menos um Tipo de Situação deve ser selecionado !','Aviso', mtInformation,[mbOk,mbHelp],0);
    cbxAtivos.SetFocus;
  end
  else
  if (bSitAtivo <> cbxAtivos.Checked) or (bSitAfast <> cbxAfastados.Checked) then
    MontaListaFuncionarios;
end;

procedure TfrmParamEscalaFerias.chklstCCustoKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  if (Key = VK_TAB) then
    chklstCCustoClickCheck(Sender);
end;

procedure TfrmParamEscalaFerias.chklstFuncKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  if (Key = VK_TAB) then
    InvalidateItemListBox(TCustomListBox(Sender),TCustomListBox(Sender).ItemIndex);
end;

procedure TfrmParamEscalaFerias.chklstCCustoClickCheck(Sender: TObject);
begin
  InvalidateItemListBox(TCustomListBox(Sender),TCustomListBox(Sender).ItemIndex);
  MontaListaFuncionarios;  
end;

procedure TfrmParamEscalaFerias.chklstFuncClickCheck(Sender: TObject);
begin
  InvalidateItemListBox(TCustomListBox(Sender),TCustomListBox(Sender).ItemIndex);
end;

procedure TfrmParamEscalaFerias.bbtnSelTodosCCustoClick(Sender: TObject);
var
  c: integer;
begin
  for c:=0 to chklstCCusto.Items.Count-1 do
    chklstCCusto.Checked[c] := true;

  chklstCCusto.Repaint;
  MontaListaFuncionarios;
end;

procedure TfrmParamEscalaFerias.bbtnInverteSelCCustoClick(Sender: TObject);
var
  c: integer;
begin
  for c:=0 to chklstCCusto.Items.Count-1 do
    chklstCCusto.Checked[c] := not(chklstCCusto.Checked[c]);

  chklstCCusto.Repaint;    
  MontaListaFuncionarios;
end;

procedure TfrmParamEscalaFerias.bbtnSelTodosFuncClick(Sender: TObject);
var
  c: integer;
begin
  for c:=0 to chklstFunc.Items.Count-1 do
    chklstFunc.Checked[c] := true;

  chklstFunc.Repaint;    
  HabilitaBtOk;
end;

procedure TfrmParamEscalaFerias.bbtnInverteSelFuncClick(Sender: TObject);
var
  c: integer;
begin
  for c:=0 to chklstFunc.Items.Count-1 do
    chklstFunc.Checked[c] := not(chklstFunc.Checked[c]);

  chklstFunc.Repaint;
  HabilitaBtOk;
end;

procedure TfrmParamEscalaFerias.bbtnConfirmarClick(Sender: TObject);
var
  wNum: word;
begin
  // C. de Custo selecionados
  CriaListaOpcoes (chklstCCusto, ListaCodCCusto, sCodCCustoSel, ',', true);

  // Funcionários escolhidos
  wNum := CriaListaOpcoes (chklstFunc, ListaCodFunc, sCodFuncSel, ',', false);
  if (wNum = ListaCodFunc.Count) then
    sCodFuncSel := '';

  // Monta Query
  dtmBaseDados.qry.Close;
  with (dtmBaseDados.qry.SQL) do
  begin
    Clear;
    Add('SELECT DISTINCT');
    // Dados do Estabelecimento
    Add('  RTRIM(PJ.RAZAOSOCIAL) AS EMPRESA,');
    Add('  (''CNPJ: '' || PJ.NUMDOCUMENTO) AS CGC,');
    Add('  RTRIM(DECODE(RTRIM(ESTADUAL.NUMDOCUMENTO),NULL,');
    Add('    DECODE(RTRIM(MUNICIPAL.NUMDOCUMENTO),NULL,NULL,');
    Add('    ''Inscrição Municipal: ''|| MUNICIPAL.NUMDOCUMENTO),');
    Add('    ''Inscrição Estadual: '' || ESTADUAL.NUMDOCUMENTO)) AS ESTADUALMUNICIPAL,');
    Add('  RTRIM(E.LOGRADOURO) ||'', ''|| E.NUMERO || DECODE(E.COMPLEMENTO,NULL,NULL,'' - '' ||');
    Add('    RTRIM(E.COMPLEMENTO)) ||'' - ''|| RTRIM(E.BAIRRO) ||'' - ''|| RTRIM(CIDADES.NOME) ||'' - CEP:''||');
    Add('    RTRIM(SUBSTR(E.CEP,1,5)) ||''-''|| RTRIM(SUBSTR(E.CEP,6,3)) AS ENDERECO,');
    Add('  ES.CODESTADO AS UF,');
    // Dados do Funcionário
    Add('  F.MATRICULA,');
    Add('  UPPER(PF.NOME) AS EMPREGADO,');
    Add('  CC.CODCENTROCUSTO,');
    Add('  RTRIM(CC.NOME) AS NOMECENTROCUSTO,');
    Add('  TO_CHAR(F.DATAADMISSAO,''DD/MM/YYYY'')        AS DATAADMISSAO,');
    Add('  TO_CHAR(FERIAS_EM_ABERTO.DATA,''DD/MM/YYYY'') AS DT_FERIAS_EM_ABERTO,');
    Add('  TO_CHAR(FERIAS.DATA,''DD/MM/YYYY'')           AS DT_FERIAS,');
    Add('  TO_CHAR(FERIAS.ULT_FERIAS,''DD/MM/YYYY'')     AS ULT_FERIAS');
    Add('FROM');
    Add('  PESSOA PJ, PESSOA PF, ENDPESS E, FUNCIONARIO F, CENTCUST CC, ESTADO ES, CIDADES,');
    Add('  SITFUNC ST,');
    // -------------------------------------------------------------------------- //
    // Última Férias gozada pelo Funcionário
    Add('  (SELECT IDPESSOA, MAX(INIGOZOFERIAS) AS ULT_FERIAS, MAX(INIPERIODOFERIAS) AS DATA');
    Add('   FROM   FERIAS');
    Add('   WHERE  (FLGOCORRIDA       = 1) AND');
    Add('          (INIPERIODOFERIAS <= TO_DATE('+QuotedStr(dtedDataRef.Text)+',''DD/MM/YYYY''))');
    Add('   GROUP BY IDPESSOA) FERIAS,');
    // -------------------------------------------------------------------------- //
    // Última Férias em Aberto do Funcionário
    Add('  (SELECT IDPESSOA, MAX(INIPERIODOFERIAS) AS DATA');
    Add('   FROM FERIAS');
    Add('   WHERE (FLGOCORRIDA       = 0) AND');
    Add('         (INIPERIODOFERIAS <= TO_DATE('+QuotedStr(dtedDataRef.Text)+',''DD/MM/YYYY''))');
    Add('   GROUP BY IDPESSOA) FERIAS_EM_ABERTO,');
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

    Add('  (ST.IDSITFUNC      = F.IDSITFUNC)          AND');    
    Add('  (PJ.IDPESSOA       = E.IDPESSOA)           AND');
    Add('  (PJ.IDENDCOMERCIAL = E.IDENDERECO)         AND');
    Add('  (E.IDCIDADES       = CIDADES.IDCIDADES)    AND');
    Add('  (CIDADES.IDESTADO  = ES.IDESTADO)          AND');
    Add('  (PJ.IDPESSOA       = F.IDESTAB)            AND');
    Add('  (F.CODCENTROCUSTO  = CC.CODCENTROCUSTO)    AND');
    Add('  (F.IDPESSOA        = PF.IDPESSOA)          AND');
    Add('  (F.IDPESSOA        = FERIAS.IDPESSOA(+))   AND');
    Add('  (F.IDPESSOA        = FERIAS_EM_ABERTO.IDPESSOA(+)) AND');
    Add('  (PJ.IDPESSOA       = ESTADUAL.IDPESSOA(+)) AND');
    Add('  (PJ.IDPESSOA       = MUNICIPAL.IDPESSOA(+))');
    Add('ORDER BY');
    case (cmbOrderBy.ItemIndex) of
      0 : Add('  NOMECENTROCUSTO, EMPREGADO');
      1 : Add('  NOMECENTROCUSTO, MATRICULA');
      2 : Add('  CODCENTROCUSTO, EMPREGADO');
      3 : Add('  CODCENTROCUSTO, MATRICULA');
    end;
    //SaveToFile ('c:\qry.txt');
    SaveToFile (Sistema.RetornaCaminhoArquivos(Sistema.IdEmpresa)+'\qry.txt'); //Ádler Teodoro de Souza SOL 109421 KINTANA 496332
  end;

  // Monta Query Secundária
  with (dtmRelatorios1) do
  begin
    frmAguarde.Mostra ('Escala de Férias');
    frmAguarde.Pos := 0;

    // Aponto o UpdateSQL para a query principal
    qryEscalaFerias.UpdateObject := updSQL;

    if not(qryEscalaFerias.IsEmpty) then
      qryEscalaFerias.CancelUpdates;
    qryEscalaFerias.Close;
    qryEscalaFerias.Open;

    // Processa dados para a geração da query
    dtmBaseDados.qry.Open;
    GravaDadosQuery;
    qryEscalaFerias.First;

    // Especifico Configurações do Relatório
    rpEscalaFerias.PrinterSetup.PaperName := cmbTipoPapel.Items[cmbTipoPapel.ItemIndex];
  end;
end;

// -------------------------------------------------------------------------------------
// Funções do Form
// -------------------------------------------------------------------------------------
procedure TfrmParamEscalaFerias.GravaDadosQuery;
var
  c, iNumPerAquis: integer;
  sDataLimite, sDataPerAquis: string;
begin
  with (dtmRelatorios1.qryEscalaFerias) do
  begin
    if not(dtmBaseDados.qry.IsEmpty) then
    begin
      frmAguarde.Min := 0;
      frmAguarde.Max := dtmBaseDados.qry.RecordCount;

      // LOOP para todos os funcionários
      while not(dtmBaseDados.qry.EOF) do
      begin
        // Seleciono qual data usar como Início do Período Aquisitivo
        if (Trim(dtmBaseDados.qry.FieldByName('DT_FERIAS_EM_ABERTO').asString) <> '') then
          sDataPerAquis := dtmBaseDados.qry.FieldByName('DT_FERIAS_EM_ABERTO').asString
        else
        if (Trim(dtmBaseDados.qry.FieldByName('DT_FERIAS').asString) <> '') then
          sDataPerAquis := IncData(dtmBaseDados.qry.FieldByName('DT_FERIAS').asString,0,0,1)
        else
          sDataPerAquis := dtmBaseDados.qry.FieldByName('DATAADMISSAO').asString;

        // Calculo as férias vencidas
        iNumPerAquis := (DiasUteis.IntervaloMeses (StrToDate(sDataPerAquis), StrToDate(dtedDataRef.Text)) div 12);

        // Calculo TODOS OS PERÍODOS AQUISITIVOS ENTRE O ÚLTIMO E A DATA DE REFERÊNCIA
        for c:=1 to iNumPerAquis do
        begin
          // Calculo a Data Limite
          sDataLimite := IncData(sDataPerAquis,0,23,0);

          // ----------------------------------------------------------------------------------
          // Gravo os dados
          // ----------------------------------------------------------------------------------
          Insert;
          // Dados do Estabelecimento
          FieldByName('EMPRESA').asString           := dtmBaseDados.qry.FieldByName('EMPRESA').asString;
          FieldByName('CGC').asString               := dtmBaseDados.qry.FieldByName('CGC').asString;
          FieldByName('ESTADUALMUNICIPAL').asString := dtmBaseDados.qry.FieldByName('ESTADUALMUNICIPAL').asString;
          FieldByName('ENDERECO').asString          := dtmBaseDados.qry.FieldByName('ENDERECO').asString;
          FieldByName('UF').asString                := dtmBaseDados.qry.FieldByName('UF').asString;
          // Dados do Funcionário
          if (c=1) then
          begin
            FieldByName('MATRICULA').asString  := dtmBaseDados.qry.FieldByName('MATRICULA').asString;
            FieldByName('EMPREGADO').asString  := dtmBaseDados.qry.FieldByName('EMPREGADO').asString;
            FieldByName('ULT_FERIAS').asString := dtmBaseDados.qry.FieldByName('ULT_FERIAS').asString;
          end;
          FieldByName('CODCENTROCUSTO').asString      := dtmBaseDados.qry.FieldByName('CODCENTROCUSTO').asString;
          FieldByName('NOMECENTROCUSTO').asString     := dtmBaseDados.qry.FieldByName('NOMECENTROCUSTO').asString;
          FieldByName('DATAADMISSAO').asString        := dtmBaseDados.qry.FieldByName('DATAADMISSAO').asString;
          FieldByName('DT_FERIAS_EM_ABERTO').asString := dtmBaseDados.qry.FieldByName('DT_FERIAS_EM_ABERTO').asString;
          FieldByName('DATA_REF').asString            := dtedDataRef.Text;
          FieldByName('PER_AQUIS_INI').asString       := sDataPerAquis;
          FieldByName('PER_AQUIS_FIN').asString       :=
            DateToStr(StrToDate(IncData(sDataPerAquis,0,0,1))-1);
          FieldByName('DATA_LIMITE').asString         := sDataLimite;
          FieldByName('DATA_APOS').asString           := IncData(sDataPerAquis,0,0,1);

          if (c = iNumPerAquis) then
            FieldByName('NUM_FUNC').asInteger := 1
          else
            FieldByName('NUM_FUNC').asInteger := 0;

          Post;

          sDataPerAquis := IncData(sDataPerAquis,0,0,1);
        end;

        frmAguarde.Pos := frmAguarde.Pos + 1;
        dtmBaseDados.qry.Next;
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

procedure TfrmParamEscalaFerias.MontaListaFuncionarios;
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

procedure TfrmParamEscalaFerias.HabilitaBtOk;
begin
  bbtnConfirmar.Enabled := (Trim(dblkcbEstab.Text) <> '') and (Trim(dtedDataRef.Text) <> '');
end;

function TfrmParamEscalaFerias.SelecionaTipoContrato: string;
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

function TfrmParamEscalaFerias.SelecionaSitFunc: string;
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
