unit FCadEmprAdq;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  fPessoa, ExtDlgs, Pessoa, Db, IvDictio, IvMulti, IvEMulti, MontaSelect,
  DBTables, Wwdatsrc, Wwquery, TB97Ctls, MAHlpBtn, TB97Tlbr, Buttons, TB97,
  StdCtrls, DBCtrls, checklst, Grids, Wwdbigrd, Wwdbgrid, ComCtrls,
  ExtCtrls, TabControlDetalhe, Mask, wwdbedit,
  CMDBLookupCombo, CmEventosCadastro, ImgList, wwdbdatetimepicker,
  CMDateTimePicker, Wwdbspin, wwdblook, TREdit;

type
  TfrmCadEmprAdq = class(TfrmPessoa)
  end;

var
  frmCadEmprAdq: TfrmCadEmprAdq;

implementation

{$R *.DFM}

end.
