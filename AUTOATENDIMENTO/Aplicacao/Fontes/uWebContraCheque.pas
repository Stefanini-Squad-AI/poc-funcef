unit uWebContraCheque;

interface

uses SysUtils, DModAutoAtendimento, uConstPaginasCampos, uCtrlFuncoesAA;

//Monta a página do Contra-Cheque
function PaginaDoContraCheque( iIdHstFolhaBenef, iIdPessoaLocal, iFlgFiltro : integer ): String;

implementation


//Monta a página de Tempo de Serviço
function PaginaDoContraCheque( iIdHstFolhaBenef, iIdPessoaLocal, iFlgFiltro : integer ): String;
var
  //Variáveis de geração e emissão de relatórios
  rtContrato       : TReportType;
  sHTMLFile        : string;
  iIdDataView    ,
  iOrigemCMDV    ,
  iIdReports     ,
  iOrigemCm        : integer;
  sFlgInterno : string;
begin
  try

    sTitulo := TituloPagina( pContraCheque );

    sFlgInterno := WebDadosCadastrais.RecuperaFlgInterno( iIdPessoa );

    if bFlgCtrChqAtv and ( sFlgInterno = 'AT' ) then
    begin
      Result := '<BR><BR><p class="CORPO" align="center">Esta opção não está disponível para ativos</p><BR><BR><BR>'
    end
    else
    begin

      cds.Close;
      cds.CreateDataSet;
      cds.Data := ViaContraCheque.ListaDataPagamento(iIdPessoaLocal,  iIdPessoaLocal);

      if not cds.IsEmpty then
      begin
        Result := Result +
           '<BR>                                                                                      ' + CR +
           '<center>                                                                                  ' + CR +
           '  <form method="POST" name="frmLnkFiltroContraCheque"                                      ' + CR +
           '        action="../<#nomearqapl>/ConsultaContraCheque" >                                     ' + CR +
           '    <#hiddenfields>                                                                       ' + CR +
           '    <input type="hidden" name="edtFlgFiltro"  value="1">                                  ' + CR +
           '    <span id="CORPO">                                                                     ' + CR +
           '      Data de Pagamento:&nbsp;                                                            ' + CR +
           '    </span>                                                                               ' + CR +
           '    <select size="1" name="cmbIdHstFolhaBenef" class="CORPO">                             ' + CR ;

        cds.First;

        while not cds.Eof do
        begin
          Result := Result + '<option';

          if cds.Bof then Result := Result + ' selected';

          Result := Result + ' value="'+ cds.FieldByName( 'IDHSTFOLHABENEF' ).AsString +'" >' + FormataDataHora( 'dd / mm / yyyy',
          cds.FieldByName( 'DATAPAGAMENTO' ).AsString ) + '</option>' + CR;

          cds.Next;
        end;

        Result := Result +
           '    </select>                                                            ' + CR +
           '    <span id="link">                                                     ' + CR +
           '      <a href="JavaScript:EnviaForm( document.frmLnkFiltroContraCheque )">    ' + CR +
           '        Ok                                                               ' + CR +
           '      </a>                                                               ' + CR +
           '    </span>                                                              ' + CR +
           '  </form>                                                                ' + CR +
           '<center>                                                                 ' + CR ;
      end //if
      else
      begin
        Result := MontaPagina( pContraChequeNaoEncontrado, '' );
        cds.Close;
        exit;
      end;

      cds.Close;

      if iFlgFiltro = 1 then
      begin
        //Recupera dados do relatório
        RecuperaConfRelatorio( rContaCheque,
                               rtContrato,
                               iIdDataView,
                               iOrigemCMDV,
                               iIdReports,
                               iOrigemCM,
                               sHTMLFile );

         Result := Result +
         '<BR><BR>                                                                   ' + CR +
         GeraDadosRelatorio( rtContrato,
                             'frmLnkContraChequeW',
                             iIdReports,
                             iOrigemCM,
                             sHTMLFile,
                             'Segunda Via de Contra-Cheque',
                             viaContraCheque.BuscaDadosRelRegUnico(ViaContraCheque.BuscaFLGUSACODRUBEXT,
                                                     ViaContraCheque.AgrupaRubrica,
                                                     intToStr(iIdHstFolhaBenef),
                                                     IntToStr(iIdPessoaLocal),
                                                     IntToStr(iIdPessoaLocal)))+CR;

        Result := Result +
         '<SCRIPT language="JavaScript">                                           ' + CR +
         '  document.frmLnkContraChequeW.submit();                                 ' + CR +
         '</script>                                                                ' + CR;
      end; //if
    end;

    Result := MontaPagina( pContraCheque, Result );

  except
    On E : Exception do
    begin
      Result := TrataWebExcecoes( E );
    end;
  end;

end; {PaginaDo ContraCheque}





end.
