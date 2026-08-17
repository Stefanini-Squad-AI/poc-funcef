// *****************************************************************************
// ***************************** REGISTRO DE ALTERAÇÕES ************************
// *****************************************************************************
// Rotina      : qryContribPatro
// Autor(a)    : Leo
// Data        : 04.12.2002
// Alteração   : inclusão do FLGPARCELAMENTO
// -----------------------------------------------------------------------------

unit DPreparaContrib;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  Db, DBTables, Wwquery;

type
  TdtmPreparaContrib = class(TDataModule)
    qryContribPatro: TwwQuery;
    qryNCalcAtivo: TwwQuery;
    qryHSTCONTRIB: TwwQuery;
    updHSTCONTRIB: TUpdateSQL;
    qryNCalcMantido: TwwQuery;
    qryLote: TwwQuery;
    updLote: TUpdateSQL;
    qryAtivoBase: TwwQuery;
    qryNCalcMantido13: TwwQuery;
    qryAux: TwwQuery;


  private { Private declarations }


  public  { Public declarations }


  end;



var
  dtmPreparaContrib: TdtmPreparaContrib;



implementation
{$R *.DFM}



end.