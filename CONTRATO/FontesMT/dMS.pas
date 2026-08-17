unit dMS;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  MontaSelect;

type
  TdtmMS = class(TDataModule)
    MS_Contrato: TMontaSelect;
    MS_Objeto: TMontaSelect;
    MS_Item: TMontaSelect;
    MS_CompOrcamto: TMontaSelect;
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
