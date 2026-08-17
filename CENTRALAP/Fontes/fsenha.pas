unit fsenha;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  FOkCancelar, IvDictio, IvMulti, IvEMulti, MAHlpBtn, StdCtrls, Buttons,
  TB97Tlbr, TB97, ExtCtrls, Db, DBTables, Wwquery, uCripto;
   TYPE
  Tfrmsenha = class(TfrmOkCancelar)
    edNomeUsuario: TEdit;
    EdSenha: TEdit;
    Label1: TLabel;
    Label2: TLabel;
    qrySenha: TwwQuery;
    qrySenhaSENHA: TStringField;
    Label3: TLabel;
    Label4: TLabel;
    QryUsuario: TwwQuery;
    QryUsuarioIDUSUARIO: TFloatField;
    procedure bbtnConfirmarClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmsenha: Tfrmsenha;


implementation

 USES datend, uString, uFuncaoGeral, uDataBase, fTelaAut, FCadRubNew, uSistema,
     fSelMotivoBaixa, dRubs, FSelCartaEtiq,UMensErro, FPrincipal;
{$R *.DFM}

procedure Tfrmsenha.bbtnConfirmarClick(Sender: TObject);
VAR
SENHA : STRING;
begin
  inherited;
  If QryUsuario.Active Then QryUsuario.Close;
  QryUsuario.Params[0].AsString := ednomeUsuario.Text;
  QryUsuario.Open;

   If QryUsuario.IsEmpty Then
  BEGIN
     MsgDlg('Usuario Invalido','Atenção',mtError,[mbOk],0);
  END   
  Else
  Begin
     sSenha := frmSenha.edSenha.Text;
     sUsuario := frmSenha.ednomeUsuario.Text;
       If QrySENHA.Active Then QrySENHA.Close;
         QrySENHA.ParamByName('USUARIO').AsSTRING := SUSUARIO;
         QrySENHA.ParamByName('SENHA').AsSTRING := CriptografarHash(sSenha,QryUsuarioIDUSUARIO.AsInteger,15);
         QrySENHA.Open;
        SENHA := qrySENHASENHA.AsString;
     if  Qrysenha.Eof Then
       MsgDlg('Usuario ou Senha Invalido','Atenção',mtError,[mbOk],0);
  End;
  Close;
end;

end.
