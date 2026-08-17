// *****************************************************************************
// ***************************** REGISTRO DE ALTERAÇÕES ************************
// *****************************************************************************
// Autor(a)    :  Ádler Teodoro de Souza
// Data        :  19/02/2009
// Pendência   : SOL 109421 KINTANA 496332
// Descricao   :  Alteração de gravação de arquivos de log na raiz do disco C: .
//------------------------------------------------------------------------------
unit fParamFichaSalFam;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs, IvDictio, IvMulti,
  IvEMulti, MAHlpBtn, StdCtrls, Buttons, TB97Tlbr, TB97, ExtCtrls, Db, Spin, DBTables, Wwquery,
  wwdblook, checklst, TREdit, ComCtrls, IniFiles, fSairAjuda;

type
  TfrmParamFichaSalFam = class(TfrmSairAjuda)
    qryEstab: TwwQuery;
    gbxEstab: TGroupBox;
    dblkcbEstab: TwwDBLookupCombo;
    gbxFunc: TGroupBox;
    pgctrlEmpregados: TPageControl;
    tbshListaFunc: TTabSheet;
    chklstFunc: TCheckListBox;
    bbtnSelTodos: TBitBtn;
    bbtnInverteSel: TBitBtn;
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
    gbxTipoPapel: TGroupBox;
    cmbTipoPapel: TComboBox;
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
    procedure bbtnSelTodosClick(Sender: TObject);
    procedure bbtnInverteSelClick(Sender: TObject);
    procedure chklstFuncKeyDown(Sender: TObject; var Key: Word; Shift: TShiftState);
  private
    procedure LeAlteracoes;
    procedure GravaAlteracoes;
    procedure HabilitaBtOk;
    procedure MontaListaFuncionarios;
    function  SelTipoContrato: string;
    function  SelSitFunc: string;
  end;

var
  frmParamFichaSalFam: TfrmParamFichaSalFam;

implementation

uses uSistema, uMensErro, uDataBase, fAguarde, dBaseDados, uFuncoesUteis, UsoGeralRH,
  uComumRelats, RFichaSalFam;

{$R *.DFM}

procedure TfrmParamFichaSalFam.FormCreate(Sender: TObject);
var
  iPos: integer;
begin
  inherited;
  if not(Assigned(ListaCodFunc)) then
    ListaCodFunc := TStringList.Create;
  IdEstab := -1;

  cmbTipoPapel.Items.Assign(RptFichaSalFam.rpFichaSalFam.PrinterSetup.PaperNames);

  iPos := ProcuraStList(cmbTipoPapel.Items, 'A4');
  if (iPos = -1) then
    cmbTipoPapel.ItemIndex := 0
  else
    cmbTipoPapel.ItemIndex := iPos;

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

  pgctrlEmpregados.ActivePageIndex := 0;

  // Carrega alterações nas opções feitas anteriormente
  LeAlteracoes;

  HabilitaBtOk;
end;

procedure TfrmParamFichaSalFam.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  GravaAlteracoes;

  qryEstab.Close;
  inherited;
end;

procedure TfrmParamFichaSalFam.chklstFuncDrawItem(Control: TWinControl; Index: Integer;
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

procedure TfrmParamFichaSalFam.dblkcbEstabChange(Sender: TObject);
begin
  if (qryEstab.FieldByName('IDPESSOA').asInteger <> IdEstab) then
  begin
    MontaListaFuncionarios;
    IdEstab := qryEstab.FieldByName('IDPESSOA').asInteger;

    if (pgctrlEmpregados.ActivePageIndex = 0) then
      chklstFunc.Repaint;
  end;
end;

procedure TfrmParamFichaSalFam.gbxTipContraEnter(Sender: TObject);
begin
  bTipContrEfet := cbxEfetivos.Checked;
  bTipContrEspec := cbxEspeciais.Checked;
  bTipContrTemp := cbxTemporarios.Checked;
  bTipContrEst := cbxEstagiarios.Checked;
  bTipContrTerc := cbxTerceiros.Checked;
  bTipContrProp := cbxPropDirSemVinc.Checked;
  bTipContrAut := cbxAutonomos.Checked;
end;

procedure TfrmParamFichaSalFam.gbxTipContraExit(Sender: TObject);
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

procedure TfrmParamFichaSalFam.gbxSituacaoEnter(Sender: TObject);
begin
  bSitAtivo := (cbxAtivos.Checked);
  bSitAfast := (cbxAfastados.Checked);
  bSitDemit := (cbxDemitidos.Checked);
end;

procedure TfrmParamFichaSalFam.gbxSituacaoExit(Sender: TObject);
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

procedure TfrmParamFichaSalFam.chklstFuncKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  if (Key = VK_TAB) then
    InvalidateItemListBox(TCustomListBox(Sender), TCustomListBox(Sender).ItemIndex);
end;

procedure TfrmParamFichaSalFam.chklstFuncClickCheck(Sender: TObject);
begin
  InvalidateItemListBox(TCustomListBox(Sender), TCustomListBox(Sender).ItemIndex);
  HabilitaBtOk;
end;

procedure TfrmParamFichaSalFam.bbtnSelTodosClick(Sender: TObject);
var
  c: integer;
begin
  for c:=0 to chklstFunc.Items.Count-1 do
    chklstFunc.Checked[c] := true;
  chklstFunc.Repaint;
  HabilitaBtOk;
end;

procedure TfrmParamFichaSalFam.bbtnInverteSelClick(Sender: TObject);
var
  c: integer;
begin
  for c:=0 to chklstFunc.Items.Count-1 do
    chklstFunc.Checked[c] := not(chklstFunc.Checked[c]);
  chklstFunc.Repaint;
  HabilitaBtOk;
end;

procedure TfrmParamFichaSalFam.bbtnConfirmarClick(Sender: TObject);
var
  wNum: word;
begin
  // Funcionários escolhidos
  wNum := CriaListaOpcoes(chklstFunc, ListaCodFunc, sCodFuncSel, ',', false);
  if (wNum = ListaCodFunc.Count) then
    sCodFuncSel := '';

  // Monta Query Auxiliar
  RptFichaSalFam.qryFichaSalFam.Close;
  with (RptFichaSalFam.qryFichaSalFam.SQL) do
  begin
    Clear;
    Add('SELECT');
    Add('  RTRIM(PJ.RAZAOSOCIAL) AS EMPRESA,');
    Add('  (''CNPJ: '' || PJ.NUMDOCUMENTO) AS CNPJ,');    
    Add('  DECODE(PJ.NUMDOCUMENTO,NULL,'''',''CNPJ: '' || PJ.NUMDOCUMENTO) AS CGC,');
    Add('  RTRIM(E.LOGRADOURO) ||'', ''|| E.NUMERO ||');
    Add('    DECODE(RTRIM(E.COMPLEMENTO),NULL,'''','' - '' || RTRIM(E.COMPLEMENTO)) ||');
    Add('    DECODE(RTRIM(E.BAIRRO),     NULL,'''','' - '' || RTRIM(E.BAIRRO)) ||');
    Add('    DECODE(RTRIM(CI.NOME), NULL,'''','' - '' || RTRIM(CI.NOME)) ||');
    Add('    '' - CEP:'' || RTRIM(SUBSTR(E.CEP,1,5)) ||''-''|| RTRIM(SUBSTR(E.CEP,6,3)) AS ENDERECO,');
    Add('  RTRIM(PF.NOME) AS EMPREGADO,');
    Add('  F.DATAADMISSAO,');
    Add('  F.DATADESLIGAMENTO,');
    Add('  RTRIM(CTPS.NUM) AS CTPS_NUM,');
    Add('  DECODE(CTPS.UF,NULL,NULL,CTPS.UF) AS CTPS_UF,');
    Add('  CTPS.MASCARA AS MASCARA_CTPS,');
    Add('  PFD.NOME AS DEPENDENTE,');
    Add('  PEFISD.DATANASC,');
    Add('  CID.NOME AS LOCAL_NASC,');
    Add('  NOM_CART.NUM AS CARTORIO,');
    Add('  NUM_REGISTRO.NUM AS NUM_REGISTRO,');
    Add('  NUM_LIVRO.NUM AS NUM_LIVRO,');
    Add('  NUM_FOLHA.NUM AS NUM_FOLHA,');
    Add('  NUM_REGISTRO.DATAEMISSAO AS DATAENTREGA');
    Add('FROM');
    Add('  PESSOA PJ, PESSOA PF, PESSOA PFD, PESSOAFISICA PEFISD, FUNCIONARIO F, DEPENTIT D,');
    Add('  ENDPESS E, SITFUNC ST, ESTADO ES, CIDADES CI, CIDADES CID,');
    // -------------------------------------------------------------------------------- //
    Add('  (SELECT DP.IDPESSOA, TDP.MASCARA, DP.NUMDOCUMENTO AS NUM, ES.CODESTADO AS UF');
    Add('   FROM   DOCPESSOA DP, ESTADO ES, TIPODOCPESSOA TDP, TIPODOCOFICIAL TDO, PAIS PA');
    Add('   WHERE (TDO.SIGLADOCUMENTO = ''CTPS:'') AND');
    Add('         (TDO.IDDOCUMENTO    = TDP.IDDOCUMENTO) AND');
    Add('         (TDO.IDDOCUMENTO    = DP.IDDOCUMENTO) AND');
    Add('         (DP.IDPAIS          = PA.IDPAIS) AND');
    Add('         (PA.IDPAIS          = ES.IDPAIS) AND');
    Add('         (DP.IDESTADO        = ES.IDESTADO)) CTPS,');
    // -------------------------------------------------------------------------------- //
    Add('  (SELECT DP.IDPESSOA, DP.NUMDOCUMENTO AS NUM');
    Add('   FROM   DOCPESSOA DP, TIPODOCOFICIAL TDO');
    Add('   WHERE (TDO.SIGLADOCUMENTO = ''NOM_CART:'') AND');
    Add('         (TDO.IDDOCUMENTO    = DP.IDDOCUMENTO)) NOM_CART,');
    // -------------------------------------------------------------------------------- //
    Add('  (SELECT DP.IDPESSOA, DP.NUMDOCUMENTO AS NUM, DP.DATAEMISSAO');
    Add('   FROM   DOCPESSOA DP, TIPODOCOFICIAL TDO');
    Add('   WHERE (TDO.SIGLADOCUMENTO = ''NUM_REGISTRO:'') AND');
    Add('         (TDO.IDDOCUMENTO    = DP.IDDOCUMENTO)) NUM_REGISTRO,');
    // -------------------------------------------------------------------------------- //
    Add('  (SELECT DP.IDPESSOA, DP.NUMDOCUMENTO AS NUM');
    Add('   FROM   DOCPESSOA DP, TIPODOCOFICIAL TDO');
    Add('   WHERE (TDO.SIGLADOCUMENTO = ''NUM_LIVRO:'') AND');
    Add('         (TDO.IDDOCUMENTO    = DP.IDDOCUMENTO)) NUM_LIVRO,');
    // -------------------------------------------------------------------------------- //
    Add('  (SELECT DP.IDPESSOA, DP.NUMDOCUMENTO AS NUM');
    Add('   FROM   DOCPESSOA DP, TIPODOCOFICIAL TDO');
    Add('   WHERE (TDO.SIGLADOCUMENTO = ''NUM_FOLHA:'') AND');
    Add('         (TDO.IDDOCUMENTO    = DP.IDDOCUMENTO)) NUM_FOLHA');
    // -------------------------------------------------------------------------------- //
    Add('WHERE');
    Add('  (PJ.IDPESSOA       = '+qryEstab.FieldByName('IDPESSOA').asString+') AND');

    // Funcionário selecionado
    if (sCodFuncSel <> '') then
    begin
      if (Pos(',',sCodFuncSel) > 0) then
        Add('  (F.IDPESSOA       IN (' +sCodFuncSel+ ')) AND')
      else
        Add('  (F.IDPESSOA        = ' +sCodFuncSel+ ') AND');

      Add('  (F.IDSITFUNC       = ST.IDSITFUNC) AND');
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
          Add('  (ST.TIPOSIT       IN (' +sAux+ ')) AND')
        else
          Add('  (ST.TIPOSIT        = ' +sAux+ ') AND');

      sAux := SelTipoContrato;
      if (Pos(',',sAux) > 0) then
        Add('  (F.TIPOCONTRATO   IN (' +sAux+ ')) AND')
      else
        Add('  (F.TIPOCONTRATO    = ' +sAux+ ') AND');

      Add('  (ST.IDSITFUNC      = F.IDSITFUNC) AND');
    end;

    Add('  (PJ.IDPESSOA       = F.IDESTAB) AND');
    Add('  (F.IDPESSOA        = PF.IDPESSOA) AND');
    Add('  (D.IDDEPENDENCIA   = ''FIL'') AND');
    Add('  (TRUNC((SYSDATE - 1 - PEFISD.DATANASC)/365.25) < 14) AND');
    Add('  (F.IDPESSOA        = D.IDTITULAR) AND');
    Add('  (D.IDPESSOA        = PFD.IDPESSOA) AND');
    Add('  (D.IDPESSOA        = PEFISD.IDPESSOA) AND');
    Add('  (PEFISD.IDCIDADES  = CID.IDCIDADES(+)) AND');
    Add('  (F.IDPESSOA        = CTPS.IDPESSOA(+)) AND');
    Add('  (D.IDPESSOA        = NOM_CART.IDPESSOA(+)) AND');
    Add('  (D.IDPESSOA        = NUM_REGISTRO.IDPESSOA(+)) AND');
    Add('  (D.IDPESSOA        = NUM_LIVRO.IDPESSOA(+)) AND');
    Add('  (D.IDPESSOA        = NUM_FOLHA.IDPESSOA(+)) AND');
    Add('  (PJ.IDENDCOMERCIAL = E.IDENDERECO(+)) AND');
    Add('  (PJ.IDPESSOA       = E.IDPESSOA(+)) AND');
    Add('  (E.IDCIDADES       = CI.IDCIDADES(+)) AND');
    Add('  (CI.IDESTADO       = ES.IDESTADO(+))');
    Add('ORDER BY');
    Add('  UPPER(EMPREGADO)');
    //SaveToFile('c:\qry.txt');
    SaveToFile(Sistema.RetornaCaminhoArquivos(Sistema.IdEmpresa)+'\qry.txt');//Ádler Teodoro de Souza SOL 109421 KINTANA 496332 
  end;

  frmAguarde.Mostra('Ficha de Salário Família');
  frmAguarde.Pos := 0;

  with (RptFichaSalFam) do
  begin
    qryFichaSalFam.Open;
    if (qryFichaSalFam.IsEmpty) then
    begin
      Self.ModalResult := mrNone;
      frmAguarde.Apaga;
      MsgDlg('Não há dados a serem exibidos.'+CR_LF+'Verifique.', 'Aviso',
        mtInformation, [mbOk,mbHelp], 0);
    end
    else
    begin
      // Especifico Configurações do Relatório
      rpFichaSalFam.PrinterSetup.PaperName := cmbTipoPapel.Items[cmbTipoPapel.ItemIndex];
      if (Trim(qryFichaSalFam.FieldByName('MASCARA_CTPS').asString) <> '') then
        rpFichaSalFamDBTxtCTPS.DisplayFormat := qryFichaSalFam.FieldByName('MASCARA_CTPS').asString+';0;_';
    end;
  end;
end;

procedure TfrmParamFichaSalFam.LeAlteracoes;
var
  sEstab: string;
begin
  // Recupera as últimas alterações das opções
  //ArqConfig := TIniFile.Create('C:\CONFIG_FOLHAPAGTO.INI');
  ArqConfig := TIniFile.Create(Sistema.RetornaCaminhoArquivos(Sistema.IdEmpresa)+'\CONFIG_FOLHAPAGTO.INI');//Ádler Teodoro de Souza SOL 109421 KINTANA 496332
  sEstab := ArqConfig.ReadString('REL_FICHASALFAM', 'Estabelec', '');
  if (sEstab = '') then
  begin
    qryEstab.First;
    sEstab := qryEstab.FieldByName('IDPESSOA').asString;
  end;
  dblkcbEstab.LookUpValue := sEstab;
  dblkcbEstab.UpDate;
end;

procedure TfrmParamFichaSalFam.GravaAlteracoes;
begin
  ArqConfig.WriteString('REL_FICHASALFAM', 'Estabelec', qryEstab.FieldByName('IDPESSOA').asString);
  ArqConfig.Free;
end;

procedure TfrmParamFichaSalFam.MontaListaFuncionarios;
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

      sAux := SelSitFunc;
      if (Pos(',',sAux) > 0) then
        Add('  (ST.TIPOSIT        IN (' +sAux+ ')) AND')
      else
        Add('  (ST.TIPOSIT         = ' +sAux+ ') AND');

      sAux := SelTipoContrato;
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

procedure TfrmParamFichaSalFam.HabilitaBtOk;
var
  c: integer;
  bSelFunc: boolean;
begin
  // Verifica se algum Funcionário foi selecionado
  bSelFunc := false;
  for c:=0 to chklstFunc.Items.Count-1 do
    if (chklstFunc.Checked[c]) then
    begin
      bSelFunc := true;
      break;
    end;

  bbtnConfirmar.Enabled := (bSelFunc) and (dblkcbEstab.Text <> '');
end;

function TfrmParamFichaSalFam.SelTipoContrato: string;
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

function TfrmParamFichaSalFam.SelSitFunc: string;
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
