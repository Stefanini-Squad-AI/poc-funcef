{
--------------------------------------------------------------------------------
Pendência   : SOL 164182 Kintana 1408644
Responsável : Fanuel Junior
Data        : 08/09/2011
Descrição   : Excluir frases nas telas "Manutenção de dependentes " e "Dados Cadastrais"
--------------------------------------------------------------------------------
Pendência   : SOL 144873 KINTANA 961354
Responsável : BRUNO AZEVEDO
Data        : 08/12/2010
Descrição   : Ajustes para atender as necessidades do cliente.
--------------------------------------------------------------------------------
Pendência   : SOL 141337 KINTANA 894031
Responsável : Ádler Souza
Data        : 06/10/2010
Descrição   : Incluir mensagem na tela.
--------------------------------------------------------------------------------
Pendência   : SOL 141367 KINTANA 894033
Responsável : BRUNO AZEVEDO
Data        : 31/08/2010
Descrição   : Implementação da verificação de dependentes válidos.
--------------------------------------------------------------------------------
}
unit uWebManutDependentes;

interface

uses SysUtils, Mask, DModAutoAtendimento, uConstPaginasCampos, httpapp, JCLStrings,
     JCLSysUtils, uMidasUtil, uCtrlFuncoesAA, uCmFileUtils;

//Monta a página de Manutenção de Dependentes
function PaginaManutDependentes( iIdPessoaLocal : integer ) : String;

//Monta a página de Alteração de Dependentes
function PaginaAlteracaoDependente( iIdPessoaLocal, iIdDependente : integer; bIgnoraCancelados : boolean ) : String;

//Monta a página de Gravação de Dependentes
function PaginaSalvarDependente( iIdPessoaLocal : integer; Request: TWebRequest ) : String;

//Exibe os dados de um determinado dependente
function DadosDependente( iIdPessoaLocal, iIdDependente : integer ) : String;

//Monta a página de Exclusão de Dependentes
function PaginaExclusaoDependente( iIdPessoaLocal, iIdDependente : integer ) : String;

//Monta a página que exclui efetivamente o Dependente
function PaginaExcluirDependente( iIdPessoaLocal, iIdDependente : integer ) : String;

//Monta a página que cancela efetivamente o Dependente
function PaginaCancelarDependente( iIdPessoaLocal, iIdDependente : integer ) : String;

//Monta o rodapé da confirmação de dependente.
function RodapeConfirmaDependente : String;

//Monta a página de cancelamento de Dependentes
function PaginaCancelamentoDependente( iIdPessoaLocal, iIdDependente : integer ) : String;

//Restaura um dependente
function PaginaRestauraDependente( iIdPessoaLocal, iIdDependente : integer ) : String;

implementation

//Monta a página de Manutenção de Dependentes
function PaginaManutDependentes( iIdPessoaLocal : integer ) : String;
var
  sNome,
  sNomePai,
  sNomeMae,
  sParentesco,
  sSexo,
  sGrauInstr,
  sEstadoCivil,
  sDataNasc,
  sIsentoIRRF,
  sIRRF, 
  sSalarioFamilia,
  sDependenteLegal,
  sPossuiMolestiaGrave,
  sDepIR,               //BRUNO AZEVEDO SOL 124179 KINTANA 651468
  sDepInvalido,         //BRUNO AZEVEDO SOL 124179 KINTANA 651468
  sDesignado : string;

  //Pendência 23274 - 28/12/2007
  sDataMorte,
  sNumDocumento : String;
  //Fim Pendência 23274

  sAux : string;
  sTituloCampo : string;

  iSeqLegenda : integer;  

  procedure IncluiLink( var sLink : String );
  begin
    sLink := '<a href="JavaScript:document.frmLnkAlteracaoDependente.edtIdDependente.value=''' +
         cds.FieldByName('IDPESSOA').AsString + '''; EnviaForm( document.frmLnkAlteracaoDependente );">' +
         sLink + '</a>'
  end;
begin

  try

    sTitulo := TituloPagina( pManutDependentes );

    cds.Close;

    cds.Data := Dependente.SelecionaDependentes( iIdPessoaLocal );

    cdsHTMLColumns.Close;
    cdsHTMLColumns.CreateDataSet;

    IncluiColuna( cAltDepNome,                20, 'left' );
    IncluiColuna( cAltDepNomePai,             11, 'left' );
    IncluiColuna( cAltDepNomeMae,             11, 'left' );
    IncluiColuna( cAltDepNumDocumento,         9, 'left' ); //Pendência 23274 - 28/12/2007
    IncluiColuna( cAltDepParentesco,          13, 'left' );
    IncluiColuna( cAltDepInvalido,             3, 'left' ); //BRUNO AZEVEDO SOL KINTANA
    IncluiColuna( cAltDepSexo,                 3, 'left' );
    IncluiColuna( cAltDepGrauInstr,            9, 'left' );
    IncluiColuna( cAltDepEstadoCivil,          7, 'left' );
    IncluiColuna( cAltDepDataNasc,             7, 'left' );
    IncluiColuna( cAltDepDataMorte,            7, 'left' ); //Pendência 23274 - 28/12/2007

    iSeqLegenda := 1;
    if TemAcessoCampo( sTipoUsuario, cAltDepIsentoIRRF, sAux ) then
      IncluiColuna( cAltDepIsentoIRRF,           2, 'center', '(' + IntToStr( IncAfter( iSeqLegenda ) ) + ')' );
    if TemAcessoCampo( sTipoUsuario, cAltDepIRRF, sAux ) then
      IncluiColuna( cAltDepIRRF,                 2, 'center', '(' + IntToStr( IncAfter( iSeqLegenda ) ) + ')' );
    if TemAcessoCampo( sTipoUsuario, cAltDepSalarioFamilia, sAux ) then
      IncluiColuna( cAltDepSalarioFamilia,       2, 'center', '(' + IntToStr( IncAfter( iSeqLegenda ) ) + ')' );
    if TemAcessoCampo( sTipoUsuario, cAltDepDependenteLegal, sAux ) then
      IncluiColuna( cAltDepDependenteLegal,      2, 'center', '(' + IntToStr( IncAfter( iSeqLegenda ) ) + ')' );
    if TemAcessoCampo( sTipoUsuario, cAltDepPossuiMolestiaGrave, sAux ) then
      IncluiColuna( cAltDepPossuiMolestiaGrave,  2, 'center', '(' + IntToStr( IncAfter( iSeqLegenda ) ) + ')' );
    if TemAcessoCampo( sTipoUsuario, cAltDepDesignado, sAux ) then
      IncluiColuna( cAltDepDesignado,            2, 'center', '(' + IntToStr( IncAfter( iSeqLegenda ) ) + ')' );
    //BRUNO AZEVEDO SOL 124179 KINTANA 651468
    if TemAcessoCampo( sTipoUsuario, cAltDepIR, sAux ) then
      IncluiColuna( cAltDepIR,             2, 'center', '(' + IntToStr( IncAfter( iSeqLegenda ) ) + ')' );
    //BRUNO AZEVEDO SOL 144873 KINTANA 961354
    //if TemAcessoCampo( sTipoUsuario, cAltDepInvalido, sAux ) then
    //  IncluiColuna( cAltDepInvalido,       2, 'center', '(' + IntToStr( IncAfter( iSeqLegenda ) ) + ')' );
    ///BRUNO AZEVEDO SOL 144873 KINTANA 961354
    //BRUNO AZEVEDO SOL 124179 KINTANA 651468

    if TemAcessoPagina( sTipoUsuario, pDepAlteracao, sAux ) then
      IncluiColuna( -1,  7, 'center', ' ' );

    if TemAcessoPagina( sTipoUsuario, pDepExclusao, sAux ) then
      IncluiColuna( -2,  7, 'center', ' ' );

    if TemAcessoPagina( sTipoUsuario, pDepCancelamento, sAux ) then
      IncluiColuna( -3,  2, 'center', ' ' );

    if TemAcessoPagina( sTipoUsuario, pDepInclusao, sAux ) then

      //BRUNO AZEVEDO SOL 124179 KINTANA 651468
      Result := Result + '<a href="JavaScript:document.frmLnkAlteracaoDependente.edtIdDependente.value='''';' +
       'EnviaForm( document.frmLnkAlteracaoDependente );">' +
       '<img name="imgNovo" src="../Imagem/inclusao.gif" border="0" style="float: right"   ' +
       ' onMouseOver="imgNovo.src=''../imagem/inclusao.gif''" '                            +
       ' onMouseOut="imgNovo.src=''../imagem/inclusao.gif''"> </a>' + CR ;
      //BRUNO AZEVEDO SOL 124179 KINTANA 651468
      
    Result := Result + HTMLTableHeader;

    cds.First;
    while not cds.Eof do
    begin

      sNome                 := StrToName( trim( cds.FieldByName('NOME').AsString ) );
      sNomePai              := StrToName( trim( cds.FieldByName('NOMEPAI').AsString ) );
      sNomeMae              := StrToName( trim( cds.FieldByName('NOMEMAE').AsString ) );
      sParentesco           := StrToName( trim( cds.FieldByName('DESCRICAO').AsString ) );
      sSexo                 := trim( cds.FieldByName('SEXO').AsString );
      sGrauInstr            := StrToName( trim( cds.FieldByName('GRAUINSTR').AsString ) );
      sEstadoCivil          := StrToName( trim( cds.FieldByName('ESTADOCIVIL').AsString ) );
      sDataNasc             := FormataDataHora( 'dd/mm/yyyy', cds.FieldByName('DATANASC').AsString );
      sIsentoIRRF           := Iff( cds.FieldByName('FLGISENTOIRRF').AsInteger    = 1, 'S', 'N' );
      sIRRF                 := Iff( cds.FieldByName('FLGCONTAIMPOSTOR').AsInteger = 1, 'S', 'N' );
      sSalarioFamilia       := Iff( cds.FieldByName('FLGCONTASALARIOF').AsInteger = 1, 'S', 'N' );
      sDependenteLegal      := Iff( cds.FieldByName('FLGDEPLEGAL').AsInteger      = 1, 'S', 'N' );
      sPossuiMolestiaGrave  := Iff( cds.FieldByName('FLGMOLESTIAGRAVE').AsInteger = 1, 'S', 'N' );
      sDesignado            := Iff( cds.FieldByName('FLGDESIGNADO').AsInteger     = 1, 'S', 'N' );

      //BRUNO AZEVEDO SOL 124179 KINTANA 651468
      sDepIR          := Iff( cds.FieldByName('FLGDEPIR').AsInteger = 1, 'S', 'N' );
      sDepInvalido    := Iff( cds.FieldByName('FLGDEPINVALIDO').AsInteger     = 1, 'Sim', 'Não' );
      //BRUNO AZEVEDO SOL 124179 KINTANA 651468
      
      //Pendência 23274 - 28/12/2007
      sDataMorte            := FormataDataHora( 'dd/mm/yy', cds.FieldByName('DATAMORTE').AsString );
      if trim( cds.FieldByName('NUMDOCUMENTO').AsString ) <> '' then begin
        sNumDocumento       := FormatMaskText( MaskField(cds.FieldByName('MASCARA').AsString), cds.FieldByName('NUMDOCUMENTO').AsString);
      end else begin
        sNumDocumento       := '';
      end;

      if TemAcessoPagina( sTipoUsuario, pDepAlteracao, sAux ) then
      begin
        IncluiLink( sNome );
        IncluiLink( sNomePai );
        IncluiLink( sNomeMae );
        IncluiLink( sNumDocumento ); //Pendência 23274 - 28/12/2007
        IncluiLink( sParentesco );
        IncluiLink( sSexo );
        IncluiLink( sGrauInstr );
        IncluiLink( sEstadoCivil );
        IncluiLink( sDataNasc );
        IncluiLink( sDataMorte ); //Pendência 23274 - 28/12/2007
        IncluiLink( sIsentoIRRF );
        IncluiLink( sIRRF );
        IncluiLink( sSalarioFamilia );
        IncluiLink( sDependenteLegal );
        IncluiLink( sPossuiMolestiaGrave );
        IncluiLink( sDesignado );
        IncluiLink( sDepIR );       //BRUNO AZEVEDO SOL 124179 KINTANA 651468
        IncluiLink( sDepInvalido ); //BRUNO AZEVEDO SOL 124179 KINTANA 651468
      end;

      PreencheColuna( cAltDepNome,                sNome                );
      PreencheColuna( cAltDepNomePai,             sNomePai             );
      PreencheColuna( cAltDepNomeMae,             sNomeMae             );
      //Pendência 23274 - 28/12/2007
      PreencheColuna( cAltDepNumDocumento,        sNumDocumento        );
      PreencheColuna( cAltDepParentesco,          sParentesco          );
      PreencheColuna( cAltDepSexo,                sSexo                );
      PreencheColuna( cAltDepGrauInstr,           sGrauInstr           );
      PreencheColuna( cAltDepEstadoCivil,         sEstadoCivil         );
      PreencheColuna( cAltDepDataNasc,            sDataNasc            );
      PreencheColuna( cAltDepDataMorte,           sDataMorte           );
      //Fim Pendência 23274
      PreencheColuna( cAltDepIsentoIRRF,          sIsentoIRRF          );
      PreencheColuna( cAltDepIRRF,                sIRRF                );
      PreencheColuna( cAltDepSalarioFamilia,      sSalarioFamilia      );
      PreencheColuna( cAltDepDependenteLegal,     sDependenteLegal     );
      PreencheColuna( cAltDepPossuiMolestiaGrave, sPossuiMolestiaGrave );
      PreencheColuna( cAltDepDesignado,           sDesignado           );
      PreencheColuna( cAltDepIR,                  sDepIR               ); //BRUNO AZEVEDO SOL 124179 KINTANA 651468
      PreencheColuna( cAltDepInvalido,           sDepInvalido          ); //BRUNO AZEVEDO SOL 124179 KINTANA 651468

      if TemAcessoPagina( sTipoUsuario, pDepAlteracao, sAux ) then
        PreencheColuna( -1,
         '<a href="JavaScript:document.frmLnkAlteracaoDependente.edtIdDependente.value=''' +
         cds.FieldByName('IDPESSOA').AsString + '''; EnviaForm( document.frmLnkAlteracaoDependente );"> ' + CR +
         //BRUNO AZEVEDO SOL 124179 KINTANA 651468
         '<img name="imgAlterar' + cds.FieldByName('IDPESSOA').AsString + '" src="../Imagem/alteracao.gif" border="0" style="float: right" ' +
         ' onMouseOver="imgAlterar' + cds.FieldByName('IDPESSOA').AsString + '.src=''../imagem/alteracao.gif''" ' +
         ' onMouseOut="imgAlterar' + cds.FieldByName('IDPESSOA').AsString + '.src=''../imagem/alteracao.gif''"></a>' + CR );
         //BRUNO AZEVEDO SOL 124179 KINTANA 651468

      if TemAcessoPagina( sTipoUsuario, pDepExclusao, sAux ) then
        PreencheColuna( -2,
         '<a href="JavaScript:document.frmLnkExclusaoDependente.edtIdDependente.value=''' +
         cds.FieldByName('IDPESSOA').AsString + '''; EnviaForm( document.frmLnkExclusaoDependente );"> ' + CR +
         //BRUNO AZEVEDO SOL 124179 KINTANA 651468
         '<img name="imgExcluir' + cds.FieldByName('IDPESSOA').AsString + '" src="../Imagem/exclusao.gif" border="0"  style="float: right" ' +
         ' onMouseOver="imgExcluir' + cds.FieldByName('IDPESSOA').AsString + '.src=''../imagem/exclusao.gif''" ' +
         ' onMouseOut="imgExcluir' + cds.FieldByName('IDPESSOA').AsString + '.src=''../imagem/exclusao.gif''"></a>' );
         //BRUNO AZEVEDO SOL 124179 KINTANA 651468
         
      if TemAcessoPagina( sTipoUsuario, pDepCancelamento, sAux ) then
        PreencheColuna( -3,
         '<a href="JavaScript:document.frmLnkCancelamentoDependente.edtIdDependente.value=''' +
         cds.FieldByName('IDPESSOA').AsString + '''; EnviaForm( document.frmLnkCancelamentoDependente );"> ' + CR +
         '<img name="imgCancelar' + cds.FieldByName('IDPESSOA').AsString + '" src="../Imagem/excreg.gif" border="0"  style="float: right" ' +
         ' onMouseOver="imgCancelar' + cds.FieldByName('IDPESSOA').AsString + '.src=''../imagem/excreg_s.gif''" ' +
         ' onMouseOut="imgCancelar' + cds.FieldByName('IDPESSOA').AsString + '.src=''../imagem/excreg.gif''"></a>' );

      Result := Result + HTMLTableRow;
      cds.Next;
    end;

    Result := Result + HTMLTableFooter;

    if  TemAcessoCampo( sTipoUsuario, cAltDepIsentoIRRF,          sTituloCampo )
     or TemAcessoCampo( sTipoUsuario, cAltDepIRRF,                sTituloCampo )
     or TemAcessoCampo( sTipoUsuario, cAltDepSalarioFamilia,      sTituloCampo )
     or TemAcessoCampo( sTipoUsuario, cAltDepDependenteLegal,     sTituloCampo )
     or TemAcessoCampo( sTipoUsuario, cAltDepPossuiMolestiaGrave, sTituloCampo )
     //BRUNO AZEVEDO SOL 124179 KINTANA 651468
     or TemAcessoCampo( sTipoUsuario, cAltDepIR,                  sTituloCampo )
     //or TemAcessoCampo( sTipoUsuario, cAltDepInvalido,            sTituloCampo )
     //BRUNO AZEVEDO SOL 124179 KINTANA 651468
     or TemAcessoCampo( sTipoUsuario, cAltDepDesignado,           sTituloCampo ) then
    begin
      iSeqLegenda := 1;

      Result := Result +
        '<p align="right">                                    ' + CR +
        '<table class="LEGENDA" width="250">                  ' + CR +
        '  <tr>                                               ' + CR +
        '    <td class="LEGCAB" COLSPAN="2">                  ' + CR +
        '      Legenda - Dependentes (*)                      ' + CR + // Ádler Souza - SOL 141337 KTN 894031
        '    </td>                                            ' + CR +
        '  </tr>                                              ' + CR ;

      if TemAcessoCampo( sTipoUsuario, cAltDepIsentoIRRF, sTituloCampo ) then
        Result := Result +
          '  <tr>                                               ' + CR +
          '    <td class="LEGCONT" width="15%" align="center">  ' + CR +
          '      (' + IntToStr( IncAfter( iSeqLegenda ) ) + ')  ' + CR +
          '    </td>                                            ' + CR +
          '    <td class="LEGCONT" align="left">                ' + CR +
          sTituloCampo                                            + CR +
          '    </td>                                            ' + CR +
          '  </tr>                                              ' + CR ;

      if TemAcessoCampo( sTipoUsuario, cAltDepIRRF, sTituloCampo ) then
        Result := Result +
          '  <tr>                                               ' + CR +
          '    <td class="LEGCONT" width="15%" align="center">  ' + CR +
          '      (' + IntToStr( IncAfter( iSeqLegenda ) ) + ')  ' + CR +
          '    </td>                                            ' + CR +
          '    <td class="LEGCONT" align="left">                ' + CR +
          sTituloCampo                                            + CR +
          '    </td>                                            ' + CR +
          '  </tr>                                              ' + CR ;

      if TemAcessoCampo( sTipoUsuario, cAltDepSalarioFamilia, sTituloCampo ) then
        Result := Result +
          '  <tr>                                               ' + CR +
          '    <td class="LEGCONT" width="15%" align="center">  ' + CR +
          '      (' + IntToStr( IncAfter( iSeqLegenda ) ) + ')  ' + CR +
          '    </td>                                            ' + CR +
          '    <td class="LEGCONT" align="left">                ' + CR +
          sTituloCampo                                            + CR +
          '    </td>                                            ' + CR +
          '  </tr>                                              ' + CR ;

      if TemAcessoCampo( sTipoUsuario, cAltDepDependenteLegal, sTituloCampo ) then
        Result := Result +
          '  <tr>                                               ' + CR +
          '    <td class="LEGCONT" width="15%" align="center">  ' + CR +
          '      (' + IntToStr( IncAfter( iSeqLegenda ) ) + ')  ' + CR +
          '    </td>                                            ' + CR +
          '    <td class="LEGCONT" align="left">                ' + CR +
          sTituloCampo                                            + CR +
          '    </td>                                            ' + CR +
          '  </tr>                                              ' + CR ;

      if TemAcessoCampo( sTipoUsuario, cAltDepPossuiMolestiaGrave, sTituloCampo ) then
        Result := Result +
          '  <tr>                                               ' + CR +
          '    <td class="LEGCONT" width="15%" align="center">  ' + CR +
          '      (' + IntToStr( IncAfter( iSeqLegenda ) ) + ')  ' + CR +
          '    </td>                                            ' + CR +
          '    <td class="LEGCONT" align="left">                ' + CR +
          sTituloCampo                                            + CR +
          '    </td>                                            ' + CR +
          '  </tr>                                              ' + CR ;

      if TemAcessoCampo( sTipoUsuario, cAltDepDesignado, sTituloCampo ) then
        Result := Result +
          '  <tr>                                               ' + CR +
          '    <td class="LEGCONT" width="15%" align="center">  ' + CR +
          '      (' + IntToStr( IncAfter( iSeqLegenda ) ) + ')  ' + CR +
          '    </td>                                            ' + CR +
          '    <td class="LEGCONT" align="left">                ' + CR +
          sTituloCampo                                            + CR +
          '    </td>                                            ' + CR +
          '  </tr>                                              ' + CR ;

      //BRUNO AZEVEDO SOL 124179 KINTANA 651468
      if TemAcessoCampo( sTipoUsuario, cAltDepIR, sTituloCampo ) then
        Result := Result +
          '  <tr>                                               ' + CR +
          '    <td class="LEGCONT" width="15%" align="center">  ' + CR +
          '      (' + IntToStr( IncAfter( iSeqLegenda ) ) + ')  ' + CR +
          '    </td>                                            ' + CR +
          '    <td class="LEGCONT" align="left">                ' + CR +
          sTituloCampo + ' (**)' +                                  CR +
          '    </td>                                            ' + CR +
          '  </tr>                                              ' + CR ;

      //BRUNO AZEVEDO SOL 144873 KINTANA 961354
      {if TemAcessoCampo( sTipoUsuario, cAltDepInvalido, sTituloCampo ) then
        Result := Result +
          '  <tr>                                               ' + CR +
          '    <td class="LEGCONT" width="15%" align="center">  ' + CR +
          '      (' + IntToStr( IncAfter( iSeqLegenda ) ) + ')  ' + CR +
          '    </td>                                            ' + CR +
          '    <td class="LEGCONT" align="left">                ' + CR +
          sTituloCampo                                            + CR +
          '    </td>                                            ' + CR +
          '  </tr>                                              ' + CR +
          '</table>                                             ' + CR +
          '</p>                                                 ' ;    }
      //BRUNO AZEVEDO SOL 144873 KINTANA 961354
      //BRUNO AZEVEDO SOL 124179 KINTANA 651468

      Result := Result +
        '</table>                                               ' + CR +
        '</p>                                                   ' ;
    end;

    // Ádler Souza - SOL 141337 KTN 894031
    // Fanuel Junior SOL164182 Kintana1408644 
    //Result := Result +
    //          '<p class="CORPO" align="left"> (*) Essas informações são válidas somente para aposentados e pensionistas. </p> '  +
    //          '<BR>' +
    //         CR;
    // Fim - Ádler Souza - SOL 141337 KTN 894031

    //BRUNO AZEVEDO SOL 144873 KINTANA 961354
    if TemAcessoCampo( sTipoUsuario, cAltDepIR, sAux ) then
    Result := Result +
              '<p class="CORPO" align="left"> (**) Os dependentes para IRRF a partir de 22 anos e menores de 25 anos, apenas serão considerados para fins de Imposto de Renda, ' +
              'após o recebimento pela FUNCEF da declaração de escolaridade de instituição de ensino superior ou escola técnica. </p> '  +
              '<BR>' +
              CR;
    //BRUNO AZEVEDO SOL 144873 KINTANA 961354
    
    Result := Result +
     '  <form method="POST" name="frmLnkAlteracaoDependente"               ' + CR +
     '   action="../<#nomearqapl>/AlteracaoDependente">        ' + CR +
     '    <input type="hidden" name="edtIdDependente">                     ' + CR +
     '    <input type="hidden" name="edtIgnoraCancelamento" value="1">     ' + CR +
     '    <#hiddenfields>                                                  ' + CR +
     '  </form>                                                            ' + CR +
     '  <form method="POST" name="frmLnkExclusaoDependente"                ' + CR +
     '   action="../<#nomearqapl>/ExclusaoDependente">         ' + CR +
     '    <input type="hidden" name="edtIdDependente">                     ' + CR +
     '    <#hiddenfields>                                                  ' + CR +
     '  </form>                                                            ' + CR +
     '  <form method="POST" name="frmLnkCancelamentoDependente"            ' + CR +
     '   action="../<#nomearqapl>/CancelamentoDependente">                 ' + CR +
     '    <input type="hidden" name="edtIdDependente">                     ' + CR +
     '    <#hiddenfields>                                                  ' + CR +
     '  </form>                                                            ' + CR ;


    cdsHTMLColumns.Close;

    cds.Close;

    Result := MontaPagina( pManutDependentes, Result );

  except
    On E : Exception do
    begin
      Result := TrataWebExcecoes( E );
    end;
  end;

end; {PaginaManutDependentes}


//Monta a página de Alteração de Dependentes
function PaginaAlteracaoDependente( iIdPessoaLocal, iIdDependente : integer; bIgnoraCancelados : boolean ) : String;
var
  sTituloCampo, sDepen : String;
  i, iPag : integer;
  wDia, wMes, wAno : word;
  iIdSitDependente: Integer;

  function SelEstCiv( sEC : String ) : string;
  begin
    if ( iIdDependente <> 0 ) then
      if cds.FieldByName('ESTCIVIL').AsString = sEC then Result := ' selected';
  end;

begin
  try

    //BRUNO AZEVEDO SOL 141367 KINTANA 894033
    iIdSitDependente := 0;

    if iIdDependente = 0 then
    begin
      iPag := pDepInclusao;

      if not bIgnoraCancelados then
      begin
        cds.Data := Dependente.DependentesCancelados( iIdPessoaLocal );
        if not cds.IsEmpty then
        begin
          Result :=
           '<CENTER>                                                                                                   ' + CR +
           '  <TABLE class="FORMULARIO" width="500px">                                                                 ' + CR +
           '    <TR>                                                                                                   ' + CR +
           '      <TD class="DESCCAMPO" COLSPAN="2">                                                                   ' + CR +
           '        <DIV class="BOXFORM" width="100%" align="center">                                                  ' + CR +
           '          <b>Recuperação de dependentes cancelados</b>                                                     ' + CR +
           '        </DIV><BR>                                                                                         ' + CR +
           '        Foram encontrados dependentes cancelados para esta matrícula. <BR>                                 ' + CR +
           '        Abaixo, encontra-se uma lista com o nome e a data de cancelamento de cada um. <BR>                 ' + CR +
           '        Caso deseje reativar algum dependente, selecione-o e clique em <b>[OK]</b>. <BR>                   ' + CR +
           '        Se desejar incluir um dependente novo, clique em <b>[Cancelar]</b>. <BR><BR>                       ' + CR +
           '        <CENTER>                                                                                           ' + CR +
           '        <select size="1" name="cmbIdDependente" class="TEXT" style="font-family=Courier New;">             ' + CR ;

          while not cds.Eof do
          begin
            Result := Result + '          <option value="' + cds.FieldByName('IDPESSOA').AsString + '" >' +
              cds.FieldByName('NOME').AsString + StrRepeat( '&nbsp;', 60 - length( cds.FieldByName('NOME').AsString ) ) +
              FormatDateTime( 'dd/mm/yyyy', cds.FieldByName('DATACANCELA').AsDateTime ) + '</option>' + CR;
            cds.Next;
          end;
          cds.Close;

        Result := Result +
           '          </select>                                                                                        ' + CR +
           '        </CENTER>                                                                                          ' + CR +
           '      </TD>                                                                                                ' + CR +
           '    </TR>                                                                                                  ' + CR +
           '    <tr>                                                                                                   ' + CR +
           '      <TD COLSPAN="2" ALIGN="CENTER">                                                                      ' + CR +
           '        <a href="JavaScript:document.frmLnkRestauraDependente.edtIdDependente.value=cmbIdDependente.value;'             +
           'EnviaForm( document.frmLnkRestauraDependente )">                                                           ' + CR +
           '         <img src="../imagem/btnConfirmar.gif" name="btnConfirmar" border="0"                              ' + CR +
           '          onMouseOver="btnConfirmar.src=''../imagem/btnConfirmar_s.gif''"                                  ' + CR +
           '          onMouseOut="btnConfirmar.src=''../imagem/btnConfirmar.gif''"></a>                                ' + CR +
           '        <a href="JavaScript:EnviaForm( document.frmLnkAlteracaoDependente )">                              ' + CR +
           '          <img src="../imagem/btnCancelar.gif" name="btnCancelar" border="0"                               ' + CR +
           '          onMouseOver="btnCancelar.src=''../imagem/btnCancelar_s.gif''"                                    ' + CR +
           '          onMouseOut="btnCancelar.src=''../imagem/btnCancelar.gif''"></a>                                  ' + CR +
           '      </TD>                                                                                                ' + CR +
           '    </TR>                                                                                                  ' + CR +
           '  </TABLE>                                                                                                 ' + CR +
           '  <form method="POST" name="frmLnkAlteracaoDependente"                                                     ' + CR +
           '   action="../<#nomearqapl>/AlteracaoDependente">                                                          ' + CR +
           '    <input type="hidden" name="edtIdDependente">                                                           ' + CR +
           '    <input type="hidden" name="edtIgnoraCancelamento" value="1">                                           ' + CR +
           '    <#hiddenfields>                                                                                        ' + CR +
           '  </form>                                                                                                  ' + CR +
           '  <form method="POST" name="frmLnkRestauraDependente"                                                      ' + CR +
           '   action="../<#nomearqapl>/RestaurarDependente">                                                          ' + CR +
           '    <input type="hidden" name="edtIdDependente">                                                           ' + CR +
           '    <#hiddenfields>                                                                                        ' + CR +
           '  </form>                                                                                                  ' + CR +
           '</CENTER><BR>                                                                                              ' ;

          Result := MontaPagina( iPag, Result );

          exit;
        end;
        
      end;

    end
    else
    begin
      iPag := pDepAlteracao;
      cds.Close;
      cds.Data := Dependente.SelecionaDependente( iIdPessoaLocal, iIdDependente );

      //BRUNO AZEVEDO SOL 141367 KINTANA 894033
      //iIdSitDependente := StrToInt(cds.FieldByName('IDSITDEPENDENTE').AsString);
    end;

    sTitulo := TituloPagina( iPag );

    //Valida e confirma o preenchimento dos campos
    sJavaScript :=
     ' function ConfirmaDependente( )                                            ' + CR +
     ' {                                                                         ' + CR +
     MontaValidacao( cAltDepNome, 'frmLnkDependente.edtNome', 'T' )                + CR +
     MontaValidacao( cAltDepParentesco, 'frmLnkDependente.cmbIdDependencia', 'C' ) + CR +
     //BRUNO AZEVEDO SOL 124179 KINTANA 651468
     //MontaValidacao( cAltDepNumDocumento, 'frmLnkDependente.edtNumDocumento', 'T' )+ CR +
     MontaValidacao( cAltDepDataNasc, 'frmLnkDependente.cmbDtNascDia', 'C' )       + CR +
     MontaValidacao( cAltDepDataNasc, 'frmLnkDependente.cmbDtNascMes', 'C' )       + CR +
     MontaValidacao( cAltDepDataNasc, 'frmLnkDependente.cmbDtNascAno', 'C' )       + CR +
     MontaValidacao( cAltDepEstadoCivil, 'frmLnkDependente.cmbIdEstCivil', 'C' )   + CR;
     //BRUNO AZEVEDO SOL 124179 KINTANA 651468

     //BRUNO AZEVEDO SOL 144873 KINTANA 961354
     sJavaScript := sJavaScript +
     'marcado = -1 '+ CR +
     'for (i=0; i<document.frmLnkDependente.rbDepInvalido.length; i++) { ' + CR +
     ' if (document.frmLnkDependente.rbDepInvalido[i].checked) ' + CR +
     ' {                                                                   ' + CR +
     '   marcado = i ' + CR +
     ' } ' + CR +
     '} ' + CR +
     'if (marcado == -1) {  ' + CR +
	   '   alert(''O campo dependente inválido deve estar preenchido.''); ' + CR +
     '   exit;                                                             ' + CR +
     ' } ';
     //BRUNO AZEVEDO SOL 144873 KINTANA 961354

     
     sJavaScript := sJavaScript +
     'marcado = -1 '+ CR +
     'for (i=0; i<document.frmLnkDependente.rbSexo.length; i++) { ' + CR +
     ' if (document.frmLnkDependente.rbSexo[i].checked) ' + CR +
     ' {                                                                   ' + CR +
     '   marcado = i ' + CR +
     ' } ' + CR +
     '} ' + CR +
     'if (marcado == -1) {  ' + CR +
	   '   alert(''O campo sexo deve estar preenchido.''); ' + CR +
     '   exit;                                                             ' + CR +
     ' } ';



    if not bFlgDemo then
      sJavaScript := sJavaScript +
       '   EnviaForm( document.frmLnkDependente );                               }     ' + CR
    else
      sJavaScript := sJavaScript +
       '   alert(''Funcionalidade desabilitada para demonstração.'');            } ' + CR ;

    Result := Result +
     '<p class="DESCCAMPO">                                                           ' + CR +
     '  <form method="POST" name="frmLnkDependente"                                   ' + CR +
     '   action="../<#nomearqapl>/SalvarDependente">                      ' + CR +
     '    <table border="0" width="100%" cellpadding="0" cellspacing="0"              ' + CR +
     '           class="FORMULARIO">                                                  ' + CR +
     '      <tr>                                                                      ' + CR +
     '        <td width="75%">                                                        ' + CR +
     '          <table border="0" width="100%" cellpadding="0" cellspacing="0">       ' + CR +
     '            <tr class="CAMPOFORM">                                              ' + CR +
     '              <td class="DESCCAMPO" colspan="2">                                ' + CR ;


    //Nome
    if TemAcessoCampo( sTipoUsuario, cAltDepNome, sTituloCampo ) then
    begin
      Result := Result +
       sTituloCampo                                                                     +
       '                <br>                                                          ' + CR +
       '                <input type="text" name="edtNome" size="102"                  ' + CR +
       '                 class="TEXT" maxlength="60"                                  ' + CR ;
      if iIdDependente <> 0 then
        Result := Result + ' value="' + cds.FieldByName('NOME').AsString + '" ';
      //Pendência 23274 - 15/01/2008
      Result := Result + ' onBlur="this.value=this.value.toUpperCase()" >'; //'>';
    end;



    Result := Result +
     '              </td>                                                             ' + CR +
     '            </tr>                                                               ' + CR +
     '            <tr class="CAMPOFORM">                                              ' + CR +
     '              <td class="DESCCAMPO" width="50%">                                ' + CR ;


    //Nome do pai
    if TemAcessoCampo( sTipoUsuario, cAltDepNomePai, sTituloCampo ) then
    begin
      Result := Result +
       sTituloCampo                                                                     +
       '                <br>                                                          ' + CR +
       '                <input type="text" name="edtNomePai" size="47"                ' + CR +
       '                 class="TEXT" maxlength="50"                                  ' + CR ;
      if iIdDependente <> 0 then
        Result := Result + ' value="' + cds.FieldByName('NOMEPAI').AsString + '" ';
      //Pendência 23274 - 15/01/2008
      Result := Result + ' onBlur="this.value=this.value.toUpperCase()" >'; //'>';
    end;


    Result := Result +
     '              </td>                                                             ' + CR +
     '              <td class="DESCCAMPO">                                            ' + CR ;


     //Nome da mãe
    if TemAcessoCampo( sTipoUsuario, cAltDepNomeMae, sTituloCampo ) then
    begin
      Result := Result +
       sTituloCampo                                                                     +
       '                <br>                                                          ' + CR +
       '                <input type="text" name="edtNomeMae" size="47"                ' + CR +
       '                 class="TEXT" maxlength="50"                                  ' + CR ;
      if iIdDependente <> 0 then
        Result := Result + ' value="' + cds.FieldByName('NOMEMAE').AsString + '" ';
      //Pendência 23274 - 15/01/2008
      Result := Result + ' onBlur="this.value=this.value.toUpperCase()" >'; //'>';
    end;


    Result := Result +
     '              </td>                                                             ' + CR +
     '            </tr>                                                               ' + CR +
     '            <tr class="CAMPOFORM">                                              ' + CR +
     '              <td class="DESCCAMPO" width="50%">                                ' + CR ;


    //Parentesco
    if TemAcessoCampo( sTipoUsuario, cAltDepParentesco, sTituloCampo ) then
    begin
      cdsAux.Close;
      cdsAux.Data := Dependente.ListaDepen;

      Result := Result +
       sTituloCampo + '<br>' +
       '                <select size="1" name="cmbIdDependencia" class="TEXT">        ' + CR +
       '                  <option value="-1">[Selecione um dos graus de parentesco abaixo]</option> ' + CR ;

      while not cdsAux.Eof do
      begin
        Result := Result + '                  <option value="' + cdsAux.FieldByName('IDDEPENDENCIA').AsString + '" ';

        sDepen := trim( StrToName( cdsAux.FieldByName('DESCRICAO').AsString ) );

        if   ( iIdDependente <> 0 ) then
          if ( cds.FieldByName('IDDEPENDENCIA').AsString = cdsAux.FieldByName('IDDEPENDENCIA').AsString ) then
            Result := Result + ' selected';

        Result := Result + '>' + sDepen + '</option>' + CR;

        cdsAux.Next;
      end;
      cdsAux.Close;

      Result := Result +
       '                </select>                                                 ' + CR ;
    end;

    Result := Result +
     '              </td>                                                             ' + CR +
     '              <td class="DESCCAMPO">                                            ' + CR ;

    //Pendência 23274 - 28/12/2007
    //CPF
    if TemAcessoCampo( sTipoUsuario, cAltDepNumDocumento, sTituloCampo ) then
    begin
      Result := Result +
       sTituloCampo +
       '                <br>                                                          ' + CR +
       '                <input type="text" name="edtNumDocumento" size="15"           ' + CR +
       '                 class="TEXT" maxlength="11"                                  ' + CR ;
      if iIdDependente <> 0 then
        Result := Result + ' value="' + cds.FieldByName('NUMDOCUMENTO').AsString + '" ';
      Result := Result + '><font color=red> - Informar somente números</font>';
    end;


    Result := Result +
     '              </td>'  + CR +
     '            </tr>                                                               ' + CR +
     '            <tr class="CAMPOFORM">                                              ' + CR +
     '              <td class="DESCCAMPO" width="50%">                                ' + CR ;
    //Fim Pendência 23274


    //Data de Nascimento
    if TemAcessoCampo( sTipoUsuario, cAltDepDataNasc, sTituloCampo ) then
    begin
      if ( iIdDependente <> 0 ) then
        DecodeDate( cds.FieldByName('DATANASC').AsDateTime, wAno, wMes, wDia );

      //Dia
      Result := Result +
       sTituloCampo                                                                     +
       '                <br>                                                          ' + CR +
       '                <select size="1" name="cmbDtNascDia" class="TEXT">            ' + CR +
       '                  <option value="-1">[--]</option>                            ' + CR ;
      for i := 1 to 31 do
      begin
        Result := Result + '                  <option value="' + StrPadLeft( IntToStr(i), 2, '0' ) + '" ';
        if ( iIdDependente <> 0 ) and ( not cds.FieldByName('DATANASC').IsNull ) then
          if ( i = wDia ) then Result := Result + ' selected';
        Result := Result + '>' + StrPadLeft( IntToStr(i), 2, '0' ) + '</option>' + CR;
      end;

      //Mês
      Result := Result +
       '                </select>                                                     ' + CR +
       '                <select size="1" name="cmbDtNascMes" class="TEXT">            ' + CR +
       '                  <option value="-1">[--]</option>                            ' + CR ;
      for i := 1 to 12 do
      begin
        Result := Result + '                  <option value="' + StrPadLeft( IntToStr(i), 2, '0' ) + '" ';
        if ( iIdDependente <> 0 ) and ( not cds.FieldByName('DATANASC').IsNull ) then
          if ( i = wMes ) then Result := Result + ' selected';
        Result := Result + '>' + StrPadLeft( IntToStr(i), 2, '0' ) + '</option>' + CR;
      end;

      //Ano
      Result := Result +
       '                </select>                                                     ' + CR +
       '                <select size="1" name="cmbDtNascAno" class="TEXT">            ' + CR +
       '                  <option value="-1">[----]</option>                          ' + CR ;
      for i := 1900 to 2100 do
      begin
        Result := Result + '                  <option value="' + IntToStr(i) + '" ';
        if ( iIdDependente <> 0 ) and ( not cds.FieldByName('DATANASC').IsNull ) then
          if ( i = wAno ) then Result := Result + ' selected';
        Result := Result + '>' + IntToStr(i) + '</option>' + CR;
      end;
    end;


    //Pendência 23274 - 28/12/2007
    //Result := Result +
    // '              </td>                                                             ' + CR +
    // '            </tr>                                                               ' + CR +
    // '            <tr class="CAMPOFORM">                                              ' + CR +
    // '              <td class="DESCCAMPO" width="50%">                                ' + CR ;
    Result := Result +
     '              </td>                                                             ' + CR +
     '              <td class="DESCCAMPO">                                            ' + CR ;


    //Data de Falecimento
    if TemAcessoCampo( sTipoUsuario, cAltDepDataMorte, sTituloCampo ) then
    begin
      if ( iIdDependente <> 0 ) then
        DecodeDate( cds.FieldByName('DATAMORTE').AsDateTime, wAno, wMes, wDia );

      //Dia
      Result := Result +
       sTituloCampo                                                                     +
       '                <br>                                                          ' + CR +
       '                <select size="1" name="cmbDtMorteDia" class="TEXT">           ' + CR +
       '                  <option value="-1">[--]</option>                            ' + CR ;
      for i := 1 to 31 do
      begin
        Result := Result + '                  <option value="' + StrPadLeft( IntToStr(i), 2, '0' ) + '" ';
        if ( iIdDependente <> 0 ) and ( not cds.FieldByName('DATAMORTE').IsNull ) then
          if ( i = wDia ) then Result := Result + ' selected';
        Result := Result + '>' + StrPadLeft( IntToStr(i), 2, '0' ) + '</option>' + CR;
      end;

      //Mês
      Result := Result +
       '                </select>                                                     ' + CR +
       '                <select size="1" name="cmbDtMorteMes" class="TEXT">           ' + CR +
       '                  <option value="-1">[--]</option>                            ' + CR ;
      for i := 1 to 12 do
      begin
        Result := Result + '                  <option value="' + StrPadLeft( IntToStr(i), 2, '0' ) + '" ';
        if ( iIdDependente <> 0 ) and ( not cds.FieldByName('DATAMORTE').IsNull ) then
          if ( i = wMes ) then Result := Result + ' selected';
        Result := Result + '>' + StrPadLeft( IntToStr(i), 2, '0' ) + '</option>' + CR;
      end;

      //Ano
      Result := Result +
       '                </select>                                                     ' + CR +
       '                <select size="1" name="cmbDtMorteAno" class="TEXT">           ' + CR +
       '                  <option value="-1">[----]</option>                          ' + CR ;
      for i := 1900 to 2100 do
      begin
        Result := Result + '                  <option value="' + IntToStr(i) + '" ';
        if ( iIdDependente <> 0 ) and ( not cds.FieldByName('DATAMORTE').IsNull ) then
          if ( i = wAno ) then Result := Result + ' selected';
        Result := Result + '>' + IntToStr(i) + '</option>' + CR;
      end;
    end;


    //Result := Result +
    // '              </td>                                                             ' + CR +
     //'            </tr>                                                               ' + CR +
     //'            <tr class="CAMPOFORM">                                              ' + CR +
    // '              <td class="DESCCAMPO" >                                ' + CR ;
    //Fim Pendência 23274


    //BRUNO AZEVEDO SOL 144873 KINTANA 961354
    //INVALIDO
    if TemAcessoCampo( sTipoUsuario, cAltDepInvalido, sTituloCampo ) then
    begin
      Result := Result +
       sTituloCampo                                                                     +
       '                <br>                                                          ' + CR +
       '                <table border="0" width="260" cellpadding="0"                 ' + CR +
       '                       cellspacing="0" class="FORMSIMTEXT">                   ' + CR +
       '                  <tr>                                                        ' + CR +
       '                    <td class="TEXT" width="50%" valign="center">                        ' + CR +
       '                      <input type="radio" name="rbDepInvalido" value="1"      ' + CR ;
      if iIdDependente <> 0 then
        if cds.FieldByName('FLGDEPINVALIDO').AsString = '1' then Result := Result + ' checked';
      Result := Result + '>Sim                                                        ' + CR +
       '                    </td>                                                     ' + CR +
       '                    <td class="TEXT">                                         ' + CR +
       '                      <input type="radio" name="rbDepInvalido" value="0"      ' + CR ;
      if iIdDependente <> 0 then
        if cds.FieldByName('FLGDEPINVALIDO').AsString <> '1' then Result := Result + ' checked';
      Result := Result + '>Não                                                        ' + CR +
       '                    </td>                                                     ' + CR +
       '                  </tr>                                                       ' + CR +
       '                </table>                                                      ' + CR ;
    end;


    Result := Result +
     '              </td>                                                             ' + CR +
     '            </tr>                                                               ' + CR +
     '            <tr class="CAMPOFORM">                                              ' + CR +
     '              <td class="DESCCAMPO" width="50%">                                ' + CR ;
    //BRUNO AZEVEDO SOL 144873 KINTANA 961354

    //Estado Civil
    if TemAcessoCampo( sTipoUsuario, cAltDepEstadoCivil, sTituloCampo ) then
    begin
      Result := Result +
       sTituloCampo + '<br>' +
       '                <select size="1" name="cmbIdEstCivil" class="TEXT">                                          ' + CR +
       '                  <option value="-1"                      >[Selecione um dos estados civis abaixo] </option> ' + CR +
       '                  <option value="S" ' + SelEstCiv('S') + '>Solteiro(a)                             </option> ' + CR +
       '                  <option value="C" ' + SelEstCiv('C') + '>Casado(a)                               </option> ' + CR +
       '                  <option value="D" ' + SelEstCiv('D') + '>Divorciado(a)                           </option> ' + CR +
       '                  <option value="E" ' + SelEstCiv('E') + '>Desquitado(a)                           </option> ' + CR +
       '                  <option value="J" ' + SelEstCiv('J') + '>Separado(a) Judicial                    </option> ' + CR +
       '                  <option value="V" ' + SelEstCiv('V') + '>Viúvo(a)                                </option> ' + CR +
       '                  <option value="M" ' + SelEstCiv('M') + '>União Estável                           </option> ' + CR +
       '                  <option value="P" ' + SelEstCiv('P') + '>Separado(a)                             </option> ' + CR +


       //'                  <option value="O" ' + SelEstCiv('O') + '>Outros                                  </option> ' + CR +
       '                </select>                                                                                    ' + CR ;
    end;


    Result := Result +
     '              </td>                                                             ' + CR +
     '              <td class="DESCCAMPO">                                            ' + CR ;


    //Sexo
    if TemAcessoCampo( sTipoUsuario, cAltDepSexo, sTituloCampo ) then
    begin
      Result := Result +
       sTituloCampo                                                                     +
       '                <br>                                                          ' + CR +
       '                <table border="0" width="260" cellpadding="0"                 ' + CR +
       '                       cellspacing="0" class="FORMSIMTEXT">                   ' + CR +
       '                  <tr>                                                        ' + CR +
       '                    <td class="TEXT" width="50%" valign="center">                        ' + CR +
       '                      <input type="radio" name="rbSexo" value="M"             ' + CR ;
      if iIdDependente <> 0 then
        if cds.FieldByName('SEXO').AsString = 'M' then Result := Result + ' checked';
      Result := Result + '>Masculino                                                  ' + CR +
       '                    </td>                                                     ' + CR +
       '                    <td class="TEXT">                                         ' + CR +
       '                      <input type="radio" name="rbSexo" value="F"             ' + CR ;
      if iIdDependente <> 0 then
        if cds.FieldByName('SEXO').AsString = 'F' then Result := Result + ' checked';
      Result := Result + '>Feminino                                                   ' + CR +
       '                    </td>                                                     ' + CR +
       '                  </tr>                                                       ' + CR +
       '                </table>                                                      ' + CR ;
    end;


    Result := Result +
     '              </td>                                                             ' + CR +
     '            </tr>                                                               ' + CR +
     '            <tr class="CAMPOFORM">                                              ' + CR +
     '              <td class="DESCCAMPO" width="50%">                                ' + CR ;


    //Grau de instrução 
    if TemAcessoCampo( sTipoUsuario, cAltDepGrauInstr, sTituloCampo ) then
    begin
      cdsAux.Close;
      cdsAux.Data := Dependente.ListaGrInstr;

      Result := Result +
       sTituloCampo + '<br>' +
       '                <select size="1" name="cmbIdGrInstr" class="TEXT">    ' + CR +
       '                  <option value="-1">[Selecione um dos graus de instrução abaixo]</option> ' + CR ;

      while not cdsAux.Eof do
      begin
        Result := Result + '                  <option value="' + cdsAux.FieldByName('IDGRINSTR').AsString + '" ';

        sDepen := trim( StrToName( cdsAux.FieldByName('DESCRICAO').AsString ) );

        if   ( iIdDependente <> 0 ) then
          if ( cds.FieldByName('IDGRINSTR').AsString = cdsAux.FieldByName('IDGRINSTR').AsString ) then
            Result := Result + ' selected';

        Result := Result + '>' + sDepen + '</option>' + CR;

        cdsAux.Next;
      end;
      cdsAux.Close;

      Result := Result +
       '                </select>                                                     ' + CR ;
    end;

    Result := Result +
     '              </td>                                                             ' + CR +
     '            </tr>                                                               ' + CR +
     '          </table>                                                              ' + CR +
     '        </td>                                                                   ' + CR +
     '        <td valign="top">                                                       ' + CR ;

    if  TemAcessoCampo( sTipoUsuario, cAltDepIsentoIRRF,          sTituloCampo )
     or TemAcessoCampo( sTipoUsuario, cAltDepIRRF,                sTituloCampo )
     or TemAcessoCampo( sTipoUsuario, cAltDepSalarioFamilia,      sTituloCampo )
     or TemAcessoCampo( sTipoUsuario, cAltDepDependenteLegal,     sTituloCampo )
     or TemAcessoCampo( sTipoUsuario, cAltDepPossuiMolestiaGrave, sTituloCampo )
     //BRUNO AZEVEDO SOL 124179 KINTANA 651468
     or TemAcessoCampo( sTipoUsuario, cAltDepIR,                  sTituloCampo )
     //or TemAcessoCampo( sTipoUsuario, cAltDepInvalido,            sTituloCampo ) //BRUNO AZEVEDO SOL 144873 KINTANA 961354
     //BRUNO AZEVEDO SOL 124179 KINTANA 651468
     or TemAcessoCampo( sTipoUsuario, cAltDepDesignado,           sTituloCampo ) then
    begin
      Result := Result +
       '          <DIV class="BOXFORM" width="100%">                                  ' + CR ;

      //Isento de IRRF?
      if  TemAcessoCampo( sTipoUsuario, cAltDepIsentoIRRF, sTituloCampo ) then
      begin
        Result := Result +
         '            <input type="checkbox"                                          ' + CR ;
        if ( iIdDependente <> 0 ) then
          if cds.FieldByName('FLGISENTOIRRF').AsInteger = 1 then Result := Result + ' checked';
        Result := Result +
         ' name="cbFlgIsentoIrrf" value="1"> ' + sTituloCampo + ' </input>            ' + CR +
         '              <br>                                                          ' + CR ;
      end;


      //Conta para imposto de rernda?
      if  TemAcessoCampo( sTipoUsuario, cAltDepIRRF, sTituloCampo ) then
      begin
        Result := Result +
         '            <input type="checkbox"                                          ' + CR ;
        if ( iIdDependente <> 0 ) then
          if cds.FieldByName('FLGCONTAIMPOSTOR').AsInteger = 1 then Result := Result + ' checked';
        Result := Result +
         ' name="cbFlgContaImpostoR" value="1"> ' + sTituloCampo + ' </input>         ' + CR +
         '              <br>                                                          ' + CR ;
      end;                         


      //Conta para salário família?
      if  TemAcessoCampo( sTipoUsuario, cAltDepSalarioFamilia, sTituloCampo ) then
      begin
        Result := Result +
         '            <input type="checkbox"                                          ' + CR ;
        if ( iIdDependente <> 0 ) then
          if cds.FieldByName('FLGCONTASALARIOF').AsInteger = 1 then Result := Result + ' checked';
        Result := Result +
         ' name="cbFlgContaSalarioF" value="1"> ' + sTituloCampo + ' </input>         ' + CR +
         '              <br>                                                          ' + CR ;
      end;


      //Dependente legal?
      if  TemAcessoCampo( sTipoUsuario, cAltDepDependenteLegal, sTituloCampo ) then
      begin
        Result := Result +
         '            <input type="checkbox"                                          ' + CR ;
        if ( iIdDependente <> 0 ) then
          if cds.FieldByName('FLGDEPLEGAL').AsInteger = 1 then Result := Result + ' checked';
        Result := Result +
         ' name="cbFlgDepLegal" value="1"> ' + sTituloCampo + ' </input>              ' + CR +
         '              <br>                                                          ' + CR ;
      end;


      //Possui moléstia grave?
      if  TemAcessoCampo( sTipoUsuario, cAltDepPossuiMolestiaGrave, sTituloCampo ) then
      begin
        Result := Result +
         '            <input type="checkbox"                                          ' + CR ;
        if ( iIdDependente <> 0 ) then
          if cds.FieldByName('FLGMOLESTIAGRAVE').AsInteger = 1 then Result := Result + ' checked';
        Result := Result +
         ' name="cbFlgMolestiaGrave" value="1"> ' + sTituloCampo + ' </input>         ' + CR +
         '              <br>                                                          ' + CR ;
      end;


      //Designado?
      if  TemAcessoCampo( sTipoUsuario, cAltDepDesignado, sTituloCampo ) then
      begin
        Result := Result +
         '            <input type="checkbox"                                          ' + CR ;
        if ( iIdDependente <> 0 ) then
          if cds.FieldByName('FLGDESIGNADO').AsInteger = 1 then Result := Result + ' checked';
        Result := Result +
         ' name="cbFlgDesignado" value="1"> ' + sTituloCampo + ' </input>             ' + CR +
         '              <br>                                                          ' + CR ;
      end;

      //BRUNO AZEVEDO SOL 124179 KINTANA 651468
      if  TemAcessoCampo( sTipoUsuario, cAltDepIR, sTituloCampo ) then
      begin
        Result := Result +
         '            <input type="checkbox"                                          ' + CR ;
        if ( iIdDependente <> 0 ) then
          if cds.FieldByName('FLGDEPIR').AsInteger = 1 then Result := Result + ' checked';
        Result := Result +
         ' name="cbFlgDepIR" value="1"> ' + sTituloCampo + ' </input>             ' + CR +
         '              <br>                                                          ' + CR ;
      end;

      //BRUNO AZEVEDO SOL 144873 KINTANA 961354
      {if  TemAcessoCampo( sTipoUsuario, cAltDepInvalido, sTituloCampo ) then
      begin
        Result := Result +
         '            <input type="checkbox"                                          ' + CR ;
        if ( iIdDependente <> 0 ) then
          if cds.FieldByName('FLGDEPINVALIDO').AsInteger = 1 then Result := Result + ' checked';
        Result := Result +
         ' name="cbFlgDepInvalido" value="1"> ' + sTituloCampo + ' </input>             ' + CR +
         '              <br>                                                          ' + CR ;
      end;          }
      //BRUNO AZEVEDO SOL 124179 KINTANA 651468

      Result := Result +
       '          </DIV>                                                              ' + CR ;
    end;


    Result := Result +
     '        </td>                                                                   ' + CR +
     '      </tr>                                                                     ' + CR +
     '      <tr>                                                                      ' + CR +
     '        <td colspan="2" align="center">                                         ' + CR +
     '          <br>                                                                  ' + CR +
     '          <a href="JavaScript:ConfirmaDependente();">                           ' + CR +
     '           <img src="../imagem/btnConfirmar.gif" name="btnConfirmar" border="0" ' + CR +
     '            onMouseOver="btnConfirmar.src=''../imagem/btnConfirmar_s.gif''"     ' + CR +
     '            onMouseOut="btnConfirmar.src=''../imagem/btnConfirmar.gif''"></a>   ' + CR +
     '          <a href="JavaScript:EnviaForm( document.frmLnkManutDependentes )">    ' + CR +
     '            <img src="../imagem/btnCancelar.gif" name="btnCancelar" border="0"  ' + CR +
     '            onMouseOver="btnCancelar.src=''../imagem/btnCancelar_s.gif''"       ' + CR +
     '            onMouseOut="btnCancelar.src=''../imagem/btnCancelar.gif''"></a>     ' + CR +
     '        </td>                                                                   ' + CR +
     '      </tr>                                                                     ' + CR +
     '    </table>                                                                    ' + CR +
     '    <input type="hidden" name="edtIdDependente" value="' + IntToStr( iIdDependente ) + '" > ' + CR +
     //BRUNO AZEVEDO SOL 141367 KINTANA 894033
     //'    <input type="hidden" name="IDSITDEPENDENTE" value="' + IntToStr(iIdSitDependente) + '" > ' + CR +
     '    <#hiddenfields>                                                             ' + CR +
     '  </form>                                                                       ' + CR +
     '</p>                                                                            ' + CR +
     '<SCRIPT language="JavaScript">                                                  ' + CR +
     '  document.frmLnkDependente.edtNome.focus();                                    ' + CR +
     '</script>                                                                       ' + CR ;

    Result := MontaPagina( iPag, Result );

  except
    On E : Exception do
    begin
      Result := TrataWebExcecoes( E );
    end;
  end;          

end; {PaginaAlteracaoEndereco}


//Monta a página de Gravação de Dependentes
function PaginaSalvarDependente( iIdPessoaLocal : integer; Request: TWebRequest ) : String;
var
  iIdDependente : integer;
  sOperacao : String;
  iPag : integer;
  dDataNasc: TDateTime;
  fIdade: Extended;
begin

  try

    //BRUNO AZEVEDO SOL 141367 KINTANA 894033
    dDataNasc := EncodeDate(StrToIntDef( Request.ContentFields.Values['cmbDtNascAno'], 0 ),
                            StrToIntDef( Request.ContentFields.Values['cmbDtNascMes'], 0 ),
                            StrToIntDef( Request.ContentFields.Values['cmbDtNascDia'], 0 ));
    fIdade := ((Date - dDataNasc)/ 365.25);
    if ((Request.ContentFields.Values['cmbIdDependencia'] = 'FIL') or
       (Request.ContentFields.Values['cmbIdDependencia'] = 'IRM') or
       (Request.ContentFields.Values['cmbIdDependencia'] = 'ENT')) and
       //((fIdade >= 24) and (Request.ContentFields.Values['cbFlgDepInvalido'] <> '1')) then begin
      //BRUNO AZEVEDO SOL 144873 KINTANA 961354
       ((fIdade >= 24) and (Request.ContentFields.Values['rbDepInvalido'] <> '1') and (Request.ContentFields.Values['cbFlgDepIR'] <> '1')) then begin
      if (Request.ContentFields.Values['cmbIdDependencia'] = 'FIL') then begin
        raise Exception.Create( 'De acordo com o regulamento deste Plano, <br>' +
                                'só é possível cadastrar como dependente filho menor de 24 anos ou inválido. ' );
      end else if (Request.ContentFields.Values['cmbIdDependencia'] = 'IRM') then begin
        raise Exception.Create( 'De acordo com o regulamento deste Plano, <br>' +
                                'só é possível cadastrar como dependente irmão menor de 24 anos ou inválido. ' );
      end else if (Request.ContentFields.Values['cmbIdDependencia'] = 'ENT') then begin
        raise Exception.Create( 'De acordo com o regulamento deste Plano, <br>' +
                                'só é possível cadastrar como dependente enteado menor de 24 anos ou inválido. ' );
      end;
      //raise Exception.Create( 'Só é possível cadastrar dependentes que sejam: <br>' +
      //                        'Cônjuge, Ex-cônjuge, Companheiro (a), Filho ou Enteado (menor de 24 anos ou Inválido), Pais, Irmão (menor de 24 anos ou Inválido)! ' );
    end;
    //BRUNO AZEVEDO SOL 144873 KINTANA 961354
    //BRUNO AZEVEDO SOL 141367 KINTANA 894033

    //BRUNO AZEVEDO SOL 144873 KINTANA 961354
    if ((Request.ContentFields.Values['cmbIdDependencia'] = 'FIL') or
       (Request.ContentFields.Values['cmbIdDependencia'] = 'IRM') or
       (Request.ContentFields.Values['cmbIdDependencia'] = 'ENT')) and
      //BRUNO AZEVEDO SOL 144873 KINTANA 961354
       ((fIdade >= 25) and (Request.ContentFields.Values['rbDepInvalido'] <> '1') and (Request.ContentFields.Values['cbFlgDepIR'] = '1')) then begin
      if (Request.ContentFields.Values['cmbIdDependencia'] = 'FIL') then begin
        raise Exception.Create( 'De acordo com o regulamento deste Plano, <br>' +
                                'só é possível cadastrar como dependente filho menor de 25 anos ou inválido. ' );
      end else if (Request.ContentFields.Values['cmbIdDependencia'] = 'IRM') then begin
        raise Exception.Create( 'De acordo com o regulamento deste Plano, <br>' +
                                'só é possível cadastrar como dependente irmão menor de 25 anos ou inválido. ' );
      end else if (Request.ContentFields.Values['cmbIdDependencia'] = 'ENT') then begin
        raise Exception.Create( 'De acordo com o regulamento deste Plano, <br>' +
                                'só é possível cadastrar como dependente enteado menor de 25 anos ou inválido. ' );
      end;
    end;
    //BRUNO AZEVEDO SOL 144873 KINTANA 961354

    iIdDependente := StrToIntDef( Request.ContentFields.Values['edtIdDependente'], 0 );

    if iIdDependente = 0 then
      sOperacao := 'I'
    else
      sOperacao := 'A';

    //---------- Início da Alteração de dependente
    cds.Close;

    cds.Data := Dependente.SelecionaDependente( iIdPessoaLocal, iIdDependente );

    cds.Data := CopyClientDataSet( cds );

    if cds.IsEmpty then
      cds.Insert
    else
      cds.Edit;

    cds.FieldByName( 'IDTITULAR' ).AsInteger := iIdPessoaLocal;
    cds.FieldByName( 'IDPESSOA'  ).AsInteger := iIdDependente;

    AtualizaCampo( cAltDepNome,                cds.FieldByName( 'NOME'             ), Request.ContentFields.Values['edtNome'] );
    AtualizaCampo( cAltDepParentesco,          cds.FieldByName( 'IDDEPENDENCIA'    ), Request.ContentFields.Values['cmbIdDependencia'], True );
    AtualizaCampo( cAltDepSexo,                cds.FieldByName( 'SEXO'             ), Request.ContentFields.Values['rbSexo'] );
    AtualizaCampo( cAltDepEstadoCivil,         cds.FieldByName( 'ESTCIVIL'         ), Request.ContentFields.Values['cmbIdEstCivil'], True );

    AtualizaCampo( cAltDepDataNasc,            cds.FieldByName( 'DATANASC'         ), StrToIntDef( Request.ContentFields.Values['cmbDtNascDia'], 0 ),
                                                                                   StrToIntDef( Request.ContentFields.Values['cmbDtNascMes'], 0 ),
                                                                                   StrToIntDef( Request.ContentFields.Values['cmbDtNascAno'], 0 ) );

    AtualizaCampo( cAltDepNomePai,             cds.FieldByName( 'NOMEPAI'          ), Request.ContentFields.Values['edtNomePai'] );
    AtualizaCampo( cAltDepNomeMae,             cds.FieldByName( 'NOMEMAE'          ), Request.ContentFields.Values['edtNomeMae'] );
    AtualizaCampo( cAltDepGrauInstr,           cds.FieldByName( 'IDGRINSTR'        ), StrToIntDef( Request.ContentFields.Values['cmbIdGrInstr'], 0 ), True );
    AtualizaCampo( cAltDepIsentoIRRF,          cds.FieldByName( 'FLGISENTOIRRF'    ), StrToIntDef( Request.ContentFields.Values['cbFlgIsentoIrrf'], 0 ) );
    AtualizaCampo( cAltDepIRRF,                cds.FieldByName( 'FLGCONTAIMPOSTOR' ), StrToIntDef( Request.ContentFields.Values['cbFlgContaImpostoR'], 0 ) );
    AtualizaCampo( cAltDepSalarioFamilia,      cds.FieldByName( 'FLGCONTASALARIOF' ), StrToIntDef( Request.ContentFields.Values['cbFlgContaSalarioF'], 0 ) );
    AtualizaCampo( cAltDepDependenteLegal,     cds.FieldByName( 'FLGDEPLEGAL'      ), StrToIntDef( Request.ContentFields.Values['cbFlgDepLegal'], 0 ) );
    AtualizaCampo( cAltDepPossuiMolestiaGrave, cds.FieldByName( 'FLGMOLESTIAGRAVE' ), StrToIntDef( Request.ContentFields.Values['cbFlgMolestiaGrave'], 0 ) );
    AtualizaCampo( cAltDepDesignado,           cds.FieldByName( 'FLGDESIGNADO'     ), StrToIntDef( Request.ContentFields.Values['cbFlgDesignado'], 0 ) );

    //BRUNO AZEVEDO SOL 124179 KINTANA 651468
    AtualizaCampo( cAltDepIR,                  cds.FieldByName( 'FLGDEPIR'         ), StrToIntDef( Request.ContentFields.Values['cbFlgDepIR'], 0 ) );
    AtualizaCampo( cAltDepInvalido,            cds.FieldByName( 'FLGDEPINVALIDO'   ), StrToIntDef( Request.ContentFields.Values['rbDepInvalido'], 0 ) );
    //BRUNO AZEVEDO SOL 124179 KINTANA 651468

    //Pendência 23274 - 28/12/2007
    AtualizaCampo( cAltDepNumDocumento,        cds.FieldByName( 'NUMDOCUMENTO'     ), Request.ContentFields.Values['edtNumDocumento'] );
    AtualizaCampo( cAltDepDataNasc,            cds.FieldByName( 'DATAMORTE'        ), StrToIntDef( Request.ContentFields.Values['cmbDtMorteDia'], 0 ),
                                                                                      StrToIntDef( Request.ContentFields.Values['cmbDtMorteMes'], 0 ),
                                                                                      StrToIntDef( Request.ContentFields.Values['cmbDtMorteAno'], 0 ) );
    //Fim Pendência 23274

    //BRUNO AZEVEDO SOL 144873 KINTANA 961354
    {if (fIdade <= 24) then begin
      AtualizaCampo( cAltDepDependenteLegal, cds.FieldByName('FLGDEPLEGAL'), 1);
    end else if (fIdade <= 25) then begin
      AtualizaCampo( cAltDepIR, cds.FieldByName('FLGDEPIR'), 1);
    end;

    if (StrToIntDef( Request.ContentFields.Values['cbFlgDepIR'], 0 ) = 1) then begin
      AtualizaCampo( cAltDepDependenteLegal, cds.FieldByName('FLGDEPLEGAL'), 0);
    end else if (StrToIntDef( Request.ContentFields.Values['cbFlgDepLegal'], 0 ) = 1) then begin
      AtualizaCampo( cAltDepIR, cds.FieldByName('FLGDEPIR'), 0);
    end;}
    if (fIdade <= 24) then begin
      cds.FieldByName('FLGDEPLEGAL').AsInteger := 1;
    end else if (fIdade <= 25) then begin
      cds.FieldByName('FLGDEPIR').AsInteger := 1;
    end;



    if (fIdade > 24) then begin
      if (StrToIntDef( Request.ContentFields.Values['cbFlgDepLegal'], 0 ) = 1) then begin
        cds.FieldByName('FLGDEPLEGAL').AsInteger := 0;
      end;
    end;

    //BRUNO AZEVEDO SOL 144873 KINTANA 961354
    //CMDebugToFile(cds.FieldByName('IDDEPENDENCIA').AsString +'-'+cds.FieldByName('IDPESSOA').AsString , 'C:\AAErro.txt' );
    if (( cds.FieldByName('IDDEPENDENCIA').AsString = 'PAI') or (cds.FieldByName('IDDEPENDENCIA').AsString = 'COM')
    or ( cds.FieldByName('IDDEPENDENCIA').AsString = 'COP')) then
       cds.FieldByName('FLGDEPLEGAL').AsInteger := 1;

    //CMDebugToFile(cds.FieldByName('FLGDEPLEGAL').AsString , 'C:\AAErro.txt' );
    //BRUNO AZEVEDO SOL 144873 KINTANA 961354

    cds.Post;

    Dependente.CdsDependente.Data := cds.Data;

    iIdDependente := Dependente.GravaDependente;                                         

    if ( iIdDependente <= 0 ) then
      raise Exception.Create( sMsgCtrl );

    cds.Close;
    cdsAux.Close;
    //---------- Término da Alteração de Dependentes


    //---------- Montagem da página de confirmação

    if sOperacao = 'I' then iPag := pDepConfInclusao
    else                    iPag := pDepConfAlteracao;

    sTitulo := TituloPagina( iPag );

    Result := Result +
     '  <table border="0" width="100%" cellpadding="0" cellspacing="0"         ' + CR +
     '         class="FORMULARIO">                                             ' + CR +
     DadosDependente( iIdPessoaLocal, iIdDependente )                            + CR +
     '  </table>                                                               ' + CR +
     '  <BR><BR>                                                               ' + CR ;

    Result := MontaPagina( iPag, Result );

  except
    On E : Exception do
    begin
      Result := TrataWebExcecoes( E );
    end;
  end;

end; {PaginaSalvarDependente}

//Monta o rodapé da confirmação de dependente.
function RodapeConfirmaDependente : String;
begin
  Result :=
   '  <table border="0" width="100%" cellpadding="0" cellspacing="0">          ' + CR +
   '    <tr>                                                                   ' + CR +
   '      <td class="LINK" width=50%>                                          ' + CR +
   '        <a href="javascript:EnviaForm( document.frmLnkHome );">            ' + CR +
   '          Voltar para Home                                                 ' + CR +
   '        </a>                                                               ' + CR +
   '      </td>                                                                ' + CR +
   '      <td class="LINK" width=50% align="right">                            ' + CR +
   '        <a href="javascript:history.go(-1)">                               ' + CR +
  // '        <a href="javascript:EnviaForm( document.frmLnkAltDependente );">   ' + CR +
   '          Voltar para Manutenção de Dependentes                             ' + CR +
   '        </a>                                                               ' + CR +
   '      </td>                                                                ' + CR +
   '    </tr>                                                                  ' + CR +
   '  </table>                                                                 ' + CR +
   '  <BR>                                                                     ' + CR +
   '  <form method="POST" name="frmLnkAltDependente"                           ' + CR +
   '   action="../<#nomearqapl>/AlteracaoDependente">                 ' + CR +
   '    <#hiddenfields>                                                        ' + CR +
   '  </form>                                                                  ' + CR ;
end; {RodapeConfirmaDependente}


//Exibe os dados de um determinado dependente
function DadosDependente( iIdPessoaLocal, iIdDependente : integer ) : String;
var
  sTituloCampo : string;
begin
  cds.Close;
  cds.Data := Dependente.SelecionaDependente( iIdPessoaLocal, iIdDependente );

  if not cds.IsEmpty then
  begin

    Result := Result +
     '<p class="DESCCAMPO">                                                           ' + CR +
     '  <table border="0" width="100%" cellpadding="0" cellspacing="0"              ' + CR +
     '         class="FORMULARIO">                                                  ' + CR +
     '    <tr>                                                                      ' + CR +
     '      <td width="75%">                                                        ' + CR +
     '        <table border="0" width="100%" cellpadding="0" cellspacing="0">       ' + CR +
     '          <tr class="CAMPOFORM">                                              ' + CR +
     '            <td class="DESCCAMPO" colspan="2">                                ' + CR ;


    //Nome
    if TemAcessoCampo( sTipoUsuario, cAltDepNome, sTituloCampo ) then
    begin
      Result := Result +
       sTituloCampo                                                                       +
       '                <DIV class="CONTCAMPOD">                                   ' + CR +
       StrToName( cds.FieldByName('NOME').AsString )                                 +
       '                </DIV>                                                     ' + CR ;
    end;


    Result := Result +
     '              </td>                                                             ' + CR +
     '            </tr>                                                               ' + CR +
     '            <tr class="CAMPOFORM">                                              ' + CR +
     '              <td class="DESCCAMPO" width="50%">                                ' + CR ;


    //Nome do pai
    if TemAcessoCampo( sTipoUsuario, cAltDepNomePai, sTituloCampo ) then
    begin
      Result := Result +
       sTituloCampo                                                                       +
       '                <DIV class="CONTCAMPOD">                                   ' + CR +
       StrToName( cds.FieldByName('NOMEPAI').AsString )                              +
       '                </DIV>                                                     ' + CR ;
    end;


    Result := Result +
     '              </td>                                                             ' + CR +
     '              <td class="DESCCAMPO">                                            ' + CR ;


     //Nome da mãe
    if TemAcessoCampo( sTipoUsuario, cAltDepNomeMae, sTituloCampo ) then
    begin
      Result := Result +
       sTituloCampo                                                                       +
       '                <DIV class="CONTCAMPOD">                                   ' + CR +
       StrToName( cds.FieldByName('NOMEMAE').AsString )                              +
       '                </DIV>                                                     ' + CR ;
    end;


    Result := Result +
     '              </td>                                                             ' + CR +
     '            </tr>                                                               ' + CR +
     '            <tr class="CAMPOFORM">                                              ' + CR +
     '              <td class="DESCCAMPO" width="50%">                                ' + CR ;


    //Parentesco
    if TemAcessoCampo( sTipoUsuario, cAltDepParentesco, sTituloCampo ) then
    begin
      Result := Result +
       sTituloCampo                                                                       +
       '                <DIV class="CONTCAMPOD">                                   ' + CR +
       StrToName( cds.FieldByName('DESCRICAO').AsString )                            +
       '                </DIV>                                                     ' + CR ;
    end;

    Result := Result +
     '              </td>                                                             ' + CR +
     '              <td class="DESCCAMPO">                                            ' + CR ;


    //Pendência 23274 - 28/12/2007
    //CPF
    if TemAcessoCampo( sTipoUsuario, cAltDepNumDocumento, sTituloCampo ) then
    begin
      Result := Result +
       sTituloCampo                                                                       +
       '                <DIV class="CONTCAMPOD">                                   ' + CR;
       if trim( cds.FieldByName('NUMDOCUMENTO').AsString ) <> '' then
         Result := Result + FormatMaskText( MaskField(cds.FieldByName('MASCARA').AsString), cds.FieldByName('NUMDOCUMENTO').AsString );
      Result := Result +
       '                </DIV>                                                     ' + CR ;
    end;


    Result := Result +
     '              </td>                                                             ' + CR +
     '            </tr>                                                               ' + CR +
     '            <tr class="CAMPOFORM">                                              ' + CR +
     '              <td class="DESCCAMPO" width="50%">                                ' + CR ;
    //Fim Pendência 23274



    //Data de Nascimento
    if TemAcessoCampo( sTipoUsuario, cAltDepDataNasc, sTituloCampo ) then
    begin
      Result := Result +
       sTituloCampo                                                                       +
       '                <DIV class="CONTCAMPOD">                                   ' + CR +
       FormataDataHora( 'dd/mm/yyyy', cds.FieldByName('DATANASC').AsString )         +
       '                </DIV>                                                     ' + CR ;
    end;


    Result := Result +
     '              </td>                                                             ' + CR +
     '              <td class="DESCCAMPO">                                            ' + CR ;

    //Dependente Inválido
    if TemAcessoCampo( sTipoUsuario, cAltDepInvalido, sTituloCampo ) then
    begin
      Result := Result +
       sTituloCampo                                                                       +
       '                <DIV class="CONTCAMPOD">                                   ' + CR +
       Iff( cds.FieldByName('FLGDEPINVALIDO').AsString = '1', 'Sim', 'Não' )        +
       '                </DIV>                                                     ' + CR ;
    end;


    Result := Result +
     '              </td>                                                             ' + CR +
     '            </tr>                                                               ' + CR +
     '            <tr class="CAMPOFORM">                                              ' + CR +
     '              <td class="DESCCAMPO" width="50%">                                ' + CR ;


    //Data de Falecimento
    if TemAcessoCampo( sTipoUsuario, cAltDepDataMorte, sTituloCampo ) then
    begin
      Result := Result +
       sTituloCampo                                                                       +
       '                <DIV class="CONTCAMPOD">                                   ' + CR +
       FormataDataHora( 'dd/mm/yyyy', cds.FieldByName('DATAMORTE').AsString )        +
       '                </DIV>                                                     ' + CR ;
    end;


    Result := Result +
     '              </td>                                                             ' + CR +
     '            </tr>                                                               ' + CR +
     '            <tr class="CAMPOFORM">                                              ' + CR +
     '              <td class="DESCCAMPO" width="50%">                                ' + CR ;
    //Fim Pendência 23274


    //Estado Civil
    if TemAcessoCampo( sTipoUsuario, cAltDepEstadoCivil, sTituloCampo ) then
    begin
      Result := Result +
       sTituloCampo                                                                       +
       '                <DIV class="CONTCAMPOD">                                   ' + CR +
       StrToName( cds.FieldByName('ESTADOCIVIL').AsString )                          +
       '                </DIV>                                                     ' + CR ;
    end;


    Result := Result +
     '              </td>                                                             ' + CR +
     '              <td class="DESCCAMPO">                                            ' + CR ;


    //Sexo
    if TemAcessoCampo( sTipoUsuario, cAltDepSexo, sTituloCampo ) then
    begin
      Result := Result +
       sTituloCampo                                                                       +
       '                <DIV class="CONTCAMPOD">                                   ' + CR +
       Iff( cds.FieldByName('SEXO').AsString = 'M', 'Masculino', 'Feminino' )        +
       '                </DIV>                                                     ' + CR ;
    end;


    Result := Result +
     '              </td>                                                             ' + CR +
     '            </tr>                                                               ' + CR +
     '            <tr class="CAMPOFORM">                                              ' + CR +
     '              <td class="DESCCAMPO" width="50%">                                ' + CR ;


    //Grau de instrução
    if TemAcessoCampo( sTipoUsuario, cAltDepGrauInstr, sTituloCampo ) then
    begin
      Result := Result +
       sTituloCampo                                                                       +
       '                <DIV class="CONTCAMPOD">                                   ' + CR +
       StrToName( cds.FieldByName('GRAUINSTR').AsString )                            +
       '                </DIV>                                                     ' + CR ;
    end;

    Result := Result +
     '              </td>                                                             ' + CR +
     '            </tr>                                                               ' + CR +
     '          </table>                                                              ' + CR +
     '        </td>                                                                   ' + CR +
     '        <td valign="top">                                                       ' + CR ;

    if  TemAcessoCampo( sTipoUsuario, cAltDepIsentoIRRF,          sTituloCampo )
     or TemAcessoCampo( sTipoUsuario, cAltDepIRRF,                sTituloCampo )
     or TemAcessoCampo( sTipoUsuario, cAltDepSalarioFamilia,      sTituloCampo )
     or TemAcessoCampo( sTipoUsuario, cAltDepDependenteLegal,     sTituloCampo )
     or TemAcessoCampo( sTipoUsuario, cAltDepPossuiMolestiaGrave, sTituloCampo )
     //BRUNO AZEVEDO SOL 124179 KINTANA 651468
     or TemAcessoCampo( sTipoUsuario, cAltDepIR,                  sTituloCampo )
     //or TemAcessoCampo( sTipoUsuario, cAltDepInvalido,            sTituloCampo )
     //BRUNO AZEVEDO SOL 124179 KINTANA 651468
     or TemAcessoCampo( sTipoUsuario, cAltDepDesignado,           sTituloCampo ) then
    begin
      Result := Result +
       '          <DIV class="BOXFORM" width="100%" align="left">                                  ' + CR ;

      //Isento de IRRF
      if  TemAcessoCampo( sTipoUsuario, cAltDepIsentoIRRF, sTituloCampo ) then
      begin
        Result := Result + '&nbsp; <font face="Wingdings">';
        if  cds.FieldByName('FLGISENTOIRRF').AsInteger = 1 then
          Result := Result + 'þ'
        else
          Result := Result + '¨';
        Result := Result + '</font>&nbsp; ' + sTituloCampo + ' <BR> ' + CR ;
      end;


      //Conta para imposto de renda?
      if  TemAcessoCampo( sTipoUsuario, cAltDepIRRF, sTituloCampo ) then
      begin
        Result := Result + '&nbsp; <font face="Wingdings">';
        if  cds.FieldByName('FLGCONTAIMPOSTOR').AsInteger = 1 then
          Result := Result + 'þ'
        else
          Result := Result + '¨';
        Result := Result + '</font>&nbsp; ' + sTituloCampo + ' <BR> ' + CR ;
      end;


      //Conta para salário família?
      if  TemAcessoCampo( sTipoUsuario, cAltDepSalarioFamilia, sTituloCampo ) then
      begin
        Result := Result + '&nbsp; <font face="Wingdings">';
        if  cds.FieldByName('FLGCONTASALARIOF').AsInteger = 1 then
          Result := Result + 'þ'
        else
          Result := Result + '¨';
        Result := Result + '</font>&nbsp; ' + sTituloCampo + ' <BR> ' + CR ;
      end;


      //Dependente legal?
      if  TemAcessoCampo( sTipoUsuario, cAltDepDependenteLegal, sTituloCampo ) then
      begin
        Result := Result + '&nbsp; <font face="Wingdings">';
        if  cds.FieldByName('FLGDEPLEGAL').AsInteger = 1 then
          Result := Result + 'þ'
        else
          Result := Result + '¨';
        Result := Result + '</font>&nbsp; ' + sTituloCampo + ' <BR> ' + CR ;
      end;


      //Possui moléstia grave?
      if  TemAcessoCampo( sTipoUsuario, cAltDepPossuiMolestiaGrave, sTituloCampo ) then
      begin
        Result := Result + '&nbsp; <font face="Wingdings">';
        if  cds.FieldByName('FLGMOLESTIAGRAVE').AsInteger = 1 then
          Result := Result + 'þ'
        else
          Result := Result + '¨';
        Result := Result + '</font>&nbsp; ' + sTituloCampo + ' <BR> ' + CR ;
      end;


      //Designado?
      if  TemAcessoCampo( sTipoUsuario, cAltDepDesignado, sTituloCampo ) then
      begin
        Result := Result + '&nbsp; <font face="Wingdings">';
        if  cds.FieldByName('FLGDESIGNADO').AsInteger = 1 then
          Result := Result + 'þ'
        else
          Result := Result + '¨';
        Result := Result + '</font>&nbsp; ' + sTituloCampo + ' <BR> ' + CR ;
      end;

      //BRUNO AZEVEDO SOL 124179 KINTANA 651468
      if  TemAcessoCampo( sTipoUsuario, cAltDepIR, sTituloCampo ) then
      begin
        Result := Result + '&nbsp; <font face="Wingdings">';
        if  cds.FieldByName('FLGDEPIR').AsInteger = 1 then
          Result := Result + 'þ'
        else
          Result := Result + '¨';
        if  cds.FieldByName('FLGDEPIR').AsInteger = 1 then
          Result := Result + '</font>&nbsp; ' + sTituloCampo + ' (**) <BR> ' + CR
        else
          Result := Result + '</font>&nbsp; ' + sTituloCampo + ' <BR> ' + CR ;

      end;

     { if  TemAcessoCampo( sTipoUsuario, cAltDepInvalido, sTituloCampo ) then
      begin
        Result := Result + '&nbsp; <font face="Wingdings">';
        if  cds.FieldByName('FLGDEPINVALIDO').AsInteger = 1 then
          Result := Result + 'þ'
        else
          Result := Result + '¨';
        Result := Result + '</font>&nbsp; ' + sTituloCampo + ' <BR> ' + CR ;
      end;     }
      //BRUNO AZEVEDO SOL 124179 KINTANA 651468

      Result := Result +
       '          </DIV>                                                              ' + CR ;
    end;


    Result := Result +
     '        </td>                                                                   ' + CR +
     '      </tr>                                                                     ' + CR +
     '  <tr><td> '  + CR;

     //BRUNO AZEVEDO SOL 144873 KINTANA 961354
    if TemAcessoCampo( sTipoUsuario, cAltDepIR, sTituloCampo ) and (cds.FieldByName('FLGDEPIR').AsInteger = 1) then
    Result := Result +
              '<p class="CORPO" align="left"> (**) Os dependentes para IRRF a partir de 22 anos e menores de 25 anos, apenas serão considerados para fins de Imposto de Renda, ' +
              'após o recebimento pela FUNCEF da declaração de escolaridade de instituição de ensino superior ou escola técnica. </p> '  +
              '<BR>' +
              CR;
    //BRUNO AZEVEDO SOL 144873 KINTANA 961354
  end;

     Result := Result +

     '        </td>                                                                   ' + CR +
     '      </tr>                                                                     ' + CR;


end; {DadosDependente}


//Monta a página de Exclusão de Dependentes
function PaginaExclusaoDependente( iIdPessoaLocal, iIdDependente : integer ) : String;
begin
  try

    sTitulo := TituloPagina( pDepExclusao );

    Result := Result +
     '  <table border="0" width="100%" cellpadding="0" cellspacing="0"                ' + CR +
     '         class="FORMULARIO">                                                    ' + CR +
     DadosDependente( iIdPessoaLocal, iIdDependente )                                   + CR +
     '      </tr>                                                                     ' + CR +
     '        <td colspan="2" align="center">                                         ' + CR +
     '          <br>                                                                  ' + CR ;

  if not bFlgDemo then
    Result := Result +
                '<a href="JavaScript:                                                                          ' + CR +
           //     'var decisao;'   + CR +
           //     'decisao = confirm(''O Dependente selecionado continuará na base de dados. \n' + CR +
           //                  'Somente será gravada a data fim para esse registro. Deseja continuar?'');       ' + CR +
           //     'if (decisao) {                                                                                ' + CR +
                '  EnviaForm( document.frmLnkExcluirDependente );                                              ' + CR +
           //     '} else {                                                                                       ' + CR +
           //     '  Abort;                                                                                      ' + CR +
                ' "> '                                                                                           + CR
  else
    Result := Result +
     '          <a href="JavaScript:alert(''Funcionalidade desabilitada para demonstração.'');"> ' + CR;

  Result := Result +
     '           <img src="../imagem/btnConfirmar.gif" name="btnConfirmar" border="0" ' + CR +
     '            onMouseOver="btnConfirmar.src=''../imagem/btnConfirmar_s.gif''"     ' + CR +
     '            onMouseOut="btnConfirmar.src=''../imagem/btnConfirmar.gif''"></a>   ' + CR +
     '          <a href="JavaScript:EnviaForm( document.frmLnkManutDependentes )">    ' + CR +
     '            <img src="../imagem/btnCancelar.gif" name="btnCancelar" border="0"  ' + CR +
     '            onMouseOver="btnCancelar.src=''../imagem/btnCancelar_s.gif''"       ' + CR +
     '            onMouseOut="btnCancelar.src=''../imagem/btnCancelar.gif''"></a>     ' + CR +
     '        </td>                                                                   ' + CR +
     '      </tr>                                                                     ' + CR +
     '  </table>                                                                      ' + CR +
     '  <BR>                                                                          ' + CR +
     '  <form method="POST" name="frmLnkExcluirDependente"                            ' + CR +
     '   action="../<#nomearqapl>/ExcluirDependente">                     ' + CR +
     '    <input type="hidden" name="edtIdDependente" value="' + IntToStr( iIdDependente ) + '" > ' + CR +
     '    <#hiddenfields>                                                             ' + CR +
     '  </form>                                                                       ' + CR ;

    Result := MontaPagina( pDepExclusao, Result );

  except
    On E : Exception do
    begin
      Result := TrataWebExcecoes( E );
    end;
  end;
end; {PaginaExclusaoDependente}


//Monta a página que exclui efetivamente o Dependente
function PaginaExcluirDependente( iIdPessoaLocal, iIdDependente : integer ) : String;
begin

  try

    //---------- Início da Exclusão de dependente
    cds.Close;
    cds.Data := Dependente.SelecionaDependente( iIdPessoaLocal, iIdDependente );

    Dependente.CdsDependente.Data := cds.Data;
    //BRUNO AZEVEDO SOL 124179 KINTANA 651468
    if not Dependente.CancelarDependente() then
      raise Exception.Create( sMsgCtrl );

    //if not Dependente.ExcluiDependente then
    //  raise Exception.Create( sMsgCtrl );
    //BRUNO AZEVEDO SOL 124179 KINTANA 651468
    //---------- Término da Exclusão de dependente


    //---------- Montagem da página de confirmação
    sTitulo := TituloPagina( pDepConfExclusao );

    Result := MontaPagina( pDepConfExclusao, Result );

  except
    On E : Exception do
    begin
      Result := TrataWebExcecoes( E );
    end;
  end;



end; {PaginaExcluirDependente}



//Monta a página de cancelamento de Dependentes
function PaginaCancelamentoDependente( iIdPessoaLocal, iIdDependente : integer ) : String;
begin
  try

    sTitulo := TituloPagina( pDepCancelamento );

    Result := Result +
     '  <table border="0" width="100%" cellpadding="0" cellspacing="0"                ' + CR +
     '         class="FORMULARIO">                                                    ' + CR +
     DadosDependente( iIdPessoaLocal, iIdDependente )                                   + CR +
     '      </tr>                                                                     ' + CR +
     '        <td colspan="2" align="center">                                         ' + CR +
     '          <br>                                                                  ' + CR ;

  if not bFlgDemo then
    Result := Result +
     '          <a href="JavaScript:EnviaForm( document.frmLnkCancelarDependente );">  ' + CR
  else
    Result := Result +
     '          <a href="JavaScript:alert(''Funcionalidade desabilitada para demonstração.'');"> ' + CR;

  Result := Result +
     '           <img src="../imagem/btnConfirmar.gif" name="btnConfirmar" border="0" ' + CR +
     '            onMouseOver="btnConfirmar.src=''../imagem/btnConfirmar_s.gif''"     ' + CR +
     '            onMouseOut="btnConfirmar.src=''../imagem/btnConfirmar.gif''"></a>   ' + CR +
     '          <a href="JavaScript:EnviaForm( document.frmLnkManutDependentes )">    ' + CR +
     '            <img src="../imagem/btnCancelar.gif" name="btnCancelar" border="0"  ' + CR +
     '            onMouseOver="btnCancelar.src=''../imagem/btnCancelar_s.gif''"       ' + CR +
     '            onMouseOut="btnCancelar.src=''../imagem/btnCancelar.gif''"></a>     ' + CR +
     '        </td>                                                                   ' + CR +
     '      </tr>                                                                     ' + CR +
     '  </table>                                                                      ' + CR +
     '  <BR>                                                                          ' + CR +
     '  <form method="POST" name="frmLnkCancelarDependente"                           ' + CR +
     '   action="../<#nomearqapl>/CancelarDependente">                                ' + CR +
     '    <input type="hidden" name="edtIdDependente" value="' + IntToStr( iIdDependente ) + '" > ' + CR +
     '    <#hiddenfields>                                                             ' + CR +
     '  </form>                                                                       ' + CR ;

    Result := MontaPagina( pDepCancelamento, Result );

  except
    On E : Exception do
    begin
      Result := TrataWebExcecoes( E );
    end;
  end;
end; {PaginaCancelamentoDependente}


//Monta a página que cancela efetivamente o Dependente
function PaginaCancelarDependente( iIdPessoaLocal, iIdDependente : integer ) : String;
begin

  try

    if not Dependente.CancelaDependente( iIdPessoaLocal, iIdDependente ) then
      raise Exception.Create( sMsgCtrl );

    sTitulo := TituloPagina( pDepConfCancelamento );

    Result := MontaPagina( pDepConfCancelamento, Result );

  except
    On E : Exception do
    begin
      Result := TrataWebExcecoes( E );
    end;
  end;                        

end; {PaginaCancelarDependente}


//Restaura um dependente
function PaginaRestauraDependente( iIdPessoaLocal, iIdDependente : integer ) : String;
begin
  try

    sTitulo := TituloPagina( pDepConfInclusao );

    Dependente.RestauraDependente( iIdPessoaLocal, iIdDependente );

    Result := Result +
     '  <table border="0" width="100%" cellpadding="0" cellspacing="0"         ' + CR +
     '         class="FORMULARIO">                                             ' + CR +
     DadosDependente( iIdPessoaLocal, iIdDependente )                            + CR +
     '  </table>                                                               ' + CR +
     '  <BR><BR>                                                               ' + CR ;

    Result := MontaPagina( pDepConfInclusao, Result );


  except
    On E : Exception do
    begin
      Result := TrataWebExcecoes( E );
    end;
  end;
end; {PaginaRestauraDependente}

end.
