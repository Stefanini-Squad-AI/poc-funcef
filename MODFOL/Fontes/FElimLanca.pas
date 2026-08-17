unit FElimLanca;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  FOkCancelar, StdCtrls, IvDictio, IvMulti, IvEMulti, MAHlpBtn, Buttons,
  TB97Tlbr, TB97, ExtCtrls, Db, DBTables, Wwquery, Wwtable, checklst, Spin;

type
  TfrmElimLanca = class(TfrmOkCancelar)
    qryAux: TwwQuery;
    rgProcessados: TRadioGroup;
    grpMesRef: TGroupBox;
    cmbMes: TComboBox;
    spnedAno: TSpinEdit;
    cbxMesAno: TCheckBox;
    rgPermanentes: TRadioGroup;
    gbxRubrica: TGroupBox;
    Label2: TLabel;
    edCodRubricas: TEdit;
    sbtnMarcarRub: TBitBtn;
    chklstRubrica: TCheckListBox;
    bbtnSelTodasRub: TBitBtn;
    bbtnInverteSelRub: TBitBtn;
    qryParamRH: TwwQuery;
    qryRubrica: TwwQuery;
    cmbSinal: TComboBox;
    procedure FormCreate(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure chklstRubricaDrawItem(Control: TWinControl; Index: Integer;
      Rect: TRect; State: TOwnerDrawState);
    procedure chklstRubricaClickCheck(Sender: TObject);
    procedure bbtnConfirmarClick(Sender: TObject);
    procedure cbxMesAnoClick(Sender: TObject);
    procedure bbtnSelTodasRubClick(Sender: TObject);
    procedure bbtnInverteSelRubClick(Sender: TObject);
    procedure sbtnMarcarRubClick(Sender: TObject);
  private
    sMesRef, LiRubrica, LiIdRubri: string;
    ListaRubrica: TStringList;
    ListaIdRubri: TStringList;
  public
    { Public declarations }
  end;

var
  frmElimLanca: TfrmElimLanca;

implementation

uses uMensErro, uSistema, uFuncoesUteis, fAguarde;

{$R *.DFM}

procedure TfrmElimLanca.FormCreate(Sender: TObject);
var
  wDia, wMes, wAno: word;
begin
  inherited;
  ListaRubrica := TStringList.Create;
  ListaIdRubri := TStringList.Create;

  qryParamRH.Open;
  DecodeDate(qryParamRH.FieldbyName('NORMALINI').Value, wAno, wMes, wDia);
  cmbMes.ItemIndex := wMes - 1;
  spnedAno.Value   := wAno;

  //Preenche ChkList das Rubricas
  chklstRubrica.Items.Clear;
  with (qryRubrica) do
  begin
    ParamByName('IDEMPRESA').asInteger := Sistema.IdEmpresa;
    Open;
    while not(EOF) do
    begin
      ListaRubrica.Add(FieldByName('CODPROVDESC').asString);
      ListaIdRubri.Add(FieldByName('IDRUBRICA').asString);
      chklstRubrica.Items.Add(FieldByName('DESCRPROVDESC').asString);
      Next;
    end;
  end;
end;

procedure TfrmElimLanca.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  qryParamRH.Close;
  qryRubrica.Close;
  inherited;
end;

procedure TfrmElimLanca.chklstRubricaDrawItem(Control: TWinControl; Index: Integer;
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

procedure TfrmElimLanca.chklstRubricaClickCheck(Sender: TObject);
begin
  CriaListaOpcoes (chklstRubrica, ListaRubrica, LiRubrica, ',', false);
  CriaListaOpcoes (chklstRubrica, ListaIdRubri, LiIdRubri, ',', false);
  edCodRubricas.Text := LiRubrica;
  InvalidateItemListBox(TCustomListBox(Sender),TCustomListBox(Sender).ItemIndex);
end;

procedure TfrmElimLanca.cbxMesAnoClick(Sender: TObject);
begin
  inherited;
  cmbMes.Visible   := not(cbxMesAno.Checked);
  spnedAno.Visible := not(cbxMesAno.Checked);
  cmbSinal.Visible := not(cbxMesAno.Checked);
end;

procedure TfrmElimLanca.bbtnSelTodasRubClick(Sender: TObject);
var
  c: integer;
begin
  inherited;
  for c:=0 to chklstRubrica.Items.Count-1 do
    chklstRubrica.Checked[c] := true;

  CriaListaOpcoes (chklstRubrica, ListaRubrica, LiRubrica, ',', false);
  CriaListaOpcoes (chklstRubrica, ListaIdRubri, LiIdRubri, ',', false);
  edCodRubricas.Text := LiRubrica;
  chklstRubrica.Repaint;
end;

procedure TfrmElimLanca.bbtnInverteSelRubClick(Sender: TObject);
var
  c: integer;
begin
  inherited;
  for c:=0 to chklstRubrica.Items.Count-1 do
    chklstRubrica.Checked[c] := not(chklstRubrica.Checked[c]);

  CriaListaOpcoes (chklstRubrica, ListaRubrica, LiRubrica, ',', false);
  CriaListaOpcoes (chklstRubrica, ListaIdRubri, LiIdRubri, ',', false);
  edCodRubricas.Text := LiRubrica;
  chklstRubrica.Repaint;
end;

procedure TfrmElimLanca.sbtnMarcarRubClick(Sender: TObject);
begin
  inherited;
  edCodRubricas.Text := Trim(edCodRubricas.Text);

  VerificaOpcoes (chklstRubrica, ListaRubrica, edCodRubricas.Text, ',');
  chklstRubrica.Repaint;
end;

procedure TfrmElimLanca.bbtnConfirmarClick(Sender: TObject);
begin
  inherited;
  if (MsgDlg('Confirma a Eliminação dos Lançamentos ?','Confirmação ',
             mtConfirmation, [mbYes,mbNo,mbHelp], 0) = mrNo) then
    exit;

  sMesRef := Trim(spnedAno.Text) +'/'+ PoeZero(cmbMes.ItemIndex+1);

  // Condições por seleção
  // Rubricas
  CriaListaOpcoes (chklstRubrica, ListaRubrica, LiRubrica, ',', false);
  CriaListaOpcoes (chklstRubrica, ListaIdRubri, LiIdRubri, ',', false);

  qryAux.Close;
  with (qryAux.SQL) do
  begin
    Clear;
    Add('DELETE FROM RUBRICAINDIV');
    Add('WHERE  (FLGTPRUBMANUT   = ''2'')');

    if (Trim(LiIdRubri) <> '') then
      if (Pos(',',LiIdRubri) > 0) then
        Add(' AND   (IDRUBRICA      IN (' +LiIdRubri+ '))')
      else
        Add(' AND   (IDRUBRICA       = ' +LiIdRubri+ ')');

    if not(cbxMesAno.Checked) then
      Add(' AND   (ANOMESINICIO  ' + cmbSinal.Text + ' ' + QuotedStr(sMesRef)+ ')');

    if (rgPermanentes.ItemIndex < 2) then
      Add(' AND   (FLGPERMANENTE  <> ' +IntToStr(rgPermanentes.ItemIndex)+ ')');

    if (rgProcessados.ItemIndex < 2) then
      if (rgProcessados.ItemIndex = 0) then
        Add(' AND   (NUMOCORRENCIAS >= PARCELAS)')
      else
        Add(' AND   (NUMOCORRENCIAS  < PARCELAS)');
  end;

  try
    frmAguarde.Width := 430;
    frmAguarde.Mostra ('Eliminando os Lançamentos Solicitados');
    frmAguarde.UpDate;

    qryAux.ExecSQL;

    frmAguarde.Apaga;

    MsgDlg('Processo Executado com Sucesso !','Aviso', mtInformation,[mbOk,mbHelp],0);
  except
    MsgDlg('Não Foi Possível Eliminar os Registros! Processo Interrompido.','Aviso', mtInformation,[mbOk,mbHelp],0);
    exit;
  end;

  frmAguarde.Width := 312;
  qryAux.Close;
end;

end.
