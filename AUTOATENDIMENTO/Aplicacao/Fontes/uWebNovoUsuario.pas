{
--------------------------------------------------------------------------------
Pendência   : SOL 142368 KINTANA 915921
Responsável : BRUNO AZEVEDO
Data        : 30/08/2010
Descrição   : Ao criar um novo login, verificar a existência pelo IDTITULAR.
--------------------------------------------------------------------------------
}
unit uWebNovoUsuario;

interface

uses SysUtils, Classes, httpapp, uCmClientDataset, JCLStrings,
     uCtrlWebRegra, uCtrlWebAcesso, DModAutoAtendimento,
     uConstPaginasCampos, uCmFileUtils;

//Valida os dados do usuário e monta a página de cadastro de senha
function PaginaValidaNovoUsuario( Request: TWebRequest ) : String;

//Cadastra a senha do usuário
function PaginaCadastraSenha( Request: TWebRequest ) : String;

//Exibe o lembrete de senha (após validar usuário)
function PaginaLembreteSenha( Request: TWebRequest ) : String;

//Executa o envio da senha por e-mail
function PaginaEnvioSenha( Request: TWebRequest ) : String;

implementation


//Valida os dados do usuário e monta a página de cadastro de senha
function PaginaValidaNovoUsuario( Request: TWebRequest ) : String;
var
  cds      : TCmClientDataset;
  sQuery   : string;
  i        : integer;
  iId, iIdTitular      : integer;
  sHidden  : string;
  sLoginEx : string;
begin

  try

    sQuery := sQryNovoUsu;

    sHidden := '';
    for i := 0 to ( Request.ContentFields.Count - 1 ) do
    begin
      sQuery := StringReplace( sQuery, ':' + Request.ContentFields.Names[i], Request.ContentFields.Values[ Request.ContentFields.Names[i] ], [rfReplaceAll, rfIgnoreCase] );
      sHidden := sHidden + '<input type="hidden" name="_' + Request.ContentFields.Names[i] +'" value="' +
       Request.ContentFields.Values[ Request.ContentFields.Names[i] ]+ '">' + CR;
    end;

    //BRUNO AZEVEDO SOL 142368 KINTANA 915921
    try
      cds := TCmClientDataset.Create( nil );
      cds.Data := WebRegra.GetDataPacket( sQuery );

      iId := cds.FieldByName('IDPESSOA').AsInteger;
      iIdTitular := cds.FieldByName('IDTITULAR').AsInteger;
    finally
      cds.Free;
    end;
    //BRUNO AZEVEDO SOL 142368 KINTANA 915921

    if iId <= 0 then
      Result := LeHTML( 'novousuinvalido.htm' )
    else
    begin

      try

        cds := TCmClientDataset.Create( nil );    
        cds.Data := WebAcesso.SelecionaLoginNome( iId, iIdTitular ); //BRUNO AZEVEDO SOL 142368 KINTANA 915921

        sLoginEx := '';
        if not cds.IsEmpty then
        begin
          if cds.FieldByName('SENHAPESSOAL').IsNull then
            sLoginEx := cds.FieldByName('LOGINPESSOAL').AsString
          else
            raise Exception.Create( 'Usuário já cadastrado.' );
        end;

        sJavaScript :=
         ' function ConfirmaSenha( )                                                               ' + CR +
         ' {                                                                                       ' + CR +
         '   if ( document.frmCadSenha.edtSenha.value == '''' )                                    ' + CR +
         '   {                                                                                     ' + CR +
         '     alert(''Informe a senha.'');                                                        ' + CR +
         '     document.frmCadSenha.edtSenha.focus();                                              ' + CR +
         '     exit;                                                                               ' + CR +
         '   }                                                                                     ' + CR +
         '   if ( document.frmCadSenha.edtSenhaConf.value == '''' )                                ' + CR +
         '   {                                                                                     ' + CR +
         '     alert(''Confirme a senha.'');                                                       ' + CR +
         '     document.frmCadSenha.edtSenhaConf.focus();                                          ' + CR +
         '     exit;                                                                               ' + CR +
         '   }                                                                                     ' + CR +
         '   if ( document.frmCadSenha.edtSenha.value.length < ' + IntToStr( iSenhaMin ) + ' )     ' + CR +
         '   {                                                                                     ' + CR +
         '     alert(''A senha não pode ter menos de ' + IntToStr( iSenhaMin ) + ' caracteres.''); ' + CR +
         '     document.frmCadSenha.edtSenha.focus();                                              ' + CR +
         '     exit;                                                                               ' + CR +
         '   }                                                                                     ' + CR +
         '   if ( document.frmCadSenha.edtSenha.value < document.frmCadSenha.edtSenhaConf.value )  ' + CR +
         '   {                                                                                     ' + CR +
         '     alert(''A confirmação da senha não confere.'');                                     ' + CR +
         '     document.frmCadSenha.edtSenhaConf.focus();                                          ' + CR +
         '     exit;                                                                               ' + CR +
         '   }                                                                                     ' + CR +
         '   if ( document.frmCadSenha.edtLembrete.value == '''' )                                 ' + CR +
         '   {                                                                                     ' + CR +
         '     alert(''Informe um lembrete para a senha.'');                                       ' + CR +
         '     document.frmCadSenha.edtLembrete.focus();                                           ' + CR +
         '     exit;                                                                               ' + CR +
         '   }                                                                                     ' + CR +
         '   document.frmCadSenha.submit();                                                        ' + CR +
         ' }                                                                                       ' + CR ;


        Result :=
         '<table border="0" width="95%" cellpadding="0" cellspacing="0"          ' + CR +
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

        Result := Result                                                                     + CR +
         '  <BR><BR>•&nbsp;O lembrete deve ser uma frase cuja simples menção seja          ' +
         'capaz de lembrar-lhe da sua senha. Utilize um lembrete que lhe facilite          ' +
         'lembrar-se da senha com facilidade, mas não simples o suficiente para que outras ' +
         'pessoas possam adivinhá-la.<BR><BR>                                              ' + CR +
         '      </div>                                                                     ' + CR +
         '      <BR>                                                                       ' + CR +
         '      <form method="POST" name="frmCadSenha" action="../<#nomearqapl>/CadSenha"> ' + CR +
         '        <table border="0" width="500" cellpadding="0" cellspacing="0">           ' + CR +
         '          <tr>                                                                   ' + CR +
         '            <td class="DESCCAMPO" width="150">                                   ' + CR +
         '              Senha:                                                             ' + CR +
         '            </td>                                                                ' + CR +
         '            <td>                                                                 ' + CR +
         '              <input type="password" name="edtSenha" size="20"                   ' + CR +
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
         '          </tr>                                                                  ' + CR +
         '          <tr><td colspan="2" height="5px"></td></tr>                            ' + CR +
         '          <tr>                                                                   ' + CR +
         '            <td class="DESCCAMPO">                                               ' + CR +
         '              Lembrete da senha:                                                 ' + CR +
         '            </td>                                                                ' + CR +
         '            <td>                                                                 ' + CR +
         '              <input type="edit" name="edtLembrete" size="60"                    ' + CR +
         '               class="TEXT" maxlength="100">                                     ' + CR +
         '            </td>                                                                ' + CR +
         '          </tr>                                                                  ' + CR +
         '        </table>                                                                 ' + CR +
         '        <input type="hidden" name="edtIdPessoa" value="' + IntToStr( iId ) + '"> ' + CR +
         //BRUNO AZEVEDO SOL 142368 KINTANA 915921
         '        <input type="hidden" name="edtIdTitular" value="' + IntToStr( iIdTitular ) + '"> ' + CR +
         '        <input type="hidden" name="edtLoginEx" value="' + sLoginEx + '">         ' + CR +
         sHidden                                                                             + CR +
         '      </form>                                                                    ' + CR +
         '    </td>                                                                        ' + CR +
         '  </tr>                                                                          ' + CR +
         '  <tr>                                                                           ' + CR +
         '    <td colspan="2" align="center">                                              ' + CR +
         '      <a href="JavaScript:ConfirmaSenha();">                                     ' + CR +
         '       <img src="../imagem/btnConfirmar.gif" name="btnConfirmar" border="0"      ' + CR +
         '        onMouseOver="btnConfirmar.src=''../imagem/btnConfirmar_s.gif''"          ' + CR +
         '        onMouseOut="btnConfirmar.src=''../imagem/btnConfirmar.gif''"></a>        ' + CR +
         '      <a href="' + sEndLogin + '">                                               ' + CR +
         '        <img src="../imagem/btnCancelar.gif" name="btnCancelar" border="0"       ' + CR +
         '        onMouseOver="btnCancelar.src=''../imagem/btnCancelar_s.gif''"            ' + CR +
         '        onMouseOut="btnCancelar.src=''../imagem/btnCancelar.gif''"></a>          ' + CR +
         '    </td>                                                                        ' + CR +
         '  </tr>                                                                          ' + CR +
         '</table>                                                                         ' + CR +
         '<SCRIPT language="JavaScript">                                                   ' + CR +
         '  document.frmCadSenha.edtSenha.focus();                                         ' + CR +
         '</script>                                                                        ' + CR ;

        Result := StrSubst( LeHTML( 'cadsenha.htm' ),   '<#conteudo>', Result );
        Result := StrSubst( Result, '<#javascript>', sJavaScript );

      finally
        cds.Free;
      end;

    end;

  except
    On E : Exception do
    begin
      Result := TrataWebExcecoes( E );
    end;
  end;

end; {ValidaNovoUsuario}


//Cadastra a senha do usuário
function PaginaCadastraSenha( Request: TWebRequest ) : String;
var
  iId, iIdTitular       : integer;
  sLoginEx  : string;
  sSenha    : string;
  sLembrete : string;
  sQuery    : string;
  sLogin    : string;
begin

  try
   

    iId        := StrToIntDef( trim( Request.ContentFields.Values['edtIdPessoa'] ), 0 );
    //BRUNO AZEVEDO SOL 142368 KINTANA 915921
    iIdTitular := StrToIntDef( trim( Request.ContentFields.Values['edtIdTitular'] ), 0 );
    sSenha     := trim( Request.ContentFields.Values['edtSenha']  );
    sLoginEx   := trim( Request.ContentFields.Values['edtLoginEx'] );
    sLembrete  := trim( Request.ContentFields.Values['edtLembrete'] );

    if sLoginEx = '' then
    begin
      sQuery := StringReplace( sQryLogin, ':IDPESSOA', IntToStr( iId ), [rfReplaceAll, rfIgnoreCase] );
      //BRUNO AZEVEDO SOL 142368 KINTANA 915921
      sQuery := StringReplace( sQuery, ':IDTITULAR', IntToStr( iIdTitular ), [rfReplaceAll, rfIgnoreCase] );

      WebRegra.CdsDataSetIn.Data := WebRegra.GetDataPacket( sQuery );
      
      WebRegra.MessageInfo := '';
      sLogin := trim( WebRegra.RegraString( IntToStr( iRegraLogin ), iIdEmpresaProp ) );
      if WebRegra.MessageInfo <> '' then raise Exception.Create( WebRegra.MessageInfo );
      
      if sLogin = '' then
        raise Exception.Create( 'Não foi possível gerar o login.' );
    end
    else
      sLogin := sLoginEx;

    if not WebAcesso.GravaLoginSenha( iId, -1, sLogin, sSenha, sLembrete, 0, bSenhaCripto, ( sLoginEx <> '' ), True, iIdTitular ) then  //BRUNO AZEVEDO SOL 142368 KINTANA 915921
      raise Exception.Create( 'Não foi possível cadastrar o usuário.' );

    Result := StrSubst( LeHTML( 'novousuconf.htm' ), '<#loginpessoal>', sLogin );
    Result := StrSubst( Result, '<#senhapessoal>', sSenha );    

  except
    On E : Exception do
    begin
      Result := TrataWebExcecoes( E );
    end;
  end;

end; {PaginaCadastraSenha}


function PaginaLembreteSenha( Request: TWebRequest ) : String;
var
  cds      : TCmClientDataset;
  sQuery   : string;
  i        : integer;
  iId, iIdTitular      : integer;
  sHidden  : string;
  sLoginEx : string;
begin

  try

    sQuery := sQryNovoUsu;

    sHidden := '';
    for i := 0 to ( Request.ContentFields.Count - 1 ) do
    begin
      sQuery := StringReplace( sQuery, ':' + Request.ContentFields.Names[i], Request.ContentFields.Values[ Request.ContentFields.Names[i] ], [rfReplaceAll, rfIgnoreCase] );
      sHidden := sHidden + '<input type="hidden" name="_' + Request.ContentFields.Names[i] +'" value="' +
       Request.ContentFields.Values[ Request.ContentFields.Names[i] ]+ '">' + CR;
    end;

    //BRUNO AZEVEDO SOL 142368 KINTANA 915921
    try
      cds := TCmClientDataset.Create( nil );
      cds.Data := WebRegra.GetDataPacket( sQuery );

      iId := cds.FieldByName('IDPESSOA').AsInteger;
      iIdTitular := cds.FieldByName('IDTITULAR').AsInteger;
    finally
      cds.Free;
    end;
    //BRUNO AZEVEDO SOL 142368 KINTANA 915921

    if iId <= 0 then
      Result := LeHTML( 'lembreteusuinvalido.htm' )
    else
    begin

      cds := TCmClientDataset.Create( nil );
      try

        cds.Data := WebAcesso.SelecionaLoginNome( iId, iIdTitular ); //BRUNO AZEVEDO SOL 142368 KINTANA 915921

        sLoginEx := '';
        if not cds.IsEmpty then
        begin
          if cds.FieldByName('LEMBRETE').IsNull then
            raise Exception.Create( 'Não foi cadastrado lembrete para a sua senha.' );
        end
        else
          raise Exception.Create( 'Não foi possível recuperar o lembrete da sua senha.' );

        Result := StrSubst( LeHTML( 'lembretesenha.htm' ),   '<#lembrete>', cds.FieldByName('LEMBRETE').AsString );

      finally
        cds.Free;
      end;

    end;

  except
    On E : Exception do
    begin
      Result := TrataWebExcecoes( E );
    end;
  end;

end; {PaginaLembreteSenha}

//Pendência 23402 - 28/02/2007 - Padrão 14
function PaginaEnvioSenha( Request: TWebRequest ) : String;
var
  cds      : TCmClientDataset;
  sQuery   : string;
  i        : integer;
  iId, iIdTitular      : integer;
  sHidden  : string;
  sLoginEx : string;

  iIdEmailConexao,
  iIdMsgPreDef  : Integer;

  sAssuntoMsg,
  sLogin,
  sSenha,
  sEmailDestinatario,
  sNomeDestinatario,
  sNomeRemetente,
  sMensagem  : String;
begin

  cds := TCmClientDataset.Create( nil );

  try

     // Recupera conexão e Assunto do e-mail
     cds.Data := MsgContexto.SelecionaMsgContexto(IdMsgContexto);
     if cds.IsEmpty then
     begin
       CMDebugToFile('Erro ao ler dados de contexto. ' + sMsgCtrl, 'C:\AAErro.txt' );
       cds.Close;
       Exit;
     end;

     iIdEmailConexao    := cds.FieldByName('IDEMAILCONEXAO').AsInteger;
     sAssuntoMsg        := trim( cds.FieldByName('ASSUNTOMSG').AsString );
     iIdMsgPreDef       := cds.FieldByName('IDMSGPREDEF').AsInteger;
     sNomeRemetente     := sFundacao;

     // Recupera Login e Senha para o e-mail
     sQuery  := sQryNovoUsu;
     sHidden := '';

     for i := 0 to ( Request.ContentFields.Count - 1 ) do
     begin
        sQuery := StringReplace( sQuery, ':' + Request.ContentFields.Names[i], Request.ContentFields.Values[ Request.ContentFields.Names[i] ], [rfReplaceAll, rfIgnoreCase] );
        sHidden := sHidden + '<input type="hidden" name="_' + Request.ContentFields.Names[i] +'" value="' +
        Request.ContentFields.Values[ Request.ContentFields.Names[i] ]+ '">' + CR;
     end;

     //BRUNO AZEVEDO SOL 142368 KINTANA 915921
     try
       cds := TCmClientDataset.Create( nil );
       cds.Data := WebRegra.GetDataPacket( sQuery );

       iId := cds.FieldByName('IDPESSOA').AsInteger;
       iIdTitular := cds.FieldByName('IDTITULAR').AsInteger;
     finally
       cds.Free;
     end;
     //BRUNO AZEVEDO SOL 142368 KINTANA 915921

     if iId <= 0 then
       Result := LeHTML( 'lembreteusuinvalido.htm' )
     else
     begin

        // Recupera e-mail do destinatário
        cds.Close;
        cds.Data := WebDadosCadastrais.SelecionaDadosPessoa( iId );
        if cds.IsEmpty then
        begin
           CMDebugToFile('Erro ao ler dados cadastrais. ' + sMsgCtrl, 'C:\AAErro.txt' );
           cds.Close;
           Exit;
        end;

        sNomeDestinatario  := AnsiUppercase( cds.FieldByName('NOME').AsString );
        sEmailDestinatario := AnsiLowerCase( cds.FieldByName('EMAIL').AsString );

        if cds.FieldByName('EMAIL').IsNull then
           raise Exception.Create( 'e-mail não cadastrado para envio da sua senha.' );

        // Recupera Login e Senha
        try
           cds.Close;
           cds.Data := WebAcesso.SelecionaLoginNome( iId, iIdTitular ); //BRUNO AZEVEDO SOL 142368 KINTANA 915921

           if not cds.IsEmpty then
           begin
              sLogin := cds.FieldByName('LOGINPESSOAL').AsString;
              sSenha := cds.FieldByName('SENHAPESSOAL').AsString;

             //Se não for vazio decriptografar senha
             if trim( sSenha ) <> '' then
                sSenha := CMCrypto.CMDecryptStr(StrPadRight( sSenha, 20, ' '),
                          '35DE2306861242849BDFCFF974244D615F88B30310CB4168910D2E2CA35F0B88' );
           end
           else
              raise Exception.Create( 'Não foi possível recuperar a senha para envio.' );

           //Recupera mensagem pre-definida
           cds.Close;
           cds.Data := MsgPreDef.SelecionaMsgPreDef(iIdMsgPreDef);

           if not cds.IsEmpty then
              sMensagem := cds.FieldByName('TEXTO').AsString
           else
              raise Exception.Create( 'Não foi possível recuperar mensagem do e-mail para envio da senha.' );

           //Monta a mensagem
           sMensagem := Mensagens.SubstituiTags( sMensagem,
                        ['DATAHORAENVIO', 'ASSUNTO',
                         'EMAILDESTINATARIO', 'NOMEDESTINATARIO',
                         'NOMEREMETENTE', 'LOGIN', 'SENHA' ],
                        [DateToStr(Date), sAssuntoMsg,
                         sEmailDestinatario, sNomeDestinatario,
                         sNomeRemetente, sLogin, sSenha] );

           //Envia e-mail com a senha
           Mensagens.ConfiguraServidorPeloRegistro( iIdEmailConexao );
           Mensagens.EnviaEMail( sEmailDestinatario, sAssuntoMsg, sMensagem );

           // Página de confirmação
           Result := StrSubst( LeHTML( 'senhaenviada.htm' ), '<#msgenvio>', 'Senha enviada com sucesso para ' + sEmailDestinatario );

        finally
           cds.Free;
        end;

     end;

  except
    On E : Exception do
    begin
      Result := TrataWebExcecoes( E );
    end;
  end;

end; {PaginaEnvioSenha}
//Fim Pendência 23402

end.
