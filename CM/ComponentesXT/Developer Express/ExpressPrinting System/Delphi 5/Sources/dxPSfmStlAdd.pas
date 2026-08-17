{*******************************************************************}
{                                                                   }
{       Developer Express Visual Component Library                  }
{       ExpressPrinting System(tm) COMPONENT SUITE                  }
{                                                                   }
{       Copyright (C) 1998-2001 Developer Express Inc.              }
{       ALL RIGHTS RESERVED                                         }
{                                                                   }
{   The entire contents of this file is protected by U.S. and       }
{   International Copyright Laws. Unauthorized reproduction,        }
{   reverse-engineering, and distribution of all or any portion of  }
{   the code contained in this file is strictly prohibited and may  }
{   result in severe civil and criminal penalties and will be       }
{   prosecuted to the maximum extent possible under the law.        }
{                                                                   }
{   RESTRICTIONS                                                    }
{                                                                   }
{   THIS SOURCE CODE AND ALL RESULTING INTERMEDIATE FILES           }
{   (DCU, OBJ, DLL, ETC.) ARE CONFIDENTIAL AND PROPRIETARY TRADE    }
{   SECRETS OF DEVELOPER EXPRESS INC. THE REGISTERED DEVELOPER IS   }
{   LICENSED TO DISTRIBUTE THE EXPRESSPRINTINGSYSTEM AND            }
{   ALL ACCOMPANYING VCL CONTROLS AS PART OF AN                     }
{   EXECUTABLE PROGRAM ONLY.                                        }
{                                                                   }
{   THE SOURCE CODE CONTAINED WITHIN THIS FILE AND ALL RELATED      }
{   FILES OR ANY PORTION OF ITS CONTENTS SHALL AT NO TIME BE        }
{   COPIED, TRANSFERRED, SOLD, DISTRIBUTED, OR OTHERWISE MADE       }
{   AVAILABLE TO OTHER INDIVIDUALS WITHOUT EXPRESS WRITTEN CONSENT  }
{   AND PERMISSION FROM DEVELOPER EXPRESS INC.                      }
{                                                                   }
{   CONSULT THE END USER LICENSE AGREEMENT FOR INFORMATION ON       }
{   ADDITIONAL RESTRICTIONS.                                        }
{                                                                   }
{*******************************************************************}

unit dxPSfmStlAdd;

interface

{$I dxPSVer.inc}

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  StdCtrls, dxPSForm, dxPgsDlg;

type
  TdxfmSelectStyleClass = class(TCustomdxPSForm)
    GroupBox1: TGroupBox;
    btnOK: TButton;
    btnCancel: TButton;
    btnHelp: TButton;
    Label1: TLabel;
    cbxStyleTypes: TComboBox;
    procedure Label1Click(Sender: TObject);
    procedure cbxStyleTypesChange(Sender: TObject);
  private
    FStyleClass: TdxPrintStyleClass;
    procedure FillList;
  public
    constructor Create(AOwner: TComponent); override;
    function Execute: Boolean;

    property StyleClass: TdxPrintStyleClass read FStyleClass;
  end;

function dxSelectStyleClass(Pt: PPoint): TdxPrintStyleClass;

implementation

{$R *.DFM}

uses
  dxPSGlbl;

function dxSelectStyleClass(Pt: PPoint): TdxPrintStyleClass;
begin
  with TdxfmSelectStyleClass.Create(nil) do
  try
    if Pt <> nil then
    begin
      Left := Pt^.X;
      Top := Pt^.Y;
    end
    else
      Position := poScreenCenter;
    if Execute then
      Result := StyleClass
    else
      Result := nil;
  finally
    Free;
  end;
end;


{ TdxfmAddNewPrintStyle }

constructor TdxfmSelectStyleClass.Create(AOwner: TComponent);
begin
  inherited Create(AOwner);
  HelpContext := dxPSGlbl.dxhcAddStyleDlg;
  btnHelp.Visible := (HelpContext <> 0);
  if not btnHelp.Visible then
  begin
    btnOK.BoundsRect := btnCancel.BoundsRect;
    btnCancel.BoundsRect := btnHelp.BoundsRect;
  end;
  FStyleClass := nil;
  FillList;
end;

procedure TdxfmSelectStyleClass.FillList;
var
  SaveCursor: TCursor;
begin
  SaveCursor := Screen.Cursor;
  Screen.Cursor := crHourGlass;
  try
    with cbxStyleTypes do
    begin
      Items.BeginUpdate;
      try
        Items.Clear;
        dxPSGetRegisteredPrintStylesList(cbxStyleTypes.Items)
      finally
        Items.EndUpdate;
      end;
      if Items.Count > 0 then
      begin
        ItemIndex := 0;
        cbxStyleTypesChange(nil);
      end;
    end;
  finally
    Screen.Cursor := SaveCursor;
  end;
end;

function TdxfmSelectStyleClass.Execute: Boolean;
begin
  Result := ShowModal = mrOK;
end;

procedure TdxfmSelectStyleClass.Label1Click(Sender: TObject);
begin
  ActiveControl := TLabel(Sender).FocusControl;
  if TComboBox(ActiveControl).Style = csDropDownList then
    TComboBox(ActiveControl).DroppedDown := True;
end;

procedure TdxfmSelectStyleClass.cbxStyleTypesChange(Sender: TObject);
begin
  with cbxStyleTypes do
    FStyleClass := PdxPrintStyleRegItem(Items.Objects[ItemIndex])^.PrintStyleClass;
end;

end.

