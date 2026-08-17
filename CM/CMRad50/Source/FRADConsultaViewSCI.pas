unit FRADConsultaViewSCI;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  FSairAjuda, Db, DBClient, uCMClientDataSet, Wwdatsrc, Grids, Wwdbigrd,
  Wwdbgrid, StdCtrls, IvDictio, IvMulti, IvEMulti, MAHlpBtn, Buttons,
  TB97Tlbr, TB97, ExtCtrls;

type
  TfrmRADConsultaViewSCI = class(TfrmSairAjuda)
    plnTitulo: TPanel;
    Label1: TLabel;
    Label2: TLabel;
    lbStatus: TLabel;
    lbCodigo: TLabel;
    LbDescricao: TLabel;
    GrdSCI: TwwDBGrid;
    dsSCI: TwwDataSource;
    cdsSCI: TCMClientDataSet;
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmRADConsultaViewSCI: TfrmRADConsultaViewSCI;

implementation

{$R *.DFM}

end.
