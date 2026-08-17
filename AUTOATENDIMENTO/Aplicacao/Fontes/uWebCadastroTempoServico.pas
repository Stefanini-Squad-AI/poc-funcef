{
--------------------------------------------------------------------------------
Pendência   : SOL 141167 KINTANA 889112
Responsável : BRUNO AZEVEDO
Data        : 04/08/2010
Descrição   : Correção na estrutura da tela.
--------------------------------------------------------------------------------
}
unit uWebCadastroTempoServico;

interface

uses
  SysUtils, DModAutoAtendimento, uConstPaginasCampos, uCtrlFuncoesAA,
  uCmFileUtils, httpapp, JCLStrings;

function ConsultaTempoServico(pIdPessoa: Integer): String;
function AlteracaoTempoServico(pIdPessoa, pIdTempoServico: Integer): String;
function SalvarTempoServico(iIdPessoaLocal: Integer; Request: TWebRequest): String;
function ExclusaoTempoServico(iIdPessoaLocal, iIdTempoServico: integer): String;
function ExcluirTempoServico(iIdPessoaLocal, iIdTempoServico: integer): String;

function DadosTempoServico(iIdPessoaLocal, iIdTempoServico: integer): String;
function Rodape(): String;

implementation
                                                
function ConsultaTempoServico(pIdPessoa: Integer): String;
var
  sTituloCampo, sAux : String;
  iSeqLegenda : integer;  
begin
  try

    sTitulo := TituloPagina(pTempoServicoConsulta);
    Cds.Close;
    Cds.Data := WebTempoServico.SelecionaPessoa(iIdpessoa);

    Cds.First;

    Result := Result +
     '<center><table border="0" width="70%" cellspacing="0" cellpadding="0" >' + CR ;

    //BOTÃO NOVO REGISTRO
    Result := Result + '<a href="JavaScript:document.frmLnkAlteracaoTempoServico.pIdTempoServico.value='''';' +
     'EnviaForm( document.frmLnkAlteracaoTempoServico );">' +
     '<img name="imgNovo" src="../Imagem/novoreg.gif" border="0" style="float: right"   ' +
     ' onMouseOver="imgNovo.src=''../imagem/novoreg_s.gif''" '                            +
     ' onMouseOut="imgNovo.src=''../imagem/novoreg.gif''"> </a>' + CR ;

    cdsHTMLColumns.Close;
    cdsHTMLColumns.CreateDataSet;

    cds.First;
    IncluiColuna( cEmpresa,               60,  'left' );
    IncluiColuna( cDataInicial,           10,  'left' );
    IncluiColuna( cDataFinal,             10,  'left' );
    IncluiColuna( -1,  7, 'center', ' Alterar ' );
    IncluiColuna( -2,  7, 'center', ' Excluir ' );

    Result := Result +
     '  <tr>                                                        ' + CR +
     '    <td> <BR>                                                 ' + CR +
    HTMLTableHeader;

    cds.First;
    while not cds.eof do begin
      PreencheColuna(cEmpresa,     Trim(cds.FieldByName('EMPRESA').AsString));
      PreencheColuna(cDataInicial, FormataDataHora('dd/mm/yyyy', cds.FieldByName('DTINICIO').AsString));
      PreencheColuna(cDataFinal,   FormataDataHora('dd/mm/yyyy', cds.FieldByName('DTFIM').AsString));

      //BOTÃO ALTERAR
      PreencheColuna( -1,
      '<a href="JavaScript:document.frmLnkAlteracaoTempoServico.pIdTempoServico.value=''' +
      cds.FieldByName('IDHSTTEMPOSERVICO').AsString + '''; EnviaForm( document.frmLnkAlteracaoTempoServico );"> ' + CR +
      '<img name="imgAlterar' + cds.FieldByName('IDHSTTEMPOSERVICO').AsString + '" src="../Imagem/altreg.gif" border="0" style="float: center" ' +
      ' onMouseOver="imgAlterar' + cds.FieldByName('IDHSTTEMPOSERVICO').AsString + '.src=''../imagem/altreg_s.gif''" ' +
      ' onMouseOut="imgAlterar' + cds.FieldByName('IDHSTTEMPOSERVICO').AsString + '.src=''../imagem/altreg.gif''"></a>' + CR );

      //BOTÃO EXCLUIR
      PreencheColuna( -2,
      '<a href="JavaScript:document.frmLnkExclusaoTempoServico.pIdTempoServico.value=''' +
      cds.FieldByName('IDHSTTEMPOSERVICO').AsString + '''; EnviaForm( document.frmLnkExclusaoTempoServico );"> ' + CR +
      '<img name="imgExcluir' + cds.FieldByName('IDHSTTEMPOSERVICO').AsString + '" src="../Imagem/excreg.gif" border="0"  style="float: center" ' +
      ' onMouseOver="imgExcluir' + cds.FieldByName('IDHSTTEMPOSERVICO').AsString + '.src=''../imagem/excreg_s.gif''" ' +
      ' onMouseOut="imgExcluir' + cds.FieldByName('IDHSTTEMPOSERVICO').AsString + '.src=''../imagem/excreg.gif''"></a>' );
      Result := Result + HtmlTableRow;

      cds.Next;
    end;
    Result := Result +   HTMLTableFooter;    
    Result := Result + '</table></center>' + CR ;
    
    cds.Close;
    cdsHTMLColumns.Close;

    Result := Result + HTMLTableFooter +
     '  <form method="POST" name="frmLnkAlteracaoTempoServico"     ' + CR +
     '   action="../<#nomearqapl>/AlteracaoTempoServico">          ' + CR +
     '    <input type="hidden" name="pIdTempoServico">             ' + CR +
     '    <#hiddenfields>                                          ' + CR +
     '  </form>                                                    ' + CR +
     '  <form method="POST" name="frmLnkExclusaoTempoServico"      ' + CR +
     '   action="../<#nomearqapl>/ExclusaoTempoServico">           ' + CR +
     '    <input type="hidden" name="pIdTempoServico">             ' + CR +
     '    <#hiddenfields>                                          ' + CR +
     '  </form>                                                    ' + CR ;

    Result := MontaPagina(pTempoServicoConsulta, Result);

  except
    On E : Exception do
    begin
      Result := TrataWebExcecoes(E);
    end;
  end;
end;

function AlteracaoTempoServico(pIdPessoa, pIdTempoServico: Integer): String;
var
  sTituloCampo: String;
  i, iPag: Integer;
  wDia, wMes, wAno : word;
begin
  try
    if (pIdTempoServico = 0) then begin
      iPag := pTempoServicoInclusao;
    end else begin
      iPag := pTempoServicoAlteracao;
      cds.Close;
      cds.Data := WebTempoServico.SelecionaTempoServico(pIdTempoServico);
    end;

    sTitulo := TituloPagina( iPag );

    //VALIDAÇÃO
    sJavaScript :=
     ' function ConfirmaTempoServico( )                                                ' + CR +
     ' {                                                                               ' + CR +
     '   if ( document.frmLnkAlteracaoTempoServico.edtEmpresa.value == '''' )          ' + CR +
     '   {                                                                             ' + CR +
     '     alert(''O Nome da Empresa deve ser informado antes desta operação.'');      ' + CR +
     '     document.frmLnkAlteracaoTempoServico.edtEmpresa.focus();                    ' + CR +
     '     exit;                                                                      ' + CR +
     '   }                                                                             ' + CR +
     MontaValidacao( cDataInicial, 'frmLnkAlteracaoTempoServico.edtDataInicialDia', 'C' )       + CR +
     MontaValidacao( cDataInicial, 'frmLnkAlteracaoTempoServico.edtDataInicialMes', 'C' )       + CR +
     MontaValidacao( cDataInicial, 'frmLnkAlteracaoTempoServico.edtDataInicialAno', 'C' )       + CR +
     MontaValidacao( cDataFinal, 'frmLnkAlteracaoTempoServico.edtDataFinalDia', 'C' )       + CR +
     MontaValidacao( cDataFinal, 'frmLnkAlteracaoTempoServico.edtDataFinalMes', 'C' )       + CR +
     MontaValidacao( cDataFinal, 'frmLnkAlteracaoTempoServico.edtDataFinalAno', 'C' )       + CR +
     '   if (( document.frmLnkAlteracaoTempoServico.edtDataInicialDia.value == document.frmLnkAlteracaoTempoServico.edtDataFinalDia.value ) && ' +
     '       ( document.frmLnkAlteracaoTempoServico.edtDataInicialMes.value == document.frmLnkAlteracaoTempoServico.edtDataFinalMes.value ) && ' +
     '       ( document.frmLnkAlteracaoTempoServico.edtDataInicialAno.value == document.frmLnkAlteracaoTempoServico.edtDataFinalAno.value ))' + CR +
     '   {                                                                             ' + CR +
     '     alert(''Data inicial e data final não podem ser iguais.'');                 ' + CR +
     '     document.frmLnkAlteracaoTempoServico.edtDataInicialDia.focus();             ' + CR +
     '     exit;                                                                      ' + CR +
     '   }                                                                             ' + CR +
     '   if ((( document.frmLnkAlteracaoTempoServico.edtDataInicialAno.value > document.frmLnkAlteracaoTempoServico.edtDataFinalAno.value )) || ' +
     '       (( document.frmLnkAlteracaoTempoServico.edtDataInicialMes.value > document.frmLnkAlteracaoTempoServico.edtDataFinalMes.value ) && ' +
     '        ( document.frmLnkAlteracaoTempoServico.edtDataInicialAno.value >= document.frmLnkAlteracaoTempoServico.edtDataFinalAno.value )) || ' +
     '       (( document.frmLnkAlteracaoTempoServico.edtDataInicialDia.value > document.frmLnkAlteracaoTempoServico.edtDataFinalDia.value ) && ' +
     '        ( document.frmLnkAlteracaoTempoServico.edtDataInicialMes.value >= document.frmLnkAlteracaoTempoServico.edtDataFinalMes.value ) && ' +
     '        ( document.frmLnkAlteracaoTempoServico.edtDataInicialAno.value >= document.frmLnkAlteracaoTempoServico.edtDataFinalAno.value ))) ' + CR +
     '   {                                                                             ' + CR +
     '     alert(''Data inicial não pode ser maior que a data final.'');               ' + CR +
     '     document.frmLnkAlteracaoTempoServico.edtDataInicialDia.focus();             ' + CR +
     '     exit;                                                                      ' + CR +
     '   }                                                                             ' + CR +
     '   EnviaForm( document.frmLnkAlteracaoTempoServico );                            ' + CR +
     ' }                                                                               ' + CR;

    Result := Result +
     '<p class="DESCCAMPO">                                                            ' + CR +
     '  <form method="POST" name="frmLnkAlteracaoTempoServico"                         ' + CR +
     '   action="../<#nomearqapl>/SalvarTempoServico">                                 ' + CR +
     '    <table border="0" width="100%" cellpadding="0" cellspacing="0"               ' + CR +
     '     class="FORMULARIO">                                                         ' + CR +
     '      <tr>                                                                       ' + CR +
     '        <td width="75%">                                                         ' + CR +
     '          <table border="0" width="100%" cellpadding="0" cellspacing="0">        ' + CR +
     '            <tr class="CAMPOFORM">                                               ' + CR +
     '              <td class="DESCCAMPO" colspan="2">                                 ' + CR ;

    if TemAcessoCampo( sTipoUsuario, cEmpresa, sTituloCampo ) then begin
      Result := Result +
      sTituloCampo +
       '              <br>                                                             ' + CR +
       '              <input type="text" name="edtEmpresa" size="50"                   ' + CR +
       '               class="TEXT" maxlength="40"                                     ' + CR ;
      if pIdTempoServico <> 0 then begin
        Result := Result + ' value="' + cds.FieldByName('EMPRESA').AsString + '" ';
      end;
      Result := Result + '>' + CR +
       '            </td>                                                              ' + CR +
       '          </tr>                                                                ' + CR +
       '          <tr class="CAMPOFORM">                                               ' + CR +
       '            <td class="DESCCAMPO" colspan="2">                                 ' + CR ;
    end;

    //DATAINICIAL
    if TemAcessoCampo( sTipoUsuario, cDataInicial, sTituloCampo ) then 
    begin
      if ( pIdTempoServico <> 0 ) then
        DecodeDate( cds.FieldByName('DTINICIO').AsDateTime, wAno, wMes, wDia );

      //Dia
      Result := Result +
       sTituloCampo                                                                     +
       '                <br>                                                          ' + CR +
       '                <select size="1" name="edtDataInicialDia" class="TEXT">            ' + CR +
       '                  <option value="-1">[--]</option>                            ' + CR ;
      for i := 1 to 31 do
      begin
        Result := Result + '                  <option value="' + StrPadLeft( IntToStr(i), 2, '0' ) + '" ';
        if ( pIdTempoServico <> 0 ) and ( not cds.FieldByName('DTINICIO').IsNull ) then
          if ( i = wDia ) then Result := Result + ' selected';
        Result := Result + '>' + StrPadLeft( IntToStr(i), 2, '0' ) + '</option>' + CR;
      end;

      //Mês
      Result := Result +
       '                </select>                                                     ' + CR +
       '                <select size="1" name="edtDataInicialMes" class="TEXT">            ' + CR +
       '                  <option value="-1">[--]</option>                            ' + CR ;
      for i := 1 to 12 do
      begin
        Result := Result + '                  <option value="' + StrPadLeft( IntToStr(i), 2, '0' ) + '" ';
        if ( pIdTempoServico <> 0 ) and ( not cds.FieldByName('DTINICIO').IsNull ) then
          if ( i = wMes ) then Result := Result + ' selected';
        Result := Result + '>' + StrPadLeft( IntToStr(i), 2, '0' ) + '</option>' + CR;
      end;

      //Ano
      Result := Result +
       '                </select>                                                     ' + CR +
       '                <select size="1" name="edtDataInicialAno" class="TEXT">            ' + CR +
       '                  <option value="-1">[----]</option>                          ' + CR ;
      for i := 1900 to StrToInt(FormatDateTime('YYYY',Now)) do
      begin
        Result := Result + '                  <option value="' + IntToStr(i) + '" ';
        if ( pIdTempoServico <> 0 ) and ( not cds.FieldByName('DTINICIO').IsNull ) then
          if ( i = wAno ) then Result := Result + ' selected';
        Result := Result + '>' + IntToStr(i) + '</option>' + CR;
      end;
    end;

    {if TemAcessoCampo( sTipoUsuario, cDataInicial, sTituloCampo ) then begin
      Result := Result +
      sTituloCampo +
       '<br>                                                                           ' + CR +
       '<input type="text" name="edtDataInicial" size="15"                             ' + CR +
       'class="CAMPODATA" maxlength="10"                                               ' + CR;
      if pIdTempoServico <> 0 then begin
        Result := Result + ' value="' + cds.FieldByName('DTINICIO').AsString + '" ';
      end;

      Result := Result + 'OnKeyUp="MascaraData( this )" onBlur="ValidaCampoData( this )" >  ' + CR +
       '<a href="javascript:NewCal( ''edtDataInicial'',''ddmmyyyy'', false , 24 )">         ' + CR +
       '<img src="../Imagem/calendar.gif" border="0" style="vertical-align: middle"></a>    ' + CR +
       '</td>  ' + CR +
       '          </tr>                                                                ' + CR +
       '          <tr class="CAMPOFORM">                                               ' + CR;
    end;}

    Result := Result +
       '              </td>  ' + CR +
       '          </tr>                                                                ' + CR +
       '          <tr class="CAMPOFORM">                                               ' + CR + 
       '              <td class="DESCCAMPO" width="20%">                                 ' + CR ;

    //DATAFINAL
    if TemAcessoCampo( sTipoUsuario, cDataFinal, sTituloCampo ) then
    begin
      if ( pIdTempoServico <> 0 ) then
        DecodeDate( cds.FieldByName('DTFIM').AsDateTime, wAno, wMes, wDia );

      //Dia
      Result := Result +
       sTituloCampo                                                                     +
       '                <br>                                                          ' + CR +
       '                <select size="1" name="edtDataFinalDia" class="TEXT">            ' + CR +
       '                  <option value="-1">[--]</option>                            ' + CR ;
      for i := 1 to 31 do
      begin
        Result := Result + '                  <option value="' + StrPadLeft( IntToStr(i), 2, '0' ) + '" ';
        if ( pIdTempoServico <> 0 ) and ( not cds.FieldByName('DTFIM').IsNull ) then
          if ( i = wDia ) then Result := Result + ' selected';
        Result := Result + '>' + StrPadLeft( IntToStr(i), 2, '0' ) + '</option>' + CR;
      end;

      //Mês
      Result := Result +
       '                </select>                                                     ' + CR +
       '                <select size="1" name="edtDataFinalMes" class="TEXT">            ' + CR +
       '                  <option value="-1">[--]</option>                            ' + CR ;
      for i := 1 to 12 do
      begin
        Result := Result + '                  <option value="' + StrPadLeft( IntToStr(i), 2, '0' ) + '" ';
        if ( pIdTempoServico <> 0 ) and ( not cds.FieldByName('DTFIM').IsNull ) then
          if ( i = wMes ) then Result := Result + ' selected';
        Result := Result + '>' + StrPadLeft( IntToStr(i), 2, '0' ) + '</option>' + CR;
      end;

      //Ano
      Result := Result +
       '                </select>                                                     ' + CR +
       '                <select size="1" name="edtDataFinalAno" class="TEXT">            ' + CR +
       '                  <option value="-1">[----]</option>                          ' + CR ;
      for i := 1900 to StrToInt(FormatDateTime('YYYY',Now)) do
      begin
        Result := Result + '                  <option value="' + IntToStr(i) + '" ';
        if ( pIdTempoServico <> 0 ) and ( not cds.FieldByName('DTFIM').IsNull ) then
          if ( i = wAno ) then Result := Result + ' selected';
        Result := Result + '>' + IntToStr(i) + '</option>' + CR;
      end;
    end;   

    {if TemAcessoCampo( sTipoUsuario, cDataFinal, sTituloCampo ) then begin
      Result := Result +
      sTituloCampo +
       '<br>                                                                           ' + CR +
       '<input type="text" name="edtDataFinal" size="15"                               ' + CR +
       'class="CAMPODATA" maxlength="10"                                               ' + CR;
      if pIdTempoServico <> 0 then begin
        Result := Result + ' value="' + cds.FieldByName('DTFIM').AsString + '" ';
      end;

      Result := Result + 'OnKeyUp="MascaraData( this )" onBlur="ValidaCampoData( this )" >  ' + CR +
       '<a href="javascript:NewCal( ''edtDataFinal'',''ddmmyyyy'', false , 24 )">           ' + CR +
       '<img src="../Imagem/calendar.gif" border="0" style="vertical-align: middle"></a>    ' + CR +
       '</td>  '  + CR +
       '</tr>  ';
    end; }

    Result := Result +
     '                </td>  '  + CR +
     '               </tr>  '   + CR +
     '              </td>                                                              ' + CR +
     '            </tr>                                                                ' + CR +
     '          <input type="hidden" name="edtPais" value="1">                         ' + CR +
     '        </td>                                                                    ' + CR +
     '      </tr>                                                                      ' + CR +
     '      <tr>                                                                       ' + CR +
     '        <td colspan="2" align="center">                                          ' + CR +
     '          <br>                                                                   ' + CR +
     '          <a href="JavaScript:ConfirmaTempoServico();">                          ' + CR +
     '           <img src="../imagem/btnConfirmar.gif" name="btnConfirmar" border="0"  ' + CR +
     '            onMouseOver="btnConfirmar.src=''../imagem/btnConfirmar_s.gif''"      ' + CR +
     '            onMouseOut="btnConfirmar.src=''../imagem/btnConfirmar.gif''"></a>    ' + CR +
     '          <a href="JavaScript:EnviaForm( document.frmLnkConsultaTempoServico )"> ' + CR +
     '            <img src="../imagem/btnCancelar.gif" name="btnCancelar" border="0"   ' + CR +
     '            onMouseOver="btnCancelar.src=''../imagem/btnCancelar_s.gif''"        ' + CR +
     '            onMouseOut="btnCancelar.src=''../imagem/btnCancelar.gif''"></a>      ' + CR +
     '        </td>                                                                    ' + CR +
     '      </tr>                                                                      ' + CR +
     '    </table>                                                                     ' + CR +
     //BRUNO AZEVEDO SOL 141167 KINTANA 889112
     '    </table>                                                                     ' + CR +
     //BRUNO AZEVEDO SOL 141167 KINTANA 889112
     '    <input type="hidden" name="edtIdTempoServico" value="' + IntToStr( pIdTempoServico ) + '" > ' + CR +
     '    <#hiddenfields>                                                              ' + CR +
     '  </form>                                                                        ' + CR +
     '  <form method="POST" name="frmLnkConsultaTempoServico"                          ' + CR +
     '   action="../<#nomearqapl>/TempoServicoConsulta">                               ' + CR +
     '    <#hiddenfields>                                                              ' + CR +
     '  </form>                                                                        ' + CR +
     '</p>                                                                             ' + CR +
     '<SCRIPT language="JavaScript">                                                   ' + CR +
     '  document.frmLnkAlteracaoTempoServico.edtEmpresa.focus();                       ' + CR +
     '</script>                                                                        ' + CR ;

    Result := MontaPagina( iPag, Result );
  except
    On E : Exception do
    begin
      Result := TrataWebExcecoes( E );
    end;
  end;      
end;

function SalvarTempoServico(iIdPessoaLocal: Integer; Request: TWebRequest): String;
var
  iIdTempoServico: Integer;
  sOperacao: String;
  iPag: Integer;
  bOk: Boolean;
begin
  try
    iIdTempoServico := StrToIntDef(Request.ContentFields.Values['edtIdTempoServico'], 0);

    if (iIdTempoServico = 0) then begin
      sOperacao := 'I';
      iPag      := pTempoServicoConfInclusao;
    end else begin
      sOperacao := 'A';
      iPag      := pTempoServicoConfAlteracao;
    end;
    
    //GRAVAR O REGISTRO
    cds.Close;
    cds.Data := WebTempoServico.SelecionaTempoServico(iIdTempoServico);

    if cds.IsEmpty then begin
      cds.Insert;
    end else begin
      cds.Edit;
    end;

    AtualizaCampo(0,            cds.FieldByName('IDPESSOA'), iIdPessoaLocal);
    AtualizaCampo(cEmpresa,     cds.FieldByName('EMPRESA'),  Request.ContentFields.Values['edtEmpresa']);
    AtualizaCampo( cDataInicial,cds.FieldByName('DTINICIO'), StrToIntDef( Request.ContentFields.Values['edtDataInicialDia'], 0 ),
                                                             StrToIntDef( Request.ContentFields.Values['edtDataInicialMes'], 0 ),
                                                             StrToIntDef( Request.ContentFields.Values['edtDataInicialAno'], 0 ) );
    AtualizaCampo( cDataFinal,cds.FieldByName('DTFIM'), StrToIntDef( Request.ContentFields.Values['edtDataFinalDia'], 0 ),
                                                        StrToIntDef( Request.ContentFields.Values['edtDataFinalMes'], 0 ),
                                                        StrToIntDef( Request.ContentFields.Values['edtDataFinalAno'], 0 ) );
    //AtualizaCampo(cDataInicial, cds.FieldByName('DTINICIO'), Request.ContentFields.Values['edtDataInicial']);
    //AtualizaCampo(cDataFinal,   cds.FieldByName('DTFIM'),    Request.ContentFields.Values['edtDataFinal']);
    cds.Post;

    WebTempoServico.CdsTempoServico.Data := cds.Data;

    if (sOperacao = 'I') then begin
      iIdTempoServico := WebTempoServico.IncluirTempoServico;
      bOk := ( iIdTempoServico > 0 );
    end else begin
      bOk := WebTempoServico.AlterarTempoServico;
    end;

    if not (bOk) then begin
      raise Exception.Create(sMsgCtrl);
    end;

    if (sOperacao = 'I') then begin
      sTitulo := 'Tempo de serviço incluído com sucesso';
    end else begin
      sTitulo := 'Tempo de serviço alterado com sucesso';
    end;

    Result := Result +
     '  <table border="0" width="100%" cellpadding="0" cellspacing="0"          ' + CR +
     '         class="FORMULARIO">                                              ' + CR +
     DadosTempoServico(iIdPessoaLocal, iIdTempoServico)                           + CR +
     '  </table>                                                                ' + CR;

    Result := Result + Rodape();
    Result := MontaPagina( iPag, Result );
  except
    On E : Exception do
    begin
      Result := TrataWebExcecoes( E );
    end;
  end;
end;

function ExclusaoTempoServico(iIdPessoaLocal, iIdTempoServico: Integer ): String;
begin
  try
    sTitulo := TituloPagina(pTempoServicoExclusao);

    Result := Result +
     '  <table border="0" width="100%" cellpadding="0" cellspacing="0"                  ' + CR +
     '         class="FORMULARIO">                                                      ' + CR +
     DadosTempoServico(iIdPessoaLocal, iIdTempoServico)                                   + CR +
     '      <tr>                                                                        ' + CR +
     '        <td colspan="2" align="center">                                           ' + CR +
     '          <a href="JavaScript:EnviaForm( document.frmLnkExcluirTempoServico );">  ' + CR +
     '            <img src="../imagem/btnConfirmar.gif" name="btnConfirmar" border="0"  ' + CR +
     '            onMouseOver="btnConfirmar.src=''../imagem/btnConfirmar_s.gif''"       ' + CR +
     '            onMouseOut="btnConfirmar.src=''../imagem/btnConfirmar.gif''"></a>     ' + CR +

     '          <a href="JavaScript:EnviaForm( document.frmLnkConsultaTempoServico )">  ' + CR +
     '            <img src="../imagem/btnCancelar.gif" name="btnCancelar" border="0"    ' + CR +
     '            onMouseOver="btnCancelar.src=''../imagem/btnCancelar_s.gif''"         ' + CR +
     '            onMouseOut="btnCancelar.src=''../imagem/btnCancelar.gif''"></a>       ' + CR +
     '        </td>                                                                     ' + CR +
     '      </tr>                                                                       ' + CR +
     '  </table>                                                                        ' + CR +
     '  <form method="POST" name="frmLnkExcluirTempoServico"                            ' + CR +
     '   action="../<#nomearqapl>/ExcluirTempoServico">                                 ' + CR +
     '    <input type="hidden" name="edtIdTempoServico" value="' + IntToStr(iIdTempoServico) + '" > ' + CR +
     '    <#hiddenfields>                                                               ' + CR +
     '  </form>                                                                         ' + CR +
     '  <form method="POST" name="frmLnkConsultaTempoServico"                           ' + CR +
     '   action="../<#nomearqapl>/TempoServicoConsulta">                                ' + CR +
     '    <#hiddenfields>                                                               ' + CR +
     '  </form>                                                                         ' + CR ;

    Result := MontaPagina(pTempoServicoExclusao, Result);
  except
    On E : Exception do
    begin
      Result := TrataWebExcecoes( E );
    end;
  end;
end;

function ExcluirTempoServico(iIdPessoaLocal, iIdTempoServico: Integer): String;
begin
  try

    if not WebTempoServico.ExcluirTempoServico(iIdTempoServico) then begin
      raise Exception.Create(sMsgCtrl);
    end;

    sTitulo := 'Tempo de serviço excluído com sucesso';

    Result := Result + Rodape();
    Result := MontaPagina( pTempoServicoConfExclusao, Result );
  except
    On E : Exception do
    begin
      Result := TrataWebExcecoes( E );
    end;
  end;
end;

function DadosTempoServico(iIdPessoaLocal, iIdTempoServico: Integer): String;
var
  sTituloCampo: String;
begin
  cds.Close;
  cds.Data := WebTempoServico.SelecionaTempoServico(iIdTempoServico);

  if not cds.IsEmpty then begin
    Result :=
     '      <tr>                                                                  ' + CR +
     '        <td width="75%">                                                    ' + CR +
     '          <table border="0" width="100%" cellpadding="0" cellspacing="0">   ' + CR +
     '            <tr class="CAMPOFORM">                                          ' + CR +
     '              <td class="DESCCAMPO" colspan="2">                            ' + CR ;

    if TemAcessoCampo( sTipoUsuario, cEmpresa, sTituloCampo ) then
      Result := Result +
       sTituloCampo +
       '                <DIV class="CONTCAMPO">                                   ' + CR +
       StrToName( cds.FieldByName('EMPRESA').AsString ) +
       '                </DIV>                                                    ' + CR +
       '            </td>                                                         ' + CR +
       '          </tr>                                                           ' + CR +
       '          <tr class="CAMPOFORM">                                          ' + CR +
       '            <td class="DESCCAMPO" width="20%">                            ' + CR ;

    if TemAcessoCampo( sTipoUsuario, cDataInicial, sTituloCampo ) then
      Result := Result +
       sTituloCampo +
       '                <DIV class="CONTCAMPO">                                   ' + CR +
       cds.FieldByName('DTINICIO').AsString +
       '                </DIV>                                                    ' + CR +
       '            </td>                                                         ' + CR +
       '          </tr>                                                           ' + CR +
       '          <tr class="CAMPOFORM">                                          ' + CR +
       '            <td class="DESCCAMPO" width="40%">                            ' + CR ;

    if TemAcessoCampo( sTipoUsuario, cDataFinal, sTituloCampo ) then
      Result := Result +
       sTituloCampo +
       '                <DIV class="CONTCAMPO">                                   ' + CR +
       StrToName( cds.FieldByName('DTFIM').AsString ) +
       '                </DIV>                                                    ' + CR +
       '            </td>                                                         ' + CR +
       '          </tr>                                                           ' + CR +
       '        </table>                                                          ' + CR +
       '      </td>                                                               ' + CR +
       '    </tr>                                                                 ' + CR;
  end;
end;

function Rodape(): String;
begin
  Result := 
   '  <table border="0" width="100%" cellpadding="0" cellspacing="0">                 ' + CR +
   '    <tr>                                                                          ' + CR +
   '      <td class="LINK" width=50%>                                                 ' + CR +
   '        <a href="javascript:EnviaForm( document.frmLnkHome );">                   ' + CR +
   '          Voltar para Home                                                        ' + CR +
   '        </a>                                                                      ' + CR +
   '      </td>                                                                       ' + CR +
   '      <td class="LINK" width=50% align="right">                                   ' + CR +
   '        <a href="javascript:EnviaForm( document.frmLnkConsultaTempoServico );">   ' + CR +
   '          Voltar para Consulta de Tempo de Serviço                                ' + CR +
   '        </a>                                                                      ' + CR +
   '      </td>                                                                       ' + CR +
   '    </tr>                                                                         ' + CR +
   '  </table>                                                                        ' + CR +
   '  <form method="POST" name="frmLnkConsultaTempoServico"                           ' + CR +
   '   action="../<#nomearqapl>/TempoServicoConsulta">                                ' + CR +
   '    <#hiddenfields>                                                               ' + CR +
   '  </form>                                                                         ' + CR;
end;

end.
