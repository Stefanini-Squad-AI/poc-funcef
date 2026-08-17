unit uWebBeneficio;

interface

uses SysUtils, DModAutoAtendimento, uConstPaginasCampos, uFuncoesEmprestimo,
     JCLStrings, uCMClientDataSet, httpapp, JCLSysUtils, Classes, uCmFileUtils;

//Monta a página de seleção de benefício
function PaginaBenefSelecao( iIdPessoaLocal : integer ) : String;

//Monta a página de campos da simulação
function PaginaBenefSimulaCampos( iIdPessoaLocal, iIdSimulaBenef : integer ) : String;

//Monta a página de resultados da simulação
function PaginaBenefSimulaResultados( iIdPessoaLocal : integer; Request: TWebRequest ) : String;

//Página de resultados da simulação
function Resultados( iIdPessoaLocal, iIdSimulaBenef, iFlgRollback, iIdReports, iOrigemCM : integer;
 sFlgTipoDemonstra, sHtmlDemonstra : string; oCampos : OLEVariant ) : String;

//Converte uma lista no formato a#b#c#d em uma lista
procedure ConverteStringParaLista( sLista : string; lLista : TStringList );

implementation

//Monta a página de seleção de benefício
function PaginaBenefSelecao( iIdPessoaLocal : integer ) : String;
begin
  try

    sTitulo := TituloPagina( pBenefSelecao );

    cds.Close;
    cds.Data := SimulaBenef.ListaBeneficios;

    if not cds.IsEmpty then
    begin
      sJavaScript := sJavaScript +
       'function Confirma()                                                ' + CR +
       ' {                                                                 ' + CR +
       '   if ( document.frmLnkBenefSelecao.cmbIdSimulaBenef.value != "" ) ' + CR +
       '   {                                                               ' + CR +
       '     EnviaForm( document.frmLnkBenefSelecao );                     ' + CR +
       '   }                                                               ' + CR +
       ' }                                                                 ' + CR ;

      Result := Result +
       '<form method="POST" name="frmLnkBenefSelecao"                                   ' + CR +
       '   action="../<#nomearqapl>/BenefSimulaCampos">                                 ' + CR +
       '  <center>                                                                      ' + CR +
       '    <table border="0" cellpadding="0" cellspacing="0" class="FORMULARIO">       ' + CR +
       '      <tr>                                                                      ' + CR +
       '        <td class="DESCCAMPO">                                                  ' + CR +
       '          Benefício:                                                            ' + CR +
       '        </td>                                                                   ' + CR +
       '        <td>                                                                    ' + CR +
       '          <select name="cmbIdSimulaBenef" class="TEXT">                         ' + CR +
       '            <option value=""></option>                                          ' + CR ;

      cds.First;
      while not cds.Eof do
      begin
        Result := Result +
         '            <option value="' + cds.FieldByName('IDSIMULABENEF').AsString +
         '">' + cds.FieldByName('NOME').AsString + '</option> ' + CR ;

        cds.Next;
      end;


      Result := Result +
       '          </select>                                                             ' + CR +
       '        <td>                                                                    ' + CR +
       '          <a href="JavaScript:Confirma()">                                      ' + CR +
       '            <img src="../imagem/ok.gif" border="0"></a>                         ' + CR +
       '        </td>                                                                   ' + CR +
       '      </tr>                                                                     ' + CR +
       '    </table>                                                                    ' + CR +
       '    <#hiddenfields>                                                             ' + CR +
       '  </center>                                                                     ' + CR +
       '</form>                                                                         ' + CR +
       '<BR><BR>                                                                        ' + CR +
       '<SCRIPT language="JavaScript">                                                  ' + CR +
       '  document.frmLnkBenefSelecao.cmbIdSimulaBenef.focus();                         ' + CR +
       '</script>                                                                       ' + CR ;

    end
    else
      Result := '<BR><BR><P class="CORPO" align="center">' +
       'No momento não é possível executar simulações pela internet.</P><BR><BR><BR>';

    Result := MontaPagina( pBenefSelecao, Result );

  except
    On E : Exception do
    begin
      Result := TrataWebExcecoes( E );
    end;
  end;

end; {PaginaBenSimulacao}


//Monta a página de campos da simulação
function PaginaBenefSimulaCampos( iIdPessoaLocal, iIdSimulaBenef : integer ) : String;
var
  lLista : TStringList;
  sNomeCampo, sAux : string;
  iPos : integer;
  bExisteParam : boolean;
  cdsSimulaBenef : TCMClientDataset;
begin

  lLista := TStringList.Create;
  cdsSimulaBenef := TCMClientDataset.Create( nil );
  try

    try

      sTitulo := TituloPagina( pBenefCampos );

      cdsSimulaBenef.Data := SimulaBenef.SelecionaSimulaBenef( iIdSimulaBenef );

      //Recupera os dados dos campos com os conteúdos calculados
      cds.Close;
      cds.Data := SimulaBenef.CamposSimulaBenef( iIdPessoaLocal, iIdSimulaBenef, cdsSimulaBenef.FieldByName('FLGROLLBACK').AsInteger, iIdEmpresaProp );

      //Verifica se existe campos visíveis e/ou editáveis 
      bExisteParam := False;
      if not cds.IsEmpty then
      begin
        cds.First;
        while not cds.Eof do
        begin
          //Se o campo for visível e editável
          if ( cds.FieldByName('FLGVISIVEL').AsString = '1' ) and ( cds.FieldByName('FLGPODEALTERAR').AsString = '1' ) then
          begin
            bExisteParam := True;
            break;
          end;
          cds.Next;
        end;
      end;

      //Se não há campo, gera apenas a página de resultados
      if not bExisteParam then
      begin
        with dtmModAutoAtendimento do
        begin
          cdsCamposSimulaBenef.Close;
          cdsCamposSimulaBenef.CreateDataSet;
          cds.First;
          while not cds.Eof do
          begin
            cdsCamposSimulaBenef.Insert;
            if not cds.FieldByName('IDINPUT').IsNull then
              cdsCamposSimulaBenefIDINPUT.AsInteger  := cds.FieldByName('IDINPUT').AsInteger
            else
              cdsCamposSimulaBenefNOMECAMPO.AsString := cds.FieldByName('NOMEPARAREGRA').AsString;
            cdsCamposSimulaBenefVALOR.AsString     := cds.FieldByName('VALOR').AsString;
            cdsCamposSimulaBenef.Post;
            cds.Next;
          end;
          Result := MontaPagina( pBenefResultados, Resultados( iIdPessoaLocal, iIdSimulaBenef,
           cdsSimulaBenef.FieldByName('FLGROLLBACK').AsInteger,
           cdsSimulaBenef.FieldByName('IDREPORTS').AsInteger,
           cdsSimulaBenef.FieldByName('ORIGEMCM').AsInteger,
           cdsSimulaBenef.FieldByName('FLGTIPODEMONSTRA').AsString,
           cdsSimulaBenef.FieldByName('HTMLDEMONSTRA').AsString, 
           cdsCamposSimulaBenef.Data ) );
        end;          
        exit;
      end;

      sJavaScript := '';

      //Se houverem campos, processa...
      if not cds.IsEmpty then
      begin

        //Varredura e montagem dos campos
        cds.First;
        while not cds.Eof do
        begin

          //Gera o nome do campo
          sNomeCampo := 'edt' + Iff( cds.FieldByName('TIPOORIGEM').AsString = 'Q',
           'Q_' + cds.FieldByName('NOMEPARAREGRA').AsString, 'D_' + cds.FieldByName('IDINPUT').AsString );

          //Se o campo for visível, exibe-o.
          if cds.FieldByName('FLGVISIVEL').AsString = '1' then
          begin

            //Desenha o título do campo
            Result := Result +
             '      <tr class="CAMPOSIMULABEN">   ' + CR +
             '        <td class="DESCCAMPOSIM" >  ' + CR +
             cds.FieldByName('TITULO').AsString     + CR +
             '        </td>                       ' + CR +
             '        <td class="CONTCAMPOSIM">   ' + CR ;

            //Se o tipo do campo é <T>exto ou <N>úmero cria um edit.
            if  ( cds.FieldByName('TIPODADO').AsString = 'T' )
             or ( cds.FieldByName('TIPODADO').AsString = 'N' ) then
              Result := Result +
               ' <input type="text" name="' + sNomeCampo + '" value="' +
               cds.FieldByName('VALOR').AsString + '" ' +
               iff( cds.FieldByName('FLGPODEALTERAR').AsString = '1', ' class="TEXTSIM" ', ' class="NAOEDITAVEL" readonly ' ) +
               ' maxlength="100" >' + CR;


            //Se o tipo do campo é <D>ata
            if cds.FieldByName('TIPODADO').AsString = 'D' then
              Result := Result +
               ' <input type="text" name="' + sNomeCampo + '" value="' + cds.FieldByName('VALOR').AsString + '" ' +
               iff( cds.FieldByName('FLGPODEALTERAR').AsString = '1', ' class="CAMPODATA" maxlength="10" ' +
               ' OnKeyUp="MascaraData( this )" onBlur="ValidaCampoData( this )" > ' + CR +
               ' <a href="javascript:NewCal( ''' + sNomeCampo +''',''ddmmyyyy'', false , 24 )">' +
               ' <img src="../Imagem/calendar.gif" border="0" style="vertical-align: middle"></a>',
               ' class="NAOEDITAVEL" readonly >' );

            //Se o tipo do campo é <L>ista...
            if cds.FieldByName('TIPODADO').AsString = 'L' then
            begin

              //Monta a lista com os conteúdos possíveis
              ConverteStringParaLista( cds.FieldByName('LISTAITENS').AsString, lLista );

              //Se é editável, cria uma lista...
              if cds.FieldByName('FLGPODEALTERAR').AsString = '1' then
              begin

                //Cria o select
                Result := Result +
                 ' <select size="1" name="' + sNomeCampo + '" class="TEXTSIM"> ' + CR +
                 '   <OPTION value=""> </OPTION> ' + CR;

                //Cria as opções
                for iPos := 0 to lLista.Count - 1 do
                begin
                  Result := Result + '<OPTION value="' + IntToStr( iPos + 1 ) + '"';

                  if cds.FieldByName('VALOR').AsString <> '' then
                    if ( cds.FieldByName('VALOR').AsInteger = iPos + 1 ) then
                      Result := Result + ' selected ';

                  Result := Result + '>' + lLista.Strings[iPos] + '</OPTION>' + CR;
                end;

                Result := Result + ' </select> ' + CR;

              end {if cds.FieldByName('FLGPODEALTERAR').AsString = '1' then}
              else
              begin
                if trim( cds.FieldByName('VALOR').AsString ) <> '' then
                  sAux := lLista.Strings[cds.FieldByName('VALOR').AsInteger - 1]
                else
                  sAux := '';

                //Senão, cria um edit (para exibir) e um hidden (para recuperar)
                Result := Result +
                 ' <input type="hidden" name="' + sNomeCampo + '" value="' +
                 cds.FieldByName('VALOR').AsString + '" >' + CR +
                 ' <input type="text" value="' + sAux +
                 '" class="NAOEDITAVEL" maxlength="100" readonly >' + CR ;
              end;

            end; {if cds.FieldByName('TIPODADO').AsString = 'L' then}

            if cds.FieldByName('FLGREQUERIDO').AsInteger = 1 then
              //Validação de preenchimento do campo
              sJavaScript := sJavaScript +
               ' if ( document.frmLnkBenefSimulaCampos.' + sNomeCampo +'.value == "" )        ' + CR +
               ' {                                                                            ' + CR +
               '   alert(''Preencha o campo "' + cds.FieldByName('TITULO').AsString + '".''); ' + CR +
               '   document.frmLnkBenefSimulaCampos.' + sNomeCampo +'.focus();                ' + CR +
               '   exit;                                                                      ' + CR +
               '  }                                                                           ' + CR ;

            Result := Result +
             '        </td>                               ' + CR +
             '      </tr>                                 ' + CR ;

          end
          else
            //Se o campo não for visível, cria um hidden.
            Result := Result +
             ' <input type="hidden" name="' + sNomeCampo + '" value="' +
             cds.FieldByName('VALOR').AsString + '">' + CR;


          cds.Next;
        end; {while not cds.Eof do}


        Result :=
         '  <table border="0" width="100%" cellpadding="0" cellspacing="0">                            ' + CR +
         '    <tr>                                                                                     ' + CR +
         '      <td width="10%">                                                                       ' + CR +
         '        <p class="DESCCAMPO">                                                                ' + CR +
         '          Benefício                                                                          ' + CR +
         '        </p>                                                                                 ' + CR +
         '      </td>                                                                                  ' + CR +
         '      <td width="3%">                                                                        ' + CR +
         '        <p class="DESCCAMPO">                                                                ' + CR +
         '          :                                                                                  ' + CR +
         '        </p>                                                                                 ' + CR +
         '      </td>                                                                                  ' + CR +
         '      <td>                                                                                   ' + CR +
         '        <p class="CONTCAMPOD">                                                               ' + CR +
         SimulaBenef.NomeBeneficio( iIdSimulaBenef )                                                     + CR +
         '        </p>                                                                                 ' + CR +
         '      </td>                                                                                  ' + CR +
         '    </tr>                                                                                    ' + CR +
         '  </table> <BR>                                                                              ' + CR +
         '  <center>                                                                                   ' + CR +
         '    <table width="100%" border="0" cellpadding="0" cellspacing="0" class="FORMULARIO">       ' + CR +
         Result                                                                                          + CR +
         '      <tr>                                                                                   ' + CR +
         '        <td align="center" colspan="2">                                                      ' + CR +
         '          <br>                                                                               ' + CR +
         '          <a href="JavaScript:ConfirmaDados();">                                             ' + CR +
         '            <img src="../imagem/btnConfirmar.gif" name="btnConfirmar" border="0"             ' + CR +
         '             onMouseOver="btnConfirmar.src=''../imagem/btnConfirmar_s.gif''"                 ' + CR +
         '             onMouseOut="btnConfirmar.src=''../imagem/btnConfirmar.gif''"></a>               ' + CR +
         '          <a href="JavaScript:EnviaForm( document.frmLnkBenefSimulacao )">                   ' + CR +
         '            <img src="../imagem/btnCancelar.gif" name="btnCancelar" border="0"               ' + CR +
         '             onMouseOver="btnCancelar.src=''../imagem/btnCancelar_s.gif''"                   ' + CR +
         '             onMouseOut="btnCancelar.src=''../imagem/btnCancelar.gif''"></a>                 ' + CR +
         '        </td>                                                                                ' + CR +
         '      </tr>                                                                                  ' + CR +
         '    </table>                                                                                 ' + CR +
         '  </center>                                                                                  ' + CR ;

        //Monta o formulário
        Result :=
         '<form method="POST" name="frmLnkBenefSimulaCampos" action="../<#nomearqapl>/BenefSimulaResultados"                         ' + CR +
         '  onSubmit="JavaScript:ConfirmaDados();">                                                                                  ' + CR +
         Result                                                                                                                        + CR +
         '  <#hiddenfields>                                                                                                          ' + CR +
         '  <input type="hidden" name="edtIDSIMULABENEF"    value="' + IntToStr( iIdSimulaBenef ) + '">                              ' + CR +
         '  <input type="hidden" name="edtFLGTIPODEMONSTRA" value="' + cdsSimulaBenef.FieldByName('FLGTIPODEMONSTRA').AsString + '"> ' + CR +
         '  <input type="hidden" name="edtFLGROLLBACK"      value="' + cdsSimulaBenef.FieldByName('FLGROLLBACK').AsString + '">      ' + CR +
         '  <input type="hidden" name="edtIDREPORTS"        value="' + cdsSimulaBenef.FieldByName('IDREPORTS').AsString + '">        ' + CR +
         '  <input type="hidden" name="edtORIGEMCM"         value="' + cdsSimulaBenef.FieldByName('ORIGEMCM').AsString + '">         ' + CR +
         '  <input type="hidden" name="edtHTMLDEMONSTRA"    value="' + cdsSimulaBenef.FieldByName('HTMLDEMONSTRA').AsString + '">    ' + CR +
         '</form>                                                                                                                    ' + CR ;

        //Valida e confirma o preenchimento dos campos
        sJavaScript :=
         ' function ConfirmaDados( )                                           ' + CR +
         ' {                                                                   ' + CR +
         sJavaScript                                                             + CR +
         '   EnviaForm( document.frmLnkBenefSimulaCampos );                    ' + CR +
         ' }                                                                   ' + CR ;

      end; {if not cds.IsEmpty then}

      cds.Close;

      Result := MontaPagina( pBenefCampos, Result );

    except
      On E : Exception do
      begin
        Result := TrataWebExcecoes( E );
      end;
    end;

  finally
    lLista.Free;
    cdsSimulaBenef.Free;
  end;

end; {PaginaBenefSimulaCampos}


//Monta a página de resultados da simulação
function PaginaBenefSimulaResultados( iIdPessoaLocal : integer; Request: TWebRequest ) : String;
var
  i,
  iFlgRollback,
  iIdSimulaBenef,
  iIdReports,
  iOrigemCM : integer;
  sFlgTipoDemonstra,
  sHtmlDemonstra : string;
begin

  try

    iIdSimulaBenef    := StrToInt( Request.ContentFields.Values['edtIDSIMULABENEF'] );
    iFlgRollback      := StrToInt( Request.ContentFields.Values['edtFLGROLLBACK'] );
    sFlgTipoDemonstra := trim( Request.ContentFields.Values['edtFLGTIPODEMONSTRA'] );
    iIdReports        := StrToIntDef( Request.ContentFields.Values['edtIDREPORTS'], 0 );
    iOrigemCM         := StrToIntDef( Request.ContentFields.Values['edtORIGEMCM'], 0 );
    sHtmlDemonstra    := trim( Request.ContentFields.Values['edtHTMLDEMONSTRA'] );

    with dtmModAutoAtendimento do
    begin

      //Cria o dataset cujos dados serão enviados para a classe de controle
      cdsCamposSimulaBenef.Close;
      cdsCamposSimulaBenef.CreateDataSet;

      //Varre os campos
      for i := 0 to Request.ContentFields.Count - 1 do
      begin

        //Se não é campo da simulação, ignora
        if   ( StrLeft( Request.ContentFields.Names[i], 5 ) <> 'edtQ_' )
         and ( StrLeft( Request.ContentFields.Names[i], 5 ) <> 'edtD_' ) then
          Continue;

        //Insere um novo campo
        cdsCamposSimulaBenef.Insert;

        //Se for do tipo calculado, preenche o IDINPUT
        if Copy( Request.ContentFields.Names[i], 4, 1 ) = 'D' then
          cdsCamposSimulaBenefIDINPUT.AsString := StrRight( Request.ContentFields.Names[i],
           length( Request.ContentFields.Names[i] ) - 5 )
        else
        //Se não, preenche o nome do campo
          cdsCamposSimulaBenefNOMECAMPO.AsString := StrRight( Request.ContentFields.Names[i],
           length( Request.ContentFields.Names[i] ) - 5 );

        //Preenche o valor
        cdsCamposSimulaBenefVALOR.AsString := Request.ContentFields.Values[Request.ContentFields.Names[i]];

        cdsCamposSimulaBenef.Post;

      end; {for i := 0 to Request.ContentFields.Count - 1 do}

      Result := Resultados( iIdPessoaLocal, iIdSimulaBenef, iFlgRollback, iIdReports,
       iOrigemCM, sFlgTipoDemonstra, sHtmlDemonstra, cdsCamposSimulaBenef.Data );

    end; {with dtmModAutoAtendimento do}

    //Fecha os datasets
    cds.Close;
    cdsAux.Close;

    Result := MontaPagina( pBenefResultados, Result );

  except
    On E : Exception do
    begin
      Result := TrataWebExcecoes( E );
    end;
  end;

end; {PaginaBenefSimulaResultados}


//Converte uma lista no formato a#b#c#d em uma lista
procedure ConverteStringParaLista( sLista : string; lLista : TStringList );
var
  sAux : string;
  iPOs : integer;
begin
  lLista.Clear;

  sAux := trim( sLista );
  while sAux <> '' do
  begin
    iPos := StrFind( '#', sAux, 1 );
    if iPos <> 0 then
    begin
      lLista.Add( StrLeft( sAux, iPos - 1 ) );
      sAux := StrRight( sAux, length( sAux ) - iPos );
    end
    else
    begin
      lLista.Add( sAux );
      sAux := '';
    end;
  end; 
end; {ConverteStringParaLista}


//Página de resultados da simulação
function Resultados( iIdPessoaLocal, iIdSimulaBenef, iFlgRollback, iIdReports, iOrigemCM : integer;
 sFlgTipoDemonstra, sHtmlDemonstra : string; oCampos : OLEVariant ) : String;
var
  lLista : TStringList;
  fValor : extended;

  sTituloCampo,
  sValor,
  sFormato : string;

  bExisteParam,
  bExisteResult : boolean;

  cdsCamposBanco,
  cdsCamposSimulaBenef,
  cdsDemonstrativo : TCmClientDataset;

  rtReportType : TReportType;
begin

  lLista := TStringList.Create;
  cdsCamposSimulaBenef := TCMClientDataset.Create( nil );
  cdsDemonstrativo     := TCMClientDataset.Create( nil );
  cdsCamposBanco       := TCMClientDataset.Create( nil );
  try

    sTitulo := TituloPagina( pBenefResultados );

    //Exibe o nome do benefício simulado
    Result :=
     '<p class="CABDIV">Benefício</p>                                 ' + CR +
     '<table border="0" width="100%" cellpadding="0" cellspacing="0"> ' + CR +
     '  <tr>                                                          ' + CR +
     '    <td class="DESCRESULTSIM">                                  ' + CR +
     '      <p class="CONTCAMPOD">                                    ' + CR +
     SimulaBenef.NomeBeneficio( iIdSimulaBenef )                        + CR +
     '      </p>                                                      ' + CR +
     '    </td>                                                       ' + CR +
     '  </tr>                                                         ' + CR +
     '</table> <BR><BR>                                               ' + CR ;

    //Cria o dataset cujos dados serão enviados para a classe de controle
    cdsCamposSimulaBenef.Data := oCampos;

    //Executa a geração de resultados
    cds.Data := SimulaBenef.ResultSimulaBenef( iIdPessoaLocal,
                                               iIdSimulaBenef,
                                               iFlgRollback,
                                               iIdEmpresaProp,
                                               cdsCamposSimulaBenef.Data );


    //---------- Montagem dos parâmetros na tela -----------------------------> INÍCIO

    //Fecha a query auxiliar
    cdsCamposBanco.Close;

    //Recupera os dados dos campos ativos
    cdsCamposBanco.Data := SimulaBenef.RecuperaCamposAtivos( iIdSimulaBenef );

    //Inicializa variável que controla se há parâmetros visíveis ou não.
    bExisteParam := False;

    //Para cada campo ativo, mostra o seu conteúdo
    cdsCamposBanco.First;
    while not cdsCamposBanco.Eof do
    begin

      //Se o campo é visível...
      if cdsCamposBanco.FieldByName('FLGVISIVEL').AsInteger = 1 then
      begin

        cdsCamposSimulaBenef.Locate( 'IDINPUT', cdsCamposBanco.FieldByName('IDINPUT').AsInteger, [] );
        cdsCamposSimulaBenef.Edit;
        cdsCamposSimulaBenef.FieldByName('NOMECAMPO').AsString := cdsCamposBanco.FieldByName('NOMEPARAREGRA').AsString;
        cdsCamposSimulaBenef.Post;                                                                             

        sValor := cdsCamposSimulaBenef.FieldByName('VALOR').AsString;

        //Se foi preenchido...
        if sValor <> '' then
        begin

          ConverteStringParaLista( cdsCamposBanco.FieldByName('LISTAITENS').AsString, lLista );

          if cdsCamposBanco.FieldByName('TIPODADO').AsString = 'L' then
            sValor := lLista.Strings[ StrToInt( sValor ) - 1];

          if trim( cdsCamposBanco.FieldByName('FORMATO').AsString ) <> '' then
          begin

           if cdsCamposBanco.FieldByName('TIPODADO').AsString = 'N' then
           begin
              sFormato := cdsCamposBanco.FieldByName('FORMATO').AsString;
              sFormato := StrSubst( sFormato, '.', '§' );
              sFormato := StrSubst( sFormato, ',', '.' );
              sFormato := StrSubst( sFormato, '§', ',' );
              sValor   := FormatFloat( sFormato, StrToFloat( OraNumeroInv( sValor ) ) );
           end;

          end;

          TemAcessoPagina( sTipoUsuario, pBenefCampos, sTituloCampo );

          if not bExisteParam then Result := Result +
           '<p class="CABDIV">' + sTituloCampo + '</p>                      ' + CR +
           '<table border="0" width="100%" cellpadding="0" cellspacing="0"> ' + CR ;

          //Indica que há pelo menos um campo visível
          bExisteParam := True;

          Result := Result +
           '  <tr>                                                          ' + CR +
           '    <td class="DESCRESULTSIM">                                  ' + CR +
           cdsCamposBanco.FieldByName('TITULO').AsString                              + CR +
           '    </td>                                                       ' + CR +
           '    <td width="3%">                                             ' + CR +
           '      <p class="DESCCAMPO">                                     ' + CR +
           '        :                                                       ' + CR +
           '      </p>                                                      ' + CR +
           '    </td>                                                       ' + CR +
           '    <td class="CONTRESULTCSIM">                                 ' + CR +
           sValor                                                             + CR +
           '    </td>                                                       ' + CR +
           '  </tr>                                                         ' + CR ;

          end; {if sValor <> '' then}

      end; {if cdsCamposBanco.FieldByName('FLGVISIVEL').AsInteger = 1 then}

      cdsCamposBanco.Next;

    end; {while not cdsCamposBanco.Eof do}

    //Fecha a tabela (se existir parâmetros)
    if bExisteParam then
      Result := Result +
       '</table><BR><BR>                                              ' + CR ;


    //---------- Montagem dos parâmetros na tela -----------------------------> FIM



    //---------- Montagem dos resultados na tela -----------------------------> INÍCIO

    //Inicializa variável que controla se há resultados visíveis ou não.
    bExisteResult := False;

    //Para cada resultado, mostra o seu conteúdo
    cds.First;
    while not cds.Eof do
    begin

      //Se o resultado é visível...
      if cds.FieldByName('FLGVISIVEL').AsInteger = 1 then
      begin

        TemAcessoPagina( sTipoUsuario, pBenefResultados, sTituloCampo );

        if not bExisteResult then Result := Result +
         '<p class="CABDIV">' + sTituloCampo + '</p>                      ' + CR +
         '<table border="0" width="100%" cellpadding="0" cellspacing="0"> ' + CR ;

        //Indica que há pelo menos um campo visível
        bExisteResult := True;

        Result := Result +
         '  <tr>                                                          ' + CR +
         '    <td class="DESCRESULTSIM">                                  ' + CR +
         cds.FieldByName('TITULO').AsString                                 + CR +
         '    </td>                                                       ' + CR +
         '    <td width="3%">                                             ' + CR +
         '      <p class="DESCCAMPO">                                     ' + CR +
         '        :                                                       ' + CR +
         '      </p>                                                      ' + CR +
         '    </td>                                                       ' + CR +
         '    <td class="CONTRESULTSIM">                                  ' + CR +
         cds.FieldByName('VALOR').AsString                                  + CR +
         '    </td>                                                       ' + CR +
         '  </tr>                                                         ' + CR ;

      end; {if cds.FieldByName('FLGVISIVEL').AsInteger = 1 then}

      cds.Next;

    end; {while not cds.Eof do}

    //Fecha a tabela (se existir parâmetros)
    if bExisteResult then
      Result := Result +
       '</table>                                                      ' + CR ;

    //Se puder imprimir demonstrativo...
    if trim( sFlgTipoDemonstra ) <> '' then
    begin
      cdsDemonstrativo.Data := cdsCamposSimulaBenef.Data;

      //Converte os campos do tipo "lista" para seus respectivos itens
      cdsDemonstrativo.First;
      while not cdsDemonstrativo.Eof do
      begin
        cdsCamposBanco.First;
        cdsCamposBanco.Locate( 'IDINPUT', cdsDemonstrativo.FieldByName('IDINPUT').AsInteger, [] );
        if cdsCamposBanco.FieldByName('TIPODADO').AsString = 'L' then
        begin
          cdsDemonstrativo.Edit;
          ConverteStringParaLista( cdsCamposBanco.FieldByName('LISTAITENS').AsString, lLista );
          sValor := lLista.Strings[ StrToInt( cdsDemonstrativo.FieldByName('VALOR').AsString ) - 1];
          cdsDemonstrativo.FieldByName('VALOR').AsString := sValor;
          cdsDemonstrativo.Post;
        end;
        cdsDemonstrativo.Next;
      end;                    

      cds.First;
      while not cds.Eof do
      begin
        if trim( cds.FieldByName('NOMEPARAREGRA').AsString ) <> '' then
        begin
          cdsDemonstrativo.Append;
          cdsDemonstrativo.FieldByName('NOMECAMPO').AsString := cds.FieldByName('NOMEPARAREGRA').AsString;
          cdsDemonstrativo.FieldByName('VALOR').AsString     := cds.FieldByName('VALOR').AsString;
          cdsDemonstrativo.Post;
        end;
        cds.Next;
      end;

      cdsDemonstrativo.Data := SimulaBenef.DataToSQL( cdsDemonstrativo.Data );

      if trim( sFlgTipoDemonstra ) = 'H' then
        rtReportType := rtHTML
      else
        rtReportType := rtReportGenerator;

      Result := Result +
       '<BR><BR>                                                                           ' + CR +
       GeraDadosRelatorio( rtReportType,
                           'frmLnkBenefDemonstra',
                           iIdReports,
                           iOrigemCM,
                           sHtmlDemonstra,
                           'Demonstrativo de Simulação de Benefício',
                           cdsDemonstrativo.Data )   +
       '<center>                                                                           ' + CR +
       '  <a href="JavaScript:document.frmLnkBenefDemonstra.submit();">                    ' + CR +
       '    <img src="../imagem/btnDemonstrativo.gif" name="btnDemonstrativo" border="0"   ' + CR +
       '         onMouseOver="btnDemonstrativo.src=''../imagem/btnDemonstrativo_s.gif''"   ' + CR +
       '         onMouseOut="btnDemonstrativo.src=''../imagem/btnDemonstrativo.gif''"></a> ' + CR +
       '</center>                                                                          ' + CR ;

    end;


    //---------- Montagem dos resultados na tela -----------------------------> FIM

    //Fecha os datasets
    cds.Close;
    cdsAux.Close;

    Result := Result;

  finally
    lLista.Free;
    cdsCamposSimulaBenef.Free;
    cdsDemonstrativo.Free;
    cdsCamposBanco.Free;
  end;

end;


end.
