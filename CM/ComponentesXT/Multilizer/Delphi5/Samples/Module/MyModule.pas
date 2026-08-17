// This a sample translator module for the TMyControl
//
// Because the TMyControl has not published properties to access the items,
// TIvTranslator can not translate it.
//
// There are two ways to translate TMyControl
//
// 1) Using TIvTranslator.TranslateComponent event
//    However if TMyControl is used on several form the programmer must write
//    the same event on every form
//
// 2) A better approoch is to write a translator module.
//    The only thing the programmer must do is to add the module on the
//    application. The module adds the code needed to translate to component.
//    This file implements the translator module for TMyControl.

unit MyModule;

interface

uses
  Classes, IvMulti;

type
  TMyModule = class(TIvModule)
  public
    function TranslateComponent(
      translator: TIvTranslator;
      component: TComponent): Boolean; override;
  end;

implementation

uses
  IvDictio, MyControl;

function TMyModule.TranslateComponent(
  translator: TIvTranslator;
  component: TComponent): Boolean;
var
  i: Integer;
  myControl: TMyControl;
begin
  if (component is TMyControl) then
  begin
    // Translates the TMyControl

    // Checks if the targets property contains ('', 'Items') or
    // ('TMyControl', 'Items')

    if translator.Targets.IsPropertyInTargets(component.ClassName, 'Items') then
    begin
      myControl := TMyControl(component);
      for i := 0 to myControl.Count - 1 do
      begin
        // There are wro event that might happent to the control:

        if ivtsPreScanning in translator.State then
        begin
          // Prescan. This gets the current value of the component
          // Call TIvTranslator.AddTranslation to add the current string value.

          translator.AddTranslation(
            myControl,
            component.Name,
            'Items',
            myControl.Items[i]);
        end
        else
        begin
          // Translate. This translates the component.
          // Call TIvTranslator.DoTranslateContextString function to translate
          // the current value to the new value.

          myControl.Items[i] := translator.DoTranslateContextString(
            myControl,
            component.Name,
            'Items',
            myControl.Items[i]);
        end;
      end;
    end;
    Result := True;
  end
  else
    Result := False;
end;

begin
  // Add the module to the module list.

  Modules.Add(TMyModule.Create(nil));
end.
