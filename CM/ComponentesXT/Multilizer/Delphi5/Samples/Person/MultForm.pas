unit MultForm;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  IvMulti, IvDictio;

type
  { This is a base form for every form of the application. The form contains
    a translator component. }

  TMultilingualForm = class(TForm)
    Translator: TIvTranslator;
  public
  end;

implementation

{$R *.DFM}

end.
 