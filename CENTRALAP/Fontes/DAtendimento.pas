unit DAtendimento;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  DBTables, Db, Wwquery;

type
  TDtmAtendimento = class(TDataModule)
    QryInsAtend: TwwQuery;
    QryinsAssunto: TwwQuery;
    QryUpdAssunto: TwwQuery;
    QryExisteAtend: TwwQuery;
    QryExisteAtendIDATEND: TFloatField;
    QryUpdAtend: TwwQuery;
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  DtmAtendimento: TDtmAtendimento;

implementation

{$R *.DFM}

end.
