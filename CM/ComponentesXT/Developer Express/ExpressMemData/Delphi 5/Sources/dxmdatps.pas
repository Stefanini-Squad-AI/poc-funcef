{*******************************************************************}
{                                                                   }
{       Developer Express Visual Component Library                  }
{       ExpressMemData - CLX/VCL Edition                            }
{                                                                   }
{       Copyright (c) 1998-2001 Developer Express Inc.              }
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
{   (DCU, OBJ, DLL, DPU, SO, ETC.) ARE CONFIDENTIAL AND PROPRIETARY }
{   TRADE SECRETS OF DEVELOPER EXPRESS INC. THE REGISTERED DEVELOPER}
{   IS LICENSED TO DISTRIBUTE THE EXPRESSMEMDATA                    }
{   AS PART OF AN EXECUTABLE PROGRAM ONLY.                          }
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

unit dxmdatps;

interface

{$I dxmdver.inc}

uses
{$IFNDEF LINUX}
  Windows, Classes, Controls, Forms, StdCtrls, dxmdaset, ExtCtrls, Menus, 
  {$IFDEF DELPHI6}DesignIntf{$ELSE}DsgnIntf{$ENDIF}, DB, DBGrids, Dialogs;
{$ELSE}
  Classes, Controls, QForms, dxmdaset, DesignIntf, QExtCtrls, QStdCtrls,
  QControls, QMenus, QTypes, Types, QDialogs, QDBGrids, DB;
{$ENDIF}

type
  TfrmdxMemDataPersistent = class(TForm)
    pnlBottom: TPanel;
    pnlBottomRight: TPanel;
    btnLoad: TButton;
    btnSave: TButton;
    btnOK: TButton;
    btnCancel: TButton;
    OpenDialog: TOpenDialog;
    SaveDialog: TSaveDialog;
    procedure FormCreate(Sender: TObject);
    procedure btnLoadClick(Sender: TObject);
    procedure btnSaveClick(Sender: TObject);
  private
    FMemData: TdxMemData;
    FDataSource: TDataSource;
    FDBGrid: TDBGrid;
  public
    procedure SetMemData(AMemData: TdxMemData);
  end;

procedure ShowMemDataPersistentDesigner(AMemData: TdxMemData);

implementation

{$R *.dfm}
procedure ShowMemDataPersistentDesigner(AMemData: TdxMemData);
var
  AForm: TfrmdxMemDataPersistent;
begin
  AForm := TfrmdxMemDataPersistent.Create(nil);
  try
    AForm.SetMemData(AMemData);
    AForm.ShowModal;
    if (AForm.ModalResult = mrOK) then
    begin
      AForm.FMemData.Persistent.SaveData;
      AMemData.Persistent.Assign(AForm.FMemData.Persistent);
    end;
  finally
    AForm.Free;
  end;
end;

procedure TfrmdxMemDataPersistent.SetMemData(AMemData: TdxMemData);
begin
  FMemData.CreateFieldsFromDataSet(AMemData);
  FMemData.Persistent.Assign(AMemData.Persistent);
  FMemData.Persistent.LoadData;
  if not FMemData.Active then
    FMemData.Open; 
end;

procedure TfrmdxMemDataPersistent.FormCreate(Sender: TObject);
begin
  FMemData := TdxMemData.Create(self);
  FDataSource := TDataSource.Create(self);
  FDataSource.DataSet := FMemData;
  FDBGrid := TDBGrid.Create(self);
  FDBGrid.Parent := self;
  FDBGrid.Align := alClient;
  FDBGrid.DataSource := FDataSource;
end;

procedure TfrmdxMemDataPersistent.btnLoadClick(Sender: TObject);
begin
  if OpenDialog.Execute then
    try
      FMemData.LoadFromBinaryFile(OpenDialog.FileName);
    except
    end;
end;

procedure TfrmdxMemDataPersistent.btnSaveClick(Sender: TObject);
begin
  if SaveDialog.Execute then
    try
      FMemData.SaveToBinaryFile(SaveDialog.FileName);
    except
    end;
end;

end.
