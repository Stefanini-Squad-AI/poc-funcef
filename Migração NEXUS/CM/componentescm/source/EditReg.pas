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
unit EditReg;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  StdCtrls, registry;

type
  TEditReg = class(TCustomEdit)
  private
    { Private declarations }
    FLendo : boolean;
    FKey,
    FPath,
    FValueName,
    FDefault : string;
    FOnChange : TNotifyEvent;
    FRegistry : TRegistry;
    procedure SetFKey(v:string);
    procedure SetFPath(v:string);
    procedure SetFValueName(v:string);
    procedure LeRegister;
  protected
    { Protected declarations }
    procedure Change; override;
  public
    { Public declarations }
    constructor Create(AOwner:TComponent); override;
    destructor Destroy; override;
    property Text;
  published
    { Published declarations }
    property RegKey : string read FKey write SetFKey ;
    property RegPath : string read FPath write SetFPath ;
    property RegValueName : string read FValueName write SetFValueName;
    property OnChange : TNotifyEvent read FOnChange write FOnChange;
    property AutoSelect;
    property AutoSize;
    property BorderStyle;
    property CharCase;
    property Color;
    property Ctl3D;
    property DragCursor;
    property DragMode;
    property Enabled;
    property Font;
    property HideSelection;
    property ImeMode;
    property ImeName;
    property MaxLength;
    property OEMConvert;
    property ParentColor;
    property ParentCtl3D;
    property ParentFont;
    property ParentShowHint;
    property PasswordChar;
    property PopupMenu;
    property ReadOnly;
    property ShowHint;
    property TabOrder;
    property TabStop;
    property Visible;
    property OnClick;
    property OnDblClick;
    property OnDragDrop;
    property OnDragOver;
    property OnEndDrag;
    property OnEnter;
    property OnExit;
    property OnKeyDown;
    property OnKeyPress;
    property OnKeyUp;
    property OnMouseDown;
    property OnMouseMove;
    property OnMouseUp;
    property OnStartDrag;
  end;


implementation

constructor TEditReg.Create(AOwner:TComponent);
begin
     inherited;
     FRegistry := TRegistry.Create;
     FKey  := 'HKEY_CURRENT_USER';
     FPath  := 'Software\SuperCompo';
     FValueName := FDefault;
     FLendo := true;
     Text := '';
end;

destructor TEditReg.Destroy;
begin
     FRegistry.free;
     inherited;
end;

procedure TEditReg.SetFKey(v:string);
var mV : string;
    bAtualiza : boolean;
begin
     bAtualiza := true;
     mV := AnsiUpperCase(v);
     FKey := mV;
     if mV = 'HKEY_CLASSES_ROOT' then
        FRegistry.RootKey := HKEY_CLASSES_ROOT
     else if mV = 'HKEY_CURRENT_USER' then
          FRegistry.RootKey := HKEY_CURRENT_USER
     else if mV = 'HKEY_LOCAL_MACHINE' then
          FRegistry.RootKey := HKEY_LOCAL_MACHINE
     else if mV = 'HKEY_USERS' then
          FRegistry.RootKey := HKEY_USERS
     else if mV = 'HKEY_PERFORMANCE_DATA' then
          FRegistry.RootKey := HKEY_PERFORMANCE_DATA
     else if mV = 'HKEY_CURRENT_CONFIG' then
          FRegistry.RootKey := HKEY_CURRENT_CONFIG
     else if mV = 'HKEY_DYN_DATA' then
          FRegistry.RootKey := HKEY_DYN_DATA
     else
     begin
          ShowMessage('Invalid Registry Key');
          FKey := '';
          bAtualiza := false;
     end;
     if bAtualiza then
        LeRegister;
end;

procedure TEditReg.SetFPath(v:string);
begin
     if (Copy(v,1,1) = '/') or (Copy(v,1,1) = '\') then
        v := Copy(v,2, 255);
     FPath := v;
     LeRegister;
end;

procedure TEditReg.SetFValueName(v:string);
begin
     FLendo := false;
     FValueName := v;
     LeRegister;
end;

procedure TEditReg.LeRegister;
begin
     if not(csDesigning in ComponentState) and
        (not FLendo) then
     begin
          FRegistry.OpenKey(FPath, True);
          FLendo := true;
          Text := FRegistry.ReadString(FValueName);
          FLendo := false;
          FRegistry.CloseKey;
     end;
end;

procedure TEditReg.Change;
begin
     if Assigned(FOnChange) then
        FOnChange(Self);
     if (not(csDesigning in ComponentState)) and (not FLendo) then
     begin
          FRegistry.OpenKey(FPath, true);
          try
             FRegistry.WriteString(FValueName, Text);
          except
          
          end;
          FRegistry.CloseKey;
     end;
end;

end.
