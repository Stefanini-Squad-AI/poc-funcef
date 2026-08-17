
unit FPedeDataVencimento;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  FOkCancelar, MAHlpBtn, StdCtrls, Buttons, TB97Tlbr, TB97, ExtCtrls,  IvDictio, IvMulti, IvEMulti,
  Mask, wwdbdatetimepicker, CMDateTimePicker;

type
  TfrmPedeDataVencimento = class(TfrmOkCancelar)
    lblTitulo1: TLabel;
    dtData: TCMDateTimePicker;
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure bbtnConfirmarClick(Sender: TObject);
    procedure bbtnCancelarClick(Sender: TObject);
  private

    { Private declarations }
  public
    iOkCancel : Integer // 1 para ok e 0 para cancel
    { Public declarations }
  end;

var
  frmPedeDataVencimento: TfrmPedeDataVencimento;

implementation

{$R *.DFM}

procedure TfrmPedeDataVencimento.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
//  inherited; // DEIXAR EM COMENTARIO PARA NAO EXECUTAR O FREE
end;

procedure TfrmPedeDataVencimento.bbtnConfirmarClick(Sender: TObject);
begin
  inherited;
 iOkCancel := 1;
end;

procedure TfrmPedeDataVencimento.bbtnCancelarClick(Sender: TObject);
begin
  inherited;
  iOkCancel := 0;
end;

end.
