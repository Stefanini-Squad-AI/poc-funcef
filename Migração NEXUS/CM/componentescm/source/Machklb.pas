{*******************************************************}
{                                                       }
{ Padrões de Desenvolvimento                            }
{ Copyright © 1998,2002 - CM Soluções Informática       }
{                                                       }
{ - Atualização para o padrão MT (3 Camadas)            }
{                                                       }
{ Analista Responsável: Gustavo Viegas                  }
{ Atualizado Em: 10/04/2002                             }
{                                                       }
{*******************************************************}
unit Machklb;

interface

uses
  SysUtils, Windows, Messages, Classes, Graphics, Controls,
  Forms, Dialogs, StdCtrls, Menus;

type
   TCMchklistbox = class(TCustomListBox)
   private
      FGlyphChecked: TBitMap;
      FGlyphUnchecked: TBitMap;
      FGlyphTopMargin,
      FGlyphLeftMargin,
      FTextLeftMargin : Integer;
      FReadOnly : boolean;

      procedure FOnClick(Sender:TObject);
      procedure SetGlyphChecked(Value: TBitmap);
      procedure SetGlyphUnchecked(Value: TBitmap);
      function GetGlyphChecked: TBitmap;
      function GetGlyphUnchecked: TBitmap;

   protected
      procedure DrawItem(Index: Integer; Rect: TRect;
                         State: TOwnerDrawState); override;

   public
      constructor Create(AOwner: TComponent); override;
      destructor Destroy; override;

   published
      property GlyphChecked: TBitmap read GetGlyphChecked write SetGlyphChecked;
      property GlyphUnchecked: TBitmap read GetGlyphUnchecked write SetGlyphUnchecked;
      property GlyphTopMargin: Integer read FGlyphTopMargin write FGlyphTopMargin;
      property GlyphLeftMargin: Integer read FGlyphLeftMargin write FGlyphLeftMargin;
      property TextLeftMargin: Integer read FTextLeftMargin write FTextLeftMargin;
      property ReadOnly: Boolean read FReadOnly write FReadOnly;


      property Align;
      property BorderStyle;
      property Color;
      property Columns;
      property Ctl3D;
      property DragCursor;
      property DragMode;
      property Enabled;
      property Font;
      property IntegralHeight;
      property ItemHeight;
      property ItemIndex;
      property Items;
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
      property OnDblClick;
      property OnDragDrop;
      property OnDragOver;
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
   end;


implementation

{$R CHKLB.RES}

{ TCMchklistbox }


constructor TCMchklistbox.Create(AOwner: TComponent);
begin
   inherited Create(AOwner);
   FGlyphChecked   := TBitmap.Create;
   FGlyphUnchecked := TBitmap.Create;
   FGlyphChecked.LoadFromResourcename(hInstance,'CHKLB_CHECKED');
   FGlyphUnChecked.LoadFromResourcename(hInstance,'CHKLB_UNCHECKED');
   Style           := lbOwnerDrawFixed;
   MultiSelect     := True;
   ExtendedSelect  := False;
   FReadOnly       := False;
   OnClick := FOnClick;
end;


destructor TCMchklistbox.Destroy;
begin
   FGlyphChecked.Destroy;
   FGlyphUnchecked.Destroy;
   inherited;
end;

procedure TCMchklistbox.SetGlyphChecked(Value: TBitmap);
begin
   FGlyphChecked.Assign(Value);
end;

procedure TCMchklistbox.SetGlyphUnchecked(Value: TBitmap);
begin
   FGlyphUnchecked.Assign(Value);
end;

function TCMchklistbox.GetGlyphChecked: TBitmap;
begin
   Result := FGlyphChecked;
end;

function TCMchklistbox.GetGlyphUnchecked: TBitmap;
begin
   Result := FGlyphUnchecked;
end;

procedure TCMchklistbox.DrawItem(Index: Integer; Rect: TRect;
                                   State: TOwnerDrawState);
var
   Aux: Integer;
   pBmp: TBitMap;

begin
        if Index < Items.Count then
        begin
             with Canvas do
             begin
                  Font.Color  := clBlack;
                  Brush.Color := Color;
                  FillRect(Rect);
                  Aux := Rect.Top;
                  Rect.Top := Rect.Top + FGlyphTopMargin;
                  Rect.Left := Rect.Left + FGlyphLeftMargin;
                  if Selected[Index] then
                  begin
                       if FGlyphChecked <> Nil then
                          BrushCopy(Rect, FGlyphChecked,
                          Bounds(0, 0, Rect.Right - Rect.Left, Rect.Bottom - Rect.Top),
                          FGlyphChecked.TransparentColor);
                       pBmp := FGlyphChecked;
                  end
                  else
                  begin
                       if FGlyphUnchecked <> Nil then
                          BrushCopy(Rect, FGlyphUnchecked,
                          Bounds(0, 0, Rect.Right - Rect.Left, Rect.Bottom - Rect.Top),
                          FGlyphUnchecked.TransparentColor);
                       pBmp := FGlyphUnchecked;
                  end;

                  Rect.Top  := Aux;
                  Rect.Left := Rect.Left + pBmp.Width + FTextLeftMargin;
                  TextOut(Rect.left, Rect.Top, Items[Index]);
             end;
        end;
end;

procedure TCMchklistbox.FOnClick(Sender : TObject);
begin
     if not FReadOnly then
        inherited;
end;
end.
