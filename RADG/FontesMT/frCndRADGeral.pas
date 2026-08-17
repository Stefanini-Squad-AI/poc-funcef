unit frCndRADGeral;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  frCondRad, Db, ImgList, TB97Ctls, Grids, Wwdbigrd, Wwdbgrid, StdCtrls,
  Buttons, TB97, TB97Tlbr, ExtCtrls, DBClient, uCMClientDataSet, Provider,
  DBTables, Mask, DBCtrls, wwdblook, CMDBLookupCombo, uCtrlParamIntegra;

type
  TframeCndRADGeral = class(TframeCondRAD)
    dbedtValorInicial: TDBEdit;
    dbedtValorFinal: TDBEdit;
    cdsTipoDocRecPag: TCMClientDataSet;
    cdsCentroRespon: TCMClientDataSet;
    dblkpCentResp: TCMDBLookupCombo;
    dblkpTipoDoc: TCMDBLookupCombo;
    lblCentRespon: TLabel;
    lblTipoDoc: TLabel;
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
  frameCndRADGeral: TframeCndRADGeral;

implementation

{$R *.DFM}


procedure TframeCndRADGeral.OnCreate;
begin
  inherited;
  cdsCentroRespon.Data  := CtrlRadEtapaCond.LookupCentRespon( ParamIntegra.PlanoCentroRespon );
  cdsTipoDocRecPag.Data := CtrlRadEtapaCond.LookupTipoDoc;
  cdsCentroCusto.Data   := CtrlRadEtapaCond.LookupCentCust( ParamIntegra.PlanoCentroCusto );
  cdsGrupoProd.Data     := CtrlRadEtapaCond.LookupGrupoProd;
  cdsAtivProj.Data      := CtrlRadEtapaCond.LookupAtivProj;
end;

function TframeCndRADGeral.Valida: boolean;
begin
  cdsCondicoes.FieldByName('CODEXTERNOCR').AsString    := dblkpCentResp.Text;
  cdsCondicoes.FieldByName('CODEXTERNOCC').AsString    := dblkpCentCust.Text;
  cdsCondicoes.FieldByName('NOMETIPODOC').AsString     := dblkpTipoDoc.Text;
  cdsCondicoes.FieldByName('UNECODIGO').AsString       := dblkpUnidNegocio.Text;
  cdsCondicoes.FieldByName('DESCGRUPOPROD').AsString   := dblkpGrupoProd.Text;
  Result := True;
end;

end.
