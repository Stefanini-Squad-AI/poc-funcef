unit uWebEventosPrev;

interface

uses SysUtils, DModAutoAtendimento, uConstPaginasCampos, uCtrlFuncoesAA;

//Monta a página de Eventos Previdenciários
function PaginaEventosPrev( iIdPessoaLocal : integer; bTodosPlanos : boolean ) : String;

//Monta a página de Dados de Eventos Previdenciários
function PaginaDadosEventosPrev( iIdEventoPrev : integer ) : String;


implementation

//Monta a página de Eventos Previdenciários
function PaginaEventosPrev( iIdPessoaLocal : integer; bTodosPlanos : boolean ) : String;
var
  sPatroAnt, sPlanoAnt, sTituloCampo : String;
begin

  try

    sTitulo := TituloPagina( pEventosPrevidenciarios );

    cds.Close;
    cds.Data := WebEventosPrev.SelecionaEventosPrev( iIdPessoaLocal, iIdTitular, bTodosPlanos );

    if TemAcessoPagina( sTipoUsuario, pDadosEventosPrevidenciarios, sTituloCampo ) then
      //JavaScript para link dinâmico para detalhes dos eventos.
      sJavaScript := ' function Detalhes( sIdEventoPrev )                      ' + CR +
                     ' {                                                       ' + CR +
                     '   document.frmLnkDadosEventosPrev.vIdEventoPrev.value = sIdEventoPrev; ' + CR +
                     '   EnviaForm( document.frmLnkDadosEventosPrev );         ' + CR +
                     ' }                                                       ' + CR ;

    if not cds.IsEmpty then
    begin

      if TemAcessoCampo( sTipoUsuario, cTabelaEventosPrev, sTituloCampo ) then
      begin
        cdsHTMLColumns.Close;
        cdsHTMLColumns.CreateDataSet;

        IncluiColuna( cEventoGerador,     42, 'left', '', True );
        IncluiColuna( cDtEvento,          11, 'left' );
        IncluiColuna( cInscricaoEvento,   11, 'left' );
        IncluiColuna( cDtRegistro,        11, 'left' );
        IncluiColuna( cDtEfetivacao,      11, 'left' );
        IncluiColuna( cDtEncerramento,    11, 'left' );
        if TemAcessoPagina( sTipoUsuario, pDadosEventosPrevidenciarios, sTituloCampo ) then
          IncluiColuna( cTabelaEventosPrev,  3, 'center', ' ' );
      end;

      cds.First;
      while True do
      begin

        //Nova patrocinadora
        if cds.FieldByName('PATRO').AsString <> sPatroAnt then
        begin
          if sPatroAnt <> '' then
            Result := Result + '<BR><BR><BR>' + CR;

          Result := Result +
           '<table class="PRINC" border="0" width="100%"                  ' + CR +
           ' cellspacing="0" cellpadding="0" >                            ' + CR +
           '  <tr>                                                        ' + CR +
           '    <td width="100%" colspan="2" class="CABPRINC">            ' + CR +
           cds.FieldByName('PATRO').AsString                        + CR +
           '    </td>                                                     ' + CR +
           '  </tr>                                                       ' + CR ;

          sPatroAnt := cds.FieldByName('PATRO').AsString;
          sPlanoAnt := '';
        end;


        //Novo plano
        if cds.FieldByName('PLANO').AsString <> sPlanoAnt then
        begin
          if sPlanoAnt <> '' then
            Result := Result + '<BR><BR>' + CR;

          Result := Result +
           '        <tr>                                                           ' + CR +
           '          <td width="1%"> </td>                                        ' + CR +
           '          <td class="SUBCAB"> <BR>                                     ' + CR +
           cds.FieldByName('PLANO').AsString                                         + CR +
           '          </td>                                                        ' + CR +
           '        </tr>                                                          ' + CR +
           '        <tr>                                                           ' + CR +
           '          <td width="1%"> </td>                                        ' + CR +
           '          <td> <hr> </td>                                              ' + CR +
           '        </tr>                                                          ' + CR +
           '  <tr>                                                                 ' + CR +
           '    <td width="1%"> </td>                                              ' + CR +
           '    <td> <BR>                                                          ' + CR ;

          if TemAcessoCampo( sTipoUsuario, cTabelaEventosPrev, sTituloCampo ) then
            Result := Result + HTMLTableHeader;

          sPlanoAnt := cds.FieldByName('PLANO').AsString;
        end;

        if TemAcessoCampo( sTipoUsuario, cTabelaEventosPrev, sTituloCampo ) then
        begin
          PreencheColuna( cEventoGerador,     StrToName( trim( cds.FieldByName('NOME').AsString ) ) );
          PreencheColuna( cDtEvento,          FormataDataHora( 'dd/mm/yyyy', cds.FieldByName('DATAEVENTO').AsString ) );
          PreencheColuna( cInscricaoEvento,   cds.FieldByName('INSCRICAONUMERO').AsString );
          PreencheColuna( cDtRegistro,        FormataDataHora( 'dd/mm/yyyy', cds.FieldByName('DATAREGISTRO').AsString ) );
          PreencheColuna( cDtEfetivacao,      FormataDataHora( 'dd/mm/yyyy', cds.FieldByName('DATAEFETIVADO').AsString ) );
          PreencheColuna( cDtEncerramento,    FormataDataHora( 'dd/mm/yyyy', cds.FieldByName('DATAVOLTA').AsString ) );
          if TemAcessoPagina( sTipoUsuario, pDadosEventosPrevidenciarios, sTituloCampo ) then
            PreencheColuna( cTabelaEventosPrev, '<a href="JavaScript:Detalhes(' +
             cds.FieldByName('IDEVENTOSPREV').AsString + ')"><img src="..\imagem\detalhestbl.gif" border=0></a>' );
          Result := Result + HTMLTableRow;
        end;

        cds.Next;

        if ( cds.FieldByName('PLANO').AsString <> sPlanoAnt )
         or ( cds.FieldByName('PATRO').AsString <> sPatroAnt )
         or cds.Eof then
        begin

          if TemAcessoCampo( sTipoUsuario, cTabelaEventosPrev, sTituloCampo ) then
            Result := Result + HTMLTableFooter + '<BR>' + CR ;

          if ( cds.FieldByName('PATRO').AsString <> sPatroAnt )
           or cds.Eof then
            Result := Result +
             '    </td>                                                       ' + CR +
             '  </tr>                                                         ' + CR +
             '</table>                                                        ' + CR ;
        end;

        if cds.Eof then
         break;

      end;

    end;

    if TemAcessoPagina( sTipoUsuario, pDadosEventosPrevidenciarios, sTituloCampo ) then
    begin
      Result := Result +
        '<BR><BR>' + CR +
        '<img src="..\imagem\detalhestbl.gif">                                    ' + CR +
        '<SPAN id="DESCCAMPO">                                                    ' + CR +
        '  Clique neste símbolo para consultar detalhes sobre os eventos.         ' + CR +
        '</SPAN>                                                                  ' + CR +
        '<form method="POST" name="frmLnkDadosEventosPrev"                        ' + CR +
        ' action="../<#nomearqapl>/ConsultaDadosEventosPrev"> ' + CR +
        HiddenFields                                                                + CR +
        '<input type="hidden" name="vIdEventoPrev">                               ' + CR +
        '</form>' + CR;
    end;

    cds.Close;
    cdsHTMLColumns.Close;

    Result := MontaPagina( pEventosPrevidenciarios, Result );

  except
    On E : Exception do
    begin
      Result := TrataWebExcecoes( E );
    end;
  end;

end;


//Monta a página de Dados de Eventos Previdenciários
function PaginaDadosEventosPrev( iIdEventoPrev : integer ) : String;
var
  sTituloCampo : String;
begin

  try

    sTitulo := TituloPagina( pDadosEventosPrevidenciarios );

    //Detalhes do evento
    if TemAcessoCampo( sTipoUsuario, cDetalhesEvento, sTituloCampo ) then
    begin

      cds.Close;
      cds.Data := WebEventosPrev.SelecionaDadosEventosPrev( iIdEventoPrev );

      if not cds.IsEmpty then
      begin
        Result := Result +
         '<p class="CABDIV">' + sTituloCampo +' </p>                                   ' + CR +
         '<table border="0" width="100%" cellpadding="0" cellspacing="0">              ' + CR ;

        if TemAcessoCampo( sTipoUsuario, cDetEventoGerador, sTituloCampo ) then
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
           cds.FieldByName('NOME').AsString                                              + CR +
           '      </p>                                                                 ' + CR +
           '    </td>                                                                  ' + CR +
           '  </tr>                                                                    ' + CR ;


        if TemAcessoCampo( sTipoUsuario, cDetPlano, sTituloCampo ) then
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
           cds.FieldByName('PLANO').AsString                                             + CR +
           '      </p>                                                                 ' + CR +
           '    </td>                                                                  ' + CR +
           '  </tr>                                                                    ' + CR ;

        Result := Result +
           '  <tr height="10"></tr>                                                    ' + CR ;

        Result := Result + IncluiCampo( cDetDtEvento
         FormataDataHora( 'dd/mm/yyyy', cds.FieldByName('DATAEVENTO').AsString ) );

        Result := Result + IncluiCampo( cDetInscricaoEvento,
         cds.FieldByName('INSCRICAONUMERO').AsString );

        Result := Result + IncluiCampo( cDetDtRegistro,
         FormataDataHora( 'dd/mm/yyyy', cds.FieldByName('DATAREGISTRO').AsString ) );

        Result := Result + IncluiCampo( cDetDtEfetivacao,
         FormataDataHora( 'dd/mm/yyyy', cds.FieldByName('DATAEFETIVADO').AsString ) );

        Result := Result + IncluiCampo( cDetDtEncerramento,
         FormataDataHora( 'dd/mm/yyyy', cds.FieldByName('DATAVOLTA').AsString ) );

        Result := Result + IncluiCampo( cDetSitAntFund,
         StrToName( cds.FieldByName('SITPARTANT').AsString ) );

        Result := Result + IncluiCampo( cDetSitNovaFund,
         StrToName( cds.FieldByName('SITPARTNOVO').AsString ) );

        Result := Result + IncluiCampo( cDetSitAntPatro,
         StrToName( cds.FieldByName('SITFUNCANT').AsString ) );

        Result := Result + IncluiCampo( cDetSitNovaPatro,
         StrToName( cds.FieldByName('SITFUNCNOVO').AsString ) );

        Result := Result + IncluiCampo( cDetSitAntPlano,
         StrToName( cds.FieldByName('SITPLANOANT').AsString ) );

        Result := Result + IncluiCampo( cDetSitNovaPlano,
         StrToName( cds.FieldByName('SITPLANONOVO').AsString ) );

        cds.Close;

        Result := Result +
         '</table>                                                                     ' + CR +
         '<BR><BR><BR><BR>                                                             ' + CR ;

      end;
    end;


    //Contribuições do Evento
    if TemAcessoCampo( sTipoUsuario, cTabelaContribEventos, sTituloCampo ) then
    begin
      cds.Close;
      cds.Data := WebEventosPrev.SelecionaContribEventosPrev( iIdEventoPrev );

      if not cds.IsEmpty then
      begin
        Result := Result +
         '<p class="CABDIV">' + sTituloCampo + ' </p>                   ' + CR ;

        cdsHTMLColumns.Close;
        cdsHTMLColumns.CreateDataSet;

        IncluiColuna( cContribEvento, 100, 'left' );

        Result := Result + HTMLTableHeader;

        cds.First;
        while not cds.Eof do
        begin
          PreencheColuna( cContribEvento, StrToName( cds.FieldByName('CONTRIBUICAOF').AsString ) );

          Result := Result + HTMLTableRow;
          cds.Next;
        end;

        Result := Result + HTMLTableFooter + CR ;

        cdsHTMLColumns.Close;
      end;
      
      cds.Close;
    end;

    Result := MontaPagina( pDadosEventosPrevidenciarios, Result );

  except
    On E : Exception do
    begin
      Result := TrataWebExcecoes( E );
    end;
  end;

end;

end.
