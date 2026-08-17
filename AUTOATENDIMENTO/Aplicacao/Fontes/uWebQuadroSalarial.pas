unit uWebQuadroSalarial;

interface

uses SysUtils, DModAutoAtendimento, uConstPaginasCampos;

//Monta a página de Eventos Previdenciários
function PaginaQuadroSalarial( sAnoLocal : String; iIdPessoaLocal : integer ) : String;

implementation

//Monta a página de Eventos Previdenciários
function PaginaQuadroSalarial( sAnoLocal : String; iIdPessoaLocal : integer ) : String;
var
  sPatroAnt, sPlanoAnt, sTituloCampo : String;
  sAno, sAnoSelecionado, sPAno, sUAno : String;  
begin

  try

    sTitulo := TituloPagina( pQuadroSalarial );

    sAnoSelecionado := sAnoLocal;    

    cdsAux.Close;
    cdsAux.Data := WebHistRubSal.SelecionaAnoQuadroSalarial( iIdPessoaLocal );

    if not cdsAux.IsEmpty then
    begin
      Result := Result +
       '<center>                                                              ' + CR +
       '  <form method="POST" name="frmAno"                                   ' + CR +
       '   action="../<#nomearqapl>/ConsultaQuadroSalarial">    ' + CR +
       '    <#hiddenfields>                                                   ' + CR +
       '    <span id="CORPO">                                                 ' + CR +
       '      Ano:&nbsp;                                                      ' + CR +
       '    </span>                                                           ' + CR +
       '    <select size="1" name="cmbAno" class="CORPO">                     ' + CR ;

      cdsAux.First;
      sPAno := cdsAux.FieldByName('ANO').AsString;
      while True do
      begin
        sAno := cdsAux.FieldByName('ANO').AsString;

        cdsAux.Next;

        if ( sAnoSelecionado = sAno ) or
           ( cdsAux.Eof and ( sAnoSelecionado = '' ) ) then
          Result := Result + '        <option selected>' + sAno + '</option> ' + CR
        else
          Result := Result + '        <option>' + sAno + '</option> ' + CR;

        if cdsAux.Eof then
        begin
          if sAnoSelecionado = '' then sAnoSelecionado := sAno;
          break;
        end;

      end;
      sUAno := cdsAux.FieldByName('ANO').AsString;
      cdsAux.Close;

      Result := Result +
       '    </select>                                                         ' + CR +
       '    <span id="link">                                                  ' + CR +
       '      <a href="JavaScript:EnviaForm( document.frmAno )">                  ' + CR +
       '        Ok                                                            ' + CR +
       '      </a>                                                            ' + CR +
       '    </span>                                                           ' + CR +
       '  </form>                                                             ' + CR +
       '  <p class="link">                                                    ' + CR ;

      if sPAno <> sAnoSelecionado then
        Result := Result +
         '    <a href="JavaScript:EnviaForm( document.frmLnkAnterior )">          ' + CR +
         '      Anterior                                                      ' + CR +
         '    </a>                                                            ' + CR ;

      if ( sPAno <> sAnoSelecionado ) and ( sUAno <> sAnoSelecionado ) then
        Result := Result +
        '    &nbsp;|&nbsp;                                                      ' + CR;

      if sUAno <> sAnoSelecionado then
        Result := Result +
         '    <a href="JavaScript:EnviaForm( document.frmLnkProximo )">          ' + CR +
         '      Próximo                                                      ' + CR +
         '    </a>                                                           ' + CR ;

      Result := Result +
       '  </p>                                                                ' + CR +
       '</center>                                                             ' + CR ;

      sTitulo := TituloPagina( pQuadroSalarial ) + ' - ' + sAnoSelecionado;

      cds.Close;
      cds.Data := WebHistRubSal.SelecionaQuadroSalarial( sAnoSelecionado, iIdPessoaLocal );

      if not cds.IsEmpty then
      begin

        if TemAcessoCampo( sTipoUsuario, cTabelaQuadroSalarial, sTituloCampo ) then
        begin
          cdsHTMLColumns.Close;
          cdsHTMLColumns.CreateDataSet;

          IncluiColuna( cMesRefRub,       10, 'left' );
          IncluiColuna( cMesCobrancarRub, 10, 'left' );
          IncluiColuna( cIdRubrica,       10, 'left' );
          IncluiColuna( cDescRUbrica,     30, 'left' );
          IncluiColuna( cTipoRubrica,     30, 'left' );
          IncluiColuna( cValorRubrica,    10, 'right' );

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

            if TemAcessoCampo( sTipoUsuario, cTabelaQuadroSalarial, sTituloCampo ) then
              Result := Result + HTMLTableHeader;

            sPlanoAnt := cds.FieldByName('PLANO').AsString;
          end;


          if TemAcessoCampo( sTipoUsuario, cTabelaQuadroSalarial, sTituloCampo ) then
          begin
            PreencheColuna( cMesRefRub,        cds.FieldByName('MESF').AsString );
            PreencheColuna( cMesCobrancarRub,  cds.FieldByName('MESCOBRANCA').AsString );
            PreencheColuna( cIdRubrica,        cds.FieldByName('IDRUBRICA').AsString );
            PreencheColuna( cDescRUbrica,      StrToName( cds.FieldByName('DESCRICAO').AsString ) );
            PreencheColuna( cTipoRubrica,      StrToName( cds.FieldByName('TIPO').AsString ) );
            PreencheColuna( cValorRubrica,     FormatFloat( '#,##0.00', cds.FieldByName('VALORPROVENTO').AsFloat ) );

            Result := Result + HTMLTableRow;
          end;


          cds.Next;

          if ( cds.FieldByName('PLANO').AsString <> sPlanoAnt )
           or ( cds.FieldByName('PATRO').AsString <> sPatroAnt )
           or cds.Eof then
          begin

            if TemAcessoCampo( sTipoUsuario, cTabelaQuadroSalarial, sTituloCampo ) then
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

      Result := Result + ' <p class="LINK" align="center">                        ' + CR ;

      if sPAno <> sAnoSelecionado then
        Result := Result +
         '    <a href="JavaScript:EnviaForm( document.frmLnkAnterior )">            ' + CR +
         '      Anterior                                                        ' + CR +
         '    </a>                                                              ' + CR ;

      if ( sPAno <> sAnoSelecionado ) and ( sUAno <> sAnoSelecionado ) then
        Result := Result +
        '    &nbsp;|&nbsp;                                                      ' + CR;

      if sUAno <> sAnoSelecionado then
        Result := Result +
         '    <a href="JavaScript:EnviaForm( document.frmLnkProximo )">             ' + CR +
         '      Próximo                                                         ' + CR +
         '    </a>                                                              ' + CR ;

      Result := Result + ' </font> </p> ' + CR ;         

      Result := Result +
       '  <form method="POST" name="frmLnkAnterior"                           ' + CR +
       '   action="../<#nomearqapl>/ConsultaQuadroSalarial">    ' + CR +
       '    <#hiddenfields>                                                   ' + CR +
       '    <input type="hidden" name="cmbAno" value="'                         +
       IntToStr( StrToIntDef( sAnoSelecionado, 0 ) - 1 )       + '">          ' + CR +
       '  </form>                                                             ' + CR +
       '  <form method="POST" name="frmLnkProximo"                            ' + CR +
       '   action="../<#nomearqapl>/ConsultaQuadroSalarial">    ' + CR +
       '    <#hiddenfields>                                                   ' + CR +
       '    <input type="hidden" name="cmbAno" value="'                         +
       IntToStr( StrToIntDef( sAnoSelecionado, 0 ) + 1 )       + '">          ' + CR +
       '  </form>                                                             ' + CR ;

    end;

    cds.Close;
    cdsAux.Close;
    cdsHTMLColumns.Close;

    Result := MontaPagina( pQuadroSalarial, Result );

  except
    On E : Exception do
    begin
      Result := TrataWebExcecoes( E );
    end;
  end;

end;

end.
