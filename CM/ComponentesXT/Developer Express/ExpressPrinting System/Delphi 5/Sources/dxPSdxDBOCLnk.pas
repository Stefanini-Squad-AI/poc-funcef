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

unit dxPSdxDBOCLnk;

interface

{$I dxPSVer.inc}

uses
  Classes, DB,
  dxDBOrgC, dxPSdxOCLnk;

type
  TdxDBOrgChartReportLink = class(TCustomdxOrgChartReportLink)
  private
    FBookmark: TBookmark;
    function GetDBOrgChart: TdxDBOrgChart;
  protected
    procedure PrepareConstruct; override;
    procedure UnPrepareConstruct; override;
  public
    property DBOrgChart: TdxDBOrgChart read GetDBOrgChart;
  published
    property BorderColor;
    property Color;
    property DrawBorder;
    property FullExpand;
    property Transparent;
    property TransparentColor;
    property UseMetafile;
  end;

implementation
uses
  dxPSCore;

function TdxDBOrgChartReportLink.GetDBOrgChart: TdxDBOrgChart;
begin
  Result := TdxDBOrgChart(Component);
end;

procedure TdxDBOrgChartReportLink.PrepareConstruct;
var
  ADataSet: TDataSet;
begin
  inherited PrepareConstruct;
  if Assigned(DBOrgChart.DataSource) then
    ADataSet := DBOrgChart.DataSource.DataSet
  else
    ADataSet := nil;
  if Assigned(ADataSet) then
  begin
    FBookmark := ADataSet.GetBookmark;
    ADataSet.DisableControls;
  end;
end;

procedure TdxDBOrgChartReportLink.UnPrepareConstruct;
var
  ADataSet: TDataSet;
begin
  if Assigned(DBOrgChart.DataSource) then
    ADataSet := DBOrgChart.DataSource.DataSet
  else
    ADataSet := nil;
  if Assigned(ADataSet) then
  begin
    if Assigned(FBookmark) then ADataSet.GotoBookmark(FBookmark);
    ADataSet.EnableControls;
  end;
  inherited UnPrepareConstruct;
end;

initialization
  dxPSRegisterReportLink(TdxDBOrgChartReportLink, TdxDBOrgChart, TdxOCReportLinkDesignWindow);

finalization
  dxPSUnRegisterReportLink(TdxDBOrgChartReportLink, TdxDBOrgChart, TdxOCReportLinkDesignWindow);

end.
