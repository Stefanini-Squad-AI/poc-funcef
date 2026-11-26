// *****************************************************************************
// ***************************** REGISTRO DE ALTERAÇÕES ************************
// *****************************************************************************
// Autor(a)    : Fernando Xavier
// Data        : 07/04/2015
// Rotina      : EnviaContribAssistTmpDesc
// Pendência   : SOL 251974 PPM 745193
// Descricao   : Duplicidade Taxa Pensionistas - Solução passada pelo Hebio - BSB
//------------------------------------------------------------------------------
// Autor(a)    : Fernando Xavier
// Data        : 27/03/2015
// Rotina      : EnviaContribAssistTmpDesc
// Pendência   : SOL 251160 PPM 725086
// Descricao   : Duplicidade Taxa Pensionistas - Solução passada pelo Hebio - BSB
//------------------------------------------------------------------------------
// Autor(a)    : Paulo Ramos
// Data        : 11/04/2006
// Rotina      : EnviaContribAssistTmpDesc
// Pendência   : 22062
// Descricao   : Enviar para Tmpdesc apenas contribuições com FolhaOrigem = 'B'
//------------------------------------------------------------------------------
unit UContribAssistido;

interface

uses stdctrls, wwQuery, SysUtils, Dialogs, dbtables, ComCTRLs;

function EnviaContribAssistTmpDesc (qryContrib, qryAux : TwwQuery;
                                    piIdTitular        : String;
                                    piIdPessoa         : string; 
                                    piIdPessJur        : String;
                                    piIdPlanoPrev      : String;
                                    iIdLote            : longint;
                                    piSeqProposta      :Integer;
                                    psMesCobranca      : string;
                                    psMesReferencia    : string;
                                    prTotalLote        : double;
                                    var sMsgErro       : string;
                                    piNumReg           : longint;
                                    progressbar : TProgressBar;
                                    lbmsg : tlabel;
                                    FlgAbono :integer;
                                    iControleMes : integer;
                                    piflgprovisorio :integer): boolean;

implementation

uses Forms, Dbasedados, uAdmPrevFB, UParticipante, UContribuicaoPrevFB;


function EnviaContribAssistTmpDesc (qryContrib, qryAux : TwwQuery;
                                    piIdTitular        : String;
                                    piIdPessoa         : string; 
                                    piIdPessJur        : String;
                                    piIdPlanoPrev      : String;
                                    iIdLote            : longint;
                                    piSeqProposta      :Integer;
                                    psMesCobranca      : string;
                                    psMesReferencia    : string;
                                    prTotalLote        : double;
                                    var sMsgErro       : string;
                                    piNumReg           : longint;
                                    progressbar : TProgressBar;
                                    lbmsg : tlabel;
                                    FlgAbono :integer;
                                    iControleMes : integer;
                                    piflgprovisorio: integer): boolean;
Var
    bExigeFinanc,
    bPreparaContrib,
    bEnviaContrib,
    bOk : boolean;
    iPosicao,
    iOrdem,iUltimaContrib : longint;
    rEnvio : double;
    sCamposObrig,
    sCamposNObrig,sSQLContrib  : string;
    iIdLoteAux : longint;
begin
  Result := False;
  sCamposObrig  := '';
  sCamposNObrig := '';
  iordem := 0;
  // Verifica se existem contribuicoes para ENVIAR (do historico para a TmpDesc)
  // TRATA ENVIO DE CONTRIBUIÇÃO DE APOSENTADO E PENSIONISTA
  if piIdTitular = piIdPessoa then
  begin
    sSQLContrib := ' SELECT '+IntToStr(iIdFundacao) + ' AS IDFUNDACAO, HST.SITRECEBIMENTO, '+
     ' HST.MESREFERENCIA, HST.NUMRECEBIMENTO, HST.MESCOBRANCA, '+
     ' HST.IDMOTIVO, HST.VALORESPERADO, '+
     ' HST.DATAPREVISAORECE, HST.CODPORTFORMA, '+
     ' HST.VALOROP1, HST.VALOROP2, HST.VALOROP3, '+
     ' HST.FLGDESCFOLHA, HST.IDCONTRIBUICAO, '+
     ' HST.IDPESSJUR, HST.IDPLANOPREV, HST.IDPESSOA, '+
     ' HST.SEQPROPOSTA, HST.FLGDEVOLUCAO, HST.IDLOTE, '+
     ' CPP.FLGDESCFOLHA, CPP.DIAVENCIMENTO, '+
     ' CPP.PLANO, CPP.PLACONTAC, CPP.PLACONTAD, '+
     ' CPP.CODCENTROCUSTOC, CPP.CODCENTROCUSTOD, CPP.IDEMPRESA, '+
     ' CPP.UNIDNEGOC, CPP.IDEMPRESAPROP, CPP.CODCENTRORESPON, '+
     ' CPP.CODSUBCONTA, CPP.RECPAG, CPP.CODTIPRECDES, '+
     ' CPP.RECPAGDEVOL, CPP.CODTIPDESEMBDEVOL, CPP.TIPCODIGO, '+
     ' CPP.CODTIPDOC, CPP.CODPORTFORMA, CPP.PLANO13, '+
     ' CPP.PLACONTAC13, CPP.PLACONTAD13, CPP.CODCENTROCUSTOC13, '+
     ' CPP.IDEMPRESA13, CPP.CODCENTROCUSTOD13, CPP.UNIDNEGOC13, '+
     ' CPP.IDEMPRESAPROP13, CPP.CODCENTRORESPON13, CPP.CODSUBCONTA13, '+
     ' CPP.RECPAG13, CPP.CODTIPRECDES13, CPP.TIPCODIGO13, '+
     ' CPP.CODTIPDOC13, CPP.CODPORTFORMA13, CPP.CODTIPDESEMBCAR, '+
     ' CPP.DATAINICIO, CP.IDRUBDEVADIANT13 '+
     ' FROM  HSTCONTRIBPREV HST, CONTRIBPREVPARTP CPP, CONTPREV CP '+
     ' WHERE (HST.SITRECEBIMENTO IN (0,4)) '+
       ' AND (HST.FOLHAORIGEM = ''B'') '+ 
       ' AND (HST.FLGDESCFOLHA = 1) '+
       ' AND (HST.SEQPROPOSTA = 1) ';

       {ESTA OPCAO VISA EFETUAR O ENVIO DE CONTRIBUICAO
        PARA TMPDESC DE DUAS FORMAS COM MESCOBRANCA IGUAL AO MES DE PAGAMENTO
        OU COM MESCOBRANCA MENOR OU IGUAL AO MES DE PAGAMENTO}
       {NAO PRECISA CONTROLAR O MESREFERENCIA, POIS SERA
        SEMPRE MENOR OU IGUAL QUE O MES DE PAGAMENTO}
       if iControleMes > 0 then
       begin
         if iControleMes = 1 then
           sSQLContrib := sSQLContrib  +
             ' AND (HST.MESCOBRANCA = '''+psMesCobranca+''') ';
         if iControleMes = 2 then
           sSQLContrib := sSQLContrib  +
             ' AND (HST.MESCOBRANCA <= '''+psMesCobranca+''') ';
         if flgAbono = 0 then
           sSQLContrib := sSQLContrib  +
             ' AND (HST.MESREFERENCIA <= '''+psMesReferencia+''' OR '+
                  ' HST.MESREFERENCIA = '''+copy(psMesReferencia,1,4)+'/13'+''')'
         else
           sSQLContrib := sSQLContrib  +
             ' AND (HST.MESREFERENCIA = '''+copy(psMesReferencia,1,4)+'/13'+''') ';
       end;

       if piIdTitular <> '' then
         sSQLContrib := sSQLContrib  +
              ' AND (HST.IDPESSOA = '+piIdTitular+') '+
              ' AND (HST.IDTITULAR = '+piIdTitular+') '; // SOL 251160 PPM 725086

       if piIdPessJur <> '' then
         sSQLContrib := sSQLContrib  +
              ' AND (HST.IDPESSJUR = '+piIdPessJur+') ';
       if piIdPlanoPrev <> '' then
         sSQLContrib := sSQLContrib  +
              ' AND (HST.IDPLANOPREV = '+piIdPlanoPrev+') ';

       sSQLContrib := sSQLContrib  +
           ' AND (CPP.IDPESSJUR = HST.IDPESSJUR) '+
           ' AND (CPP.IDPLANOPREV = HST.IDPLANOPREV) '+
           ' AND (CPP.IDPESSOA = HST.IDPESSOA) '+
           ' AND (CPP.IDCONTRIBUICAO  = HST.IDCONTRIBUICAO) '+
           ' AND (CPP.SEQPROPOSTA = 1) '+
           ' AND (CPP.IDPLANOPREV = CP.IDPLANOPREV) '+
           ' AND (CPP.IDCONTRIBUICAO = CP.IDCONTRIBUICAO) '+
           ' AND (CP.FLGPAGADOR = ''C'') ';
  end
  else
  begin
    sSQLContrib := ' SELECT '+IntToStr(iIdFundacao) + ' AS IDFUNDACAO, HST.SITRECEBIMENTO, '+
     ' HST.MESREFERENCIA, HST.NUMRECEBIMENTO, HST.MESCOBRANCA, '+
     ' HST.IDMOTIVO, HST.VALORESPERADO, '+
     ' HST.DATAPREVISAORECE, HST.CODPORTFORMA, '+
     ' HST.VALOROP1, HST.VALOROP2, HST.VALOROP3, '+
     ' HST.FLGDESCFOLHA, HST.IDCONTRIBUICAO, '+
     ' HST.IDPESSJUR, HST.IDPLANOPREV, HST.IDPESSOA, '+
     ' HST.SEQPROPOSTA, HST.FLGDEVOLUCAO, HST.IDLOTE, '+
     ' 1 AS FLGDESCFOLHA, NULL AS DIAVENCIMENTO, '+
     ' NULL AS PLANO, NULL AS PLACONTAC, NULL AS PLACONTAD, '+
     ' NULL AS CODCENTROCUSTOC, NULL AS CODCENTROCUSTOD, NULL AS IDEMPRESA, '+
     ' NULL AS UNIDNEGOC, NULL AS IDEMPRESAPROP, NULL AS CODCENTRORESPON, '+
     ' NULL AS CODSUBCONTA, NULL AS RECPAG, NULL AS CODTIPRECDES, '+
     ' NULL AS RECPAGDEVOL, NULL AS CODTIPDESEMBDEVOL, NULL AS TIPCODIGO, '+
     ' NULL AS CODTIPDOC, NULL AS CODPORTFORMA, NULL AS PLANO13, '+
     ' NULL AS PLACONTAC13, NULL AS PLACONTAD13, NULL AS CODCENTROCUSTOC13, '+
     ' NULL AS IDEMPRESA13, NULL AS CODCENTROCUSTOD13, NULL AS UNIDNEGOC13, '+
     ' NULL AS IDEMPRESAPROP13, NULL AS CODCENTRORESPON13, NULL AS CODSUBCONTA13, '+
     ' NULL AS RECPAG13, NULL AS CODTIPRECDES13, NULL AS TIPCODIGO13, '+
     ' NULL AS CODTIPDOC13, NULL AS CODPORTFORMA13, NULL AS CODTIPDESEMBCAR, '+
     ' HST.DATAINICIO, NULL AS IDRUBDEVADIANT13 '+ // SOL 251160 PPM 725086 troca CPN.DATAINICIO por HST.DATAINICIO
     ' FROM  HSTCONTRIBPREV HST '+   // SOL 251160 PPM 725086 inicio
     {' JOIN NUCLEOFAMILIAR N ON N.IDRESPNUCLEO = HST.IDPESSOA AND N.IDTITULAR = HST.IDTITULAR '+ // SOL 251974 PPM 745193
     ' JOIN CONTRIBPREVNUCLEO CPN ON CPN.IDNUCLEOFAMILIAR = N.IDNUCLEOFAMILIAR AND '+
     '                               CPN.IDCONTRIBUICAO = HST.IDCONTRIBUICAO '+
     ' JOIN BENEFXTAXA BT ON HST.IDCONTRIBUICAO = BT.IDCONTRIBUICAO   '+
     ' JOIN BFCIARIOTITPLAN BTT ON HST.IDPESSOA = BTT.IDRESPONSAVEL AND  '+
     '                             CPN.IDNUCLEOFAMILIAR = BTT.IDNUCLEOFAMILIAR AND '+
     '                             HST.IDPLANOPREV = BTT.IDPLANOPREV AND  '+
     '                             BT.IDBENEFICIO = BTT.IDBENEFICIO  AND '+
     '                             HST.IDTITULAR = BTT.IDTITULAR  '+} // SOL 251974 PPM 745193 final
     ' WHERE (HST.SITRECEBIMENTO IN (0,4)) '+
     ' AND (HST.FOLHAORIGEM = ''B'') '+
     ' AND (HST.FLGDESCFOLHA = 1) '+
     ' AND (HST.SEQPROPOSTA = 1) ';

       if iControleMes > 0 then
       begin
         if iControleMes = 1 then
           sSQLContrib := sSQLContrib  +
             ' AND (HST.MESCOBRANCA = '''+psMesCobranca+''') ';
         if iControleMes = 2 then
           sSQLContrib := sSQLContrib  +
             ' AND (HST.MESCOBRANCA <= '''+psMesCobranca+''') ';
         if flgAbono = 0 then
           sSQLContrib := sSQLContrib  +
             ' AND (HST.MESREFERENCIA <= '''+psMesReferencia+''' OR '+
                  ' HST.MESREFERENCIA = '''+copy(psMesReferencia,1,4)+'/13'+''')'
         else
           sSQLContrib := sSQLContrib  +
             ' AND (HST.MESREFERENCIA = '''+copy(psMesReferencia,1,4)+'/13'+''') ';
       end;

       if piIdPessoa <> '' then
         sSQLContrib := sSQLContrib  +
              ' AND (HST.IDPESSOA = '+piIdPessoa+') ';
       if piIdTitular <> '' then
         sSQLContrib := sSQLContrib  +
           ' AND (HST.IDTITULAR = '+piIdTitular+') '; // SOL 251974 PPM 745193
       if piIdPessJur <> '' then
         sSQLContrib := sSQLContrib  +
              ' AND (HST.IDPESSJUR = '+piIdPessJur+') ';
       if piIdPlanoPrev <> '' then
         sSQLContrib := sSQLContrib  +
              ' AND (HST.IDPLANOPREV = '+piIdPlanoPrev+') ';
        // SOL 251160 PPM 725086 inicio do comentario
        // SOL 251974 PPM 745193 inicio do comentario
       {sSQLContrib := sSQLContrib  +
           ' AND (N.IDRESPNUCLEO = HST.IDPESSOA) '+
           ' AND (CPN.IDNUCLEOFAMILIAR = N.IDNUCLEOFAMILIAR) '+
           ' AND (CPN.IDCONTRIBUICAO  = HST.IDCONTRIBUICAO) '; }
       //SOL 251974 PPM 745193 fim do comentario
       //SOL 251160 PPM 725086 fim do comentario
  end;

  bEnviaContrib := True;
  with qryContrib do
  begin
    Close;
    SQL.Clear;
    SQL.Add(sSQLContrib);
    Open;
    iPosicao:=1;
    if IsEmpty  then bEnviaContrib := False;
  end; // with

  if bEnviaContrib then
  begin
    iOrdem         := 0;
    bExigeFinanc   := False;
    qryContrib.First;
    while not qryContrib.Eof do
    begin
      if iPosicao mod 100 = 0 then
        application.processmessages;
      if iPosicao mod 1000 = 0 then
      begin
        dtmBaseDados.dbBaseDados.Commit;
        dtmBaseDados.dbBaseDados.StartTransaction;
      end;
      if lbmsg <> nil then
        lbmsg.caption:='Processando '+inttostr(iPosicao);
      if lbmsg <> nil then
        lbmsg.update;
      inc(iOrdem);
      if qryContrib.FieldByName('IDLOTE').isnull then
        iIdLoteAux:=iidLote
      else
        iIdLoteAux:=qryContrib.FieldByName('IDLOTE').asinteger;
      rEnvio:=EnviaContribuicao(qryContrib, iOrdem, iIdLoteAux, -1, {liPeriodo}
        -1, {liExercicio}  piIdTitular, 'AS', '', sCamposObrig, sCamposNObrig,
        iUltimaContrib, bExigeFinanc, piflgprovisorio);

      if rEnvio < 0 then
      begin
        qryContrib.Close;
        Exit;
      end;

      // Atualizar sitrecebimento
      qryAux.Close;
      qryAux.SQL.Clear;
      qryAux.SQL.Add(' UPDATE HSTCONTRIBPREV SET SITRECEBIMENTO  = 1 '+
                     ' WHERE  (MESREFERENCIA    = '''+qryContrib.FieldByName('MESREFERENCIA').AsString +''') '+
                     ' AND    (MESCOBRANCA      = '''+qryContrib.FieldByName('MESCOBRANCA').AsString   +''') '+
                     ' AND    (IDMOTIVO         = '+qryContrib.FieldByName('IDMOTIVO').AsString        +') '+
                     ' AND    (NUMRECEBIMENTO   = '+qryContrib.FieldByName('NUMRECEBIMENTO').AsString  +') ');
      try
        qryAux.ExecSQL;
      except
        qryContrib.Close;
        Exit;
      end;
      prTotalLote := prTotalLote + rEnvio;
      inc(piNumReg);
      iUltimaContrib := qryContrib.FieldByName('IdContribuicao').AsInteger;
      qryContrib.Next;
      inc(iPosicao);
    end;
  end;
  Result := True;
end;

end.
{==============================================================================|
| UNIT: UCONTRIBASSISTIDO                                                      |
| DESCRIÇÃO FUNCIONAL:                                                         |
|   TRATA O CÁLCULO DE CONTRIBUIÇÃO DE ASSISTIDO PARA O PREPARO DA FOLHA.      |
|                                                                              |
|==============================================================================|
| DESENVOLVEDOR: PAULO RAMOS                                                   |
| PERÍODO DE IMPLEMENTAÇÃO: DE 17/01/2002 A 26/01/2002                         |
| VERSÃO PARA LIBERAÇÃO: 3.02.12                                               |
| CLIENTE: (CBS)                                                               |
| DESCRIÇÃO DA IMPLEMENTAÇÃO:                                                  |
|   COLOCOU-SE CONTROLE DE ENVIO DE CONTRIBUIÇÃO PARA TMPDESC NA ROTINA        |
| EnviaContribAssistTmpDesc, UTILIZADA NA PREVIA, PARA IDENTIFICAR REGISTROS   |
| NO HISTORICO DE CONTRIBUICAO POR COMPARACAO COM MESREFERENCIA E MESCOBRANCA. |
|                                                                              |
|------------------------------------------------------------------------------|
| DESENVOLVEDOR: PAULO RAMOS                                                   |
| PERÍODO DE IMPLEMENTAÇÃO: DE 26/04/2002 A 26/04/2002                         |
| VERSÃO PARA LIBERAÇÃO: 3.02.12k                                              |
| CLIENTE:                                                                     |
| DESCRIÇÃO DA IMPLEMENTAÇÃO:                                                  |
| - RETIRAR O CAMPO NUMPRIORIDADE E TABELA RUBRICAXPESS NA QUERY PRINCIPAL DA  |
| ROTINA ENVIACONTRIBASSISTTMPDESC.                                            |
|                                                                              |
|------------------------------------------------------------------------------}

