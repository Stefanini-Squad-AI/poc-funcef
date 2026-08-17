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

unit dxPSTCLnk;

interface

{$I dxPSVer.inc}

uses
  Classes, Chart, dxPSCore;

type
  TCustomdxTeeChartReportLink = class(TBasedxReportLink)
  private
    function GetChart: TChart;
  protected
    procedure ConstructReport(AReportCells: TdxReportCells); override;
    property Chart: TChart read GetChart;
  end;

  TdxTeeChartReportLink = class(TCustomdxTeeChartReportLink)
  public
    property Chart;
  end;
    
implementation

uses
  Graphics;

{ TCustomdxTeeChartReportLink }  

function TCustomdxTeeChartReportLink.GetChart: TChart;
begin
  Result := TChart(Component);
end;

procedure TCustomdxTeeChartReportLink.ConstructReport(AReportCells: TdxReportCells);
var
  Cell: TdxReportCell;
  MetaFile: TMetaFile;
begin
  if Chart = nil then Exit;
  inherited ConstructReport(AReportCells);
  
  with Chart do 
    MetaFile := TeeCreateMetafile(True, ClientRect);
  if MetaFile = nil then Exit;
  try
    Cell := TdxReportCell.Create(AReportCells.Cells);
    with TdxReportCellGraphic.Create(Cell) do
    begin
      Image := MetaFile;
      Cell.BoundsRect := Rect(0, 0, Width, Height);
      AReportCells.Cells.BoundsRect := Cell.BoundsRect;
      AReportCells.DoProgress(100);
    end;  
  finally
    MetaFile.Free;
  end;  
end;

initialization
  dxPSRegisterReportLink(TdxTeeChartReportLink, TChart, nil);

finalization
  dxPSUnregisterReportLink(TdxTeeChartReportLink, TChart, nil);

end.
