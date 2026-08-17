unit FSelRelPesq;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  FCMParamRel, MAHlpBtn, StdCtrls, Buttons, ExtCtrls, wwdblook,
  Db, DBTables, Wwquery, Wwdatsrc, TB97, ComCtrls, TB97Tlbr, IvDictio,
  IvMulti, IvEMulti;

type                 
  TfrmSelRelPesq = class(TCMParamRel)
    qryPesqui: TwwQuery;
    qryEntid: TwwQuery;
    ds: TwwDataSource;
    TabSheet1: TTabSheet;
    dblcPesq: TwwDBLookupCombo;
    rgTipoTab: TRadioGroup;
    rgExclui: TRadioGroup;
    dblcEntid: TwwDBLookupCombo;
    procedure FormCreate(Sender: TObject);
    procedure rgTipoTabClick(Sender: TObject);
    procedure rgExcluiClick(Sender: TObject);
    procedure dblcPesqCloseUp(Sender: TObject; LookupTable,
      FillTable: TDataSet; modified: Boolean);
    procedure rbtnVisualizarClick(Sender: TObject);
    procedure rbtnImprimirClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmSelRelPesq: TfrmSelRelPesq;

implementation

uses rPesqCargo, rPesqEntid;

{$R *.DFM}

procedure TfrmSelRelPesq.FormCreate(Sender: TObject);
begin
  inherited;
  qryEntid.Prepare;
  qryPesqui.Open;
  dblcPesq.Text := qryPesqui.FieldByName('NOMEPESQSALAR').asString;
end;

procedure TfrmSelRelPesq.rgTipoTabClick(Sender: TObject);
begin
  inherited;
  rgExclui.Visible  := (rgTipoTab.ItemIndex = 0);
  dblcEntid.Visible := (rgTipoTab.ItemIndex = 0) and (rgExclui.ItemIndex = 1);
end;

procedure TfrmSelRelPesq.rgExcluiClick(Sender: TObject);
begin
  inherited;
  dblcEntid.Visible := (rgExclui.ItemIndex = 1);
  if (rgExclui.ItemIndex = 1) then
  begin
    qryEntid.Close;
    qryEntid.ParamByName('PESQUISA').asInteger := qryPesqui.FieldByName('IDPESQSALAR').asInteger;
    qryEntid.Open;
  end;
end;

procedure TfrmSelRelPesq.dblcPesqCloseUp(Sender: TObject; LookupTable,
  FillTable: TDataSet; modified: Boolean);
begin
  inherited;
  rbtnVisualizar.Enabled := (dblcPesq.Text <> '');
  rbtnImprimir.Enabled   := (dblcPesq.Text <> '');
end;

procedure TfrmSelRelPesq.rbtnVisualizarClick(Sender: TObject);
begin
  inherited;
  if (rgTipoTab.ItemIndex = 0) then
  begin
    relPesqCargo := TrelPesqCargo.Create(Self);
    relPesqCargo.qr.Preview;
    //relPesqCargo.Free;
  end
  else
  begin
    relPesqEntid := TrelPesqEntid.Create(Self);
    relPesqEntid.qr.Preview;
    //relPesqEntid.Free;
  end;
  Self.WindowState := wsNormal;
end;

procedure TfrmSelRelPesq.rbtnImprimirClick(Sender: TObject);
begin
  inherited;
  if (rgTipoTab.ItemIndex = 0) then
  begin
    relPesqCargo := TrelPesqCargo.Create(Self);
    relPesqCargo.qr.Print;
    //relPesqCargo.Free;
  end
  else
  begin
    relPesqEntid := TrelPesqEntid.Create(Self);
    relPesqEntid.qr.Print;
    //relPesqEntid.Free;
  end;
  Self.WindowState := wsNormal;
end;

end.
