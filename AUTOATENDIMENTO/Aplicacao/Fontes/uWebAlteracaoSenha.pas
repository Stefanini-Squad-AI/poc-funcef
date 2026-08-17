{
--------------------------------------------------------------------------------
Pendência   : SOL 158032 KINTANA 1275870
Responsável : BRUNO AZEVEDO
Data        : 23/05/2010
Descrição   : Manutenção no texto do lembrete de senha.
--------------------------------------------------------------------------------
Pendência   : SOL 147119 KINTANA 1011511
Responsável : BRUNO AZEVEDO
Data        : 09/11/2010
Descrição   : Verificar também o IDTITULAR na alteração de senhas.
--------------------------------------------------------------------------------
}

unit uWebAlteracaoSenha;

interface

uses SysUtils, DModAutoAtendimento, uConstPaginasCampos, httpapp, JCLStrings;

//Monta a página de alteração de senha
function PaginaAlteracaoSenha( iIdPessoaLocal : integer ) : String;

//Monta a página de gravação de senha
function PaginaSalvarSenha( iIdPessoaLocal : integer; Request: TWebRequest ) : String;

implementation

//Monta a página de alteração de senha
function PaginaAlteracaoSenha( iIdPessoaLocal : integer ) : String;
begin

  try

    sTitulo := TituloPagina( pAlteraSenha );

    //Valida e confirma o preenchimento dos campos
    sJavaScript :=
     ' function ConfirmaSenha( )                                                 ' + CR +
     ' {                                                                         ' + CR +
     '   if ( document.frmLnkNovaSenha.edtSenhaAtual.value == '''' )             ' + CR +
     '   {                                                                       ' + CR +
     '     alert(''A senha atual deve ser informada.'');                         ' + CR +
     '     document.frmLnkNovaSenha.edtSenhaAtual.focus();                       ' + CR +
     '     exit;                                                                 ' + CR +
     '   }                                                                       ' + CR +
     '   if ( document.frmLnkNovaSenha.edtSenhaNova.value == '''' )              ' + CR +
     '   {                                                                       ' + CR +
     '     alert(''A nova senha deve ser informada.'');                          ' + CR +
     '     document.frmLnkNovaSenha.edtSenhaNova.focus();                        ' + CR +
     '     exit;                                                                 ' + CR +
     '   }                                                                       ' + CR +
     '   if ( document.frmLnkNovaSenha.edtSenhaNova.value.length < ' + IntToStr( iSenhaMin ) + ' ) ' + CR +
     '   {                                                                       ' + CR +
     '     alert(''A nova senha não pode ter menos de ' + IntToStr( iSenhaMin ) + ' caracteres.''); ' + CR +
     '     document.frmLnkNovaSenha.edtSenhaNova.focus();                        ' + CR +
     '     exit;                                                                 ' + CR +
     '   }                                                                       ' + CR +
     '   if ( document.frmLnkNovaSenha.edtSenhaConf.value == '''' )              ' + CR +
     '   {                                                                       ' + CR +
     '     alert(''A confimação da senha deve ser informada.'');                 ' + CR +
     '     document.frmLnkNovaSenha.edtSenhaConf.focus();                        ' + CR +
     '     exit;                                                                 ' + CR +
     '   }                                                                       ' + CR +
     '   if ( document.frmLnkNovaSenha.edtSenhaConf.value.length < ' + IntToStr( iSenhaMin ) + ' ) ' + CR +
     '   {                                                                       ' + CR +
     '     alert(''A confirmação da senha não pode ter menos de ' + IntToStr( iSenhaMin ) + ' caracteres.''); ' + CR +
     '     document.frmLnkNovaSenha.edtSenhaConf.focus();                        ' + CR +
     '     exit;                                                                 ' + CR +
     '   }                                                                       ' + CR ;

    if iRegraNovoUsu > 0 then
      sJavaScript := sJavaScript +
       '   if ( document.frmLnkNovaSenha.edtLembrete.value == '''' )               ' + CR +
       '   {                                                                       ' + CR +
       '     alert(''Informe um lembrete para a senha.'');                         ' + CR +
       '     document.frmLnkNovaSenha.edtLembrete.focus();                         ' + CR +
       '     exit;                                                                 ' + CR +
       '   }                                                                       ' + CR ;

    if not bFlgDemo then
      sJavaScript := sJavaScript +
       '   EnviaForm( document.frmLnkNovaSenha );                             }  ' + CR
    else
      sJavaScript := sJavaScript +
       '   alert(''Funcionalidade desabilitada para demonstração.'');         } ' + CR ;

    Result := Result +
     '<table border="0" width="100%" cellpadding="0" cellspacing="0"         ' + CR +
     '       class="FORMULARIO">                                             ' + CR +
     '  <tr>                                                                 ' + CR +
     '    <td align="center">                                                ' + CR +
     '      <div class="BOXFORM" align="left" width="100%">                  ' + CR +
     '        <div class="CABBOXFORM">                                       ' + CR +
     '          Instruções                                                   ' + CR +
     '        </div>                                                         ' + CR +
     '<BR>•&nbsp;A senha só poderá conter caracteres de A a Z (maiúsculos ou ' + CR +
     'minúsculos), dígitos de 0 a 9 e os caracteres especiais /-_.@          ' + CR +
     '<BR><BR>•&nbsp;                                                        ' + CR ;

    if iSenhaMin <> iSenhaMax then
      Result := Result + 'Sua senha deverá ter entre ' + IntToStr( iSenhaMin ) +
       ' e ' + IntToStr( iSenhaMax ) + ' caracteres.' + CR
    else
      Result := Result + 'Sua senha deverá ter ' + IntToStr( iSenhaMin ) +
       ' caracteres.' + CR;

    Result := Result +
     '<BR><BR>•&nbsp;' + CR ;

    if bSenhaCase then
      Result := Result + 'Há distinção entre caracteres MAIÚSCULOS e minúsculos. ("<b>a</b>"<>"<b>A</b>")'
    else
      Result := Result + 'Não há distinção entre caracteres MAIÚSCULOS e minúsculos. ("<b>a</b>"="<b>A</b>")';

    if iRegraNovoUsu > 0 then
      //BRUNO AZEVEDO SOL 158032 KINTANA 1275870
      Result := Result                                                                     + CR +
       '  <BR><BR>•&nbsp;O lembrete deve ser uma frase que seja capaz de lembrar-lhe da sua senha.' ;

    Result := Result                                                                     + CR +
     '<BR><BR>                                                                         ' + CR +
     '      </div>                                                                     ' + CR +
     '      <BR>                                                                       ' + CR +
     '      <form method="POST" name="frmLnkNovaSenha"                                 ' + CR +
     '            action="../<#nomearqapl>/SalvarSenha">                               ' + CR +
     '        <table border="0" width="500" cellpadding="0" cellspacing="0">           ' + CR +
     '          <tr>                                                                   ' + CR +
     '            <td class="DESCCAMPO" width="150">                                   ' + CR +
     '              Senha atual:                                                       ' + CR +
     '            </td>                                                                ' + CR +
     '            <td>                                                                 ' + CR +
     '              <input type="password" name="edtSenhaAtual" size="20"              ' + CR +
     '               class="TEXT" maxlength=" ' + IntToStr( iSenhaMax ) + '">          ' + CR +
     '            </td>                                                                ' + CR +
     '          </tr>                                                                  ' + CR +
     '          <tr>                                                                   ' + CR +
     '            <td class="DESCCAMPO">                                               ' + CR +
     '              Nova senha:                                                        ' + CR +
     '            </td>                                                                ' + CR +
     '            <td>                                                                 ' + CR +
     '              <input type="password" name="edtSenhaNova" size="20"               ' + CR +
     '               class="TEXT" maxlength=" ' + IntToStr( iSenhaMax ) + '">          ' + CR +
     '            </td>                                                                ' + CR +
     '          </tr>                                                                  ' + CR +
     '          <tr>                                                                   ' + CR +
     '            <td class="DESCCAMPO">                                               ' + CR +
     '              Confirmação da senha:                                              ' + CR +
     '            </td>                                                                ' + CR +
     '            <td>                                                                 ' + CR +
     '              <input type="password" name="edtSenhaConf" size="20"               ' + CR +
     '               class="TEXT" maxlength=" ' + IntToStr( iSenhaMax ) + '">          ' + CR +
     '            </td>                                                                ' + CR +
     '          </tr>                                                                  ' + CR ;

    if iRegraNovoUsu > 0 then
      Result := Result                                                                   + CR +
       '          <tr><td colspan="2" height="5px"></td></tr>                          ' + CR +      
       '          <tr>                                                                 ' + CR +
       '            <td class="DESCCAMPO">                                             ' + CR +
       '              Lembrete da senha:                                               ' + CR +
       '            </td>                                                              ' + CR +
       '            <td>                                                               ' + CR +
       '              <input type="edit" name="edtLembrete" size="60"                  ' + CR +
       '               class="TEXT" maxlength="100">                                   ' + CR +
       '            </td>                                                              ' + CR +
       '          </tr>                                                                ' + CR ;

    Result := Result                                                                     + CR +
     '        </table>                                                                 ' + CR +
     '        <#hiddenfields>                                                          ' + CR +
     '      </form>                                                                    ' + CR +
     '    </td>                                                                        ' + CR +
     '  </tr>                                                                          ' + CR +
     '  <tr>                                                                           ' + CR +
     '    <td colspan="2" align="center">                                              ' + CR +
     '      <a href="JavaScript:ConfirmaSenha();">                                     ' + CR +
     '       <img src="../imagem/btnConfirmar.gif" name="btnConfirmar" border="0"      ' + CR +
     '        onMouseOver="btnConfirmar.src=''../imagem/btnConfirmar_s.gif''"          ' + CR +
     '        onMouseOut="btnConfirmar.src=''../imagem/btnConfirmar.gif''"></a>        ' + CR +
     '      <a href="JavaScript:EnviaForm( document.frmLnkHome )">                     ' + CR +
     '        <img src="../imagem/btnCancelar.gif" name="btnCancelar" border="0"       ' + CR +
     '        onMouseOver="btnCancelar.src=''../imagem/btnCancelar_s.gif''"            ' + CR +
     '        onMouseOut="btnCancelar.src=''../imagem/btnCancelar.gif''"></a>          ' + CR +
     '    </td>                                                                        ' + CR +
     '  </tr>                                                                          ' + CR +
     '</table>                                                                         ' + CR +
     '<SCRIPT language="JavaScript">                                                   ' + CR +
     '  document.frmLnkNovaSenha.edtSenhaAtual.focus();                                ' + CR +
     '</script>                                                                        ' + CR ;

    Result := MontaPagina( pAlteraSenha, Result );

  except
    On E : Exception do
    begin
      Result := TrataWebExcecoes( E );
    end;
  end;

end; {PaginaAlteracaoSenha}


//Monta a página de gravação de senha
function PaginaSalvarSenha( iIdPessoaLocal : integer; Request: TWebRequest ) : String;
var
  sSenhaAtual, sSenhaNova, sSenhaConf, sSenhaBanco, sSenha, sLembrete : String;
begin

  try

    sSenhaAtual := trim( Request.ContentFields.Values['edtSenhaAtual'] );
    sSenhaNova  := trim( Request.ContentFields.Values['edtSenhaNova']  );
    sSenhaConf  := trim( Request.ContentFields.Values['edtSenhaConf']  );
    sLembrete   := trim( Request.ContentFields.Values['edtLembrete']   );

    //Se a senha não é case-sensitive...
    if not bSenhaCase then
    begin
      sSenhaNova  := UpperCase( sSenhaNova );
      sSenhaConf  := UpperCase( sSenhaConf );
    end;

    //Verifica confirmação da senha
    if sSenhaNova <> sSenhaConf then
      raise Exception.Create( 'A confirmação não coincide com a nova senha.');


    //Verifica tamanho da senha
    if length( sSenhaNova ) > iSenhaMax then
      raise Exception.Create( 'A nova senha deve ter no máximo ' + IntToStr( iSenhaMax ) + ' dígitos.');
    if length( sSenhaNova ) < iSenhaMin then
      raise Exception.Create( 'A nova senha deve ter no mínimo ' + IntToStr( iSenhaMin ) + ' dígitos.');

    cds.Close;
    cds.Data := WebAcesso.SelecionaPorLogin( UpperCase(
     trim( Request.ContentFields.Values['vLoginPessoal'] ) ) );

    sSenhaBanco := trim( cds.FieldByName('SENHAPESSOAL').AsString );

    if bSenhaCripto then
      sSenhaBanco := trim( CMCrypto.CMDecryptStr( StrPadRight( sSenhaBanco,  20, ' ' ),
       '35DE2306861242849BDFCFF974244D615F88B30310CB4168910D2E2CA35F0B88' ) );

    //Se a senha não é case-sensitive...
    if not bSenhaCase then
    begin
      sSenhaBanco := UpperCase( sSenhaBanco );
      sSenhaAtual := UpperCase( sSenhaAtual );
    end;

    if sSenhaAtual <> sSenhaBanco then
    begin
      //Altera a quantidade de acessos. Se a função retronar TRUE, a senha foi bloqueada
      if not WebAcesso.AlteraQtdeAcessos( iIdPessoaLocal, 1, iNumSenhaBlq ) then
        raise Exception.Create( 'Senha atual incorreta.')
      else
        raise Exception.Create( 'Senha atual incorreta.<BR>' +
        'O seu acesso foi bloqueado por ter sido excedida a quantidade de tentativas permitida.<BR>' +
        'Entre em contato com a Fundação para efetuar o desbloqueio.');
    end;

    sSenha := StrPadRight( trim( Request.ContentFields.Values['edtSenhaNova'] ), 20, ' ' );

    //Altera a senha
    //BRUNO AZEVEDO SOL 147119 KINTANA 1011511
    if not WebAcesso.GravaSenha( iIdPessoaLocal, trim( Request.ContentFields.Values['vLoginPessoal'] ), sSenha, sLembrete, -1, bSenhaCripto ) then
      raise Exception.Create('Não foi possível alterar a senha.');

    //---------- Montagem da página de confirmação
    sTitulo := TituloPagina( pConfSenha );

    cds.Close;

    Result := MontaPagina( pConfSenha, '' );

  except
    On E : Exception do
    begin
      Result := TrataWebExcecoes( E );
    end;
  end;

end; {PaginaSalvarSenha}


end.
