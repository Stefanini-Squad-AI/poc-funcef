//*******************************************************************//
//                                                                   //
//       Developer Express Visual Component Library                  //
//       ExpressGrid MemData Demo                                    //
//                                                                   //
//       Copyright (c) 1998 Developer Express Inc.                   //
//       ALL RIGHTS RESERVED                                         //
//*******************************************************************//

unit stdbctrl;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  DBCtrls, Grids, DBGrids, ExtCtrls, StdCtrls, Db, dxmdaset, Mask;

type
  TForm2 = class(TForm)
    Panel1: TPanel;
    DBGrid1: TDBGrid;
    DBNavigator: TDBNavigator;
    lbFirstName: TLabel;
    dbFirstName: TDBEdit;
    lbLastName: TLabel;
    dbLastName: TDBEdit;
    lbCompany: TLabel;
    dbCompany: TDBEdit;
    lbPrefix: TLabel;
    dbPrefix: TDBEdit;
    lbTitile: TLabel;
    dbTitle: TDBEdit;
    lbAddress: TLabel;
    dbAddress: TDBEdit;
    lbCity: TLabel;
    dbCity: TDBEdit;
    lbState: TLabel;
    dbState: TDBEdit;
    lbZipCode: TLabel;
    dbZipCode: TDBEdit;
    lbSource: TLabel;
    dbSource: TDBEdit;
    lbCustomer: TLabel;
    lbPurchaseDate: TLabel;
    dbPurchaseDate: TDBEdit;
    lbHomePhone: TLabel;
    dbPhone: TDBEdit;
    lbFaxPhone: TLabel;
    dbFaxPhone: TDBEdit;
    lbPaymentType: TLabel;
    DBMemo1: TDBMemo;
    dbCustomer: TDBCheckBox;
    lbProductType: TLabel;
    dbProductName: TDBLookupComboBox;
    dbPaymentType: TDBComboBox;
    procedure DBGrid1DrawDataCell(Sender: TObject; const Rect: TRect;
      Field: TField; State: TGridDrawState);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  Form2: TForm2;

implementation

uses Main;

{$R *.DFM}

procedure TForm2.DBGrid1DrawDataCell(Sender: TObject; const Rect: TRect;
  Field: TField; State: TGridDrawState);
begin
  //Make the Delete menu item enabled if the user selects the records
  Form1.Delete1.Enabled := DBGrid1.SelectedRows.Count > 0;
end;

end.
