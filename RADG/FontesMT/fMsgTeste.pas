unit fMsgTeste;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  FOkCancelar, IvDictio, IvMulti, IvEMulti, MAHlpBtn, StdCtrls, Buttons,
  TB97Tlbr, TB97, ExtCtrls, uMensErro;

type
  TfrmMsgTeste = class(TfrmOkCancelar)
    lblIndique: TLabel;
    edtDestinatario: TEdit;
    Label2: TLabel;
    memMensagem: TMemo;
    procedure bbtnConfirmarClick(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmMsgTeste: TfrmMsgTeste;

implementation

{$R *.DFM}

procedure TfrmMsgTeste.bbtnConfirmarClick(Sender: TObject);
begin
  inherited;
  if trim( edtDestinatario.Text ) = '' then
  begin
    MsgDlg( 'Informe o destinatário.', 'Erro', mtError, [mbOk], 0 );
    edtDestinatario.SetFocus;
    exit;
  end;

  if trim( memMensagem.Text ) = '' then
  begin
    MsgDlg( 'Informe a mensagem.', 'Erro', mtError, [mbOk], 0 );
    memMensagem.SetFocus;
    exit;
  end;
      
  ModalResult := mrOk;
end;

procedure TfrmMsgTeste.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
  inherited;
  Action := caHide;
end;

end.
