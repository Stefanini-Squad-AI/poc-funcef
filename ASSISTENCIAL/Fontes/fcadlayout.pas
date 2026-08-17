unit fcadlayout;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  FCadastroCS, CmEventosCadastro, ImgList, Db, Wwdatsrc, MontaSelect,
  DBTables, IvDictio, IvMulti, IvEMulti, Wwquery, MAHlpBtn, StdCtrls,
  Buttons, TB97Tlbr, TB97Ctls, TB97, ExtCtrls,
  Grids, DBGrids, Wwdbigrd, Wwdbgrid;

type
  TFrmCadLayout = class(TfrmCadastroCS)
    Panel1: TPanel;
    Label3: TLabel;
    Edit3: TEdit;
    Label4: TLabel;
    Edit4: TEdit;
    wwDBGrid1: TwwDBGrid;
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  FrmCadLayout: TFrmCadLayout;

implementation

{$R *.DFM}

end.
