unit fPrincipal;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  ComCtrls, Db, DBTables, Provider, DBClient, ExtCtrls, Grids, DBGrids,
  StdCtrls;

type
  TForm1 = class(TForm)
    PageControl1: TPageControl;
    TabSheet1: TTabSheet;
    TabSheet2: TTabSheet;
    TabSheet3: TTabSheet;
    Label1: TLabel;
    Label2: TLabel;
    Label3: TLabel;
    EdtUsuario: TEdit;
    EdtSenha: TEdit;
    EdtAlias: TEdit;
    Button1: TButton;
    Label4: TLabel;
    Memo1: TMemo;
    Label5: TLabel;
    DBGrid1: TDBGrid;
    Panel1: TPanel;
    Button2: TButton;
    Button3: TButton;
    Label6: TLabel;
    DBGrid2: TDBGrid;
    Panel2: TPanel;
    Button4: TButton;
    Button5: TButton;
    DataSource1: TDataSource;
    DataSource2: TDataSource;
    ClientDataSet1: TClientDataSet;
    ClientDataSet2: TClientDataSet;
    DataSetProvider1: TDataSetProvider;
    Query1: TQuery;
    Database1: TDatabase;
    OpenDialog1: TOpenDialog;
    SaveDialog1: TSaveDialog;
    procedure Button1Click(Sender: TObject);
    procedure Button3Click(Sender: TObject);
    procedure Button2Click(Sender: TObject);
    procedure Button5Click(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  Form1: TForm1;

implementation

{$R *.DFM}

procedure TForm1.Button1Click(Sender: TObject);
begin
  If Database1.Connected Then Database1.close;
  Database1.Params.Values['USER NAME'] := EdtUsuario.Text;
  Database1.Params.Values['SERVER NAME'] := EdtAlias.Text;
  Database1.Params.Values['PASSWORD'] := EdtSenha.Text;
  Database1.Open;
end;

procedure TForm1.Button3Click(Sender: TObject);
begin
  If Query1.Active Then Query1.Close;
  Query1.Sql.Text := Memo1.Lines.Text;
  If ClientDataSet1.Active Then ClientDataSet1.Close;
  ClientDataSet1.Open;
end;

procedure TForm1.Button2Click(Sender: TObject);
begin
  If SaveDialog1.Execute Then
     ClientDataSet1.SaveToFile(SaveDialog1.FileName);
end;

procedure TForm1.Button5Click(Sender: TObject);
begin
  If OpenDialog1.Execute Then
     ClientDataSet2.LoadFromFile(OpenDialog1.FileName);
end;

end.
