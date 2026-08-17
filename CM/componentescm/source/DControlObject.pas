unit DControlObject;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  Provider, Db, DBClient, DBTables, Wwquery, ADODB;

type
  TDtmControlObject = class(TDataModule)
    Cds: TClientDataSet;
    Dsp: TDataSetProvider;
  private
    { Private declarations }
  public
    { Public declarations }
  end;

implementation

{$R *.DFM}

end.
