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

unit dxPcPrVw;

interface

{$I dxPSVer.inc}

uses
  Classes, Graphics;

procedure dxShowPicturePreview(APicture: TGraphic);

implementation

uses
  SysUtils, Windows, Controls, Forms, messages, ComCtrls,
  dxPSRes, dxExtCtrls;

type
  TfmPicturePreview = class(TCustomForm)
  private
    FHourGlassCursor: Boolean;
    FSaveCursor: TCursor;
    FScrollBox: TScrollBox;
    FStatusBar: TStatusBar;
    FPreview: TdxPSPaintPanel;
    FPicture: TGraphic;
    procedure Execute;
    procedure PreviewPaint(Sender: TObject);
    procedure WMSetIcon(var message: TWMSetIcon); message WM_SETICON;
  protected
    procedure DoShow; override;
    procedure CreateParams(var Params: TCreateParams); override;
  public
    constructor CreateNew(AOwner: TComponent
{$IFDEF DELPHI4}; Dummy: Integer = 0{$ENDIF}); {$IFDEF DELPHI4} override; {$ENDIF}
    destructor Destroy; override;
  end;

procedure dxShowPicturePreview(APicture: TGraphic);
begin
  with TfmPicturePreview.CreateNew(nil) do
  try
    FPicture := APicture;
    Execute;
  finally
    Free;
  end;
end;


constructor TfmPicturePreview.CreateNew(AOwner: TComponent
{$IFDEF DELPHI4}; Dummy: Integer = 0{$ENDIF});
begin
  FSaveCursor := Screen.Cursor;
  Screen.Cursor := crHourGlass;
  FHourGlassCursor := True;
  inherited CreateNew(AOwner{$IFDEF DELPHI4}, Dummy{$ENDIF});
  BorderIcons := BorderIcons - [biMinimize];
  Caption := sdxFSPCaption;
  Position := poScreenCenter;
  BorderStyle := bsSizeToolWin; //Dialog;
  FStatusBar := TStatusBar.Create(Self);
  with FStatusBar do
  begin
    Parent := Self;
    Align := alBottom;
    with Panels.Add do Width := 250;
    with Panels.Add do Width := -1;
  end;
  FScrollBox := TScrollBox.Create(Self);
  with FScrollBox do
  begin
    Parent := Self;
    Align := alClient;
    HorzScrollBar.Tracking := True;
    VertScrollBar.Tracking := True;
  end;
  FPreview := TdxPSPaintPanel.Create(Self);
  with FPreview do
  begin
    Parent := FScrollBox;
    OnPaint := PreviewPaint;
    EdgeBorders := [];
  end;
end;

destructor TfmPicturePreview.Destroy;
begin
  if FHourGlassCursor then
    Screen.Cursor := FSaveCursor;
  inherited Destroy;
end;

procedure TfmPicturePreview.DoShow;
begin
  Screen.Cursor := FSaveCursor;
  FHourGlassCursor := False;
end;

procedure TfmPicturePreview.WMSetIcon(var message: TWMSetIcon);
begin
  message.Result := 1;
end;

procedure TfmPicturePreview.CreateParams(var Params: TCreateParams);
begin
  inherited;
  Params.Style := Params.Style or WS_MAXIMIZEBOX;
end;

procedure TfmPicturePreview.Execute;
begin
  if Assigned(FPicture) then
  begin
    FPreview.SetBounds(5, 5, FPicture.Width + 5, FPicture.Height + 5);
    Width := FPreview.Width + 40 {empiric value};
    Height := FPreview.Height + 60 {empiric value};
    FStatusBar.Panels[0].Text := Format('%s : %d   %s : %d',
      [sdxWidth, FPicture.Width, sdxHeight, FPicture.Height]);
  end;
  ShowModal;
end;

procedure TfmPicturePreview.PreviewPaint(Sender: TObject);
begin
  if Assigned(FPicture) then
    TdxPSPaintPanel(Sender).Canvas.Draw(0, 0, FPicture);
end;

end.

