unit FCadItemPDV;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  FCadProduto, Db, IvDictio, IvMulti, IvEMulti, MontaSelect, DBTables,
  Wwdatsrc, Wwquery, TB97Ctls, MAHlpBtn, TB97Tlbr, StdCtrls, Buttons, TB97,
  CMDBLookupCombo, DBCtrls, CMProcuraMask, Grids, Wwdbigrd, Wwdbgrid,
  TREdit, ComCtrls, TabControlDetalhe, ExtCtrls, Mask, wwdbedit, wwdblook,
  CmEventosCadastro, ImgList;

type
  TFrmCadItemPDV = class(TfrmCadProduto)
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  FrmCadItemPDV: TFrmCadItemPDV;

implementation

{$R *.DFM}

end.
