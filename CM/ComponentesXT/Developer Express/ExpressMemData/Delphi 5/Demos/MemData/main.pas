//*******************************************************************//
//                                                                   //
//       Developer Express Visual Component Library                  //
//       ExpressGrid MemData Demo                                    //
//                                                                   //
//       Copyright (c) 1998 Developer Express Inc.                   //
//       ALL RIGHTS RESERVED                                         //
//*******************************************************************//

unit main;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  StdCtrls, ExtCtrls, Db, dxmdaset, Menus, ShellAPI;

type
  TForm1 = class(TForm)
    DataSource1: TDataSource;
    dxMemContacts: TdxMemData;
    dxMemContactsID: TAutoIncField;
    dxMemContactsProductID: TIntegerField;
    dxMemContactsFirstName: TStringField;
    dxMemContactsLastName: TStringField;
    dxMemContactsCompany: TStringField;
    dxMemContactsProductName: TStringField;
    dxMemContactsPrefix: TStringField;
    dxMemContactsTitle: TStringField;
    dxMemContactsAddress: TStringField;
    dxMemContactsCity: TStringField;
    dxMemContactsState: TStringField;
    dxMemContactsZipCode: TStringField;
    dxMemContactsCustomer: TStringField;
    dxMemContactsSource: TStringField;
    dxMemContactsPurchasedate: TDateField;
    dxMemContactsHomePhone: TStringField;
    dxMemContactsFaxPhone: TStringField;
    dxMemContactsPaymentType: TStringField;
    dxMemContactsSpouse: TStringField;
    dxMemContactsOccupation: TStringField;
    dxMemContactsPaymentAmount: TFloatField;
    dxMemProducts: TdxMemData;
    dxMemProductsID: TIntegerField;
    dxMemProductsNAME: TStringField;
    Panel1: TPanel;
    ClientPanel: TPanel;
    MainMenu1: TMainMenu;
    File1: TMenuItem;
    View1: TMenuItem;
    Help1: TMenuItem;
    Close1: TMenuItem;
    Add1: TMenuItem;
    Save1: TMenuItem;
    Delete1: TMenuItem;
    N1: TMenuItem;
    MemDataInfo1: TMenuItem;
    StandardDataControls1: TMenuItem;
    DeveloperExpressontheWeb1: TMenuItem;
    procedure DataSource1DataChange(Sender: TObject; Field: TField);
    procedure FormShow(Sender: TObject);
    procedure FormDestroy(Sender: TObject);
    procedure Add1Click(Sender: TObject);
    procedure Save1Click(Sender: TObject);
    procedure Delete1Click(Sender: TObject);
    procedure MemDataInfo1Click(Sender: TObject);
    procedure StandardDataControls1Click(Sender: TObject);
    procedure Close1Click(Sender: TObject);
    procedure DeveloperExpressontheWeb1Click(Sender: TObject);
    procedure dxMemContactsAfterInsert(DataSet: TDataSet);
  private
    FCurrForm : TForm;
    procedure SetCurrForm(AForm : TForm);
  public
    { Public declarations }
  end;

var
  Form1: TForm1;

implementation

uses stdbctrl, tellmore;

{$R *.DFM}

//Set the selected form as a child of the client panel control
procedure TForm1.SetCurrForm(AForm : TForm);
begin
  //If user select the same form then exit
  if(FCurrForm = AForm) then exit;
  //Freez the drawing to avoid the flickes
  SendMessage(ClientPanel.Handle, WM_SETREDRAW, Integer(False), 0);
  //Close the previous form
  if(FCurrForm <> nil) then
    FCurrForm.Close;
  FCurrForm := AForm;
  //Updated menu items
  Save1.Enabled := (FCurrForm <> Form4) and (dxMemContacts.State in [dsInsert, dsEdit]);
  Add1.Enabled := FCurrForm <> Form4;
  Delete1.Enabled := FCurrForm <> Form4;
  //Place the new form on the panel
  if(FCurrForm <> nil) then begin
    FCurrForm.Align := alClient;
    FCurrForm.Parent := ClientPanel;
    FCurrForm.Show;
    FCurrForm.Close;
  end;
  //Update the client panel
  SendMessage(ClientPanel.Handle, WM_SETREDRAW, Integer(True), 0);
  //redraw the form
  if(FCurrForm <> nil) then
    FCurrForm.Show;
end;

procedure TForm1.DataSource1DataChange(Sender: TObject; Field: TField);
begin
  //Make the Save menu item enabled if the user begin to edit data
  Save1.Enabled := dxMemContacts.State in [dsInsert, dsEdit];
end;

procedure TForm1.FormShow(Sender: TObject);
begin
  //Load the data from the text tabbed file
  dxMemProducts.LoadFromBinaryFile(ExtractFileDir(Application.ExeName) + '\products.dat');
  dxMemContacts.LoadFromBinaryFile(ExtractFileDir(Application.ExeName) + '\contacts.dat');
  SetCurrForm(Form4);
end;

procedure TForm1.FormDestroy(Sender: TObject);
begin
  //save the data to the text tabbed file
  dxMemContacts.SaveToBinaryFile(ExtractFileDir(Application.ExeName) + '\contacts.dat');
end;

procedure TForm1.Add1Click(Sender: TObject);
begin
  //Insert the record
  dxMemContacts.Append;
end;

procedure TForm1.Save1Click(Sender: TObject);
begin
  //Post the record
  if (dxMemContacts.State in [dsInsert, dsEdit]) then
    dxMemContacts.Post;
end;

procedure TForm1.Delete1Click(Sender: TObject);
begin
  //User has pressed the Delete menu item.
  //Ask the question and if the Yes would choose. Delete the selected records.
  if(MessageDlg('You are about to delete the selected records. Do you want to proceed?',
        mtConfirmation, [mbYes, mbNo, mbCancel], 0) = mrYes) then
    Form2.DBGrid1.SelectedRows.Delete;
end;

procedure TForm1.MemDataInfo1Click(Sender: TObject);
begin
  SetCurrForm(Form4);
  MemDataInfo1.Checked := True;
end;

procedure TForm1.StandardDataControls1Click(Sender: TObject);
begin
  SetCurrForm(Form2);
  StandardDataControls1.Checked := True;
end;

procedure TForm1.Close1Click(Sender: TObject);
begin
  Close;
end;

procedure TForm1.DeveloperExpressontheWeb1Click(Sender: TObject);
begin
  //Go to Developer Express web site
  ShellExecute(Handle, PChar('OPEN'), PChar('http://www.devexpress.com'), Nil, Nil, SW_SHOWMAXIMIZED);
end;

procedure TForm1.dxMemContactsAfterInsert(DataSet: TDataSet);
begin
  DataSet.FindField('id').AsInteger := DataSet.FindField('recid').AsInteger;
end;

end.
