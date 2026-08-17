unit FParamCentralAP;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  FOkCancelar, StdCtrls, wwdblook, Db, DBTables, Wwquery, Wwdatsrc,
  IvDictio, IvMulti, IvEMulti, MAHlpBtn, Buttons, TB97Tlbr, TB97, ExtCtrls;

type
  TfrmParamCentralAP = class(TfrmOkCancelar)
    dsParam: TwwDataSource;
    qryFormaAtend: TwwQuery;
    wwDBLookupCombo1: TwwDBLookupCombo;
    Label1: TLabel;
    qryParam: TwwQuery;
    qryAux: TwwQuery;
    procedure FormCreate(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmParamCentralAP: TfrmParamCentralAP;

implementation

{$R *.DFM}

procedure TfrmParamCentralAP.FormCreate(Sender: TObject);
begin
  inherited;
  qryParam.Open;
  qryFormaAtend.Open;
  qryFormaAtend.Locate('IDTIPOATEND',qryParam.FieldByName('IDTIPOATENDPADRAO').AsInteger,
                        [loCaseInsensitive, loPartialKey]);
end;

end.
