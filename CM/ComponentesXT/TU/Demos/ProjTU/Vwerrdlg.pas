unit Vwerrdlg;

interface

uses WinTypes, WinProcs, Classes, Graphics, Forms, Controls, Buttons,
  StdCtrls, Grids, DBGrids, DB, DBTables, ExtCtrls;

type
  TBtnBottomDlg = class(TForm)
    OKBtn: TBitBtn;
    HelpBtn: TBitBtn;
    DataSource1: TDataSource;
    TableErrTable: TTable;
    TableErrTableErrorCode: TSmallintField;
    TableErrTableErrorLevel: TSmallintField;
    TableErrTableErrorMessage: TStringField;
    PanelRed: TPanel;
    DBGridViewErr: TDBGrid;
    procedure FormActivate(Sender: TObject);
    procedure FormDeactivate(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  BtnBottomDlg: TBtnBottomDlg;

implementation

{$R *.DFM}
Uses TUMain;

procedure TBtnBottomDlg.FormActivate(Sender: TObject);
begin
{
  TableErrTable.DatabaseName := TUMain.FormTUMain.TableErrTable.DatabaseName;
  TableErrTable.TableName := TUMain.FormTUMain.TableErrTable.TableName;
}
  TableErrTable.Active := True;

end;

procedure TBtnBottomDlg.FormDeactivate(Sender: TObject);
begin
  TableErrTable.Active := False;
end;

end.
