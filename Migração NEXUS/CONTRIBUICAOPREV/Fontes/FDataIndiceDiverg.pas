unit FDataIndiceDiverg;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  FOkCancelar, IvDictio, IvMulti, IvEMulti, MAHlpBtn, StdCtrls, Buttons,
  TB97Tlbr, TB97, wwdbdatetimepicker, CMDateTimePicker, ExtCtrls;

type
  Tfrmdataindicediverg = class(TfrmOkCancelar)
    DateEdit1: TCMDateTimePicker;
    Label1: TLabel;

    procedure bbtnSairClick(Sender: TObject);
    procedure bbtnConfirmarClick(Sender: TObject);

  private // Private declarations


  public  // Public declarations


  end;



var
  frmdataindicediverg: Tfrmdataindicediverg;



implementation
{$R *.DFM}
uses 
  FDivergContrib;



procedure Tfrmdataindicediverg.bbtnSairClick(Sender: TObject);
begin
  //inherited;
  close;
end;



procedure Tfrmdataindicediverg.bbtnConfirmarClick(Sender: TObject);
begin
  frmDivergContrib.sDataIndice := DateEdit1.text;
  inherited;
end;



end.