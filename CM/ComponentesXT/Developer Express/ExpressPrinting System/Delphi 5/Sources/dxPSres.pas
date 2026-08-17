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

unit dxPSRes;

interface

{$I dxPSVer.inc}

resourcestring
  sdxBtnOK = 'OK';
  sdxBtnCancel = 'Cancel';
  sdxBtnClose = 'Close';
  sdxBtnApply = '&Apply';
  sdxBtnHelp = '&Help';
  sdxBtnFix = '&Fix';
  sdxBtnNew = '&New...';
  sdxBtnIgnore = '&Ignore';
  sdxBtnYes = '&Yes';
  sdxBtnNo = '&No';
  sdxBtnEdit = '&Edit...';
  sdxBtnReset = '&Reset';
  sdxBtnAdd = '&Add';
  sdxBtnDelete = '&Delete...';
  sdxBtnDefault = '&Default...';
  sdxBtnCopy = '&Copy...';
  sdxBtnYesToAll = 'Yes To &All';
  sdxBtnRestoreDefaults = '&Restore Defaults';
  sdxBtnRestoreOriginal = 'Restore &Original';
  sdxBtnTitleProperties = 'Title Properties...';
  sdxBtnProperties = 'P&roperties...';
  sdxBtnNetwork = 'Net&work...';
  sdxBtnBrowse = '&Browse...';
  sdxBtnPageSetup = 'Pa&ge Setup...';
  sdxBtnPrintPreview = 'Print Pre&view...';
  sdxBtnPreview = 'Pre&view...';
  sdxBtnPrint = 'Print...';
  sdxBtnOptions = '&Options...';
  sdxBtnStyleOptions = 'Style Options...';
  sdxBtnDefinePrintStyles = '&Define Styles...';
  sdxBtnPrintStyles = 'Print Styles';
  sdxBtnBackground = 'Background';
  sdxBtnShowToolBar = 'Show &ToolBar';

  sdxBtnMoreColors = '&More Colors...';
  sdxBtnFillEffects = '&Fill Effects...';
  sdxBtnNoFill = '&No Fill';
  sdxBtnAutomatic = '&Automatic';
  sdxBtnNone = '&None';

  sdxBtnOtherTexture = 'Other Te&xture...';
  sdxBtnInvertColors = 'I&nvert Colors';
  sdxBtnSelectPicture = 'Se&lect Picture...';

  sdxReportTitleDlgCaption = 'Report Title';
  sdxMode = '&Mode:';
  sdxText = '&Text';
  sdxProperties = '&Properties';
  sdxAdjustOnScale = '&Adjust on Scale';
  sdxTitleModeNone = 'None';
  sdxTitleModeOnEveryTopPage = 'On Every Top Page';
  sdxTitleModeOnFirstPage = 'On First Page';

  sdxOptions = 'Options';
  sdxShow = 'Show';
  sdxPaintItemsGraphics = '&Paint Item Graphics';

  sdxOnlySelected = 'Only &Selected';
  sdxExtendedSelect = '&Extended Select';
  sdxIncludeFixed = '&Include Fixed';

  sdxFonts = 'Fonts';
  sdxBtnFont = 'Fo&nt...';
  sdxBtnEvenFont = 'E&ven Font...';
  sdxBtnOddFont = 'Odd Fo&nt...';
  sdxBtnFixedFont = 'F&ixed Font...';
  sdxBtnGroupFont = 'Grou&p Font...';
  sdxBtnChangeFont = 'Change Fo&nt...';

  sdxFont = 'Font';
  sdxOddFont = 'Odd Font';
  sdxEvenFont = 'Even Font';
  sdxPreviewFont = 'Preview Font';
  sdxCaptionNodeFont = 'Level Caption Font';
  sdxGroupNodeFont = 'Group Node Font';
  sdxGroupFooterFont = 'Group Footer Font';
  sdxHeaderFont = 'Header Font';
  sdxFooterFont = 'Footer Font';
  sdxBandFont = 'Band Font';

  sdxTransparent = '&Transparent';
  sdxFixedTransparent = 'Fi&xed Transparent';

  sdxGraphicAsTextValue = '(GRAPHIC)';
  sdxColors = 'Colors';
  sdxColor = 'Co&lor:';
  sdxOddColor = 'Odd Co&lor:';
  sdxEvenColor = 'E&ven Color:';
  sdxPreviewColor = '&Preview Color:';
  sdxBandColor = '&Band Color:';
  sdxLevelCaptionColor = 'Le&vel Caption Color:';
  sdxHeaderColor = 'H&eader Color:';
  sdxGroupNodeColor = 'Group &Node Color:';
  sdxGroupFooterColor = '&Group Footer Color:';
  sdxFooterColor = 'Foo&ter Color:';
  sdxFixedColor = 'F&ixed Color:';
  sdxGroupColor = 'Grou&p Color:';
  sdxGridLinesColor = 'Gri&d Line Color:';

  sdxBands = '&Bands';
  sdxLevelCaptions = 'Levels &Caption';
  sdxHeaders = 'H&eaders';
  sdxFooters = 'Foote&rs';
  sdxGroupFooters = '&Group Footers';
  sdxPreview = 'Previe&w';
  sdxPreviewLineCount = 'Preview Line Coun&t:';
  sdxAutoCalcPreviewLineCount = 'A&uto Calculate Preview Lines';

  sdxGrid = 'Gri&d';
  sdxNodesGrid = '&Nodes Grid';
  sdxGroupFooterGrid = 'Grou&p Footers Grid';

  sdxStateImages = '&State Images';
  sdxImages = '&Images';

  sdxTextAlign = 'Text&Align';
  sdxTextAlignHorz = 'Hori&zontally';
  sdxTextAlignVert = '&Vertically';
  sdxTextAlignLeft = 'Left';
  sdxTextAlignCenter = 'Center';
  sdxTextAlignRight = 'Right';
  sdxTextAlignTop = 'Top';
  sdxTextAlignVCenter = 'Center';
  sdxTextAlignBottom = 'Bottom';
  sdxBorderLines = '&Border Lines';
  sdxHorzLines = 'Hori&zontal Lines';
  sdxVertLines = '&Vertical Lines';
  sdxFixedHorzLines = 'Fi&xed Horizontal Lines';
  sdxFixedVertLines = 'Fixe&d Vertical Lines';
  sdxFlatCheckMarks = 'F&lat CheckMarks';
  sdxCheckMarksAsText = '&Display CheckMarks as Text';

  sdxRowAutoHeight = 'Ro&w AutoHeight';
  sdxEndEllipsis = '&EndEllipsis';

  sdxDrawBorder = '&Draw Border';
  sdxFullExpand = 'Full &Expand';
  sdxBorderColor = '&Border Color:';
  sdxAutoNodesExpand = 'A&uto Nodes Expand';
  sdxExpandLevel = 'Expand &Level:';
  sdxFixedRowOnEveryPage = 'Fixed Rows On &Every Page';

  sdxDrawMode = 'Draw &Mode:';
  sdxDrawModeStrict = 'Strict';
  sdxDrawModeOddEven = 'Odd/Even Rows Mode';
  sdxDrawModeChess = 'Chess Mode';
  sdxDrawModeBorrow = 'Borrow From Source';

  sdx3DEffects = '3D Effects';
  sdxUse3DEffects = 'Use &3D Effects';
  sdxSoft3D = 'Sof&t3D';

  sdxBehaviors = 'Behaviors';
  sdxMiscellaneous = 'Miscellaneous';
  sdxOnEveryPage = 'On Every Page';
  sdxNodeExpanding = 'Node Expanding';
  sdxSelection = 'Selection';
  sdxNodeAutoHeight = '&Node Auto Height';
  sdxTransparentGraphics = '&Transparent Graphics';
  sdxAutoWidth = 'Auto &Width';

  sdxDisplayGraphicsAsText = 'Display Graphic As &Text';
  sdxTransparentColumnGraphics = 'Transparent &Graphics';

  sdxBandsOnEveryPage = 'Bands On Eve&ry Page';
  sdxHeadersOnEveryPage = 'Headers On Every &Page';
  sdxFootersOnEveryPage = 'Footers On E&very Page';
  sdxGraphics = 'Graphics';

  { common messages }
  sdxOutOfResources = 'Out of Resources';
  sdxFileAlreadyExists = 'File "%s" Already Exists.';
  sdxConfirmOverWrite = 'File "%s" already exists. Overwrite ?';
  sdxInvalidFileName = 'Invalid File Name "%s"';
  sdxRequiredFileName = 'Enter file name.';
  sdxOutsideMarginsMessage =
    'One or more margins are set outside the printable area of the page.' + #13#10 +
    'Do you want to continue ?';
  sdxOutsideMarginsMessage2 =
    'One or more margins are set outside the printable area of the page.' + #13#10 +
    'Choose the Fix button to increase the appropriate margins.';
  sdxInvalidMarginsMessage =
    'One or more margins are set to the invalid values.' + #13#10 +
    'Choose the Fix button to correct this problem.' + #13#10 +
    'Choose the Restore button to restore original values.';
  sdxInvalidMargins = 'One or more margins has invalid values';
  sdxOutsideMargins = 'One or more margins are set outside the printable area of the page';


  { color palette }
  sdxPageBackground = ' Page Background';
  sdxPenColor = 'Pen Color';
  sdxFontColor = 'Font Color';
  sdxBrushColor = 'Brush Color';
  sdxHighLight = 'HighLight';

  { colornames }
  sdxColorBlack = 'Black';
  sdxColorDarkRed = 'Dark Red';
  sdxColorRed = 'Red';
  sdxColorPink = 'Pink';
  sdxColorRose = 'Rose';
  sdxColorBrown = 'Brown';
  sdxColorOrange = 'Orange';
  sdxColorLightOrange = 'Light Orange';
  sdxColorGold = 'Gold';
  sdxColorTan = 'Tan';
  sdxColorOliveGreen = 'Olive Green';
  sdxColorDrakYellow = 'Dark Yellow';
  sdxColorLime = 'Lime';
  sdxColorYellow = 'Yellow';
  sdxColorLightYellow = 'Light Yellow';
  sdxColorDarkGreen = 'Dark Green';
  sdxColorGreen = 'Green';
  sdxColorSeaGreen = 'Sea Green';
  sdxColorBrighthGreen = 'Bright Green';
  sdxColorLightGreen = 'Light Green';
  sdxColorDarkTeal = 'Dark Teal';
  sdxColorTeal = 'Teal';
  sdxColorAqua = 'Aqua';
  sdxColorTurquoise = 'Turquoise';
  sdxColorLightTurquoise = 'Light Turquoise';
  sdxColorDarkBlue = 'Dark Blue';
  sdxColorBlue = 'Blue';
  sdxColorLightBlue = 'Light Blue';
  sdxColorSkyBlue = 'Sky Blue';
  sdxColorPaleBlue = 'Pale Blue';
  sdxColorIndigo = 'Indigo';
  sdxColorBlueGray = 'Blue Gray';
  sdxColorViolet = 'Violet';
  sdxColorPlum = 'Plum';
  sdxColorLavender = 'Lavender';
  sdxColorGray80 = 'Gray-80%';
  sdxColorGray50 = 'Gray-50%';
  sdxColorGray40 = 'Gray-40%';
  sdxColorGray25 = 'Gray-25%';
  sdxColorWhite = 'White';
 
  { FEF Dialog }
  sdxTexture = '&Texture';
  sdxPattern = '&Pattern';
  sdxPicture = 'P&icture';
  sdxForeground = '&Foreground';
  sdxBackground = '&Background';
  sdxSample = 'Sample:';

  sdxFEFCaption = 'Fill Effects';
  sdxPaintMode = 'Paint &Mode';
  sdxPaintModeCenter = 'Center';
  sdxPaintModeStretch = 'Stretch';
  sdxPaintModeTile = 'Tile';
  sdxPaintModeProportional = 'Proportional';

  { pattern names }
  sdxPatternGray5 = '5%';
  sdxPatternGray10 = '10%';
  sdxPatternGray20 = '20%';
  sdxPatternGray25 = '25%';
  sdxPatternGray30 = '30%';
  sdxPatternGray40 = '40%';
  sdxPatternGray50 = '50%';
  sdxPatternGray60 = '60%';
  sdxPatternGray70 = '70%';
  sdxPatternGray75 = '75%';
  sdxPatternGray80 = '80%';
  sdxPatternGray90 = '90%';
  sdxPatternLightDownwardDiagonal = 'Light downward diagonal';
  sdxPatternLightUpwardDiagonal = 'Light upward diagonal';
  sdxPatternDarkDownwardDiagonal = 'Dark downward diagonal';
  sdxPatternDarkUpwardDiagonal = 'Dark upward diagonal';
  sdxPatternWideDownwardDiagonal = 'Wide downward diagonal';
  sdxPatternWideUpwardDiagonal = 'Wide upward diagonal';
  sdxPatternLightVertical = 'Light vertical';
  sdxPatternLightHorizontal = 'Light horizontal';
  sdxPatternNarrowVertical = 'Narrow vertical';
  sdxPatternNarrowHorizontal = 'Narrow horizontal';
  sdxPatternDarkVertical = 'Dark vertical';
  sdxPatternDarkHorizontal = 'Dark horizontal';
  sdxPatternDashedDownward = 'Dashed downward';
  sdxPatternDashedUpward = 'Dashed upward';
  sdxPatternDashedVertical = 'Dashed vertical';
  sdxPatternDashedHorizontal = 'Dashed horizontal';
  sdxPatternSmallConfetti = 'Small confetti';
  sdxPatternLargeConfetti = 'Large confetti';
  sdxPatternZigZag = 'Zig zag';
  sdxPatternWave = 'Wave';
  sdxPatternDiagonalBrick = 'Diagonal brick';
  sdxPatternHorizantalBrick = 'Horizontal brick';
  sdxPatternWeave = 'Weave';
  sdxPatternPlaid = 'Plaid';
  sdxPatternDivot = 'Divot';
  sdxPatternDottedGrid = 'Dottedgrid';
  sdxPatternDottedDiamond = 'Dotted diamond';
  sdxPatternShingle = 'Shingle';
  sdxPatternTrellis = 'Trellis';
  sdxPatternSphere = 'Sphere';
  sdxPatternSmallGrid = 'Small grid';
  sdxPatternLargeGrid = 'Large grid';
  sdxPatternSmallCheckedBoard = 'Small checked board';
  sdxPatternLargeCheckedBoard = 'Large checked board';
  sdxPatternOutlinedDiamond = 'Outlined diamond';
  sdxPatternSolidDiamond = 'Solid diamond';

  { texture names }
  sdxTextureNewSprint = 'Newsprint';
  sdxTextureGreenMarble = 'Green marble';
  sdxTextureBlueTissuePaper = 'Blue tissue paper';
  sdxTexturePapyrus = 'Papyrus';
  sdxTextureWaterDroplets = 'Water droplets';
  sdxTextureCork = 'Cork';
  sdxTextureRecycledPaper = 'Recycled paper';
  sdxTextureWhiteMarble = 'White marble';
  sdxTexturePinkMarble = 'Pink marble';
  sdxTextureCanvas = 'Canvas';
  sdxTexturePaperBag = 'Paper bag';
  sdxTextureWalnut = 'Walnut';
  sdxTextureParchment = 'Parchment';
  sdxTextureBrownMarble = 'Brown marble';
  sdxTexturePurpleMesh = 'Purple mesh';
  sdxTextureDenim = 'Denim';
  sdxTextureFishFossil = 'Fish fossil';
  sdxTextureOak = 'Oak';
  sdxTextureStationary = 'Stationary';
  sdxTextureGranite = 'Granite';
  sdxTextureBouquet = 'Bouquet';
  sdxTextureWonenMat = 'Woven mat';
  sdxTextureSand = 'Sand';
  sdxTextureMediumWood = 'Medium wood';

  sdxFSPCaption = 'Picture Preview';
  sdxWidth = 'Height';
  sdxHeight = 'Height';

  { Brush Dialog }
  sdxBrushDlgCaption = 'Setup Brush Properties';
  sdxStyle = '&Style:';

  { Enter New File Name dialog }
  sdxENFNCaption = 'Choose New File Name';
  sdxEnterNewFileName = 'Enter New File Name';

  { Define styles dialog }
  sdxDefinePrintStylesCaption = 'Define Print Styles';
  sdxDefinePrintStylesTitle = 'Print &Styles';
  sdxDefinePrintStylesWarningDelete = 'Do you want to delete "%s" ?';
  sdxDefinePrintStylesWarningClear = 'Do you want to delete all not built-in styles ?';
  sdxClear = 'C&lear...';

  { Print device }
  sdxCustomSize = 'Custom Size';
  sdxDefaultTray = 'Default Tray';
  sdxInvalidPrintDevice = 'Printer selected is not valid';
  sdxNotPrinting = 'Printer is not currently printing';
  sdxPrinting = 'Printing in progress';
  sdxDeviceOnPort = '%s on %s';
  sdxPrinterIndexError = 'Printer index out of range';
  sdxNoDefaultPrintDevice = 'There is no default printer selected';

  { Edit AutoText entries dialog }
  sdxAutoTextDialogCaption = 'Edit AutoText Entries';
  sdxEnterAutoTextEntriesHere = ' Enter A&utoText Entries Here: ';

  { Print dialog }
  sdxPrintDialogCaption = 'Print';
  sdxPrintDialogPrinter = ' Printer ';
  sdxPrintDialogName = '&Name:';
  sdxPrintDialogStatus = 'Status:';
  sdxPrintDialogType = 'Type:';
  sdxPrintDialogWhere = 'Where:';
  sdxPrintDialogComment = 'Comment:';
  sdxPrintDialogPrintToFile = 'Print to &File';
  sdxPrintDialogPageRange = ' Page range ';
  sdxPrintDialogAll = '&All';
  sdxPrintDialogCurrentPage = 'Curr&ent Page';
  sdxPrintDialogSelection = '&Selection';
  sdxPrintDialogPages = '&Pages:';
  sdxPrintDialogRangeLegend = 'Enter page number and/or page ranges' + #10#13 +
    'separated by commas. For example: 1,3,5-12.';
  sdxPrintDialogCopies = ' Copies ';
  sdxPrintDialogNumberOfPages = 'N&umber of Pages:';
  sdxPrintDialogNumberOfCopies = 'Number of &Copies:';
  sdxPrintDialogCollateCopies = 'Colla&te Copies';
  sdxPrintDialogAllPages = 'All';
  sdxPrintDialogEvenPages = 'Even';
  sdxPrintDialogOddPages = 'Odd';
  sdxPrintDialogPrintStyles = ' Print St&yles ';

  { Print to file dialog }
  sdxPrintDialogOpenDlgTitle = 'Choose File Name';
  sdxPrintDialogOpenDlgAllFiles = 'All Files';
  sdxPrintDialogOpenDlgPrinterFiles = 'Printer Files';
  sdxPrintDialogPageNumbersOutOfRange = 'Page numbers out of range (%d - %d)';
  sdxPrintDialogInvalidPageRanges = 'Invalid page ranges';
  sdxPrintDialogRequiredPageNumbers = 'Enter page numbers';
  sdxPrintDialogNoPrinters = 'No printers have been defined.';
  sdxPrintDialogInPrintingState = 'Printer is currently printing.' + #10#13 +
    'Please wait.';

  { printer state }
  sdxPrintDialogPSPaused = 'Paused';
  sdxPrintDialogPSPendingDeletion = 'Pending Deletion';
  sdxPrintDialogPSBusy = 'Busy';
  sdxPrintDialogPSDoorOpen = 'Door Open';
  sdxPrintDialogPSError = 'Error';
  sdxPrintDialogPSInitializing = 'Initializing';
  sdxPrintDialogPSIOActive = 'IO Active';
  sdxPrintDialogPSManualFeed = 'Manual Feed';
  sdxPrintDialogPSNoToner = 'No Toner';
  sdxPrintDialogPSNotAvailable = 'Not Available';
  sdxPrintDialogPSOFFLine = 'Offline';
  sdxPrintDialogPSOutOfMemory = 'Out of Memory';
  sdxPrintDialogPSOutBinFull = 'Output Bin Full';
  sdxPrintDialogPSPagePunt = 'Page Punt';
  sdxPrintDialogPSPaperJam = 'Paper Jam';
  sdxPrintDialogPSPaperOut = 'Paper Out';
  sdxPrintDialogPSPaperProblem = 'Paper Problem';
  sdxPrintDialogPSPrinting = 'Printing';
  sdxPrintDialogPSProcessing = 'Processing';
  sdxPrintDialogPSTonerLow = 'Toner Low';
  sdxPrintDialogPSUserIntervention = 'User Intervention';
  sdxPrintDialogPSWaiting = 'Waiting';
  sdxPrintDialogPSWarningUp = 'Warming Up';
  sdxPrintDialogPSReady = 'Ready';
  sdxPrintDialogPSPrintingAndWaiting = 'Printing: %d document(s) waiting';

  sdxLeftMargin = 'Left Margin';
  sdxTopMargin = 'Top Margin';
  sdxRightMargin = 'Right Margin';
  sdxBottomMargin = 'Bottom Margin';
  sdxGutterMargin = 'Gutter';
  sdxHeaderMargin = 'Header';
  sdxFooterMargin = 'Footer';

  sdxUnitsInches = '"';
  sdxUnitsCentimeters = 'cm';
  sdxUnitsMillimeters = 'mm';
  sdxUnitsPoints = 'pt';
  sdxUnitsPicas = 'pi';

  sdxUnitsDefaultName = 'Default';
  sdxUnitsInchesName = 'Inches';
  sdxUnitsCentimetersName = 'Centimeters';
  sdxUnitsMillimetersName = 'Millimeters';
  sdxUnitsPointsName = 'Points';
  sdxUnitsPicasName = 'Picas';

  sdxPrintPreview = 'Print Preview';
  sdxReportDesignerCaption = 'Report Designer';

  sdxComponentNotSupportedByLink = 'Component "%s" not supported by TdxComponentPrinter';
  sdxComponentNotSupported = 'Component "%s" not supported by TdxComponentPrinter';
  sdxPrintDeviceNotReady = 'Printer has not been installed or is not ready';
  sdxUnableToGenerateReport = 'Unable to generate report';
  sdxPreviewNotRegistered = 'There is no registered preview form';
  sdxComponentNotAssigned = '%s' + #13#10 + 'Not assigned "Component" property';
  sdxPrintDeviceIsBusy = 'Printer is busy';
  sdxPrintDeviceError = 'Printer has encountered error !';
  sdxMissingComponent = 'Missing "Component" property';
  sdxBuildingReport = 'Building report: Completed %d%%';
  sdxPrintingReport = 'Printing report: Completed %d page(s). Press ESC to abort...';
  sdxDefinePrintStylesMenuItem = 'Define Print &Styles...';
  sdxAbortPrinting = 'Abort printing ?';
  sdxStandardStyle = 'Standard Style';

  sdxFontStyleBold = 'Bold';
  sdxFontStyleItalic = 'Italic';
  sdxFontStyleUnderline = 'Underline';
  sdxFontStyleStrikeOut = 'StrikeOut';
  sdxPt = 'pt.';

  sdxNoPages = '[No pages]';
  sdxPageWidth = 'Page Width';
  sdxWholePage = 'Whole Page';
  sdxTwoPages = 'Two Pages';
  sdxFourPages = 'Four Pages';
  sdxWidenToSourceWidth = 'Widen to Source Width';

  sdxMenuBar = 'MenuBar';
  sdxStandardBar = 'Standard';
  sdxHeaderFooterBar = 'Header and Footer';
  sdxShortcutMenusBar = 'Shortcut Menus';

  sdxMenuFile = '&File';
  sdxMenuFileDesign = '&Design...';
  sdxMenuFilePrint = '&Print...';
  sdxMenuFilePageSetup = 'Page Set&up...';
  sdxMenuPrintStyles = 'Print Styles';
  sdxMenuFileExit = '&Close';

  sdxMenuEdit = '&Edit';
  sdxMenuEditCut = 'Cu&t';
  sdxMenuEditCopy = '&Copy';
  sdxMenuEditPaste = '&Paste';
  sdxMenuEditDelete = '&Delete';
  sdxMenuEditFind = '&Find...';
  sdxMenuEditFindNext = 'Find Ne&xt';
  sdxMenuEditReplace = '&Replace...';

  sdxMenuLoad = '&Load...';
  sdxMenuPreview = 'Pre&view...';

  sdxMenuInsert = '&Insert';
  sdxMenuInsertAutoText = '&AutoText';
  sdxMenuInsertEditAutoTextEntries = 'AutoTe&xt...';
  sdxMenuInsertAutoTextEntries = '&(List of AutoText Entries)';
  sdxMenuInsertPageNumber = '&Page Number';
  sdxMenuInsertTotalPages = '&Number of Pages';
  sdxMenuInsertPageOfPages = 'Pa&ge Number of Pages';
  sdxMenuInsertDateTime = 'Date and Time';
  sdxMenuInsertDate = '&Date';
  sdxMenuInsertTime = '&Time';
  sdxMenuInsertUserName = '&User Name';
  sdxMenuInsertMachineName = '&Machine Name';

  sdxMenuView = '&View';
  sdxMenuViewMargins = '&Margins';
  sdxMenuViewFlatToolBarButtons = '&Flat ToolBar Buttons';
  sdxMenuViewLargeToolBarButtons = '&Large ToolBar Buttons';
  sdxMenuViewMarginsStatusBar = 'M&argins Bar';
  sdxMenuViewPagesStatusBar = '&Status Bar';
  sdxMenuViewToolBars = '&Toolbars';
  sdxMenuViewPagesHeaders = 'Page &Headers';
  sdxMenuViewPagesFooters = 'Page Foote&rs';
  sdxMenuViewSwitchToLeftPart = 'Switch to Left Part';
  sdxMenuViewSwitchToRightPart = 'Switch to Right Part';
  sdxMenuViewSwitchToCenterPart = 'Switch to Center Part';
  sdxMenuViewHFSwitchHeaderFooter = '&Show Header/Footer';
  sdxMenuViewHFClose = '&Close';

  sdxMenuZoom = '&Zoom';
  sdxMenuZoomPercent100 = 'Percent &100';
  sdxMenuZoomPageWidth = 'Page &Width';
  sdxMenuZoomWholePage = 'W&hole Page';
  sdxMenuZoomTwoPages = '&Two Pages';
  sdxMenuZoomFourPages = '&Four Pages';
  sdxMenuZoomMultiplyPages = '&Multiple Pages';
  sdxMenuZoomWidenToSourceWidth = 'Widen To S&ource Width';
  sdxMenuZoomSetup = '&Setup...';

  sdxMenuPages = '&Pages';

  sdxMenuGotoPage = '&Go';
  sdxMenuGotoPageFirst = '&First Page';
  sdxMenuGotoPagePrev = '&Previous Page';
  sdxMenuGotoPageNext = '&Next Page';
  sdxMenuGotoPageLast = '&Last Page';
  sdxMenuActivePage = '&Active Page:';

  sdxMenuFormat = 'F&ormat';
  sdxMenuFormatHeaderAndFooter = '&Header and Footer';
  sdxMenuFormatAutoTextEntries = '&Auto Text Entries...';
  sdxMenuFormatDateTime = 'Date And &Time...';
  sdxMenuFormatPageNumbering = 'Page &Numbering...';
  sdxMenuFormatPageBackground = 'Bac&kground...';
  sdxMenuFormatShrinkToPage = '&Shrink To Page';
  sdxMenuShowEmptyPages = 'Show &Empty Pages';
  sdxMenuFormatHFBackground = 'Header/Footer Background...';
  sdxMenuFormatHFClear = 'Clear Text';

  sdxMenuTools = '&Tools';
  sdxMenuToolsCustomize = '&Customize...';
  sdxMenuToolsOptions = '&Options...';

  sdxMenuHelp = '&Help';
  sdxMenuHelpTopics = 'Help &Topics...';
  sdxMenuHelpAbout = '&About...';

  sdxMenuShortcutPreview = 'Preview';
  sdxMenuShortcutAutoText = 'AutoText';

  sdxMenuBuiltInMenus = 'Built-in Menus';
  sdxMenuShortCutMenus = 'Shortcut Menus';
  sdxMenuNewMenu = 'New Menu';

  { hints }
  sdxHintFileDesign = 'Design Report';
  sdxHintFilePrint = 'Print';
  sdxHintFilePrintDialog = 'Print Dialog';
  sdxHintFilePageSetup = 'Page Setup';
  sdxHintFileExit = 'Close Preview';

  sdxHintEditFind = 'Find';
  sdxHintEditFindNext = 'Find Next';
  sdxHintEditReplace = 'Replace';

  sdxHintInsertEditAutoTextEntries = 'Edit AutoText Entries';
  sdxHintInsertPageNumber = 'Insert Page Number';
  sdxHintInsertTotalPages = 'Insert Number of Pages';
  sdxHintInsertPageOfPages = 'Insert Page Number of Pages';
  sdxHintInsertDateTime = 'Insert Date and Time';
  sdxHintInsertDate = 'Insert Date';
  sdxHintInsertTime = 'Insert Time';
  sdxHintInsertUserName = 'Insert User Name';
  sdxHintInsertMachineName = 'Insert Machine Name';

  sdxHintViewMargins = 'View Margins';
  sdxHintViewLargeButtons = 'View Large Buttons';
  sdxHintViewMarginsStatusBar = 'View Margins Status Bar';
  sdxHintViewPagesStatusBar = 'View Page Status Bar';
  sdxHintViewPagesHeaders = 'View Page Header';
  sdxHintViewPagesFooters = 'View Page Footer';
  sdxHintViewSwitchToLeftPart = 'Switch to Left Header/Footer Part';
  sdxHintViewSwitchToRightPart = 'Switch to Right Header/Footer Part';
  sdxHintViewSwitchToCenterPart = 'Switch to Center Header/Footer Part';
  sdxHintViewHFSwitchHeaderFooter = 'Switch Between Header and Footer';
  sdxHintViewHFClose = 'Close';

  sdxHintViewZoom = 'Zoom';
  sdxHintZoomPercent100 = 'Zoom 100%';
  sdxHintZoomPageWidth = 'Zoom Page Width';
  sdxHintZoomWholePage = 'Whole Page';
  sdxHintZoomTwoPages = 'Two Pages';
  sdxHintZoomFourPages = 'Four Pages';
  sdxHintZoomMultiplyPages = 'Multiple Pages';
  sdxHintZoomWidenToSourceWidth = 'Widen To Source Width';
  sdxHintZoomSetup = 'Setup Zoom Factor';

  sdxHintFormatDateTime = 'Format Date and Time';
  sdxHintFormatPageNumbering = 'Format Page Number';
  sdxHintFormatPageBackground = 'Background';
  sdxHintFormatShrinkToPage = 'Shrink To Page';
  sdxHintFormatHFBackground = 'Header/Footer Background';
  sdxHintFormatHFClear = 'Clear Header/Footer Text';

  sdxHintGotoPageFirst = 'First Page';
  sdxHintGotoPagePrev = 'Previous Page';
  sdxHintGotoPageNext = 'Next Page';
  sdxHintGotoPageLast = 'Last Page';
  sdxHintActivePage = 'Active Page';

  sdxHintToolsCustomize = 'Customize Toolbars';
  sdxHintToolsOptions = 'Options';

  sdxHintHelpTopics = 'Help Topics';
  sdxHintHelpAbout = 'About';

  sdxPopupMenuLargeButtons = '&Large Buttons';
  sdxPopupMenuFlatButtons = '&Flat Buttons';

  sdxPaperSize = 'Paper Size';
  sdxStatus = 'Status';
  sdxStatusReady = 'Ready';
  sdxStatusPrinting = 'Printing. Completed %d page(s)';
  sdxStatusGenerateReport = 'Generating Report. Completed %d%%';

  sdxHintDoubleClickForChangePaperSize = 'Double Click for Change Paper Size';
  sdxHintDoubleClickForChangeMargins = 'Double Click for Change Margins';

  { date & time formats dialog }
  sdxDTFormatsCaption = 'Date and Time';
  sdxDTFormatsAvailableDateFormats = '&Available Date Formats:';
  sdxDTFormatsAvailableTimeFormats = 'Available &Time Formats:';
  sdxDTFormatsAutoUpdate = '&Update Automatically';
  sdxDTFormatsChangeDefaultFormat =
    'Do you want to change the default date and time formats to match "%s"  - "%s" ?';

  { page number formats dialog }
  sdxPNFormatsCaption = 'Page Number Format';
  sdxPNFormatsNumberFormat = 'Number &Format:';
  sdxPNFormatsStartAt = 'Start &At:';
  sdxPNFormatsChangeDefaultFormat =
    'Do you want to change the default Page numbering format to match "%s" ?';

  { zoom dialog }
  sdxZoomDlgCaption = 'Zoom';
  sdxZoomDlgZoomTo = ' Zoom To ';
  sdxZoomDlgPageWidth = 'Page &Width';
  sdxZoomDlgWholePage = 'W&hole Page';
  sdxZoomDlgTwoPages = '&Two Pages';
  sdxZoomDlgFourPages = '&Four Pages';
  sdxZoomDlgManyPages = '&Many Pages:';
  sdxZoomDlgPercent = 'P&ercent:';
  sdxZoomDlgPreview = ' Preview ';
  sdxZoomDlgFontPreview = ' 10pt Times New Romam ';
  sdxZoomDlgFontPreviewString = 'AaBbCcDdEeXxYyZz';

  { Select page X x Y }
  sdxPages = 'Pages';
  sdxCancel = 'Cancel';

  { preferences dialog }
  sdxPreferenceDlgCaption = 'Options';
  sdxPreferenceDlgTab1 = '&General';
  sdxPreferenceDlgTab2 = '';
  sdxPreferenceDlgTab3 = '';
  sdxPreferenceDlgTab4 = '';
  sdxPreferenceDlgTab5 = '';
  sdxPreferenceDlgTab6 = '';
  sdxPreferenceDlgTab7 = '';
  sdxPreferenceDlgTab8 = '';
  sdxPreferenceDlgTab9 = '';
  sdxPreferenceDlgTab10 = '';
  sdxPreferenceDlgShow = ' &Show ';
  sdxPreferenceDlgMargins = '&Margins ';
  sdxPreferenceDlgMarginsHints = 'Margins &Hints';
  sdxPreferenceDlgMargingWhileDragging = 'Margins Hints While &Dragging';
  sdxPreferenceDlgLargeBtns = '&Large Toolbar Buttons';
  sdxPreferenceDlgFlatBtns = '&Flat Toolbar Buttons';
  sdxPreferenceDlgMarginsColor = 'Margins &Color:';
  sdxPreferenceDlgMeasurementUnits = 'Measurement &Units:';
  sdxPreferenceDlgSaveForRunTimeToo = 'Save for &RunTime too';
  sdxPreferenceDlgZoomScroll = '&Zoom on roll with IntelliMouse';
  sdxPreferenceDlgZoomStep = 'Zoom Ste&p:';

  { page setup }
  sdxCloneStyleCaptionPrefix = 'Copy (%d) of ';
  sdxInvalideStyleCaption = 'The style name "%s" already exists. Please supply another name.';

  sdxPageSetupCaption = 'Page Setup';
  sdxStyleName = 'Style &Name:';

  sdxPage = '&Page';
  sdxMargins = '&Margins';
  sdxHeaderFooter = '&Header\Footer';
  sdxScaling = '&Scaling';

  sdxPaper = ' Paper ';
  sdxPaperType = 'T&ype';
  sdxPaperDimension = 'Dimension';
  sdxPaperWidth = '&Width:';
  sdxPaperHeight = 'H&eight:';
  sdxPaperSource = 'Paper so&urce';

  sdxOrientation = ' Orientation ';
  sdxPortrait = 'P&ortrait';
  sdxLandscape = '&Landscape';
  sdxPrintOrder = ' Print Order ';
  sdxDownThenOver = '&Down, then over';
  sdxOverThenDown = 'O&ver, then down';
  sdxShading = ' Shading ';
  sdxPrintUsingGrayShading = 'Print using &gray shading';

  sdxCenterOnPage = 'Center on page';
  sdxHorizontally = 'Hori&zontally';
  sdxVertically = '&Vertically';

  sdxHeader = 'Header ';
  sdxBtnHeaderFont = '&Font...';
  sdxBtnHeaderBackground = '&Background';
  sdxFooter = 'Footer ';
  sdxBtnFooterFont = 'Fo&nt...';
  sdxBtnFooterBackground = 'Back&ground';

  sdxTop = '&Top:';
  sdxLeft = '&Left:';
  sdxRight = 'Ri&ght:';
  sdxBottom = '&Bottom:';
  sdxHeader2 = 'H&eader:';
  sdxFooter2 = 'Foote&r:';

  sdxAlignment = 'Alignment';
  sdxVertAlignment = ' Vertical Alignment ';
  sdxReverseOnEvenPages = '&Reverse on even pages';

  sdxAdjustTo = '&Adjust To:';
  sdxFitTo = '&Fit To:';
  sdxPercentOfNormalSize = '% normal size';
  sdxPagesWideBy = 'page(s) &wide by';
  sdxTall = '&tall';

  sdxOf = 'Of';
  sdxLastPrinted = 'Last Printed';
  sdxFileName = 'Filename';
  sdxFileNameAndPath = 'Filename and path';
  sdxPrintedBy = 'Printed By';
  sdxPrintedOn = 'Printed On';
  sdxCreatedBy = 'Created By';
  sdxCreatedOn = 'Created On';

  { HF function }
  sdxHFFunctionNameUnknown = 'Unknown';
  sdxHFFunctionNamePageNumber = 'Page Number';
  sdxHFFunctionNameTotalPages = 'Total Pages';
  sdxHFFunctionNamePageOfPages = 'Page # of Pages #';
  sdxHFFunctionNameDateTime = 'Date and Time';
  sdxHFFunctionNameDate = 'Date';
  sdxHFFunctionNameTime = 'Time';
  sdxHFFunctionNameUserName = 'User Name';
  sdxHFFunctionNameMachineName = 'Machine Name';

  sdxHFFunctionHintPageNumber = 'Page Number';
  sdxHFFunctionHintTotalPages = 'Total Pages';
  sdxHFFunctionHintPageOfPages = 'Page # of Pages #';
  sdxHFFunctionHintDateTime = 'Date and Time Printed';
  sdxHFFunctionHintDate = 'Date Printed';
  sdxHFFunctionHintTime = 'Time Printed';
  sdxHFFunctionHintUserName = 'User Name';
  sdxHFFunctionHintMachineName = 'Machine Name';

  sdxHFFunctionTemplatePageNumber = 'Page #';
  sdxHFFunctionTemplateTotalPages = 'Total Pages';
  sdxHFFunctionTemplatePageOfPages = 'Page # of Pages #';
  sdxHFFunctionTemplateDateTime = 'Date & Time Printed';
  sdxHFFunctionTemplateDate = 'Date Printed';
  sdxHFFunctionTemplateTime = 'Time Printed';
  sdxHFFunctionTemplateUserName = 'User Name';
  sdxHFFunctionTemplateMachineName = 'Machine Name';

  { Designer strings }
  
  { months }
  sdxJanuary = 'January';
  sdxFebruary = 'February';
  sdxMarch = 'March';
  sdxApril = 'April';
  sdxMay = 'May';
  sdxJune = 'June';
  sdxJuly = 'July';
  sdxAugust = 'August';
  sdxSeptember = 'September';
  sdxOctober = 'October';
  sdxNovember = 'November';
  sdxDecember = 'December';

  { world sides}
  sdxEast = 'East';
  sdxWest = 'West';
  sdxSouth = 'South';
  sdxNorth = 'North';

  sdxTotal = 'Total';

  { dxFlowChart }
  sdxPlan = 'Plan';
  sdxSwimmingPool = 'Swimming-pool';
  sdxAdministration = 'Administration';
  sdxPark = 'Park';
  sdxCarParking = 'Car-Parking';

  { dxOrgChart }
  sdxCorporateHeadquarters = 'Corporate' + #13#10 + 'Headquarters';
  sdxSalesAndMarketing = 'Sales and' + #13#10 + 'Marketing';
  sdxEngineering = 'Engineering';
  sdxFieldOfficeCanada = 'Field Office:' + #13#10 + 'Canada';

  { Master View }
  sdxOrderNoCaption = 'OrderNo';
  sdxNameCaption = 'Name';
  sdxCountCaption = 'Count';
  sdxCompanyCaption = 'Company';
  sdxAddressCaption = 'Address';
  sdxPriceCaption = 'Price';
  sdxCashCaption = 'Cash';

  sdxName1 = 'Jennie Valentine';
  sdxName2 = 'Sam Hill';
  sdxCompany1 = 'Jennie Inc.';
  sdxCompany2 = 'Daimler-Chrysler AG';
  sdxAddress1 = '123 Home Lane';
  sdxAddress2 = '9333 Holmes Dr.';

  { TreeList }
  sdxCountIs = 'Count is: %d';
  sdxRegular = 'Regular';
  sdxIrregular = 'Irregular';

  sdxTLBand = 'Item Data';
  sdxTLColumnName = 'Name';
  sdxTLColumnAxisymmetric = 'Axisymmetric';
  sdxTLColumnItemShape = 'Shape';

  sdxItemShapeAsText = '(Graphic)';

  sdxItem1Name = 'Cone';
  sdxItem2Name = 'Cylinder';
  sdxItem3Name = 'Pyramid';
  sdxItem4Name = 'Box';
  sdxItem5Name = 'Free Surface';

  sdxItem1Description = '';
  sdxItem2Description = 'Axisymmetric geometry figure';
  sdxItem3Description = 'Axisymmetric geometry figure';
  sdxItem4Description = 'Acute-angled geometry figure';
  sdxItem5Description = '';
  sdxItem6Description = '';
  sdxItem7Description = 'Simple extrusion surface';

implementation

end.
