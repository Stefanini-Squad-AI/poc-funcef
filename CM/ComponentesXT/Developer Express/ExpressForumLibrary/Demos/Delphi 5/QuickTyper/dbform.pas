unit dbform;

interface

uses
  SysUtils, Windows, Messages, Classes, Graphics, Controls,
  StdCtrls, Forms, DBCtrls, DB, DBTables, Mask, ExtCtrls, Buttons,
  dxfQuickTyp;

type
  TDBForm_ = class(TForm)
    Table1CustNo: TFloatField;
    Table1Company: TStringField;
    Table1Addr1: TStringField;
    Table1Addr2: TStringField;
    Table1City: TStringField;
    Table1State: TStringField;
    Table1Zip: TStringField;
    Table1Country: TStringField;
    Table1Phone: TStringField;
    Table1FAX: TStringField;
    Table1TaxRate: TFloatField;
    Table1Contact: TStringField;
    Table1LastInvoiceDate: TDateTimeField;
    ScrollBox: TScrollBox;
    Label1: TLabel;
    EditCustNo: TDBEdit;
    Label2: TLabel;
    EditCompany: TDBEdit;
    Label3: TLabel;
    EditAddr: TDBEdit;
    Label4: TLabel;
    EditAddr2: TDBEdit;
    Label5: TLabel;
    EditCity: TDBEdit;
    Label6: TLabel;
    EditState: TDBEdit;
    Label7: TLabel;
    EditZip: TDBEdit;
    Label8: TLabel;
    EditCountry: TDBEdit;
    Label9: TLabel;
    EditPhone: TDBEdit;
    Label10: TLabel;
    EditFAX: TDBEdit;
    Label11: TLabel;
    EditTaxRate: TDBEdit;
    Label12: TLabel;
    EditContact: TDBEdit;
    Label13: TLabel;
    EditLastInvoiceDate: TDBEdit;
    DBNavigator: TDBNavigator;
    Panel1: TPanel;
    DataSource1: TDataSource;
    Panel2: TPanel;
    Table1: TTable;
    BitBtn1: TBitBtn;
    Panel4: TPanel;
    Memo2: TMemo;
    CheckBox1: TCheckBox;
    CheckBox2: TCheckBox;
    CheckBox3: TCheckBox;
    CheckBox4: TCheckBox;
    CheckBox5: TCheckBox;
    CheckBox6: TCheckBox;
    dxfDBQuickTyper1: TdxfDBQuickTyper;
    procedure FormCreate(Sender: TObject);
    procedure Table1AfterInsert(DataSet: TDataSet);
    procedure FormShow(Sender: TObject);
    procedure CheckBox1Click(Sender: TObject);
    procedure CheckBox2Click(Sender: TObject);
    procedure CheckBox3Click(Sender: TObject);
    procedure CheckBox4Click(Sender: TObject);
    procedure CheckBox5Click(Sender: TObject);
    procedure CheckBox6Click(Sender: TObject);
  private
    { private declarations }
  public
    { public declarations }
  end;

var
  DBForm_: TDBForm_;

implementation

{$R *.DFM}

procedure TDBForm_.FormCreate(Sender: TObject);
begin
  Table1.Open;
end;

procedure TDBForm_.Table1AfterInsert(DataSet: TDataSet);
begin
  EditCustNo.SetFocus;
end;



procedure TDBForm_.FormShow(Sender: TObject);
begin
  EditCustNo.SetFocus;
end;

procedure TDBForm_.CheckBox1Click(Sender: TObject);
begin
  if(CheckBox1.Checked) then
    dxfDBQuickTyper1.Options := dxfDBQuickTyper1.Options + [qtoReturn]
  else     dxfDBQuickTyper1.Options := dxfDBQuickTyper1.Options - [qtoReturn];
end;

procedure TDBForm_.CheckBox2Click(Sender: TObject);
begin
  if(CheckBox2.Checked) then
    dxfDBQuickTyper1.Options := dxfDBQuickTyper1.Options + [qtoDBMove]
  else     dxfDBQuickTyper1.Options := dxfDBQuickTyper1.Options - [qtoDBMove];
end;

procedure TDBForm_.CheckBox3Click(Sender: TObject);
begin
  if(CheckBox3.Checked) then
    dxfDBQuickTyper1.Options := dxfDBQuickTyper1.Options + [qtoDelete]
  else     dxfDBQuickTyper1.Options := dxfDBQuickTyper1.Options - [qtoDelete];

end;

procedure TDBForm_.CheckBox4Click(Sender: TObject);
begin
  if(CheckBox4.Checked) then
    dxfDBQuickTyper1.Options := dxfDBQuickTyper1.Options + [qtoConfirmDel]
  else     dxfDBQuickTyper1.Options := dxfDBQuickTyper1.Options - [qtoConfirmDel];
end;

procedure TDBForm_.CheckBox5Click(Sender: TObject);
begin
  if(CheckBox5.Checked) then
    dxfDBQuickTyper1.Options := dxfDBQuickTyper1.Options + [qtoInsert]
  else     dxfDBQuickTyper1.Options := dxfDBQuickTyper1.Options - [qtoInsert];
end;

procedure TDBForm_.CheckBox6Click(Sender: TObject);
begin
  if(CheckBox6.Checked) then
    dxfDBQuickTyper1.Options := dxfDBQuickTyper1.Options + [qtoCancel]
  else     dxfDBQuickTyper1.Options := dxfDBQuickTyper1.Options - [qtoCancel];
end;

end.
