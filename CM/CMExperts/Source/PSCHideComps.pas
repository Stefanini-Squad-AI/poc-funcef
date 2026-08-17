unit PSCHideComps;

interface

uses
  Windows, SysUtils, Classes, Forms, Menus, Controls,
  ToolIntf, ExptIntf, DsgnIntf, TypInfo, CMExpert, Dialogs, Db;

type
  TPSCHideComps = class(TCMExpert)
  private
    _MenuItem: TIMenuItemIntf;
    _HideMenuItem: TIMenuItemIntf;
    _ShowMenuItem: TIMenuItemIntf;
  protected
    procedure DoClick(Sender: TIMenuItemIntf); override;
  public
    constructor Create;
    destructor Destroy; override;
  end;

  THideXPRT = class(TCMExpert)
  private
    _HideMenuItem: TIMenuItemIntf;
  protected
    procedure DoClick(Sender: TIMenuItemIntf); override;
  public
    constructor Create;
    destructor Destroy; override;
  end;

  TShowXPRT = class(TCMExpert)
  private
    _ShowMenuItem: TIMenuItemIntf;
  protected
    procedure DoClick(Sender: TIMenuItemIntf); override;
  public
    constructor Create;
    destructor Destroy; override;
  end;

  TCMCLoseDataSets = class(TCMExpert)
  private
    _MenuItem: TIMenuItemIntf;
    _HideMenuItem: TIMenuItemIntf;
    _ShowMenuItem: TIMenuItemIntf;
  protected
    procedure DoClick(Sender: TIMenuItemIntf); override;
  public
    constructor Create;
    destructor Destroy; override;
  end;
  
procedure Register;

implementation

procedure Register;
begin
  RegisterLibraryExpert(TPSCHideComps.Create);
  RegisterLibraryExpert(THideXPRT.Create);
  RegisterLibraryExpert(TShowXPRT.Create);
  RegisterLibraryExpert(TCMCLoseDataSets.Create);
end;


function GetDesignedForm: TCustomForm;
begin
  Result := nil;
  if Screen.CustomFormCount < 2 then
    Exit;

  Result := Screen.CustomForms[0];
  if not (csDesigning in Result.ComponentState) then
  begin
    Result := Screen.CustomForms[1];
    if not (csDesigning in Result.ComponentState) then
      Exit;
  end;
end;

procedure SetContainresVisible(Form: TCustomForm; AVisible: Boolean);
var
  WinHandle: THandle;
  AStr: array[0..255] of Char;
  R: TRect;
begin
  WinHandle := GetWindow(Form.Handle, GW_CHILD);
  WinHandle := GetWindow(WinHandle, GW_HWNDLAST);

  while (WinHandle <> 0) do
  begin
    GetClassName(WinHandle, AStr, 254);
    if (StrComp(AStr, 'TContainer') = 0) then 
    begin
      Windows.GetClientRect(WinHandle, r);

      with R do
      begin
        if AVisible then
          ShowWindow(WinHandle, SW_SHOW)
        else
          ShowWindow(WinHandle, SW_HIDE);
      end;
    end;
    WinHandle := GetWindow(WinHandle, GW_HWNDPREV);
  end;
end;

procedure SetSelCompsVisible(AVisible: Boolean);
var
  Form: TCustomForm;
begin
  Form := GetDesignedForm;
  if Form = nil then
    Exit;
  SetContainResVisible(Form, AVisible);
end;

{ TPSCHideComps }

constructor TPSCHideComps.Create;
begin
  inherited Create;
  _MenuItem := CreateCmMenuItem('Componentes não Visuais', 9);
end;

destructor TPSCHideComps.Destroy;
begin
  _MenuItem.Free;
  inherited Destroy;
end;

procedure TPSCHideComps.DoClick(Sender: TIMenuItemIntf);
begin
end;
             
{ THideXPRT }
constructor THideXPRT.Create;
begin
  inherited Create;
  _HideMenuItem := CreateMenuItem('TPSCHideComps', 'Esconder', 0, TextToShortCut('Shift+Ctrl+Alt+H'));
end;

destructor THideXPRT.Destroy;
begin
  _HideMenuItem.Free;
  inherited Destroy;
end;

procedure THideXPRT.DoClick(Sender: TIMenuItemIntf);
begin
  SetSelCompsVisible(False);
end;

{ TShowXPRT }
constructor TShowXPRT.Create;
begin
  inherited Create;
  _ShowMenuItem := CreateMenuItem('TPSCHideComps', 'Mostrar', 1, TextToShortCut('Shift+Ctrl+Alt+S'));
end;

destructor TShowXPRT.Destroy;
begin
  _ShowMenuItem.Free;
  inherited Destroy;
end;

procedure TShowXPRT.DoClick(Sender: TIMenuItemIntf);
begin
  SetSelCompsVisible(True);
end;

{ TCMCLoseDataSets }

constructor TCMCLoseDataSets.Create;
begin
  inherited Create;
  _MenuItem := CreateCmMenuItem('Close &DataSets', 10);
end;

destructor TCMCLoseDataSets.Destroy;
begin
  _MenuItem.Free;
  inherited Destroy;
end;

procedure TCMCLoseDataSets.DoClick(Sender: TIMenuItemIntf);
var
  Form: TCustomForm;
  X: Integer;
begin
  Form := GetDesignedForm;
  if Form = nil then
    Exit
  Else
  Begin
     For X:=0 To Form.ComponentCount - 1 Do
       If (Form.Components[x] Is TDataSet) And
          (TDataSet(Form.Components[x]).Active) Then (TDataSet(Form.Components[x]).Active := False);
  End;
end;

end.
