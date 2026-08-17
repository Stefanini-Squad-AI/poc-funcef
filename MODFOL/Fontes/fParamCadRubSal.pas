// *****************************************************************************
// ***************************** REGISTRO DE ALTERAÇÕES ************************
// *****************************************************************************
// Autor(a)    :  Ádler Teodoro de Souza
// Data        :  19/02/2009
// Pendência   : SOL 109421 KINTANA 496332
// Descricao   :  Alteração de gravação de arquivos de log na raiz do disco C: .
//------------------------------------------------------------------------------
unit fParamCadRubSal;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs, MAHlpBtn,
  StdCtrls, Buttons, TB97Tlbr, TB97, ExtCtrls, Db, DBTables, Wwquery, Wwdatsrc, Mask,
  wwdbedit, Wwdotdot, Wwdbcomb, Machklb, wwdblook, checklst, Spin, IvDictio, IvMulti,
  IvEMulti, Grids, Wwdbigrd, Wwdbgrid, ComCtrls, FSairAjuda;

type
  TfrmParamCadRubSal = class(TfrmSairAjuda)
    gbxRubricas: TGroupBox;
    Label1: TLabel;
    chklstRubrica: TCheckListBox;
    edCodRubricas: TEdit;
    sbtnMarcarRub: TBitBtn;
    bbtnSelTodas: TBitBtn;
    bbtnInverteSel: TBitBtn;
    gbxTipoRub: TGroupBox;
    chkDeOutRub: TCheckBox;
    chkEmOutRub: TCheckBox;
    gbxOrdem: TGroupBox;
    cmbOrderBy: TComboBox;
    gbxTipoPapel: TGroupBox;
    cmbTipoPapel: TComboBox;
    bbtnConfirmar: TBitBtn;
    ToolbarSep971: TToolbarSep97;
    procedure FormCreate(Sender: TObject);
    procedure bbtnConfirmarClick(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure chklstRubricaDrawItem(Control: TWinControl; Index: Integer;
      Rect: TRect; State: TOwnerDrawState);
    procedure chklstRubricaClickCheck(Sender: TObject);
    procedure sbtnMarcarRubClick(Sender: TObject);
    procedure bbtnSelTodasClick(Sender: TObject);
    procedure bbtnInverteSelClick(Sender: TObject);
  end;

var
  frmParamCadRubSal: TfrmParamCadRubSal;

implementation

uses uSistema, uMensErro, uDataBase, fAguarde, dBaseDados,
  uComumRelats, uFuncoesUteisRH, dRelatorios;

{$R *.DFM}

procedure TfrmParamCadRubSal.FormCreate(Sender: TObject);
var
  iPos: integer;
begin
  inherited;
  if not(Assigned(ListaCodRubrica)) then
    ListaCodRubrica := TStringList.Create;

  cmbTipoPapel.Items.Assign (dtmRelatorios.rpCadRubSal.PrinterSetup.PaperNames);

  iPos := ProcuraStList (cmbTipoPapel.Items,'A4');
  if (iPos = -1) then
    cmbTipoPapel. ItemIndex := 0
  else
    cmbTipoPapel. ItemIndex := iPos;

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

  cmbOrderBy.ItemIndex := 0;
end;

procedure TfrmParamCadRubSal.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  dtmBaseDados.qry.Close;
  inherited;
end;

procedure TfrmParamCadRubSal.chklstRubricaDrawItem(Control: TWinControl; Index: Integer;
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

procedure TfrmParamCadRubSal.bbtnSelTodasClick(Sender: TObject);
var
  c: integer;
begin
  for c:=0 to chklstRubrica.Items.Count-1 do
    chklstRubrica.Checked[c] := true;
  CriaListaOpcoes (chklstRubrica, ListaCodRubrica, sCodRubricaSel, ',', false);
  edCodRubricas.Text := sCodRubricaSel;
  chklstRubrica.Repaint;
end;

procedure TfrmParamCadRubSal.bbtnInverteSelClick(Sender: TObject);
var
  c: integer;
begin
  for c:=0 to chklstRubrica.Items.Count-1 do
    chklstRubrica.Checked[c] := not(chklstRubrica.Checked[c]);
  CriaListaOpcoes (chklstRubrica, ListaCodRubrica, sCodRubricaSel, ',', false);
  edCodRubricas.Text := sCodRubricaSel;
  chklstRubrica.Repaint;
end;

procedure TfrmParamCadRubSal.chklstRubricaClickCheck(Sender: TObject);
begin
  CriaListaOpcoes (chklstRubrica, ListaCodRubrica, sCodRubricaSel, ',', false);
  edCodRubricas.Text := sCodRubricaSel;
  InvalidateItemListBox(TCustomListBox(Sender),TCustomListBox(Sender).ItemIndex);
end;

procedure TfrmParamCadRubSal.sbtnMarcarRubClick(Sender: TObject);
begin
  edCodRubricas.Text := Trim(edCodRubricas.Text);
  VerificaOpcoes (chklstRubrica, ListaCodRubrica, edCodRubricas.Text, ',');
  chklstRubrica.Repaint;
end;

procedure TfrmParamCadRubSal.bbtnConfirmarClick(Sender: TObject);
var
  wNum: word;
begin
  // Rubrica(s) selecionada(s)
  wNum := CriaListaOpcoes (chklstRubrica, ListaCodRubrica, sCodRubricaSel, ',', true);
  if (wNum = ListaCodRubrica.Count) then
    sCodRubricaSel := '';

  // Monta Query Auxiliar
  dtmRelatorios.qryCadRubSal.Close;
  with (dtmRelatorios.qryCadRubSal.SQL) do
  begin
    Clear;
    Add('SELECT DISTINCT');
    // Nome da Empresa
    Add('  (' +QuotedStr(Sistema.NomeEmpresa)+ ')  AS EMPRESA,');
    // Dados da Rubrica
    Add('  PD.IDPROVENTO,');
    Add('  RP.CODPROVDESC  AS COD_RUBRICA,');
    Add('  PD.DESCRICAO    AS NOME_RUBRICA,');
    Add('  DECODE(PD.FLGDESCONTO,0,''Provento'',1,''Desconto'',''Outro'') AS TIPO,');
    Add('  RB.DESCRICAO    AS RUBRICACLT,');
    Add('  R1.NOMEREGRA    AS REGRA,');
    Add('  INF.NOMEINFORME AS INFORME,');
    Add('  NAT.DESCRICAO   AS NATUROPER,');
    Add('  PD.NUMPRIORIDADE,');
    Add('  DECODE(PD.FLGCONSTAFOLHA,0,'' '',''X'')          AS CONSTAFOLHA,');
    Add('  DECODE(PD.FLGOBRIGAFAVOREC,0,'' '',''X'')        AS OBRIGAFAVOREC,');
    Add('  DECODE(PD.FLGCONSOLIDA,0,'' '',''X'')            AS CONSOLIDA,');
    Add('  DECODE(PD.FLGESPECIAL,0,'' '',''X'')             AS ESPECIAL,');
    Add('  DECODE(PD.FLGPRORATA,0,'' '',''X'')              AS PRORATA,');
    Add('  DECODE(PD.FLGSALFAMILIA,0,'' '',''X'')           AS FOLHANORMAL,');
    Add('  DECODE(PD.FLGFERIAS,0,'' '',''X'')               AS FERIAS,');
    Add('  DECODE(PD.FLGFERIAS,1,R2.NOMEREGRA,'''')         AS REGRAFERIAS,');
    Add('  DECODE(PD.FLGDECIMOTERCEIRO,0,'' '',''X'')       AS DECIMOTERCEIRO,');
    Add('  DECODE(PD.FLGDECIMOTERCEIRO,1,R3.NOMEREGRA,'''') AS REGRADECIMOTERCEIRO,');
    Add('  DECODE(PD.FLGRESCISAO,0,'' '',''X'')             AS RESCISAO,');
    Add('  DECODE(PD.FLGRESCISAO,1,R4.NOMEREGRA,'''')       AS REGRARESCISAO');
    Add('FROM');
    Add('  PROVDESC PD, RUBRICAXPESS RP, RUBRICACLT RB, REGRA R1, REGRA R2,');
    Add('  REGRA R3, REGRA R4, INFORME INF, NATURENDIMENTO NAT');
    // ------------------------------------------------------------------------------- //
    Add('WHERE');
    // Rubrica(s) selecionada(s)
    if (Trim(sCodRubricaSel) <> '') then
      if (Pos(',',sCodRubricaSel) > 0) then
        Add('  (RP.CODPROVDESC    IN (' +sCodRubricaSel+ ')) AND')
      else
        Add('  (RP.CODPROVDESC     = ' +sCodRubricaSel+ ') AND');

    Add('  (RP.IDPESSOA        = '+IntToStr(Sistema.IdEmpresa)+')                   AND');
    Add('  (PD.FLGTPRUBRICA LIKE ''%F%'')             AND');
    Add('  (RP.IDRUBRICA       = PD.IDPROVENTO)       AND');
    Add('  (PD.CODRUBCLT       = RB.CODRUBCLT(+))     AND');
    Add('  (PD.IDREGRA         = R1.IDREGRA(+))       AND');
    Add('  (PD.IDREGRAFERIAS   = R2.IDREGRA(+))       AND');
    Add('  (PD.IDREGRA13       = R3.IDREGRA(+))       AND');
    Add('  (PD.IDREGRARESCISAO = R4.IDREGRA(+))       AND');
    Add('  (PD.IDINFORME       = INF.IDINFORME(+))    AND');
    Add('  (PD.CODIRRFDARF     = NAT.CODNATUREZA(+))');
    Add('ORDER BY');
    case (cmbOrderBy.ItemIndex) of
      0 : Add('  COD_RUBRICA');
      1 : Add('  COD_RUBRICA');
      2 : Add('  NOME_RUBRICA');
      3 : Add('  NOME_RUBRICA');
    end;

    case (cmbOrderBy.ItemIndex) of
      0,2 : dtmRelatorios.qryCadRubSal1.SQL[15] := '  CODIGO';
      1,3 : dtmRelatorios.qryCadRubSal1.SQL[15] := '  NOME';
    end;

    //SaveToFile('c:\qry.txt');
    SaveToFile(Sistema.RetornaCaminhoArquivos(Sistema.IdEmpresa)+'\qry.txt'); //Ádler Teodoro de Souza SOL 109421 KINTANA 496332

  end;

  frmAguarde.Mostra('Cadastro de Rubricas Salariais');
  frmAguarde.Pos := 0;

  dtmRelatorios.qryCadRubSal.Open;
  if (dtmRelatorios.qryCadRubSal.IsEmpty) then
  begin
    ModalResult := mrNone;
    frmAguarde.Apaga;
    MsgDlg('Não há dados a serem exibidos! Verifique.','Aviso',mtInformation,[mbOk,mbHelp],0);
    exit;
  end;

  dtmRelatorios.rpCadRubSal.PrinterSetup.PaperName := cmbTipoPapel.Items[cmbTipoPapel.ItemIndex];
  dtmRelatorios.CadRubSalSubReport1.Visible        := chkEmOutRub.Checked;
  dtmRelatorios.CadRubSalSubReport2.Visible        := chkDeOutRub.Checked;
end;

end.
