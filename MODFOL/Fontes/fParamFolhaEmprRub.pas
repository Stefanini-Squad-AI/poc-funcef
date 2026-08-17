// *****************************************************************************
// ***************************** REGISTRO DE ALTERAÇÕES ************************
// *****************************************************************************
// Autor(a)    :  Ádler Teodoro de Souza
// Data        :  19/02/2009
// Pendência   : SOL 109421 KINTANA 496332
// Descricao   :  Alteração de gravação de arquivos de log na raiz do disco C: .
//------------------------------------------------------------------------------
unit fParamFolhaEmprRub;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs, MAHlpBtn,
  StdCtrls, Buttons, TB97Tlbr, TB97, ExtCtrls, Db, DBTables, Spin, Wwquery, wwdblook,
  checklst, IvDictio, IvMulti, IvEMulti, ComCtrls, fSairAjuda;

type
  TfrmParamFolhaEmprRub = class(TfrmSairAjuda)
    qryEstab: TwwQuery;
    gbxEstab: TGroupBox;
    dblkcbEstab: TwwDBLookupCombo;
    gbxAnoMesRef: TGroupBox;
    cmbMes: TComboBox;
    speAno: TSpinEdit;
    rgProcesso: TRadioGroup;
    gbxRubricas: TGroupBox;
    Label1: TLabel;
    chklstRubrica: TCheckListBox;
    edCodRubricas: TEdit;
    sbtnMarcarRub: TBitBtn;
    gbxOrdem: TGroupBox;
    cmbOrderBy: TComboBox;
    rgTipoRelat: TRadioGroup;
    gbxTipoPapel: TGroupBox;
    cmbTipoPapel: TComboBox;
    bbtnConfirmar: TBitBtn;
    ToolbarSep971: TToolbarSep97;
    Paginas: TPageControl;
    tbshTipoFolha: TTabSheet;
    chklstTipoFolha: TCheckListBox;
    tbshCCusto: TTabSheet;
    chklstCCusto: TCheckListBox;
    spbtSelTodos: TBitBtn;
    spbtInvSelecao: TBitBtn;
    procedure FormCreate(Sender: TObject);
    procedure bbtnConfirmarClick(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure chklstRubricaDrawItem(Control: TWinControl; Index: Integer;
      Rect: TRect; State: TOwnerDrawState);
    procedure dblkcbEstabChange(Sender: TObject);
    procedure chklstRubricaClickCheck(Sender: TObject);
    procedure sbtnMarcarRubClick(Sender: TObject);
    procedure spbtSelTodosClick(Sender: TObject);
    procedure spbtInvSelecaoClick(Sender: TObject);
    procedure chklstTipoFolhaClickCheck(Sender: TObject);
    procedure speAnoChange(Sender: TObject);
    procedure cmbOrderByChange(Sender: TObject);
    procedure chklstTipoFolhaKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
  private
    procedure HabilitaBtOk;
  end;

var
  frmParamFolhaEmprRub: TfrmParamFolhaEmprRub;

implementation

uses uSistema, uMensErro, uDataBase, fAguarde, dBaseDados,
  uFuncoesUteis, UsoGeralRH, uComumRelats, dRelatorios;

{$R *.DFM}

procedure TfrmParamFolhaEmprRub.FormCreate(Sender: TObject);
var
  iPos: integer;
begin
  inherited;
  if not(Assigned(ListaCodTipoFolha)) then
    ListaCodTipoFolha := TStringList.Create;
  if not(Assigned(ListaCodCCusto)) then
    ListaCodCCusto := TStringList.Create;
  if not(Assigned(ListaCodRubrica)) then
    ListaCodRubrica := TStringList.Create;

  cmbTipoPapel.Items.Assign (dtmRelatorios.rpFolhaEmprRub.PrinterSetup.PaperNames);

  iPos := ProcuraStList (cmbTipoPapel.Items,'A4');
  if (iPos = -1) then
    cmbTipoPapel. ItemIndex := 0
  else
    cmbTipoPapel. ItemIndex := iPos;

  FazQuery(dtmBaseDados.qry,'SELECT NORMALINI FROM PARAMRH');
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

  rgTipoRelat.Enabled     := false;
  cmbOrderBy.ItemIndex    := 0;
  Paginas.ActivePageIndex := 0;

  HabilitaBtOk;
end;

procedure TfrmParamFolhaEmprRub.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  dtmBaseDados.qry.Close;
  qryEstab.Close;
  inherited;
end;

procedure TfrmParamFolhaEmprRub.chklstRubricaDrawItem(Control: TWinControl; Index: Integer;
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

procedure TfrmParamFolhaEmprRub.dblkcbEstabChange(Sender: TObject);
begin
  dblkcbEstab.Text := Trim(dblkcbEstab.Text);
  HabilitaBtOk;
end;

procedure TfrmParamFolhaEmprRub.speAnoChange(Sender: TObject);
begin
  HabilitaBtOk;
end;

procedure TfrmParamFolhaEmprRub.cmbOrderByChange(Sender: TObject);
begin
  rgTipoRelat.Enabled := (cmbOrderBy.ItemIndex in [4,5,6,7]);
  if not(rgTipoRelat.Enabled) then
    rgTipoRelat.ItemIndex := 0;
end;

procedure TfrmParamFolhaEmprRub.chklstTipoFolhaKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  if (Key = VK_TAB) then
    InvalidateItemListBox(TCustomListBox(Sender),TCustomListBox(Sender).ItemIndex);
end;

procedure TfrmParamFolhaEmprRub.chklstTipoFolhaClickCheck(Sender: TObject);
begin
  InvalidateItemListBox(TCustomListBox(Sender),TCustomListBox(Sender).ItemIndex);
  HabilitaBtOk;
end;

procedure TfrmParamFolhaEmprRub.chklstRubricaClickCheck(Sender: TObject);
begin
  CriaListaOpcoes (chklstRubrica, ListaCodRubrica, sCodRubricaSel, ',', false);
  edCodRubricas.Text := sCodRubricaSel;
  InvalidateItemListBox(TCustomListBox(Sender),TCustomListBox(Sender).ItemIndex);
  HabilitaBtOk;
end;

procedure TfrmParamFolhaEmprRub.spbtSelTodosClick(Sender: TObject);
var
  c: integer;
begin
  case (Paginas.ActivePageIndex) of
    0 : chkListAux := chklstTipoFolha;
    1 : chkListAux := chklstCCusto;
  end;

  for c:=0 to chkListAux.Items.Count-1 do
    chkListAux.Checked[c] := true;
  chkListAux.Repaint;
  HabilitaBtOk;
end;

procedure TfrmParamFolhaEmprRub.spbtInvSelecaoClick(Sender: TObject);
var
  c: integer;
begin
  case (Paginas.ActivePageIndex) of
    0 : chkListAux := chklstTipoFolha;
    1 : chkListAux := chklstCCusto;
  end;

  for c:=0 to chkListAux.Items.Count-1 do
    chkListAux.Checked[c] := not(chkListAux.Checked[c]);
  chkListAux.Repaint;
  HabilitaBtOk;
end;

procedure TfrmParamFolhaEmprRub.sbtnMarcarRubClick(Sender: TObject);
begin
  edCodRubricas.Text := Trim(edCodRubricas.Text);

  VerificaOpcoes (chklstRubrica, ListaCodRubrica, edCodRubricas.Text, ',');
  HabilitaBtOk;
  chklstRubrica.Repaint;
end;

procedure TfrmParamFolhaEmprRub.bbtnConfirmarClick(Sender: TObject);
var
  wNum: word;
  NomeTabela: string;
begin
  if (rgProcesso.ItemIndex = 0) then 
    NomeTabela := 'PREVIAFOLPAG'
  else
    NomeTabela := 'HISTRUBSAL';

  // Rubrica(s) selecionada(s)
  wNum := CriaListaOpcoes (chklstRubrica, ListaCodRubrica, sCodRubricaSel, ',', true);
  if (wNum = ListaCodRubrica.Count) then
    sCodRubricaSel := '';

  // Tipos de Folha selecionados
  wNum := CriaListaOpcoes (chklstTipoFolha, ListaCodTipoFolha, sCodTipoFolhaSel, ',', false);
  if (wNum = ListaCodTipoFolha.Count) then
    sCodTipoFolhaSel := '';

  // C. de Custo selecionados
  wNum := CriaListaOpcoes (chklstCCusto, ListaCodCCusto, sCodCCustoSel, ',', true);
  if (wNum = ListaCodCCusto.Count) then
    sCodCCustoSel := '';

  // Monta Query Auxiliar
  dtmRelatorios.qryFolhaEmprRub.Close;
  with (dtmRelatorios.qryFolhaEmprRub.SQL) do
  begin
    Clear;
    Add('SELECT');
    // Dados do Estabelecimento
    Add('  PJ.RAZAOSOCIAL  AS EMPRESA,');
    Add('  (''CNPJ: '' || PJ.NUMDOCUMENTO) AS CGC,');
    Add('  ES.CODESTADO    AS UF,');
    Add('  RTRIM(E.LOGRADOURO) ||'', ''|| E.NUMERO || DECODE(E.COMPLEMENTO,'' '','' - '' ||');
    Add('    RTRIM(E.COMPLEMENTO)) ||'' - ''|| RTRIM(E.BAIRRO) ||'' - ''|| RTRIM(CIDADES.NOME) ||'' - CEP:''||');
    Add('    RTRIM(SUBSTR(E.CEP,1,5)) ||''-''|| RTRIM(SUBSTR(E.CEP,6,3)) AS ENDERECO,');
    // Dados da Rubrica
    Add('  RP.CODPROVDESC  AS COD_RUBRICA,');
    Add('  PD.DESCRICAO    AS NOME_RUBRICA,');
    Add('  ('+QuotedStr(MesExtensoAno(speAno.Text +'/'+ PoeZero(cmbMes.ItemIndex+1)))+') AS MES_REF,');
    Add('  H.SEQRUBRICA,');
    Add('  H.VALORPROVENTO AS VALOR,');
    // Dados do Funcionário
    Add('  F.MATRICULA,');
    Add('  UPPER(PF.NOME) AS FUNCIONARIO,');
    Add('  CC.CODCENTROCUSTO, CC.NOME AS NOMECENTROCUSTO');
    Add('FROM');
    Add('  '+NomeTabela+' H, PESSOA PJ, PESSOA PF, ENDPESS E, PROVDESC PD,');
    Add('  RUBRICAXPESS RP, FUNCIONARIO F, CIDADES, ESTADO ES, CENTCUST CC, FILIALPESSOA FP');
    // ------------------------------------------------------------------------------- //
    Add('WHERE');
    Add('  (RP.IDPESSOA       = ' +IntToStr(Sistema.IdEmpresa)+ ') AND');
    Add('  (PJ.IDPESSOA       = ' +qryEstab.FieldByName('CODIGO').asString+ ') AND');

    // C. Custo(s) selecionado(s)
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
        if (Pos(',',sUsuXccusto) > 0) then
          Add('  (F.CODCENTROCUSTO IN ' +sUsuXccusto+ ') AND')
        else
          Add('  (F.CODCENTROCUSTO  = ' +sUsuXccusto+ ') AND');
    end;

    // Rubrica(s) selecionada(s)
    if (Pos(',',sCodRubricaSel) > 0) then
    begin
      Add('  (H.CODPROVDESC    IN (' +sCodRubricaSel+ ')) AND');
      Add('  (RP.CODPROVDESC   IN (' +sCodRubricaSel+ ')) AND');
    end
    else
    begin
      Add('  (H.CODPROVDESC     = ' +sCodRubricaSel+ ') AND');
      Add('  (RP.CODPROVDESC    = ' +sCodRubricaSel+ ') AND');
    end;

    Add('  (H.MES             = '+QuotedStr(speAno.Text +'/'+ PoeZero(cmbMes.ItemIndex+1))+ ') AND');

    if (sCodTipoFolhaSel <> '') then
      if (Pos(',',sCodTipoFolhaSel) > 0) then
        Add('  (H.IDMOTIVO       IN (' +sCodTipoFolhaSel+ ')) AND')
      else
        Add('  (H.IDMOTIVO        = ' +sCodTipoFolhaSel+ ') AND');

    Add('  (PJ.IDPESSOA       = FP.IDFILIALPESSOA) AND');
    Add('  (PJ.IDPESSOA       = F.IDESTAB)         AND');
    Add('  (PJ.IDPESSOA       = E.IDPESSOA)        AND');
    Add('  (PJ.IDENDCOMERCIAL = E.IDENDERECO)      AND');
    Add('  (E.IDCIDADES       = CIDADES.IDCIDADES) AND');
    Add('  (CIDADES.IDESTADO  = ES.IDESTADO)       AND');
    Add('  (F.CODCENTROCUSTO  = CC.CODCENTROCUSTO) AND');
    Add('  (F.IDEMPRESA       = CC.IDEMPRESA)      AND');        
    Add('  (F.IDPESSOA        = PF.IDPESSOA)       AND');
    Add('  (F.IDPESSOA        = H.IDPESSOA)        AND');
    Add('  (H.IDRUBRICA       = PD.IDPROVENTO)     AND');
    Add('  (PD.IDPROVENTO     = RP.IDRUBRICA)');
    Add('ORDER BY');
    case (cmbOrderBy.ItemIndex) of
      0 : Add('  COD_RUBRICA, FUNCIONARIO');
      1 : Add('  COD_RUBRICA, MATRICULA');
      2 : Add('  NOME_RUBRICA, FUNCIONARIO');
      3 : Add('  NOME_RUBRICA, MATRICULA');
      4 : Add('  COD_RUBRICA, CODCENTROCUSTO, FUNCIONARIO');
      5 : Add('  COD_RUBRICA, CODCENTROCUSTO, MATRICULA');
      6 : Add('  NOME_RUBRICA, NOMECENTROCUSTO, FUNCIONARIO');
      7 : Add('  NOME_RUBRICA, NOMECENTROCUSTO, MATRICULA');
    end;
    //SaveToFile ('c:\qry.txt');
    SaveToFile (Sistema.RetornaCaminhoArquivos(Sistema.IdEmpresa)+'\qry.txt');//Ádler Teodoro de Souza SOL 109421 KINTANA 496332
  end;

  with (dtmRelatorios) do
  begin
    rpFolhaEmprRub.PrinterSetup.PaperName := cmbTipoPapel.Items[cmbTipoPapel.ItemIndex];
    rpFolhaEmprRubGrpHdrBnd2.Visible  := (cmbOrderBy.ItemIndex in [4,5,6,7]) and (rgTipoRelat.ItemIndex = 0);
    rpFolhaEmprRubGrpFootBnd2.Visible := (cmbOrderBy.ItemIndex in [4,5,6,7]);
    rpFolhaEmprRubDtlBnd.Visible      := (rgTipoRelat.ItemIndex = 0);

    // Trato o abrupamento por Rubrica
    if (cmbOrderBy.ItemIndex in [0,1,2,3]) and (rgTipoRelat.ItemIndex = 0) then
      rpFolhaEmprRubGrpHdrBnd1.Height := 13.229
    else
    begin
      if (rgTipoRelat.ItemIndex = 0) then
        rpFolhaEmprRubGrpFootBnd2.Height := 10.848
      else
        rpFolhaEmprRubGrpFootBnd2.Height := 7.408;

      rpFolhaEmprRubGrpHdrBnd1.Height := 6.35;
    end;
    // Isto é necessário porquê o RBuilder muda também a posição dos componentes que estão
    // fora da área da Banda Pai quando esta tiver seu tamanho diminuído a ponto de cobrir
    // o componente, que é o caso aqui.
    rpFolhaEmprRubLbl6.Top  := 0;
    rpFolhaEmprRubLbl6.Top  := 7.673;
    rpFolhaEmprRubLbl7.Top  := 7.673;
    rpFolhaEmprRubLbl8.Top  := 7.673;
    rpFolhaEmprRubLine1.Top := 12.171;

    rpFolhaEmprRubLbl6.Visible  := (cmbOrderBy.ItemIndex in [0,1,2,3]) and (rgTipoRelat.ItemIndex = 0);
    rpFolhaEmprRubLbl7.Visible  := rpFolhaEmprRubLbl6.Visible;
    rpFolhaEmprRubLbl8.Visible  := rpFolhaEmprRubLbl6.Visible;
    rpFolhaEmprRubLbl16.Visible := (rgTipoRelat.ItemIndex = 1);
    rpFolhaEmprRubLbl17.Visible := (rgTipoRelat.ItemIndex = 1);

    rpFolhaEmprRubLine1.Visible := rpFolhaEmprRubLbl6.Visible;
    rpFolhaEmprRubLine3.Visible := (rgTipoRelat.ItemIndex = 0);
    rpFolhaEmprRubLbl12.Visible := rpFolhaEmprRubLine3.Visible;
    rpFolhaEmprRubLbl13.Visible := rpFolhaEmprRubLine3.Visible;

    if (rgTipoRelat.ItemIndex = 1) then
    begin
      rpFolhaEmprRubDBTxt14.Width := rpFolhaEmprRubLbl7.Width;

      rpFolhaEmprRubDBCalc1.Left  := rpFolhaEmprRubLbl16.Left;
      rpFolhaEmprRubDBCalc1.Width := rpFolhaEmprRubLbl16.Width;

      rpFolhaEmprRubDBCalc2.Left  := rpFolhaEmprRubLbl17.Left;
      rpFolhaEmprRubDBCalc2.Width := rpFolhaEmprRubLbl17.Width;
    end
    else
    begin
      rpFolhaEmprRubDBCalc1.Left  := 120.65;
      rpFolhaEmprRubDBCalc1.Width := 14.817;

      rpFolhaEmprRubDBCalc2.Left  := 169.863;
      rpFolhaEmprRubDBCalc2.Width := 23.283;
    end;
    
    rpFolhaEmprRubDBTxt13.Visible := (cmbOrderBy.ItemIndex in [4,5,6,7]) and (rgTipoRelat.ItemIndex = 1);
    rpFolhaEmprRubDBTxt14.Visible := rpFolhaEmprRubDBTxt13.Visible;
  end;

  frmAguarde.Mostra('Folha de Empregados por Rubrica');
  frmAguarde.Pos := 0;
  dtmRelatorios.qryFolhaEmprRub.Open;

  if (dtmRelatorios.qryFolhaEmprRub.IsEmpty) then
  begin
    ModalResult := mrNone;
    frmAguarde.Apaga;
    MsgDlg('Não há dados a serem exibidos! Verifique.','Aviso',mtInformation,[mbOk,mbHelp],0);
  end;
end;

// -------------------------------------------------------------------------------------
// Funções do Form
// -------------------------------------------------------------------------------------
procedure TfrmParamFolhaEmprRub.HabilitaBtOk;
var
  c: integer;
  bSelRub, bSelTipoFolha: boolean;
begin
  // Verifica se algum Tipo de Folha foi selecionado
  bSelTipoFolha := false;
  for c:=0 to chklstTipoFolha.Items.Count-1 do
    if (chklstTipoFolha.Checked[c]) then
    begin
      bSelTipoFolha := true;
      break;
    end;

  bSelRub := false;
  for c:=0 to chklstRubrica.Items.Count-1 do
    if (chklstRubrica.Checked[c]) then
    begin
      bSelRub := true;
      break;
    end;

  bbtnConfirmar.Enabled := (bSelTipoFolha) and (bSelRub) and (dblkcbEstab.Text <> '') and
    (Trim(speAno.Text) <> '');
end;

end.
