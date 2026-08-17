unit FSelRelTabPer;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  FCMParamRel, MAHlpBtn, StdCtrls, Buttons, ExtCtrls, Db,
  DBTables, Wwquery, wwdblook, TB97, ComCtrls, IvDictio, IvMulti, IvEMulti,
  TB97Tlbr;

type
  TfrmSelRelTabPer = class(TCMParamRel)
    qryTabOcorr: TwwQuery;
    TabSheet1: TTabSheet;
    rgSelTudo: TRadioGroup;
    gbxOcorr: TGroupBox;
    dblcOcorr: TwwDBLookupCombo;
    lstOcorr: TListBox;
    procedure rgSelTudoClick(Sender: TObject);
    procedure dblcOcorrCloseUp(Sender: TObject; LookupTable,
      FillTable: TDataSet; modified: Boolean);
    procedure lstOcorrKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure FormCreate(Sender: TObject);
    procedure rbtnVisualizarClick(Sender: TObject);
    procedure rbtnImprimirClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmSelRelTabPer: TfrmSelRelTabPer;

implementation

uses RTabPer;

{$R *.DFM}


procedure TfrmSelRelTabPer.rgSelTudoClick(Sender: TObject);
begin
  inherited;
  gbxOcorr.Visible := (rgSelTudo.ItemIndex = 1);
end;

procedure TfrmSelRelTabPer.dblcOcorrCloseUp(Sender: TObject; LookupTable,
  FillTable: TDataSet; modified: Boolean);
begin
  inherited;
  if modified then
    lstOcorr.Items.Add(qryTabOcorr.FieldByName('DESCRTIPOOCMED').Value);
end;

procedure TfrmSelRelTabPer.lstOcorrKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  inherited;
  if  (Key = vk_Delete) and (lstOcorr.Items.Count > 0)  then
      lstOcorr.Items.Delete(lstOcorr.ItemIndex);
end;


procedure TfrmSelRelTabPer.FormCreate(Sender: TObject);
begin
  inherited;
  qryTabOcorr.Open;
end;

procedure TfrmSelRelTabPer.rbtnVisualizarClick(Sender: TObject);
begin
  inherited;
  relTabPer := TrelTabPer.Create(Self);
  relTabPer.qr.Preview;
  Self.WindowState := wsNormal;
  //relTabPer.Free;
end;

procedure TfrmSelRelTabPer.rbtnImprimirClick(Sender: TObject);
begin
  inherited;
  relTabPer := TrelTabPer.Create(Self);
  relTabPer.qr.Print;
  Self.WindowState := wsNormal;
  //relTabPer.Free;
end;


end.
