// *****************************************************************************
// ***************************** REGISTRO DE ALTERAÇÕES ************************
// *****************************************************************************
// Autor(a)    :  Ádler Teodoro de Souza
// Data        :  19/02/2009
// Pendência   : SOL 109421 KINTANA 496332
// Descricao   :  Alteração de gravação de arquivos de log na raiz do disco C: .
//------------------------------------------------------------------------------

unit fParamFolhaFreqEscala;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs, MAHlpBtn,
  StdCtrls, Buttons, TB97Tlbr, TB97, ExtCtrls, Db, DBTables, Wwquery, wwdblook, Spin,
  Checklst, IvDictio, IvMulti, IvEMulti, ComCtrls, fSairAjuda;

type
  TfrmParamFolhaFreqEscala = class(TfrmSairAjuda)
    gbxEstabelecimento: TGroupBox;
    dblkcbEstab: TwwDBLookupCombo;
    gbxAnoMesRef: TGroupBox;
    cmbMes: TComboBox;
    speAno: TSpinEdit;
    gbxOrdem: TGroupBox;
    cmbOrderBy: TComboBox;
    gbxTipoPapel: TGroupBox;
    cmbTipoPapel: TComboBox;
    qryEstab: TwwQuery;
    qryFeriado: TwwQuery;
    qryFerias: TwwQuery;
    qryDiasExtras: TwwQuery;
    _qry: TwwQuery;
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
    cbxDemitidos: TCheckBox;
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
    procedure chklstFuncClickCheck(Sender: TObject);
    procedure bbtnSelTodosFuncClick(Sender: TObject);
    procedure bbtnInverteSelFuncClick(Sender: TObject);
    procedure speAnoChange(Sender: TObject);
    procedure chklstFuncKeyDown(Sender: TObject; var Key: Word; Shift: TShiftState);
  private
    iFlgDoisCargos: integer;

    procedure HabilitaBtOk;
    procedure GravaDadosQuery;
    procedure MontaListaFuncionarios;
    function  SelTipContr: string;
    function  SelSitFunc: string;
  end;

var
  frmParamFolhaFreqEscala: TfrmParamFolhaFreqEscala;

implementation

uses uSistema, uMensErro, uDiasUteis, uDataBase, fAguarde, dBaseDados, uFuncoesUteis,
  UsoGeralRH, uComumRelats, dRelatorios1;

{$R *.DFM}

procedure TfrmParamFolhaFreqEscala.FormCreate(Sender: TObject);
var
  iPos: integer;
begin
  inherited;
  if not(Assigned(ListaCodFunc)) then
    ListaCodFunc := TStringList.Create;
  IdEstab := -1;

  cmbTipoPapel.Items.Assign (dtmRelatorios1.rpFolhaFreqEscala.PrinterSetup.PaperNames);

  iPos := ProcuraStList (cmbTipoPapel.Items,'A4');
  if (iPos = -1) then
    cmbTipoPapel.ItemIndex := 0
  else
    cmbTipoPapel.ItemIndex := iPos;

  FazQuery(dtmBaseDados.qry, 'SELECT NORMALINI, FLGDOISCARGOS FROM PARAMRH');
  cmbMes.ItemIndex := ExtraiMes(dtmBaseDados.qry.FieldByName('NORMALINI').asDateTime) - 1;
  speAno.Text := Copy(dtmBaseDados.qry.FieldByName('NORMALINI').asString,7,4);
  iFlgDoisCargos := dtmBaseDados.qry.FieldByName('FLGDOISCARGOS').asInteger;

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

  cmbOrderBy.ItemIndex := 0;
  pgctrlEmpregados.ActivePageIndex := 0;

  HabilitaBtOk;
end;

procedure TfrmParamFolhaFreqEscala.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  dtmBaseDados.qry.Close;
  qryEstab.Close;
  inherited;
end;

procedure TfrmParamFolhaFreqEscala.chklstFuncDrawItem(Control: TWinControl; Index: Integer;
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

procedure TfrmParamFolhaFreqEscala.dblkcbEstabChange(Sender: TObject);
begin
  if (qryEstab.FieldByName('IDPESSOA').asInteger <> IdEstab) then
  begin
    MontaListaFuncionarios;
    IdEstab := qryEstab.FieldByName('IDPESSOA').asInteger;

    if (pgctrlEmpregados.ActivePageIndex = 0) then
      chklstFunc.Repaint;
  end;
end;

procedure TfrmParamFolhaFreqEscala.speAnoChange(Sender: TObject);
begin
  HabilitaBtOk;
end;

procedure TfrmParamFolhaFreqEscala.gbxTipContraEnter(Sender: TObject);
begin
  bTipContrEfet := cbxEfetivos.Checked;
  bTipContrEspec := cbxEspeciais.Checked;
  bTipContrTemp := cbxTemporarios.Checked;
  bTipContrEst := cbxEstagiarios.Checked;
  bTipContrTerc := cbxTerceiros.Checked;
  bTipContrProp := cbxPropDirSemVinc.Checked;
  bTipContrAut := cbxAutonomos.Checked;
end;

procedure TfrmParamFolhaFreqEscala.gbxTipContraExit(Sender: TObject);
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

procedure TfrmParamFolhaFreqEscala.gbxSituacaoEnter(Sender: TObject);
begin
  bSitAtivo := (cbxAtivos.Checked);
  bSitAfast := (cbxAfastados.Checked);
  bSitDemit := (cbxDemitidos.Checked);
end;

procedure TfrmParamFolhaFreqEscala.gbxSituacaoExit(Sender: TObject);
begin
  if not(cbxAtivos.Checked) and not(cbxAfastados.Checked) and not(cbxDemitidos.Checked) then
  begin
    MsgDlg('Pelo menos um Tipo de Situação deve ser selecionado.', 'Aviso',
      mtInformation, [mbOk,mbHelp], 0);
    cbxAtivos.SetFocus;
  end
  else
  if (bSitAtivo <> cbxAtivos.Checked) or (bSitAfast <> cbxAfastados.Checked) or
     (bSitDemit <> cbxDemitidos.Checked) then
    MontaListaFuncionarios;
end;

procedure TfrmParamFolhaFreqEscala.chklstFuncKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  if (Key = VK_TAB) then
    InvalidateItemListBox(TCustomListBox(Sender), TCustomListBox(Sender).ItemIndex);
end;

procedure TfrmParamFolhaFreqEscala.chklstFuncClickCheck(Sender: TObject);
begin
  InvalidateItemListBox(TCustomListBox(Sender), TCustomListBox(Sender).ItemIndex);
  HabilitaBtOk;  
end;

procedure TfrmParamFolhaFreqEscala.bbtnSelTodosFuncClick(Sender: TObject);
var
  c: integer;
begin
  for c:=0 to chklstFunc.Items.Count-1 do
    chklstFunc.Checked[c] := true;
  chklstFunc.Repaint;
  HabilitaBtOk;
end;

procedure TfrmParamFolhaFreqEscala.bbtnInverteSelFuncClick(Sender: TObject);
var
  c: integer;
begin
  for c:=0 to chklstFunc.Items.Count-1 do
    chklstFunc.Checked[c] := not(chklstFunc.Checked[c]);
  chklstFunc.Repaint;
  HabilitaBtOk;
end;

procedure TfrmParamFolhaFreqEscala.bbtnConfirmarClick(Sender: TObject);
var
  wNum: word;
begin
  // Empregados escolhidos
  wNum := CriaListaOpcoes(chklstFunc, ListaCodFunc, sCodFuncSel, ',', false);
  if (wNum = ListaCodFunc.Count) then
    sCodFuncSel := '';

  // Monta Query Auxiliar
  _qry.Close;
  with (_qry.SQL) do
  begin
    Clear;
    Add('SELECT DISTINCT');
    Add('  RTRIM(PJ.RAZAOSOCIAL) AS ESTAB,');
    Add('  E.IDCIDADES,');
    Add('  PAISUF.IDPAIS,');
    Add('  RTRIM(ES.CODESTADO) AS UF,');
    Add('  RTRIM(E.LOGRADOURO) ||'', ''|| E.NUMERO ||');
    Add('    DECODE(E.COMPLEMENTO,'' '','' - '' || RTRIM(E.COMPLEMENTO)) ||');
    Add('    '' - ''|| RTRIM(E.BAIRRO) AS ENDERECO,');
    Add('  RTRIM(ES.NOMEESTADO) AS ESTADO,');
    // Dados do Funcionário
    Add('  F.IDPESSOA,');
    Add('  F.MATRICULA,');
    Add('  '+QuotedStr(MesExtensoAno(speAno.Text +'/'+ PoeZero(cmbMes.ItemIndex+1)))+' AS REFERENCIA,');
    Add('  RTRIM(PF.NOME) AS EMPREGADO,');
    Add('  RTRIM(CC.NOME) AS C_CUSTO,');
    Add('  F.IDCARGO,');
    Add('  F.IDFUNCAO,');
    Add('  F.DATAADMISSAO,');
    Add('  F.DATAREFHORARIO,');
    // Horário
    Add('  HT.FLGTIPOHORARIO,');
    Add('  HT.NOMEHORARIO,');
    Add('  HT.HORASFOLGA1,');
    Add('  HT.HORASSERVICO,');
    Add('  HT.HORASFOLGA2');
    // -------------------------------------------------------------------------- //
    Add('FROM');
    Add('  PESSOA PJ, PESSOA PF, ENDPESS E, FUNCIONARIO F, ESTADO ES,');
    Add('  CIDADES, CENTCUST CC, HORATRAB HT, SITFUNC ST,');
    // -------------------------------------------------------------------------- //
    // UF do País
    Add('  (SELECT PS.IDPAIS, UF.CODESTADO');
    Add('   FROM   ESTADO UF, PAIS PS');
    Add('   WHERE (PS.IDPAIS = UF.IDPAIS)) PAISUF');
    // -------------------------------------------------------------------------- //
    Add('WHERE');
    Add('  (PJ.IDPESSOA        = ' +qryEstab.FieldByName('IDPESSOA').asString+ ') AND');

    if (sCodFuncSel <> '') then
    begin
      if (Pos(',',sCodFuncSel) > 0) then
        Add('  (F.IDPESSOA        IN (' +sCodFuncSel+ ')) AND')
      else
        Add('  (F.IDPESSOA         = ' +sCodFuncSel+ ') AND');
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

      sAux := SelSitFunc;
      if (sAux <> '') then
        if (Pos(',',sAux) > 0) then
          Add('  (ST.TIPOSIT        IN (' +sAux+ ')) AND')
        else
          Add('  (ST.TIPOSIT         = ' +sAux+ ') AND');

      sAux := SelTipContr;
      if (Pos(',',sAux) > 0) then
        Add('  (F.TIPOCONTRATO    IN (' +sAux+ ')) AND')
      else
        Add('  (F.TIPOCONTRATO     = ' +sAux+ ') AND');
    end;

    Add('  (HT.FLGTIPOHORARIO  = 1) AND');
    Add('  (ST.IDSITFUNC       = F.IDSITFUNC) AND');
    Add('  (HT.IDHORARIO       = F.IDHORARIO) AND');
    Add('  (PJ.IDPESSOA        = F.IDESTAB) AND');
    Add('  (PJ.IDENDCOMERCIAL  = E.IDENDERECO) AND');
    Add('  (PJ.IDPESSOA        = E.IDPESSOA) AND');
    Add('  (E.IDCIDADES        = CIDADES.IDCIDADES) AND');
    Add('  (CIDADES.IDESTADO   = ES.IDESTADO) AND');
    Add('  ((CIDADES.IDPAIS    = PAISUF.IDPAIS) OR');
    Add('   (E.IDPAIS          = PAISUF.IDPAIS)) AND');
    Add('  (F.CODCENTROCUSTO   = CC.CODCENTROCUSTO) AND');
    Add('  (F.IDPESSOA         = PF.IDPESSOA)');
    Add('ORDER BY');
    case (cmbOrderBy.ItemIndex) of
      0 : Add('  UPPER(EMPREGADO), UPPER(C_CUSTO)');
      1 : Add('  MATRICULA, UPPER(C_CUSTO)');
      2 : Add('  UPPER(C_CUSTO), UPPER(EMPREGADO)');
      3 : Add('  UPPER(C_CUSTO), MATRICULA');
    end;
    //SaveToFile('c:\qry.txt');
    SaveToFile(Sistema.RetornaCaminhoArquivos(Sistema.IdEmpresa)+'\qry.txt');//Ádler Teodoro de Souza SOL 109421 KINTANA 496332
  end;

  // Monta Query Principal
  with (dtmRelatorios1) do
  begin
    frmAguarde.Mostra('Folha de Frequência (Horário Escala)');
    frmAguarde.Pos := 0;

    // Aponto o UpdateSQL para a query principal
    qryFolhaFreqEscala.UpdateObject := updSQL;

    if not(qryFolhaFreqEscala.IsEmpty) then
      qryFolhaFreqEscala.CancelUpdates;
    qryFolhaFreqEscala.Close;
    qryFolhaFreqEscala.Open;

    // Processa dados para a geração da query
    _qry.Open;
    GravaDadosQuery;
    qryFolhaFreqEscala.First;

    // Especifico Configurações do Relatório
    rpFolhaFreqEscala.PrinterSetup.PaperName := cmbTipoPapel.Items[cmbTipoPapel.ItemIndex];
  end;
end;

// -------------------------------------------------------------------------------------
// Funções do Form
// -------------------------------------------------------------------------------------
procedure TfrmParamFolhaFreqEscala.GravaDadosQuery;
var
  dtDataRef: TDateTime;
  TotHoras, iIdPessoa, c: integer;
  Hora1, Hora2, Resto: real;
begin
  with (dtmRelatorios1.qryFolhaFreqEscala) do
  begin
    if not(_qry.IsEmpty) then
    begin
      frmAguarde.Min := 0;
      frmAguarde.Max := _qry.RecordCount;
      
      dtDataRef := StrToDate('01/'+ PoeZero(cmbMes.ItemIndex+1) +'/'+ speAno.Text);

      // Todos os feriados no período
      qryFeriado.Close;
      with (qryFeriado.SQL) do
      begin
        Clear;
        Add('SELECT');
        Add('  DATAFERIADO, FLGTIPO');
        Add('FROM');
        Add('  FERIADOS');
        Add('WHERE');
        Add('  (FLGTIPO IN (''O'',''E'')) AND');
        Add('  (DATAFERIADO >= TO_DATE('+QuotedStr('01/'+ PoeZero(cmbMes.ItemIndex+1) +'/'+ speAno.Text)+',''DD/MM/YYYY'')) AND');
        Add('  (DATAFERIADO <= TO_DATE('+QuotedStr(PoeZero(TrazUltDiaMes(cmbMes.ItemIndex+1,speAno.Value)) +'/'+
                 PoeZero(cmbMes.ItemIndex+1) +'/'+ speAno.Text)+',''DD/MM/YYYY'')) AND');
        Add('  (IDPAIS      = '+_qry.FieldByName('IDPAIS').asString+') AND');
        Add('  (((FLGAMBITO  = ''M'') AND (IDCIDADES  = '+_qry.FieldByName('IDCIDADES').asString+')) OR');
        Add('   ((FLGAMBITO  = ''E'') AND (CODESTADO  = '+QuotedStr(_qry.FieldByName('UF').asString)+')) OR');
        Add('   (FLGAMBITO   = ''F''))');
        Add('ORDER BY');
        Add('  DATAFERIADO, FLGTIPO');
      end;
      qryFeriado.Open;

      // Pego o ID de cada funcionário Listado na Query Auxiliar para ver se têm Férias para o
      // período especificado
      sCodFuncSel:=''; C:=1;
      repeat
        sCodFuncSel := sCodFuncSel + IFF(C > 1,',','')+ _qry.FieldByName('IDPESSOA').asString;
        iIdPessoa := _qry.FieldByName('IDPESSOA').asInteger;
        repeat
          _qry.Next;
        until (iIdPessoa <> _qry.FieldByName('IDPESSOA').asInteger) or (_qry.EOF);
        Inc(C);
      until (_qry.EOF);

      // Todos os dias extras no período para os funcionários selecionados
      qryDiasExtras.Close;
      with (qryDiasExtras.SQL) do
      begin
        Clear;
        Add('SELECT DISTINCT');
        Add('  IDPESSOA, DIATRAB');
        Add('FROM');
        Add('  DIAEXTRATRAB');
        Add('WHERE');

        if (Pos(',',sCodFuncSel) = 0) then
          Add('  (IDPESSOA  = ' +sCodFuncSel+ ') AND')
        else
          Add('  (IDPESSOA IN (' +sCodFuncSel+ ')) AND');

        Add('  (DIATRAB  >= TO_DATE('+QuotedStr('01/'+ PoeZero(cmbMes.ItemIndex+1) +'/'+ speAno.Text)+',''DD/MM/YYYY'')) AND');
        Add('  (DIATRAB  <= TO_DATE('+QuotedStr(PoeZero(TrazUltDiaMes(cmbMes.ItemIndex+1,speAno.Value)) +'/'+
                                      PoeZero(cmbMes.ItemIndex+1) +'/'+ speAno.Text)+',''DD/MM/YYYY''))');
        Add('ORDER BY');
        Add('  IDPESSOA, DIATRAB');
      end;
      qryDiasExtras.Open;

      // Todos os períodos de férias no período
      qryFerias.Close;
      with (qryFerias.SQL) do
      begin
        Clear;
        Add('SELECT DISTINCT');
        Add('  IDPESSOA, INIGOZOFERIAS, FIMGOZOFERIAS');
        Add('FROM');
        Add('  FERIAS');
        Add('WHERE');

        if (Pos(',',sCodFuncSel) = 0) then
          Add('  (IDPESSOA  = ' +sCodFuncSel+ ') AND')
        else
          Add('  (IDPESSOA IN (' +sCodFuncSel+ ')) AND');

        Add('  (FIMGOZOFERIAS >= TO_DATE('+QuotedStr('01/'+ PoeZero(cmbMes.ItemIndex+1) +'/'+ speAno.Text)+',''DD/MM/YYYY'')) AND');
        Add('  (INIGOZOFERIAS <= TO_DATE('+QuotedStr(PoeZero(TrazUltDiaMes(cmbMes.ItemIndex+1,speAno.Value)) +'/'+
                                           PoeZero(cmbMes.ItemIndex+1) +'/'+ speAno.Text)+',''DD/MM/YYYY''))');
      end;
      qryFerias.Open;

      // Cargos dos Empregados
      with (dtmBaseDados.qry) do
      begin
        Close;
        SQL.Clear;
        SQL.Add('SELECT IDCARGO, TITULO FROM CARGO ORDER BY IDCARGO');
        Open;
      end;

      // ---------------------------------------------------------------------------
      // Gravo registros
      // ---------------------------------------------------------------------------
      _qry.First;
      repeat
        // Se for horário por escala e não tiver a data de referência não exibe
        if (_qry.FieldByName('DATAREFHORARIO').IsNull) and
           (_qry.FieldByName('FLGTIPOHORARIO').asInteger <> 0) then
        begin
          repeat
            frmAguarde.Pos := frmAguarde.Pos+1;
            _qry.Next;
          until (_qry.FieldByName('IDPESSOA').asInteger <> iIdPessoa) or (_qry.EOF);
          continue;
        end;

        Insert;
        FieldByName('ESTAB').asString := _qry.FieldByName('ESTAB').asString;
        FieldByName('ENDERECO').asString := _qry.FieldByName('ENDERECO').asString;
        FieldByName('UF').asString := _qry.FieldByName('ESTADO').asString;
        FieldByName('MATRICULA').asString := _qry.FieldByName('MATRICULA').asString;
        FieldByName('REFERENCIA').asString := _qry.FieldByName('REFERENCIA').asString;
        FieldByName('EMPREGADO').asString := _qry.FieldByName('EMPREGADO').asString;
        FieldByName('C_CUSTO').asString := _qry.FieldByName('C_CUSTO').asString;
        FieldByName('DATAADMISSAO').asString := _qry.FieldByName('DATAADMISSAO').asString;
        FieldByName('NOMEHORARIO').asString := _qry.FieldByName('NOMEHORARIO').asString;
        FieldByName('NUM_DIAS_MES').asInteger := TrazUltDiaMes(cmbMes.ItemIndex+1, speAno.Value);

        if (iFlgDoisCargos = 1) and
           (dtmBaseDados.qry.Locate('IDCARGO', _qry.FieldByName('IDFUNCAO').Value, [])) then
          FieldByName('CARGO').asString := dtmBaseDados.qry.FieldByName('TITULO').asString
        else
        begin
          dtmBaseDados.qry.Locate('IDCARGO', _qry.FieldByName('IDCARGO').Value, []);
          FieldByName('CARGO').asString := dtmBaseDados.qry.FieldByName('TITULO').asString;
        end;

        iIdPessoa := _qry.FieldByName('IDPESSOA').asInteger;

        // Calculo os Tipos de Dia no Período
        qryFerias.First;

        // Tipo de Horário por Escala
        if (_qry.FieldByName('FLGTIPOHORARIO').asInteger = 1) then
        begin
  //        Hora1    := _qry.FieldByName('HORASFOLGA1').Value;
          Hora2 := 0;
          TotHoras := _qry.FieldByName('HORASFOLGA1').Value +
            _qry.FieldByName('HORASSERVICO').Value +
            _qry.FieldByName('HORASFOLGA2').Value;

          for C:=1 to TrazUltDiaMes(cmbMes.ItemIndex+1, speAno.Value) do
          begin
            Hora1 := ((dtDataRef + C - 1 -
              _qry.FieldByName('DATAREFHORARIO').Value) * 24
              mod TotHoras) + _qry.FieldByName('HORASFOLGA1').Value;

            if (Hora1 >= 24) and
               (TotHoras - Hora1 < _qry.FieldByName('HORASSERVICO').Value) then
              Resto := _qry.FieldByName('HORASSERVICO').Value + Hora1 - TotHoras
            else
              Resto := 0;

            if (Resto > 0) then
            begin
              Hora2 := Resto;
              Hora1 := 0;
            end
            else
            if (Resto = 0) and (C > 1) then
            begin
              Hora1 := Hora2 + _qry.FieldByName('HORASFOLGA2').Value +
                       _qry.FieldByName('HORASFOLGA1').Value;
              if (Hora1 > 24) then
                Hora1 := Hora1 - 24;
            end;

            if (Hora1 < 24) then
            begin
              if (Resto <= 0) then
                Hora2 := Hora1 + _qry.FieldByName('HORASSERVICO').Value;

              if (Hora2 > 24) then
              begin
  //            Resto := Hora2 - 24;
                Hora2 := 24;
              end;
  //            else
  //              Resto := 0;

              if (Hora1 <> 0) and (Hora1 <> 24) then
                FieldByName('ENTRADA'+PoeZero(C)).asString :=
                  IntToStr(Trunc(Hora1)) +':'+ FormatFloat('00',(Frac(Hora1) * 100));

              if (Hora2 <> 0) and (Hora2 <> 24) then
                FieldByName('SAIDA'+PoeZero(C)).asString :=
                  IntToStr(Trunc(Hora2)) +':'+ FormatFloat('00',(Frac(Hora2) * 100));
            end
            else
            begin
              FieldByName ('ENTRADA'+PoeZero(C)).asString := '';
              FieldByName ('SAIDA'+PoeZero(C)).asString := '';
            //  Hora1 := Hora1 - 24;
  //            Resto := -1;
            end;
          end;
        end;

        // Movo para o último registro do funcionário
        repeat
          frmAguarde.Pos := frmAguarde.Pos+1;
          _qry.Next;
        until (_qry.FieldByName('IDPESSOA').asInteger <> iIdPessoa) or (_qry.EOF);
        Post;
      until (_qry.EOF);

      qryFeriado.Close;
      qryFerias.Close;
    end
    else
    begin
      ModalResult := mrNone;
      frmAguarde.Apaga;
      MsgDlg('Não há dados a serem exibidos.' +CR_LF+ 'Verifique.',
        'Aviso', mtInformation, [mbOk,mbHelp], 0);
    end;
  end;
end;

procedure TfrmParamFolhaFreqEscala.HabilitaBtOk;
begin
  bbtnConfirmar.Enabled := (dblkcbEstab.Text <> '') and (Trim(speAno.Text) <> '');
end;

procedure TfrmParamFolhaFreqEscala.MontaListaFuncionarios;
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
      Add('  PESSOA PF, FUNCIONARIO F, SITFUNC ST, HORATRAB HT');
      Add('WHERE');
      Add('  (F.IDESTAB         = ' +qryEstab.FieldByName('IDPESSOA').asString+ ') AND');

      sAux := SelSitFunc;
      if (Pos(',',sAux) > 0) then
        Add('  (ST.TIPOSIT         IN (' +sAux+ ')) AND')
      else
        Add('  (ST.TIPOSIT          = ' +sAux+ ') AND');

      // C. de Custo(s) habilitados para o usuário
      if (sUsuXccusto <> '') then
      begin
        if (Pos(',',sUsuXccusto) > 0) then
          Add('  (F.CODCENTROCUSTO IN ' +sUsuXccusto+ ') AND')
        else
          Add('  (F.CODCENTROCUSTO  = ' +sUsuXccusto+ ') AND');
      end;

      sAux := SelTipContr;
      if (Pos(',',sAux) > 0) then
        Add('  (F.TIPOCONTRATO   IN (' +sAux+ ')) AND')
      else
        Add('  (F.TIPOCONTRATO    = ' +sAux+ ') AND');

      Add('  (HT.FLGTIPOHORARIO = 1) AND');
      Add('  (ST.IDSITFUNC      = F.IDSITFUNC) AND');      
      Add('  (HT.IDHORARIO      = F.IDHORARIO) AND');
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
  end;
  HabilitaBtOk;
end;

function TfrmParamFolhaFreqEscala.SelTipContr: string;
begin
  Result := '';
  if (cbxEfetivos.Checked) then
    Result := QuotedStr('E');

  if (cbxEspeciais.Checked) then
    if (length(Result) > 0) then
      Result := Result +','+ QuotedStr('S')
    else
      Result := QuotedStr('S');

  if (cbxTemporarios.Checked) then
    if (length(Result) > 0) then
      Result := Result +','+ QuotedStr('T')
    else
      Result := QuotedStr('T');

  if (cbxTerceiros.Checked) then
    if (length(Result) > 0) then
      Result := Result +','+ QuotedStr('3')
    else
      Result := QuotedStr('3');

  if (cbxPropDirSemVinc.Checked) then
    if (length(Result) > 0) then
      Result := Result +','+ QuotedStr('P')
    else
      Result := QuotedStr('P');

  if (cbxAutonomos.Checked) then
    if (length(Result) > 0) then
      Result := Result +','+ QuotedStr('A')
    else
      Result := QuotedStr('A');

  if (cbxEstagiarios.Checked) then
    if (length(Result) > 0) then
      Result := Result +','+ QuotedStr('G')
    else
      Result := QuotedStr('G');
end;

function TfrmParamFolhaFreqEscala.SelSitFunc: string;
begin
  Result := '';
  if (cbxAtivos.Checked) then
    Result := QuotedStr('A');

  if (cbxAfastados.Checked) then
    if (length(Result) > 0) then
      Result := Result +','+ QuotedStr('F')
    else
      Result := QuotedStr('F');

  if (cbxDemitidos.Checked) then
    if (length(Result) > 0) then
      Result := Result +','+ QuotedStr('D')
    else
      Result := QuotedStr('D');
end;

end.
