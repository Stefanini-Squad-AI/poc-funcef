unit FSelRelProg2;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  FCMParamRel, MAHlpBtn, StdCtrls, Buttons, ExtCtrls,
  TB97, ComCtrls, wwdblook, Db, DBTables, Wwquery, IvDictio, IvMulti,
  IvEMulti, TB97Tlbr, wwdbdatetimepicker, CMDateTimePicker;

type
  TfrmSelRelProg2 = class(TCMParamRel)
    TabSheet1: TTabSheet;
    rgPrograma: TRadioGroup;
    gbxFaixaData: TGroupBox;
    Label1: TLabel;
    edData1: TCMDateTimePicker;
    edData2: TCMDateTimePicker;
    qryOcorr: TwwQuery;
    rgSelTudo: TRadioGroup;
    gbxOcorr: TGroupBox;
    dblcOcorr: TwwDBLookupCombo;
    lstOcorr: TListBox;
    lstCodOcorr: TListBox;
    rgSelPeriodo: TRadioGroup;
    procedure FormCreate(Sender: TObject);
    procedure edData1Change(Sender: TObject);
    procedure rbtnVisualizarClick(Sender: TObject);
    procedure rbtnImprimirClick(Sender: TObject);
    procedure rgSelTudoClick(Sender: TObject);
    procedure dblcOcorrCloseUp(Sender: TObject; LookupTable,
      FillTable: TDataSet; modified: Boolean);
    procedure lstOcorrKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure rgSelPeriodoClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmSelRelProg2: TfrmSelRelProg2;
  SvItem : Integer;  

implementation

uses RProgPess, FTelaAut, RProgTipo;

//uses RProgPess, FTelaAut, RProgTipo;

{$R *.DFM}


procedure TfrmSelRelProg2.FormCreate(Sender: TObject);
begin
  inherited;
  qryOcorr.Open;
  EdData1.Date := (Date);
  EdData2.Date := (Date + 30);
end;

procedure TfrmSelRelProg2.edData1Change(Sender: TObject);
begin
  inherited;
  rbtnVisualizar.Enabled := False;
  rbtnImprimir.Enabled := False;
  if (EdData1.Text <> '') and  (EdData2.Text <> '')  and
     (EdData1.Date <= EdData2.Date) then begin
      rbtnVisualizar.Enabled := True;
      rbtnImprimir.Enabled := True;
  end;
end;

procedure TfrmSelRelProg2.rbtnVisualizarClick(Sender: TObject);
begin
  inherited;
  relProgTipo := TrelProgTipo.Create(Self);
  relProgTipo.qr.Preview;
  Self.WindowState := wsNormal;
  //relProgPess.Free;
end;

procedure TfrmSelRelProg2.rbtnImprimirClick(Sender: TObject);
begin
  inherited;
  relProgTipo := TrelProgTipo.Create(Self);
  relProgTipo.qr.Print;
  Self.WindowState := wsNormal;
  //relProgPess.Free;
end;






procedure TfrmSelRelProg2.rgSelTudoClick(Sender: TObject);
begin
  inherited;
  gbxOcorr.Visible := (rgSelTudo.ItemIndex = 1);
end;

procedure TfrmSelRelProg2.dblcOcorrCloseUp(Sender: TObject; LookupTable,
  FillTable: TDataSet; modified: Boolean);
begin
  inherited;
  if modified then begin
     lstOcorr.Items.Add(qryOcorr.FieldByName('DESCRTIPOOCMED').Value);
     lstCodOcorr.Items.Add(qryOcorr.FieldByName('CODTIPOOCMED').AsString);
  end;
end;

procedure TfrmSelRelProg2.lstOcorrKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  inherited;
  if  (Key = vk_Delete) and (lstOcorr.Items.Count > 0)  then begin
      SvItem := lstOcorr.ItemIndex;
      lstOcorr.Items.Delete(SvItem);
      lstCodOcorr.Items.Delete(SvItem);
  end;
end;

procedure TfrmSelRelProg2.rgSelPeriodoClick(Sender: TObject);
begin
  inherited;
  gbxFaixaData.Visible := (rgSelPeriodo.ItemIndex = 0);
  rbtnVisualizar.Enabled := (rgSelPeriodo.ItemIndex = 1) or
     ((EdData1.Text <> '') and  (EdData2.Text <> '')  and
      (EdData1.Date <= EdData2.Date));
  rbtnImprimir.Enabled := rbtnVisualizar.Enabled;
end;

end.
