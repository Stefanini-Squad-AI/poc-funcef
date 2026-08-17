{-------------------------------------------------------------------------------
ALTERAÇÕES / IMPLEMENTAÇÕES ----------------------------------------------------
--------------------------------------------------------------------------------
Pendência    : 27508
Responsável  : Daniel Simões
Data         : 03/03/2008
Descrição    : Ajustes no Help Context...
--------------------------------------------------------------------------------
-------------------------------------------------------------------------------}

unit FExecRecalculoDocumentoAliena;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  FExecRecalculoDocumentoMT, Db, DBClient, uCMClientDataSet, MontaSelect,
  IvDictio, IvMulti, IvEMulti, fcButton, fcImgBtn, fcShapeBtn, MAHlpBtn,
  TB97Tlbr, TB97, Wwdbspin, wwdbedit, StdCtrls, Spin, CMDBLookupCombo,
  wwdbdatetimepicker, CMDateTimePicker, Wwdotdot, Wwdbcomb, TREdit,
  wwdblook, Buttons, Grids, Wwdbigrd, Wwdbgrid, Mask, DBCtrls, fcLabel,
  ComCtrls, ExtCtrls;

type
  TfrmExecRecalculoDocumentoAlienacao = class(TfrmExecRecalculoDocumentoMT)
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmExecRecalculoDocumentoAlienacao: TfrmExecRecalculoDocumentoAlienacao;

implementation

{$R *.DFM}

end.
