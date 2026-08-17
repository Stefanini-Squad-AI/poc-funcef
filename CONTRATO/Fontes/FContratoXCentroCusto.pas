unit FContratoXCentroCusto;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  FOkCancelar, IvDictio, IvMulti, IvEMulti, MAHlpBtn, StdCtrls, Buttons,
  TB97Tlbr, TB97, ExtCtrls, Db, DBTables, Wwquery, wwdblook,
  CMDBLookupCombo;

type
  TfrmContratoXCentroCusto = class(TfrmOkCancelar)
    Label1: TLabel;
    CMDBLookupCombo1: TCMDBLookupCombo;
    qryCentroCusto: TwwQuery;
    qryCentroCustoNOME: TStringField;
    qryCentroCustoCODCENTROCUSTO: TStringField;
    procedure FormActivate(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmContratoXCentroCusto: TfrmContratoXCentroCusto;

implementation

{$R *.DFM}

procedure TfrmContratoXCentroCusto.FormActivate(Sender: TObject);
begin
  inherited;
   if not qryCentroCusto.Active then qryCentroCusto.Open; 
end;

end.
