unit FSelRelTabOc;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  FCMParamRel, MAHlpBtn, StdCtrls, Buttons, ExtCtrls, Db,
  DBTables, Wwquery, wwdblook, TB97, ComCtrls, IvDictio, IvMulti, IvEMulti,
  TB97Tlbr;

type
  TfrmSelRelTabOc = class(TCMParamRel)
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
  frmSelRelTabOc: TfrmSelRelTabOc;

implementation

uses RTabOc;

{$R *.DFM}



procedure TfrmSelRelTabOc.rgSelTudoClick(Sender: TObject);
begin
  inherited;
  gbxOcorr.Visible := (rgSelTudo.ItemIndex = 1);
end;

procedure TfrmSelRelTabOc.dblcOcorrCloseUp(Sender: TObject; LookupTable,
  FillTable: TDataSet; modified: Boolean);
begin
  inherited;
  if modified then
    lstOcorr.Items.Add(qryTabOcorr.FieldByName('DESCRTIPOOCMED').Value);
end;

procedure TfrmSelRelTabOc.lstOcorrKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  inherited;
  if  (Key = vk_Delete) and (lstOcorr.Items.Count > 0)  then
      lstOcorr.Items.Delete(lstOcorr.ItemIndex);
end;

procedure TfrmSelRelTabOc.FormCreate(Sender: TObject);
begin
  inherited;
  qryTabOcorr.Open;
end;

procedure TfrmSelRelTabOc.rbtnVisualizarClick(Sender: TObject);
begin
  inherited;
  relTabOc := TrelTabOc.Create(Self);
  relTabOc.qr.Preview;
  Self.WindowState := wsNormal;
  //relTabOc.Free;
end;

procedure TfrmSelRelTabOc.rbtnImprimirClick(Sender: TObject);
begin
  inherited;
  relTabOc := TrelTabOc.Create(Self);
  relTabOc.qr.Print;
  Self.WindowState := wsNormal;
  //relTabOc.Free;
end;


end.
