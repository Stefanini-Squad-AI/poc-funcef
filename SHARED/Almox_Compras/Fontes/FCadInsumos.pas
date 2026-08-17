unit FCadInsumos;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  FCadProduto, Db, MontaSelect, DBTables, Wwdatsrc, Wwquery, TB97Ctls,
  MAHlpBtn, TB97Tlbr, DBCtrls, ComCtrls, CMTree, Mask, Grids, Wwdbigrd,
  Wwdbgrid, StdCtrls, TREdit, Buttons, TB97, TabControlDetalhe, ExtCtrls,
  wwdbedit, wwdblook, CMDBLookupCombo, IvDictio, IvMulti, IvEMulti,
  CMProcuraMask, CmEventosCadastro, ImgList;

type
  TfrmCadInsumos = class(TfrmCadProduto)
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmCadInsumos: TfrmCadInsumos;

implementation

{$R *.DFM}
Uses UDataBase, DBaseDados, uModulo;

end.
