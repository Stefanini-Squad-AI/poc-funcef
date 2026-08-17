unit fMTInvRegResLocBem;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  FOkCancelar, IvDictio, IvMulti, IvEMulti, MAHlpBtn, StdCtrls, Buttons,
  TB97Tlbr, TB97, ExtCtrls;

type
  TfrmMTInvRegResLocBem = class(TfrmOkCancelar)
    Label1: TLabel;
    Label2: TLabel;
    edtPlaca: TEdit;
    edtDescricao: TEdit;
    procedure bbtnConfirmarClick(Sender: TObject);
    procedure edtPlacaKeyPress(Sender: TObject; var Key: Char);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmMTInvRegResLocBem: TfrmMTInvRegResLocBem;

implementation

{$R *.DFM}

procedure TfrmMTInvRegResLocBem.bbtnConfirmarClick(Sender: TObject);
begin
   inherited;
   if (trim(edtPlaca.Text) = '') and (trim(edtDescricao.Text) = '') then
   begin
      ShowMessage('Indique a placa e/ou a descrição a localizar.');
      exit;
   end;
   ModalResult := mrOk;
end;

procedure TfrmMTInvRegResLocBem.edtPlacaKeyPress(Sender: TObject; var Key: Char);
begin
   inherited;
   if Pos( Key, '1234567890' ) <= 0 then
      Abort;
end;

end.

