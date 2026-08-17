unit Errtbdlg;

interface

uses WinTypes, WinProcs, Classes, Graphics, Forms, Controls, Buttons,
  StdCtrls, Grids, DBGrids, DB, DBTables, ExtCtrls;

type
  TBtnBottomDlg = class(TForm)
    OKBtn: TBitBtn;
    HelpBtn: TBitBtn;
    DataSource1: TDataSource;
    TableErrTable: TTable;
    PanelRed: TPanel;
    DBGridViewErr: TDBGrid;
    procedure FormActivate(Sender: TObject);
    procedure FormDeactivate(Sender: TObject);
    procedure FormCreate(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  BtnBottomDlg: TBtnBottomDlg;

implementation

{$R *.DFM}
procedure TBtnBottomDlg.FormActivate(Sender: TObject);
begin
  TableErrTable.Active := False;
  TableErrTable.DatabaseName := Session.PrivateDir;
  TableErrTable.Active := True;
end;

procedure TBtnBottomDlg.FormDeactivate(Sender: TObject);
begin
  TableErrTable.Active := False;
end;

procedure TBtnBottomDlg.FormCreate(Sender: TObject);
begin
  TableErrTable.DatabaseName := Session.PrivateDir;
end;

end.
