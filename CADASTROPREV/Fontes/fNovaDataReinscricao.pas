unit fNovaDataReinscricao;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  FOkCancelar, IvDictio, IvMulti, IvEMulti, MAHlpBtn, StdCtrls, Buttons,
  TB97Tlbr, TB97, ExtCtrls, wwdbdatetimepicker, CMDateTimePicker;

type
  TfrmNovaDataReinscricao = class(TfrmOkCancelar)
    dtEvento: TCMDateTimePicker;
    Label10: TLabel;
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmNovaDataReinscricao: TfrmNovaDataReinscricao;

implementation

{$R *.DFM}

end.
