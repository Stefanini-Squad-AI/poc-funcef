unit uWebSitAtualBenef;

interface

uses SysUtils, DModAutoAtendimento, uConstPaginasCampos, uCtrlFuncoesAA,
     JCLSysUtils;

//Monta a página de parâmetros
function PaginaSitAtualBenefPar( iIdPessoaLocal : integer ) : String;

//Monta a página de resultados
function PaginaSitAtualBenefTabela( iIdPessoaLocal, iIdBeneficio, iIdSitBeneficio : integer ) : String;

//Monta a página de detalhes
function PaginaSitAtualBenefDetalhes( iIdBeneficio   , iNumeroProcesso , iIdPlanoPrev   ,
                                      iIdTitular     , iIdPessJur      , iIdPessoaLocal ,
                                      iSeqProposta   , iIdPlanoOrigem  : integer        ) : string;

implementation

//Monta a página de parâmetros
function PaginaSitAtualBenefPar( iIdPessoaLocal : integer ) : String;
var
  sEsp, sAux, sBenef, sBenefAnt, sSit, sSitAnt : string;
  i : integer;
begin
  try

    sTitulo := TituloPagina( pSitAtualBenefPar );

    cds.Close;
    cds.Data := WebSitAtualBenef.SituacaoAtualBeneficio( iIdPessoaLocal, 0, 0, 0, 0, 0, 0, 0, 0 );

    sEsp := '';
    for i := 1 to 80 do
      sEsp := sEsp + '&nbsp;';

    sBenef    := '';
    sBenefAnt := '';
    sSit      := '';
    sSitAnt   := '';

    cds.First;
    while not cds.Eof do
    begin
      sAux := trim( cds.FieldByName('BENEFICIO').AsString );
      if Pos( sAux, sBenefAnt ) = 0 then
      begin
        sBenef := sBenef +
         '            <option value="' + cds.FieldByName('IDBENEFICIO').AsString + '">' + sAux + '</option>' + CR;
        sBenefAnt := sBenefAnt + '§' + sAux;
      end;

      sAux := trim( cds.FieldByName('SITBENEFICIO').AsString );
      if Pos( sAux, sSitAnt ) = 0 then
      begin
        sSit := sSit +
         '            <option value="' + cds.FieldByName('IDSITBENEFICIO').AsString + '">' + sAux + '</option>' + CR;
        sSitAnt := sSitAnt + '§' + sAux;
      end;

      cds.Next;
    end;

    Result := Result +
     '<form method="POST" name="frmLnkSitAtualBenefTabela"                                  ' + CR +
     '   action="../<#nomearqapl>/ConsultaSitAtualBenefTabela"                              ' + CR +
     '   onSubmit="EnviaForm( document.frmLnkSitAtualBenefTabela )" >                       ' + CR +
     '  <center>                                                                            ' + CR +
     '    <table border="0" cellpadding="0" cellspacing="0" class="FORMULARIO">             ' + CR +
     '      <tr>                                                                            ' + CR +
     '        <td valign="middle" class="DESCCAMPO" width="50">Benefício:                   ' + CR +
     '        </td>                                                                         ' + CR +
     '        <td valign="middle" class="DESCCAMPO">                                        ' + CR +
     '          <select name="cmbIdBeneficio" class="TEXT">                                 ' + CR +
     '            <option value="">' + sEsp + '</option>                                    ' + CR +
     sBenef                                                                                   + CR + 
     '          </select>                                                                   ' + CR +
     '        </td>                                                                         ' + CR +
     '        <td valign="middle" class="DESCCAMPO">                                        ' + CR +
     '          <input type="image" name="imgOk" src="../imagem/ok.gif" border="0">         ' + CR +
     '        </td>                                                                         ' + CR +
     '      </tr>                                                                           ' + CR +
     '      <tr>                                                                            ' + CR +
     '        <td class="DESCCAMPO">                                                        ' + CR +
     '          Situação: &nbsp;                                                            ' + CR +
     '        </td>                                                                         ' + CR +
     '        <td valign="middle" class="DESCCAMPO">                                        ' + CR +
     '          <select name="cmbIdSitBeneficio" class="TEXT">                              ' + CR +
     '            <option value="">' + sEsp + '</option>                                    ' + CR +
     sSit                                                                                     + CR +
     '          </select>                                                                   ' + CR +
     '        </td>                                                                         ' + CR +
     '      </tr>                                                                           ' + CR +
     '    </table>                                                                          ' + CR +
     '  </center>                                                                           ' + CR +
     HiddenFields                                                                             + CR +
     '</form>                                                                               ' + CR ;

    Result := MontaPagina( pSitAtualBenefPar, Result );

  except
    On E : Exception do
    begin
      Result := TrataWebExcecoes( E );
    end;
  end;

end; {PaginaSitAtualBenefPar}



//Monta a página de resultados
function PaginaSitAtualBenefTabela( iIdPessoaLocal, iIdBeneficio, iIdSitBeneficio : integer ) : String;
begin
  try

    sTitulo := TituloPagina( pSitAtualBenefTabela );

    cds.Close;
    cds.Data := WebSitAtualBenef.SituacaoAtualBeneficio( iIdPessoaLocal, iIdBeneficio, iIdSitBeneficio,
                                                         0, 0, 0, 0, 0, 0 );

    sJavaScript := ' function Detalhes( sIdBeneficio, sNumeroProcesso, sIdPlanoPrev,                 ' + CR +
                   '                    sIdTitular, sIdPessJur, sIdPessoa, sSeqProposta,             ' + CR +
                   '                    sIdPlanoOrigem )                                             ' + CR +
                   ' {                                                                               ' + CR +
                   '   document.frmLnkSitAtualBenefDetalhes.vIdBeneficio.value    = sIdBeneficio;    ' + CR +
                   '   document.frmLnkSitAtualBenefDetalhes.vNumeroProcesso.value = sNumeroProcesso; ' + CR +
                   '   document.frmLnkSitAtualBenefDetalhes.vIdPlanoPrev.value    = sIdPlanoPrev;    ' + CR +
                   '   document.frmLnkSitAtualBenefDetalhes.vIdTitular.value      = sIdTitular;      ' + CR +
                   '   document.frmLnkSitAtualBenefDetalhes.vIdPessJur.value      = sIdPessJur;      ' + CR +
                   '   document.frmLnkSitAtualBenefDetalhes.vIdPessoa.value       = sIdPessoa;       ' + CR +
                   '   document.frmLnkSitAtualBenefDetalhes.vSeqProposta.value    = sSeqProposta;    ' + CR +
                   '   document.frmLnkSitAtualBenefDetalhes.vIdPlanoOrigem.value  = sIdPlanoOrigem;  ' + CR +
                   '   EnviaForm( document.frmLnkSitAtualBenefDetalhes );                            ' + CR +
                   ' }                                                                               ' + CR ;


    cdsHTMLColumns.Close;
    cdsHTMLColumns.CreateDataSet;

    IncluiColuna( cSitAtuBenefTblNumProcCM       ,     10, 'left'        );
    IncluiColuna( cSitAtuBenefTblNumProcINSS     ,     10, 'left'        );
    IncluiColuna( cSitAtuBenefTblNome            ,     15, 'left'        );
    IncluiColuna( cSitAtuBenefTblSitBenef        ,     17, 'left'        );
    IncluiColuna( cSitAtuBenefTblTipoPagto       ,     15, 'left'        );
    IncluiColuna( cSitAtuBenefTblFormaPagto      ,     15, 'left'        );
    IncluiColuna( cSitAtuBenefTblDtInicioPgto    ,      5, 'left'        );
    IncluiColuna( cSitAtuBenefTblDtFinalPgtoEfet ,      5, 'left'        );
    IncluiColuna( cSitAtuBenefTblDtRequerimento  ,      5, 'left'        );
    IncluiColuna( 0                              ,      3, 'center', ' ' );

    Result := Result + HTMLTableHeader;

    cds.First;
    while not cds.Eof do
    begin

      PreencheColuna( cSitAtuBenefTblNumProcCM       , cds.FieldByName('NUMEROPROCESSO').AsString   );
      PreencheColuna( cSitAtuBenefTblNumProcINSS     , cds.FieldByName('NUMPROCINSS').AsString      );
      PreencheColuna( cSitAtuBenefTblNome            , cds.FieldByName('BENEFICIO').AsString        );
      PreencheColuna( cSitAtuBenefTblSitBenef        , cds.FieldByName('SITBENEFICIO').AsString     );
      PreencheColuna( cSitAtuBenefTblTipoPagto       , cds.FieldByName('TIPOPAGBENEF').AsString     );
      PreencheColuna( cSitAtuBenefTblFormaPagto      , cds.FieldByName('FORMAPGTO').AsString        );
      PreencheColuna( cSitAtuBenefTblDtInicioPgto    , cds.FieldByName('DATAINICIOPAG').AsString    );
      PreencheColuna( cSitAtuBenefTblDtFinalPgtoEfet , cds.FieldByName('DATAFINAL').AsString        );
      PreencheColuna( cSitAtuBenefTblDtRequerimento  , cds.FieldByName('DATAREQUERIMENTO').AsString );
      PreencheColuna( 0                              , '<a href="JavaScript:Detalhes(' +
       cds.FieldByName('IDBENEFICIO').AsString    + ', ' +
       cds.FieldByName('NUMEROPROCESSO').AsString + ', ' +
       cds.FieldByName('IDPLANOPREV').AsString    + ', ' +
       cds.FieldByName('IDTITULAR').AsString      + ', ' +
       cds.FieldByName('IDPESSJUR').AsString      + ', ' +
       cds.FieldByName('IDPESSOA').AsString       + ', ' +
       cds.FieldByName('SEQPROPOSTA').AsString    + ', ' +
       cds.FieldByName('IDPLANOORIGEM').AsString  + ')"><img src="..\imagem\detalhestbl.gif" border=0></a>' );

      Result := Result + HTMLTableRow;

      cds.Next;
    end;

    Result := Result + HTMLTableFooter +
     '<BR><BR>' + CR +
     '<img src="..\imagem\detalhestbl.gif">                                               ' + CR +
     '<SPAN id="DESCCAMPO">                                                               ' + CR +
     '  Clique neste símbolo para consultar detalhes sobre a situação atual do benefício. ' + CR +
     '</SPAN>                                                                             ' + CR +
     '<form method="POST" name="frmLnkSitAtualBenefDetalhes"                              ' + CR +
     ' action="../<#nomearqapl>/ConsultaSitAtualBenefDetalhes">                           ' + CR +
     HiddenFields                                                                           + CR +
     '<input type="hidden" name="vIdBeneficio">                                           ' + CR +
     '<input type="hidden" name="vNumeroProcesso">                                        ' + CR +
     '<input type="hidden" name="vIdPlanoPrev">                                           ' + CR +
     '<input type="hidden" name="vIdTitular">                                             ' + CR +
     '<input type="hidden" name="vIdPessJur">                                             ' + CR +
     '<input type="hidden" name="vIdPessoa">                                              ' + CR +
     '<input type="hidden" name="vSeqProposta">                                           ' + CR +
     '<input type="hidden" name="vIdPlanoOrigem">                                         ' + CR +
     '</form>                                                                             ' + CR;

    Result := MontaPagina( pSitAtualBenefTabela, Result );

  except
    On E : Exception do
    begin
      Result := TrataWebExcecoes( E );
    end;
  end;

end; {PaginaSitAtualBenefTabela}


//Monta a página de detalhes
function PaginaSitAtualBenefDetalhes( iIdBeneficio   , iNumeroProcesso , iIdPlanoPrev   ,
                                      iIdTitular     , iIdPessJur      , iIdPessoaLocal ,
                                      iSeqProposta   , iIdPlanoOrigem  : integer        ) : string;
begin

  try

    sTitulo := TituloPagina( pSitAtualBenefTabela );

    cds.Close;
    cds.Data := WebSitAtualBenef.SituacaoAtualBeneficio( iIdPessoaLocal  , iIdBeneficio , 0               ,
                                                         iNumeroProcesso , iIdPlanoPrev , iIdTitular      ,
                                                         iIdPessJur      , iSeqProposta , iIdPlanoOrigem  );

    Result := '';                                                         
    if not cds.IsEmpty then
    begin
      Result := Result +
       '<p class="CABDIV">Detalhes</p>                                  ' + CR +
       '<table border="0" width="100%" cellpadding="0" cellspacing="0"> ' + CR ;

      Result := Result + IncluiCampo( cSitAtuBenefDetNumProcCM        , cds.FieldByName('NUMEROPROCESSO').AsString );
      Result := Result + IncluiCampo( cSitAtuBenefDetNumProcINSS      , cds.FieldByName('NUMPROCINSS').AsString );
      Result := Result + IncluiCampo( cSitAtuBenefDetNome             , cds.FieldByName('BENEFICIO').AsString );
      Result := Result + IncluiCampo( cSitAtuBenefDetSitBenef         , cds.FieldByName('SITBENEFICIO').AsString );
      Result := Result + IncluiCampo( cSitAtuBenefDetNumPrcINSSBenAnt , cds.FieldByName('NUMPROCINSSBENANTERIOR').AsString );
      Result := Result + IncluiCampo( cSitAtuBenefDetPercGrFamBenAnt  , FormatFloat( '#,##0.0000', cds.FieldByName('PERCBENANTERIOR').AsFloat ), False );
      Result := Result + IncluiCampo( cSitAtuBenefDetVlBenefInicial   , FormatFloat( '#,##0.00', cds.FieldByName('VALBENEFINICIAL').AsFloat ), False );
      Result := Result + IncluiCampo( cSitAtuBenefDetPercGrpFamiliar  , FormatFloat( '#,##0.0000', cds.FieldByName('PERCGRUPOFAMILIAR').AsFloat ), False );
      Result := Result + IncluiCampo( cSitAtuBenefDetTipoPagto        , cds.FieldByName('TIPOPAGBENEF').AsString );
      Result := Result + IncluiCampo( cSitAtuBenefDetFormaPagto       , cds.FieldByName('FORMAPGTO').AsString );
      Result := Result + IncluiCampo( cSitAtuBenefDetDtInicioPgto     , FormataDataHora( 'dd/mm/yyyy', cds.FieldByName('DATAINICIOPAG').AsString ) );
      Result := Result + IncluiCampo( cSitAtuBenefDetDtFinalPgtoEfet  , FormataDataHora( 'dd/mm/yyyy', cds.FieldByName('DATAFINAL').AsString ) );
      Result := Result + IncluiCampo( cSitAtuBenefDetDtFinalPgtoPrev  , FormataDataHora( 'dd/mm/yyyy', cds.FieldByName('DATAFINALPREVISTA').AsString ) );
      Result := Result + IncluiCampo( cSitAtuBenefDetDtRequerimento   , FormataDataHora( 'dd/mm/yyyy', cds.FieldByName('DATAREQUERIMENTO').AsString ) );
      Result := Result + IncluiCampo( cSitAtuBenefDetDtConcessao      , FormataDataHora( 'dd/mm/yyyy', cds.FieldByName('DATACONCESSAO').AsString ) );
      Result := Result + IncluiCampo( cSitAtuBenefDetInicioFund       , FormataDataHora( 'dd/mm/yyyy', cds.FieldByName('DATAINICIOFUND').AsString ) );
      Result := Result + IncluiCampo( cSitAtuBenefDetVlAtual          , FormatFloat( '#,##0.00', cds.FieldByName('VALORATUAL').AsFloat ), False );
      Result := Result + IncluiCampo( cSitAtuBenefDetVlCalculado      , FormatFloat( '#,##0.00', cds.FieldByName('VALORCALCULADO').AsFloat ), False );
      Result := Result + IncluiCampo( cSitAtuBenefDetVlSRB            , FormatFloat( '#,##0.00', cds.FieldByName('VALORSRB').AsFloat ), False );
      Result := Result + IncluiCampo( cSitAtuBenefDetPreparadoAte     , cds.FieldByName('ULTMESPREPARO').AsString );
      Result := Result + IncluiCampo( cSitAtuBenefDetReajustadoAte    , cds.FieldByName('ULTMESREAJUSTE').AsString );
      Result := Result + IncluiCampo( cSitAtuBenefDetVlOpcao1         , FormatFloat( '#,##0.00', cds.FieldByName('VALORBASE1').AsFloat ), False, 20, cds.FieldByName('NOMEVALORBASE1').AsString );
      Result := Result + IncluiCampo( cSitAtuBenefDetVlOpcao2         , FormatFloat( '#,##0.00', cds.FieldByName('VALORBASE2').AsFloat ), False, 20, cds.FieldByName('NOMEVALORBASE1').AsString );
      Result := Result + IncluiCampo( cSitAtuBenefDetVlOpcao3         , FormatFloat( '#,##0.00', cds.FieldByName('VALORBASE3').AsFloat ), False, 20, cds.FieldByName('NOMEVALORBASE1').AsString );
      Result := Result + IncluiCampo( cSitAtuBenefDetVlCalcINSS       , FormatFloat( '#,##0.00', cds.FieldByName('VLRCALCINSS').AsFloat ), False );
      Result := Result + IncluiCampo( cSitAtuBenefDetInicioINSS       , FormataDataHora( 'dd/mm/yyyy', cds.FieldByName('DATAINICIOINSS').AsString ) );
      Result := Result + IncluiCampo( cSitAtuBenefDetVlInfINSS        , FormatFloat( '#,##0.00', cds.FieldByName('VLRINFINSS').AsFloat ), False );
      Result := Result + IncluiCampo( cSitAtuBenefDetIniBenefAnt      , FormataDataHora( 'dd/mm/yyyy', cds.FieldByName('DATAINICIOBENEFANT').AsString ) );
      Result := Result + IncluiCampo( cSitAtuBenefDetValBenefAnt      , FormatFloat( '#,##0.00', cds.FieldByName('VALORBENEFANT').AsFloat ), False );
      Result := Result + IncluiCampo( cSitAtuBenefDetBenefProvisorio  , Iff( cds.FieldByName('FLGPROVISORIO').AsString = '1', 'Sim', 'Não' ) );
      Result := Result + IncluiCampo( cSitAtuBenefDetPossuiAcompINSS  , Iff( cds.FieldByName('FLGPOSSUIACOMPINSS').AsString = '1', 'Sim', 'Não' ) );

      cds.Close;

      Result := Result +
       '</table>                                                        ' + CR +
       '<BR><BR>                                                        ' + CR ;
       
    end;       


    Result := MontaPagina( pSitAtualBenefTabela, Result );

  except
    On E : Exception do
    begin
      Result := TrataWebExcecoes( E );
    end;
  end;

end; {PaginaSitAtualBenefDetalhes}


end.
