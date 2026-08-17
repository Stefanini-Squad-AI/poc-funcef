unit TB97Reg;

{
  Toolbar97
  Copyright (C) 1998-99 by Jordan Russell
  For conditions of distribution and use, see LICENSE.TXT.
}

interface

{$I TB97Ver.inc}

procedure Register;

implementation

uses
  SysUtils, Classes, Dialogs, DsgnIntf,
  TB97Vers, TB97, TB97Tlbr, TB97Tlwn, TB97Ctls;

type
  TToolbar97VersionProperty = class(TStringProperty)
  public
    procedure Edit; override;
    function GetAttributes: TPropertyAttributes; override;
  end;

procedure TToolbar97VersionProperty.Edit;
const
  AboutText =
    '%s'#13#10 +
    'Copyright (C) 1998-99 by Jordan Russell'#13#10 +
    'For conditions of distribution and use, see LICENSE.TXT.'#13#10 +
    #13#10 +
    'Visit my web site for the latest versions of Toolbar97:'#13#10 +
    'http://www.jrsoftware.org/';
begin
  MessageDlg (Format(AboutText, [GetStrValue]), mtInformation, [mbOK], 0);
end;

function TToolbar97VersionProperty.GetAttributes: TPropertyAttributes;
begin
  Result := inherited GetAttributes + [paDialog, paReadOnly];
end;


procedure Register;
begin
  RegisterComponents ('Toolbar97', [TDock97, TToolbar97, TToolWindow97,
    TToolbarButton97, TToolbarSep97, TEdit97]);
  RegisterPropertyEditor (TypeInfo(TToolbar97Version), nil, '',
    TToolbar97VersionProperty);
end;

end.
