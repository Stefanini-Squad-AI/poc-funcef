{
--------------------------------------------------------------------------------
Pendência   : SOL 174939 Kintana 1585984
Responsável : Fanuel Junior
Data        : 28/02/2012
Descrição   : A mensagem de retorno está trazendo a situação na patrocinadora,
              o correto seria a situação na fundação.
--------------------------------------------------------------------------------
Pendência   : SOL 150726 KINTANA 1099530
Responsável : BRUNO AZEVEDO
Data        : 15/06/2011
Descrição   : Criação do histórico de endereços.
--------------------------------------------------------------------------------
Pendência   : SOL 168419 Kintana 1494159
Responsável : Fanuel Junior
Data        : 28/11/2011
Descrição   : Erro ao acessar Conta
--------------------------------------------------------------------------------
Pendência   : SOL 164182 Kintana 1408644
Responsável : Fanuel Junior
Data        : 08/09/2011
Descrição   : Excluir frases nas telas "Manutenção de dependentes " e "Dados Cadastrais"
-------------------------------------------------------------------------
Pendência   : SOL 161648 Kintana 1367561
Responsável : Fanuel Junior
Data        : 12/08/2011
Descrição   : Obrigatorio preencher MOTIVO, quando marcar opção
              NÃO RECEBER MATERIAL IMPRESSO, envio de email para reativação de envio.
-------------------------------------------------------------------------
Pendência   : SOL 158033 KINTANA 1275872
Responsável : BRUNO AZEVEDO
Data        : 23/05/2011
Descrição   : Manutenção no texto da legenda de dependentes.
-------------------------------------------------------------------------
Pendência   : SOL 157264 KINTANA 1251021
Responsável : BRUNO AZEVEDO
Data        : 16/06/2011
Descrição   : Ajuste na funcionalidade de receber periódico.
-------------------------------------------------------------------------
Pendência   : SOL 158000 KINTANA 1276003
Responsável : BRUNO AZEVEDO
Data        : 23/05/2011
Descrição   : Manutenção no texto do lembrete de senha.
-------------------------------------------------------------------------
Pendência   : SOL 152167 KINTANA 1130320
Responsável : BRUNO AZEVEDO
Data        : 27/04/2011
Descrição   : Disponibilizar a opção de tributação nos planos.
-------------------------------------------------------------------------
Pendência   : SOL 152443 KINTANA 1135327
Responsável : BRUNO AZEVEDO
Data        : 07/02/2011
Descrição   : Alterado o label da funcionalidade de publicações.
-------------------------------------------------------------------------
Pendência   : SOL 151642 KINTANA 1115027
Responsável : BRUNO AZEVEDO
Data        : 27/01/2011
Descrição   : Correção ao salvar a funcionalidade de publicações.
-------------------------------------------------------------------------
Pendência   : SOL 150881 KINTANA 1099543
Responsável : BRUNO AZEVEDO
Data        : 17/01/2011
Descrição   : Trazer a funcionalidade de publicações para a tela de consulta.
-------------------------------------------------------------------------
Pendência   : SOL 141337 KINTANA 894031
Responsável : Ádler Souza
Data        : 27/09/2010
Descrição   : Incluir mensagem na tela.
-------------------------------------------------------------------------
Pendência   : SOL 140314 KINTANA 876132
Responsável : BRUNO AZEVEDO
Data        : 24/09/2010
Descrição   : Melhor apresentação dos dados de telefone.
-------------------------------------------------------------------------
Pendência   : SOL 111643 KINTANA 515405
Responsável : BRUNO AZEVEDO
Data        : 30/08/2010
Descrição   : Criação da possibilidade de receber ou não as publicações.
-------------------------------------------------------------------------
Pendência   : SOL 91655 KINTANA 394002
Responsável : BRUNO AZEVEDO
Data        : 06/07/2010
Descrição   : Criação da manutenção dos dados cadastrais (E-mail, telefone e endereço).
--------------------------------------------------------------------------------
Pendência   : SOL 91656 KINTANA 394003
Responsável : BRUNO AZEVEDO
Data        : 30/06/2010
Descrição   : Unir na mesma tela as informações de patrocinadora e planos.
--------------------------------------------------------------------------------

}
//Dados Cadastrais do Participante
unit uWebDadosCadastrais;

interface

uses SysUtils, Classes, DModAutoAtendimento, uConstPaginasCampos, JCLSysUtils,
     uCtrlFuncoesAA, uCMFileUtils, httpapp, IdSMTP, IdMessage, uCtrlMensagens,
	 uCmClientDataSet, wwQuery;

//Monta a página de Dados Cadastrais do Participante
function PaginaDadosParticipante( iIdPessoaLocal : integer ) : String;

//Monta a página de Dados do Participante na Patrocinadora
function PaginaDadosPartPatro( iIdPessoaLocal : integer; sMatricula : String = '' ) : String;//Fanuel Junior SOL168419 Kintana1494159

//Monta a página de Dados do Participante nos Planos
function PaginaDadosPartPlanos( iIdPessoaLocal : integer ) : String;

//BRUNO AZEVEDO SOL 91655 KINTANA 394002
function AlterarDadosCadastrais(pIdPessoa: Integer): String;

function SalvarDadosCadastrais(iIdPessoaLocal: Integer; Request: TWebRequest): String;

//BRUNO AZEVEDO
function CarregaHistoricoEnderecos(iIdEndereco: Integer; Request: TWebRequest): String;

function Rodape(): String;
//BRUNO AZEVEDO SOL 91655 KINTANA 394002

//BRUNO AZEVEDO SOL 111643 KINTANA 515405
procedure EnviaEMail(sDestinatario, sAssunto, sMensagem, sSituacao, sMatricula: string);
               
implementation

//Monta a página de Dados Cadastrais do Participante
function PaginaDadosParticipante( iIdPessoaLocal : integer ) : String;
var
  sTituloCampo, sAux : String;
  iSeqLegenda : integer;
  sTipoTelefone: String; //BRUNO AZEVEDO SOL 140314 KINTANA 876132
begin

  try

    sTitulo := TituloPagina( pDadosDoParticipante );

    //Dados Pessoais 
    if TemAcessoCampo( sTipoUsuario, cDadosPessoais, sTituloCampo ) then
    begin
      Result := Result +
       '<p class="CABDIV">' + sTituloCampo +' </p>                                   ' + CR +
       '<table border="0" width="100%" cellpadding="0" cellspacing="0">              ' + CR ;

      cds.Close;
      cds.Data := WebDadosCadastrais.SelecionaDadosPessoa( iIdPessoaLocal );

      if TemAcessoCampo( sTipoUsuario, cFoto, sTituloCampo ) then
        if  ( not cds.FieldByName('IDIMAGEM').IsNull )
        and ( cds.FieldByName('IDIMAGEM').AsInteger > 0 ) then
          Result := Result + '<img border="1" src="./Imagem?idimagem=' +
           cds.FieldByName('IDIMAGEM').AsString + '">';


      if TemAcessoCampo( sTipoUsuario, cNome, sTituloCampo ) then
        Result := Result +
         '  <tr>                                                                     ' + CR +
         '    <td width="20%">                                                       ' + CR +
         '      <p class="DESCCAMPO">                                                ' + CR +
         sTituloCampo                                                                  + CR +
         '      </p>                                                                 ' + CR +
         '    </td>                                                                  ' + CR +
         '    <td width="3%">                                                        ' + CR +
         '      <p class="DESCCAMPO">                                                ' + CR +
         '        :                                                                  ' + CR +
         '      </p>                                                                 ' + CR +
         '    </td>                                                                  ' + CR +
         '    <td>                                                                   ' + CR +
         '      <p class="CONTCAMPOD">                                               ' + CR +
         AnsiUppercase( cds.FieldByName('NOME').AsString )                             + CR +
         '      </p>                                                                 ' + CR +
         '    </td>                                                                  ' + CR +
         '  </tr>                                                                    ' + CR +
         '  <tr height="10"></tr>                                                    ' + CR ;


      Result := Result + IncluiCampo( cNomeDoPai,
       StrToName( cds.FieldByName('NOMEPAI').AsString ) );

      Result := Result + IncluiCampo( cNomeDaMae,
       StrToName( cds.FieldByName('NOMEMAE').AsString ) );

      Result := Result + IncluiCampo( cEstadoCivil,
       StrToName( cds.FieldByName('ESTADOCIVIL').AsString ) );

      Result := Result + IncluiCampo( cSexo,
       StrToName( cds.FieldByName('SEXO').AsString ) );

      Result := Result + IncluiCampo( cNacionalidade,
       StrToName( cds.FieldByName('NACIONALIDADE').AsString ) );

      Result := Result + IncluiCampo( cNaturalidade,
       StrToName( cds.FieldByName('NATURALIDADE').AsString ) );

      Result := Result + IncluiCampo( cDataNascimento,
       FormataDataHora( 'dd/mm/yyyy', cds.FieldByName('DATANASC').AsString ) );

      Result := Result + IncluiCampo( cDataFalecimento,
       FormataDataHora( 'dd/mm/yyyy', cds.FieldByName('DATAMORTE').AsString ) );

      Result := Result + IncluiCampo( cPossuiMolestiaGrave,
       cds.FieldByName('FLGMOLESTIAGRAVE').AsString );

      Result := Result + IncluiCampo( cInicioInvalidez,
       FormataDataHora( 'dd/mm/yyyy', cds.FieldByName('INICIOINVALIDEZ').AsString ) );

      Result := Result + IncluiCampo( cFimInvalidez,
       FormataDataHora( 'dd/mm/yyyy', cds.FieldByName('FIMINVALIDEZ').AsString ) );

      Result := Result + IncluiCampo( cIsentoDeIRRF,
       cds.FieldByName('FLGISENTOIRRF').AsString );

       //BRUNO AZEVEDO SOL 91655 KINTANA 394002
      if TemAcessoCampo( sTipoUsuario, cEMail, sTituloCampo ) then
      begin

        Result := Result + CR +
         ' <form method="POST" name="frmAltEmail" ' + CR +
         ' action="../<#nomearqapl>/AlterarDadosCadastrais">  ' + CR +
         '    <input type="hidden" name="pIdPessoa">  ' + CR +
         ' <#hiddenfields> ' + CR +
         '   <tr>                     ' + CR +
         '     <td width="20%">                   ' + CR +
         '       <p class="DESCCAMPO">            ' + CR +
         sTituloCampo                               + CR +
         '       </p>                             ' + CR +
         '     </td>                              ' + CR +
         '     <td width="3%">                    ' + CR +
         '       <p class="DESCCAMPO">            ' + CR +
         '         :                              ' + CR +
         '       </p>                             ' + CR +
         '     </td>                              ' + CR +
         '     <td>                               ' + CR +
         '       <p class="CONTCAMPO">            ' + CR +
         Trim(AnsiLowerCase( cds.FieldByName('EMAIL').AsString )) ;
         if TemAcessoCampo( sTipoUsuario, cAltEmail, sTituloCampo ) then
         begin
           Result := Result +
           ' &nbsp;&nbsp;&nbsp; <a href="JavaScript:document.frmAltEmail.pIdPessoa.value=''' +
           cds.FieldByName('IDPESSOA').AsString + '''; EnviaForm( document.frmAltEmail );"> ' + CR +
           ' <img name="btnAlterar" border="0" src="../imagem/alterar.gif" style="float: center" ' + CR +
           ' onMouseOver="btnAlterar.src=''../imagem/alterar_s.gif''" ' + CR +
           ' onMouseOut="btnAlterar.src=''../imagem/alterar.gif''"> </a> ' + CR ;
         end;
         Result := Result +
         '       </p>                             ' +
         '     </td>                              ' + CR +
         '   </tr>   </form>';
      end;
      //BRUNO AZEVEDO SOL 91655 KINTANA 394002

      cds.Close;

      Result := Result +
       '</table>                                                                     ' + CR +
       '<BR><BR><BR><BR>                                                             ' + CR ;
    end;


    //Documentos
    if TemAcessoCampo( sTipoUsuario, cDocumentos, sTituloCampo ) then
    begin
      cds.Close;
      cds.Data := WebDadosCadastrais.SelecionaDocumentos( iIdPessoaLocal );

      if not cds.IsEmpty then
      begin
        Result := Result +
         '<p class="CABDIV">' + sTituloCampo +' </p>                                   ' + CR +
         '<table border="0" width="100%" cellpadding="0" cellspacing="0">              ' + CR ;

        cds.First;
        while not cds.Eof do
        begin
          Result := Result +
           '  <tr>                                                                       ' + CR +
           '    <td width="20%">                                                         ' + CR +
           '      <p class="DESCCAMPO">                                                  ' + CR +
           cds.FieldByName('NOMEDOCUMENTO').AsString                                       + CR +
           '      </p>                                                                   ' + CR +
           '    </td>                                                                    ' + CR +
           '    <td width="3%">                                                          ' + CR +
           '      <p class="DESCCAMPO">                                                  ' + CR +
           '        :                                                                    ' + CR +
           '      </p>                                                                   ' + CR +
           '    </td>                                                                    ' + CR +
           '    <td>                                                                     ' + CR +
           '      <p class="CONTCAMPO">                                                  ' + CR +
           cds.FieldByName('NUMDOCUMENTO').AsString                                        + CR ;

          if ( trim( cds.FieldByName('ORGAO').AsString ) <> '' ) and
           ( trim( cds.FieldByName('ORGAO').AsString ) <> '000' ) then
            Result := Result + '&nbsp;&nbsp;&nbsp;<SPAN id="DESCCAMPO">Órgão:&nbsp;</SPAN>' + trim( cds.FieldByName('ORGAO').AsString );

          if trim( cds.FieldByName('CODESTADO').AsString ) <> '' then
            Result := Result + '&nbsp;&nbsp;&nbsp;<SPAN id="DESCCAMPO">Estado:&nbsp;</SPAN>' + trim( cds.FieldByName('CODESTADO').AsString );

          if not cds.FieldByName('DATAEMISSAO').IsNull then
            Result := Result + '&nbsp;&nbsp;&nbsp;<SPAN id="DESCCAMPO">Emissão:&nbsp;</SPAN>' +
             FormataDataHora( 'dd/MM/yyyy', cds.FieldByName('DATAEMISSAO').AsString ) ;

          if not cds.FieldByName('DATAVALIDADE').IsNull then
            Result := Result + '&nbsp;&nbsp;&nbsp;<SPAN id="DESCCAMPO">Validade:&nbsp;</SPAN>' +
             FormataDataHora( 'dd/MM/yyyy', cds.FieldByName('DATAVALIDADE').AsString ) ;

          Result := Result +
           '      </p>                                                                 ' + CR +
           '    </td>                                                                  ' + CR +
           '  </tr>                                                                    ' + CR ;

          cds.Next;
        end;

        Result := Result +
         '</table>                                                                     ' + CR +
         '<BR><BR><BR><BR>                                                             ' + CR ;

      end;
      cds.Close;
    end;


    //Telefones
    if TemAcessoCampo( sTipoUsuario, cTelefones, sTituloCampo ) then
    begin
      cds.Close;
      cds.Data := WebDadosCadastrais.SelecionaTelefones( iIdPessoaLocal );

      if TemAcessoPagina( sTipoUsuario, pManutTelefones, sAux ) then
        Result := Result + '<form method="POST" name="frmAltTelefones" ' +
         ' action="../<#nomearqapl>/ManutTelefones"> ' +
         ' <#hiddenfields> ' +
         ' <a href="JavaScript:EnviaForm( document.frmAltTelefones );" > ' +
         ' <img name="btnAlterar" border="0" src="../imagem/alterar.gif" style="float: right" ' +
         ' onMouseOver="btnAlterar.src=''../imagem/alterar_s.gif''" ' +
         ' onMouseOut="btnAlterar.src=''../imagem/alterar.gif''"> </a> </form>';

      if not cds.IsEmpty then
      begin
        Result := Result +
         '<p class="CABDIV">' + sTituloCampo + ' </p>                   ' + CR ;

        cdsHTMLColumns.Close;
        cdsHTMLColumns.CreateDataSet;

        IncluiColuna( cLogradouroTelefone, 15, 'left' );
        IncluiColuna( cDDI,                10, 'left' );
        IncluiColuna( cDDD,                10, 'left' );
        IncluiColuna( cNumero,             15, 'left' );

        //BRUNO AZEVEDO SOL 140314 KINTANA 876132
        IncluiColuna( 0                  , 20, 'left', 'Tipo');
        //IncluiColuna( cTelCom,             10, 'left' );
        //IncluiColuna( cTelPar,             10, 'left' );
        //IncluiColuna( cTelFax,             10, 'left' );
        //IncluiColuna( cTelCel,             10, 'left' );
        //IncluiColuna( cTelRec,             10, 'left' );

        Result := Result + HTMLTableHeader;

        cds.First;
        while not cds.Eof do
        begin
          //BRUNO AZEVEDO SOL 140314 KINTANA 876132
          sTipoTelefone := '';
          if (Pos( 'C', cds.FieldByName('TIPO').AsString ) > 0) then begin
            sTipoTelefone := sTipoTelefone + 'Comercial / ';
          end;

          if (Pos( 'P', cds.FieldByName('TIPO').AsString ) > 0) then begin
            sTipoTelefone := sTipoTelefone + 'Particular / ';
          end;

          if (Pos( 'F', cds.FieldByName('TIPO').AsString ) > 0) then begin
            sTipoTelefone := sTipoTelefone + 'Fax / ';
          end;

          if (Pos( 'L', cds.FieldByName('TIPO').AsString ) > 0) then begin
            sTipoTelefone := sTipoTelefone + 'Celular / ';
          end;

          if (Pos( 'R', cds.FieldByName('TIPO').AsString ) > 0) then begin
            sTipoTelefone := sTipoTelefone + 'Recado / ';
          end;
          sTipoTelefone := Copy(sTipoTelefone, 1, Length(sTipoTelefone) - 3);

          PreencheColuna( cLogradouroTelefone, trim( cds.FieldByName('LOGRADOURO').AsString ) );
          PreencheColuna( cDDD, trim( cds.FieldByName('DDD').AsString ) );
          PreencheColuna( cDDI, trim( cds.FieldByName('DDI').AsString ) );
          PreencheColuna( cNumero, trim( cds.FieldByName('NUMERO').AsString ) );

          PreencheColuna( 0, sTipoTelefone );
          //PreencheColuna( cTelCom, Iff( Pos('C', cds.FieldByName('TIPO').AsString ) > 0, 'S', 'N' ) );
          //PreencheColuna( cTelPar, Iff( Pos('P', cds.FieldByName('TIPO').AsString ) > 0, 'S', 'N' ) );
          //PreencheColuna( cTelFax, Iff( Pos('F', cds.FieldByName('TIPO').AsString ) > 0, 'S', 'N' ) );
          //PreencheColuna( cTelCel, Iff( Pos('L', cds.FieldByName('TIPO').AsString ) > 0, 'S', 'N' ) );
          //PreencheColuna( cTelRec, Iff( Pos('R', cds.FieldByName('TIPO').AsString ) > 0, 'S', 'N' ) );

          //BRUNO AZEVEDO SOL 140314 KINTANA 876132

          Result := Result + HTMLTableRow;
          cds.Next;
        end;

        Result := Result + HTMLTableFooter + '<BR><BR><BR><BR>' + CR ;

        cdsHTMLColumns.Close;
      end;

      cds.Close;
    end;


    //Endereços
    if TemAcessoCampo( sTipoUsuario, cEnderecos, sTituloCampo ) then
    begin
      cds.Close;
      cds.Data := EndPess.SelecionaEnderecosPorPessoa( iIdPessoaLocal );
   
      if not cds.IsEmpty then
      begin

        if TemAcessoPagina( sTipoUsuario, pManutEnderecos, sAux ) then
          Result := Result + '<form method="POST" name="frmAltEnderecos" ' +
           ' action="../<#nomearqapl>/ManutEnderecos"> ' +
           ' <#hiddenfields> ' +
           ' <a href="JavaScript:EnviaForm( document.frmAltEnderecos );" > ' +
           ' <img name="btnAlterar" border="0" src="../imagem/alterar.gif" style="float: right" ' +
           ' onMouseOver="btnAlterar.src=''../imagem/alterar_s.gif''" ' +
           ' onMouseOut="btnAlterar.src=''../imagem/alterar.gif''"> </a> </form>';

        Result := Result +
         '<p class="CABDIV">' + sTituloCampo + ' </p>                   ' + CR ;

        cdsHTMLColumns.Close;
        cdsHTMLColumns.CreateDataSet;
                                                                                          
        IncluiColuna( cTipoEndereco, 5, 'left' ); //BRUNO AZEVEDO SOL 91655 KINTANA 394002
        IncluiColuna( cDescricaoEndereco, 5, 'left' );
        IncluiColuna( cLogradouro,        5, 'left' );
        IncluiColuna( cNumeroEndereco,     5, 'left' );
        IncluiColuna( cComplemento,       5, 'left' );
        IncluiColuna( cBairro,            5, 'left' );
        IncluiColuna( cCidade,            5, 'left' );
        IncluiColuna( cEstado,             5, 'left' );
        IncluiColuna( cPais,              5, 'left' );
        IncluiColuna( cCEP,                5, 'left' );
        IncluiColuna( -1,                  5, 'left' ,'Históricos');

        Result := Result + HTMLTableHeader;

        cds.First;
        while not cds.Eof do
        begin
          //BRUNO AZEVEDO SOL 91655 KINTANA 394002
          PreencheColuna( cTipoEndereco, StrToName( trim( cds.FieldByName('TIPOENDERECO').AsString ) ) );
          //BRUNO AZEVEDO SOL 91655 KINTANA 394002
          PreencheColuna( cDescricaoEndereco, StrToName( trim( cds.FieldByName('TIPOEND').AsString ) ) );
          PreencheColuna( cLogradouro, StrToName( trim( cds.FieldByName('LOGRADOURO').AsString ) ) );
          PreencheColuna( cNumeroEndereco, trim( cds.FieldByName('NUMERO').AsString ) );
          PreencheColuna( cComplemento, StrToName( trim( cds.FieldByName('COMPLEMENTO').AsString ) ) );
          PreencheColuna( cBairro, StrToName( trim( cds.FieldByName('BAIRRO').AsString ) ) );
          PreencheColuna( cCidade, StrToName( trim( cds.FieldByName('CIDADE').AsString ) ) );
          PreencheColuna( cEstado, trim( cds.FieldByName('CODESTADO').AsString ) );
          PreencheColuna( cPais, trim( cds.FieldByName('PAIS').AsString ) );
          PreencheColuna( cCEP, trim( cds.FieldByName('CEP').AsString ) );
          PreencheColuna( -1  , '<p align="left"><a href="JavaScript:document.frmHistEnd.IdEndereco.value=''' +
         cds.FieldByName('IDENDERECO').AsString + ''';JavaScript:EnviaForm( document.frmHistEnd );" >Histórico</a></p>');
         //Fanuel Junior SOL150726

          Result := Result + HTMLTableRow;
          cds.Next;
        end;

        Result := Result + HTMLTableFooter + CR ;

        //BRUNO AZEVEDO
        //Result := Result + '<p align="right"><a href="frmLnkExclusaoTempoServico.pIdTempoServico.value=''' +
      //cds.FieldByName('IDENDERECO').AsString + ''';JavaScript:EnviaForm( document.frmHistEnd );" >Histórico</a></p>';

        Result := Result + '<form method="POST" name="frmHistEnd" ' +
                           ' action="../<#nomearqapl>/HistoricoEnderecos"> ' +
                           ' <input type="hidden" name="IdEndereco" > ' + CR +
                           ' <#hiddenfields> ' + CR +
                           ' </form> ';

        Result := Result + '<BR><BR><BR>' + CR ;
        //BRUNO AZEVEDO

        cdsHTMLColumns.Close;
      end;

      cds.Close;
    end;


    //Dependentes
    if TemAcessoCampo( sTipoUsuario, cDependentes, sTituloCampo ) then
    begin
      cds.Close;
      cds.Data := Dependente.SelecionaDependentes( iIdPessoaLocal );

      if not cds.IsEmpty then
      begin

        if TemAcessoPagina( sTipoUsuario, pManutDependentes, sAux ) then
          Result := Result + '<form method="POST" name="frmAltDependentes" ' +
           ' action="../<#nomearqapl>/ManutDependentes"> ' +
           ' <#hiddenfields> ' +
           ' <a href="JavaScript:EnviaForm( document.frmAltDependentes );" > ' +
           ' <img name="btnAlterar" border="0" src="../imagem/alterar.gif" style="float: right" ' +
           ' onMouseOver="btnAlterar.src=''../imagem/alterar_s.gif''" ' +
           ' onMouseOut="btnAlterar.src=''../imagem/alterar.gif''"> </a> </form>';

        Result := Result +
         '<p class="CABDIV">' + sTituloCampo + ' </p>                   ' + CR ;

        cdsHTMLColumns.Close;
        cdsHTMLColumns.CreateDataSet;

        IncluiColuna( cNomeDependente,          23, 'left' );
        IncluiColuna( cDepNomePai,              13, 'left' );
        IncluiColuna( cDepNomeMae,              13, 'left' );
        IncluiColuna( cParentesco,               9, 'left' );
        IncluiColuna( cSexoDependente,           4, 'left' );
        IncluiColuna( cDepGrauInstr,            10, 'left' );
        IncluiColuna( cEstadoCivilDependente,    9, 'left' );
        IncluiColuna( cDataNascDependente,       7, 'left' );

        iSeqLegenda := 1;
        if TemAcessoCampo( sTipoUsuario, cDepIsentoIRRF, sAux ) then
          IncluiColuna( cDepIsentoIRRF,          2, 'center', '(' + IntToStr( IncAfter( iSeqLegenda ) ) + ')' );
        if TemAcessoCampo( sTipoUsuario, cDepIRRF, sAux ) then
          IncluiColuna( cDepIRRF,                2, 'center', '(' + IntToStr( IncAfter( iSeqLegenda ) ) + ')' );
        if TemAcessoCampo( sTipoUsuario, cDepSalarioFamilia, sAux ) then
          IncluiColuna( cDepSalarioFamilia,      2, 'center', '(' + IntToStr( IncAfter( iSeqLegenda ) ) + ')' );
        if TemAcessoCampo( sTipoUsuario, cDepDependenteLegal, sAux ) then
          IncluiColuna( cDepDependenteLegal,     2, 'center', '(' + IntToStr( IncAfter( iSeqLegenda ) ) + ')' );
        if TemAcessoCampo( sTipoUsuario, cDepPossuiMolestiaGrave, sAux ) then
          IncluiColuna( cDepPossuiMolestiaGrave, 2, 'center', '(' + IntToStr( IncAfter( iSeqLegenda ) ) + ')' );
        if TemAcessoCampo( sTipoUsuario, cDepDesignado, sAux ) then
          IncluiColuna( cDepDesignado,           2, 'center', '(' + IntToStr( IncAfter( iSeqLegenda ) ) + ')' );

        Result := Result + HTMLTableHeader;

        cds.First;
        while not cds.Eof do
        begin

          PreencheColuna( cNomeDependente,         StrToName( trim( cds.FieldByName('NOME').AsString ) ) );
          PreencheColuna( cDepNomePai,             StrToName( trim( cds.FieldByName('NOMEPAI').AsString ) ) );
          PreencheColuna( cDepNomeMae,             StrToName( trim( cds.FieldByName('NOMEMAE').AsString ) ) );
          PreencheColuna( cParentesco,             StrToName( trim( cds.FieldByName('DESCRICAO').AsString ) ) );
          PreencheColuna( cSexoDependente,         trim( cds.FieldByName('SEXO').AsString ) );
          PreencheColuna( cDepGrauInstr,           StrToName( trim( cds.FieldByName('GRAUINSTR').AsString ) ) );
          PreencheColuna( cEstadoCivilDependente,  StrToName( trim( cds.FieldByName('ESTADOCIVIL').AsString ) ) );
          PreencheColuna( cDataNascDependente,     FormataDataHora( 'dd/mm/yy', cds.FieldByName('DATANASC').AsString ) );
          PreencheColuna( cDepIsentoIRRF,          Iff( cds.FieldByName('FLGISENTOIRRF').AsInteger    = 1, 'S', 'N' ) );
          PreencheColuna( cDepIRRF,                Iff( cds.FieldByName('FLGCONTAIMPOSTOR').AsInteger = 1, 'S', 'N' ) );
          PreencheColuna( cDepSalarioFamilia,      Iff( cds.FieldByName('FLGCONTASALARIOF').AsInteger = 1, 'S', 'N' ) );
          PreencheColuna( cDepDependenteLegal,     Iff( cds.FieldByName('FLGDEPLEGAL').AsInteger      = 1, 'S', 'N' ) );
          PreencheColuna( cDepPossuiMolestiaGrave, Iff( cds.FieldByName('FLGMOLESTIAGRAVE').AsInteger = 1, 'S', 'N' ) );
          PreencheColuna( cDepDesignado,           Iff( cds.FieldByName('FLGDESIGNADO').AsInteger     = 1, 'S', 'N' ) );

          Result := Result + HTMLTableRow;
          cds.Next;
        end;

        Result := Result + HTMLTableFooter;

        Result := Result + '<BR>' + CR ;

        cdsHTMLColumns.Close;

        if  TemAcessoCampo( sTipoUsuario, cDepIsentoIRRF,          sTituloCampo )
         or TemAcessoCampo( sTipoUsuario, cDepIRRF,                sTituloCampo )
         or TemAcessoCampo( sTipoUsuario, cDepSalarioFamilia,      sTituloCampo )
         or TemAcessoCampo( sTipoUsuario, cDepDependenteLegal,     sTituloCampo )
         or TemAcessoCampo( sTipoUsuario, cDepPossuiMolestiaGrave, sTituloCampo )
         or TemAcessoCampo( sTipoUsuario, cDepDesignado,           sTituloCampo ) then
        begin
          iSeqLegenda := 1;

          Result := Result +
            '<p align="right">                                    ' + CR +
            '<table class="LEGENDA" width="250">                  ' + CR +
            '  <tr>                                               ' + CR +
            '    <td class="LEGCAB" COLSPAN="2">                  ' + CR +
            '      Legenda - Dependentes (*)                      ' + CR +
            '    </td>                                            ' + CR + // Ádler Souza - SOL 141337 KTN 894031
            '  </tr>                                              ' + CR ;

          if TemAcessoCampo( sTipoUsuario, cDepIsentoIRRF, sTituloCampo ) then
            Result := Result +
              '  <tr>                                               ' + CR +
              '    <td class="LEGCONT" width="15%" align="center">  ' + CR +
              '      (' + IntToStr( IncAfter( iSeqLegenda ) ) + ')  ' + CR +
              '    </td>                                            ' + CR +
              '    <td class="LEGCONT" align="left">                ' + CR +
              sTituloCampo                                            + CR +
              '    </td>                                            ' + CR +
              '  </tr>                                              ' + CR ;

          if TemAcessoCampo( sTipoUsuario, cDepIRRF, sTituloCampo ) then
            Result := Result +
              '  <tr>                                               ' + CR +
              '    <td class="LEGCONT" width="15%" align="center">  ' + CR +
              '      (' + IntToStr( IncAfter( iSeqLegenda ) ) + ')  ' + CR +
              '    </td>                                            ' + CR +
              '    <td class="LEGCONT" align="left">                ' + CR +
              sTituloCampo                                            + CR +
              '    </td>                                            ' + CR +
              '  </tr>                                              ' + CR ;


          if TemAcessoCampo( sTipoUsuario, cDepSalarioFamilia, sTituloCampo ) then
            Result := Result +
              '  <tr>                                               ' + CR +
              '    <td class="LEGCONT" width="15%" align="center">  ' + CR +
              '      (' + IntToStr( IncAfter( iSeqLegenda ) ) + ')  ' + CR +
              '    </td>                                            ' + CR +
              '    <td class="LEGCONT" align="left">                ' + CR +
              sTituloCampo                                            + CR +
              '    </td>                                            ' + CR +
              '  </tr>                                              ' + CR ;

          if TemAcessoCampo( sTipoUsuario, cDepDependenteLegal, sTituloCampo ) then
            Result := Result +
              '  <tr>                                               ' + CR +
              '    <td class="LEGCONT" width="15%" align="center">  ' + CR +
              '      (' + IntToStr( IncAfter( iSeqLegenda ) ) + ')  ' + CR +
              '    </td>                                            ' + CR +
              '    <td class="LEGCONT" align="left">                ' + CR +
              sTituloCampo                                            + CR +
              '    </td>                                            ' + CR +
              '  </tr>                                              ' + CR ;

          if TemAcessoCampo( sTipoUsuario, cDepPossuiMolestiaGrave, sTituloCampo ) then
            Result := Result +
              '  <tr>                                               ' + CR +
              '    <td class="LEGCONT" width="15%" align="center">  ' + CR +
              '      (' + IntToStr( IncAfter( iSeqLegenda ) ) + ')  ' + CR +
              '    </td>                                            ' + CR +
              '    <td class="LEGCONT" align="left">                ' + CR +
              sTituloCampo                                            + CR +
              '    </td>                                            ' + CR +
              '  </tr>                                              ' + CR ;

          if TemAcessoCampo( sTipoUsuario, cDepDesignado, sTituloCampo ) then
            Result := Result +
              '  <tr>                                               ' + CR +
              '    <td class="LEGCONT" width="15%" align="center">  ' + CR +
              '      (' + IntToStr( IncAfter( iSeqLegenda ) ) + ')  ' + CR +
              '    </td>                                            ' + CR +
              '    <td class="LEGCONT" align="left">                ' + CR +
              sTituloCampo                                            + CR +
              '    </td>                                            ' + CR +
              '  </tr>                                              ' + CR ;

          Result := Result +
            '</table>                                               ' + CR +
            '</p>                                                   ' ;
        end;


        // Ádler Souza - SOL 141337 KTN 894031
        //BRUNO AZEVEDO SOL 158033 KINTANA 1275872
        // Fanuel Junior SOL164182 Kintana1408644 
        //Result := Result +
        //          '<p class="CORPO" align="left"> (*) As informações são válidas somente para aposentados e pensionistas. </p> '  +
        //          '<BR><BR>' +
        //          CR;
        // Fim - Ádler Souza - SOL 141337 KTN 894031

      end;
      cds.Close;
    end;


   //Conta bancária
    if TemAcessoCampo( sTipoUsuario, cContasBancarias, sTituloCampo ) then
    begin
      cds.Close;
      cds.Data := WebDadosCadastrais.SelecionaContasBancarias( iIdPessoaLocal );

      if not cds.IsEmpty then
      begin
        Result := Result +
         '<p class="CABDIV">' + sTituloCampo + ' </p>                   ' + CR ;

        cdsHTMLColumns.Close;
        cdsHTMLColumns.CreateDataSet;

        IncluiColuna( cNumBanco,          10, 'left' );
        IncluiColuna( cBanco,             20, 'left' );
        IncluiColuna( cNumAgencia,        10, 'left' );
        IncluiColuna( cAgencia,           20, 'left' );
        IncluiColuna( cContaCorrente,     20, 'left' );
        IncluiColuna( cContaPreferencial, 20, 'left' );        

        Result := Result + HTMLTableHeader;

        cds.First;
        while not cds.Eof do
        begin
          PreencheColuna( cNumBanco, trim( cds.FieldByName('NUMBANCO').AsString ) );
          PreencheColuna( cBanco, StrToName( trim( cds.FieldByName('BANCO').AsString ) ) );
          PreencheColuna( cNumAgencia, trim( cds.FieldByName('NUMAGENCIA').AsString ) );
          PreencheColuna( cAgencia, StrToName( trim( cds.FieldByName('AGENCIA').AsString ) ) );
          PreencheColuna( cContaCorrente, trim( cds.FieldByName('CONTACORRENTE').AsString ) );
          PreencheColuna( cContaPreferencial, trim( cds.FieldByName('CONTAPREF').AsString ) );

          Result := Result + HTMLTableRow;
          cds.Next;
        end;

        Result := Result + HTMLTableFooter + '<BR><BR>' + CR ;

        cdsHTMLColumns.Close;
      end;

      cds.Close;
    end;

    //BRUNO AZEVEDO SOL 150881 KINTANA 1099543
    //NÃO RECEBER PERIÓDICO
    if TemAcessoCampo( sTipoUsuario, cAltNaoRecebPeriodico, sTituloCampo ) then
    begin       
      cds.Close;
      cds.Data := WebDadosCadastrais.SelecionaDadosPessoa( iIdPessoaLocal );
      //Fanuel Junior SOL161648 Kintana1367561
      sJavaScript :=
       'function Motivo() {                                                                                ' + CR +
       '   document.frmLnkAlteracaoDadosCadastrais.edtMotivo.disabled = (document.frmLnkAlteracaoDadosCadastrais.edtMotivo.disabled) ? 0 : 1; ' + CR +
       '   document.frmLnkAlteracaoDadosCadastrais.edtMotivo.value = '''';                                 ' + CR +
       '   document.frmLnkAlteracaoDadosCadastrais.edtMotivo.focus;                                        ' + CR +
       '}                                                                                                  ' + CR +
       ' function ConfirmaDadosCadastrais( )                                                     ' + CR +
       ' {                                                                                       ' + CR +
       '    if ((document.frmLnkAlteracaoDadosCadastrais.edtMotivo.value == '''') && (document.frmLnkAlteracaoDadosCadastrais.chkNaoReceberPeriodico[1].checked ))                  ' + CR +
     //'    if ( document.frmLnkAlteracaoDadosCadastrais.edtMotivo.value == '''' )                  ' + CR +
       '     {                                                                                   ' + CR +
       '         alert(''É obrigatório informar o motivo de desistência do envio de periódicos.'');  ' + CR +
       '         exit;                                                                           '  + CR +
       '     }                                                                                  '   + CR +

       '   EnviaForm( document.frmLnkAlteracaoDadosCadastrais );                         ' + CR +
       ' }                                                                               ' + CR;

      Result := Result +
       '  <form method="POST" name="frmLnkAlteracaoDadosCadastrais"                      ' + CR +
       '   action="../<#nomearqapl>/SalvarDadosCadastrais">                              ' + CR +
       '  <input type="hidden" name="bReceberPeriodicos" value="1"                       ' + CR +
       '    <table border="0" width="100%" cellpadding="0" cellspacing="0"               ' + CR +
       '     >                                                                           ' + CR +
       '      <tr>                                                                       ' + CR +
       '        <td width="75%">                                                         ' + CR +
       '          <table class="LEGENDA" border="0" width="100%" cellpadding="0" cellspacing="0">        ' + CR +
       '            <tr>                                                                 ' + CR +
       '              <td class="LEGCAB" COLSPAN="2">                                    ' + CR +
       '                Controle de Periódicos                                           ' + CR +
       '              </td>                                                              ' + CR +
       '            </tr>                                                                ' + CR +
       //BRUNO AZEVEDO SOL 157264 KINTANA 1251021
       '            <tr >                                                                ' + CR +
       '              <td class="DESCCAMPO">                                             ' + CR +
       '              &nbsp;&nbsp;&nbsp;&nbsp;Receber material impresso (revista e relatório anual).</td>    ' + CR +
       '            </tr>                                                                ' + CR +
       '            <tr >                                                                ' + CR +
       '            <br>                                                                 ' + CR +
       '              <td class="DESCCAMPO">                                             ' + CR +
       '              &nbsp;&nbsp;&nbsp;<input type="radio" name="chkNaoReceberPeriodico" value="S"';
       if cds.FieldByName('NAORECEBERPERIODICO').AsString <> 'N' then Result := Result + ' checked >&nbsp;&nbsp;Sim</td>' else Result := Result + '>&nbsp;&nbsp;Sim</td>' + CR ;
       Result := result + '            </tr>                                                                ' + CR +
       '            <tr>                                                                 ' + CR +
       '              <td class="DESCCAMPO">                                             ' + CR +
       '              &nbsp;&nbsp;&nbsp;<input type="radio" name="chkNaoReceberPeriodico" value="N"';
       if cds.FieldByName('NAORECEBERPERIODICO').AsString = 'N' then Result := Result + ' checked >&nbsp;&nbsp;Não</td>' else Result := Result + '>&nbsp;&nbsp;Não</td>' + CR ;
       Result := result + '          </tr>                                                                  ' + CR +
       '          <BR>                                                                   ' + CR +
       '            <tr class="CAMPOFORM">                                               ' + CR +
       '              <td class="DESCCAMPO" >                                            ' + CR +
       '              &nbsp;&nbsp;&nbsp;                                                 ' + CR +
       '              Motivo <br>                                                        ' + CR +
       '              &nbsp;&nbsp;&nbsp;                                                 ' + CR +
       '              <input type="text" name="edtMotivo" size="139" class="TEXT"        ' + CR +
       '               value="' + cds.FieldByName('MOTIVO').AsString + '"''>              ' + CR;
       //if cds.FieldByName('NAORECEBERPERIODICO').AsString = 'S' then Result := Result + ' >' else Result := Result + ' disabled="true"> ';
       Result := Result +' </td>                                                         ' + CR +
       //BRUNO AZEVEDO SOL 157264 KINTANA 1251021
       '          </tr>                                                                  ' + CR +
       '        </td>                                                                    ' + CR +
       '      </tr>                                                                      ' + CR +
       '      <tr>                                                                       ' + CR +
       '        <td colspan="1" align="center">                                          ' + CR +
       '          <a href="JavaScript:ConfirmaDadosCadastrais();">                          ' + CR +
       '           <img src="../imagem/btnConfirmar.gif" name="btnConfirmar" border="0"  ' + CR +
       '            onMouseOver="btnConfirmar.src=''../imagem/btnConfirmar_s.gif''"      ' + CR +
       '            onMouseOut="btnConfirmar.src=''../imagem/btnConfirmar.gif''"></a>    ' + CR +
       '        </td>                                                                    ' + CR +
       '      </tr>                                                                      ' + CR +
       '    </table>                                                                     ' + CR +
       '    <#hiddenfields>                                                              ' + CR +
       '  </form>                                                                      ' + CR ;
       //BRUNO AZEVEDO SOL 150881 KINTANA 1099543
    end;

    cds.Close;

    Result := MontaPagina( pDadosDoParticipante, Result );

  except
    On E : Exception do
    begin
      Result := TrataWebExcecoes( E );
    end;
  end;

end; {PaginaDadosParticipante}



//Monta a página de Dados do Participante na Patrocinadora
function PaginaDadosPartPatro( iIdPessoaLocal : integer; sMatricula : String = '' ) : String;
var
  iIdPessJurLocal : integer;
begin

  try

    sTitulo := TituloPagina( pParticipanteNaPatrocinadora );

    cds.Close;
    cds.Data := WebDadosCadastrais.SelecionaMaxAdmissao( iIdTitular );
    iIdPessJurLocal := cds.FieldByName('IDPESSJUR').AsInteger;

    cds.Close;
    cds.Data := WebDadosCadastrais.SelecionaPartPatro( iIdTitular, iIdPessJurLocal, sMatricula );//Fanuel Junior SOL168419 Kintana1494159

    Result := Result +
     '<p class="CABDIV">' + cds.FieldByName('PATROCINADORA').AsString + ' </p>     ' + CR +
     '<table border="0" width="100%" cellpadding="0" cellspacing="0">              ' + CR ;

    Result := Result + IncluiCampo( cFilial,
     UpperCase( cds.FieldByName('FILIAL').AsString ) );
 
    Result := Result + IncluiCampo( cMatricula,
     trim( cds.FieldByName('MATRICULA').AsString ) );

    Result := Result + IncluiCampo( cSituacaoDoPartNaPatro,
     StrToName( trim( cds.FieldByName('SITUACAO').AsString ) ) );

    Result := Result + IncluiCampo( cVinculacao,
     trim( cds.FieldByName('VINCULAFUNC').AsString ) );

    Result := Result + IncluiCampo( cCentroDeCusto,
     StrToName( trim( cds.FieldByName('CENTROCUSTO').AsString ) ) );

    Result := Result + IncluiCampo( cCargo,
     StrToName( trim( cds.FieldByName('CARGO').AsString ) ) );

    Result := Result + IncluiCampo( cSalario,
     FormatFloat( '#,##0.00', cds.FieldByName('SALTOTAL').AsFloat ) );

    Result := Result + IncluiCampo( cDataAdmissao,
     FormataDataHora( 'dd/MM/yyyy', cds.FieldByName('DATAADMISSAO').AsString ) );

    Result := Result + IncluiCampo( cDataDemissao,
     FormataDataHora( 'dd/MM/yyyy', cds.FieldByName('DATADEMISSAO').AsString ) );

    Result := Result + IncluiCampo( cDataReadmissao,
     FormataDataHora( 'dd/MM/yyyy', cds.FieldByName('DATAREADMISSAO').AsString ) );

    Result := Result + IncluiCampo( cOrgaoSetor,
     trim( cds.FieldByName('ORGAO').AsString ) );

    Result := Result + IncluiCampo( cTempoTotalDeServAnterior,
     IntToStr( cds.FieldByName('TEMPOSERVANTERIOR').AsInteger ), False );

    Result := Result + IncluiCampo( cTempoTotalNaoCreditado,
     IntToStr( cds.FieldByName('TEMPONAOCREDITADO').AsInteger ), False );

    Result := Result +
     '</table>                                                                     ' + CR ;

    cds.Close;
    cdsHTMLColumns.Close;

    //BRUNO AZEVEDO SOL 91656 KINTANA 394003
    cds.Close;
    cds.Data := WebDadosCadastrais.SelecionaPartPlano( iIdTitular );
   
    while not cds.Eof do
    begin
      Result := Result + '<BR><BR><BR><BR>';

      Result := Result +
         '<p class="CABDIV">' + cds.FieldByName('PLANO').AsString + ' </p>                    ' + CR +
         '<table border="0" width="100%" cellpadding="0" cellspacing="0">              ' + CR ;

      Result := Result + IncluiCampo( cSituacaoDoPartNoPlano,
       StrToName( trim( cds.FieldByName('SITPART').AsString ) ), True, 40 );

      Result := Result + IncluiCampo( cSituacaoNoPlano,
       StrToName( trim( cds.FieldByName('SITPLANO').AsString ) ), True, 40 );

      Result := Result + IncluiCampo( cInscricao,
       trim( cds.FieldByName('INSCRICAONUMERO').AsString ), True, 40 );

      Result := Result + IncluiCampo( cDataInscricao,
       FormataDataHora( 'dd/MM/yyyy', cds.FieldByName('INSCRICAODATA').AsString ), True, 40 );

      Result := Result + IncluiCampo( cDataRequerimento,
       FormataDataHora( 'dd/MM/yyyy', cds.FieldByName('REQUERIMENTODATA').AsString ), True, 40 );

      Result := Result + IncluiCampo( cDataCancelamento,
       FormataDataHora( 'dd/MM/yyyy', cds.FieldByName('DATACANCELAMENTO').AsString ), True, 40 );

      Result := Result + IncluiCampo( cTipoDeInscricao,
       StrToName( trim( cds.FieldByName('INSCRICAOTIPO').AsString ) ), True, 40 );

      Result := Result + IncluiCampo( cSalarioNaInscricao,
       FormatFloat( '#,##0.00', cds.FieldByName('SALINSCRICAO').AsFloat ), False, 40 );

      Result := Result + IncluiCampo( cSituacaoEspecial,
       StrToName( trim( cds.FieldByName('FLGFITESPECIAL').AsString ) ), True, 40 );

      Result := Result + IncluiCampo( cDtInicioDeManutencao,
       FormataDataHora( 'dd/MM/yyyy', cds.FieldByName('DATAINICIOMANUT').AsString ), True, 40 );

	  //BRUNO AZEVEDO SOL 152167 KINTANA 1130320
      Result := Result +
                         '  <tr>                                         ' + CR +
                         '    <td width="10%">                           ' + CR +
                         '      <p class="DESCCAMPO">                    ' + CR +
                         '        Opção de Tributação                    ' + CR +
                         '      </p>                                     ' + CR +
                         '    </td>                                      ' + CR +
                         '    <td width="3%">                            ' + CR +
                         '      <p class="DESCCAMPO">                    ' + CR +
                         '        :                                      ' + CR +
                         '      </p>                                     ' + CR +
                         '    </td>                                      ' + CR +
                         '    <td>                                       ' + CR +
                         '      <p class="CONTCAMPO">                    ' + CR +
                         cds.FieldByName('OPCAOIR').AsString        + CR +
                         '      </p>                                     ' + CR +
                         '    </td>                                      ' + CR +
                         '  </tr>                                        ' + CR ;
      //BRUNO AZEVEDO SOL 152167 KINTANA 1130320

      Result := Result +
       '</table>                                                                   ' + CR ;

      cds.Next;
    end;
    //BRUNO AZEVEDO SOL 91656 KINTANA 394003

    cds.Close;
    cdsHTMLColumns.Close;

    Result := MontaPagina( pParticipanteNaPatrocinadora, Result );

  except
    On E : Exception do
    begin
      Result := TrataWebExcecoes( E );
    end;
  end;

end; {PaginaDadosPartPatro}



//Monta a página de Dados do Participante nos Planos
function PaginaDadosPartPlanos( iIdPessoaLocal : integer ) : String;
var
  bPrimeiro : Boolean;
begin

  try

    sTitulo := TituloPagina( pParticipanteNosPlanos );

    cds.Close;
    cds.Data := WebDadosCadastrais.SelecionaPartPlano( iIdTitular );

    bPrimeiro := True;

    while not cds.Eof do
    begin
      if bPrimeiro then
        bPrimeiro := False
      else
        Result := Result + '<BR><BR><BR><BR>';

      Result := Result +
         '<p class="CABDIV">' + cds.FieldByName('PLANO').AsString + ' </p>                    ' + CR +
         '<table border="0" width="100%" cellpadding="0" cellspacing="0">              ' + CR ;

      Result := Result + IncluiCampo( cSituacaoDoPartNoPlano,
       StrToName( trim( cds.FieldByName('SITPART').AsString ) ), True, 40 );

      Result := Result + IncluiCampo( cSituacaoNoPlano,
       StrToName( trim( cds.FieldByName('SITPLANO').AsString ) ), True, 40 );

      Result := Result + IncluiCampo( cInscricao,
       trim( cds.FieldByName('INSCRICAONUMERO').AsString ), True, 40 );

      Result := Result + IncluiCampo( cDataInscricao,
       FormataDataHora( 'dd/MM/yyyy', cds.FieldByName('INSCRICAODATA').AsString ), True, 40 );

      Result := Result + IncluiCampo( cDataRequerimento,
       FormataDataHora( 'dd/MM/yyyy', cds.FieldByName('REQUERIMENTODATA').AsString ), True, 40 );

      Result := Result + IncluiCampo( cDataCancelamento,
       FormataDataHora( 'dd/MM/yyyy', cds.FieldByName('DATACANCELAMENTO').AsString ), True, 40 );

      Result := Result + IncluiCampo( cTipoDeInscricao,
       StrToName( trim( cds.FieldByName('INSCRICAOTIPO').AsString ) ), True, 40 );

      Result := Result + IncluiCampo( cSalarioNaInscricao,
       FormatFloat( '#,##0.00', cds.FieldByName('SALINSCRICAO').AsFloat ), False, 40 );

      Result := Result + IncluiCampo( cSituacaoEspecial,
       StrToName( trim( cds.FieldByName('FLGFITESPECIAL').AsString ) ), True, 40 );

      Result := Result + IncluiCampo( cDtInicioDeManutencao,
       FormataDataHora( 'dd/MM/yyyy', cds.FieldByName('DATAINICIOMANUT').AsString ), True, 40 );

      Result := Result +
       '</table>                                                                   ' + CR ;

      cds.Next;
    end;

    cds.Close;
    cdsHTMLColumns.Close;

    Result := MontaPagina( pParticipanteNosPlanos, Result );

  except
    On E : Exception do
    begin
      Result := TrataWebExcecoes( E );
    end;
  end;

end; {PaginaDadosPartPlanos}

//BRUNO AZEVEDO SOL 91655 KINTANA 394002
function AlterarDadosCadastrais(pIdPessoa: Integer): String;
var
  sTituloCampo: String;
begin
  try
    cds.Close;
    cds.Data := WebDadosCadastrais.SelecionaDadosPessoa( pIdPessoa );

    sTitulo := TituloPagina( pManutDadosCadastrais );

    //VALIDAÇÃO
    sJavaScript :=
     'function checkMail(mail){                                                                          ' + CR +
     '  var er = new RegExp(/^[A-Za-z0-9_\-\.]+@[A-Za-z0-9_\-\.]{2,}\.[A-Za-z0-9]{2,}(\.[A-Za-z0-9])?/); ' + CR +
     '  if(typeof(mail) == "string"){                                                                    ' + CR +
     '    if(er.test(mail)){ return true; }                                                              ' + CR +
     '  }else if(typeof(mail) == "object"){                                                              ' + CR +
     '    if(er.test(mail.value)){                                                                       ' + CR +
     '       return true;                                                                                ' + CR +
     '    }                                                                                              ' + CR +
     '  }else{                                                                                           ' + CR +
     '      return false;                                                                                ' + CR +
     '    }                                                                                              ' + CR +
     '}                                                                                                  ' + CR +
     'function Motivo() {                                                                                ' + CR +
     '   document.frmLnkAlteracaoDadosCadastrais.edtMotivo.disabled = (document.frmLnkAlteracaoDadosCadastrais.edtMotivo.disabled) ? 0 : 1; ' + CR +
     '   document.frmLnkAlteracaoDadosCadastrais.edtMotivo.value = '''';                                 ' + CR +
     '   document.frmLnkAlteracaoDadosCadastrais.edtMotivo.focus;                                        ' + CR +
     '}                                                                                                  ' + CR +
     ' function ConfirmaDadosCadastrais( )                                             ' + CR +
     ' {                                                                               ' + CR +
     '   if (!checkMail(document.frmLnkAlteracaoDadosCadastrais.edtEmail.value ))     ' +
      '   {                                                                            ' + CR +
     '     alert(''Endereço de email inválido.'');                                     ' + CR +
     '     exit;                                                                       ' + CR +
     '   }                                                                             ' + CR +
     '   EnviaForm( document.frmLnkAlteracaoDadosCadastrais );                         ' + CR +
     ' }                                                                               ' + CR;

    Result := Result +
     '<p class="DESCCAMPO">                                                            ' + CR +
     '  <form method="POST" name="frmLnkAlteracaoDadosCadastrais"                      ' + CR +
     '   action="../<#nomearqapl>/SalvarDadosCadastrais">                              ' + CR +
     '    <table border="0" width="100%" cellpadding="0" cellspacing="0"               ' + CR +
     '     class="FORMULARIO">                                                         ' + CR +
     '      <tr>                                                                       ' + CR +
     '        <td width="75%">                                                         ' + CR +
     '          <table border="0" width="100%" cellpadding="0" cellspacing="0">        ' + CR +
     '            <tr class="CAMPOFORM">                                               ' + CR +
     '              <td class="DESCCAMPO" colspan="2">                                 ' + CR ;

    if TemAcessoCampo( sTipoUsuario, cEmail, sTituloCampo ) then begin
      Result := Result +
      sTituloCampo +
       '              <br>                                                             ' + CR +
       '              <input type="text" name="edtEmail" size="50"                     ' + CR +
       '               class="TEXT" maxlength="40"                                     ' + CR +
       '               value="' + cds.FieldByName('EMAIL').AsString + '" ';
      Result := Result + '>' + CR +
       '            </td>                                                              ' + CR +
       '          </tr>                                                                ' + CR ;
    end;

     Result := Result +
     '        </td>                                                                    ' + CR +
     '      </tr>                                                                      ' + CR +
     '      <tr>                                                                       ' + CR +
     '        <td colspan="2" align="center">                                          ' + CR +
     '          <br>                                                                   ' + CR +
     '          <a href="JavaScript:ConfirmaDadosCadastrais();">                          ' + CR +
     '           <img src="../imagem/btnConfirmar.gif" name="btnConfirmar" border="0"  ' + CR +
     '            onMouseOver="btnConfirmar.src=''../imagem/btnConfirmar_s.gif''"      ' + CR +
     '            onMouseOut="btnConfirmar.src=''../imagem/btnConfirmar.gif''"></a>    ' + CR +
     '          <a href="JavaScript:EnviaForm( document.frmLnkDadosCadastrais )"> ' + CR +
     '            <img src="../imagem/btnCancelar.gif" name="btnCancelar" border="0"   ' + CR +
     '            onMouseOver="btnCancelar.src=''../imagem/btnCancelar_s.gif''"        ' + CR +
     '            onMouseOut="btnCancelar.src=''../imagem/btnCancelar.gif''"></a>      ' + CR +
     '        </td>                                                                    ' + CR +
     '      </tr>                                                                      ' + CR +
     '    </table>                                                                     ' + CR +
     '    <#hiddenfields>                                                              ' + CR +
     '  </form>                                                                        ' + CR +
     '  <form method="POST" name="frmLnkDadosCadastrais"                          ' + CR +
     '   action="../<#nomearqapl>/ConsultaDadosParticipante">                               ' + CR +
     '    <#hiddenfields>                                                              ' + CR +
     '  </form>                                                                        ' + CR +
     '</p>                                                                             ' + CR +
     '<SCRIPT language="JavaScript">                                                   ' + CR +
     '  document.frmLnkAlteracaoDadosCadastrais.edtEmail.focus();                       ' + CR +
     '</script>                                                                        ' + CR ;

    Result := MontaPagina( pManutDadosCadastrais, Result );
  except
    On E : Exception do
    begin
      Result := TrataWebExcecoes( E );
    end;
  end;
end;

function SalvarDadosCadastrais(iIdPessoaLocal: Integer; Request: TWebRequest): String;
var
  iIdTempoServico, iIdPessJurLocal: Integer;
  sOperacao, sNaoReceberPeriodico: String;
  iPag: Integer;
  bOk, bEnviaEmail, bEnviaReativacao: Boolean; //Fanuel Junior SOL161648 Kintana1367561
  sSituacao : String; //Fanuel Junior SOL 174939 Kintana 1585984
begin
  try
    //GRAVAR O REGISTRO
    //BRUNO AZEVEDO SOL 150881 KINTANA 1099543
    bEnviaReativacao := false; //Fanuel Junior SOL161648 Kintana1367561
    if (Request.ContentFields.Values['bReceberPeriodicos'] <> '1') then begin
      cds.Close;
      cds.Data := WebDadosCadastrais.SelecionaDadosPessoa( iIdPessoaLocal );

      if not cds.IsEmpty then begin
        cds.Edit;
      end;

      AtualizaCampo(cEmail, cds.FieldByName('EMAIL'),  Request.ContentFields.Values['edtEmail']);
      cds.Post;

      WebDadosCadastrais.CdsDadosCadastrais.Data := cds.Data;

      bOk := WebDadosCadastrais.AlterarDadosCadastrais;

      if not (bOk) then begin
        raise Exception.Create(sMsgCtrl);
      end;

    end else begin
      //BRUNO AZEVEDO SOL 111643 KINTANA 515405
      cds.Close;
      cds.Data := WebDadosCadastrais.SelecionaPessoaParam( iIdPessoaLocal, 129 );

      if not cds.IsEmpty then begin
        cds.Edit;
      end else begin
        cds.Insert;
      end;

      bEnviaEmail := (cds.FieldByName('OBSERVACAO').AsString = '');

      //Fanuel Junior SOL161648 Kintana1367561
      bEnviaReativacao :=  ((cds.FieldByName('VALOR').AsString = 'N') and (Request.ContentFields.Values['chkNaoReceberPeriodico'] = 'S'));


      sNaoReceberPeriodico := 'N';
      if (Request.ContentFields.Values['chkNaoReceberPeriodico'] = 'S') then begin
        sNaoReceberPeriodico := 'S';
      end;

      //BRUNO AZEVEDO SOL 151642 KINTANA 1115027
      AtualizaCampo(cAltNaoRecebPeriodico,     cds.FieldByName('OBSERVACAO'),  Request.ContentFields.Values['edtMotivo']);
      AtualizaCampo(cAltNaoRecebPeriodico,     cds.FieldByName('VALOR'),  sNaoReceberPeriodico);
      cds.Post;

      WebDadosCadastrais.CdsDadosCadastrais.Data := cds.Data;

      bOk := WebDadosCadastrais.GravaPessoaParam(iIdPessoaLocal, 129);

      if not (bOk) then begin
        raise Exception.Create(sMsgCtrl);
      end;

      //BRUNO AZEVEDO SOL 157264 KINTANA 1251021
      cdsAux.Close;
      cdsAux.Data := WebDadosCadastrais.SelecionaMaxAdmissao( iIdPessoaLocal );
      iIdPessJurLocal := cdsAux.FieldByName('IDPESSJUR').AsInteger;

      cdsAux.Close;
      cdsAux.Data := WebDadosCadastrais.SelecionaPartPatro(iIdPessoaLocal, iIdPessJurLocal);

      //Fanuel Junior SOL174939 Kintana1585984
      sSituacao :=   WebDadosCadastrais.BuscaSituacaoFunc(iIdPessoaLocal, iIdPessJurLocal);

      CMDebugToFile(sSituacao ,'C:\AAErro.txt');
      //Fanuel Junior SOL161648 Kintana1367561
      if (Request.ContentFields.Values['edtMotivo'] <> '') and (bEnviaEmail) then begin
        EnviaEMail('comunicacao@funcef.com.br',
                   'Cancelamento no envio de periódicos.',
                   Request.ContentFields.Values['edtMotivo'],
                   //BRUNO AZEVEDO SOL 157264 KINTANA 1251021
                   //cdsAux.FieldByName('SITUACAO').AsString, //Fanuel Junior SOL174939 Kintana1585984 Comentado
                   sSituacao,
                   cdsAux.FieldByName('MATRICULA').AsString);
      end
      else begin
         if (bEnviaReativacao) then
           EnviaEMail('comunicacao@funcef.com.br',
                   'Reativação do Envio de Periódico',
                   'Não se aplica',//Request.ContentFields.Values['edtMotivo'],
                   //BRUNO AZEVEDO SOL 157264 KINTANA 1251021
                   //cdsAux.FieldByName('SITUACAO').AsString, //Fanuel Junior SOL174939 Kintana1585984 Comentado
                   sSituacao,
                   cdsAux.FieldByName('MATRICULA').AsString);

         end;

      //BRUNO AZEVEDO SOL 111643 KINTANA 515405
    end;

    //BRUNO AZEVEDO SOL 158000 KINTANA 1276003
    sTitulo := 'Sua solicitação foi enviada com sucesso.';

    Result := Result +
     '  <table border="0" width="100%" cellpadding="0" cellspacing="0"          ' + CR +
     '         class="FORMULARIO">                                              ' + CR +
     '  </table>                                                                ' + CR;

    Result := Result + Rodape();
    Result := MontaPagina( pManutDadosCadastrais, Result );
  except
    On E : Exception do
    begin
      Result := TrataWebExcecoes( E );
    end;
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
   '        <a href="javascript:EnviaForm( document.frmLnkConsultaDadosCadastrais );">   ' + CR +
   '          Voltar para Consulta de Dados Cadastrais                                ' + CR +
   '        </a>                                                                      ' + CR +
   '      </td>                                                                       ' + CR +
   '    </tr>                                                                         ' + CR +
   '  </table>                                                                        ' + CR +
   '  <form method="POST" name="frmLnkConsultaDadosCadastrais"                           ' + CR +
   '   action="../<#nomearqapl>/ConsultaDadosParticipante">                                ' + CR +
   '    <#hiddenfields>                                                               ' + CR +
   '  </form>                                                                         ' + CR;
end;
//BRUNO AZEVEDO SOL 91655 KINTANA 394002

//BRUNO AZEVEDO SOL 111643 KINTANA 515405
procedure EnviaEMail(sDestinatario, sAssunto, sMensagem, sSituacao, sMatricula: string);
var
  Mensagem: TIdMessage;
  IdSMTP: TIdSMTP;
begin
  IdSMTP := TIdSMTP.Create( nil );
  Mensagem := TIdMessage.Create( nil );
  try                             
    if IdSMTP.Connected then IdSMTP.Disconnect;

    cdsAux.Close;
    cdsAux.Data := WebDadosCadastrais.SelecionaConfiguracaoEmail();

    if cdsAux.IsEmpty then
      raise Exception.Create( 'Não foi possível encontrar a configuração para envio do e-mail.' );

    IdSMTP.Host     := cdsAux.FieldByName('SMTPSERVER').AsString;
    IdSMTP.UserId   := cdsAux.FieldByName('USERNAME').AsString;
    IdSMTP.Password := cdsAux.FieldByName('PASSWORD').AsString;
    IdSMTP.AuthenticationType := atLogin;
    
    Mensagem.Clear;
    Mensagem.Recipients.Add.Address := sDestinatario;
    Mensagem.From.Address := cdsAux.FieldByName('USERNAME').AsString;
    Mensagem.Subject      := sAssunto;
    Mensagem.Body.Add('Participante: '+ sNomeUsuario);
    //BRUNO AZEVEDO SOL 157264 KINTANA 1251021
    Mensagem.Body.Add('Matricula: '+ sMatricula);
    Mensagem.Body.Add('Situação: '+ sSituacao);
    //BRUNO AZEVEDO SOL 157264 KINTANA 1251021
    Mensagem.Body.Add('Motivo: '+ sMensagem);

    IdSMTP.Connect;

    IdSMTP.Send( Mensagem );

    IdSMTP.Disconnect;
    
  finally
    FreeAndNil(Mensagem);
    if IdSMTP.Connected then IdSMTP.Disconnect;
    FreeAndNil(IdSMTP);
  end;
end;

//BRUNO AZEVEDO SOL 150726 KINTANA 1099530
function CarregaHistoricoEnderecos(iIdEndereco: Integer; Request: TWebRequest): String;
var
   bAddRow: Boolean;
   cdsEndPess,cdsCidades : TCmClientDataSet;
   qryBuscaCidades : TwwQuery;
   sDescricao, sLogradouro,
   sNumero, sComplemento,
   sBairro, sCidade,
   sEstado, sPais,sIdCidades ,
   sCEP : string;
begin
  try
    sTitulo := 'Histórico de Endereços';

    cds.Close;
    cds.Data := EndPess.SelecionaHistoricoEnderecos(iIdEndereco);
    //cds.Data := EndPess.SelecionaHistoricoEnderecos(iIdPessoaLocal);

    if not cds.IsEmpty then
    begin

      cdsEndPess := TCmClientDataSet.Create(nil);
      cdsEndPess.Data := EndPess.SelecionaEnderecoPessoa(iIdEndereco);

      //Fanuel Junior SOL Kintana  Bolinho
      sDescricao   :=   cdsEndPess.FieldByName('TIPOEND').AsString; // EndPess.Nome
      sLogradouro  :=   cdsEndPess.FieldByName('LOGRADOURO').AsString;
      sNumero      :=   cdsEndPess.FieldByName('NUMERO').AsString;
      sComplemento :=   cdsEndPess.FieldByName('COMPLEMENTO').AsString;
      sBairro      :=   cdsEndPess.FieldByName('BAIRRO').AsString;
      sCidade      :=   cdsEndPess.FieldByName('CIDADE').AsString;
      sEstado      :=   cdsEndPess.FieldByName('ESTADO').AsString;
      //sPais        :=   cdsEndPess.FieldByName('').AsString;
      sCEP         :=   cdsEndPess.FieldByName('CEP').AsString;
      sIdCidades   :=   cdsEndPess.FieldByName('IDCIDADES').AsString;


      Result := Result + '<form method="POST" name="frmAltEnderecos" ' +
         ' action="../<#nomearqapl>/ManutEnderecos"> ' +
         ' <#hiddenfields> ' +
         ' </form>';

      Result := Result +
       '<p class="CABDIV">' + 'Endereços' + ' </p>                   ' + CR ;

      cdsHTMLColumns.Close;
      cdsHTMLColumns.CreateDataSet;

      IncluiColuna( cTipoEndereco,      5, 'left' );
      IncluiColuna( cDescricaoEndereco, 5, 'left' );
      IncluiColuna( cLogradouro,        5, 'left' );
      IncluiColuna( cNumeroEndereco,    5, 'left' );
      IncluiColuna( cComplemento,       5, 'left' );
      IncluiColuna( cBairro,            5, 'left' );
      IncluiColuna( cCidade,            5, 'left' );
      IncluiColuna( cEstado,            5, 'left' );
      IncluiColuna( cCEP,               5, 'left' );

      Result := Result + HTMLTableHeader;

      bAddRow := True;
      cds.First;
      while not cds.Eof do
      begin


        if (cds.FieldByName('NOMECAMPO').AsString = 'TIPOENDERECO') then begin
          PreencheColuna( cTipoEndereco, StrToName( trim( cds.FieldByName('VALORANTERIOR').AsString ) ) );


        end else if (cds.FieldByName('NOMECAMPO').AsString = 'NOME') then begin
          if(trim(cds.FieldByName('VALORANTERIOR').AsString) <> trim(sDescricao)) then
             sDescricao := cds.FieldByName('VALORANTERIOR').AsString;
             //PreencheColuna( cDescricaoEndereco, StrToName( trim( cds.FieldByName('VALORANTERIOR').AsString ) ) );
        end
        else if (cds.FieldByName('NOMECAMPO').AsString = 'LOGRADOURO') then begin
          if(trim(cds.FieldByName('VALORANTERIOR').AsString) <> trim(sLogradouro)) then
             sLogradouro := cds.FieldByName('VALORANTERIOR').AsString;

        end
        else if (cds.FieldByName('NOMECAMPO').AsString = 'NUMERO') then begin
           if(trim(cds.FieldByName('VALORANTERIOR').AsString) <> trim(sNumero)) then
              sNumero := cds.FieldByName('VALORANTERIOR').AsString;

        end

        else if (cds.FieldByName('NOMECAMPO').AsString = 'COMPLEMENTO') then begin
           if(trim(cds.FieldByName('VALORANTERIOR').AsString) <> trim(sComplemento)) then
              sComplemento := cds.FieldByName('VALORANTERIOR').AsString;

        end

        else if (cds.FieldByName('NOMECAMPO').AsString = 'BAIRRO') then begin
           if(trim(cds.FieldByName('VALORANTERIOR').AsString) <> trim(sBairro)) then
              sBairro := cds.FieldByName('VALORANTERIOR').AsString;
        end

        else if (cds.FieldByName('NOMECAMPO').AsString = 'IDCIDADES') then begin
            if(trim(cds.FieldByName('VALORANTERIOR').AsString) <> trim(sIdCidades)) then begin
              sIdCidades := cds.FieldByName('VALORANTERIOR').AsString;
                  cdsCidades := TCmClientDataSet.Create(nil);
                  cdsCidades.Data := EndPess.BuscaCidades(sIdCidades);
                  sCidade := cdsCidades.FieldByName('NOME').AsString;
                  sEstado := cdsCidades.FieldByName('UF').AsString;
                  cdsCidades.Close;
                  
           end;

        //  PreencheColuna( cCidade, StrToName( trim( cds.FieldByName('VALORANTERIOR').AsString ) ) );

        //end else if (cds.FieldByName('NOMECAMPO').AsString = 'CIDADE') then begin
        //  PreencheColuna( cCidade, StrToName( trim( cds.FieldByName('VALORANTERIOR').AsString ) ) );
        //end else if (cds.FieldByName('NOMECAMPO').AsString = 'IDPAIS') then begin
        //  PreencheColuna( cPais, StrToName( trim( cds.FieldByName('VALORANTERIOR').AsString ) ) );
        end
        else if (cds.FieldByName('NOMECAMPO').AsString = 'CEP') then begin
           if(trim(cds.FieldByName('VALORANTERIOR').AsString) <> trim(sCEP)) then
              sCEP  := cds.FieldByName('VALORANTERIOR').AsString;

        end;

           PreencheColuna( cDescricaoEndereco, StrToName(trim(sDescricao)));
           PreencheColuna( cLogradouro, StrToName(trim(sLogradouro)));
           PreencheColuna( cNumeroEndereco, StrToName( trim(sNumero)));
           PreencheColuna( cComplemento, StrToName(trim(sComplemento)));
           PreencheColuna( cBairro, StrToName(trim(sBairro)));
           PreencheColuna( cCidade, StrToName( trim(sCidade)));
           PreencheColuna( cEstado, StrToName( trim(sEstado)));          
           PreencheColuna( cCEP, StrToName(trim(sCEP)));


        if (cds.FieldByName('IDREGISTRO').AsInteger <> cds.FieldByName('proximo').AsInteger) then begin
          bAddRow := False;
          Result := Result + HTMLTableRow;
        end;

        cds.Next;
      end;
      if (bAddRow) then begin
        Result := Result + HTMLTableRow;
      end;
      Result := Result + HTMLTableFooter + CR ;

      cdsHTMLColumns.Close;

      Result := Result +
       '        </td>                                                                    ' + CR +
       '      </tr>                                                                      ' + CR +
       '      <tr>                                                                       ' + CR +
       '        <td colspan="2" align="center">                                          ' + CR +
       '          <br>                                                                   ' + CR +
       '          <a href="JavaScript:EnviaForm( document.frmLnkConsultaDadosCadastrais );">                          ' + CR +
       '           <img src="../imagem/esq.bmp" name="btnConfirmar" border="0"</a>    ' + CR +
       '        </td>                                                                    ' + CR +
       '      </tr>                                                                      ' + CR +
       '    </table>                                                                     ' + CR +
       '    <#hiddenfields>                                                              ' + CR +
       '  </form>                                                                        ' + CR +
       '  <form method="POST" name="frmLnkConsultaDadosCadastrais"                           ' + CR +
       '   action="../<#nomearqapl>/ConsultaDadosParticipante">                                ' + CR +
       '    <#hiddenfields>                                                               ' + CR +
       '  </form>                                                                         ' + CR +
       '</p>                                                                             ' + CR ;

    end;

    Result := MontaPagina( pManutEnderecos, Result );
  except
    On E : Exception do
    begin
      Result := TrataWebExcecoes( E );
    end;
  end;
end;
//BRUNO AZEVEDO SOL 150726 KINTANA 1099530

end.
