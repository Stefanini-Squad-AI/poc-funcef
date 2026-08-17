// *****************************************************************************
// ***************************** REGISTRO DE ALTERAÇÕES ************************
// *****************************************************************************
// Autor(a)    :  Ádler Teodoro de Souza
// Data        :  27/02/2009
// Pendência   : SOL 109421 KINTANA 496332
// Descricao   :  Alteração de gravação de arquivos de log na raiz do disco C: .
//------------------------------------------------------------------------------

unit fParamLancRubReemb;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs, MAHlpBtn,
  StdCtrls, Buttons, TB97Tlbr, TB97, ExtCtrls, Db, DBTables, Wwquery, wwdblook, Spin,
  checklst, IvDictio, IvMulti, IvEMulti, fSairAjuda, ColorCheckListBox;

type
  TfrmParamLancRubReemb = class(TfrmSairAjuda)
    gbxEstab: TGroupBox;
    dblkcbEstab: TwwDBLookupCombo;
    qryEstab: TwwQuery;
    gbxOrdem: TGroupBox;
    cmbOrderBy: TComboBox;
    gbxTipoPapel: TGroupBox;
    cmbTipoPapel: TComboBox;
    gbxRubricas: TGroupBox;
    chklstRubrica: TColorCheckListBox;
    gbxMesInicio: TGroupBox;
    cmbMes: TComboBox;
    speAno: TSpinEdit;
    rgPermanente: TRadioGroup;
    Label1: TLabel;
    edCodRubricas: TEdit;
    sbtnMarcarRub: TBitBtn;
    bbtnSelTodas: TBitBtn;
    bbtnInverteSel: TBitBtn;
    bbtnConfirmar: TBitBtn;
    ToolbarSep971: TToolbarSep97;
    procedure FormCreate(Sender: TObject);
    procedure bbtnConfirmarClick(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure chklstRubricaDrawItem(Control: TWinControl; Index: Integer; Rect: TRect;
      State: TOwnerDrawState);
    procedure dblkcbEstabChange(Sender: TObject);
    procedure chklstRubricaClickCheck(Sender: TObject);
    procedure sbtnMarcarRubClick(Sender: TObject);
    procedure bbtnSelTodasClick(Sender: TObject);
    procedure bbtnInverteSelClick(Sender: TObject);
    procedure chklstRubricaKeyDown(Sender: TObject; var Key: Word; Shift: TShiftState);
  private
    procedure HabilitaBtOk;
  end;

var
  frmParamLancRubReemb: TfrmParamLancRubReemb;

implementation

uses uSistema, uMensErro, uDataBase, fAguarde, dBaseDados, uFuncoesUteisRH, UsoGeralRH,
     uComumRelats, dRelatoriosModAuto;

{$R *.DFM}

procedure TfrmParamLancRubReemb.FormCreate(Sender: TObject);
var
  iPos: integer;
begin
  inherited;
  if not(Assigned(ListaCodRubrica)) then
    ListaCodRubrica := TStringList.Create;

  cmbTipoPapel.Items.Assign (dtmRelatoriosModAuto.rpLancRubReemb.PrinterSetup.PaperNames);

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

  dblkcbEstab.LookupValue := qryEstab.FieldByName('IDPESSOA').asString;
  dblkcbEstab.Update;

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
    SQL.Add('  (PD.CODRUBCLT = ''50490'') AND');
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

  bbtnSelTodasClick(Self);

  cmbOrderBy.ItemIndex := 0;

  HabilitaBtOk;
end;

procedure TfrmParamLancRubReemb.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  dtmBaseDados.qry.Close;
  qryEstab.Close;
  inherited;
end;

procedure TfrmParamLancRubReemb.chklstRubricaDrawItem(Control: TWinControl; Index: Integer;
  Rect: TRect; State: TOwnerDrawState);
begin
  with (TColorCheckListBox(Control).Canvas) do
  begin
    if (TColorCheckListBox(Control).Checked[Index]) then
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
    TextOut(Rect.Left, Rect.Top, TColorCheckListBox(Control).Items[Index]);
  end;
end;

procedure TfrmParamLancRubReemb.dblkcbEstabChange(Sender: TObject);
begin
  dblkcbEstab.Text := Trim(dblkcbEstab.Text);
  HabilitaBtOk;
end;

procedure TfrmParamLancRubReemb.chklstRubricaKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  if (Key = VK_TAB) then
    chklstRubricaClickCheck(Sender);
end;

procedure TfrmParamLancRubReemb.chklstRubricaClickCheck(Sender: TObject);
begin
  CriaListaOpcoes (chklstRubrica, ListaCodRubrica, sCodRubricaSel, ',', false);
  edCodRubricas.Text := sCodRubricaSel;
  InvalidateItemListBox(TCustomListBox(Sender),TCustomListBox(Sender).ItemIndex);
  HabilitaBtOk;  
end;

procedure TfrmParamLancRubReemb.bbtnSelTodasClick(Sender: TObject);
var
  c: integer;
begin
  for c:=0 to chklstRubrica.Items.Count-1 do
    chklstRubrica.Checked[c] := true;
  chklstRubrica.Repaint;
  HabilitaBtOk;
end;

procedure TfrmParamLancRubReemb.bbtnInverteSelClick(Sender: TObject);
var
  c: integer;
begin
  for c:=0 to chklstRubrica.Items.Count-1 do
    chklstRubrica.Checked[c] := not(chklstRubrica.Checked[c]);
  chklstRubrica.Repaint;
  HabilitaBtOk;
end;

procedure TfrmParamLancRubReemb.sbtnMarcarRubClick(Sender: TObject);
begin
  edCodRubricas.Text := Trim(edCodRubricas.Text);
  VerificaOpcoes (chklstRubrica, ListaCodRubrica, edCodRubricas.Text, ',');
  chklstRubrica.Repaint;
  HabilitaBtOk;  
end;

procedure TfrmParamLancRubReemb.bbtnConfirmarClick(Sender: TObject);
var
  wNum: word;
begin
  // Rubrica(s) selecionada(s)
  wNum := CriaListaOpcoes (chklstRubrica, ListaCodRubrica, sCodRubricaSel, ',', true);
  if (wNum = ListaCodRubrica.Count) then
    sCodRubricaSel := '';

  // Monta Query Auxiliar
  dtmRelatoriosModAuto.qryLancRubReemb.Close;
  with (dtmRelatoriosModAuto.qryLancRubReemb.SQL) do
  begin
    Clear;
    Add('SELECT DISTINCT');
    // Dados do Estabelecimento
    Add('  PJ.RAZAOSOCIAL AS EMPRESA,');
    Add('  CGC.NUM        AS CGC,');
    Add('  ES.CODESTADO   AS UF,');
    Add('  RTRIM(E.LOGRADOURO) ||'', ''|| E.NUMERO ||''''|| DECODE(E.COMPLEMENTO,'' '','' - '' ||''''||');
    Add('    RTRIM(E.COMPLEMENTO)) ||'' - ''|| RTRIM(E.BAIRRO) ||'' - ''|| RTRIM(CIDADES.NOME) ||'' - CEP:''||');
    Add('    RTRIM(SUBSTR(E.CEP,1,5)) ||''-''|| RTRIM(SUBSTR(E.CEP,6,3)) AS ENDERECO,');
    // Dados da Rubrica
    Add('  SUBSTR(RI.ANOMESINICIO,6,2) ||''/''|| SUBSTR(RI.ANOMESINICIO,1,4) ANOMES,');
    Add('  RI.ANOMESINICIO,');
    Add('  RP.CODPROVDESC   AS CODIGORUBRICA,');
    Add('  RP.DESCRPROVDESC AS NOMERUBRICA,');
    Add('  RI.VALORRUBRICA  AS VALORLANCADO,');
    Add('  DECODE(RI.FLGPERMANENTE,1,''Sim'',''Não'')        AS PERMANENTE,');
    Add('  DECODE(RI.FLGPERMANENTE,0,RI.NUMOCORRENCIAS,'''') AS OCORRENCIAS,');
    Add('  DECODE(RI.FLGPERMANENTE,0,RI.PARCELAS,'''')       AS PARCELAS,');
    Add('  RI.SEQRUBRICAINDIV                                AS SEQUENCIA,');
    // Dados do Funcionário
    Add('  F.MATRICULA,');
    Add('  UPPER(PF.NOME) AS FUNCIONARIO');
    Add('FROM');
    Add('  PESSOA PJ, PESSOA PF, ENDPESS E, RUBRICAXPESS RP, RUBRICAINDIV RI,');
    Add('  PROVDESC PD, FUNCIONARIO F, CIDADES, ESTADO ES, FILIALPESSOA FP,');
    // -------------------------------------------------------------------------- //
    // CGC da Empresa
    Add('  (SELECT FP.IDFILIALPESSOA AS IDPESSOA,');
    Add('          RTRIM(TDO.SIGLADOCUMENTO ||'' ''|| DO.NUMDOCUMENTO) AS NUM');
    Add('   FROM   DOCPESSOA DO, TIPODOCOFICIAL TDO, FILIALPESSOA FP');
    Add('   WHERE  ((TDO.SIGLADOCUMENTO = ''CNPJ:'')       OR');
    Add('           (TDO.SIGLADOCUMENTO = ''CGC:''))      AND');
    Add('          (TDO.IDDOCUMENTO     = DO.IDDOCUMENTO) AND');
    Add('          (FP.IDFILIALPESSOA   = DO.IDPESSOA)) CGC');
    // ------------------------------------------------------------------------------- //
    Add('WHERE');
    Add('  (PD.CODRUBCLT = ''50490'') AND');
    Add('  (RP.IDPESSOA  = '+IntToStr(Sistema.IdEmpresa)+')         AND');

    // Rubrica(s) selecionada(s)
    if (Trim(sCodRubricaSel) <> '') then
      if (Pos(',',sCodRubricaSel) > 0) then
        Add('  (RP.CODPROVDESC IN (' +sCodRubricaSel+ ')) AND')
      else
        Add('  (RP.CODPROVDESC  = ' +sCodRubricaSel+ ') AND');

    // C. de Custo(s) habilitado(s) para o usuário
    if (sUsuXccusto <> '') then
      Add('  (F.CODCENTROCUSTO IN ' +sUsuXccusto+ ') AND');

    // Estabelecimento(s) selecionado(s)
    if (Trim(dblkcbEstab.Text) <> '') then
      Add('  (PJ.IDPESSOA   = '+qryEstab.FieldByName('IDPESSOA').asString+')       AND')
    else
    begin
      // Estabelecimento(s) habilitados para o usuário
      if (sUsuXfilial <> '') then
        Add('  (PJ.IDPESSOA  IN ' +sUsuXfilial+ ') AND');
    end;

    Add('  (RI.ANOMESINICIO   = '+QuotedStr(speAno.Text +'/'+ PoeZero(cmbMes.ItemIndex+1))+')   AND');

    // Inclui Rubricas Permanentes
    if (rgPermanente.ItemIndex <> 2) then
      Add('  (RI.FLGPERMANENTE  = '+IntToStr(rgPermanente.ItemIndex)+')      AND');

    Add('  (FP.IDFILIALPESSOA = PJ.IDPESSOA)       AND');
    Add('  (PJ.IDPESSOA       = CGC.IDPESSOA)      AND');
    Add('  (PJ.IDPESSOA       = E.IDPESSOA)        AND');
    Add('  (PJ.IDENDCOMERCIAL = E.IDENDERECO)      AND');
    Add('  (F.IDESTAB         = PJ.IDPESSOA)       AND');
    Add('  (F.IDPESSOA        = RI.IDPESSOA)       AND');
    Add('  (RI.IDRUBRICA      = PD.IDPROVENTO)     AND');
    Add('  (RI.IDRUBRICA      = RP.IDRUBRICA)      AND');
    Add('  (RI.IDPESSOA       = PF.IDPESSOA)       AND');
    Add('  (E.IDCIDADES       = CIDADES.IDCIDADES) AND');
    Add('  (CIDADES.IDESTADO  = ES.IDESTADO)');
    Add('ORDER BY');
    case (cmbOrderBy.ItemIndex) of
      0 : Add('  RP.CODPROVDESC, F.MATRICULA, RI.ANOMESINICIO, RI.SEQRUBRICAINDIV');
      1 : Add('  RP.CODPROVDESC, FUNCIONARIO, RI.ANOMESINICIO, RI.SEQRUBRICAINDIV');
      2 : Add('  NOMERUBRICA, F.MATRICULA, RI.ANOMESINICIO, RI.SEQRUBRICAINDIV');
      3 : Add('  NOMERUBRICA, FUNCIONARIO, RI.ANOMESINICIO, RI.SEQRUBRICAINDIV');
    end;
    //SaveToFile ('c:\qry.txt');
    SaveToFile (Sistema.RetornaCaminhoArquivos(Sistema.IdEmpresa)+'\qry.txt');//Ádler Teodoro de Souza SOL 109421 KINTANA 496332
  end;

  frmAguarde.Mostra('Lançamentos de Rubricas Individuais');
  frmAguarde.Pos := 0;
  dtmRelatoriosModAuto.qryLancRubReemb.Open;
  frmAguarde.Max := dtmRelatoriosModAuto.qryLancRubReemb.RecordCount;
  frmAguarde.Min := 0;

  if (dtmRelatoriosModAuto.qryLancRubReemb.IsEmpty) then
  begin
    ModalResult := mrNone;
    frmAguarde.Apaga;
    MsgDlg('Não há dados a serem exibidos! Verifique.','Aviso',mtInformation,[mbOk,mbHelp],0);
  end
  else
    ModalResult := mrOk;

  dtmRelatoriosModAuto.rpLancRubReemb.PrinterSetup.PaperName := cmbTipoPapel.Items[cmbTipoPapel.ItemIndex];
end;

// -------------------------------------------------------------------------------------
// Funções do Form
// -------------------------------------------------------------------------------------
procedure TfrmParamLancRubReemb.HabilitaBtOk;
var
  c: integer;
  bSelRub: boolean;
begin
  bSelRub := false;
  for c:=0 to chklstRubrica.Items.Count-1 do
    if (chklstRubrica.Checked[c]) then
    begin
      bSelRub := true;
      break;
    end;

  bbtnConfirmar.Enabled := (bSelRub) and (dblkcbEstab.Text <> '');
end;

end.
