// *****************************************************************************
// ***************************** REGISTRO DE ALTERAÇÕES ************************
// *****************************************************************************
// Autor(a)    :  Ádler Teodoro de Souza
// Data        :  19/02/2009
// Pendência   : SOL 109421 KINTANA 496332
// Descricao   :  Alteração de gravação de arquivos de log na raiz do disco C: .
//------------------------------------------------------------------------------
unit fParamGerencial;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs, MAHlpBtn,
  StdCtrls, Buttons, TB97Tlbr, TB97, ExtCtrls, Db, DBTables, Wwquery, wwdblook, Spin,
  checklst, IvDictio, IvMulti, IvEMulti, ComCtrls, IniFiles, fSairAjuda, Grids,
  DBGrids, DBClient, uCMClientDataSet;

type
  TfrmParamGerencial = class(TfrmSairAjuda)
    qryEstab: TwwQuery;
    qryMotivo: TwwQuery;
    pgctrGerencial: TPageControl;
    tbshGeral: TTabSheet;
    tbshDespPessoal: TTabSheet;
    gbxEstab: TGroupBox;
    dblkcbEstab: TwwDBLookupCombo;
    gbxSetor: TGroupBox;
    edSetor: TEdit;
    gbxAnoMesRef: TGroupBox;
    cmbMes: TComboBox;
    speAno: TSpinEdit;
    gbxTipoPapel: TGroupBox;
    cmbTipoPapel: TComboBox;
    gbxOrdemImpr: TGroupBox;
    Label1: TLabel;
    Label2: TLabel;
    Label3: TLabel;
    cmbOrdemRelEmprTempServ: TComboBox;
    cmbOrdemDistribPessSal: TComboBox;
    cbmOrdermDemDespPessoal: TComboBox;
    gbxRubricas: TGroupBox;
    Label4: TLabel;
    Paginas: TPageControl;
    tbshRemCCusto: TTabSheet;
    chklstRubrica1: TCheckListBox;
    tbshDistribGratifCCusto: TTabSheet;
    chklstRubrica2: TCheckListBox;
    tbshTotFolha: TTabSheet;
    chklstRubrica3: TCheckListBox;
    edCodRubricas: TEdit;
    sbtnMarcarRub: TBitBtn;
    bbtnConfirmar: TBitBtn;
    ToolbarSep971: TToolbarSep97;
    gbxTipoPag: TGroupBox;
    dblkcbMotivo: TwwDBLookupCombo;
    gbxSituacoes: TGroupBox;
    chklstSituacoes: TCheckListBox;
    rgApanhaDataTrein: TRadioGroup;
    rgTipoDataTrein: TRadioGroup;
    gbxComplementares: TGroupBox;
    sgrInfComplem: TStringGrid;
    gbxRubricas2: TGroupBox;
    Label5: TLabel;
    chklstRubrica4: TCheckListBox;
    edCodRubricas2: TEdit;
    sbtnMarcarRub2: TBitBtn;
    procedure FormCreate(Sender: TObject);
    procedure bbtnConfirmarClick(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure sgrInfComplemKeyPress(Sender: TObject; var Key: Char);
    procedure dblkcbEstabChange(Sender: TObject);
    procedure chklstRubrica1DrawItem(Control: TWinControl; Index: Integer; Rect: TRect;
      State: TOwnerDrawState);
    procedure PaginasChange(Sender: TObject);
    procedure sbtnMarcarRubClick(Sender: TObject);
    procedure chklstRubrica1ClickCheck(Sender: TObject);
    procedure chklstSituacoesClickCheck(Sender: TObject);
    procedure chklstRubrica4ClickCheck(Sender: TObject);
    procedure sbtnMarcarRub2Click(Sender: TObject);
    procedure rgApanhaDataTreinClick(Sender: TObject);
  private
    ListaCodSitFunc: TStringList;
    rTotalFolha: real;
    sMesRef, sCodRubricaSel2, sCodRubricaSel3, sCodRubricaSel4, sCodSitFuncSel,
    sOrdemRelA: string;

    procedure GravaDadosDemDespPessoal;
    procedure LeArquivoConfig;
    procedure GravaArquivoConfig;
    procedure HabilitaBtOk;
  end;

var
  frmParamGerencial: TfrmParamGerencial;

implementation

uses uSistema, uMensErro, uDataBase, fAguarde, dBaseDados,
  uFuncoesUteisRH, uComumRelats, UsoGeralRH, dRelatorios2;

{$R *.DFM}

procedure TfrmParamGerencial.FormCreate(Sender: TObject);
var
  iPos: integer;
begin
  inherited;
  if not(Assigned(ListaCodRubrica)) then
    ListaCodRubrica := TStringList.Create;
  if not(Assigned(ListaCodCCusto)) then
    ListaCodCCusto := TStringList.Create;
  ListaCodSitFunc := TStringList.Create;

  cmbTipoPapel.Items.Assign (dtmRelatorios2.rpGerencial.PrinterSetup.PaperNames);

  iPos := ProcuraStList (cmbTipoPapel.Items,'A4');
  if (iPos = -1) then
    cmbTipoPapel. ItemIndex := 0
  else
    cmbTipoPapel. ItemIndex := iPos;

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
  qryMotivo.Open;

  // Preenche ChkList das Situações de Afastamento
  chklstSituacoes.Items.Clear;
  with (dtmBaseDados.qry) do
  begin
    SQL.Clear;
    SQL.Add('SELECT');
    SQL.Add('  IDSITFUNC, DESCRICAO');
    SQL.Add('FROM');
    SQL.Add('  SITFUNC');
    SQL.Add('WHERE');
    SQL.Add('  (FLGUSO IN (''R'',''G'')) AND');
    SQL.Add('  (TIPOSIT = ''F'')');
    SQL.Add('ORDER BY');
    SQL.Add('  DESCRICAO');
    Open;
    while not(EOF) do
    begin
      ListaCodSitFunc.Add(FieldByName('IDSITFUNC').asString);
      chklstSituacoes.Items.Add(FieldByName('DESCRICAO').asString);
      Next;
    end;
  end;

  // Preenche ChkList das Rubricas
  chklstRubrica1.Items.Clear;
  chklstRubrica2.Items.Clear;
  chklstRubrica3.Items.Clear;
  chklstRubrica4.Items.Clear;
  ListaCodRubrica.Clear;  
  with (dtmBaseDados.qry) do
  begin
    SQL.Clear;
    SQL.Add('SELECT');
    SQL.Add('  RP.CODPROVDESC, RP.DESCRPROVDESC');
    SQL.Add('FROM');
    SQL.Add('  RUBRICAXPESS RP, PROVDESC PD');
    SQL.Add('WHERE');
    SQL.Add('  (RP.IDPESSOA        = ' +IntToStr(Sistema.IdEmpresa)+ ') AND');
    SQL.Add('  (PD.FLGTPRUBRICA LIKE ''%F%'') AND');
    SQL.Add('  (PD.IDPROVENTO      = RP.IDRUBRICA)');
    SQL.Add('ORDER BY');
    SQL.Add('  UPPER(DESCRPROVDESC)');
    Open;
    while not(EOF) do
    begin
      ListaCodRubrica.Add(FieldByName('CODPROVDESC').asString);
      chklstRubrica1.Items.Add(FieldByName('DESCRPROVDESC').asString);
      chklstRubrica2.Items.Add(FieldByName('DESCRPROVDESC').asString);
      chklstRubrica3.Items.Add(FieldByName('DESCRPROVDESC').asString);
      chklstRubrica4.Items.Add(FieldByName('DESCRPROVDESC').asString);
      Next;
    end;
  end;

  // Carrega alterações nas opções feitas anteriormente
  LeArquivoConfig;

  // Monto ChkList de C. de Custo
  with (dtmBaseDados.qry.SQL) do
  begin
    Clear;
    Add('SELECT');
    Add('  CODCENTROCUSTO,');
    Add('  DECODE (NOME,'''','''',NOME) || DECODE(CODREDUZIDO,'''','''','' (''||');
    Add('    RTRIM(CODREDUZIDO)||'')'') AS C_CUSTO');
    Add('FROM');
    Add('  CENTCUST');
    Add('WHERE');
    Add('  (IDEMPRESA    = '+IntToStr(Sistema.IdEmpresa)+') AND');
    Add('  (CODREDUZIDO IS NOT NULL)');
    Add('ORDER BY');
    case (cbmOrdermDemDespPessoal.ItemIndex) of
      0 : Add('  CODCENTROCUSTO');
      1 : Add('  C_CUSTO');
    end;
  end;
  dtmBaseDados.qry.Open;
  sgrInfComplem.ColWidths[0] :=  130;
  sgrInfComplem.Cells [0,1]  := 'Temporários/Autônomos';
  sgrInfComplem.Cells [0,2]  := 'Vale Transporte';
  sgrInfComplem.Cells [0,3]  := 'Aliment. com H. Extra';
  sgrInfComplem.Cells [0,4]  := 'Transp. com H. Extra';
  sgrInfComplem.Cells [0,5]  := 'Ass. Médica/Odonto';
  sgrInfComplem.Cells [0,6]  := 'Treinamento';

  ListaCodCCusto.Clear;
  for iPos:=1 to dtmBaseDados.qry.RecordCount do
  begin
    ListaCodCCusto.Add(dtmBaseDados.qry.FieldByName('CODCENTROCUSTO').asString);
    if (iPos > 1) then
      sgrInfComplem.ColCount := sgrInfComplem.ColCount+1;
    dtmBaseDados.qry.Next;
  end;
  dtmBaseDados.qry.First;
  for iPos:=1 to dtmBaseDados.qry.RecordCount do
  begin
    sgrInfComplem.Cells [iPos,0]  := Trim(dtmBaseDados.qry.FieldByName ('C_CUSTO').asString);
    sgrInfComplem.ColWidths[iPos] := (Length(sgrInfComplem.Cells [iPos,0]) * 7);
    dtmBaseDados.qry.Next;
  end;

  FazQuery(dtmBaseDados.qry,'SELECT NORMALINI, IDMOTIVO FROM PARAMRH');

  // Seleciono o motivo no PARAMRH como o Tipo de Pagamento Padrão
  if (qryMotivo.Locate('IDMOTIVO',dtmBaseDados.qry.FieldByName('IDMOTIVO').asString,[loCaseInsensitive])) then
  begin
    dblkcbMotivo.LookUpValue := qryMotivo.FieldByName('IDMOTIVO').Value;
    dblkcbMotivo.UpDate;
  end;

  // Valores iniciais dos Componentes
  cmbMes.ItemIndex := ExtraiMes(dtmBaseDados.qry.FieldByName('NORMALINI').asDateTime) - 1;
  speAno.Text:= Copy(dtmBaseDados.qry.FieldByName('NORMALINI').asString,7,4);
  Paginas.ActivePageIndex := 0;
  pgctrGerencial.ActivePageIndex := 0;
  cbmOrdermDemDespPessoal.ItemIndex := 0;
  cmbOrdemDistribPessSal.ItemIndex  := 2;
  cmbOrdemRelEmprTempServ.ItemIndex := 2;
end;

procedure TfrmParamGerencial.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  GravaArquivoConfig;

  ListaCodSitFunc.Free;

  dtmBaseDados.qry.Close;
  qryEstab.Close;
  qryMotivo.Close;
  inherited;
end;

procedure TfrmParamGerencial.chklstRubrica1DrawItem(Control: TWinControl; Index: Integer;
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

procedure TfrmParamGerencial.dblkcbEstabChange(Sender: TObject);
begin
  HabilitaBtOk;
end;

procedure TfrmParamGerencial.PaginasChange(Sender: TObject);
begin
  case (Paginas.ActivePageIndex) of
    0 : edCodRubricas.Text := sCodRubricaSel;
    1 : edCodRubricas.Text := sCodRubricaSel2;
    2 : edCodRubricas.Text := sCodRubricaSel3;
  end;
end;

procedure TfrmParamGerencial.sgrInfComplemKeyPress(Sender: TObject; var Key: Char);
begin
  if not(Key in ['0'..'9',DecimalSeparator,#13,#8]) then
    Key := #0;
end;

procedure TfrmParamGerencial.chklstSituacoesClickCheck(Sender: TObject);
begin
  InvalidateItemListBox(TCustomListBox(Sender),TCustomListBox(Sender).ItemIndex);
  HabilitaBtOk;
end;

procedure TfrmParamGerencial.chklstRubrica1ClickCheck(Sender: TObject);
begin
  case (Paginas.ActivePageIndex) of
    0 : begin
          CriaListaOpcoes (chklstRubrica1, ListaCodRubrica, sCodRubricaSel, ',', false);
          edCodRubricas.Text := sCodRubricaSel;
        end;
    1 : begin
          CriaListaOpcoes (chklstRubrica2, ListaCodRubrica, sCodRubricaSel2, ',', false);
          edCodRubricas.Text := sCodRubricaSel2;
        end;
    2 : begin
          CriaListaOpcoes (chklstRubrica3, ListaCodRubrica, sCodRubricaSel3, ',', false);
          edCodRubricas.Text := sCodRubricaSel3;
        end;
  end;      
  InvalidateItemListBox(TCustomListBox(Sender),TCustomListBox(Sender).ItemIndex);
  HabilitaBtOk;
end;

procedure TfrmParamGerencial.chklstRubrica4ClickCheck(Sender: TObject);
begin
  CriaListaOpcoes (chklstRubrica4, ListaCodRubrica, sCodRubricaSel4, ',', false);
  edCodRubricas2.Text := sCodRubricaSel4;
  InvalidateItemListBox(TCustomListBox(Sender),TCustomListBox(Sender).ItemIndex);
end;

procedure TfrmParamGerencial.sbtnMarcarRubClick(Sender: TObject);
begin
  edCodRubricas.Text := Trim(edCodRubricas.Text);

  case (Paginas.ActivePageIndex) of
    0 : begin
          VerificaOpcoes (chklstRubrica1, ListaCodRubrica, edCodRubricas.Text, ',');
          sCodRubricaSel := edCodRubricas.Text;
          chklstRubrica1.Repaint;
        end;
    1 : begin
          VerificaOpcoes (chklstRubrica2, ListaCodRubrica, edCodRubricas.Text, ',');
          sCodRubricaSel2 := edCodRubricas.Text;
          chklstRubrica2.Repaint;
        end;
    2 : begin
          VerificaOpcoes (chklstRubrica3, ListaCodRubrica, edCodRubricas.Text, ',');
          sCodRubricaSel3 := edCodRubricas.Text;
          chklstRubrica3.Repaint;
        end;
  end;
  HabilitaBtOk;
end;

procedure TfrmParamGerencial.rgApanhaDataTreinClick(Sender: TObject);
begin
  rgTipoDataTrein.Enabled := (rgApanhaDataTrein.ItemIndex = 0);
end;

procedure TfrmParamGerencial.sbtnMarcarRub2Click(Sender: TObject);
begin
  edCodRubricas2.Text := Trim(edCodRubricas2.Text);
  VerificaOpcoes (chklstRubrica4, ListaCodRubrica, edCodRubricas2.Text, ',');
  sCodRubricaSel4 := edCodRubricas2.Text;
  chklstRubrica4.Repaint;
end;

procedure TfrmParamGerencial.bbtnConfirmarClick(Sender: TObject);
var
  I, K: integer;
  byNumRub1Sel, byNumRub2Sel: byte;
  sMes, sData, sQuery, sQuery2: string;
begin
  // Verifica quantas rubricas foram selecionadas no 1º Relatório
  byNumRub1Sel := 0;
  for I:=0 to chklstRubrica1.Items.Count-1 do
    if (chklstRubrica1.Checked[I]) then
      Inc (byNumRub1Sel);

  // Verifica quantas rubricas foram selecionadas no 2º Relatório
  byNumRub2Sel := 0;
  for I:=0 to chklstRubrica2.Items.Count-1 do
    if (chklstRubrica2.checked[I]) then
      Inc (byNumRub2Sel);

  // Cria a lista de Códigos da Rubricas para compor o Total da Folha
  CriaListaOpcoes(chklstRubrica3, ListaCodRubrica, sCodRubricaSel3, ',', true);

  // Cria a lista de Códigos da Rubricas para compor o Rel Despesas com Pessoal
  CriaListaOpcoes(chklstRubrica4, ListaCodRubrica, sCodRubricaSel4, ',', true);

  sMes := QuotedStr(PoeZero(cmbMes.ItemIndex+1) +'/'+ speAno.Text);
  sMesRef := QuotedStr(speAno.Text +'/'+ PoeZero(cmbMes.ItemIndex+1));
  sData := QuotedStr(IntToStr(TrazUltDiaMes(cmbMes.ItemIndex+1,speAno.Value)) +'/'+
    PoeZero(cmbMes.ItemIndex+1) +'/'+ speAno.Text);

  // Monto as SubQuerys conforme a seleção do usuário
  with (dtmRelatorios2) do
  begin
    // Nome e Endereço do estabelecimento selecionado
    qryGerencial.Close;
    with (qryGerencial.SQL) do
    begin
      Clear;
      Add('SELECT DISTINCT');
      Add('  RTRIM(PJ.RAZAOSOCIAL) AS EMPRESA,');
      Add('  RTRIM(DECODE(RTRIM(ESTADUAL.NUMDOCUMENTO),NULL,');
      Add('    DECODE(RTRIM(MUNICIPAL.NUMDOCUMENTO),NULL,NULL,');
      Add('    ''Inscrição Municipal: ''|| MUNICIPAL.NUMDOCUMENTO),');
      Add('    ''Inscrição Estadual: '' || ESTADUAL.NUMDOCUMENTO)) AS ESTADUALMUNICIPAL,');
      Add('  ''CNPJ: '' || PJ.NUMDOCUMENTO AS CGC,');
      Add('  RTRIM(E.LOGRADOURO) ||'', ''|| E.NUMERO ||');
      Add('    DECODE(RTRIM(E.COMPLEMENTO),NULL,NULL,'' - '' || RTRIM(E.COMPLEMENTO)) ||');
      Add('    DECODE(RTRIM(E.BAIRRO),NULL,NULL,'' - '' || RTRIM(E.BAIRRO)) ||'' - '' ||');
      Add('    RTRIM(CIDADES.NOME) ||'' - ''|| RTRIM(ES.CODESTADO) ||');
      Add('    '' - CEP:'' || RTRIM(SUBSTR(E.CEP,1,5)) || ''-'' ||');
      Add('    RTRIM(SUBSTR(E.CEP,6,3)) AS ENDERECO');
      Add('FROM');
      Add('  PESSOA PJ, ENDPESS E, CIDADES, ESTADO ES,');
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
      Add('  (PJ.IDPESSOA       = ' +qryEstab.FieldByName('IDPESSOA').asString+ ') AND');
      Add('  (PJ.IDPESSOA       = E.IDPESSOA)           AND');
      Add('  (PJ.IDENDCOMERCIAL = E.IDENDERECO)         AND');
      Add('  (E.IDCIDADES       = CIDADES.IDCIDADES)    AND');
      Add('  (CIDADES.IDESTADO  = ES.IDESTADO)          AND');
      Add('  (PJ.IDPESSOA       = ESTADUAL.IDPESSOA(+)) AND');
      Add('  (PJ.IDPESSOA       = MUNICIPAL.IDPESSOA(+))');
      //SaveToFile('c:\qry.txt');
      SaveToFile(Sistema.RetornaCaminhoArquivos(Sistema.IdEmpresa)+'\qry.txt');//Ádler Teodoro de Souza SOL 109421 KINTANA 496332
    end;

    // ********************************************************************************* //
    // ********************************************************************************* //
    // Demonstrativo Geral de Despesas com Pessoal (1)
    // ********************************************************************************* //
    // ********************************************************************************* //
    // Valor Total da Folha
    dtmBaseDados.qry.Close;
    with (dtmBaseDados.qry.SQL) do
    begin
      Clear;
      Add('SELECT');
      Add('  SUM(H.VALORPROVENTO) AS VALOR');
      Add('FROM');
      Add('  HISTRUBSAL H, FUNCIONARIO F, SITFUNC ST');
      Add('WHERE');
      Add('  (ST.TIPOSIT    IN (''A'',''F'')) AND');
      Add('  (F.IDESTAB      = ' +qryEstab.FieldByName('IDPESSOA').asString+ ') AND');

      if (Trim(sCodRubricaSel3) <> '') then
      begin
        if (Pos(',',sCodRubricaSel3) > 0) then
          Add('  (H.CODPROVDESC IN (' +sCodRubricaSel3+ ')) AND')
        else
          Add('  (H.CODPROVDESC  = ' +sCodRubricaSel3+ ') AND');
      end;

      Add('  (H.MES          = ' +sMesRef+ ') AND');
      Add('  (H.IDPESSJUR    = ' +IntToStr(Sistema.IdEmpresa)+ ') AND');
      Add('  (ST.IDSITFUNC   = F.IDSITFUNC) AND');
      Add('  (F.IDPESSOA     = H.IDPESSOA)');
      Add('GROUP BY');
      Add('  F.IDESTAB');
    end;
    dtmBaseDados.qry.Open;
    rTotalFolha := dtmBaseDados.qry.FieldByName('VALOR').asFloat;

    dtmBaseDados.qry.Close;
    with (dtmBaseDados.qry.SQL) do
    begin
      Clear;
      Add('SELECT DISTINCT');
      Add('  DECODE(P.FLGDESCONTO,0,''DESPESAS'',1,''ABATIMENTOS'',''ENCARGOS'') AS PROVENTODESCONTO,');
      Add('  P.FLGDESCONTO AS TIPOPROVDESC,');
      Add('  RTRIM(RP.DESCRPROVDESC) AS RUBRICA,');
      Add('  RTRIM(RP.CODPROVDESC) AS CODRUBRICA,');
      Add('  CC.CODCENTROCUSTO,');
      Add('  P.CODRUBCLT,');
      Add('  (CC.NOME || DECODE (CC.CODREDUZIDO,NULL,NULL,'' (''||RTRIM(CC.CODREDUZIDO)||'')'')) AS C_CUSTO,');
      Add('  HIST.VALOR');
      // ------------------------------------------------------------------ //
      Add('FROM');
      Add('  HISTRUBSAL H, PROVDESC P, RUBRICAXPESS RP, FUNCIONARIO F,');
      Add('  CENTCUST CC,');
      // ------------------------------------------------------------------ //
      Add('  (SELECT');
      Add('     F.CODCENTROCUSTO, F.IDESTAB, H.IDRUBRICA, SUM(H.VALORPROVENTO) AS VALOR');
      Add('   FROM');
      Add('     HISTRUBSAL H, PROVDESC P, RUBRICAXPESS RP, FUNCIONARIO F');
      Add('   WHERE');
      Add('     (F.IDESTAB       = ' +qryEstab.FieldByName('IDPESSOA').asString+ ') AND');

      if (Trim(sCodRubricaSel4) <> '') then
      begin
        if (Pos(',',sCodRubricaSel4) > 0) then
          Add('     (H.CODPROVDESC  IN (' +sCodRubricaSel4+ ')) AND')
        else
          Add('     (H.CODPROVDESC   = ' +sCodRubricaSel4+ ') AND');
      end;

      Add('     (H.MES           = ' +sMesRef+ ') AND');
      Add('     (H.IDMOTIVO      = ' +qryMotivo.FieldByName('IDMOTIVO').asString+ ') AND');
      Add('     (H.IDPESSJUR     = ' +IntToStr(Sistema.IDEmpresa)+ ') AND');
      Add('     (F.TIPOCONTRATO <> ''G'') AND');
      Add('     (F.IDEMPRESA     = RP.IDPESSOA) AND');
      Add('     (F.IDPESSOA      = H.IDPESSOA) AND');
      Add('     (H.IDRUBRICA     = RP.IDRUBRICA) AND');
      Add('     (H.IDRUBRICA     = P.IDPROVENTO)');
      Add('   GROUP BY');
      Add('     F.CODCENTROCUSTO, H.IDRUBRICA, F.IDESTAB) HIST');
      // ------------------------------------------------------------------ //
      Add('WHERE');
      Add('  (F.IDESTAB       = ' +qryEstab.FieldByName('IDPESSOA').asString+ ') AND');
//      Add('  ((P.FLGDESCONTO  < 2)               OR');
//      Add('  (P.CODRUBCLT   IN (''40695'',''40698'',''43696'',''43697'',''90020''))) AND');
      Add('  (H.MES           = ' +sMesRef+ ') AND');
      Add('  (H.IDMOTIVO      = ' +qryMotivo.FieldByName('IDMOTIVO').asString+ ') AND');
      Add('  (H.IDPESSJUR     = ' +IntToStr(Sistema.IDEmpresa)+ ') AND');
      Add('  (HIST.IDESTAB    = F.IDESTAB) AND');
      Add('  (HIST.IDRUBRICA  = RP.IDRUBRICA) AND');
      Add('  (HIST.IDRUBRICA  = P.IDPROVENTO) AND');
      Add('  (F.IDPESSOA      = H.IDPESSOA) AND');
      Add('  (H.IDRUBRICA     = RP.IDRUBRICA) AND');
      Add('  (RP.IDPESSOA     = F.IDEMPRESA) AND');
      Add('  (H.IDRUBRICA     = P.IDPROVENTO) AND');
      Add('  (F.CODCENTROCUSTO  = HIST.CODCENTROCUSTO) AND');
      Add('  (CC.CODCENTROCUSTO = F.CODCENTROCUSTO) AND');
      Add('  ((P.CODRUBCLT  <> ''40999'') OR (P.CODRUBCLT IS NULL)) AND');
      Add('  ((P.CODRUBCLT  <> ''40998'') OR (P.CODRUBCLT IS NULL)) AND');
      Add('  ((P.CODRUBCLT  <> ''50999'') OR (P.CODRUBCLT IS NULL))');
      Add('ORDER BY');
      case (cbmOrdermDemDespPessoal.ItemIndex) of
        0 : Add('  CODCENTROCUSTO, TIPOPROVDESC, CODRUBRICA');
        1 : Add('  C_CUSTO, TIPOPROVDESC, CODRUBRICA');
      end;
      //SaveToFile('c:\qry1.txt');
      SaveToFile(Sistema.RetornaCaminhoArquivos(Sistema.IdEmpresa)+'\qry1.txt');//Ádler Teodoro de Souza SOL 109421 KINTANA 496332
    end;

    // ********************************************************************************* //
    // ********************************************************************************* //
    // Relação de Cargos com Remuneração por Centro de Custo (2)
    // ********************************************************************************* //
    // ********************************************************************************* //
    qryGerencial2.Close;
    with (qryGerencial2.SQL) do
    begin
      Clear;
      Add('SELECT DISTINCT');
      Add('  DECODE (CC.NOME,NULL,NULL,CC.NOME) || DECODE(CC.CODREDUZIDO,NULL,NULL,'' (''||');
      Add('    RTRIM(CC.CODREDUZIDO)||'')'') AS C_CUSTO,');
      Add('  C.TITULO AS CARGO,');
      // --------------------------------------------------------------------------------- //
      // Calculo o valor total da remuneração do Centro(Rubrica1 + Rubrica2 + ... + RubricaN)
      K := 1;
      sQuery := '  SUM((';
      for I:=0 to chklstRubrica1.Items.Count-1 do
      begin
        if (chklstRubrica1.Checked[I]) then
        begin
          if (K > 1) then
            sQuery := sQuery +' + ';
          sQuery := sQuery + 'NVL(R'+IntToStr(K)+'.VALORPROVENTO,0)';
          Inc(K);
        end;
      end;
      sQuery := sQuery +')) AS REMUNERACAO';
      Add (sQuery);
      // --------------------------------------------------------------------------------- //
      Add('FROM');
      Add('  FUNCIONARIO F, CENTCUST CC, CARGO C, SITFUNC ST,');
      // --------------------------------------------------------------------------------- //
      // Seleciono cada Rubrica com a(s) Rubrica(s) selecionada(s) pelo Usuário
      if (byNumRub1Sel > 1) then
        sQuery := ','
      else
        sQuery := '';

      k := 1;
      for I:=0 to chklstRubrica1.Items.Count - 1 do
        if (chklstRubrica1.Checked[I]) then
        begin
          if (k = byNumRub1Sel) then
            sQuery := '';
          Add('  (SELECT IDPESSOA, VALORPROVENTO');
          Add('   FROM   HISTRUBSAL');
          Add('   WHERE  (CODPROVDESC = '+QuotedStr(ListaCodRubrica[I])+') AND');
          Add('          (MES         = '+sMesRef+')) R'+IntToStr(k)+sQuery);
          Inc(k);
        end;
      // --------------------------------------------------------------------------------- //
      Add('WHERE');
      Add('  (ST.TIPOSIT      <> ''D'') AND');
      Add('  (F.IDESTAB        = ' +qryEstab.FieldByName('IDPESSOA').asString+ ') AND');
      Add('  (F.TIPOCONTRATO  <> ''G'') AND');
      Add('  (TO_DATE(TO_CHAR(F.DATAADMISSAO,''MM/YYYY''),''MM/YYYY'') <= ' +
          'TO_DATE('+sMes+',''MM/YYYY'')) AND');
      Add('  (ST.IDSITFUNC     = F.IDSITFUNC) AND');
      Add('  (F.CODCENTROCUSTO = CC.CODCENTROCUSTO) AND');
      Add('  (F.IDEMPRESA      = CC.IDEMPRESA) AND');      
      Add('  (F.IDCARGO        = C.IDCARGO) AND');
      // --------------------------------------------------------------------------------- //
      // Faço o JOIN com a(s) Rubrica(s) selecionada(s) pelo Usuário
      K := 1;
      for I:=0 to chklstRubrica1.Items.Count - 1 do
        if (chklstRubrica1.Checked[I]) then
          Inc(K);
      if (K > 1) then
      begin
        sAux := '  ';
        Add('  (');
      end
      else
        sAux := '';

      K := 1;
      for I:=0 to chklstRubrica1.Items.Count - 1 do
        if (chklstRubrica1.Checked[I]) then
        begin
          if (K = 1) then
            Add('  ' +sAux+ '   (F.IDPESSOA = R'+IntToStr(K)+'.IDPESSOA(+))')
          else
            Add('  ' +sAux+ 'AND (F.IDPESSOA = R'+IntToStr(K)+'.IDPESSOA(+))');
          Inc(K);
        end;
        
      if (sAux = '  ') then
        Add('  )');
      // ----------------------------------------------------------------------------- //
      Add('GROUP BY');
      Add('  CC.NOME, CC.CODREDUZIDO, C.TITULO');
      Add('ORDER BY');
      Add('  C_CUSTO');
      SaveToFile('c:\qry2.txt');
      SaveToFile(Sistema.RetornaCaminhoArquivos(Sistema.IdEmpresa)+'\qry2.txt');//Ádler Teodoro de Souza SOL 109421 KINTANA 496332
    end;

    // ********************************************************************************* //
    // ********************************************************************************* //
    // Distribuição de Cargos por Centro de Custo (3)
    // ********************************************************************************* //
    // ********************************************************************************* //
    // Pego as situações escolhidas
    K       := 1;
    sQuery  := '';
    sQuery2 := '';
    for I:=0 to chklstSituacoes.Items.Count-1 do
      if (chklstSituacoes.Checked[I]) then
      begin
        if (K = 1) then
        begin
          sQuery  := '    (ST.IDSITFUNC NOT IN ('+ListaCodSitFunc.Strings[I];
          sQuery2 := '    (ST.IDSITFUNC IN ('+ListaCodSitFunc.Strings[I];
          Inc(K);
        end
        else
        begin
          sQuery  := sQuery+','+ListaCodSitFunc.Strings[I];
          sQuery2 := sQuery2+','+ListaCodSitFunc.Strings[I];
        end;
      end;
    if (K > 1) then
    begin
      sQuery  := sQuery+')) AND';
      sQuery2 := sQuery2+')) AND';
    end;

    qryGerencial3.Close;
    with (qryGerencial3.SQL) do
    begin
      Clear;
      Add('SELECT DISTINCT');
      Add('  DECODE (CC.NOME,'''','''',CC.NOME) || DECODE(CC.CODREDUZIDO,'''','''','' (''||');
      Add('    RTRIM(CC.CODREDUZIDO)||'')'') AS C_CUSTO,');
      Add('  C.TITULO AS CARGO,');
      Add('  ATIVO.QUANTIDADE AS ATIVOS,');
      Add('  NVL(EM_LICENCA.QUANTIDADE,0) AS LICENCA');
      Add('FROM');
      Add('  FUNCIONARIO F, CENTCUST CC, CARGO C, SITFUNC ST,');
      // ------------------------------------------------------------------------------- //
      // Funcionários que não estão em uma das licenças escolhidas
      Add('  (SELECT');
      Add('     CC.CODCENTROCUSTO, F.IDCARGO, COUNT(F.IDPESSOA) AS QUANTIDADE');
      Add('   FROM');
      Add('     FUNCIONARIO F, CENTCUST CC, SITFUNC ST');
      Add('   WHERE');
      Add('     (ST.TIPOSIT      <> ''D'')       AND');
      Add('     (F.IDESTAB        = ' +qryEstab.FieldByName('IDPESSOA').asString+ ') AND');
      Add('     (TO_DATE(TO_CHAR(F.DATAADMISSAO,''MM/YYYY''),''MM/YYYY'') <=');
      Add('        TO_DATE('+sMes+',''MM/YYYY'')) AND');
      Add(sQuery);
      Add('     (F.TIPOCONTRATO  <> ''G'' )      AND');
      Add('     (ST.IDSITFUNC     = F.IDSITFUNC) AND');
      Add('     (F.CODCENTROCUSTO = CC.CODCENTROCUSTO) AND');
      Add('     (F.IDEMPRESA      = CC.IDEMPRESA)');
      Add('   GROUP BY');
      Add('     CC.CODCENTROCUSTO, F.IDCARGO) ATIVO,');
      // ------------------------------------------------------------------------------- //
      // Funcionários que não estão em uma das licenças escolhidas
      Add('  (SELECT');
      Add('     CC.CODCENTROCUSTO, COUNT(F.IDPESSOA) AS QUANTIDADE');
      Add('   FROM');
      Add('     FUNCIONARIO F, CENTCUST CC, SITFUNC ST');
      Add('   WHERE');
      Add('     (ST.TIPOSIT      <> ''D'')       AND');
      Add('     (F.IDESTAB        = ' +qryEstab.FieldByName('IDPESSOA').asString+ ') AND');
      Add('     (TO_DATE(TO_CHAR(F.DATAADMISSAO,''MM/YYYY''),''MM/YYYY'') <=');
      Add('        TO_DATE('+sMes+',''MM/YYYY'')) AND');
      Add(sQuery2);
      Add('     (F.TIPOCONTRATO  <> ''G'' )      AND');
      Add('     (ST.IDSITFUNC     = F.IDSITFUNC) AND');
      Add('     (F.CODCENTROCUSTO = CC.CODCENTROCUSTO) AND');
      Add('     (F.IDEMPRESA      = CC.IDEMPRESA)');
      Add('   GROUP BY');
      Add('     CC.CODCENTROCUSTO) EM_LICENCA');
      // ------------------------------------------------------------------------------- //
      Add('WHERE');
      Add('  (F.IDESTAB        = ' +qryEstab.FieldByName('IDPESSOA').asString+ ') AND');
      Add('  (TO_DATE(TO_CHAR(F.DATAADMISSAO,''MM/YYYY''),''MM/YYYY'') <=');
      Add('     TO_DATE('+sMes+',''MM/YYYY'')) AND');
      Add('  (F.CODCENTROCUSTO = CC.CODCENTROCUSTO) AND');
      Add('  (F.IDEMPRESA      = CC.IDEMPRESA) AND');
      Add('  (F.IDCARGO        = C.IDCARGO)   AND');
      Add('  (F.CODCENTROCUSTO = ATIVO.CODCENTROCUSTO) AND');
      Add('  (F.IDCARGO        = ATIVO.IDCARGO) AND');
      Add('  (F.CODCENTROCUSTO = EM_LICENCA.CODCENTROCUSTO(+))');
      Add('ORDER BY');
      Add('  C_CUSTO');
      //SaveToFile('c:\qry3.txt');
      SaveToFile(Sistema.RetornaCaminhoArquivos(Sistema.IdEmpresa)+'\qry3.txt');//Ádler Teodoro de Souza SOL 109421 KINTANA 496332
    end;

    // ********************************************************************************* //
    // ********************************************************************************* //
    // Distribuição de Pessoal por Salário (4)
    // ********************************************************************************* //
    // ********************************************************************************* //
    qryGerencial4.Close;
    with (qryGerencial4.SQL) do
    begin
      Clear;
      Add('SELECT DISTINCT');
      Add('  COUNT(F.IDPESSOA) AS NUM_FUNC, F.SALARIOATUAL');
      Add('FROM');
      Add('  PESSOA PJ, PESSOAFISICA PF, FUNCIONARIO F, SITFUNC ST, FILIALPESSOA FP, EMPRESAPROP EP');
      Add('WHERE');
      Add('  (PJ.IDPESSOA       = ' +qryEstab.FieldByName('IDPESSOA').asString+ ') AND');
      Add('  (EP.IDPESSOA       = PJ.IDGRUPO)  AND');
      Add('  (FP.IDFILIALPESSOA = PJ.IDPESSOA) AND');
      Add('  (F.SALARIOATUAL    > 0)           AND');
      Add('  (F.IDESTAB         = PJ.IDPESSOA) AND');
      Add('  (TO_DATE(TO_CHAR(F.DATAADMISSAO,''MM/YYYY''),''MM/YYYY'') <=');
      Add('     TO_DATE('+sMes+',''MM/YYYY'')) AND');
      Add('  (ST.TIPOSIT       <> ''D'')       AND');
      Add('  (F.TIPOCONTRATO   <> ''G'' )      AND');
      Add('  (ST.IDSITFUNC      = F.IDSITFUNC) AND');
      Add('  (F.IDPESSOA        = PF.IDPESSOA)');
      Add('GROUP BY');
      Add('  F.SALARIOATUAL, PJ.NOME');
      Add('ORDER BY');
      case (cmbOrdemDistribPessSal.ItemIndex) of
        0 : Add('  NUM_FUNC');
        1 : Add('  NUM_FUNC DESC');
        2 : Add('  F.SALARIOATUAL');
        3 : Add('  F.SALARIOATUAL DESC');
      end;
      //SaveToFile('c:\qry4.txt');
      SaveToFile(Sistema.RetornaCaminhoArquivos(Sistema.IdEmpresa)+'\qry4.txt');//Ádler Teodoro de Souza SOL 109421 KINTANA 496332
    end;

    // ********************************************************************************* //
    // ********************************************************************************* //
    // Distribuição de Gratificações por Centro de Custo (5)
    // ********************************************************************************* //
    // ********************************************************************************* //
    qryGerencial5.Close;
    with (qryGerencial5.SQL) do
    begin
      Clear;
      Add('SELECT DISTINCT');
      Add('  DECODE (CC.NOME,'''','''',CC.NOME) || DECODE(CC.CODREDUZIDO,'''','''','' (''||');
      Add('    RTRIM(CC.CODREDUZIDO)||'')'') AS C_CUSTO,');
      Add('  C.TITULO AS CARGO,');
      // --------------------------------------------------------------------------------- //
      // Calculo o número de gratificações do C. Custo (Rubrica1 + Rubrica2 + ... + RubricaN)
      K := 1;
      sQuery := '  COUNT((';
      for I:=0 to chklstRubrica2.Items.Count-1 do
        if (chklstRubrica2.Checked[I]) then
        begin
          if (K > 1) then
            sQuery := sQuery +' + ';
          sQuery := sQuery + 'NVL(R'+IntToStr(K)+'.VALORPROVENTO,0)';
          Inc(K);
        end;
      sQuery := sQuery +')) AS NUM_GRATIF,';
      Add (sQuery);
      // --------------------------------------------------------------------------------- //
      // Calculo o valor total de gratificações do C. Custo (Rubrica1 + Rubrica2 + ... + RubricaN)
      K := 1;
      sQuery := '  SUM((';
      for I:=0 to chklstRubrica2.Items.Count-1 do
      begin
        if (chklstRubrica2.Checked[I]) then
        begin
          if (K > 1) then
            sQuery := sQuery +' + ';
          sQuery := sQuery + 'NVL(R'+IntToStr(K)+'.VALORPROVENTO,0)';
          Inc(K);
        end;
      end;
      sQuery := sQuery +')) AS VAL_GRATIF';
      Add (sQuery);
      // --------------------------------------------------------------------------------- //
      Add('FROM');
      Add('  FUNCIONARIO F, CENTCUST CC, CARGO C, SITFUNC ST,');
      // --------------------------------------------------------------------------------- //
      // Seleciono cada Rubrica com a(s) Rubrica(s) selecionada(s) pelo Usuário
      if (byNumRub2Sel > 1) then
        sQuery := ','
      else
        sQuery := '';

      k := 1;
      for I:=0 to chklstRubrica2.Items.Count - 1 do
        if (chklstRubrica2.Checked[I]) then
        begin
          if (k = byNumRub2Sel) then
            sQuery := '';
          Add('  (SELECT IDPESSOA, VALORPROVENTO');
          Add('   FROM   HISTRUBSAL');
          Add('   WHERE  (CODPROVDESC = '+QuotedStr(ListaCodRubrica[I])+') AND');
          Add('          (MES         = '+sMesRef+')) R'+IntToStr(k)+sQuery);
          Inc(k);
        end;
      // --------------------------------------------------------------------------------- //
      Add('WHERE');
      Add('  (ST.TIPOSIT       <> ''D'') AND');
      Add('  (F.IDESTAB        = ' +qryEstab.FieldByName('IDPESSOA').asString+ ') AND');
      Add('  (F.TIPOCONTRATO   <> ''G'' ) AND');
      Add('  (TO_DATE(TO_CHAR(F.DATAADMISSAO,''MM/YYYY''),''MM/YYYY'') <= ' +
          'TO_DATE('+sMes+',''MM/YYYY'')) AND');
      Add('  (ST.IDSITFUNC     = F.IDSITFUNC) AND');
      Add('  (F.CODCENTROCUSTO = CC.CODCENTROCUSTO) AND');
      Add('  (F.IDEMPRESA      = CC.IDEMPRESA) AND');
      Add('  (F.IDCARGO        = C.IDCARGO) AND');
      // --------------------------------------------------------------------------------- //
      // Faço o JOIN com a(s) Rubrica(s) selecionada(s) pelo Usuário
      K := 1;
      for I:=0 to chklstRubrica2.Items.Count - 1 do
        if (chklstRubrica2.Checked[I]) then
          Inc(K);
      if (K > 1) then
      begin
        sAux := '  ';
        Add('  (');
      end
      else
        sAux := '';

      K := 1;
      for I:=0 to chklstRubrica2.Items.Count - 1 do
        if (chklstRubrica2.Checked[I]) then
        begin
          if (K = 1) then
            Add('  ' +sAux+ '   (F.IDPESSOA = R'+IntToStr(K)+'.IDPESSOA(+))')
          else
            Add('  ' +sAux+ 'AND (F.IDPESSOA = R'+IntToStr(K)+'.IDPESSOA(+))');
          Inc(K);
        end;

      if (sAux = '  ') then
        Add('  )');

      // CONDIÇÃO PARA PEGAR SÓ OS QUE TÊM VALOR
      K := 1;
      for I:=0 to chklstRubrica2.Items.Count - 1 do
        if (chklstRubrica2.Checked[I]) then
        begin
          if (K = 1) then
            Add(' AND (NVL(R'+IntToStr(K)+'.VALORPROVENTO,0) ')
          else
            Add('  + NVL(R'+IntToStr(K)+'.VALORPROVENTO,0) ');
          Inc(K);
        end;
      Add(' > 0) ');


      // ----------------------------------------------------------------------------- //
      Add('GROUP BY');
      Add('  CC.NOME, CC.CODREDUZIDO, C.TITULO');
      Add('ORDER BY');
      Add('  C_CUSTO');
      //SaveToFile('c:\qry5.txt');
      SaveToFile(Sistema.RetornaCaminhoArquivos(Sistema.IdEmpresa)+'\qry5.txt');//Ádler Teodoro de Souza SOL 109421 KINTANA 496332
    end;

    // ********************************************************************************* //
    // ********************************************************************************* //
    // Contratações e Desligamentos de Pessoal (6)
    // ********************************************************************************* //
    // ********************************************************************************* //
    qryGerencial6A.Close;
    with (qryGerencial6A.SQL) do
    begin
      Clear;
      Add('SELECT DISTINCT');
      Add('  DECODE (CC.NOME,'''','''',CC.NOME) || DECODE(CC.CODREDUZIDO,'''','''','' (''||');
      Add('    RTRIM(CC.CODREDUZIDO)||'')'') AS C_CUSTO,');
      Add('  NVL(ADMITIDOS.NUMERO,0)  AS ADMITIDOS,');
      Add('  NVL(DEMITIDOS.NUMERO,0)  AS DEMITIDOS');
      Add('FROM');
      Add('  PESSOA PJ, FUNCIONARIO F, CENTCUST CC,');
      // -------------------------------------------------------------------- //
      // Funcionários Admitidos no mês
      Add('  (SELECT COUNT(F.IDPESSOA) AS NUMERO, CC.CODCENTROCUSTO');
      Add('   FROM');
      Add('     PESSOA PJ, FUNCIONARIO F, SITFUNC ST, CENTCUST CC');
      Add('   WHERE');
      Add('     (PJ.IDPESSOA      = ' +qryEstab.FieldByName('IDPESSOA').asString+ ') AND');
      Add('     (TO_DATE(TO_CHAR(F.DATAADMISSAO,''MM/YYYY''),''MM/YYYY'') =');
      Add('        TO_DATE('+sMes+',''MM/YYYY'')) AND');
      Add('     (F.IDESTAB        = PJ.IDPESSOA)  AND');
      Add('     (ST.TIPOSIT      <> ''D'')        AND');
      Add('     (ST.IDSITFUNC     = F.IDSITFUNC)  AND');
      Add('     (F.TIPOCONTRATO  <> ''G'' )       AND');
      Add('     (CC.IDEMPRESA     = PJ.IDGRUPO)   AND');
      Add('     (F.CODCENTROCUSTO = CC.CODCENTROCUSTO)');
      Add('   GROUP BY');
      Add('     CC.CODCENTROCUSTO) ADMITIDOS,');
      // -------------------------------------------------------------------- //
      // Funcionários Demitidos no mês
      Add('  (SELECT COUNT(F.IDPESSOA) AS NUMERO, CC.CODCENTROCUSTO');
      Add('   FROM');
      Add('     PESSOA PJ, FUNCIONARIO F, SITFUNC ST, CENTCUST CC');
      Add('   WHERE');
      Add('     (PJ.IDPESSOA       = ' +qryEstab.FieldByName('IDPESSOA').asString+ ') AND');
      Add('     (TO_DATE(TO_CHAR(F.DATADESLIGAMENTO,''MM/YYYY''),''MM/YYYY'') =');
      Add('        TO_DATE('+sMes+',''MM/YYYY'')) AND');
      Add('     (F.IDESTAB         = PJ.IDPESSOA) AND');
      Add('     (ST.TIPOSIT        = ''D'')       AND');
      Add('     (ST.IDSITFUNC      = F.IDSITFUNC) AND');
      Add('     (F.TIPOCONTRATO    <> ''G'' )     AND');
      Add('     (CC.IDEMPRESA      = PJ.IDGRUPO)  AND');
      Add('     (F.CODCENTROCUSTO  = CC.CODCENTROCUSTO)');
      Add('   GROUP BY');
      Add('     CC.CODCENTROCUSTO) DEMITIDOS');
      // -------------------------------------------------------------------- //
      Add('WHERE');
      Add('  (PJ.IDPESSOA                = ' +qryEstab.FieldByName('IDPESSOA').asString+ ') AND');
      Add('  (F.IDESTAB                  = PJ.IDPESSOA) AND');
      Add('  (TO_DATE(TO_CHAR(F.DATAADMISSAO,''MM/YYYY''),''MM/YYYY'') <=');
      Add('     TO_DATE('+sMes+',''MM/YYYY'')) AND');
      Add('  (F.CODCENTROCUSTO           = CC.CODCENTROCUSTO) AND');
      Add('  ((DEMITIDOS.CODCENTROCUSTO IS NOT NULL)  OR');
      Add('   (ADMITIDOS.CODCENTROCUSTO IS NOT NULL)) AND');
      Add('  (F.CODCENTROCUSTO           = DEMITIDOS.CODCENTROCUSTO(+))  AND');
      Add('  (F.CODCENTROCUSTO           = ADMITIDOS.CODCENTROCUSTO(+))');
      Add('ORDER BY');
      Add('  C_CUSTO');
      SaveToFile('c:\qry6A.txt');
    end;

    qryGerencial6B.Close;
    with (qryGerencial6B.SQL) do
    begin
      Clear;
      Add('SELECT DISTINCT');
      Add('  NVL(TOT_ESTAGIARIOS.NUMERO,0) AS NUM_ESTAGIARIOS,');
      Add('  TOT_EMPREGADOS_ANT.NUMERO     AS POS_ANTERIOR,');
      Add('  (TOT_EMPREGADOS_ANT.NUMERO+NVL(TOT_ADMITIDOS.NUMERO,0)) -');
      Add('    NVL(TOT_DEMITIDOS.NUMERO,0) AS POS_ATUAL');
      Add('FROM');
      Add('  PESSOA PJ, FUNCIONARIO F,');
      // -------------------------------------------------------------------- //
      // Total de Funcionários Admitidos no mês
      Add('  (SELECT PJ.IDPESSOA AS IDEMPRESA, COUNT(F.IDPESSOA) AS NUMERO');
      Add('   FROM');
      Add('     PESSOA PJ, FUNCIONARIO F, SITFUNC ST, CENTCUST CC');
      Add('   WHERE');
      Add('     (PJ.IDPESSOA       = ' +qryEstab.FieldByName('IDPESSOA').asString+ ') AND');
      Add('     (TO_DATE(TO_CHAR(F.DATAADMISSAO,''MM/YYYY''),''MM/YYYY'') =');
      Add('        TO_DATE('+sMes+',''MM/YYYY'')) AND');
      Add('     (F.IDESTAB        = PJ.IDPESSOA) AND');
      Add('     (ST.TIPOSIT      <> ''D'')       AND');
      Add('     (ST.IDSITFUNC     = F.IDSITFUNC) AND');
      Add('     (F.TIPOCONTRATO  <> ''G'' )      AND');
      Add('     (CC.IDEMPRESA     = PJ.IDGRUPO)  AND');
      Add('     (F.CODCENTROCUSTO = CC.CODCENTROCUSTO)');
      Add('   GROUP BY');
      Add('     PJ.IDPESSOA) TOT_ADMITIDOS,');
      // -------------------------------------------------------------------- //
      // Total de Funcionários Demitidos no mês
      Add('  (SELECT PJ.IDPESSOA AS IDEMPRESA, COUNT(F.IDPESSOA) AS NUMERO');
      Add('   FROM');
      Add('     PESSOA PJ, FUNCIONARIO F, SITFUNC ST, CENTCUST CC');
      Add('   WHERE');
      Add('     (PJ.IDPESSOA       = ' +qryEstab.FieldByName('IDPESSOA').asString+ ') AND');
      Add('     (TO_DATE(TO_CHAR(F.DATADESLIGAMENTO,''MM/YYYY''),''MM/YYYY'') =');
      Add('        TO_DATE('+sMes+',''MM/YYYY'')) AND');
      Add('     (F.IDESTAB        = PJ.IDPESSOA) AND');
      Add('     (ST.TIPOSIT       = ''D'')       AND');
      Add('     (ST.IDSITFUNC     = F.IDSITFUNC) AND');
      Add('     (F.TIPOCONTRATO   <> ''G'' )     AND');
      Add('     (CC.IDEMPRESA     = PJ.IDGRUPO)  AND');
      Add('     (F.CODCENTROCUSTO = CC.CODCENTROCUSTO)');
      Add('   GROUP BY');
      Add('     PJ.IDPESSOA) TOT_DEMITIDOS,');
      // -------------------------------------------------------------------- //
      // Posição anterior de Funcionários anterior ao mês
      Add('  (SELECT PJ.IDPESSOA AS IDEMPRESA, COUNT(F.IDPESSOA) AS NUMERO');
      Add('   FROM');
      Add('     PESSOA PJ, PESSOA PF, FUNCIONARIO F, SITFUNC ST');
      Add('   WHERE');
      Add('     (PJ.IDPESSOA       = ' +qryEstab.FieldByName('IDPESSOA').asString+ ') AND');
      Add('     (TO_DATE(TO_CHAR(F.DATAADMISSAO,''MM/YYYY''),''MM/YYYY'') <');
      Add('        TO_DATE('+sMes+',''MM/YYYY'')) AND');
      Add('     (F.IDESTAB       = PJ.IDPESSOA) AND');
      Add('     (ST.TIPOSIT     <> ''D'')       AND');
      Add('     (ST.IDSITFUNC    = F.IDSITFUNC) AND');
      Add('     (F.TIPOCONTRATO <> ''G'' )      AND');
      Add('     (F.IDPESSOA      = PF.IDPESSOA)');
      Add('   GROUP BY');
      Add('     PJ.IDPESSOA) TOT_EMPREGADOS_ANT,');
      // -------------------------------------------------------------------- //
      // Estagiários até o mês
      Add('  (SELECT PJ.IDPESSOA AS IDEMPRESA, COUNT(F.IDPESSOA) AS NUMERO');
      Add('   FROM');
      Add('     PESSOA PJ, PESSOA PF, FUNCIONARIO F, SITFUNC ST');
      Add('   WHERE');
      Add('     (PJ.IDPESSOA       = ' +qryEstab.FieldByName('IDPESSOA').asString+ ') AND');
      Add('     (TO_DATE(TO_CHAR(F.DATAADMISSAO,''MM/YYYY''),''MM/YYYY'') <=');
      Add('        TO_DATE('+sMes+',''MM/YYYY'')) AND');
      Add('     (F.IDESTAB      = PJ.IDPESSOA) AND');
      Add('     (ST.TIPOSIT    <> ''D'')       AND');
      Add('     (ST.IDSITFUNC   = F.IDSITFUNC) AND');
      Add('     (F.IDPESSOA     = PF.IDPESSOA) AND');
      Add('     (F.TIPOCONTRATO = ''G'')');
      Add('   GROUP BY');
      Add('     PJ.IDPESSOA) TOT_ESTAGIARIOS');
      // -------------------------------------------------------------------- //
      Add('WHERE');
      Add('  (PJ.IDPESSOA = ' +qryEstab.FieldByName('IDPESSOA').asString+ ') AND');
      Add('  (F.IDESTAB   = PJ.IDPESSOA) AND');
      Add('  (TO_DATE(TO_CHAR(F.DATAADMISSAO,''MM/YYYY''),''MM/YYYY'') <= '+
             'TO_DATE('+sMes+',''MM/YYYY'')) AND');
      Add('  (PJ.IDPESSOA = TOT_EMPREGADOS_ANT.IDEMPRESA) AND');
      Add('  (PJ.IDPESSOA = TOT_ADMITIDOS.IDEMPRESA(+)) AND');
      Add('  (PJ.IDPESSOA = TOT_DEMITIDOS.IDEMPRESA(+)) AND');
      Add('  (PJ.IDPESSOA = TOT_ESTAGIARIOS.IDEMPRESA(+))');
      //SaveToFile('c:\qry6B.txt');
      SaveToFile(Sistema.RetornaCaminhoArquivos(Sistema.IdEmpresa)+'\qry6B.txt');//Ádler Teodoro de Souza SOL 109421 KINTANA 496332
    end;

    // ********************************************************************************* //
    // ********************************************************************************* //
    // Relação de Pessoal por Tempo de Serviço (7)
    // ********************************************************************************* //
    // ********************************************************************************* //
    qryGerencial7.Close;
    with (qryGerencial7.SQL) do
    begin
      Clear;
      Add('SELECT DISTINCT');
      Add('  PF.NOME,');
      Add('  TEMPO_CASA.MATRICULA,');
      Add('  TEMPO_CASA.DTADMISSAO,');
      Add('  TO_CHAR(SYSDATE,''DD/MM/YYYY'') AS DTHOJE,');
      Add('  MOD(TO_NUMBER(TEMPO_CASA.VALOR),12) AS MES,');
      Add('  TRUNC(TEMPO_CASA.VALOR/12,0) ANO,');
      Add('  TEMPO_CASA.VALOR');
      Add('FROM');
      Add('  PESSOA PJ, PESSOA PF, FUNCIONARIO F, SITFUNC ST, FILIALPESSOA FP, EMPRESAPROP EP,');
      Add('  (SELECT DISTINCT');
      Add('     IDPESSOA,');
      Add('     MATRICULA,');
      Add('     TO_CHAR(DATAADMISSAO,''DD/MM/YYYY'') AS DTADMISSAO,');
      // ANO ATUAL MENOS ANO DA DATA DE ADMISSAO
      Add('     (((TO_NUMBER(SUBSTR('+sData+',7,10)) -');
      Add('       TO_NUMBER(SUBSTR(TO_CHAR(DATAADMISSAO,''DD/MM/YYYY''),7,10))) * 12 +');
      // MES ATUAL MENOS MES DA ANO DE ADMISSAO
      Add('      (TO_NUMBER(SUBSTR('+sData+',4,2)) -');
      Add('       TO_NUMBER(SUBSTR(TO_CHAR(DATAADMISSAO,''DD/MM/YYYY''),4,2))) +');
      Add('      DECODE(');
      Add('        (TO_NUMBER(SUBSTR('+sData+',1,2)) -');
      Add('         TO_NUMBER(SUBSTR(TO_CHAR(DATAADMISSAO,''DD/MM/YYYY''),1,2))) /');
      Add('        DECODE(SUBSTR('+sData+',1,2),');
      Add('               SUBSTR(TO_CHAR(DATAADMISSAO,''DD/MM/YYYY''),1,2),');
      Add('               1,');
      Add('               ABS(TO_NUMBER(SUBSTR('+sData+',1,2)) -');
      Add('                   TO_NUMBER(SUBSTR(TO_CHAR(DATAADMISSAO,''DD/MM/YYYY''),1,2)))),');
      Add('               -1,');
      Add('               -1,');
      Add('               0))) AS VALOR');
      Add('  FROM');
      Add('    FUNCIONARIO');
      Add('  WHERE');
      Add('  (TO_DATE(TO_CHAR(DATAADMISSAO,''MM/YYYY''),''MM/YYYY'') <=');
      Add('     TO_DATE('+sMes+',''MM/YYYY''))) TEMPO_CASA');
      Add('WHERE');
      Add('  (ST.TIPOSIT       <> ''D'') AND');
      Add('  (PJ.IDPESSOA       = ' +qryEstab.FieldByName('IDPESSOA').asString+ ') AND');
      Add('  (EP.IDPESSOA       = PJ.IDGRUPO) AND');
      Add('  (FP.IDFILIALPESSOA = PJ.IDPESSOA) AND');
      Add('  (ST.IDSITFUNC      = F.IDSITFUNC) AND');
      Add('  (F.IDESTAB         = PJ.IDPESSOA) AND');
      Add('  (F.TIPOCONTRATO   <> ''G'') AND');
      Add('  (PF.IDPESSOA       = F.IDPESSOA) AND');
      Add('  (TO_DATE(TO_CHAR(F.DATAADMISSAO,''MM/YYYY''),''MM/YYYY'') <= '+
             'TO_DATE('+sMes+',''MM/YYYY'')) AND');
      //Add('  (TEMPO_CASA.VALOR <> 0) AND');
      Add('  (PF.IDPESSOA       = TEMPO_CASA.IDPESSOA)');
      Add('ORDER BY');
      case (cmbOrdemRelEmprTempServ.ItemIndex) of
        0 : Add('  VALOR');
        1 : Add('  VALOR DESC');
        2 : Add('  PF.NOME');
        3 : Add('  TEMPO_CASA.MATRICULA');
      end;
      //SaveToFile('c:\qry7.txt');
      SaveToFile(Sistema.RetornaCaminhoArquivos(Sistema.IdEmpresa)+'\qry7.txt');//Ádler Teodoro de Souza SOL 109421 KINTANA 496332
    end;
    qryGerencial.Open;
  end;

  if not(dtmRelatorios2.qryGerencial.IsEmpty) then
  begin
    with (dtmRelatorios2) do
    begin
      bImprimindo := false;
      frmAguarde.Mostra ('Relatório Gerencial');
      frmAguarde.Pos := 0;
      frmAguarde.Min := 0;
      frmAguarde.Max := qryGerencial.RecordCount;

      dtmBaseDados.qry.Open;
      frmAguarde.Max := frmAguarde.Max + dtmBaseDados.qry.RecordCount;
      qryGerencial2.Open;
      frmAguarde.Max := frmAguarde.Max + qryGerencial2.RecordCount;
      qryGerencial3.Open;
      frmAguarde.Max := frmAguarde.Max + qryGerencial3.RecordCount;
      qryGerencial4.Open;
      frmAguarde.Max := frmAguarde.Max + qryGerencial4.RecordCount;
      qryGerencial5.Open;
      frmAguarde.Max := frmAguarde.Max + qryGerencial5.RecordCount;
      qryGerencial6A.Open;
      frmAguarde.Max := frmAguarde.Max + qryGerencial6A.RecordCount;
      qryGerencial6B.Open;
      frmAguarde.Max := frmAguarde.Max + qryGerencial6B.RecordCount;
      qryGerencial7.Open;
      frmAguarde.Max := frmAguarde.Max + qryGerencial7.RecordCount;

      // Processa dados para a geração do Relatório Demonstrativo de Despesas com Pessoal
      GravaDadosDemDespPessoal;

      rpGerencialLabelSETOR.Caption := edSetor.Text;
      rpGerencialLblMES.Caption := 'Referente ao Mês de '+
        MesExtensoAno(IntToStr(speAno.Value) +'/'+ PoeZero(cmbMes.ItemIndex+1));
      rpGerencialChildReport1LabelRef.Caption := rpGerencialLblMES.Caption;
      rpGerencialChildReport2LabelRef.Caption := rpGerencialLblMES.Caption;
      rpGerencialChildReport3LabelRef.Caption := rpGerencialLblMES.Caption;
      rpGerencialChildReport4LabelRef.Caption := rpGerencialLblMES.Caption;
      rpGerencialChildReport5LabelRef.Caption := rpGerencialLblMES.Caption;
      rpGerencialChildReport6LabelRef.Caption := rpGerencialLblMES.Caption;
      rpGerencialChildReport7LabelRef.Caption := rpGerencialLblMES.Caption;

      bImprimindo := true;
      rpGerencial.PrinterSetup.PaperName := cmbTipoPapel.Items[cmbTipoPapel.ItemIndex];
    end;
  end
  else
  begin
    ModalResult := mrNone;
    frmAguarde.Apaga;
    MsgDlg('Não há dados a serem exibidos! Verifique.', 'Aviso', mtInformation, [mbOk,mbHelp], 0);
  end;
end;

procedure TfrmParamGerencial.GravaDadosDemDespPessoal;
var
  sCCusto: string;
  rTotParcial: double;
  byNumLinhasInfCompl: byte;
  iLin, iCol: integer;
begin
  with (dtmRelatorios2) do
  begin
    cdsGerencial1.Close;
    cdsGerencial1.IndexName := '';
    cdsGerencial1.Open;

    if not(dtmBaseDados.qry.IsEmpty) then
    begin
      // Inserir linhas que tenham vindo da seleção das Linhas da Query Auxiliar
      while not(dtmBaseDados.qry.EOF) do
      begin
        rTotParcial := 0;
        repeat
          sCCusto := dtmBaseDados.qry.FieldByName('CODCENTROCUSTO').asString;
          cdsGerencial1.Insert;
          cdsGerencial1.FieldByName('PROVENTODESCONTO').asString := dtmBaseDados.qry.FieldByName('PROVENTODESCONTO').asString;
          cdsGerencial1.FieldByName('TIPOPROVDESC').asInteger := dtmBaseDados.qry.FieldByName('TIPOPROVDESC').asInteger;
          cdsGerencial1.FieldByName('CODRUBRICA').asString := dtmBaseDados.qry.FieldByName('CODRUBRICA').asString;
          cdsGerencial1.FieldByName('CODCENTROCUSTO').asString := dtmBaseDados.qry.FieldByName('CODCENTROCUSTO').asString;

          case (dtmBaseDados.qry.FieldByName('TIPOPROVDESC').asInteger) of
            0 : cdsGerencial1.FieldByName('TIPOTOT').asString := 'TOTAL DE DESPESAS:';
            1 : cdsGerencial1.FieldByName('TIPOTOT').asString := 'TOTAL DE ABATIMENTOS:';
            2 : cdsGerencial1.FieldByName('TIPOTOT').asString := 'TOTAL DE ENCARGOS:';
          end;

          cdsGerencial1.FieldByName('RUBRICA').asString  := dtmBaseDados.qry.FieldByName('RUBRICA').asString;
          cdsGerencial1.FieldByName('C_CUSTO').asString  := dtmBaseDados.qry.FieldByName('C_CUSTO').asString;
          cdsGerencial1.FieldByName('VALOR').asFloat     := dtmBaseDados.qry.FieldByName('VALOR').asFloat;
          cdsGerencial1.FieldByName('TOT_FOLHA').asFloat := rTotalFolha;

          rTotParcial := rTotParcial + dtmBaseDados.qry.FieldByName('VALOR').asFloat;

          dtmBaseDados.qry.Next;

          if (dtmBaseDados.qry.FieldByName('CODCENTROCUSTO').asString <> sCCusto) or
             (dtmBaseDados.qry.EOF) then
            cdsGerencial1.FieldByName('TOT_PARCIAL').asFloat := rTotParcial;

          cdsGerencial1.Post;
        until (cdsGerencial1.FieldByName('TOT_PARCIAL').asFloat <> 0);
      end;

      // Inserir linhas que tenham vindo da seleção das Linhas da Query Auxiliar
      dtmBaseDados.qry.Close;

      if (rgApanhaDataTrein.ItemIndex = 0) then
        byNumLinhasInfCompl := 5
      else
        byNumLinhasInfCompl := 6;

      // Inserir linhas que tenham vindo da Entrada do Usuário da Tela (Informações
      // Complementares)
      for iLin:=1 to byNumLinhasInfCompl do
        for iCol:=1 to sgrInfComplem.ColCount-1 do
          if (Trim(sgrInfComplem.Cells[iCol,iLin]) <> '') then
          begin
            cdsGerencial1.Insert;
            cdsGerencial1.FieldByName('PROVENTODESCONTO').asString := 'DESPESAS';
            cdsGerencial1.FieldByName('TIPOPROVDESC').asInteger := 0;
            cdsGerencial1.FieldByName('CODRUBRICA').asString := #255#255;
            cdsGerencial1.FieldByName('TIPOTOT').asString := 'TOTAL DE DESPESAS:';
            cdsGerencial1.FieldByName('RUBRICA').asString := sgrInfComplem.Cells[0,iLin];
            cdsGerencial1.FieldByName('CODCENTROCUSTO').asString := ListaCodCCusto[iCol-1];
            cdsGerencial1.FieldByName('C_CUSTO').asString := sgrInfComplem.Cells[iCol,0];
            cdsGerencial1.FieldByName('VALOR').asFloat := StrFloat(sgrInfComplem.Cells[iCol,iLin]);
            cdsGerencial1.FieldByName('TOT_FOLHA').asFloat := rTotalFolha;
            cdsGerencial1.Post;
          end;

      if (rgApanhaDataTrein.ItemIndex = 0) then
      begin
        with (dtmBaseDados.qry) do
        begin
          Close;
          SQL.Clear;
          SQL.Add('SELECT');
          SQL.Add('  F.CODCENTROCUSTO,');
          SQL.Add('  DECODE (CC.NOME,'''','''',NOME) || DECODE(CC.CODREDUZIDO,'''','''','' (''||');
          SQL.Add('    RTRIM(CC.CODREDUZIDO)||'')'') AS C_CUSTO,');
          SQL.Add('  SUM(H.VALOR + H.DESP_VIAG + H.DESP_ESTAD + H.DESP_OUTR) AS TOTCURSOS');
          SQL.Add('FROM');
          SQL.Add('  HSTTRN H, FUNCIONARIO F, CENTCUST CC');
          SQL.Add('WHERE');
          if (rgTipoDataTrein.ItemIndex = 0) then
            SQL.Add('  (TO_CHAR(H.DATREINI, ''YYYY/MM'') = '+sMesRef+') AND')
          else
            SQL.Add('  (TO_CHAR(H.DATREFIM, ''YYYY/MM'') = '+sMesRef+') AND');
          SQL.Add('  (H.IDPESSOA       = F.IDPESSOA) AND');
          SQL.Add('  (F.IDEMPRESA      = CC.IDEMPRESA) AND');
          SQL.Add('  (F.CODCENTROCUSTO = CC.CODCENTROCUSTO)');
          SQL.Add('GROUP BY');
          SQL.Add('  F.CODCENTROCUSTO, CC.NOME, CC.CODREDUZIDO');
          Open;
        end;

        while not(dtmBaseDados.qry.EOF) do
        begin
          cdsGerencial1.Insert;
          cdsGerencial1.FieldByName('PROVENTODESCONTO').asString := 'DESPESAS';
          cdsGerencial1.FieldByName('TIPOPROVDESC').asInteger := 0;
          cdsGerencial1.FieldByName('CODRUBRICA').asString := #255#255;
          cdsGerencial1.FieldByName('TIPOTOT').asString := 'TOTAL DE DESPESAS:';
          cdsGerencial1.FieldByName('RUBRICA').asString := sgrInfComplem.Cells[0,6];
          cdsGerencial1.FieldByName('CODCENTROCUSTO').asString :=
            dtmBaseDados.qry.FieldByName('CODCENTROCUSTO').asString;
          cdsGerencial1.FieldByName('C_CUSTO').asString :=
            dtmBaseDados.qry.FieldByName('C_CUSTO').asString;
          cdsGerencial1.FieldByName('VALOR').asFloat :=
            dtmBaseDados.qry.FieldByName('TOTCURSOS').asFloat;
          cdsGerencial1.FieldByName('TOT_FOLHA').asFloat := rTotalFolha;
          cdsGerencial1.Post;
          
          dtmBaseDados.qry.Next;
        end;
      end;

      // A Ordem deve ser pelo Código ou Nome do C. de Custo
      case (cbmOrdermDemDespPessoal.ItemIndex) of
        0 : cdsGerencial1.IndexName := 'cdsGerencial1IndexCodigoCC';
        1 : cdsGerencial1.IndexName := 'cdsGerencial1IndexNomeCC';
      end;

      cdsGerencial1.First;
    end
    else
    begin
      cdsGerencial1.Insert;
      cdsGerencial1.FieldByName('PROVENTODESCONTO').asString := 'DESPESAS';
      cdsGerencial1.FieldByName('TIPOPROVDESC').asInteger := 0;
      cdsGerencial1.FieldByName('CODRUBRICA').asString := '';
      cdsGerencial1.FieldByName('TIPOTOT').asString := 'TOTAL DE DESPESAS:';
      cdsGerencial1.FieldByName('RUBRICA').asString := '';
      cdsGerencial1.FieldByName('C_CUSTO').asString := '';
      cdsGerencial1.FieldByName('VALOR').asFloat := 0;
      cdsGerencial1.FieldByName('TOT_FOLHA').asFloat := rTotalFolha;
      cdsGerencial1.Post;
    end;
  end;
end;

procedure TfrmParamGerencial.LeArquivoConfig;
begin
  // Recupera as últimas alterações das opções
  //ArqConfig       := TIniFile.Create('C:\CONFIG_FOLHAPAGTO.INI');
  ArqConfig       := TIniFile.Create(Sistema.RetornaCaminhoArquivos(Sistema.IdEmpresa)+'\CONFIG_FOLHAPAGTO.INI');//Ádler Teodoro de Souza SOL 109421 KINTANA 496332
  sCodRubricaSel  := ArqConfig.ReadString ('REL_GERENCIAL', 'Rubricas1', '');
  sCodRubricaSel2 := ArqConfig.ReadString ('REL_GERENCIAL', 'Rubricas2', '');
  sCodRubricaSel3 := ArqConfig.ReadString ('REL_GERENCIAL', 'Rubricas3', '');
  sCodRubricaSel4 := ArqConfig.ReadString ('REL_GERENCIAL', 'Rubricas4', '');
  sCodSitFuncSel  := ArqConfig.ReadString ('REL_GERENCIAL', 'Situacoes', '');
  sAux            := ArqConfig.ReadString ('REL_GERENCIAL', 'Estabelec', '');
  sOrdemRelA      := ArqConfig.ReadString ('REL_GERENCIAL', 'OrdemRelA', '0');
  edSetor.Text    := ArqConfig.ReadString ('REL_GERENCIAL', 'TituloRel',
    'Divisão de Recursos Humanos e Logísticos - DIR');

  VerificaOpcoes(chklstRubrica1,  ListaCodRubrica, sCodRubricaSel,  ',');
  VerificaOpcoes(chklstRubrica2,  ListaCodRubrica, sCodRubricaSel2, ',');
  VerificaOpcoes(chklstRubrica3,  ListaCodRubrica, sCodRubricaSel3, ',');
  VerificaOpcoes(chklstRubrica4,  ListaCodRubrica, sCodRubricaSel4, ',');
  VerificaOpcoes(chklstSituacoes, ListaCodSitFunc, sCodSitFuncSel,  ',');

  if (sAux = '') then
  begin
    qryEstab.First;
    sAux := qryEstab.FieldByName('IDPESSOA').asString;
  end;
  dblkcbEstab.LookUpValue := sAux;
  dblkcbEstab.UpDate;

  cbmOrdermDemDespPessoal.ItemIndex := StrToIntDef(sOrdemRelA,0);

  edCodRubricas.Text  := sCodRubricaSel;
  edCodRubricas2.Text := sCodRubricaSel4;

  HabilitaBtOk;
end;

procedure TfrmParamGerencial.GravaArquivoConfig;
var
  sGravaPadrao: string;
begin
  // Grava as últimas alterações da Opção de Rubricas 1
  CriaListaOpcoes (chklstRubrica1, ListaCodRubrica, sGravaPadrao, ',', false);
  ArqConfig.WriteString ('REL_GERENCIAL','Rubricas1',sGravaPadrao);

  // Grava as últimas alterações da Opção de Rubricas 2
  CriaListaOpcoes (chklstRubrica2, ListaCodRubrica, sGravaPadrao, ',', false);
  ArqConfig.WriteString ('REL_GERENCIAL','Rubricas2',sGravaPadrao);

  // Grava as últimas alterações da Opção de Rubricas 3
  CriaListaOpcoes (chklstRubrica3, ListaCodRubrica, sGravaPadrao, ',', false);
  ArqConfig.WriteString ('REL_GERENCIAL','Rubricas3',sGravaPadrao);

  // Grava as últimas alterações da Opção de Rubricas 4
  CriaListaOpcoes (chklstRubrica4, ListaCodRubrica, sGravaPadrao, ',', false);
  ArqConfig.WriteString ('REL_GERENCIAL','Rubricas4',sGravaPadrao);

  // Grava as últimas alterações da Opção de Situações
  CriaListaOpcoes (chklstSituacoes, ListaCodSitFunc, sGravaPadrao, ',', false);
  ArqConfig.WriteString ('REL_GERENCIAL','Situacoes',sGravaPadrao);

  ArqConfig.WriteString ('REL_GERENCIAL','Estabelec',qryEstab.FieldByName('IDPESSOA').asString);
  ArqConfig.WriteString ('REL_GERENCIAL','OrdemRelA',IntToStr(cbmOrdermDemDespPessoal.ItemIndex));
  ArqConfig.WriteString ('REL_GERENCIAL','TituloRel',edSetor.Text);
end;

procedure TfrmParamGerencial.HabilitaBtOk;
var
  c: integer;
  bSelRub1, bSelRub2, bSelRub3, bSelSit: boolean;
begin
  bSelRub1 := false;
  for c:=0 to chklstRubrica1.Items.Count-1 do
    if (chklstRubrica1.Checked[c]) then
    begin
      bSelRub1 := true;
      break;
    end;

  bSelRub2 := false;
  for c:=0 to chklstRubrica2.Items.Count-1 do
    if (chklstRubrica2.Checked[c]) then
    begin
      bSelRub2 := true;
      break;
    end;

  bSelRub3 := false;
  for c:=0 to chklstRubrica3.Items.Count-1 do
    if (chklstRubrica3.Checked[c]) then
    begin
      bSelRub3 := true;
      break;
    end;

  bSelSit := false;
  for c:=0 to chklstSituacoes.Items.Count-1 do
    if (chklstSituacoes.Checked[c]) then
    begin
      bSelSit := true;
      break;
    end;

  bbtnConfirmar.Enabled := (bSelRub1) and (bSelRub2) and (bSelRub3) and (bSelSit) and
    (Trim(dblkcbEstab.Text) <> '') and (Trim(speAno.Text) <> '') and
    (Trim(dblkcbMotivo.Text) <> '');
end;

end.
