// *************************************************************************************************
// ***************************** REGISTRO DE ALTERAÇÕES ********************************************
// *************************************************************************************************
//--------------------------------------------------------------------------------
//Nº SIG.....: 136844
//Data.......: 2/06/2023
//Responsável: Andre Imakawa
//Descrição..: Refazer SIG 99651
//***************************************************************************************************
//Nº SIG.....: 135653
//Data.......: 10/05/2023
//Responsável: Andre Imakawa
//Descrição..: Desfazer SIG 99651
//***************************************************************************************************
//Alteração  : DesfazerPreparoIndividual
//Nº SIG.....: 99651
//Data.......: 27/10/2021
//Responsável: Andre Imakawa
//Descrição..: Apagar BASEDEPAGAMENTOREINF
//***************************************************************************************************
//Alteração  : DesfazerPreparoIndividual
//Nº SIG.....: 84221
//Data.......: 30/05/2019
//Responsável: Andre Imakawa
//Descrição..: Alterar FLGPROCESSADO = 1 na tabela HSTPRAZOACUMULACAOFOLHA
//***************************************************************************************************
//Alteração  : DesfazerPreparoIndividual
//Nº SIG.....: 65680
//Data.......: 28/03/2018
//Responsável: Andre Imakawa
//Descrição..: Deletar tabela LOG_ALT_BASEPGTO
//***************************************************************************************************
//Pendência   : SOL 207789/16579 PPM 543916
//Data        : 05/07/2015
//Responsável : Fernando Xavier
//Alteração   : Criação de Nova Funcionalidade para Batimento de Retorno das
//              Informações da Fita de Crédito
//**************************************************************************************************
//Pendência   : SOL 205224/15237 - KTN 2048156
//Responsável : Douglas Siqueira
//Data        : 04/11/2013
//Descrição   : Atividade aberta para recebimento do produto do ajuste do 13º dos idosos e do manual
//              de histórico de benefícios - atividade 15007.
//**************************************************************************************************
//**************************************************************************************************
//Pendência   : SOL 205224
//Responsável : douglas.siqueira
//Descrição   : IN1343 .
//**************************************************************************************************
//Pendência   : SOL 200203 KINTANA 1929048
//Responsável : Fernando Xavier
//Data        : 04/02/2013
//Descrição   : Remover do sistema a atualização de valores das tabelas
//              benefbfciario e Movbenef
//--------------------------------------------------------------------------------
//Pendência   : SOL 191996 KINTANA 1820068
//Responsável : Fernando Xavier
//Data        : 08/10/2012
//Descrição   : ERRO PREVIA BENEFICIO/RESGATE
//--------------------------------------------------------------------------------
//Pendência   : SOL 171285 KINTANA 1534738
//Responsável : FERNANDO XAVIER
//Data        : 03/01/2012
//Descrição   : criado novo parametro ORIGEM para informar origem do valoratual
//              caso não tenha passar origem vazio
//--------------------------------------------------------------------------------
//Pendência   : SOL 147427 KINTANA 1055088
//Responsável : BRUNO AZEVEDO
//Data        : 08/12/2010
//Descrição   : Ao desfazer o preparo, atualizar as entidades filtrando pelo seqproposta.
//--------------------------------------------------------------------------------
//Pendência   : SOL 139476 KINTANA 858172
//Responsável : BRUNO AZEVEDO
//Data        : 13/07/2010
//Descrição   : O sistema deve utilizar como parametro o maior (max) IDMOVBENEF.
//--------------------------------------------------------------------------------
//  Autor(a)   : Claudio Faria
//  Rotina     : DesfazerPreparoindividual
//  Data       : 21/08/2007
//  Pendencia  : 20934
//  Alteração  : Deletar a MOVBENEF por beneficio, IDModulo e IDLote.
//------------------------------------------------------------------------------
// Autor(a)    : Claudio Faria
// Data        : 04/09/2006
// Rotina      : DesfazerPreparoindividual
// Pendência   : 20963
// Descricao   : Adicionado o IDLote no delete da prévia
//------------------------------------------------------------------------------
// Autor(a)    : Paulo Ramos
// Data        : 22/02/2006
// Rotina      : Gravação do Histórico de Benefícios
// Pendência   : 19772
// Descricao   : Gravar no histórico de benefícios o percentual do cota do
//               pensionista no grupo familiar.
//------------------------------------------------------------------------------
// Autor(a)    : Paulo Ramos
// Data        : 07/02/2006
// Rotina      : Seleção do Estado do Registro
// Pendência   : 19742
// Descricao   : Permitir gravar valor do FLGENVIADO = 8 referente a
//               individualização do convênio de INSS.
//------------------------------------------------------------------------------
//  Autor(a)   : Paulo Ramos
//  Rotina     : DesfazerPreparoIndividual
//  Data       : 05/12/2005 a 06/12/2005
//  Pendencia  : 17200
//  Alteração  : Tratar no desfazer preparo casos de retenção por extrapolação
//               do limite de valor ou de percentual no preparo de benefício.
// -------------------------------------------------------------------------------------------------
unit uDesfazerPreparo;

interface

uses controls, forms, StdCtrls, sysutils, dialogs, wwquery, uadmprevFB, udatabase,
     ufuncoesuteisFB, uMensErro, FMotivoDesFazPreparo, dbasedados, usistema,
     umodulo, uObjFolha, uFuncoesFolha, uConstFolha, Classes, uCtrlBenefBfciario,wwstorep,Db, uCmfileUtils;//SOL205224 douglas.siqueira

function DesativaProcesso(qryAux: twwquery; iidtitular: integer): boolean;

function AtivaProcesso(qryAux: twwquery; iidtitular: integer): boolean;

function DesfazerPreparoIndividual(qryBusca: twwquery;
                                    qryExec: twwquery;
                                    iidtitular: integer;
                                    iidlote: integer;
                                    bRetido: boolean;
                                    sUltmespreparo: string;
                                    sMespreparoAnt: string;
                                    sMesAbono: string;
                                    sInscricao: string;
                                    sNome: string;
                                    adtdatapagtoant: tdatetime;
                                    mmResult : TStrings;
                                    bEstorno: Boolean = False): Boolean; 

procedure DesfazerPreparo(qryBenef: twwquery;
                          qryAux1: twwquery;
                          qryAux2: twwquery;
                          qryAux3: twwquery;
                          iidlote: integer;
                          itipofolha: integer;
                          bfazerindividual: boolean;
                          sUltmespreparo: string;
                          sMesAbono: string;
                          lblMsg: tlabel;
                          mmResult: tmemo);

procedure DeleteAtualizaBitri(_idpessoa,_idlote,_mesrefe,_mescobr,_mesprocAnt:string;_saldo:double);//SOL205224 douglas.siqueira

implementation

function DesativaProcesso(qryAux: twwquery; iidtitular: integer): boolean;
 var ssql: string;
 begin
  ssql:='UPDATE PROCESSOBENEF P '+
        'SET P.IDSITPROCESSO = 3 '+
        'WHERE NOT EXISTS (SELECT 1 '+
                          'FROM BENEFBFCIARIO B '+
                          'WHERE B.IDTITULAR = '+inttostr(iidtitular)+' '+
                          'AND B.NUMEROPROCESSO = P.NUMEROPROCESSO '+
                          'AND B.IDSITBENEFICIO <> 3) '+
        'AND (NVL(P.IDSITPROCESSO,0) <> 3) '+
        'AND EXISTS (SELECT 1 '+
                    'FROM BENEFBFCIARIO B '+
                    'WHERE B.IDTITULAR = '+inttostr(iidtitular)+' '+
                    'AND B.NUMEROPROCESSO = P.NUMEROPROCESSO) ';
  result:=ExecutarQuery(qryAux, ssql);
end;

function AtivaProcesso(qryAux: twwquery; iidtitular: integer): boolean;
 var ssql: string;
begin
  ssql:='UPDATE PROCESSOBENEF P '+
        'SET P.IDSITPROCESSO = 1 '+
        'WHERE EXISTS (SELECT 1 FROM BENEFBFCIARIO B '+
                      'WHERE B.IDTITULAR = '+inttostr(iidtitular)+' '+
                      'AND B.NUMEROPROCESSO = P.NUMEROPROCESSO '+
                      'AND B.IDSITBENEFICIO <> 3) '+
        'AND (NVL(P.IDSITPROCESSO,0) <> 1) ';
  result:=ExecutarQuery(qryAux, ssql);
end;

function DesfazerPreparoIndividual(qryBusca: twwquery;
                                    qryExec: twwquery;
                                    iidtitular: integer;
                                    iidlote: integer;
                                    bRetido: boolean;
                                    sUltmespreparo: string;
                                    sMespreparoAnt: string;
                                    sMesAbono: string;
                                    sInscricao: string;
                                    sNome: string;
                                    adtdatapagtoant: tdatetime;
                                    mmResult : TStrings;
                                    bEstorno: Boolean = False) : Boolean; 
 var svaloratual, svalorsrb, svalortotal, sidsitbeneficio, sseqproposta, sidplanoorigem,
     svalorcalculado, 
     smesref, smesreajant, ssql: string;
     breajinss: boolean;
     imotivo: integer;
     //controle para desfazer contribuicao de pensionista
     inucleofamiliar: integer;
     bpensao: boolean;
     dtrevisao: tdatetime; 
     bPossuiEncerramentoGrupo: boolean; //CONTROLA ENCERRAMENTO NO GRUPO FAMILIAR
     lbExecSalVirt: boolean; 
     lbSoAbono: boolean; 
     qryBeneficios: twwquery; 
     sMesReajSalPatroAnt: String; 
     CtrlBenefBfciario: TCtrlBenefBfciario; //RECALCULAR PERCENTUAL DO GRUPO FAMILIAR
     lstProc_Ben: tstringlist; //GUARDA NUMEROPROCESSO E BENEFICIO PARA RECALCULAR PERCENTUAL DO GRUPO FAMILIAR
     lii, liben, liproc: integer; 

  procedure Processa_Desfazer_SalarioVirtual;
  // trata salario virtual
  begin
    if not lbExecSalVirt and not bPensao then
    begin
      lbExecSalVirt:=true; 
      if not lbSoAbono then
      begin
        // retornar o valor anterior do SALAUXDOENCA na PARTPREVPLAN
        ssql:='SELECT HST.VALORPROVENTO, H.IDPESSJUR, H.IDPESSOA, H.IDPLANOPREV '+
              'FROM HISTRUBSAL HST, HSTBENEFBFCIARIO H, PARTPREVPLAN PP, PATRO PAT ';
        if bRetido then
          ssql:=ssql+
            'WHERE H.IDLOTE IS NULL '+
            'AND H.MES = '+QuotedStr(sMespreparoAnt)+' '+
            'AND H.MESREFERENCIA = '+QuotedStr(sMespreparoAnt)+' '
        else
          ssql:=ssql+
            'WHERE H.IDLOTE = '+inttostr(iidlote)+' ';

        ssql:=ssql+
              'AND H.IDTITULAR = '+inttostr(iidtitular)+' '+
              'AND PP.IDPESSOA = H.IDTITULAR '+
              'AND PP.IDPLANOPREV = H.IDPLANOPREV '+
              'AND PP.IDPESSJUR = H.IDPESSJUR '+
              'AND PP.IDPESSJUR = PAT.IDPESSOA '+
              'AND HST.MES = '+QuotedStr(sMespreparoAnt)+' '+
              'AND HST.IDPESSJUR = PP.IDPESSJUR '+
              'AND HST.IDRUBRICA = PAT.IDRUBSALAUXDOENCA '+
              'AND HST.IDPESSOA = H.IDPESSOA '+
              'AND HST.SEQRUBRICA = 1';

        if FazQuery(qryBusca,ssql) then
        begin
          while not qryBusca.eof do
          begin
            ssql:='SELECT IDRGREAJ, PERCENTUAL FROM REAJSALPATRO '+
                  'WHERE MESREAJ = '+QuotedStr(sUltmespreparo)+' '+
                  'AND IDPESSJUR = '+inttostr(qryBusca.fieldbyname('IDPESSJUR').asinteger)+' '+
                  'AND IDPLANOPREV = '+inttostr(qryBusca.fieldbyname('IDPLANOPREV').asinteger);

            if FazQuery(qryExec,ssql) then
            begin
              ssql :=  'SELECT MAX(MESREAJ) AS MESREAJ '+
                       'FROM REAJSALPATRO '+
                       'WHERE MESREAJ < '+QuotedStr(sUltmespreparo)+
                        ' AND IDPESSJUR = '+qryBusca.FieldByName('IDPESSJUR').AsString+
                        ' AND IDPLANOPREV = '+qryBusca.FieldByName('IDPLANOPREV').AsString;

              qryExec.Close;
              qryExec.Sql.Clear;
              qryExec.Sql.Add(sSql);
              qryExec.Open;

              sMesReajSalPatroAnt := qryExec.FieldByName('MESREAJ').AsString;

              ssql:='UPDATE PARTPREVPLAN '+
                    'SET SALAUXDOENCA  = '+Oranumero(qryBusca.Fieldbyname('VALORPROVENTO').asstring)+' '+
                    '  , MESULTREAJSAL = '+QuotedStr(sMesReajSalPatroAnt)+' '+
                    'WHERE IDPESSOA = '+inttostr(qryBusca.fieldbyname('IDPESSOA').asinteger)+' '+
                    'AND IDPLANOPREV = '+inttostr(qryBusca.fieldbyname('IDPLANOPREV').asinteger)+' '+
                    'AND IDPESSJUR = '+inttostr(qryBusca.fieldbyname('IDPESSJUR').asinteger);

              if not ExecutarQuery(qryExec, ssql) then
                mmResult.Add(
                  'Erro ao retornar o valor anterior do SALAUXDOENCA na PARTPREVPLAN: '+
                  'Inscrição '+sInscricao+' - '+sNome);
            end;
            qryBusca.next;
          end;
        end;
      end;

      //desfazer salário virtual
      ssql:='SELECT PP.IDPESSJUR, PP.IDPLANOPREV, PP.IDPESSOA, PP.FLGSALVIRTBENEF, '+
                   'PAT.IDRUBSALAUXDOENCA, H.MES, H.MESREFERENCIA, H.IDMOTIVO '+
            'FROM HSTBENEFBFCIARIO H, PARTPREVPLAN PP, PATRO PAT ';
      if bRetido then
        ssql:=ssql+
          'WHERE H.IDLOTE IS NULL '+
          'AND H.MES = '+QuotedStr(sMesRef)+' '
      else
        ssql:=ssql+
          'WHERE H.IDLOTE = '+inttostr(iidlote)+' ';

      ssql:=ssql+
            'AND H.IDTITULAR = '+inttostr(iidtitular)+' '+
            'AND H.MES = H.MESREFERENCIA '+
            'AND PP.IDPESSOA = H.IDTITULAR '+
            'AND PP.IDPLANOPREV = H.IDPLANOPREV '+
            'AND PP.IDPESSJUR = H.IDPESSJUR '+
            'AND PP.IDPESSJUR = PAT.IDPESSOA '+
            'AND PP.FLGSALVIRTBENEF = 1 ';

      if FazQuery(qryBusca,ssql) then
      begin
        while not qryBusca.eof do
        begin
          ssql:='DELETE HISTRUBSAL '+
                'WHERE IDTITULAR = '+inttostr(qryBusca.fieldbyname('IDPESSOA').asinteger)+' '+
                'AND IDPESSOA = '+inttostr(qryBusca.fieldbyname('IDPESSOA').asinteger)+' '+
                'AND IDPLANOPREV = '+inttostr(qryBusca.fieldbyname('IDPLANOPREV').asinteger)+' '+
                'AND IDPESSJUR = '+inttostr(qryBusca.fieldbyname('IDPESSJUR').asinteger)+' '+
                'AND MES = '+QuotedStr(qryBusca.fieldbyname('MESREFERENCIA').asstring)+' '+
                'AND MESCOBRANCA = '+QuotedStr(qryBusca.fieldbyname('MES').asstring)+' '+
                'AND IDRUBRICA = '+inttostr(qryBusca.fieldbyname('IDRUBSALAUXDOENCA').asinteger);
          if not ExecutarQuery(qryExec, ssql) then
            mmResult.Add('Erro ao eliminar o salário virtual: '+
              'Inscrição '+sInscricao+' - '+sNome);
          qryBusca.next;
        end;
      end;
    end;
  end;

  function PegaValoresAnteriores(assql, Origem: string ): boolean;   // SOL 171285 KINTANA 1534738 add novo parametro origem
  begin
    if FazQuery(qryBusca,assql) then
    begin

      if (qryBeneficios.fieldbyname('FLGREFERENCIA').asfloat = 1) then
      begin
        if svalortotal <> svalorcalculado then
        begin
          svalorcalculado:=
            oranumero(floattostr(
              ArredondaMoeda(
                qryBeneficios.fieldbyname('ULTVALORATUALREAJ').asfloat/
                qryBeneficios.fieldbyname('VALORTOTAL').asfloat*
                qryBeneficios.fieldbyname('VALORCALCULADO').asfloat)));
        end
        else
          svalorcalculado:=oranumero(floattostr(qryBusca.fieldbyname('VALORCALCULADO').asfloat));
      end
      else
        svalorcalculado:=oranumero(floattostr(qryBusca.fieldbyname('VALORCALCULADO').asfloat));
      if trim(Origem) = 'PegaDadosMovBenef' then   //SOL 171285 KINTANA 1534738
         svaloratual:=oranumero(floattostr(qryBusca.fieldbyname('VALORATUAL').asfloat));
      svalorsrb:=oranumero(floattostr(qryBusca.fieldbyname('VALORSRB').asfloat));
      svalortotal:=oranumero(floattostr(qryBusca.fieldbyname('VALORTOTAL').asfloat));
      result:=true;
    end
    else
      result:=false;
  end;

  function PegaDadosAntesReajusteBenefINSS: boolean;
   var smesaux: string;
       i: integer;
       bachou: boolean;
  begin
    //descobre ultimo mês anterior de reajuste de suplementação
    ssql:='SELECT MAX(MESREAJ) AS MESREAJ '+
          'FROM REAJINSS '+
          'WHERE (MESREAJ < '+QuotedStr(sUltMespreparo)+') '+
          'AND (MESREAJ >= '+QuotedStr(qryBeneficios.fieldbyname('MESINI').asstring)+')';

    if FazQuery(qryBusca,ssql) then
    begin
      if trim(qryBusca.fieldbyname('MESREAJ').asstring)  = '' then
        smesreajant:='0000/00'
      else
        smesreajant:=qryBusca.fieldbyname('MESREAJ').asstring;
    end
    else
      smesreajant:='0000/00';

    i:=0;
    smesaux:=sMespreparoAnt;
    repeat
      ssql:='SELECT H.VALORTOTAL, H.VALORINTEGRAL, H.VALORSRB, '+
                   'H.VALORCALCULADO '+
            'FROM HSTBENEFBFCIARIO H '+
            'WHERE (H.IDTITULAR = '+inttostr(qryBeneficios.fieldbyname('IDTITULAR').asinteger)+') '+
            'AND (H.IDPESSOA = '+inttostr(qryBeneficios.fieldbyname('IDPESSOA').asinteger)+') '+
            'AND (H.NUMEROPROCESSO = '+inttostr(qryBeneficios.fieldbyname('NUMEROPROCESSO').asinteger)+') '+
            'AND (H.IDPESSJUR = '+inttostr(qryBeneficios.fieldbyname('IDPESSJUR').asinteger)+') '+
            'AND (H.IDPLANOPREV = '+inttostr(qryBeneficios.fieldbyname('IDPLANOPREV').asinteger)+') '+
            //BRUNO AZEVEDO SOL 147427 KINTANA 1055088
            'AND (H.IDPLANOORIGEM = '+inttostr(qryBeneficios.fieldbyname('IDPLANOORIGEM').asinteger)+') '+
            'AND (H.IDBENEFICIO = '+inttostr(qryBeneficios.fieldbyname('IDBENEFICIO').asinteger)+') '+
            'AND (H.MESREFERENCIA = '+QuotedStr(sMesAux)+') '+
            'AND (H.FLGDEVOLUCAO = 0) ';

      bachou:=PegaValoresAnteriores(ssql, '' ); // SOL 171285 KINTANA 1534738
      if not bachou then
        smesaux:=SAnoMesAnterior(smesaux);
      inc(i);
    until (i=10) or bachou;

    result:=bachou;
  end;

  function PegaDadosAntesReajusteBenefSupl: boolean;
   var smesaux: string;
       i: integer;
       bachou: boolean;
  begin
    //descobre ultimo mês anterior de reajuste de suplementação
    ssql:='SELECT MAX(MESREAJ) AS MESREAJ '+
          'FROM REAJBENEFICIO '+
          'WHERE (IDPLANOPREV = '+inttostr(qryBeneficios.fieldbyname('IDPLANOPREV').asinteger)+') '+
          'AND (IDBENEFICIO = '+inttostr(qryBeneficios.fieldbyname('IDBENEFICIO').asinteger)+') '+
          'AND (MESREAJ < '+QuotedStr(sUltMespreparo)+') '+
          'AND (MESREAJ >= '+QuotedStr(qryBeneficios.fieldbyname('MESINI').asstring)+')';

    if FazQuery(qryBusca, ssql) then
    begin
      if trim(qryBusca.fieldbyname('MESREAJ').asstring) = '' then
        smesreajant:='0000/00'
      else
        smesreajant:=qryBusca.fieldbyname('MESREAJ').asstring;
    end
    else
      smesreajant:='0000/00';

    i:=0;
    smesaux:=sMespreparoAnt;
    repeat
      ssql:='SELECT H.VALORTOTAL, H.VALORINTEGRAL, H.VALORSRB, '+
                   'H.VALORCALCULADO '+
            'FROM HSTBENEFBFCIARIO H '+
            'WHERE (H.IDTITULAR = '+inttostr(qryBeneficios.fieldbyname('IDTITULAR').asinteger)+') '+
            'AND (H.IDPESSOA = '+inttostr(qryBeneficios.fieldbyname('IDPESSOA').asinteger)+') '+
            'AND (H.NUMEROPROCESSO = '+inttostr(qryBeneficios.fieldbyname('NUMEROPROCESSO').asinteger)+') '+
            'AND (H.IDPESSJUR = '+inttostr(qryBeneficios.fieldbyname('IDPESSJUR').asinteger)+') '+
            'AND (H.IDPLANOPREV = '+inttostr(qryBeneficios.fieldbyname('IDPLANOPREV').asinteger)+') '+
            //BRUNO AZEVEDO SOL 147427 KINTANA 1055088
            'AND (H.IDPLANOORIGEM = '+inttostr(qryBeneficios.fieldbyname('IDPLANOORIGEM').asinteger)+') '+
            'AND (H.IDBENEFICIO = '+inttostr(qryBeneficios.fieldbyname('IDBENEFICIO').asinteger)+') '+
            'AND (H.MESREFERENCIA = '+QuotedStr(sMesAux)+') '+
            'AND (H.FLGDEVOLUCAO = 0) ';

      bachou:=PegaValoresAnteriores(ssql, ''); // SOL 171285 KINTANA 1534738
      if not bachou then
        smesaux:=SAnoMesAnterior(smesaux);
      inc(i);
    until (i=10) or bachou;
    result:=bachou;
  end;


  function TemEncerramentoGrupo: boolean;
  var ssql: string;
  begin
    result:=false;
    ssql:='SELECT COUNT(*) '+
          'FROM BENEFBFCIARIO '+
          'WHERE IDSITBENEFICIO = 3 '+
          'AND IDTITULAR = '+inttostr(iidtitular)+' '+
          'AND IDTITULAR <> IDPESSOA '+
          'AND TO_CHAR(DATAFINAL,''YYYY/MM'') = '+QuotedStr(sUltMespreparo{sMesRef});
    if FazQuery(qryBusca,ssql) then
      result:=qryBusca.fields[0].asinteger > 0;
  end;

  function TemMovBenefPorLimite: boolean;
  var lssql: string;
  begin
    result:=false;

    lssql := 'SELECT IDMOVBENEF '                                                                                + _clinefeed +
             'FROM MOVBENEF '                                                                                    + _clinefeed +
             'WHERE (IDTITULAR      = ' + IntToStr(qryBeneficios.fieldbyname('IDTITULAR').asinteger)      + ') ' + _clinefeed +
             '  AND (IDPESSOA       = ' + IntToStr(qryBeneficios.fieldbyname('IDPESSOA').asinteger)       + ') ' + _clinefeed +
             '  AND (NUMEROPROCESSO = ' + IntToStr(qryBeneficios.fieldbyname('NUMEROPROCESSO').asinteger) + ') ' + _clinefeed +
             '  AND (IDPESSJUR      = ' + IntToStr(qryBeneficios.fieldbyname('IDPESSJUR').asinteger)      + ') ' + _clinefeed +
             '  AND (IDPLANOPREV    = ' + IntToStr(qryBeneficios.fieldbyname('IDPLANOPREV').asinteger)    + ') ' + _clinefeed +
             '  AND (IDBENEFICIO    = ' + IntToStr(qryBeneficios.fieldbyname('IDBENEFICIO').asinteger)    + ') ' + _clinefeed +
             '  AND (SEQPROPOSTA    = ' + IntToStr(qryBeneficios.fieldbyname('SEQPROPOSTA').asinteger)    + ') ' + _clinefeed +
             '  AND (MOTRETENC      = 12) '                                                                      + _clinefeed +
             '  AND (TIPOMOV        = 3) ';

    if FazQuery(qryBusca, lssql) then
      result := not qryBusca.IsEmpty;
  end;

  function PegaDadosMovBenef: boolean;
  var lssql: string;
  begin
    //BRUNO AZEVEDO SOL 139476 KINTANA 858172
    lssql := 'SELECT *                                    ' +
             '  FROM (SELECT VALORTOTAL,                  ' +
             '               VALORATUAL,                  ' +
             '               VALORSRB,                    ' +
             '               VALORTOTAL AS VALORINTEGRAL, ' +
             '               VALORTOTAL AS VALORCALCULADO ' +
             '          FROM MOVBENEF ' +
             'WHERE (IDTITULAR      = ' + inttostr(qryBeneficios.fieldbyname('IDTITULAR').asinteger)      + ') ' +
             '  AND (IDPESSOA       = ' + inttostr(qryBeneficios.fieldbyname('IDPESSOA').asinteger)       + ') ' +
             '  AND (NUMEROPROCESSO = ' + inttostr(qryBeneficios.fieldbyname('NUMEROPROCESSO').asinteger) + ') ' +
             '  AND (IDPESSJUR      = ' + inttostr(qryBeneficios.fieldbyname('IDPESSJUR').asinteger)      + ') ' +
             '  AND (IDPLANOPREV    = ' + inttostr(qryBeneficios.fieldbyname('IDPLANOPREV').asinteger)    + ') ' +
             '  AND (IDBENEFICIO    = ' + inttostr(qryBeneficios.fieldbyname('IDBENEFICIO').asinteger)    + ') ' +
             '  AND (SEQPROPOSTA    = ' + inttostr(qryBeneficios.fieldbyname('SEQPROPOSTA').asinteger)    + ') ' +
             '  AND (DATAMOV        = TO_DATE(' + Quotedstr(formatdatetime('dd/mm/yyyy',
                                    qryBeneficios.fieldbyname('DATAULTREVISAO').asdatetime))+',''DD/MM/YYYY''))' +
             '  AND (TIPOMOV        = 13) ' +
             'ORDER BY MOVBENEF.IDMOVBENEF DESC) ' +
             'WHERE ROWNUM = 1 ';
    result := PegaValoresAnteriores(lssql, 'PegaDadosMovBenef');   // SOL 171285 KINTANA 1534738
    //BRUNO AZEVEDO SOL 139476 KINTANA 858172
  end;

begin
  try
    //RECALCULAR PERCENTUAL DO GRUPO FAMILIAR
    lstProc_Ben:=tstringlist.create;
    lstProc_Ben.Sorted:=true;
    lstProc_Ben.Duplicates:=dupIgnore;
    //RECALCULAR PERCENTUAL DO GRUPO FAMILIAR-FIM

    qryBeneficios:=twwquery.create(application);
    qryBeneficios.databasename:='basedados';

    Result := False;

    breajinss:=false;

    //Processa_Desfazer_SalarioVirtual;
    lbExecSalVirt:=false;

    bPossuiEncerramentoGrupo:=TemEncerramentoGrupo;

    //AJUSTE NA QUERY PARA OBTER AS SEGUINTES SITUAÇÕES:
    //   FLGABONO = 1 E FLGNORMAL = 1 ==> APENAS PREPARO DE ABONO
    //   FLGABONO = 0 E FLGNORMAL = 0 ==> APENAS PREPARO NORMAL
    //   FLGABONO = 1 E FLGNORMAL = 0 ==> PREPARO DE ABONO E NORMAL

    ssql:= 'SELECT MAX(ABONO) AS FLGABONO, MIN(ABONO) AS FLGNORMAL, '                         + _clinefeed +
           '       VALORTOTAL, VALORATUAL, VALORSRB, MESFINAL, MESFINALPREV, '                + _clinefeed +
           '       FLGDATAPREVISTA, ULTMESREAJUSTE,ULTMESPREPARO,SEQPROPOSTA, '               + _clinefeed +
           '       VALORCALCULADO, ULTVALORATUALREAJ, NUMEROPROCESSO, '                       + _clinefeed +
           '       DATAULTREVISAO, IDBENEFICIO, IDTITULAR, IDPESSOA, IDPESSJUR, '             + _clinefeed +
           '       IDPLANOPREV, FLGREFERENCIA, IDSITBENEFICIO, MESINI, IDPLANOORIGEM '        + _clinefeed +
           'FROM ( '                                                                          + _clinefeed +
           '       SELECT DECODE(SUBSTR(H.MESREFERENCIA,6,2),''13'',1,0) AS ABONO, '          + _clinefeed +
           '              B.VALORTOTAL, B.VALORATUAL, B.VALORSRB, '                           + _clinefeed +
           '              TO_CHAR(DATAFINAL, ''YYYY/MM'') AS MESFINAL, '                      + _clinefeed +
           '              TO_CHAR(DATAFINALPREVISTA, ''YYYY/MM'') AS MESFINALPREV, '          + _clinefeed +
           '              NVL(B.FLGDATAPREVISTA,0) AS FLGDATAPREVISTA, '                      + _clinefeed +
           '              NVL(B.ULTMESREAJUSTE,''0000/00'') AS ULTMESREAJUSTE, '              + _clinefeed +
           '              B.ULTMESPREPARO, B.SEQPROPOSTA, B.VALORCALCULADO, '                 + _clinefeed +
           '              B.ULTVALORATUALREAJ, B.NUMEROPROCESSO, B.DATAULTREVISAO, '          + _clinefeed +
           '              B.IDBENEFICIO, B.IDTITULAR, B.IDPESSOA, B.IDPESSJUR, '              + _clinefeed +
           '              B.IDPLANOPREV, BP.FLGREFERENCIA, B.IDSITBENEFICIO, '                + _clinefeed +
           '              NVL(TO_CHAR(B.DATAINICIOFUND, ''YYYY/MM''),''0000/00'') AS MESINI,' + _clinefeed +
           '              B.IDPLANOORIGEM AS IDPLANOORIGEM '                                  + _clinefeed +
           '       FROM HSTBENEFBFCIARIO H, BENEFBFCIARIO B, BENEFPLANPREV BP '               + _clinefeed;

    if bRetido then
      ssql := ssql + '       WHERE (H.IDLOTE         IS NULL) ' + _clinefeed+
                     //TRATA FORA DE CONVÊNIO
                     '         AND (H.FLGENVIADO     IN (8, 9)) '+_clinefeed
    else
      ssql := ssql + '       WHERE H.IDLOTE          = ' + inttostr(iidlote) + ' '                  + _clinefeed;

    ssql := ssql + '         AND (H.IDTITULAR      = '+inttostr(iidtitular)+') '                  + _clinefeed +
                   '         AND (H.MES            = '+QuotedStr(sUltMespreparo)+') '             + _clinefeed +
                   '         AND (H.MESREFERENCIA  = '+QuotedStr(sUltMespreparo)+
                   '          OR H.MESREFERENCIA   = '+QuotedStr(sMesAbono)+') '                  + _clinefeed +
                   '         AND (NVL(H.FLGCONCESSAO,0) = 0) '                                    + _clinefeed +
                   '         AND (H.FLGDEVOLUCAO   = 0) '                                         + _clinefeed +
                   '         AND (H.NUMEROPROCESSO = B.NUMEROPROCESSO) '                          + _clinefeed +
                   '         AND (H.IDBENEFICIO    = B.IDBENEFICIO) '                             + _clinefeed +
                   '         AND (H.IDTITULAR      = B.IDTITULAR) '                               + _clinefeed +
                   '         AND (H.IDPESSOA       = B.IDPESSOA) '                                + _clinefeed +
                   '         AND (H.IDPESSJUR      = B.IDPESSJUR) '                               + _clinefeed +
                   '         AND (H.IDPLANOPREV    = B.IDPLANOPREV) '                             + _clinefeed +
                   '         AND (H.IDBENEFICIO    = BP.IDBENEFICIO) '                            + _clinefeed +
                   '         AND (H.IDPLANOPREV    = BP.IDPLANOPREV) '                            + _clinefeed +
                   '         AND (H.FLGMANUAL      IN (0,2)) '                                    + _clinefeed +
                   ') '                                                                           + _clinefeed +
                   'GROUP BY VALORTOTAL, VALORATUAL, VALORSRB, MESFINAL, MESFINALPREV, '          + _clinefeed +
                   '         FLGDATAPREVISTA, ULTMESREAJUSTE, ULTMESPREPARO, SEQPROPOSTA, '       + _clinefeed +
                   '         VALORCALCULADO, ULTVALORATUALREAJ, NUMEROPROCESSO, DATAULTREVISAO, ' + _clinefeed +
                   '         IDBENEFICIO, IDTITULAR, IDPESSOA, IDPESSJUR, '                       + _clinefeed +
                   '         IDPLANOPREV, FLGREFERENCIA, IDSITBENEFICIO, MESINI, IDPLANOORIGEM '                 + _clinefeed +
                   'ORDER BY FLGREFERENCIA, IDTITULAR, IDSITBENEFICIO, IDPESSOA, IDBENEFICIO '    + _clinefeed ;

    if FazQuery(qryBeneficios, ssql) then
    begin

      if qryBeneficios.IsEmpty then
        exit;

      bPensao:=qryBeneficios.fieldbyname('IDTITULAR').asinteger <>
               qryBeneficios.fieldbyname('IDPESSOA').asinteger;

      qryBeneficios.first;

      while not qryBeneficios.eof do
      begin
        lstProc_Ben.add(qryBeneficios.fieldbyname('NUMEROPROCESSO').asstring+
          ';'+qryBeneficios.fieldbyname('IDBENEFICIO').asstring); //

        //DETERMINA ABONO
        lbSoAbono := (qryBeneficios.fieldbyname('FLGABONO').asinteger = 1) and
                     (qryBeneficios.fieldbyname('FLGNORMAL').asinteger = 1);

        if lbSoAbono then
        begin
          smesref:=smesabono;
          imotivo:=prmIdMotivoAbono;
        end
        else
        begin
          smesref:=sUltMespreparo;
          imotivo:=prmIdMotivoFolhaBen;
        end;

        Processa_Desfazer_SalarioVirtual;

        //verificar se neste mês ocorreu algum reajuste e desfazer o reajuste
        smesreajant:=qryBeneficios.fieldbyname('ULTMESREAJUSTE').asstring;

        dtrevisao:=0;
        if not qryBeneficios.fieldbyname('DATAULTREVISAO').isnull then
          dtrevisao:=qryBeneficios.fieldbyname('DATAULTREVISAO').asdatetime;

        svaloratual:=oranumero(floattostr(qryBeneficios.fieldbyname('VALORATUAL').asfloat));
        svalorsrb:=oranumero(floattostr(qryBeneficios.fieldbyname('VALORSRB').asfloat));
        svalortotal:=oranumero(floattostr(qryBeneficios.fieldbyname('VALORTOTAL').asfloat));
        svalorcalculado:=oranumero(floattostr(qryBeneficios.fieldbyname('VALORCALCULADO').asfloat));
        sidsitbeneficio:=qryBeneficios.fieldbyname('IDSITBENEFICIO').asstring;
        sseqproposta:=qryBeneficios.fieldbyname('SEQPROPOSTA').asstring; //BRUNO AZEVEDO SOL 147427 KINTANA 1055088
        sidplanoorigem:=qryBeneficios.fieldbyname('IDPLANOORIGEM').asstring; //BRUNO AZEVEDO SOL 147427 KINTANA 1055088

        if not lbSoAbono then
        begin
          //SE TIVER OCORRIDO REVISÃO DE BENEFÍCIO OBTER VALORES DA MOVBENEF
          if dtrevisao > adtdatapagtoant then
          begin
            if not PegaDadosMovBenef then
            begin
              mmResult.Add('Erro não conseguiu determinar valor do Benefício '+
                'de Suplementação revisado na tabela de Movimentos (MovBenef): '+
                'Inscrição '+sInscricao+' - '+sNome);
              exit;
            end;
          end
          else
          begin
            if (qryBeneficios.fieldbyname('ULTMESREAJUSTE').asstring =
                qryBeneficios.fieldbyname('ULTMESPREPARO').asstring) then
            begin
              //tratar reajuste de inss
              if (qryBeneficios.fieldbyname('FLGREFERENCIA').asfloat = 1) then
              begin
                breajinss:=true;
                if not PegaDadosAntesReajusteBenefINSS then
                begin
                  mmResult.Add('Erro não conseguiu determinar valor do benefício '+
                    'de INSS anterior ao mês de reajuste: '+
                    'Inscrição '+sInscricao+' - '+sNome);
                  exit;
                end;
              end
              else
                if not PegaDadosAntesReajusteBenefSupl and
                   (qryBeneficios.fieldbyname('VALORATUAL').asfloat > 0) then //MOSTRA MENSAGEM APENAS SE VALOR JÁ FOR MAIOR QUE ZERO
                begin
                  mmResult.Add('Erro não conseguiu determinar valor do benefício '+
                    'de Suplementação anterior ao mês de reajuste: '+
                    'Inscrição '+sInscricao+' - '+sNome);
                  exit;
                end;
            end
            else
            begin
              //se ocorrer reajuste de inss, nos benefícios de suplementação deve-se alterar o valor
              if ((qryBeneficios.fieldbyname('FLGREFERENCIA').asfloat <> 1) and
                  breajinss) or
                 //VOLTAR VALOR ATUAL DE BENEFICIARIO QUANDO OCORRE ENCERRAMENTO
                 ((qryBeneficios.fieldbyname('IDTITULAR').asinteger <>
                   qryBeneficios.fieldbyname('IDPESSOA').asinteger) and
                  //IDENTIFICA SE HOUVE ENCERRAMENTO NO GRUPO FAMILIAR
                  bPossuiEncerramentoGrupo) then
                if not PegaDadosAntesReajusteBenefSupl and
                   (qryBeneficios.fieldbyname('VALORATUAL').asfloat > 0) then //MOSTRA MENSAGEM APENAS SE VALOR JÁ FOR MAIOR QUE ZERO
                begin
                  mmResult.Add('Erro não conseguiu determinar valor do benefício '+
                    'de Suplementação anterior ao mês de reajuste: '+
                    'Inscrição '+sInscricao+' - '+sNome);
                  exit;
                end;
            end;
          end;

          if not bRetido then
          begin
            if (qryBeneficios.fieldbyname('IDSITBENEFICIO').asstring = '3') and
               (qryBeneficios.fieldbyname('FLGDATAPREVISTA').asstring = '0') and
               (qryBeneficios.fieldbyname('MESFINAL').asstring =
                qryBeneficios.fieldbyname('ULTMESPREPARO').asstring) then
            begin
              sidsitbeneficio:='1';
              //se for idtitular <> idpessoa pegar valores de beneficio no mês anterior
            end;

            if (qryBeneficios.fieldbyname('IDSITBENEFICIO').asstring = '2') and
               (qryBeneficios.fieldbyname('FLGDATAPREVISTA').asstring = '1') and
               (qryBeneficios.fieldbyname('MESFINALPREV').asstring =
                qryBeneficios.fieldbyname('ULTMESPREPARO').asstring) then
            begin
              sidsitbeneficio:='1';
            end;

            ssql:='UPDATE BENEFBFCIARIO '+
                  //'SET ULTMESREAJUSTE = '+QuotedStr(smesreajant)+', '+  // SOL 200203 KINTANA 1929048
                  //    'ULTMESPREPARO = '+QuotedStr(smespreparoant)+', '+ // SOL 200203 KINTANA 1929048
                    ' SET ULTMESPREPARO = '+QuotedStr(smespreparoant)+', '+
                      'IDSITBENEFICIO = '+sidsitbeneficio+' '+
                   //   'VALORATUAL = '+svaloratual+', '+   // SOL 200203 KINTANA 1929048
                   //   'VALORSRB = '+svalorsrb+', '+ // SOL 200203 KINTANA 1929048
                   //   'VALORTOTAL = '+svalortotal+', '+  // SOL 200203 KINTANA 1929048
                   //   'VALORCALCULADO = '+svalorcalculado+' '+ // SOL 200203 KINTANA 1929048
                  'WHERE (IDTITULAR = '+inttostr(qryBeneficios.fieldbyname('IDTITULAR').asinteger)+') '+
                  'AND (IDPESSOA = '+inttostr(qryBeneficios.fieldbyname('IDPESSOA').asinteger)+') '+
                  'AND (NUMEROPROCESSO = '+inttostr(qryBeneficios.fieldbyname('NUMEROPROCESSO').asinteger)+') '+
                  'AND (IDPESSJUR = '+inttostr(qryBeneficios.fieldbyname('IDPESSJUR').asinteger)+') '+
                  'AND (IDPLANOPREV = '+inttostr(qryBeneficios.fieldbyname('IDPLANOPREV').asinteger)+') '+
                  //BRUNO AZEVEDO SOL 147427 KINTANA 1055088
                  'AND (SEQPROPOSTA = '+inttostr(qryBeneficios.fieldbyname('SEQPROPOSTA').asinteger)+') '+
                  'AND (IDPLANOORIGEM = '+inttostr(qryBeneficios.fieldbyname('IDPLANOORIGEM').asinteger)+') '+
                  'AND (IDBENEFICIO = '+inttostr(qryBeneficios.fieldbyname('IDBENEFICIO').asinteger)+') ';
          end
          else
          begin
            sidsitbeneficio:='';
            if (qryBeneficios.fieldbyname('IDSITBENEFICIO').asstring = '2') and
               (TemMovBenefPorLimite) then
              sidsitbeneficio:='1';

            ssql:='UPDATE BENEFBFCIARIO '+
                  //'SET ULTMESREAJUSTE = '+QuotedStr(smesreajant)+', '+ // SOL 200203 KINTANA 1929048
                  //    'ULTMESPREPARO = '+QuotedStr(smespreparoant)+', '; // SOL 200203 KINTANA 1929048
                    ' SET ULTMESPREPARO = '+QuotedStr(smespreparoant)+'  ';
            if sidsitbeneficio <> '' then
              ssql:=ssql+
                ' , IDSITBENEFICIO = '+sidsitbeneficio+' ';

            ssql:=ssql+
                    //  'VALORATUAL = '+svaloratual+', '+  // SOL 200203 KINTANA 1929048
                    //  'VALORSRB = '+svalorsrb+', '+  // SOL 200203 KINTANA 1929048
                    //  'VALORTOTAL = '+svalortotal+', '+ // SOL 200203 KINTANA 1929048
                    //  'VALORCALCULADO = '+svalorcalculado+' '+ // SOL 200203 KINTANA 1929048
                  'WHERE (IDTITULAR = '+inttostr(qryBeneficios.fieldbyname('IDTITULAR').asinteger)+') '+
                  'AND (IDPESSOA = '+inttostr(qryBeneficios.fieldbyname('IDPESSOA').asinteger)+') '+
                  'AND (NUMEROPROCESSO = '+inttostr(qryBeneficios.fieldbyname('NUMEROPROCESSO').asinteger)+') '+
                  'AND (IDPESSJUR = '+inttostr(qryBeneficios.fieldbyname('IDPESSJUR').asinteger)+') '+
                  'AND (IDPLANOPREV = '+inttostr(qryBeneficios.fieldbyname('IDPLANOPREV').asinteger)+') '+
                  //BRUNO AZEVEDO SOL 147427 KINTANA 1055088
                  'AND (SEQPROPOSTA = '+inttostr(qryBeneficios.fieldbyname('SEQPROPOSTA').asinteger)+') '+
                  'AND (IDPLANOORIGEM = '+inttostr(qryBeneficios.fieldbyname('IDPLANOORIGEM').asinteger)+') '+
                  'AND (IDBENEFICIO = '+inttostr(qryBeneficios.fieldbyname('IDBENEFICIO').asinteger)+') ';
          end;

          qryExec.close;
          qryExec.SQL.Clear;
          qryExec.Sql.Add(ssql);
          try
            qryExec.ExecSql;
          except
            mmResult.Add('Erro ao voltar informações anteriores do benefício: '+
              'Inscrição '+sInscricao+' - '+sNome);
            exit;
          end;
        end;

        //BRUNO
        ssql:='DELETE FROM HSTBENEFBFCIARIO ';
        if bRetido then
          ssql:=ssql+
            'WHERE (IDLOTE IS NULL) '+
            //TRATA FORA DE CONVÊNIO
            'AND (FLGENVIADO IN (8, 9)) '+_clinefeed
        else
          ssql:=ssql+
            'WHERE (IDLOTE = '+inttostr(iidlote)+') ';

        ssql:=ssql+
              'AND (IDMOTIVO = '+inttostr(iMotivo)+
                  ' OR IDMOTIVO = '+inttostr(prmIdMotivoAbono)+') '+
              'AND (IDTITULAR = '+inttostr(iidtitular)+') '+
              'AND (MES = '+QuotedStr(sUltMespreparo)+') '+
              //BRUNO AZEVEDO SOL 147427 KINTANA 1055088
              'AND (SEQPROPOSTA = '+QuotedStr(sSeqProposta)+') '+
              'AND (IDPLANOORIGEM = '+sIdPlanoOrigem+') '+
              'AND (FLGMANUAL IN (0,2)) '+
              //EVITA EXCLUIR REGISTROS DA CONCESSÃO
              'AND (NVL(FLGCONCESSAO,0) = 0)'+
              'AND (MESREFERENCIA = '+QuotedStr(sMesRef)+
                  ' OR MESREFERENCIA = '+QuotedStr(sMesAbono)+')';

        qryExec.close;
        qryExec.SQL.Clear;
        qryExec.Sql.Add(ssql);
        try
          qryExec.ExecSql;
        except
        //Brunno Mattos - KTN 767861 - SOL 132659 Inicio
        on e:Exception do
        begin
          TratarErro(e.Message);
          mmResult.Add('Erro ao eliminar histórico de benefício: '+
            'Inscrição '+sInscricao+' - '+sNome);
          exit;
        end;
        //Brunno Mattos - KTN 767861 - SOL 132659 Fim

        end;
        //BRUNO
        {
        // SOL 200203 KINTANA 1929048
        sSql := 'DELETE FROM MOVBENEF    ' +
                'WHERE (IDTITULAR      = ' + IntToStr( qryBeneficios.fieldbyname('IDTITULAR'     ).AsInteger ) + ') ' +
                '  AND (IDPESSOA       = ' + IntToStr( qryBeneficios.fieldbyname('IDPESSOA'      ).AsInteger ) + ') ' +
                '  AND (NUMEROPROCESSO = ' + IntToStr( qryBeneficios.fieldbyname('NUMEROPROCESSO').AsInteger ) + ') ' +
                '  AND (IDPESSJUR      = ' + IntToStr( qryBeneficios.fieldbyname('IDPESSJUR'     ).AsInteger ) + ') ' +
                '  AND (IDPLANOPREV    = ' + IntToStr( qryBeneficios.fieldbyname('IDPLANOPREV'   ).AsInteger ) + ') ' +
                '  AND (IDBENEFICIO    = ' + IntToStr( qryBeneficios.fieldbyname('IDBENEFICIO'   ).AsInteger ) + ') ' +
                //BRUNO AZEVEDO SOL 147427 KINTANA 1055088
                '  AND (SEQPROPOSTA    = ' + inttostr( qryBeneficios.fieldbyname('SEQPROPOSTA').asinteger)     + ') '+
                '  AND (IDPLANOORIGEM    = ' + inttostr( qryBeneficios.fieldbyname('IDPLANOORIGEM').asinteger)     + ') '+
                '  AND (IDMODULO       = ' + IntToStr( Sistema.IdModulo )                                      + ') ' +
                '  AND (IDLOTEMOV      = ' + IntToStr( iidlote )                                               + ') ';

        qryExec.Close;
        qryExec.SQL.Clear;
        qryExec.Sql.Add(sSql);

        Try
          qryExec.ExecSql;
        Except
          mmResult.Add('Erro ao voltar informações anteriores da movimentação de benefício: '+
                       'Inscrição ' + sInscricao + ' - ' + sNome);
          Exit;
        End;
        // SOL 200203 KINTANA 1929048
        }

        qryBeneficios.next;
      end;
    end;

    if not lbSoAbono then
      AtivaProcesso(qryExec, iidtitular);

    {ssql:='DELETE FROM HSTBENEFBFCIARIO ';
    if bRetido then
      ssql:=ssql+
        'WHERE (IDLOTE IS NULL) '+
        //TRATA FORA DE CONVÊNIO
        'AND (FLGENVIADO IN (8, 9)) '+_clinefeed
    else
      ssql:=ssql+
        'WHERE (IDLOTE = '+inttostr(iidlote)+') ';

    ssql:=ssql+
          'AND (IDMOTIVO = '+inttostr(iMotivo)+
              ' OR IDMOTIVO = '+inttostr(prmIdMotivoAbono)+') '+
          'AND (IDTITULAR = '+inttostr(iidtitular)+') '+
          'AND (MES = '+QuotedStr(sUltMespreparo)+') '+
          //BRUNO AZEVEDO SOL 147427 KINTANA 1055088
          'AND (SEQPROPOSTA = '+QuotedStr(sSeqProposta)+') '+
          'AND (IDPLANOORIGEM = '+sIdPlanoOrigem+') '+
          'AND (FLGMANUAL IN (0,2)) '+
          //EVITA EXCLUIR REGISTROS DA CONCESSÃO
          'AND (NVL(FLGCONCESSAO,0) = 0)'+
          'AND (MESREFERENCIA = '+QuotedStr(sMesRef)+
              ' OR MESREFERENCIA = '+QuotedStr(sMesAbono)+')';

    qryExec.close;
    qryExec.SQL.Clear;
    qryExec.Sql.Add(ssql);
    try
      qryExec.ExecSql;
    except
      mmResult.Add('Erro ao eliminar histórico de benefício: '+
        'Inscrição '+sInscricao+' - '+sNome);
      exit;
    end;}

    if not bRetido then
    begin
      ssql:='DELETE FROM TMPDESC '+
            'WHERE (IDLOTE = '+inttostr(iidlote)+') '+
            'AND (FLGDESCFOLHA = ''B'')'+
            'AND (FLGTIPODESC = ''P'')'+
            'AND (IDTITULAR = '+inttostr(iidtitular)+') '+
            'AND (MESCOBRANCA = '+QuotedStr(sUltMespreparo)+') '+
            'AND (MESREFERENCIA = '+QuotedStr(sMesRef)+
                ' OR MESREFERENCIA = '+QuotedStr(sMesAbono)+')';

      qryExec.close;
      qryExec.SQL.Clear;
      qryExec.Sql.Add(ssql);
      try
        qryExec.ExecSql;
      except
        mmResult.Add('Erro ao eliminar desconto temporário [TMPDESC]: '+
          'Inscrição '+sInscricao+' - '+sNome);
        exit;
      end;
    end;

    //TRATA O ABONO NOS IF'S INTERNOS NA DELEÇÃO DAS CONTRIBUICAO
      if bPensao then
      begin
        ssql:='SELECT DISTINCT IDNUCLEOFAMILIAR '+
              'FROM BFCIARIOTITPLAN '+
              'WHERE (IDTITULAR = '+inttostr(iidtitular)+') '+
              'AND (IDNUCLEOFAMILIAR > 0) ';
        qryBusca.close;
        qryBusca.SQL.Clear;
        qryBusca.Sql.Add(ssql);
        try
          qryBusca.open;

          while not qryBusca.eof do
          begin
            iNucleoFamiliar:=qryBusca.fieldbyname('IDNUCLEOFAMILIAR').asinteger;
            if iNucleoFamiliar > 0 then
            begin
              if not lbSoAbono then
              begin
                ssql:=' UPDATE CONTRIBPREVNUCLEO C '+
                      ' SET C.ULTMESPREPARO = '+QuotedStr(sMespreparoAnt)+
                      ' WHERE C.ULTMESPREPARO = '+QuotedStr(sUltMespreparo)+
                      ' AND (C.FLGCOBRA = 1) '+
                      ' AND (C.IDNUCLEOFAMILIAR = '+inttostr(iNucleoFamiliar)+') '+
                      ' AND EXISTS '+
                      ' (SELECT 1 '+
                        'FROM HSTCONTRIBPREV H, BFCIARIOTITPLAN BF ';
                if bRetido then
                  ssql:=ssql+
                    'WHERE (H.IDLOTE IS NULL) '
                else
                  ssql:=ssql+
                 'WHERE (H.IDLOTE = '+inttostr(iidlote)+') ';
                ssql:=ssql+
                    'AND (NVL(H.FLGCONCESSAO,0) = 0) '+ // EVITAR EXCLUIR REGISTROS DA CONCESSÃO
                    'AND (H.MESCOBRANCA = '+QuotedStr(sUltMespreparo)+') '+
                    'AND (H.MESREFERENCIA = '+QuotedStr(sUltMespreparo)+') '+
                    'AND (BF.IDNUCLEOFAMILIAR = C.IDNUCLEOFAMILIAR) '+
                    'AND (BF.IDTITULAR = '+inttostr(iidtitular)+') '+
                    'AND (BF.IDPESSJUR = H.IDPESSJUR) '+
                    'AND (BF.IDPLANOPREV = H.IDPLANOPREV) '+
                    'AND (BF.IDRESPONSAVEL = H.IDPESSOA) '+
                    'AND (H.IDCONTRIBUICAO = C.IDCONTRIBUICAO)) ';

                qryExec.close;
                qryExec.SQL.Clear;
                qryExec.Sql.Add(ssql);
                try
                  qryExec.ExecSql;
                except
                  mmResult.Add('Erro ao atualizar mês de preparo de contribuição de pensionista: '+
                    'Inscrição '+sInscricao+' - '+sNome);
                  exit;
                end;
              end;

              ssql:='DELETE FROM HSTCONTRIBPREV H ';
              if bRetido then
                ssql:=ssql+
                  'WHERE (H.IDLOTE IS NULL) '
              else
                ssql:=ssql+
                  'WHERE (H.IDLOTE = '+inttostr(iidlote)+') ';

              ssql:=ssql+
                    'AND (NVL(H.FLGCONCESSAO,0) = 0) '+ //EVITA EXCLUIR REGISTROS DA CONCESSÃO
                    'AND (H.MESCOBRANCA = '+QuotedStr(sUltMespreparo)+') '+
                    'AND (H.MESREFERENCIA = '+QuotedStr(sMesRef)+
                        ' OR H.MESREFERENCIA = '+QuotedStr(sMesAbono)+') '+
                    'AND (H.FLGSITFUNDACAO = ''AS'')'+
                    ' AND EXISTS '+
                    ' (SELECT 1 '+
                      'FROM BFCIARIOTITPLAN BF, CONTRIBPREVNUCLEO C '+
                      'WHERE (BF.IDNUCLEOFAMILIAR = C.IDNUCLEOFAMILIAR) '+
                      'AND (C.FLGCOBRA = 1)'+
                      'AND (BF.IDTITULAR = '+inttostr(iidtitular)+') '+
                      'AND (BF.IDNUCLEOFAMILIAR = '+inttostr(iNucleoFamiliar)+') '+
                      'AND (BF.IDPESSJUR = H.IDPESSJUR) '+
                      'AND (BF.IDPLANOPREV = H.IDPLANOPREV) '+
                      'AND (BF.IDRESPONSAVEL = H.IDPESSOA) '+
                      'AND (H.IDCONTRIBUICAO = C.IDCONTRIBUICAO)) ';

              qryExec.close;
              qryExec.SQL.Clear;
              qryExec.Sql.Add(ssql);
              try
                qryExec.ExecSql;
              except
                mmResult.Add('Erro ao eliminar histórico de contribuição: '+
                  'Inscrição '+sInscricao+' - '+sNome);
                exit;
              end;
            end;

            qryBusca.next;
          end;
        except
          iNucleoFamiliar:=0;
        end;
      end
      else
      begin
        if not lbSoAbono then
        begin
          ssql:=' UPDATE CONTRIBPREVPARTP C '+
                ' SET C.ULTMESPREPARO = '+QuotedStr(sMespreparoAnt)+
                ' WHERE C.ULTMESPREPARO = '+QuotedStr(sUltMespreparo)+
                ' AND (C.IDPESSOA = '+inttostr(iidtitular)+') '+
                ' AND (C.FLGCOBRA = 1) '+
                ' AND (C.FLGDESCFOLHA = 1) '+
                ' AND EXISTS '+
                ' (SELECT DISTINCT H.IDCONTRIBUICAO '+
                  'FROM HSTCONTRIBPREV H ';
          if bRetido then
            ssql:=ssql+
              'WHERE (H.IDLOTE IS NULL) '
          else
            ssql:=ssql+
              'WHERE (H.IDLOTE = '+inttostr(iidlote)+') ';

          ssql:=ssql+
                  'AND (NVL(H.FLGCONCESSAO,0) = 0) '+ // EVITAR EXCLUIR REGISTROS DA CONCESSÃO
                  'AND (H.MESCOBRANCA = '+QuotedStr(sUltMespreparo)+') '+
                  'AND (H.MESREFERENCIA = '+QuotedStr(sUltMespreparo)+') '+
                  'AND (H.IDPESSJUR = C.IDPESSJUR) '+
                  'AND (H.IDPLANOPREV = C.IDPLANOPREV) '+
                  'AND (H.IDPESSOA = C.IDPESSOA) '+
                  'AND (H.IDCONTRIBUICAO = C.IDCONTRIBUICAO) '+
                  'AND (H.SEQPROPOSTA = C.SEQPROPOSTA)) ';

          qryExec.close;
          qryExec.SQL.Clear;
          qryExec.Sql.Add(ssql);
          try
            qryExec.ExecSql;
          except
            mmResult.Add('Erro ao atualizar mês de preparo de contribuição: '+
              'Inscrição '+sInscricao+' - '+sNome);
            exit;
          end;
        end;

        ssql:='DELETE FROM HSTCONTRIBPREV ';
        if bRetido then
          ssql:=ssql+
            'WHERE (IDLOTE IS NULL) '
        else
          ssql:=ssql+
            'WHERE (IDLOTE = '+inttostr(iidlote)+') ';

        ssql:=ssql+
              'AND (NVL(FLGCONCESSAO,0) = 0) '+ // EVITAR EXCLUIR REGISTROS DA CONCESSÃO
              'AND (IDPESSOA = '+inttostr(iidtitular)+') '+
              'AND (MESCOBRANCA = '+QuotedStr(sUltMespreparo)+') '+
              'AND (MESREFERENCIA = '+QuotedStr(sMesRef)+
                  ' OR MESREFERENCIA = '+QuotedStr(sMesAbono)+') '+
              'AND (FLGSITFUNDACAO = ''AS'')';

        qryExec.close;
        qryExec.SQL.Clear;
        qryExec.Sql.Add(ssql);
        try
          qryExec.ExecSql;
        except
          mmResult.Add('Erro ao eliminar histórico de contribuição: '+
            'Inscrição '+sInscricao+' - '+sNome);
          exit;
        end;
      end;

    // Andre Imakawa - SIG 84221 - Inicio
    if IsLoteResgate(inttostr(iidlote)) then
    begin
        ssql := ' UPDATE CM.HSTPRAZOACUMULACAOFOLHA HST                      '
              + ' SET FLGPROCESSADO = 1                                      '
              + ' WHERE FLGPROCESSADO = 2                                    '
              + ' AND IDHSTFOLHABENEF IS NULL                                '
              + ' AND EXISTS (SELECT 1                                       '
              + '         FROM PREVIA P                                      '
              + '        WHERE P.IDPESSOA = HST.IDPESSOA                     '
              + '          AND P.IDTITULAR = HST.IDTITULAR                   '
              + '          AND P.IDPLANOPREV = HST.IDPLANOPREV               '
              + '          AND P.IDTITULAR = '+inttostr(iidtitular)
              + '          AND P.IDLOTE = ' + inttostr(iidlote)
              + '          AND EXISTS(  SELECT 1                             '
              + '                 FROM PARTPREVPLAN PART                     '
              + '                WHERE PART.IDPESSOA    = P.IDTITULAR        '
              + '                  AND PART.IDPESSJUR   = P.IDPATRO          '
              + '                  AND PART.IDPLANOPREV = P.IDPLANOPREV      '
              + '                  AND PART.TIPOOPCAOIR = 2))                ';

      qryExec.close;
      qryExec.SQL.Clear;
      qryExec.Sql.Add(ssql);
      try
        qryExec.ExecSql;
      except
        mmResult.Add('Erro ao desfazer tabela IR Regressivo.'+
          'Inscrição '+sInscricao+' - '+sNome);
        exit;
      end;

    end;
    // Andre Imakawa - SIG 84221 - Fim

    if not bRetido then
    begin
      ssql:=' UPDATE TMPDESC SET DATARECEBIMENTO = NULL, '+
               'VALORRECEBIDO = NULL, LOTEPREVIA = NULL '+
            ' WHERE (FLGDESCFOLHA = ''B'') '+
            ' AND (MESCOBRANCA = '+QuotedStr(sUltMespreparo)+') '+
            ' AND (LOTEPREVIA = '+inttostr(iidlote)+') '+
            ' AND (IDTITULAR = '+inttostr(iidtitular)+') ';
      qryExec.close;
      qryExec.SQL.Clear;
      qryExec.Sql.Add(ssql);
      try
        qryExec.ExecSql;
      except
        mmResult.Add('Erro no acerto de outros descontos efetuados na Prévia.'+
          'Inscrição '+sInscricao+' - '+sNome);
        exit;
      end;

      if not lbSoAbono then
      begin
        if (SistemaFolha.FLGTRATALOTEINDEPENDENTE = 1) then
          ssql:=
            'DELETE FROM PREVIA '+
            'WHERE (MESCOBRANCA = '+QuotedStr(sUltMespreparo)+') '+
            'AND (IDTITULAR = '+inttostr(iidtitular)+') '+
            'AND (IDLOTE = '+inttostr(iidlote)+')'
        else
          ssql:=
            'DELETE FROM PREVIA '+
            'WHERE (MESCOBRANCA = '+QuotedStr(sUltMespreparo)+') '+
            'AND (IDTITULAR = '+inttostr(iidtitular)+') '+
            'AND (IDLOTE = '+inttostr(iidlote)+')';   // SOL 191996 KINTANA 1820068
      end
      else
        ssql:='DELETE FROM PREVIA '+
              'WHERE (MESCOBRANCA = '+QuotedStr(sUltMespreparo)+') '+
              'AND (IDTITULAR = '+inttostr(iidtitular)+') '+
              'AND (IDLOTE = '+inttostr(iidlote)+')';


//SOL205224 douglas.siqueira

      DeleteAtualizaBitri(inttostr(iidtitular),
                          inttostr(iidlote),
                          sUltMespreparo,
                          sUltMespreparo,
                          sMespreparoAnt,
                          0
                          );


//SOL205224 douglas.siqueira

      qryExec.close;
      qryExec.SQL.Clear;
      qryExec.Sql.Add(ssql);
      try
        qryExec.ExecSql;
      except
        mmResult.Add('Erro ao eliminar Prévia: '+
          'Inscrição '+sInscricao+' - '+sNome);
        exit;
      end;
    end;


    // Andre Imakawa - SIG 65680 - Inicio
    ssql:='DELETE FROM CM.LOG_EXCLUSAO_PREVIA '+
          'WHERE (MESCOBRANCA = '+QuotedStr(sUltMespreparo)+') '+
          'AND   (IDTITULAR = '+inttostr(iidtitular)+') '+
          'AND   (IDLOTE = '+inttostr(iidlote)+')';

    qryExec.close;
    qryExec.SQL.Clear;
    qryExec.Sql.Add(ssql);
    try
      qryExec.ExecSql;
    except
      mmResult.Add('Erro ao eliminar LOG_EXCLUSAO_PREVIA: '+
        'Inscrição '+sInscricao+' - '+sNome);
      exit;
    end;

    ssql:='DELETE FROM LOG_ALT_PREVIA '+
          'WHERE (MESCOBRANCA = '+QuotedStr(sUltMespreparo)+') '+
          'AND   (IDTITULAR = '+inttostr(iidtitular)+') '+
          'AND   (IDLOTE = '+inttostr(iidlote)+')';

    qryExec.close;
    qryExec.SQL.Clear;
    qryExec.Sql.Add(ssql);
    try
      qryExec.ExecSql;
    except
      mmResult.Add('Erro ao eliminar LOG_ALT_PREVIA: '+
        'Inscrição '+sInscricao+' - '+sNome);
      exit;
    end;

    ssql:='DELETE FROM CM.LOG_ALT_BASEPGTO BA '+
          ' WHERE EXISTS (SELECT 1 FROM BASEDEPAGAMENTO B '+
          '              WHERE (B.IDBASEPGTO = BA.IDBASEPGTO ) '+
          '              AND   (B.MESCOBRANCA = '+QuotedStr(sUltMespreparo)+') '+
          '              AND   (B.IDTITULAR = '+inttostr(iidtitular)+') '+
          '              AND   (B.IDLOTE = '+inttostr(iidlote)+') )';

    qryExec.close;
    qryExec.SQL.Clear;
    qryExec.Sql.Add(ssql);
    try
      qryExec.ExecSql;
    except
      mmResult.Add('Erro ao eliminar LOG_ALT_BASEPGTO: '+
        'Inscrição '+sInscricao+' - '+sNome);
      exit;
    end;

    ssql:=' DELETE FROM CM.OBS_PREVIA_BASEPGTO OBA '+
          ' WHERE EXISTS (SELECT 1 FROM CM.LOG_ALT_BASEPGTO BA '+
          ' WHERE BA.IDOBS = OBA.IDOBS                         '+
          ' AND EXISTS (SELECT 1 FROM BASEDEPAGAMENTO B '+
          '              WHERE (B.IDBASEPGTO = BA.IDBASEPGTO ) '+
          '              AND   (B.MESCOBRANCA = '+QuotedStr(sUltMespreparo)+') '+
          '              AND   (B.IDTITULAR = '+inttostr(iidtitular)+') '+
          '              AND   (B.IDLOTE = '+inttostr(iidlote)+')))';

    qryExec.close;
    qryExec.SQL.Clear;
    qryExec.Sql.Add(ssql);
    try
      qryExec.ExecSql;
    except
      mmResult.Add('Erro ao eliminar OBS_PREVIA_BASEPGTO: '+
        'Inscrição '+sInscricao+' - '+sNome);
      exit;
    end;


    // Andre Imakawa - SIG 65680 - Fim

    // SOL 207789/16579 PPM 543916

    ssql:='DELETE FROM BASEDEPAGAMENTOAPOIO BA '+
          'WHERE EXISTS (SELECT 1 FROM BASEDEPAGAMENTO B '+
          '              WHERE (B.IDBASEPGTO = BA.IDBASEPGTO ) '+
          '              AND   (B.MESCOBRANCA = '+QuotedStr(sUltMespreparo)+') '+
          '              AND   (B.IDTITULAR = '+inttostr(iidtitular)+') '+
          '              AND   (B.IDLOTE = '+inttostr(iidlote)+') )';

    qryExec.close;
    qryExec.SQL.Clear;
    qryExec.Sql.Add(ssql);
    try
      qryExec.ExecSql;
    except
      mmResult.Add('Erro ao eliminar Base de Pagamento Apoio da Prévia: '+
        'Inscrição '+sInscricao+' - '+sNome);
      exit;
    end;

    // Andre Imakawa - SIG 99651 - Inicio
    ssql:='DELETE FROM BASEDEPAGAMENTOREINF BA '+
          'WHERE EXISTS (SELECT 1 FROM BASEDEPAGAMENTO B '+
          '              WHERE (B.IDBASEPGTO = BA.IDBASEPGTO ) '+
          '              AND   (B.MESCOBRANCA = '+QuotedStr(sUltMespreparo)+') '+
          '              AND   (B.IDTITULAR = '+inttostr(iidtitular)+') '+
          '              AND   (B.IDLOTE = '+inttostr(iidlote)+') )';

    qryExec.close;
    qryExec.SQL.Clear;
    qryExec.Sql.Add(ssql);
    try
      qryExec.ExecSql;
    except
      mmResult.Add('Erro ao eliminar Base de Pagamento Reinf da Prévia: '+
        'Inscrição '+sInscricao+' - '+sNome);
      exit;
    end;
    // Andre Imakawa - SIG 99651 - Fim


    ssql:='DELETE FROM BASEDEPAGAMENTO '+
          'WHERE (MESCOBRANCA = '+QuotedStr(sUltMespreparo)+') '+
          'AND   (IDTITULAR = '+inttostr(iidtitular)+') '+
          'AND   (IDLOTE = '+inttostr(iidlote)+')';

    qryExec.close;
    qryExec.SQL.Clear;
    qryExec.Sql.Add(ssql);
    try
      qryExec.ExecSql;
    except
      mmResult.Add('Erro ao eliminar Base de Pagamento da Prévia: '+
        'Inscrição '+sInscricao+' - '+sNome);
      exit;
    end;
    // SOL 207789/16579 PPM 543916

    //RECALCULAR PERCENTUAL DO GRUPO FAMILIAR
    if (prmFLGATUPERCGF = 1) and bPensao and not lbSoAbono then
    begin
      CtrlBenefBfciario := TCtrlBenefBfciario.Create;
      CtrlBenefBfciario.Initialize(
        DtmBaseDados.DbBaseDados, True, Sistema.ConnectionType,
        Sistema.ConnectionSide, Sistema.AppRemoteServer, True, Nil );

      for lii:=0 to lstProc_Ben.count-1 do
      begin
        try
          liproc:=strtoint(Piece(lstProc_Ben[lii],';',1));
          liben:=strtoint(Piece(lstProc_Ben[lii],';',2));

          if not CtrlBenefBfciario.AtualizaNumeroBeneficiarios(liproc, liben) then
          begin
            mmResult.Add(
              'Erro no recalculo dos percentuais da Pensão - Benefício : '+
              inttostr(liben)+' - '+inttostr(iidtitular));
          end;
        except
          mmResult.Add(
            'Erro no recalculo dos percentuais da Pensão - Benefício : '+
            inttostr(liben)+' - '+inttostr(iidtitular));
        end;
      end;

      FreeAndNil( CtrlBenefBfciario );
    end;

    qryBeneficios.Close;
    qryBeneficios.Free;

    Result := True;

    If Not bEstorno Then
      if dtmBaseDados.dbBaseDados.InTransaction then
      begin
        dtmBaseDados.dbBaseDados.commit;
      end;
  finally
    If Not bEstorno Then
      if dtmBaseDados.dbBaseDados.InTransaction then
      begin
        dtmBaseDados.dbBaseDados.Rollback;
      end;
  end;
end;

procedure DesfazerPreparo(qryBenef: twwquery;
                          qryAux1: twwquery;
                          qryAux2: twwquery;
                          qryAux3: twwquery;
                          iidlote: integer;
                          itipofolha: integer;
                          bfazerindividual: boolean;
                          sUltmespreparo: string;
                          sMesAbono: string;
                          lblMsg: tlabel;
                          mmResult: tmemo);
 var iMes, iAno : Integer;
     sSql,  sMesPreparoAnt, sMesPreparoAtual : string;
     nTotBenef : Integer;
     rValbenef : real;
     lCont : longint;
     retorno: integer;
     dtdatapagtoant: tdatetime;

  procedure AtualizaContador;
  begin
    inc(lCont);
    if lCont mod 100 = 0 then
      application.processmessages;
  end;

begin
  nTotBenef := 0;
  rValBenef := 0;

  //identificando mes de preparo para desfazer para o mes anterior.
  //APLICA A QUERY NA HSTBENEFBFCIARIO PARA TRATAR MOTIVO E MES
  ssql:=' SELECT DISTINCT MES '+
        ' FROM HSTBENEFBFCIARIO'+
        ' WHERE IDLOTE = '+inttostr(iidlote)+
        ' AND IDMOTIVO = '+inttostr(prmIdMotivoFolhaBen)+
        ' AND MES = MESREFERENCIA ';
  if FazQuery(qryAux1,ssql) then
  begin
    iMes:=StrToInt(Copy(qryAux1.fieldbyname('MES').asstring,6,2));
    iAno:=StrToInt(Copy(qryAux1.fieldbyname('MES').asstring,1,4));
  end
  else
  begin
    iMes:=StrToInt(Copy(sUltMespreparo,6,2));
    iAno:=StrToInt(Copy(sUltMespreparo,1,4));
  end;
  sMesPreparoAtual:=IntCod(iAno,4)+'/'+IntCod(iMes,2);
  sMesPreparoAnt:=SAnoMesAnterior(sMesPreparoAtual);

  //PEGA DATA CALENDÁRIO DO MÊS ANTERIOR
  dtdatapagtoant:=
    strtodate(AtualizaDataFolha(Copy(sMesPreparoAnt,6,2),
                                Copy(sMesPreparoAnt,1,4)));


  if bfazerindividual then
  begin
    if MsgDlg(' Esta opção irá DESFAZER o lote selecionado '#13#10+
              ' de Folha de Manutenção para as pessoas escolhidas.  '#13#10+
              ' Deverá ser executado novamente o Preparo deste mês.'#13#10+
              ' CONTINUA? ','Confirmação',mtConfirmation,[mbYes,mbNo,mbHelp],0) = mrNo then
      Exit;
  end
  else
  begin
    if MsgDlg(' Esta opção irá DESFAZER o lote selecionado '#13#10+
              ' de Folha de Manutenção para as TODAS pessoas  '#13#10+
              ' que estejam nas condições estabelecidas no desfazer preparo. '#13#10+
              ' Deverá ser executado novamente o Preparo deste mês .'#13#10+
              ' CONTINUA? ','Confirmação',mtConfirmation,[mbYes,mbNo,mbHelp],0) = mrNo then
      Exit;
  end;

  frmMotivoDesFazPreparo := TfrmMotivoDesFazPreparo.Create(Application);

  frmMotivoDesFazPreparo.mmMotivo.Text := '';

  If bfazerindividual then
  begin
    frmMotivoDesFazPreparo.pnlpatrocinadora.enabled := false;
    frmMotivoDesFazPreparo.pnlPlano.enabled         := false;
    frmMotivoDesFazPreparo.pnlBeneficio.enabled     := false;
    frmMotivoDesFazPreparo.chklstpatro.enabled      := false;
    frmMotivoDesFazPreparo.chklstplano.enabled      := false;
    frmMotivoDesFazPreparo.chklstBenef.enabled      := false;
  end
  else
  begin
    frmMotivoDesFazPreparo.pnlpatrocinadora.enabled := true;
    frmMotivoDesFazPreparo.pnlPlano.enabled         := true;
    frmMotivoDesFazPreparo.pnlBeneficio.enabled     := true;
    frmMotivoDesFazPreparo.chklstpatro.enabled      := true;
    frmMotivoDesFazPreparo.chklstplano.enabled      := true;
    frmMotivoDesFazPreparo.chklstBenef.enabled      := true;
  end;

  frmMotivoDesFazPreparo.iFundacao := iIdFundacao;
  retorno:=frmMotivoDesFazPreparo.ShowModal;
  if retorno = mrOk then
  begin
    If (Trim(frmMotivoDesFazPreparo.mmMotivo.Text) <> '') then
    begin
      dtmBaseDados.dbBaseDados.StartTransaction;

      if not Sistema.GravaLogOperacoes('Desfazer preparo.') then
        Raise Exception.Create('Não foi possível gravar o log.')
      else
      begin
        dtmBaseDados.dbBaseDados.Commit;
      end;
      //TRATAR BENEFÍCIO RETIDO
      if frmmotivodesfazpreparo.cboxRetido.checked then
      begin
        ssql:='SELECT DISTINCT H.IDTITULAR, PP.INSCRICAONUMERO, '+
                     'P.NOME AS BENEFICIARIO '+
              'FROM HSTBENEFBFCIARIO H, PARTPREVPLAN PP, PESSOA P '+
              'WHERE (H.IDLOTE IS NULL) '+
              //TRATA FORA DE CONVÊNIO
              'AND (H.FLGENVIADO IN (8, 9)) '+_clinefeed+
              'AND (H.MES = '+QuotedStr(sUltMespreparo)+') ';

	if itipofolha = 0 then
          ssql:=ssql+
              'AND (H.MESREFERENCIA = '+QuotedStr(sUltMespreparo)+') '
        else
          ssql:=ssql+
              'AND (H.MESREFERENCIA = '+QuotedStr(sMesAbono)+') ';
        ssql:=ssql+
              'AND (PP.IDPESSOA = H.IDTITULAR) '+
              'AND ( (H.IDPLANOPREV = PP.IDPLANOPREV AND H.IDPESSOA = H.IDTITULAR) '+
                   'OR (H.IDPLANOORIGEM = PP.IDPLANOPREV AND H.IDPESSOA <> H.IDTITULAR) ) '+
              'AND (PP.IDPESSJUR = H.IDPESSJUR) '+
              'AND (P.IDPESSOA = H.IDTITULAR) ';

        if not frmmotivodesfazpreparo.cbxTodos.checked then
        begin
          if frmMotivoDesFazPreparo.sPlanoSel <> '' then
            ssql:=ssql+'AND (H.IDPLANOPREV IN ('+frmMotivoDesFazPreparo.sPlanoSel+')) ';
          if frmMotivoDesFazPreparo.sBenefSel <> '' then
            ssql:=ssql+'AND (H.IDBENEFICIO IN ('+frmMotivoDesFazPreparo.sBenefSel+')) ';
          if frmMotivoDesFazPreparo.sPatroSel <> '' then
            ssql:=ssql+'AND (H.IDPESSJUR IN ('+frmMotivoDesFazPreparo.sPatroSel+')) ';
        end;
        ssql:=ssql+'ORDER BY PP.INSCRICAONUMERO';
        qryAux3.Close;
        qryAux3.SQL.clear;
        qryAux3.sql.add(ssql);
        try
          qryAux3.Open;
        except
        end;

        Modulo.GravaLogTOTALPREV('Desfazer preparo de retido. '+
          ' Motivo : '+Copy(Trim(frmMotivoDesFazPreparo.mmMotivo.Text),1,40));
        mmResult.Lines.Add('==================================================');
        mmResult.Lines.Add('');
        mmResult.Lines.Add('Desfazer Preparo de retidos.');

        lCont:=0;
        if not qryAux3.eof then
        begin
          while not qryAux3.eof do
          begin
            if not dtmBaseDados.dbBaseDados.InTransaction then
            begin
              dtmBaseDados.dbBaseDados.StartTransaction;
            end;
            try
              mmResult.Lines.Add('Desfazendo Preparo de retido: '+
                'Inscrição '+qryAux3.FieldByName('INSCRICAONUMERO').asstring+
                ' - '+qryAux3.FieldByName('BENEFICIARIO').asstring);
              lblMsg.Caption:='Desfazendo Preparo de retido: '+
                'Inscrição '+qryAux3.FieldByName('INSCRICAONUMERO').asstring+
                ' - '+qryAux3.FieldByName('BENEFICIARIO').asstring;
              lblMsg.Update;

              DesfazerPreparoIndividual(qryAux1,
                                        qryAux2,
                                        qryAux3.FieldByName('IDTITULAR').AsInteger,
                                        iidlote,
                                        true,
                                        sUltMespreparo,
                                        sMespreparoAnt,
                                        sMesAbono,
                                        qryAux3.FieldByName('INSCRICAONUMERO').asstring,
                                        qryAux3.FieldByName('BENEFICIARIO').asstring,
                                        dtdatapagtoant,
                                        mmResult.Lines);
              Atualizacontador;
            finally
              if dtmBaseDados.dbBaseDados.InTransaction then
              begin
                dtmBaseDados.dbBaseDados.Rollback;
              end;
            end;
            qryAux3.Next;
          end;

          if dtmBaseDados.dbBaseDados.InTransaction then
          begin
            dtmBaseDados.dbBaseDados.commit;
          end;

          mmResult.Lines.Add('');
          mmResult.Lines.Add('Desfeito Preparo de retido.');
          mmResult.Lines.Add('');
          mmResult.Lines.Add('==================================================');
          mmResult.Lines.Add('');
        end;
      end;

      lblMsg.Caption := 'Desfazendo Preparo/Prévia de benefícios e contribuições.';
      lblMsg.Update;
      if bfazerindividual then
      begin
        Modulo.GravaLogTOTALPREV('Desfazer preparo individual'+
          ' - Matr.Tit.: '+qryBenef.FieldByName('MATRICULA').asstring+
          ' - Inscrição: '+qryBenef.FieldByName('INSCRICAONUMERO').asstring+
          ' - Matr.Dep.: '+qryBenef.FieldByName('MATRICULADEP').asstring+
          ' - Nome: '+qryBenef.FieldByName('NOMEDEP').asstring+
          ' Motivo : '+Copy(Trim(frmMotivoDesFazPreparo.mmMotivo.Text),1,30));
        frmMotivodesFazPreparo.Free;
        mmResult.Lines.Add('==================================================');
        mmResult.Lines.Add('');
        mmResult.Lines.Add('Desfazer Preparo/Prévia Individual do lote '+ inttostr(iidlote));
        qryBenef.First;
        while not qryBenef.Eof do
        begin
          if not dtmBaseDados.dbBaseDados.InTransaction then
          begin
            dtmBaseDados.dbBaseDados.StartTransaction;
          end;
          try
            mmResult.Lines.Add('Desfazendo Preparo/Prévia: '+
              ' - Matr.Tit.: '+qryBenef.FieldByName('MATRICULA').asstring+
              ' - Inscrição: '+qryBenef.FieldByName('INSCRICAONUMERO').asstring+
              ' - Matr.Dep.: '+qryBenef.FieldByName('MATRICULADEP').asstring+
              ' - Nome: '+qryBenef.FieldByName('NOMEDEP').asstring);
            lblMsg.Caption:='Desfazendo Preparo/Prévia: '+
              ' Matr.Dep.: '+qryBenef.FieldByName('MATRICULADEP').asstring+
              ' - Nome: '+qryBenef.FieldByName('NOMEDEP').asstring;
            lblMsg.Update;

            DesfazerPreparoIndividual(qryAux1,
                                      qryAux2,
                                      qryBenef.FieldByName('IDTITULAR').AsInteger,
                                      iidlote,
                                      false,
                                      sUltMespreparo,
                                      sMespreparoAnt,
                                      sMesAbono,
                                      qryBenef.FieldByName('INSCRICAONUMERO').asstring,
                                      qryBenef.FieldByName('NOMEDEP').asstring,
                                      dtdatapagtoant,
                                      mmResult.Lines);
            Atualizacontador;

          finally
             if dtmBaseDados.dbBaseDados.InTransaction then
             begin
               dtmBaseDados.dbBaseDados.Rollback;
             end;
          end;

          qryBenef.Next;
        end;
        mmResult.Lines.Add('');
        mmResult.Lines.Add('==================================================');
      end
      else
      begin  // desfaz todo o lote
        ssql:='SELECT DISTINCT H.IDTITULAR, PP.INSCRICAONUMERO, '+
                     'P.NOME AS BENEFICIARIO '+
              'FROM HSTBENEFBFCIARIO H, PARTPREVPLAN PP, PESSOA P '+
              'WHERE (H.IDLOTE = '+inttostr(iidlote)+') '+
              'AND (PP.IDPESSOA = H.IDTITULAR) '+
              'AND ( (H.IDPLANOPREV = PP.IDPLANOPREV AND H.IDPESSOA = H.IDTITULAR) '+
                   'OR (H.IDPLANOORIGEM = PP.IDPLANOPREV AND H.IDPESSOA <> H.IDTITULAR) ) '+
              'AND (PP.IDPESSJUR = H.IDPESSJUR) '+
              'AND (P.IDPESSOA = H.IDTITULAR) ';

        if not frmmotivodesfazpreparo.cbxTodos.checked then
        begin
          if frmMotivoDesFazPreparo.sPlanoSel <> '' then
            ssql:=ssql+'AND (H.IDPLANOPREV IN ('+frmMotivoDesFazPreparo.sPlanoSel+')) ';
          if frmMotivoDesFazPreparo.sBenefSel <> '' then
            ssql:=ssql+'AND (H.IDBENEFICIO IN ('+frmMotivoDesFazPreparo.sBenefSel+')) ';
          if frmMotivoDesFazPreparo.sPatroSel <> '' then
            ssql:=ssql+'AND (H.IDPESSJUR IN ('+frmMotivoDesFazPreparo.sPatroSel+')) ';
        end;
        ssql:=ssql+'ORDER BY PP.INSCRICAONUMERO';
        qryAux3.Close;
        qryAux3.SQL.clear;
        qryAux3.sql.add(ssql);
        try
          qryAux3.Open;
        except
        end;

        Modulo.GravaLogTOTALPREV('Desfazer preparo completo - Lote: '+
          inttostr(iidlote)+ ' Motivo : '+Copy(Trim(frmMotivoDesFazPreparo.mmMotivo.Text),1,40));
        mmResult.Lines.Add('==================================================');
        mmResult.Lines.Add('');
        mmResult.Lines.Add('Desfazer Preparo/Prévia Individual do lote '+ inttostr(iidlote));
        frmMotivodesFazPreparo.Free;

        lCont:=0;
        if not qryAux3.eof then
        begin
          while not qryAux3.eof do
          begin
            if not dtmBaseDados.dbBaseDados.InTransaction then
            begin
              dtmBaseDados.dbBaseDados.StartTransaction;
            end;
            try
              mmResult.Lines.Add('Desfazendo Preparo/Prévia: '+
                'Inscrição '+qryAux3.FieldByName('INSCRICAONUMERO').asstring+
                ' - '+qryAux3.FieldByName('BENEFICIARIO').asstring);
              lblMsg.Caption:='Desfazendo Preparo/Prévia: '+
                'Inscrição '+qryAux3.FieldByName('INSCRICAONUMERO').asstring+
                ' - '+qryAux3.FieldByName('BENEFICIARIO').asstring;
              lblMsg.Update;

              DesfazerPreparoIndividual(qryAux1,
                                        qryAux2,
                                        qryAux3.FieldByName('IDTITULAR').AsInteger,
                                        iidlote,
                                        false,
                                        sUltMespreparo,
                                        sMespreparoAnt,
                                        sMesAbono,
                                        qryAux3.FieldByName('INSCRICAONUMERO').asstring,
                                        qryAux3.FieldByName('BENEFICIARIO').asstring,
                                        dtdatapagtoant,
                                        mmResult.Lines);
              Atualizacontador;
            finally
              if dtmBaseDados.dbBaseDados.InTransaction then
              begin
                dtmBaseDados.dbBaseDados.Rollback;
              end;
            end;
            qryAux3.Next;
          end;

          if dtmBaseDados.dbBaseDados.InTransaction then
          begin
            dtmBaseDados.dbBaseDados.commit;
          end;
          mmResult.Lines.Add('');
          mmResult.Lines.Add('Desfeito Preparo do lote '+ inttostr(iidlote));
          mmResult.Lines.Add('');
          mmResult.Lines.Add('==================================================');

          //ATUALIZANDO VALOR TOTAL E QUANTIDADE DE REGS. NO LOTE
          if not dtmBaseDados.dbBaseDados.InTransaction then
          begin
            dtmBaseDados.dbBaseDados.StartTransaction;
          end;
          ssql:='SELECT SUM(VALORPREV), COUNT(*) '+
                'FROM HSTBENEFBFCIARIO '+
                'WHERE IDLOTE = '+inttostr(iidlote);

          if FazQuery(qryAux1,ssql) then
          begin
            rValbenef:=qryAux1.fields[0].asfloat;
            nTotBenef:=qryAux1.fields[1].asinteger;
          end
          else
          begin
            nTotBenef:=0;
            rValBenef:=0;
          end;
          ssql:='UPDATE CTRLINTERFACE SET NUMREG = '+IntToStr(nTotBenef)+ ' , '+
                       'VLRTOTAL = ' + Oranumero(FloatToStr(rValbenef))+' '+
               ' WHERE (IDLOTE = '+inttostr(iidlote)+') ';
          qryAux1.close;
          qryAux1.SQL.Clear;
          qryAux1.Sql.Add(ssql);
          try
            qryAux1.ExecSql;
          except
            mmResult.Lines.Add('Erro ao Atualizar quantidade e total de Benefícios do Lote'+inttostr(iidlote));
            if dtmBaseDados.dbBaseDados.InTransaction then
            begin
              dtmBaseDados.dbBaseDados.rollback;
            end;
          end;
          if dtmBaseDados.dbBaseDados.InTransaction then
          begin
            dtmBaseDados.dbBaseDados.commit;
          end;
        end
        else
          MsgDlg('Não existe benefício a ser desfeito no lote selecionado.',
            'Erro',mtError,[mbOk,mbHelp],0);
      end;
    end
    else
      MsgDlg('O Preenchimento do Motivo para Desfazer o Preparo é obrigatório.',
        'Erro',mtError,[mbOk,mbHelp],0);
  end;
end;


procedure DeleteAtualizaBitri(_idpessoa,_idlote,_mesrefe,_mescobr,_mesprocAnt:string;_saldo:double);//SOL205224 douglas.siqueira
var

  query,query2:TwwQuery;
  SALDO,valor_hstbit:DOUBLE;
  SP1:TwwStoredProc;
begin

  try
    SALDO:=0;
    valor_hstbit:=0;
    query := TwwQuery.Create(Application);
    query.DataBaseName := 'BaseDados';

    query2 := TwwQuery.Create(Application);
    query2.DataBaseName := 'BaseDados';

    query.CLOSE;
    query.SQL.CLEAR;
    query.SQL.Add('DELETE HSTBITRIBUTACAO ');
    query.SQL.Add('WHERE OPERACAO=''S''');
    query.SQL.Add('AND IDPESSOA = '+_idpessoa);
    query.SQL.Add('AND IDLOTE  = '+_idlote);
//    CMDebugToFile('uDesfazerPreparo DELETE HSTBITRIBUTACAO no metodo DeleteAtualizaBitri','C:\Planus\Temp\Travamento.txt') ;
    if not (dtmBaseDados.dbBaseDados.InTransaction) then
    begin
      dtmBaseDados.dbBaseDados.StartTransaction;
//      CMDebugToFile('uDesfazerPreparo StartTransaction no metodo DeleteAtualizaBitri','C:\Planus\Temp\Travamento.txt') ;
    end;

    try
       query.ExecSql;

    except

    end;



    query.Close;
    query.SQL.Clear;
    query.SQL.Add('DELETE ');
    query.SQL.Add('  FROM HSTDEDIDADEBITRIB');
    query.SQL.Add(' WHERE IDPESSOA = '+_idpessoa);
    query.SQL.Add('   AND IDLOTE ='+_idlote);
    //CMDebugToFile('uDesfazerPreparo DELETE HSTBITRIBUTACAO no metodo DeleteAtualizaBitri','C:\Planus\Temp\Travamento.txt') ;
    if not (dtmBaseDados.dbBaseDados.InTransaction) then
    begin
      dtmBaseDados.dbBaseDados.StartTransaction;
    end;

    try
       query.ExecSql;

    except

    end;
    dtmBaseDados.dbBaseDados.Commit;

    SP1 := TwwStoredProc.Create(Application);
    SP1.DataBaseName := 'BaseDados';
    SP1.StoredProcName:='CM.SP_FB_ATUALIZAHSTBI';
    SP1.Params.CreateParam(ftFloat,    'VIDPESSOA',           ptInput);
    SP1.ParamByName('VIDPESSOA').asfloat := strtofloat(_idpessoa);

    if not (dtmBaseDados.dbBaseDados.InTransaction) then
    begin
      dtmBaseDados.dbBaseDados.StartTransaction;
    end;

    try
      //.Prepare;

     // SP1.ExecProc;

    except


    end;
    dtmBaseDados.dbBaseDados.Commit;

    SP1.close;
    SP1.Destroy;



    query.CLOSE;
    query.SQL.CLEAR;
    query.SQL.Add('SELECT MAX(MESCOBRANCA)MESCOBRANCA FROM HSTBITRIBUTACAO');
    query.SQL.Add('WHERE  IDPESSOA = '+_idpessoa);
    query.Open;

    query2.CLOSE;
    query2.SQL.CLEAR;
    query2.SQL.ADD('UPDATE BITRIBUTACAO');
    query2.SQL.ADD('SET');
    query2.SQL.ADD(' ULTMESPROC = '+#39+query.FieldByName('MESCOBRANCA').Text+#39);
    query2.SQL.ADD('WHERE');
    query2.SQL.ADD('  IDPESSOA = '+#39+_idpessoa+#39);

    if not (dtmBaseDados.dbBaseDados.InTransaction) then
    begin
      dtmBaseDados.dbBaseDados.StartTransaction;
    end;


    try
     query2.ExecSQL;
    except
    end;
    dtmBaseDados.dbBaseDados.Commit;


  finally

     if dtmBaseDados.dbBaseDados.InTransaction then
     begin
        dtmBaseDados.dbBaseDados.Commit;
     end;

     query.close;
     query.destroy;


     query2.close;
     query2.destroy;
  end;

end;

end.
{------------------------------------------------------------------------------|
| UNIT: UDESFAZERPREPARO                                                       |
| DESCRIÇÃO FUNCIONAL:                                                         |
|   IMPLEMENTA A ROTINA DE DESFAZER PREPARO DE BENEFÍCIOS EM MANUTENÇÃO.       |
|                                                                              |
|------------------------------------------------------------------------------|
| DESENVOLVEDOR: BRUNO BASTOS                                                  |
| PERÍODO DE IMPLEMENTAÇÃO: DE 23/08/2005 A 23/08/2005                         |
| VERSÃO PARA LIBERAÇÃO: 3.05.05j                                              |
| CLIENTE: CBS                                                                 |
| PENDÊNCIA: 19724                                                             |
| DESCRIÇÃO: Alteração para gravar o último mês de reajuste anterior.          |
|------------------------------------------------------------------------------|
| DESENVOLVEDOR: BRUNO BASTOS                                                  |
| PERÍODO DE IMPLEMENTAÇÃO: DE 07/06/2005 A 07/06/2005                         |
| VERSÃO PARA LIBERAÇÃO: 3.05.04l                                              |
| CLIENTE: CBS                                                                 |
| PENDÊNCIA: 19230                                                             |
| DESCRIÇÃO: Foi alterado para testar antes de executar o commit, se é um es_  |
|            que está sendo processado ou não. Para isso foi criado um parâme_ |
|            tro para indicar se é ou não.                                     |
|------------------------------------------------------------------------------|
| DESENVOLVEDOR: PAULO RAMOS                                                   |
| PERÍODO DE IMPLEMENTAÇÃO: DE 03/02/2003 A 05/02/2003                         |
| VERSÃO PARA LIBERAÇÃO: 3.03.03                                               |
| CLIENTE:                                                                     |
| DESCRIÇÃO DA IMPLEMENTAÇÃO:                                                  |
| PENDÊNCIA 10557 DESFAZER CORRETAMENTE OS VALORES DO BENEFÍCIO SE OCORREU     |
| REAJUSTE DE BENEFÍCIO NO MÊS DO PREPARO.                                     |
|                                                                              |
|------------------------------------------------------------------------------|
| DESENVOLVEDOR: PAULO RAMOS                                                   |
| PERÍODO DE IMPLEMENTAÇÃO: DE 04/02/2003 A 04/02/2003                         |
| VERSÃO PARA LIBERAÇÃO:                                                       |
| CLIENTE:                                                                     |
| DESCRIÇÃO DA IMPLEMENTAÇÃO:                                                  |
| Pendencia 8104 - no desfazer preparo retorna corretamento o ultmesreajuste.  |
|                                                                              |
|------------------------------------------------------------------------------|
| DESENVOLVEDOR: PAULO RAMOS                                                   |
| PERÍODO DE IMPLEMENTAÇÃO: DE 05/02/2003 A 05/02/2003                         |
| VERSÃO PARA LIBERAÇÃO:                                                       |
| CLIENTE:                                                                     |
| DESCRIÇÃO DA IMPLEMENTAÇÃO:                                                  |
| Pendencia 11163 - no desfazer retorna processo para ativo se existir algum   |
| beneficio ativo ou retido.                                                   |
|                                                                              |
|------------------------------------------------------------------------------|
| DESENVOLVEDOR: PAULO RAMOS                                                   |
| PERÍODO DE IMPLEMENTAÇÃO: DE 06/02/2003 A 06/02/2003                         |
| VERSÃO PARA LIBERAÇÃO: 3.03.03a                                              |
| CLIENTE:                                                                     |
| DESCRIÇÃO DA IMPLEMENTAÇÃO:                                                  |
| pendencia 10083 - desfazer preparo de retido                                 |
|                                                                              |
|------------------------------------------------------------------------------|
| DESENVOLVEDOR: PAULO RAMOS                                                   |
| PERÍODO DE IMPLEMENTAÇÃO: DE 12/02/2003 A 12/02/2003                         |
| VERSÃO PARA LIBERAÇÃO: 3.03.03d                                              |
| CLIENTE:                                                                     |
| DESCRIÇÃO DA IMPLEMENTAÇÃO:                                                  |
| PENDENCIA 11162 - DESATIVAR O PROCESSO DE BENEFICIO SE NÃO EXISTIR MAIS      |
| BENEFÍCIOS ATIVOS, AO SE FAZER UM ENCERRAMENTO AUTOMÁTICO.                   |
|                                                                              |
|------------------------------------------------------------------------------|
| DESENVOLVEDOR: PAULO RAMOS                                                   |
| PERÍODO DE IMPLEMENTAÇÃO: DE 31/03/2003 A 01/04/2003                         |
| PENDÊNCIA: 13595                                                             |
| VERSÃO PARA LIBERAÇÃO: 3.03.04                                               |
| CLIENTE: CBS                                                                 |
| DESCRIÇÃO DA IMPLEMENTAÇÃO:                                                  |
| NO DESFAZER PREPARO DE LOTE NORMAL NÃO ELIMINOU O PAGAMENTO DO ABONO ANUAL.  |
|                                                                              |
|------------------------------------------------------------------------------|
| DESENVOLVEDOR: PAULO RAMOS                                                   |
| PERÍODO DE IMPLEMENTAÇÃO: DE 02/04/2003 A 03/04/2003                         |
| PENDÊNCIA: 13681                                                             |
| VERSÃO PARA LIBERAÇÃO: 3.03.04A                                              |
| CLIENTE: (CBS)                                                               |
| DESCRIÇÃO DA IMPLEMENTAÇÃO:                                                  |
| NO ENCERRAMENTO DE BENEFICIARIO NÃO RETORNOU O VALOR ATUAL CORRETAMENTE PARA |
| OS BENEFICIARIOS QUE PERMANECERAM COM BENEFICIO ATIVO.                       |
|                                                                              |
|------------------------------------------------------------------------------|
| DESENVOLVEDOR: PAULO RAMOS                                                   |
| PERÍODO DE IMPLEMENTAÇÃO: DE 16/06/2003 A 16/06/2003                         |
| VERSÃO PARA LIBERAÇÃO: 3.03.06B                                              |
| CLIENTE:                                                                     |
| DESCRIÇÃO DA IMPLEMENTAÇÃO:                                                  |
| - MESMO CANCELANDO A OPÇÃO DE DESFAZER PREPARO NA TELA DE MOTIVO, O SISTEMA  |
| CONTINUAVA O PROCESSO DE DESFAZER.                                           |
|                                                                              |
|------------------------------------------------------------------------------|
| DESENVOLVEDOR: PAULO RAMOS                                                   |
| PERÍODO DE IMPLEMENTAÇÃO: DE 13/08/2003 A 19/08/2003                         |
| PENDÊNCIA: 14852                                                             |
| VERSÃO PARA LIBERAÇÃO:                                                       |
| CLIENTE: FUNCEF                                                              |
| DESCRIÇÃO DA IMPLEMENTAÇÃO:                                                  |
| - DESFAZER CONTRIBUIÇÃO DE NÚCLEO FAMILIAR.                                  |
|                                                                              |
|------------------------------------------------------------------------------}

