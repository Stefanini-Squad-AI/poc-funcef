unit frCndRADDoc;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  frCondRad, Db, ImgList, TB97Ctls, Grids, Wwdbigrd, Wwdbgrid, StdCtrls,
  Buttons, TB97, TB97Tlbr, ExtCtrls, DBClient, uCMClientDataSet, Provider,
  DBTables, Mask, DBCtrls, wwdblook, CMDBLookupCombo, uCtrlParamIntegra;

type
  TframeCndRADDoc = class(TframeCondRAD)
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
  private
    { Private declarations }
  public

    procedure OnCreate; override;
    function Valida : boolean; override;

  end;

var
  frameCndRADDoc: TframeCndRADDoc;

implementation

{$R *.DFM}


procedure TframeCndRADDoc.OnCreate;
begin
  inherited;
  cdsCentroRespon.Data  := CtrlRadEtapaCond.LookupCentRespon( ParamIntegra.PlanoCentroRespon );
  cdsTipoDocRecPag.Data := CtrlRadEtapaCond.LookupTipoDoc;
end;

function TframeCndRADDoc.Valida: boolean;
begin
  cdsCondicoes.FieldByName('CODEXTERNOCR').AsString    := dblkpCentResp.Text;
  cdsCondicoes.FieldByName('NOMETIPODOC').AsString     := dblkpTipoDoc.Text;
  Result := True;
end;

end.
