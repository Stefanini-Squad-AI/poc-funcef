unit CMFRMPROP;

interface

uses
  SysUtils, WinTypes, WinProcs, Messages, Classes,
  Graphics, Controls, Forms, Dialogs,stdctrls;

type

  TRootKey = (rkHKEY_CURRENT_USER, rkHKEY_LOCAL_MACHINE);

  TCMFormProp = class(TComponent)
  private
    FFirstControl: TWinControl;
    FAllowMaximized : boolean;
    FAllowMinimized : boolean;
    FMaxWidth : integer;
    FMaxHeight : integer;
    FMinWidth : integer;
    FMinHeight : integer;
    FRootKey : TRootKey;
    FSavePosition : boolean;
    FSubKey : string;
    FSaveSize : boolean;
  protected
  public
    constructor Create(AOwner:TComponent);override;
    destructor Destroy;override;
  published
    Property FirstControl: TWinControl read FFirstControl write FFirstControl;
    Property AllowMaximized : boolean read FAllowMaximized write FAllowMaximized ;
    Property AllowMinimized : boolean read FAllowMinimized write FAllowMinimized ;
    Property MaxWidth : integer read FMaxWidth write FMaxWidth ;
    Property MaxHeight : integer read FMaxHeight write FMaxHeight ;
    Property MinWidth : integer read FMinWidth write FMinWidth ;
    Property MinHeight : integer read FMinHeight write FMinHeight ;
    Property RootKey : TRootKey read FRootKey write FRootKey default rkHKEY_CURRENT_USER;
    Property SavePosition : boolean read FSavePosition write FSavePosition ;
    Property SubKey : string read FSubKey write FSubKey ;
    Property SaveSize : boolean read FSaveSize write FSaveSize ;
    Property Name;
    Property Tag;
end;


implementation

{$R *.res}


 
constructor TCMFormProp.Create(AOwner:TComponent);
begin
  inherited Create(AOwner);
  FRootKey := rkHKEY_CURRENT_USER;
end;
 
 
destructor TCMFormProp.Destroy;
begin
  inherited Destroy;
end;
end.
