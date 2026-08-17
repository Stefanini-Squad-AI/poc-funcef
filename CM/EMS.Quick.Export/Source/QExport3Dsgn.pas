unit QExport3Dsgn;

{$I VerCtrl.inc}

interface

uses Classes, Controls, Graphics, Windows
  {$IFDEF VCL6}, DesignIntf, DesignEditors, VCLEditors{$ELSE}, DsgnIntf{$ENDIF};

type

  TQExportEditor = class(TDefaultEditor)
  public
    function GetVerbCount: integer; override;
    function GetVerb(Index: integer): string; override;
    procedure ExecuteVerb(Index: integer); override;
    procedure Edit; override;
  end;

  TQExportHTMLEditor = class(TQExportEditor)
  protected
  {$IFDEF VCL6}
  procedure EditProperty(const Prop: IProperty; var Continue: Boolean);
    override;
  {$ELSE}
  procedure EditProperty(PropertyEditor: TPropertyEditor;
    var Continue, FreeEditor: boolean); override;
  {$ENDIF}
  public
    function GetVerbCount: integer; override;
    function GetVerb(Index: integer): string; override;
    procedure ExecuteVerb(Index: integer); override;
    procedure Edit; override;
  end;

  TQExportXLSEditor = class(TDefaultEditor)
    function GetVerbCount: integer; override;
    function GetVerb(Index: integer): string; override;
    procedure ExecuteVerb(Index: integer); override;
    procedure Edit; override;
  end;

  TQHTMLTemplateProperty = class(TEnumProperty)
  public
    procedure Edit; override;
  end;

  TQDateTimeFormatProperty = class(TStringProperty)
  public
    function GetAttributes: TPropertyAttributes; override;
    procedure GetValues(Proc: TGetStrProc); override;
  end;

  TQDateFormatProperty = class(TQDateTimeFormatProperty)
  public
    procedure GetValues(Proc: TGetStrProc); override;
  end;

  TQTimeFormatProperty = class(TQDateTimeFormatProperty)
  public
    procedure GetValues(Proc: TGetStrProc); override;
  end;

  TQFileNameProperty = class(TStringProperty)
  protected
    function GetFilter: string; virtual; abstract;
    function GetDefaultExt: string; virtual; abstract;
  public
    procedure Edit; override;
    function GetAttributes: TPropertyAttributes; override;
  end;

  TxlsColorProperty = class(TIntegerProperty
  {$IFDEF VCL6}, ICustomPropertyDrawing, ICustomPropertyListDrawing{$ENDIF})
  public
    procedure Edit; override;
    function GetAttributes: TPropertyAttributes; override;
    function GetValue: string; override;
    procedure GetValues(Proc: TGetStrProc); override;
    procedure SetValue(const Value: string); override;

    { ICustomPropertyListDrawing }
    {$IFDEF VCL5}
    procedure ListMeasureWidth(const Value: string; ACanvas: TCanvas;
      var AWidth: Integer); {$IFNDEF VCL6}override;{$ENDIF}
    {$ENDIF}
    {$IFDEF VCL6}
    procedure ListMeasureHeight(const Value: string; ACanvas: TCanvas;
      var AHeight: Integer);
    {$ENDIF}
    {$IFDEF VCL5}
    procedure ListDrawValue(const Value: string; ACanvas: TCanvas;
      const ARect: TRect; ASelected: Boolean); {$IFNDEF VCL6}override;{$ENDIF}
    {$ENDIF}

    { CustomPropertyDrawing }
    {$IFDEF VCL6}
    procedure PropDrawName(ACanvas: TCanvas; const ARect: TRect;
      ASelected: Boolean);
    {$ENDIF}
    {$IFDEF VCL5}
    procedure PropDrawValue(ACanvas: TCanvas; const ARect: TRect;
      ASelected: Boolean); {$IFNDEF VCL6}override;{$ENDIF}
    {$ENDIF}
  end;

  TQExcelFileNameProperty = class(TQFileNameProperty)
  protected
    function GetFilter: string; override;
    function GetDefaultExt: string; override;
  end;

  TQRTFFileNameProperty = class(TQFileNameProperty)
  protected
    function GetFilter: string; override;
    function GetDefaultExt: string; override;
  end;

  TQHTMLFileNameProperty = class(TQFileNameProperty)
  protected
    function GetFilter: string; override;
    function GetDefaultExt: string; override;
  end;

  TQLaTeXFileNameProperty = class(TQFileNameProperty)
  protected
    function GetFilter: string; override;
    function GetDefaultExt: string; override;
  end;

  TQASCIIFileNameProperty = class(TQFileNameProperty)
  protected
    function GetFilter: string; override;
    function GetDefaultExt: string; override;
  end;

  TQCSSFileNameProperty = class(TQFileNameProperty)
  protected
    function GetFilter: string; override;
    function GetDefaultExt: string; override;
  end;

  TQSQLFileNameProperty = class(TQFileNameProperty)
  protected
    function GetFilter: string; override;
    function GetDefaultExt: string; override;
  end;

  TQAppFileNameProperty = class(TQFileNameProperty)
  protected
    function GetFilter: string; override;
    function GetDefaultExt: string; override;
  end;

  TQXMLFileNameProperty = class(TQFileNameProperty)
  protected
    function GetFilter: string; override;
    function GetDefaultExt: string; override;
  end;

  TQDBFFileNameProperty = class(TQFileNameProperty)
  protected
    function GetFilter: string; override;
    function GetDefaultExt: string; override;
  end;

  TQCFGFileNameProperty = class(TQFileNameProperty)
  protected
    function GetFilter: string; override;
    function GetDefaultExt: string; override;
  end;

  TQPDFFileNameProperty = class(TQFileNameProperty)
  protected
    function GetFilter: string; override;
    function GetDefaultExt: string; override;
  end;

  TQPictureFileNameProperty = class(TQFileNameProperty)
  protected
    function GetFilter: string; override;
    function GetDefaultExt: string; override;
  end;

  TQExportAboutProperty = class(TStringProperty)
  public
    function GetAttributes: TPropertyAttributes; override;
    function GetValue: string; override;
    procedure Edit; override;
  end;

  TQExportVersionProperty = class(TStringProperty)
  public
    function GetAttributes: TPropertyAttributes; override;
    function GetValue: string; override;
    procedure Edit; override;
  end;

  TQExcelFieldNameProperty = class(TStringProperty)
  public
    function GetAttributes: TPropertyAttributes; override;
    procedure GetValues(Proc: TGetStrProc); override;
  end;

  TQExcelPictureNameProperty = class(TStringProperty)
  public
    function GetAttributes: TPropertyAttributes; override;
    procedure GetValues(Proc: TGetStrProc); override;
  end;

implementation

uses SysUtils, QExport3, QExport3HTML, QExport3ASCII, QExport3XLS, QExport3Dialog,
     QExport3Common, Db, DBGrids, ComCtrls, Grids, QExport3XLSCommon
     {$IFDEF WIN32}
       , Dialogs, fuQExport3About, fuQExport3HTMLTemplateEditor,
         fuQExport3ColumnsEditor, fuQExport3XLSEditor, TypInfo,
         fuQExport3XLSColorEditor
       {$IFDEF VCL3}
         //, ToolsAPI
       {$ENDIF}
     {$ENDIF}
     {$IFDEF LINUX}
         , QDialogs, QExport3About_KLX, QExport3HTMLTemplateEditor_KLX,
         QExport3FieldsEditor_KLX, QExport3XLSFieldFormatEditor_KLX
     {$ENDIF};

function GetObjDelimiter: string;
begin
{$IFDEF BCB}
  Result := '->'
{$ELSE}
  Result := '.';
{$ENDIF}
end;

{ TQExportEditor }

procedure TQExportEditor.Edit;
begin
  inherited;
end;

procedure TQExportEditor.ExecuteVerb(Index: integer);
var
  FExport: TQExport3;
  FDialog: TQExport3Dialog;
begin
  case Index of
    0: begin
      FExport := nil;
      FDialog := nil;
      if Component is TQExport3
        then FExport := Component as TQExport3
        else if Component is TQExport3Dialog
               then FDialog := Component as TQExport3Dialog;

      if Assigned(FExport) then begin
        with FExport do
          if RunQExportColumnsEditor(ExportSource, DataSet, CustomSource, DBGrid,
            ListView, StringGrid, ExportedFields)
            then Designer.Modified
      end else begin
        if Assigned(FDialog) then
          with FDialog do
            if RunQExportColumnsEditor(ExportSource, DataSet, CustomSource, DBGrid,
                 ListView, StringGrid, ExportedFields)
              then Designer.Modified
      end;
    end;
    1: ShowAboutForm;
  end;
end;

function TQExportEditor.GetVerb(Index: integer): string;
begin
  case Index of
    0: Result := 'F&ields editor...';
    1: Result := '&About EMS QuickExport...';
  end;
end;

function TQExportEditor.GetVerbCount: integer;
begin
  Result := 2;
end;

{ TVHTMLTemplateProperty }

procedure TQHTMLTemplateProperty.Edit;
var
  QHE: TQExport3HTML;
  HT: THTMLTemplate;
begin
  QHE := GetComponent(0) as TQExport3HTML;
  with TfmQExport3HTMLTemplateEditor.Create(nil) do begin
    try
      Caption := Format('%s%s%s -- HTML Template Editor', [QHE.Owner.Name,
        GetObjDelimiter, QHE.Name]);
      HT := THTMLTemplate(GetOrdValue);
      Template := HT;
      if HT = htCustom then begin
        BackGroundColor := QHE.HTMLOptions.BackgroundColor;
        DefaultTextColor := QHE.HTMLOptions.TextFont.Color;
        LinkColor := QHE.HTMLOptions.LinkColor;
        VLinkColor := QHE.HTMLOptions.VLinkColor;
        ALinkColor := QHE.HTMLOptions.ALinkColor;
        TextFontName := QHE.HTMLOptions.TextFont.Name;
        HeadersRowBgColor := QHE.TableOptions.HeadersRowBgColor;
        HeadersRowFontColor := QHE.TableOptions.HeadersRowFontColor;
        TableBgColor := QHE.TableOptions.TableBgColor;
        TableFontColor := QHE.TableOptions.TableFontColor;
        OddRowBgColor := QHE.TableOptions.OddRowBgColor;
      end;
      if ShowModal = mrOk then begin
        SetOrdValue(Integer(Template));
        if Template = htCustom then begin
          QHE.HTMLOptions.BackGroundColor := BackgroundColor;
          QHE.HTMLOptions.TextFont.Color := DefaultTextColor;
          QHE.HTMLOptions.LinkColor := LinkColor;
          QHE.HTMLOptions.VLinkColor := VLinkColor;
          QHE.HTMLOptions.ALinkColor := ALinkColor;
          QHE.HTMLOptions.TextFont.Name := TextFontName;
          QHE.TableOptions.HeadersRowBgColor := HeadersRowBgColor;
          QHE.TableOptions.HeadersRowFontColor := HeadersRowFontColor;
          QHE.TableOptions.TableBgColor := TableBgColor;
          QHE.TableOptions.TableFontColor := TableFontColor;
          QHE.TableOptions.OddRowBgColor := OddRowBgColor;
        end;
      end;
    finally
      Free;
    end;
  end;
end;

{ TQDateTimeFormatProperty }

function TQDateTimeFormatProperty.GetAttributes: TPropertyAttributes;
begin
  Result := inherited GetAttributes + [paValueList];
end;

procedure TQDateTimeFormatProperty.GetValues(Proc: TGetStrProc);
begin
  Proc(ShortDateFormat + ' ' + ShortTimeFormat);
  Proc(ShortDateFormat + ' ' + LongTimeFormat);
  Proc(LongDateFormat + ' ' +  ShortTimeFormat);
  Proc(LongDateFormat + ' ' +  LongTimeFormat);
  Proc(ShortDateFormat);
  Proc(LongDateFormat);
  Proc(ShortTimeFormat);
  Proc(LongTimeFormat);
end;

{ TQDateFormatProperty }

procedure TQDateFormatProperty.GetValues(Proc: TGetStrProc);
begin
  Proc(ShortDateFormat);
  Proc(LongDateFormat);
end;

{ TQTimeFormatProperty }

procedure TQTimeFormatProperty.GetValues(Proc: TGetStrProc);
begin
  Proc(ShortTimeFormat);
  Proc(LongTimeFormat);
end;

{ TQHTMLExportEdtor }

function TQExportHTMLEditor.GetVerbCount: integer;
begin
  Result := 3;
end;

function TQExportHTMLEditor.GetVerb(Index: integer): string;
begin
  case Index of
   2: Result := 'Edit HTML template...';
   else
     Result:= inherited GetVerb(Index);
  end;
end;

procedure TQExportHTMLEditor.ExecuteVerb(Index: integer);
begin
  case Index of
    2: Edit
    else inherited ExecuteVerb(Index);
  end;
end;

procedure TQExportHTMLEditor.Edit;
begin
  inherited;
end;

{$IFDEF VCL6}
procedure TQExportHTMLEditor.EditProperty(const Prop: IProperty; var Continue: Boolean);
begin
  if CompareText(Prop.GetName, 'HTMLTemplate') = 0 then begin
    Prop.Edit;
    Continue := False;
  end;
end;
{$ELSE}
procedure TQExportHTMLEditor.EditProperty(PropertyEditor: TPropertyEditor;
  var Continue, FreeEditor: boolean);
begin
  if CompareText(PropertyEditor.GetName, 'HTMLTemplate') = 0 then begin
    PropertyEditor.Edit;
    Continue := false;
  end;
end;
{$ENDIF}

{ TQXLSExportEdtor }

function TQExportXLSEditor.GetVerbCount: integer;
begin
  Result := 2;
end;

function TQExportXLSEditor.GetVerb(Index: integer): string;
begin
  case Index of
    0: Result := 'Component editor...';
    1: Result := '&About EMS QuickExport...';
  end;
end;

procedure TQExportXLSEditor.ExecuteVerb(Index: integer);
begin
  case Index of
    0: if RunQExportXLSEditor(Component as TQExport3XLS, Designer)
         then Designer.Modified;
    1: ShowAboutForm;
  end;
end;

procedure TQExportXLSEditor.Edit;
begin
  ExecuteVerb(0);
end;

{ TQFileNameProperty }

procedure TQFileNameProperty.Edit;
var
  OpenDialog: TOpenDialog;
begin
  OpenDialog := TOpenDialog.Create(nil);
  try
    OpenDialog.Filter := GetFilter;
    OpenDialog.DefaultExt := GetDefaultExt;
    OpenDialog.FileName := GetStrValue;
    if OpenDialog.Execute then
      SetStrValue(OpenDialog.FileName);
  finally
    OpenDialog.Free;
  end;
end;

function TQFileNameProperty.GetAttributes: TPropertyAttributes;
begin
  Result := inherited GetAttributes + [paDialog];
end;

{ TQExcelFileNameProperty }

function TQExcelFileNameProperty.GetDefaultExt: string;
begin
  Result := 'xls';
end;

function TQExcelFileNameProperty.GetFilter: string;
begin
  Result := 'Microsoft Excel files (*.xls)|*.xls';
end;

{ TVRTFFileNameProperty }

function TQRTFFileNameProperty.GetDefaultExt: string;
begin
  Result := 'doc';
end;

function TQRTFFileNameProperty.GetFilter: string;
begin
  Result := 'Microsoft Word files (*.doc)|*.doc|RTF files (*.rtf)|*.rtf'
end;

{ TQHTMLFileNameProperty }

function TQHTMLFileNameProperty.GetDefaultExt: string;
begin
  Result := 'html';
end;

function TQHTMLFileNameProperty.GetFilter: string;
begin
  Result := 'HTML files (*.html, *.htm)|*.html;*.htm';
end;

{ TQLaTeXFileNameProperty }

function TQLaTeXFileNameProperty.GetDefaultExt: string;
begin
  Result := 'tex';
end;

function TQLaTeXFileNameProperty.GetFilter: string;
begin
  Result := 'LaTeX files (*.tex)|*.tex';
end;

{ TQASCIIFileNameProperty }

function TQASCIIFileNameProperty.GetDefaultExt: string;
var
  QExport: TQExport3ASCII;
begin
  QExport := GetComponent(0) as TQExport3ASCII;
  case QExport.ExportType of
    etTxt:  Result := 'txt';
    etCSV:  Result := 'csv';
    etDIF:  Result := 'dif';
    etSYLK: Result := 'slk';
  end;
end;

function TQASCIIFileNameProperty.GetFilter: string;
var
  QExport: TQExport3ASCII;
begin
  QExport := GetComponent(0) as TQExport3ASCII;
  case QExport.ExportType of
    etTxt:  Result := 'Text files (*.txt)|*.txt';
    etCSV:  Result := 'CSV files (*.csv)|*.csv';
    etDIF:  Result := 'DIF files (*.dif)|*.dif';
    etSYLK: Result := 'SYLK files (*.slk)|*.slk';
  end;
end;

{ TQCSSFileNameProperty }

function TQCSSFileNameProperty.GetDefaultExt: string;
begin
  Result := 'css';
end;

function TQCSSFileNameProperty.GetFilter: string;
begin
  Result := 'Cascading style sheets files (*.css)|*.css';
end;

{ TQSQLFileNameProperty }

function TQSQLFileNameProperty.GetDefaultExt: string;
begin
  Result := 'sql';
end;

function TQSQLFileNameProperty.GetFilter: string;
begin
  Result := 'SQL files (*.sql)|*.sql';
end;

{ TQAppFileNameProperty }

function TQAppFileNameProperty.GetDefaultExt: string;
begin
  Result := 'exe';
end;

function TQAppFileNameProperty.GetFilter: string;
begin
  Result := 'Executable files (*.exe)|*.exe';
end;

{ TQXMLFileNameProperty }

function TQXMLFileNameProperty.GetDefaultExt: string;
begin
  Result := 'xml';
end;

function TQXMLFileNameProperty.GetFilter: string;
begin
  Result := 'XML files (*.xml)|*.xml';
end;

{ TQDBFFileNameProperty }

function TQDBFFileNameProperty.GetDefaultExt: string;
begin
  Result := 'dbf';
end;

function TQDBFFileNameProperty.GetFilter: string;
begin
  Result := 'DBF files (*.dbf)|*.dbf';
end;

{ TQCFGFileNameProperty }

function TQCFGFileNameProperty.GetDefaultExt: string;
begin
  Result := 'cfg';
end;

function TQCFGFileNameProperty.GetFilter: string;
begin
  Result := 'Configurations files (*.cfg)|*.cfg';
end;

{ TQPDFFileNameProperty }

function TQPDFFileNameProperty.GetDefaultExt: string;
begin
  Result := 'pdf';
end;

function TQPDFFileNameProperty.GetFilter: string;
begin
  Result := 'PDF Document files (*.pdf)|*.pdf';
end;

{ TQPictureFileNameProperty }

function TQPictureFileNameProperty.GetDefaultExt: string;
begin
  Result := 'bmp';
end;

function TQPictureFileNameProperty.GetFilter: string;
begin
  Result := 'All Images (*.bmp;*.wmf;*.emf;*.jpg;*.jpeg;*.png;*.gif)|' +
            '*.bmp;*.wmf;*.emf;*.jpg;*.jpeg;*.png;*.gif|' +
            'Bitmaps (*.bmp)|*.bmp|' +
            'Metafiles (*.wmf)|*.wmf|' +
            'Enhanced Metafiles (*.emf)|*.emf|' +
            'JPEG Image File (*.jpg)|*.jpg|' +
            'JPEG Image File (*.jpeg)|*.jpeg|' +
            'PNG Image (*.png)|*.png|' +
            'GIF Image (*.gif)|*.gif';
end;

{ TQExportAboutProperty }

procedure TQExportAboutProperty.Edit;
begin
  ShowAboutForm;
end;

function TQExportAboutProperty.GetAttributes: TPropertyAttributes;
begin
  Result := [paReadOnly, paDialog];
end;

function TQExportAboutProperty.GetValue: string;
begin
  Result := S_ABOUT;
end;

{ TQExportVersionProperty }

procedure TQExportVersionProperty.Edit;
begin
  ShowAboutForm;
end;

function TQExportVersionProperty.GetAttributes: TPropertyAttributes;
begin
  Result := [paReadOnly, paDialog];
end;

function TQExportVersionProperty.GetValue: string;
begin
  Result := S_VERSION;
end;

{ TQExcelFieldNameProperty }

function TQExcelFieldNameProperty.GetAttributes: TPropertyAttributes;
begin
  Result := [paValueList]
end;

procedure TQExcelFieldNameProperty.GetValues(Proc: TGetStrProc);
var
  WasInActive: Boolean;
  Holder: TPersistent;
  i: Integer;
  PropInfo: PPropInfo;
  ExportSource: TQExportSource;
  DataSet: TDataSet;
  DBGrid: TDBGrid;
  ListView: TListView;
  StringGrid: TStringGrid;
begin
  Holder := (((GetComponent(0) as TxlsFieldFormat).Collection as TxlsFieldFormats).Holder);

  PropInfo := TypInfo.GetPropInfo(Holder.ClassInfo, 'ExportSource');
  if not Assigned(PropInfo) then Exit;

  ExportSource := TQExportSource(TypInfo.GetOrdProp(Holder, PropInfo));

  case ExportSource of
    esDataSet: begin
      PropInfo := TypInfo.GetPropInfo(Holder.ClassInfo, 'DataSet');
      if not Assigned(PropInfo) then Exit;
      DataSet := TDataSet(TypInfo.GetOrdProp(Holder, PropInfo));
      if not Assigned(DataSet) then Exit;

      WasInActive :=  not Dataset.Active;
      if WasInActive then
      try
        Dataset.Open;
      except
        Exit;
      end;
      for i := 0 to DataSet.FieldCount - 1 do begin
        Proc(DataSet.Fields[I].FieldName);
      end;
      if WasInActive then
      try
        Dataset.Close;
      except
      end;
    end; //esDataSet
    esDBGrid: begin
      PropInfo := TypInfo.GetPropInfo(Holder.ClassInfo, 'DBGrid');
      if not Assigned(PropInfo) then Exit;
      DBGrid := TDBGrid(TypInfo.GetOrdProp(Holder, PropInfo));
      if not Assigned(DBGrid) then Exit;

      if DBGrid.Columns.Count > 0 then begin
        for i := 0 to DBGrid.Columns.Count - 1 do begin
          Proc(DBGrid.Columns[i].Title.Caption);
        end;
      end
      else if Assigned(DBGrid.DataSource) and
              Assigned(DBGrid.DataSource.DataSet) then begin
        DataSet := DBGrid.DataSource.DataSet;
        WasInActive :=  not Dataset.Active;
        if WasInActive then
        try
          Dataset.Open;
        except
          Exit;
        end;
        for i := 0 to DataSet.FieldCount - 1 do begin
          Proc(DataSet.Fields[I].FieldName);
        end;
        if WasInActive then
        try
          Dataset.Close;
        except
        end;
        end;
    end; //esDBGrid
    esListView: begin
      PropInfo := TypInfo.GetPropInfo(Holder.ClassInfo, 'ListView');
      if not Assigned(PropInfo) then Exit;
      ListView := TListView(TypInfo.GetOrdProp(Holder, PropInfo));
      if not Assigned(ListView) then Exit;

      for i := 0 to ListView.Columns.Count - 1 do begin
        Proc(ListView.Columns[i].Caption);
      end;
    end;//esListView
    esStringGrid: begin
      PropInfo := TypInfo.GetPropInfo(Holder.ClassInfo, 'StringGrid');
      if not Assigned(PropInfo) then Exit;
      StringGrid := TStringGrid(TypInfo.GetOrdProp(Holder, PropInfo));
      if not Assigned(StringGrid) then Exit;

      for i := 0 to StringGrid.ColCount - 1 do begin
        Proc(IntToStr(i));
      end;
    end;//esStringGrid;
  end;
end;

{ TQExcelPictureNameProperty }

function TQExcelPictureNameProperty.GetAttributes: TPropertyAttributes;
begin
  Result := [paValueList]
end;

procedure TQExcelPictureNameProperty.GetValues(Proc: TGetStrProc);
var
//  WasInActive: Boolean;
  Holder: TPersistent;
  i: integer;
  PropInfo: PPropInfo;
//  ExportSource: TQExportSource;
//  DataSet: TDataSet;
//  DBGrid: TDBGrid;
//  ListView: TListView;
//  StringGrid: TStringGrid;
  Pictures: TxlsPictures;
begin
  Holder := (((GetComponent(0) as TxlsImage).Collection as TxlsImages).Holder);

  if Holder is TxlsSheet then
    Holder := ((Holder as TxlsSheet).Collection as TxlsSheets).QExportXLS;

  PropInfo := TypInfo.GetPropInfo(Holder.ClassInfo, 'Pictures');
  if not Assigned(PropInfo) then Exit;

  Pictures := TxlsPictures(TypInfo.GetOrdProp(Holder, PropInfo));
  for i := 0 to Pictures.Count - 1 do
    Proc(Pictures[i].Name);
{  ExportSource := TQExportSource(TypInfo.GetOrdProp(Holder, PropInfo));

  case ExportSource of
    esDataSet: begin
      PropInfo := TypInfo.GetPropInfo(Holder.ClassInfo, 'DataSet');
      if not Assigned(PropInfo) then Exit;
      DataSet := TDataSet(TypInfo.GetOrdProp(Holder, PropInfo));
      if not Assigned(DataSet) then Exit;

      WasInActive :=  not Dataset.Active;
      if WasInActive then
      try
        Dataset.Open;
      except
        Exit;
      end;
      for i := 0 to DataSet.FieldCount - 1 do begin
        Proc(DataSet.Fields[I].FieldName);
      end;
      if WasInActive then
      try
        Dataset.Close;
      except
      end;
    end; //esDataSet
    esDBGrid: begin
      PropInfo := TypInfo.GetPropInfo(Holder.ClassInfo, 'DBGrid');
      if not Assigned(PropInfo) then Exit;
      DBGrid := TDBGrid(TypInfo.GetOrdProp(Holder, PropInfo));
      if not Assigned(DBGrid) then Exit;

      if DBGrid.Columns.Count > 0 then begin
        for i := 0 to DBGrid.Columns.Count - 1 do begin
          Proc(DBGrid.Columns[i].Title.Caption);
        end;
      end
      else if Assigned(DBGrid.DataSource) and
              Assigned(DBGrid.DataSource.DataSet) then begin
        DataSet := DBGrid.DataSource.DataSet;
        WasInActive :=  not Dataset.Active;
        if WasInActive then
        try
          Dataset.Open;
        except
          Exit;
        end;
        for i := 0 to DataSet.FieldCount - 1 do begin
          Proc(DataSet.Fields[I].FieldName);
        end;
        if WasInActive then
        try
          Dataset.Close;
        except
        end;
        end;
    end; //esDBGrid
    esListView: begin
      PropInfo := TypInfo.GetPropInfo(Holder.ClassInfo, 'ListView');
      if not Assigned(PropInfo) then Exit;
      ListView := TListView(TypInfo.GetOrdProp(Holder, PropInfo));
      if not Assigned(ListView) then Exit;

      for i := 0 to ListView.Columns.Count - 1 do begin
        Proc(ListView.Columns[i].Caption);
      end;
    end;//esListView
    esStringGrid: begin
      PropInfo := TypInfo.GetPropInfo(Holder.ClassInfo, 'StringGrid');
      if not Assigned(PropInfo) then Exit;
      StringGrid := TStringGrid(TypInfo.GetOrdProp(Holder, PropInfo));
      if not Assigned(StringGrid) then Exit;

      for i := 0 to StringGrid.ColCount - 1 do begin
        Proc(IntToStr(i));
      end;
    end;//esStringGrid;
  end;}
end;

{ TxlsColorProperty }

const
  xlsColors: array[0..39] of TIdentMapEntry = (
    (Value: Integer(clrBlack); Name: 'clrBlack'),
    (Value: Integer(clrBrown); Name: 'clrBrown'),
    (Value: Integer(clrOliveGreen); Name: 'clrOliveGreen'),
    (Value: Integer(clrDarkGreen); Name: 'clrDarkGreen'),
    (Value: Integer(clrDarkTeal); Name: 'clrDarkTeal'),
    (Value: Integer(clrDarkBlue); Name: 'clrDarkBlue'),
    (Value: Integer(clrIndigo); Name: 'clrIndigo'),
    (Value: Integer(clrGray80Percent); Name: 'clrGray80Percent'),
    (Value: Integer(clrDarkRed); Name: 'clrDarkRed'),
    (Value: Integer(clrOrange); Name: 'clrOrange'),
    (Value: Integer(clrDarkYellow); Name: 'clrDarkYellow'),
    (Value: Integer(clrGreen); Name: 'clrGreen'),
    (Value: Integer(clrTeal); Name: 'clrTeal'),
    (Value: Integer(clrBlue); Name: 'clrBlue'),
    (Value: Integer(clrBlueGray); Name: 'clrBlueGray'),
    (Value: Integer(clrGray50Percent); Name: 'clrGray50Percent'),
    (Value: Integer(clrRed); Name: 'clrRed'),
    (Value: Integer(clrLightOrange); Name: 'clrLightOrange'),
    (Value: Integer(clrLime); Name: 'clrLime'),
    (Value: Integer(clrSeaGreen); Name: 'clrSeaGreen'),
    (Value: Integer(clrAqua); Name: 'clrAqua'),
    (Value: Integer(clrLightBlue); Name: 'clrLightBlue'),
    (Value: Integer(clrViolet); Name: 'clrViolet'),
    (Value: Integer(clrGray40Percent); Name: 'clrGray40Percent'),
    (Value: Integer(clrPink); Name: 'clrPink'),
    (Value: Integer(clrGold); Name: 'clrGold'),
    (Value: Integer(clrYellow); Name: 'clrYellow'),
    (Value: Integer(clrBrightGreen); Name: 'clrBrightGreen'),
    (Value: Integer(clrTurquoise); Name: 'clrTurquoise'),
    (Value: Integer(clrSkyBlue); Name: 'clrSkyBlue'),
    (Value: Integer(clrPlum); Name: 'clrPlum'),
    (Value: Integer(clrGray25Percent); Name: 'clrGray25Percent'),
    (Value: Integer(clrRose); Name: 'clrRose'),
    (Value: Integer(clrTan); Name: 'clrTan'),
    (Value: Integer(clrLightYellow); Name: 'clrLightYellow'),
    (Value: Integer(clrLihtGreen); Name: 'clrLihtGreen'),
    (Value: Integer(clrLightTurquoise); Name: 'clrLightTurquoise'),
    (Value: Integer(clrPaleBlue); Name: 'clrPaleBlue'),
    (Value: Integer(clrLavender); Name: 'clrLavender'),
    (Value: Integer(clrWhite); Name: 'clrWhite'));

function ExcelColorToIdent(xlsColor: TxlsColor; var Ident: string): Boolean;
begin
  Result := IntToIdent(Integer(xlsColor), Ident, xlsColors);
end;

function IdentToExcelColor(const Ident: string; var xlsColor: TxlsColor): Boolean;
var
  iColor: integer;
begin
  iColor := Integer(xlsColor);
  Result := IdentToInt(Ident, iColor, xlsColors);
  xlsCOlor := TxlsColor(iColor);
end;

function ExcelColorToString(Color: TxlsColor): string;
begin
  ExcelColorToIdent(Color, Result);
end;

{$IFDEF VCL5}
function StringToExcelColor(const S: string): TxlsColor;
begin
  if not IdentToExcelColor(S, Result) then
    Result := clrBlack;
end;

function ExcelColorToColor(Color: TxlsColor): TColor;
begin
  Result := XLS_STANDARD_PALETTE[Integer(Color)];
end;
{$ENDIF}

procedure TxlsColorProperty.Edit;
var
  OClr, NClr: TxlsColor;
begin
  OClr := TxlsColor(GetOrdValue);
  NClr := RunXLSColorEditor(OClr);
  if NClr <> OClr then begin
    SetOrdValue(Integer(NClr));
    SetStrValue(ExcelColorToString(NClr));
  end;
end;

function TxlsColorProperty.GetAttributes: TPropertyAttributes;
begin
  Result := [paMultiSelect, paDialog, paValueList, paRevertable];
end;

function TxlsColorProperty.GetValue: string;
begin
  Result := ExcelColorToString(TxlsColor(GetOrdValue));
end;

procedure TxlsColorProperty.GetValues(Proc: TGetStrProc);
var
  i: integer;
begin
  for i := Integer(Low(TxlsColor)) to Integer(High(TxlsColor)) do
    Proc(xlsColors[i].Name);
end;

{$IFDEF VCL5}
procedure TxlsColorProperty.ListDrawValue(const Value: string;
  ACanvas: TCanvas; const ARect: TRect; ASelected: Boolean);

  function ColorToBorderColor(AColor: TxlsColor): TColor;
  type
    TColorQuad = record
      Red,
      Green,
      Blue,
      Alpha: Byte;
    end;
  var
    FColor: TColor;
  begin
    FColor := ExcelColorToColor(AColor);
    if (TColorQuad(FColor).Red > 192) or
       (TColorQuad(FColor).Green > 192) or
       (TColorQuad(FColor).Blue > 192) then
      Result := clBlack
    else if ASelected then
      Result := clWhite
    else
      Result := ExcelColorToColor(AColor);
  end;
  
var
  vRight: Integer;
  vOldPenColor, vOldBrushColor: TColor;
begin
  vRight := (ARect.Bottom - ARect.Top) {* 2} + ARect.Left;
  with ACanvas do
  try
    // save off things
    vOldPenColor := Pen.Color;
    vOldBrushColor := Brush.Color;

    // frame things
    Pen.Color := Brush.Color;
    Rectangle(ARect.Left, ARect.Top, vRight, ARect.Bottom);

    // set things up and do the work
    Brush.Color := ExcelColorToColor(StringToExcelColor(Value));
    Pen.Color := ColorToBorderColor(StringToExcelColor(Value));
    Rectangle(ARect.Left + 1, ARect.Top + 1, vRight - 1, ARect.Bottom - 1);

    // restore the things we twiddled with
    Brush.Color := vOldBrushColor;
    Pen.Color := vOldPenColor;
  finally
    {$IFDEF VCL6}
    DefaultPropertyListDrawValue(Value, ACanvas, Rect(vRight, ARect.Top,
      ARect.Right, ARect.Bottom), ASelected);
    {$ELSE}
    inherited ListDrawValue(Value, ACanvas, Rect(vRight, ARect.Top, ARect.Right,
      ARect.Bottom), ASelected);
    {$ENDIF}
  end;
end;
{$ENDIF}

{$IFDEF VCL5}
procedure TxlsColorProperty.ListMeasureWidth(const Value: string;
  ACanvas: TCanvas; var AWidth: Integer);
begin
  AWidth := AWidth + ACanvas.TextHeight('M') {* 2};
end;
{$ENDIF}

{$IFDEF VCL6}
procedure TxlsColorProperty.ListMeasureHeight(const Value: string;
  ACanvas: TCanvas; var AHeight: Integer);
begin
  // No implemenation necessary
end;
{$ENDIF}

{$IFDEF VCL5}
procedure TxlsColorProperty.PropDrawValue(ACanvas: TCanvas;
  const ARect: TRect; ASelected: Boolean);
begin
  if GetVisualValue <> '' then
    ListDrawValue(GetVisualValue, ACanvas, ARect, True{ASelected})
  else
  {$IFDEF VCL6}
  DefaultPropertyDrawValue(Self, ACanvas, ARect);
  {$ELSE}
  inherited PropDrawValue(ACanvas, ARect, ASelected);
  {$ENDIF}
end;
{$ENDIF}

{$IFDEF VCL6}
procedure TxlsColorProperty.PropDrawName(ACanvas: TCanvas; const ARect: TRect;
  ASelected: Boolean);
begin
  DefaultPropertyDrawName(Self, ACanvas, ARect);
end;
{$ENDIF}

procedure TxlsColorProperty.SetValue(const Value: string);
var
  NewValue: TxlsColor;
begin
  if IdentToExcelColor(Value, NewValue) then
    SetOrdValue(Integer(NewValue))
  else inherited SetValue(Value);
end;

end.
