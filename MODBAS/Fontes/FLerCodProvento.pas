unit FLerCodProvento;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  FOkCancelar, MAHlpBtn, StdCtrls, Buttons, ExtCtrls, TB97, TB97Tlbr,
  IvDictio, IvMulti, IvEMulti;

type
  TfrmLerCodProvento = class(TfrmOkCancelar)
    edCodProvento: TEdit;
    lblEmpresa: TLabel;
    lblProvento: TLabel;
    Label3: TLabel;
    Label1: TLabel;
    edDescProvento: TEdit;
    chkbxVisivel: TCheckBox;
    procedure FormShow(Sender: TObject);
    procedure bbtnConfirmarClick(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure bbtnCancelarClick(Sender: TObject);
    procedure bbtnSairClick(Sender: TObject);
    procedure chkbxVisivelClick(Sender: TObject);
  private
    { Private declarations }
  public
    bVisivel, bHabilitaSair: boolean;
    sCodProvento, sDescProvento: string;
  end;

var
  frmLerCodProvento: TfrmLerCodProvento;

implementation

uses uMensErro;

{$R *.DFM}

procedure TfrmLerCodProvento.FormShow(Sender: TObject);
begin
  inherited;
  sCodProvento     := '';
  sDescProvento    := '';
  bbtnSair.Enabled := (bHabilitaSair);
  bbtnSair.Visible := (bHabilitaSair);

  chkbxVisivelClick(Sender);

  edCodProvento.SetFocus;
end;

procedure TfrmLerCodProvento.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  //inherited; - > NAO EXECUTAR O CAFREE
end;

procedure TfrmLerCodProvento.bbtnConfirmarClick(Sender: TObject);
begin
  if (Trim(edCodProvento.Text) = '') then
  begin
    MsgDlg('Por favor, informe o Código da Rubrica !','Aviso',mtWarning,[mbOK,mbHelp],0);
    edCodProvento.SetFocus;
    exit;
  end
  else
  if (Trim(edDescProvento.Text) = '') then
  begin
    MsgDlg('Por favor, informe a Descrição da Rubrica !','Aviso',mtWarning,[mbOK,mbHelp],0);
    edDescProvento.SetFocus;
    exit;
  end;

  sCodProvento  := edCodProvento.Text;
  sDescProvento := edDescProvento.Text;
  bVisivel      := chkbxVisivel.Checked;

  ModalResult   := mrOk;
end;

procedure TfrmLerCodProvento.bbtnCancelarClick(Sender: TObject);
begin
  sCodProvento  := '';
  sDescProvento := '';
  ModalResult   := mrCancel;
end;

procedure TfrmLerCodProvento.bbtnSairClick(Sender: TObject);
begin
  sCodProvento  := '';
  sDescProvento := '';
  ModalResult   := mrAbort;
end;

procedure TfrmLerCodProvento.chkbxVisivelClick(Sender: TObject);
begin
  inherited;
  if (chkbxVisivel.Checked) then
    chkbxVisivel.Font.Color := clNavy
  else
    chkbxVisivel.Font.Color := clTeal;
end;

end.
