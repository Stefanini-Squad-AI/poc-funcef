unit uWebContribuicoes;

interface

uses SysUtils, DModAutoAtendimento, uConstPaginasCampos, uCtrlFuncoesAA;

//Monta a página de Histórico de Contribuições
function PaginaContribuicoes( sAnoLocal : String; iIdPessoaLocal : integer ) : String;

implementation

//Monta a página de Histórico de Contribuições
function PaginaContribuicoes( sAnoLocal : String; iIdPessoaLocal : integer ) : String;
var
  sPatroAnt, sPlanoAnt, sMesAnt, sTituloCampo : String;
  sAno, sAnoSelecionado, sPAno, sUAno : String;
  fTotal : real;
begin

  try

    sTitulo := TituloPagina( pHistoricoDeContribuicoes );

    sAnoSelecionado := sAnoLocal;
    fTotal    := 0;
    Result    := '';
    sPatroAnt := '';
    sPlanoAnt := '';
    sMesAnt   := '';

    cdsAux.Close;
    cdsAux.Data := WebContribuicoes.SelecionaAno( iIdPessoaLocal, iIdTitular );

    if not cdsAux.IsEmpty then
    begin
      Result := Result +
       '<center>                                                              ' + CR +
       '  <form method="POST" name="frmAno"                                   ' + CR +
       '   action="../<#nomearqapl>/ConsultaContribuicoes">     ' + CR +
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

      sTitulo := TituloPagina( pHistoricoDeContribuicoes ) + ' - ' + sAnoSelecionado;

      cds.Close;
      cds.Data := WebContribuicoes.SelecionaContribuicoes( sAnoSelecionado, iIdPessoaLocal, iIdTitular );

      if not cds.IsEmpty then
      begin

        if TemAcessoCampo( sTipoUsuario, cTabelaContribuicoes, sTituloCampo ) then
        begin
          cdsHTMLColumns.Close;
          cdsHTMLColumns.CreateDataSet;

          IncluiColuna( cMesRef,                 6, 'left'  );
          IncluiColuna( cContribuicaoHistorico, 34, 'left'  );
          IncluiColuna( cDevolucao,              8, 'left'  );
          IncluiColuna( cReserva,                8, 'left'  );
          IncluiColuna( cSituacao,              20, 'left'  );
          IncluiColuna( cRecebimento,            9, 'left'  );
          IncluiColuna( cValorContribuicao,      7, 'right' );
          IncluiColuna( cTotalMes,               8, 'right', '', True );
        end;

        cds.First;
        while True do
        begin

          //Nova patrocinadora
          if cds.FieldByName('PATRO').AsString <> sPatroAnt then
          begin
            if sPatroAnt <> '' then
              Result := Result + '<BR><BR><BR>';

            Result := Result +
             '<table class="PRINC" border="0" width="100%"                  ' + CR +
             ' cellspacing="0" cellpadding="0" >                            ' + CR +
             '  <tr>                                                        ' + CR +
             '    <td width="100%" colspan="2" class="CABPRINC">            ' + CR +
             cds.FieldByName('PATRO').AsString                                + CR +
             '    </td>                                                     ' + CR +
             '  </tr>                                                       ' + CR ;

            sPatroAnt := cds.FieldByName('PATRO').AsString;
            sPlanoAnt := '';
          end;


          //Novo plano
          if  cds.FieldByName('PLANPREV').AsString <> sPlanoAnt then
          begin
            if sPlanoAnt <> '' then
              Result := Result + '<BR><BR>' + CR;

            Result := Result +
             '        <tr>                                                           ' + CR +
             '          <td width="1%"> </td>                                        ' + CR +
             '          <td class="SUBCAB"> <BR>                                     ' + CR +
             cds.FieldByName('PLANPREV').AsString                                      + CR +
             '          </td>                                                        ' + CR +
             '        </tr>                                                          ' + CR +
             '        <tr>                                                           ' + CR +
             '          <td width="1%"> </td>                                        ' + CR +
             '          <td> <hr> </td>                                              ' + CR +
             '        </tr>                                                          ' + CR +
             '  <tr>                                                                 ' + CR +
             '    <td width="1%"> </td>                                              ' + CR +
             '    <td> <BR>                                                          ' + CR ;

            sPlanoAnt := cds.FieldByName('PLANPREV').AsString;

            if TemAcessoCampo( sTipoUsuario, cTabelaContribuicoes, sTituloCampo ) then
             Result := Result + HTMLTableHeader;

            sMesAnt   := '';
          end;

          //Novo mês
          if  cds.FieldByName('MESREFERENCIA').AsString <> sMesAnt then
          begin
            fTotal := 0;
          end;

          if TemAcessoCampo( sTipoUsuario, cTabelaContribuicoes, sTituloCampo ) then
          begin
            PreencheColuna( cMesRef,                trim( cds.FieldByName('MES').AsString ) );
            PreencheColuna( cContribuicaoHistorico, StrToName( trim( cds.FieldByName('CONTRIB').AsString ) ) );
            PreencheColuna( cDevolucao,             cds.FieldByName('FLGDEVOLUCAO').AsString );
            PreencheColuna( cReserva,               cds.FieldByName('FLGCALCRESERVA').AsString );
            PreencheColuna( cSituacao,              cds.FieldByName('DESCRICAO').AsString );
            PreencheColuna( cRecebimento,           FormataDataHora( 'dd/mm/yy', cds.FieldByName('DATARECEBIMENTO').AsString ) );
            PreencheColuna( cValorContribuicao,     FormatFloat( '#,##0.00', cds.FieldByName('VALORRECEBIDO').AsFloat ) );
          end;

          fTotal := fTotal + cds.FieldByName('VALORRECEBIDO').AsFloat;

          sMesAnt := cds.FieldByName('MESREFERENCIA').AsString;

          cds.Next;

          if TemAcessoCampo( sTipoUsuario, cTabelaContribuicoes, sTituloCampo ) then
          begin
            if  ( cds.FieldByName('MESREFERENCIA').AsString <> sMesAnt   )
             or ( cds.FieldByName('PLANPREV').AsString         <> sPlanoAnt )
             or ( cds.FieldByName('PATRO').AsString <> sPatroAnt )
             or cds.Eof then
            begin
              PreencheColuna( cTotalMes, FormatFloat( '#,##0.00', fTotal ) );
              fTotal    := 0;
            end
            else
              PreencheColuna( cTotalMes, '' );

            Result := Result + HTMLTableRow;
          end;

          if ( cds.FieldByName('PLANPREV').AsString <> sPlanoAnt )
           or ( cds.FieldByName('PATRO').AsString <> sPatroAnt )
           or cds.Eof then
          begin

            if TemAcessoCampo( sTipoUsuario, cTabelaContribuicoes, sTituloCampo ) then
              Result := Result + HTMLTableFooter + '<BR>' + CR ;

            if ( cds.FieldByName('PATRO').AsString <> sPatroAnt )
             or cds.Eof then
              Result := Result +
               '    </td>                                                 ' + CR +
               '  </tr>                                                   ' + CR +
               '</table>                                                  ' + CR ;
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
       '   action="../<#nomearqapl>/ConsultaContribuicoes">     ' + CR +
       '    <#hiddenfields>                                                   ' + CR +
       '    <input type="hidden" name="cmbAno" value="'                         +
       IntToStr( StrToIntDef( sAnoSelecionado, 0 ) - 1 )       + '">          ' + CR +
       '  </form>                                                             ' + CR +
       '  <form method="POST" name="frmLnkProximo"                            ' + CR +
       '   action="../<#nomearqapl>/ConsultaContribuicoes">     ' + CR +
       '    <#hiddenfields>                                                   ' + CR +
       '    <input type="hidden" name="cmbAno" value="'                         +
       IntToStr( StrToIntDef( sAnoSelecionado, 0 ) + 1 )       + '">          ' + CR +
       '  </form>                                                             ' + CR ;

    end;

    cds.Close;
    cdsAux.Close;
    cdsHTMLColumns.Close;

    Result := MontaPagina( pHistoricoDeContribuicoes, Result );

  except
    On E : Exception do
    begin
      Result := TrataWebExcecoes( E );
    end;
  end;

end; {PaginaContribuicoes}



  end.
