unit FMTViewSCI;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  FSairAjuda, IvDictio, IvMulti, IvEMulti, MAHlpBtn, StdCtrls, Buttons,
  TB97Tlbr, TB97, ExtCtrls, Grids, Wwdbigrd, Wwdbgrid, DBCtrls, Db,
  DBClient, uCMClientDataSet, Wwdatsrc, uCmSqlParams;

type
  TFrmMTViewSCI = class(TfrmSairAjuda)
    plnTitulo: TPanel;
    Label1: TLabel;
    Label2: TLabel;
    GrdSCI: TwwDBGrid;
    dsSCI: TwwDataSource;
    cdsSCI: TCMClientDataSet;
    lbStatus: TLabel;
    lbCodigo: TLabel;
    LbDescricao: TLabel;
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  FrmMTViewSCI: TFrmMTViewSCI;

implementation

{$R *.DFM}

end.
