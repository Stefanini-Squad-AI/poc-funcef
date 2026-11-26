unit RPai;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  FPai, ExtCtrls, QuickRpt, QrPrntr, QrCtrls, ftelaAut, IvDictio, IvMulti,
  IvEMulti;

type
  TrelPai = class(TfrmPai)
    qr: TQuickRep;
    procedure qrPreview(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure qrAfterPreview(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  relPai: TrelPai;

implementation

uses FCMPreview;

{$R *.DFM}


{ Chamada do frmCMPreview que mostra o padrão de fundo do relatório}
procedure TrelPai.qrPreview(Sender: TObject);
begin
  inherited;
  Application.CreateForm(TfrmCMPreview,frmCMPreview);
  frmCMPreview.Caption := 'Visualizar Impressão: ' + Caption;
  frmCMPreview.SetPrinter(qr.QRPrinter);
end;

procedure TrelPai.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  inherited;
  Action := caFree;
end;

procedure TrelPai.qrAfterPreview(Sender: TObject);
begin
  inherited;
  TForm(Owner).WindowState := wsNormal;
end;

end.
