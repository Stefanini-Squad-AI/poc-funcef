unit frCndRADOrdemCompra;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  frCondRad, Db, ImgList, TB97Ctls, Grids, Wwdbigrd, Wwdbgrid, StdCtrls,
  Buttons, TB97, TB97Tlbr, ExtCtrls, DBClient, uCMClientDataSet, Provider,
  DBTables, Mask, DBCtrls, wwdblook, CMDBLookupCombo;

type
  TframeCndRADOrdemCompra = class(TframeCondRAD)
    dbedtValorInicial: TDBEdit;
    dbedtValorFinal: TDBEdit;
    lblValorInicial: TLabel;
    lblValorFinal: TLabel;
    cdsGrupoProd: TCMClientDataSet;
    dblkpGrupoProd: TCMDBLookupCombo;
  private
    { Private declarations }
  public

    procedure OnCreate; override;
    function Valida : boolean; override;

  end;

var
  frameCndRADOrdemCompra: TframeCndRADOrdemCompra;

implementation

{$R *.DFM}

{ TframeCndRADOrdemCompra }

procedure TframeCndRADOrdemCompra.OnCreate;
begin
  inherited;
  cdsGrupoProd.Data := CtrlRadEtapaCond.LookupGrupoProd;
end;

function TframeCndRADOrdemCompra.Valida: boolean;
begin
  cdsCondicoes.FieldByName('DESCGRUPOPROD').AsString := dblkpGrupoProd.Text;
  Result := True;
end;

end.
