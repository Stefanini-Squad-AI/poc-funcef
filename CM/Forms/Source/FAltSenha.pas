// *****************************************************************************
// ***************************** REGISTRO DE ALTERAÇÕES ************************
// *****************************************************************************

{*******************************************************************************
 N. SIG......: 137435
 Data........: 14/07/2023
 Responsável.: André Imakawa
 Descrição...: Criação da validação maiuscula, minuscula e Especial
******************************************************************************** }

unit FAltSenha;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  FPai, StdCtrls, Buttons, ExtCtrls, FOkCancelar, MAHlpBtn, TB97, TB97Tlbr,
  Wwquery, // Andre Imakawa - SIG137435
  IvDictio, IvMulti, IvEMulti, Db, DBTables, uCmSqlParams, DBClient;

type
  TfrmAlterarSenha = class(TfrmOkCancelar)
    Label3: TLabel;
    Label2: TLabel;
    Label1: TLabel;
    edSenhaAtual: TEdit;
    edNovaSenha: TEdit;
    edNovaSenha2: TEdit;
    CdsUsuario: TClientDataSet;
    SqlUsuario: TCMSqlParams;
    CdsHistSenha: TClientDataSet;
    SqlHistSenha: TCMSqlParams;
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

uses UMensErro, UCripto, uSistema, dAutorizacao;

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
var
  bSenhaLetraMaiuscula, bSenhaLetraMinuscula, bSenhaEspecial: Boolean;  // Andre Imakawa - SIG137435
  function StrIsAlphaNum(const S: AnsiString;var sMsg: String): Boolean;
  var
    I: Integer;
    bIsAlpha, bIsNum, bIsAlphaUpper, bIsAlphaLower, bIsEspecial: Boolean; // Andre Imakawa - SIG137435
    function CharIsAlpha(const C: AnsiChar): Boolean;
    begin
      Result := (C In ['A'..'Z']) or (C In ['a'..'z']);
    end;

    function CharIsNum(const C: AnsiChar): Boolean;
    begin
      Result := (C In ['0'..'9']);
    end;

    // Andre Imakawa - SIG137435 - Inicio
    function CharIsAlphaUpper(const C: AnsiChar): Boolean;
    begin
      Result := (C In ['A'..'Z']);
    end;

    function CharIsAlphaLower(const C: AnsiChar): Boolean;
    begin
      Result := (C In ['a'..'z']);
    end;

    function CharIsEspecial(const C: AnsiChar): Boolean;
    begin
      Result := not((C In ['A'..'Z']) or (C In ['a'..'z']) or (C In ['0'..'9']));
    end;
    // Andre Imakawa - SIG137435 - Fim

  begin
    bIsAlpha := False;
    bIsNum := False;
    bIsAlphaUpper := False;  // Andre Imakawa - SIG137435
    bIsAlphaLower := False;  // Andre Imakawa - SIG137435
    bIsEspecial := False;    // Andre Imakawa - SIG137435

    for I := 1 to Length( S ) do begin
        if Not bIsAlpha then
           bIsAlpha := CharIsAlpha( S[ I ] );

        if Not bIsNum then
           bIsNum := CharIsNum( S[ I ] );
           
        // Andre Imakawa - SIG137435 - Inicio
        if Not bIsAlphaUpper then
           bIsAlphaUpper := CharIsAlphaUpper( S[ I ] );

        if Not bIsAlphaLower then
           bIsAlphaLower := CharIsAlphaLower( S[ I ] );

        if Not bIsEspecial then
           bIsEspecial := CharIsEspecial( S[ I ] );
        // Andre Imakawa - SIG137435 - Fim
    end;

    // Ver com o Gustavo onde tem um query que eu possa utilizar para testar
    // os parametros
    // Andre Imakawa - SIG137435 - Inicio
    // Testa se precisa ter numeros e/ou letras
    {
    If Sistema.SenhaLetra Then
       If Sistema.SenhaNumero Then
          Result := bIsAlpha And bIsNum
       Else
          Result := bIsAlpha
    Else
       If Sistema.SenhaNumero Then
          Result := bIsNum
       Else
          Result := True;
    }

    Result := True;

    If Sistema.SenhaLetra Then
    begin
      Result := Result and bIsAlpha;
      sMsg := sMsg + '- Letras' + #13;
    end;

    if Sistema.SenhaNumero Then
    begin
      Result := Result and bIsNum;
      sMsg := sMsg + '- Números' + #13;
    end;

    if bSenhaLetraMaiuscula Then
    begin
      Result := Result and bIsAlphaUpper;
      sMsg := sMsg + '- Ao menos uma letra maiúscula'+ #13;
    end;

    if bSenhaLetraMinuscula Then
    begin
      Result := Result and bIsAlphaLower;
      sMsg := sMsg + '- Ao menos uma letra minúscula'+ #13;
    end;

    if bSenhaEspecial Then
    begin
      Result := Result and bIsEspecial;
      sMsg := sMsg + '- Ao menos um caractere especial'+ #13;
    end;
    // Andre Imakawa - SIG137435 - Fim
  end;

  function ExistsMultChar(const S: AnsiString): Boolean;
  Var
     x: Integer;
  Begin
      Result := False;

      If Trim( S ) <> '' Then Begin
         For x := 2 To Length( S ) Do
             If S[ x ] = S[ x - 1 ] Then Begin
                Result := True;
                Break;
             End;
      End;
  End;

  // Andre Imakawa - SIG137435 - Inicio
  Procedure BuscaParametrosSeguranca;
  var
    QryAux: TwwQuery;
    auxSql: string;
  Begin
    try
      try
        auxSql := ' SELECT ' +
                  '   FLGSENHALETRAS, FLGSENHANUMEROS, FLGREPETESENHA, ' +
                  '   FLGALTSENHASUPER, TAMMINSENHA, TAMHISTORICOSENHA, ' +
                  '   TEMPOTRAVA, SENHASUPER, FLGVALSENHANOME ' +
                  '   ,FLGSENHAMAIUSCULA, FLGSENHAMINUSCULA, FLGSENHAESPECIAL  ' +
                  ' FROM ' +
                  '    SEGURANCA ';
        QryAux := TwwQuery.Create(Application);
        QryAux.DataBaseName := 'BaseDados';

        QryAux.close;
        QryAux.SQL.clear;
        QryAux.SQL.Add(auxSql);
        QryAux.Open;

        if not QryAux.isempty then
        begin
          bSenhaLetraMaiuscula := (QryAux.fieldbyname('FLGSENHAMAIUSCULA').AsString = 'S') ;
          bSenhaLetraMinuscula := (QryAux.fieldbyname('FLGSENHAMINUSCULA').AsString = 'S') ;
          bSenhaEspecial :=       (QryAux.fieldbyname('FLGSENHAESPECIAL').AsString = 'S') ;
        end;
      except
        bSenhaLetraMaiuscula := False;
        bSenhaLetraMinuscula := False;
        bSenhaEspecial       := False;
      end;
    finally
      FreeAndNil(QryAux);
    end;
  End;
  // Andre Imakawa - SIG137435 - Fim

var
  iusuario: Integer;
  ssenhaCript: String;
  sMensagem: string; // Andre Imakawa - SIG137435
begin
  inherited;

  BuscaParametrosSeguranca; // Andre Imakawa - SIG137435

  If Sistema.IdUsuario = -1 Then
     iusuario := dtmAutorizacao.CdsUsuario .FieldByName('IdUsuario').AsInteger
  Else
     iusuario := Sistema.IdUsuario;

  If CdsUsuario.Active Then CdsUsuario.Close;
  SqlUsuario.Prepare;
  SqlUsuario.ParamByName( 'idusuario' ).AsInteger := iusuario;
  SqlUsuario.Open;

  If sSenhaAtual <> CriptografarHash( EdSenhaAtual.Text, iusuario, 15 ) Then Begin
     { Erro: Senha inválida. }
     MsgDlg( 'Senha atual incorreta', 'Alterar senha', mtError, [mbOk, mbHelp], 0 );
     { Limpa os campos e posiciona em senha }
     edSenhaAtual.Clear;
     edNovaSenha.Clear;
     edNovaSenha2.Clear;
     edSenhaAtual.SetFocus;
  End Else
  If ( edNovaSenha.Text <> edNovaSenha2.Text ) or ( Length( Trim( edNovaSenha.Text ) ) = 0 ) Then Begin
     MsgDlg('Redigite a nova senha corretamente', 'Alterar Senha', mtWarning, [mbOk, mbHelp], 0);
     edSenhaAtual.Clear;
     edNovaSenha.Clear;
     edNovaSenha2.Clear;
     edSenhaAtual.SetFocus;
  End Else
  // se nao pode permanecer a mesma senha, testar se a nova e' diferente da atual
  If {( Not Sistema.SenhaRepete ) and} ( EdNovaSenha.Text = edSenhaAtual.Text ) Then Begin
     MsgDlg( 'A nova senha deve ser diferente da antiga', 'Alterar senha',
             mtError, [mbOk, mbHelp], 0 );
     edSenhaAtual.Clear;
     edNovaSenha.Clear;
     edNovaSenha2.Clear;
     edSenhaAtual.SetFocus;
  End Else
  // compara com o tamanho padrão
  If Length( edNovaSenha.Text ) < Sistema.SenhaTamMin then begin
     MsgDlg( 'Senha deve ter pelo menos ' + IntToStr( Sistema.SenhaTamMin ) +
             ' caracteres', 'Alterar senha', mtError, [mbOk, mbHelp], 0 );
     edSenhaAtual.Clear;
     edNovaSenha.Clear;
     edNovaSenha2.Clear;
     edSenhaAtual.SetFocus;
  End Else
  If Not StrIsAlphaNum( edNovaSenha.Text, sMensagem ) Then Begin
     // Andre Imakawa - SIG137435 - Inicio 
     MsgDlg( 'Senha deve possuir:' + #13 + sMensagem, 'Alterar senha',
                   mtError, [mbOk, mbHelp], 0 ); 
     {
     If Sistema.SenhaLetra Then
        If Sistema.SenhaNumero Then
           MsgDlg( 'Senha deve possuir números e letras', 'Alterar senha',
                   mtError, [mbOk, mbHelp], 0 )
        Else
           MsgDlg( 'Senha deve possuir pelo menos uma letra', 'Alterar senha',
                   mtError, [mbOk, mbHelp], 0 )
     Else
        If Sistema.SenhaNumero Then
           MsgDlg( 'Senha deve possuir pelo menos um número', 'Alterar senha',
                   mtError, [mbOk, mbHelp], 0 )
        Else
           MsgDlg( 'Senha inválida', 'Alterar senha', mtError, [mbOk, mbHelp], 0 );
     }
     // Andre Imakawa - SIG137435 - Fim
     edSenhaAtual.Clear;
     edNovaSenha.Clear;
     edNovaSenha2.Clear;
     edSenhaAtual.SetFocus;
  End Else
  If ExistsMultChar( edNovaSenha.Text ) Then Begin
     MsgDlg( 'Senha não pode ter caracteres repetidos consecutivos',
             'Alterar senha', mtError, [ mbOk, mbHelp ], 0 );
     edSenhaAtual.Clear;
     edNovaSenha.Clear;
     edNovaSenha2.Clear;
     edSenhaAtual.SetFocus;
  End Else
  If (Sistema.ValidaSenhaNome) And
     (( Pos( edNovaSenha.Text, CdsUsuario.FieldByname( 'Nome' ).AsString ) <> 0 ) Or
        ( Pos( edNovaSenha.Text, UpperCase( CdsUsuario.FieldByname( 'NomeUsuario' ).AsString ) ) <> 0 )) Then Begin
     // Senha atual errada
     MsgDlg( 'A Senha não pode conter partes do Nome ou Sobrenome do Usuário\Login', 'Alterar senha', mtError, [ mbOk, mbHelp ], 0 );
     edSenhaAtual.Clear;
     edNovaSenha.Clear;
     edNovaSenha2.Clear;
     edSenhaAtual.SetFocus;
  End Else Begin
     { Fecha a tela com estado de Ok se a nova senha no estiver no historico }
     ModalResult := mrOk;

     If Not Sistema.SenhaRepete Then Begin
        sSenhaCript := CriptografarHash( EdNovaSenha.Text, iusuario, 15 );

        If CdsHistSenha.Active Then CdsHistSenha.Close;
        SqlHistSenha.Prepare;
        SqlHistSenha.ParamByName( 'IdUsuario' ).AsInteger := iusuario;
        SqlHistSenha.Open;

        While Not CdsHistSenha.Eof Do
        Begin
           If CdsHistSenha.FieldByName( 'SenhaAntiga' ).AsString = sSenhaCript Then
           Begin
              ModalResult := MrNone;
              MsgDlg( 'Nova Senha Inválida. Por favor informe outra senha nova.',
                      'Alterar Senha', mtWarning, [mbOk], 0);
              edSenhaAtual.Clear;
              edNovaSenha.Clear;
              edNovaSenha2.Clear;
              edSenhaAtual.SetFocus;
              Break;
           End;

           CdsHistSenha.Next;
        End;

        CdsHistSenha.Close;
     End;
  End;

  CdsUsuario.Close;
end;

end.

