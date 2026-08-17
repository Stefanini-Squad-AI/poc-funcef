{ This translator module component translates the TwwIntl component }

unit IvIPMod;

interface

uses
  Classes,
  IvMulti;

type
  TIvInfoPowerModule = class(TIvModule)
  public
    function TranslateComponent(
      translator: TIvTranslator;
      component: TComponent): Boolean; override;
  end;

implementation

uses
  Wwintl;

function TIvInfoPowerModule.TranslateComponent(
  translator: TIvTranslator;
  component: TComponent): Boolean;
begin
  if (component is TwwIntl) then
  begin
    with TwwIntl(component) do
    begin
      Connected := False;
      Connected := True;
    end;
    Result := True;
  end
  else
    Result := False;
end;

begin
  Modules.Add(TIvInfoPowerModule.Create(nil));
end.
