unit frCndRADValor;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  frCondRad, Db, ImgList, TB97Ctls, Grids, Wwdbigrd, Wwdbgrid, StdCtrls,
  Buttons, TB97, TB97Tlbr, ExtCtrls, DBClient, uCMClientDataSet, Provider,
  DBTables, Mask, DBCtrls, wwdblook, CMDBLookupCombo;

type
  TframeCndRADValor = class(TframeCondRAD)
    dbedtValorInicial: TDBEdit;
    dbedtValorFinal: TDBEdit;
    lblValorInicial: TLabel;
    lblValorFinal: TLabel;
  private
    { Private declarations }
  public

  end;

var
  frameCndRADValor: TframeCndRADValor;

implementation

{$R *.DFM}

end.
