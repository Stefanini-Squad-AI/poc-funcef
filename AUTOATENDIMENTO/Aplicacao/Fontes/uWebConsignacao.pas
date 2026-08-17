unit uWebConsignacao;

interface

uses SysUtils, DModAutoAtendimento, uConstPaginasCampos, JclSysUtils,
     uCtrlFuncoesAA;

//Monta a página de Consignação Judicial
function PaginaConsignacao( iIdPessoaLocal : integer ) : String;

//Monta a página de Dados de Consignação Judicial
function PaginaDadosConsigJudicial( sAnoLocal : String; iIdFavorecido, iIdPessoaLocal : integer ) : String;

implementation

//Monta a página de Consignação Judicial
function PaginaConsignacao( iIdPessoaLocal : integer ) : String;
var
  sTituloCampo, sAux : String;
  iSeqLegenda : integer;
begin

  try

    sTitulo := TituloPagina( pConsignacaoJudicial );

    cds.Close;
    cds.Data := WebConsignacao.SelecionaConsignacao( iIdPessoaLocal );

    if TemAcessoPagina( sTipoUsuario, pDadosConsignacaoJudicial, sTituloCampo ) then
      //JavaScript para link dinâmico para detalhes da consignação.
      sJavaScript := ' function Detalhes( sIdFavorecido )                                        ' + CR +
                     ' {                                                                         ' + CR +
                     '   document.frmLnkDadosConsigJudicial.vIdFavorecido.value = sIdFavorecido; ' + CR +
                     '   EnviaForm( document.frmLnkDadosConsigJudicial );                        ' + CR +
                     ' }                                                                         ' + CR ;

    if not cds.IsEmpty then
    begin

      if TemAcessoCampo( sTipoUsuario, cTabelaConsigJudicial, sTituloCampo ) then
      begin
        cdsHTMLColumns.Close;
        cdsHTMLColumns.CreateDataSet;

        IncluiColuna( cDtInicialConsigJudicial,     8, 'left' );
        IncluiColuna( cDtFinalConsigJudicial,       8, 'left' );
        IncluiColuna( cFavorecidoConsigJudicial,   28, 'left' );
        IncluiColuna( cParcelasConsigJudicial,      8, 'left' );
        IncluiColuna( cProcessadasConsigJudicial,   8, 'left' );
        IncluiColuna( cAlimentadoConsigJudicial,   28, 'left' );

        iSeqLegenda := 1;
        if TemAcessoCampo( sTipoUsuario, cAbonoConsigJudicial, sAux ) then
          IncluiColuna( cAbonoConsigJudicial,         3, 'left', '(' + IntToStr( IncAfter( iSeqLegenda ) ) + ')' );
        if TemAcessoCampo( sTipoUsuario, cPermanenteConsigJudicial, sAux ) then
          IncluiColuna( cPermanenteConsigJudicial,    3, 'left', '(' + IntToStr( IncAfter( iSeqLegenda ) ) + ')' );

        if TemAcessoPagina( sTipoUsuario, pDadosConsignacaoJudicial, sTituloCampo ) then
          IncluiColuna( cTabelaConsigJudicial,      2, 'center', ' ' );

        Result := Result + HTMLTableHeader;

      end;

      cds.First;
      while not cds.Eof do
      begin

        PreencheColuna( cDtInicialConsigJudicial,   FormataDataHora( 'dd/mm/yyyy', cds.FieldByName('DATAINICIO').AsString ) );
        PreencheColuna( cDtFinalConsigJudicial,     FormataDataHora( 'dd/mm/yyyy', cds.FieldByName('DATAFINAL').AsString ) );
        PreencheColuna( cFavorecidoConsigJudicial,  StrToName( cds.FieldByName('FAVORECIDO').AsString ) );
        PreencheColuna( cParcelasConsigJudicial,    IntToStr( cds.FieldByName('PARCELAS').AsInteger ) );
        PreencheColuna( cProcessadasConsigJudicial, IntToStr( cds.FieldByName('PROCESSADAS').AsInteger ) );
        PreencheColuna( cAlimentadoConsigJudicial,  StrToName( cds.FieldByName('ALIMENTADO').AsString ) );
        PreencheColuna( cAbonoConsigJudicial,       Iff( cds.FieldByName('FLGUSAABONO').AsInteger = 1, 'S', 'N' ) );
        PreencheColuna( cPermanenteConsigJudicial,  Iff( cds.FieldByName('FLGPERMANENTE').AsInteger = 1, 'S', 'N' ) );

        if TemAcessoPagina( sTipoUsuario, pDadosConsignacaoJudicial, sTituloCampo ) then
          PreencheColuna( cTabelaConsigJudicial, '<a href="JavaScript:Detalhes(' +
           cds.FieldByName('IDFAVORECIDO').AsString + ')"><img src="..\imagem\detalhestbl.gif" border=0></a>' );

        Result := Result + HTMLTableRow;

        cds.Next;

      end;

      Result := Result + HTMLTableFooter;

    end;

    if  TemAcessoCampo( sTipoUsuario, cAbonoConsigJudicial, sTituloCampo )
     or TemAcessoCampo( sTipoUsuario, cPermanenteConsigJudicial, sTituloCampo ) then
    begin
      iSeqLegenda := 1;

      Result := Result +
        '<p align="right">                                    ' + CR +
        '<table class="LEGENDA" width="250">                  ' + CR +
        '  <tr>                                               ' + CR +
        '    <td class="LEGCAB" COLSPAN="2">                  ' + CR +
        '      Legenda                                        ' + CR +
        '    </td>                                            ' + CR +
        '  </tr>                                              ' + CR ;

      if TemAcessoCampo( sTipoUsuario, cAbonoConsigJudicial, sTituloCampo ) then
        Result := Result +
          '  <tr>                                               ' + CR +
          '    <td class="LEGCONT" width="15%" align="center">  ' + CR +
          '      (' + IntToStr( IncAfter( iSeqLegenda ) ) + ')  ' + CR +
          '    </td>                                            ' + CR +
          '    <td class="LEGCONT" align="left">                ' + CR +
          sTituloCampo                                            + CR +
          '    </td>                                            ' + CR +
          '  </tr>                                              ' + CR ;

      if TemAcessoCampo( sTipoUsuario, cPermanenteConsigJudicial, sTituloCampo ) then
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

    if TemAcessoPagina( sTipoUsuario, pDadosConsignacaoJudicial, sTituloCampo ) then
    begin
      Result := Result +
        '<img src="..\imagem\detalhestbl.gif">                                        ' + CR +
        '<SPAN id="DESCCAMPO">                                                        ' + CR +
        '  Clique neste símbolo para consultar detalhes sobre a consignação judicial. ' + CR +
        '</SPAN>                                                                      ' + CR +
        '<form method="POST" name="frmLnkDadosConsigJudicial"                         ' + CR +
        ' action="../<#nomearqapl>/ConsultaDadosConsigJudicial">  ' + CR +
        HiddenFields                                                                    + CR +
        '<input type="hidden" name="vIdFavorecido">                                   ' + CR +
        '</form>' + CR;
    end;

    cds.Close;
    cdsHTMLColumns.Close;

    Result := MontaPagina( pConsignacaoJudicial, Result );

  except
    On E : Exception do
    begin
      Result := TrataWebExcecoes( E );
    end;
  end;

end; {PaginaConsignacao}



//Monta a página de Dados de Consignação Judicial
function PaginaDadosConsigJudicial( sAnoLocal : String; iIdFavorecido, iIdPessoaLocal : integer ) : String;
var
  sAno, sAnoSelecionado, sPAno, sUAno : String;
  sTituloCampo, sCombo : String;
begin
  try

    sTitulo := TituloPagina( pDadosConsignacaoJudicial );

    sAnoSelecionado := sAnoLocal;
    sCombo := '';

    cdsAux.Close;
    cdsAux.Data := WebConsignacao.SelecionaAnoPagtoConsignacao( iIdFavorecido, iIdPessoaLocal );
    if not cdsAux.IsEmpty then
    begin
      sCombo := 
       '    <center>                                                                      ' + CR +
       '      <form method="POST" name="frmAno"                                           ' + CR +
       '       action="../<#nomearqapl>/ConsultaDadosConsigJudicial#combo"> ' + CR +
       '        <#hiddenfields>                                                           ' + CR +
       '        <input type="hidden" name="vIdFavorecido" value="' + IntToStr( iIdFavorecido ) + '"> ' + CR +
       '        <span id="CORPO">                                                         ' + CR +
       '          Ano:&nbsp;                                                              ' + CR +
       '        </span>                                                                   ' + CR +
       '        <select size="1" name="cmbAno" class="CORPO">                             ' + CR ;

      cdsAux.First;
      sPAno := cdsAux.FieldByName('ANO').AsString;
      while True do
      begin
        sAno := cdsAux.FieldByName('ANO').AsString;

        cdsAux.Next;

        if ( sAnoSelecionado = sAno ) or
           ( cdsAux.Eof and ( sAnoSelecionado = '' ) ) then
          sCombo := sCombo + '          <option selected>' + sAno + '</option> ' + CR
        else
          sCombo := sCombo + '          <option>' + sAno + '</option> ' + CR;

        if cdsAux.Eof then
        begin
          if sAnoSelecionado = '' then sAnoSelecionado := sAno;
          break;
        end;

      end;
      sUAno := cdsAux.FieldByName('ANO').AsString;
      cdsAux.Close;

      sCombo := sCombo +
       '        </select>                                                         ' + CR +
       '        <span id="link">                                                  ' + CR +
       '          <a href="JavaScript:EnviaForm( document.frmAno )">              ' + CR +
       '            Ok                                                            ' + CR +
       '          </a>                                                            ' + CR +
       '        </span>                                                           ' + CR +
       '      </form>                                                             ' + CR +
       '      <p class="link">                                                    ' + CR ;

      if sPAno <> sAnoSelecionado then
        sCombo := sCombo +
         '        <a href="JavaScript:EnviaForm( document.frmLnkAnterior )">      ' + CR +
         '          Anterior                                                      ' + CR +
         '        </a>                                                            ' + CR ;

      if ( sPAno <> sAnoSelecionado ) and ( sUAno <> sAnoSelecionado ) then
        sCombo := sCombo +
        '      &nbsp;|&nbsp;                                                      ' + CR;

      if sUAno <> sAnoSelecionado then
        sCombo := sCombo +
         '      <a href="JavaScript:EnviaForm( document.frmLnkProximo )">      ' + CR +
         '        Próximo                                                      ' + CR +
         '      </a>                                                           ' + CR ;

      sCombo := sCombo +
       '      </p>                                                              ' + CR +
       '    </center>                                                           ' + CR ;       
    end;


    cds.Close;
    cds.Data := WebConsignacao.SelecionaDadosConsignacao( iIdFavorecido, iIdPessoaLocal );

    if not cds.IsEmpty then
    begin

      //Detalhes do evento
      if TemAcessoCampo( sTipoUsuario, cDetalhesConsigJudicial, sTituloCampo ) then
      begin
        Result := Result +
         '<p class="CABDIV">' + sTituloCampo +' </p>                                   ' + CR +
         '<table border="0" width="100%" cellpadding="0" cellspacing="0">              ' + CR ;

        if TemAcessoCampo( sTipoUsuario, cFavorecidoDetConsigJudicial, sTituloCampo ) then
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
           StrToName( cds.FieldByName('FAVORECIDO').AsString )                           + CR +
           '      </p>                                                                 ' + CR +
           '    </td>                                                                  ' + CR +
           '  </tr>                                                                    ' + CR +
           '  <tr height="10"></tr>                                                    ' + CR ;


        Result := Result + IncluiCampo( cDtInicialDetConsigJudicial,
         FormataDataHora( 'dd/mm/yyyy', cds.FieldByName('DATAINICIO').AsString ) );

        Result := Result + IncluiCampo( cDtFinalDetConsigJudicial,
         FormataDataHora( 'dd/mm/yyyy', cds.FieldByName('DATAFINAL').AsString ) );

        Result := Result + IncluiCampo( cParcelasDetConsigJudicial,
         cds.FieldByName('PARCELAS').AsString );

        Result := Result + IncluiCampo( cProcessadasDetConsigJudicial,
         cds.FieldByName('PROCESSADAS').AsString );

        Result := Result + IncluiCampo( cAlimentadoDetConsigJudicial,
         cds.FieldByName('ALIMENTADO').AsString );

        Result := Result + IncluiCampo( cAbonoAnualDetConsigJudicial,
         Iff( cds.FieldByName('FLGUSAABONO').AsInteger = 1, 'S', 'N' ) );

        Result := Result + IncluiCampo( cPermanenteDetConsigJudicial,
         Iff( cds.FieldByName('FLGPERMANENTE').AsInteger = 1, 'S', 'N' ) );

        Result := Result +
         '</table>                                                                     ' + CR +
         '<BR><BR><BR><BR>                                                             ' + CR ;
      end;

      //Pagamentos
      if TemAcessoCampo( sTipoUsuario, cTabelaPagamentos, sTituloCampo ) then
      begin
        cds.Close;
        cds.Data := WebConsignacao.SelecionaPagtoConsignacao( sAnoSelecionado, iIdFavorecido, iIdPessoaLocal );

        if not cds.IsEmpty then
        begin

          Result := Result +
           ' <a name="#combo"> </a> <hr>' + sCombo;

          Result := Result +
           '<p class="CABDIV">' + sTituloCampo + ' </p>                   ' + CR ;

          cdsHTMLColumns.Close;
          cdsHTMLColumns.CreateDataSet;

          IncluiColuna( cMesRefDetConsigJudicial,    33, 'left' );
          IncluiColuna( cDataPagtoDetConsigJudicial, 33, 'left' );
          IncluiColuna( cValorDetConsigJudicial,     33, 'left' );

          Result := Result + HTMLTableHeader;

          cds.First;
          while not cds.Eof do
          begin
            PreencheColuna( cMesRefDetConsigJudicial,    cds.FieldByName('MESF').AsString );
            PreencheColuna( cDataPagtoDetConsigJudicial, FormataDataHora( 'dd/mm/yyyy', cds.FieldByName('DATAPAGAMENTO').AsString ) );
            PreencheColuna( cValorDetConsigJudicial,     FormatFloat( '#,##0.00', cds.FieldByName('VALORPROVENTO').AsFloat ) );

            Result := Result + HTMLTableRow;
            cds.Next;
          end;

          Result := Result + HTMLTableFooter;

          Result := Result +
           '    <center>                                                           ' + CR +
           '      <p class="link">                                                 ' + CR ;

          if sPAno <> sAnoSelecionado then
            Result := Result +
             '        <a href="JavaScript:EnviaForm( document.frmLnkAnterior )">   ' + CR +
             '          Anterior                                                   ' + CR +
             '        </a>                                                         ' + CR ;

          if ( sPAno <> sAnoSelecionado ) and ( sUAno <> sAnoSelecionado ) then
            Result := Result +
            '      &nbsp;|&nbsp;                                                   ' + CR;

          if sUAno <> sAnoSelecionado then
            Result := Result +
             '      <a href="JavaScript:EnviaForm( document.frmLnkProximo )">      ' + CR +
             '        Próximo                                                      ' + CR +
             '      </a>                                                           ' + CR ;

          Result := Result +
           '      </p>                                                             ' + CR +
           '    </center> <BR><BR>                                                 ' + CR ;

        end;

      end;

    end;


    Result := Result +
     '  <form method="POST" name="frmLnkAnterior"                                   ' + CR +
     '   action="../<#nomearqapl>/ConsultaDadosConsigJudicial#combo"> ' + CR +
     '    <#hiddenfields>                                                           ' + CR +
     '    <input type="hidden" name="cmbAno" value="'                                 +
     IntToStr( StrToIntDef( sAnoSelecionado, 0 ) - 1 )       + '">                  ' + CR +
     '    <input type="hidden" name="vIdFavorecido" value="' + IntToStr( iIdFavorecido ) + '">  ' + CR +
     '  </form>                                                                     ' + CR +
     '  <form method="POST" name="frmLnkProximo"                                    ' + CR +
     '   action="../<#nomearqapl>/ConsultaDadosConsigJudicial#combo"> ' + CR +
     '    <#hiddenfields>                                                           ' + CR +
     '    <input type="hidden" name="cmbAno" value="'                                 +
     IntToStr( StrToIntDef( sAnoSelecionado, 0 ) + 1 )       + '">                  ' + CR +
     '    <input type="hidden" name="vIdFavorecido" value="' + IntToStr( iIdFavorecido ) + '">  ' + CR +
     '  </form>                                                                     ' + CR ;

    cdsHTMLColumns.Close;
    cds.Close;

    Result := MontaPagina( pDadosConsignacaoJudicial, Result );

  except
    On E : Exception do
    begin
      Result := TrataWebExcecoes( E );
    end;
  end;

end; {PaginaDadosConsignacao}

end.
