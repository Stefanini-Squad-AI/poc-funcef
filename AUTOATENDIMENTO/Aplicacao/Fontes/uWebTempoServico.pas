unit uWebTempoServico;

interface

uses SysUtils, DModAutoAtendimento, uConstPaginasCampos, uCmTypes,
     uCMClientDataSet, uMidasUtil, uCtrlFuncoesAA;

//Monta a página de Tempo de Serviço
function PaginaTempoServico( iIdPessoaLocal : integer ) : String;

implementation

//Monta a página de Tempo de Serviço
function PaginaTempoServico( iIdPessoaLocal : integer ) : String;
var
  sTituloCampo, sAux : String;
  iSeqLegenda : integer;  
begin
  try
    sTitulo := TituloPagina( pTempoDeServico );
    Cds.Close;
    Cds.Data := TempoServico.CalculaTempos(iIdpessoa, now);

    Cds.First;
   // escrever tempos de servicos por extenso

    Result := Result +
     '<table border="0" width="100%" cellspacing="0" cellpadding="0" >' + CR ;

   // Tempo total COM conversão
    if  TemAcessoCampo( sTipoUsuario, cTmpSrvCConversaoDias, sTituloCampo    )
     or TemAcessoCampo( sTipoUsuario, cTmpSrvCConversaoExtenso, sTituloCampo ) then
    begin

      Result := Result +
       '      <tr>                                                    ' + CR +
       '        <td>                                                  ' + CR +
       '          <SPAN id="DESCCAMPO">                               ' + CR +
       sTituloCampo  + ': '                                             + CR +
       '          </SPAN>                                             ' + CR ;

      if TemAcessoCampo( sTipoUsuario, cTmpSrvCConversaoDias, sTituloCampo ) then
        Result := Result +
         '          <SPAN id="CONTCAMPO">                               ' + CR +
         Cds.FieldByName('TEMPOSERVCALC').AsString                        + CR +
         '          </SPAN>                                             ' + CR ;

      if TemAcessoCampo(sTipoUsuario, cTmpSrvCConversaoExtenso, sTituloCampo ) then
        Result := Result +
         '          <SPAN id="CONTCAMPO">                                   ' + CR +
         '&nbsp;&nbsp;( ' + TempoServico.TempoExtenso(Cds.FieldByName('TEMPOSERVCALC').AsInteger) + ' ) ' + CR +
         '          </SPAN>                                                 ' + CR ;

      Result := Result +
       '        </td>                                                 ' + CR +
       '      </tr>                                                   ' + CR ;
    end;

// Tempo total SEM conversão
    if  TemAcessoCampo( sTipoUsuario, cTmpSrvSConversaoDias, sTituloCampo    )
     or TemAcessoCampo( sTipoUsuario, cTmpSrvSConversaoExtenso, sTituloCampo ) then
    begin
      Result := Result +
       '      <tr>                                                    ' + CR +
       '        <td>                                                  ' + CR +
       '          <SPAN id="DESCCAMPO">                               ' + CR +
       sTituloCampo  + ': '                                             + CR +
       '          </SPAN>                                             ' + CR ;

      if TemAcessoCampo( sTipoUsuario, cTmpSrvSConversaoDias, sTituloCampo ) then
        Result := Result +
         '          <SPAN id="CONTCAMPO">                               ' + CR +
         Cds.FieldByName('TEMPOSEMCONVERSAO').AsString                    + CR +
         '          </SPAN>                                             ' + CR ;

      if TemAcessoCampo(sTipoUsuario, cTmpSrvSConversaoExtenso, sTituloCampo ) then
        Result := Result +
         '          <SPAN id="CONTCAMPO">                                   ' + CR +
         '&nbsp;&nbsp;( ' + TempoServico.TempoExtenso(Cds.FieldByName('TEMPOSEMCONVERSAO').AsInteger) + ' ) ' + CR +
         '          </SPAN>                                                 ' + CR ;

      Result := Result +
       '        </td>                                                 ' + CR +
       '      </tr>                                                   ' + CR ;
    end;


    if TemAcessoCampo( sTipoUsuario, cTmpSrvTabela, sTituloCampo ) then
    begin

      if not cds.IsEmpty then
      begin
        cdsHTMLColumns.Close;
        cdsHTMLColumns.CreateDataSet;

        cds.First;
        IncluiColuna( cTmpSrvEmpresa,             26,  'left' );
        IncluiColuna( cTmpSrvDtInicial,           07,  'left' );
        IncluiColuna( cTmpSrvDtFinal,             07,  'left' );
        IncluiColuna( cTmpSrvCargo,               10,  'left' );
        IncluiColuna( cTmpSrvFuncao,              10,  'left' );
        IncluiColuna( cTmpSrvInsalubridade,       09,  'left' ); //ESPECIAL
        IncluiColuna( cTmpSrvFator,               05,  'left' );
        IncluiColuna( cTmpSrvTempoExtenso,        22,  'left' ); // TEMPOtOTALiNDIV

        iSeqLegenda := 1;
        if TemAcessoCampo( sTipoUsuario, cTmpSrvContaTempoDeServico, sAux ) then
          IncluiColuna( cTmpSrvContaTempoDeServico, 02,  'center', '(' + IntToStr( IncAfter( iSeqLegenda ) ) + ')' );
        if TemAcessoCampo( sTipoUsuario, cTmpSrvTransfConcomitante, sAux ) then
          IncluiColuna( cTmpSrvTransfConcomitante,  02,  'center', '(' + IntToStr( IncAfter( iSeqLegenda ) ) + ')' );

      end;

      Result := Result +
       '  <tr>                                                        ' + CR +
       '    <td> <BR>                                                 ' + CR +
      HTMLTableHeader;

      cds.First;
      while not cds.eof do
      begin
        PreencheColuna(  cTmpSrvEmpresa,             trim( cds.FieldByName('EMPRESA').AsString ) );
        PreencheColuna(  cTmpSrvDtInicial,           FormataDataHora( 'dd/mm/yy', cds.FieldByName('DATAINICIO').AsString ) );
        PreencheColuna(  cTmpSrvDtFinal,             FormataDataHora( 'dd/mm/yy', cds.FieldByName('DATAFINAL').AsString ) );
        PreencheColuna(  cTmpSrvContaTempoDeServico, Copy( trim( cds.FieldByName('FLGCONTATSTRANSF').AsString ), 1, 1 ) );
        PreencheColuna(  cTmpSrvTransfConcomitante,  Copy( trim( cds.FieldByName('FLGCONCOMITANTETRANSF').AsString ), 1, 1 )  );
        PreencheColuna(  cTmpSrvCargo,               cds.FieldByName('CARGO').AsString );
        PreencheColuna(  cTmpSrvFuncao,              cds.FieldByName('FUNCAO').AsString );
        PreencheColuna(  cTmpSrvInsalubridade,       cds.FieldByName('CODTPINSALUBRI').AsString ); //ESPECIAL
        PreencheColuna(  cTmpSrvFator,               cds.FieldByName('FATOR').AsString );
        PreencheColuna(  cTmpSrvTempoExtenso,        TempoServico.TempoExtenso(TempoServico.CalcTempoContrib(Cds.FieldByName('IDPESSOA').AsInteger,
                                                     Cds.FieldByName('SEQHISTFUNC').AsInteger,
                                                     Cds.FieldByName('FLGCONTATS').AsInteger,
                                                     1, // Calculo Normal
                                                     Cds.FieldByName('DATAINICIO').AsString,
                                                     Cds.FieldByName('DATAFINAL').AsString,
                                                     DateToStr(now)))
 ); // TEMPOtOTALiNDIV

        Result := Result + HtmlTableRow;
        cds.Next;
      end;

      Result := Result +   HTMLTableFooter;

    end;

    Result := Result + '</table>' + CR ;

    if  TemAcessoCampo( sTipoUsuario, cTmpSrvContaTempoDeServico, sTituloCampo )
     or TemAcessoCampo( sTipoUsuario, cTmpSrvTransfConcomitante,  sTituloCampo ) then
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

      if TemAcessoCampo( sTipoUsuario, cTmpSrvContaTempoDeServico, sTituloCampo ) then
        Result := Result +
          '  <tr>                                               ' + CR +
          '    <td class="LEGCONT" width="15%" align="center">  ' + CR +
          '      (' + IntToStr( IncAfter( iSeqLegenda ) ) + ')  ' + CR +
          '    </td>                                            ' + CR +
          '    <td class="LEGCONT" align="left">                ' + CR +
          sTituloCampo                                            + CR +
          '    </td>                                            ' + CR +
          '  </tr>                                              ' + CR ;

      if TemAcessoCampo( sTipoUsuario, cTmpSrvTransfConcomitante, sTituloCampo ) then
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

    cds.Close;
    cdsHTMLColumns.Close;
    Result := MontaPagina( pTempoDeServico, Result );

  except
    On E : Exception do
    begin
      Result := TrataWebExcecoes( E );
    end;
  end;

end; {PaginaTempoServico}



end.
