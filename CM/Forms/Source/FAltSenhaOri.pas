unit FAltSenha;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  FPai, StdCtrls, Buttons, ExtCtrls, FOkCancelar, MAHlpBtn, TB97, TB97Tlbr,
  IvDictio, IvMulti, IvEMulti;

type
  TfrmAlterarSenha = class(TfrmOkCancelar)
    Label3: TLabel;
    Label2: TLabel;
    Label1: TLabel;
    edSenhaAtual: TEdit;
    edNovaSenha: TEdit;
    edNovaSenha2: TEdit;
    procedure bbtnCancelarClick(Sender: TObject);
    procedure bbtnConfirmarClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmAlterarSenha: TfrmAlterarSenha;

function PedirNovaSenha(var sSenha: string): Boolean;

implementation

{$R *.DFM}

uses UMensErro, UCripto, uSistema;

var
   sSenhaAtual: string;

function PedirNovaSenha(var sSenha: string): Boolean;
begin
   sSenhaAtual := sSenha;

   try
      frmAlterarSenha := TfrmAlterarSenha.Create(Application);

      Result := (frmAlterarSenha.ShowModal = mrOK);

      if Result then
         sSenha := frmAlterarSenha.edNovaSenha.Text;

   finally
      frmAlterarSenha.Free;
   end; {try...finally}

end; {PedirNovaSenha}

procedure TfrmAlterarSenha.bbtnCancelarClick(Sender: TObject);
begin
  inherited;
  edSenhaAtual.Clear;
  edNovaSenha.Clear;
  edNovaSenha2.Clear;
end;

procedure TfrmAlterarSenha.bbtnConfirmarClick(Sender: TObject);
  function StrIsAlphaNum(const S: AnsiString): Boolean;
  var
    I: Integer;
    bIsAlpha, bIsNum :Boolean;

    function CharIsAlpha(const C: AnsiChar): Boolean;
    begin
      Result := (C In ['A'..'Z']) or (C In ['a'..'z']);
    end;

    function CharIsNum(const C: AnsiChar): Boolean;
    begin
      Result := (C In ['0'..'9']);
    end;
  begin
    bIsAlpha := False;
    bIsNum := False;

    for I := 1 to Length(S) do
    begin
      if Not bIsAlpha then
         bIsAlpha := CharIsAlpha(S[I]);

      if Not bIsNum then
         bIsNum := CharIsNum(S[I]);
    end;

    Result := bIsAlpha And  bIsNum;
  end;

  function ExistsMultChar(const S: AnsiString): Boolean;
  Var
     X :Integer;
  Begin
      Result := False;

      If Trim(S) <> '' Then
      Begin
        For X:=1 To Length(S) Do
           If S[X] = S[X - 1] Then
           Begin
              Result := True;
              Break;
           End;
      End;
  End;
begin
  inherited;
  if sSenhaAtual <> CriptografarHash(edSenhaAtual.Text,Sistema.Idusuario,15)
  then
  begin
     { Erro: Senha inválida. }
     MsgDlg('Senha atual incorreta', 'Alterar senha', mtError, [mbOk, mbHelp], 0);

     { Limpa os campos e posiciona em senha }
     edSenhaAtual.Clear;
     edNovaSenha.Clear;
     edNovaSenha2.Clear;
     edSenhaAtual.SetFocus;
     Exit;
   end;

   if (edNovaSenha.Text <> edNovaSenha2.Text) or (Length(Trim(edNovaSenha.Text)) = 0) then
   begin
     { Erro: Senha inválida. }
     MsgDlg('Redigite a nova senha corretamente', 'Alterar Senha', mtWarning, [mbOk, mbHelp], 0);

     { Limpa os campos e posiciona em senha }
     edSenhaAtual.Clear;
     edNovaSenha.Clear;
     edNovaSenha2.Clear;
     edSenhaAtual.SetFocus;
     Exit;
   end;

   if Length(edNovaSenha.Text) < 6 then
   begin
     MsgDlg('Senha deve ter pelo menos 6(Seis) caracteres', 'Alterar senha', mtError, [mbOk, mbHelp], 0);

     edSenhaAtual.Clear;
     edNovaSenha.Clear;
     edNovaSenha2.Clear;
     edSenhaAtual.SetFocus;
     Exit;
   end;

   If Not StrIsAlphaNum(edNovaSenha.Text) Then
   Begin
     MsgDlg('Senha deve possuir números e letras', 'Alterar senha', mtError, [mbOk, mbHelp], 0);

     edSenhaAtual.Clear;
     edNovaSenha.Clear;
     edNovaSenha2.Clear;
     edSenhaAtual.SetFocus;
     Exit;
   End;

   If ExistsMultChar(edNovaSenha.Text) Then
   Begin
     MsgDlg('Senha não pode ter caracteres repetidos consecutivos', 'Alterar senha', mtError, [mbOk, mbHelp], 0);

     edSenhaAtual.Clear;
     edNovaSenha.Clear;
     edNovaSenha2.Clear;
     edSenhaAtual.SetFocus;
     Exit;
   End;

   { Fecha a tela com estado de Ok }
   ModalResult := mrOk;
end;

end.
