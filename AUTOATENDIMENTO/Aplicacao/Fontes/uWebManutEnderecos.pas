{
-------------------------------------------------------------------------
Pendência   : SOL 91655 KINTANA 394002
Responsável : BRUNO AZEVEDO
Data        : 06/07/2010
Descrição   : Criação da manutenção dos dados cadastrais (E-mail, telefone e endereço).
--------------------------------------------------------------------------------
}
unit uWebManutEnderecos;

interface

uses SysUtils, DModAutoAtendimento, uConstPaginasCampos, httpapp, JCLStrings, uMidasUtil, uCmFileUtils;

//Monta a página de Manutenção de Endereços
function PaginaManutEnderecos( iIdPessoaLocal : integer ) : String;

//Monta a página de Alteração de Endereços
function PaginaAlteracaoEndereco( iIdPessoaLocal, iIdEndereco : integer ) : String;

//Monta a página de Gravação de Endereços
function PaginaSalvarEndereco( iIdPessoaLocal : integer; Request: TWebRequest ) : String;

//Exibe os dados de um determinado endereço
function DadosEndereco( iIdPessoaLocal, iIdEndereco : integer ) : String;

//Monta a página de Exclusão de Endereços
function PaginaExclusaoEndereco( iIdPessoaLocal, iIdEndereco : integer ) : String;

//Monta a página que exclui efetivamente o Endereço
function PaginaExcluirEndereco( iIdPessoaLocal, iIdEndereco : integer ) : String;

implementation

//Monta a página de Manutenção de Endereços
function PaginaManutEnderecos( iIdPessoaLocal : integer ) : String;
var
  sTipoEndereco, //BRUNO AZEVEDO SOL 91655 KINTANA 394002
  sDescricaoEndereco,
  sLogradouro,
  sNumeroEndereco,
  sComplemento,
  sBairro,
  sCidade,
  sEstado,
  sPais,
  sCEP,
  sAux : string;

  procedure IncluiLink( var sLink : String );
  begin
    sLink := '<a href="JavaScript:document.frmLnkAlteracaoEndereco.edtIdEndereco.value=''' +
         cds.FieldByName('IDENDERECO').AsString + '''; EnviaForm( document.frmLnkAlteracaoEndereco );">' +
         sLink + '</a>'
  end;

begin

  try

    sTitulo := TituloPagina( pManutEnderecos );

    cds.Close;
    cds.Data := EndPess.SelecionaEnderecosPorPessoa( iIdPessoaLocal );

    cdsHTMLColumns.Close;
    cdsHTMLColumns.CreateDataSet;

    //Pendência 25719 - 27/06/2007
    //BRUNO AZEVEDO SOL 91655 KINTANA 394002
    IncluiColuna( cAltEndTipo,   11, 'left' );
    //BRUNO AZEVEDO SOL 91655 KINTANA 394002
    IncluiColuna( cAltEndDescricao,   11, 'left' );
    IncluiColuna( cAltEndLogradouro,  15, 'left' );
    IncluiColuna( cAltEndNumero,       5, 'left' );
    IncluiColuna( cAltEndComplemento, 12, 'left' );
    IncluiColuna( cAltEndBairro,      11, 'left' );
    IncluiColuna( cAltEndCidade,      11, 'left' );
    IncluiColuna( cAltEndEstado,      11, 'left' );
    IncluiColuna( cAltEndPais,        11, 'left' );
    IncluiColuna( cAltEndCEP,          9, 'left' );
    //Fim Pendência 25719

    if TemAcessoPagina( sTipoUsuario, pEndAlteracao, sAux ) then
      IncluiColuna( -1,  7, 'center', ' Alterar ' );

    if TemAcessoPagina( sTipoUsuario, pEndExclusao, sAux ) then
      IncluiColuna( -2,  7, 'center', ' Excluir ' );

    if TemAcessoPagina( sTipoUsuario, pEndInclusao, sAux ) then
      Result := Result + '<a href="JavaScript:document.frmLnkAlteracaoEndereco.edtIdEndereco.value='''';' +
       'EnviaForm( document.frmLnkAlteracaoEndereco );">' +
       '<img name="imgNovo" src="../Imagem/novoreg.gif" border="0" style="float: right"   ' +
       ' onMouseOver="imgNovo.src=''../imagem/novoreg_s.gif''" '                            +
       ' onMouseOut="imgNovo.src=''../imagem/novoreg.gif''"> </a>' + CR ;

    Result := Result + HTMLTableHeader;

    cds.First;
    while not cds.Eof do
    begin
      //BRUNO AZEVEDO SOL 91655 KINTANA 394002
      sTipoEndereco      := StrToName( trim( cds.FieldByName('TIPOENDERECO').AsString ) );
      //BRUNO AZEVEDO SOL 91655 KINTANA 394002
      sDescricaoEndereco := StrToName( trim( cds.FieldByName('TIPOEND').AsString ) );
      sLogradouro        := StrToName( trim( cds.FieldByName('LOGRADOURO').AsString ) );
      sNumeroEndereco    := trim( cds.FieldByName('NUMERO').AsString );
      sComplemento       := StrToName( trim( cds.FieldByName('COMPLEMENTO').AsString ) );
      sBairro            := StrToName( trim( cds.FieldByName('BAIRRO').AsString ) );
      sCidade            := StrToName( trim( cds.FieldByName('CIDADE').AsString ) );
      sEstado            := trim( cds.FieldByName('CODESTADO').AsString );
      sPais              := trim( cds.FieldByName('PAIS').AsString );
      sCEP               := trim( cds.FieldByName('CEP').AsString );

      if TemAcessoPagina( sTipoUsuario, pEndAlteracao, sAux ) then
      begin
        IncluiLink( sTipoEndereco ); //BRUNO AZEVEDO SOL 91655 KINTANA 394002
        IncluiLink( sDescricaoEndereco );
        IncluiLink( sLogradouro );
        IncluiLink( sNumeroEndereco );
        IncluiLink( sComplemento );
        IncluiLink( sBairro );
        IncluiLink( sCidade );
        IncluiLink( sEstado );
        IncluiLink( sPais );        
        IncluiLink( sCEP );
      end;

      //Pendência 25719 - 27/06/2007
      PreencheColuna( cAltEndTipo,        sTipoEndereco ); //BRUNO AZEVEDO SOL 91655 KINTANA 394002
      PreencheColuna( cAltEndDescricao,   sDescricaoEndereco );
      PreencheColuna( cAltEndLogradouro,  sLogradouro );
      PreencheColuna( cAltEndNumero,      sNumeroEndereco );
      PreencheColuna( cAltEndComplemento, sComplemento );
      PreencheColuna( cAltEndBairro,      sBairro );
      PreencheColuna( cAltEndCidade,      sCidade );
      PreencheColuna( cAltEndEstado,      sEstado );
      PreencheColuna( cAltEndPais,        sPais );
      PreencheColuna( cAltEndCEP,         sCEP );
      //Fim Pendência 25719

      if TemAcessoPagina( sTipoUsuario, pEndAlteracao, sAux ) then
        PreencheColuna( -1,
         '<a href="JavaScript:document.frmLnkAlteracaoEndereco.edtIdEndereco.value=''' +
         cds.FieldByName('IDENDERECO').AsString + '''; EnviaForm( document.frmLnkAlteracaoEndereco );"> ' + CR +
         '<img name="imgAlterar' + cds.FieldByName('IDENDERECO').AsString + '" src="../Imagem/altreg.gif" border="0" style="float: center" ' +
         ' onMouseOver="imgAlterar' + cds.FieldByName('IDENDERECO').AsString + '.src=''../imagem/altreg_s.gif''" ' +
         ' onMouseOut="imgAlterar' + cds.FieldByName('IDENDERECO').AsString + '.src=''../imagem/altreg.gif''"></a>' + CR );

      if TemAcessoPagina( sTipoUsuario, pEndExclusao, sAux ) then
        PreencheColuna( -2,
         '<a href="JavaScript:document.frmLnkExclusaoEndereco.edtIdEndereco.value=''' +
         cds.FieldByName('IDENDERECO').AsString + '''; EnviaForm( document.frmLnkExclusaoEndereco );"> ' + CR +
         '<img name="imgExcluir' + cds.FieldByName('IDENDERECO').AsString + '" src="../Imagem/excreg.gif" border="0"  style="float: center" ' +
         ' onMouseOver="imgExcluir' + cds.FieldByName('IDENDERECO').AsString + '.src=''../imagem/excreg_s.gif''" ' +
         ' onMouseOut="imgExcluir' + cds.FieldByName('IDENDERECO').AsString + '.src=''../imagem/excreg.gif''"></a>' );

      Result := Result + HTMLTableRow;
      cds.Next;
    end;

    Result := Result + HTMLTableFooter +
     '  <form method="POST" name="frmLnkAlteracaoEndereco"                 ' + CR +
     '   action="../<#nomearqapl>/AlteracaoEndereco">          ' + CR +
     '    <input type="hidden" name="edtIdEndereco">                       ' + CR +
     '    <#hiddenfields>                                                  ' + CR +
     '  </form>                                                            ' + CR +
     '  <form method="POST" name="frmLnkExclusaoEndereco"                  ' + CR +
     '   action="../<#nomearqapl>/ExclusaoEndereco">           ' + CR +
     '    <input type="hidden" name="edtIdEndereco">                       ' + CR +
     '    <#hiddenfields>                                                  ' + CR +
     '  </form>                                                            ' + CR ;

    cdsHTMLColumns.Close;

    cds.Close;

    Result := MontaPagina( pManutEnderecos, Result );

  except
    On E : Exception do
    begin
      Result := TrataWebExcecoes( E );
    end;
  end;

end; {PaginaManutEndereco}


//Monta a página de Alteração de Endereços
function PaginaAlteracaoEndereco( iIdPessoaLocal, iIdEndereco : integer ) : String;
var
  sTituloCampo, sCidade : String;
  iPag : integer;
begin

  try
    if iIdEndereco = 0 then
      iPag := pEndInclusao
    else
    begin
      iPag := pEndAlteracao;
      cds.Close;
      cds.Data := EndPess.SelecionaEnderecoPessoa( iIdEndereco );
    end;

    sTitulo := TituloPagina( iPag );

    //Valida e confirma o preenchimento dos campos
    sJavaScript :=
     ' function ConfirmaEndereco( )                                              ' + CR +
     ' {                                                                         ' + CR +
     //BRUNO AZEVEDO SOL 91655 KINTANA 394002
     '   if (!( document.frmLnkEndereco.cbComercial.checked ) && ' +
     '       !( document.frmLnkEndereco.cbResidencial.checked ) && ' +
     '       !( document.frmLnkEndereco.cbEntrega.checked ) && ' +
     '       !( document.frmLnkEndereco.cbCobranca.checked ) && ' +
     '       !( document.frmLnkEndereco.cbCorresp.checked ))'                    + CR +
     '   {                                                                       ' + CR +
     '     alert(''Informe o tipo de endereço.'');                               ' + CR +
     '     exit;                                                                 ' + CR +
     '   }                                                                       ' + CR +
     //BRUNO AZEVEDO SOL 91655 KINTANA 394002
     MontaValidacao( cAltEndDescricao, 'frmLnkEndereco.edtDescricao', 'T' )        + CR +
     MontaValidacao( cAltEndLogradouro, 'frmLnkEndereco.edtLogradouro', 'T' )      + CR +
     MontaValidacao( cAltEndNumero, 'frmLnkEndereco.edtNumero', 'T' )              + CR +
     MontaValidacao( cAltEndBairro, 'frmLnkEndereco.edtBairro', 'T' )              + CR +
     MontaValidacao( cAltEndCEP, 'frmLnkEndereco.edtCEP', 'T' )                    + CR +
     MontaValidacao( cAltEndCidade, 'frmLnkEndereco.cmbCidade', 'C' )              + CR ;

    if not bFlgDemo then
    begin
      sJavaScript := sJavaScript +
       '   EnviaForm( document.frmLnkEndereco );                             }     ' + CR
    end
    else
      sJavaScript := sJavaScript +
       '   alert(''Funcionalidade desabilitada para demonstração.'');        }     ' + CR ;

    Result := Result +
     '<p class="DESCCAMPO">                                                       ' + CR +
     '  <form method="POST" name="frmLnkEndereco"                                 ' + CR +
     '   action="../<#nomearqapl>/SalvarEndereco">                    ' + CR +
     '    <table border="0" width="100%" cellpadding="0" cellspacing="0"          ' + CR +
     '           class="FORMULARIO">                                              ' + CR +
     '      <tr>                                                                  ' + CR +
     '        <td width="75%">                                                    ' + CR +
     '          <table border="0" width="100%" cellpadding="0" cellspacing="0">   ' + CR +
     '            <tr class="CAMPOFORM">                                          ' + CR +
     '              <td class="DESCCAMPO" colspan="2">                            ' + CR ;

    if TemAcessoCampo( sTipoUsuario, cAltEndDescricao, sTituloCampo ) then
    begin
      Result := Result +
       sTituloCampo                                                                      +
       '                <br>                                                      ' + CR +
       '                <input type="text" name="edtDescricao" size="80"          ' + CR +
       '                 class="TEXT" maxlength="40"                              ' + CR ;
      if iIdEndereco <> 0 then
        Result := Result + ' value="' + cds.FieldByName('TIPOEND').AsString + '" ';
      Result := Result + '>';
    end;


    Result := Result +
     '              <td class="DESCCAMPO" width="20%">                            ' + CR +
     '              </td>                                                         ' + CR +
     '            </tr>                                                           ' + CR +
     '            <tr class="CAMPOFORM">                                          ' + CR +
     '              <td class="DESCCAMPO" colspan="2">                            ' + CR ;

    if TemAcessoCampo( sTipoUsuario, cAltEndLogradouro, sTituloCampo ) then
    begin
      Result := Result +
       sTituloCampo                                                                      +
       '              <br>                                                        ' + CR +
       '              <input type="text" name="edtLogradouro" size="80"           ' + CR +
       '               class="TEXT" maxlength="60"                                ' + CR ;
      if iIdEndereco <> 0 then
        Result := Result + ' value="' + cds.FieldByName('LOGRADOURO').AsString + '" ';
      Result := Result + '>';
    end;


    Result := Result +
     '              </td>                                                         ' + CR +
     '              <td class="DESCCAMPO" width="20%">                            ' + CR ;

    if TemAcessoCampo( sTipoUsuario, cAltEndNumero, sTituloCampo ) then
    begin
      Result := Result +
       sTituloCampo                                                                      +
       '              <br>                                                        ' + CR +
       '              <input type="text" name="edtNumero" size="8"                ' + CR +
       '               class="TEXT" maxlength="8"                                 ' + CR ;
      if iIdEndereco <> 0 then
        Result := Result + ' value="' + cds.FieldByName('NUMERO').AsString + '" ';
      Result := Result + '>';
    end;


    Result := Result +
     '              </td>                                                         ' + CR +
     '            </tr>                                                           ' + CR +
     '            <tr class="CAMPOFORM">                                          ' + CR +
     '              <td class="DESCCAMPO" width="40%">                            ' + CR ;


    if TemAcessoCampo( sTipoUsuario, cAltEndComplemento, sTituloCampo ) then
    begin
      Result := Result +
       sTituloCampo                                                                    +
       '              <br>                                                        ' + CR +
       '              <input type="text" name="edtComplemento" size="35"          ' + CR +
       '               class="TEXT" maxlength="20"                                ' + CR ;
      if iIdEndereco <> 0 then
        Result := Result + ' value="' + cds.FieldByName('COMPLEMENTO').AsString + '" ';
      Result := Result + '>';
    end;

    Result := Result +
     '              </td>                                                         ' + CR +
     '              <td class="DESCCAMPO" width="40%">                            ' + CR ;


    if TemAcessoCampo( sTipoUsuario, cAltEndBairro, sTituloCampo ) then
    begin
      Result := Result +
       sTituloCampo                                                                      +
       '              <br>                                                        ' + CR +
       '              <input type="text" name="edtBairro" size="35"               ' + CR +
       '               class="TEXT" maxlength="20"                                ' + CR ;
      if iIdEndereco <> 0 then
        Result := Result + ' value="' + cds.FieldByName('BAIRRO').AsString + '" ';
      Result := Result + '>';
    end;

    Result := Result +
     '              </td>                                                         ' + CR +
     '              <td class="DESCCAMPO">                                        ' + CR ;


    if TemAcessoCampo( sTipoUsuario, cAltEndCEP, sTituloCampo ) then
    begin
      Result := Result +
       sTituloCampo                                                                      +
       '              <br>                                                        ' + CR +
       '              <input type="text" name="edtCEP" size="8"                   ' + CR +
       '               class="TEXT" maxlength="8"                                 ' + CR ;
      if iIdEndereco <> 0 then
        Result := Result + ' value="' + cds.FieldByName('CEP').AsString + '" ';
      Result := Result + '>';
    end;

    Result := Result +
     '              </td>                                                         ' + CR +
     '            </tr>                                                           ' + CR +
     '            <tr>                                                            ' + CR +
     '              <td class="DESCCAMPO" colspan="2">                            ' + CR ;

    if TemAcessoCampo( sTipoUsuario, cAltEndCidade, sTituloCampo ) then
    begin
      cdsAux.Close;
      cdsAux.Data := EndPess.SelecionaCidades;

      Result := Result +
       sTituloCampo + ' (Estado) ' + '<br>' +
       '                <select size="1" name="cmbCidade" class="TEXT">    ' + CR +
       '                  <option value="-1">[Selecione uma das cidades abaixo]</option> ' + CR ;

      while not cdsAux.Eof do
      begin
        Result := Result + '                  <option value="' + cdsAux.FieldByName('IDCIDADES').AsString + '" ';

        sCidade := trim( cdsAux.FieldByName('NOMECIDADE').AsString );

        if TemAcessoCampo( sTipoUsuario, cAltEndEstado, sTituloCampo ) then
          sCidade := sCidade + ' (' + trim( cdsAux.FieldByName('CODESTADO').AsString ) + ')';

        if   ( iIdEndereco <> 0 ) then
          if ( cds.FieldByName('IDCIDADES').AsString = cdsAux.FieldByName('IDCIDADES').AsString ) then
            Result := Result + ' selected';

        Result := Result + '>' + sCidade + '</option>' + CR;

        cdsAux.Next;
      end;

      cdsAux.Close;

      Result := Result +
       '                </select>                                                 ' + CR ;
    end;

    Result := Result +
     '              </td>                                                         ' + CR +
     '            </tr>                                                           ' + CR +
     '          </table>                                                          ' + CR +
     '        </td>                                                               ' + CR +
     '        <td valign="top">                                                   ' + CR ;

    if TemAcessoCampo( sTipoUsuario, cAltEndTipo, sTituloCampo ) then
    begin
      Result := Result +
       '          <DIV class="BOXFORM" width="100%">                                             ' + CR +
       '            <DIV class="CABBOXFORM">                                                     ' + CR +
       '              Tipo do endereço                                                           ' + CR +
       '            </DIV>                                                                       ' + CR +
       '            <input type="checkbox"                                                       ' + CR ;
      if   ( iIdEndereco <> 0 ) then
        if iIdEndereco = cds.FieldByName('IDENDCOMERCIAL').AsInteger then Result := Result + ' checked ';
      Result := Result +
       ' name="cbComercial" value="1"> Comercial     </input>                                  ' + CR +
       '            <br>                                                                         ' + CR +
       '            <input type="checkbox"                                                       ' + CR ;
      if   ( iIdEndereco <> 0 ) then
        if iIdEndereco = cds.FieldByName('IDENDRESIDENCIAL').AsInteger then Result := Result + ' checked ';
      Result := Result +
       ' name="cbResidencial" value="1"> Residencial </input>' + CR +
       '            <br>                                                                         ' + CR +
       '            <input type="checkbox"                                                       ' + CR ;
      if   ( iIdEndereco <> 0 ) then
        if iIdEndereco = cds.FieldByName('IDENDENTREGA').AsInteger then Result := Result + ' checked ';
      Result := Result +
       ' name="cbEntrega" value="1"> Entrega         </input>' + CR +
       '            <br>                                                                         ' + CR +
       '            <input type="checkbox"                                                       ' + CR ;
      if   ( iIdEndereco <> 0 ) then
        if iIdEndereco = cds.FieldByName('IDENDCOBRANCA').AsInteger then Result := Result + ' checked ';
      Result := Result +
       ' name="cbCobranca" value="1"> Cobrança       </input>' + CR +
       '            <br>                                                                         ' + CR +
       '            <input type="checkbox"                                                       ' + CR ;
      if   ( iIdEndereco <> 0 ) then
        if iIdEndereco = cds.FieldByName('IDENDCORRESP').AsInteger then Result := Result + ' checked ';
      Result := Result +
       ' name="cbCorresp" value="1"> Correspondência </input>' + CR +
       '          </DIV>                                                                         ' + CR ;
    end;

    Result := Result +
     '          <input type="hidden" name="edtPais" value="1">                        ' + CR +
     '        </td>                                                                   ' + CR +
     '      </tr>                                                                     ' + CR +
     '      <tr>                                                                      ' + CR +
     '        <td colspan="2" align="center">                                         ' + CR +
     '          <br>                                                                  ' + CR +
     '          <a href="JavaScript:ConfirmaEndereco();">                             ' + CR +
     '           <img src="../imagem/btnConfirmar.gif" name="btnConfirmar" border="0" ' + CR +
     '            onMouseOver="btnConfirmar.src=''../imagem/btnConfirmar_s.gif''"     ' + CR +
     '            onMouseOut="btnConfirmar.src=''../imagem/btnConfirmar.gif''"></a>   ' + CR +
     '          <a href="JavaScript:EnviaForm( document.frmLnkManutEnderecos )">      ' + CR +
     '            <img src="../imagem/btnCancelar.gif" name="btnCancelar" border="0"  ' + CR +
     '            onMouseOver="btnCancelar.src=''../imagem/btnCancelar_s.gif''"       ' + CR +
     '            onMouseOut="btnCancelar.src=''../imagem/btnCancelar.gif''"></a>     ' + CR +
     '        </td>                                                                   ' + CR +
     '      </tr>                                                                     ' + CR +
     '    </table>                                                                    ' + CR +
     '    <input type="hidden" name="edtIdEndereco" value="' + IntToStr( iIdEndereco ) + '" > ' + CR +
     '    <#hiddenfields>                                                             ' + CR +
     '  </form>                                                                       ' + CR +
     '</p>                                                                            ' + CR +
     '<SCRIPT language="JavaScript">                                                  ' + CR +
     '  document.frmLnkEndereco.edtDescricao.focus();                                 ' + CR +
     '</script>                                                                       ' + CR ;


    Result := MontaPagina( iPag, Result );

  except
    On E : Exception do
    begin
      Result := TrataWebExcecoes( E );
    end;
  end;

end; {PaginaInclusaoEnderecos}



//Monta a página de Gravação de Endereços
function PaginaSalvarEndereco( iIdPessoaLocal : integer; Request: TWebRequest ) : String;
var
  iIdEndereco, iIdOldEndereco, iIdTelefone : integer;
  sOperacao : String;
  iIdEndComercial, iIdEndResidencial, iIdEndEntrega, iIdEndCobranca, iIdEndCorresp : integer;
  iPag : integer;
  bOk : boolean;
  sTipoEndereco: String; //BRUNO AZEVEDO SOL 91655 KINTANA 394002
begin

  try

    iIdEndereco := StrToIntDef( Request.ContentFields.Values['edtIdEndereco'], 0 );
    iIdOldEndereco := iIdEndereco;

    if iIdEndereco = 0 then
      sOperacao := 'I'
    else
      sOperacao := 'A';

    //---------- Início da Alteração de endereço
    cds.Close;
    cds.Data := EndPess.SelecionaEndereco( iIdEndereco );

    cds.Data := CopyClientDataSet( cds );

    if cds.IsEmpty then
      cds.Insert
    else
      cds.Edit;

    //BRUNO AZEVEDO SOL 91655 KINTANA 394002
    if (Trim(Request.ContentFields.Values['cbComercial']) = '1') and (Trim(Request.ContentFields.Values['cbResidencial']) <> '1') then begin
      sTipoEndereco := 'C';
    end else if (Trim(Request.ContentFields.Values['cbComercial']) = '1') or
                (Trim(Request.ContentFields.Values['cbResidencial']) = '1') or
                (Trim(Request.ContentFields.Values['cbEntrega']) = '1') or
                (Trim(Request.ContentFields.Values['cbCobranca']) = '1') or
                (Trim(Request.ContentFields.Values['cbCorresp']) = '1') then begin
      sTipoEndereco := 'R';
    end else begin
      sTipoEndereco := '';
    end;
    //BRUNO AZEVEDO SOL 91655 KINTANA 394002
    
    AtualizaCampo( 0,                  cds.FieldByName( 'IDPESSOA'     ), iIdPessoaLocal );
    AtualizaCampo( cAltEndDescricao,   cds.FieldByName( 'NOME'         ), Request.ContentFields.Values['edtDescricao']   );
    AtualizaCampo( cAltEndLogradouro,  cds.FieldByName( 'LOGRADOURO'   ), Request.ContentFields.Values['edtLogradouro']  );
    AtualizaCampo( cAltEndNumero,      cds.FieldByName( 'NUMERO'       ), Request.ContentFields.Values['edtNumero']      );
    AtualizaCampo( cAltEndComplemento, cds.FieldByName( 'COMPLEMENTO'  ), Request.ContentFields.Values['edtComplemento'] );
    AtualizaCampo( cAltEndBairro,      cds.FieldByName( 'BAIRRO'       ), Request.ContentFields.Values['edtBairro']      );
    AtualizaCampo( cAltEndCidade,      cds.FieldByName( 'IDCIDADES'    ), Request.ContentFields.Values['cmbCidade']      );
    AtualizaCampo( cAltEndLogradouro,  cds.FieldByName( 'CEP'          ), Request.ContentFields.Values['edtCEP']         );
    AtualizaCampo( 0,                  cds.FieldByName( 'CODESTADO'    ), ''                                             );
    AtualizaCampo( 0,                  cds.FieldByName( 'IDPAIS'       ), Request.ContentFields.Values['edtPais']        );
    //BRUNO AZEVEDO SOL 91655 KINTANA 394002
    AtualizaCampo( cAltEndTipo,        cds.FieldByName( 'TIPOENDERECO' ), sTipoEndereco                                  );
    //BRUNO AZEVEDO SOL 91655 KINTANA 394002
    cds.Post;

    EndPess.CdsEndPess.Data := cds.Data;

    //BRUNO AZEVEDO VOLTEI ESTA ALTERAÇÃO SOL 150726 KINTANA 1099530
    if sOperacao = 'I' then
    begin
      iIdEndereco := EndPess.IncluirEndPess;
      bOk := ( iIdEndereco > 0 );
    end
    else
      bOk := EndPess.AlterarEndPess;

    if not bOk then raise Exception.Create( sMsgCtrl );

    //---------- Término da Alteração de endereço


    //---------- Início da Alteração de pessoa física
    iIdEndComercial   := 0;
    iIdEndResidencial := 0;
    iIdEndEntrega     := 0;
    iIdEndCobranca    := 0;
    iIdEndCorresp     := 0;

    cdsAux.Close;
    cdsAux.Data := Pessoa.SelecionaPessoa( iIdPessoaLocal );

    cdsAux.Data := CopyClientDataSet( cdsAux );

    if trim( Request.ContentFields.Values['cbComercial'] )   = '1' then iIdEndComercial   := iIdEndereco;
    if trim( Request.ContentFields.Values['cbResidencial'] ) = '1' then iIdEndResidencial := iIdEndereco;
    if trim( Request.ContentFields.Values['cbEntrega'] )     = '1' then iIdEndEntrega     := iIdEndereco;
    if trim( Request.ContentFields.Values['cbCobranca'] )    = '1' then iIdEndCobranca    := iIdEndereco;
    if trim( Request.ContentFields.Values['cbCorresp'] )     = '1' then iIdEndCorresp     := iIdEndereco;

    cdsAux.Edit;

    if (iIdEndComercial > 0) then
      AtualizaCampo( cAltEndTipo, cdsAux.FieldByName('IDENDCOMERCIAL'),   iIdEndComercial   );

    if (iIdEndResidencial > 0) then
      AtualizaCampo( cAltEndTipo, cdsAux.FieldByName('IDENDRESIDENCIAL'), iIdEndResidencial );

    if (iIdEndEntrega > 0) then
      AtualizaCampo( cAltEndTipo, cdsAux.FieldByName('IDENDENTREGA'),     iIdEndEntrega     );

    if (iIdEndCobranca > 0) then
      AtualizaCampo( cAltEndTipo, cdsAux.FieldByName('IDENDCOBRANCA'),    iIdEndCobranca    );

    if (iIdEndCorresp > 0) then
      AtualizaCampo( cAltEndTipo, cdsAux.FieldByName('IDENDCORRESP'),     iIdEndCorresp     );

    
    cdsAux.Post;

    Pessoa.CdsPessoa.Data := cdsAux.Data;
    if not Pessoa.AlterarPessoa then
      raise Exception.Create( sMsgCtrl );

    cds.Close;
    cdsAux.Close;

    //---------- Término da Alteração de pessoa física

    //---------- Início da Alteração TELENDPESS
    cdsAux.Close;
    cdsAux.Data := TelEndPess.SelecionaTelefoneEndereco ( iIdOldEndereco );

    if (cdsAux.Recordcount > 0) then begin
      cdsAux.Data := CopyClientDataSet( cdsAux );

      cdsAux.Edit;
      AtualizaCampo( 0, cdsAux.FieldByName('IDENDERECO'),   iIdEndereco);
      cdsAux.Post;

      TelEndPess.CdsTelEndPess.Data := cdsAux.Data;

      iIdTelefone := TelEndPess.IncluirTelEndPess;

      bOk := ( iIdTelefone > 0 );
      if not bOk then raise Exception.Create( sMsgCtrl );
    end;
    
    cds.Close;
    cdsAux.Close;
    //---------- Término da Alteração TELENDPESS


    //---------- Montagem da página de confirmação
    if sOperacao = 'I' then iPag := pEndConfInclusao
    else                    iPag := pEndConfAlteracao;

    sTitulo := TituloPagina( iPag );

    Result := Result +
     '  <table border="0" width="100%" cellpadding="0" cellspacing="0"         ' + CR +
     '         class="FORMULARIO">                                             ' + CR +
     DadosEndereco( iIdPessoaLocal, iIdEndereco )                                + CR +
     '  </table>                                                               ' + CR +
     '  <BR><BR>                                                               ' + CR ;

    Result := MontaPagina( iPag, Result );

  except
    On E : Exception do
    begin
      Result := TrataWebExcecoes( E );
    end;
  end;

end; {PaginaSalvaEndereco}


//Exibe os dados de um determinado endereço
function DadosEndereco( iIdPessoaLocal, iIdEndereco : integer ) : String;
var
  sTituloCampo : string;
begin
  cds.Close;
  cds.Data := EndPess.SelecionaEnderecoPessoa( iIdEndereco );

  if not cds.IsEmpty then
  begin
    Result :=
     '      <tr>                                                                  ' + CR +
     '        <td width="75%">                                                    ' + CR +
     '          <table border="0" width="100%" cellpadding="0" cellspacing="0">   ' + CR +
     '            <tr class="CAMPOFORM">                                          ' + CR +
     '              <td class="DESCCAMPO" colspan="2">                            ' + CR ;

    if TemAcessoCampo( sTipoUsuario, cAltEndDescricao, sTituloCampo ) then
      Result := Result +
       sTituloCampo                                                                       +
       '                <DIV class="CONTCAMPOD">                                   ' + CR +
       StrToName( cds.FieldByName('TIPOEND').AsString )                                   +
       '                </DIV>                                                     ' + CR ;

    Result := Result +
     '              <td class="DESCCAMPO" width="20%">                            ' + CR +
     '              </td>                                                         ' + CR +
     '            </tr>                                                           ' + CR +
     '            <tr class="CAMPOFORM">                                          ' + CR +
     '              <td class="DESCCAMPO" colspan="2">                            ' + CR ;

    if TemAcessoCampo( sTipoUsuario, cAltEndLogradouro, sTituloCampo ) then
      Result := Result +
       sTituloCampo                                                                       +
       '                <DIV class="CONTCAMPO">                                    ' + CR +
       StrToName( cds.FieldByName('LOGRADOURO').AsString )                                +
       '                </DIV>                                                     ' + CR ;

    Result := Result +
     '              </td>                                                         ' + CR +
     '              <td class="DESCCAMPO" width="20%">                            ' + CR ;

    if TemAcessoCampo( sTipoUsuario, cAltEndNumero, sTituloCampo ) then
      Result := Result +
       sTituloCampo                                                                       +
       '                <DIV class="CONTCAMPO">                                    ' + CR +
       cds.FieldByName('NUMERO').AsString                                                 +
       '                </DIV>                                                     ' + CR ;

    Result := Result +
     '              </td>                                                         ' + CR +
     '            </tr>                                                           ' + CR +
     '            <tr class="CAMPOFORM">                                          ' + CR +
     '              <td class="DESCCAMPO" width="40%">                            ' + CR ;


    if TemAcessoCampo( sTipoUsuario, cAltEndComplemento, sTituloCampo ) then
      Result := Result +
       sTituloCampo                                                                       +
       '                <DIV class="CONTCAMPO">                                    ' + CR +
       StrToName( cds.FieldByName('COMPLEMENTO').AsString )                               +
       '                </DIV>                                                     ' + CR ;

    Result := Result +
     '              </td>                                                         ' + CR +
     '              <td class="DESCCAMPO" width="40%">                            ' + CR ;


    if TemAcessoCampo( sTipoUsuario, cAltEndBairro, sTituloCampo ) then
      Result := Result +
       sTituloCampo                                                                       +
       '                <DIV class="CONTCAMPO">                                    ' + CR +
       StrToName( cds.FieldByName('BAIRRO').AsString )                                    +
       '                </DIV>                                                     ' + CR ;

    Result := Result +
     '              </td>                                                         ' + CR +
     '              <td class="DESCCAMPO">                                        ' + CR ;


    if TemAcessoCampo( sTipoUsuario, cAltEndCEP, sTituloCampo ) then
      Result := Result +
       sTituloCampo                                                                       +
       '                <DIV class="CONTCAMPO">                                    ' + CR +
       cds.FieldByName('CEP').AsString                                                    +
       '                </DIV>                                                     ' + CR ;

    Result := Result +
     '              </td>                                                         ' + CR +
     '            </tr>                                                           ' + CR +
     '            <tr class="CAMPOFORM">                                          ' + CR +
     '              <td class="DESCCAMPO" colspan="2">                            ' + CR ;


    if TemAcessoCampo( sTipoUsuario, cAltEndCidade, sTituloCampo ) then
      Result := Result +
       sTituloCampo                                                                       +
       '                <DIV class="CONTCAMPO">                                    ' + CR +
       StrToName( cds.FieldByName('CIDADE').AsString )                                    +
       '                </DIV>                                                     ' + CR ;


    Result := Result +
     '              </td>                                                         ' + CR +
     '              <td class="DESCCAMPO">                                        ' + CR ;


    if TemAcessoCampo( sTipoUsuario, cAltEndEstado, sTituloCampo ) then
      Result := Result +
       sTituloCampo                                                                       +
       '                <DIV class="CONTCAMPO">                                    ' + CR +
       StrToName( cds.FieldByName('ESTADO').AsString )                                    +
       '                </DIV>                                                     ' + CR ;


    Result := Result +
     '              </td>                                                         ' + CR +
     '            </tr>                                                           ' + CR +
     '          </table>                                                          ' + CR +
     '        </td>                                                               ' + CR +
     '        <td valign="top">                                                   ' + CR ;

    if TemAcessoCampo( sTipoUsuario, cAltEndTipo, sTituloCampo ) then
    begin
      Result := Result +
       '          <DIV class="BOXFORM" width="100%">                                             ' + CR +
       '            <DIV class="CABBOXFORM">                                                     ' + CR +
       '              Tipo do endereço                                                           ' + CR +
       '            </DIV>                                                                       ' + CR ;

      if iIdEndereco = cds.FieldByName('IDENDCOMERCIAL').AsInteger then
        Result := Result + '&nbsp; <font face="Wingdings">w</font>&nbsp; Comercial <BR>         ' + CR ;
      if iIdEndereco = cds.FieldByName('IDENDRESIDENCIAL').AsInteger then
        Result := Result + '&nbsp; <font face="Wingdings">w</font>&nbsp; Residencial <BR>       ' + CR ;
      if iIdEndereco = cds.FieldByName('IDENDENTREGA').AsInteger then
        Result := Result + '&nbsp; <font face="Wingdings">w</font>&nbsp; Entrega <BR>           ' + CR ;
      if iIdEndereco = cds.FieldByName('IDENDCOBRANCA').AsInteger then
        Result := Result + '&nbsp; <font face="Wingdings">w</font>&nbsp; Cobrança <BR>          ' + CR ;
      if iIdEndereco = cds.FieldByName('IDENDCORRESP').AsInteger then
        Result := Result + '&nbsp; <font face="Wingdings">w</font>&nbsp; Correspondência <BR>   ' + CR ;

      Result := Result + '          </DIV>                                                                         ' + CR ;
    end;

    Result := Result +
     '        </td>                                                                   ' + CR +
     '      </tr>                                                                     ' + CR ;
  end;

end; {DadosEndereco}


//Monta a página de Exclusão de Endereços
function PaginaExclusaoEndereco( iIdPessoaLocal, iIdEndereco : integer ) : String;
begin

  try

    sTitulo := TituloPagina( pEndExclusao );

    Result := Result +
     '  <table border="0" width="100%" cellpadding="0" cellspacing="0"                ' + CR +
     '         class="FORMULARIO">                                                    ' + CR +
     DadosEndereco( iIdPessoaLocal, iIdEndereco )                                       + CR +
     '      </tr>                                                                     ' + CR +
     '        <td colspan="2" align="center">                                         ' + CR +
     '          <br>                                                                  ' + CR ;

    if not bFlgDemo then
      Result := Result +
       '          <a href="JavaScript:EnviaForm( document.frmLnkExcluirEndereco );">  ' + CR
    else
      Result := Result +
       '          <a href="JavaScript:alert(''Funcionalidade desabilitada para demonstração.'');"> ' + CR;

    Result := Result +
     '           <img src="../imagem/btnConfirmar.gif" name="btnConfirmar" border="0" ' + CR +
     '            onMouseOver="btnConfirmar.src=''../imagem/btnConfirmar_s.gif''"     ' + CR +
     '            onMouseOut="btnConfirmar.src=''../imagem/btnConfirmar.gif''"></a>   ' + CR +
     '          <a href="JavaScript:EnviaForm( document.frmLnkManutEnderecos )">      ' + CR +
     '            <img src="../imagem/btnCancelar.gif" name="btnCancelar" border="0"  ' + CR +
     '            onMouseOver="btnCancelar.src=''../imagem/btnCancelar_s.gif''"       ' + CR +
     '            onMouseOut="btnCancelar.src=''../imagem/btnCancelar.gif''"></a>     ' + CR +
     '        </td>                                                                   ' + CR +
     '      </tr>                                                                     ' + CR +
     '  </table>                                                                      ' + CR +
     '  <BR>                                                                          ' + CR +
     '  <form method="POST" name="frmLnkExcluirEndereco"                              ' + CR +
     '   action="../<#nomearqapl>/ExcluirEndereco">                       ' + CR +
     '    <input type="hidden" name="edtIdEndereco" value="' + IntToStr( iIdEndereco ) + '" > ' + CR +
     '    <#hiddenfields>                                                             ' + CR +
     '  </form>                                                                       ' + CR ;

    Result := MontaPagina( pEndExclusao, Result );

  except
    On E : Exception do
    begin
      Result := TrataWebExcecoes( E );
    end;
  end;

end; {PaginaExclusaoEndereco}


//Monta a página que exclui efetivamente o Endereço
function PaginaExcluirEndereco( iIdPessoaLocal, iIdEndereco : integer ) : String;
begin

  try

    //---------- Início da Alteração de pessoa física
    cdsAux.Close;
    cdsAux.Data := Pessoa.SelecionaPessoa( iIdPessoaLocal );

    cdsAux.Data := CopyClientDataSet( cdsAux );    

    cdsAux.Edit;

    if cdsAux.FieldByName('IDENDCOMERCIAL').AsInteger = iIdEndereco then
      cdsAux.FieldByName('IDENDCOMERCIAL').AsInteger := 0;

    if cdsAux.FieldByName('IDENDRESIDENCIAL').AsInteger = iIdEndereco then
      cdsAux.FieldByName('IDENDRESIDENCIAL').AsInteger := 0;

    if cdsAux.FieldByName('IDENDENTREGA').AsInteger = iIdEndereco then
      cdsAux.FieldByName('IDENDENTREGA').AsInteger := 0;

    if cdsAux.FieldByName('IDENDCOBRANCA').AsInteger = iIdEndereco then
      cdsAux.FieldByName('IDENDCOBRANCA').AsInteger := 0;

    if cdsAux.FieldByName('IDENDCORRESP').AsInteger = iIdEndereco then
      cdsAux.FieldByName('IDENDCORRESP').AsInteger := 0;

    cdsAux.Post;

    Pessoa.CdsPessoa.Data := cdsAux.Data;
    if not Pessoa.AlterarPessoa then
      raise Exception.Create( sMsgCtrl );

    //---------- Término da Alteração de pessoa física



    //---------- Início da Exclusão de endereço
    if not EndPess.ExcluirEndPess( iIdEndereco ) then
      raise Exception.Create( sMsgCtrl );
    //---------- Término da Exclusão de endereço

    //---------- Montagem da página de confirmação
    sTitulo := TituloPagina( pEndConfExclusao );

    Result := MontaPagina( pEndConfExclusao, Result );

  except
    On E : Exception do
    begin
      Result := TrataWebExcecoes( E );
    end;
  end;

end; {PaginaExcluirEndereco}

end.
