unit fuQExport3XLSEditor;

{$I VerCtrl.inc}

interface

uses
  Windows, Messages, SysUtils, {$IFDEF VCL6}Variants,{$ENDIF} Classes,
  Graphics, Controls, Forms, Dialogs, QExport3XLS, ComCtrls, StdCtrls,
  ExtCtrls{$IFDEF VCL4}, ImgList{$ENDIF}, ToolWin, QExport3, Buttons,
  QExport3Common, Menus, Grids, {$IFNDEF VCL6}DsgnIntf{$ELSE}DesignIntf{$ENDIF};

type
  TfmQExport3XLSEditor = class(TForm)
    paSheets: TPanel;
    paButtons: TPanel;
    bOk: TButton;
    bCancel: TButton;
    lvSheets: TListView;
    tbSheets: TToolBar;
    tbtSheetAdd: TToolButton;
    tbtSheetDel: TToolButton;
    ilMain: TImageList;
    ilListView: TImageList;
    tbtSheetUp: TToolButton;
    tbtSeparator_01: TToolButton;
    tbtSheetDown: TToolButton;
    pcFormats: TPageControl;
    tsFieldFormats: TTabSheet;
    lvFieldFormats: TListView;
    tbFieldFormats: TToolBar;
    tsOptions: TTabSheet;
    lvOptions: TListView;
    tsStyles: TTabSheet;
    lvStyles: TListView;
    tbStyles: TToolBar;
    tbtStyleAdd: TToolButton;
    tbtStyleDel: TToolButton;
    tbtSeparator_02: TToolButton;
    tbtStyleUp: TToolButton;
    tbtStyleDown: TToolButton;
    rgStripType: TRadioGroup;
    tbtSheetEdit: TToolButton;
    Panel1: TPanel;
    bXLSResetItem: TSpeedButton;
    bXLSResetAll: TSpeedButton;
    pcSheetOptions: TPageControl;
    tsSheetCommon: TTabSheet;
    bvSheetCommon: TBevel;
    chAllowCaptions: TCheckBox;
    chGoToFirstRecord: TCheckBox;
    chAutoCalcStrType: TCheckBox;
    laSkipRecCount_01: TLabel;
    edSkipRecCount: TEdit;
    laExportRecCount_02: TLabel;
    edExportRecCount: TEdit;
    tsHeader: TTabSheet;
    bvHeader: TBevel;
    rbExportAll: TRadioButton;
    rbExportOnly: TRadioButton;
    laSkipRecCount_02: TLabel;
    laStartDataCol: TLabel;
    edStartDataCol: TEdit;
    rbAllHeaderRows: TRadioButton;
    rbOnlyHeaderRows: TRadioButton;
    edHeaderRowCount: TEdit;
    laHeaderRowCount_02: TLabel;
    mmHeader: TMemo;
    tsFooter: TTabSheet;
    rbAllFooterRows: TRadioButton;
    rbOnlyFooterRows: TRadioButton;
    edFooterRowCount: TEdit;
    laFooterRowCount_02: TLabel;
    mmFooter: TMemo;
    bvFooter: TBevel;
    tsFormats: TTabSheet;
    bvFormats: TBevel;
    laIntegerFormat: TLabel;
    edIntegerFormat: TEdit;
    laDateFormat: TLabel;
    edDateFormat: TEdit;
    laDateTimeFormat: TLabel;
    edDateTimeFormat: TEdit;
    laBooleanTrue: TLabel;
    edBooleanTrue: TEdit;
    laNullString: TLabel;
    edNullString: TEdit;
    laBooleanFalse: TLabel;
    edBooleanFalse: TEdit;
    laCurrencyFormat: TLabel;
    edCurrencyFormat: TEdit;
    laTimeFormat: TLabel;
    edTimeFormat: TEdit;
    laFloatFormat: TLabel;
    edFloatFormat: TEdit;
    tbtDownloadDataFormat: TToolButton;
    pmHeaderFooter: TPopupMenu;
    miInsetTab: TMenuItem;
    bResetFormats: TSpeedButton;
    miClear: TMenuItem;
    tbtSeparator_04: TToolButton;
    tbtUploadDataFormat: TToolButton;
    paCommon: TPanel;
    laFileName: TLabel;
    edFileName: TEdit;
    chShowFile: TCheckBox;
    chPrintFile: TCheckBox;
    Bevel18: TBevel;
    bBrowse: TSpeedButton;
    sdFileName: TSaveDialog;
    tbtAddFieldFormat: TToolButton;
    tbtDelFieldFormat: TToolButton;
    tbtEditFieldFormat: TToolButton;
    tsFields: TTabSheet;
    chOnlyVisibleFields: TCheckBox;
    Bevel15: TBevel;
    laCaptionRow: TLabel;
    edCaptionRow: TEdit;
    pcFields: TPageControl;
    tsExportedFields: TTabSheet;
    tsFieldCaptions: TTabSheet;
    tsFieldWidths: TTabSheet;
    tsFormat: TTabSheet;
    mmExportedFields: TMemo;
    mmFieldCaptions: TMemo;
    mmFieldWidths: TMemo;
    mmFieldFormats: TMemo;
    chAutoCalcColWidth: TCheckBox;
    paFormats: TPanel;
    pcFormats1: TPageControl;
    tsStandardFormat: TTabSheet;
    tsNoteFormat: TTabSheet;
    pcXLSDataFormat: TPageControl;
    tsXLSFont: TTabSheet;
    Bevel11: TBevel;
    laXLSFont: TLabel;
    laXLSFontSize: TLabel;
    Bevel4: TBevel;
    btnFontColor: TSpeedButton;
    Bevel5: TBevel;
    btnFontBold: TSpeedButton;
    btnFontItalic: TSpeedButton;
    btnFontStrikeOut: TSpeedButton;
    Bevel6: TBevel;
    btnUnderlineSingle: TSpeedButton;
    btnUnderlineSingleAccounting: TSpeedButton;
    btnUnderlineDouble: TSpeedButton;
    btnUnderlineDoubleAccounting: TSpeedButton;
    Bevel3: TBevel;
    btnHorizontalLeft: TSpeedButton;
    btnHorizontalCenter: TSpeedButton;
    btnHorizontalRight: TSpeedButton;
    btnHorizontalFill: TSpeedButton;
    Bevel8: TBevel;
    btnVerticalTop: TSpeedButton;
    btnVerticalCenter: TSpeedButton;
    btnVerticalBottom: TSpeedButton;
    pbFontColor: TPaintBox;
    cbXLSFont: TComboBox;
    cbXLSFontSize: TComboBox;
    tsXLSBorders: TTabSheet;
    Bevel7: TBevel;
    Bevel10: TBevel;
    Bevel9: TBevel;
    btnBorderTop: TSpeedButton;
    btnBorderBottom: TSpeedButton;
    btnBorderLeft: TSpeedButton;
    btnBorderRight: TSpeedButton;
    btnBorderTopColor: TSpeedButton;
    pbBorderTop: TPaintBox;
    btnBorderBottomColor: TSpeedButton;
    pbBorderBottom: TPaintBox;
    btnBorderLeftColor: TSpeedButton;
    pbBorderLeft: TPaintBox;
    btnBorderRightColor: TSpeedButton;
    pbBorderRight: TPaintBox;
    cbBorderTop: TComboBox;
    cbBorderBottom: TComboBox;
    cbBorderLeft: TComboBox;
    cbBorderRight: TComboBox;
    tsXLSFill: TTabSheet;
    Bevel1: TBevel;
    btnFillBackground: TSpeedButton;
    pbFillBackground: TPaintBox;
    btnFillForeground: TSpeedButton;
    pbFillForeground: TPaintBox;
    cbPattern: TComboBox;
    tsXLSAggregate: TTabSheet;
    Bevel2: TBevel;
    rgXLSFunction: TRadioGroup;
    pcXLSNotes: TPageControl;
    tsXLSNoteBase: TTabSheet;
    bvXLSNoteBase: TBevel;
    laXLSNoteRow: TLabel;
    laXLSNoteCol: TLabel;
    laXLSNoteLines: TLabel;
    edXLSNoteRow: TEdit;
    edXLSNoteCol: TEdit;
    mmXLSNoteLines: TMemo;
    tsXLSNoteFill: TTabSheet;
    bvXLSNoteFill: TBevel;
    bvXLSNoteFillColors: TBevel;
    btnXLSNoteBackgroundColor: TSpeedButton;
    pbXLSNoteBackgroundColor: TPaintBox;
    btnXLSNoteForegroundColor: TSpeedButton;
    pbXLSNoteForegroundColor: TPaintBox;
    laXLSNoteTransparency: TLabel;
    laXLSNoteTransparencyStart: TLabel;
    laXLSNoteTransparencyFinish: TLabel;
    gbXLSNoteFillType: TGroupBox;
    rbXLSNoteFillSolid: TRadioButton;
    rbXLSNoteFillGradient: TRadioButton;
    paXLSNoteFillGradient: TPanel;
    rbXLSNoteGradientHorizontal: TRadioButton;
    rbXLSNoteGradientVertical: TRadioButton;
    rbXLSNoteGradientDiagonalUp: TRadioButton;
    rbXLSNoteGradientDiagonalDown: TRadioButton;
    rbXLSNoteGradientFromCorner: TRadioButton;
    rbXLSNoteGradientFromCenter: TRadioButton;
    trXLSNoteTransparency: TTrackBar;
    tsExtensions: TTabSheet;
    tbExtensions: TToolBar;
    tbtAddExtension: TToolButton;
    tbtDelExtension: TToolButton;
    tvExtensions: TTreeView;
    ColorDialog: TColorDialog;
    tsHyperlinkFormat: TTabSheet;
    pcXLSHyperlinks: TPageControl;
    tsXLSHyperlinkBase: TTabSheet;
    bvXLSHyperlinkBase: TBevel;
    laXLSHyperlinkCol: TLabel;
    edXLSHyperlinkCol: TEdit;
    laXLSHyperlinkRow: TLabel;
    edXLSHyperlinkRow: TEdit;
    rgXLSHyperlinkStyle: TRadioGroup;
    laXLSHyperlinkTitle: TLabel;
    edXLSHyperlinkTitle: TEdit;
    laXLSHyperlinkTarget: TLabel;
    edXLSHyperlinkTarget: TEdit;
    tsChartFormat: TTabSheet;
    pcXLSCharts: TPageControl;
    tsXLSChartBase: TTabSheet;
    bvXLSChartBase: TBevel;
    laXLSChartTitle: TLabel;
    edXLSChartTitle: TEdit;
    laXLSChartStyle: TLabel;
    cbXLSChartStyle: TComboBox;
    rgXLSChartLegendPosition: TRadioGroup;
    chXLSChartShowLegend: TCheckBox;
    chXLSChartAutoColor: TCheckBox;
    tsXLSChartPosition: TTabSheet;
    bvXLSChartPosition: TBevel;
    gbXLSChartPosition2: TGroupBox;
    laXLSChartLeft: TLabel;
    laXLSChartHeight: TLabel;
    laXLSChartTop: TLabel;
    laXLSChartWidth: TLabel;
    edXLSChartLeft: TEdit;
    edXLSChartHeight: TEdit;
    edXLSChartTop: TEdit;
    edXLSChartWidth: TEdit;
    tsXLSChartCategoryLabels: TTabSheet;
    bvXLSChartCategoryLabels: TBevel;
    rbXLSChartCategoryLabelColumn: TRadioButton;
    cbXLSChartCategoryLabelColumn: TComboBox;
    rbXLSChartCategoryLabelCustom: TRadioButton;
    gbXLSChartCustomCategoryLabel: TGroupBox;
    laXLSChartCategoryLabelsCol1: TLabel;
    edXLSChartCategoryLabelsCol1: TEdit;
    laXLSChartCategoryLabelsCol2: TLabel;
    edXLSChartCategoryLabelsCol2: TEdit;
    laXLSChartCategoryLabelsRow1: TLabel;
    edXLSChartCategoryLabelsRow1: TEdit;
    laXLSChartCategoryLabelsRow2: TLabel;
    edXLSChartCategoryLabelsRow2: TEdit;
    tsSeriesFormat: TTabSheet;
    pcXLSSeries: TPageControl;
    tsXLSSeriesBase: TTabSheet;
    BVXLSSeriesBase: TBevel;
    laXLSSeriesTitle: TLabel;
    edXLSSeriesTitle: TEdit;
    gbXLSSeriesDataRange: TGroupBox;
    laXLSSeriesDataRangeCol1: TLabel;
    laXLSSeriesDataRangeRow1: TLabel;
    laXLSSeriesDataRangeCol2: TLabel;
    laXLSSeriesDataRangeRow2: TLabel;
    edXLSSeriesDataRangeCol1: TEdit;
    edXLSSeriesDataRangeRow1: TEdit;
    edXLSSeriesDataRangeCol2: TEdit;
    edXLSSeriesDataRangeRow2: TEdit;
    rbXLSSeriesColumn: TRadioButton;
    cbXLSSeriesColumn: TComboBox;
    rbXLSSeriesCustom: TRadioButton;
    gbXLSChartPosition1: TGroupBox;
    rbXLSChartAutoPosition: TRadioButton;
    laXLSChartPlacement: TLabel;
    cbXLSChartPlacement: TComboBox;
    rbXLSChartCustomPosition: TRadioButton;
    tsCellFormat: TTabSheet;
    pcXLSCells: TPageControl;
    tsXLSCellBase: TTabSheet;
    bvXLSCellBase: TBevel;
    laXLSCellCol: TLabel;
    laXLSCellRow: TLabel;
    laXLSCellType: TLabel;
    laXLSCellValue: TLabel;
    laXLSCellDateTimeFormat: TLabel;
    laXLSCellNumericFormat: TLabel;
    edXLSCellCol: TEdit;
    edXLSCellRow: TEdit;
    cbXLSCellType: TComboBox;
    edXLSCellValue: TEdit;
    edXLSCellDateTimeFormat: TEdit;
    edXLSCellNumericFormat: TEdit;
    tsMergedCellFormat: TTabSheet;
    pcXLSMergedCells: TPageControl;
    tsXLSMergedCellBase: TTabSheet;
    bvXLSMergedCellBase: TBevel;
    laXLSMergedCellsFirstCol: TLabel;
    edXLSMergedCellsFirstCol: TEdit;
    laXLSMergedCellsFirstRow: TLabel;
    edXLSMergedCellsFirstRow: TEdit;
    laXLSMergedCellsLastCol: TLabel;
    edXLSMergedCellsLastCol: TEdit;
    laXLSMergedCellsLastRow: TLabel;
    edXLSMergedCellsLastRow: TEdit;
    procedure FormShow(Sender: TObject);
    procedure tbtSheetEditClick(Sender: TObject);
    procedure lvSheetsDeletion(Sender: TObject; Item: TListItem);
    procedure tbtSheetDelClick(Sender: TObject);
    procedure tbtSheetUpClick(Sender: TObject);
    procedure tbtSheetDownClick(Sender: TObject);
    procedure lvStylesChange(Sender: TObject; Item: TListItem;
      Change: TItemChange);
    procedure tbtSheetAddClick(Sender: TObject);
    procedure tbtStyleUpClick(Sender: TObject);
    procedure tbtStyleDownClick(Sender: TObject);
    procedure cbXLSFontChange(Sender: TObject);
    procedure cbXLSFontSizeChange(Sender: TObject);
    procedure btnFontColorClick(Sender: TObject);
    procedure btnFontColorMouseDown(Sender: TObject; Button: TMouseButton;
      Shift: TShiftState; X, Y: Integer);
    procedure btnFontColorMouseUp(Sender: TObject; Button: TMouseButton;
      Shift: TShiftState; X, Y: Integer);
    procedure pbFontColorPaint(Sender: TObject);
    procedure btnFontBoldClick(Sender: TObject);
    procedure btnFontItalicClick(Sender: TObject);
    procedure btnFontStrikeOutClick(Sender: TObject);
    procedure btnUnderlineSingleClick(Sender: TObject);
    procedure btnUnderlineSingleAccountingClick(Sender: TObject);
    procedure btnUnderlineDoubleClick(Sender: TObject);
    procedure btnUnderlineDoubleAccountingClick(Sender: TObject);
    procedure btnHorizontalLeftClick(Sender: TObject);
    procedure btnHorizontalCenterClick(Sender: TObject);
    procedure btnHorizontalRightClick(Sender: TObject);
    procedure btnHorizontalFillClick(Sender: TObject);
    procedure btnVerticalTopClick(Sender: TObject);
    procedure btnVerticalCenterClick(Sender: TObject);
    procedure btnVerticalBottomClick(Sender: TObject);
    procedure btnBorderTopClick(Sender: TObject);
    procedure btnBorderBottomClick(Sender: TObject);
    procedure btnBorderLeftClick(Sender: TObject);
    procedure btnBorderRightClick(Sender: TObject);
    procedure cbBorderTopChange(Sender: TObject);
    procedure cbBorderTopDrawItem(Control: TWinControl; Index: Integer;
      Rect: TRect; State: TOwnerDrawState);
    procedure cbBorderBottomChange(Sender: TObject);
    procedure cbBorderBottomDrawItem(Control: TWinControl; Index: Integer;
      Rect: TRect; State: TOwnerDrawState);
    procedure cbBorderLeftChange(Sender: TObject);
    procedure cbBorderLeftDrawItem(Control: TWinControl; Index: Integer;
      Rect: TRect; State: TOwnerDrawState);
    procedure cbBorderRightChange(Sender: TObject);
    procedure cbBorderRightDrawItem(Control: TWinControl; Index: Integer;
      Rect: TRect; State: TOwnerDrawState);
    procedure btnBorderTopColorClick(Sender: TObject);
    procedure btnBorderTopColorMouseDown(Sender: TObject;
      Button: TMouseButton; Shift: TShiftState; X, Y: Integer);
    procedure btnBorderTopColorMouseUp(Sender: TObject;
      Button: TMouseButton; Shift: TShiftState; X, Y: Integer);
    procedure pbBorderTopPaint(Sender: TObject);
    procedure btnBorderBottomColorClick(Sender: TObject);
    procedure btnBorderBottomColorMouseDown(Sender: TObject;
      Button: TMouseButton; Shift: TShiftState; X, Y: Integer);
    procedure btnBorderBottomColorMouseUp(Sender: TObject;
      Button: TMouseButton; Shift: TShiftState; X, Y: Integer);
    procedure pbBorderBottomPaint(Sender: TObject);
    procedure btnBorderLeftColorClick(Sender: TObject);
    procedure btnBorderLeftColorMouseDown(Sender: TObject;
      Button: TMouseButton; Shift: TShiftState; X, Y: Integer);
    procedure btnBorderLeftColorMouseUp(Sender: TObject;
      Button: TMouseButton; Shift: TShiftState; X, Y: Integer);
    procedure pbBorderLeftPaint(Sender: TObject);
    procedure btnBorderRightColorClick(Sender: TObject);
    procedure btnBorderRightColorMouseDown(Sender: TObject;
      Button: TMouseButton; Shift: TShiftState; X, Y: Integer);
    procedure btnBorderRightColorMouseUp(Sender: TObject;
      Button: TMouseButton; Shift: TShiftState; X, Y: Integer);
    procedure pbBorderRightPaint(Sender: TObject);
    procedure btnFillBackgroundClick(Sender: TObject);
    procedure btnFillBackgroundMouseDown(Sender: TObject;
      Button: TMouseButton; Shift: TShiftState; X, Y: Integer);
    procedure btnFillBackgroundMouseUp(Sender: TObject;
      Button: TMouseButton; Shift: TShiftState; X, Y: Integer);
    procedure pbFillBackgroundPaint(Sender: TObject);
    procedure cbPatternChange(Sender: TObject);
    procedure cbPatternDrawItem(Control: TWinControl; Index: Integer;
      Rect: TRect; State: TOwnerDrawState);
    procedure btnFillForegroundClick(Sender: TObject);
    procedure btnFillForegroundMouseDown(Sender: TObject;
      Button: TMouseButton; Shift: TShiftState; X, Y: Integer);
    procedure btnFillForegroundMouseUp(Sender: TObject;
      Button: TMouseButton; Shift: TShiftState; X, Y: Integer);
    procedure pbFillForegroundPaint(Sender: TObject);
    procedure rgXLSFunctionClick(Sender: TObject);
    procedure pbXLSCellPaint(Sender: TObject);
    procedure lvOptionsChange(Sender: TObject; Item: TListItem;
      Change: TItemChange);
    procedure pcFormatsChange(Sender: TObject);
    procedure chAllowCaptionsClick(Sender: TObject);
    procedure chGoToFirstRecordClick(Sender: TObject);
    procedure chAutoCalcStrTypeClick(Sender: TObject);
    procedure NumericEditKeyPress(Sender: TObject; var Key: Char);
    procedure rbExportOnlyClick(Sender: TObject);
    procedure rbExportAllClick(Sender: TObject);
    procedure rbAllHeaderRowsClick(Sender: TObject);
    procedure rbOnlyHeaderRowsClick(Sender: TObject);
    procedure mmHeaderChange(Sender: TObject);
    procedure rbAllFooterRowsClick(Sender: TObject);
    procedure rbOnlyFooterRowsClick(Sender: TObject);
    procedure mmFooterChange(Sender: TObject);
    procedure edIntegerFormatChange(Sender: TObject);
    procedure edFloatFormatChange(Sender: TObject);
    procedure edDateFormatChange(Sender: TObject);
    procedure edTimeFormatChange(Sender: TObject);
    procedure edDateTimeFormatChange(Sender: TObject);
    procedure edCurrencyFormatChange(Sender: TObject);
    procedure edBooleanTrueChange(Sender: TObject);
    procedure edBooleanFalseChange(Sender: TObject);
    procedure edNullStringChange(Sender: TObject);
    procedure tbtDownloadDataFormatClick(Sender: TObject);
    procedure tbtStyleAddClick(Sender: TObject);
    procedure tbtStyleDelClick(Sender: TObject);
    procedure bXLSResetAllClick(Sender: TObject);
    procedure bXLSResetItemClick(Sender: TObject);
    procedure ListViewKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure miInsetTabClick(Sender: TObject);
    procedure bResetFormatsClick(Sender: TObject);
    procedure miClearClick(Sender: TObject);
    procedure tbtUploadDataFormatClick(Sender: TObject);
    procedure bBrowseClick(Sender: TObject);
    procedure rgStripTypeClick(Sender: TObject);
    procedure lvSheetsDblClick(Sender: TObject);
    procedure tbtAddFieldFormatClick(Sender: TObject);
    procedure tbtDelFieldFormatClick(Sender: TObject);
    procedure tbtEditFieldFormatClick(Sender: TObject);
    procedure lvFieldFormatsDblClick(Sender: TObject);
    procedure tcFieldsChange(Sender: TObject);
    procedure mmFieldsChange(Sender: TObject);
    procedure chOnlyVisibleFieldsClick(Sender: TObject);
    procedure mmExportedFieldsChange(Sender: TObject);
    procedure mmFieldCaptionsChange(Sender: TObject);
    procedure mmFieldWidthsChange(Sender: TObject);
    procedure mmFieldFormatsChange(Sender: TObject);
    procedure chAutoCalcColWidthClick(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure FormDestroy(Sender: TObject);
    procedure lvSheetsChange(Sender: TObject; Item: TListItem;
      Change: TItemChange);
    procedure edSkipRecCountExit(Sender: TObject);
    procedure edExportRecCountExit(Sender: TObject);
    procedure edStartDataColExit(Sender: TObject);
    procedure edCaptionRowExit(Sender: TObject);
    procedure edHeaderRowCountExit(Sender: TObject);
    procedure edFooterRowCountExit(Sender: TObject);
    procedure lvFieldFormatsChange(Sender: TObject; Item: TListItem;
      Change: TItemChange);
    procedure trXLSNoteTransparencyChange(Sender: TObject);
    procedure rbXLSNoteFillSolidClick(Sender: TObject);
    procedure rbXLSNoteFillGradientClick(Sender: TObject);
    procedure rbXLSNoteGradientHorizontalClick(Sender: TObject);
    procedure rbXLSNoteGradientVerticalClick(Sender: TObject);
    procedure rbXLSNoteGradientDiagonalUpClick(Sender: TObject);
    procedure rbXLSNoteGradientDiagonalDownClick(Sender: TObject);
    procedure rbXLSNoteGradientFromCornerClick(Sender: TObject);
    procedure rbXLSNoteGradientFromCenterClick(Sender: TObject);
    procedure btnXLSNoteBackgroundColorMouseDown(Sender: TObject;
      Button: TMouseButton; Shift: TShiftState; X, Y: Integer);
    procedure btnXLSNoteBackgroundColorMouseUp(Sender: TObject;
      Button: TMouseButton; Shift: TShiftState; X, Y: Integer);
    procedure btnXLSNoteBackgroundColorClick(Sender: TObject);
    procedure pbXLSNoteBackgroundColorPaint(Sender: TObject);
    procedure btnXLSNoteForegroundColorMouseDown(Sender: TObject;
      Button: TMouseButton; Shift: TShiftState; X, Y: Integer);
    procedure btnXLSNoteForegroundColorMouseUp(Sender: TObject;
      Button: TMouseButton; Shift: TShiftState; X, Y: Integer);
    procedure btnXLSNoteForegroundColorClick(Sender: TObject);
    procedure pbXLSNoteForegroundColorPaint(Sender: TObject);
    procedure tbtAddExtensionClick(Sender: TObject);
    procedure tbtDelExtensionClick(Sender: TObject);
    procedure tvExtensionsChange(Sender: TObject; Node: TTreeNode);
    procedure pcXLSDataFormatChange(Sender: TObject);
    procedure pcXLSNotesChange(Sender: TObject);
    procedure pcXLSHyperlinksChange(Sender: TObject);
    procedure edXLSHyperlinkColExit(Sender: TObject);
    procedure edXLSHyperlinkRowExit(Sender: TObject);
    procedure rgXLSHyperlinkStyleClick(Sender: TObject);
    procedure edXLSHyperlinkTitleChange(Sender: TObject);
    procedure edXLSHyperlinkTargetChange(Sender: TObject);
    procedure edXLSNoteColExit(Sender: TObject);
    procedure edXLSNoteRowExit(Sender: TObject);
    procedure mmXLSNoteLinesChange(Sender: TObject);
    procedure pcXLSChartsChange(Sender: TObject);
    procedure edXLSChartTitleChange(Sender: TObject);
    procedure cbXLSChartStyleChange(Sender: TObject);
    procedure rgXLSChartLegendPositionClick(Sender: TObject);
    procedure chXLSChartShowLegendClick(Sender: TObject);
    procedure chXLSChartAutoColorClick(Sender: TObject);
    procedure rbXLSChartAutoPositionClick(Sender: TObject);
    procedure cbXLSChartPlacementChange(Sender: TObject);
    procedure rbXLSChartCustomPositionClick(Sender: TObject);
    procedure edXLSChartLeftExit(Sender: TObject);
    procedure edXLSChartTopExit(Sender: TObject);
    procedure edXLSChartHeightExit(Sender: TObject);
    procedure edXLSChartWidthExit(Sender: TObject);
    procedure rbXLSChartCategoryLabelColumnClick(Sender: TObject);
    procedure cbXLSChartCategoryLabelColumnChange(Sender: TObject);
    procedure rbXLSChartCategoryLabelCustomClick(Sender: TObject);
    procedure edXLSChartCategoryLabelsCol1Exit(Sender: TObject);
    procedure edXLSChartCategoryLabelsCol2Exit(Sender: TObject);
    procedure edXLSChartCategoryLabelsRow1Exit(Sender: TObject);
    procedure edXLSChartCategoryLabelsRow2Exit(Sender: TObject);
    procedure pcXLSSeriesChange(Sender: TObject);
    procedure edXLSSeriesTitleChange(Sender: TObject);
    procedure rbXLSSeriesColumnClick(Sender: TObject);
    procedure cbXLSSeriesColumnChange(Sender: TObject);
    procedure rbXLSSeriesCustomClick(Sender: TObject);
    procedure edXLSSeriesDataRangeCol1Exit(Sender: TObject);
    procedure edXLSSeriesDataRangeCol2Exit(Sender: TObject);
    procedure edXLSSeriesDataRangeRow1Exit(Sender: TObject);
    procedure edXLSSeriesDataRangeRow2Exit(Sender: TObject);
    procedure pcXLSCellsChange(Sender: TObject);
    procedure pcXLSMergedCellsChange(Sender: TObject);
    procedure edXLSCellColExit(Sender: TObject);
    procedure edXLSCellRowExit(Sender: TObject);
    procedure cbXLSCellTypeChange(Sender: TObject);
    procedure edXLSCellValueChange(Sender: TObject);
    procedure edXLSCellDateTimeFormatChange(Sender: TObject);
    procedure edXLSCellNumericFormatChange(Sender: TObject);
    procedure edXLSMergedCellsFirstColExit(Sender: TObject);
    procedure edXLSMergedCellsFirstRowExit(Sender: TObject);
    procedure edXLSMergedCellsLastColExit(Sender: TObject);
    procedure edXLSMergedCellsLastRowExit(Sender: TObject);
  private
    FExportXLS: TQExport3XLS;
    FDesigner: {$IFNDEF VCL4}TFormDesigner
               {$ELSE}
                 {$IFNDEF VCL6}IFormDesigner
                 {$ELSE}IDesigner
                 {$ENDIF}
               {$ENDIF};

    FExportSourceList: TStringList;

    FLoading: boolean;
    FNeedSelected: boolean;

    FCurrSheet: TListItem;
    FCurrColumn: TListItem;
    FCurrOption: TListItem;
    FCurrStyle: TListItem;

    FHyperlinkNode: TTreeNode;
    FNoteNode: TTreeNode;
    FChartNode: TTreeNode;
    FCellNode: TTreeNode;
    FMergedCellNode: TTreeNode;

    FStandardFormatPageIndex: integer;
    FNoteFormatPageIndex: integer;
    FNotePageIndex: integer;
    FHyperlinkPageIndex: integer;
    FChartPageIndex: integer;
    FSeriesPageIndex: integer;
    FCellPageIndex: integer;
    FMergedCellPageIndex: integer;

    FCurrList: integer;
    FCurrFormat: integer;

    procedure ShowCurrSheet;

    procedure TuneSheetButtons;
    procedure TuneExportRecCount;
    procedure TuneHeader;
    procedure TuneFooter;
    procedure TuneFormats;
    procedure TuneXLSChartPosition;
    procedure TuneXLSChartCategoryLabel;
    procedure TuneXLSSeriesDataRange;

    function GetCurrFmtList: TListView;
    function GetCurrFmtItem: TxlsCustomItem;

    function GetCurrFont: TxlsFont;
    function GetCurrAlignment: TxlsAlignment;
    function GetCurrBorders: TxlsBorders;
    function GetCurrFill: TxlsFill;
    procedure SetCurrDefault;

    procedure ShowColumnButtons;
    procedure ShowStyleButtons;

    procedure LoadSheets;
    procedure SaveSheets;

    procedure SetFormatsActivePage(Value: TTabSheet);

    procedure FillLists(Sheet: TxlsSheet);
    procedure ClearLists;
    procedure FillExportSourceList;
    procedure AddExportSourceListItem(const S: string);
    procedure SetSheetExportSource(Sheet: TxlsSheet; Source: TComponent);
    procedure MoveListItemUp(ListView: TListView);
    procedure MoveListItemDown(ListView: TListView);
    procedure RenumStyles;
    function CurrentSheetMemo: TMemo;

    procedure XLSUpdateItemFont(Item: TxlsCustomItem);
    procedure XLSUpdateItemFontSize(Item: TxlsCustomItem);
    procedure XLSUpdateItemFontColor(Item: TxlsCustomItem);
    procedure XLSUpdateItemFontBold(Item: TxlsCustomItem);
    procedure XLSUpdateItemFontItalic(Item: TxlsCustomItem);
    procedure XLSUpdateItemFontStrikeOut(Item: TxlsCustomItem);
    procedure XLSUpdateItemFontUnderline(Item: TxlsCustomItem);
    procedure XLSUpdateItemHorAlignment(Item: TxlsCustomItem);
    procedure XLSUpdateItemVertAlignment(Item: TxlsCustomItem);
    procedure XLSUpdateItemBorderTop(Item: TxlsCustomItem);
    procedure XLSUpdateItemBorderTopColor(Item: TxlsCustomItem);
    procedure XLSUpdateItemBorderBottom(Item: TxlsCustomItem);
    procedure XLSUpdateItemBorderBottomColor(Item: TxlsCustomItem);
    procedure XLSUpdateItemBorderLeft(Item: TxlsCustomItem);
    procedure XLSUpdateItemBorderLeftColor(Item: TxlsCustomItem);
    procedure XLSUpdateItemBorderRight(Item: TxlsCustomItem);
    procedure XLSUpdateItemBorderRightColor(Item: TxlsCustomItem);
    procedure XLSUpdateItemFillPattern(Item: TxlsCustomItem);
    procedure XLSUpdateItemFillBackground(Item: TxlsCustomItem);
    procedure XLSUpdateItemFillForeground(Item: TxlsCustomItem);
    procedure XLSUpdateItemAggregate(Item: TxlsCustomItem);
    procedure XLSUpdateItemSetDefault(Item: TxlsCustomItem);

    procedure SheetAllowCaptions(Item: TListItem);
    procedure SheetGoToFirstRecord(Item: TListItem);
    procedure SheetOnlyVisibleFields(Item: TListItem);
    procedure SheetAutoCalcStrType(Item: TListItem);
    procedure SheetSkipRecCount(Item: TListItem);
    procedure SheetExportRecCount(Item: TListItem);
    procedure SheetStartDataCol(Item: TListItem);
    procedure SheetCaptionRow(Item: TListItem);
    procedure SheetHeaderRows(Item: TListItem);
    procedure SheetHeader(Item: TListItem);
    procedure SheetFooterRows(Item: TListItem);
    procedure SheetFooter(Item: TListItem);
    procedure SheetIntegerFormat(Item: TListItem);
    procedure SheetFloatFormat(Item: TListItem);
    procedure SheetDateFormat(Item: TListItem);
    procedure SheetTimeFormat(Item: TListItem);
    procedure SheetDateTimeFormat(Item: TListItem);
    procedure SheetCurrencyFormat(Item: TListItem);
    procedure SheetBooleanTrue(Item: TListItem);
    procedure SheetBooleanFalse(Item: TListItem);
    procedure SheetNullString(Item: TListItem);

    procedure SheetDeleteSelected(Item: TListItem);

    procedure StyleRenumber(Item: TListItem);
    procedure UnselectItem(Item: TListItem);
    procedure SelectItem(Item: TListItem);
    procedure DeleteItem(Item: TListItem);
    procedure SetSelectedToFocused(Item: TListItem);

    procedure DownloadDataFormat(Item: TListItem);
    procedure UploadDataFormat(Item: TListItem);

  public
    constructor Create(AOwner: TComponent); override;
    destructor Destroy; override;
  end;

function RunQExportXLSEditor(ExportXLS: TQExport3XLS;
  ADesigner: {$IFNDEF VCL4}TFormDesigner
             {$ELSE}
               {$IFNDEF VCL6}IFormDesigner
               {$ELSE}IDesigner
               {$ENDIF}
             {$ENDIF}): boolean;

implementation

uses {$IFDEF WIN32}QExport3StrIDs{$ENDIF}
     {$IFDEF LINUX}QExport3Consts{$ENDIF}, Db, DBGrids, fuQExport3SourceList,
     fuQExport3XLSColorEditor, QExport3XLSCommon, QExport3CustomSource, TypInfo;

{$R *.dfm}

const
  xlsUnknownFormat    = -1;
  xlsStandardFormat   = 0;
  xlsNoteFormat       = 1;
  xlsHyperlinkFormat  = 2;
  xlsChartFormat      = 3;
  xlsSeriesFormat     = 3;
  xlsCellFormat       = 4;
  xlsMergedCellFormat = 5;

  lstColumns = 0;
  lstOptions = 1;
  lstStyles  = 2;
  lstExtensions = 3;

  xlsHyperlink  = 7;
  xlsNote       = 8;
  xlsChart      = 9;
  xlsSeries     = 10;
  xlsCell       = 11;
  xlsMergedCell = 12;

function RunQExportXLSEditor(ExportXLS: TQExport3XLS;
  ADesigner: {$IFNDEF VCL4}TFormDesigner
             {$ELSE}
               {$IFNDEF VCL6}IFormDesigner
               {$ELSE}IDesigner
               {$ENDIF}
             {$ENDIF}): boolean;
var
  WasNoSheets: boolean;
begin
  Result := false;

  if not Assigned(ExportXLS) then
    raise Exception.Create('The QExportXLS parameter is not assigned!');

  with TfmQExport3XLSEditor.Create(nil) do
  try
    FExportXLS := ExportXLS;
    FDesigner := ADesigner;

    FillExportSourceList;

    WasNoSheets := FExportXLS.Sheets.Count = 0;
    try
      if WasNoSheets then
        FExportXLS.Sheets.Add.LoadFromQExportXLS;
      LoadSheets;
      Result := ShowModal = mrOk;
      if Result then
        SaveSheets;
      if WasNoSheets and (FExportXLS.Sheets.Count = 1) then begin
        FExportXLS.Sheets[0].SaveToQExportXLS;
        FExportXLS.Sheets.Clear;
      end;
    except
      if WasNoSheets then
        FExportXLS.Sheets.Clear;
      raise;
    end;
  finally
    Free;
  end;
end;

{ TfmQExport3XLSEditor }

constructor TfmQExport3XLSEditor.Create(AOwner: TComponent);
begin
  inherited;
  FExportSourceList := TStringList.Create;
  FLoading := false;
  FNeedSelected := false;
  cbXLSFont.Items.Assign(Screen.Fonts);

  FCurrSheet := nil;
  FCurrColumn := nil;
  FCurrOption := nil;
  FCurrStyle := nil;

  FStandardFormatPageIndex := 0;
  FNoteFormatPageIndex := 1;
  FNotePageIndex := 0;
  FHyperlinkPageIndex := 0;
  FChartPageIndex := 0;
  FSeriesPageIndex := 0;
  FCellPageIndex := 0;
  FMergedCellPageIndex := 0;

  FCurrFormat := xlsUnknownFormat;
  FCurrList := lstColumns;

  lvOptions.Items.BeginUpdate;
  try
    lvOptions.Items.Clear;
    lvOptions.Items.Add.Caption := {$IFDEF WIN32}QExportLoadStr(QED_XLS_Header){$ENDIF}
                                   {$IFDEF LINUX}QED_XLS_Header{$ENDIF};
    lvOptions.Items.Add.Caption := {$IFDEF WIN32}QExportLoadStr(QED_XLS_Caption){$ENDIF}
                                   {$IFDEF LINUX}QED_XLS_Caption{$ENDIF};
    lvOptions.Items.Add.Caption := {$IFDEF WIN32}QExportLoadStr(QED_XLS_Data){$ENDIF}
                                   {$IFDEF LINUX}QED_XLS_Data{$ENDIF};
    lvOptions.Items.Add.Caption := {$IFDEF WIN32}QExportLoadStr(QED_XLS_Aggregate){$ENDIF}
                                   {$IFDEF LINUX}QED_XLS_Aggregate{$ENDIF};
    lvOptions.Items.Add.Caption := {$IFDEF WIN32}QExportLoadStr(QED_XLS_Footer){$ENDIF}
                                   {$IFDEF LINUX}QED_XLS_Footer{$ENDIF};
    lvOptions.Items.Add.Caption := {$IFDEF WIN32}QExportLoadStr(QED_XLS_Hyperlink){$ENDIF}
                                   {$IFDEF LINUX}QED_XLS_Hyperlink{$ENDIF};
    lvOptions.Items.Add.Caption := {$IFDEF WIN32}QExportLoadStr(QED_XLS_Note){$ENDIF}
                                   {$IFDEF LINUX}QED_XLS_Note{$ENDIF};

    lvOptions.Items[0].Focused := true;
    lvOptions.Items[0].Selected := true;
  finally
    lvOptions.Items.EndUpdate;
  end;
end;

destructor TfmQExport3XLSEditor.Destroy;
begin
  FExportSourceList.Free;
  inherited;
end;

procedure TfmQExport3XLSEditor.TuneSheetButtons;
begin
  tbtSheetEdit.Enabled := Assigned(lvSheets.ItemFocused);
  tbtSheetDel.Enabled := Assigned(lvSheets.ItemFocused) or
    (lvSheets.SelCount > 0);
  tbtSheetUp.Enabled := Assigned(lvSheets.ItemFocused) and
    (lvSheets.ItemFocused.Index > 0);
  tbtSheetDown.Enabled := Assigned(lvSheets.ItemFocused) and
    (lvSheets.ItemFocused.Index < lvSheets.Items.Count - 1);
end;

procedure TfmQExport3XLSEditor.TuneExportRecCount;
begin
  edExportRecCount.Enabled := rbExportOnly.Checked;
  laExportRecCount_02.Enabled := rbExportOnly.Checked;
end;

procedure TfmQExport3XLSEditor.TuneHeader;
begin
  edHeaderRowCount.Enabled := rbOnlyHeaderRows.Checked;
  laHeaderRowCount_02.Enabled := rbOnlyHeaderRows.Checked;
end;

procedure TfmQExport3XLSEditor.TuneFooter;
begin
  edFooterRowCount.Enabled := rbOnlyFooterRows.Checked;
  laFooterRowCount_02.Enabled := rbOnlyFooterRows.Checked;
end;

procedure TfmQExport3XLSEditor.TuneFormats;
var
  AssignedData: boolean;

  Fnt: TxlsFont;
  Algn: TxlsAlignment;
  Brdrs: TxlsBorders;
  Fill: TxlsFill;

  Item: TxlsCustomItem;
  Event: TNotifyEvent;

  i: integer;
begin
  Item := GetCurrFmtItem;

  case FCurrList of
    lstColumns: begin
      SetFormatsActivePage(tsStandardFormat);
      FCurrFormat := xlsStandardFormat;

      tsXLSFont.PageControl := pcXLSDataFormat;
      tsXLSBorders.PageControl := pcXLSDataFormat;
      tsXLSFill.PageControl := pcXLSDataFormat;

      tsXLSFont.PageIndex := 0;
      tsXLSBorders.PageIndex := 1;
      tsXLSFill.PageIndex := 2;

      pcXLSDataFormat.ActivePage :=
        pcXLSDataFormat.Pages[FStandardFormatPageIndex];
    end;
    lstOptions:
      case Item.ItemType of
        itNoteFormat: begin
          SetFormatsActivePage(tsNoteFormat);
          if tsXLSNoteBase.TabVisible then
            tsXLSNoteBase.TabVisible := false;
          FCurrFormat := xlsNoteFormat;

          tsXLSFont.PageControl := pcXLSNotes;

          tsXLSNoteBase.PageIndex := 0;
          tsXLSFont.PageIndex := 1;
          tsXLSNoteFill.PageIndex := 2;

          //if not pcXLSNotes.Pages[FNoteFormatPageIndex].Visible then
            //FNoteFormatPageIndex := 1;

          pcXLSNotes.ActivePage :=
            pcXLSNotes.Pages[FNoteFormatPageIndex];
        end;
        itFormat: begin
          SetFormatsActivePage(tsStandardFormat);
          FCurrFormat := xlsStandardFormat;

          tsXLSFont.PageControl := pcXLSDataFormat;
          tsXLSBorders.PageControl := pcXLSDataFormat;
          tsXLSFill.PageControl := pcXLSDataFormat;

          tsXLSFont.PageIndex := 0;
          tsXLSBorders.PageIndex := 1;
          tsXLSFill.PageIndex := 2;

          if not pcXLSDataFormat.Pages[FStandardFormatPageIndex].Visible then
            FStandardFormatPageIndex := 0;

          pcXLSDataFormat.ActivePage :=
            pcXLSDataFormat.Pages[FStandardFormatPageIndex];
        end;
      end;
    lstStyles: begin
      SetFormatsActivePage(tsStandardFormat);
      FCurrFormat := xlsStandardFormat;

      tsXLSFont.PageControl := pcXLSDataFormat;
      tsXLSBorders.PageControl := pcXLSDataFormat;
      tsXLSFill.PageControl := pcXLSDataFormat;

      tsXLSFont.PageIndex := 0;
      tsXLSBorders.PageIndex := 1;
      tsXLSFill.PageIndex := 2;

      pcXLSDataFormat.ActivePage :=
        pcXLSDataFormat.Pages[FStandardFormatPageIndex];
    end;
    lstExtensions: begin
      if Assigned(tvExtensions.Selected) then begin
        case tvExtensions.Selected.ImageIndex of
          xlsHyperlink: begin
            SetFormatsActivePage(tsHyperlinkFormat);
            tsXLSFont.PageControl := pcXLSHyperlinks;
            tsXLSBorders.PageControl := pcXLSHyperlinks;
            tsXLSFill.PageControl := pcXLSHyperlinks;

            tsXLSHyperlinkBase.PageIndex := 0;
            tsXLSFont.PageIndex := 1;
            tsXLSBorders.PageIndex := 2;
            tsXLSFill.PageIndex := 3;

            pcXLSHyperlinks.ActivePage :=
              pcXLSHyperlinks.Pages[FHyperlinkPageIndex];
            FCurrFormat := xlsHyperlinkFormat;
          end;
          xlsNote: begin
            SetFormatsActivePage(tsNoteFormat);
            if not tsXLSNoteBase.TabVisible then
              tsXLSNoteBase.TabVisible := true;
            FCurrFormat := xlsNoteFormat;

            tsXLSFont.PageControl := pcXLSNotes;

            tsXLSNoteBase.PageIndex := 0;
            tsXLSFont.PageIndex := 1;
            tsXLSNoteFill.PageIndex := 2;

            pcXLSNotes.ActivePage :=
              pcXLSNotes.Pages[FNotePageIndex];
          end;
          xlsChart: begin
            SetFormatsActivePage(tsChartFormat);
            FCurrFormat := xlsChartFormat;

            pcXLSCharts.ActivePage :=
              pcXLSCharts.Pages[FChartPageIndex];
          end;
          xlsSeries: begin
            SetFormatsActivePage(tsSeriesFormat);
            FCurrFormat := xlsSeriesFormat;

            pcXLSSeries.ActivePage :=
              pcXLSSeries.Pages[FSeriesPageIndex];
          end;
          xlsCell: begin
            SetFormatsActivePage(tsCellFormat);
            tsXLSFont.PageControl := pcXLSCells;
            tsXLSBorders.PageControl := pcXLSCells;
            tsXLSFill.PageControl := pcXLSCells;

            tsXLSCellBase.PageIndex := 0;
            tsXLSFont.PageIndex := 1;
            tsXLSBorders.PageIndex := 2;
            tsXLSFill.PageIndex := 3;

            pcXLSCells.ActivePage :=
              pcXLSCells.Pages[FCellPageIndex];
            FCurrFormat := xlsCellFormat;
          end;
          xlsMergedCell: begin
            SetFormatsActivePage(tsMergedCellFormat);
            FCurrFormat := xlsMergedCellFormat;

            pcXLSMergedCells.ActivePage :=
              pcXLSMergedCells.Pages[FMergedCellPageIndex];
          end;
        end;
      end;
    end;
  end;

  AssignedData := Assigned(Item);

  if (pcFormats1.ActivePage = tsStandardFormat) or
     (pcFormats1.ActivePage = tsNoteFormat) or
     (pcFormats1.ActivePage = tsHyperlinkFormat) or
     (pcFormats1.ActivePage = tsCellFormat) then begin
    tsXLSFont.Enabled := AssignedData;
    laXLSFont.Enabled := AssignedData;
    cbXLSFont.Enabled := AssignedData;
    laXLSFontSize.Enabled := AssignedData;
    cbXLSFontSize.Enabled := AssignedData;
    btnFontColor.Enabled := AssignedData;
    pbFontColor.Enabled := AssignedData;
    btnFontBold.Enabled := AssignedData;
    btnFontItalic.Enabled := AssignedData;
    btnFontStrikeOut.Enabled := AssignedData;
    btnUnderlineSingle.Enabled := AssignedData;
    btnUnderlineSingleAccounting.Enabled := AssignedData;
    btnUnderlineDouble.Enabled := AssignedData;
    btnUnderlineDoubleAccounting.Enabled := AssignedData;
    btnHorizontalLeft.Enabled := AssignedData;
    btnHorizontalCenter.Enabled := AssignedData;
    btnHorizontalRight.Enabled := AssignedData;
    btnHorizontalFill.Enabled := AssignedData;
    btnVerticalTop.Enabled := AssignedData;
    btnVerticalCenter.Enabled := AssignedData;
    btnVerticalBottom.Enabled := AssignedData;
  end;

  if (pcFormats1.ActivePage = tsStandardFormat) or
     (pcFormats1.ActivePage = tsHyperlinkFormat) or
     (pcFormats1.ActivePage = tsCellFormat) then begin
    tsStandardFormat.Enabled := AssignedData;
    pcXLSDataFormat.Enabled := AssignedData;
    tsXLSBorders.Enabled := AssignedData;
    btnBorderTop.Enabled := AssignedData;
    cbBorderTop.Enabled := AssignedData;
    btnBorderTopColor.Enabled := AssignedData;
    pbBorderTop.Enabled := AssignedData;
    btnBorderBottom.Enabled := AssignedData;
    cbBorderBottom.Enabled := AssignedData;
    btnBorderBottomColor.Enabled := AssignedData;
    pbBorderBottom.Enabled := AssignedData;
    btnBorderLeft.Enabled := AssignedData;
    cbBorderLeft.Enabled := AssignedData;
    btnBorderLeftColor.Enabled := AssignedData;
    pbBorderLeft.Enabled := AssignedData;
    btnBorderRight.Enabled := AssignedData;
    cbBorderRight.Enabled := AssignedData;
    btnBorderRightColor.Enabled := AssignedData;
    pbBorderRight.Enabled := AssignedData;
    tsXLSFill.Enabled := AssignedData;
    btnFillBackground.Enabled := AssignedData;
    pbFillBackground.Enabled := AssignedData;
    cbPattern.Enabled := AssignedData;
    btnFillForeground.Enabled := AssignedData;
    pbFillForeground.Enabled := AssignedData;
    tsXLSAggregate.Enabled := AssignedData;
    rgXLSFunction.Enabled := AssignedData;
  end;

  if pcFormats1.ActivePage = tsNoteFormat then begin
    tsXLSNoteBase.Enabled := AssignedData;
    laXLSNoteCol.Enabled := AssignedData;
    edXLSNoteCol.Enabled := AssignedData;
    laXLSNoteRow.Enabled := AssignedData;
    edXLSNoteRow.Enabled := AssignedData;
    mmXLSNoteLines.Enabled := AssignedData;
    tsXLSNoteFill.Enabled := AssignedData;
    gbXLSNoteFillType.Enabled := AssignedData;
    rbXLSNoteFillSolid.Enabled := AssignedData;
    rbXLSNoteFillGradient.Enabled := AssignedData;
    rbXLSNoteGradientHorizontal.Enabled := AssignedData;
    rbXLSNoteGradientVertical.Enabled := AssignedData;
    rbXLSNoteGradientDiagonalUp.Enabled := AssignedData;
    rbXLSNoteGradientDiagonalDown.Enabled := AssignedData;
    rbXLSNoteGradientFromCorner.Enabled := AssignedData;
    rbXLSNoteGradientFromCenter.Enabled := AssignedData;
    laXLSNoteTransparencyStart.Enabled := AssignedData;
    laXLSNoteTransparency.Enabled := AssignedData;
    laXLSNoteTransparencyFinish.Enabled := AssignedData;
    bvXLSNoteFillColors.Enabled := AssignedData;
    btnXLSNoteBackgroundColor.Enabled := AssignedData;
    pbXLSNoteBackgroundColor.Enabled := AssignedData;
    btnXLSNoteForegroundColor.Enabled := AssignedData;
    pbXLSNoteForegroundColor.Enabled := AssignedData;
  end
  else if pcFormats1.ActivePage = tsHyperlinkFormat then begin
    pcXLSHyperlinks.Enabled := AssignedData;
    tsXLSHyperlinkBase.Enabled := AssignedData;
    laXLSHyperlinkCol.Enabled := AssignedData;
    edXLSHyperlinkCol.Enabled := AssignedData;
    laXLSHyperlinkRow.Enabled := AssignedData;
    edXLSHyperlinkRow.Enabled := AssignedData;
    rgXLSHyperlinkStyle.Enabled := AssignedData;
    laXLSHyperlinkTitle.Enabled := AssignedData;
    edXLSHyperlinkTitle.Enabled := AssignedData;
    laXLSHyperlinkTarget.Enabled := AssignedData;
    edXLSHyperlinkTarget.Enabled := AssignedData;
  end
  else if pcFormats1.ActivePage = tsChartFormat then begin
    pcXLSCharts.Enabled := AssignedData;
    tsXLSChartBase.Enabled := AssignedData;
    laXLSChartTitle.Enabled := AssignedData;
    edXLSChartTitle.Enabled := AssignedData;
    laXLSChartStyle.Enabled := AssignedData;
    cbXLSChartStyle.Enabled := AssignedData;
    rgXLSChartLegendPosition.Enabled := AssignedData;
    chXLSChartShowLegend.Enabled := AssignedData;
    chXLSChartAutoColor.Enabled := AssignedData;
    tsXLSChartPosition.Enabled := AssignedData;
    gbXLSChartPosition1.Enabled := AssignedData;
    rbXLSChartAutoPosition.Enabled := AssignedData;
    laXLSChartPlacement.Enabled := AssignedData;
    cbXLSChartPlacement.Enabled := AssignedData;
    rbXLSChartCustomPosition.Enabled := AssignedData;
    gbXLSChartPosition2.Enabled := AssignedData;
    laXLSChartLeft.Enabled := AssignedData;
    edXLSChartLeft.Enabled := AssignedData;
    laXLSChartTop.Enabled := AssignedData;
    edXLSChartTop.Enabled := AssignedData;
    laXLSChartHeight.Enabled := AssignedData;
    edXLSChartHeight.Enabled := AssignedData;
    laXLSChartWidth.Enabled := AssignedData;
    edXLSChartWidth.Enabled := AssignedData;
    tsXLSChartCategoryLabels.Enabled := AssignedData;
    rbXLSChartCategoryLabelColumn.Enabled := AssignedData;
    cbXLSChartCategoryLabelColumn.Enabled := AssignedData;
    rbXLSChartCategoryLabelCustom.Enabled := AssignedData;
    gbXLSChartCustomCategoryLabel.Enabled := AssignedData;
    laXLSChartCategoryLabelsCol1.Enabled := AssignedData;
    edXLSChartCategoryLabelsCol1.Enabled := AssignedData;
    laXLSChartCategoryLabelsCol2.Enabled := AssignedData;
    edXLSChartCategoryLabelsCol2.Enabled := AssignedData;
    laXLSChartCategoryLabelsRow1.Enabled := AssignedData;
    edXLSChartCategoryLabelsRow1.Enabled := AssignedData;
    laXLSChartCategoryLabelsRow2.Enabled := AssignedData;
    edXLSChartCategoryLabelsRow2.Enabled := AssignedData;
  end
  else if pcFormats1.ActivePage = tsSeriesFormat then begin
    pcXLSSeries.Enabled := AssignedData;
    tsXLSSeriesBase.Enabled := AssignedData;
    laXLSSeriesTitle.Enabled := AssignedData;
    edXLSSeriesTitle.Enabled := AssignedData;
    gbXLSSeriesDataRange.Enabled := AssignedData;
    rbXLSSeriesColumn.Enabled := AssignedData;
    cbXLSSeriesColumn.Enabled := AssignedData;
    rbXLSSeriesCustom.Enabled := AssignedData;
    laXLSSeriesDataRangeCol1.Enabled := AssignedData;
    edXLSSeriesDataRangeCol1.Enabled := AssignedData;
    laXLSSeriesDataRangeCol2.Enabled := AssignedData;
    edXLSSeriesDataRangeCol2.Enabled := AssignedData;
    laXLSSeriesDataRangeRow1.Enabled := AssignedData;
    edXLSSeriesDataRangeRow1.Enabled := AssignedData;
    laXLSSeriesDataRangeRow2.Enabled := AssignedData;
    edXLSSeriesDataRangeRow2.Enabled := AssignedData;
  end
  else if pcFormats1.ActivePage = tsCellFormat then begin
    pcXLSCells.Enabled := AssignedData;
    tsXLSCellBase.Enabled := AssignedData;
    laXLSCellCol.Enabled := AssignedData;
    edXLSCellCol.Enabled := AssignedData;
    laXLSCellRow.Enabled := AssignedData;
    edXLSCellRow.Enabled := AssignedData;
    laXLSCellType.Enabled := AssignedData;
    cbXLSCellType.Enabled := AssignedData;
    laXLSCellValue.Enabled := AssignedData;
    edXLSCellValue.Enabled := AssignedData;
    laXLSCellDateTimeFormat.Enabled := AssignedData;
    edXLSCellDateTimeFormat.Enabled := AssignedData;
    laXLSCellNumericFormat.Enabled := AssignedData;
    edXLSCellNumericFormat.Enabled := AssignedData;
  end
  else if pcFormats1.ActivePage = tsMergedCellFormat then begin
    pcXLSMergedCells.Enabled := AssignedData;
    tsXLSMergedCellBase.Enabled := AssignedData;
    laXLSMergedCellsFirstCol.Enabled := AssignedData;
    edXLSMergedCellsFirstCol.Enabled := AssignedData;
    laXLSMergedCellsFirstRow.Enabled := AssignedData;
    edXLSMergedCellsFirstRow.Enabled := AssignedData;
    laXLSMergedCellsLastCol.Enabled := AssignedData;
    edXLSMergedCellsLastCol.Enabled := AssignedData;
    laXLSMergedCellsLastRow.Enabled := AssignedData;
    edXLSMergedCellsLastRow.Enabled := AssignedData;
  end;

  if not AssignedData then Exit;

  if FCurrFormat in [xlsStandardFormat, xlsNoteFormat,
       xlsHyperlinkFormat, xlsChartFormat, xlsSeriesFormat,
       xlsCellFormat, xlsMergedCellFormat] then begin

    Fnt := GetCurrFont;
    Algn := GetCurrAlignment;
    Brdrs := GetCurrBorders;
    Fill := GetCurrFill;

    if Assigned(Fnt) then begin
      cbXLSFont.ItemIndex := cbXLSFont.Items.IndexOf(Fnt.Name);
      cbXLSFontSize.Text := IntToStr(Fnt.Size);

      pbFontColor.Repaint;
      btnFontBold.Down := xfsBold in Fnt.Style;
      btnFontItalic.Down := xfsItalic in Fnt.Style;
      btnFontStrikeOut.Down := xfsStrikeOut in Fnt.Style;

      btnUnderlineSingle.Down := Fnt.Underline = fulSingle;
      btnUnderlineSingleAccounting.Down := Fnt.Underline = fulSingleAccounting;
      btnUnderlineDouble.Down := Fnt.Underline = fulDouble;
      btnUnderlineDoubleAccounting.Down := Fnt.Underline = fulDoubleAccounting;
    end;

    if Assigned(Algn) then begin
      btnHorizontalLeft.Down := Algn.Horizontal = halLeft;
      btnHorizontalCenter.Down := Algn.Horizontal = halCenter;
      btnHorizontalRight.Down := Algn.Horizontal = halRight;
      btnHorizontalFill.Down := Algn.Horizontal = halFill;

      btnVerticalTop.Down := Algn.Vertical = valTop;
      btnVerticalCenter.Down := Algn.Vertical = valCenter;
      btnVerticalBottom.Down := Algn.Vertical = valBottom;
    end;

    if Assigned(Brdrs) then begin
      btnBorderTop.Down := Brdrs.Top.Style <> bstNone;
      cbBorderTop.ItemIndex := Integer(Brdrs.Top.Style);
      btnBorderBottom.Down := Brdrs.Bottom.Style <> bstNone;
      cbBorderBottom.ItemIndex := Integer(Brdrs.Bottom.Style);

      btnBorderLeft.Down := Brdrs.Left.Style <> bstNone;
      cbBorderLeft.ItemIndex := Integer(Brdrs.Left.Style);
      btnBorderRight.Down := Brdrs.Right.Style <> bstNone;
      cbBorderRight.ItemIndex := Integer(Brdrs.Right.Style);

      pbBorderTop.Repaint;
      pbBorderBottom.Repaint;
      pbBorderLeft.Repaint;
      pbBorderRight.Repaint;
    end;

    if Assigned(Fill) then begin
      cbPattern.ItemIndex := Integer(Fill.Pattern);
      pbFillBackground.Repaint;
      pbFillForeground.Repaint;
      cbPattern.Repaint;
    end;

    if tsXLSAggregate.TabVisible then begin
      Event := rgXLSFunction.OnClick;
      rgXLSFunction.OnClick := nil;
      rgXLSFunction.ItemIndex := Integer(TxlsFieldFormat(Item).Aggregate);
      rgXLSFunction.OnClick := Event;
    end
    else rgXLSFunction.ItemIndex := -1;

    case Item.ItemType of
      itNoteFormat: begin
        rbXLSNoteFillSolid.Checked :=
          TxlsNoteFormat(Item).FillType = nftSolid;
        rbXLSNoteFillGradient.Checked :=
          TxlsNoteFormat(Item).FillType = nftGradient;
        rbXLSNoteGradientHorizontal.Checked :=
          TxlsNoteFormat(Item).Gradient = ngrHorizontal;
        rbXLSNoteGradientVertical.Checked :=
          TxlsNoteFormat(Item).Gradient = ngrVertical;
        rbXLSNoteGradientDiagonalUp.Checked :=
          TxlsNoteFormat(Item).Gradient = ngrDiagonalUp;
        rbXLSNoteGradientDiagonalDown.Checked :=
          TxlsNoteFormat(Item).Gradient = ngrDiagonalDown;
        rbXLSNoteGradientFromCorner.Checked :=
          TxlsNoteFormat(Item).Gradient = ngrFromCorner;
        rbXLSNoteGradientFromCenter.Checked :=
          TxlsNoteFormat(Item).Gradient = ngrFromCenter;
        trXLSNoteTransparency.Position := TxlsNoteFormat(Item).Transparency;
      end;
      itHyperlink: begin
        edXLSHyperlinkCol.Text := IntToStr(TxlsHyperlink(Item).Col);
        edXLSHyperlinkRow.Text := IntToStr(TxlsHyperlink(Item).Row);
        rgXLSHyperlinkStyle.ItemIndex := Integer(TxlsHyperlink(Item).Style);
        edXLSHyperlinkTitle.Text := TxlsHyperlink(Item).Title;
        edXLSHyperlinkTarget.Text := TxlsHyperlink(Item).Target;
      end;
      itNote: begin
        edXLSNoteCol.Text := IntToStr(TxlsNote(Item).Col);
        edXLSNoteRow.Text := IntToStr(TxlsNote(Item).Row);
        mmXLSNoteLines.Lines.Text := TxlsNote(Item).Lines.Text;
        
        rbXLSNoteFillSolid.Checked :=
          TxlsNote(Item).Format.FillType = nftSolid;
        rbXLSNoteFillGradient.Checked :=
          TxlsNote(Item).Format.FillType = nftGradient;
        rbXLSNoteGradientHorizontal.Checked :=
          TxlsNote(Item).Format.Gradient = ngrHorizontal;
        rbXLSNoteGradientVertical.Checked :=
          TxlsNote(Item).Format.Gradient = ngrVertical;
        rbXLSNoteGradientDiagonalUp.Checked :=
          TxlsNote(Item).Format.Gradient = ngrDiagonalUp;
        rbXLSNoteGradientDiagonalDown.Checked :=
          TxlsNote(Item).Format.Gradient = ngrDiagonalDown;
        rbXLSNoteGradientFromCorner.Checked :=
          TxlsNote(Item).Format.Gradient = ngrFromCorner;
        rbXLSNoteGradientFromCenter.Checked :=
          TxlsNote(Item).Format.Gradient = ngrFromCenter;
        trXLSNoteTransparency.Position := TxlsNote(Item).Format.Transparency;
      end;
      itChart: begin
        edXLSChartTitle.Text := TxlsChart(Item).Title;
        cbXLSChartStyle.ItemIndex := Integer(TxlsChart(Item).Style);
        rgXLSChartLegendPosition.ItemIndex := Integer(TxlsChart(Item).LegendPlacement);
        chXLSChartShowLegend.Checked := TxlsChart(Item).ShowLegend;
        chXLSChartAutoColor.Checked := TxlsChart(Item).AutoColor;
        rbXLSChartAutoPosition.Checked := TxlsChart(Item).Position.PositionType = cptAuto;
        cbXLSChartPlacement.ItemIndex := Integer(TxlsChart(Item).Position.AutoPosition.Placement);
        rbXLSChartCustomPosition.Checked := TxlsChart(Item).Position.PositionType = cptCustom;
        rbXLSChartCategoryLabelColumn.Checked := TxlsChart(Item).CategoryLabelsType = rtColumn;
        i := cbXLSChartCategoryLabelColumn.Items.IndexOf(TxlsChart(Item).CategoryLabelsColumn);
        cbXLSChartCategoryLabelColumn.ItemIndex := i;
        rbXLSChartCategoryLabelCustom.Checked := TxlsChart(Item).CategoryLabelsType = rtCustom;
        edXLSChartCategoryLabelsCol1.Text := IntToStr(TxlsChart(Item).CategoryLabels.Col1);
        edXLSChartCategoryLabelsCol2.Text := IntToStr(TxlsChart(Item).CategoryLabels.Col2);
        edXLSChartCategoryLabelsRow1.Text := IntToStr(TxlsChart(Item).CategoryLabels.Row1);
        edXLSChartCategoryLabelsRow2.Text := IntToStr(TxlsChart(Item).CategoryLabels.Row2);
        TuneXLSChartPosition;
        TuneXLSChartCategoryLabel;
      end;
      itSeries: begin
        edXLSSeriesTitle.Text := TxlsChartSeries(Item).Title;
        rbXLSSeriesColumn.Checked := TxlsChartSeries(Item).DataRangeType = rtColumn;
        i := cbXLSSeriesColumn.Items.IndexOf(TxlsChartSeries(Item).DataColumn);
        cbXLSSeriesColumn.ItemIndex := i;
        rbXLSSeriesCustom.Checked := TxlsChartSeries(Item).DataRangeType = rtCustom;
        edXLSSeriesDataRangeCol1.Text := IntToStr(TxlsChartSeries(Item).DataRange.Col1);
        edXLSSeriesDataRangeCol2.Text := IntToStr(TxlsChartSeries(Item).DataRange.Col2);
        edXLSSeriesDataRangeRow1.Text := IntToStr(TxlsChartSeries(Item).DataRange.Row1);
        edXLSSeriesDataRangeRow2.Text := IntToStr(TxlsChartSeries(Item).DataRange.Row2);
        TuneXLSSeriesDataRange;
      end;
      itCell: begin
        edXLSCellCol.Text := IntToStr(TxlsCell(Item).Col);
        edXLSCellRow.Text := IntToStr(TxlsCell(Item).Row);
        cbXLSCellType.ItemIndex := Integer(TxlsCell(Item).CellType);
        edXLSCellValue.Text := VarToStr(TxlsCell(Item).Value);
        edXLSCellDateTimeFormat.Text := TxlsCell(Item).DateTimeFormat;
        edXLSCellNumericFormat.Text := TxlsCell(Item).NumericFormat;
      end;
      itMergedCells: begin
        edXLSMergedCellsFirstCol.Text := IntToStr(TxlsMergedCells(Item).FirstCol);
        edXLSMergedCellsFirstRow.Text := IntToStr(TxlsMergedCells(Item).FirstRow);
        edXLSMergedCellsLastCol.Text := IntToStr(TxlsMergedCells(Item).LastCol);
        edXLSMergedCellsLastRow.Text := IntToStr(TxlsMergedCells(Item).LastRow);
      end;
    end;
  end;
end;

function TfmQExport3XLSEditor.GetCurrFmtList: TListView;
begin
  Result := nil;
  case FCurrList of
    lstColumns: Result := lvFieldFormats;
    lstOptions: Result := lvOptions;
    lstStyles: Result := lvStyles;
  end;
end;

function TfmQExport3XLSEditor.GetCurrFmtItem: TxlsCustomItem;
begin
  Result := nil;
  case FCurrList of
    lstColumns:
      if Assigned(lvFieldFormats.ItemFocused) then
        Result := TxlsCustomItem(lvFieldFormats.ItemFocused.Data);
    lstOptions:
      if Assigned(lvOptions.ItemFocused) then
        Result := TxlsCustomItem(lvOptions.ItemFocused.Data);
    lstStyles:
      if Assigned(lvStyles.ItemFocused) then
        Result := TxlsCustomItem(lvStyles.ItemFocused.Data);
    lstExtensions:
      if Assigned(tvExtensions.Selected) then
        Result := TxlsCustomItem(tvExtensions.Selected.Data);
  end;
end;

function TfmQExport3XLSEditor.GetCurrFont: TxlsFont;
var
  Item: TxlsCustomItem;
begin
  Result := nil;

  Item := GetCurrFmtItem;
  if not Assigned(Item) then Exit;

  case Item.ItemType of
    itFormat,
    itFieldFormat: Result := (Item as TxlsFormat).Font;
    itNoteFormat: Result := (Item as TxlsNoteFormat).Font;
    itHyperlink: Result := (Item as TxlsHyperlink).Format.Font;
    itNote: Result := (Item as TxlsNote).Format.Font;
    itCell: Result := (Item as TxlsCell).Format.Font;
  end;
end;

function TfmQExport3XLSEditor.GetCurrAlignment: TxlsAlignment;
var
  Item: TxlsCustomItem;
begin
  Result := nil;

  Item := GetCurrFmtItem;
  if not Assigned(Item) then Exit;

  case Item.ItemType of
    itFormat,
    itFieldFormat: Result := (Item as TxlsFormat).Alignment;
    itNoteFormat: Result := (Item as TxlsNoteFormat).Alignment;
    itHyperlink: Result := (Item as TxlsHyperlink).Format.Alignment;
    itNote: Result := (Item as TxlsNote).Format.Alignment;
    itCell: Result := (Item as TxlsCell).Format.Alignment;
  end;
end;

function TfmQExport3XLSEditor.GetCurrBorders: TxlsBorders;
var
  Item: TxlsCustomItem;
begin
  Result := nil;

  Item := GetCurrFmtItem;
  if not Assigned(Item) then Exit;

  case Item.ItemType of
    itFormat,
    itFieldFormat: Result := (Item as TxlsFormat).Borders;
    itHyperlink: Result := (Item as TxlsHyperlink).Format.Borders;
    itCell: Result := (Item as TxlsCell).Format.Borders;
  end;
end;

function TfmQExport3XLSEditor.GetCurrFill: TxlsFill;
var
  Item: TxlsCustomItem;
begin
  Result := nil;

  Item := GetCurrFmtItem;
  if not Assigned(Item) then Exit;

  case Item.ItemType of
    itFormat,
    itFieldFormat: Result := (Item as TxlsFormat).Fill;
    itHyperlink: Result := (Item as TxlsHyperlink).Format.Fill;
    itCell: Result := (Item as TxlsCell).Format.Fill;
  end;
end;

procedure TfmQExport3XLSEditor.SetCurrDefault;
var
  Item: TxlsCustomItem;
begin
  Item := GetCurrFmtItem;
  if not Assigned(Item) then Exit;

  case Item.ItemType of
    itFormat,
    itFieldFormat: (Item as TxlsFormat).SetDefault;
    itNoteFormat: (Item as TxlsNoteFormat).SetDefault;
    itHyperlink: (Item as TxlsHyperlink).Format.SetDefault;
    itNote: (Item as TxlsNote).Format.SetDefault;
  end;
end;

procedure TfmQExport3XLSEditor.ShowColumnButtons;
begin
  tbtAddFieldFormat.Enabled := Assigned(lvSheets.Selected);
  tbtEditFieldFormat.Enabled := Assigned(lvSheets.Selected) and
                               (lvFieldFormats.Items.Count > 0) and
                               Assigned(lvFieldFormats.Selected);
  tbtDelFieldFormat.Enabled := Assigned(lvSheets.Selected) and
                               (lvFieldFormats.Items.Count > 0) and
                               Assigned(lvFieldFormats.Selected);
  tbtDownloadDataFormat.Enabled := Assigned(lvSheets.Selected) and
                                   (lvFieldFormats.Items.Count > 0) and
                                   Assigned(lvFieldFormats.Selected);
  tbtUploadDataFormat.Enabled := Assigned(lvSheets.Selected) and
                                 (lvFieldFormats.Items.Count > 0) and
                                 Assigned(lvFieldFormats.Selected);
end;

procedure TfmQExport3XLSEditor.ShowStyleButtons;
begin
  tbtStyleAdd.Enabled := Assigned(lvSheets.Selected);
  tbtStyleDel.Enabled := (lvStyles.Items.Count > 0) and
                         Assigned(lvStyles.Selected);
  tbtStyleUp.Enabled := (lvStyles.Items.Count > 0) and
                         Assigned(lvStyles.Selected) and
                         (lvStyles.Selected.Index > 0);
  tbtStyleDown.Enabled := (lvStyles.Items.Count > 0) and
                           Assigned(lvStyles.Selected) and
                           (lvStyles.Selected.Index < lvStyles.Items.Count - 1);
  rgStripType.Enabled := Assigned(lvSheets.Selected) and
                         (lvStyles.Items.Count > 0);
  if not rgStripType.Enabled then rgStripType.ItemIndex := 0;
end;

procedure TfmQExport3XLSEditor.LoadSheets;
var
  i: integer;
  Sheet: TxlsSheet;
  Cmp: TComponent;
begin
  edFileName.Text := FExportXLS.FileName;
  chShowFile.Checked := FExportXLS.ShowFile;
  chPrintFile.Checked := FExportXLS.PrintFile;

  tvExtensions.Items.BeginUpdate;
  try
    tvExtensions.Items.Clear;
    FHyperlinkNode := tvExtensions.Items.Add(nil, {$IFDEF WIN32}QExportLoadStr(QED_XLS_Hyperlinks){$ENDIF}
                                                  {$IFDEF LINUX}QED_XLS_Hyperlinks{$ENDIF});
    with FHyperlinkNode do begin
      ImageIndex := xlsHyperlink;
      SelectedIndex := xlsHyperlink;
    end;
    FNoteNode := tvExtensions.Items.Add(nil, {$IFDEF WIN32}QExportLoadStr(QED_XLS_Notes){$ENDIF}
                                             {$IFDEF LINUX}QED_XLS_Notes{$ENDIF});
    with FNoteNode do begin
      ImageIndex := xlsNote;
      SelectedIndex := xlsNote;
    end;
    FChartNode := tvExtensions.Items.Add(nil, {$IFDEF WIN32}QExportLoadStr(QED_XLS_Charts){$ENDIF}
                                              {$IFDEF LINUX}QED_XLS_Charts{$ENDIF});
    with FChartNode do begin
      ImageIndex := xlsChart;
      SelectedIndex := xlsChart;
    end;
    FCellNode := tvExtensions.Items.Add(nil, {$IFDEF WIN32}QExportLoadStr(QED_XLS_Cells){$ENDIF}
                                             {$IFDEF LINUX}QED_XLS_Cells{$ENDIF});
    with FCellNode do begin
      ImageIndex := xlsCell;
      SelectedIndex := xlsCell;
    end;
    FMergedCellNode := tvExtensions.Items.Add(nil, {$IFDEF WIN32}QExportLoadStr(QED_XLS_MergedCells){$ENDIF}
                                                   {$IFDEF LINUX}QED_XLS_MergedCells{$ENDIF});
    with FMergedCellNode do begin
      ImageIndex := xlsMergedCell;
      SelectedIndex := xlsMergedCell;
    end;
  finally
    tvExtensions.Items.EndUpdate;
  end;
  FHyperlinkNode.Focused := true;
  FHyperlinkNode.Selected := true;

  lvSheets.Items.BeginUpdate;
  FLoading := true;
  try
    lvSheets.Items.Clear;
    for i := 0 to FExportXLS.Sheets.Count - 1 do begin
      Cmp := QExportSource(FExportXLS.Sheets[i].ExportSource,
          FExportXLS.Sheets[i].DataSet, FExportXLS.Sheets[i].CustomSource,
          FExportXLS.Sheets[i].DBGrid, FExportXLS.Sheets[i].ListView,
          FExportXLS.Sheets[i].StringGrid);

      if not Assigned(Cmp) and (FExportSourceList.Count > 0) and
         (Application.MessageBox(PChar(Format({$IFDEF WIN32}QExportLoadStr(QEE_XLS_ExportSourceConfirm){$ENDIF}
                                              {$IFDEF LINUX}QEE_XLS_ExportSourceConfirm{$ENDIF},
            [FExportXLS.Sheets[i].Title])), PChar({$IFDEF WIN32}QExportLoadStr(QEE_XLS_Confirm){$ENDIF}
                                                  {$IFDEF LINUX}QEE_XLS_Confirm{$ENDIF}),
            MB_ICONINFORMATION + MB_YESNO + MB_DEFBUTTON1) = ID_YES) then
        Cmp := RunExportSourceList(FExportSourceList);

      with lvSheets.Items.Add do begin
        Sheet := TxlsSheet.Create(nil);
        Sheet.Assign(FExportXLS.Sheets[i]);

        if Assigned(Cmp) then begin
          SetSheetExportSource(FExportXLS.Sheets[i], Cmp);
          SubItems.Add(Cmp.ClassName);
        end
        else SubItems.Add({$IFDEF WIN32}QExportLoadStr(QEE_XLS_ExportSourceUndefined){$ENDIF}
                          {$IFDEF LINUX}QEE_XLS_ExportSourceUndefined{$ENDIF});

        Caption := Sheet.Title;
        Data := Sheet;
      end;
    end;
  finally
    FLoading := false;
    lvSheets.Items.EndUpdate;
  end;
  if lvSheets.Items.Count > 0 then begin
    lvSheets.Items[0].Focused := true;
    lvSheets.Items[0].Selected := true;
  end;
  TuneSheetButtons;
  ShowColumnButtons;
  ShowStyleButtons;
end;

procedure TfmQExport3XLSEditor.SaveSheets;
var
  i: integer;
  Sheet: TxlsSheet;
begin
  FExportXLS.FileName := edFileName.Text;
  FExportXLS.ShowFile := chShowFile.Checked;
  FExportXLS.PrintFile := chPrintFile.Checked;

  FExportXLS.Sheets.Clear;
  for i := 0 to lvSheets.Items.Count - 1 do begin
    Sheet := TxlsSheet(lvSheets.Items[i].Data);
    FExportXLS.Sheets.Add.Assign(Sheet);
  end;
end;

procedure TfmQExport3XLSEditor.ClearLists;
var
  i: integer;
  WasLoading: boolean;
begin
  WasLoading := FLoading;
  FLoading := true;
  try
    // Field Formats
    lvFieldFormats.Items.BeginUpdate;
    try
      lvFieldFormats.Items.Clear;
    finally
      lvFieldFormats.Items.EndUpdate;
    end;
    // Styles
    lvStyles.Items.BeginUpdate;
    try
      lvStyles.Items.Clear;
    finally
      lvStyles.Items.EndUpdate;
    end;
    // Options
    lvOptions.Items.BeginUpdate;
    try
      for i := 0 to 6 do begin
        lvOptions.Items[i].Data := nil;
        lvOptions.Items[i].ImageIndex := 2;
      end;
    finally
      lvOptions.Items.EndUpdate;
    end;
    tvExtensions.Items.BeginUpdate;
    try
      // Hypelinks
      FHyperlinkNode.DeleteChildren;
      // Notes
      FNoteNode.DeleteChildren;
      // Chart
      FChartNode.DeleteChildren;
    finally
      tvExtensions.Items.EndUpdate;
    end;
  finally
    FLoading := WasLoading;
  end;
end;

procedure TfmQExport3XLSEditor.FillLists(Sheet: TxlsSheet);
var
  i, j: integer;
  Node: TTreeNode;
  FColumns: TQExportColumns;
begin
  if not Assigned(Sheet) then Exit;
  FLoading := true;
  try
    // Field Formats
    lvFieldFormats.Items.BeginUpdate;
    try
      for i := 0 to Sheet.FieldFormats.Count - 1 do begin
        with lvFieldFormats.Items.Add do begin
          Caption := Sheet.FieldFormats[i].FieldName;
          ImageIndex := 1;
          Data := Sheet.FieldFormats[i];
        end;
      end;
      if lvFieldFormats.Items.Count > 0 then begin
        lvFieldFormats.Items[0].Selected := true;
        lvFieldFormats.Items[0].Focused := true;
      end;
    finally
      lvFieldFormats.Items.EndUpdate;
    end;
    // Styles
    lvStyles.Items.BeginUpdate;
    try
      for i := 0 to Sheet.StripStyles.Count - 1 do
        with lvStyles.Items.Add do begin
          Caption := Format({$IFDEF WIN32}QExportLoadStr(QED_XLS_StripStyle){$ENDIF}
                            {$IFDEF LINUX}QED_XLS_StripStyle{$ENDIF}, [i + 1]);
          Data := Sheet.StripStyles[i];
          ImageIndex := 3;
        end;
      if lvStyles.Items.Count > 0 then begin
        lvStyles.Items[0].Selected := true;
        lvStyles.Items[0].Focused := true;
      end;
    finally
      lvStyles.Items.EndUpdate;
    end;
    // Options
    lvOptions.Items.BeginUpdate;
    try
      lvOptions.Items[0].Data := Sheet.Options.HeaderFormat;
      Sheet.Options.HeaderFormat.Tag := 1;
      lvOptions.Items[1].Data := Sheet.Options.CaptionsFormat;
      Sheet.Options.CaptionsFormat.Tag := 2;
      lvOptions.Items[2].Data := Sheet.Options.DataFormat;
      Sheet.Options.DataFormat.Tag := 3;
      lvOptions.Items[3].Data := Sheet.Options.AggregateFormat;
      Sheet.Options.AggregateFormat.Tag := 4;
      lvOptions.Items[4].Data := Sheet.Options.FooterFormat;
      Sheet.Options.FooterFormat.Tag := 5;
      lvOptions.Items[5].Data := Sheet.Options.HyperlinkFormat;
      Sheet.Options.HyperlinkFormat.Tag := 6;
      lvOptions.Items[6].Data := Sheet.Options.NoteFormat;
      Sheet.Options.NoteFormat.Tag := 7;

      ForAllListViewItems(lvOptions, UnselectItem, false, true);
      ForAllListViewItems(lvOptions, SetSelectedToFocused, false, true);

      rgStripType.ItemIndex := Integer(Sheet.StripType);
    finally
      lvOptions.Items.EndUpdate;
    end;
    tvExtensions.Items.BeginUpdate;
    try
      // Hyperlinks
      for i := 0 to Sheet.Hyperlinks.Count - 1 do
        with tvExtensions.Items.AddChild(FHyperlinkNode, Sheet.Hyperlinks[i].Title) do begin
          ImageIndex := xlsHyperlink;
          SelectedIndex := xlsHyperlink;
          Data := Sheet.Hyperlinks[i];
        end;
      FHyperlinkNode.Expand(true);
      // Notes
      for i := 0 to Sheet.Notes.Count - 1 do
        with tvExtensions.Items.AddChild(FNoteNode,
          Format({$IFDEF WIN32}QExportLoadStr(QED_XLS_Note_DefaultTitle){$ENDIF}
                 {$IFDEF LINUX}QED_XLS_Note_DefaultTitle{$ENDIF} + '_%d', [Sheet.Notes[i].Index + 1]))do begin
          ImageIndex := xlsNote;
          SelectedIndex := xlsNote;
          Data := Sheet.Notes[i];
        end;
      FNoteNode.Expand(true);
      // Charts
      for i := 0 to Sheet.Charts.Count - 1 do begin
        Node := tvExtensions.Items.AddChild(FChartNode, Sheet.Charts[i].Title);
        with Node do begin
          ImageIndex := xlsChart;
          SelectedIndex := xlsChart;
          Data := Sheet.Charts[i];
        end;
        Node := tvExtensions.Items.AddChild(Node, {$IFDEF WIN32}QExportLoadStr(QED_XLS_Series){$ENDIF}
                                                  {$IFDEF LINUX}QED_XLS_Series{$ENDIF});
        with Node do begin
          ImageIndex := xlsSeries;
          SelectedIndex := xlsSeries;
        end;
        for j := 0 to Sheet.Charts[i].Series.Count - 1 do
          with tvExtensions.Items.AddChild(Node, Sheet.Charts[i].Series[j].Title) do begin
            ImageIndex := xlsSeries;
            SelectedIndex := xlsSeries;
            Data := Sheet.Charts[i].Series[j];
          end;
      end;
      FChartNode.Expand(false);
      // Cells
      for i := 0 to Sheet.Cells.Count - 1 do
        with tvExtensions.Items.AddChild(FCellNode, Sheet.Cells[i].DisplayName) do begin
          ImageIndex := xlsCell;
          SelectedIndex := xlsCell;
          Data := Sheet.Cells[i];
        end;
      FCellNode.Expand(true);
      // Merged Cells
      for i := 0 to Sheet.MergedCells.Count - 1 do
        with tvExtensions.Items.AddChild(FMergedCellNode, Sheet.MergedCells[i].DisplayName) do begin
          ImageIndex := xlsMergedCell;
          SelectedIndex := xlsMergedCell;
          Data := Sheet.MergedCells[i];
        end;
      FMergedCellNode.Expand(true);
    finally
      tvExtensions.Items.EndUpdate;
    end;

    // Columns for charts
    cbXLSChartCategoryLabelColumn.Items.Clear;
    cbXLSSeriesColumn.Items.Clear;
    FColumns := TQExportColumns.Create(Sheet, nil);
    try
      FColumns.Fill(true);
      for i := 0 to FColumns.Count - 1 do begin
        cbXLSChartCategoryLabelColumn.Items.Add(FColumns[i].Name);
        cbXLSSeriesColumn.Items.Add(FColumns[i].Name);
      end;
    finally
      FColumns.Free;
    end;
  finally
    FLoading := false;
  end;
end;

procedure TfmQExport3XLSEditor.FillExportSourceList;
var
  TypeData: PTypeData;
  i: integer;
begin
  FExportSourceList.BeginUpdate;
  try
    FExportSourceList.Clear;
    if Assigned(FDesigner) then begin
      TypeData := GetTypeData(TDataSet.ClassInfo);
      FDesigner.GetComponentNames(TypeData, AddExportSourceListItem);
      TypeData := GetTypeData(TDBGrid.ClassInfo);
      FDesigner.GetComponentNames(TypeData, AddExportSourceListItem);
      TypeData := GetTypeData(TListView.ClassInfo);
      FDesigner.GetComponentNames(TypeData, AddExportSourceListItem);
      TypeData := GetTypeData(TStringGrid.ClassInfo);
      FDesigner.GetComponentNames(TypeData, AddExportSourceListItem);
      TypeData := GetTypeData(TqeCustomSource.ClassInfo);
      FDesigner.GetComponentNames(TypeData, AddExportSourceListItem);

      for i := 0 to FExportSourceList.Count - 1 do
        FExportSourceList.Objects[i] := FDesigner.GetComponent(FExportSourceList[i]);
    end;
  finally
    FExportSourceList.EndUpdate;
  end;
end;

procedure TfmQExport3XLSEditor.AddExportSourceListItem(const S: string);
begin
  FExportSourceList.Add(S);
end;

procedure TfmQExport3XLSEditor.FormShow(Sender: TObject);
begin
  Caption := Format({$IFDEF WIN32}QExportLoadStr(QEE_Caption){$ENDIF}
                    {$IFDEF LINUX}QEE_Caption{$ENDIF}, [FExportXLS.Name]);
  pcFormats.ActivePage := tsFieldFormats;
  pcXLSDataFormat.ActivePage := tsXLSFont;
  pcSheetOptions.ActivePage := tsSheetCommon;
  pcFormats.OnChange(nil);
end;

procedure TfmQExport3XLSEditor.tbtSheetEditClick(Sender: TObject);
var
  Str: string;
begin
  Str := InputBox({$IFDEF WIN32}QExportLoadStr(QEE_XLS_EditSheet){$ENDIF}
                  {$IFDEF LINUX}QEE_XLS_EditSheet{$ENDIF},
                  {$IFDEF WIN32}QExportLoadStr(QEE_XLS_EditSheetTitle){$ENDIF}
                  {$IFDEF LINUX}QEE_XLS_EditSheetTitle{$ENDIF},
    lvSheets.Selected.Caption);
  if Str <> EmptyStr then begin
    lvSheets.Selected.Caption := Str;
    TxlsSheet(lvSheets.Selected.Data).Title := Str;
  end
  else raise Exception.Create({$IFDEF WIN32}QExportLoadStr(QEE_XLS_SheetTitleIsEmpty){$ENDIF}
                              {$IFDEF LINUX}QEE_XLS_SheetTitleIsEmpty{$ENDIF});
end;

procedure TfmQExport3XLSEditor.lvSheetsDeletion(Sender: TObject;
  Item: TListItem);
begin
  if Assigned(Item) and Assigned(Item.Data) then
    TxlsSheet(Item.Data).Free;
end;

procedure TfmQExport3XLSEditor.SheetDeleteSelected(Item: TListItem);
begin
  if Item.Selected then Item.Delete;
end;

procedure TfmQExport3XLSEditor.tbtSheetDelClick(Sender: TObject);
var
  N: integer;
begin
  N := -1;
  if Assigned(lvSheets.ItemFocused) then
    N := lvSheets.ItemFocused.Index;
  ForAllListViewItems(lvSheets, SheetDeleteSelected, true, true);
  if lvSheets.Items.Count > 0 then begin
    N := MinimumInt(N, lvSheets.Items.Count - 1);
    if N = -1 then N := 0;
    lvSheets.Items[N].Focused := true;
    lvSheets.Items[N].Selected := true;
  end;
end;

procedure TfmQExport3XLSEditor.tbtSheetUpClick(Sender: TObject);
begin
  MoveListItemUp(lvSheets);
end;

procedure TfmQExport3XLSEditor.tbtSheetDownClick(Sender: TObject);
begin
  MoveListItemDown(lvSheets);
end;

procedure TfmQExport3XLSEditor.tbtSheetAddClick(Sender: TObject);
var
  Str: string;
  Sheet: TxlsSheet;
  i, j: integer;
  Flag: boolean;
  Cmp: TComponent;
begin
  j := 1;
  Flag := true;
  while Flag do begin
    for i := 0 to lvSheets.Items.Count - 1 do
      if AnsiCompareText(Format({$IFDEF WIN32}QExportLoadStr(QEE_XLS_NewSheet){$ENDIF}
                                {$IFDEF LINUX}QEE_XLS_NewSheet{$ENDIF}, [j]),
           lvSheets.Items[i].Caption) = 0 then begin
        Inc(j);
        Flag := false;
        Break;
      end;
    if not Flag
      then Flag := true
      else Break;
  end;
  Str := Format({$IFDEF WIN32}QExportLoadStr(QEE_XLS_NewSheet){$ENDIF}
                {$IFDEF LINUX}QEE_XLS_NewSheet{$ENDIF}, [j]);
  if not InputQuery({$IFDEF WIN32}QExportLoadStr(QEE_XLS_AddNewSheet){$ENDIF}
                    {$IFDEF LINUX}QEE_XLS_AddNewSheet{$ENDIF},
                    {$IFDEF WIN32}QExportLoadStr(QEE_XLS_DefineSheetTitle){$ENDIF}
                    {$IFDEF LINUX}QEE_XLS_DefineSheetTitle{$ENDIF}, Str)
    then Exit;
  Cmp := RunExportSourceList(FExportSourceList);
  if Assigned(Cmp) then begin
    with lvSheets.Items.Add do begin
      Sheet := TxlsSheet.Create(nil);
      Sheet.Title := Str;
      SetSheetExportSource(Sheet, Cmp);
      Caption := Str;
      Data := Sheet;
      SubItems.Add(Cmp.ClassName);
      ImageIndex := 0;
      Focused := true;
      Selected := true;
    end;
  end;
end;

procedure TfmQExport3XLSEditor.SetSheetExportSource(Sheet: TxlsSheet;
  Source: TComponent);
begin
  if not (Assigned(Sheet) and Assigned(Source))then Exit;

  if Source is TDataSet then begin
    Sheet.DataSet := (Source as TDataSet);
    Sheet.ExportSource := esDataset;
  end
  else if Source is TqeCustomSource then begin
    Sheet.CustomSource := (Source as TqeCustomSource);
    Sheet.ExportSource := esCustom;
  end
  else if Source is TDBGrid then begin
    Sheet.DBGrid := (Source as TDBGrid);
    Sheet.ExportSource := esDBGrid;
  end
  else if Source is TListView then begin
    Sheet.ListView := (Source as TListView);
    Sheet.ExportSource := esListView;
  end
  else if Source is TStringGrid then begin
    Sheet.StringGrid := (Source as TStringGrid);
    Sheet.ExportSource := esStringGrid;
  end
end;

procedure TfmQExport3XLSEditor.MoveListItemUp(ListView: TListView);
var
  N: integer;
  ListItemCaption: string;
  ListItemData: Pointer;
  ListItemChecked: boolean;
  ListItemImageIndex: integer;
  ListItemSubItems: TStrings;
begin
  FLoading := true;
  try
    N := ListView.Selected.Index;
    if ListView = lvStyles then
      TxlsFormat(lvStyles.Selected.Data).Index :=
        TxlsFormat(lvStyles.Selected.Data).Index - 1;

    ListItemSubItems := TStringList.Create;
    try
      ListItemCaption := ListView.Items[N - 1].Caption;
      ListItemData := ListView.Items[N - 1].Data;
      ListItemChecked := ListView.Items[N - 1].Checked;
      ListItemImageIndex := ListView.Items[N - 1].ImageIndex;
      ListItemSubItems.Assign(ListView.Items[N - 1].SubItems);

      ListView.Items[N - 1].Caption := ListView.Items[N].Caption;
      ListView.Items[N - 1].Data := ListView.Items[N].Data;
      ListView.Items[N - 1].Checked := ListView.Items[N].Checked;
      ListView.Items[N - 1].ImageIndex := ListView.Items[N].ImageIndex;
      ListView.Items[N - 1].SubItems.Assign(ListView.Items[N].SubItems);

      ListView.Items[N].Caption := ListItemCaption;
      ListView.Items[N].Data := ListItemData;
      ListView.Items[N].Checked := ListItemChecked;
      ListView.Items[N].ImageIndex := ListItemImageIndex;
      ListView.Items[N].SubItems.Assign(ListItemSubItems);

      ListView.Items[N].Selected := false;
      ListView.Items[N - 1].Selected := true;
      ListView.Items[N - 1].Focused := true;
    finally
      ListItemSubItems.Free;
    end;
  finally
    FLoading := false;
  end;
end;

procedure TfmQExport3XLSEditor.MoveListItemDown(ListView: TListView);
var
  N: integer;
  ListItemCaption: string;
  ListItemData: Pointer;
  ListItemChecked: boolean;
  ListItemImageIndex: integer;
  ListItemSubItems: TStrings;
begin
  FLoading := true;
  try
    N := ListView.Selected.Index;
    if ListView = lvStyles then begin
      TxlsFormat(lvStyles.Selected.Data).Index :=
        TxlsFormat(lvStyles.Selected.Data).Index + 1;
    end;

    ListItemSubItems := TStringList.Create;
    try
      ListItemCaption := ListView.Items[N + 1].Caption;
      ListItemData := ListView.Items[N + 1].Data;
      ListItemChecked := ListView.Items[N + 1].Checked;
      ListItemImageIndex := ListView.Items[N + 1].ImageIndex;
      ListItemSubItems.Assign(ListView.Items[N + 1].SubItems);

      ListView.Items[N + 1].Caption := ListView.Items[N].Caption;
      ListView.Items[N + 1].Data := ListView.Items[N].Data;
      ListView.Items[N + 1].Checked := ListView.Items[N].Checked;
      ListView.Items[N + 1].ImageIndex := ListView.Items[N].ImageIndex;
      ListView.Items[N + 1].SubItems.Assign(ListView.Items[N].SubItems);

      ListView.Items[N].Caption := ListItemCaption;
      ListView.Items[N].Data := ListItemData;
      ListView.Items[N].Checked := ListItemChecked;
      ListView.Items[N].ImageIndex := ListItemImageIndex;
      ListView.Items[N].SubItems.Assign(ListItemSubItems);

      ListView.Items[N].Selected := false;
      ListView.Items[N + 1].Selected := true;
      ListView.Items[N + 1].Focused := true;
    finally
      ListItemSubItems.Free;
    end;
  finally
    FLoading := false;
  end;
end;

procedure TfmQExport3XLSEditor.tbtStyleUpClick(Sender: TObject);
begin
  MoveListItemUp(lvStyles);
  RenumStyles;
end;

procedure TfmQExport3XLSEditor.tbtStyleDownClick(Sender: TObject);
begin
  MoveListItemDown(lvStyles);
  RenumStyles;
end;

procedure TfmQExport3XLSEditor.StyleRenumber(Item: TListItem);
begin
  Item.Caption := Format({$IFDEF WIN32}QExportLoadStr(QED_XLS_StripStyle){$ENDIF}
                         {$IFDEF LINUX}QED_XLS_StripStyle{$ENDIF}, [Item.Index + 1]);
end;

procedure TfmQExport3XLSEditor.UnselectItem(Item: TListItem);
begin
  if Item.Selected then Item.Selected := false;
end;

procedure TfmQExport3XLSEditor.SelectItem(Item: TListItem);
begin
  if not Item.Selected then Item.Selected := true;
end;

procedure TfmQExport3XLSEditor.SetSelectedToFocused(Item: TListItem);
begin
  if Item.Focused then Item.Selected := true;
end;

procedure TfmQExport3XLSEditor.DeleteItem(Item: TListItem);
begin
  if Item.Selected then begin
    TxlsFieldFormat(Item.Data).Free;
    Item.Delete;
  end;
end;

procedure TfmQExport3XLSEditor.RenumStyles;
var
  ListItem: TListItem;
begin
  lvStyles.Items.BeginUpdate;
  try
    ListItem := lvStyles.Selected;
    ForAllListViewItems(lvStyles, StyleRenumber, false, true);
    if Assigned(ListItem) then begin
      ListItem.Selected := true;
      ListItem.Focused := true;
    end;
  finally
    lvStyles.Items.EndUpdate;
  end;
end;

procedure TfmQExport3XLSEditor.cbXLSFontChange(Sender: TObject);
var
  Fnt: TxlsFont;
begin
  Fnt := GetCurrFont;
  if not Assigned(Fnt) then Exit;
  Fnt.Name := cbXLSFont.Text;
  ForAllListViewCustomItems(GetCurrFmtList, XLSUpdateItemFont, false, false);
end;

procedure TfmQExport3XLSEditor.cbXLSFontSizeChange(Sender: TObject);
var
  Fnt: TxlsFont;
begin
  Fnt := GetCurrFont;
  if not Assigned(Fnt) then Exit;
  Fnt.Size := StrToIntDef(cbXLSFontSize.Text, 10);
  ForAllListViewCustomItems(GetCurrFmtList, XLSUpdateItemFontSize,
    false, false);
end;

procedure TfmQExport3XLSEditor.btnFontColorClick(Sender: TObject);
var
  OClr, NClr: TxlsColor;
  Fnt: TxlsFont;
begin
  Fnt := GetCurrFont;
  if not Assigned(Fnt) then Exit;
  OClr := Fnt.Color;
  NClr := RunXLSColorEditor(OClr);
  if NClr <> OClr then begin
    Fnt.Color := NClr;
    ForAllListViewCustomItems(GetCurrFmtList, XLSUpdateItemFontColor,
      false, false);
  end;
end;

procedure TfmQExport3XLSEditor.btnFontColorMouseDown(Sender: TObject;
  Button: TMouseButton; Shift: TShiftState; X, Y: Integer);
begin
  IncLeftAndTop(pbFontColor);
end;

procedure TfmQExport3XLSEditor.btnFontColorMouseUp(Sender: TObject;
  Button: TMouseButton; Shift: TShiftState; X, Y: Integer);
begin
  DecLeftAndTop(pbFontColor);
end;

procedure TfmQExport3XLSEditor.pbFontColorPaint(Sender: TObject);
var
  Fnt: TxlsFont;
begin
  Fnt := GetCurrFont;
  if not Assigned(Fnt) then Exit;
  PaintXLSColors(pbFontColor, Fnt.Color)
end;

procedure TfmQExport3XLSEditor.btnFontBoldClick(Sender: TObject);
var
  Fnt: TxlsFont;
begin
  Fnt := GetCurrFont;
  if not Assigned(Fnt) then Exit;
  XLSCustomFormatEditFontStyle(GetCurrFmtItem, xfsBold, btnFontBold.Down);
  ForAllListViewCustomItems(GetCurrFmtList, XLSUpdateItemFontBold,
    false, false);
end;

procedure TfmQExport3XLSEditor.btnFontItalicClick(Sender: TObject);
var
  Fnt: TxlsFont;
begin
  Fnt := GetCurrFont;
  if not Assigned(Fnt) then Exit;
  XLSCustomFormatEditFontStyle(GetCurrFmtItem, xfsItalic, btnFontItalic.Down);
  ForAllListViewCustomItems(GetCurrFmtList, XLSUpdateItemFontItalic,
    false, false);
end;

procedure TfmQExport3XLSEditor.btnFontStrikeOutClick(Sender: TObject);
var
  Fnt: TxlsFont;
begin
  Fnt := GetCurrFont;
  if not Assigned(Fnt) then Exit;
  XLSCustomFormatEditFontStyle(GetCurrFmtItem, xfsStrikeOut,
    btnFontStrikeOut.Down);
  ForAllListViewCustomItems(GetCurrFmtList, XLSUpdateItemFontStrikeOut,
    false, false);
end;

procedure TfmQExport3XLSEditor.btnUnderlineSingleClick(Sender: TObject);
var
  Fnt: TxlsFont;
begin
  Fnt := GetCurrFont;
  if not Assigned(Fnt) then Exit;
  if btnUnderlineSingle.Down
    then XLSCustomItemSetUnderline(GetCurrFmtItem, fulSingle)
    else XLSCustomItemSetUnderline(GetCurrFmtItem, fulNone);
  ForAllListViewCustomItems(GetCurrFmtList, XLSUpdateItemFontUnderline,
    false, false);
end;

procedure TfmQExport3XLSEditor.btnUnderlineSingleAccountingClick(
  Sender: TObject);
var
  Fnt: TxlsFont;
begin
  Fnt := GetCurrFont;
  if not Assigned(Fnt) then Exit;
  if btnUnderlineSingleAccounting.Down
    then XLSCustomItemSetUnderline(GetCurrFmtItem, fulSingleAccounting)
    else XLSCustomItemSetUnderline(GetCurrFmtItem, fulNone);
  ForAllListViewCustomItems(GetCurrFmtList, XLSUpdateItemFontUnderline,
    false, false);
end;

procedure TfmQExport3XLSEditor.btnUnderlineDoubleClick(Sender: TObject);
var
  Fnt: TxlsFont;
begin
  Fnt := GetCurrFont;
  if not Assigned(Fnt) then Exit;
  if btnUnderlineDouble.Down
    then XLSCustomItemSetUnderline(GetCurrFmtItem, fulDouble)
    else XLSCustomItemSetUnderline(GetCurrFmtItem, fulNone);
  ForAllListViewCustomItems(GetCurrFmtList, XLSUpdateItemFontUnderline,
    false, false);
end;

procedure TfmQExport3XLSEditor.btnUnderlineDoubleAccountingClick(
  Sender: TObject);
var
  Fnt: TxlsFont;
begin
  Fnt := GetCurrFont;
  if not Assigned(Fnt) then Exit;
  if btnUnderlineDoubleAccounting.Down
    then XLSCustomItemSetUnderline(GetCurrFmtItem, fulDoubleAccounting)
    else XLSCustomItemSetUnderline(GetCurrFmtItem, fulNone);
  ForAllListViewCustomItems(GetCurrFmtList, XLSUpdateItemFontUnderline,
    false, false);
end;

procedure TfmQExport3XLSEditor.btnHorizontalLeftClick(Sender: TObject);
var
  Algn: TxlsAlignment;
begin
  Algn := GetCurrAlignment;
  if not Assigned(Algn) then Exit;
  if btnHorizontalLeft.Down
    then XLSCustomItemSetHorAlignment(GetCurrFmtItem, halLeft)
    else XLSCustomItemSetHorAlignment(GetCurrFmtItem, halGeneral);
  ForAllListViewCustomItems(GetCurrFmtList, XLSUpdateItemHorAlignment,
    false, false);
end;

procedure TfmQExport3XLSEditor.btnHorizontalCenterClick(Sender: TObject);
var
  Algn: TxlsAlignment;
begin
  Algn := GetCurrAlignment;
  if not Assigned(Algn) then Exit;
  if btnHorizontalCenter.Down
    then XLSCustomItemSetHorAlignment(GetCurrFmtItem, halCenter)
    else XLSCustomItemSetHorAlignment(GetCurrFmtItem, halGeneral);
  ForAllListViewCustomItems(GetCurrFmtList, XLSUpdateItemHorAlignment,
    false, false);
end;

procedure TfmQExport3XLSEditor.btnHorizontalRightClick(Sender: TObject);
var
  Algn: TxlsAlignment;
begin
  Algn := GetCurrAlignment;
  if not Assigned(Algn) then Exit;
  if btnHorizontalRight.Down
    then XLSCustomItemSetHorAlignment(GetCurrFmtItem, halRight)
    else XLSCustomItemSetHorAlignment(GetCurrFmtItem, halGeneral);
  ForAllListViewCustomItems(GetCurrFmtList, XLSUpdateItemHorAlignment,
    false, false);
end;

procedure TfmQExport3XLSEditor.btnHorizontalFillClick(Sender: TObject);
var
  Algn: TxlsAlignment;
begin
  Algn := GetCurrAlignment;
  if not Assigned(Algn) then Exit;
  if btnHorizontalFill.Down
    then XLSCustomItemSetHorAlignment(GetCurrFmtItem, halFill)
    else XLSCustomItemSetHorAlignment(GetCurrFmtItem, halGeneral);
  ForAllListViewCustomItems(GetCurrFmtList, XLSUpdateItemHorAlignment,
    false, false);
end;

procedure TfmQExport3XLSEditor.btnVerticalTopClick(Sender: TObject);
var
  Algn: TxlsAlignment;
begin
  Algn := GetCurrAlignment;
  if not Assigned(Algn) then Exit;
  if btnVerticalTop.Down then
    XLSCustomItemSetVertAlignment(GetCurrFmtItem, valTop);
  ForAllListViewCustomItems(GetCurrFmtList, XLSUpdateItemVertAlignment,
    false, false);
end;

procedure TfmQExport3XLSEditor.btnVerticalCenterClick(Sender: TObject);
var
  Algn: TxlsAlignment;
begin
  Algn := GetCurrAlignment;
  if not Assigned(Algn) then Exit;
  if btnVerticalCenter.Down then
    XLSCustomItemSetVertAlignment(GetCurrFmtItem, valCenter);
  ForAllListViewCustomItems(GetCurrFmtList, XLSUpdateItemVertAlignment,
    false, false);
end;

procedure TfmQExport3XLSEditor.btnVerticalBottomClick(Sender: TObject);
var
  Algn: TxlsAlignment;
begin
  Algn := GetCurrAlignment;
  if not Assigned(Algn) then Exit;
  if btnVerticalBottom.Down then
    XLSCustomItemSetVertAlignment(GetCurrFmtItem, valBottom);
  ForAllListViewCustomItems(GetCurrFmtList, XLSUpdateItemVertAlignment,
    false, false);
end;

procedure TfmQExport3XLSEditor.btnBorderTopClick(Sender: TObject);
var
  Brdrs: TxlsBorders;
begin
  Brdrs := GetCurrBorders;
  if not Assigned(Brdrs) then Exit;
  if btnBorderTop.Down and (cbBorderTop.ItemIndex = 0)
    then cbBorderTop.ItemIndex := 1
    else cbBorderTop.ItemIndex := 0;
  cbBorderTop.OnChange(nil);
end;

procedure TfmQExport3XLSEditor.btnBorderBottomClick(Sender: TObject);
var
  Brdrs: TxlsBorders;
begin
  Brdrs := GetCurrBorders;
  if not Assigned(Brdrs) then Exit;
  if btnBorderBottom.Down and (cbBorderBottom.ItemIndex = 0)
    then cbBorderBottom.ItemIndex := 1
    else cbBorderBottom.ItemIndex := 0;
  cbBorderBottom.OnChange(nil);
end;

procedure TfmQExport3XLSEditor.btnBorderLeftClick(Sender: TObject);
var
  Brdrs: TxlsBorders;
begin
  Brdrs := GetCurrBorders;
  if not Assigned(Brdrs) then Exit;
  if btnBorderLeft.Down and (cbBorderLeft.ItemIndex = 0)
    then cbBorderLeft.ItemIndex := 1
    else cbBorderLeft.ItemIndex := 0;
  cbBorderLeft.OnChange(nil);
end;

procedure TfmQExport3XLSEditor.btnBorderRightClick(Sender: TObject);
var
  Brdrs: TxlsBorders;
begin
  Brdrs := GetCurrBorders;
  if not Assigned(Brdrs) then Exit;
  if btnBorderRight.Down and (cbBorderRight.ItemIndex = 0)
    then cbBorderRight.ItemIndex := 1
    else cbBorderRight.ItemIndex := 0;
  cbBorderRight.OnChange(nil);
end;

procedure TfmQExport3XLSEditor.cbBorderTopChange(Sender: TObject);
var
  Brdrs: TxlsBorders;
begin
  Brdrs := GetCurrBorders;
  if not Assigned(Brdrs) then Exit;
  btnBorderTop.Down := cbBorderTop.ItemIndex > 0;
  if cbBorderTop.ItemIndex >= 0  then
    Brdrs.Top.Style := TxlsBorderStyle(cbBorderTop.ItemIndex);
  ForAllListViewCustomItems(GetCurrFmtList, XLSUpdateItemBorderTop,
    false, false);
end;

procedure TfmQExport3XLSEditor.cbBorderTopDrawItem(Control: TWinControl;
  Index: Integer; Rect: TRect; State: TOwnerDrawState);
var
  Brdrs: TxlsBorders;
  Invert: boolean;
begin
  Brdrs := GetCurrBorders;
  if not Assigned(Brdrs) then Exit;
  Invert := (odSelected in State) or (odFocused in State);
  with (Control as TComboBox).Canvas do begin
    FillRect(Rect);
    if Invert then Pen.Color := clWhite
    else Pen.Color := XLS_STANDARD_PALETTE[Integer(Brdrs.Top.Color)];
  end;
  DrawBorderStyle(TxlsBorderStyle(Index), (Control as TComboBox).Canvas, Rect);
end;

procedure TfmQExport3XLSEditor.cbBorderBottomChange(Sender: TObject);
var
  Brdrs: TxlsBorders;
begin
  Brdrs := GetCurrBorders;
  if not Assigned(Brdrs) then Exit;
  btnBorderBottom.Down := cbBorderBottom.ItemIndex > 0;
  if cbBorderBottom.ItemIndex >= 0  then
    Brdrs.Bottom.Style := TxlsBorderStyle(cbBorderBottom.ItemIndex);
  ForAllListViewCustomItems(GetCurrFmtList, XLSUpdateItemBorderBottom,
    false, false);
end;

procedure TfmQExport3XLSEditor.cbBorderBottomDrawItem(Control: TWinControl;
  Index: Integer; Rect: TRect; State: TOwnerDrawState);
var
  Brdrs: TxlsBorders;
  Invert: boolean;
begin
  Brdrs := GetCurrBorders;
  if not Assigned(Brdrs) then Exit;
  Invert := (odSelected in State) or (odFocused in State);
  with (Control as TComboBox).Canvas do begin
    FillRect(Rect);
    if Invert
      then Pen.Color := clWhite
      else Pen.Color := XLS_STANDARD_PALETTE[Integer(Brdrs.Bottom.Color)];
  end;
  DrawBorderStyle(TxlsBorderStyle(Index), (Control as TComboBox).Canvas, Rect);
end;

procedure TfmQExport3XLSEditor.cbBorderLeftChange(Sender: TObject);
var
  Brdrs: TxlsBorders;
begin
  Brdrs := GetCurrBorders;
  if not Assigned(Brdrs) then Exit;
  btnBorderLeft.Down := cbBorderLeft.ItemIndex > 0;
  if cbBorderLeft.ItemIndex >= 0  then
    Brdrs.Left.Style := TxlsBorderStyle(cbBorderLeft.ItemIndex);
  ForAllListViewCustomItems(GetCurrFmtList, XLSUpdateItemBorderLeft,
    false, false);
end;

procedure TfmQExport3XLSEditor.cbBorderLeftDrawItem(Control: TWinControl;
  Index: Integer; Rect: TRect; State: TOwnerDrawState);
var
  Brdrs: TxlsBorders;
  Invert: boolean;
begin
  Brdrs := GetCurrBorders;
  if not Assigned(Brdrs) then Exit;
  Invert := (odSelected in State) or (odFocused in State);
  with (Control as TComboBox).Canvas do begin
    FillRect(Rect);
    if Invert
      then Pen.Color := clWhite
      else Pen.Color := XLS_STANDARD_PALETTE[Integer(Brdrs.Left.Color)];
  end;
  DrawBorderStyle(TxlsBorderStyle(Index), (Control as TComboBox).Canvas, Rect);
end;

procedure TfmQExport3XLSEditor.cbBorderRightChange(Sender: TObject);
var
  Brdrs: TxlsBorders;
begin
  Brdrs := GetCurrBorders;
  if not Assigned(Brdrs) then Exit;
  btnBorderRight.Down := cbBorderRight.ItemIndex > 0;
  if cbBorderRight.ItemIndex >= 0  then
    Brdrs.Right.Style := TxlsBorderStyle(cbBorderRight.ItemIndex);
  ForAllListViewCustomItems(GetCurrFmtList, XLSUpdateItemBorderRight,
    false, false);
end;

procedure TfmQExport3XLSEditor.cbBorderRightDrawItem(Control: TWinControl;
  Index: Integer; Rect: TRect; State: TOwnerDrawState);
var
  Brdrs: TxlsBorders;
  Invert: boolean;
begin
  Brdrs := GetCurrBorders;
  if not Assigned(Brdrs) then Exit;
  Invert := (odSelected in State) or (odFocused in State);
  with (Control as TComboBox).Canvas do begin
    FillRect(Rect);
    if Invert
      then Pen.Color := clWhite
      else Pen.Color := XLS_STANDARD_PALETTE[Integer(Brdrs.Right.Color)];
  end;
  DrawBorderStyle(TxlsBorderStyle(Index), (Control as TComboBox).Canvas, Rect);
end;

procedure TfmQExport3XLSEditor.btnBorderTopColorClick(Sender: TObject);
var
  OClr, NClr: TxlsColor;
  Brdrs: TxlsBorders;
begin
  Brdrs := GetCurrBorders;
  if not Assigned(Brdrs) then Exit;
  OClr := Brdrs.Top.Color;
  NClr := RunXLSColorEditor(OClr);
  Brdrs.Top.Color := NClr;
  ForAllListViewCustomItems(GetCurrFmtList, XLSUpdateItemBorderTopColor,
    false, false);
  cbBorderTop.Repaint;
end;

procedure TfmQExport3XLSEditor.btnBorderTopColorMouseDown(Sender: TObject;
  Button: TMouseButton; Shift: TShiftState; X, Y: Integer);
begin
  IncLeftAndTop(pbBorderTop);
end;

procedure TfmQExport3XLSEditor.btnBorderTopColorMouseUp(Sender: TObject;
  Button: TMouseButton; Shift: TShiftState; X, Y: Integer);
begin
  DecLeftAndTop(pbBorderTop);
end;

procedure TfmQExport3XLSEditor.pbBorderTopPaint(Sender: TObject);
var
  Brdrs: TxlsBorders;
begin
  Brdrs := GetCurrBorders;
  if not Assigned(Brdrs) then Exit;
  PaintXLSColors(pbBorderTop, Brdrs.Top.Color)
end;

procedure TfmQExport3XLSEditor.btnBorderBottomColorClick(Sender: TObject);
var
  OClr, NClr: TxlsColor;
  Brdrs: TxlsBorders;
begin
  Brdrs := GetCurrBorders;
  if not Assigned(Brdrs) then Exit;
  OClr := Brdrs.Bottom.Color;
  NClr := RunXLSColorEditor(OClr);
  Brdrs.Bottom.Color := NClr;
  ForAllListViewCustomItems(GetCurrFmtList, XLSUpdateItemBorderBottomColor,
    false, false);
  cbBorderBottom.Repaint;
end;

procedure TfmQExport3XLSEditor.btnBorderBottomColorMouseDown(Sender: TObject;
  Button: TMouseButton; Shift: TShiftState; X, Y: Integer);
begin
  IncLeftAndTop(pbBorderBottom);
end;

procedure TfmQExport3XLSEditor.btnBorderBottomColorMouseUp(Sender: TObject;
  Button: TMouseButton; Shift: TShiftState; X, Y: Integer);
begin
  DecLeftAndTop(pbBorderBottom);
end;

procedure TfmQExport3XLSEditor.pbBorderBottomPaint(Sender: TObject);
var
  Brdrs: TxlsBorders;
begin
  Brdrs := GetCurrBorders;
  if not Assigned(Brdrs) then Exit;
  PaintXLSColors(pbBorderBottom, Brdrs.Bottom.Color)
end;

procedure TfmQExport3XLSEditor.btnBorderLeftColorClick(Sender: TObject);
var
  OClr, NClr: TxlsColor;
  Brdrs: TxlsBorders;
begin
  Brdrs := GetCurrBorders;
  if not Assigned(Brdrs) then Exit;
  OClr := Brdrs.Left.Color;
  NClr := RunXLSColorEditor(OClr);
  Brdrs.Left.Color := NClr;
  ForAllListViewCustomItems(GetCurrFmtList, XLSUpdateItemBorderLeftColor,
    false, false);
  cbBorderLeft.Repaint;
end;

procedure TfmQExport3XLSEditor.btnBorderLeftColorMouseDown(Sender: TObject;
  Button: TMouseButton; Shift: TShiftState; X, Y: Integer);
begin
  IncLeftAndTop(pbBorderLeft);
end;

procedure TfmQExport3XLSEditor.btnBorderLeftColorMouseUp(Sender: TObject;
  Button: TMouseButton; Shift: TShiftState; X, Y: Integer);
begin
  DecLeftAndTop(pbBorderLeft);
end;

procedure TfmQExport3XLSEditor.pbBorderLeftPaint(Sender: TObject);
var
  Brdrs: TxlsBorders;
begin
  Brdrs := GetCurrBorders;
  if not Assigned(Brdrs) then Exit;
  PaintXLSColors(pbBorderLeft, Brdrs.Left.Color);
end;

procedure TfmQExport3XLSEditor.btnBorderRightColorClick(Sender: TObject);
var
  OClr, NClr: TxlsColor;
  Brdrs: TxlsBorders;
begin
  Brdrs := GetCurrBorders;
  if not Assigned(Brdrs) then Exit;
  OClr := Brdrs.Right.Color;
  NClr := RunXLSColorEditor(OClr);
  Brdrs.Right.Color := NClr;
  ForAllListViewCustomItems(GetCurrFmtList, XLSUpdateItemBorderRightColor,
    false, false);
  cbBorderRight.Repaint;
end;

procedure TfmQExport3XLSEditor.btnBorderRightColorMouseDown(Sender: TObject;
  Button: TMouseButton; Shift: TShiftState; X, Y: Integer);
begin
  IncLeftAndTop(pbBorderRight);
end;

procedure TfmQExport3XLSEditor.btnBorderRightColorMouseUp(Sender: TObject;
  Button: TMouseButton; Shift: TShiftState; X, Y: Integer);
begin
  DecLeftAndTop(pbBorderRight);
end;

procedure TfmQExport3XLSEditor.pbBorderRightPaint(Sender: TObject);
var
  Brdrs: TxlsBorders;
begin
  Brdrs := GetCurrBorders;
  if not Assigned(Brdrs) then Exit;
  PaintXLSColors(pbBorderRight, Brdrs.Right.Color);
end;

procedure TfmQExport3XLSEditor.btnFillBackgroundClick(Sender: TObject);
var
  OClr, NClr: TxlsColor;
  Fill: TxlsFill;
begin
  Fill := GetCurrFill;
  if not Assigned(Fill) then Exit;
  OClr := Fill.Background;
  NClr := RunXLSColorEditor(OClr);
  Fill.Background := NClr;
  ForAllListViewCustomItems(GetCurrFmtList, XLSUpdateItemFillBackground,
    false, false);
  if (Fill.Background <> clrWhite) and (Fill.Pattern = ptNone) then begin
    Fill.Pattern := ptSolid;
    ForAllListViewCustomItems(GetCurrFmtList, XLSUpdateItemFillPattern,
      false, false);
    TuneFormats;
  end;
  cbPattern.Repaint;
end;

procedure TfmQExport3XLSEditor.btnFillBackgroundMouseDown(Sender: TObject;
  Button: TMouseButton; Shift: TShiftState; X, Y: Integer);
begin
  IncLeftAndTop(pbFillBackground);
end;

procedure TfmQExport3XLSEditor.btnFillBackgroundMouseUp(Sender: TObject;
  Button: TMouseButton; Shift: TShiftState; X, Y: Integer);
begin
  DecLeftAndTop(pbFillBackground);
end;

procedure TfmQExport3XLSEditor.pbFillBackgroundPaint(Sender: TObject);
var
  Fill: TxlsFill;
begin
  Fill := GetCurrFill;
  if not Assigned(Fill) then Exit;
  PaintXLSColors(pbFillBackground, Fill.Background)
end;

procedure TfmQExport3XLSEditor.cbPatternChange(Sender: TObject);
var
  Fill: TxlsFill;
begin
  Fill := GetCurrFill;
  if not Assigned(Fill) then Exit;
  if cbPattern.ItemIndex >= 0 then begin
    Fill.Pattern := TxlsPattern(cbPattern.ItemIndex);
    ForAllListViewCustomItems(GetCurrFmtList, XLSUpdateItemFillPattern,
      false, false);

    if (cbPattern.ItemIndex = 0) and (Fill.Background <> clrWhite) then begin
      Fill.Background := clrWhite;
      ForAllListViewCustomItems(GetCurrFmtList, XLSUpdateItemFillBackground,
        false, false);
    end;
  end;
end;

procedure TfmQExport3XLSEditor.cbPatternDrawItem(Control: TWinControl;
  Index: Integer; Rect: TRect; State: TOwnerDrawState);
var
//  Invert: boolean;
  x, y: integer;
  Fill: TxlsFill;
begin
  Fill := GetCurrFill;
  if not Assigned(Fill) then Exit;
//  Invert := (odSelected in State) or (odFocused in State);
  with (Control as TComboBox).Canvas do begin
{    if Invert then begin
        Brush.Color := XLS_STANDART_PALETTE[39 - Integer(TxlsFormat(CurrXLSListView.Selected.Data).Fill.Background)];
        Pen.Color := XLS_STANDART_PALETTE[39 - Integer(TxlsFormat(CurrXLSListView.Selected.Data).Fill.Foreground)];
    end
    else begin}
      Brush.Color := XLS_STANDARD_PALETTE[Integer(Fill.Background)];
      Pen.Color := XLS_STANDARD_PALETTE[Integer(Fill.Foreground)];
    {end;}
    if Index > 0 then
    FillRect(Rect);

    if Index = 0 then begin
      Brush.Color := clWhite;
      FillRect(Rect);
      Font.Color := clBlack ;
      TextOut((Rect.Right + Rect.Left - TextWidth({$IFDEF WIN32}QExportLoadStr(QED_XLS_Fill_Pattern_None){$ENDIF}
                                                  {$IFDEF LINUX}QED_XLS_Fill_Pattern_None{$ENDIF})) div 2,
              (Rect.Bottom + Rect.Top - TextHeight({$IFDEF WIN32}QExportLoadStr(QED_XLS_Fill_Pattern_None){$ENDIF}
                                                   {$IFDEF LINUX}QED_XLS_Fill_Pattern_None{$ENDIF})) div 2,
        {$IFDEF WIN32}QExportLoadStr(QED_XLS_Fill_Pattern_None){$ENDIF}
        {$IFDEF LINUX}QED_XLS_Fill_Pattern_None{$ENDIF});
    end
    else begin
      x := Rect.Left;
      y := Rect.Top;
      while y <= Rect.Bottom - 4 do begin
        while x <= Rect.Right do begin
          DrawPattern((Control as TComboBox).Canvas, Index, x, y);
          Inc(x, 4);
        end;
        Inc(y, 4);
        x := Rect.Left;
      end
    end;
  end;
end;

procedure TfmQExport3XLSEditor.btnFillForegroundClick(Sender: TObject);
var
  OClr, NClr: TxlsColor;
  Fill: TxlsFill;
begin
  Fill := GetCurrFill;
  if not Assigned(Fill) then Exit;
  OClr := Fill.Foreground;
  NClr := RunXLSColorEditor(OClr);
  Fill.Foreground := NClr;
  ForAllListViewCustomItems(GetCurrFmtList, XLSUpdateItemFillForeground,
    false, false);
  TuneFormats;
  cbPattern.Repaint;
end;

procedure TfmQExport3XLSEditor.btnFillForegroundMouseDown(Sender: TObject;
  Button: TMouseButton; Shift: TShiftState; X, Y: Integer);
begin
  IncLeftAndTop(pbFillForeground);
end;

procedure TfmQExport3XLSEditor.btnFillForegroundMouseUp(Sender: TObject;
  Button: TMouseButton; Shift: TShiftState; X, Y: Integer);
begin
  DecLeftAndTop(pbFillForeground);
end;

procedure TfmQExport3XLSEditor.pbFillForegroundPaint(Sender: TObject);
var
  Fill: TxlsFill;
begin
  Fill := GetCurrFill;
  if not Assigned(Fill) then Exit;
  PaintXLSColors(pbFillForeground, Fill.Foreground)
end;

procedure TfmQExport3XLSEditor.rgXLSFunctionClick(Sender: TObject);
var
  Item: TxlsCustomItem;
begin
  Item := GetCurrFmtItem;
  if not Assigned(Item) then Exit;
  TxlsFieldFormat(Item).Aggregate :=
    TxlsAggregate(rgXLSFunction.ItemIndex);
  ForAllListViewCustomItems(GetCurrFmtList, XLSUpdateItemAggregate,
    false, false);
end;

procedure TfmQExport3XLSEditor.pbXLSCellPaint(Sender: TObject);
{var
  LV: TListView;}
begin
{  LV := CurrentFormatListView;
  if not Assigned(LV) then Exit;
  if LV.SelCount < 1 then Exit;
  if LV.SelCount = 1
    then DrawXLSCell(pbXLSCell, TxlsFormat(LV.Selected.Data))
    else DrawXLSCell(pbXLSCell, TxlsFormat(FFormatListItem.Data))}
end;

procedure TfmQExport3XLSEditor.lvFieldFormatsChange(Sender: TObject;
  Item: TListItem; Change: TItemChange);
begin
  if not (csDestroying in ComponentState) then begin
    if (FCurrColumn <> Item) and Item.Focused then begin
      FCurrColumn := Item;
      TuneFormats;
    end;
  end;
end;

procedure TfmQExport3XLSEditor.lvOptionsChange(Sender: TObject;
  Item: TListItem; Change: TItemChange);
begin
  if not (csDestroying in ComponentState) then begin
    if (FCurrOption <> Item) and Item.Focused then begin
      FCurrOption := Item;
      TuneFormats;
    end;
  end;
end;

procedure TfmQExport3XLSEditor.lvStylesChange(Sender: TObject;
  Item: TListItem; Change: TItemChange);
begin
  if not (csDestroying in ComponentState) then
    if (FCurrOption <> Item) and Item.Focused then begin
      FCurrOption := Item;
      TuneFormats;
    end;
end;

procedure TfmQExport3XLSEditor.tvExtensionsChange(Sender: TObject;
  Node: TTreeNode);
begin
  if not (csDestroying in ComponentState) then
//    if (FCurrOption <> Item) and Item.Focused then begin
//      FCurrOption := Item;
      TuneFormats;
//    end;
end;

function TfmQExport3XLSEditor.CurrentSheetMemo: TMemo;
begin
  if pcSheetOptions.ActivePage = tsHeader then Result := mmHeader
  else if pcSheetOptions.ActivePage = tsFooter then Result := mmFooter
  else Result := nil;
end;

procedure TfmQExport3XLSEditor.XLSUpdateItemFont(Item: TxlsCustomItem);
var
  CurrItem: TxlsCustomItem;
begin
  CurrItem := GetCurrFmtItem;
  if Item = CurrItem then Exit;
  case Item.ItemType of
    itFormat,
    itFieldFormat:
      if CurrItem.ItemType in [itFormat, itFieldFormat] then
        (Item as TxlsFormat).Font.Name := (CurrItem as TxlsFormat).Font.Name;
    itNoteFormat:
      if CurrItem.ItemType = itNoteFormat then
        (Item as TxlsNoteFormat).Font.Name :=
          (CurrItem as TxlsNoteFormat).Font.Name;
    itHyperlink:
      if CurrItem.ItemType = itHyperlink then
        (Item as TxlsHyperlink).Format.Font.Name :=
          (CurrItem as TxlsHyperlink).Format.Font.Name;
    itNote:
      if CurrItem.ItemType = itNote then
        (Item as TxlsNote).Format.Font.Name :=
          (CurrItem as TxlsNote).Format.Font.Name;
  end;
end;

procedure TfmQExport3XLSEditor.XLSUpdateItemFontSize(Item: TxlsCustomItem);
var
  CurrItem: TxlsCustomItem;
begin
  CurrItem := GetCurrFmtItem;
  if Item = CurrItem then Exit;
  case Item.ItemType of
    itFormat,
    itFieldFormat:
      if CurrItem.ItemType in [itFormat, itFieldFormat] then
        (Item as TxlsFormat).Font.Size := (CurrItem as TxlsFormat).Font.Size;
    itNoteFormat:
      if CurrItem.ItemType = itNoteFormat then
        (Item as TxlsNoteFormat).Font.Size :=
          (CurrItem as TxlsNoteFormat).Font.Size;
    itHyperlink:
      if CurrItem.ItemType = itHyperlink then
        (Item as TxlsHyperlink).Format.Font.Size :=
          (CurrItem as TxlsHyperlink).Format.Font.Size;
    itNote:
      if CurrItem.ItemType = itNote then
        (Item as TxlsNote).Format.Font.Size :=
          (CurrItem as TxlsNote).Format.Font.Size;
  end;
{  if Item <> GetCurrFmtItem then
    TxlsFormat(Item).Font.Size :=
      TxlsFormat(GetCurrFmtItem).Font.Size;}
end;

procedure TfmQExport3XLSEditor.XLSUpdateItemFontColor(Item: TxlsCustomItem);
var
  CurrItem: TxlsCustomItem;
begin
  CurrItem := GetCurrFmtItem;
  if Item = CurrItem then Exit;
  case Item.ItemType of
    itFormat,
    itFieldFormat:
      if CurrItem.ItemType in [itFormat, itFieldFormat] then
        (Item as TxlsFormat).Font.Color := (CurrItem as TxlsFormat).Font.Color;
    itNoteFormat:
      if CurrItem.ItemType = itNoteFormat then
        (Item as TxlsNoteFormat).Font.Color :=
          (CurrItem as TxlsNoteFormat).Font.Color;
    itHyperlink:
      if CurrItem.ItemType = itHyperlink then
        (Item as TxlsHyperlink).Format.Font.Color :=
          (CurrItem as TxlsHyperlink).Format.Font.Color;
    itNote:
      if CurrItem.ItemType = itNote then
        (Item as TxlsNote).Format.Font.Color :=
          (CurrItem as TxlsNote).Format.Font.Color;
  end;
{  if Item <> GetCurrFmtItem then
    TxlsFormat(Item).Font.Color :=
      TxlsFormat(GetCurrFmtItem).Font.Color;}
end;

procedure TfmQExport3XLSEditor.XLSUpdateItemFontBold(Item: TxlsCustomItem);
var
  CurrItem: TxlsCustomItem;
begin
  CurrItem := GetCurrFmtItem;
  if Item = CurrItem then Exit;
  case Item.ItemType of
    itFormat,
    itFieldFormat:
      if CurrItem.ItemType in [itFormat, itFieldFormat] then
        XLSCustomFormatEditFontStyle(Item, xfsBold,
          xfsBold in (CurrItem as TxlsFormat).Font.Style);
    itNoteFormat:
      if CurrItem.ItemType = itNoteFormat then
        XLSCustomFormatEditFontStyle(Item, xfsBold,
          xfsBold in (CurrItem as TxlsNoteFormat).Font.Style);
    itHyperlink:
      if CurrItem.ItemType = itHyperlink then
        XLSCustomFormatEditFontStyle(Item, xfsBold,
          xfsBold in (CurrItem as TxlsHyperlink).Format.Font.Style);
    itNote:
      if CurrItem.ItemType = itNote then
        XLSCustomFormatEditFontStyle(Item, xfsBold,
          xfsBold in (CurrItem as TxlsNote).Format.Font.Style);
  end;
{  if Item <> GetCurrFmtItem then
    XLSCustomFormatEditFontStyle(Item, xfsBold,
      xfsBold in TxlsFormat(GetCurrFmtItem).Font.Style);}
end;

procedure TfmQExport3XLSEditor.XLSUpdateItemFontItalic(Item: TxlsCustomItem);
var
  CurrItem: TxlsCustomItem;
begin
  CurrItem := GetCurrFmtItem;
  if Item = CurrItem then Exit;
  case Item.ItemType of
    itFormat,
    itFieldFormat:
      if CurrItem.ItemType in [itFormat, itFieldFormat] then
        XLSCustomFormatEditFontStyle(Item, xfsItalic,
          xfsItalic in (CurrItem as TxlsFormat).Font.Style);
    itNoteFormat:
      if CurrItem.ItemType = itNoteFormat then
        XLSCustomFormatEditFontStyle(Item, xfsItalic,
          xfsItalic in (CurrItem as TxlsNoteFormat).Font.Style);
    itHyperlink:
      if CurrItem.ItemType = itHyperlink then
        XLSCustomFormatEditFontStyle(Item, xfsItalic,
          xfsItalic in (CurrItem as TxlsHyperlink).Format.Font.Style);
    itNote:
      if CurrItem.ItemType = itNote then
        XLSCustomFormatEditFontStyle(Item, xfsItalic,
          xfsItalic in (CurrItem as TxlsNote).Format.Font.Style);
  end;
{  if Item <> GetCurrFmtItem then
    XLSCustomFormatEditFontStyle(Item, xfsItalic,
      xfsItalic in TxlsFormat(GetCurrFmtItem).Font.Style);}
end;

procedure TfmQExport3XLSEditor.XLSUpdateItemFontStrikeOut(
  Item: TxlsCustomItem);
var
  CurrItem: TxlsCustomItem;
begin
  CurrItem := GetCurrFmtItem;
  if Item = CurrItem then Exit;
  case Item.ItemType of
    itFormat,
    itFieldFormat:
      if CurrItem.ItemType in [itFormat, itFieldFormat] then
        XLSCustomFormatEditFontStyle(Item, xfsStrikeOut,
          xfsStrikeOut in (CurrItem as TxlsFormat).Font.Style);
    itNoteFormat:
      if CurrItem.ItemType = itNoteFormat then
        XLSCustomFormatEditFontStyle(Item, xfsStrikeOut,
          xfsStrikeOut in (CurrItem as TxlsNoteFormat).Font.Style);
    itHyperlink:
      if CurrItem.ItemType = itHyperlink then
        XLSCustomFormatEditFontStyle(Item, xfsStrikeOut,
          xfsStrikeOut in (CurrItem as TxlsHyperlink).Format.Font.Style);
    itNote:
      if CurrItem.ItemType = itNote then
        XLSCustomFormatEditFontStyle(Item, xfsStrikeOut,
          xfsStrikeOut in (CurrItem as TxlsNote).Format.Font.Style);
  end;
  {if Item <> GetCurrFmtItem then
    XLSCustomFormatEditFontStyle(Item, xfsStrikeOut,
      xfsStrikeOut in TxlsFormat(GetCurrFmtItem).Font.Style);}
end;

procedure TfmQExport3XLSEditor.XLSUpdateItemFontUnderline(
  Item: TxlsCustomItem);
var
  CurrItem: TxlsCustomItem;
begin
  CurrItem := GetCurrFmtItem;
  if Item = CurrItem then Exit;
  case Item.ItemType of
    itFormat,
    itFieldFormat:
      if CurrItem.ItemType in [itFormat, itFieldFormat] then
        (Item as TxlsFormat).Font.Underline :=
          (CurrItem as TxlsFormat).Font.Underline;
    itNoteFormat:
      if CurrItem.ItemType = itNoteFormat then
        (Item as TxlsNoteFormat).Font.Underline :=
          (CurrItem as TxlsNoteFormat).Font.Underline;
    itHyperlink:
      if CurrItem.ItemType = itHyperlink then
        (Item as TxlsHyperlink).Format.Font.Underline :=
          (CurrItem as TxlsHyperlink).Format.Font.Underline;
    itNote:
      if CurrItem.ItemType = itNote then
        (Item as TxlsNote).Format.Font.Underline :=
          (CurrItem as TxlsNote).Format.Font.Underline;
  end;
  {if Item <> GetCurrFmtItem then
    TxlsFormat(Item).Font.Underline :=
      TxlsFormat(GetCurrFmtItem).Font.Underline;}
end;

procedure TfmQExport3XLSEditor.XLSUpdateItemHorAlignment(
  Item: TxlsCustomItem);
var
  CurrItem: TxlsCustomItem;
begin
  CurrItem := GetCurrFmtItem;
  if Item = CurrItem then Exit;
  case Item.ItemType of
    itFormat,
    itFieldFormat:
      if CurrItem.ItemType in [itFormat, itFieldFormat] then
        (Item as TxlsFormat).Alignment.Horizontal :=
          (CurrItem as TxlsFormat).Alignment.Horizontal;
    itNoteFormat:
      if CurrItem.ItemType = itNoteFormat then
        (Item as TxlsNoteFormat).Alignment.Horizontal :=
          (CurrItem as TxlsNoteFormat).Alignment.Horizontal;
    itHyperlink:
      if CurrItem.ItemType = itHyperlink then
        (Item as TxlsHyperlink).Format.Alignment.Horizontal :=
          (CurrItem as TxlsHyperlink).Format.Alignment.Horizontal;
    itNote:
      if CurrItem.ItemType = itNote then
        (Item as TxlsNote).Format.Alignment.Horizontal :=
          (CurrItem as TxlsNote).Format.Alignment.Horizontal;
  end;
{  if Item <> GetCurrFmtItem then
    TxlsFormat(Item).Alignment.Horizontal :=
      TxlsFormat(GetCurrFmtItem).Alignment.Horizontal;}
end;

procedure TfmQExport3XLSEditor.XLSUpdateItemVertAlignment(
  Item: TxlsCustomItem);
var
  CurrItem: TxlsCustomItem;
begin
  CurrItem := GetCurrFmtItem;
  if Item = CurrItem then Exit;
  case Item.ItemType of
    itFormat,
    itFieldFormat:
      if CurrItem.ItemType in [itFormat, itFieldFormat] then
        (Item as TxlsFormat).Alignment.Vertical :=
          (CurrItem as TxlsFormat).Alignment.Vertical;
    itNoteFormat:
      if CurrItem.ItemType = itNoteFormat then
        (Item as TxlsNoteFormat).Alignment.Vertical :=
          (CurrItem as TxlsNoteFormat).Alignment.Vertical;
    itHyperlink:
      if CurrItem.ItemType = itHyperlink then
        (Item as TxlsHyperlink).Format.Alignment.Vertical :=
          (CurrItem as TxlsHyperlink).Format.Alignment.Vertical;
    itNote:
      if CurrItem.ItemType = itNote then
        (Item as TxlsNote).Format.Alignment.Vertical :=
          (CurrItem as TxlsNote).Format.Alignment.Vertical;
  end;
{  if Item <> GetCurrFmtItem then
    TxlsFormat(Item).Alignment.Vertical :=
      TxlsFormat(GetCurrFmtItem).Alignment.Vertical;}
end;

procedure TfmQExport3XLSEditor.XLSUpdateItemBorderTop(Item: TxlsCustomItem);
var
  CurrItem: TxlsCustomItem;
begin
  CurrItem := GetCurrFmtItem;
  if Item = CurrItem then Exit;
  case Item.ItemType of
    itFormat,
    itFieldFormat:
      if CurrItem.ItemType in [itFormat, itFieldFormat] then
        (Item as TxlsFormat).Borders.Top.Style :=
          (CurrItem as TxlsFormat).Borders.Top.Style;
    itHyperlink:
      if CurrItem.ItemType = itHyperlink then
        (Item as TxlsHyperlink).Format.Borders.Top.Style :=
          (CurrItem as TxlsHyperlink).Format.Borders.Top.Style;
  end;
{  if Item <> GetCurrFmtItem then
    TxlsFormat(Item).Borders.Top.Style :=
      TxlsFormat(GetCurrFmtItem).Borders.Top.Style;}
end;

procedure TfmQExport3XLSEditor.XLSUpdateItemBorderTopColor(
  Item: TxlsCustomItem);
var
  CurrItem: TxlsCustomItem;
begin
  CurrItem := GetCurrFmtItem;
  if Item = CurrItem then Exit;
  case Item.ItemType of
    itFormat,
    itFieldFormat:
      if CurrItem.ItemType in [itFormat, itFieldFormat] then
        (Item as TxlsFormat).Borders.Top.Color :=
          (CurrItem as TxlsFormat).Borders.Top.Color;
    itHyperlink:
      if CurrItem.ItemType = itHyperlink then
        (Item as TxlsHyperlink).Format.Borders.Top.Color :=
          (CurrItem as TxlsHyperlink).Format.Borders.Top.Color;
  end;
{  if Item <> GetCurrFmtItem then
    TxlsFormat(Item).Borders.Top.Color :=
      TxlsFormat(GetCurrFmtItem).Borders.Top.Color;}
end;

procedure TfmQExport3XLSEditor.XLSUpdateItemBorderBottom(
  Item: TxlsCustomItem);
var
  CurrItem: TxlsCustomItem;
begin
  CurrItem := GetCurrFmtItem;
  if Item = CurrItem then Exit;
  case Item.ItemType of
    itFormat,
    itFieldFormat:
      if CurrItem.ItemType in [itFormat, itFieldFormat] then
        (Item as TxlsFormat).Borders.Bottom.Style :=
          (CurrItem as TxlsFormat).Borders.Bottom.Style;
    itHyperlink:
      if CurrItem.ItemType = itHyperlink then
        (Item as TxlsHyperlink).Format.Borders.Bottom.Style :=
          (CurrItem as TxlsHyperlink).Format.Borders.Bottom.Style;
  end;
{  if Item <> GetCurrFmtItem then
    TxlsFormat(Item).Borders.Bottom.Style :=
      TxlsFormat(GetCurrFmtItem).Borders.Bottom.Style;}
end;

procedure TfmQExport3XLSEditor.XLSUpdateItemBorderBottomColor(
  Item: TxlsCustomItem);
var
  CurrItem: TxlsCustomItem;
begin
  CurrItem := GetCurrFmtItem;
  if Item = CurrItem then Exit;
  case Item.ItemType of
    itFormat,
    itFieldFormat:
      if CurrItem.ItemType in [itFormat, itFieldFormat] then
        (Item as TxlsFormat).Borders.Bottom.Color :=
          (CurrItem as TxlsFormat).Borders.Bottom.Color;
    itHyperlink:
      if CurrItem.ItemType = itHyperlink then
        (Item as TxlsHyperlink).Format.Borders.Bottom.Color :=
          (CurrItem as TxlsHyperlink).Format.Borders.Bottom.Color;
  end;
{  if Item <> GetCurrFmtItem then
    TxlsFormat(Item).Borders.Bottom.Color :=
      TxlsFormat(GetCurrFmtItem).Borders.Bottom.Color;}
end;

procedure TfmQExport3XLSEditor.XLSUpdateItemBorderLeft(Item: TxlsCustomItem);
var
  CurrItem: TxlsCustomItem;
begin
  CurrItem := GetCurrFmtItem;
  if Item = CurrItem then Exit;
  case Item.ItemType of
    itFormat,
    itFieldFormat:
      if CurrItem.ItemType in [itFormat, itFieldFormat] then
        (Item as TxlsFormat).Borders.Left.Style :=
          (CurrItem as TxlsFormat).Borders.Left.Style;
    itHyperlink:
      if CurrItem.ItemType = itHyperlink then
        (Item as TxlsHyperlink).Format.Borders.Left.Style :=
          (CurrItem as TxlsHyperlink).Format.Borders.Left.Style;
  end;
{  if Item <> GetCurrFmtItem then
    TxlsFormat(Item).Borders.Left.Style :=
      TxlsFormat(GetCurrFmtItem).Borders.Left.Style;}
end;

procedure TfmQExport3XLSEditor.XLSUpdateItemBorderLeftColor(
  Item: TxlsCustomItem);
var
  CurrItem: TxlsCustomItem;
begin
  CurrItem := GetCurrFmtItem;
  if Item = CurrItem then Exit;
  case Item.ItemType of
    itFormat,
    itFieldFormat:
      if CurrItem.ItemType in [itFormat, itFieldFormat] then
        (Item as TxlsFormat).Borders.Left.Color :=
          (CurrItem as TxlsFormat).Borders.Left.Color;
    itHyperlink:
      if CurrItem.ItemType = itHyperlink then
        (Item as TxlsHyperlink).Format.Borders.Left.Color :=
          (CurrItem as TxlsHyperlink).Format.Borders.Left.Color;
  end;
{  if Item <> GetCurrFmtItem then
    TxlsFormat(Item).Borders.Left.Color :=
      TxlsFormat(GetCurrFmtItem).Borders.Left.Color;}
end;

procedure TfmQExport3XLSEditor.XLSUpdateItemBorderRight(
  Item: TxlsCustomItem);
var
  CurrItem: TxlsCustomItem;
begin
  CurrItem := GetCurrFmtItem;
  if Item = CurrItem then Exit;
  case Item.ItemType of
    itFormat,
    itFieldFormat:
      if CurrItem.ItemType in [itFormat, itFieldFormat] then
        (Item as TxlsFormat).Borders.Right.Style :=
          (CurrItem as TxlsFormat).Borders.Right.Style;
    itHyperlink:
      if CurrItem.ItemType = itHyperlink then
        (Item as TxlsHyperlink).Format.Borders.Right.Style :=
          (CurrItem as TxlsHyperlink).Format.Borders.Right.Style;
  end;
{  if Item <> GetCurrFmtItem then
    TxlsFormat(Item).Borders.Right.Style :=
      TxlsFormat(GetCurrFmtItem).Borders.Right.Style;}
end;

procedure TfmQExport3XLSEditor.XLSUpdateItemBorderRightColor(
  Item: TxlsCustomItem);
var
  CurrItem: TxlsCustomItem;
begin
  CurrItem := GetCurrFmtItem;
  if Item = CurrItem then Exit;
  case Item.ItemType of
    itFormat,
    itFieldFormat:
      if CurrItem.ItemType in [itFormat, itFieldFormat] then
        (Item as TxlsFormat).Borders.Right.Color :=
          (CurrItem as TxlsFormat).Borders.Right.Color;
    itHyperlink:
      if CurrItem.ItemType = itHyperlink then
        (Item as TxlsHyperlink).Format.Borders.Right.Color :=
          (CurrItem as TxlsHyperlink).Format.Borders.Right.Color;
  end;
{  if Item <> GetCurrFmtItem then
    TxlsFormat(Item).Borders.Right.Color :=
      TxlsFormat(GetCurrFmtItem).Borders.Right.Color;}
end;

procedure TfmQExport3XLSEditor.XLSUpdateItemFillPattern(
  Item: TxlsCustomItem);
var
  CurrItem: TxlsCustomItem;
begin
  CurrItem := GetCurrFmtItem;
  if Item = CurrItem then Exit;
  case Item.ItemType of
    itFormat,
    itFieldFormat:
      if CurrItem.ItemType in [itFormat, itFieldFormat] then
        (Item as TxlsFormat).Fill.Pattern :=
          (CurrItem as TxlsFormat).Fill.Pattern;
    itHyperlink:
      if CurrItem.ItemType = itHyperlink then
        (Item as TxlsHyperlink).Format.Fill.Pattern :=
          (CurrItem as TxlsHyperlink).Format.Fill.Pattern;
  end;
{  if Item <> GetCurrFmtItem then
    TxlsFormat(Item).Fill.Pattern :=
      TxlsFormat(GetCurrFmtItem).Fill.Pattern;}
end;

procedure TfmQExport3XLSEditor.XLSUpdateItemFillBackground(
  Item: TxlsCustomItem);
var
  CurrItem: TxlsCustomItem;
begin
  CurrItem := GetCurrFmtItem;
  if Item = CurrItem then Exit;
  case Item.ItemType of
    itFormat,
    itFieldFormat:
      if CurrItem.ItemType in [itFormat, itFieldFormat] then
        (Item as TxlsFormat).Fill.Background :=
          (CurrItem as TxlsFormat).Fill.Background;
    itHyperlink:
      if CurrItem.ItemType = itHyperlink then
        (Item as TxlsHyperlink).Format.Fill.Background :=
          (CurrItem as TxlsHyperlink).Format.Fill.Background;
  end;
{  if Item <> GetCurrFmtItem then
    TxlsFormat(Item).Fill.Background :=
      TxlsFormat(GetCurrFmtItem).Fill.Background;}
end;

procedure TfmQExport3XLSEditor.XLSUpdateItemFillForeground(
  Item: TxlsCustomItem);
var
  CurrItem: TxlsCustomItem;
begin
  CurrItem := GetCurrFmtItem;
  if Item = CurrItem then Exit;
  case Item.ItemType of
    itFormat,
    itFieldFormat:
      if CurrItem.ItemType in [itFormat, itFieldFormat] then
        (Item as TxlsFormat).Fill.Foreground :=
          (CurrItem as TxlsFormat).Fill.Foreground;
    itHyperlink:
      if CurrItem.ItemType = itHyperlink then
        (Item as TxlsHyperlink).Format.Fill.Foreground :=
          (CurrItem as TxlsHyperlink).Format.Fill.Foreground;
  end;
{  if Item <> GetCurrFmtItem then
    TxlsFormat(Item).Fill.Foreground :=
      TxlsFormat(GetCurrFmtItem).Fill.Foreground;}
end;

procedure TfmQExport3XLSEditor.XLSUpdateItemAggregate(Item: TxlsCustomItem);
var
  CurrItem: TxlsCustomItem;
begin
  CurrItem := GetCurrFmtItem;
  if Item = CurrItem then Exit;
  if Item.ItemType = itFieldFormat then
    if CurrItem.ItemType = itFieldFormat then
      (Item as TxlsFieldFormat).Aggregate :=
        (CurrItem as TxlsFieldFormat).Aggregate;
{  if Item <> GetCurrFmtItem then
    TxlsFieldFormat(Item).Aggregate :=
      TxlsFieldFormat(GetCurrFmtItem).Aggregate;}
end;

procedure TfmQExport3XLSEditor.XLSUpdateItemSetDefault(Item: TxlsCustomItem);
var
  CurrItem: TxlsCustomItem;
begin
  CurrItem := GetCurrFmtItem;
  case Item.ItemType of
    itFormat,
    itFieldFormat:
      if CurrItem.ItemType in [itFormat, itFieldFormat] then begin
        (Item as TxlsFormat).SetDefault;
        case Item.Tag of
          2: XLSCustomFormatEditFontStyle(Item, xfsBold, true);
          6: with (Item as TxlsFormat).Font do begin
               Color := clrBlue;
               Underline := fulSingle;
             end;
        end;
      end;
    itNoteFormat:
      if CurrItem.ItemType = itNoteFormat then
        (Item as TxlsNoteFormat).SetDefault;
    itHyperlink:
      if CurrItem.ItemType = itHyperlink then
        (Item as TxlsHyperlink).Format.SetDefault;
    itNote:
      if CurrItem.ItemType = itNote then
        (Item as TxlsNote).Format.SetDefault;
  end;
{  if Item <> GetCurrFmtItem then begin
    if (Item.ListView = lvOptions) and (Item.Index = 1)
      then SetDefaultXLSCaption(TxlsFormat(Item.Data))
      else begin
        TxlsFormat(Item.Data).SetDefault;
      end;
  end;}
end;

procedure TfmQExport3XLSEditor.pcFormatsChange(Sender: TObject);
begin
  FCurrList := pcFormats.ActivePage.PageIndex;
  tsXLSAggregate.TabVisible := pcFormats.ActivePage = tsFieldFormats;
  TuneFormats;
end;

procedure TfmQExport3XLSEditor.SheetAllowCaptions(Item: TListItem);
begin
  if Item.Selected and (Item <> FCurrSheet) then
    TxlsSheet(Item.Data).AllowCaptions :=
      TxlsSheet(FCurrSheet.Data).AllowCaptions;
end;

procedure TfmQExport3XLSEditor.SheetGoToFirstRecord(Item: TListItem);
begin
  if Item.Selected and (Item <> FCurrSheet) then
    TxlsSheet(Item.Data).GoToFirstRecord :=
      TxlsSheet(FCurrSheet.Data).GoToFirstRecord;
end;

procedure TfmQExport3XLSEditor.SheetOnlyVisibleFields(Item: TListItem);
begin
  if Item.Selected and (Item <> FCurrSheet) then
    TxlsSheet(Item.Data).OnlyVisibleFields :=
      TxlsSheet(FCurrSheet.Data).OnlyVisibleFields;
end;

procedure TfmQExport3XLSEditor.SheetAutoCalcStrType(Item: TListItem);
begin
  if Item.Selected and (Item <> FCurrSheet) then
    TxlsSheet(Item.Data).AutoCalcStrType :=
      TxlsSheet(FCurrSheet.Data).AutoCalcStrType;
end;

procedure TfmQExport3XLSEditor.SheetSkipRecCount(Item: TListItem);
begin
  if Item.Selected and (Item <> FCurrSheet) then
    TxlsSheet(Item.Data).SkipRecCount :=
      TxlsSheet(FCurrSheet.Data).SkipRecCount;
end;

procedure TfmQExport3XLSEditor.SheetExportRecCount(Item: TListItem);
begin
  if Item.Selected and (Item <> FCurrSheet) then
    TxlsSheet(Item.Data).ExportRecCount :=
      TxlsSheet(FCurrSheet.Data).ExportRecCount;
end;

procedure TfmQExport3XLSEditor.SheetStartDataCol(Item: TListItem);
begin
  if Item.Selected and (Item <> FCurrSheet) then
    TxlsSheet(Item.Data).StartDataCol :=
      TxlsSheet(FCurrSheet.Data).StartDataCol;
end;

procedure TfmQExport3XLSEditor.SheetCaptionRow(Item: TListItem);
begin
  if Item.Selected and (Item <> FCurrSheet) then
    TxlsSheet(Item.Data).CaptionRow :=
      TxlsSheet(FCurrSheet.Data).CaptionRow;
end;

procedure TfmQExport3XLSEditor.SheetHeaderRows(Item: TListItem);
begin
  if Item.Selected and (Item <> FCurrSheet) then
    TxlsSheet(Item.Data).HeaderRows :=
      TxlsSheet(FCurrSheet.Data).HeaderRows;
end;

procedure TfmQExport3XLSEditor.SheetHeader(Item: TListItem);
begin
  if Item.Selected and (Item <> FCurrSheet) then
    TxlsSheet(Item.Data).Header := TxlsSheet(FCurrSheet.Data).Header;
end;

procedure TfmQExport3XLSEditor.SheetFooterRows(Item: TListItem);
begin
  if Item.Selected and (Item <> FCurrSheet) then
    TxlsSheet(Item.Data).FooterRows :=
      TxlsSheet(FCurrSheet.Data).FooterRows;
end;

procedure TfmQExport3XLSEditor.SheetFooter(Item: TListItem);
begin
  if Item.Selected and (Item <> FCurrSheet) then
    TxlsSheet(Item.Data).Footer := TxlsSheet(FCurrSheet.Data).Footer;
end;

procedure TfmQExport3XLSEditor.SheetIntegerFormat(Item: TListItem);
begin
  if Item.Selected and (Item <> FCurrSheet) then
    TxlsSheet(Item.Data).Formats.IntegerFormat :=
      TxlsSheet(FCurrSheet.Data).Formats.IntegerFormat;
end;

procedure TfmQExport3XLSEditor.SheetFloatFormat(Item: TListItem);
begin
  if Item.Selected and (Item <> FCurrSheet) then
    TxlsSheet(Item.Data).Formats.FloatFormat :=
      TxlsSheet(FCurrSheet.Data).Formats.FloatFormat;
end;

procedure TfmQExport3XLSEditor.SheetDateFormat(Item: TListItem);
begin
  if Item.Selected and (Item <> FCurrSheet) then
    TxlsSheet(Item.Data).Formats.DateFormat :=
      TxlsSheet(FCurrSheet.Data).Formats.DateFormat;
end;

procedure TfmQExport3XLSEditor.SheetTimeFormat(Item: TListItem);
begin
  if Item.Selected and (Item <> FCurrSheet) then
    TxlsSheet(Item.Data).Formats.TimeFormat :=
      TxlsSheet(FCurrSheet.Data).Formats.TimeFormat;
end;

procedure TfmQExport3XLSEditor.SheetDateTimeFormat(Item: TListItem);
begin
  if Item.Selected and (Item <> FCurrSheet) then
    TxlsSheet(Item.Data).Formats.DateTimeFormat :=
      TxlsSheet(FCurrSheet.Data).Formats.DateTimeFormat;
end;

procedure TfmQExport3XLSEditor.SheetCurrencyFormat(Item: TListItem);
begin
  if Item.Selected and (Item <> FCurrSheet) then
    TxlsSheet(Item.Data).Formats.CurrencyFormat :=
      TxlsSheet(FCurrSheet.Data).Formats.CurrencyFormat;
end;

procedure TfmQExport3XLSEditor.SheetBooleanTrue(Item: TListItem);
begin
  if Item.Selected and (Item <> FCurrSheet) then
    TxlsSheet(Item.Data).Formats.BooleanTrue :=
      TxlsSheet(FCurrSheet.Data).Formats.BooleanTrue;
end;

procedure TfmQExport3XLSEditor.SheetBooleanFalse(Item: TListItem);
begin
  if Item.Selected and (Item <> FCurrSheet) then
    TxlsSheet(Item.Data).Formats.BooleanFalse :=
      TxlsSheet(FCurrSheet.Data).Formats.BooleanFalse;
end;

procedure TfmQExport3XLSEditor.SheetNullString(Item: TListItem);
begin
  if Item.Selected and (Item <> FCurrSheet) then
    TxlsSheet(Item.Data).Formats.NullString :=
      TxlsSheet(FCurrSheet.Data).Formats.NullString;
end;

procedure TfmQExport3XLSEditor.chAllowCaptionsClick(Sender: TObject);
begin
  TxlsSheet(FCurrSheet.Data).AllowCaptions :=
    chAllowCaptions.Checked;
  if lvSheets.SelCount > 1 then
    ForAllListViewItems(lvSheets, SheetAllowCaptions, false, false);
end;

procedure TfmQExport3XLSEditor.chGoToFirstRecordClick(Sender: TObject);
begin
  TxlsSheet(FCurrSheet.Data).GoToFirstRecord :=
    chGoToFirstRecord.Checked;
  if lvSheets.SelCount > 1 then
    ForAllListViewItems(lvSheets, SheetGoToFirstRecord, false, false);
end;

procedure TfmQExport3XLSEditor.chOnlyVisibleFieldsClick(Sender: TObject);
begin
  TxlsSheet(FCurrSheet.Data).OnlyVisibleFields :=
    chOnlyVisibleFields.Checked;
  if lvSheets.SelCount > 1 then
    ForAllListViewItems(lvSheets, SheetOnlyVisibleFields, false, false);
end;

procedure TfmQExport3XLSEditor.chAutoCalcStrTypeClick(Sender: TObject);
begin
  TxlsSheet(FCurrSheet.Data).AutoCalcStrType :=
    chAutoCalcStrType.Checked;
  if lvSheets.SelCount > 1 then
    ForAllListViewItems(lvSheets, SheetAutoCalcStrType, false, false);
end;

procedure TfmQExport3XLSEditor.edSkipRecCountExit(Sender: TObject);
begin
  TxlsSheet(FCurrSheet.Data).SkipRecCount :=
    StrToIntDef(edSkipRecCount.Text, 0);
  if edSkipRecCount.Text <> IntToStr(TxlsSheet(FCurrSheet.Data).SkipRecCount) then
    edSkipRecCount.Text := IntToStr(TxlsSheet(FCurrSheet.Data).SkipRecCount);
  if lvSheets.SelCount > 1 then
    ForAllListViewItems(lvSheets, SheetSkipRecCount, false, false);
end;

procedure TfmQExport3XLSEditor.edExportRecCountExit(Sender: TObject);
begin
  TxlsSheet(FCurrSheet.Data).ExportRecCount :=
    StrToIntDef(edExportRecCount.Text, 0);
  if edExportRecCount.Text <> IntToStr(TxlsSheet(FCurrSheet.Data).ExportRecCount) then
    edExportRecCount.Text := IntToStr(TxlsSheet(FCurrSheet.Data).ExportRecCount);
  if lvSheets.SelCount > 1 then
    ForAllListViewItems(lvSheets, SheetExportRecCount, false, false);
end;

procedure TfmQExport3XLSEditor.edStartDataColExit(Sender: TObject);
begin
  TxlsSheet(FCurrSheet.Data).StartDataCol :=
    StrToIntDef(edStartDataCol.Text, 0);
  if edStartDataCol.Text <> IntToStr(TxlsSheet(FCurrSheet.Data).StartDataCol) then
    edStartDataCol.Text := IntToStr(TxlsSheet(FCurrSheet.Data).StartDataCol);
  if lvSheets.SelCount > 1 then
    ForAllListViewItems(lvSheets, SheetStartDataCol, false, false);
end;

procedure TfmQExport3XLSEditor.edCaptionRowExit(Sender: TObject);
begin
  TxlsSheet(FCurrSheet.Data).CaptionRow :=
    StrToIntDef(edCaptionRow.Text, -1);
  if edCaptionRow.Text <> IntToStr(TxlsSheet(FCurrSheet.Data).CaptionRow) then
    edCaptionRow.Text := IntToStr(TxlsSheet(FCurrSheet.Data).CaptionRow);
  if lvSheets.SelCount > 1 then
    ForAllListViewItems(lvSheets, SheetCaptionRow, false, false);
end;

procedure TfmQExport3XLSEditor.NumericEditKeyPress(Sender: TObject;
  var Key: Char);
begin
  if not (Key in ['1', '2', '3', '4', '5', '6', '7',
                  '8', '9', '0', #8, '-']) then begin
    Beep;
    Key := #0;
  end
end;

procedure TfmQExport3XLSEditor.rbExportOnlyClick(Sender: TObject);
begin
  TuneExportRecCount;
end;

procedure TfmQExport3XLSEditor.rbExportAllClick(Sender: TObject);
begin
  TuneExportRecCount;
  edExportRecCount.Text := '0';
end;

procedure TfmQExport3XLSEditor.edHeaderRowCountExit(Sender: TObject);
begin
  TxlsSheet(FCurrSheet.Data).HeaderRows :=
    StrToIntDef(edHeaderRowCount.Text, 0);
  if edHeaderRowCount.Text <> IntToStr(TxlsSheet(FCurrSheet.Data).HeaderRows) then
    edHeaderRowCount.Text := IntToStr(TxlsSheet(FCurrSheet.Data).HeaderRows);
  if lvSheets.SelCount > 1 then
    ForAllListViewItems(lvSheets, SheetHeaderRows, false, false);
end;

procedure TfmQExport3XLSEditor.rbAllHeaderRowsClick(Sender: TObject);
begin
  TuneHeader;
  edHeaderRowCount.Text := '0';
end;

procedure TfmQExport3XLSEditor.rbOnlyHeaderRowsClick(Sender: TObject);
begin
  TuneHeader;
end;

procedure TfmQExport3XLSEditor.mmHeaderChange(Sender: TObject);
begin
  If FLoading then Exit;
  TxlsSheet(FCurrSheet.Data).Header := mmHeader.Lines;
  if lvSheets.SelCount > 1 then
    ForAllListViewItems(lvSheets, SheetHeader, false, false);
end;

procedure TfmQExport3XLSEditor.edFooterRowCountExit(Sender: TObject);
begin
  TxlsSheet(FCurrSheet.Data).FooterRows :=
    StrToIntDef(edFooterRowCount.Text, 0);
  if edFooterRowCount.Text <> IntToStr(TxlsSheet(FCurrSheet.Data).FooterRows) then
    edFooterRowCount.Text := IntToStr(TxlsSheet(FCurrSheet.Data).FooterRows);
  if lvSheets.SelCount > 1 then
    ForAllListViewItems(lvSheets, SheetFooterRows, false, false);
end;

procedure TfmQExport3XLSEditor.rbAllFooterRowsClick(Sender: TObject);
begin
  TuneFooter;
  edFooterRowCount.Text := '0';
end;

procedure TfmQExport3XLSEditor.rbOnlyFooterRowsClick(Sender: TObject);
begin
  TuneFooter;
end;

procedure TfmQExport3XLSEditor.mmFooterChange(Sender: TObject);
begin
  if FLoading then Exit;
  TxlsSheet(FCurrSheet.Data).Footer := mmFooter.Lines;
  if lvSheets.SelCount > 1 then
    ForAllListViewItems(lvSheets, SheetFooter, false, false);
end;

procedure TfmQExport3XLSEditor.edIntegerFormatChange(Sender: TObject);
begin
  TxlsSheet(FCurrSheet.Data).Formats.IntegerFormat :=
    edIntegerFormat.Text;
  if lvSheets.SelCount > 1 then
    ForAllListViewItems(lvSheets, SheetIntegerFormat, false, false);
end;

procedure TfmQExport3XLSEditor.edFloatFormatChange(Sender: TObject);
begin
  TxlsSheet(FCurrSheet.Data).Formats.FloatFormat :=
    edFloatFormat.Text;
  if lvSheets.SelCount > 1 then
    ForAllListViewItems(lvSheets, SheetFloatFormat, false, false);
end;

procedure TfmQExport3XLSEditor.edDateFormatChange(Sender: TObject);
begin
  TxlsSheet(FCurrSheet.Data).Formats.DateFormat :=
    edDateFormat.Text;
  if lvSheets.SelCount > 1 then
    ForAllListViewItems(lvSheets, SheetDateFormat, false, false);
end;

procedure TfmQExport3XLSEditor.edTimeFormatChange(Sender: TObject);
begin
  TxlsSheet(FCurrSheet.Data).Formats.TimeFormat :=
    edTimeFormat.Text;
  if lvSheets.SelCount > 1 then
    ForAllListViewItems(lvSheets, SheetTimeFormat, false, false);
end;

procedure TfmQExport3XLSEditor.edDateTimeFormatChange(Sender: TObject);
begin
  TxlsSheet(FCurrSheet.Data).Formats.DateTimeFormat :=
    edDateTimeFormat.Text;
  if lvSheets.SelCount > 1 then
    ForAllListViewItems(lvSheets, SheetDateTimeFormat, false, false);
end;

procedure TfmQExport3XLSEditor.edCurrencyFormatChange(Sender: TObject);
begin
  TxlsSheet(FCurrSheet.Data).Formats.CurrencyFormat :=
    edCurrencyFormat.Text;
  if lvSheets.SelCount > 1 then
    ForAllListViewItems(lvSheets, SheetCurrencyFormat, false, false);
end;

procedure TfmQExport3XLSEditor.edBooleanTrueChange(Sender: TObject);
begin
  TxlsSheet(FCurrSheet.Data).Formats.BooleanTrue :=
    edBooleanTrue.Text;
  if lvSheets.SelCount > 1 then
    ForAllListViewItems(lvSheets, SheetBooleanTrue, false, false);
end;

procedure TfmQExport3XLSEditor.edBooleanFalseChange(Sender: TObject);
begin
  TxlsSheet(FCurrSheet.Data).Formats.BooleanFalse :=
    edBooleanFalse.Text;
  if lvSheets.SelCount > 1 then
    ForAllListViewItems(lvSheets, SheetBooleanFalse, false, false);
end;

procedure TfmQExport3XLSEditor.edNullStringChange(Sender: TObject);
begin
  TxlsSheet(FCurrSheet.Data).Formats.NullString :=
    edNullString.Text;
  if lvSheets.SelCount > 1 then
    ForAllListViewItems(lvSheets, SheetNullString, false, false);
end;

procedure TfmQExport3XLSEditor.DownloadDataFormat(Item: TListItem);
begin
  if Item.Selected then
    TxlsFormat(Item.Data).Assign(TxlsFormat(lvOptions.Items[2].Data));
end;

procedure TfmQExport3XLSEditor.UploadDataFormat(Item: TListItem);
begin
  if Item.Selected and Item.Focused then
    TxlsFormat(lvOptions.Items[2].Data).Assign(TxlsFormat(Item.Data));
end;

procedure TfmQExport3XLSEditor.tbtDownloadDataFormatClick(Sender: TObject);
begin
  ForAllListViewItems(lvFieldFormats, DownloadDataFormat, false, false);
  TuneFormats;
end;

procedure TfmQExport3XLSEditor.tbtStyleAddClick(Sender: TObject);
var
  F: TxlsFormat;
begin
  F := TxlsSheet(lvSheets.Selected.Data).StripStyles.Add;
  lvStyles.Items.BeginUpdate;
  try
    with lvStyles.Items.Add do begin
      Caption := Format({$IFDEF WIN32}QExportLoadStr(QED_XLS_StripStyle){$ENDIF}
                        {$IFDEF LINUX}QED_XLS_StripStyle{$ENDIF}, [lvStyles.Items.Count]);
      Data := F;
      ImageIndex := 3;
      ForAllListViewItems(lvStyles, UnselectItem, false, true);
      Focused := true;
      Selected := true;
    end;
    ActiveControl := lvStyles;
  finally
    lvStyles.Items.EndUpdate;
  end;
  ShowStyleButtons;
end;

procedure TfmQExport3XLSEditor.tbtStyleDelClick(Sender: TObject);
begin
  lvStyles.Items.BeginUpdate;
  try
    TxlsFormat(lvStyles.Selected.Data).Free;
    lvStyles.Selected.Delete;
    ForAllListViewItems(lvStyles, SetSelectedToFocused, false, true);
    ForAllListViewItems(lvStyles, StyleRenumber, false, true);
  finally
    lvStyles.Items.EndUpdate;
  end;
end;

procedure TfmQExport3XLSEditor.bXLSResetAllClick(Sender: TObject);
var
  Lst: TListView;
begin
  Lst := GetCurrFmtList;
  if Assigned(Lst) then
    if Application.MessageBox(PChar({$IFDEF WIN32}QExportLoadStr(QEE_XLS_SetAllToDefaultConfirm){$ENDIF}
                                    {$IFDEF LINUX}QEE_XLS_SetAllToDefaultConfirm{$ENDIF}),
         PChar({$IFDEF WIN32}QExportLoadStr(QEE_XLS_Question){$ENDIF}
               {$IFDEF LINUX}QEE_XLS_Question{$ENDIF}), MB_YESNO + MB_DEFBUTTON1 +
         MB_ICONQUESTION) = ID_YES then begin
      FNeedSelected := false;
      SetCurrDefault;
      ForAllListViewCustomItems(Lst, XLSUpdateItemSetDefault, false, true);
      TuneFormats;
    end;
end;

procedure TfmQExport3XLSEditor.bXLSResetItemClick(Sender: TObject);
var
  Lst: TListView;
begin
  Lst := GetCurrFmtList;
  if Assigned(Lst) then
  if Application.MessageBox(PChar({$IFDEF WIN32}QExportLoadStr(QEE_XLS_SetSelToDefaultConfirm){$ENDIF}
                                  {$IFDEF LINUX}QEE_XLS_SetSelToDefaultConfirm{$ENDIF}),
       Pchar({$IFDEF WIN32}QExportLoadStr(QEE_XLS_Question){$ENDIF}
             {$IFDEF LINUX}QEE_XLS_Question{$ENDIF}), MB_YESNO + MB_DEFBUTTON1 +
        MB_ICONQUESTION) = ID_YES then
    try
      FNeedSelected := true;
      SetCurrDefault;
      ForAllListViewCustomItems(GetCurrFmtList, XLSUpdateItemSetDefault,
        false, false);
      TuneFormats;
    finally
      FNeedSelected := false;
    end;
end;

procedure TfmQExport3XLSEditor.ListViewKeyDown(Sender: TObject;
  var Key: Word; Shift: TShiftState);
var
  Lst: TListView;
begin
  if Shift = [ssCtrl] then begin
    case Key of
      65: begin
        Lst := GetCurrFmtList;
        if Assigned(Lst) then
          ForAllListViewItems(Lst, SelectItem, false, true);
      end;
    end;
  end;
end;

procedure TfmQExport3XLSEditor.miInsetTabClick(Sender: TObject);
var
  MM: TMemo;
  Point: TPoint;
  Str: string;
begin
  MM := CurrentSheetMemo;
  if Assigned(MM) then begin
    Point := GetMemoCaretPos(MM);
    Str := MM.Lines[Point.Y];
    Insert(Chr(9), Str, Point.X + 1);
    MM.Lines[Point.Y] := Str;
    MM.Perform(EM_SETSEL, Point.X + 1, Point.X + 1);
  end;
end;

procedure TfmQExport3XLSEditor.bResetFormatsClick(Sender: TObject);
begin
  with TxlsSheet(lvSheets.Selected.Data).Formats do begin
    ResetFormats;
    edIntegerFormat.Text := IntegerFormat;
    edFloatFormat.Text := FloatFormat;
    edDateFormat.Text := DateFormat;
    edTimeFormat.Text := TimeFormat;
    edDateTimeFormat.Text := DateTimeFormat;
    edCurrencyFormat.Text := CurrencyFormat;
    edBooleanTrue.Text := BooleanTrue;
    edBooleanFalse.Text := BooleanFalse;
    edNullString.Text := NullString;
  end;
end;

procedure TfmQExport3XLSEditor.miClearClick(Sender: TObject);
var
  MM: TMemo;
begin
  MM := CurrentSheetMemo;
  if Assigned(MM) then MM.Lines.Clear;
end;

procedure TfmQExport3XLSEditor.tbtUploadDataFormatClick(Sender: TObject);
begin
  ForAllListViewItems(lvFieldFormats, UploadDataFormat, false, false);
end;

procedure TfmQExport3XLSEditor.bBrowseClick(Sender: TObject);
begin
  sdFileName.FileName := edFileName.Text;
  if sdFileName.Execute then edFileName.Text := sdFileName.FileName;
end;

procedure TfmQExport3XLSEditor.rgStripTypeClick(Sender: TObject);
begin
  if Assigned(lvSheets.Selected) then
    TxlsSheet(lvSheets.Selected.Data).StripType :=
      TxlsStripType(rgStripType.ItemIndex)
end;

procedure TfmQExport3XLSEditor.lvSheetsDblClick(Sender: TObject);
begin
  if tbtSheetEdit.Enabled then tbtSheetEdit.Click;
end;

procedure TfmQExport3XLSEditor.tbtAddFieldFormatClick(Sender: TObject);
var
  FColName: string;
  FieldFormat: TxlsFieldFormat;
  i, j: integer;
  Flag: boolean;
begin
  j := 1;
  Flag := true;
  while Flag do begin
    for i := 0 to lvFieldFormats.Items.Count - 1 do
      if AnsiCompareText(Format({$IFDEF WIN32}QExportLoadStr(QEE_XLS_ColumnName){$ENDIF}
                                {$IFDEF LINUX}QEE_XLS_ColumnName{$ENDIF}, [j]),
        lvFieldFormats.Items[i].Caption) = 0 then begin
        Inc(j);
        Flag := false;
        Break;
      end;
    if not Flag
      then Flag := true
      else Break;
  end;
  FColName := Format({$IFDEF WIN32}QExportLoadStr(QEE_XLS_ColumnName){$ENDIF}
                     {$IFDEF LINUX}QEE_XLS_ColumnName{$ENDIF}, [j]);

  if not InputQuery({$IFDEF WIN32}QExportLoadStr(QEE_XLS_AddFieldFormat){$ENDIF}
                    {$IFDEF LINUX}QEE_XLS_AddFieldFormat{$ENDIF},
                    {$IFDEF WIN32}QExportLoadStr(QEE_XLS_DefineColumnName){$ENDIF}
                    {$IFDEF LINUX}QEE_XLS_DefineColumnName{$ENDIF}, FColName) then Exit;

  Flag := false;
  for i := 0 to lvFieldFormats.Items.Count - 1 do begin
    Flag := Flag or (AnsiCompareText(lvFieldFormats.Items[i].Caption, FColName) = 0);
    if Flag then
      raise Exception.CreateFmt({$IFDEF WIN32}QExportLoadStr(QEE_XLS_ColumnAlreadyExists){$ENDIF}
                                {$IFDEF LINUX}QEE_XLS_ColumnAlreadyExists{$ENDIF}, [FColName]);
  end;

  FieldFormat := TxlsSheet(lvSheets.Selected.Data).FieldFormats.Add;
  FieldFormat.FieldName := FColName;
  TxlsFormat(FieldFormat).Assign(TxlsSheet(lvSheets.Selected.Data).Options.DataFormat);
  with lvFieldFormats.Items.Add do begin
    Caption := FColName;
    Data := FieldFormat;
    ImageIndex := 1;
    ForAllListViewItems(lvFieldFormats, UnselectItem, false, true);
    Selected := true;
    Focused := true;
  end;
  ShowColumnButtons;
  TuneFormats;
end;

procedure TfmQExport3XLSEditor.tbtDelFieldFormatClick(Sender: TObject);
begin
  ForAllListViewItems(lvFieldFormats, DeleteItem, true, false);
  ForAllListViewItems(lvFieldFormats, SetSelectedToFocused, false, true);
  ShowColumnButtons;
  TuneFormats;
end;

procedure TfmQExport3XLSEditor.tbtEditFieldFormatClick(Sender: TObject);
var
  i: integer;
  FColName: string;
  AlreadyExists: boolean;
begin
  FColName := TxlsFieldFormat(lvFieldFormats.Selected.Data).FieldName;

  if not InputQuery({$IFDEF WIN32}QExportLoadStr(QEE_XLS_EditColumnName){$ENDIF}
                    {$IFDEF LINUX}QEE_XLS_EditColumnName{$ENDIF},
    {$IFDEF WIN32}QExportLoadStr(QEE_XLS_DefineColumnName){$ENDIF}
    {$IFDEF LINUX}QEE_XLS_DefineColumnName{$ENDIF}, FColName) then Exit;
  AlreadyExists := false;
  for i := 0 to lvFieldFormats.Items.Count - 1 do begin
    if lvFieldFormats.Items[i] <> lvFieldFormats.Selected then begin
      AlreadyExists := AlreadyExists or (AnsiCompareText(lvFieldFormats.Items[i].Caption, FColName) = 0);
      if AlreadyExists then
        raise Exception.CreateFmt({$IFDEF WIN32}QExportLoadStr(QEE_XLS_ColumnAlreadyExists){$ENDIF}
                                  {$IFDEF LINUX}QEE_XLS_ColumnAlreadyExists{$ENDIF}, [FColName]);
    end;
  end;
end;

procedure TfmQExport3XLSEditor.lvFieldFormatsDblClick(Sender: TObject);
begin
  if tbtEditFieldFormat.Enabled then tbtEditFieldFormat.Click;
end;

procedure TfmQExport3XLSEditor.tcFieldsChange(Sender: TObject);
begin
{  FLoading := true;
  try
    case tcFields.TabIndex of
      0: mmFields.Lines.Assign(TxlsSheet(lvSheets.Selected.Data).ExportedFields);
      1: mmFields.Lines.Assign(TxlsSheet(lvSheets.Selected.Data).Captions);
      2: mmFields.Lines.Assign(TxlsSheet(lvSheets.Selected.Data).ColumnsWidth);
      3: mmFields.Lines.Assign(TxlsSheet(lvSheets.Selected.Data).UserFormats);
    end;
  finally
    FLoading := false;
  end;}
end;

procedure TfmQExport3XLSEditor.mmFieldsChange(Sender: TObject);
begin
{  if FLoading then Exit;

  case tcFields.TabIndex of
    0: TxlsSheet(lvSheets.Selected.Data).ExportedFields.Assign(mmFields.Lines);
    1: TxlsSheet(lvSheets.Selected.Data).Captions.Assign(mmFields.Lines);
    2: TxlsSheet(lvSheets.Selected.Data).ColumnsWidth.Assign(mmFields.Lines);
    3: TxlsSheet(lvSheets.Selected.Data).UserFormats.Assign(mmFields.Lines);
  end;}
end;

procedure TfmQExport3XLSEditor.ShowCurrSheet;
var
  AssignedData: boolean;
  Sheet: TxlsSheet;
begin
  AssignedData := Assigned(FCurrSheet) and Assigned(FCurrSheet.Data);

  pcSheetOptions.Enabled := AssignedData;
  tsSheetCommon.Enabled := AssignedData;
  chAllowCaptions.Enabled := AssignedData;
  chGoToFirstRecord.Enabled := AssignedData;
  chOnlyVisibleFields.Enabled := AssignedData;
  chAutoCalcStrType.Enabled := AssignedData;
  laSkipRecCount_01.Enabled := AssignedData;
  edSkipRecCount.Enabled := AssignedData;
  laSkipRecCount_02.Enabled := AssignedData;
  rbExportAll.Enabled := AssignedData;
  rbExportOnly.Enabled := AssignedData;
  edExportRecCount.Enabled := AssignedData;
  laExportRecCount_02.Enabled := AssignedData;
  laStartDataCol.Enabled := AssignedData;
  edStartDataCol.Enabled := AssignedData;
  laCaptionRow.Enabled := AssignedData;
  edCaptionRow.Enabled := AssignedData;
  tsHeader.Enabled := AssignedData;
  rbAllHeaderRows.Enabled := AssignedData;
  rbOnlyHeaderRows.Enabled := AssignedData;
  edHeaderRowCount.Enabled := AssignedData;
  laHeaderRowCount_02.Enabled := AssignedData;
  mmHeader.Enabled := AssignedData;
  tsFooter.Enabled := AssignedData;
  rbAllFooterRows.Enabled := AssignedData;
  rbOnlyFooterRows.Enabled := AssignedData;
  edFooterRowCount.Enabled := AssignedData;
  laFooterRowCount_02.Enabled := AssignedData;
  mmFooter.Enabled := AssignedData;
  tsFormats.Enabled := AssignedData;
  laIntegerFormat.Enabled := AssignedData;
  edIntegerFormat.Enabled := AssignedData;
  laFloatFormat.Enabled := AssignedData;
  edFloatFormat.Enabled := AssignedData;
  laDateFormat.Enabled := AssignedData;
  edDateFormat.Enabled := AssignedData;
  laTimeFormat.Enabled := AssignedData;
  edTimeFormat.Enabled := AssignedData;
  laDateTimeFormat.Enabled := AssignedData;
  edDateTimeFormat.Enabled := AssignedData;
  laCurrencyFormat.Enabled := AssignedData;
  edCurrencyFormat.Enabled := AssignedData;
  laBooleanTrue.Enabled := AssignedData;
  edBooleanTrue.Enabled := AssignedData;
  laBooleanFalse.Enabled := AssignedData;
  edBooleanFalse.Enabled := AssignedData;
  laNullString.Enabled := AssignedData;
  edNullString.Enabled := AssignedData;
  bResetFormats.Enabled := AssignedData;
  tsFields.Enabled := AssignedData;
  pcFields.Enabled := AssignedData;
  tsExportedFields.Enabled := AssignedData;
  mmExportedFields.Enabled := AssignedData;
  tsFieldCaptions.Enabled := AssignedData;
  mmFieldCaptions.Enabled := AssignedData;
  tsFieldWidths.Enabled := AssignedData;
  chAutoCalcColWidth.Enabled := AssignedData;
  mmFieldWidths.Enabled := AssignedData;
  tsFormat.Enabled := AssignedData;
  mmFieldFormats.Enabled := AssignedData;

  if not AssignedData then Exit;

  ClearLists;
  FillLists(TxlsSheet(FCurrSheet.Data));

  Sheet := TxlsSheet(FCurrSheet.Data);

  FLoading := true;
  try
    chAllowCaptions.Checked := Sheet.AllowCaptions;
    chGoToFirstRecord.Checked := Sheet.GoToFirstRecord;

    chOnlyVisibleFields.Checked := Sheet.OnlyVisibleFields;

    chAutoCalcStrType.Enabled := Sheet.ExportSource in [esListView, esStringGrid];
    chAutoCalcStrType.Checked := chAutoCalcStrType.Enabled and Sheet.AutoCalcStrType;

    edSkipRecCount.Text := IntToStr(Sheet.SkipRecCount);
    rbExportAll.Checked := Sheet.ExportRecCount = 0;
    rbExportOnly.Checked := Sheet.ExportRecCount > 0;
    if rbExportOnly.Checked then
      edExportRecCount.Text := IntToStr(Sheet.ExportRecCount);
    edStartDataCol.Text := IntToStr(Sheet.StartDataCol);

    edCaptionRow.Enabled := Sheet.ExportSource = esStringGrid;
    laCaptionRow.Enabled := edCaptionRow.Enabled;
    if edCaptionRow.Enabled
      then edCaptionRow.Text := IntToStr(Sheet.CaptionRow)
      else edCaptionRow.Text := '-1';

    rbAllHeaderRows.Checked := Sheet.HeaderRows = 0;
    rbOnlyHeaderRows.Checked := Sheet.HeaderRows > 0;
    if rbOnlyHeaderRows.Checked then
      edHeaderRowCount.Text := IntToStr(Sheet.HeaderRows);
    mmHeader.Lines.Assign(Sheet.Header);

    rbAllFooterRows.Checked := Sheet.FooterRows = 0;
    rbOnlyFooterRows.Checked := Sheet.FooterRows > 0;
    if rbOnlyFooterRows.Checked then
      edFooterRowCount.Text := IntToStr(Sheet.FooterRows);
    mmFooter.Lines.Assign(Sheet.Footer);

    edIntegerFormat.Text := Sheet.Formats.IntegerFormat;
    edFloatFormat.Text := Sheet.Formats.FloatFormat;
    edDateFormat.Text := Sheet.Formats.DateFormat;
    edTimeFormat.Text := Sheet.Formats.TimeFormat;
    edDateTimeFormat.Text := Sheet.Formats.DateTimeFormat;
    edCurrencyFormat.Text := Sheet.Formats.CurrencyFormat;
    edBooleanTrue.Text := Sheet.Formats.BooleanTrue;
    edBooleanFalse.Text := Sheet.Formats.BooleanFalse;
    edNullString.Text := Sheet.Formats.NullString;

    chAutoCalcColWidth.Checked := Sheet.AutoCalcColWidth;

    mmExportedFields.Lines.Assign(Sheet.ExportedFields);
    mmFieldCaptions.Lines.Assign(Sheet.Captions);
    mmFieldWidths.Lines.Assign(Sheet.ColumnsWidth);
    mmFieldFormats.Lines.Assign(Sheet.UserFormats);

    rgStripType.ItemIndex := Integer(Sheet.StripType);
  finally
    FLoading := false;
  end;

  TuneExportRecCount;
  TuneHeader;
  TuneFooter;
end;

procedure TfmQExport3XLSEditor.mmExportedFieldsChange(Sender: TObject);
begin
  if FLoading then Exit;
  TxlsSheet(FCurrSheet.Data).ExportedFields.Assign(mmExportedFields.Lines);
end;

procedure TfmQExport3XLSEditor.mmFieldCaptionsChange(Sender: TObject);
begin
  if FLoading then Exit;
  TxlsSheet(FCurrSheet.Data).Captions.Assign(mmFieldCaptions.Lines);
end;

procedure TfmQExport3XLSEditor.mmFieldWidthsChange(Sender: TObject);
begin
  if FLoading then Exit;
  TxlsSheet(FCurrSheet.Data).ColumnsWidth.Assign(mmFieldWidths.Lines);
end;

procedure TfmQExport3XLSEditor.mmFieldFormatsChange(Sender: TObject);
begin
  if FLoading then Exit;
  TxlsSheet(FCurrSheet.Data).FieldFormats.Assign(mmFieldFormats.Lines);
end;

procedure TfmQExport3XLSEditor.chAutoCalcColWidthClick(Sender: TObject);
begin
  TxlsSheet(lvSheets.ItemFocused.Data).AutoCalcColWidth :=
    chAutoCalcColWidth.Checked;
  mmFieldWidths.Enabled := not chAutoCalcColWidth.Checked;
end;

procedure TfmQExport3XLSEditor.FormCreate(Sender: TObject);
var
  i: integer;
begin
  for i := 0 to pcFormats1.PageCount - 1 do
    pcFormats1.Pages[i].Parent := paFormats;
end;

procedure TfmQExport3XLSEditor.FormDestroy(Sender: TObject);
var
  i: integer;
begin
  for i := 0 to pcFormats1.PageCount - 1 do
    pcFormats1.Pages[i].Parent := pcFormats1;
  tsXLSFont.Parent := pcXLSDataFormat;
end;

procedure TfmQExport3XLSEditor.lvSheetsChange(Sender: TObject;
  Item: TListItem; Change: TItemChange);
begin
  if not (csDestroying in ComponentState) then begin
    if (FCurrSheet <> Item) and Item.Focused then begin
      FCurrSheet := Item;
      ShowCurrSheet;
      TuneSheetButtons;
      TuneFormats;
    end;
  end;
end;

procedure TfmQExport3XLSEditor.SetFormatsActivePage(Value: TTabSheet);
begin
  if pcFormats1.ActivePage <> Value then begin

    if pcFormats1.ActivePage = tsStandardFormat then
      FStandardFormatPageIndex := pcXLSDataFormat.ActivePage.PageIndex
    else if pcFormats1.ActivePage = tsNoteFormat then begin
      if tsXLSNoteBase.TabVisible
        then FNotePageIndex := pcXLSNotes.ActivePage.PageIndex
        else FNoteFormatPageIndex := pcXLSNotes.ActivePage.PageIndex;
    end
    else if pcFormats1.ActivePage = tsHyperlinkFormat then
      FHyperlinkPageIndex := pcXLSHyperlinks.ActivePage.PageIndex
    else if pcFormats1.ActivePage = tsChartFormat then
      FChartPageIndex := pcXLSCharts.ActivePage.PageIndex
    else if PcFormats1.ActivePage = tsCellFormat then
      FCellPageIndex := pcXLSCells.ActivePage.PageIndex
    else if PcFormats1.ActivePage = tsMergedCellFormat then
      FMergedCellPageIndex := pcXLSMergedCells.ActivePage.PageIndex;

    pcFormats1.ActivePage := Value;
  end;
end;

procedure TfmQExport3XLSEditor.trXLSNoteTransparencyChange(
  Sender: TObject);
var
  Item: TxlsCustomItem;
  FmtStr: string;
begin
  Item := GetCurrFmtItem;
  if not Assigned(Item) then Exit;

  trXLSNoteTransparency.SelEnd :=
    trXLSNoteTransparency.Position;
  FmtStr := {$IFDEF WIN32}QExportLoadStr(QED_XLS_Note_Transparency){$ENDIF}
            {$IFDEF LINUX}QED_XLS_Note_Transparency{$ENDIF} + ' - %d%%';
  laXLSNoteTransparency.Caption :=
    Format(FmtStr, [trXLSNoteTransparency.Position]);
  case Item.ItemType of
    itNoteFormat: (Item as TxlsNoteFormat).Transparency :=
      trXLSNoteTransparency.Position;
    itNote: (Item as TxlsNote).Format.Transparency :=
      trXLSNoteTransparency.Position;
  end;
end;

procedure TfmQExport3XLSEditor.rbXLSNoteFillSolidClick(Sender: TObject);
var
  Item: TxlsCustomItem;
begin
  Item := GetCurrFmtItem;
  if not Assigned(Item) then Exit;
  case Item.ItemType of
    itNoteFormat: (Item as TxlsNoteFormat).FillType := nftSolid;
    itNote: (Item as TxlsNote).Format.FillType := nftSolid;
  end;
end;

procedure TfmQExport3XLSEditor.rbXLSNoteFillGradientClick(Sender: TObject);
var
  Item: TxlsCustomItem;
begin
  Item := GetCurrFmtItem;
  if not Assigned(Item) then Exit;
  case Item.ItemType of
    itNoteFormat: (Item as TxlsNoteFormat).FillType := nftGradient;
    itNote: (Item as TxlsNote).Format.FillType := nftGradient;
  end;
end;

procedure TfmQExport3XLSEditor.rbXLSNoteGradientHorizontalClick(
  Sender: TObject);
var
  Item: TxlsCustomItem;
begin
  Item := GetCurrFmtItem;
  if not Assigned(Item) then Exit;
  case Item.ItemType of
    itNoteFormat: (Item as TxlsNoteFormat).Gradient := ngrHorizontal;
    itNote: (Item as TxlsNote).Format.Gradient := ngrHorizontal;
  end;
end;

procedure TfmQExport3XLSEditor.rbXLSNoteGradientVerticalClick(
  Sender: TObject);
var
  Item: TxlsCustomItem;
begin
  Item := GetCurrFmtItem;
  if not Assigned(Item) then Exit;
  case Item.ItemType of
    itNoteFormat: (Item as TxlsNoteFormat).Gradient := ngrVertical;
    itNote: (Item as TxlsNote).Format.Gradient := ngrVertical;
  end;
end;

procedure TfmQExport3XLSEditor.rbXLSNoteGradientDiagonalUpClick(
  Sender: TObject);
var
  Item: TxlsCustomItem;
begin
  Item := GetCurrFmtItem;
  if not Assigned(Item) then Exit;
  case Item.ItemType of
    itNoteFormat: (Item as TxlsNoteFormat).Gradient := ngrDiagonalUp;
    itNote: (Item as TxlsNote).Format.Gradient := ngrDiagonalUp;
  end;
end;

procedure TfmQExport3XLSEditor.rbXLSNoteGradientDiagonalDownClick(
  Sender: TObject);
var
  Item: TxlsCustomItem;
begin
  Item := GetCurrFmtItem;
  if not Assigned(Item) then Exit;
  case Item.ItemType of
    itNoteFormat: (Item as TxlsNoteFormat).Gradient := ngrDiagonalDown;
    itNote: (Item as TxlsNote).Format.Gradient := ngrDiagonalDown;
  end;
end;

procedure TfmQExport3XLSEditor.rbXLSNoteGradientFromCornerClick(
  Sender: TObject);
var
  Item: TxlsCustomItem;
begin
  Item := GetCurrFmtItem;
  if not Assigned(Item) then Exit;
  case Item.ItemType of
    itNoteFormat: (Item as TxlsNoteFormat).Gradient := ngrFromCorner;
    itNote: (Item as TxlsNote).Format.Gradient := ngrFromCorner;
  end;
end;

procedure TfmQExport3XLSEditor.rbXLSNoteGradientFromCenterClick(
  Sender: TObject);
var
  Item: TxlsCustomItem;
begin
  Item := GetCurrFmtItem;
  if not Assigned(Item) then Exit;
  case Item.ItemType of
    itNoteFormat: (Item as TxlsNoteFormat).Gradient := ngrFromCenter;
    itNote: (Item as TxlsNote).Format.Gradient := ngrFromCenter;
  end;
end;

procedure TfmQExport3XLSEditor.btnXLSNoteBackgroundColorMouseDown(
  Sender: TObject; Button: TMouseButton; Shift: TShiftState; X,
  Y: Integer);
begin
  IncLeftAndTop(pbXLSNoteBackgroundColor);
end;

procedure TfmQExport3XLSEditor.btnXLSNoteBackgroundColorMouseUp(
  Sender: TObject; Button: TMouseButton; Shift: TShiftState; X,
  Y: Integer);
begin
  DecLeftAndTop(pbXLSNoteBackgroundColor);
end;

procedure TfmQExport3XLSEditor.btnXLSNoteBackgroundColorClick(
  Sender: TObject);
var
  OClr, NClr: TColor;
  Item: TxlsCustomItem;
begin
  Item := GetCurrFmtItem;
  if not Assigned(Item) then Exit;

  case Item.ItemType of
    itNoteFormat: OClr := (Item as TxlsNoteFormat).BackgroundColor;
    itNote: OClr := (Item as TxlsNote).Format.BackgroundColor;
    else OClr := clBlack;
  end;

  ColorDialog.Color := OClr;
  if ColorDialog.Execute then begin
    NClr := ColorDialog.Color;
    if NClr <> OClr then
      case Item.ItemType of
        itNoteFormat: (Item as TxlsNoteFormat).BackgroundColor := NClr;
        itNote: (Item as TxlsNote).Format.BackgroundColor := NClr;
      end;
  end;
end;

procedure TfmQExport3XLSEditor.pbXLSNoteBackgroundColorPaint(
  Sender: TObject);
var
  Item: TxlsCustomItem;
begin
  Item := GetCurrFmtItem;
  if not Assigned(Item) then Exit;
  case Item.ItemType of
    itNoteFormat: PaintStandardColors(pbXLSNoteBackgroundColor,
      (Item as TxlsNoteFormat).BackgroundColor);
    itNote: PaintStandardColors(pbXLSNoteBackgroundColor,
      (Item as TxlsNote).Format.BackgroundColor);
  end;
end;

procedure TfmQExport3XLSEditor.btnXLSNoteForegroundColorMouseDown(
  Sender: TObject; Button: TMouseButton; Shift: TShiftState; X,
  Y: Integer);
begin
  IncLeftAndTop(pbXLSNoteForegroundColor);
end;

procedure TfmQExport3XLSEditor.btnXLSNoteForegroundColorMouseUp(
  Sender: TObject; Button: TMouseButton; Shift: TShiftState; X,
  Y: Integer);
begin
  DecLeftAndTop(pbXLSNoteForegroundColor);
end;

procedure TfmQExport3XLSEditor.btnXLSNoteForegroundColorClick(
  Sender: TObject);
var
  OClr, NClr: TColor;
  Item: TxlsCustomItem;
begin
  Item := GetCurrFmtItem;
  if not Assigned(Item) then Exit;

  case Item.ItemType of
    itNoteFormat: OClr := (Item as TxlsNoteFormat).ForegroundColor;
    itNote: OClr := (Item as TxlsNote).Format.ForegroundColor;
    else OClr := clBlack;
  end;

  ColorDialog.Color := OClr;
  if ColorDialog.Execute then begin
    NClr := ColorDialog.Color;
    if NClr <> OClr then
      case Item.ItemType of
        itNoteFormat: (Item as TxlsNoteFormat).ForegroundColor := NClr;
        itNote: (Item as TxlsNote).Format.ForegroundColor := NClr;
      end;
  end;
end;

procedure TfmQExport3XLSEditor.pbXLSNoteForegroundColorPaint(
  Sender: TObject);
var
  Item: TxlsCustomItem;
begin
  Item := GetCurrFmtItem;
  if not Assigned(Item) then Exit;
  case Item.ItemType of
    itNoteFormat: PaintStandardColors(pbXLSNoteForegroundColor,
    (Item as TxlsNoteFormat).ForegroundColor);
    itNote: PaintStandardColors(pbXLSNoteForegroundColor,
    (Item as TxlsNote).Format.ForegroundColor);
  end;
end;

procedure TfmQExport3XLSEditor.tbtAddExtensionClick(Sender: TObject);
  function GetFreeNodeIndex(Node: TTreeNode; const Fmt: string): integer;
  var
    i, j: integer;
    Flag: boolean;
  begin
    j := 1;
    Flag := true;
    while true do begin
      for i := 0 to Node.Count - 1 do
        if AnsiCompareStr(Node[i].Text, Format(Fmt, [j])) = 0 then begin
          Flag := false;
          Break;
        end;
      if not Flag then begin
        Inc(j);
        Flag := true;
      end
      else Break;
    end;
    Result := j;
  end;

var
  Str: string;
  Node: TTreeNode;
begin
  if not Assigned(tvExtensions.Selected) then Exit;

  case tvExtensions.Selected.ImageIndex of
    xlsHyperlink: begin
      Str := {$IFDEF WIN32}QExportLoadStr(QED_XLS_Hyperlink_DefaultTitle){$ENDIF}
             {$IFDEF LINUX}QED_XLS_Hyperlink_DefaultTitle{$ENDIF} + '_%d';
      Str := Format(Str, [GetFreeNodeIndex(FHyperlinkNode, Str)]);
      with tvExtensions.Items.AddChild(FHyperlinkNode, Str) do begin
        ImageIndex := xlsHyperlink;
        SelectedIndex := xlsHyperlink;
        Data := TxlsSheet(lvSheets.Selected.Data).Hyperlinks.Add;
        TxlsHyperlink(Data).Format.Assign(TxlsFormat(lvOptions.Items[5].Data));
        TxlsHyperlink(Data).Title := Str;
        Focused := true;
        Selected := true;
      end;
    end;
    xlsNote: begin
      Str := {$IFDEF WIN32}QExportLoadStr(QED_XLS_Note_DefaultTitle){$ENDIF}
             {$IFDEF LINUX}QED_XLS_Note_DefaultTitle{$ENDIF} + '_%d';
      Str := Format(Str, [GetFreeNodeIndex(FNoteNode, Str)]);
      with tvExtensions.Items.AddChild(FNoteNode, Str) do begin
        ImageIndex := xlsNote;
        SelectedIndex := xlsNote;
        Data := TxlsSheet(lvSheets.Selected.Data).Notes.Add;
        TxlsNote(Data).Format.Assign(TxlsNoteFormat(lvOptions.Items[6].Data));
        Focused := true;
        Selected := true;
      end;
    end;
    xlsChart: begin
      Str := {$IFDEF WIN32}QExportLoadStr(QED_XLS_Chart_DefaultTitle){$ENDIF}
             {$IFDEF LINUX}QED_XLS_Chart_DefaultTitle{$ENDIF} + '_%d';
      Str := Format(Str, [GetFreeNodeIndex(FChartNode, Str)]);
      Node := tvExtensions.Items.AddChild(FChartNode, Str);
      with Node do begin
        ImageIndex := xlsChart;
        SelectedIndex := xlsChart;
        Data := TxlsSheet(lvSheets.Selected.Data).Charts.Add;
        TxlsChart(Data).Title := Str;
        Focused := true;
        Selected := true;
      end;
      with tvExtensions.Items.AddChild(Node, {$IFDEF WIN32}QExportLoadStr(QED_XLS_Series){$ENDIF}
                                             {$IFDEF LINUX}QED_XLS_Series{$ENDIF}) do begin
        ImageIndex := xlsSeries;
        SelectedIndex := xlsSeries;
      end;
      Node.Expand(false);
    end;
    xlsSeries: begin
      Str := {$IFDEF WIN32}QExportLoadStr(QED_XLS_Series_DefaultTitle){$ENDIF}
             {$IFDEF LINUX}QED_XLS_Series_DefaultTitle{$ENDIF} + '_%d';
      if tvExtensions.Selected.Level = 2
        then Node := tvExtensions.Selected
        else Node := tvExtensions.Selected.Parent;
      Str := Format(Str, [GetFreeNodeIndex(Node, Str)]);
      with tvExtensions.Items.AddChild(Node, Str) do begin
        ImageIndex := xlsSeries;
        SelectedIndex := xlsSeries;
        Data := TxlsChartSeries.Create(TxlsChart(Parent.Parent.Data).Series);
        TxlsChartSeries(Data).Title := Str;
        Focused := true;
        Selected := true;
      end;
    end;
    xlsCell: begin
      Str := EmptyStr;
      with tvExtensions.Items.AddChild(FCellNode, Str) do begin
        ImageIndex := xlsCell;
        SelectedIndex := xlsCell;
        Data := TxlsSheet(lvSheets.Selected.Data).Cells.Add;
        Focused := true;
        Selected := true;
        Text := TxlsCell(Data).DisplayName;
        Focused := true;
        Selected := true;
      end;
    end;
    xlsMergedCell: begin
      Str := EmptyStr;
      with tvExtensions.Items.AddChild(FMergedCellNode, Str) do begin
        ImageIndex := xlsMergedCell;
        SelectedIndex := xlsMergedCell;
        Data := TxlsSheet(lvSheets.Selected.Data).MergedCells.Add;
        Text := TxlsMergedCells(Data).DisplayName;
        Focused := true;
        Selected := true;
      end;
    end;
  end;
end;

procedure TfmQExport3XLSEditor.tbtDelExtensionClick(Sender: TObject);
var
  i, N, L: integer;
  Node: TTreeNode;
begin
  if not Assigned(tvExtensions.Selected) then Exit;

  N := tvExtensions.Selected.Index;
  L := tvExtensions.Selected.Level;
  Node := tvExtensions.Selected.Parent;

  case L of
    0: begin
      for i := 0 to tvExtensions.Selected.Count - 1 do
        TObject(tvExtensions.Selected[i].Data).Free;
      tvExtensions.Selected.DeleteChildren;
    end;
    1, 3: begin
      TObject(tvExtensions.Selected.Data).Free;
      tvExtensions.Selected.Delete;
    end;
    2: begin
      TxlsChart(Node.Data).Series.Clear;
      tvExtensions.Selected.DeleteChildren;
    end;
  end;

  if L in [0, 2] then Exit;

  N := MinimumInt(N, Node.Count - 1);
  if Node.Count > 0 then begin
    Node[N].Focused := true;
    Node[N].Selected := true;
  end
  else begin
    Node.Focused := true;
    Node.Selected := true;
  end;
{var
  N: integer;
begin
  if not (Assigned(tvExtensions.Selected) and
    (tvExtensions.Selected.Level > 0)) then Exit;

  case tvExtensions.Selected.ImageIndex of
    xlsHyperlink: begin
      N := tvExtensions.Selected.Index;
      TxlsHyperlink(tvExtensions.Selected.Data).Free;
      tvExtensions.Selected.Delete;
      N := MinimumInt(N, FHyperlinkNode.Count - 1);
      if FHyperlinkNode.Count > 0 then begin
        FHyperlinkNode[N].Focused := true;
        FHyperlinkNode[N].Selected := true;
      end;
    end;
    xlsNote: begin
      N := tvExtensions.Selected.Index;
      TxlsNote(tvExtensions.Selected.Data).Free;
      tvExtensions.Selected.Delete;
      N := MinimumInt(N, FNoteNode.Count - 1);
      if FNoteNode.Count > 0 then begin
        FNoteNode[N].Focused := true;
        FNoteNode[N].Selected := true;
      end;
    end;
  end;}
end;

procedure TfmQExport3XLSEditor.pcXLSDataFormatChange(Sender: TObject);
begin
  FStandardFormatPageIndex := pcXLSDataFormat.ActivePage.PageIndex;
end;

procedure TfmQExport3XLSEditor.pcXLSNotesChange(Sender: TObject);
begin
  if tsXLSNoteBase.TabVisible
    then FNotePageIndex := pcXLSNotes.ActivePage.PageIndex
    else FNoteFormatPageIndex := pcXLSNotes.ActivePage.PageIndex;
end;

procedure TfmQExport3XLSEditor.pcXLSHyperlinksChange(Sender: TObject);
begin
  FHyperlinkPageIndex := pcXLSHyperlinks.ActivePage.PageIndex;
end;

procedure TfmQExport3XLSEditor.edXLSHyperlinkColExit(Sender: TObject);
var
  Item: TxlsCustomItem;
begin
  Item := GetCurrFmtItem;
  if not (Assigned(Item) and (Item.ItemType = itHyperlink)) then Exit;
  (Item as TxlsHyperlink).Col := StrToIntDef(edXLSHyperlinkCol.Text, 0);
  if IntToStr((Item as TxlsHyperlink).Col) <> edXLSHyperlinkCol.Text then
    edXLSHyperlinkCol.Text := IntToStr((Item as TxlsHyperlink).Col);
end;

procedure TfmQExport3XLSEditor.edXLSHyperlinkRowExit(Sender: TObject);
var
  Item: TxlsCustomItem;
begin
  Item := GetCurrFmtItem;
  if not (Assigned(Item) and (Item.ItemType = itHyperlink)) then Exit;
  (Item as TxlsHyperlink).Row := StrToIntDef(edXLSHyperlinkRow.Text, 0);
  if IntToStr((Item as TxlsHyperlink).Row) <> edXLSHyperlinkRow.Text then
    edXLSHyperlinkRow.Text := IntToStr((Item as TxlsHyperlink).Row);
end;

procedure TfmQExport3XLSEditor.rgXLSHyperlinkStyleClick(Sender: TObject);
var
  Item: TxlsCustomItem;
begin
  Item := GetCurrFmtItem;
  if not (Assigned(Item) and (Item.ItemType = itHyperlink)) then Exit;
  (Item as TxlsHyperlink).Style :=
    TxlsHyperlinkStyle(rgXLSHyperlinkStyle.ItemIndex);
end;

procedure TfmQExport3XLSEditor.edXLSHyperlinkTitleChange(Sender: TObject);
var
  Item: TxlsCustomItem;
begin
  Item := GetCurrFmtItem;
  if not (Assigned(Item) and (Item.ItemType = itHyperlink)) then Exit;
  (Item as TxlsHyperlink).Title := edXLSHyperlinkTitle.Text;
end;

procedure TfmQExport3XLSEditor.edXLSHyperlinkTargetChange(Sender: TObject);
var
  Item: TxlsCustomItem;
begin
  Item := GetCurrFmtItem;
  if not (Assigned(Item) and (Item.ItemType = itHyperlink)) then Exit;
  (Item as TxlsHyperlink).Target := edXLSHyperlinkTarget.Text;
end;

procedure TfmQExport3XLSEditor.edXLSNoteColExit(Sender: TObject);
var
  Item: TxlsCustomItem;
begin
  Item := GetCurrFmtItem;
  if not (Assigned(Item) and (Item.ItemType = itNote)) then Exit;
  (Item as TxlsNote).Col := StrToIntDef(edXLSNoteCol.Text, 0);
  if IntToStr((Item as TxlsNote).Col) <> edXLSNoteCol.Text then
    edXLSNoteCol.Text := IntToStr((Item as TxlsNote).Col);
end;

procedure TfmQExport3XLSEditor.edXLSNoteRowExit(Sender: TObject);
var
  Item: TxlsCustomItem;
begin
  Item := GetCurrFmtItem;
  if not (Assigned(Item) and (Item.ItemType = itNote)) then Exit;
  (Item as TxlsNote).Row := StrToIntDef(edXLSNoteRow.Text, 0);
  if IntToStr((Item as TxlsNote).Row) <> edXLSNoteRow.Text then
    edXLSNoteRow.Text := IntToStr((Item as TxlsNote).Row);
end;

procedure TfmQExport3XLSEditor.mmXLSNoteLinesChange(Sender: TObject);
var
  Item: TxlsCustomItem;
begin
  Item := GetCurrFmtItem;
  if not (Assigned(Item) and (Item.ItemType = itNote)) then Exit;
  (Item as TxlsNote).Lines.Text := mmXLSNoteLines.Lines.Text;
end;

procedure TfmQExport3XLSEditor.pcXLSChartsChange(Sender: TObject);
begin
  FChartPageIndex := pcXLSCharts.ActivePage.PageIndex;
end;

procedure TfmQExport3XLSEditor.edXLSChartTitleChange(Sender: TObject);
var
  Item: TxlsCustomItem;
begin
  Item := GetCurrFmtItem;
  if not (Assigned(Item) and (Item.ItemType = itChart)) then Exit;
  (Item as TxlsChart).Title := edXLSChartTitle.Text;
end;

procedure TfmQExport3XLSEditor.cbXLSChartStyleChange(Sender: TObject);
var
  Item: TxlsCustomItem;
begin
  Item := GetCurrFmtItem;
  if not (Assigned(Item) and (Item.ItemType = itChart)) then Exit;
  (Item as TxlsChart).Style := TxlsChartStyle(cbXLSChartStyle.ItemIndex);
end;

procedure TfmQExport3XLSEditor.rgXLSChartLegendPositionClick(
  Sender: TObject);
var
  Item: TxlsCustomItem;
begin
  Item := GetCurrFmtItem;
  if not (Assigned(Item) and (Item.ItemType = itChart)) then Exit;
  (Item as TxlsChart).LegendPlacement :=
    TxlsChartLegendPlacement(rgXLSChartLegendPosition.ItemIndex);
end;

procedure TfmQExport3XLSEditor.chXLSChartShowLegendClick(Sender: TObject);
var
  Item: TxlsCustomItem;
begin
  Item := GetCurrFmtItem;
  if not (Assigned(Item) and (Item.ItemType = itChart)) then Exit;
  (Item as TxlsChart).ShowLegend := chXLSChartShowLegend.Checked;
end;

procedure TfmQExport3XLSEditor.chXLSChartAutoColorClick(Sender: TObject);
var
  Item: TxlsCustomItem;
begin
  Item := GetCurrFmtItem;
  if not (Assigned(Item) and (Item.ItemType = itChart)) then Exit;
  (Item as TxlsChart).AutoColor := chXLSChartAutoColor.Checked;
end;

procedure TfmQExport3XLSEditor.TuneXLSChartPosition;
var
  Item: TxlsCustomItem;
begin
  Item := GetCurrFmtItem;
  if not (Assigned(Item) and (Item.ItemType = itChart)) then Exit;
  laXLSChartPlacement.Enabled := TxlsChart(Item).Position.PositionType = cptAuto;
  cbXLSChartPlacement.Enabled := TxlsChart(Item).Position.PositionType = cptAuto;
  if TxlsChart(Item).Position.PositionType = cptAuto then begin
    laXLSChartLeft.Caption := 'Left';
    laXLSChartTop.Caption := 'Top';
    laXLSChartHeight.Caption := 'Height';
    laXLSChartWidth.Caption := 'Width';

    edXLSChartLeft.Text := IntToStr(TxlsChart(Item).Position.AutoPosition.Left);
    edXLSChartTop.Text := IntToStr(TxlsChart(Item).Position.AutoPosition.Top);
    edXLSChartHeight.Text := IntToStr(TxlsChart(Item).Position.AutoPosition.Height);
    edXLSChartWidth.Text := IntToStr(TxlsChart(Item).Position.AutoPosition.Width);
  end
  else begin
    laXLSChartLeft.Caption := 'X1';
    laXLSChartTop.Caption := 'Y1';
    laXLSChartHeight.Caption := 'X2';
    laXLSChartWidth.Caption := 'Y2';

    edXLSChartLeft.Text := IntToStr(TxlsChart(Item).Position.CustomPosition.X1);
    edXLSChartTop.Text := IntToStr(TxlsChart(Item).Position.CustomPosition.Y1);
    edXLSChartHeight.Text := IntToStr(TxlsChart(Item).Position.CustomPosition.X2);
    edXLSChartWidth.Text := IntToStr(TxlsChart(Item).Position.CustomPosition.Y2);
  end;
end;

procedure TfmQExport3XLSEditor.rbXLSChartAutoPositionClick(
  Sender: TObject);
var
  Item: TxlsCustomItem;
begin
  Item := GetCurrFmtItem;
  if not (Assigned(Item) and (Item.ItemType = itChart)) then Exit;
  (Item as TxlsChart).Position.PositionType  := cptAuto;
  TuneXLSChartPosition;
end;

procedure TfmQExport3XLSEditor.cbXLSChartPlacementChange(Sender: TObject);
var
  Item: TxlsCustomItem;
begin
  Item := GetCurrFmtItem;
  if not (Assigned(Item) and (Item.ItemType = itChart)) then Exit;
  (Item as TxlsChart).Position.AutoPosition.Placement :=
    TxlsChartPlacement(cbXLSChartPlacement);
end;

procedure TfmQExport3XLSEditor.rbXLSChartCustomPositionClick(
  Sender: TObject);
var
  Item: TxlsCustomItem;
begin
  Item := GetCurrFmtItem;
  if not (Assigned(Item) and (Item.ItemType = itChart)) then Exit;
  (Item as TxlsChart).Position.PositionType  := cptCustom;
  TuneXLSChartPosition;
end;

procedure TfmQExport3XLSEditor.edXLSChartLeftExit(Sender: TObject);
var
  Item: TxlsCustomItem;
begin
  Item := GetCurrFmtItem;
  if not (Assigned(Item) and (Item.ItemType = itChart)) then Exit;
  if TxlsChart(Item).Position.PositionType = cptAuto then begin
    (Item as TxlsChart).Position.AutoPosition.Left :=
      StrToIntDef(edXLSChartLeft.Text, 0);
    if IntToStr((Item as TxlsChart).Position.AutoPosition.Left) <>
         edXLSChartLeft.Text then
      edXLSChartLeft.Text := IntToStr((Item as TxlsChart).Position.AutoPosition.Left);
  end
  else begin
    (Item as TxlsChart).Position.CustomPosition.X1 :=
      StrToIntDef(edXLSChartLeft.Text, 0);
    if IntToStr((Item as TxlsChart).Position.CustomPosition.X1) <>
         edXLSChartLeft.Text then
      edXLSChartLeft.Text := IntToStr((Item as TxlsChart).Position.CustomPosition.X1);
  end;
end;

procedure TfmQExport3XLSEditor.edXLSChartTopExit(Sender: TObject);
var
  Item: TxlsCustomItem;
begin
  Item := GetCurrFmtItem;
  if not (Assigned(Item) and (Item.ItemType = itChart)) then Exit;
  if TxlsChart(Item).Position.PositionType = cptAuto then begin
    (Item as TxlsChart).Position.AutoPosition.Top :=
      StrToIntDef(edXLSChartTop.Text, 0);
    if IntToStr((Item as TxlsChart).Position.AutoPosition.Top) <>
         edXLSChartTop.Text then
      edXLSChartTop.Text := IntToStr((Item as TxlsChart).Position.AutoPosition.Top);
  end
  else begin
    (Item as TxlsChart).Position.CustomPosition.Y1 :=
      StrToIntDef(edXLSChartTop.Text, 0);
    if IntToStr((Item as TxlsChart).Position.CustomPosition.Y1) <>
         edXLSChartTop.Text then
      edXLSChartTop.Text := IntToStr((Item as TxlsChart).Position.CustomPosition.Y1);
  end;
end;

procedure TfmQExport3XLSEditor.edXLSChartHeightExit(Sender: TObject);
var
  Item: TxlsCustomItem;
begin
  Item := GetCurrFmtItem;
  if not (Assigned(Item) and (Item.ItemType = itChart)) then Exit;
  if TxlsChart(Item).Position.PositionType = cptAuto then begin
    (Item as TxlsChart).Position.AutoPosition.Height :=
      StrToIntDef(edXLSChartHeight.Text, 0);
    if IntToStr((Item as TxlsChart).Position.AutoPosition.Height) <>
         edXLSChartHeight.Text then
      edXLSChartHeight.Text := IntToStr((Item as TxlsChart).Position.AutoPosition.Height);
  end
  else begin
    (Item as TxlsChart).Position.CustomPosition.X2 :=
      StrToIntDef(edXLSChartHeight.Text, 0);
    if IntToStr((Item as TxlsChart).Position.CustomPosition.X2) <>
         edXLSChartHeight.Text then
      edXLSChartHeight.Text := IntToStr((Item as TxlsChart).Position.CustomPosition.X2);
  end;
end;

procedure TfmQExport3XLSEditor.edXLSChartWidthExit(Sender: TObject);
var
  Item: TxlsCustomItem;
begin
  Item := GetCurrFmtItem;
  if not (Assigned(Item) and (Item.ItemType = itChart)) then Exit;
  if TxlsChart(Item).Position.PositionType = cptAuto then begin
    (Item as TxlsChart).Position.AutoPosition.Width :=
      StrToIntDef(edXLSChartWidth.Text, 0);
    if IntToStr((Item as TxlsChart).Position.AutoPosition.Width) <>
         edXLSChartWidth.Text then
      edXLSChartWidth.Text := IntToStr((Item as TxlsChart).Position.AutoPosition.Width);
  end
  else begin
    (Item as TxlsChart).Position.CustomPosition.Y2 :=
      StrToIntDef(edXLSChartWidth.Text, 0);
    if IntToStr((Item as TxlsChart).Position.CustomPosition.Y2) <>
         edXLSChartWidth.Text then
      edXLSChartWidth.Text := IntToStr((Item as TxlsChart).Position.CustomPosition.Y2);
  end;
end;

procedure TfmQExport3XLSEditor.TuneXLSChartCategoryLabel;
var
  Item: TxlsCustomItem;
begin
  Item := GetCurrFmtItem;
  if not (Assigned(Item) and (Item.ItemType = itChart)) then Exit;
  cbXLSChartCategoryLabelColumn.Enabled :=
    TxlsChart(Item).CategoryLabelsType = rtColumn;
  gbXLSChartCustomCategoryLabel.Enabled :=
    TxlsChart(Item).CategoryLabelsType = rtCustom;
  laXLSChartCategoryLabelsCol1.Enabled :=
    TxlsChart(Item).CategoryLabelsType = rtCustom;
  edXLSChartCategoryLabelsCol1.Enabled :=
    TxlsChart(Item).CategoryLabelsType = rtCustom;
  laXLSChartCategoryLabelsCol2.Enabled :=
    TxlsChart(Item).CategoryLabelsType = rtCustom;
  edXLSChartCategoryLabelsCol2.Enabled :=
    TxlsChart(Item).CategoryLabelsType = rtCustom;
  laXLSChartCategoryLabelsRow1.Enabled :=
    TxlsChart(Item).CategoryLabelsType = rtCustom;
  edXLSChartCategoryLabelsRow1.Enabled :=
    TxlsChart(Item).CategoryLabelsType = rtCustom;
  laXLSChartCategoryLabelsRow2.Enabled :=
    TxlsChart(Item).CategoryLabelsType = rtCustom;
  edXLSChartCategoryLabelsRow2.Enabled :=
    TxlsChart(Item).CategoryLabelsType = rtCustom;
end;

procedure TfmQExport3XLSEditor.rbXLSChartCategoryLabelColumnClick(
  Sender: TObject);
var
  Item: TxlsCustomItem;
begin
  Item := GetCurrFmtItem;
  if not (Assigned(Item) and (Item.ItemType = itChart)) then Exit;
  (Item as TxlsChart).CategoryLabelsType  := rtColumn;
  TuneXLSChartCategoryLabel;
end;

procedure TfmQExport3XLSEditor.cbXLSChartCategoryLabelColumnChange(
  Sender: TObject);
var
  Item: TxlsCustomItem;
begin
  Item := GetCurrFmtItem;
  if not (Assigned(Item) and (Item.ItemType = itChart)) then Exit;
  (Item as TxlsChart).CategoryLabelsColumn := cbXLSChartCategoryLabelColumn.Text;
end;

procedure TfmQExport3XLSEditor.rbXLSChartCategoryLabelCustomClick(
  Sender: TObject);
var
  Item: TxlsCustomItem;
begin
  Item := GetCurrFmtItem;
  if not (Assigned(Item) and (Item.ItemType = itChart)) then Exit;
  (Item as TxlsChart).CategoryLabelsType  := rtCustom;
  TuneXLSChartCategoryLabel;
end;

procedure TfmQExport3XLSEditor.edXLSChartCategoryLabelsCol1Exit(
  Sender: TObject);
var
  Item: TxlsCustomItem;
begin
  Item := GetCurrFmtItem;
  if not (Assigned(Item) and (Item.ItemType = itChart)) then Exit;
  (Item as TxlsChart).CategoryLabels.Col1 :=
    StrToIntDef(edXLSChartCategoryLabelsCol1.Text, 0);
  if IntToStr((Item as TxlsChart).CategoryLabels.Col1) <> edXLSChartCategoryLabelsCol1.Text then
    edXLSChartCategoryLabelsCol1.Text := IntToStr((Item as TxlsChart).CategoryLabels.Col1);
end;

procedure TfmQExport3XLSEditor.edXLSChartCategoryLabelsCol2Exit(
  Sender: TObject);
var
  Item: TxlsCustomItem;
begin
  Item := GetCurrFmtItem;
  if not (Assigned(Item) and (Item.ItemType = itChart)) then Exit;
  (Item as TxlsChart).CategoryLabels.Col2 :=
    StrToIntDef(edXLSChartCategoryLabelsCol2.Text, 0);
  if IntToStr((Item as TxlsChart).CategoryLabels.Col2) <> edXLSChartCategoryLabelsCol2.Text then
    edXLSChartCategoryLabelsCol2.Text := IntToStr((Item as TxlsChart).CategoryLabels.Col2);
end;

procedure TfmQExport3XLSEditor.edXLSChartCategoryLabelsRow1Exit(
  Sender: TObject);
var
  Item: TxlsCustomItem;
begin
  Item := GetCurrFmtItem;
  if not (Assigned(Item) and (Item.ItemType = itChart)) then Exit;
  (Item as TxlsChart).CategoryLabels.Row1 :=
    StrToIntDef(edXLSChartCategoryLabelsRow1.Text, 0);
  if IntToStr((Item as TxlsChart).CategoryLabels.Row1) <> edXLSChartCategoryLabelsRow1.Text then
    edXLSChartCategoryLabelsRow1.Text := IntToStr((Item as TxlsChart).CategoryLabels.Row1);
end;

procedure TfmQExport3XLSEditor.edXLSChartCategoryLabelsRow2Exit(
  Sender: TObject);
var
  Item: TxlsCustomItem;
begin
  Item := GetCurrFmtItem;
  if not (Assigned(Item) and (Item.ItemType = itChart)) then Exit;
  (Item as TxlsChart).CategoryLabels.Row2 :=
    StrToIntDef(edXLSChartCategoryLabelsRow2.Text, 0);
  if IntToStr((Item as TxlsChart).CategoryLabels.Row2) <> edXLSChartCategoryLabelsRow2.Text then
    edXLSChartCategoryLabelsRow2.Text := IntToStr((Item as TxlsChart).CategoryLabels.Row2);
end;

procedure TfmQExport3XLSEditor.pcXLSSeriesChange(Sender: TObject);
begin
  FSeriesPageIndex := pcXLSSeries.ActivePage.PageIndex;
end;

procedure TfmQExport3XLSEditor.edXLSSeriesTitleChange(Sender: TObject);
var
  Item: TxlsCustomItem;
begin
  Item := GetCurrFmtItem;
  if not (Assigned(Item) and (Item.ItemType = itSeries)) then Exit;
  (Item as TxlsChartSeries).Title := edXLSSeriesTitle.Text;
end;

procedure TfmQExport3XLSEditor.TuneXLSSeriesDataRange;
var
  Item: TxlsCustomItem;
begin
  Item := GetCurrFmtItem;
  if not (Assigned(Item) and (Item.ItemType = itSeries)) then Exit;
  cbXLSSeriesColumn.Enabled := TxlsChartSeries(Item).DataRangeType = rtColumn;
  laXLSSeriesDataRangeCol1.Enabled := TxlsChartSeries(Item).DataRangeType = rtCustom;
  edXLSSeriesDataRangeCol1.Enabled := TxlsChartSeries(Item).DataRangeType = rtCustom;
  laXLSSeriesDataRangeCol2.Enabled := TxlsChartSeries(Item).DataRangeType = rtCustom;
  edXLSSeriesDataRangeCol2.Enabled := TxlsChartSeries(Item).DataRangeType = rtCustom;
  laXLSSeriesDataRangeRow1.Enabled := TxlsChartSeries(Item).DataRangeType = rtCustom;
  edXLSSeriesDataRangeRow1.Enabled := TxlsChartSeries(Item).DataRangeType = rtCustom;
  laXLSSeriesDataRangeRow2.Enabled := TxlsChartSeries(Item).DataRangeType = rtCustom;
  edXLSSeriesDataRangeRow2.Enabled := TxlsChartSeries(Item).DataRangeType = rtCustom;
end;

procedure TfmQExport3XLSEditor.rbXLSSeriesColumnClick(Sender: TObject);
var
  Item: TxlsCustomItem;
begin
  Item := GetCurrFmtItem;
  if not (Assigned(Item) and (Item.ItemType = itSeries)) then Exit;
  (Item as TxlsChartSeries).DataRangeType := rtColumn;
  TuneXLSSeriesDataRange;
end;

procedure TfmQExport3XLSEditor.cbXLSSeriesColumnChange(Sender: TObject);
var
  Item: TxlsCustomItem;
begin
  Item := GetCurrFmtItem;
  if not (Assigned(Item) and (Item.ItemType = itSeries)) then Exit;
  (Item as TxlsChartSeries).DataColumn := cbXLSSeriesColumn.Text;
end;

procedure TfmQExport3XLSEditor.rbXLSSeriesCustomClick(Sender: TObject);
var
  Item: TxlsCustomItem;
begin
  Item := GetCurrFmtItem;
  if not (Assigned(Item) and (Item.ItemType = itSeries)) then Exit;
  (Item as TxlsChartSeries).DataRangeType := rtCustom;
  TuneXLSSeriesDataRange;
end;

procedure TfmQExport3XLSEditor.edXLSSeriesDataRangeCol1Exit(
  Sender: TObject);
var
  Item: TxlsCustomItem;
begin
  Item := GetCurrFmtItem;
  if not (Assigned(Item) and (Item.ItemType = itSeries)) then Exit;
  (Item as TxlsChartSeries).DataRange.Col1 :=
    StrToIntDef(edXLSSeriesDataRangeCol1.Text, 0);
  if IntToStr((Item as TxlsChartSeries).DataRange.Col1) <> edXLSSeriesDataRangeCol1.Text then
    edXLSSeriesDataRangeCol1.Text := IntToStr((Item as TxlsChartSeries).DataRange.Col1);
end;

procedure TfmQExport3XLSEditor.edXLSSeriesDataRangeCol2Exit(
  Sender: TObject);
var
  Item: TxlsCustomItem;
begin
  Item := GetCurrFmtItem;
  if not (Assigned(Item) and (Item.ItemType = itSeries)) then Exit;
  (Item as TxlsChartSeries).DataRange.Col2 :=
    StrToIntDef(edXLSSeriesDataRangeCol2.Text, 0);
  if IntToStr((Item as TxlsChartSeries).DataRange.Col2) <> edXLSSeriesDataRangeCol2.Text then
    edXLSSeriesDataRangeCol2.Text := IntToStr((Item as TxlsChartSeries).DataRange.Col2);
end;

procedure TfmQExport3XLSEditor.edXLSSeriesDataRangeRow1Exit(
  Sender: TObject);
var
  Item: TxlsCustomItem;
begin
  Item := GetCurrFmtItem;
  if not (Assigned(Item) and (Item.ItemType = itSeries)) then Exit;
  (Item as TxlsChartSeries).DataRange.Row1 :=
    StrToIntDef(edXLSSeriesDataRangeRow1.Text, 0);
  if IntToStr((Item as TxlsChartSeries).DataRange.Row1) <> edXLSSeriesDataRangeRow1.Text then
    edXLSSeriesDataRangeRow1.Text := IntToStr((Item as TxlsChartSeries).DataRange.Row1);
end;

procedure TfmQExport3XLSEditor.edXLSSeriesDataRangeRow2Exit(
  Sender: TObject);
var
  Item: TxlsCustomItem;
begin
  Item := GetCurrFmtItem;
  if not (Assigned(Item) and (Item.ItemType = itSeries)) then Exit;
  (Item as TxlsChartSeries).DataRange.Row2 :=
    StrToIntDef(edXLSSeriesDataRangeRow2.Text, 0);
  if IntToStr((Item as TxlsChartSeries).DataRange.Row2) <> edXLSSeriesDataRangeRow2.Text then
    edXLSSeriesDataRangeRow2.Text := IntToStr((Item as TxlsChartSeries).DataRange.Row2);
end;

procedure TfmQExport3XLSEditor.pcXLSCellsChange(Sender: TObject);
begin
  FCellPageIndex := pcXLSCells.ActivePage.PageIndex;
end;

procedure TfmQExport3XLSEditor.pcXLSMergedCellsChange(Sender: TObject);
begin
  FMergedCellPageIndex := pcXLSMergedCells.ActivePage.PageIndex;
end;

procedure TfmQExport3XLSEditor.edXLSCellColExit(Sender: TObject);
var
  Item: TxlsCustomItem;
begin
  Item := GetCurrFmtItem;
  if not (Assigned(Item) and (Item.ItemType = itCell)) then Exit;
  (Item as TxlsCell).Col := StrToIntDef(edXLSCellCol.Text, 0);
  if IntToStr((Item as TxlsCell).Col) <> edXLSCellCol.Text then
    edXLSCellCol.Text := IntToStr((Item as TxlsCell).Col);
  tvExtensions.Selected.Text := Item.DisplayName;
end;

procedure TfmQExport3XLSEditor.edXLSCellRowExit(Sender: TObject);
var
  Item: TxlsCustomItem;
begin
  Item := GetCurrFmtItem;
  if not (Assigned(Item) and (Item.ItemType = itCell)) then Exit;
  (Item as TxlsCell).Row := StrToIntDef(edXLSCellRow.Text, 0);
  if IntToStr((Item as TxlsCell).Row) <> edXLSCellRow.Text then
    edXLSCellRow.Text := IntToStr((Item as TxlsCell).Row);
  tvExtensions.Selected.Text := Item.DisplayName;
end;

procedure TfmQExport3XLSEditor.cbXLSCellTypeChange(Sender: TObject);
var
  Item: TxlsCustomItem;
begin
  Item := GetCurrFmtItem;
  if not (Assigned(Item) and (Item.ItemType = itCell)) then Exit;
  (Item as TxlsCell).CellType := TxlsCellType(cbXLSCellType.ItemIndex);
end;

procedure TfmQExport3XLSEditor.edXLSCellValueChange(Sender: TObject);
var
  Item: TxlsCustomItem;
begin
  Item := GetCurrFmtItem;
  if not (Assigned(Item) and (Item.ItemType = itCell)) then Exit;
  (Item as TxlsCell).Value := edXLSCellValue.Text;
end;

procedure TfmQExport3XLSEditor.edXLSCellDateTimeFormatChange(
  Sender: TObject);
var
  Item: TxlsCustomItem;
begin
  Item := GetCurrFmtItem;
  if not (Assigned(Item) and (Item.ItemType = itCell)) then Exit;
  (Item as TxlsCell).DateTimeFormat := edXLSCellDateTimeFormat.Text;
end;

procedure TfmQExport3XLSEditor.edXLSCellNumericFormatChange(
  Sender: TObject);
var
  Item: TxlsCustomItem;
begin
  Item := GetCurrFmtItem;
  if not (Assigned(Item) and (Item.ItemType = itCell)) then Exit;
  (Item as TxlsCell).NumericFormat := edXLSCellNumericFormat.Text;
end;

procedure TfmQExport3XLSEditor.edXLSMergedCellsFirstColExit(
  Sender: TObject);
var
  Item: TxlsCustomItem;
begin
  Item := GetCurrFmtItem;
  if not (Assigned(Item) and (Item.ItemType = itMergedCells)) then Exit;
  (Item as TxlsMergedCells).FirstCol := StrToIntDef(edXLSMergedCellsFirstCol.Text, 0);
  if IntToStr((Item as TxlsMergedCells).FirstCol) <> edXLSMergedCellsFirstCol.Text then
    edXLSMergedCellsFirstCol.Text := IntToStr((Item as TxlsMergedCells).FirstCol);
  tvExtensions.Selected.Text := Item.DisplayName;
end;

procedure TfmQExport3XLSEditor.edXLSMergedCellsFirstRowExit(
  Sender: TObject);
var
  Item: TxlsCustomItem;
begin
  Item := GetCurrFmtItem;
  if not (Assigned(Item) and (Item.ItemType = itMergedCells)) then Exit;
  (Item as TxlsMergedCells).FirstRow := StrToIntDef(edXLSMergedCellsFirstRow.Text, 0);
  if IntToStr((Item as TxlsMergedCells).FirstRow) <> edXLSMergedCellsFirstRow.Text then
    edXLSMergedCellsFirstRow.Text := IntToStr((Item as TxlsMergedCells).FirstRow);
  tvExtensions.Selected.Text := Item.DisplayName;
end;

procedure TfmQExport3XLSEditor.edXLSMergedCellsLastColExit(
  Sender: TObject);
var
  Item: TxlsCustomItem;
begin
  Item := GetCurrFmtItem;
  if not (Assigned(Item) and (Item.ItemType = itMergedCells)) then Exit;
  (Item as TxlsMergedCells).LastCol := StrToIntDef(edXLSMergedCellsLastCol.Text, 0);
  if IntToStr((Item as TxlsMergedCells).LastCol) <> edXLSMergedCellsLastCol.Text then
    edXLSMergedCellsLastCol.Text := IntToStr((Item as TxlsMergedCells).LastCol);
  tvExtensions.Selected.Text := Item.DisplayName;
end;

procedure TfmQExport3XLSEditor.edXLSMergedCellsLastRowExit(
  Sender: TObject);
var
  Item: TxlsCustomItem;
begin
  Item := GetCurrFmtItem;
  if not (Assigned(Item) and (Item.ItemType = itMergedCells)) then Exit;
  (Item as TxlsMergedCells).LastRow := StrToIntDef(edXLSMergedCellsLastRow.Text, 0);
  if IntToStr((Item as TxlsMergedCells).LastRow) <> edXLSMergedCellsLastRow.Text then
    edXLSMergedCellsLastRow.Text := IntToStr((Item as TxlsMergedCells).LastRow);
  tvExtensions.Selected.Text := Item.DisplayName;
end;

end.
