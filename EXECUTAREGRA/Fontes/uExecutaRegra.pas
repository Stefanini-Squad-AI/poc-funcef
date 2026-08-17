unit uExecutaRegra;

interface

uses
  SysUtils, Windows, Messages, Classes, Graphics, Controls, Forms,
  Dialogs, DBTables, DB, URegra, Wwquery, ADODB;

type
  TdtmExecutaRegra = class(TDataModule)
    qryRegra: TwwQuery;
    regraAPrev: TRegra;
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  dtmExecutaRegra: TdtmExecutaRegra;

implementation

{$R *.DFM}

end.
