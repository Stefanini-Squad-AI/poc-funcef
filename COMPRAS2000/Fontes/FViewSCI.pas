unit FViewSCI;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  FSairAjuda, IvDictio, IvMulti, IvEMulti, MAHlpBtn, StdCtrls, Buttons,
  TB97Tlbr, TB97, ExtCtrls, Grids, Wwdbigrd, Wwdbgrid, DBCtrls;

type
  TFrmViewSCI = class(TfrmSairAjuda)
    GrdSCI: TwwDBGrid;
    plnTitulo: TPanel;
    Label1: TLabel;
    Label2: TLabel;
    DBText1: TDBText;
    DBText2: TDBText;
    DBText3: TDBText;
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  FrmViewSCI: TFrmViewSCI;

implementation

uses FCancelaOC;

{$R *.DFM}

end.
