// *****************************************************************************
// ***************************** REGISTRO DE ALTERAÇÕES ************************
// *****************************************************************************
// Autor(a)    :  Ádler Teodoro de Souza
// Data        :  27/02/2009
// Pendência   : SOL 109421 KINTANA 496332
// Descricao   :  Alteração de gravação de arquivos de log na raiz do disco C: .
//------------------------------------------------------------------------------
unit FSelEstCusto;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  FOkCancelar, MAHlpBtn, StdCtrls, Buttons, TB97Tlbr, TB97, ExtCtrls, Db,
  DBTables, Wwquery, Wwdatsrc, Mask, wwdbedit, Wwdotdot, Wwdbcomb, Machklb,
  wwdblook, checklst, TREdit, Spin, IvDictio, IvMulti, IvEMulti,
  ComCtrls, Grids, Wwdbigrd, IniFiles, Wwdbgrid, FSairAjuda, TEdNum,
  ColorCheckListBox;

type
  TRegTitulo = record
    Linha1, Linha2: string;
  end;

  TFRMSelEstCusto = class(TfrmSairAjuda)
    pgctrlPaginas: TPageControl;
    tbshRubricas: TTabSheet;
    Label1: TLabel;
    pgctrlPaginas2: TPageControl;
    tbshColuna1: TTabSheet;
    chklstRubrica1: TColorCheckListBox;
    tbshColuna2: TTabSheet;
    chklstRubrica2: TColorCheckListBox;
    tbshColuna3: TTabSheet;
    chklstRubrica3: TColorCheckListBox;
    bbtnSelTodos: TBitBtn;
    bbtnInverteSel: TBitBtn;
    gbxTituloColunas: TGroupBox;
    Label2: TLabel;
    Label3: TLabel;
    edTituloLinha1: TEdit;
    edTituloLinha2: TEdit;
    edCodRubricas: TEdit;
    sbtnMarcarRub: TBitBtn;
    tbshTipoEst: TTabSheet;
    bbtnConfirmar: TBitBtn;
    ToolbarSep971: TToolbarSep97;
    tbshColuna4: TTabSheet;
    tbshColuna5: TTabSheet;
    tbshColuna6: TTabSheet;
    tbshColuna7: TTabSheet;
    tbshColuna8: TTabSheet;
    chklstRubrica4: TColorCheckListBox;
    chklstRubrica5: TColorCheckListBox;
    chklstRubrica6: TColorCheckListBox;
    chklstRubrica7: TColorCheckListBox;
    chklstRubrica8: TColorCheckListBox;
    gbxAnoMesRef: TGroupBox;
    cmbMes: TComboBox;
    speAno: TSpinEdit;
    rgTipoEst: TRadioGroup;
    gbxValores: TGroupBox;
    Label4: TLabel;
    Label5: TLabel;
    Label6: TLabel;
    Label7: TLabel;
    Label8: TLabel;
    Label9: TLabel;
    Label10: TLabel;
    Label11: TLabel;
    ednMin1: TEditNum;
    ednMax1: TEditNum;
    ednMax2: TEditNum;
    ednMin2: TEditNum;
    ednMax3: TEditNum;
    ednMin3: TEditNum;
    ednMax4: TEditNum;
    ednMin4: TEditNum;
    ednMax5: TEditNum;
    ednMin5: TEditNum;
    ednMax6: TEditNum;
    ednMin6: TEditNum;
    ednMax7: TEditNum;
    ednMin7: TEditNum;
    ednMax8: TEditNum;
    ednMin8: TEditNum;
    qryVariavelMensal: TwwQuery;
    procedure FormCreate(Sender: TObject);
    procedure bbtnConfirmarClick(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure sbtnMarcarRubClick(Sender: TObject);
    procedure chklstRubrica1DrawItem(Control: TWinControl; Index: Integer;
      Rect: TRect; State: TOwnerDrawState);
    procedure chklstRubrica1ClickCheck(Sender: TObject);
    procedure bbtnSelTodosClick(Sender: TObject);
    procedure bbtnInverteSelClick(Sender: TObject);
    procedure pgctrlPaginas2Change(Sender: TObject);
    procedure dblkcbEstabChange(Sender: TObject);
    procedure edTituloLinha1Change(Sender: TObject);
    procedure chklstRubrica1KeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure spbtSelecaoClick(Sender: TObject);
    procedure spbtInvSelecaoClick(Sender: TObject);
    procedure rgTipoEstClick(Sender: TObject);
    procedure ednMax1Change(Sender: TObject);
  private
    LiRubrica1, LiRubrica2, LiRubrica3: string;
    LiRubrica4, LiRubrica5, LiRubrica6: string;
    LiRubrica7, LiRubrica8: string;

    procedure LeAlteracoes;
    procedure GravaAlteracoes;
    procedure HabilitaBtOk;
    function  SelecionaTipoContrato: string;
    function  SelecionaSitFunc: string;
  public
    regTituloLinha: array[1..8] of TRegTitulo;  
  end;

var
  FRMSelEstCusto: TFRMSelEstCusto;

implementation

uses uSistema, uMensErro, uDataBase, dBaseDados,
  uFuncoesUteisRH, UsoGeralRH, uComumRelats, dRelatoriosModAuto, FEstCusto,
  FTelaAut;

{$R *.DFM}

procedure TFRMSelEstCusto.FormCreate(Sender: TObject);
var
  iPos: integer;
begin
  inherited;
  if not(Assigned(ListaCodRubrica)) then
    ListaCodRubrica := TStringList.Create;

  if not(Assigned(ListaCodCCusto)) then
    ListaCodCCusto := TStringList.Create;


  FazQuery(dtmBaseDados.qry,'SELECT NORMALINI FROM PARAMRH');
  cmbMes.ItemIndex := ExtraiMes(dtmBaseDados.qry.FieldByName('NORMALINI').asDateTime) - 1;
  speAno.Text      := Copy(dtmBaseDados.qry.FieldByName('NORMALINI').asString,7,4);


  // Monto a Lista de Rubricas
  chklstRubrica1.Items.Clear;
  chklstRubrica2.Items.Clear;
  chklstRubrica3.Items.Clear;
  chklstRubrica4.Items.Clear;
  chklstRubrica5.Items.Clear;
  chklstRubrica6.Items.Clear;
  chklstRubrica7.Items.Clear;
  chklstRubrica8.Items.Clear;
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
    SQL.Add('  DESCRPROVDESC');
    Open;
    while not(EOF) do
    begin
      ListaCodRubrica.Add(FieldByName('CODPROVDESC').asString);
      chklstRubrica1.Items.Add(FieldByName('DESCRPROVDESC').asString);
      chklstRubrica2.Items.Add(FieldByName('DESCRPROVDESC').asString);
      chklstRubrica3.Items.Add(FieldByName('DESCRPROVDESC').asString);
      chklstRubrica4.Items.Add(FieldByName('DESCRPROVDESC').asString);
      chklstRubrica5.Items.Add(FieldByName('DESCRPROVDESC').asString);
      chklstRubrica6.Items.Add(FieldByName('DESCRPROVDESC').asString);
      chklstRubrica7.Items.Add(FieldByName('DESCRPROVDESC').asString);
      chklstRubrica8.Items.Add(FieldByName('DESCRPROVDESC').asString);
      Next;
    end;
  end;


  pgctrlPaginas.ActivePageIndex  := 0;
  pgctrlPaginas2.ActivePageIndex := 0;
  edTituloLinha1.Text := '';
  edTituloLinha2.Text := '';

  // Carrega alterações nas opções feitas anteriormente
  LeAlteracoes;
end;

procedure TFRMSelEstCusto.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  GravaAlteracoes;

  dtmBaseDados.qry.Close;  

  inherited;
end;

procedure TFRMSelEstCusto.chklstRubrica1DrawItem(Control: TWinControl; Index: Integer;
  Rect: TRect; State: TOwnerDrawState);
begin
  with (TColorCheckListBox(Control).Canvas) do
  begin
    if (TColorCheckListBox(Control).Checked[Index]) then
    begin
      Brush.Color := CL_AMARELO_CLARO;
      Font.Color  := clBlack;
    end;

    FillRect(Rect);
    TextOut(Rect.Left, Rect.Top, TColorCheckListBox(Control).Items[Index]);
  end;
end;

procedure TFRMSelEstCusto.dblkcbEstabChange(Sender: TObject);
begin
  HabilitaBtOk;
end;

procedure TFRMSelEstCusto.pgctrlPaginas2Change(Sender: TObject);
begin
  case (pgctrlPaginas2.ActivePageIndex) of
    0 : edCodRubricas.Text := LiRubrica1;
    1 : edCodRubricas.Text := LiRubrica2;
    2 : edCodRubricas.Text := LiRubrica3;
    3 : edCodRubricas.Text := LiRubrica4;
    4 : edCodRubricas.Text := LiRubrica5;
    5 : edCodRubricas.Text := LiRubrica6;
    6 : edCodRubricas.Text := LiRubrica7;
    7 : edCodRubricas.Text := LiRubrica8;
  end;

  edTituloLinha1.Text := regTituloLinha[pgctrlPaginas2.ActivePageIndex+1].Linha1;
  edTituloLinha2.Text := regTituloLinha[pgctrlPaginas2.ActivePageIndex+1].Linha2;
end;

procedure TFRMSelEstCusto.edTituloLinha1Change(Sender: TObject);
begin
  case (pgctrlPaginas2.ActivePageIndex) of
    0 : begin
          if (TEdit(Sender).Name = 'edTituloLinha1') then
            regTituloLinha[1].Linha1 := edTituloLinha1.Text
          else
            regTituloLinha[1].Linha2 := edTituloLinha2.Text;
        end;
    1 : begin
          if (TEdit(Sender).Name = 'edTituloLinha1') then
            regTituloLinha[2].Linha1 := edTituloLinha1.Text
          else
            regTituloLinha[2].Linha2 := edTituloLinha2.Text;
        end;
    2 : begin
          if (TEdit(Sender).Name = 'edTituloLinha1') then
            regTituloLinha[3].Linha1 := edTituloLinha1.Text
          else
            regTituloLinha[3].Linha2 := edTituloLinha2.Text;
        end;
    3 : begin
          if (TEdit(Sender).Name = 'edTituloLinha1') then
            regTituloLinha[4].Linha1 := edTituloLinha1.Text
          else
            regTituloLinha[4].Linha2 := edTituloLinha2.Text;
        end;
    4 : begin
          if (TEdit(Sender).Name = 'edTituloLinha1') then
            regTituloLinha[5].Linha1 := edTituloLinha1.Text
          else
            regTituloLinha[5].Linha2 := edTituloLinha2.Text;
        end;
    5 : begin
          if (TEdit(Sender).Name = 'edTituloLinha1') then
            regTituloLinha[6].Linha1 := edTituloLinha1.Text
          else
            regTituloLinha[6].Linha2 := edTituloLinha2.Text;
        end;
    6 : begin
          if (TEdit(Sender).Name = 'edTituloLinha1') then
            regTituloLinha[7].Linha1 := edTituloLinha1.Text
          else
            regTituloLinha[7].Linha2 := edTituloLinha2.Text;
        end;
    7 : begin
          if (TEdit(Sender).Name = 'edTituloLinha1') then
            regTituloLinha[8].Linha1 := edTituloLinha1.Text
          else
            regTituloLinha[8].Linha2 := edTituloLinha2.Text;
        end;
  end;
  HabilitaBtOk;
end;

procedure TFRMSelEstCusto.chklstRubrica1KeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  if (Key = VK_TAB) then
    chklstRubrica1ClickCheck(Sender);
end;

procedure TFRMSelEstCusto.chklstRubrica1ClickCheck(Sender: TObject);
begin
  case (pgctrlPaginas2.ActivePageIndex) of
    0 : begin
          CriaListaOpcoes (chklstRubrica1, ListaCodRubrica, LiRubrica1, ',', false);
          edCodRubricas.Text := LiRubrica1;
        end;
    1 : begin
          CriaListaOpcoes (chklstRubrica2, ListaCodRubrica, LiRubrica2, ',', false);
          edCodRubricas.Text := LiRubrica2;
        end;
    2 : begin
          CriaListaOpcoes (chklstRubrica3, ListaCodRubrica, LiRubrica3, ',', false);
          edCodRubricas.Text := LiRubrica3;
        end;
    3 : begin
          CriaListaOpcoes (chklstRubrica4, ListaCodRubrica, LiRubrica4, ',', false);
          edCodRubricas.Text := LiRubrica4;
        end;
    4 : begin
          CriaListaOpcoes (chklstRubrica5, ListaCodRubrica, LiRubrica5, ',', false);
          edCodRubricas.Text := LiRubrica5;
        end;
    5 : begin
          CriaListaOpcoes (chklstRubrica6, ListaCodRubrica, LiRubrica6, ',', false);
          edCodRubricas.Text := LiRubrica6;
        end;
    6 : begin
          CriaListaOpcoes (chklstRubrica7, ListaCodRubrica, LiRubrica7, ',', false);
          edCodRubricas.Text := LiRubrica7;
        end;
    7 : begin
          CriaListaOpcoes (chklstRubrica8, ListaCodRubrica, LiRubrica8, ',', false);
          edCodRubricas.Text := LiRubrica8;
        end;
  end;
  InvalidateItemListBox(TCustomListBox(Sender),TCustomListBox(Sender).ItemIndex);
  HabilitaBtOk;
end;

procedure TFRMSelEstCusto.sbtnMarcarRubClick(Sender: TObject);
begin
  edCodRubricas.Text := Trim(edCodRubricas.Text);

  case (pgctrlPaginas2.ActivePageIndex) of
    0 : begin
          VerificaOpcoes (chklstRubrica1, ListaCodRubrica, edCodRubricas.Text, ',');
          LiRubrica1 := edCodRubricas.Text;
          chklstRubrica1.Repaint;
        end;
    1 : begin
          VerificaOpcoes (chklstRubrica2, ListaCodRubrica, edCodRubricas.Text, ',');
          LiRubrica2 := edCodRubricas.Text;
          chklstRubrica2.Repaint;
        end;
    2 : begin
          VerificaOpcoes (chklstRubrica3, ListaCodRubrica, edCodRubricas.Text, ',');
          LiRubrica3 := edCodRubricas.Text;
          chklstRubrica3.Repaint;
        end;
    3 : begin
          VerificaOpcoes (chklstRubrica4, ListaCodRubrica, edCodRubricas.Text, ',');
          LiRubrica4 := edCodRubricas.Text;
          chklstRubrica4.Repaint;
        end;
    4 : begin
          VerificaOpcoes (chklstRubrica5, ListaCodRubrica, edCodRubricas.Text, ',');
          LiRubrica5 := edCodRubricas.Text;
          chklstRubrica5.Repaint;
        end;
    5 : begin
          VerificaOpcoes (chklstRubrica6, ListaCodRubrica, edCodRubricas.Text, ',');
          LiRubrica6 := edCodRubricas.Text;
          chklstRubrica6.Repaint;
        end;
    6 : begin
          VerificaOpcoes (chklstRubrica7, ListaCodRubrica, edCodRubricas.Text, ',');
          LiRubrica7 := edCodRubricas.Text;
          chklstRubrica7.Repaint;
        end;
    7 : begin
          VerificaOpcoes (chklstRubrica8, ListaCodRubrica, edCodRubricas.Text, ',');
          LiRubrica8 := edCodRubricas.Text;
          chklstRubrica8.Repaint;
        end;
  end;
  HabilitaBtOk;
end;

procedure TFRMSelEstCusto.bbtnSelTodosClick(Sender: TObject);
var
  c: integer;
begin
  case (pgctrlPaginas2.ActivePageIndex) of
    0 : chkListAux := chklstRubrica1;
    1 : chkListAux := chklstRubrica2;
    2 : chkListAux := chklstRubrica3;
    3 : chkListAux := chklstRubrica4;
    4 : chkListAux := chklstRubrica5;
    5 : chkListAux := chklstRubrica6;
    6 : chkListAux := chklstRubrica7;
    7 : chkListAux := chklstRubrica8;
  end;

  for c:=0 to chkListAux.Items.Count-1 do
    chkListAux.Checked[c] := true;

  case (pgctrlPaginas2.ActivePageIndex) of
    0 : begin
          CriaListaOpcoes (chklstRubrica1, ListaCodRubrica, LiRubrica1, ',', false);
          edCodRubricas.Text := LiRubrica1;
        end;
    1 : begin
          CriaListaOpcoes (chklstRubrica2, ListaCodRubrica, LiRubrica2, ',', false);
          edCodRubricas.Text := LiRubrica2;
        end;
    2 : begin
          CriaListaOpcoes (chklstRubrica3, ListaCodRubrica, LiRubrica3, ',', false);
          edCodRubricas.Text := LiRubrica3;
        end;
    3 : begin
          CriaListaOpcoes (chklstRubrica4, ListaCodRubrica, LiRubrica4, ',', false);
          edCodRubricas.Text := LiRubrica4;
        end;
    4 : begin
          CriaListaOpcoes (chklstRubrica5, ListaCodRubrica, LiRubrica5, ',', false);
          edCodRubricas.Text := LiRubrica5;
        end;
    5 : begin
          CriaListaOpcoes (chklstRubrica6, ListaCodRubrica, LiRubrica6, ',', false);
          edCodRubricas.Text := LiRubrica6;
        end;
    6 : begin
          CriaListaOpcoes (chklstRubrica7, ListaCodRubrica, LiRubrica7, ',', false);
          edCodRubricas.Text := LiRubrica7;
        end;
    7 : begin
          CriaListaOpcoes (chklstRubrica8, ListaCodRubrica, LiRubrica8, ',', false);
          edCodRubricas.Text := LiRubrica8;
        end;
  end;
  chkListAux.Repaint;
  HabilitaBtOk;
end;

procedure TFRMSelEstCusto.bbtnInverteSelClick(Sender: TObject);
var
  c: integer;
begin
  case (pgctrlPaginas2.ActivePageIndex) of
    0 : begin
          for c:=0 to chklstRubrica1.Items.Count-1 do
            chklstRubrica1.Checked[c] := not(chklstRubrica1.Checked[c]);

          CriaListaOpcoes (chklstRubrica1, ListaCodRubrica, LiRubrica1, ',', false);
          edCodRubricas.Text := LiRubrica1;
          chklstRubrica1.Repaint;
        end;
    1 : begin
          for c:=0 to chklstRubrica2.Items.Count-1 do
            chklstRubrica2.Checked[c] := not(chklstRubrica2.Checked[c]);

          CriaListaOpcoes (chklstRubrica2, ListaCodRubrica, LiRubrica2, ',', false);
          edCodRubricas.Text := LiRubrica2;
          chklstRubrica2.Repaint;
        end;
    2 : begin
          for c:=0 to chklstRubrica3.Items.Count-1 do
            chklstRubrica3.Checked[c] := not(chklstRubrica3.Checked[c]);

          CriaListaOpcoes (chklstRubrica3, ListaCodRubrica, LiRubrica3, ',', false);
          edCodRubricas.Text := LiRubrica3;
          chklstRubrica3.Repaint;
        end;
    3 : begin
          for c:=0 to chklstRubrica4.Items.Count-1 do
            chklstRubrica4.Checked[c] := not(chklstRubrica4.Checked[c]);

          CriaListaOpcoes (chklstRubrica4, ListaCodRubrica, LiRubrica4, ',', false);
          edCodRubricas.Text := LiRubrica4;
          chklstRubrica4.Repaint;
        end;
    4 : begin
          for c:=0 to chklstRubrica5.Items.Count-1 do
            chklstRubrica5.Checked[c] := not(chklstRubrica5.Checked[c]);

          CriaListaOpcoes (chklstRubrica4, ListaCodRubrica, LiRubrica5, ',', false);
          edCodRubricas.Text := LiRubrica5;
          chklstRubrica5.Repaint;
        end;
    5 : begin
          for c:=0 to chklstRubrica6.Items.Count-1 do
            chklstRubrica6.Checked[c] := not(chklstRubrica6.Checked[c]);

          CriaListaOpcoes (chklstRubrica6, ListaCodRubrica, LiRubrica6, ',', false);
          edCodRubricas.Text := LiRubrica6;
          chklstRubrica6.Repaint;
        end;
    6 : begin
          for c:=0 to chklstRubrica7.Items.Count-1 do
            chklstRubrica7.Checked[c] := not(chklstRubrica7.Checked[c]);

          CriaListaOpcoes (chklstRubrica7, ListaCodRubrica, LiRubrica7, ',', false);
          edCodRubricas.Text := LiRubrica7;
          chklstRubrica3.Repaint;
        end;
    7 : begin
          for c:=0 to chklstRubrica8.Items.Count-1 do
            chklstRubrica8.Checked[c] := not(chklstRubrica8.Checked[c]);

          CriaListaOpcoes (chklstRubrica8, ListaCodRubrica, LiRubrica8, ',', false);
          edCodRubricas.Text := LiRubrica8;
          chklstRubrica8.Repaint;
        end;
  end;
  HabilitaBtOk;
end;

procedure TFRMSelEstCusto.bbtnConfirmarClick(Sender: TObject);
var
  sMes: string;
  iNum, I, K: integer;
begin
  // Inicia variáveis
  sMes := QuotedStr(speAno.Text +'/'+ PoeZero(cmbMes.ItemIndex+1));

  // Rubricas para 1ª Coluna
  CriaListaOpcoes (chklstRubrica1, ListaCodRubrica, LiRubrica1, ',', true);
  if (LiRubrica1 = '') then
    LiRubrica1 := QuotedStr('-1');

  // Rubricas para 2ª Coluna
  CriaListaOpcoes (chklstRubrica2, ListaCodRubrica, LiRubrica2, ',', true);
  if (LiRubrica2 = '') then
    LiRubrica2 := QuotedStr('-1');

  // Rubricas para 3ª Coluna
  CriaListaOpcoes (chklstRubrica3, ListaCodRubrica, LiRubrica3, ',', true);
  if (LiRubrica3 = '') then
    LiRubrica3 := QuotedStr('-1');

  // Rubricas para 4ª Coluna
  CriaListaOpcoes (chklstRubrica4, ListaCodRubrica, LiRubrica4, ',', true);
  if (LiRubrica4 = '') then
    LiRubrica4 := QuotedStr('-1');

  // Rubricas para 5ª Coluna
  CriaListaOpcoes (chklstRubrica5, ListaCodRubrica, LiRubrica5, ',', true);
  if (LiRubrica5 = '') then
    LiRubrica5 := QuotedStr('-1');

  // Rubricas para 6ª Coluna
  CriaListaOpcoes (chklstRubrica6, ListaCodRubrica, LiRubrica6, ',', true);
  if (LiRubrica6 = '') then
    LiRubrica6 := QuotedStr('-1');

  // Rubricas para 7ª Coluna
  CriaListaOpcoes (chklstRubrica7, ListaCodRubrica, LiRubrica7, ',', true);
  if (LiRubrica7 = '') then
    LiRubrica7 := QuotedStr('-1');

  // Rubricas para 8ª Coluna
  CriaListaOpcoes (chklstRubrica8, ListaCodRubrica, LiRubrica8, ',', true);
  if (LiRubrica8 = '') then
    LiRubrica8 := QuotedStr('-1');


  // Monto Query conforme a seleção do usuário
  qryVariavelMensal.Close;
  with (qryVariavelMensal.SQL) do
  begin
    Clear;
    Add('SELECT DISTINCT');
    Add('  NVL(COL1.VALOR,0) AS VAL_COL1,');
    Add('  NVL(COL2.VALOR,0) AS VAL_COL2,');
    Add('  NVL(COL3.VALOR,0) AS VAL_COL3,');
    Add('  NVL(COL4.VALOR,0) AS VAL_COL4,');
    Add('  NVL(COL5.VALOR,0) AS VAL_COL5,');
    Add('  NVL(COL6.VALOR,0) AS VAL_COL6,');
    Add('  NVL(COL7.VALOR,0) AS VAL_COL7,');
    Add('  NVL(COL8.VALOR,0) AS VAL_COL8,');
    Add('  (NVL(COL1.VALOR,0) + NVL(COL2.VALOR,0) + NVL(COL3.VALOR,0) +');
    Add('   NVL(COL4.VALOR,0) + NVL(COL5.VALOR,0) + NVL(COL6.VALOR,0) +');
    Add('   NVL(COL7.VALOR,0) + NVL(COL8.VALOR,0)) AS VAL_TOTAL');
    Add('FROM');
    Add('  FUNCIONARIO F, ');
    // -----------------------------------------------------------------------
    Add('  (SELECT H.MES, H.IDPESSOA, SUM(H.VALORPROVENTO) AS VALOR');
    Add('   FROM   HISTRUBSAL H, FUNCIONARIO F');
    Add('   WHERE  (F.IDPESSOA         = :IDPESSOA) AND');
    if (Pos(',',LiRubrica1) > 0) then
      Add('          (H.CODPROVDESC    IN (' +LiRubrica1+ ')) AND')
    else
      Add('          (H.CODPROVDESC     = ' +LiRubrica1+ ') AND');
    Add('          (H.MES             = '+sMes+') AND');
    Add('          (F.IDPESSOA        = H.IDPESSOA)');
    Add('   GROUP BY H.MES, H.IDPESSOA) COL1,');
    // -----------------------------------------------------------------------
    Add('  (SELECT H.MES, H.IDPESSOA, SUM(H.VALORPROVENTO) AS VALOR');
    Add('   FROM   HISTRUBSAL H, FUNCIONARIO F');
    Add('   WHERE  (F.IDPESSOA         = :IDPESSOA) AND');
    if (Pos(',',LiRubrica2) > 0) then
      Add('          (H.CODPROVDESC    IN (' +LiRubrica2+ ')) AND')
    else
      Add('          (H.CODPROVDESC     = ' +LiRubrica2+ ') AND');
    Add('          (H.MES             = '+sMes+') AND');
    Add('          (F.IDPESSOA        = H.IDPESSOA)');
    Add('   GROUP BY H.MES, H.IDPESSOA) COL2,');
    // -----------------------------------------------------------------------
    Add('  (SELECT H.MES, H.IDPESSOA, SUM(H.VALORPROVENTO) AS VALOR');
    Add('   FROM   HISTRUBSAL H, FUNCIONARIO F');
    Add('   WHERE  (F.IDPESSOA         = :IDPESSOA) AND');
    if (Pos(',',LiRubrica3) > 0) then
      Add('          (H.CODPROVDESC    IN (' +LiRubrica3+ ')) AND')
    else
      Add('          (H.CODPROVDESC     = ' +LiRubrica3+ ') AND');
    Add('          (H.MES             = '+sMes+') AND');
    Add('          (F.IDPESSOA        = H.IDPESSOA)');
    Add('   GROUP BY H.MES, H.IDPESSOA) COL3,');
    // -----------------------------------------------------------------------
    Add('  (SELECT H.MES, H.IDPESSOA, SUM(H.VALORPROVENTO) AS VALOR');
    Add('   FROM   HISTRUBSAL H, FUNCIONARIO F');
    Add('   WHERE  (F.IDPESSOA         = :IDPESSOA) AND');
    if (Pos(',',LiRubrica4) > 0) then
      Add('          (H.CODPROVDESC    IN (' +LiRubrica4+ ')) AND')
    else
      Add('          (H.CODPROVDESC     = ' +LiRubrica4+ ') AND');
    Add('          (H.MES             = '+sMes+') AND');
    Add('          (F.IDPESSOA        = H.IDPESSOA)');
    Add('   GROUP BY H.MES, H.IDPESSOA) COL4,');
    // -----------------------------------------------------------------------
    Add('  (SELECT H.MES, H.IDPESSOA, SUM(H.VALORPROVENTO) AS VALOR');
    Add('   FROM   HISTRUBSAL H, FUNCIONARIO F');
    Add('   WHERE  (F.IDPESSOA         = :IDPESSOA) AND');
    if (Pos(',',LiRubrica5) > 0) then
      Add('          (H.CODPROVDESC    IN (' +LiRubrica5+ ')) AND')
    else
      Add('          (H.CODPROVDESC     = ' +LiRubrica5+ ') AND');
    Add('          (H.MES             = '+sMes+') AND');
    Add('          (F.IDPESSOA        = H.IDPESSOA)');
    Add('   GROUP BY H.MES, H.IDPESSOA) COL5,');
    // -----------------------------------------------------------------------
    Add('  (SELECT H.MES, H.IDPESSOA, SUM(H.VALORPROVENTO) AS VALOR');
    Add('   FROM   HISTRUBSAL H, FUNCIONARIO F');
    Add('   WHERE  (F.IDPESSOA         = :IDPESSOA) AND');
    if (Pos(',',LiRubrica6) > 0) then
      Add('          (H.CODPROVDESC    IN (' +LiRubrica6+ ')) AND')
    else
      Add('          (H.CODPROVDESC     = ' +LiRubrica6+ ') AND');
    Add('          (H.MES             = '+sMes+') AND');
    Add('          (F.IDPESSOA        = H.IDPESSOA)');
    Add('   GROUP BY H.MES, H.IDPESSOA) COL6,');
    // -----------------------------------------------------------------------
    Add('  (SELECT H.MES, H.IDPESSOA, SUM(H.VALORPROVENTO) AS VALOR');
    Add('   FROM   HISTRUBSAL H, FUNCIONARIO F');
    Add('   WHERE  (F.IDPESSOA         = :IDPESSOA) AND');
    if (Pos(',',LiRubrica7) > 0) then
      Add('          (H.CODPROVDESC    IN (' +LiRubrica7+ ')) AND')
    else
      Add('          (H.CODPROVDESC     = ' +LiRubrica7+ ') AND');
    Add('          (H.MES             = '+sMes+') AND');
    Add('          (F.IDPESSOA        = H.IDPESSOA)');
    Add('   GROUP BY H.MES, H.IDPESSOA) COL7,');
    // -----------------------------------------------------------------------
    Add('  (SELECT H.MES, H.IDPESSOA, SUM(H.VALORPROVENTO) AS VALOR');
    Add('   FROM   HISTRUBSAL H, FUNCIONARIO F');
    Add('   WHERE  (F.IDPESSOA         = :IDPESSOA) AND');
    if (Pos(',',LiRubrica8) > 0) then
      Add('          (H.CODPROVDESC    IN (' +LiRubrica8+ ')) AND')
    else
      Add('          (H.CODPROVDESC     = ' +LiRubrica8+ ') AND');
    Add('          (H.MES             = '+sMes+') AND');
    Add('          (F.IDPESSOA        = H.IDPESSOA)');
    Add('   GROUP BY H.MES, H.IDPESSOA) COL8,');
    // -----------------------------------------------------------------------
    // Última evolução Funcional do Funcionário
    Add('  (SELECT CARGO.IDCARGO, CARGO.TITULO, EVOL.IDPESSOA');
    Add('   FROM   EVOLFUNC EVOL, CARGO');
    Add('   WHERE  (CARGO.IDCARGO      = EVOL.IDCARGO) AND');
    Add('          (EVOL.DATAALTERFUNC = (SELECT MAX(DATAALTERFUNC)');
    Add('                                 FROM   EVOLFUNC');
    Add('                                 WHERE  (EVOLFUNC.IDPESSOA       = EVOL.IDPESSOA) AND');
    Add('                                        (EVOLFUNC.DATAALTERFUNC <= TO_DATE('+
      QuotedStr(IntToStr(TrazUltDiaMes(cmbMes.ItemIndex+1, speAno.Value)) +'/'+
      PoeZero(cmbMes.ItemIndex+1) +'/'+ speAno.Text)+
      ',''DD/MM/YYYY''))))) HST_CARGO');
    // -----------------------------------------------------------------------
    Add('WHERE');
    Add('  (F.IDPESSOA       = :IDPESSOA) AND');
    Add('  (F.DATAADMISSAO   <= TO_DATE(' +
      QuotedStr(IntToStr(TrazUltDiaMes(cmbMes.ItemIndex+1, speAno.Value)) +'/'+
      PoeZero(cmbMes.ItemIndex+1) +'/'+ speAno.Text)+',''DD/MM/YYYY'')) AND');

    Add('  (F.IDPESSOA        = HST_CARGO.IDPESSOA(+))  AND');
    Add('  (F.IDPESSOA        = COL1.IDPESSOA(+)) AND');
    Add('  (F.IDPESSOA        = COL2.IDPESSOA(+)) AND');
    Add('  (F.IDPESSOA        = COL3.IDPESSOA(+)) AND');
    Add('  (F.IDPESSOA        = COL4.IDPESSOA(+)) AND');
    Add('  (F.IDPESSOA        = COL5.IDPESSOA(+)) AND');
    Add('  (F.IDPESSOA        = COL6.IDPESSOA(+)) AND');
    Add('  (F.IDPESSOA        = COL7.IDPESSOA(+)) AND');
    Add('  (F.IDPESSOA        = COL8.IDPESSOA(+))');

    //SaveToFile ('c:\qry.txt');
    SaveToFile (Sistema.RetornaCaminhoArquivos(Sistema.IdEmpresa)+'\qry.txt');//Ádler Teodoro de Souza SOL 109421 KINTANA 496332
  end;

  //qryVariavelMensal.Open;

  AbrirForm(frmEstCusto, TfrmEstCusto, false);

end;

// -------------------------------------------------------------------------------------
// Funções do Form
// -------------------------------------------------------------------------------------
procedure TFRMSelEstCusto.LeAlteracoes;
var
  c: integer;
  sTitulo, sEstab: string;
begin
  // Recupera as últimas alterações das opções
  //ArqConfig  := TIniFile.Create('C:\CONFIG_FOLHAPAGTO.INI');
  ArqConfig  := TIniFile.Create(Sistema.RetornaCaminhoArquivos(Sistema.IdEmpresa)+'\CONFIG_FOLHAPAGTO.INI');//Ádler Teodoro de Souza SOL 109421 KINTANA 496332
  sEstab     := ArqConfig.ReadString ('REL_VARMENSAL', 'Estabelec', '');
  LiRubrica1 := ArqConfig.ReadString ('REL_VARMENSAL', 'Rubricas1', '');
  LiRubrica2 := ArqConfig.ReadString ('REL_VARMENSAL', 'Rubricas2', '');
  LiRubrica3 := ArqConfig.ReadString ('REL_VARMENSAL', 'Rubricas3', '');
  LiRubrica4 := ArqConfig.ReadString ('REL_VARMENSAL', 'Rubricas4', '');
  LiRubrica5 := ArqConfig.ReadString ('REL_VARMENSAL', 'Rubricas5', '');
  LiRubrica6 := ArqConfig.ReadString ('REL_VARMENSAL', 'Rubricas6', '');
  LiRubrica7 := ArqConfig.ReadString ('REL_VARMENSAL', 'Rubricas7', '');
  LiRubrica8 := ArqConfig.ReadString ('REL_VARMENSAL', 'Rubricas8', '');
  sTitulo    := ArqConfig.ReadString ('REL_VARMENSAL', 'Titulo', 'Relação de Rubricas Selecionadas por Empregado');

  for c:=1 to 8 do
  begin
    regTituloLinha[c].Linha1 := ArqConfig.ReadString ('REL_VARMENSAL', 'Coluna'+IntToStr(c)+'Linha1', '');
    regTituloLinha[c].Linha2 := ArqConfig.ReadString ('REL_VARMENSAL', 'Coluna'+IntToStr(c)+'Linha2', '');
  end;

  VerificaOpcoes(chklstRubrica1, ListaCodRubrica,  LiRubrica1, ',');
  VerificaOpcoes(chklstRubrica2, ListaCodRubrica,  LiRubrica2, ',');
  VerificaOpcoes(chklstRubrica3, ListaCodRubrica,  LiRubrica3, ',');
  VerificaOpcoes(chklstRubrica4, ListaCodRubrica,  LiRubrica4, ',');
  VerificaOpcoes(chklstRubrica5, ListaCodRubrica,  LiRubrica5, ',');
  VerificaOpcoes(chklstRubrica6, ListaCodRubrica,  LiRubrica6, ',');
  VerificaOpcoes(chklstRubrica7, ListaCodRubrica,  LiRubrica7, ',');
  VerificaOpcoes(chklstRubrica8, ListaCodRubrica,  LiRubrica8, ',');


  edCodRubricas.Text  := LiRubrica1;
  edTituloLinha1.Text := regTituloLinha[1].Linha1;
  edTituloLinha2.Text := regTituloLinha[1].Linha2;

  HabilitaBtOk;
end;

procedure TFRMSelEstCusto.GravaAlteracoes;
var
  c: integer;
begin
  // Grava as últimas alterações da Opção de Rubricas 1
  CriaListaOpcoes (chklstRubrica1, ListaCodRubrica, LiRubrica1, ',', false);
  ArqConfig.WriteString ('REL_VARMENSAL','Rubricas1',LiRubrica1);

  // Grava as últimas alterações da Opção de Rubricas 2
  CriaListaOpcoes (chklstRubrica2, ListaCodRubrica, LiRubrica2, ',', false);
  ArqConfig.WriteString ('REL_VARMENSAL','Rubricas2',LiRubrica2);

  // Grava as últimas alterações da Opção de Rubricas 3
  CriaListaOpcoes (chklstRubrica3, ListaCodRubrica, LiRubrica3, ',', false);
  ArqConfig.WriteString ('REL_VARMENSAL','Rubricas3',LiRubrica3);

  // Grava as últimas alterações da Opção de Rubricas 4
  CriaListaOpcoes (chklstRubrica4, ListaCodRubrica, LiRubrica4, ',', false);
  ArqConfig.WriteString ('REL_VARMENSAL','Rubricas4',LiRubrica4);

  // Grava as últimas alterações da Opção de Rubricas 5
  CriaListaOpcoes (chklstRubrica5, ListaCodRubrica, LiRubrica5, ',', false);
  ArqConfig.WriteString ('REL_VARMENSAL','Rubricas5',LiRubrica5);

  // Grava as últimas alterações da Opção de Rubricas 6
  CriaListaOpcoes (chklstRubrica6, ListaCodRubrica, LiRubrica6, ',', false);
  ArqConfig.WriteString ('REL_VARMENSAL','Rubricas6',LiRubrica6);

  // Grava as últimas alterações da Opção de Rubricas 7
  CriaListaOpcoes (chklstRubrica7, ListaCodRubrica, LiRubrica7, ',', false);
  ArqConfig.WriteString ('REL_VARMENSAL','Rubricas7',LiRubrica7);

  // Grava as últimas alterações da Opção de Rubricas 8
  CriaListaOpcoes (chklstRubrica8, ListaCodRubrica, LiRubrica8, ',', false);
  ArqConfig.WriteString ('REL_VARMENSAL','Rubricas8',LiRubrica8);

  // Grava o Título do Relatório
  for c:=1 to 8 do
  begin
    ArqConfig.WriteString ('REL_VARMENSAL', 'Coluna'+IntToStr(c)+'Linha1', regTituloLinha[c].Linha1);
    ArqConfig.WriteString ('REL_VARMENSAL', 'Coluna'+IntToStr(c)+'Linha2', regTituloLinha[c].Linha2);
  end;

end;

procedure TFRMSelEstCusto.HabilitaBtOk;
var
  c: integer;
  bSelRub1, bSelRub2, bSelRub3: boolean;
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

  bbtnConfirmar.Enabled := ((bSelRub1) or (bSelRub2) or (bSelRub3)) and
    (Trim(speAno.Text) <> '') and
    ((Trim(regTituloLinha[1].Linha1) <> '') or (Trim(regTituloLinha[1].Linha2) <> '') or
     (Trim(regTituloLinha[2].Linha1) <> '') or (Trim(regTituloLinha[2].Linha2) <> '') or
     (Trim(regTituloLinha[3].Linha1) <> '') or (Trim(regTituloLinha[3].Linha2) <> ''));
end;

function TFRMSelEstCusto.SelecionaTipoContrato: string;
begin

end;

function TFRMSelEstCusto.SelecionaSitFunc: string;
begin

end;

procedure TFRMSelEstCusto.spbtSelecaoClick(Sender: TObject);
var
  c: integer;
begin
  inherited;

end;

procedure TFRMSelEstCusto.spbtInvSelecaoClick(Sender: TObject);
var
  c: integer;
begin
  inherited;

end;

procedure TFRMSelEstCusto.rgTipoEstClick(Sender: TObject);
begin
  inherited;
  if (rgTipoEst.ItemIndex = 4)then
  begin
    ednMin1.Text := ''; ednMax1.Text := ''; ednMin2.Text := '';
    ednMax2.Text := ''; ednMin3.Text := ''; ednMax3.Text := '';
    ednMin4.Text := ''; ednMax4.Text := ''; ednMin5.Text := '';
    ednMax5.Text := ''; ednMin6.Text := ''; ednMax6.Text := '';
    ednMin7.Text := ''; ednMax7.Text := ''; ednMin8.Text := '';
    ednMax8.Text := ''; rgTipoEst.Left := 28;
    gbxValores.Visible := True;
    bbtnConfirmar.Enabled := False;
  end
  else
  begin
    rgTipoEst.Left      := 223;
    gbxValores.Visible    := false;
    bbtnConfirmar.Enabled := true;
  end;
end;

procedure TFRMSelEstCusto.ednMax1Change(Sender: TObject);
begin
  inherited;
  bbtnConfirmar.Enabled := (ednMax1.Text <> '');
end;

end.
