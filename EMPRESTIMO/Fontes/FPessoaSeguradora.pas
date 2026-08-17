{-------------------------------------------------------------------------------
ALTERAÇÕES / IMPLEMENTAÇÕES ----------------------------------------------------
--------------------------------------------------------------------------------
Pendência   : 27370
Responsável : Daniel Simões
Data        : 11/02/2008
Descrição   : Alteração/Implementação do número do Help Context...
--------------------------------------------------------------------------------
-------------------------------------------------------------------------------}

unit FPessoaSeguradora;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  fPessoa, ExtDlgs, Pessoa, Db, IvDictio, IvMulti, IvEMulti, MontaSelect,
  DBTables, Wwdatsrc, Wwquery, TB97Ctls, MAHlpBtn, TB97Tlbr, Buttons, TB97,
  StdCtrls, DBCtrls, Grids, Wwdbigrd, Wwdbgrid, checklst, ComCtrls,
  CMDBLookupCombo, wwdblook, ExtCtrls,
  TabControlDetalhe, wwdbedit, Mask, CmEventosCadastro, ImgList,
  wwdbdatetimepicker, CMDateTimePicker, Wwdbspin, Wwdotdot, Wwdbcomb,
  TREdit;

type
  TfrmPessoaSeguradora = class(TfrmPessoa)
    qrySubTipoIDSEGURADORA: TFloatField;
    wwDBComboBox1: TwwDBComboBox;
    ToolbarSep972: TToolbarSep97;
    ToolbarSep973: TToolbarSep97;
    ToolbarSep974: TToolbarSep97;
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmPessoaSeguradora: TfrmPessoaSeguradora;

implementation

{$R *.DFM}

end.
