unit FSelRelMapaTrein;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  FCMParamRel, MAHlpBtn, StdCtrls, Buttons, ExtCtrls,
  TB97, ComCtrls, Db, DBTables, Wwtable, TB97Tlbr, IvDictio, IvMulti,
  IvEMulti, Wwquery, wwdblook, wwdbdatetimepicker, CMDateTimePicker;

type
  TfrmSelRelMapaTrein = class(TCMParamRel)
    TabSheet1: TTabSheet;
    gbxFaixaData: TGroupBox;
    Label1: TLabel;
    EdData1: TCMDateTimePicker;
    EdData2: TCMDateTimePicker;
    gbxSelEstado: TGroupBox;
    cbxRealProgr: TCheckBox;
    cbxRealNaoProgr: TCheckBox;
    cbxNaoRealProgr: TCheckBox;
    cbxNaoRealNaoProgr: TCheckBox;
    gbxCurso: TGroupBox;
    dblcCurso: TwwDBLookupCombo;
    lstCurso: TListBox;
    qryCurso: TwwQuery;
    lstCodCurso: TListBox;
    gbxPacote: TGroupBox;
    dblcPacote: TwwDBLookupCombo;
    lstPacote: TListBox;
    lstCodPacote: TListBox;
    qryPacote: TwwQuery;
    cbxNada: TCheckBox;
    Memo1: TMemo;
    rgPacote: TRadioGroup;
    rgCurso: TRadioGroup;
    procedure EdData1Change(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure rbtnVisualizarClick(Sender: TObject);
    procedure rbtnImprimirClick(Sender: TObject);
    procedure dblcCursoCloseUp(Sender: TObject; LookupTable,
      FillTable: TDataSet; modified: Boolean);
    procedure lstCursoKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure rgPacoteClick(Sender: TObject);
    procedure rgCursoClick(Sender: TObject);
    procedure dblcPacoteCloseUp(Sender: TObject; LookupTable,
      FillTable: TDataSet; modified: Boolean);
    procedure lstPacoteKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);

  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmSelRelMapaTrein: TfrmSelRelMapaTrein;
  Imprime, FazRes1, FazRes2, FazRes3, FazRes4, FazRes5 : Boolean;
  SvItem, TamRes, iSelCurso : Integer;
  MsgTitulo, sTipo  : String;

implementation

uses RTreinMapa, FTelaAut;

{$R *.DFM}

procedure TfrmSelRelMapaTrein.FormCreate(Sender: TObject);
begin
  inherited;
  qryCurso.Open;
  qryPacote.Open;
  EdData1.Date := (Date-365);
  EdData2.Date := Date;
end;

procedure TfrmSelRelMapaTrein.EdData1Change(Sender: TObject);
begin
  inherited;
  if (EdData1.Text <> '') and (EdData2.Text <> '') and (EdData1.Date <= EdData2.Date) and
     (((lstCurso.Items.Count > 0) and (rgCurso.ItemIndex = 0)) or
      ((lstPacote.Items.Count > 0) and (rgPacote.ItemIndex = 0))) then
  begin
    rbtnVisualizar.Enabled := true;
    rbtnImprimir.Enabled   := true;
  end
  else
  begin
    rbtnVisualizar.Enabled := false;
    rbtnImprimir.Enabled   := false;
  end;
end;

procedure TfrmSelRelMapaTrein.dblcCursoCloseUp(Sender: TObject;
  LookupTable, FillTable: TDataSet; modified: Boolean);
begin
  inherited;
  if modified then begin
     lstCurso.Items.Add(qryCurso.FieldByName('DESCRICAO').Value);
     lstCodCurso.Items.Add(qryCurso.FieldByName('IDCURSO').AsString);
     EdData1Change(Self);
  end;
end;

procedure TfrmSelRelMapaTrein.lstCursoKeyDown(Sender: TObject;
  var Key: Word; Shift: TShiftState);
begin
  inherited;
  if  (Key = vk_Delete) and (lstCurso.Items.Count > 0)  then begin
      SvItem := lstCurso.ItemIndex;
      lstCurso.Items.Delete(SvItem);
      lstCodCurso.Items.Delete(SvItem);
  end;
  EdData1Change(Self);
end;

procedure TfrmSelRelMapaTrein.dblcPacoteCloseUp(Sender: TObject;
  LookupTable, FillTable: TDataSet; modified: Boolean);
begin
  inherited;
  if modified then begin
     lstPacote.Items.Add(qryPacote.FieldByName('DESCRICAO').Value);
     lstCodPacote.Items.Add(qryPacote.FieldByName('IDPACOTE').AsString);
     EdData1Change(Self);
  end;
end;

procedure TfrmSelRelMapaTrein.lstPacoteKeyDown(Sender: TObject;
  var Key: Word; Shift: TShiftState);
begin
  inherited;
  if  (Key = vk_Delete) and (lstPacote.Items.Count > 0)  then begin
      SvItem := lstPacote.ItemIndex;
      lstPacote.Items.Delete(SvItem);
      lstCodPacote.Items.Delete(SvItem);
  end;
  EdData1Change(Self);
end;

procedure TfrmSelRelMapaTrein.rgPacoteClick(Sender: TObject);
begin
  inherited;
  gbxPacote.Visible := (rgPacote.ItemIndex = 0);
  EdData1Change(Self);
end;

procedure TfrmSelRelMapaTrein.rgCursoClick(Sender: TObject);
begin
  inherited;
  gbxCurso.Visible := (rgCurso.ItemIndex = 0);
  EdData1Change(Self);
end;

procedure TfrmSelRelMapaTrein.rbtnVisualizarClick(Sender: TObject);
begin
  inherited;
  FazRes1 := cbxRealProgr.Checked;
  FazRes2 := cbxRealNaoProgr.Checked;
  FazRes3 := cbxNaoRealProgr.Checked;
  FazRes4 := cbxNaoRealNaoProgr.Checked;
  FazRes5 := cbxNada.Checked;
  Imprime := False;

  AbrirForm(RelTreinMapa, TRelTreinMapa, false);
end;

procedure TfrmSelRelMapaTrein.rbtnImprimirClick(Sender: TObject);
begin
  inherited;
  FazRes1 := cbxRealProgr.Checked;
  FazRes2 := cbxRealNaoProgr.Checked;
  FazRes3 := cbxNaoRealProgr.Checked;
  FazRes4 := cbxNaoRealNaoProgr.Checked;
  FazRes5 := cbxNada.Checked;
  Imprime := True;

  AbrirForm(RelTreinMapa, TRelTreinMapa, false);
end;

end.
