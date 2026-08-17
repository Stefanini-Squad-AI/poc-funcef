unit FMTViewRestricao;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  FSairAjuda, StdCtrls, DBCtrls, Grids, Wwdbigrd, Wwdbgrid, IvDictio,
  IvMulti, IvEMulti, MAHlpBtn, Buttons, TB97Tlbr, TB97, ExtCtrls, Db,
  DBClient, uCMClientDataSet, Wwdatsrc;

type
  TFrmMTViewRestricao = class(TfrmSairAjuda)
    Label1: TLabel;
    edForn: TEdit;
    plnf: TPanel;
    Panel1: TPanel;
    Grd: TwwDBGrid;
    Panel2: TPanel;
    Panel3: TPanel;
    memMotivo: TDBMemo;
    ds: TwwDataSource;
    Cds: TCMClientDataSet;
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  FrmMTViewRestricao: TFrmMTViewRestricao;

implementation

{$R *.DFM}

end.
