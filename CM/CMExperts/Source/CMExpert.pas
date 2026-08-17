unit CMExpert;

interface

uses
  Windows, ToolIntf, ExptIntf, DsgnIntf, TypInfo;

type
  TCMExpert = class(TIExpert)
  protected
    function CreateMenuItem(const AParentMenu, ACaption: string; AIndex: Integer; AShortCut: Integer = 0): TIMenuItemIntf;
    function CreateCmMenuItem(const ACaption: string; AIndex: Integer): TIMenuItemIntf;
    procedure DoClick(Sender: TIMenuItemIntf); virtual; abstract;
  public

    function GetName: string; override;
    function GetStyle: TExpertStyle; override;
    function GetIDString: string; override;
    function GetComment: string; override;
    function GetAuthor: string; override;
    function GetPage: string; override;
    function GetState: TExpertState; override;
    function GetMenuText: string; override;
    function GetGlyph: HICON; override;
    procedure Execute; override;
  end;

  TCMMenuExpert = class(TCMExpert)
  private
    _MenuItem: TIMenuItemIntf;
  protected
    procedure DoClick(Sender: TIMenuItemIntf); override;
  public
    constructor Create;
    destructor Destroy; override;
  end;

  TCMXptAbout = class(TCMExpert)
  private
    _SepMenuItem: TIMenuItemIntf;
    _AboutMenuItem: TIMenuItemIntf;
  protected
    procedure DoClick(Sender: TIMenuItemIntf); override;
  public
    constructor Create;
    destructor Destroy; override;
  end;

procedure Register;

implementation

uses
  CMXptAbout;

const
  sCMMenu = 'CMMenu';

var
  ACMMenuExpert: TCMMenuExpert;

procedure Register;
begin
  RegisterLibraryExpert(TCMXptAbout.Create);
end;

{ TCMExpert }
function TCMExpert.GetName: string;
begin
  Result := ClassName + ' Expert'; //não alterar
end;

function TCMExpert.GetStyle: TExpertStyle;
begin
  Result := esAddIn;
end;

function TCMExpert.GetIDString: string;
begin
  Result := 'cmsolucoes.' + ClassName; //não alterar
end;

function TCMExpert.GetComment: string;
begin
  Result := '';
end;

function TCMExpert.GetAuthor: string;
begin
  Result := 'CM Soluções Informática';
end;

function TCMExpert.GetPage: string;
begin
  Result := 'CM Soluções';
end;

function TCMExpert.GetState: TExpertState;
begin
  Result := [esEnabled];
end;

function TCMExpert.GetMenuText: string;
begin
  Result := '';
end;

function TCMExpert.GetGlyph: HICON;
begin
  Result := 0;
end;

procedure TCMExpert.Execute;
begin
end;

{**************************************}

function TCMExpert.CreateCmMenuItem(
  const ACaption: string; AIndex: Integer): TIMenuItemIntf;
begin
  Result := CreateMenuItem(sCMMenu, ACaption, AIndex);
end;

function TCMExpert.CreateMenuItem(const AParentMenu, ACaption: string;
  AIndex: Integer; AShortCut: Integer = 0): TIMenuItemIntf;
var
  MainMenu : TIMainMenuIntf;
  MenuItems: TIMenuItemIntf;
  MenuCM   : TIMenuItemIntf;
begin
  Result := nil;
  if ToolServices = nil then
    Exit;
  MainMenu := ToolServices.GetMainMenu;
  if MainMenu <> nil then
    try
      MenuItems := MainMenu.GetMenuItems;
      if MenuItems <> nil then
      try
        MenuCM := MainMenu.FindMenuItem(AParentMenu);
        if MenuCM <> nil then
          try
            if ACaption = '-' then
              Result := MenuCM.InsertItem(AIndex, ACaption, ClassName + 'sep', '',
                0, 0, 0, [mfVisible, mfEnabled], nil)
            else
              Result := MenuCM.InsertItem(AIndex, ACaption, ClassName, '',
                AShortCut, 0, 0, [mfVisible, mfEnabled], DoClick);
          finally
            MenuCM.Free;
          end;
      finally
        MenuItems.Free;
      end;
    finally
      MainMenu.Free;
    end;
end;

{ TCMMenuExpert }
constructor TCMMenuExpert.Create;
var
  MainMenu: TIMainMenuIntf;
  MenuItems: TIMenuItemIntf;
begin
  inherited Create;
  _MenuItem := nil;
  if ToolServices = nil then
    Exit;
  MainMenu := ToolServices.GetMainMenu;
  if MainMenu <> nil then
    try
      MenuItems := MainMenu.GetMenuItems;
      if MenuItems <> nil then
      try
        _MenuItem := MenuItems.InsertItem(MenuItems.GetItemCount -1, 'SOFTTEK-Experts', sCMMenu, '',
          0, 0, 0, [mfVisible, mfEnabled], nil);
      finally
        MenuItems.Free;
      end;
    finally
      MainMenu.Free;
    end;
end;

destructor TCMMenuExpert.Destroy;
begin
  _MenuItem.Free;
  inherited;
end;


procedure TCMMenuExpert.DoClick(Sender: TIMenuItemIntf);
begin
end;

{ TCMXptAbout }

constructor TCMXptAbout.Create;
begin
  inherited Create;
  _SepMenuItem := CreateCmMenuItem('-', 7);
  _AboutMenuItem := CreateCmMenuItem('Sobre...', 8);
end;

destructor TCMXptAbout.Destroy;
begin
  _SepMenuItem.Free;
  _AboutMenuItem.Free;
  inherited Destroy;
end;

procedure TCMXptAbout.DoClick(Sender: TIMenuItemIntf);
begin
  TfrmCMEntrada.ExecuteAbout;
end;

initialization
  ACMMenuExpert := TCMMenuExpert.Create;
  
finalization
  ACMMenuExpert.Free;

end.

