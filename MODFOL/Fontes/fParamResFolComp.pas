// *****************************************************************************
// ***************************** REGISTRO DE ALTERAÇÕES ************************
// *****************************************************************************
// Autor(a)    :  Ádler Teodoro de Souza
// Data        :  19/02/2009
// Pendência   : SOL 109421 KINTANA 496332
// Descricao   :  Alteração de gravação de arquivos de log na raiz do disco C: .
//------------------------------------------------------------------------------
unit fParamResFolComp;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs, IvDictio,
  IvMulti, IvEMulti, MAHlpBtn, StdCtrls, Buttons, TB97Tlbr, TB97, ExtCtrls, Db, Spin,
  Wwdatsrc, DBTables, Wwquery, wwdblook, checklst, ComCtrls, fSairAjuda, IniFiles;

type
  TfrmParamResFolComp = class(TfrmSairAjuda)
    gbxEstab: TGroupBox;
    dblkcbEstab: TwwDBLookupCombo;
    qryEstab: TwwQuery;
    rgRubApoio: TRadioGroup;
    gbxTipoPapel: TGroupBox;
    cmbTipoPapel: TComboBox;
    gbxAnoMesRefIni: TGroupBox;
    cmbMesRef1: TComboBox;
    speAnoRef1: TSpinEdit;
    gbxAgruparPor: TGroupBox;
    cmbAgruparPor: TComboBox;
    gbxAnoMesRefFin: TGroupBox;
    cmbMesRef2: TComboBox;
    speAnoRef2: TSpinEdit;
    bbtnConfirmar: TBitBtn;
    ToolbarSep971: TToolbarSep97;
    Paginas: TPageControl;
    tbshTipoFolha: TTabSheet;
    chklstTipoFolha: TCheckListBox;
    tbshCCusto: TTabSheet;
    chklstCCusto: TCheckListBox;
    spbtInvSelecao: TBitBtn;
    spbtSelTodos: TBitBtn;
    tbsRubrica: TTabSheet;
    chklstRubrica: TCheckListBox;
    Label1: TLabel;
    edCodRubricas: TEdit;
    sbtnMarcarRub: TBitBtn;
    rgTotalUnico: TRadioGroup;
    procedure FormCreate(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure bbtnConfirmarClick(Sender: TObject);
    procedure spbtInvSelecaoClick(Sender: TObject);
    procedure spbtSelTodosClick(Sender: TObject);
    procedure chklstTipoFolhaDrawItem(Control: TWinControl; Index: Integer; Rect: TRect;
      State: TOwnerDrawState);
    procedure chklstTipoFolhaClickCheck(Sender: TObject);
    procedure dblkcbEstabChange(Sender: TObject);
    procedure chklstTipoFolhaKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure chklstCCustoClickCheck(Sender: TObject);
    procedure chklstCCustoKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure chklstRubricaClickCheck(Sender: TObject);
    procedure sbtnMarcarRubClick(Sender: TObject);
  private
    procedure LeAlteracoes;
    procedure GravaAlteracoes;
    procedure HabilitaBtOk;
  public
    procedure CalcVariacao(rVal1,rVal2:real; var sValResultVal,sValResultPerc:string);
  end;

var
  frmParamResFolComp: TfrmParamResFolComp;

implementation

uses uSistema, uMensErro, uDataBase, fAguarde, dBaseDados, uFuncoesUteis, UsoGeralRH,
  uComumRelats, dRelatoriosResFolComp;

{$R *.DFM}

procedure TfrmParamResFolComp.FormCreate(Sender: TObject);
var
  iPos: integer;
  sDataRef1: string;
begin
  inherited;
  if not(Assigned(ListaCodTipoFolha)) then
    ListaCodTipoFolha := TStringList.Create;
  if not(Assigned(ListaCodRubrica)) then
    ListaCodRubrica := TStringList.Create;
  if not(Assigned(ListaCodCCusto)) then
    ListaCodCCusto := TStringList.Create;

  cmbTipoPapel.Items.Assign(dtmRelatoriosResFolComp.rpResFolComp.PrinterSetup.PaperNames);

  iPos := ProcuraStList(cmbTipoPapel.Items,'A4');
  if (iPos = -1) then
    cmbTipoPapel.ItemIndex := 0
  else
    cmbTipoPapel.ItemIndex := iPos;

  FazQuery(dtmBaseDados.qry, 'SELECT NORMALINI FROM PARAMRH');

  sDataRef1 := IncData(dtmBaseDados.qry.FieldByName('NORMALINI').asString,0,-1,0);
  cmbMesRef1.ItemIndex := StrToInt(Copy(sDataRef1,4,2))-1;
  speAnoRef1.Text := Copy(sDataRef1,7,4);

  cmbMesRef2.ItemIndex := ExtraiMes(dtmBaseDados.qry.FieldByName('NORMALINI').asDateTime)-1;
  speAnoRef2.Text := Copy(dtmBaseDados.qry.FieldByName('NORMALINI').asString,7,4);

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
    SQL.Add('WHERE');    

    // C. de Custo(s) habilitado(s) para o usuário
    if (sUsuXccusto <> '') then
    begin
      if (Pos(',',sUsuXccusto) > 0) then
        SQL.Add('  (CODCENTROCUSTO IN ' +sUsuXccusto+ ') AND')
      else
        SQL.Add('  (CODCENTROCUSTO  = ' +sUsuXccusto+ ') AND');
    end;

    SQL.Add('  (IDEMPRESA = '+IntToStr(Sistema.IdEmpresa)+')');
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

  cmbAgruparPor.ItemIndex := 0;
  Paginas.ActivePageIndex := 0;

  // Carrega alterações nas opções feitas anteriormente
  LeAlteracoes;
end;

procedure TfrmParamResFolComp.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  GravaAlteracoes;

  dtmBaseDados.qry.Close;
  qryEstab.Close;
  inherited;
end;

procedure TfrmParamResFolComp.chklstTipoFolhaDrawItem(Control: TWinControl; Index: Integer;
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

procedure TfrmParamResFolComp.dblkcbEstabChange(Sender: TObject);
begin
  HabilitaBtOk;
end;

procedure TfrmParamResFolComp.chklstTipoFolhaKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  if (Key = VK_TAB) then
    chklstTipoFolhaClickCheck(Sender);
end;

procedure TfrmParamResFolComp.chklstCCustoKeyDown(Sender: TObject; var Key: Word; Shift: TShiftState);
begin
  if (Key = VK_TAB) then
    InvalidateItemListBox(TCustomListBox(Sender), TCustomListBox(Sender).ItemIndex);
end;

procedure TfrmParamResFolComp.chklstTipoFolhaClickCheck(Sender: TObject);
begin
  InvalidateItemListBox(TCustomListBox(Sender), TCustomListBox(Sender).ItemIndex);
  HabilitaBtOk;
end;

procedure TfrmParamResFolComp.chklstCCustoClickCheck(Sender: TObject);
begin
  InvalidateItemListBox(TCustomListBox(Sender), TCustomListBox(Sender).ItemIndex);
end;

procedure TfrmParamResFolComp.chklstRubricaClickCheck(Sender: TObject);
begin
  CriaListaOpcoes(chklstRubrica, ListaCodRubrica, sCodRubricaSel, ',', false);
  edCodRubricas.Text := sCodRubricaSel;
  InvalidateItemListBox(TCustomListBox(Sender), TCustomListBox(Sender).ItemIndex);
end;

procedure TfrmParamResFolComp.spbtSelTodosClick(Sender: TObject);
var
  c: integer;
begin
  case (Paginas.ActivePageIndex) of
    0 : begin
          for c:=0 to chklstTipoFolha.Items.Count-1 do
            chklstTipoFolha.Checked[c] := true;
          HabilitaBtOk;
          chklstTipoFolha.Repaint;
        end;
    1 : begin
          for c:=0 to chklstRubrica.Items.Count-1 do
            chklstRubrica.Checked[c] := true;
          chklstRubrica.Repaint;
          CriaListaOpcoes(chklstRubrica, ListaCodRubrica, sCodRubricaSel, ',', false);
          edCodRubricas.Text := sCodRubricaSel;
        end;
    2 : begin
          for c:=0 to chklstCCusto.Items.Count-1 do
            chklstCCusto.Checked[c] := true;
          chklstCCusto.Repaint;
        end;
  end;
end;

procedure TfrmParamResFolComp.spbtInvSelecaoClick(Sender: TObject);
var
  c: integer;
begin
  case (Paginas.ActivePageIndex) of
    0 : begin
          for c:=0 to chklstTipoFolha.Items.Count-1 do
            chklstTipoFolha.Checked[c] := not(chklstTipoFolha.Checked[c]);
          HabilitaBtOk;
          chklstTipoFolha.Repaint;
        end;
    1 : begin
          for c:=0 to chklstRubrica.Items.Count-1 do
            chklstRubrica.Checked[c] := not(chklstRubrica.Checked[c]);
          chklstRubrica.Repaint;
          CriaListaOpcoes(chklstRubrica, ListaCodRubrica, sCodRubricaSel, ',', false);
          edCodRubricas.Text := sCodRubricaSel;
        end;
    2 : begin
          for c:=0 to chklstCCusto.Items.Count-1 do
            chklstCCusto.Checked[c] := not(chklstCCusto.Checked[c]);
          chklstCCusto.Repaint;
        end;
  end;
end;

procedure TfrmParamResFolComp.sbtnMarcarRubClick(Sender: TObject);
begin
  edCodRubricas.Text := Trim(edCodRubricas.Text);
  VerificaOpcoes(chklstRubrica, ListaCodRubrica, edCodRubricas.Text, ',');
  HabilitaBtOk;
  chklstRubrica.Repaint;
end;

procedure TfrmParamResFolComp.bbtnConfirmarClick(Sender: TObject);
var
  wNum: word;
  I, K: integer;
  PontoDePartida: TBookMark;
  ListaNumFuncCCusto, ListaNomeCCusto: TStringList;
  Periodo: array [1..2] of string;
  sCCusto, sQtdeFunc, sCodRubrica, sTipoFolha, sValResultVal, sValResultPerc: string;
begin
  // Loop para especificar os dados de todos os Tipos de Folha selecionados
  CriaListaOpcoes(chklstTipoFolha, ListaCodTipoFolha, sCodTipoFolhaSel, ',', true);

  // Rubrica(s) selecionada(s)
  wNum := CriaListaOpcoes (chklstRubrica, ListaCodRubrica, sCodRubricaSel, ',', true);
  if (wNum = ListaCodRubrica.Count) then
    sCodRubricaSel := '';

  if (sCodRubricaSel <> '') then
    rgRubApoio.ItemIndex := 0;

  // Verifica se algum C. de Custo foi selecionado
  CriaListaOpcoes(chklstCCusto, ListaCodCCusto, sCodCCustoSel, ',', true);

  // Guarda o Período escolhido
  Periodo[1] := speAnoRef1.Text +'/'+ PoeZero(cmbMesRef1.ItemIndex+1);
  Periodo[2] := speAnoRef2.Text +'/'+ PoeZero(cmbMesRef2.ItemIndex+1);

  dtmBaseDados.qry.Close;
  with (dtmBaseDados.qry.SQL) do
  begin
    Clear;
    Add('SELECT /*+ OPTIMIZER_MODE RULE */ DISTINCT');
    Add('  PJ.RAZAOSOCIAL AS ESTAB,');
    Add('  ''CNPJ: '' || PJ.NUMDOCUMENTO AS CGC,');
    Add('  RTRIM(DECODE(RTRIM(ESTADUAL.NUMDOCUMENTO),'''',');
    Add('    DECODE(RTRIM(MUNICIPAL.NUMDOCUMENTO),'''','''',');
    Add('    ''Inscrição Municipal: ''|| MUNICIPAL.NUMDOCUMENTO),');
    Add('    ''Inscrição Estadual: '' || ESTADUAL.NUMDOCUMENTO)) AS INSCRICAO,');
    Add('  RTRIM(E.LOGRADOURO) ||'', ''|| E.NUMERO ||');
    Add('    DECODE(E.COMPLEMENTO,NULL,NULL,'' - '' || RTRIM(E.COMPLEMENTO)) ||'' - ''||');
    Add('    RTRIM(E.BAIRRO) ||'' - ''|| RTRIM(CIDADES.NOME) ||'' - CEP:''||');
    Add('    RTRIM(SUBSTR(E.CEP,1,5)) ||''-''|| RTRIM(SUBSTR(E.CEP,6,3)) AS ENDERECO,');
    Add('  ES.CODESTADO       AS UF,');
    Add('  P.FLGDESCONTO      AS TIPOPROVDESC,');
    Add('  HIST.DESCRPROVDESC AS RUBRICA,');
    Add('  HIST.CODPROVDESC   AS CODRUBRICA,');
    Add('  HIST.MES           AS MES_REF,');

    if (cmbAgruparPor.ItemIndex = 1) then
      Add('  CC.NOME AS NOMECENTROCUSTO,');

    Add('  QTDE_FUNC.QTDE AS QTDE_FUNCIONARIOS,');
    Add('  HIST.VALOR');
    // ------------------------------------------------------------------ //
    Add('FROM');
    Add('  PESSOA PJ, ENDPESS E, PROVDESC P, CIDADES, ESTADO ES,'+
      IFF((cmbAgruparPor.ItemIndex=1),' CENTCUST CC,',''));
    // ------------------------------------------------------------------ //
    // Total de funcionários que compuseram  a Folha
    if (cmbAgruparPor.ItemIndex = 1) then // Agrupando por Centro de Custo
    begin
      Add('  (SELECT FP.IDFILIALPESSOA, PESSOAS.MES, CC.CODCENTROCUSTO, COUNT(PESSOAS.IDPESSOA) QTDE');
      Add('   FROM   CENTCUST CC, FILIALPESSOA FP,');
      // Pessoas para o período
      Add('     (SELECT F.IDESTAB, F.IDPESSOA, F.CODCENTROCUSTO, H.MES');
      Add('      FROM   HISTRUBSAL H, FUNCIONARIO F');
      Add('      WHERE');
      // Estabelecimento selecionado
      if (Trim(dblkcbEstab.Text) <> '') then
        Add('        (F.IDESTAB    = ' +qryEstab.FieldByName('CODIGO').asString+ ') AND')
      else
      begin
        // Estabelecimento(s) habilitados para o usuário
        if (sUsuXfilial <> '') then
          if (Pos(',',sUsuXfilial) > 0) then
            Add('        (F.IDESTAB   IN ' +sUsuXfilial+ ') AND')
          else
            Add('        (F.IDESTAB    = ' +sUsuXfilial+ ') AND');
      end;

      // C. Custo(s) selecionado(s)
      if (sCodCCustoSel <> '') then
      begin
        if (Pos(',',sCodCCustoSel) > 0) then
          Add('        (F.CODCENTROCUSTO IN (' +sCodCCustoSel+ ')) AND')
        else
          Add('        (F.CODCENTROCUSTO  = ' +sCodCCustoSel+ ') AND');
      end
      else
      begin
        // C. de Custo(s) habilitados para o usuário
        if (sUsuXccusto <> '') then
          if (Pos(',',sUsuXccusto) > 0) then
            Add('        (F.CODCENTROCUSTO IN ' +sUsuXccusto+ ') AND')
          else
            Add('        (F.CODCENTROCUSTO  = ' +sUsuXccusto+ ') AND');
      end;

      // Rubrica(s) selecionada(s)
      if (sCodRubricaSel <> '') then
        if (Pos(',',sCodRubricaSel) > 0) then
          Add('        (H.CODPROVDESC    IN (' +sCodRubricaSel+ ')) AND')
        else
          Add('        (H.CODPROVDESC     = ' +sCodRubricaSel+ ') AND');

      Add('        ((H.MES       = ' +QuotedStr(Periodo[1])+ ')   OR');
      Add('         (H.MES       = ' +QuotedStr(Periodo[2])+ ')) AND');

      if (sCodTipoFolhaSel <> '') then
        if (Pos(',',sCodTipoFolhaSel) > 0) then
          Add('        (H.IDMOTIVO  IN (' +sCodTipoFolhaSel+ ')) AND')
        else
          Add('        (H.IDMOTIVO   = ' +sCodTipoFolhaSel+ ') AND');

      Add('        (F.IDPESSOA   = H.IDPESSOA)');
      Add('      GROUP BY');
      Add('        F.IDESTAB, F.IDPESSOA, F.CODCENTROCUSTO, H.MES) PESSOAS');
      Add('   WHERE');

      // C. Custo(s) selecionado(s)
      if (sCodCCustoSel <> '') then
      begin
        if (Pos(',',sCodCCustoSel) > 0) then
          Add('     (CC.CODCENTROCUSTO IN (' +sCodCCustoSel+ ')) AND')
        else
          Add('     (CC.CODCENTROCUSTO = ' +sCodCCustoSel+ ') AND');
      end
      else
      begin
        // C. de Custo(s) habilitados para o usuário
        if (sUsuXccusto <> '') then
          if (Pos(',',sUsuXccusto) > 0) then
            Add('     (CC.CODCENTROCUSTO IN ' +sUsuXccusto+ ') AND')
          else
            Add('     (CC.CODCENTROCUSTO  = ' +sUsuXccusto+ ') AND');
      end;

      Add('     (CC.IDEMPRESA           = '+IntToStr(Sistema.IdEmpresa)+') AND');
      Add('     (PESSOAS.IDESTAB        = FP.IDFILIALPESSOA) AND');
      Add('     (PESSOAS.CODCENTROCUSTO = CC.CODCENTROCUSTO)');
      Add('   GROUP BY');
      Add('     CC.CODCENTROCUSTO, FP.IDFILIALPESSOA, PESSOAS.MES) QTDE_FUNC,');
    end
    else // Não Agrupando por Centro de Custo
    begin
      Add('  (SELECT FP.IDFILIALPESSOA, PESSOAS.MES, COUNT(PESSOAS.IDPESSOA) QTDE');
      Add('   FROM   FILIALPESSOA FP,');
      // Pessoas para o período
      Add('     (SELECT F.IDESTAB, F.IDPESSOA, H.MES');
      Add('      FROM   HISTRUBSAL H, FUNCIONARIO F');
      Add('      WHERE');
      // Estabelecimento selecionado
      if (Trim(dblkcbEstab.Text) <> '') then
        Add('        (F.IDESTAB    = ' +qryEstab.FieldByName('CODIGO').asString+ ') AND')
      else
      begin
        // Estabelecimento(s) habilitados para o usuário
        if (sUsuXfilial <> '') then
          if (Pos(',',sUsuXfilial) > 0) then
            Add('        (F.IDESTAB    IN ' +sUsuXfilial+ ') AND')
          else
            Add('        (F.IDESTAB     = ' +sUsuXfilial+ ') AND');
      end;

      // C. Custo(s) selecionado(s)
      if (sCodCCustoSel <> '') then
      begin
        if (Pos(',',sCodCCustoSel) > 0) then
          Add('        (F.CODCENTROCUSTO IN (' +sCodCCustoSel+ ')) AND')
        else
          Add('        (F.CODCENTROCUSTO  = ' +sCodCCustoSel+ ') AND');
      end
      else
      begin
        // C. de Custo(s) habilitados para o usuário
        if (sUsuXccusto <> '') then
          if (Pos(',',sUsuXccusto) > 0) then
            Add('        (F.CODCENTROCUSTO IN ' +sUsuXccusto+ ') AND')
          else
            Add('        (F.CODCENTROCUSTO  = ' +sUsuXccusto+ ') AND');
      end;

      // Rubrica(s) selecionada(s)
      if (sCodRubricaSel <> '') then
        if (Pos(',',sCodRubricaSel) > 0) then
          Add('        (H.CODPROVDESC    IN (' +sCodRubricaSel+ ')) AND')
        else
          Add('        (H.CODPROVDESC     = ' +sCodRubricaSel+ ') AND');

      Add('        ((H.MES       = ' +QuotedStr(Periodo[1])+ ')   OR');
      Add('         (H.MES       = ' +QuotedStr(Periodo[2])+ ')) AND');

      if (sCodTipoFolhaSel <> '') then
        if (Pos(',',sCodTipoFolhaSel) > 0) then
          Add('        (H.IDMOTIVO  IN (' +sCodTipoFolhaSel+ ')) AND')
        else
          Add('        (H.IDMOTIVO   = ' +sCodTipoFolhaSel+ ') AND');

      Add('        (F.IDPESSOA   = H.IDPESSOA)');
      Add('      GROUP BY');
      Add('        F.IDESTAB, F.IDPESSOA, H.MES) PESSOAS');
      Add('   WHERE');
      Add('     (FP.IDFILIALPESSOA = PESSOAS.IDESTAB)');
      Add('   GROUP BY');
      Add('     FP.IDFILIALPESSOA, PESSOAS.MES) QTDE_FUNC,');
    end;
    // ------------------------------------------------------------------ //
    // Rubricas da Folha
    Add('  (SELECT');
    Add('     '+IFF((cmbAgruparPor.ItemIndex = 1),'F.CODCENTROCUSTO, ','')+
         'F.IDESTAB AS IDPESSOA, H.IDRUBRICA, RP.CODPROVDESC,');
    Add('     RP.DESCRPROVDESC, SUM(H.VALORPROVENTO) AS VALOR, H.MES');
    Add('   FROM HISTRUBSAL H, RUBRICAXPESS RP, FUNCIONARIO F');
    Add('   WHERE');

    Add('   (F.IDEMPRESA = '+IntToStr(Sistema.IdEmpresa)+') AND');
    Add('   (RP.IDPESSOA = '+IntToStr(Sistema.IdEmpresa)+') AND');

    // Estabelecimento selecionado
    if (Trim(dblkcbEstab.Text) <> '') then
      Add('     (F.IDESTAB    = '+qryEstab.FieldByName('CODIGO').asString+') AND')
    else
    begin
      // Estabelecimento(s) habilitados para o usuário
      if (sUsuXfilial <> '') then
        if (Pos(',',sUsuXfilial) > 0) then
          Add('     (F.IDESTAB   IN ' +sUsuXfilial+ ') AND')
        else
          Add('     (F.IDESTAB    = ' +sUsuXfilial+ ') AND');
    end;

    // C. Custo(s) selecionado(s)
    if (sCodCCustoSel <> '') then
    begin
      if (Pos(',',sCodCCustoSel) > 0) then
        Add('     (F.CODCENTROCUSTO IN (' +sCodCCustoSel+ ')) AND')
      else
        Add('     (F.CODCENTROCUSTO  = ' +sCodCCustoSel+ ') AND');
    end
    else
    begin
      // C. de Custo(s) habilitados para o usuário
      if (sUsuXccusto <> '') then
        if (Pos(',',sUsuXccusto) > 0) then
          Add('     (F.CODCENTROCUSTO IN ' +sUsuXccusto+ ') AND')
        else
          Add('     (F.CODCENTROCUSTO  = ' +sUsuXccusto+ ') AND');
    end;

    // Rubrica(s) selecionada(s)
    if (sCodRubricaSel <> '') then
      if (Pos(',',sCodRubricaSel) > 0) then
        Add('        (H.CODPROVDESC    IN (' +sCodRubricaSel+ ')) AND')
      else
        Add('        (H.CODPROVDESC     = ' +sCodRubricaSel+ ') AND');

    Add('     ((H.MES       = ' +QuotedStr(Periodo[1])+ ')   OR');
    Add('      (H.MES       = ' +QuotedStr(Periodo[2])+ ')) AND');

    if (sCodTipoFolhaSel <> '') then
      if (Pos(',',sCodTipoFolhaSel) > 0) then
        Add('     (H.IDMOTIVO  IN (' +sCodTipoFolhaSel+ ')) AND')
      else
        Add('     (H.IDMOTIVO   = ' +sCodTipoFolhaSel+ ') AND');

    Add('     (RP.IDRUBRICA = H.IDRUBRICA) AND');
    Add('     (H.IDPESSOA   = F.IDPESSOA)');
    Add('   GROUP BY');

    Add('     ' +IFF((cmbAgruparPor.ItemIndex = 1),'F.CODCENTROCUSTO, ','')+
      'H.IDRUBRICA, F.IDESTAB, H.MES, RP.CODPROVDESC, RP.DESCRPROVDESC) HIST,');
    // ------------------------------------------------------------------------------- //
    Add('  (SELECT DO.IDPESSOA, TDO.CODDOCUMENTO, DO.NUMDOCUMENTO');
    Add('   FROM   DOCPESSOA DO, TIPODOCOFICIAL TDO');
    Add('   WHERE (TDO.SIGLADOCUMENTO = ''ESTADUAL:'') AND');
    Add('         (TDO.IDDOCUMENTO    = DO.IDDOCUMENTO)) ESTADUAL,');
    // -------------------------------------------------------------------------- //
    Add('  (SELECT DO.IDPESSOA, TDO.CODDOCUMENTO, DO.NUMDOCUMENTO');
    Add('   FROM   DOCPESSOA DO, TIPODOCOFICIAL TDO');
    Add('   WHERE (TDO.SIGLADOCUMENTO = ''MUNICIPAL:'') AND');
    Add('         (TDO.IDDOCUMENTO    = DO.IDDOCUMENTO)) MUNICIPAL');
    // ------------------------------------------------------------------ //
    Add('WHERE');

    // Estabelecimento selecionado
    if (Trim(dblkcbEstab.Text) <> '') then
      Add('  (PJ.IDPESSOA       = ' +qryEstab.FieldByName('CODIGO').asString+ ') AND')
    else
    begin
      // Estabelecimento(s) habilitados para o usuário
      if (sUsuXfilial <> '') then
        if (Pos(',',sUsuXfilial) > 0) then
          Add('  (PJ.IDPESSOA      IN ' +sUsuXfilial+ ') AND')
        else
          Add('  (PJ.IDPESSOA       = ' +sUsuXfilial+ ') AND');
    end;

    // Testa se o usuário quer somente PROVENTOS e DESCONTOS ou + OUTROS
    if (rgRubApoio.ItemIndex = 1) then
      Add('  (P.FLGDESCONTO     < 2) AND');

{    Add('  ((P.CODRUBCLT     <> ''40999'') OR (P.CODRUBCLT IS NULL)) AND');
    Add('  ((P.CODRUBCLT     <> ''40998'') OR (P.CODRUBCLT IS NULL)) AND');
    Add('  ((P.CODRUBCLT     <> ''50999'') OR (P.CODRUBCLT IS NULL)) AND');}

    // C. Custo(s) selecionado(s) - (Testa se está agrupando por Centro de Custo)
    if (cmbAgruparPor.ItemIndex = 1) and (sCodCCustoSel <> '') then
    begin
      if (Pos(',',sCodCCustoSel) > 0) then
        Add('  (CC.CODCENTROCUSTO IN (' +sCodCCustoSel+ ')) AND')
      else
        Add('  (CC.CODCENTROCUSTO = ' +sCodCCustoSel+ ') AND');
    end;

    if (cmbAgruparPor.ItemIndex = 1) then
      Add('  (CC.IDEMPRESA      = '+IntToStr(Sistema.IdEmpresa)+') AND');

    Add('  (PJ.IDPESSOA       = HIST.IDPESSOA)  AND');
    Add('  (P.IDPROVENTO      = HIST.IDRUBRICA) AND');
    Add('  (PJ.IDPESSOA       = QTDE_FUNC.IDFILIALPESSOA) AND');
    Add('  (QTDE_FUNC.MES     = HIST.MES) AND');

    // Testa se está agrupando por Centro de Custo
    if (cmbAgruparPor.ItemIndex = 1) then
    begin
      Add('  (CC.CODCENTROCUSTO = QTDE_FUNC.CODCENTROCUSTO) AND');
      Add('  (CC.CODCENTROCUSTO = HIST.CODCENTROCUSTO)      AND');
    end;

    Add('  (PJ.IDPESSOA       = E.IDPESSOA)        AND');
    Add('  (PJ.IDENDCOMERCIAL = E.IDENDERECO)      AND');
    Add('  (E.IDCIDADES       = CIDADES.IDCIDADES) AND');
    Add('  (CIDADES.IDESTADO  = ES.IDESTADO)       AND');
    Add('  (PJ.IDPESSOA       = ESTADUAL.IDPESSOA(+)) AND');
    Add('  (PJ.IDPESSOA       = MUNICIPAL.IDPESSOA(+))');
    Add('ORDER BY');
    if (cmbAgruparPor.ItemIndex = 1) then
      Add('  NOMECENTROCUSTO, TIPOPROVDESC, RUBRICA')
    else
      Add('  TIPOPROVDESC, RUBRICA');
    //SaveToFile ('c:\qry.txt');
    SaveToFile (Sistema.RetornaCaminhoArquivos(Sistema.IdEmpresa)+'\qry.txt');//Ádler Teodoro de Souza SOL 109421 KINTANA 496332
  end;

  frmAguarde.Mostra ('Resumo de Folha Comparativo');
  frmAguarde.Pos := 0;
  dtmBaseDados.qry.Open;

  if not(dtmBaseDados.qry.IsEmpty) then
  begin
    frmAguarde.Max := dtmBaseDados.qry.RecordCount;
    frmAguarde.Min := 0;
    
    ListaNumFuncCCusto := TStringList.Create;
    ListaNomeCCusto    := TStringList.Create;

    with (dtmRelatoriosResFolComp) do
    begin
      iTipoRel := cmbAgruparPor.ItemIndex;

      // Aponto o UpdateSQL para a query
//      qryResFolComp.UpdateObject := updSQL;
//      dsResFolComp.DataSet       := qryResFolComp;

      if not(qryResFolComp.IsEmpty) then
        qryResFolComp.CancelUpdates;
      qryResFolComp.Close;
      qryResFolComp.Open;

      // Verifico o número de Funcionários em cada mês se o tipo de Relatório NÃO É AGRUPADO
      if (iTipoRel = 0) then
      begin
        repeat
          if (Periodo[1] = dtmBaseDados.qry.FieldByName('MES_REF').asString) then
          begin
            sQtdeFunc := IntToStr(dtmBaseDados.qry.FieldByName('QTDE_FUNCIONARIOS').asInteger);
            break;
          end;
          dtmBaseDados.qry.Next;
        until (dtmBaseDados.qry.EOF);

        dtmBaseDados.qry.First;
        repeat
          if (Periodo[2] = dtmBaseDados.qry.FieldByName('MES_REF').asString) then
          begin
            sQtdeFunc := sQtdeFunc +' / '+
              IntToStr(dtmBaseDados.qry.FieldByName('QTDE_FUNCIONARIOS').asInteger);
            break;
          end;
          dtmBaseDados.qry.Next;
        until (dtmBaseDados.qry.EOF);
      end
      else
      // Verifico o número de Funcionários em cada mês se o tipo de Relatório É AGRUPADO
      begin
        repeat
          sCCusto        := dtmBaseDados.qry.FieldByName('NOMECENTROCUSTO').asString;
          PontoDePartida := dtmBaseDados.qry.GetBookmark;
          repeat
            if (Periodo[1] = dtmBaseDados.qry.FieldByName('MES_REF').asString) then
            begin
              sQtdeFunc := IntToStr(dtmBaseDados.qry.FieldByName('QTDE_FUNCIONARIOS').asInteger);
              break;
            end;
            dtmBaseDados.qry.Next;
          until (sCCusto <> dtmBaseDados.qry.FieldByName('NOMECENTROCUSTO').asString) or
                (dtmBaseDados.qry.EOF);

          dtmBaseDados.qry.GotoBookmark(PontoDePartida);

          repeat
            if (Periodo[2] = dtmBaseDados.qry.FieldByName('MES_REF').asString) then
            begin
              sQtdeFunc := sQtdeFunc +' / '+
                IntToStr(dtmBaseDados.qry.FieldByName('QTDE_FUNCIONARIOS').asInteger);
              break;
            end;                 
            dtmBaseDados.qry.Next;
          until (sCCusto <> dtmBaseDados.qry.FieldByName('NOMECENTROCUSTO').asString) or
                (dtmBaseDados.qry.EOF);

          ListaNomeCCusto.Add(sCCusto);
          ListaNumFuncCCusto.Add(sQtdeFunc);

          repeat
            dtmBaseDados.qry.Next;
          until (sCCusto <> dtmBaseDados.qry.FieldByName('NOMECENTROCUSTO').asString) or
                (dtmBaseDados.qry.EOF);

        until (dtmBaseDados.qry.EOF);

        dtmBaseDados.qry.FreeBookmark(PontoDePartida);
      end;

      dtmBaseDados.qry.First;
      repeat
        qryResFolComp.Insert;
        qryResFolComp.FieldByName('ESTAB').asString     := dtmBaseDados.qry.FieldByName('ESTAB').asString;
        qryResFolComp.FieldByName('CGC').asString       := dtmBaseDados.qry.FieldByName('CGC').asString;
        qryResFolComp.FieldByName('INSCRICAO').asString := dtmBaseDados.qry.FieldByName('INSCRICAO').asString;
        qryResFolComp.FieldByName('ENDERECO').asString  := dtmBaseDados.qry.FieldByName('ENDERECO').asString;
        qryResFolComp.FieldByName('UF').asString        := dtmBaseDados.qry.FieldByName('UF').asString;

        if (cmbAgruparPor.ItemIndex = 1) then
          qryResFolComp.FieldByName('NOMECENTROCUSTO').asString := dtmBaseDados.qry.FieldByName('NOMECENTROCUSTO').asString;

        case (dtmBaseDados.qry.FieldByName('TIPOPROVDESC').asInteger) of
          0 :  qryResFolComp.FieldByName('PROVENTODESCONTO').asString := 'PROVENTOS';
          1 :  qryResFolComp.FieldByName('PROVENTODESCONTO').asString := 'DESCONTOS';
          else qryResFolComp.FieldByName('PROVENTODESCONTO').asString := 'OUTROS';
        end;

        qryResFolComp.FieldByName('TIPOPROVDESC').asInteger := dtmBaseDados.qry.FieldByName('TIPOPROVDESC').asInteger;
        qryResFolComp.FieldByName('CODRUBRICA').asString    := dtmBaseDados.qry.FieldByName('CODRUBRICA').asString;
        qryResFolComp.FieldByName('RUBRICA').asString       := dtmBaseDados.qry.FieldByName('RUBRICA').asString;

        if (iTipoRel = 0) then
          qryResFolComp.FieldByName('QTDE_FUNCIONARIOS').asString := sQtdeFunc
        else
          qryResFolComp.FieldByName('QTDE_FUNCIONARIOS').asString := ListaNumFuncCCusto[
            ListaNomeCCusto.IndexOf (dtmBaseDados.qry.FieldByName('NOMECENTROCUSTO').asString)];
        
        // "Pego" os meses correspondentes e os atribuo à REFERÊNCIA1 e REFERÊNCIA2
        sCodRubrica := dtmBaseDados.qry.FieldByName('CODRUBRICA').asString;
        for I:=1 to 2 do
        begin
          qryResFolComp.FieldByName('MES_REF'+IntToStr(I)).asString :=
            Copy(Periodo[I],6,2) +'/'+ Copy(Periodo[I],1,4);

          if (Periodo[1] <> dtmBaseDados.qry.FieldByName('MES_REF').asString) and (I = 1) then
            qryResFolComp.FieldByName('VALOR1').asInteger := 0
          else
          if (sCodRubrica = dtmBaseDados.qry.FieldByName('CODRUBRICA').asString) then
          begin
            if (Periodo[2] <> dtmBaseDados.qry.FieldByName('MES_REF').asString) and (I = 2) then
              qryResFolComp.FieldByName('VALOR2').asInteger := 0
            else
            begin
              qryResFolComp.FieldByName('VALOR'+IntToStr(I)).asFloat := dtmBaseDados.qry.FieldByName('VALOR').asFloat;
              dtmBaseDados.qry.Next;
            end;
          end
          else
            qryResFolComp.FieldByName('VALOR2').asInteger := 0;
        end;

        // Calcula a Variação
        CalcVariacao (qryResFolComp.FieldByName('VALOR1').asFloat,
                      qryResFolComp.FieldByName('VALOR2').asFloat,
                      sValResultVal, sValResultPerc);

        qryResFolComp.FieldByName('VALOR_VAR').asString    := sValResultVal;
        sValResultVal := ValidaCaracteres (sValResultVal, 'N', '');
        qryResFolComp.FieldByName('VALOR_VAR_NUM').asFloat := StringToFloat(sValResultVal);

        qryResFolComp.FieldByName('PERC_VAR').asString := sValResultPerc;
        if (sValResultPerc = '-') then
          sValResultPerc := ''
        else
          sValResultPerc := ValidaCaracteres (sValResultPerc, 'N', '');

        qryResFolComp.FieldByName('PERC_VAR_NUM').asFloat := StringToFloat(sValResultPerc);

        qryResFolComp.Post;
      until (dtmBaseDados.qry.EOF);

      // ------------------------------------------------------------------------
      // Faço as modificações no Layout do Relatório conforme opções selecionadas
      // ------------------------------------------------------------------------
      if (iTipoRel = 0) then
      begin
        rpResFolCompLine1.Top       := 40.746;
        rpResFolCompLine2.Pen.Width := 2;
        rpResFolCompHdrBnd1.Height  := 41.275;
      end
      else
      begin
        rpResFolCompLine1.Top       := 33.1;
        rpResFolCompLine2.Pen.Width := 1;
        rpResFolCompHdrBnd1.Height  := 33.629;
      end;                             

      rpResFolCompGrpHdrBnd0.Visible := (iTipoRel = 1);
      rpResFolCompGrpFootBnd0.Visible := (iTipoRel = 1);
      rpResFolCompLine4.Visible  := (iTipoRel = 0);

      rpResFolCompLbl7.Visible := (iTipoRel = 0);
      rpResFolCompLbl8.Visible := (iTipoRel = 0);
      rpResFolCompLbl9.Visible := (iTipoRel = 0);
      rpResFolCompLbl10.Visible := (iTipoRel = 0);
      rpResFolCompLbl11.Visible := (iTipoRel = 0);
      rpResFolCompLbl12.Visible := (iTipoRel = 0);
      rpResFolCompLbl13.Visible := (iTipoRel = 0);
      rpResFolCompLbl14.Visible := (iTipoRel = 0);

      rpResFolCompDBTxt7.Visible := (iTipoRel = 0);
      rpResFolCompDBTxt8.Visible := (iTipoRel = 0);

      bTotalUnico := (rgTotalUnico.ItemIndex = 0);
      if (bTotalUnico) then
      begin
        rpResFolCompGrpHdrBand1.Height := 0.1;
        rpResFolCompGrpFootBnd0.Height := 7.408;
        rpResFolCompSmryBnd1.Height := 15.081;

        rpResFolCompLbl27.Caption := 'TOTAL:';
        rpResFolCompLbl27.Top := 2.117;
        rpResFolCompLine5.Top := 0;
        rpResFolCompLblTOT_LIQ1.Top := 2.117;
        rpResFolCompLblTOT_LIQ2.Top := 2.117;
        rpResFolCompLblTOT_PERC_VAR_LIQ.Top := 2.117;
        rpResFolCompLblTOT_VALOR_VAR_LIQ.Top := 2.117;

        rpResFolCompLbl30.Caption := 'TOTAL GERAL:';
        rpResFolCompLbl30.Top := 9.525;
        rpResFolCompLblTOT_GERAL_LIQ1.Top := 9.525;
        rpResFolCompLblTOT_GERAL_LIQ2.Top := 9.525;
        rpResFolCompLblTOT_GERAL_PERC_VAR_LIQ.Top := 9.525;
        rpResFolCompLblTOT_GERAL_VALOR_VAR_LIQ.Top := 9.525;
      end
      else
      begin
        rpResFolCompLine3.Top := 0.529;
        rpResFolCompLine3.Left := 2.381;
        rpResFolCompTotProvDesc.Top := 1.852;
        rpResFolCompTotProvDesc.Left := 2.381;
        rpResFolCompDBCalcVALOR1.Top := 2.117;
        rpResFolCompDBCalcVALOR1.Left := 93.134;
        rpResFolCompDBCalcVALOR2.Top := 2.117;
        rpResFolCompDBCalcVALOR2.Left := 122.238;
        rpResFolCompLblPERC_VAR.Top := 2.117;
        rpResFolCompLblPERC_VAR.Left := 152.136;
        rpResFolCompLblVALOR_VAR.Top := 2.117;
        rpResFolCompLblVALOR_VAR.Left := 173.567;

        rpResFolCompGrpFootBnd1.Height := 7.408;
        rpResFolCompGrpFootBnd0.Height := 20.638;
        rpResFolCompSmryBnd1.Height := 28.84;

        rpResFolCompLbl27.Caption := 'TOTAL LÍQUIDO:';
        rpResFolCompLbl27.Top := 15.081;
        rpResFolCompLine5.Top := 12.7;
        rpResFolCompLblTOT_LIQ1.Top := 15.081;
        rpResFolCompLblTOT_LIQ2.Top := 15.081;
        rpResFolCompLblTOT_PERC_VAR_LIQ.Top := 15.081;
        rpResFolCompLblTOT_VALOR_VAR_LIQ.Top := 15.081;

        rpResFolCompLbl30.Caption := 'TOTAL GERAL LÍQUIDO:';
        rpResFolCompLbl30.Top := 22.49;
        rpResFolCompLblTOT_GERAL_DESC1.Top := 15.081;
        rpResFolCompLblTOT_GERAL_DESC2.Top := 15.081;
        rpResFolCompLblTOT_GERAL_PERC_VAR_DESC.Top := 15.081;
        rpResFolCompLblTOT_GERAL_VALOR_VAR_DESC.Top := 15.081;

        rpResFolCompLine7.Top := 20.638;
        rpResFolCompLbl29.Top := 15.081;
        rpResFolCompLbl26.Top := 7.144;

        rpResFolCompLblTOT_DESC1.Top := 7.144;
        rpResFolCompLblTOT_DESC2.Top := 7.144;
        rpResFolCompLblTOT_PERC_VAR_DESC.Top := 7.144;
        rpResFolCompLblTOT_VALOR_VAR_DESC.Top := 7.144;

        rpResFolCompLblTOT_GERAL_LIQ1.Top := 22.49;
        rpResFolCompLblTOT_GERAL_LIQ2.Top := 22.49;
        rpResFolCompLblTOT_GERAL_PERC_VAR_LIQ.Top := 22.49;
        rpResFolCompLblTOT_GERAL_VALOR_VAR_LIQ.Top := 22.49;
      end;

      rpResFolCompLine3.Visible := not(bTotalUnico);
      rpResFolCompTotProvDesc.Visible := not(bTotalUnico);
      rpResFolCompLbl25.Visible := not(bTotalUnico);
      rpResFolCompLbl26.Visible := not(bTotalUnico);
      rpResFolCompLbl28.Visible := not(bTotalUnico);
      rpResFolCompLbl29.Visible := not(bTotalUnico);

      rpResFolCompLblTOT_PROV1.Visible := not(bTotalUnico);
      rpResFolCompLblTOT_DESC1.Visible := not(bTotalUnico);
      rpResFolCompLblTOT_PROV2.Visible := not(bTotalUnico);
      rpResFolCompLblTOT_DESC2.Visible := not(bTotalUnico);
      rpResFolCompLblTOT_PERC_VAR_PROV.Visible := not(bTotalUnico);
      rpResFolCompLblTOT_PERC_VAR_DESC.Visible := not(bTotalUnico);
      rpResFolCompLblTOT_VALOR_VAR_PROV.Visible := not(bTotalUnico);
      rpResFolCompLblTOT_VALOR_VAR_DESC.Visible := not(bTotalUnico);
      rpResFolCompLblTOT_GERAL_PROV1.Visible := not(bTotalUnico);
      rpResFolCompLblTOT_GERAL_DESC1.Visible := not(bTotalUnico);
      rpResFolCompLblTOT_GERAL_PROV2.Visible := not(bTotalUnico);
      rpResFolCompLblTOT_GERAL_DESC2.Visible := not(bTotalUnico);
      rpResFolCompLblTOT_GERAL_PERC_VAR_PROV.Visible := not(bTotalUnico);
      rpResFolCompLblTOT_GERAL_PERC_VAR_DESC.Visible := not(bTotalUnico);
      rpResFolCompLblTOT_GERAL_VALOR_VAR_PROV.Visible := not(bTotalUnico);
      rpResFolCompLblTOT_GERAL_VALOR_VAR_DESC.Visible := not(bTotalUnico);
      rpResFolCompLine7.Visible := not(bTotalUnico);

      sTipoFolha:=''; K:=1;
      for I:=0 to chklstTipoFolha.Items.Count-1 do
        if (chklstTipoFolha.Checked[I]) then
        begin
          if (K > 1) then
            sTipoFolha := sTipoFolha +' - ';
          sTipoFolha := sTipoFolha + chklstTipoFolha.Items[I];
          Inc(K);
        end;
      rpResFolCompLblTipoPag.Caption := sTipoFolha;

      rpResFolCompLbl9.Top  :=32.279; rpResFolCompLbl10.Top :=32.279;
      rpResFolCompLbl11.Top :=32.279; rpResFolCompLbl13.Top :=32.279;
      rpResFolCompLbl7.Top  :=36.248; rpResFolCompLbl8.Top  :=36.248;
      rpResFolCompLbl12.Top :=36.248; rpResFolCompLbl14.Top :=36.248;
      rpResFolCompDBTxt7.Top:=36.248; rpResFolCompDBTxt8.Top:=36.248;

      rpResFolComp.PrinterSetup.PaperName := cmbTipoPapel.Items[cmbTipoPapel.ItemIndex];
    end;

    ListaNumFuncCCusto.Free;
    ListaNomeCCusto.Free;
  end
  else
  begin
    ModalResult := mrNone;
    frmAguarde.Apaga;
    MsgDlg('Não há dados a serem exibidos! Verifique.', 'Aviso', mtInformation, [mbOk,mbHelp], 0);
  end;

  dtmBaseDados.qry.Close;
end;

// -------------------------------------------------------------------------------------
// Funções do Form
// -------------------------------------------------------------------------------------
procedure TfrmParamResFolComp.LeAlteracoes;
begin
  // Recupera as últimas alterações das opções
  //ArqConfig := TIniFile.Create('C:\CONFIG_FOLHAPAGTO.INI');
  ArqConfig := TIniFile.Create(Sistema.RetornaCaminhoArquivos(Sistema.IdEmpresa)+'\CONFIG_FOLHAPAGTO.INI');//Ádler Teodoro de Souza SOL 109421 KINTANA 496332
  sCodRubricaSel := ArqConfig.ReadString ('REL_RESFOLCOMP', 'Rubricas', '');
  VerificaOpcoes(chklstRubrica, ListaCodRubrica,  sCodRubricaSel, ',');
  edCodRubricas.Text  := sCodRubricaSel;
  
  HabilitaBtOk;
end;

procedure TfrmParamResFolComp.GravaAlteracoes;
begin
  // Grava as últimas alterações da Opção de Rubricas 1
  CriaListaOpcoes (chklstRubrica, ListaCodRubrica, sCodRubricaSel, ',', false);
  ArqConfig.WriteString ('REL_RESFOLCOMP','Rubricas',sCodRubricaSel);
end;

procedure TfrmParamResFolComp.HabilitaBtOk;
var
  c: integer;
  bSelecionado: boolean;
begin
  // Verifica se algum Tipo de Folha foi selecionado
  bSelecionado := false;
  for c:=0 to chklstTipoFolha.Items.Count-1 do
    if (chklstTipoFolha.Checked[c]) then
    begin
      bSelecionado := true;
      break;
    end;

  bbtnConfirmar.Enabled := (bSelecionado) and (Trim(dblkcbEstab.Text) <> '') and
    (Trim(speAnoRef1.Text) <> '') and (Trim(speAnoRef2.Text) <> '');
end;

procedure TfrmParamResFolComp.CalcVariacao (rVal1,rVal2:real; var sValResultVal,sValResultPerc:string);
var
  rVariacao: real;
begin
  // Calcula Variação em Valor
  rVariacao := rVal2 - rVal1;

  // Calcula Variação em Percentual
  if (rVal1 > 0) then
    sValResultPerc := IFF (rVariacao > 0,'+','') +
      ValStr(((rVariacao*100) / rVal1),12,2,true,',') + ' %'
  else
    sValResultPerc := '-';

  // Retorna a variação em Valor
  sValResultVal := IFF (rVariacao > 0,'+','') + ValStr(rVariacao,12,2,true,',');
end;

end.
