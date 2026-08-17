{
-------------------------------------------------------------------------
Pendência   : SOL 140314 KINTANA 876132
Responsável : BRUNO AZEVEDO
Data        : 24/09/2010
Descrição   : Melhor apresentação dos dados de telefone.
-------------------------------------------------------------------------
Pendência   : SOL 91655 KINTANA 394002
Responsável : BRUNO AZEVEDO
Data        : 06/07/2010
Descrição   : Criação da manutenção dos dados cadastrais (E-mail, telefone e endereço).
--------------------------------------------------------------------------------
}
unit uWebManutTelefones;

interface

uses SysUtils, DModAutoAtendimento, uConstPaginasCampos, httpapp, JCLStrings,
     uMidasUtil, uCtrl_TelEndPess, JCLSysUtils, uCMFileUtils;

//Monta a página de Manutenção de Telefones
function PaginaManutTelefones( iIdPessoaLocal : integer ) : String;

//Monta a página de Alteração de Telefones
function PaginaAlteracaoTelefone( iIdPessoaLocal, iIdTelefone : integer ) : String;

//Monta a página de Gravação de Telefones
function PaginaSalvarTelefone( iIdPessoaLocal : integer; Request: TWebRequest ) : String;

//Exibe os dados de um determinado telefone
function DadosTelefone( iIdPessoaLocal, iIdTelefone : integer ) : String;

//Monta a página de Exclusão de Telefones
function PaginaExclusaoTelefone( iIdPessoaLocal, iIdTelefone : integer ) : String;

//Monta a página que exclui efetivamente o Telefone
function PaginaExcluirTelefone( iIdPessoaLocal, iIdTelefone : integer ) : String;

implementation

//Monta a página de Manutenção de Endereços
function PaginaManutTelefones( iIdPessoaLocal : integer ) : String;
var
  sLograduro,
  sDDD,
  sDDI,
  sNumero,
  sComercial,
  sParticular,
  sFax,
  sCelular,
  sRecado,
  sAux : string;
  sTipo: String; //BRUNO AZEVEDO SOL 140314 KINTANA 876132

  procedure IncluiLink( var sLink : String );
  begin
    sLink := '<a href="JavaScript:document.frmLnkAlteracaoTelefone.edtIdTelefone.value=''' +
         cds.FieldByName('IDTELEFONE').AsString + '''; EnviaForm( document.frmLnkAlteracaoTelefone );">' +
         sLink + '</a>'
  end;

begin

  try

    sTitulo := TituloPagina( pManutTelefones );

    cds.Close;
    cds.Data := TelEndPess.SelecionaTelefonesPorPessoa( iIdPessoaLocal );

    cdsHTMLColumns.Close;
    cdsHTMLColumns.CreateDataSet;

    IncluiColuna( cAltTelLogradouro , 23, 'left' );
    IncluiColuna( cAltTelDDI        ,  6, 'left' );
    IncluiColuna( cAltTelDDD        ,  6, 'left' );
    IncluiColuna( cAltTelNumero     , 20, 'left' );

    //BRUNO AZEVEDO SOL 140314 KINTANA 876132
    IncluiColuna( 0                 , 20, 'left', 'Tipo');
    //IncluiColuna( cAltTelComercial  ,  9, 'left' );
    //IncluiColuna( cAltTelParticular ,  9, 'left' );
    //IncluiColuna( cAltTelFax        ,  9, 'left' );
    //IncluiColuna( cAltTelCelular    ,  9, 'left' );
    //IncluiColuna( cAltTelRecado     ,  9, 'left' );
    //BRUNO AZEVEDO SOL 140314 KINTANA 876132

    if TemAcessoPagina( sTipoUsuario, pTelAlteracao, sAux ) then
      IncluiColuna( -1,  7, 'center', ' Alterar ' );

    if TemAcessoPagina( sTipoUsuario, pTelExclusao, sAux ) then
      IncluiColuna( -2,  7, 'center', ' Excluir ' );

    if TemAcessoPagina( sTipoUsuario, pTelInclusao, sAux ) then
      Result := Result + '<a href="JavaScript:document.frmLnkAlteracaoTelefone.edtIdTelefone.value='''';' +
       'EnviaForm( document.frmLnkAlteracaoTelefone );">' +
       '<img name="imgNovo" src="../Imagem/novoreg.gif" border="0" style="float: right"   ' +
       ' onMouseOver="imgNovo.src=''../imagem/novoreg_s.gif''" '                            +
       ' onMouseOut="imgNovo.src=''../imagem/novoreg.gif''"> </a>' + CR ;

    Result := Result + HTMLTableHeader;

    cds.First;
    while not cds.Eof do
    begin
      sLograduro  := StrToName( trim( cds.FieldByName('LOGRADOURO').AsString ) );
      sNumero     := trim( cds.FieldByName('NUMERO').AsString );
      sDDI        := trim( cds.FieldByName('DDI').AsString );
      sDDD        := trim( cds.FieldByName('DDD').AsString );

      //BRUNO AZEVEDO SOL 140314 KINTANA 876132
      sTipo := '';
      if (Pos( 'C', cds.FieldByName('TIPO').AsString ) > 0) then begin
        sTipo := sTipo + 'Comercial / ';
      end;

      if (Pos( 'P', cds.FieldByName('TIPO').AsString ) > 0) then begin
        sTipo := sTipo + 'Particular / ';
      end;

      if (Pos( 'F', cds.FieldByName('TIPO').AsString ) > 0) then begin
        sTipo := sTipo + 'Fax / ';
      end;

      if (Pos( 'L', cds.FieldByName('TIPO').AsString ) > 0) then begin
        sTipo := sTipo + 'Celular / ';
      end;

      if (Pos( 'R', cds.FieldByName('TIPO').AsString ) > 0) then begin
        sTipo := sTipo + 'Recado / ';
      end;
      sTipo := Copy(sTipo, 1, Length(sTipo) - 3);
      
      //sComercial  := Iff( Pos( 'C', cds.FieldByName('TIPO').AsString ) > 0, 'S', 'N' );
      //sParticular := Iff( Pos( 'P', cds.FieldByName('TIPO').AsString ) > 0, 'S', 'N' );
      //sFax        := Iff( Pos( 'F', cds.FieldByName('TIPO').AsString ) > 0, 'S', 'N' );
      //sCelular    := Iff( Pos( 'L', cds.FieldByName('TIPO').AsString ) > 0, 'S', 'N' );
      //sRecado     := Iff( Pos( 'R', cds.FieldByName('TIPO').AsString ) > 0, 'S', 'N' );

      //BRUNO AZEVEDO SOL 140314 KINTANA 876132

      if TemAcessoPagina( sTipoUsuario, pTelAlteracao, sAux ) then
      begin
        IncluiLink( sLograduro  );
        IncluiLink( sDDI        );
        IncluiLink( sDDD        );
        IncluiLink( sNumero     );

        //BRUNO AZEVEDO SOL 140314 KINTANA 876132
        IncluiLink( sTipo  );
        //IncluiLink( sComercial  );
        //IncluiLink( sParticular );
        //IncluiLink( sFax        );
        //IncluiLink( sCelular    );
        //IncluiLink( sRecado     );
        //BRUNO AZEVEDO SOL 140314 KINTANA 876132
        
      end;

      PreencheColuna( cAltTelLogradouro  , sLograduro  );
      PreencheColuna( cAltTelDDI         , sDDI        );
      PreencheColuna( cAltTelDDD         , sDDD        );
      PreencheColuna( cAltTelNumero      , sNumero     );

      //BRUNO AZEVEDO SOL 140314 KINTANA 876132
      PreencheColuna( 0                  , sTipo  );
      //PreencheColuna( cAltTelComercial   , sComercial  );
      //PreencheColuna( cAltTelParticular  , sParticular );
      //PreencheColuna( cAltTelFax         , sFax        );
      //PreencheColuna( cAltTelCelular     , sCelular    );
      //PreencheColuna( cAltTelRecado      , sRecado     );
      //BRUNO AZEVEDO SOL 140314 KINTANA 876132
      
      if TemAcessoPagina( sTipoUsuario, pTelAlteracao, sAux ) then
        PreencheColuna( -1,
         '<a href="JavaScript:document.frmLnkAlteracaoTelefone.edtIdTelefone.value=''' +
         cds.FieldByName('IDTELEFONE').AsString + '''; EnviaForm( document.frmLnkAlteracaoTelefone );"> ' + CR +
         '<img name="imgAlterar' + cds.FieldByName('IDTELEFONE').AsString + '" src="../Imagem/altreg.gif" border="0" style="float: center" ' +
         ' onMouseOver="imgAlterar' + cds.FieldByName('IDTELEFONE').AsString + '.src=''../imagem/altreg_s.gif''" ' +
         ' onMouseOut="imgAlterar' + cds.FieldByName('IDTELEFONE').AsString + '.src=''../imagem/altreg.gif''"></a>' + CR );

      if TemAcessoPagina( sTipoUsuario, pTelExclusao, sAux ) then
        PreencheColuna( -2,
         '<a href="JavaScript:document.frmLnkExclusaoTelefone.edtIdTelefone.value=''' +
         cds.FieldByName('IDTELEFONE').AsString + '''; EnviaForm( document.frmLnkExclusaoTelefone );"> ' + CR +
         '<img name="imgExcluir' + cds.FieldByName('IDTELEFONE').AsString + '" src="../Imagem/excreg.gif" border="0"  style="float: center" ' +
         ' onMouseOver="imgExcluir' + cds.FieldByName('IDTELEFONE').AsString + '.src=''../imagem/excreg_s.gif''" ' +
         ' onMouseOut="imgExcluir' + cds.FieldByName('IDTELEFONE').AsString + '.src=''../imagem/excreg.gif''"></a>' );

      Result := Result + HTMLTableRow;
      cds.Next;
    end;

    Result := Result + HTMLTableFooter +
     '  <form method="POST" name="frmLnkAlteracaoTelefone"                 ' + CR +
     '   action="../<#nomearqapl>/AlteracaoTelefone">                      ' + CR +
     '    <input type="hidden" name="edtIdTelefone">                       ' + CR +
     '    <#hiddenfields>                                                  ' + CR +
     '  </form>                                                            ' + CR +
     '  <form method="POST" name="frmLnkExclusaoTelefone"                  ' + CR +
     '   action="../<#nomearqapl>/ExclusaoTelefone">                       ' + CR +
     '    <input type="hidden" name="edtIdTelefone">                       ' + CR +
     '    <#hiddenfields>                                                  ' + CR +
     '  </form>                                                            ' + CR ;

    cdsHTMLColumns.Close;

    cds.Close;

    Result := MontaPagina( pManutTelefones, Result );

  except
    On E : Exception do
    begin
      Result := TrataWebExcecoes( E );
    end;
  end;

end; {PaginaManutTelefones}


//Monta a página de Alteração de Endereços
function PaginaAlteracaoTelefone( iIdPessoaLocal, iIdTelefone : integer ) : String;
var
  sTituloCampo : String;
  iPag : integer;
begin

  try
    if iIdTelefone = 0 then
      iPag := pTelInclusao
    else
    begin
      iPag := pTelAlteracao;
      cds.Close;
      cds.Data := TelEndPess.SelecionaTelefone( iIdTelefone );
    end;

    sTitulo := TituloPagina( iPag );

    //Valida e confirma o preenchimento dos campos
    sJavaScript :=
     ' function ConfirmaTelefone( )                                              ' + CR +
     ' {                                                                         ' + CR +
     //BRUNO AZEVEDO SOL 91655 KINTANA 394002
     '   if (!( document.frmLnkTelefone.cbComercial.checked ) && ' +
     '       !( document.frmLnkTelefone.cbParticular.checked ) && ' +
     '       !( document.frmLnkTelefone.cbFax.checked ) && ' +
     '       !( document.frmLnkTelefone.cbCelular.checked ) && ' +
     '       !( document.frmLnkTelefone.cbRecado.checked ))'                    + CR +
     '   {                                                                       ' + CR +
     '     alert(''Informe o tipo de telefone.'');                               ' + CR +
     '     exit;                                                                 ' + CR +
     '   }                                                                       ' + CR +
     //BRUNO AZEVEDO SOL 91655 KINTANA 394002
     MontaValidacao( cAltTelLogradouro , 'frmLnkTelefone.cmbLogradouro' , 'C' )    + CR +
     MontaValidacao( cAltTelNumero     , 'frmLnkTelefone.edtNumero'     , 'T' )    + CR ;

    if not bFlgDemo then
    begin
      sJavaScript := sJavaScript +
       '   EnviaForm( document.frmLnkTelefone );                             }     ' + CR
    end
    else
      sJavaScript := sJavaScript +
       '   alert(''Funcionalidade desabilitada para demonstração.'');        }     ' + CR ;

    Result := Result +
     '<p class="DESCCAMPO">                                                       ' + CR +
     '  <form method="POST" name="frmLnkTelefone"                                 ' + CR +
     '   action="../<#nomearqapl>/SalvarTelefone">                                ' + CR +
     '    <table border="0" width="100%" cellpadding="0" cellspacing="0"          ' + CR +
     '           class="FORMULARIO">                                              ' + CR +
     '      <tr>                                                                  ' + CR +
     '        <td width="75%">                                                    ' + CR +
     '          <table border="0" width="100%" cellpadding="0" cellspacing="0">   ' + CR +
     '            <tr class="CAMPOFORM">                                          ' + CR +
     '              <td class="DESCCAMPO" colspan="3">                            ' + CR ;


    if TemAcessoCampo( sTipoUsuario, cAltTelLogradouro, sTituloCampo ) then
    begin
      cdsAux.Close;
      cdsAux.Data := EndPess.SelecionaEnderecosPorPessoa( iIdPessoaLocal ); 

      Result := Result +
       sTituloCampo + '<br>' +
       '                <select size="1" name="cmbLogradouro" class="TEXT">    ' + CR +
       '                  <option value="-1">[Selecione um dos logradouros abaixo]' +
       '&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;' +
       '&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;' +
       '&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;' +
       '&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;' +
       '&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;' +
       '&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;' +
       '&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;' +
       '&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;' +              
       '&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;' +
       '</option> ' + CR ;

      while not cdsAux.Eof do
      begin
        Result := Result + '                  <option value="' + cdsAux.FieldByName('IDENDERECO').AsString + '" ';

        if   ( iIdTelefone <> 0 ) then
          if ( cds.FieldByName('IDENDERECO').AsString = cdsAux.FieldByName('IDENDERECO').AsString ) then
            Result := Result + ' selected';

        Result := Result + '>' + trim( cdsAux.FieldByName('LOGRADOURO').AsString ) + '</option>' + CR;

        cdsAux.Next;
      end;

      cdsAux.Close;

      Result := Result +
       '                </select>                                                 ' + CR ;
    end;


    Result := Result +
     '            </tr>                                                           ' + CR +
     '            <tr class="CAMPOFORM">                                          ' + CR +
     '              <td class="DESCCAMPO" width="25%">                            ' + CR ;

    if TemAcessoCampo( sTipoUsuario, cAltTelDDI, sTituloCampo ) then
    begin
      Result := Result +
       sTituloCampo                                                                      +
       '              <br>                                                        ' + CR +
       '              <input type="text" name="edtDDI" size="5"                   ' + CR +
       '               class="TEXT" maxlength="5"                                 ' + CR ;
      if iIdTelefone <> 0 then
        Result := Result + ' value="' + cds.FieldByName('DDI').AsString + '" ';
      Result := Result + '>';
    end;

    Result := Result +
     '              </td>                                                         ' + CR +
     '              <td class="DESCCAMPO" width="25%">                            ' + CR ;

    if TemAcessoCampo( sTipoUsuario, cAltTelDDD, sTituloCampo ) then
    begin
      Result := Result +
       sTituloCampo                                                                      +
       '              <br>                                                        ' + CR +
       '              <input type="text" name="edtDDD" size="5"                   ' + CR +
       '               class="TEXT" maxlength="2"                                 ' + CR ;
      if iIdTelefone <> 0 then
        Result := Result + ' value="' + cds.FieldByName('DDD').AsString + '" ';
      Result := Result + '>';
    end;

    Result := Result +
     '              </td>                                                         ' + CR +
     '              <td class="DESCCAMPO">                                        ' + CR ;

    if TemAcessoCampo( sTipoUsuario, cAltTelNumero, sTituloCampo ) then
    begin
      Result := Result +
       sTituloCampo                                                                    +
       '              <br>                                                        ' + CR +
       '              <input type="text" name="edtNumero" size="35"               ' + CR +
       '               class="TEXT" maxlength="8"                                ' + CR ;
      if iIdTelefone <> 0 then
        Result := Result + ' value="' + cds.FieldByName('NUMERO').AsString + '" ';
      Result := Result + '>';
    end;

    Result := Result +
     '              </td>                                                         ' + CR +
     '            </tr>                                                           ' + CR +
     '          </table>                                                          ' + CR +
     '        </td>                                                               ' + CR +
     '        <td valign="top">                                                   ' + CR ;

    if TemAcessoCampo( sTipoUsuario, cAltTelComercial   , sTituloCampo ) or
       TemAcessoCampo( sTipoUsuario, cAltTelParticular  , sTituloCampo ) or
       TemAcessoCampo( sTipoUsuario, cAltTelFax         , sTituloCampo ) or
       TemAcessoCampo( sTipoUsuario, cAltTelCelular     , sTituloCampo ) or
       TemAcessoCampo( sTipoUsuario, cAltTelRecado      , sTituloCampo ) then
    begin
      Result := Result +
       '          <DIV class="BOXFORM" width="100%">                                             ' + CR +
       '            <DIV class="CABBOXFORM">                                                     ' + CR +
       '              Tipo do telefone                                                           ' + CR +
       '            </DIV>                                                                       ' + CR ;

      if TemAcessoCampo( sTipoUsuario, cAltTelComercial, sTituloCampo ) then
      begin
        Result := Result +
         '            <input type="checkbox"                                                     ' + CR ;
        if   ( iIdTelefone <> 0 ) then
          if Pos( 'C', cds.FieldByName('TIPO').AsString ) > 0 then Result := Result + ' checked ';
        Result := Result +
         ' name="cbComercial" value="1"> ' + sTituloCampo + ' </input> <BR>                      ' + CR ;
      end;

      if TemAcessoCampo( sTipoUsuario, cAltTelParticular, sTituloCampo ) then
      begin
        Result := Result +
         '            <input type="checkbox"                                                     ' + CR ;
        if   ( iIdTelefone <> 0 ) then
          if Pos( 'P', cds.FieldByName('TIPO').AsString ) > 0 then Result := Result + ' checked ';
        Result := Result +
         ' name="cbParticular" value="1"> ' + sTituloCampo + ' </input> <BR>                      ' + CR ;
      end;

      if TemAcessoCampo( sTipoUsuario, cAltTelFax, sTituloCampo ) then
      begin
        Result := Result +
         '            <input type="checkbox"                                                     ' + CR ;
        if   ( iIdTelefone <> 0 ) then
          if Pos( 'F', cds.FieldByName('TIPO').AsString ) > 0 then Result := Result + ' checked ';
        Result := Result +
         ' name="cbFax" value="1"> ' + sTituloCampo + ' </input> <BR>                            ' + CR ;
      end;

      if TemAcessoCampo( sTipoUsuario, cAltTelCelular, sTituloCampo ) then
      begin
        Result := Result +
         '            <input type="checkbox"                                                     ' + CR ;
        if   ( iIdTelefone <> 0 ) then
          if Pos( 'L', cds.FieldByName('TIPO').AsString ) > 0 then Result := Result + ' checked ';
        Result := Result +
         ' name="cbCelular" value="1"> ' + sTituloCampo + ' </input> <BR>                        ' + CR ;
      end;

      if TemAcessoCampo( sTipoUsuario, cAltTelRecado, sTituloCampo ) then
      begin
        Result := Result +
         '            <input type="checkbox"                                                     ' + CR ;
        if   ( iIdTelefone <> 0 ) then
          if Pos( 'R', cds.FieldByName('TIPO').AsString ) > 0 then Result := Result + ' checked ';
        Result := Result +
         ' name="cbRecado" value="1"> ' + sTituloCampo + ' </input> <BR>                         ' + CR ;
      end;

      Result := Result +
       '          </DIV>                                                                         ' + CR ;
    end;

    Result := Result +
     '        </td>                                                                   ' + CR +
     '      </tr>                                                                     ' + CR +
     '      <tr>                                                                      ' + CR +
     '        <td colspan="2" align="center">                                         ' + CR +
     '          <br>                                                                  ' + CR +
     '          <a href="JavaScript:ConfirmaTelefone();">                             ' + CR +
     '           <img src="../imagem/btnConfirmar.gif" name="btnConfirmar" border="0" ' + CR +
     '            onMouseOver="btnConfirmar.src=''../imagem/btnConfirmar_s.gif''"     ' + CR +
     '            onMouseOut="btnConfirmar.src=''../imagem/btnConfirmar.gif''"></a>   ' + CR +
     '          <a href="JavaScript:EnviaForm( document.frmLnkManutTelefones )">      ' + CR +
     '            <img src="../imagem/btnCancelar.gif" name="btnCancelar" border="0"  ' + CR +
     '            onMouseOver="btnCancelar.src=''../imagem/btnCancelar_s.gif''"       ' + CR +
     '            onMouseOut="btnCancelar.src=''../imagem/btnCancelar.gif''"></a>     ' + CR +
     '        </td>                                                                   ' + CR +
     '      </tr>                                                                     ' + CR +
     '    </table>                                                                    ' + CR +
     '    <input type="hidden" name="edtIdTelefone" value="' + IntToStr( iIdTelefone ) + '" > ' + CR +
     '    <#hiddenfields>                                                             ' + CR +
     '  </form>                                                                       ' + CR +
     '</p>                                                                            ' + CR +
     '<SCRIPT language="JavaScript">                                                  ' + CR +
     '  document.frmLnkTelefone.cmbLogradouro.focus();                                ' + CR +
     '</script>                                                                       ' + CR ;


    Result := MontaPagina( iPag, Result );

  except
    On E : Exception do
    begin
      Result := TrataWebExcecoes( E );
    end;
  end;

end; {PaginaAlteracaoTelefone}



//Monta a página de Gravação de Endereços
function PaginaSalvarTelefone( iIdPessoaLocal : integer; Request: TWebRequest ) : String;
var
  iIdTelefone : integer;
  sAux, sTipo, sOperacao : String;
  iPag : integer;
  bOk : boolean;
begin

  try
  
    iIdTelefone := StrToIntDef( Request.ContentFields.Values['edtIdTelefone'], 0 );

    if iIdTelefone = 0 then
      sOperacao := 'I'
    else
      sOperacao := 'A';

    //---------- Início da Alteração de endereço
    cds.Close;
    cds.Data := TelEndPess.SelecionaTelefone( iIdTelefone );

    cds.Data := CopyClientDataSet( cds );

    if cds.IsEmpty then
      cds.Insert
    else
      cds.Edit;

    sTipo := '';

    if TemAcessoCampo( sTipoUsuario, cAltTelComercial, sAux ) and ( Request.ContentFields.Values['cbComercial'] = '1' ) then
      sTipo := sTipo + 'C';

    if TemAcessoCampo( sTipoUsuario, cAltTelParticular, sAux ) and ( Request.ContentFields.Values['cbParticular'] = '1' ) then
      sTipo := sTipo + 'P';

    if TemAcessoCampo( sTipoUsuario, cAltTelFax, sAux ) and ( Request.ContentFields.Values['cbFax'] = '1' ) then
      sTipo := sTipo + 'F';

    if TemAcessoCampo( sTipoUsuario, cAltTelCelular, sAux ) and ( Request.ContentFields.Values['cbCelular'] = '1' ) then
      sTipo := sTipo + 'L';

    if TemAcessoCampo( sTipoUsuario, cAltTelRecado, sAux ) and ( Request.ContentFields.Values['cbRecado'] = '1' ) then
      sTipo := sTipo + 'R';

    AtualizaCampo( cAltTelLogradouro , cds.FieldByName( 'IDENDERECO'   ), Request.ContentFields.Values['cmbLogradouro']  );
    AtualizaCampo( cAltTelDDD        , cds.FieldByName( 'DDD'          ), Request.ContentFields.Values['edtDDD']         );
    AtualizaCampo( cAltTelDDI        , cds.FieldByName( 'DDI'          ), Request.ContentFields.Values['edtDDI']         );
    AtualizaCampo( cAltTelNumero     , cds.FieldByName( 'NUMERO'       ), Request.ContentFields.Values['edtNumero']      );
    AtualizaCampo( 0                 , cds.FieldByName( 'TIPO'         ), sTipo );
    cds.Post;

    TelEndPess.CdsTelEndPess.Data := cds.Data;
    
    if sOperacao = 'I' then
    begin
      iIdTelefone := TelEndPess.IncluirTelEndPess;
      bOk := ( iIdTelefone > 0 );
    end
    else
      bOk := TelEndPess.AlterarTelEndPess;

    if not bOk then raise Exception.Create( sMsgCtrl );

    //---------- Término da Alteração de endereço

    //---------- Montagem da página de confirmação
    if sOperacao = 'I' then iPag := pTelConfInclusao
    else                    iPag := pTelConfAlteracao;

    sTitulo := TituloPagina( iPag );

    Result := Result +
     '  <table border="0" width="100%" cellpadding="0" cellspacing="0"         ' + CR +
     '         class="FORMULARIO">                                             ' + CR +
     DadosTelefone( iIdPessoaLocal, iIdTelefone )                                + CR +
     '  </table>                                                               ' + CR +
     '  <BR><BR>                                                               ' + CR ;

    Result := MontaPagina( iPag, Result );

  except
    On E : Exception do
    begin
      Result := TrataWebExcecoes( E );
    end;
  end;

end; {PaginaSalvaTelefone}


//Exibe os dados de um determinado telefone
function DadosTelefone( iIdPessoaLocal, iIdTelefone : integer ) : String;
var
  sTituloCampo : string;
begin
  cds.Close;
  cds.Data := TelEndPess.SelecionaTelefoneLogradouro( iIdTelefone );

  if not cds.IsEmpty then
  begin
    Result :=
     '      <tr>                                                                  ' + CR +
     '        <td width="75%">                                                    ' + CR +
     '          <table border="0" width="100%" cellpadding="0" cellspacing="0">   ' + CR +
     '            <tr class="CAMPOFORM">                                          ' + CR +
     '              <td class="DESCCAMPO" colspan="3">                            ' + CR ;

    if TemAcessoCampo( sTipoUsuario, cAltTelLogradouro, sTituloCampo ) then
      Result := Result +
       sTituloCampo                                                                       +
       '                <DIV class="CONTCAMPOD">                                   ' + CR +
       StrToName( cds.FieldByName('LOGRADOURO').AsString )                                +
       '                </DIV>                                                     ' + CR ;

    Result := Result +
     '            </tr>                                                           ' + CR +
     '            <tr class="CAMPOFORM">                                          ' + CR +
     '              <td class="DESCCAMPO"  width="25%">                           ' + CR ;

    if TemAcessoCampo( sTipoUsuario, cAltTelDDI, sTituloCampo ) then
      Result := Result +
       sTituloCampo                                                                       +
       '                <DIV class="CONTCAMPO">                                    ' + CR +
       cds.FieldByName('DDI').AsString                                                    +
       '                </DIV>                                                     ' + CR ;

    Result := Result +
     '              </td>                                                         ' + CR +
     '              <td class="DESCCAMPO" width="25%">                            ' + CR ;

    if TemAcessoCampo( sTipoUsuario, cAltTelDDD, sTituloCampo ) then
      Result := Result +
       sTituloCampo                                                                       +
       '                <DIV class="CONTCAMPO">                                    ' + CR +
       cds.FieldByName('DDD').AsString                                                    +
       '                </DIV>                                                     ' + CR ;

    Result := Result +
     '              </td>                                                         ' + CR +
     '              <td class="DESCCAMPO" width="25%">                            ' + CR ;

    if TemAcessoCampo( sTipoUsuario, cAltTelNumero, sTituloCampo ) then
      Result := Result +
       sTituloCampo                                                                       +
       '                <DIV class="CONTCAMPO">                                    ' + CR +
       cds.FieldByName('NUMERO').AsString                                                 +
       '                </DIV>                                                     ' + CR ;

    Result := Result +
     '              </td>                                                         ' + CR +
     '            </tr>                                                           ' + CR +
     '          </table>                                                          ' + CR +
     '        </td>                                                               ' + CR +
     '        <td valign="top">                                                   ' + CR ;

    if TemAcessoCampo( sTipoUsuario, cAltTelComercial   , sTituloCampo ) or
       TemAcessoCampo( sTipoUsuario, cAltTelParticular  , sTituloCampo ) or
       TemAcessoCampo( sTipoUsuario, cAltTelFax         , sTituloCampo ) or
       TemAcessoCampo( sTipoUsuario, cAltTelCelular     , sTituloCampo ) or
       TemAcessoCampo( sTipoUsuario, cAltTelRecado      , sTituloCampo ) then
    begin
      Result := Result +
       '          <DIV class="BOXFORM" width="100%">                                             ' + CR +
       '            <DIV class="CABBOXFORM">                                                     ' + CR +
       '              Tipo do telefone                                                           ' + CR +
       '            </DIV>                                                                       ' + CR ;

      if TemAcessoCampo( sTipoUsuario, cAltTelComercial, sTituloCampo ) then
        if Pos( 'C', cds.FieldByName('TIPO').AsString ) > 0 then
          Result := Result + '&nbsp; <font face="Wingdings">w</font>&nbsp; ' + sTituloCampo + ' <BR> ' + CR ;

      if TemAcessoCampo( sTipoUsuario, cAltTelParticular, sTituloCampo ) then
        if Pos( 'P', cds.FieldByName('TIPO').AsString ) > 0 then
          Result := Result + '&nbsp; <font face="Wingdings">w</font>&nbsp; ' + sTituloCampo + ' <BR> ' + CR ;

      if TemAcessoCampo( sTipoUsuario, cAltTelFax, sTituloCampo ) then
        if Pos( 'F', cds.FieldByName('TIPO').AsString ) > 0 then
          Result := Result + '&nbsp; <font face="Wingdings">w</font>&nbsp; ' + sTituloCampo + ' <BR> ' + CR ;

      if TemAcessoCampo( sTipoUsuario, cAltTelCelular, sTituloCampo ) then
        if Pos( 'L', cds.FieldByName('TIPO').AsString ) > 0 then
          Result := Result + '&nbsp; <font face="Wingdings">w</font>&nbsp; ' + sTituloCampo + ' <BR> ' + CR ;

      if TemAcessoCampo( sTipoUsuario, cAltTelRecado, sTituloCampo ) then
        if Pos( 'R', cds.FieldByName('TIPO').AsString ) > 0 then
          Result := Result + '&nbsp; <font face="Wingdings">w</font>&nbsp; ' + sTituloCampo + ' <BR> ' + CR ;

      Result := Result + '          </DIV>                                                                         ' + CR ;
    end;

    Result := Result +
     '        </td>                                                                   ' + CR +
     '      </tr>                                                                     ' + CR ;
  end;

end; {DadosTelefone}


//Monta a página de Exclusão de Telefones
function PaginaExclusaoTelefone( iIdPessoaLocal, iIdTelefone : integer ) : String;
begin

  try

    sTitulo := TituloPagina( pTelExclusao );

    Result := Result +
     '  <table border="0" width="100%" cellpadding="0" cellspacing="0"                ' + CR +
     '         class="FORMULARIO">                                                    ' + CR +
     DadosTelefone( iIdPessoaLocal, iIdTelefone )                                       + CR +
     '      </tr>                                                                     ' + CR +
     '        <td colspan="2" align="center">                                         ' + CR +
     '          <br>                                                                  ' + CR ;

    if not bFlgDemo then
      Result := Result +
       '          <a href="JavaScript:EnviaForm( document.frmLnkExcluirTelefone );">  ' + CR
    else
      Result := Result +
       '          <a href="JavaScript:alert(''Funcionalidade desabilitada para demonstração.'');"> ' + CR;

    Result := Result +
     '           <img src="../imagem/btnConfirmar.gif" name="btnConfirmar" border="0" ' + CR +
     '            onMouseOver="btnConfirmar.src=''../imagem/btnConfirmar_s.gif''"     ' + CR +
     '            onMouseOut="btnConfirmar.src=''../imagem/btnConfirmar.gif''"></a>   ' + CR +
     '          <a href="JavaScript:EnviaForm( document.frmLnkManutTelefones )">      ' + CR +
     '            <img src="../imagem/btnCancelar.gif" name="btnCancelar" border="0"  ' + CR +
     '            onMouseOver="btnCancelar.src=''../imagem/btnCancelar_s.gif''"       ' + CR +
     '            onMouseOut="btnCancelar.src=''../imagem/btnCancelar.gif''"></a>     ' + CR +
     '        </td>                                                                   ' + CR +
     '      </tr>                                                                     ' + CR +
     '  </table>                                                                      ' + CR +
     '  <BR>                                                                          ' + CR +
     '  <form method="POST" name="frmLnkExcluirTelefone"                              ' + CR +
     '   action="../<#nomearqapl>/ExcluirTelefone">                       ' + CR +
     '    <input type="hidden" name="edtIdTelefone" value="' + IntToStr( iIdTelefone ) + '" > ' + CR +
     '    <#hiddenfields>                                                             ' + CR +
     '  </form>                                                                       ' + CR ;

    Result := MontaPagina( pTelExclusao, Result );

  except
    On E : Exception do
    begin
      Result := TrataWebExcecoes( E );
    end;
  end;

end; {PaginaExclusaoTelefone}


//Monta a página que exclui efetivamente o Endereço
function PaginaExcluirTelefone( iIdPessoaLocal, iIdTelefone : integer ) : String;
begin

  try

    TelEndPess.ExcluiTelEndPess( iIdTelefone );

    //---------- Montagem da página de confirmação
    sTitulo := TituloPagina( pTelConfExclusao );

    Result := MontaPagina( pTelConfExclusao, Result );

  except
    On E : Exception do
    begin
      Result := TrataWebExcecoes( E );
    end;
  end;

end; {PaginaExcluirTelefone}

end.
