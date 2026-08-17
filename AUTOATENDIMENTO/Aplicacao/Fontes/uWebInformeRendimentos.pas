unit uWebInformeRendimentos;

interface

uses SysUtils, DModAutoAtendimento, uConstPaginasCampos, uCmTypes, uCMClientDataSet,
     JCLSysUtils;

//Monta a página de Informe de Rendimentos
function PaginaInformeRendimentos( iIdPessoaLocal, iFiltro, iAno : integer): string;

implementation

function PaginaInformeRendimentos( iIdPessoaLocal, iFiltro, iAno : integer): string;
var
  //Variáveis de geração e emissão de relatórios
  rtContrato       : TReportType;
  sHTMLFile        : string;
  iIdDataView    ,
  iOrigemCMDV    ,
  iIdReports     ,
  iOrigemCm      : integer;

  iFLGORIGEM,
  iIDRUBRICA13 : integer;
  sNOMERESPON  : string;
  dDATAINFO    : TDateTime;

  sFlgInterno : string;
begin

  try

    sTitulo := TituloPagina( pInformeRendimentos );

    sFlgInterno := WebDadosCadastrais.RecuperaFlgInterno( iIdPessoa );

    if bFlgInfRendAtv and ( sFlgInterno = 'AT' ) then
    begin
      Result := '<BR><BR><p class="CORPO" align="center">Esta opção não está disponível para ativos</p><BR><BR><BR>'
    end
    else
    begin

      cds.Close;
      cds.Data     := WebCfgInfRend.BuscaParametrosInfRend;
      iFLGORIGEM   := cds.fieldByName('FLGORIGEM').AsInteger;
      iIDRUBRICA13 := cds.fieldByName('IDRUBRICA13').AsInteger;
      sNOMERESPON  := cds.fieldByName('NOMERESPON').AsString;
      dDATAINFO    := cds.fieldByName('DATAINFO').AsDateTime;

      cds.Close;
      cds.Data := InformeRendimentos.BuscaAnos( iIdPessoaLocal );

      if cds.IsEmpty then
        Result := Result +
           '<P class="CORPO" align="center">                                     ' + CR +
           '  <BR>                                                               ' + CR +
           '    Não há informe de rendimentos disponível para este participante. ' + CR +
           '  <BR><BR><BR><BR>                                                   ' + CR +
           '</p>                                                                 ' + CR
      else
      begin

        Result := Result +
           '<center>                                                           ' + CR +
           '  <form method="POST" name="frmLnkFiltroInforme"                   ' + CR +
           '        action="../<#nomearqapl>/InformeRendimentos" >             ' + CR +
           '    <#hiddenfields>                                                ' + CR +
           '    <input type="hidden" name="edtFlgFiltro"  value="1">           ' + CR +
           '    <span id="CORPO">                                              ' + CR +
           '      Ano:&nbsp;                                                   ' + CR +
           '    </span>                                                        ' + CR +
           '    <select size="1" name="cmbAno" class="CORPO">                  ' + CR ;

        cds.First;
        while not cds.Eof do
        begin
          Result := Result + '<option>' + cds.FieldByName('ANO').AsString + '</option>' + CR;
          cds.Next;
        end;
        cds.Close;

        Result := Result +
         '    </select>                                                            ' + CR +
         '    <span id="link">                                                     ' + CR +
         '      <a href="JavaScript:EnviaForm( document.frmLnkFiltroInforme )">    ' + CR +
         '        Ok                                                               ' + CR +
         '      </a>                                                               ' + CR +
         '    </span>                                                              ' + CR +
         '  </form>                                                                ' + CR +
         '<center>                                                                 ' + CR ;

        if iFiltro = 1 then
        begin

          //Recupera dados do relatório
          RecuperaConfRelatorio( rInformeRendimentos,
                                 rtContrato,
                                 iIdDataView,
                                 iOrigemCMDV,
                                 iIdReports,
                                 iOrigemCM,
                                 sHTMLFile );

          Result := Result +
           GeraDadosRelatorio( rtContrato,
                               'frmLnkRelInfRend',
                               iIdReports,
                               iOrigemCM,
                               sHTMLFile,
                               'Inscrição em Empréstimo',
                               InformeRendimentos.BuscaDadosInformeFormatado(
                               iIdPessoa,
                               iIdEmpresaProp,
                               iAno,
                               iFLGORIGEM - 1,
                               Iff( iIDRUBRICA13 > 0, IntToStr( iIDRUBRICA13 ), '' ),
                               sNOMERESPON,
                               Iff( dDATAINFO > 0, FormatDateTime( 'dd/mm/yyyy', dDATAINFO ), '' ) ) );

          cds.Close;

          Result := Result +
           '<SCRIPT language="JavaScript">                                           ' + CR +
           '  document.frmLnkRelInfRend.submit();                                    ' + CR +
           '</script>                                                                ' + CR ;

        end;
      end;

      cds.Close;
    end;

    Result := MontaPagina( pInformeRendimentos, Result );

  except
    On E : Exception do
    begin
      Result := TrataWebExcecoes( E );
    end;
  end;

end;  {PaginaFiltro}


end.
