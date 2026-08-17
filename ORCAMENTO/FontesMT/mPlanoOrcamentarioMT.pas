unit mPlanoOrcamentarioMT;

interface

uses 
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  Db, DBClient, uCMClientDataSet, uCmSqlParams, StdCtrls, wwdblook;

type
  TmolPlanoOrcamentario = class(TFrame)
    Label2: TLabel;
    cboPlanoOrcamen: TwwDBLookupCombo;
    sqlPlanoOrcamen: TCMSqlParams;
    CdsPlanoOrcamen: TCMClientDataSet;
    cdsParametro: TCMClientDataSet;
    sqlParametro: TCMSqlParams;
    procedure CdsPlanoOrcamenAfterOpen(DataSet: TDataSet);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

implementation

{$R *.DFM}

procedure TmolPlanoOrcamentario.CdsPlanoOrcamenAfterOpen(
  DataSet: TDataSet);
begin
  sqlParametro.Prepare;
  sqlParametro.Open;
  cboPlanoOrcamen.LookupValue := cdsParametro.Fields[0].AsString;
end;

end.
