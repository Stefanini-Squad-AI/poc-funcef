// *****************************************************************************
// ***************************** REGISTRO DE ALTERAÇÕES ************************
// *****************************************************************************
// Rotina      : BuscaInfIntegraFOLHAPATRO
// Autor(a)    : Gleyber
// Data        : 13/03/2006
// Pendência   : 18753
// Alteração   : se sNaturezaDocumento for informada, não mudar o sRecPag conforme flgdevolucao
// -----------------------------------------------------------------------------
// Rotina      : BuscaInfIntegra, BuscaInfIntegraFOLHABEN e BuscaInfIntegraFOLHAPATRO
// Autor(a)    : Gleyber
// Data        : 11/01/2006
// Pendência   : 19538
// Alteração   : Inclusão de dois novos parâmetros (sPlaContaDProvis e sPlaContaCProvis)
// -----------------------------------------------------------------------------
// Rotina      : BuscaInfIntegra
// Autor(a)    : Gleyber
// Data        : 09/09/2005
// Pendência   : 20169
// Alteração   : Inclusão de novo parâmetro (sNaturezaDocumento)
// -----------------------------------------------------------------------------
// Rotina      : BuscaInfIntegraFOLHAPATRO
// Autor(a)    : Gleyber
// Data        : 09/09/2005
// Pendência   : 20169
// Alteração   : Inclusão de novos campo para rateio no contas a receber (contribuição).
// -----------------------------------------------------------------------------
// Rotina      : BuscaInfIntegraFOLHABEN e BuscaInfIntegraFOLHAPATRO
// Autor(a)    : Gleyber
// Data        : 21/06/2005
// Alteração   : Alterações das rotinas para que ao buscar os parâmetros de integração
//               de contribuições de abono, caso estejam nulas buscam a conta normal.
// -----------------------------------------------------------------------------
// Autor(a)    : Leo
// Data        : 28/04/2005
// Pendencia   :
// Rotina      : BuscaInfIntegra
// Alteração   : incluí o parâmetro sMsgErro que substitui otratamento de erro chamando MSGDLG, agora, passando
//               apenas um string com o erro
//------------------------------------------------------------------------------
// Rotina      : BuscaInfIntegraFOLHAPATRO
// Autor(a)    : Leo
// Data        : 08.04.2002
// Alteração   : modifiquei verificação de busca de parâmetros de décimo terceiro,
//               retirando a chamada de VerificaParamSal13, deixando apenas a verificação do MESREFERENCIA
// -----------------------------------------------------------------------------
// Rotina      : EnviaContribuicao
// Autor(a)    : Camille
// Data        : 01.04.2002
// Alteração   : Criação da rotina BuscaInfIntegraFOLHAPATRO
//               Esta rotina tem por objetivo buscar os parâmetros de integração
//               contábil/financeira tanto de contribuições quanto de beneficios
//               quando forem para envio/recebimento para/da patrocinadora,
//               seguindo a seguinte hierarquia :
//               1o. Busca a nivel de PLANOxPATRO ( CONTPLANPATRO e BENEFPLANPATRO )
//               2o. Busca a nivel de PLANO       ( CONTPREV      e BENEFPLANPREV  )
// -----------------------------------------------------------------------------

// *****************************************************************************
unit DAPrevIntegraBack;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  Db, DBTables, Wwquery;

type
  TdtmAPrevIntegraBack = class(TDataModule)
    qryAux: TwwQuery;
    qryAux2: TwwQuery;
  private
    { Private declarations }
    function BuscaInfIntegraFOLHABEN  ( piIdPessJur,
                                        piIdPlanoPrev,
                                        piIdTitular,
                                        piIdPessoa,
                                        piIdItem         : longint; // idcontribuicao ou idbeneficio
                                        pcTipoItem       : char;    // C - Contribuicao, B - Beneficio
                                        piFlgDevolucao   : integer;
                                        psAnoMesCobranca,
                                        psAnoMesReferencia : string;
                                    var sTipCodigo,
                                        sCodTipRecDes,
                                        sRecPag,
                                        sCodTipDoc,
                                        sCodPortForma,
                                        sCodCentroRespon,
                                        sCodSubConta,
                                        sCodCentroCustoD,
                                        sIdEmpresa,
                                        sCodCentroCustoC,
                                        sPlaContaD,
                                        sPlano,
                                        sPlaContaC,
                                        sPlaContaDProvis,            
                                        sPlaContaCProvis,            
                                        sUnidNegoc,
                                        sIdEmpresaProp: string ) : boolean;

    
    function BuscaInfIntegraFOLHAPATRO( piIdPessJur,
                                        piIdPlanoPrev,
                                        piIdTitular,
                                        piIdPessoa,
                                        piIdItem         : longint; // idcontribuicao ou idbeneficio
                                        pcTipoItem       : char;    // C - Contribuicao, B - Beneficio
                                        piFlgDevolucao   : integer;
                                        psAnoMesCobranca,
                                        psAnoMesReferencia : string;
                                    var sTipCodigo,
                                        sCodTipRecDes,
                                        sRecPag,
                                        sCodTipDoc,
                                        sCodPortForma,
                                        sCodCentroRespon,
                                        sCodSubConta,
                                        sCodCentroCustoD,
                                        sIdEmpresa,
                                        sCodCentroCustoC,
                                        sPlaContaD,
                                        sPlano,
                                        sPlaContaC,
                                        sPlaContaDProvis,         
                                        sPlaContaCProvis,         
                                        sUnidNegoc,
                                        sIdEmpresaProp : string;
                                        sNaturezaDocumento : string ) : boolean;

  public
    { Public declarations }
    function BuscaInfIntegra( piIdPessJur,
                     piIdPlanoPrev,
                     piIdTitular,
                     piIdPessoa,
                     piIdItem         : longint; // IdContribuicao ou IdBeneficio
                     pcTipoItem,                 // C - Contribuicao, B - Beneficio
                     pcTipoEnvio      : char;    // B - Folha de Beneficio, P - Folha da Patro, C - Banco
                     piFlgDevolucao   : integer;
                     psAnoMesCobranca,
                     psAnoMesReferencia : string;
                 var sTipCodigo,
                     sCodTipRecDes,
                     sRecPag,
                     sCodTipDoc,
                     sCodPortForma,
                     sCodCentroRespon,
                     sCodSubConta,
                     sCodCentroCustoD,
                     sIdEmpresa,
                     sCodCentroCustoC,
                     sPlaContaD,
                     sPlano,
                     sPlaContaC,
                     sPlaContaDProvis,            
                     sPlaContaCProvis,            
                     sUnidNegoc,
                     sIdEmpresaProp : string;
                     sNaturezaDocumento : string; 
                     pbValidaCampos : boolean;
                 var sMsgErro  : string ) : boolean;

  end;

var
  dtmAPrevIntegraBack: TdtmAPrevIntegraBack;

implementation

uses UDataBase, UMensErro, UAdmPrev;

{$R *.DFM}


function TdtmAPrevIntegraBack.BuscaInfIntegra( piIdPessJur,
                                               piIdPlanoPrev,
                                               piIdTitular,
                                               piIdPessoa,
                                               piIdItem           : longint; // idcontribuicao ou idbeneficio
                                               pcTipoItem,                 // C - Contribuicao, B - Beneficio
                                               pcTipoEnvio        : char;    // B - Folha de Beneficio, P - Folha da Patro, B - Banco
                                               piFlgDevolucao     : integer;
                                               psAnoMesCobranca,
                                               psAnoMesReferencia : string;
                                           var sTipCodigo,
                                               sCodTipRecDes,
                                               sRecPag,
                                               sCodTipDoc,
                                               sCodPortForma,
                                               sCodCentroRespon,
                                               sCodSubConta,
                                               sCodCentroCustoD,
                                               sIdEmpresa,
                                               sCodCentroCustoC,
                                               sPlaContaD,
                                               sPlano,
                                               sPlaContaC,
                                               sPlaContaDProvis,            
                                               sPlaContaCProvis,            
                                               sUnidNegoc,
                                               sIdEmpresaProp : string;
                                               sNaturezaDocumento : string; 
                                               pbValidaCampos : boolean;
                                               var sMsgErro  : string ) : boolean;
var sSQL,
    sCentroCustoDAux,
    sCentroCustoCAux,
    sPlaContaDAux,
    sPlaContaCAux,
    sCampoFaltando      : string;
begin
  Result := False;
  sMsgErro := '';


  if pcTipoEnvio = 'B'
  then begin
     Result := BuscaInfIntegraFOLHABEN( piIdPessJur,
                                        piIdPlanoPrev,
                                        piIdTitular,
                                        piIdPessoa,
                                        piIdItem,
                                        pcTipoItem,
                                        piFlgDevolucao,
                                        psAnoMesCobranca,
                                        psAnoMesReferencia,
                                        sTipCodigo,
                                        sCodTipRecDes,
                                        sRecPag,
                                        sCodTipDoc,
                                        sCodPortForma,
                                        sCodCentroRespon,
                                        sCodSubConta,
                                        sCodCentroCustoD,
                                        sIdEmpresa,
                                        sCodCentroCustoC,
                                        sPlaContaD,
                                        sPlano,
                                        sPlaContaC,
                                        sPlaContaDProvis,            
                                        sPlaContaCProvis,            
                                        sUnidNegoc,
                                        sIdEmpresaProp);
  end
  else if pcTipoEnvio = 'P' // folha da patrocinadora
  then begin
     Result := BuscaInfIntegraFOLHAPATRO( piIdPessJur,
                                          piIdPlanoPrev,
                                          piIdTitular,
                                          piIdPessoa,
                                          piIdItem,
                                          pcTipoItem,
                                          piFlgDevolucao,
                                          psAnoMesCobranca,
                                          psAnoMesReferencia,
                                          sTipCodigo,
                                          sCodTipRecDes,
                                          sRecPag,
                                          sCodTipDoc,
                                          sCodPortForma,
                                          sCodCentroRespon,
                                          sCodSubConta,
                                          sCodCentroCustoD,
                                          sIdEmpresa,
                                          sCodCentroCustoC,
                                          sPlaContaD,
                                          sPlano,
                                          sPlaContaC,
                                          sPlaContaDProvis,      
                                          sPlaContaCProvis,      
                                          sUnidNegoc,
                                          sIdEmpresaProp,
                                          sNaturezaDocumento );  
  end;

  if pcTipoEnvio = 'B'
  then sTipCodigo := prmTpOperFolhaBen
  else if pcTipoEnvio = 'P'
       then sTipCodigo := prmTpDocPEnvioPatro
       else sTipCodigo := prmTpDocPEnvioBanco;


  // *************************************************************************************
  // VALIDAR CAMPOS OBRIGATORIOS
  // *************************************************************************************
  if pbValidaCampos
  then begin
     sCampoFaltando := '';
     if (Trim(sCodTipDoc) = '') and (pcTipoEnvio = 'C')
     then sCampoFaltando := sCampoFaltando + ', Tipo de Documento';

     if Trim(sCodTipRecDes) = ''
     then sCampoFaltando := sCampoFaltando + ', Tipo de Desembolso';

     if (Trim(sCodPortForma) = '') and (pcTipoEnvio = 'C')
     then sCampoFaltando := sCampoFaltando + ', Portador Forma';

     if Trim(sPlaContaD) = ''
     then sCampoFaltando := sCampoFaltando + ', Conta Contábil para Débito';

     if Trim(sPlaContaC) = ''
     then sCampoFaltando := sCampoFaltando + ', Conta Contábil para Crédito';

     if (Trim(sCodCentroCustoD) = '') and (Trim(sPlano) <> '') and (Trim(sPlaContaD) <> '')
     then begin
        qryAux.Close;
        qryAux.SQL.Clear;
        qryAux.SQl.Add(' SELECT PLACCUST FROM PLANOCONTA '+
                       ' WHERE  PLANO    = '+sPlano+
                       ' AND    PLACONTA = '''+sPlaContaD+'''');
        qryAux.Open;

        if qryAux.FieldByName('PlaCCust').AsString = 'S'
        then sCampoFaltando := sCampoFaltando + ', Centro de Custo para Débito';
     end;

     if (Trim(sCodCentroCustoC) = '') and (Trim(sPlano) <> '') and (Trim(sPlaContaC) <> '')
     then begin
        qryAux.Close;
        qryAux.SQL.Clear;
        qryAux.SQl.Add(' SELECT PLACCUST FROM PLANOCONTA '+
                       ' WHERE  PLANO    = '+sPlano+
                       ' AND    PLACONTA = '''+sPlaContaC+'''');
        qryAux.Open;

        if qryAux.FieldByName('PlaCCust').AsString = 'S'
        then sCampoFaltando := sCampoFaltando + ', Centro de Custo para Crédito';
     end;

     if Trim(sCampoFaltando) <> ''
     then begin
        sCampoFaltando := Copy(sCampoFaltando,2,Length(sCampoFaltando)-1);
        Result         := False;



        if pcTipoItem = 'B'
        then sMsgErro := 'Campos para Integração de Benefício : '+sCampoFaltando+'.'
        else sMsgErro := 'Campos para Integração de Contribuição : '+sCampoFaltando+'.';

     end;
  end;

end;

function TdtmAPrevIntegraBack.BuscaInfIntegraFOLHABEN( piIdPessJur,
                                                       piIdPlanoPrev,
                                                       piIdTitular,
                                                       piIdPessoa,
                                                       piIdItem         : longint; // idcontribuicao ou idbeneficio
                                                       pcTipoItem       : char;    // C - Contribuicao, B - Beneficio
                                                       piFlgDevolucao   : integer;
                                                       psAnoMesCobranca,
                                                       psAnoMesReferencia : string;
                                                   var sTipCodigo,
                                                       sCodTipRecDes,
                                                       sRecPag,
                                                       sCodTipDoc,
                                                       sCodPortForma,
                                                       sCodCentroRespon,
                                                       sCodSubConta,
                                                       sCodCentroCustoD,
                                                       sIdEmpresa,
                                                       sCodCentroCustoC,
                                                       sPlaContaD,
                                                       sPlano,
                                                       sPlaContaC,
                                                       sPlaContaDProvis,            
                                                       sPlaContaCProvis,            
                                                       sUnidNegoc,
                                                       sIdEmpresaProp: string ) : boolean; 
var sSQL,
    sCentroCustoDAux,
    sCentroCustoCAux,
    sPlaContaDAux,
    sPlaContaCAux,
    sCampoFaltando      : string;
begin
  Result := False;
  // *************************************************************************************
  // Fazendo Integracao de BENEFICIO
  // *************************************************************************************
  if pcTipoItem = 'B'
  then begin
    sSQL:='SELECT '+
          'DECODE(BPATR.PLACONTAC,        NULL, BPREV.PLACONTAC,        BPATR.PLACONTAC)        PLACONTAC, '+
          'DECODE(BPATR.PLACONTACABN,     NULL, BPREV.PLACONTACABN,     BPATR.PLACONTACABN)     PLACONTACABN, '+
          'DECODE(BPATR.CODCENTROCUSTOC,  NULL, BPREV.CODCENTROCUSTOC,  BPATR.CODCENTROCUSTOC)  CODCENTROCUSTOC, '+
          'DECODE(BPATR.CODCENTROCUSTOCA, NULL, BPREV.CODCENTROCUSTOCA, BPATR.CODCENTROCUSTOCA) CODCENTROCUSTOCA, '+
          'DECODE(BPATR.PLACONTAD,        NULL, BPREV.PLACONTAD,        BPATR.PLACONTAD)        PLACONTAD, '+
          'DECODE(BPATR.PLACONTADABN,     NULL, BPREV.PLACONTADABN,     BPATR.PLACONTADABN)     PLACONTADABN, '+
          'DECODE(BPATR.CODCENTROCUSTOD,  NULL, BPREV.CODCENTROCUSTOD,  BPATR.CODCENTROCUSTOD)  CODCENTROCUSTOD, '+
          'DECODE(BPATR.CODCENTROCUSTODA, NULL, BPREV.CODCENTROCUSTODA, BPATR.CODCENTROCUSTODA) CODCENTROCUSTODA, '+
          'DECODE(BPATR.CODSUBCONTA,      NULL, BPREV.CODSUBCONTA,      BPATR.CODSUBCONTA)      CODSUBCONTA, '+
          'DECODE(BPATR.CODSUBCONTAABN,   NULL, BPREV.CODSUBCONTAABN,   BPATR.CODSUBCONTAABN)   CODSUBCONTAABN, '+
          'DECODE(BPATR.CODTIPRECDES,     NULL, BPREV.CODTIPRECDES,     BPATR.CODTIPRECDES)     CODTIPRECDES, '+
          'DECODE(BPATR.CODTIPRECDESABN,  NULL, BPREV.CODTIPRECDESABN,  BPATR.CODTIPRECDESABN)  CODTIPRECDESABN, '+
          'DECODE(BPATR.CODCENTRORESPON,  NULL, BPREV.CODCENTRORESPON,  BPATR.CODCENTRORESPON)  CODCENTRORESPON, '+
          'DECODE(BPATR.CODCENTRORESPONA, NULL, BPREV.CODCENTRORESPONA, BPATR.CODCENTRORESPONA) CODCENTRORESPONA, '+
          'DECODE(BPATR.UNIDNEGOC,        NULL, BPREV.UNIDNEGOC,        BPATR.UNIDNEGOC)        UNIDNEGOC, '+
          'DECODE(BPATR.UNIDNEGOCABN,     NULL, BPREV.UNIDNEGOCABN,     BPATR.UNIDNEGOCABN)     UNIDNEGOCABN '+
          'FROM  BENEFPLANPATRO BPATR, BENEFPLANPREV BPREV '+
          'WHERE (BPATR.IDPESSJUR(+)    = '+IntToStr(piIdPessJur)+') '+
          'AND   (BPATR.IDPLANOPREV(+)  = BPREV.IDPLANOPREV) '+
          'AND   (BPATR.IDBENEFICIO(+)  = BPREV.IDBENEFICIO) '+
          'AND   (BPREV.IDPLANOPREV     = '+IntToStr(piIdPlanoPrev)+') '+
          'AND   (BPREV.IDBENEFICIO     = '+IntToStr(piIdItem)+') ';
    if FazQuery(qryAux, sSQL)
    then begin
       // Abono de Beneficio
      
      if (Copy(psAnoMesReferencia,6,2) = '13') And (Copy(psAnoMesCobranca,6,2) = '12')
      then begin
        sPlacontaC       := Trim(qryAux.fieldbyname('PLACONTACABN').AsString);
        sCodSubConta     := Trim(qryAux.fieldbyname('CODSUBCONTAABN').AsString);
        sCodCentroCustoC := Trim(qryAux.fieldbyname('CODCENTROCUSTOCA').AsString);
        sPlacontaD       := Trim(qryAux.fieldbyname('PLACONTADABN').AsString);
        sCodCentroCustoD := Trim(qryAux.fieldbyname('CODCENTROCUSTODA').AsString);
        sUnidNegoc       := Trim(qryAux.fieldbyname('UNIDNEGOCABN').AsString);
        sCodCentroRespon := Trim(qryAux.fieldbyname('CODCENTRORESPONA').AsString);
        sCodTipRecDes    := Trim(qryAux.fieldbyname('CODTIPRECDESABN').AsString);
      end
      else begin
        sPlacontaC       := Trim(qryAux.fieldbyname('PLACONTAC').AsString);
        sCodSubConta     := Trim(qryAux.fieldbyname('CODSUBCONTA').AsString);
        sCodCentroCustoC := Trim(qryAux.fieldbyname('CODCENTROCUSTOC').AsString);
        sPlacontaD       := Trim(qryAux.fieldbyname('PLACONTAD').AsString);
        sCodCentroCustoD := Trim(qryAux.fieldbyname('CODCENTROCUSTOD').AsString);
        sUnidNegoc       := Trim(qryAux.fieldbyname('UNIDNEGOC').AsString);
        sCodCentroRespon := Trim(qryAux.fieldbyname('CODCENTRORESPON').AsString);
        sCodTipRecDes    := Trim(qryAux.fieldbyname('CODTIPRECDES').AsString);
      end;
      Result := True;
    end;


    // Se for devolucao, inverter as contas crédito e débito
    if piFlgDevolucao = 1
    then begin
      sCentroCustoDAux := sCodCentroCustoD;
      sCentroCustoCAux := sCodCentroCustoC;
      sPlaContaDAux    := sPlaContaD;
      sPlaContaCAux    := sPlaContaC;

      sPlaContaC       := sPlaContaDAux;
      sPlaContaD       := sPlaContaCAux;
      sCodCentroCustoD := sCentroCustoCAux;
      sCodCentroCustoC := sCentroCustoDAux;
    end;
  end;

  // *************************************************************************************
  // Fazendo Integracao de CONTRIBUICAO
  // *************************************************************************************
  if pcTipoItem = 'C'
  then begin
    sSQL:='SELECT '+
          'DECODE(CPATR.PLACONTAC,         NULL, CPREV.PLACONTAC,         CPATR.PLACONTAC)         PLACONTAC,         '+
          'DECODE(CPATR.PLACONTAC13,       NULL, CPREV.PLACONTAC13,       CPATR.PLACONTAC13)       PLACONTAC13,       '+
          'DECODE(CPATR.CODCENTROCUSTOC,   NULL, CPREV.CODCENTROCUSTOC,   CPATR.CODCENTROCUSTOC)   CODCENTROCUSTOC,   '+
          'DECODE(CPATR.CODCENTROCUSTOC13, NULL, CPREV.CODCENTROCUSTOC13, CPATR.CODCENTROCUSTOC13) CODCENTROCUSTOC13, '+
          'DECODE(CPATR.PLACONTAD,         NULL, CPREV.PLACONTAD,         CPATR.PLACONTAD)         PLACONTAD,         '+
          'DECODE(CPATR.PLACONTAOUTROMES,  NULL, CPREV.PLACONTAOUTROMES,  CPATR.PLACONTAOUTROMES)  PLACONTAOUTROMES,  '+
          'DECODE(CPATR.PLACONTAD13,       NULL, CPREV.PLACONTAD13,       CPATR.PLACONTAD13)       PLACONTAD13,       '+
          'DECODE(CPATR.CODCENTROCUSTOD,   NULL, CPREV.CODCENTROCUSTOD,   CPATR.CODCENTROCUSTOD)   CODCENTROCUSTOD,   '+
          'DECODE(CPATR.CODCENTROCUSTOD13, NULL, CPREV.CODCENTROCUSTOD13, CPATR.CODCENTROCUSTOD13) CODCENTROCUSTOD13, '+
          'DECODE(CPATR.CODSUBCONTA,       NULL, CPREV.CODSUBCONTA,       CPATR.CODSUBCONTA)       CODSUBCONTA,       '+
          'DECODE(CPATR.CODSUBCONTA13,     NULL, CPREV.CODSUBCONTA13,     CPATR.CODSUBCONTA13)     CODSUBCONTA13,     '+
          'DECODE(CPATR.CODTIPDESEMBCAR,   NULL, CPREV.CODTIPDESEMBCAR,   CPATR.CODTIPDESEMBCAR)   CODTIPRECDES,      '+
          'DECODE(CPATR.CODTIPDESEMB13,    NULL, CPREV.CODTIPDESEMB13,    CPATR.CODTIPDESEMB13)    CODTIPRECDES13,    '+
          'DECODE(CPATR.CODCENTRORESPON,   NULL, CPREV.CODCENTRORESPON,   CPATR.CODCENTRORESPON)   CODCENTRORESPON,   '+
          'DECODE(CPATR.CODCENTRORESPON13, NULL, CPREV.CODCENTRORESPON13, CPATR.CODCENTRORESPON13) CODCENTRORESPON13, '+
          'DECODE(CPATR.UNIDNEGOC,         NULL, CPREV.UNIDNEGOC,         CPATR.UNIDNEGOC)         UNIDNEGOC,         '+
          'DECODE(CPATR.PLACONTADPROVIS,   NULL, CPREV.PLACONTADPROVIS,   CPATR.PLACONTADPROVIS)   PLACONTADPROVIS,   '+ 
          'DECODE(CPATR.PLACONTACPROVIS,   NULL, CPREV.PLACONTACPROVIS,   CPATR.PLACONTACPROVIS)   PLACONTACPROVIS,   '+ 
          'DECODE(CPATR.UNIDNEGOC13,       NULL, CPREV.UNIDNEGOC13,       CPATR.UNIDNEGOC13)       UNIDNEGOC13        '+
          'FROM CONTPLANPATRO CPATR, CONTPREV CPREV                      '+
          'WHERE (CPATR.IDPESSJUR(+)      = '+IntToStr(piIdPessJur)+')   '+
          'AND   (CPATR.IDPLANOPREV(+)    = CPREV.IDPLANOPREV)           '+
          'AND   (CPATR.IDCONTRIBUICAO(+) = CPREV.IDCONTRIBUICAO)        '+
          'AND   (CPREV.IDPLANOPREV       = '+IntToStr(piIdPlanoPrev)+') '+
          'AND   (CPREV.IDCONTRIBUICAO    = '+IntToStr(piIdItem)+')      ';
    if FazQuery(qryAux, sSQL) then
    begin
      if Copy(psAnoMesReferencia,6,2) = '13'
      then begin
        If Trim(qryAux.fieldbyname('PLACONTAC13').AsString) <> ''
         Then sPlacontaC       := Trim(qryAux.fieldbyname('PLACONTAC13').AsString)
         Else sPlacontaC       := Trim(qryAux.fieldbyname('PLACONTAC').AsString);

        If Trim(qryAux.fieldbyname('CODSUBCONTA13').AsString) <> ''
         Then sCodSubConta     := Trim(qryAux.fieldbyname('CODSUBCONTA13').AsString)
         Else sCodSubConta     := Trim(qryAux.fieldbyname('CODSUBCONTA').AsString);

        If Trim(qryAux.fieldbyname('CODCENTROCUSTOC13').AsString) <> ''
         Then sCodCentroCustoC := Trim(qryAux.fieldbyname('CODCENTROCUSTOC13').AsString)
         Else sCodCentroCustoC := Trim(qryAux.fieldbyname('CODCENTROCUSTOC').AsString);

        If Trim(qryAux.fieldbyname('PLACONTAD13').AsString) <> ''
         Then sPlacontaD       := Trim(qryAux.fieldbyname('PLACONTAD13').AsString)
         Else sPlacontaD       := Trim(qryAux.fieldbyname('PLACONTAD').AsString);

        If Trim(qryAux.fieldbyname('CODCENTROCUSTOD13').AsString) <> ''
         Then sCodCentroCustoD := Trim(qryAux.fieldbyname('CODCENTROCUSTOD13').AsString)
         Else sCodCentroCustoD := Trim(qryAux.fieldbyname('CODCENTROCUSTOD').AsString);

        If Trim(qryAux.fieldbyname('UNIDNEGOC13').AsString) <> ''
         Then sUnidNegoc       := Trim(qryAux.fieldbyname('UNIDNEGOC13').AsString)
         Else sUnidNegoc       := Trim(qryAux.fieldbyname('UNIDNEGOC').AsString);

        If Trim(qryAux.fieldbyname('CODCENTRORESPON13').AsString) <> ''
         Then sCodCentroRespon := Trim(qryAux.fieldbyname('CODCENTRORESPON13').AsString)
         Else sCodCentroRespon := Trim(qryAux.fieldbyname('CODCENTRORESPON').AsString);

        If Trim(qryAux.fieldbyname('CODTIPRECDES13').AsString) <> ''
         Then sCodTipRecDes    := Trim(qryAux.fieldbyname('CODTIPRECDES13').AsString)
         Else sCodTipRecDes    := Trim(qryAux.fieldbyname('CODTIPRECDES').AsString);

      end
      
      else begin
        sPlacontaC       := Trim(qryAux.fieldbyname('PLACONTAC').AsString);
        sCodSubConta     := Trim(qryAux.fieldbyname('CODSUBCONTA').AsString);
        sCodCentroCustoC := Trim(qryAux.fieldbyname('CODCENTROCUSTOC').AsString);
        sPlacontaD       := Trim(qryAux.fieldbyname('PLACONTAD').AsString);
        sCodCentroCustoD := Trim(qryAux.fieldbyname('CODCENTROCUSTOD').AsString);
        sUnidNegoc       := Trim(qryAux.fieldbyname('UNIDNEGOC').AsString);
        sCodCentroRespon := Trim(qryAux.fieldbyname('CODCENTRORESPON').AsString);
        sCodTipRecDes    := Trim(qryAux.fieldbyname('CODTIPRECDES').AsString);

        sPlaContaDProvis := Trim(qryAux.fieldbyname('PLACONTADPROVIS').AsString); 
        sPlaContaCProvis := Trim(qryAux.fieldbyname('PLACONTACPROVIS').AsString); 
      end;
      Result := True;
    end;

    // Se for devolucao, inverter as contas crédito e débito
    if piFlgDevolucao = 1
    then begin
      sCentroCustoDAux := sCodCentroCustoD;
      sCentroCustoCAux := sCodCentroCustoC;
      sPlaContaDAux    := sPlaContaD;
      sPlaContaCAux    := sPlaContaC;

      sPlaContaC       := sPlaContaDAux;
      sPlaContaD       := sPlaContaCAux;
      sCodCentroCustoD := sCentroCustoCAux;
      sCodCentroCustoC := sCentroCustoDAux;
    end;

    // O RECPAG para Folha de Beneficios é sempre P
    sRecPag := 'P';
  end;

end; // BuscaInfFolhaBen

function TdtmAPrevIntegraBack.BuscaInfIntegraFOLHAPATRO( piIdPessJur,
                                                         piIdPlanoPrev,
                                                         piIdTitular,
                                                         piIdPessoa,
                                                         piIdItem         : longint; // idcontribuicao ou idbeneficio
                                                         pcTipoItem       : char;    // C - Contribuicao, B - Beneficio
                                                         piFlgDevolucao   : integer;
                                                         psAnoMesCobranca,
                                                         psAnoMesReferencia : string;
                                                     var sTipCodigo,
                                                         sCodTipRecDes,
                                                         sRecPag,
                                                         sCodTipDoc,
                                                         sCodPortForma,
                                                         sCodCentroRespon,
                                                         sCodSubConta,
                                                         sCodCentroCustoD,
                                                         sIdEmpresa,
                                                         sCodCentroCustoC,
                                                         sPlaContaD,
                                                         sPlano,
                                                         sPlaContaC,
                                                         sPlaContaDProvis,            
                                                         sPlaContaCProvis,            
                                                         sUnidNegoc,
                                                         sIdEmpresaProp : string;
                                                         sNaturezaDocumento : string ) : boolean; 

  Function VerificaParamSal13(pIdPessJur: Integer; pAnoCompetencia, pMesReferencia: String): Boolean;
  Begin
    qryAux2.Sql.Clear;
    qryAux2.Sql.Add(' SELECT MESREFERENCIA FROM PARAMSAL13 WHERE '+
                    ' IDPESSJUR = '+ IntToStr(pIdPessJur) +
                    ' AND EXERCICIO = '+ pAnoCompetencia);
    qryAux2.Open;

    If Not qryAux2.IsEmpty Then
    Begin
      // pode haver vários meses
      qryAux2.First;
      While Not qryAux2.Eof Do
      Begin
        If qryAux2.FieldByName('MESREFERENCIA').AsString = pMesReferencia Then
        Begin
          Result := True;
          Exit;
        End;
        Result := False;
        qryAux2.Next;
      End; // While
    End Else Result := False;
  End;

var sSQL,
    sCentroCustoDAux,
    sCentroCustoCAux,
    sPlaContaDAux,
    sPlaContaCAux,
    sCampoFaltando      : string;
begin
  Result := False;

  // *************************************************************************************
  // Fazendo Integracao de BENEFICIO
  // *************************************************************************************
  if pcTipoItem = 'B'
  then begin
    sSQL:='SELECT '+
          'DECODE(BPATR.PLACONTAC,        NULL, BPREV.PLACONTAC,        BPATR.PLACONTAC)        PLACONTAC, '+
          'DECODE(BPATR.PLACONTACABN,     NULL, BPREV.PLACONTACABN,     BPATR.PLACONTACABN)     PLACONTACABN, '+
          'DECODE(BPATR.CODCENTROCUSTOC,  NULL, BPREV.CODCENTROCUSTOC,  BPATR.CODCENTROCUSTOC)  CODCENTROCUSTOC, '+
          'DECODE(BPATR.CODCENTROCUSTOCA, NULL, BPREV.CODCENTROCUSTOCA, BPATR.CODCENTROCUSTOCA) CODCENTROCUSTOCA, '+
          'DECODE(BPATR.PLACONTAD,        NULL, BPREV.PLACONTAD,        BPATR.PLACONTAD)        PLACONTAD, '+
          'DECODE(BPATR.PLACONTADABN,     NULL, BPREV.PLACONTADABN,     BPATR.PLACONTADABN)     PLACONTADABN, '+
          'DECODE(BPATR.CODCENTROCUSTOD,  NULL, BPREV.CODCENTROCUSTOD,  BPATR.CODCENTROCUSTOD)  CODCENTROCUSTOD, '+
          'DECODE(BPATR.CODCENTROCUSTODA, NULL, BPREV.CODCENTROCUSTODA, BPATR.CODCENTROCUSTODA) CODCENTROCUSTODA, '+
          'DECODE(BPATR.CODSUBCONTA,      NULL, BPREV.CODSUBCONTA,      BPATR.CODSUBCONTA)      CODSUBCONTA, '+
          'DECODE(BPATR.CODSUBCONTAABN,   NULL, BPREV.CODSUBCONTAABN,   BPATR.CODSUBCONTAABN)   CODSUBCONTAABN, '+
          'DECODE(BPATR.CODTIPRECDES,     NULL, BPREV.CODTIPRECDES,     BPATR.CODTIPRECDES)     CODTIPRECDES, '+
          'DECODE(BPATR.CODTIPRECDESABN,  NULL, BPREV.CODTIPRECDESABN,  BPATR.CODTIPRECDESABN)  CODTIPRECDESABN, '+
          'DECODE(BPATR.CODCENTRORESPON,  NULL, BPREV.CODCENTRORESPON,  BPATR.CODCENTRORESPON)  CODCENTRORESPON, '+
          'DECODE(BPATR.CODCENTRORESPONA, NULL, BPREV.CODCENTRORESPONA, BPATR.CODCENTRORESPONA) CODCENTRORESPONA, '+
          'DECODE(BPATR.UNIDNEGOC,        NULL, BPREV.UNIDNEGOC,        BPATR.UNIDNEGOC)        UNIDNEGOC, '+
          'DECODE(BPATR.UNIDNEGOCABN,     NULL, BPREV.UNIDNEGOCABN,     BPATR.UNIDNEGOCABN)     UNIDNEGOCABN '+
          'FROM  BENEFPLANPATRO BPATR, BENEFPLANPREV BPREV '+
          'WHERE (BPATR.IDPESSJUR(+)    = '+IntToStr(piIdPessJur)+') '+
          'AND   (BPATR.IDPLANOPREV(+)  = BPREV.IDPLANOPREV) '+
          'AND   (BPATR.IDBENEFICIO(+)  = BPREV.IDBENEFICIO) '+
          'AND   (BPREV.IDPLANOPREV     = '+IntToStr(piIdPlanoPrev)+') '+
          'AND   (BPREV.IDBENEFICIO     = '+IntToStr(piIdItem)+') ';
    if FazQuery(qryAux, sSQL)
    then begin


      // Abono de Beneficio      
      if (Copy(psAnoMesReferencia,6,2) = '13') And (Copy(psAnoMesCobranca,6,2) = '12')
      then begin
        sPlacontaC       := Trim(qryAux.fieldbyname('PLACONTACABN').AsString);
        sCodSubConta     := Trim(qryAux.fieldbyname('CODSUBCONTAABN').AsString);
        sCodCentroCustoC := Trim(qryAux.fieldbyname('CODCENTROCUSTOCA').AsString);
        sPlacontaD       := Trim(qryAux.fieldbyname('PLACONTADABN').AsString);
        sCodCentroCustoD := Trim(qryAux.fieldbyname('CODCENTROCUSTODA').AsString);
        sUnidNegoc       := Trim(qryAux.fieldbyname('UNIDNEGOCABN').AsString);
        sCodCentroRespon := Trim(qryAux.fieldbyname('CODCENTRORESPONA').AsString);
        sCodTipRecDes    := Trim(qryAux.fieldbyname('CODTIPRECDESABN').AsString);
      end
      else begin
        sPlacontaC       := Trim(qryAux.fieldbyname('PLACONTAC').AsString);
        sCodSubConta     := Trim(qryAux.fieldbyname('CODSUBCONTA').AsString);
        sCodCentroCustoC := Trim(qryAux.fieldbyname('CODCENTROCUSTOC').AsString);
        sPlacontaD       := Trim(qryAux.fieldbyname('PLACONTAD').AsString);
        sCodCentroCustoD := Trim(qryAux.fieldbyname('CODCENTROCUSTOD').AsString);
        sUnidNegoc       := Trim(qryAux.fieldbyname('UNIDNEGOC').AsString);
        sCodCentroRespon := Trim(qryAux.fieldbyname('CODCENTRORESPON').AsString);
        sCodTipRecDes    := Trim(qryAux.fieldbyname('CODTIPRECDES').AsString);
      end;
      Result := True;
    end;


    // Se for devolucao, inverter as contas crédito e débito
    if piFlgDevolucao = 1
    then begin
      sCentroCustoDAux := sCodCentroCustoD;
      sCentroCustoCAux := sCodCentroCustoC;
      sPlaContaDAux    := sPlaContaD;
      sPlaContaCAux    := sPlaContaC;

      sPlaContaC       := sPlaContaDAux;
      sPlaContaD       := sPlaContaCAux;
      sCodCentroCustoD := sCentroCustoCAux;
      sCodCentroCustoC := sCentroCustoDAux;
    end;
  end;

  // *************************************************************************************
  // Fazendo Integracao de CONTRIBUICAO
  // *************************************************************************************
  if pcTipoItem = 'C'
  then begin
    sSQL:='SELECT '+
          'DECODE(CPATR.PLACONTAC,         NULL, CPREV.PLACONTAC,         CPATR.PLACONTAC)         PLACONTAC,         '+
          'DECODE(CPATR.PLACONTAC13,       NULL, CPREV.PLACONTAC13,       CPATR.PLACONTAC13)       PLACONTAC13,       '+
          'DECODE(CPATR.CODCENTROCUSTOC,   NULL, CPREV.CODCENTROCUSTOC,   CPATR.CODCENTROCUSTOC)   CODCENTROCUSTOC,   '+
          'DECODE(CPATR.CODCENTROCUSTOC13, NULL, CPREV.CODCENTROCUSTOC13, CPATR.CODCENTROCUSTOC13) CODCENTROCUSTOC13, '+
          'DECODE(CPATR.PLACONTAD,         NULL, CPREV.PLACONTAD,         CPATR.PLACONTAD)         PLACONTAD,         '+
          'DECODE(CPATR.PLACONTAOUTROMES,  NULL, CPREV.PLACONTAOUTROMES,  CPATR.PLACONTAOUTROMES)  PLACONTAOUTROMES,  '+
          'DECODE(CPATR.PLACONTAD13,       NULL, CPREV.PLACONTAD13,       CPATR.PLACONTAD13)       PLACONTAD13,       '+
          'DECODE(CPATR.CODCENTROCUSTOD,   NULL, CPREV.CODCENTROCUSTOD,   CPATR.CODCENTROCUSTOD)   CODCENTROCUSTOD,   '+
          'DECODE(CPATR.CODCENTROCUSTOD13, NULL, CPREV.CODCENTROCUSTOD13, CPATR.CODCENTROCUSTOD13) CODCENTROCUSTOD13, '+
          'DECODE(CPATR.CODSUBCONTA,       NULL, CPREV.CODSUBCONTA,       CPATR.CODSUBCONTA)       CODSUBCONTA,       '+
          'DECODE(CPATR.CODSUBCONTA13,     NULL, CPREV.CODSUBCONTA13,     CPATR.CODSUBCONTA13)     CODSUBCONTA13,     ';

   If sNaturezaDocumento = 'R'
     Then
       If piFlgDevolucao = 0
        Then sSQL := sSQL +
          'DECODE(CPATR.CODTIPRECDES,      NULL, CPREV.CODTIPRECDES,      CPATR.CODTIPRECDES)      CODTIPRECDES,      '+
          'DECODE(CPATR.CODTIPRECDES13,    NULL, CPREV.CODTIPRECDES13,    CPATR.CODTIPRECDES13)    CODTIPRECDES13,    '
        Else sSQL := sSQL +
          'DECODE(CPATR.CODTIPRECEBDEV,    NULL, CPREV.CODTIPRECEBDEV,    CPATR.CODTIPRECEBDEV)    CODTIPRECDES,      '+ 
          'DECODE(CPATR.CODTIPRECEBDEV13,  NULL, CPREV.CODTIPRECEBDEV13,  CPATR.CODTIPRECEBDEV13)  CODTIPRECDES13,    '  
     Else
       If piFlgDevolucao = 0
        Then sSQL := sSQL +
          'DECODE(CPATR.CODTIPDESEMBCAR,   NULL, CPREV.CODTIPDESEMBCAR,   CPATR.CODTIPDESEMBCAR)   CODTIPRECDES,      '+
          'DECODE(CPATR.CODTIPDESEMB13,    NULL, CPREV.CODTIPDESEMB13,    CPATR.CODTIPDESEMB13)    CODTIPRECDES13,    '
        Else sSQL := sSQL +
          'DECODE(CPATR.CODTIPDESEMBDEVOL, NULL, CPREV.CODTIPDESEMBDEVOL, CPATR.CODTIPDESEMBDEVOL) CODTIPRECDES,      '+
          'DECODE(CPATR.CODTIPDESEMB13,    NULL, CPREV.CODTIPDESEMB13,    CPATR.CODTIPDESEMB13)    CODTIPRECDES13,    ';


    sSQL := sSQL +
          'DECODE(CPATR.CODCENTRORESPON,   NULL, CPREV.CODCENTRORESPON,   CPATR.CODCENTRORESPON)   CODCENTRORESPON,   '+
          'DECODE(CPATR.CODCENTRORESPON13, NULL, CPREV.CODCENTRORESPON13, CPATR.CODCENTRORESPON13) CODCENTRORESPON13, '+
          'DECODE(CPATR.PLACONTADPROVIS,   NULL, CPREV.PLACONTADPROVIS,   CPATR.PLACONTADPROVIS)   PLACONTADPROVIS,   '+ 
          'DECODE(CPATR.PLACONTACPROVIS,   NULL, CPREV.PLACONTACPROVIS,   CPATR.PLACONTACPROVIS)   PLACONTACPROVIS,   '+ 
          'DECODE(CPATR.UNIDNEGOC,         NULL, CPREV.UNIDNEGOC,         CPATR.UNIDNEGOC)         UNIDNEGOC,         '+
          'DECODE(CPATR.UNIDNEGOC13,       NULL, CPREV.UNIDNEGOC13,       CPATR.UNIDNEGOC13)       UNIDNEGOC13,       '+
          'DECODE(CPATR.CODTIPDOC,         NULL, CPREV.CODTIPDOC,         CPATR.CODTIPDOC)         CODTIPDOC,         '+
          'DECODE(CPATR.CODTIPDOC13,       NULL, CPREV.CODTIPDOC13,       CPATR.CODTIPDOC13)       CODTIPDOC13,       '+
          'DECODE(CPATR.CODPORTFORMA,      NULL, CPREV.CODPORTFORMA,      CPATR.CODPORTFORMA)      CODPORTFORMA,      '+
          'DECODE(CPATR.CODPORTFORMA13,    NULL, CPREV.CODPORTFORMA13,    CPATR.CODPORTFORMA13)    CODPORTFORMA13     '+
          'FROM CONTPLANPATRO CPATR, CONTPREV CPREV                      '+
          'WHERE (CPATR.IDPESSJUR(+)      = '+IntToStr(piIdPessJur)+')   '+
          'AND   (CPATR.IDPLANOPREV(+)    = CPREV.IDPLANOPREV)           '+
          'AND   (CPATR.IDCONTRIBUICAO(+) = CPREV.IDCONTRIBUICAO)        '+
          'AND   (CPREV.IDPLANOPREV       = '+IntToStr(piIdPlanoPrev)+') '+
          'AND   (CPREV.IDCONTRIBUICAO    = '+IntToStr(piIdItem)+')      ';
    if FazQuery(qryAux, sSQL) then
    begin

      // Contribuicao sobre 13o.

      // consultar PARAMSAL13 e verificar se o mes referecia é igual ao do paramatro
      if (Copy(psAnoMesReferencia,6,2) = '13')
      then begin

        If Trim(qryAux.fieldbyname('PLACONTAC13').AsString) <> ''
         Then sPlacontaC       := Trim(qryAux.fieldbyname('PLACONTAC13').AsString)
         Else sPlacontaC       := Trim(qryAux.fieldbyname('PLACONTAC').AsString);

        If Trim(qryAux.fieldbyname('CODSUBCONTA13').AsString) <> ''
         Then sCodSubConta     := Trim(qryAux.fieldbyname('CODSUBCONTA13').AsString)
         Else sCodSubConta     := Trim(qryAux.fieldbyname('CODSUBCONTA').AsString);

        If Trim(qryAux.fieldbyname('CODCENTROCUSTOC13').AsString) <> ''
         Then sCodCentroCustoC := Trim(qryAux.fieldbyname('CODCENTROCUSTOC13').AsString)
         Else sCodCentroCustoC := Trim(qryAux.fieldbyname('CODCENTROCUSTOC').AsString);

        If Trim(qryAux.fieldbyname('PLACONTAD13').AsString) <> ''
         Then sPlacontaD       := Trim(qryAux.fieldbyname('PLACONTAD13').AsString)
         Else If Trim(qryAux.fieldbyname('PLACONTAOUTROMES').AsString) <> ''
               Then sPlacontaD       := Trim(qryAux.fieldbyname('PLACONTAOUTROMES').AsString)
               Else sPlacontaD       := Trim(qryAux.fieldbyname('PLACONTAD').AsString);

        If Trim(qryAux.fieldbyname('CODCENTROCUSTOD13').AsString) <> ''
         Then sCodCentroCustoD := Trim(qryAux.fieldbyname('CODCENTROCUSTOD13').AsString)
         Else sCodCentroCustoD := Trim(qryAux.fieldbyname('CODCENTROCUSTOD').AsString);

        If Trim(qryAux.fieldbyname('UNIDNEGOC13').AsString) <> ''
         Then sUnidNegoc       := Trim(qryAux.fieldbyname('UNIDNEGOC13').AsString)
         Else sUnidNegoc       := Trim(qryAux.fieldbyname('UNIDNEGOC').AsString);

        If Trim(qryAux.fieldbyname('CODCENTRORESPON13').AsString) <> ''
         Then sCodCentroRespon := Trim(qryAux.fieldbyname('CODCENTRORESPON13').AsString)
         Else sCodCentroRespon := Trim(qryAux.fieldbyname('CODCENTRORESPON').AsString);

        If Trim(qryAux.fieldbyname('CODTIPRECDES13').AsString) <> ''
         Then sCodTipRecDes    := Trim(qryAux.fieldbyname('CODTIPRECDES13').AsString)
         Else sCodTipRecDes    := Trim(qryAux.fieldbyname('CODTIPRECDES').AsString);

        If Trim(qryAux.fieldbyname('CODPORTFORMA13').AsString) <> ''
         Then sCodPortForma    := Trim(qryAux.fieldbyname('CODPORTFORMA13').AsString)
         Else sCodPortForma    := Trim(qryAux.fieldbyname('CODPORTFORMA').AsString);
      end
      else begin
        sPlacontaC       := Trim(qryAux.fieldbyname('PLACONTAC').AsString);
        sCodSubConta     := Trim(qryAux.fieldbyname('CODSUBCONTA').AsString);
        sCodCentroCustoC := Trim(qryAux.fieldbyname('CODCENTROCUSTOC').AsString);

        if (psAnoMesCobranca <> psAnoMesReferencia) and (Trim(qryAux.fieldbyname('PLACONTAOUTROMES').AsString) <> '')
        then sPlacontaD       := Trim(qryAux.fieldbyname('PLACONTAOUTROMES').AsString)
        else sPlacontaD       := Trim(qryAux.fieldbyname('PLACONTAD').AsString);

        sCodCentroCustoD := Trim(qryAux.fieldbyname('CODCENTROCUSTOD').AsString);
        sUnidNegoc       := Trim(qryAux.fieldbyname('UNIDNEGOC').AsString);
        sCodCentroRespon := Trim(qryAux.fieldbyname('CODCENTRORESPON').AsString);
        sCodTipRecDes    := Trim(qryAux.fieldbyname('CODTIPRECDES').AsString);
        sCodPortForma    := Trim(qryAux.fieldbyname('CODPORTFORMA').AsString);
        sPlaContaDProvis := Trim(qryAux.fieldbyname('PLACONTADPROVIS').AsString); 
        sPlaContaCProvis := Trim(qryAux.fieldbyname('PLACONTACPROVIS').AsString); 
      end;
      Result := True;
    end;

    // Se for devolucao, inverter as contas crédito e débito
    if piFlgDevolucao = 1
    then begin
      sCentroCustoDAux := sCodCentroCustoD;
      sCentroCustoCAux := sCodCentroCustoC;
      sPlaContaDAux    := sPlaContaD;
      sPlaContaCAux    := sPlaContaC;

      sPlaContaC       := sPlaContaDAux;
      sPlaContaD       := sPlaContaCAux;
      sCodCentroCustoD := sCentroCustoCAux;
      sCodCentroCustoC := sCentroCustoDAux;
    end;
  end;

  if piFlgDevolucao = 0
  then sRecPag := 'R'
  else sRecPag := 'P';

  if sNaturezaDocumento <> '' then sRecPag := sNaturezaDocumento; 
end; // BuscaInfFolhaPatro


end.
