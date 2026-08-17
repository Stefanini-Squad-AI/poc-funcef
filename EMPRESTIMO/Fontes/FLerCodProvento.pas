unit FLerCodProvento;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  FOkCancelar, MAHlpBtn, StdCtrls, Buttons, ExtCtrls, TB97, TB97Tlbr,
  IvDictio, IvMulti, IvEMulti;

type
  TfrmLerCodProvento = class(TfrmOkCancelar)
    edCodProvento: TEdit;
    lblPatrocinadora: TLabel;
    lblProvento: TLabel;
    Label3: TLabel;
    Label1: TLabel;
    edDescProvento: TEdit;
    procedure FormShow(Sender: TObject);
    procedure bbtnConfirmarClick(Sender: TObject);
    procedure bbtnCancelarClick(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
  private
    { Private declarations }
  public
    { Public declarations }
    sCodProvento,
    sDescProvento  : string;
  end;

var
  frmLerCodProvento: TfrmLerCodProvento;

implementation

{$R *.DFM}

procedure TfrmLerCodProvento.FormShow(Sender: TObject);
begin
  inherited;
  sCodProvento := '';
  sDescProvento := '';
  edCodProvento.SetFocus;
end;

procedure TfrmLerCodProvento.bbtnConfirmarClick(Sender: TObject);
begin
  inherited;
  sCodProvento := edCodProvento.Text;
  sDescProvento := edDescProvento.Text;
  ModalResult := mrOk;
  Close;
end;

procedure TfrmLerCodProvento.bbtnCancelarClick(Sender: TObject);
begin
  inherited;
  sCodProvento := '';
  sDescProvento := '';
  ModalResult := mrCancel;
  Close;
end;

procedure TfrmLerCodProvento.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
//inherited; - > NAO EXECUTAR O CAFREE

end;

end.
