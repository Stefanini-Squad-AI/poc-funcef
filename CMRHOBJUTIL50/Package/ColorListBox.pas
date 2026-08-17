unit ColorListBox;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs, StdCtrls;

type
{  TFieldColorListBox = class
  private
    FVisible: boolean;
    FColor: TColor;
    FFont: TFont;
    FIndex, FWidth: integer;
    procedure SetColor(Value: TColor);
  public
    property Visible: boolean read FVisible write FVisible;
    property Color: TColor read FColor write FColor default clBlack;
    property Font: TFont read FFont write FFont;
    property Index: integer read FIndex write FIndex default 1;
    property Width: integer read FWidth write FWidth default 100;
  end;}

  TColorItemEvent = procedure (Col,Row:Integer; KeyField:string; State:TOwnerDrawState;
    Brush:TBrush; Font:TFont) of object;

  TLinesType = set of (ltBottom, ltBeetwenCols, ltBeetwenRows);

  TColorListBox = class(TCustomListBox)
  private
    FFieldsWidth: TStringList;
    FItemSelectedColor, FLinesColor: TColor;
    FOnColorItems: TColorItemEvent;
    FLinesType: TLinesType;

    FTabTotal, FOldCountItems: integer;
    FFieldKeyPos, FFieldsVisibleCount, FFieldOffset: byte;

    procedure OnChangeFieldsWidth(Sender: TObject);
    procedure SetFieldsWidth(FieldsWidth: TStringList);
    function  GetField(Index, IndexField: integer): string;
    function  GetMaxLengthField(IndexField: integer): string;
    property  Style;
  protected
    procedure CreateParams(var Params: TCreateParams); override;
    procedure ColorItem(Col,Row:Integer; KeyField:string; State:TOwnerDrawState;
      Brush:TBrush; Font:TFont); virtual; abstract;
  public
    constructor Create(AOwner: TComponent); override;
    destructor  Destroy; override;

    // Retorna o determinado Campo "IndexField" de um determinado Item "Index" da lista
    function GetFieldItem(Index, IndexField: integer): string;
    // Retorna o índice do "Campo" (IndexField) que contém a Primeira Ocorrência de "S"
    function IndexOfField(const S:string; IndexField:integer): integer;
    // Faz uma Pesquisa Incremental pela string "S" nos Itens da Lista
    function FindString(const S: string): integer;
    // Repinta somente o "Index" determinado Item da Lista
    procedure InvalidateItem(Index: integer);
    // Desenha os itens da lista
    procedure DrawItem(Index:integer; Rect:TRect; State:TOwnerDrawState); override;
  published
    property Align;
    property Anchors;
    property BiDiMode;
    property BorderStyle;
    property Color;
    property Constraints;
    property Ctl3D;
    property DragCursor;
    property DragKind;
    property DragMode;
    property Enabled;
    property ExtendedSelect;
    property Font;
    property ImeMode;
    property ImeName;
    property IntegralHeight;
    property ItemHeight;
    property Items;
    property MultiSelect;
    property ParentBiDiMode;
    property ParentColor;
    property ParentCtl3D;
    property ParentFont;
    property ParentShowHint;
    property PopupMenu;
    property ShowHint;
    property Sorted;
    property TabOrder;
    property TabStop;
    property Visible;
    property OnClick;
    property OnContextPopup;
    property OnDblClick;
    property OnDragDrop;
    property OnDragOver;
    property OnDrawItem;
    property OnEndDock;
    property OnEndDrag;
    property OnEnter;
    property OnExit;
    property OnKeyDown;
    property OnKeyPress;
    property OnKeyUp;
    property OnMeasureItem;
    property OnMouseDown;
    property OnMouseMove;
    property OnMouseUp;
    property OnStartDock;
    property OnStartDrag;
    // Tamanho em Pixels dos Campos
    property FieldsWidth: TStringList read FFieldsWidth write SetFieldsWidth;
    property FieldKeyPos: byte read FFieldKeyPos write FFieldKeyPos default 0;
    property FieldsVisibleCount: byte read FFieldsVisibleCount write FFieldsVisibleCount default 1;
    property FieldOffset: byte read FFieldOffset write FFieldOffset default 4;
    property ItemSelectedColor: TColor read FItemSelectedColor write FItemSelectedColor default clNavy;
    property LinesColor: TColor read FLinesColor write FLinesColor default clGray;
    property LinesType: TLinesType read FLinesType write FLinesType default [ltBottom, ltBeetwenCols, ltBeetwenRows];
    property OnColorItems: TColorItemEvent read FOnColorItems write FOnColorItems;
  end;

  procedure Register;        

implementation

uses Consts;

{$R *.DCR}

constructor TColorListBox.Create(AOwner: TComponent);
begin
  inherited Create(AOwner);
  FFieldsWidth := TStringList.Create;
  FFieldsWidth.OnChange := OnChangeFieldsWidth;

  FFieldOffset := 4;  
  FFieldKeyPos := 0;
  FItemSelectedColor := clNavy;
  FLinesColor := clGray;
  FieldsVisibleCount := 1;
  Canvas.Pen.Style := psSolid;
  Style := lbOwnerDrawVariable;
  FOldCountItems := 0;
  LinesType := [ltBottom, ltBeetwenCols, ltBeetwenRows];
end;

procedure TColorListBox.CreateParams(var Params: TCreateParams);
begin
  inherited CreateParams(Params);
  Params.Style := Params.Style or WS_HSCROLL;
end;

destructor TColorListBox.Destroy;
begin
  FFieldsWidth.Free;
  inherited Destroy;
end;

procedure TColorListBox.OnChangeFieldsWidth(Sender: TObject);
var
  c: byte;
begin
  if (FFieldsWidth.Count > 0) then
  begin
    FTabTotal := 0;
    for c:=0 to FFieldsWidth.Count-1 do
      FTabTotal := FTabTotal + StrToInt(FFieldsWidth[c]);
  end
  else
    FOldCountItems := 0;
end;

procedure TColorListBox.SetFieldsWidth(FieldsWidth: TStringList);
begin
  FFieldsWidth.Assign(FieldsWidth);
end;

function TColorListBox.GetField(Index, IndexField: integer): string;
var
  iPos, c: integer;
  sItemAux, sItemAtual: string;
begin
  sItemAux   := Items[Index];
  sItemAtual := '';
  c := 0;

  while (Length(sItemAux) > 0) and (c <= IndexField) do
  begin
    iPos := Pos(#9,sItemAux);
    if (iPos = 0) then
      iPos := Length(sItemAux)
    else
      Dec(iPos);

    sItemAtual := Copy(sItemAux,1,iPos);
    Delete(sItemAux,1,iPos+1);
    Inc(c);
  end;

  Result := sItemAtual;
end;

function TColorListBox.GetMaxLengthField(IndexField: integer): string;
var
  sAux: string;
  c: integer;
begin
  if (Items.Count = 0) then
    sAux := ''
  else
  begin
    sAux := GetField(0, IndexField);

    for c:=1 to Items.Count-1 do
      if (Length(GetField(c, IndexField)) > Length(sAux)) then
        sAux := GetField(c, IndexField);
  end;

  Result := sAux;
end;

function TColorListBox.GetFieldItem(Index, IndexField: integer): string;
var
  iPos, c: integer;
  sItemAux, sItemProcura: string;
begin
  sItemAux := Items[Index];

  for c:=0 to IndexField do
  begin
    iPos := Pos(#9,sItemAux);
    if (iPos = 0) then
      iPos := Length(sItemAux)
    else
      Dec(iPos);

    sItemProcura := Copy(sItemAux,1,iPos);
    Delete(sItemAux,1,iPos+1);
  end;
  Result := sItemProcura;
end;

function TColorListBox.IndexOfField(const S:string; IndexField:integer): integer;
var
  iPos, c: integer;
  sItemAux: string;
begin
  iPos := -1;
  for c:=0 to Items.Count-1 do
  begin
    sItemAux := GetFieldItem(c, IndexField);

    if (sItemAux = S) then
    begin
      iPos := C;
      break;
    end;
  end;

  Result := iPos;
end;

function TColorListBox.FindString(const S: string): integer;
begin
  Result := SendMessage(Handle, LB_SELECTSTRING, -1, LongInt(PChar(S)));
end;

procedure TColorListBox.InvalidateItem(Index: integer);
var
  Rect: TRect;
begin
  Rect := ItemRect(Index);
  InvalidateRect(Handle, @Rect, false);
end;

procedure TColorListBox.DrawItem(Index: Integer; Rect: TRect; State: TOwnerDrawState);
const
  CR_LF = #13#10;
var
  RectAux: TRect;
  sItemActual: string;
  iSizeMaxItem, c, iLeftCol, iRightCol: integer;
begin
  if (Index = TopIndex) and (FOldCountItems < Items.Count) then
  begin
    if (FFieldsWidth.Count = 0) then
      FFieldsWidth.Add(IntToStr(Self.Width - Canvas.TextWidth('A') + 3));

    if (FFieldsWidth.Count < FFieldsVisibleCount) then
      for c:=FFieldsWidth.Count to FFieldsVisibleCount-1 do
        FFieldsWidth.Add(IntToStr(Canvas.TextWidth(GetMaxLengthField(c)) + Canvas.TextWidth('A')));

    if (FFieldsWidth.Count = 1) then
    begin
      iSizeMaxItem := Canvas.TextWidth(GetMaxLengthField(FFieldKeyPos)) + Canvas.TextWidth('A');
      if (iSizeMaxItem > StrToInt(FFieldsWidth[FFieldsWidth.Count-1])) then
        FFieldsWidth[0] := IntToStr(iSizeMaxItem);
    end;

    SendMessage(Self.Handle, LB_SETHORIZONTALEXTENT, FTabTotal, 0);
    FOldCountItems := Items.Count;
  end;

  with (Canvas) do
  begin
    c:=0; iRightCol:=0;
    while (c < FFieldsVisibleCount) do
    begin
      iLeftCol  := iRightCol;
      iRightCol := iRightCol + StrToIntDef(FFieldsWidth[c],100);

      // Campo atual da Linha atual
      sItemActual := GetFieldItem(Index, c);

      // Obtendo as cores a serem pintadas
      if (odSelected in State) then
        Brush.Color := FItemSelectedColor
      else
      if (Assigned(FOnColorItems)) then
        FOnColorItems(c, Index, GetFieldItem(Index, FFieldKeyPos), State, Brush, Font);

      // Calculo a posição do campo atual
      RectAux.Top    := Rect.Top;
      RectAux.Bottom := Rect.Bottom;

      if (c = 0) then
        RectAux.Left := Rect.Left
      else
        RectAux.Left := iLeftCol + 1;

      if (c = 0) then
        RectAux.Right := iRightCol
      else
      if (c = FFieldsVisibleCount-1) then
        RectAux.Right := Rect.Right
      else
        RectAux.Right := iRightCol;

      // Desenho o campo atual
      FillRect(RectAux);
      TextRect(RectAux, RectAux.Left+FFieldOffset, RectAux.Top, sItemActual);

      // Desenho a Linha Divisória entre os campos
      if (ltBeetwenCols in FLinesType) then
      begin
        Pen.Color := FLinesColor;
        MoveTo(RectAux.Right, RectAux.Top);
        LineTo(RectAux.Right, RectAux.Bottom);
      end;

      Inc(c);
    end;

    // Desenho a Linha Divisória entre os Itens ou a Linha Final
    if ((Index = Items.Count-1) and (RectAux.Bottom+3 < Self.Height) and
        (ltBottom in FLinesType)) or
       ((Index < Items.Count-1) and (ltBeetwenRows in FLinesType)) then
    begin
      Pen.Color := FLinesColor;
      MoveTo(Rect.Left, RectAux.Bottom-1);
      LineTo(RectAux.Right, RectAux.Bottom-1);
    end;
  end;
end;

procedure Register;
begin
  RegisterComponents('RH', [TColorListBox]);
end;

end.
