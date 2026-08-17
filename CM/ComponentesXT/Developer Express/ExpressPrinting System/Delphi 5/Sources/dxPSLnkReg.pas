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

unit dxPSLnkReg;

interface

{$I dxPSVer.inc}

procedure Register;

implementation
uses
  Classes, {$IFDEF DELPHI6} DesignIntf, DesignEditors,{$ELSE} DsgnIntf, {$ENDIF}
  dxPSCore, dxPSStdGrLnk, dxPSGrLnks, dxPSLbxLnk, dxPSChLbxLnk, dxPSTVLnk, dxPSRELnk;

type
  TdxGridOptionsPropertyEditor = class(TSetProperty)
  public
    procedure Edit; override;
    function GetAttributes: TPropertyAttributes; override;
  end;

  TdxListBoxOptionsPropertyEditor = class(TSetProperty)
  public
    procedure Edit; override;
    function GetAttributes: TPropertyAttributes; override;
  end;

  TdxCheckListBoxOptionsPropertyEditor = class(TSetProperty)
  public
    procedure Edit; override;
    function GetAttributes: TPropertyAttributes; override;
  end;

  TdxTreeViewOptionsPropertyEditor = class(TSetProperty)
  public
    procedure Edit; override;
    function GetAttributes: TPropertyAttributes; override;
  end;


{ TdxGridOptionsPropertyEditor }

function TdxGridOptionsPropertyEditor.GetAttributes: TPropertyAttributes;
begin
  Result := inherited GetAttributes + [paDialog];
end;

procedure TdxGridOptionsPropertyEditor.Edit;
var
  I: Integer;
begin
  inherited;
  if TCustomdxGridReportLink(GetComponent(0)).DesignReport then
  begin
    Designer.Modified;
    if PropCount > 1 then
      for I := 1 to PropCount - 1 do
        GetComponent(I).Assign(GetComponent(0));
  end;
end;


{ TdxListBoxOptionsPropertyEditor }

function TdxListBoxOptionsPropertyEditor.GetAttributes: TPropertyAttributes;
begin
  Result := inherited GetAttributes + [paDialog];
end;

procedure TdxListBoxOptionsPropertyEditor.Edit;
var
  I: Integer;
begin
  inherited;
  if TdxListBoxReportLink(GetComponent(0)).DesignReport then
  begin
    Designer.Modified;
    if PropCount > 1 then
      for I := 1 to PropCount - 1 do
        GetComponent(I).Assign(GetComponent(0));
  end;
end;


{ TdxCheckListBoxOptionsPropertyEditor }

function TdxCheckListBoxOptionsPropertyEditor.GetAttributes: TPropertyAttributes;
begin
  Result := inherited GetAttributes + [paDialog];
end;

procedure TdxCheckListBoxOptionsPropertyEditor.Edit;
var
  I: Integer;
begin
  inherited;
  if TdxCheckListBoxReportLink(GetComponent(0)).DesignReport then
  begin
    Designer.Modified;
    if PropCount > 1 then
      for I := 1 to PropCount - 1 do
        GetComponent(I).Assign(GetComponent(0));
  end;
end;

{ TdxTreeViewOptionsPropertyEditor }

function TdxTreeViewOptionsPropertyEditor.GetAttributes: TPropertyAttributes;
begin
  Result := inherited GetAttributes + [paDialog];
end;

procedure TdxTreeViewOptionsPropertyEditor.Edit;
var
  I: Integer;
begin
  inherited;
  if TdxTreeViewReportLink(GetComponent(0)).DesignReport then
  begin
    Designer.Modified;
    if (PropCount > 1) then
      for I := 1 to PropCount - 1 do
        GetComponent(I).Assign(GetComponent(0));
  end;
end;

procedure Register;
begin
  RegisterPropertyEditor(TypeInfo(TdxGridPaintOptions),
    TdxDrawGridReportLink, 'Options', TdxGridOptionsPropertyEditor);
  RegisterPropertyEditor(TypeInfo(TdxListBoxPaintOptions),
    TdxListBoxReportLink, 'Options', TdxListBoxOptionsPropertyEditor);
  RegisterPropertyEditor(TypeInfo(TdxCheckListBoxPaintOptions),
    TdxCheckListBoxReportLink, 'Options', TdxCheckListBoxOptionsPropertyEditor);
  RegisterPropertyEditor(TypeInfo(TdxTreeViewPaintOptions),
    TdxTreeViewReportLink, 'Options', TdxTreeViewOptionsPropertyEditor);

  RegisterPropertyEditor(TypeInfo(TdxReportTitle),
    TAbstractdxRichEditReportLink, 'ReportTitle', nil);
    
  RegisterNoIcon([TdxStringGridReportLink, TdxDrawGridReportLink,
    TdxListBoxReportLink, TdxCheckListBoxReportLink, TdxTreeViewReportLink, TdxRichEditReportLink]);
end;

end.

