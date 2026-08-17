//******************************************************************************
// Data     : 27/10/2006
// Código   : AL_1
// Desc     : Segregação de Planos
//******************************************************************************

unit dAGE;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  Db, DBTables, Wwquery;

type
  TdtmAGE = class(TDataModule)
    qrySaldoCustodia: TwwQuery;
    qrySaldoCustodiaIDCUSTODIA: TFloatField;
    qrySaldoCustodiaSALDOBLOQUEADO: TFloatField;
    qrySaldoCustodiaSALDOLIBERADO: TFloatField;
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  dtmAGE: TdtmAGE;

implementation

{$R *.DFM}

end.
