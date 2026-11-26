// *****************************************************************************
// ***************************** REGISTRO DE ALTERAÇÕES ************************
// *****************************************************************************

{*******************************************************************************
 N. SIG.......: 137435
 Data.........: 14/07/2023
 Responsável..: Andre Itiro Imakawa
 Descrição....: Senha deve aceitar letra minúscula
********************************************************************************
 N. SIG.......: 120880
 Data.........: 12/11/2021
 Responsável..: Everson Cunha
 Descrição....: Não permitir a execução do PLANUS no diretório TOTALPREV
********************************************************************************
 N. SIG.......: 103334
 Data.........: 21/10/2020
 Responsável..: Andre Itiro Imakawa
 Descrição....: Não permitir a execução do PLANUS em um diretório da rede.
********************************************************************************
 N. SIG.......: Recuperação de Senha
 Data.........: 06/07/2020
 Responsável..: Everson Cunha
 Descrição....: Implementação do link "Esqueceu a senha?"
********************************************************************************
 N. SIG.......: 63875
 Data.........: 23/02/2018
 Responsável..: Andre Imakawa
 Descrição....: Desfeito o SIG 34335, devido ao travamento na tela de Login
********************************************************************************
 N. SIG.......: 34335
 Data.........: 16/02/2018
 Responsável..: Andre Imakawa
 Descrição....: Correção na impressão da impressora.
******************************************************************************** }

unit FLogin;

interface

uses
  Windows, Messages, UMensErro, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  StdCtrls, ExtCtrls, Buttons, FPai, MAHlpBtn, ToolWin, ComCtrls,
  TB97Tlbr, IvDictio, IvMulti, IvEMulti, TB97, CmDock, uTeclado, uSistema,
  fcLabel;

type
  TfrmLogin = class(TfrmPai)
    pnlFundo: TPanel;
    Label2: TLabel;
    edSenha: TEdit;
    Label1: TLabel;
    Image1: TImage;
    Bevel1: TBevel;
    CMOkCancelar1: TCMOkCancelar;
    TcLogin: TTeclado;
    edUsuario: TEdit;
    BtnTclUsuario: TSpeedButton;
    BtnTclSenha: TSpeedButton;
    lblChangePassword: TfcLabel; //Everson Cunha / Recuperação de Senha
    procedure FormActivate(Sender: TObject);
    procedure CMOkCancelar1OkClick(Sender: TObject);
    procedure CMOkCancelar1CancelarClick(Sender: TObject);
    procedure CMOkCancelar1SairClick(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure BtnTclUsuarioClick(Sender: TObject);
    procedure FormCreate(Sender: TObject);

	//Everson Cunha / Recuperação de Senha - Início
    procedure lblChangePasswordClick(Sender: TObject);
    procedure lblChangePasswordMouseMove(Sender: TObject;
      Shift: TShiftState; X, Y: Integer);
    procedure lblChangePasswordMouseLeave(Sender: TObject);
	//Everson Cunha / Recuperação de Senha - Fim

  private
    { Private declarations }
  public
    FChangePassword : Boolean; //Everson Cunha / Recuperação de Senha
    { Public declarations }
  end;
// Andre Imakawa - SIG 103334 - Inicio
TFechaApp = class(TThread)
  private
    Procedure Finaliza;
  Protected
    Procedure Execute; OverRide;
  public
    constructor Create;

  end;
// Andre Imakawa - SIG 103334 - Fim
implementation

{$R *.DFM}

// Andre Imakawa - SIG 103334 - Inicio
constructor TFechaApp.Create;
begin
  inherited Create(true); // cria suspensa
  FreeOnTerminate := True; // deixa voc liberar o objeto
  Suspended := False;
end;

Procedure TFechaApp.Execute;
begin
  Application.ProcessMessages;
  Finaliza;
  Application.ProcessMessages;
end;

Procedure TFechaApp.Finaliza;
begin
   Sleep(10000);
   Application.Terminate;
end;
// Andre Imakawa - SIG 103334 - Fim

procedure TfrmLogin.FormActivate(Sender: TObject);
begin
  edUsuario.SetFocus;
end;

procedure TfrmLogin.CMOkCancelar1OkClick(Sender: TObject);
begin
  inherited;
  ModalResult := mrOk;
end;

procedure TfrmLogin.CMOkCancelar1CancelarClick(Sender: TObject);
begin
  inherited;
  edUsuario.Text := '';
  edSenha.Text := '';
end;

procedure TfrmLogin.CMOkCancelar1SairClick(Sender: TObject);
begin
  inherited;
  ModalResult := idAbort;
end;

procedure TfrmLogin.FormShow(Sender: TObject);
var
  th : TFechaApp;
begin
  inherited;
  Application.ProcessMessages;
  BringToFront;

  // Andre Imakawa - SIG 103334 - Inicio
  //if Copy(ExpandUNCFileName(ParamStr(0)),1,2) = '\\' then //Everson Cunha - SIG120880
  if Pos('TOTALPREV', UpperCase(ParamStr(0))) <> 0 then     //Everson Cunha - SIG120880
  begin
    th := TFechaApp.Create;
    //ShowMessage('Este aplicativo não pode ser executado diretamente de um diretório da rede.' +#13+ //Everson Cunha - SIG120880
    ShowMessage('Este aplicativo não pode ser executado neste diretório.' +#13+                       //Everson Cunha - SIG120880
                'Favor executar a versão em seu computador.');
    Sistema.FezLogin := False;
    Application.Terminate;
  end;
  // Andre Imakawa - SIG 103334 - Fim
end;

procedure TfrmLogin.BtnTclUsuarioClick(Sender: TObject);
begin
  inherited;
  Case TSpeedButton(Sender).Tag of
    0:
    Begin
      TcLogin.Caption := 'Usuário';
      TcLogin.EditControl := edUsuario;
      TcLogin.PassWordChar := #0;
    End;
    1:
    Begin
      TcLogin.Caption := 'Senha';
      TcLogin.EditControl := edSenha;
      TcLogin.PassWordChar := '*';
    End;
  End;

  TcLogin.Execute;
end;

procedure TfrmLogin.FormCreate(Sender: TObject);
begin
  inherited;
  If Sistema.UsaTecladoLogin Then
  Begin
     edUsuario.Width := 179;
     edSenha.Width := 179;
     BtnTclUsuario.Visible := True;
     BtnTclSenha.Visible := True;
  End;
  
end;

//Everson Cunha / Recuperação de Senha - Início
procedure TfrmLogin.lblChangePasswordClick(Sender: TObject);
begin
  inherited;

  if trim(edUsuario.Text) = '' then
  begin
       MsgDlg('Obrigatório informar o campo Usuário', 'Atenção!', mtWarning, [mbOk], 0);

       if edUsuario.CanFocus then
          edUsuario.SetFocus;
  end
  else
  begin
    FChangePassword := True;
    ModalResult := mrOk;
  end;
end;
//Everson Cunha / Recuperação de Senha - Fim

//Everson Cunha / Recuperação de Senha - Início
procedure TfrmLogin.lblChangePasswordMouseMove(Sender: TObject;
  Shift: TShiftState; X, Y: Integer);
begin
  inherited;

  TLabel(Sender).Font.Style := [fsBold, fsUnderline];
  TLabel(Sender).Cursor := crHandPoint;
end;
//Everson Cunha / Recuperação de Senha - Fim

//Everson Cunha / Recuperação de Senha - Início
procedure TfrmLogin.lblChangePasswordMouseLeave(Sender: TObject);
begin
  inherited;

  TLabel(Sender).Font.Style := [fsBold];
  TLabel(Sender).Cursor := crDefault;
end;
//Everson Cunha / Recuperação de Senha - Fim

end.

