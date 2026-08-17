//------------------------------------------------------------------
// Sistema  .: ADMPREV
//------------------------------------------------------------------
// Formulário para pedir um novo Motivo.
// 19/09/00
// Alexandre Ramos 
//------------------------------------------------------------------------------
unit FInformaData;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  FOkCancelar, Db, DBTables, Wwquery, StdCtrls, wwdblook, IvDictio,
  IvMulti, IvEMulti, MAHlpBtn, Buttons, TB97Tlbr, TB97, ExtCtrls,
  wwdbdatetimepicker, CMDateTimePicker;

type
  TFrmInformaData = class(TfrmOkCancelar)
    Label8: TLabel;
    Data: TCMDateTimePicker;
  private
    { Private declarations }
  public
    { Public declarations }
    wIdMotivo : Integer;
  end;

var
  FrmInformaData: TFrmInformaData;


implementation

{$R *.DFM}

end.
