unit FPessoaCartorio;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  fPessoa, ExtDlgs, Pessoa, Db, IvDictio, IvMulti, IvEMulti, MontaSelect,
  DBTables, Wwdatsrc, Wwquery, TB97Ctls, MAHlpBtn, TB97Tlbr, Buttons, TB97,
  StdCtrls, DBCtrls, checklst, Grids, Wwdbigrd, Wwdbgrid, wwdblook,
  ComCtrls, ExtCtrls, TabControlDetalhe,
  wwdbedit, Mask, Wwdbspin, CmEventosCadastro, ImgList, CMDBLookupCombo,
  wwdbdatetimepicker, CMDateTimePicker, Wwdotdot, Wwdbcomb, TREdit;

type
  TfrmPessoaCartorio = class(TfrmPessoa)
    wwDBComboBox1: TwwDBComboBox;
    ToolbarSep972: TToolbarSep97;
    ToolbarSep973: TToolbarSep97;
    ToolbarSep975: TToolbarSep97;
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmPessoaCartorio: TfrmPessoaCartorio;

implementation

{$R *.DFM}

end.
