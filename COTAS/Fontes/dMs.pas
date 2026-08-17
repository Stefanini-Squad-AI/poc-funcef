unit dMs;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  MontaSelect;

type
  TdtmMS = class(TDataModule)
    MS_AtivoCota: TMontaSelect;
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  dtmMS: TdtmMS;

implementation

{$R *.DFM}

end.
