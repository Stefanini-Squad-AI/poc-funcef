unit fRenumerarEtapas;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  FOkCancelar, IvDictio, IvMulti, IvEMulti, MAHlpBtn, StdCtrls, Buttons,
  TB97Tlbr, TB97, ExtCtrls, Mask, wwdbedit, Wwdbspin, uMensErro;

type
  TfrmRenumerarEtapas = class(TfrmOkCancelar)
    lblTxtRenumerar: TLabel;
    dbspnNumero: TwwDBSpinEdit;
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure bbtnConfirmarClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmRenumerarEtapas: TfrmRenumerarEtapas;

implementation

{$R *.DFM}

procedure TfrmRenumerarEtapas.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
  inherited;
  Action := caHide;
end;

procedure TfrmRenumerarEtapas.bbtnConfirmarClick(Sender: TObject);
begin
  inherited;

  if trim( dbspnNumero.Text ) = '' then
  begin
    MsgDlg( 'Informe o novo número da etapa inicial.', 'Erro', mtError, [mbOk], 0 );
    dbspnNumero.SetFocus;
    exit;
  end;

  if dbspnNumero.Value < dbspnNumero.MinValue then
  begin
    MsgDlg( 'O novo número de etapa deve ser maior que o atual (' +
     FloatToStr( dbspnNumero.MinValue - 1 ) + ').', 'Erro', mtError, [mbOk], 0 );
    dbspnNumero.SetFocus;
    exit;
  end;

  ModalResult := mrOk;
end;

end.
