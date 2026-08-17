unit QExport3Dialog;

{$I VerCtrl.inc}

interface

uses
  Forms, StdCtrls, ExtCtrls, ComCtrls, Controls, Classes, Db, QExport3,
  Dialogs, Buttons, {$IFDEF VCL4}ImgList,{$ENDIF} Grids, Windows, Graphics,
  QExport3RTF, QExport3HTML, ExtDlgs, QExport3XLS, QExport3XML, QExport3ASCII,
  QExport3Clipboard, QExport3SQL, QExport3LaTeX, QExport3DBF, DbGrids,
  QExport3Common, fuQExport3Progress, ToolWin, QExport3PDF, Menus,
  QExport3Options, QExport3CustomSource;

type
  TAllowedExport = (aeXLS, aeWord, aeRTF, aeHTML, aeXML, aeDBF, aePDF, aeTXT,
    aeCSV, aeDIFF, aeSylk, aeLaTeX, aeSQL, aeClipboard);
  TAllowedExports = set of TAllowedExport;

  TCommonOption = (coFields, coFormats, coColons, coCaptions, coOptions);
  TCommonOptions = set of TCommonOption;
  
  TQExport3Dialog = class;

  TQExport3DialogF = class(TForm)
    paFileName: TPanel;
    laFileName: TLabel;
    edFileName: TEdit;
    bBrowse: TButton;
    chShowFile: TCheckBox;
    paButtons: TPanel;
    bStart: TButton;
    bCancel: TButton;
    Pages: TPageControl;
    tshExportType: TTabSheet;
    tshFields: TTabSheet;
    sdExportFile: TSaveDialog;
    laAvailableFields: TLabel;
    laExportedFields: TLabel;
    lstAvailableFields: TListView;
    lstExportedFields: TListView;
    bAddOneExportedField: TSpeedButton;
    bAddAllExportedField: TSpeedButton;
    bDelOneExportedField: TSpeedButton;
    bDelAllExportedField: TSpeedButton;
    imgFields: TImageList;
    tshFormats: TTabSheet;
    gbStandardFormats: TGroupBox;
    laIntegerFormat: TLabel;
    laDateFormat: TLabel;
    laDateTimeFormat: TLabel;
    laFloatFormat: TLabel;
    laTimeFormat: TLabel;
    laCurrencyFormat: TLabel;
    edIntegerFormat: TEdit;
    edDateFormat: TEdit;
    edDateTimeFormat: TEdit;
    edFloatFormat: TEdit;
    edTimeFormat: TEdit;
    edCurrencyFormat: TEdit;
    gbUserFormat: TGroupBox;
    cbxFormatFields: TComboBox;
    cbxUserFormats: TComboBox;
    laEqual_01: TLabel;
    lstUserFormats: TListView;
    bAddUserFormat: TSpeedButton;
    bEditUserFormat: TSpeedButton;
    bDeleteUserFormat: TSpeedButton;
    bClearUserFormats: TSpeedButton;
    tshHeaderFooter: TTabSheet;
    laHeader: TLabel;
    laFooter: TLabel;
    memHeader: TMemo;
    memFooter: TMemo;
    tshCaptions: TTabSheet;
    sgrCaptions: TStringGrid;
    tshRTF: TTabSheet;
    FontDialog: TFontDialog;
    tshXML: TTabSheet;
    chXMLStandalone: TCheckBox;
    laXMLEncoding: TLabel;
    edXMLEncoding: TEdit;
    tshSQL: TTabSheet;
    gbSQLCommit: TGroupBox;
    edSQLCommitRecCount: TEdit;
    laSQLUseCommit_02: TLabel;
    chSQLCommitAfterScript: TCheckBox;
    laSQLCommitStatement: TLabel;
    edSQLCommitStatement: TEdit;
    gbSQLMisc: TGroupBox;
    laSQLNullString: TLabel;
    edSQLNullString: TEdit;
    laSQLStatementTerm: TLabel;
    edSQLStatementTerm: TEdit;
    tshHTML: TTabSheet;
    pcHTML: TPageControl;
    tshHTMLPreview: TTabSheet;
    tshHTMLBasic: TTabSheet;
    tshHTMLAdvanced: TTabSheet;
    paHTMLPreview: TPanel;
    paHTMLBackground: TPanel;
    laHTMLFont: TLabel;
    paHTMLColumnHead_1: TPanel;
    paHTMLColumnHead_2: TPanel;
    paHTMLColumnHead_3: TPanel;
    paHTMLOddRowCol_1: TPanel;
    paHTMLOddRowCol_2: TPanel;
    paHTMLOddRowCol_3: TPanel;
    paHTMLEvenRowCol_1: TPanel;
    paHTMLEvenRowCol_2: TPanel;
    paHTMLEvenRowCol_3: TPanel;
    paHTMLOddRowCol_4: TPanel;
    paHTMLOddRowCol_5: TPanel;
    paHTMLOddRowCol_6: TPanel;
    paHTMLEvenRowCol_4: TPanel;
    paHTMLEvenRowCol_5: TPanel;
    paHTMLEvenRowCol_6: TPanel;
    ColorDialog: TColorDialog;
    laHTMLHead_1: TLabel;
    laHTMLHead_2: TLabel;
    laHTMLHead_3: TLabel;
    laHTMLData_1: TLabel;
    laHTMLData_2: TLabel;
    laHTMLData_3: TLabel;
    laHTMLData_4: TLabel;
    laHTMLData_5: TLabel;
    laHTMLData_6: TLabel;
    laHTMLData_7: TLabel;
    laHTMLData_8: TLabel;
    laHTMLData_9: TLabel;
    laHTMLData_10: TLabel;
    laHTMLData_11: TLabel;
    laHTMLData_12: TLabel;
    laHTMLLink: TLabel;
    laHTMLVLink: TLabel;
    laHTMLALink: TLabel;
    laHTMLTemplate: TLabel;
    cbxHTMLTemplate: TComboBox;
    bHTMLSaveTemplate: TSpeedButton;
    bHTMLLoadTemplate: TSpeedButton;
    sdHTMLTemplate: TSaveDialog;
    odHTMLTemplate: TOpenDialog;
    laHTMLTitle: TLabel;
    edHTMLTitle: TEdit;
    odHTMLCSS: TOpenDialog;
    gbHTMLBodyOptions: TGroupBox;
    laHTMLBodyFontName: TLabel;
    laHTMLBackground: TLabel;
    laHTMLBodyAdvanced: TLabel;
    cbxHTMLFontName: TComboBox;
    edHTMLBackground: TEdit;
    btnHTMLBackground: TSpeedButton;
    edHTMLBodyAdvanced: TEdit;
    Bevel2: TBevel;
    gbHTMLTableOptions: TGroupBox;
    laHTMLCellPadding: TLabel;
    laHTMLCellSpacing: TLabel;
    laHTMLBorderWidth: TLabel;
    edHTMLCellPadding: TEdit;
    edHTMLCellSpacing: TEdit;
    edHTMLBorderWidth: TEdit;
    laHTMLTableAdvanced: TLabel;
    edHTMLTableAdvanced: TEdit;
    opdHTMLBackground: TOpenPictureDialog;
    tshXLS: TTabSheet;
    sdOptions: TSaveDialog;
    odOptions: TOpenDialog;
    chPrintFile: TCheckBox;
    pcXLS: TPageControl;
    tshXLSAdvanced: TTabSheet;
    tshXLSDataFormat: TTabSheet;
    btnXLSResetItem: TSpeedButton;
    btnXLSResetAll: TSpeedButton;
    laXLSPageHeader: TLabel;
    edXLSPageHeader: TEdit;
    laXLSPageFooter: TLabel;
    edXLSPageFooter: TEdit;
    pcXLSDataFormat: TPageControl;
    tshXLSFont: TTabSheet;
    tshXLSBorders: TTabSheet;
    laXLSFont: TLabel;
    cbxXLSFont: TComboBox;
    laXLSFontSize: TLabel;
    cbxXLSFontSize: TComboBox;
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
    Bevel11: TBevel;
    Bevel9: TBevel;
    btnBorderTop: TSpeedButton;
    btnBorderBottom: TSpeedButton;
    btnBorderLeft: TSpeedButton;
    btnBorderRight: TSpeedButton;
    btnBorderTopColor: TSpeedButton;
    Bevel10: TBevel;
    pbBorderTop: TPaintBox;
    btnBorderBottomColor: TSpeedButton;
    pbBorderBottom: TPaintBox;
    btnBorderLeftColor: TSpeedButton;
    pbBorderLeft: TPaintBox;
    btnBorderRightColor: TSpeedButton;
    pbBorderRight: TPaintBox;
    cmbBorderTop: TComboBox;
    cmbBorderBottom: TComboBox;
    cmbBorderLeft: TComboBox;
    cmbBorderRight: TComboBox;
    Bevel7: TBevel;
    tshXLSFill: TTabSheet;
    tshXLSAggregate: TTabSheet;
    Bevel13: TBevel;
    laSQLUseCommit_01: TLabel;
    gbSQLTableOptions: TGroupBox;
    chSQLCreateTable: TCheckBox;
    laSQLTableName: TLabel;
    edSQLTableName: TEdit;
    laBooleanTrue: TLabel;
    laBooleanFalse: TLabel;
    edBooleanTrue: TEdit;
    edBooleanFalse: TEdit;
    chAllowCaptions: TCheckBox;
    cbxColumnAlign: TComboBox;
    edColumnWidth: TEdit;
    udColumnWidth: TUpDown;
    laXLSSheetTitle: TLabel;
    edXLSSheetTitle: TEdit;
    laNullString: TLabel;
    edNullString: TEdit;
    pcExportType: TPageControl;
    tshExportFormats: TTabSheet;
    tshExportOptions: TTabSheet;
    rgExportType: TRadioGroup;
    gbExportConstraints: TGroupBox;
    laSkipRecCount_01: TLabel;
    laSkipRecCount_02: TLabel;
    edSkipRecCount: TEdit;
    chGoToFirstRecord: TCheckBox;
    gbHTMLUsingCSS: TGroupBox;
    laHTMLCSSFileName: TLabel;
    rbInternal: TRadioButton;
    rbExternal: TRadioButton;
    edHTMLCSSFileName: TEdit;
    bvHTMLCSSFileName: TBevel;
    btnHTMLCSSFileName: TSpeedButton;
    rbExportAllRecords: TRadioButton;
    rbExportOnly: TRadioButton;
    edExportRecCount: TEdit;
    laExportRecCount_02: TLabel;
    Bevel12: TBevel;
    tshASCII: TTabSheet;
    gbTXTOptions: TGroupBox;
    chTXTAutoCalcColWidth: TCheckBox;
    edTXTSpacing: TEdit;
    laTXTSpacing: TLabel;
    gbCSVOptions: TGroupBox;
    chCSVQuoteStrings: TCheckBox;
    laCSVComma: TLabel;
    edCSVComma: TEdit;
    pcXLSFormats: TPageControl;
    tshXLSFields: TTabSheet;
    tshXLSOptions: TTabSheet;
    lstXLSFields: TListView;
    lstXLSOptions: TListView;
    tshXLSStyles: TTabSheet;
    lstXLSStyles: TListView;
    rgXLSStripType: TRadioGroup;
    tbrXLSStyles: TToolBar;
    tbtAddXLSStyle: TToolButton;
    tbtDelXLSStyle: TToolButton;
    tbtUpXLSStyle: TToolButton;
    tbtDownXLSStyle: TToolButton;
    ilXLSStyles: TImageList;
    ToolButton1: TToolButton;
    tbtLoadXLSStyle: TToolButton;
    tbtSaveXLSStyle: TToolButton;
    odXLSStyle: TOpenDialog;
    sdXLSStyle: TSaveDialog;
    chCurrentRecordOnly: TCheckBox;
    Bevel1: TBevel;
    btnFillBackground: TSpeedButton;
    pbFillBackground: TPaintBox;
    cmbPattern: TComboBox;
    btnFillForeground: TSpeedButton;
    pbFillForeground: TPaintBox;
    bvXLSAggregate: TBevel;
    rgXLSFunction: TRadioGroup;
    edCSVQuote: TEdit;
    laCSVQuote: TLabel;
    chExportEmpty: TCheckBox;
    laCaptionRow: TLabel;
    edCaptionRow: TEdit;
    tshHTMLMultifile: TTabSheet;
    gbHTMLMultifileOptions: TGroupBox;
    laHTMLFileRecCount_01: TLabel;
    laHTMLFileRecCount_02: TLabel;
    edHTMLFileRecCount: TEdit;
    chHTMLGenerateIndex: TCheckBox;
    chHTMLUseMultiFileExport: TCheckBox;
    gbHTMLNavigation: TGroupBox;
    chHTMLNavigationOnTop: TCheckBox;
    chHTMLNavigationOnBottom: TCheckBox;
    laHTMLIndexLinkTitle: TLabel;
    edHTMLIndexLinkTitle: TEdit;
    laHTMLFirstLinkTitle: TLabel;
    edHTMLFirstLinkTitle: TEdit;
    laHTMLPriorLinkTitle: TLabel;
    edHTMLPriorLinkTitle: TEdit;
    laHTMLNextLinkTitle: TLabel;
    edHTMLNextLinkTitle: TEdit;
    laHTMLLastLinkTitle: TLabel;
    edHTMLLastLinkTitle: TEdit;
    laHTMLIndexLinkTemplate: TLabel;
    edHTMLIndexLinkTemplate: TEdit;
    laHTMLTableBackground: TLabel;
    edHTMLTableBackground: TEdit;
    btnHTMLTableBackground: TSpeedButton;
    Bevel15: TBevel;
    tshPDF: TTabSheet;
    lvPDFFonts: TListView;
    Bevel16: TBevel;
    laPDFFontName: TLabel;
    laPDFFontEncoding: TLabel;
    laPDFFontSize: TLabel;
    sbPDFFontColor: TSpeedButton;
    cbPDFFontName: TComboBox;
    cbPDFFontEncoding: TComboBox;
    edPDFFontSize: TEdit;
    paPDFSample: TPanel;
    bTools: TButton;
    pmTools: TPopupMenu;
    miLoadOptions: TMenuItem;
    miSaveOptions: TMenuItem;
    chXLSAutoCalcColWidth: TCheckBox;
    chHTMLOverwriteCSSFile: TCheckBox;
    pcPDFOptions: TPageControl;
    tshPDFGridOptions: TTabSheet;
    tshPDFPageOptions: TTabSheet;
    laPDFColSpacing: TLabel;
    edPDFColSpacing: TEdit;
    laPDFRowSpacing: TLabel;
    edPDFRowSpacing: TEdit;
    laPDFGridLineWidth: TLabel;
    edPDFGridLineWidth: TEdit;
    bvPDFGridOptions: TBevel;
    bvPDFPageOptions: TBevel;
    cbPDFPageFormat: TComboBox;
    laPDFPageFormat: TLabel;
    laPDFPageWidth: TLabel;
    laPDFPageHeight: TLabel;
    laPDFPageUnits: TLabel;
    edPDFPageWidth: TEdit;
    edPDFPageHeight: TEdit;
    cbPDFPageUnits: TComboBox;
    cbPDFPageOrientation: TComboBox;
    laPDFPageOrientation: TLabel;
    gbPDFMargins: TGroupBox;
    laPDFPageMarginLeft: TLabel;
    edPDFPageMarginLeft: TEdit;
    laPDFPageMarginRight: TLabel;
    edPDFPageMarginRight: TEdit;
    laPDFPageMarginTop: TLabel;
    edPDFPageMarginTop: TEdit;
    laPDFPageMarginBottom: TLabel;
    edPDFPageMarginBottom: TEdit;
    pcRTF: TPageControl;
    tsRTFDataStyles: TTabSheet;
    tsRTFAdvanced: TTabSheet;
    pcRTFStyles: TPageControl;
    tsRTFBaseStyles: TTabSheet;
    lstRTFBaseStyles: TListView;
    tsRTFStripStyles: TTabSheet;
    tbRTFStripStyles: TToolBar;
    tbtAddRTFStyle: TToolButton;
    tbtDelRTFStyle: TToolButton;
    tbtMoveRTFStyleUp: TToolButton;
    tbtMoveRTFStyleDown: TToolButton;
    ToolButton6: TToolButton;
    tbtLoadRTFStyle: TToolButton;
    tbtSaveRTFStyle: TToolButton;
    lstRTFStripStyles: TListView;
    rgRTFStripType: TRadioGroup;
    rgRTFPageOrientation: TRadioGroup;
    paRTFStyle: TPanel;
    laRTFSample: TLabel;
    pbRTFSample: TPaintBox;
    laRTFFont: TLabel;
    cbRTFFont: TComboBox;
    laRTFFontSize: TLabel;
    cbRTFFontSize: TComboBox;
    Bevel17: TBevel;
    bRTFFontColor: TSpeedButton;
    Bevel18: TBevel;
    bRTFFontBold: TSpeedButton;
    bRTFFontItalic: TSpeedButton;
    pbRTFFontColor: TPaintBox;
    bRTFFontStrikeOut: TSpeedButton;
    bRTFFontUnderline: TSpeedButton;
    bRTFFontLeft: TSpeedButton;
    bRTFFontCenter: TSpeedButton;
    bRTFFontRight: TSpeedButton;
    bRTFFontFill: TSpeedButton;
    Bevel19: TBevel;
    bRTFBackgroundColor: TSpeedButton;
    pbRTFBackgroundColor: TPaintBox;
    bRTFHighlightColor: TSpeedButton;
    pbRTFHighlightColor: TPaintBox;
    Bevel20: TBevel;
    chRTFAllowBackground: TCheckBox;
    chRTFAllowHighlight: TCheckBox;
    bRTFResetItem: TSpeedButton;
    bRTFResetAll: TSpeedButton;
    sdRTFStyle: TSaveDialog;
    odRTFStyle: TOpenDialog;
    tshXLSExtensions: TTabSheet;
    paXLSExtensionsLeft: TPanel;
    tbXLSExtension: TToolBar;
    tbtAddXLSExtension: TToolButton;
    tbtDelXLSExtension: TToolButton;
    tvXLSExtensions: TTreeView;
    paXLSExtensionsClient: TPanel;
    pcXLSExtensions: TPageControl;
    tshXLSHyperlinks: TTabSheet;
    tshXLSNotes: TTabSheet;
    tshXLSCharts: TTabSheet;
    laXLSHyperlinkRow: TLabel;
    edXLSHyperlinkRow: TEdit;
    laXLSHyperlinkCol: TLabel;
    edXLSHyperlinkCol: TEdit;
    rgXLSHyperlinkStyle: TRadioGroup;
    laXLSHyperlinkTitle: TLabel;
    edXLSHyperlinkTitle: TEdit;
    laXLSHyperlinkTarget: TLabel;
    edXLSHyperlinkTarget: TEdit;
    bvXLSHyperlinks: TBevel;
    pcXLSNotes: TPageControl;
    tshXLSNoteBase: TTabSheet;
    bvXLSNoteBase: TBevel;
    tshXLSNoteFont: TTabSheet;
    laXLSNoteRow: TLabel;
    laXLSNoteCol: TLabel;
    laXLSNoteLines: TLabel;
    edXLSNoteRow: TEdit;
    edXLSNoteCol: TEdit;
    mmXLSNoteLines: TMemo;
    bvXLSNoteFont: TBevel;
    laXLSNoteFont: TLabel;
    cbXLSNoteFont: TComboBox;
    laXLSNoteFontSize: TLabel;
    cbXLSNoteFontSize: TComboBox;
    btnXLSNoteFontColor: TSpeedButton;
    pbXLSNoteFontColor: TPaintBox;
    bvXLSNoteFont2: TBevel;
    btnXLSNoteFontBold: TSpeedButton;
    btnXLSNoteFontItalic: TSpeedButton;
    btnXLSNoteFontStrikeOut: TSpeedButton;
    bvXLSNoteFont1: TBevel;
    bvXLSNoteFont3: TBevel;
    btnXLSNoteUnderlineSingle: TSpeedButton;
    btnXLSNoteUnderlineSingleAccounting: TSpeedButton;
    btnXLSNoteUnderlineDouble: TSpeedButton;
    btnXLSNoteUnderlineDoubleAccounting: TSpeedButton;
    btnXLSNoteHorizontalLeft: TSpeedButton;
    btnXLSNoteHorizontalCenter: TSpeedButton;
    btnXLSNoteHorizontalRight: TSpeedButton;
    btnXLSNoteHorizontalFill: TSpeedButton;
    btnXLSNoteVerticalTop: TSpeedButton;
    bvXLSNoteFont5: TBevel;
    btnXLSNoteVerticalCenter: TSpeedButton;
    btnXLSNoteVerticalBottom: TSpeedButton;
    bvXLSNoteFont4: TBevel;
    tshXLSNoteFill: TTabSheet;
    btnXLSNoteBackgroundColor: TSpeedButton;
    pbXLSNoteBackgroundColor: TPaintBox;
    btnXLSNoteForegroundColor: TSpeedButton;
    pbXLSNoteForegroundColor: TPaintBox;
    gbXLSNoteFillType: TGroupBox;
    rbXLSNoteFillSolid: TRadioButton;
    rbXLSNoteFillGradient: TRadioButton;
    paXLSNoteFillGradient: TPanel;
    rbXLSNoteGradientHorizontal: TRadioButton;
    rbXLSNoteGradientVertical: TRadioButton;
    bvXLSNoteFill: TBevel;
    rgXLSNoteOrientation: TRadioGroup;
    rbXLSNoteGradientDiagonalUp: TRadioButton;
    rbXLSNoteGradientDiagonalDown: TRadioButton;
    rbXLSNoteGradientFromCorner: TRadioButton;
    rbXLSNoteGradientFromCenter: TRadioButton;
    trXLSNoteTransparency: TTrackBar;
    laXLSNoteTransparency: TLabel;
    laXLSNoteTransparencyStart: TLabel;
    laXLSNoteTransparencyFinish: TLabel;
    bvXLSNoteFillColors: TBevel;
    tshXLSSeries: TTabSheet;
    bvXLSSeries: TBevel;
    laXLSSeriesTitle: TLabel;
    edXLSSeriesTitle: TEdit;
    gbXLSSeriesDataRange: TGroupBox;
    laXLSSeriesDataRangeCol1: TLabel;
    edXLSSeriesDataRangeCol1: TEdit;
    laXLSSeriesDataRangeRow1: TLabel;
    edXLSSeriesDataRangeRow1: TEdit;
    laXLSSeriesDataRangeCol2: TLabel;
    edXLSSeriesDataRangeCol2: TEdit;
    laXLSSeriesDataRangeRow2: TLabel;
    edXLSSeriesDataRangeRow2: TEdit;
    btnXLSSeriesColor: TSpeedButton;
    pbXLSSeriesColor: TPaintBox;
    rbXLSSeriesColumn: TRadioButton;
    cbXLSSeriesColumn: TComboBox;
    rbXLSSeriesCustom: TRadioButton;
    pcXLSCharts: TPageControl;
    tshXLSChartBase: TTabSheet;
    tshXLSChartCategoryLabels: TTabSheet;
    laXLSChartTitle: TLabel;
    edXLSChartTitle: TEdit;
    laXLSChartStyle: TLabel;
    cbXLSChartStyle: TComboBox;
    rgXLSChartLegendPosition: TRadioGroup;
    chXLSChartShowLegend: TCheckBox;
    chXLSChartAutoColor: TCheckBox;
    bvXLSChartBase: TBevel;
    bvXLSChartCategoryLabels: TBevel;
    laXLSChartCategoryLabelsCol1: TLabel;
    edXLSChartCategoryLabelsCol1: TEdit;
    laXLSChartCategoryLabelsRow1: TLabel;
    edXLSChartCategoryLabelsRow1: TEdit;
    laXLSChartCategoryLabelsCol2: TLabel;
    edXLSChartCategoryLabelsCol2: TEdit;
    laXLSChartCategoryLabelsRow2: TLabel;
    edXLSChartCategoryLabelsRow2: TEdit;
    rbXLSChartCategoryLabelColumn: TRadioButton;
    rbXLSChartCategoryLabelCustom: TRadioButton;
    cbXLSChartCategoryLabelColumn: TComboBox;
    tshXLSChartPosition: TTabSheet;
    bvXLSChartPosition: TBevel;
    gbXLSChartCustomPosition: TGroupBox;
    laXLSChartPositionX1: TLabel;
    laXLSChartPositionX2: TLabel;
    laXLSChartPositionY1: TLabel;
    laXLSChartPositionY2: TLabel;
    edXLSChartPositionX1: TEdit;
    edXLSChartPositionX2: TEdit;
    edXLSChartPositionY1: TEdit;
    edXLSChartPositionY2: TEdit;
    rbXLSChartAutoPosition: TRadioButton;
    rgXLSChartPlacement: TRadioGroup;
    gbXLSChartAutoPosition: TGroupBox;
    laXLSChartLeft: TLabel;
    laXLSChartHeight: TLabel;
    laXLSChartTop: TLabel;
    laXLSChartWidth: TLabel;
    edXLSChartLeft: TEdit;
    edXLSChartHeight: TEdit;
    edXLSChartTop: TEdit;
    edXLSChartWidth: TEdit;
    rbXLSChartCustomPosition: TRadioButton;
    tshXLSCells: TTabSheet;
    pcXLSCells: TPageControl;
    tshXLSCellBase: TTabSheet;
    laXLSCellCol: TLabel;
    laXLSCellRow: TLabel;
    bvXLSCellBase: TBevel;
    laXLSCellType: TLabel;
    laXLSCellDateTimeFormat: TLabel;
    laXLSCellNumericFormat: TLabel;
    laXLSCellValue: TLabel;
    edXLSCellCol: TEdit;
    edXLSCellRow: TEdit;
    cbXLSCellType: TComboBox;
    edXLSCellDateTimeFormat: TEdit;
    edXLSCellNumericFormat: TEdit;
    edXLSCellValue: TEdit;
    Bevel14: TBevel;
    tshXLSMergedCells: TTabSheet;
    bvXLSMergedCells: TBevel;
    laXLSMergedCellsFirstCol: TLabel;
    laXLSMergedCellsFirstRow: TLabel;
    laXLSMergedCellsLastCol: TLabel;
    laXLSMergedCellsLastRow: TLabel;
    edXLSMergedCellsFirstCol: TEdit;
    edXLSMergedCellsFirstRow: TEdit;
    edXLSMergedCellsLastCol: TEdit;
    edXLSMergedCellsLastRow: TEdit;
    laXLSHyperlinkScreenTip: TLabel;
    edXLSHyperlinkScreenTip: TEdit;
    laXLSPageBackground: TLabel;
    edXLSPageBackground: TEdit;
    bvXLSPageBackground: TBevel;
    bXLSPageBackground: TSpeedButton;
    bvXLSAdvanced: TBevel;
    paXLSSampleCell: TPanel;
    pbXLSCell: TPaintBox;
    laXLSSampleCell: TLabel;
    ClipExp: TQExport3Clipboard;
    HTMLExp: TQExport3HTML;
    LaTeXExp: TQExport3LaTeX;
    ASCIIExp: TQExport3ASCII;
    XLSExp: TQExport3XLS;
    PDFExp: TQExport3PDF;
    SQLExp: TQExport3SQL;
    XMLExp: TQExport3XML;
    DBFExp: TQExport3DBF;
    RTFExp: TQExport3RTF;
    procedure edFileNameChange(Sender: TObject);
    procedure bBrowseClick(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure FormDestroy(Sender: TObject);
    procedure rgExportTypeClick(Sender: TObject);
    procedure chShowFileClick(Sender: TObject);
    procedure bAddOneExportedFieldClick(Sender: TObject);
    procedure bAddAllExportedFieldClick(Sender: TObject);
    procedure bDelOneExportedFieldClick(Sender: TObject);
    procedure bDelAllExportedFieldClick(Sender: TObject);
    procedure cbxFormatFieldsChange(Sender: TObject);
    procedure bAddUserFormatClick(Sender: TObject);
    procedure PagesChange(Sender: TObject);
    procedure bEditUserFormatClick(Sender: TObject);
    procedure bDeleteUserFormatClick(Sender: TObject);
    procedure bClearUserFormatsClick(Sender: TObject);
    procedure sgrCaptionsDrawCell(Sender: TObject; ACol, ARow: Integer;
      Rect: TRect; State: TGridDrawState);
    procedure paHTMLColumnHead_1Click(Sender: TObject);
    procedure paHTMLOddRowCol_1Click(Sender: TObject);
    procedure paHTMLEvenRowCol_1Click(Sender: TObject);
    procedure laHTMLData_1Click(Sender: TObject);
    procedure bHTMLSaveTemplateClick(Sender: TObject);
    procedure bHTMLLoadTemplateClick(Sender: TObject);
    procedure cbxHTMLTemplateChange(Sender: TObject);
    procedure paHTMLBackgroundClick(Sender: TObject);
    procedure cbxXLSFontChange(Sender: TObject);
    procedure cbxXLSFontSizeChange(Sender: TObject);
    procedure pbFontColorPaint(Sender: TObject);
    procedure pbBorderTopPaint(Sender: TObject);
    procedure pbBorderBottomPaint(Sender: TObject);
    procedure pbBorderLeftPaint(Sender: TObject);
    procedure pbBorderRightPaint(Sender: TObject);
    procedure pbFillBackgroundPaint(Sender: TObject);
    procedure pbFillForegroundPaint(Sender: TObject);
    procedure btnFontColorClick(Sender: TObject);
    procedure btnBorderTopColorClick(Sender: TObject);
    procedure btnBorderBottomColorClick(Sender: TObject);
    procedure btnBorderLeftColorClick(Sender: TObject);
    procedure btnBorderRightColorClick(Sender: TObject);
    procedure btnFillBackgroundClick(Sender: TObject);
    procedure btnFillForegroundClick(Sender: TObject);
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
    procedure cmbBorderTopChange(Sender: TObject);
    procedure cmbBorderBottomChange(Sender: TObject);
    procedure cmbBorderLeftChange(Sender: TObject);
    procedure cmbBorderRightChange(Sender: TObject);
    procedure cmbBorderTopDrawItem(Control: TWinControl; Index: Integer;
      Rect: TRect; State: TOwnerDrawState);
    procedure cmbBorderBottomDrawItem(Control: TWinControl; Index: Integer;
      Rect: TRect; State: TOwnerDrawState);
    procedure cmbBorderLeftDrawItem(Control: TWinControl; Index: Integer;
      Rect: TRect; State: TOwnerDrawState);
    procedure cmbBorderRightDrawItem(Control: TWinControl; Index: Integer;
      Rect: TRect; State: TOwnerDrawState);
    procedure cmbPatternDrawItem(Control: TWinControl; Index: Integer;
      Rect: TRect; State: TOwnerDrawState);
    procedure cmbPatternChange(Sender: TObject);
    procedure bStartClick(Sender: TObject);
    procedure OnBeginExport(Sender: TObject);
    procedure OnEndExport(Sender: TObject);
    procedure OnBeforeExportRow(Sender: TObject; Row: TQExportRow;
      var Accept: Boolean);
    procedure OnExportedRecord(Sender: TObject; RecNo: Integer);
    procedure chPrintFileClick(Sender: TObject);
    procedure FieldsListDragOver(Sender, Source: TObject; X,
      Y: Integer; State: TDragState; var Accept: Boolean);
    procedure rgXLSFunctionClick(Sender: TObject);
    procedure btnXLSResetItemClick(Sender: TObject);
    procedure btnXLSResetAllClick(Sender: TObject);
    procedure btnFontColorMouseDown(Sender: TObject; Button: TMouseButton;
      Shift: TShiftState; X, Y: Integer);
    procedure btnFontColorMouseUp(Sender: TObject; Button: TMouseButton;
      Shift: TShiftState; X, Y: Integer);
    procedure btnBorderTopColorMouseDown(Sender: TObject;
      Button: TMouseButton; Shift: TShiftState; X, Y: Integer);
    procedure btnBorderTopColorMouseUp(Sender: TObject;
      Button: TMouseButton; Shift: TShiftState; X, Y: Integer);
    procedure btnBorderBottomColorMouseDown(Sender: TObject;
      Button: TMouseButton; Shift: TShiftState; X, Y: Integer);
    procedure btnBorderBottomColorMouseUp(Sender: TObject;
      Button: TMouseButton; Shift: TShiftState; X, Y: Integer);
    procedure btnBorderLeftColorMouseDown(Sender: TObject;
      Button: TMouseButton; Shift: TShiftState; X, Y: Integer);
    procedure btnBorderLeftColorMouseUp(Sender: TObject;
      Button: TMouseButton; Shift: TShiftState; X, Y: Integer);
    procedure btnBorderRightColorMouseDown(Sender: TObject;
      Button: TMouseButton; Shift: TShiftState; X, Y: Integer);
    procedure btnBorderRightColorMouseUp(Sender: TObject;
      Button: TMouseButton; Shift: TShiftState; X, Y: Integer);
    procedure btnFillBackgroundMouseDown(Sender: TObject;
      Button: TMouseButton; Shift: TShiftState; X, Y: Integer);
    procedure btnFillBackgroundMouseUp(Sender: TObject;
      Button: TMouseButton; Shift: TShiftState; X, Y: Integer);
    procedure btnFillForegroundMouseDown(Sender: TObject;
      Button: TMouseButton; Shift: TShiftState; X, Y: Integer);
    procedure btnFillForegroundMouseUp(Sender: TObject;
      Button: TMouseButton; Shift: TShiftState; X, Y: Integer);
    procedure pbXLSCellPaint(Sender: TObject);
    procedure lstAvailableFieldsDragDrop(Sender, Source: TObject; X,
      Y: Integer);
    procedure lstExportedFieldsDragDrop(Sender, Source: TObject; X,
      Y: Integer);
    procedure laHTMLHead_1Click(Sender: TObject);
    procedure edIntegerFormatChange(Sender: TObject);
    procedure edFloatFormatChange(Sender: TObject);
    procedure edDateFormatChange(Sender: TObject);
    procedure edTimeFormatChange(Sender: TObject);
    procedure edDateTimeFormatChange(Sender: TObject);
    procedure edCurrencyFormatChange(Sender: TObject);
    procedure edXLSPageHeaderChange(Sender: TObject);
    procedure edXLSPageFooterChange(Sender: TObject);
    procedure chXLSAutoCalcColWidthClick(Sender: TObject);
    procedure edHTMLTitleChange(Sender: TObject);
    procedure edHTMLCSSFileNameChange(Sender: TObject);
    procedure btnHTMLCSSFileNameClick(Sender: TObject);
    procedure chHTMLOverwriteCSSFileClick(Sender: TObject);
    procedure edHTMLFileRecCountChange(Sender: TObject);
    procedure chHTMLGenerateIndexClick(Sender: TObject);
    procedure cbxHTMLFontNameChange(Sender: TObject);
    procedure edHTMLBackgroundChange(Sender: TObject);
    procedure btnHTMLBackgroundClick(Sender: TObject);
    procedure edHTMLBodyAdvancedChange(Sender: TObject);
    procedure edHTMLCellPaddingChange(Sender: TObject);
    procedure edHTMLCellSpacingChange(Sender: TObject);
    procedure edHTMLBorderWidthChange(Sender: TObject);
    procedure edHTMLTableBackgroundChange(Sender: TObject);
    procedure btnHTMLTableBackgroundClick(Sender: TObject);
    procedure edHTMLTableAdvancedChange(Sender: TObject);
    procedure laHTMLFontClick(Sender: TObject);
    procedure laHTMLLinkClick(Sender: TObject);
    procedure laHTMLVLinkClick(Sender: TObject);
    procedure laHTMLALinkClick(Sender: TObject);
    procedure chXMLStandaloneClick(Sender: TObject);
    procedure edXMLEncodingChange(Sender: TObject);
    procedure edSQLTableNameChange(Sender: TObject);
    procedure chSQLCreateTableClick(Sender: TObject);
    procedure edSQLCommitRecCountChange(Sender: TObject);
    procedure chSQLCommitAfterScriptClick(Sender: TObject);
    procedure edSQLCommitStatementChange(Sender: TObject);
    procedure edSQLNullStringChange(Sender: TObject);
    procedure edSQLStatementTermChange(Sender: TObject);
    procedure edBooleanTrueChange(Sender: TObject);
    procedure edBooleanFalseChange(Sender: TObject);
    procedure OnStopExport(Sender: TObject; var CanContinue: Boolean);
    procedure OnFetchedRecord(Sender: TObject; RecNo: Integer);
    procedure chGoToFirstRecordClick(Sender: TObject);
    procedure edExportRecCountChange(Sender: TObject);
    procedure edSkipRecCountChange(Sender: TObject);
    procedure chAllowCaptionsClick(Sender: TObject);
    procedure OnSkippedRecord(Sender: TObject; RecNo: Integer);
    procedure OnGetExportText(Sender: TObject; ColNo: Integer;
      var Text: WideString);
    procedure sgrCaptionsGetEditText(Sender: TObject; ACol, ARow: Integer;
      var Value: String);
    procedure cbxColumnAlignExit(Sender: TObject);
    procedure edColumnWidthExit(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure edXLSSheetTitleChange(Sender: TObject);
    procedure edNullStringChange(Sender: TObject);
    procedure rbInternalClick(Sender: TObject);
    procedure rbExternalClick(Sender: TObject);
    procedure chHTMLUseMultiFileExportClick(Sender: TObject);
    procedure rbExportOnlyClick(Sender: TObject);
    procedure rbExportAllRecordsClick(Sender: TObject);
    procedure chTXTAutoCalcColWidthClick(Sender: TObject);
    procedure edTXTSpacingChange(Sender: TObject);
    procedure NumberKeyPress(Sender: TObject; var Key: Char);
    procedure chCSVQuoteStringsClick(Sender: TObject);
    procedure edCSVCommaExit(Sender: TObject);
    procedure rgRTFPageOrientationClick(Sender: TObject);
    procedure lstXLSFieldsDeletion(Sender: TObject; Item: TListItem);
    procedure lstXLSFieldsChange(Sender: TObject; Item: TListItem;
      Change: TItemChange);
    procedure pcXLSFormatsChange(Sender: TObject);
    procedure tbtAddXLSStyleClick(Sender: TObject);
    procedure tbtDelXLSStyleClick(Sender: TObject);
    procedure tbtUpXLSStyleClick(Sender: TObject);
    procedure tbtDownXLSStyleClick(Sender: TObject);
    procedure rgXLSStripTypeClick(Sender: TObject);
    procedure tbtSaveXLSStyleClick(Sender: TObject);
    procedure tbtLoadXLSStyleClick(Sender: TObject);
    procedure chCurrentRecordOnlyClick(Sender: TObject);
    procedure XLSExpBeforeExportRow(Sender: TObject; Sheet: Integer;
      Row: TQExportRow; var Accept: Boolean);
    procedure XLSExpExportedRecord(Sender: TObject; Sheet, RecNo: Integer);
    procedure XLSExpAdvancedGetExportText(Sender: TObject; Sheet,
      ColNo: Integer; var Text: WideString);
    procedure edCSVQuoteExit(Sender: TObject);
    procedure chExportEmptyClick(Sender: TObject);
    procedure edCaptionRowExit(Sender: TObject);
    procedure edCaptionRowKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure edHTMLIndexLinkTemplateChange(Sender: TObject);
    procedure chHTMLNavigationOnTopClick(Sender: TObject);
    procedure chHTMLNavigationOnBottomClick(Sender: TObject);
    procedure edHTMLIndexLinkTitleChange(Sender: TObject);
    procedure edHTMLFirstLinkTitleChange(Sender: TObject);
    procedure edHTMLPriorLinkTitleChange(Sender: TObject);
    procedure edHTMLNextLinkTitleChange(Sender: TObject);
    procedure edHTMLLastLinkTitleChange(Sender: TObject);
    procedure lvPDFFontsChange(Sender: TObject; Item: TListItem;
      Change: TItemChange);
    procedure cbPDFFontNameChange(Sender: TObject);
    procedure cbPDFFontEncodingChange(Sender: TObject);
    procedure edPDFFontSizeChange(Sender: TObject);
    procedure sbPDFFontColorClick(Sender: TObject);
    procedure edPDFColSpacingChange(Sender: TObject);
    procedure edPDFRowSpacingChange(Sender: TObject);
    procedure edPDFGridLineWidthChange(Sender: TObject);
    procedure cbPDFPageFormatChange(Sender: TObject);
    procedure edPDFPageWidthExit(Sender: TObject);
    procedure edPDFPageHeightExit(Sender: TObject);
    procedure cbPDFPageUnitsChange(Sender: TObject);
    procedure cbPDFPageOrientationChange(Sender: TObject);
    procedure edPDFPageMarginLeftExit(Sender: TObject);
    procedure edPDFPageMarginRightExit(Sender: TObject);
    procedure edPDFPageMarginTopExit(Sender: TObject);
    procedure edPDFPageMarginBottomExit(Sender: TObject);
    procedure bToolsClick(Sender: TObject);
    procedure miSaveOptionsClick(Sender: TObject);
    procedure miLoadOptionsClick(Sender: TObject);
    procedure lstRTFBaseStylesChange(Sender: TObject; Item: TListItem;
      Change: TItemChange);
    procedure lstRTFBaseStylesDeletion(Sender: TObject; Item: TListItem);
    procedure pcRTFStylesChange(Sender: TObject);
    procedure cbRTFFontChange(Sender: TObject);
    procedure cbRTFFontSizeChange(Sender: TObject);
    procedure bRTFFontColorMouseDown(Sender: TObject; Button: TMouseButton;
      Shift: TShiftState; X, Y: Integer);
    procedure bRTFFontColorMouseUp(Sender: TObject; Button: TMouseButton;
      Shift: TShiftState; X, Y: Integer);
    procedure bRTFFontColorClick(Sender: TObject);
    procedure bRTFFontBoldClick(Sender: TObject);
    procedure bRTFFontItalicClick(Sender: TObject);
    procedure bRTFFontStrikeOutClick(Sender: TObject);
    procedure bRTFFontUnderlineClick(Sender: TObject);
    procedure pbRTFFontColorPaint(Sender: TObject);
    procedure bRTFBackgroundColorMouseDown(Sender: TObject;
      Button: TMouseButton; Shift: TShiftState; X, Y: Integer);
    procedure bRTFBackgroundColorMouseUp(Sender: TObject;
      Button: TMouseButton; Shift: TShiftState; X, Y: Integer);
    procedure bRTFBackgroundColorClick(Sender: TObject);
    procedure pbRTFBackgroundColorPaint(Sender: TObject);
    procedure bRTFHighlightColorMouseDown(Sender: TObject;
      Button: TMouseButton; Shift: TShiftState; X, Y: Integer);
    procedure bRTFHighlightColorMouseUp(Sender: TObject;
      Button: TMouseButton; Shift: TShiftState; X, Y: Integer);
    procedure bRTFHighlightColorClick(Sender: TObject);
    procedure pbRTFHighlightColorPaint(Sender: TObject);
    procedure chRTFAllowHighlightClick(Sender: TObject);
    procedure chRTFAllowBackgroundClick(Sender: TObject);
    procedure rgRTFStripTypeClick(Sender: TObject);
    procedure bRTFResetItemClick(Sender: TObject);
    procedure bRTFResetAllClick(Sender: TObject);
    procedure tbtAddRTFStyleClick(Sender: TObject);
    procedure tbtDelRTFStyleClick(Sender: TObject);
    procedure tbtMoveRTFStyleUpClick(Sender: TObject);
    procedure tbtMoveRTFStyleDownClick(Sender: TObject);
    procedure tbtLoadRTFStyleClick(Sender: TObject);
    procedure tbtSaveRTFStyleClick(Sender: TObject);
    procedure bRTFFontLeftClick(Sender: TObject);
    procedure bRTFFontCenterClick(Sender: TObject);
    procedure bRTFFontRightClick(Sender: TObject);
    procedure bRTFFontFillClick(Sender: TObject);
    procedure pbRTFSamplePaint(Sender: TObject);
    procedure tvXLSExtensionsChange(Sender: TObject; Node: TTreeNode);
    procedure rgXLSHyperlinkStyleClick(Sender: TObject);
    procedure edXLSHyperlinkTitleChange(Sender: TObject);
    procedure edXLSHyperlinkTargetChange(Sender: TObject);
    procedure edXLSHyperlinkScreenTipChange(Sender: TObject);
    procedure tbtAddXLSExtensionClick(Sender: TObject);
    procedure tbtDelXLSExtensionClick(Sender: TObject);
    procedure mmXLSNoteLinesChange(Sender: TObject);
    procedure edXLSHyperlinkColExit(Sender: TObject);
    procedure edXLSHyperlinkRowExit(Sender: TObject);
    procedure edXLSNoteColExit(Sender: TObject);
    procedure edXLSNoteRowExit(Sender: TObject);
    procedure cbXLSNoteFontChange(Sender: TObject);
    procedure cbXLSNoteFontSizeExit(Sender: TObject);
    procedure btnXLSNoteFontColorMouseDown(Sender: TObject;
      Button: TMouseButton; Shift: TShiftState; X, Y: Integer);
    procedure btnXLSNoteFontColorMouseUp(Sender: TObject;
      Button: TMouseButton; Shift: TShiftState; X, Y: Integer);
    procedure btnXLSNoteFontColorClick(Sender: TObject);
    procedure pbXLSNoteFontColorPaint(Sender: TObject);
    procedure btnXLSNoteFontBoldClick(Sender: TObject);
    procedure btnXLSNoteFontItalicClick(Sender: TObject);
    procedure btnXLSNoteFontStrikeOutClick(Sender: TObject);
    procedure btnXLSNoteUnderlineSingleClick(Sender: TObject);
    procedure btnXLSNoteUnderlineSingleAccountingClick(Sender: TObject);
    procedure btnXLSNoteUnderlineDoubleClick(Sender: TObject);
    procedure btnXLSNoteUnderlineDoubleAccountingClick(Sender: TObject);
    procedure btnXLSNoteHorizontalLeftClick(Sender: TObject);
    procedure btnXLSNoteHorizontalCenterClick(Sender: TObject);
    procedure btnXLSNoteHorizontalRightClick(Sender: TObject);
    procedure btnXLSNoteHorizontalFillClick(Sender: TObject);
    procedure btnXLSNoteVerticalTopClick(Sender: TObject);
    procedure btnXLSNoteVerticalCenterClick(Sender: TObject);
    procedure btnXLSNoteVerticalBottomClick(Sender: TObject);
    procedure rgXLSNoteOrientationClick(Sender: TObject);
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
    procedure trXLSNoteTransparencyChange(Sender: TObject);
    procedure edXLSChartTitleChange(Sender: TObject);
    procedure cbXLSChartStyleChange(Sender: TObject);
    procedure edXLSChartPositionX1Exit(Sender: TObject);
    procedure edXLSChartPositionY1Exit(Sender: TObject);
    procedure edXLSChartPositionX2Exit(Sender: TObject);
    procedure edXLSChartPositionY2Exit(Sender: TObject);
    procedure edXLSChartCategoryLabelsCol1Exit(Sender: TObject);
    procedure edXLSChartCategoryLabelsRow1Exit(Sender: TObject);
    procedure edXLSChartCategoryLabelsCol2Exit(Sender: TObject);
    procedure edXLSChartCategoryLabelsRow2Exit(Sender: TObject);
    procedure rgXLSChartLegendPositionClick(Sender: TObject);
    procedure chXLSChartShowLegendClick(Sender: TObject);
    procedure chXLSChartAutoColorClick(Sender: TObject);
    procedure edXLSSeriesTitleChange(Sender: TObject);
    procedure edXLSSeriesDataRangeCol1Exit(Sender: TObject);
    procedure edXLSSeriesDataRangeRow1Exit(Sender: TObject);
    procedure edXLSSeriesDataRangeCol2Exit(Sender: TObject);
    procedure edXLSSeriesDataRangeRow2Exit(Sender: TObject);
    procedure btnXLSSeriesColorMouseDown(Sender: TObject;
      Button: TMouseButton; Shift: TShiftState; X, Y: Integer);
    procedure btnXLSSeriesColorMouseUp(Sender: TObject;
      Button: TMouseButton; Shift: TShiftState; X, Y: Integer);
    procedure btnXLSSeriesColorClick(Sender: TObject);
    procedure pbXLSSeriesColorPaint(Sender: TObject);
    procedure rbXLSChartCategoryLabelColumnClick(Sender: TObject);
    procedure rbXLSChartCategoryLabelCustomClick(Sender: TObject);
    procedure cbXLSChartCategoryLabelColumnChange(Sender: TObject);
    procedure rbXLSSeriesColumnClick(Sender: TObject);
    procedure rbXLSSeriesCustomClick(Sender: TObject);
    procedure cbXLSSeriesColumnChange(Sender: TObject);
    procedure rbXLSChartAutoPositionClick(Sender: TObject);
    procedure rgXLSChartPlacementClick(Sender: TObject);
    procedure edXLSChartLeftExit(Sender: TObject);
    procedure edXLSChartTopExit(Sender: TObject);
    procedure edXLSChartHeightExit(Sender: TObject);
    procedure edXLSChartWidthExit(Sender: TObject);
    procedure rbXLSChartCustomPositionClick(Sender: TObject);
    procedure edXLSCellColExit(Sender: TObject);
    procedure edXLSCellRowExit(Sender: TObject);
    procedure edXLSCellColKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure edXLSCellRowKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure cbXLSCellTypeChange(Sender: TObject);
    procedure edXLSCellValueChange(Sender: TObject);
    procedure edXLSCellDateTimeFormatChange(Sender: TObject);
    procedure edXLSCellNumericFormatChange(Sender: TObject);
    procedure edXLSMergedCellsFirstColExit(Sender: TObject);
    procedure edXLSMergedCellsFirstRowExit(Sender: TObject);
    procedure edXLSMergedCellsLastColExit(Sender: TObject);
    procedure edXLSMergedCellsLastRowExit(Sender: TObject);
    procedure bXLSPageBackgroundClick(Sender: TObject);
    procedure edXLSPageBackgroundChange(Sender: TObject);
    procedure pcXLSChange(Sender: TObject);
    procedure pcXLSCellsChange(Sender: TObject);
  private
    
    FQuickExport: TQExport3;
    FProgress: TfmQExport3Progress;

    FFileName: string;
    FShowFile: boolean;
    FPrintFile: boolean;
    FOptionsFileName: string;
    FGoToFirstRecord: boolean;
    FCurrentRecordOnly: boolean;
    FExportEmpty: boolean;
    FExportRecCount: integer;
    FSkipRecCount: integer;
    
    FAllowCaptions: boolean;
    FCaptionRow: integer;

    FIntegerFmt: string;
    FFloatFmt: string;
    FDateFmt: string;
    FTimeFmt: string;
    FDateTimeFmt: string;
    FCurrencyFmt: string;
    FBooleanTrue: string;
    FBooleanFalse: string;
    FNullString: string;

    FRTFPageOrientation: TQExportPageOrientation;
    FRTFStripType: TrtfStripType;

    FXLSPageHeader: string;
    FXLSPageFooter: string;
    FXLSSheetTitle: string;
    FXLSStripType: TxlsStripType;
    FXLSAutoCalcColWidth: boolean;
    FXLSPageBackground: string;

    FXLSDataFormatPageIndex: integer;
    FXLSCellsPageIndex: integer;

    FHTMLTitle: string;
    FHTMLUsingCSS: TUsingCSS;
    FHTMLCSSFileName: string;
    FHTMLOverwriteCSSFile: boolean;

    FHTMLUseMultiFileExport: boolean;
    FHTMLFileRecCount: integer;
    FHTMLGenerateIndex: boolean;

    FHTMLIndexLinkTemplate: string;
    FHTMLNavigationOnTop: boolean;
    FHTMLNavigationOnBottom: boolean;
    FHTMLIndexLinkTitle: string;
    FHTMLFirstLinkTitle: string;
    FHTMLPriorLinkTitle: string;
    FHTMLNextLinkTitle: string;
    FHTMLLastLinkTitle: string;

    FHTMLFontName: string;
    FHTMLBackground: string;
    FHTMLBodyAdvanced: string;
    FHTMLCellPadding: integer;
    FHTMLCellSpacing: integer;
    FHTMLBorderWidth: integer;
    FHTMLTableBackground: string;
    FHTMLTableAdvanced: string;
    FHTMLBackgroundColor: TColor;
    FHTMLFontColor: TColor;
    FHTMLHeadBackgroundColor: TColor;
    FHTMLHeadFontColor: TColor;
    FHTMLOddRowBackgroundColor: TColor;
    FHTMLEvenRowBackgroundColor: TColor;
    FHTMLDataFontColor: TColor;
    FHTMLLinkColor: TColor;
    FHTMLVLinkColor: TColor;
    FHTMLALinkColor: TColor;

    FXMLStandalone: boolean;
    FXMLEncoding: string;

    FSQLTableName: string;
    FSQLCreateTable: boolean;
    FSQLCommitRecCount: integer;
    FSQLCommitAfterScript: boolean;
    FSQLCommitStatement: string;
    FSQLStatementTerm: string;

    FTXTAutoCalcColWidth: boolean;
    FTXTSpacing: integer;
    FCSVQuoteStrings: boolean;
    FCSVComma: char;
    FCSVQuote: char;

    FPDFColSpacing: double;
    FPDFRowSpacing: double;
    FPDFGridLineWidth: integer;

    FPDFPageFormat: TQExportPageFormat;
    FPDFPageWidth: integer;
    FPDFPageHeight: integer;
    FPDFPageUnits: TQExportUnits;
    FPDFPageOrientation: TQExportPageOrientation;
    FPDFPageMarginLeft: integer;
    FPDFPageMarginRight: integer;
    FPDFPageMarginTop: integer;
    FPDFPageMarginBottom: integer;

    FXLSListItem: TListItem;
    FXLSHyperlinkNode: TTreeNode;
    FXLSNoteNode: TTreeNode;
    FXLSChartNode: TTreeNode;
    FXLSCellNode: TTreeNode;
    FXLSMergedCellNode: TTreeNode;
    FRTFListItem: TListItem;
    FPDFFontItem: TListItem;

    function GetDialog: TQExport3Dialog;

    function GetDataSet: TDataSet;
    function GetCustomSource: TqeCustomSource;
    function GetListView: TListView;
    function GetDBGrid: TDBGrid;
    function GetStringGrid: TStringGrid;

    function GetAutoChangeFileExt: boolean;
    function GetSaveLoadButtons: boolean;
    function GetCommonOptions: TCommonOptions;
    function GetConfirmAbort: boolean;
    function GetAutoSaveOptions: boolean;
    function GetAutoLoadOptions: boolean;
    function GetExportSource: TQExportSource;

    procedure SetFileName(const Value: string);
    procedure SetShowFile(const Value: boolean);
    procedure SetPrintFile(const Value: boolean);
    function GetExportType: TAllowedExport;
    procedure SetExportType(const Value: TAllowedExport);

   

    procedure SetOptionsFileName(const Value: string);
    procedure SetGoToFirstRecord(const Value: boolean);
    procedure SetCurrentRecordOnly(const Value: boolean);
    procedure SetExportEmpty(const Value: boolean);
    procedure SetExportRecCount(const Value: integer);
    procedure SetSkipRecCount(const Value: integer);

    procedure SetAllowCaptions(const Value: boolean);
    procedure SetCaptionRow(const Value: integer);

    procedure SetIntegerFmt(const Value: string);
    procedure SetFloatFmt(const Value: string);
    procedure SetDateFmt(const Value: string);
    procedure SetTimeFmt(const Value: string);
    procedure SetDateTimeFmt(const Value: string);
    procedure SetCurrencyFmt(const Value: string);
    procedure SetBooleanTrue(const Value: string);
    procedure SetBooleanFalse(const Value: string);
    procedure SetNullString(const Value: string);

    procedure SetRTFPageOrientation(const Value: TQExportPageOrientation);
    procedure SetRTFStripType(const Value: TrtfStripType);

    procedure SetXLSPageHeader(const Value: string);
    procedure SetXLSPageFooter(const Value: string);
    procedure SetXLSSheetTitle(const Value: string);
    procedure SetXLSStripType(const Value: TxlsStripType);
    procedure SetXLSAutoCalcColWidth(Value: boolean);
    procedure SetXLSPageBackground(const Value: string);

    procedure SetHTMLTitle(const Value: string);
    procedure SetHTMLUsingCSS(const Value: TUsingCSS);
    procedure SetHTMLCSSFileName(const Value: string);
    procedure SetHTMLOverwriteCSSFile(const Value: boolean);

    procedure SetHTMLUseMultiFileExport(const Value: boolean);
    procedure SetHTMLFileRecCount(const Value: integer);
    procedure SetHTMLGenerateIndex(const Value: boolean);

    procedure SetHTMLIndexLinkTemplate(const Value: string);
    procedure SetHTMLNavigationOnTop(const Value: boolean);
    procedure SetHTMLNavigationOnBottom(const Value: boolean);
    procedure SetHTMLIndexLinkTitle(const Value: string);
    procedure SetHTMLFirstLinkTitle(const Value: string);
    procedure SetHTMLPriorLinkTitle(const Value: string);
    procedure SetHTMLNextLinkTitle(const Value: string);
    procedure SetHTMLLastLinkTitle(const Value: string);

    procedure SetHTMLFontName(const Value: string);
    procedure SetHTMLBackground(const Value: string);
    procedure SetHTMLBodyAdvanced(const Value: string);
    procedure SetHTMLCellPadding(const Value: integer);
    procedure SetHTMLCellSpacing(const Value: integer);
    procedure SetHTMLBorderWidth(const Value: integer);
    procedure SetHTMLTableBackground(const Value: string);
    procedure SetHTMLTableAdvanced(const Value: string);
    procedure SetHTMLBackgroundColor(const Value: TColor);
    procedure SetHTMLFontColor(const Value: TColor);
    procedure SetHTMLHeadBackgroundColor(const Value: TColor);
    procedure SetHTMLHeadFontColor(const Value: TColor);
    procedure SetHTMLOddRowBackgroundColor(const Value: TColor);
    procedure SetHTMLEvenRowBackgroundColor(const Value: TColor);
    procedure SetHTMLDataFontColor(const Value: TColor);
    procedure SetHTMLLinkColor(const Value: TColor);
    procedure SetHTMLVLinkColor(const Value: TColor);
    procedure SetHTMLALinkColor(const Value: TColor);

    procedure SetXMLEncoding(const Value: string);
    procedure SetXMLStandalone(const Value: boolean);

    procedure SetSQLTableName(const Value: string);
    procedure SetSQLCreateTable(const Value: boolean);
    procedure SetSQLCommitRecCount(const Value: integer);
    procedure SetSQLCommitAfterScript(const Value: boolean);
    procedure SetSQLCommitStatement(const Value: string);
    procedure SetSQLStatementTerm(const Value: string);

    procedure SetTXTAutoCalcColWidth(const Value: boolean);
    procedure SetTXTSpacing(const Value: integer);
    procedure SetCSVQuoteStrings(const Value: boolean);
    procedure SetCSVComma(const Value: char);
    procedure SetCSVQuote(const Value: char);

    procedure SetPDFColSpacing(const Value: double);
    procedure SetPDFRowSpacing(const Value: double);
    procedure SetPDFGridLineWidth(const Value: integer);

    function GetPDFPageSizeFormat: string;
    procedure SetPDFPageFormat(const Value: TQExportPageFormat);
    function GetPDFPageWidth: double;
    procedure SetPDFPageWidth(const Value: double);
    function GetPDFPageHeight: double;
    procedure SetPDFPageHeight(const Value: double);
    procedure SetPDFPageUnits(const Value: TQExportUnits);
    procedure SetPDFPageOrientation(const Value: TQExportPageOrientation);
    function GetPDFPageMarginLeft: double;
    procedure SetPDFPageMarginLeft(const Value: double);
    function GetPDFPageMarginRight: double;
    procedure SetPDFPageMarginRight(const Value: double);
    function GetPDFPageMarginTop: double;
    procedure SetPDFPageMarginTop(const Value: double);
    function GetPDFPageMarginBottom: double;
    procedure SetPDFPageMarginBottom(const Value: double);

    procedure InitializeDialog;
    procedure ShowTitle;
    procedure SaveExportOptions(const FileName: string);
    procedure LoadExportOptions(const FileName: string);

    function RunColorEditor(CurrColor: TColor): TColor;

    procedure FillExportTypeStringArray;
    procedure FillExportTypeFilterArray;

    procedure ChangeFileExtension;
    procedure FillAllowedExports;
    procedure ResetStandardFormats;
    procedure FillFields;
    procedure ShowButtons;
    procedure MakeStringGrid;
    procedure LoadStringGridCaption;
    function IsCompatiblePage: boolean;

    procedure HTMLFillColors;
    procedure HTMLUpdateMultifileControls;

    procedure ShowFormatButtons;

    function GetIndexOfNewAvailableFields(Item: TListItem): integer;

    procedure SetCustomTemplate;
    procedure SetCaptions;

    function CurrXLSListView: TListView;
    function CurrXLSFormat: TxlsFormat; 
    procedure CorrectXLSFieldsList;

    procedure ShowXLSListItem(Fmt: TxlsFormat);
    procedure ShowXLSListItemM;
    procedure ShowRTFListItem(Item: TListItem);
    procedure ShowRTFListItemM;

    function RTFCurrListView: TListView;
    procedure RTFResetAllItems;
    procedure RTFResetAllItems_A;
    procedure RTFUpdateItemSetDefault(Item: TListItem);
    procedure RTFShowStyleButtons;
    procedure RTFRenumStyles;
    procedure RTFSaveStyle(const FileName: string);
    procedure RTFLoadStyle(const FileName: string);

    procedure RTFUpdateItemFont(Item: TListItem);
    procedure RTFUpdateItemFontSize(Item: TListItem);
    procedure RTFUpdateItemFontColor(Item: TListItem);
    procedure RTFUpdateItemFontBold(Item: TListItem);
    procedure RTFUpdateItemFontItalic(Item: TListItem);
    procedure RTFUpdateItemFontStrikeOut(Item: TListItem);
    procedure RTFUpdateItemFontUnderline(Item: TListItem);
    procedure RTFUpdateItemBackgroundColor(Item: TListItem);
    procedure RTFUpdateItemHighlightColor(Item: TListItem);
    procedure RTFUpdateItemAllowBackground(Item: TListItem);
    procedure RTFUpdateItemAllowHighlight(Item: TListItem);
    procedure RTFUpdateItemAlignment(Item: TListItem);

    procedure XLSUpdateItemFont(Item: TListItem);
    procedure XLSUpdateItemFontSize(Item: TListItem);
    procedure XLSUpdateItemFontColor(Item: TListItem);
    procedure XLSUpdateItemFontBold(Item: TListItem);
    procedure XLSUpdateItemFontItalic(Item: TListItem);
    procedure XLSUpdateItemFontStrikeOut(Item: TListItem);
    procedure XLSUpdateItemFontUnderline(Item: TListItem);
    procedure XLSUpdateItemHorAlignment(Item: TListItem);
    procedure XLSUpdateItemVertAlignment(Item: TListItem);
    procedure XLSUpdateItemBorderTop(Item: TListItem);
    procedure XLSUpdateItemBorderTopColor(Item: TListItem);
    procedure XLSUpdateItemBorderBottom(Item: TListItem);
    procedure XLSUpdateItemBorderBottomColor(Item: TListItem);
    procedure XLSUpdateItemBorderLeft(Item: TListItem);
    procedure XLSUpdateItemBorderLeftColor(Item: TListItem);
    procedure XLSUpdateItemBorderRight(Item: TListItem);
    procedure XLSUpdateItemBorderRightColor(Item: TListItem);
    procedure XLSUpdateItemFillPattern(Item: TListItem);
    procedure XLSUpdateItemFillBackground(Item: TListItem);
    procedure XLSUpdateItemFillForeground(Item: TListItem);
    procedure XLSUpdateItemAggregate(Item: TListItem);
    procedure XLSUpdateItemSetDefault(Item: TListItem);
    procedure XLSResetAllItems;
    procedure XLSResetAllItems_A;
    procedure XLSShowStyleButtons;
    procedure XLSRenumStyles;
    procedure XLSSaveStyle(const FileName: string);
    procedure XLSLoadStyle(const FileName: string);

    procedure XLSShowHyperlink(Node: TTreeNode);
    procedure XLSShowNote(Node: TTreeNode);
    procedure XLSTuneNoteFillType;
    procedure XLSTuneChartPosition;
    procedure XLSTuneChartCategoryLabelType;
    procedure XLSTuneSeriesDataRangeType;
    procedure XLSShowChart(Node: TTreeNode);
    procedure XLSShowSeries(Node: TTreeNode);
    procedure XLSShowCell(Node: TTreeNode);
    procedure XLSTuneCellType;
    procedure XLSShowMergedCell(Node: TTreeNode);
    procedure XLSClearHyperlinkNodes;
    procedure XLSClearNoteNodes;
    procedure XLSClearChartNodes;
    procedure XLSClearCellNodes;
    procedure XLSClearMergedCellsNodes;
    procedure XLSUpdateHyperlinkFormats;

    procedure PDFFillFontList;
    procedure PDFShowFontInfo;
    procedure PDFShowExample;
  protected
    procedure Loaded; override;
  public
    property Dialog: TQExport3Dialog read GetDialog;

    property DataSet: TDataSet read GetDataSet;
    property CustomSource: TqeCustomSource read GetCustomSource;
    property ListView: TListView read GetListView;
    property DBGrid: TDBGrid read GetDBGrid;
    property StringGrid: TStringGrid read GetStringGrid;

    property AutoChangeFileExt: boolean read GetAutoChangeFileExt;
    property SaveLoadButtons: boolean read GetSaveLoadButtons;
    property CommonOptions: TCommonOptions read GetCommonOptions;
    property ConfirmAbort: boolean read GetConfirmAbort;
    property AutoSaveOptions: boolean read GetAutoSaveOptions;
    property AutoLoadOptions: boolean read GetAutoLoadOptions;
    property ExportSource: TQExportSource read GetExportSource;

    property QuickExport: TQExport3 read FQuickExport write FQuickExport;

    property FileName: string read FFileName write SetFileName;
    property ShowFile: boolean read FShowFile write SetShowFile;
    property PrintFile: boolean read FPrintFile write SetPrintFile;
    property ExportType: TAllowedExport read GetExportType write SetExportType;
    property OptionsFileName: string read FOptionsFileName
      write SetOptionsFileName;
    property GoToFirstRecord: boolean read FGoToFirstRecord
      write SetGoToFirstRecord;
    property CurrentRecordOnly: boolean read FCurrentRecordOnly
      write SetCurrentRecordOnly;
    property ExportEmpty: boolean read FExportEmpty write SetExportEmpty;
    property ExportRecCount: integer read FExportRecCount
      write SetExportRecCount;
    property SkipRecCount: integer read FSkipRecCount
      write SetSkipRecCount;

    property AllowCaptions: boolean read FAllowCaptions write SetAllowCaptions;
    property CaptionRow: integer read FCaptionRow write SetCaptionRow;

    property IntegerFmt: string read FIntegerFmt write SetIntegerFmt;
    property FloatFmt: string read FFloatFmt write SetFloatFmt;
    property DateFmt: string read FDateFmt write SetDateFmt;
    property TimeFmt: string read FTimeFmt write SetTimeFmt;
    property DateTimeFmt: string read FDateTimeFmt write SetDateTimeFmt;
    property CurrencyFmt: string read FCurrencyFmt write SetCurrencyFmt;
    property BooleanTrue: string read FBooleanTrue write SetBooleanTrue;
    property BooleanFalse: string read FBooleanFalse write SetBooleanFalse;
    property NullString: string read FNullString write SetNullString;

    property RTFPageOrientation: TQExportPageOrientation
      read FRTFPageOrientation write SetRTFPageOrientation;
    property RTFStripType: TrtfStripType read FRTFStripType
      write SetRTFStripType;

    property XLSPageHeader: string read FXLSPageHeader write SetXLSPageHeader;
    property XLSPageFooter: string read FXLSPageFooter write SetXLSPageFooter;
    property XLSSheetTitle: string read FXLSSheetTitle write SetXLSSheetTitle;
    property XLSStripType: TxlsStripType read FXLSStripType
      write SetXLSStripType;
    property XLSAutoCalcColWidth: boolean read FXLSAutoCalcColWidth
      write SetXLSAutoCalcColWidth;
    property XLSPageBackground: string read FXLSPageBackground
      write SetXLSPageBackground;

    property HTMLTitle: string read FHTMLTitle write SetHTMLTitle;
    property HTMLUsingCSS: TUsingCSS read FHTMLUsingCSS write SetHTMLUsingCSS;
    property HTMLCSSFileName: string read FHTMLCSSFileName
      write SetHTMLCSSFileName;
    property HTMLOverwriteCSSFile: boolean read FHTMLOverwriteCSSFile
      write SetHTMLOverwriteCSSFile;

    property HTMLUseMultiFileExport: boolean read FHTMLUseMultiFileExport
      write SetHTMLUseMultiFileExport;
    property HTMLFileRecCount: integer read FHTMLFileRecCount
      write SetHTMLFileRecCount;
    property HTMLGenerateIndex: boolean read FHTMLGenerateIndex
      write SetHTMLGenerateIndex;

    property HTMLIndexLinkTemplate: string read FHTMLIndexLinkTemplate
      write SetHTMLIndexLinkTemplate;
    property HTMLNavigationOnTop: boolean read FHTMLNavigationOnTop
      write SetHTMLNavigationOnTop;
    property HTMLNavigationOnBottom: boolean read FHTMLNavigationOnBottom
      write SetHTMLNavigationOnBottom;
    property HTMLIndexLinkTitle: string read FHTMLIndexLinkTitle
      write SetHTMLIndexLinkTitle;
    property HTMLFirstLinkTitle: string read FHTMLFirstLinkTitle
      write SetHTMLFirstLinkTitle;
    property HTMLPriorLinkTitle: string read FHTMLPriorLinkTitle
      write SetHTMLPriorLinkTitle;
    property HTMLNextLinkTitle: string read FHTMLNextLinkTitle
      write SetHTMLNextLinkTitle;
    property HTMLLastLinkTitle: string read FHTMLLastLinkTitle
      write SetHTMLLastLinkTitle;

    property HTMLFontName: string read FHTMLFontName write SetHTMLFontName;
    property HTMLBackground: string read FHTMLBackground
      write SetHTMLBackground;
    property HTMLBodyAdvanced: string read FHTMLBodyAdvanced
      write SetHTMLBodyAdvanced;
    property HTMLCellPadding: integer read FHTMLCellPadding
      write SetHTMLCellPadding;
    property HTMLCellSpacing: integer read FHTMLCellSpacing
      write SetHTMLCellSpacing;
    property HTMLBorderWidth: integer read FHTMLBorderWidth
      write SetHTMLBorderWidth;
    property HTMLTableBackground: string read FHTMLTableBackground
      write SetHTMLTableBackground;
    property HTMLTableAdvanced: string read FHTMLTableAdvanced
      write SetHTMLTableAdvanced;

    property HTMLBackgroundColor: TColor read FHTMLBackgroundColor
      write SetHTMLBackgroundColor;
    property HTMLFontColor: TColor read FHTMLFontColor write SetHTMLFontColor;
    property HTMLHeadBackgroundColor: TColor read FHTMLHeadBackgroundColor
      write SetHTMLHeadBackgroundColor;
    property HTMLHeadFontColor: TColor read FHTMLHeadFontColor
      write SetHTMLHeadFontColor;
    property HTMLOddRowBackgroundColor: TColor read FHTMLOddRowBackgroundColor
      write SetHTMLOddRowBackgroundColor;
    property HTMLEvenRowBackgroundColor: TColor read FHTMLEvenRowBackgroundColor
      write SetHTMLEvenRowBackgroundColor;
    property HTMLDataFontColor: TColor read FHTMLDataFontColor
      write SetHTMLDataFontColor;
    property HTMLLinkColor: TColor read FHTMLLinkColor write SetHTMLLinkColor;
    property HTMLVLinkColor: TColor read FHTMLVLinkColor
      write SetHTMLVLinkColor;
    property HTMLALinkColor: TColor read FHTMLALinkColor
      write SetHTMLALinkColor;

    property XMLStandalone: boolean read FXMLStandalone write SetXMLStandalone;
    property XMLEncoding: string read FXMLEncoding write SetXMLEncoding;

    property SQLTableName: string read FSQLTableName write SetSQLTableName;
    property SQLCreateTable: boolean read FSQLCreateTable
      write SetSQLCreateTable;
    property SQLCommitRecCount: integer read FSQLCommitRecCount
      write SetSQLCommitRecCount;
    property SQLCommitAfterScript: boolean read FSQLCommitAfterScript
      write SetSQLCommitAfterScript;
    property SQLCommitStatement: string read FSQLCommitStatement
      write SetSQLCommitStatement;
    property SQLStatementTerm: string read FSQLStatementTerm
      write SetSQLStatementTerm;

    property TXTAutoCalcColWidth: boolean read FTXTAutoCalcColWidth
      write SetTXTAutoCalcColWidth;
    property TXTSpacing: integer read FTXTSpacing write SetTXTSpacing;
    property CSVQuoteStrings: boolean read FCSVQuoteStrings
      write SetCSVQuoteStrings;
    property CSVComma: char read FCSVComma write SetCSVComma;
    property CSVQuote: char read FCSVQuote write SetCSVQuote;

    property PDFColSpacing: double read FPDFColSpacing write SetPDFColSpacing;
    property PDFRowSpacing: double read FPDFRowSpacing write SetPDFRowSpacing;
    property PDFGridLineWidth: integer read FPDFGridLineWidth
      write SetPDFGridLineWidth;
    property PDFPageFormat: TQExportPageFormat read FPDFPageFormat
      write SetPDFPageFormat;
    property PDFPageWidth: double read GetPDFPageWidth
      write SetPDFPageWidth;
    property PDFPageHeight: double read GetPDFPageHeight
      write SetPDFPageHeight;
    property PDFPageUnits: TQExportUnits read FPDFPageUnits
      write SetPDFPageUnits;
    property PDFPageOrientation: TQExportPageOrientation
      read FPDFPageOrientation write SetPDFPageOrientation;
    property PDFPageMarginLeft: double read GetPDFPageMarginLeft
      write SetPDFPageMarginLeft;
    property PDFPageMarginRight: double read GetPDFPageMarginRight
      write SetPDFPageMarginRight;
    property PDFPageMarginTop: double read GetPDFPageMarginTop
      write SetPDFPageMarginTop;
    property PDFPageMarginBottom: double read GetPDFPageMarginBottom
      write SetPDFPageMarginBottom;
  end;

  TQExportEvent = procedure(Sender: TQExport3) of object;
  TQExportGetColonEvent = procedure(Sender: TObject; Colon: TStrings) of object;
  TQRecordExportedEvent = procedure(Sender: TQExport3; RecNo: integer) of object;
  TQRecordExportedXLSEvent = procedure(Sender: TQExport3XLS; Sheet, RecNo: integer) of object;
  TQGetExportTextEvent = procedure(Sender: TQExport3; ColNo: integer;
    var Text: WideString) of object;
  TQGetExportXLSTextEvent = procedure(Sender: TQExport3XLS; Sheet, ColNo: Integer;
    var Text: WideString) of object;
  TQBeforeExportRowEvent = procedure(Sender: TQExport3; Row: TQExportRow;
    var Accept: boolean) of object;
  TQBeforeExportXLSRowEvent = procedure(Sender: TQExport3XLS; Sheet: integer;
    Row: TQExportRow; var Accept: boolean) of object;

  TQExport3Dialog = class(TComponent)
  private
    FColumns: TQExportColumns;

    FExportSource: TQExportSource;
    FDataSet: TDataSet;
    FCustomSource: TqeCustomSource;
    FDBGrid: TDBGrid;
    FListView: TListView;
    FStringGrid: TStringGrid;

    //William
    FShowPrintAfter : Boolean;
    
    
    //William

    FAllowedExports: TAllowedExports;
    FCommonOptions: TCommonOptions;
    FAutoChangeFileExt: boolean;
    FConfirmAbort: boolean;
    FOnlyVisibleFields: boolean;
    FAutoCalcStrType: boolean;

    FOptionsFileName: string;
    FAutoSaveOptions: boolean;
    FAutoLoadOptions: boolean;
    FSaveLoadButtons: boolean;

    FAbout: string;
    F_Version: string;

    FFileName: string;
    FShowFile: boolean;
    FPrintFile: boolean;

    FExportedFields: TStrings;

    FHeader: TStrings;
    FAllowCaptions: boolean;
    FCaptionRow: integer;
    FCaptions: TStrings;
    FFooter: TStrings;
    FFormats: TQExportFormats;
    FUserFormats: TStrings;
    FColumnsWidth: TStrings;
    FColumnsAlign: TStrings;

    FCurrentRecordOnly: boolean;
    FExportEmpty: boolean;
    FGoToFirstRecord: boolean;
    FExportRecCount: integer;
    FSkipRecCount: integer;

    FRTFOptions: TQExportRTFOptions;
    FXMLOptions: TQExportXMLOptions;
    FSQLOptions: TQExportSQLOptions;
    FHTMLPageOptions: TQExportHTMLPageOptions;
    FHTMLTableOptions: TQExportHTMLTableOptions;
    FHTMLMultiFileOptions: TQExportHTMLMultiFileOptions;
    FTXTOptions: TQExportTXTOptions;
    FCSVOptions: TQExportCSVOptions;
    FPDFOptions: TQExportPDFOptions;
    FXLSOptions: TQExportXLSOptions;

    FOnGetHeader: TQExportGetColonEvent;
    FOnGetFooter: TQExportGetColonEvent;

    FOnBeginExport: TQExportEvent;
    FOnEndExport: TQExportEvent;

    FOnFetchedRecord: TQRecordExportedEvent;
    FOnSkippedRecord: TQRecordExportedEvent;
    FOnBeforeExportRow: TQBeforeExportRowEvent;
    FOnBeforeExportXLSRow: TQBeforeExportXLSRowEvent;
    FOnExportedRecord: TQRecordExportedEvent;
    FOnExportedRecordXLS: TQRecordExportedXLSEvent;

    FOnStopExport: TQExportStopEvent;
    FOnGetExportText: TQGetExportTextEvent;
    FOnGetExportXLSText: TQGetExportXLSTextEvent;


    procedure SetExportedFields(const Value: TStrings);

    procedure SetHeader(const Value: TStrings);
    procedure SetCaptions(const Value: TStrings);
    procedure SetFooter(const Value: TStrings);
    procedure SetFormats(const Value: TQExportFormats);
    procedure SetUserFormats(const Value: TStrings);
    procedure SetColumnsWidth(const Value: TStrings);
    procedure SetColumnsAlign(const Value: TStrings);

    procedure SetRTFOptions(const Value: TQExportRTFOptions);
    procedure SetXMLOptions(const Value: TQExportXMLOptions);
    procedure SetSQLOptions(const Value: TQExportSQLOptions);
    procedure SetHTMLPageOptions(const Value: TQExportHTMLPageOptions);
    procedure SetHTMLTableOptions(const Value: TQExportHTMLTableOptions);
    procedure SetHTMLMultiFileOptions(const Value: TQExportHTMLMultiFileOptions);
    procedure SetTXTOptions(const Value: TQExportTXTOptions);
    procedure SetCSVOptions(const Value: TQExportCSVOptions);
    procedure SetPDFOptions(const Value: TQExportPDFOptions);
    procedure SetXLSOptions(const Value: TQExportXLSOptions);
  protected
    procedure Notification(AComponent: TComponent;
      Operation: TOperation); override;
    property Columns: TQExportColumns read FColumns;
  public
    constructor Create(AOwner: TComponent); override;
    destructor Destroy; override;
    procedure Execute;
  published

    //William
    property ShowPrintAfter : Boolean read fShowPrintAfter write fShowPrintAfter;
    
    //Wiliam
    property ExportSource: TQExportSource read FExportSource
      write FExportSource default esDataSet;
    property DataSet: TDataSet read FDataSet write FDataSet;
    property CustomSource: TqeCustomSource read FCustomSource
      write FCustomSource;
    property ListView: TListView read FListView write FListView;
    property DBGrid: TDBGrid read FDBGrid write FDBGrid;
    property StringGrid: TStringGrid read FStringGrid write FStringGrid;

    property AllowedExports: TAllowedExports read FAllowedExports
      write FAllowedExports default [Low(TAllowedExport)..High(TAllowedExport)];
    property CommonOptions: TCommonOptions read FCommonOptions
      write FCommonOptions default [Low(TCommonOption)..High(TCommonOption)];
    property AutoChangeFileExt: boolean read FAutoChangeFileExt
      write FAutoChangeFileExt default true;
    property ConfirmAbort: boolean read FConfirmAbort
      write FConfirmAbort default true;
    property OnlyVisibleFields: boolean read FOnlyVisibleFields
      write FOnlyVisibleFields default false;
    property AutoCalcStrType: boolean read FAutoCalcStrType
      write FAutoCalcStrType default false;

    property OptionsFileName: string read FOptionsFileName
      write FOptionsFileName;
    property AutoSaveOptions: boolean read FAutoSaveOptions
      write FAutoSaveOptions default false;
    property AutoLoadOptions: boolean read FAutoLoadOptions
      write FAutoLoadOptions default false;
    property SaveLoadButtons: boolean read FSaveLoadButtons
      write FsaveLoadButtons default false;

    property About: string read FAbout write FAbout;
    property _Version: string read F_Version write F_Version;

    property FileName: string read FFileName write FFileName;
    property ShowFile: boolean read FShowFile write FShowFile default true;
    property PrintFile: boolean read FPrintFile write FPrintFile default false;

    property ExportedFields: TStrings read FExportedFields
      write SetExportedFields;

    property Header: TStrings read FHeader write SetHeader;
    property AllowCaptions: boolean read FAllowCaptions
      write FAllowCaptions default true;
    property CaptionRow: integer read FCaptionRow write FCaptionRow default -1;
    property Captions: TStrings read FCaptions write SetCaptions;
    property Footer: TStrings read FFooter write SetFooter;
    property Formats: TQExportFormats read FFormats write SetFormats;
    property UserFormats: TStrings read FUserFormats write SetUserFormats;
    property ColumnsWidth: TStrings read FColumnsWidth write SetColumnsWidth;
    property ColumnsAlign: TStrings read FColumnsAlign write SetColumnsAlign;

    property CurrentRecordOnly: boolean read FCurrentRecordOnly
      write FCurrentRecordOnly default false;
    property ExportEmpty: boolean read FExportEmpty
      write FExportEmpty default true;
    property GoToFirstRecord: boolean read FGoToFirstRecord
      write FGoToFirstRecord default true;
    property ExportRecCount: integer read FExportRecCount
      write FExportRecCount default 0;
    property SkipRecCount: integer read FSkipRecCount
      write FSkipRecCount default 0;

    property RTFOptions: TQExportRTFOptions read FRTFOptions
      write SetRTFOptions;
    property XMLOptions: TQExportXMLOptions read FXMLOptions
      write SetXMLOptions;
    property SQLOptions: TQExportSQLOptions read FSQLOptions
      write SetSQLOptions;
    property HTMLPageOptions: TQExportHTMLPageOptions read FHTMLPageOptions
      write SetHTMLPageOptions;
    property HTMLTableOptions: TQExportHTMLTableOptions read FHTMLTableOptions
      write SetHTMLTableOptions;
    property HTMLMultiFileOptions: TQExportHTMLMultiFileOptions
      read FHTMLMultiFileOptions write SetHTMLMultiFileOptions;
    property TXTOptions: TQExportTXTOptions read FTXTOptions
      write SetTXTOptions;
    property CSVOptions: TQExportCSVOptions read FCSVOptions
      write SetCSVOptions;
    property PDFOptions: TQExportPDFOptions read FPDFOptions
      write SetPDFOptions;
    property XLSOptions: TQExportXLSOptions read FXLSOptions
      write SetXLSOptions;

    property OnGetHeader: TQExportGetColonEvent read FOnGetHeader
      write FOnGetHeader;
    property OnGetFooter: TQExportGetColonEvent read FOnGetFooter
      write FOnGetFooter;

    property OnBeginExport: TQExportEvent read FOnBeginExport
      write FOnBeginExport;
    property OnEndExport: TQExportEvent read FOnEndExport write FOnEndExport;
    property OnFetchedRecord: TQRecordExportedEvent read FOnFetchedRecord
      write FOnFetchedRecord;
    property OnSkippedRecord: TQRecordExportedEvent read FOnSkippedRecord
      write FOnSkippedRecord;
    property OnBeforeExportRow: TQBeforeExportRowEvent read FOnBeforeExportRow
      write FOnBeforeExportRow;
    property OnBeforeExportXLSRow: TQBeforeExportXLSRowEvent
      read FOnBeforeExportXLSRow write FOnBeforeExportXLSRow;
    property OnExportedRecord: TQRecordExportedEvent read FOnExportedRecord
      write FOnExportedRecord;
    property OnExportedRecordXLS: TQRecordExportedXLSEvent
      read FOnExportedRecordXLS write FOnExportedRecordXLS;
    property OnStopExport: TQExportStopEvent read FOnStopExport
      write FOnStopExport;
    property OnGetExportText: TQGetExportTextEvent read FOnGetExportText
      write FOnGetExportText;
    property OnGetExportXLSText: TQGetExportXLSTextEvent
      read FOnGetExportXLSText write FOnGetExportXLSText;
  end;

implementation

uses {$IFDEF WIN32}QExport3StrIDs{$ENDIF}
     {$IFDEF LINUX}QExport3Consts{$ENDIF}, SysUtils, fuQExport3XLSColorEditor,
     IniFiles, QExport3Types, QExport3XLSCommon {$IFDEF VCL6}, Variants{$ENDIF};

var
  ExportTypeString: array[TAllowedExport] of string;
  ExportTypeFilter: array[TAllowedExport] of string;

const
  ExportTypeExtension: array[TAllowedExport] of string =
    ('xls', 'doc', 'rtf', 'html', 'xml', 'dbf', 'pdf', 'txt', 'csv', 'dif',
     'slk', 'tex', 'sql', '');

  xlsHyperlink  = 6;
  xlsNote       = 7;
  xlsChart      = 8;
  xlsSeries     = 9;
  xlsCell       = 10;
  xlsMergedCell = 11;

{$R *.DFM}

{ TQExport3Dialog }

constructor TQExport3Dialog.Create(AOwner: TComponent);
begin
  inherited;
  FColumns := TQExportColumns.Create(Self, nil);

  FExportSource := esDataSet;

  FAllowedExports := [Low(TAllowedExport)..High(TAllowedExport)];
  FCommonOptions := [Low(TCommonOption)..High(TCommonOption)];
  FAutoChangeFileExt := true;
  FConfirmAbort := true;
  FOnlyVisibleFields := false;
  FAutoCalcStrType := false;

  FAutoSaveOptions := false;
  FAutoLoadOptions := false;
  FSaveLoadButtons := false;

  //William
  fShowPrintAfter := False;
  
  
  //William

  FShowFile := true;
  FPrintFile := false;

  FExportedFields := TStringList.Create;

  FHeader := TStringList.Create;
  FAllowCaptions := true;
  FCaptionRow := -1;
  FCaptions := TStringList.Create;
  FFooter := TStringList.Create;
  FFormats := TQExportFormats.Create;
  FUserFormats := TStringList.Create;
  FColumnsWidth := TStringList.Create;
  FColumnsAlign := TStringList.Create;

  FCurrentRecordOnly := false;
  FExportEmpty := true;
  FGoToFirstRecord := true;
  FExportRecCount := 0;
  FSkipRecCount := 0;

  FRTFOptions := TQExportRTFOptions.Create(Self);
  FXMLOptions := TQExportXMLOptions.Create(Self);
  FSQLOptions := TQExportSQLOptions.Create(Self);
  FHTMLPageOptions := TQExportHTMLPageOptions.Create(Self);
  FHTMLTableOptions := TQExportHTMLTableOptions.Create(Self);
  FHTMLMultiFileOptions := TQExportHTMLMultiFileOptions.Create(Self);
  FTXTOptions := TQExportTXTOptions.Create(Self);
  FCSVOptions := TQExportCSVOptions.Create(Self);
  FPDFOptions := TQExportPDFOptions.Create(Self);
  FXLSOptions := TQExportXLSOptions.Create(Self);
end;

destructor TQExport3Dialog.Destroy;
begin
  FRTFOptions.Free;
  FXMLOptions.Free;
  FSQLOptions.Free;
  FHTMLPageOptions.Free;
  FHTMLTableOptions.Free;
  FHTMLMultiFileOptions.Free;
  FTXTOptions.Free;
  FCSVOptions.Free;
  FPDFOptions.Free;
  FXLSOptions.Free;

  FColumns.Free;
  FExportedFields.Free;

  FHeader.Free;
  FCaptions.Free;
  FFooter.Free;
  FFormats.Free;
  FUserFormats.Free;
  FColumnsWidth.Free;
  FColumnsAlign.Free;
  inherited;
end;

procedure TQExport3Dialog.Execute;
begin
  if ((ExportSource = esDataSet) and not Assigned(DataSet)) or
     ((ExportSource = esDBGrid) and not Assigned(DBGrid)) or
     ((ExportSource = esListView) and not Assigned(ListView)) or
     ((ExportSource = esStringGrid) and not Assigned(StringGrid))
    then raise Exception.CreateFmt({$IFDEF WIN32}QExportLoadStr(QEM_ExportSourceNotAssigned){$ENDIF}
                                   {$IFDEF LINUX}QEM_ExportSourceNotAssigned{$ENDIF},
                                   [QExportSourceAsString(ExportSource)]);
  if AllowedExports = [] then
    raise Exception.Create({$IFDEF WIN32}QExportLoadStr(QEM_AllowedExportsEmpty){$ENDIF}
                           {$IFDEF LINUX}QEM_AllowedExportsEmpty{$ENDIF});

  FColumns.Clear;
  FColumns.Fill(true);

  with TQExport3DialogF.Create(Self) do
  try
   If not fShowPrintAfter then
    begin
      //chPrintFile.Checked := fShowPrintAfter;
      chPrintFile.visible := fShowPrintAfter;
    end;

    ShowModal;
  finally
    Free;
  end;
end;

procedure TQExport3Dialog.Notification(AComponent: TComponent; Operation: TOperation);
begin
  inherited;
  if (Operation = opRemove) then begin
    if AComponent = FDataSet then FDataSet := nil;
    if AComponent = FCustomSource then FCustomSource := nil;
    if AComponent = FListView then FListView := nil;
    if AComponent = FDBGrid then FDBGrid := nil;
    if AComponent = FStringGrid then FStringGrid := nil;
  end;
end;

procedure TQExport3Dialog.SetExportedFields(const Value: TStrings);
begin
  FExportedFields.Assign(Value);
end;

procedure TQExport3Dialog.SetHeader(const Value: TStrings);
begin
  FHeader.Assign(Value);
end;

procedure TQExport3Dialog.SetCaptions(const Value: TStrings);
begin
  FCaptions.Assign(Value);
end;

procedure TQExport3Dialog.SetFooter(const Value: TStrings);
begin
  FFooter.Assign(Value);
end;

procedure TQExport3Dialog.SetFormats(const Value: TQExportFormats);
begin
  FFormats.Assign(Value);
end;

procedure TQExport3Dialog.SetUserFormats(const Value: TStrings);
begin
  FUserFormats.Assign(Value);
end;

procedure TQExport3Dialog.SetColumnsWidth(const Value: TStrings);
begin
  FColumnsWidth.Assign(Value);
end;

procedure TQExport3Dialog.SetColumnsAlign(const Value: TStrings);
begin
  FColumnsAlign.Assign(Value);
end;

procedure TQExport3Dialog.SetRTFOptions(const Value: TQExportRTFOptions);
begin
  FRTFOptions.Assign(Value);
end;

procedure TQExport3Dialog.SetXMLOptions(const Value: TQExportXMLOptions);
begin
  FXMLOptions.Assign(Value);
end;

procedure TQExport3Dialog.SetSQLOptions(const Value: TQExportSQLOptions);
begin
  FSQLOptions.Assign(Value);
end;

procedure TQExport3Dialog.SetHTMLPageOptions(
  const Value: TQExportHTMLPageOptions);
begin
  FHTMLPageOptions.Assign(Value);
end;

procedure TQExport3Dialog.SetHTMLTableOptions(
  const Value: TQExportHTMLTableOptions);
begin
  FHTMLTableOptions.Assign(Value);
end;

procedure TQExport3Dialog.SetHTMLMultiFileOptions(
  const Value: TQExportHTMLMultiFileOptions);
begin
  FHTMLMultiFileOptions.Assign(Value);
end;

procedure TQExport3Dialog.SetTXTOptions(const Value: TQExportTXTOptions);
begin
  FTXTOptions.Assign(Value);
end;

procedure TQExport3Dialog.SetCSVOptions(const Value: TQExportCSVOptions);
begin
  FCSVOptions.Assign(Value);
end;

procedure TQExport3Dialog.SetPDFOptions(const Value: TQExportPDFOptions);
begin
  FPDFOptions.Assign(Value);
end;

procedure TQExport3Dialog.SetXLSOptions(const Value: TQExportXLSOptions);
begin
  FXLSOptions.Assign(Value);
end;

{ TQExportDialogF }

function TQExport3DialogF.GetDialog: TQExport3Dialog;
begin
  Result := Owner as TQExport3Dialog;
end;

function TQExport3DialogF.GetDataSet: TDataSet;
begin
  Result := Dialog.DataSet;
end;

function TQExport3DialogF.GetCustomSource: TqeCustomSource;
begin
  Result := Dialog.CustomSource;
end;

function TQExport3DialogF.GetListView: TListView;
begin
  Result := Dialog.ListView;
end;

function TQExport3DialogF.GetDBGrid: TDBGrid;
begin
  Result := Dialog.DBGrid;
end;

function TQExport3DialogF.GetStringGrid: TStringGrid;
begin
  Result := Dialog.StringGrid;
end;

function TQExport3DialogF.GetAutoChangeFileExt: boolean;
begin
  Result := Dialog.AutoChangeFileExt;
end;

function TQExport3DialogF.GetSaveLoadButtons: boolean;
begin
  Result := Dialog.SaveLoadButtons;
end;

function TQExport3DialogF.GetCommonOptions: TCommonOptions;
begin
  Result := Dialog.CommonOptions;
end;

function TQExport3DialogF.GetConfirmAbort: boolean;
begin
  Result := Dialog.ConfirmAbort;
end;

function TQExport3DialogF.GetAutoSaveOptions: boolean;
begin
  Result := Dialog.AutoSaveOptions;
end;

function TQExport3DialogF.GetAutoLoadOptions: boolean;
begin
  Result := Dialog.AutoLoadOptions;
end;

function TQExport3DialogF.GetExportSource: TQExportSource;
begin
  Result := Dialog.ExportSource;
end;

procedure TQExport3DialogF.SetFileName(const Value: string);
begin
  if FFileName <> Value then begin
    FFileName := Value;
    edFileName.Text := FFileName;
    ShowTitle;
  end;
end;

procedure TQExport3DialogF.SetShowFile(const Value: boolean);
begin
  if FShowFile <> Value then begin
    FShowFile := Value;
    chShowFile.Checked := FShowFile;
  end;
end;

procedure TQExport3DialogF.SetPrintFile(const Value: boolean);
begin
  if FPrintFile <> Value then begin
    FPrintFile := Value;
    chPrintFile.Checked := FPrintFile;
  end;
end;

function TQExport3DialogF.GetExportType: TAllowedExport;
begin
  Result :=
    TAllowedExport(Integer(rgExportType.Items.Objects[rgExportType.ItemIndex]));
end;

procedure TQExport3DialogF.SetExportType(const Value: TAllowedExport);
var
  i: integer;
begin
  for i := 0 to rgExportType.Items.Count - 1 do
    if Integer(rgExportType.Items.Objects[i]) = Integer(Value) then begin
      rgExportType.ItemIndex := i;
      Break;
    end;
end;

procedure TQExport3DialogF.SetOptionsFileName(const Value: string);
begin
  if AnsiCompareText(FOptionsFileName, Value) <> 0 then begin
    FOptionsFileName := Value;
    odOptions.FileName := FOptionsFileName;
    sdOptions.FileName := FOptionsFileName;
  end;
end;

procedure TQExport3DialogF.SetGoToFirstRecord(const Value: boolean);
begin
  if FGoToFirstRecord <> Value then begin
    FGoToFirstRecord := Value;
    chGoToFirstRecord.Checked := FGoToFirstRecord;
  end;
end;

procedure TQExport3DialogF.SetCurrentRecordOnly(const Value: boolean);
begin
  if FCurrentRecordOnly <> Value then begin
    FCurrentRecordOnly := Value;
    chCurrentRecordOnly.Checked := FCurrentRecordOnly;
  end;
end;

procedure TQExport3DialogF.SetExportEmpty(const Value: boolean);
begin
  if FExportEmpty <> Value then begin
    FExportEmpty := Value;
    chExportEmpty.Checked := FExportEmpty;
  end;
end;

procedure TQExport3DialogF.SetExportRecCount(const Value: integer);
begin
  if FExportRecCount <> Value then begin
    FExportRecCount := Value;
    edExportRecCount.Text := IntToStr(FExportRecCount);
    if FExportRecCount > 0 then rbExportOnly.Checked := true;
  end;
end;

procedure TQExport3DialogF.SetSkipRecCount(const Value: integer);
begin
  if FSkipRecCount <> Value then begin
    FSkipRecCount := Value;
    edSkipRecCount.Text := IntToStr(FSkipRecCount);
  end;
end;

procedure TQExport3DialogF.SetAllowCaptions(const Value: boolean);
begin
  if FAllowCaptions <> Value then begin
    FAllowCaptions := Value;
    chAllowCaptions.Checked := FAllowCaptions;
  end;
end;

procedure TQExport3DialogF.SetCaptionRow(const Value: integer);
begin
  if FCaptionRow <> Value then begin
    FCaptionRow := Value;
    edCaptionRow.Text := IntToStr(FCaptionRow);
  end;
end;

procedure TQExport3DialogF.SetIntegerFmt(const Value: string);
begin
  if FIntegerFmt <> Value then begin
    FIntegerFmt := Value;
    edIntegerFormat.Text := FIntegerFmt;
  end;
end;

procedure TQExport3DialogF.SetFloatFmt(const Value: string);
begin
  if FFloatFmt <> Value then begin
    FFloatFmt := Value;
    edFloatFormat.Text := FFloatFmt;
  end;
end;

procedure TQExport3DialogF.SetDateFmt(const Value: string);
begin
  if FDateFmt <> Value then begin
    FDateFmt := Value;
    edDateFormat.Text := FDateFmt;
  end;
end;

procedure TQExport3DialogF.SetTimeFmt(const Value: string);
begin
  if FTimeFmt <> Value then begin
    FTimeFmt := Value;
    edTimeFormat.Text := FTimeFmt;
  end;
end;

procedure TQExport3DialogF.SetDateTimeFmt(const Value: string);
begin
  if FDateTimeFmt <> Value then begin
    FDateTimeFmt := Value;
    edDateTimeFormat.Text := FDateTimeFmt;
  end;
end;

procedure TQExport3DialogF.SetCurrencyFmt(const Value: string);
begin
  if FCurrencyFmt <> Value then begin
    FCurrencyFmt := Value;
    edCurrencyFormat.Text := FCurrencyFmt;
  end;
end;

procedure TQExport3DialogF.SetBooleanTrue(const Value: string);
begin
  if FBooleanTrue <> Value then begin
    FBooleanTrue := Value;
    edBooleanTrue.Text := FBooleanTrue;
  end;
end;

procedure TQExport3DialogF.SetBooleanFalse(const Value: string);
begin
  if FBooleanFalse <> Value then begin
    FBooleanFalse := Value;
    edBooleanFalse.Text := FBooleanFalse;
  end;
end;

procedure TQExport3DialogF.SetNullString(const Value: string);
begin
  if FNullString <> Value then begin
    FNullString := Value;
    edNullString.Text := FNullString;
    edSQLNullString.Text := FNullString;
  end;
end;

procedure TQExport3DialogF.SetRTFPageOrientation(
  const Value: TQExportPageOrientation);
begin
  if FRTFPageOrientation <> Value then begin
    FRTFPageOrientation := Value;
    rgRTFPageOrientation.ItemIndex := Integer(FRTFPageOrientation);
  end;
end;

procedure TQExport3DialogF.SetRTFStripType(const Value: TrtfStripType);
begin
  if FRTFStripType <> Value then begin
    FRTFStripType := Value;
    rgRTFStripType.ItemIndex := Integer(FRTFStripType);
  end;
end;

procedure TQExport3DialogF.SetXLSPageHeader(const Value: string);
begin
  if FXLSPageHeader <> Value then begin
    FXLSPageHeader := Value;
    edXLSPageHeader.Text := FXLSPageHeader;
  end;
end;

procedure TQExport3DialogF.SetXLSPageFooter(const Value: string);
begin
  if FXLSPageFooter <> Value then begin
    FXLSPageFooter := Value;
    edXLSPageFooter.Text := FXLSPageFooter;
  end;
end;

procedure TQExport3DialogF.SetXLSSheetTitle(const Value: string);
begin
  if FXLSSheetTitle <> Value then begin
    FXLSSheetTitle := Value;
    edXLSSheetTitle.Text := FXLSSheetTitle;
  end;
end;

procedure TQExport3DialogF.SetXLSStripType(const Value: TxlsStripType);
begin
  if FXLSStripType <> Value then begin
    FXLSStripType := Value;
    rgXLSStripType.ItemIndex := Integer(FXLSStripType);
  end;
end;

procedure TQExport3DialogF.SetXLSAutoCalcColWidth(Value: boolean);
begin
  if FXLSAutoCalcColWidth <> Value then begin
    FXLSAutoCalcColWidth := Value;
    chXLSAutoCalcColWidth.Checked := FXLSAutoCalcColWidth;
  end;
end;

procedure TQExport3DialogF.SetXLSPageBackground(const Value: string);
begin
  if FXLSPageBackground <> Value then begin
    FXLSPageBackground := Value;
    edXLSPageBackground.Text := FXLSPageBackground;
  end;
end;

procedure TQExport3DialogF.SetHTMLTitle(const Value: string);
begin
  if FHTMLTitle <> Value then begin
    FHTMLTitle := Value;
    edHTMLTitle.Text := FHTMLTitle;
  end;
end;

procedure TQExport3DialogF.SetHTMLUsingCSS(const Value: TUsingCSS);
begin
  if FHTMLUsingCSS <> Value then begin
    FHTMLUsingCSS := Value;
    case FHTMLUsingCSS of
      usInternal: rbInternal.Checked := true;
      usExternal: rbExternal.Checked := true;
    end;
    edHTMLCSSFileName.Enabled := FHTMLUsingCSS = usExternal;
    laHTMLCSSFileName.Enabled := FHTMLUsingCSS = usExternal;
    btnHTMLCSSFileName.Enabled := FHTMLUsingCSS = usExternal;
    chHTMLOverwriteCSSFile.Enabled := FHTMLUsingCSS = usExternal;
  end;
end;

procedure TQExport3DialogF.SetHTMLCSSFileName(const Value: string);
begin
  if FHTMLCSSFileName <> Value then begin
    FHTMLCSSFileName := Value;
    edHTMLCSSFileName.Text := FHTMLCSSFileName;
  end;
end;

procedure TQExport3DialogF.SetHTMLOverwriteCSSFile(const Value: boolean);
begin
  if FHTMLOverwriteCSSFile <> Value then begin
    FHTMLOverwriteCSSFile := Value;
    chHTMLOverwriteCSSFile.Checked := FHTMLOverwriteCSSFile;
  end;
end;

procedure TQExport3DialogF.SetHTMLUseMultiFileExport(const Value: boolean);
begin
  if FHTMLUseMultiFileExport <> Value then begin
    FHTMLUseMultiFileExport := Value;
    chHTMLUseMultiFileExport.Checked := FHTMLUseMultiFileExport;
  end;
end;

procedure TQExport3DialogF.SetHTMLFileRecCount(const Value: integer);
begin
  if FHTMLFileRecCount <> Value then begin
    FHTMLFileRecCount := Value;
    edHTMLFileRecCount.Text := IntToStr(FHTMLFileRecCount);
  end;
end;

procedure TQExport3DialogF.SetHTMLGenerateIndex(const Value: boolean);
begin
  if FHTMLGenerateIndex <> Value then begin
    FHTMLGenerateIndex := Value;
    chHTMLGenerateIndex.Checked := FHTMLGenerateIndex;
  end;
end;

procedure TQExport3DialogF.SetHTMLIndexLinkTemplate(const Value: string);
begin
  if FHTMLIndexLinkTemplate <> Value then begin
    FHTMLIndexLinkTemplate := Value;
    edHTMLIndexLinkTemplate.Text := Value;
  end;
end;

procedure TQExport3DialogF.SetHTMLNavigationOnTop(const Value: boolean);
begin
  if FHTMLNavigationOnTop <> Value then begin
    FHTMLNavigationOnTop := Value;
    chHTMLNavigationOnTop.Checked := Value;
  end;
end;

procedure TQExport3DialogF.SetHTMLNavigationOnBottom(const Value: boolean);
begin
  if FHTMLNavigationOnBottom <> Value then begin
    FHTMLNavigationOnBottom := Value;
    chHTMLNavigationOnBottom.Checked := Value;
  end;
end;

procedure TQExport3DialogF.SetHTMLIndexLinkTitle(const Value: string);
begin
  if FHTMLIndexLinkTitle <> Value then begin
    FHTMLIndexLinkTitle := Value;
    edHTMLIndexLinkTitle.Text := FHTMLIndexLinkTitle;
  end;
end;

procedure TQExport3DialogF.SetHTMLFirstLinkTitle(const Value: string);
begin
  if FHTMLFirstLinkTitle <> Value then begin
    FHTMLFirstLinkTitle := Value;
    edHTMLFirstLinkTitle.Text := FHTMLFirstLinkTitle;
  end;
end;

procedure TQExport3DialogF.SetHTMLPriorLinkTitle(const Value: string);
begin
  if FHTMLPriorLinkTitle <> Value then begin
    FHTMLPriorLinkTitle := Value;
    edHTMLPriorLinkTitle.Text := FHTMLPriorLinkTitle;
  end;
end;

procedure TQExport3DialogF.SetHTMLNextLinkTitle(const Value: string);
begin
  if FHTMLNextLinkTitle <> Value then begin
    FHTMLNextLinkTitle := Value;
    edHTMLNextLinkTitle.Text := FHTMLNextLinkTitle;
  end;
end;

procedure TQExport3DialogF.SetHTMLLastLinkTitle(const Value: string);
begin
  if FHTMLLastLinkTitle <> Value then begin
    FHTMLLastLinkTitle := Value;
    edHTMLLastLinkTitle.Text := FHTMLLastLinkTitle;
  end;
end;

procedure TQExport3DialogF.SetHTMLFontName(const Value: string);
begin
  if FHTMLFontName <> Value then begin
    FHTMLFontName := Value;
    cbxHTMLFontName.Text := FHTMLFontName;
  end;
end;

procedure TQExport3DialogF.SetHTMLBackground(const Value: string);
begin
  if FHTMLBackground <> Value then begin
    FHTMLBackground := Value;
    edHTMLBackground.Text := FHTMLBackground;
  end;
end;

procedure TQExport3DialogF.SetHTMLBodyAdvanced(const Value: string);
begin
  if FHTMLBodyAdvanced <> Value then begin
    FHTMLBodyAdvanced := Value;
    edHTMLBodyAdvanced.Text := FHTMLBodyAdvanced;
  end;
end;

procedure TQExport3DialogF.SetHTMLCellPadding(const Value: integer);
begin
  if FHTMLCellPadding <> Value then begin
    FHTMLCellPadding := Value;
    edHTMLCellPadding.Text := IntToStr(FHTMLCellPadding);
  end;
end;

procedure TQExport3DialogF.SetHTMLCellSpacing(const Value: integer);
begin
  if FHTMLCellSpacing <> Value then begin
    FHTMLCellSpacing := Value;
    edHTMLCellSpacing.Text := IntToStr(FHTMLCellSpacing);
  end;
end;

procedure TQExport3DialogF.SetHTMLBorderWidth(const Value: integer);
begin
  if FHTMLBorderWidth <> Value then begin
    FHTMLBorderWidth := Value;
    edHTMLBorderWidth.Text := IntToStr(FHTMLBorderWidth);
  end;
end;

procedure TQExport3DialogF.SetHTMLTableBackground(const Value: string);
begin
  if FHTMLTableBackground <> Value then begin
    FHTMLTableBackground := Value;
    edHTMLTableBackground.Text := FHTMLTableBackground;
  end;
end;

procedure TQExport3DialogF.SetHTMLTableAdvanced(const Value: string);
begin
  if FHTMLTableAdvanced <> Value then begin
    FHTMLTableAdvanced := Value;
    edHTMLTableAdvanced.Text := FHTMLTableAdvanced;
  end;
end;

procedure TQExport3DialogF.SetHTMLBackgroundColor(const Value: TColor);
begin
  if FHTMLBackgroundColor <> Value then begin
    FHTMLBackgroundColor := Value;
    HTMLExp.HTMLOptions.BackgroundColor := Value;
    paHTMLBackground.Color := Value;
  end;
end;

procedure TQExport3DialogF.SetHTMLFontColor(const Value: TColor);
begin
  if FHTMLFontColor <> Value then begin
    FHTMLFontColor := Value;
    HTMLExp.HTMLOptions.TextFont.Color := Value;
    laHTMLFont.Font.Color := Value;
  end;
end;

procedure TQExport3DialogF.SetHTMLHeadBackgroundColor(const Value: TColor);
var
  i: integer;
begin
  if FHTMLHeadBackgroundColor <> Value then begin
    FHTMLHeadBackgroundColor := Value;
    HTMLExp.TableOptions.HeadersRowBgColor := Value;
    for i := 1 to 3 do
      (FindComponent('paHTMLColumnHead_' + IntToStr(i)) as TPanel).Color :=
        Value;
  end;
end;

procedure TQExport3DialogF.SetHTMLHeadFontColor(const Value: TColor);
var
  i: integer;
begin
  if FHTMLHeadFontColor <> Value then begin
    FHTMLHeadFontColor := Value;
    HTMLExp.TableOptions.HeadersRowFontColor := Value;
    for i := 1 to 3 do
      (FindComponent('laHTMLHead_' + IntToStr(i)) as TLabel).Font.Color :=
        FHTMLHeadFontColor;
  end;
end;

procedure TQExport3DialogF.SetHTMLOddRowBackgroundColor(
  const Value: TColor);
var
  i: integer;
begin
  if FHTMLOddRowBackgroundColor <> Value then begin
    FHTMLOddRowBackgroundColor := Value;
    HTMLExp.TableOptions.OddRowBgColor := Value;
    for i := 1 to 6 do
      (FindComponent('paHTMLOddRowCol_' + IntToStr(i)) as TPanel).Color :=
        FHTMLOddRowBackgroundColor;
  end;
end;

procedure TQExport3DialogF.SetHTMLEvenRowBackgroundColor(
  const Value: TColor);
var
  i: integer;
begin
  if FHTMLEvenRowBackgroundColor <> Value then begin
    FHTMLEvenRowBackgroundColor := Value;
    HTMLExp.TableOptions.TableBgColor := Value;
    for i := 1 to 6 do
      (FindComponent('paHTMLEvenRowCol_' + IntToStr(i)) as TPanel).Color :=
        FHTMLEvenRowBackgroundColor;
  end;
end;

procedure TQExport3DialogF.SetHTMLDataFontColor(const Value: TColor);
var
  i: integer;
begin
  if FHTMLDataFontColor <> Value then begin
    FHTMLDataFontColor := Value;
    HTMLExp.TableOptions.TableFontColor := Value;
    for i := 1 to 12 do
      (FindComponent(Format('laHTMLData_%d',[i])) as TLabel).Font.Color :=
        FHTMLDataFontColor;
  end;
end;

procedure TQExport3DialogF.SetHTMLLinkColor(const Value: TColor);
begin
  if FHTMLLinkColor <> Value then begin
    FHTMLLinkColor := Value;
    HTMLExp.HTMLOptions.LinkColor := Value;
    laHTMLLink.Font.Color := FHTMLLinkColor;
  end;
end;

procedure TQExport3DialogF.SetHTMLVLinkColor(const Value: TColor);
begin
  if FHTMLVLinkColor <> Value then begin
    FHTMLVLinkColor := Value;
    HTMLExp.HTMLOptions.VLinkColor := Value;
    laHTMLVLink.Font.Color := FHTMLVLinkColor;
  end;
end;

procedure TQExport3DialogF.SetHTMLALinkColor(const Value: TColor);
begin
  if FHTMLALinkColor <> Value then begin
    FHTMLALinkColor := Value;
    HTMLExp.HTMLOptions.ALinkColor := Value;
    laHTMLALink.Font.Color := FHTMLALinkColor;
  end;
end;

procedure TQExport3DialogF.SetXMLStandalone(const Value: boolean);
begin
  if FXMLStandalone <> Value then begin
    FXMLStandalone := Value;
    chXMLStandalone.Checked := FXMLStandalone;
  end;
end;

procedure TQExport3DialogF.SetXMLEncoding(const Value: string);
begin
  if AnsiCompareText(FXMLEncoding, Value) <> 0 then begin
    FXMLEncoding := Value;
    edXMLEncoding.Text := FXMLEncoding;
  end;
end;

procedure TQExport3DialogF.SetSQLTableName(const Value: string);
begin
  if FSQLTableName <> Value then begin
    FSQLTableName := Value;
    edSQLTableName.Text := FSQLTableName;
  end;
end;

procedure TQExport3DialogF.SetSQLCreateTable(const Value: boolean);
begin
  if FSQLCreateTable <> Value then begin
    FSQLCreateTable := Value;
    chSQLCreateTable.Checked := FSQLCreateTable;
  end;
end;

procedure TQExport3DialogF.SetSQLCommitRecCount(const Value: integer);
begin
  if FSQLCommitRecCount <> Value then begin
    FSQLCommitRecCount := Value;
    edSQLCommitRecCount.Text := IntToStr(FSQLCommitRecCount);
  end;
end;

procedure TQExport3DialogF.SetSQLCommitAfterScript(const Value: boolean);
begin
  if FSQLCommitAfterScript <> Value then begin
    FSQLCommitAfterScript := Value;
    chSQLCommitAfterScript.Checked := FSQLCommitAfterScript;
  end;
end;

procedure TQExport3DialogF.SetSQLCommitStatement(const Value: string);
begin
  if AnsiCompareStr(FSQLCommitStatement, Value) <> 0 then begin
    FSQLCommitStatement := Value;
    edSQLCommitStatement.Text := FSQLCommitStatement;
  end;
end;

procedure TQExport3DialogF.SetSQLStatementTerm(const Value: string);
begin
  if AnsiCompareStr(FSQLStatementTerm, Value) <> 0 then begin
    FSQLStatementTerm := Value;
    edSQLStatementTerm.Text := FSQLStatementTerm;
  end;
end;

procedure TQExport3DialogF.SetTXTAutoCalcColWidth(const Value: boolean);
begin
  if FTXTAutoCalcColWidth <> Value then begin
    FTXTAutoCalcColWidth := Value;
    chTXTAutoCalcColWidth.Checked := FTXTAutoCalcColWidth;
  end;
end;

procedure TQExport3DialogF.SetTXTSpacing(const Value: integer);
begin
  if FTXTSpacing <> Value then begin
    FTXTSpacing := Value;
    edTXTSpacing.Text := IntToStr(FTXTSpacing);
  end;
end;

procedure TQExport3DialogF.SetCSVQuoteStrings(const Value: boolean);
begin
  if FCSVQuoteStrings <> Value then begin
    FCSVQuoteStrings := Value;
    chCSVQuoteStrings.Checked := FCSVQuoteStrings;
  end;
end;

procedure TQExport3DialogF.SetCSVComma(const Value: char);
begin
  if FCSVComma <> Value then begin
    FCSVComma := Value;
    edCSVComma.Text := Char2Str(FCSVComma);
  end;
end;

procedure TQExport3DialogF.SetCSVQuote(const Value: char);
begin
  if FCSVQuote <> Value then begin
    FCSVQuote := Value;
    edCSVQuote.Text := Char2Str(FCSVQuote);
  end;
end;

procedure TQExport3DialogF.InitializeDialog;
var
  i: integer;
begin
  FillExportTypeStringArray;
  FillExportTypeFilterArray;

  Pages.ActivePage := tshExportType;
  pcExportType.ActivePage := tshExportFormats;

  ActiveControl := edFileName;

  tshExportOptions.TabVisible := coOptions in CommonOptions;
  FillFields;
  ResetStandardFormats;

  memHeader.Lines.Assign(Dialog.Header);
  memFooter.Lines.Assign(Dialog.Footer);

  SetCaptions;

  FileName := Dialog.FileName;
  ShowFile := Dialog.ShowFile;
  PrintFile := Dialog.PrintFile;
  OptionsFileName := Dialog.OptionsFileName;
  GoToFirstRecord := Dialog.GoToFirstRecord;
  CurrentRecordOnly := Dialog.CurrentRecordOnly;
  ExportEmpty := Dialog.ExportEmpty;
  ExportRecCount := Dialog.ExportRecCount;
  SkipRecCount := Dialog.SkipRecCount;
  FillAllowedExports;

  rgExportType.OnClick(nil);

  rbExportOnly.Checked := Dialog.ExportRecCount > 0;

  miSaveOptions.Enabled := SaveLoadButtons;
  miSaveOptions.Visible := SaveLoadButtons;
  miLoadOptions.Enabled := SaveLoadButtons;
  miLoadOptions.Visible := SaveLoadButtons;
  bTools.Enabled := miSaveOptions.Enabled or miLoadOptions.Enabled;
  bTools.Visible := miSaveOptions.Visible or miLoadOptions.Visible;

  cbxFormatFields.OnChange(nil);

  // Captions
  AllowCaptions := Dialog.AllowCaptions;
  FCaptionRow := -1;
  CaptionRow := Dialog.CaptionRow;
  laCaptionRow.Visible := Assigned(Dialog.StringGrid) and
    (Dialog.ExportSource = esStringGrid);
  edCaptionRow.Visible := laCaptionRow.Visible;
  if laCaptionRow.Visible and (CaptionRow > -1) then LoadStringGridCaption;

  // RTF
  RTFPageOrientation := Dialog.RTFOptions.PageOrientation;
  RTFStripType := Dialog.RTFOptions.StripType;
  cbRTFFont.Items.Assign(Screen.Fonts);

  // XLS
  pcXLS.ActivePage := tshXLSDataFormat;
  pcXLSDataFormat.ActivePage := tshXLSFont;
  cbxXLSFont.Items.Assign(Screen.Fonts);
  XLSPageHeader := Dialog.XLSOptions.PageHeader;
  XLSPageFooter := Dialog.XLSOptions.PageFooter;
  XLSSheetTitle := Dialog.XLSOptions.SheetTitle;
  XLSStripType := Dialog.XLSOptions.StripType;
  XLSAutoCalcColWidth := Dialog.XLSOptions.AutoCalcColWidth;
  XLSPageBackground := Dialog.XLSOptions.PageBackground;
  pcXLSFormats.ActivePage := tshXLSFields;
  pcXLSNotes.ActivePage := tshXLSNoteBase;
  pcXLSCharts.ActivePage := tshXLSChartBase; 
  XLSShowStyleButtons;
  for i := 0 to pcXLSExtensions.PageCount - 1 do
    pcXLSExtensions.Pages[i].Parent := paXLSExtensionsClient;
  cbXLSNoteFont.Items.Assign(Screen.Fonts);
  FXLSDataFormatPageIndex := 0;
  FXLSCellsPageIndex := 0;

  // HTML
  pcHTML.ActivePage := tshHTMLPreview;
  cbxHTMLFontName.Items.Assign(Screen.Fonts);

  HTMLTitle := Dialog.HTMLPageOptions.Title;
  HTMLBackgroundColor := Dialog.HTMLPageOptions.BackgroundColor;
  HTMLFontName := Dialog.HTMLPageOptions.TextFont.Name;
  HTMLLinkColor := Dialog.HTMLPageOptions.LinkColor;
  HTMLVLinkColor := Dialog.HTMLPageOptions.VLinkColor;
  HTMLALinkColor := Dialog.HTMLPageOptions.ALinkColor;
  HTMLBackground := Dialog.HTMLPageOptions.BackgroundFileName;
  HTMLBodyAdvanced := Dialog.HTMLPageOptions.AdvancedAttributes.Text;
  HTMLUsingCSS := Dialog.HTMLPageOptions.UsingCSS;
  HTMLCSSFileName := Dialog.HTMLPageOptions.CSSFileName;
  HTMLOverwriteCSSFile := Dialog.HTMLPageOptions.OverwriteCSSFile;

  HTMLUseMultiFileExport := Dialog.HTMLMultiFileOptions.FileRecCount > 0;
  HTMLFileRecCount := Dialog.HTMLMultiFileOptions.FileRecCount;
  HTMLGenerateIndex := Dialog.HTMLMultiFileOptions.GenerateIndex;

  HTMLIndexLinkTemplate := Dialog.HTMLMultiFileOptions.IndexLinkTemplate;
  HTMLNavigationOnTop := Dialog.HTMLMultiFileOptions.NavigationOnTop;
  HTMLNavigationOnBottom := Dialog.HTMLMultiFileOptions.NavigationOnBottom;
  HTMLIndexLinkTitle := Dialog.HTMLMultiFileOptions.IndexLinkTitle;
  HTMLFirstLinkTitle := Dialog.HTMLMultiFileOptions.FirstLinkTitle;
  HTMLPriorLinkTitle := Dialog.HTMLMultiFileOptions.PriorLinkTitle;
  HTMLNextLinkTitle := Dialog.HTMLMultiFileOptions.NextLinkTitle;
  HTMLLastLinkTitle := Dialog.HTMLMultiFileOptions.LastLinkTitle;
  HTMLUpdateMultifileControls;

  HTMLBorderWidth := Dialog.HTMLTableOptions.BorderWidth;
  HTMLCellPadding := Dialog.HTMLTableOptions.CellPadding;
  HTMLCellSpacing := Dialog.HTMLTableOptions.CellSpacing;
  HTMLTableAdvanced := Dialog.HTMLTableOptions.AdvancedAttributes.Text; 
  HTMLHeadBackgroundColor := Dialog.HTMLTableOptions.HeadersRowBgColor;
  HTMLHeadFontColor := Dialog.HTMLTableOptions.HeadersRowFontColor;
  HTMLEvenRowBackgroundColor := Dialog.HTMLTableOptions.TableBgColor;
  HTMLDataFontColor := Dialog.HTMLTableOptions.TableFontColor;
  HTMLOddRowBackgroundColor := Dialog.HTMLTableOptions.OddRowBgColor;
  HTMLTableBackground := Dialog.HTMLTableOptions.BackgroundFileName;

  HTMLFillColors;

  cbxHTMLTemplate.ItemIndex := Integer(HTMLExp.HTMLTemplate);
  cbxHTMLTemplate.OnChange(nil);

  // XML
  XMLStandAlone := Dialog.XMLOptions.Standalone;
  XMLEncoding := Dialog.XMLOptions.Encoding; 

  // SQL
  SQLTableName := Dialog.SQLOptions.TableName;
  SQLCreateTable := Dialog.SQLOptions.CreateTable;
  SQLCommitRecCount := Dialog.SQLOptions.CommitRecCount;
  SQLCommitAfterScript := Dialog.SQLOptions.CommitAfterScript;
  SQLCommitStatement := Dialog.SQLOptions.CommitStatement;
  SQLStatementTerm := Dialog.SQLOptions.StatementTerm;

  // ASCII
  TXTAutoCalcColWidth := Dialog.TXTOptions.AutoCalcColWidth;
  TXTSpacing := Dialog.TXTOptions.ColSpacing;
  CSVQuoteStrings := Dialog.CSVOptions.QuoteStrings;
  CSVComma := Dialog.CSVOptions.Comma;
  CSVQuote := Dialog.CSVOptions.Quote; 

  // PDF
  PDFColSpacing := Dialog.PDFOptions.ColSpacing;
  PDFRowSpacing := Dialog.PDFOptions.RowSpacing;
  PDFGridLineWidth := Dialog.PDFOptions.GridLineWidth;

  PDFPageFormat := Dialog.PDFOptions.PageOptions.Format;
  PDFPageUnits := Dialog.PDFOptions.PageOptions.Units;
  PDFPageOrientation := Dialog.PDFOptions.PageOptions.Orientation;
  if PDFPageFormat = pfUser then
  begin
    FPDFPageWidth :=
      Units2Dot(PDFPageUnits, Dialog.PDFOptions.PageOptions.Width);
    FPDFPageHeight :=
      Units2Dot(PDFPageUnits, Dialog.PDFOptions.PageOptions.Height);
  end;
  FPDFPageMarginLeft :=
    Units2Dot(PDFPageUnits, Dialog.PDFOptions.PageOptions.MarginLeft);
  FPDFPageMarginRight :=
    Units2Dot(PDFPageUnits, Dialog.PDFOptions.PageOptions.MarginRight);
  FPDFPageMarginTop :=
    Units2Dot(PDFPageUnits, Dialog.PDFOptions.PageOptions.MarginTop);
  FPDFPageMarginBottom :=
    Units2Dot(PDFPageUnits, Dialog.PDFOptions.PageOptions.MarginBottom);

  edPDFPageWidth.Text := FormatFloat(GetPDFPageSizeFormat, PDFPageWidth);
  edPDFPageHeight.Text := FormatFloat(GetPDFPageSizeFormat, PDFPageHeight);
  edPDFPageMarginLeft.Text := FormatFloat(GetPDFPageSizeFormat, PDFPageMarginLeft);
  edPDFPageMarginRight.Text := FormatFloat(GetPDFPageSizeFormat, PDFPageMarginRight);
  edPDFPageMarginTop.Text := FormatFloat(GetPDFPageSizeFormat, PDFPageMarginTop);
  edPDFPageMarginBottom.Text := FormatFloat(GetPDFPageSizeFormat, PDFPageMarginBottom);

  FPDFFontItem := nil;
  PDFExp.Options.HeaderFont.Assign(Dialog.PDFOptions.HeaderFont);
  PDFExp.Options.CaptionFont.Assign(Dialog.PDFOptions.CaptionFont);
  PDFExp.Options.DataFont.Assign(Dialog.PDFOptions.DataFont);
  PDFExp.Options.FooterFont.Assign(Dialog.PDFOptions.FooterFont);
  PDFFillFontList;

  if AutoLoadOptions and (OptionsFileName <> EmptyStr)
    then LoadExportOptions(OptionsFileName);

  if Assigned(Dialog.OnGetHeader) then
    Dialog.OnGetHeader(Self, memHeader.Lines);
  if Assigned(Dialog.OnGetFooter) then
    Dialog.OnGetFooter(Self, memFooter.Lines);
end;

procedure TQExport3DialogF.ShowTitle;
begin
  Caption := {$IFDEF WIN32}QExportLoadStr(QED_Title){$ENDIF}
             {$IFDEF LINUX}QED_Title{$ENDIF};
  if FileName <> EmptyStr
    then Caption := Format({$IFDEF WIN32}QExportLoadStr(QED_AdvancedTitle){$ENDIF}
                           {$IFDEF LINUX}QED_AdvancedTitle{$ENDIF}, [ExtractFileName(FileName)]);
end;

function TQExport3DialogF.RunColorEditor(CurrColor: TColor): TColor;
begin
  Result := CurrColor;
  ColorDialog.Color := CurrColor;
  if ColorDialog.Execute then
    Result := ColorDialog.Color;
end;

procedure TQExport3DialogF.ChangeFileExtension;
begin
  if not AutoChangeFileExt then Exit;
  if ExportType = aeClipboard then Exit;
  if FileName <> EmptyStr then
    FileName := ChangeFileExt(FileName, '.' +
      ExportTypeExtension[ExportType]);
end;

procedure TQExport3DialogF.FillAllowedExports;
var
  ae: TAllowedExport;
begin
  rgExportType.Items.BeginUpdate;
  try
    rgExportType.Items.Clear;
    for ae := Low(TAllowedExport) to High(TAllowedExport) do
      if ae in Dialog.AllowedExports then
        rgExportType.Items.AddObject(ExportTypeString[ae], TObject(Integer(ae)));
    rgExportType.ItemIndex := 0;
  finally
    rgExportType.Items.EndUpdate;
  end;
end;

procedure TQExport3DialogF.ResetStandardFormats;
begin
  IntegerFmt := Dialog.Formats.IntegerFormat;
  FloatFmt := Dialog.Formats.FloatFormat;
  DateFmt := Dialog.Formats.DateFormat;
  TimeFmt := Dialog.Formats.TimeFormat;
  DateTimeFmt := Dialog.Formats.DateTimeFormat;
  CurrencyFmt := Dialog.Formats.CurrencyFormat;
  BooleanTrue := Dialog.Formats.BooleanTrue;
  BooleanFalse := Dialog.Formats.BooleanFalse;
  NullString := Dialog.Formats.NullString;
end;

procedure TQExport3DialogF.FillFields;
var
  i, j: Integer;
  Node, Node2: TTreeNode;
begin
  lstAvailableFields.Items.BeginUpdate;
  lstXLSFields.Items.BeginUpdate;
  lstXLSOptions.Items.BeginUpdate;
  lstXLSStyles.Items.BeginUpdate;
  tvXLSExtensions.Items.BeginUpdate;
  lstRTFBaseStyles.Items.BeginUpdate;
  lstRTFStripStyles.Items.BeginUpdate;
  try
    lstAvailableFields.Items.Clear;
    lstXLSFields.Items.Clear;
    // xls options
    for i := 0 to 4 do
      with lstXLSOptions.Items.Add do begin
        Data := TxlsFieldFormat.Create(nil);
        case i of
          0: begin
            Caption := {$IFDEF WIN32}QExportLoadStr(QED_XLS_HEADER){$ENDIF}
                       {$IFDEF LINUX}QED_XLS_HEADER{$ENDIF};
            TxlsFormat(Data).Assign(Dialog.XLSOptions.HeaderFormat);
          end;
          1: begin
            Caption := {$IFDEF WIN32}QExportLoadStr(QED_XLS_CAPTION){$ENDIF}
                       {$IFDEF LINUX}QED_XLS_CAPTION{$ENDIF};
            TxlsFormat(Data).Assign(Dialog.XLSOptions.CaptionFormat);
          end;
          2: begin
            Caption := {$IFDEF WIN32}QExportLoadStr(QED_XLS_AGGREGATE){$ENDIF}
                       {$IFDEF LINUX}QED_XLS_AGGREGATE{$ENDIF};
            TxlsFormat(Data).Assign(Dialog.XLSOptions.AggregateFormat);
          end;
          3: begin
            Caption := {$IFDEF WIN32}QExportLoadStr(QED_XLS_FOOTER){$ENDIF}
                       {$IFDEF LINUX}QED_XLS_FOOTER{$ENDIF};
            TxlsFormat(Data).Assign(Dialog.XLSOptions.FooterFormat);
          end;
          4: begin
            Caption := {$IFDEF WIN32}QExportLoadStr(QED_XLS_HYPERLINK){$ENDIF}
                       {$IFDEF LINUX}QED_XLS_HYPERLINK{$ENDIF};
            TxlsFormat(Data).Assign(Dialog.XLSOptions.HyperlinkFormat);
          end;
        end;
        ImageIndex := 3;
      end;

    // rtf styles
    for i := 0 to 3 do
      with lstRTFBaseStyles.Items.Add do begin
        Data := TrtfStyle.Create(nil);
        case i of
          0: begin
            Caption := {$IFDEF WIN32}QExportLoadStr(QED_RTF_HEADER){$ENDIF}
                       {$IFDEF LINUX}QED_RTF_HEADER{$ENDIF};
            TrtfStyle(Data).Assign(Dialog.RTFOptions.HeaderStyle);
          end;
          1: begin
            Caption := {$IFDEF WIN32}QExportLoadStr(QED_RTF_CAPTION){$ENDIF}
                       {$IFDEF LINUX}QED_RTF_CAPTION{$ENDIF};
            TrtfStyle(Data).Assign(Dialog.RTFOptions.CaptionStyle);
          end;
          2: begin
            Caption := {$IFDEF WIN32}QExportLoadStr(QED_RTF_DATA){$ENDIF}
                       {$IFDEF LINUX}QED_RTF_DATA{$ENDIF};
            TrtfStyle(Data).Assign(Dialog.RTFOptions.DataStyle);
          end;
          3: begin
            Caption := {$IFDEF WIN32}QExportLoadStr(QED_RTF_FOOTER){$ENDIF}
                       {$IFDEF LINUX}QED_RTF_FOOTER{$ENDIF};
            TrtfStyle(Data).Assign(Dialog.RTFOptions.FooterStyle);
          end;
        end;
        ImageIndex := 3;
      end;

    // columns
    cbXLSChartCategoryLabelColumn.Items.Clear;
    cbXLSSeriesColumn.Items.Clear;
    for i := 0 to Dialog.Columns.Count - 1 do begin
      cbXLSChartCategoryLabelColumn.Items.Add(Dialog.Columns[i].Name);
      cbXLSSeriesColumn.Items.Add(Dialog.Columns[i].Name); 
      with lstAvailableFields.Items.Add do begin
        Caption := Dialog.Columns[i].Name;
        Data := Pointer(i);
        ImageIndex := 0;
      end;
      with lstXLSFields.Items.Add do begin
        Caption := Dialog.Columns[i].Name;
        Data := TxlsFieldFormat.Create(nil);
        TxlsFieldFormat(Data).FieldName := Dialog.Columns[i].Name;
        j := Dialog.XLSOptions.FieldFormats.IndexByName(Dialog.Columns[i].Name);
        if j > -1
          then TxlsFieldFormat(Data).Assign(Dialog.XLSOptions.FieldFormats[j])
          else TxlsFieldFormat(Data).Assign(Dialog.XLSOptions.DataFormat);

        //!!!
        if not Dialog.Columns[i].IsBlob
          then ImageIndex := 1
          else ImageIndex := 0;
      end;

      if Dialog.Columns[i].ColType in [ectInteger, ectBigint, ectFloat, ectCurrency,
           ectDate, ectTime, ectDateTime]
        then cbxFormatFields.Items.AddObject(Dialog.Columns[i].Name,
          Pointer(Integer(Dialog.Columns[i].ColType)));

      if Dialog.Columns[i].AllowFormat and
         not Dialog.Columns[i].IsDefaultFormat then
        with lstUserFormats.Items.Add do begin
          Caption := Dialog.Columns[i].Name;
          SubItems.Add('=');
          SubItems.Add(Dialog.Columns[i].Format);
          ImageIndex := 2;
        end;

      sgrCaptions.Cells[0, i + 1] := Dialog.Columns[i].Name;
      sgrCaptions.Cells[1, i + 1] := Dialog.Columns[i].Caption;
      sgrCaptions.RowCount := sgrCaptions.RowCount + 1;
    end;

    // xls styles
    for i := 0 to Dialog.XLSOptions.StripStyles.Count - 1 do
      with lstXLSStyles.Items.Add do begin
        Caption := {$IFDEF WIN32}QExportLoadStr(QED_XLS_StyleItem){$ENDIF}
                   {$IFDEF LINUX}QED_XLS_StyleItem{$ENDIF} + IntToStr(lstXLSStyles.Items.Count);
        Data := TxlsFormat.Create(nil);
        TxlsFormat(Data).Assign(Dialog.XLSOptions.StripStyles[i]);
        ImageIndex := 2;
      end;

    // xls extensions
    tvXLSExtensions.Items.Clear;
    // hyperlinks
    FXLSHyperlinkNode := tvXLSExtensions.Items.Add(nil, {$IFDEF WIN32}QExportLoadStr(QED_XLS_Hyperlinks){$ENDIF}
                                                        {$IFDEF LINUX}QED_XLS_Hyperlinks{$ENDIF});
    with FXLSHyperlinkNode do begin
      ImageIndex := xlsHyperlink;
      SelectedIndex := xlsHyperlink;
    end;
    for i := 0 to Dialog.XLSOptions.Hyperlinks.Count - 1 do
      with tvXLSExtensions.Items.AddChild(FXLSHyperlinkNode,
           Dialog.XLSOptions.Hyperlinks[i].DisplayName) do begin
        ImageIndex := xlsHyperlink;
        SelectedIndex := xlsHyperlink;
        Data := TxlsHyperlink.Create(nil);
        TxlsHyperlink(Data).Assign(Dialog.XLSOptions.Hyperlinks[i]);
      end;
    FXLSHyperlinkNode.Expand(false);
    // notes
    FXLSNoteNode := tvXLSExtensions.Items.Add(nil, {$IFDEF WIN32}QExportLoadStr(QED_XLS_Notes){$ENDIF}
                                                   {$IFDEF LINUX}QED_XLS_Notes{$ENDIF});
    with FXLSNoteNode do begin
      ImageIndex := xlsNote;
      SelectedIndex := xlsNote;
    end;
    for i := 0 to Dialog.XLSOptions.Notes.Count - 1 do
      with tvXLSExtensions.Items.AddChild(FXLSNoteNode,
           Dialog.XLSOptions.Notes[i].DisplayName) do begin
        ImageIndex := xlsNote;
        SelectedIndex := xlsNote;
        Data := TxlsNote.Create(nil);
        TxlsNote(Data).Assign(Dialog.XLSOptions.Notes[i]);
      end;
    FXLSNoteNode.Expand(false);
    // charts
    FXLSChartNode := tvXLSExtensions.Items.Add(nil, {$IFDEF WIN32}QExportLoadStr(QED_XLS_Charts){$ENDIF}
                                                    {$IFDEF LINUX}QED_XLS_Charts{$ENDIF});
    with FXLSChartNode do begin
      ImageIndex := xlsChart;
      SelectedIndex := xlsChart;
    end;
    for i := 0 to Dialog.XLSOptions.Charts.Count - 1 do begin
      Node := tvXLSExtensions.Items.AddChild(FXLSChartNode,
           Dialog.XLSOptions.Charts[i].DisplayName);
      with Node do begin
        ImageIndex := xlsChart;
        SelectedIndex := xlsChart;
        Data := TxlsChart.Create(nil);
        TxlsChart(Data).Assign(Dialog.XLSOptions.Charts[i]);
      end;
      Node2 := tvXLSExtensions.Items.AddChild(Node, {$IFDEF WIN32}QExportLoadStr(QED_XLS_Series_DefaultTitle){$ENDIF}
                                                    {$IFDEF LINUX}QED_XLS_Series_DefaultTitle{$ENDIF});
      with Node2 do begin
        ImageIndex := xlsSeries;
        SelectedIndex := xlsSeries;
      end;
      for j := 0 to TxlsChart(Node.Data).Series.Count - 1 do
        with tvXLSExtensions.Items.AddChild(Node2, TxlsChart(Node.Data).Series[j].DisplayName) do begin
          ImageIndex := xlsSeries;
          SelectedIndex := xlsSeries;
          Data := TxlsChart(Node.Data).Series[j];
        end;
    end;
    FXLSChartNode.Expand(false);
    // cells
    FXLSCellNode := tvXLSExtensions.Items.Add(nil, {$IFDEF WIN32}QExportLoadStr(QED_XLS_Cells){$ENDIF}
                                                   {$IFDEF LINUX}QED_XLS_Cells{$ENDIF});
    with FXLSCellNode do begin
      ImageIndex := xlsCell;
      SelectedIndex := xlsCell;
    end;
    for i := 0 to Dialog.XLSOptions.Cells.Count - 1 do
      with tvXLSExtensions.Items.AddChild(FXLSCellNode,
           Dialog.XLSOptions.Cells[i].DisplayName) do begin
        ImageIndex := xlsCell;
        SelectedIndex := xlsCell;
        Data := TxlsCell.Create(nil);
        TxlsCell(Data).Assign(Dialog.XLSOptions.Cells[i]);
      end;
    FXLSCellNode.Expand(false);
    // merged cells
    FXLSMergedCellNode := tvXLSExtensions.Items.Add(nil, {$IFDEF WIN32}QExportLoadStr(QED_XLS_MergedCells){$ENDIF}
                                                         {$IFDEF LINUX}QED_XLS_MergedCells{$ENDIF});
    with FXLSMergedCellNode do begin
      ImageIndex := xlsMergedCell;
      SelectedIndex := xlsMergedCell;
    end;
    for i := 0 to Dialog.XLSOptions.Cells.Count - 1 do
      with tvXLSExtensions.Items.AddChild(FXLSMergedCellNode,
           Dialog.XLSOptions.MergedCells[i].DisplayName) do begin
        ImageIndex := xlsMergedCell;
        SelectedIndex := xlsMergedCell;
        Data := TxlsMergedCells.Create(nil);
        TxlsMergedCells(Data).Assign(Dialog.XLSOptions.MergedCells[i]);
      end;
    FXLSMergedCellNode.Expand(false);

    // rtf styles
    for i := 0 to Dialog.RTFOptions.StripStyles.Count - 1 do
      with lstRTFStripStyles.Items.Add do begin
        Caption := {$IFDEF WIN32}QExportLoadStr(QED_RTF_StyleItem){$ENDIF}
                   {$IFDEF LINUX}QED_RTF_StyleItem{$ENDIF} + IntToStr(lstRTFStripStyles.Items.Count);
        Data := TrtfStyle.Create(nil);
        TrtfStyle(Data).Assign(Dialog.RTFOptions.StripStyles[i]);
        ImageIndex := 2;
      end;

    if sgrCaptions.RowCount > 1 then
      sgrCaptions.RowCount := sgrCaptions.RowCount - 1;

    if lstAvailableFields.Items.Count > 0 then begin
      lstAvailableFields.Items[0].Focused := true;
      lstAvailableFields.Items[0].Selected := true;
    end;
    if lstXLSFields.Items.Count > 0 then begin
      lstXLSFields.Items[0].Focused := true;
      lstXLSFields.Items[0].Selected := true;
    end;
    if lstXLSOptions.Items.Count > 0 then begin
      lstXLSOptions.Items[0].Focused := true;
      lstXLSOptions.Items[0].Selected := true;
    end;
    if lstXLSStyles.Items.Count > 0 then begin
      lstXLSStyles.Items[0].Focused := true;
      lstXLSStyles.Items[0].Selected := true;
    end;
    if lstRTFBaseStyles.Items.Count > 0 then begin
      lstRTFBaseStyles.Items[0].Focused := true;
      lstRTFBaseStyles.Items[0].Selected := true;
    end;
    if lstRTFStripStyles.Items.Count > 0 then begin
      lstRTFStripStyles.Items[0].Focused := true;
      lstRTFStripStyles.Items[0].Selected := true;
    end;
  finally
    lstXLSOptions.Items.EndUpdate;
    lstXLSFields.Items.EndUpdate;
    lstAvailableFields.Items.EndUpdate;
    lstXLSStyles.Items.EndUpdate;
    tvXLSExtensions.Items.EndUpdate;
    lstRTFBaseStyles.Items.EndUpdate;
    lstRTFStripStyles.Items.EndUpdate;
  end;
end;

procedure TQExport3DialogF.edFileNameChange(Sender: TObject);
begin
  FileName := edFileName.Text;
  ShowButtons;
end;

procedure TQExport3DialogF.bBrowseClick(Sender: TObject);
begin
  sdExportFile.FileName := FileName;
  if sdExportFile.Execute then FileName := sdExportFile.FileName;
end;

procedure TQExport3DialogF.FormCreate(Sender: TObject);
begin
  InitializeDialog;
end;

procedure TQExport3DialogF.FormDestroy(Sender: TObject);
var
  i: integer;
begin
  for i := 0 to pcXLSExtensions.PageCount - 1 do
    pcXLSExtensions.Pages[i].Parent := pcXLSExtensions;
end;

procedure TQExport3DialogF.FormShow(Sender: TObject);
begin
  ShowTitle;
end;

procedure TQExport3DialogF.rgExportTypeClick(Sender: TObject);
begin
  if ExportType <> aeClipboard then begin
    sdExportFile.Filter := ExportTypeFilter[ExportType];
    sdExportFile.DefaultExt := ExportTypeExtension[ExportType];
  end;
  ChangeFileExtension;

  if not IsCompatiblePage then Pages.ActivePage := tshExportType;

  bBrowse.Enabled := ExportType <> aeClipboard;
  laFileName.Enabled := ExportType <> aeClipboard;
  edFileName.Enabled := ExportType <> aeClipboard;
  chShowFile.Enabled := ExportType <> aeClipboard;

   //William M. Santos- Foi passado false para as tabs para não
   //ser apresentadas na hora da execução do componente

  tshHTML.TabVisible  := false;// - ExportType = aeHTML;
  tshXLS.TabVisible   := false;// - ExportType = aeXLS;
  tshSQL.TabVisible   := false;// - ExportType = aeSQL;
  tshRTF.TabVisible   := false; // - ExportType in [aeWord, aeRTF];
  tshXML.TabVisible   := false;// - ExportType = aeXML;
  tshASCII.TabVisible := false;// - ExportType in [aeTXT, aeCSV];
  tshPDF.TabVisible   := false;// - ExportType = aePDF;

  tshFormats.TabVisible := (not (ExportType in [aeDBF, aeSQL])) and
    (coFormats in CommonOptions);
  tshFields.TabVisible := (coFields in CommonOptions);
  tshCaptions.TabVisible := (not (ExportType in [aeXML, aeDBF, aeSQL])) and
    (coCaptions in CommonOptions);
  tshHeaderFooter.TabVisible := (not (ExportType in [aeXML, aeDBF])) and
    (coColons in CommonOptions);
  ShowButtons;
  MakeStringGrid;
end;

procedure TQExport3DialogF.chShowFileClick(Sender: TObject);
begin
  ShowFile := chShowFile.Checked;
end;

procedure TQExport3DialogF.chPrintFileClick(Sender: TObject);
begin
  PrintFile := chPrintFile.Checked;
end;

procedure TQExport3DialogF.chGoToFirstRecordClick(Sender: TObject);
begin
  GoToFirstRecord := chGoToFirstRecord.Checked;
end;

procedure TQExport3DialogF.chCurrentRecordOnlyClick(Sender: TObject);
begin
  CurrentRecordOnly := chCurrentRecordOnly.Checked;
end;

procedure TQExport3DialogF.chExportEmptyClick(Sender: TObject);
begin
  ExportEmpty := chExportEmpty.Checked;
end;

procedure TQExport3DialogF.edExportRecCountChange(Sender: TObject);
begin
  try ExportRecCount := StrToInt(edExportRecCount.Text) except end;
end;

procedure TQExport3DialogF.edSkipRecCountChange(Sender: TObject);
begin
  try SkipRecCount := StrToInt(edSkipRecCount.Text) except end;
end;

procedure TQExport3DialogF.ShowButtons;
begin
  bStart.Enabled := (FileName <> EmptyStr) or (ExportType = aeClipboard);
end;

procedure TQExport3DialogF.MakeStringGrid;
var
  i, j: integer;
begin
  case ExportType of
    aeTXT, aeRTF, aeWord, aePDF: begin
      sgrCaptions.ColCount := 4;
      sgrCaptions.ColWidths[0] := 150;
      sgrCaptions.ColWidths[1] := 150;
      sgrCaptions.ColWidths[2] := 78;
      sgrCaptions.ColWidths[3] := 60;              //William texto
      tshCaptions.Caption := 'Descrição do Campo'; //{$IFDEF WIN32}QExportLoadStr(QED_Captions_Caption){$ENDIF}
                             //{$IFDEF LINUX}QED_Captions_Caption{$ENDIF} + ' && ' +
                             //{$IFDEF WIN32}QExportLoadStr(QED_Captions_Width){$ENDIF}
                             //{$IFDEF LINUX}QED_Captions_Width{$ENDIF} + ' && ' +
                             //{$IFDEF WIN32}QExportLoadStr(QED_Captions_Align){$ENDIF}
                             //{$IFDEF LINUX}QED_Captions_Align{$ENDIF};
    end;
    aeHTML, aeXLS: begin
      sgrCaptions.ColCount := 3;
      sgrCaptions.ColWidths[0] := 181;
      sgrCaptions.ColWidths[1] := 181;
      sgrCaptions.ColWidths[2] := 78;
      if ExportType = aeHTML
        then tshCaptions.Caption := 'Descrição do Campo'//{$IFDEF WIN32}QExportLoadStr(QED_Captions_Caption){$ENDIF}
                                    //{$IFDEF LINUX}QED_Captions_Caption{$ENDIF} + ' && ' +
                                   // {$IFDEF WIN32}QExportLoadStr(QED_Captions_Align){$ENDIF}
                                    //{$IFDEF LINUX}QED_Captions_Align{$ENDIF}
        else tshCaptions.Caption := 'Descrição do Campo';//{$IFDEF WIN32}QExportLoadStr(QED_Captions_Caption){$ENDIF}
                                    //{$IFDEF LINUX}QED_Captions_Caption{$ENDIF} + ' && ' +
                                  //  {$IFDEF WIN32}QExportLoadStr(QED_Captions_Width){$ENDIF}
                                    //{$IFDEF LINUX}QED_Captions_Width{$ENDIF};
    end;
    else begin
      sgrCaptions.ColCount := 2;
      sgrCaptions.ColWidths[0] := 220;
      sgrCaptions.ColWidths[1] := 220;
      tshCaptions.Caption := 'Descrição do Campo'; //{$IFDEF WIN32}QExportLoadStr(QED_Captions_Caption){$ENDIF}
                             //{$IFDEF LINUX}QED_Captions_Caption{$ENDIF};
    end;
  end;

  for i := 0 to Dialog.Columns.Count - 1 do
    for j := 1 to sgrCaptions.RowCount - 1 do
      if AnsiCompareText(Dialog.Columns[i].Name, sgrCaptions.Cells[0, j]) = 0 then begin
        if ExportType in [aeTXT, aeRTF, aeWord, aeHTML, aePDF] then
          case Dialog.Columns[i].ColAlign of
            ecaLeft: sgrCaptions.Cells[2, j] := {$IFDEF WIN32}QExportLoadStr(QED_Align_Left){$ENDIF}
                                                {$IFDEF LINUX}QED_Align_Left{$ENDIF};
            ecaCenter: sgrCaptions.Cells[2, j] := {$IFDEF WIN32}QExportLoadStr(QED_Align_Center){$ENDIF}
                                                  {$IFDEF LINUX}QED_Align_Center{$ENDIF};
            ecaRight: sgrCaptions.Cells[2, j] := {$IFDEF WIN32}QExportLoadStr(QED_Align_Right){$ENDIF}
                                                 {$IFDEF LINUX}QED_Align_Right{$ENDIF};
          end;
        if ExportType in [aeTXT, aeRTF, aeWord, aeXLS, aePDF] then
          sgrCaptions.Cells[2 + Integer(ExportType <> aeXLS), j] :=
            IntToStr(Dialog.Columns[i].Width);
      end;
end;

procedure TQExport3DialogF.LoadStringGridCaption;
var
  i, N: integer;
begin
  if not Assigned(Dialog.StringGrid) then Exit;
  if CaptionRow > Dialog.StringGrid.RowCount then Exit;
  for i := 0 to sgrCaptions.RowCount - 1 do begin
    N := StrToIntDef(sgrCaptions.Cells[0, i], -1);
    if N > -1 then
      sgrCaptions.Cells[1, i] := Dialog.StringGrid.Cells[N, CaptionRow];
  end;
end;

procedure TQExport3DialogF.bAddOneExportedFieldClick(Sender: TObject);
begin
  if not Assigned(lstAvailableFields.Selected) then Exit;
  with MoveListItem(lstAvailableFields.Selected, lstExportedFields, true, -1) do
    ImageIndex := 1;
  CorrectXLSFieldsList;
end;

procedure TQExport3DialogF.bAddAllExportedFieldClick(Sender: TObject);
var
  i: integer;
begin
  for i := lstAvailableFields.Items.Count - 1 downto 0 do
    with MoveListItem(lstAvailableFields.Items[i], lstExportedFields, true, 0) do
      ImageIndex := 1;
  CorrectXLSFieldsList;
end;

procedure TQExport3DialogF.bDelOneExportedFieldClick(Sender: TObject);
begin
  if not Assigned(lstExportedFields.Selected) then Exit;
  with MoveListItem(lstExportedFields.Selected, lstAvailableFields, true,
    GetIndexOfNewAvailableFields(lstExportedFields.Selected)) do
    ImageIndex := 0;
  CorrectXLSFieldsList;
end;

procedure TQExport3DialogF.bDelAllExportedFieldClick(Sender: TObject);
var
  i: integer;
begin
  for i := lstExportedFields.Items.Count - 1 downto 0 do
    with MoveListItem(lstExportedFields.Items[i], lstAvailableFields, true,
      GetIndexOfNewAvailableFields(lstExportedFields.Items[i])) do
      ImageIndex := 0;
  CorrectXLSFieldsList;
end;

procedure TQExport3DialogF.cbxFormatFieldsChange(Sender: TObject);
var
  str: string;
begin
  cbxUserFormats.Items.BeginUpdate;
  try
    cbxUserFormats.Clear;
    if cbxFormatFields.ItemIndex <> -1 then begin
      case TQExportColType(Integer(cbxFormatFields.Items.Objects[cbxFormatFields.ItemIndex])) of
        ectDateTime: begin
          cbxUserFormats.Items.Add(ShortDateFormat);
          cbxUserFormats.Items.Add(LongDateFormat);
          cbxUserFormats.Items.Add(ShortDateFormat + ' ' + ShortTimeFormat);
          cbxUserFormats.Items.Add(ShortDateFormat + ' ' + LongTimeFormat);
          cbxUserFormats.Items.Add(LongDateFormat + ' ' + ShortTimeFormat);
          cbxUserFormats.Items.Add(LongDateFormat + ' ' + LongTimeFormat);
          cbxUserFormats.Items.Add(ShortTimeFormat);
          cbxUserFormats.Items.Add(LongTimeFormat);
        end;
        ectDate: begin
          cbxUserFormats.Items.Add(ShortDateFormat);
          cbxUserFormats.Items.Add(LongDateFormat);
        end;
        ectTime: begin
          cbxUserFormats.Items.Add(ShortTimeFormat);
          cbxUserFormats.Items.Add(LongTimeFormat);
        end;
        ectInteger,
        ectBigint: begin
          cbxUserFormats.Items.Add('#,###,##0');
          cbxUserFormats.Items.Add('0');
        end;
        ectFloat: begin
          cbxUserFormats.Items.Add('#,###,##0.00');
          cbxUserFormats.Items.Add('#,###,##0.000');
          cbxUserFormats.Items.Add('#,###,##0.0000');
          cbxUserFormats.Items.Add('0.00');
        end;
        ectCurrency: begin
          str := '00.00';
          case SysUtils.CurrencyFormat of
            0: str :=  SysUtils.CurrencyString + str;
            1: str :=  str + SysUtils.CurrencyString;
            2: str :=  SysUtils.CurrencyString + ' ' + str;
            3: str :=  str + ' ' + SysUtils.CurrencyString;
          end;
          cbxUserFormats.Items.Add(str);
        end;
      end;
    end;
    cbxUserFormats.ItemIndex := 0;
  finally
    cbxUserFormats.Items.EndUpdate;
  end;
end;

procedure TQExport3DialogF.bAddUserFormatClick(Sender: TObject);
var
  i: integer;
begin
  if cbxUserFormats.Text = EmptyStr then Exit;
  for i := lstUserFormats.Items.Count - 1 downto 0 do
    if CompareText(cbxFormatFields.Text, lstUserFormats.Items[i].Caption) = 0 then
      lstUserFormats.Items.Delete(i);
  with lstUserFormats.Items.Add do begin
    Caption := cbxFormatFields.Text;
    SubItems.Add('=');
    SubItems.Add(cbxUserFormats.Text);
    Selected := true;
    ImageIndex := 2;
  end;
  ShowFormatButtons;
end;

procedure TQExport3DialogF.ShowFormatButtons;
begin
  bEditUserFormat.Enabled := lstUserFormats.Items.Count > 0;
  bDeleteUserFormat.Enabled := lstUserFormats.Items.Count > 0;
  bClearUserFormats.Enabled := lstUserFormats.Items.Count > 0;
end;

procedure TQExport3DialogF.PagesChange(Sender: TObject);
var
  LI: TListItem;
begin
  if Pages.ActivePage = tshFormats then ShowFormatButtons;

  if (Pages.ActivePage = tshXLS) and (CurrXLSListView <> nil) and
     (CurrXLSListView.Items.Count > 0) then begin
    if not Assigned(CurrXLSListView.Selected)
      then LI := CurrXLSListView.Items[0]
      else LI := CurrXLSListView.Selected;
    if CurrXLSListView.CanFocus then
      CurrXLSListView.SetFocus;
    LI.Focused := true;
    LI.Selected := true;
    CurrXLSListView.OnChange(CurrXLSListView, LI, ctState);
  end
  else if (Pages.ActivePage = tshRTF) and (RTFCurrListView <> nil) and
     (RTFCurrListView.Items.Count > 0) then begin
    if not Assigned(RTFCurrListView.Selected)
      then LI := RTFCurrListView.Items[0]
      else LI := RTFCurrListView.Selected;
    if RTFCurrListView.CanFocus then
      RTFCurrListView.SetFocus;
    LI.Focused := true;
    LI.Selected := true;
    RTFCurrListView.OnChange(RTFCurrListView, LI, ctState);
  end;
end;

procedure TQExport3DialogF.bEditUserFormatClick(Sender: TObject);
var
  OldFormat, NewFormat: string;
begin
  if not Assigned(lstUserFormats.Selected) then Exit;
  OldFormat := lstUserFormats.Selected.SubItems[1];
  NewFormat := InputBox({$IFDEF WIN32}QExportLoadStr(QEM_NewFormatValue){$ENDIF}
                        {$IFDEF LINUX}QEM_NewFormatValue{$ENDIF},
                        {$IFDEF WIN32}QExportLoadStr(QEM_EnterValue){$ENDIF}
                        {$IFDEF LINUX}QEM_EnterValue{$ENDIF}, OldFormat);
  if NewFormat <> OldFormat
    then lstUserFormats.Selected.SubItems[1] := NewFormat;
end;

procedure TQExport3DialogF.bDeleteUserFormatClick(Sender: TObject);
begin
  if not Assigned(lstUserFormats.Selected) then Exit;
  lstUserFormats.Selected.Delete;
  if lstUserFormats.Items.Count > 0 then
    lstUserFormats.Items[0].Selected := true;
  ShowFormatButtons;
end;

procedure TQExport3DialogF.bClearUserFormatsClick(Sender: TObject);
begin
  while Assigned(lstUserFormats.Selected) do
    bDeleteUserFormat.Click;
  ShowFormatButtons;
end;

procedure TQExport3DialogF.HTMLFillColors;
begin
  HTMLBackgroundColor := HTMLExp.HTMLOptions.BackgroundColor;
  HTMLFontColor := HTMLExp.HTMLOptions.TextFont.Color;
  HTMLHeadBackgroundColor := HTMLExp.TableOptions.HeadersRowBgColor;
  HTMLHeadFontColor := HTMLExp.TableOptions.HeadersRowFontColor;
  HTMLOddRowBackgroundColor := HTMLExp.TableOptions.OddRowBgColor;
  HTMLEvenRowBackgroundColor := HTMLExp.TableOptions.TableBgColor;
  HTMLDataFontColor := HTMLExp.TableOptions.TableFontColor;
  HTMLLinkColor := HTMLExp.HTMLOptions.LinkColor;
  HTMLVLinkColor := HTMLExp.HTMLOptions.VLinkColor;
  HTMLALinkColor := HTMLExp.HTMLOptions.ALinkColor;
end;

procedure TQExport3DialogF.HTMLUpdateMultifileControls;
begin
  laHTMLFileRecCount_01.Enabled := HTMLUseMultiFileExport;
  edHTMLFileRecCount.Enabled := HTMLUseMultiFileExport;
  laHTMLFileRecCount_02.Enabled := HTMLUseMultiFileExport;
  chHTMLGenerateIndex.Enabled := HTMLUseMultiFileExport;
  laHTMLIndexLinkTemplate.Enabled := HTMLUseMultifileExport and
    HTMLGenerateIndex;
  edHTMLIndexLinkTemplate.Enabled := HTMLUseMultifileExport and
    HTMLGenerateIndex;
  chHTMLNavigationOnTop.Enabled := HTMLUseMultiFileExport;
  chHTMLNavigationOnBottom.Enabled := HTMLUseMultiFileExport;

  laHTMLIndexLinkTitle.Enabled := HTMLUseMultiFileExport and
    (HTMLNavigationOnTop or HTMLNavigationOnBottom) and
    HTMLGenerateIndex;
  edHTMLIndexLinkTitle.Enabled := HTMLUseMultiFileExport and
    (HTMLNavigationOnTop or HTMLNavigationOnBottom) and
    HTMLGenerateIndex;
  laHTMLFirstLinkTitle.Enabled := HTMLUseMultiFileExport and
    (HTMLNavigationOnTop or HTMLNavigationOnBottom);
  edHTMLFirstLinkTitle.Enabled := HTMLUseMultiFileExport and
    (HTMLNavigationOnTop or HTMLNavigationOnBottom);
  laHTMLPriorLinkTitle.Enabled := HTMLUseMultiFileExport and
    (HTMLNavigationOnTop or HTMLNavigationOnBottom);
  edHTMLPriorLinkTitle.Enabled := HTMLUseMultiFileExport and
    (HTMLNavigationOnTop or HTMLNavigationOnBottom);
  laHTMLNextLinkTitle.Enabled := HTMLUseMultiFileExport and
    (HTMLNavigationOnTop or HTMLNavigationOnBottom);
  edHTMLNextLinkTitle.Enabled := HTMLUseMultiFileExport and
    (HTMLNavigationOnTop or HTMLNavigationOnBottom);
  laHTMLLastLinkTitle.Enabled := HTMLUseMultiFileExport and
    (HTMLNavigationOnTop or HTMLNavigationOnBottom);
  edHTMLLastLinkTitle.Enabled := HTMLUseMultiFileExport and
    (HTMLNavigationOnTop or HTMLNavigationOnBottom);
end;

procedure TQExport3DialogF.chAllowCaptionsClick(Sender: TObject);
begin
  AllowCaptions := chAllowCaptions.Checked;
  sgrCaptions.Enabled := AllowCaptions;
end;

procedure TQExport3DialogF.edCaptionRowExit(Sender: TObject);
begin
  CaptionRow := StrToIntDef(edCaptionRow.Text, CaptionRow);
  LoadStringGridCaption;
end;

procedure TQExport3DialogF.edCaptionRowKeyDown(Sender: TObject;
  var Key: Word; Shift: TShiftState);
begin
  if Key = VK_RETURN then begin
    CaptionRow := StrToIntDef(edCaptionRow.Text, CaptionRow);
    LoadStringGridCaption;
  end;
end;

procedure TQExport3DialogF.sgrCaptionsDrawCell(Sender: TObject; ACol,
  ARow: Integer; Rect: TRect; State: TGridDrawState);
var
  w, h, x, y: integer;
  s: string;
begin
  if ARow = 0 then
    with sgrCaptions.Canvas do begin
      Font.Style := Font.Style + [fsBold];

      case ACol of
        0: s := {$IFDEF WIN32}QExportLoadStr(QED_Captions_FeldName){$ENDIF}
                {$IFDEF LINUX}QED_Captions_FeldName{$ENDIF};
        1: s := {$IFDEF WIN32}QExportLoadStr(QED_Captions_Caption){$ENDIF}
                {$IFDEF LINUX}QED_Captions_Caption{$ENDIF};
        2: if ExportType = aeXLS
             then s := {$IFDEF WIN32}QExportLoadStr(QED_Captions_Width){$ENDIF}
                       {$IFDEF LINUX}QED_Captions_Width{$ENDIF}
             else s := {$IFDEF WIN32}QExportLoadStr(QED_Captions_Align){$ENDIF}
                       {$IFDEF LINUX}QED_Captions_Align{$ENDIF};
        3: s := {$IFDEF WIN32}QExportLoadStr(QED_Captions_Width){$ENDIF}
                {$IFDEF LINUX}QED_Captions_Width{$ENDIF};
      end;

      w := TextWidth(s);
      h := TextHeight(s);
      x := Rect.Left + (Rect.Right  - Rect.Left - w) div 2;
      y := Rect.Top + (Rect.Bottom  - Rect.Top - h) div 2;
      TextOut(x, y, s);
    end;
end;

procedure TQExport3DialogF.SetCustomTemplate;
begin
  cbxHTMLTemplate.ItemIndex := 0;
end;

procedure TQExport3DialogF.bHTMLSaveTemplateClick(Sender: TObject);
begin
  if sdHTMLTemplate.Execute then
    HTMLExp.SaveTemplateToFile(sdHTMLTemplate.FileName);
end;

procedure TQExport3DialogF.bHTMLLoadTemplateClick(Sender: TObject);
begin
  if odHTMLTemplate.Execute then begin
    HTMLExp.LoadTemplateFromFile(odHTMLTemplate.FileName);
    HTMLFillColors;
    SetCustomTemplate;
  end;
end;

procedure TQExport3DialogF.cbxHTMLTemplateChange(Sender: TObject);
begin
  case cbxHTMLTemplate.ItemIndex of
    0: HTMLExp.HTMLTemplate := htCustom;
    else begin
      HTMLExp.HTMLTemplate := THTMLTemplate(cbxHTMLTemplate.ItemIndex);
      HTMLFillColors;
    end;
  end;
end;

procedure TQExport3DialogF.cbxXLSFontChange(Sender: TObject);
var
  Fmt: TxlsFormat;
begin
  Fmt := CurrXLSFormat;
  if not Assigned(Fmt) then Exit;
  
  Fmt.Font.Name := cbxXLSFont.Text;

  if CurrXLSListView <> nil then begin
    if CurrXLSListView.SelCount > 1 then
      ForAllListViewItems(CurrXLSListView, XLSUpdateItemFont, false, false);
    if (CurrXLSListView = lstXLSOptions) and
       (lstXLSOptions.Selected.Index = 4) then
      XLSUpdateHyperlinkFormats;
  end;
  pbXLSCell.Repaint;
end;

procedure TQExport3DialogF.cbxXLSFontSizeChange(Sender: TObject);
var
  Fmt: TxlsFormat;
begin
  Fmt := CurrXLSFormat;
  if not Assigned(Fmt) then Exit;

  Fmt.Font.Size := StrToIntDef(cbxXLSFontSize.Text, 10);

  if CurrXLSListView <> nil then begin
    if CurrXLSListView.SelCount > 1 then
      ForAllListViewItems(CurrXLSListView, XLSUpdateItemFontSize,
        false, false);
    if (CurrXLSListView = lstXLSOptions) and
       (lstXLSOptions.Selected.Index = 4) then
      XLSUpdateHyperlinkFormats;
  end;
  pbXLSCell.Repaint;
end;

procedure TQExport3DialogF.pbFontColorPaint(Sender: TObject);
var
  Fmt: TxlsFormat;
begin
  Fmt := CurrXLSFormat;
  if not Assigned(Fmt) then Exit;

  if (CurrXLSListView <> nil) and (CurrXLSListView.SelCount = 1) then
    PaintXLSColors(pbFontColor,
      TxlsFormat(CurrXLSListView.Selected.Data).Font.Color)
  else PaintXLSColors(pbFontColor, Fmt.Font.Color);
end;

procedure TQExport3DialogF.pbBorderTopPaint(Sender: TObject);
var
  Fmt: TxlsFormat;
begin
  Fmt := CurrXLSFormat;
  if not Assigned(Fmt) then Exit;

  if (CurrXLSListView <> nil) and (CurrXLSListView.SelCount = 1) then
    PaintXLSColors(pbBorderTop,
      TxlsFormat(CurrXLSListView.Selected.Data).Borders.Top.Color)
  else PaintXLSColors(pbBorderTop, Fmt.Borders.Top.Color);
end;

procedure TQExport3DialogF.pbBorderBottomPaint(Sender: TObject);
var
  Fmt: TxlsFormat;
begin
  Fmt := CurrXLSFormat;
  if not Assigned(Fmt) then Exit;

  if (CurrXLSListView <> nil) and (CurrXLSListView.SelCount = 1) then
    PaintXLSColors(pbBorderBottom,
      TxlsFormat(CurrXLSListView.Selected.Data).Borders.Bottom.Color)
  else PaintXLSColors(pbBorderBottom, Fmt.Borders.Bottom.Color);
end;

procedure TQExport3DialogF.pbBorderLeftPaint(Sender: TObject);
var
  Fmt: TxlsFormat;
begin
  Fmt := CurrXLSFormat;
  if not Assigned(Fmt) then Exit;

  if (CurrXLSListView <> nil) and (CurrXLSListView.SelCount = 1) then
    PaintXLSColors(pbBorderLeft,
      TxlsFormat(CurrXLSListView.Selected.Data).Borders.Left.Color)
  else PaintXLSColors(pbBorderLeft, Fmt.Borders.Left.Color);
end;

procedure TQExport3DialogF.pbBorderRightPaint(Sender: TObject);
var
  Fmt: TxlsFormat;
begin
  Fmt := CurrXLSFormat;
  if not Assigned(Fmt) then Exit;

  if (CurrXLSListView <> nil) and (CurrXLSListView.SelCount = 1) then
    PaintXLSColors(pbBorderRight,
      TxlsFormat(CurrXLSListView.Selected.Data).Borders.Right.Color)
  else PaintXLSColors(pbBorderRight, Fmt.Borders.Right.Color);
end;

procedure TQExport3DialogF.pbFillBackgroundPaint(Sender: TObject);
var
  Fmt: TxlsFormat;
begin
  Fmt := CurrXLSFormat;
  if not Assigned(Fmt) then Exit;

  if (CurrXLSListView <> nil) and (CurrXLSListView.SelCount = 1) then
    PaintXLSColors(pbFillBackground,
      TxlsFormat(CurrXLSListView.Selected.Data).Fill.Background)
  else PaintXLSColors(pbFillBackground, Fmt.Fill.Background);
end;

procedure TQExport3DialogF.pbFillForegroundPaint(Sender: TObject);
var
  Fmt: TxlsFormat;
begin
  Fmt := CurrXLSFormat;
  if not Assigned(Fmt) then Exit;

  if (CurrXLSListView <> nil) and (CurrXLSListView.SelCount = 1) then
    PaintXLSColors(pbFillForeground,
      TxlsFormat(CurrXLSListView.Selected.Data).Fill.Foreground)
  else PaintXLSColors(pbFillForeground, Fmt.Fill.Foreground);
end;

procedure TQExport3DialogF.btnFontColorClick(Sender: TObject);
var
  OClr, NClr: TxlsColor;
  Fmt: TxlsFormat;
begin
  Fmt := CurrXLSFormat;
  if not Assigned(Fmt) then Exit;

  OClr := Fmt.Font.Color;
  NClr := RunXLSColorEditor(OClr);
  if NClr <> OClr then begin
    Fmt.Font.Color := NClr;
    if CurrXLSListView <> nil then begin
      if CurrXLSListView.SelCount > 1 then
        ForAllListViewItems(CurrXLSListView, XLSUpdateItemFontColor,
          false, false);
      if (CurrXLSListView = lstXLSOptions) and
         (lstXLSOptions.Selected.Index = 4) then
        XLSUpdateHyperlinkFormats;
    end;
    pbXLSCell.Repaint;
  end;
end;

procedure TQExport3DialogF.btnFontBoldClick(Sender: TObject);
var
  Fmt: TxlsFormat;
begin
  Fmt := CurrXLSFormat;
  if not Assigned(Fmt) then Exit;

  EditFontStyleXLS(Fmt.Font, xfsBold, btnFontBold.Down);

  if CurrXLSListView <> nil then begin
    if CurrXLSListView.SelCount > 1 then
      ForAllListViewItems(CurrXLSListView, XLSUpdateItemFontBold,
        false, false);
    if (CurrXLSListView = lstXLSOptions) and
       (lstXLSOptions.Selected.Index = 4) then
      XLSUpdateHyperlinkFormats;
  end;
  pbXLSCell.Repaint;
end;

procedure TQExport3DialogF.btnFontItalicClick(Sender: TObject);
var
  Fmt: TxlsFormat;
begin
  Fmt := CurrXLSFormat;
  if not Assigned(Fmt) then Exit;

  EditFontStyleXLS(Fmt.Font, xfsItalic, btnFontItalic.Down);

  if CurrXLSListView <> nil then begin
    if CurrXLSListView.SelCount > 1 then
      ForAllListViewItems(CurrXLSListView, XLSUpdateItemFontItalic,
        false, false);
    if (CurrXLSListView = lstXLSOptions) and
       (lstXLSOptions.Selected.Index = 4) then
      XLSUpdateHyperlinkFormats;
  end;
  pbXLSCell.Repaint;
end;

procedure TQExport3DialogF.btnFontStrikeOutClick(Sender: TObject);
var
  Fmt: TxlsFormat;
begin
  Fmt := CurrXLSFormat;
  if not Assigned(Fmt) then Exit;

  EditFontStyleXLS(Fmt.Font, xfsStrikeOut, btnFontStrikeOut.Down);

  if CurrXLSListView <> nil then begin
    if CurrXLSListView.SelCount > 1 then
      ForAllListViewItems(CurrXLSListView, XLSUpdateItemFontStrikeOut,
        false, false);
    if (CurrXLSListView = lstXLSOptions) and
       (lstXLSOptions.Selected.Index = 4) then
      XLSUpdateHyperlinkFormats;
  end;
  pbXLSCell.Repaint;
end;

procedure TQExport3DialogF.btnUnderlineSingleClick(Sender: TObject);
var
  Fmt: TxlsFormat;
begin
  Fmt := CurrXLSFormat;
  if not Assigned(Fmt) then Exit;

  if btnUnderlineSingle.Down
    then Fmt.Font.Underline := fulSingle
    else Fmt.Font.Underline := fulNone;

  if CurrXLSListView <> nil then begin
    if CurrXLSListView.SelCount > 1 then
      ForAllListViewItems(CurrXLSListView, XLSUpdateItemFontUnderline,
        false, false);
    if (CurrXLSListView = lstXLSOptions) and
       (lstXLSOptions.Selected.Index = 4) then
      XLSUpdateHyperlinkFormats;
  end;
  pbXLSCell.Repaint;
end;

procedure TQExport3DialogF.btnUnderlineSingleAccountingClick(Sender: TObject);
var
  Fmt: TxlsFormat;
begin
  Fmt := CurrXLSFormat;
  if not Assigned(Fmt) then Exit;

  if btnUnderlineSingleAccounting.Down
    then Fmt.Font.Underline := fulSingleAccounting
    else Fmt.Font.Underline := fulNone;

  if CurrXLSListView <> nil then begin
    if CurrXLSListView.SelCount > 1 then
      ForAllListViewItems(CurrXLSListView, XLSUpdateItemFontUnderline,
        false, false);
    if (CurrXLSListView = lstXLSOptions) and
       (lstXLSOptions.Selected.Index = 4) then
      XLSUpdateHyperlinkFormats;
  end;
  pbXLSCell.Repaint;
end;

procedure TQExport3DialogF.btnUnderlineDoubleClick(Sender: TObject);
var
  Fmt: TxlsFormat;
begin
  Fmt := CurrXLSFormat;
  if not Assigned(Fmt) then Exit;

  if btnUnderlineDouble.Down
    then Fmt.Font.Underline := fulDouble
    else Fmt.Font.Underline := fulNone;

  if CurrXLSListView <> nil then begin
    if CurrXLSListView.SelCount > 1 then
      ForAllListViewItems(CurrXLSListView, XLSUpdateItemFontUnderline,
        false, false);
    if (CurrXLSListView = lstXLSOptions) and
       (lstXLSOptions.Selected.Index = 4) then
      XLSUpdateHyperlinkFormats;
  end;
  pbXLSCell.Repaint;
end;

procedure TQExport3DialogF.btnUnderlineDoubleAccountingClick(
  Sender: TObject);
var
  Fmt: TxlsFormat;
begin
  Fmt := CurrXLSFormat;
  if not Assigned(Fmt) then Exit;

  if btnUnderlineDoubleAccounting.Down
    then Fmt.Font.Underline := fulDoubleAccounting
    else Fmt.Font.Underline := fulNone;

  if CurrXLSListView <> nil then begin
    if CurrXLSListView.SelCount > 1 then
      ForAllListViewItems(CurrXLSListView, XLSUpdateItemFontUnderline,
        false, false);
    if (CurrXLSListView = lstXLSOptions) and
       (lstXLSOptions.Selected.Index = 4) then
      XLSUpdateHyperlinkFormats;
  end;
  pbXLSCell.Repaint;
end;

procedure TQExport3DialogF.btnHorizontalLeftClick(Sender: TObject);
var
  Fmt: TxlsFormat;
begin
  Fmt := CurrXLSFormat;
  if not Assigned(Fmt) then Exit;

  if btnHorizontalLeft.Down
    then Fmt.Alignment.Horizontal := halLeft
    else Fmt.Alignment.Horizontal := halGeneral;

  if CurrXLSListView <> nil then begin
    if CurrXLSListView.SelCount > 1 then
      ForAllListViewItems(CurrXLSListView, XLSUpdateItemHorAlignment,
        false, false);
    if (CurrXLSListView = lstXLSOptions) and
       (lstXLSOptions.Selected.Index = 4) then
      XLSUpdateHyperlinkFormats;
  end;
  pbXLSCell.Repaint;
end;

procedure TQExport3DialogF.btnHorizontalCenterClick(Sender: TObject);
var
  Fmt: TxlsFormat;
begin
  Fmt := CurrXLSFormat;
  if not Assigned(Fmt) then Exit;

  if btnHorizontalCenter.Down
    then Fmt.Alignment.Horizontal := halCenter
    else Fmt.Alignment.Horizontal := halGeneral;

  if CurrXLSListView <> nil then begin
    if CurrXLSListView.SelCount > 1 then
      ForAllListViewItems(CurrXLSListView, XLSUpdateItemHorAlignment,
        false, false);
    if (CurrXLSListView = lstXLSOptions) and
       (lstXLSOptions.Selected.Index = 4) then
      XLSUpdateHyperlinkFormats;
  end;
  pbXLSCell.Repaint;
end;

procedure TQExport3DialogF.btnHorizontalRightClick(Sender: TObject);
var
  Fmt: TxlsFormat;
begin
  Fmt := CurrXLSFormat;
  if not Assigned(Fmt) then Exit;

  if btnHorizontalRight.Down
    then Fmt.Alignment.Horizontal := halRight
    else Fmt.Alignment.Horizontal := halGeneral;

  if CurrXLSListView <> nil then begin
    if CurrXLSListView.SelCount > 1 then
      ForAllListViewItems(CurrXLSListView, XLSUpdateItemHorAlignment,
        false, false);
    if (CurrXLSListView = lstXLSOptions) and
       (lstXLSOptions.Selected.Index = 4) then
      XLSUpdateHyperlinkFormats;
  end;
  pbXLSCell.Repaint;
end;

procedure TQExport3DialogF.btnHorizontalFillClick(Sender: TObject);
var
  Fmt: TxlsFormat;
begin
  Fmt := CurrXLSFormat;
  if not Assigned(Fmt) then Exit;

  if btnHorizontalFill.Down
    then Fmt.Alignment.Horizontal := halFill
    else Fmt.Alignment.Horizontal := halGeneral;

  if CurrXLSListView <> nil then begin
    if CurrXLSListView.SelCount > 1 then
      ForAllListViewItems(CurrXLSListView, XLSUpdateItemHorAlignment,
        false, false);
    if (CurrXLSListView = lstXLSOptions) and
       (lstXLSOptions.Selected.Index = 4) then
      XLSUpdateHyperlinkFormats;
  end;
  pbXLSCell.Repaint;
end;

procedure TQExport3DialogF.btnVerticalTopClick(Sender: TObject);
var
  Fmt: TxlsFormat;
begin
  Fmt := CurrXLSFormat;
  if not Assigned(Fmt) then Exit;

  if btnVerticalTop.Down then
    Fmt.Alignment.Vertical := valTop;

  if CurrXLSListView <> nil then begin
    if CurrXLSListView.SelCount > 1 then
      ForAllListViewItems(CurrXLSListView, XLSUpdateItemVertAlignment,
        false, false);
    if (CurrXLSListView = lstXLSOptions) and
       (lstXLSOptions.Selected.Index = 4) then
      XLSUpdateHyperlinkFormats;
  end;
  pbXLSCell.Repaint;
end;

procedure TQExport3DialogF.btnVerticalCenterClick(Sender: TObject);
var
  Fmt: TxlsFormat;
begin
  Fmt := CurrXLSFormat;
  if not Assigned(Fmt) then Exit;

  if btnVerticalCenter.Down then
    Fmt.Alignment.Vertical := valCenter;

  if CurrXLSListView <> nil then begin
    if CurrXLSListView.SelCount > 1 then
      ForAllListViewItems(CurrXLSListView, XLSUpdateItemVertAlignment,
        false, false);
    if (CurrXLSListView = lstXLSOptions) and
       (lstXLSOptions.Selected.Index = 4) then
      XLSUpdateHyperlinkFormats;
  end;
  pbXLSCell.Repaint;
end;

procedure TQExport3DialogF.btnVerticalBottomClick(Sender: TObject);
var
  Fmt: TxlsFormat;
begin
  Fmt := CurrXLSFormat;
  if not Assigned(Fmt) then Exit;

  if btnVerticalBottom.Down then
    Fmt.Alignment.Vertical := valBottom;

  if CurrXLSListView <> nil then begin
    if CurrXLSListView.SelCount > 1 then
      ForAllListViewItems(CurrXLSListView, XLSUpdateItemVertAlignment,
        false, false);
    if (CurrXLSListView = lstXLSOptions) and
       (lstXLSOptions.Selected.Index = 4) then
      XLSUpdateHyperlinkFormats;
  end;
  pbXLSCell.Repaint;
end;

procedure TQExport3DialogF.btnBorderTopColorClick(Sender: TObject);
var
  OClr, NClr: TxlsColor;
  Fmt: TxlsFormat;
begin
  Fmt := CurrXLSFormat;
  if not Assigned(Fmt) then Exit;

  OClr := Fmt.Borders.Top.Color;
  NClr := RunXLSColorEditor(OClr);
  Fmt.Borders.Top.Color := NClr;

  if CurrXLSListView <> nil then begin
    if CurrXLSListView.SelCount > 1 then
      ForAllListViewItems(CurrXLSListView, XLSUpdateItemBorderTopColor,
        false, false);
    pbXLSCell.Repaint;
    if (CurrXLSListView = lstXLSOptions) and
       (lstXLSOptions.Selected.Index = 4) then
      XLSUpdateHyperlinkFormats;
  end;
  cmbBorderTop.Repaint;
end;

procedure TQExport3DialogF.btnBorderBottomColorClick(Sender: TObject);
var
  OClr, NClr: TxlsColor;
  Fmt: TxlsFormat;
begin
  Fmt := CurrXLSFormat;
  if not Assigned(Fmt) then Exit;

  OClr := Fmt.Borders.Bottom.Color;
  NClr := RunXLSColorEditor(OClr);
  Fmt.Borders.Bottom.Color := NClr;

  if CurrXLSListView <> nil then begin
    if CurrXLSListView.SelCount > 1 then
      ForAllListViewItems(CurrXLSListView, XLSUpdateItemBorderBottomColor,
        false, false);
    pbXLSCell.Repaint;
    if (CurrXLSListView = lstXLSOptions) and
       (lstXLSOptions.Selected.Index = 4) then
      XLSUpdateHyperlinkFormats;
  end;
  cmbBorderBottom.Repaint;
end;

procedure TQExport3DialogF.btnBorderLeftColorClick(Sender: TObject);
var
  OClr, NClr: TxlsColor;
  Fmt: TxlsFormat;
begin
  Fmt := CurrXLSFormat;
  if not Assigned(Fmt) then Exit;

  OClr := Fmt.Borders.Left.Color;
  NClr := RunXLSColorEditor(OClr);
  Fmt.Borders.Left.Color := NClr;

  if CurrXLSListView <> nil then begin
    if CurrXLSListView.SelCount > 1 then
      ForAllListViewItems(CurrXLSListView, XLSUpdateItemBorderLeftColor,
        false, false);
    pbXLSCell.Repaint;
    if (CurrXLSListView = lstXLSOptions) and
       (lstXLSOptions.Selected.Index = 4) then
      XLSUpdateHyperlinkFormats;
  end;
  cmbBorderLeft.Repaint;
end;

procedure TQExport3DialogF.btnBorderRightColorClick(Sender: TObject);
var
  OClr, NClr: TxlsColor;
  Fmt: TxlsFormat;
begin
  Fmt := CurrXLSFormat;
  if not Assigned(Fmt) then Exit;

  OClr := Fmt.Borders.Right.Color;
  NClr := RunXLSColorEditor(OClr);
  Fmt.Borders.Right.Color := NClr;

  if CurrXLSListView <> nil then begin
    if CurrXLSListView.SelCount > 1 then
      ForAllListViewItems(CurrXLSListView, XLSUpdateItemBorderRightColor,
        false, false);
    pbXLSCell.Repaint;
    if (CurrXLSListView = lstXLSOptions) and
       (lstXLSOptions.Selected.Index = 4) then
      XLSUpdateHyperlinkFormats;
  end;
  cmbBorderRight.Repaint;
end;

procedure TQExport3DialogF.btnFillBackgroundClick(Sender: TObject);
var
  OClr, NClr: TxlsColor;
  Fmt: TxlsFormat;
begin
  Fmt := CurrXLSFormat;
  if not Assigned(Fmt) then Exit;

  OClr := Fmt.Fill.Background;
  NClr := RunXLSColorEditor(OClr);
  Fmt.Fill.Background := NClr;

  if CurrXLSListView <> nil then begin
    if CurrXLSListView.SelCount > 1 then
      ForAllListViewItems(CurrXLSListView, XLSUpdateItemFillBackground,
        false, false);
    if (CurrXLSListView = lstXLSOptions) and
       (lstXLSOptions.Selected.Index = 4) then
      XLSUpdateHyperlinkFormats;
  end;
  pbXLSCell.Repaint;
  cmbPattern.Repaint;

  with Fmt do
    if (Fill.Background <> clrWhite) and (Fill.Pattern = ptNone) then begin
       Fill.Pattern := ptSolid;
       if CurrXLSListView <> nil then begin
         if CurrXLSListView.SelCount > 1 then
           ForAllListViewItems(CurrXLSListView, XLSUpdateItemFillPattern,
             false, false);
         CurrXLSListView.OnChange(CurrXLSListView, CurrXLSListView.Selected,
           ctState);
       end;
    end
end;

procedure TQExport3DialogF.btnFillForegroundClick(Sender: TObject);
var
  OClr, NClr: TxlsColor;
  Fmt: TxlsFormat;
begin
  Fmt := CurrXLSFormat;

  OClr := Fmt.Fill.Foreground;
  NClr := RunXLSColorEditor(OClr);
  Fmt.Fill.Foreground := NClr;
  
  if CurrXLSListView <> nil then begin
    if CurrXLSListView.SelCount > 1 then
      ForAllListViewItems(CurrXLSListView, XLSUpdateItemFillForeground,
        false, false);
    if (CurrXLSListView = lstXLSOptions) and
       (lstXLSOptions.Selected.Index = 4) then
      XLSUpdateHyperlinkFormats;
  end;
  pbXLSCell.Repaint;
  cmbPattern.Repaint;
end;

procedure TQExport3DialogF.btnBorderTopClick(Sender: TObject);
var
  Fmt: TxlsFormat;
begin
  Fmt := CurrXLSFormat;
  if not Assigned(Fmt) then Exit;

  if btnBorderTop.Down and (cmbBorderTop.ItemIndex = 0)
    then cmbBorderTop.ItemIndex := 1
    else cmbBorderTop.ItemIndex := 0;

  cmbBorderTop.OnChange(nil);

  if CurrXLSListView <> nil then begin
    if (CurrXLSListView = lstXLSOptions) and
       (lstXLSOptions.Selected.Index = 4) then
      XLSUpdateHyperlinkFormats;
  end;
  pbXLSCell.Repaint;
end;

procedure TQExport3DialogF.btnBorderBottomClick(Sender: TObject);
var
  Fmt: TxlsFormat;
begin
  Fmt := CurrXLSFormat;
  if not Assigned(Fmt) then Exit;

  if btnBorderBottom.Down and (cmbBorderBottom.ItemIndex = 0)
    then cmbBorderBottom.ItemIndex := 1
    else cmbBorderBottom.ItemIndex := 0;

  cmbBorderBottom.OnChange(nil);

  if CurrXLSListView <> nil then begin
    if (CurrXLSListView = lstXLSOptions) and
       (lstXLSOptions.Selected.Index = 4) then
      XLSUpdateHyperlinkFormats;
  end;
  pbXLSCell.Repaint;
end;

procedure TQExport3DialogF.btnBorderLeftClick(Sender: TObject);
var
  Fmt: TxlsFormat;
begin
  Fmt := CurrXLSFormat;
  if not Assigned(Fmt) then Exit;

  if btnBorderLeft.Down and (cmbBorderLeft.ItemIndex = 0)
    then cmbBorderLeft.ItemIndex := 1
    else cmbBorderLeft.ItemIndex := 0;

  cmbBorderLeft.OnChange(nil);

  if CurrXLSListView <> nil then begin
    if (CurrXLSListView = lstXLSOptions) and
       (lstXLSOptions.Selected.Index = 4) then
      XLSUpdateHyperlinkFormats;
  end;
  pbXLSCell.Repaint;
end;

procedure TQExport3DialogF.btnBorderRightClick(Sender: TObject);
var
  Fmt: TxlsFormat;
begin
  Fmt := CurrXLSFormat;
  if not Assigned(Fmt) then Exit;

  if btnBorderRight.Down and (cmbBorderRight.ItemIndex = 0)
    then cmbBorderRight.ItemIndex := 1
    else cmbBorderRight.ItemIndex := 0;

  cmbBorderRight.OnChange(nil);

  if CurrXLSListView <> nil then begin
    if (CurrXLSListView = lstXLSOptions) and
       (lstXLSOptions.Selected.Index = 4) then
      XLSUpdateHyperlinkFormats;
  end;
  pbXLSCell.Repaint;
end;

procedure TQExport3DialogF.cmbBorderTopChange(Sender: TObject);
var
  Fmt: TxlsFormat;
begin
  Fmt := CurrXLSFormat;
  if not Assigned(Fmt) then Exit;

  btnBorderTop.Down := cmbBorderTop.ItemIndex > 0;
  if cmbBorderTop.ItemIndex >= 0  then
    Fmt.Borders.Top.Style := TxlsBorderStyle(cmbBorderTop.ItemIndex);

  if CurrXLSListView <> nil then begin
    if CurrXLSListView.SelCount > 1 then
      ForAllListViewItems(CurrXLSListView, XLSUpdateItemBorderTop,
        false, false);
    if (CurrXLSListView = lstXLSOptions) and
       (lstXLSOptions.Selected.Index = 4) then
      XLSUpdateHyperlinkFormats;
  end;
  pbXLSCell.Repaint;
end;

procedure TQExport3DialogF.cmbBorderBottomChange(Sender: TObject);
var
  Fmt: TxlsFormat;
begin
  Fmt := CurrXLSFormat;
  if not Assigned(Fmt) then Exit;

  btnBorderBottom.Down := cmbBorderBottom.ItemIndex > 0;
  if cmbBorderBottom.ItemIndex >= 0  then
    Fmt.Borders.Bottom.Style := TxlsBorderStyle(cmbBorderBottom.ItemIndex);

  if CurrXLSListView <> nil then begin
    if CurrXLSListView.SelCount > 1 then
      ForAllListViewItems(CurrXLSListView, XLSUpdateItemBorderBottom,
        false, false);
    if (CurrXLSListView = lstXLSOptions) and
       (lstXLSOptions.Selected.Index = 4) then
      XLSUpdateHyperlinkFormats;
  end;
  pbXLSCell.Repaint;
end;

procedure TQExport3DialogF.cmbBorderLeftChange(Sender: TObject);
var
  Fmt: TxlsFormat;
begin
  Fmt := CurrXLSFormat;
  if not Assigned(Fmt) then Exit;

  btnBorderLeft.Down := cmbBorderLeft.ItemIndex > 0;
  if cmbBorderLeft.ItemIndex >= 0  then
    Fmt.Borders.Left.Style := TxlsBorderStyle(cmbBorderLeft.ItemIndex);

  if CurrXLSListView <> nil then begin
    if CurrXLSListView.SelCount > 1 then
      ForAllListViewItems(CurrXLSListView, XLSUpdateItemBorderLeft,
        false, false);
    if (CurrXLSListView = lstXLSOptions) and
       (lstXLSOptions.Selected.Index = 4) then
      XLSUpdateHyperlinkFormats;
  end;
  pbXLSCell.Repaint;
end;

procedure TQExport3DialogF.cmbBorderRightChange(Sender: TObject);
var
  Fmt: TxlsFormat;
begin
  Fmt := CurrXLSFormat;
  if not Assigned(Fmt) then Exit;

  btnBorderRight.Down := cmbBorderRight.ItemIndex > 0;
  if cmbBorderRight.ItemIndex >= 0  then
    Fmt.Borders.Right.Style := TxlsBorderStyle(cmbBorderRight.ItemIndex);

  if CurrXLSListView <> nil then begin
    if CurrXLSListView.SelCount > 1 then
      ForAllListViewItems(CurrXLSListView, XLSUpdateItemBorderRight,
        false, false);
    if (CurrXLSListView = lstXLSOptions) and
       (lstXLSOptions.Selected.Index = 4) then
      XLSUpdateHyperlinkFormats;
  end;
  pbXLSCell.Repaint;
end;

procedure TQExport3DialogF.cmbBorderTopDrawItem(Control: TWinControl;
  Index: Integer; Rect: TRect; State: TOwnerDrawState);
var
  Invert: boolean;
  Fmt: TxlsFormat;
begin
  Fmt := CurrXLSFormat;
  if not Assigned(Fmt) then Exit;

  Invert := (odSelected in State) or (odFocused in State);
  with (Control as TComboBox).Canvas do begin
    FillRect(Rect);
    if Invert then Pen.Color := clWhite
    else Pen.Color := XLS_STANDARD_PALETTE[Integer(Fmt.Borders.Top.Color)];
  end;
  DrawBorderStyle(TxlsBorderStyle(Index), (Control as TComboBox).Canvas, Rect);
end;

procedure TQExport3DialogF.cmbBorderBottomDrawItem(Control: TWinControl;
  Index: Integer; Rect: TRect; State: TOwnerDrawState);
var
  Invert: boolean;
  Fmt: TxlsFormat;
begin
  Fmt := CurrXLSFormat;
  if not Assigned(Fmt) then Exit;

  Invert := (odSelected in State) or (odFocused in State);
  with (Control as TComboBox).Canvas do begin
    FillRect(Rect);
    if Invert then Pen.Color := clWhite
    else Pen.Color := XLS_STANDARD_PALETTE[Integer(Fmt.Borders.Bottom.Color)];
  end;
  DrawBorderStyle(TxlsBorderStyle(Index), (Control as TComboBox).Canvas, Rect);
end;

procedure TQExport3DialogF.cmbBorderLeftDrawItem(Control: TWinControl;
  Index: Integer; Rect: TRect; State: TOwnerDrawState);
var
  Invert: boolean;
  Fmt: TxlsFormat;
begin
  Fmt := CurrXLSFormat;
  if not Assigned(Fmt) then Exit;

  Invert := (odSelected in State) or (odFocused in State);
  with (Control as TComboBox).Canvas do begin
    FillRect(Rect);
    if Invert then Pen.Color := clWhite
    else Pen.Color := XLS_STANDARD_PALETTE[Integer(Fmt.Borders.Left.Color)];
  end;
  DrawBorderStyle(TxlsBorderStyle(Index), (Control as TComboBox).Canvas, Rect);
end;

procedure TQExport3DialogF.cmbBorderRightDrawItem(Control: TWinControl;
  Index: Integer; Rect: TRect; State: TOwnerDrawState);
var
  Invert: boolean;
  Fmt: TxlsFormat;
begin
  Fmt := CurrXLSFormat;
  if not Assigned(Fmt) then Exit;

  Invert := (odSelected in State) or (odFocused in State);
  with (Control as TComboBox).Canvas do begin
    FillRect(Rect);
    if Invert then Pen.Color := clWhite
    else Pen.Color := XLS_STANDARD_PALETTE[Integer(Fmt.Borders.Right.Color)];
  end;
  DrawBorderStyle(TxlsBorderStyle(Index), (Control as TComboBox).Canvas, Rect);
end;

procedure TQExport3DialogF.cmbPatternDrawItem(Control: TWinControl;
  Index: Integer; Rect: TRect; State: TOwnerDrawState);
var
//  Invert: boolean;
  x, y: integer;
  Fmt: TxlsFormat;
begin
  Fmt := CurrXLSFormat;
  if not Assigned(Fmt) then Exit;

//  Invert := (odSelected in State) or (odFocused in State);
  with (Control as TComboBox).Canvas do begin
{    if Invert then begin
        Brush.Color := XLS_STANDART_PALETTE[39 - Integer(TxlsFormat(CurrXLSListView.Selected.Data).Fill.Background)];
        Pen.Color := XLS_STANDART_PALETTE[39 - Integer(TxlsFormat(CurrXLSListView.Selected.Data).Fill.Foreground)];
    end
    else begin}
      Brush.Color := XLS_STANDARD_PALETTE[Integer(Fmt.Fill.Background)];
      Pen.Color := XLS_STANDARD_PALETTE[Integer(Fmt.Fill.Foreground)];
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

procedure TQExport3DialogF.cmbPatternChange(Sender: TObject);
var
  Fmt: TxlsFormat;
begin
  Fmt := CurrXLSFormat;
  if not Assigned(Fmt) then Exit;

  if cmbPattern.ItemIndex >= 0 then begin
    Fmt.Fill.Pattern := TxlsPattern(cmbPattern.ItemIndex);

    if CurrXLSListView <> nil then
      if CurrXLSListView.SelCount > 1 then
        ForAllListViewItems(CurrXLSListView, XLSUpdateItemFillPattern, false, false);

    if (cmbPattern.ItemIndex = 0) and (Fmt.Fill.Background <> clrWhite) then begin
      Fmt.Fill.Background := clrWhite;
      if CurrXLSListView <> nil then begin
        if CurrXLSListView.SelCount > 1 then
          ForAllListViewItems(CurrXLSListView, XLSUpdateItemFillBackground, false, false);
        CurrXLSListView.OnChange(CurrXLSListView, CurrXLSListView.Selected, ctState);
      end;
    end;
  end;
  if CurrXLSListView <> nil then
    if (CurrXLSListView = lstXLSOptions) and
       (lstXLSOptions.Selected.Index = 4) then
      XLSUpdateHyperlinkFormats;
  pbXLSCell.Repaint;
end;

procedure TQExport3DialogF.LoadExportOptions(const FileName: string);
var
  i, j, k: integer;
  FIniFile: TIniFile;
  AStrings: TStrings;
  AComponent: TComponent;
  prefix, str: string;
  LV: TListView;
  xlsFormat: TxlsFieldFormat;
  rtfStyle: TrtfStyle;
  PDFFont: TPDFFont;
  Node, Node2: TTreeNode;
begin
  FIniFile := TIniFile.Create(FileName);
  AStrings := TStringList.Create;
  try
    with FIniFile do begin
      // [GENERAL]
      Self.FileName := ReadString(S_GENERAL, S_FileName, Dialog.FileName);
      ExportType := TAllowedExport(ReadInteger(S_GENERAL, S_ExportType, 0));
      ShowFile := ReadBool(S_GENERAL, S_ShowFile, Dialog.ShowFile);
      PrintFile := ReadBool(S_GENERAL, S_PrintFile, Dialog.PrintFile);
      GoToFirstRecord := ReadBool(S_GENERAL, S_GoToFirstRecord,
        Dialog.GoToFirstRecord);
      ExportEmpty := ReadBool(S_GENERAL, S_ExportEmpty,
        Dialog.ExportEmpty);
      CurrentRecordOnly := ReadBool(S_GENERAL, S_CurrentRecordOnly,
        Dialog.CurrentRecordOnly);
      ExportEmpty := ReadBool(S_GENERAL, S_ExportEmpty, Dialog.ExportEmpty);
      ExportRecCount := ReadInteger(S_GENERAL, S_ExportRecCount,
        Dialog.ExportRecCount);
      SkipRecCount := ReadInteger(S_GENERAL, S_SkipRecCount,
        Dialog.SkipRecCount);
      AllowCaptions := ReadBool(S_GENERAL, S_AllowCaptions,
        Dialog.AllowCaptions);
      CaptionRow := ReadInteger(S_GENERAL, S_CaptionRow, Dialog.CaptionRow);
      // [FORMATS]
      ResetStandardFormats;
      IntegerFmt := ReadString(S_FORMATS, S_Integer, IntegerFmt);
      FloatFmt := ReadString(S_FORMATS, S_Float, FloatFmt);
      DateFmt := ReadString(S_FORMATS, S_Date, DateFmt);
      TimeFmt := ReadString(S_FORMATS, S_Time, TimeFmt);
      DateTimeFmt := ReadString(S_FORMATS, S_DateTime, DateTimeFmt);
      CurrencyFmt := ReadString(S_FORMATS, S_Currency, CurrencyFmt);
      BooleanTrue := ReadString(S_FORMATS, S_BooleanTrue, BooleanTrue);
      BooleanFalse := ReadString(S_FORMATS, S_BooleanFalse, BooleanFalse);
      NullString := ReadString(S_FORMATS, S_NullString, NullString);
      // [USER_FORMATS]
      lstUserFormats.Items.Clear;
      AStrings.Clear;
      ReadSection(S_USER_FORMATS, AStrings);
      for i := 0 to AStrings.Count - 1 do
        for j := 0 to Dialog.Columns.Count - 1 do
          if AnsiCompareText(AStrings[i], Dialog.Columns[j].Name) = 0 then
            with lstUserFormats.Items.Add do begin
              Caption := AStrings[i];
              SubItems.Add('=');
              SubItems.Add(ReadString(S_USER_FORMATS, AStrings[i], EmptyStr));
              ImageIndex := 2;
            end;
      // [FIELDS]
      bDelAllExportedField.Click;
      AStrings.Clear;
      ReadSection(S_FIELDS, AStrings);
      for i := 0 to AStrings.Count - 1 do
        for j := 0 to lstAvailableFields.Items.Count - 1 do
          if AnsiCompareText(ReadString(S_FIELDS, AStrings[i], EmptyStr),
               lstAvailableFields.Items[j].Caption) = 0 then begin
            with MoveListItem(lstAvailableFields.Items[j],
              lstExportedFields, true, -1) do
            ImageIndex := 1;
            CorrectXLSFieldsList;
            Break;
          end;
      // [HEADER]
      AStrings.Clear;
      ReadSection(S_HEADER, AStrings);
      memHeader.Lines.Clear;
      for i := 0 to AStrings.Count - 1 do
        memHeader.Lines.Add(ReadString(S_HEADER, AStrings[i], EmptyStr));
      // [FOOTER]
      AStrings.Clear;
      ReadSection(S_FOOTER, AStrings);
      memFooter.Lines.Clear;
      for i := 0 to AStrings.Count - 1 do
        memFooter.Lines.Add(ReadString(S_FOOTER, AStrings[i], EmptyStr));
      // [CAPTIONS]
      AStrings.Clear;
      for j := 1 to sgrCaptions.RowCount - 1 do
        sgrCaptions.Cells[1, j] := EmptyStr;
      ReadSection(S_CAPTIONS, AStrings);
      for i := 0 to AStrings.Count - 1 do
        for j := 1 to sgrCaptions.RowCount - 1 do
          if AnsiCompareText(AStrings[i], sgrCaptions.Cells[0, j]) = 0 then begin
            sgrCaptions.Cells[1, j] := ReadString(S_CAPTIONS, AStrings[i],
              EmptyStr);
            Break;
          end;

      // [WIDTH]
      if ExportType in [aeTXT, aeRTF, aeWord, aeXLS, aePDF] then begin
        AStrings.Clear;
        for j := 1 to sgrCaptions.RowCount - 1 do
          sgrCaptions.Cells[2 + Integer(ExportType <> aeXLS), j] := '0';
        ReadSection(S_WIDTH, AStrings);
        for i := 0 to AStrings.Count - 1 do
          for j := 1 to sgrCaptions.RowCount - 1 do
            if AnsiCompareText(AStrings[i], sgrCaptions.Cells[0, j]) = 0 then begin
              sgrCaptions.Cells[2 + Integer(ExportType <> aeXLS), j] :=
                ReadString(S_WIDTH, AStrings[i], '0');
              Break;
            end;
      end;

      // [ALIGN]
      if ExportType in [aeTXT, aeRTF, aeWord, aeHTML, aePDF] then begin
        AStrings.Clear;
        for j := 1 to sgrCaptions.RowCount - 1 do
          sgrCaptions.Cells[2, j] := 'Left';
        ReadSection(S_ALIGN, AStrings);
        for i := 0 to AStrings.Count - 1 do
          for j := 1 to sgrCaptions.RowCount - 1 do
            if AnsiCompareText(AStrings[i], sgrCaptions.Cells[0, j]) = 0 then begin
              sgrCaptions.Cells[2, j] := ReadString(S_ALIGN, AStrings[i], 'Left');
              Break;
            end;
      end;

      case ExportType of
        // [XLS]
        aeXLS: begin
          XLSPageHeader := ReadString(S_XLS, S_PageHeader,
            Dialog.XLSOptions.PageHeader);
          XLSPageFooter := ReadString(S_XLS, S_PageFooter,
            Dialog.XLSOptions.PageFooter);
          XLSSheetTitle := ReadString(S_XLS, S_SheetTitle,
            Dialog.XLSOptions.SheetTitle);
          XLSStripType := TxlsStripType(ReadInteger(S_XLS, S_StripType,
            Integer(Dialog.XLSOptions.StripType)));
          XLSAutoCalcColWidth := ReadBool(S_XLS, S_AutoCalcColWidth,
            Dialog.XLSOptions.AutoCalcColWidth);
          XLSPageBackground := ReadString(S_XLS, S_PageBackground,
            Dialog.XLSOptions.PageBackground);

          XLSClearHyperlinkNodes;
          XLSClearNoteNodes;
          XLSClearChartNodes;
          XLSClearCellNodes;
          XLSClearMergedCellsNodes;

          XLSResetAllItems_A;
          AStrings.Clear;
          ReadSections(AStrings);
          for i := 0 to AStrings.Count - 1  do begin
            j := 0;
            LV := nil;
            if AnsiCompareText(S_XLS_FIELD, Copy(AStrings[i], 1,
               Length(S_XLS_FIELD))) = 0 then begin
              LV := lstXLSFields;
              prefix := S_XLS_FIELD;
            end
            else if AnsiCompareText(S_XLS_OPTION, Copy(AStrings[i], 1,
               Length(S_XLS_OPTION))) = 0 then begin
              LV := lstXLSOptions;
              prefix := S_XLS_OPTION;
            end
            else if AnsiCompareText(S_XLS_STYLE, Copy(AStrings[i], 1,
               Length(S_XLS_STYLE))) = 0 then begin
              LV := lstXLSStyles;
              prefix := S_XLS_STYLE;
            end
            else if AnsiCompareText(S_XLS_HYPERLINK, Copy(AStrings[i], 1,
                Length(S_XLS_HYPERLINK))) = 0 then begin
              j := xlsHyperlink;
              LV := nil;
            end
            else if AnsiCompareText(S_XLS_NOTE, Copy(AStrings[i], 1,
                Length(S_XLS_NOTE))) = 0 then begin
              if IniFileValueExists(FIniFile, AStrings[i], S_XLS_Note_Col) then begin
                j := xlsNote;
                LV := nil;
              end;
            end
            else if AnsiCompareText(S_XLS_CHART, Copy(AStrings[i], 1,
                Length(S_XLS_CHART))) = 0 then begin
              if IniFileValueExists(FIniFile, AStrings[i], S_XLS_Chart_Style) then begin
                j := xlsChart;
                LV := nil;
              end;
            end
            else if AnsiCompareText(S_XLS_CELL, Copy(AStrings[i], 1,
                Length(S_XLS_CELL))) = 0 then begin
              if IniFileValueExists(FIniFile, AStrings[i], S_XLS_Cell_Col) then begin
                j := xlsCell;
                LV := nil;
              end;
            end
            else if AnsiCompareText(S_XLS_MERGED_CELL, Copy(AStrings[i], 1,
                Length(S_XLS_MERGED_CELL))) = 0 then begin
              if IniFileValueExists(FIniFile, AStrings[i], S_XLS_MergedCell_FirstCol) then begin
                j := xlsMergedCell;
                LV := nil;
              end;
            end
            else begin
              LV := nil;
              j := 0;
            end;

            if Assigned(LV) then begin
              xlsFormat := nil;
              if (AnsiCompareText(prefix, S_XLS_FIELD) = 0) or
                 (AnsiCompareText(prefix, S_XLS_OPTION) = 0) then begin
                for j := 0 to LV.Items.Count - 1 do
                  if AnsiCompareText(LV.Items[j].Caption, Copy(AStrings[i],
                     Length(prefix) + 1, Length(AStrings[i]))) = 0 then begin
                    xlsFormat := TxlsFieldFormat(LV.Items[j].Data);
                    Break;
                  end;
              end
              else begin
                with LV.Items.Add do begin
                  Caption := Copy(AStrings[i], Length(prefix) + 1, Length(AStrings[i]));
                  xlsFormat := TxlsFieldFormat.Create(nil);
                  Data := xlsFormat;
                  ImageIndex := 2;
                end;
              end;

              if Assigned(xlsFormat)
                then xlsFormat.LoadFromIniFile(FIniFile, AStrings[i]);
            end
            else begin
               case j of
                 xlsHyperlink:
                   with tvXLSExtensions.Items.AddChild(FXLSHyperlinkNode, EmptyStr) do begin
                     ImageIndex := xlsHyperlink;
                     SelectedIndex := xlsHyperlink;
                     Data := TxlsHyperlink.Create(nil);
                     TxlsHyperlink(Data).LoadFromIniFile(FIniFile, AStrings[i]);
                     if TxlsHyperlink(Data).Title <> EmptyStr then
                       Text := TxlsHyperlink(Data).Title
                     else Text := {$IFDEF WIN32}QExportLoadStr(QED_XLS_Hyperlink_DefaultTitle){$ENDIF}
                                  {$IFDEF LINUX}QED_XLS_Hyperlink_DefaultTitle{$ENDIF} + '_' +
                       IntToStr(FXLSHyperlinkNode.Count);
                   end;
                 xlsNote:
                   with tvXLSExtensions.Items.AddChild(FXLSNoteNode, EmptyStr) do begin
                     ImageIndex := xlsNote;
                     SelectedIndex := xlsNote;
                     Data := TxlsNote.Create(nil);
                     TxlsNote(Data).LoadFromIniFile(FIniFile, AStrings[i]);
                     Text := {$IFDEF WIN32}QExportLoadStr(QED_XLS_Note_DefaultTitle){$ENDIF}
                             {$IFDEF LINUX}QED_XLS_Note_DefaultTitle{$ENDIF} + '_' +
                       IntToStr(FXLSNoteNode.Count);
                   end;
                 xlsChart: begin
                   Node := tvXLSExtensions.Items.AddChild(FXLSChartNode, EmptyStr);
                   with Node do begin
                     ImageIndex := xlsChart;
                     SelectedIndex := xlsChart;
                     Data := TxlsChart.Create(nil);
                     TxlsChart(Data).LoadFromIniFile(FIniFile, AStrings[i]);
                     if TxlsChart(Data).Title <> EmptyStr then
                       Text := TxlsChart(Data).Title
                     else Text := {$IFDEF WIN32}QExportLoadStr(QED_XLS_Chart_DefaultTitle){$ENDIF}
                                  {$IFDEF LINUX}QED_XLS_Chart_DefaultTitle{$ENDIF} + '_' +
                       IntToStr(FXLSChartNode.Count);
                   end;
                   Node2 := tvXLSExtensions.Items.AddChild(Node, {$IFDEF WIN32}QExportLoadStr(QED_XLS_Series_DefaultTitle){$ENDIF}
                                                                 {$IFDEF LINUX}QED_XLS_Series_DefaultTitle{$ENDIF});
                   Node2.ImageIndex := xlsSeries;
                   Node2.SelectedIndex := xlsSeries;
                   for k := 0 to TxlsChart(Node.Data).Series.Count - 1 do
                     with tvXLSExtensions.Items.AddChild(Node2, EmptyStr) do begin
                       ImageIndex := xlsSeries;
                       SelectedIndex := xlsSeries;
                       Data := TxlsChart(Node.Data).Series[k];
                       if TxlsChart(Node.Data).Series[k].Title <> EmptyStr then
                         Text := TxlsChart(Node.Data).Series[k].Title
                       else Text := {$IFDEF WIN32}QExportLoadStr(QED_XLS_Series_DefaultTitle){$ENDIF}
                                    {$IFDEF LINUX}QED_XLS_Series_DefaultTitle{$ENDIF} + '_' +
                         IntToStr(Node2.Count);
                     end;
                 end;
                 xlsCell:
                   with tvXLSExtensions.Items.AddChild(FXLSCellNode, EmptyStr) do begin
                     ImageIndex := xlsCell;
                     SelectedIndex := xlsCell;
                     Data := TxlsCell.Create(nil);
                     TxlsCell(Data).LoadFromIniFile(FIniFile, AStrings[i]);
                     Text := Format({$IFDEF WIN32}QExportLoadStr(QED_XLS_Cell_DisplayName){$ENDIF}
                                    {$IFDEF LINUX}QED_XLS_Cell_DisplayName{$ENDIF},
                                    [TxlsCell(Data).Col, TxlsCell(Data).Row]);
                   end;
                 xlsMergedCell:
                   with tvXLSExtensions.Items.AddChild(FXLSMergedCellNode, EmptyStr) do begin
                     ImageIndex := xlsMergedCell;
                     SelectedIndex := xlsMergedCell;
                     Data := TxlsMergedCells.Create(nil);
                     TxlsMergedCells(Data).LoadFromIniFile(FIniFile, AStrings[i]);
                     Text := Format({$IFDEF WIN32}QExportLoadStr(QED_XLS_MergedCell_DefaultTitle){$ENDIF}
                                    {$IFDEF LINUX}QED_XLS_MergedCell_DefaultTitle{$ENDIF} + ' %d', [Index]);
                   end;
               end;
            end;
          end;
          if lstXLSStyles.Items.Count > 0 then begin
            lstXLSStyles.Items[0].Focused := true;
            lstXLSStyles.Items[0].Selected := true;
          end;
        end;
        // [RTF]
        aeRTF, aeWord: begin
          RTFPageOrientation := TQExportPageOrientation(ReadInteger(S_RTF,
            S_RTF_PageOrientation, Integer(Dialog.RTFOptions.PageOrientation)));
          RTFStripType := TrtfStripType(ReadInteger(S_RTF, S_RTF_StripType,
            Integer(Dialog.RTFOptions.StripType)));

          RTFResetAllItems_A;
          AStrings.Clear;
          ReadSections(AStrings);
          for i := 0 to AStrings.Count - 1  do begin
            if AnsiCompareText(S_RTF_STYLE, Copy(AStrings[i], 1,
               Length(S_RTF_STYLE))) = 0 then begin
              LV := lstRTFBaseStyles;
              prefix := S_RTF_STYLE;
            end
            else if AnsiCompareText(S_RTF_STRIP_STYLE, Copy(AStrings[i], 1,
               Length(S_RTF_STRIP_STYLE))) = 0 then begin
              LV := lstRTFStripStyles;
              prefix := S_RTF_STRIP_STYLE;
            end
            else LV := nil;

            if Assigned(LV) then begin
              rtfStyle := nil;
              if AnsiCompareText(prefix, S_RTF_STYLE) = 0 then begin
                for j := 0 to LV.Items.Count - 1 do
                  if AnsiCompareText(LV.Items[j].Caption, Copy(AStrings[i],
                     Length(prefix) + 1, Length(AStrings[i]))) = 0 then begin
                    rtfStyle := TrtfStyle(LV.Items[j].Data);
                    Break;
                  end;
              end
              else begin
                with LV.Items.Add do begin
                  Caption := Copy(AStrings[i], Length(prefix) + 1, Length(AStrings[i]));
                  rtfStyle := TrtfStyle.Create(nil);
                  Data := rtfStyle;
                  ImageIndex := 2;
                end;
              end;

              if Assigned(rtfStyle) then
                rtfStyle.LoadFromIniFile(FIniFile, AStrings[i]);
            end;
          end;
          if lstRTFStripStyles.Items.Count > 0 then begin
            lstRTFStripStyles.Items[0].Focused := true;
            lstRTFStripStyles.Items[0].Selected := true;
          end;
        end;
        // [HTML]
        aeHTML: begin
           SetCustomTemplate;

           HTMLTitle := ReadString(S_HTML, S_HTML_Title,
             Dialog.HTMLPageOptions.Title);
           HTMLUsingCSS := TUsingCSS(ReadInteger(S_HTML, S_HTML_CSS,
             Integer(Dialog.HTMLPageOptions.UsingCSS)));
           HTMLCSSFileName := ReadString(S_HTML, S_HTML_CSSFile,
             Dialog.HTMLPageOptions.CSSFileName);
           HTMLOverwriteCSSFile := ReadBool(S_HTML, S_HTML_OverwriteCSSFile,
             Dialog.HTMLPageOptions.OverwriteCSSFile);

           HTMLUseMultiFileExport := ReadInteger(S_HTML,
             S_HTML_FileRecCount, Dialog.HTMLMultiFileOptions.FileRecCount) > 0;
           HTMLFileRecCount := ReadInteger(S_HTML,
             S_HTML_FileRecCount, Dialog.HTMLMultiFileOptions.FileRecCount);
           HTMLGenerateIndex := ReadBool(S_HTML, S_HTML_GenerateIndex,
             Dialog.HTMLMultiFileOptions.GenerateIndex);
           HTMLIndexLinkTemplate := ReadString(S_HTML, S_HTML_IndexLinkTemplate,
             Dialog.HTMLMultiFileOptions.IndexLinkTemplate);
           HTMLNavigationOnTop := ReadBool(S_HTML, S_HTML_NavigationOnTop,
             Dialog.HTMLMultiFileOptions.NavigationOnTop);
           HTMLNavigationOnBottom := ReadBool(S_HTML, S_HTML_NavigationOnBottom,
             Dialog.HTMLMultiFileOptions.NavigationOnBottom);
           HTMLIndexLinkTitle := ReadString(S_HTML, S_HTML_IndexLinkTitle,
             Dialog.HTMLMultiFileOptions.IndexLinkTitle);
           HTMLFirstLinkTitle := ReadString(S_HTML, S_HTML_FirstLinkTitle,
             Dialog.HTMLMultiFileOptions.FirstLinkTitle);
           HTMLPriorLinkTitle := ReadString(S_HTML, S_HTML_PriorLinkTitle,
             Dialog.HTMLMultiFileOptions.PriorLinkTitle);
           HTMLNextLinkTitle := ReadString(S_HTML, S_HTML_NextLinkTitle,
             Dialog.HTMLMultiFileOptions.NextLinkTitle);
           HTMLLastLinkTitle := ReadString(S_HTML, S_HTML_LastLinkTitle,
             Dialog.HTMLMultiFileOptions.LastLinkTitle);

           HTMLFontName := ReadString(S_HTML, S_HTML_FontName,
             Dialog.HTMLPageOptions.TextFont.Name);
           HTMLBackground := ReadString(S_HTML, S_HTML_BackgroundFile,
             Dialog.HTMLPageOptions.BackgroundFileName);
           HTMLBodyAdvanced := ReadString(S_HTML, S_HTML_BodyAdvanced,
             Dialog.HTMLPageOptions.AdvancedAttributes.Text);

           HTMLCellPadding := ReadInteger(S_HTML, S_HTML_CellPadding,
             Dialog.HTMLTableOptions.CellPadding);
           HTMLCellSpacing := ReadInteger(S_HTML, S_HTML_CellSpacing,
             Dialog.HTMLTableOptions.CellSpacing);
           HTMLBorderWidth := ReadInteger(S_HTML, S_HTML_BorderWidth,
             Dialog.HTMLTableOptions.BorderWidth);
           HTMLTableBackground := ReadString(S_HTML, S_HTML_TableBackground,
             Dialog.HTMLTableOptions.BackgroundFileName);
           HTMLTableAdvanced := ReadString(S_HTML, S_HTML_TableAdvanced,
             Dialog.HTMLTableOptions.AdvancedAttributes.Text);

           HTMLBackgroundColor := StringToColor(ReadString(S_HTML,
             S_HTML_BackgroundColor,
             ColorToString(Dialog.HTMLPageOptions.BackgroundColor)));
           HTMLFontColor := StringToColor(ReadString(S_HTML, S_HTML_FontColor,
             ColorToString(Dialog.HTMLPageOptions.TextFont.Color)));

           str := ReadString(S_HTML, S_HTML_HeadBackgroundColor,
             ColorToString(Dialog.HTMLTableOptions.HeadersRowBgColor));
           HTMLHeadBackgroundColor := StringToColor(str);
           for i := 1 to 3 do begin
             AComponent := FindComponent('paHTMLColumnHead_' + IntToStr(i));
             if Assigned(AComponent) and (AComponent is TPanel) then
               (AComponent as TPanel).Color := StringToColor(str);
           end;

           str := ReadString(S_HTML, S_HTML_HeadFontColor,
             ColorToString(Dialog.HTMLTableOptions.HeadersRowFontColor));
           HTMLHeadFontColor := StringToColor(str);
           for i := 1 to 3 do begin
             AComponent := FindComponent('laHTMLHead_' + IntToStr(i));
             if Assigned(AComponent) and (AComponent is TLabel) then
               (AComponent as TLabel).Font.Color := StringToColor(str);
           end;

           str := ReadString(S_HTML, S_HTML_OddRowBackgroundColor,
             ColorToString(Dialog.HTMLTableOptions.OddRowBgColor));
           HTMLOddRowBackgroundColor := StringToColor(str);
           for i := 1 to 6 do begin
             AComponent := FindComponent('paHTMLOddRowCol_' + IntToStr(i));
             if Assigned(AComponent) and (AComponent is TPanel) then
               (AComponent as TPanel).Color := StringToColor(str);
           end;

           str := ReadString(S_HTML, S_HTML_EvenRowBackgroundColor,
             ColorToString(Dialog.HTMLTableOptions.TableBgColor));
           HTMLEvenRowBackgroundColor := StringToColor(str);
           for i := 1 to 6 do begin
             AComponent := FindComponent('paHTMLEvenRowCol_' + IntToStr(i));
             if Assigned(AComponent) and (AComponent is TPanel) then
               (AComponent as TPanel).Color := StringToColor(str);
           end;

           str := ReadString(S_HTML, S_HTML_DataFontColor,
             ColorToString(Dialog.HTMLTableOptions.TableFontColor));
           HTMLDataFontColor := StringToColor(str);
           for i := 1 to 12 do begin
             AComponent := FindComponent('laHTMLData_' + IntToStr(i));
             if Assigned(AComponent) and (AComponent is TLabel) then
               (AComponent as TLabel).Font.Color := StringToColor(str);
           end;

           laHTMLLink.Font.Color := StringToColor(ReadString(S_HTML,
             S_HTML_LinkColor,
             ColorToString(Dialog.HTMLPageOptions.LinkColor)));
           HTMLLinkColor := laHTMLLink.Font.Color;
           laHTMLVLink.Font.Color := StringToColor(ReadString(S_HTML,
             S_HTML_VLinkColor,
             ColorToString(Dialog.HTMLPageOptions.VLinkColor)));
           HTMLVLinkColor := laHTMLVLink.Font.Color;
           laHTMLALink.Font.Color := StringToColor(ReadString(S_HTML,
             S_HTML_ALinkColor,
             ColorToString(Dialog.HTMLPageOptions.ALinkColor)));
           HTMLALinkColor := laHTMLALink.Font.Color;
        end;
        // [PDF]
        aePDF: begin
          PDFColSpacing := StrToDblDef(ReadString(S_PDF, S_PDF_ColSpacing,
            FormatFloat('0.0', Dialog.PDFOptions.ColSpacing)),
            Dialog.PDFOptions.ColSpacing);
          PDFRowSpacing := StrToDblDef(ReadString(S_PDF, S_PDF_RowSpacing,
            FormatFloat('0.0', Dialog.PDFOptions.RowSpacing)),
            Dialog.PDFOptions.RowSpacing);
          PDFGridLineWidth := ReadInteger(S_PDF, S_PDF_GridLineWidth,
            Dialog.PDFOptions.GridLineWidth);

          PDFPageFormat := TQExportPageFormat(ReadInteger(S_PDF,
            S_PDF_PageFormat, Integer(Dialog.PDFOptions.PageOptions.Format)));
          PDFPageUnits := TQExportUnits(ReadInteger(S_PDF, S_PDF_PageUnits,
            Integer(Dialog.PDFOptions.PageOptions.Units)));
          PDFPageOrientation := TQExportPageOrientation(ReadInteger(S_PDF,
            S_PDF_PageOrientation, Integer(Dialog.PDFOptions.PageOptions.Orientation)));
          if PDFPageFormat = pfUser then begin
            FPDFPageWidth := ReadInteger(S_PDF, S_PDF_PageWidth,
              Units2Dot(Dialog.PDFOptions.PageOptions.Units,
                        Dialog.PDFOptions.PageOptions.Width));
            FPDFPageHeight := ReadInteger(S_PDF, S_PDF_PageHeight,
              Units2Dot(Dialog.PDFOptions.PageOptions.Units,
                        Dialog.PDFOptions.PageOptions.Height));
          end;
          FPDFPageMarginLeft := ReadInteger(S_PDF, S_PDF_PageMarginLeft,
            Units2Dot(Dialog.PDFOptions.PageOptions.Units,
                      Dialog.PDFOptions.PageOptions.MarginLeft));
          FPDFPageMarginRight := ReadInteger(S_PDF, S_PDF_PageMarginRight,
            Units2Dot(Dialog.PDFOptions.PageOptions.Units,
                      Dialog.PDFOptions.PageOptions.MarginRight));
          FPDFPageMarginTop := ReadInteger(S_PDF, S_PDF_PageMarginTop,
            Units2Dot(Dialog.PDFOptions.PageOptions.Units,
                      Dialog.PDFOptions.PageOptions.MarginTop));
          FPDFPageMarginBottom := ReadInteger(S_PDF, S_PDF_PageMarginBottom,
            Units2Dot(Dialog.PDFOptions.PageOptions.Units,
                      Dialog.PDFOptions.PageOptions.MarginBottom));

          edPDFPageWidth.Text := FormatFloat(GetPDFPageSizeFormat,
            PDFPageWidth);
          edPDFPageHeight.Text := FormatFloat(GetPDFPageSizeFormat,
            PDFPageHeight);
          edPDFPageMarginLeft.Text := FormatFloat(GetPDFPageSizeFormat,
            PDFPageMarginLeft);
          edPDFPageMarginRight.Text := FormatFloat(GetPDFPageSizeFormat,
            PDFPageMarginRight);
          edPDFPageMarginTop.Text := FormatFloat(GetPDFPageSizeFormat,
            PDFPageMarginTop);
          edPDFPageMarginBottom.Text := FormatFloat(GetPDFPageSizeFormat,
            PDFPageMarginBottom);
          //--- Header
          PDFFont := PDFExp.Options.HeaderFont;
          PDFFont.BaseFont := TPDFFontName(ReadInteger(S_PDF_OPTION_HEADER,
            S_PDF_FontName, Integer(Dialog.PDFOptions.HeaderFont.BaseFont)));
          PDFFont.FontEncoding := TPDFFontEncoding(ReadInteger(S_PDF_OPTION_HEADER,
            S_PDF_FontEncoding, Integer(Dialog.PDFOptions.HeaderFont.FontEncoding)));
          PDFFont.FontSize := ReadInteger(S_PDF_OPTION_HEADER, S_PDF_FontSize,
            Dialog.PDFOptions.HeaderFont.FontSize);
          PDFFont.FontColor := StringToColor(ReadString(S_PDF_OPTION_HEADER,
            S_PDF_FontColor, ColorToString(Dialog.PDFOptions.HeaderFont.FontColor)));
          //--- Caption
          PDFFont := PDFExp.Options.CaptionFont;
          PDFFont.BaseFont := TPDFFontName(ReadInteger(S_PDF_OPTION_CAPTION,
            S_PDF_FontName, Integer(Dialog.PDFOptions.CaptionFont.BaseFont)));
          PDFFont.FontEncoding := TPDFFontEncoding(ReadInteger(S_PDF_OPTION_CAPTION,
            S_PDF_FontEncoding, Integer(Dialog.PDFOptions.CaptionFont.FontEncoding)));
          PDFFont.FontSize := ReadInteger(S_PDF_OPTION_CAPTION, S_PDF_FontSize,
            Dialog.PDFOptions.CaptionFont.FontSize);
          PDFFont.FontColor := StringToColor(ReadString(S_PDF_OPTION_CAPTION,
            S_PDF_FontColor, ColorToString(Dialog.PDFOptions.CaptionFont.FontColor)));
          //--- Data
          PDFFont := PDFExp.Options.DataFont;
          PDFFont.BaseFont := TPDFFontName(ReadInteger(S_PDF_OPTION_DATA,
            S_PDF_FontName, Integer(Dialog.PDFOptions.DataFont.BaseFont)));
          PDFFont.FontEncoding := TPDFFontEncoding(ReadInteger(S_PDF_OPTION_DATA,
            S_PDF_FontEncoding, Integer(Dialog.PDFOptions.DataFont.FontEncoding)));
          PDFFont.FontSize := ReadInteger(S_PDF_OPTION_DATA, S_PDF_FontSize,
            Dialog.PDFOptions.DataFont.FontSize);
          PDFFont.FontColor := StringToColor(ReadString(S_PDF_OPTION_DATA,
            S_PDF_FontColor, ColorToString(Dialog.PDFOptions.DataFont.FontColor)));
          //--- Footer
          PDFFont := PDFExp.Options.FooterFont;
          PDFFont.BaseFont := TPDFFontName(ReadInteger(S_PDF_OPTION_FOOTER,
            S_PDF_FontName, Integer(Dialog.PDFOptions.FooterFont.BaseFont)));
          PDFFont.FontEncoding := TPDFFontEncoding(ReadInteger(S_PDF_OPTION_FOOTER,
            S_PDF_FontEncoding, Integer(Dialog.PDFOptions.FooterFont.FontEncoding)));
          PDFFont.FontSize := ReadInteger(S_PDF_OPTION_FOOTER, S_PDF_FontSize,
            Dialog.PDFOptions.FooterFont.FontSize);
          PDFFont.FontColor := StringToColor(ReadString(S_PDF_OPTION_FOOTER,
            S_PDF_FontColor, ColorToString(Dialog.PDFOptions.FooterFont.FontColor)));
          FPDFFontItem := lvPDFFonts.ItemFocused;
          PDFShowFontInfo;
        end;
        // [XML]
        aeXML: begin
          XMLStandalone := ReadBool(S_XML, S_XML_Standalone,
            Dialog.XMLOptions.Standalone);
          XMLEncoding := ReadString(S_XML, S_XML_Encoding,
            Dialog.XMLOptions.Encoding);
        end;
        // [SQL]
        aeSQL: begin
          SQLTableName := ReadString(S_SQL, S_SQL_TableName,
            Dialog.SQLOptions.TableName);
          SQLCreateTable := ReadBool(S_SQL, S_SQL_CreateTable,
            Dialog.SQLOptions.CreateTable);
          SQLCommitRecCount := ReadInteger(S_SQL,
            S_SQL_CommitRecCount, Dialog.SQLOptions.CommitRecCount);
          SQLCommitAfterScript := ReadBool(S_SQL, S_SQL_CommitAfterScript,
            Dialog.SQLOptions.CommitAfterScript);
          SQLCommitStatement := ReadString(S_SQL, S_SQL_CommitStatement,
            Dialog.SQLOptions.CommitStatement);
          SQLStatementTerm := ReadString(S_SQL, S_SQL_StatementTerm,
            Dialog.SQLOptions.StatementTerm);
        end;
        // [TXT]
        aeTXT: begin
          TXTAutoCalcColWidth := ReadBool(S_TXT, S_TXT_AutoCalcColWidth,
            Dialog.TXTOptions.AutoCalcColWidth);
          TXTSpacing := ReadInteger(S_TXT, S_TXT_Spacing,
            Dialog.TXTOptions.ColSpacing);
        end;
        // [CSV]
        aeCSV: begin
          CSVQuoteStrings := ReadBool(S_CSV, S_CSV_QuoteStrings,
            Dialog.CSVOptions.QuoteStrings);
          CSVComma := Str2Char(ReadString(S_CSV, S_CSV_Comma,
            Char2Str(Dialog.CSVOptions.Comma)));
          CSVQuote := Str2Char(ReadString(S_CSV, S_CSV_Quote,
            Char2Str(Dialog.CSVOptions.Quote)));
        end;
      end;
    end;
  finally
    AStrings.Free;
    FIniFile.Free;
  end;
end;

procedure TQExport3DialogF.SaveExportOptions(const FileName: string);
var
  i, j: Integer;
  FIniFile: TIniFile;
  AStrings: TStrings;
  prefix, str: string;
  xlsFormat: TxlsFieldFormat;
  rtfStyle: TrtfStyle;
  LV: TListView;
begin
  FIniFile := TIniFile.Create(FileName);
  try
    ClearIniFile(FIniFile);
    AStrings := TStringList.Create;
    try
      with FIniFile do begin
        // [GENERAL]
        WriteInteger(S_GENERAL, S_ExportType, Integer(ExportType));
        WriteString(S_GENERAL, S_FileName, Self.FileName);
        WriteBool(S_GENERAL, S_ShowFile, ShowFile);
        WriteBool(S_GENERAL, S_PrintFile, PrintFile);
        WriteBool(S_GENERAL, S_GoToFirstRecord, GoToFirstRecord);
        WriteBool(S_GENERAL, S_ExportEmpty, ExportEmpty);
        WriteBool(S_GENERAL, S_CurrentRecordOnly, CurrentRecordOnly);
        WriteInteger(S_GENERAL, S_ExportRecCount, ExportRecCount);
        WriteInteger(S_GENERAL, S_SkipRecCount, SkipRecCount);
        WriteBool(S_GENERAL, S_AllowCaptions, AllowCaptions);
        WriteInteger(S_GENERAL, S_CaptionRow, CaptionRow);

        EraseSection(S_USER_FORMATS);
        if tshFormats.TabVisible then begin
          // [FORMATS]
          WriteString(S_FORMATS, S_Integer, IntegerFmt);
          WriteString(S_FORMATS, S_Float, FloatFmt);
          WriteString(S_FORMATS, S_Date, DateFmt);
          WriteString(S_FORMATS, S_Time, TimeFmt);
          WriteString(S_FORMATS, S_DateTime, DateTimeFmt);
          WriteString(S_FORMATS, S_Currency, CurrencyFmt);
          WriteString(S_FORMATS, S_BooleanTrue, BooleanTrue);
          WriteString(S_FORMATS, S_BooleanFalse, BooleanFalse);
          WriteString(S_FORMATS, S_NullString, NullString);
          // [USER_FORMATS]
          for i := 0 to lstUserFormats.Items.Count - 1 do
            WriteString(S_USER_FORMATS, lstUserFormats.Items[i].Caption,
              lstUserFormats.Items[i].SubItems[1]);
        end;
        // [FIELDS]
        EraseSection(S_FIELDS);
        for i := 0 to lstExportedFields.Items.Count - 1 do
          WriteString(S_FIELDS, S_Field + IntToStr(i),
            lstExportedFields.Items[i].Caption);
        // [HEADER] & [FOOTER]
        EraseSection(S_HEADER);
        EraseSection(S_FOOTER);
        if tshHeaderFooter.TabVisible then begin
          for i := 0 to memHeader.Lines.Count - 1 do
            WriteString(S_HEADER, S_Line + IntToStr(i), memHeader.Lines[i]);
          for i := 0 to memFooter.Lines.Count - 1 do
            WriteString(S_FOOTER, S_Line + IntToStr(i), memFooter.Lines[i]);
        end;
        // [CAPTIONS & WIDTH & ALIGN]
        EraseSection(S_CAPTIONS);
        EraseSection(S_WIDTH);
        EraseSection(S_ALIGN);
        if tshCaptions.TabVisible then begin
          for i := 1 to sgrCaptions.RowCount - 1 do begin
            WriteString(S_CAPTIONS, sgrCaptions.Cells[0, i],
              sgrCaptions.Cells[1, i]);
            if ExportType in [aeTXT, aeRTF, aeWord, aeHTML, aePDF]
              then WriteString(S_ALIGN, sgrCaptions.Cells[0, i],
                sgrCaptions.Cells[2, i]);
            if ExportType in [aeTXT, aeRTF, aeWord, aeXLS, aePDF]
              then WriteInteger(S_WIDTH, sgrCaptions.Cells[0, i],
                StrToInt(sgrCaptions.Cells[2 + Integer(ExportType <> aeXLS), i]));
          end;
        end;

        EraseSection(S_XLS);
        ReadSections(AStrings);
        for i := AStrings.Count - 1 downto 0 do
          if Pos(S_XLS_FIELD, AnsiUpperCase(AStrings[i])) > 0
            then EraseSection(AStrings[i]);
        EraseSection(S_RTF);
        EraseSection(S_HTML);
        EraseSection(S_SQL);
        EraseSection(S_XML);
        case ExportType of
          // [XLS]
          aeXLS: begin
            WriteString(S_XLS, S_PageHeader, XLSPageHeader);
            WriteString(S_XLS, S_PageFooter, XLSPageFooter);
            WriteString(S_XLS, S_SheetTitle, XLSSheetTitle);
            WriteInteger(S_XLS, S_StripType, Integer(XLSStripType));
            WriteBool(S_XLS, S_AutoCalcColWidth, XLSAutoCalcColWidth);
            WriteString(S_XLS, S_PageBackground, XLSPageBackground);

            for j := 1 to 3 do begin
              case j of
                1: begin
                  LV := lstXLSFields;
                  prefix := S_XLS_FIELD;
                end;
                2: begin
                  LV := lstXLSOptions;
                  prefix := S_XLS_OPTION;
                end;
                3: begin
                  LV := lstXLSStyles;
                  prefix := S_XLS_STYLE;
                end;
                else LV := nil
              end;
              for i := 0 to LV.Items.Count - 1 do begin
                str := prefix + AnsiUpperCase(LV.Items[i].Caption);
                xlsFormat := TxlsFieldFormat(LV.Items[i].Data);
                xlsFormat.SaveToIniFile(FIniFile, str);
              end;
            end;

            // hypelinks
            for j := 0 to FXLSHyperlinkNode.Count - 1 do begin
              str := S_XLS_HYPERLINK + '%d';
              str := Format(str, [j]);
              TxlsHyperlink(FXLSHyperlinkNode[j].Data).SaveToIniFile(FIniFile, str);
            end;
            // notes
            for j := 0 to FXLSNoteNode.Count - 1 do begin
              str := S_XLS_NOTE + '%d';
              str := Format(str, [j]);
              TxlsNote(FXLSNoteNode[j].Data).SaveToIniFile(FIniFile, str);
            end;
            // charts
            for j := 0 to FXLSChartNode.Count - 1 do begin
              str := S_XLS_CHART + '%d';
              str := Format(str, [j]);
              TxlsChart(FXLSChartNode[j].Data).SaveToIniFile(FIniFile, str);
            end;
            // cells
            for j := 0 to FXLSCellNode.Count - 1 do begin
              str := S_XLS_CELL + '%d';
              str := Format(str, [j]);
              TxlsCell(FXLSCellNode[j].Data).SaveToIniFile(FIniFile, str);
            end;
            // merged cells
            for j := 0 to FXLSMergedCellNode.Count - 1 do begin
              str := S_XLS_MERGED_CELL + '%d';
              str := Format(str, [j]);
              TxlsMergedCells(FXLSCellNode[j].Data).SaveToIniFile(FIniFile, str);
            end;
          end;
          // [RTF]
          aeRTF, aeWord: begin
            WriteInteger(S_RTF, S_RTF_PageOrientation,
              Integer(RTFPageOrientation));
            WriteInteger(S_RTF, S_RTF_StripType,
              Integer(RTFStripType));

            for j := 1 to 2 do begin
              case j of
                1: begin
                  LV := lstRTFBaseStyles;
                  prefix := S_RTF_STYLE;
                end;
                2: begin
                  LV := lstRTFStripStyles;
                  prefix := S_RTF_STRIP_STYLE;
                end;
                else LV := nil
              end;
              for i := 0 to LV.Items.Count - 1 do begin
                str := prefix + AnsiUpperCase(LV.Items[i].Caption);
                rtfStyle := TrtfStyle(LV.Items[i].Data);
                rtfStyle.SaveToIniFile(FIniFile, str);
              end;
            end;
          end;
          // [HTML]
          aeHTML: begin
             WriteString(S_HTML, S_HTML_Title, HTMLTitle);
             WriteInteger(S_HTML, S_HTML_CSS, Integer(HTMLUsingCSS));
             WriteString(S_HTML, S_HTML_CSSFile, HTMLCSSFileName);
             WriteBool(S_HTML, S_HTML_OverwriteCSSFile, HTMLOverwriteCSSFile);

             WriteInteger(S_HTML, S_HTML_FileRecCount, HTMLFileRecCount);
             WriteBool(S_HTML, S_HTML_GenerateIndex, HTMLGenerateIndex);
             WriteString(S_HTML, S_HTML_IndexLinkTemplate, HTMLIndexLinkTemplate);
             WriteBool(S_HTML, S_HTML_NavigationOnTop, HTMLNavigationOnTop);
             WriteBool(S_HTML, S_HTML_NavigationOnBottom, HTMLNavigationOnBottom);
             WriteString(S_HTML, S_HTML_IndexLinkTitle, HTMLIndexLinkTitle);
             WriteString(S_HTML, S_HTML_FirstLinkTitle, HTMLFirstLinkTitle);
             WriteString(S_HTML, S_HTML_PriorLinkTitle, HTMLPriorLinkTitle);
             WriteString(S_HTML, S_HTML_NextLinkTitle, HTMLNextLinkTitle);
             WriteString(S_HTML, S_HTML_LastLinkTitle, HTMLLastLinkTitle);

             WriteString(S_HTML, S_HTML_FontName, HTMLFontName);
             WriteString(S_HTML, S_HTML_BackgroundFile, HTMLBackground);
             WriteString(S_HTML, S_HTML_BodyAdvanced, HTMLBodyAdvanced);
             WriteInteger(S_HTML, S_HTML_CellPadding, HTMLCellPadding);
             WriteInteger(S_HTML, S_HTML_CellSpacing, HTMLCellSpacing);
             WriteInteger(S_HTML, S_HTML_BorderWidth, HTMLBorderWidth);
             WriteString(S_HTML, S_HTML_TableBackground, HTMLTableBackground);
             WriteString(S_HTML, S_HTML_TableAdvanced, HTMLTableAdvanced);

             WriteString(S_HTML, S_HTML_BackgroundColor,
               ColorToString(HTMLBackgroundColor));
             WriteString(S_HTML, S_HTML_FontColor,
               ColorToString(HTMLFontColor));
             WriteString(S_HTML, S_HTML_HeadBackgroundColor,
               ColorToString(paHTMLColumnHead_1.Color));
             WriteString(S_HTML, S_HTML_HeadFontColor,
               ColorToString(laHTMLHead_1.Font.Color));
             WriteString(S_HTML, S_HTML_OddRowBackgroundColor,
               ColorToString(paHTMLOddRowCol_1.Color));
             WriteString(S_HTML, S_HTML_EvenRowBackgroundColor,
               ColorToString(paHTMLEvenRowCol_1.Color));
             WriteString(S_HTML, S_HTML_DataFontColor,
               ColorToString(laHTMLData_1.Font.Color));
             WriteString(S_HTML, S_HTML_LinkColor,
               ColorToString(laHTMLLink.Font.Color));
             WriteString(S_HTML, S_HTML_VLinkColor,
               ColorToString(laHTMLVLink.Font.Color));
             WriteString(S_HTML, S_HTML_ALinkColor,
               ColorToString(laHTMLALink.Font.Color));
          end;
          // [PDF]
          aePDF: begin
            WriteString(S_PDF, S_PDF_ColSpacing,
              FormatFloat('0.0', PDFColSpacing));
            WriteString(S_PDF, S_PDF_RowSpacing,
              FormatFloat('0.0', PDFRowSpacing));
            WriteInteger(S_PDF, S_PDF_GridLineWidth, PDFGridLineWidth);

            WriteInteger(S_PDF, S_PDF_PageFormat, Integer(PDFPageFormat));
            WriteInteger(S_PDF, S_PDF_PageUnits, Integer(PDFPageUnits));
            WriteInteger(S_PDF, S_PDF_PageOrientation,
              Integer(PDFPageOrientation));

            WriteInteger(S_PDF, S_PDF_PageWidth, FPDFPageWidth);
            WriteInteger(S_PDF, S_PDF_PageHeight, FPDFPageHeight);
            WriteInteger(S_PDF, S_PDF_PageMarginLeft, FPDFPageMarginLeft);
            WriteInteger(S_PDF, S_PDF_PageMarginRight, FPDFPageMarginRight);
            WriteInteger(S_PDF, S_PDF_PageMarginTop, FPDFPageMarginTop);
            WriteInteger(S_PDF, S_PDF_PageMarginBottom, FPDFPageMarginBottom);
            //--- Header
            WriteInteger(S_PDF_OPTION_HEADER, S_PDF_FontName,
              Integer(PDFExp.Options.HeaderFont.BaseFont));
            WriteInteger(S_PDF_OPTION_HEADER, S_PDF_FontEncoding,
              Integer(PDFExp.Options.HeaderFont.FontEncoding));
            WriteInteger(S_PDF_OPTION_HEADER, S_PDF_FontSize,
              Integer(PDFExp.Options.HeaderFont.FontSize));
            WriteString(S_PDF_OPTION_HEADER, S_PDF_FontColor,
              ColorToString(PDFExp.Options.HeaderFont.FontColor));
            //--- Caption
            WriteInteger(S_PDF_OPTION_CAPTION, S_PDF_FontName,
              Integer(PDFExp.Options.CaptionFont.BaseFont));
            WriteInteger(S_PDF_OPTION_CAPTION, S_PDF_FontEncoding,
              Integer(PDFExp.Options.CaptionFont.FontEncoding));
            WriteInteger(S_PDF_OPTION_CAPTION, S_PDF_FontSize,
              Integer(PDFExp.Options.CaptionFont.FontSize));
            WriteString(S_PDF_OPTION_CAPTION, S_PDF_FontColor,
              ColorToString(PDFExp.Options.CaptionFont.FontColor));
            //--- Data
            WriteInteger(S_PDF_OPTION_DATA, S_PDF_FontName,
              Integer(PDFExp.Options.DataFont.BaseFont));
            WriteInteger(S_PDF_OPTION_DATA, S_PDF_FontEncoding,
              Integer(PDFExp.Options.DataFont.FontEncoding));
            WriteInteger(S_PDF_OPTION_DATA, S_PDF_FontSize,
              Integer(PDFExp.Options.DataFont.FontSize));
            WriteString(S_PDF_OPTION_DATA, S_PDF_FontColor,
              ColorToString(PDFExp.Options.DataFont.FontColor));
            //--- Footer
            WriteInteger(S_PDF_OPTION_FOOTER, S_PDF_FontName,
              Integer(PDFExp.Options.FooterFont.BaseFont));
            WriteInteger(S_PDF_OPTION_FOOTER, S_PDF_FontEncoding,
              Integer(PDFExp.Options.FooterFont.FontEncoding));
            WriteInteger(S_PDF_OPTION_FOOTER, S_PDF_FontSize,
              Integer(PDFExp.Options.FooterFont.FontSize));
            WriteString(S_PDF_OPTION_FOOTER, S_PDF_FontColor,
              ColorToString(PDFExp.Options.FooterFont.FontColor));
          end;
          // [XML]
          aeXML: begin
            WriteBool(S_XML, S_XML_Standalone, XMLStandAlone);
            WriteString(S_XML, S_XML_Encoding, XMLEncoding);
          end;
          // [SQL]
          aeSQL: begin
            WriteString(S_SQL, S_SQL_TableName, SQLTableName);
            WriteBool(S_SQL, S_SQL_CreateTable, SQLCreateTable);
            WriteInteger(S_SQL, S_SQL_CommitRecCount, SQLCommitRecCount);
            WriteBool(S_SQL, S_SQL_CommitAfterScript, SQLCommitAfterScript);
            WriteString(S_SQL, S_SQL_CommitStatement, SQLCommitStatement);
            WriteString(S_SQL, S_SQL_StatementTerm, SQLStatementTerm);
          end;
          // [TXT]
          aeTXT: begin
            WriteBool(S_TXT, S_TXT_AutoCalcColWidth, TXTAutoCalcColWidth);
            WriteInteger(S_TXT, S_TXT_Spacing, TXTSpacing);
          end;
          // [CSV]
          aeCSV: begin
            WriteBool(S_CSV, S_CSV_QuoteStrings, CSVQuoteStrings);
            WriteString(S_CSV, S_CSV_Comma, Char2Str(CSVComma));
            WriteString(S_CSV, S_CSV_Quote, Char2Str(CSVQuote));
          end;
        end;
      end;
    finally
      AStrings.Free;
    end;
  finally
    FIniFile.Free;
  end;
end;

procedure TQExport3DialogF.bStartClick(Sender: TObject);

  function CalcAlignment(const Value: string): string;
  var
    Index: integer;
  begin
    Index := cbxColumnAlign.Items.IndexOf(Value);
    Result := 'Left';
    case Index of
      1: Result := 'Center';
      2: Result := 'Right';
    end;
  end;

var
  i, j: integer;
  str, ext: string;
begin
//William M. Santos
try
  if Dialog.AutoChangeFileExt then
    ChangeFileExtension;

  case ExportType of
    aeXLS: begin
      QuickExport := XLSExp;

      XLSExp.Options.PageHeader := XLSPageHeader;
      XLSExp.Options.PageFooter := XLSPageFooter;
      XLSExp.Options.SheetTitle := XLSSheetTitle;
      XLSExp.StripType := XLSStripType;
      XLSExp.AutoCalcColWidth := XLSAutoCalcColWidth;
      XLSExp.Background.FileName := XLSPageBackground;

      XLSExp.Options.HeaderFormat.Assign(TxlsFormat(lstXLSOptions.Items[0].Data));
      XLSExp.Options.CaptionsFormat.Assign(TxlsFormat(lstXLSOptions.Items[1].Data));
      XLSExp.Options.AggregateFormat.Assign(TxlsFormat(lstXLSOptions.Items[2].Data));
      XLSExp.Options.FooterFormat.Assign(TxlsFormat(lstXLSOptions.Items[3].Data));
      XLSExp.Options.HyperlinkFormat.Assign(TxlsFormat(lstXLSOptions.Items[4].Data));
      XLSExp.FieldFormats.Clear;
      if lstExportedFields.Items.Count > 0 then begin
        for i := 0 to lstExportedFields.Items.Count - 1 do
          for j := 0 to lstXLSFields.Items.Count - 1 do
            if AnsiCompareText(lstExportedFields.Items[i].Caption,
                               lstXLSFields.Items[j].Caption) = 0 then
              with XLSExp.FieldFormats.Add do begin
                FieldName := lstXLSFields.Items[j].Caption;
                Assign(TxlsFieldFormat(lstXLSFields.Items[j].Data));
              end;
      end
      else begin
        for i := 0 to lstAvailableFields.Items.Count - 1 do
          for j := 0 to lstXLSFields.Items.Count - 1 do
            if AnsiCompareText(lstAvailableFields.Items[i].Caption,
                               lstXLSFields.Items[j].Caption) = 0 then
              with XLSExp.FieldFormats.Add do begin
                FieldName := lstXLSFields.Items[j].Caption;
                Assign(TxlsFormat(lstXLSFields.Items[j].Data));
              end;
      end;
      XLSExp.StripStyles.Clear;
      for i := 0 to lstXLSStyles.Items.Count - 1 do
        XLSExp.StripStyles.Add.Assign(TxlsFormat(lstXLSStyles.Items[i].Data));
      XLSExp.Hyperlinks.Clear;
      for i := 0 to FXLSHyperlinkNode.Count - 1 do
        XLSExp.Hyperlinks.Add.Assign(TxlsHyperlink(FXLSHyperlinkNode[i].Data));
      XLSExp.Notes.Clear;
      for i := 0 to FXLSNoteNode.Count - 1 do
        XLSExp.Notes.Add.Assign(TxlsNote(FXLSNoteNode[i].Data));
      XLSExp.Charts.Clear;
      for i := 0 to FXLSChartNode.Count - 1 do
        XLSExp.Charts.Add.Assign(TxlsChart(FXLSChartNode[i].Data));
      XLSExp.Cells.Clear;
      for i := 0 to FXLSCellNode.Count - 1 do
        XLSExp.Cells.Add.Assign(TxlsCell(FXLSCellNode[i].Data));
      XLSExp.MergedCells.Clear;
      for i := 0 to FXLSMergedCellNode.Count - 1 do
        XLSExp.MergedCells.Add.Assign(TxlsMergedCells(FXLSMergedCellNode[i].Data));
    end;
    aeWord,
    aeRTF: begin
      QuickExport := RTFExp;
      RTFExp.Options.PageOrientation := RTFPageOrientation;
      RTFExp.Options.StripType := RTFStripType;

      RTFExp.Options.HeaderStyle.Assign(TrtfStyle(lstRTFBaseStyles.Items[0].Data));
      RTFExp.Options.CaptionStyle.Assign(TrtfStyle(lstRTFBaseStyles.Items[1].Data));
      RTFExp.Options.DataStyle.Assign(TrtfStyle(lstRTFBaseStyles.Items[2].Data));
      RTFExp.Options.FooterStyle.Assign(TrtfStyle(lstRTFBaseStyles.Items[3].Data));

      RTFExp.Options.StripStyles.Clear;
      for i := 0 to lstRTFStripStyles.Items.Count - 1 do
        RTFExp.Options.StripStyles.Add.Assign(TrtfStyle(lstRTFStripStyles.Items[i].Data));
    end;
    aeHTML: begin
      QuickExport := HTMLExp;
      with HTMLExp do begin
        Title := HTMLTitle;
        UsingCSS := HTMLUsingCSS;
        CSSFileName := HTMLCSSFileName;
        OverwriteCSSFile := HTMLOverwriteCSSFile;

        MaxRecords := 0;
        if HTMLUseMultiFileExport then
          MaxRecords := HTMLFileRecCount;
        GenerateIndex := HTMLGenerateIndex;
        Navigation.IndexLinkTemplate := HTMLIndexLinkTemplate;
        Navigation.OnTop := HTMLNavigationOnTop;
        Navigation.OnBottom := HTMLNavigationOnBottom;
        Navigation.IndexLinkTitle := HTMLIndexLinkTitle;
        Navigation.FirstLinkTitle := HTMLFirstLinkTitle;
        Navigation.PriorLinkTitle := HTMLPriorLinkTitle;
        Navigation.NextLinkTitle := HTMLNextLinkTitle;
        Navigation.LastLinkTitle := HTMLLastLinkTitle;

        HTMLOptions.TextFont.Name := HTMLFontName;
        HTMLOptions.BackgroundFileName := HTMLBackground;
        HTMLOptions.AdvancedAttributes.Text := HTMLBodyAdvanced;

        TableOptions.CellPadding := HTMLCellPadding;
        TableOptions.CellSpacing := HTMLCellSpacing;
        TableOptions.Border := HTMLBorderWidth;
        TableOptions.BackgroundFileName := HTMLTableBackground;
        TableOptions.AdvancedAttributes.Text := HTMLTableAdvanced;

        HTMLOptions.BackgroundColor := HTMLBackgroundColor;
        HTMLOptions.TextFont.Color := HTMLFontColor;

        TableOptions.HeadersRowBgColor := HTMLHeadBackgroundColor;
        TableOptions.HeadersRowFontColor := HTMLHeadFontColor;
        TableOptions.OddRowBgColor := HTMLOddRowBackgroundColor;
        TableOptions.TableBgColor := HTMLEvenRowBackgroundColor;
        TableOptions.TableFontColor := HTMLDataFontColor;

        HTMLOptions.LinkColor := HTMLLinkColor;
        HTMLOptions.VLinkColor := HTMLVLinkColor;
        HTMLOptions.ALinkColor := HTMLALinkColor;
      end;
    end;
    aeTXT,
    aeCSV,
    aeDIFF,
    aeSylk: begin
      QuickExport := ASCIIExp;
      case ExportType of
        aeTXT: begin
          ASCIIExp.ExportType := etTXT;
          ASCIIExp.AutoCalcColWidth := TXTAutoCalcColWidth;
          ASCIIExp.TXTSpacing := TXTSpacing;
        end;
        aeCSV: begin
          ASCIIExp.ExportType := etCSV;
          ASCIIExp.CSVQuoteStrings := CSVQuoteStrings;
          ASCIIExp.CSVComma := CSVComma;
          ASCIIExp.CSVQuote := CSVQuote;
        end;
        aeDIFF: ASCIIExp.ExportType := etDIF;
        aeSylk: ASCIIExp.ExportType := etSYLK;
      end;
    end;
    aeXML: begin
      QuickExport := XMLExp;
      XMLExp.Options.StandAlone := XMLStandAlone;
      XMLExp.Options.Encoding := XMLEncoding;
    end;
    aeDBF: QuickExport := DBFExp;
    aeLaTeX: QuickExport := LaTeXExp;
    aeSQL: begin
      QuickExport := SQLExp;
      SQLExp.TableName := SQLTableName;
      if SQLExp.TableName = EmptyStr then begin
        str := ExtractFileName(FileName);
        ext := ExtractFileExt(FileName);
        if ext <> EmptyStr then
          Delete(str, Length(str) - Length(ext) + 1, Length(ext));
        SQLExp.TableName := AnsiUpperCase(str);
      end;
      SQLExp.CreateTable := SQLCreateTable;
      SQLExp.CommitRecCount := SQLCommitRecCount;
      SQLExp.CommitAfterScript := SQLCommitAfterScript;
      SQLExp.CommitStatement := SQLCommitStatement;
      if Length(SQLStatementTerm) > 0 then
        SQLExp.StatementTerm := SQLStatementTerm[1];
    end;
    aeClipboard: QuickExport := ClipExp;
    aePDF: begin
      QuickExport := PDFExp;
      PDFExp.Options.ColSpacing := PDFColSpacing;
      PDFExp.Options.RowSpacing := PDFRowSpacing;
      PDFExp.Options.GridLineWidth := PDFGridLineWidth;

      PDFExp.Options.PageOptions.Format := PDFPageFormat;
      if PDFPageFormat = pfUser then begin
        PDFExp.Options.PageOptions.Width := FPDFPageWidth;
        PDFExp.Options.PageOptions.Height := FPDFPageHeight;
      end;
      PDFExp.Options.PageOptions.Orientation := PDFPageOrientation;
      PDFExp.Options.PageOptions.MarginLeft :=
        Dot2Units(PDFPageUnits, FPDFPageMarginLeft);
      PDFExp.Options.PageOptions.MarginRight :=
        Dot2Units(PDFPageUnits, FPDFPageMarginRight);
      PDFExp.Options.PageOptions.MarginTop :=
        Dot2Units(PDFPageUnits, FPDFPageMarginTop);
      PDFExp.Options.PageOptions.MarginBottom :=
        Dot2Units(PDFPageUnits, FPDFPageMarginBottom);
    end;
  end;
  QuickExport.AutoCalcStrType := Dialog.AutoCalcStrType;
  QuickExport.GoToFirstRecord := GoToFirstRecord;
  QuickExport.CurrentRecordOnly := CurrentRecordOnly;
  QuickExport.ExportEmpty := ExportEmpty;
  QuickExport.ExportRecCount := ExportRecCount;
  QuickExport.SkipRecCount := SkipRecCount;

  QuickExport.Header.Assign(memHeader.Lines);
  QuickExport.Footer.Assign(memFooter.Lines);
  QuickExport.ExportedFields.Clear;
  if lstExportedFields.Items.Count > 0 then
    for i := 0 to lstExportedFields.Items.Count - 1 do
      QuickExport.ExportedFields.Add(lstExportedFields.Items[i].Caption)
  else
    for i := 0 to lstAvailableFields.Items.Count - 1 do
      if not Dialog.Columns[Integer(lstAvailableFields.Items[i].Data)].IsBlob then
        QuickExport.ExportedFields.Add(lstAvailableFields.Items[i].Caption);

  QuickExport.Formats.IntegerFormat := IntegerFmt;
  QuickExport.Formats.FloatFormat := FloatFmt;
  QuickExport.Formats.DateFormat := DateFmt;
  QuickExport.Formats.TimeFormat := TimeFmt;
  QuickExport.Formats.DateTimeFormat := DateTimeFmt;
  QuickExport.Formats.CurrencyFormat := CurrencyFmt;
  QuickExport.Formats.BooleanTrue := BooleanTrue;
  QuickExport.Formats.BooleanFalse := BooleanFalse;
  QuickExport.Formats.NullString := NullString;

  QuickExport.UserFormats.Clear;
  for i := 0 to lstUserFormats.Items.Count - 1 do
    QuickExport.UserFormats.Values[lstUserFormats.Items[i].Caption] :=
      lstUserFormats.Items[i].SubItems[1];

  QuickExport.ExportSource := ExportSource;
  QuickExport.DataSet := DataSet;
  QuickExport.CustomSource := CustomSource;
  QuickExport.ListView := ListView;
  QuickExport.DBGrid := DBGrid;
  QuickExport.StringGrid := StringGrid;

  if QuickExport is TQExport3Text then
    with QuickExport as TQExport3Text do begin
      FileName := Self.FileName;
      ShowFile :=  Self.ShowFile;
      PrintFile := Self.PrintFile;
    end;

  if QuickExport is TQExport3FormatText then begin
    (QuickExport as TQExport3FormatText).AllowCaptions := AllowCaptions;
    (QuickExport as TQExport3FormatText).CaptionRow := CaptionRow;
  end;

  QuickExport.Captions.Clear;
  for i := 1 to sgrCaptions.RowCount - 1 do begin
    if AnsiCompareStr(sgrCaptions.Cells[0, i], sgrCaptions.Cells[1, i]) <> 0 then
      QuickExport.Captions.Values[sgrCaptions.Cells[0, i]] := sgrCaptions.Cells[1, i];

    if QuickExport is TQExport3ASCII then
      with QuickExport as TQExport3ASCII do begin
        ColumnsAlign.Values[sgrCaptions.Cells[0, i]] :=
          CalcAlignment(sgrCaptions.Cells[2, i]);
        ColumnsWidth.Values[sgrCaptions.Cells[0, i]] :=
          sgrCaptions.Cells[3, i];
      end;

    if QuickExport is TQExport3RTF then
      with QuickExport as TQExport3RTF do begin
        ColumnsAlign.Values[sgrCaptions.Cells[0, i]] :=
          CalcAlignment(sgrCaptions.Cells[2, i]);
        ColumnsWidth.Values[sgrCaptions.Cells[0, i]] :=
          sgrCaptions.Cells[3, i];
      end;

    if QuickExport is TQExport3PDF then
      with QuickExport as TQExport3PDF do begin
        ColumnsAlign.Values[sgrCaptions.Cells[0, i]] :=
          CalcAlignment(sgrCaptions.Cells[2, i]);
        ColumnsWidth.Values[sgrCaptions.Cells[0, i]] :=
          sgrCaptions.Cells[3, i];
      end;

    if QuickExport is TQExport3HTML then
      with QuickExport as TQExport3HTML do
        ColumnsAlign.Values[sgrCaptions.Cells[0, i]] :=
          CalcAlignment(sgrCaptions.Cells[2, i]);

    if QuickExport is TQExport3XLS then
      with QuickExport as TQExport3XLS do
        ColumnsWidth.Values[sgrCaptions.Cells[0, i]] := sgrCaptions.Cells[2, i];
  end;

  QuickExport.OnBeginExport := OnBeginExport;
  QuickExport.OnEndExport := OnEndExport;
  QuickExport.OnSkippedRecord := OnSkippedRecord;
  QuickExport.OnExportedRecord := OnExportedRecord;
  QuickExport.OnStopExport := OnStopExport;
  QuickExport.OnGetExportText := OnGetExportText;
  QuickExport.OnBeforeExportRow := OnBeforeExportRow;

  FProgress := TfmQExport3Progress.CreateProgress(Self, QuickExport);
  try
    FProgress.Show;
    QuickExport.Execute;
    if ShowFile then
    begin
      if not QuickExport.Aborted and Assigned(FProgress) then
      begin
        PostMessage(FProgress.Handle, WM_QEXPORT_PROGRESS, QEP_DONE, 0);
        Application.ProcessMessages;
      end;
    end
    else
      while FProgress.ModalResult <> mrOk do
        Application.ProcessMessages;
  finally
    FProgress.Free;
  end;
except
  Application.MessageBox('Não foi possível a Exportação deste Arquivo, pois o mesmo encontra-se em uso. Verifique!','Mensagem do Sistema',Mb_IconExclamation);
end;
end;

procedure TQExport3DialogF.OnBeginExport(Sender: TObject);
begin
  if Assigned(FProgress) then begin
    PostMessage(FProgress.Handle, WM_QEXPORT_PROGRESS, QEP_START, 0);
    Application.ProcessMessages;
  end;
  if Assigned(Dialog.OnBeginExport) then Dialog.OnBeginExport(QuickExport);
end;

procedure TQExport3DialogF.OnEndExport(Sender: TObject);
begin
  if Assigned(FProgress) then begin
    if not QuickExport.Aborted then
      PostMessage(FProgress.Handle, WM_QEXPORT_PROGRESS, QEP_FINISH, 0);
    Application.ProcessMessages;
  end;
  if Assigned(Dialog.OnEndExport) then Dialog.OnEndExport(QuickExport);
end;

procedure TQExport3DialogF.OnSkippedRecord(Sender: TObject;
  RecNo: Integer);
begin
  if Assigned(FProgress) then begin
    PostMessage(FProgress.Handle, WM_QEXPORT_PROGRESS, QEP_SKIPPED, 0);
    Application.ProcessMessages;
  end;
  if Assigned(Dialog.OnSkippedRecord) then
    Dialog.OnSkippedRecord(QuickExport, RecNo);
end;

procedure TQExport3DialogF.OnBeforeExportRow(Sender: TObject;
  Row: TQExportRow; var Accept: Boolean);
begin
  if Assigned(Dialog.OnBeforeExportRow) then
    Dialog.OnBeforeExportRow(QuickExport, Row, Accept);
end;

procedure TQExport3DialogF.OnExportedRecord(Sender: TObject; RecNo: Integer);
begin
  if Assigned(Dialog.OnExportedRecord) then
    Dialog.OnExportedRecord(QuickExport, RecNo);
  if Assigned(FProgress) then begin
    PostMessage(FProgress.Handle, WM_QEXPORT_PROGRESS, QEP_EXPORTED, 0);
    Application.ProcessMessages;
  end;
end;

procedure TQExport3DialogF.OnFetchedRecord(Sender: TObject;
  RecNo: Integer);
begin
  if Assigned(Dialog.OnFetchedRecord) then
    Dialog.OnFetchedRecord(QuickExport, RecNo);
  if Assigned(FProgress) then begin
    PostMessage(FProgress.Handle, WM_QEXPORT_PROGRESS, QEP_FETCHED, 0);
    Application.ProcessMessages;
  end;
end;

procedure TQExport3DialogF.OnStopExport(Sender: TObject;
  var CanContinue: Boolean);
begin
  if Assigned(FProgress) then begin
    PostMessage(FProgress.Handle, WM_QEXPORT_PROGRESS, QEP_PAUSE, 0);
    Application.ProcessMessages;
  end;
  CanContinue := Application.MessageBox(PChar({$IFDEF WIN32}QExportLoadStr(QEM_StopExportConfirm){$ENDIF}
                                              {$IFDEF LINUX}QEM_StopExportConfirm{$ENDIF}),
                            PChar({$IFDEF WIN32}QExportLoadStr(QEM_StopExportCaption){$ENDIF}
                                  {$IFDEF LINUX}QEM_StopExportCaption{$ENDIF}),
                            MB_YESNO + MB_ICONQUESTION + MB_DEFBUTTON2) = ID_NO;
  if Assigned(Dialog.OnStopExport) then Dialog.OnStopExport(Dialog, CanContinue);
  if Assigned(FProgress) then begin
    if CanContinue
      then PostMessage(FProgress.Handle, WM_QEXPORT_PROGRESS, QEP_CONTINUE, 0)
      else PostMessage(FProgress.Handle, WM_QEXPORT_PROGRESS, QEP_ABORT, 0);
    Application.ProcessMessages;
  end;
end;

procedure TQExport3DialogF.OnGetExportText(Sender: TObject;
  ColNo: Integer; var Text: WideString);
begin
  if Assigned(Dialog.OnGetExportText) then
    Dialog.OnGetExportText(QuickExport, ColNo, Text);
end;

procedure TQExport3DialogF.SetCaptions;
var
  DC: HDC;
  Size: TSize;
begin
  laFileName.Caption := {$IFDEF WIN32}QExportLoadStr(QED_FileName){$ENDIF}
                        {$IFDEF LINUX}QED_FileName{$ENDIF};
  bBrowse.Caption := {$IFDEF WIN32}QExportLoadStr(QED_SelectFile){$ENDIF}
                     {$IFDEF LINUX}QED_SelectFile{$ENDIF};
  chShowFile.Caption := {$IFDEF WIN32}QExportLoadStr(QED_OpenAfterExport){$ENDIF}
                        {$IFDEF LINUX}QED_OpenAfterExport{$ENDIF};
  chPrintFile.Caption := {$IFDEF WIN32}QExportLoadStr(QED_PrintAfterExport){$ENDIF}
                         {$IFDEF LINUX}QED_PrintAfterExport{$ENDIF};
  // Export Type
  tshExportType.Caption := {$IFDEF WIN32}QExportLoadStr(QED_ExportType_Title){$ENDIF}
                           {$IFDEF LINUX}QED_ExportType_Title{$ENDIF};
  tshExportFormats.Caption := {$IFDEF WIN32}QExportLoadStr(QED_ExportType_Formats){$ENDIF}
                              {$IFDEF LINUX}QED_ExportType_Formats{$ENDIF};
  rgExportType.Caption := {$IFDEF WIN32}QExportLoadStr(QED_ExportType_ExportTo){$ENDIF}
                          {$IFDEF LINUX}QED_ExportType_ExportTo{$ENDIF};
  bTools.Caption := {$IFDEF WIN32}QExportLoadStr(QED_Tools){$ENDIF}
                    {$IFDEF LINUX}QED_Tools{$ENDIF};
  miSaveOptions.Caption := {$IFDEF WIN32}QExportLoadStr(QED_ExportType_Save){$ENDIF}
                           {$IFDEF LINUX}QED_ExportType_Save{$ENDIF};
  miLoadOptions.Caption := {$IFDEF WIN32}QExportLoadStr(QED_ExportType_Load){$ENDIF}
                           {$IFDEF LINUX}QED_ExportType_Load{$ENDIF};

  tshExportOptions.Caption := {$IFDEF WIN32}QExportLoadStr(QED_ExportType_Options){$ENDIF}
                              {$IFDEF LINUX}QED_ExportType_Options{$ENDIF};
  gbExportConstraints.Caption := {$IFDEF WIN32}QExportLoadStr(QED_ExportType_Constraints){$ENDIF}
                                 {$IFDEF LINUX}QED_ExportType_Constraints{$ENDIF};
  chGoToFirstRecord.Caption := {$IFDEF WIN32}QExportLoadStr(QED_ExportType_Options_GoToFirstRecord){$ENDIF}
                               {$IFDEF LINUX}QED_ExportType_Options_GoToFirstRecord{$ENDIF};
  chCurrentRecordOnly.Caption := {$IFDEF WIN32}QExportLoadStr(QED_ExportType_Options_CurrentRecordOnly){$ENDIF}
                                 {$IFDEF LINUX}QED_ExportType_Options_CurrentRecordOnly{$ENDIF};
  chExportEmpty.Caption := {$IFDEF WIN32}QExportLoadStr(QED_ExportType_Options_ExportEmpty){$ENDIF}
                           {$IFDEF LINUX}QED_ExportType_Options_ExportEmpty{$ENDIF};
  laSkipRecCount_01.Caption := {$IFDEF WIN32}QExportLoadStr(QED_ExportType_Options_SkipRecCount){$ENDIF}
                               {$IFDEF LINUX}QED_ExportType_Options_SkipRecCount{$ENDIF};
  edSkipRecCount.Left := laSkipRecCount_01.Left + laSkipRecCount_01.Width + 4;
  laSkipRecCount_02.Left := edSkipRecCount.Left + edSkipRecCount.Width + 4;
  laSkipRecCount_02.Caption := {$IFDEF WIN32}QExportLoadStr(QED_ExportType_Options_Records){$ENDIF}
                               {$IFDEF LINUX}QED_ExportType_Options_Records{$ENDIF};

  rbExportAllRecords.Caption := {$IFDEF WIN32}QExportLoadStr(QED_ExportType_ExportAllRecords){$ENDIF}
                                {$IFDEF LINUX}QED_ExportType_ExportAllRecords{$ENDIF};
  rbExportOnly.Caption := {$IFDEF WIN32}QExportLoadStr(QED_ExportType_Options_ExportRecCount){$ENDIF}
                          {$IFDEF LINUX}QED_ExportType_Options_ExportRecCount{$ENDIF};
  DC := GetDC(rbExportOnly.Handle);
  try
    GetTextExtentPoint32(DC, PChar(rbExportOnly.Caption),
      Length(rbExportOnly.Caption), Size);
  finally
    ReleaseDC(rbExportOnly.Handle, DC);
  end;
  rbExportOnly.Width := Size.cx;
  edExportRecCount.Left := rbExportOnly.Left + rbExportOnly.Width + 4;
  laExportRecCount_02.Left := edExportRecCount.Left + edExportRecCount.Width + 4;
  laExportRecCount_02.Caption := {$IFDEF WIN32}QExportLoadStr(QED_ExportType_Options_Records){$ENDIF}
                                 {$IFDEF LINUX}QED_ExportType_Options_Records{$ENDIF};

  bStart.Caption := {$IFDEF WIN32}QExportLoadStr(QED_ExportType_Start){$ENDIF}
                    {$IFDEF LINUX}QED_ExportType_Start{$ENDIF};
  bCancel.Caption := {$IFDEF WIN32}QExportLoadStr(QED_ExportType_Close){$ENDIF}
                     {$IFDEF LINUX}QED_ExportType_Close{$ENDIF};

  // Fields
  tshFields.Caption :=  {$IFDEF WIN32}QExportLoadStr(QED_Fields_Title){$ENDIF}
                        {$IFDEF LINUX}QED_Fields_Title{$ENDIF};
  laAvailableFields.Caption :=  {$IFDEF WIN32}QExportLoadStr(QED_Fields_Available){$ENDIF}
                                {$IFDEF LINUX}QED_Fields_Available{$ENDIF};
  laExportedFields.Caption := {$IFDEF WIN32}QExportLoadStr(QED_Fields_Exported){$ENDIF}
                              {$IFDEF LINUX}QED_Fields_Exported{$ENDIF};
  bAddOneExportedField.Caption := {$IFDEF WIN32}QExportLoadStr(QED_Fields_Add){$ENDIF}
                                  {$IFDEF LINUX}QED_Fields_Add{$ENDIF};
  bAddAllExportedField.Caption := {$IFDEF WIN32}QExportLoadStr(QED_Fields_AddAll){$ENDIF}
                                  {$IFDEF LINUX}QED_Fields_AddAll{$ENDIF};
  bDelOneExportedField.Caption := {$IFDEF WIN32}QExportLoadStr(QED_Fields_Remove){$ENDIF}
                                  {$IFDEF LINUX}QED_Fields_Remove{$ENDIF};
  bDelAllExportedField.Caption := {$IFDEF WIN32}QExportLoadStr(QED_Fields_RemoveAll){$ENDIF}
                                  {$IFDEF LINUX}QED_Fields_RemoveAll{$ENDIF};

  // Formats
  tshFormats.Caption := {$IFDEF WIN32}QExportLoadStr(QED_Formats_Title){$ENDIF}
                        {$IFDEF LINUX}QED_Formats_Title{$ENDIF};
  gbStandardFormats.Caption := {$IFDEF WIN32}QExportLoadStr(QED_Formats_Common){$ENDIF}
                               {$IFDEF LINUX}QED_Formats_Common{$ENDIF};
  laIntegerFormat.Caption := {$IFDEF WIN32}QExportLoadStr(QED_Formats_Integer){$ENDIF}
                             {$IFDEF LINUX}QED_Formats_Integer{$ENDIF};
  laFloatFormat.Caption := {$IFDEF WIN32}QExportLoadStr(QED_Formats_Float){$ENDIF}
                           {$IFDEF LINUX}QED_Formats_Float{$ENDIF};
  laDateFormat.Caption := {$IFDEF WIN32}QExportLoadStr(QED_Formats_Date){$ENDIF}
                          {$IFDEF LINUX}QED_Formats_Date{$ENDIF};
  laTimeFormat.Caption := {$IFDEF WIN32}QExportLoadStr(QED_Formats_Time){$ENDIF}
                          {$IFDEF LINUX}QED_Formats_Time{$ENDIF};
  laDateTimeFormat.Caption := {$IFDEF WIN32}QExportLoadStr(QED_Formats_DateTime){$ENDIF}
                              {$IFDEF LINUX}QED_Formats_DateTime{$ENDIF};
  laCurrencyFormat.Caption := {$IFDEF WIN32}QExportLoadStr(QED_Formats_Currency){$ENDIF}
                              {$IFDEF LINUX}QED_Formats_Currency{$ENDIF};
  laBooleanTrue.Caption := {$IFDEF WIN32}QExportLoadStr(QED_Formats_BooleanTrue){$ENDIF}
                           {$IFDEF LINUX}QED_Formats_BooleanTrue{$ENDIF};
  laBooleanFalse.Caption := {$IFDEF WIN32}QExportLoadStr(QED_Formats_BooleanFalse){$ENDIF}
                            {$IFDEF LINUX}QED_Formats_BooleanFalse{$ENDIF};
  laNullString.Caption := {$IFDEF WIN32}QExportLoadStr(QED_Formats_NullString){$ENDIF}
                          {$IFDEF LINUX}QED_Formats_NullString{$ENDIF};
  gbUserFormat.Caption := {$IFDEF WIN32}QExportLoadStr(QED_Formats_User){$ENDIF}
                          {$IFDEF LINUX}QED_Formats_User{$ENDIF};
  bAddUserFormat.Caption := {$IFDEF WIN32}QExportLoadStr(QED_Formats_Add){$ENDIF}
                            {$IFDEF LINUX}QED_Formats_Add{$ENDIF};
  bEditUserFormat.Caption := {$IFDEF WIN32}QExportLoadStr(QED_Formats_Edit){$ENDIF}
                             {$IFDEF LINUX}QED_Formats_Edit{$ENDIF};
  bDeleteUserFormat.Caption := {$IFDEF WIN32}QExportLoadStr(QED_Formats_Delete){$ENDIF}
                               {$IFDEF LINUX}QED_Formats_Delete{$ENDIF};
  bClearUserFormats.Caption := {$IFDEF WIN32}QExportLoadStr(QED_Formats_Clear){$ENDIF}
                               {$IFDEF LINUX}QED_Formats_Clear{$ENDIF};

  // Header & Footer
  tshHeaderFooter.Caption := {$IFDEF WIN32}QExportLoadStr(QED_Header_Footer_Title){$ENDIF}
                             {$IFDEF LINUX}QED_Header_Footer_Title{$ENDIF};
  laHeader.Caption := {$IFDEF WIN32}QExportLoadStr(QED_Header_Footer_Header){$ENDIF}
                      {$IFDEF LINUX}QED_Header_Footer_Header{$ENDIF};
  laFooter.Caption := {$IFDEF WIN32}QExportLoadStr(QED_Header_Footer_Footer){$ENDIF}
                      {$IFDEF LINUX}QED_Header_Footer_Footer{$ENDIF};

  // Captions
  tshCaptions.Caption := {$IFDEF WIN32}QExportLoadStr(QED_Captions_Title){$ENDIF}
                         {$IFDEF LINUX}QED_Captions_Title{$ENDIF};
  chAllowCaptions.Caption := {$IFDEF WIN32}QExportLoadStr(QED_Captions_AllowCaptions){$ENDIF}
                             {$IFDEF LINUX}QED_Captions_AllowCaptions{$ENDIF};
  cbxColumnAlign.Items.Clear;
  cbxColumnAlign.Items.Add({$IFDEF WIN32}QExportLoadStr(QED_Align_Left){$ENDIF}
                           {$IFDEF LINUX}QED_Align_Left{$ENDIF});
  cbxColumnAlign.Items.Add({$IFDEF WIN32}QExportLoadStr(QED_Align_Center){$ENDIF}
                           {$IFDEF LINUX}QED_Align_Center{$ENDIF});
  cbxColumnAlign.Items.Add({$IFDEF WIN32}QExportLoadStr(QED_Align_Right){$ENDIF}
                           {$IFDEF LINUX}QED_Align_Right{$ENDIF});
  laCaptionRow.Caption := {$IFDEF WIN32}QExportLoadStr(QED_StringGrid_CaptionRow){$ENDIF}
                          {$IFDEF LINUX}QED_StringGrid_CaptionRow{$ENDIF};

  // Word / RTF
  tshRTF.Caption := {$IFDEF WIN32}QExportLoadStr(QED_RTF_Title){$ENDIF}
                    {$IFDEF LINUX}QED_RTF_Title{$ENDIF};
  tsRTFDataStyles.Caption := {$IFDEF WIN32}QExportLoadStr(QED_RTF_DataStyles){$ENDIF}
                             {$IFDEF LINUX}QED_RTF_DataStyles{$ENDIF};
  tsRTFBaseStyles.Caption := {$IFDEF WIN32}QExportLoadStr(QED_RTF_BaseStyles){$ENDIF}
                             {$IFDEF LINUX}QED_RTF_BaseStyles{$ENDIF};
  tsRTFStripStyles.Caption := {$IFDEF WIN32}QExportLoadStr(QED_RTF_StripStyles){$ENDIF}
                              {$IFDEF LINUX}QED_RTF_StripStyles{$ENDIF};
  tbtAddRTFStyle.Hint := {$IFDEF WIN32}QExportLoadStr(QED_RTF_AddRTFStyle){$ENDIF}
                         {$IFDEF LINUX}QED_RTF_AddRTFStyle{$ENDIF};
  tbtDelRTFStyle.Hint := {$IFDEF WIN32}QExportLoadStr(QED_RTF_DelRTFStyle){$ENDIF}
                         {$IFDEF LINUX}QED_RTF_DelRTFStyle{$ENDIF};
  tbtMoveRTFStyleUp.Hint := {$IFDEF WIN32}QExportLoadStr(QED_RTF_MoveRTFStyleUp){$ENDIF}
                            {$IFDEF LINUX}QED_RTF_MoveRTFStyleUp{$ENDIF};
  tbtMoveRTFStyleDown.Hint := {$IFDEF WIN32}QExportLoadStr(QED_RTF_MoveRTFStyleDown){$ENDIF}
                              {$IFDEF LINUX}QED_RTF_MoveRTFStyleDown{$ENDIF};
  tbtLoadRTFStyle.Hint := {$IFDEF WIN32}QExportLoadStr(QED_RTF_LoadRTFStyle){$ENDIF}
                          {$IFDEF LINUX}QED_RTF_LoadRTFStyle{$ENDIF};
  tbtSaveRTFStyle.Hint := {$IFDEF WIN32}QExportLoadStr(QED_RTF_SaveRTFStyle){$ENDIF}
                          {$IFDEF LINUX}QED_RTF_SaveRTFStyle{$ENDIF};
  rgRTFStripType.Caption := {$IFDEF WIN32}QExportLoadStr(QED_RTF_StripType){$ENDIF}
                            {$IFDEF LINUX}QED_RTF_StripType{$ENDIF};
  rgRTFStripType.Items[0] := {$IFDEF WIN32}QExportLoadStr(QED_RTF_StripType_None){$ENDIF}
                             {$IFDEF LINUX}QED_RTF_StripType_None{$ENDIF};
  rgRTFStripType.Items[1] := {$IFDEF WIN32}QExportLoadStr(QED_RTF_StripType_Col){$ENDIF}
                             {$IFDEF LINUX}QED_RTF_StripType_Col{$ENDIF};
  rgRTFStripType.Items[2] := {$IFDEF WIN32}QExportLoadStr(QED_RTF_StripType_Row){$ENDIF}
                             {$IFDEF LINUX}QED_RTF_StripType_Row{$ENDIF};
  laRTFFont.Caption := {$IFDEF WIN32}QExportLoadStr(QED_RTF_Font){$ENDIF}
                       {$IFDEF LINUX}QED_RTF_Font{$ENDIF};
  laRTFFontSize.Caption := {$IFDEF WIN32}QExportLoadStr(QED_RTF_FontSize){$ENDIF}
                           {$IFDEF LINUX}QED_RTF_FontSize{$ENDIF};
  bRTFFontColor.Hint := {$IFDEF WIN32}QExportLoadStr(QED_RTF_FontColor){$ENDIF}
                        {$IFDEF LINUX}QED_RTF_FontColor{$ENDIF};
  bRTFFontBold.Hint := {$IFDEF WIN32}QExportLoadStr(QED_RTF_FontBold){$ENDIF}
                       {$IFDEF LINUX}QED_RTF_FontBold{$ENDIF};
  bRTFFontItalic.Hint := {$IFDEF WIN32}QExportLoadStr(QED_RTF_FontItalic){$ENDIF}
                         {$IFDEF LINUX}QED_RTF_FontItalic{$ENDIF};
  bRTFFontStrikeOut.Hint := {$IFDEF WIN32}QExportLoadStr(QED_RTF_FontStrikeOut){$ENDIF}
                            {$IFDEF LINUX}QED_RTF_FontStrikeOut{$ENDIF};
  bRTFFontUnderline.Hint := {$IFDEF WIN32}QExportLoadStr(QED_RTF_FontUnderline){$ENDIF}
                            {$IFDEF LINUX}QED_RTF_FontUnderline{$ENDIF};
  bRTFFontLeft.Hint := {$IFDEF WIN32}QExportLoadStr(QED_RTF_Left){$ENDIF}
                       {$IFDEF LINUX}QED_RTF_Left{$ENDIF};
  bRTFFontCenter.Hint := {$IFDEF WIN32}QExportLoadStr(QED_RTF_Center){$ENDIF}
                         {$IFDEF LINUX}QED_RTF_Center{$ENDIF};
  bRTFFontRight.Hint := {$IFDEF WIN32}QExportLoadStr(QED_RTF_Right){$ENDIF}
                        {$IFDEF LINUX}QED_RTF_Right{$ENDIF};
  bRTFFontFill.Hint := {$IFDEF WIN32}QExportLoadStr(QED_RTF_Fill){$ENDIF}
                       {$IFDEF LINUX}QED_RTF_Fill{$ENDIF};
  bRTFBackgroundColor.Hint := {$IFDEF WIN32}QExportLoadStr(QED_RTF_BackgroundColor){$ENDIF}
                              {$IFDEF LINUX}QED_RTF_BackgroundColor{$ENDIF};
  bRTFHighlightColor.Hint := {$IFDEF WIN32}QExportLoadStr(QED_RTF_HighlightColor){$ENDIF}
                             {$IFDEF LINUX}QED_RTF_HighlightColor{$ENDIF};
  chRTFAllowBackground.Caption := {$IFDEF WIN32}QExportLoadStr(QED_RTF_AllowBackground){$ENDIF}
                                  {$IFDEF LINUX}QED_RTF_AllowBackground{$ENDIF};
  chRTFAllowHighlight.Caption := {$IFDEF WIN32}QExportLoadStr(QED_RTF_AllowHighlight){$ENDIF}
                                 {$IFDEF LINUX}QED_RTF_AllowHighlight{$ENDIF};
  laRTFSample.Caption := {$IFDEF WIN32}QExportLoadStr(QED_RTF_Sample){$ENDIF}
                         {$IFDEF LINUX}QED_RTF_Sample{$ENDIF};
  tsRTFAdvanced.Caption := {$IFDEF WIN32}QExportLoadStr(QED_RTF_Advanced){$ENDIF}
                           {$IFDEF LINUX}QED_RTF_Advanced{$ENDIF};
  rgRTFPageOrientation.Caption := {$IFDEF WIN32}QExportLoadStr(QED_RTF_PageOrientation){$ENDIF}
                                  {$IFDEF LINUX}QED_RTF_PageOrientation{$ENDIF};
  rgRTFPageOrientation.Items[0] := {$IFDEF WIN32}QExportLoadStr(QEPO_Portrait){$ENDIF}
                                   {$IFDEF LINUX}QEPO_Portrait{$ENDIF};
  rgRTFPageOrientation.Items[1] := {$IFDEF WIN32}QExportLoadStr(QEPO_Landscape){$ENDIF}
                                   {$IFDEF LINUX}QEPO_Landscape{$ENDIF};

  // XML
  tshXML.Caption := {$IFDEF WIN32}QExportLoadStr(QED_XML_Title){$ENDIF}
                    {$IFDEF LINUX}QED_XML_Title{$ENDIF};
  chXMLStandAlone.Caption := {$IFDEF WIN32}QExportLoadStr(QED_XML_Standalone){$ENDIF}
                             {$IFDEF LINUX}QED_XML_Standalone{$ENDIF};
  laXMLEncoding.Caption := {$IFDEF WIN32}QExportLoadStr(QED_XML_Encoding){$ENDIF}
                           {$IFDEF LINUX}QED_XML_Encoding{$ENDIF};

  // SQL
  tshSQL.Caption := {$IFDEF WIN32}QExportLoadStr(QED_SQL_Title){$ENDIF}
                    {$IFDEF LINUX}QED_SQL_Title{$ENDIF};
  gbSQLTableOptions.Caption := {$IFDEF WIN32}QExportLoadStr(QED_SQL_TableOptions){$ENDIF}
                               {$IFDEF LINUX}QED_SQL_TableOptions{$ENDIF};
  chSQLCreateTable.Caption := {$IFDEF WIN32}QExportLoadStr(QED_SQL_AddCreateTable){$ENDIF}
                              {$IFDEF LINUX}QED_SQL_AddCreateTable{$ENDIF};
  laSQLTableName.Caption := {$IFDEF WIN32}QExportLoadStr(QED_SQL_TableName){$ENDIF}
                            {$IFDEF LINUX}QED_SQL_TableName{$ENDIF};
  gbSQLCommit.Caption := {$IFDEF WIN32}QExportLoadStr(QED_SQL_Commit){$ENDIF}
                         {$IFDEF LINUX}QED_SQL_Commit{$ENDIF};
  laSQLUseCommit_01.Caption := {$IFDEF WIN32}QExportLoadStr(QED_SQL_CommitAfter_01){$ENDIF}
                               {$IFDEF LINUX}QED_SQL_CommitAfter_01{$ENDIF};
  laSQLUseCommit_02.Caption := {$IFDEF WIN32}QExportLoadStr(QED_SQL_CommitAfter_02){$ENDIF}
                               {$IFDEF LINUX}QED_SQL_CommitAfter_02{$ENDIF};
  chSQLCommitAfterScript.Caption := {$IFDEF WIN32}QExportLoadStr(QED_SQL_CommitAfterScript){$ENDIF}
                                    {$IFDEF LINUX}QED_SQL_CommitAfterScript{$ENDIF};
  laSQLCommitStatement.Caption := {$IFDEF WIN32}QExportLoadStr(QED_SQL_CommitStatement){$ENDIF}
                                  {$IFDEF LINUX}QED_SQL_CommitStatement{$ENDIF};
  gbSQLMisc.Caption := {$IFDEF WIN32}QExportLoadStr(QED_SQL_Other){$ENDIF}
                       {$IFDEF LINUX}QED_SQL_Other{$ENDIF};
  laSQLNullString.Caption := {$IFDEF WIN32}QExportLoadStr(QED_SQL_NullAs){$ENDIF}
                             {$IFDEF LINUX}QED_SQL_NullAs{$ENDIF};
  //edSQLNullString.Left := laSQLNullString.Left + laSQLNullString.Width + 4;
  laSQLStatementTerm.Caption := {$IFDEF WIN32}QExportLoadStr(QED_SQL_StatementTerm){$ENDIF}
                                {$IFDEF LINUX}QED_SQL_StatementTerm{$ENDIF};

  // HTML
  tshHTML.Caption := {$IFDEF WIN32}QExportLoadStr(QED_HTML_Title){$ENDIF}
                     {$IFDEF LINUX}QED_HTML_Title{$ENDIF};
  tshHTMLPreview.Caption := {$IFDEF WIN32}QExportLoadStr(QED_HTML_Preview_Title){$ENDIF}
                            {$IFDEF LINUX}QED_HTML_Preview_Title{$ENDIF};
  laHTMLFont.Caption := {$IFDEF WIN32}QExportLoadStr(QED_HTML_Preview_DefaultText){$ENDIF}
                        {$IFDEF LINUX}QED_HTML_Preview_DefaultText{$ENDIF};
  laHTMLLink.Caption := {$IFDEF WIN32}QExportLoadStr(QED_HTML_Preview_NonVisitedLink){$ENDIF}
                        {$IFDEF LINUX}QED_HTML_Preview_NonVisitedLink{$ENDIF};
  laHTMLVLink.Caption := {$IFDEF WIN32}QExportLoadStr(QED_HTML_Preview_VisitedLink){$ENDIF}
                         {$IFDEF LINUX}QED_HTML_Preview_VisitedLink{$ENDIF};
  laHTMLALink.Caption := {$IFDEF WIN32}QExportLoadStr(QED_HTML_Preview_ActiveLink){$ENDIF}
                         {$IFDEF LINUX}QED_HTML_Preview_ActiveLink{$ENDIF};
  laHTMLTemplate.Caption := {$IFDEF WIN32}QExportLoadStr(QED_HTML_Preview_Template){$ENDIF}
                            {$IFDEF LINUX}QED_HTML_Preview_Template{$ENDIF};
  bHTMLSaveTemplate.Caption := {$IFDEF WIN32}QExportLoadStr(QED_HTML_Preview_SaveTemplate){$ENDIF}
                               {$IFDEF LINUX}QED_HTML_Preview_SaveTemplate{$ENDIF};
  bHTMLLoadTemplate.Caption := {$IFDEF WIN32}QExportLoadStr(QED_HTML_Preview_LoadTemplate){$ENDIF}
                               {$IFDEF LINUX}QED_HTML_Preview_LoadTemplate{$ENDIF};
  tshHTMLBasic.Caption := {$IFDEF WIN32}QExportLoadStr(QED_HTML_Basic_Title){$ENDIF}
                          {$IFDEF LINUX}QED_HTML_Basic_Title{$ENDIF};
  laHTMLTitle.Caption := {$IFDEF WIN32}QExportLoadStr(QED_HTML_Basic_PageTitle){$ENDIF}
                         {$IFDEF LINUX}QED_HTML_Basic_PageTitle{$ENDIF};
  gbHTMLUsingCSS.Caption := {$IFDEF WIN32}QExportLoadStr(QED_HTML_Basic_CSS){$ENDIF}
                            {$IFDEF LINUX}QED_HTML_Basic_CSS{$ENDIF};
  rbInternal.Caption := {$IFDEF WIN32}QExportLoadStr(QED_HTML_Basic_CSSInternal){$ENDIF}
                        {$IFDEF LINUX}QED_HTML_Basic_CSSInternal{$ENDIF};
  rbExternal.Caption := {$IFDEF WIN32}QExportLoadStr(QED_HTML_Basic_CSSExternal){$ENDIF}
                        {$IFDEF LINUX}QED_HTML_Basic_CSSExternal{$ENDIF};
  laHTMLCSSFileName.Caption := {$IFDEF WIN32}QExportLoadStr(QED_HTML_Basic_CSSFileName){$ENDIF}
                               {$IFDEF LINUX}QED_HTML_Basic_CSSFileName{$ENDIF};
  edHTMLCSSFileName.Left := laHTMLCSSFileName.Left + laHTMLCSSFileName.Width + 4;
  bvHTMLCSSFileName.Left := edHTMLCSSFileName.Left + edHTMLCSSFileName.Width + 2;
  btnHTMLCSSFileName.Left := bvHTMLCSSFileName.Left + 1;
  chHTMLOverwriteCSSFile.Caption := {$IFDEF WIN32}QExportLoadStr(QED_HTML_Basic_OverwriteCSSFile){$ENDIF}
                                    {$IFDEF LINUX}QED_HTML_Basic_OverwriteCSSFile{$ENDIF};

  tshHTMLMultifile.Caption := {$IFDEF WIN32}QExportLoadStr(QED_HTML_Multifile_Title){$ENDIF}
                              {$IFDEF LINUX}QED_HTML_Multifile_Title{$ENDIF};
  gbHTMLMultifileOptions.Caption := {$IFDEF WIN32}QExportLoadStr(QED_HTML_Basic_MultiFile_Options){$ENDIF}
                                    {$IFDEF LINUX}QED_HTML_Basic_MultiFile_Options{$ENDIF};
  chHTMLUseMultifileExport.Caption := {$IFDEF WIN32}QExportLoadStr(QED_HTML_Basic_MultiFile_Use){$ENDIF}
                                      {$IFDEF LINUX}QED_HTML_Basic_MultiFile_Use{$ENDIF};
  laHTMLFileRecCount_01.Caption := {$IFDEF WIN32}QExportLoadStr(QED_HTML_Basic_MultiFile_RecCount_01){$ENDIF}
                                   {$IFDEF LINUX}QED_HTML_Basic_MultiFile_RecCount_01{$ENDIF};
  edHTMLFileRecCount.Left := laHTMLFileRecCount_01.Left +
    laHTMLFileRecCount_01.Width + 4;
  laHTMLFileRecCount_02.Left := edHTMLFileRecCount.Left +
    edHTMLFileRecCount.Width + 4;
  laHTMLFileRecCount_02.Caption := {$IFDEF WIN32}QExportLoadStr(QED_HTML_Basic_MultiFile_RecCount_02){$ENDIF}
                                   {$IFDEF LINUX}QED_HTML_Basic_MultiFile_RecCount_02{$ENDIF};
  chHTMLGenerateIndex.Caption := {$IFDEF WIN32}QExportLoadStr(QED_HTML_Basic_MultiFile_GenerateIndex){$ENDIF}
                                 {$IFDEF LINUX}QED_HTML_Basic_MultiFile_GenerateIndex{$ENDIF};
  gbHTMLNavigation.Caption := {$IFDEF WIN32}QExportLoadStr(QED_HTML_Basic_MultiFile_Navigation){$ENDIF}
                              {$IFDEF LINUX}QED_HTML_Basic_MultiFile_Navigation{$ENDIF};
  laHTMLIndexLinkTemplate.Caption := {$IFDEF WIN32}QExportLoadStr(QED_HTML_MultiFile_IndexLinkTemplate){$ENDIF}
                                     {$IFDEF LINUX}QED_HTML_MultiFile_IndexLinkTemplate{$ENDIF};
  chHTMLNavigationOnTop.Caption := {$IFDEF WIN32}QExportLoadStr(QED_HTML_Basic_MultiFile_Navigation_OnTop){$ENDIF}
                                   {$IFDEF LINUX}QED_HTML_Basic_MultiFile_Navigation_OnTop{$ENDIF};
  chHTMLNavigationOnBottom.Caption := {$IFDEF WIN32}QExportLoadStr(QED_HTML_Basic_MultiFile_Navigation_OnBottom){$ENDIF}
                                      {$IFDEF LINUX}QED_HTML_Basic_MultiFile_Navigation_OnBottom{$ENDIF};
  laHTMLIndexLinkTitle.Caption := {$IFDEF WIN32}QExportLoadStr(QED_HTML_Basic_MultiFile_IndexLinkTitle){$ENDIF}
                                  {$IFDEF LINUX}QED_HTML_Basic_MultiFile_IndexLinkTitle{$ENDIF};
  laHTMLFirstLinkTitle.Caption := {$IFDEF WIN32}QExportLoadStr(QED_HTML_Basic_MultiFile_FirstLinkTitle){$ENDIF}
                                  {$IFDEF LINUX}QED_HTML_Basic_MultiFile_FirstLinkTitle{$ENDIF};
  laHTMLPriorLinkTitle.Caption := {$IFDEF WIN32}QExportLoadStr(QED_HTML_Basic_MultiFile_PriorLinkTitle){$ENDIF}
                                  {$IFDEF LINUX}QED_HTML_Basic_MultiFile_PriorLinkTitle{$ENDIF};
  laHTMLNextLinkTitle.Caption := {$IFDEF WIN32}QExportLoadStr(QED_HTML_Basic_MultiFile_NextLinkTitle){$ENDIF}
                                 {$IFDEF LINUX}QED_HTML_Basic_MultiFile_NextLinkTitle{$ENDIF};
  laHTMLLastLinkTitle.Caption := {$IFDEF WIN32}QExportLoadStr(QED_HTML_Basic_MultiFile_LastLinkTitle){$ENDIF}
                                 {$IFDEF LINUX}QED_HTML_Basic_MultiFile_LastLinkTitle{$ENDIF};

  tshHTMLAdvanced.Caption := {$IFDEF WIN32}QExportLoadStr(QED_HTML_Advanced_Title){$ENDIF}
                             {$IFDEF LINUX}QED_HTML_Advanced_Title{$ENDIF};
  gbHTMLBodyOptions.Caption := {$IFDEF WIN32}QExportLoadStr(QED_HTML_Advanced_Body_Options){$ENDIF}
                               {$IFDEF LINUX}QED_HTML_Advanced_Body_Options{$ENDIF};
  laHTMLBodyFontName.Caption := {$IFDEF WIN32}QExportLoadStr(QED_HTML_Advanced_Body_FontName){$ENDIF}
                                {$IFDEF LINUX}QED_HTML_Advanced_Body_FontName{$ENDIF};
  laHTMLBackground.Caption := {$IFDEF WIN32}QExportLoadStr(QED_HTML_Advanced_Body_Background){$ENDIF}
                              {$IFDEF LINUX}QED_HTML_Advanced_Body_Background{$ENDIF};
  laHTMLBodyAdvanced.Caption := {$IFDEF WIN32}QExportLoadStr(QED_HTML_Advanced_Body_Attributes){$ENDIF}
                                {$IFDEF LINUX}QED_HTML_Advanced_Body_Attributes{$ENDIF};
  gbHTMLTableOptions.Caption := {$IFDEF WIN32}QExportLoadStr(QED_HTML_Advanced_Table_Options){$ENDIF}
                                {$IFDEF LINUX}QED_HTML_Advanced_Table_Options{$ENDIF};
  laHTMLCellPadding.Caption := {$IFDEF WIN32}QExportLoadStr(QED_HTML_Advanced_Table_CellPadding){$ENDIF}
                               {$IFDEF LINUX}QED_HTML_Advanced_Table_CellPadding{$ENDIF};
  laHTMLCellSpacing.Caption := {$IFDEF WIN32}QExportLoadStr(QED_HTML_Advanced_Table_CellSpasing){$ENDIF}
                               {$IFDEF LINUX}QED_HTML_Advanced_Table_CellSpasing{$ENDIF};
  laHTMLBorderWidth.Caption := {$IFDEF WIN32}QExportLoadStr(QED_HTML_Advanced_Table_Border){$ENDIF}
                               {$IFDEF LINUX}QED_HTML_Advanced_Table_Border{$ENDIF};
  laHTMLTableBackground.Caption := {$IFDEF WIN32}QExportLoadStr(QED_HTML_Advanced_Table_Background){$ENDIF}
                                   {$IFDEF LINUX}QED_HTML_Advanced_Table_Background{$ENDIF};
  laHTMLTableAdvanced.Caption := {$IFDEF WIN32}QExportLoadStr(QED_HTML_Advanced_Table_Attributes){$ENDIF}
                                 {$IFDEF LINUX}QED_HTML_Advanced_Table_Attributes{$ENDIF};

  // XLS
  tshXLS.Caption := {$IFDEF WIN32}QExportLoadStr(QED_XLS_Title){$ENDIF}
                    {$IFDEF LINUX}QED_XLS_Title{$ENDIF};

  tshXLSAdvanced.Caption := {$IFDEF WIN32}QExportLoadStr(QED_XLS_Advanced_Title){$ENDIF}
                            {$IFDEF LINUX}QED_XLS_Advanced_Title{$ENDIF};
  laXLSPageHeader.Caption := {$IFDEF WIN32}QExportLoadStr(QED_XLS_Page_Header){$ENDIF}
                             {$IFDEF LINUX}QED_XLS_Page_Header{$ENDIF};
  laXLSPageFooter.Caption := {$IFDEF WIN32}QExportLoadStr(QED_XLS_Page_Footer){$ENDIF}
                             {$IFDEF LINUX}QED_XLS_Page_Footer{$ENDIF};
  laXLSSheetTitle.Caption := {$IFDEF WIN32}QExportLoadStr(QED_XLS_Sheet_Title){$ENDIF}
                             {$IFDEF LINUX}QED_XLS_Sheet_Title{$ENDIF};
  chXLSAutoCalcColWidth.Caption := {$IFDEF WIN32}QExportLoadStr(QED_XLS_AutoCalcColWidth){$ENDIF}
                                   {$IFDEF LINUX}QED_XLS_AutoCalcColWidth{$ENDIF};
  laXLSPageBackground.Caption := {$IFDEF WIN32}QExportLoadStr(QED_XLS_Page_Background){$ENDIF}
                                 {$IFDEF LINUX}QED_XLS_Page_Background{$ENDIF};

  tshXLSDataFormat.Caption := {$IFDEF WIN32}QExportLoadStr(QED_XLS_DataFormat_Title){$ENDIF}
                              {$IFDEF LINUX}QED_XLS_DataFormat_Title{$ENDIF};
  tshXLSFields.Caption := {$IFDEF WIN32}QExportLoadStr(QED_XLS_DataFormat_Fields){$ENDIF}
                          {$IFDEF LINUX}QED_XLS_DataFormat_Fields{$ENDIF};
  tshXLSOptions.Caption := {$IFDEF WIN32}QExportLoadStr(QED_XLS_DataFormat_Options){$ENDIF}
                           {$IFDEF LINUX}QED_XLS_DataFormat_Options{$ENDIF};
  tshXLSStyles.Caption := {$IFDEF WIN32}QExportLoadStr(QED_XLS_DataFormat_Styles){$ENDIF}
                          {$IFDEF LINUX}QED_XLS_DataFormat_Styles{$ENDIF};
  tbtAddXLSStyle.Hint := {$IFDEF WIN32}QExportLoadStr(QED_XLS_DataFormat_Styles_Add){$ENDIF}
                         {$IFDEF LINUX}QED_XLS_DataFormat_Styles_Add{$ENDIF};
  tbtDelXLSStyle.Hint := {$IFDEF WIN32}QExportLoadStr(QED_XLS_DataFormat_Styles_Del){$ENDIF}
                         {$IFDEF LINUX}QED_XLS_DataFormat_Styles_Del{$ENDIF};
  tbtUpXLSStyle.Hint := {$IFDEF WIN32}QExportLoadStr(QED_XLS_DataFormat_Styles_Up){$ENDIF}
                        {$IFDEF LINUX}QED_XLS_DataFormat_Styles_Up{$ENDIF};
  tbtDownXLSStyle.Hint := {$IFDEF WIN32}QExportLoadStr(QED_XLS_DataFormat_Styles_Down){$ENDIF}
                          {$IFDEF LINUX}QED_XLS_DataFormat_Styles_Down{$ENDIF};
  tbtSaveXLSStyle.Hint := {$IFDEF WIN32}QExportLoadStr(QED_XLS_DataFormat_Styles_Save){$ENDIF}
                          {$IFDEF LINUX}QED_XLS_DataFormat_Styles_Save{$ENDIF};
  tbtLoadXLSStyle.Hint := {$IFDEF WIN32}QExportLoadStr(QED_XLS_DataFormat_Styles_Load){$ENDIF}
                          {$IFDEF LINUX}QED_XLS_DataFormat_Styles_Load{$ENDIF};
  rgXLSStripType.Caption := {$IFDEF WIN32}QExportLoadStr(QED_XLS_DataFormat_Styles_StripStyle_Caption){$ENDIF}
                            {$IFDEF LINUX}QED_XLS_DataFormat_Styles_StripStyle_Caption{$ENDIF};
  rgXLSStripType.Items.Clear;
  rgXLSStripType.Items.Add({$IFDEF WIN32}QExportLoadStr(QED_XLS_DataFormat_Styles_StripStyle_None){$ENDIF}
                           {$IFDEF LINUX}QED_XLS_DataFormat_Styles_StripStyle_None{$ENDIF});
  rgXLSStripType.Items.Add({$IFDEF WIN32}QExportLoadStr(QED_XLS_DataFormat_Styles_StripStyle_Col){$ENDIF}
                           {$IFDEF LINUX}QED_XLS_DataFormat_Styles_StripStyle_Col{$ENDIF});
  rgXLSStripType.Items.Add({$IFDEF WIN32}QExportLoadStr(QED_XLS_DataFormat_Styles_StripStyle_Row){$ENDIF}
                           {$IFDEF LINUX}QED_XLS_DataFormat_Styles_StripStyle_Row{$ENDIF});
  rgXLSStripType.ItemIndex := Integer(Dialog.XLSOptions.StripType);

  btnXLSResetItem.Caption := {$IFDEF WIN32}QExportLoadStr(QED_XLS_Reset_Item){$ENDIF}
                             {$IFDEF LINUX}QED_XLS_Reset_Item{$ENDIF};
  btnXLSResetAll.Caption := {$IFDEF WIN32}QExportLoadStr(QED_XLS_Reset_All){$ENDIF}
                            {$IFDEF LINUX}QED_XLS_Reset_All{$ENDIF};
  laXLSSampleCell.Caption := {$IFDEF WIN32}QExportLoadStr(QED_XLS_SampleCell){$ENDIF}
                             {$IFDEF LINUX}QED_XLS_SampleCell{$ENDIF};

  tshXLSFont.Caption := {$IFDEF WIN32}QExportLoadStr(QED_XLS_Font_Title){$ENDIF}
                        {$IFDEF LINUX}QED_XLS_Font_Title{$ENDIF};
  laXLSFont.Caption := {$IFDEF WIN32}QExportLoadStr(QED_XLS_Font){$ENDIF}
                       {$IFDEF LINUX}QED_XLS_Font{$ENDIF};
  laXLSFontSize.Caption := {$IFDEF WIN32}QExportLoadStr(QED_XLS_FontSize){$ENDIF}
                           {$IFDEF LINUX}QED_XLS_FontSize{$ENDIF};
  btnFontColor.Hint := {$IFDEF WIN32}QExportLoadStr(QED_XLS_Font_Color){$ENDIF}
                       {$IFDEF LINUX}QED_XLS_Font_Color{$ENDIF};
  btnFontBold.Hint := {$IFDEF WIN32}QExportLoadStr(QED_XLS_Font_Bold){$ENDIF}
                      {$IFDEF LINUX}QED_XLS_Font_Bold{$ENDIF};
  btnFontItalic.Hint := {$IFDEF WIN32}QExportLoadStr(QED_XLS_Font_Italic){$ENDIF}
                        {$IFDEF LINUX}QED_XLS_Font_Italic{$ENDIF};
  btnFontStrikeOut.Hint := {$IFDEF WIN32}QExportLoadStr(QED_XLS_Font_StrikeOut){$ENDIF}
                           {$IFDEF LINUX}QED_XLS_Font_StrikeOut{$ENDIF};
  btnUnderlineSingle.Hint := {$IFDEF WIN32}QExportLoadStr(QED_XLS_Underline_Single){$ENDIF}
                             {$IFDEF LINUX}QED_XLS_Underline_Single{$ENDIF};
  btnUnderlineSingleAccounting.Hint := {$IFDEF WIN32}QExportLoadStr(QED_XLS_Underline_Single_Accounting){$ENDIF}
                                       {$IFDEF LINUX}QED_XLS_Underline_Single_Accounting{$ENDIF};
  btnUnderlineDouble.Hint := {$IFDEF WIN32}QExportLoadStr(QED_XLS_Underline_Double){$ENDIF}
                             {$IFDEF LINUX}QED_XLS_Underline_Double{$ENDIF};
  btnUnderlineDoubleAccounting.Hint := {$IFDEF WIN32}QExportLoadStr(QED_XLS_Underline_Double_Accounting){$ENDIF}
                                       {$IFDEF LINUX}QED_XLS_Underline_Double_Accounting{$ENDIF};
  btnHorizontalLeft.Hint := {$IFDEF WIN32}QExportLoadStr(QED_XLS_Alignment_Horizontal_Left){$ENDIF}
                            {$IFDEF LINUX}QED_XLS_Alignment_Horizontal_Left{$ENDIF};
  btnHorizontalCenter.Hint := {$IFDEF WIN32}QExportLoadStr(QED_XLS_Alignment_Horizontal_Center){$ENDIF}
                              {$IFDEF LINUX}QED_XLS_Alignment_Horizontal_Center{$ENDIF};
  btnHorizontalRight.Hint := {$IFDEF WIN32}QExportLoadStr(QED_XLS_Alignment_Horizontal_Right){$ENDIF}
                             {$IFDEF LINUX}QED_XLS_Alignment_Horizontal_Right{$ENDIF};
  btnHorizontalFill.Hint := {$IFDEF WIN32}QExportLoadStr(QED_XLS_Alignment_Horizontal_Fill){$ENDIF}
                            {$IFDEF LINUX}QED_XLS_Alignment_Horizontal_Fill{$ENDIF};
  btnVerticalTop.Hint := {$IFDEF WIN32}QExportLoadStr(QED_XLS_Alignment_Vertical_Top){$ENDIF}
                         {$IFDEF LINUX}QED_XLS_Alignment_Vertical_Top{$ENDIF};
  btnVerticalCenter.Hint := {$IFDEF WIN32}QExportLoadStr(QED_XLS_Alignment_Vertical_Center){$ENDIF}
                            {$IFDEF LINUX}QED_XLS_Alignment_Vertical_Center{$ENDIF};
  btnVerticalBottom.Hint := {$IFDEF WIN32}QExportLoadStr(QED_XLS_Alignment_Vertical_Bottom){$ENDIF}
                            {$IFDEF LINUX}QED_XLS_Alignment_Vertical_Bottom{$ENDIF};

  tshXLSBorders.Caption := {$IFDEF WIN32}QExportLoadStr(QED_XLS_Borders_Title){$ENDIF}
                           {$IFDEF LINUX}QED_XLS_Borders_Title{$ENDIF};
  btnBorderTop.Hint := {$IFDEF WIN32}QExportLoadStr(QED_XLS_Border_Top){$ENDIF}
                       {$IFDEF LINUX}QED_XLS_Border_Top{$ENDIF};
  btnBorderTopColor.Hint := {$IFDEF WIN32}QExportLoadStr(QED_XLS_Border_Top_Color){$ENDIF}
                            {$IFDEF LINUX}QED_XLS_Border_Top_Color{$ENDIF};
  btnBorderBottom.Hint := {$IFDEF WIN32}QExportLoadStr(QED_XLS_Border_Bottom){$ENDIF}
                          {$IFDEF LINUX}QED_XLS_Border_Bottom{$ENDIF};
  btnBorderBottomColor.Hint := {$IFDEF WIN32}QExportLoadStr(QED_XLS_Border_Bottom_Color){$ENDIF}
                               {$IFDEF LINUX}QED_XLS_Border_Bottom_Color{$ENDIF};
  btnBorderLeft.Hint := {$IFDEF WIN32}QExportLoadStr(QED_XLS_Border_Left){$ENDIF}
                        {$IFDEF LINUX}QED_XLS_Border_Left{$ENDIF};
  btnBorderLeftColor.Hint := {$IFDEF WIN32}QExportLoadStr(QED_XLS_Border_Left_Color){$ENDIF}
                             {$IFDEF LINUX}QED_XLS_Border_Left_Color{$ENDIF};
  btnBorderRight.Hint := {$IFDEF WIN32}QExportLoadStr(QED_XLS_Border_Right){$ENDIF}
                         {$IFDEF LINUX}QED_XLS_Border_Right{$ENDIF};
  btnBorderRightColor.Hint := {$IFDEF WIN32}QExportLoadStr(QED_XLS_Border_Right_Color){$ENDIF}
                              {$IFDEF LINUX}QED_XLS_Border_Right_Color{$ENDIF};

  tshXLSFill.Caption := {$IFDEF WIN32}QExportLoadStr(QED_XLS_Fill_Title){$ENDIF}
                        {$IFDEF LINUX}QED_XLS_Fill_Title{$ENDIF};
  btnFillBackground.Hint := {$IFDEF WIN32}QExportLoadStr(QED_XLS_Fill_Background){$ENDIF}
                            {$IFDEF LINUX}QED_XLS_Fill_Background{$ENDIF};
  btnFillForeground.Hint := {$IFDEF WIN32}QExportLoadStr(QED_XLS_Fill_Foreground){$ENDIF}
                            {$IFDEF LINUX}QED_XLS_Fill_Foreground{$ENDIF};

  tshXLSAggregate.Caption := {$IFDEF WIN32}QExportLoadStr(QED_XLS_Aggregate_Title){$ENDIF}
                             {$IFDEF LINUX}QED_XLS_Aggregate_Title{$ENDIF};
  rgXLSFunction.Caption := {$IFDEF WIN32}QExportLoadStr(QED_XLS_Function){$ENDIF}
                           {$IFDEF LINUX}QED_XLS_Function{$ENDIF};
  rgXLSFunction.Items.Clear;
  rgXLSFunction.Items.Add({$IFDEF WIN32}QExportLoadStr(QED_XLS_Function_None){$ENDIF}
                          {$IFDEF LINUX}QED_XLS_Function_None{$ENDIF});
  rgXLSFunction.Items.Add({$IFDEF WIN32}QExportLoadStr(QED_XLS_Function_Sum){$ENDIF}
                          {$IFDEF LINUX}QED_XLS_Function_Sum{$ENDIF});
  rgXLSFunction.Items.Add({$IFDEF WIN32}QExportLoadStr(QED_XLS_Function_Avg){$ENDIF}
                          {$IFDEF LINUX}QED_XLS_Function_Avg{$ENDIF});
  rgXLSFunction.Items.Add({$IFDEF WIN32}QExportLoadStr(QED_XLS_Function_Min){$ENDIF}
                          {$IFDEF LINUX}QED_XLS_Function_Min{$ENDIF});
  rgXLSFunction.Items.Add({$IFDEF WIN32}QExportLoadStr(QED_XLS_Function_Max){$ENDIF}
                          {$IFDEF LINUX}QED_XLS_Function_Max{$ENDIF});

  tshXLSExtensions.Caption := {$IFDEF WIN32}QExportLoadStr(QED_XLS_Extensions){$ENDIF}
                              {$IFDEF LINUX}QED_XLS_Extensions{$ENDIF};

  laXLSHyperlinkCol.Caption := {$IFDEF WIN32}QExportLoadStr(QED_XLS_Hyperlink_Col){$ENDIF}
                               {$IFDEF LINUX}QED_XLS_Hyperlink_Col{$ENDIF};
  laXLSHyperlinkRow.Caption := {$IFDEF WIN32}QExportLoadStr(QED_XLS_Hyperlink_Row){$ENDIF}
                               {$IFDEF LINUX}QED_XLS_Hyperlink_Row{$ENDIF};
  rgXLSHyperlinkStyle.Caption := {$IFDEF WIN32}QExportLoadStr(QED_XLS_Hyperlink_Style){$ENDIF}
                                 {$IFDEF LINUX}QED_XLS_Hyperlink_Style{$ENDIF};
  rgXLSHyperlinkStyle.Items[0] := {$IFDEF WIN32}QExportLoadStr(QED_XLS_Hyperlink_Style_URL){$ENDIF}
                                  {$IFDEF LINUX}QED_XLS_Hyperlink_Style_URL{$ENDIF};
  rgXLSHyperlinkStyle.Items[1] := {$IFDEF WIN32}QExportLoadStr(QED_XLS_Hyperlink_Style_LocalFile){$ENDIF}
                                  {$IFDEF LINUX}QED_XLS_Hyperlink_Style_LocalFile{$ENDIF};
  laXLSHyperlinkTitle.Caption := {$IFDEF WIN32}QExportLoadStr(QED_XLS_Hyperlink_Title){$ENDIF}
                                 {$IFDEF LINUX}QED_XLS_Hyperlink_Title{$ENDIF};
  laXLSHyperlinkTarget.Caption := {$IFDEF WIN32}QExportLoadStr(QED_XLS_Hyperlink_Target){$ENDIF}
                                  {$IFDEF LINUX}QED_XLS_Hyperlink_Target{$ENDIF};
  laXLSHyperlinkScreenTip.Caption := {$IFDEF WIN32}QExportLoadStr(QED_XLS_Hyperlink_ScreenTip){$ENDIF}
                                     {$IFDEF LINUX}QED_XLS_Hyperlink_ScreenTip{$ENDIF};

  tshXLSNoteBase.Caption := {$IFDEF WIN32}QExportLoadStr(QED_XLS_Note_Base){$ENDIF}
                            {$IFDEF LINUX}QED_XLS_Note_Base{$ENDIF};
  laXLSNoteCol.Caption := {$IFDEF WIN32}QExportLoadStr(QED_XLS_Note_Col){$ENDIF}
                          {$IFDEF LINUX}QED_XLS_Note_Col{$ENDIF};
  laXLSNoteRow.Caption := {$IFDEF WIN32}QExportLoadStr(QED_XLS_Note_Row){$ENDIF}
                          {$IFDEF LINUX}QED_XLS_Note_Row{$ENDIF};
  laXLSNoteLines.Caption := {$IFDEF WIN32}QExportLoadStr(QED_XLS_Note_Lines){$ENDIF}
                            {$IFDEF LINUX}QED_XLS_Note_Lines{$ENDIF};
  tshXLSNoteFont.Caption := {$IFDEF WIN32}QExportLoadStr(QED_XLS_Note_Font){$ENDIF}
                            {$IFDEF LINUX}QED_XLS_Note_Font{$ENDIF};
  laXLSNoteFont.Caption := {$IFDEF WIN32}QExportLoadStr(QED_XLS_Note_FontName){$ENDIF}
                           {$IFDEF LINUX}QED_XLS_Note_FontName{$ENDIF};
  laXLSNoteFontSize.Caption := {$IFDEF WIN32}QExportLoadStr(QED_XLS_Note_FontSize){$ENDIF}
                               {$IFDEF LINUX}QED_XLS_Note_FontSize{$ENDIF};
  btnXLSNoteFontColor.Hint := {$IFDEF WIN32}QExportLoadStr(QED_XLS_Note_FontColor){$ENDIF}
                              {$IFDEF LINUX}QED_XLS_Note_FontColor{$ENDIF};
  btnXLSNoteFontBold.Hint := {$IFDEF WIN32}QExportLoadStr(QED_XLS_Note_FontBold){$ENDIF}
                             {$IFDEF LINUX}QED_XLS_Note_FontBold{$ENDIF};
  btnXLSNoteFontItalic.Hint := {$IFDEF WIN32}QExportLoadStr(QED_XLS_Note_FontItalic){$ENDIF}
                               {$IFDEF LINUX}QED_XLS_Note_FontItalic{$ENDIF};
  btnXLSNoteFontStrikeOut.Hint := {$IFDEF WIN32}QExportLoadStr(QED_XLS_Note_FontStrikeOut){$ENDIF}
                                  {$IFDEF LINUX}QED_XLS_Note_FontStrikeOut{$ENDIF};
  btnXLSNoteUnderlineSingle.Hint := {$IFDEF WIN32}QExportLoadStr(QED_XLS_Note_Underline_Single){$ENDIF}
                                    {$IFDEF LINUX}QED_XLS_Note_Underline_Single{$ENDIF};
  btnXLSNoteUnderlineSingleAccounting.Hint := {$IFDEF WIN32}QExportLoadStr(QED_XLS_Note_Underline_SingleAccounting){$ENDIF}
                                              {$IFDEF LINUX}QED_XLS_Note_Underline_SingleAccounting{$ENDIF};
  btnXLSNoteUnderlineDouble.Hint := {$IFDEF WIN32}QExportLoadStr(QED_XLS_Note_Underline_Double){$ENDIF}
                                    {$IFDEF LINUX}QED_XLS_Note_Underline_Double{$ENDIF};
  btnXLSNoteUnderlineDoubleAccounting.Hint := {$IFDEF WIN32}QExportLoadStr(QED_XLS_Note_Underline_DoubleAccounting){$ENDIF}
                                              {$IFDEF LINUX}QED_XLS_Note_Underline_DoubleAccounting{$ENDIF};
  btnXLSNoteHorizontalLeft.Hint := {$IFDEF WIN32}QExportLoadStr(QED_XLS_Note_Horizontal_Left){$ENDIF}
                                   {$IFDEF LINUX}QED_XLS_Note_Horizontal_Left{$ENDIF};
  btnXLSNoteHorizontalCenter.Hint := {$IFDEF WIN32}QExportLoadStr(QED_XLS_Note_Horizontal_Center){$ENDIF}
                                     {$IFDEF LINUX}QED_XLS_Note_Horizontal_Center{$ENDIF};
  btnXLSNoteHorizontalRight.Hint := {$IFDEF WIN32}QExportLoadStr(QED_XLS_Note_Horizontal_Right){$ENDIF}
                                    {$IFDEF LINUX}QED_XLS_Note_Horizontal_Right{$ENDIF};
  btnXLSNoteHorizontalFill.Hint := {$IFDEF WIN32}QExportLoadStr(QED_XLS_Note_Horizontal_Fill){$ENDIF}
                                   {$IFDEF LINUX}QED_XLS_Note_Horizontal_Fill{$ENDIF};
  btnXLSNoteVerticalTop.Hint := {$IFDEF WIN32}QExportLoadStr(QED_XLS_Note_Vertical_Top){$ENDIF}
                                {$IFDEF LINUX}QED_XLS_Note_Vertical_Top{$ENDIF};
  btnXLSNoteVerticalCenter.Hint := {$IFDEF WIN32}QExportLoadStr(QED_XLS_Note_Vertical_Center){$ENDIF}
                                   {$IFDEF LINUX}QED_XLS_Note_Vertical_Center{$ENDIF};
  btnXLSNoteVerticalBottom.Hint := {$IFDEF WIN32}QExportLoadStr(QED_XLS_Note_Vertical_Bottom){$ENDIF}
                                   {$IFDEF LINUX}QED_XLS_Note_Vertical_Bottom{$ENDIF};
  rgXLSNoteOrientation.Caption := {$IFDEF WIN32}QExportLoadStr(QED_XLS_Note_Orientation){$ENDIF}
                                  {$IFDEF LINUX}QED_XLS_Note_Orientation{$ENDIF};
  rgXLSNoteOrientation.Items[0] := {$IFDEF WIN32}QExportLoadStr(QED_XLS_Note_Orientation_NoRotation){$ENDIF}
                                   {$IFDEF LINUX}QED_XLS_Note_Orientation_NoRotation{$ENDIF};
  rgXLSNoteOrientation.Items[1] := {$IFDEF WIN32}QExportLoadStr(QED_XLS_Note_Orientation_TopToBottom){$ENDIF}
                                   {$IFDEF LINUX}QED_XLS_Note_Orientation_TopToBottom{$ENDIF};
  rgXLSNoteOrientation.Items[2] := {$IFDEF WIN32}QExportLoadStr(QED_XLS_Note_Orientation_CounterClockWise){$ENDIF}
                                   {$IFDEF LINUX}QED_XLS_Note_Orientation_CounterClockWise{$ENDIF};
  rgXLSNoteOrientation.Items[3] := {$IFDEF WIN32}QExportLoadStr(QED_XLS_Note_Orientation_ClockWise){$ENDIF}
                                   {$IFDEF LINUX}QED_XLS_Note_Orientation_ClockWise{$ENDIF};
  tshXLSNoteFill.Caption := {$IFDEF WIN32}QExportLoadStr(QED_XLS_Note_Fill){$ENDIF}
                            {$IFDEF LINUX}QED_XLS_Note_Fill{$ENDIF};
  gbXLSNoteFillType.Caption := {$IFDEF WIN32}QExportLoadStr(QED_XLS_Note_FillType){$ENDIF}
                               {$IFDEF LINUX}QED_XLS_Note_FillType{$ENDIF};
  rbXLSNoteFillSolid.Caption := {$IFDEF WIN32}QExportLoadStr(QED_XLS_Note_FillType_Solid){$ENDIF}
                                {$IFDEF LINUX}QED_XLS_Note_FillType_Solid{$ENDIF};
  rbXLSNoteFillGradient.Caption := {$IFDEF WIN32}QExportLoadStr(QED_XLS_Note_FillType_Gradient){$ENDIF}
                                   {$IFDEF LINUX}QED_XLS_Note_FillType_Gradient{$ENDIF};
  rbXLSNoteGradientHorizontal.Caption := {$IFDEF WIN32}QExportLoadStr(QED_XLS_Note_Gradient_Horizontal){$ENDIF}
                                         {$IFDEF LINUX}QED_XLS_Note_Gradient_Horizontal{$ENDIF};
  rbXLSNoteGradientVertical.Caption := {$IFDEF WIN32}QExportLoadStr(QED_XLS_Note_Gradient_Vertical){$ENDIF}
                                       {$IFDEF LINUX}QED_XLS_Note_Gradient_Vertical{$ENDIF};
  rbXLSNoteGradientDiagonalUp.Caption := {$IFDEF WIN32}QExportLoadStr(QED_XLS_Note_Gradient_DiagonalUp){$ENDIF}
                                         {$IFDEF LINUX}QED_XLS_Note_Gradient_DiagonalUp{$ENDIF};
  rbXLSNoteGradientDiagonalDown.Caption := {$IFDEF WIN32}QExportLoadStr(QED_XLS_Note_Gradient_DiagonalDown){$ENDIF}
                                           {$IFDEF LINUX}QED_XLS_Note_Gradient_DiagonalDown{$ENDIF};
  rbXLSNoteGradientFromCorner.Caption := {$IFDEF WIN32}QExportLoadStr(QED_XLS_Note_Gradient_FromCorner){$ENDIF}
                                         {$IFDEF LINUX}QED_XLS_Note_Gradient_FromCorner{$ENDIF};
  rbXLSNoteGradientFromCenter.Caption := {$IFDEF WIN32}QExportLoadStr(QED_XLS_Note_Gradient_FromCenter){$ENDIF}
                                         {$IFDEF LINUX}QED_XLS_Note_Gradient_FromCenter{$ENDIF};
  btnXLSNoteBackgroundColor.Hint := {$IFDEF WIN32}QExportLoadStr(QED_XLS_Note_BackgroundColor){$ENDIF}
                                    {$IFDEF LINUX}QED_XLS_Note_BackgroundColor{$ENDIF};
  btnXLSNoteForegroundColor.Hint := {$IFDEF WIN32}QExportLoadStr(QED_XLS_Note_ForegroundColor){$ENDIF}
                                    {$IFDEF LINUX}QED_XLS_Note_ForegroundColor{$ENDIF};

  tshXLSChartBase.Caption := {$IFDEF WIN32}QExportLoadStr(QED_XLS_Chart_Base){$ENDIF}
                             {$IFDEF LINUX}QED_XLS_Chart_Base{$ENDIF};
  laXLSChartTitle.Caption := {$IFDEF WIN32}QExportLoadStr(QED_XLS_Chart_Title){$ENDIF}
                             {$IFDEF LINUX}QED_XLS_Chart_Title{$ENDIF};
  laXLSChartStyle.Caption := {$IFDEF WIN32}QExportLoadStr(QED_XLS_Chart_Style){$ENDIF}
                             {$IFDEF LINUX}QED_XLS_Chart_Style{$ENDIF};
  cbXLSChartStyle.Items[0] := {$IFDEF WIN32}QExportLoadStr(QED_XLS_Chart_Style_Column){$ENDIF}
                              {$IFDEF LINUX}QED_XLS_Chart_Style_Column{$ENDIF};
  cbXLSChartStyle.Items[1] := {$IFDEF WIN32}QExportLoadStr(QED_XLS_Chart_Style_Column3D){$ENDIF}
                              {$IFDEF LINUX}QED_XLS_Chart_Style_Column3D{$ENDIF};
  cbXLSChartStyle.Items[2] := {$IFDEF WIN32}QExportLoadStr(QED_XLS_Chart_Style_Bar){$ENDIF}
                              {$IFDEF LINUX}QED_XLS_Chart_Style_Bar{$ENDIF};
  cbXLSChartStyle.Items[3] := {$IFDEF WIN32}QExportLoadStr(QED_XLS_Chart_Style_Bar3D){$ENDIF}
                              {$IFDEF LINUX}QED_XLS_Chart_Style_Bar3D{$ENDIF};
  cbXLSChartStyle.Items[4] := {$IFDEF WIN32}QExportLoadStr(QED_XLS_Chart_Style_Line){$ENDIF}
                              {$IFDEF LINUX}QED_XLS_Chart_Style_Line{$ENDIF};
  cbXLSChartStyle.Items[5] := {$IFDEF WIN32}QExportLoadStr(QED_XLS_Chart_Style_LineMark){$ENDIF}
                              {$IFDEF LINUX}QED_XLS_Chart_Style_LineMark{$ENDIF};
  cbXLSChartStyle.Items[6] := {$IFDEF WIN32}QExportLoadStr(QED_XLS_Chart_Style_Line3D){$ENDIF}
                              {$IFDEF LINUX}QED_XLS_Chart_Style_Line3D{$ENDIF};
  cbXLSChartStyle.Items[7] := {$IFDEF WIN32}QExportLoadStr(QED_XLS_Chart_Style_Pie){$ENDIF}
                              {$IFDEF LINUX}QED_XLS_Chart_Style_Pie{$ENDIF};
  cbXLSChartStyle.Items[8] := {$IFDEF WIN32}QExportLoadStr(QED_XLS_Chart_Style_Pie3D){$ENDIF}
                              {$IFDEF LINUX}QED_XLS_Chart_Style_Pie3D{$ENDIF};
  cbXLSChartStyle.Items[9] := {$IFDEF WIN32}QExportLoadStr(QED_XLS_Chart_Style_Area){$ENDIF}
                              {$IFDEF LINUX}QED_XLS_Chart_Style_Area{$ENDIF};
  cbXLSChartStyle.Items[10] := {$IFDEF WIN32}QExportLoadStr(QED_XLS_Chart_Style_Area3D){$ENDIF}
                               {$IFDEF LINUX}QED_XLS_Chart_Style_Area3D{$ENDIF};
  cbXLSChartStyle.Items[11] := {$IFDEF WIN32}QExportLoadStr(QED_XLS_Chart_Style_Surface){$ENDIF}
                               {$IFDEF LINUX}QED_XLS_Chart_Style_Surface{$ENDIF};
  cbXLSChartStyle.Items[12] := {$IFDEF WIN32}QExportLoadStr(QED_XLS_Chart_Style_Surface3D){$ENDIF}
                               {$IFDEF LINUX}QED_XLS_Chart_Style_Surface3D{$ENDIF};
  cbXLSChartStyle.Items[13] := {$IFDEF WIN32}QExportLoadStr(QED_XLS_Chart_Style_Radar){$ENDIF}
                               {$IFDEF LINUX}QED_XLS_Chart_Style_Radar{$ENDIF};
  cbXLSChartStyle.Items[14] := {$IFDEF WIN32}QExportLoadStr(QED_XLS_Chart_Style_RadarArea){$ENDIF}
                               {$IFDEF LINUX}QED_XLS_Chart_Style_RadarArea{$ENDIF};
  tshXLSChartPosition.Caption := {$IFDEF WIN32}QExportLoadStr(QED_XLS_Chart_Position){$ENDIF}
                                 {$IFDEF LINUX}QED_XLS_Chart_Position{$ENDIF};
  rbXLSChartAutoPosition.Caption := {$IFDEF WIN32}QExportLoadStr(QED_XLS_Chart_AutoPosition){$ENDIF}
                                    {$IFDEF LINUX}QED_XLS_Chart_AutoPosition{$ENDIF};
  rgXLSChartPlacement.Caption := {$IFDEF WIN32}QExportLoadStr(QED_XLS_Chart_Placement){$ENDIF}
                                 {$IFDEF LINUX}QED_XLS_Chart_Placement{$ENDIF};
  rgXLSChartPlacement.Items[0] := {$IFDEF WIN32}QExportLoadStr(QED_XLS_Chart_Placement_Bottom){$ENDIF}
                                  {$IFDEF LINUX}QED_XLS_Chart_Placement_Bottom{$ENDIF};
  rgXLSChartPlacement.Items[1] := {$IFDEF WIN32}QExportLoadStr(QED_XLS_Chart_Placement_Right){$ENDIF}
                                  {$IFDEF LINUX}QED_XLS_Chart_Placement_Right{$ENDIF};
  laXLSChartLeft.Caption := {$IFDEF WIN32}QExportLoadStr(QED_XLS_Chart_Left){$ENDIF}
                            {$IFDEF LINUX}QED_XLS_Chart_Left{$ENDIF};
  laXLSChartTop.Caption := {$IFDEF WIN32}QExportLoadStr(QED_XLS_Chart_Top){$ENDIF}
                           {$IFDEF LINUX}QED_XLS_Chart_Top{$ENDIF};
  laXLSChartHeight.Caption := {$IFDEF WIN32}QExportLoadStr(QED_XLS_Chart_Height){$ENDIF}
                              {$IFDEF LINUX}QED_XLS_Chart_Height{$ENDIF};
  laXLSChartWidth.Caption := {$IFDEF WIN32}QExportLoadStr(QED_XLS_Chart_Width){$ENDIF}
                             {$IFDEF LINUX}QED_XLS_Chart_Width{$ENDIF};
  rbXLSChartCustomPosition.Caption := {$IFDEF WIN32}QExportLoadStr(QED_XLS_Chart_CustomPosition){$ENDIF}
                                      {$IFDEF LINUX}QED_XLS_Chart_CustomPosition{$ENDIF};
  laXLSChartPositionX1.Caption := {$IFDEF WIN32}QExportLoadStr(QED_XLS_Chart_Position_X1){$ENDIF}
                                  {$IFDEF LINUX}QED_XLS_Chart_Position_X1{$ENDIF};
  laXLSChartPositionY1.Caption := {$IFDEF WIN32}QExportLoadStr(QED_XLS_Chart_Position_Y1){$ENDIF}
                                  {$IFDEF LINUX}QED_XLS_Chart_Position_Y1{$ENDIF};
  laXLSChartPositionX2.Caption := {$IFDEF WIN32}QExportLoadStr(QED_XLS_Chart_Position_X2){$ENDIF}
                                  {$IFDEF LINUX}QED_XLS_Chart_Position_X2{$ENDIF};
  laXLSChartPositionY2.Caption := {$IFDEF WIN32}QExportLoadStr(QED_XLS_Chart_Position_Y2){$ENDIF}
                                  {$IFDEF LINUX}QED_XLS_Chart_Position_Y2{$ENDIF};
  tshXLSChartCategoryLabels.Caption := {$IFDEF WIN32}QExportLoadStr(QED_XLS_Chart_CategoryLabels){$ENDIF}
                                       {$IFDEF LINUX}QED_XLS_Chart_CategoryLabels{$ENDIF};
  rbXLSChartCategoryLabelColumn.Caption := {$IFDEF WIN32}QExportLoadStr(QED_XLS_Chart_CategoryLabel_Column){$ENDIF}
                                           {$IFDEF LINUX}QED_XLS_Chart_CategoryLabel_Column{$ENDIF};
  rbXLSChartCategoryLabelCustom.Caption := {$IFDEF WIN32}QExportLoadStr(QED_XLS_Chart_CategoryLabel_Custom){$ENDIF}
                                           {$IFDEF LINUX}QED_XLS_Chart_CategoryLabel_Custom{$ENDIF};
  laXLSChartCategoryLabelsCol1.Caption := {$IFDEF WIN32}QExportLoadStr(QED_XLS_Chart_CategoryLabels_Col1){$ENDIF}
                                          {$IFDEF LINUX}QED_XLS_Chart_CategoryLabels_Col1{$ENDIF};
  laXLSChartCategoryLabelsRow1.Caption := {$IFDEF WIN32}QExportLoadStr(QED_XLS_Chart_CategoryLabels_Row1){$ENDIF}
                                          {$IFDEF LINUX}QED_XLS_Chart_CategoryLabels_Row1{$ENDIF};
  laXLSChartCategoryLabelsCol2.Caption := {$IFDEF WIN32}QExportLoadStr(QED_XLS_Chart_CategoryLabels_Col2){$ENDIF}
                                          {$IFDEF LINUX}QED_XLS_Chart_CategoryLabels_Col2{$ENDIF};
  laXLSChartCategoryLabelsRow2.Caption := {$IFDEF WIN32}QExportLoadStr(QED_XLS_Chart_CategoryLabels_Row2){$ENDIF}
                                          {$IFDEF LINUX}QED_XLS_Chart_CategoryLabels_Row2{$ENDIF};
  rgXLSChartLegendPosition.Caption := {$IFDEF WIN32}QExportLoadStr(QED_XLS_Chart_LegendPosition){$ENDIF}
                                      {$IFDEF LINUX}QED_XLS_Chart_LegendPosition{$ENDIF};
  rgXLSChartLegendPosition.Items[0] := {$IFDEF WIN32}QExportLoadStr(QED_XLS_Chart_LegendPosition_Bottom){$ENDIF}
                                       {$IFDEF LINUX}QED_XLS_Chart_LegendPosition_Bottom{$ENDIF};
  rgXLSChartLegendPosition.Items[1] := {$IFDEF WIN32}QExportLoadStr(QED_XLS_Chart_LegendPosition_Corner){$ENDIF}
                                       {$IFDEF LINUX}QED_XLS_Chart_LegendPosition_Corner{$ENDIF};
  rgXLSChartLegendPosition.Items[2] := {$IFDEF WIN32}QExportLoadStr(QED_XLS_Chart_LegendPosition_Top){$ENDIF}
                                       {$IFDEF LINUX}QED_XLS_Chart_LegendPosition_Top{$ENDIF};
  rgXLSChartLegendPosition.Items[3] := {$IFDEF WIN32}QExportLoadStr(QED_XLS_Chart_LegendPosition_Right){$ENDIF}
                                       {$IFDEF LINUX}QED_XLS_Chart_LegendPosition_Right{$ENDIF};
  rgXLSChartLegendPosition.Items[4] := {$IFDEF WIN32}QExportLoadStr(QED_XLS_Chart_LegendPosition_Left){$ENDIF}
                                       {$IFDEF LINUX}QED_XLS_Chart_LegendPosition_Left{$ENDIF};
  chXLSChartShowLegend.Caption := {$IFDEF WIN32}QExportLoadStr(QED_XLS_Chart_ShowLegend){$ENDIF}
                                  {$IFDEF LINUX}QED_XLS_Chart_ShowLegend{$ENDIF};
  chXLSChartAutoColor.Caption := {$IFDEF WIN32}QExportLoadStr(QED_XLS_Chart_AutoColor){$ENDIF}
                                 {$IFDEF LINUX}QED_XLS_Chart_AutoColor{$ENDIF};

  laXLSSeriesTitle.Caption := {$IFDEF WIN32}QExportLoadStr(QED_XLS_Series_Title){$ENDIF}
                              {$IFDEF LINUX}QED_XLS_Series_Title{$ENDIF};
  gbXLSSeriesDataRange.Caption := {$IFDEF WIN32}QExportLoadStr(QED_XLS_Series_DataRange){$ENDIF}
                                  {$IFDEF LINUX}QED_XLS_Series_DataRange{$ENDIF};
  rbXLSSeriesColumn.Caption := {$IFDEF WIN32}QExportLoadStr(QED_XLS_Series_Column){$ENDIF}
                               {$IFDEF LINUX}QED_XLS_Series_Column{$ENDIF};
  rbXLSSeriesCustom.Caption := {$IFDEF WIN32}QExportLoadStr(QED_XLS_Series_Custom){$ENDIF}
                               {$IFDEF LINUX}QED_XLS_Series_Custom{$ENDIF};
  laXLSSeriesDataRangeCol1.Caption := {$IFDEF WIN32}QExportLoadStr(QED_XLS_Series_DataRange_Col1){$ENDIF}
                                      {$IFDEF LINUX}QED_XLS_Series_DataRange_Col1{$ENDIF};
  laXLSSeriesDataRangeRow1.Caption := {$IFDEF WIN32}QExportLoadStr(QED_XLS_Series_DataRange_Row1){$ENDIF}
                                      {$IFDEF LINUX}QED_XLS_Series_DataRange_Row1{$ENDIF};
  laXLSSeriesDataRangeCol2.Caption := {$IFDEF WIN32}QExportLoadStr(QED_XLS_Series_DataRange_Col2){$ENDIF}
                                      {$IFDEF LINUX}QED_XLS_Series_DataRange_Col2{$ENDIF};
  laXLSSeriesDataRangeRow2.Caption := {$IFDEF WIN32}QExportLoadStr(QED_XLS_Series_DataRange_Row2){$ENDIF}
                                      {$IFDEF LINUX}QED_XLS_Series_DataRange_Row2{$ENDIF};
  btnXLSSeriesColor.Hint := {$IFDEF WIN32}QExportLoadStr(QED_XLS_Series_Color){$ENDIF}
                            {$IFDEF LINUX}QED_XLS_Series_Color{$ENDIF};

  tshXLSCellBase.Caption := {$IFDEF WIN32}QExportLoadStr(QED_XLS_Cell_Base){$ENDIF}
                            {$IFDEF LINUX}QED_XLS_Cell_Base{$ENDIF};
  laXLSCellCol.Caption := {$IFDEF WIN32}QExportLoadStr(QED_XLS_Cell_Col){$ENDIF}
                          {$IFDEF LINUX}QED_XLS_Cell_Col{$ENDIF};
  laXLSCellRow.Caption := {$IFDEF WIN32}QExportLoadStr(QED_XLS_Cell_Row){$ENDIF}
                          {$IFDEF LINUX}QED_XLS_Cell_Row{$ENDIF};
  laXLSCellType.Caption := {$IFDEF WIN32}QExportLoadStr(QED_XLS_Cell_Type){$ENDIF}
                           {$IFDEF LINUX}QED_XLS_Cell_Type{$ENDIF};
  cbXLSCellType.Items[0] := {$IFDEF WIN32}QExportLoadStr(QED_XLS_Cell_Type_Boolean){$ENDIF}
                            {$IFDEF LINUX}QED_XLS_Cell_Type_Boolean{$ENDIF};
  cbXLSCellType.Items[1] := {$IFDEF WIN32}QExportLoadStr(QED_XLS_Cell_Type_DateTime){$ENDIF}
                            {$IFDEF LINUX}QED_XLS_Cell_Type_DateTime{$ENDIF};
  cbXLSCellType.Items[2] := {$IFDEF WIN32}QExportLoadStr(QED_XLS_Cell_Type_Numeric){$ENDIF}
                            {$IFDEF LINUX}QED_XLS_Cell_Type_Numeric{$ENDIF};
  cbXLSCellType.Items[3] := {$IFDEF WIN32}QExportLoadStr(QED_XLS_Cell_Type_String){$ENDIF}
                            {$IFDEF LINUX}QED_XLS_Cell_Type_String{$ENDIF};
  laXLSCellValue.Caption := {$IFDEF WIN32}QExportLoadStr(QED_XLS_Cell_Value){$ENDIF}
                            {$IFDEF LINUX}QED_XLS_Cell_Value{$ENDIF};
  laXLSCellDateTimeFormat.Caption := {$IFDEF WIN32}QExportLoadStr(QED_XLS_Cell_DateTimeFormat){$ENDIF}
                                     {$IFDEF LINUX}QED_XLS_Cell_DateTimeFormat{$ENDIF};
  laXLSCellNumericFormat.Caption := {$IFDEF WIN32}QExportLoadStr(QED_XLS_Cell_NumericFormat){$ENDIF}
                                    {$IFDEF LINUX}QED_XLS_Cell_NumericFormat{$ENDIF};

  laXLSMergedCellsFirstCol.Caption := {$IFDEF WIN32}QExportLoadStr(QED_XLS_MergedCell_FirstCol){$ENDIF}
                                      {$IFDEF LINUX}QED_XLS_MergedCell_FirstCol{$ENDIF};
  laXLSMergedCellsFirstRow.Caption := {$IFDEF WIN32}QExportLoadStr(QED_XLS_MergedCell_FirstRow){$ENDIF}
                                      {$IFDEF LINUX}QED_XLS_MergedCell_FirstRow{$ENDIF};
  laXLSMergedCellsLastCol.Caption := {$IFDEF WIN32}QExportLoadStr(QED_XLS_MergedCell_LastCol){$ENDIF}
                                     {$IFDEF LINUX}QED_XLS_MergedCell_LastCol{$ENDIF};
  laXLSMergedCellsLastRow.Caption := {$IFDEF WIN32}QExportLoadStr(QED_XLS_MergedCell_LastRow){$ENDIF}
                                     {$IFDEF LINUX}QED_XLS_MergedCell_LastRow{$ENDIF};

  // ASCII
  tshASCII.Caption := {$IFDEF WIN32}QExportLoadStr(QED_ASCII_Title){$ENDIF}
                      {$IFDEF LINUX}QED_ASCII_Title{$ENDIF};
  gbTXTOptions.Caption := {$IFDEF WIN32}QExportLoadStr(QED_TXT_Title){$ENDIF}
                          {$IFDEF LINUX}QED_TXT_Title{$ENDIF};
  chTXTAutoCalcColWidth.Caption := {$IFDEF WIN32}QExportLoadStr(QED_TXT_AutoCalcColWidth){$ENDIF}
                                   {$IFDEF LINUX}QED_TXT_AutoCalcColWidth{$ENDIF};
  laTXTSpacing.Caption := {$IFDEF WIN32}QExportLoadStr(QED_TXT_Spacing){$ENDIF}
                          {$IFDEF LINUX}QED_TXT_Spacing{$ENDIF};
  gbCSVOptions.Caption := {$IFDEF WIN32}QExportLoadStr(QED_CSV_Title){$ENDIF}
                          {$IFDEF LINUX}QED_CSV_Title{$ENDIF};
  chCSVQuoteStrings.Caption := {$IFDEF WIN32}QExportLoadStr(QED_CSV_QuoteStrings){$ENDIF}
                               {$IFDEF LINUX}QED_CSV_QuoteStrings{$ENDIF};
  laCSVComma.Caption := {$IFDEF WIN32}QExportLoadStr(QED_CSV_Comma){$ENDIF}
                        {$IFDEF LINUX}QED_CSV_Comma{$ENDIF};
  laCSVQuote.Caption := {$IFDEF WIN32}QExportLoadStr(QED_CSV_Quote){$ENDIF}
                        {$IFDEF LINUX}QED_CSV_Quote{$ENDIF};

  //PDF
  tshPDF.Caption := {$IFDEF WIN32}QExportLoadStr(QED_PDF_Title){$ENDIF}
                    {$IFDEF LINUX}QED_PDF_Title{$ENDIF};
  laPDFFontName.Caption := {$IFDEF WIN32}QExportLoadStr(QED_PDF_FontName){$ENDIF}
                           {$IFDEF LINUX}QED_PDF_FontName{$ENDIF};
  laPDFFontEncoding.Caption := {$IFDEF WIN32}QExportLoadStr(QED_PDF_FontEncoding){$ENDIF}
                               {$IFDEF LINUX}QED_PDF_FontEncoding{$ENDIF};
  laPDFFontSize.Caption := {$IFDEF WIN32}QExportLoadStr(QED_PDF_FontSize){$ENDIF}
                           {$IFDEF LINUX}QED_PDF_FontSize{$ENDIF};
  sbPDFFontColor.Caption := {$IFDEF WIN32}QExportLoadStr(QED_PDF_FontColor){$ENDIF}
                            {$IFDEF LINUX}QED_PDF_FontColor{$ENDIF};
  paPDFSample.Caption := {$IFDEF WIN32}QExportLoadStr(QED_PDF_Sample){$ENDIF}
                         {$IFDEF LINUX}QED_PDF_Sample{$ENDIF};

  tshPDFGridOptions.Caption := {$IFDEF WIN32}QExportLoadStr(QED_PDF_GridOptions){$ENDIF}
                               {$IFDEF LINUX}QED_PDF_GridOptions{$ENDIF};
  laPDFColSpacing.Caption := {$IFDEF WIN32}QExportLoadStr(QED_PDF_ColSpacing){$ENDIF}
                             {$IFDEF LINUX}QED_PDF_ColSpacing{$ENDIF};
  laPDFRowSpacing.Caption := {$IFDEF WIN32}QExportLoadStr(QED_PDF_RowSpacing){$ENDIF}
                             {$IFDEF LINUX}QED_PDF_RowSpacing{$ENDIF};
  laPDFGridLineWidth.Caption := {$IFDEF WIN32}QExportLoadStr(QED_PDF_GridLineWidth){$ENDIF}
                                {$IFDEF LINUX}QED_PDF_GridLineWidth{$ENDIF};

  tshPDFPageOptions.Caption := {$IFDEF WIN32}QExportLoadStr(QED_PDF_PageOptions){$ENDIF}
                               {$IFDEF LINUX}QED_PDF_PageOptions{$ENDIF};
  laPDFPageFormat.Caption := {$IFDEF WIN32}QExportLoadStr(QED_PDF_PageSize){$ENDIF}
                             {$IFDEF LINUX}QED_PDF_PageSize{$ENDIF};
  cbPDFPageFormat.Items.Clear;
  cbPDFPageFormat.Items.Add({$IFDEF WIN32}QExportLoadStr(QEPF_Letter){$ENDIF}
                            {$IFDEF LINUX}QEPF_Letter{$ENDIF});
  cbPDFPageFormat.Items.Add({$IFDEF WIN32}QExportLoadStr(QEPF_Legal){$ENDIF}
                            {$IFDEF LINUX}QEPF_Legal{$ENDIF});
  cbPDFPageFormat.Items.Add({$IFDEF WIN32}QExportLoadStr(QEPF_A3){$ENDIF}
                            {$IFDEF LINUX}QEPF_A3{$ENDIF});
  cbPDFPageFormat.Items.Add({$IFDEF WIN32}QExportLoadStr(QEPF_A4){$ENDIF}
                            {$IFDEF LINUX}QEPF_A4{$ENDIF});
  cbPDFPageFormat.Items.Add({$IFDEF WIN32}QExportLoadStr(QEPF_A5){$ENDIF}
                            {$IFDEF LINUX}QEPF_A5{$ENDIF});
  cbPDFPageFormat.Items.Add({$IFDEF WIN32}QExportLoadStr(QEPF_B5_JIS){$ENDIF}
                            {$IFDEF LINUX}QEPF_B5_JIS{$ENDIF});
  cbPDFPageFormat.Items.Add({$IFDEF WIN32}QExportLoadStr(QEPF_US_Std_Fanfold){$ENDIF}
                            {$IFDEF LINUX}QEPF_US_Std_Fanfold{$ENDIF});
  cbPDFPageFormat.Items.Add({$IFDEF WIN32}QExportLoadStr(QEPF_Fanfold){$ENDIF}
                            {$IFDEF LINUX}QEPF_Fanfold{$ENDIF});
  cbPDFPageFormat.Items.Add({$IFDEF WIN32}QExportLoadStr(QEPF_User){$ENDIF}
                            {$IFDEF LINUX}QEPF_User{$ENDIF});
  cbPDFPageFormat.ItemIndex := Integer(Dialog.PDFOptions.PageOptions.Format);
  laPDFPageUnits.Caption := {$IFDEF WIN32}QExportLoadStr(QED_PDF_PageUnits){$ENDIF}
                            {$IFDEF LINUX}QED_PDF_PageUnits{$ENDIF};
  cbPDFPageUnits.Items.Clear;
  cbPDFPageUnits.Items.Add({$IFDEF WIN32}QExportLoadStr(QEUN_Inch){$ENDIF}
                           {$IFDEF LINUX}QEUN_Inch{$ENDIF});
  cbPDFPageUnits.Items.Add({$IFDEF WIN32}QExportLoadStr(QEUN_Millimeter){$ENDIF}
                           {$IFDEF LINUX}QEUN_Millimeter{$ENDIF});
  cbPDFPageUnits.Items.Add({$IFDEF WIN32}QExportLoadStr(QEUN_Dot){$ENDIF}
                           {$IFDEF LINUX}QEUN_Dot{$ENDIF});
  cbPDFPageUnits.ItemIndex := Integer(Dialog.PDFOptions.PageOptions.Units);
  laPDFPageOrientation.Caption := {$IFDEF WIN32}QExportLoadStr(QED_PDF_PageOrientation){$ENDIF}
                                  {$IFDEF LINUX}QED_PDF_PageOrientation{$ENDIF};
  cbPDFPageOrientation.Items.Clear;
  cbPDFPageOrientation.Items.Add({$IFDEF WIN32}QExportLoadStr(QEPO_Portrait){$ENDIF}
                                 {$IFDEF LINUX}QEPO_Portrait{$ENDIF});
  cbPDFPageOrientation.Items.Add({$IFDEF WIN32}QExportLoadStr(QEPO_Landscape){$ENDIF}
                                 {$IFDEF LINUX}QEPO_Landscape{$ENDIF});
  cbPDFPageOrientation.ItemIndex := Integer(Dialog.PDFOptions.PageOptions.Orientation);
  gbPDFMargins.Caption := {$IFDEF WIN32}QExportLoadStr(QED_PDF_Margins){$ENDIF}
                          {$IFDEF LINUX}QED_PDF_Margins{$ENDIF};
  laPDFPageMarginLeft.Caption := {$IFDEF WIN32}QExportLoadStr(QED_PDF_MarginLeft){$ENDIF}
                                 {$IFDEF LINUX}QED_PDF_MarginLeft{$ENDIF};
  laPDFPageMarginRight.Caption := {$IFDEF WIN32}QExportLoadStr(QED_PDF_MarginRight){$ENDIF}
                                  {$IFDEF LINUX}QED_PDF_MarginRight{$ENDIF};
  laPDFPageMarginTop.Caption := {$IFDEF WIN32}QExportLoadStr(QED_PDF_MarginTop){$ENDIF}
                                {$IFDEF LINUX}QED_PDF_MarginTop{$ENDIF};
  laPDFPageMarginBottom.Caption := {$IFDEF WIN32}QExportLoadStr(QED_PDF_MarginBottom){$ENDIF}
                                   {$IFDEF LINUX}QED_PDF_MarginBottom{$ENDIF};
end;

procedure TQExport3DialogF.FieldsListDragOver(Sender,
  Source: TObject; X, Y: Integer; State: TDragState; var Accept: Boolean);
begin
  Accept := (Source is TListView);// and (Source <> Sender);
end;

procedure TQExport3DialogF.rgXLSFunctionClick(Sender: TObject);
begin
  if CurrXLSListView = nil then Exit;
  if CurrXLSListView.SelCount < 1 then Exit;
  TxlsFieldFormat(FXLSListItem.Data).Aggregate :=
    TxlsAggregate(rgXLSFunction.ItemIndex);
  if CurrXLSListView.SelCount > 1 then
    ForAllListViewItems(CurrXLSListView, XLSUpdateItemAggregate, false, false);
end;

procedure TQExport3DialogF.btnXLSResetItemClick(Sender: TObject);
begin
  if CurrXLSListView = nil then Exit;
  if CurrXLSListView.SelCount < 1 then Exit;

  if (CurrXLSListView = lstXLSOptions) and
     (AnsiCompareText(FXLSListItem.Caption, {$IFDEF WIN32}QExportLoadStr(QED_XLS_Caption){$ENDIF}
                                            {$IFDEF LINUX}QED_XLS_Caption{$ENDIF}) = 0) then
    SetDefaultXLSCaption(TxlsFieldFormat(FXLSListItem.Data))
  else TxlsFieldFormat(FXLSListItem.Data).SetDefault;

  if CurrXLSListView.SelCount > 1 then
    ForAllListViewItems(CurrXLSListView, XLSUpdateItemSetDefault, false, false);
  CurrXLSListView.OnChange(CurrXLSListView, CurrXLSListView.Selected, ctState);
  if (CurrXLSListView = lstXLSOptions) and
     (lstXLSOptions.Selected.Index = 4) then
    XLSUpdateHyperlinkFormats;
end;

procedure TQExport3DialogF.btnXLSResetAllClick(Sender: TObject);
begin
  if CurrXLSListView = nil then Exit;
  if CurrXLSListView.Items.Count = 0 then Exit;
  if Application.MessageBox(PChar({$IFDEF WIN32}QExportLoadStr(QED_XLS_Reset_All_Question){$ENDIF}
                                  {$IFDEF LINUX}QED_XLS_Reset_All_Question{$ENDIF}),
    PChar({$IFDEF WIN32}QExportLoadStr(QED_XLS_Reset_All_Question_Caption){$ENDIF}
          {$IFDEF LINUX}QED_XLS_Reset_All_Question_Caption{$ENDIF}),
    MB_YESNO + MB_ICONWARNING + MB_DEFBUTTON2) = ID_NO
    then Exit;
  XLSResetAllItems;
  if (CurrXLSListView = lstXLSOptions) and
     (lstXLSOptions.Selected.Index = 4) then
    XLSUpdateHyperlinkFormats;
end;

procedure TQExport3DialogF.btnFontColorMouseDown(Sender: TObject;
  Button: TMouseButton; Shift: TShiftState; X, Y: Integer);
begin
  IncLeftAndTop(pbFontColor);
end;

procedure TQExport3DialogF.btnFontColorMouseUp(Sender: TObject;
  Button: TMouseButton; Shift: TShiftState; X, Y: Integer);
begin
  DecLeftAndTop(pbFontColor);
end;

procedure TQExport3DialogF.btnBorderTopColorMouseDown(Sender: TObject;
  Button: TMouseButton; Shift: TShiftState; X, Y: Integer);
begin
  IncLeftAndTop(pbBorderTop);
end;

procedure TQExport3DialogF.btnBorderTopColorMouseUp(Sender: TObject;
  Button: TMouseButton; Shift: TShiftState; X, Y: Integer);
begin
  DecLeftAndTop(pbBorderTop);
end;

procedure TQExport3DialogF.btnBorderBottomColorMouseDown(Sender: TObject;
  Button: TMouseButton; Shift: TShiftState; X, Y: Integer);
begin
  IncLeftAndTop(pbBorderBottom);
end;

procedure TQExport3DialogF.btnBorderBottomColorMouseUp(Sender: TObject;
  Button: TMouseButton; Shift: TShiftState; X, Y: Integer);
begin
  DecLeftAndTop(pbBorderBottom);
end;

procedure TQExport3DialogF.btnBorderLeftColorMouseDown(Sender: TObject;
  Button: TMouseButton; Shift: TShiftState; X, Y: Integer);
begin
  IncLeftAndTop(pbBorderLeft);
end;

procedure TQExport3DialogF.btnBorderLeftColorMouseUp(Sender: TObject;
  Button: TMouseButton; Shift: TShiftState; X, Y: Integer);
begin
  DecLeftAndTop(pbBorderLeft);
end;

procedure TQExport3DialogF.btnBorderRightColorMouseDown(Sender: TObject;
  Button: TMouseButton; Shift: TShiftState; X, Y: Integer);
begin
  IncLeftAndTop(pbBorderRight);
end;

procedure TQExport3DialogF.btnBorderRightColorMouseUp(Sender: TObject;
  Button: TMouseButton; Shift: TShiftState; X, Y: Integer);
begin
  DecLeftAndTop(pbBorderRight);
end;

procedure TQExport3DialogF.btnFillBackgroundMouseDown(Sender: TObject;
  Button: TMouseButton; Shift: TShiftState; X, Y: Integer);
begin
  IncLeftAndTop(pbFillBackground);
end;

procedure TQExport3DialogF.btnFillBackgroundMouseUp(Sender: TObject;
  Button: TMouseButton; Shift: TShiftState; X, Y: Integer);
begin
  DecLeftAndTop(pbFillBackground);
end;

procedure TQExport3DialogF.btnFillForegroundMouseDown(Sender: TObject;
  Button: TMouseButton; Shift: TShiftState; X, Y: Integer);
begin
  IncLeftAndTop(pbFillForeground);
end;

procedure TQExport3DialogF.btnFillForegroundMouseUp(Sender: TObject;
  Button: TMouseButton; Shift: TShiftState; X, Y: Integer);
begin
  DecLeftAndTop(pbFillForeground);
end;

procedure TQExport3DialogF.pbXLSCellPaint(Sender: TObject);
var
  Fmt: TxlsFormat;
begin
  Fmt := CurrXLSFormat;
  if not Assigned(Fmt) then Exit;

  if (CurrXLSListView <> nil) and (CurrXLSListView.SelCount = 1) then
    DrawXLSCell(pbXLSCell, TxlsFormat(CurrXLSListView.Selected.Data))
  else DrawXLSCell(pbXLSCell, Fmt)
end;

function TQExport3DialogF.CurrXLSListView: TListView;
begin
  Result := nil;
  if pcXLS.ActivePage = tshXLSDataFormat then begin
    if pcXLSFormats.ActivePage = tshXLSFields then
      Result := lstXLSFields
    else if pcXLSFormats.ActivePage = tshXLSOptions then
      Result := lstXLSOptions
    else if pcXLSFormats.ActivePage = tshXLSStyles then
      Result := lstXLSStyles;
  end;
end;

function TQExport3DialogF.CurrXLSFormat: TxlsFormat;
var
  LV: TListView;
begin
  Result := nil;
  if pcXLS.ActivePage = tshXLSDataFormat then begin
    LV := nil;
    if pcXLSFormats.ActivePage = tshXLSFields then
      LV := lstXLSFields
    else if pcXLSFormats.ActivePage = tshXLSOptions then
      LV := lstXLSOptions
    else if pcXLSFormats.ActivePage = tshXLSStyles then
      LV := lstXLSStyles;
    if LV.SelCount > 0 then
      Result := TxlsFormat(FXLSListItem.Data);
  end
  else if pcXLS.ActivePage = tshXLSExtensions then begin
    if Assigned(tvXLSExtensions.Selected) and
       (tvXLSExtensions.Selected.ImageIndex = xlsCell) and
       (tvXLSExtensions.Selected.Level = 1) then
      Result := TxlsCell(tvXLSExtensions.Selected.Data).Format;
  end;
end;

procedure TQExport3DialogF.CorrectXLSFieldsList;
var
  i, j: integer;
  flag: boolean;
begin
  if lstExportedFields.Items.Count = 0 then begin
    for i := 0 to lstXLSFields.Items.Count - 1 do begin
      j := Dialog.Columns.IndexOfName(lstXLSFields.Items[i].Caption);
      if not Dialog.Columns[j].IsBlob
        then lstXLSFields.Items[i].ImageIndex := 1
        else lstXLSFields.Items[i].ImageIndex := 0;
    end
  end
  else begin
    // Adding columns which not in lstXLSFields
    for i := 0 to lstExportedFields.Items.Count - 1 do
      for j := 0 to lstXLSFields.Items.Count - 1 do
        if AnsiCompareText(lstExportedFields.Items[i].Caption,
             lstXLSFields.Items[j].Caption) = 0 then begin
          lstXLSFields.Items[j].ImageIndex := 1;
          SetListItemIndex(lstXLSFields.Items[j], i);
          Break;
        end;
    // Deleting columns which not in lstExportedFields
    for i := lstXLSFields.Items.Count - 1 downto 0 do begin
      flag := false;
      for j := 0 to lstExportedFields.Items.Count - 1 do begin
        flag := flag or
          (AnsiCompareText(lstXLSFields.Items[i].Caption,
            lstExportedFields.Items[j].Caption) = 0);
        if flag then Break;
      end;
      if not flag then lstXLSFields.Items[i].ImageIndex := 0;
    end;
  end;
end;

procedure TQExport3DialogF.lstAvailableFieldsDragDrop(Sender,
  Source: TObject; X, Y: Integer);
var
  Item, Item1: TListItem;
  n: integer;
begin
  if Source <> Sender then begin
    with MoveListItem((Source as TListView).Selected, Sender as TListView, true,
      GetIndexOfNewAvailableFields((Source as TListView).Selected)) do
      ImageIndex := 0;
    CorrectXLSFieldsList;
  end
  else begin
    Item := (Source as TListView).GetItemAt(X, Y);
    if Assigned(Item) then begin
      if Item.Index > (Source as TListView).Selected.Index
        then n := 1
        else n := 0;
      Item1 := (Source as TListView).Items.Insert(Item.Index + n);
      with Item1 do Caption := (Source as TListView).Selected.Caption;
      (Source as TListView).Selected.Delete;
      Item1.Focused := true;
      Item1.Selected := true;
    end;
  end;
end;

procedure TQExport3DialogF.lstExportedFieldsDragDrop(Sender,
  Source: TObject; X, Y: Integer);
begin
  with MoveListItem((Source as TListView).Selected, Sender as TListView, true, -1) do
    ImageIndex := 1;
  CorrectXLSFieldsList;
end;

function TQExport3DialogF.RTFCurrListView: TListView;
begin
  if pcRTFStyles.ActivePage = tsRTFBaseStyles then
    Result := lstRTFBaseStyles
  else if pcRTFStyles.ActivePage = tsRTFStripStyles then
    Result := lstRTFStripStyles
  else Result := nil
end;

procedure TQExport3DialogF.RTFResetAllItems;
var
  Index, i: integer;
begin
  if Assigned(FRTFListItem)
    then Index := FRTFListItem.Index
    else Index := 0;
  RTFCurrListView.Items.BeginUpdate;
  try
    if Assigned(FRTFListItem) then
      TrtfStyle(FRTFListItem.Data).SetDefault;

    for i := 0 to RTFCurrListView.Items.Count - 1 do
      RTFUpdateItemSetDefault(RTFCurrListView.Items[i]);
    RTFCurrListView.Items[Index].Selected := true;
  finally
    RTFCurrListView.Items.EndUpdate;
    RTFCurrListView.OnChange(RTFCurrListView, FRTFListItem, ctState);
  end;
end;

procedure TQExport3DialogF.RTFResetAllItems_A;
var
  i, j: integer;
  LV: TListView;
begin
  for i := 1 to 2 do begin
    case i of
      1: LV := lstRTFBaseStyles;
      2: LV := lstRTFStripStyles;
      else LV := nil;
    end;
    if not Assigned(LV) then Exit;

    LV.Items.BeginUpdate;
    try
      for j := 0 to LV.Items.Count - 1 do begin
        RTFUpdateItemSetDefault(LV.Items[j]);
        if AnsiCompareText(LV.Items[j].Caption, {$IFDEF WIN32}QExportLoadStr(QED_RTF_Caption){$ENDIF}
                                                {$IFDEF LINUX}QED_RTF_Caption{$ENDIF}) = 0 then
          EditFontStyle(TrtfStyle(LV.Items[j].Data).Font, fsBold, true);
      end;
    finally
      LV.Items.EndUpdate;
    end;
  end;
  if Assigned(FRTFListItem) then TrtfStyle(FRTFListItem.Data).SetDefault;
end;

procedure TQExport3DialogF.RTFUpdateItemSetDefault(Item: TListItem);
begin
  if Item <> FRTFListItem then begin
    if AnsiCompareText(Item.Caption, {$IFDEF WIN32}QExportLoadStr(QED_RTF_Caption){$ENDIF}
                                     {$IFDEF LINUX}QED_RTF_Caption{$ENDIF}) = 0
      then SetDefaultRTFCaption(TrtfStyle(Item.Data))
      else TrtfStyle(Item.Data).SetDefault;
  end;
end;

procedure TQExport3DialogF.RTFShowStyleButtons;
begin
  tbtDelRTFStyle.Enabled := Assigned(lstRTFStripStyles.Selected);
  tbtMoveRTFStyleUp.Enabled := Assigned(lstRTFStripStyles.Selected) and
    (lstRTFStripStyles.Items.Count > 1) and (lstRTFStripStyles.Selected.Index > 0);
  tbtMoveRTFStyleDown.Enabled := Assigned(lstRTFStripStyles.Selected) and
    (lstRTFStripStyles.Items.Count > 1) and
    (lstRTFStripStyles.Selected.Index < lstRTFStripStyles.Items.Count - 1);
  tbtSaveRTFStyle.Enabled := lstRTFStripStyles.Items.Count > 0;
end;

procedure TQExport3DialogF.RTFRenumStyles;
var
  i: integer;
  LI: TListItem;
begin
  lstRTFStripStyles.Items.BeginUpdate;
  try
    LI := lstRTFStripStyles.Selected;
    for i := 0 to lstRTFStripStyles.Items.Count - 1 do
      lstRTFStripStyles.Items[i].Caption := {$IFDEF WIN32}QExportLoadStr(QED_RTF_StyleItem){$ENDIF}
                                            {$IFDEF LINUX}QED_RTF_StyleItem{$ENDIF} + IntToStr(i + 1);
    if Assigned(LI) then begin
      LI.Focused := true;
      LI.Selected := true;
    end;
  finally
    lstRTFStripStyles.Items.EndUpdate;
  end;
end;

procedure TQExport3DialogF.RTFSaveStyle(const FileName: string);
var
  IniFile: TIniFile;
  i: integer;
begin
  IniFile := TIniFile.Create(FileName);
  try
    ClearIniFile(IniFile);
    for i := 0 to lstRTFStripStyles.Items.Count - 1 do
      TxlsFormat(lstRTFStripStyles.Items[i].Data).SaveToIniFile(IniFile,
        S_XLS_STYLE + IntToStr(i));
  finally
    IniFile.Free;
  end;
end;

procedure TQExport3DialogF.RTFLoadStyle(const FileName: string);
var
  IniFile: TIniFile;
  AStrings: TStrings;
  i: integer;
begin
  lstRTFStripStyles.Items.BeginUpdate;
  try
    lstRTFStripStyles.Items.Clear;
    IniFile := TIniFile.Create(FileName);
    try
      AStrings := TStringList.Create;
      try
        IniFile.ReadSections(AStrings);
        for i := 0 to AStrings.Count - 1 do
          if AnsiCompareText(S_RTF_STRIP_STYLE, Copy(AStrings[i], 1,
            Length(S_RTF_STRIP_STYLE))) = 0 then
            with lstRTFStripStyles.Items.Add do begin
              Caption := {$IFDEF WIN32}QExportLoadStr(QED_RTF_StyleItem){$ENDIF}
                         {$IFDEF LINUX}QED_RTF_StyleItem{$ENDIF} + Copy(AStrings[i],
                Length(S_RTF_STRIP_STYLE) + 1, Length(AStrings[i]));
              Data := TrtfStyle.Create(nil);
              TrtfStyle(Data).LoadFromIniFile(IniFile, AStrings[i]);
              ImageIndex := 2;
            end;
        if lstRTFStripStyles.Items.Count > 0 then begin
          ActiveControl := lstRTFStripStyles;
          lstRTFStripStyles.Items[0].Focused := true;
          lstRTFStripStyles.Items[0].Selected := true;
        end;
      finally
        AStrings.Free;
      end;
    finally
      IniFile.Free;
    end;
  finally
    lstRTFStripStyles.Items.EndUpdate;
  end;
end;

procedure TQExport3DialogF.RTFUpdateItemFont(Item: TListItem);
begin
  if Item <> FRTFListItem
    then TrtfStyle(Item.Data).Font.Name :=
      TrtfStyle(FRTFListItem.Data).Font.Name;
end;

procedure TQExport3DialogF.RTFUpdateItemFontSize(Item: TListItem);
begin
  if Item <> FRTFListItem
    then TrtfStyle(Item.Data).Font.Size :=
      TrtfStyle(FRTFListItem.Data).Font.Size;
end;

procedure TQExport3DialogF.RTFUpdateItemFontColor(Item: TListItem);
begin
  if Item <> FRTFListItem
    then TrtfStyle(Item.Data).Font.Color :=
      TrtfStyle(FRTFListItem.Data).Font.Color;
end;

procedure TQExport3DialogF.RTFUpdateItemFontBold(Item: TListItem);
begin
  if Item <> FRTFListItem then
    RTFItemEditFontStyle(Item, fsBold,
      fsBold in TrtfStyle(FRTFListItem.Data).Font.Style);
end;

procedure TQExport3DialogF.RTFUpdateItemFontItalic(Item: TListItem);
begin
  if Item <> FRTFListItem then
    RTFItemEditFontStyle(Item, fsItalic,
      fsItalic in TrtfStyle(FRTFListItem.Data).Font.Style);
end;

procedure TQExport3DialogF.RTFUpdateItemFontStrikeOut(Item: TListItem);
begin
  if Item <> FRTFListItem then
    RTFItemEditFontStyle(Item, fsStrikeOut,
      fsStrikeOut in TrtfStyle(FRTFListItem.Data).Font.Style);
end;

procedure TQExport3DialogF.RTFUpdateItemFontUnderline(Item: TListItem);
begin
  if Item <> FRTFListItem then
    RTFItemEditFontStyle(Item, fsUnderline,
      fsUnderline in TrtfStyle(FRTFListItem.Data).Font.Style);
end;

procedure TQExport3DialogF.RTFUpdateItemBackgroundColor(Item: TListItem);
begin
  if Item <> FRTFListItem
    then TrtfStyle(Item.Data).BackgroundColor :=
      TrtfStyle(FRTFListItem.Data).BackgroundColor;
end;

procedure TQExport3DialogF.RTFUpdateItemHighlightColor(Item: TListItem);
begin
  if Item <> FRTFListItem
    then TrtfStyle(Item.Data).HighlightColor :=
      TrtfStyle(FRTFListItem.Data).HighlightColor;
end;

procedure TQExport3DialogF.RTFUpdateItemAllowBackground(Item: TListItem);
begin
  if Item <> FRTFListItem
    then TrtfStyle(Item.Data).AllowBackground :=
      TrtfStyle(FRTFListItem.Data).AllowBackground;
end;

procedure TQExport3DialogF.RTFUpdateItemAllowHighlight(Item: TListItem);
begin
  if Item <> FRTFListItem
    then TrtfStyle(Item.Data).AllowHighlight :=
      TrtfStyle(FRTFListItem.Data).AllowHighlight;
end;

procedure TQExport3DialogF.RTFUpdateItemAlignment(Item: TListItem);
begin
  if Item <> FRTFListItem then
    TrtfStyle(Item.Data).Alignment :=
      TrtfStyle(FRTFListItem.Data).Alignment;
end;

procedure TQExport3DialogF.ShowRTFListItem(Item: TListItem);
begin
  btnXLSResetItem.Caption := {$IFDEF WIN32}QExportLoadStr(QED_RTF_Reset_Item){$ENDIF}
                             {$IFDEF LINUX}QED_RTF_Reset_Item{$ENDIF};

  cbRTFFont.ItemIndex :=
    cbRTFFont.Items.IndexOf(TrtfStyle(Item.Data).Font.Name);
  cbRTFFontSize.Text := IntToStr(TrtfStyle(Item.Data).Font.Size);

  pbRTFFontColor.Repaint;
  bRTFFontBold.Down := fsBold in TrtfStyle(Item.Data).Font.Style;
  bRTFFontItalic.Down := fsItalic in TrtfStyle(Item.Data).Font.Style;
  bRTFFontStrikeOut.Down := fsStrikeOut in TrtfStyle(Item.Data).Font.Style;
  bRTFFontUnderline.Down := fsUnderline in TrtfStyle(Item.Data).Font.Style;

  case TrtfStyle(Item.Data).Alignment of
    talLeft: bRTFFontLeft.Down := true;
    talCenter: bRTFFontCenter.Down := true;
    talRight: bRTFFontRight.Down := true;
    talFill: bRTFFontFill.Down := true;
  end;

  pbRTFBackgroundColor.Repaint;
  pbRTFHighlightColor.Repaint;

  chRTFAllowHighlight.Checked := TrtfStyle(Item.Data).AllowHighlight;
  chRTFAllowBackground.Checked := TrtfStyle(Item.Data).AllowBackground;

  pbRTFSample.Repaint;
end;

procedure TQExport3DialogF.ShowRTFListItemM;
var
  i: integer;
  IsFont, IsFontSize,
  IsAllowBackground, IsAllowHighlight: boolean;
begin
  if RTFCurrListView = nil then Exit;
  bRTFResetItem.Caption := {$IFDEF WIN32}QExportLoadStr(QED_RTF_Reset_SelectedItems){$ENDIF}
                           {$IFDEF LINUX}QED_RTF_Reset_SelectedItems{$ENDIF};

  IsFont := true;
  IsFontSize := true;
  IsAllowBackground := true;
  IsAllowHighlight := true;
  for i := 0 to RTFCurrListView.Items.Count - 1 do
    if RTFCurrListView.Items[i].Selected and
      (RTFCurrListView.Items[i] <> FRTFListItem) then begin

      if IsFont then
        IsFont := IsFont and
          (AnsiCompareText(TrtfStyle(FRTFListItem.Data).Font.Name,
            TrtfStyle(RTFCurrListView.Items[i].Data).Font.Name) = 0);

      if IsFontSize then
        IsFontSize := IsFontSize and
          (TrtfStyle(FRTFListItem.Data).Font.Size =
            TrtfStyle(RTFCurrListView.Items[i].Data).Font.Size);

      if IsAllowBackground then
        IsAllowBackground := IsAllowBackground and
          (TrtfStyle(FRTFListItem.Data).AllowBackground =
            TrtfStyle(RTFCurrListView.Items[i].Data).AllowBackground);

      if IsAllowHighlight then
        IsAllowHighlight := IsAllowHighlight and
          (TrtfStyle(FRTFListItem.Data).AllowHighlight =
            TrtfStyle(RTFCurrListView.Items[i].Data).AllowHighlight);
    end;

  if IsFont
    then cbRTFFont.ItemIndex := cbRTFFont.Items.IndexOf(TrtfStyle(FRTFListItem.Data).Font.Name)
    else cbRTFFont.ItemIndex := -1;

  if IsFontSize
    then cbRTFFontSize.Text := IntToStr(TrtfStyle(FRTFListItem.Data).Font.Size)
    else cbRTFFontSize.Text := EmptyStr;

  if IsAllowBackground
    then chRTFAllowBackground.Checked := TrtfStyle(FRTFListItem.Data).AllowBackground
    else chRTFAllowBackground.State := cbGrayed;

  if IsAllowHighlight
    then chRTFAllowHighlight.Checked := TrtfStyle(FRTFListItem.Data).AllowHighlight
    else chRTFAllowHighlight.State := cbGrayed;

  pbRTFFontColor.Repaint;

  bRTFFontBold.Down := fsBold in TrtfStyle(FRTFListItem.Data).Font.Style;
  bRTFFontItalic.Down := fsItalic in TrtfStyle(FRTFListItem.Data).Font.Style;
  bRTFFontStrikeOut.Down := fsStrikeOut in TrtfStyle(FRTFListItem.Data).Font.Style;
  bRTFFontUnderline.Down := fsUnderline in TrtfStyle(FRTFListItem.Data).Font.Style;

  case TrtfStyle(FRTFListItem.Data).Alignment of
    talLeft: bRTFFontLeft.Down := true;
    talCenter: bRTFFontCenter.Down := true;
    talRight: bRTFFontRight.Down := true;
    talFill: bRTFFontFill.Down := true;
  end;

  pbRTFBackgroundColor.Repaint;
  pbRTFHighlightColor.Repaint;

  pbRTFSample.Repaint;
end;

procedure TQExport3DialogF.ShowXLSListItem(Fmt: TxlsFormat);
var
  Event: TNotifyEvent;
begin
  btnXLSResetItem.Caption := {$IFDEF WIN32}QExportLoadStr(QED_XLS_Reset_Item){$ENDIF}
                             {$IFDEF LINUX}QED_XLS_Reset_Item{$ENDIF};

  cbxXLSFont.ItemIndex := cbxXLSFont.Items.IndexOf(Fmt.Font.Name);
  cbxXLSFontSize.Text := IntToStr(Fmt.Font.Size);

  pbFontColor.Repaint;
  btnFontBold.Down := xfsBold in Fmt.Font.Style;
  btnFontItalic.Down := xfsItalic in Fmt.Font.Style;
  btnFontStrikeOut.Down := xfsStrikeOut in Fmt.Font.Style;

  btnUnderlineSingle.Down := Fmt.Font.Underline = fulSingle;
  btnUnderlineSingleAccounting.Down := Fmt.Font.Underline = fulSingleAccounting;
  btnUnderlineDouble.Down := Fmt.Font.Underline = fulDouble;
  btnUnderlineDoubleAccounting.Down := Fmt.Font.Underline = fulDoubleAccounting;

  btnHorizontalLeft.Down := Fmt.Alignment.Horizontal = halLeft;
  btnHorizontalCenter.Down := Fmt.Alignment.Horizontal = halCenter;
  btnHorizontalRight.Down := Fmt.Alignment.Horizontal = halRight;
  btnHorizontalFill.Down := Fmt.Alignment.Horizontal = halFill;

  btnVerticalTop.Down := Fmt.Alignment.Vertical = valTop;
  btnVerticalCenter.Down := Fmt.Alignment.Vertical = valCenter;
  btnVerticalBottom.Down := Fmt.Alignment.Vertical = valBottom;

  btnBorderTop.Down := Fmt.Borders.Top.Style <> bstNone;
  cmbBorderTop.ItemIndex := Integer(Fmt.Borders.Top.Style);
  btnBorderBottom.Down := Fmt.Borders.Bottom.Style <> bstNone;
  cmbBorderBottom.ItemIndex := Integer(Fmt.Borders.Bottom.Style);

  btnBorderLeft.Down := Fmt.Borders.Left.Style <> bstNone;
  cmbBorderLeft.ItemIndex := Integer(Fmt.Borders.Left.Style);
  btnBorderRight.Down := Fmt.Borders.Right.Style <> bstNone;
  cmbBorderRight.ItemIndex := Integer(Fmt.Borders.Right.Style);

  pbBorderTop.Repaint;
  pbBorderBottom.Repaint;
  pbBorderLeft.Repaint;
  pbBorderRight.Repaint;

  cmbPattern.ItemIndex := Integer(Fmt.Fill.Pattern);
  pbFillBackground.Repaint;
  pbFillForeground.Repaint;
  cmbPattern.Repaint;

  if rgXLSFunction.Enabled
    then begin
      Event := rgXLSFunction.OnClick;
      rgXLSFunction.OnClick := nil;
      rgXLSFunction.ItemIndex := Integer(TxlsFieldFormat(Fmt).Aggregate);
      rgXLSFunction.OnClick := Event;
    end
    else rgXLSFunction.ItemIndex := -1;
  pbXLSCell.Repaint;
end;

procedure TQExport3DialogF.ShowXLSListItemM;
var
  i: integer;
  IsFont, IsFontSize,
  IsTop, IsBottom, IsLeft, IsRight,
  IsPattern, IsAggregate, IsFunction: boolean;
begin
  if CurrXLSListView = nil then Exit;
  btnXLSResetItem.Caption := {$IFDEF WIN32}QExportLoadStr(QED_XLS_Reset_SelectedItems){$ENDIF}
                             {$IFDEF LINUX}QED_XLS_Reset_SelectedItems{$ENDIF};

  IsFont := true;
  IsFontSize := true;
  IsTop := true;
  IsBottom := true;
  IsLeft := true;
  IsRight := true;
  IsPattern := true;
  IsAggregate := true;
  IsFunction := true;
  for i := 0 to CurrXLSListView.Items.Count - 1 do
    if CurrXLSListView.Items[i].Selected and
      (CurrXLSListView.Items[i] <> FXLSListItem) then begin

      if IsFont then
        IsFont := IsFont and
          (AnsiCompareText(TxlsFormat(FXLSListItem.Data).Font.Name,
            TxlsFormat(CurrXLSListView.Items[i].Data).Font.Name) = 0);

      if IsFontSize then
        IsFontSize := IsFontSize and
          (TxlsFormat(FXLSListItem.Data).Font.Size =
            TxlsFormat(CurrXLSListView.Items[i].Data).Font.Size);

      if IsTop then
        IsTop := IsTop and
          (TxlsFormat(FXLSListItem.Data).Borders.Top.Style =
            TxlsFormat(CurrXLSListView.Items[i].Data).Borders.Top.Style);

      if IsBottom then
        IsBottom := IsBottom and
          (TxlsFormat(FXLSListItem.Data).Borders.Bottom.Style =
            TxlsFormat(CurrXLSListView.Items[i].Data).Borders.Bottom.Style);

      if IsLeft then
        IsLeft := IsLeft and
          (TxlsFormat(FXLSListItem.Data).Borders.Left.Style =
            TxlsFormat(CurrXLSListView.Items[i].Data).Borders.Left.Style);

      if IsRight then
        IsRight := IsRight and
          (TxlsFormat(FXLSListItem.Data).Borders.Right.Style =
            TxlsFormat(CurrXLSListView.Items[i].Data).Borders.Right.Style);

      if IsPattern then
        IsPattern := IsPattern and
          (TxlsFormat(FXLSListItem.Data).Fill.Pattern =
            TxlsFormat(CurrXLSListView.Items[i].Data).Fill.Pattern);

      if IsAggregate then
        IsAggregate := IsAggregate and not (i in [0..3]);

      IsFunction := IsFunction and IsAggregate;
      if IsFunction then
        IsFunction := IsFunction and
          (TxlsFieldFormat(FXLSListItem.Data).Aggregate =
            TxlsFieldFormat(CurrXLSListView.Items[i].Data).Aggregate);

    end;

  if IsFont
    then cbxXLSFont.ItemIndex := cbxXLSFont.Items.IndexOf(TxlsFormat(FXLSListItem.Data).Font.Name)
    else cbxXLSFont.ItemIndex := -1;

  if IsFontSize
    then cbxXLSFontSize.Text := IntToStr(TxlsFormat(FXLSListItem.Data).Font.Size)
    else cbxXLSFontSize.Text := EmptyStr;

  pbFontColor.Repaint;

  btnFontBold.Down := xfsBold in TxlsFormat(FXLSListItem.Data).Font.Style;
  btnFontItalic.Down := xfsItalic in TxlsFormat(FXLSListItem.Data).Font.Style;
  btnFontStrikeOut.Down := xfsStrikeOut in TxlsFormat(FXLSListItem.Data).Font.Style;

  btnUnderlineSingle.Down :=
    TxlsFormat(FXLSListItem.Data).Font.Underline = fulSingle;
  btnUnderlineSingleAccounting.Down :=
    TxlsFormat(FXLSListItem.Data).Font.Underline = fulSingleAccounting;
  btnUnderlineDouble.Down :=
    TxlsFormat(FXLSListItem.Data).Font.Underline = fulDouble;
  btnUnderlineDoubleAccounting.Down :=
    TxlsFormat(FXLSListItem.Data).Font.Underline = fulDoubleAccounting;

  btnHorizontalLeft.Down :=
    TxlsFormat(FXLSListItem.Data).Alignment.Horizontal = halLeft;
  btnHorizontalCenter.Down :=
    TxlsFormat(FXLSListItem.Data).Alignment.Horizontal = halCenter;
  btnHorizontalRight.Down :=
    TxlsFormat(FXLSListItem.Data).Alignment.Horizontal = halRight;
  btnHorizontalFill.Down :=
    TxlsFormat(FXLSListItem.Data).Alignment.Horizontal = halFill;

  btnVerticalTop.Down :=
    TxlsFormat(FXLSListItem.Data).Alignment.Vertical = valTop;
  btnVerticalCenter.Down :=
    TxlsFormat(FXLSListItem.Data).Alignment.Vertical = valCenter;
  btnVerticalBottom.Down :=
    TxlsFormat(FXLSListItem.Data).Alignment.Vertical = valBottom;

  if IsTop
    then cmbBorderTop.ItemIndex :=
      Integer(TxlsFormat(FXLSListItem.Data).Borders.Top.Style)
    else cmbBorderTop.ItemIndex := -1;

  if IsBottom
    then cmbBorderBottom.ItemIndex :=
      Integer(TxlsFormat(FXLSListItem.Data).Borders.Bottom.Style)
    else cmbBorderBottom.ItemIndex := -1;

  if IsLeft
    then cmbBorderLeft.ItemIndex :=
      Integer(TxlsFormat(FXLSListItem.Data).Borders.Left.Style)
    else cmbBorderLeft.ItemIndex := -1;

  if IsRight
    then cmbBorderRight.ItemIndex :=
      Integer(TxlsFormat(FXLSListItem.Data).Borders.Right.Style)
    else cmbBorderRight.ItemIndex := -1;

  pbBorderTop.Repaint;
  pbBorderBottom.Repaint;
  pbBorderLeft.Repaint;
  pbBorderRight.Repaint;

  if IsPattern
    then cmbPattern.ItemIndex :=
      Integer(TxlsFormat(FXLSListItem.Data).Fill.Pattern)
    else cmbPattern.ItemIndex := -1;

  pbFillBackground.Repaint;
  pbFillForeground.Repaint;

  rgXLSFunction.Enabled := IsAggregate;
  if IsFunction
    then rgXLSFunction.ItemIndex :=
      Integer(TxlsFieldFormat(FXLSListItem.Data).Aggregate)
    else rgXLSFunction.ItemIndex := -1;

  pbXLSCell.Repaint;
end;

procedure TQExport3DialogF.XLSUpdateItemFont(Item: TListItem);
begin
  if Item <> FXLSListItem
    then TxlsFormat(Item.Data).Font.Name :=
      TxlsFormat(FXLSListItem.Data).Font.Name;
end;

procedure TQExport3DialogF.XLSUpdateItemFontSize(Item: TListItem);
begin
  if Item <> FXLSListItem
    then TxlsFormat(Item.Data).Font.Size :=
      TxlsFormat(FXLSListItem.Data).Font.Size;
end;

procedure TQExport3DialogF.XLSUpdateItemFontColor(Item: TListItem);
begin
  if Item <> FXLSListItem
    then TxlsFormat(Item.Data).Font.Color :=
      TxlsFormat(FXLSListItem.Data).Font.Color;
end;

procedure TQExport3DialogF.XLSUpdateItemFontBold(Item: TListItem);
var
  Fnt1, Fnt2: TxlsFont;
begin
  if Item <> FXLSListItem then begin
    Fnt1 := TxlsFormat(Item.Data).Font;
    Fnt2 := TxlsFormat(FXLSListItem.Data).Font;
    EditFontStyleXLS(Fnt1, xfsBold, xfsBold in Fnt2.Style);
  end;
end;

procedure TQExport3DialogF.XLSUpdateItemFontItalic(Item: TListItem);
var
  Fnt1, Fnt2: TxlsFont;
begin
  if Item <> FXLSListItem then begin
    Fnt1 := TxlsFormat(Item.Data).Font;
    Fnt2 := TxlsFormat(FXLSListItem.Data).Font;
    EditFontStyleXLS(Fnt1, xfsItalic, xfsItalic in Fnt2.Style);
  end;
end;

procedure TQExport3DialogF.XLSUpdateItemFontStrikeOut(Item: TListItem);
var
  Fnt1, Fnt2: TxlsFont;
begin
  if Item <> FXLSListItem then begin
    Fnt1 := TxlsFormat(Item.Data).Font;
    Fnt2 := TxlsFormat(FXLSListItem.Data).Font;
    EditFontStyleXLS(Fnt1, xfsStrikeOut, xfsStrikeOut in Fnt2.Style);
  end;
end;

procedure TQExport3DialogF.XLSUpdateItemFontUnderline(Item: TListItem);
begin
  if Item <> FXLSListItem then
    TxlsFormat(Item.Data).Font.Underline :=
      TxlsFormat(FXLSListItem.Data).Font.Underline;
end;

procedure TQExport3DialogF.XLSUpdateItemHorAlignment(Item: TListItem);
begin
  if Item <> FXLSListItem then
    TxlsFormat(Item.Data).Alignment.Horizontal :=
      TxlsFormat(FXLSListItem.Data).Alignment.Horizontal;
end;

procedure TQExport3DialogF.XLSUpdateItemVertAlignment(Item: TListItem);
begin
  if Item <> FXLSListItem then
    TxlsFormat(Item.Data).Alignment.Vertical :=
      TxlsFormat(FXLSListItem.Data).Alignment.Vertical;
end;

procedure TQExport3DialogF.XLSUpdateItemBorderTop(Item: TListItem);
begin
  if Item <> FXLSListItem then
    TxlsFormat(Item.Data).Borders.Top.Style :=
      TxlsFormat(FXLSListItem.Data).Borders.Top.Style;
end;

procedure TQExport3DialogF.XLSUpdateItemBorderTopColor(Item: TListItem);
begin
  if Item <> FXLSListItem then
    TxlsFormat(Item.Data).Borders.Top.Color :=
      TxlsFormat(FXLSListItem.Data).Borders.Top.Color;
end;

procedure TQExport3DialogF.XLSUpdateItemBorderBottom(Item: TListItem);
begin
  if Item <> FXLSListItem then
    TxlsFormat(Item.Data).Borders.Bottom.Style :=
      TxlsFormat(FXLSListItem.Data).Borders.Bottom.Style;
end;

procedure TQExport3DialogF.XLSUpdateItemBorderBottomColor(Item: TListItem);
begin
  if Item <> FXLSListItem then
    TxlsFormat(Item.Data).Borders.Bottom.Color :=
      TxlsFormat(FXLSListItem.Data).Borders.Bottom.Color;
end;

procedure TQExport3DialogF.XLSUpdateItemBorderLeft(Item: TListItem);
begin
  if Item <> FXLSListItem then
    TxlsFormat(Item.Data).Borders.Left.Style :=
      TxlsFormat(FXLSListItem.Data).Borders.Left.Style;
end;

procedure TQExport3DialogF.XLSUpdateItemBorderLeftColor(Item: TListItem);
begin
  if Item <> FXLSListItem then
    TxlsFormat(Item.Data).Borders.Left.Color :=
      TxlsFormat(FXLSListItem.Data).Borders.Left.Color;
end;

procedure TQExport3DialogF.XLSUpdateItemBorderRight(Item: TListItem);
begin
  if Item <> FXLSListItem then
    TxlsFormat(Item.Data).Borders.Right.Style :=
      TxlsFormat(FXLSListItem.Data).Borders.Right.Style;
end;

procedure TQExport3DialogF.XLSUpdateItemBorderRightColor(Item: TListItem);
begin
  if Item <> FXLSListItem then
    TxlsFormat(Item.Data).Borders.Right.Color :=
      TxlsFormat(FXLSListItem.Data).Borders.Right.Color;
end;

procedure TQExport3DialogF.XLSUpdateItemFillPattern(Item: TListItem);
begin
  if Item <> FXLSListItem then
    TxlsFormat(Item.Data).Fill.Pattern :=
      TxlsFormat(FXLSListItem.Data).Fill.Pattern;
end;

procedure TQExport3DialogF.XLSUpdateItemFillBackground(Item: TListItem);
begin
  if Item <> FXLSListItem then
    TxlsFormat(Item.Data).Fill.Background :=
      TxlsFormat(FXLSListItem.Data).Fill.Background;
end;

procedure TQExport3DialogF.XLSUpdateItemFillForeground(Item: TListItem);
begin
  if Item <> FXLSListItem then
    TxlsFormat(Item.Data).Fill.Foreground :=
      TxlsFormat(FXLSListItem.Data).Fill.Foreground;
end;

procedure TQExport3DialogF.XLSUpdateItemAggregate(Item: TListItem);
begin
  if Item <> FXLSListItem then
    TxlsFieldFormat(Item.Data).Aggregate :=
      TxlsFieldFormat(FXLSListItem.Data).Aggregate;
end;

procedure TQExport3DialogF.XLSUpdateItemSetDefault(Item: TListItem);
begin
  if Item <> FXLSListItem then begin
    if AnsiCompareText(Item.Caption, {$IFDEF WIN32}QExportLoadStr(QED_XLS_Caption){$ENDIF}
                                     {$IFDEF LINUX}QED_XLS_Caption{$ENDIF}) = 0
      then SetDefaultXLSCaption(TxlsFormat(Item.Data))
      else TxlsFieldFormat(Item.Data).SetDefault;
  end;
end;

procedure TQExport3DialogF.XLSResetAllItems;
var
  Index, i: integer;
begin
  if Assigned(FXLSListItem)
    then Index := FXLSListItem.Index
    else Index := 0;
  CurrXLSListView.Items.BeginUpdate;
  try
    if Assigned(FXLSListItem) then begin
      TxlsFieldFormat(FXLSListItem.Data).SetDefault;
      if AnsiCompareText(TxlsFieldFormat(FXLSListItem.Data).FieldName,
        {$IFDEF WIN32}QExportLoadStr(QED_XLS_Caption){$ENDIF}
        {$IFDEF LINUX}QED_XLS_Caption{$ENDIF}) = 0 then
        EditFontStyleXLS(TxlsFieldFormat(FXLSListItem.Data).Font, xfsBold, true);
    end;
    for i := 0 to CurrXLSListView.Items.Count - 1 do
      XLSUpdateItemSetDefault(CurrXLSListView.Items[i]);
    CurrXLSListView.Items[Index].Selected := true;
  finally
    CurrXLSListView.Items.EndUpdate;
    CurrXLSListView.OnChange(CurrXLSListView, FXLSListItem, ctState);
  end;
end;

procedure TQExport3DialogF.XLSResetAllItems_A;
var
  i, j: integer;
  LV: TListView;
begin
  for i := 1 to 3 do begin
    case i of
      1: LV := lstXLSFields;
      2: LV := lstXLSOptions;
      3: LV := lstXLSStyles;
      else LV := nil;
    end;
    if not Assigned(LV) then Exit;

    LV.Items.BeginUpdate;
    try
      for j := 0 to LV.Items.Count - 1 do begin
        XLSUpdateItemSetDefault(LV.Items[j]);
        if AnsiCompareText(LV.Items[j].Caption, {$IFDEF WIN32}QExportLoadStr(QED_XLS_Caption){$ENDIF}
                                                {$IFDEF LINUX}QED_XLS_Caption{$ENDIF}) = 0 then
          EditFontStyleXLS(TxlsFieldFormat(LV.Items[j].Data).Font, xfsBold, true);
        if AnsiCompareText(TxlsFieldFormat(FXLSListItem.Data).FieldName,
           {$IFDEF WIN32}QExportLoadStr(QED_XLS_Caption){$ENDIF}
           {$IFDEF LINUX}QED_XLS_Caption{$ENDIF}) = 0 then
          EditFontStyleXLS(TxlsFieldFormat(FXLSListItem.Data).Font, xfsBold, true);
      end;
    finally
      LV.Items.EndUpdate;
    end;
  end;
  if Assigned(FXLSListItem) then TxlsFieldFormat(FXLSListItem.Data).SetDefault;
end;

procedure TQExport3DialogF.XLSShowStyleButtons;
begin
  tbtDelXLSStyle.Enabled := lstXLSStyles.SelCount > 0;
  tbtUpXLSStyle.Enabled := Assigned(lstXLSStyles.ItemFocused) and
    (lstXLSStyles.Items.Count > 1) and (lstXLSStyles.ItemFocused.Index > 0);
  tbtDownXLSStyle.Enabled := Assigned(lstXLSStyles.ItemFocused) and
    (lstXLSStyles.Items.Count > 1) and
    (lstXLSStyles.ItemFocused.Index < lstXLSStyles.Items.Count - 1);
  tbtSaveXLSStyle.Enabled := lstXLSStyles.Items.Count > 0;
end;

procedure TQExport3DialogF.XLSRenumStyles;
var
  i: integer;
  LI: TListItem;
begin
  lstXLSStyles.Items.BeginUpdate;
  try
    LI := lstXLSStyles.Selected;
    for i := 0 to lstXLSStyles.Items.Count - 1 do
      lstXLSStyles.Items[i].Caption := {$IFDEF WIN32}QExportLoadStr(QED_XLS_StyleItem){$ENDIF}
                                       {$IFDEF LINUX}QED_XLS_StyleItem{$ENDIF} + IntToStr(i + 1);
    if Assigned(LI) then begin
      LI.Focused := true;
      LI.Selected := true;
    end;
  finally
    lstXLSStyles.Items.EndUpdate;
  end;
end;

procedure TQExport3DialogF.XLSSaveStyle(const FileName: string);
var
  IniFile: TIniFile;
  i: integer;
begin
  IniFile := TIniFile.Create(FileName);
  try
    ClearIniFile(IniFile);
    for i := 0 to lstXLSStyles.Items.Count - 1 do
      TxlsFormat(lstXLSStyles.Items[i].Data).SaveToIniFile(IniFile,
        S_XLS_STYLE + IntToStr(i));
  finally
    IniFile.Free;
  end;
end;

procedure TQExport3DialogF.XLSLoadStyle(const FileName: string);
var
  IniFile: TIniFile;
  AStrings: TStrings;
  i: integer;
begin
  lstXLSStyles.Items.BeginUpdate;
  try
    lstXLSStyles.Items.Clear;
    IniFile :=TIniFile.Create(FileName);
    try
      AStrings := TStringList.Create;
      try
        IniFile.ReadSections(AStrings);
        for i := 0 to AStrings.Count - 1 do
          if AnsiCompareText(S_XLS_STYLE, Copy(AStrings[i], 1,
            Length(S_XLS_STYLE))) = 0 then
            with lstXLSStyles.Items.Add do begin
              Caption := {$IFDEF WIN32}QExportLoadStr(QED_XLS_StyleItem){$ENDIF}
                         {$IFDEF LINUX}QED_XLS_StyleItem{$ENDIF} + Copy(AStrings[i],
                Length(S_XLS_STYLE) + 1, Length(AStrings[i]));
              Data := TxlsFormat.Create(nil);
              TxlsFormat(Data).LoadFromIniFile(IniFile, AStrings[i]);
              ImageIndex := 2;
            end;
        if lstXLSStyles.Items.Count > 0 then begin
          ActiveControl := lstXLSStyles;
          lstXLSStyles.Items[0].Focused := true;
          lstXLSStyles.Items[0].Selected := true;
        end;
      finally
        AStrings.Free;
      end;
    finally
      IniFile.Free;
    end;
  finally
    lstXLSStyles.Items.EndUpdate;
  end;
end;

procedure TQExport3DialogF.edIntegerFormatChange(Sender: TObject);
begin
  IntegerFmt := edIntegerFormat.Text;
end;

procedure TQExport3DialogF.edFloatFormatChange(Sender: TObject);
begin
  FloatFmt := edFloatFormat.Text;
end;

procedure TQExport3DialogF.edDateFormatChange(Sender: TObject);
begin
  DateFmt := edDateFormat.Text;
end;

procedure TQExport3DialogF.edTimeFormatChange(Sender: TObject);
begin
  TimeFmt := edTimeFormat.Text;
end;

procedure TQExport3DialogF.edDateTimeFormatChange(Sender: TObject);
begin
  DateTimeFmt := edDateTimeFormat.Text;
end;

procedure TQExport3DialogF.edCurrencyFormatChange(Sender: TObject);
begin
  CurrencyFmt := edCurrencyFormat.Text;
end;

procedure TQExport3DialogF.edXLSPageHeaderChange(Sender: TObject);
begin
  XLSPageHeader := edXLSPageHeader.Text;
end;

procedure TQExport3DialogF.edXLSPageFooterChange(Sender: TObject);
begin
  XLSPageFooter := edXLSPageFooter.Text;
end;

procedure TQExport3DialogF.edXLSSheetTitleChange(Sender: TObject);
begin
  XLSSheetTitle := edXLSSheetTitle.Text;
end;

procedure TQExport3DialogF.chXLSAutoCalcColWidthClick(Sender: TObject);
begin
  XLSAutoCalcColWidth := chXLSAutoCalcColWidth.Checked;
end;

procedure TQExport3DialogF.edHTMLTitleChange(Sender: TObject);
begin
  HTMLTitle := edHTMLTitle.Text;
end;

procedure TQExport3DialogF.edHTMLCSSFileNameChange(Sender: TObject);
begin
  HTMLCSSFileName := edHTMLCSSFileName.Text;
end;

procedure TQExport3DialogF.btnHTMLCSSFileNameClick(Sender: TObject);
begin
  if odHTMLCSS.Execute then HTMLCSSFileName := odHTMLCSS.FileName;
end;

procedure TQExport3DialogF.chHTMLOverwriteCSSFileClick(Sender: TObject);
begin
  HTMLOverwriteCSSFile := chHTMLOverwriteCSSFile.Checked;
end;

procedure TQExport3DialogF.edHTMLFileRecCountChange(Sender: TObject);
begin
  HTMLFileRecCount := StrToIntDef(edHTMLFileRecCount.Text, 0);
end;

procedure TQExport3DialogF.chHTMLGenerateIndexClick(Sender: TObject);
begin
  HTMLGenerateIndex := chHTMLGenerateIndex.Checked;
  HTMLUpdateMultiFileControls;
end;

procedure TQExport3DialogF.cbxHTMLFontNameChange(Sender: TObject);
begin
  HTMLFontName := cbxHTMLFontName.Text;
end;

procedure TQExport3DialogF.edHTMLBackgroundChange(Sender: TObject);
begin
  HTMLBackground := edHTMLBackground.Text;
end;

procedure TQExport3DialogF.btnHTMLBackgroundClick(Sender: TObject);
begin
  if HTMLBackground <> EmptyStr then
    opdHTMLBackground.InitialDir := ExtractFileDir(HTMLBackground);
  if opdHTMLBackground.Execute then
    HTMLBackground := opdHTMLBackground.FileName;
end;

procedure TQExport3DialogF.edHTMLBodyAdvancedChange(Sender: TObject);
begin
  HTMLBodyAdvanced := edHTMLBodyAdvanced.Text;
end;

procedure TQExport3DialogF.edHTMLCellPaddingChange(Sender: TObject);
begin
  HTMLCellPadding := StrToIntDef(edHTMLCellPadding.Text, 0);
end;

procedure TQExport3DialogF.edHTMLCellSpacingChange(Sender: TObject);
begin
  HTMLCellSpacing := StrToIntDef(edHTMLCellSpacing.Text, 0);
end;

procedure TQExport3DialogF.edHTMLBorderWidthChange(Sender: TObject);
begin
  HTMLBorderWidth := StrToIntDef(edHTMLBorderWidth.Text, 0);
end;

procedure TQExport3DialogF.edHTMLTableBackgroundChange(Sender: TObject);
begin
  HTMLTableBackground := edHTMLTableBackground.Text;
end;

procedure TQExport3DialogF.btnHTMLTableBackgroundClick(Sender: TObject);
begin
  if HTMLTableBackground <> EmptyStr then
    opdHTMLBackground.InitialDir := ExtractFileDir(HTMLTableBackground);
  if opdHTMLBackground.Execute then
    HTMLTableBackground := opdHTMLBackground.FileName;
end;

procedure TQExport3DialogF.edHTMLTableAdvancedChange(Sender: TObject);
begin
  HTMLTableAdvanced := edHTMLTableAdvanced.Text;
end;

procedure TQExport3DialogF.paHTMLBackgroundClick(Sender: TObject);
var
  FColor:TColor;
begin
  ColorDialog.Color := HTMLBackgroundColor;
  if ColorDialog.Execute then begin
    FColor := ColorDialog.Color;
    HTMLBackgroundColor := FColor;
    SetCustomTemplate;
  end;
end;

procedure TQExport3DialogF.laHTMLFontClick(Sender: TObject);
begin
  ColorDialog.Color := HTMLFontColor;
  if ColorDialog.Execute then begin
    HTMLFontColor := ColorDialog.Color;
    SetCustomTemplate;
  end;
end;

procedure TQExport3DialogF.paHTMLColumnHead_1Click(Sender: TObject);
begin
  ColorDialog.Color := HTMLHeadBackgroundColor;
  if ColorDialog.Execute then begin
    HTMLHeadBackgroundColor := ColorDialog.Color;
    SetCustomTemplate;
  end;
end;

procedure TQExport3DialogF.laHTMLHead_1Click(Sender: TObject);
begin
  ColorDialog.Color := HTMLHeadFontColor;
  if ColorDialog.Execute then begin
    HTMLHeadFontColor := ColorDialog.Color;
    SetCustomTemplate;
  end;
end;

procedure TQExport3DialogF.paHTMLOddRowCol_1Click(Sender: TObject);
begin
  ColorDialog.Color := HTMLOddRowBackgroundColor;
  if ColorDialog.Execute then begin
    HTMLOddRowBackgroundColor := ColorDialog.Color;
    SetCustomTemplate;
  end;
end;

procedure TQExport3DialogF.paHTMLEvenRowCol_1Click(Sender: TObject);
begin
  ColorDialog.Color := HTMLEvenRowBackgroundColor;
  if ColorDialog.Execute then begin
    HTMLEvenRowBackgroundColor := ColorDialog.Color;
    SetCustomTemplate;
  end;
end;

procedure TQExport3DialogF.laHTMLData_1Click(Sender: TObject);
begin
  ColorDialog.Color := HTMLDataFontColor;
  if ColorDialog.Execute then begin
    HTMLDataFontColor := ColorDialog.Color;
    SetCustomTemplate;
  end;
end;

procedure TQExport3DialogF.laHTMLLinkClick(Sender: TObject);
begin
  ColorDialog.Color := HTMLLinkColor;
  if ColorDialog.Execute then begin
    HTMLLinkColor := ColorDialog.Color;
    SetCustomTemplate;
  end;
end;

procedure TQExport3DialogF.laHTMLVLinkClick(Sender: TObject);
begin
  ColorDialog.Color := HTMLVLinkColor;
  if ColorDialog.Execute then begin
    HTMLVLinkColor := ColorDialog.Color;
    SetCustomTemplate;
  end;
end;

procedure TQExport3DialogF.laHTMLALinkClick(Sender: TObject);
begin
  ColorDialog.Color := HTMLALinkColor;
  if ColorDialog.Execute then begin
    HTMLALinkColor := ColorDialog.Color;
    SetCustomTemplate;
  end;
end;

procedure TQExport3DialogF.chXMLStandaloneClick(Sender: TObject);
begin
  XMLStandalone := chXMLStandalone.Checked;
end;

procedure TQExport3DialogF.edXMLEncodingChange(Sender: TObject);
begin
  XMLEncoding := edXMLEncoding.Text;
end;

procedure TQExport3DialogF.edSQLTableNameChange(Sender: TObject);
begin
  SQLTableName := edSQLTableName.Text;
end;

procedure TQExport3DialogF.chSQLCreateTableClick(Sender: TObject);
begin
  SQLCreateTable := chSQLCreateTable.Checked;
end;

procedure TQExport3DialogF.edSQLCommitRecCountChange(Sender: TObject);
begin
  try
    SQLCommitRecCount := StrToInt(edSQLCommitRecCount.Text);
  except end;
end;

procedure TQExport3DialogF.chSQLCommitAfterScriptClick(Sender: TObject);
begin
  SQLCommitAfterScript := chSQLCommitAfterScript.Checked;
end;

procedure TQExport3DialogF.edSQLCommitStatementChange(Sender: TObject);
begin
  SQLCommitStatement := edSQLCommitStatement.Text;
end;

procedure TQExport3DialogF.edSQLNullStringChange(Sender: TObject);
begin
  NullString := edSQLNullString.Text;
end;

procedure TQExport3DialogF.edSQLStatementTermChange(Sender: TObject);
begin
  SQLStatementTerm := edSQLStatementTerm.Text;
end;

procedure TQExport3DialogF.edBooleanTrueChange(Sender: TObject);
begin
  BooleanTrue := edBooleanTrue.Text;
end;

procedure TQExport3DialogF.edBooleanFalseChange(Sender: TObject);
begin
  BooleanFalse := edBooleanFalse.Text;
end;

procedure TQExport3DialogF.edNullStringChange(Sender: TObject);
begin
  NullString := edNullString.Text;
end;

function TQExport3DialogF.GetIndexOfNewAvailableFields(Item: TListItem): integer;
var
  i: integer;
begin
  Result := 0;
  for i := 0 to lstAvailableFields.Items.Count - 1 do begin
    if Integer(lstAvailableFields.Items[i].Data) > Integer(Item.Data)
      then Exit
      else Result := i + 1;
  end
end;

procedure TQExport3DialogF.sgrCaptionsGetEditText(Sender: TObject; ACol,
  ARow: Integer; var Value: String);
var
  Rect: TRect;
begin
  if (ExportType in [aeTXT, aeRTF, aeWord, aeHTML, aePDF]) and (ACol = 2) then begin
    Rect := sgrCaptions.CellRect(ACol, ARow);
    cbxColumnAlign.Left:= Rect.Left + 1;
    cbxColumnAlign.Top := Rect.Top + 26;
    cbxColumnAlign.Width := Rect.Right - Rect.Left + 2;
    cbxColumnAlign.ItemIndex := cbxColumnAlign.Items.IndexOf(sgrCaptions.Cells[ACol, ARow]);
    cbxColumnAlign.Visible := true;
    cbxColumnAlign.SetFocus;
  end;
  if ((ExportType in [aeTXT, aeRTF, aeWord, aePDF]) and (ACol = 3)) or
     ((ExportType = aeXLS) and (ACol = 2)) then begin
    Rect := sgrCaptions.CellRect(ACol, ARow);

    edColumnWidth.Left:= Rect.Left + 1;
    edColumnWidth.Top := Rect.Top + 26;
    edColumnWidth.Width := Rect.Right - Rect.Left - udColumnWidth.Width + 2;
    edColumnWidth.Text := sgrCaptions.Cells[ACol, ARow];

    udColumnWidth.Left:= edColumnWidth.Left + edColumnWidth.Width;
    udColumnWidth.Top := edColumnWidth.Top;
    udColumnWidth.Height := 20;
    udColumnWidth.Position := StrToInt(sgrCaptions.Cells[ACol, ARow]);

    edColumnWidth.Visible := true;
    udColumnWidth.Visible := true;
    edColumnWidth.SetFocus;
  end;
end;

procedure TQExport3DialogF.cbxColumnAlignExit(Sender: TObject);
begin
  sgrCaptions.Cells[sgrCaptions.Col, sgrCaptions.Row] := cbxColumnAlign.Text;
  cbxColumnAlign.Visible := false;
end;

procedure TQExport3DialogF.edColumnWidthExit(Sender: TObject);
begin
  sgrCaptions.Cells[sgrCaptions.Col, sgrCaptions.Row] := edColumnWidth.Text;
  edColumnWidth.Visible := false;
  udColumnWidth.Visible := false;
end;

procedure TQExport3DialogF.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
  if AutoSaveOptions and (OptionsFileName <> EmptyStr)
    then SaveExportOptions(OptionsFileName);
end;

procedure TQExport3DialogF.rbInternalClick(Sender: TObject);
begin
  if rbInternal.Checked
    then HTMLUsingCSS := usInternal;
end;

procedure TQExport3DialogF.rbExternalClick(Sender: TObject);
begin
  if rbExternal.Checked
    then HTMLUsingCSS := usExternal;
end;

procedure TQExport3DialogF.chHTMLUseMultiFileExportClick(Sender: TObject);
begin
  HTMLUseMultiFileExport := chHTMLUseMultiFileExport.Checked;
  HTMLUpdateMultiFileControls;
end;

procedure TQExport3DialogF.rbExportOnlyClick(Sender: TObject);
begin
  edExportRecCount.Enabled := true;
  laExportRecCount_02.Enabled := true;
end;

procedure TQExport3DialogF.rbExportAllRecordsClick(Sender: TObject);
begin
  edExportRecCount.Enabled := false;
  laExportRecCount_02.Enabled := false;
  ExportRecCount := 0;
end;

procedure TQExport3DialogF.chTXTAutoCalcColWidthClick(Sender: TObject);
begin
  TXTAutoCalcColWidth := chTXTAutoCalcColWidth.Checked;
end;

procedure TQExport3DialogF.edTXTSpacingChange(Sender: TObject);
begin
  try TXTSpacing := StrToInt(edTXTSpacing.Text); except end;
end;

procedure TQExport3DialogF.NumberKeyPress(Sender: TObject;
  var Key: Char);
begin
  if not (Key in ['1', '2', '3', '4', '5', '6', '7', '8', '9', '0', #8])
    then Key := #0;
end;

procedure TQExport3DialogF.chCSVQuoteStringsClick(Sender: TObject);
begin
  CSVQuoteStrings :=  chCSVQuoteStrings.Checked;
end;

procedure TQExport3DialogF.edCSVCommaExit(Sender: TObject);
begin
  CSVComma := Str2Char(edCSVComma.Text);
end;

procedure TQExport3DialogF.edCSVQuoteExit(Sender: TObject);
begin
  CSVQuote := Str2Char(edCSVQuote.Text);
end;

procedure TQExport3DialogF.rgRTFPageOrientationClick(Sender: TObject);
begin
  RTFPageOrientation := TQExportPageOrientation(rgRTFPageOrientation.ItemIndex);
end;

procedure TQExport3DialogF.lstXLSFieldsDeletion(Sender: TObject;
  Item: TListItem);
begin
  TxlsFormat(Item.Data).Free;
  Item.Data := nil;
end;

procedure TQExport3DialogF.lstXLSFieldsChange(Sender: TObject;
  Item: TListItem; Change: TItemChange);
var
  i: integer;
  LV: TListView;
begin
  if (Change <> ctState) then Exit;
  if not Assigned(Item.Data) then Exit;
  if not (Sender is TListView) then Exit;

  LV := Sender as TListView;

  case LV.SelCount of
    0: FXLSListItem := nil;
    else{1:} FXLSListItem := Item;
  end;
  if not Assigned(FXLSListItem) and
    (LV.SelCount > 0) then
    for i := 0 to LV.Items.Count - 1 do
      if LV.Items[i].Selected then begin
        FXLSListItem := LV.Items[i];
        Break;
      end;

  if LV.SelCount = 1
    then ShowXLSListItem(TxlsFormat(Item.Data))
    else if LV.SelCount > 1
         then ShowXLSListItemM;

  XLSShowStyleButtons;
end;

procedure TQExport3DialogF.pcXLSFormatsChange(Sender: TObject);
begin
  tshXLSAggregate.TabVisible := pcXLSFormats.ActivePage = tshXLSFields;
  if CurrXLSListView = nil then Exit;
  if Assigned(CurrXLSListView.ItemFocused) then
    CurrXLSListView.OnChange(CurrXLSListView, CurrXLSListView.ItemFocused, ctState);
end;

procedure TQExport3DialogF.tbtAddXLSStyleClick(Sender: TObject);
var
  N, i: integer;
begin
  lstXLSStyles.Items.BeginUpdate;
  try
    with lstXLSStyles.Items.Add do begin
      Caption := {$IFDEF WIN32}QExportLoadStr(QED_XLS_StyleItem){$ENDIF}
                 {$IFDEF LINUX}QED_XLS_StyleItem{$ENDIF} + IntToStr(lstXLSStyles.Items.Count);
      Data := TxlsFieldFormat.Create(nil);
      ImageIndex := 2;
      N := Index;
    end;
    for i := 0 to lstXLSStyles.Items.Count - 1 do begin
      lstXLSStyles.Items[i].Focused := i = N;
      lstXLSStyles.Items[i].Selected := i = N;
    end;
    ActiveControl := lstXLSStyles;
    XLSShowStyleButtons;
  finally
    lstXLSStyles.Items.EndUpdate;
  end;
end;

procedure TQExport3DialogF.tbtDelXLSStyleClick(Sender: TObject);
var
  N, i: integer;
begin
  lstXLSStyles.Items.BeginUpdate;
  try
    if lstXLSStyles.SelCount > 0 then begin
      if Assigned(lstXLSStyles.ItemFocused)
        then N := lstXLSStyles.ItemFocused.Index
        else N := lstXLSStyles.Items.Count - 1;
      for i := lstXLSStyles.Items.Count - 1 downto 0 do
        if lstXLSStyles.Items[i].Selected then
          lstXLSStyles.Items[i].Delete;
      N := MinimumInt(N, lstXLSStyles.Items.Count - 1);
      if lstXLSStyles.Items.Count > 0 then begin
        lstXLSStyles.Items[N].Focused := true;
        lstXLSStyles.Items[N].Selected := true;
      end;
      XLSRenumStyles;
      ActiveControl := lstXLSStyles;
      XLSShowStyleButtons;
    end;
  finally
    lstXLSStyles.Items.EndUpdate;
  end;
end;

procedure TQExport3DialogF.tbtUpXLSStyleClick(Sender: TObject);
var
  F: TxlsFormat;
  Index: integer;
  IsSelected: boolean;
begin
  Index := lstXLSStyles.ItemFocused.Index;
  F := TxlsFormat(lstXLSStyles.Items[Index - 1].Data);
  IsSelected := lstXLSStyles.Items[Index - 1].Selected;
  lstXLSStyles.Items[Index - 1].Data := lstXLSStyles.Items[Index].Data;
  lstXLSStyles.Items[Index - 1].Selected := lstXLSStyles.Items[Index].Selected;
  lstXLSStyles.Items[Index].Data := F;
  lstXLSStyles.Items[Index].Selected := IsSelected;
  lstXLSStyles.Items[Index - 1].Focused := true;
end;

procedure TQExport3DialogF.tbtDownXLSStyleClick(Sender: TObject);
var
  F: TxlsFormat;
  Index: integer;
  IsSelected: boolean;
begin
  Index := lstXLSStyles.ItemFocused.Index;
  F := TxlsFormat(lstXLSStyles.Items[Index + 1].Data);
  IsSelected := lstXLSStyles.Items[Index + 1].Selected;
  lstXLSStyles.Items[Index + 1].Data := lstXLSStyles.Items[Index].Data;
  lstXLSStyles.Items[Index + 1].Selected := lstXLSStyles.Items[Index].Selected;
  lstXLSStyles.Items[Index].Data := F;
  lstXLSStyles.Items[Index].Selected := IsSelected;
  lstXLSStyles.Items[Index + 1].Focused := true;
end;

procedure TQExport3DialogF.rgXLSStripTypeClick(Sender: TObject);
begin
  XLSStripType := TxlsStripType(rgXLSStripType.ItemIndex);
end;

procedure TQExport3DialogF.tbtSaveXLSStyleClick(Sender: TObject);
begin
  if sdXLSStyle.Execute then
    XLSSaveStyle(sdXLSStyle.FileName);
end;

procedure TQExport3DialogF.tbtLoadXLSStyleClick(Sender: TObject);
begin
  if odXLSStyle.Execute then
    XLSLoadStyle(odXLSStyle.FileName);
end;

procedure TQExport3DialogF.XLSExpBeforeExportRow(Sender: TObject; Sheet: Integer;
  Row: TQExportRow; var Accept: Boolean);
begin
  if Assigned(Dialog.OnBeforeExportXLSRow) then
    Dialog.OnBeforeExportXLSRow(XLSExp, Sheet, Row, Accept);
end;

procedure TQExport3DialogF.XLSExpExportedRecord(Sender: TObject; Sheet,
  RecNo: Integer);
begin
  if Assigned(Dialog.OnExportedRecordXLS) then
    Dialog.OnExportedRecordXLS(XLSExp, Sheet, RecNo);
end;

procedure TQExport3DialogF.XLSExpAdvancedGetExportText(Sender: TObject;
  Sheet, ColNo: Integer; var Text: WideString);
begin
  if Assigned(Dialog.OnGetExportXLSText) then
    Dialog.OnGetExportXLSText(XLSExp, Sheet, ColNo, Text);
end;

procedure TQExport3DialogF.edHTMLIndexLinkTemplateChange(Sender: TObject);
begin
  HTMLIndexLinkTemplate := edHTMLIndexLinkTemplate.Text;
end;

procedure TQExport3DialogF.chHTMLNavigationOnTopClick(Sender: TObject);
begin
  HTMLNavigationOnTop := chHTMLNavigationOnTop.Checked;
  HTMLUpdateMultifileControls;
end;

procedure TQExport3DialogF.chHTMLNavigationOnBottomClick(Sender: TObject);
begin
  HTMLNavigationOnBottom := chHTMLNavigationOnBottom.Checked;
  HTMLUpdateMultifileControls;
end;

procedure TQExport3DialogF.edHTMLIndexLinkTitleChange(Sender: TObject);
begin
  HTMLIndexLinkTitle := edHTMLIndexLinkTitle.Text;
end;

procedure TQExport3DialogF.edHTMLFirstLinkTitleChange(Sender: TObject);
begin
  HTMLFirstLinkTitle := edHTMLFirstLinkTitle.Text;
end;

procedure TQExport3DialogF.edHTMLPriorLinkTitleChange(Sender: TObject);
begin
  HTMLPriorLinkTitle := edHTMLPriorLinkTitle.Text;
end;

procedure TQExport3DialogF.edHTMLNextLinkTitleChange(Sender: TObject);
begin
  HTMLNextLinkTitle := edHTMLNextLinkTitle.Text;
end;

procedure TQExport3DialogF.edHTMLLastLinkTitleChange(Sender: TObject);
begin
  HTMLLastLinkTitle := edHTMLLastLinkTitle.Text;
end;

//--- PDF
procedure TQExport3DialogF.SetPDFColSpacing(const Value: double);
begin
  if FPDFColSpacing <> Value then begin
    FPDFColSpacing := Value;
    edPDFColSpacing.Text := FormatFloat('0.0', FPDFColSpacing);
  end;
end;

procedure TQExport3DialogF.edPDFColSpacingChange(Sender: TObject);
begin
  PDFColSpacing := StrToDblDef(edPDFColSpacing.Text,
    Dialog.PDFOptions.ColSpacing);
end;

procedure TQExport3DialogF.SetPDFRowSpacing(const Value: double);
begin
  if FPDFRowSpacing <> Value then begin
    FPDFRowSpacing := Value;
    edPDFRowSpacing.Text := FormatFloat('0.0', FPDFRowSpacing);
  end;
end;

procedure TQExport3DialogF.edPDFRowSpacingChange(Sender: TObject);
begin
  PDFRowSpacing := StrToDblDef(edPDFRowSpacing.Text,
    Dialog.PDFOptions.RowSpacing);
end;

procedure TQExport3DialogF.SetPDFGridLineWidth(const Value: integer);
begin
  if FPDFGridLineWidth <> Value then begin
    FPDFGridLineWidth := Value;
    edPDFGridLineWidth.Text := IntToStr(PDFGridLineWidth);
  end;
end;

procedure TQExport3DialogF.edPDFGridLineWidthChange(Sender: TObject);
begin
  PDFGridLineWidth := StrToIntDef(edPDFGridLineWidth.Text,
    Dialog.PDFOptions.GridLineWidth);
end;

function TQExport3DialogF.GetPDFPageSizeFormat: string;
begin
  if FPDFPageUnits = unInch
    then Result := '0.00'
    else Result := '0';
end;

procedure TQExport3DialogF.SetPDFPageFormat(const Value: TQExportPageFormat);
begin
  if FPDFPageFormat <> Value then begin
    FPDFPageFormat := Value;
    cbPDFPageFormat.ItemIndex := Integer(FPDFPageFormat);
    if FPDFPageFormat <> pfUser then begin
      FPDFPageWidth := InchToDot(GetPageFormatInchWidth(FPDFPageFormat));
      edPDFPageWidth.Text := FormatFloat(GetPDFPageSizeFormat, PDFPageWidth);
      FPDFPageHeight := InchToDot(GetPageFormatInchHeight(FPDFPageFormat));
      edPDFPageHeight.Text := FormatFloat(GetPDFPageSizeFormat, PDFPageHeight);
    end;
  end;
end;

procedure TQExport3DialogF.cbPDFPageFormatChange(Sender: TObject);
begin
  PDFPageFormat := TQExportPageFormat(cbPDFPageFormat.ItemIndex);
end;

function TQExport3DialogF.GetPDFPageWidth: double;
begin
  Result := Dot2Units(FPDFPageUnits, FPDFPageWidth);
end;

procedure TQExport3DialogF.SetPDFPageWidth(const Value: double);
var
  Dummy: integer;
begin
  Dummy := Units2Dot(FPDFPageUnits, Value);
  if FPDFPageWidth <>  Dummy then begin
    FPDFPageWidth := Dummy;
    edPDFPageWidth.Text := FormatFloat(GetPDFPageSizeFormat, PDFPageWidth);
  end;
  PDFPageFormat := pfUser;
end;

procedure TQExport3DialogF.edPDFPageWidthExit(Sender: TObject);
begin
  PDFPageWidth := StrToDblDef(edPDFPageWidth.Text, PDFPageWidth);
end;

function TQExport3DialogF.GetPDFPageHeight: double;
begin
  Result := Dot2Units(FPDFPageUnits, FPDFPageHeight);
end;

procedure TQExport3DialogF.SetPDFPageHeight(const Value: double);
var
  Dummy: integer;
begin
  Dummy := Units2Dot(FPDFPageUnits, Value);
  if FPDFPageHeight <> Dummy then begin
    FPDFPageheight := Dummy;
    edPDFPageHeight.Text := FormatFloat(GetPDFPageSizeFormat, PDFPageHeight);
  end;
  PDFPageFormat := pfUser;
end;

procedure TQExport3DialogF.edPDFPageHeightExit(Sender: TObject);
begin
  PDFPageHeight := StrToDblDef(edPDFPageHeight.Text, PDFPageHeight);
end;

procedure TQExport3DialogF.SetPDFPageUnits(const Value: TQExportUnits);
begin
  if FPDFPageUnits <> Value then
  begin
    FPDFPageUnits := Value;
    cbPDFPageUnits.ItemIndex := Integer(FPDFPageUnits);
    edPDFPageWidth.Text := FormatFloat(GetPDFPageSizeFormat, PDFPageWidth);
    edPDFPageHeight.Text := FormatFloat(GetPDFPageSizeFormat, PDFPageHeight);

    edPDFPageMarginLeft.Text := FormatFloat(GetPDFPageSizeFormat,
      PDFPageMarginLeft);
    edPDFPageMarginRight.Text := FormatFloat(GetPDFPageSizeFormat,
      PDFPageMarginRight);
    edPDFPageMarginTop.Text := FormatFloat(GetPDFPageSizeFormat,
      PDFPageMarginTop);
    edPDFPageMarginBottom.Text := FormatFloat(GetPDFPageSizeFormat,
      PDFPageMarginBottom);

    PDFPageMarginLeft := StrToDblDef(edPDFPageMarginLeft.Text, PDFPageMarginLeft);
    PDFPageMarginRight := StrToDblDef(edPDFPageMarginRight.Text, PDFPageMarginRight);
    PDFPageMarginTop := StrToDblDef(edPDFPageMarginTop.Text, PDFPageMarginTop);
    PDFPageMarginBottom := StrToDblDef(edPDFPageMarginBottom.Text, PDFPageMarginBottom);
  end;
end;

procedure TQExport3DialogF.cbPDFPageUnitsChange(Sender: TObject);
begin
  PDFPageUnits := TQExportUnits(cbPDFPageUnits.ItemIndex);
  PDFExp.Options.PageOptions.Units := TQExportUnits(cbPDFPageUnits.ItemIndex);
end;

procedure TQExport3DialogF.SetPDFPageOrientation(const Value:
  TQExportPageOrientation);
var
  Sz: TSize;
  Rect: TRect;
begin
  if FPDFPageOrientation <> Value then begin
    FPDFPageOrientation := Value;
    cbPDFPageOrientation.ItemIndex := Integer(FPDFPageOrientation);

    Sz.cx := FPDFPageWidth;
    Sz.cy := FPDFPageHeight;
    FPDFPageWidth := Sz.cy;
    FPDFPageHeight := Sz.cx;

    Rect.Left := FPDFPageMarginLeft;
    Rect.Right := FPDFPageMarginRight;
    Rect.Top := FPDFPageMarginTop;
    Rect.Bottom := FPDFPageMarginBottom;

    if FPDFPageOrientation = poLandscape then begin
      FPDFPageMarginLeft := Rect.Bottom;
      FPDFPageMarginRight := Rect.Top;
      FPDFPageMarginTop := Rect.Left;
      FPDFPageMarginBottom := Rect.Right;
    end
    else begin
      FPDFPageMarginLeft := Rect.Top;
      FPDFPageMarginRight := Rect.Bottom;
      FPDFPageMarginTop := Rect.Right;
      FPDFPageMarginBottom := Rect.Left;
    end;

    edPDFPageWidth.Text := FormatFloat(GetPDFPageSizeFormat, PDFPageWidth);
    edPDFPageHeight.Text := FormatFloat(GetPDFPageSizeFormat, PDFPageHeight);
    edPDFPageMarginLeft.Text := FormatFloat(GetPDFPageSizeFormat,
      PDFPageMarginLeft);
    edPDFPageMarginRight.Text := FormatFloat(GetPDFPageSizeFormat,
      PDFPageMarginRight);
    edPDFPageMarginTop.Text := FormatFloat(GetPDFPageSizeFormat,
      PDFPageMarginTop);
    edPDFPageMarginBottom.Text := FormatFloat(GetPDFPageSizeFormat,
      PDFPageMarginBottom);
  end;
end;

procedure TQExport3DialogF.cbPDFPageOrientationChange(Sender: TObject);
begin
  PDFPageOrientation := TQExportPageOrientation(cbPDFPageOrientation.ItemIndex);
end;

function TQExport3DialogF.GetPDFPageMarginLeft: double;
begin
  Result := Dot2Units(FPDFPageUnits, FPDFPageMarginLeft);
end;

procedure TQExport3DialogF.SetPDFPageMarginLeft(const Value: double);
var
  Dummy: integer;
begin
  Dummy := Units2Dot(FPDFPageUnits, Value);
  if FPDFPageMarginLeft <> Dummy then begin
    FPDFPageMarginLeft := Dummy;
    edPDFPageMarginLeft.Text := FormatFloat(GetPDFPageSizeFormat,
      PDFPageMarginLeft);
  end;
end;

procedure TQExport3DialogF.edPDFPageMarginLeftExit(Sender: TObject);
begin
  PDFPageMarginLeft := StrToDblDef(edPDFPageMarginLeft.Text, PDFPageMarginLeft);
end;

function TQExport3DialogF.GetPDFPageMarginRight: double;
begin
  Result := Dot2Units(FPDFPageUnits, FPDFPageMarginRight);
end;

procedure TQExport3DialogF.SetPDFPageMarginRight(const Value: double);
var
  Dummy: integer;
begin
  Dummy := Units2Dot(FPDFPageUnits, Value);
  if FPDFPageMarginRight <> Dummy then begin
    FPDFPageMarginRight := Dummy;
    edPDFPageMarginRight.Text := FormatFloat(GetPDFPageSizeFormat,
      PDFPageMarginRight);
  end;
end;

procedure TQExport3DialogF.edPDFPageMarginRightExit(Sender: TObject);
begin
  PDFPageMarginRight := StrToDblDef(edPDFPageMarginRight.Text,
    PDFPageMarginRight);
end;

function TQExport3DialogF.GetPDFPageMarginTop: double;
begin
  Result := Dot2Units(FPDFPageUnits, FPDFPageMarginTop);
end;

procedure TQExport3DialogF.SetPDFPageMarginTop(const Value: double);
var
  Dummy: integer;
begin
  Dummy := Units2Dot(FPDFPageUnits, Value);
  if FPDFPageMarginTop <> Dummy then begin
    FPDFPageMarginTop := Dummy;
    edPDFPageMarginTop.Text := FormatFloat(GetPDFPageSizeFormat,
      PDFPageMarginTop);
  end;
end;

procedure TQExport3DialogF.edPDFPageMarginTopExit(Sender: TObject);
begin
  PDFPageMarginTop := StrToDblDef(edPDFPageMarginTop.Text, PDFPageMarginTop);
end;

function TQExport3DialogF.GetPDFPageMarginBottom: double;
begin
  Result := Dot2Units(FPDFPageUnits, FPDFPageMarginBottom);
end;

procedure TQExport3DialogF.SetPDFPageMarginBottom(const Value: double);
var
  Dummy: integer;
begin
  Dummy := Units2Dot(FPDFPageUnits, Value);
  if FPDFPageMarginBottom <> Dummy then begin
    FPDFPageMarginBottom := Dummy;
    edPDFPageMarginBottom.Text := FormatFloat(GetPDFPageSizeFormat,
      PDFPageMarginBottom);
  end;
end;

procedure TQExport3DialogF.edPDFPageMarginBottomExit(Sender: TObject);
begin
  PDFPageMarginBottom := StrToDblDef(edPDFPageMarginBottom.Text,
    PDFPageMarginBottom);
end;

procedure TQExport3DialogF.PDFFillFontList;
begin
  lvPDFFonts.Items.BeginUpdate;
  try
    lvPDFFonts.Items.Clear;

    with lvPDFFonts.Items.Add do begin
      Caption := {$IFDEF WIN32}QExportLoadStr(QED_PDF_HeaderFont){$ENDIF}
                 {$IFDEF LINUX}QED_PDF_HeaderFont{$ENDIF};
      ImageIndex := 3;
      Data := PDFExp.Options.HeaderFont;
    end;
    with lvPDFFonts.Items.Add do begin
      Caption := {$IFDEF WIN32}QExportLoadStr(QED_PDF_CaptionFont){$ENDIF}
                 {$IFDEF LINUX}QED_PDF_CaptionFont{$ENDIF};
      ImageIndex := 3;
      Data := PDFExp.Options.CaptionFont;
    end;
    with lvPDFFonts.Items.Add do begin
      Caption := {$IFDEF WIN32}QExportLoadStr(QED_PDF_DataFont){$ENDIF}
                 {$IFDEF LINUX}QED_PDF_DataFont{$ENDIF};
      ImageIndex := 3;
      Data := PDFExp.Options.DataFont;
    end;
    with lvPDFFonts.Items.Add do begin
      Caption := {$IFDEF WIN32}QExportLoadStr(QED_PDF_FooterFont){$ENDIF}
                 {$IFDEF LINUX}QED_PDF_FooterFont{$ENDIF};
      ImageIndex := 3;
      Data := PDFExp.Options.FooterFont;
    end;

    lvPDFFonts.Items[0].Focused := true;
    lvPDFFonts.Items[0].Selected := true;
    FPDFFontItem := lvPDFFonts.Items[0];
    PDFShowFontInfo;
  finally
    lvPDFFonts.Items.EndUpdate;
  end;
end;

procedure TQExport3DialogF.PDFShowFontInfo;
begin
  if Assigned(FPDFFontItem) then begin
    with TPDFFont(FPDFFontItem.Data) do begin
      cbPDFFontName.ItemIndex := Integer(BaseFont);
      paPDFSample.Font.Color := FontColor;
      cbPDFFontEncoding.ItemIndex := Integer(FontEncoding);
      edPDFFontSize.Text := IntToStr(FontSize);
    end;
    PDFShowExample;
  end;
end;

procedure TQExport3DialogF.lvPDFFontsChange(Sender: TObject;
  Item: TListItem; Change: TItemChange);
begin
  if not ((Change = ctState) and Assigned(Item) and Assigned(Item.Data)) then Exit;
  if Item <> FPDFFontItem then begin
    FPDFFontItem := Item;
    PDFShowFontInfo;
  end;
end;

procedure TQExport3DialogF.cbPDFFontNameChange(Sender: TObject);
begin
  TPDFFont(FPDFFontItem.Data).BaseFont := TPDFFontName(cbPDFFontName.ItemIndex);
  PDFShowExample;
end;

procedure TQExport3DialogF.cbPDFFontEncodingChange(Sender: TObject);
begin
  TPDFFont(FPDFFontItem.Data).FontEncoding :=
    TPDFFontEncoding(cbPDFFontEncoding.ItemIndex);
end;

procedure TQExport3DialogF.edPDFFontSizeChange(Sender: TObject);
begin
  TPDFFont(FPDFFontItem.Data).FontSize := StrToIntDef(edPDFFontSize.Text, 10);
  PDFShowExample;
end;

procedure TQExport3DialogF.PDFShowExample;
var
  FN: string;
begin
  with TPDFFont(FPDFFontItem.Data) do begin
    FN := AnsiUpperCase(cbPDFFontName.Text);

    paPDFSample.Font.Color := FontColor;
    paPDFSample.Font.Size := FontSize;

    EditFontStyle(paPDFSample.Font, fsBold, Pos('BOLD', FN) > 0);
    EditFontStyle(paPDFSample.Font, fsItalic,
      (Pos('OBLIQUE', FN) > 0) or (Pos('ITALIC', FN) > 0));

    if Pos('COURIER', FN) > 0 then
      paPDFSample.Font.Name := 'Courier New'
    else if Pos('TIMES', FN) > 0 then
      paPDFSample.Font.Name := 'Times New Roman'
    else if Pos('SYMBOL', FN) > 0 then
      paPDFSample.Font.Name := 'Symbol'
    else paPDFSample.Font.Name := 'Arial'
  end;
end;

procedure TQExport3DialogF.sbPDFFontColorClick(Sender: TObject);
var
  OldColor: TColor;
begin
  OldColor := TPDFFont(FPDFFontItem.Data).FontColor;
  ColorDialog.Color := OldColor;
  if ColorDialog.Execute and (OldColor <> ColorDialog.Color) then begin
    TPDFFont(FPDFFontItem.Data).FontColor := ColorDialog.Color;
    PDFShowExample;
  end;
end;

procedure TQExport3DialogF.bToolsClick(Sender: TObject);
var
  Point: TPoint;
begin
  Point.X := 0;
  Point.Y := 0;
  Point := bTools.ClientToScreen(Point);
  pmTools.Popup(Point.X, Point.Y - pmTools.Items.Count * 25);
end;

procedure TQExport3DialogF.miSaveOptionsClick(Sender: TObject);
begin
  sdOptions.FileName := OptionsFileName;
  if sdOptions.Execute then begin
    OptionsFileName := sdOptions.FileName;
    SaveExportOptions(OptionsFileName);
  end;
end;

procedure TQExport3DialogF.miLoadOptionsClick(Sender: TObject);
begin
  odOptions.FileName := OptionsFileName;
  if odOptions.Execute then begin
    OptionsFileName := odOptions.FileName;
    LoadExportOptions(odOptions.FileName);
  end;
end;

function TQExport3DialogF.IsCompatiblePage: boolean;
begin
  case ExportType of
    aeXLS: Result :=  Pages.ActivePage.PageIndex in [tshExportType.PageIndex,
                                                     tshFields.PageIndex,
                                                     tshFormats.PageIndex,
                                                     tshHeaderFooter.PageIndex,
                                                     tshCaptions.PageIndex,
                                                     tshXLS.PageIndex];
    aeWord,
    aeRTF: Result :=  Pages.ActivePage.PageIndex in [tshExportType.PageIndex,
                                                     tshFields.PageIndex,
                                                     tshFormats.PageIndex,
                                                     tshHeaderFooter.PageIndex,
                                                     tshCaptions.PageIndex,
                                                     tshRTF.PageIndex];
    aeHTML: Result :=  Pages.ActivePage.PageIndex in [tshExportType.PageIndex,
                                                      tshFields.PageIndex,
                                                      tshFormats.PageIndex,
                                                      tshHeaderFooter.PageIndex,
                                                      tshCaptions.PageIndex,
                                                      tshHTML.PageIndex];
    aeXML: Result :=  Pages.ActivePage.PageIndex in [tshExportType.PageIndex,
                                                     tshFields.PageIndex,
                                                     tshFormats.PageIndex,
                                                     tshXML.PageIndex];
    aeDBF: Result :=  Pages.ActivePage.PageIndex in [tshExportType.PageIndex,
                                                     tshFields.PageIndex];
    aePDF: Result :=  Pages.ActivePage.PageIndex in [tshExportType.PageIndex,
                                                     tshFields.PageIndex,
                                                     tshFormats.PageIndex,
                                                     tshHeaderFooter.PageIndex,
                                                     tshCaptions.PageIndex,
                                                     tshPDF.PageIndex];
    aeTXT,
    aeCSV: Result :=  Pages.ActivePage.PageIndex in [tshExportType.PageIndex,
                                                     tshFields.PageIndex,
                                                     tshFormats.PageIndex,
                                                     tshHeaderFooter.PageIndex,
                                                     tshCaptions.PageIndex,
                                                     tshASCII.PageIndex];
    aeDIFF,
    aeSYLK,
    aeLaTeX: Result :=  Pages.ActivePage.PageIndex in [tshExportType.PageIndex,
                                                       tshFields.PageIndex,
                                                       tshFormats.PageIndex,
                                                       tshHeaderFooter.PageIndex,
                                                       tshCaptions.PageIndex];
    aeSQL: Result :=  Pages.ActivePage.PageIndex in [tshExportType.PageIndex,
                                                     tshFields.PageIndex,
                                                     tshHeaderFooter.PageIndex,
                                                     tshSQL.PageIndex];
    aeClipboard: Result :=  Pages.ActivePage.PageIndex in [tshExportType.PageIndex,
                                                     tshFields.PageIndex,
                                                     tshFormats.PageIndex,
                                                     tshHeaderFooter.PageIndex,
                                                     tshCaptions.PageIndex];
    else Result := false;
  end;
end;

procedure TQExport3DialogF.lstRTFBaseStylesChange(Sender: TObject;
  Item: TListItem; Change: TItemChange);
var
  i: integer;
  LV: TListView;
begin
  if (Change <> ctState) then Exit;
  if not Assigned(Item.Data) then Exit;
  if not (Sender is TListView) then Exit;

  LV := Sender as TListView;

  case LV.SelCount of
    0: FRTFListItem := nil;
    else{1:} FRTFListItem := Item;
  end;
  if not Assigned(FRTFListItem) and
    (LV.SelCount > 0) then
    for i := 0 to LV.Items.Count - 1 do
      if LV.Items[i].Selected then begin
        FRTFListItem := LV.Items[i];
        Break;
      end;

  if LV.SelCount = 1
    then ShowRTFListItem(Item)
    else if LV.SelCount > 1
         then ShowRTFListItemM;

  RTFShowStyleButtons;
end;

procedure TQExport3DialogF.lstRTFBaseStylesDeletion(Sender: TObject;
  Item: TListItem);
begin
  TrtfStyle(Item.Data).Free;
  Item.Data := nil;
end;

procedure TQExport3DialogF.pcRTFStylesChange(Sender: TObject);
begin
  if RTFCurrListView = nil then Exit;
  if Assigned(RTFCurrListView.ItemFocused) then
    RTFCurrListView.OnChange(RTFCurrListView, RTFCurrListView.ItemFocused, ctState);
end;

procedure TQExport3DialogF.cbRTFFontChange(Sender: TObject);
begin
  if RTFCurrListView = nil then Exit;
  TrtfStyle(FRTFListItem.Data).Font.Name := cbRTFFont.Text;
  if RTFCurrListView.SelCount > 1 then
    ForAllListViewItems(RTFCurrListView, RTFUpdateItemFont, false, false);
  pbRTFSample.Repaint;
end;

procedure TQExport3DialogF.cbRTFFontSizeChange(Sender: TObject);
begin
  if RTFCurrListView = nil then Exit;
  TrtfStyle(FRTFListItem.Data).Font.Size := StrToIntDef(cbRTFFontSize.Text, 10);
  if RTFCurrListView.SelCount > 1 then
    ForAllListViewItems(RTFCurrListView, RTFUpdateItemFontSize, false, false);
  pbRTFSample.Repaint;
end;

procedure TQExport3DialogF.bRTFFontColorMouseDown(Sender: TObject;
  Button: TMouseButton; Shift: TShiftState; X, Y: Integer);
begin
  IncLeftAndTop(pbRTFFontColor);
end;

procedure TQExport3DialogF.bRTFFontColorMouseUp(Sender: TObject;
  Button: TMouseButton; Shift: TShiftState; X, Y: Integer);
begin
  DecLeftAndTop(pbRTFFontColor);
end;

procedure TQExport3DialogF.bRTFFontColorClick(Sender: TObject);
var
  OClr, NClr: TColor;
begin
  if RTFCurrListView = nil then Exit;
  if RTFCurrListView.SelCount < 1 then Exit;
  OClr := TrtfStyle(FRTFListItem.Data).Font.Color;
  NClr := RunColorEditor(OClr);
  if NClr <> OClr then begin
    TrtfStyle(FRTFListItem.Data).Font.Color := NClr;
    if RTFCurrListView.SelCount > 1 then
      ForAllListViewItems(RTFCurrListView, RTFUpdateItemFontColor, false, false);
    pbRTFSample.Repaint;
  end;
end;

procedure TQExport3DialogF.bRTFFontBoldClick(Sender: TObject);
begin
  if RTFCurrListView = nil then Exit;
  if RTFCurrListView.SelCount < 1 then Exit;
  RTFItemEditFontStyle(FRTFListItem, fsBold, bRTFFontBold.Down);
  if RTFCurrListView.SelCount > 1 then
    ForAllListViewItems(RTFCurrListView, RTFUpdateItemFontBold, false, false);
  pbRTFSample.Repaint;
end;

procedure TQExport3DialogF.bRTFFontItalicClick(Sender: TObject);
begin
  if RTFCurrListView = nil then Exit;
  if RTFCurrListView.SelCount < 1 then Exit;
  RTFItemEditFontStyle(FRTFListItem, fsItalic, bRTFFontItalic.Down);
  if RTFCurrListView.SelCount > 1 then
    ForAllListViewItems(RTFCurrListView, RTFUpdateItemFontItalic, false, false);
  pbRTFSample.Repaint;
end;

procedure TQExport3DialogF.bRTFFontStrikeOutClick(Sender: TObject);
begin
  if RTFCurrListView = nil then Exit;
  if RTFCurrListView.SelCount < 1 then Exit;
  RTFItemEditFontStyle(FRTFListItem, fsStrikeOut, bRTFFontStrikeOut.Down);
  if RTFCurrListView.SelCount > 1 then
    ForAllListViewItems(RTFCurrListView, RTFUpdateItemFontStrikeOut, false, false);
  pbRTFSample.Repaint;
end;

procedure TQExport3DialogF.bRTFFontUnderlineClick(Sender: TObject);
begin
  if RTFCurrListView = nil then Exit;
  if RTFCurrListView.SelCount < 1 then Exit;
  RTFItemEditFontStyle(FRTFListItem, fsUnderline, bRTFFontUnderline.Down);
  if RTFCurrListView.SelCount > 1 then
    ForAllListViewItems(RTFCurrListView, RTFUpdateItemFontUnderline, false, false);
  pbRTFSample.Repaint;
end;

procedure TQExport3DialogF.pbRTFFontColorPaint(Sender: TObject);
begin
  if RTFCurrListView = nil then Exit;
  if RTFCurrListView.SelCount < 1 then Exit;
  if RTFCurrListView.SelCount = 1
    then PaintStandardColors(pbRTFFontColor, TrtfStyle(RTFCurrListView.Selected.Data).Font.Color)
    else PaintStandardColors(pbRTFFontColor, TrtfStyle(FRTFListItem.Data).Font.Color);
end;

procedure TQExport3DialogF.bRTFBackgroundColorMouseDown(Sender: TObject;
  Button: TMouseButton; Shift: TShiftState; X, Y: Integer);
begin
  IncLeftAndTop(pbRTFBackgroundColor);
end;

procedure TQExport3DialogF.bRTFBackgroundColorMouseUp(Sender: TObject;
  Button: TMouseButton; Shift: TShiftState; X, Y: Integer);
begin
  DecLeftAndTop(pbRTFBackgroundColor);
end;

procedure TQExport3DialogF.bRTFBackgroundColorClick(Sender: TObject);
var
  OClr, NClr: TColor;
begin
  if RTFCurrListView = nil then Exit;
  if RTFCurrListView.SelCount < 1 then Exit;
  OClr := TrtfStyle(FRTFListItem.Data).BackgroundColor;
  NClr := RunColorEditor(OClr);
  if NClr <> OClr then begin
    TrtfStyle(FRTFListItem.Data).BackgroundColor := NClr;
    if RTFCurrListView.SelCount > 1 then
      ForAllListViewItems(RTFCurrListView, RTFUpdateItemBackgroundColor, false, false);
    pbRTFSample.Repaint;
  end;
end;

procedure TQExport3DialogF.pbRTFBackgroundColorPaint(Sender: TObject);
begin
  if RTFCurrListView = nil then Exit;
  if RTFCurrListView.SelCount < 1 then Exit;
  if RTFCurrListView.SelCount = 1
    then PaintStandardColors(pbRTFBackgroundColor,
      TrtfStyle(RTFCurrListView.Selected.Data).BackgroundColor)
    else PaintStandardColors(pbRTFBackgroundColor,
      TrtfStyle(FRTFListItem.Data).BackgroundColor);
end;

procedure TQExport3DialogF.bRTFHighlightColorMouseDown(Sender: TObject;
  Button: TMouseButton; Shift: TShiftState; X, Y: Integer);
begin
  IncLeftAndTop(pbRTFHighlightColor);
end;

procedure TQExport3DialogF.bRTFHighlightColorMouseUp(Sender: TObject;
  Button: TMouseButton; Shift: TShiftState; X, Y: Integer);
begin
  DecLeftAndTop(pbRTFHighlightColor);
end;

procedure TQExport3DialogF.bRTFHighlightColorClick(Sender: TObject);
var
  OClr, NClr: TColor;
begin
  if RTFCurrListView = nil then Exit;
  if RTFCurrListView.SelCount < 1 then Exit;
  OClr := TrtfStyle(FRTFListItem.Data).HighlightColor;
  NClr := RunColorEditor(OClr);
  if NClr <> OClr then begin
    TrtfStyle(FRTFListItem.Data).HighlightColor := NClr;
    if RTFCurrListView.SelCount > 1 then
      ForAllListViewItems(RTFCurrListView, RTFUpdateItemHighlightColor, false, false);
    pbRTFSample.Repaint;
  end;
end;

procedure TQExport3DialogF.pbRTFHighlightColorPaint(Sender: TObject);
begin
  if RTFCurrListView = nil then Exit;
  if RTFCurrListView.SelCount < 1 then Exit;
  if RTFCurrListView.SelCount = 1
    then PaintStandardColors(pbRTFHighlightColor,
      TrtfStyle(RTFCurrListView.Selected.Data).HighlightColor)
    else PaintStandardColors(pbRTFHighlightColor,
      TrtfStyle(FRTFListItem.Data).HighlightColor);
end;

procedure TQExport3DialogF.chRTFAllowHighlightClick(Sender: TObject);
begin
  if RTFCurrListView = nil then Exit;
  TrtfStyle(FRTFListItem.Data).AllowHighlight := chRTFAllowHighlight.Checked;
  if RTFCurrListView.SelCount > 1 then
    ForAllListViewItems(RTFCurrListView, RTFUpdateItemAllowHighlight, false, false);
  pbRTFSample.Repaint;
end;

procedure TQExport3DialogF.chRTFAllowBackgroundClick(Sender: TObject);
begin
  if RTFCurrListView = nil then Exit;
  TrtfStyle(FRTFListItem.Data).AllowBackground := chRTFAllowBackground.Checked;
  if RTFCurrListView.SelCount > 1 then
    ForAllListViewItems(RTFCurrListView, RTFUpdateItemAllowBackground, false, false);
  pbRTFSample.Repaint;
end;

procedure TQExport3DialogF.rgRTFStripTypeClick(Sender: TObject);
begin
  RTFStripType := TrtfStripType(rgRTFStripType.ItemIndex);
end;

procedure TQExport3DialogF.bRTFResetItemClick(Sender: TObject);
begin
  if RTFCurrListView = nil then Exit;
  if RTFCurrListView.SelCount < 1 then Exit;

  if (RTFCurrListView = lstRTFBaseStyles) and
     (AnsiCompareText(FRTFListItem.Caption, {$IFDEF WIN32}QExportLoadStr(QED_RTF_Caption){$ENDIF}
                                            {$IFDEF LINUX}QED_RTF_Caption{$ENDIF}) = 0) then
    SetDefaultRTFCaption(TrtfStyle(FRTFListItem.Data))
  else TrtfStyle(FRTFListItem.Data).SetDefault;

  if RTFCurrListView.SelCount > 1 then
    ForAllListViewItems(RTFCurrListView, RTFUpdateItemSetDefault, false, false);
  RTFCurrListView.OnChange(RTFCurrListView, RTFCurrListView.Selected, ctState);
end;

procedure TQExport3DialogF.bRTFResetAllClick(Sender: TObject);
begin
  if RTFCurrListView = nil then Exit;
  if RTFCurrListView.Items.Count = 0 then Exit;
  if Application.MessageBox(PChar({$IFDEF WIN32}QExportLoadStr(QED_RTF_Reset_All_Question){$ENDIF}
                                  {$IFDEF LINUX}QED_RTF_Reset_All_Question{$ENDIF}),
    PChar({$IFDEF WIN32}QExportLoadStr(QED_RTF_Reset_All_Question_Caption){$ENDIF}
          {$IFDEF LINUX}QED_RTF_Reset_All_Question_Caption{$ENDIF}),
    MB_YESNO + MB_ICONWARNING + MB_DEFBUTTON2) = ID_NO
    then Exit;
  RTFResetAllItems;
end;

procedure TQExport3DialogF.tbtAddRTFStyleClick(Sender: TObject);
begin
  with lstRTFStripStyles.Items.Add do begin
    Caption := {$IFDEF WIN32}QExportLoadStr(QED_RTF_StyleItem){$ENDIF}
               {$IFDEF LINUX}QED_RTF_StyleItem{$ENDIF} + IntToStr(lstRTFStripStyles.Items.Count);
    Data := TrtfStyle.Create(nil);
    ImageIndex := 2;
    Focused := true;
    Selected := true;
  end;
  ActiveControl := lstRTFStripStyles;
  RTFShowStyleButtons;
end;

procedure TQExport3DialogF.tbtDelRTFStyleClick(Sender: TObject);
var
  Index: integer;
begin
  if Assigned(lstRTFStripStyles.Selected) then begin
    Index := lstRTFStripStyles.Selected.Index;
    lstRTFStripStyles.Selected.Delete;
    if lstRTFStripStyles.Items.Count > 0 then begin
      if Index >= lstRTFStripStyles.Items.Count
        then Index := lstRTFStripStyles.Items.Count - 1;
      lstRTFStripStyles.Items[Index].Focused := true;
      lstRTFStripStyles.Items[Index].Selected := true;
    end;
    RTFRenumStyles;
    ActiveControl := lstRTFStripStyles;
    RTFShowStyleButtons;
  end;
end;

procedure TQExport3DialogF.tbtMoveRTFStyleUpClick(Sender: TObject);
var
  F: TrtfStyle;
  Index: integer;
begin
  Index := lstRTFStripStyles.Selected.Index;
  F := TrtfStyle(lstRTFStripStyles.Items[Index - 1].Data);
  lstRTFStripStyles.Items[Index - 1].Data := lstRTFStripStyles.Items[Index].Data;
  lstRTFStripStyles.Items[Index].Data := F;
  lstRTFStripStyles.Items[Index - 1].Focused := true;
  lstRTFStripStyles.Items[Index - 1].Selected := true;
end;

procedure TQExport3DialogF.tbtMoveRTFStyleDownClick(Sender: TObject);
var
  F: TrtfStyle;
  Index: integer;
begin
  Index := lstRTFStripStyles.Selected.Index;
  F := TrtfStyle(lstRTFStripStyles.Items[Index + 1].Data);
  lstRTFStripStyles.Items[Index + 1].Data := lstRTFStripStyles.Items[Index].Data;
  lstRTFStripStyles.Items[Index].Data := F;
  lstRTFStripStyles.Items[Index + 1].Focused := true;
  lstRTFStripStyles.Items[Index + 1].Selected := true;
end;

procedure TQExport3DialogF.tbtLoadRTFStyleClick(Sender: TObject);
begin
  if odRTFStyle.Execute then
    RTFLoadStyle(odRTFStyle.FileName);
end;

procedure TQExport3DialogF.tbtSaveRTFStyleClick(Sender: TObject);
begin
  if sdRTFStyle.Execute then
    RTFSaveStyle(sdRTFStyle.FileName);
end;

procedure TQExport3DialogF.pbRTFSamplePaint(Sender: TObject);
begin
  if RTFCurrListView = nil then Exit;
  if RTFCurrListView.SelCount < 1 then Exit;
  if RTFCurrListView.SelCount = 1
    then DrawRTFSample(pbRTFSample, TrtfStyle(RTFCurrListView.Selected.Data))
    else DrawRTFSample(pbRTFSample, TrtfStyle(FRTFListItem.Data))
end;

procedure TQExport3DialogF.bRTFFontLeftClick(Sender: TObject);
begin
  if RTFCurrListView = nil then Exit;
  if RTFCurrListView.SelCount < 1 then Exit;
  if bRTFFontLeft.Down
    then RTFItemSetAlignment(FRTFListItem, talLeft)
    else RTFItemSetAlignment(FRTFListItem, talLeft);
  if RTFCurrListView.SelCount > 1 then
    ForAllListViewItems(RTFCurrListView, RTFUpdateItemAlignment, false, false);
  pbRTFSample.Repaint;
end;

procedure TQExport3DialogF.bRTFFontCenterClick(Sender: TObject);
begin
  if RTFCurrListView = nil then Exit;
  if RTFCurrListView.SelCount < 1 then Exit;
  if bRTFFontCenter.Down
    then RTFItemSetAlignment(FRTFListItem, talCenter)
    else RTFItemSetAlignment(FRTFListItem, talLeft);
  if RTFCurrListView.SelCount > 1 then
    ForAllListViewItems(RTFCurrListView, RTFUpdateItemAlignment, false, false);
  pbRTFSample.Repaint;
end;

procedure TQExport3DialogF.bRTFFontRightClick(Sender: TObject);
begin
  if RTFCurrListView = nil then Exit;
  if RTFCurrListView.SelCount < 1 then Exit;
  if bRTFFontRight.Down
    then RTFItemSetAlignment(FRTFListItem, talRight)
    else RTFItemSetAlignment(FRTFListItem, talLeft);
  if RTFCurrListView.SelCount > 1 then
    ForAllListViewItems(RTFCurrListView, RTFUpdateItemAlignment, false, false);
  pbRTFSample.Repaint;
end;

procedure TQExport3DialogF.bRTFFontFillClick(Sender: TObject);
begin
  if RTFCurrListView = nil then Exit;
  if RTFCurrListView.SelCount < 1 then Exit;
  if bRTFFontFill.Down
    then RTFItemSetAlignment(FRTFListItem, talFill)
    else RTFItemSetAlignment(FRTFListItem, talLeft);
  if RTFCurrListView.SelCount > 1 then
    ForAllListViewItems(RTFCurrListView, RTFUpdateItemAlignment, false, false);
  pbRTFSample.Repaint;
end;

procedure TQExport3DialogF.tvXLSExtensionsChange(Sender: TObject;
  Node: TTreeNode);
begin
  if not Assigned(Node) then Exit;
  case Node.ImageIndex of
    xlsHyperlink: begin
      tbtAddXLSExtension.Hint := {$IFDEF WIN32}QExportLoadStr(QED_XLS_AddHyperlink){$ENDIF}
                                 {$IFDEF LINUX}QED_XLS_AddHyperlink{$ENDIF};
      tbtDelXLSExtension.Hint := {$IFDEF WIN32}QExportLoadStr(QED_XLS_DelHyperlink){$ENDIF}
                                 {$IFDEF LINUX}QED_XLS_DelHyperlink{$ENDIF};
      pcXLSExtensions.ActivePage := tshXLSHyperlinks;
      XLSShowHyperlink(Node);
    end;
    xlsNote: begin
      tbtAddXLSExtension.Hint := {$IFDEF WIN32}QExportLoadStr(QED_XLS_AddNote){$ENDIF}
                                 {$IFDEF LINUX}QED_XLS_AddNote{$ENDIF};
      tbtDelXLSExtension.Hint := {$IFDEF WIN32}QExportLoadStr(QED_XLS_DelNote){$ENDIF}
                                 {$IFDEF LINUX}QED_XLS_DelNote{$ENDIF};
      pcXLSExtensions.ActivePage := tshXLSNotes;
      XLSShowNote(Node);
    end;
    xlsChart: begin
      tbtAddXLSExtension.Hint := {$IFDEF WIN32}QExportLoadStr(QED_XLS_AddChart){$ENDIF}
                                 {$IFDEF LINUX}QED_XLS_AddChart{$ENDIF};
      tbtDelXLSExtension.Hint := {$IFDEF WIN32}QExportLoadStr(QED_XLS_DelChart){$ENDIF}
                                 {$IFDEF LINUX}QED_XLS_DelChart{$ENDIF};
      pcXLSExtensions.ActivePage := tshXLSCharts;
      XLSShowChart(Node);
    end;
    xlsSeries: begin
      tbtAddXLSExtension.Hint := {$IFDEF WIN32}QExportLoadStr(QED_XLS_AddSeries){$ENDIF}
                                 {$IFDEF LINUX}QED_XLS_AddSeries{$ENDIF};
      tbtDelXLSExtension.Hint := {$IFDEF WIN32}QExportLoadStr(QED_XLS_DelSeries){$ENDIF}
                                 {$IFDEF LINUX}QED_XLS_DelSeries{$ENDIF};
      pcXLSExtensions.ActivePage := tshXLSSeries;
      XLSShowSeries(Node);
    end;
    xlsCell: begin
      tbtAddXLSExtension.Hint := {$IFDEF WIN32}QExportLoadStr(QED_XLS_AddCell){$ENDIF}
                                 {$IFDEF LINUX}QED_XLS_AddCell{$ENDIF};
      tbtDelXLSExtension.Hint := {$IFDEF WIN32}QExportLoadStr(QED_XLS_DelCell){$ENDIF}
                                 {$IFDEF LINUX}QED_XLS_DelCell{$ENDIF};
      pcXLSExtensions.ActivePage := tshXLSCells;
      XLSShowCell(Node);
    end;
    xlsMergedCell: begin
      tbtAddXLSExtension.Hint := {$IFDEF WIN32}QExportLoadStr(QED_XLS_AddMergedCell){$ENDIF}
                                 {$IFDEF LINUX}QED_XLS_AddMergedCell{$ENDIF};
      tbtDelXLSExtension.Hint := {$IFDEF WIN32}QExportLoadStr(QED_XLS_DelMergedCell){$ENDIF}
                                 {$IFDEF LINUX}QED_XLS_DelMergedCell{$ENDIF};
      pcXLSExtensions.ActivePage := tshXLSMergedCells;
      XLSShowMergedCell(Node);
    end;
  end;
  tbtDelXLSExtension.Enabled := (Node.Level in [1, 3]) or
    ((Node.Level in [0, 2]) and (Node.Count > 0));
end;

procedure TQExport3DialogF.XLSShowHyperlink(Node: TTreeNode);
var
  Hyperlink: TxlsHyperlink;
  AssignedData: boolean;
begin
  if not Assigned(Node) then Exit;

  AssignedData := Assigned(Node.Data);
  laXLSHyperlinkRow.Enabled := AssignedData;
  edXLSHyperlinkRow.Enabled := AssignedData;
  laXLSHyperlinkCol.Enabled := AssignedData;
  edXLSHyperlinkCol.Enabled := AssignedData;
  rgXLSHyperlinkStyle.Enabled := AssignedData;
  laXLSHyperlinkTitle.Enabled := AssignedData;
  edXLSHyperlinkTitle.Enabled := AssignedData;
  laXLSHyperlinkTarget.Enabled := AssignedData;
  edXLSHyperlinkTarget.Enabled := AssignedData;
  laXLSHyperlinkScreenTip.Enabled := AssignedData;
  edXLSHyperlinkScreenTip.Enabled := AssignedData;

  if not AssignedData then Exit;

  Hyperlink := TxlsHyperlink(Node.Data);

  edXLSHyperlinkRow.Text := IntToStr(Hyperlink.Row);
  edXLSHyperlinkCol.Text := IntToStr(Hyperlink.Col);
  rgXLSHyperlinkStyle.ItemIndex := Integer(Hyperlink.Style);
  edXLSHyperlinkTitle.Text := Hyperlink.Title;
  edXLSHyperlinkTarget.Text := Hyperlink.Target;
  edXLSHyperlinkScreenTip.Text := Hyperlink.ScreenTip;
end;

procedure TQExport3DialogF.XLSShowChart(Node: TTreeNode);
var
  Chart: TxlsChart;
  AssignedData: boolean;
begin
  if not Assigned(Node) then Exit;

  AssignedData := Assigned(Node.Data);

  laXLSChartTitle.Enabled := AssignedData;
  edXLSChartTitle.Enabled := AssignedData;
  laXLSChartStyle.Enabled := AssignedData;
  cbXLSChartStyle.Enabled := AssignedData;
  rbXLSChartAutoPosition.Enabled := AssignedData;
  rgXLSChartPlacement.Enabled := AssignedData;
  gbXLSChartAutoPosition.Enabled := AssignedData;
  laXLSChartLeft.Enabled := AssignedData;
  edXLSChartLeft.Enabled := AssignedData;
  laXLSChartTop.Enabled := AssignedData;
  edXLSChartTop.Enabled := AssignedData;
  laXLSChartHeight.Enabled := AssignedData;
  edXLSChartHeight.Enabled := AssignedData;
  laXLSChartWidth.Enabled := AssignedData;
  edXLSChartWidth.Enabled := AssignedData;
  rbXLSChartCustomPosition.Enabled := AssignedData;
  gbXLSChartCustomPosition.Enabled := AssignedData;
  laXLSChartPositionX1.Enabled := AssignedData;
  edXLSChartPositionX1.Enabled := AssignedData;
  laXLSChartPositionY1.Enabled := AssignedData;
  edXLSChartPositionY1.Enabled := AssignedData;
  laXLSChartPositionX2.Enabled := AssignedData;
  edXLSChartPositionX2.Enabled := AssignedData;
  laXLSChartPositionY2.Enabled := AssignedData;
  edXLSChartPositionY2.Enabled := AssignedData;
  rbXLSChartCategoryLabelColumn.Enabled := AssignedData;
  cbXLSChartCategoryLabelColumn.Enabled := AssignedData;
  rbXLSChartCategoryLabelCustom.Enabled := AssignedData; 
  laXLSChartCategoryLabelsCol1.Enabled := AssignedData;
  edXLSChartCategoryLabelsCol1.Enabled := AssignedData;
  laXLSChartCategoryLabelsRow1.Enabled := AssignedData;
  edXLSChartCategoryLabelsRow1.Enabled := AssignedData;
  laXLSChartCategoryLabelsCol2.Enabled := AssignedData;
  edXLSChartCategoryLabelsCol2.Enabled := AssignedData;
  laXLSChartCategoryLabelsRow2.Enabled := AssignedData;
  edXLSChartCategoryLabelsRow2.Enabled := AssignedData;
  rgXLSChartLegendPosition.Enabled := AssignedData;
  chXLSChartShowLegend.Enabled := AssignedData;
  chXLSChartAutoColor.Enabled := AssignedData;

  if not AssignedData then Exit;

  Chart := TxlsChart(Node.Data);

  edXLSChartTitle.Text := Chart.Title;
  cbXLSChartStyle.ItemIndex := Integer(Chart.Style);
  rbXLSChartAutoPosition.Checked := Chart.Position.PositionType = cptAuto;
  rgXLSChartPlacement.ItemIndex := Integer(Chart.Position.AutoPosition.Placement);
  edXLSChartLeft.Text := IntToStr(Chart.Position.AutoPosition.Left);
  edXLSChartTop.Text := IntToStr(Chart.Position.AutoPosition.Top);
  edXLSChartHeight.Text := IntToStr(Chart.Position.AutoPosition.Height);
  edXLSChartWidth.Text := IntToStr(Chart.Position.AutoPosition.Width);
  rbXLSChartCustomPosition.Checked := Chart.Position.PositionType = cptCustom;
  edXLSChartPositionX1.Text := IntToStr(Chart.Position.CustomPosition.X1);
  edXLSChartPositionY1.Text := IntToStr(Chart.Position.CustomPosition.Y1);
  edXLSChartPositionX2.Text := IntToStr(Chart.Position.CustomPosition.X2);
  edXLSChartPositionY2.Text := IntToStr(Chart.Position.CustomPosition.Y2);
  rbXLSChartCategoryLabelColumn.Checked := Chart.CategoryLabelsType = rtColumn;
  cbXLSChartCategoryLabelColumn.ItemIndex :=
    cbXLSChartCategoryLabelColumn.Items.IndexOf(Chart.CategoryLabelsColumn);
  rbXLSChartCategoryLabelCustom.Checked :=  Chart.CategoryLabelsType = rtCustom; 
  edXLSChartCategoryLabelsCol1.Text := IntToStr(Chart.CategoryLabels.Col1);
  edXLSChartCategoryLabelsRow1.Text := IntToStr(Chart.CategoryLabels.Row1);
  edXLSChartCategoryLabelsCol2.Text := IntToStr(Chart.CategoryLabels.Col2);
  edXLSChartCategoryLabelsRow2.Text := IntToStr(Chart.CategoryLabels.Row2);
  rgXLSChartLegendPosition.ItemIndex := Integer(Chart.LegendPlacement);
  chXLSChartShowLegend.Checked := Chart.ShowLegend;
  chXLSChartAutoColor.Checked := Chart.AutoColor;
  XLSTuneChartCategoryLabelType; 
  XLSTuneChartPosition; 
end;

procedure TQExport3DialogF.XLSShowNote(Node: TTreeNode);
var
  Note: TxlsNote;
  AssignedData: boolean;
begin
  if not Assigned(Node) then Exit;

  AssignedData := Assigned(Node.Data);

  laXLSNoteCol.Enabled := AssignedData;
  edXLSNoteCol.Enabled := AssignedData;
  laXLSNoteRow.Enabled := AssignedData;
  edXLSNoteRow.Enabled := AssignedData;
  mmXLSNoteLines.Enabled := AssignedData;
  laXLSNoteFont.Enabled := AssignedData;
  cbXLSNoteFont.Enabled := AssignedData;
  laXLSNoteFontSize.Enabled := AssignedData;
  cbXLSNoteFontSize.Enabled := AssignedData;
  btnXLSNoteFontColor.Enabled := AssignedData;
  pbXLSNoteFontColor.Enabled := AssignedData;
  btnXLSNoteFontBold.Enabled := AssignedData;
  btnXLSNoteFontItalic.Enabled := AssignedData;
  btnXLSNoteFontStrikeOut.Enabled := AssignedData;
  btnXLSNoteUnderlineSingle.Enabled := AssignedData;
  btnXLSNoteUnderlineSingleAccounting.Enabled := AssignedData;
  btnXLSNoteUnderlineDouble.Enabled := AssignedData;
  btnXLSNoteUnderlineDoubleAccounting.Enabled := AssignedData;
  btnXLSNoteHorizontalLeft.Enabled := AssignedData;
  btnXLSNoteHorizontalCenter.Enabled := AssignedData;
  btnXLSNoteHorizontalRight.Enabled := AssignedData;
  btnXLSNoteHorizontalFill.Enabled := AssignedData;
  btnXLSNoteVerticalTop.Enabled := AssignedData;
  btnXLSNoteVerticalCenter.Enabled := AssignedData;
  btnXLSNoteVerticalBottom.Enabled := AssignedData;
  rgXLSNoteOrientation.Enabled := AssignedData;
  gbXLSNoteFillType.Enabled := AssignedData;
  rbXLSNoteFillSolid.Enabled := AssignedData;
  rbXLSNoteFillGradient.Enabled := AssignedData;
  rbXLSNoteGradientHorizontal.Enabled := AssignedData;
  rbXLSNoteGradientVertical.Enabled := AssignedData;
  rbXLSNoteGradientDiagonalUp.Enabled := AssignedData;
  rbXLSNoteGradientDiagonalDown.Enabled := AssignedData;
  rbXLSNoteGradientFromCorner.Enabled := AssignedData;
  rbXLSNoteGradientFromCenter.Enabled := AssignedData;
  btnXLSNoteBackgroundColor.Enabled := AssignedData;
  pbXLSNoteBackgroundColor.Enabled := AssignedData;
  btnXLSNoteForegroundColor.Enabled := AssignedData;
  pbXLSNoteForegroundColor.Enabled := AssignedData;
  laXLSNoteTransparency.Enabled := AssignedData;
  trXLSNoteTransparency.Enabled := AssignedData;
  laXLSNoteTransparencyStart.Enabled := AssignedData;
  laXLSNoteTransparencyFinish.Enabled := AssignedData;

  if not AssignedData then Exit;

  Note := TxlsNote(Node.Data);

  edXLSNoteCol.Text := IntToStr(Note.Col);
  edXLSNoteRow.Text := IntToStr(Note.Row);
  mmXLSNoteLines.Lines.Text := Note.Lines.Text;
  cbXLSNoteFont.ItemIndex := cbXLSNoteFont.Items.IndexOf(Note.Format.Font.Name);
  cbXLSNoteFontSize.Text := IntToStr(Note.Format.Font.Size);
  pbXLSNoteFontColor.Repaint;
  btnXLSNoteFontBold.Down := xfsBold in  Note.Format.Font.Style;
  btnXLSNoteFontItalic.Down := xfsItalic in  Note.Format.Font.Style;
  btnXLSNoteFontStrikeOut.Down := xfsStrikeOut in  Note.Format.Font.Style;
  btnXLSNoteUnderlineSingle.Down := Note.Format.Font.Underline = fulSingle;
  btnXLSNoteUnderlineSingleAccounting.Down := Note.Format.Font.Underline = fulSingleAccounting;
  btnXLSNoteUnderlineDouble.Down := Note.Format.Font.Underline = fulDouble;
  btnXLSNoteUnderlineDoubleAccounting.Down := Note.Format.Font.Underline = fulDoubleAccounting;
  btnXLSNoteHorizontalLeft.Down := Note.Format.Alignment.Horizontal = halLeft;
  btnXLSNoteHorizontalCenter.Down := Note.Format.Alignment.Horizontal = halCenter;
  btnXLSNoteHorizontalRight.Down := Note.Format.Alignment.Horizontal = halRight;
  btnXLSNoteHorizontalFill.Down := Note.Format.Alignment.Horizontal = halFill;
  btnXLSNoteVerticalTop.Down := Note.Format.Alignment.Vertical = valTop;
  btnXLSNoteVerticalCenter.Down := Note.Format.Alignment.Vertical = valCenter;
  btnXLSNoteVerticalBottom.Down := Note.Format.Alignment.Vertical = valBottom;
  rgXLSNoteOrientation.ItemIndex := Integer(Note.Format.Orientation);
  rbXLSNoteFillSolid.Checked := Note.Format.FillType = nftSolid;
  rbXLSNoteFillGradient.Checked := Note.Format.FillType = nftGradient;
  rbXLSNoteGradientHorizontal.Checked := Note.Format.Gradient = ngrHorizontal;
  rbXLSNoteGradientVertical.Checked := Note.Format.Gradient = ngrVertical;
  rbXLSNoteGradientDiagonalUp.Checked := Note.Format.Gradient = ngrDiagonalUp;
  rbXLSNoteGradientDiagonalDown.Checked := Note.Format.Gradient = ngrDiagonalDown;
  rbXLSNoteGradientFromCorner.Checked := Note.Format.Gradient = ngrFromCorner;
  rbXLSNoteGradientFromCenter.Checked := Note.Format.Gradient = ngrFromCenter;
  XLSTuneNoteFillType;
  pbXLSNoteBackgroundColor.Repaint;
  pbXLSNoteForegroundColor.Repaint;
  trXLSNoteTransparency.Position := Note.Format.Transparency;
  trXLSNoteTransparency.SelEnd := Note.Format.Transparency;
end;

procedure TQExport3DialogF.XLSShowSeries(Node: TTreeNode);
var
  Series: TxlsChartSeries;
  AssignedData: boolean;
begin
  if not Assigned(Node) then Exit;

  AssignedData := Assigned(Node.Data);

  laXLSSeriesTitle.Enabled := AssignedData;
  edXLSSeriesTitle.Enabled := AssignedData;
  gbXLSSeriesDataRange.Enabled := AssignedData;
  rbXLSSeriesColumn.Enabled := AssignedData;
  cbXLSSeriesColumn.Enabled := AssignedData;
  rbXLSSeriesCustom.Enabled := AssignedData;
  laXLSSeriesDataRangeCol1.Enabled := AssignedData;
  edXLSSeriesDataRangeCol1.Enabled := AssignedData;
  laXLSSeriesDataRangeRow1.Enabled := AssignedData;
  edXLSSeriesDataRangeRow1.Enabled := AssignedData;
  laXLSSeriesDataRangeCol2.Enabled := AssignedData;
  edXLSSeriesDataRangeCol2.Enabled := AssignedData;
  laXLSSeriesDataRangeRow2.Enabled := AssignedData;
  edXLSSeriesDataRangeRow2.Enabled := AssignedData;
  btnXLSSeriesColor.Enabled := AssignedData;
  pbXLSSeriesColor.Enabled := AssignedData;

  if not AssignedData then Exit;

  Series := TxlsChartSeries(Node.Data);

  edXLSSeriesTitle.Text := Series.Title;
  edXLSSeriesDataRangeCol1.Text := IntToStr(Series.DataRange.Col1);
  edXLSSeriesDataRangeRow1.Text := IntToStr(Series.DataRange.Row1);
  edXLSSeriesDataRangeCol2.Text := IntToStr(Series.DataRange.Col2);
  edXLSSeriesDataRangeRow2.Text := IntToStr(Series.DataRange.Row2);
  pbXLSSeriesColor.Repaint;
  XLSTuneSeriesDataRangeType;
end;

procedure TQExport3DialogF.XLSShowCell(Node: TTreeNode);
var
  Cell: TxlsCell;
  AssignedData: boolean;
begin
  if not Assigned(Node) then Exit;

  AssignedData := Assigned(Node.Data);

  pcXLSCells.Visible := AssignedData;
  {laXLSCellCol.Enabled := AssignedData;
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
  edXLSCellNumericFormat.Enabled := AssignedData;}


  if not AssignedData then Exit;

  Cell := TxlsCell(Node.Data);

  edXLSCellCol.Text := IntToStr(Cell.Col);
  edXLSCellRow.Text := IntToStr(Cell.Row);
  cbXLSCellType.ItemIndex := Integer(Cell.CellType);
  edXLSCellValue.Text := VarToStr(Cell.Value);
  edXLSCellDateTimeFormat.Text := Cell.DateTimeFormat;
  edXLSCellNumericFormat.Text := Cell.NumericFormat;

  XLSTuneCellType;

  ShowXLSListItem(Cell.Format);
end;

procedure TQExport3DialogF.XLSTuneCellType;
begin
  laXLSCellDateTimeFormat.Enabled := TxlsCellType(cbXLSCellType.ItemIndex) = ctDateTime;
  edXLSCellDateTimeFormat.Enabled := laXLSCellDateTimeFormat.Enabled;
  laXLSCellNumericFormat.Enabled := TxlsCellType(cbXLSCellType.ItemIndex) = ctNumeric;
  edXLSCellNumericFormat.Enabled := laXLSCellNumericFormat.Enabled;
end;

procedure TQExport3DialogF.XLSShowMergedCell(Node: TTreeNode);
var
  MergedCell: TxlsMergedCells;
  AssignedData: boolean;
begin
  if not Assigned(Node) then Exit;

  AssignedData := Assigned(Node.Data);

  laXLSMergedCellsFirstCol.Enabled := AssignedData;
  edXLSMergedCellsFirstCol.Enabled := AssignedData;
  laXLSMergedCellsFirstRow.Enabled := AssignedData;
  edXLSMergedCellsFirstRow.Enabled := AssignedData;
  laXLSMergedCellsLastCol.Enabled := AssignedData;
  edXLSMergedCellsLastCol.Enabled := AssignedData;
  laXLSMergedCellsLastRow.Enabled := AssignedData;
  edXLSMergedCellsLastRow.Enabled := AssignedData;

  if not AssignedData then Exit;

  MergedCell := TxlsMergedCells(Node.Data);

  edXLSMergedCellsFirstCol.Text := IntToStr(MergedCell.FirstCol);
  edXLSMergedCellsFirstRow.Text := IntToStr(MergedCell.FirstRow);
  edXLSMergedCellsLastCol.Text := IntToStr(MergedCell.LastCol);
  edXLSMergedCellsLastRow.Text := IntToStr(MergedCell.LastRow);
end;

procedure TQExport3DialogF.XLSTuneNoteFillType;
begin
  rbXLSNoteGradientHorizontal.Enabled := rbXLSNoteFillGradient.Checked;
  rbXLSNoteGradientVertical.Enabled := rbXLSNoteFillGradient.Checked;
  rbXLSNoteGradientDiagonalUp.Enabled := rbXLSNoteFillGradient.Checked;
  rbXLSNoteGradientDiagonalDown.Enabled := rbXLSNoteFillGradient.Checked;
  rbXLSNoteGradientFromCorner.Enabled := rbXLSNoteFillGradient.Checked;
  rbXLSNoteGradientFromCenter.Enabled := rbXLSNoteFillGradient.Checked;
end;

procedure TQExport3DialogF.edXLSHyperlinkColExit(Sender: TObject);
begin
  if not (Assigned(tvXLSExtensions.Selected) and
          Assigned(tvXLSExtensions.Selected.Data)) then Exit;
  TxlsHyperlink(tvXLSExtensions.Selected.Data).Col :=
    StrToIntDef(edXLSHyperlinkCol.Text, 0);
  if edXLSHyperlinkCol.Text <> IntToStr(TxlsHyperlink(tvXLSExtensions.Selected.Data).Col) then
    edXLSHyperlinkCol.Text := IntToStr(TxlsHyperlink(tvXLSExtensions.Selected.Data).Col);
end;

procedure TQExport3DialogF.edXLSHyperlinkRowExit(Sender: TObject);
begin
  if not (Assigned(tvXLSExtensions.Selected) and
          Assigned(tvXLSExtensions.Selected.Data)) then Exit;
  TxlsHyperlink(tvXLSExtensions.Selected.Data).Row :=
    StrToIntDef(edXLSHyperlinkRow.Text, 0);
  if edXLSHyperlinkRow.Text <> IntToStr(TxlsHyperlink(tvXLSExtensions.Selected.Data).Row) then
    edXLSHyperlinkRow.Text := IntToStr(TxlsHyperlink(tvXLSExtensions.Selected.Data).Row);
end;

procedure TQExport3DialogF.rgXLSHyperlinkStyleClick(Sender: TObject);
begin
  if not (Assigned(tvXLSExtensions.Selected) and
          Assigned(tvXLSExtensions.Selected.Data)) then Exit;
  TxlsHyperlink(tvXLSExtensions.Selected.Data).Style :=
    TxlsHyperlinkStyle(rgXLSHyperlinkStyle.ItemIndex);
end;

procedure TQExport3DialogF.edXLSHyperlinkTitleChange(Sender: TObject);
begin
  if not (Assigned(tvXLSExtensions.Selected) and
          Assigned(tvXLSExtensions.Selected.Data)) then Exit;
  TxlsHyperlink(tvXLSExtensions.Selected.Data).Title :=
    edXLSHyperlinkTitle.Text;
  tvXLSExtensions.Selected.Text := edXLSHyperlinkTitle.Text;
end;

procedure TQExport3DialogF.edXLSHyperlinkTargetChange(Sender: TObject);
begin
  if not (Assigned(tvXLSExtensions.Selected) and
          Assigned(tvXLSExtensions.Selected.Data)) then Exit;
  TxlsHyperlink(tvXLSExtensions.Selected.Data).Target :=
    edXLSHyperlinkTarget.Text;
end;

procedure TQExport3DialogF.edXLSHyperlinkScreenTipChange(Sender: TObject);
begin
  if not (Assigned(tvXLSExtensions.Selected) and
          Assigned(tvXLSExtensions.Selected.Data)) then Exit;
  TxlsHyperlink(tvXLSExtensions.Selected.Data).ScreenTip :=
    edXLSHyperlinkScreenTip.Text;
end;

procedure TQExport3DialogF.tbtAddXLSExtensionClick(Sender: TObject);

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
  if not Assigned(tvXLSExtensions.Selected) then Exit;

  case tvXLSExtensions.Selected.ImageIndex of
    xlsHyperlink: begin
      Str := {$IFDEF WIN32}QExportLoadStr(QED_XLS_Hyperlink_DefaultTitle){$ENDIF}
             {$IFDEF LINUX}QED_XLS_Hyperlink_DefaultTitle{$ENDIF} + '_%d';
      Str := Format(Str, [GetFreeNodeIndex(FXLSHyperlinkNode, Str)]);
      with tvXLSExtensions.Items.AddChild(FXLSHyperlinkNode, Str) do begin
        ImageIndex := xlsHyperlink;
        SelectedIndex := xlsHyperlink;
        Data := TxlsHyperlink.Create(nil);
        TxlsHyperlink(Data).Format.Assign(TxlsFormat(lstXLSOptions.Items[4].Data));
        TxlsHyperlink(Data).Title := Str;
        Focused := true;
        Selected := true;
      end;
    end;
    xlsNote: begin
      Str := {$IFDEF WIN32}QExportLoadStr(QED_XLS_Note_DefaultTitle){$ENDIF}
             {$IFDEF LINUX}QED_XLS_Note_DefaultTitle{$ENDIF} + '_%d';
      Str := Format(Str, [GetFreeNodeIndex(FXLSNoteNode, Str)]);
      with tvXLSExtensions.Items.AddChild(FXLSNoteNode, Str) do begin
        ImageIndex := xlsNote;
        SelectedIndex := xlsNote;
        Data := TxlsNote.Create(nil);
        Focused := true;
        Selected := true;
      end;
    end;
    xlsChart: begin
      Str := {$IFDEF WIN32}QExportLoadStr(QED_XLS_Chart_DefaultTitle){$ENDIF}
             {$IFDEF LINUX}QED_XLS_Chart_DefaultTitle{$ENDIF} + '_%d';
      Str := Format(Str, [GetFreeNodeIndex(FXLSChartNode, Str)]);
      Node := tvXLSExtensions.Items.AddChild(FXLSChartNode, Str);
      with Node do begin
        ImageIndex := xlsChart;
        SelectedIndex := xlsChart;
        Data := TxlsChart.Create(nil);
        TxlsChart(Data).Title := Str;
        Focused := true;
        Selected := true;
      end;
      with tvXLSExtensions.Items.AddChild(Node, {$IFDEF WIN32}QExportLoadStr(QED_XLS_Series){$ENDIF}
                                                {$IFDEF LINUX}QED_XLS_Series{$ENDIF}) do begin
        ImageIndex := xlsSeries;
        SelectedIndex := xlsSeries;
      end;
      Node.Expand(false);
    end;
    xlsSeries: begin
      Str := {$IFDEF WIN32}QExportLoadStr(QED_XLS_Series_DefaultTitle){$ENDIF}
             {$IFDEF LINUX}QED_XLS_Series_DefaultTitle{$ENDIF} + '_%d';
      if tvXLSExtensions.Selected.Level = 2
        then Node := tvXLSExtensions.Selected
        else Node := tvXLSExtensions.Selected.Parent;
      Str := Format(Str, [GetFreeNodeIndex(Node, Str)]);
      with tvXLSExtensions.Items.AddChild(Node, Str) do begin
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
      with tvXLSExtensions.Items.AddChild(FXLSCellNode, Str) do begin
        ImageIndex := xlsCell;
        SelectedIndex := xlsCell;
        Data := TxlsCell.Create(nil);
        Focused := true;
        Selected := true;
        Text := Format({$IFDEF WIN32}QExportLoadStr(QED_XLS_Cell_DisplayName){$ENDIF}
                       {$IFDEF LINUX}QED_XLS_Cell_DisplayName{$ENDIF},
          [TxlsCell(tvXLSExtensions.Selected.Data).Col,
           TxlsCell(tvXLSExtensions.Selected.Data).Row]);
      end;
    end;
    xlsMergedCell: begin
      Str := {$IFDEF WIN32}QExportLoadStr(QED_XLS_MergedCell_DefaultTitle){$ENDIF}
             {$IFDEF LINUX}QED_XLS_MergedCell_DefaultTitle{$ENDIF} + ' %d';
      Str := Format(Str, [GetFreeNodeIndex(FXLSMergedCellNode, Str)]);
      with tvXLSExtensions.Items.AddChild(FXLSMergedCellNode, Str) do begin
        ImageIndex := xlsMergedCell;
        SelectedIndex := xlsMergedCell;
        Data := TxlsMergedCells.Create(nil);
        Focused := true;
        Selected := true;
      end;
    end;
  end;
end;

procedure TQExport3DialogF.tbtDelXLSExtensionClick(Sender: TObject);
var
  i, N, L: integer;
  Node: TTreeNode;
begin
  if not Assigned(tvXLSExtensions.Selected) then Exit;

  N := tvXLSExtensions.Selected.Index;
  L := tvXLSExtensions.Selected.Level;
  Node := tvXLSExtensions.Selected.Parent;

  case L of
    0: begin
      for i := 0 to tvXLSExtensions.Selected.Count - 1 do
        TObject(tvXLSExtensions.Selected[i].Data).Free;
      tvXLSExtensions.Selected.DeleteChildren;
    end;
    1, 3: begin
      TObject(tvXLSExtensions.Selected.Data).Free;
      tvXLSExtensions.Selected.Delete;
    end;
    2: begin
      TxlsChart(Node.Data).Series.Clear;
      tvXLSExtensions.Selected.DeleteChildren;
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
end;

procedure TQExport3DialogF.edXLSNoteColExit(Sender: TObject);
begin
  if not (Assigned(tvXLSExtensions.Selected) and
          Assigned(tvXLSExtensions.Selected.Data)) then Exit;
  TxlsNote(tvXLSExtensions.Selected.Data).Col :=
    StrToIntDef(edXLSNoteCol.Text, 0);
  if edXLSNoteCol.Text <> IntToStr(TxlsNote(tvXLSExtensions.Selected.Data).Col) then
    edXLSNoteCol.Text := IntToStr(TxlsNote(tvXLSExtensions.Selected.Data).Col);
end;

procedure TQExport3DialogF.edXLSNoteRowExit(Sender: TObject);
begin
  if not (Assigned(tvXLSExtensions.Selected) and
          Assigned(tvXLSExtensions.Selected.Data)) then Exit;
  TxlsNote(tvXLSExtensions.Selected.Data).Row :=
    StrToIntDef(edXLSNoteRow.Text, 0);
  if edXLSNoteRow.Text <> IntToStr(TxlsNote(tvXLSExtensions.Selected.Data).Row) then
    edXLSNoteRow.Text := IntToStr(TxlsNote(tvXLSExtensions.Selected.Data).Row);
end;

procedure TQExport3DialogF.mmXLSNoteLinesChange(Sender: TObject);
begin
  if not (Assigned(tvXLSExtensions.Selected) and
          Assigned(tvXLSExtensions.Selected.Data)) then Exit;
  TxlsNote(tvXLSExtensions.Selected.Data).Lines.Text :=
    mmXLSNoteLines.Lines.Text;
end;

procedure TQExport3DialogF.cbXLSNoteFontChange(Sender: TObject);
begin
  if not (Assigned(tvXLSExtensions.Selected) and
          Assigned(tvXLSExtensions.Selected.Data)) then Exit;
  TxlsNote(tvXLSExtensions.Selected.Data).Format.Font.Name :=
    cbXLSNoteFont.Text;
end;

procedure TQExport3DialogF.cbXLSNoteFontSizeExit(Sender: TObject);
begin
  if not (Assigned(tvXLSExtensions.Selected) and
          Assigned(tvXLSExtensions.Selected.Data)) then Exit;
  TxlsNote(tvXLSExtensions.Selected.Data).Format.Font.Size :=
    StrToIntDef(cbXLSNoteFontSize.Text, 8);
  if cbXLSNoteFontSize.Text <> IntToStr(TxlsNote(tvXLSExtensions.Selected.Data).Format.Font.Size) then
    cbXLSNoteFontSize.Text := IntToStr(TxlsNote(tvXLSExtensions.Selected.Data).Format.Font.Size);
end;

procedure TQExport3DialogF.btnXLSNoteFontColorMouseDown(Sender: TObject;
  Button: TMouseButton; Shift: TShiftState; X, Y: Integer);
begin
  IncLeftAndTop(pbXLSNoteFontColor);
end;

procedure TQExport3DialogF.btnXLSNoteFontColorMouseUp(Sender: TObject;
  Button: TMouseButton; Shift: TShiftState; X, Y: Integer);
begin
  DecLeftAndTop(pbXLSNoteFontColor);
end;

procedure TQExport3DialogF.btnXLSNoteFontColorClick(Sender: TObject);
var
  OClr, NClr: TxlsColor;
begin
  if not (Assigned(tvXLSExtensions.Selected) and
          Assigned(tvXLSExtensions.Selected.Data)) then Exit;
  OClr := TxlsNote(tvXLSExtensions.Selected.Data).Format.Font.Color;
  NClr := RunXLSColorEditor(OClr);
  if NClr <> OClr then begin
    TxlsNote(tvXLSExtensions.Selected.Data).Format.Font.Color := NClr;
    pbXLSCell.Repaint;
  end;
end;

procedure TQExport3DialogF.pbXLSNoteFontColorPaint(Sender: TObject);
begin
  if not (Assigned(tvXLSExtensions.Selected) and
          Assigned(tvXLSExtensions.Selected.Data)) then Exit;
  PaintXLSColors(pbXLSNoteFontColor,
    TxlsNote(tvXLSExtensions.Selected.Data).Format.Font.Color);
end;

procedure TQExport3DialogF.btnXLSNoteFontBoldClick(Sender: TObject);
begin
  if not (Assigned(tvXLSExtensions.Selected) and
          Assigned(tvXLSExtensions.Selected.Data)) then Exit;
  EditFontStyleXLS(TxlsNote(tvXLSExtensions.Selected.Data).Format.Font,
    xfsBold, btnXLSNoteFontBold.Down);
end;

procedure TQExport3DialogF.btnXLSNoteFontItalicClick(Sender: TObject);
begin
  if not (Assigned(tvXLSExtensions.Selected) and
          Assigned(tvXLSExtensions.Selected.Data)) then Exit;
  EditFontStyleXLS(TxlsNote(tvXLSExtensions.Selected.Data).Format.Font,
    xfsItalic, btnXLSNoteFontItalic.Down);
end;

procedure TQExport3DialogF.btnXLSNoteFontStrikeOutClick(Sender: TObject);
begin
  if not (Assigned(tvXLSExtensions.Selected) and
          Assigned(tvXLSExtensions.Selected.Data)) then Exit;
  EditFontStyleXLS(TxlsNote(tvXLSExtensions.Selected.Data).Format.Font,
    xfsStrikeOut, btnXLSNoteFontStrikeOut.Down);
end;

procedure TQExport3DialogF.btnXLSNoteUnderlineSingleClick(Sender: TObject);
begin
  if not (Assigned(tvXLSExtensions.Selected) and
          Assigned(tvXLSExtensions.Selected.Data)) then Exit;
  if btnXLSNoteUnderlineSingle.Down
    then TxlsNote(tvXLSExtensions.Selected.Data).Format.Font.Underline := fulSingle
    else TxlsNote(tvXLSExtensions.Selected.Data).Format.Font.Underline := fulNone;
end;

procedure TQExport3DialogF.btnXLSNoteUnderlineSingleAccountingClick(
  Sender: TObject);
begin
  if not (Assigned(tvXLSExtensions.Selected) and
          Assigned(tvXLSExtensions.Selected.Data)) then Exit;
  if btnXLSNoteUnderlineSingleAccounting.Down
    then TxlsNote(tvXLSExtensions.Selected.Data).Format.Font.Underline := fulSingleAccounting
    else TxlsNote(tvXLSExtensions.Selected.Data).Format.Font.Underline := fulNone;
end;

procedure TQExport3DialogF.btnXLSNoteUnderlineDoubleClick(Sender: TObject);
begin
  if not (Assigned(tvXLSExtensions.Selected) and
          Assigned(tvXLSExtensions.Selected.Data)) then Exit;
  if btnXLSNoteUnderlineDouble.Down
    then TxlsNote(tvXLSExtensions.Selected.Data).Format.Font.Underline := fulDouble
    else TxlsNote(tvXLSExtensions.Selected.Data).Format.Font.Underline := fulNone;
end;

procedure TQExport3DialogF.btnXLSNoteUnderlineDoubleAccountingClick(Sender: TObject);
begin
  if not (Assigned(tvXLSExtensions.Selected) and
          Assigned(tvXLSExtensions.Selected.Data)) then Exit;
  if btnXLSNoteUnderlineDoubleAccounting.Down
    then TxlsNote(tvXLSExtensions.Selected.Data).Format.Font.Underline := fulDoubleAccounting
    else TxlsNote(tvXLSExtensions.Selected.Data).Format.Font.Underline := fulNone;
end;

procedure TQExport3DialogF.btnXLSNoteHorizontalLeftClick(Sender: TObject);
begin
  if not (Assigned(tvXLSExtensions.Selected) and
          Assigned(tvXLSExtensions.Selected.Data)) then Exit;
  if btnXLSNoteHorizontalLeft.Down
    then TxlsNote(tvXLSExtensions.Selected.Data).Format.Alignment.Horizontal := halLeft
    else TxlsNote(tvXLSExtensions.Selected.Data).Format.Alignment.Horizontal := halGeneral;
end;

procedure TQExport3DialogF.btnXLSNoteHorizontalCenterClick(Sender: TObject);
begin
  if not (Assigned(tvXLSExtensions.Selected) and
          Assigned(tvXLSExtensions.Selected.Data)) then Exit;
  if btnXLSNoteHorizontalCenter.Down
    then TxlsNote(tvXLSExtensions.Selected.Data).Format.Alignment.Horizontal := halCenter
    else TxlsNote(tvXLSExtensions.Selected.Data).Format.Alignment.Horizontal := halGeneral;
end;

procedure TQExport3DialogF.btnXLSNoteHorizontalRightClick(Sender: TObject);
begin
  if not (Assigned(tvXLSExtensions.Selected) and
          Assigned(tvXLSExtensions.Selected.Data)) then Exit;
  if btnXLSNoteHorizontalRight.Down
    then TxlsNote(tvXLSExtensions.Selected.Data).Format.Alignment.Horizontal := halRight
    else TxlsNote(tvXLSExtensions.Selected.Data).Format.Alignment.Horizontal := halGeneral;
end;

procedure TQExport3DialogF.btnXLSNoteHorizontalFillClick(Sender: TObject);
begin
  if not (Assigned(tvXLSExtensions.Selected) and
          Assigned(tvXLSExtensions.Selected.Data)) then Exit;
  if btnXLSNoteHorizontalFill.Down
    then TxlsNote(tvXLSExtensions.Selected.Data).Format.Alignment.Horizontal := halFill
    else TxlsNote(tvXLSExtensions.Selected.Data).Format.Alignment.Horizontal := halGeneral;
end;

procedure TQExport3DialogF.btnXLSNoteVerticalTopClick(Sender: TObject);
begin
  if not (Assigned(tvXLSExtensions.Selected) and
          Assigned(tvXLSExtensions.Selected.Data)) then Exit;
  if btnXLSNoteVerticalTop.Down
    then TxlsNote(tvXLSExtensions.Selected.Data).Format.Alignment.Vertical := valTop;
end;

procedure TQExport3DialogF.btnXLSNoteVerticalCenterClick(Sender: TObject);
begin
  if not (Assigned(tvXLSExtensions.Selected) and
          Assigned(tvXLSExtensions.Selected.Data)) then Exit;
  if btnXLSNoteVerticalCenter.Down
    then TxlsNote(tvXLSExtensions.Selected.Data).Format.Alignment.Vertical := valCenter;
end;

procedure TQExport3DialogF.btnXLSNoteVerticalBottomClick(Sender: TObject);
begin
  if not (Assigned(tvXLSExtensions.Selected) and
          Assigned(tvXLSExtensions.Selected.Data)) then Exit;
  if btnXLSNoteVerticalBottom.Down
    then TxlsNote(tvXLSExtensions.Selected.Data).Format.Alignment.Vertical := valBottom;
end;

procedure TQExport3DialogF.rgXLSNoteOrientationClick(Sender: TObject);
begin
  if not (Assigned(tvXLSExtensions.Selected) and
          Assigned(tvXLSExtensions.Selected.Data)) then Exit;
  TxlsNote(tvXLSExtensions.Selected.Data).Format.Orientation :=
    TxlsOrientation(rgXLSNoteOrientation.ItemIndex);
end;

procedure TQExport3DialogF.rbXLSNoteFillSolidClick(Sender: TObject);
begin
  if not (Assigned(tvXLSExtensions.Selected) and
          Assigned(tvXLSExtensions.Selected.Data)) then Exit;
  TxlsNote(tvXLSExtensions.Selected.Data).Format.FillType := nftSolid;
  XLSTuneNoteFillType;
end;

procedure TQExport3DialogF.rbXLSNoteFillGradientClick(Sender: TObject);
begin
  if not (Assigned(tvXLSExtensions.Selected) and
          Assigned(tvXLSExtensions.Selected.Data)) then Exit;
  TxlsNote(tvXLSExtensions.Selected.Data).Format.FillType := nftGradient;
  XLSTuneNoteFillType;
end;

procedure TQExport3DialogF.rbXLSNoteGradientHorizontalClick(Sender: TObject);
begin
  if not (Assigned(tvXLSExtensions.Selected) and
          Assigned(tvXLSExtensions.Selected.Data)) then Exit;
  TxlsNote(tvXLSExtensions.Selected.Data).Format.Gradient := ngrHorizontal;
end;

procedure TQExport3DialogF.rbXLSNoteGradientVerticalClick(Sender: TObject);
begin
  if not (Assigned(tvXLSExtensions.Selected) and
          Assigned(tvXLSExtensions.Selected.Data)) then Exit;
  TxlsNote(tvXLSExtensions.Selected.Data).Format.Gradient := ngrVertical;
end;

procedure TQExport3DialogF.rbXLSNoteGradientDiagonalUpClick(Sender: TObject);
begin
  if not (Assigned(tvXLSExtensions.Selected) and
          Assigned(tvXLSExtensions.Selected.Data)) then Exit;
  TxlsNote(tvXLSExtensions.Selected.Data).Format.Gradient := ngrDiagonalUp;
end;

procedure TQExport3DialogF.rbXLSNoteGradientDiagonalDownClick(Sender: TObject);
begin
  if not (Assigned(tvXLSExtensions.Selected) and
          Assigned(tvXLSExtensions.Selected.Data)) then Exit;
  TxlsNote(tvXLSExtensions.Selected.Data).Format.Gradient := ngrDiagonalDown;
end;

procedure TQExport3DialogF.rbXLSNoteGradientFromCornerClick(Sender: TObject);
begin
  if not (Assigned(tvXLSExtensions.Selected) and
          Assigned(tvXLSExtensions.Selected.Data)) then Exit;
  TxlsNote(tvXLSExtensions.Selected.Data).Format.Gradient := ngrFromCorner;
end;

procedure TQExport3DialogF.rbXLSNoteGradientFromCenterClick(Sender: TObject);
begin
  if not (Assigned(tvXLSExtensions.Selected) and
          Assigned(tvXLSExtensions.Selected.Data)) then Exit;
  TxlsNote(tvXLSExtensions.Selected.Data).Format.Gradient := ngrFromCenter;
end;

procedure TQExport3DialogF.btnXLSNoteBackgroundColorMouseDown(
  Sender: TObject; Button: TMouseButton; Shift: TShiftState; X,
  Y: Integer);
begin
  IncLeftAndTop(pbXLSNoteBackgroundColor);
end;

procedure TQExport3DialogF.btnXLSNoteBackgroundColorMouseUp(
  Sender: TObject; Button: TMouseButton; Shift: TShiftState; X,
  Y: Integer);
begin
  DecLeftAndTop(pbXLSNoteForegroundColor);
end;

procedure TQExport3DialogF.btnXLSNoteBackgroundColorClick(Sender: TObject);
var
  OClr, NClr: TColor;
begin
  if not (Assigned(tvXLSExtensions.Selected) and
          Assigned(tvXLSExtensions.Selected.Data)) then Exit;
  OClr := TxlsNote(tvXLSExtensions.Selected.Data).Format.BackgroundColor;
  ColorDialog.Color := OClr;
  if ColorDialog.Execute then begin
    NClr := ColorDialog.Color;
    if NClr <> OClr then begin
      TxlsNote(tvXLSExtensions.Selected.Data).Format.BackgroundColor := NClr;
      pbXLSNoteBackgroundColor.Repaint;
    end;
  end;
end;

procedure TQExport3DialogF.pbXLSNoteBackgroundColorPaint(Sender: TObject);
begin
  if not (Assigned(tvXLSExtensions.Selected) and
          Assigned(tvXLSExtensions.Selected.Data)) then Exit;
  PaintStandardColors(pbXLSNoteBackgroundColor,
    TxlsNote(tvXLSExtensions.Selected.Data).Format.BackgroundColor);
end;

procedure TQExport3DialogF.btnXLSNoteForegroundColorMouseDown(
  Sender: TObject; Button: TMouseButton; Shift: TShiftState; X,
  Y: Integer);
begin
  IncLeftAndTop(pbXLSNoteForegroundColor);
end;

procedure TQExport3DialogF.btnXLSNoteForegroundColorMouseUp(
  Sender: TObject; Button: TMouseButton; Shift: TShiftState; X,
  Y: Integer);
begin
  DecLeftAndTop(pbXLSNoteForegroundColor);
end;

procedure TQExport3DialogF.btnXLSNoteForegroundColorClick(Sender: TObject);
var
  OClr, NClr: TColor;
begin
  if not (Assigned(tvXLSExtensions.Selected) and
          Assigned(tvXLSExtensions.Selected.Data)) then Exit;
  OClr := TxlsNote(tvXLSExtensions.Selected.Data).Format.ForegroundColor;
  ColorDialog.Color := OClr;
  if ColorDialog.Execute then begin
    NClr := ColorDialog.Color;
    if NClr <> OClr then begin
      TxlsNote(tvXLSExtensions.Selected.Data).Format.ForegroundColor := NClr;
      pbXLSNoteForegroundColor.Repaint;
    end;
  end;
end;

procedure TQExport3DialogF.pbXLSNoteForegroundColorPaint(Sender: TObject);
begin
  if not (Assigned(tvXLSExtensions.Selected) and
          Assigned(tvXLSExtensions.Selected.Data)) then Exit;
  PaintStandardColors(pbXLSNoteForegroundColor,
    TxlsNote(tvXLSExtensions.Selected.Data).Format.ForegroundColor);
end;

procedure TQExport3DialogF.trXLSNoteTransparencyChange(Sender: TObject);
var
  FmtStr: string;
begin
  if not (Assigned(tvXLSExtensions.Selected) and
          Assigned(tvXLSExtensions.Selected.Data)) then Exit;
  trXLSNoteTransparency.SelEnd := trXLSNoteTransparency.Position;
  FmtStr := {$IFDEF WIN32}QExportLoadStr(QED_XLS_Note_Transparency){$ENDIF}
            {$IFDEF LINUX}QED_XLS_Note_Transparency{$ENDIF} + ' - %d%%';
  laXLSNoteTransparency.Caption := Format(FmtStr, [trXLSNoteTransparency.Position]);
  TxlsNote(tvXLSExtensions.Selected.Data).Format.Transparency :=
    trXLSNoteTransparency.Position;
end;

procedure TQExport3DialogF.edXLSChartTitleChange(Sender: TObject);
begin
  if not (Assigned(tvXLSExtensions.Selected) and
          Assigned(tvXLSExtensions.Selected.Data)) then Exit;
  TxlsChart(tvXLSExtensions.Selected.Data).Title :=
    edXLSChartTitle.Text;
end;

procedure TQExport3DialogF.cbXLSChartStyleChange(Sender: TObject);
begin
  if not (Assigned(tvXLSExtensions.Selected) and
          Assigned(tvXLSExtensions.Selected.Data)) then Exit;
  TxlsChart(tvXLSExtensions.Selected.Data).Style :=
    TxlsChartStyle(cbXLSChartStyle.ItemIndex);
end;

procedure TQExport3DialogF.edXLSChartPositionX1Exit(Sender: TObject);
begin
  if not (Assigned(tvXLSExtensions.Selected) and
          Assigned(tvXLSExtensions.Selected.Data)) then Exit;
  TxlsChart(tvXLSExtensions.Selected.Data).Position.CustomPosition.X1 :=
    StrToIntDef(edXLSChartPositionX1.Text, 0);
  if edXLSChartPositionX1.Text <> IntToStr(TxlsChart(tvXLSExtensions.Selected.Data).Position.CustomPosition.X1) then
    edXLSChartPositionX1.Text := IntToStr(TxlsChart(tvXLSExtensions.Selected.Data).Position.CustomPosition.X1);
end;

procedure TQExport3DialogF.edXLSChartPositionY1Exit(Sender: TObject);
begin
  if not (Assigned(tvXLSExtensions.Selected) and
          Assigned(tvXLSExtensions.Selected.Data)) then Exit;
  TxlsChart(tvXLSExtensions.Selected.Data).Position.CustomPosition.Y1 :=
    StrToIntDef(edXLSChartPositionY1.Text, 0);
  if edXLSChartPositionY1.Text <> IntToStr(TxlsChart(tvXLSExtensions.Selected.Data).Position.CustomPosition.Y1) then
    edXLSChartPositionY1.Text := IntToStr(TxlsChart(tvXLSExtensions.Selected.Data).Position.CustomPosition.Y1);
end;

procedure TQExport3DialogF.edXLSChartPositionX2Exit(Sender: TObject);
begin
  if not (Assigned(tvXLSExtensions.Selected) and
          Assigned(tvXLSExtensions.Selected.Data)) then Exit;
  TxlsChart(tvXLSExtensions.Selected.Data).Position.CustomPosition.X2 :=
    StrToIntDef(edXLSChartPositionX2.Text, 0);
  if edXLSChartPositionX2.Text <> IntToStr(TxlsChart(tvXLSExtensions.Selected.Data).Position.CustomPosition.X2) then
    edXLSChartPositionX2.Text := IntToStr(TxlsChart(tvXLSExtensions.Selected.Data).Position.CustomPosition.X2);
end;

procedure TQExport3DialogF.edXLSChartPositionY2Exit(Sender: TObject);
begin
  if not (Assigned(tvXLSExtensions.Selected) and
          Assigned(tvXLSExtensions.Selected.Data)) then Exit;
  TxlsChart(tvXLSExtensions.Selected.Data).Position.CustomPosition.Y2 :=
    StrToIntDef(edXLSChartPositionY2.Text, 0);
  if edXLSChartPositionY2.Text <> IntToStr(TxlsChart(tvXLSExtensions.Selected.Data).Position.CustomPosition.Y2) then
    edXLSChartPositionY2.Text := IntToStr(TxlsChart(tvXLSExtensions.Selected.Data).Position.CustomPosition.Y2);
end;

procedure TQExport3DialogF.edXLSChartCategoryLabelsCol1Exit(Sender: TObject);
begin
  if not (Assigned(tvXLSExtensions.Selected) and
          Assigned(tvXLSExtensions.Selected.Data)) then Exit;
  TxlsChart(tvXLSExtensions.Selected.Data).CategoryLabels.Col1 :=
    StrToIntDef(edXLSChartCategoryLabelsCol1.Text, 0);
  if edXLSChartCategoryLabelsCol1.Text <> IntToStr(TxlsChart(tvXLSExtensions.Selected.Data).CategoryLabels.Col1) then
    edXLSChartCategoryLabelsCol1.Text := IntToStr(TxlsChart(tvXLSExtensions.Selected.Data).CategoryLabels.Col1);
end;

procedure TQExport3DialogF.edXLSChartCategoryLabelsRow1Exit(Sender: TObject);
begin
  if not (Assigned(tvXLSExtensions.Selected) and
          Assigned(tvXLSExtensions.Selected.Data)) then Exit;
  TxlsChart(tvXLSExtensions.Selected.Data).CategoryLabels.Row1 :=
    StrToIntDef(edXLSChartCategoryLabelsRow1.Text, 0);
  if edXLSChartCategoryLabelsRow1.Text <> IntToStr(TxlsChart(tvXLSExtensions.Selected.Data).CategoryLabels.Row1) then
    edXLSChartCategoryLabelsRow1.Text := IntToStr(TxlsChart(tvXLSExtensions.Selected.Data).CategoryLabels.Row1);
end;

procedure TQExport3DialogF.edXLSChartCategoryLabelsCol2Exit(Sender: TObject);
begin
  if not (Assigned(tvXLSExtensions.Selected) and
          Assigned(tvXLSExtensions.Selected.Data)) then Exit;
  TxlsChart(tvXLSExtensions.Selected.Data).CategoryLabels.Col2 :=
    StrToIntDef(edXLSChartCategoryLabelsCol2.Text, 0);
  if edXLSChartCategoryLabelsCol2.Text <> IntToStr(TxlsChart(tvXLSExtensions.Selected.Data).CategoryLabels.Col2) then
    edXLSChartCategoryLabelsCol2.Text := IntToStr(TxlsChart(tvXLSExtensions.Selected.Data).CategoryLabels.Col2);
end;

procedure TQExport3DialogF.edXLSChartCategoryLabelsRow2Exit(Sender: TObject);
begin
  if not (Assigned(tvXLSExtensions.Selected) and
          Assigned(tvXLSExtensions.Selected.Data)) then Exit;
  TxlsChart(tvXLSExtensions.Selected.Data).CategoryLabels.Row2 :=
    StrToIntDef(edXLSChartCategoryLabelsRow2.Text, 0);
  if edXLSChartCategoryLabelsRow2.Text <> IntToStr(TxlsChart(tvXLSExtensions.Selected.Data).CategoryLabels.Row2) then
    edXLSChartCategoryLabelsRow2.Text := IntToStr(TxlsChart(tvXLSExtensions.Selected.Data).CategoryLabels.Row2);
end;

procedure TQExport3DialogF.rgXLSChartLegendPositionClick(Sender: TObject);
begin
  if not (Assigned(tvXLSExtensions.Selected) and
          Assigned(tvXLSExtensions.Selected.Data)) then Exit;
  TxlsChart(tvXLSExtensions.Selected.Data).LegendPlacement :=
    TxlsChartLegendPlacement(rgXLSChartLegendPosition.ItemIndex);
end;

procedure TQExport3DialogF.chXLSChartShowLegendClick(Sender: TObject);
begin
  if not (Assigned(tvXLSExtensions.Selected) and
          Assigned(tvXLSExtensions.Selected.Data)) then Exit;
  TxlsChart(tvXLSExtensions.Selected.Data).ShowLegend :=
    chXLSChartShowLegend.Checked;
end;

procedure TQExport3DialogF.chXLSChartAutoColorClick(Sender: TObject);
begin
  if not (Assigned(tvXLSExtensions.Selected) and
          Assigned(tvXLSExtensions.Selected.Data)) then Exit;
  TxlsChart(tvXLSExtensions.Selected.Data).AutoColor :=
    chXLSChartAutoColor.Checked;
end;

procedure TQExport3DialogF.edXLSSeriesTitleChange(Sender: TObject);
begin
  if not (Assigned(tvXLSExtensions.Selected) and
          Assigned(tvXLSExtensions.Selected.Data)) then Exit;
  TxlsChartSeries(tvXLSExtensions.Selected.Data).Title :=
    edXLSSeriesTitle.Text;
end;

procedure TQExport3DialogF.edXLSSeriesDataRangeCol1Exit(Sender: TObject);
begin
  if not (Assigned(tvXLSExtensions.Selected) and
          Assigned(tvXLSExtensions.Selected.Data)) then Exit;
  TxlsChartSeries(tvXLSExtensions.Selected.Data).DataRange.Col1 :=
    StrToIntDef(edXLSSeriesDataRangeCol1.Text, 0);
  if edXLSSeriesDataRangeCol1.Text <> IntToStr(TxlsChartSeries(tvXLSExtensions.Selected.Data).DataRange.Col1) then
    edXLSSeriesDataRangeCol1.Text := IntToStr(TxlsChartSeries(tvXLSExtensions.Selected.Data).DataRange.Col1);
end;

procedure TQExport3DialogF.edXLSSeriesDataRangeRow1Exit(Sender: TObject);
begin
  if not (Assigned(tvXLSExtensions.Selected) and
          Assigned(tvXLSExtensions.Selected.Data)) then Exit;
  TxlsChartSeries(tvXLSExtensions.Selected.Data).DataRange.Row1 :=
    StrToIntDef(edXLSSeriesDataRangeRow1.Text, 0);
  if edXLSSeriesDataRangeRow1.Text <> IntToStr(TxlsChartSeries(tvXLSExtensions.Selected.Data).DataRange.Row1) then
    edXLSSeriesDataRangeRow1.Text := IntToStr(TxlsChartSeries(tvXLSExtensions.Selected.Data).DataRange.Row1);
end;

procedure TQExport3DialogF.edXLSSeriesDataRangeCol2Exit(Sender: TObject);
begin
  if not (Assigned(tvXLSExtensions.Selected) and
          Assigned(tvXLSExtensions.Selected.Data)) then Exit;
  TxlsChartSeries(tvXLSExtensions.Selected.Data).DataRange.Col2 :=
    StrToIntDef(edXLSSeriesDataRangeCol2.Text, 0);
  if edXLSSeriesDataRangeCol2.Text <> IntToStr(TxlsChartSeries(tvXLSExtensions.Selected.Data).DataRange.Col2) then
    edXLSSeriesDataRangeCol2.Text := IntToStr(TxlsChartSeries(tvXLSExtensions.Selected.Data).DataRange.Col2);
end;

procedure TQExport3DialogF.edXLSSeriesDataRangeRow2Exit(Sender: TObject);
begin
  if not (Assigned(tvXLSExtensions.Selected) and
          Assigned(tvXLSExtensions.Selected.Data)) then Exit;
  TxlsChartSeries(tvXLSExtensions.Selected.Data).DataRange.Row2 :=
    StrToIntDef(edXLSSeriesDataRangeRow2.Text, 0);
  if edXLSSeriesDataRangeRow2.Text <> IntToStr(TxlsChartSeries(tvXLSExtensions.Selected.Data).DataRange.Row2) then
    edXLSSeriesDataRangeRow2.Text := IntToStr(TxlsChartSeries(tvXLSExtensions.Selected.Data).DataRange.Row2);
end;

procedure TQExport3DialogF.btnXLSSeriesColorMouseDown(Sender: TObject;
  Button: TMouseButton; Shift: TShiftState; X, Y: Integer);
begin
  IncLeftAndTop(pbXLSSeriesColor);
end;

procedure TQExport3DialogF.btnXLSSeriesColorMouseUp(Sender: TObject;
  Button: TMouseButton; Shift: TShiftState; X, Y: Integer);
begin
  DecLeftAndTop(pbXLSSeriesColor);
end;

procedure TQExport3DialogF.btnXLSSeriesColorClick(Sender: TObject);
var
  OClr, NClr: TxlsColor;
begin
  if not (Assigned(tvXLSExtensions.Selected) and
          Assigned(tvXLSExtensions.Selected.Data)) then Exit;
  OClr := TxlsChartSeries(tvXLSExtensions.Selected.Data).Color;
  NClr := RunXLSColorEditor(OClr);
  if NClr <> OClr then begin
    TxlsChartSeries(tvXLSExtensions.Selected.Data).Color := NClr;
    pbXLSSeriesColor.Repaint;
  end;
end;

procedure TQExport3DialogF.pbXLSSeriesColorPaint(Sender: TObject);
begin
  if not (Assigned(tvXLSExtensions.Selected) and
          Assigned(tvXLSExtensions.Selected.Data)) then Exit;
  PaintXLSColors(pbXLSSeriesColor,
    TxlsChartSeries(tvXLSExtensions.Selected.Data).Color);
end;

procedure TQExport3DialogF.XLSClearChartNodes;
var
  i: integer;
begin
  tvXLSExtensions.Items.BeginUpdate;
  try
    for i := FXLSChartNode.Count - 1 downto 0 do begin
      TxlsChart(FXLSChartNode[i].Data).Free;
      FXLSChartNode[i].Delete;
    end;
  finally
    tvXLSExtensions.Items.EndUpdate;
  end;
end;

procedure TQExport3DialogF.XLSClearCellNodes;
var
  i: integer;
begin
  tvXLSExtensions.Items.BeginUpdate;
  try
    for i := FXLSCellNode.Count - 1 downto 0 do begin
      TxlsCell(FXLSCellNode[i].Data).Free;
      FXLSCellNode[i].Delete;
    end;
  finally
    tvXLSExtensions.Items.EndUpdate;
  end;
end;

procedure TQExport3DialogF.XLSClearMergedCellsNodes;
var
  i: integer;
begin
  tvXLSExtensions.Items.BeginUpdate;
  try
    for i := FXLSMergedCellNode.Count - 1 downto 0 do begin
      TxlsCell(FXLSMergedCellNode[i].Data).Free;
      FXLSMergedCellNode[i].Delete;
    end;
  finally
    tvXLSExtensions.Items.EndUpdate;
  end;
end;

procedure TQExport3DialogF.XLSUpdateHyperlinkFormats;
var
  i: integer;
begin
  for i := 0 to tvXLSExtensions.Items[0].Count - 1 do
    TxlsHyperlink(tvXLSExtensions.Items[0].Item[i].Data).Format.Assign(TxlsFormat(lstXLSOptions.Items[4].Data));
end;

procedure TQExport3DialogF.XLSClearHyperlinkNodes;
var
  i: integer;
begin
  tvXLSExtensions.Items.BeginUpdate;
  try
    for i := FXLSHyperlinkNode.Count - 1 downto 0 do begin
      TxlsHyperlink(FXLSHyperlinkNode[i].Data).Free;
      FXLSHyperlinkNode[i].Delete;
    end;
  finally
    tvXLSExtensions.Items.EndUpdate;
  end;
end;

procedure TQExport3DialogF.XLSClearNoteNodes;
var
  i: integer;
begin
  tvXLSExtensions.Items.BeginUpdate;
  try
    for i := FXLSNoteNode.Count - 1 downto 0 do begin
      TxlsNote(FXLSNoteNode[i].Data).Free;
      FXLSNoteNode[i].Delete;
    end;
  finally
    tvXLSExtensions.Items.EndUpdate;
  end;
end;

procedure TQExport3DialogF.rbXLSChartCategoryLabelColumnClick(
  Sender: TObject);
begin
  if not (Assigned(tvXLSExtensions.Selected) and
          Assigned(tvXLSExtensions.Selected.Data)) then Exit;
  TxlsChart(tvXLSExtensions.Selected.Data).CategoryLabelsType := rtColumn;
  XLSTuneChartCategoryLabelType;
end;

procedure TQExport3DialogF.XLSTuneChartCategoryLabelType;
begin
  cbXLSChartCategoryLabelColumn.Enabled := rbXLSChartCategoryLabelColumn.Checked;
  laXLSChartCategoryLabelsCol1.Enabled := rbXLSChartCategoryLabelCustom.Checked;
  edXLSChartCategoryLabelsCol1.Enabled := rbXLSChartCategoryLabelCustom.Checked;
  laXLSChartCategoryLabelsRow1.Enabled := rbXLSChartCategoryLabelCustom.Checked;
  edXLSChartCategoryLabelsRow1.Enabled := rbXLSChartCategoryLabelCustom.Checked;
  laXLSChartCategoryLabelsCol2.Enabled := rbXLSChartCategoryLabelCustom.Checked;
  edXLSChartCategoryLabelsCol2.Enabled := rbXLSChartCategoryLabelCustom.Checked;
  laXLSChartCategoryLabelsRow2.Enabled := rbXLSChartCategoryLabelCustom.Checked;
  edXLSChartCategoryLabelsRow2.Enabled := rbXLSChartCategoryLabelCustom.Checked;
end;

procedure TQExport3DialogF.rbXLSChartCategoryLabelCustomClick(
  Sender: TObject);
begin
  if not (Assigned(tvXLSExtensions.Selected) and
          Assigned(tvXLSExtensions.Selected.Data)) then Exit;
  TxlsChart(tvXLSExtensions.Selected.Data).CategoryLabelsType := rtCustom;
  XLSTuneChartCategoryLabelType;
end;

procedure TQExport3DialogF.cbXLSChartCategoryLabelColumnChange(
  Sender: TObject);
begin
  if not (Assigned(tvXLSExtensions.Selected) and
          Assigned(tvXLSExtensions.Selected.Data)) then Exit;
  TxlsChart(tvXLSExtensions.Selected.Data).CategoryLabelsColumn :=
    cbXLSChartCategoryLabelColumn.Text;
end;

procedure TQExport3DialogF.XLSTuneSeriesDataRangeType;
begin
  cbXLSSeriesColumn.Enabled := rbXLSSeriesColumn.Checked;
  laXLSSeriesDataRangeCol1.Enabled := rbXLSSeriesCustom.Checked;
  edXLSSeriesDataRangeCol1.Enabled := rbXLSSeriesCustom.Checked;
  laXLSSeriesDataRangeRow1.Enabled := rbXLSSeriesCustom.Checked;
  edXLSSeriesDataRangeRow1.Enabled := rbXLSSeriesCustom.Checked;
  laXLSSeriesDataRangeCol2.Enabled := rbXLSSeriesCustom.Checked;
  edXLSSeriesDataRangeCol2.Enabled := rbXLSSeriesCustom.Checked;
  laXLSSeriesDataRangeRow2.Enabled := rbXLSSeriesCustom.Checked;
  edXLSSeriesDataRangeRow2.Enabled := rbXLSSeriesCustom.Checked;
end;

procedure TQExport3DialogF.rbXLSSeriesColumnClick(Sender: TObject);
begin
  if not (Assigned(tvXLSExtensions.Selected) and
          Assigned(tvXLSExtensions.Selected.Data)) then Exit;
  TxlsChartSeries(tvXLSExtensions.Selected.Data).DataRangeType := rtColumn;
  XLSTuneSeriesDataRangeType;
end;

procedure TQExport3DialogF.rbXLSSeriesCustomClick(Sender: TObject);
begin
  if not (Assigned(tvXLSExtensions.Selected) and
          Assigned(tvXLSExtensions.Selected.Data)) then Exit;
  TxlsChartSeries(tvXLSExtensions.Selected.Data).DataRangeType := rtCustom;
  XLSTuneSeriesDataRangeType;
end;

procedure TQExport3DialogF.cbXLSSeriesColumnChange(Sender: TObject);
begin
  if not (Assigned(tvXLSExtensions.Selected) and
          Assigned(tvXLSExtensions.Selected.Data)) then Exit;
  TxlsChartSeries(tvXLSExtensions.Selected.Data).DataColumn :=
    cbXLSSeriesColumn.Text;
  XLSTuneSeriesDataRangeType;
end;

procedure TQExport3DialogF.rbXLSChartAutoPositionClick(Sender: TObject);
begin
  if not (Assigned(tvXLSExtensions.Selected) and
          Assigned(tvXLSExtensions.Selected.Data)) then Exit;
  TxlsChart(tvXLSExtensions.Selected.Data).Position.PositionType := cptAuto;
  XLSTuneChartPosition;
end;

procedure TQExport3DialogF.XLSTuneChartPosition;
begin
  rgXLSChartPlacement.Enabled := rbXLSChartAutoPosition.Checked;
  gbXLSChartAutoPosition.Enabled := rbXLSChartAutoPosition.Checked;
  laXLSChartLeft.Enabled := rbXLSChartAutoPosition.Checked;
  edXLSChartLeft.Enabled := rbXLSChartAutoPosition.Checked;
  laXLSChartTop.Enabled := rbXLSChartAutoPosition.Checked;
  edXLSChartTop.Enabled := rbXLSChartAutoPosition.Checked;
  laXLSChartHeight.Enabled := rbXLSChartAutoPosition.Checked;
  edXLSChartHeight.Enabled := rbXLSChartAutoPosition.Checked;
  laXLSChartWidth.Enabled := rbXLSChartAutoPosition.Checked;
  edXLSChartWidth.Enabled := rbXLSChartAutoPosition.Checked;
  laXLSChartPositionX1.Enabled := rbXLSChartCustomPosition.Checked;
  edXLSChartPositionX1.Enabled := rbXLSChartCustomPosition.Checked;
  laXLSChartPositionY1.Enabled := rbXLSChartCustomPosition.Checked;
  edXLSChartPositionY1.Enabled := rbXLSChartCustomPosition.Checked;
  laXLSChartPositionX2.Enabled := rbXLSChartCustomPosition.Checked;
  edXLSChartPositionX2.Enabled := rbXLSChartCustomPosition.Checked;
  laXLSChartPositionY2.Enabled := rbXLSChartCustomPosition.Checked;
  edXLSChartPositionY2.Enabled := rbXLSChartCustomPosition.Checked;
end;

procedure TQExport3DialogF.rgXLSChartPlacementClick(Sender: TObject);
begin
  if not (Assigned(tvXLSExtensions.Selected) and
          Assigned(tvXLSExtensions.Selected.Data)) then Exit;
  TxlsChart(tvXLSExtensions.Selected.Data).Position.AutoPosition.Placement :=
    TxlsChartPlacement(rgXLSChartPlacement.ItemIndex);
end;

procedure TQExport3DialogF.edXLSChartLeftExit(Sender: TObject);
begin
  if not (Assigned(tvXLSExtensions.Selected) and
          Assigned(tvXLSExtensions.Selected.Data)) then Exit;
  TxlsChart(tvXLSExtensions.Selected.Data).Position.AutoPosition.Left :=
    StrToIntDef(edXLSChartLeft.Text, 0);
  if edXLSChartLeft.Text <> IntToStr(TxlsChart(tvXLSExtensions.Selected.Data).Position.AutoPosition.Left) then
    edXLSChartLeft.Text := IntToStr(TxlsChart(tvXLSExtensions.Selected.Data).Position.AutoPosition.Left);
end;

procedure TQExport3DialogF.edXLSChartTopExit(Sender: TObject);
begin
  if not (Assigned(tvXLSExtensions.Selected) and
          Assigned(tvXLSExtensions.Selected.Data)) then Exit;
  TxlsChart(tvXLSExtensions.Selected.Data).Position.AutoPosition.Top :=
    StrToIntDef(edXLSChartTop.Text, 0);
  if edXLSChartTop.Text <> IntToStr(TxlsChart(tvXLSExtensions.Selected.Data).Position.AutoPosition.Top) then
    edXLSChartTop.Text := IntToStr(TxlsChart(tvXLSExtensions.Selected.Data).Position.AutoPosition.Top);
end;

procedure TQExport3DialogF.edXLSChartHeightExit(Sender: TObject);
begin
  if not (Assigned(tvXLSExtensions.Selected) and
          Assigned(tvXLSExtensions.Selected.Data)) then Exit;
  TxlsChart(tvXLSExtensions.Selected.Data).Position.AutoPosition.Height :=
    StrToIntDef(edXLSChartHeight.Text, 0);
  if edXLSChartHeight.Text <> IntToStr(TxlsChart(tvXLSExtensions.Selected.Data).Position.AutoPosition.Height) then
    edXLSChartHeight.Text := IntToStr(TxlsChart(tvXLSExtensions.Selected.Data).Position.AutoPosition.Height);
end;

procedure TQExport3DialogF.edXLSChartWidthExit(Sender: TObject);
begin
  if not (Assigned(tvXLSExtensions.Selected) and
          Assigned(tvXLSExtensions.Selected.Data)) then Exit;
  TxlsChart(tvXLSExtensions.Selected.Data).Position.AutoPosition.Width :=
    StrToIntDef(edXLSChartWidth.Text, 0);
  if edXLSChartWidth.Text <> IntToStr(TxlsChart(tvXLSExtensions.Selected.Data).Position.AutoPosition.Width) then
    edXLSChartWidth.Text := IntToStr(TxlsChart(tvXLSExtensions.Selected.Data).Position.AutoPosition.Width);
end;

procedure TQExport3DialogF.rbXLSChartCustomPositionClick(Sender: TObject);
begin
  if not (Assigned(tvXLSExtensions.Selected) and
          Assigned(tvXLSExtensions.Selected.Data)) then Exit;
  TxlsChart(tvXLSExtensions.Selected.Data).Position.PositionType := cptCustom;
  XLSTuneChartPosition;
end;

procedure TQExport3DialogF.edXLSCellColExit(Sender: TObject);
begin
  if not (Assigned(tvXLSExtensions.Selected) and
          Assigned(tvXLSExtensions.Selected.Data)) then Exit;

  TxlsCell(tvXLSExtensions.Selected.Data).Col :=
    StrToIntDef(edXLSCellCol.Text, 0);
  if AnsiCompareText(IntToStr(TxlsCell(tvXLSExtensions.Selected.Data).Col),
       edXLSCellCol.Text) <> 0 then
    edXLSCellCol.Text := IntToStr(TxlsCell(tvXLSExtensions.Selected.Data).Col);

  tvXLSExtensions.Selected.Text := Format({$IFDEF WIN32}QExportLoadStr(QED_XLS_Cell_DisplayName){$ENDIF}
                                          {$IFDEF LINUX}QED_XLS_Cell_DisplayName{$ENDIF},
    [TxlsCell(tvXLSExtensions.Selected.Data).Col,
     TxlsCell(tvXLSExtensions.Selected.Data).Row]);
end;

procedure TQExport3DialogF.edXLSCellRowExit(Sender: TObject);
begin
  if not (Assigned(tvXLSExtensions.Selected) and
          Assigned(tvXLSExtensions.Selected.Data)) then Exit;

  TxlsCell(tvXLSExtensions.Selected.Data).Row :=
    StrToIntDef(edXLSCellRow.Text, 0);
  if AnsiCompareText(IntToStr(TxlsCell(tvXLSExtensions.Selected.Data).Row),
       edXLSCellRow.Text) <> 0 then
    edXLSCellRow.Text := IntToStr(TxlsCell(tvXLSExtensions.Selected.Data).Row);

  tvXLSExtensions.Selected.Text := Format({$IFDEF WIN32}QExportLoadStr(QED_XLS_Cell_DisplayName){$ENDIF}
                                          {$IFDEF LINUX}QED_XLS_Cell_DisplayName{$ENDIF},
    [TxlsCell(tvXLSExtensions.Selected.Data).Col,
     TxlsCell(tvXLSExtensions.Selected.Data).Row]);
end;

procedure TQExport3DialogF.edXLSCellColKeyDown(Sender: TObject;
  var Key: Word; Shift: TShiftState);
begin
  if Key = VK_RETURN then
    edXLSCellColExit(Sender);
end;

procedure TQExport3DialogF.edXLSCellRowKeyDown(Sender: TObject;
  var Key: Word; Shift: TShiftState);
begin
  if Key = VK_RETURN then
    edXLSCellRowExit(Sender);
end;

procedure TQExport3DialogF.cbXLSCellTypeChange(Sender: TObject);
begin
  if not (Assigned(tvXLSExtensions.Selected) and
          Assigned(tvXLSExtensions.Selected.Data)) then Exit;

  TxlsCell(tvXLSExtensions.Selected.Data).CellType :=
    TxlsCellType(cbXLSCellType.ItemIndex);

  laXLSCellDateTimeFormat.Enabled :=
    TxlsCell(tvXLSExtensions.Selected.Data).CellType = ctDateTime;
  edXLSCellDateTimeFormat.Enabled := laXLSCellDateTimeFormat.Enabled;
  laXLSCellNumericFormat.Enabled :=
    TxlsCell(tvXLSExtensions.Selected.Data).CellType = ctNumeric;
  edXLSCellNumericFormat.Enabled := laXLSCellNumericFormat.Enabled;
end;

procedure TQExport3DialogF.edXLSCellValueChange(Sender: TObject);
begin
  if not (Assigned(tvXLSExtensions.Selected) and
          Assigned(tvXLSExtensions.Selected.Data)) then Exit;

  TxlsCell(tvXLSExtensions.Selected.Data).Value :=
    edXLSCellValue.Text;
end;

procedure TQExport3DialogF.edXLSCellDateTimeFormatChange(Sender: TObject);
begin
  if not (Assigned(tvXLSExtensions.Selected) and
          Assigned(tvXLSExtensions.Selected.Data)) then Exit;

  TxlsCell(tvXLSExtensions.Selected.Data).DateTimeFormat :=
    edXLSCellDateTimeFormat.Text;
end;

procedure TQExport3DialogF.edXLSCellNumericFormatChange(Sender: TObject);
begin
  if not (Assigned(tvXLSExtensions.Selected) and
          Assigned(tvXLSExtensions.Selected.Data)) then Exit;

  TxlsCell(tvXLSExtensions.Selected.Data).NumericFormat :=
    edXLSCellNumericFormat.Text;
end;

procedure TQExport3DialogF.edXLSMergedCellsFirstColExit(Sender: TObject);
begin
  if not (Assigned(tvXLSExtensions.Selected) and
          Assigned(tvXLSExtensions.Selected.Data)) then Exit;

  TxlsMergedCells(tvXLSExtensions.Selected.Data).FirstCol :=
    StrToIntDef(edXLSMergedCellsFirstCol.Text, 0);
  if IntToStr(TxlsMergedCells(tvXLSExtensions.Selected.Data).FirstCol) <>
       edXLSMergedCellsFirstCol.Text then
    edXLSMergedCellsFirstCol.Text :=
      IntToStr(TxlsMergedCells(tvXLSExtensions.Selected.Data).FirstCol);
end;

procedure TQExport3DialogF.edXLSMergedCellsFirstRowExit(Sender: TObject);
begin
  if not (Assigned(tvXLSExtensions.Selected) and
          Assigned(tvXLSExtensions.Selected.Data)) then Exit;

  TxlsMergedCells(tvXLSExtensions.Selected.Data).FirstRow :=
    StrToIntDef(edXLSMergedCellsFirstRow.Text, 0);
  if IntToStr(TxlsMergedCells(tvXLSExtensions.Selected.Data).FirstRow) <>
       edXLSMergedCellsFirstRow.Text then
    edXLSMergedCellsFirstRow.Text :=
      IntToStr(TxlsMergedCells(tvXLSExtensions.Selected.Data).FirstRow);
end;

procedure TQExport3DialogF.edXLSMergedCellsLastColExit(Sender: TObject);
begin
  if not (Assigned(tvXLSExtensions.Selected) and
          Assigned(tvXLSExtensions.Selected.Data)) then Exit;

  TxlsMergedCells(tvXLSExtensions.Selected.Data).LastCol :=
    StrToIntDef(edXLSMergedCellsLastCol.Text, 0);
  if IntToStr(TxlsMergedCells(tvXLSExtensions.Selected.Data).LastCol) <>
       edXLSMergedCellsLastCol.Text then
    edXLSMergedCellsLastCol.Text :=
      IntToStr(TxlsMergedCells(tvXLSExtensions.Selected.Data).LastCol);
end;

procedure TQExport3DialogF.edXLSMergedCellsLastRowExit(Sender: TObject);
begin
  if not (Assigned(tvXLSExtensions.Selected) and
          Assigned(tvXLSExtensions.Selected.Data)) then Exit;

  TxlsMergedCells(tvXLSExtensions.Selected.Data).LastRow :=
    StrToIntDef(edXLSMergedCellsLastRow.Text, 0);
  if IntToStr(TxlsMergedCells(tvXLSExtensions.Selected.Data).LastRow) <>
       edXLSMergedCellsLastRow.Text then
    edXLSMergedCellsLastRow.Text :=
      IntToStr(TxlsMergedCells(tvXLSExtensions.Selected.Data).LastRow);
end;

procedure TQExport3DialogF.bXLSPageBackgroundClick(Sender: TObject);
begin
  if XLSPageBackground <> EmptyStr then
    opdHTMLBackground.InitialDir := ExtractFileDir(XLSPageBackground);
  if opdHTMLBackground.Execute then
    XLSPageBackground := opdHTMLBackground.FileName;
end;

procedure TQExport3DialogF.edXLSPageBackgroundChange(Sender: TObject);
begin
  XLSPageBackground := edXLSPageBackground.Text;
end;

procedure TQExport3DialogF.pcXLSChange(Sender: TObject);
begin
  if pcXLS.ActivePage = tshXLSDataFormat then begin
    if Assigned(pcXLSCells.ActivePage) then
      FXLSCellsPageIndex := pcXLSCells.ActivePage.PageIndex;
    tshXLSFont.PageControl := pcXLSDataFormat;
    tshXLSFont.PageIndex := 0;
    tshXLSBorders.PageControl := pcXLSDataFormat;
    tshXLSBorders.PageIndex := 1;
    tshXLSFill.PageControl := pcXLSDataFormat;
    tshXLSFill.PageIndex := 2;
    pcXLSDataFormat.ActivePage := pcXLSDataFormat.Pages[FXLSDataFormatPageIndex];

    paXLSSampleCell.Height := 72;
    paXLSSampleCell.Left := 185;
    paXLSSampleCell.Top := 145;
    paXLSSampleCell.Width := 268;
    paXLSSampleCell.Parent := tshXLSDataFormat;

    if CurrXLSListView <> nil then
      lstXLSFieldsChange(CurrXLSListView, CurrXLSListView.ItemFocused, ctState);
  end
  else if pcXLS.ActivePage = tshXLSExtensions then begin
    if Assigned(pcXLSDataFormat.ActivePage) then
      FXLSDataFormatPageIndex := pcXLSDataFormat.ActivePage.PageIndex;
    tshXLSFont.PageControl := pcXLSCells;
    tshXLSFont.PageIndex := 1;
    tshXLSBorders.PageControl := pcXLSCells;
    tshXLSBorders.PageIndex := 2;
    tshXLSFill.PageControl := pcXLSCells;
    tshXLSFill.PageIndex := 3;
    pcXLSCells.ActivePage := pcXLSCells.Pages[FXLSCellsPageIndex];

    pcXLSCellsChange(Sender);

    tvXLSExtensionsChange(Sender, tvXLSExtensions.Selected);
  end;
end;

procedure TQExport3DialogF.pcXLSCellsChange(Sender: TObject);
begin
  if pcXLSCells.ActivePage.PageIndex > 0 then begin
    paXLSSampleCell.Height := 90;
    paXLSSampleCell.Left := 4;
    paXLSSampleCell.Top := 125;
    paXLSSampleCell.Width := 251;
    paXLSSampleCell.Parent := pcXLSCells.ActivePage;
  end;
end;

procedure TQExport3DialogF.FillExportTypeStringArray;
begin
  ExportTypeString[aeXLS] := {$IFDEF WIN32}QExportLoadStr(QED_ExportType_XLS){$ENDIF}
                             {$IFDEF LINUX}QED_ExportType_XLS{$ENDIF};
  ExportTypeString[aeWord] := {$IFDEF WIN32}QExportLoadStr(QED_ExportType_DOC){$ENDIF}
                              {$IFDEF LINUX}QED_ExportType_DOC{$ENDIF};
  ExportTypeString[aeRTF] := {$IFDEF WIN32}QExportLoadStr(QED_ExportType_RTF){$ENDIF}
                             {$IFDEF LINUX}QED_ExportType_RTF{$ENDIF};
  ExportTypeString[aeHTML] := {$IFDEF WIN32}QExportLoadStr(QED_ExportType_HTML){$ENDIF}
                              {$IFDEF LINUX}QED_ExportType_HTML{$ENDIF};
  ExportTypeString[aeXML] := {$IFDEF WIN32}QExportLoadStr(QED_ExportType_XML){$ENDIF}
                             {$IFDEF LINUX}QED_ExportType_XML{$ENDIF};
  ExportTypeString[aeDBF] := {$IFDEF WIN32}QExportLoadStr(QED_ExportType_DBF){$ENDIF}
                             {$IFDEF LINUX}QED_ExportType_DBF{$ENDIF};
  ExportTypeString[aePDF] := {$IFDEF WIN32}QExportLoadStr(QED_ExportType_PDF){$ENDIF}
                             {$IFDEF LINUX}QED_ExportType_PDF{$ENDIF};
  ExportTypeString[aeTXT] := {$IFDEF WIN32}QExportLoadStr(QED_ExportType_TXT){$ENDIF}
                             {$IFDEF LINUX}QED_ExportType_TXT{$ENDIF};
  ExportTypeString[aeCSV] := {$IFDEF WIN32}QExportLoadStr(QED_ExportType_CSV){$ENDIF}
                             {$IFDEF LINUX}QED_ExportType_CSV{$ENDIF};
  ExportTypeString[aeDIFF] := {$IFDEF WIN32}QExportLoadStr(QED_ExportType_DIFF){$ENDIF}
                              {$IFDEF LINUX}QED_ExportType_DIFF{$ENDIF};
  ExportTypeString[aeSylk] := {$IFDEF WIN32}QExportLoadStr(QED_ExportType_SYLK){$ENDIF}
                              {$IFDEF LINUX}QED_ExportType_SYLK{$ENDIF};
  ExportTypeString[aeLaTeX] := {$IFDEF WIN32}QExportLoadStr(QED_ExportType_LaTeX){$ENDIF}
                               {$IFDEF LINUX}QED_ExportType_LaTeX{$ENDIF};
  ExportTypeString[aeSQL] := {$IFDEF WIN32}QExportLoadStr(QED_ExportType_SQL){$ENDIF}
                             {$IFDEF LINUX}QED_ExportType_SQL{$ENDIF};
  ExportTypeString[aeClipboard] := {$IFDEF WIN32}QExportLoadStr(QED_ExportType_Clipboard){$ENDIF}
                                   {$IFDEF LINUX}QED_ExportType_Clipboard{$ENDIF};
end;

procedure TQExport3DialogF.FillExportTypeFilterArray;
begin
  ExportTypeFilter[aeXLS] := {$IFDEF WIN32}QExportLoadStr(SMSExcelFilter){$ENDIF}
                             {$IFDEF LINUX}SMSExcelFilter{$ENDIF};
  ExportTypeFilter[aeWord] := {$IFDEF WIN32}QExportLoadStr(SMSWordFilter){$ENDIF}
                              {$IFDEF LINUX}SMSWordFilter{$ENDIF};
  ExportTypeFilter[aeRTF] := {$IFDEF WIN32}QExportLoadStr(SRTFFilter){$ENDIF}
                             {$IFDEF LINUX}SRTFFilter{$ENDIF};
  ExportTypeFilter[aeHTML]:= {$IFDEF WIN32}QExportLoadStr(SHTMLFilter){$ENDIF}
                             {$IFDEF LINUX}SHTMLFilter{$ENDIF};
  ExportTypeFilter[aeXML] := {$IFDEF WIN32}QExportLoadStr(SXMLFilter){$ENDIF}
                             {$IFDEF LINUX}SXMLFilter{$ENDIF};
  ExportTypeFilter[aeDBF] := {$IFDEF WIN32}QExportLoadStr(SDBFFilter){$ENDIF}
                             {$IFDEF LINUX}SDBFFilter{$ENDIF};
  ExportTypeFilter[aePDF] := {$IFDEF WIN32}QExportLoadStr(SPDFFilter){$ENDIF}
                             {$IFDEF LINUX}SPDFFilter{$ENDIF};
  ExportTypeFilter[aeTXT] := {$IFDEF WIN32}QExportLoadStr(STextFilter){$ENDIF}
                             {$IFDEF LINUX}STextFilter{$ENDIF};
  ExportTypeFilter[aeCSV] := {$IFDEF WIN32}QExportLoadStr(SCSVFilter){$ENDIF}
                             {$IFDEF LINUX}SCSVFilter{$ENDIF};
  ExportTypeFilter[aeDIFF] := {$IFDEF WIN32}QExportLoadStr(SDIFFFilter){$ENDIF}
                              {$IFDEF LINUX}SDIFFFilter{$ENDIF};
  ExportTypeFilter[aeSylk] := {$IFDEF WIN32}QExportLoadStr(SSYLKFilter){$ENDIF}
                              {$IFDEF LINUX}SSYLKFilter{$ENDIF};
  ExportTypeFilter[aeLaTeX] := {$IFDEF WIN32}QExportLoadStr(SLaTeXFilter){$ENDIF}
                               {$IFDEF LINUX}SLaTeXFilter{$ENDIF};
  ExportTypeFilter[aeSQL] := {$IFDEF WIN32}QExportLoadStr(SSQLFilter){$ENDIF}
                             {$IFDEF LINUX}SSQLFilter{$ENDIF};
  ExportTypeFilter[aeClipboard] := '';
end;

procedure TQExport3DialogF.Loaded;
begin
  inherited;
{$IFDEF VCL9}
  PopupMode := pmAuto
{$ENDIF}
end;



end.
