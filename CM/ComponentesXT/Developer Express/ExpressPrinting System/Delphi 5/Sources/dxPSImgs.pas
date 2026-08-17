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

unit dxPSImgs;

interface

{$I dxPSVer.inc}

const
  DXCPIMAGES_BASE = 30000;
  
{bitmaps }  {reserved 0}
  DXCP_BMPPRINT = DXCPIMAGES_BASE + 1;
  DXCP_BMPPREVIEW = DXCPIMAGES_BASE + 2;
  DXCP_BMPPAGESETUP = DXCPIMAGES_BASE + 3;
  DXCP_BMPWEB = DXCPIMAGES_BASE + 4;
  DXCP_BMPREPORTDESIGNER = DXCPIMAGES_BASE + 5;
  DXCP_BMPREPORTPROPERTIES = DXCPIMAGES_BASE + 6;

  DXFEF_TEXTURES = DXCPIMAGES_BASE + 7;
  DXFEF_PATTERNS = DXCPIMAGES_BASE + 8;

  DXCP_BMPMARGINS = DXCPIMAGES_BASE + 9;  
  DXCP_BMPPAGESIZE = DXCPIMAGES_BASE + 10;
  DXCP_BMPSELECTMANYPAGES = DXCPIMAGES_BASE + 11;
  
  DXCP_BMPPAGENUMBER = DXCPIMAGES_BASE + 12;
  DXCP_BMPTOTALPAGES = DXCPIMAGES_BASE + 13;
  DXCP_BMPPAGENUMBEROFPAGES = DXCPIMAGES_BASE + 14;
  DXCP_BMPDATETIME = DXCPIMAGES_BASE + 15;
  DXCP_BMPDATE = DXCPIMAGES_BASE + 16;
  DXCP_BMPTIME = DXCPIMAGES_BASE + 17;    
  DXCP_BMPUSERNAME = DXCPIMAGES_BASE + 18;
  DXCP_BMPMACHINENAME = DXCPIMAGES_BASE + 19;

  DXCP_BMPDEFINEPRINTSTYLES = DXCPIMAGES_BASE + 20;  
  
  DXCP_BMPSTANDARDSTYLE = DXCPIMAGES_BASE + 21;
  DXCP_BMPMEMOSTYLE = DXCPIMAGES_BASE + 22;  
  
  DXCP_PREVIEWFULLSCROLLBITMAP = DXCPIMAGES_BASE + 23;  
  DXCP_PREVIEWHORZSCROLLBITMAP = DXCPIMAGES_BASE + 24;  
  DXCP_PREVIEWVERTSCROLLBITMAP = DXCPIMAGES_BASE + 25;  

{cursors}
  DXCP_PREVIEWHORIZONTALRESIZECURSOR = DXCPIMAGES_BASE + 30;
  DXCP_PREVIEWVERTICALRESIZECURSOR = DXCPIMAGES_BASE + 31;
  DXCP_PREVIEWZOOMINCURSOR = DXCPIMAGES_BASE  + 32;
  DXCP_PREVIEWZOOMOUTCURSOR = DXCPIMAGES_BASE + 33;
  DXCP_PREVIEWFULLSCROLLCURSOR = DXCPIMAGES_BASE + 34;
  DXCP_PREVIEWHORZSCROLLCURSOR = DXCPIMAGES_BASE + 35;
  DXCP_PREVIEWVERTSCROLLCURSOR = DXCPIMAGES_BASE + 36;
  DXCP_PREVIEWUPSCROLLCURSOR = DXCPIMAGES_BASE + 37;
  DXCP_PREVIEWRIGHTSCROLLCURSOR = DXCPIMAGES_BASE + 38;
  DXCP_PREVIEWDOWNSCROLLCURSOR = DXCPIMAGES_BASE + 39;
  DXCP_PREVIEWLEFTSCROLLCURSOR = DXCPIMAGES_BASE + 40;
  DXCP_PREVIEWTOPRIGHTSCROLLCURSOR = DXCPIMAGES_BASE + 41;  
  DXCP_PREVIEWTOPLEFTSCROLLCURSOR = DXCPIMAGES_BASE + 42;
  DXCP_PREVIEWBOTTOMRIGHTSCROLLCURSOR = DXCPIMAGES_BASE + 43;  
  DXCP_PREVIEWBOTTOMLEFTSCROLLCURSOR = DXCPIMAGES_BASE + 44;
  
implementation
 {$R dxPSImgs.res}
 {dxPSImgs.rc}
 
end.
