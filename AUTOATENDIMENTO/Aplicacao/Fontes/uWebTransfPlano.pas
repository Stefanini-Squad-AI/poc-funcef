unit uWebTransfPlano;

interface

uses SysUtils, DModAutoAtendimento, uConstPaginasCampos, JCLSysUtils, JCLStrings,
     uCMClientDataSet, httpapp, Classes, uCtrlFuncoesAA;

//Monta a página de Tempo de Serviço
function PaginaTransfPlano( iIdPessoaLocal : integer ) : String;


//Monta a página de campos de transferência de plano
function PaginaCamposTransfPlano( iIdPessoaLocal : integer; Request: TWebRequest ) : String;


//Monta a página de opções de transferência de plano
function PaginaOpcoesTransfPlano( iIdPessoaLocal : integer; Request: TWebRequest ) : String;


//Monta a página de campos de estimativa de plano
function PaginaCamposEstimaTransfPlano( iIdPessoaLocal : integer; Request: TWebRequest ) : String;


//Monta a página de estimativas de transferência de plano
function PaginaEstimaTransfPlano( iIdPessoaLocal : integer; Request: TWebRequest ) : String;


//Monta a página de opção de transferência de plano
function PaginaOptarTransfPlano( iIdPessoaLocal : integer; Request: TWebRequest ) : String;


//Exibe os dados da opção selecionada
function OpcaoTransfPlanoSelecionada( iIdPessoaLocal : integer ) : string;


//Função trazida na íntegra do ADMPrev
function ClienteNumero(sNumero : string):string;


implementation

//Monta a página de Tempo de Serviço
function PaginaTransfPlano( iIdPessoaLocal : integer ) : String;
var
  cdsParticipanteOrigem,
  cdsDadosAssistido : TCMClientDataSet;

  iIdPessJur,
  iIdPlanoPrevAtual,
  iIdEventoGerador : integer;

  sSituacao, sRecebeBenef, sNomeBenef, sSitBenef : string;

  sTituloCampo : string;

  sOpcaoExistente : string;
  bPodeSimular : boolean;
begin

  cdsParticipanteOrigem := TCMClientDataSet.Create( nil );
  cdsDadosAssistido     := TCMClientDataSet .Create( nil );
  try

    try

      sOpcaoExistente := OpcaoTransfPlanoSelecionada( iIdPessoaLocal );

      if sOpcaoExistente <> '' then
      begin

        sTitulo := TituloPagina( pTpOpcaoSelecionada );

        Result := Result +
         sOpcaoExistente + '<BR><BR>                                      ' + CR +
         '<p class="LINK" align="center">                                 ' + CR +
         '  <a href="javascript:EnviaForm( document.frmLnkHome );">       ' + CR +
         '    Voltar para Home                                            ' + CR +
         '  </a>                                                          ' + CR +
         '</p>                                                            ' + CR ;

        Result := MontaPagina( pTpOpcaoSelecionada, Result );

      end
      else
      begin

        //Recupera os dados de participante/plano
        cds.Close;
        cds.Data          := WebTransfPlano.ParticipantePlano( iIdPessoaLocal );
        iIdPessJur        := cds.FieldByName('IDPESSJUR').AsInteger;
        iIdPlanoPrevAtual := cds.FieldByName('IDPLANOPREV').AsInteger;
        cds.Close;

        //Recupera o evento gerador
        cds.Close;
        cds.Data := WebTransfPlano.RecuperaEventoGerador;
        iIdEventoGerador := cds.FieldByName('IDEVENTOGERADOR').AsInteger;
        cds.Close;

        //Verifica se o usuário pode simular transferência...
        bPodeSimular := WebTransfPlano.ExisteSimulaTransfPlano( iIdEventoGerador, iIdPessoaLocal );

        if not bPodeSimular then
        begin
          sTitulo := TituloPagina( pTrPlAvisoSimDes );

          Result := MontaPagina( pTrPlAvisoSimDes, Result );
        end
        else
        begin

          sTitulo := TituloPagina( pTpSelecaoPlano );

          //Recupera os dados do plano origem
          cdsParticipanteOrigem.Close;
          cdsParticipanteOrigem.Data := WebTransfPlano.ParticipanteOrigem( iIdEventoGerador,
                                                                           iIdPessoaLocal,
                                                                           iIdPessJur,
                                                                           iIdPlanoPrevAtual,
                                                                           1 );

          if cdsParticipanteOrigem.IsEmpty then
            raise Exception.Create('Não foi possível recuperar os dados de origem do participante.');


          //Recupera os dados do participante assistido
          cdsDadosAssistido.Close;
          cdsDadosAssistido.Data := WebTransfPlano.DadosAssistido( iIdPessJur,
                                                                   iIdPlanoPrevAtual,
                                                                   iIdPessoaLocal,
                                                                   1 );

          if TemAcessoCampo( sTipoUsuario, cTrPlDadosPlanoAtual, sTituloCampo ) then
          begin
            Result := Result +
             '<p class="CABDIV">' + sTituloCampo +' </p>                      ' + CR +
             '<table border="0" width="100%" cellpadding="0" cellspacing="0"> ' + CR ;

            Result := Result + IncluiCampo( cTrPlMatricula,
             Trim( cdsParticipanteOrigem.FieldByName('MATRICULA').AsString ) );

            Result := Result + '<tr height="10"></tr>';

            Result := Result + IncluiCampo( cTrPlPatrocinadora,
             Trim( cdsParticipanteOrigem.FieldByName('NOMEPATRO').AsString ) );

            Result := Result + IncluiCampo( cTrPlPlanoOrigem,
             Trim( cdsParticipanteOrigem.FieldByName('NOMEPLANO').AsString ) );

            sSituacao := UpperCase( cdsParticipanteOrigem.FieldByName('SITUACAO').AsString );


            if sSituacao = 'AS' then sSituacao :='Assistido'
            else if sSituacao = 'MA' then sSituacao :='Mantido'
            else if sSituacao = 'FL' then sSituacao :='Falecido'
            else sSituacao :='Ativo';

            Result := Result + IncluiCampo( cTrPlSitFundacao, sSituacao );

            Result := Result + '<tr height="10"></tr>';

            Result := Result + IncluiCampo( cTrPlDtInscricao,
             FormataDataHora( 'dd/MM/yyyy', cdsParticipanteOrigem.FieldByName('INSCRICAODATA').AsString ) );

            Result := Result + IncluiCampo( cTrPlDtFalecimento,
             FormataDataHora( 'dd/MM/yyyy', cdsParticipanteOrigem.FieldByName('DATAMORTE').AsString ) );

            Result := Result + IncluiCampo( cTrPlDtBase,
             FormataDataHora( 'dd/MM/yyyy', cdsParticipanteOrigem.FieldByName('DATAREF').AsString ) );

            Result := Result + IncluiCampo( cTrPlDtSimulacao,
             FormataDataHora( 'dd/MM/yyyy', FormataDataHora( 'dd/MM/yyyy', DateToStr(date) ) ) );

            Result := Result + IncluiCampo( cTrPlDtTransacao,
             FormataDataHora( 'dd/MM/yyyy', cdsParticipanteOrigem.FieldByName('DATATRANSACAO').AsString ) );

            Result := Result + '<tr height="10"></tr>';

            //Verifica se o participante recebe benefícios
            cds.Close;
            cds.Data := WebTransfPlano.RecebeBenef( iIdPessoaLocal, iIdPessJur, iIdPlanoPrevAtual );

            sRecebeBenef := '';
            sNomeBenef   := '';
            sSitBenef    := '';
            if not cds.IsEmpty then
            begin
              sRecebeBenef := 'Sim';

              sNomeBenef := Trim( cds.FieldByName('NOME').AsString );

              if cds.FieldByName('IDSITBENEFICIO').AsInteger = 1 then
                sSitBenef := 'Normal'
              else
                sSitBenef := 'Retido';

            end
            else
              sRecebeBenef := 'Não';

            Result := Result + IncluiCampo( cTrPlRecebBenef, sRecebeBenef );

            Result := Result + IncluiCampo( cTrPlNomeBenef, sNomeBenef );

            Result := Result + IncluiCampo( cTrPlSitBenef, sSitBenef );

            Result := Result +
             '</table> <BR>                                                   ' + CR ;

          end;

          cds.Close;
          cds.Data := WebTransfPlano.LookupPlanos;

          if cds.IsEmpty then
            Result := Result + '<p class="CORPO" align="center">No momento não é possível simular transferências de planos pela Internet.</p><br>'
          else
          begin

            Result := Result +
             '<form method="POST" name="frmLnkCamposTransfPlano"                              ' + CR +
             '   action="../<#nomearqapl>/CamposTransfPlano">                                 ' + CR +
             '  <center>                                                                      ' + CR +
             '    <table width="100%" border="0" cellpadding="0" cellspacing="0"              ' + CR +
             '           class="FORMULARIO">                                                  ' + CR +
             '      <tr>                                                                      ' + CR +
             '        <td class="DESCCAMPO">                                                  ' + CR +
             '          <center>                                                              ' + CR ;

            if cds.RecordCount > 1 then
            begin
              Result := Result +
               '            Indique o plano previdenciário de destino: &nbsp;                   ' + CR +
               '            <select size="1" name="cmbIdPlanoPrev" class="TEXT">                ' + CR ;

              while not cds.Eof do
              begin
                Result := Result + ' <option value="' + cds.FieldByName('IDPLANOPREV').AsString + '" '+
                 '>' + trim( cds.FieldByName('NOME').AsString ) + '</option>' + CR;
                cds.Next;
              end;

              Result := Result +
               '            </select>                                                            ' + CR +
               '            <input type="hidden" name="edIdPlanoPrev">                           ' + CR +
               '            <input type="image" name="imgOk" src="../imagem/ok.gif" border="0"   ' + CR +
               '              onClick="JavaScript:'                                                +
               'document.frmLnkCamposTransfPlano.edIdPlanoPrev.value='                             +
               'document.frmLnkCamposTransfPlano.cmbIdPlanoPrev.value">                          ' + CR ;
            end
            else
            begin
              Result := Result +
               '    <table border="0" cellpadding="0" cellspacing="0">                          ' + CR +
               '      <tr>                                                                      ' + CR +
               '        <td class="DESCCAMPO">                                                  ' + CR +
               '          Plano previdenciário de destino: &nbsp;                               ' + CR +
               '        </td>                                                                   ' + CR +
               '        <td class="CONTCAMPOD">                                                 ' + CR +
               cds.FieldByName('NOME').AsString + ' &nbsp; &nbsp;                               ' + CR +
               '        </td>                                                                   ' + CR +
               '        <td>                                                                    ' + CR +
               '          <a href="JavaScript:ConfirmaDados( )">                                ' + CR +
               '            <img src="../imagem/ok.gif" border="0"></a>                         ' + CR +
               '        </td>                                                                   ' + CR +
               '      </tr>                                                                     ' + CR +
               '    </table>                                                                    ' + CR +
               '    <input type="hidden" name="edIdPlanoPrev" value="'                            +
               cds.FieldByName('IDPLANOPREV').AsString + '">                                    ' + CR ;
            end;

            with cdsParticipanteOrigem do
            begin
              Result := Result +
               '          </center>                                                                                                                           ' + CR +
               '        </td>                                                                                                                                 ' + CR +
               '      </tr>                                                                                                                                   ' + CR +
               '    </table>                                                                                                                                  ' + CR +
               '    <#hiddenfields>                                                                                                                           ' + CR +
               '    <input type="hidden" name="edIdPlanoPrevAtual"   value="' + IntToStr( iIdPlanoPrevAtual )                                           + '"> ' + CR +
               '    <input type="hidden" name="edIdPessJur"          value="' + IntToStr( iIdPessJur )                                                  + '"> ' + CR +
               '    <input type="hidden" name="edIdEventoGerador"    value="' + IntToStr( iIdEventoGerador )                                            + '"> ' + CR +
               '    <input type="hidden" name="edIDPLANOPREV"        value="' + FieldByName('IDPLANOPREV').AsString                                     + '"> ' + CR +
               '    <input type="hidden" name="edIDPESSOA"           value="' + FieldByName('IDPESSOA').AsString                                        + '"> ' + CR +
               '    <input type="hidden" name="edSEQPROPOSTA"        value="' + FieldByName('SEQPROPOSTA').AsString                                     + '"> ' + CR +
               '    <input type="hidden" name="edMATRICULA"          value="' + FieldByName('MATRICULA').AsString                                       + '"> ' + CR +
               '    <input type="hidden" name="edINSCRICAODATA"      value="' + FormataDataHora( 'dd/mm/yyyy', FieldByName('INSCRICAODATA').AsString )  + '"> ' + CR +
               '    <input type="hidden" name="edSITUACAO"           value="' + FieldByName('SITUACAO').AsString                                        + '"> ' + CR +
               '    <input type="hidden" name="edDATANASC"           value="' + FormataDataHora( 'dd/mm/yyyy', FieldByName('DATANASC').AsString )       + '"> ' + CR +
               '    <input type="hidden" name="edDATAMORTE"          value="' + FormataDataHora( 'dd/mm/yyyy', FieldByName('DATAMORTE').AsString )      + '"> ' + CR +
               '    <input type="hidden" name="edESTCIVIL"           value="' + FieldByName('ESTCIVIL').AsString                                        + '"> ' + CR +
               '    <input type="hidden" name="edSEXO"               value="' + FieldByName('SEXO').AsString                                            + '"> ' + CR +
               '    <input type="hidden" name="edDATAADMISSAO"       value="' + FormataDataHora( 'dd/mm/yyyy', FieldByName('DATAADMISSAO').AsString )   + '"> ' + CR +
               '    <input type="hidden" name="edDATADEMISSAO"       value="' + FormataDataHora( 'dd/mm/yyyy', FieldByName('DATADEMISSAO').AsString )   + '"> ' + CR +
               '    <input type="hidden" name="edFLGINTERNO"         value="' + FieldByName('FLGINTERNO').AsString                                      + '"> ' + CR +
               '    <input type="hidden" name="edTEMPONAOCREDITADO"  value="' + FieldByName('TEMPONAOCREDITADO').AsString                               + '"> ' + CR +
               '    <input type="hidden" name="edTEMPOSERVANTERIOR"  value="' + FieldByName('TEMPOSERVANTERIOR').AsString                               + '"> ' + CR +
               '    <input type="hidden" name="edTEMPOSERVANTREAL"   value="' + FieldByName('TEMPOSERVANTREAL').AsString                                + '"> ' + CR +
               '    <input type="hidden" name="edTEMPOSERVCALC"      value="' + FieldByName('TEMPOSERVCALC').AsString                                   + '"> ' + CR +
               '    <input type="hidden" name="edTEMPOSERVPRIVANT"   value="' + FieldByName('TEMPOSERVPRIVANT').AsString                                + '"> ' + CR +
               '    <input type="hidden" name="edTEMPOSERVPUBLANT"   value="' + FieldByName('TEMPOSERVPUBLANT').AsString                                + '"> ' + CR +
               '    <input type="hidden" name="edTEMPOSERVTOTAL"     value="' + FieldByName('TEMPOSERVTOTAL').AsString                                  + '"> ' + CR +
               '    <input type="hidden" name="edTEMPOSERVTOTDIA"    value="' + FieldByName('TEMPOSERVTOTDIA').AsString                                 + '"> ' + CR +
               '    <input type="hidden" name="edTEMPOSERVTOTMES"    value="' + FieldByName('TEMPOSERVTOTMES').AsString                                 + '"> ' + CR +
               '    <input type="hidden" name="edTEMPOSITESPECIAL"   value="' + FieldByName('TEMPOSITESPECIAL').AsString                                + '"> ' + CR +
               '    <input type="hidden" name="edVALORPROVENTO"      value="' + FormatFloat( '0.00', FieldByName('VALORPROVENTO').AsFloat )             + '"> ' + CR +
               '    <input type="hidden" name="edSALPARTICIPACAO"    value="' + FormatFloat( '0.00', FieldByName('SALPARTICIPACAO').AsFloat )           + '"> ' + CR +
               '    <input type="hidden" name="edREMUNERACAO"        value="' + FormatFloat( '0.00', FieldByName('REMUNERACAO').AsFloat )               + '"> ' + CR +
               '    <input type="hidden" name="edCONTRIBUICAO"       value="' + FormatFloat( '0.00', FieldByName('CONTRIBUICAO').AsFloat )              + '"> ' + CR +
               '    <input type="hidden" name="edTEMPOINSS"          value="' + FieldByName('TEMPOINSS').AsString                                       + '"> ' + CR +
               '    <input type="hidden" name="edJOIA"               value="' + FormatFloat( '0.00', FieldByName('JOIA').AsFloat )                      + '"> ' + CR +
               '    <input type="hidden" name="edPRAZOJOIAFALTA"     value="' + FieldByName('PRAZOJOIAFALTA').AsString                                  + '"> ' + CR +
               '    <input type="hidden" name="edPRAZOJOIAPAGO"      value="' + FieldByName('PRAZOJOIAPAGO').AsString                                   + '"> ' + CR +
               '    <input type="hidden" name="edRPTRIBUTAVEL"       value="' + FormatFloat( '0.00', FieldByName('RPTRIBUTAVEL').AsFloat )              + '"> ' + CR +
               '    <input type="hidden" name="edRPNAOTRIBUTAVEL"    value="' + FormatFloat( '0.00', FieldByName('RPNAOTRIBUTAVEL').AsFloat )           + '"> ' + CR +
               '    <input type="hidden" name="edSRB"                value="' + FormatFloat( '0.00', FieldByName('SRB').AsFloat )                       + '"> ' + CR +
               '    <input type="hidden" name="edFATORPREVIDENC"     value="' + FieldByName('FATORPREVIDENC').AsString                                  + '"> ' + CR +
               '    <input type="hidden" name="edTEMPOMINCONTRIB"    value="' + FieldByName('TEMPOMINCONTRIB').AsString                                 + '"> ' + CR +
               '    <input type="hidden" name="edDATAINICIOFUND"     value="' + FormataDataHora( 'dd/mm/yyyy', FieldByName('DATAINICIOFUND').AsString ) + '"> ' + CR +
               '    <input type="hidden" name="edVALORATUAL"         value="' + FormatFloat( '0.00', FieldByName('VALORATUAL').AsFloat )                + '"> ' + CR +
               '    <input type="hidden" name="edVLRINFINSS"         value="' + FormatFloat( '0.00', FieldByName('VLRINFINSS').AsFloat )                + '"> ' + CR +
               '    <input type="hidden" name="edIDBENEFICIO"        value="' + FieldByName('IDBENEFICIO').AsString                                     + '"> ' + CR +
               '    <input type="hidden" name="edVALORABONO"         value="' + FormatFloat( '0.00', FieldByName('VALORABONO').AsFloat )                + '"> ' + CR +
               '    <input type="hidden" name="edDATAULTSIMULA"      value="' + FormataDataHora( 'dd/mm/yyyy', FieldByName('DATAULTSIMULA').AsString )  + '"> ' + CR +
               '    <input type="hidden" name="edOPCAO"              value="' + FieldByName('OPCAO').AsString                                           + '"> ' + CR +
               '    <input type="hidden" name="edTAXAJOIA"           value="' + FieldByName('TAXAJOIA').AsString                                        + '"> ' + CR +
               '    <input type="hidden" name="edIDADEAPOS"          value="' + FieldByName('IDADEAPOS').AsString                                       + '"> ' + CR +
               '    <input type="hidden" name="edPROPORCAO"          value="' + FieldByName('PROPORCAO').AsString                                       + '"> ' + CR +
               '    <input type="hidden" name="edCOTAPENSAO"         value="' + FormatFloat( '0.000000', FieldByName('COTAPENSAO').AsFloat )            + '"> ' + CR +
               '    <input type="hidden" name="edDATANASCVIT"        value="' + FormataDataHora( 'dd/mm/yyyy', FieldByName('DATANASCVIT').AsString )    + '"> ' + CR +
               '    <input type="hidden" name="edDATANASCTEMP"       value="' + FormataDataHora( 'dd/mm/yyyy', FieldByName('DATANASCTEMP').AsString )   + '"> ' + CR +
               '    <input type="hidden" name="edNUMDEPEN"           value="' + FieldByName('NUMDEPEN').AsString                                        + '"> ' + CR +
               '    <input type="hidden" name="edNUMDEPENVIT"        value="' + FieldByName('NUMDEPENVIT').AsString                                     + '"> ' + CR +
               '    <input type="hidden" name="edNUMDEPENTEMP"       value="' + FieldByName('NUMDEPENTEMP').AsString                                    + '"> ' + CR +
               '    <input type="hidden" name="edNOMESITUACAO"       value="' + FieldByName('NOMESITUACAO').AsString                                    + '"> ' + CR +
               '    <input type="hidden" name="edNOMEPARTICIP"       value="' + FieldByName('NOMEPARTICIP').AsString                                    + '"> ' + CR +
               '    <input type="hidden" name="edNOMEPATRO"          value="' + FieldByName('NOMEPATRO').AsString                                       + '"> ' + CR +
               '    <input type="hidden" name="edNOMEPLANO"          value="' + FieldByName('NOMEPLANO').AsString                                       + '"> ' + CR +
               '    <input type="hidden" name="edNOMEBENEFICIO"      value="' + FieldByName('NOMEBENEFICIO').AsString                                   + '"> ' + CR +
               '    <input type="hidden" name="edFLGBENEFTEMP"       value="' + FieldByName('FLGBENEFTEMP').AsString                                    + '"> ' + CR +
               '    <input type="hidden" name="edDATAREF"            value="' + FormataDataHora( 'dd/mm/yyyy', FieldByName('DATAREF').AsString )        + '"> ' + CR +
               '    <input type="hidden" name="edDATATRANSACAO"      value="' + FormataDataHora( 'dd/mm/yyyy', FieldByName('DATATRANSACAO').AsString )  + '"> ' + CR +
               '    <input type="hidden" name="edCAMPOOP1"           value="' + FieldByName('CAMPOOP1').AsString                                        + '"> ' + CR +
               '    <input type="hidden" name="edCAMPOOP2"           value="' + FieldByName('CAMPOOP2').AsString                                        + '"> ' + CR +
               '    <input type="hidden" name="edCAMPOOP3"           value="' + FieldByName('CAMPOOP3').AsString                                        + '"> ' + CR +
               '    <input type="hidden" name="edCAMPOOP4"           value="' + FieldByName('CAMPOOP4').AsString                                        + '"> ' + CR +
               '    <input type="hidden" name="edCAMPOOP5"           value="' + FieldByName('CAMPOOP5').AsString                                        + '"> ' + CR +
               '    <input type="hidden" name="edIDBENEFICIOAssist"  value="' + cdsDadosAssistido.FieldByName('IDBENEFICIO').AsString                   + '"> ' + CR +
               '    <input type="hidden" name="edDATAINICIOFUNDAssist" value="'+cdsDadosAssistido.FieldByName('DATAINICIOFUND').AsString                + '"> ' + CR +
               '    <input type="hidden" name="edVALORSRBAssist"     value="' + cdsDadosAssistido.FieldByName('VALORSRB').AsString                      + '"> ' + CR +
               '    <input type="hidden" name="edVLRCALCINSSAssist"  value="' + cdsDadosAssistido.FieldByName('VLRCALCINSS').AsString                   + '"> ' + CR +
               '    <input type="hidden" name="edVLRINFINSSAssist"   value="' + cdsDadosAssistido.FieldByName('VLRINFINSS').AsString                    + '"> ' + CR +
               '    <input type="hidden" name="edVALORATUALAssist"   value="' + cdsDadosAssistido.FieldByName('VALORATUAL').AsString                    + '"> ' + CR +
               '  </center>                                                                                                                                   ' + CR +
               '</form>                                                                                                                                       ' + CR ;
            end;

          end;

          cds.Close;
          cdsParticipanteOrigem.Close;

          //Valida e confirma o preenchimento dos campos
          sJavaScript :=
           ' function ConfirmaDados( )                                                 ' + CR +
           ' {                                                                         ' + CR +
           '   EnviaForm( document.frmLnkCamposTransfPlano );                          ' + CR +
           ' }                                                                         ' + CR ;

          Result := MontaPagina( pTpSelecaoPlano, Result );

        end;

      end;

    except
      On E : Exception do
      begin
        Result := TrataWebExcecoes( E );
      end;
    end;

  finally
    cdsParticipanteOrigem.Free;
    cdsDadosAssistido.Free;
  end;

end; {PaginaTransfPlano}



//Monta a página de campos de transferência de plano
function PaginaCamposTransfPlano( iIdPessoaLocal : integer; Request: TWebRequest ) : String;
var
  iIdEventoGerador : integer;
  sFieldNames, sFieldTitles : array of String;
  i : integer;

  Lista : TStringList;

  iIdPlanoPrev, iIdPlanoPrevAtual, iIdPessJur : integer;
  sFlgInterno, sFlgBenefTemp : String;

begin

  Lista := TStringList.Create;
  try

    try

      sTitulo := TituloPagina( pTpDadosOpcoesTransacao );

      iIdPlanoPrev      := StrToInt( Request.ContentFields.Values['edIdPlanoPrev'] );
      iIdPlanoPrevAtual := StrToInt( Request.ContentFields.Values['edIdPlanoPrevAtual'] );
      iIdPessJur        := StrToInt( Request.ContentFields.Values['edIdPessJur'] );
      iIdEventoGerador  := StrToInt( Request.ContentFields.Values['edIdEventoGerador'] );
      sFlgInterno       := Request.ContentFields.Values['edFLGINTERNO'];
      sFlgBenefTemp     := Request.ContentFields.Values['edFLGBENEFTEMP'];

      cds.Close;
      cds.Data := WebTransfPlano.RecuperaNomePlano( iIdPlanoPrev );
      Result := Result +
       '<table border="0" width="100%" cellpadding="0" cellspacing="0">                         ' + CR +
       '  <tr>                                                                                  ' + CR +
       '    <td width="6%">                                                                     ' + CR +
       '      <p class="DESCCAMPO">                                                             ' + CR +
       '        Plano:                                                                          ' + CR +
       '      </p>                                                                              ' + CR +
       '    </td>                                                                               ' + CR +
       '    <td>                                                                                ' + CR +
       '      <p class="CONTCAMPOD">                                                            ' + CR +
       cds.FieldByName('NOME').AsString                                                           + CR +
       '      </p>                                                                              ' + CR +
       '    </td>                                                                               ' + CR +
       '  </tr>                                                                                 ' + CR +
       '</table>                                                                                ' + CR +
       '<form method="POST" name="frmLnkOpcoesTransfPlano"                                      ' + CR +
       '   action="../<#nomearqapl>/OpcoesTransfPlano">                             ' + CR +
       '  <center>                                                                              ' + CR +
       '    <table width="100%" border="0" cellpadding="0" cellspacing="0"                      ' + CR +
       '           class="FORMULARIO">                                                          ' + CR ;

      Lista.Text := Request.ContentFields.Text;

      dtmModAutoAtendimento.cdsInputTransfPlano.Close;
      dtmModAutoAtendimento.cdsInputTransfPlano.CreateDataSet;

      cds.Close;
      cds.Data := WebTransfPlano.GeraCamposOpcoes( iIdEmpresaProp,
                                                   iIdEventoGerador,
                                                   sFlgInterno,
                                                   sFlgBenefTemp,
                                                   iIdPessJur,
                                                   iIdPlanoPrevAtual,
                                                   iIdPessoaLocal,
                                                   StrToInt( Request.ContentFields.Values['edSEQPROPOSTA'] ),
                                                   Request.ContentFields.Values['edDATAREF'],
                                                   Lista.Text,
                                                   dtmModAutoAtendimento.cdsInputTransfPlano.Data );

      dtmModAutoAtendimento.cdsInputTransfPlano.Close;

      if not cds.IsEmpty then
      begin

        Result := Result +
         '      <tr>                                                                              ' + CR +
         '        <td class="DESCCAMPO">                                                          ' + CR +
         '          <table width="100%" border="0" cellpadding="0" cellspacing="0">               ' + CR ;

        i := 0;
        cds.First;
        while not cds.Eof do
        begin
          Result := Result +
           '            <tr height="20">                                                    ' + CR +
           '              <td width="50%" class="DESCCAMPO">                                ' + CR +
           cds.FieldByName('DESCRICAO').AsString                                              + CR +
           '              </td>                                                             ' + CR +
           '              <td class="CONTCAMPO">                                            ' + CR ;

          SetLength( sFieldNames, i + 1 );
          SetLength( sFieldTitles, i + 1 );
          sFieldNames[i]  := 'edt' + cds.FieldByName('IDINPUT').AsString;
          sFieldTitles[i] := cds.FieldByName('DESCRICAO').AsString;

          Result := Result +
           '                <input type="hidden" name="edt' +
           cds.FieldByName('IDINPUT').AsString + '" '                     + CR +
           'value="' + cds.FieldByName('VALOR').AsString + '">'           + CR +
           cds.FieldByName('VALOR').AsString                              + CR ;

          i := i + 1;

          Result := Result +
           '              </td>                                                             ' + CR ;
          cds.Next;
        end;

        Result := Result +
         '          </table>                                                              ' + CR +
         '        </td>                                                                   ' + CR +
         '      </tr>                                                                     ' + CR ;

      end;

      Result := Result +
       '      <tr>                                                                      ' + CR +
       '        <td align="center">                                                     ' + CR +
       '          <br>                                                                  ' + CR +
       '          <a href="JavaScript:ConfirmaDados();">                                ' + CR +
       '           <img src="../imagem/btnConfirmar.gif" name="btnConfirmar" border="0" ' + CR +
       '            onMouseOver="btnConfirmar.src=''../imagem/btnConfirmar_s.gif''"     ' + CR +
       '            onMouseOut="btnConfirmar.src=''../imagem/btnConfirmar.gif''"></a>   ' + CR +
       '          <a href="JavaScript:EnviaForm( document.frmLnkHome )">                ' + CR +
       '            <img src="../imagem/btnCancelar.gif" name="btnCancelar" border="0"  ' + CR +
       '            onMouseOver="btnCancelar.src=''../imagem/btnCancelar_s.gif''"       ' + CR +
       '            onMouseOut="btnCancelar.src=''../imagem/btnCancelar.gif''"></a>     ' + CR +
       '        </td>                                                                   ' + CR +
       '      </tr>                                                                     ' + CR +
       '    </table>                                                                    ' + CR +
       '    <#hiddenfields>                                                             ' + CR +
       '    <input type="hidden" name="edIdPlanoPrevAtual"   value="' + IntToStr( iIdPlanoPrevAtual )                            + '"> ' + CR +
       '    <input type="hidden" name="edIdPessJur"          value="' + IntToStr( iIdPessJur )                                   + '"> ' + CR +
       '    <input type="hidden" name="edIdEventoGerador"    value="' + IntToStr( iIdEventoGerador )                             + '"> ' + CR +
       '    <input type="hidden" name="edIDPLANOPREV"        value="' + Request.ContentFields.Values['edIDPLANOPREV']            + '"> ' + CR +
       '    <input type="hidden" name="edIDPESSOA"           value="' + Request.ContentFields.Values['edIDPESSOA']               + '"> ' + CR +
       '    <input type="hidden" name="edSEQPROPOSTA"        value="' + Request.ContentFields.Values['edSEQPROPOSTA']            + '"> ' + CR +
       '    <input type="hidden" name="edMATRICULA"          value="' + Request.ContentFields.Values['edMATRICULA']              + '"> ' + CR +
       '    <input type="hidden" name="edINSCRICAODATA"      value="' + Request.ContentFields.Values['edINSCRICAODATA']          + '"> ' + CR +
       '    <input type="hidden" name="edSITUACAO"           value="' + Request.ContentFields.Values['edSITUACAO']               + '"> ' + CR +
       '    <input type="hidden" name="edDATANASC"           value="' + Request.ContentFields.Values['edDATANASC']               + '"> ' + CR +
       '    <input type="hidden" name="edDATAMORTE"          value="' + Request.ContentFields.Values['edDATAMORTE']              + '"> ' + CR +
       '    <input type="hidden" name="edESTCIVIL"           value="' + Request.ContentFields.Values['edESTCIVIL']               + '"> ' + CR +
       '    <input type="hidden" name="edSEXO"               value="' + Request.ContentFields.Values['edSEXO']                   + '"> ' + CR +
       '    <input type="hidden" name="edDATAADMISSAO"       value="' + Request.ContentFields.Values['edDATAADMISSAO']           + '"> ' + CR +
       '    <input type="hidden" name="edDATADEMISSAO"       value="' + Request.ContentFields.Values['edDATADEMISSAO']           + '"> ' + CR +
       '    <input type="hidden" name="edFLGINTERNO"         value="' + Request.ContentFields.Values['edFLGINTERNO']             + '"> ' + CR +
       '    <input type="hidden" name="edTEMPONAOCREDITADO"  value="' + Request.ContentFields.Values['edTEMPONAOCREDITADO']      + '"> ' + CR +
       '    <input type="hidden" name="edTEMPOSERVANTERIOR"  value="' + Request.ContentFields.Values['edTEMPOSERVANTERIOR']      + '"> ' + CR +
       '    <input type="hidden" name="edTEMPOSERVANTREAL"   value="' + Request.ContentFields.Values['edTEMPOSERVANTREAL']       + '"> ' + CR +
       '    <input type="hidden" name="edTEMPOSERVCALC"      value="' + Request.ContentFields.Values['edTEMPOSERVCALC']          + '"> ' + CR +
       '    <input type="hidden" name="edTEMPOSERVPRIVANT"   value="' + Request.ContentFields.Values['edTEMPOSERVPRIVANT']       + '"> ' + CR +
       '    <input type="hidden" name="edTEMPOSERVPUBLANT"   value="' + Request.ContentFields.Values['edTEMPOSERVPUBLANT']       + '"> ' + CR +
       '    <input type="hidden" name="edTEMPOSERVTOTAL"     value="' + Request.ContentFields.Values['edTEMPOSERVTOTAL']         + '"> ' + CR +
       '    <input type="hidden" name="edTEMPOSERVTOTDIA"    value="' + Request.ContentFields.Values['edTEMPOSERVTOTDIA']        + '"> ' + CR +
       '    <input type="hidden" name="edTEMPOSERVTOTMES"    value="' + Request.ContentFields.Values['edTEMPOSERVTOTMES']        + '"> ' + CR +
       '    <input type="hidden" name="edTEMPOSITESPECIAL"   value="' + Request.ContentFields.Values['edTEMPOSITESPECIAL']       + '"> ' + CR +
       '    <input type="hidden" name="edVALORPROVENTO"      value="' + Request.ContentFields.Values['edVALORPROVENTO']          + '"> ' + CR +
       '    <input type="hidden" name="edSALPARTICIPACAO"    value="' + Request.ContentFields.Values['edSALPARTICIPACAO']        + '"> ' + CR +
       '    <input type="hidden" name="edREMUNERACAO"        value="' + Request.ContentFields.Values['edREMUNERACAO']            + '"> ' + CR +
       '    <input type="hidden" name="edCONTRIBUICAO"       value="' + Request.ContentFields.Values['edCONTRIBUICAO']           + '"> ' + CR +
       '    <input type="hidden" name="edTEMPOINSS"          value="' + Request.ContentFields.Values['edTEMPOINSS']              + '"> ' + CR +
       '    <input type="hidden" name="edJOIA"               value="' + Request.ContentFields.Values['edJOIA']                   + '"> ' + CR +
       '    <input type="hidden" name="edPRAZOJOIAFALTA"     value="' + Request.ContentFields.Values['edPRAZOJOIAFALTA']         + '"> ' + CR +
       '    <input type="hidden" name="edPRAZOJOIAPAGO"      value="' + Request.ContentFields.Values['edPRAZOJOIAPAGO']          + '"> ' + CR +
       '    <input type="hidden" name="edRPTRIBUTAVEL"       value="' + Request.ContentFields.Values['edRPTRIBUTAVEL']           + '"> ' + CR +
       '    <input type="hidden" name="edRPNAOTRIBUTAVEL"    value="' + Request.ContentFields.Values['edRPNAOTRIBUTAVEL']        + '"> ' + CR +
       '    <input type="hidden" name="edSRB"                value="' + Request.ContentFields.Values['edSRB']                    + '"> ' + CR +
       '    <input type="hidden" name="edFATORPREVIDENC"     value="' + Request.ContentFields.Values['edFATORPREVIDENC']         + '"> ' + CR +
       '    <input type="hidden" name="edTEMPOMINCONTRIB"    value="' + Request.ContentFields.Values['edTEMPOMINCONTRIB']        + '"> ' + CR +
       '    <input type="hidden" name="edDATAINICIOFUND"     value="' + Request.ContentFields.Values['edDATAINICIOFUND']         + '"> ' + CR +
       '    <input type="hidden" name="edVALORATUAL"         value="' + Request.ContentFields.Values['edVALORATUAL']             + '"> ' + CR +
       '    <input type="hidden" name="edVLRINFINSS"         value="' + Request.ContentFields.Values['edVLRINFINSS']             + '"> ' + CR +
       '    <input type="hidden" name="edIDBENEFICIO"        value="' + Request.ContentFields.Values['edIDBENEFICIO']            + '"> ' + CR +
       '    <input type="hidden" name="edVALORABONO"         value="' + Request.ContentFields.Values['edVALORABONO']             + '"> ' + CR +
       '    <input type="hidden" name="edDATAULTSIMULA"      value="' + Request.ContentFields.Values['edDATAULTSIMULA']          + '"> ' + CR +
       '    <input type="hidden" name="edOPCAO"              value="' + Request.ContentFields.Values['edOPCAO']                  + '"> ' + CR +
       '    <input type="hidden" name="edTAXAJOIA"           value="' + Request.ContentFields.Values['edTAXAJOIA']               + '"> ' + CR +
       '    <input type="hidden" name="edIDADEAPOS"          value="' + Request.ContentFields.Values['edIDADEAPOS']              + '"> ' + CR +
       '    <input type="hidden" name="edPROPORCAO"          value="' + Request.ContentFields.Values['edPROPORCAO']              + '"> ' + CR +
       '    <input type="hidden" name="edCOTAPENSAO"         value="' + Request.ContentFields.Values['edCOTAPENSAO']             + '"> ' + CR +
       '    <input type="hidden" name="edDATANASCVIT"        value="' + Request.ContentFields.Values['edDATANASCVIT']            + '"> ' + CR +
       '    <input type="hidden" name="edDATANASCTEMP"       value="' + Request.ContentFields.Values['edDATANASCTEMP']           + '"> ' + CR +
       '    <input type="hidden" name="edNUMDEPEN"           value="' + Request.ContentFields.Values['edNUMDEPEN']               + '"> ' + CR +
       '    <input type="hidden" name="edNUMDEPENVIT"        value="' + Request.ContentFields.Values['edNUMDEPENVIT']            + '"> ' + CR +
       '    <input type="hidden" name="edNUMDEPENTEMP"       value="' + Request.ContentFields.Values['edNUMDEPENTEMP']           + '"> ' + CR +
       '    <input type="hidden" name="edNOMESITUACAO"       value="' + Request.ContentFields.Values['edNOMESITUACAO']           + '"> ' + CR +
       '    <input type="hidden" name="edNOMEPARTICIP"       value="' + Request.ContentFields.Values['edNOMEPARTICIP']           + '"> ' + CR +
       '    <input type="hidden" name="edNOMEPATRO"          value="' + Request.ContentFields.Values['edNOMEPATRO']              + '"> ' + CR +
       '    <input type="hidden" name="edNOMEPLANO"          value="' + Request.ContentFields.Values['edNOMEPLANO']              + '"> ' + CR +
       '    <input type="hidden" name="edNOMEBENEFICIO"      value="' + Request.ContentFields.Values['edNOMEBENEFICIO']          + '"> ' + CR +
       '    <input type="hidden" name="edFLGBENEFTEMP"       value="' + Request.ContentFields.Values['edFLGBENEFTEMP']           + '"> ' + CR +
       '    <input type="hidden" name="edDATAREF"            value="' + Request.ContentFields.Values['edDATAREF']                + '"> ' + CR +
       '    <input type="hidden" name="edDATATRANSACAO"      value="' + Request.ContentFields.Values['edDATATRANSACAO']          + '"> ' + CR +
       '    <input type="hidden" name="edCAMPOOP1"           value="' + Request.ContentFields.Values['edCAMPOOP1']               + '"> ' + CR +
       '    <input type="hidden" name="edCAMPOOP2"           value="' + Request.ContentFields.Values['edCAMPOOP2']               + '"> ' + CR +
       '    <input type="hidden" name="edCAMPOOP3"           value="' + Request.ContentFields.Values['edCAMPOOP3']               + '"> ' + CR +
       '    <input type="hidden" name="edCAMPOOP4"           value="' + Request.ContentFields.Values['edCAMPOOP4']               + '"> ' + CR +
       '    <input type="hidden" name="edCAMPOOP5"           value="' + Request.ContentFields.Values['edCAMPOOP5']               + '"> ' + CR +
       '    <input type="hidden" name="edIDBENEFICIOAssist"  value="' + Request.ContentFields.Values['edIDBENEFICIOAssist']      + '"> ' + CR +
       '    <input type="hidden" name="edDATAINICIOFUNDAssist" value="'+Request.ContentFields.Values['edDATAINICIOFUNDAssist']   + '"> ' + CR +
       '    <input type="hidden" name="edVALORSRBAssist"     value="' + Request.ContentFields.Values['edVALORSRBAssist']         + '"> ' + CR +
       '    <input type="hidden" name="edVLRCALCINSSAssist"  value="' + Request.ContentFields.Values['edVLRCALCINSSAssist']      + '"> ' + CR +
       '    <input type="hidden" name="edVLRINFINSSAssist"   value="' + Request.ContentFields.Values['edVLRINFINSSAssist']       + '"> ' + CR +
       '    <input type="hidden" name="edVALORATUALAssist"   value="' + Request.ContentFields.Values['edVALORATUALAssist']       + '"> ' + CR +
       '  </form>                                                                                                                      ' + CR +
       '</p>                                                                                                                           ' + CR ;


      cds.Close;

      //Valida e confirma o preenchimento dos campos
      sJavaScript :=
       ' function ConfirmaDados( )                                                 ' + CR +
       ' {                                                                         ' + CR ;


      sJavaScript := sJavaScript +
       '   EnviaForm( document.frmLnkOpcoesTransfPlano );                          ' + CR +
       ' }                                                                         ' + CR ;

      Result := MontaPagina( pTpDadosOpcoesTransacao, Result );

    except
      On E : Exception do
      begin
        Result := TrataWebExcecoes( E );
      end;
    end;

  finally
    Lista.Free;
  end;

end; {PaginaCamposTransfPlano}


//Monta a página de opções de transferência de plano
function PaginaOpcoesTransfPlano( iIdPessoaLocal : integer; Request: TWebRequest ) : String;
var
  cdsInput,
  cdsDados,
  cdsObs : TCMClientDataSet;

  iIdEventoGerador,
  iIdPlanoPrevAtual,
  iIdPessJur,
  iSeqProposta : integer;

  iOpcao : integer;

  sFLGINTERNO : string;

  iIdTipoTransfAnt : integer;
  sOpcoesEstima, sCampos : string;
begin

  cdsInput := TCMClientDataSet.Create( nil );
  cdsDados := TCMClientDataSet.Create( nil );
  cdsObs   := TCMClientDataSet.Create( nil );
  try

    try

      sTitulo := TituloPagina( pTpOpcoesTransacao );

      iIdEventoGerador  := StrToInt( Request.ContentFields.Values['edIdEventoGerador'] );
      iIdPlanoPrevAtual := StrToInt( Request.ContentFields.Values['edIdPlanoPrevAtual'] );
      iIdPessJur        := StrToInt( Request.ContentFields.Values['edIDPESSJUR'] );
      iSeqProposta      := StrToInt( Request.ContentFields.Values['edSEQPROPOSTA'] );
      sFLGINTERNO       := trim( Request.ContentFields.Values['edFLGINTERNO'] );

      sOpcoesEstima := '';
      sCampos       := '';

      cdsInput.Data := WebTransfPlano.SelecionaInput( iIdEventoGerador,
                                               trim( Request.ContentFields.Values['edFLGINTERNO'] ),
                                               1 );

      if not cdsInput.IsEmpty then
      begin
        cdsInput.First;
        with dtmModAutoAtendimento do
        begin
          cdsInputTransfPlano.Close;
          cdsInputTransfPlano.CreateDataSet;
          while not cdsInput.Eof do
          begin
            cdsInputTransfPlano.Insert;
            cdsInputTransfPlanoIDEVENTOGERADOR.AsFloat    := cdsInput.FieldByName('IDEVENTOGERADOR').AsFloat;
            cdsInputTransfPlanoIDINPUT.AsFloat            := cdsInput.FieldByName('IDINPUT').AsFloat;
            cdsInputTransfPlanoDESCRICAO.AsString         := cdsInput.FieldByName('DESCRICAO').AsString;
            cdsInputTransfPlanoIDREGRA.AsFloat            := cdsInput.FieldByName('IDREGRA').AsFloat;
            cdsInputTransfPlanoFLGTIPO.AsString           := cdsInput.FieldByName('FLGTIPO').AsString;
            cdsInputTransfPlanoTABELA.AsString            := cdsInput.FieldByName('TABELA').AsString;
            cdsInputTransfPlanoCAMPO.AsString             := cdsInput.FieldByName('CAMPO').AsString;
            cdsInputTransfPlanoNOMEPARAREGRA.AsString     := cdsInput.FieldByName('NOMEPARAREGRA').AsString;
            cdsInputTransfPlanoFLGATIVO.AsFloat           := cdsInput.FieldByName('FLGATIVO').AsFloat;
            cdsInputTransfPlanoFLGMANTIDO.AsFloat         := cdsInput.FieldByName('FLGMANTIDO').AsFloat;
            cdsInputTransfPlanoFLGMANTPARC.AsFloat        := cdsInput.FieldByName('FLGMANTPARC').AsFloat;
            cdsInputTransfPlanoFLGASSISTIDO.AsFloat       := cdsInput.FieldByName('FLGASSISTIDO').AsFloat;
            cdsInputTransfPlanoFLGBENEFICIARIO.AsFloat    := cdsInput.FieldByName('FLGBENEFICIARIO').AsFloat;
            cdsInputTransfPlanoFLGPODEALTERAR.AsFloat     := cdsInput.FieldByName('FLGPODEALTERAR').AsFloat;
            cdsInputTransfPlanoORDEM.AsFloat              := cdsInput.FieldByName('ORDEM').AsFloat;
            cdsInputTransfPlanoVALORDEFAULT.AsString      := cdsInput.FieldByName('VALORDEFAULT').AsString;
            cdsInputTransfPlanoIDREGRAVALIDA.AsFloat      := cdsInput.FieldByName('IDREGRAVALIDA').AsFloat;
            cdsInputTransfPlanoOBSERVACAO.AsString        := cdsInput.FieldByName('OBSERVACAO').AsString;
            cdsInputTransfPlanoIDREGRAVLRDEFAULT.AsFloat  := cdsInput.FieldByName('IDREGRAVLRDEFAULT').AsFloat;
            cdsInputTransfPlanoTIPODADO.AsString          := cdsInput.FieldByName('TIPODADO').AsString;

            cdsInputTransfPlanoVALOR.AsString           := trim(
             Request.ContentFields.Values[ 'edt' + cdsInput.FieldByName('IDINPUT').AsString ] );

            cdsInputTransfPlano.Post;


            //Preenche os campos para envio para o novo formulário.
            sCampos := sCampos +
             '    <input type="hidden" name="edt' + cdsInputTransfPlanoIDINPUT.AsString +
             '" value="' + cdsInputTransfPlanoVALOR.AsString +
             '">' + CR;

            cdsInput.Next;
          end;
          cdsInput.Close;
          cdsInput.Data := cdsInputTransfPlano.Data;
          cdsInputTransfPlano.Close;
        end;
      end;

      dtmModAutoAtendimento.cdsResultTransfDados.Close;
      dtmModAutoAtendimento.cdsResultTransfDados.CreateDataSet;

      cdsDados.Data := WebTransfPlano.GeraOpcoes( iIdPessJur,
                                                  iIdPlanoPrevAtual,
                                                  iIdPessoaLocal,
                                                  iSeqProposta,
                                                  iIdEventoGerador,
                                                  sFLGINTERNO,
                                                  iIdEmpresaProp,
                                                  Request.ContentFields.Values['edDATAREF'],
                                                  trim( Request.ContentFields.Values['edFLGBENEFTEMP'] ) = '1',
                                                  cdsInput.Data,
                                                  dtmModAutoAtendimento.cdsResultTransfDados.Data );


      dtmModAutoAtendimento.cdsResultTransfDados.Close;


      iOpcao := 0;
      iIdTipoTransfAnt := -1;
      cdsDados.First;
      while not cdsDados.Eof do
      begin

        if cdsDados.FieldByName('IDTIPOTRANSF').AsInteger <> iIdTipoTransfAnt then
        begin
          if iIdTipoTransfAnt > - 1 then inc( iOpcao );

          if iOpcao > 0 then
          begin
            Result := Result + '<form method="POST" name="frmOptarTransPlano' +
             cdsDados.FieldByName('IDTIPOTRANSF').AsString + '" ' +
             ' action="../<#nomearqapl>/OptarTransfPlano"> ' +
             ' <#hiddenfields> ';

            //COLOCAR DINÂMICO - FCRT (04/10/2002)
            if cdsDados.FieldByName('FLGTIPO').AsString = 'O' then
            begin

              sOpcoesEstima := sOpcoesEstima +
               ' <option value="' + FormatFloat( '00', iOpcao ) +
               trim( cdsDados.FieldByName('ITEM').AsString ) + '" '+ '>' +
               FormatFloat( '00', iOpcao ) + '. ' + trim( cdsDados.FieldByName('ITEM').AsString )
               + '</option>' + CR;
            end;

            Result := Result +
             '<p class="CABDIV">' + FormatFloat( '00', iOpcao ) +
             '. Optando por '+ cdsDados.FieldByName('ITEM').AsString +' </p>    ' + CR;

          end
          else
            Result := Result +
             '<p class="CABDIV">' + cdsDados.FieldByName('ITEM').AsString +' </p>' + CR;

          Result := Result +
           '<table border="0" width="100%" cellpadding="0" cellspacing="0">                               ' + CR;
        end;

        Result := Result +
         '  <tr>                                                                                         ' + CR +
         '    <td width="50%">                                                                           ' + CR +
         '      <p class="DESCCAMPO">                                                                    ' + CR +
         Trim( cdsDados.FieldByName('NOME').AsString )                                                     + CR +
         '      </p>                                                                                     ' + CR +
         '    </td>                                                                                      ' + CR +
         '    <td width="3%">                                                                            ' + CR +
         '      <p class="DESCCAMPO">                                                                    ' + CR +
         '        :                                                                                      ' + CR +
         '      </p>                                                                                     ' + CR +
         '    </td>                                                                                      ' + CR +
         '    <td width="20%">                                                                           ' + CR +
         '      <p class="CONTCAMPO" align="right">                                                      ' + CR ;

        Result := Result + cdsDados.FieldByName('VALOR').AsString;

        Result := Result                                                                                   + CR +
         '      </p>                                                                                     ' + CR +
         '    </td>                                                                                      ' + CR +
         '    <td>                                                                                       ' + CR +
         '      &nbsp;                                                                                   ' + CR +
         '    </td>                                                                                      ' + CR +
         '  </tr>                                                                                        ' + CR ;

        Result := Result +
         '  <input type="hidden" name="edIDCONFIG' +
         cdsDados.FieldByName('IDCONFIG').AsString +
         '" value = "' + cdsDados.FieldByName('VALOR').AsString + '"> ' + CR ;


        iIdTipoTransfAnt := cdsDados.FieldByName('IDTIPOTRANSF').AsInteger;

        cdsDados.Next;

        if  ( cdsDados.FieldByName('IDTIPOTRANSF').AsInteger <> iIdTipoTransfAnt )
         or ( cdsDados.Eof ) then
        begin
          Result := Result +
           '  </table>                                                                   ' + CR +
           '  <BR><BR>                                                                   ' + CR ;

          if iOpcao > 0 then
            Result := Result +
             '  <input type="hidden" name="edIdEventoGerador" value="' +
             IntToStr( iIdEventoGerador ) + '"> ' +
             '  <input type="hidden" name="edIDTIPOTRANSF" value="'+
             IntToStr( iIdTipoTransfAnt ) + '"> ' +
             '</form>                                                                    ' + CR ;
        end;
      end;

      cdsObs.Close;
      cdsObs.Data := WebTransfPlano.GeraObservacoes( iIdEventoGerador, 1, sFLGINTERNO );
      if not cdsObs.IsEmpty then
      begin
        Result := Result +
        ' <hr>                                                              ' + CR +
        ' <p class="CORPO">Observações:<br>                                 ' + CR ;

        cdsObs.First;
        while not cdsObs.Eof do
        begin
          Result := Result +
          '&nbsp;&nbsp;&nbsp;' +
          cdsObs.FieldByName('OBSERVACAO').AsString + '<br>' + CR;

          cdsObs.Next;
        end;
      end;
      cdsObs.Close;
      Result := Result + '</p>' + CR;

      if sOpcoesEstima <> '' then
        Result := Result +
         '<form method="POST" name="frmLnkEstimaTransfPlano"                              ' + CR +
         '   action="../<#nomearqapl>/CamposEstimaTransfPlano">               ' + CR +
         '  <center>                                                                      ' + CR +
         '    <table width="100%" border="0" cellpadding="0" cellspacing="0"              ' + CR +
         '           class="FORMULARIO">                                                  ' + CR +
         '      <tr>                                                                      ' + CR +
         '        <td class="DESCCAMPO">                                                  ' + CR +
         '          <center>                                                              ' + CR +
         '            Calcular estimativas com base na opção: &nbsp;                      ' + CR +
         '            <select size="1" name="cmbOpcao" class="TEXT">                      ' + CR +
         sOpcoesEstima                                                                           +
         '            </select>                                                           ' + CR +
         '          <a href="JavaScript:ConfirmaDados( )">                                ' + CR +
         '            <img src="../imagem/ok.gif" border="0"></a>                         ' + CR +
         '          </center>                                                             ' + CR +
         '        </td>                                                                   ' + CR +
         '      </tr>                                                                     ' + CR +
         '    </table>                                                                    ' + CR +
         sCampos                                                                                 +
         '    <input type="hidden" name="edIdPlanoPrevAtual"   value="' + IntToStr( iIdPlanoPrevAtual ) + '"> ' + CR +
         '    <input type="hidden" name="edIdPessJur"          value="' + IntToStr( iIdPessJur )        + '"> ' + CR +
         '    <input type="hidden" name="edIdEventoGerador"    value="' + IntToStr( iIdEventoGerador )  + '"> ' + CR +
         '    <input type="hidden" name="edIDPLANOPREV"        value="' + Request.ContentFields.Values['edIDPLANOPREV']            + '"> ' + CR +
         '    <input type="hidden" name="edIDPESSOA"           value="' + Request.ContentFields.Values['edIDPESSOA']               + '"> ' + CR +
         '    <input type="hidden" name="edSEQPROPOSTA"        value="' + Request.ContentFields.Values['edSEQPROPOSTA']            + '"> ' + CR +
         '    <input type="hidden" name="edMATRICULA"          value="' + Request.ContentFields.Values['edMATRICULA']              + '"> ' + CR +
         '    <input type="hidden" name="edINSCRICAODATA"      value="' + Request.ContentFields.Values['edINSCRICAODATA']          + '"> ' + CR +
         '    <input type="hidden" name="edSITUACAO"           value="' + Request.ContentFields.Values['edSITUACAO']               + '"> ' + CR +
         '    <input type="hidden" name="edDATANASC"           value="' + Request.ContentFields.Values['edDATANASC']               + '"> ' + CR +
         '    <input type="hidden" name="edDATAMORTE"          value="' + Request.ContentFields.Values['edDATAMORTE']              + '"> ' + CR +
         '    <input type="hidden" name="edESTCIVIL"           value="' + Request.ContentFields.Values['edESTCIVIL']               + '"> ' + CR +
         '    <input type="hidden" name="edSEXO"               value="' + Request.ContentFields.Values['edSEXO']                   + '"> ' + CR +
         '    <input type="hidden" name="edDATAADMISSAO"       value="' + Request.ContentFields.Values['edDATAADMISSAO']           + '"> ' + CR +
         '    <input type="hidden" name="edDATADEMISSAO"       value="' + Request.ContentFields.Values['edDATADEMISSAO']           + '"> ' + CR +
         '    <input type="hidden" name="edFLGINTERNO"         value="' + Request.ContentFields.Values['edFLGINTERNO']             + '"> ' + CR +
         '    <input type="hidden" name="edTEMPONAOCREDITADO"  value="' + Request.ContentFields.Values['edTEMPONAOCREDITADO']      + '"> ' + CR +
         '    <input type="hidden" name="edTEMPOSERVANTERIOR"  value="' + Request.ContentFields.Values['edTEMPOSERVANTERIOR']      + '"> ' + CR +
         '    <input type="hidden" name="edTEMPOSERVANTREAL"   value="' + Request.ContentFields.Values['edTEMPOSERVANTREAL']       + '"> ' + CR +
         '    <input type="hidden" name="edTEMPOSERVCALC"      value="' + Request.ContentFields.Values['edTEMPOSERVCALC']          + '"> ' + CR +
         '    <input type="hidden" name="edTEMPOSERVPRIVANT"   value="' + Request.ContentFields.Values['edTEMPOSERVPRIVANT']       + '"> ' + CR +
         '    <input type="hidden" name="edTEMPOSERVPUBLANT"   value="' + Request.ContentFields.Values['edTEMPOSERVPUBLANT']       + '"> ' + CR +
         '    <input type="hidden" name="edTEMPOSERVTOTAL"     value="' + Request.ContentFields.Values['edTEMPOSERVTOTAL']         + '"> ' + CR +
         '    <input type="hidden" name="edTEMPOSERVTOTDIA"    value="' + Request.ContentFields.Values['edTEMPOSERVTOTDIA']        + '"> ' + CR +
         '    <input type="hidden" name="edTEMPOSERVTOTMES"    value="' + Request.ContentFields.Values['edTEMPOSERVTOTMES']        + '"> ' + CR +
         '    <input type="hidden" name="edTEMPOSITESPECIAL"   value="' + Request.ContentFields.Values['edTEMPOSITESPECIAL']       + '"> ' + CR +
         '    <input type="hidden" name="edVALORPROVENTO"      value="' + Request.ContentFields.Values['edVALORPROVENTO']          + '"> ' + CR +
         '    <input type="hidden" name="edSALPARTICIPACAO"    value="' + Request.ContentFields.Values['edSALPARTICIPACAO']        + '"> ' + CR +
         '    <input type="hidden" name="edREMUNERACAO"        value="' + Request.ContentFields.Values['edREMUNERACAO']            + '"> ' + CR +
         '    <input type="hidden" name="edCONTRIBUICAO"       value="' + Request.ContentFields.Values['edCONTRIBUICAO']           + '"> ' + CR +
         '    <input type="hidden" name="edTEMPOINSS"          value="' + Request.ContentFields.Values['edTEMPOINSS']              + '"> ' + CR +
         '    <input type="hidden" name="edJOIA"               value="' + Request.ContentFields.Values['edJOIA']                   + '"> ' + CR +
         '    <input type="hidden" name="edPRAZOJOIAFALTA"     value="' + Request.ContentFields.Values['edPRAZOJOIAFALTA']         + '"> ' + CR +
         '    <input type="hidden" name="edPRAZOJOIAPAGO"      value="' + Request.ContentFields.Values['edPRAZOJOIAPAGO']          + '"> ' + CR +
         '    <input type="hidden" name="edRPTRIBUTAVEL"       value="' + Request.ContentFields.Values['edRPTRIBUTAVEL']           + '"> ' + CR +
         '    <input type="hidden" name="edRPNAOTRIBUTAVEL"    value="' + Request.ContentFields.Values['edRPNAOTRIBUTAVEL']        + '"> ' + CR +
         '    <input type="hidden" name="edSRB"                value="' + Request.ContentFields.Values['edSRB']                    + '"> ' + CR +
         '    <input type="hidden" name="edFATORPREVIDENC"     value="' + Request.ContentFields.Values['edFATORPREVIDENC']         + '"> ' + CR +
         '    <input type="hidden" name="edTEMPOMINCONTRIB"    value="' + Request.ContentFields.Values['edTEMPOMINCONTRIB']        + '"> ' + CR +
         '    <input type="hidden" name="edDATAINICIOFUND"     value="' + Request.ContentFields.Values['edDATAINICIOFUND']         + '"> ' + CR +
         '    <input type="hidden" name="edVALORATUAL"         value="' + Request.ContentFields.Values['edVALORATUAL']             + '"> ' + CR +
         '    <input type="hidden" name="edVLRINFINSS"         value="' + Request.ContentFields.Values['edVLRINFINSS']             + '"> ' + CR +
         '    <input type="hidden" name="edIDBENEFICIO"        value="' + Request.ContentFields.Values['edIDBENEFICIO']            + '"> ' + CR +
         '    <input type="hidden" name="edVALORABONO"         value="' + Request.ContentFields.Values['edVALORABONO']             + '"> ' + CR +
         '    <input type="hidden" name="edDATAULTSIMULA"      value="' + Request.ContentFields.Values['edDATAULTSIMULA']          + '"> ' + CR +
         '    <input type="hidden" name="edOPCAO"              value="' + Request.ContentFields.Values['edOPCAO']                  + '"> ' + CR +
         '    <input type="hidden" name="edTAXAJOIA"           value="' + Request.ContentFields.Values['edTAXAJOIA']               + '"> ' + CR +
         '    <input type="hidden" name="edIDADEAPOS"          value="' + Request.ContentFields.Values['edIDADEAPOS']              + '"> ' + CR +
         '    <input type="hidden" name="edPROPORCAO"          value="' + Request.ContentFields.Values['edPROPORCAO']              + '"> ' + CR +         
         '    <input type="hidden" name="edCOTAPENSAO"         value="' + Request.ContentFields.Values['edCOTAPENSAO']             + '"> ' + CR +
         '    <input type="hidden" name="edDATANASCVIT"        value="' + Request.ContentFields.Values['edDATANASCVIT']            + '"> ' + CR +
         '    <input type="hidden" name="edDATANASCTEMP"       value="' + Request.ContentFields.Values['edDATANASCTEMP']           + '"> ' + CR +
         '    <input type="hidden" name="edNUMDEPEN"           value="' + Request.ContentFields.Values['edNUMDEPEN']               + '"> ' + CR +
         '    <input type="hidden" name="edNUMDEPENVIT"        value="' + Request.ContentFields.Values['edNUMDEPENVIT']            + '"> ' + CR +
         '    <input type="hidden" name="edNUMDEPENTEMP"       value="' + Request.ContentFields.Values['edNUMDEPENTEMP']           + '"> ' + CR +
         '    <input type="hidden" name="edNOMESITUACAO"       value="' + Request.ContentFields.Values['edNOMESITUACAO']           + '"> ' + CR +         
         '    <input type="hidden" name="edNOMEPARTICIP"       value="' + Request.ContentFields.Values['edNOMEPARTICIP']           + '"> ' + CR +
         '    <input type="hidden" name="edNOMEPATRO"          value="' + Request.ContentFields.Values['edNOMEPATRO']              + '"> ' + CR +
         '    <input type="hidden" name="edNOMEPLANO"          value="' + Request.ContentFields.Values['edNOMEPLANO']              + '"> ' + CR +
         '    <input type="hidden" name="edNOMEBENEFICIO"      value="' + Request.ContentFields.Values['edNOMEBENEFICIO']          + '"> ' + CR +
         '    <input type="hidden" name="edFLGBENEFTEMP"       value="' + Request.ContentFields.Values['edFLGBENEFTEMP']           + '"> ' + CR +
         '    <input type="hidden" name="edDATAREF"            value="' + Request.ContentFields.Values['edDATAREF']                + '"> ' + CR +
         '    <input type="hidden" name="edDATATRANSACAO"      value="' + Request.ContentFields.Values['edDATATRANSACAO']          + '"> ' + CR +
         '    <input type="hidden" name="edCAMPOOP1"           value="' + Request.ContentFields.Values['edCAMPOOP1']               + '"> ' + CR +
         '    <input type="hidden" name="edCAMPOOP2"           value="' + Request.ContentFields.Values['edCAMPOOP2']               + '"> ' + CR +
         '    <input type="hidden" name="edCAMPOOP3"           value="' + Request.ContentFields.Values['edCAMPOOP3']               + '"> ' + CR +
         '    <input type="hidden" name="edCAMPOOP4"           value="' + Request.ContentFields.Values['edCAMPOOP4']               + '"> ' + CR +
         '    <input type="hidden" name="edCAMPOOP5"           value="' + Request.ContentFields.Values['edCAMPOOP5']               + '"> ' + CR +
         '    <input type="hidden" name="edIDBENEFICIOAssist"  value="' + Request.ContentFields.Values['edIDBENEFICIOAssist']      + '"> ' + CR +
         '    <input type="hidden" name="edDATAINICIOFUNDAssist" value="'+Request.ContentFields.Values['edDATAINICIOFUNDAssist']   + '"> ' + CR +
         '    <input type="hidden" name="edVALORSRBAssist"     value="' + Request.ContentFields.Values['edVALORSRBAssist']         + '"> ' + CR +
         '    <input type="hidden" name="edVLRCALCINSSAssist"  value="' + Request.ContentFields.Values['edVLRCALCINSSAssist']      + '"> ' + CR +
         '    <input type="hidden" name="edVLRINFINSSAssist"   value="' + Request.ContentFields.Values['edVLRINFINSSAssist']       + '"> ' + CR +
         '    <input type="hidden" name="edVALORATUALAssist"   value="' + Request.ContentFields.Values['edVALORATUALAssist']       + '"> ' + CR +
         '    <#hiddenfields>                                                             ' + CR +
         '  </center>                                                                     ' + CR +
         '</form>                                                                         ' + CR ;

      cdsInput.Close;
      cdsDados.Close;


      //Valida e confirma o preenchimento dos campos
      sJavaScript :=
       ' function ConfirmaDados( )                                                 ' + CR +
       ' {                                                                         ' + CR +
       '   EnviaForm( document.frmLnkEstimaTransfPlano );                          ' + CR +
       ' }                                                                         ' + CR ;

      Result := MontaPagina( pTpOpcoesTransacao, Result );

    except
      On E : Exception do
      begin
        Result := TrataWebExcecoes( E );
      end;
    end;

  finally
    cdsInput.Free;
    cdsDados.Free;
    cdsObs.Free;
  end;

end; {PaginaOpcoesTransfPlano}


function ClienteNumero(sNumero : string):string;
var i : integer;
    sResult,
    sCliente : string;
    bPrimPonto : boolean;
begin
   if Trim(sNumero)  = ''
   then begin
      Result := '0';
      exit;
   end;

   sCliente := '';
   bPrimPonto := False;
   for i := length(Trim(sNumero)) downto 1
   do begin
     if sNumero[i] = '.'
     then begin
        if not bPrimPonto
        then begin
           sCliente := sCliente + DecimalSeparator;
           bPrimPonto := True;
        end
        else sCliente := sCliente;
     end
     else begin
        if sNumero[i] <> DecimalSeparator
        then sCliente := sCliente + sNumero[i]
        else begin
           if not bPrimPonto
           then begin
              sCliente := sCliente+DecimalSeparator;
              bPrimPonto := True;
           end
           else sCliente := sCliente;
        end;
     end;
   end;
   sResult := '';
   for i := length(sCliente) downto 1
   do begin
      sResult := sResult + sCliente[i];
   end;
   Result := sResult;
end; {ClienteNumero}


//Monta a página de opção de transferência de plano
function PaginaOptarTransfPlano( iIdPessoaLocal : integer; Request: TWebRequest ) : String;
var
  iIdEventoGerador,
  i : integer;

begin

  try

    sTitulo := TituloPagina( pTransfPlano );

    Result := '<p class="MINI" align="right"><#datahora></p>              ' + CR +
     '<p class="TITULO">' + sTitulo + '</p>                               ' + CR +
     '<p class="SUBTITULO">Confirmação de Opção</p><BR>                   ' + CR ;

    iIdEventoGerador  := StrToInt( Request.ContentFields.Values['edIdEventoGerador'] );

    cds.Close;
    cds.Data := SimulaTransfPlano.SelecionaSimulaTransfPlano( -1 );

    for i := 0 to Request.ContentFields.Count - 1 do
    begin
      if UpperCase( Copy( Request.ContentFields.Strings[i], 3, 8 ) ) = 'IDCONFIG' then
      begin
        cds.Insert;
        cds.FieldByName('IDEVENTOGERADOR').AsInteger := iIdEventoGerador;
        cds.FieldByName('IDTIPOTRANSF').AsInteger    :=
         StrToInt( Request.ContentFields.Values['edIDTIPOTRANSF'] );
        cds.FieldByName('IDCONFIG').AsInteger        := StrToInt( StrRight(
         Request.ContentFields.Names[i], length( Request.ContentFields.Names[i] ) - 10 ) );
        cds.FieldByName('IDPESSOA').AsInteger        := iIdPessoaLocal;
        cds.FieldByName('VALOR').AsString            :=
         Request.ContentFields.Values[Request.ContentFields.Names[i]];
        cds.FieldByName('DTSIMULA').AsDateTime       := Now;
        cds.Post;
      end;
    end;

    SimulaTransfPlano.CdsSimulaTransfPlano.Data := cds.Data;
    if not SimulaTransfPlano.GravaSimulaTransfPlano then
      raise Exception.Create( sMsgCtrl );

    cds.Close;

    Result := Result + OpcaoTransfPlanoSelecionada( iIdPessoaLocal ) + '<BR><BR>' + CR +
     '<p class="LINK" align="center">                                           ' + CR +
     '  <a href="javascript:EnviaForm( document.frmLnkHome );">                 ' + CR +
     '    Voltar para Home                                                      ' + CR +
     '  </a>                                                                    ' + CR +
     '</p><BR>                                                                  ' + CR ;

    Result := MontaPagina( pTransfPlano, Result );

  except
    On E : Exception do
    begin
      Result := TrataWebExcecoes( E );
    end;
  end;

end; {PaginaOptarTransfPlano}

//Exibe os dados da opção selecionada
function OpcaoTransfPlanoSelecionada( iIdPessoaLocal : integer ) : string;
begin

  cds.Close;
  cds.Data := SimulaTransfPlano.DadosSimulacao( iIdPessoaLocal );

  if cds.IsEmpty then
  begin
    Result := '';
    cds.Close;
    exit;
  end;

  cds.First;

  Result := Result +
   '<table border="0" width="100%" cellpadding="0" cellspacing="0">    ' + CR +
   '  <tr>                                                             ' + CR +
   '    <td width="6%">                                                ' + CR +
   '      <p class="DESCCAMPO">                                        ' + CR +
   '        Plano:                                                     ' + CR +
   '      </p>                                                         ' + CR +
   '    </td>                                                          ' + CR +
   '    <td>                                                           ' + CR +
   '      <p class="CONTCAMPOD">                                       ' + CR +
   cds.FieldByName('PLANO').AsString                                     + CR +
   '      </p>                                                         ' + CR +
   '    </td>                                                          ' + CR +
   '  </tr>                                                            ' + CR +
   '</table>                                                           ' + CR +
   '<BR>                                                               ' + CR +
   '<p class="CABDIV">' + cds.FieldByName('NOMETIPO').AsString +' </p> ' + CR +
   '<table border="0" width="100%" cellpadding="0" cellspacing="0">    ' + CR ;

  while not cds.Eof do
  begin
    Result := Result +
     '  <tr>                                                                                         ' + CR +
     '    <td width="50%">                                                                           ' + CR +
     '      <p class="DESCCAMPO">                                                                    ' + CR +
     Trim( cds.FieldByName('NOMECONFIG').AsString )                                                    + CR +
     '      </p>                                                                                     ' + CR +
     '    </td>                                                                                      ' + CR +
     '    <td width="3%">                                                                            ' + CR +
     '      <p class="DESCCAMPO">                                                                    ' + CR +
     '        :                                                                                      ' + CR +
     '      </p>                                                                                     ' + CR +
     '    </td>                                                                                      ' + CR +
     '    <td width="12%">                                                                           ' + CR +
     '      <p class="CONTCAMPO" align="right">                                                      ' + CR +
     FormatFloat( '#,##0.00', StrToFloat( ClienteNumero( cds.FieldByName('VALOR').AsString ) ) )       + CR +
     '      </p>                                                                                     ' + CR +
     '    </td>                                                                                      ' + CR +
     '    <td>                                                                                       ' + CR +
     '      &nbsp;                                                                                   ' + CR +
     '    </td>                                                                                      ' + CR +
     '  </tr>                                                                                        ' + CR ;

    cds.Next;
  end;

  Result := Result + '</table>';

  cds.Close;

end;


//Monta a página de estimativas de transferência de plano
function PaginaEstimaTransfPlano( iIdPessoaLocal : integer; Request: TWebRequest ) : String;
var
  cdsInput,
  cdsDados,
  cdsInfBanco,
  cdsObs : TCMClientDataSet;

  iIdEventoGerador,
  iIdPlanoPrevAtual,
  iIdPessJur,
  iSeqProposta : integer;

  iOpcao : integer;

  sFLGINTERNO : string;

  iIdTipoTransfAnt : integer;

  sOp, sTituloOp : string;
  sValorAnt, sValorAtual : string;
begin

  cdsInput    := TCMClientDataSet.Create( nil );
  cdsDados    := TCMClientDataSet.Create( nil );
  cdsObs      := TCMClientDataSet.Create( nil );
  cdsInfBanco := TCMClientDataSet.Create( nil );

  try

    try

      sOp       := Request.ContentFields.Values['edOpcao'];
      sTituloOp := Request.ContentFields.Values['edTitOpcao'];

      sTitulo := StrSubst( TituloPagina( pTpEstimativasTransacao ), '<1>', QuotedStr( sTituloOp ) );

      iIdEventoGerador  := StrToInt( Request.ContentFields.Values['edIdEventoGerador'] );
      iIdPlanoPrevAtual := StrToInt( Request.ContentFields.Values['edIdPlanoPrevAtual'] );
      iIdPessJur        := StrToInt( Request.ContentFields.Values['edIDPESSJUR'] );
      iSeqProposta      := StrToInt( Request.ContentFields.Values['edSEQPROPOSTA'] );
      sFLGINTERNO       := trim( Request.ContentFields.Values['edFLGINTERNO'] );

      cdsInput.Data := WebTransfPlano.SelecionaInput( iIdEventoGerador,
                                               trim( Request.ContentFields.Values['edFLGINTERNO'] ),
                                               0 );

      with dtmModAutoAtendimento do
      begin

        if not cdsInput.IsEmpty then
        begin
          cdsInput.First;

          cdsInputTransfPlano.Close;
          cdsInputTransfPlano.CreateDataSet;
          while not cdsInput.Eof do
          begin
            cdsInputTransfPlano.Insert;
            cdsInputTransfPlano.FieldByName('IDEVENTOGERADOR').AsString   := cdsInput.FieldByName('IDEVENTOGERADOR').AsString;
            cdsInputTransfPlano.FieldByName('IDINPUT').AsString           := cdsInput.FieldByName('IDINPUT').AsString;
            cdsInputTransfPlano.FieldByName('DESCRICAO').AsString         := cdsInput.FieldByName('DESCRICAO').AsString;
            cdsInputTransfPlano.FieldByName('IDREGRA').AsString           := cdsInput.FieldByName('IDREGRA').AsString;
            cdsInputTransfPlano.FieldByName('FLGTIPO').AsString           := cdsInput.FieldByName('FLGTIPO').AsString;
            cdsInputTransfPlano.FieldByName('TABELA').AsString            := cdsInput.FieldByName('TABELA').AsString;
            cdsInputTransfPlano.FieldByName('CAMPO').AsString             := cdsInput.FieldByName('CAMPO').AsString;
            cdsInputTransfPlano.FieldByName('NOMEPARAREGRA').AsString     := cdsInput.FieldByName('NOMEPARAREGRA').AsString;
            cdsInputTransfPlano.FieldByName('FLGATIVO').AsString          := cdsInput.FieldByName('FLGATIVO').AsString;
            cdsInputTransfPlano.FieldByName('FLGMANTIDO').AsString        := cdsInput.FieldByName('FLGMANTIDO').AsString;
            cdsInputTransfPlano.FieldByName('FLGMANTPARC').AsString       := cdsInput.FieldByName('FLGMANTPARC').AsString;
            cdsInputTransfPlano.FieldByName('FLGASSISTIDO').AsString      := cdsInput.FieldByName('FLGASSISTIDO').AsString;
            cdsInputTransfPlano.FieldByName('FLGBENEFICIARIO').AsString   := cdsInput.FieldByName('FLGBENEFICIARIO').AsString;
            cdsInputTransfPlano.FieldByName('FLGPODEALTERAR').AsString    := cdsInput.FieldByName('FLGPODEALTERAR').AsString;
            cdsInputTransfPlano.FieldByName('ORDEM').AsString             := cdsInput.FieldByName('ORDEM').AsString;
            cdsInputTransfPlano.FieldByName('VALORDEFAULT').AsString      := cdsInput.FieldByName('VALORDEFAULT').AsString;
            cdsInputTransfPlano.FieldByName('IDREGRAVALIDA').AsString     := cdsInput.FieldByName('IDREGRAVALIDA').AsString;
            cdsInputTransfPlano.FieldByName('OBSERVACAO').AsString        := cdsInput.FieldByName('OBSERVACAO').AsString;
            cdsInputTransfPlano.FieldByName('IDREGRAVLRDEFAULT').AsString := cdsInput.FieldByName('IDREGRAVLRDEFAULT').AsString;
            cdsInputTransfPlano.FieldByName('TIPODADO').AsString          := cdsInput.FieldByName('TIPODADO').AsString;
            cdsInputTransfPlano.FieldByName('VALOR').AsString             := cdsInput.FieldByName('VALOR').AsString;
            cdsInputTransfPlano.Post;

            cdsInput.Next;
          end;
        end;

        cdsInput.Close;
        cdsInput.Data := cdsInputTransfPlano.Data;
        cdsInputTransfPlano.Close;
      end;

      cdsInfBanco.Data := cdsInput.Data;
      cdsInfBanco.First;
      while not cdsInfBanco.Eof do
      begin
        if   ( cdsInfBanco.FieldByName('FLGTIPO').AsString <> 'I' )
         and ( trim( cdsInfBanco.FieldByName('NOMEPARAREGRA').AsString ) <> '' ) then
        begin
          cdsInfBanco.Edit;
          cdsInfBanco.FieldByName('VALOR').AsString := OraNumero( trim( Request.ContentFields.Values[
             'edt' + cdsInfBanco.FieldByName('IDINPUT').AsString ] ) );
          cdsInfBanco.Post;
        end;

        cdsInfBanco.Next;
      end;

      if not cdsInput.IsEmpty then
      begin
        cdsInput.First;
        with dtmModAutoAtendimento do
        begin
          cdsInputTransfPlano.Close;
          cdsInputTransfPlano.CreateDataSet;
          while not cdsInput.Eof do
          begin
            sValorAtual := OraNumero( trim( Request.ContentFields.Values[
             'edt' + cdsInput.FieldByName('IDINPUT').AsString ] ) );

            sValorAnt := OraNumero( trim( Request.ContentFields.Values[
             'edAnt' + cdsInput.FieldByName('IDINPUT').AsString ] ) );

            if   ( cdsInput.FieldByName('FLGTIPO').AsString = 'I' )
             and ( trim( cdsInput.FieldByName('IDREGRAVALIDA').AsString ) <> '' ) then
              if sValorAtual <> sValorAnt then
              begin
                if not WebTransfPlano.ValidaConteudo( cdsInput.FieldByName('IDREGRAVALIDA').AsInteger,
                                                      sValorAtual,
                                                      iIdPessJur,
                                                      iIdPlanoPrevAtual,
                                                      iIdPessoaLocal,
                                                      iSeqProposta,
                                                      iIdEventoGerador,
                                                      iIdEmpresaProp,
                                                      sOp,
                                                      Request.ContentFields.Values['edDATAREF'],
                                                      cdsInfBanco.Data ) then
                  raise Exception.Create('O valor do campo "' + trim(
                   cdsInput.FieldByName('DESCRICAO').AsString ) + '" não é permitido.' );
              end;

            cdsInputTransfPlano.Insert;
            cdsInputTransfPlanoIDEVENTOGERADOR.AsFloat    := cdsInput.FieldByName('IDEVENTOGERADOR').AsFloat;
            cdsInputTransfPlanoIDINPUT.AsFloat            := cdsInput.FieldByName('IDINPUT').AsFloat;
            cdsInputTransfPlanoDESCRICAO.AsString         := cdsInput.FieldByName('DESCRICAO').AsString;
            cdsInputTransfPlanoIDREGRA.AsFloat            := cdsInput.FieldByName('IDREGRA').AsFloat;
            cdsInputTransfPlanoFLGTIPO.AsString           := cdsInput.FieldByName('FLGTIPO').AsString;
            cdsInputTransfPlanoTABELA.AsString            := cdsInput.FieldByName('TABELA').AsString;
            cdsInputTransfPlanoCAMPO.AsString             := cdsInput.FieldByName('CAMPO').AsString;
            cdsInputTransfPlanoNOMEPARAREGRA.AsString     := cdsInput.FieldByName('NOMEPARAREGRA').AsString;
            cdsInputTransfPlanoFLGATIVO.AsFloat           := cdsInput.FieldByName('FLGATIVO').AsFloat;
            cdsInputTransfPlanoFLGMANTIDO.AsFloat         := cdsInput.FieldByName('FLGMANTIDO').AsFloat;
            cdsInputTransfPlanoFLGMANTPARC.AsFloat        := cdsInput.FieldByName('FLGMANTPARC').AsFloat;
            cdsInputTransfPlanoFLGASSISTIDO.AsFloat       := cdsInput.FieldByName('FLGASSISTIDO').AsFloat;
            cdsInputTransfPlanoFLGBENEFICIARIO.AsFloat    := cdsInput.FieldByName('FLGBENEFICIARIO').AsFloat;
            cdsInputTransfPlanoFLGPODEALTERAR.AsFloat     := cdsInput.FieldByName('FLGPODEALTERAR').AsFloat;
            cdsInputTransfPlanoORDEM.AsFloat              := cdsInput.FieldByName('ORDEM').AsFloat;
            cdsInputTransfPlanoVALORDEFAULT.AsString      := cdsInput.FieldByName('VALORDEFAULT').AsString;
            cdsInputTransfPlanoIDREGRAVALIDA.AsFloat      := cdsInput.FieldByName('IDREGRAVALIDA').AsFloat;
            cdsInputTransfPlanoOBSERVACAO.AsString        := cdsInput.FieldByName('OBSERVACAO').AsString;
            cdsInputTransfPlanoIDREGRAVLRDEFAULT.AsFloat  := cdsInput.FieldByName('IDREGRAVLRDEFAULT').AsFloat;
            cdsInputTransfPlanoTIPODADO.AsString          := cdsInput.FieldByName('TIPODADO').AsString;

            cdsInputTransfPlanoVALOR.AsString           := sValorAtual;

            cdsInputTransfPlano.Post;

            cdsInput.Next;
          end;
          cdsInput.Close;
          cdsInput.Data := cdsInputTransfPlano.Data;
          cdsInputTransfPlano.Close;
        end;
      end;

      dtmModAutoAtendimento.cdsResultTransfDados.Close;
      dtmModAutoAtendimento.cdsResultTransfDados.CreateDataSet;

      cdsDados.Data := WebTransfPlano.GeraEstimativas( iIdPessJur,
                                                      iIdPlanoPrevAtual,
                                                      iIdPessoaLocal,
                                                      iSeqProposta,
                                                      iIdEventoGerador,
                                                      sOp,
                                                      sFLGINTERNO,
                                                      iIdEmpresaProp,
                                                      Request.ContentFields.Values['edDATAREF'],
                                                      trim( Request.ContentFields.Values['edFLGBENEFTEMP'] ) = '1',
                                                      cdsInput.Data,
                                                      dtmModAutoAtendimento.cdsResultTransfDados.Data );

      dtmModAutoAtendimento.cdsResultTransfDados.Close;

      iOpcao := 0;
      iIdTipoTransfAnt := 0;
      cdsDados.First;
      while not cdsDados.Eof do
      begin

        if cdsDados.FieldByName('IDTIPOTRANSF').AsInteger <> iIdTipoTransfAnt then
        begin
          inc( iOpcao );

          Result := Result +
           '<p class="CABDIV">' + FormatFloat( '00', iOpcao ) +
           '. '+ cdsDados.FieldByName('ITEM').AsString +' </p>    ' + CR;

          Result := Result +
           '<table border="0" width="100%" cellpadding="0" cellspacing="0"> ' + CR;
        end;

        Result := Result +
         '  <tr>                                                                                         ' + CR +
         '    <td width="50%">                                                                           ' + CR +
         '      <p class="DESCCAMPO">                                                                    ' + CR +
         Trim( cdsDados.FieldByName('NOME').AsString )                                                     + CR +
         '      </p>                                                                                     ' + CR +
         '    </td>                                                                                      ' + CR +
         '    <td width="3%">                                                                            ' + CR +
         '      <p class="DESCCAMPO">                                                                    ' + CR +
         '        :                                                                                      ' + CR +
         '      </p>                                                                                     ' + CR +
         '    </td>                                                                                      ' + CR +
         '    <td width="20%">                                                                           ' + CR +
         '      <p class="CONTCAMPO" align="right">                                                      ' + CR ;

        Result := Result + cdsDados.FieldByName('VALOR').AsString;

        Result := Result                                                                                   + CR +
         '      </p>                                                                                     ' + CR +
         '    </td>                                                                                      ' + CR +
         '    <td>                                                                                       ' + CR +
         '      &nbsp;                                                                                   ' + CR +
         '    </td>                                                                                      ' + CR +
         '  </tr>                                                                                        ' + CR ;

        iIdTipoTransfAnt := cdsDados.FieldByName('IDTIPOTRANSF').AsInteger;

        cdsDados.Next;

        if  ( cdsDados.FieldByName('IDTIPOTRANSF').AsInteger <> iIdTipoTransfAnt )
         or ( cdsDados.Eof ) then
        begin
          Result := Result +
           '  </table>                                                                   ' + CR +
           '  <BR>                                                                       ' + CR ;
        end;
      end;

      cdsObs.Close;
      cdsObs.Data := WebTransfPlano.GeraObservacoes( iIdEventoGerador, 2, sFLGINTERNO );
      if not cdsObs.IsEmpty then
      begin
        Result := Result +
        ' <hr>                                                              ' + CR +
        ' <p class="CORPO">Observações:<br>                                 ' + CR ;

        cdsObs.First;
        while not cdsObs.Eof do
        begin
          Result := Result +
          '&nbsp;&nbsp;&nbsp;' +
          cdsObs.FieldByName('OBSERVACAO').AsString + '<br>' + CR;

          cdsObs.Next;
        end;
      end;
      cdsObs.Close;
      Result := Result + '</p><BR>' + CR ;

      cdsInput.Close;
      cdsDados.Close;

      Result := MontaPagina( pTpEstimativasTransacao, Result );

    except
      On E : Exception do
      begin
        Result := TrataWebExcecoes( E );
      end;
    end;

  finally
    cdsInput.Free;
    cdsDados.Free;
    cdsObs.Free;
    cdsInfBanco.Free;
  end;
end; {PaginaEstimaTransfPlano}


//Monta a página de opções de transferência de plano
function PaginaCamposEstimaTransfPlano( iIdPessoaLocal : integer; Request: TWebRequest ) : String;
var
  iIdEventoGerador : integer;
  sFieldNames, sFieldTitles : array of String;
  i : integer;

  Lista : TStringList;

  iIdPlanoPrev, iIdPlanoPrevAtual, iIdPessJur : integer;
  sFlgInterno, sFlgBenefTemp : String;
  sOp, sTituloOp, sCampos : string;
begin
  Lista := TStringList.Create;
  try

    try

      sOp        := IntToStr( StrToInt( StrLeft( Request.ContentFields.Values['cmbOpcao'], 2 ) ) );
      sTituloOp  := StrRight( Request.ContentFields.Values['cmbOpcao'],
                    length( Request.ContentFields.Values['cmbOpcao'] ) - 2 );

      sTitulo := StrSubst( TituloPagina( pTpDadosEstimativas ), '<1>', QuotedStr( sTituloOp ) );

      iIdPlanoPrev      := StrToInt( Request.ContentFields.Values['edIdPlanoPrev'] );
      iIdPlanoPrevAtual := StrToInt( Request.ContentFields.Values['edIdPlanoPrevAtual'] );
      iIdPessJur        := StrToInt( Request.ContentFields.Values['edIdPessJur'] );
      iIdEventoGerador  := StrToInt( Request.ContentFields.Values['edIdEventoGerador'] );
      sFlgInterno       := Request.ContentFields.Values['edFLGINTERNO'];
      sFlgBenefTemp     := Request.ContentFields.Values['edFLGBENEFTEMP'];


      //Preenche os campos para envio para o novo formulário.
      for i := 0 to Request.ContentFields.Count - 1 do
        if StrLeft( trim( Request.ContentFields.Names[i] ), 3 ) = 'edt' then
          sCampos := sCampos +
           '    <input type="hidden" name="' + Request.ContentFields.Names[i] +
           '" value="' + Request.ContentFields.Values[Request.ContentFields.Names[i] ] + '">' + CR;

      cds.Close;
      cds.Data := WebTransfPlano.RecuperaNomePlano( iIdPlanoPrev );
      Result := Result +
       '<table border="0" width="100%" cellpadding="0" cellspacing="0">                         ' + CR +
       '  <tr>                                                                                  ' + CR +
       '    <td width="6%">                                                                     ' + CR +
       '      <p class="DESCCAMPO">                                                             ' + CR +
       '        Plano:                                                                          ' + CR +
       '      </p>                                                                              ' + CR +
       '    </td>                                                                               ' + CR +
       '    <td>                                                                                ' + CR +
       '      <p class="CONTCAMPOD">                                                            ' + CR +
       cds.FieldByName('NOME').AsString                                                           + CR +
       '      </p>                                                                              ' + CR +
       '    </td>                                                                               ' + CR +
       '  </tr>                                                                                 ' + CR +
       '</table>                                                                                ' + CR +
       '<form method="POST" name="frmLnkEstimaTransfPlano"                                      ' + CR +
       '   action="../<#nomearqapl>/EstimaTransfPlano">                             ' + CR +
       '  <center>                                                                              ' + CR +
       '    <table width="100%" border="0" cellpadding="0" cellspacing="0"                      ' + CR +
       '           class="FORMULARIO">                                                          ' + CR ;

      Lista.Text := Request.ContentFields.Text;

      dtmModAutoAtendimento.cdsInputTransfPlano.Close;
      dtmModAutoAtendimento.cdsInputTransfPlano.CreateDataSet;

      cds.Close;
      cds.Data := WebTransfPlano.GeraCamposEstimativas(  iIdEmpresaProp,
                                                         iIdEventoGerador,
                                                         sFlgInterno,
                                                         sFlgBenefTemp,
                                                         iIdPessJur,
                                                         iIdPlanoPrevAtual,
                                                         iIdPessoaLocal,
                                                         StrToInt( Request.ContentFields.Values['edSEQPROPOSTA'] ),
                                                         Request.ContentFields.Values['edDATAREF'],
                                                         Lista.Text,
                                                         dtmModAutoAtendimento.cdsInputTransfPlano.Data );


      dtmModAutoAtendimento.cdsInputTransfPlano.Close;

      if not cds.IsEmpty then
      begin

        Result := Result +
         '      <tr>                                                                              ' + CR +
         '        <td align="center">                                                             ' + CR +
         '          <DIV class="BOXFORM" width="100%">                                            ' + CR +
         '            Por favor, preencha os campos solicitados abaixo para execução do cálculo.  ' + CR +
         '          </DIV>                                                                        ' + CR +
         '        </td>                                                                           ' + CR +
         '      </tr>                                                                             ' + CR +
         '      <tr>                                                                              ' + CR +
         '        <td class="DESCCAMPO">                                                          ' + CR +
         '          <table width="100%" border="0" cellpadding="0" cellspacing="0">               ' + CR ;

        i := 0;
        cds.First;
        while not cds.Eof do
        begin
          Result := Result +
           '            <tr height="20">                                                    ' + CR +
           '              <td width="72%" class="DESCCAMPO">                                ' + CR +
           cds.FieldByName('DESCRICAO').AsString                                              + CR +
           '              </td>                                                             ' + CR +
           '              <td class="CONTCAMPO" align="right">                              ' + CR ;

          SetLength( sFieldNames, i + 1 );
          SetLength( sFieldTitles, i + 1 );
          sFieldNames[i]  := 'edt' + cds.FieldByName('IDINPUT').AsString;
          sFieldTitles[i] := cds.FieldByName('DESCRICAO').AsString;

          Result := Result +
           '                <input type="text" name="edt' +
           cds.FieldByName('IDINPUT').AsString + '" class="TEXT" maxlength="20"           ' + CR +
           'value="' + OraNumeroInv( cds.FieldByName('VALOR').AsString ) + '" size="30">  ' + CR;

          //Armazena valor original para posterior comparação
          Result := Result +
           '                <input type="hidden" name="edAnt' +
           cds.FieldByName('IDINPUT').AsString + '" value="' +
           OraNumeroInv( cds.FieldByName('VALOR').AsString ) + '" >' + CR;

          i := i + 1;

          Result := Result +
           '              </td>                                                             ' + CR ;
          cds.Next;
        end;

        Result := Result +
         '          </table>                                                              ' + CR +
         '        </td>                                                                   ' + CR +
         '      </tr>                                                                     ' + CR ;

      end;

      Result := Result +
       '      <tr>                                                                      ' + CR +
       '        <td align="center">                                                     ' + CR +
       '          <br>                                                                  ' + CR +
       '          <a href="JavaScript:ConfirmaDados();">                                ' + CR +
       '           <img src="../imagem/btnConfirmar.gif" name="btnConfirmar" border="0" ' + CR +
       '            onMouseOver="btnConfirmar.src=''../imagem/btnConfirmar_s.gif''"     ' + CR +
       '            onMouseOut="btnConfirmar.src=''../imagem/btnConfirmar.gif''"></a>   ' + CR +
       '          <a href="JavaScript:EnviaForm( document.frmLnkHome )">                ' + CR +
       '            <img src="../imagem/btnCancelar.gif" name="btnCancelar" border="0"  ' + CR +
       '            onMouseOver="btnCancelar.src=''../imagem/btnCancelar_s.gif''"       ' + CR +
       '            onMouseOut="btnCancelar.src=''../imagem/btnCancelar.gif''"></a>     ' + CR +
       '        </td>                                                                   ' + CR +
       '      </tr>                                                                     ' + CR +
       '    </table>                                                                    ' + CR +
       sCampos                                                                                 +
       '    <input type="hidden" name="edIdPlanoPrevAtual"   value="' + IntToStr( iIdPlanoPrevAtual )                            + '"> ' + CR +
       '    <input type="hidden" name="edIdPessJur"          value="' + IntToStr( iIdPessJur )                                   + '"> ' + CR +
       '    <input type="hidden" name="edIdEventoGerador"    value="' + IntToStr( iIdEventoGerador )                             + '"> ' + CR +
       '    <input type="hidden" name="edOpcao"              value="' + sOp                                                      + '"> ' + CR +
       '    <input type="hidden" name="edTitOpcao"           value="' + sTituloOp                                                + '"> ' + CR +
       '    <input type="hidden" name="edIDPLANOPREV"        value="' + Request.ContentFields.Values['edIDPLANOPREV']            + '"> ' + CR +
       '    <input type="hidden" name="edIDPESSOA"           value="' + Request.ContentFields.Values['edIDPESSOA']               + '"> ' + CR +
       '    <input type="hidden" name="edSEQPROPOSTA"        value="' + Request.ContentFields.Values['edSEQPROPOSTA']            + '"> ' + CR +
       '    <input type="hidden" name="edMATRICULA"          value="' + Request.ContentFields.Values['edMATRICULA']              + '"> ' + CR +
       '    <input type="hidden" name="edINSCRICAODATA"      value="' + Request.ContentFields.Values['edINSCRICAODATA']          + '"> ' + CR +
       '    <input type="hidden" name="edSITUACAO"           value="' + Request.ContentFields.Values['edSITUACAO']               + '"> ' + CR +
       '    <input type="hidden" name="edDATANASC"           value="' + Request.ContentFields.Values['edDATANASC']               + '"> ' + CR +
       '    <input type="hidden" name="edDATAMORTE"          value="' + Request.ContentFields.Values['edDATAMORTE']              + '"> ' + CR +
       '    <input type="hidden" name="edESTCIVIL"           value="' + Request.ContentFields.Values['edESTCIVIL']               + '"> ' + CR +
       '    <input type="hidden" name="edSEXO"               value="' + Request.ContentFields.Values['edSEXO']                   + '"> ' + CR +
       '    <input type="hidden" name="edDATAADMISSAO"       value="' + Request.ContentFields.Values['edDATAADMISSAO']           + '"> ' + CR +
       '    <input type="hidden" name="edDATADEMISSAO"       value="' + Request.ContentFields.Values['edDATADEMISSAO']           + '"> ' + CR +
       '    <input type="hidden" name="edFLGINTERNO"         value="' + Request.ContentFields.Values['edFLGINTERNO']             + '"> ' + CR +
       '    <input type="hidden" name="edTEMPONAOCREDITADO"  value="' + Request.ContentFields.Values['edTEMPONAOCREDITADO']      + '"> ' + CR +
       '    <input type="hidden" name="edTEMPOSERVANTERIOR"  value="' + Request.ContentFields.Values['edTEMPOSERVANTERIOR']      + '"> ' + CR +
       '    <input type="hidden" name="edTEMPOSERVANTREAL"   value="' + Request.ContentFields.Values['edTEMPOSERVANTREAL']       + '"> ' + CR +
       '    <input type="hidden" name="edTEMPOSERVCALC"      value="' + Request.ContentFields.Values['edTEMPOSERVCALC']          + '"> ' + CR +
       '    <input type="hidden" name="edTEMPOSERVPRIVANT"   value="' + Request.ContentFields.Values['edTEMPOSERVPRIVANT']       + '"> ' + CR +
       '    <input type="hidden" name="edTEMPOSERVPUBLANT"   value="' + Request.ContentFields.Values['edTEMPOSERVPUBLANT']       + '"> ' + CR +
       '    <input type="hidden" name="edTEMPOSERVTOTAL"     value="' + Request.ContentFields.Values['edTEMPOSERVTOTAL']         + '"> ' + CR +
       '    <input type="hidden" name="edTEMPOSERVTOTDIA"    value="' + Request.ContentFields.Values['edTEMPOSERVTOTDIA']        + '"> ' + CR +
       '    <input type="hidden" name="edTEMPOSERVTOTMES"    value="' + Request.ContentFields.Values['edTEMPOSERVTOTMES']        + '"> ' + CR +
       '    <input type="hidden" name="edTEMPOSITESPECIAL"   value="' + Request.ContentFields.Values['edTEMPOSITESPECIAL']       + '"> ' + CR +
       '    <input type="hidden" name="edVALORPROVENTO"      value="' + Request.ContentFields.Values['edVALORPROVENTO']          + '"> ' + CR +
       '    <input type="hidden" name="edSALPARTICIPACAO"    value="' + Request.ContentFields.Values['edSALPARTICIPACAO']        + '"> ' + CR +
       '    <input type="hidden" name="edREMUNERACAO"        value="' + Request.ContentFields.Values['edREMUNERACAO']            + '"> ' + CR +
       '    <input type="hidden" name="edCONTRIBUICAO"       value="' + Request.ContentFields.Values['edCONTRIBUICAO']           + '"> ' + CR +
       '    <input type="hidden" name="edTEMPOINSS"          value="' + Request.ContentFields.Values['edTEMPOINSS']              + '"> ' + CR +
       '    <input type="hidden" name="edJOIA"               value="' + Request.ContentFields.Values['edJOIA']                   + '"> ' + CR +
       '    <input type="hidden" name="edPRAZOJOIAFALTA"     value="' + Request.ContentFields.Values['edPRAZOJOIAFALTA']         + '"> ' + CR +
       '    <input type="hidden" name="edPRAZOJOIAPAGO"      value="' + Request.ContentFields.Values['edPRAZOJOIAPAGO']          + '"> ' + CR +
       '    <input type="hidden" name="edRPTRIBUTAVEL"       value="' + Request.ContentFields.Values['edRPTRIBUTAVEL']           + '"> ' + CR +
       '    <input type="hidden" name="edRPNAOTRIBUTAVEL"    value="' + Request.ContentFields.Values['edRPNAOTRIBUTAVEL']        + '"> ' + CR +
       '    <input type="hidden" name="edSRB"                value="' + Request.ContentFields.Values['edSRB']                    + '"> ' + CR +
       '    <input type="hidden" name="edFATORPREVIDENC"     value="' + Request.ContentFields.Values['edFATORPREVIDENC']         + '"> ' + CR +
       '    <input type="hidden" name="edTEMPOMINCONTRIB"    value="' + Request.ContentFields.Values['edTEMPOMINCONTRIB']        + '"> ' + CR +
       '    <input type="hidden" name="edDATAINICIOFUND"     value="' + Request.ContentFields.Values['edDATAINICIOFUND']         + '"> ' + CR +
       '    <input type="hidden" name="edVALORATUAL"         value="' + Request.ContentFields.Values['edVALORATUAL']             + '"> ' + CR +
       '    <input type="hidden" name="edVLRINFINSS"         value="' + Request.ContentFields.Values['edVLRINFINSS']             + '"> ' + CR +
       '    <input type="hidden" name="edIDBENEFICIO"        value="' + Request.ContentFields.Values['edIDBENEFICIO']            + '"> ' + CR +
       '    <input type="hidden" name="edVALORABONO"         value="' + Request.ContentFields.Values['edVALORABONO']             + '"> ' + CR +
       '    <input type="hidden" name="edDATAULTSIMULA"      value="' + Request.ContentFields.Values['edDATAULTSIMULA']          + '"> ' + CR +
       '    <input type="hidden" name="edOPCAO"              value="' + Request.ContentFields.Values['edOPCAO']                  + '"> ' + CR +
       '    <input type="hidden" name="edTAXAJOIA"           value="' + Request.ContentFields.Values['edTAXAJOIA']               + '"> ' + CR +
       '    <input type="hidden" name="edIDADEAPOS"          value="' + Request.ContentFields.Values['edIDADEAPOS']              + '"> ' + CR +
       '    <input type="hidden" name="edPROPORCAO"          value="' + Request.ContentFields.Values['edPROPORCAO']              + '"> ' + CR +
       '    <input type="hidden" name="edCOTAPENSAO"         value="' + Request.ContentFields.Values['edCOTAPENSAO']             + '"> ' + CR +
       '    <input type="hidden" name="edDATANASCVIT"        value="' + Request.ContentFields.Values['edDATANASCVIT']            + '"> ' + CR +
       '    <input type="hidden" name="edDATANASCTEMP"       value="' + Request.ContentFields.Values['edDATANASCTEMP']           + '"> ' + CR +
       '    <input type="hidden" name="edNUMDEPEN"           value="' + Request.ContentFields.Values['edNUMDEPEN']               + '"> ' + CR +
       '    <input type="hidden" name="edNUMDEPENVIT"        value="' + Request.ContentFields.Values['edNUMDEPENVIT']            + '"> ' + CR +
       '    <input type="hidden" name="edNUMDEPENTEMP"       value="' + Request.ContentFields.Values['edNUMDEPENTEMP']           + '"> ' + CR +
       '    <input type="hidden" name="edNOMESITUACAO"       value="' + Request.ContentFields.Values['edNOMESITUACAO']           + '"> ' + CR +
       '    <input type="hidden" name="edNOMEPARTICIP"       value="' + Request.ContentFields.Values['edNOMEPARTICIP']           + '"> ' + CR +
       '    <input type="hidden" name="edNOMEPATRO"          value="' + Request.ContentFields.Values['edNOMEPATRO']              + '"> ' + CR +
       '    <input type="hidden" name="edNOMEPLANO"          value="' + Request.ContentFields.Values['edNOMEPLANO']              + '"> ' + CR +
       '    <input type="hidden" name="edNOMEBENEFICIO"      value="' + Request.ContentFields.Values['edNOMEBENEFICIO']          + '"> ' + CR +
       '    <input type="hidden" name="edFLGBENEFTEMP"       value="' + Request.ContentFields.Values['edFLGBENEFTEMP']           + '"> ' + CR +
       '    <input type="hidden" name="edDATAREF"            value="' + Request.ContentFields.Values['edDATAREF']                + '"> ' + CR +
       '    <input type="hidden" name="edDATATRANSACAO"      value="' + Request.ContentFields.Values['edDATATRANSACAO']          + '"> ' + CR +
       '    <input type="hidden" name="edCAMPOOP1"           value="' + Request.ContentFields.Values['edCAMPOOP1']               + '"> ' + CR +
       '    <input type="hidden" name="edCAMPOOP2"           value="' + Request.ContentFields.Values['edCAMPOOP2']               + '"> ' + CR +
       '    <input type="hidden" name="edCAMPOOP3"           value="' + Request.ContentFields.Values['edCAMPOOP3']               + '"> ' + CR +
       '    <input type="hidden" name="edCAMPOOP4"           value="' + Request.ContentFields.Values['edCAMPOOP4']               + '"> ' + CR +
       '    <input type="hidden" name="edCAMPOOP5"           value="' + Request.ContentFields.Values['edCAMPOOP5']               + '"> ' + CR +
       '    <input type="hidden" name="edIDBENEFICIOAssist"  value="' + Request.ContentFields.Values['edIDBENEFICIOAssist']      + '"> ' + CR +
       '    <input type="hidden" name="edDATAINICIOFUNDAssist" value="'+Request.ContentFields.Values['edDATAINICIOFUNDAssist']   + '"> ' + CR +
       '    <input type="hidden" name="edVALORSRBAssist"     value="' + Request.ContentFields.Values['edVALORSRBAssist']         + '"> ' + CR +
       '    <input type="hidden" name="edVLRCALCINSSAssist"  value="' + Request.ContentFields.Values['edVLRCALCINSSAssist']      + '"> ' + CR +
       '    <input type="hidden" name="edVLRINFINSSAssist"   value="' + Request.ContentFields.Values['edVLRINFINSSAssist']       + '"> ' + CR +
       '    <input type="hidden" name="edVALORATUALAssist"   value="' + Request.ContentFields.Values['edVALORATUALAssist']       + '"> ' + CR +
       '    <#hiddenfields>                                                                                                            ' + CR +
       '  </form>                                                                                                                      ' + CR +
       '</p>                                                                                                                           ' + CR ;

      if not cds.IsEmpty then
        Result := Result +
         '<p class="LINK" align="center">                                                 ' + CR +
         '  <a href="javascript:window.location.reload();">                               ' + CR +
         '    Restaurar dados calculados                                                  ' + CR +
         '  </a>                                                                          ' + CR +
         '</p>                                                                            ' + CR +
         '<script language="JavaScript">                                                  ' + CR +
         '  document.frmLnkEstimaTransfPlano.' + sFieldNames[0] + '.focus();              ' + CR +
         '</script>                                                                       ' + CR ;

      cds.Close;

      //Valida e confirma o preenchimento dos campos
      sJavaScript :=
       ' function ConfirmaDados( )                                                 ' + CR +
       ' {                                                                         ' + CR ;

      sJavaScript := sJavaScript +
       '   EnviaForm( document.frmLnkEstimaTransfPlano );                          ' + CR +
       ' }                                                                         ' + CR ;

      Result := MontaPagina( pTpDadosEstimativas, Result );

    except
      On E : Exception do
      begin
        Result := TrataWebExcecoes( E );
      end;
    end;

  finally
    Lista.Free;
  end;

end; {PaginaCamposEstimaTransfPlano}

end.

