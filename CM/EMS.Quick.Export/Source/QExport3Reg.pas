unit QExport3Reg;

{$I VerCtrl.inc}

interface

uses
  Classes, QExport3, QExport3ASCII, QExport3HTML, QExport3RTF, QExport3XLS,
  QExport3LaTeX, QExport3XML, QExport3SQL, {$IFNDEF NOGUI}QExport3Clipboard,{$ENDIF}
  QExport3DBF, QExport3PDF, QExport3CustomSource
  {$IFDEF WIN32}
    {$IFNDEF NOGUI}, QExport3Dialog, QExport3Dsgn{$ENDIF}
    {$IFDEF VCL6}
      {$IFNDEF NOGUI}, DesignIntf, VCLEditors{$ENDIF}
    {$ELSE}
      {$IFNDEF NOGUI}, DsgnIntf{$ENDIF}
    {$ENDIF}
  {$ENDIF}

  {$IFDEF LINUX}
    //, DesignIntF
  {$ENDIF};

procedure Register;

implementation

uses QExport3Common;

{$R *.dcr}

procedure Register;
begin
  RegisterComponents(S_COMPONENT_PAGE,
    [{$IFDEF WIN32}{$IFNDEF NOGUI}TQExport3Dialog,{$ENDIF}{$ENDIF}
     TqeCustomSource,
     TQExport3XLS,
     TQExport3RTF,
     TQExport3HTML,
     TQExport3XML,
     TQExport3DBF,
     TQExport3PDF,
     TQExport3ASCII,
     TQExport3SQL,
     TQExport3LaTeX
     {$IFNDEF NOGUI},TQExport3Clipboard{$ENDIF}]);

  {$IFDEF WIN32}
  {$IFNDEF NOGUI}
  RegisterPropertyEditor(TypeInfo(THTMLTemplate), TQExport3HTML, 'HTMLTemplate',
     TQHTMLTemplateProperty);
  RegisterPropertyEditor(TypeInfo(string), TQExportFormats, 'DateTimeFormat',
    TQDateTimeFormatProperty);
  RegisterPropertyEditor(TypeInfo(string), TQExportFormats, 'DateFormat',
    TQDateFormatProperty);
  RegisterPropertyEditor(TypeInfo(string), TQExportFormats, 'TimeFormat',
    TQTimeFormatProperty);

  RegisterPropertyEditor(TypeInfo(string), TQExport3XLS, 'FileName',
    TQExcelFileNameProperty);
  RegisterPropertyEditor(TypeInfo(string), TQExport3RTF, 'FileName',
    TQRTFFileNameProperty);
  RegisterPropertyEditor(TypeInfo(string), TQExport3HTML, 'FileName',
    TQHTMLFileNameProperty);
  RegisterPropertyEditor(TypeInfo(string), TQExport3HTML, 'CSSFileName',
    TQCSSFileNameProperty);
  RegisterPropertyEditor(TypeInfo(string), TQExport3LaTeX, 'FileName',
    TQLaTeXFileNameProperty);
  RegisterPropertyEditor(TypeInfo(string), TQExport3ASCII, 'FileName',
    TQASCIIFileNameProperty);
  RegisterPropertyEditor(TypeInfo(string), TQExport3SQL, 'FileName',
    TQSQLFileNameProperty);
  RegisterPropertyEditor(TypeInfo(string), TQExport3Clipboard, 'ClipboardViewer',
    TQAppFileNameProperty);
  RegisterPropertyEditor(TypeInfo(string), TQExport3XML, 'FileName',
    TQXMLFileNameProperty);
  RegisterPropertyEditor(TypeInfo(string), TQExport3DBF, 'FileName',
    TQDBFFileNameProperty);
  RegisterPropertyEditor(TypeInfo(string), TQExport3Dialog, 'OptionsFileName',
    TQCFGFileNameProperty);
  RegisterPropertyEditor(TypeInfo(string), TQExport3PDF, 'FileName',
    TQPDFFileNameProperty);
  RegisterPropertyEditor(TypeInfo(string), TxlsGraphic, 'FileName',
    TQPictureFileNameProperty);

  RegisterPropertyEditor(TypeInfo(string), TQExport3, 'About',
    TQExportAboutProperty);
  RegisterPropertyEditor(TypeInfo(string), TQExport3, '_Version',
    TQExportVersionProperty);
  RegisterPropertyEditor(TypeInfo(string), TQExport3Dialog, 'About',
    TQExportAboutProperty);
  RegisterPropertyEditor(TypeInfo(string), TQExport3Dialog, '_Version',
    TQExportVersionProperty);

  RegisterPropertyEditor(TypeInfo(string), TxlsFieldFormat, 'FieldName',
    TQExcelFieldNameProperty);

  RegisterPropertyEditor(TypeInfo(string), TxlsImage, 'PictureName',
    TQExcelPictureNameProperty);

  RegisterPropertyEditor(TypeInfo(WideString), TxlsFont, 'Name',
    TFontNameProperty);

  RegisterPropertyEditor(TypeInfo(TxlsColor), TPersistent, '', TxlsColorProperty);


  RegisterComponentEditor(TQExport3, TQExportEditor);
  RegisterComponentEditor(TQExport3Dialog, TQExportEditor);
  RegisterComponentEditor(TQExport3HTML, TQExportHTMLEditor);
  RegisterComponentEditor(TQExport3XLS, TQExportXLSEditor);
  {$ENDIF}
  {$ENDIF}
end;


end.
