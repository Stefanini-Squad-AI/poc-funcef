unit FCadModeloNotaFiscal;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  FOkCancelar, TB97Ctls, ImgList, IvDictio, IvMulti, IvEMulti, MAHlpBtn,
  StdCtrls, Buttons, TB97Tlbr, TB97, ExtCtrls, Grids, DBGrids, DBTables,
  Db, Wwdatsrc, Wwquery;

type
  TfrmCadModeloNotaFiscal = class(TfrmOkCancelar)
    ImlPadrao: TImageList;
    Dock972: TDock97;
    Toolbar971: TToolbar97;
    sbtnInserir: TToolbarButton97;
    sbtnApagar: TToolbarButton97;
    DBGrid1: TDBGrid;
    qryModelosNF: TwwQuery;
    dsModelosNF: TwwDataSource;
    updModelosNF: TUpdateSQL;
  private
    { Private declarations }
    
  public
    { Public declarations }
  end;

var
  frmCadModeloNotaFiscal: TfrmCadModeloNotaFiscal;

implementation

{$R *.DFM}

end.
