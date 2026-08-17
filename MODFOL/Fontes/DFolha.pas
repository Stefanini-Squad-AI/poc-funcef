unit dFolha;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs, Db, DBTables,
  Wwquery;

type
  TdtmFolha = class(TDataModule)
    qryIRRF: TwwQuery;
    qryEscreveRubrica: TwwQuery;
    qryIntegraRubXPlano: TwwQuery;
    qryIntegraPlano: TwwQuery;
    qryIntegraIRRF: TwwQuery;
    qryCodProvDesc: TwwQuery;
    qryDescFolha1: TwwQuery;
    qryDescFolha2: TwwQuery;
    qryUpdDescFolha1: TwwQuery;
    qryExcluiRub1: TwwQuery;
    qryUpdExcluiRub: TwwQuery;
    qryAux: TwwQuery;
    qryReserva: TwwQuery;
    qryUpdReserva: TwwQuery;
    qryRubIndiv: TwwQuery;
    qryUpdRubIndiv: TwwQuery;
    qryExcluiRub2: TwwQuery;
    qryUpdDescFolha2: TwwQuery;
    qryValeTransporte: TwwQuery;
    updValeTransporte: TUpdateSQL;
    qryUpdDescFolha: TwwQuery;
    qryDescFolha: TwwQuery;
    qryAuxFormaCalc: TwwQuery;
  end;

var
  dtmFolha: TdtmFolha;

implementation

{$R *.DFM}

end.
