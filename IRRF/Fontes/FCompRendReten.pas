unit FCompRendReten;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  FOkCancelar, IvDictio, IvMulti, IvEMulti, MAHlpBtn, StdCtrls, Buttons,
  TB97Tlbr, TB97, wwdbdatetimepicker, CMDateTimePicker, ExtCtrls;

type
  TfrmCompRendReten = class(TfrmOkCancelar)
    CheckBox1: TCheckBox;
    grpbxResponsavel: TGroupBox;
    Label1: TLabel;
    edtNome: TEdit;
    dtdtData: TCMDateTimePicker;
    Label2: TLabel;
    procedure CheckBox1Click(Sender: TObject);
    procedure FormActivate(Sender: TObject);

  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmCompRendReten: TfrmCompRendReten;

implementation
uses DRelatIRRF,uSistema;

{$R *.DFM}



procedure TfrmCompRendReten.CheckBox1Click(Sender: TObject);
begin
  inherited;
   if CheckBox1.checked then begin
     grpbxResponsavel.Enabled     := true;
     edtNome.Color                := clwindow;
     dtdtData.color               := clwindow;
   end else begin
     grpbxResponsavel.Enabled     := false;
     edtNome.Color                := clgray;
     dtdtData.color               := clgray;
   end;
end;

procedure TfrmCompRendReten.FormActivate(Sender: TObject);
begin
     inherited;
     grpbxResponsavel.Enabled := false;
     edtNome.Color            := clgray;
     dtdtData.color           := clgray;
     dtdtData.text            := datetimetostr(date);
end;



end.
