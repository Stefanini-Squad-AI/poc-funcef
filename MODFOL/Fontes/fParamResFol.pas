// *****************************************************************************
// ***************************** REGISTRO DE ALTERAÇÕES ************************
// *****************************************************************************
// Autor(a)    :  Ádler Teodoro de Souza
// Data        :  19/02/2009
// Pendência   : SOL 109421 KINTANA 496332
// Descricao   :  Alteração de gravação de arquivos de log na raiz do disco C: .
//------------------------------------------------------------------------------
unit fParamResFol;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs, IvDictio,
  IvMulti, IvEMulti, MAHlpBtn, StdCtrls, Buttons, TB97Tlbr, TB97, ExtCtrls, Db, Spin,
  Wwdatsrc, DBTables, Wwquery, wwdblook, checklst, ComCtrls, fSairAjuda, Grids, DBGrids;

type
  TfrmResFol = class(TfrmSairAjuda)
    qryEstab: TwwQuery;
    qryAux: TwwQuery;
    bbtnConfirmar: TBitBtn;
    ToolbarSep971: TToolbarSep97;
    Paginas: TPageControl;
    tbshTipoFolha: TTabSheet;
    chklstTipoFolha: TCheckListBox;
    tbsRubrica: TTabSheet;
    Label1: TLabel;
    chklstRubrica: TCheckListBox;
    edCodRubricas: TEdit;
    sbtnMarcarRub: TBitBtn;
    tbshCCusto: TTabSheet;
    chklstCCusto: TCheckListBox;
    spbtSelTodos: TBitBtn;
    spbtInvSelecao: TBitBtn;
    gbxEstab: TGroupBox;
    dblkcbEstab: TwwDBLookupCombo;
    rgProcesso: TRadioGroup;
    rgRubApoio: TRadioGroup;
    rgImprimeTipoProcesso: TRadioGroup;
    gbxAnoMesRef: TGroupBox;
    lblPerIni: TLabel;
    lblPerFin: TLabel;
    cmbMesIni: TComboBox;
    speAnoIni: TSpinEdit;
    cmbMesFin: TComboBox;
    speAnoFin: TSpinEdit;
    chkTipoIntervalo: TCheckBox;
    rgAutoriza: TRadioGroup;
    gbxAgruparPor: TGroupBox;
    cmbAgruparPor: TComboBox;
    procedure FormCreate(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure bbtnConfirmarClick(Sender: TObject);
    procedure chklstTipoFolhaDrawItem(Control: TWinControl; Index: Integer; Rect: TRect;
      State: TOwnerDrawState);
    procedure chklstTipoFolhaClickCheck(Sender: TObject);
    procedure spbtSelTodosClick(Sender: TObject);
    procedure spbtInvSelecaoClick(Sender: TObject);
    procedure dblkcbEstabChange(Sender: TObject);
    procedure chklstTipoFolhaKeyDown(Sender: TObject; var Key: Word; Shift: TShiftState);
    procedure chklstCCustoClickCheck(Sender: TObject);
    procedure chklstCCustoKeyDown(Sender: TObject; var Key: Word; Shift: TShiftState);
    procedure chklstRubricaClickCheck(Sender: TObject);
    procedure sbtnMarcarRubClick(Sender: TObject);
    procedure chkTipoIntervaloClick(Sender: TObject);
  private
    byNumCarMascCCSint: byte;
    iQtdeFunc: integer;
    lstCodCCusto, lstNomeCCusto, lstNumFunc, lstRubProcess: TStringList;
    sCodCCAtual, sCodCCSintAtual, sCodRub: string;

    procedure HabilitaBtOk;
    procedure NumCaracCCSintetico;
    procedure GeraListaCodCCusto;
    procedure GeraNumFuncCCusto;
    procedure AgrupaCCustoSintetico;
  end;

var
  frmResFol: TfrmResFol;

implementation

uses uSistema, uMensErro, uDataBase, fAguarde, dBaseDados, uFuncoesUteis, UsoGeralRH,
  uComumRelats, dRelatorios;

{$R *.DFM}

procedure TfrmResFol.FormCreate(Sender: TObject);
begin
  inherited;
  if not(Assigned(ListaCodTipoFolha)) then
    ListaCodTipoFolha := TStringList.Create;
  if not(Assigned(ListaCodRubrica)) then
    ListaCodRubrica := TStringList.Create;
  if not(Assigned(ListaCodCCusto)) then
    ListaCodCCusto := TStringList.Create;

  lstCodCCusto := TStringList.Create;
  lstNomeCCusto := TStringList.Create;
  lstNumFunc := TStringList.Create;
  lstRubProcess := TStringList.Create;

  FazQuery(dtmBaseDados.qry,'SELECT NORMALINI FROM PARAMRH');
  cmbMesIni.ItemIndex := ExtraiMes(dtmBaseDados.qry.FieldByName('NORMALINI').asDateTime) - 1;
  cmbMesFin.ItemIndex := cmbMesIni.ItemIndex;
  speAnoIni.Text := Copy(dtmBaseDados.qry.FieldByName('NORMALINI').asString,7,4);
  speAnoFin.Text := speAnoIni.Text;

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
  chkTipoIntervaloClick(Sender);

  HabilitaBtOk;
end;

procedure TfrmResFol.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  dtmBaseDados.qry.Close;
  qryEstab.Close;
  inherited;
  lstRubProcess.Free;
  lstCodCCusto.Free;
  lstNomeCCusto.Free;
  lstNumFunc.Free;
end;

procedure TfrmResFol.chklstTipoFolhaDrawItem(Control: TWinControl; Index: Integer;
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

procedure TfrmResFol.dblkcbEstabChange(Sender: TObject);
begin
  HabilitaBtOk;
end;

procedure TfrmResFol.chklstTipoFolhaKeyDown(Sender: TObject; var Key: Word; Shift: TShiftState);
begin
  if (Key = VK_TAB) then
    chklstTipoFolhaClickCheck(Sender);
end;

procedure TfrmResFol.chklstCCustoKeyDown(Sender: TObject; var Key: Word; Shift: TShiftState);
begin
  if (Key = VK_TAB) then
    InvalidateItemListBox(TCustomListBox(Sender), TCustomListBox(Sender).ItemIndex);
end;

procedure TfrmResFol.chklstTipoFolhaClickCheck(Sender: TObject);
begin
  InvalidateItemListBox(TCustomListBox(Sender), TCustomListBox(Sender).ItemIndex);
  HabilitaBtOk;
end;

procedure TfrmResFol.chklstCCustoClickCheck(Sender: TObject);
begin
  InvalidateItemListBox(TCustomListBox(Sender), TCustomListBox(Sender).ItemIndex);
end;

procedure TfrmResFol.chklstRubricaClickCheck(Sender: TObject);
begin
  CriaListaOpcoes(chklstRubrica, ListaCodRubrica, sCodRubricaSel, ',', false);
  edCodRubricas.Text := sCodRubricaSel;
  InvalidateItemListBox(TCustomListBox(Sender), TCustomListBox(Sender).ItemIndex);
end;

procedure TfrmResFol.spbtSelTodosClick(Sender: TObject);
var
  c: integer;
begin
  case (Paginas.ActivePageIndex) of
    0 : begin
          for c:=0 to chklstTipoFolha.Items.Count-1 do
            chklstTipoFolha.Checked[c] := true;
          chklstTipoFolha.Repaint;
          HabilitaBtOk;
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

procedure TfrmResFol.spbtInvSelecaoClick(Sender: TObject);
var
  c: integer;
begin
  case (Paginas.ActivePageIndex) of
    0 : begin
          for c:=0 to chklstTipoFolha.Items.Count-1 do
            chklstTipoFolha.Checked[c] := not(chklstTipoFolha.Checked[c]);
          chklstTipoFolha.Repaint;
          HabilitaBtOk;
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

procedure TfrmResFol.sbtnMarcarRubClick(Sender: TObject);
begin
  edCodRubricas.Text := Trim(edCodRubricas.Text);
  VerificaOpcoes(chklstRubrica, ListaCodRubrica, edCodRubricas.Text, ',');
  HabilitaBtOk;
  chklstRubrica.Repaint;
end;

procedure TfrmResFol.chkTipoIntervaloClick(Sender: TObject);
begin
  cmbMesFin.Visible := (chkTipoIntervalo.Checked);
  speAnoFin.Visible := (chkTipoIntervalo.Checked);
  lblPerIni.Visible := (chkTipoIntervalo.Checked);
  lblPerFin.Visible := (chkTipoIntervalo.Checked);
end;

procedure TfrmResFol.bbtnConfirmarClick(Sender: TObject);
var
  wNum: word;
  I,K: integer;
  sNomeTabela, sTipoFolha, sPeriodoIni, sPeriodoFin: string;
begin
  // Tipos de Folha selecionados
  CriaListaOpcoes(chklstTipoFolha, ListaCodTipoFolha, sCodTipoFolhaSel, ',', false);

  // Rubrica(s) selecionada(s)
  wNum := CriaListaOpcoes(chklstRubrica, ListaCodRubrica, sCodRubricaSel, ',', true);
  if (wNum = ListaCodRubrica.Count) then
    sCodRubricaSel := '';

  // C. de Custo selecionados
  CriaListaOpcoes(chklstCCusto, ListaCodCCusto, sCodCCustoSel, ',', true);

  // Guarda o Período escolhido
  sPeriodoIni := QuotedStr(IntToStr(speAnoIni.Value) +'/'+ PoeZero(cmbMesIni.ItemIndex+1));
  sPeriodoFin := QuotedStr(IntToStr(speAnoFin.Value) +'/'+ PoeZero(cmbMesFin.ItemIndex+1));

  if (rgProcesso.ItemIndex = 0) then
    sNomeTabela := 'PREVIAFOLPAG' 
  else
    sNomeTabela := 'HISTRUBSAL';

  dtmRelatorios.qryResFol.Close;
  with (dtmRelatorios.qryResFol.SQL) do
  begin
    Clear;
    Add('SELECT /*+ OPTIMIZER_MODE RULE */ DISTINCT');
    Add('  PJ.RAZAOSOCIAL AS EMPRESA,');
    Add('  DECODE(PJ.NUMDOCUMENTO,NULL,NULL,''CNPJ: '' || PJ.NUMDOCUMENTO) AS CGCCPF,');
    Add('  RTRIM(DECODE(RTRIM(ESTADUAL.NUMDOCUMENTO),NULL,');
    Add('    DECODE(RTRIM(MUNICIPAL.NUMDOCUMENTO),NULL,NULL,');
    Add('    ''Inscrição Municipal: ''|| MUNICIPAL.NUMDOCUMENTO),');
    Add('    ''Inscrição Estadual: '' || ESTADUAL.NUMDOCUMENTO)) AS ESTADUALMUNICIPAL,');
    Add('  RTRIM(E.LOGRADOURO) ||'', ''|| E.NUMERO || DECODE(E.COMPLEMENTO,NULL,NULL,'' - '' ||');
    Add('    RTRIM(E.COMPLEMENTO)) ||'' - ''|| RTRIM(E.BAIRRO) ||'' - ''|| RTRIM(CIDADES.NOME) ||'' - CEP:''||');
    Add('    RTRIM(SUBSTR(E.CEP,1,5)) ||''-''|| RTRIM(SUBSTR(E.CEP,6,3)) AS ENDERECO,');
    Add('  ES.CODESTADO AS UF,');
    Add('  DECODE(P.FLGDESCONTO,0,''PROVENTOS'',1,''DESCONTOS'',''OUTROS'') AS PROVENTODESCONTO,');
    Add('  P.FLGDESCONTO AS TIPOPROVDESC,');
    Add('  RTRIM(RP.DESCRPROVDESC) AS RUBRICA,');
    Add('  RTRIM(RP.CODPROVDESC) AS CODRUBRICA,');
    Add('  (' +QuotedStr(cmbMesIni.Items[cmbMesIni.ItemIndex]+' de '+speAnoIni.Text)+
      ') AS MES_REF_INI,');

    if (chkTipoIntervalo.Checked) and (sPeriodoIni <> sPeriodoFin) then
      Add('  (' +QuotedStr(' a '+cmbMesFin.Items[cmbMesFin.ItemIndex]+' de '+speAnoFin.Text)+
        ') AS MES_REF_FIN,')
    else
      Add('  ('' '') AS MES_REF_FIN,');

    if (cmbAgruparPor.ItemIndex = 2) then
      Add('  CC.CODCENTROCUSTO,');

    if (cmbAgruparPor.ItemIndex in [1,2]) then
      Add('  CC.NOME AS NOMEGRUPO,');

    if (cmbAgruparPor.ItemIndex = 3) then
      Add('  PR.DESCPROGRAMA AS NOMEGRUPO,');

    Add('  QTDE_FUNC.QTDE AS QTDE_FUNCIONARIOS,');
    Add('  DECODE(P.FLGDESCONTO,0,HIST.VALOR,0) AS VALORPROVENTO,');
    Add('  DECODE(P.FLGDESCONTO,1,HIST.VALOR,0) AS VALORDESCONTO,');
    Add('  HIST.VALOR,');
    Add('  DECODE(P.FLGDESCONTO,0,HIST.VALOR,1,-HIST.VALOR,0) AS VALORREAL,');
    Add('  HIST.QTDE_FUNC_RUB');
    // ------------------------------------------------------------------ //
    Add('FROM');
    Add('  '+sNomeTabela+' H, PESSOA PJ, ENDPESS E, RUBRICAXPESS RP, PROVDESC P,');
    Add('  FUNCIONARIO F, CIDADES, ESTADO ES,'+
      IFF((cmbAgruparPor.ItemIndex <> 0),' CENTCUST CC,','')+' MOTIVO MO,'+
      IFF((cmbAgruparPor.ItemIndex  = 3),' PROGRAMA PR,',''));
    // ------------------------------------------------------------------ //
    // Total de funcionários que compuseram  a Folha
    if (cmbAgruparPor.ItemIndex <> 0) then // Agrupando por Centro de Custo
    begin
      Add('  (SELECT FP.IDFILIALPESSOA, '+
        IFF((cmbAgruparPor.ItemIndex  = 3),'CC.IDPROGRAMA, ','CC.CODCENTROCUSTO, ')+
        'COUNT(PESSOAS.IDPESSOA) QTDE');
      Add('   FROM   CENTCUST CC, FILIALPESSOA FP,');
      // Pessoas para o período
      Add('     (SELECT DISTINCT F.IDESTAB, F.IDPESSOA, F.CODCENTROCUSTO');
      Add('      FROM   '+sNomeTabela+' H, FUNCIONARIO F');
      Add('      WHERE');
      // Estabelecimento selecionado
      if (Trim(dblkcbEstab.Text) <> '') then
        Add('        (F.IDESTAB    = ' +qryEstab.FieldByName('IDPESSOA').asString+ ') AND')
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

      Add('        (F.IDEMPRESA  = ' +IntToStr(Sistema.IdEmpresa)+ ') AND');
      Add('        (H.IDPESSJUR  = ' +IntToStr(Sistema.IdEmpresa)+ ') AND');

      if (chkTipoIntervalo.Checked) and (sPeriodoIni <> sPeriodoFin) then
        Add('        (H.MES  BETWEEN ' +sPeriodoIni+ ' AND ' +sPeriodoFin+ ') AND')
      else
        Add('        (H.MES        = ' +sPeriodoIni+ ') AND');

      if (sCodTipoFolhaSel <> '') then
        if (Pos(',',sCodTipoFolhaSel) > 0) then
          Add('        (H.IDMOTIVO  IN (' +sCodTipoFolhaSel+ ')) AND')
        else
          Add('        (H.IDMOTIVO   = ' +sCodTipoFolhaSel+ ') AND');

      Add('        (F.IDPESSOA   = H.IDPESSOA)) PESSOAS');
//      Add('      GROUP BY');
//      Add('        F.IDESTAB, F.IDPESSOA, F.CODCENTROCUSTO) PESSOAS');
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
      Add('     ' +IFF((cmbAgruparPor.ItemIndex  = 3),'CC.IDPROGRAMA, ','CC.CODCENTROCUSTO, ')+
          'FP.IDFILIALPESSOA) QTDE_FUNC,');
    end
    else // Não Agrupando por Centro de Custo
    begin
      Add('  (SELECT FP.IDFILIALPESSOA, COUNT(PESSOAS.IDPESSOA) QTDE');
      Add('   FROM   FILIALPESSOA FP,');
      // Pessoas para o período
      Add('     (SELECT DISTINCT F.IDESTAB, F.IDPESSOA');
      Add('      FROM   '+sNomeTabela+' H, FUNCIONARIO F');
      Add('      WHERE');
      // Estabelecimento selecionado
      if (Trim(dblkcbEstab.Text) <> '') then
        Add('        (F.IDESTAB    = ' +qryEstab.FieldByName('IDPESSOA').asString+ ') AND')
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

      Add('        (F.IDEMPRESA  = ' +IntToStr(Sistema.IdEmpresa)+ ') AND');
      Add('        (H.IDPESSJUR  = ' +IntToStr(Sistema.IdEmpresa)+ ') AND');

      if (chkTipoIntervalo.Checked) and (sPeriodoIni <> sPeriodoFin) then
        Add('        (H.MES  BETWEEN ' +sPeriodoIni+ ' AND ' +sPeriodoFin+ ') AND')
      else
        Add('        (H.MES        = ' +sPeriodoIni+ ') AND');

      if (sCodTipoFolhaSel <> '') then
        if (Pos(',',sCodTipoFolhaSel) > 0) then
          Add('        (H.IDMOTIVO  IN (' +sCodTipoFolhaSel+ ')) AND')
        else
          Add('        (H.IDMOTIVO   = ' +sCodTipoFolhaSel+ ') AND');

      Add('        (F.IDPESSOA   = H.IDPESSOA)) PESSOAS');
//      Add('      GROUP BY');
//      Add('        F.IDESTAB, F.IDPESSOA) PESSOAS');
      Add('   WHERE');
      Add('     (FP.IDFILIALPESSOA = PESSOAS.IDESTAB)');
      Add('   GROUP BY');
      Add('     FP.IDFILIALPESSOA) QTDE_FUNC,');
    end;
    // ------------------------------------------------------------------ //
    // Rubricas da Folha
    Add('  (SELECT');
    Add('     '+IFF(cmbAgruparPor.ItemIndex in [1,2],'F.CODCENTROCUSTO, ',
      IFF(cmbAgruparPor.ItemIndex = 3,'CC.IDPROGRAMA, ',''))+
      'F.IDESTAB AS IDPESSOA, COUNT(*) AS QTDE_FUNC_RUB, H.IDRUBRICA,');
    Add('     SUM(H.VALORPROVENTO) AS VALOR');
    Add('   FROM '+sNomeTabela+' H, RUBRICAXPESS RP, FUNCIONARIO F' +
      IFF(cmbAgruparPor.ItemIndex = 3,', CENTCUST CC',''));
    Add('   WHERE');

    // Estabelecimento selecionado
    if (Trim(dblkcbEstab.Text) <> '') then
      Add('     (F.IDESTAB    = '+qryEstab.FieldByName('IDPESSOA').asString+') AND')
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
        Add('     (H.CODPROVDESC IN (' +sCodRubricaSel+ ')) AND')
      else
        Add('     (H.CODPROVDESC  = ' +sCodRubricaSel+ ') AND');

    Add('     (F.IDEMPRESA  = ' +IntToStr(Sistema.IdEmpresa)+ ') AND');
    Add('     (RP.IDPESSOA  = ' +IntToStr(Sistema.IdEmpresa)+ ') AND');
    Add('     (H.IDPESSJUR  = ' +IntToStr(Sistema.IdEmpresa)+ ') AND');

    if (chkTipoIntervalo.Checked) and (sPeriodoIni <> sPeriodoFin) then
      Add('     (H.MES  BETWEEN ' +sPeriodoIni+ ' AND ' +sPeriodoFin+ ') AND')
    else
      Add('     (H.MES        = ' +sPeriodoIni+ ') AND');      

    if (sCodTipoFolhaSel <> '') then
      if (Pos(',',sCodTipoFolhaSel) > 0) then
        Add('     (H.IDMOTIVO  IN (' +sCodTipoFolhaSel+ ')) AND')
      else
        Add('     (H.IDMOTIVO   = ' +sCodTipoFolhaSel+ ') AND');

    Add('     (RP.IDRUBRICA = H.IDRUBRICA) AND');
    Add('     (H.IDPESSOA   = F.IDPESSOA)');

    if (cmbAgruparPor.ItemIndex = 3) then
    begin
      Add('     AND (CC.IDEMPRESA     = '+IntToStr(Sistema.IdEmpresa)+')');
      Add('     AND (F.CODCENTROCUSTO = CC.CODCENTROCUSTO)');
    end;

    Add('   GROUP BY');
    Add('     ' +IFF(cmbAgruparPor.ItemIndex in [1,2], 'F.CODCENTROCUSTO, ',
      IFF(cmbAgruparPor.ItemIndex = 3,'CC.IDPROGRAMA, ',''))+
      'H.IDRUBRICA, F.IDESTAB) HIST,');
    // ------------------------------------------------------------------------------- //
    Add('  (SELECT D.IDPESSOA, TD.CODDOCUMENTO, D.NUMDOCUMENTO');
    Add('   FROM   DOCPESSOA D, TIPODOCOFICIAL TD');
    Add('   WHERE (TD.SIGLADOCUMENTO = ''ESTADUAL:'') AND');
    Add('         (D.IDPESSOA        = '+qryEstab.FieldByName('IDPESSOA').asString+') AND');
    Add('         (TD.IDDOCUMENTO    = D.IDDOCUMENTO)) ESTADUAL,');
    // -------------------------------------------------------------------------- //
    Add('  (SELECT D.IDPESSOA, TD.CODDOCUMENTO, D.NUMDOCUMENTO');
    Add('   FROM   DOCPESSOA D, TIPODOCOFICIAL TD');
    Add('   WHERE (TD.SIGLADOCUMENTO = ''MUNICIPAL:'') AND');
    Add('         (D.IDPESSOA        = '+qryEstab.FieldByName('IDPESSOA').asString+') AND');
    Add('         (TD.IDDOCUMENTO    = D.IDDOCUMENTO)) MUNICIPAL');
    // ------------------------------------------------------------------ //
    Add('WHERE');

    // Estabelecimento selecionado
    if (Trim(dblkcbEstab.Text) <> '') then
    begin
      Add('  (PJ.IDPESSOA       = ' +qryEstab.FieldByName('IDPESSOA').asString+ ') AND');
      Add('  (F.IDESTAB         = ' +qryEstab.FieldByName('IDPESSOA').asString+ ') AND');
    end
    else
    begin
      // Estabelecimento(s) habilitados para o usuário
      if (sUsuXfilial <> '') then
        if (Pos(',',sUsuXfilial) > 0) then
        begin
          Add('  (PJ.IDPESSOA      IN ' +sUsuXfilial+ ') AND');
          Add('  (F.IDESTAB        IN ' +sUsuXfilial+ ') AND');
        end
        else
        begin
          Add('  (PJ.IDPESSOA       = ' +sUsuXfilial+ ') AND');
          Add('  (F.IDESTAB         = ' +sUsuXfilial+ ') AND');
        end;
    end;

    // Testa se o usuário quer somente PROVENTOS e DESCONTOS ou + OUTROS
    if (rgRubApoio.ItemIndex = 1) then
      Add('  (P.FLGDESCONTO     < 2) AND');

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

    if (sCodTipoFolhaSel <> '') then
      if (Pos(',',sCodTipoFolhaSel) > 0) then
        Add('  (MO.IDMOTIVO      IN (' +sCodTipoFolhaSel+ ')) AND')
      else
        Add('  (MO.IDMOTIVO       = ' +sCodTipoFolhaSel+ ') AND');

    if (cmbAgruparPor.ItemIndex <> 0) then
      Add('  (CC.IDEMPRESA      = ' +IntToStr(Sistema.IdEmpresa)+ ') AND');

    Add('  (F.IDEMPRESA       = ' +IntToStr(Sistema.IdEmpresa)+ ') AND');
    Add('  (RP.IDPESSOA       = ' +IntToStr(Sistema.IdEmpresa)+ ') AND');

    if (chkTipoIntervalo.Checked) and (sPeriodoIni <> sPeriodoFin) then
      Add('  (H.MES       BETWEEN ' +sPeriodoIni+ ' AND ' +sPeriodoFin+ ') AND')
    else
      Add('  (H.MES             = ' +sPeriodoIni+ ') AND');

    Add('  (H.IDPESSJUR       = ' +IntToStr(Sistema.IdEmpresa)+ ') AND');
    Add('  (PJ.IDPESSOA       = HIST.IDPESSOA)  AND');
    Add('  (RP.IDRUBRICA      = HIST.IDRUBRICA) AND');
    Add('  (P.IDPROVENTO      = HIST.IDRUBRICA) AND');
    Add('  (PJ.IDPESSOA       = QTDE_FUNC.IDFILIALPESSOA) AND');

    // Testa se está agrupando por Centro de Custo
    if (cmbAgruparPor.ItemIndex <> 0) then
    begin
      if (cmbAgruparPor.ItemIndex = 3) then
      begin
        Add('  (QTDE_FUNC.IDPROGRAMA = CC.IDPROGRAMA) AND');
        Add('  (CC.IDPROGRAMA        = PR.IDPROGRAMA) AND');
        Add('  (CC.IDPROGRAMA        = HIST.IDPROGRAMA) AND');
      end
      else
      begin
        Add('  (QTDE_FUNC.CODCENTROCUSTO = F.CODCENTROCUSTO) AND');
        Add('  (F.CODCENTROCUSTO         = HIST.CODCENTROCUSTO) AND');
      end;

      Add('  (CC.CODCENTROCUSTO = F.CODCENTROCUSTO) AND');
    end;

    Add('  (PJ.IDPESSOA       = F.IDESTAB) AND');
    Add('  (PJ.IDPESSOA       = E.IDPESSOA) AND');
    Add('  (PJ.IDENDCOMERCIAL = E.IDENDERECO) AND');
    Add('  (E.IDCIDADES       = CIDADES.IDCIDADES) AND');
    Add('  (CIDADES.IDESTADO  = ES.IDESTADO) AND');
    Add('  (MO.IDMOTIVO       = H.IDMOTIVO) AND');
    Add('  (F.IDPESSOA        = H.IDPESSOA) AND');
    Add('  (H.IDRUBRICA       = RP.IDRUBRICA) AND');
    Add('  (H.IDRUBRICA       = P.IDPROVENTO) AND');
    Add('  (PJ.IDPESSOA       = ESTADUAL.IDPESSOA(+)) AND');
    Add('  (PJ.IDPESSOA       = MUNICIPAL.IDPESSOA(+))');
    Add('ORDER BY');
    case (cmbAgruparPor.ItemIndex) of
      0   : Add('  TIPOPROVDESC, RUBRICA');
      1,3 : Add('  NOMEGRUPO, TIPOPROVDESC, RUBRICA');
      2   :
      begin
        // Máscara do C. de Custo Sintético
        NumCaracCCSintetico;
        Add('  SUBSTR(CODCENTROCUSTO,1,' +IntToStr(byNumCarMascCCSint)+ '), TIPOPROVDESC, '+
            'UPPER(RUBRICA)');
      end;
    end;

    //SaveToFile('c:\qry.txt');
    SaveToFile(Sistema.RetornaCaminhoArquivos(Sistema.IdEmpresa)+'\qry.txt');//Ádler Teodoro de Souza SOL 109421 KINTANA 496332
  end;

  // Monta Query Principal
  frmAguarde.Mostra('Resumo da Folha de Pagamento');
  frmAguarde.Pos := 0;

  dtmRelatorios.qryResFol.Open;
  if not(dtmRelatorios.qryResFol.IsEmpty) then
  begin
    if (cmbAgruparPor.ItemIndex = 2) then
    begin
      if not(dtmRelatorios.qryResFolAux.IsEmpty) then
        dtmRelatorios.qryResFolAux.CancelUpdates;
      dtmRelatorios.qryResFolAux.Close;
      dtmRelatorios.qryResFolAux.Open;

      // Aponto o UpdateSQL para a query auxiliar
      dtmRelatorios.qryResFolAux.UpdateObject := dtmRelatorios.updSQL;
      dtmRelatorios.dsResFol.DataSet := dtmRelatorios.qryResFolAux;

      AgrupaCCustoSintetico;

      dtmRelatorios.qryResFolAux.First;
    end
    else
      dtmRelatorios.dsResFol.DataSet := dtmRelatorios.qryResFol;
  end
  else
  begin
    ModalResult := mrNone;
    frmAguarde.Apaga;
    MsgDlg('Não há dados a serem exibidos.'+CR_LF+'Verifique.', 'Aviso',
      mtInformation, [mbOk,mbHelp], 0);
    exit;
  end;

  with (dtmRelatorios) do
  begin
    iTipoRel := cmbAgruparPor.ItemIndex;

    // Rodapé de Autorizações é impresso ou não
    ResFolrpLabel10.Visible := (rgAutoriza.ItemIndex = 0);
    ResFolrpLabel11.Visible := (rgAutoriza.ItemIndex = 0);
    ResFolrpLabel12.Visible := (rgAutoriza.ItemIndex = 0);
    ResFolrpLabel13.Visible := (rgAutoriza.ItemIndex = 0);
    ResFolrpLabel14.Visible := (rgAutoriza.ItemIndex = 0);
    ResFolrpShape1.Visible := (rgAutoriza.ItemIndex = 0);
    ResFolrpShape2.Visible := (rgAutoriza.ItemIndex = 0);
    ResFolrpShape3.Visible := (rgAutoriza.ItemIndex = 0);
    ResFolrpShape4.Visible := (rgAutoriza.ItemIndex = 0);

    // Indicativo dos Tipos de Folha selecionados
    sTipoFolha:=''; K:=1;
    for I:=0 to chklstTipoFolha.Items.Count-1 do
      if (chklstTipoFolha.Checked[I]) then
      begin
        if (K > 1) then
          sTipoFolha := sTipoFolha+' - ';
        sTipoFolha := sTipoFolha + chklstTipoFolha.Items[I];
        Inc(K);
      end;
    rpResFolLabelTipoPag.Caption := sTipoFolha;

    if (iTipoRel = 0) then
    begin
      rpResFolLine4.Pen.Width := 2;
      ResFolppHeaderBand5.Height := 38.629;
    end
    else
    begin
      rpResFolLine4.Pen.Width := 1;
      ResFolppHeaderBand5.Height := 36.629;
    end;

    ResFolppGroupHeaderBandCENTROCUSTO.Visible := (iTipoRel > 0);
    rpResFolLine5.Visible := (iTipoRel > 0);
    ResFolrpResfolLine2.Visible := (iTipoRel = 0);
    rpResFolLine3.Visible := (iTipoRel = 0);
    ResFolrpLabel4.Visible := (iTipoRel = 0);
    ResFolrpLabel6.Visible := (iTipoRel = 0);
    ResFolrpLabel7.Visible := (iTipoRel = 0);
    rpResFolLabel12.Visible := (iTipoRel = 0);

    rpResFolLblPROCESSO.Visible := (rgImprimeTipoProcesso.ItemIndex = 0);
    if (rpResFolLblPROCESSO.Visible) then
      if (sNomeTabela = 'PREVIAFOLPAG') then
        rpResFolLblPROCESSO.Caption := 'Processo: PRÉVIA'
      else
        rpResFolLblPROCESSO.Caption := 'Processo: FINAL';
  end;
end;

procedure TfrmResFol.NumCaracCCSintetico;
var
  c: byte;
begin
  qryAux.Close;
  qryAux.ParamByName('IDEMPRESA').asInteger := Sistema.IdEmpresa;
  qryAux.Open;

  c := 0;
  if not(qryAux.IsEmpty) then
  repeat
    Inc(c);
  until (qryAux.FieldByName('MASCARACC').asString[c+1] = '.');

  byNumCarMascCCSint := c;
end;

procedure TfrmResFol.GeraListaCodCCusto;
var
  c: integer;
  lstCodCCustoAux, lstNomeCCustoAux: TStringList;
begin
  lstCodCCustoAux := TStringList.Create;
  lstNomeCCustoAux := TStringList.Create;

  repeat
    if (Length(qryAux.FieldByName('CODCENTROCUSTO').asString) = byNumCarMascCCSint) then
    begin
      lstCodCCustoAux.Add(qryAux.FieldByName('CODCENTROCUSTO').asString);
      lstNomeCCustoAux.Add(qryAux.FieldByName('NOME').asString);
    end;
    qryAux.Next;
  until (qryAux.EOF);

  lstCodCCusto.Clear;
  lstNomeCCusto.Clear;
  with (dtmRelatorios) do
  begin
    for c:=0 to lstCodCCustoAux.Count-1 do
    begin
      // Pego o Dígito Identificador do C. de Custo Sintético atual
      sCodCCSintAtual := Copy(lstCodCCustoAux[c], 1, byNumCarMascCCSint);

      if (qryResFol.Locate('CODCENTROCUSTO', sCodCCSintAtual, [loPartialKey])) then
      begin
        lstCodCCusto.Add(lstCodCCustoAux[c]);
        lstNomeCCusto.Add(lstNomeCCustoAux[c]);
      end;
    end;
    qryResFol.First;
  end;

  lstCodCCustoAux.Free;
  lstNomeCCustoAux.Free;
end;

procedure TfrmResFol.GeraNumFuncCCusto;
var
  c: byte;
  lstListaCC: TStringList;
begin
  lstListaCC := TStringList.Create;
  lstNumFunc.Clear;

  with (dtmRelatorios) do
  begin
    for c:=0 to lstCodCCusto.Count-1 do
    begin
      // Pego o Dígito Identificador do C. de Custo Sintético atual
      sCodCCSintAtual := Copy(lstCodCCusto[c], 1, byNumCarMascCCSint);

      iQtdeFunc := 0;
      repeat
        // Pego o C. de Custo atual
        sCodCCAtual := Copy(qryResFol.FieldByName('CODCENTROCUSTO').asString, 1, byNumCarMascCCSint);

        if (lstListaCC.IndexOf(qryResFol.FieldByName('CODCENTROCUSTO').asString) = -1) and
           (sCodCCAtual = sCodCCSintAtual) then
        begin
          // Soma cada Rubrica do C. de Custo Sintético atual
          iQtdeFunc := iQtdeFunc + qryResFol.FieldByName('QTDE_FUNCIONARIOS').asInteger;

          lstListaCC.Add(qryResFol.FieldByName('CODCENTROCUSTO').asString);
        end;

        qryResFol.Next;

        // Pego o primeiro Dígito Identificador do C. de Custo Analítico atual
        sCodCCAtual := Copy(qryResFol.FieldByName('CODCENTROCUSTO').asString, 1, byNumCarMascCCSint);
      until (qryResFol.EOF) or (sCodCCAtual <> sCodCCSintAtual);

      // Adiciono a quantidade gerada à lista
      lstNumFunc.Add(IntToStr(iQtdeFunc));
    end;
    qryResFol.First;
  end;            
  lstListaCC.Free;
end;

procedure TfrmResFol.AgrupaCCustoSintetico;
var
  dValor: double;
  c: integer;
  iTipoRubrica: integer;
begin
  with (dtmRelatorios) do
  begin
    if not(qryResFol.IsEmpty) then
    begin
      // Geração da lista dos códigos C. de Custos válidos
      GeraListaCodCCusto;

      // Geração dos Números de Funcionários em cada C. de Custo
      GeraNumFuncCCusto;

      // Geração de todas as linhas de Rubricas
      for c:=0 to lstCodCCusto.Count-1 do
      begin
        // Pego o Dígito Identificador do C. de Custo Sintético atual
        sCodCCSintAtual := Copy(lstCodCCusto[c], 1, byNumCarMascCCSint);
        // Apago a lista de Rubricas já processadas
        lstRubProcess.Clear;

        repeat
          sCodRub := qryResFol.FieldByName('CODRUBRICA').asString;
          iQtdeFunc:=0; dValor:=0;

          qryResFolAux.Insert;
          qryResFolAux.FieldByName('EMPRESA').asString := qryResFol.FieldByName('EMPRESA').asString;
          qryResFolAux.FieldByName('CGCCPF').asString := qryResFol.FieldByName('CGCCPF').asString;
          qryResFolAux.FieldByName('UF').asString := qryResFol.FieldByName('UF').asString;
          qryResFolAux.FieldByName('ESTADUALMUNICIPAL').asString := qryResFol.FieldByName('ESTADUALMUNICIPAL').asString;
          qryResFolAux.FieldByName('ENDERECO').asString := qryResFol.FieldByName('ENDERECO').asString;
          qryResFolAux.FieldByName('PROVENTODESCONTO').asString := qryResFol.FieldByName('PROVENTODESCONTO').asString;
          qryResFolAux.FieldByName('TIPOPROVDESC').asInteger := qryResFol.FieldByName('TIPOPROVDESC').asInteger;
          qryResFolAux.FieldByName('RUBRICA').asString := qryResFol.FieldByName('RUBRICA').asString;
          qryResFolAux.FieldByName('CODRUBRICA').asString := qryResFol.FieldByName('CODRUBRICA').asString;
          qryResFolAux.FieldByName('MES_REF_INI').asString := qryResFol.FieldByName('MES_REF_INI').asString;
          qryResFolAux.FieldByName('MES_REF_FIN').asString := qryResFol.FieldByName('MES_REF_FIN').asString;
          qryResFolAux.FieldByName('NOMEGRUPO').asString := lstNomeCCusto[c];
          qryResFolAux.FieldByName('QTDE_FUNCIONARIOS').asString := lstNumFunc[c];

          // Somo os Valores de cada rubrica para o C. de Custo Sintético atual
          iTipoRubrica := qryResFol.FieldByName('TIPOPROVDESC').asInteger;
          repeat
            if (lstRubProcess.IndexOf(sCodRub) = -1) and
               (qryResFol.FieldByName('CODRUBRICA').asString = sCodRub) then
            begin
              iQtdeFunc := iQtdeFunc + qryResFol.FieldByName('QTDE_FUNC_RUB').asInteger;
              dValor := dValor + qryResFol.FieldByName('VALOR').asFloat;
            end;

            qryResFol.Next;

            // Pego o primeiro Dígito Identificador do C. de Custo Analítico atual
            sCodCCAtual := Copy(qryResFol.FieldByName('CODCENTROCUSTO').asString, 1, byNumCarMascCCSint);
          until (qryResFol.EOF) or (sCodCCAtual <> sCodCCSintAtual) or
                (sCodRub <> qryResFol.FieldByName('CODRUBRICA').asString);

          // Informo que a Rubrica atual não deve ser mais considerada
          lstRubProcess.Add(sCodRub);

          qryResFolAux.FieldByName('QTDE_FUNC_RUB').asInteger := iQtdeFunc;
          qryResFolAux.FieldByName('VALOR').asFloat := dValor;

          case (iTipoRubrica) of
            0 : begin
                  qryResFolAux.FieldByName('VALORREAL').asFloat := dValor;
                  qryResFolAux.FieldByName('VALORPROVENTO').asFloat := dValor;
                  qryResFolAux.FieldByName('VALORDESCONTO').asFloat := 0;
                end;
            1 : begin
                  qryResFolAux.FieldByName('VALORREAL').asFloat := -dValor;
                  qryResFolAux.FieldByName('VALORPROVENTO').asFloat := 0;
                  qryResFolAux.FieldByName('VALORDESCONTO').asFloat := dValor;
                end;
          end;

          qryResFolAux.Post;
        until (qryResFol.EOF) or (sCodCCAtual <> sCodCCSintAtual);
      end;
    end
    else
    begin
      qryResFolAux.Insert;
      qryResFolAux.FieldByName('EMPRESA').asString := '';
      qryResFolAux.Post;
    end;
  end;
end;

procedure TfrmResFol.HabilitaBtOk;
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

  bbtnConfirmar.Enabled := (Trim(dblkcbEstab.Text) <> '') and (bSelecionado);
end;

end.
