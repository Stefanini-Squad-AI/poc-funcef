unit FPedeInfAux;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  FOkCancelar, MAHlpBtn, StdCtrls, Buttons, TB97Tlbr, TB97, ExtCtrls,  IvDictio, IvMulti, IvEMulti,
  Mask, wwdbdatetimepicker, CMDateTimePicker;

type
  TfrmPedeInfAux = class(TfrmOkCancelar)
    lblTitulo1: TLabel;
    edInf1: TMaskEdit;
    dtData: TCMDateTimePicker;
    procedure FormShow(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmPedeInfAux: TfrmPedeInfAux;

implementation

{$R *.DFM}

procedure TfrmPedeInfAux.FormShow(Sender: TObject);
begin
  inherited;
  edInf1.Text := '';
  edInf1.SetFocus;
end;

procedure TfrmPedeInfAux.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
//  inherited; // DEIXAR EM COMENTARIO PARA NAO EXECUTAR O FREE

end;

end.
