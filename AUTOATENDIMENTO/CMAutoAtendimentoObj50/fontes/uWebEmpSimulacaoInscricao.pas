unit uWebEmpSimulacaoInscricao;

interface

uses SysUtils, DModAutoAtendimento, uConstPaginasCampos, uFuncoesEmprestimo,
     JCLStrings, uCMClientDataSet, httpapp, JCLSysUtils, DB, uMidasUtil,
     uSistema, uTypesEmptmoAA, Classes, uCtrlFuncoesAA, uCmFileUtils;


//Monta a página de Seleção de Tipo de Contrato
function PaginaEmpSelTpContrato( iIdPessoaLocal : integer ) : String;


//Monta a página de Parâmetros de Simulação    -- CRIADA ctrlEmpSimulacaoInscricao.ParamSimulacao
function PaginaEmpParamSimulacao( iIdPessoaLocal : integer; Request: TWebRequest ) : String;


//Monta a página de Simulação de Empréstimos
function PaginaEmpSimulacao( iIdPessoaLocal : integer; Request: TWebRequest ) : String;


//Monta a página de Inscrição de Empréstimos
function PaginaEmpParamEmptmo( iIdPessoaLocal : integer; Request: TWebRequest ) : String;


//Salva a inscrição em empréstimo
function PaginaEmpSalvaEmptmo( iIdPessoaLocal : integer; iTipoGravacao : integer; Request: TWebRequest ) : String;


//Verifica se é ol último dia do mês
function EhUltimoDiaUtilMes( dDataVerificacao: TDateTime; iCidade, iPais : integer; sEstado : string ) : Boolean;


//Indica se o participante excedeu o limite de inscrições.
function ExcedeuLimiteInscricoes( iIdPessoaLocal, iIdTipoEmptmo : integer ) : boolean;


//Indica se o participante excedeu o limite de contratos.
function ExcedeuLimiteContratos( iIdPessoaLocal, iIdTipoEmptmo : integer ) : boolean;


//Quantidade máxima e mínima de parcelas
procedure SetNumParcelas( iIdTitular, iIdBenef,
                          iIdTipoContrEmptmo, iIdTipoEmptmo, iIDREGRAPRAZOMAX,
                          iIDREGRAPRAZOSCONC : integer;
                          dDataInsc : TDateTime; bFlgExcepcional : boolean;
                          var iMinParcelas : integer; var iMaxParcelas : integer );


//Exibe os dados de uma determinada inscrição
function DadosInscricao( iIdInscricaoEmptmo : extended; iIdPessoaLocal, iIdTitularLocal : integer ) : String;

//Exibe os dados de um determinado contrato e da sua inscrição
function DadosContrato( iIdContratoEmptmo, iIdInscricaoEmptmo : extended; iIdPessoaLocal, iIdTitularLocal : integer ) : String;

//Função que busca o prazo máximo do tipo de contrato.
function BuscaPrazoContrato( sRuleName        : String;
                             iTipoContrEmptmo : Integer;
                             iIdTitular,
                             iIdBeneficiario,
                             iNumParcela : integer;
                             dDataInsc        : TDateTime;
                             bFlgExcepcional : boolean ): Integer;


//Retorna um array contendo as parcelas que podem ser simuladas
function ParcelasSimulaveis( iIdTitular, iIdBenef, iIdEmpresa, iIDREGRAPRAZOSCONC, iMinParcelas,
                             iMaxParcelas : integer; bFlgExcepcional : boolean ) : string;

implementation

//Monta a página de Seleção de Tipo de Contrato
function PaginaEmpSelTpContrato( iIdPessoaLocal : integer ) : String;
var
  //Dados do solicitante
  iIDTITULAR,
  iIDBENEF,
  iIDINSCRICAOPREV,
  iIDSITPART,
  iIDPESSJUR,
  iIDPLANOPREV : integer;
  sMATRICULA,
  sFLGINTERNO,
  sCPF,
  sCPF_TIT,
  sMATRICULA_TIT : String;

  //Parâmetros de empréstimo
  sFLGFORMAPAG,
  sFLGFORMAREC,
  sCODESTADO,
  sHORAENCERRA : String;
  iFLGTRATAASSINAT,
  iFLGPENDCONCESSAO,
  iFLGCALCDIA,
  iFLGCONTROLAINSC, 
  iFLGRENPRESTAB,
  iFLGCONCULTDIAMES,
  iFLGDATAATUSLD,
  iFLGOBRIGAAVALISTA,
  iFLGSALDODEVANT,
  iFLGUSAFIARIO,
  iFLGESTORNOPOSQUIT,
  iFLGQUITAPARCMORTE,
  iIDREGRAAVAL,
  iIDITEMDEVSEGQUIT,
  iIDITEMPROVPERDA,
  iIDPAIS,
  iIDCIDADES,
  iIDESTADO,
  iIDITEMSEGCONC,
  iIDITEMSEGCOMPL,
  iFLGABONODIVERG : integer;
  bFLGEXCEPCIONAL : boolean;

  iIDREGRATIPOCONTR : integer; //Pendência 23733 - 19/12/2006
  iIDREGRAPLANOCOB : integer; //Pendência 26775 - 26/12/2007

begin
  try

    sTitulo := TituloPagina( pEmpSelecaoTpContrato );

    //Recupera parâmetros de empréstimos
    cds.Close;
    cds.Data           := WebEmprestimo.ParametrosEmprestimo( iIdEmpresaProp );
    sFLGFORMAPAG       := trim( cds.FieldByName('FLGFORMAPAG').AsString );
    sFLGFORMAREC       := trim( cds.FieldByName('FLGFORMAREC').AsString );
    sCODESTADO         := trim( cds.FieldByName('CODESTADO').AsString );
    sHORAENCERRA       := trim( cds.FieldByName('HORAENCERRA').AsString );
    iFLGTRATAASSINAT   := StrToIntDef( trim( cds.FieldByName('FLGTRATAASSINAT').AsString ), 0 );
    iFLGPENDCONCESSAO  := StrToIntDef( trim( cds.FieldByName('FLGPENDCONCESSAO').AsString ), 0 );
    iFLGCALCDIA        := StrToIntDef( trim( cds.FieldByName('FLGCALCDIA').AsString ), 0 );
    iFLGCONTROLAINSC   := StrToIntDef( trim( cds.FieldByName('FLGCONTROLAINSC').AsString ), 0 );
    iFLGRENPRESTAB     := StrToIntDef( trim( cds.FieldByName('FLGRENPRESTAB').AsString ), 0 );
    iFLGCONCULTDIAMES  := StrToIntDef( trim( cds.FieldByName('FLGCONCULTDIAMES').AsString ), 0 );
    iFLGDATAATUSLD     := StrToIntDef( trim( cds.FieldByName('FLGDATAATUSLD').AsString ), 0 );
    iFLGOBRIGAAVALISTA := StrToIntDef( trim( cds.FieldByName('FLGOBRIGAAVALISTA').AsString ), 0 );
    iFLGSALDODEVANT    := StrToIntDef( trim( cds.FieldByName('FLGSALDODEVANT').AsString ), 0 );
    iFLGUSAFIARIO      := StrToIntDef( trim( cds.FieldByName('FLGUSAFIARIO').AsString ), 0 );
    iFLGESTORNOPOSQUIT := StrToIntDef( trim( cds.FieldByName('FLGESTORNOPOSQUIT').AsString ), 0 );
    iFLGQUITAPARCMORTE := StrToIntDef( trim( cds.FieldByName('FLGQUITAPARCMORTE').AsString ), 0 );
    iIDREGRAAVAL       := StrToIntDef( trim( cds.FieldByName('IDREGRAAVAL').AsString ), 0 );
    iIDITEMDEVSEGQUIT  := StrToIntDef( trim( cds.FieldByName('IDITEMDEVSEGQUIT').AsString ), 0 );
    iIDITEMPROVPERDA   := StrToIntDef( trim( cds.FieldByName('IDITEMPROVPERDA').AsString ), 0 );
    iIDPAIS            := StrToIntDef( trim( cds.FieldByName('IDPAIS').AsString ), 0 );
    iIDCIDADES         := StrToIntDef( trim( cds.FieldByName('IDCIDADES').AsString ), 0 );
    iIDESTADO          := StrToIntDef( trim( cds.FieldByName('IDESTADO').AsString ), 0 );
    iIDITEMSEGCONC     := StrToIntDef( trim( cds.FieldByName('IDITEMSEGCONC').AsString ), 0 );
    iIDITEMSEGCOMPL    := StrToIntDef( trim( cds.FieldByName('IDITEMSEGCOMPL').AsString ), 0 );
    iFLGABONODIVERG    := StrToIntDef( trim( cds.FieldByName('FLGABONODIVERG').AsString ), 0 );
    bFLGEXCEPCIONAL    := ( cds.FieldByName('FLGEXCEPCIONAL').AsInteger = 1 );

    //Pendência 23733 - 19/12/2006
    iIDREGRATIPOCONTR := StrToIntDef( trim( cds.FieldByName('IDREGRATIPOCONTR').AsString ), 0 );
    //Fim Pendência 23733

    //Pendência 26775 - 26/12/2007
    iIDREGRAPLANOCOB   := StrToIntDef( trim( cds.FieldByName('IDREGRAPLANOCOB').AsString ), 0 );
    //Fim Pendência 26775

    cds.Close;

    //Recupera dados do participante necessários ao empréstimo
    cds.Close;
    cds.Data         := WebEmprestimo.DadosSolic( iIdPessoaLocal, bFLGEXCEPCIONAL );
    iIDTITULAR       := cds.FieldByName('IDTITULAR').AsInteger;
    iIDBENEF         := cds.FieldByName('IDPESSOA').AsInteger;
    iIDINSCRICAOPREV := cds.FieldByName('INSCRICAONUMERO').AsInteger;
    if cds.FindField('IDSITPART') <> nil then
      iIDSITPART       := cds.FieldByName('IDSITPART').AsInteger
    else
      iIDSITPART       := 0; 
    iIDPESSJUR       := cds.FieldByName('IDPESSJUR').AsInteger;
    iIDPLANOPREV     := cds.FieldByName('IDPLANOPREV').AsInteger;
    sMATRICULA       := trim( cds.FieldByName('MATRICULA').AsString );
    sFLGINTERNO      := trim( cds.FieldByName('FLGINTERNO').AsString );
    sCPF             := trim( cds.FieldByName('CPF').AsString );
    sCPF_TIT         := trim( cds.FieldByName('CPF_TIT').AsString );
    sMATRICULA_TIT   := trim( cds.FieldByName('MATRICULA_TIT').AsString );

    sJavaScript :=
       ' function Confirma( )                                                            ' + CR +
       ' {                                                                               ' + CR +
       '   document.frmLnkEmpDadosSimulacao.empIDTIPOCONTREMPTMO.value = '                      +
          ' document.frmLnkEmpDadosSimulacao.cmbIDTIPOCONTREMPTMO.value;                 ' + CR +
       '   document.frmLnkEmpDadosSimulacao.cmbIDTIPOCONTREMPTMO.disabled = true;        ' + CR +
       '   eval("document.frmLnkEmpDadosSimulacao.btnConfirmar.style.display=''none''"); ' + CR +
       '   EnviaForm( document.frmLnkEmpDadosSimulacao );                                ' + CR +
       ' }                                                                               ' + CR ;

    cds.Close;
    cds.Data := WebEmprestimo.ListaTpContrato(
     Iff( bFLGEXCEPCIONAL, iIDPLANOPREV, 0 ), iIdEmpresaProp );

    if cds.IsEmpty then
      Result := Result + '<p class="CORPO" align="center">No momento não é possível inscrever-se em contratos pela Internet.</p><br>'
    else
    begin

      Result := Result +
       '<form method="POST" name="frmLnkEmpDadosSimulacao"                             ' + CR +
       '   action="../<#nomearqapl>/EmpDadosSimulacao">                                ' + CR +
       '  <center>                                                                      ' + CR +
       '    <table border="0" cellpadding="0" cellspacing="0" class="FORMULARIO">       ' + CR +
       '      <tr>                                                                      ' + CR +
       '        <td class="DESCCAMPO">                                                  ' + CR +
       '          Selecione o tipo de contrato: &nbsp; <BR>                             ' + CR +
       '          <select size="1" name="cmbIDTIPOCONTREMPTMO" class="TEXT">            ' + CR ;

      while not cds.Eof do
      begin
        Result := Result + ' <option value="' + cds.FieldByName('IDTIPOCONTREMPTMO').AsString + '" '+
         '>' + trim( cds.FieldByName('TCEDESCRICAO').AsString ) + '</option>' + CR;
        cds.Next;
      end;

      Result := Result +
       '                </select>                                                                              ' + CR +
       '        </td>                                                                                          ' + CR +
       '        <td width="15px" valign="bottom">                                                              ' + CR +
       '          <a href="JavaScript:Confirma();">                                                            ' + CR +
       '            <img src="../imagem/ok.gif" name="btnConfirmar" border="0"></a>                            ' + CR +
       '        </td>                                                                                          ' + CR +
       '      </tr>                                                                                            ' + CR +
       '    </table>                                                                                           ' + CR +
       '    <input type="hidden" name="empIDTIPOCONTREMPTMO">                                                  ' + CR +
       '    <#hiddenfields>                                                                                    ' + CR +
       '    <input type="hidden" name="empIDTITULAR"         value="' + IntToStr( iIDTITULAR )           + '"> ' + CR +
       '    <input type="hidden" name="empIDBENEF"           value="' + IntToStr( iIDBENEF )             + '"> ' + CR +
       '    <input type="hidden" name="empIDINSCRICAOPREV"   value="' + IntToStr( iIDINSCRICAOPREV )     + '"> ' + CR +
       '    <input type="hidden" name="empIDSITPART"         value="' + IntToStr( iIDSITPART )           + '"> ' + CR +
       '    <input type="hidden" name="empIDPESSJUR"         value="' + IntToStr( iIDPESSJUR )           + '"> ' + CR +
       '    <input type="hidden" name="empIDPLANOPREV"       value="' + IntToStr( iIDPLANOPREV )         + '"> ' + CR +
       '    <input type="hidden" name="empMATRICULA"         value="' + sMATRICULA                       + '"> ' + CR +
       '    <input type="hidden" name="empFLGINTERNO"        value="' + sFLGINTERNO                      + '"> ' + CR +
       '    <input type="hidden" name="empCPF"               value="' + sCPF                             + '"> ' + CR +
       '    <input type="hidden" name="empCPF_TIT"           value="' + sCPF_TIT                         + '"> ' + CR +
       '    <input type="hidden" name="empMATRICULA_TIT"     value="' + sMATRICULA_TIT                   + '"> ' + CR +
       '    <input type="hidden" name="empFLGFORMAPAG"       value="' + sFLGFORMAPAG                     + '"> ' + CR +
       '    <input type="hidden" name="empFLGFORMAREC"       value="' + sFLGFORMAREC                     + '"> ' + CR +
       '    <input type="hidden" name="empCODESTADO"         value="' + sCODESTADO                       + '"> ' + CR +
       '    <input type="hidden" name="empHORAENCERRA"       value="' + sHORAENCERRA                     + '"> ' + CR +
       '    <input type="hidden" name="empFLGTRATAASSINAT"   value="' + IntToStr( iFLGTRATAASSINAT )     + '"> ' + CR +
       '    <input type="hidden" name="empFLGPENDCONCESSAO"  value="' + IntToStr( iFLGPENDCONCESSAO )    + '"> ' + CR +
       '    <input type="hidden" name="empFLGCALCDIA"        value="' + IntToStr( iFLGCALCDIA )          + '"> ' + CR +
       '    <input type="hidden" name="empFLGCONTROLAINSC"   value="' + IntToStr( iFLGCONTROLAINSC )     + '"> ' + CR +
       '    <input type="hidden" name="empFLGRENPRESTAB"     value="' + IntToStr( iFLGRENPRESTAB )       + '"> ' + CR +
       '    <input type="hidden" name="empFLGCONCULTDIAMES"  value="' + IntToStr( iFLGCONCULTDIAMES )    + '"> ' + CR +
       '    <input type="hidden" name="empFLGDATAATUSLD"     value="' + IntToStr( iFLGDATAATUSLD )       + '"> ' + CR +
       '    <input type="hidden" name="empFLGOBRIGAAVALISTA" value="' + IntToStr( iFLGOBRIGAAVALISTA )   + '"> ' + CR +
       '    <input type="hidden" name="empFLGSALDODEVANT"    value="' + IntToStr( iFLGSALDODEVANT )      + '"> ' + CR +
       '    <input type="hidden" name="empFLGUSAFIARIO"      value="' + IntToStr( iFLGUSAFIARIO )        + '"> ' + CR +
       '    <input type="hidden" name="empFLGESTORNOPOSQUIT" value="' + IntToStr( iFLGESTORNOPOSQUIT )   + '"> ' + CR +
       '    <input type="hidden" name="empFLGQUITAPARCMORTE" value="' + IntToStr( iFLGQUITAPARCMORTE )   + '"> ' + CR +
       '    <input type="hidden" name="empIDREGRAAVAL"       value="' + IntToStr( iIDREGRAAVAL )         + '"> ' + CR +
       '    <input type="hidden" name="empIDITEMDEVSEGQUIT"  value="' + IntToStr( iIDITEMDEVSEGQUIT )    + '"> ' + CR +
       '    <input type="hidden" name="empIDITEMPROVPERDA"   value="' + IntToStr( iIDITEMPROVPERDA )     + '"> ' + CR +
       '    <input type="hidden" name="empIDPAIS"            value="' + IntToStr( iIDPAIS )              + '"> ' + CR +
       '    <input type="hidden" name="empIDCIDADES"         value="' + IntToStr( iIDCIDADES )           + '"> ' + CR +
       '    <input type="hidden" name="empIDESTADO"          value="' + IntToStr( iIDESTADO )            + '"> ' + CR +
       '    <input type="hidden" name="empIDITEMSEGCONC"     value="' + IntToStr( iIDITEMSEGCONC )       + '"> ' + CR +
       '    <input type="hidden" name="empIDITEMSEGCOMPL"    value="' + IntToStr( iIDITEMSEGCOMPL )      + '"> ' + CR +
       '    <input type="hidden" name="empFLGABONODIVERG"    value="' + IntToStr( iFLGABONODIVERG )      + '"> ' + CR +
       '    <input type="hidden" name="empFLGEXCEPCIONAL"    value="' + Iff( bFLGEXCEPCIONAL, '1', '0' ) + '"> ' + CR +

       //Pendência 23733 - 19/12/2006
       '    <input type="hidden" name="empIDREGRATIPOCONTR"  value="' + IntToStr( iIDREGRATIPOCONTR )    + '"> ' + CR +
       //Fim Pendência 23733

       //Pendência 26775 - 26/12/2007
       '    <input type="hidden" name="empIDREGRAPLANOCOB"   value="' + IntToStr( iIDREGRAPLANOCOB )     + '"> ' + CR +
       //Fim Pendência 26775

       '  </center>                                                                                            ' + CR +
       '</form>                                                                                                ' + CR +
       '<BR>                                                                                                   ' + CR ;

    end;

    cds.Close;

    Result := MontaPagina( pEmpSelecaoTpContrato, Result );

  except
    On E : Exception do
    begin
      Result := TrataWebExcecoes( E );
    end;
  end;
end; {PaginaEmpSelTpContrat}


//Monta a página de Parâmetros de Simulação
function PaginaEmpParamSimulacao( iIdPessoaLocal : integer; Request: TWebRequest ) : String;
var

  //ClientDataSets locais
  cdsContratosAnteriores,
  cdsContratosAnteriores2,
  cdsOutrasDividas : TCMClientDataSet;

  //Dados do empréstimo
  dDtCredito,
  dDt1aParcela : TDatetime;
  iCarencia    : integer;
  iTotSiafi    : integer;
  fAux         : Currency;
  i, j,
  iIdTpContEmptmoAux : integer;
  dAux,
  dDataAtualiza : TDateTime;
  bContratosMarcados : boolean;
  sJoinPlano, sQuitavel, sMes, sAno : string;

  //Hora do servidor
  dAgora : TDateTime;

  //Dados de dívidas anteriores
  iNUMPARCPAGAS : integer;

  //Quantidade mínima e máxima de parcelas
  iMinParcelas,
  iMaxParcelas : integer;

  //Dados do solicitante
  iIDTITULAR,
  iIDBENEF,
  iIDINSCRICAOPREV,
  iIDSITPART,
  iIDPESSJUR,
  iIDPLANOPREV : integer;
  sMATRICULA,
  sFLGINTERNO,
  sCPF,
  sCPF_TIT,
  sMATRICULA_TIT : String;

  //DadosTpContrato
  iIDTIPOCONTREMPTMO,
  iIDTIPOEMPTMO,
  iIDREGRAELEG,
  iTCEMINRENOVA,
  iTEPMAXCONTRATO,
  iIDREGRADATACRED,
  iIDREGRAPRIMPARC,
  iIDREGRASALBAS,
  iIDREGRAMARGEM,
  iIDREGRARESERVA,
  iIDREGRAJURCONC,
  iIDREGRAJUREXIBE,
  iIDREGRAPRAZOSCONC,
  iIDREGRAPRAZOMAX,
  iIDREGRALIMITES,
  iTCEMAXINSCR,
  iTCEMAXCONTRATO,
  iTCENUMPARCSIM,
  iNUMPARCDESCONTO,
  iFLGOBRIGBENEF,
  //Pendência 27232 e 27749 - 17/04/2008
  iFLGVERIFICACONTRATO,
  iFLGVERIFICAITEMABERTO,
  iFLGNAOVERIFICAMRGPCL : integer;
  //Fim Pendência 27232 e 27749
  sTCEDESCRICAO,
  sDESCTIPOEMPTMO,
  sMOESIGLA,
  sMOECODIGO : string;

  //Saldo a quitar
  fQuitacao,
  fSaldoaQuitar : Currency;

  //Taxa de Juros
  fTxJuros,
  fTxJurosExibe : Currency;

  //Totais
  fTotalParcelas,
  fTotalPendencias : Currency;

  //Salário
  fSalParticipacao,
  fSalMantido,
  fSalAuxDoenca,
  fSalBenef,
  fVlrSalBase,
  fVlrMargem,
  fVlrMaxPermit : Currency;

  //Dados de seguro
  fVlrDevSeg,
  fVlrSeguroAnt,
  fVlrSeguroComplAnt : Currency;

  //Reserva de Poupança
  fValReserva : Currency;

  //Data final de benefício
  dDataFinalBeneficio : TDateTime;

  dData : TDateTime;
  rSaldo : TSaldoDevAnt;

  //Dados de empréstimos anteriores
  iAntIdContratoEmptmo,
  iAntIdTipoContrEmptmo : integer;
  fAntValorSolic       : Currency;
  dAntDataCredito      : TDateTime;
  iAntPrazo            ,
  iAntUltParcGerada    ,
  iAntNumParcPagas     : integer;

  //Saldo de Quitacao
  fSaldoQuitacao : Currency;

  //Arquivo de dados contratos anteriores
  sArqContratosAnteriores : string;

  //Parcelas simuláveis
  sParcelas,
  sParcelas2 : string;
  aParcelas : array of string;

  //Parâmetros de empréstimo
  sFLGFORMAPAG,
  sFLGFORMAREC,
  sCODESTADO,
  sHORAENCERRA : String;
  iFLGTRATAASSINAT,
  iFLGPENDCONCESSAO,
  iFLGCALCDIA,
  iFLGSALDODEVANT,
  iFLGRENPRESTAB,
  iIDITEMDEVSEGQUIT,
  iIDITEMPROVPERDA,
  iIDPAIS,
  iIDCIDADES,
  iIDESTADO,
  iIDITEMSEGCONC,
  iIDITEMSEGCOMPL,
  iFLGABONODIVERG : integer;
  bFLGEXCEPCIONAL : boolean;
  iQtdEPQuitado : integer;
  bContratoValido : boolean;

  //Pendência 23733 - 19/12/2006
  iIDREGRATIPOCONTR : integer;
  sMsgTipoContrato  : String;
  //Fim Pendência 23733

  iQtdeItensEmptmo,
  iQtdeParcelasEmAberto : integer;
  iIdUltHistMovEmptmo   : extended;

  sMsgRestritiva,
  sTituloCampo,
  sMensagens,
  sMsgValidaContrato,
  sMsgMargemConsignavel,
  sMsgPossuiAssinatura : string;

begin


  Result := '';

  sMensagens            := '';
  sMsgRestritiva        := '';
  sMsgValidaContrato    := '';
  sMsgMargemConsignavel := '';
  sMsgPossuiAssinatura  := '';

  //Limpa variáveis
  fSalParticipacao := 0;
  fSalMantido      := 0;
  fSalAuxDoenca    := 0;
  fSalBenef        := 0;
  fVlrSalBase      := 0;
  fVlrMargem       := 0;
  fValReserva      := 0;
  fTxJuros         := 0;
  fTotalParcelas   := 0;
  fTotalPendencias := 0;
  fQuitacao        := 0;
  fSaldoAQuitar    := 0;

  cdsContratosAnteriores  := TCMClientDataSet.Create( nil );
  cdsContratosAnteriores2 := TCMClientDataSet.Create( nil );
  cdsOutrasDividas        := TCMClientDataSet.Create( nil );
  try

    try

      sTitulo := TituloPagina( pEmpParamSimulacao );

      //Recupera parâmetros do empréstimo
      sFLGFORMAPAG      := Request.ContentFields.Values['empFLGFORMAPAG'];
      sFLGFORMAREC      := Request.ContentFields.Values['empFLGFORMAREC'];
      sCODESTADO        := Request.ContentFields.Values['empCODESTADO'];
      sHORAENCERRA      := Request.ContentFields.Values['empHORAENCERRA'];
      iFLGTRATAASSINAT  := StrToIntDef( Request.ContentFields.Values['empFLGTRATAASSINAT'], 0);
      iFLGPENDCONCESSAO := StrToIntDef( Request.ContentFields.Values['empFLGPENDCONCESSAO'], 0);
      iFLGCALCDIA       := StrToIntDef( Request.ContentFields.Values['empFLGCALCDIA'], 0);
      iFLGSALDODEVANT   := StrToIntDef( Request.ContentFields.Values['empFLGSALDODEVANT'], 0);
      iFLGRENPRESTAB    := StrToIntDef( Request.ContentFields.Values['empFLGRENPRESTAB'], 0);
      iIDITEMDEVSEGQUIT := StrToIntDef( Request.ContentFields.Values['empIDITEMDEVSEGQUIT'], 0);
      iIDITEMPROVPERDA  := StrToIntDef( Request.ContentFields.Values['empIDITEMPROVPERDA'], 0);
      iIDPAIS           := StrToIntDef( Request.ContentFields.Values['empIDPAIS'], 0);
      iIDCIDADES        := StrToIntDef( Request.ContentFields.Values['empIDCIDADES'], 0);
      iIDESTADO         := StrToIntDef( Request.ContentFields.Values['empIDESTADO'], 0);
      iIDITEMSEGCONC    := StrToIntDef( Request.ContentFields.Values['empIDITEMSEGCONC'], 0);
      iIDITEMSEGCOMPL   := StrToIntDef( Request.ContentFields.Values['empIDITEMSEGCOMPL'], 0);
      iFLGABONODIVERG   := StrToIntDef( Request.ContentFields.Values['empFLGABONODIVERG'], 0);
      bFLGEXCEPCIONAL   := ( StrToIntDef( Request.ContentFields.Values['empFLGEXCEPCIONAL'], 0) = 1 );

      //Pendência 23733 - 19/12/2006
      iIDREGRATIPOCONTR := StrToIntDef( Request.ContentFields.Values['empIDREGRATIPOCONTR'], 0);
      //Fim Pendência 23733

      //Recupera dados do participante
      iIDTITULAR        := StrToIntDef( Request.ContentFields.Values['empIDTITULAR'], 0);
      iIDBENEF          := StrToIntDef( Request.ContentFields.Values['empIDBENEF'], 0);
      iIDINSCRICAOPREV  := StrToIntDef( Request.ContentFields.Values['empIDINSCRICAOPREV'], 0);
      iIDSITPART        := StrToIntDef( Request.ContentFields.Values['empIDSITPART'], 0);
      iIDPESSJUR        := StrToIntDef( Request.ContentFields.Values['empIDPESSJUR'], 0);
      iIDPLANOPREV      := StrToIntDef( Request.ContentFields.Values['empIDPLANOPREV'], 0);
      sMATRICULA        := Request.ContentFields.Values['empMATRICULA'];
      sFLGINTERNO       := Request.ContentFields.Values['empFLGINTERNO'];
      sCPF              := Request.ContentFields.Values['empCPF'];
      sCPF_TIT          := Request.ContentFields.Values['empCPF_TIT'];
      sMATRICULA_TIT    := Request.ContentFields.Values['empMATRICULA_TIT'];


      //Data e hora do servidor
      dAgora := WebEmprestimo.HoraServidor;

      //Recupera dados do tipo de contrato
      iIDTIPOCONTREMPTMO := StrToIntDef( Request.ContentFields.Values['empIDTIPOCONTREMPTMO'], 0);
      cds.Close;
      cds.Data           := WebEmprestimo.DadosTpContrato( iIDTIPOCONTREMPTMO );
      iIDTIPOEMPTMO      := cds.FieldByName('IDTIPOEMPTMO').AsInteger;
      iIDREGRAELEG       := cds.FieldByName('IDREGRAELEG').AsInteger;
      iIDREGRADATACRED   := cds.FieldByName('IDREGRADATACRED').AsInteger;
      iIDREGRAPRIMPARC   := cds.FieldByName('IDREGRAPRIMPARC').AsInteger;
      sTCEDESCRICAO      := cds.FieldByName('TCEDESCRICAO').AsString;
      sDESCTIPOEMPTMO    := cds.FieldByName('DESCTIPOEMPTMO').AsString;
      iTCEMINRENOVA      := cds.FieldByName('TCEMINRENOVA').AsInteger;
      iTEPMAXCONTRATO    := cds.FieldByName('TEPMAXCONTRATO').AsInteger;
      iIDREGRASALBAS     := cds.FieldByName('IDREGRASALBAS').AsInteger;
      iIDREGRAMARGEM     := cds.FieldByName('IDREGRAMARGEM').AsInteger;
      iIDREGRARESERVA    := cds.FieldByName('IDREGRARESERVA').AsInteger;
      iIDREGRAJURCONC    := cds.FieldByName('IDREGRAJURCONC').AsInteger;
      iIDREGRAJUREXIBE   := cds.FieldByName('IDREGRAJUREXIBE').AsInteger;
      iIDREGRAPRAZOSCONC := cds.FieldByName('IDREGRAPRAZOSCONC').AsInteger;
      iIDREGRAPRAZOMAX   := cds.FieldByName('IDREGRAPRAZOMAX').AsInteger;
      iIDREGRALIMITES    := cds.FieldByName('IDREGRALIMITES').AsInteger;
      sMOESIGLA          := cds.FieldByName('MOESIGLA').AsString;
      sMOECODIGO         := cds.FieldByName('MOECODIGO').AsString;
      iTCEMAXINSCR       := cds.FieldByName('TCEMAXINSCR').AsInteger;
      iTCEMAXCONTRATO    := cds.FieldByName('TCEMAXCONTRATO').AsInteger;
      iTCENUMPARCSIM     := cds.FieldByName('TCENUMPARCSIM').AsInteger;
      iNUMPARCDESCONTO   := cds.FieldByName('NUMPARCDESCONTO').AsInteger;
      iFLGOBRIGBENEF     := cds.FieldByName('FLGOBRIGBENEF').AsInteger;
      iFLGVERIFICACONTRATO := cds.FieldByName('FLGVERIFICACONTRATO').AsInteger;
      //Pendência 27232 e 27749 - 17/04/2008
      iFLGVERIFICAITEMABERTO := cds.FieldByName('FLGVERIFICAITEMABERTO').AsInteger;
      iFLGNAOVERIFICAMRGPCL  := cds.FieldByName('FLGNAOVERIFICAMRGPCL').AsInteger;
      //Fim Pendência 27232 e 27749

      cds.Close;

      //Recupera dados gerais de empréstimos para validação
      iQtdeItensEmptmo      := WebEmprestimo.QtdeItensEmptmo( iIDTITULAR, iIDBENEF );
      iQtdeParcelasEmAberto := WebEmprestimo.QtdeParcelasEmAberto( iIDTITULAR, iIDBENEF, Now );
      iIdUltHistMovEmptmo   := WebEmprestimo.UltIDHISTMOVEMPTMO;

      //Saldo de Quitação
      fSaldoQuitacao := 0;
      cds.Data := WebEmprestimo.SaldoQuitacao( 0, 18 );
      if not( cds.IsEmpty ) then fSaldoQuitacao := cds.FieldByName('HMEVLRPREVISTO').AsCurrency;
      cds.Close;
      cds.Data := WebEmprestimo.SaldoQuitacao( 0, 45 );
      if not( cds.IsEmpty ) then fSaldoQuitacao := fSaldoQuitacao + cds.FieldByName('HMEVLRPREVISTO').AsCurrency;
      cds.Close;

      //Calcula a data de crédito...
      if iIDREGRADATACRED > 0 then
      begin

        //... utilizando regra.
        dDtCredito := WebEmprestimo.RegraDataCredito( IntToStr( iIDREGRADATACRED ),
                                                      'C',
                                                      sFLGINTERNO,
                                                      sFLGFORMAPAG,
                                                      sHORAENCERRA,
                                                      False,
                                                      iIDPESSJUR,
                                                      iIDPLANOPREV,
                                                      iIDPAIS,
                                                      iIDCIDADES,
                                                      sCODESTADO,
                                                      dAgora,
                                                      iIdEmpresaProp );

      end
      else
      begin

        //... utilizando rotina interna de cálculo.
        sMes := FormatDateTime( 'MM',   dAgora );
        sAno := FormatDateTime( 'YYYY', dAgora );
        dDtCredito := CalcData( iIDPESSJUR, iIDPLANOPREV, sFLGINTERNO,
                                'C', sMes, sAno, sFLGFORMAPAG,
                                FormatDateTime('DD/MM/YYYY', dAgora ), 0, sFLGINTERNO );

      end;

      dDt1aParcela := 0;

      //Calcula data da 1a. parcela
      if iIDREGRAPRIMPARC > 0 then
      begin

        //... utilizando regra.
        dDt1aParcela := WebEmprestimo.RegraData1aParc( IntToStr( iIDREGRAPRIMPARC ),
                                                       iIDTIPOCONTREMPTMO,
                                                       dDtCredito,
                                                       iIdEmpresaProp );
      end;

      if dDt1aParcela = 0 then
      begin

        //... utilizando rotina interna de cálculo.
        sMes := FormatDateTime( 'MM',   dDtCredito );
        sAno := FormatDateTime( 'YYYY', dDtCredito );
        dDt1aParcela := CalcData( iIDPESSJUR, iIDPLANOPREV, sFLGINTERNO,
                                  'N', sMes, sAno, sFLGFORMAREC,
                                  FormatDateTime('DD/MM/YYYY', dDtCredito ), 0, sFlgInterno );
      end;


      //Cálculo da carência
      iCarencia := trunc( dDt1aParcela - dDtCredito );


      //Recupera dados de empréstimos anteriores
      if iFLGPENDCONCESSAO = 0 then
        dAux := dDtCredito
      else
        dAux := DiasUteis.UltDiaMes( DiasUteis.ExtraiAno( dDtCredito ), DiasUteis.ExtraiMes( dDtCredito ) );

      sJoinPlano         := '';
      sQuitavel          := '';
      iIdTpContEmptmoAux := 0;
      if bFLGEXCEPCIONAL then
      begin
        sJoinPlano         := '1';
        sQuitavel          := '1';
        iIdTpContEmptmoAux := iIDTIPOCONTREMPTMO;
      end;

      dDataAtualiza := dDtCredito;

      if not bFLGEXCEPCIONAL then
      begin
         dDataAtualiza := DiasUteis.UltDiaMes(DiasUteis.ExtraiAno( dDtCredito ), DiasUteis.ExtraiMes( dDtCredito ) );
      end;

      cdsContratosAnteriores.Close;
      cdsContratosAnteriores.Data := WebEmprestimo.ContratosAnteriores( iIDTITULAR,
                                                                        iIDBENEF,
                                                                        iIDTIPOEMPTMO,
                                                                        iIdTpContEmptmoAux,
                                                                        dAux,
                                                                        dDataAtualiza,
                                                                        sJoinPlano,
                                                                        sQuitavel );

      cdsContratosAnteriores2.Close;
      if bFLGEXCEPCIONAL then
        //Pendência 27232 - 17/04/2008
        //if iIDTIPOCONTREMPTMO in [11, 12, 13, 14, 15, 16] then
        if iFLGVERIFICAITEMABERTO <> 0 then
          cdsContratosAnteriores2.Data := WebEmprestimo.ContratosAnteriores2( iIDTITULAR, iIDBENEF );
        //Fim Pendência 27232

      sMsgCtrl := '';

      //Executa regra de elegibilidade
      if not WebEmprestimo.VerificaElegibilidade( IntToStr( iIDREGRAELEG ), iIDTITULAR,
                                                  iIDBENEF,
                                                  //Pendências 23311 e 23312 - 25/09/2006
                                                  iIDPLANOPREV,
                                                  //Fim Pendências 23311 e 23312
                                                  iTCEMINRENOVA, iNUMPARCPAGAS,
                                                  iIdEmpresaProp, bFLGEXCEPCIONAL, sNomeEmpresa,
                                                  dDataFinalBeneficio ) then
      begin
        Result := Result + '<p class="CORPO" align="center">';
        if trim( sMsgCtrl ) <> '' then Result := Result + sMsgCtrl
        else Result := Result + 'Usuário não atende à Regra de Elegibilidade.';
        Result := Result + '</p><br><br>'
      end
      else
      begin
        //Validando inscrição...

        if not WebEmprestimo.ValidaInscricao( iIDTITULAR,
                                              iIDTIPOEMPTMO,
                                              0,
                                              iIdEmpresaProp ) then
        begin
          Result := Result + '<p class="CORPO" align="center">';
          if trim( sMsgCtrl ) <> '' then Result := Result + sMsgCtrl
          else Result := Result + 'Não é permitida a simulação pois a inscrição não será possível.';
          Result := Result + '</p><br><br>'
        end
        else
        begin
          //Pendência 27857 - 07/05/2008
          //Validando contrato em quitação...
          if bGeraLogProcesso then CMDebugToFile( 'Valida Contrato Em Quitação.. ', sNomeArqLog );

          sMsgValidaContrato := '';

          if not WebEmprestimo.ValidaContratoEmQuitacao( iIDTITULAR,
                                                         iIDBENEF,
                                                         iIDTIPOEMPTMO,
                                                         iIDTIPOCONTREMPTMO,
                                                         iQtdEPQuitado,
                                                         iIdEmpresaProp,
                                                         bFLGEXCEPCIONAL,
                                                         sMsgValidaContrato ) then
          begin
            Result := Result + '<p class="CORPO" align="center">';
            if trim( sMsgCtrl ) <> '' then Result := Result + sMsgCtrl
            else Result := Result + sMsgValidaContrato;
            Result := Result + '</p><br><br>'
          end
          else
          begin
          //Fim Pendência 27857

          //Validando contrato...

          sMsgValidaContrato    := '';
          sMsgMargemConsignavel := '';

          if not WebEmprestimo.ValidaContrato( iIDTITULAR,
                                               iIDBENEF,
                                               iIDTIPOEMPTMO,
                                               iIDTIPOCONTREMPTMO,
                                               iQtdEPQuitado,
                                               iIdEmpresaProp,
                                               bFLGEXCEPCIONAL,
                                               sMsgValidaContrato ) then
          begin
            Result := Result + '<p class="CORPO" align="center">';
            if trim( sMsgCtrl ) <> '' then Result := Result + sMsgCtrl
            else Result := Result + 'Não é permitida a simulação pois a contratação não será possível.';
            Result := Result + '</p><br><br>'
          end
          else
          begin
            if sMsgValidaContrato <> '' then
              sMensagens := sMensagens + '<BR><font face="Wingdings">§</font>&nbsp;' + sMsgValidaContrato;

            //Verifica se há empréstimos cuja concessão ainda não tenham sido efetivadas
            if not WebEmprestimo.VerificaConcessaoNaoEfetivada( iIDTITULAR,
                                                                iIDBENEF,
                                                                iIDTIPOCONTREMPTMO,
                                                                bFLGEXCEPCIONAL,
                                                                iFLGVERIFICACONTRATO ) then
            begin
              Result := Result + '<p class="CORPO" align="center">';
              if trim( sMsgCtrl ) <> '' then Result := Result + sMsgCtrl
              else Result := Result + 'Participante não poderá solicitar outro empréstimo pois possui empréstimo anterior não efetivado.';
              Result := Result + '</p><br><br>'
            end
            else
            begin

              //Recupera quantidade mínima e máxima de parcelas
              SetNumParcelas( iIDTITULAR, iIDBENEF, iIDTIPOCONTREMPTMO, iIDTIPOEMPTMO,
                              iIDREGRAPRAZOMAX, iIDREGRAPRAZOSCONC, dAgora, bFlgExcepcional,
                              iMinParcelas, iMaxParcelas );

              //Calcula empréstimos anteriores
              cdsContratosAnteriores.Data := WebEmprestimo.CalculaEPAnterior(
                                               cdsContratosAnteriores.Data,
                                               iIdEmpresaProp,
                                               iIDTIPOEMPTMO,
                                               iIDTIPOCONTREMPTMO,
                                               iIDITEMDEVSEGQUIT,
                                               iIDITEMPROVPERDA,
                                               dDtCredito,
                                               bFlgExcepcional,
                                               iTEPMAXCONTRATO,
                                               //Pendência 26916 - 22/12/2007
                                               iTCEMAXCONTRATO,
                                               //Fim Pendência 26916
                                               iFLGABONODIVERG,
                                               iTipoCliente,
                                               bContratoValido,
                                               iQtdEPQuitado,
                                               fSaldoAQuitar,
                                               fTotalParcelas,
                                               fTotalPendencias,
                                               fQuitacao );



              iAntIdTipoContrEmptmo := -1;
              iAntNumParcPagas      :=  0;
              iAntPrazo             :=  0;
              iAntUltParcGerada     :=  0;

              fVlrDevSeg            := 0;
              fVlrSeguroAnt         := 0;
              fVlrSeguroComplAnt    := 0;

              iAntIdContratoEmptmo  := -1;
              fAntValorSolic        :=  0;
              dAntDataCredito       :=  0;
              iNUMPARCPAGAS         :=  0;

              //Pendência 23733 - 19/12/2006
              if iIDREGRATIPOCONTR > 0 then
              begin

                 if not WebEmprestimo.ValidaTipoContratoEmprestimo(cdsContratosAnteriores.Data,
                                                                   iIdEmpresaProp,
                                                                   iIDTITULAR,
                                                                   iIDBENEF,
                                                                   iIDTIPOCONTREMPTMO,
                                                                   iIDREGRATIPOCONTR
                                                                  ) then
                    raise Exception.Create( 'Tipo de contrato de empréstimo não pode ser contratado.' );

              end;
              //Fim Pendência 23733

              if not ( cdsContratosAnteriores.IsEmpty ) then
              begin
                cdsContratosAnteriores.First;

                iAntIdTipoContrEmptmo := cdsContratosAnteriores.FieldByName('IDTIPOCONTREMPTMO').AsInteger;

                bContratosMarcados := False;

                while not ( cdsContratosAnteriores.Eof ) do
                begin

                  if ( cdsContratosAnteriores.FieldByName('FLGESCOLHA').AsInteger = 1 ) or
                    ( cdsContratosAnteriores.RecordCount = iTEPMAXCONTRATO ) then
                  begin
                    bContratosMarcados   := True;

                    iAntNumParcPagas      := cdsContratosAnteriores.FieldByName('NUMPARCPAGAS').AsInteger;
                    iAntPrazo             := cdsContratosAnteriores.FieldByName('NUMPARCELAS').AsInteger;
                    iAntUltParcGerada     := cdsContratosAnteriores.FieldByName('ULT_PARC').AsInteger;
                    iAntIdTipoContrEmptmo := cdsContratosAnteriores.FieldByName('IDTIPOCONTREMPTMO').AsInteger;

                    fAntValorSolic        := cdsContratosAnteriores.FieldByName('VLRCONTRATO').AsCurrency;
                    dAntDataCredito       := cdsContratosAnteriores.FieldByName('DATACREDITO').AsDateTime;
                    iNUMPARCPAGAS         := cdsContratosAnteriores.FieldByName('NUMPARCPAGAS').AsInteger;
                  end;

                  if bFLGEXCEPCIONAL then
                  begin
                    if cdsContratosAnteriores.FieldByName('FLGESCOLHA').AsInteger = 1 then
                    begin
                      fVlrDevSeg           := fVlrDevSeg           + cdsContratosAnteriores.FieldByName('VLRDEVSEG').AsCurrency;
                      fVlrSeguroAnt        := fVlrSeguroAnt        + WebEmprestimo.PegaSeguroAnt( cdsContratosAnteriores.FieldByName('IDCONTRATOEMPTMO').AsFloat, iIDITEMSEGCONC );
                      fVlrSeguroComplAnt   := fVlrSeguroComplAnt   + WebEmprestimo.PegaSeguroComplAnt( cdsContratosAnteriores.FieldByName('IDCONTRATOEMPTMO').AsFloat, iIDITEMSEGCOMPL );
                    end;
                  end;

                  cdsContratosAnteriores.Next;
                end;

                //Verifica se o número de parcelas pagas é suficiente.
                if not bFLGEXCEPCIONAL then
                begin

                  if iAntNumParcPagas < iTCEMINRENOVA then
                  begin

                    Result := Result +
                     '<p class="CORPO" align="center">' ;

                    sMsgMargemConsignavel := 'O número de parcelas pagas do contrato anterior é inferior ao permitido.';

                    if sMsgRestritiva = '' then sMsgRestritiva := sMsgMargemConsignavel;

                    sMensagens := sMensagens + '<BR><font face="Wingdings">§</font>&nbsp;' + sMsgMargemConsignavel;

                  end

                end
                else
                begin

                  if ( cdsContratosAnteriores.FieldByName('IDTIPOCONTREMPTMO').AsInteger = iIDTIPOCONTREMPTMO ) and
                     ( iAntNumParcPagas < iTCEMINRENOVA ) then
                  begin

                    if bContratosMarcados then
                    begin

                      if WebEmprestimo.PrimeiraRenovacao2006( iIdPessoa, iIdBenef, iIdTipoContrEmptmo ) then
                      begin

                        Result := Result +
                         '<p class="CORPO" align="center">' ;

                        if sMsgMargemConsignavel = '' then
                        begin
                          sMsgMargemConsignavel := 'A renovação exige carência de meses e mínimo de parcelas pagas, condições ainda não atendidas no atual contrato.';

                          if sMsgRestritiva = '' then sMsgRestritiva := sMsgMargemConsignavel;

                          sMensagens := sMensagens + '<BR><font face="Wingdings">§</font>&nbsp;' + sMsgMargemConsignavel;
                        end;

                      end;

                    end;

                  end;

                end;

              end;


              //Outras dívidas
              cdsOutrasDividas.Data := WebEmprestimo.OutrasDividas( iIDBENEF, dDtCredito );

              iTotSiafi := 0;
              while not( cdsOutrasDividas.EOF ) do
              begin
                if bFLGEXCEPCIONAL                                              and
                   ( cdsOutrasDividas.FieldByName('CODTIPO').AsInteger    = 3 ) and
                   ( cdsOutrasDividas.FieldByName('NUMPARCELA').AsInteger > 0 ) then
                begin
                  Inc( iTotSiafi );
                end;

                cdsOutrasDividas.Next;
              end;



              //Calcula salário base
              if iIDREGRASALBAS > 0 then
              begin
                  fVlrSalBase := Arredonda( WebEmprestimo.BuscaSalarioBase( iIDTITULAR,
                                                                            iIDBENEF,
                                                                            iIdEmpresaProp,
                                                                            iIDREGRASALBAS,
                                                                            bFlgExcepcional,
                                                                            dAgora, 0, iTipoCliente ), 2 );
              end;


              //Calcula Margem Consignável
              if iIDREGRAMARGEM > 0 then
              begin
                  fVlrMargem := Arredonda( WebEmprestimo.BuscaMargem( iIDTITULAR,
                                                           iIDBENEF,
                                                           iIdEmpresaProp,
                                                           iIDREGRAMARGEM,
                                                           fVlrSalBase,
                                                           fTotalParcelas,
                                                           fTotalPendencias,
                                                           bFlgExcepcional,
                                                           //Pendência 22248 - 03/08/2006
                                                           Now, iMaxParcelas, False, 0, '' ,iTipoCliente ), 2 );  // Ajustar contratos quitáveis para o AutoAtendimento
                                                           //Fim Pendência 22248
              end;


              //Calcula Saldo de Reserva
              if iIDREGRARESERVA > 0 then
              begin
                  fValReserva := Arredonda( BuscaReserva( iIDREGRARESERVA,
                                                          iIDBENEF,
                                                          iIDPESSJUR,
                                                          iIDPLANOPREV,
                                                          dAgora, 0 ), 2 );
              end;


              //Calcula Taxa de Juros
              fTxJuros := BuscaTxJuros( iIDTIPOCONTREMPTMO,
                                        iIDREGRAJURCONC,
                                        0,
                                        0,
                                        iMaxParcelas,
                                        0,
                                        sMOESIGLA,
                                        dDtCredito,
                                        dDtCredito,
                                        dAgora,
                                        dAgora,
                                        0,
                                        0,
                                        iIDPAIS,
                                        iIDCIDADES,
                                        iIDESTADO,
                                        sCODESTADO,
                                        0 );

              if iIDREGRAJUREXIBE > 0 then
              begin
                fTxJurosExibe := BuscaTxJuros( iIDTIPOCONTREMPTMO,
                                               iIDREGRAJUREXIBE,
                                               0,
                                               0,
                                               iMaxParcelas,
                                               0,
                                               sMOESIGLA,
                                               dDtCredito,
                                               dDtCredito,
                                               dAgora,
                                               dAgora,
                                               0,
                                               0,
                                               iIDPAIS,
                                               iIDCIDADES,
                                               iIDESTADO,
                                               sCODESTADO,
                                               0 );
              end
              else
                fTxJurosExibe := fTxJuros;


              //Calcula Valor Máximo Permitido
              fVlrMaxPermit    := Arredonda( WebEmprestimo.BuscaVlrSolicMax(
                                             iIdEmpresaProp,
                                             iIDTIPOCONTREMPTMO,
                                             iIDPESSJUR,
                                             iIDPLANOPREV,
                                             iIDTITULAR,
                                             iIDBENEF,
                                             iIDSITPART,
                                             iMaxParcelas,
                                             sFLGINTERNO,
                                             fVlrMargem,
                                             fValReserva,
                                             fTxJuros,
                                             fSaldoAQuitar,
                                             0,
                                             fQuitacao,
                                             fSalParticipacao,
                                             fSalMantido,
                                             fSalAuxDoenca,
                                             fSalBenef,
                                             fVlrSalBase,
                                             //Pendências 26950 e 26951 - 30/11/2007
                                             0,
                                             SysDate( WebEmprestimo ), //dDataAssinatura,
                                             dDtCredito,
                                             dDt1aParcela,
                                             iTipoCliente,
                                             '',
                                             cdsContratosAnteriores.Data ), 2 );
                                            //Fim Pendências 26950 e 26951

              if bFLGEXCEPCIONAL then
              begin

                if iTotSiafi > 0  then
                  raise Exception.Create( 'Mutuário possui dívidas de Financiamento Habitacional. Não será possível conceder Empréstimos para o mesmo.' );

                // ----------------------------------------------------------------------------------------
                // Verifica se há itens em aberto de qq contrato (para adiantamento de 13º)
                //Pendência 27232 - 17/04/2008
                //if ( iIDTIPOCONTREMPTMO in [11, 12, 13, 14, 15, 16] ) and ( cdsContratosAnteriores2.Active ) then
                if ( iFLGVERIFICAITEMABERTO <> 0 ) and ( cdsContratosAnteriores2.Active ) then
                begin
                //Fim Pendência 27232

                  cdsContratosAnteriores2.First;
                  while not( cdsContratosAnteriores2.EOF ) do
                  begin


                    if WebEmprestimo.ExistemItensEmAberto_uCalc( cdsContratosAnteriores2.FieldByName('IDCONTRATOEMPTMO').AsFloat,
                                                                 True, dDtCredito,
                                                                 True, StrToInt( FormatDateTime( 'yyyy', dDtCredito ) ),
                                                                 StrToInt( FormatDateTime( 'mm', dDtCredito ) ) ) then
                      raise Exception.Create( 'Mutuário possui débitos anteriores em aberto. Não será possível conceder Empréstimo para o mesmo.' );

                    //Pendência 27232 - 17/04/2008
                    if iIDREGRATIPOCONTR > 0 then
                    begin
                      if not WebEmprestimo.ValidaTipoContratoEmprestimo(cdsContratosAnteriores2.Data,
                                                                        iIdEmpresaProp,
                                                                        iIDTITULAR,
                                                                        iIDBENEF,
                                                                        iIDTIPOCONTREMPTMO,
                                                                        iIDREGRATIPOCONTR
                                                                       ) then
                        raise Exception.Create( 'Tipo de contrato em aberto impede contratação!' );
                    end;
                    {
                    if ( ( iIDTIPOCONTREMPTMO = 11 ) and ( cdsContratosAnteriores2.FieldByName('IDTIPOCONTREMPTMO').AsInteger in [11, 12, 13] ) ) or
                       ( ( iIDTIPOCONTREMPTMO = 12 ) and ( cdsContratosAnteriores2.FieldByName('IDTIPOCONTREMPTMO').AsInteger in [11, 12, 13] ) ) or
                       ( ( iIDTIPOCONTREMPTMO = 13 ) and ( cdsContratosAnteriores2.FieldByName('IDTIPOCONTREMPTMO').AsInteger in [11, 12, 13] ) ) or
                       ( ( iIDTIPOCONTREMPTMO = 14 ) and ( cdsContratosAnteriores2.FieldByName('IDTIPOCONTREMPTMO').AsInteger in [14, 15, 16] ) ) or
                       ( ( iIDTIPOCONTREMPTMO = 15 ) and ( cdsContratosAnteriores2.FieldByName('IDTIPOCONTREMPTMO').AsInteger in [14, 15, 16] ) ) or
                       ( ( iIDTIPOCONTREMPTMO = 16 ) and ( cdsContratosAnteriores2.FieldByName('IDTIPOCONTREMPTMO').AsInteger in [14, 15, 16] ) ) then
                      raise Exception.Create( 'Mutuário possui contrato anterior do mesmo tipo. Não será possível conceder Empréstimo para o mesmo.' );
                    }
                    //Fim Pendência 27232

                    cdsContratosAnteriores2.Next;
                  end;
                end;

                cdsContratosAnteriores.First;
                while not( cdsContratosAnteriores.EOF) do
                begin

                  if cdsContratosAnteriores.FieldByName('FLGESCOLHA').AsInteger = 1 then
                  begin

                    if iFLGCALCDIA = 1 then
                    begin

                      //Verificando se possui atualização diária...
                      if not ( WebEmprestimo.PossuiAtualizacaoDiaria( cdsContratosAnteriores.FieldByName('IDCONTRATOEMPTMO').AsFloat, dDtcredito ) ) then
                      begin

                        //Verificando data da última atualização...
                        dData  := WebEmprestimo.UltimaDataAtualizacao( cdsContratosAnteriores.FieldByName('IDCONTRATOEMPTMO').AsFloat );
                        //Verificando saldo devedor anterior...
                        rSaldo := WebEmprestimo.SaldoDevAnt( cdsContratosAnteriores.FieldByName('IDCONTRATOEMPTMO').AsFloat, dData, -1, -1, iFLGSALDODEVANT, iFLGCALCDIA, False );

                        if rSaldo.fSaldoDevAnt <> 0 then
                          raise Exception.Create( 'Contrato anterior não possui atualização diária para a data do crédito.' );

                      end;
                    end;

                    if ( cdsContratosAnteriores.FieldByName('NUMPARCPAGAS').AsInteger < cdsContratosAnteriores.FieldByName('TCEMINRENOVA').AsInteger ) then
                    begin

                      if WebEmprestimo.PrimeiraRenovacao2006( iIdPessoa, iIdBenef, iIdTipoContrEmptmo ) then
                      begin

                        Result := Result +
                         '<p class="CORPO" align="center">' ;

                        if sMsgMargemConsignavel = '' then
                        begin
                          sMsgMargemConsignavel := 'A renovação exige carência de meses e mínimo de parcelas pagas, condições ainda não atendidas no atual contrato.';

                          if sMsgRestritiva = '' then sMsgRestritiva := sMsgMargemConsignavel;

                          sMensagens := sMensagens + '<BR><font face="Wingdings">§</font>&nbsp;' + sMsgMargemConsignavel;
                        end;

                      end;

                    end;

                  end;

                  cdsContratosAnteriores.Next;
                end;

              end;

              //Tratamento de Assinatura / Contrato Padrão
              if iFLGTRATAASSINAT = 1 then
              begin
                if not ( WebEmprestimo.PossuiAssinatura( iIDTITULAR,
                                                         iIDBENEF,
                                                         iIDTIPOCONTREMPTMO,
                                                         sMsgPossuiAssinatura ) ) then
                begin
                  if sMsgPossuiAssinatura <> '' then
                    sMsgPossuiAssinatura := 'Mutuário não possui assinatura para esse tipo de contrato.';
                  if sMsgRestritiva = '' then sMsgRestritiva := sMsgPossuiAssinatura;
                  sMensagens := sMensagens + '<BR><font face="Wingdings">§</font>&nbsp;' + sMsgPossuiAssinatura;
                end;
              end;


              //Verificando de há itens anteriores em aberto...
              if ( fSaldoaQuitar > 0 ) and
                 ( iFLGRENPRESTAB = 1) and
                 ( WebEmprestimo.ExistemItensEmAberto_fCad( iIDTIPOCONTREMPTMO, dAgora, fAux ) ) then
                raise Exception.Create( 'Existem itens anteriores em aberto.' );


              //------------------------------------------------------------------------
              //Montagem da página propriamente dita


              //Valida e confirma o preenchimento dos campos
              sJavaScript :=
               ' function Confirma( )                                                                  ' + CR +
               ' {                                                                                     ' + CR +
               MontaValidacao( cEmpSimParValorSolicitado, 'frmLnkParamSimulacao.empVlrSolicitado', 'T' ) + CR ;

              if TemAcessoCampo( sTipoUsuario, cEmpSimNumParcSimulaveis, sTituloCampo ) then
                sJavaScript := sJavaScript +
                 '   if ( ContaParcelas( ) < 1 )                                                         ' + CR +
                 '   {                                                                                   ' + CR +
                 '     alert(''Selecione ao menos um número de parcelas para simulação.'');              ' + CR +
                 '     exit;                                                                             ' + CR +
                 '   }                                                                                   ' + CR ;

              sJavaScript := sJavaScript +
               '   eval("document.frmLnkParamSimulacao.btnPrestacoes.style.display=''none''");         ' + CR +
               '   EnviaForm( document.frmLnkParamSimulacao );                                         ' + CR +
               ' }                                                                                     ' + CR ;

              Result := Result +
               '<p class="DESCCAMPO">                                                                  ' + CR +
               '  <form method="POST" name="frmLnkParamSimulacao"                                      ' + CR +
               '   action="../<#nomearqapl>/EmpSimulacao">                                 ' + CR +
               '    <table border="0" width="100%" cellpadding="0" cellspacing="0" class="FORMULARIO"> ' + CR ;

              Result := Result +
               '    <tr>                                                                             ' + CR +
               '      <td width="100%">                                                              ' + CR +
               '        <table border="0" width="100%" cellpadding="0" cellspacing="0">              ' + CR ;


              //Variáveis de montagem do formulário
              sIniLinha :=
                 '          <tr class="CAMPOFORM">                                                   ' + CR +
                 '            <td class="DESCCAMPO" width="50%" <#S> >                               ' + CR ;

              sEntreCols :=
                 '            </td>                                                                  ' + CR +
                 '            <td class="DESCCAMPO">                                                 ' + CR ;

              sFimLinha :=
                 '            </td>                                                                  ' + CR +
                 '          </tr>                                                                    ' + CR ;

              sColFmt :=
               '              <#T>                                                                   ' + CR +
               '              <DIV class="CONTCAMPOD">                                               ' + CR +
               '                <#C>                                                                 ' + CR +
               '              </DIV>                                                                 ' + CR ;


              Result := Result + MontaLinhaForm( cEmpSimParTipoContrato,   StrToName( sTCEDESCRICAO   ),
                                                 cEmpSimParTipoEmprestimo, StrToName( sDESCTIPOEMPTMO ) );


              sColFmt :=
               '              <#T>                                                                   ' + CR +
               '              <DIV class="CONTCAMPO">                                                ' + CR +
               '                <#C>                                                                 ' + CR +
               '              </DIV>                                                                 ' + CR ;


              //---------------------------------------------------------------------------------

              Result := Result + MontaLinhaForm( cEmpSimCPF, Copy( sCPF, 1, 3 ) + '.' + Copy( sCPF, 4, 3 ) + '.' +
                                                             Copy( sCPF, 7, 3 ) + '/' + Copy( sCPF, 10, 2 ) );


              Result := Result + MontaLinhaForm( cEmpSimParDtCredito,         DateToStr( dDtCredito ),
                                                 cEmpSimParDt1aParcela,       DateToStr( dDt1aParcela ) );

              Result := Result + MontaLinhaForm( cEmpSimParCarencia,          IntToStr( iCarencia ),
                                                 cEmpSimParSaldoAQuitar,      FormatFloat( '#,##0.00', fSaldoAQuitar ) );

              Result := Result + MontaLinhaForm( cEmpSimParSalarioBase,       FormatFloat( '#,##0.00', fVlrSalBase ),
                                                 cEmpSimParReservaPoupanca,   FormatFloat( '#,##0.00', fValReserva ) );

              Result := Result + MontaLinhaForm( cEmpSimParMargemConsignavel, FormatFloat( '#,##0.00', fVlrMargem ),
                                                 cEmpSimParTaxaJuros,         FormatFloat( '#,##0.0000', fTxJurosExibe ) );

              Result := Result + MontaLinhaForm( cEmpSimParMinimoParcelas,    IntToStr( iMinParcelas ),
                                                 cEmpSimParMaximoParcelas,    IntToStr( iMaxParcelas ) );

              Result := Result + MontaLinhaForm( cEmpSimParValorMaximo,        FormatFloat( '#,##0.00', fVlrMaxPermit ),
                                                 cEmpSimParValorSolicitado,
                                                  '<input type="text" name="empVlrSolicitado" size="20" ' +
                                                  ' class="TEXT" maxlength="20" value="' +
                                                  FormatFloat( '#,##0.00', fVlrMaxPermit ) + '" > ' );

              Result := Result +
               '        </table>                                                                     ' + CR +
               '        <BR><BR>                                                                     ' + CR ;

              sParcelas := ParcelasSimulaveis( iIdTitular, iIdBenef, iIdEmpresaProp, iIDREGRAPRAZOSCONC,
                                               iMinParcelas, iMaxParcelas, bFlgExcepcional );

              sParcelas2 := sParcelas;

              if TemAcessoCampo( sTipoUsuario, cEmpSimNumParcSimulaveis, sTituloCampo ) then
              begin
                Result := Result +
                 ' <DIV class="BOXFORM" width="100%"> ' + CR +
                 '   <table border="0" width="720" cellpadding="0" cellspacing="0"><tr><td width="100%">' +
                 '   <DIV class="CABBOXFORM" width="100%">' + CR +
                 sTituloCampo + '</DIV></td></tr></table>' + CR +
                 '   <table border="0" width="720" cellpadding="0" cellspacing="0">              ' + CR +
                 '     <tr>                                                                      ' + CR ;

                while sParcelas <> '' do
                begin
                  SetLength( aParcelas, length( aParcelas ) + 1 );
                  aParcelas[High(aParcelas)] := RetiraPrimeiroElemento( sParcelas, ';' );
                end;

                sJavaScript := sJavaScript           + CR + CR +
                 ' function ContaParcelas(  )      ' + CR +
                 ' {                               ' + CR +
                 '    var ContaParc = 0;           ' + CR + CR ;

                for i := 0 to High( aParcelas ) do
                begin
                  if length( aParcelas ) <= 12 then
                  begin
                    Result  := Result + CR +
                     '<td class="DESCCAMPO" width=' + IntToStr( round( 100 / length( aParcelas ) ) ) + '%>' +
                     '<input type="checkbox" name="empParc' + aParcelas[i] +
                     '" value="1" onClick="JavaScript:SelecionaParcela(this)"> '+
                     aParcelas[i]                                           +
                     '</input> ' +
                     '</td>';
                  end
                  else
                  begin
                    Result  := Result                    + CR +
                     '<td class="DESCCAMPO" width=8.3%>' +
                     '<input type="checkbox" name="empParc' + aParcelas[i] +
                     '" value="1" onClick="JavaScript:SelecionaParcela(this)"> '+
                     aParcelas[i]                       +
                     '</input></td>' ;

                    if ( ( i + 1 ) mod 12 ) = 0 then
                      Result  := Result +
                        '</tr> <tr> ';
                  end;

                  sJavaScript := sJavaScript +
                   '    if( frmLnkParamSimulacao.empParc' + aParcelas[i] + '.checked ) ContaParc = ContaParc + 1;' + CR;

                end;

                sJavaScript := sJavaScript           + CR +
                 '   return ( ContaParc ) ' + CR +
                 ' } ' + CR + CR +
                 ' function SelecionaParcela( cb ) ' + CR +
                 ' { ' + CR ;

                if iTCENUMPARCSIM > 0 then
                  sJavaScript := sJavaScript +
                   '    if( ContaParcelas( ) > ' + IntToStr( iTCENUMPARCSIM ) + ' ) ' + CR +
                   '    { ' + CR +
                   '      alert("Selecione no máximo ' + IntToStr( iTCENUMPARCSIM ) +
                   ' números de prestações para simulação simultaneamente."); ' + CR +
                   '      cb.checked = false; ' + CR +
                   '    } ' + CR
                else
                  sJavaScript := sJavaScript +
                   '  frmLnkParamSimulacao.empParcTodas.checked = false; ' + CR ;

                sJavaScript := sJavaScript +
                 ' }                               ' + CR ;

                Result := Result + ' </tr> </table> ' + CR ;


                if iTCENUMPARCSIM = 0 then
                begin
                  if TemAcessoCampo( sTipoUsuario, cEmpSimSelecTodasParc, sTituloCampo ) then
                  begin
                    Result := Result + CR +
                     '<HR><input type="checkbox" name="empParcTodas" onClick="JavaScript:MarcaTodas(this)">' +
                     '<SPAN id="DESCCAMPO">' + sTituloCampo + '</SPAN>' + CR;

                    sJavaScript := sJavaScript + CR +
                     ' function MarcaTodas(cb) ' + CR +
                     ' { ' + CR ;

                    for i := 0 to High( aParcelas ) do
                      sJavaScript := sJavaScript +
                       '    frmLnkParamSimulacao.empParc' + aParcelas[i] + '.checked = cb.checked; ' + CR;

                    sJavaScript := sJavaScript + ' } ' + CR ;
                  end;
                end;

                Result := Result + '</DIV> ' + CR ;
              end;


              Result := Result +
               '      </td>                                                                                                                ' + CR +
               '    </tr>                                                                                                                  ' + CR +
               '    <tr>                                                                                                                   ' + CR +
               '      <td align="center">                                                                                                  ' + CR +
               '        <a href="JavaScript:Confirma();">                                                                                  ' + CR +
               '         <img src="../imagem/btnPrestacoes.gif" name="btnPrestacoes" border="0"                                            ' + CR +
               '          onMouseOver="btnPrestacoes.src=''../imagem/btnPrestacoes_s.gif''"                                                ' + CR +
               '          onMouseOut="btnPrestacoes.src=''../imagem/btnPrestacoes.gif''"></a>                                              ' + CR +
               '      </td>                                                                                                                ' + CR +
               '    </tr>                                                                                                                  ' + CR +
               '  </table>                                                                                                                 ' + CR +
               '  <BR>                                                                                                                     ' + CR +
               sMensagens                                                                                                                    + CR +
               '  <#hiddenfields>                                                                                                          ' + CR ;


              //Inclui os campos da página anterior
              j := 0;
              for i := 0 to ( Request.ContentFields.Count - 1 ) do
              begin
                if StrLeft( Request.ContentFields.Names[i], 3 ) = 'emp' then
                  Result := Result +
                   '  <input type="hidden" name="' + Request.ContentFields.Names[i] + '" value="' +
                   trim( Request.ContentFields.Values[ Request.ContentFields.Names[i] ] ) + '"> ' + CR ;
              end;

              sArqContratosAnteriores := SaveDataset( cdsContratosAnteriores.Data );

              Result := Result +
               '  <input type="hidden" name="empIDTIPOEMPTMO"           value="' + IntToStr( iIDTIPOEMPTMO )                           + '"> ' + CR +
               '  <input type="hidden" name="empIDREGRAPRAZOSCONC"      value="' + IntToStr( iIDREGRAPRAZOSCONC )                      + '"> ' + CR +
               '  <input type="hidden" name="empIDREGRALIMITES"         value="' + IntToStr( iIDREGRALIMITES )                         + '"> ' + CR +
               '  <input type="hidden" name="empTCEMAXINSCR"            value="' + IntToStr( iTCEMAXINSCR )                            + '"> ' + CR +
               '  <input type="hidden" name="empTCEMAXCONTRATO"         value="' + IntToStr( iTCEMAXCONTRATO )                         + '"> ' + CR +
               '  <input type="hidden" name="empTCEDESCRICAO"           value="' + trim( sTCEDESCRICAO )                               + '"> ' + CR +
               '  <input type="hidden" name="empTEPMAXCONTRATO"         value="' + IntToStr( iTEPMAXCONTRATO )                         + '"> ' + CR +
               '  <input type="hidden" name="empNUMPARCDESCONTO"        value="' + IntToStr( iNUMPARCDESCONTO )                        + '"> ' + CR +
               '  <input type="hidden" name="empFLGOBRIGBENEF"          value="' + IntToStr( iFLGOBRIGBENEF )                          + '"> ' + CR +
               '  <input type="hidden" name="empDESCTIPOEMPTMO"         value="' + trim( sDESCTIPOEMPTMO )                             + '"> ' + CR +
               '  <input type="hidden" name="empMOESIGLA"               value="' + trim( sMOESIGLA )                                   + '"> ' + CR +
               '  <input type="hidden" name="empMOECODIGO"              value="' + trim( sMOECODIGO )                                  + '"> ' + CR +
               '  <input type="hidden" name="empAntDataCredito"         value="' + FormatDateTime( 'dd/MM/yyyy', dAntDataCredito )     + '"> ' + CR +
               '  <input type="hidden" name="empAntIdContratoEmptmo"    value="' + IntToStr( iAntIdContratoEmptmo )                    + '"> ' + CR +
               '  <input type="hidden" name="empAntIdTipoContrEmptmo"   value="' + IntToStr( iAntIdTipoContrEmptmo )                   + '"> ' + CR +
               '  <input type="hidden" name="empAntNumParcPagas"        value="' + IntToStr( iAntNumParcPagas )                        + '"> ' + CR +
               '  <input type="hidden" name="empAntPrazo"               value="' + IntToStr( iAntPrazo )                               + '"> ' + CR +
               '  <input type="hidden" name="empAntUltParcGerada"       value="' + IntToStr( iAntUltParcGerada )                       + '"> ' + CR +
               '  <input type="hidden" name="empAntValorSolic"          value="' + FormatFloat( '###0.00', fAntValorSolic )            + '"> ' + CR +
               '  <input type="hidden" name="empDataFinalBeneficio"     value="' + FormatDateTime( 'dd/MM/yyyy', dDataFinalBeneficio ) + '"> ' + CR +
               '  <input type="hidden" name="empDataPrimParc"           value="' + FormatDateTime( 'dd/MM/yyyy', dDt1aParcela  )       + '"> ' + CR +
               '  <input type="hidden" name="empDtCredito"              value="' + FormatDateTime( 'dd/MM/yyyy', dDtCredito )          + '"> ' + CR +
               '  <input type="hidden" name="empSaldoQuitacao"          value="' + FormatFloat( '###0.00', fSaldoQuitacao )            + '"> ' + CR +
               '  <input type="hidden" name="empMargem"                 value="' + FormatFloat( '###0.00', fVlrMargem )                + '"> ' + CR +
               '  <input type="hidden" name="empMaxParcelas"            value="' + IntToStr( iMaxParcelas )                            + '"> ' + CR +
               '  <input type="hidden" name="empMinParcelas"            value="' + IntToStr( iMinParcelas )                            + '"> ' + CR +
               '  <input type="hidden" name="empReserva"                value="' + FormatFloat( '###0.00', fValReserva )               + '"> ' + CR +
               '  <input type="hidden" name="empSalarioBase"            value="' + FormatFloat( '###0.00', fVlrSalBase )               + '"> ' + CR +
               '  <input type="hidden" name="empSalAuxDoenca"           value="' + FormatFloat( '###0.00', fSalAuxDoenca )             + '"> ' + CR +
               '  <input type="hidden" name="empSalBenef"               value="' + FormatFloat( '###0.00', fSalBenef )                 + '"> ' + CR +
               '  <input type="hidden" name="empSaldoAQuitar"           value="' + FormatFloat( '###0.00', fSaldoAQuitar )             + '"> ' + CR +
               '  <input type="hidden" name="empQtdEPQuitado"           value="' + IntToStr( iQtdEPQuitado )                           + '"> ' + CR +
               '  <input type="hidden" name="empSalMantido"             value="' + FormatFloat( '###0.00', fSalMantido )               + '"> ' + CR +
               '  <input type="hidden" name="empSalPart"                value="' + FormatFloat( '###0.00', fSalParticipacao )          + '"> ' + CR +
               '  <input type="hidden" name="empParcelas"               value="' + sParcelas2                                          + '"> ' + CR +
               '  <input type="hidden" name="empQuitacao"               value="' + FormatFloat( '###0.00', fQuitacao )                 + '"> ' + CR +
               '  <input type="hidden" name="empTxJuros"                value="' + FormatFloat( '#,##0.0000', fTxJuros )               + '"> ' + CR +
               '  <input type="hidden" name="empTxJurosExibe"           value="' + FormatFloat( '#,##0.0000', fTxJurosExibe )          + '"> ' + CR +
               '  <input type="hidden" name="empVlrMaxPermit"           value="' + FormatFloat( '###0.00', fVlrMaxPermit )             + '"> ' + CR +
               '  <input type="hidden" name="empVlrTotalParcelas"       value="' + FormatFloat( '###0.00', fTotalParcelas )            + '"> ' + CR +
               '  <input type="hidden" name="empVlrTotalPendencias"     value="' + FormatFloat( '###0.00', fTotalPendencias )          + '"> ' + CR +
               '  <input type="hidden" name="empVlrDevSeg"              value="' + FormatFloat( '###0.00', fVlrDevSeg )                + '"> ' + CR +
               '  <input type="hidden" name="empVlrSeguroAnt"           value="' + FormatFloat( '###0.00', fVlrSeguroAnt )             + '"> ' + CR +
               '  <input type="hidden" name="empVlrSeguroComplAnt"      value="' + FormatFloat( '###0.00', fVlrSeguroComplAnt )        + '"> ' + CR +
               '  <input type="hidden" name="empQtdeItensEmptmo"        value="' + IntToStr( iQtdeItensEmptmo )                        + '"> ' + CR +
               '  <input type="hidden" name="empQtdeParcelasEmAberto"   value="' + IntToStr( iQtdeParcelasEmAberto )                   + '"> ' + CR +
               '  <input type="hidden" name="empIdUltHistMovEmptmo"     value="' + FloatToStr( iIdUltHistMovEmptmo )                   + '"> ' + CR +
               '  <input type="hidden" name="empArqContratosAnteriores" value="' + sArqContratosAnteriores                             + '"> ' + CR +
               '  <input type="hidden" name="empMsgRestritiva"          value="' + sMsgRestritiva                                      + '"> ' + CR +
               //Pendência 27232 e 27749 - 17/04/2008
               '  <input type="hidden" name="empFlgVerificaItemAberto"  value="' + IntToStr( iFLGVERIFICAITEMABERTO )                  + '"> ' + CR +
               '  <input type="hidden" name="empFlgNaoVerificaMrgPcl"   value="' + IntToStr( iFLGNAOVERIFICAMRGPCL )                   + '"> ' + CR +
               //Fim Pendência 27232 e 27749
               //Pendência 22248 - 01/08/2006
               '  <input type="hidden" name="empIDREGRAMARGEM"          value="' + IntToStr( iIDREGRAMARGEM )                          + '"> ' + CR +
               '  <input type="hidden" name="empTotalParcelas"          value="' + FormatFloat( '###0.00', fTotalParcelas )            + '"> ' + CR +
               '  <input type="hidden" name="empTotalPendencias"        value="' + FormatFloat( '###0.00', fTotalPendencias )          + '"> ' + CR ;
               //Fim Pendência 22248
               //Pendência 24902 - 24/05/2007
               if not TemAcessoCampo( sTipoUsuario, cEmpSimParValorSolicitado, sTituloCampo ) then
                  Result := Result +
                  '  <input type="hidden" name="empVlrSolicitado"        value="' + FormatFloat( '###0.00', fVlrMaxPermit )          + '"> ' + CR ;
               Result := Result +
               //Fim Pendência 24902
               '</form>                                                                                                                      ' + CR +
               '</p>                                                                                                                         ' + CR +
               '<SCRIPT language="JavaScript">                                                                                               ' + CR +
               '  document.frmLnkParamSimulacao.empVlrSolicitado.focus();                                                                    ' + CR +
               '</script>                                                                                                                    ' + CR ;

              //------------------------------------------------------------------------

            end;

            end; {ValidaContrato}

          //Pendência 27857 - 07/05/2008
          end; {ValidaContratoEmQuitacao}
          //Fim Pendência 27857

        end;

      end;

      cds.Close;

      Result := MontaPagina( pEmpParamSimulacao, Result );

    except
      On E : Exception do
      begin
        Result := TrataWebExcecoes( E );
      end;
    end;

  finally
    cdsContratosAnteriores.Free;
    cdsContratosAnteriores2.Free;
    cdsOutrasDividas.Free;
  end;
end; {PaginaEmpDadosSimulacao}


//Indica se o participante excedeu o limite de inscrições.
function ExcedeuLimiteInscricoes( iIdPessoaLocal, iIdTipoEmptmo : integer ) : boolean;
begin
  cdsAux.Close;

  cdsAux.Data := WebEmprestimo.LimiteInscricoes( iIdPessoaLocal, iIdTipoEmptmo, iIdEmpresaProp );

  if cdsAux.IsEmpty then Result := False
  else Result := ( cdsAux.FieldByName('NUMINSC').AsInteger >=
                   cdsAux.FieldByName('TEPMAXINSCR').AsInteger );

  cdsAux.Close;
end; {ExcedeuLimiteInscricoes}



//Indica se o participante excedeu o limite de contratos.
function ExcedeuLimiteContratos( iIdPessoaLocal, iIdTipoEmptmo : integer ) : boolean;
begin
  cdsAux.Close;

  cdsAux.Data := WebEmprestimo.LimiteContratos( iIdPessoaLocal, iIdTipoEmptmo, iIdEmpresaProp, iIdPessoaLocal );
  if cdsAux.IsEmpty then Result := False
  else Result := ( cdsAux.FieldByName('NUMCONTRATO').AsInteger >=
                   cdsAux.FieldByName('TEPMAXCONTRATO').AsInteger );

  cdsAux.Close;

end; {ExcedeuLimiteContratos}


//Quantidade máxima e mínima de parcelas
procedure SetNumParcelas( iIdTitular, iIdBenef,
                          iIdTipoContrEmptmo, iIdTipoEmptmo, iIDREGRAPRAZOMAX,
                          iIDREGRAPRAZOSCONC : integer;
                          dDataInsc : TDateTime; bFlgExcepcional : boolean;
                          var iMinParcelas : integer; var iMaxParcelas : integer );
var
  cdsLocal : TCMClientDataSet;
begin
  cdsLocal := TCMClientDataSet.Create( nil );
  try
    cdsLocal.Data := WebEmprestimo.NumParcelas( iIdTipoContrEmptmo, iIdTipoEmptmo );

    if not cdsLocal.IsEmpty then
    begin
      iMinParcelas := cdsLocal.FieldByName('TCEMINPARC').AsInteger;
      iMaxParcelas := cdsLocal.FieldByName('TCEMAXPARC').AsInteger;

      if iIDREGRAPRAZOMAX > 0 then
      begin
        iMaxParcelas := BuscaPrazoContrato( IntToStr( iIDREGRAPRAZOMAX ),
                                            iIdTipoContrEmptmo,
                                            iIdTitular,
                                            //Pendência 27857 - 06/05/2008
                                            //iIdTitular,
                                            iIdBenef,
                                            //Fim Pendência 27857
                                            1,
                                            dDataInsc,
                                            bFlgExcepcional );
      end;
    end
    else
    begin
      iMinParcelas := 1;
      iMaxParcelas := 999;
    end;



    cdsLocal.Close;
  finally
    cdsLocal.Free;
  end;

end; {NumParcelas}


//Monta a página de Simulação de Empréstimos
function PaginaEmpSimulacao( iIdPessoaLocal : integer; Request: TWebRequest ) : String;
var

  //Dados do solicitante
  iIDTITULAR,
  iIDBENEF,
  iIDINSCRICAOPREV,
  iIDSITPART,
  iIDPESSJUR,
  iIDPLANOPREV : integer;
  sMATRICULA,
  sFLGINTERNO,
  sCPF,
  sCPF_TIT,
  sMATRICULA_TIT : String;

  //Parâmetros de empréstimo
  sFLGFORMAPAG,
  sFLGFORMAREC,
  sCODESTADO,
  sHORAENCERRA : String;
  iFLGTRATAASSINAT,
  iFLGPENDCONCESSAO,
  iIDITEMDEVSEGQUIT,
  iIDPAIS,
  iIDCIDADES,
  iIDESTADO : integer;
  bFLGEXCEPCIONAL : boolean;

  //Dados do tipo de contrato
  iIDTIPOCONTREMPTMO,
  iIDTIPOEMPTMO,
  iIDREGRAPRAZOSCONC,
  iIDREGRALIMITES,
  iTCEMAXINSCR,
  iTCEMAXCONTRATO : integer;
  sTCEDESCRICAO,
  sDESCTIPOEMPTMO,
  sMOESIGLA,
  sMOECODIGO : string;


  //Campos calculados ou recuperados na página de parametrização
  iMinParcelas,
  iMaxParcelas,
  iAntIdContratoEmptmo,
  iAntIdTipoContrEmptmo,
  iAntPrazo,
  iAntUltParcGerada,
  iAntNumParcPagas : integer;
  fSalPart,
  fSalMantido,
  fSalAuxDoenca,
  fSalBenef,
  fSalarioBase,
  fVlrMaxPermit,
  fVlrMargem,
  fValReserva,
  fTxJuros,
  fSaldoAQuitar,
  fQuitacao,
  fSaldoQuitacao,
  fVlrSolicitado,
  fAntValorSolic,
  fVlrDevSeg,
  fVlrSeguroAnt,
  fVlrSeguroComplAnt : Currency;
  dDtCredito,
  dAntDataCredito,
  dDataPrimParc : TDateTime;
  //Pendência 22248 - 01/08/2006
  iIDREGRAMARGEM  : integer;
  fTotalParcelas,
  fTotalPendencias : Currency;
  //Fim Pendência 22248

  sParc,
  sParcelas : string;

  i, iQtdeCampos, iLargura : integer;

  sAux,
  sTituloCampo,
  sTitCol,
  sDados,
  sValor,
  sClasse,
  sNomeCampo : string;

  dAgora : TDateTime;

  vLista : TListaItem;

  sArqLista : string;
  sMsgRestritiva : string;

  cdsLocal,
  cdsLista : TCMClientDataSet;

  //Pendência 24902 - 24/05/2007
  iSeqPasso : Integer;
  //Fim Pendência 24902

begin
  cdsLocal := TCMClientDataSet.Create( nil );
  cdsLista := TCMClientDataSet.Create( nil );
  try

    try

      sTitulo := TituloPagina( pEmpParcelas );

      //Recuperando valor solicitado.

      fVlrSolicitado := StrToCurr( StrSubst( Request.ContentFields.Values['empVlrSolicitado'], '.', '' ) );
      fSaldoAQuitar         := StrToCurr( Request.ContentFields.Values['empSaldoAQuitar'] );

      //Pendência 27857 - 05/05/2008
      //if fVlrSolicitado <= 0 then
      //  raise Exception.Create('Valor solicitado inválido.');
      //Fim Pendência 27857

      //Pendência 22248 - 08/08/2006
      if (iTipoCliente <> 19981) and (fVlrSolicitado < fSaldoAQuitar) then
      //Fim Pendência 22248
        raise Exception.Create('O valor solicitado não pode ser inferior ao saldo a quitar.');


      //Recupera parâmetros do empréstimo
      sFLGFORMAPAG      := Request.ContentFields.Values['empFLGFORMAPAG'];
      sFLGFORMAREC      := Request.ContentFields.Values['empFLGFORMAREC'];
      sCODESTADO        := Request.ContentFields.Values['empCODESTADO'];
      sHORAENCERRA      := Request.ContentFields.Values['empHORAENCERRA'];
      iFLGTRATAASSINAT  := StrToIntDef( Request.ContentFields.Values['empFLGTRATAASSINAT'], 0);
      iFLGPENDCONCESSAO := StrToIntDef( Request.ContentFields.Values['empFLGPENDCONCESSAO'], 0);
      iIDITEMDEVSEGQUIT := StrToIntDef( Request.ContentFields.Values['empIDITEMDEVSEGQUIT'], 0);
      iIDPAIS           := StrToIntDef( Request.ContentFields.Values['empIDPAIS'], 0);
      iIDCIDADES        := StrToIntDef( Request.ContentFields.Values['empIDCIDADES'], 0);
      iIDESTADO         := StrToIntDef( Request.ContentFields.Values['empIDESTADO'], 0);
      bFLGEXCEPCIONAL   := ( StrToIntDef( Request.ContentFields.Values['empFLGEXCEPCIONAL'], 0) = 1 );


      //Recupera dados do participante
      iIDTITULAR        := StrToIntDef( Request.ContentFields.Values['empIDTITULAR'], 0);
      iIDBENEF          := StrToIntDef( Request.ContentFields.Values['empIDBENEF'], 0);
      iIDINSCRICAOPREV  := StrToIntDef( Request.ContentFields.Values['empIDINSCRICAOPREV'], 0);
      iIDSITPART        := StrToIntDef( Request.ContentFields.Values['empIDSITPART'], 0);
      iIDPESSJUR        := StrToIntDef( Request.ContentFields.Values['empIDPESSJUR'], 0);
      iIDPLANOPREV      := StrToIntDef( Request.ContentFields.Values['empIDPLANOPREV'], 0);
      sMATRICULA        := Request.ContentFields.Values['empMATRICULA'];
      sFLGINTERNO       := Request.ContentFields.Values['empFLGINTERNO'];
      sCPF              := Request.ContentFields.Values['empCPF'];
      sCPF_TIT          := Request.ContentFields.Values['empCPF_TIT'];
      sMATRICULA_TIT    := Request.ContentFields.Values['empMATRICULA_TIT'];


      //Recupera dados do tipo de contrato
      iIDTIPOCONTREMPTMO := StrToIntDef( Request.ContentFields.Values['empIDTIPOCONTREMPTMO'], 0);
      iIDTIPOEMPTMO      := StrToIntDef( Request.ContentFields.Values['empIDTIPOEMPTMO'], 0);
      sTCEDESCRICAO      := Request.ContentFields.Values['TCEDESCRICAO'];
      sDESCTIPOEMPTMO    := Request.ContentFields.Values['DESCTIPOEMPTMO'];
      iIDREGRAPRAZOSCONC := StrToIntDef( Request.ContentFields.Values['empIDREGRAPRAZOSCONC'], 0);
      iIDREGRALIMITES    := StrToIntDef( Request.ContentFields.Values['empIDREGRALIMITES'], 0);
      sMOESIGLA          := Request.ContentFields.Values['MOESIGLA'];
      sMOECODIGO         := Request.ContentFields.Values['MOECODIGO'];
      iTCEMAXINSCR       := StrToIntDef( Request.ContentFields.Values['empTCEMAXINSCR'], 0);
      iTCEMAXCONTRATO    := StrToIntDef( Request.ContentFields.Values['empTCEMAXCONTRATO'], 0);


      //Recupera outras variáveis
      iMinParcelas          := StrToInt( Request.ContentFields.Values['empMinParcelas'] );
      iMaxParcelas          := StrToInt( Request.ContentFields.Values['empMaxParcelas'] );
      iAntIdContratoEmptmo  := StrToInt( Request.ContentFields.Values['empAntIdContratoEmptmo'] );
      iAntIdTipoContrEmptmo := StrToInt( Request.ContentFields.Values['empAntIdTipoContrEmptmo'] );
      iAntPrazo             := StrToInt( Request.ContentFields.Values['empAntPrazo'] );
      iAntUltParcGerada     := StrToInt( Request.ContentFields.Values['empAntUltParcGerada'] );
      iAntNumParcPagas      := StrToInt( Request.ContentFields.Values['empAntNumParcPagas'] );
      fSalPart              := StrToCurr( Request.ContentFields.Values['empSalPart'] );
      fSalMantido           := StrToCurr( Request.ContentFields.Values['empSalMantido'] );
      fSalAuxDoenca         := StrToCurr( Request.ContentFields.Values['empSalAuxDoenca'] );
      fSalBenef             := StrToCurr( Request.ContentFields.Values['empSalBenef'] );
      fSalarioBase          := StrToCurr( Request.ContentFields.Values['empSalarioBase'] );
      fVlrMaxPermit         := StrToCurr( Request.ContentFields.Values['empVlrMaxPermit'] );
      fVlrMargem            := StrToCurr( Request.ContentFields.Values['empMargem'] );
      fValReserva           := StrToCurr( Request.ContentFields.Values['empReserva'] );
      fTxJuros              := StrToCurr( Request.ContentFields.Values['empTxJuros'] );
      fQuitacao             := StrToCurr( Request.ContentFields.Values['empQuitacao'] );
      fSaldoQuitacao        := StrToCurr( Request.ContentFields.Values['empSaldoQuitacao'] );
      fAntValorSolic        := StrToCurr( Request.ContentFields.Values['empAntValorSolic'] );
      fVlrDevSeg            := StrToCurr( Request.ContentFields.Values['empVlrDevSeg'] );
      fVlrSeguroAnt         := StrToCurr( Request.ContentFields.Values['empVlrSeguroAnt'] );
      fVlrSeguroComplAnt    := StrToCurr( Request.ContentFields.Values['empVlrSeguroComplAnt'] );
      dDtCredito            := StrToDateTime( Request.ContentFields.Values['empDtCredito'] );
      dAntDataCredito       := StrToDateTime( Request.ContentFields.Values['empAntDataCredito'] );
      dDataPrimParc         := StrToDateTime( Request.ContentFields.Values['empDataPrimParc'] );

      //Recupera mensagens restritivas
      sMsgRestritiva        := trim( Request.ContentFields.Values['empMsgRestritiva'] );

      //Pendência 22248 - 01/08/2006
      iIDREGRAMARGEM        := StrToInt( Request.ContentFields.Values['empIDREGRAMARGEM'] );
      fTotalParcelas        := StrToCurr( Request.ContentFields.Values['empTotalParcelas'] );
      fTotalPendencias      := StrToCurr( Request.ContentFields.Values['empTotalPendencias'] );
      //Fim Pendência 22248

      //Pendência 24902 - 24/05/2007
      iSeqPasso := StrToIntDef( Request.ContentFields.Values['empSeqPasso'], 0) -1;
      //Fim Pendência 24902


      if TemAcessoCampo( sTipoUsuario, cEmpSimNumParcSimulaveis, sTituloCampo ) then
      begin
        for i := iMinParcelas to iMaxParcelas do
        begin
          sParc := trim( Request.ContentFields.Values['empParc' + IntToStr(i) ] );

          if sParc = '1' then
            sParcelas := sParcelas + IntToStr(i) + ';';
        end;
        sParcelas := StrLeft( sParcelas, length( sParcelas ) - 1 );
      end
      else
        sParcelas := Request.ContentFields.Values['empParcelas'];

      dAgora := WebEmprestimo.HoraServidor;

      if fVlrSolicitado > fVlrMaxPermit then
        Result := Result + '<p class="CORPO" align="center">O valor solicitado ultrapassa o valor máximo de contratação.</p><BR><BR>'
      else
      begin


        cdsLocal.Data := WebEmprestimo.SimulaEmprestimo( sParcelas,
                                                         iIDTIPOCONTREMPTMO,
                                                         iIdEmpresaProp,
                                                         iIDPAIS,
                                                         iIDCIDADES,
                                                         iAntIdTipoContrEmptmo,
                                                         sCODESTADO,
                                                         fSalPart,
                                                         fSalMantido,
                                                         fSalAuxDoenca,
                                                         fSalBenef,
                                                         fSalarioBase,
                                                         fVlrMaxPermit,
                                                         sMOESIGLA,
                                                         0,
                                                         fVlrMargem,
                                                         fValReserva,
                                                         fTxJuros,
                                                         fSaldoAQuitar,
                                                         fVlrSolicitado,
                                                         fQuitacao,
                                                         fSaldoQuitacao,
                                                         FormatDateTime( 'YYYYMM', dAgora ),
                                                         dDtCredito,
                                                         dAgora,
                                                         dAgora,
                                                         dDataPrimParc,
                                                         iIDSITPART,
                                                         iIDPESSJUR,
                                                         iIDPLANOPREV,
                                                         iIDTITULAR,
                                                         iIDBENEF,
                                                         bFLGEXCEPCIONAL,
                                                         iAntIdContratoEmptmo,
                                                         iAntPrazo,
                                                         fAntValorSolic,
                                                         dAntDataCredito,
                                                         iAntUltParcGerada,
                                                         iAntPrazo,
                                                         iAntNumParcPagas,
                                                         fVlrDevSeg,
                                                         fVlrSeguroAnt,
                                                         fVlrSeguroComplAnt,
                                                         0,
                                                         vLista
                                                         //Pendência 22248 - 01/08/2006
                                                         ,iIDREGRAMARGEM,
                                                         iTipoCliente,
                                                         fTotalParcelas,
                                                         fTotalPendencias,
                                                         iMaxParcelas,
                                                         sFLGINTERNO
                                                         //Fim Pendência 22248
                                                         );

        //Salva a lista em disco para posterior uso (se necessário)
        cdsLista.Data := WebEmprestimo.ListaItemToDataPacket( vLista );
        sArqLista := SaveDataset( cdsLista.Data );

        cdsLocal.IndexFieldNames := 'QTDE_PARC';

        cdsLocal.First;


        //Envia os dados para o próximo formulário
        if TemAcessoPagina( sTipoUsuario, pEmpParamEmptmo, sAux ) then
          sJavaScript :=
           ' function Confirma( )                                                                  ' + CR +
           ' {                                                                                     ' + CR +
           '   eval("document.frmLnkEmpParamEmptmo.btnConfirmar.style.display=''none''");          ' + CR +
           //Pendência 24902 - 24/05/2007
           '   eval("document.frmLnkEmpParamEmptmo.action=''../' + sNomeArqApl + '/EmpParamEmptmo''")' + CR +
           //Fim Pendência 24902
           '   EnviaForm( document.frmLnkEmpParamEmptmo );                                         ' + CR +
           ' }                                                                                     ' + CR ;

          //Pendência 24902 - 24/05/2007
          sJavaScript := sJavaScript +
           ' function Calcula( )                                                                   ' + CR +
           ' {                                                                                     ' + CR +
           '   eval("document.frmLnkEmpParamEmptmo.action=''../' + sNomeArqApl + '/EmpSimulacao''")' + CR +
           '   EnviaForm( document.frmLnkEmpParamEmptmo );                                         ' + CR +
           ' }                                                                                     ' + CR ;
          //Fim Pendência 24902

        //Quantidade de campos
        iQtdeCampos := cdsLocal.FieldCount;

        //Largura de cada coluna (em %)
        iLargura := Round( 100 / iQtdeCampos );

        sDados := '';

        //Monta o formulário
        Result := Result +
         '<form method="POST" name="frmLnkEmpParamEmptmo" action="../<#nomearqapl>/EmpParamEmptmo"> ' + CR +
         '  <table border="0" width="100%" cellpadding="0" cellspacing="0" class="FORMULARIO">            ' + CR +
         '    <tr>                                                                                        ' + CR +
         '      <td width="100%">                                                                         ' + CR ;

        //Pendência 24902 - 24/05/2007
        if TemAcessoCampo( sTipoUsuario, cEmpValorMaximo, sTituloCampo ) or
           TemAcessoCampo( sTipoUsuario, cEmpValorSolicitado, sTituloCampo ) then
        begin

           Result := Result +
           '        <table border="0" width="100%" cellpadding="0" cellspacing="0">                    ' + CR ;

           //Variáveis de montagem do formulário
           sIniLinha :=
           '          <tr class="CAMPOFORM">                                                   ' + CR +
           '            <td class="DESCCAMPO" width="50%" align="center" <#S> >                ' + CR ;
           sEntreCols :=
           '            </td>                                                                  ' + CR +
           '            <td class="DESCCAMPO">                                                 ' + CR ;
           sFimLinha :=
           '            </td>                                                                  ' + CR +
           '          </tr>                                                                    ' + CR ;
           sColFmt :=
           '              <#T>                                                                 ' + CR +
           '              <DIV class="CONTCAMPO">                                              ' + CR +
           '                <#C>                                                               ' + CR +
           '              </DIV>                                                               ' + CR ;

           //Pendência 24902 - 20/12/2007
           if fVlrSolicitado > fVlrMaxPermit then
              fVlrSolicitado := fVlrMaxPermit;

           Result := Result + MontaLinhaForm( cEmpValorMaximo,        FormatFloat( '#,##0.00', fVlrMaxPermit ),
                                              cEmpValorSolicitado,
                                              '<input type="text" name="empVlrSolicitado" size="20" ' +
                                              ' class="TEXT" maxlength="20" value="' +
                                              FormatFloat( '#,##0.00', fVlrSolicitado ) + '" > ' );

           Result := Result +
           '        </table>                                                                   ' + CR ;

        end;

        if TemAcessoCampo( sTipoUsuario, cEmpValorSolicitado, sTituloCampo ) then
        begin

           Result := Result +
           '        <table border="0" width="100%" cellpadding="0" cellspacing="0">                   ' + CR +
           '          <tr>                                                                            ' + CR +
           '            <td align="center">                                                           ' + CR +
           '              <a href="JavaScript:document.frmLnkEmpParamEmptmo.empSelecionado.value=0; Calcula();">' + CR +
           '              <img src="../imagem/btnPrestacoes.gif" name="btnCalcular" border="0"        ' + CR +
           '              onMouseOver="btnCalcular.src=''../imagem/btnPrestacoes_s.gif''"             ' + CR +
           '              onMouseOut="btnCalcular.src=''../imagem/btnPrestacoes.gif''"></a>           ' + CR +
           '            </td>                                                                         ' + CR +
           '          </tr>                                                                           ' + CR +
           '          <tr>                                                                            ' + CR +
           '            <td align="center">                                                           ' + CR +
           '          <br>                                                                            ' + CR +
           '          <p class="LINK">                                                                ' + CR +
           '          <a href="javascript:history.go(' + IntToStr(iSeqPasso) + ')">Voltar aos Parâmetros da Simulação</a>' + CR +
           '          </p>                                                                            ' + CR +
           '            </td>                                                                         ' + CR +
           '          </tr>                                                                           ' + CR +
           //'          <br>                                                                            ' + CR +
           '        </table><HR><BR>                                                                  ' + CR ;
        end;
        //Fim Pendência 24902

        //Monta o cabeçalho
        Result := Result +
         ' <table class="TABELA" border="0" width="100%" cellspacing="0" cellpadding="0"> ' + CR +
         '   <tr>                                                                         ' + CR ;

        for i := 0 to iQtdeCampos - 1 do
        begin
          sNomeCampo := trim( cdsLocal.Fields[i].FieldName );

          //Se for valor solicitado, da parcela ou valor líquido, não mostra o título
          if  ( sNomeCampo = 'VL_SOLIC'   )
           or ( sNomeCampo = 'VL_PARCELA' )
           or ( sNomeCampo = 'VL_LIQUIDO' ) then
          begin
              sDados := sDados +
               '<input type="hidden" name="empCalcTit_d' + sNomeCampo +
               '" value="' + cdsLocal.Fields[i].FieldName + '">' + CR;
             Continue;
          end;

          //Se for quantidade de parcelas, mostra mas muda o título...
          if sNomeCampo = 'QTDE_PARC' then
          begin
            sAux := 'dQTDE_PARC';
            sTitCol := 'Qtde. Parcelas';
          end
          else
          begin
            sAux := 'v' + StrRight( cdsLocal.Fields[i].FieldName, length( cdsLocal.Fields[i].FieldName ) - 1 );
            sTitCol := cdsLocal.FieldByName( sNomeCampo ).AsString;
          end;

          sDados := sDados +
           '<input type="hidden" name="empCalcTit_' + sAux +
           '" value="' + cdsLocal.FieldByName( sNomeCampo ).AsString + '">' + CR;

          Result := Result +
           '    <td width="' + IntToStr( iLargura ) + '%" class="TABLECAB" align="right"> ' + CR +
           sTitCol                                                                          + CR +
           '    </td>                                                                     ' ;
        end;

        Result := Result +
         '   </tr>                                                                        ' + CR ;

        cdsLocal.Next;

        while not cdsLocal.Eof do
        begin

          //Alterna as classes das linhas pares e ímpares
          if ( cdsLocal.RecNo mod 2 <> 0 ) then
            sClasse := 'TABLECONTIMPAR'
          else
            sClasse := 'TABLECONTPAR';

          Result := Result +
           '    <tr>                                                                      ' + CR ;

          for i := 0 to iQtdeCampos - 1 do
          begin

            sNomeCampo := trim( cdsLocal.Fields[i].FieldName );

            //Se for valor solicitado, da parcela ou valor líquido, não mostra (mas inclui o campo)
            if  ( sNomeCampo = 'VL_SOLIC'   )
             or ( sNomeCampo = 'VL_PARCELA' )
             or ( sNomeCampo = 'VL_LIQUIDO' ) then
            begin
              sDados := sDados +
               '<input type="hidden" name="empCalcDat_' + StrPadLeft( cdsLocal.FieldByName('QTDE_PARC').AsString, 3, '0' ) +
               '_d' + sNomeCampo + '" value="' + FormatFloat( '#,##0.00', cdsLocal.Fields[i].AsFloat ) + '">' + CR;
               Continue;
            end;

            Result := Result +
             '    <td width="' + IntToStr( iLargura ) + '%" class="'+ sClasse + '" align="right">' + CR ;

            //Se for a primeira coluna (qtde. parcelas), não formata
            if sNomeCampo = 'QTDE_PARC' then
              sValor := cdsLocal.Fields[i].AsString
            else
              sValor := FormatFloat( '#,##0.00', StrToFloat( OraNumeroInv( cdsLocal.Fields[i].AsString ) ) );

            //Prepara o link para inscricao e acrescenta os dados
            if TemAcessoPagina( sTipoUsuario, pEmpParamEmptmo, sAux ) then
            begin
              if sMsgRestritiva = '' then
                Result := Result + '<a href="JavaScript:document.frmLnkEmpParamEmptmo.empSelecionado.value=' +
                 cdsLocal.Fields[3].AsString + '; Confirma();"> ' + CR;

              if trim( cdsLocal.Fields[i].FieldName ) = 'QTDE_PARC' then
                sAux := 'dQTDE_PARC'
              else
                sAux := 'v' + StrRight( cdsLocal.Fields[i].FieldName, length( cdsLocal.Fields[i].FieldName ) - 1 );

              sDados := sDados +
               '<input type="hidden" name="empCalcDat_' + StrPadLeft( cdsLocal.FieldByName('QTDE_PARC').AsString, 3, '0' ) +
               '_' + sAux + '" value="' + sValor + '">' + CR;
            end;

            Result := Result + sValor;

            if TemAcessoPagina( sTipoUsuario, pEmpParamEmptmo, sAux ) then
              if sMsgRestritiva = '' then
                Result := Result +
                 '  </a>                                                                    ' + CR ;

            Result := Result +
             '    </td>                                                                   ' + CR;
          end;

          Result := Result +
           '    </tr>                                                                     ' + CR ;

          cdsLocal.Next;
        end;

        //Monta o rodapé
        Result := Result                                                                         +
         '        </table>                                                                ' + CR +
         '      </td>                                                                     ' + CR +
         '    </tr>                                                                       ' + CR ;

        //Monta o botão de inscrição e acrescenta os campos hidden
        if TemAcessoPagina( sTipoUsuario, pEmpParamEmptmo, sAux ) then
        begin
          if sMsgRestritiva = '' then
          begin
            Result := Result                                                                       +
             '    <tr>                                                                      ' + CR +
             '      <td align="center">                                                     ' + CR +
             '        <BR>                                                                  ' + CR +
             '        <a href="JavaScript:document.frmLnkEmpParamEmptmo.empSelecionado.value=0;'   +
             'Confirma();">                                                                 ' + CR +
             '         <img src="../imagem/btnConfirmar.gif" name="btnConfirmar" border="0" ' + CR +
             '          onMouseOver="btnConfirmar.src=''../imagem/btnConfirmar_s.gif''"     ' + CR +
             '          onMouseOut="btnConfirmar.src=''../imagem/btnConfirmar.gif''"></a>   ' + CR +
             '      </td>                                                                   ' + CR +
             '    </tr>                                                                     ' + CR ;

            Result := Result + sDados +
             '  </table>                                                              ' + CR +
             '  <input type="hidden" name="empSelecionado" value="0">                 ' + CR +
             '  <input type="hidden" name="empArqLista"    value="' + sArqLista + '"> ' + CR +
             '  <#hiddenfields>                                                       ' + CR ;

            for i := 0 to ( Request.ContentFields.Count - 1 ) do
              if StrLeft( Request.ContentFields.Names[i], 3 ) = 'emp' then
              //Pendência 24902 - 24/05/2007
              begin
                if StrPos(PChar(Result),PChar(Request.ContentFields.Names[i])) = nil then
                Result := Result +
                 '<input type="hidden" name="'  +
                 Request.ContentFields.Names[i] +
                 '" value="' +
                 Request.ContentFields.Values[ Request.ContentFields.Names[i] ] +
                 '"> ' + CR ;
              end;
              //Fim Pendência 24902
          end
          else
            Result := Result                                                                       +
             '    <tr>                                                                      ' + CR +
             '      <td align="center">                                                     ' + CR +
             '        <BR>                                                                  ' + CR +
             '<p class="CORPO">' + sMsgRestritiva + '</p>                                   ' + CR +
             '        <BR>                                                                  ' + CR +
             '      </td>                                                                   ' + CR +
             '    </tr>                                                                     ' + CR

        end;

        //Finaliza o formulário
        Result := Result +
        //Pendência 24902 - 24/05/2007
         '<input type="hidden" name="empSeqPasso" value="' + IntToStr(iSeqPasso) + '">    ' + CR +
        //Fim Pendência 24902
         '<BR>                                                                            ' + CR +
         '</form>                                                                         ' + CR ;

      end;

      Result := MontaPagina( pEmpParcelas, Result );

    except
      On E : Exception do
      begin
        Result := TrataWebExcecoes( E );
      end;
    end;

  finally
    cdsLocal.Free;
    cdsLista.Free;
  end;

end; {PaginaEmpSimulacao}


//Monta a página de Inscrição de Empréstimos
function PaginaEmpParamEmptmo( iIdPessoaLocal : integer; Request: TWebRequest ) : String;
var
  cdsAux : TCMClientDataset;

  sCampos : array of string;

  iIDBENEF,
  iFLGOBRIGAAVALISTA,
  iFLGOBRIGBENEF,
  iIDREGRAAVAL : integer;

  sTitCampo,
  sAux : string;

  i, j, k : integer;

  sTituloFormaPagto,
  sTituloFormaRecto,
  sTituloContaBancaria,
  sTituloCampo,
  sMaxParc,
  sCont,
  sType,
  sNomeCampo : string;

  iIDPESSJUR,
  iIDPLANOPREV : integer;

  sTCEDESCRICAO,
  sDESCTIPOEMPTMO,
  sPATRO,
  sPLANO,
  sTXJUROS,
  sDTCREDITO : string;

  bObrigaAvalista : boolean;

  sFLGINTERNO,
  sCODFORMAPAGTO,
  sPORTFORMARECTO,
  sPORTFORMAPAGTO,
  sFLGFORMAREC,
  sFLGFORMAPAG : string;

begin

  cdsAux := TCMClientDataset.Create( nil );
  try

    try

      sTitulo := TituloPagina( pEmpParamEmptmo );

      //Recupera as variáveis
      iIDBENEF           := StrToInt( Request.ContentFields.Values['empIDBENEF'] );
      sTCEDESCRICAO      := Request.ContentFields.Values['empTCEDESCRICAO'];
      sDESCTIPOEMPTMO    := Request.ContentFields.Values['empDESCTIPOEMPTMO'];
      iIDPESSJUR         := StrToInt( Request.ContentFields.Values['empIDPESSJUR'] );
      iIDPLANOPREV       := StrToInt( Request.ContentFields.Values['empIDPLANOPREV'] );
      sTXJUROS           := Request.ContentFields.Values['empTXJUROS'];
      sDTCREDITO         := Request.ContentFields.Values['empDTCREDITO'];
      iFLGOBRIGAAVALISTA := StrToInt( Request.ContentFields.Values['empFLGOBRIGAAVALISTA'] );
      iFLGOBRIGBENEF     := StrToInt( Request.ContentFields.Values['empFLGOBRIGBENEF'] );
      iIDREGRAAVAL       := StrToInt( Request.ContentFields.Values['empIDREGRAAVAL'] );


      //Recupera o nome da patrocinadora
      cdsAux.Close;
      cdsAux.Data := Pessoa.RecuperaNomePessoa( iIDPESSJUR );
      sPATRO := cdsAux.FieldByName('NOME').AsString;


      //Recupera os dados default de pagamento e recebimento
      cdsAux.Close;
      cdsAux.Data := WebEmprestimo.ParametrosEmprestimo( iIdEmpresaProp );
      sCODFORMAPAGTO  := trim( cdsAux.FieldByName('CODFORMAPAGTO').AsString );
      sPORTFORMARECTO := trim( cdsAux.FieldByName('PORTFORMARECTO').AsString );
      sPORTFORMAPAGTO := trim( cdsAux.FieldByName('PORTFORMAPAGTO').AsString );
      sFLGFORMAREC    := trim( cdsAux.FieldByName('FLGFORMAREC').AsString );
      sFLGFORMAPAG    := trim( cdsAux.FieldByName('FLGFORMAPAG').AsString );
      cdsAux.Close;



      //Recupera o nome do plano
      cdsAux.Close;
      cdsAux.Data := WebTransfPlano.RecuperaNomePlano( iIDPLANOPREV );
      sPLANO := cdsAux.FieldByName('NOME').AsString;
      cdsAux.Close;


      //Monta a rotina de preenchimento (em JavaScript)
      sJavaScript :=
       ' function SelFormaPagto( Tipo )                                            ' + CR +
       ' {                                                                         ' + CR +
       '  if( Tipo == ''F'' )                                                      ' + CR +
       '  { eval("divContaPag.style.display=''none''"); }                          ' + CR +
       '  else                                                                     ' + CR +
       '  { eval("divContaPag.style.display=''''"); }                              ' + CR +
       ' }                                                                         ' + CR +
       '                                                                           ' + CR +
       ' function SelFormaRecto( Tipo )                                            ' + CR +
       ' {                                                                         ' + CR +
       '  if( Tipo == ''F'' )                                                      ' + CR +
       '  { eval("divContaRec.style.display=''none''"); }                          ' + CR +
       '  else                                                                     ' + CR +
       '  { eval("divContaRec.style.display=''''"); }                              ' + CR +
       ' }                                                                         ' + CR +
       '                                                                           ' + CR +
       ' function MudaParcelas( )                                                  ' + CR +
       ' {                                                                         ' + CR +
       '   sNumParc = document.frmLnkEmpInscricao.cmbParcelas.value;               ' + CR ;


      //Recupera os títulos dos campos
      j := 0;
      for i := 0 to ( Request.ContentFields.Count - 1 ) do
      begin
        if StrLeft( Request.ContentFields.Names[i], 11 ) = 'empCalcTit_' then
        begin
          SetLength( sCampos, j + 1 );
          sAux := StrRight( Request.ContentFields.Names[i], length( Request.ContentFields.Names[i] ) - 11 );
          sCampos[j] := sAux + '@' + trim( Request.ContentFields.Values[Request.ContentFields.Names[i]] );
          if j <> 3 then
            sJavaScript := sJavaScript +
             '   document.frmLnkEmpInscricao.edt' + sAux +
             '.value = eval("document.frmLnkEmpInscricao.empCalcDat_" + sNumParc + "_' +
             sAux + '.value" ); ' + CR;

          Inc(j);
        end;
      end;

      sJavaScript := sJavaScript +
       '}                                                                                   ' + CR ;

      //Se não há campos
      if Length( sCampos ) = 0 then
        raise Exception.Create('Não é possível inscrever-se neste empréstimo.');

      //Monta o formulário
      Result := Result +
       '<form method="POST" name="frmLnkEmpInscricao" action="../<#nomearqapl>/EmpSalvaEmptmo"> ' + CR +
       '  <table border="0" width="100%" cellpadding="0" cellspacing="0" class="FORMULARIO">    ' + CR ;


      //Monta os campos
      for i := 0 to High( sCampos ) do
      begin

        //Se é a quantidade de parcelas...
        if i = 3 then
        begin

          sTitCampo := 'Qtde. Parcelas';

          //Monta o select
          sCont :=
           ' <select name="cmbParcelas" class="TEXT" onChange="MudaParcelas()">                 ' + CR ;

          //Varre os campos em busca dos dados calculados
          for k := 0 to ( Request.ContentFields.Count - 1 ) do
          begin

            //Se for um cálculo
            if   ( StrLeft(  Request.ContentFields.Names[k], 11 ) = 'empCalcDat_' )
             and ( StrRight( Request.ContentFields.Names[k], 10 ) = 'dQTDE_PARC'  ) then
            begin

              sCont := sCont +
               ' <option value="' + StrPadLeft( Request.ContentFields.Values[
               Request.ContentFields.Names[k] ], 3, '0' ) + '"';

              sCont := sCont + '>' + Request.ContentFields.Values[
               Request.ContentFields.Names[k] ] + '</option> ' + CR ;

              sMaxParc := Request.ContentFields.Values[ Request.ContentFields.Names[k] ];

            end;
          end;

          sCont := sCont +
           ' </select>                                                                          ' + CR ;
        end
        else
        begin
          sTitCampo  := StrRight( sCampos[i], length( sCampos[i] ) - Pos( '@', sCampos[i] ) );
          sNomeCampo := StrLeft( sCampos[i], Pos( '@', sCampos[i] ) - 1 );

          if  ( sNomeCampo = 'dVL_SOLIC'   )
           or ( sNomeCampo = 'dVL_PARCELA' )
           or ( sNomeCampo = 'dVL_LIQUIDO' ) then
            sType := 'hidden'
          else
            sType := 'text';


          //Se não, cria um campo
          sCont :=
           '        <input name="edt' + sNomeCampo + '" type="' + sType + '" readonly ' +
           ' value="' + sCampos[i] + '" class="NAOEDITAVEL" size="55"> ' + CR ;
        end;

        //Se for valor solicitado, da parcela ou valor líquido...
        if  ( i < 3) then
        begin
          Result := Result + sCont;
          Continue;
        end;

        //Se for par
        if ( i mod 2 ) = 0 then
          Result := Result +
           '    <tr class="CAMPOFORM">                                                             ' + CR +
           '      <td valign="top" class="DESCCAMPO" width="50%">                                  ' + CR +
           sTitCampo                                                                                 + CR +
           '        <BR>                                                                           ' + CR +
           sCont                                                                                     + CR +
           '      </td>                                                                            ' + CR
        else
          Result := Result +
           '      <td valign="top" class="DESCCAMPO">                                              ' + CR +
           sTitCampo                                                                                 + CR +
           '        <BR>                                                                           ' + CR +
           sCont                                                                                     + CR +
           '      </td>                                                                            ' + CR +
           '    </tr>                                                                              ' + CR ;

        j := i;
      end;

      //Se o último foi par
      if ( j mod 2 ) = 0 then
        Result := Result +
         '      <td>                                                                             ' + CR +
         '      </td>                                                                            ' + CR +
         '    </tr>                                                                              ' + CR ;



      Result := Result +
       '    <tr>                                                                                 ' + CR +
       '      <td colspan="2">                                                                   ' + CR +
       '        <hr>                                                                             ' + CR +
       '      </td>                                                                              ' + CR +
       '    </tr>                                                                                ' + CR ;



      //Variáveis de montagem do formulário
      sIniLinha :=
         '          <tr class="CAMPOFORM">                                                   ' + CR +
         '            <td class="DESCCAMPO" width="50%" <#S> >                               ' + CR ;

      sEntreCols :=
         '            </td>                                                                  ' + CR +
         '            <td class="DESCCAMPO">                                                 ' + CR ;

      sFimLinha :=
         '            </td>                                                                  ' + CR +
         '          </tr>                                                                    ' + CR ;

      sColFmt :=
       '              <#T>                                                                   ' + CR +
       '              <DIV class="CONTCAMPO">                                                ' + CR +
       '                <#C>                                                                 ' + CR +
       '              </DIV>                                                                 ' + CR ;


      Result := Result + MontaLinhaForm( cEmpInscTpContrato,    StrToName( sTCEDESCRICAO ),
                                         cEmpInscTpEmprestimo,  StrToName( sDESCTIPOEMPTMO ) );

      Result := Result + MontaLinhaForm( cEmpInscPatro,         StrToName( sPATRO ),
                                         cEmpInscPlano,         StrToName( sPLANO ) );

      Result := Result + MontaLinhaForm( cEmpInscDtCredito,     StrToName( sDTCREDITO ),
                                         cEmpInscTxJuros,       StrToName( sTXJUROS ) );


      if ( iFLGOBRIGBENEF = 1 ) and
         ( TemAcessoCampo( sTipoUsuario, cEmpInscBeneficiarioContrato, sTituloCampo ) ) then
      begin
        Result := Result +
         '    <tr>                                                                                               ' + CR +
         '      <td colspan="2">                                                                                 ' + CR +
         '        <hr>                                                                                           ' + CR +
         '      </td>                                                                                            ' + CR +
         '    </tr>                                                                                              ' + CR +
         '    <tr>                                                                                               ' + CR +
         '      <td class="DESCCAMPO" colspan="2">                                                               ' + CR +
         '        <br>                                                                                           ' + CR +
         sTituloCampo                                                                                                   +
         '        <br>                                                                                           ' + CR +
         '        <DIV class="BOXFORM">                                                                          ' + CR +
         '          <table border="0" width="720" cellspacing="0" cellpadding="0">                               ' + CR +
         '            <tr>                                                                                       ' + CR +
         '              <td class="DESCCAMPO" width="59%">                                                       ' + CR +
         '                Nome:<BR>                                                                              ' + CR +
         '                <input type="text" name="empNomeBenef" class="TEXT" size="70" maxlength="60">          ' + CR +
         '              </td>                                                                                    ' + CR +
         '              <td class="DESCCAMPO" width="13%">                                                       ' + CR +
         '                Percentual:<BR>                                                                        ' + CR +
         '                <input type="text" name="empPercBenef" class="TEXT" size="3" maxlength="5">            ' + CR +
         '              </td>                                                                                    ' + CR +
         '              <td class="DESCCAMPO" width="20%">                                                       ' + CR +
         '                Telefone:<BR>                                                                          ' + CR +
         '                <input type="text" name="empDDDBenef" class="TEXT" size="1" maxlength="3">             ' + CR +
         '                <input type="text" name="empTelBenef" class="TEXT" size="8" maxlength="8">             ' + CR +
         '              </td>                                                                                    ' + CR +
         '              <td class="DESCCAMPO" align="right">                                                     ' + CR +
         '                &nbsp;<BR>                                                                             ' + CR +
         '                <input type="button" value=" Incluir " onClick="JavaScript:Inclui();" ><BR><BR>        ' + CR +
         '              </td>                                                                                    ' + CR +
         '            </tr>                                                                                      ' + CR +
         '          </table>                                                                                     ' + CR +
         '        </DIV>                                                                                         ' + CR +
         '        <BR>                                                                                           ' + CR +
         '        <select name="empListaBenef" size="6" style="font-family: Courier New;                         ' +
         '                font-size: 12px; color: 663300">                                                       ' + CR +
         '          <option>' + FillStr( '&nbsp;', 87 ) + '</option>                                             ' + CR +
         '        </select> &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;                                     ' + CR +
         '        <input type="button" value="Excluir" onClick="JavaScript:Exclui();" ><BR><BR><BR>              ' + CR +
         '      </td>                                                                                            ' + CR +
         '    </tr>                                                                                              ' + CR ;
      end;

      bObrigaAvalista := ( sFLGINTERNO        = 'MA' ) and ( iFLGOBRIGAAVALISTA = 1    ) and
                         ( WebEmprestimo.VerificaObrigatoriedadeAvalista( iIDBENEF, iIDREGRAAVAL, iIdEmpresaProp ) );

      if bObrigaAvalista and TemAcessoCampo( sTipoUsuario, cEmpInscAvalistaContrato, sTituloCampo ) then
      begin
        Result := Result +
         '    <tr>                                                                   ' + CR +
         '      <td colspan="2">                                                     ' + CR +
         '        <hr>                                                               ' + CR +
         '      </td>                                                                ' + CR +
         '    </tr>                                                                  ' + CR +
         '    <tr class="CAMPOFORM">                                                  ' + CR +
         '      <td class="DESCCAMPO" colspan="2">                                   ' + CR +
         sTituloCampo                                                                       +
         '      <br>                                                                 ' + CR +
         '        <select name="empIdAvalista" size="1" class="TEXT">                ' + CR +
         '          <option value="-1">[Selecione um dos avalistas abaixo]</option>  ' + CR ;

        cdsAux.Close;
        cdsAux.Data := WebEmprestimo.Avalistas;

        cdsAux.First;
        while not cdsAux.Eof do
        begin
          Result := Result +
           '          <option value="' + cdsAux.FieldByName('IDAVALISTA').AsString + '">' +
           cdsAux.FieldByName('NOME').AsString + '</option>' + CR;
          cdsAux.Next;
        end;

        Result := Result +
         '      </select>                                                            ' + CR +
         '      </td>                                                                ' + CR +
         '    </tr>                                                                  ' + CR ;
      end;


      if TemAcessoCampo( sTipoUsuario, cEmpInscFormaPagto,       sAux ) or
         TemAcessoCampo( sTipoUsuario, cEmpInscFormaRecto,       sAux ) or
         TemAcessoCampo( sTipoUsuario, cEmpInscContaBancariaPag, sAux ) or
         TemAcessoCampo( sTipoUsuario, cEmpInscContaBancariaRec, sAux ) then
        Result := Result +
         '    <tr>                                                                     ' + CR +
         '      <td colspan="2">                                                       ' + CR +
         '        <hr>                                                                 ' + CR +
         '      </td>                                                                  ' + CR +
         '    </tr>                                                                    ' + CR ;

      Result := Result +
       '    <tr class="CAMPOFORM">                                                    ' + CR +
       '      <td class="DESCCAMPO" width="50%">                                     ' + CR ;


      //Forma de Pagamento
      if TemAcessoCampo( sTipoUsuario, cEmpInscFormaPagto, sTituloFormaPagto ) then
      begin
        Result := Result +
         sTituloFormaPagto                                                                    +
         '        <br>                                                                 ' + CR +
         '        <table border="0" width="260" cellpadding="0"                        ' + CR +
         '               cellspacing="0" class="FORMSIMTEXT">                          ' + CR +
         '          <tr>                                                               ' + CR +
         '            <td class="TEXT" width="5%" valign="middle">                     ' + CR +
         '              <input type="radio" name="rbFormaPagto" value="C"';

        if sFLGFORMAPAG = 'C' then Result := Result + ' checked ';

        Result := Result +
         ' onClick="JavaScript:SelFormaPagto(''C'');">                                 ' + CR +
         '            </td>                                                            ' + CR +
         '            <td class="TEXT" width="45%" valign="middle">                    ' + CR +
         '              Contas a Pagar                                                 ' + CR +
         '            </td>                                                            ' + CR +
         '            <td class="TEXT" width="5%" valign="middle">                     ' + CR +
         '              <input type="radio" name="rbFormaPagto" value="F"';

        if sFLGFORMAPAG = 'F' then Result := Result + ' checked ';

        Result := Result +
         ' onClick="JavaScript:SelFormaPagto(''F'');">                                 ' + CR +
         '            </td>                                                            ' + CR +
         '            <td class="TEXT" width="45%" valign="middle">                    ' + CR +
         '              Folha de Pagamento                                             ' + CR +
         '            </td>                                                            ' + CR +
         '          </tr>                                                              ' + CR +
         '        </table>                                                             ' + CR ;
      end
      else
        Result := Result +
         '        <input type="hidden" name="rbFormaPagto" value="' +
         sFLGFORMAPAG + '">' + CR;


      Result := Result +
       '      </td>                                                                  ' + CR +
       '      <td class="DESCCAMPO">                                                 ' + CR ;


      //Forma de Recebimento
      if TemAcessoCampo( sTipoUsuario, cEmpInscFormaRecto, sTituloFormaRecto ) then
      begin
        Result := Result +
         sTituloFormaRecto                                                                    +
         '        <br>                                                                 ' + CR +
         '        <table border="0" width="260" cellpadding="0"                        ' + CR +
         '               cellspacing="0" class="FORMSIMTEXT">              ' + CR +
         '          <tr>                                      ' + CR +
         '            <td class="TEXT" width="5%" valign="center">                     ' + CR +
         '              <input type="radio" name="rbFormaRecto" value="C"';

        if sFLGFORMAREC = 'C' then Result := Result + ' checked ';

        Result := Result +
         ' onClick="JavaScript:SelFormaRecto(''C'');">                                 ' + CR +
         '            </td>                                                            ' + CR +
         '            <td class="TEXT" width="45%" valign="middle">                    ' + CR +
         '              Contas a Receber                                               ' + CR +
         '            </td>                                                            ' + CR +
         '            <td class="TEXT" width="5%" valign="center">                     ' + CR +
         '              <input type="radio" name="rbFormaRecto" value="F"';

        if sFLGFORMAREC = 'F' then Result := Result + ' checked ';

        Result := Result +
         ' onClick="JavaScript:SelFormaRecto(''F'');">                                 ' + CR +
         '            </td>                                                            ' + CR +
         '            <td class="TEXT" width="45%" valign="middle">                    ' + CR +
         '              Folha de Pagamento                                             ' + CR +
         '            </td>                                                            ' + CR +
         '          </tr>                                                              ' + CR +
         '        </table>                                                             ' + CR ;
      end
      else
        Result := Result +
         '        <input type="hidden" name="rbFormaRecto" value="' +
         sFLGFORMAREC + '">' + CR;


      Result := Result +
       '      </td>                                                                  ' + CR +
       '    </tr>                                                                    ' + CR +
       '    <tr class="CAMPOFORM">                                                    ' + CR +
       '      <td class="DESCCAMPO" width="50%">                                     ' + CR +
       '        <div id="divContaPag" ';

      if sFLGFORMAPAG = 'F' then Result := Result + ' style="display: none" ';

      Result := Result + ' > ' + CR ;


      //Recupera as contas bancárias
      cdsAux.Close;
      cdsAux.Data := WebDadosCadastrais.SelecionaContasBancarias( iIdPessoaLocal );


      //Conta Bancária de Pagamento
      if TemAcessoCampo( sTipoUsuario, cEmpInscContaBancariaPag, sTituloContaBancaria ) then
      begin

        if not cdsAux.IsEmpty then
        begin

          Result := Result +
           sTituloContaBancaria                                                                 +
           '      <br>                                                                   ' + CR +
           '      <select name="cmbContaBancariaPag" class="TEXT">                       ' + CR ;

          cdsAux.First;
          while not cdsAux.Eof do
          begin
            Result := Result +
             '        <option value="' + cdsAux.FieldByName('IDCBANCARIA').AsString + '"';

            if cdsAux.FieldByName('FLGCONTAPREF').AsInteger = 1 then
              Result := Result + ' selected ';

            Result := Result +
             '>' + cdsAux.FieldByName('BANCO').AsString +
             '&nbsp;&nbsp;-&nbsp;&nbsp;Ag. ' + cdsAux.FieldByName('NUMAGENCIA').AsString +
             '&nbsp;&nbsp;-&nbsp;&nbsp;C.C. ' + trim( cdsAux.FieldByName('CONTACORRENTE').AsString ) +
             '</option>' + CR;

            cdsAux.Next;
          end;

          Result := Result +
           '        </select>                                                        ' + CR ;
        end;
      end
      else
      begin
        cdsAux.First;
        while not cdsAux.Eof do
        begin
          if cdsAux.FieldByName('FLGCONTAPREF').AsInteger = 1 then
           Result := Result +
            '        <input type="hidden" name="cmbContaBancariaPag" value="' +
            cdsAux.FieldByName('IDCBANCARIA').AsString + '">' + CR;

          cdsAux.Next;
        end;
      end;

      Result := Result +
       '        </div>                                                               ' + CR +
       '      </td>                                                                  ' + CR +
       '      <td class="DESCCAMPO">                                                 ' + CR +
       '        <div id="divContaRec" ';

      if sFLGFORMAREC = 'F' then Result := Result + ' style="display: none" ';

      Result := Result + ' > ' + CR ;


      //Conta Bancária de Recebimento
      if TemAcessoCampo( sTipoUsuario, cEmpInscContaBancariaRec, sTituloContaBancaria ) then
      begin

        if not cdsAux.IsEmpty then
        begin

          Result := Result +
           sTituloContaBancaria                                                                 +
           '      <br>                                                                   ' + CR +
           '      <select name="cmbContaBancariaRec" class="TEXT">                       ' + CR ;

          cdsAux.First;
          while not cdsAux.Eof do
          begin
            Result := Result +
             '        <option value="' + cdsAux.FieldByName('IDCBANCARIA').AsString + '"';

            if cdsAux.FieldByName('FLGCONTAPREF').AsInteger = 1 then
              Result := Result + ' selected ';

            Result := Result +
             '>' + cdsAux.FieldByName('BANCO').AsString +
             '&nbsp;&nbsp;-&nbsp;&nbsp;Ag. ' + cdsAux.FieldByName('NUMAGENCIA').AsString +
             '&nbsp;&nbsp;-&nbsp;&nbsp;C.C. ' + trim( cdsAux.FieldByName('CONTACORRENTE').AsString ) +
             '</option>' + CR;

            cdsAux.Next;
          end;

          Result := Result +
           '        </select>                                                         ' + CR ;
        end;
      end
      else
      begin
        cdsAux.First;
        while not cdsAux.Eof do
        begin
          if cdsAux.FieldByName('FLGCONTAPREF').AsInteger = 1 then
           Result := Result +
            '        <input type="hidden" name="cmbContaBancariaRec" value="' +
            cdsAux.FieldByName('IDCBANCARIA').AsString + '">' + CR;

          cdsAux.Next;
        end;
      end;

      cdsAux.Close;

      Result := Result +
       '        </div>                                                                ' + CR +
       '      </td>                                                                   ' + CR +
       '    </tr>                                                                     ' + CR ;


      //Monta o botão de inscrição e acrescenta os campos hidden
      if TemAcessoPagina( sTipoUsuario, pEmpInscricao,   sAux ) then
        Result := Result +
         '    <tr>                                                                            ' + CR +
         '      <td align="center" colspan="2">                                               ' + CR +
         '        <div id="divBtnInscricao">                                                  ' + CR +
         '          <a href="JavaScript:Confirma(1);">                                        ' + CR +
         '           <img src="../imagem/btnInscricao.gif" name="btnInscricao" border="0"     ' + CR +
         '            onMouseOver="btnInscricao.src=''../imagem/btnInscricao_s.gif''"         ' + CR +
         '            onMouseOut="btnInscricao.src=''../imagem/btnInscricao.gif''"></a></div> ' + CR +
         '      </td>                                                                         ' + CR +
         '    </tr>                                                                           ' + CR ;


      //Monta o botão de contratação e acrescenta os campos hidden
      if TemAcessoPagina( sTipoUsuario, pEmpContratacao,   sAux ) then
        Result := Result +
         '    <tr>                                                                                ' + CR +
         '      <td align="center" colspan="2">                                                   ' + CR +
         '        <div id="divBtnContratacao">                                                    ' + CR +
         '          <a href="JavaScript:Confirma(2);">                                            ' + CR +
         '           <img src="../imagem/btnContratacao.gif" name="btnContratacao" border="0"     ' + CR +
         '            onMouseOver="btnContratacao.src=''../imagem/btnContratacao_s.gif''"         ' + CR +
         '            onMouseOut="btnContratacao.src=''../imagem/btnContratacao.gif''"></a></div> ' + CR +
         '      </td>                                                                             ' + CR +
         '    </tr>                                                                               ' + CR ;

      Result := Result +
       '  </table>                                                                          ' + CR +
       '  <#hiddenfields>                                                                   ' + CR ;

      for i := 0 to ( Request.ContentFields.Count - 1 ) do
        if StrLeft( Request.ContentFields.Names[i], 3 ) = 'emp' then
          Result := Result +
           '<input type="hidden" name="'  +
           Request.ContentFields.Names[i] +
           '" value="' +
           Request.ContentFields.Values[ Request.ContentFields.Names[i] ] +
           '"> ' + CR ;

      Result := Result +
       '  <input type="hidden" name="empCODFORMAPAGTO"  value="' + sCODFORMAPAGTO  + '"> ' + CR +
       '  <input type="hidden" name="empPORTFORMARECTO" value="' + sPORTFORMARECTO + '"> ' + CR +
       '  <input type="hidden" name="empPORTFORMAPAGTO" value="' + sPORTFORMAPAGTO + '"> ' + CR +
       '  <input type="hidden" name="empTipoGravacao"                                  > ' + CR +
       '  <input type="hidden" name="empObrigaAvalista" value="' + iff( bObrigaAvalista, '1', '0' ) + '"> ' + CR +
       '  <input type="hidden" name="empBeneficiarios"                                 > ' + CR +
       '</form>                                                                          ' + CR +
       '<SCRIPT language="JavaScript">                                                   ' + CR +
       '  if ( document.frmLnkEmpInscricao.empSelecionado.value == "0" )                 ' + CR +
       '  {                                                                              ' + CR +
       '    document.frmLnkEmpInscricao.cmbParcelas.value = "' +
       StrPadLeft( sMaxParc, 3, '0' ) + '";                                              ' + CR +
       '  }                                                                              ' + CR +
       '  else                                                                           ' + CR +
       '  {                                                                              ' + CR +
       '    document.frmLnkEmpInscricao.cmbParcelas.value = "' +
       StrPadLeft( Request.ContentFields.Values['empSelecionado'], 3, '0' ) + '";        ' + CR +
       '  }                                                                              ' + CR +
       '  MudaParcelas( );                                                               ' + CR +
       '</script>                                                                        ' + CR ;


      if iFLGOBRIGBENEF = 1 then
       sJavaScript := sJavaScript +
        ' function trim( TRIM_VALUE )                                                                                                                      ' + CR +
        ' {                                                                                                                                                ' + CR +
        '   if( TRIM_VALUE.length < 1 )                                                                                                                    ' + CR +
        '     { return""; }                                                                                                                                ' + CR +
        '   TRIM_VALUE = rtrim(TRIM_VALUE);                                                                                                                ' + CR +
        '   TRIM_VALUE = ltrim(TRIM_VALUE);                                                                                                                ' + CR +
        '   if( TRIM_VALUE == "" )                                                                                                                         ' + CR +
        '     { return ""; }                                                                                                                               ' + CR +
        '   else                                                                                                                                           ' + CR +
        '     { return TRIM_VALUE; }                                                                                                                       ' + CR +
        ' }                                                                                                                                                ' + CR +
        '                                                                                                                                                  ' + CR +
      ' function rtrim( VALUE )                                                                                                                          ' + CR +
        ' {                                                                                                                                                ' + CR +
        '   var v_length = VALUE.length;                                                                                                                   ' + CR +
        '   var strTemp = "";                                                                                                                              ' + CR +
        '   if(v_length < 0)                                                                                                                               ' + CR +
        '     { return""; }                                                                                                                                ' + CR +
        '   var iTemp = v_length - 1;                                                                                                                      ' + CR +
        '   while( iTemp > -1 )                                                                                                                            ' + CR +
        '   {                                                                                                                                              ' + CR +
        '     if( ( VALUE.charAt(iTemp) == String.fromCharCode(32) ) || ( VALUE.charAt(iTemp) == String.fromCharCode(160) ) )                              ' + CR +
        '     { }                                                                                                                                          ' + CR +
        '     else                                                                                                                                         ' + CR +
        '     {                                                                                                                                            ' + CR +
        '       strTemp = VALUE.substring( 0, iTemp + 1 );                                                                                                 ' + CR +
        '       break;                                                                                                                                     ' + CR +
        '     }                                                                                                                                            ' + CR +
        '     iTemp = iTemp - 1;                                                                                                                           ' + CR +
        '   } //End While                                                                                                                                  ' + CR +
        '   return strTemp;                                                                                                                                ' + CR +
        ' }                                                                                                                                                ' + CR +
        '                                                                                                                                                  ' + CR +
        ' function ltrim( VALUE )                                                                                                                          ' + CR +
        ' {                                                                                                                                                ' + CR +
        '   if( v_length < 1 )                                                                                                                             ' + CR +
        '     { return""; }                                                                                                                                ' + CR +
        '   var v_length = VALUE.length;                                                                                                                   ' + CR +
        '   var strTemp = "";                                                                                                                              ' + CR +
        '   var iTemp = 0;                                                                                                                                 ' + CR +
        '   while( iTemp < v_length )                                                                                                                      ' + CR +
        '   {                                                                                                                                              ' + CR +
        '     if( ( VALUE.charAt(iTemp) == String.fromCharCode(32) ) || ( VALUE.charAt(iTemp) == String.fromCharCode(160) ) )                              ' + CR +
        '     { }                                                                                                                                          ' + CR +
        '     else                                                                                                                                         ' + CR +
        '     {                                                                                                                                            ' + CR +
        '       strTemp = VALUE.substring(iTemp,v_length);                                                                                                 ' + CR +
        '       break;                                                                                                                                     ' + CR +
        '     }                                                                                                                                            ' + CR +
        '     iTemp = iTemp + 1;                                                                                                                           ' + CR +
        '   } //End While                                                                                                                                  ' + CR +
        '   return strTemp;                                                                                                                                ' + CR +
        ' }                                                                                                                                                ' + CR +
        '                                                                                                                                                  ' + CR +
        ' function FillStr( _str, n )                                                                                                                      ' + CR +
        ' {                                                                                                                                                ' + CR +
        '   sFill = "";                                                                                                                                    ' + CR +
        '   for ( var i = 0; i < n ; i++ )                                                                                                                 ' + CR +
        '     { sFill = sFill + _str; }                                                                                                                    ' + CR +
        '   return sFill;                                                                                                                                  ' + CR +
        ' }                                                                                                                                                ' + CR +
        '                                                                                                                                                  ' + CR +
        ' function StrPadR( _str, n, _c )                                                                                                                  ' + CR +
        ' {                                                                                                                                                ' + CR +
        '  sAux = _str;                                                                                                                                    ' + CR +
        '  while ( sAux.length < n )                                                                                                                       ' + CR +
        '  { sAux = sAux + _c; }                                                                                                                           ' + CR +
        '  return sAux;                                                                                                                                    ' + CR +
        ' }                                                                                                                                                ' + CR +
        '                                                                                                                                                  ' + CR +
        '  function Inclui( )                                                                                                                              ' + CR +
        '  {                                                                                                                                               ' + CR +
        '    strNomeBenef = trim( frmLnkEmpInscricao.empNomeBenef.value );                                                                                 ' + CR +
        '    strPercBenef = trim( frmLnkEmpInscricao.empPercBenef.value.replace(".", ",") );                                                               ' + CR +
        '    strDDDBenef  = StrPadR( trim( frmLnkEmpInscricao.empDDDBenef.value ), 3, " " );                                                               ' + CR +
        '    strTelBenef  = StrPadR( trim( frmLnkEmpInscricao.empTelBenef.value ), 8, " " );                                                               ' + CR +
        '                                                                                                                                                  ' + CR +
        '    if ( strNomeBenef == "" )                                                                                                                     ' + CR +
        '    {                                                                                                                                             ' + CR +
        '      alert("Preencha o nome do beneficiário.");                                                                                                  ' + CR +
        '      frmLnkEmpInscricao.empNomeBenef.focus();                                                                                                    ' + CR +
        '      exit;                                                                                                                                       ' + CR +
        '    }                                                                                                                                             ' + CR +
        '                                                                                                                                                  ' + CR +
        '    if ( strPercBenef == "" )                                                                                                                     ' + CR +
        '    {                                                                                                                                             ' + CR +
        '      alert("Preencha o percentual do beneficiário.");                                                                                            ' + CR +
        '      frmLnkEmpInscricao.empPercBenef.focus();                                                                                                    ' + CR +
        '      exit;                                                                                                                                       ' + CR +
        '    }                                                                                                                                             ' + CR +
        '                                                                                                                                                  ' + CR +
        '    for( var j = 0; j < frmLnkEmpInscricao.empNomeBenef.value.length ; j ++ )                                                                     ' + CR +
        '    {                                                                                                                                             ' + CR +
        '      c = frmLnkEmpInscricao.empNomeBenef.value.charAt(j);                                                                                        ' + CR +
        '      if ( ( c == ";" ) || ( c == "%" ) )                                                                                                         ' + CR +
        '      {                                                                                                                                           ' + CR +
        '        alert( "Caracter inválido no nome do Beneficiário." );                                                                                    ' + CR +
        '        frmLnkEmpInscricao.empNomeBenef.focus();                                                                                                  ' + CR +
        '        exit;                                                                                                                                     ' + CR +
        '      }                                                                                                                                           ' + CR +
        '    }                                                                                                                                             ' + CR +
        '                                                                                                                                                  ' + CR +
        '    for( var i = 0; i < frmLnkEmpInscricao.empListaBenef.length ; i++ )                                                                           ' + CR +
        '    {                                                                                                                                             ' + CR +
        '      strNomeNaLista = trim( frmLnkEmpInscricao.empListaBenef.options[i].text.substr( 0, 60 ).toUpperCase() );                                    ' + CR +
        '      if ( strNomeNaLista == strNomeBenef.toUpperCase() )                                                                                         ' + CR +
        '      {                                                                                                                                           ' + CR +
        '        alert( "Beneficiário já incluído." );                                                                                                     ' + CR +
        '        frmLnkEmpInscricao.empNomeBenef.focus();                                                                                                  ' + CR +
        '        exit;                                                                                                                                     ' + CR +
        '      }                                                                                                                                           ' + CR +
        '    }                                                                                                                                             ' + CR +
        '                                                                                                                                                  ' + CR +
        '    if( isNaN( strPercBenef.replace(",", ".") ) ||                                                                                                ' + CR +
        '        ( parseFloat( strPercBenef.replace(",", ".") ) <= 0 ) || ( parseFloat( strPercBenef.replace(",", ".") ) > 100 ) )                         ' + CR +
        '    {                                                                                                                                             ' + CR +
        '      alert( "Percentual inválido." );                                                                                                            ' + CR +
        '      frmLnkEmpInscricao.empPercBenef.focus();                                                                                                    ' + CR +
        '      exit;                                                                                                                                       ' + CR +
        '    }                                                                                                                                             ' + CR +
        '                                                                                                                                                  ' + CR +
        '    for( var j = 0; j < frmLnkEmpInscricao.empDDDBenef.value.length ; j ++ )                                                                      ' + CR +
        '    {                                                                                                                                             ' + CR +
        '      c = frmLnkEmpInscricao.empDDDBenef.value.charAt(j);                                                                                         ' + CR +
        '      if ( ( c == ";" ) || ( c == "%" ) )                                                                                                         ' + CR +
        '      {                                                                                                                                           ' + CR +
        '        alert( "Caracter inválido no DDD do Beneficiário." );                                                                                     ' + CR +
        '        frmLnkEmpInscricao.empDDDBenef.focus();                                                                                                   ' + CR +
        '        exit;                                                                                                                                     ' + CR +
        '      }                                                                                                                                           ' + CR +
        '    }                                                                                                                                             ' + CR +
        '                                                                                                                                                  ' + CR +
        '    for( var j = 0; j < frmLnkEmpInscricao.empTelBenef.value.length ; j ++ )                                                                      ' + CR +
        '    {                                                                                                                                             ' + CR +
        '      c = frmLnkEmpInscricao.empTelBenef.value.charAt(j);                                                                                         ' + CR +
        '      if ( ( c == ";" ) || ( c == "%" ) )                                                                                                         ' + CR +
        '      {                                                                                                                                           ' + CR +
        '        alert( "Caracter inválido no telefone do Beneficiário." );                                                                                ' + CR +
        '        frmLnkEmpInscricao.empTelBenef.focus();                                                                                                   ' + CR +
        '        exit;                                                                                                                                     ' + CR +
        '      }                                                                                                                                           ' + CR +
        '    }                                                                                                                                             ' + CR +
        '                                                                                                                                                  ' + CR +
        '    strNovo = strNomeBenef + FillStr( " ", 66 - strNomeBenef.length - strPercBenef.length ) + strPercBenef + "%" +                                ' + CR +
        '                             FillStr( " ",  8 ) + strDDDBenef + " " + strTelBenef;                                                                ' + CR +
        '                                                                                                                                                  ' + CR +
        '    strAux = trim( frmLnkEmpInscricao.empListaBenef.options[0].text );                                                                            ' + CR +
        '    if ( strAux  == "" )                                                                                                                          ' + CR +
        '    {                                                                                                                                             ' + CR +
        '      i = 0;                                                                                                                                      ' + CR +
        '    }                                                                                                                                             ' + CR +
        '    else                                                                                                                                          ' + CR +
        '    {                                                                                                                                             ' + CR +
        '      frmLnkEmpInscricao.empListaBenef.length = frmLnkEmpInscricao.empListaBenef.length + 1;                                                      ' + CR +
        '      i = frmLnkEmpInscricao.empListaBenef.length - 1;                                                                                            ' + CR +
        '    }                                                                                                                                             ' + CR +
        '    frmLnkEmpInscricao.empListaBenef.options[i].text = strNovo;                                                                                   ' + CR +
        '    frmLnkEmpInscricao.empNomeBenef.value = "";                                                                                                   ' + CR +
        '    frmLnkEmpInscricao.empPercBenef.value = "";                                                                                                   ' + CR +
        '    frmLnkEmpInscricao.empDDDBenef.value  = "";                                                                                                   ' + CR +
        '    frmLnkEmpInscricao.empTelBenef.value  = "";                                                                                                   ' + CR +
        '  }                                                                                                                                               ' + CR +
        '                                                                                                                                                  ' + CR +
        '  function Exclui( )                                                                                                                              ' + CR +
        '  {                                                                                                                                               ' + CR +
        '    for ( var i= ( frmLnkEmpInscricao.empListaBenef.options.length - 1); i >= 0; i-- )                                                            ' + CR +
        '    {                                                                                                                                             ' + CR +
        '      var o = frmLnkEmpInscricao.empListaBenef.options[i];                                                                                        ' + CR +
        '      if ( o.selected )                                                                                                                           ' + CR +
        '      {                                                                                                                                           ' + CR +
        '        frmLnkEmpInscricao.empListaBenef.options[i] = null;                                                                                       ' + CR +
        '      }                                                                                                                                           ' + CR +
        '    }                                                                                                                                             ' + CR +
        '    if ( frmLnkEmpInscricao.empListaBenef.options.length == 0 )                                                                                   ' + CR +
        '    {                                                                                                                                             ' + CR +
        '      frmLnkEmpInscricao.empListaBenef.length = 1;                                                                                                ' + CR +
        '      frmLnkEmpInscricao.empListaBenef.options[0].text = FillStr( " ", 87 );                                                                      ' + CR +
        '    }                                                                                                                                             ' + CR +
        '  }                                                                                                                                               ' + CR ;


      sJavaScript := sJavaScript +
       ' function Confirma( iTipoGravacao )                                                   ' + CR +
       ' {                                                                                    ' + CR ;

      if iFLGOBRIGBENEF = 1 then
        sJavaScript := sJavaScript +
         '   if ( ( frmLnkEmpInscricao.empListaBenef.length == 1 ) && ( trim( frmLnkEmpInscricao.empListaBenef.options[0].text ) == "" ) ) ' + CR +
         '   {                                                                                                                            ' + CR +
         '     alert( "É obrigatória a indicação dos beneficiários." );                                                                   ' + CR +
         '     frmLnkEmpInscricao.empNomeBenef.focus();                                                                                   ' + CR +
         '     exit;                                                                                                                      ' + CR +
         '   }                                                                                                                            ' + CR +
         '                                                                                                                                ' + CR +
         '   var TotalPerc = 0;                                                                                                           ' + CR +
         '   for ( var i = 0; i < frmLnkEmpInscricao.empListaBenef.length; i++ )                                                          ' + CR +
         '   {                                                                                                                            ' + CR +
         '      s = frmLnkEmpInscricao.empListaBenef.options[i].text.substr( 61, 5 ).replace(",", ".");                                   ' + CR +
         '      TotalPerc = TotalPerc + parseFloat( s );                                                                                  ' + CR +
         '   }                                                                                                                            ' + CR +
         '   if ( TotalPerc != 100 )                                                                                                      ' + CR +
         '   {                                                                                                                            ' + CR +
         '     alert( "A soma dos percentuais dos beneficiários deve ser 100%." );                                                        ' + CR +
         '     frmLnkEmpInscricao.empListaBenef.focus();                                                                                  ' + CR +
         '     exit;                                                                                                                      ' + CR +
         '   }                                                                                                                            ' + CR +
         '                                                                                                                                ' + CR +
         '   s = "";                                                                                                                      ' + CR +
         '   for ( var i = 0; i < frmLnkEmpInscricao.empListaBenef.length; i++ )                                                          ' + CR +
         '   {                                                                                                                            ' + CR +
         '     if ( s != "" ) { s = s + ";" }                                                                                             ' + CR +
         '      s = s + trim( frmLnkEmpInscricao.empListaBenef.options[i].text.substr( 0, 60 ) )                   + "%" +                ' + CR +
         '              trim( frmLnkEmpInscricao.empListaBenef.options[i].text.substr( 61, 5 ) ).replace(",", ".") + "%" +                ' + CR +
         '              trim( frmLnkEmpInscricao.empListaBenef.options[i].text.substr( 75, 3 ) )                   + "%" +                ' + CR +
         '              trim( frmLnkEmpInscricao.empListaBenef.options[i].text.substr( 79, 8 ) );                                         ' + CR +
         '   }                                                                                                                            ' + CR +
         '  frmLnkEmpInscricao.empBeneficiarios.value = s;                                                                                ' + CR ;

      sJavaScript := sJavaScript +
       '   document.frmLnkEmpInscricao.empTipoGravacao.value = iTipoGravacao;       ' + CR ;

      //Esconde o botão de inscrição
      if TemAcessoPagina( sTipoUsuario, pEmpInscricao,   sAux ) then
        sJavaScript := sJavaScript +
         '   eval("divBtnInscricao.style.display=''none''"); ' + CR ;

      //Esconde o botão de contratação e acrescenta os campos hidden
      if TemAcessoPagina( sTipoUsuario, pEmpContratacao,   sAux ) then
        sJavaScript := sJavaScript +
         '   eval("divBtnContratacao.style.display=''none''"); ' + CR ;

      sJavaScript := sJavaScript +
       '   EnviaForm( document.frmLnkEmpInscricao );                                ' + CR +
       ' }                                                                          ' + CR ;

      Result := MontaPagina( pEmpParamEmptmo, Result );

    except
      On E : Exception do
      begin
        Result := TrataWebExcecoes( E );
      end;
    end;

  finally
    cdsAux.Free;
  end;

end; {PaginaEmpParamEmptmo}


function PaginaEmpSalvaEmptmo( iIdPessoaLocal : integer; iTipoGravacao : integer; Request: TWebRequest ) : String;
var


  sFormaPagto,
  sFormaRecto,
  sContaBancariaPag,
  sContaBancariaRec,
  sCODFORMAPAGTO,
  sPORTFORMARECTO,
  sPORTFORMAPAGTO : string;

  cdsItens,
  cdsAvalista,
  cdsContratosAnteriores,
  cdsLista,
  cdsResponsavel,
  cdsRealizado : TCMClientDataset;

  iIdInscricaoEmptmo,
  iIdContratoEmptmo : extended;

  iIdTipoEmptmo,
  iIdTipoContrEmptmo,
  i,
  iIdItemEmptmo,
  iIdResponsavel,
  iIdRegraCalc : integer;

  oEstrutura : OleVariant;

  fRendaComp : currency;

  iIdTitular,
  iIdBenef : integer;
  fPendencias,
  fSaldoAQuitar,
  fVlrSolicitado,
  fVlrParcelas,
  fSalPart,
  fSalMantido,
  fSalAuxDoenca,
  fSalBenef,
  fSalarioBase,
  fMargem,
  fReserva,
  fVlrParcCalc,
  fVlrLiquidoEP : Currency;
  iParcelas,
  iIdSitPart,
  iIdRegraLimites,
  iIdPlanoPrev,
  iIdPatro,
  iNUMPARCDESCONTO : integer;
  dDataFinalBeneficio,
  dDtCredito,
  dDataPrimParc : TDateTime;
  fVLRSALBASE,
  fQuitacao,
  fVlrMaxPermit,
  fTxJuros : currency;
  bFlgExcepcional,
  bFLGCONCULTDIAMES : boolean;
  iFLGDATAATUSLD,
  iFLGCALCDIA,
  iFLGCONTROLAINSC,
  iFLGSALDODEVANT,
  iFLGUSAFIARIO,
  iFLGABONODIVERG, 
  iFLGESTORNOPOSQUIT,
  iFLGQUITAPARCMORTE,
  iIDITEMPROVPERDA,
  iTEPMAXCONTRATO,
  iIDPAIS,
  iIDCIDADES,
  iIdAvalista : integer;
  sBeneficiarios,
  sFLGINTERNO,
  sCODESTADO,
  sMoeCodigo,
  sMoeSigla,
  sFLGFORMAPAG,
  sFLGFORMAREC : string;
  bObrigaAvalista : boolean;
  iQtdEPQuitado : integer;

  iQtdeItensEmptmo,
  iQtdeParcelasEmAberto,
  iPlanoAjuste : integer;
  iIdUltHistMovEmptmo : extended;

  dSysDate : TDateTime;

  vLista : TListaItem;

  rNovoContrato: TDadosContrato;

  sMsgAux : string;

  iIDREGRAPLANOCOB : integer; //Pendência 26775 - 26/12/2007

  //Pendência 26916 - 21/12/2007
  iTCEMAXCONTRATO,
  iQtdIDTIPOEMPTMO,
  iQtdIDTIPOCONTREMPTMO : Integer;
  //Fim Pendência 26916

  //Pendência 27232 e 27749 - 17/04/2008
  iFLGVERIFICAITEMABERTO,
  iFLGNAOVERIFICAMRGPCL : Integer;
  //Fim Pendência 27232 e 27749

begin

  cdsItens := TCMClientDataset.Create( nil );
  try

    try

      iIdTitular            := StrToInt( Request.ContentFields.Values['empIDTITULAR'] );
      iIdBenef              := StrToInt( Request.ContentFields.Values['empIDBENEF'] );
      sFormaPagto           := trim( Request.ContentFields.Values['rbFormaPagto'] );
      sFormaRecto           := trim( Request.ContentFields.Values['rbFormaRecto'] );
      sContaBancariaPag     := trim( Request.ContentFields.Values['cmbContaBancariaPag'] );
      sContaBancariaRec     := trim( Request.ContentFields.Values['cmbContaBancariaRec'] );
      sCODFORMAPAGTO        := trim( Request.ContentFields.Values['empCODFORMAPAGTO'] );
      sPORTFORMARECTO       := trim( Request.ContentFields.Values['empPORTFORMARECTO'] );
      sPORTFORMAPAGTO       := trim( Request.ContentFields.Values['empPORTFORMAPAGTO'] );
      iIdTipoEmptmo         := StrToInt( Request.ContentFields.Values['empIdTipoEmptmo'] );
      iIdTipoContrEmptmo    := StrToInt( Request.ContentFields.Values['empIdTipoContrEmptmo'] );
      fVlrSolicitado        := StrToFloat( StrSubst( Request.ContentFields.Values['edtdVL_SOLIC'], '.', '' ) );
      fVlrParcelas          := StrToFloat( StrSubst( Request.ContentFields.Values['empVlrTotalParcelas'], '.', '' ) );
      fMargem               := StrToFloat( StrSubst( Request.ContentFields.Values['empMargem'], '.', '' ) );
      fReserva              := StrToFloat( StrSubst( Request.ContentFields.Values['empReserva'], '.', '' ) );
      iParcelas             := StrToInt( Request.ContentFields.Values['cmbParcelas'] );
      iIdSitPart            := StrToInt( Request.ContentFields.Values['empIdSitPart'] );
      iIdRegraLimites       := StrToIntDef( Request.ContentFields.Values['empIdRegraLimites'], 0 );
      dDataFinalBeneficio   := StrToDate( Request.ContentFields.Values['empDataFinalBeneficio'] );
      fSaldoAQuitar         := StrToCurr( Request.ContentFields.Values['empSaldoAQuitar'] );
      fPendencias           := StrToCurr( Request.ContentFields.Values['empVlrTotalPendencias'] );
      fVlrParcCalc          := StrToCurr( StrSubst( Request.ContentFields.Values['edtdVL_PARCELA'], '.', '' ) );
      fVlrLiquidoEP         := StrToCurr( StrSubst( Request.ContentFields.Values['edtdVL_LIQUIDO'], '.', '' ) );
      fSalPart              := StrToCurr( StrSubst( Request.ContentFields.Values['empSalPart'], '.', '' ) );
      fSalMantido           := StrToCurr( StrSubst( Request.ContentFields.Values['empSalMantido'], '.', '' ) );
      fSalAuxDoenca         := StrToCurr( StrSubst( Request.ContentFields.Values['empSalAuxDoenca'], '.', '' ) );
      fSalBenef             := StrToCurr( StrSubst( Request.ContentFields.Values['empSalBenef'], '.', '' ) );
      fSalarioBase          := StrToCurr( Request.ContentFields.Values['empSalarioBase'] );
      fVlrMaxPermit         := StrToFloat( StrSubst( Request.ContentFields.Values['empVlrMaxPermit'], '.', '' ) );
      fTxJuros              := StrToFloat( StrSubst( Request.ContentFields.Values['empTxJuros'], '.', '' ) );
      dDtCredito            := StrToDate( Request.ContentFields.Values['empDtCredito'] );
      dDataPrimParc         := StrToDate( Request.ContentFields.Values['empDataPrimParc'] );
      bFlgExcepcional       := ( StrToIntDef( Request.ContentFields.Values['empFLGEXCEPCIONAL'], 0) = 1 );
      bFLGCONCULTDIAMES     := ( StrToIntDef( Request.ContentFields.Values['empFLGCONCULTDIAMES'], 0) = 1 );
      iFLGDATAATUSLD        := StrToInt( Request.ContentFields.Values['empFLGDATAATUSLD'] );
      iFLGCALCDIA           := StrToInt( Request.ContentFields.Values['empFLGCALCDIA'] );
      iFLGCONTROLAINSC      := StrToInt( Request.ContentFields.Values['empFLGCONTROLAINSC'] );
      iFLGSALDODEVANT       := StrToInt( Request.ContentFields.Values['empFLGSALDODEVANT'] );
      iFLGUSAFIARIO         := StrToInt( Request.ContentFields.Values['empFLGUSAFIARIO'] );
      iFLGABONODIVERG       := StrToInt( Request.ContentFields.Values['empFLGABONODIVERG'] );
      iFLGESTORNOPOSQUIT    := StrToInt( Request.ContentFields.Values['empFLGESTORNOPOSQUIT'] );
      iFLGQUITAPARCMORTE    := StrToInt( Request.ContentFields.Values['empFLGQUITAPARCMORTE'] );
      iIDITEMPROVPERDA      := StrToInt( Request.ContentFields.Values['empIDITEMPROVPERDA'] );
      iTEPMAXCONTRATO       := StrToInt( Request.ContentFields.Values['empTEPMAXCONTRATO'] );
      //Pendência 26916 - 21/12/2007
      iTCEMAXCONTRATO       := StrToInt( Request.ContentFields.Values['empTCEMAXCONTRATO'] );
      //Fim Pendência 26916
      iIDPAIS               := StrToInt( Request.ContentFields.Values['empIDPAIS'] );
      iIDCIDADES            := StrToInt( Request.ContentFields.Values['empIDCIDADES'] );
      sCODESTADO            := trim( Request.ContentFields.Values['empCODESTADO'] );
      sMoeCodigo            := trim( Request.ContentFields.Values['empMOECODIGO'] );
      sMoeSigla             := trim( Request.ContentFields.Values['empMOESIGLA'] );
      sFLGFORMAPAG          := Request.ContentFields.Values['rbFormaPagto'];
      sFLGFORMAREC          := Request.ContentFields.Values['rbFormaRecto'];
      sFLGINTERNO           := trim( Request.ContentFields.Values['empFLGINTERNO'] );
      iIdAvalista           := StrToIntDef( Request.ContentFields.Values['empIdAvalista'], 0 );
      sBeneficiarios        := trim( Request.ContentFields.Values['empBeneficiarios'] );
      iIdPlanoPrev          := StrToInt( Request.ContentFields.Values['empIdPlanoPrev'] );
      iIdPatro              := StrToInt( Request.ContentFields.Values['empIdPessJur'] );
      iNUMPARCDESCONTO      := StrToInt( Request.ContentFields.Values['empNUMPARCDESCONTO'] );
      fVLRSALBASE           := StrToFloat( StrSubst( Request.ContentFields.Values['empSalarioBase'], '.', '' ) );
      fQuitacao             := StrToCurr( Request.ContentFields.Values['empQuitacao'] );
      bObrigaAvalista       := ( trim( Request.ContentFields.Values['empObrigaAvalista'] ) = '1' );
      iQtdEPQuitado         := StrToIntDef( Request.ContentFields.Values['empQtdEPQuitado'], 0 );
      iQtdeItensEmptmo      := StrToIntDef( Request.ContentFields.Values['empQtdeItensEmptmo'], 0 );
      iQtdeParcelasEmAberto := StrToIntDef( Request.ContentFields.Values['empQtdeParcelasEmAberto'], 0 );
      iIdUltHistMovEmptmo   := StrToFloat( Request.ContentFields.Values['empIdUltHistMovEmptmo'] );

      //Pendência 26775 - 26/12/2007
      iIDREGRAPLANOCOB      := StrToIntDef( Request.ContentFields.Values['empIDREGRAPLANOCOB'], 0 );

      //Pendência 27232 e 27749 - 17/04/2008
      iFLGVERIFICAITEMABERTO:= StrToInt( Request.ContentFields.Values['empFlgVerificaItemAberto'] );
      iFLGNAOVERIFICAMRGPCL := StrToInt( Request.ContentFields.Values['empFlgNaoVerificaMrgPcl'] );
      //Fim Pendência 27232 e 27749

      //Valida preenchimento dos campos
      if trim( sFormaPagto ) = '' then
        raise Exception.Create('A Forma de Recebimento da Conecessão deve ser informada.');

      if trim( sFormaRecto ) = '' then
        raise Exception.Create('A Forma de Pagamento das Prestações deve ser informada.');

      if fVlrLiquidoEP <= 0 then
        raise Exception.Create('Valor a ser creditado inválido.');

      //----- Validação da Inscrição -----//


      // ----------------------------------------------------------------------------------------------
      // Verifica se existe existe concessão de outro contrato para o mesmo dia ou posterior
      if not( WebEmprestimo.VerificaConcessaoIgualPosterior( iIdTitular ,
                                                             iIdBenef   ,
                                                             dDtCredito ,
                                                             True ) ) then
        raise Exception.Create('Já existe outro contrato concedido para data posterior.' );
      // ----------------------------------------------------------------------------------------------

      //Aqui roda a regra de limites...
      if not WebEmprestimo.BuscaLimites( iIdTitular,
                                         iIdBenef,
                                         iIdTipoEmptmo,
                                         iIdTipoContrEmptmo,
                                         fVlrSolicitado,
                                         fVlrParcCalc,
                                         iParcelas,
                                         0,
                                         iIdSitPart,
                                         iIdRegraLimites,
                                         dDataFinalBeneficio,
                                         fMargem,
                                         fReserva,
                                         fSaldoAQuitar,
                                         fVlrParcelas,
                                         fPendencias,
                                         Now,
                                         fVlrLiquidoEP,
                                         iIdEmpresaProp,
                                         fSalarioBase ) then
        raise Exception.Create('Empréstimo não passou na Regra de Limites.');

      //Pendência 27857 - 05/05/2008
      if {( qryTipoContratoFLGCONCESSAOZERO.Value = 1 ) and}
            ( fSaldoAQuitar = 0 ) and
            ( fVlrLiquidoEP = 0 ) then
        raise Exception.Create('O valor líquido de concessão deve ser maior que ZERO!');

      {if ( qryTipoContratoFLGOBRIGACONCZERO.Value = 1 ) and
         ( edtLiquidoGeral.Value <> 0 ) then
        raise Exception.Create('O valor líquido de concessão deve ser igual a ZERO!');}

      if ( fVlrLiquidoEP < 0 ) then
        raise Exception.Create('O valor líquido de concessão não pode ser menor que ZERO!');
      //Fim Pendência 27857

      //Prepara o dataset de itens
      cdsItens.Data := HistMovInscricao.SelecionaHistMovInscricao( 0 );

      //Loop dos itens
      for i := 0 to ( Request.ContentFields.Count - 1 ) do
      begin
        if StrLeft( Request.ContentFields.Names[i], 4 ) = 'edtv' then
        begin

          iIdItemEmptmo := StrToInt( StrRight( Request.ContentFields.Names[i],
           length( Request.ContentFields.Names[i] ) - 4 ) );

          //Recupera o ID da regra
          cdsAux.Close;
          cdsAux.Data := WebEmprestimo.ItemXTipoContrato(
           StrToInt( Request.ContentFields.Values['empIdTipoContrEmptmo'] ),
           iIdItemEmptmo );
          iIdRegraCalc := cdsAux.FieldByName('IDREGRACALC').AsInteger;
          cdsAux.Close;

          //Insere o registro
          cdsItens.Insert;

          //Altera os campos
          cdsItens.FieldByName('IDHISTMOVINSC').AsString      := '';
          cdsItens.FieldByName('IDREGRA').AsInteger           := iIdRegraCalc;
          cdsItens.FieldByName('IDINSCRICAOEMPTMO').AsString  := '';
          cdsItens.FieldByName('IDITEMEMPTMO').AsInteger      := iIdItemEmptmo;
          cdsItens.FieldByName('HMIVLRPREVISTO').AsString     := StrSubst(
           Request.ContentFields.Values[Request.ContentFields.Names[i]], '.', '' );

          //Confirma os dados
          cdsItens.Post;

        end;
      end;

      if iTipoGravacao = 1 then
      begin
        //---------------------------------------------------------------------------------- Inscrição

        iIdInscricaoEmptmo := WebEmprestimo.InscreveEmptmo(  iIdTipoContrEmptmo,
                                                             iIdTipoEmptmo,
                                                             iIdPatro,
                                                             iIdPlanoPrev,
                                                             iIdTitular,
                                                             iIdBenef,
                                                             iParcelas,
                                                             iIdEmpresaProp,
                                                             sFLGFORMAPAG,
                                                             sFLGFORMAREC,
                                                             sCODFORMAPAGTO,
                                                             sPORTFORMAPAGTO,
                                                             sPORTFORMARECTO,
                                                             sContaBancariaPag,
                                                             sContaBancariaRec,
                                                             sMoeCodigo,
                                                             dDtCredito,
                                                             fVlrSolicitado,
                                                             fVLRSALBASE,
                                                             fMargem,
                                                             fVlrMaxPermit,
                                                             fTxJuros,
                                                             iIdAvalista,
                                                             sBeneficiarios,
                                                             True,
                                                             cdsItens.Data );

        if ( iIdInscricaoEmptmo <= 0 ) then
          raise Exception.Create( sMsgCtrl )
        else
        begin
          if WebEmprestimo.InTransaction then
            WebEmprestimo.Rollback;

          cdsRealizado := TCMClientDataset.Create( nil );
          try
            cdsRealizado.Data := InscricaoEmptmo.SelecionaDadosInscricao( iIdBenef, iIdTitular, iIdInscricaoEmptmo, '', 0, 0 );

            if cdsRealizado.IsEmpty then
              raise Exception.Create('Houve um erro ao tentar localizar os dados da inscrição ' + FloatToStr( iIdInscricaoEmptmo ) + '.'  )
            else
            begin
              GravaTxt( sLogDir + 'Inscrição em Empréstimo ' + FloatToStr( iIdInscricaoEmptmo ) + '.txt',
               'A inscrição em empréstimo ' + FloatToStr( iIdInscricaoEmptmo ) + ' foi salva em ' + FormatDateTime( 'dd/mm/yyyy', Now ) + ', às ' +
               FormatDateTime( 'hh:mm:ss', Now ) + '.' + CR + CR +
               'IDTITULAR: ' + cdsRealizado.FieldByName('IDPESSOA').AsString + CR +
               'IDBENEF: ' + cdsRealizado.FieldByName('IDBENEF').AsString + CR +
               'Valor solicitado: ' + FormatFloat( '#,##0.00', cdsRealizado.FieldByName('VLRSOLIC').AsFloat ) + CR +
               'No. Parcelas: ' + cdsRealizado.FieldByName('NUMPARCELAS').AsString + CR +
               'Data de Crédito: ' + FormatDateTime( 'dd/mm/yyyy', cdsRealizado.FieldByName('DATACREDITO').AsDateTime ) + CR +
               'Conta Bancária de Pagamento: Selecionada: ' + sContaBancariaPag + '; Gravada: ' + cdsRealizado.FieldByName('IDCBANCARIA').AsString );
            end;

          finally
            cdsRealizado.Free;
          end;

        end;


        //---------- Montagem da página de confirmação de inscrição
        sTitulo := TituloPagina( pEmpInscricao );

        Result := Result +
         '  <table border="0" width="100%" cellpadding="0" cellspacing="0"          ' + CR +
         '         class="FORMULARIO">                                              ' + CR +
         DadosInscricao( iIdInscricaoEmptmo, iIdBenef, iIdTitular )                               + CR +
         '  </table>                                                                ' + CR +
         '  <BR><BR>                                                                ' + CR ;

        Result := MontaPagina( pEmpInscricao, Result );

      end
      else
      begin
        //-------------------------------------------------------------------------------- Contratação


        cdsContratosAnteriores := TCMClientDataset.Create( nil );
        cdsLista            := TCMClientDataset.Create( nil );

        try

          //Valida contrato

          //Pendência 26916 - 21/12/2007
          cdsContratosAnteriores.LoadFromFile( Request.ContentFields.Values['empArqContratosAnteriores'] );

          // Verifica se o participante excedeu o número máximo de contrato,
          // logo ele será alertado que enquanto não Quitar quantidade
          // suficiente de contratos anteriores, NÃO poderá contratar este empréstimo
          iQtdIDTIPOEMPTMO      := 0;
          iQtdIDTIPOCONTREMPTMO := 0;

          cdsContratosAnteriores.First;

          while not cdsContratosAnteriores.EOF do
          begin

            if cdsContratosAnteriores.FieldByName('FLGESCOLHA').AsInteger <> 1 then
            begin

                if ( cdsContratosAnteriores.FieldByName('IDTIPOEMPTMO').AsInteger = iIdTipoEmptmo ) then
                     iQtdIDTIPOEMPTMO := iQtdIDTIPOEMPTMO + 1;

                if ( cdsContratosAnteriores.FieldByName('IDTIPOCONTREMPTMO').AsInteger = iIdTipoContrEmptmo ) then
                     iQtdIDTIPOCONTREMPTMO := iQtdIDTIPOCONTREMPTMO + 1;

            end;

            cdsContratosAnteriores.Next;

          end;

          if ( iTCEMAXCONTRATO <= iQtdIDTIPOCONTREMPTMO ) or
             ( iTEPMAXCONTRATO <= iQtdIDTIPOEMPTMO ) then
          begin
            sMsgAux := 'Este empréstimo quitará parcelas de contratos anteriores.';
          end;


          //Verifica se o usuário possui suspensão de concessâo anterior.
          if WebEmprestimo.PossuiSuspensaoConcessao( iIdBenef, dDtCredito ) then
            raise Exception.Create('Mutuário possui suspensão de concessão anterior e não pode contratar este empréstimo.');

          //Verifica se permite concessão no ultimo dia util do mes
          if bFLGCONCULTDIAMES and EhUltimoDiaUtilMes( Now, iIDCIDADES, iIDPAIS, sCODESTADO ) then
            raise Exception.Create( 'Não é permitido concessão no último dia útil do mês.' );


          // -------------------------------------------------------------------------------------------
          //Pendência 27749 - 17/04/2008
          {
          if bFlgExcepcional then
          begin
            if not( iIdTipoContrEmptmo in [11, 12, 13, 14, 15, 16]) then
            begin
              // ----------------------------------------------------------------------------------
              if ( ( fVlrParcCalc > fMargem ) ) then
              begin
                if bFlgExcepcional then
                  raise Exception.Create( 'Para a contratação, é exigida margem consignável com base na renda básica, descontadas parcelas obrigatórias e facultativas.' )
                else
                  raise Exception.Create( 'Valor da prestação não pode ser superior a margem consignável.' );
              end;
            end
            else
            begin
              // ----------------------------------------------------------------------------------
              if not( WebEmprestimo.VerificaContratoAtivo( iIdTitular, iIdBenef, iIdTipoContrEmptmo, -1 ) ) then
                Exit;
              // ----------------------------------------------------------------------------------
            end;
          end
          else
          }
          if ( ( not bFlgExcepcional ) or
               ( iFLGNAOVERIFICAMRGPCL = 0 ) ) then
          //Fim Pendência 27749
          begin
             if ( ( fVlrParcCalc > fMargem ) ) then
             begin
               //if bFlgExcepcional then
               //  raise Exception.Create( 'Para a contratação, é exigida margem consignável com base na renda básica, descontadas parcelas obrigatórias e facultativas.' )
               //else
                 raise Exception.Create( 'Valor da prestação não pode ser superior a margem consignável.' );
             end;
          end;
          // -------------------------------------------------------------------------------------------

          if bObrigaAvalista then
          begin
            if iIdAvalista <= 0 then
              raise Exception.Create ('É necessário indicar o avalista,' );

            fRendaComp := 0;

            cdsAvalista := TCMClientDataset.Create( nil );
            try
              cdsAvalista.Data := WebEmprestimo.DadosAvalista( iIdAvalista );

              fRendaComp := cdsAvalista.FieldByName('RENDACOMP').AsCurrency;

              if fRendaComp < fVLRSALBASE then
                raise Exception.Create( 'A renda do avalista deve ser igual ou superior ao salário base do Mutuário.' );

            finally
              cdsAvalista.Free;
            end;

          end;

          cdsResponsavel := TCMClientDataset.Create( nil );
          try
            cdsResponsavel.Data := WebEmprestimo.Responsavel( iIdTitular, iIdBenef );
            iIdResponsavel := -1;
            if not cdsResponsavel.IsEmpty then
              iIdResponsavel := cdsResponsavel.FieldByName('IDRESPONSAVEL').AsInteger;
          finally
            cdsResponsavel.Free;
          end;

          LimpaRegistroContrato( rNovoContrato );

          dSysDate := SysDate( WebEmprestimo );

          rNovoContrato.IDContratoEmptmo  := WebEmprestimo.SeqContrato;
          rNovoContrato.IDContrQuitacao   := -1;
          rNovoContrato.IDInscricaoEmptmo := -1;
          rNovoContrato.IDTipoEmptmo      := iIdTipoEmptmo;
          rNovoContrato.IDTipoContrEmptmo := iIdTipoContrEmptmo;
          rNovoContrato.IDPessoa          := iIdTitular;
          rNovoContrato.IDBenef           := iIdBenef;
          rNovoContrato.IDSitPart         := iIdSitPart;
          rNovoContrato.IDPlanoPrev       := iIdPlanoPrev;
          rNovoContrato.IDPlanoOrigem     := iIdPlanoPrev;

          // ----------------------------------------------------------------------------------------------
          // 12/12/2005 - pendência 20912 (ou 20848)
          if bFlgExcepcional then
          begin
            iPlanoAjuste                  := WebEmprestimo.AcertaPlanoOrigem( -1,
                                                                              rNovoContrato.IDBenef,
                                                                              rNovoContrato.IDPlanoPrev,
                                                                              bFlgExcepcional,
                                                                              False );

             if iPlanoAjuste > 0 then
                rNovoContrato.IDPlanoOrigem   := iPlanoAjuste;
          end;
          // FIM pendência 20912 (ou 20848)
          // ----------------------------------------------------------------------------------------------

          rNovoContrato.IDPatro           := iIdPatro;
          rNovoContrato.IDResponsavel     := iIdResponsavel;
          rNovoContrato.NumParcelas       := iParcelas;
          rNovoContrato.fValMargem        := 0;
          rNovoContrato.fValReserva       := fReserva;
          rNovoContrato.fSalParticipacao  := fSalPart;
          rNovoContrato.fSalMantido       := fSalMantido;
          rNovoContrato.fSalAuxDoenca     := fSalAuxDoenca;
          rNovoContrato.fSalBenef         := fSalBenef;
          rNovoContrato.VlrSalBase        := fVLRSALBASE;
          rNovoContrato.VlrMargem         := fMargem;
          rNovoContrato.VlrMaxPermit      := fVlrMaxPermit;
          rNovoContrato.DataInscricao     := dSysDate;
          rNovoContrato.DataAssinatura    := dSysDate;
          rNovoContrato.DataCredito       := dDtCredito;
          rNovoContrato.DataPrimParc      := dDataPrimParc;
          rNovoContrato.DataCanc          := 0;
          rNovoContrato.DataValidade      := 0;
          rNovoContrato.DataSaldoDev      := 0;
          rNovoContrato.DataPendencia     := 0;
          rNovoContrato.DataSituacao      := dSysDate;
          rNovoContrato.TxJuros           := fTxJuros;
          rNovoContrato.VlrContrato       := fVlrSolicitado;
          rNovoContrato.VlrParcela        := fVlrParcCalc;
          rNovoContrato.VlrParcelaMes     := fVlrParcelas;
          rNovoContrato.VlrParcelaAtraso  := fPendencias;
          rNovoContrato.VlrDebito         := 0;
          rNovoContrato.VlrReserva        := fReserva;
          rNovoContrato.VlrSaldoDev       := 0;
          rNovoContrato.VlrPendencia      := fPendencias;
          rNovoContrato.IDVerba           := -1;
          rNovoContrato.IDCBancaria       := StrToInt( sContaBancariaPag );
          rNovoContrato.IDCBancariaDeb    := StrToInt( sContaBancariaRec );
          rNovoContrato.IDFornCred        := -1; //Pendência Auto-Empréstimo - 30/10/2007
          rNovoContrato.CodFormaPag       := StrToInt( sCODFORMAPAGTO );
          rNovoContrato.PortFormaPag      := StrToInt( sPORTFORMAPAGTO );
          rNovoContrato.PortFormaRec      := StrToInt( sPORTFORMARECTO );
          rNovoContrato.Indexador         := StrToInt( sMoeCodigo );
          rNovoContrato.SiglaIndexador    := sMoeSigla;
          rNovoContrato.FlgFormaPag       := sFLGFORMAPAG;
          rNovoContrato.FlgFormaRec       := sFLGFORMAREC;
          rNovoContrato.FlgSituacao       := 'A';
          rNovoContrato.NumParcDesconto   := iNUMPARCDESCONTO;
          rNovoContrato.FlgExcepcional    := iff( bFlgExcepcional, 1, 0 );
          rNovoContrato.FlgFinanciamento  := 0;

          if iFLGCONTROLAINSC = 1 then
            rNovoContrato.FlgSituacao     := 'P';

          //Pendência 26916 - 21/12/2007
          //cdsContratosAnteriores.LoadFromFile( Request.ContentFields.Values['empArqContratosAnteriores'] );
          //Fim Pendência 26916
          cdsLista.LoadFromFile( Request.ContentFields.Values['empArqLista'] );

          WebEmprestimo.DataPacketToListaItem( cdsLista.Data, iParcelas, sFLGFORMAPAG, vLista );

          //Pendência 26775 - 26/12/2007
          if iIDREGRAPLANOCOB <> 0 then
             rNovoContrato.IDPlanoCob := WebEmprestimo.IdentificaPlanoCobranca( iIDREGRAPLANOCOB,
                                                                                rNovoContrato.IDPessoa,
                                                                                rNovoContrato.IDPlanoPrev,
                                                                                iIdEmpresaProp )
          else
             rNovoContrato.IDPlanoCob := -1;
          //Fim Pendência 26775

          //Faz a contratação do empréstimo
          iIdContratoEmptmo := WebEmprestimo.ContrataEmptmo( rNovoContrato,
                                                             vLista,
                                                             cdsContratosAnteriores.Data,
                                                             iFLGCALCDIA,
                                                             iFLGSALDODEVANT,
                                                             iTEPMAXCONTRATO,
                                                             dDtCredito,
                                                             fVlrLiquidoEP,
                                                             fSaldoAQuitar,
                                                             iIdEmpresaProp,
                                                             iIdTipoEmptmo,
                                                             iIdTipoContrEmptmo,
                                                             iFLGUSAFIARIO,
                                                             iFLGESTORNOPOSQUIT,
                                                             iFLGQUITAPARCMORTE,
                                                             iFLGDATAATUSLD,
                                                             iIDITEMPROVPERDA,
                                                             0,
                                                             460,
                                                             '',
                                                             sFLGFORMAPAG,
                                                             sFLGFORMAREC,
                                                             sCODFORMAPAGTO,
                                                             sPORTFORMAPAGTO,
                                                             sPORTFORMARECTO,
                                                             sContaBancariaPag,
                                                             sContaBancariaRec,
                                                             iIdAvalista,
                                                             sBeneficiarios,
                                                             bFlgExcepcional,
                                                             iFLGABONODIVERG,
                                                             iTipoCliente,
                                                             iQtdeItensEmptmo,
                                                             iQtdeParcelasEmAberto,
                                                             iIdUltHistMovEmptmo,
                                                             cdsItens.Data,
                                                             iIdInscricaoEmptmo );

          if ( iIdContratoEmptmo  <= 0 ) or
             ( iIdInscricaoEmptmo <= 0 ) then
            raise Exception.Create( sMsgCtrl )
          else
          begin
            if WebEmprestimo.InTransaction then
              WebEmprestimo.Rollback;

            cdsRealizado := TCMClientDataset.Create( nil );
            try
              cdsRealizado.Data := WebEmprestimo.ConsultaContrato( iIdBenef, iIdContratoEmptmo, '', 0, 0 );

              if cdsRealizado.IsEmpty then
                raise Exception.Create('Houve um erro ao tentar localizar os dados do contrato ' + FloatToStr( iIdContratoEmptmo ) +
                 ' (inscrição ' + FloatToStr( iIdInscricaoEmptmo ) + ').'  )
              else
              begin
                GravaTxt( sLogDir + 'Contratação do Empréstimo ' + FloatToStr( iIdContratoEmptmo ) + '.txt',
                 'O contrato de empréstimo ' + FloatToStr( iIdContratoEmptmo ) + ', inscrição ' +
                 FloatToStr( iIdInscricaoEmptmo ) + ', foi salvo em ' + FormatDateTime( 'dd/mm/yyyy', Now ) + ', às ' +
                 FormatDateTime( 'hh:mm:ss', Now ) + '.' + CR + CR +
                 'IDTITULAR: ' + cdsRealizado.FieldByName('IDPESSOA').AsString + CR +
                 'IDBENEF: ' + cdsRealizado.FieldByName('IDBENEF').AsString + CR +
                 'Valor solicitado: ' + FormatFloat( '#,##0.00', cdsRealizado.FieldByName('VLRCONTRATO').AsFloat ) + CR +
                 'No. Parcelas: ' + cdsRealizado.FieldByName('NUMPARCELAS').AsString + CR +
                 'Data de Crédito: ' + FormatDateTime( 'dd/mm/yyyy', cdsRealizado.FieldByName('DATACREDITO').AsDateTime ) );
              end;

            finally
              cdsRealizado.Free;
            end;

          end;

          //---------- Montagem da página de confirmação de contratação
          sTitulo := TituloPagina( pEmpContratacao );

          Result := Result +
           '  <table border="0" width="100%" cellpadding="0" cellspacing="0"          ' + CR +
           '         class="FORMULARIO">                                              ' + CR +
           DadosContrato( iIdContratoEmptmo, iIdInscricaoEmptmo, iIdBenef, iIdTitular )             + CR +
           '  </table>                                                                ' + CR +
           '  <BR><BR>                                                                ' + CR ;

          Result := MontaPagina( pEmpContratacao, Result );

        finally
          cdsContratosAnteriores.Free;
          cdsLista.Free;
        end;

      end;

    except
      On E : Exception do
      begin
        Result := TrataWebExcecoes( E );
      end;
    end;

  finally
    cdsItens.Free;
  end

end; {PaginaEmpSalvaEmptmo}


//Exibe os dados de uma determinada inscrição
function DadosInscricao( iIdInscricaoEmptmo : extended; iIdPessoaLocal, iIdTitularLocal : integer ) : String;
var
  sTituloCampo : string;

  sFormaPagto,
  sFormaRecto,
  sContaBancariaPag,
  sContaBancariaRec : string;

  i : integer;

  //Variáveis de geração e emissão de relatórios
  rtContrato     : TReportType;
  sHTMLFile      : string;
  iIdDataView    ,
  iOrigemCMDV    ,
  iIdReports     ,
  iOrigemCm      : integer;

begin
  Result := '';

  cds.Close;
  cds.Data := InscricaoEmptmo.SelecionaDadosInscricao( iIdPessoaLocal,
                                                       iIdTitularLocal,
                                                       iIdInscricaoEmptmo,
                                                       '', 0, 0 );

  if not cds.IsEmpty then
  begin

    sFormaPagto    := iff( cds.FieldByName('FLGFORMAPAG').AsString = 'C', 'Contas a Pagar', 'Folha de Pagamento' );
    sFormaRecto    := iff( cds.FieldByName('FLGFORMAREC').AsString = 'C', 'Contas a Receber', 'Folha de Pagamento' );

    sContaBancariaPag := '';
    if not cds.FieldByName('CONTACORRENTEPAG').IsNull then
      sContaBancariaPag := cds.FieldByName('BANCOPAG').AsString +
       '&nbsp;&nbsp;-&nbsp;&nbsp;Ag. ' + cds.FieldByName('NUMAGENCIAPAG').AsString +
       '&nbsp;&nbsp;-&nbsp;&nbsp;C.C. ' + cds.FieldByName('CONTACORRENTEPAG').AsString;

    sContaBancariaRec := '';
    if not cds.FieldByName('CONTACORRENTEREC').IsNull then
      sContaBancariaRec := cds.FieldByName('BANCOREC').AsString +
       '&nbsp;&nbsp;-&nbsp;&nbsp;Ag. ' + cds.FieldByName('NUMAGENCIAREC').AsString +
       '&nbsp;&nbsp;-&nbsp;&nbsp;C.C. ' + cds.FieldByName('CONTACORRENTEREC').AsString;

    Result :=
     '      <tr>                                                                ' + CR +
     '        <td width="75%">                                                  ' + CR +
     '          <table border="0" width="100%" cellpadding="0" cellspacing="0"> ' + CR ;


    //Variáveis de montagem do formulário
    sIniLinha :=
       '          <tr class="CAMPOFORM">                                                   ' + CR +
       '            <td class="DESCCAMPO" width="50%" <#S> >                               ' + CR ;

    sEntreCols :=
       '            </td>                                                                  ' + CR +
       '            <td class="DESCCAMPO">                                                 ' + CR ;

    sFimLinha :=
       '            </td>                                                                  ' + CR +
       '          </tr>                                                                    ' + CR ;



    sColFmt :=
     '              <#T>                                                                   ' + CR +
     '              <DIV class="CONTCAMPOD">                                               ' + CR +
     '                <#C>                                                                 ' + CR +
     '              </DIV>                                                                 ' + CR ;

    Result := Result + MontaLinhaForm( cEmpInscConfNumInscricao,  cds.FieldByName('IDINSCRICAOEMPTMO').AsString );



    sColFmt :=
     '              <#T>                                                                   ' + CR +
     '              <DIV class="CONTCAMPO">                                                ' + CR +
     '                <#C>                                                                 ' + CR +
     '              </DIV>                                                                 ' + CR ;

    Result := Result + MontaLinhaForm( cEmpInscConfTpContrato,     cds.FieldByName('TCEDESCRICAO').AsString,
                                       cEmpInscConfTpEmprestimo,   cds.FieldByName('DESCTIPOEMPTMO').AsString );

    Result := Result + MontaLinhaForm( cEmpInscConfPatro,          cds.FieldByName('PATRO').AsString,
                                       cEmpInscConfPlano,          cds.FieldByName('PLANO').AsString );

    Result := Result + MontaLinhaForm( cEmpInscConfVlSolicitado,   FormatFloat( '#,##0.00', cds.FieldByName('VLRSOLIC').AsFloat ),
                                       cEmpInscConfNumParcelas,    cds.FieldByName('NUMPARCELAS').AsString );

    Result := Result + MontaLinhaForm( cEmpInscConfMoeda,          cds.FieldByName('MOESIGLA').AsString,
                                       cEmpInscConfDataCredito,    FormataDataHora( 'dd/mm/yyyy', cds.FieldByName('DATACREDITO').AsString ) );

    Result := Result + MontaLinhaForm( cEmpInscConfTxJuros,        FormatFloat( '#,##0.0000', cds.FieldByName('TXJUROS').AsFloat ),
                                       cEmpInscConfDtInscricao,    FormataDataHora( 'dd/mm/yyyy', cds.FieldByName('DATAINSC').AsString ) );

    Result := Result + MontaLinhaForm( cEmpInscConfSit,            iff( cds.FieldByName('FLGSITUACAO').AsString = 'A', 'Ativo',
                                                                        iff( cds.FieldByName('FLGSITUACAO').AsString = 'E', 'Contrato Associado',
                                                                             iff( cds.FieldByName('FLGSITUACAO').AsString = 'C',
                                                                                  'Cancelado', '?' ) ) ),
                                       cEmpInscConfViaWeb,         iff( cds.FieldByName('FLGINTERNET').AsInteger = 1,  'Sim', 'Não' ) );

    Result := Result + MontaLinhaForm( cEmpInscConfFormaPagto,     sFormaPagto,
                                       cEmpInscConfFormaRecto,     sFormaRecto );

    Result := Result + MontaLinhaForm( cEmpInscConfContaBancariaP, sContaBancariaPag,
                                       cEmpInscConfContaBancariaR, sContaBancariaRec );

    Result := Result + MontaLinhaForm( cEmpInscConfAvalista,       cds.FieldByName('NOMEAVALISTA').AsString );


    //Beneficiários
    if TemAcessoCampo( sTipoUsuario, cEmpInscConfBeneficiarios, sTituloCampo ) then
    begin
      cdsAux.Close;
      cdsAux.Data := WebEmprestimo.Beneficiarios( iIdInscricaoEmptmo );

      if not cdsAux.IsEmpty then
      begin
        Result := Result +
         '            <tr valign="top">                                                   ' + CR +
         '              <td valign="top" colspan="2" class="DESCCAMPO">                   ' + CR +
         sTituloCampo                                                                       + CR +
         '                <table border="0" width="100%" cellspacing="0" cellpaddind="0"> ' + CR ;

        cdsAux.First;
        while not cdsAux.Eof do
        begin
          Result := Result +
           '                <tr>                                                    ' + CR +
           '                  <td class="CONTCAMPO" width="50%" align="left">       ' + CR +
           cdsAux.FieldByName('NOME').AsString + '&nbsp;&nbsp;&nbsp;                ' + CR +
           '                  </td>                                                 ' + CR +
           '                  <td class="CONTCAMPO" align="left">                   ' + CR +
           ConverteVirgulaParaPonto(cdsAux.FieldByName('PERCINDENIZACAO').AsFloat)+'%'+ CR +
           '                  </td>                                                 ' + CR +
           '                </tr>                                                   ' + CR ;
          cdsAux.Next;
        end;

        Result := Result +
         '                </table>                                                ' + CR +
         '                <BR><BR>                                                ' + CR +
         '              </td>                                                     ' + CR +
         '            </tr>                                                       ' + CR ;
      end;

    end;


    //Dados da Simulação
    if TemAcessoCampo( sTipoUsuario, cEmpInscConfDadosItens, sTituloCampo ) then
    begin
      Result := Result +
       '            <tr>                                                        ' + CR +
       '              <td colspan="2">                                          ' + CR +
       '                <hr>                                                    ' + CR +
       '              </td>                                                     ' + CR +
       '            </tr>                                                       ' + CR ;

      cdsAux.Close;
      cdsAux.Data := HistMovInscricao.SelecionaDadosHistMovInscricao( iIdInscricaoEmptmo );

      i := 0;

      cdsAux.First;
      while not cdsAux.Eof do
      begin

        //Se for par
        if ( i mod 2 ) = 0 then
          Result := Result +
           '    <tr class="CAMPOFORM">                                                              ' + CR +
           '      <td valign="top" class="DESCCAMPO" width="50%">                                  ' + CR +
           cdsAux.FieldByName('ITEDESCRICAO').AsString                                               + CR +
           '        <BR>                                                                           ' + CR +
           '        <DIV class="CONTCAMPO">                                                        ' + CR +
           FormatFloat( '#,##0.00', cdsAux.FieldByName('HMIVLRPREVISTO').AsFloat )                   + CR +
           '        </DIV>                                                                         ' + CR +
           '      </td>                                                                            ' + CR
        else
          Result := Result +
           '      <td valign="top" class="DESCCAMPO">                                              ' + CR +
           cdsAux.FieldByName('ITEDESCRICAO').AsString                                               + CR +
           '        <BR>                                                                           ' + CR +
           '        <DIV class="CONTCAMPO">                                                        ' + CR +
           FormatFloat( '#,##0.00', cdsAux.FieldByName('HMIVLRPREVISTO').AsFloat )                   + CR +
           '        </DIV>                                                                         ' + CR +
           '      </td>                                                                            ' + CR +
           '    </tr>                                                                              ' + CR ;

        Inc( i );

        cdsAux.Next;
      end;

      cdsAux.Close;
    end;

    Result := Result +
     '          </table>                                                        ' + CR +
     '        </td>                                                             ' + CR +
     '      </tr>                                                               ' + CR +
     '      <tr>                                                                ' + CR +
     '        <td>                                                              ' + CR ;

    //Impressão da Prévia Contratual
    if TemAcessoPagina( sTipoUsuario, pEmpContrInscEmptmo, sTituloCampo ) then
    begin

      //Recupera dados do relatório
      RecuperaConfRelatorio( rInscricaoEmprestimo,
                             rtContrato,
                             iIdDataView,
                             iOrigemCMDV,
                             iIdReports,
                             iOrigemCM,
                             sHTMLFile );

      Result := Result +
       GeraDadosRelatorio( rtContrato,
                           'frmLnkPreviaContratual',
                           iIdReports,
                           iOrigemCM,
                           sHTMLFile,
                           'Inscrição em Empréstimo',
                           WebEmprestimo.RelatorioInscricao( iIdDataView,
                                                             iOrigemCMDV,
                                                             iIdInscricaoEmptmo ) )   +
       '<center>                                                                   ' + CR +
       '  <a href="JavaScript:document.frmLnkPreviaContratual.submit();">          ' + CR +
       '    <img src="../imagem/btnContrato.gif" name="btnContrato" border="0"     ' + CR +
       '         onMouseOver="btnContrato.src=''../imagem/btnContrato_s.gif''"     ' + CR +
       '         onMouseOut="btnContrato.src=''../imagem/btnContrato.gif''"></a>   ' + CR +
       '</center>                                                                  ' + CR ;

    end;

    Result := Result +
     '        </td>                                                             ' + CR +
     '      </tr>                                                               ' + CR ;

  end
  else
    raise Exception.Create('Houve um erro ao tentar localizar os dados da inscrição ' + FloatToStr( iIdInscricaoEmptmo ) + '.' );

  cds.Close;

end; {DadosInscricao}



//Função que busca o prazo máximo do tipo de contrato.
function BuscaPrazoContrato( sRuleName        : String;
                             iTipoContrEmptmo : Integer;
                             iIdTitular,
                             iIdBeneficiario,
                             iNumParcela : integer;
                             dDataInsc        : TDateTime;
                             bFlgExcepcional : boolean ): Integer;
var
  sResultado : String;
begin
  WebRegra.DatasetPrazoContrato( iTipoContrEmptmo, iIdTitular, iIdBeneficiario, iNumParcela, dDataInsc, bFlgExcepcional );

  WebRegra.MessageInfo := '';
  sResultado := trim( WebRegra.RegraString( sRuleName, iIdEmpresaProp ) );
  if WebRegra.MessageInfo <> '' then raise Exception.Create( WebRegra.MessageInfo );

  if ( sResultado <> '' ) and ( sResultado <> 'NULO') then
    Result := StrToInt( sResultado )
  else
    Result := 0;

end; {BuscaPrazoContrato}


//Retorna um array contendo as parcelas que podem ser simuladas
function ParcelasSimulaveis( iIdTitular, iIdBenef, iIdEmpresa, iIDREGRAPRAZOSCONC, iMinParcelas,
                             iMaxParcelas : integer; bFlgExcepcional : boolean ) : string;
var
  j : integer;
begin

  if iIDREGRAPRAZOSCONC > 0 then
  begin
    for j := iMinParcelas to iMaxParcelas do
    begin
      WebRegra.CdsDataSetIn.Data := WebEmprestimo.DatasetVerificaPrazoConcessao(
                                    j, iIdTitular, iIdBenef, bFlgExcepcional );

      WebRegra.MessageInfo := '';
      if WebRegra.RegraBooleana( IntToStr( iIDREGRAPRAZOSCONC ), iIdEmpresa ) then
        Result := Result + IntToStr( j ) + ';';
      if WebRegra.MessageInfo <> '' then raise Exception.Create( WebRegra.MessageInfo );
    end;
  end
  else
  begin
    for j := iMinParcelas to iMaxParcelas do
      Result := Result + IntToStr( j ) + ';';
  end;

  Result := StrLeft( Result, length( Result ) - 1 );
end; {ParcelasSimulaveis}


//Verifica se é ol último dia do mês
function EhUltimoDiaUtilMes( dDataVerificacao: TDateTime; iCidade, iPais : integer; sEstado : string ) : Boolean;
var
  iAno, iMes, iDia : word;
begin
  DecodeDate(dDataVerificacao, iAno, iMes, iDia);

  Result := ( dDataVerificacao = DiasUteis.UltDiaUtilMes(iAno,
                                                        iMes,
                                                        iCidade,
                                                        iPais,
                                                        sEstado,
                                                        False,   // bConsideraBancario
                                                        False,   // bConsideraExtraordinario
                                                        False    // bSabadoUtil
                                                        ) );
end;


//Exibe os dados de um determinado contrato e da sua inscrição
function DadosContrato( iIdContratoEmptmo, iIdInscricaoEmptmo : extended; iIdPessoaLocal, iIdTitularLocal : integer ) : String;
var
  sTituloCampo : string;

  sFormaPagto,
  sFormaRecto,
  sContaBancariaPag,
  sContaBancariaRec : string;

  i : integer;

  //Variáveis de geração e emissão de relatórios
  rtContrato     : TReportType;
  sHTMLFile      : string;
  iIdDataView    ,
  iOrigemCMDV    ,
  iIdReports     ,
  iOrigemCm      : integer;

begin
  Result := '';

  cds.Close;
  cds.Data := InscricaoEmptmo.SelecionaDadosInscricao( iIdPessoaLocal,
                                                       iIdTitularLocal,
                                                       iIdInscricaoEmptmo,
                                                       '', 0, 0 );

  if not cds.IsEmpty then
  begin

    sFormaPagto    := iff( cds.FieldByName('FLGFORMAPAG').AsString = 'C', 'Contas a Pagar', 'Folha de Pagamento' );
    sFormaRecto    := iff( cds.FieldByName('FLGFORMAREC').AsString = 'C', 'Contas a Receber', 'Folha de Pagamento' );

    sContaBancariaPag := '';
    if not cds.FieldByName('CONTACORRENTEPAG').IsNull then
      sContaBancariaPag := cds.FieldByName('BANCOPAG').AsString +
       '&nbsp;&nbsp;-&nbsp;&nbsp;Ag. ' + cds.FieldByName('NUMAGENCIAPAG').AsString +
       '&nbsp;&nbsp;-&nbsp;&nbsp;C.C. ' + cds.FieldByName('CONTACORRENTEPAG').AsString;

    sContaBancariaRec := '';
    if not cds.FieldByName('CONTACORRENTEREC').IsNull then
      sContaBancariaRec := cds.FieldByName('BANCOREC').AsString +
       '&nbsp;&nbsp;-&nbsp;&nbsp;Ag. ' + cds.FieldByName('NUMAGENCIAREC').AsString +
       '&nbsp;&nbsp;-&nbsp;&nbsp;C.C. ' + cds.FieldByName('CONTACORRENTEREC').AsString;

    Result :=
     '      <tr>                                                                ' + CR +
     '        <td width="75%">                                                  ' + CR +
     '          <table border="0" width="100%" cellpadding="0" cellspacing="0"> ' + CR ;

    //Variáveis de montagem do formulário
    sIniLinha :=
       '          <tr class="CAMPOFORM">                                                   ' + CR +
       '            <td class="DESCCAMPO" width="50%" <#S> >                               ' + CR ;

    sEntreCols :=
       '            </td>                                                                  ' + CR +
       '            <td class="DESCCAMPO">                                                 ' + CR ;

    sFimLinha :=
       '            </td>                                                                  ' + CR +
       '          </tr>                                                                    ' + CR ;



    sColFmt :=
     '              <#T>                                                                   ' + CR +
     '              <DIV class="CONTCAMPOD">                                               ' + CR +
     '                <#C>                                                                 ' + CR +
     '              </DIV>                                                                 ' + CR ;

    Result := Result + MontaLinhaForm( cEmpContrConfNumContrato,  ConverteVirgulaParaPonto( iIdContratoEmptmo ),
                                       cEmpContrConfNumInscricao, ConverteVirgulaParaPonto( iIdInscricaoEmptmo ) );




    sColFmt :=
     '              <#T>                                                                   ' + CR +
     '              <DIV class="CONTCAMPO">                                                ' + CR +
     '                <#C>                                                                 ' + CR +
     '              </DIV>                                                                 ' + CR ;

    Result := Result + MontaLinhaForm( cEmpContrConfTpContrato,     cds.FieldByName('TCEDESCRICAO').AsString,
                                       cEmpContrConfTpEmprestimo,   cds.FieldByName('DESCTIPOEMPTMO').AsString );

    Result := Result + MontaLinhaForm( cEmpContrConfPatro,          cds.FieldByName('PATRO').AsString,
                                       cEmpContrConfPlano,          cds.FieldByName('PLANO').AsString );

    Result := Result + MontaLinhaForm( cEmpContrConfVlSolicitado,   FormatFloat( '#,##0.00', cds.FieldByName('VLRSOLIC').AsFloat ),
                                       cEmpContrConfNumParcelas,    cds.FieldByName('NUMPARCELAS').AsString );

    Result := Result + MontaLinhaForm( cEmpContrConfMoeda,          cds.FieldByName('MOESIGLA').AsString,
                                       cEmpContrConfDataCredito,    FormataDataHora( 'dd/mm/yyyy', cds.FieldByName('DATACREDITO').AsString ) );

    Result := Result + MontaLinhaForm( cEmpContrConfTxJuros,        FormatFloat( '#,##0.0000', cds.FieldByName('TXJUROS').AsFloat ),
                                       cEmpContrConfDtInscricao,    FormataDataHora( 'dd/mm/yyyy', cds.FieldByName('DATAINSC').AsString ) );

    Result := Result + MontaLinhaForm( cEmpContrConfSit,            iff( cds.FieldByName('FLGSITUACAO').AsString = 'A', 'Ativo',
                                                                         iff( cds.FieldByName('FLGSITUACAO').AsString = 'E', 'Contrato Associado',
                                                                              iff( cds.FieldByName('FLGSITUACAO').AsString = 'C',
                                                                                   'Cancelado', '?' ) ) ),
                                       cEmpContrConfViaWeb,         iff( cds.FieldByName('FLGINTERNET').AsInteger = 1,  'Sim', 'Não' ) );

    Result := Result + MontaLinhaForm( cEmpContrConfFormaPagto,     sFormaPagto,
                                       cEmpContrConfFormaRecto,     sFormaRecto );

    Result := Result + MontaLinhaForm( cEmpContrConfContaBancariaP, sContaBancariaPag,
                                       cEmpContrConfContaBancariaR, sContaBancariaRec );

    Result := Result + MontaLinhaForm( cEmpContrConfAvalista,       cds.FieldByName('NOMEAVALISTA').AsString );


    //Beneficiários
    if TemAcessoCampo( sTipoUsuario, cEmpContrConfBeneficiarios, sTituloCampo ) then
    begin
      cdsAux.Close;
      cdsAux.Data := WebEmprestimo.Beneficiarios( iIdInscricaoEmptmo );

      if not cdsAux.IsEmpty then
      begin
        Result := Result +
         '            <tr valign="top">                                                   ' + CR +
         '              <td valign="top" colspan="2" class="DESCCAMPO">                   ' + CR +
         sTituloCampo                                                                       + CR +
         '                <table border="0" width="100%" cellspacing="0" cellpaddind="0"> ' + CR ;

        cdsAux.First;
        while not cdsAux.Eof do
        begin
          Result := Result +
           '                <tr>                                                    ' + CR +
           '                  <td class="CONTCAMPO" width="50%" align="left">       ' + CR +
           cdsAux.FieldByName('NOME').AsString + '&nbsp;&nbsp;&nbsp;                ' + CR +
           '                  </td>                                                 ' + CR +
           '                  <td class="CONTCAMPO" align="left">                   ' + CR +
           ConverteVirgulaParaPonto(cdsAux.FieldByName('PERCINDENIZACAO').AsFloat)+'%'+ CR +
           '                  </td>                                                 ' + CR +
           '                </tr>                                                   ' + CR ;
          cdsAux.Next;
        end;

        Result := Result +
         '                </table>                                                ' + CR +
         '                <BR><BR>                                                ' + CR +
         '              </td>                                                     ' + CR +
         '            </tr>                                                       ' + CR ;
      end;

    end;


    //Dados da Simulação
    if TemAcessoCampo( sTipoUsuario, cEmpContrConfDadosItens, sTituloCampo ) then
    begin
      Result := Result +
       '            <tr>                                                        ' + CR +
       '              <td colspan="2">                                          ' + CR +
       '                <hr>                                                    ' + CR +
       '              </td>                                                     ' + CR +
       '            </tr>                                                       ' + CR ;

      cdsAux.Close;
      cdsAux.Data := HistMovInscricao.SelecionaDadosHistMovInscricao( iIdInscricaoEmptmo );

      i := 0;

      cdsAux.First;
      while not cdsAux.Eof do
      begin

        //Se for par
        if ( i mod 2 ) = 0 then
          Result := Result +
           '    <tr class="CAMPOFORM">                                                              ' + CR +
           '      <td valign="top" class="DESCCAMPO" width="50%">                                  ' + CR +
           cdsAux.FieldByName('ITEDESCRICAO').AsString                                               + CR +
           '        <BR>                                                                           ' + CR +
           '        <DIV class="CONTCAMPO">                                                        ' + CR +
           FormatFloat( '#,##0.00', cdsAux.FieldByName('HMIVLRPREVISTO').AsFloat )                   + CR +
           '        </DIV>                                                                         ' + CR +
           '      </td>                                                                            ' + CR
        else
          Result := Result +
           '      <td valign="top" class="DESCCAMPO">                                              ' + CR +
           cdsAux.FieldByName('ITEDESCRICAO').AsString                                               + CR +
           '        <BR>                                                                           ' + CR +
           '        <DIV class="CONTCAMPO">                                                        ' + CR +
           FormatFloat( '#,##0.00', cdsAux.FieldByName('HMIVLRPREVISTO').AsFloat )                   + CR +
           '        </DIV>                                                                         ' + CR +
           '      </td>                                                                            ' + CR +
           '    </tr>                                                                              ' + CR ;

        Inc( i );

        cdsAux.Next;
      end;

      cdsAux.Close;
    end;

    Result := Result +
     '          </table>                                                        ' + CR +
     '        </td>                                                             ' + CR +
     '      </tr>                                                               ' + CR +
     '      <tr>                                                                ' + CR +
     '        <td>                                                              ' + CR ;

    //Impressão da Prévia Contratual
    if TemAcessoPagina( sTipoUsuario, pEmpContrConcEmptmo, sTituloCampo ) then
    begin

      //Recupera dados do relatório
      RecuperaConfRelatorio( rContratacaoEmprestimo,
                             rtContrato,
                             iIdDataView,
                             iOrigemCMDV,
                             iIdReports,
                             iOrigemCM,
                             sHTMLFile );

      Result := Result +
       GeraDadosRelatorio( rtContrato,
                           'frmLnkContrato',
                           iIdReports,
                           iOrigemCM,
                           sHTMLFile,
                           'Concessão de Empréstimo',
                           WebEmprestimo.RelatorioConcessao( iIdDataView,
                                                             iOrigemCMDV,
                                                             iIdContratoEmptmo ) )   +
       '<center>                                                                   ' + CR +
       '  <a href="JavaScript:document.frmLnkContrato.submit();">                  ' + CR +
       '    <img src="../imagem/btnContrato.gif" name="btnContrato" border="0"     ' + CR +
       '         onMouseOver="btnContrato.src=''../imagem/btnContrato_s.gif''"     ' + CR +
       '         onMouseOut="btnContrato.src=''../imagem/btnContrato.gif''"></a>   ' + CR +
       '</center>                                                                  ' + CR ;

    end;

    Result := Result +
     '        </td>                                                             ' + CR +
     '      </tr>                                                               ' + CR ;

  end
  else
    raise Exception.Create('Houve um erro ao tentar localizar os dados do contrato ' + FloatToStr( iIdContratoEmptmo ) +
     ' (inscrição ' + FloatToStr( iIdInscricaoEmptmo ) + ').'  );

  cds.Close;

end;


end.
