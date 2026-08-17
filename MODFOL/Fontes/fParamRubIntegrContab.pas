// *****************************************************************************
// ***************************** REGISTRO DE ALTERAÇÕES ************************
// *****************************************************************************
// Autor(a)    :  Ádler Teodoro de Souza
// Data        :  19/02/2009
// Pendência   : SOL 109421 KINTANA 496332
// Descricao   :  Alteração de gravação de arquivos de log na raiz do disco C: .
//------------------------------------------------------------------------------
unit fParamRubIntegrContab;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs, MAHlpBtn,
  StdCtrls, Buttons, TB97Tlbr, TB97, ExtCtrls, Db, DBTables, Wwquery, Wwdatsrc, Mask,
  wwdbedit, Wwdotdot, Wwdbcomb, Machklb, wwdblook, checklst, Spin, IvDictio, IvMulti,
  IvEMulti, Grids, Wwdbigrd, Wwdbgrid, ComCtrls, FSairAjuda;

type
  TfrmParamRubIntegrContab = class(TfrmSairAjuda)
    gbxRubricas: TGroupBox;
    Label1: TLabel;
    chklstRubrica: TCheckListBox;
    edCodRubricas: TEdit;
    sbtnMarcarRub: TBitBtn;
    bbtnSelTodas: TBitBtn;
    bbtnInverteSel: TBitBtn;
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
  frmParamRubIntegrContab: TfrmParamRubIntegrContab;

implementation

uses uSistema, uMensErro, uDataBase, fAguarde, dBaseDados,
  uComumRelats, uFuncoesUteis, dRelatoriosRubIntegrContab;

{$R *.DFM}

procedure TfrmParamRubIntegrContab.FormCreate(Sender: TObject);
var
  iPos: integer;
begin
  inherited;
  if not(Assigned(ListaCodRubrica)) then
    ListaCodRubrica := TStringList.Create;

  cmbTipoPapel.Items.Assign(dtmRelatoriosRubIntegrContab.rpRubIntegrContab.PrinterSetup.PaperNames);

  iPos := ProcuraStList(cmbTipoPapel.Items,'A4');
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

procedure TfrmParamRubIntegrContab.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  dtmBaseDados.qry.Close;
  inherited;
end;

procedure TfrmParamRubIntegrContab.chklstRubricaDrawItem(Control: TWinControl; Index: Integer;
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

procedure TfrmParamRubIntegrContab.bbtnSelTodasClick(Sender: TObject);
var
  c: integer;
begin
  for c:=0 to chklstRubrica.Items.Count-1 do
    chklstRubrica.Checked[c] := true;
  CriaListaOpcoes(chklstRubrica, ListaCodRubrica, sCodRubricaSel, ',', false);
  edCodRubricas.Text := sCodRubricaSel;
  chklstRubrica.Repaint;
end;

procedure TfrmParamRubIntegrContab.bbtnInverteSelClick(Sender: TObject);
var
  c: integer;
begin
  for c:=0 to chklstRubrica.Items.Count-1 do
    chklstRubrica.Checked[c] := not(chklstRubrica.Checked[c]);
  CriaListaOpcoes(chklstRubrica, ListaCodRubrica, sCodRubricaSel, ',', false);
  edCodRubricas.Text := sCodRubricaSel;
  chklstRubrica.Repaint;
end;

procedure TfrmParamRubIntegrContab.chklstRubricaClickCheck(Sender: TObject);
begin
  CriaListaOpcoes(chklstRubrica, ListaCodRubrica, sCodRubricaSel, ',', false);
  edCodRubricas.Text := sCodRubricaSel;
  InvalidateItemListBox(TCustomListBox(Sender),TCustomListBox(Sender).ItemIndex);
end;

procedure TfrmParamRubIntegrContab.sbtnMarcarRubClick(Sender: TObject);
begin
  edCodRubricas.Text := Trim(edCodRubricas.Text);
  VerificaOpcoes(chklstRubrica, ListaCodRubrica, edCodRubricas.Text, ',');
  chklstRubrica.Repaint;
end;

procedure TfrmParamRubIntegrContab.bbtnConfirmarClick(Sender: TObject);
var
  wNum: word;
begin
  // Rubrica(s) selecionada(s)
  wNum := CriaListaOpcoes(chklstRubrica, ListaCodRubrica, sCodRubricaSel, ',', true);
  if (wNum = ListaCodRubrica.Count) then
    sCodRubricaSel := '';

  // Monta Query Auxiliar
  dtmRelatoriosRubIntegrContab.qryRubIntegrContab.Close;
  with (dtmRelatoriosRubIntegrContab.qryRubIntegrContab.SQL) do
  begin
    Clear;
    Add('SELECT');
    Add('  (' +QuotedStr(Sistema.NomeEmpresa)+ ') AS EMPRESA,');
    Add('  RP.CODPROVDESC,');    
    Add('  RP.DESCRPROVDESC,');
    Add('  DECODE(PD.FLGDESCONTO,0,''PROVENTO'',1,''DESCONTO'',''OUTROS'') AS TIPO,');
    Add('  CF.CONTACREDITO,');
    Add('  CF.CONTADEBITO,');
    Add('  CC.NOME AS CENTRO_CUSTO,');
    Add('  TD.DESCRICAO AS TIPO_DESEMB,');
    Add('  P.NOME AS FAVORECIDO,');
    Add('  CR.NOME AS CENT_RESPON,');
    Add('  UN.NOME AS UNID_NEGOC');
    Add('FROM');
    Add('  PESSOA P, RUBRICAXPESS RP, PROVDESC PD, CONTABFOLHA CF,');
    Add('  CENTCUST CC, TIPORECEBDESEMB TD, FORNSERV FS, CENTRESPON CR,');
    Add('  UNIDNEGOCIO UN');
    Add('WHERE');
    // Rubrica(s) selecionada(s)
    if (Trim(sCodRubricaSel) <> '') then
      if (Pos(',',sCodRubricaSel) > 0) then
        Add('  (RP.CODPROVDESC    IN (' +sCodRubricaSel+ ')) AND')
      else
        Add('  (RP.CODPROVDESC     = ' +sCodRubricaSel+ ') AND');

    Add('  (RP.IDPESSOA        = '+IntToStr(Sistema.IdEmpresa)+') AND');
    Add('  (PD.FLGTPRUBRICA LIKE (''%F%'')) AND');
    Add('  (CF.IDPROVENTO      = RP.IDRUBRICA) AND');
    Add('  (CF.IDPROVENTO      = PD.IDPROVENTO) AND');
    Add('  (CF.CODCENTROCUSTO  = CC.CODCENTROCUSTO(+)) AND');
    Add('  (CF.IDEMPRESA       = CC.IDEMPRESA(+)) AND');
    Add('  (CF.CODTIPRECDES    = TD.CODTIPRECDES(+)) AND');
    Add('  (CF.IDFAVORECIDO    = FS.IDPESSOA(+)) AND');
    Add('  (CF.IDFAVORECIDO    = P.IDPESSOA(+)) AND');
    Add('  (CF.CODCENTRORESPON = CR.CODCENTRORESPON(+)) AND');
    Add('  (CF.UNIDNEGOC       = UN.UNIDNEGOC(+)) AND');
    Add('  (CF.IDEMPRESA       = UN.IDPESSOA(+))');
    Add('ORDER BY');
    case (cmbOrderBy.ItemIndex) of
      0 : Add('  CODPROVDESC, DESCRPROVDESC');
      2 : Add('  DESCRPROVDESC, CODPROVDESC');
    end;
    //SaveToFile('c:\qry.txt');
    SaveToFile(Sistema.RetornaCaminhoArquivos(Sistema.IdEmpresa)+'\qry.txt');//Ádler Teodoro de Souza SOL 109421 KINTANA 496332
  end;

  frmAguarde.Mostra('Relação das Rubricas de Integração Contábil');
  frmAguarde.Pos := 0;

  dtmRelatoriosRubIntegrContab.qryRubIntegrContab.Open;
  if (dtmRelatoriosRubIntegrContab.qryRubIntegrContab.IsEmpty) then
  begin
    ModalResult := mrNone;
    frmAguarde.Apaga;
    MsgDlg('Não há dados a serem exibidos! Verifique.','Aviso',mtInformation,[mbOk,mbHelp],0);
    exit;
  end;

  dtmRelatoriosRubIntegrContab.rpRubIntegrContab.PrinterSetup.PaperName := cmbTipoPapel.Items[cmbTipoPapel.ItemIndex];
end;

end.
