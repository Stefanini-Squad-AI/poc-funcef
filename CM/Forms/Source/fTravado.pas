unit fTravado;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  FOkCancelar, StdCtrls, ExtCtrls, IvDictio, IvMulti, IvEMulti, MAHlpBtn,
  Buttons, TB97Tlbr, TB97;

type
  TFrmTravado = class(TfrmOkCancelar)
    EdSenha: TEdit;
    Label1: TLabel;
    Label2: TLabel;
    Image1: TImage;
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure FormCreate(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  FrmTravado: TFrmTravado;
  sSenha: String;

implementation

uses uSistema, uCripto, uDatabase, dbasedados, uMensErro;

{$R *.DFM}

procedure TFrmTravado.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  inherited;
  If CriptografarHash( EdSenha.Text, Sistema.IdUsuario, 15 ) <> sSenha Then Begin
     MsgDlg( 'Senha Inválida!', 'Segurança', MtInformation, [ Mbok ], 0 );
     Action := caNone;
  End;
end;

procedure TFrmTravado.FormCreate(Sender: TObject);
begin
  inherited;
  FazQuery( dtmBaseDados.Qry, 'SELECT SENHA FROM USUARIOSISTEMA WHERE IDUSUARIO = ' +
                              IntToStr( Sistema.IdUsuario ) );
  sSenha := dtmBaseDados.qry.FieldByname( 'Senha' ).AsString;
  dtmBaseDados.Qry.Close;
end;

end.
