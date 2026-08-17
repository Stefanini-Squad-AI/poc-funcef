// *****************************************************************************
// ***************************** REGISTRO DE ALTERAÇÕES ************************
// *****************************************************************************
// Autor(a)    :  Ádler Teodoro de Souza
// Data        :  19/02/2009
// Pendência   : SOL 109421 KINTANA 496332
// Descricao   :  Alteração de gravação de arquivos de log na raiz do disco C: .
//------------------------------------------------------------------------------
unit fParamFolhaNormal;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs, IvDictio,
  IvMulti, IvEMulti, MAHlpBtn, StdCtrls, Buttons, TB97Tlbr, TB97, ExtCtrls, checklst,
  Spin, wwdblook, Db, DBTables, Wwquery, ComCtrls, fSairAjuda;

type
  TfrmFolhaNormal = class(TfrmSairAjuda)
    gbxMesAnoRef: TGroupBox;
    cmbMes: TComboBox;
    speAno: TSpinEdit;
    gbxEstab: TGroupBox;
    dblkcbEstab: TwwDBLookupCombo;
    gbxOrdem: TGroupBox;
    cmbOrderBy: TComboBox;
    qryEstab: TwwQuery;
    rgProcesso: TRadioGroup;
    gbxTipoPapel: TGroupBox;
    cmbTipoPapel: TComboBox;
    gbxFunc: TGroupBox;
    Paginas2: TPageControl;
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
    bbtnConfirmar: TBitBtn;
    ToolbarSep971: TToolbarSep97;
    Paginas1: TPageControl;
    tbshTipoFolha: TTabSheet;
    chklstTipoFolha: TCheckListBox;
    tbshCCusto: TTabSheet;
    chklstCCusto: TCheckListBox;
    spbtSelTodosTipFol: TBitBtn;
    spbtInvSelecaoTipFol: TBitBtn;
    rgAgruparPorCCusto: TRadioGroup;
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure FormCreate(Sender: TObject);
    procedure bbtnConfirmarClick(Sender: TObject);
    procedure dblkcbEstabChange(Sender: TObject);
    procedure chklstFuncDrawItem(Control: TWinControl; Index: Integer; Rect: TRect;
      State: TOwnerDrawState);
    procedure gbxSituacaoEnter(Sender: TObject);
    procedure gbxSituacaoExit(Sender: TObject);
    procedure gbxTipContraEnter(Sender: TObject);
    procedure gbxTipContraExit(Sender: TObject);
    procedure chklstTipoFolhaClickCheck(Sender: TObject);
    procedure bbtnSelTodosFuncClick(Sender: TObject);
    procedure bbtnInverteSelFuncClick(Sender: TObject);
    procedure spbtInvSelecaoTipFolClick(Sender: TObject);
    procedure spbtSelTodosTipFolClick(Sender: TObject);
    procedure speAnoChange(Sender: TObject);
    procedure chklstTipoFolhaKeyDown(Sender: TObject; var Key: Word; Shift: TShiftState);
    procedure chklstCCustoClickCheck(Sender: TObject);
    procedure chklstCCustoKeyDown(Sender: TObject; var Key: Word; Shift: TShiftState);
    procedure cmbOrderByChange(Sender: TObject);
  private
    iFlgNivelIndiv: integer;
    procedure HabilitaBtOk;
    procedure MontaListaFuncionarios;
    function  SelecionaTipoContrato: string;
    function  SelecionaSitFunc: string;
  end;

var
  frmFolhaNormal: TfrmFolhaNormal;

implementation

uses uSistema, uMensErro, uDataBase, fAguarde, dBaseDados,
  uFuncoesUteis, UsoGeralRH, uComumRelats, dRelatorios;

{$R *.DFM}

procedure TfrmFolhaNormal.FormCreate(Sender: TObject);
var
  iPos: integer;
begin
  inherited;
  if not(Assigned(ListaCodTipoFolha)) then
    ListaCodTipoFolha := TStringList.Create;
  if not(Assigned(ListaCodCCusto)) then
    ListaCodCCusto := TStringList.Create;
  if not(Assigned(ListaCodFunc)) then
    ListaCodFunc := TStringList.Create;
  IDEstab := -1;
  
  cmbTipoPapel.Items.Assign (dtmRelatorios.rpFolhaNormal.PrinterSetup.PaperNames);

  iPos := ProcuraStList (cmbTipoPapel.Items,'A4');
  if (iPos = -1) then
    cmbTipoPapel. ItemIndex := 0
  else
    cmbTipoPapel. ItemIndex := iPos;

  FazQuery(dtmBaseDados.qry,'SELECT NORMALINI, FLGNIVELINDIV FROM PARAMRH');
  iFlgNivelIndiv   := dtmBaseDados.qry.FieldByName('FLGNIVELINDIV').asInteger;
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

  // Monto a Lista de Tipos de Folha
  chklstTipoFolha.Items.Clear;
  ListaCodTipoFolha.Clear;
  with (dtmBaseDados.qry) do
  begin
    Close;
    SQL.Clear;
    SQL.Add('SELECT');
    SQL.Add('  IDMOTIVO, DESCRICAO');
    SQL.Add('FROM');
    SQL.Add('  MOTIVO');
    SQL.Add('WHERE');
    SQL.Add('  (GRUPOMOTIVO IN (''F'',''D''))');
    SQL.Add('ORDER BY');
    SQL.Add('  DESCRICAO');
    Open;
    while not(EOF) do
    begin
      ListaCodTipoFolha.Add(FieldByName('IDMOTIVO').asString);
      chklstTipoFolha.Items.Add(FieldByName('DESCRICAO').asString);
      Next;
    end;
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
  Paginas1.ActivePageIndex := 0;
  Paginas2.ActivePageIndex := 0;

  HabilitaBtOk;
end;

procedure TfrmFolhaNormal.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  dtmBaseDados.qry.Close;
  qryEstab.Close;
  inherited;
end;

procedure TfrmFolhaNormal.chklstFuncDrawItem(Control: TWinControl; Index: Integer;
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

procedure TfrmFolhaNormal.dblkcbEstabChange(Sender: TObject);
begin
  if (qryEstab.FieldByName('IDPESSOA').asInteger <> IDEstab) then
  begin
    MontaListaFuncionarios;
    IDEstab := qryEstab.FieldByName('IDPESSOA').asInteger;

    if (Paginas2.ActivePageIndex = 0) then
      chklstFunc.Repaint;
  end;
end;

procedure TfrmFolhaNormal.speAnoChange(Sender: TObject);
begin
  HabilitaBtOk;
end;

procedure TfrmFolhaNormal.cmbOrderByChange(Sender: TObject);
begin
  rgAgruparPorCCusto.Enabled := (cmbOrderBy.ItemIndex in [2,3]);
  if not(rgAgruparPorCCusto.Enabled) then
    rgAgruparPorCCusto.ItemIndex := 1;
end;

procedure TfrmFolhaNormal.gbxTipContraEnter(Sender: TObject);
begin
  bTipContrEfet  := cbxEfetivos.Checked;
  bTipContrEspec := cbxEspeciais.Checked;
  bTipContrTemp  := cbxTemporarios.Checked;
  bTipContrEst   := cbxEstagiarios.Checked;
  bTipContrTerc  := cbxTerceiros.Checked;
  bTipContrProp  := cbxPropDirSemVinc.Checked;
  bTipContrAut   := cbxAutonomos.Checked;
end;

procedure TfrmFolhaNormal.gbxTipContraExit(Sender: TObject);
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

procedure TfrmFolhaNormal.gbxSituacaoEnter(Sender: TObject);
begin
  bSitAtivo := (cbxAtivos.Checked);
  bSitAfast := (cbxAfastados.Checked);
  bSitDemit := (cbxDemitidos.Checked);
end;

procedure TfrmFolhaNormal.gbxSituacaoExit(Sender: TObject);
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

procedure TfrmFolhaNormal.chklstTipoFolhaKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  if (Key = VK_TAB) then
    InvalidateItemListBox(TCustomListBox(Sender),TCustomListBox(Sender).ItemIndex);
end;

procedure TfrmFolhaNormal.chklstCCustoKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  if (Key = VK_TAB) then
    chklstCCustoClickCheck(Sender);
end;

procedure TfrmFolhaNormal.chklstTipoFolhaClickCheck(Sender: TObject);
begin
  InvalidateItemListBox(TCustomListBox(Sender),TCustomListBox(Sender).ItemIndex);
  HabilitaBtOk;
end;

procedure TfrmFolhaNormal.chklstCCustoClickCheck(Sender: TObject);
begin
  InvalidateItemListBox(TCustomListBox(Sender),TCustomListBox(Sender).ItemIndex);
  MontaListaFuncionarios;
end;

procedure TfrmFolhaNormal.spbtSelTodosTipFolClick(Sender: TObject);
var
  c: integer;
begin
  case (Paginas1.ActivePageIndex) of
    0 : chkListAux := chklstTipoFolha;
    1 : chkListAux := chklstCCusto;
  end;

  for c:=0 to chkListAux.Items.Count-1 do
    chkListAux.Checked[c] := true;
  chkListAux.Repaint;

  if (Paginas1.ActivePageIndex = 1) then
    MontaListaFuncionarios;
  HabilitaBtOk;
end;

procedure TfrmFolhaNormal.spbtInvSelecaoTipFolClick(Sender: TObject);
var
  c: integer;
begin
  case (Paginas1.ActivePageIndex) of
    0 : chkListAux := chklstTipoFolha;
    1 : chkListAux := chklstCCusto;
  end;

  for c:=0 to chkListAux.Items.Count-1 do
    chkListAux.Checked[c] := not(chkListAux.Checked[c]);
  chkListAux.Repaint;

  if (Paginas1.ActivePageIndex = 1) then
    MontaListaFuncionarios;
  HabilitaBtOk;
end;

procedure TfrmFolhaNormal.bbtnSelTodosFuncClick(Sender: TObject);
var
  c: integer;
begin
  for c:=0 to chklstFunc.Items.Count-1 do
    chklstFunc.Checked[c] := true;
  chklstFunc.Repaint;
  HabilitaBtOk;
end;

procedure TfrmFolhaNormal.bbtnInverteSelFuncClick(Sender: TObject);
var
  c: integer;
begin
  for c:=0 to chklstFunc.Items.Count-1 do
    chklstFunc.Checked[c] := not(chklstFunc.Checked[c]);
  chklstFunc.Repaint;
  HabilitaBtOk;
end;

procedure TfrmFolhaNormal.bbtnConfirmarClick(Sender: TObject);
var
  wNum: word;
  NomeTabela: string;
  DocID: array[1..2] of integer;
begin
  if (rgProcesso.ItemIndex = 0) then
    NomeTabela := 'PREVIAFOLPAG'
  else
    NomeTabela := 'HISTRUBSAL';

  // Tipos de Folha selecionados
  wNum := CriaListaOpcoes (chklstTipoFolha, ListaCodTipoFolha, sCodTipoFolhaSel, ',', false);
  if (wNum = ListaCodTipoFolha.Count) then
    sCodTipoFolhaSel := '';

  // C. de Custo selecionados
  wNum := CriaListaOpcoes (chklstCCusto, ListaCodCCusto, sCodCCustoSel, ',', true);
  if (wNum = ListaCodCCusto.Count) then
    sCodCCustoSel := '';

  // Funcionários selecionados
  wNum := CriaListaOpcoes (chklstFunc, ListaCodFunc, sCodFuncSel, ',', false);
  if (wNum = ListaCodFunc.Count) then
    sCodFuncSel := '';

  // IDs dos Documentos
  with (dtmBaseDados.qry) do
  begin
    Close;
    SQL.Clear;
    SQL.Add('SELECT TDO.IDDOCUMENTO, TDO.SIGLADOCUMENTO');
    SQL.Add('FROM   TIPODOCPESSOA TDP, TIPODOCOFICIAL TDO');
    SQL.Add('WHERE ((TDO.SIGLADOCUMENTO = ''ESTADUAL:'')    OR');
    SQL.Add('       (TDO.SIGLADOCUMENTO = ''MUNICIPAL:'')) AND');
    SQL.Add('      (TDO.IDDOCUMENTO     = TDP.IDDOCUMENTO)');
    Open;
    while not(EOF) do
    begin
      if (FieldByName('SIGLADOCUMENTO').asString = 'ESTADUAL:') then
        DocID[1] := FieldByName('IDDOCUMENTO').asInteger
      else
      if (FieldByName('SIGLADOCUMENTO').asString = 'MUNICIPAL:') then
        DocID[2] := FieldByName('IDDOCUMENTO').asInteger;
      Next;
    end;
  end;

  dtmRelatorios.qryFolhaNormal.Close;
  with (dtmRelatorios.qryFolhaNormal.SQL) do
  begin
    Clear;
    Add('SELECT DISTINCT');
    Add('  H.SEQRUBRICA,');
    Add('  PJ.RAZAOSOCIAL AS EMPRESA,');
    Add('  F.MATRICULA,');
    Add('  F.IDFAIXACARGO AS NIVEL,');
    Add('  F.CODCENTROCUSTO AS CENTROCUSTO,');
    Add('  CC.NOME AS NOMECENTROCUSTO,');
    Add('  H.MES,');
    Add('  PF.NOME AS EMPREGADO,');
    Add('  C.TITULO,');
    Add('  TO_NUMBER(NVL(PEFIS.NUMDEPIRRF,0)) AS NUMDEPIRRF,');
    Add('  TO_NUMBER(NVL(PEFIS.NUMDEPSALF,0)) AS NUMDEPSALF,');
    Add('  F.TIPOPAGAMENTO,');
    Add('  ES.CODESTADO AS UF,');
    Add('  MO.DESCRICAO,');
    Add('  ''CNPJ: '' || PJ.NUMDOCUMENTO AS CGC,');
    Add('  RTRIM(DECODE(RTRIM(ESTADUAL.NUM),NULL,');
    Add('    DECODE(RTRIM(MUNICIPAL.NUM),NULL,NULL,');
    Add('    ''Inscrição Municipal: ''|| MUNICIPAL.NUM),');
    Add('    ''Inscrição Estadual: ''|| ESTADUAL.NUM)) AS ESTADUALMUNICIPAL,');
    Add('  RTRIM(E.LOGRADOURO) ||'', ''|| E.NUMERO ||');
    Add('    DECODE(RTRIM(E.COMPLEMENTO),NULL,NULL,'' - ''|| RTRIM(E.COMPLEMENTO)) ||'' - ''|| ');
    Add('    DECODE(RTRIM(E.BAIRRO),NULL,NULL,RTRIM(E.BAIRRO)) ||'' - ''||');
    Add('    RTRIM(CIDADES.NOME) ||'' - CEP:''||');
    Add('    RTRIM(SUBSTR(E.CEP,1,5)) ||''-''|| RTRIM(SUBSTR(E.CEP,6,3)) AS ENDERECO,');
    Add('  P.CODRUBCLT AS CODRUBCLT,');
    Add('  RP.CODPROVDESC AS CODRUBRICA,');
    Add('  RP.DESCRPROVDESC AS RUBRICA,');
    Add('  RTRIM(DECODE(RTRIM(H.REFERENCIA),''***'','''',''Ferias'','''',''Férias'','''',');
    Add('    ''13.o Salar'','''',H.REFERENCIA)) AS REFERENCIA,');
    Add('  DECODE(P.FLGDESCONTO,0,H.VALORPROVENTO) AS PROVENTO,');
    Add('  DECODE(P.FLGDESCONTO,1,H.VALORPROVENTO) AS DESCONTO,');
    Add('  DECODE(P.FLGDESCONTO,2,H.VALORPROVENTO) AS OUTROS,');
    Add('  P.FLGDESCONTO AS TIPORUBRICA');
    Add('FROM');
    Add('  '+NomeTabela+' H, PESSOA PJ, PESSOA PF, PESSOAFISICA PEFIS, ENDPESS E,');
    Add('  PROVDESC P, RUBRICAXPESS RP, FUNCIONARIO F, ESTADO ES, CIDADES,');
    Add('  CARGO C, MOTIVO MO, CENTCUST CC,' +IFF(sCodFuncSel <> '','','SITFUNC ST,'));
    // ------------------------------------------------------------------------------- //
    // Inscrição Estadual do(s) Estabelecimento(s)
    Add('  (SELECT IDPESSOA, NUMDOCUMENTO AS NUM');
    Add('   FROM   DOCPESSOA');
    Add('   WHERE (IDPESSOA    = ' +qryEstab.FieldByName('IDPESSOA').asString+ ') AND');
    Add('         (IDDOCUMENTO = ' +IntToStr(DocID[1])+ ')) ESTADUAL,');
    // -------------------------------------------------------------------------- //
    // Inscrição Municipal do(s) Estabelecimento(s)
    Add('  (SELECT IDPESSOA, NUMDOCUMENTO AS NUM');
    Add('   FROM   DOCPESSOA');
    Add('   WHERE (IDPESSOA    = ' +qryEstab.FieldByName('IDPESSOA').asString+ ') AND');
    Add('         (IDDOCUMENTO = ' +IntToStr(DocID[2])+ ')) MUNICIPAL');
    // ------------------------------------------------------------------------------- //
    Add('WHERE');
    if (sCodTipoFolhaSel <> '') then
      if (Pos(',',sCodTipoFolhaSel) > 0) then
        Add('  (MO.IDMOTIVO      IN (' +sCodTipoFolhaSel+ ')) AND')
      else
        Add('  (MO.IDMOTIVO       = ' +sCodTipoFolhaSel+ ') AND');

    Add('  (PJ.IDPESSOA       = ' +qryEstab.FieldByName('IDPESSOA').asString+ ') AND');
    Add('  (F.IDESTAB         = ' +qryEstab.FieldByName('IDPESSOA').asString+ ') AND');
    Add('  (F.IDEMPRESA       = ' +IntToStr(Sistema.IDEmpresa)+ ') AND');
    Add('  (RP.IDPESSOA       = ' +IntToStr(Sistema.IDEmpresa)+ ') AND');
    Add('  (H.MES             = ' +QuotedStr(IntToStr(speAno.Value) +'/'+
      PoeZero(cmbMes.ItemIndex+1))+ ') AND');
    Add('  (H.IDPESSJUR       = ' +IntToStr(Sistema.IDEmpresa)+ ') AND');

    if (sCodFuncSel <> '') then
    begin
      if (Pos(',',sCodFuncSel) > 0) then
        Add('  (PF.IDPESSOA       IN (' +sCodFuncSel+ ')) AND')
      else
        Add('  (PF.IDPESSOA        = ' +sCodFuncSel+ ') AND');
    end
    else
    begin
      // C. de Custo selecionados
      if (sCodCCustoSel <> '') then
        Add('  (F.CODCENTROCUSTO IN (' +sCodCCustoSel+ ')) AND')
      else
      begin
        // C. de Custo(s) habilitados para o usuário
        if (sUsuXccusto <> '') then
          if (Pos(',',sUsuXccusto) > 0) then
            Add('  (F.CODCENTROCUSTO IN ' +sUsuXccusto+ ') AND')
          else
            Add('  (F.CODCENTROCUSTO = ' +sUsuXccusto+ ') AND');
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

      Add('  (ST.IDSITFUNC      = F.IDSITFUNC) AND');
    end;

    Add('  (P.FLGCONSTAFOLHA  = 1) AND');
    Add('  (PF.IDPESSOA       = F.IDPESSOA) AND');
    Add('  (PF.IDPESSOA       = PEFIS.IDPESSOA) AND');
    Add('  (PJ.IDPESSOA       = F.IDESTAB) AND');
    Add('  (F.IDCARGO         = C.IDCARGO) AND');
    Add('  (PF.IDPESSOA       = H.IDPESSOA) AND');
    Add('  (MO.IDMOTIVO       = H.IDMOTIVO) AND');
    Add('  (H.IDRUBRICA       = RP.IDRUBRICA) AND');
    Add('  (H.IDRUBRICA       = P.IDPROVENTO) AND');
    Add('  (F.IDEMPRESA       = RP.IDPESSOA) AND');
    Add('  (F.IDEMPRESA       = CC.IDEMPRESA) AND');
    Add('  (PJ.IDPESSOA       = E.IDPESSOA) AND');
    Add('  (PJ.IDENDCOMERCIAL = E.IDENDERECO) AND');
    Add('  (E.IDCIDADES       = CIDADES.IDCIDADES) AND');
    Add('  (CIDADES.IDESTADO  = ES.IDESTADO) AND');
    Add('  (F.CODCENTROCUSTO  = CC.CODCENTROCUSTO(+)) AND');
    Add('  (PJ.IDPESSOA       = ESTADUAL.IDPESSOA(+)) AND');
    Add('  (PJ.IDPESSOA       = MUNICIPAL.IDPESSOA(+))');
    Add('ORDER BY');
    case (cmbOrderBy.ItemIndex) of
      0 : Add('  UPPER(EMPREGADO), UPPER(CENTROCUSTO), DESCRICAO, TIPORUBRICA, CODRUBRICA');
      1 : Add('  MATRICULA, UPPER(CENTROCUSTO), DESCRICAO, TIPORUBRICA, CODRUBRICA');
      2 : Add('  UPPER(CENTROCUSTO), UPPER(EMPREGADO), DESCRICAO, TIPORUBRICA, CODRUBRICA');
      3 : Add('  UPPER(CENTROCUSTO), MATRICULA, DESCRICAO, TIPORUBRICA, CODRUBRICA');
    end;
    //SaveToFile ('c:\qry.txt');
    SaveToFile (Sistema.RetornaCaminhoArquivos(Sistema.IdEmpresa)+'\qry.txt');//Ádler Teodoro de Souza SOL 109421 KINTANA 496332
  end;

  with (dtmRelatorios) do
  begin
    rpFolhaNormal.PrinterSetup.PaperName := cmbTipoPapel.Items[cmbTipoPapel.ItemIndex];
    rpFolhaNormalLabelNivel.Visible      := (iFlgNivelIndiv = 1);
    rpFolhaNormalDBTextNivel.Visible     := (iFlgNivelIndiv = 1);
  end;

  frmAguarde.Mostra('Folha de Pagamento Normal');
  frmAguarde.Pos := 0;
  dtmRelatorios.qryFolhaNormal.Open;

  if (dtmRelatorios.qryFolhaNormal.IsEmpty) then
  begin
    ModalResult := mrNone;
    frmAguarde.Apaga;
    MsgDlg('Não há dados a serem exibidos! Verifique.','Aviso',mtInformation,[mbOk,mbHelp],0);
  end
  else
  begin
    if (rgAgruparPorCCusto.ItemIndex = 0) then
      dtmRelatorios.rpFolhaNormalGrpCENTROCUSTO.BreakName := 'CENTROCUSTO'
    else
      dtmRelatorios.rpFolhaNormalGrpCENTROCUSTO.BreakName := '';
  end;
end;

// -------------------------------------------------------------------------------------
// Funções do Form
// -------------------------------------------------------------------------------------
procedure TfrmFolhaNormal.MontaListaFuncionarios;
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

procedure TfrmFolhaNormal.HabilitaBtOk;
var
  c: integer;
  bSelTipFol: boolean;
begin
  // Verifica se algum Tipo de Folha foi selecionado
  bSelTipFol := false;
  for c:=0 to chklstTipoFolha.Items.Count-1 do
    if (chklstTipoFolha.Checked[c]) then
    begin
      bSelTipFol := true;
      break;
    end;

  bbtnConfirmar.Enabled := (dblkcbEstab.Text <> '') and (Trim(speAno.Text) <> '') and
    (bSelTipFol);
end;

function TfrmFolhaNormal.SelecionaTipoContrato: string;
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

function TfrmFolhaNormal.SelecionaSitFunc: string;
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
