unit IvFiltEd;

{$I IVMULTI.INC}

interface

uses
{$IFDEF WIN32}
  Windows,
{$ELSE}
  WinTypes, WinProcs,
{$ENDIF}
  Messages, Classes, Graphics, Forms, Controls, Tabs,
  Buttons, DsgnIntf, Grids, StdCtrls, ExtCtrls;

type
  TIvFilterEditor = class(TForm)
    Bevel1: TBevel;
    OKButton: TButton;
    CancelButton: TButton;
    HelpButton: TButton;
    procedure FormCreate(Sender: TObject);
    procedure HelpButtonClick(Sender: TObject);

  private
    procedure SetFilter(value: String);
    function GetFilter: String;
  end;

  TIvFilterProperty = class(TStringProperty)
  public
    procedure Edit; override;
    function GetAttributes: TPropertyAttributes; override;
  end;

implementation

uses
  SysUtils, LibHelp;

{$R *.DFM}

const
  NAME_COL_C = 0;
  FILT_COL_C = 1;
  FIRST_ROW_C = 1;

type
  TFilterGrid = class(TStringGrid)
  private
    FLimit: Integer;
    
  public
    function TotalChars: Integer;
    function GetEditLimit: Integer; override;
  end;

var
  filterGrid: TFilterGrid;


{ TFilterGrid }

function TFilterGrid.TotalChars: Integer;
var
  r: Integer;
begin
  Result := 0;
  for r := FIRST_ROW_C to RowCount - 1 do
    Result := Result + (Length(Cells[NAME_COL_C, r]) + Length(Cells[FILT_COL_C, r]));
end;

function TFilterGrid.GetEditLimit: Integer;
begin
  Result := (FLimit - TotalChars) + Length(Cells[Col, Row]);
  if Result = 0 then
    Result := -1; { sets cell to read only }
end;


{ TFilterEditor }

procedure TIvFilterEditor.FormCreate(Sender: TObject);
begin
  filterGrid := TFilterGrid.Create(Self);
  filterGrid.BoundsRect := Bevel1.BoundsRect;
  with filterGrid do
  begin
    ColCount := 2;
    FixedCols := 0;
    Font.Name := 'MS Sans Serif';
    Font.Size := 8;
    Font.Style := [];
    RowCount := 25;
    ScrollBars := ssVertical;
    Options := [goFixedVertLine, goHorzLine, goVertLine, goEditing, goTabs, goAlwaysShowEditor];
    FLimit := 240;
    Parent := Self;
    TabOrder := 1;
    ColWidths[NAME_COL_C] := ClientWidth div 2;
    ColWidths[FILT_COL_C] := (ClientWidth div 2) - 1;
    DefaultRowHeight := Canvas.TextHeight('A') + 2;
    Cells[NAME_COL_C,0] := 'Filter Name';
    Cells[FILT_COL_C,0] := 'Filter';
  end;
  ActiveControl := FilterGrid;
end;

function TIvFilterEditor.GetFilter: string;

  function EmptyRow(r: Integer): Boolean;
  begin
    Result := True;
    with FilterGrid do
      if (Cells[NAME_COL_C,r] <> '') or (Cells[FILT_COL_C,r] <> '') then
        Result := False;
  end;

var
  r: Integer;
begin
  Result := '';
  with FilterGrid do
  begin
    for r := FIRST_ROW_C to RowCount-1 do
    begin
      if not EmptyRow(r) then
      begin
        Result := Result + Cells[NAME_COL_C, r];
        Result := Result + '|';
        Result := Result + Cells[FILT_COL_C, r];
        Result := Result + '|';
      end;
    end;
  end;

  r := Length(Result);
  while Result[r] = '|' do
  begin
    Delete(Result, r, 1);
    Dec(r);
  end;
end;

procedure TIvFilterEditor.SetFilter(Value: string);
var
  Index: Byte;
  r, c: Integer;
begin
  if Value <> '' then
  begin
    r := FIRST_ROW_C;
    c := NAME_COL_C;
    Index := Pos('|', Value);
    with FilterGrid do
    begin
      while Index > 0 do
      begin
        Cells[c, r] := Copy(Value, 1, Index - 1);
        if c = FILT_COL_C then
        begin
          c := NAME_COL_C;
          if r = RowCount - 1 then
            RowCount := RowCount + 1;
          r := r + 1;
        end
        else c := FILT_COL_C;
        Delete(Value, 1, Index);
        Index := Pos('|', Value);
      end;
      Cells[c, r] := Copy(Value, 1, Length(Value));
    end;
  end;
end;

procedure TIvFilterEditor.HelpButtonClick(Sender: TObject);
begin
  Application.HelpContext(HelpContext);
end;

{ TIvFilterProperty }

procedure TIvFilterProperty.Edit;
var
  filterEditor: TIvFilterEditor;
begin
  filterEditor := TIvFilterEditor.Create(Application);
  try
    filterEditor.SetFilter(GetValue);
    filterEditor.ShowModal;
    if filterEditor.ModalResult = mrOK then
      SetValue(filterEditor.GetFilter);
  finally
    filterEditor.Free;
  end;
end;

function TIvFilterProperty.GetAttributes: TPropertyAttributes;
begin
  Result := [paDialog
{$IFDEF WIN32}
    , paRevertable
{$ENDIF}
  ];
end;

end.

