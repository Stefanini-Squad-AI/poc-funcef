unit uWebReserva;

interface

uses SysUtils, DModAutoAtendimento, uConstPaginasCampos, uCtrlFuncoesAA, uCmFileUtils;

//Monta a página de Extrato de Reserva
//Pendência 22997 - 18/08/2006
function PaginaExtratoReserva( sAnoLocal, sReservaLocal : String; iIdPessoaLocal : integer ) : String;
//Fim Pendência 22997

//Monta a página de Saldo de Reserva
function PaginaSaldoReserva( iIdPessoaLocal : integer ) : String;

implementation

//Monta a página de Extrato de Reserva
//Pendência 22997 - 18/08/2006
function PaginaExtratoReserva( sAnoLocal, sReservaLocal : String; iIdPessoaLocal : integer ) : String;
var
  sPatroAnt, sPlanoAnt, sTituloCampo : String;
  sAno, sAnoSelecionado, sPAno, sUAno : String;
  sReserva, sReservaSelecionada, sPReserva, sUReserva : String;
  bAnoSelecionado : Boolean;
begin

  try

    sTitulo := TituloPagina( pExtratoDeReserva );

    bAnoSelecionado     := false;
    sAnoSelecionado := sAnoLocal;
    sReservaSelecionada := trim(sReservaLocal);
    Result     := '';
    sPatroAnt := '';
    sPlanoAnt := '';

    cdsAux.Close;
    cdsAux.Data := WebReserva.SelecionaReserva( iIdPessoaLocal );

    if not cdsAux.IsEmpty then
    begin
      Result := Result +
       '<center>                                                              ' + CR +
       '  <form method="POST" name="frmAno"                                   ' + CR +
       '   action="../<#nomearqapl>/ConsultaExtratoReserva">                  ' + CR +
       '    <#hiddenfields>                                                   ' + CR +
       '    <span id="CORPO">                                                 ' + CR +
       '      Reserva:&nbsp;                                                  ' + CR +
       '    </span>                                                           ' + CR +
       '    <select size="1" name="cmbReserva" class="CORPO">                 ' + CR ;

      if ( sReservaSelecionada = '' )  then
          Result := Result + '        <option selected> </option> ' + CR
      else
          Result := Result + '        <option>  </option> ' + CR;

      cdsAux.First;
      sPReserva := cdsAux.FieldByName('RESERVA').AsString;
      while True do
      begin
        sReserva := trim(cdsAux.FieldByName('RESERVA').AsString);

        cdsAux.Next;

        if ( sReservaSelecionada = sReserva ) then
          Result := Result + '        <option selected>' + sReserva + '</option> ' + CR
        else
          Result := Result + '        <option>' + sReserva + '</option> ' + CR;

        if cdsAux.Eof then
        begin
          break;
        end;

      end;
      sUReserva := cdsAux.FieldByName('RESERVA').AsString;
      cdsAux.Close;

      Result := Result +
       '    </select>                                                         ' + CR +
       '    <span id="link">                                                  ' + CR +
       '      <a href="JavaScript:EnviaForm( document.frmAno )">              ' + CR +
       '        Ok                                                            ' + CR +
       '      </a>                                                            ' + CR +
       '    </span>                                                           ' + CR ;

      cdsAux.Close;
      cdsAux.Data := WebReserva.SelecionaAno( sReservaSelecionada, iIdPessoaLocal );

      if not cdsAux.IsEmpty then
      begin
        Result := Result +
         '    <br><br><center>                                                  ' + CR +
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
             ( cdsAux.Eof and not bAnoSelecionado ) then
          begin
            Result := Result + '        <option selected>' + sAno + '</option> ' + CR;
            sAnoSelecionado := sAno;
            bAnoSelecionado := true;
          end
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
         '      <a href="JavaScript:EnviaForm( document.frmAno )">              ' + CR +
         '        Ok                                                            ' + CR +
         '      </a>                                                            ' + CR +
         '    </span>                                                           ' + CR +
         '  </form>                                                             ' + CR +
         '  <p class="link">                                                    ' + CR ;

        if ( sPAno <> sAnoSelecionado ) or
           ( sPReserva <> sReservaSelecionada )then
          Result := Result +
           '    <a href="JavaScript:EnviaForm( document.frmLnkAnterior )">            ' + CR +
           '      Anterior                                                        ' + CR +
           '    </a>                                                              ' + CR ;

        if ( ( sPAno <> sAnoSelecionado ) and ( sUAno <> sAnoSelecionado ) ) or
           ( ( sPReserva <> sReservaSelecionada ) and ( sUReserva <> sReservaSelecionada ) ) then
          Result := Result +
          '    &nbsp;|&nbsp;                                                      ' + CR;

        if ( sUAno <> sAnoSelecionado ) or
           ( sUReserva <> sReservaSelecionada ) then
          Result := Result +
         '    <a href="JavaScript:EnviaForm( document.frmLnkProximo )">             ' + CR +
         '      Próximo                                                         ' + CR +
         '    </a>                                                              ' + CR ;

        Result := Result +
         '  </p>                                                                ' + CR +
         '</center>                                                             ' + CR ;

        sTitulo := TituloPagina( pExtratoDeReserva ) + ' - ' + sAnoSelecionado;

        if sReservaSelecionada <> '' then
          sTitulo := sTitulo + ' - ' + sReservaSelecionada;

        cds.Close;
        cds.Data := WebReserva.SelecionaExtratoReserva( sAnoSelecionado, sReservaSelecionada, iIdPessoaLocal );

        if not cds.IsEmpty then
        begin

          if TemAcessoCampo( sTipoUsuario, cTabelaExtratoDeReserva, sTituloCampo ) then
          begin
            cdsHTMLColumns.Close;
            cdsHTMLColumns.CreateDataSet;
            IncluiColuna( cMesRefExtratoDeReserva,  4, 'left' );
            IncluiColuna( cES,                      2, 'left' );
            IncluiColuna( cNomeDaReservaExtrato,   24, 'left' );
            IncluiColuna( cContribuicaoExtrato,    24, 'left' );
            IncluiColuna( cBeneficio,              18, 'left' );
            IncluiColuna( cValorDaReserva,          7, 'right' );
            IncluiColuna( cSaldo,                   7, 'right' );
          end;

          cds.First;
          while True do
          begin

            //Nova patrocinadora
            if cds.FieldByName('PATROCINADORA').AsString <> sPatroAnt then
            begin
              if sPatroAnt <> '' then
                Result := Result + '<BR><BR><BR>';

              Result := Result +
               '<table class="PRINC" border="0" width="100%"                  ' + CR +
               ' cellspacing="0" cellpadding="0" >                            ' + CR +
               '  <tr>                                                        ' + CR +
               '    <td width="100%" colspan="2" class="CABPRINC">            ' + CR +
               cds.FieldByName('PATROCINADORA').AsString                        + CR +
               '    </td>                                                     ' + CR +
               '  </tr>                                                       ' + CR ;

              sPatroAnt := cds.FieldByName('PATROCINADORA').AsString;
              sPlanoAnt := '';
            end;

            //Novo plano
            if  cds.FieldByName('PLANO').AsString <> sPlanoAnt then
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

              sPlanoAnt := cds.FieldByName('PLANO').AsString;

              if TemAcessoCampo( sTipoUsuario, cTabelaExtratoDeReserva, sTituloCampo ) then
                Result := Result + HTMLTableHeader;
            end;

            if TemAcessoCampo( sTipoUsuario, cTabelaExtratoDeReserva, sTituloCampo ) then
            begin
              PreencheColuna( cMesRefExtratoDeReserva, trim( cds.FieldByName('MESREFERENCIAF').AsString ) );
              PreencheColuna( cES,                     trim( cds.FieldByName('FLGENTRADA').AsString ) );
              PreencheColuna( cNomeDaReservaExtrato,   StrToName( trim( cds.FieldByName('NOME').AsString ) ) );
              PreencheColuna( cContribuicaoExtrato,    StrToName( trim( cds.FieldByName('NOMECONTRIB').AsString ) ) );
              PreencheColuna( cBeneficio,              StrToName( trim( cds.FieldByName('NOMEBENEF').AsString ) ) );
              PreencheColuna( cValorDaReserva,         FormatFloat( '#,##0.00', cds.FieldByName('VLRREAL').AsFloat ) );
              PreencheColuna( cSaldo,                  FormatFloat( '#,##0.00', cds.FieldByName('SALDOREAL').AsFloat ) );
            end;

            cds.Next;

            if TemAcessoCampo( sTipoUsuario, cTabelaExtratoDeReserva, sTituloCampo ) then
              Result := Result + HTMLTableRow;

            if ( cds.FieldByName('PLANO').AsString <> sPlanoAnt )
             or ( cds.FieldByName('PATROCINADORA').AsString <> sPatroAnt )
             or cds.Eof then
            begin

              if TemAcessoCampo( sTipoUsuario, cTabelaExtratoDeReserva, sTituloCampo ) then
                Result := Result + HTMLTableFooter + '<BR>' + CR ;

              if ( cds.FieldByName('PATROCINADORA').AsString <> sPatroAnt )
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

        if ( sPAno <> sAnoSelecionado ) or
           ( sPReserva <> sReservaSelecionada ) then
          Result := Result +
           '    <a href="JavaScript:EnviaForm( document.frmLnkAnterior )">            ' + CR +
           '      Anterior                                                        ' + CR +
           '    </a>                                                              ' + CR ;

        if ( ( sPAno <> sAnoSelecionado ) and ( sUAno <> sAnoSelecionado ) ) or
           ( ( sPReserva <> sReservaSelecionada ) and ( sUReserva <> sReservaSelecionada ) ) then
          Result := Result +
          '    &nbsp;|&nbsp;                                                      ' + CR;

        if ( sUAno <> sAnoSelecionado ) or
           ( sUReserva <> sReservaSelecionada ) then
          Result := Result +
           '    <a href="JavaScript:EnviaForm( document.frmLnkProximo )">             ' + CR +
           '      Próximo                                                         ' + CR +
           '    </a>                                                              ' + CR ;

        Result := Result + ' </font> </p> ' + CR ;

        Result := Result +
         '  <form method="POST" name="frmLnkAnterior"                           ' + CR +
         '   action="../<#nomearqapl>/ConsultaExtratoReserva">    ' + CR +
         '    <#hiddenfields>                                                   ' + CR +
         '    <input type="hidden" name="cmbAno" value="'                         +
         IntToStr( StrToIntDef( sAnoSelecionado, 0 ) - 1 )       + '">          ' + CR +
         '    <input type="hidden" name="cmbReserva" value="' + sReservaSelecionada + '">          ' + CR +
         '  </form>                                                             ' + CR +
         '  <form method="POST" name="frmLnkProximo"                            ' + CR +
         '   action="../<#nomearqapl>/ConsultaExtratoReserva">    ' + CR +
         '    <#hiddenfields>                                                   ' + CR +
         '    <input type="hidden" name="cmbAno" value="'                         +
         IntToStr( StrToIntDef( sAnoSelecionado, 0 ) + 1 )       + '">          ' + CR +
         '    <input type="hidden" name="cmbReserva" value="' + sReservaSelecionada + '">          ' + CR +
         '  </form>                                                             ' + CR ;

      end;

    end;

    cds.Close;
    cdsAux.Close;
    cdsHTMLColumns.Close;

    Result := MontaPagina( pExtratoDeReserva, Result );

//Fim Pendência 22997

  except
    On E : Exception do
    begin
      Result := TrataWebExcecoes( E );
    end;
  end;

end; {PaginaReserva}


//Monta a página de Saldo de Reserva
function PaginaSaldoReserva( iIdPessoaLocal : integer ) : String;
var
  sPatroAnt, sPlanoAnt, sTituloCampo : String;
  fTotal : real;
begin

  try

    sTitulo := TituloPagina( pSaldoDeReserva );

    sPatroAnt := '';
    sPlanoAnt := '';
    fTotal    := 0;

    cds.Close;
    cds.Data := WebReserva.SelecionaSaldoReserva( iIdPessoaLocal );

    if not cds.IsEmpty then
    begin

      if TemAcessoCampo( sTipoUsuario, cTabelaSaldoDeReserva, sTituloCampo ) then
      begin
        cdsHTMLColumns.Close;
        cdsHTMLColumns.CreateDataSet;

        IncluiColuna( cDataUltAlim,            8, 'left' );
        IncluiColuna( cSaldoDataRef,           8, 'left' );
        IncluiColuna( cNomeDaReservaSaldo,    34, 'left' );
        IncluiColuna( cSituacaoDaReserva,      8, 'left' );
        IncluiColuna( cReservaEmCotas,        14, 'right' );
        IncluiColuna( cValorDaCota,           14, 'right' );
        IncluiColuna( cValorDoSaldoDeReserva, 14, 'right' );
      end;

      cds.First;
      while True do
      begin

        //Nova patrocinadora
        if cds.FieldByName('PATROCINADORA').AsString <> sPatroAnt then
        begin
          if sPatroAnt <> '' then
            Result := Result + '<BR><BR><BR>' + CR;
            
          Result := Result +
           '<table class="PRINC" border="0" width="100%"                  ' + CR +
           ' cellspacing="0" cellpadding="0" >                            ' + CR +
           '  <tr>                                                        ' + CR +
           '    <td width="100%" colspan="2" class="CABPRINC">            ' + CR +
           cds.FieldByName('PATROCINADORA').AsString                        + CR +
           '    </td>                                                     ' + CR +
           '  </tr>                                                        ' + CR ;

          sPatroAnt := cds.FieldByName('PATROCINADORA').AsString;
          sPlanoAnt := '';
          fTotal    := 0;
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

          if TemAcessoCampo( sTipoUsuario, cTabelaSaldoDeReserva, sTituloCampo ) then
            Result := Result + HTMLTableHeader;

          sPlanoAnt := cds.FieldByName('PLANO').AsString;
        end;

        if TemAcessoCampo( sTipoUsuario, cTabelaSaldoDeReserva, sTituloCampo ) then
        begin
          PreencheColuna( cDataUltAlim,           FormataDataHora( 'dd/mm/yy', cds.FieldByName('DATAULTALIM').AsString ) );
          PreencheColuna( cSaldoDataRef,          FormataDataHora( 'dd/mm/yy', cds.FieldByName('DATAREFERENCIASA').AsString ) );
          PreencheColuna( cNomeDaReservaSaldo,    StrToName( trim( cds.FieldByName('NOME').AsString ) ) );
          PreencheColuna( cSituacaoDaReserva,     cds.FieldByName('FLGATIVO').AsString );
          PreencheColuna( cReservaEmCotas,        FormatFloat( '#,##0.######', cds.FieldByName('VALORRESERVA').AsFloat ) );
          PreencheColuna( cValorDaCota,           FormatFloat( '#,##0.######', cds.FieldByName('COTVALOR').AsFloat ) );
          PreencheColuna( cValorDoSaldoDeReserva, FormatFloat( '#,##0.00', cds.FieldByName('VLRATUAL').AsFloat ) );
          Result := Result + HTMLTableRow;
        end;

        fTotal    := fTotal + cds.FieldByName('VLRATUAL').AsFloat;

        cds.Next;

        if ( cds.FieldByName('PLANO').AsString <> sPlanoAnt )
         or ( cds.FieldByName('PATROCINADORA').AsString <> sPatroAnt )
         or cds.Eof then
        begin

          if TemAcessoCampo( sTipoUsuario, cTabelaSaldoDeReserva, sTituloCampo ) then
            Result := Result + HTMLTableFooter + '<BR>' + CR ;

          if ( cds.FieldByName('PATROCINADORA').AsString <> sPatroAnt )
           or cds.Eof then
          begin
            if TemAcessoCampo( sTipoUsuario, cSaldoReserva, sTituloCampo ) then
              Result := Result +
               '    <BR>                                                      ' + CR +
               '      <p align="right">                                       ' + CR +
               '        <SPAN id="DESCCAMPO">                                 ' + CR +
               sTituloCampo + '&nbsp; &nbsp;                                  ' + CR +
               '        </SPAN>                                               ' + CR +
               '        <SPAN id="CONTCAMPO">                                 ' + CR +
               FormatFloat( '#,##0.00', fTotal )                                + CR +
               '        </SPAN>                                               ' + CR +
               '      </p>                                                    ' + CR ;

            Result := Result +
             '    </td>                                                       ' + CR +
             '  </tr>                                                         ' + CR +
             '</table>                                                        ' + CR ;
          end;
        end;

        if cds.Eof then
         break;

      end;
    end;

    cds.Close;
    cdsHTMLColumns.Close;

    Result := MontaPagina( pSaldoDeReserva, Result );

  except
    On E : Exception do
    begin
      Result := TrataWebExcecoes( E );
    end;
  end;

end; {PaginaSaldoReserva}


end.
