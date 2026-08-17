unit DAPrev;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  Db, DBTables, Wwquery, URegra;

type
  TdtmAPrev = class(TDataModule)
    qryRegra: TwwQuery;
    qryGrava: TwwQuery;
    qryContPlanPatro: TwwQuery;
    qryContPrev: TwwQuery;
    qry: TwwQuery;
    qryVerificaObrig: TwwQuery;
    qryAux: TwwQuery;
    qryAux2: TwwQuery;
    qryAuxContrib: TwwQuery;
    qryRubricaxPess: TwwQuery;
    qryAlteradorContrib: TwwQuery;
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  dtmAPrev: TdtmAPrev;

implementation

{$R *.DFM}

end.
