unit FImportaBovespa;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  FOkCancelarInv, IvDictio, IvMulti, IvEMulti, MAHlpBtn, StdCtrls, Buttons,
  TB97Tlbr, TB97, fcLabel, ExtCtrls, wwdbdatetimepicker, CMDateTimePicker;

type
  TFrmImportaBovespa = class(TfrmOkCancelarInv)
    Label1: TLabel;
    Edit1: TEdit;
    SB1: TSpeedButton;
    DateEdit1: TCMDateTimePicker;
    Label3: TLabel;
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  FrmImportaBovespa: TFrmImportaBovespa;

implementation

{$R *.DFM}

end.
