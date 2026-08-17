unit fExecRecalcAtraso;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  FOkCancelar, IvDictio, IvMulti, IvEMulti, MAHlpBtn, StdCtrls, Buttons,
  TB97Tlbr, TB97, ExtCtrls, mContrato, uCmSqlParams, Db, DBClient,
  uCMClientDataSet;

type
  TfrmExecRecalcAtraso = class(TfrmOkCancelar)
    molContrato1: TmolContrato;
    cdsParc: TCMClientDataSet;
    sqlParc: TCMSqlParams;
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmExecRecalcAtraso: TfrmExecRecalcAtraso;

implementation

{$R *.DFM}

end.
