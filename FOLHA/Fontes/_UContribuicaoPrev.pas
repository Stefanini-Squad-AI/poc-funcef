// *****************************************************************************
// ***************************** REGISTRO DE ALTERAÇÕES ************************
// *****************************************************************************
// Autor(a)    : Paulo Ramos
// Data        : 10/01/2007
// Rotina      : EnviaContribuicao
// Pendência   : 24091
// Descricao   : Tratar o campo FLGATRASODEVOL para devolução de contribuição
//   sobre abono.
//------------------------------------------------------------------------------
// Autor(a)    : Paulo Ramos
// Data        : 20/09/2006
// Rotina      : Diversas
// Pendência   : 23361
// Descricao   : Retirar RULE de consultas.
//------------------------------------------------------------------------------
// Autor(a)    : Paulo Ramos
// Data        : 17/05/2006
// Rotina      : EnviaContribuicao
// Pendência   : 22353
// Descricao   : Tratar no adiantamento de abono anual o lançamento da rubrica
//               respectiva na Tmpdesc.
//------------------------------------------------------------------------------
// Autor(a)    : Paulo Ramos
// Data        : 11/04/2006
// Rotina      : EnviaContribuicao
// Pendência   : 22062
// Descricao   : Se FolhaOrigem = 'B' gravar tmpdesc.codportforma = null
//------------------------------------------------------------------------------
unit UContribuicaoPrevFB;

interface

uses SysUtils, wwQuery, Messages, Dialogs, Windows, Classes, Graphics, Controls,
     Db, USistema, uAdmPrevFB, UParticipante, UobjFolha, UIntegraBack, uDatabase,
     UDocumento, USincronismo, DAprev, UMensErro, UFuncoesUteisFB, ULancContab;

// *****************************************************************************
// Função BUSCAINFFINANCCONTRIB - Busca nos diversos níveis de tabela os campos relativos
//                        à contabilidade, contas a pagar ou contas a receber seguindo
//                        a seguinte ordem :
//                          CONTRIBPREVPARTP/CONTRIBPREVPATRO (a nivel de participante/patrocinadora)
//                          CONTPLANPATRO (a nivel de plano/patrocinadora)
//                          CONTPREV      (a nivel de plano)
// Parâmetros : sSQL       = string para a funcao adicionar o valor do campo encontrado (ou nulo)
//              sBrancos   = string para a funcao adicionar o nome do campo caso ele esteja em branco
//                           em todos os níveis
//              sValorEncontrado = valor encontrado
//              sNomeCampo = nome físico do campo a procurar nas tabelas
//              sValorCampo = valor do campo caso a funcao que chama já saiba
//              cTipo      = tipo do campo (N - Numérico, S - string)
//              pIdPessJur = identificador da patrocinadora
//              pIdPlanoPrev = identificador do plano previdenciario
//              pIdContrib   = identificador da contribuicao
// Retorno    : True = encontrou o valor
//              False = nao encontrou o valor
// *****************************************************************************
function BuscaInfFinancContrib(
  var sSQL,
  sBrancos,
  sValorEncontrado : string;
  sNomeCampo,
  sValorCampo : string;
  cTipo : char;
  pIdPessJur,
  pIdPlanoPrev,
  pIdContrib,
  piIdContribAnt : integer ) : boolean;

// *****************************************************************************
// Função ENVIACONTRIBUICAO - Grava na TMPDESC o envio de um registro de contribuicao
// Parâmetros :  qry             = qry com o registro a ser enviado
//               piOrdem         = ordem do registro que está sendo enviado no lote
//               piIdLote        = identificador do lote a ser enviado
//               liPeriodo       = periodo contabil do envio
//               liExercicio     = exercicio contabil do envio
//               sSitFundacao    = situacao do participante na fundacao(flgINTERNO da SITPART)
//               sCamposObrig    = string que será preenchida pela função com os nomes
//                                 dos campos de integracao financeira, OBRIGATORIOS,
//                                 que nao estao preenchidos.
//               sCamposNObrig    = string que será preenchida pela função com os nomes
//                                 dos campos de integracao financeira, NAO obrigatorios,
//                                 que nao estao preenchidos.
// Retorno    : -1     = erro no envio
//              valor  = valor enviado
// *****************************************************************************
function EnviaContribuicao(qry: TwwQuery;
                           piOrdem,
                           piIdLote,
                           liPeriodo,
                           liExercicio         : longInt;
                           pIdTitular,  
                           sSitFundacao,
                           psFlgIntEvento      : string;
                           var sCamposObrig,
                               sCamposNObrig   : string;
                               piUltimaContrib : integer;
                           var bExigeFinanc    : boolean;
                           iflgprovisorio:integer ) : real;

{ Calcula o salário virtual do assistido }
function CalculaSalarioVirtual(qryAux: TwwQuery; sMesRef, sIdPessjur,
  sIdPlanoprev, sIdPessoa, sIdBeneficio, sDataRef: string;
  var sValorSal: string): boolean;

//função que é alimentada com o mês de fererência
//que então lê da table reajsalpatro
//para voltar o valor passado reajustado pela regra
//cadastrada, se for o caso
function ReajustaSalPatro(qryaux : twwquery ; sMesRef, sIdPessjur ,
                          sIdPlanoprev, sIdPessoa,
                          sDataRef: String ;
                          var sValorSal : String) : Boolean;

function BuscaDescCobranca(piIdContribuicao,
                           piIdPlanoPrev: Integer;
                           qryAux: Twwquery):string;

function BuscaRamoForCli(psSitFundacao: string;
                         cRecPag: char): longint;

procedure VefificaContabMantido(qryaux : TwwQuery;
                                var bContabiliza : boolean;
                                piIdPlanoPrev : Integer);

procedure FazerInsertContab_Contrib(
                            qryContabil: TwwQuery;
                            sContaContabil,
                            sCentroCusto,
                            sDebCre, sTipoDC,
                            sNumDoc, sHist1,
                            sHist2,  sHist3,
                            sHist4,  sHist5: string;
                            iUnidNegoc, iSubConta: integer;
                            rValorCorrente,
                            rValorMoeda: real;
                            dDataDia: TDateTime;
                            sTipCodigo: string;
                            piIdPessJur,
                            piIdPlanoPrev: longint);

Procedure AlimentaQryDocumentos_Contrib(
  QryDocumentos      : TWWQuery;
  Coddocumento,
  NumLancto,
  plano,
  unidnegoc             : Integer;
  placonta,
  codcentrorespon,
  codtiprecdes          : String;
  valor                 : real;
  piIdPessJur,
  piIdPlanoPrev,
  pFlgDevolucao         : longint );

procedure IncluiContabilidade_Contrib(
  qryContabil: TWWQuery;
  qryAux              :TwwQuery;
  var iPlnCodigo      : Integer;
  var sMsgErro        : string);

function EnviaContribuicaoBANCO (qryContabil, qryDocumentos,
                                 qryEnvio,    qryAux             : TwwQuery;
                                 sMes,        sAnoMesReferencia,
                                 sHistDeb,    sHistCre,
                                 sDataBoleta                     : string;
                                 piIdPessJur, piIdPlanoPrev,
                                 piIdPessoa,  piIdContribuicao,
                                 piUltimaContrib                : longint;
                                 Documento                      : TDocumento;
                                 psFlgPagador,
                                 psFlgSitPart                   : string;
                                 piCodPortForma                 : longint;
                                 pFlagPortForma                 : Integer;
                                 cRecPag                        : char;
                                 dValorEnviar                   : double;
                                 var sMsgErro                   : string;
                                 var iCodLancCAPCAR,iPlnCodigo : longint ) : real;

implementation

// *****************************************************************************
function BuscaInfFinancContrib(var sSQL,sBrancos,sValorEncontrado : string;
                               sNomeCampo,sValorCampo : string;
                               cTipo : char;
                               pIdPessJur,pIdPlanoPrev,pIdContrib,piIdContribAnt : integer ) : boolean;
var
   sValorAchado : string;
begin
  Result := True;
  if Trim(sValorCampo) <> ''
  then begin // o campo já está preenchido
    if cTipo = 'S'
    then sSQL := sSQL +', '''+sValorCampo+''''
    else sSQL := sSQL +', '+sValorCampo;
    sValorEncontrado := sValorCampo;
    Exit;
  end
  else begin
    with dtmAPrev do
    begin
       sValorAchado := '';
       //procurar em CONTPLANPATRO
       try
          if piIdContribAnt <> pIdContrib
          then begin
          qryContPlanPatro.Close;
          qryContPlanPatro.ParambyName('IdPlanoPrev').AsInteger    := pIdPlanoPrev;
          qryContPlanPatro.ParambyName('IdPessJur').AsInteger      := pIdPessJur;
          qryContPlanPatro.ParambyName('IdContribuicao').AsInteger := pIdContrib;
          qryContPlanPatro.Open;
          end;
          if qryContPlanPatro.FieldByName(sNomeCampo).AsString <> ''
          then sValorAchado := qryContPlanPatro.FieldByName(sNomeCampo).AsString;
       except
       end;

       if sValorAchado <> ''
       then begin
          if cTipo = 'S'
          then sSQL := sSQL +', '''+sValorAchado+''''
          else sSQL := sSQL +', '+sValorAchado;
          sValorEncontrado := sValorAchado;
          Exit;
       end;

       // PROCURAR EM CONTPREV
       try
          if piIdContribAnt <> pIdContrib
          then begin
          qryContPREV.Close;
          qryContPREV.ParambyName('IdPlanoPrev').AsInteger := pIdPlanoPrev;
          qryContPREV.ParambyName('IdContribuicao').AsInteger := pIdContrib;
          qryContPREV.Open;
          end;
          if qryContPREV.FieldByName(sNomeCampo).AsString <> ''
          then sValorAchado := qryContPREV.FieldByName(sNomeCampo).AsString;
       except
       end;

       if sValorAchado <> ''
       then begin
          if cTipo = 'S'
          then sSQL := sSQL +', '''+sValorAchado+''''
          else sSQL := sSQL +', '+sValorAchado;
          sValorEncontrado := sValorAchado;
          Exit;
       end;
    end;// with dtmAPrev
  end;//else-if sValorCampo <> ''

  if sValorAchado = ''
  then begin
    sSQL     := sSQL+', NULL ';
    sBrancos := sBrancos + sNomeCampo+',';
    sValorEncontrado := sValorAchado;
    Result   := False;
  end;
end; //BuscaInfFinancContab

function EnviaContribuicao(qry: TwwQuery;
                           piOrdem,
                           piIdLote,
                           liPeriodo,
                           liExercicio     : longInt;
                           pIdTitular,  
                           sSitFundacao,
                           psFlgIntEvento      : string;
                       var sCamposObrig,
                           sCamposNObrig   : string;
                           piUltimaContrib : integer;
                       var bExigeFinanc    : boolean;
                       iflgprovisorio : integer ) : real;
var
    ss,
    sSQLFields, sSQLValues, sCodPortForma, sCodProvDesc,
    sIdRubrica, sValorEncontrado, sDataCobranca: string;

    bEnvioEncerrado,
    bCCustoCObrig,       bCCustoDObrig,    bCResponObrig,
    bUnidNegocObrig: boolean;

    rValorEnviado                                               : real;

    // Campos de Integracao com financeiro
    sRecPagDevol,      sCodTipRecDesembDevol,
    sCodTipDesembCAR,  sMsgErro,
    sPlano,            sPlaContaC,        sPlaContaD,
    sCodCentroCustoC,  sCodCentroCustoD,  sIdEmpresa,
    sUnidNegoc,        sIdEmpresaProp,    sCodCentroRespon,
    sCodSubConta,      sRecPag,           sCodTipRecDes,
    sTipCodigo,        sCodTipDoc,        sCodPortadorForma : string;
    cTipoEnvPrev: char;
    lidseq: integer; 
    lbantecip: boolean; //TRATA ADIANTAMENTO DE ABONO PARA RUBRICA DE CONTRIBUIÇÃO
begin
  Result        := -1;
  rValorEnviado := 0;

  // Sincronismo : Se for preparo de Ativo ou Mantido parcial
  //               Entao Se a patrocinadora for a Fundacao
  //                     Entao verificar se a Folha CM já foi encerrada
  //                     Senao verificar se o envio do CCP já foi encerrado
  //               Senao Se for preparo de Assistido
  //                     Entao verificar se a Folha de Beneficio já foi encerrada
  bEnvioEncerrado := False;

  if (sSitFundacao = 'AT') or (sSitFundacao = 'MP') then
  begin
    if qry.FieldByName('IdPessJur').AsInteger = iIdFundacao then
      bEnvioEncerrado:=VerificaFechamento(qry.FieldByName('IdPessJur').AsInteger,
                                          cteIdModuloFolhaCM,
                                          qry.FieldByName('MesCobranca').AsString,
                                          'E' ,cTipoEnvPrev)
    else
      bEnvioEncerrado:=VerificaFechamento(qry.FieldByName('IdPessJur').AsInteger,
                                          cteIdModuloCCP,
                                          qry.FieldByName('MesCobranca').AsString,
                                          'E',cTipoEnvPrev );
    sMsgErro := 'O Envio de Contribuições para a Patrocinadora  para o mês '+
               qry.FieldByName('MesCobranca').AsString+' já foi encerrado.';
  end
  else
    if (sSitFundacao = 'AS') then
    begin
      bEnvioEncerrado:=VerificaFechamento(qry.FieldByName('IdPessJur').AsInteger,
                                          cteIdModuloFolhaBen,
                                          qry.FieldByName('MesCobranca').AsString,
                                          'E' ,cTipoEnvPrev);
      sMsgErro := 'A Folha de Benefícios para o mês '+qry.FieldByName('MesCobranca').AsString+' já '+
                  'foi efetivada.';
    end;

  if bEnvioEncerrado then
  begin
    MsgDlg(sMsgErro+ ' Logo, para executar o envio para este mês será necessário desfazer o envio encerrado. ',
          'Erro',mtError, [mbOk, mbHelp],0);
    Exit;
  end;

  // Preencher nomes dos campos de acordo com o mes
  if (Copy(qry.FieldByName('MesReferencia').AsString,6,2)  <> '13') or
  // SE ABONO DE ANO ANTERIOR CONTABILIZAÇÃO COMO DESPESA
     (((copy(qry.FieldByName('MesReferencia').AsString,6,2) = '13')) and
       (copy(qry.FieldByName('MesReferencia').AsString,1,4) <
        copy(qry.FieldByName('MesCobranca').AsString,1,4))) then
  begin
    sPlano            := 'PLANO';
    sPlaContaC        := 'PLACONTAC';
    sPlaContaD        := 'PLACONTAD';
    sCodCentroCustoC  := 'CODCENTROCUSTOC';
    sCodCentroCustoD  := 'CODCENTROCUSTOD';
    sIdEmpresa        := 'IDEMPRESA';
    sUnidNegoc        := 'UNIDNEGOC';
    sIdEmpresaProp    := 'IDEMPRESAPROP';
    sCodCentroRespon  := 'CODCENTRORESPON';
    sCodSubConta      := 'CODSUBCONTA';
    sRecPag           := 'RECPAG';
    sCodTipRecDes     := 'CODTIPRECDES';
    sTipCodigo        := 'TIPCODIGO';
    sCodTipDoc        := 'CODTIPDOC';
    sCodPortadorForma := 'CODPORTFORMA';
  end
  else
  begin
    sPlano            := 'PLANO13';
    sPlaContaC        := 'PLACONTAC13';
    sPlaContaD        := 'PLACONTAD13';
    sCodCentroCustoC  := 'CODCENTROCUSTOC13';
    sCodCentroCustoD  := 'CODCENTROCUSTOD13';
    sIdEmpresa        := 'IDEMPRESA13';
    sUnidNegoc        := 'UNIDNEGOC13';
    sIdEmpresaProp    := 'IDEMPRESAPROP13';
    sCodCentroRespon  := 'CODCENTRORESPON13';
    sCodSubConta      := 'CODSUBCONTA13';
    sRecPag           := 'RECPAG13';
    sCodTipRecDes     := 'CODTIPRECDES13';
    sTipCodigo        := 'TIPCODIGO133';
    sCodTipDoc        := 'CODTIPDOC13';
    sCodPortadorForma := 'CODPORTFORMA13';
  end;

    sRecPagDevol          := 'RECPAGDEVOL';
    sCodTipRecDesembDevol := 'CODTIPDESEMBDEVOL';
    sCodTipDesembCAR      := 'CODTIPDESEMBCAR';

    // Preencher codportforma qualquer
    dtmAPrev.qry.Close;
    dtmAPrev.qry.SQL.Clear;
    dtmAPrev.qry.SQL.Add('SELECT CODPORTFORMA FROM PORTADORFORMA ');
    dtmAPrev.qry.Open;
    if dtmAPrev.qry.IsEmpty then
      sCodPortForma := 'NULL'
    else
      sCodPortForma := dtmAPrev.qry.FieldByName('CodPortForma').AsString;
    dtmAPrev.qry.Close;

    // Buscar IdRubrica e CodProvDesc correspondentes à contribuicao que esta sendo enviada
    if (not dtmAPrev.qryAuxContrib.Active) or
       (dtmAPrev.qryAuxContrib.FieldByName('IdPlanoPrev').AsInteger <>
        qry.FieldByName('IdPlanoPrev').AsInteger) then
    begin
      dtmAPrev.qryAuxContrib.Close;
      dtmAPrev.qryAuxContrib.ParamByName('IdPlanoPrev').AsInteger := qry.FieldByName('IdPlanoPrev').AsInteger;
      dtmAPrev.qryAuxContrib.Open;
      if dtmAPrev.qryAuxContrib.IsEmpty then
        Exit;
    end;

    sIdRubrica   := '';
    sCodProvDesc := '';

    if dtmAPrev.qryAuxContrib.Locate('IdContribuicao',
         qry.FieldByName('IdContribuicao').AsInteger,[loCaseInsensitive]) then
    begin
      if Copy(qry.FieldByName('MesReferencia').AsString,6,2) = '13' then
      begin
        try
          dtmAPrev.qryAux2.close;
          dtmAPrev.qryAux2.sql.clear;
          dtmAPrev.qryAux2.sql.add(
            'SELECT 1 '+
            'FROM HSTBENEFBFCIARIO '+
            'WHERE IDPESSOA = '+qry.fieldbyname('IDPESSOA').asstring+' '+
            'AND IDPLANOPREV = '+qry.fieldbyname('IDPLANOPREV').asstring+' '+
            'AND IDPESSJUR = '+qry.fieldbyname('IDPESSJUR').asstring+' '+
            'AND MES = '+quotedstr(qry.fieldbyname('MESCOBRANCA').asstring)+' '+
            'AND MESREFERENCIA = '+quotedstr(qry.fieldbyname('MESREFERENCIA').asstring)+' '+
            'AND FLGTIPOREGISTRO IN (2,5) '
            );
          dtmAPrev.qryAux2.open;
          lbantecip:=not dtmAPrev.qryAux2.isempty;
        except
          lbantecip:=false;
        end;

	if qry.FieldByName('FlgDevolucao').AsInteger = 1 then
        begin
          sIdRubrica:=dtmAPrev.qryAuxContrib.FieldByName('IDRUBDECTERCDEVOL').AsString;  // Devolucao

          If ((iflgprovisorio = 1) or lbantecip) and 
             not dtmAPrev.qryAuxContrib.FieldByName('IDRUBDEVADIANT13').isnull then
            sIdRubrica:=dtmAPrev.qryAuxContrib.FieldByName('IDRUBDEVADIANT13').AsString; // devolucao 13o. - adiantamento
        end
        else
        begin
          sIdRubrica:=dtmAPrev.qryAuxContrib.FieldByName('IDRUBDECTERC').AsString; // 13o.
          //SÓ PEGAR RUBRICA DE ADIANTAMENTO SE NÃO FOR NULO
          If ((iflgprovisorio = 1) or lbantecip) and 
             not dtmAPrev.qryAuxContrib.FieldByName('IDRUBADIANT13').isnull then
            sIdRubrica := dtmAPrev.qryAuxContrib.FieldByName('IDRUBADIANT13').AsString; // devolucao 13o. - adiantamento
        end;
      end
      else
      begin
        sIdRubrica := dtmAPrev.qryAuxContrib.FieldByName('IDRUBRICA').AsString; // Normal
        //SÓ PEGAR RUBRICA DE ADIANTAMENTO SE NÃO FOR NULO
        If (iflgprovisorio = 1) and
           not dtmAPrev.qryAuxContrib.FieldByName('IDRUBADIANT').isnull then
        begin
          sIdRubrica := dtmAPrev.qryAuxContrib.FieldByName('IDRUBADIANT').AsString; // Normal - adiantamento
        end
        else
        begin
          if qry.FieldByName('FlgDevolucao').AsInteger = 1 then
          begin
            sIdRubrica := dtmAPrev.qryAuxContrib.FieldByName('IDRUBRICADEVOLUC').AsString;  // Devolucao

            If (iflgprovisorio = 1) and
               not dtmAPrev.qryAuxContrib.FieldByName('IDRUBDEVOLADIANT').isnull then
              sIdRubrica := dtmAPrev.qryAuxContrib.FieldByName('IDRUBDEVOLADIANT').AsString; // Devolucao - adiantamento
          end
          else
          begin
            if (qry.FieldByName('MesReferencia').AsString <
                qry.FieldByName('MesCobranca').AsString) then
              sIdRubrica := dtmAPrev.qryAuxContrib.FieldByName('IDRUBRICAATRASO').AsString; // Atraso
          end;
        end;
      end; //copy

      //GARANTIR ALGUMA RUBRICA NÃO PARAMETRIZADA
      if Trim(sIdRubrica) = '' then
        sIdRubrica := dtmAPrev.qryAuxContrib.FieldByName('IDRUBRICA').AsString; // Normal

    end; //locate

    if Trim(sIdRubrica) <> '' then
    begin
       with dtmAPrev.qryRubricaXPess do
       begin
          Close;
          if sSitFundacao = 'AS'
          then ParamByName('IdPessJur').AsInteger := iIdFundacao
          else ParamByName('IdPessJur').AsInteger := qry.FieldByName('IdPessJur').AsInteger;
          ParamByName('IdRubrica').AsInteger := StrToInt(sIdRubrica);
          Open;
          if not IsEmpty
          then sCodProvDesc := FieldByName('CodProvDesc').AsString;
       end;
    end;

    // Data Cobranca é a mesma do Historico de Contribuicao
    sDataCobranca := DateToStr(qry.FieldByName('DATAPREVISAORECE').AsDateTime);

    sCamposObrig  := '';
    sCamposNObrig := '';

    // Verificar se Unidade de Negocio e Centro de Responsabilidade sao obrigatorios
    dtmAPrev.qryVerificaObrig.Close;
    dtmAPrev.qryVerificaObrig.SQL.Clear;
    dtmAPrev.qryVerificaObrig.SQL.Add(' SELECT USACRESPON,USAABC FROM PARAMGLOBAL  '+
                                      ' WHERE IDPESSOA = '+IntToStr(Sistema.idEmpresa));
    dtmAPrev.qryVerificaObrig.Open;
    if dtmAPrev.qryVerificaObrig.IsEmpty or (dtmAPrev.qryVerificaObrig.FieldByName('USACRESPON').AsString = 'N')
    then bCResponObrig := False
    else bCResponObrig := True;

    if dtmAPrev.qryVerificaObrig.IsEmpty or (dtmAPrev.qryVerificaObrig.FieldByName('USAABC').AsString = 'N')
    then bUnidNegocObrig := False
    else bUnidNegocObrig := True;

    dtmAPrev.qryVerificaObrig.Close;

    // Gravar contribuicao na tabela tmpDesc
    sSQLFields := ' IDTMPDESC, '+ 
                  ' CODPROVDESC,     FLGATRASODEVOL,  '+
                  ' FLGDESCFOLHA,    FLGDESCONTO,    FLGTIPODESC,     SEQPROPOSTA,     '+
                  ' IDDESCONTO,      IDFUNDACAO,     IDMOTIVO,        IDPESSJUR,       '+
                  ' IDPESSOA,        IDPLANOPREV,    IDPROVENTO,      IDTITULAR,       '+
                  ' INSCRICAONUMERO, MATRICULA,      MESCOBRANCA,     MESREFERENCIA,   '+
                  ' NUMPRIORIDADE,   ORDEM,          SISTORIGEM,      IDMODULO,        '+
                  ' PLACONTAC,       PLACONTAD,      PLANO,           UNIDNEGOC,       '+
                  ' CODPORTFORMA,    CODTIPDOC,      CODTIPRECDES,    RECPAG,          '+
                  ' VALORBASE1,      VALORBASE2,     VALORBASE3,      DATAREFERENCIA,  '+
                  ' CODCENTROCUSTOC, CODCENTROCUSTOD, '+
                  ' CODCENTRORESPON, CODSUBCONTA,    IDEMPRESA,       IDEMPRESAPROP,   '+
                  ' DATACOBRANCA,    NODOCUMENTO,    COMPLDOCUMENTO,  IDLOTE,          '+
                  ' IDEMPCOBRANCA,   PERIODO,        EXERCICIO,       TIPCODIGO,       '+
                  ' FLGEXISTEHST,    SITENVIO,       VALOR,                            '+
                  ' DESCRICAO,       REFERENCIA,     CODALTERADOR,    FLGALTERADOR,    '+
                  ' IDSEQINTERNOFB, '+ 
                  ' FLGINTEVENTO, '+
                  ' NUMRECEBIMENTO '; 


    // ** Preenchendo IDTMPDESC
    sSQLValues          := IntToStr(LeUltRegistro(Nil, 'TMPDESC')) + ', ';

    // ** Preenchendo CODPROVDESC
    sSQLValues          := sSQLValues + ''''+sCodProvDesc+'''';

    // ** Preenchendo FLGATRASODEVOL
    if (qry.FieldByName('FlgDevolucao').AsInteger = 0) and 
       ((qry.FieldByName('MesReferencia').AsString = qry.FieldByName('MesCobranca').AsString) or
        ((Copy(qry.FieldByName('MesReferencia').AsString,6,2) = '13') and
         
         //(Copy(qry.FieldByName('MesCobranca').AsString,6,2)   = '12') and
         (Copy(qry.FieldByName('MesReferencia').AsString,1,4) =
          Copy(qry.FieldByName('MesCobranca').AsString,1,4) ))) then
    begin
      sSQLValues := sSQLValues + ',''N''';
    end
    else
    begin
      if qry.FieldByName('FlgDevolucao').AsInteger = 1 then
      begin
        sSQLValues := sSQLValues + ',''D''';
      end
      else
      begin
        sSQLValues := sSQLValues + ',''A''';
      end;
    end;

    // ** Preenchendo FLGDESCFOLHA
    // Se o participante é assistido, o desconto vai para B - Folha de Beneficio
    //                         senao, o desconto vai paara P - Folha de Pagamento
    if sSitFundacao = 'AS'
    then begin
       sSQLValues          := sSQLValues          +', ''B''';
    end
    else begin
       if qry.FieldByName('flgDescFolha').AsInteger = 1
       then begin
          sSQLValues          := sSQLValues          +', ''P''';
       end
       else begin
          sSQLValues          := sSQLValues          +', ''O''';
       end;
    end;


    // ** Preenchendo FLGDESCONTO
    if qry.FieldByName('FlgDevolucao').AsInteger = 1 // FLGDESCONTO
    then begin
       sSQLValues          := sSQLValues          +', 0';
    end
    else begin
       sSQLValues          := sSQLValues          +', 1';
    end;

    // ** Preenchendo FLGTIPODESC
    sSQLValues             := sSQLValues +', ''P'' ';

    // ** Preenchendo chaves
    sSQLValues := sSQLValues +', '+qry.FieldByName('SeqProposta').AsString;   // SEQPROPOSTA
    sSQLValues := sSQLValues +', '+qry.FieldByName('IdContribuicao').AsString;// IDDESCONTO
    sSQLValues := sSQLValues +', '+qry.FieldByName('IdFundacao').AsString;    // IDFUNDACAO
    sSQLValues := sSQLValues +', '+qry.FieldByName('IdMotivo').AsString;      // IDMOTIVO
    sSQLValues := sSQLValues +', '+qry.FieldByName('IdPessJur').AsString;     // IDPESSJUR
    sSQLValues := sSQLValues +', '+qry.FieldByName('IdPessoa').AsString;      // IDPESSOA
    sSQLValues := sSQLValues +', '+qry.FieldByName('IdPlanoPrev').AsString;   // IDPLANOPREV

    // ** Preenchendo código da rubrica ( IDPROVENTO )
    if Trim(sIdRubrica) <> ''
    then begin
       sSQLValues          := sSQLValues +', '+sIdRubrica;
    end
    else begin
       sSQLValues          := sSQLValues +', NULL';
    end;

    // ** Preenchendo IDTITULAR
    
    sSQLValues          := sSQLValues +', '+pIdTitular;

    // ** Preenchendo INSCRICAONUMERO E MATRICULA
    if sSitFundacao <> 'AS'
    then begin
       sSQLValues := sSQLValues +', '+qry.FieldByName('InscricaoNumero').AsString; // INSCRICAONUMERO
       sSQLValues := sSQLValues +', '''+qry.FieldByName('Matricula').AsString+'''';       //MATRICULA
    end
    else begin
       sSQLValues := sSQLValues +', NULL';
       sSQLValues := sSQLValues +', NULL';
    end;

    // ** Preenchendo MESCOBRANCA E MESREFERENCIA
    sSQLValues := sSQLValues +', '''+qry.FieldByName('MesCobranca').AsString+'''';
    sSQLValues := sSQLValues +', '''+qry.FieldByName('MESREFERENCIA').AsString+'''';

    // ** Preenchendo NUMPRIORIDADE, ORDEM e SISTORIGEM
    sSQLValues          := sSQLValues+', NULL ';
    sSQLValues             := sSQLValues +', '+IntToStr(piOrdem);
    sSQLValues             := sSQLValues +', '+IntToStr(Sistema.IdModulo);
    sSQLValues             := sSQLValues +', '+IntToStr(Sistema.IdModulo);

   // INVERTER CONTABILIZACAO NO CASO DE DEVOLUCAO DE CONTRIBUICAO
   if qry.FieldByName('FlgDevolucao').AsInteger = 1 then
   begin
     
     try
       ss:=qry.FieldByName(sPlaContaD).AsString;
     except
       ss:='';
     end;

     BuscaInfFinancContrib(sSQLValues,sCamposObrig,sValorEncontrado,sPlaContaD,
                           ss, 
                           'S',
                           qry.FieldbyName('IdPessJur').AsInteger,
                           qry.FieldbyName('IdPlanoPrev').AsInteger,
                           qry.FieldByName('IdContribuicao').AsInteger, piultimacontrib ); //PLACONTAD
   end
   else
   begin
     try
       ss:=qry.FieldByName(sPlaContaC).AsString;
     except
       ss:='';
     end;

     BuscaInfFinancContrib(sSQLValues,sCamposObrig,sValorEncontrado,sPlaContaC,
                           ss, 
                           'S',
                           qry.FieldbyName('IdPessJur').AsInteger,
                           qry.FieldbyName('IdPlanoPrev').AsInteger,
                           qry.FieldByName('IdContribuicao').AsInteger, piultimacontrib ); //PLACONTAC
   end;

   // Testar se, para a conta crédito encontrada, o CentroCustoC é obrigatorio
   bCCustoCObrig := False;
   if sValorEncontrado <> ''
   then begin
      dtmAPrev.qryVerificaObrig.Close;
      dtmAPrev.qryVerificaObrig.SQL.Clear;
      dtmAPrev.qryVerificaObrig.SQL.Add(' SELECT PLACCUST FROM PLANOCONTA '+
                               ' WHERE PLANO = '+IntToStr(IntegraBack.Plano)+' AND '+
                               '       PLACONTA = '''+sValorEncontrado+'''');
      dtmAPrev.qryVerificaObrig.Open;
      if dtmAPrev.qryVerificaObrig.IsEmpty or (dtmAPrev.qryVerificaObrig.FieldByName('PlaCCust').AsString = 'N')
      then bCCustoCObrig := False
      else bCCustoCObrig := True;
      dtmAPrev.qryVerificaObrig.Close;
   end;

   // INVERTER CONTABILIZACAO NO CASO DE DEVOLUCAO DE CONTRIBUICAO
   if qry.FieldByName('FlgDevolucao').AsInteger = 1 then
   begin
     try
       ss:=qry.FieldByName(sPlaContaC).AsString;
     except
       ss:='';
     end;

     BuscaInfFinancContrib(sSQLValues,sCamposObrig,sValorEncontrado,sPlaContaC,
                           ss, 
                           'S',
                           qry.FieldbyName('IdPessJur').AsInteger,
                           qry.FieldbyName('IdPlanoPrev').AsInteger,
                           qry.FieldByName('IdContribuicao').AsInteger, piultimacontrib ); //PLACONTAC
   end
   else
   begin
     
     try
       ss:=qry.FieldByName(sPlaContaD).AsString;
     except
       ss:='';
     end;

     BuscaInfFinancContrib(sSQLValues,sCamposObrig,sValorEncontrado,sPlaContaD,
                           ss, 
                           'S',
                           qry.FieldbyName('IdPessJur').AsInteger,
                           qry.FieldbyName('IdPlanoPrev').AsInteger,
                           qry.FieldByName('IdContribuicao').AsInteger, piultimacontrib ); //PLACONTAD
   end;

   // Testar se, para a conta débito encontrada, o CentroCustoD é obrigatorio
   bCCustoDObrig := False;
   if sValorEncontrado <> ''
   then begin
      dtmAPrev.qryVerificaObrig.Close;
      dtmAPrev.qryVerificaObrig.SQL.Clear;
      dtmAPrev.qryVerificaObrig.SQL.Add(' SELECT PLACCUST FROM PLANOCONTA '+
                               ' WHERE PLANO    = '+IntToStr(IntegraBack.Plano)+' AND '+
                               '       PLACONTA = '''+sValorEncontrado+'''');
      dtmAPrev.qryVerificaObrig.Open;
      if dtmAPrev.qryVerificaObrig.IsEmpty or (dtmAPrev.qryVerificaObrig.FieldByName('PlaCCust').AsString = 'N')
      then bCCustoDObrig := False
      else bCCustoDObrig := True;
      dtmAPrev.qryVerificaObrig.Close;
   end;

   // ** Preenchendo PLANO DE CONTAS
   sSQLValues := sSQLValues + ',' +IntToStr(IntegraBack.Plano);

   // ** Preenchendo UNIDNEGOC
   if bUnidNegocObrig
   then begin
     
     try
       ss:=qry.FieldByName(sUNIDNEGOC).AsString;
     except
       ss:='';
     end;

     BuscaInfFinancContrib(sSQLValues,sCamposObrig,sValorEncontrado, sUNIDNEGOC,
                      ss, 
                      'N',
                      qry.FieldbyName('IdPessJur').AsInteger,
                      qry.FieldbyName('IdPlanoPrev').AsInteger,
                      qry.FieldByName('IdContribuicao').AsInteger, piultimacontrib );
   end
   else begin
     
     try
       ss:=qry.FieldByName(sUNIDNEGOC).AsString;
     except
       ss:='';
     end;

     BuscaInfFinancContrib(sSQLValues,sCamposNObrig,sValorEncontrado, sUNIDNEGOC,
                      ss, 
                      'N',
                      qry.FieldbyName('IdPessJur').AsInteger,
                      qry.FieldbyName('IdPlanoPrev').AsInteger,
                      qry.FieldByName('IdContribuicao').AsInteger , piultimacontrib);
   end;

   // ** Preenchendo CODPORTFORMA
   // Se nao for desconto em folha, o portador forma é obrigatório
   if sSitFundacao = 'AS' then
   begin
     sSQLValues := sSQLValues+', NULL';
   end
   else
   begin

     try
       ss:=qry.FieldByName(sCodPortadorForma).AsString;
     except
       ss:='';
     end;

     if Trim(ss) <> '' //CODPORTFORMA
     then begin
        sSQLValues := sSQLValues +', '+qry.FieldByName(sCodPortadorForma).AsString;
     end
     else begin
        sSQLValues := sSQLValues+', '+sCodPortForma;
     end;
   end;

   // ** Preenchendo CODTIPDOC
   
   try
     ss:=qry.FieldByName(sCodTipDoc).AsString;
   except
     ss:='';
   end;

   BuscaInfFinancContrib(sSQLValues,sCamposNObrig,sValorEncontrado,sCODTIPDOC,
                    ss, 
                    'N',
                     qry.FieldbyName('IdPessJur').AsInteger,
                     qry.FieldbyName('IdPlanoPrev').AsInteger,
                     qry.FieldByName('IdContribuicao').AsInteger, piultimacontrib );


   // Se for uma devolucao filtrar para (Contas a Pagar)
   if qry.FieldByName('FlgDevolucao').AsInteger = 1 then
   begin
      // ** Preenchendo CODTIPRECDES
     
     try
       ss:=qry.FieldByName(sCodTipRecDesembDevol).AsString;
     except
       ss:='';
     end;

     BuscaInfFinancContrib(sSQLValues,sCamposObrig,sValorEncontrado,sCodTipRecDesembDevol,
                         ss, 
                         'S',
                         qry.FieldbyName('IdPessJur').AsInteger,
                         qry.FieldbyName('IdPlanoPrev').AsInteger,
                         qry.FieldByName('IdContribuicao').AsInteger, piultimacontrib );

     
     try
       ss:=qry.FieldByName(sRecPagDevol).AsString;
     except
       ss:='';
     end;

     BuscaInfFinancContrib(sSQLValues,sCamposObrig,sValorEncontrado,sRecPagDevol,
                         ss, 
                         'S',
                         qry.FieldbyName('IdPessJur').AsInteger,
                         qry.FieldbyName('IdPlanoPrev').AsInteger,
                         qry.FieldByName('IdContribuicao').AsInteger , piultimacontrib); //RECPAG
   end
   else begin
      // Se for para folha de benefício usar codtipdesembcar e recpag = P
      if sSitFundacao = 'AS'
      then begin
         
         try
           ss:=qry.FieldByName(sCodTipDesembCAR).AsString;
         except
           ss:='';
         end;

         BuscaInfFinancContrib(sSQLValues,sCamposObrig,sValorEncontrado,
                            sCodTipDesembCAR,
                            ss, 
                            'S',
                            qry.FieldbyName('IdPessJur').AsInteger,
                            qry.FieldbyName('IdPlanoPrev').AsInteger,
                            qry.FieldByName('IdContribuicao').AsInteger, piultimacontrib ); //CODTIPRECDES

         
         try
           ss:=qry.FieldByName(sRecPagDevol).AsString;
         except
           ss:='';
         end;

         BuscaInfFinancContrib(sSQLValues,sCamposObrig,sValorEncontrado,
                            sRecPagDevol,
                            ss, 
                            'S',
                            qry.FieldbyName('IdPessJur').AsInteger,
                            qry.FieldbyName('IdPlanoPrev').AsInteger,
                            qry.FieldByName('IdContribuicao').AsInteger , piultimacontrib); //RECPAG
      end
      else begin
         
         try
           ss:=qry.FieldByName(sCodTipRecDes).AsString;
         except
           ss:='';
         end;

         BuscaInfFinancContrib(sSQLValues,sCamposObrig,sValorEncontrado,
                            sCODTIPRECDES,
                            ss, 
                            'S',
                            qry.FieldbyName('IdPessJur').AsInteger,
                            qry.FieldbyName('IdPlanoPrev').AsInteger,
                            qry.FieldByName('IdContribuicao').AsInteger, piultimacontrib ); //CODTIPRECDES

         
         try
           ss:=qry.FieldByName(sRecPag).AsString;
         except
           ss:='';
         end;

         BuscaInfFinancContrib(sSQLValues,sCamposObrig,sValorEncontrado,
                            sRECPAG,
                            ss, 
                            'S',
                            qry.FieldbyName('IdPessJur').AsInteger,
                            qry.FieldbyName('IdPlanoPrev').AsInteger,
                            qry.FieldByName('IdContribuicao').AsInteger , piultimacontrib); //RECPAG

      end;
   end;

   if qry.FieldByName('ValorOP1').AsString <> ''                           //VALORBASE1
   then sSQLValues := sSQLValues +', '+OraNumero(qry.FieldByName('ValorOP1').AsString)
   else sSQLValues := sSQLValues+', NULL ';

   if qry.FieldByName('ValorOP2').AsString <> ''                           //VALORBASE2
   then sSQLValues := sSQLValues +', '+OraNumero(qry.FieldByName('ValorOP2').AsString)
   else sSQLValues := sSQLValues+', NULL ';

   if qry.FieldByName('ValorOP3').AsString <> ''                           //VALORBASE3
   then sSQLValues := sSQLValues +', '+OraNumero(qry.FieldByName('ValorOP3').AsString)
   else sSQLValues := sSQLValues+', NULL ';

   // ** Preenchendo DATAREFERENCIA
   sSQLValues          := sSQLValues+', TO_DATE('''+sDataCobranca+''',''dd/mm/yyyy'') ';

   if bCCustoCObrig  //CODCENTROCUSTOC
   then begin
      
      try
        ss:=qry.FieldByName(sCodCentroCustoC).AsString;
      except
        ss:='';
      end;

      BuscaInfFinancContrib(sSQLValues,sCamposObrig,sValorEncontrado,sCODCENTROCUSTOC,
                      ss, 
                      'S',
                      qry.FieldbyName('IdPessJur').AsInteger,
                      qry.FieldbyName('IdPlanoPrev').AsInteger,
                      qry.FieldByName('IdContribuicao').AsInteger, piultimacontrib );
   end
   else begin
      
      try
        ss:=qry.FieldByName(sCodCentroCustoC).AsString;
      except
        ss:='';
      end;

      BuscaInfFinancContrib(sSQLValues,sCamposNObrig,sValorEncontrado,
                      sCODCENTROCUSTOC,
                      ss, 
                      'S',
                      qry.FieldbyName('IdPessJur').AsInteger,
                      qry.FieldbyName('IdPlanoPrev').AsInteger,
                      qry.FieldByName('IdContribuicao').AsInteger, piultimacontrib );
   end;

   if bCCustoDObrig //CODCENTROCUSTOD
   then begin
      
      try
        ss:=qry.FieldByName(sCodCentroCustoD).AsString;
      except
        ss:='';
      end;

      BuscaInfFinancContrib(sSQLValues,sCamposObrig,sValorEncontrado,sCODCENTROCUSTOD,
                      ss, 
                      'S',
                      qry.FieldbyName('IdPessJur').AsInteger,
                      qry.FieldbyName('IdPlanoPrev').AsInteger,
                      qry.FieldByName('IdContribuicao').AsInteger , piultimacontrib);
   end
   else begin
      
      try
        ss:=qry.FieldByName(sCodCentroCustoD).AsString;
      except
        ss:='';
      end;

      BuscaInfFinancContrib(sSQLValues,sCamposNObrig,sValorEncontrado,sCODCENTROCUSTOD,
                      ss, 
                      'S',
                      qry.FieldbyName('IdPessJur').AsInteger,
                      qry.FieldbyName('IdPlanoPrev').AsInteger,
                      qry.FieldByName('IdContribuicao').AsInteger , piultimacontrib);
   end;


   if bCResponObrig //CODCENTRORESPON
   then begin
      
      try
        ss:=qry.FieldByName(sCodCentroRespon).AsString;
      except
        ss:='';
      end;

      BuscaInfFinancContrib(sSQLValues,sCamposObrig,sValorEncontrado,sCODCENTRORESPON,
                      ss, 
                      'S',
                      qry.FieldbyName('IdPessJur').AsInteger,
                      qry.FieldbyName('IdPlanoPrev').AsInteger,
                      qry.FieldByName('IdContribuicao').AsInteger , piultimacontrib);
   end
   else begin
      
      try
        ss:=qry.FieldByName(sCodCentroRespon).AsString;
      except
        ss:='';
      end;

      BuscaInfFinancContrib(sSQLValues,sCamposNObrig,sValorEncontrado,sCODCENTRORESPON,
                      ss, 
                      'S',
                      qry.FieldbyName('IdPessJur').AsInteger,
                      qry.FieldbyName('IdPlanoPrev').AsInteger,
                      qry.FieldByName('IdContribuicao').AsInteger, piultimacontrib );
   end;


   
   try
     ss:=qry.FieldByName(sCodSUBCONTA).AsString;
   except
     ss:='';
   end;

   BuscaInfFinancContrib(sSQLValues,sCamposNObrig,sValorEncontrado,sCODSUBCONTA,
                      ss, 
                      'N',
                      qry.FieldbyName('IdPessJur').AsInteger,
                      qry.FieldbyName('IdPlanoPrev').AsInteger,
                      qry.FieldByName('IdContribuicao').AsInteger, piultimacontrib ); //CODSUBCONTA

   // ** Preenchendo IDEMPRESA
   if (bCCustoCObrig) or (bCCustoDObrig)
   then begin
      
      try
        ss:=qry.FieldByName(sIDEMPRESA).AsString;
      except
        ss:='';
      end;

      BuscaInfFinancContrib(sSQLValues,sCamposObrig,sValorEncontrado,sIDEMPRESA,
                       ss, 
                       'N',
                       qry.FieldbyName('IdPessJur').AsInteger,
                       qry.FieldbyName('IdPlanoPrev').AsInteger,
                       qry.FieldByName('IdContribuicao').AsInteger , piultimacontrib);
   end
   else begin
      
      try
        ss:=qry.FieldByName(sIDEMPRESA).AsString;
      except
        ss:='';
      end;

      BuscaInfFinancContrib(sSQLValues,sCamposNObrig,sValorEncontrado,sIDEMPRESA,
                       ss, 
                       'N',
                       qry.FieldbyName('IdPessJur').AsInteger,
                       qry.FieldbyName('IdPlanoPrev').AsInteger,
                       qry.FieldByName('IdContribuicao').AsInteger , piultimacontrib);
   end;

   // ** Preenchendo IDEMPRESAPROP
   sSQLValues          := sSQLValues+', '+IntToStr(Sistema.IdEmpresa);

   // ** Preenchendo DATACOBRANCA
   sSQLValues := sSQLValues +', To_Date('''+sDataCobranca+''', ''dd/mm/yyyy'') ';

   // ** Preenchendo DATACOBRANCA
   sSQLValues := sSQLValues +', '+qry.FieldByName('NumRecebimento').AsString;

   // ** Preenchendo COMPLDOCUMENTO
   sSQLValues := sSQLValues +', '''+Copy(qry.FieldByName('MesReferencia').AsString,6,2)+'''';

   // ** Preenchendo IDLOTE
   if piIdLote <= 0 then
   begin
     sSQLValues := sSQLValues +', NULL';
   end
   else
   begin
     sSQLValues := sSQLValues +', '+IntToStr(piIdLote);
   end;

   // ** Preenchendo IDEMPCOBRANCA
   sSQLValues := sSQLValues +', '+qry.FieldByName('IdPessJur').AsString;

   // ** Preenchendo PERIODO
   sSQLValues := sSQLValues +', '+IntToStr(liPeriodo);

   // ** Preenchendo EXERCICIO
   sSQLValues := sSQLValues +', '+IntToStr(liExercicio);

   // ** Preenchendo TIPCODIGO
   
   try
     ss:=qry.FieldByName(sPlaContaC).AsString;
   except
     ss:='';
   end;

   BuscaInfFinancContrib(sSQLValues,sCamposNObrig,sValorEncontrado,
                    sTIPCODIGO,'',
                    'S',
                     qry.FieldbyName('IdPessJur').AsInteger,
                     qry.FieldbyName('IdPlanoPrev').AsInteger,
                     qry.FieldByName('IdContribuicao').AsInteger , piultimacontrib);

   // ** Preenchendo FLGEXISTEHST
   sSQLValues := sSQLValues +', 1 ';

   // ** Preenchendo SITENVIO
   sSQLValues := sSQLValues +', ''0'' ';

    // ** Preenchendo VALOR
    sSQLValues := sSQLValues +', '+OraNumero(qry.FieldByName('ValorEsperado').AsString); //VALOR

   // ** Preenchendo DESCRICAO
   if sSitFundacao <> 'AS'
   then sSQLValues          := sSQLValues+', '''+Copy('Inscrição : '+qry.FieldByName('InscricaoNumero').AsString+
                             ' - '+qry.FieldByName('NOMECONTRIB').AsString,1,40)+''''
   else sSQLValues          := sSQLValues+', '''+'Contribuição de Assistido'+'''' ;

   // ** Preenchendo REFERENCIA
   sSQLValues:=sSQLValues+', ''CONTRIB''';

   // ** Preenchendo CODALTERADOR
   sSQLValues := sSQLValues +', NULL ';

   // ** Preenchendo FLGALTERADOR
   sSQLValues := sSQLValues +', NULL ';

   
   lidseq:=LeUltRegistro(nil,'SEQINTERNOFB');
   sSQLValues:=sSQLValues+', '+inttostr(lidseq);

   // ** Preenchendo FLGINTEVENTO
   if Trim(psFlgIntEvento) <> ''
   then sSQLValues := sSQLValues +', '''+psFlgIntEvento+''''
   else sSQLValues := sSQLValues +', NULL ';

   sSqlValues := sSqlValues + ', ' + qry.FieldByName('NUMRECEBIMENTO').AsString; 

   // Se alguns dos campos estavam em branco -> Avisar e NAO GRAVAR na TMPDESC
   if (Trim(sCamposObrig) <> '') and (bExigeFinanc )
   then begin
      if MsgDlg('Existem informações necessárias à Integração com o Sistema Financeiro '+
                ' não associadas a algumas contribuições. Deseja continuar ? ','Confirmação',mtConfirmation,[mbYes,mbNo,mbHelp],0) = mrNo
      then Exit
      else bExigeFinanc := False;
   end;

   dtmAPrev.qry.Close;
   dtmAPrev.qry.SQL.Clear;
   dtmAPrev.qry.SQL.Add('INSERT INTO TMPDESC ('+sSQLFields+ ') VALUES ('+sSQLValues+')');
   try
      dtmAPrev.qry.ExecSQL;
      rValorEnviado := qry.FieldByName('ValorEsperado').AsFloat;
   except
      Exit;
   end;
   Result := rValorEnviado;
end;//EnviaContribuicao

{Calcula o salário virtual do assistido}
function CalculaSalarioVirtual(qryAux: TwwQuery; sMesRef, sIdPessjur,
  sIdPlanoprev, sIdPessoa, sIdBeneficio, sDataRef: string;
  var sValorSal: string): boolean;
var sSQL, sValorReserva, sMesReferencia, sSalPart, sRemTotal,
    sDataInscFund, sRegra, sValAux: string;
    bErroRegra: boolean;
    iIdCalculoGeral: integer;
begin
  result:=true;

  sSQL:='SELECT IDREGRASALAUXDOE '+
        'FROM PLANPREVPATRO '+
        'WHERE IDPESSJUR = '+sIdPessJur+' '+
        'AND IDPLANOPREV = '+sIdPlanoPrev;

  qryAux.Close;
  qryAux.Sql.Clear;
  qryAux.Sql.Add(sSQL);
  try
    qryAux.Open;
  except
    on E:Exception do
    begin
      result:=false;
      exit;
    end;
  end;

  if qryAux.FieldByName('IDREGRASALAUXDOE').AsString = '' then
  begin
    exit;
  end;
  sRegra:=qryAux.FieldByName('IDREGRASALAUXDOE').AsString;

  // Executa Regra de Cálculo do Salário de Auxilio Doença
  // Passa para a regra os mesmos dados da Regra de Cálculo do Beneficio

  //Calcula o valor total da soma das reservas do participante
  sValorReserva:=OraNumero(CalcReservaPart(StrToInt(sIdPessJur),
    StrToInt(sIdPlanoPrev), StrToInt(sIdPessoa), -1, 1, '', '', '', '', '', qryAux));

  sMesReferencia:=Copy(Trim(sDataRef),7,4)+'/'+Copy(Trim(sDataRef),4,2);

  sSalPart:=ORANUMERO(CalcSalPart(StrToInt(sIdPessJur), StrToInt(sIdPessoa),
    SAnoMesAnterior(sMesReferencia), qryAux));

  sRemTotal:=ORANUMERO(CalcREMTOTAL(StrToInt(sIdPessJur), StrToInt(sIdPessoa),
    SAnoMesAnterior(sMesReferencia), qryAux));

  sDataInscFund:=CalcDataInscFund(StrToInt(sIdPessJur), StrToInt(sIdPlanoPrev),
    StrToInt(sIdPessoa), 1, qryAux);

  if Trim(sValorReserva) = '' then sValorReserva:='0';
  if Trim(sSalPart)      = '' then sSalPart:='0';
  if Trim(sRemTotal)     = '' then sRemTotal:='0';
  if Trim(sDataInscFund) = '' then sDataInscFund := DateToStr(Date);

  sSQL:='SELECT PLP.IDREGRASALAUXDOE, PP.IDPESSOA, PP.IDPESSJUR, '+
               'PP.IDPLANOPREV, PP.INSCRICAODATA, PP.IDSITPART, ' +
               ''''+sDataInscFund+''' AS INSCRICAODATAFUND, PF.DATANASC, '+
               'EL.SALTOTAL, EL.TEMPOSERVANTERIOR, EL.TEMPONAOCREDITADO, '+
               sIdBeneficio+' AS IDBENEFICIO, '+
               sSALPART+' AS VALORPROVENTO, '+sREMTOTAL+' AS VALORREMTOTAL, '+
               'SF.TIPOSIT,SF.IDSITFUNC, '+sValorReserva+' AS VALORRESERVA, '+
               ''''+trim(sDataRef)+''' AS DATAREF '+
        'FROM ELEGPATRO EL, PARTPREVPLAN PP, PESSOAFISICA PF,  SITFUNC SF, '+
             'PLANPREVPATRO PLP '+
        'WHERE PP.IDPESSOA = '+sIdPessoa+' '+
        'AND PP.IDPESSJUR = '+sIdPessJur+' '+
        'AND PP.IDPLANOPREV = '+sIdPlanoPrev+' '+
        'AND PP.SEQPROPOSTA = 1 '+
        'AND EL.IDPESSOA = PP.IDPESSOA '+
        'AND EL.IDPESSJUR = PP.IDPESSJUR '+
        'AND PF.IDPESSOA = EL.IDPESSOA '+
        'AND EL.IDSITFUNC = SF.IDSITFUNC(+) '+
        'AND PP.IDPLANOPREV = PLP.IDPLANOPREV '+
        'AND PP.IDPESSJUR = PLP.IDPESSJUR';

  sValAux:=RegraNumerica(sRegra, sSQL, bErroRegra, iIdCalculoGeral);

  try
    strtofloat(sValAux);
    sValorSal:=sValAux;
  except
  end;
 end;

function ReajustaSalPatro( qryAux           : TwwQuery ;
                           sMesRef,
                           sIdPessjur,
                           sIdPlanoprev,
                           sIdPessoa,
                           sDataRef: string ;
                          var sValorSal     : string) : Boolean;
var sSql, sValorAux,
    sIdRegraReajuste,
    sMesEvento,
    sPercentual, sValorSalManutTotal : String;
    bErro : Boolean;
    cAux  : char;
    rPercent,
    rValor,
    rValorAux : Double;
begin
   Result := False;
   bErro  := False;

   qryaux.sql.clear;
   qryaux.sql.add(' SELECT IDRGREAJ, PERCENTUAL '+
                  ' FROM   REAJSALPATRO '+
                  ' WHERE  MESREAJ     = '''+sMesRef+''''+
                  ' AND    IDPESSJUR   = '+sIdPessjur+' '+
                  ' AND    IDPLANOPREV = '+sIdPlanoprev+' ');
   qryaux.Open;
   if qryaux.isempty
   then begin
      Result := true;
      exit;
   end;

   // Se a data do evento = mesreaj, assumir q. salario informado,
   // já esta reajustado, e nao reajusta e grava este mes como u
   // ultimo mes de reajuste.

   sIdRegraReajuste := Trim(qryaux.FieldByName('IdRgReaj').AsString);
   sPercentual      := Trim(qryaux.FieldByName('Percentual').AsString);

   if (sIdRegraReajuste = '') and (sPercentual = '')
   then begin
      Result := true;
      Exit;
   end;

   sValorSalManutTotal := '0';

   qryAux.Close;
   qryAux.SQL.Clear;
   qryAux.SQL.Add(' SELECT SALMANTIDO FROM PARTPREVPLAN '+
                  ' WHERE (IDPESSOA  = '+sIdPessoa+')  AND '+
                  '       (IDPESSJUR = '+sIdPessJur+') AND '+
                  '       (IDPLANOPREV = '+sIdPlanoPrev+' )');
   try
      qryAux.Open;

      if not qryaux.isempty then
      sValorSalManutTotal := qryaux.fieldbyname('SALMANTIDO').AsString;
   except
   end;

   sSQL := ' SELECT '''+sMesRef+''' AS ANOMESREF,  '+
           ' '''+sDataRef+''' AS DATAREF,          '+
           sIdPessJur + ' AS IDPESSJUR,            '+
           OraNumero(sValorSal)+' AS VALORATUAL,      '+
           OraNumero(sValorSal)+' AS VALORPROVENTO,   '+
           OraNumero(sValorSal)+' AS VALORREFERENCIA, '+
           '       EL.IDCARGOEXT, EL.NIVEL,           '+
           '       EL.VALORBASE1, EL.VALORBASE2, EL.VALORBASE3, '+
           '       SP.FLGINTERNO, PP.MESULTREAJSAL    '+
           '       , '+Oranumero(sValorSalManutTotal)+' SALMANUTTOTAL '+
           ' FROM  ELEGPATRO EL, PARTPREVPLAN PP, SITPART SP    '+
           ' WHERE (PP.IDPESSJUR     = '+sIdPessJur   +')'+
           ' AND   (PP.IDPLANOPREV   = '+sIdPlanoPrev +')'+
           ' AND   (PP.IDPESSOA      = '+sIdPessoa    +')'+
           ' AND   (PP.SEQPROPOSTA   = 1'             +')'+
           ' AND   (PP.IDPESSJUR     = EL.IDPESSJUR ' +')'+
           ' AND   (PP.IDPESSOA      = EL.IDPESSOA '  +')'+
           ' AND   (PP.IDSITPART     = SP.IDSITPART ' +')'+
           ' AND   (PP.FLGDESATIVADO = 0'             +')';
   try
      //se o identificador da regra estiver preenchido então
      //executa a regra
      //senão apenas soma com um percentual do mesmo salário

      if sIdRegraReajuste <> '' then
      begin
         sValorAux := RegraNumerica(sIdRegraReajuste,
                                    sSQL, bErro, iIdCalculoGeral );
      end
      else if sPercentual <> '' then
      begin
         rPercent  := StrToFloat(ClienteNumero(sPercentual))/100;
         rValor    := strtofloat(ClienteNumero(sValorSal));
         rValorAux := rValor + (rValor * rPercent);
         sValorAux := FloatToStr(rValorAux);
      end;

      sValorAux := truncaround(oranumero(sValorAux),2);
      sValorSal := sValorAux;
   except
      exit;
   end;

   if berro then  exit;
   Result := True;
end; // ReajustaSalPatro

function BuscaDescCobranca(piIdContribuicao, piIdPlanoPrev:Integer; qryAux:Twwquery):string;
begin
   result := 'Contribuição. ';

   qryAux.Close;
   qryAux.Sql.Clear;
   qryAux.Sql.Add(' select FLGPAGADOR from contprev '+
                  ' where  idplanoprev    = '+IntToStr(piIdPlanoPrev) +
                  ' and    idcontribuicao = '+IntToSTr(piIdContribuicao) );
   qryAux.Open;
   if not qryAux.IsEmpty
   then begin

      case qryAux.FieldByName('FLGPAGADOR').AsString[1] of
      'C' : result := 'Contrib.(Participante)';
      'P' : result := 'Contrib.(Patroc. por Participante)';
      'E' : result := 'Contrib.(Exclusiva Patrocinadora)';
      end;
   end;
   qryAux.Close;
end;

function BuscaRamoForCli(psSitFundacao : string; cRecPag : char ) : longint ;
begin
   Result := -1;
   if cRecPag = 'R'
   then begin // Buscar cliente
      if psSitFundacao = 'AT'
      then Result := prmIdRamoTipoCliAtivo
      else if psSitFundacao = 'PT'
      then Result := prmIdRamoTipoCliPatro
      else if psSitFundacao = 'MA'
      then Result := prmIdRamoTipoCliMantido
      else if psSitFundacao = 'MP'
      then Result := prmIdRamoTipoCliMantidoParc
      else if psSitFundacao = 'AS'
      then Result := prmIdRamoTipoCliAssistido;
   end
   else begin // Buscar fornecedor
      if psSitFundacao = 'AT'
      then Result := prmIdRamoTipoForAtivo
      else if psSitFundacao = 'PT'
      then Result := prmIdRamoTipoForPatro
      else if psSitFundacao = 'MA'
      then Result := prmIdRamoTipoForMantido
      else if psSitFundacao = 'MP'
      then Result := prmIdRamoTipoForMantidoParc
      else if psSitFundacao = 'AS'
      then Result := prmIdRamoTipoForAssistido;
   end;
end; // BuscaRamoForCli

procedure  VefificaContabMantido(qryaux : TwwQuery ;var bContabiliza : boolean ;piIdPlanoPrev : Integer);
begin
   bContabiliza := True;
   qryaux.close;
   qryaux.sql.Text :=' SELECT NVL(FLGCONTABMANTIDO,0) FLGCONTABMANTIDO FROM PLANPREV WHERE IDPLANOPREV = '+inttostr(piIdPlanoPrev)+'';
   qryaux.open;

   if not qryaux.isempty then
   begin
      if qryaux.fieldbyname('FLGCONTABMANTIDO').AsString = '1' then bContabiliza := False;
   end;
end;

function EnviaContribuicaoBANCO (qryContabil, qryDocumentos,
                                 qryEnvio,    qryAux             : TwwQuery;
                                 sMes,        sAnoMesReferencia,
                                 sHistDeb,    sHistCre,
                                 sDataBoleta                     : string;
                                 piIdPessJur, piIdPlanoPrev,
                                 piIdPessoa,  piIdContribuicao,
                                 piUltimaContrib                : longint;
                                 Documento                      : TDocumento;
                                 psFlgPagador,
                                 psFlgSitPart                   : string;
                                 piCodPortForma                 : longint;
                                 pFlagPortForma                 : Integer;
                                 cRecPag                        : char;
                                 dValorEnviar                   : double;
                                 var sMsgErro                   : string;
                                 var iCodLancCAPCAR,iPlnCodigo : longint  ) : real;
var iCodSubConta,
    iNumLancto,
    siCodPortForma,
    siCodPortForma_ant,
    iIdRamoForCli                        : longint;

    sAux1, sAux2,     sCodCentroCusto,
    sPlaConta,        sPlaContaD,
    sCodCentroCustoD, sCodTipDoc,
    sCodTipRecDes,    sCodCentroRespon,
    sCodUnidNegoc,    sCodSubconta,
    sDebCre,          sCodPortForma,
    sNoDocumento,     sTipCodigo,
    sComplDocumento,  sDescCobranca,
    sDataVencimento,  sTipoReceita,
    sTipoDebCre    ,  sTP01Rec,   sTP01Deb,
    sIdPlanPrevContab,
    sAnoMesCobranca                      : string;
    bEmisBloq,
    bAchouMesCobranca , bInsereDoc                             : boolean;


    bContabiliza : Boolean;
begin
   

   if dValorEnviar <= 0 then
   begin
      Result := 0;
      exit;
   end;

   if UpperCase(Sistema.NomeUsuario) = 'SUPER'
   then begin
      sMsgErro := 'Não é permitido fazer operações financeirias com o usuário SUPER.';
      Result   := -1;
      Exit;
   end;

   // Inicializar variaveis
   Result       := -1;
   sMsgErro     := 'Cobraça de Contribuição de Patrocinadora Não Finalizada';
   iCodSubConta := -1;

   if sMes = '13'
   then sMes := Copy(DateToStr(date),4,2);

   if psFlgPagador <> 'C'
   then begin
      piIdPessoa := piIdPessJur;
      bEmisBloq  := False; // para nao emitir boleto
   end
   else bEmisBloq := True;

   VefificaContabMantido(qryaux,bContabiliza,piIdPlanoPrev);

   //verificar se a pessoa/idforcli já existe, se sim repetir o coddocumento
   //se não Gerar codigo do documento
   bInsereDoc := False;

  if  pFlagPortForma = 0 then
          bInsereDoc := True;
   if iCodLancCAPCAR <= 0 then Exit;


   // Buscar informacoes necessárias nas diversas tabelas da hierarquia
   sNoDocumento    := qryEnvio.FieldByName('NumRecebimento').AsString;
   sComplDocumento := sMes;


   BuscaInfFinancContrib(sAux1, sAux2, sCodCentroCusto,'CODCENTROCUSTOC',
                       qryEnvio.FieldByName('CODCENTROCUSTOC').AsString,
                       'S',
                       piIdPessJur, piIdPlanoPrev, piIdContribuicao,
                       piUltimaContrib );

   BuscaInfFinancContrib(sAux1, sAux2, sPlaConta,'PLACONTAC',
                       qryEnvio.FieldByName('PLACONTAC').AsString,
                       'S',
                       piIdPessJur, piIdPlanoPrev, piIdContribuicao,
                       piUltimaContrib );

   BuscaInfFinancContrib(sAux1, sAux2, sPlaContaD,'PLACONTADBANCO',
                       qryEnvio.FieldByName('PLACONTADBANCO').AsString,
                       'S',
                       piIdPessJur, piIdPlanoPrev, piIdContribuicao,
                       piUltimaContrib );


   //se for devolução então credita na conta de devolução e
   //debita da conta de crédito normal
   try
      if qryEnvio.fieldbyname('FLGDEVOLUCAO').AsInteger = 1 then
      begin
         sPlaContaD := sPlaConta;
         sCodCentroCustoD := sCodCentroCusto;

         BuscaInfFinancContrib(sAux1, sAux2, sPlaConta,'PLACONTADEVOL',
                       qryEnvio.FieldByName('PLACONTADEVOL').AsString,
                       'S',
                       piIdPessJur, piIdPlanoPrev, piIdContribuicao,
                       piUltimaContrib );

         BuscaInfFinancContrib(sAux1, sAux2, sCodCentroCusto,'CODCCUSTODEVOL',
                       qryEnvio.FieldByName('CODCCUSTODEVOL').AsString,
                       'S',
                       piIdPessJur, piIdPlanoPrev, piIdContribuicao,
                       piUltimaContrib );

      end;
   except    end;
   //o try except é apenas para não parar com erro processos que não fazem
   //devolução portanto não precisam passar o flgdevolucao


   BuscaInfFinancContrib(sAux1, sAux2, sCodCentroCustoD,'CODCENTROCUSTOD',
                       qryEnvio.FieldByName('CODCENTROCUSTOD').AsString,
                       'S',
                       piIdPessJur, piIdPlanoPrev, piIdContribuicao,
                       piUltimaContrib );


   BuscaInfFinancContrib(sAux1, sAux2,sCODSUBCONTA,'CODSUBCONTA',
                        qryEnvio.FieldByName('CODSUBCONTA').AsString,
                        'S',
                        piIdPessJur, piIdPlanoPrev, piIdContribuicao,
                        piUltimaContrib );

   if sCodSubConta <> '' Then
      iCodSubConta := strToInt(sCodSubConta);

   sTipCodigo := prmTpOperCobranca;
    
   if cRecPag = 'R'
   then sCodTipDoc := prmTpDocCrFlhBeneLet
   else sCodTipDoc := prmTpDocPEnvioBanco;

    if Trim(sCodTipDoc) = '' then
       begin
       sMsgErro := 'Tipo de Documento Não Existente p/ Cobrança de Contribuicao de Patrocinadora';
       Result   := -1;
       Exit;
     end;

   if piCodPortForma <= 0
   then BuscaInfFinancContrib(sAux1, sAux2, sCodPortForma,'CODPORTFORMA',
                              qryEnvio.FieldByName('CODPORTFORMA').AsString,
                              'N',
                              piIdPessJur, piIdPlanoPrev, piIdContribuicao,
                              piUltimaContrib )
   else sCodPortForma := IntToStr(piCodPortForma);

   if Trim(sCodPortForma) = '' then
     begin
     sMsgErro := 'Codigo Portador Forma Não Existente p/ Cobrança de Contribuicao de Patrocinadora';
      Result   := -1;
      Exit;
     end;

   if cRecPag = 'R'
   then BuscaInfFinancContrib(sAux1, sAux2, sCodTipRecDes,'CODTIPRECDES',
                       qryEnvio.FieldByName('CODTIPRECDES').AsString,
                       'S',
                       piIdPessJur, piIdPlanoPrev, piIdContribuicao,
                       piUltimaContrib )
   else BuscaInfFinancContrib
   (sAux1, sAux2, sCodTipRecDes,'CODTIPDESEMBDEVOL',
                       qryEnvio.FieldByName('CODTIPDESEMBDEVOL').AsString,
                       'S',
                       piIdPessJur, piIdPlanoPrev, piIdContribuicao,
                       piUltimaContrib );

   // Se nao obriga centro respon, obrigatoriamente temos que usar
   // o centro respon cadastrado no global, senao, podemos buscar um
   // especifica. Caso nao encontre, tambem podemos usar o global
   if IntegraBack.ObrigaCRespon = 'N'
   then sCodCentroRespon := prmCodCentroRespon
   else begin
      BuscaInfFinancContrib(sAux1, sAux2, sCodCentroRespon,'CODCENTRORESPON',
                            qryEnvio.FieldByName('CODCENTRORESPON').AsString,
                            'S',
                            piIdPessJur, piIdPlanoPrev, piIdContribuicao,
                            piUltimaContrib );
      if Trim(sCodCentroRespon) = ''
      then sCodCentroRespon := prmCodCentroRespon;
   end;

   // Se nao obriga atividade, obrigatoriamente temos que usar
   // a atividade cadastrada no global, senao, podemos buscar uma
   // especifica. Caso nao encontre, tambem podemos usar a global
   if IntegraBack.ObrigaAbc = 'N'
   then sCodUnidNegoc := IntToStr(prmUnidNegoc)
   else begin
      BuscaInfFinancContrib(sAux1, sAux2, sCodUnidNegoc,'UNIDNEGOC',
                          qryEnvio.FieldByName('UNIDNEGOC').AsString,
                          'N',
                          piIdPessJur, piIdPlanoPrev, piIdContribuicao,
                          piUltimaContrib );
      if Trim(sCodUnidNegoc) = ''
      then sCodUnidNegoc := IntToStr(prmUnidNegoc);
   end;

   BuscaInfFinancContrib(sAux1, sAux2, sIdPlanPrevContab,'IDPLANPREVCONTAB',
                       qryEnvio.FieldByName('IDPLANPREVCONTAB').AsString,
                       'N',
                       piIdPessJur, piIdPlanoPrev, piIdContribuicao,
                       piUltimaContrib );

   if Trim(sIdPlanPrevContab) = '' then sIdPlanPrevContab := IntToStr(piIdPlanoPrev);

   if Trim(sDataBoleta) <> ''
   then sDataVencimento := sDataBoleta
   else if Trim(qryEnvio.FieldByName('DATAPREVISAORECE').AsString) <> ''
        then sDataVencimento := qryEnvio.FieldByName('DATAPREVISAORECE').AsString
        else sDataVencimento := DateToStr(date);


   // Se a pessoa (favorecido/cliente) for a própria fundacao,
   // apenas contabilizar. Não enviar para o CAR/CAP
   if piIdPessoa <> iIdFundacao
   then begin
      qryAux.Close;
      qryAux.SQL.Clear;
      qryAux.SQL.Add(' SELECT DEBCRE FROM TIPODOCRECPAG '+
                     ' WHERE  CODTIPDOC = '''+sCodTipDoc+'''');
      qryAux.Open;
      if not qryAux.IsEmpty
      then sDebCre := qryAux.FieldByName('DebCre').AsString
      else sDebCre := 'C';

      // funcao para buscar tipo cli/for por situacao
      // Se cobranca -> cliente ,
      // Se Devolucao -> fornecedor
      iIdRamoForCli := BuscaRamoForCli(psFlgSitPart, cRecPag);

      if cRecPag = 'R'
      then begin
         // Criar Cliente
         try
            Documento.ForCli.Inserir(piIdPessoa, -1,
                                     -1,IntegraBack.Plano,
                                     iIdRamoForCli,
                                     Sistema.IdEmpresa,
                                     sCodCentroCustoD,'',
                                     sPlaContaD,'','C',
                                     False); // bexibemensagem


         except
            sMsgErro := 'Erro na criação do Cliente no Contas a Receber';
            Exit;
         end;
      end
      else begin
         // Criar Fornecedor
         try
            Documento.ForCli.Inserir(piIdPessoa, -1,
                                     -1,IntegraBack.Plano,
                                     iIdRamoForCli,
                                     Sistema.IdEmpresa,
                                     sCodCentroCustoD,'',
                                     sPlaContaD,'','F',
                                     False); // bexibemensagem


         except
            sMsgErro := 'Erro na criação do Favorecido no Contas a Pagar';
            Exit;
         end;

      end;


      //verificar se a pessoa/idforcli já existe, se sim repetir o coddocumento
      //se não Gerar codigo do documento

      //neste ponto se iCodLancCAPCAR >0 quer dizer
      //que está-se no envio de um mesmo participante em um mesmo mês
      //mas, caso a conta seja diferente um novo documento deve ser criado
      if (not bInsereDoc) and ( iCodLancCAPCAR > 0) then
      begin
         //verificar se a conta é a mesma
         //caso não inserir outro documento
         qryAux.Close;
         qryAux.SQL.Clear;
         qryAux.SQL.Add(' SELECT PLACONTA FROM DOCUMENTO '+
                        ' WHERE  CODDOCUMENTO = '''+inttostr(iCodLancCAPCAR)+'''');
         qryAux.Open;
         if not qryAux.IsEmpty then
            if trim(qryaux.fieldbyname('PLACONTA').AsString) <>  sPlaContaD then
            begin
               iCodLancCAPCAR := Documento.GetCodigo(qryAux);
               bInsereDoc := true;
            end;
      end;


      try
         if bInsereDoc then
         begin
            Documento.Inserir( qryAux, iCodLancCAPCAR, IntToStr(Sistema.IdModulo),
                            IntToStr(IntegraBack.Plano),
                            sPlaContaD,
                            sCodCentroCustoD,
                            -1, // iMoeCodigo (nao é em outra moeda)
                            0,
                            Sistema.IdEmpresa,
                            piIdPessoa, // IdForCli
                            StrToInt(sCodTipDoc),
                            StrToInt(sCodPortForma),
                            cRecPag,  // recpag
                            StrToFloat(sNoDocumento),
                            sComplDocumento,
                            DateToStr(date), // DataEmissao
                            sDataVencimento, // DATAVENCIMENTO
                            sDataVencimento, // DATAPROGRAMADA
                            '0', // sStatus
                            -1,  // iNumFatura
                            '2', // sOperacao
                            Sistema.IdUsuario,
                            -1, -1, // forma de pagamento/recebimento
                            '','',
                            bEmisBloq,
                            0,0,0); // iSubContaCliFor
         end;

      except
         if cRecPag = 'R'
         then sMsgErro := 'Erro na criação do Documento no Contas a Receber'
         else sMsgErro := 'Erro na criação do Documento no Contas a Pagar';
         Exit;
      end;

      if cRecPag = 'R'
      then begin
         // Atualizar documento com EMISBLOQ = N para emitir boleta direto,
         // sem ter que entrar em tela individual
         try
            qryAux.Close;
            qryAux.SQL.Clear;
            qryAux.SQL.Add(' UPDATE DOCUMENTO SET EMISBLOQ = ''N'' '+
                           ' WHERE  CODDOCUMENTO = '+IntToSTr(iCodLancCAPCAR));
            qryAux.ExecSQL;
         except
            sMsgErro := 'Erro na atualização do Documento no Contas a Receber';
            Exit;
         end;
      end;

      try
         iNumLancto := Documento.GerarNumLancto(qryAux, iCodLancCAPCAR);
      except
         sMsgErro := 'Erro na Geração do Lançamento.';
         Exit;
      end;

      if iNumLancto <= 0
      then begin
         sMsgErro := 'Erro na Geração do Lançamento.';
         Exit;
      end;

      sDescCobranca := BuscaDescCobranca(piIdContribuicao, piIdPlanoPrev, qryAux);
      if cRecPag = 'P'
      then sDescCobranca := 'Estorno de '+sDescCobranca;
     try
         sDescCobranca := sDescCobranca
      except
      end;
     
      try
         if (bInsereDoc)  then
         begin
            Documento.DiasFloat := 0;

            Documento.CriarLanctoDoc( qryAux,
                                      iCodLancCAPCAR, iNumLancto,
                                      -1,
                                      iPlnCodigo,
                                      DateToStr(Date),
                                      dValorEnviar,
                                      0,
                                      -1,
                                      sDebCre,
                                      '2', // sOperacao
                                      sDescCobranca , 
                                      Sistema.IdUsuario,
                                      False, -1, '');
         end
         else begin
            if qryaux.Active then
                qryaux.close;

            qryaux.sql.text := ' UPDATE LANCTODOCUM SET VALOR =  VALOR + '+OraNumero(FloatToStr(dValorEnviar))+'  '+
                               ', VLRLIQUIDO =  VLRLIQUIDO + '+OraNumero(FloatToStr(dValorEnviar))+'  '+ 
                               ' WHERE CODDOCUMENTO = '+inttostr(iCodLancCAPCAR)+'  '+
                               ' AND   OPERACAO     = ''2'' ';

            qryaux.ExecSql;
         end;
      except
         if cRecPag = 'R'
         then sMsgErro := 'Erro na Geração do Lançamento do Documento no Contas a Receber.'
         else sMsgErro := 'Erro na Geração do Lançamento do Documento no Contas a Pagar.';
         Exit;
      end;


      try
       if (bInsereDoc)  then
         begin
          Documento.Rateio.Inserir(iCodLancCAPCAR,
                          sCodTipRecDes,
                          cRecPag,
                          sCodCentroRespon,
                          Sistema.IdEmpresa,
                          dValorEnviar,
                          0,
                          Sistema.IdUsuario,
                          StrToInt(sCodUnidNegoc),0, '',
                          piIdPessJur,
                          -1,
                          StrToInt(sIdPlanPrevContab) );
          end
         else
           begin
            qryaux.close;
            qryaux.sql.text := ' UPDATE RATEIODOCUM SET VALOR =  VALOR + '+OraNumero(FloatToStr(dValorEnviar))+'  '+
                               ' WHERE CODDOCUMENTO = '+inttostr(iCodLancCAPCAR)+ ' ';


            qryaux.ExecSql;
           end;

      except
         if cRecPag = 'R'
         then sMsgErro := 'Falta parametrização -  Erro na Geração do Lançamento do Documento no Contas a Receber.'
         else sMsgErro := 'Falta parametrização -  Erro na Geração do Lançamento do Documento no Contas a Pagar.';
         Exit;
      end;

      // Se encontrou o mescobranca, fazer o update pela chave. Senao, fazer pelo mesreferencia
      bAchouMesCobranca := True;
      try
         sAnoMesCobranca := qryEnvio.FieldByName('MESCOBRANCA').AsString
      except
         bAchouMesCobranca := False;
      end;

      qryAux.Close;
      qryAux.SQL.Clear;

      if bAchouMesCobranca
      then qryAux.SQL.Add(' UPDATE HSTCONTRIBPREV SET CODDOCUMENTOPREV = '+IntToStr(iCodLancCAPCAR)+', '+
                     '                           DATAEMISSCOB = SYSDATE '+
                     ' WHERE  (NUMRECEBIMENTO  = '+qryEnvio.FieldByName('NumRecebimento').AsString+')'+
                     ' AND    (MESREFERENCIA   = '''+qryEnvio.FieldByName('MesReferencia').AsString+''')'+
                     ' AND    (MESCOBRANCA     = '''+qryEnvio.FieldByName('MesCobranca').AsString+''')'+
                     ' AND    (IDMOTIVO        = '+qryEnvio.FieldByName('IdMotivo').AsString+')')
      else qryAux.SQL.Add(' UPDATE HSTCONTRIBPREV SET CODDOCUMENTOPREV = '+IntToStr(iCodLancCAPCAR)+', '+
                     '                            DATAEMISSCOB = SYSDATE '+
                     ' WHERE   IDPESSOA        = '+IntToSTr(qryEnvio.FieldByName('IDPESSOA').AsInteger)+
                     ' AND     SEQPROPOSTA     = '+IntToSTr(qryEnvio.FieldByName('SEQPROPOSTA').AsInteger)+
                     ' AND     MESREFERENCIA   = '''+ qryEnvio.FieldByName('MESREFERENCIA').AsString+''''+
                     ' AND     IDCONTRIBUICAO  = '+IntToSTr(qryEnvio.FieldByName('IDCONTRIBUICAO').AsInteger)+
                     ' AND     IDMOTIVO        = '+IntToSTr(qryEnvio.FieldByName('IDMOTIVO').AsInteger)) ;

      try
         qryAux.ExecSQL;
      except
         sMsgErro := 'Erro na atualização do documento no histórico de contribuição';
         Exit;
      end;
   end; // if iIdPessoa <> iIdFundacao

   Result := dValorEnviar;

   if cRecPag = 'R'
   then begin
      sTipoReceita := 'C';
      sTipoDebCre  := 'D';
      sTP01Rec     := '1';
      sTP01Deb     := '0';
   end
   else begin
      sTipoReceita := 'D';
      sTipoDebCre  := 'C';
      sTP01Rec     := '0';
      sTP01Deb     := '1';
   end;

   // ********************************************************************************************
   //                                  PROCESSAR CONTABILIZACAO
   // ********************************************************************************************
   // CONTABILIZAR CRÉDITO

   if not ((psFlgSitPart = 'MA') and (not bContabiliza)) then
   begin
      try
         FazerInsertContab_Contrib( qryContabil,
                            sPlaConta,
                            sCodCentroCusto,
                            sTipoReceita,
                            sTP01Rec,
                            sNoDocumento,
                            sHistCre,
                            'Referente ao Mês '+ sAnoMesReferencia ,
                            '','','',
                            StrToInt(sCodUnidNegoc),
                            iCodSubConta,
                            dValorEnviar,
                            0,
                            date, // a data da contabilização cai na contabilidade da data atual
                            sTipCodigo,
                            piIdPessJur,
                            StrToInt(sIdPlanPrevContab) );
      except
         sMsgErro := 'Erro ao contabilizar crédito.';
         Exit;
      end;


      // CONTABILIZAR DÉBITO
      try
         FazerInsertContab_Contrib( qryContabil,
                            sPlaContaD,
                            sCodCentroCustoD,
                            sTipoDebCre,
                            sTP01Deb,
                            sNoDocumento,
                            sHistDeb,
                            'Referente ao Mês '+ sAnoMesReferencia ,
                            '','','',
                            StrToInt(sCodUnidNegoc),
                            iCodSubConta,
                            dValorEnviar,
                            0,
                            date, // a data da contabilização cai na contabilidade da data atual
                            sTipCodigo,
                            piIdPessJur,
                            StrToInt(sIdPlanPrevContab) );
      except
         sMsgErro := 'Erro ao contabilizar débito.';
         Exit;
      end;
   end;

   // ********************************************************************************************
   //                                  FIM DA CONTABILIZACAO
   // ********************************************************************************************

   if piIdPessoa <> iIdFundacao then
     AlimentaQryDocumentos_Contrib(
       qryDocumentos,
       iCodLancCAPCAR,
       iNumLancto,
       -1,-1,'','','',-1,
       piIdPessJur, piIdPlanoPrev,
       0);
  
end; // EnviaContribuicaoBANCO

procedure FazerInsertContab_Contrib(
                             qryContabil           : TwwQuery;
                             sContaContabil,
                             sCentroCusto,
                             sDebCre, sTipoDC,
                             sNumDoc, sHist1,
                             sHist2,  sHist3,
                             sHist4,  sHist5       : string;
                             iUnidNegoc, iSubConta :integer;
                             rValorCorrente,
                             rValorMoeda           : real;
                             dDataDia              : TDateTime;
                             sTipCodigo            : string;
                             piIdPessJur,
                             piIdPlanoPrev         : longint);
begin
{ Se a conta contábil + Centro de Custo + Unidade de negócio + Subconta + Déb/Cre +
  Tipo (0 - Deb / 1 - Cre / 2 - Partida Dobrada) já existir ==> acumular o valor passado;
  senão, criar registro na query. }

  if sContaContabil = '' then Exit;
  qryContabil.First;
  While (not qryContabil.Eof) do
  Begin
     if (qryContabil.FieldByName('PLACONTA').AsString       = sContaContabil) AND
        (qryContabil.FieldByName('CODCENTROCUSTO').AsString = sCentroCusto) AND
        (qryContabil.FieldByName('UNIDNEGOC').AsInteger     = iUnidNegoc) AND
        (qryContabil.FieldByName('CODSUBCONTA').AsInteger   = iSubConta) AND
        (qryContabil.FieldByName('LACDEBCRE').AsString      = sDebCre) AND
        (qryContabil.FieldByName('LACTIPO').AsString        = sTipoDC) AND
        (qryContabil.FieldByName('IDPESSJUR').AsInteger     = piIdPessJur) AND
        (qryContabil.FieldByName('IDPLANOPREV').AsInteger   = piIdPlanoPrev)
     Then Begin
        qryContabil.Edit;

        qryContabil.FieldByName('LACVALOR').AsFloat:=qryContabil.FieldByName('LACVALOR').AsFloat+rValorCorrente;
        qryContabil.FieldByName('LACVALHIST').AsFloat:=qryContabil.FieldByName('LACVALHIST').AsFloat+rValorMoeda;

        qryContabil.Post;
        exit;
     End;
     qryContabil.Next
  end;

  qryContabil.Insert;
  qryContabil.FieldByName('PLACONTA').AsString   := sContaContabil;
  qryContabil.FieldByName('PLANO').AsInteger     := IntegraBack.Plano;
  qryContabil.FieldByName('UNIDNEGOC').AsInteger := iUnidNegoc;
  qryContabil.FieldByName('LACVALOR').AsFloat    := rValorCorrente;
  qryContabil.FieldByName('LACVALHIST').AsFloat  := rValorMoeda;
  qryContabil.FieldByName('LACHIST1').AsString   := sHist1;
  qryContabil.FieldByName('LACHIST2').AsString   := sHist2;
  qryContabil.FieldByName('LACHIST3').AsString   := sHist3;
  qryContabil.FieldByName('LACHIST4').AsString   := sHist4;
  qryContabil.FieldByName('LACHIST5').AsString   := sHist5;
  qryContabil.FieldByName('LACNUMDOC').AsString  := sNumDoc;
  qryContabil.FieldByName('LACDEBCRE').AsString  := sDebCre;
  qryContabil.FieldByName('LACTIPO').AsString    := sTipoDC;
  qryContabil.FieldByName('PLNDATDIA').AsDateTime:= dDataDia;
  qryContabil.FieldByName('TIPCODIGO').AsString  := sTipCodigo;
  If iSubConta <> 0
  then qryContabil.FieldByName('CODSUBCONTA').AsInteger  := iSubConta;
  if sCentroCusto <> ''
  Then qryContabil.FieldByName('CODCENTROCUSTO').AsString := sCentroCusto;
  qryContabil.FieldbyName('IDPESSJUR').AsInteger       := piIdPessJur;
  qryContabil.FieldbyName('IDPLANOPREV').AsInteger     := piIdPlanoPrev;

  qryContabil.Post;
end;

Procedure AlimentaQryDocumentos_Contrib(
  QryDocumentos      : TWWQuery;
  Coddocumento,
  NumLancto,
  plano,
  unidnegoc             : Integer;
  placonta,
  codcentrorespon,
  codtiprecdes          : String;
  valor                 : real;
  piIdPessJur,
  piIdPlanoPrev,
  pFlgDevolucao         : longint );
Begin
  qryDocumentos.First;
  While (not qryDocumentos.Eof) do Begin
    if (qryDocumentos.FieldByName('CODDOCUMENTO').AsInteger   = CodDocumento) AND
       (qryDocumentos.FieldByName('NUMLANCTO').AsInteger      = NumLancto) AND
       (qryDocumentos.FieldByName('UNIDNEGOC').AsInteger      = UnidNegoc) AND
       (qryDocumentos.FieldByName('CODCENTRORESPON').AsString = CodCentroRespon) AND
       (qryDocumentos.FieldByName('CODTIPRECDES').AsString    = codtiprecdes) AND
       (qryDocumentos.FieldByName('PLACONTA').AsString        = placonta) and
       (qryDocumentos.FieldByName('IDPESSJUR').AsInteger      = piIdPessJur) and
       (qryDocumentos.FieldByName('IDPLANOPREV').AsInteger    = piIdPlanoPrev)
    Then Begin
       qryDocumentos.Edit;
       qryDocumentos.FieldByName('VALOR').AsFloat:=qryDocumentos.FieldByName('VALOR').AsFloat+Valor;
       qryDocumentos.Post;
       EXIT;
    End;
    qryDocumentos.Next
  end;

  QryDocumentos.Insert;
  qryDocumentos.FieldByName('CODDOCUMENTO').AsInteger      := Coddocumento;
  qryDocumentos.FieldByName('NUMLANCTO').AsInteger         := NumLancto;
  if plano <> -1 Then
     qryDocumentos.FieldByName('PLANO').AsInteger          := plano;
  if unidnegoc > 0 Then
     qryDocumentos.FieldByName('UNIDNEGOC').AsInteger      := unidnegoc
  else
     qryDocumentos.FieldByName('UNIDNEGOC').AsInteger      := prmUnidNegoc;

  if placonta <> '' Then
     qryDocumentos.FieldByName('PLACONTA').AsString        := placonta;
  if codcentrorespon <> '' Then
     qryDocumentos.FieldByName('CODCENTRORESPON').AsString := codcentrorespon;
  if codtiprecdes <> '' Then
     qryDocumentos.FieldByName('CODTIPRECDES').AsString    := codtiprecdes;
  if valor <> -1 Then
     qryDocumentos.FieldByName('VALOR').AsFloat    := valor;

  qryDocumentos.FieldByName('IDPESSJUR').AsInteger      := piIdPessJur;
  qryDocumentos.FieldByName('IDPLANOPREV').AsInteger    := piIdPlanoPrev;
  qryDocumentos.FieldByName('FLGDEVOLUCAO').AsInteger    := pFlgDevolucao;
  QryDocumentos.Post;
end;

procedure IncluiContabilidade_Contrib(
  qryContabil : TWWQuery;
  qryAux: TwwQuery;
  var iPlnCodigo : Integer;
  var sMsgErro : string);
Var
  liRetFuncao, liExercicio, liPeriodo,liEmpresa : Integer;
  sUnidNegoc, cCCustd,cContad,sSubConta,cCCustc ,cContac,sSubContaCre :String;
  rValHistCre, rValHistDeb : Real;
  bPartidaDobrada : Boolean;
begin
   liEmpresa := Sistema.IdEmpresa;

  If FazQuery(qryAux,
    'SELECT PACDOBRADA FROM PARAMCONTAB') Then
    If qryAux.FieldByName('PACDOBRADA').AsString = 'N' Then
      bPartidaDobrada := False
    Else bPartidaDobrada := True
  Else bPartidaDobrada := False;
  qryAux.Free;


      qryContabil.First;
      if (not qryContabil.Eof) then
      begin
        qryContabil.First;
        liRetFuncao:=TestaPeriodo(
          True,'BaseDados',
          qryContabil.FieldByName('PLNDATDIA').AsString,
          IntToStr(Sistema.IdModulo),liExercicio,liPeriodo,liEmpresa,
          sMsgErro);
         if liRetFuncao <> 0
         then begin
            iPlnCodigo:=-1;
            exit;
         end;

         while (not qryContabil.EOF) do
         begin

         //FAZER COM AS CONTAS DE CRÉDITO E DÉBITO SEJAM PASSADAS NO MESMO MOMENTO
         // PARA A FUNÇÃO LANCACONTAB.

            if (Trim(InttoStr(qryContabil.FieldByName('UNIDNEGOC').AsInteger)) = '' ) or
               (qryContabil.FieldByName('UNIDNEGOC').AsInteger = 0)
            then sUnidNegoc:= InttoStr(prmUnidNegoc)
            else sUnidNegoc:=InttoStr(qryContabil.FieldByName('UNIDNEGOC').AsInteger);



            If bPartidaDobrada Then
            Begin
              if qryContabil.FieldByName('LACDEBCRE').AsString = 'D'
              then begin
                 // DÉBITO
                 cCCustd     := qryContabil.FieldByName('CODCENTROCUSTO').AsString;
                 cContad     := qryContabil.FieldByName('PLACONTA').AsString;
                 rValHistDeb := qryContabil.FieldByName('LACVALHIST').AsFloat;
                 ssubconta   := qryContabil.FieldByName('CODSUBCONTA').AsString;
                 qryContabil.Next;//
                 cCCustc     :=qryContabil.FieldByName('CODCENTROCUSTO').AsString;
                 cContac     :=qryContabil.FieldByName('PLACONTA').AsString;
                 rValHistCre :=qryContabil.FieldByName('LACVALHIST').AsFloat;
                 ssubcontacre:=qryContabil.FieldByName('CODSUBCONTA').AsString;
              end
              else begin
                 // CRÉDITO
                 cCCustd     := qryContabil.FieldByName('CODCENTROCUSTO').AsString;
                 cContad     := qryContabil.FieldByName('PLACONTA').AsString;
                 rValHistDeb := qryContabil.FieldByName('LACVALHIST').AsFloat;
                 ssubconta   := qryContabil.FieldByName('CODSUBCONTA').AsString;
                 qryContabil.Next; //
                 cCCustc     :=qryContabil.FieldByName('CODCENTROCUSTO').AsString;
                 cContac     :=qryContabil.FieldByName('PLACONTA').AsString;
                 rValHistCre :=qryContabil.FieldByName('LACVALHIST').AsFloat;
                 ssubcontacre:=qryContabil.FieldByName('CODSUBCONTA').AsString;
              end;
            End Else
            Begin
              if qryContabil.FieldByName('LACDEBCRE').AsString = 'D'
              then begin
                 cCCustd     := qryContabil.FieldByName('CODCENTROCUSTO').AsString;
                 cContad     := qryContabil.FieldByName('PLACONTA').AsString;
                 rValHistDeb := qryContabil.FieldByName('LACVALHIST').AsFloat;
                 ssubconta   := qryContabil.FieldByName('CODSUBCONTA').AsString;
                 cCCustc     := '';
                 cContac     := '';
                 rValHistCre := 0;
                 ssubcontacre:= '';
              end
              else begin
                 cCCustd     :='';
                 cContad     :='';
                 rValHistDeb :=0;
                 ssubconta   :='';
                 cCCustc     :=qryContabil.FieldByName('CODCENTROCUSTO').AsString;
                 cContac     :=qryContabil.FieldByName('PLACONTA').AsString;
                 rValHistCre :=qryContabil.FieldByName('LACVALHIST').AsFloat;
                 ssubcontacre:=qryContabil.FieldByName('CODSUBCONTA').AsString;
              end;
            End; // Else - If bPartidaDobrada Then


            if (Trim(sSubConta) <> '' ) and (StrToInt(sSubConta) <= 0)
            then sSubConta := '';
            if (Trim(ssubcontacre) <> '' ) and (StrToInt(ssubcontacre) <= 0)
            then ssubcontacre := '';

            If bPartidaDobrada Then
              iPlnCodigo:= LANCACONTAB( True,'BASEDADOS',
                                        DatetoStr(qryContabil.FieldByName('PLNDATDIA').AsDateTime),
                                        IntToStr(Sistema.IdModulo),
                                        '2', //
                                        qryContabil.FieldByName('LACDEBCRE').AsString,
                                        '','','','','','','','','','',
                                        qryContabil.FieldByName('LACNUMDOC').AsString,
                                        qryContabil.FieldByName('LACHIST1').AsString,
                                        qryContabil.FieldByName('LACHIST2').AsString,
                                        qryContabil.FieldByName('LACHIST3').AsString,
                                        qryContabil.FieldByName('LACHIST4').AsString,
                                        qryContabil.FieldByName('LACHIST5').AsString,
                                        prmTpOperCobranca,
                                        cCCustD,
                                        cContaD,
                                        cCCustC,
                                        cContaC,
                                        liExercicio,
                                        liPeriodo,
                                        liEmpresa,
                                        Sistema.IdUsuario,
                                        IntegraBack.Plano,
                                        qryContabil.FieldByName('LACVALOR').AsFloat,
                                        0,0,0,0,0,0,0,0,
                                        sUnidNegoc,
                                        True, 
                                        rValHistDeb,
                                        rValHistCre,
                                        ssubconta,
                                        ssubcontacre,'','',
                                        iPlnCodigo,
                                        sMsgErro,
                                        IntegraBack.MascaraPlano,
                                        True,
                                        0,
                                        qryContabil.FieldByName('IDPLANOPREV').AsInteger,
                                        qryContabil.FieldByName('IDPESSJUR').AsInteger,
                                        Sistema.UsaPlanoPatro)
              Else
                iPlnCodigo:= LANCACONTAB( True,'BASEDADOS',
                                        DatetoStr(qryContabil.FieldByName('PLNDATDIA').AsDateTime),
                                        IntToStr(Sistema.IdModulo),
                                        qryContabil.FieldByName('LACTIPO').AsString,
                                        qryContabil.FieldByName('LACDEBCRE').AsString,
                                        '','','','','','','','','','',
                                        qryContabil.FieldByName('LACNUMDOC').AsString,
                                        qryContabil.FieldByName('LACHIST1').AsString,
                                        qryContabil.FieldByName('LACHIST2').AsString,
                                        qryContabil.FieldByName('LACHIST3').AsString,
                                        qryContabil.FieldByName('LACHIST4').AsString,
                                        qryContabil.FieldByName('LACHIST5').AsString,
                                        prmTpOperCobranca,
                                        cCCustD,
                                        cContaD,
                                        cCCustC,
                                        cContaC,
                                        liExercicio,
                                        liPeriodo,
                                        liEmpresa,
                                        Sistema.IdUsuario,
                                        IntegraBack.Plano,
                                        qryContabil.FieldByName('LACVALOR').AsFloat,
                                        0,0,0,0,0,0,0,0,
                                        sUnidNegoc,
                                        True, 
                                        rValHistDeb,
                                        rValHistCre,
                                        ssubconta,
                                        ssubcontacre,'','',
                                        iPlnCodigo,
                                        sMsgErro,
                                        IntegraBack.MascaraPlano,
                                        True,
                                        0,
                                        qryContabil.FieldByName('IDPLANOPREV').AsInteger,
                                        qryContabil.FieldByName('IDPESSJUR').AsInteger,
                                        Sistema.UsaPlanoPatro);



            if iPlnCodigo <= 0 then Exit;
            qryContabil.Next;
         end;
      end;
end;

end.
{==============================================================================|
| UNIT: UCONTRIBUICAOPREV                                                      |
| DESCRIÇÃO FUNCIONAL:                                                         |
|   IMPLEMENTA ROTINAS RELATIVAS A CONTRIBUIÇÃO PREVIDENCIÁRIA.                |
|                                                                              |
===============================================================================|
| DESENVOLVEDOR: FERNANDO JORGE                                                |
| PERÍODO DE IMPLEMENTAÇÃO: DE 18/07/2002 A 18/07/2002                         |
| VERSÃO PARA LIBERAÇÃO: 3.02.13g                                              |
| CLIENTE: (REFER)                                                             |
| DESCRIÇÃO DA IMPLEMENTAÇÃO:                                                  |
|| - Alterei o form  para contemplar os novos                                  |
|   parametros de integração contábil/financeira da folha                      |
|------------------------------------------------------------------------------|
| DESENVOLVEDOR: FERNANDO JORGE                                                |
| PERÍODO DE IMPLEMENTAÇÃO: DE 19/07/2002 A 19/07/2002                         |
| VERSÃO PARA LIBERAÇÃO: 3.02.13g                                              |
| CLIENTE: (CBS)                                                               |
| DESCRIÇÃO DA IMPLEMENTAÇÃO:                                                  |
|  - Atualizei a função REAJUSTASALPATRO.                                      |
|------------------------------------------------------------------------------|
| DESENVOLVEDOR: PAULO RAMOS                                                   |
| PERÍODO DE IMPLEMENTAÇÃO: DE 21/01/2003 A 22/01/2003                         |
| VERSÃO PARA LIBERAÇÃO:                                                       |
| CLIENTE:                                                                     |
| DESCRIÇÃO DA IMPLEMENTAÇÃO:                                                  |
| Calcula o salário virtual do assistido                                       |
| PENDENCIA 10794                                                              |
|                                                                              |
|------------------------------------------------------------------------------|
| DESENVOLVEDOR: PAULO RAMOS                                                   |
| PERÍODO DE IMPLEMENTAÇÃO: DE 28/03/2003 A 28/03/2003                         |
| VERSÃO PARA LIBERAÇÃO:                                                       |
| CLIENTE: CBS                                                                 |
| DESCRIÇÃO DA IMPLEMENTAÇÃO:                                                  |
| NÃO ENVIAR ALTERADORES DE CONTRIBUIÇÃO PARA TMPDESC, POIS A FOLHA CALCULA    |
| AUTOMATICAMENTE OS ALTERADORES NA PREVIA.                                    |
| PENDENCIA 12996                                                              |
|                                                                              |
|------------------------------------------------------------------------------|
| DESENVOLVEDOR:RICARDO VIGORITO                                               |
| PERÍODO DE IMPLEMENTAÇÃO: DE 07/01/2004 A 19/01/2004                         |
| VERSÃO PARA LIBERAÇÃO:                                                       |
| PENDÊNCIA : 15568                                                            |
| CLIENTE: (SE REQUISITO FOI PEDIDO POR UM CLIENTE ESPECÍFICO)                 |
| DESCRIÇÃO DA IMPLEMENTAÇÃO:                                                  |
| DESENVOLVIMENTOS DE ROTINAS PARA GERAÇÃO DE COBRANÇA DE CONTRIBUIÇÃO DE      |
|    PATROCINADORA                                                             |
|                                                                              |
|------------------------------------------------------------------------------|
| DESENVOLVEDOR: Ricardo Vigorito                                              |
| PERÍODO DE IMPLEMENTAÇÃO: DE 08/01/2004  A 19/01/2004                        |
| Pendência : 15568                                                            |
| DESCRIÇÃO DA IMPLEMENTAÇÃO:                                                  |
| - Inclusão das rotinas de integração da Contabilidade e Contas a Receber,    |
|   para contribuição de Patrocinadora                                         |
|                                                                              |
|------------------------------------------------------------------------------}
