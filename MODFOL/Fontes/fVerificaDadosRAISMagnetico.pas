// *****************************************************************************
// ***************************** REGISTRO DE ALTERAÇÕES ************************
// *****************************************************************************
// Autor(a)    :  Ádler Teodoro de Souza
// Data        :  19/02/2009
// Pendência   : SOL 109421 KINTANA 496332
// Descricao   :  Alteração de gravação de arquivos de log na raiz do disco C: .
//------------------------------------------------------------------------------
unit fVerificaDadosRAISMagnetico;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  FOkCancelar, IvDictio, IvMulti, IvEMulti, MAHlpBtn, StdCtrls, Buttons,
  TB97Tlbr, TB97, ExtCtrls, Spin, wwdblook, Db, DBTables, 
  Wwdatsrc, FileCtrl, checklst, DBCtrls, Grids, DBGrids, CorreioCM,
  uProcuraDir, ZipDir, uTeclado, uFuncoesUteis,
  Mask, ComCtrls, IniFiles, Wwquery;

type
  TfrmVerificaDadosRAISMagnetico = class(TfrmOkCancelar)
    rbtnVerificar: TBitBtn;
    ToolbarSep972: TToolbarSep97;
    qryParamRH: TwwQuery;
    qryRAIS: TwwQuery;
    qryNomeResp: TwwQuery;
    qryResp: TwwQuery;
    qryNomeEstab: TwwQuery;
    qryEstab: TwwQuery;
    qryRubrica: TwwQuery;
    gbxAnoMesRef: TGroupBox;
    speAno: TSpinEdit;
    gbxResp: TGroupBox;
    dblkcbResp: TwwDBLookupCombo;
    gbxEstab: TGroupBox;
    chklstEstab: TCheckListBox;
    bbtnSelTodos: TBitBtn;
    bbtnInverteSel: TBitBtn;
    gbxRubSal: TGroupBox;
    lblDescricao1: TLabel;
    edCodRubricas: TEdit;
    sbtnMarcarRub: TBitBtn;
    Paginas: TPageControl;
    tbshFolhaNormal: TTabSheet;
    chklstRubrica1: TCheckListBox;
    tbsh1Parc13: TTabSheet;
    chklstRubrica2: TCheckListBox;
    tbsh2Parc13: TTabSheet;
    chklstRubrica3: TCheckListBox;
    tbshTiposContr: TTabSheet;
    gbxTipContra: TGroupBox;
    cbxEfetivos: TCheckBox;
    cbxEspeciais: TCheckBox;
    cbxTemporarios: TCheckBox;
    cbxEstagiarios: TCheckBox;
    cbxTerceiros: TCheckBox;
    cbxProprietarios: TCheckBox;
    cbxAutonomos: TCheckBox;
    bbtnSelTodasRub: TBitBtn;
    bbtnInverteSelRub: TBitBtn;
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure FormCreate(Sender: TObject);
    procedure qryRAISBeforeOpen(DataSet: TDataSet);
    procedure qryRAISAfterOpen(DataSet: TDataSet);
    procedure qryRAISAfterScroll(DataSet: TDataSet);
    procedure rbtnVerificarClick(Sender: TObject);
    procedure qryRespBeforeOpen(DataSet: TDataSet);
    procedure qryRespAfterOpen(DataSet: TDataSet);
    procedure qryEstabBeforeOpen(DataSet: TDataSet);
    procedure qryEstabAfterOpen(DataSet: TDataSet);
    procedure bbtnSelTodosClick(Sender: TObject);
    procedure bbtnInverteSelClick(Sender: TObject);
    procedure chklstEstabDrawItem(Control: TWinControl; Index: Integer;
      Rect: TRect; State: TOwnerDrawState);
    procedure chklstEstabClickCheck(Sender: TObject);
    procedure speAnoChange(Sender: TObject);
    procedure sbtnMarcarRubClick(Sender: TObject);
    procedure chklstRubrica1ClickCheck(Sender: TObject);
    procedure bbtnSelTodasRubClick(Sender: TObject);
    procedure bbtnInverteSelRubClick(Sender: TObject);
    procedure PaginasChange(Sender: TObject);
    function  SelTipoContrato: string;
  private
    LiRubrica1, LiRubrica2, LiRubrica3, LiEstab: string;
    ListaEstab, ListaRubrica: TStringList;
    ArqConfig: TIniFile;

    procedure SelecionaResponsavel;
    function  VerificaOpcoesOk: boolean;
    procedure LeAlteracoes;
    procedure HabilitaBtOk;
  public
    { Public declarations }
  end;

var
  frmVerificaDadosRAISMagnetico: TfrmVerificaDadosRAISMagnetico;

implementation

uses uSistema, uMensErro, fAguarde, UsoGeralRH;

{$R *.DFM}

procedure TfrmVerificaDadosRAISMagnetico.LeAlteracoes;
var
  LiResp: string;
begin
  // Recupera as últimas alterações das opções
  //ArqConfig := TIniFile.Create('C:\CONFIG_FOLHAPAGTO.INI');
  ArqConfig := TIniFile.Create(Sistema.RetornaCaminhoArquivos(Sistema.IdEmpresa)+'\CONFIG_FOLHAPAGTO.INI');//Ádler Teodoro de Souza SOL 109421 KINTANA 496332

  LiRubrica1 := ArqConfig.ReadString ('RAIS_MAG', 'Rubricas1'   , '');
  LiRubrica2 := ArqConfig.ReadString ('RAIS_MAG', 'Rubricas2'   , '');
  LiRubrica3 := ArqConfig.ReadString ('RAIS_MAG', 'Rubricas3'   , '');
  LiEstab    := ArqConfig.ReadString ('RAIS_MAG', 'Estabelec'  , '');
  LiResp     := ArqConfig.ReadString ('RAIS_MAG', 'Responsavel', '');

  VerificaOpcoes(chklstRubrica1, ListaRubrica, LiRubrica1, ',');
  VerificaOpcoes(chklstRubrica2, ListaRubrica, LiRubrica2, ',');
  VerificaOpcoes(chklstRubrica3, ListaRubrica, LiRubrica3, ',');
  VerificaOpcoes(chklstEstab   , ListaEstab  , LiEstab   , ',');

  if (LiResp = '') then
  begin
    qryNomeResp.First;
    LiResp := qryNomeResp.FieldByName('CODIGO').asString;
  end;
  dblkcbResp.LookUpValue := LiResp;
  dblkcbResp.UpDate;

  edCodRubricas.Text := LiRubrica1;

  HabilitaBtOk;
end;

procedure TfrmVerificaDadosRAISMagnetico.FormCreate(Sender: TObject);
begin
  inherited;
  ListaEstab   := TStringList.Create;
  ListaRubrica := TStringList.Create;

  // Estabelecimento(s) habilitados para o usuário
  if (sUsuXfilial <> '') then
  begin
    if (Pos(',',sUsuXfilial) > 0) then
    begin
      qryNomeEstab.SQL[5] := '  (PJ.IDPESSOA IN ' +sUsuXfilial+ ') AND';
      qryNomeResp.SQL[5]  := '  (PJ.IDPESSOA IN ' +sUsuXfilial+ ') AND';
    end
    else
    begin
      qryNomeEstab.SQL[5] := '  (PJ.IDPESSOA  = ' +sUsuXfilial+ ') AND';
      qryNomeResp.SQL[5]  := '  (PJ.IDPESSOA  = ' +sUsuXfilial+ ') AND';
    end;
  end;

  qryNomeEstab.ParamByName('EMPRESA').asInteger := Sistema.IdEmpresa;
  qryNomeEstab.Open;
  qryNomeResp.ParamByName('EMPRESA').asInteger := Sistema.IdEmpresa;
  qryNomeResp.Open;
  qryParamRH.Open;

  // Monta ChekListBox dos Estabelecimentos
  chklstEstab.Items.Clear;
  ListaEstab.Clear;
  while not(qryNomeEstab.EOF) do
  begin
    chklstEstab.Items.Add(qryNomeEstab.FieldByName('NOME').asString);
    ListaEstab.Add(qryNomeEstab.FieldByName('CODIGO').asString);
    qryNomeEstab.Next;
  end;

  // Monta ChekListBox das Rubricas
  chklstRubrica1.Items.Clear;
  chklstRubrica2.Items.Clear;
  chklstRubrica3.Items.Clear;
  ListaRubrica.Clear;
  with (qryRubrica) do
  begin
    ParamByName('EMPRESA').asInteger := Sistema.IdEmpresa;
    Open;
    while not(qryRubrica.EOF) do
    begin
      ListaRubrica.Add(qryRubrica.FieldByName('CODPROVDESC').asString);
      chklstRubrica1.Items.Add(qryRubrica.FieldByName('DESCRPROVDESC').asString);
      chklstRubrica2.Items.Add(qryRubrica.FieldByName('DESCRPROVDESC').asString);
      chklstRubrica3.Items.Add(qryRubrica.FieldByName('DESCRPROVDESC').asString);
      qryRubrica.Next;
    end;
  end;  

  // Inicializa variáveis
  dblkcbResp.Text    := qryNomeResp.FieldByName('NOME').asString;
  speAno.Text        := Copy(qryParamRH.FieldByName('NORMALINI').asString,7,4);
  Paginas.ActivePage := tbshFolhaNormal;

  // Carrega alterações nas opções feitas anteriormente
  LeAlteracoes;
end;

procedure TfrmVerificaDadosRAISMagnetico.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  ListaEstab.Free;
  ListaRubrica.Free;

  qryParamRH.Close;
  qryNomeResp.Close;
  qryResp.Close;
  qryResp.UnPrepare;
  qryNomeEstab.Close;
  qryEstab.Close;
  qryRubrica.Close;
  inherited;
end;

procedure TfrmVerificaDadosRAISMagnetico.HabilitaBtOk;
var
  c: integer;
  bSelEstab, bSelRub1, bSelRub2, bSelRub3: boolean;
begin
  bSelEstab := false;
  for c:=0 to chklstEstab.Items.Count-1 do
    if (chklstEstab.Checked[c]) then
    begin
      bSelEstab := true;
      break;
    end;

  bSelRub1 := false;
  for c:=0 to chklstRubrica2.Items.Count-1 do
    if (chklstRubrica2.Checked[c]) then
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

  rbtnVerificar.Enabled := (bSelEstab) and (bSelRub1) and (bSelRub2) and (bSelRub3) and
    (Trim(speAno.Text) <> '') and (Trim(dblkcbResp.Text) <> '');
end;

function TfrmVerificaDadosRAISMagnetico.SelTipoContrato: string;
var
  sAux: string;
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

  if (cbxProprietarios.Checked) then
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

procedure TfrmVerificaDadosRAISMagnetico.chklstEstabDrawItem(Control: TWinControl; Index: Integer;
  Rect: TRect; State: TOwnerDrawState);
begin
  inherited;
  with (TCheckListBox(Control).Canvas) do
  begin
    if (TCheckListBox(Control).Checked[Index]) then
    begin
      Brush.Color := $00C0FFFF; // amarelo bebê
      Font.Color  := clBlack;
    end;

    FillRect(Rect);
    TextOut(Rect.Left, Rect.Top, TCheckListBox(Control).Items[Index]);
  end;
end;

procedure TfrmVerificaDadosRAISMagnetico.qryEstabBeforeOpen(DataSet: TDataSet);
begin
  inherited;
  frmAguarde.Pos := frmAguarde.Min;
  frmAguarde.pbAguarde.Visible := false;
  frmAguarde.Mostra ('Verificando seleção do Estabelecimento...');
  frmAguarde.UpDate;
end;

procedure TfrmVerificaDadosRAISMagnetico.qryEstabAfterOpen(DataSet: TDataSet);
begin
  inherited;
  frmAguarde.Apaga;
end;

procedure TfrmVerificaDadosRAISMagnetico.qryRespBeforeOpen(DataSet: TDataSet);
begin
  inherited;
  frmAguarde.Mostra ('Verificando seleção do Responsável...');
  frmAguarde.UpDate;
end;

procedure TfrmVerificaDadosRAISMagnetico.qryRespAfterOpen(DataSet: TDataSet);
begin
  inherited;
  frmAguarde.Apaga;
end;

procedure TfrmVerificaDadosRAISMagnetico.qryRAISBeforeOpen(DataSet: TDataSet);
begin
  inherited;
  frmAguarde.Mostra ('Processando dados da RAIS...');
  frmAguarde.UpDate;
  frmAguarde.Pos := 0;
end;

procedure TfrmVerificaDadosRAISMagnetico.qryRAISAfterOpen(DataSet: TDataSet);
begin
  inherited;
  frmAguarde.Max := qryRAIS.RecordCount;
  frmAguarde.Min := 0;
end;

procedure TfrmVerificaDadosRAISMagnetico.qryRAISAfterScroll(DataSet: TDataSet);
begin
  inherited;
  if (qryRAIS.BOF) then
    frmAguarde.pbAguarde.Visible := true
  else
  if (frmAguarde.Pos >= frmAguarde.Max) then
    frmAguarde.Pos := frmAguarde.Min
  else
  if (qryRAIS.EOF) then
    frmAguarde.Pos := frmAguarde.Max
  else
    frmAguarde.Pos := frmAguarde.Pos+1;
  frmAguarde.Update;
end;

procedure TfrmVerificaDadosRAISMagnetico.bbtnSelTodosClick(Sender: TObject);
var
  c: integer;
begin
  inherited;
  for c:=0 to chklstEstab.Items.Count-1 do
    chklstEstab.Checked[c] := true;

  HabilitaBtOk;
  chklstEstab.Repaint;
end;

procedure TfrmVerificaDadosRAISMagnetico.bbtnInverteSelClick(Sender: TObject);
var
  c: integer;
begin
  inherited;
  for c:=0 to chklstEstab.Items.Count-1 do
    chklstEstab.Checked[c] := not(chklstEstab.Checked[c]);

  HabilitaBtOk;
  chklstEstab.Repaint;
end;

procedure TfrmVerificaDadosRAISMagnetico.bbtnSelTodasRubClick(Sender: TObject);
var
  c: integer;
begin
  inherited;
  if (Paginas.ActivePage = tbshFolhaNormal) then
  begin
    for c:=0 to chklstRubrica1.Items.Count-1 do
      chklstRubrica1.Checked[c] := true;

    CriaListaOpcoes (chklstRubrica1, ListaRubrica, LiRubrica1, ',', false);
    edCodRubricas.Text := LiRubrica1;
    HabilitaBtOk;
    chklstRubrica1.Repaint;
  end
  else
  if (Paginas.ActivePage = tbsh1Parc13) then
  begin
    for c:=0 to chklstRubrica2.Items.Count-1 do
      chklstRubrica2.Checked[c] := true;

    CriaListaOpcoes (chklstRubrica2, ListaRubrica, LiRubrica2, ',', false);
    edCodRubricas.Text := LiRubrica2;
    HabilitaBtOk;
    chklstRubrica2.Repaint;
  end
  else
  if (Paginas.ActivePage = tbsh2Parc13) then
  begin
    for c:=0 to chklstRubrica3.Items.Count-1 do
      chklstRubrica3.Checked[c] := true;

    CriaListaOpcoes (chklstRubrica3, ListaRubrica, LiRubrica3, ',', false);
    edCodRubricas.Text := LiRubrica3;
    HabilitaBtOk;
    chklstRubrica3.Repaint;
  end
  else
  begin
    cbxEfetivos.Checked      := true;
    cbxEspeciais.Checked     := true;
    cbxTemporarios.Checked   := true;
    cbxEstagiarios.Checked   := true;
    cbxTerceiros.Checked     := true;
    cbxProprietarios.Checked := true;
    cbxAutonomos.Checked     := true;
  end;
end;

procedure TfrmVerificaDadosRAISMagnetico.bbtnInverteSelRubClick(Sender: TObject);
var
  c: integer;
begin
  inherited;
  if (Paginas.ActivePage = tbshFolhaNormal) then
  begin
    for c:=0 to chklstRubrica1.Items.Count-1 do
      chklstRubrica1.Checked[c] := not(chklstRubrica1.Checked[c]);

    CriaListaOpcoes (chklstRubrica1, ListaRubrica, LiRubrica1, ',', false);
    edCodRubricas.Text := LiRubrica1;
    HabilitaBtOk;
    chklstRubrica1.Repaint;
  end
  else
  if (Paginas.ActivePage = tbsh1Parc13) then
  begin
    for c:=0 to chklstRubrica2.Items.Count-1 do
      chklstRubrica2.Checked[c] := not(chklstRubrica2.Checked[c]);

    CriaListaOpcoes (chklstRubrica2, ListaRubrica, LiRubrica2, ',', false);
    edCodRubricas.Text := LiRubrica2;
    HabilitaBtOk;
    chklstRubrica2.Repaint;
  end
  else
  if (Paginas.ActivePage = tbsh2Parc13) then
  begin
    for c:=0 to chklstRubrica3.Items.Count-1 do
      chklstRubrica3.Checked[c] := not(chklstRubrica3.Checked[c]);

    CriaListaOpcoes (chklstRubrica3, ListaRubrica, LiRubrica3, ',', false);
    edCodRubricas.Text := LiRubrica3;
    HabilitaBtOk;
    chklstRubrica3.Repaint;
  end
  else
  begin
    cbxEfetivos.Checked      := not(cbxEfetivos.Checked);
    cbxEspeciais.Checked     := not(cbxEspeciais.Checked);
    cbxTemporarios.Checked   := not(cbxTemporarios.Checked);
    cbxEstagiarios.Checked   := not(cbxEstagiarios.Checked);
    cbxTerceiros.Checked     := not(cbxTerceiros.Checked);
    cbxProprietarios.Checked := not(cbxProprietarios.Checked);
    cbxAutonomos.Checked     := not(cbxAutonomos.Checked);
  end;
end;

procedure TfrmVerificaDadosRAISMagnetico.chklstEstabClickCheck(Sender: TObject);
begin
  inherited;
  HabilitaBtOk;
  chklstEstab.Repaint;
end;

procedure TfrmVerificaDadosRAISMagnetico.chklstRubrica1ClickCheck(Sender: TObject);
begin
  inherited;
  if (Paginas.ActivePage = tbshFolhaNormal) then
  begin
    HabilitaBtOk;
    CriaListaOpcoes (chklstRubrica1, ListaRubrica, LiRubrica1, ',', false);
    edCodRubricas.Text := LiRubrica1;
    chklstRubrica1.Repaint;
  end
  else
  if (Paginas.ActivePage = tbsh1Parc13) then
  begin
    HabilitaBtOk;
    CriaListaOpcoes (chklstRubrica2, ListaRubrica, LiRubrica2, ',', false);
    edCodRubricas.Text := LiRubrica2;
    chklstRubrica2.Repaint;
  end
  else
  if (Paginas.ActivePage = tbsh2Parc13) then  
  begin
    HabilitaBtOk;
    CriaListaOpcoes (chklstRubrica3, ListaRubrica, LiRubrica3, ',', false);
    edCodRubricas.Text := LiRubrica3;
    chklstRubrica3.Repaint;
  end;
end;

procedure TfrmVerificaDadosRAISMagnetico.speAnoChange(Sender: TObject);
begin
  inherited;
  HabilitaBtOk;
end;

procedure TfrmVerificaDadosRAISMagnetico.PaginasChange(Sender: TObject);
begin
  inherited;
  if (Paginas.ActivePage = tbshFolhaNormal) then
  begin
    CriaListaOpcoes (chklstRubrica1, ListaRubrica, LiRubrica1, ',', false);
    edCodRubricas.Text := LiRubrica1;
  end
  else
  if (Paginas.ActivePage = tbsh1Parc13) then
  begin
    CriaListaOpcoes (chklstRubrica2, ListaRubrica, LiRubrica2, ',', false);
    edCodRubricas.Text := LiRubrica2;
  end
  else
  if (Paginas.ActivePage = tbsh2Parc13) then
  begin
    CriaListaOpcoes (chklstRubrica3, ListaRubrica, LiRubrica3, ',', false);
    edCodRubricas.Text := LiRubrica3;
  end;

  lblDescricao1.Visible := (Paginas.ActivePage <> tbshTiposContr);
  edCodRubricas.Visible := (Paginas.ActivePage <> tbshTiposContr);
  sbtnMarcarRub.Visible := (Paginas.ActivePage <> tbshTiposContr);
end;

procedure TfrmVerificaDadosRAISMagnetico.sbtnMarcarRubClick(Sender: TObject);
begin
  inherited;
  edCodRubricas.Text := Trim(edCodRubricas.Text);

  if (Paginas.ActivePage = tbshFolhaNormal) then
  begin
    VerificaOpcoes (chklstRubrica1, ListaRubrica, edCodRubricas.Text, ',');
    LiRubrica1 := edCodRubricas.Text;
    HabilitaBtOk;
    chklstRubrica1.Repaint;
  end
  else
  if (Paginas.ActivePage = tbsh1Parc13) then
  begin
    VerificaOpcoes (chklstRubrica2, ListaRubrica, edCodRubricas.Text, ',');
    LiRubrica2 := edCodRubricas.Text;
    HabilitaBtOk;
    chklstRubrica2.Repaint;
  end
  else
  if (Paginas.ActivePage = tbsh2Parc13) then  
  begin
    VerificaOpcoes (chklstRubrica3, ListaRubrica, edCodRubricas.Text, ',');
    LiRubrica3 := edCodRubricas.Text;
    HabilitaBtOk;
    chklstRubrica3.Repaint;
  end;
end;

function TfrmVerificaDadosRAISMagnetico.VerificaOpcoesOk: boolean;
begin
  Result := false;

  frmAguarde.Apaga;

  // Verifica se o Responsável pela informação foi selecionado
  SelecionaResponsavel;
  if (qryResp.IsEmpty) then
  begin
    MsgDlg ('Dados do Responsável selecionado podem não estar completos! Verifique e tente novamente.','Erro', mtInformation,[mbOK,mbHelp],0);
    dblkcbResp.SetFocus;
    exit;
  end;

  Result := true;
end;

procedure TfrmVerificaDadosRAISMagnetico.SelecionaResponsavel;
begin
  // Estabelecimentos selecionados
  CriaListaOpcoes (chklstEstab, ListaEstab, LiEstab, ',', false);

  qryEstab.Close;
  with (qryEstab.SQL) do
  begin
    Clear;
    Add('SELECT DISTINCT');
    Add('  PJ.IDPESSOA                           AS IDESTABELECIMENTO,');
    Add('  DECODE(CGC.NUM,NULL,''2'',''1'')      AS TIPO_INSCRICAO,');
    Add('  DECODE(CGC.NUM,NULL,CEI.NUM,CGC.NUM)  AS INSCRICAO,');
    Add('  DECODE(CGC.NUM,NULL,'''',CEI.NUM)     AS MATRICULA_CEI,');
    Add('  RTRIM(PJ.RAZAOSOCIAL)                 AS NOME,');
    Add('  RTRIM(E.LOGRADOURO)                   AS ENDERECO,');
    Add('  E.NUMERO,');
    Add('  RTRIM(E.COMPLEMENTO)   AS COMPLEMENTO,');
    Add('  RTRIM(E.BAIRRO)        AS BAIRRO,');
    Add('  RTRIM(E.CEP)           AS CEP,');
    Add('  RTRIM(CI.CODMUNICIPIO) AS COD_MUNICIPIO,');
    Add('  RTRIM(CI.NOME)         AS NOM_MUNICIPIO,');
    Add('  ES.CODESTADO           AS UF,');
    Add('  RTRIM(TEL.DDD)         AS DDD,');
    Add('  RTRIM(TEL.NUMERO)      AS TELEFONE,');
    Add('  FP.IDITEMCNAE          AS CNAE,');
    Add('  FP.IDNATEMPRE          AS NAT_JURIDICA');
    Add('FROM');
    Add('  PESSOA PJ, ENDPESS E, CIDADES CI, ESTADO ES, FILIALPESSOA FP,');
    // -------------------------------------------------------------------------- //
    // CGC da Empresa
    Add('  (SELECT FP.IDFILIALPESSOA AS IDPESSOA, DP.NUMDOCUMENTO AS NUM');
    Add('   FROM   DOCPESSOA DP, TIPODOCOFICIAL TDO, FILIALPESSOA FP');
    Add('   WHERE  ((TDO.SIGLADOCUMENTO = ''CNPJ:'')       OR');
    Add('           (TDO.SIGLADOCUMENTO = ''CGC:''))      AND');
    Add('          (TDO.IDDOCUMENTO     = DP.IDDOCUMENTO) AND');
    Add('          (FP.IDFILIALPESSOA   = DP.IDPESSOA)) CGC,');
    // -------------------------------------------------------------------------- //
    // CEI da Empresa
    Add('  (SELECT FP.IDFILIALPESSOA AS IDPESSOA, DP.NUMDOCUMENTO AS NUM');
    Add('   FROM   DOCPESSOA DP, TIPODOCOFICIAL TDO, FILIALPESSOA FP');
    Add('   WHERE  (TDO.SIGLADOCUMENTO = ''CEI:'')       AND');
    Add('          (TDO.IDDOCUMENTO    = DP.IDDOCUMENTO) AND');
    Add('          (FP.IDFILIALPESSOA  = DP.IDPESSOA)) CEI,');
    // -------------------------------------------------------------------------- //
    // Telefone da Empresa
    Add('  (SELECT TE.IDENDERECO, TE.IDTELEFONE, TE.DDD, TE.NUMERO');
    Add('   FROM');
    Add('     TELENDPESS TE,');
    Add('     (SELECT   MIN(IDTELEFONE) AS IDTELEFONE, IDENDERECO');
    Add('      FROM     TELENDPESS');
    Add('      GROUP BY IDENDERECO) END');
    Add('   WHERE');
    Add('     (END.IDTELEFONE = TE.IDTELEFONE)) TEL');
    // -------------------------------------------------------------------------- //
    Add('WHERE');

    if (Pos(',',LiEstab) > 0) then
      Add('  (PJ.IDPESSOA       IN (' +LiEstab+ ')) AND')
    else
      Add('  (PJ.IDPESSOA        = ' +LiEstab+ ') AND');

    Add('  (PJ.NUMDOCUMENTO   IS NOT NULL)         AND');
    Add('  (PJ.IDPESSOA       = FP.IDFILIALPESSOA) AND');
    Add('  (PJ.IDENDCOMERCIAL = E.IDENDERECO)      AND');
    Add('  (PJ.IDPESSOA       = E.IDPESSOA)        AND');
    Add('  (PJ.IDENDCOMERCIAL = TEL.IDENDERECO)    AND');
    Add('  (E.IDCIDADES       = CI.IDCIDADES)      AND');
    Add('  (CI.IDESTADO       = ES.IDESTADO)       AND');
    Add('  (PJ.IDPESSOA       = CEI.IDPESSOA(+))   AND');
    Add('  (PJ.IDPESSOA       = CGC.IDPESSOA(+))');
  end;
  qryEstab.Open;

  qryResp.Close;
  with (qryResp.SQL) do
  begin
    Clear;
    Add('SELECT DISTINCT');
    Add('  DECODE(CGC.NUM,NULL,''2'',''1'')     AS TIPO_INSCRICAO,');
    Add('  DECODE(CGC.NUM,NULL,CEI.NUM,CGC.NUM) AS INSCRICAO,');
    Add('  RTRIM(PJ.RAZAOSOCIAL)                AS NOME,');
    Add('  RTRIM(E.LOGRADOURO)                  AS ENDERECO,');
    Add('  E.NUMERO,');
    Add('  RTRIM(E.COMPLEMENTO)   AS COMPLEMENTO,');
    Add('  RTRIM(E.BAIRRO)        AS BAIRRO,');
    Add('  RTRIM(E.CEP)           AS CEP,');
    Add('  RTRIM(CI.CODMUNICIPIO) AS COD_MUNICIPIO,');
    Add('  RTRIM(CI.NOME)         AS NOM_MUNICIPIO,');
    Add('  ES.CODESTADO           AS UF,');
    Add('  RTRIM(TEL.DDD)         AS DDD,');
    Add('  RTRIM(TEL.NUMERO)      AS TELEFONE,');
    Add('  RTRIM(PJ.HOMEPAGE)     AS EMAIL');
    Add('FROM');
    Add('  PESSOA PJ, ENDPESS E, CIDADES CI, ESTADO ES,');
    // -------------------------------------------------------------------------- //
    // CGC da Empresa
    Add('  (SELECT FP.IDFILIALPESSOA AS IDPESSOA, DP.NUMDOCUMENTO AS NUM');
    Add('   FROM   DOCPESSOA DP, TIPODOCOFICIAL TDO, FILIALPESSOA FP');
    Add('   WHERE  ((TDO.SIGLADOCUMENTO = ''CNPJ:'')       OR');
    Add('           (TDO.SIGLADOCUMENTO = ''CGC:''))      AND');
    Add('          (TDO.IDDOCUMENTO     = DP.IDDOCUMENTO) AND');
    Add('          (FP.IDFILIALPESSOA   = DP.IDPESSOA)) CGC,');
    // -------------------------------------------------------------------------- //
    // CEI da Empresa
    Add('  (SELECT FP.IDFILIALPESSOA AS IDPESSOA, DP.NUMDOCUMENTO AS NUM');
    Add('   FROM   DOCPESSOA DP, TIPODOCOFICIAL TDO, FILIALPESSOA FP');
    Add('   WHERE  (TDO.SIGLADOCUMENTO = ''CEI:'')       AND');
    Add('          (TDO.IDDOCUMENTO    = DP.IDDOCUMENTO) AND');
    Add('          (FP.IDFILIALPESSOA  = DP.IDPESSOA)) CEI,');
    // -------------------------------------------------------------------------- //
    // Telefone da Empresa
    Add('  (SELECT TE.IDENDERECO, TE.IDTELEFONE, TE.DDD, TE.NUMERO');
    Add('   FROM');
    Add('     TELENDPESS TE,');
    Add('     (SELECT   MIN(IDTELEFONE) AS IDTELEFONE, IDENDERECO');
    Add('      FROM     TELENDPESS');
    Add('      GROUP BY IDENDERECO) END');
    Add('   WHERE');
    Add('     (END.IDTELEFONE = TE.IDTELEFONE)) TEL');
    // -------------------------------------------------------------------------- //
    Add('WHERE');
    Add('  (PJ.IDPESSOA        = ' +qryNomeEstab.FieldByName('CODIGO').asString+ ') AND');
    Add('  (PJ.IDENDCOMERCIAL  = E.IDENDERECO)    AND');
    Add('  (PJ.IDPESSOA        = E.IDPESSOA)      AND');
    Add('  (PJ.IDENDCOMERCIAL  = TEL.IDENDERECO)  AND');
    Add('  (E.IDCIDADES        = CI.IDCIDADES)    AND');
    Add('  (CI.IDESTADO        = ES.IDESTADO)     AND');
    Add('  (PJ.IDPESSOA        = CEI.IDPESSOA(+)) AND');
    Add('  (PJ.IDPESSOA        = CGC.IDPESSOA(+)) AND');
    Add('  (ROWNUM = 1)');
  end;
  qryResp.Open;
end;

procedure TfrmVerificaDadosRAISMagnetico.rbtnVerificarClick(Sender: TObject);
var
  NumRegistro: word;
  fRAIS      : TextFile;
  bArqAberto, ExibeCancel: boolean;
  iMesRem13Adiant, iMesRem13Final, NumEstab, NumFunc: integer;
  sIDFunc, sIDEstab, sAux : string;

  rRemJan, rRemFev, rRemMar, rRemAbr, rRemMai, rRemJun, rRemJul,
  rRemAgo, rRemSet, rRemOut, rRemNov, rRemDez, rRem13Adiant, rRem13Final: real;
begin
  inherited;

  // Verifica se as opções selecionadas estão corretamente selecionadas
  if not(VerificaOpcoesOk) then
    exit;

  // Inicializa variáveis
  bArqAberto  := false;
  ExibeCancel := false;

  // Rubricas para o Salário Normal selecionadas
  CriaListaOpcoes (chklstRubrica1, ListaRubrica, LiRubrica1, ',', true);

  // Rubricas para a 1º parcela do 13º selecionadas
  CriaListaOpcoes (chklstRubrica2, ListaRubrica, LiRubrica2, ',', true);

  // Rubricas para a 2º parcela do 13º selecionadas
  CriaListaOpcoes (chklstRubrica3, ListaRubrica, LiRubrica3, ',', true);

  // ********************
  // Monta Query do RAIS
  // ********************
  with (qryRAIS.SQL) do
  begin
    Clear;
    Add('SELECT DISTINCT');
    Add('  FP.IDFILIALPESSOA      AS IDESTABELECIMENTO,');
    Add('  F.IDPESSOA,');
    Add('  RTRIM(PF.NOME)         AS FUNCIONARIO,');
    Add('  DECODE(ESTR.ANOCHEGADA,NULL,'''',TO_CHAR(ESTR.ANOCHEGADA,''YYYY'')) ANOCHEGADA,');
    Add('  CPF.NUM                AS CPF,');
    Add('  CTPS.NUM               AS CTPS,');
    Add('  PIS.NUM                AS PIS,');
    Add('  CBO.IDCBO              AS CBO,');
    Add('  PESFIS.IDGRINSTR       AS GRAU_INSTR,');
    Add('  PAIS.CODRECEITAFEDERAL AS NACIONALIDADE,');
    Add('  F.IDVINCEMPREG         AS VINC_EMPREG,');
    Add('  DECODE(HST_SITUACAO.MOTIVORAIS,NULL,2) AS TIPO_ADMISSAO,');
    Add('  CAUSA_DESLIG.MOTIVORAIS AS MOTIVODESLIGRAIS,');
    Add('  F.MATRICULA,');
    Add('  PESFIS.DATANASC,');
    Add('  NVL(PESFIS.FLGDEFICIENTE,2) AS FLGDEFICIENTE,');
    Add('  F.DATAADMISSAO,');
    Add('  DECODE(F.TIPOPAGAMENTO,''H'',''5'',''D'',''4'',''M'',''1'',''T'',''6'') TIPO_SAL_CONTR,');

    Add('  DECODE(ST.TIPOSIT,''D'',DECODE(TO_CHAR(F.DATADESLIGAMENTO,''YYYY''),'+
      QuotedStr(speAno.Text)+',TO_CHAR(F.DATADESLIGAMENTO,''DD/MM''),''''),'''') AS DATADESLIGAMENTO,');

    // (1->Indígena; 2->Branca; 4->Negra; 6->Amarela; 8->Parda; 9->Não informado)
    Add('  DECODE(PESFIS.CORPESSOA,NULL,9,0,1,PESFIS.CORPESSOA) COR,');
    Add('  (HT.JORNADAMENSAL / 5) AS HRS_TRAB,');
    Add('  F.SALARIOATUAL         AS SALARIO_CONTR,');
    Add('  VAL_REM_NORMAL.MES     AS MES_REM_NORMAL,');
    Add('  VAL_REM_NORMAL.VALOR   AS REMUNERACAO_NORMAL,');
    Add('  VAL_REM_PRI_13.MES     AS MES_REM_PRI_13,');
    Add('  VAL_REM_PRI_13.VALOR   AS REMUNERACAO_PRI_13,');
    Add('  VAL_REM_SEG_13.MES     AS MES_REM_SEG_13,');
    Add('  VAL_REM_SEG_13.VALOR   AS REMUNERACAO_SEG_13');
    // -------------------------------------------------------------------- //
    Add('FROM');
    Add('  PESSOA PF, PESSOAFISICA PESFIS, CBO, FUNCIONARIO F, CARGO C,');
    Add('  HORATRAB HT, FILIALPESSOA FP, PAIS, ESTRANGEIRO ESTR, SITFUNC ST,');
    // -------------------------------------------------------------------- //
    // Tipo de Admissão
    Add('  (SELECT F.IDPESSOA, MO.MOTIVORAIS');
    Add('   FROM   FUNCIONARIO F, HSTSITFUNC HST, MOTIVO MO');
    Add('   WHERE');

    if (Pos(',',LiEstab) > 0) then
      Add('         (F.IDESTAB       IN (' +LiEstab+ ')) AND')
    else
      Add('         (F.IDESTAB        = ' +LiEstab+ ') AND');

    Add('         (MO.MOTIVORAIS   IS NOT NULL)        AND');
    Add('         (F.IDSITFUNC      = HST.IDSITFUNC)   AND');
    Add('         (F.DATAADMISSAO   = HST.DATASITFUNC) AND');
    Add('         (HST.IDMOTIVOOFIC = MO.IDMOTIVO)) HST_SITUACAO,');
    // -------------------------------------------------------------------- //
    // Remuneração do Funcionário Normal
    Add('  (SELECT F.IDPESSOA, MO.MOTIVORAIS');
    Add('   FROM   FUNCIONARIO F, SITFUNC ST, MOTIVO MO');
    Add('   WHERE (ST.TIPOSIT           = ''D'') AND');
    Add('         (TO_CHAR(F.DATADESLIGAMENTO,''YYYY'') = '+QuotedStr(speAno.Text)+') AND');

    if (Pos(',',LiEstab) > 0) then
      Add('         (F.IDESTAB           IN (' +LiEstab+ ')) AND')
    else
      Add('         (F.IDESTAB            = ' +LiEstab+ ') AND');

    Add('         (ST.IDSITFUNC         = F.IDSITFUNC) AND');
    Add('         (F.IDMOTIVODESLIGRAIS = MO.IDMOTIVO)) CAUSA_DESLIG,');
    // -------------------------------------------------------------------- //
    // Remuneração do Funcionário Normal
    Add('  (SELECT H.IDPESSOA, H.MES,');
    Add('          SUM(DECODE(PD.FLGDESCONTO,1,-H.VALORPROVENTO,H.VALORPROVENTO)) AS VALOR');
    Add('   FROM   HISTRUBSAL H, PROVDESC PD, FUNCIONARIO F');
    Add('   WHERE');

    if (Pos(',',LiRubrica1) > 0) then
      Add('     (H.CODPROVDESC IN (' +LiRubrica1+ ')) AND')
    else
      Add('     (H.CODPROVDESC  = ' +LiRubrica1+ ') AND');

    Add('     (H.IDPESSJUR    = '+IntToStr(Sistema.IdEmpresa)+')          AND');
    Add('     (H.MES    BETWEEN ' +QuotedStr(speAno.Text+'/01')+ ' AND '+
      QuotedStr(speAno.Text+'/12')+ ') AND');
    Add('     (F.IDPESSOA     = H.IDPESSOA) AND');
    Add('     (PD.IDPROVENTO  = H.IDRUBRICA)');
    Add('   GROUP BY');
    Add('     H.IDPESSOA, H.MES) VAL_REM_NORMAL,');
    // -------------------------------------------------------------------- //
    // Remuneração do Funcionário Normal para 1º parcela do 13º
    Add('  (SELECT H.IDPESSOA, MAX(H.MES) AS MES,');
    Add('          SUM(DECODE(PD.FLGDESCONTO,1,-H.VALORPROVENTO,H.VALORPROVENTO)) AS VALOR');
    Add('   FROM   HISTRUBSAL H, PROVDESC PD, FUNCIONARIO F');
    Add('   WHERE');

    if (Pos(',',LiRubrica2) > 0) then
      Add('     (H.CODPROVDESC IN (' +LiRubrica2+ ')) AND')
    else
      Add('     (H.CODPROVDESC  = ' +LiRubrica2+ ') AND');

    Add('     (H.IDPESSJUR    = '+IntToStr(Sistema.IdEmpresa)+') AND');
    Add('     (H.MES    BETWEEN ' +QuotedStr(speAno.Text+'/01')+ ' AND '+
      QuotedStr(speAno.Text+'/12')+ ') AND');
    Add('     (F.IDPESSOA     = H.IDPESSOA) AND');
    Add('     (PD.IDPROVENTO  = H.IDRUBRICA)');
    Add('   GROUP BY');
    Add('     H.IDPESSOA) VAL_REM_PRI_13,');
    // -------------------------------------------------------------------- //
    // Remuneração do Funcionário Normal para 2º parcela do 13º
    Add('  (SELECT H.IDPESSOA, MAX(H.MES) AS MES,');
    Add('          SUM(DECODE(PD.FLGDESCONTO,1,-H.VALORPROVENTO,H.VALORPROVENTO)) AS VALOR');
    Add('   FROM   HISTRUBSAL H, PROVDESC PD, FUNCIONARIO F');
    Add('   WHERE');

    if (Pos(',',LiRubrica3) > 0) then
      Add('     (H.CODPROVDESC IN (' +LiRubrica3+ ')) AND')
    else
      Add('     (H.CODPROVDESC  = ' +LiRubrica3+ ') AND');

    Add('     (H.IDPESSJUR    = '+IntToStr(Sistema.IdEmpresa)+') AND');
    Add('     (H.MES    BETWEEN ' +QuotedStr(speAno.Text+'/01')+ ' AND '+
      QuotedStr(speAno.Text+'/12')+ ') AND');
    Add('     (F.IDPESSOA     = H.IDPESSOA) AND');
    Add('     (PD.IDPROVENTO  = H.IDRUBRICA)');
    Add('   GROUP BY');
    Add('     H.IDPESSOA) VAL_REM_SEG_13,');
    // -------------------------------------------------------------------- //
    // CTPS do Funcionário
    Add('  (SELECT F.IDPESSOA, DP.NUMDOCUMENTO AS NUM');
    Add('   FROM   DOCPESSOA DP, FUNCIONARIO F, TIPODOCOFICIAL TDO');
    Add('   WHERE (TDO.SIGLADOCUMENTO = ''CTPS:'')      AND');
    Add('         (TDO.IDDOCUMENTO    = DP.IDDOCUMENTO) AND');
    Add('         (DP.IDPESSOA        = F.IDPESSOA)) CTPS,');
    // -------------------------------------------------------------------- //
    // CPF do Funcionário
    Add('  (SELECT F.IDPESSOA, DP.NUMDOCUMENTO AS NUM');
    Add('   FROM   DOCPESSOA DP, FUNCIONARIO F, TIPODOCOFICIAL TDO');
    Add('   WHERE (TDO.SIGLADOCUMENTO = ''CPF:'')       AND');
    Add('         (TDO.IDDOCUMENTO    = DP.IDDOCUMENTO) AND');
    Add('         (DP.IDPESSOA        = F.IDPESSOA)) CPF,');
    // -------------------------------------------------------------------- //
    // PIS do Funcionário
    Add('  (SELECT F.IDPESSOA, DP.NUMDOCUMENTO AS NUM');
    Add('   FROM   DOCPESSOA DP, FUNCIONARIO F, TIPODOCOFICIAL TDO');
    Add('   WHERE (TDO.SIGLADOCUMENTO = ''PIS/PASEP:'') AND');
    Add('         (TDO.IDDOCUMENTO    = DP.IDDOCUMENTO) AND');
    Add('         (DP.IDPESSOA        = F.IDPESSOA)) PIS');
    // -------------------------------------------------------------------- //
    Add('WHERE');

    if (Pos(',',LiEstab) > 0) then
      Add('  (FP.IDFILIALPESSOA IN (' +LiEstab+ ')) AND')
    else
      Add('  (FP.IDFILIALPESSOA = ' +LiEstab+ ') AND');

    sAux := SelTipoContrato;
    if (Pos(',',sAux) > 0) then
      Add('  (F.TIPOCONTRATO    IN (' +sAux+ ')) AND')
    else
      Add('  (F.TIPOCONTRATO     = ' +sAux+ ') AND');

    Add('  (FP.IDFILIALPESSOA = F.IDESTAB)        AND');
    Add('  (HT.IDHORARIO      = F.IDHORARIO)      AND');
    Add('  (C.IDCARGO         = F.IDCARGO)        AND');
    Add('  (C.CBO             = CBO.IDCBO)        AND');
    Add('  (F.IDPESSOA        = PESFIS.IDPESSOA)  AND');
    Add('  (F.IDPESSOA        = PF.IDPESSOA)      AND');
    Add('  (PAIS.IDPAIS       = PESFIS.IDPAIS)    AND');
    Add('  (F.IDPESSOA        = CTPS.IDPESSOA)    AND');
    Add('  (F.IDSITFUNC       = ST.IDSITFUNC)     AND');
    Add('  (F.IDPESSOA        = PIS.IDPESSOA)     AND');
    Add('  (F.IDPESSOA        = VAL_REM_NORMAL.IDPESSOA)    AND');
    Add('  (F.IDPESSOA        = CPF.IDPESSOA(+))            AND');    
    Add('  (F.IDPESSOA        = VAL_REM_PRI_13.IDPESSOA(+)) AND');
    Add('  (F.IDPESSOA        = VAL_REM_SEG_13.IDPESSOA(+)) AND');    
    Add('  (F.IDPESSOA        = ESTR.IDPESSOA(+))           AND');
    Add('  (F.IDPESSOA        = CAUSA_DESLIG.IDPESSOA(+))   AND');
    Add('  (F.IDPESSOA        = HST_SITUACAO.IDPESSOA(+))');
    Add('ORDER BY');
    Add('  IDESTABELECIMENTO, PIS, DATAADMISSAO');
    //SaveToFile ('c:\qry.txt');
    SaveToFile (Sistema.RetornaCaminhoArquivos(Sistema.IdEmpresa)+'\qry.txt');//Ádler Teodoro de Souza SOL 109421 KINTANA 496332
  end;
  qryRAIS.Open;

  qryRAIS.Close;
end;

end.
