unit FCadEntid;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  fPessoa, Db, Pessoa, Menus, MontaSelect, DBTables, Wwquery, Wwdatsrc,
  TB97, MAHlpBtn, StdCtrls, Buttons, Grids, Wwdbigrd, Wwdbgrid, checklst,
  DBCtrls, TabControlDetalhe, wwdblook, Mask, wwdbedit,
  ExtCtrls, ExtDlgs, TB97Ctls, TB97Tlbr, IvDictio, IvMulti, IvEMulti,
  CMDBLookupCombo, Wwdbspin, CmEventosCadastro, ImgList, ComCtrls,
  wwdbdatetimepicker, CMDateTimePicker;

type
  TfrmCadEntid = class(TfrmPessoa)
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmCadEntid: TfrmCadEntid;

implementation

{$R *.DFM}

end.
