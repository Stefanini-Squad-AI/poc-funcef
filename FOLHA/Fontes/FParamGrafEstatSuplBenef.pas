unit FParamGrafEstatSuplBenef;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  FParamRelEstatSuplBenef, Db, Wwdatsrc, DBTables, Wwquery, IvDictio,
  IvMulti, IvEMulti, MAHlpBtn, StdCtrls, Buttons, TB97Tlbr, TB97, wwdblook,
  Mask, wwdbedit, Wwdbspin, ExtCtrls;

type
  TFRMParamGrafEstatSuplBenef = class(TFRMParamRelEstatSuplBenef)
    procedure bbtnConfirmarClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  FRMParamGrafEstatSuplBenef: TFRMParamGrafEstatSuplBenef;

implementation

{$R *.DFM}

procedure TFRMParamGrafEstatSuplBenef.bbtnConfirmarClick(Sender: TObject);
begin
//  inherited;

end;

end.
