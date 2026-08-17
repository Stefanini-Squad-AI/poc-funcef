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

unit dxPSDsgProxies;

interface

{$I dxPSVer.inc}

uses
  Classes, {$IFDEF DELPHI6} DesignIntf, ComponentDesigner {$ELSE} DsgnIntf, LibIntf {$ENDIF};

type
{$IFDEF DELPHI4}
  {$IFDEF DELPHI6}
    TFormDesigner = IDesigner;
    IPersistent = TPersistent;
    IComponent = TComponent;
  {$ELSE}
    TFormDesigner = IFormDesigner;  
  {$ENDIF}
{$ELSE}
  IPersistent = TPersistent;
  IComponent = TComponent;
{$ENDIF}

  TdxDesignSelectionList = 
   {$IFDEF DELPHI6} 
    IDesignerSelections;
   {$ELSE}  
     {$IFDEF DELPHI5}
      TDesignerSelectionList;        
     {$ELSE}
      TComponentList;
     {$ENDIF}      
   {$ENDIF}

{ helper routines } 
function CreateDesignSelectionList: TdxDesignSelectionList;
procedure FreeDesignSelectionList(const ASelections: TdxDesignSelectionList);

{$IFNDEF DELPHI6} 
function TryExtractPersistent(Component: IPersistent): TPersistent;
{$ENDIF}

implementation

function CreateDesignSelectionList: TdxDesignSelectionList;
begin
 {$IFDEF DELPHI6} 
   Result := CreateSelectionList;
 {$ELSE}  
   {$IFDEF DELPHI5}
    Result := TDesignerSelectionList.Create;
   {$ELSE}
    Result := TComponentList.Create;
   {$ENDIF}      
 {$ENDIF}
end;

procedure FreeDesignSelectionList(const ASelections: TdxDesignSelectionList);
begin
 {$IFDEF DELPHI6} 
   {nothing to do }
 {$ELSE}  
   ASelections.Free;
 {$ENDIF}
end;

{$IFNDEF DELPHI6} 
function TryExtractPersistent(Component: IPersistent): TPersistent;
begin
 {$IFDEF DELPHI4}
  Result := DsgnIntf.TryExtractPersistent(Component);
 {$ELSE}
  Result := TComponent(Component);
 {$ENDIF} 
end;
{$ENDIF}

end.
 