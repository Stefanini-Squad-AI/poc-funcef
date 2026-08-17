unit FSelRelOcor2;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  FCMParamRel, MAHlpBtn, StdCtrls, Buttons, ExtCtrls,
  TB97, ComCtrls, wwdblook, Db, DBTables, Wwquery, IvDictio, IvMulti,
  IvEMulti, TB97Tlbr, wwdbdatetimepicker, CMDateTimePicker;

type
  TfrmSelRelOcor2 = class(TCMParamRel)
    TabSheet1: TTabSheet;
    gbxFaixaData: TGroupBox;
    Label1: TLabel;
    edData1: TCMDateTimePicker;
    edData2: TCMDateTimePicker;
    rgTipoRel: TRadioGroup;
    gbxOcorr: TGroupBox;
    dblcOcorr: TwwDBLookupCombo;
    lstOcorr: TListBox;
    rgSelTudo: TRadioGroup;
    lstCodOcorr: TListBox;
    qryOcorr: TwwQuery;
    procedure FormCreate(Sender: TObject);
    procedure edData1Change(Sender: TObject);
    procedure rbtnVisualizarClick(Sender: TObject);
    procedure rbtnImprimirClick(Sender: TObject);
    procedure rgSelTudoClick(Sender: TObject);
    procedure dblcOcorrCloseUp(Sender: TObject; LookupTable,
      FillTable: TDataSet; modified: Boolean);
    procedure lstOcorrKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmSelRelOcor2: TfrmSelRelOcor2;
  SvItem : Integer;

implementation

uses FTelaAut, ROcorrTipo;

{$R *.DFM}


procedure TfrmSelRelOcor2.FormCreate(Sender: TObject);
begin
  inherited;
  qryOcorr.Open;  
  EdData1.Date := (Date-365);
  EdData2.Date := (Date);
end;

procedure TfrmSelRelOcor2.edData1Change(Sender: TObject);
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

procedure TfrmSelRelOcor2.rbtnVisualizarClick(Sender: TObject);
begin
  inherited;
  relOcorrTipo := TrelOcorrTipo.Create(Self);
  relOcorrTipo.qr.Preview;
  Self.WindowState := wsNormal;
  //relOcorrTipo.Free;
end;

procedure TfrmSelRelOcor2.rbtnImprimirClick(Sender: TObject);
begin
  inherited;
  relOcorrTipo := TrelOcorrTipo.Create(Self);
  relOcorrTipo.qr.Print;
  Self.WindowState := wsNormal;
  //relOcorrTipo.Free;
end;



procedure TfrmSelRelOcor2.rgSelTudoClick(Sender: TObject);
begin
  inherited;
  gbxOcorr.Visible := (rgSelTudo.ItemIndex = 1);
end;

procedure TfrmSelRelOcor2.dblcOcorrCloseUp(Sender: TObject; LookupTable,
  FillTable: TDataSet; modified: Boolean);
begin
  inherited;
  if modified then begin
     lstOcorr.Items.Add(qryOcorr.FieldByName('DESCRTIPOOCMED').Value);
     lstCodOcorr.Items.Add(qryOcorr.FieldByName('CODTIPOOCMED').AsString);
  end;
end;

procedure TfrmSelRelOcor2.lstOcorrKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  inherited;
  if  (Key = vk_Delete) and (lstOcorr.Items.Count > 0)  then begin
      SvItem := lstOcorr.ItemIndex;
      lstOcorr.Items.Delete(SvItem);
      lstCodOcorr.Items.Delete(SvItem);
  end;
end;



end.
