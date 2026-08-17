unit frCndRADSolicCompra;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  frCondRad, Db, ImgList, TB97Ctls, Grids, Wwdbigrd, Wwdbgrid, StdCtrls,
  Buttons, TB97, TB97Tlbr, ExtCtrls, DBClient, uCMClientDataSet, Provider,
  DBTables, Mask, DBCtrls, wwdblook, CMDBLookupCombo, uCtrlParamIntegra;

type
  TframeCndRADSolicCompra = class(TframeCondRAD)
    dbedtValorInicial: TDBEdit;
    dbedtValorFinal: TDBEdit;
    cdsCentroRespon: TCMClientDataSet;
    dblkpCentResp: TCMDBLookupCombo;
    lblCentRespon: TLabel;
    lblValorInicial: TLabel;
    lblValorFinal: TLabel;
    cdsCentroCusto: TCMClientDataSet;
    Label4: TLabel;
    dblkpCentCust: TCMDBLookupCombo;
    cdsGrupoProd: TCMClientDataSet;
    Label7: TLabel;
    dblkpGrupoProd: TCMDBLookupCombo;
    cdsAtivProj: TCMClientDataSet;
    Label8: TLabel;
    dblkpUnidNegocio: TCMDBLookupCombo;
  private
    { Private declarations }
  public

    procedure OnCreate; override;
    function Valida : boolean; override;

  end;

var
  frameCndRADSolicCompra: TframeCndRADSolicCompra;

implementation

{$R *.DFM}


procedure TframeCndRADSolicCompra.OnCreate;
begin
  inherited;
  cdsCentroRespon.Data  := CtrlRadEtapaCond.LookupCentRespon( ParamIntegra.PlanoCentroRespon );
  cdsCentroCusto.Data   := CtrlRadEtapaCond.LookupCentCust( ParamIntegra.PlanoCentroCusto );
  cdsGrupoProd.Data     := CtrlRadEtapaCond.LookupGrupoProd;
  cdsAtivProj.Data      := CtrlRadEtapaCond.LookupAtivProj;
end;

function TframeCndRADSolicCompra.Valida: boolean;
begin
  cdsCondicoes.FieldByName('CODEXTERNOCR').AsString    := dblkpCentResp.Text;
  cdsCondicoes.FieldByName('CODEXTERNOCC').AsString    := dblkpCentCust.Text;
  cdsCondicoes.FieldByName('UNECODIGO').AsString       := dblkpUnidNegocio.Text;
  cdsCondicoes.FieldByName('DESCGRUPOPROD').AsString   := dblkpGrupoProd.Text;
  Result := True;
end;

end.
