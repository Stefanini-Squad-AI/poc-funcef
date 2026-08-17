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

unit dxmdseda;

interface
{$I dxmdver.inc}
uses
{$IFNDEF LINUX}
  Windows, Classes, Controls, Forms, StdCtrls, DB, dxmdaset, ExtCtrls,
    {$IFDEF DELPHI6}DesignIntf{$ELSE}DsgnIntf{$ENDIF};
  {$ELSE}
  Classes, Controls, QForms, DB, dxmdaset, DesignIntf, QExtCtrls, QStdCtrls,
  QControls;
{$ENDIF}

type
  {$IFDEF LINUX}
  IFormDesigner = IDesigner;
  {$ENDIF}
  {$IFDEF DELPHI6}
  IFormDesigner = IDesigner;
  {$ENDIF}
  TfrmdxMemDataAddField = class(TForm)
    bOk: TButton;
    bCancel: TButton;
    gbFieldProp: TGroupBox;
    lbName: TLabel;
    edName: TEdit;
    cbFieldType: TComboBox;
    lbType: TLabel;
    lbComponent: TLabel;
    edComponent: TEdit;
    lbSize: TLabel;
    edSize: TEdit;
    gbFieldtype: TRadioGroup;
    gbLookup: TGroupBox;
    lbKeyFields: TLabel;
    lbLookupFields: TLabel;
    Label1: TLabel;
    Label2: TLabel;
    cbLookupField: TComboBox;
    cbKeyField: TComboBox;
    cbDataSet: TComboBox;
    cbResultField: TComboBox;
    procedure cbFieldTypeChange(Sender: TObject);
    procedure gbFieldtypeClick(Sender: TObject);
    procedure edNameChange(Sender: TObject);
    procedure edSizeKeyPress(Sender: TObject; var Key: Char);
    procedure edComponentChange(Sender: TObject);
    procedure cbDataSetExit(Sender: TObject);
  private
    Data: TdxMemData;
    LookupDS: TDataSet;
    FormDesigner: {$IFDEF DELPHI4}IFormDesigner{$ELSE}TFormDesigner{$ENDIF};
  end;

function GetMemDataNewFieldType(Data: TdxMemData; X, Y: Integer; FormDesigner: {$IFDEF DELPHI4}IFormDesigner{$ELSE}TFormDesigner{$ENDIF}): TField;

implementation

uses SysUtils, TypInfo, Consts {$IFDEF DELPHI6},RTLConsts{$ENDIF};

{$R *.dfm}
type
  TDummyField = class(TField)
  published
    property DataType;
  end;

function GetMemDataNewFieldType(Data: TdxMemData; X, Y: Integer; FormDesigner: {$IFDEF DELPHI4}IFormDesigner{$ELSE}TFormDesigner{$ENDIF}): TField;
var
  AForm: TfrmdxMemDataAddField;
  TypeInfo: PPropInfo;
  i: TFieldType;
  j: Integer;

  procedure GetDataSets(AComponent: TComponent; Strings: TStrings);
  var
    i: Integer;
  begin
    if AComponent <> nil then
      for i := 0 to AComponent.ComponentCount - 1 do
        if (AComponent.Components[i] is TDataSet)
          and (AComponent.Components[i].Name <> '')
          and (AComponent.Components[i] <> Data) then
        begin
          if (AComponent.Components[i].Owner = Data.Owner)
            or (AComponent.Components[i].Owner = nil) then
            Strings.Add(AComponent.Components[i].Name)
          else
            Strings.Add(AComponent.Components[i].Owner.Name +
              {$IFDEF CBUILDER3}'->'{$ELSE}'.'{$ENDIF} + AComponent.Components[i].Name);
        end;
  end;

begin
  Result := nil;
  AForm := TfrmdxMemDataAddField.Create(nil);
  try
    AForm.Data := Data;
    AForm.FormDesigner := FormDesigner;
    TypeInfo := GetPropInfo(TDummyField.ClassInfo, 'DataType');
    if TypeInfo <> nil then
    begin
      with AForm do
      begin
        for i := Low(TFieldType) to High(TFieldType) do
          if Data.SupportedFieldType(TFieldType(i)) then
            cbFieldType.Items.Add(GetEnumName(TypeInfo^.PropType^, Integer(i)));

        cbFieldType.ItemIndex := 0;
        with Data do
          for j := 0 to FieldCount - 1 do
            if (Fields[j].Owner = Owner) and (Fields[j].FieldName <> '') then
              cbKeyField.Items.Add(Fields[j].FieldName);
        for j := 0 to Screen.FormCount - 1 do
          GetDataSets(Screen.Forms[j], cbDataSet.Items);
        for j := 0 to Screen.DataModuleCount - 1 do
          GetDataSets(Screen.DataModules[j], cbDataSet.Items);

        Left := X;
        Top := Y;
        if ShowModal = mrOk then
        begin
          i := TFieldType(GetEnumValue(TypeInfo^.PropType^, cbFieldType.Text));
          Result := Data.GetFieldClass(i).Create(Data.Owner);
          with Result do
          begin
            try
              FieldName := edName.Text;
              DataSet := Data;
              Name := edComponent.Text;
            except
              Result.Free;
              raise;
            end;
            try
              if edSize.Text <> '' then
                TStringField(Result).Size := StrToInt(edSize.Text);
            except
            end;
            Calculated := gbFieldtype.ItemIndex = 1;
            Lookup := gbFieldtype.ItemIndex = 2;
            if Lookup then
            begin
              KeyFields := cbKeyField.Text;
              LookupDataSet := LookupDS;
              LookupKeyFields := cbLookupField.Text;
              LookupResultField := cbResultField.Text;
            end;
          end;
        end;
      end;
    end;
  finally
    AForm.Free;
  end;
end;

procedure TfrmdxMemDataAddField.cbFieldTypeChange(Sender: TObject);
begin
  edSize.Enabled := (cbFieldType.Text = 'ftString') or (cbFieldType.Text = 'ftWideString');
  if not edSize.Enabled then
    edSize.Text := '';
end;

procedure TfrmdxMemDataAddField.gbFieldtypeClick(Sender: TObject);
begin
  cbKeyField.Enabled := gbFieldtype.ItemIndex = 2;
  cbDataSet.Enabled := cbKeyField.Enabled;
  cbLookupField.Enabled := cbKeyField.Enabled;
  cbResultField.Enabled := cbKeyField.Enabled;
  if not cbResultField.Enabled then
  begin
    cbKeyField.ItemIndex := -1;
    cbDataSet.Text := '';
    cbLookupField.ItemIndex := -1;
    cbResultField.ItemIndex := -1;
    LookupDS := nil;
  end;
end;

procedure TfrmdxMemDataAddField.edNameChange(Sender: TObject);
begin
  edComponent.Text := Data.Name + edName.Text;
  bOk.Enabled := (edComponent.Text <> '') and (edName.Text <> '');;
end;

procedure TfrmdxMemDataAddField.edSizeKeyPress(Sender: TObject;
  var Key: Char);
begin
  if not (Key in [#8, '0'..'9']) then
  begin
    Key := #0;
    {$IFNDEF LINUX}
    MessageBeep(0);
    {$ENDIF}
  end;
end;

procedure TfrmdxMemDataAddField.edComponentChange(Sender: TObject);
begin
  bOk.Enabled := (edComponent.Text <> '') and (edName.Text <> '');
end;

procedure TfrmdxMemDataAddField.cbDataSetExit(Sender: TObject);
var
  Component: TComponent;
  i: Integer;
begin
  LookupDS := nil;
  cbLookupField.Items.Clear;
  cbResultField.Items.Clear;
  if not (csDesigning in Data.ComponentState) then
    Exit;
  if cbDataSet.Text = '' then
    Component := nil
  else
  begin
    Component := FormDesigner.GetComponent(cbDataSet.Text);
    if not (Component is TDataSet) then
    begin
      raise EPropertyError.Create(SInvalidPropertyValue);
      Component := nil;
      cbDataSet.Text := '';
    end;
  end;
  if Component <> nil then
  begin
    LookupDS := TDataSet(Component);
    if LookupDS.Active then
    begin
      for i := 0 to LookupDS.FieldCount - 1 do
        if LookupDS.Fields[i].FieldName <> '' then
          cbLookupField.Items.Add(LookupDS.Fields[i].FieldName)
    end
    else
    begin
      LookupDS.FieldDefs.Update;
      for i := 0 to LookupDS.FieldDefs.Count - 1 do
        if LookupDS.FieldDefs[i].Name <> '' then
          cbLookupField.Items.Add(LookupDS.FieldDefs[i].Name);
    end;
    cbResultField.Items.Assign(cbLookupField.Items);
  end;
end;

end.
