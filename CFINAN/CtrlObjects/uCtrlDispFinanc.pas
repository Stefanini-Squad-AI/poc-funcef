unit uCtrlDispFinanc;

// --------------------------------------------------------------------------------------------------
//Data      : 06/10/2009
//Autor     : Marilza Colpani
//SOL       : 122335
//Kintana   : 598524
//Descrição : Implementação de um filtro para os planos ativos, inativos e ambos.
// --------------------------------------------------------------------------------------------------
//Data      : 27/11/2008
//Autor     : Bruno Bastos
//Pendência : Kintana: 451499
//SOL       : 101670
//Descrição : Alterar o vencimento do DARF de Imposto de Renda para o último dia
//            útil do segundo decêndio. Alterei também a pedido do Gustavo
//            a busca do dia útil que agora é feita para os dias anteriores
//            e não mais para dias posteriores.
// --------------------------------------------------------------------------------------------------
//Data      : 06/09/2007
//Autor     : Fabio Fagundes
//Código    : AL_19
//Pendência : 26308
//SOL       : 68503
//Descrição : Retirada do itens 1.9.2 e 4.2 de registros de INSS (GPS) que deverão vir do item 2.4 quando é
//            gerado o documento de GPS pois estava duplicando lançamentos
// --------------------------------------------------------------------------------------------------
//Data      : 11/07/2007
//Autor     : Fabio Fagundes
//Código    : AL_18
//Pendência : 25839
//SOL       : 64125
//Descrição : Alteração dos Itens 1.9.1 e 4.1 com inclusão de critica VLRINSS <> 0
//            para não trazer se estiver baixado
// --------------------------------------------------------------------------------------------------
//Data      : 18/06/2007
//Autor     : Fabio Fagundes
//Código    : AL_17
//Pendência : 25632
//SOL       :
//Descrição : Acerto no item 2.7 da ListDisponibilidade, que deve trazer somente os documentos com
//(Status <> 2)  pois quando são englobados, geram um novo documento que deverá vir por outros itens;
//            Acerto no item 2.5 para trazer os documentos que serão englobados Operacao=1 antes de
//            englobá-los
// --------------------------------------------------------------------------------------------------
//Data      : 29/06/2007
//Autor     : Fabio Fagundes
//Código    : AL_16
//Pendência : 25733
//SOL       :
//Descrição : Alteração do Item 1.9.1, 1.9.2, 4.1 e 4.2 para adaptar os registros de INSS com legislação
//            vigente a partir Jan/2007 e a partir de 01/02/2007 o INSS passa a ser recolhido no dia 10
//            ou próximo dia útil subsequente
// --------------------------------------------------------------------------------------------------
//Data      : 30/05/2007
//Autor     : Fabio Fagundes
//Código    : AL_15
//Pendência : 25450
//SOL       :
//Descrição : Retirada das descrições "Plano"  quando filtrado por Patrocinadora e "Patrocinadora"
//             quando filtrado por Plano;
// --------------------------------------------------------------------------------------------------
//Data      : 13/04/2007
//Autor     : Fabio Fagundes
//Código    : AL_14
//Pendência : 24039
//SOL       :
//Descrição : Acerto na ordenação
// --------------------------------------------------------------------------------------------------
//Data      : 08/03/2007
//Autor     : Fabio Fagundes
//Código    : AL_13
//Pendência : 24113
//SOL       :
//Descrição : Alteração do item 2.8 para trazer os registro de IRRF de documentos baixados e não baixados
//            que não estajam em DARF gerado.
// --------------------------------------------------------------------------------------------------
//Data      : 08/03/2007
//Autor     : Fabio Fagundes
//Código    : AL_12
//Pendência : 24672
//SOL       :
//Descrição : Alteração do item 2.4, 2.5, 2.6 e 2.7 para não trazer documentos que não estão baixado
//            mas que estão com o Lote Gerado
// --------------------------------------------------------------------------------------------------
//Data      : 07/03/2007
//Autor     : Fabio Fagundes
//Código    : AL_11
//Pendência : 24039
//SOL       :
//Descrição : Acerto no ordenamento conforme Grupamento
// --------------------------------------------------------------------------------------------------
//Data      : 30/01/2007
//Autor     : Fabio Fagundes
//Código    : AL_10
//Pendência : 24296
//SOL       : 49782
//Descrição : Acerto na montagem do periodo inicial do item 1.3 que estava trazendo registro na data
//            inicial de Disponibilidade
// --------------------------------------------------------------------------------------------------
//Data      : 07/12/2006
//Autor     : Fabio Fagundes
//Código    : AL_10
//Pendência : 24228
//SOL       :
//Descrição : Em complemento à retirada dos registros estornados, deve ser retirado a crítica que não
//            trazia os lancamentos Não Identificados (RELACIONANI WHERE FLGNI = 'I') dos itens 2.1 e 2.3
// --------------------------------------------------------------------------------------------------
//Data      : 07/12/2006
//Autor     : Fabio Fagundes
//Código    : AL_9
//Pendência : 23953
//SOL       :
//Descrição : Passa a trazer os registros estornados
// --------------------------------------------------------------------------------------------------
//Data      : 13/11/2006
//Autor     : Fabio Fagundes
//Código    : AL_8
//Pendência : 21867
//SOL       :
//Descrição : Implemetação para trazer somente documentos baixados
//--------------------------------------------------------------------------------------------------
//Data      : 13/11/2006
//Autor     : Fabio Fagundes
//Código    : AL_7
//Pendência : 21865
//SOL       :
//Descrição : Implemetação de Grupamento por Plano e Patro e Tipo de Receb/Desemb Operacional
//            Pasagem para 3 camadas
// --------------------------------------------------------------------------------------------------
//Data      : 16/02/2006
//Autor     : Fabio Fagundes
//Código    : AL_7
//Pendência : 22782
//SOL       : 44601
//Descrição : Melhorias na Consulta dos Documentos que compõem o Lote Baixado
// --------------------------------------------------------------------------------------------------
//Data      : 16/02/2006
//Autor     : Fabio Fagundes
//Código    : AL_6
//Pendência :
//SOL       :
//Descrição : Implementação da Consulta dos Documentos que compõem o Lote Baixado
// --------------------------------------------------------------------------------------------------
//Data      : 16/02/2006
//Autor     : Fabio Fagundes
//Código    : AL_5
//Pendência : 20925
//SOL       : 31782
//Descrição : Geração de Relatório Analico Geral
// --------------------------------------------------------------------------------------------------
//Data      : 16/02/2006
//Autor     : Fabio Fagundes
//Código    : AL_4
//Descrição : Melhorias para resolver divergência de 0,01 centavo
//            Passa a ler os registros baixados do CFinan e não mais do CAP/CAR
//----------------------------------------------------------------------------------------------------
//Data      : 10/02/2006
//Autor     : Fabio Fagundes
//Código    : AL_3
//Descrição : Passagem de Parametro de Data Inicial e Final na ListDispSintética e ListDispAnalitica
//----------------------------------------------------------------------------------------------------
//Data      : 02/01/2006
//Autor     : Fabio Fagundes
//Pendência : 21138
//SOL       : 31028
//Código    : AL_2
//Descrição : Implementação de Período na Disponibilidade Sintética
//
//----------------------------------------------------------------------------------------------------
//Data      : 18/08/2004
//Autor     : Fabio Fagundes
//Código    : AL_1
//Descrição : Implementação de funções
//----------------------------------------------------------------------------------------------------

interface

uses sysutils, uCmControlObject, uCmDbObject, DB, uDataBase, DbClient, uCMClientDataSet,
     uCtrlParamFinanc, uDiasUteis, UCtrlPadroes, uDbMovimFinanc, UCmSqlParams,
     uCMFileUtils, uCMTypes, Controls, Classes;

type
   TCtrlDisponFinanc = Class(TCmControlObject)

   private

      F_rIDPessoa       : Double;
      F_rIDModulo       : Double;
      F_rIDUsuario      : Double;
      F_bUsaPlanoPatro  : Boolean;
      FcdsLancamento    : TCMClientDataSet;
      FDbMovimFinanc    : TDbMovimFinanc;
      _sql              : TCmSqlParams;
      //AL_1
      CtrlParamFinanc   : TCtrlParamFinanc;
      FCdsParamFinanc   : TCMClientDataSet;
      DiasUteis         : TDiasUteis;
      //AL_8
      FSqlRetorno    : String;
      FFlgDocBaixado : String;

      procedure SetCdsParamFinanc(const Value: TCMClientDataSet);


   public

      property cdsLancamento: TCMClientDataSet read FcdsLancamento write FcdsLancamento;
      property IDPessoa: Double read F_rIDPessoa write F_rIDPessoa ;
      property IDModulo: Double read F_rIDModulo write F_rIDModulo;
      property IDUsuario: Double read F_rIDUsuario write F_rIDUsuario;
      property UsaPlanoPatro: Boolean read F_bUsaPlanoPatro write F_bUsaPlanoPatro;
      //AL_8
      property SqlRetorno : String read FSqlRetorno write FSqlRetorno;
      property FlgDocBaixado : String read FFlgDocBaixado write FFlgDocBaixado;

      //AL_1
      property CdsParamFinanc : TCMClientDataSet read FCdsParamFinanc write SetCdsParamFinanc;

      constructor Create(rIDPessoa,rIDModulo,rIDUsuario: Double; bUsaPlanoPatro: Boolean); reintroduce;
      destructor Destroy; override;

      procedure OnCreateAppServer; override;

      function EncerraDisponibilidade(dDataRef: TDateTime): Boolean;
      function AplicaMarcacoesDisp: Boolean;
      function ListLancamentos(rIDPessoa: Double; dDataRef: TDateTime): OleVariant;
      function ListConsLancamentos(rIDPessoa, rIDPatro, rIDPlanoPrev: Double;
                                   dDataRef: TDateTime): OleVariant;
      function ListRelatDisp(rIDPessoa, rIDPatro, rIDPlanoPrev: Double;
                             dDataRef: TDateTime): OleVariant;
      function ListDispDivergentes(rIDPessoa: Double; sMesAno: String): OleVariant;


      function TestaDispFinanc(iIdPessoa,iIdUsuario : Integer;
                               dDataOper : TDateTime): Boolean;

      function IncluiDispFinanc(iIdPessoa, iIdUsuario,
                                iIdModuloOrig, iIdPlano,iIdPatro,
                                iCodDocumento,iCodLancFinanc: Integer;
                                fVlrDisp : Double;
                                dDataDisp : TDateTime;
                                sHistorico : String;
                                bIncluiDisp : boolean) : Boolean;

      function AlteraDispFinanc(iIdModulo, iCodDocumento,
                                iCodLancFinanc : Integer) : Boolean;


      function FlgIntegraDispFin:boolean;

      function SelecionaDispFinanc(dDataRef : TDateTime): OleVariant;
      //AL_1
      function ListDispSintetica (dDataIni, dDataFim : TDateTime;
                                  iPessoa, iUsuario : Integer): OleVariant;
      //AL_1
      function ListDispAnalitica(iPessoa, iPatro, iPlanoPrev, iUsuario : Integer;
                                 dDataIni, dDataFim : TDateTime): OleVariant;
      //AL_1
      function IIF(BooleanExpr: Boolean; IfTrue, IfFalse: Integer): Integer; overload;
      //AL_1
      function IIF(BooleanExpr: Boolean; IfTrue, IfFalse: String): String; overload;
      //AL_1
      function IIF(BooleanExpr: Boolean; IfTrue, IfFalse: Double): Double; overload;
      //AL_1
      function IIF(BooleanExpr: Boolean; IfTrue, IfFalse: TDateTime): TDateTime; overload;

      procedure MontaParametros(dDataRef : TDateTime;
                                iIdPessoa: integer;
                var dDataAnt, dDataSaldoAnt, dDataINSS, dDataIniMes, dDataIniMesAnt,
                    dDataFimMesAnt, dDataIniIRRF, dDataFImIRRF, dDataDARF : TDateTime;
                var iQuarta, iSaldoAntIRRF, iSaldoAntINSS : Integer);


      function BuscaPrimeiroDiaIRRF(dDataRef:TDateTime; iIdPessoa: integer):TDateTime;

      //AL_2
      function LimpaDispFinanc (iUsuario : Integer): boolean;

      //AL_4
      function ListLoteDispAnalitica(iPessoa, iPatro, iPlanoPrev: Integer;
                                     dDataRef: TDateTime): OleVariant;

      //AL_5
      function IncluiLogDisponibilidade(dDataRef: TDateTime;
                                        iIdUsuario, iPlano, iPatro, iPessoa: Integer;
                                        fNumDoc, fNumApgr, fSaldoAnt, fRecebimento,
                                        fDesembolso, fSaldoDia, fSaldo: Double;
                                        sNodocumento, sNomeForcli, sPlano, sPatro, sCodCentroResp,
                                        sNomePlanoPatro, sNome, sTipoReg: String): Boolean;

      //AL_6
      function ListConsultaDoc(rCodLancFinanc: String;
                               iPessoa, iPatro, iPlanoPrev : Integer): OleVariant;

      //AL_8
      function ListDisponibilidade(sTipoDisp : String;
                                   dDataRef : TDateTime;
                                   iPessoa : Integer;
                                   sPatro : String = 'null';
                                   sPlanoPrev : String = 'null';
                                   sFlgGrupo : String = '0';
                                   sFlgIndRecDes : String = 'null';
                                   sAtivPlano: String = 'null'): OleVariant;

      //AL_8
      function ListDispDebug(sSqlDebug : String): OleVariant;


   protected

      procedure DoChangeDataBase; override;
      //AL_1
      procedure AfterInitialize; override;


   end;



implementation
{ TCtrlDsiponFinanc }



constructor TCtrlDisponFinanc.Create(rIDPessoa, rIDModulo, rIDUsuario: Double; bUsaPlanoPatro: Boolean);
begin
   inherited Create;

   F_rIDPessoa:=rIDPessoa;
   F_rIDModulo:=rIDModulo;
   F_rIDUsuario:=rIDUsuario;
   F_bUsaPlanoPatro:=bUsaPlanoPatro;
   FDbMovimFinanc:=TDbMovimFinanc.Create(Self);

  _sql               := TCmSqlParams.Create(nil);
  _sql.ControlObject := Self;
   //AL_1
   CtrlParamFinanc := TCtrlParamFinanc.Create;
   CdsParamFinanc  := TCMClientDataSet.Create(Nil);
   DiasUteis       := TDiasUteis.Create;
   //AL_8
   FSqlRetorno := '';
   FFlgDocBaixado := '1';
end;



destructor TCtrlDisponFinanc.Destroy;
begin
   inherited;
   FDbMovimFinanc.Free;
   if IsAppServer then FcdsLancamento.Free;

   _sql.Free;
   //AL_1
   CtrlParamFinanc.Free;
   DiasUteis.Free;
   CdsParamFinanc.Free;
end;



procedure TCtrlDisponFinanc.DoChangeDataBase;
begin
   inherited;
   FDbMovimFinanc.DataBaseName:=DataBaseName;
end;



procedure TCtrlDisponFinanc.OnCreateAppServer;
begin
   inherited;
   FcdsLancamento:=TCMClientDataSet.Create(nil);
end;



function TCtrlDisponFinanc.ListLancamentos(rIDPessoa: Double;
  dDataRef: TDateTime): OleVariant;
var
   sSql : String;
begin
   sSql:='SELECT '+
         '   M.*, '+
         '   P.DESCRICAO, '+
         '   DECODE(M.DATADISPFINANC,NULL,''N'',''S'') AS FLGDISP '+
         'FROM '+
         '   MOVIMFINANC M, '+
         '   PORTADORCONTA P '+
         'WHERE '+
         '   (M.CODPORTADOR = P.CODPORTADOR) AND'+
         '   ((M.DATADISPFINANC IS NULL) OR (M.DATADISPFINANC = '+
         '    TO_DATE('''+FormatDateTime('dd/mm/yyyy',dDataRef)+''', '+
              '''dd/mm/yyyy''))) AND '+
         '   (M.IDPESSOA = '+FloatToStr(rIDPessoa)+') AND '+
         '   (M.STATUSCONCILIA <> ''C'') '+
         'ORDER BY '+
         '   P.DESCRICAO, '+
         '   M.DATALANCFINAN, '+
         '   M.ENTRADASAIDA ';
   Result:=GetDataPacket(sSql);
end;



function TCtrlDisponFinanc.ListConsLancamentos(rIDPessoa, rIDPatro, rIDPlanoPrev: Double;
  dDataRef: TDateTime): OleVariant;
var
   sSql : String;
begin
   sSql:=' SELECT '+
         '    U.DATALANCFINAN, '+
         '    U.NUMCHQBORDERO, '+
         '    U.HISTORICO, '+
         '    U.STATUSCONCILIA, '+
         '    U.ENTRADASAIDA, '+
         '    U.VALORLANCFINAN, '+
         '    U.CODPORTADOR, '+
         '    U.DESCRICAO, '+
         '    DECODE(U.CODLANCFINANC,-1,''Total Geral'', '+
         '           DECODE(U.CODLANCFINANC,0,''Total por Plano/Patro'', '+
         '           TO_CHAR(U.CODLANCFINANC))) AS CODLANCFINANC, '+
         '    U.DATADISPFINANC, '+
         '    U.ENTRADA, '+
         '    U.SAIDA, '+
         '    U.VALORAPLIC, '+
         '    U.VALORRESGATE, '+
         '    U.IDPLANOPREV, '+
         '    U.IDPATRO, '+
         '    U.NOMEPATRO, '+
         '    U.NOMEPLANO '+
         ' FROM '+
         '    ((SELECT '+
         '         TO_CHAR(M.DATALANCFINAN,''DD/MM/YYYY'') AS DATALANCFINAN, '+
         '         M.NUMCHQBORDERO, '+
         '         M.HISTORICO, '+
         '         M.STATUSCONCILIA, '+
         '         M.ENTRADASAIDA, '+
         '         M.VALORLANCFINAN, '+
         '         M.CODPORTADOR, '+
         '         P.DESCRICAO, '+
         '         M.CODLANCFINANC, '+
         '         M.DATADISPFINANC, '+
         '         SUM(DECODE(R.RECPAG,''R'',R.VALOR,0)) AS ENTRADA, '+
         '         SUM(DECODE(R.RECPAG,''P'',R.VALOR,0)) AS SAIDA, '+
         '         0 AS VALORAPLIC, '+
         '         0 AS VALORRESGATE, '+
         '         R.IDPLANOPREV, '+
         '         R.IDPATRO, '+
         '         PE.NOME AS NOMEPATRO, '+
         '         PC.NOME AS NOMEPLANO '+
         '      FROM '+
         '         MOVIMFINANC M, '+
         '         PORTADORCONTA P, '+
         '         RATEIOFINANC R, '+
         '         PESSOA PE, '+
         '         PLANPREVCONTABIL PC '+
         '      WHERE '+
         '         (R.IDPATRO = PE.IDPESSOA(+)) AND '+
         '         (R.IDPLANOPREV = PC.IDPLANOPREV(+)) AND '+
         '         (M.CODPORTADOR = P.CODPORTADOR) AND '+
         '         (M.CODLANCFINANC = R.CODLANCFINANC) AND '+
         '         (M.DATADISPFINANC = TO_DATE('''+
                    FormatDateTime('dd/mm/yyyy',dDataRef)+''',''dd/mm/yyyy'')) AND '+
         '         (M.IDPESSOA = '+FloatToStr(rIDPessoa)+') AND '+
         '         (M.STATUSCONCILIA <> ''C'') ';

   if (rIDPlanoPrev<>0) then
       sSql:=sSql+'         AND (R.IDPLANOPREV = '+FloatToStr(rIDPlanoPrev)+') ';

   if (rIDPatro<>0) then
       sSql:=sSql+'         AND (R.IDPATRO = '+FloatToStr(rIDPatro)+') ';

   sSql:=sSql+'      GROUP BY '+
              '         M.DATALANCFINAN, '+
              '         M.NUMCHQBORDERO, '+
              '         M.HISTORICO, '+
              '         M.STATUSCONCILIA, '+
              '         M.ENTRADASAIDA, '+
              '         M.VALORLANCFINAN, '+
              '         M.CODPORTADOR, '+
              '         P.DESCRICAO, '+
              '         M.CODLANCFINANC, '+
              '         M.DATADISPFINANC, '+
              '         R.IDPLANOPREV, '+
              '         R.IDPATRO, '+
              '         PE.NOME, '+
              '         PC.NOME ) '+
              'UNION ALL '+
              ' (SELECT '+
              '     '''' AS DATALANCFINAN, '+
              '     '''' AS NUMCHQBORDERO, '+
              '     '''' AS HISTORICO, '+
              '     '''' AS STATUSCONCILIA, '+
              '     '''' AS ENTRADASAIDA, '+
              '     0 AS VALORLANCFINAN, '+
              '     0  AS CODPORTADOR, '+
              '     ''-'' AS DESCRICAO, '+
              '     0 AS CODLANCFINANC, '+
              '     M.DATADISPFINANC, '+
              '     SUM(DECODE(R.RECPAG,''R'',R.VALOR,0)) AS ENTRADA, '+
              '     SUM(DECODE(R.RECPAG,''P'',R.VALOR,0)) AS SAIDA, '+
              '     DECODE(SIGN(SUM(DECODE(R.RECPAG,''R'',R.VALOR,R.VALOR*-1))),1, '+
              '            SUM(DECODE(R.RECPAG,''R'',R.VALOR,R.VALOR*-1)),0) AS VALORAPLIC, '+
              '     DECODE(SIGN(SUM(DECODE(R.RECPAG,''R'',R.VALOR,R.VALOR*-1))),-1, '+
              '            SUM(DECODE(R.RECPAG,''P'',R.VALOR,R.VALOR*-1)),0) AS VALORRESGATE, '+
              '     R.IDPLANOPREV, '+
              '     R.IDPATRO, '+
              '     PE.NOME AS NOMEPATRO, '+
              '     PC.NOME AS NOMEPLANO '+
              ' FROM '+
              '    MOVIMFINANC M, '+
              '    PORTADORCONTA P, '+
              '    RATEIOFINANC R, '+
              '    PESSOA PE, '+
              '    PLANPREVCONTABIL PC '+
              ' WHERE '+
              '    (R.IDPATRO = PE.IDPESSOA(+)) AND '+
              '    (R.IDPLANOPREV = PC.IDPLANOPREV(+)) AND '+
              '    (M.CODPORTADOR = P.CODPORTADOR) AND '+
              '    (M.CODLANCFINANC = R.CODLANCFINANC) AND '+
              '    (M.DATADISPFINANC = TO_DATE('''+
               FormatDateTime('dd/mm/yyyy',dDataRef)+''',''dd/mm/yyyy'')) AND '+
              '    (M.IDPESSOA = '+FloatToStr(rIDPessoa)+') AND '+
              '    (M.STATUSCONCILIA <> ''C'') ';
              
   if (rIDPlanoPrev<>0) then
       sSql:=sSql+'    AND (R.IDPLANOPREV = '+FloatToStr(rIDPlanoPrev)+') ';

   if (rIDPatro<>0) then
       sSql:=sSql+'    AND (R.IDPATRO = '+FloatToStr(rIDPatro)+') ';

   sSql:=sSql+' GROUP BY '+
              '    M.DATADISPFINANC, '+
              '    R.IDPLANOPREV, '+
              '    R.IDPATRO, '+
              '    PE.NOME, '+
              '    PC.NOME) '+
              'UNION ALL '+
              ' (SELECT '+
              '     '''' AS DATALANCFINAN, '+
              '     '''' AS NUMCHQBORDERO, '+
              '     '''' AS HISTORICO, '+
              '     '''' AS STATUSCONCILIA, '+
              '     '''' AS ENTRADASAIDA, '+
              '     0 AS VALORLANCFINAN, '+
              '     0  AS CODPORTADOR, '+
              '     ''-'' AS DESCRICAO, '+
              '     -1 AS CODLANCFINANC, '+
              '     M.DATADISPFINANC, '+
              '     SUM(DECODE(R.RECPAG,''R'',R.VALOR,0)) AS ENTRADA, '+
              '     SUM(DECODE(R.RECPAG,''P'',R.VALOR,0)) AS SAIDA, '+
              '     DECODE(SIGN(SUM(DECODE(R.RECPAG,''R'',R.VALOR,R.VALOR*-1))),1, '+
              '            SUM(DECODE(R.RECPAG,''R'',R.VALOR,R.VALOR*-1)),0) AS VALORAPLIC, '+
              '     DECODE(SIGN(SUM(DECODE(R.RECPAG,''R'',R.VALOR,R.VALOR*-1))),-1, '+
              '            SUM(DECODE(R.RECPAG,''P'',R.VALOR,R.VALOR*-1)),0) AS VALORRESGATE, '+
              '     0 AS IDPLANOPREV, '+
              '     0 AS IDPATRO, '+
              '     '''' AS NOMEPATRO, '+
              '     '''' AS NOMEPLANO '+
              '  FROM '+
              '     MOVIMFINANC M, '+
              '     PORTADORCONTA P, '+
              '     RATEIOFINANC R, '+
              '     PESSOA PE, '+
              '     PLANPREVCONTABIL PC '+
              '  WHERE '+
              '     (R.IDPATRO = PE.IDPESSOA(+)) AND '+
              '     (R.IDPLANOPREV = PC.IDPLANOPREV(+)) AND '+
              '     (M.CODPORTADOR = P.CODPORTADOR) AND '+
              '     (M.CODLANCFINANC = R.CODLANCFINANC) AND '+
              '     (M.DATADISPFINANC = TO_DATE('''+
              FormatDateTime('dd/mm/yyyy',dDataRef)+''',''dd/mm/yyyy'')) AND '+
              '     (M.IDPESSOA = '+FloatToStr(rIDPessoa)+') AND '+
              '     (M.STATUSCONCILIA <> ''C'') ';

   if (rIDPlanoPrev<>0) then
       sSql:=sSql+'    AND (R.IDPLANOPREV = '+FloatToStr(rIDPlanoPrev)+') ';

   if (rIDPatro<>0) then
       sSql:=sSql+'    AND (R.IDPATRO = '+FloatToStr(rIDPatro)+') ';

   sSql:=sSql+'  GROUP BY M.DATADISPFINANC)) U '+
              'ORDER BY '+
              '   U.DATADISPFINANC, '+
              '   U.IDPLANOPREV, '+
              '   U.IDPATRO, '+
              '   U.DESCRICAO, '+
              '   U.DATALANCFINAN, '+
              '   U.ENTRADASAIDA ';

   Result:=GetDataPacket(sSql);
end;



function TCtrlDisponFinanc.ListRelatDisp(rIDPessoa, rIDPatro,
  rIDPlanoPrev: Double; dDataRef: TDateTime): OleVariant;
var
   sSql : String;
begin
   sSql:='SELECT '+
         '   TO_CHAR(M.DATALANCFINAN,''DD/MM/YYYY'') AS DATALANCFINAN, '+
         '   M.NUMCHQBORDERO, '+
         '   M.HISTORICO, '+
         '   M.STATUSCONCILIA, '+
         '   M.ENTRADASAIDA, '+
         '   M.VALORLANCFINAN, '+
         '   M.CODPORTADOR, '+
         '   P.DESCRICAO, '+
         '   M.CODLANCFINANC, '+
         '   M.DATADISPFINANC, '+
         '   E.NOMEEMPRESA, '+
         '   SUM(DECODE(R.RECPAG,''R'',R.VALOR,0)) AS ENTRADA, '+
         '   SUM(DECODE(R.RECPAG,''P'',R.VALOR,0)) AS SAIDA, '+
         '   SUM(DECODE(R.RECPAG,''R'',R.VALOR,R.VALOR*-1)) AS SALDOAPLICRESTATE, '+
         '   R.IDPLANOPREV, '+
         '   R.IDPATRO, '+
         '   PE.NOME AS NOMEPATRO, '+
         '   PC.NOME AS NOMEPLANO '+
         'FROM '+
         '   MOVIMFINANC M, '+
         '   PORTADORCONTA P, '+
         '   RATEIOFINANC R, '+
         '   PESSOA PE, '+
         '   PLANPREVCONTABIL PC, '+
         '   EMPRESAPROP E '+
         'WHERE '+
         '   (R.IDPATRO = PE.IDPESSOA(+)) AND '+
         '   (R.IDPLANOPREV = PC.IDPLANOPREV(+)) AND '+
         '   (M.CODPORTADOR = P.CODPORTADOR) AND '+
         '   (M.DATADISPFINANC = TO_DATE('''+
              FormatDateTime('dd/mm/yyyy',dDataRef)+''',''dd/mm/yyyy'')) AND '+
         '   (M.IDPESSOA = '+FloatToStr(rIDPessoa)+') AND '+
         '   (M.STATUSCONCILIA <> ''C'') AND '+
         '   (M.CODLANCFINANC = R.CODLANCFINANC) AND '+
         '   (E.IDPESSOA = M.IDPESSOA) ';

   if (rIDPlanoPrev<>0) then
       sSql:=sSql+'    AND (R.IDPLANOPREV = '+FloatToStr(rIDPlanoPrev)+') ';

   if (rIDPatro<>0) then
       sSql:=sSql+'    AND (R.IDPATRO = '+FloatToStr(rIDPatro)+') ';

   sSql:=sSql+'GROUP BY '+
              '   M.DATALANCFINAN, '+
              '   M.NUMCHQBORDERO, '+
              '   M.HISTORICO, '+
              '   M.STATUSCONCILIA, '+
              '   M.ENTRADASAIDA, '+
              '   M.VALORLANCFINAN, '+
              '   M.CODPORTADOR, '+
              '   P.DESCRICAO, '+
              '   M.CODLANCFINANC, '+
              '   M.DATADISPFINANC, '+
              '   E.NOMEEMPRESA, '+
              '   R.IDPLANOPREV, '+
              '   R.IDPATRO, '+
              '   PE.NOME, '+
              '   PC.NOME '+
              'ORDER BY '+
              '   M.DATADISPFINANC, '+
              '   R.IDPLANOPREV, '+
              '   R.IDPATRO, '+
              '   P.DESCRICAO, '+
              '   M.DATALANCFINAN, '+
              '   M.ENTRADASAIDA ';

   Result:=GetDataPacket(sSql);
end;



function TCtrlDisponFinanc.ListDispDivergentes(rIDPessoa: Double;
  sMesAno: String): OleVariant;
var
   sSql : String;
begin
   sSql:='SELECT '+
         '   M.DataDispFinanc, '+
         '   PC.NOME AS NOMEPLANO, '+
         '   PE.NOME AS NOMEPATRO '+
         'FROM '+
         '   MovimFinanc M, '+
         '   RateioFinanc R, '+
         '   PESSOA PE, '+
         '   PLANPREVCONTABIL PC '+
         'WHERE '+
         '   (M.IDPESSOA = '+FloatToStr(rIDPessoa)+') AND '+
         '   (R.IDPATRO = PE.IDPESSOA(+)) AND '+
         '   (R.IDPLANOPREV = PC.IDPLANOPREV(+)) AND '+
         '   (M.CodLancFinanc=R.CodLancFinanc) AND '+
         '   (TO_CHAR(M.DataDispFinanc,''MM/YYYY'') = '''+sMesAno+''' ) AND '+
         '   (SELECT Sum(Decode(R1.RECPAG,''R'',R1.Valor,-R1.Valor)) AS Total '+
         '    FROM '+
         '       MovimFinanc M1, '+
         '       RateioFinanc R1 '+
         '    WHERE '+
         '       (M1.IDPESSOA = '+FloatToStr(rIDPessoa)+') AND '+
         '       (M1.CodLancFinanc = R1.CodLancFinanc) AND '+
         '       (M1.DataDispFinanc = M.DataDispFinanc) AND '+
         '       ((R1.IDPATRO = R.IDPATRO) OR ((R1.IDPATRO IS NULL) AND (R.IDPATRO IS NULL))) AND '+
         '       ((R1.IDPLANOPREV = R.IDPLANOPREV) OR '+
         '        ((R1.IDPLANOPREV IS NULL) AND (R.IDPLANOPREV IS NULL))))<> 0 '+
         'GROUP BY '+
         '   M.DataDispFinanc, '+
         '   PC.NOME , '+
         '   PE.NOME ';
   Result:=GetDataPacket(sSql);
end;



function TCtrlDisponFinanc.EncerraDisponibilidade(dDataRef: TDateTime): Boolean;
begin
   MessageInfo:='';
   if ConnectionSide=cnsClient then
    begin
       Result:=Connection.AppServer.EncerraDisponibilidade(dDataRef,
                                                           F_rIDPessoa,
                                                           F_rIDModulo,
                                                           F_rIDUsuario,
                                                           F_bUsaPlanoPatro);
       if not Result then MessageInfo:=Connection.AppServer.MessageInfo;
    end
   else
    begin
       try
          StartTransaction;

          Result:=ApplyCds(FcdsLancamento,FDbMovimFinanc,[],[]);
          if not(Result) then
           begin
              MessageInfo:=FDbMovimFinanc.MessageInfo;
              Rollback;
              Exit;
           end
          else
           begin
              Result:=ExecSQL('UPDATE PARAMFINANC SET DATABLOQDISPFINAN = TO_DATE('''+
                              FormatDateTime('dd/mm/yyyy',dDataRef)+''',''DD/MM/YYYY'') '+
                              'WHERE (IDPESSOA = '+FloatToStr(F_rIDPessoa)+') ');
              if not(Result) then
               begin
                  Rollback;
                  Exit;
               end
              else
               Commit;
           end;
       except
          on E:Exception do
          begin
             Result := False;
             MessageInfo := E.Message;
             Rollback;
          end;
       end;
    end;
end;



function TCtrlDisponFinanc.AplicaMarcacoesDisp: Boolean;
begin
   MessageInfo:='';
   if ConnectionSide=cnsClient then
    begin
       Result:=Connection.AppServer.AplicaMarcacoesDisp(FcdsLancamento.Data,
                                                        F_rIDPessoa,
                                                        F_rIDModulo,
                                                        F_rIDUsuario,
                                                        F_bUsaPlanoPatro);
       if not Result then MessageInfo:=Connection.AppServer.MessageInfo;
    end
   else
    begin
       try
          StartTransaction;

          Result:=ApplyCds(FcdsLancamento,FDbMovimFinanc,[],[]);
          if not(Result) then
           begin
              MessageInfo:=FDbMovimFinanc.MessageInfo;
              Rollback;
              Exit;
           end;
          Commit;
       except
          on E:Exception do
          begin
             Result := False;
             MessageInfo := E.Message;
             Rollback;
          end;
       end;
    end;
end;



function TCtrlDisponFinanc.TestaDispFinanc(iIdPessoa,iIdUsuario : Integer;
                                           dDataOper : TDateTime): Boolean;
var
   sSql,fDispBloq,fUsuBloq : string;
   dDataDisp : TDateTime;
begin
   Result := True;

   if FlgIntegraDispFin then // Verifico se Faz Integracao com Disp. Financeira
   begin
      sSql := 'SELECT                                             ' +
              '   PAR.FLGDISPBLOQ, PAR.DATABLOQDISPFINAN,         ' +
              '   USU.IDUSUARIO, USU.FLGDISPFINANC                ' +
              'FROM  PARAMFINANC PAR,USUARIOSISTEMA USU           ' +
              'WHERE                                              ' +
              '   (PAR.IDPESSOA =  '+IntToStr(iIdPessoa)+' )      ' +
              '   AND (USU.IDUSUARIO = '+IntToStr(iIdUsuario)+' ) ' ;

      _Cds.Data  := GetDataPacket(sSql);

      if not _Cds.isEmpty then
      begin
         dDataDisp := _Cds.FieldByName('DATABLOQDISPFINAN').AsDateTime;
         // Somente valido se o lancto for no mesmo dia da Disponibilidade
         if dDataOper = dDataDisp then
         begin
            fDispBloq := _Cds.FieldByName('FLGDISPBLOQ').AsString;
            fUsuBloq  := _Cds.FieldByName('FLGDISPFINANC').AsString;

            // Verifico se a Disp. está bloqueada para lanctos
            if fDispBloq = 'Y' then
            begin
               if fUsuBloq <> 'Y' then
                  Result := False;
            end;
         end;
      end;
   end;
end;



function TCtrlDisponFinanc.FlgIntegraDispFin:boolean;
var
  sSql :string;
begin
   sSql := 'SELECT FLGINTDISPFIN FROM PARAMFINANC ';

    _cds.Data := GetDataPacket(sSql);
   if Not _cds.isEmpty Then
   begin
      if _cds.FieldByName('FLGINTDISPFIN').AsString = 'Y' then
         Result := True
      else
         Result := False;
   end;
end;



function TCtrlDisponFinanc.IncluiDispFinanc(iIdPessoa, iIdUsuario,
                                            iIdModuloOrig, iIdPlano, iIdPatro,
                                            iCodDocumento, iCodLancFinanc : Integer;
                                            fVlrDisp : Double;
                                            dDataDisp : TDateTime;
                                            sHistorico : String;
                                            bIncluiDisp : boolean) : Boolean;
var fIdDispFinanc:integer;
    sMensagem : String;
begin
   {TIPOREG := A = SALDO INICIAL
               I = INVESTIMENTO
               O = OUTROS MODULOS
               S = SALDO FINAL
    TIPO := B = BLOQUEIO
            L = LANCAMENTOS}
   if ConnectionSide = cnsClient then
   begin
      Result :=
         Connection.AppServer.IncluiDispFinanc(iIdPessoa, iIdUsuario,
                                               iIdModuloOrig, iIdPlano, iIdPatro,
                                               iCodDocumento,iCodLancFinanc,
                                               fVlrDisp, dDataDisp,
                                               sHistorico,bIncluiDisp);
      If Not Result Then
         MessageInfo := Connection.AppServer.MessageInfo;
   End Else
   Begin
      if (bIncluiDisp) then
      begin
         Try
            StartTransaction;
            // DISPFINANC
            fIdDispFinanc := GetSequence('DISPFINANC');
            _sql.SQL.Clear;
            _sql.SQL.Add(' INSERT INTO DISPFINANC ');
            _sql.SQL.Add(' (IDDISPFINANC,VLRDISPFINANC,TIPOREG,IDMODULOORIGEM,');
            _sql.SQL.Add('  TIPO,HISTORICO,DATADISPFINANC, ');
            _sql.SQL.Add('  CODDOCUMENTO,CODLANCFINANC) ');
            _sql.SQL.Add(' VALUES ');
            _sql.SQL.Add(' (:IDDISPFINANC,:VLRDISPFINANC,:TIPOREG,:IDMODULOORIGEM,');
            _sql.SQL.Add('  :TIPO,:HISTORICO,:DATADISPFINANC, ');
            _sql.SQL.Add('  :CODDOCUMENTO,:CODLANCFINANC) ');
            _sql.Prepare;
            _sql.ParamByName('IDDISPFINANC').asInteger    := fIdDispFinanc;
            _sql.ParamByName('VLRDISPFINANC').asFloat     := fVlrDisp;

            if iIdModuloOrig = 79 then
               _sql.ParamByName('TIPOREG').asString := 'I'
            else
               _sql.ParamByName('TIPOREG').asString := 'O';

            _sql.ParamByName('IDMODULOORIGEM').asInteger  := iIdModuloOrig;

            if iIdModuloOrig = 9 then
               _sql.ParamByName('TIPO').asString := 'B'
            else
               _sql.ParamByName('TIPO').asString := 'L';


            _sql.ParamByName('HISTORICO').asString        := sHistorico;
            _sql.ParamByName('DATADISPFINANC').asDateTime := dDataDisp;
            if iCodLancFinanc = -1 then
               _sql.ParamByName('CODLANCFINANC').Clear
            else
               _sql.ParamByName('CODLANCFINANC').AsInteger := iCodLancFinanc;

            if iCodDocumento = -1 then
               _sql.ParamByName('CODDOCUMENTO').Clear
            else
               _sql.ParamByName('CODDOCUMENTO').AsInteger := iCodDocumento;

            if not ExecSQL(_sql.SQLChanged,False) Then
               Raise Exception.Create(MessageInfo);

            // RATEIODISPFINANC
            _sql.SQL.Clear;
            _sql.SQL.Add(' INSERT INTO RATEIODISPFINANC ');
            _sql.SQL.Add(' (IDDISPFINANC,IDPLANO,IDPATRO,');
            _sql.SQL.Add('  VLRRATEIO,IDPESSOA) ');
            _sql.SQL.Add(' VALUES ');
            _sql.SQL.Add(' (:IDDISPFINANC,:IDPLANO,:IDPATRO,');
            _sql.SQL.Add('  :VLRRATEIO,:IDPESSOA) ');

            _sql.Prepare;

            _sql.ParamByName('IDDISPFINANC').AsInteger := fIdDispFinanc;
            _sql.ParamByName('IDPLANO').AsInteger      := iIdPlano;
            _sql.ParamByName('IDPATRO').AsInteger      := iIdPatro;
            _sql.ParamByName('VLRRATEIO').AsFloat      := fVlrDisp;
            _sql.ParamByName('IDPESSOA').AsInteger     := iIdPessoa;

            if not ExecSQL(_sql.SQLChanged,False) Then
               Raise Exception.Create(MessageInfo);

            Commit;
            Result := True;
         except
            on E:Exception do
            begin
               Rollback;
               Result := False;
               MessageInfo := E.Message;
            end;
         end;
      end;
   end;
end;



function TCtrlDisponFinanc.AlteraDispFinanc(iIdModulo, iCodDocumento,
                                            iCodLancFinanc : integer): boolean;
begin
   if ConnectionSide = cnsClient then
   begin
      Result :=
         Connection.AppServer.AlteraDispFinanc(iIdModulo, iCodDocumento,
                                               iCodLancFinanc);
      If Not Result Then
         MessageInfo := Connection.AppServer.MessageInfo;
   End Else
   Begin
      if FlgIntegraDispFin then
      begin
         Try
            StartTransaction;
            // DISPFINANC
            _sql.SQL.Clear;
            _sql.SQL.Add(' UPDATE DISPFINANC SET FLGEXCLUSAO = ''Y'' ');
            _sql.SQL.Add(' WHERE ');
            if iIdModulo = 9 then
               _sql.SQL.Add(' CODLANCFINANC = :CODLANCFINANC ')
            else
               _sql.SQL.Add(' CODDOCUMENTO = :CODDOCUMENTO ');

            _sql.Prepare;
            if iIdModulo = 9 then
               _sql.ParamByName('CODLANCFINANC').AsInteger := iCodLancFinanc
            else
               _sql.ParamByName('CODDOCUMENTO').AsInteger := iCodDocumento;

            if not ExecSQL(_sql.SQLChanged,False) Then
               Raise Exception.Create(MessageInfo);

            Commit;
            Result := True;
         except
            on E:Exception do
            begin
               Rollback;
               Result := False;
               MessageInfo := E.Message;
            end;
         end;
      end;
   end;
end;



//AL_2
function TCtrlDisponFinanc.LimpaDispFinanc (iUsuario : Integer) : boolean;
begin
   if ConnectionSide = cnsClient then
   begin
      Result :=
         Connection.AppServer.LimpaDispFinanc;
      If Not Result Then
         MessageInfo := Connection.AppServer.MessageInfo;
   End Else
   Begin
      Try
         StartTransaction;
         _sql.SQL.Clear;
         _sql.SQL.Add(' DELETE FROM LOGDISPONIBILIDADE ');
         _sql.SQL.Add(' WHERE IDUSUARIO = :IDUSUARIO ');
         _sql.Prepare;
         _sql.ParamByName('IDUSUARIO').asInteger := iUsuario;
         if not ExecSQL(_sql.SQLChanged,False) Then
            Raise Exception.Create(MessageInfo);
         Commit;
         Result := True;
      except
         on E:Exception do
         begin
            Rollback;
            Result := False;
            MessageInfo := E.Message;
         end;
      end;
   end;
end;

function TCtrlDisponFinanc.SelecionaDispFinanc(dDataRef:TDateTime): OleVariant;
var sSql : string;
begin
   sSql := 'SELECT                                    '+
           '  IDDISPFINANC,DATADISPFINANC,IDMODULO,   '+
           '  IDMODULOORIGEM,HISTORICO,VLRDISPFINANC, '+
           '  TIPO,FLGEXCLUSAO,TIPOREG                '+
           'FROM DISPFINANC                           '+
           'WHERE                                     '+
           '   (DATADISPFINANC = TO_DATE('''+DateToStr(dDataRef)+''',''DD/MM/YYYY'')) ';

   Result := GetDataPacket(sSql);
end;



//AL_1
//AL_3
function TCtrlDisponFinanc.ListDispSintetica (dDataIni, dDataFim : TDateTime;
                                              iPessoa, iUsuario : Integer): OleVariant;
var
   sSql : String;
begin
   sSql:= 'SELECT                                                                            '+
          '   DATAREF, NOMEPLANOPATRO, IDPATRO, IDPLANO,                                     '+
          '   SALDOANT, RECEBIMENTOS, DESEMBOLSOS, SALDODIA , TIPOREG                        '+
          'FROM                                                                              '+
          '   (SELECT                                                                        '+
          '       DATAREF, NOMEPLANOPATRO, IDPATRO, IDPLANO,                                 '+
          '       SALDOANT, RECEBIMENTOS, DESEMBOLSOS, SALDODIA , TIPOREG                    '+
          '    FROM LOGDISPONIBILIDADE                                                       '+
          '    WHERE TIPOREG = ''0''                                                         '+
          '       AND IDPESSOA = '+ IntToStr(iPessoa) +
          '       AND IDUSUARIO = '+ IntToStr(iUsuario) +
          '       AND DATAREF >= TO_DATE('''+DateToStr(dDataIni)+''',''DD/MM/YYYY'') '+
          '       AND DATAREF <= TO_DATE('''+DateToStr(dDataFim)+''',''DD/MM/YYYY'') '+
          '                                                                                  '+
          '    UNION                                                                         '+
          '                                                                                  '+
          '    SELECT                                                                        '+
          '       DATAREF, NOMEPLANOPATRO, IDPATRO, IDPLANO,                                 '+
          '       SUM(NVL(SALDOANT,0)) AS SALDOANT,                                          '+
          '       SUM(NVL(RECEBIMENTOS,0)) AS RECEBIMENTOS,                                  '+
          '       SUM(NVL(DESEMBOLSOS,0)) AS DESEMBOLSOS,                                    '+
          '       (SUM(NVL(SALDOANT,0)) + SUM(NVL(RECEBIMENTOS,0)) + SUM(NVL(DESEMBOLSOS,0))) AS SALDODIA, '+
          '       ''1'' AS TIPOREG                                                           '+
          '    FROM LOGDISPONIBILIDADE                                                       '+
          '    WHERE TIPOREG <> ''0''                                                        '+
          '       AND TIPOREG <> ''5''                                                       '+
          '       AND IDPESSOA = '+ IntToStr(iPessoa) +
          '       AND IDUSUARIO = '+ IntToStr(iUsuario) +
          '       AND DATAREF >= TO_DATE('''+DateToStr(dDataIni)+''',''DD/MM/YYYY'') '+
          '       AND DATAREF <= TO_DATE('''+DateToStr(dDataFim)+''',''DD/MM/YYYY'') '+
          '    GROUP BY NOMEPLANOPATRO, IDPATRO, IDPLANO, DATAREF                            '+
          '                                                                                  '+
          '    UNION                                                                         '+
          '                                                                                  '+
          '    SELECT                                                                        '+
          '       DATAREF, NOMEPLANOPATRO, IDPATRO, IDPLANO,                                 '+
          '       SALDOANT, RECEBIMENTOS, DESEMBOLSOS, SALDODIA , TIPOREG                    '+
          '    FROM LOGDISPONIBILIDADE                                                       '+
          '    WHERE TIPOREG = ''5''                                                         '+
          '       AND IDPESSOA = '+ IntToStr(iPessoa) +
          '       AND IDUSUARIO = '+ IntToStr(iUsuario) +
          '       AND DATAREF >= TO_DATE('''+DateToStr(dDataIni)+''',''DD/MM/YYYY'') '+
          '       AND DATAREF <= TO_DATE('''+DateToStr(dDataFim)+''',''DD/MM/YYYY'') '+
          '    )                                                                             '+
          'ORDER BY DATAREF, TIPOREG, NOMEPLANOPATRO                                         ';

   Result:=GetDataPacket(sSql);
end;



//AL_1
//AL_3
function TCtrlDisponFinanc.ListDispAnalitica(iPessoa, iPatro, iPlanoPrev, iUsuario : Integer;
                                             dDataIni, dDataFim : TDateTime): OleVariant;
var
   sSql : String;
begin
   sSql:='SELECT '+
         '   DATAREF, NUMDOC, NUMAPGR, NOMEFORCLI, NODOCUMENTO, NOMEFORCLI,SALDO, '+
         '   CODCENTRORESPON, NOMEPLANOPATRO, NOME, IDPLANO, IDPATRO, TIPOREG, '+
         '   SALDOANT, RECEBIMENTOS, DESEMBOLSOS, SALDODIA, '+
         '   IDPESSOA, PLANO, PATRO '+
         'FROM LOGDISPONIBILIDADE '+
         'WHERE  IDPESSOA = '+ IntToStr(iPessoa) +
         '   AND IDUSUARIO = '+ IntToStr(iUsuario) +
         '   AND DATAREF >= TO_DATE('''+DateToStr(dDataIni)+''',''DD/MM/YYYY'') '+
         '   AND DATAREF <= TO_DATE('''+DateToStr(dDataFim)+''',''DD/MM/YYYY'') ';
         //AL_5
         if (iPatro = -1) and (iPlanoPrev = -1) then
            sSql := sSql + ' AND TIPOREG NOT IN (1,4) ';
         if iPatro <> -1 then
            sSql := sSql + ' AND IDPATRO  = '+ IntToStr(iPatro);
         if iPlanoPrev <> -1 then
            sSql := sSql + ' AND IDPLANO   = '+ IntToStr(iPlanoPrev);
         sSql := sSql + ' ORDER BY DATAREF, NOMEPLANOPATRO, TIPOREG';

   Result:=GetDataPacket(sSql);
end;



//AL_1
function TCtrlDisponFinanc.IIF(BooleanExpr: Boolean; IfTrue, IfFalse: String): String;
begin
   if BooleanExpr then Result := IfTrue else Result := IfFalse;
end;



//AL_1
function TCtrlDisponFinanc.IIF(BooleanExpr: Boolean; IfTrue, IfFalse: Integer): Integer;
begin
   if BooleanExpr then Result := IfTrue else Result := IfFalse;
end;



//AL_1
function TCtrlDisponFinanc.IIF(BooleanExpr: Boolean; IfTrue, IfFalse: TDateTime): TDateTime;
begin
   if BooleanExpr then Result := IfTrue else Result := IfFalse;
end;



//AL_1
function TCtrlDisponFinanc.IIF(BooleanExpr: Boolean; IfTrue, IfFalse: Double): Double;
begin
   if BooleanExpr then Result := IfTrue else Result := IfFalse;
end;



//AL_1
procedure TCtrlDisponFinanc.MontaParametros(dDataRef : TDateTime;
             iIdPessoa: integer;
             var dDataAnt, dDataSaldoAnt, dDataINSS, dDataIniMes, dDataIniMesAnt,
                 dDataFimMesAnt, dDataIniIRRF, dDataFImIRRF, dDataDARF : TDateTime;
             var iQuarta, iSaldoAntIRRF, iSaldoAntINSS : Integer);
var
   iAno, iMes, iDia : word;

begin
   dDataSaldoAnt := CdsParamFinanc.FieldByName('DATAINIDISPFINANC').AsDateTime;

   DecodeDate(dDataRef, iAno, iMes, iDia);

   //AL_16
   if dDataRef < StrToDate('01/01/2007') then
      // INSS - Todo dia 2 (útil) ou 1º útil subsequente
      dDataINSS := EncodeDate(iAno, iMes, 2)
   else
      // INSS - Todo dia 10 (útil) ou 1º útil subsequente
      //dDataINSS := EncodeDate(iAno, iMes, 10); //Bruno Bastos - SOL: 101670 Kintana: 451499
      dDataINSS := EncodeDate(iAno, iMes, 20); //Bruno Bastos - SOL: 101670 Kintana: 451499

   if not DiasUteis.DiaUtil(dDataINSS,-1,1,'',True,True,False) then
      //dDataINSS := (DiasUteis.PrimeiroDiaUtilPosterior(dDataINSS,-1,1,'',True,False,False)); //Bruno Bastos - SOL: 101670 Kintana: 451499
      dDataINSS := DiasUteis.UltDiaUtilAnterior(dDataINSS,-1,1,'',True,False,False); //Bruno Bastos - SOL: 101670 Kintana: 451499

   if dDataRef = dDataINSS then
      dDataINSS := dDataRef;
   iSaldoAntINSS := 0;
   // Somente registros de INSS para o mês subsequente ao de início de Disponibilidade (PARAMFINANC.DATAINIDISPFINANC)
   // Acertar depois -> Pegar do Paramfinanc DATAINIDISPFINANC + 1 mês (PRIMEIRO DIA UTIL)
   if ((dDataRef > dDataINSS) and
       (dDataRef > StrToDate('01/02/2005'))) then
      iSaldoAntINSS := 1;

   // Primeiro dia do mes da DATAREF
   dDataIniMes := EncodeDate(iAno, iMes, 1);

   // Primeiro dia do mes Anterior da DATAREF
   dDataIniMesAnt := DiasUteis.SomaMeses(dDataIniMes, -1);
   DecodeDate(dDataIniMesAnt, iAno, iMes, iDia);

   // Último dia do mes Anterior da DATAREF
   dDataFimMesAnt := DiasUteis.UltDiaMes(iAno, iMes);

   // Data Anterior
   dDataAnt := dDataRef - 1;

   // IRRF
   dDataIniIRRF := BuscaPrimeiroDiaIRRF(dDataRef,iIdPessoa);
   if dDataIniIRRF = 1 then
      dDataFImIRRF := 1
   else
      //dDataFImIRRF := dDataRef; //Bruno Bastos - SOL: 101670 Kintana: 451499
      dDataFimIRRF := DiasUteis.UltDiaMes(DiasUteis.ExtraiAno(dDataIniIRRF), DiasUteis.ExtraiMes(dDataIniIRRF));//Bruno Bastos - SOL: 101670 Kintana: 451499

   // DARF 3º dia útil da semana subsequente ao fato gerador
   dDataDARF    := DiasUteis.SomaDiasUteis(dDataFImIRRF, 3, -1, 1, '', True, True, False);
   iSaldoAntIRRF := 0;
   if ((DayOfWeek(dDataRef) = 5) or
       (DayOfWeek(dDataRef) = 6)) then
      iSaldoAntIRRF := 1;
   iQuarta := 0;
   if DayOfWeek(dDataRef) = 4 then
      iQuarta := 4;

end;



//AL_1
function TCtrlDisponFinanc.BuscaPrimeiroDiaIRRF(dDataRef:TDateTime; iIdPessoa: integer):TDateTime;
var
   iAno, iMes, iDia : word;
begin
   DecodeDate(dDataRef, iAno, iMes, iDia);

   //if ((DiasUteis.ExtraiDia(dDataRef) = 10) or //Bruno Bastos - SOL: 101670 Kintana: 451499
   //    (DiasUteis.ExtraiDia(DiasUteis.UltDiaUtilAnterior(Sistema.IdEmpresa,EncodeDate(iAno,iMes,10),true,true,false)) = DiasUteis.ExtraiDia(dDataRef))) then //Bruno Bastos - SOL: 101670 Kintana: 451499
   //Bruno Bastos - SOL: 101670 Kintana: 451499 - Início
   if ((DiasUteis.ExtraiDia(dDataRef) = 20) or
       (DiasUteis.ExtraiDia(DiasUteis.UltDiaUtilAnterior(iIdPessoa,EncodeDate(iAno,iMes,20),true,true,false)) = DiasUteis.ExtraiDia(dDataRef))) then
   //Bruno Bastos - SOL: 101670 Kintana: 451499 - Fim
   begin
      if DiasUteis.DiaUtil(iIdPessoa,dDataRef,true,true,false) then
      begin
         //while not (DiasUteis.ExtraiDia(dDataRef) = 11) do //Bruno Bastos - SOL: 101670 Kintana: 451499
         //while not (DiasUteis.ExtraiDia(dDataRef) = DiasUteis.ExtraiDia(DiasUteis.UltDiaMes(iAno, (iMes - 1)))) do //Bruno Bastos - SOL: 101670 Kintana: 451499
         //   dDataRef := dDataRef - 1; //Bruno Bastos - SOL: 101670 Kintana: 451499

          if iMes > 1 then
            iMes := iMes - 1
          else
            iMes := 12;
          //Bruno Bastos - Sol: 105489 Kintana: 472013 - Fim

          result := EncodeDate(iAno,iMes,1); //Bruno Bastos - Sol: 105489 Kintana: 472013
         //Bruno Bastos - Sol: 105489 Kintana: 472013 - result := EncodeDate(iAno,iMes - 1,1); //Bruno Bastos - Sol: 101670 Kintana: 451499
         //Result := dDataRef; //Bruno Bastos - SOL: 101670 Kintana: 451499
      end
      else
         Result := 1;
   end
   else
      Result := 1;
end;



//AL_1
procedure TCtrlDisponFinanc.SetCdsParamFinanc(const Value: TCMClientDataSet);
begin
  FCdsParamFinanc := Value;
end;



//AL_1
procedure TCtrlDisponFinanc.AfterInitialize;
begin
   inherited;
   CtrlParamFinanc.InitializeAs(Self);
   CdsParamFinanc.Data  := CtrlParamFinanc.ListParamFinanc(F_rIDPessoa);
   DiasUteis.InitializeAs(Self);

   //AL_8
   if CdsParamFinanc.FieldByName('FLGDISPDOCBX').AsString = 'S' then
      FFlgDocBaixado := '0';
end;



//AL_4
function TCtrlDisponFinanc.ListLoteDispAnalitica(iPessoa, iPatro, iPlanoPrev : Integer;
                                                 dDataRef : TDateTime): OleVariant;
var
   sSql : String;
begin
   sSql:='SELECT                                                                               '+
         '   A.NUMLOTE, A.NUMAPGR, A.NOME, A.RAZAOSOCIAL, X.RECPAG,                            '+
         '   A.NODOCUMENTO, (A.SALDO) AS VALOR, X.VALORTOT, 0 AS DIF                           '+
         'FROM                                                                                          '+
         '   MOVIMFINANC M,                                                                             '+
         '   (SELECT M.CODLANCFINANC, R.RECPAG, SUM(R.VALOR) AS VALORTOT                                '+
         '    FROM MOVIMFINANC M, RATEIOFINANC R                                                        '+
         '    WHERE                                                                                     '+
         '       (((M.DATALANCFINAN  = TO_DATE('''+DateToStr(dDataRef)+''',''DD/MM/YYYY'')) AND (M.DATADISPFINANC IS NULL)) OR  '+
         '        ((M.DATALANCFINAN  = TO_DATE('''+DateToStr(dDataRef)+''',''DD/MM/YYYY'')) AND (M.DATADISPFINANC = TO_DATE('''+DateToStr(dDataRef)+''',''DD/MM/YYYY''))) OR '+
         '        ((M.DATADISPFINANC = TO_DATE('''+DateToStr(dDataRef)+''',''DD/MM/YYYY''))))                                '+
         '       AND (R.IDPATRO = '+ IntToStr(iPatro) + ')'+
         '       AND (R.IDPLANOPREV = '+ IntToStr(iPlanoPrev) + ')'+
         '       AND (M.IDPESSOA = '+ IntToStr(iPessoa) + ')'+
         '       AND M.CODLANCFINANC = R.CODLANCFINANC                                                  '+
         '    GROUP BY M.CODLANCFINANC, R.RECPAG) X,                                                    '+
         '   (SELECT                                                                                    '+
         '       M.CODLANCFINANC,                                                                       '+
         '       RC.NUMLOTE, D.NUMAPGR, CT.NOME,    P.RAZAOSOCIAL,                                      '+
         '       D.NODOCUMENTO,                                                                         '+
         '       ROUND(SUM(((R.VALOR*S.SALDO)/L.VALOR)-(DECODE(P.VALOR,NULL,0,P.VALOR))),2) AS SALDO    '+
         '    FROM                                                                                      '+
         '        MOVIMFINANC M, RECBTOPAGTO RC, DOCUMENTO D, LANCTODOCUM L,                            '+
         '        RATEIODOCUM R, PESSOA P, CENTRESPON CT,                                               '+
         '        (SELECT P.CODTIPDOCCPMF FROM PARAMCAP P WHERE P.IDPESSOA = 1 AND P.RECPAG = ''P'') X, '+
         '        (SELECT D.CODDOCUMENTO, SUM(DECODE(L.DEBCRE,''D'',L.VALOR,L.VALOR*-1)) AS SALDO       '+
         '         FROM DOCUMENTO D, LANCTODOCUM L                                                    '+
         '         WHERE (D.OPERACAO IN (''2 ''))                                                     '+
         '           AND (D.RECPAG = ''P'')                                                           '+
         '           AND (D.IDPESSOA = 1)                                                             '+
         '           AND (L.OPERACAO <> 5)                                                            '+
         '           AND (D.CODDOCUMENTO = L.CODDOCUMENTO)                                            '+
         '         GROUP BY D.CODDOCUMENTO) S,                                                        '+
         '        (SELECT LA.CODDOCUMENTO, DECODE(LA.DEBCRE,''D'',LA.VALOR * -1,LA.VALOR) AS VALOR      '+
         '         FROM RECBTOPAGTO RE, LANCTODOCUM LA                                                '+
         '         WHERE (RE.CODPORTFORMA IN (SELECT CODPORTFORMA FROM PORTADORFORMA WHERE LANCAFINANC = ''N''))  '+
         '           AND (LA.DEBCRE = ''D'')                                                                      '+
         '           AND (LA.NUMLANCTO = RE.NUMLANCTO)) P                                                       '+
         '    WHERE                                                                                             '+
         '       (((M.DATALANCFINAN  = TO_DATE('''+DateToStr(dDataRef)+''',''DD/MM/YYYY'')) AND (M.DATADISPFINANC IS NULL)) OR       '+
         '        ((M.DATALANCFINAN  = TO_DATE('''+DateToStr(dDataRef)+''',''DD/MM/YYYY'')) AND (M.DATADISPFINANC = TO_DATE('''+DateToStr(dDataRef)+''',''DD/MM/YYYY''))) OR '+
         '        ((M.DATADISPFINANC = TO_DATE('''+DateToStr(dDataRef)+''',''DD/MM/YYYY''))))                             '+
         '       AND (D.IDMODULO <> 79)                                                              '+
         '       AND ((M.CODLANCTRANSF IS NULL) OR (M.CODLANCTRANSF = 0))                            '+
         '       AND (M.STATUSCONCILIA <> ''C'')                                                     '+
         '       AND (R.IDPATRO = '+ IntToStr(iPatro) + ')'+
         '       AND (R.IDPLANOPREV = '+ IntToStr(iPlanoPrev) + ')'+
         '       AND (M.IDPESSOA = '+ IntToStr(iPessoa) + ')'+
         '       AND (L.OPERACAO <> 5)                                                               '+
         '       AND (D.CODTIPDOC <> X.CODTIPDOCCPMF)                                                '+
         '       AND (D.OPERACAO = L.OPERACAO)                                                       '+
         '       AND (D.OPERACAO IN (''2 ''))                                                        '+
         '       AND (RC.CODLANCFINANC(+) = M.CODLANCFINANC)                                         '+
         '       AND (D.CODDOCUMENTO(+) = RC.CODDOCUMENTO)                                           '+
         '       AND (D.CODDOCUMENTO = L.CODDOCUMENTO)                                               '+
         '       AND (D.CODDOCUMENTO = R.CODDOCUMENTO)                                               '+
         '       AND (D.IDFORCLI = P.IDPESSOA)                                                       '+
         '       AND (D.CODDOCUMENTO = S.CODDOCUMENTO)                                               '+
         '       AND (D.CODDOCUMENTO = P.CODDOCUMENTO(+))                                            '+
         '       AND (R.CODCENTRORESPON  = CT.CODCENTRORESPON(+))                                       '+
         '       AND (D.IDPESSOA  = CT.IDPESSOA)                                                        '+
         '    GROUP BY RC.NUMLOTE, D.NUMAPGR, CT.NOME, D.NODOCUMENTO,P.RAZAOSOCIAL, M.CODLANCFINANC) A  '+
         'WHERE                                                                                         '+
         '   M.CODLANCFINANC = A.CODLANCFINANC '+
         '   AND M.CODLANCFINANC = X.CODLANCFINANC '+
         'ORDER BY A.NUMLOTE, A.NOME ';
   Result:=GetDataPacket(sSql);
end;



//AL_5
function TCtrlDisponFinanc.IncluiLogDisponibilidade(dDataRef : TDateTime;
                                                    iIdUsuario, iPlano, iPatro, iPessoa : Integer;
                                                    fNumDoc, fNumApgr, fSaldoAnt, fRecebimento, fDesembolso,
                                                    fSaldoDia, fSaldo : Double;
                                                    sNodocumento, sNomeForcli, sPlano, sPatro,
                                                    sCodCentroResp, sNomePlanoPatro, sNome, sTipoReg : String) : Boolean;
var fIdDispFinanc:integer;
    sMensagem : String;
begin
   if ConnectionSide = cnsClient then
   begin
      Result :=
         Connection.AppServer.IncluiLogDisponibilidade(dDataRef,
                                                       iIdUsuario, iPlano, iPatro, iPessoa,
                                                       fNumDoc, fNumApgr, fSaldoAnt, fRecebimento, fDesembolso,
                                                       fSaldoDia, fSaldo,
                                                       sNodocumento, sNomeForcli, sPlano, sPatro,
                                                       sCodCentroResp, sNomePlanoPatro, sNome, sTipoReg);
      If Not Result Then
         MessageInfo := Connection.AppServer.MessageInfo;
   End Else
   Begin
      Try
         StartTransaction;
         _sql.SQL.Clear;

         _sql.SQL.Add(' INSERT INTO LOGDISPONIBILIDADE ');
         _sql.SQL.Add(' (DATAREF, NUMDOC, NUMAPGR, NODOCUMENTO, NOMEFORCLI, SALDO, CODCENTRORESPON, ');
         _sql.SQL.Add('  NOMEPLANOPATRO, NOME, IDPLANO, IDPATRO, TIPOREG, SALDOANT, ');
         _sql.SQL.Add('  RECEBIMENTOS, DESEMBOLSOS, SALDODIA, IDPESSOA, PLANO, PATRO, IDUSUARIO) ');
         _sql.SQL.Add(' VALUES ');
         _sql.SQL.Add(' (:DATAREF, :NUMDOC, :NUMAPGR, :NODOCUMENTO, :NOMEFORCLI, :SALDO, :CODCENTRORESPON, ');
         _sql.SQL.Add('  :NOMEPLANOPATRO, :NOME, :IDPLANO, :IDPATRO, :TIPOREG, :SALDOANT, ');
         _sql.SQL.Add('  :RECEBIMENTOS, :DESEMBOLSOS, :SALDODIA, :IDPESSOA, :PLANO, :PATRO, :IDUSUARIO) ');
         _sql.Prepare;

         _sql.ParamByName('DATAREF').AsDateTime       := dDataRef;
         _sql.ParamByName('NUMDOC').AsFloat           := fNumDoc;
         _sql.ParamByName('NUMAPGR').AsFloat          := fNumApgr;
         _sql.ParamByName('NODOCUMENTO').AsString     := sNodocumento;
         _sql.ParamByName('NOMEFORCLI').AsString      := sNomeForcli;
         _sql.ParamByName('SALDO').AsFloat            := fSaldo;
         _sql.ParamByName('CODCENTRORESPON').AsString := sCodCentroResp;
         _sql.ParamByName('NOMEPLANOPATRO').AsString  := sNomePlanoPatro;
         _sql.ParamByName('NOME').AsString            := sNome;
         _sql.ParamByName('IDPLANO').AsInteger        := iPlano;
         _sql.ParamByName('IDPATRO').AsInteger        := iPatro;
         _sql.ParamByName('TIPOREG').AsString         := sTipoReg;
         _sql.ParamByName('SALDOANT').AsFloat         := fSaldoAnt;
         _sql.ParamByName('RECEBIMENTOS').AsFloat     := fRecebimento;
         _sql.ParamByName('DESEMBOLSOS').AsFloat      := fDesembolso;
         _sql.ParamByName('SALDODIA').AsFloat         := fSaldoDia;
         _sql.ParamByName('IDPESSOA').AsInteger       := iPessoa;
         _sql.ParamByName('PLANO').AsString           := sPlano;
         _sql.ParamByName('PATRO').AsString           := sPatro;
         _sql.ParamByName('IDUSUARIO').AsInteger      := iIdUsuario;

         if not ExecSQL(_sql.SQLChanged,False) Then
            Raise Exception.Create(MessageInfo);

         Commit;
         Result := True;
      except
         on E:Exception do
         begin
            Rollback;
            Result := False;
            MessageInfo := E.Message;
         end;
      end;
   end;
end;



//AL_6
function TCtrlDisponFinanc.ListConsultaDoc(rCodLancFinanc: String;
                                           iPessoa, iPatro, iPlanoPrev : Integer): OleVariant;
var
   sSQL   : string;
begin
   sSql := 'SELECT                                                                                                                         '+ #13 +
           '      SUM(A.VLRRATEIOEALT) AS VALOR, A.CODCENTRORESPON, A.RAZAOSOCIAL, A.NODOCUMENTO, A.NUMAPGR, A.NUMLOTE, A.CODDOCUMENTO,    '+ #13 +
           '      A.CENTRORESPON                                                                                                           '+ #13 +
           'FROM                                                                                                                           '+ #13 +
           '(                                                                                                                              '+ #13 +
           'SELECT                                                                                                                         '+ #13 +
           '   SUM(TOT.VALOR) AS TOTALRATEIO,                                                                                              '+ #13 +
           '   SUM(NVL(ALT.VALOR,0)) AS TOTALTERADOR,                                                                                      '+ #13 +
           '   SUM(RT.VALOR) AS VLRRATEIOPLANO,                                                                                            '+ #13 +
           '   ROUND(SUM(NVL(RT.VALOR,0)) + ((SUM(NVL(RT.VALOR,0)) * SUM(NVL(ALT.VALOR,0))) / SUM(NVL(TOT.VALOR,0))),2) AS VLRRATEIOEALT,  '+ #13 +
           '   RT.CODCENTRORESPON, P.RAZAOSOCIAL, D.NODOCUMENTO, D.NUMAPGR, RC.NUMLOTE, D.CODDOCUMENTO,                                    '+ #13 +
           '   RT.IDPATRO, RT.IDPLANOPREV, RT.IDPESSOA, (CT.NOME) AS CENTRORESPON                                                          '+ #13 +
           ' FROM                                                                                                                          '+ #13 +
           '    RATEIODOCUM RT, PESSOA P, DOCUMENTO D, CENTRESPON CT,                                                                      '+ #13 +
           '    (SELECT                                                                                                                    '+ #13 +
           '        D.NODOCUMENTO, D.NUMAPGR, R.NUMLOTE, D.CODDOCUMENTO                                                                    '+ #13 +
           '     FROM                                                                                                                      '+ #13 +
           '        RECBTOPAGTO R, DOCUMENTO D, LANCTODOCUM L                                                                              '+ #13 +
           '     WHERE                                                                                                                     '+ #13 +
           '        (R.CODLANCFINANC  IN (' + rCodLancFinanc + '))                                                                         '+ #13 +
           '        AND (D.NUMFATURA IS NULL)                                                                                              '+ #13 +
           '        AND (R.CODDOCUMENTO  = L.CODDOCUMENTO)                                                                                 '+ #13 +
           '        AND (R.NUMLANCTO = L.NUMLANCTO)                                                                                        '+ #13 +
           '        AND (L.CODDOCUMENTO = D.CODDOCUMENTO)                                                                                  '+ #13 +
           '     UNION                                                                                                                     '+ #13 +
           '     SELECT                                                                                                                    '+ #13 +
           '        D.NODOCUMENTO, D.NUMAPGR, X.NUMLOTE, D.CODDOCUMENTO                                                                    '+ #13 +
           '     FROM DOCUMENTO D,                                                                                                         '+ #13 +
           '          (SELECT R.NUMLOTE, D1.NODOCUMENTO                                                                                    '+ #13 +
           '           FROM                                                                                                                '+ #13 +
           '               RECBTOPAGTO R, DOCUMENTO D1, LANCTODOCUM L                                                                      '+ #13 +
           '           WHERE                                                                                                               '+ #13 +
           '              (R.CODLANCFINANC  IN (' + rCodLancFinanc + '))                                                                   '+ #13 +
           '              AND (D1.NUMFATURA IS NOT NULL                                                                                    '+ #13 +
           '              AND (R.CODDOCUMENTO  = L.CODDOCUMENTO)                                                                           '+ #13 +
           '              AND (R.NUMLANCTO = L.NUMLANCTO)                                                                                  '+ #13 +
           '              AND (L.CODDOCUMENTO = D1.CODDOCUMENTO))) X                                                                       '+ #13 +
           '     WHERE                                                                                                                     '+ #13 +
           '        D.NUMFATURA IN (SELECT  D1.NUMFATURA                                                                                   '+ #13 +
           '                        FROM                                                                                                   '+ #13 +
           '                           RECBTOPAGTO R, DOCUMENTO D1, LANCTODOCUM L                                                          '+ #13 +
           '                        WHERE                                                                                                  '+ #13 +
           '                           (R.CODLANCFINANC  IN (' + rCodLancFinanc + '))                                                      '+ #13 +
           '                           AND (D1.NUMFATURA IS NOT NULL                                                                       '+ #13 +
           '                           AND (R.CODDOCUMENTO  = L.CODDOCUMENTO)                                                              '+ #13 +
           '                           AND (R.NUMLANCTO = L.NUMLANCTO)                                                                     '+ #13 +
           '                           AND (L.CODDOCUMENTO = D1.CODDOCUMENTO)))                                                            '+ #13 +
           '                           AND (D.OPERACAO <> 3)) RC,                                                                          '+ #13 +
           '    (SELECT                                                                                                                    '+ #13 +
           '        SUM(NVL(DECODE(L.DEBCRE,''C'',L.VALOR,L.VALOR *-1),0)) AS VALOR, D.CODDOCUMENTO                                        '+ #13 +
           '     FROM RECBTOPAGTO R, DOCUMENTO D, LANCTODOCUM L                                                                            '+ #13 +
           '     WHERE                                                                                                                     '+ #13 +
           '        (R.CODLANCFINANC  IN (' + rCodLancFinanc + '))                                                                         '+ #13 +
           '        AND (L.OPERACAO = 4)                                                                                                   '+ #13 +
           '        AND (R.CODDOCUMENTO  = L.CODDOCUMENTO)                                                                                 '+ #13 +
           '        AND (L.CODDOCUMENTO = D.CODDOCUMENTO)                                                                                  '+ #13 +
           '     GROUP BY D.CODDOCUMENTO) ALT,                                                                                             '+ #13 +
           '    (SELECT                                                                                                                    '+ #13 +
           '        SUM(NVL(RT.VALOR,0)) AS VALOR, RC.CODDOCUMENTO                                                                         '+ #13 +
           '     FROM                                                                                                                      '+ #13 +
           '        RATEIODOCUM RT,                                                                                                        '+ #13 +
           '        (SELECT D.CODDOCUMENTO                                                                                                 '+ #13 +
           '         FROM RECBTOPAGTO R, DOCUMENTO D, LANCTODOCUM L                                                                        '+ #13 +
           '         WHERE                                                                                                                 '+ #13 +
           '            (R.CODLANCFINANC IN (' + rCodLancFinanc + '))                                                                      '+ #13 +
           '            AND (D.NUMFATURA IS NULL)                                                                                          '+ #13 +
           '            AND (R.CODDOCUMENTO  = L.CODDOCUMENTO)                                                                             '+ #13 +
           '            AND (R.NUMLANCTO = L.NUMLANCTO)                                                                                    '+ #13 +
           '            AND (L.CODDOCUMENTO = D.CODDOCUMENTO)) RC                                                                          '+ #13 +
           '     WHERE                                                                                                                     '+ #13 +
           '       (RT.CODDOCUMENTO = RC.CODDOCUMENTO)                                                                                     '+ #13 +
           '     GROUP BY  RC.CODDOCUMENTO                                                                                                 '+ #13 +
           '     UNION                                                                                                                     '+ #13 +
           '     SELECT                                                                                                                    '+ #13 +
           '        SUM(NVL(RT.VALOR,0)) AS VALOR, RC.CODDOCUMENTO                                                                         '+ #13 +
           '     FROM                                                                                                                      '+ #13 +
           '        RATEIODOCUM RT,                                                                                                        '+ #13 +
           '        (SELECT D.NODOCUMENTO, D.NUMAPGR, 0 AS NUMLOTE, D.CODDOCUMENTO                                                         '+ #13 +
           '         FROM DOCUMENTO D                                                                                                      '+ #13 +
           '         WHERE D.NUMFATURA IN (SELECT  D1.NUMFATURA                                                                            '+ #13 +
           '                               FROM RECBTOPAGTO R, DOCUMENTO D1, LANCTODOCUM L                                                 '+ #13 +
           '                               WHERE                                                                                           '+ #13 +
           '                                  (R.CODLANCFINANC  IN (' + rCodLancFinanc + '))                                               '+ #13 +
           '                                  AND (D1.NUMFATURA IS NOT NULL                                                                '+ #13 +
           '                                  AND (R.CODDOCUMENTO  = L.CODDOCUMENTO)                                                       '+ #13 +
           '                                  AND (R.NUMLANCTO = L.NUMLANCTO)                                                              '+ #13 +
           '                                  AND (L.CODDOCUMENTO = D1.CODDOCUMENTO)))                                                     '+ #13 +
           '                                  AND (D.OPERACAO <> 3)) RC                                                                    '+ #13 +
           '     WHERE                                                                                                                     '+ #13 +
           '        (RT.CODDOCUMENTO = RC.CODDOCUMENTO)                                                                                    '+ #13 +
           '     GROUP BY  RC.CODDOCUMENTO) TOT                                                                                            '+ #13 +
           ' WHERE                                                                                                                         '+ #13 +
           '    (RT.IDPESSOA = ' + IntToStr(iPessoa) + ')                                                                                  '+ #13 +
           '    AND (RT.IDPATRO = ' + IntToStr(iPatro) + ')                                                                                '+ #13 +
           '    AND (RT.IDPLANOPREV = ' + IntToStr(iPlanoPrev) + ')                                                                        '+ #13 +
           '    AND (D.IDFORCLI = P.IDPESSOA)                                                                                              '+ #13 +
           '    AND (RT.CODDOCUMENTO = D.CODDOCUMENTO)                                                                                     '+ #13 +
           '    AND (RT.CODDOCUMENTO = RC.CODDOCUMENTO)                                                                                    '+ #13 +
           '    AND (RT.CODDOCUMENTO = ALT.CODDOCUMENTO(+))                                                                                '+ #13 +
           '    AND (RT.CODDOCUMENTO = TOT.CODDOCUMENTO(+))                                                                                '+ #13 +
           '    AND (RT.CODCENTRORESPON = CT.CODCENTRORESPON)                                                                              '+ #13 +
           ' GROUP BY RT.CODCENTRORESPON, P.RAZAOSOCIAL, D.NODOCUMENTO, D.NUMAPGR, RC.NUMLOTE, D.CODDOCUMENTO,                             '+ #13 +
           '          RT.IDPATRO, RT.IDPLANOPREV, RT.IDPESSOA, CT.NOME) A                                                                  '+ #13 +
           'GROUP BY  A.CODCENTRORESPON, A.RAZAOSOCIAL, A.NODOCUMENTO, A.NUMAPGR, A.NUMLOTE, A.CODDOCUMENTO, A.CENTRORESPON                '+ #13 +
           'ORDER BY A.RAZAOSOCIAL ';
   Result:=GetDataPacket(sSql);
end;



//AL_8
function TCtrlDisponFinanc.ListDisponibilidade(sTipoDisp : String;
                                               dDataRef : TDateTime;
                                               iPessoa : Integer;
                                               sPatro : String = 'null';
                                               sPlanoPrev : String = 'null';
                                               sFlgGrupo : String = '0';
                                               sFlgIndRecDes : String = 'null';
                                               sAtivPlano: String = 'null'): OleVariant;
var
   sSQL   : string;
   iAno, iMes, iDia : word;
   dDataAnt, dDataSaldoAnt, dDataIniMes, dDataIniMesAnt, dDataFimMesAnt, dDataINSS,
   dDataIniIRRF, dDataFimIRRF, dDataDARF : TDateTime;
   iSaldoAntINSS, iSaldoAntIRRF, iQuarta, iTipoRecDes: Integer;
   iiPessoa : Double;
   sGrupo : string;
begin
   MontaParametros(dDataRef, iPessoa, dDataAnt, dDataSaldoAnt, dDataINSS, dDataIniMes,
                   dDataIniMesAnt, dDataFimMesAnt, dDataIniIRRF, dDataFImIRRF, dDataDARF,
                   iQuarta, iSaldoAntIRRF, iSaldoAntINSS);

   sGrupo := 'Plano/Patro';
   //AL_11
   if sFlgGrupo = '1' then
   begin
      sPatro := 'null';
      sGrupo := 'Plano';
   end
   else if sFlgGrupo = '2' then
   begin
      sPlanoPrev := 'null';
      sGrupo := 'Patro';
   end;

   if (sFlgIndRecDes = 'S') or (sFlgIndRecDes = 'N') then
      sFlgIndRecDes := QuotedStr(sFlgIndRecDes);

   sSql := '';

   iiPessoa := F_rIDPessoa;

   if sTipoDisp = 'Sintetica' then
   begin
      sSql := 'SELECT  '+ #13 +
              '   UU.NOMEGRUPO, '+ #13 +
              '   UU.GRUPO, '+ #13 +
              '   TO_NUMBER(SUBSTR(UU.GRUPO,1,20)) AS IDPATRO, '+ #13 +
              '   TO_NUMBER(SUBSTR(UU.GRUPO,21,20)) AS IDPLANOPREV, '+ #13 +
              '   NVL(SUM(UU.SALDOANT),0) AS SALDOANT, '+ #13 +
              '   NVL(SUM(UU.RECEBIMENTOS),0) AS RECEBIMENTOS, '+ #13 +
              '   NVL(SUM(UU.DESEMBOLSOS),0) AS DESEMBOLSOS, '+ #13 +
              //AL_14
              '   NVL((SUM(UU.SALDOANT) + SUM(UU.RECEBIMENTOS) + SUM(UU.DESEMBOLSOS)),0) AS SALDODIA, 0 AS TIPO '+ #13 +
              'FROM  '+ #13 +
              '   (  ';
   end;
   sSql :=  sSql + ' ' + #13 +
                   '-- (1) INICIO DA QRYANALITICA  '+ #13 +
                   '-- TAG QRYANALIT_I  '+ #13 +
                   'SELECT  '+ #13 +
                   '   DECODE(DECODE(U.NUMAPGR,NULL,U.NODOCUMENTO,U.NUMAPGR),NULL,U.NODOCUMENTO,U.NUMAPGR) AS NUMDOC, '+ #13 +
                   '   U.NUMAPGR, U.NODOCUMENTO AS NODOCUMENTO, '+ #13 +
                   '   U.SALDO, U.CODCENTRORESPON,  '+ #13 +
                   '   CN.NOME, U.IDPLANOPREV, U.IDPATRO, U.TIPOREG, '+ #13 +
                   '   NVL(DECODE(INSTR(''14'',TIPOREG),0,0,U.SALDO),0) AS SALDOANT, '+ #13 +
                   '   NVL(DECODE(INSTR(''23'',TIPOREG),0,0,DECODE(SIGN(U.SALDO),1,U.SALDO,0)),0) AS RECEBIMENTOS, '+ #13 +
                   '   NVL(DECODE(INSTR(''23'',TIPOREG),0,0,DECODE(SIGN(U.SALDO),-1,U.SALDO,0)),0) AS DESEMBOLSOS, '+ #13 +
                   //AL_14
                   '   0 AS SALDODIA, U.IDPESSOA, U.NUMLOTE, U.CODLANCFINANC, 0 AS TIPO, ';
                   if sGrupo = 'Plano/Patro' then
                      sSql :=  sSql + '   CASE WHEN ' + sFlgGrupo + ' = 0 THEN (PT.NOME ||'' - '' ||P.NOME) '+ #13 +
                                      //AL_15
                                      '        WHEN ' + sFlgGrupo + ' = 1 THEN (PT.NOME) '+ #13 +
                                      //AL_15
                                      '        WHEN ' + sFlgGrupo + ' = 2 THEN (P.NOME) '+ #13 +
                                      '   END AS NOMEGRUPO, '+ #13 +
                                      '   U.NOMEFORCLI || DECODE(  '+ #13 +
                                      '                          DECODE(U.IDPATRO,-1,''TOTAL GERAL'', '+ #13 +
                                      '                          DECODE(U.IDPATRO,9999999,''TOTAL GERAL'', '+ #13 +
                                      '                          DECODE(INSTR(''23'',TIPOREG),0,PT.NOME||'' - '' ||P.NOME,''''))),'''','''', '+ #13 +
                                      '                          '' - '' || DECODE(U.IDPATRO, -1, ''TOTAL GERAL'', '+ #13 +
                                      '                                   DECODE(U.IDPATRO, 9999999, ''TOTAL GERAL'', '+ #13 +
                                      '                                   DECODE(INSTR(''23'', TIPOREG), 0, PT.NOME||'' - '' ||P.NOME,'''')))) AS NOMEFORCLI, '+ #13 +
                                      '   (PT.NOME||'' - '' ||P.NOME) AS NOMEPLANOPATRO, '+ #13 +
                                      '   PT.NOME AS PLANO, P.NOME AS PATRO, '
                   else if sGrupo = 'Plano' then
                      sSql :=  sSql + '   CASE WHEN ' + sFlgGrupo + ' = 0 THEN (PT.NOME) '+ #13 +
                                      //AL_15
                                      '        WHEN ' + sFlgGrupo + ' = 1 THEN (PT.NOME) '+ #13 +
                                      '        WHEN ' + sFlgGrupo + ' = 2 THEN ('' '') '+ #13 +
                                      '   END AS NOMEGRUPO, '+ #13 +
                                      '   U.NOMEFORCLI, '+ #13 +
                                      '   (PT.NOME) AS NOMEPLANOPATRO, '+ #13 +
                                      '   PT.NOME AS PLANO, '' '' AS PATRO, '
                   else if sGrupo = 'Patro' then
                      sSql :=  sSql + '   CASE WHEN ' + sFlgGrupo + ' = 0 THEN (P.NOME) '+ #13 +
                                      '        WHEN ' + sFlgGrupo + ' = 1 THEN ('' '') '+ #13 +
                                      //AL_15
                                      '        WHEN ' + sFlgGrupo + ' = 2 THEN (P.NOME) '+ #13 +
                                      '   END AS NOMEGRUPO, '+ #13 +
                                      '   U.NOMEFORCLI, '+ #13 +
                                      '   (P.NOME) AS NOMEPLANOPATRO, '+ #13 +
                                      '   '' '' AS PLANO, P.NOME AS PATRO, ';
                   sSql :=  sSql + '   CASE WHEN ' + sFlgGrupo + ' = 0 THEN (LPAD(U.IDPATRO,20,''0'') || LPAD(U.IDPLANOPREV,20,''0'')) '+ #13 +
                                   '        WHEN ' + sFlgGrupo + ' = 1 THEN (LPAD(''0'',20,''0'') || LPAD(U.IDPLANOPREV,20,''0'')) '+ #13 +
                                   '        WHEN ' + sFlgGrupo + ' = 2 THEN (LPAD(U.IDPATRO,20,''0'') || LPAD(''0'',20,''0'')) '+ #13 +
                                   '   END AS GRUPO '+ #13 +
                   'FROM '+ #13 +
                   '   CENTRESPON CN, ';
                   if sGrupo = 'Plano/Patro' then
                      sSql :=  sSql + ' PESSOA P, PLANPREVCONTABIL PT, '
                   else if sGrupo = 'Plano' then
                      sSql :=  sSql + ' PLANPREVCONTABIL PT, '
                   else if sGrupo = 'Patro' then
                      sSql :=  sSql + ' PESSOA P, ';
                   sSql :=  sSql + '   ( '+ #13 +
                   '    -- (1.0) SALDO ANTERIOR '+ #13 +
                   '    -- TAG SALDOANT_10_I '+ #13 +
                   '    SELECT  '+ #13 +
                   '       ''SALDO INICIAL'' AS NOMEFORCLI, (DECODE(SIGN(SUM(SALDO)),-1,SUM(SALDO),0) + DECODE(SIGN(SUM(SALDO)),1,SUM(SALDO),0))  AS SALDO, '' '' AS NODOCUMENTO, 0 AS NUMAPGR, ';
                   if sGrupo = 'Plano/Patro' then
                      sSql :=  sSql + ' IDPLANOPREV, IDPATRO, '
                   else if sGrupo = 'Plano' then
                      sSql :=  sSql + ' IDPLANOPREV, '' '' AS IDPATRO, '
                   else if sGrupo = 'Patro' then
                      sSql :=  sSql + ' '' '' AS IDPLANOPREV, IDPATRO, ';
                   sSql :=  sSql + '       1 AS TIPOREG, '' '' AS CODCENTRORESPON, IDPESSOA, 0 AS NUMLOTE, 0 AS CODLANCFINANC '+ #13 +
                   '    FROM '+ #13 +
                   '       ( '+ #13 +

                   '        -- (1.1) SALDO ANTERIOR - REGISTROS BAIXADOS E MODULO <> INVESTIMENTOS '+ #13 +
                   '        -- TAG SALDOANT_11_I '+ #13 +
                   '        SELECT '+ #13 +
                   '           ''SALDO INICIAL'' AS NOMEFORCLI, SUM(DECODE(R.RECPAG,''R'',R.VALOR,R.VALOR*-1)) AS SALDO, R.IDPLANOPREV, R.IDPATRO, 0 AS IDFORCLI, 0 AS CODDOCUMENTO, '+ #13 +
                   '           M.IDPESSOA, 0 AS CODTIPDOC, 0 AS IDMODULO, 0 AS NUMAPGR, 1 AS TIPOREG, '' '' AS NODOCUMENTO, '' '' AS HISTORICOCOMPL, '' '' AS CODTIPRECDES, '' '' AS CODCENTRORESPON, ''F'' AS RECPAG '+ #13 +
                   '        FROM '+ #13 +
                   '           MOVIMFINANC M, RATEIOFINANC R, TIPORECEBDESEMB T '+ #13 +
                   '        WHERE '+ #13 +
                   '           (M.DATADISPFINANC > TO_DATE('''+DateToStr(dDataSaldoAnt)+''',''DD/MM/YYYY'')) '+ #13 +
                   '           AND (M.DATADISPFINANC < TO_DATE('''+DateToStr(dDataRef)+''',''DD/MM/YYYY''))  '+ #13 +
                   '           AND (M.IDPESSOA = ' + IntToStr(iPessoa) + ') '+ #13 +
                   '           AND (M.STATUSCONCILIA <> ''C'') '+ #13 +
                   '           AND (M.VALORLANCFINAN <> 0) '+ #13 +
                   '           AND ( NOT EXISTS (SELECT * FROM MOVIMFINANC M1, RECBTOPAGTO R1, DOCUMENTO D1  '+ #13 +
                   '                             WHERE ((M1.CODLANCTRANSF IS NULL) OR (M1.CODLANCTRANSF = 0)) '+ #13 +
                   '                                AND (M1.IDPESSOA = ' + IntToStr(iPessoa) + ') '+ #13 +
                   '                                AND (M1.STATUSCONCILIA <> ''C'') '+ #13 +
                   '                                AND (M.DATADISPFINANC  > TO_DATE('''+DateToStr(dDataSaldoAnt)+''',''DD/MM/YYYY'')) '+ #13 +
                   '                                AND (M.DATADISPFINANC  < TO_DATE('''+DateToStr(dDataRef)+''',''DD/MM/YYYY'')) '+ #13 +
                   '                                AND (D1.IDMODULO = 79) '+ #13 +
                   '                                AND (R1.CODLANCFINANC(+) = M1.CODLANCFINANC) '+ #13 +
                   '                                AND (D1.CODDOCUMENTO(+)   = R1.CODDOCUMENTO) '+ #13 +
                   '                                AND (M1.CODLANCFINANC = M.CODLANCFINANC))) '+ #13 +
                   '           AND ((' + sPatro + ' IS NULL) OR (R.IDPATRO = ' + sPatro + ')) '+ #13 +
                   '           AND ((' + sPlanoPrev + ' IS NULL) OR (R.IDPLANOPREV = ' + sPlanoPrev + ')) '+ #13 +
                   '           AND ((' + sFlgIndRecDes + ' IS NULL) OR (NVL(T.FLGINDICARECDES,''N'') = ' + sFlgIndRecDes + ')) '+ #13 +
                   '           AND (M.CODLANCFINANC = R.CODLANCFINANC) '+ #13 +
                   '           AND (R.CODTIPRECDES = T.CODTIPRECDES) '+ #13 +
                   '           AND (R.IDPESSOA = T.IDPESSOA) '+ #13 +
                   '           AND (R.RECPAG = T.RECPAG)  '+ #13 +
                   '        GROUP BY R.IDPLANOPREV, R.IDPATRO, M.IDPESSOA  '+ #13 +
                   '        -- TAG SALDOANT_11_F '+ #13 +
                   '        UNION ALL'+ #13 +
                   '        -- (1.2) SALDO ANTERIOR - REGISTRO BAIXADOS PELO RECBTO X PAGTO E MODULO <> INVESTIMENTOS  '+ #13 +
                   '        -- TAG SALDOANT_12_I '+ #13 +
                   '        SELECT '+ #13 +
                   '           ''SALDO INICIAL'' AS NOMEFORCLI, SUM(DECODE(R.RECPAG,''R'',R.VALOR,R.VALOR*-1)) AS SALDO, R.IDPLANOPREV, R.IDPATRO, 0 AS IDFORCLI, 0 AS CODDOCUMENTO, '+ #13 +
                   '           M.IDPESSOA, 0 AS CODTIPDOC, 0 AS IDMODULO, 0 AS NUMAPGR, 1 AS TIPOREG, '' '' AS NODOCUMENTO, '' '' AS HISTORICOCOMPL, '' '' AS CODTIPRECDES, '' '' AS CODCENTRORESPON, ''F'' AS RECPAG '+ #13 +
                   '        FROM '+ #13 +
                   '           MOVIMFINANC M, RATEIOFINANC R, TIPORECEBDESEMB T '+ #13 +
                   '        WHERE '+ #13 +
                   '           (M.DATADISPFINANC > TO_DATE('''+DateToStr(dDataSaldoAnt)+''',''DD/MM/YYYY'')) '+ #13 +
                   '           AND (M.DATADISPFINANC < TO_DATE('''+DateToStr(dDataRef)+''',''DD/MM/YYYY'')) '+ #13 +
                   '           AND (M.IDPESSOA = ' + IntToStr(iPessoa) + ') '+ #13 +
                   '           AND (M.STATUSCONCILIA <> ''C'') '+ #13 +
                   '           AND ((M.VALORLANCFINAN = 0) AND (M.CODLANCTRANSF IS NULL)) '+ #13 +
                   '           AND ( NOT EXISTS (SELECT * FROM MOVIMFINANC M1, RECBTOPAGTO R1, DOCUMENTO D1 '+ #13 +
                   '                             WHERE ((M1.CODLANCTRANSF IS NULL) OR (M1.CODLANCTRANSF = 0)) '+ #13 +
                   '                                AND (M1.IDPESSOA = ' + IntToStr(iPessoa) + ') '+ #13 +
                   '                                AND (M1.STATUSCONCILIA <> ''C'') '+ #13 +
                   '                                AND (M.DATADISPFINANC  > TO_DATE('''+DateToStr(dDataSaldoAnt)+''',''DD/MM/YYYY'')) '+ #13 +
                   '                                AND (M.DATADISPFINANC  < TO_DATE('''+DateToStr(dDataRef)+''',''DD/MM/YYYY'')) '+ #13 +
                   '                                AND (D1.IDMODULO = 79) '+ #13 +
                   '                                AND (R1.CODLANCFINANC(+) = M1.CODLANCFINANC) '+ #13 +
                   '                                AND (D1.CODDOCUMENTO(+)  = R1.CODDOCUMENTO) '+ #13 +
                   '                                AND (M1.CODLANCFINANC = M.CODLANCFINANC))) '+ #13 +
                   '           AND ((' + sPatro + ' IS NULL) OR (R.IDPATRO = ' + sPatro + ')) '+ #13 +
                   '           AND ((' + sPlanoPrev + ' IS NULL) OR (R.IDPLANOPREV = ' + sPlanoPrev + ')) '+ #13 +
                   '           AND ((' + sFlgIndRecDes + ' IS NULL) OR (NVL(T.FLGINDICARECDES,''N'') = ' + sFlgIndRecDes + ')) '+ #13 +
                   '           AND (M.CODLANCFINANC = R.CODLANCFINANC) '+ #13 +
                   '           AND (R.CODTIPRECDES = T.CODTIPRECDES) '+ #13 +
                   '           AND (R.IDPESSOA = T.IDPESSOA) '+ #13 +
                   '           AND (R.RECPAG = T.RECPAG) '+ #13 +
                   '        GROUP BY R.IDPLANOPREV, R.IDPATRO, M.IDPESSOA  '+ #13 +
                   '        -- TAG SALDOANT_12_F '+ #13 +
                   '        UNION ALL'+ #13 +
                   '        -- (1.3) SALDO ANTERIOR - REGISTROS TRC ENTRE PLANOS E MODULO <> INVESTIMENTOS '+ #13 +
                   '        -- TAG SALDOANT_13_I  '+ #13 +
                   '        SELECT '+ #13 +
                   '           ''SALDO INICIAL'' AS NOMEFORCLI, SUM(DECODE(R.RECPAG, ''R'', R.VALOR,R.VALOR*-1)) AS SALDO, R.IDPLANOPREV, R.IDPATRO, 0 AS IDFORCLI, 0 AS CODDOCUMENTO, '+ #13 +
                   '           M.IDPESSOA, 0 AS CODTIPDOC, 0 AS IDMODULO, 0 AS NUMAPGR, 1 AS TIPOREG, '' '' AS NODOCUMENTO, '' '' AS HISTORICOCOMPL, '' '' AS CODTIPRECDES, '' '' AS CODCENTRORESPON, ''F'' AS RECPAG '+ #13 +
                   '        FROM '+ #13 +
                   '           MOVIMFINANC M, RATEIOFINANC R, TIPORECEBDESEMB T '+ #13 +
                   '        WHERE '+ #13 +
                   '           (((M.DATALANCFINAN  BETWEEN TO_DATE('''+DateToStr(dDataSaldoAnt)+''',''DD/MM/YYYY'') AND TO_DATE('''+DateToStr(dDataAnt)+''',''DD/MM/YYYY'')) AND (M.DATADISPFINANC IS NULL)) OR '+ #13 +
                   '            ((M.DATALANCFINAN  BETWEEN TO_DATE('''+DateToStr(dDataSaldoAnt)+''',''DD/MM/YYYY'') AND TO_DATE('''+DateToStr(dDataAnt)+''',''DD/MM/YYYY'')) AND (M.DATADISPFINANC BETWEEN TO_DATE('''+DateToStr(dDataSaldoAnt)+''',''DD/MM/YYYY'') AND TO_DATE('''+DateToStr(dDataAnt)+''',''DD/MM/YYYY''))) OR '+ #13 +
                   '            ((M.DATADISPFINANC BETWEEN TO_DATE('''+DateToStr(dDataSaldoAnt)+''',''DD/MM/YYYY'') AND TO_DATE('''+DateToStr(dDataAnt)+''',''DD/MM/YYYY'')))) '+ #13 +
                   '           AND (M.DATADISPFINANC > TO_DATE('''+DateToStr(dDataSaldoAnt)+''',''DD/MM/YYYY'')) '+ #13 +
                   '           AND (M.IDPESSOA = ' + IntToStr(iPessoa) + ') '+ #13 +
                   '           AND (M.STATUSCONCILIA <> ''C'') '+ #13 +
                   '           AND (M.VALORLANCFINAN = 0) '+ #13 +
                   '           AND ((M.CODLANCTRANSF IS NOT NULL) AND (M.CODLANCTRANSF = M.CODLANCFINANC)) '+ #13 +
                   '           AND ( NOT EXISTS (SELECT * FROM MOVIMFINANC M1, RECBTOPAGTO R1, DOCUMENTO D1 '+ #13 +
                   '                             WHERE ((M1.CODLANCTRANSF IS NULL) OR (M1.CODLANCTRANSF = 0)) '+ #13 +
                   '                                AND (M1.IDPESSOA = ' + IntToStr(iPessoa) + ') '+ #13 +
                   '                                AND (M1.IDMODULO <> 3) '+ #13 +
                   '                                AND (M1.STATUSCONCILIA <> ''C'') '+ #13 +
                   '                                AND (((M1.DATALANCFINAN  BETWEEN TO_DATE('''+DateToStr(dDataSaldoAnt)+''',''DD/MM/YYYY'') AND TO_DATE('''+DateToStr(dDataAnt)+''',''DD/MM/YYYY'')) AND (M1.DATADISPFINANC IS NULL)) OR '+ #13 +
                   '                                     ((M1.DATALANCFINAN  BETWEEN TO_DATE('''+DateToStr(dDataSaldoAnt)+''',''DD/MM/YYYY'') AND TO_DATE('''+DateToStr(dDataAnt)+''',''DD/MM/YYYY'')) AND (M1.DATADISPFINANC BETWEEN TO_DATE('''+DateToStr(dDataSaldoAnt)+''',''DD/MM/YYYY'') AND TO_DATE('''+DateToStr(dDataAnt)+''',''DD/MM/YYYY''))) OR '+ #13 +
                   '                                     ((M1.DATADISPFINANC BETWEEN TO_DATE('''+DateToStr(dDataSaldoAnt)+''',''DD/MM/YYYY'') AND TO_DATE('''+DateToStr(dDataAnt)+''',''DD/MM/YYYY'')))) '+ #13 +
                   '                                AND (M1.DATADISPFINANC > TO_DATE('''+DateToStr(dDataSaldoAnt)+''',''DD/MM/YYYY'')) '+ #13 +
                   '                                AND (D1.IDMODULO = 79) '+ #13 +
                   '                                AND (R1.CODLANCFINANC(+) = M1.CODLANCFINANC) '+ #13 +
                   '                                AND (D1.CODDOCUMENTO(+)   = R1.CODDOCUMENTO) '+ #13 +
                   '                                AND (M1.CODLANCFINANC = M.CODLANCFINANC))) '+ #13 +
                   '           AND ((' + sPatro + ' IS NULL) OR (R.IDPATRO = ' + sPatro + ')) '+ #13 +
                   '           AND ((' + sPlanoPrev + ' IS NULL) OR (R.IDPLANOPREV = ' + sPlanoPrev + ')) '+ #13 +
                   '           AND ((' + sFlgIndRecDes + ' IS NULL) OR (NVL(T.FLGINDICARECDES,''N'') = ' + sFlgIndRecDes + ')) '+ #13 +
                   '           AND (M.CODLANCFINANC = R.CODLANCFINANC) '+ #13 +
                   '           AND (R.CODTIPRECDES = T.CODTIPRECDES) '+ #13 +
                   '           AND (R.IDPESSOA = T.IDPESSOA) '+ #13 +
                   '           AND (R.RECPAG = T.RECPAG) '+ #13 +
                   '        GROUP BY R.IDPLANOPREV, R.IDPATRO, M.IDPESSOA '+ #13 +
                   '        -- TAG SALDOANT_13_F '+ #13 +
                   '        UNION ALL '+ #13 +
                   '        -- (1.4) SALDO ANTERIOR - REGISTROS DE CPMF BAIXADOS '+ #13 +
                   '        -- TAG SALDOANT_14_I '+ #13 +
                   '        SELECT '+ #13 +
                   '           ''SALDO INICIAL'' AS NOMEFORCLI, SUM(R.VALOR) * -1 AS SALDO, R.IDPLANOPREV, R.IDPATRO, 0 AS IDFORCLI, 0 AS CODDOCUMENTO, '+ #13 +
                   '           M.IDPESSOA, 0 AS CODTIPDOC, 0 AS IDMODULO, 0 AS NUMAPGR, 1 AS TIPOREG, '' '' AS NODOCUMENTO, '' '' AS HISTORICOCOMPL, '' '' AS CODTIPRECDES, '' '' AS CODCENTRORESPON, ''F'' AS RECPAG '+ #13 +
                   '        FROM '+ #13 +
                   '           MOVIMFINANC M, RATEIOFINANC R, PORTADORCONTA PO, TIPORECEBDESEMB T '+ #13 +
                   '        WHERE '+ #13 +
                   '           (M.CODLANCFINANC IN (SELECT M.CODLANCFINANC FROM MOVIMFINANC M '+ #13 +
                   '                                WHERE (M.IDMODULO = 3) '+ #13 +
                   '                                      AND (IDPESSOA = ' + IntToStr(iPessoa) + ') '+ #13 +
                   '                                      AND (DATALANCFINAN > TO_DATE('''+DateToStr(dDataSaldoAnt)+''',''DD/MM/YYYY'')) '+ #13 +
                   '                                      AND (DATALANCFINAN < TO_DATE('''+DateToStr(dDataRef)+''',''DD/MM/YYYY'')) '+ #13 +
                   '                                      AND (M.CODLANCFINANC IN (SELECT DISTINCT CODLANCFINANC FROM RATEIOFINANC '+ #13 +
                   '                                                               WHERE CODTIPDOC = (SELECT CODTIPDOCCPMF FROM PARAMCAP WHERE IDPESSOA = ' + IntToStr(iPessoa) + ' AND RECPAG = ''P''))))) '+ #13 +
                   '           AND ((' + sPatro + ' IS NULL) OR (R.IDPATRO = ' + sPatro + ')) '+ #13 +
                   '           AND ((' + sPlanoPrev + ' IS NULL) OR (R.IDPLANOPREV = ' + sPlanoPrev + ')) '+ #13 +
                   '           AND ((' + sFlgIndRecDes + ' IS NULL) OR (NVL(T.FLGINDICARECDES,''N'') = ' + sFlgIndRecDes + ')) '+ #13 +
                   '           AND (M.CODLANCFINANC = R.CODLANCFINANC) '+ #13 +
                   '           AND (M.CODPORTADOR = PO.CODPORTADOR) '+ #13 +
                   '           AND (R.CODTIPRECDES = T.CODTIPRECDES) '+ #13 +
                   '           AND (R.IDPESSOA = T.IDPESSOA) '+ #13 +
                   '           AND (R.RECPAG = T.RECPAG) '+ #13 +
                   '        GROUP BY R.IDPLANOPREV,R.IDPATRO,M.IDPESSOA,M.CODPORTADOR '+ #13 +
                   '        -- TAG SALDOANT_14_F '+ #13 +
                   '        UNION ALL '+ #13 +
                   '        -- (1.4.1) SALDO ANTERIOR - CPMF NAO BAIXADOS DE TRANSF ENTRE CONTAS '+ #13 +
                   '        -- TAG SALDOANT_141_I '+ #13 +
                   '        SELECT  '+ #13 +
                   '           ''SALDO INICIAL'' AS NOMEFORCLI, SUM(R.VLRCPMF) * -1 AS SALDO, R.IDPLANOPREV, R.IDPATRO, 0 AS IDFORCLI, 0 AS CODDOCUMENTO, '+ #13 +
                   '           I.IDPESSOA, 0 AS CODTIPDOC, 0 AS IDMODULO, 0 AS NUMAPGR, 1 AS TIPOREG, '' '' AS NODOCUMENTO, '' '' AS HISTORICOCOMPL, '' '' AS CODTIPRECDES, '' '' AS CODCENTRORESPON, ''F'' AS RECPAG '+ #13 +
                   '        FROM '+ #13 +
                   '            IMPOSTORETIDO  I, RATEIOIMPOSTORETIDO R '+ #13 +
                   '        WHERE '+ #13 +
                   '            I.DATARETENCAO > TO_DATE('''+DateToStr(dDataSaldoAnt)+''',''DD/MM/YYYY'') '+ #13 +
                   '            AND I.DATARETENCAO < TO_DATE('''+DateToStr(dDataRef)+''',''DD/MM/YYYY'') '+ #13 +
                   '            AND I.CODTIPOCUSTAGREG = (SELECT CODTIPOCUSTAGREG FROM PARAMFINANC) '+ #13 +
                   '            AND I.CODDOCUMENTO IS NULL '+ #13 +
                   '            AND I.NUMLOTEMANUAL = 0 '+ #13 +
                   '            AND I.CODLANCFINANC IS NOT NULL '+ #13 +
                   '            AND I.IDPESSOA = ' + IntToStr(iPessoa) + ' '+ #13 +
                   '            AND ((' + sPatro + ' IS NULL) OR (R.IDPATRO = ' + sPatro + ')) '+ #13 +
                   '            AND ((' + sPlanoPrev + ' IS NULL) OR (R.IDPLANOPREV = ' + sPlanoPrev + ')) '+ #13 +
                   '            AND (1 = ' + FFlgDocBaixado + ') '+ #13 +
                   '            AND (I.IDIMPOSTORETIDO = R.IDIMPOSTORETIDO) '+ #13 +
                   '        GROUP BY R.IDPLANOPREV,R.IDPATRO, I.IDPESSOA, I.CODPORTADOR, I.IDFORCLI  '+ #13 +
                   '        -- TAG SALDOANT_141_F '+ #13 +
                   '        UNION ALL '+ #13 +
                   '        -- (1.5) SALDO ANTERIOR - REGISTROS DE CPMF NAO BAIXADOS '+ #13 +
                   '        -- TAG SALDOANT_15_I '+ #13 +
                   '        SELECT '+ #13 +
                   '          ''SALDO INICIAL'' AS NOMEFORCLI, SUM(R.VALOR) * -1 AS SALDO, R.IDPLANOPREV, R.IDPATRO, 0 AS IDFORCLI, 0 AS CODDOCUMENTO, '+ #13 +
                   '          D.IDPESSOA, 0 AS CODTIPDOC, 0 AS IDMODULO, 0 AS NUMAPGR, 1 AS TIPOREG, '' '' AS NODOCUMENTO, '' '' AS HISTORICOCOMPL, '' '' AS CODTIPRECDES, '' '' AS CODCENTRORESPON, ''F'' AS RECPAG '+ #13 +
                   '        FROM '+ #13 +
                   '           DOCUMENTO D, LANCTODOCUM L, RATEIODOCUM R, TIPORECEBDESEMB T, '+ #13 +
                   '           (SELECT P.CODTIPDOCCPMF FROM PARAMCAP P WHERE P.IDPESSOA = ' + IntToStr(iPessoa) + ' AND P.RECPAG = ''P'') P '+ #13 +
                   '        WHERE '+ #13 +
                   '           (D.DATAPROGRAMADA > TO_DATE('''+DateToStr(dDataSaldoAnt)+''',''DD/MM/YYYY'')) '+ #13 +
                   '           AND (D.DATAPROGRAMADA < TO_DATE('''+DateToStr(dDataRef)+''',''DD/MM/YYYY'')) '+ #13 +
                   '           AND (D.IDPESSOA = ' + IntToStr(iPessoa) + ') '+ #13 +
                   '           AND (D.RECPAG = ''P'') '+ #13 +
                   '           AND (D.OPERACAO IN (''2 '',''1 '')) '+ #13 +
                   '           AND (D.STATUS <> ''2'') '+ #13 +
                   '           AND ((' + sPatro + ' IS NULL) OR (R.IDPATRO = ' + sPatro + ')) '+ #13 +
                   '           AND ((' + sPlanoPrev + ' IS NULL) OR (R.IDPLANOPREV = ' + sPlanoPrev + ')) '+ #13 +
                   '           AND ((' + sFlgIndRecDes + ' IS NULL) OR (NVL(T.FLGINDICARECDES,''N'') = ' + sFlgIndRecDes + ')) '+ #13 +
                   '           AND (1 = ' + FFlgDocBaixado + ') '+ #13 +
                   '           AND (D.CODTIPDOC = P.CODTIPDOCCPMF) '+ #13 +
                   '           AND (D.CODDOCUMENTO = L.CODDOCUMENTO) '+ #13 +
                   '           AND (D.CODDOCUMENTO = R.CODDOCUMENTO) '+ #13 +
                   '           AND (R.CODTIPRECDES = T.CODTIPRECDES) '+ #13 +
                   '           AND (R.IDPESSOA = T.IDPESSOA) '+ #13 +
                   '           AND (R.RECPAG = T.RECPAG) '+ #13 +
                   '        GROUP BY D.IDFORCLI, D.NUMAPGR, D.COMPLDOCUMENTO, D.NODOCUMENTO, R.IDPLANOPREV, R.IDPATRO, D.IDPESSOA, R.CODCENTRORESPON '+ #13 +
                   '        -- TAG SALDOANT_15_F '+ #13 +
                   '        UNION ALL '+ #13 +
                   '        -- (1.6) SALDO ANTERIOR - REGISTROS DE RECEBIMENTO E MODULO DE INVESTIMENTOS '+ #13 +
                   '        -- TAG SALDOANT_16_I '+ #13 +
                   '        SELECT '+ #13 +
                   '           A.NOMEFORCLI, A.SALDO, A.IDPLANOPREV, A.IDPATRO, A.IDFORCLI, A.CODDOCUMENTO, '+ #13 +
                   '           A.IDPESSOA, A.CODTIPDOC, A.IDMODULO, A.NUMAPGR, A.TIPOREG, A.NODOCUMENTO, L.HISTORICOCOMPL, A.CODTIPRECDES, A.CODCENTRORESPON, A.RECPAG '+ #13 +
                   '        FROM '+ #13 +
                   '           (SELECT '+ #13 +
                   '               ''SALDO INICIAL'' AS NOMEFORCLI, SUM(DECODE(L.DEBCRE,''D'',L.VALOR,L.VALOR * -1)-(DECODE(P.VALOR,NULL,0,P.VALOR))) AS SALDO, R.IDPLANOPREV, R.IDPATRO, D.IDFORCLI, D.CODDOCUMENTO, '+ #13 +
                   '                D.IDPESSOA, D.CODTIPDOC, D.IDMODULO, 0 AS NUMAPGR, 1 AS TIPOREG, DECODE(D.COMPLDOCUMENTO,NULL,TO_CHAR(D.NODOCUMENTO),(TO_CHAR(D.NODOCUMENTO)||''/''||D.COMPLDOCUMENTO)) AS NODOCUMENTO, R.CODTIPRECDES, '' '' AS CODCENTRORESPON, D.RECPAG '+ #13 +
                   '            FROM '+ #13 +
                   '               DOCUMENTO D,LANCTODOCUM L, '+ #13 +
                   '               (SELECT DISTINCT R1.IDPATRO,R1.IDPLANOPREV,R1.CODTIPRECDES, D1.CODDOCUMENTO '+ #13 +
                   '                FROM RATEIODOCUM R1, DOCUMENTO D1, TIPORECEBDESEMB T '+ #13 +
                   '                WHERE '+ #13 +
                   '                    (D1.DATADISPONIB > TO_DATE('''+DateToStr(dDataSaldoAnt)+''',''DD/MM/YYYY'')) '+ #13 +
                   '                    AND (D1.DATADISPONIB < TO_DATE('''+DateToStr(dDataRef)+''',''DD/MM/YYYY'')) '+ #13 +
                   '                    AND (D1.IDPESSOA = ' + IntToStr(iPessoa) + ') '+ #13 +
                   '                    AND (D1.OPERACAO IN (''2 '')) '+ #13 +
                   '                    AND (D1.RECPAG = ''R'') '+ #13 +
                   '                    AND (D1.IDMODULO  = 79) '+ #13 +
                   '                    AND ((' + sPatro + ' IS NULL) OR (R1.IDPATRO = ' + sPatro + ')) '+ #13 +
                   '                    AND ((' + sPlanoPrev + ' IS NULL) OR (R1.IDPLANOPREV = ' + sPlanoPrev + ')) '+ #13 +
                   '                    AND ((' + sFlgIndRecDes + ' IS NULL) OR (NVL(T.FLGINDICARECDES,''N'') = ' + sFlgIndRecDes + ')) '+ #13 +
                   '                    AND (1 = ' + FFlgDocBaixado + ') '+  #13 +
                   '                    AND (R1.CODTIPRECDES = T.CODTIPRECDES) '+ #13 +
                   '                    AND (R1.IDPESSOA = T.IDPESSOA) '+ #13 +
                   '                    AND (R1.RECPAG = T.RECPAG) '+ #13 +
                   '                    AND (D1.CODDOCUMENTO = R1.CODDOCUMENTO)) R, '+ #13 +
                   '                (SELECT LA.CODDOCUMENTO, DECODE(LA.DEBCRE,''C'',LA.VALOR,LA.VALOR * -1) AS VALOR  '+ #13 +
                   '                 FROM RECBTOPAGTO RE, LANCTODOCUM LA  '+ #13 +
                   '                 WHERE  '+ #13 +
                   '                    RE.CODPORTFORMA IN (SELECT CODPORTFORMA FROM PORTADORFORMA WHERE LANCAFINANC = ''N'') '+ #13 +
                   '                    AND LA.DEBCRE = ''D'' '+ #13 +
                   '                    AND LA.NUMLANCTO = RE.NUMLANCTO) P '+ #13 +
                   '            WHERE  '+ #13 +
                   '               (D.DATADISPONIB > TO_DATE('''+DateToStr(dDataSaldoAnt)+''',''DD/MM/YYYY'')) '+ #13 +
                   '                AND (D.DATADISPONIB < TO_DATE('''+DateToStr(dDataRef)+''',''DD/MM/YYYY'')) '+ #13 +
                   '                AND (D.IDPESSOA = ' + IntToStr(iPessoa) + ') '+ #13 +
                   '                AND (NVL(L.VALOR,0) <> 0) '+ #13 +
                   '                AND (D.OPERACAO IN (''2 '')) '+ #13 +
                   '                AND (L.OPERACAO <> 5) '+ #13 +
                   '                AND (D.RECPAG = ''R'') '+ #13 +
                   '                AND (D.IDMODULO  = 79) '+ #13 +
                   '                AND ((' + sPatro + ' IS NULL) OR (R.IDPATRO = ' + sPatro + ')) '+ #13 +
                   '                AND ((' + sPlanoPrev + ' IS NULL) OR (R.IDPLANOPREV = ' + sPlanoPrev + ')) '+ #13 +
                   '                AND (D.CODDOCUMENTO = L.CODDOCUMENTO) '+ #13 +
                   '                AND (D.CODDOCUMENTO = R.CODDOCUMENTO) '+ #13 +
                   '                AND (D.CODDOCUMENTO = P.CODDOCUMENTO(+)) '+ #13 +
                   '            GROUP BY D.IDFORCLI,D.DATAVENCTO,D.COMPLDOCUMENTO,D.NODOCUMENTO, D.DATAPROGRAMADA,L.DATALANCTO,R.CODTIPRECDES, '+ #13 +
                   '                R.IDPLANOPREV,R.IDPATRO,D.RECPAG,D.IDPESSOA,D.OPERACAO, D.CODTIPDOC,D.IDMODULO,D.CODDOCUMENTO  '+ #13 +
                   '            HAVING SUM(NVL(L.VALOR,0)-(DECODE(P.VALOR,NULL,0,P.VALOR))) <> 0) A, LANCTODOCUM L  '+ #13 +
                   '        WHERE A.CODDOCUMENTO = L.CODDOCUMENTO  '+ #13 +
                   '           AND L.OPERACAO NOT IN (''4 '',''5 '') '+ #13 +
                   '        -- TAG SALDOANT_16_F '+ #13 +
                   '        UNION ALL '+ #13 +
                   '        -- (1.7) SALDO ANTERIOR - REGISTROS DE PAGAMENTO E MODULO DE INVESTIMENTOS '+ #13 +
                   '        -- TAG SALDOANT_17_I '+ #13 +
                   '        SELECT '+ #13 +
                   '            A.NOMEFORCLI, A.SALDO, A.IDPLANOPREV, A.IDPATRO, A.IDFORCLI, A.CODDOCUMENTO, A.IDPESSOA, A.CODTIPDOC, A.IDMODULO, A.NUMAPGR, A.TIPOREG, A.NODOCUMENTO, L.HISTORICOCOMPL, A.CODTIPRECDES, A.CODCENTRORESPON, A.RECPAG '+ #13 +
                   '        FROM '+ #13 +
                   '            (SELECT '+ #13 +
                   '                ''SALDO INICIAL'' AS NOMEFORCLI, SUM(DECODE(L.DEBCRE,''D'',L.VALOR,L.VALOR * -1)-(DECODE(P.VALOR,NULL,0,P.VALOR))) AS SALDO, R.IDPLANOPREV, R.IDPATRO, D.IDFORCLI, D.CODDOCUMENTO, '+ #13 +
                   '                D.IDPESSOA, D.CODTIPDOC, D.IDMODULO, 0 AS NUMAPGR, 1 AS TIPOREG, DECODE(D.COMPLDOCUMENTO,NULL,TO_CHAR(D.NODOCUMENTO),(TO_CHAR(D.NODOCUMENTO)||''/''||D.COMPLDOCUMENTO)) AS NODOCUMENTO, R.CODTIPRECDES, '' '' AS CODCENTRORESPON, D.RECPAG '+ #13 +
                   '             FROM '+ #13 +
                   '                DOCUMENTO D,LANCTODOCUM L, '+ #13 +
                   '                (SELECT DISTINCT R1.IDPATRO,R1.IDPLANOPREV,R1.CODTIPRECDES, D1.CODDOCUMENTO  '+ #13 +
                   '                 FROM RATEIODOCUM R1, DOCUMENTO D1, TIPORECEBDESEMB T '+ #13 +
                   '                 WHERE '+ #13 +
                   '                    (D1.DATADISPONIB > TO_DATE('''+DateToStr(dDataSaldoAnt)+''',''DD/MM/YYYY'')) '+ #13 +
                   '                    AND (D1.DATADISPONIB < TO_DATE('''+DateToStr(dDataRef)+''',''DD/MM/YYYY'')) '+ #13 +
                   '                    AND (D1.IDPESSOA = ' + IntToStr(iPessoa) + ') '+ #13 +
                   '                    AND (D1.OPERACAO IN (''2 '')) '+ #13 +
                   '                    AND (D1.RECPAG = ''P'') '+ #13 +
                   '                    AND (D1.IDMODULO  = 79) '+ #13 +
                   '                    AND ((' + sPatro + ' IS NULL) OR (R1.IDPATRO = ' + sPatro + ')) '+ #13 +
                   '                    AND ((' + sPlanoPrev + ' IS NULL) OR (R1.IDPLANOPREV = ' + sPlanoPrev + ')) '+ #13 +
                   '                    AND ((' + sFlgIndRecDes + ' IS NULL) OR (NVL(T.FLGINDICARECDES,''N'') = ' + sFlgIndRecDes + ')) '+ #13 +
                   '                    AND (1 = ' + FFlgDocBaixado + ') '+ #13 +
                   '                    AND (R1.CODTIPRECDES = T.CODTIPRECDES) '+ #13 +
                   '                    AND (R1.IDPESSOA = T.IDPESSOA) '+ #13 +
                   '                    AND (R1.RECPAG = T.RECPAG) '+ #13 +
                   '                    AND (D1.CODDOCUMENTO = R1.CODDOCUMENTO)) R, '+ #13 +
                   '                (SELECT LA.CODDOCUMENTO, DECODE(LA.DEBCRE,''C'',LA.VALOR,LA.VALOR * -1) AS VALOR '+ #13 +
                   '                 FROM RECBTOPAGTO RE, LANCTODOCUM LA '+ #13 +
                   '                 WHERE '+ #13 +
                   '                    RE.CODPORTFORMA IN (SELECT CODPORTFORMA FROM PORTADORFORMA WHERE LANCAFINANC = ''N'') '+ #13 +
                   '                    AND LA.DEBCRE = ''D'' '+ #13 +
                   '                 AND LA.NUMLANCTO = RE.NUMLANCTO) P '+ #13 +
                   '             WHERE '+ #13 +
                   '                (D.DATADISPONIB > TO_DATE('''+DateToStr(dDataSaldoAnt)+''',''DD/MM/YYYY'')) '+ #13 +
                   '                AND (D.DATADISPONIB < TO_DATE('''+DateToStr(dDataRef)+''',''DD/MM/YYYY'')) '+ #13 +
                   '                AND (D.IDPESSOA = ' + IntToStr(iPessoa) + ') '+ #13 +
                   '                AND (NVL(L.VALOR,0) <> 0) '+ #13 +
                   '                AND (D.OPERACAO IN (''2 '')) '+ #13 +
                   '                AND (L.OPERACAO <> 5) '+ #13 +
                   '                -- Arnaldo V. Scarin - 20/01/2010 - Inicio'+ #13 +
                   '                AND NOT Exists (Select 1 From DocumxDocum dxd'+ #13 +
                   '                                where dxd.iddocumento = d.coddocumento'+ #13 +
                   '                                  and dxd.flgdispfinanc = ''S'')'+ #13 +
                   '                -- Arnaldo V. Scarin - 20/01/2010 - Fim'+ #13 +
                   '                AND (D.RECPAG = ''P'') '+ #13 +
                   '                AND (D.IDMODULO  = 79) '+ #13 +
                   '                AND ((' + sPatro + ' IS NULL) OR (R.IDPATRO = ' + sPatro + ')) '+ #13 +
                   '                AND ((' + sPlanoPrev + ' IS NULL) OR (R.IDPLANOPREV = ' + sPlanoPrev + ')) '+ #13 +
                   '                AND (D.CODDOCUMENTO = L.CODDOCUMENTO) '+ #13 +
                   '                AND (D.CODDOCUMENTO = R.CODDOCUMENTO) '+ #13 +
                   '                AND (D.CODDOCUMENTO = P.CODDOCUMENTO(+)) '+ #13 +
                   '             GROUP BY D.IDFORCLI,D.DATAVENCTO,D.COMPLDOCUMENTO,D.NODOCUMENTO, D.DATAPROGRAMADA,L.DATALANCTO,R.CODTIPRECDES, '+ #13 +
                   '                R.IDPLANOPREV,R.IDPATRO,D.RECPAG,D.IDPESSOA,D.OPERACAO, D.CODTIPDOC,D.IDMODULO,D.CODDOCUMENTO '+ #13 +
                   '             HAVING SUM(NVL(L.VALOR,0)-(DECODE(P.VALOR,NULL,0,P.VALOR))) <> 0) A, LANCTODOCUM L '+ #13 +
                   '        WHERE A.CODDOCUMENTO = L.CODDOCUMENTO '+ #13 +
                   '           AND L.OPERACAO NOT IN (''4 '',''5 '') '+ #13 +
                   '        -- TAG SALDOANT_17_F '+ #13 +
                   '        UNION ALL '+ #13 +
                   '        -- (1.8) SALDO ANTERIOR - REGISTROS DE PAGAMENTO E RECEBIMENTO NAO BAIXADOS E MODULO <> INVESTIMENTOS '+ #13 +
                   '        -- TAG SALDOANT_18_I '+ #13 +
                   '        SELECT '+ #13 +
                   '           ''SALDO INICIAL'' AS NOMEFORCLI,  SUM(((R.VALOR*S.SALDO)/L.VALOR)-(DECODE(P.VALOR,NULL,0,P.VALOR))) AS SALDO, R.IDPLANOPREV, R.IDPATRO, D.IDFORCLI, D.CODDOCUMENTO, '+ #13 +
                   '           D.IDPESSOA, D.CODTIPDOC, D.IDMODULO, 0 AS NUMAPGR, 1 AS TIPOREG, DECODE(D.COMPLDOCUMENTO,NULL,TO_CHAR(D.NODOCUMENTO),  '+ #13 +
                   '          (TO_CHAR(D.NODOCUMENTO)||''/''||D.COMPLDOCUMENTO)) AS NODOCUMENTO, L.HISTORICOCOMPL, R.CODTIPRECDES, '' '' AS CODCENTRORESPON, R.RECPAG '+ #13 +
                   '        FROM '+ #13 +
                   '           DOCUMENTO D,LANCTODOCUM L,RATEIODOCUM R, TIPORECEBDESEMB T, '+ #13 +
                   '           (SELECT P.CODTIPDOCCPMF FROM PARAMCAP P WHERE P.IDPESSOA = 1 AND P.RECPAG = ''P'') P, '+ #13 +
                   '           (SELECT D.CODDOCUMENTO, SUM(DECODE(L.DEBCRE,''D'',L.VALOR,L.VALOR*-1)) AS SALDO '+ #13 +
                   '            FROM DOCUMENTO D, LANCTODOCUM L '+ #13 +
                   '            WHERE (D.OPERACAO IN (''2 '')) '+ #13 +
                   '               AND (D.RECPAG = ''P'') '+ #13 +
                   '               AND (D.IDPESSOA = ' + IntToStr(iPessoa) + ') '+ #13 +
                   '               AND (L.OPERACAO <> 5) '+ #13 +
                   '               AND (D.CODDOCUMENTO = L.CODDOCUMENTO) '+ #13 +
                   '            GROUP BY D.CODDOCUMENTO) S, '+ #13 +
                   '           (SELECT LA.CODDOCUMENTO, DECODE(LA.DEBCRE,''D'',LA.VALOR * -1,LA.VALOR) AS VALOR '+ #13 +
                   '            FROM RECBTOPAGTO RE, LANCTODOCUM LA '+ #13 +
                   '            WHERE '+ #13 +
                   '               RE.CODPORTFORMA IN (SELECT CODPORTFORMA FROM PORTADORFORMA WHERE LANCAFINANC = ''N'') '+ #13 +
                   '               AND LA.DEBCRE = ''D'' '+ #13 +
                   '               AND LA.NUMLANCTO = RE.NUMLANCTO) P '+ #13 +
                   '        WHERE '+ #13 +
                   '           (D.DATAPROGRAMADA > TO_DATE('''+DateToStr(dDataSaldoAnt)+''',''DD/MM/YYYY'')) '+ #13 +
                   '           AND (D.DATAPROGRAMADA < TO_DATE('''+DateToStr(dDataRef)+''',''DD/MM/YYYY'')) '+ #13 +
                   '           AND (D.IDPESSOA = ' + IntToStr(iPessoa) + ') '+ #13 +
                   '           AND (NVL(L.VALOR,0) <> 0) '+ #13 +
                   '           AND (D.OPERACAO IN (''2 '')) '+ #13 +
                   '           AND (D.STATUS <> 2) '+ #13 +
                   '           AND (D.RECPAG = ''P'') '+ #13 +
                   '           AND (L.OPERACAO <> 5) '+ #13 +
                   '           AND (D.IDMODULO  <> 79) '+ #13 +
                   '           -- Arnaldo V. Scarin - 20/01/2010 - Inicio'+ #13 +
                   '           AND NOT Exists (Select 1 From DocumxDocum dxd'+ #13 +
                   '                           where dxd.iddocumento = d.coddocumento'+ #13 +
                   '                             and dxd.flgdispfinanc = ''S'')'+ #13 +
                   '           -- Arnaldo V. Scarin - 20/01/2010 - Fim'+ #13 +
                   '           AND (D.CODTIPDOC <> P.CODTIPDOCCPMF) '+ #13 +
                   '           AND ((' + sPatro + ' IS NULL) OR (R.IDPATRO = ' + sPatro + ')) '+ #13 +
                   '           AND ((' + sPlanoPrev + ' IS NULL) OR (R.IDPLANOPREV = ' + sPlanoPrev + ')) '+ #13 +
                   '           AND ((' + sFlgIndRecDes + ' IS NULL) OR (NVL(T.FLGINDICARECDES,''N'') = ' + sFlgIndRecDes + ')) '+ #13 +
                   '           AND (1 = ' + FFlgDocBaixado + ') '+ #13 +
                   '           AND (D.CODDOCUMENTO = L.CODDOCUMENTO) '+ #13 +
                   '           AND (D.OPERACAO = L.OPERACAO) '+ #13 +
                   '           AND (D.CODDOCUMENTO = R.CODDOCUMENTO) '+ #13 +
                   '           AND (D.CODDOCUMENTO = S.CODDOCUMENTO) '+ #13 +
                   '           AND (D.CODDOCUMENTO = P.CODDOCUMENTO(+)) '+ #13 +
                   '           AND (R.CODTIPRECDES = T.CODTIPRECDES) '+ #13 +
                   '           AND (R.IDPESSOA = T.IDPESSOA) '+ #13 +
                   '           AND (R.RECPAG = T.RECPAG) '+ #13 +
                   '        GROUP BY D.IDFORCLI,D.DATAVENCTO,D.COMPLDOCUMENTO,D.NODOCUMENTO, D.DATAPROGRAMADA,L.HISTORICOCOMPL,L.DATALANCTO,R.CODTIPRECDES, '+ #13 +
                   '           R.IDPLANOPREV,R.IDPATRO,R.RECPAG,D.IDPESSOA,D.OPERACAO, D.CODTIPDOC,D.IDMODULO,D.CODDOCUMENTO '+ #13 +
                   '        HAVING SUM(((R.VALOR*S.SALDO)/L.VALOR)-(DECODE(P.VALOR,NULL,0,P.VALOR))) <> 0 '+ #13 +
                   '        -- TAG SALDOANT_18_F '+ #13 +
                   '        UNION ALL '+ #13 +
                   '        -- (1.9) SALDO ANTERIOR - REGISTROS DE INSS '+ #13 +
                   '        -- TAG SALDOANT_19_I  '+ #13 +
                   '        SELECT DISTINCT '+ #13 +
                   '              ''SALDO INICIAL'' AS NOMEFORCLI, (X.SALDO * -1) AS SALDO, R.IDPLANOPREV, R.IDPATRO, 0 AS IDFORCLI, 0 AS CODDOCUMENTO, '+ #13 +
                   '              D.IDPESSOA, 0 AS CODTIPDOC, 0 AS IDMODULO, 0 AS NUMAPGR, 1 AS TIPOREG, '' '' AS NODOCUMENTO, '' '' AS HISTORICOCOMPL, '' '' AS CODTIPRECDES, '' '' AS CODCENTRORESPON, ''F'' AS RECPAG '+ #13 +
                   '        FROM '+ #13 +
                   '           DOCUMENTO D,LANCTODOCUM L,RATEIODOCUM R, TIPORECEBDESEMB T, '+ #13 +
                   '           ( '+ #13 +
                   '            -- (1.9.1) REGISTROS QUE NAO ESTAO EM GPS '+ #13 +
                   '            -- TAG SALDOANT_191_I '+ #13 +
                   '            SELECT DISTINCT '+ #13 +
                   '               L.DATALANCTO AS DATALANCTO, D.IDFORCLI AS IDFORCLI, P.RAZAOSOCIAL AS RAZAOSOCIAL, D.CODDOCUMENTO, L.NUMLANCTO, DECODE(L.DEBCRE, ''D'', L.VALOR, L.VALOR*-1) AS SALDO, D.OPERACAO, D.NUMFATURA, T.PLACONTA, D.NODOCUMENTO '+ #13 +
                   '            FROM '+ #13 +
                   //AL_16
                   '               PESSOA P, DOCUMENTO D, LANCTODOCUM L, TIPOALTERADOR T, RATEIODOCUM R, LANCIRRF N '+ #13 +
                   '            WHERE '+ #13 +
                   '               (L.DATALANCTO >= TO_DATE('''+DateToStr(dDataIniMesAnt)+''',''DD/MM/YYYY'')) '+ #13 +
                   '               AND (L.DATALANCTO <= TO_DATE('''+DateToStr(dDataFimMesAnt)+''',''DD/MM/YYYY'')) '+ #13 +
                   '               AND (L.OPERACAO      = ''4'') '+ #13 +
                   '               AND (D.IDPESSOA      = ' + IntToStr(iPessoa) + ') '+ #13 +
                   '               AND (D.RECPAG        = ''P'') '+ #13 +
                   '               AND (L.CODDOCINSS   IS NULL) '+ #13 +
                   //AL_16
                   '               AND (N.IDDOCINSS IS NULL) '+ #13 +
                   //AL_18
                   '            AND (NVL(N.VLRINSS,0) <> 0) '+ #13 +
                   '               AND (L.ESTORNO      IS NULL) '+ #13 +
                   '               AND (L.CODALTERADOR IN (SELECT CODALTERADOR FROM ALTXIMPOSTO WHERE CODIMPOSTO = 2)) '+ #13 +
                   '               AND ((' + sPatro + ' IS NULL) OR (R.IDPATRO = ' + sPatro + ')) '+ #13 +
                   '               AND ((' + sPlanoPrev + ' IS NULL) OR (R.IDPLANOPREV = ' + sPlanoPrev + ')) '+ #13 +
                   '               AND (1 = ' + FFlgDocBaixado + ') '+ #13 +
                   '               AND (D.CODDOCUMENTO  = L.CODDOCUMENTO) '+ #13 +
                   '               AND (P.IDPESSOA      = D.IDFORCLI) '+ #13 +
                   '               AND (L.CODALTERADOR  = T.CODALTERADOR) '+ #13 +
                   '               AND (D.CODDOCUMENTO = R.CODDOCUMENTO)'+ #13 +
                   //AL_16
                   '               AND (D.CODDOCUMENTO  = N.CODDOCUMENTO(+)) '+ #13 +
                   '           -- TAG SALDOANT_191_F '+ #13 +
                   //AL_19
                   '            ) X '+ #13 +
                   '        WHERE '+ #13 +
                   '           (1 = ' + IntToStr(iSaldoAntINSS) + ') '+ #13 +
                   '           AND ((' + sPatro + ' IS NULL) OR (R.IDPATRO = ' + sPatro + ')) '+ #13 +
                   '           AND ((' + sPlanoPrev + ' IS NULL) OR (R.IDPLANOPREV = ' + sPlanoPrev + ')) '+ #13 +
                   '           AND ((' + sFlgIndRecDes + ' IS NULL) OR (NVL(T.FLGINDICARECDES,''N'') = ' + sFlgIndRecDes + ')) '+ #13 +
                   '           AND (D.CODDOCUMENTO = X.CODDOCUMENTO) '+ #13 +
                   '           AND (D.CODDOCUMENTO = L.CODDOCUMENTO) '+ #13 +
                   '           AND (D.CODDOCUMENTO = R.CODDOCUMENTO) '+ #13 +
                   '           AND (L.NUMLANCTO = X.NUMLANCTO) '+ #13 +
                   '           AND (R.CODTIPRECDES = T.CODTIPRECDES) '+ #13 +
                   '           AND (R.IDPESSOA = T.IDPESSOA) '+ #13 +
                   '           AND (R.RECPAG = T.RECPAG) '+ #13 +
                   '        -- TAG SALDOANT_19_F '+ #13 +
                   '        UNION ALL'+ #13 +
                   '        -- (1.10) REGISTRO DE PAGAMENTOS ENGLOBADOS NAO BAIXADOS E MODULO <> INVESTIMENTOS '+ #13 +
                   '        -- TAG SALDOANT_110_I '+ #13 +
                   '        SELECT '+ #13 +
                   '           ''SALDO INICIAL'' AS NOMEFORCLI, SUM(A.SALDO) AS SALDO, A.IDPLANOPREV, A.IDPATRO, 0 AS IDFORCLI, '+ #13 +
                   '           0 AS CODDOCUMENTO, A.IDPESSOA, 0 AS CODTIPDOC, 0 AS IDMODULO, 0 AS NUMAPGR, 1 AS TIPOREG, '' '' AS NODOCUMENTO, '' '' AS HISTORICOCOMPL, '' '' AS CODTIPRECDES, '' '' AS CODCENTRORESPON, ''F'' AS RECPAG '+ #13 +
                   '        FROM '+ #13 +
                   '           (SELECT '+ #13 +
                   '               '' '' AS NOMEFORCLI, (SUM(((R.VALORRAT*S.SALDODOC)/abs(SS.SALDOTOT))))-((SUM(((R.VALORRAT*S.SALDODOC)/abs(SS.SALDOTOT))) * C.SALDOALT)/SS.SALDOTOT) AS SALDO, '+ #13 +
                   '               R.IDPLANOPREV, R.IDPATRO, D.IDFORCLI, D.CODDOCUMENTO, D.IDPESSOA, D.CODTIPDOC, D.IDMODULO, D.NUMAPGR, '' '' AS TIPOREG, DECODE(D.COMPLDOCUMENTO,NULL,TO_CHAR(D.NODOCUMENTO),(TO_CHAR(D.NODOCUMENTO)||''/''||D.COMPLDOCUMENTO)) AS NODOCUMENTO, '+ #13 +
                   '               L.HISTORICOCOMPL, R.CODTIPRECDES, R.CODCENTRORESPON, D.DATAPROGRAMADA, D.DATAVENCTO, L.DATALANCTO, R.RECPAG, D.NUMFATURA,  SS.SALDOTOT, C.SALDOALT '+ #13 +
                   '            FROM '+ #13 +
                   '               DOCUMENTO D, LANCTODOCUM L, '+ #13 +
                   '               (SELECT '+ #13 +
                   '                   D.NUMFATURA, SUM(DECODE(L.DEBCRE,''D'',L.VALOR,L.VALOR*-1)) AS SALDOTOT '+ #13 +
                   '                FROM DOCUMENTO D, LANCTODOCUM L '+ #13 +
                   '                WHERE (D.OPERACAO IN (''1 '')) '+ #13 +
                   '                   AND (D.IDPESSOA = ' + IntToStr(iPessoa) + ') '+ #13 +
                   '                   AND (D.RECPAG = ''P'') '+ #13 +
                   '                   AND (D.NUMFATURA IS NOT NULL) '+ #13 +
                   '                   AND (D.OPERACAO = L.OPERACAO) '+ #13 +
                   '                   AND (D.CODDOCUMENTO = L.CODDOCUMENTO) '+ #13 +
                   '                GROUP BY D.NUMFATURA) SS, '+ #13 +
                   '               (SELECT D.CODDOCUMENTO, SUM(DECODE(L.DEBCRE,''D'',L.VALOR,L.VALOR*-1)) AS SALDODOC '+ #13 +
                   '                FROM DOCUMENTO D, LANCTODOCUM L '+ #13 +
                   '                WHERE '+ #13 +
                   '                   (D.OPERACAO IN (''1 '')) '+ #13 +
                   '                   AND (D.IDPESSOA = ' + IntToStr(iPessoa) + ') '+ #13 +
                   '                   AND (D.RECPAG = ''P'') '+ #13 +
                   '                   AND (L.OPERACAO <> 5) '+ #13 +
                   '                   AND (D.CODDOCUMENTO = L.CODDOCUMENTO) '+ #13 +
                   '                GROUP BY D.CODDOCUMENTO) S, '+ #13 +
                   '               (SELECT '+ #13 +
                   '                   D.NUMFATURA, R.CODTIPRECDES, R.IDPLANOPREV, R.IDPATRO, R.IDPESSOA, R.RECPAG, SUM(R.VALOR) AS VALORRAT,R.CODCENTRORESPON '+ #13 +
                   '                FROM DOCUMENTO D, RATEIODOCUM R, TIPORECEBDESEMB T '+ #13 +
                   '                WHERE '+ #13 +
                   '                   (D.OPERACAO IN (''1 '')) '+ #13 +
                   '                   AND (D.IDPESSOA = ' + IntToStr(iPessoa) + ') '+ #13 +
                   '                   AND (D.RECPAG = ''P'') '+ #13 +
                   '                   AND (D.NUMFATURA IS NOT NULL) '+ #13 +
                   '                   AND (D.CODDOCUMENTO = R.CODDOCUMENTO) '+ #13 +
                   '                   AND ((' + sFlgIndRecDes + ' IS NULL) OR (NVL(T.FLGINDICARECDES,''N'') = ' + sFlgIndRecDes + ')) '+ #13 +
                   '                   AND (R.CODTIPRECDES = T.CODTIPRECDES) '+ #13 +
                   '                   AND (R.IDPESSOA = T.IDPESSOA) '+ #13 +
                   '                   AND (R.RECPAG = T.RECPAG) '+ #13 +
                   '                GROUP BY R.CODTIPRECDES, R.IDPLANOPREV, R.IDPATRO, R.IDPESSOA, R.RECPAG, D.NUMFATURA,R.CODCENTRORESPON) R, '+ #13 +
                   '            (SELECT '+ #13 +
                   '                D.NUMFATURA, (SUM(DECODE(L.DEBCRE,''D'',L.VALOR,L.VALOR*-1))* -1) AS SALDOALT '+ #13 +
                   '             FROM DOCUMENTO D, LANCTODOCUM L '+ #13 +
                   '             WHERE  '+ #13 +
                   '                (D.OPERACAO IN (''3 '')) '+ #13 +
                   '                AND (D.IDPESSOA = ' + IntToStr(iPessoa) + ') '+ #13 +
                   '                AND (D.RECPAG = ''P'') '+ #13 +
                   '                AND (L.OPERACAO NOT IN (''5 '',''3 '')) '+ #13 +
                   '                AND (D.CODDOCUMENTO = L.CODDOCUMENTO) '+ #13 +
                   '             GROUP BY D.NUMFATURA) C, '+ #13 +
                   '               (SELECT  '+ #13 +
                   '                   D.NUMFATURA, D.DATAPROGRAMADA, DECODE(D.COMPLDOCUMENTO,NULL,TO_CHAR(D.NODOCUMENTO),(TO_CHAR(D.NODOCUMENTO)||''/''||D.COMPLDOCUMENTO)) AS NODOCUMENTO '+ #13 +
                   '                FROM DOCUMENTO D  '+ #13 +
                   '                WHERE '+ #13 +
                   '                   (D.OPERACAO IN (''3 '')) '+ #13 +
                   '                   AND (D.IDPESSOA = ' + IntToStr(iPessoa) + ') '+ #13 +
                   '                   AND (D.RECPAG = ''P'') '+ #13 +
                   '                   AND (D.NUMFATURA IS NOT NULL)) X  '+ #13 +
                   '            WHERE  '+ #13 +
                   '               (X.DATAPROGRAMADA > TO_DATE('''+DateToStr(dDataSaldoAnt)+''',''DD/MM/YYYY'')) '+ #13 +
                   '               AND (X.DATAPROGRAMADA < TO_DATE('''+DateToStr(dDataRef)+''',''DD/MM/YYYY'')) '+ #13 +
                   '               AND (D.RECPAG = ''P'') '+ #13 +
                   '               AND (NVL(SS.SALDOTOT,0) <> 0 ) '+ #13 +
                   '               AND (D.STATUS <> ''2'') '+ #13 +
                   '               AND (D.OPERACAO IN (''1 '')) '+ #13 +
                   '               AND (L.OPERACAO <> 5) '+ #13 +
                   '               -- Arnaldo V. Scarin - 20/01/2010 - Inicio'+ #13 +
                   '               AND NOT Exists (Select 1 From DocumxDocum dxd'+ #13 +
                   '                               where dxd.iddocumento = d.coddocumento'+ #13 +
                   '                                 and dxd.flgdispfinanc = ''S'')'+ #13 +
                   '               -- Arnaldo V. Scarin - 20/01/2010 - Fim'+ #13 +
                   '               AND (D.IDMODULO <> 79) '+ #13 +
                   '               AND (D.IDPESSOA = ' + IntToStr(iPessoa) + ') '+ #13 +
                   '               AND (1 = ' + FFlgDocBaixado + ') '+ #13 +
                   '               AND ((' + sPatro + ' IS NULL) OR (R.IDPATRO = ' + sPatro + ')) '+ #13 +
                   '               AND ((' + sPlanoPrev + ' IS NULL) OR (R.IDPLANOPREV = ' + sPlanoPrev + ')) '+ #13 +
                   '               AND (D.CODDOCUMENTO NOT IN (SELECT DISTINCT CODDOCUMENTO FROM LOTEXDOCUM)) '+ #13 +
                   '               AND (D.CODDOCUMENTO = L.CODDOCUMENTO) '+ #13 +
                   '               AND (D.OPERACAO = L.OPERACAO) '+ #13 +
                   '               AND (D.NUMFATURA = R.NUMFATURA) '+ #13 +
                   '               AND (D.CODDOCUMENTO = S.CODDOCUMENTO) '+ #13 +
                   '               AND (D.NUMFATURA = SS.NUMFATURA) '+ #13 +
                   '               AND (D.NUMFATURA = C.NUMFATURA(+)) '+ #13 +
                   '               AND (D.NUMFATURA = X.NUMFATURA) '+ #13 +
                   '            GROUP BY D.IDFORCLI, D.DATAVENCTO, D.COMPLDOCUMENTO, D.NODOCUMENTO, D.DATAPROGRAMADA, '+ #13 +
                   '                    L.HISTORICOCOMPL, L.DATALANCTO, R.CODTIPRECDES, R.IDPLANOPREV, R.IDPATRO, '+ #13 +
                   '                    R.RECPAG, D.IDPESSOA, D.OPERACAO, D.CODTIPDOC, D.IDMODULO, D.CODDOCUMENTO, '+ #13 +
                   '                    R.CODCENTRORESPON, D.NUMAPGR, D.NUMFATURA, SS.SALDOTOT, C.SALDOALT) A, '+ #13 +
                   '           (SELECT '+ #13 +
                   '               D.CODDOCUMENTO, D.NUMFATURA, D.DATAPROGRAMADA,  DECODE(D.COMPLDOCUMENTO,NULL,TO_CHAR(D.NODOCUMENTO),(TO_CHAR(D.NODOCUMENTO)||''/''||D.COMPLDOCUMENTO)) AS NODOCUMENTO, L.HISTORICOCOMPL '+ #13 +
                   '            FROM DOCUMENTO D, LANCTODOCUM L '+ #13 +
                   '            WHERE '+ #13 +
                   '               (D.OPERACAO IN (''3 '')) '+ #13 +
                   '               AND (D.IDPESSOA = ' + IntToStr(iPessoa) + ') '+ #13 +
                   '               AND (D.RECPAG = ''P'') '+ #13 +
                   '               AND (D.NUMFATURA IS NOT NULL) '+ #13 +
                   '               AND (L.OPERACAO = 3 ) '+ #13 +
                   '               AND (D.CODDOCUMENTO = L.CODDOCUMENTO) '+ #13 +
                   '            UNION '+ #13 +
                   '            SELECT '+ #13 +
                   '               D.CODDOCUMENTO, D.NUMFATURA, D.DATAPROGRAMADA,  DECODE(D.COMPLDOCUMENTO,NULL,TO_CHAR(D.NODOCUMENTO),(TO_CHAR(D.NODOCUMENTO)||''/''||D.COMPLDOCUMENTO)) AS NODOCUMENTO, L.HISTORICOCOMPL '+ #13 +
                   '            FROM '+ #13 +
                   '               DOCUMENTO D, LANCTODOCUM L '+ #13 +
                   '            WHERE '+ #13 +
                   '               (D.OPERACAO IN (''3 '')) '+ #13 +
                   '               AND (D.IDPESSOA = ' + IntToStr(iPessoa) + ') '+ #13 +
                   '               AND (D.RECPAG = ''P'') '+ #13 +
                   '               AND (D.NUMFATURA IS NOT NULL) '+ #13 +
                   '               AND (L.OPERACAO = 5) '+ #13 +
                   '               AND (L.ESTORNO IS NULL) '+ #13 +
                   '               AND (D.CODDOCUMENTO = L.CODDOCUMENTO)) B  '+ #13 +
                   '        WHERE  '+ #13 +
                   '            A.NUMFATURA=B.NUMFATURA(+) '+ #13 +
                   '             AND (B.CODDOCUMENTO NOT IN (SELECT DISTINCT CODDOCUMENTO FROM LOTEXDOCUM)) '+ #13 +
                   '             AND (B.CODDOCUMENTO NOT IN (SELECT DISTINCT CODDOCUMENTO FROM RECBTOPAGTO)) '+ #13 +
                   '        GROUP BY A.NOMEFORCLI, A.IDPLANOPREV, A.IDPATRO, A.IDFORCLI, A.IDPESSOA, A.CODTIPDOC, '+ #13 +
                   '            A.IDMODULO, A.NUMAPGR, A.TIPOREG, B.NODOCUMENTO, B.HISTORICOCOMPL, A.CODTIPRECDES, A.CODCENTRORESPON, A.RECPAG '+ #13 +
                   '        -- TAG SALDOANT_110_F '+ #13 +
                   '      UNION ALL '+ #13 +
                   '        -- (1.11) REGISTROS DE IRRF QUE NAO ESTAO EM DARF GERADO DA SEMANA ANTERIOR '+ #13 +
                   '        -- TAG SALDOANT_111_I '+ #13 +
                   '        SELECT DISTINCT  '+ #13 +
                   '           ''SALDO INICIAL'' AS NOMEFORCLI, (S.VALOR*-1) AS SALDO, R.IDPLANOPREV, R.IDPATRO, D.IDFORCLI, '+ #13 +
                   '           D.CODDOCUMENTO, D.IDPESSOA, D.CODTIPDOC, D.IDMODULO, 0 AS NUMAPGR, 1 AS TIPOREG, '' '' AS NODOCUMENTO, '' '' AS HISTORICOCOMPL, '' '' AS CODTIPRECDES, '' '' AS CODCENTRORESPON, ''F'' AS RECPAG '+ #13 +
                   '        FROM '+ #13 +
                   '           DOCUMENTO D, LANCIRRF I, LANCTODOCUM L, RATEIODOCUM R, TIPORECEBDESEMB T, '+ #13 +
                   '           (SELECT CODALTERADOR FROM ALTXIMPOSTO WHERE CODIMPOSTO=1) X, '+ #13 +
                   '           (SELECT  '+ #13 +
                   '               L.CODDOCUMENTO,L.CODALTERADOR,L.VALOR,L.NUMLANCTO  '+ #13 +
                   '            FROM '+ #13 +
                   '               LANCTODOCUM L, DOCUMENTO D '+ #13 +
                   '            WHERE '+ #13 +
                   '               (D.DATAVENCTO BETWEEN TO_DATE('''+DateToStr(dDataIniIRRF)+''',''DD/MM/YYYY'') AND TO_DATE('''+DateToStr(dDataFimIRRF)+''',''DD/MM/YYYY'')) '+ #13 +
                   '               AND (CODALTERADOR IN (SELECT CODALTERADOR FROM ALTXIMPOSTO WHERE CODIMPOSTO = 1)) '+ #13 +
                   '               AND (L.CODDOCUMENTO=D.CODDOCUMENTO)) S '+ #13 +
                   '        WHERE '+ #13 +
                   '           (I.IDDARF IS NULL) '+ #13 +
                   '           AND (VLRIRRF <> 0) '+ #13 +
                   '           AND (L.CODALTERADOR IN X.CODALTERADOR) '+ #13 +
                   '           AND (D.RECPAG = ''P'') '+ #13 +
                   '           AND (D.IDPESSOA = ' + IntToStr(iPessoa) + ') '+ #13 +
                   '           AND (L.OPERACAO <> 5) '+ #13 +
                   '           AND (D.STATUS = 2) '+ #13 +
                   '           AND (1 = ' + IntToStr(iSaldoAntIRRF) + ') '+ #13 +
                   '           AND (1 = ' + FFlgDocBaixado + ') '+ #13 +
                   '           AND ((' + sPatro + ' IS NULL) OR (R.IDPATRO = ' + sPatro + ')) '+ #13 +
                   '           AND ((' + sPlanoPrev + ' IS NULL) OR (R.IDPLANOPREV = ' + sPlanoPrev + ')) '+ #13 +
                   '           AND ((' + sFlgIndRecDes + ' IS NULL) OR (NVL(T.FLGINDICARECDES,''N'') = ' + sFlgIndRecDes + ')) '+ #13 +
                   '           AND (D.CODDOCUMENTO = S.CODDOCUMENTO) '+ #13 +
                   '           AND (D.CODDOCUMENTO = L.CODDOCUMENTO) '+ #13 +
                   '           AND (D.CODDOCUMENTO = R.CODDOCUMENTO) '+ #13 +
                   '           AND (D.CODDOCUMENTO = I.CODDOCUMENTO(+)) '+ #13 +
                   '           AND (R.CODTIPRECDES = T.CODTIPRECDES) '+ #13 +
                   '           AND (R.IDPESSOA = T.IDPESSOA) '+ #13 +
                   '           AND (R.RECPAG = T.RECPAG) '+ #13 +
                   '        -- TAG SALDOANT_111_F '+ #13 +

                   '        UNION ALL '+ #13 +

                   '        -- (1.12) REGISTRO ZERADOS PARA SAIREM OS PLANOS/PATROS SEM MOVIMENTO QUANDO HOUVER '+ #13 +
                   '        -- TAG SALDOANT_112_I '+ #13 +
                   '        SELECT '+ #13 +
                   '           ''SALDO INICIAL'' AS NOMEFORCLI, 0 AS SALDO, PA.IDPLANOPREV, PA.IDPATRO, 0 AS IDFORCLI, 0 AS CODDOCUMENTO, '+ #13 +
                   '           (' + IntToStr(iPessoa) + ') AS IDPESSOA,  0 AS CODTIPDOC, 0 AS IDMODULO, 0 AS NUMAPGR, 1 AS TIPOREG, '' '' AS NODOCUMENTO, '' '' AS HISTORICOCOMPL, '' '' AS CODTIPRECDES, '' '' AS CODCENTRORESPON, ''F'' AS RECPAG '+ #13 +
                   '        FROM '+ #13 +
                   '           PESSOA PE, PLANPREVCONTABPATRO PA, PLANPREVCONTABIL PL '+ #13 +
                   '        WHERE '+ #13 +
                   '           ((' + sPatro + ' IS NULL) OR (PA.IDPATRO = ' + sPatro + ')) '+ #13 +
                   '           AND ((' + sPlanoPrev + ' IS NULL) OR (PA.IDPLANOPREV = ' + sPlanoPrev + ')) '+ #13 +
                   '           AND (PA.IDPATRO = PE.IDPESSOA(+)) '+ #13 +
                   '           AND (PA.IDPLANOPREV = PL.IDPLANOPREV) '+ #13;
                   //Marilza Colpani - SOL: 122335/Kintana: 598524 - início
                   if sAtivPlano <> '' then
                     sSQL := sSql + ' AND (PL.ATIVO = '+ quotedstr (sAtivPlano) + ')';
                   //Marilza Colpani - SOL: 122335/Kintana: 598524 - início
                   sSQL := sSql + '        -- TAG SALDOANT_112_F '+ #13;

                   // Alterado por Arnaldo V. Scarin em 20/01/2010
                   // SOL: KTN:
                   sSql := sSql +
                   '        UNION ALL'+#13+
                   '        -- (1.13) SALDO ANTERIOR - REGISTROS DE RECEBIMENTO E MODULO DE INVESTIMENTOS'+#13+
                   '        -- TAG SALDOANT_113_I'+#13+
                   '         SELECT'+#13+
                   '            A.NOMEFORCLI, A.SALDO, A.IDPLANOPREV, A.IDPATRO, A.IDFORCLI, A.CODDOCUMENTO, A.IDPESSOA, A.CODTIPDOC, A.IDMODULO, A.NUMAPGR, A.TIPOREG, A.NODOCUMENTO, L.HISTORICOCOMPL, A.CODTIPRECDES, A.CODCENTRORESPON, A.RECPAG'+#13+
                   '         FROM'+#13+
                   '            (SELECT'+#13+
                   '                ''SALDO INICIAL'' AS NOMEFORCLI, SUM(DECODE(L.DEBCRE,''D'',L.VALOR,L.VALOR * -1)-(DECODE(P.VALOR,NULL,0,P.VALOR))) AS SALDO,'+
                                    'R.IDPLANOPREV, R.IDPATRO, D.IDFORCLI, D.CODDOCUMENTO, D.IDPESSOA, D.CODTIPDOC, D.IDMODULO, 0 AS NUMAPGR, 1 AS TIPOREG,'+
                                    'DECODE(D.COMPLDOCUMENTO,NULL,TO_CHAR(D.NODOCUMENTO),(TO_CHAR(D.NODOCUMENTO)||''/''||D.COMPLDOCUMENTO)) AS NODOCUMENTO, '' '' AS HISTORICOCOMPL, R.CODTIPRECDES, '' '' AS CODCENTRORESPON, D.RECPAG'+#13+
                   '             FROM'+#13+
                   '                DOCUMENTO D,LANCTODOCUM L,'+#13+
                   '                (SELECT DISTINCT R1.IDPATRO,R1.IDPLANOPREV,R1.CODTIPRECDES, D1.CODDOCUMENTO'+#13+
                   '                 FROM RATEIODOCUM R1, DOCUMENTO D1'+#13+
                   '                 WHERE  (D1.DATADISPONIB > TO_DATE('''+DateToStr(dDataSaldoAnt)+''',''DD/MM/YYYY''))'+#13+
                   '                    AND (D1.DATADISPONIB < TO_DATE('''+DateToStr(dDataRef)+''',''DD/MM/YYYY''))'+#13+
                   '                    AND (D1.IDPESSOA = 1)'+#13+
                   '                    AND (D1.OPERACAO IN (''2 ''))'+#13+
                   '                    AND (D1.RECPAG = ''R'')'+#13+
                   '                    AND ((' + sPatro + ' IS NULL) OR (R1.IDPATRO = ' + sPatro + '))'+#13+
                   '                    AND ((' + sPlanoPrev + ' IS NULL) OR (R1.IDPLANOPREV = ' + sPlanoPrev + '))'+#13+
                   '                    AND (D1.CODDOCUMENTO = R1.CODDOCUMENTO)) R,'+#13+
                   '                (SELECT LA.CODDOCUMENTO, DECODE(LA.DEBCRE,''C'',LA.VALOR,LA.VALOR * -1) AS VALOR'+#13+
                   '                 FROM RECBTOPAGTO RE, LANCTODOCUM LA'+#13+
                   '                 WHERE RE.CODPORTFORMA IN (SELECT CODPORTFORMA FROM PORTADORFORMA WHERE LANCAFINANC = ''N'')'+#13+
                   '                   AND LA.DEBCRE = ''D'''+#13+
                   '                   AND LA.NUMLANCTO = RE.NUMLANCTO) P,'+#13+
                   '                --bruno bastos - 26/11/2009'+#13+
                   '                DOCUMXDOCUM DXD'+#13+
                   '             WHERE  (D.DATADISPONIB > TO_DATE('''+DateToStr(dDataSaldoAnt)+''',''DD/MM/YYYY''))'+#13+
                   '                AND (D.DATADISPONIB < TO_DATE('''+DateToStr(dDataRef)+''',''DD/MM/YYYY''))'+#13+
                   '                AND (D.IDPESSOA = 1)'+#13+
                   '                AND (NVL(L.VALOR,0) <> 0)'+#13+
                   '                AND (D.OPERACAO IN (''2 ''))'+#13+
                   '                AND (L.OPERACAO <> 5)'+#13+
                   '                AND (D.RECPAG = ''R'')'+#13+
                   '                --bruno bastos - 26/11/2009'+#13+
                   '                AND (D.CODDOCUMENTO    = DXD.IDDOCUMENTO)'+#13+
                   '                AND (DXD.FLGDISPFINANC = ''S'')'+#13+
                   '                --AND (D.IDMODULO  = 79)'+#13+
                   '                AND ((' + sPatro + ' IS NULL) OR (R.IDPATRO = ' + sPatro + '))'+#13+
                   '                AND ((' + sPlanoPrev + ' IS NULL) OR (R.IDPLANOPREV = ' + sPlanoPrev + '))'+#13+
                   '                AND (D.CODDOCUMENTO = L.CODDOCUMENTO)'+#13+
                   '                AND (D.CODDOCUMENTO = R.CODDOCUMENTO)'+#13+
                   '                AND (D.CODDOCUMENTO = P.CODDOCUMENTO(+))'+#13+
                   '             GROUP BY D.IDFORCLI,D.DATAVENCTO,D.COMPLDOCUMENTO,D.NODOCUMENTO,'+#13+
                   '                D.DATAPROGRAMADA,L.DATALANCTO,R.CODTIPRECDES,'+#13+
                   '                R.IDPLANOPREV,R.IDPATRO,D.RECPAG,D.IDPESSOA,D.OPERACAO,'+#13+
                   '                D.CODTIPDOC,D.IDMODULO,D.CODDOCUMENTO'+#13+
                   '             HAVING SUM(NVL(L.VALOR,0)-(DECODE(P.VALOR,NULL,0,P.VALOR))) <> 0) A,'+#13+
                   '             LANCTODOCUM L'+#13+
                   '         WHERE A.CODDOCUMENTO = L.CODDOCUMENTO'+#13+
                   '            AND L.OPERACAO NOT IN (''4 '',''5 '')'+#13+
                   '        -- TAG SALDOANT_113_F'+#13+
                   '        UNION ALL'+#13+
                   '        -- (1.14) SALDO ANTERIOR - REGISTROS DE PAGAMENTO E MODULO DE INVESTIMENTOS'+#13+
                   '        -- TAG SALDOANT_114_I'+#13+
                   '         SELECT'+#13+
                   '            A.NOMEFORCLI, A.SALDO, A.IDPLANOPREV, A.IDPATRO, A.IDFORCLI, A.CODDOCUMENTO, A.IDPESSOA, A.CODTIPDOC, A.IDMODULO, A.NUMAPGR, A.TIPOREG, A.NODOCUMENTO, L.HISTORICOCOMPL, A.CODTIPRECDES, A.CODCENTRORESPON, A.RECPAG'+#13+
                   '         FROM'+#13+
                   '            (SELECT'+#13+
                   '                ''SALDO INICIAL'' AS NOMEFORCLI, SUM(DECODE(L.DEBCRE,''D'',L.VALOR,L.VALOR * -1)-(DECODE(P.VALOR,NULL,0,P.VALOR))) AS SALDO,'+
                                    'R.IDPLANOPREV, R.IDPATRO, D.IDFORCLI, D.CODDOCUMENTO, D.IDPESSOA, D.CODTIPDOC, D.IDMODULO, 0 AS NUMAPGR, 1 AS TIPOREG,'+
                                    'DECODE(D.COMPLDOCUMENTO,NULL,TO_CHAR(D.NODOCUMENTO),(TO_CHAR(D.NODOCUMENTO)||''/''||D.COMPLDOCUMENTO)) AS NODOCUMENTO, '' '' AS HISTORICOCOMPL, R.CODTIPRECDES, '' '' AS CODCENTRORESPON, D.RECPAG'+#13+
                   '             FROM'+#13+
                   '                DOCUMENTO D,LANCTODOCUM L,'+#13+
                   '                (SELECT DISTINCT R1.IDPATRO,R1.IDPLANOPREV,R1.CODTIPRECDES, D1.CODDOCUMENTO'+#13+
                   '                 FROM RATEIODOCUM R1, DOCUMENTO D1'+#13+
                   '                 WHERE (D1.DATADISPONIB > TO_DATE('''+DateToStr(dDataSaldoAnt)+''',''DD/MM/YYYY''))'+#13+
                   '                    AND (D1.DATADISPONIB < TO_DATE('''+DateToStr(dDataRef)+''',''DD/MM/YYYY''))'+#13+
                   '                    AND (D1.IDPESSOA = 1)'+#13+
                   '                    AND (D1.OPERACAO IN (''2 ''))'+#13+
                   '                    AND (D1.RECPAG = ''P'')'+#13+
                   '                    AND ((' + sPatro + ' IS NULL) OR (R1.IDPATRO = ' + sPatro + '))'+#13+
                   '                    AND ((' + sPlanoPrev + ' IS NULL) OR (R1.IDPLANOPREV = ' + sPlanoPrev + '))'+#13+
                   '                    AND (D1.CODDOCUMENTO = R1.CODDOCUMENTO)) R,'+#13+
                   '                (SELECT LA.CODDOCUMENTO, DECODE(LA.DEBCRE,''C'',LA.VALOR,LA.VALOR * -1) AS VALOR'+#13+
                   '                 FROM RECBTOPAGTO RE, LANCTODOCUM LA'+#13+
                   '                 WHERE  RE.CODPORTFORMA IN (SELECT CODPORTFORMA FROM PORTADORFORMA WHERE LANCAFINANC = ''N'')'+#13+
                   '                    AND LA.DEBCRE = ''D'''+#13+
                   '                    AND LA.NUMLANCTO = RE.NUMLANCTO) P,'+#13+
                   '                --bruno bastos - 26/11/2009'+#13+
                   '                DOCUMXDOCUM DXD'+#13+
                   '             WHERE  (D.DATADISPONIB > TO_DATE('''+DateToStr(dDataSaldoAnt)+''',''DD/MM/YYYY''))'+#13+
                   '                AND (D.DATADISPONIB < TO_DATE('''+DateToStr(dDataRef)+''',''DD/MM/YYYY''))'+#13+
                   '                AND (D.IDPESSOA = 1)'+#13+
                   '                --bruno bastos - 26/11/2009'+#13+
                   '                AND (D.CODDOCUMENTO = DXD.IDDOCUMENTO)'+#13+
                   '                AND (DXD.FLGDISPFINANC = ''S'')'+#13+
                   '                AND (NVL(L.VALOR,0) <> 0)'+#13+
                   '                AND (D.OPERACAO IN (''2 ''))'+#13+
                   '                AND (L.OPERACAO <> 5)'+#13+
                   '                AND (D.RECPAG = ''P'')'+#13+
                   '                -- Arnaldo V. Scarin - 20/01/2010 - Inicio'+#13+
                   '                AND NOT Exists (Select 1 From DocumxDocum dxd'+#13+
                   '                                where dxd.iddocumento = d.coddocumento'+#13+
                   '                                  and dxd.flgdispfinanc = ''S'')'+#13+
                   '                -- Arnaldo V. Scarin - 20/01/2010 - Fim'+#13+
                   '                --AND (D.IDMODULO  = 79)'+#13+
                   '                AND ((' + sPatro + ' IS NULL) OR (R.IDPATRO = ' + sPatro + '))'+#13+
                   '                AND ((' + sPlanoPrev + ' IS NULL) OR (R.IDPLANOPREV = ' + sPlanoPrev + '))'+#13+
                   '                AND (D.CODDOCUMENTO = L.CODDOCUMENTO)'+#13+
                   '                AND (D.CODDOCUMENTO = R.CODDOCUMENTO)'+#13+
                   '                AND (D.CODDOCUMENTO = P.CODDOCUMENTO(+))'+#13+
                   '             GROUP BY D.IDFORCLI,D.DATAVENCTO,D.COMPLDOCUMENTO,D.NODOCUMENTO,'+#13+
                   '                D.DATAPROGRAMADA,L.DATALANCTO,R.CODTIPRECDES,'+#13+
                   '                R.IDPLANOPREV,R.IDPATRO,D.RECPAG,D.IDPESSOA,D.OPERACAO,'+#13+
                   '                D.CODTIPDOC,D.IDMODULO,D.CODDOCUMENTO'+#13+
                   '             HAVING SUM(NVL(L.VALOR,0)-(DECODE(P.VALOR,NULL,0,P.VALOR))) <> 0) A,'+#13+
                   '             LANCTODOCUM L'+#13+
                   '         WHERE A.CODDOCUMENTO = L.CODDOCUMENTO'+#13+
                   '            AND L.OPERACAO NOT IN (''4 '',''5 '')'+#13+
                   '        -- TAG SALDOANT_114_F'+#13+
                   '        --Bruno Bastos - 26/11/2009 - Fim'+#13;
                   sSql := sSql + '      ) ';

                   if sGrupo = 'Plano/Patro' then
                      sSql :=  sSql + '   GROUP BY IDPLANOPREV, IDPATRO, IDPESSOA '
                   else if sGrupo = 'Plano' then
                      sSql :=  sSql + '   GROUP BY IDPLANOPREV, IDPESSOA '
                   else if sGrupo = 'Patro' then
                      sSql :=  sSql + '   GROUP BY IDPATRO, IDPESSOA ';
                   sSql :=  sSql + ' '+ #13 +
                   '    -- TAG SALDOANT_10_F '+ #13 +
                   '    UNION ALL '+ #13 +
                   '    -- (2.0) REGISTRO NA DATAREF  '+ #13 +
                   '    -- TAG REGNADATA_20_I '+ #13 +
                   '    SELECT '+ #13 +
                   '       DECODE(U.IDFORCLI,-1,U.NODOCUMENTO,P.RAZAOSOCIAL) AS NOMEFORCLI, (SUM(DECODE(SIGN(U.SALDO),-1,U.SALDO,0)) + SUM(DECODE(SIGN(U.SALDO),1,U.SALDO,0))) AS SALDO, U.NODOCUMENTO, U.NUMAPGR, ';
                   if sGrupo = 'Plano/Patro' then
                      sSql :=  sSql + ' U.IDPLANOPREV, U.IDPATRO, '
                   else if sGrupo = 'Plano' then
                      sSql :=  sSql + ' U.IDPLANOPREV, '' '' AS IDPATRO, '
                   else if sGrupo = 'Patro' then
                      sSql :=  sSql + ' '' '' AS IDPLANOPREV, U.IDPATRO, ';
                   sSql :=  sSql + '       DECODE(U.IDMODULO,79,2,3) AS TIPOREG, U.CODCENTRORESPON, U.IDPESSOA, U.NUMLOTE, U.CODLANCFINANC '+ #13 +
                   '    FROM '+ #13 +
                   '       PESSOA P, PESSOA PT, TIPORECEBDESEMB T, PLANPREVCONTABIL PP, '+ #13 +
                   '       TIPODOCRECPAG TD, MODULO M, '+ #13 +
                   '       ( '+ #13 +
                   '        ( '+ #13 +
                   '         -- (2.1) REGISTROS  BAIXADOS NA DATAREF <> DE INVESTIMENTOS '+ #13 +
                   '         -- TAG REGNADATA_21_I '+ #13 +
                   '         SELECT '+ #13 +
                   '            '' '' AS NOMEFORCLI, DECODE(R.RECPAG,''R'',R.VALOR,R.VALOR*-1) AS SALDO, R.IDPLANOPREV, R.IDPATRO, -1 AS IDFORCLI, 0 AS CODDOCUMENTO, '+ #13 +
                   '            M.IDPESSOA, 0 AS CODTIPDOC, 0 AS IDMODULO, 0 AS NUMAPGR, '' '' AS TIPOREG, M.HISTORICO||'' / ''||TO_CHAR(M.CODLANCFINANC,''9999999999'') AS NODOCUMENTO, '+ #13 +
                   '            '' '' AS HISTORICOCOMPL, R.CODTIPRECDES, R.CODCENTRORESPON, ''F'' AS RECPAG, RC.NUMLOTE, RC.CODLANCFINANC '+ #13 +
                   '         FROM '+ #13 +
                   '            MOVIMFINANC M, RATEIOFINANC R, TIPORECEBDESEMB T, '+ #13 +
                   '            (SELECT DISTINCT CODLANCFINANC, NUMLOTE FROM RECBTOPAGTO) RC '+ #13 +
                   '         WHERE '+ #13 +
                   '            (M.DATADISPFINANC = TO_DATE('''+DateToStr(dDataRef)+''',''DD/MM/YYYY'')) '+ #13 +
                   '            AND (M.STATUSCONCILIA <> ''C'') '+ #13 +
                   '            AND (M.VALORLANCFINAN <> 0) '+ #13 +
                   '            AND (DECODE(R.RECPAG,''R'',R.VALOR,R.VALOR*-1))<>0 '+ #13 +
                   '            AND ((M.CODLANCTRANSF IS NULL) OR (M.CODLANCTRANSF = 0)) '+ #13 +
                   '            AND (M.IDPESSOA   = ' + IntToStr(iPessoa) + ') '+ #13 +
                   '            AND ( NOT EXISTS (SELECT * FROM MOVIMFINANC M1, RECBTOPAGTO R1, DOCUMENTO D1 '+ #13 +
                   '                              WHERE '+ #13 +
                   '                                 (((M1.DATALANCFINAN = TO_DATE('''+DateToStr(dDataRef)+''',''DD/MM/YYYY'')) AND (M1.DATADISPFINANC IS NULL)) OR '+ #13 +
                   '                                  ((M1.DATALANCFINAN = TO_DATE('''+DateToStr(dDataRef)+''',''DD/MM/YYYY'')) AND (M1.DATADISPFINANC = TO_DATE('''+DateToStr(dDataRef)+''',''DD/MM/YYYY''))) OR '+ #13 +
                   '                                  ((M1.DATADISPFINANC = TO_DATE('''+DateToStr(dDataRef)+''',''DD/MM/YYYY'')))) '+ #13 +
                   '                                 AND (D1.IDMODULO = 79) '+ #13 +
                   '                                 AND ((M1.CODLANCTRANSF IS NULL) OR (M1.CODLANCTRANSF = 0)) '+ #13 +
                   '                                 AND (M1.STATUSCONCILIA <> ''C'') '+ #13 +
                   '                                 AND (M1.IDPESSOA = ' + IntToStr(iPessoa) + ') '+ #13 +
                   '                                 AND (R1.CODLANCFINANC(+) = M1.CODLANCFINANC) '+ #13 +
                   '                                 AND (D1.CODDOCUMENTO(+)   = R1.CODDOCUMENTO) '+ #13 +
                   '                                 AND (M1.CODLANCFINANC = M.CODLANCFINANC))) '+ #13 +
                   '            AND ((' + sPatro + ' IS NULL) OR (R.IDPATRO = ' + sPatro + ')) '+ #13 +
                   '            AND ((' + sPlanoPrev + ' IS NULL) OR (R.IDPLANOPREV = ' + sPlanoPrev + ')) '+ #13 +
                   '            AND ((' + sFlgIndRecDes + ' IS NULL) OR (NVL(T.FLGINDICARECDES,''N'') = ' + sFlgIndRecDes + ')) '+ #13 +
                   //AL_9
                   //AL_10
                   '            AND (M.CODLANCFINANC  = R.CODLANCFINANC) '+ #13 +
                   '            AND (M.CODLANCFINANC  = RC.CODLANCFINANC(+)) '+ #13 +
                   '            AND (R.CODTIPRECDES = T.CODTIPRECDES) '+ #13 +
                   '            AND (R.IDPESSOA = T.IDPESSOA) '+ #13 +
                   '            AND (R.RECPAG = T.RECPAG) '+ #13 +
                   '        -- TAG REGNADATA_21_F '+ #13 +
                   '        ) '+ #13 +
                   '        UNION ALL '+ #13 +
                   '        (  '+ #13 +
                   '         -- (2.2) REGISTROS BAIXADOS NA DATAREF <> DE INVESTIMENTOS E GERADOS PELO BAIXA DE RECBTO / PAGTO '+ #13 +
                   '         -- TAG REGNADATA_22_I '+ #13 +
                   '         SELECT '+ #13 +
                   '            '' '' AS NOMEFORCLI, DECODE(R.RECPAG,''R'',R.VALOR,R.VALOR*-1) AS SALDO, R.IDPLANOPREV, R.IDPATRO, -1 AS IDFORCLI, 0 AS CODDOCUMENTO, '+ #13 +
                   //AL_17
                   '            M.IDPESSOA, R.CODTIPDOC, 0 AS IDMODULO, 0 AS NUMAPGR, '' '' AS TIPOREG, M.HISTORICO||'' / ''||TO_CHAR(M.CODLANCFINANC,''9999999999'') AS NODOCUMENTO, '+ #13 +
                   '            '' '' AS HISTORICOCOMPL, R.CODTIPRECDES, R.CODCENTRORESPON, ''F'' AS RECPAG, 0 AS NUMLOTE, 0 AS CODLANCFINANC '+ #13 +
                   '         FROM '+ #13 +
                   '            MOVIMFINANC M, RATEIOFINANC R, TIPORECEBDESEMB T '+ #13 +
                   '         WHERE '+ #13 +
                   '            (M.DATADISPFINANC = TO_DATE('''+DateToStr(dDataRef)+''',''DD/MM/YYYY'')) '+ #13 +
                   '            AND (M.IDPESSOA = ' + IntToStr(iPessoa) + ') '+ #13 +
                   '            AND (M.STATUSCONCILIA <> ''C'') '+ #13 +
                   '            AND ((M.VALORLANCFINAN = 0) AND (M.CODLANCTRANSF IS NULL)) '+ #13 +
                   '            AND ( NOT EXISTS (SELECT * FROM MOVIMFINANC M1, RECBTOPAGTO R1, DOCUMENTO D1 '+ #13 +
                   '                              WHERE ((M1.CODLANCTRANSF IS NULL) OR (M1.CODLANCTRANSF = 0)) '+ #13 +
                   '                                 AND (M1.IDPESSOA = ' + IntToStr(iPessoa) + ') '+ #13 +
                   '                                 AND (M1.STATUSCONCILIA <> ''C'') '+ #13 +
                   '                                 AND (M.DATADISPFINANC  = TO_DATE('''+DateToStr(dDataRef)+''',''DD/MM/YYYY'')) '+ #13 +
                   '                                 AND (R1.CODLANCFINANC(+) = M1.CODLANCFINANC) '+ #13 +
                   '                                 AND (D1.CODDOCUMENTO(+)   = R1.CODDOCUMENTO) '+ #13 +
                   '                                 AND (D1.IDMODULO = 79) '+ #13 +
                   '                                 AND (M1.CODLANCFINANC = M.CODLANCFINANC))) '+ #13 +
                   '            AND ((' + sPatro + ' IS NULL) OR (R.IDPATRO = ' + sPatro + ')) '+ #13 +
                   '            AND ((' + sPlanoPrev + ' IS NULL) OR (R.IDPLANOPREV = ' + sPlanoPrev + ')) '+ #13 +
                   '            AND ((' + sFlgIndRecDes + ' IS NULL) OR (NVL(T.FLGINDICARECDES,''N'') = ' + sFlgIndRecDes + ')) '+ #13 +
                   '            AND (M.CODLANCFINANC = R.CODLANCFINANC) '+ #13 +
                   '            AND (R.CODTIPRECDES = T.CODTIPRECDES) '+ #13 +
                   '            AND (R.IDPESSOA = T.IDPESSOA) '+ #13 +
                   '            AND (R.RECPAG = T.RECPAG) '+ #13 +
                   '        -- TAG REGNADATA_22_F '+ #13 +
                   '        ) '+ #13 +
                   '        UNION ALL '+ #13 +
                   '        ( '+ #13 +
                   '         -- (2.3) REGISTRO BAIXADOS NA DATAREF <> DE INVESTIMENTO  E GERADOS PELA TRANSF. ENTRE PLANOS '+ #13 +
                   '         -- TAG REGNADATA_23_I '+ #13 +
                   '         SELECT  '+ #13 +
                   '            '' '' AS NOMEFORCLI, DECODE(R.RECPAG,''R'',R.VALOR,R.VALOR*-1) AS SALDO, R.IDPLANOPREV, R.IDPATRO, -1 AS IDFORCLI, 0 AS CODDOCUMENTO, '+ #13 +
                   '            M.IDPESSOA, 0 AS CODTIPDOC, 0 AS IDMODULO, 0 AS NUMAPGR, '' '' AS TIPOREG, M.HISTORICO||'' / ''||TO_CHAR(M.CODLANCFINANC,''9999999999'') AS NODOCUMENTO, '+#13 +
                   '            '' '' AS HISTORICOCOMPL, R.CODTIPRECDES, R.CODCENTRORESPON, ''F'' AS RECPAG, RC.NUMLOTE, RC.CODLANCFINANC '+ #13 +
                   '         FROM '+ #13 +
                   '            MOVIMFINANC M, RATEIOFINANC R,  RECBTOPAGTO RC, DOCUMENTO D, TIPORECEBDESEMB T '+ #13 +
                   '         WHERE '+ #13 +
                   '            (M.DATADISPFINANC = TO_DATE('''+DateToStr(dDataRef)+''',''DD/MM/YYYY'')) '+ #13 +
                   '            AND (M.IDPESSOA   = ' + IntToStr(iPessoa) + ') '+ #13 +
                   '            AND ((M.CODLANCTRANSF IS NOT NULL) AND (M.CODLANCTRANSF = M.CODLANCFINANC)) '+ #13 +
                   '            AND ((RC.CODLANCFINANC IS NULL) OR (D.IDMODULO NOT IN (79))) '+ #13 +
                   '            AND (M.STATUSCONCILIA <> ''C'') '+ #13 +
                   '            AND (M.VALORLANCFINAN = 0) '+ #13 +
                   '            AND (DECODE(R.RECPAG,''R'',R.VALOR,R.VALOR*-1)) <> 0  '+ #13 +
                   '            AND ((' + sPatro + ' IS NULL) OR (R.IDPATRO = ' + sPatro + ')) '+ #13 +
                   '            AND ((' + sPlanoPrev + ' IS NULL) OR (R.IDPLANOPREV = ' + sPlanoPrev + ')) '+ #13 +
                   '            AND ((' + sFlgIndRecDes + ' IS NULL) OR (NVL(T.FLGINDICARECDES,''N'') = ' + sFlgIndRecDes + ')) '+ #13 +
                   //AL_9
                   //AL_10
                   '            AND (M.CODLANCFINANC  = R.CODLANCFINANC)  '+ #13 +
                   '            AND (RC.CODLANCFINANC(+) = M.CODLANCFINANC) '+ #13 +
                   '            AND (D.CODDOCUMENTO(+)   = RC.CODDOCUMENTO) '+ #13 +
                   '            AND (R.CODTIPRECDES = T.CODTIPRECDES) '+ #13 +
                   '            AND (R.IDPESSOA = T.IDPESSOA) '+ #13 +
                   '            AND (R.RECPAG = T.RECPAG) '+ #13 +
                   '        -- TAG REGNADATA_23_F '+ #13 +
                   '        ) '+ #13 +
                   '        UNION ALL '+ #13 +
                   '        ( '+ #13 +
                   '         -- (2.4) REGISTRO DE PAGAMENTOS NAO BAIXADOS NA DATAREF <> DE CPMF E MODULO <> INVESTIMENTOS '+ #13 +
                   '         -- TAG REGNADATA_24_I '+ #13 +
                   '         SELECT '+ #13 +
                   '            '' '' AS NOMEFORCLI, SUM(((R.VALOR*S.SALDO)/L.VALOR)-(DECODE(P.VALOR,NULL,0,P.VALOR))) AS SALDO, R.IDPLANOPREV, R.IDPATRO, D.IDFORCLI, D.CODDOCUMENTO, '+ #13 +
                   '            D.IDPESSOA, D.CODTIPDOC, D.IDMODULO, D.NUMAPGR, '' '' AS TIPOREG, DECODE(D.COMPLDOCUMENTO,NULL,TO_CHAR(D.NODOCUMENTO),(TO_CHAR(D.NODOCUMENTO)||''/''||D.COMPLDOCUMENTO)) AS NODOCUMENTO, '+ #13 +
                   '            L.HISTORICOCOMPL, R.CODTIPRECDES, R.CODCENTRORESPON, R.RECPAG, 0 AS NUMLOTE, 0 AS CODLANCFINANC '+ #13 +
                   '         FROM  '+ #13 +
                   '            DOCUMENTO D, LANCTODOCUM L, RATEIODOCUM R, TIPORECEBDESEMB T, '+ #13 +
                   '            (SELECT P.CODTIPDOCCPMF FROM PARAMCAP P WHERE P.IDPESSOA = ' + IntToStr(iPessoa) + ' AND P.RECPAG = ''P'') P, '+ #13 +
                   '            (SELECT D.CODDOCUMENTO, SUM(DECODE(L.DEBCRE,''D'',L.VALOR,L.VALOR*-1)) AS SALDO  '+ #13 +
                   '             FROM DOCUMENTO D, LANCTODOCUM L '+ #13 +
                   '             WHERE '+ #13 +
                   //AL_17
                   '                ((D.OPERACAO IN (''2 '')) OR (D.OPERACAO IN (''1 '') AND D.NUMFATURA IS NULL)) '+ #13 +
                   '                AND (D.RECPAG = ''P'') '+ #13 +
                   '                AND (D.IDPESSOA = ' + IntToStr(iPessoa) + ') '+ #13 +
                   '                AND (L.OPERACAO <> 5) '+ #13 +
                   '                AND (D.CODDOCUMENTO = L.CODDOCUMENTO) '+ #13 +
                   '             GROUP BY D.CODDOCUMENTO) S, '+ #13 +
                   '            (SELECT LA.CODDOCUMENTO, DECODE(LA.DEBCRE,''D'',LA.VALOR * -1,LA.VALOR) AS VALOR '+ #13 +
                   '             FROM RECBTOPAGTO RE, LANCTODOCUM LA '+ #13 +
                   '             WHERE  '+ #13 +
                   '                RE.CODPORTFORMA IN (SELECT CODPORTFORMA FROM PORTADORFORMA WHERE LANCAFINANC = ''N'') '+ #13 +
                   '                AND LA.DEBCRE = ''D'' '+ #13 +
                   '                AND LA.NUMLANCTO = RE.NUMLANCTO) P '+ #13 +
                   '         WHERE '+ #13 +
                   '            (D.DATAPROGRAMADA = TO_DATE('''+DateToStr(dDataRef)+''',''DD/MM/YYYY'')) '+ #13 +
                   '            AND (D.RECPAG = ''P'') '+ #13 +
                   '            AND (NVL(L.VALOR,0) <> 0)  '+ #13 +
                   //AL_16
                   '            AND ((D.OPERACAO IN (''2 '')) OR (D.OPERACAO IN (''1 '') AND D.NUMFATURA IS NULL)) '+ #13 +
                   '            AND (L.OPERACAO <> 5) '+ #13 +
                   '            -- Arnaldo V. Scarin - 20/01/2010 - Inicio'+ #13 +
                   '            AND NOT Exists (Select 1 From DocumxDocum dxd'+ #13 +
                   '                            where dxd.iddocumento = d.coddocumento'+ #13 +
                   '                              and dxd.flgdispfinanc = ''S'')'+ #13 +
                   '            -- Arnaldo V. Scarin - 20/01/2010 - Fim'+ #13 +
                   '            AND (D.CODTIPDOC <> P.CODTIPDOCCPMF) '+ #13 +
                   '            AND (D.IDMODULO  <> 79) '+ #13 +
                   '            AND (D.STATUS <> 2) '+ #13 +
                   '            AND (D.IDPESSOA = ' + IntToStr(iPessoa) + ') '+ #13 +
                   '            AND ((' + sPatro + ' IS NULL) OR (R.IDPATRO = ' + sPatro + ')) '+ #13 +
                   '            AND ((' + sPlanoPrev + ' IS NULL) OR (R.IDPLANOPREV = ' + sPlanoPrev + ')) '+ #13 +
                   '            AND ((' + sFlgIndRecDes + ' IS NULL) OR (NVL(T.FLGINDICARECDES,''N'') = ' + sFlgIndRecDes + ')) '+ #13 +
                   '            AND (1 = ' + FFlgDocBaixado + ') '+ #13 +
                   //AL_12
                   '            AND (D.CODDOCUMENTO NOT IN (SELECT DISTINCT CODDOCUMENTO FROM LOTEXDOCUM)) '+ #13 +
                   '            AND (D.CODDOCUMENTO = L.CODDOCUMENTO) '+ #13 +
                   '            AND (D.OPERACAO = L.OPERACAO) '+ #13 +
                   '            AND (D.CODDOCUMENTO = R.CODDOCUMENTO) '+ #13 +
                   '            AND (D.CODDOCUMENTO = S.CODDOCUMENTO) '+ #13 +
                   '            AND (D.CODDOCUMENTO = P.CODDOCUMENTO(+)) '+ #13 +
                   '            AND (R.CODTIPRECDES = T.CODTIPRECDES) '+ #13 +
                   '            AND (R.IDPESSOA = T.IDPESSOA) '+ #13 +
                   '            AND (R.RECPAG = T.RECPAG) '+ #13 +
                   '         GROUP BY D.IDFORCLI, D.DATAVENCTO, D.COMPLDOCUMENTO, D.NODOCUMENTO, D.DATAPROGRAMADA, '+ #13 +
                   '                L.HISTORICOCOMPL, L.DATALANCTO, R.CODTIPRECDES, R.IDPLANOPREV, R.IDPATRO, '+ #13 +
                   '                R.RECPAG, D.IDPESSOA, D.OPERACAO, D.CODTIPDOC, D.IDMODULO, D.CODDOCUMENTO, R.CODCENTRORESPON, D.NUMAPGR '+ #13 +
                   '         HAVING SUM(((R.VALOR*S.SALDO)/L.VALOR)-(DECODE(P.VALOR,NULL,0,P.VALOR))) <> 0 '+ #13 +
                   '        -- TAG REGNADATA_24_F '+ #13 +
                   '        ) '+ #13 +
                   '        UNION ALL '+ #13 +
                   '        ( '+ #13 +
                   '         -- (2.5) REGISTRO DE PAGAMENTOS NA DATAREF E MODULO = INVESTIMENTOS E <> DE CPMF '+ #13 +
                   '         -- TAG REGNADATA_25_I '+ #13 +
                   '         SELECT  '+ #13 +
                   '            A.NOMEFORCLI, A.SALDO, A.IDPLANOPREV, A.IDPATRO, A.IDFORCLI, A.CODDOCUMENTO, A.IDPESSOA, A.CODTIPDOC, A.IDMODULO, A.NUMAPGR, A.TIPOREG, '+ #13 +
                   '            A.NODOCUMENTO, L.HISTORICOCOMPL, A.CODTIPRECDES, A.CODCENTRORESPON, A.RECPAG, 0 AS NUMLOTE, 0 AS CODLANCFINANC '+ #13 +
                   '         FROM '+ #13 +
                   '            (SELECT '+ #13 +
                   '                 '' '' AS NOMEFORCLI, SUM(DECODE(L.DEBCRE,''D'',L.VALOR,L.VALOR * -1)-(DECODE(P.VALOR,NULL,0,P.VALOR))) AS SALDO, R.IDPLANOPREV, R.IDPATRO, D.IDFORCLI, D.CODDOCUMENTO, '+ #13 +
                   '                 D.IDPESSOA, D.CODTIPDOC, D.IDMODULO, D.NUMAPGR, '' '' AS TIPOREG,DECODE(D.COMPLDOCUMENTO,NULL,TO_CHAR(D.NODOCUMENTO),(TO_CHAR(D.NODOCUMENTO)||''/''||D.COMPLDOCUMENTO)) AS NODOCUMENTO, R.CODTIPRECDES, R.CODCENTRORESPON, D.RECPAG '+ #13 +
                   '             FROM '+ #13 +
                   '                DOCUMENTO D,LANCTODOCUM L, '+ #13 +
                   '                (SELECT DISTINCT R1.IDPATRO,R1.IDPLANOPREV,R1.CODTIPRECDES, D1.CODDOCUMENTO, R1.CODCENTRORESPON '+ #13 +
                   '                 FROM RATEIODOCUM R1, DOCUMENTO D1, TIPORECEBDESEMB T '+ #13 +
                   '                 WHERE '+ #13 +
                   '                    (D1.DATADISPONIB = TO_DATE('''+DateToStr(dDataRef)+''',''DD/MM/YYYY'')) '+ #13 +
                   '                    AND (D1.IDPESSOA = ' + IntToStr(iPessoa) + ') '+ #13 +
                   '                    AND (D1.OPERACAO IN (''2 '')) '+ #13 +
                   '                    AND (D1.RECPAG = ''P'') '+ #13 +
                   '                    AND (D1.IDMODULO  = 79) '+ #13 +
                   '                    AND ((' + sPatro + ' IS NULL) OR (R1.IDPATRO = ' + sPatro + ')) '+ #13 +
                   '                    AND ((' + sPlanoPrev + ' IS NULL) OR (R1.IDPLANOPREV = ' + sPlanoPrev + ')) '+ #13 +
                   '                    AND ((' + sFlgIndRecDes + ' IS NULL) OR (NVL(T.FLGINDICARECDES,''N'') = ' + sFlgIndRecDes + ')) '+ #13 +
                   '                    AND (R1.CODTIPRECDES = T.CODTIPRECDES) '+ #13 +
                   '                    AND (R1.IDPESSOA = T.IDPESSOA) '+ #13 +
                   '                    AND (R1.RECPAG = T.RECPAG) '+ #13 +
                   '                    AND (D1.CODDOCUMENTO = R1.CODDOCUMENTO)) R, '+ #13 +
                   '                (SELECT LA.CODDOCUMENTO, DECODE(LA.DEBCRE,''C'',LA.VALOR,LA.VALOR * -1) AS VALOR '+ #13 +
                   '                 FROM RECBTOPAGTO RE, LANCTODOCUM LA '+ #13 +
                   '                 WHERE '+ #13 +
                   '                    RE.CODPORTFORMA IN (SELECT CODPORTFORMA FROM PORTADORFORMA WHERE LANCAFINANC = ''N'') '+ #13 +
                   '                    AND LA.DEBCRE = ''D'' '+ #13 +
                   '                 AND LA.NUMLANCTO = RE.NUMLANCTO) P '+ #13 +
                   '             WHERE '+ #13 +
                   '                (D.DATADISPONIB = TO_DATE('''+DateToStr(dDataRef)+''',''DD/MM/YYYY'')) '+ #13 +
                   '                AND (D.IDPESSOA = ' + IntToStr(iPessoa) + ') '+ #13 +
                   '                AND (NVL(L.VALOR,0) <> 0) '+ #13 +
                   '                AND (D.OPERACAO IN (''2 '')) '+ #13 +
                   '                AND (L.OPERACAO <> 5) '+ #13 +
                   '                -- Arnaldo V. Scarin - 20/01/2010 - Inicio'+ #13 +
                   '                AND NOT Exists (Select 1 From DocumxDocum dxd'+ #13 +
                   '                                where dxd.iddocumento = d.coddocumento'+ #13 +
                   '                                  and dxd.flgdispfinanc = ''S'')'+ #13 +
                   '                -- Arnaldo V. Scarin - 20/01/2010 - Fim'+ #13 +
                   '                AND (D.RECPAG = ''P'') '+ #13 +
                   '                AND (D.IDMODULO  = 79) '+ #13 +
                   '                AND ((' + sPatro + ' IS NULL) OR (R.IDPATRO = ' + sPatro + ')) '+ #13 +
                   '                AND ((' + sPlanoPrev + ' IS NULL) OR (R.IDPLANOPREV = ' + sPlanoPrev + ')) '+ #13 +
                   '                AND (1 = ' + FFlgDocBaixado + ') '+ #13 +
                   //AL_12
                   '                AND (D.CODDOCUMENTO NOT IN (SELECT DISTINCT CODDOCUMENTO FROM LOTEXDOCUM)) '+ #13 +
                   '                AND (D.CODDOCUMENTO = L.CODDOCUMENTO) '+ #13 +
                   '                AND (D.CODDOCUMENTO = R.CODDOCUMENTO) '+ #13 +
                   '                AND (D.CODDOCUMENTO = P.CODDOCUMENTO(+)) '+ #13 +
                   '             GROUP BY D.IDFORCLI, R.IDPLANOPREV, R.IDPATRO, D.IDPESSOA, D.CODDOCUMENTO, D.CODTIPDOC, '+ #13 +
                   '                      D.IDMODULO, D.NUMAPGR, D.NODOCUMENTO, D.COMPLDOCUMENTO, R.CODTIPRECDES, D.RECPAG, R.CODCENTRORESPON '+ #13 +
                   '             HAVING SUM(NVL(L.VALOR,0)-(DECODE(P.VALOR,NULL,0,P.VALOR))) <> 0) A, LANCTODOCUM L '+ #13 +
                   '         WHERE A.CODDOCUMENTO = L.CODDOCUMENTO  '+ #13 +
                   '            AND L.OPERACAO NOT IN (''4 '',''5 '') '+ #13 +
                   '         -- TAG REGNADATA_25_F '+ #13 +
                   '        )  '+ #13 +
                   '        UNION ALL '+ #13 +
                   '        ( '+ #13 +
                   '         -- (2.6) REGISTRO DE RECEBIMENTOS NA DATAREF E MODULO = INVESTIMENTOS '+ #13 +
                   '         -- TAG REGNADATA_26_I '+ #13 +
                   '         SELECT  '+ #13 +
                   '            A.NOMEFORCLI, A.SALDO, A.IDPLANOPREV, A.IDPATRO, A.IDFORCLI, A.CODDOCUMENTO, A.IDPESSOA, A.CODTIPDOC, '+ #13 +
                   '            A.IDMODULO, A.NUMAPGR, A.TIPOREG, A.NODOCUMENTO, L.HISTORICOCOMPL, A.CODTIPRECDES, A.CODCENTRORESPON, A.RECPAG, 0 AS NUMLOTE, 0 AS CODLANCFINANC '+ #13 +
                   '         FROM '+ #13 +
                   '            (SELECT '+ #13 +
                   '                 '' '' AS NOMEFORCLI, SUM(DECODE(L.DEBCRE,''D'',L.VALOR,L.VALOR * -1)-(DECODE(P.VALOR,NULL,0,P.VALOR))) AS SALDO, R.IDPLANOPREV, R.IDPATRO, D.IDFORCLI, '+ #13 +
                   '                 D.CODDOCUMENTO, D.IDPESSOA, D.CODTIPDOC, D.IDMODULO, D.NUMAPGR,'' '' AS TIPOREG,DECODE(D.COMPLDOCUMENTO,NULL, '+ #13 +
                   '                 TO_CHAR(D.NODOCUMENTO),(TO_CHAR(D.NODOCUMENTO)||''/''||D.COMPLDOCUMENTO)) AS NODOCUMENTO, R.CODTIPRECDES, R.CODCENTRORESPON, D.RECPAG '+ #13 +
                   '             FROM '+ #13 +
                   '                DOCUMENTO D,LANCTODOCUM L, '+ #13 +
                   '                (SELECT DISTINCT R1.IDPATRO,R1.IDPLANOPREV,R1.CODTIPRECDES, D1.CODDOCUMENTO, R1.CODCENTRORESPON '+ #13 +
                   '                 FROM RATEIODOCUM R1, DOCUMENTO D1, TIPORECEBDESEMB T  '+ #13 +
                   '                 WHERE '+ #13 +
                   '                    (D1.DATADISPONIB = TO_DATE('''+DateToStr(dDataRef)+''',''DD/MM/YYYY'')) '+ #13 +
                   '                    AND (D1.IDPESSOA = ' + IntToStr(iPessoa) + ') '+ #13 +
                   '                    AND (D1.OPERACAO IN (''2 '')) '+ #13 +
                   '                    AND (D1.RECPAG = ''R'') '+ #13 +
                   '                    AND (D1.IDMODULO  = 79) '+ #13 +
                   '                    AND ((' + sPatro + ' IS NULL) OR (R1.IDPATRO = ' + sPatro + ')) '+ #13 +
                   '                    AND ((' + sPlanoPrev + ' IS NULL) OR (R1.IDPLANOPREV = ' + sPlanoPrev + ')) '+ #13 +
                   '                    AND ((' + sFlgIndRecDes + ' IS NULL) OR (NVL(T.FLGINDICARECDES,''N'') = ' + sFlgIndRecDes + ')) '+ #13 +
                   '                    AND (1 = ' + FFlgDocBaixado + ') '+ #13 +
                   '                    AND (R1.CODTIPRECDES = T.CODTIPRECDES) '+ #13 +
                   '                    AND (R1.IDPESSOA = T.IDPESSOA) '+ #13 +
                   '                    AND (R1.RECPAG = T.RECPAG) '+ #13 +
                   '                    AND (D1.CODDOCUMENTO = R1.CODDOCUMENTO)) R, '+ #13 +
                   '                (SELECT LA.CODDOCUMENTO, DECODE(LA.DEBCRE,''C'',LA.VALOR,LA.VALOR * -1) AS VALOR '+ #13 +
                   '                 FROM RECBTOPAGTO RE, LANCTODOCUM LA '+ #13 +
                   '                 WHERE  '+ #13 +
                   '                    RE.CODPORTFORMA IN (SELECT CODPORTFORMA FROM PORTADORFORMA WHERE LANCAFINANC = ''N'') '+ #13 +
                   '                    AND LA.DEBCRE = ''D'' '+ #13 +
                   '                 AND LA.NUMLANCTO = RE.NUMLANCTO) P  '+ #13 +
                   '             WHERE '+ #13 +
                   '                (D.DATADISPONIB = TO_DATE('''+DateToStr(dDataRef)+''',''DD/MM/YYYY'')) '+ #13 +
                   '                AND (D.IDPESSOA = ' + IntToStr(iPessoa) + ') '+ #13 +
                   '                AND (NVL(L.VALOR,0) <> 0) '+ #13 +
                   '                AND (D.OPERACAO IN (''2 '')) '+ #13 +
                   '                AND (L.OPERACAO <> 5)'+ #13 +
                   '                AND (D.RECPAG = ''R'') '+ #13 +
                   '                AND (D.IDMODULO  = 79) '+ #13 +
                   '                AND ((' + sPatro + ' IS NULL) OR (R.IDPATRO = ' + sPatro + ')) '+ #13 +
                   '                AND ((' + sPlanoPrev + ' IS NULL) OR (R.IDPLANOPREV = ' + sPlanoPrev + ')) '+ #13 +
                   //AL_12
                   '                AND (D.CODDOCUMENTO NOT IN (SELECT DISTINCT CODDOCUMENTO FROM LOTEXDOCUM)) '+ #13 +
                   '                AND (D.CODDOCUMENTO = L.CODDOCUMENTO) '+ #13 +
                   '                AND (D.CODDOCUMENTO = R.CODDOCUMENTO)  '+ #13 +
                   '                AND (D.CODDOCUMENTO = P.CODDOCUMENTO(+)) '+ #13 +
                   '             GROUP BY D.IDFORCLI, R.IDPLANOPREV, R.IDPATRO, D.IDPESSOA, D.CODDOCUMENTO, D.CODTIPDOC, '+ #13 +
                   '                      D.IDMODULO, D.NUMAPGR, D.NODOCUMENTO, D.COMPLDOCUMENTO, '+ #13 +
                   '                      R.CODTIPRECDES, D.RECPAG, R.CODCENTRORESPON '+ #13 +
                   '             HAVING SUM(NVL(L.VALOR,0)-(DECODE(P.VALOR,NULL,0,P.VALOR))) <> 0) A, '+ #13 +
                   '             LANCTODOCUM L  '+ #13 +
                   '         WHERE A.CODDOCUMENTO = L.CODDOCUMENTO '+ #13 +
                   '            AND L.OPERACAO NOT IN (''4 '',''5 '') '+ #13 +
                   '         -- TAG REGNADATA_26_F '+ #13 +
                   '        ) '+ #13 +
                   '        UNION ALL '+ #13 +
                   '        ( '+ #13 +
                   '         -- (2.7) REGISTRO DE PAGAMENTOS NAO BAIXADOS ENGLOBADOS NA DATAREF E MODULO <> INVESTIMENTOS '+ #13 +
                   '         -- TAG REGNADATA_27_I  '+ #13 +
                   '         SELECT '+ #13 +
                   '             A.NOMEFORCLI, SUM(A.SALDO) AS SALDO, A.IDPLANOPREV, A.IDPATRO, A.IDFORCLI, 0 AS CODDOCUMENTO, '+ #13 +
                   '             A.IDPESSOA, A.CODTIPDOC, A.IDMODULO, A.NUMAPGR, A.TIPOREG, B.NODOCUMENTO, B.HISTORICOCOMPL, A.CODTIPRECDES, A.CODCENTRORESPON, A.RECPAG, 0 AS NUMLOTE, 0 AS CODLANCFINANC '+ #13 +
                   '         FROM '+ #13 +
                   '            (SELECT '+ #13 +
                   '                '' '' AS NOMEFORCLI, (SUM(((R.VALORRAT*S.SALDODOC)/abs(SS.SALDOTOT))))-((SUM(((R.VALORRAT*S.SALDODOC)/abs(SS.SALDOTOT))) * DECODE(C.SALDOALT,NULL,0,C.SALDOALT))/SS.SALDOTOT) AS SALDO, '+ #13 +
                   '                R.IDPLANOPREV, R.IDPATRO, D.IDFORCLI, D.CODDOCUMENTO, D.IDPESSOA, D.CODTIPDOC, D.IDMODULO, D.NUMAPGR,  '' '' AS TIPOREG, DECODE(D.COMPLDOCUMENTO,NULL,TO_CHAR(D.NODOCUMENTO),TO_CHAR(D.NODOCUMENTO)||''/''||D.COMPLDOCUMENTO) AS NODOCUMENTO, '+ #13 +
                   '                L.HISTORICOCOMPL, R.CODTIPRECDES, R.CODCENTRORESPON, R.RECPAG, D.NUMFATURA, SS.SALDOTOT, C.SALDOALT  '+ #13 +
                   '             FROM '+ #13 +
                   '                DOCUMENTO D, LANCTODOCUM L, '+ #13 +
                   '                (SELECT '+ #13 +
                   '                    D.NUMFATURA, SUM(DECODE(L.DEBCRE,''D'',L.VALOR,L.VALOR*-1)) AS SALDOTOT  '+ #13 +
                   '                 FROM '+ #13 +
                   '                    DOCUMENTO D, LANCTODOCUM L  '+ #13 +
                   '                 WHERE (D.OPERACAO IN (''1 '')) '+ #13 +
                   '                    AND (D.IDPESSOA = ' + IntToStr(iPessoa) + ') '+ #13 +
                   '                    AND (D.RECPAG = ''P'') '+ #13 +
                   '                    AND (D.NUMFATURA IS NOT NULL) '+ #13 +
                   '                    AND (D.OPERACAO = L.OPERACAO) '+ #13 +
                   '                    AND (D.CODDOCUMENTO = L.CODDOCUMENTO) '+ #13 +
                   '                 GROUP BY D.NUMFATURA) SS, '+ #13 +
                   '                (SELECT  '+ #13 +
                   '                    D.CODDOCUMENTO, SUM(DECODE(L.DEBCRE,''D'',L.VALOR,L.VALOR*-1)) AS SALDODOC '+ #13 +
                   '                 FROM '+ #13 +
                   '                    DOCUMENTO D, LANCTODOCUM L '+ #13 +
                   '                 WHERE '+ #13 +
                   '                    (D.OPERACAO IN (''1 '')) '+ #13 +
                   '                    AND (D.IDPESSOA = ' + IntToStr(iPessoa) + ') '+ #13 +
                   '                    AND (D.RECPAG = ''P'') '+ #13 +
                   '                    AND (L.OPERACAO <> 5) '+ #13 +
                   '                    -- Arnaldo V. Scarin - 19/01/2010 - Inicio'+ #13 +
                   '                    AND NOT Exists (Select 1 From DocumxDocum dxd'+ #13 +
                   '                                    where dxd.iddocumento = d.coddocumento'+ #13 +
                   '                                      and dxd.flgdispfinanc = ''S'')'+ #13 +
                   '                    -- Arnaldo V. Scarin - 19/01/2010 - Fim'+ #13 +
                   '                    AND (D.CODDOCUMENTO = L.CODDOCUMENTO) '+ #13 +
                   '                 GROUP BY D.CODDOCUMENTO) S, '+ #13 +
                   '                (SELECT '+ #13 +
                   '                    D.NUMFATURA, R.CODTIPRECDES, R.IDPLANOPREV, R.IDPATRO, R.IDPESSOA, R.RECPAG, SUM(R.VALOR) AS VALORRAT,R.CODCENTRORESPON '+ #13 +
                   '                 FROM '+ #13 +
                   '                    DOCUMENTO D, RATEIODOCUM R, TIPORECEBDESEMB T '+ #13 +
                   '                 WHERE '+ #13 +
                   '                    (D.OPERACAO IN (''1 '')) '+ #13 +
                   '                    AND (D.IDPESSOA = ' + IntToStr(iPessoa) + ') '+ #13 +
                   '                    AND ((' + sFlgIndRecDes + ' IS NULL) OR (NVL(T.FLGINDICARECDES,''N'') = ' + sFlgIndRecDes + ')) '+ #13 +
                   '                    AND (D.RECPAG = ''P'') '+ #13 +
                   '                    AND (D.NUMFATURA IS NOT NULL) '+ #13 +
                   '                    AND (D.CODDOCUMENTO = R.CODDOCUMENTO) '+ #13 +
                   '                    AND (R.CODTIPRECDES = T.CODTIPRECDES) '+ #13 +
                   '                    AND (R.IDPESSOA = T.IDPESSOA)'+ #13 +
                   '                    AND (R.RECPAG = T.RECPAG) '+ #13 +
                   '                 GROUP BY R.CODTIPRECDES, R.IDPLANOPREV, R.IDPATRO, R.IDPESSOA, R.RECPAG, D.NUMFATURA,R.CODCENTRORESPON) R, '+ #13 +
                   '            (SELECT  '+ #13 +
                   '                D.NUMFATURA, (SUM(DECODE(L.DEBCRE,''D'',L.VALOR,L.VALOR*-1))* -1) AS SALDOALT  '+ #13 +
                   '             FROM '+ #13 +
                   '                DOCUMENTO D, LANCTODOCUM L '+ #13 +
                   '             WHERE '+ #13 +
                   '                (D.OPERACAO IN (''3 '')) '+ #13 +
                   '                AND (D.IDPESSOA = ' + IntToStr(iPessoa) + ') '+ #13 +
                   '                AND (D.RECPAG = ''P'') '+ #13 +
                   '                AND (L.OPERACAO NOT IN (''5 '',''3 '')) '+ #13 +
                   '                AND (D.CODDOCUMENTO = L.CODDOCUMENTO) '+ #13 +
                   '             GROUP BY D.NUMFATURA) C, '+ #13 +
                   '                (SELECT '+ #13 +
                   '                    D.NUMFATURA, D.DATAPROGRAMADA, DECODE(D.COMPLDOCUMENTO,NULL,TO_CHAR(D.NODOCUMENTO),(TO_CHAR(D.NODOCUMENTO)||''/''||D.COMPLDOCUMENTO)) AS NODOCUMENTO '+ #13 +
                   '                 FROM '+ #13 +
                   '                    DOCUMENTO D '+ #13 +
                   '                 WHERE '+ #13 +
                   '                    (D.OPERACAO IN (''3 '')) '+ #13 +
                   '                    AND (D.IDPESSOA = ' + IntToStr(iPessoa) + ') '+ #13 +
                   '                    AND (D.RECPAG = ''P'') '+ #13 +
                   '                    AND (D.NUMFATURA IS NOT NULL)) X '+ #13 +
                   '             WHERE  '+ #13 +
                   '                (X.DATAPROGRAMADA = TO_DATE('''+DateToStr(dDataRef)+''',''DD/MM/YYYY'')) '+ #13 +
                   '                AND (D.RECPAG = ''P'') '+ #13 +
                   '                AND (NVL(SS.SALDOTOT,0) <> 0 ) '+ #13 +
                   '                AND (D.OPERACAO IN (''1 '')) '+ #13 +
                   '                AND (L.OPERACAO <> 5) '+ #13 +
                   '                AND (D.IDMODULO <> 79) '+ #13 +
                   '                AND (D.IDPESSOA = ' + IntToStr(iPessoa) + ') '+ #13 +
                   '                AND (1 = ' + FFlgDocBaixado + ') '+ #13 +
                   '                AND ((' + sPatro + ' IS NULL) OR (R.IDPATRO = ' + sPatro + ')) '+ #13 +
                   '                AND ((' + sPlanoPrev + ' IS NULL) OR (R.IDPLANOPREV = ' + sPlanoPrev + ')) '+ #13 +
                   //AL_12
                   '                AND (D.CODDOCUMENTO NOT IN (SELECT DISTINCT CODDOCUMENTO FROM LOTEXDOCUM)) '+ #13 +
                   '                AND (D.CODDOCUMENTO = L.CODDOCUMENTO) '+ #13 +
                   '                AND (D.OPERACAO = L.OPERACAO) '+ #13 +
                   '                AND (D.NUMFATURA = R.NUMFATURA) '+ #13 +
                   '                AND (D.CODDOCUMENTO = S.CODDOCUMENTO) '+ #13 +
                   '                AND (D.NUMFATURA = SS.NUMFATURA) '+ #13 +
                   '                AND (D.NUMFATURA = C.NUMFATURA(+)) '+ #13 +
                   '                AND (D.NUMFATURA = X.NUMFATURA) '+ #13 +
                   '             GROUP BY D.IDFORCLI, D.DATAVENCTO, D.COMPLDOCUMENTO, D.NODOCUMENTO, D.DATAPROGRAMADA, '+ #13 +
                   '                     L.HISTORICOCOMPL, L.DATALANCTO, R.CODTIPRECDES, R.IDPLANOPREV, R.IDPATRO, '+ #13 +
                   '                     R.RECPAG, D.IDPESSOA, D.OPERACAO, D.CODTIPDOC, D.IDMODULO, D.CODDOCUMENTO, '+ #13 +
                   '                     R.CODCENTRORESPON, D.NUMAPGR, D.NUMFATURA, SS.SALDOTOT, C.SALDOALT) A, '+ #13 +
                   //AL_17
                   '            (SELECT '+ #13 +
                   '                D.CODDOCUMENTO, D.NUMFATURA, D.DATAPROGRAMADA, DECODE(D.COMPLDOCUMENTO,NULL,TO_CHAR(D.NODOCUMENTO),(TO_CHAR(D.NODOCUMENTO)||''/''||D.COMPLDOCUMENTO)) AS NODOCUMENTO, L.HISTORICOCOMPL  '+ #13 +
                   '             FROM '+ #13 +
                   '                DOCUMENTO D, LANCTODOCUM L '+ #13 +
                   '             WHERE '+ #13 +
                   '                (D.OPERACAO IN (''3 '')) '+ #13 +
                   '                AND (D.IDPESSOA = ' + IntToStr(iPessoa) + ') '+ #13 +
                   '                AND (D.RECPAG = ''P'') '+ #13 +
                   '                AND (D.NUMFATURA IS NOT NULL) '+ #13 +
                   '                AND (L.OPERACAO = 3) '+ #13 +
                   '                AND (D.CODDOCUMENTO NOT IN (SELECT DISTINCT CODDOCUMENTO FROM LOTEXDOCUM)) '+ #13 + // Se já existir na MovimFinanc
                   '                AND (D.CODDOCUMENTO = L.CODDOCUMENTO) '+ #13 +
                   '             UNION  '+ #13 +
                   '             SELECT '+ #13 +
                   '                D.CODDOCUMENTO, D.NUMFATURA, D.DATAPROGRAMADA, DECODE(D.COMPLDOCUMENTO,NULL,TO_CHAR(D.NODOCUMENTO),(TO_CHAR(D.NODOCUMENTO)||''/''||D.COMPLDOCUMENTO)) AS NODOCUMENTO, L.HISTORICOCOMPL  '+ #13 +
                   '             FROM '+ #13 +
                   '                DOCUMENTO D, LANCTODOCUM L '+ #13 +
                   '             WHERE '+ #13 +
                   '                (D.OPERACAO IN (''3 '')) '+ #13 +
                   '                AND (D.IDPESSOA = ' + IntToStr(iPessoa) + ') '+ #13 +
                   '                AND (D.RECPAG = ''P'') '+ #13 +
                   '                AND (D.NUMFATURA IS NOT NULL) '+ #13 +
                   '                AND (L.OPERACAO = 5) '+ #13 + // Registros de baixa
                   '                AND (L.ESTORNO IS NULL) '+ #13 + // Registros não estornados
                   '                AND (D.CODDOCUMENTO = L.CODDOCUMENTO)) B '+ #13 +
                   '         WHERE '+ #13 +
                   '             A.NUMFATURA=B.NUMFATURA(+) '+ #13 +
                   //AL_17
                   '             AND (B.CODDOCUMENTO NOT IN (SELECT DISTINCT CODDOCUMENTO FROM LOTEXDOCUM)) '+ #13 +
                   '             AND (B.CODDOCUMENTO NOT IN (SELECT DISTINCT CODDOCUMENTO FROM RECBTOPAGTO)) '+ #13 + // Se já existir na MovimFinanc
                   '         GROUP BY '+ #13 +
                   '             A.NOMEFORCLI, A.IDPLANOPREV, A.IDPATRO, A.IDFORCLI, A.IDPESSOA, A.CODTIPDOC, '+ #13 +
                   '             A.IDMODULO, A.NUMAPGR, A.TIPOREG, B.NODOCUMENTO, B.HISTORICOCOMPL, A.CODTIPRECDES,  '+ #13 +
                   '             A.CODCENTRORESPON, A.RECPAG  '+ #13 +
                   '        -- TAG REGNADATA_27_F '+ #13 +
                   '        ) '+ #13 +
                   '        UNION ALL  '+ #13 +
                   '        ( '+ #13 +
                   '         -- (2.8) REGISTRO NA DATAREF DE IRRF QUE NAO ESTAO EM DARF GERADO '+ #13 +
                   '         -- TAG REGNADATA_28_I '+ #13 +
                   '         SELECT '+ #13 +
                   '            DISTINCT '+ #13 +
                   '            '' '' AS NOMEFORCLI, S.VALOR*-1 AS SALDO, R.IDPLANOPREV, R.IDPATRO, D.IDFORCLI, D.CODDOCUMENTO, D.IDPESSOA, D.CODTIPDOC, D.IDMODULO, 0 AS NUMAPGR, '+ #13 +
                   '            '' '' AS TIPOREG, DECODE(D.COMPLDOCUMENTO,NULL,TO_CHAR(D.NODOCUMENTO),(TO_CHAR(D.NODOCUMENTO)||''/''||D.COMPLDOCUMENTO)) AS NODOCUMENTO, L.HISTORICOCOMPL, R.CODTIPRECDES, R.CODCENTRORESPON, R.RECPAG, 0 AS NUMLOTE, 0 AS CODLANCFINANC '+ #13 +
                   '         FROM '+ #13 +
                   '            DOCUMENTO D, LANCIRRF I, LANCTODOCUM L, RATEIODOCUM R,  TIPORECEBDESEMB T, '+ #13 +
                   '            (SELECT CODALTERADOR FROM ALTXIMPOSTO WHERE CODIMPOSTO=1) X, '+ #13 +
                   '            (SELECT '+ #13 +
                   '                L.CODDOCUMENTO,L.CODALTERADOR,L.VALOR,L.NUMLANCTO '+ #13 +
                   '             FROM '+ #13 +
                   '                LANCTODOCUM L, DOCUMENTO D '+ #13 +
                   '             WHERE '+ #13 +
                   '                (D.DATAVENCTO BETWEEN TO_DATE('''+DateToStr(dDataIniIRRF)+''',''DD/MM/YYYY'') AND TO_DATE('''+DateToStr(dDataFimIRRF)+''',''DD/MM/YYYY'')) '+ #13 +
                   '                AND (CODALTERADOR IN (SELECT CODALTERADOR FROM ALTXIMPOSTO WHERE CODIMPOSTO=1)) '+ #13 +
                   '                AND (L.CODDOCUMENTO=D.CODDOCUMENTO)) S '+ #13 +
                   '         WHERE '+ #13 +
                   '            (I.IDDARF IS NULL) '+ #13 +
                   '            AND (VLRIRRF <> 0) '+ #13 +
                   '            AND (L.CODALTERADOR IN X.CODALTERADOR) '+ #13 +
                   '            AND (D.RECPAG = ''P'') '+ #13 +
                   '            AND (D.IDPESSOA = ' + IntToStr(iPessoa) + ') '+ #13 +
                   '            AND (L.OPERACAO <> 5) '+ #13 +
                   '            AND (D.STATUS=2) '+ #13 +
                   '            AND ((' + sPatro + ' IS NULL) OR (R.IDPATRO = ' + sPatro + ')) '+ #13 +
                   '            AND ((' + sPlanoPrev + ' IS NULL) OR (R.IDPLANOPREV = ' + sPlanoPrev + ')) '+ #13 +
                   '            AND ((' + sFlgIndRecDes + ' IS NULL) OR (NVL(T.FLGINDICARECDES,''N'') = ' + sFlgIndRecDes + ')) '+ #13 +
                   '            AND (1 = ' + FFlgDocBaixado + ') '+ #13 +
                   '            AND (D.CODDOCUMENTO = S.CODDOCUMENTO) '+ #13 +
                   '            AND (D.CODDOCUMENTO = L.CODDOCUMENTO) '+ #13 +
                   '            AND (D.CODDOCUMENTO = R.CODDOCUMENTO) '+ #13 +
                   '            AND (D.CODDOCUMENTO = I.CODDOCUMENTO(+)) '+ #13 +
                   '            AND (R.CODTIPRECDES = T.CODTIPRECDES) '+ #13 +
                   '            AND (R.IDPESSOA = T.IDPESSOA) '+ #13 +
                   '            AND (R.RECPAG = T.RECPAG) '+ #13 +
                   '         -- TAG REGNADATA_28_F '+ #13 +
                   '         ) '+ #13;

                   // Alterado por Arnaldo V. Scarin em 20/01/2010
                   // SOL:  KTN:
                   sSql :=  sSql +
                   '        --bruno bastos - 26/11/2009 - início'+ #13 +
//                   '        UNION ALL'+ #13 +
//                   '        ('+ #13 +
//                   '         -- (2.9) REGISTRO DE PAGAMENTOS BAIXADOS NA DATAREF PARA DOCUMENTOS DA DOCUMXDOCUM <> DE CPMF'+ #13 +
//                   '         -- TAG REGNADATA_29_I'+ #13 +
//                   '         SELECT'+ #13 +
//                   '            A.NOMEFORCLI, A.SALDO, A.IDPLANOPREV, A.IDPATRO, A.IDFORCLI, A.CODDOCUMENTO, A.IDPESSOA, A.CODTIPDOC, A.IDMODULO,'+
//                               'A.NUMAPGR, A.TIPOREG, A.NODOCUMENTO, L.HISTORICOCOMPL, A.CODTIPRECDES, A.CODCENTRORESPON, A.RECPAG, 0 AS NUMLOTE, 0 AS CODLANCFINANC '+ #13 +
//                   '         FROM'+ #13 +
//                   '            (SELECT'+ #13 +
//                   '                 '''' AS NOMEFORCLI, SUM(DECODE(L.DEBCRE,''C'',L.VALOR,L.VALOR * -1)-(DECODE(P.VALOR,NULL,0,P.VALOR))) AS SALDO,'+
//                                     'R.IDPLANOPREV, R.IDPATRO, D.IDFORCLI, D.CODDOCUMENTO, D.IDPESSOA, D.CODTIPDOC, D.IDMODULO, D.NUMAPGR,'' '' AS TIPOREG,'+
//                                     'DECODE(D.COMPLDOCUMENTO,NULL,TO_CHAR(D.NODOCUMENTO),(TO_CHAR(D.NODOCUMENTO)||''/''||D.COMPLDOCUMENTO)) AS NODOCUMENTO, R.CODTIPRECDES, R.CODCENTRORESPON, D.RECPAG'+ #13 +
//                   '             FROM'+ #13 +
//                   '                DOCUMENTO D,LANCTODOCUM L,'+ #13 +
//                   '                --bruno bastos - 26/11/2009'+ #13 +
//                   '                documxdocum dxd,'+ #13 +
//                   '                (SELECT DISTINCT R1.IDPATRO,R1.IDPLANOPREV,R1.CODTIPRECDES, D1.CODDOCUMENTO, R1.CODCENTRORESPON'+ #13 +
//                   '                 FROM RATEIODOCUM R1, DOCUMENTO D1'+ #13 +
//                   '                 WHERE  (D1.DATADISPONIB = TO_DATE('''+DateToStr(dDataRef)+''',''DD/MM/YYYY''))'+ #13 +
//                   '                    AND (D1.IDPESSOA = 1)'+ #13 +
//                   '                    AND (D1.OPERACAO IN (''2 '')) '+ #13 +
//                   '                    AND (D1.RECPAG = ''P'')'+ #13 +
//                   '                    AND ((' + sPatro + ' IS NULL) OR (R1.IDPATRO = ' + sPatro + '))'+ #13 +
//                   '                    AND ((' + sPlanoPrev + ' IS NULL) OR (R1.IDPLANOPREV = ' + sPlanoPrev + '))'+ #13 +
//                   '                    AND (D1.CODDOCUMENTO = R1.CODDOCUMENTO)) R,'+ #13 +
//                   '                (SELECT LA.CODDOCUMENTO, DECODE(LA.DEBCRE,''D'',LA.VALOR,LA.VALOR * -1) AS VALOR'+ #13 +
//                   '                 FROM RECBTOPAGTO RE, LANCTODOCUM LA'+ #13 +
//                   '                 WHERE'+ #13 +
//                   '                    RE.CODPORTFORMA IN (SELECT CODPORTFORMA FROM PORTADORFORMA WHERE LANCAFINANC = ''N'')'+ #13 +
//                   '                    AND LA.DEBCRE = ''D'''+ #13 +
//                   '                 AND LA.NUMLANCTO = RE.NUMLANCTO) P'+ #13 +
//                   '             WHERE  (D.DATADISPONIB = TO_DATE('''+DateToStr(dDataRef)+''',''DD/MM/YYYY''))'+ #13 +
//                   '                --bruno bastos - 26/11/2009'+ #13 +
//                   '                and (dxd.iddocumento   = d.coddocumento)'+ #13 +
//                   '                and (dxd.flgdispfinanc = ''S'')'+ #13 +
//                   '                -- Arnaldo V. Scarin - 20/01/2010 - Inicio'+ #13 +
//                   '                and Exists (Select 1 From lanctoDocum lctdoc'+ #13 +
//                   '                            where lctdoc.coddocumento = dxd.iddocumentopai'+ #13 +
//                   '                              and lctdoc.operacao = ''5 '')'+ #13 +
//                   '                -- Arnaldo V. Scarin - 20/01/2010 - Fim'+ #13 +
//                   '                AND (D.IDPESSOA = 1)'+ #13 +
//                   '                AND (NVL(L.VALOR,0) <> 0)'+ #13 +
//                   '                AND (D.OPERACAO IN (''2 ''))'+ #13 +
//                   '                AND (L.OPERACAO = 5)'+ #13 +
//                   '                AND (D.RECPAG = ''P'')'+ #13 +
//                   '                AND ((' + sPatro + ' IS NULL) OR (R.IDPATRO = ' + sPatro + '))'+ #13 +
//                   '                AND ((' + sPlanoPrev + ' IS NULL) OR (R.IDPLANOPREV = ' + sPlanoPrev + '))'+ #13 +
//                   '                AND (D.CODDOCUMENTO = L.CODDOCUMENTO)'+ #13 +
//                   '                AND (D.CODDOCUMENTO = R.CODDOCUMENTO)'+ #13 +
//                   '                AND (D.CODDOCUMENTO = P.CODDOCUMENTO(+))'+ #13 +
//                   '             GROUP BY D.IDFORCLI, R.IDPLANOPREV, R.IDPATRO, D.IDPESSOA, D.CODDOCUMENTO, D.CODTIPDOC,'+ #13 +
//                   '                      D.IDMODULO, D.NUMAPGR, D.NODOCUMENTO, D.COMPLDOCUMENTO,'+ #13 +
//                   '                      R.CODTIPRECDES, D.RECPAG, R.CODCENTRORESPON'+ #13 +
//                   '             HAVING SUM(NVL(L.VALOR,0)-(DECODE(P.VALOR,NULL,0,P.VALOR))) <> 0) A,'+ #13 +
//                   '             LANCTODOCUM L'+ #13 +
//                   '         WHERE A.CODDOCUMENTO = L.CODDOCUMENTO'+ #13 +
//                   '            AND L.OPERACAO IN (''5 '')'+ #13 +
//                   '         -- TAG REGNADATA_29_F'+ #13 +
//                   '        )'+ #13 +
                   '        UNION ALL'+ #13 +
                   '        ('+ #13 +
                   '         -- (2.10) REGISTRO DE RECEBIMENTOS NA DATAREF PARA DOCUMENTOS DA DOCUMXDOCUM <> DE CPMF'+ #13 +
                   '         -- TAG REGNADATA_210_I'+ #13 +
                   '         SELECT'+ #13 +
                   '            A.NOMEFORCLI, A.SALDO, A.IDPLANOPREV, A.IDPATRO, A.IDFORCLI, A.CODDOCUMENTO, A.IDPESSOA, A.CODTIPDOC,'+
                               'A.IDMODULO, A.NUMAPGR, A.TIPOREG, A.NODOCUMENTO, L.HISTORICOCOMPL, A.CODTIPRECDES, A.CODCENTRORESPON, A.RECPAG, 0 AS NUMLOTE, 0 AS CODLANCFINANC '+ #13 +
                   '         FROM'+ #13 +
                   '            (SELECT'+ #13 +
                   '                 '''' AS NOMEFORCLI, SUM(DECODE(L.DEBCRE,''D'',L.VALOR,L.VALOR * -1)-(DECODE(P.VALOR,NULL,0,P.VALOR))) AS SALDO,'+
                                     'R.IDPLANOPREV, R.IDPATRO, D.IDFORCLI, D.CODDOCUMENTO, D.IDPESSOA, D.CODTIPDOC, D.IDMODULO, D.NUMAPGR,'' '' AS TIPOREG,'+
                                     'DECODE(D.COMPLDOCUMENTO,NULL,TO_CHAR(D.NODOCUMENTO),(TO_CHAR(D.NODOCUMENTO)||''/''||D.COMPLDOCUMENTO)) AS NODOCUMENTO, R.CODTIPRECDES, R.CODCENTRORESPON, D.RECPAG'+ #13 +
                   '             FROM'+ #13 +
                   '                DOCUMENTO D,LANCTODOCUM L,'+ #13 +
                   '                --bruno bastos - 26/11/2009'+ #13 +
                   '                DOCUMXDOCUM DXD,'+ #13 +
                   '                (SELECT DISTINCT R1.IDPATRO,R1.IDPLANOPREV,R1.CODTIPRECDES, D1.CODDOCUMENTO, R1.CODCENTRORESPON'+ #13 +
                   '                 FROM RATEIODOCUM R1, DOCUMENTO D1'+ #13 +
                   '                 WHERE  (D1.DATADISPONIB = TO_DATE('''+DateToStr(dDataRef)+''',''DD/MM/YYYY''))'+ #13 +
                   '                    AND (D1.IDPESSOA = 1)'+ #13 +
                   '                    AND (D1.OPERACAO IN (''2 ''))'+ #13 +
                   '                    AND (D1.RECPAG = ''R'')'+ #13 +
                   '                    AND ((' + sPatro + ' IS NULL) OR (R1.IDPATRO = ' + sPatro + '))'+ #13 +
                   '                    AND ((' + sPlanoPrev + ' IS NULL) OR (R1.IDPLANOPREV = ' + sPlanoPrev + '))'+ #13 +
                   '                    AND (D1.CODDOCUMENTO = R1.CODDOCUMENTO)) R,'+ #13 +
                   '                (SELECT LA.CODDOCUMENTO, DECODE(LA.DEBCRE,''C'',LA.VALOR,LA.VALOR * -1) AS VALOR'+ #13 +
                   '                 FROM RECBTOPAGTO RE, LANCTODOCUM LA'+ #13 +
                   '                 WHERE  RE.CODPORTFORMA IN (SELECT CODPORTFORMA FROM PORTADORFORMA WHERE LANCAFINANC = ''N'')'+ #13 +
                   '                   AND LA.DEBCRE = ''D'''+ #13 +
                   '                   AND LA.NUMLANCTO = RE.NUMLANCTO) P'+ #13 +
                   '             WHERE  (D.DATADISPONIB = TO_DATE('''+DateToStr(dDataRef)+''',''DD/MM/YYYY''))'+ #13 +
                   '                AND (D.IDPESSOA = 1)'+ #13 +
                   '                 --bruno bastos - 26/11/2009'+ #13 +
                   '                AND (D.CODDOCUMENTO = DXD.IDDOCUMENTO)'+ #13 +
                   '                AND (DXD.FLGDISPFINANC = ''S'')'+ #13 +
                   '                -- Arnaldo V. Scarin - 20/01/2010 - Inicio'+ #13 +
                   '                and Not Exists (Select 1 From lanctoDocum lctdoc'+ #13 +
                   '                                where lctdoc.coddocumento = dxd.iddocumentopai'+ #13 +
                   '                                  and lctdoc.operacao = ''5 '')'+ #13 +
                   '                -- Arnaldo V. Scarin - 20/01/2010 - Fim'+ #13 +
                   '                AND (NVL(L.VALOR,0) <> 0)'+ #13 +
                   '                AND (D.OPERACAO IN (''2 ''))'+ #13 +
                   '                AND (L.OPERACAO <> 5)'+ #13 +
                   '                AND (D.RECPAG = ''R'')'+ #13 +
                   '                AND ((' + sPatro + ' IS NULL) OR (R.IDPATRO = ' + sPatro + '))'+ #13 +
                   '                AND ((' + sPlanoPrev + ' IS NULL) OR (R.IDPLANOPREV = ' + sPlanoPrev + '))'+ #13 +
                   '                AND (D.CODDOCUMENTO = L.CODDOCUMENTO)'+ #13 +
                   '                AND (D.CODDOCUMENTO = R.CODDOCUMENTO)'+ #13 +
                   '                AND (D.CODDOCUMENTO = P.CODDOCUMENTO(+))'+ #13 +
                   '             GROUP BY D.IDFORCLI, R.IDPLANOPREV, R.IDPATRO, D.IDPESSOA, D.CODDOCUMENTO, D.CODTIPDOC,'+ #13 +
                   '                      D.IDMODULO, D.NUMAPGR, D.NODOCUMENTO, D.COMPLDOCUMENTO,'+ #13 +
                   '                      R.CODTIPRECDES, D.RECPAG, R.CODCENTRORESPON'+ #13 +
                   '             HAVING SUM(NVL(L.VALOR,0)-(DECODE(P.VALOR,NULL,0,P.VALOR))) <> 0) A,'+ #13 +
                   '             LANCTODOCUM L'+ #13 +
                   '         WHERE A.CODDOCUMENTO = L.CODDOCUMENTO'+ #13 +
                   '            AND L.OPERACAO NOT IN (''4 '',''5 '')'+ #13 +
                   '         -- TAG REGNADATA_210_F'+ #13 +
                   '        )'+ #13 +
                   '        --bruno bastos - 26/11/2009 - fim'+ #13;

                   sSql :=  sSql +
                   '       ) U '+ #13 +
                   '    WHERE '+ #13 +
                   '       ((' + sPatro + ' IS NULL) OR (U.IDPATRO = ' + sPatro + ')) '+ #13 +
                   '       AND ((' + sPlanoPrev + ' IS NULL) OR (U.IDPLANOPREV = ' + sPlanoPrev + ')) '+ #13 +
                   '       AND (U.IDFORCLI = P.IDPESSOA(+)) '+ #13 +
                   '       AND (U.IDPLANOPREV = PP.IDPLANOPREV(+)) '+ #13 +
                   '       AND (U.IDPATRO = PT.IDPESSOA(+)) '+ #13 +
                   '       AND (U.CODTIPDOC = TD.CODTIPDOC(+)) '+ #13 +
                   '       AND (U.CODTIPRECDES = T.CODTIPRECDES(+)) '+ #13 +
                   '       AND (U.IDPESSOA = T.IDPESSOA(+)) '+ #13 +
                   '       AND (U.RECPAG = T.RECPAG(+))  '+ #13 +
                   '       AND (U.IDMODULO = M.IDMODULO(+))  ';

                   //Marilza Colpani - SOL: 122335/Kintana: 598524 - início
                   if sAtivPlano <> '' then
                     sSQL := sSql + ' AND (PP.ATIVO = '+ QuotedStr (sAtivPlano) + ')';
                   //Marilza Colpani - SOL: 122335/Kintana: 598524 - início

                   //AL_17
                   if sGrupo = 'Plano/Patro' then
                      sSql :=  sSql + '    GROUP BY U.CODTIPDOC, U.NODOCUMENTO,DECODE(U.IDFORCLI,-1,U.NODOCUMENTO,P.RAZAOSOCIAL), U.IDPLANOPREV,U.IDPATRO,U.IDMODULO, U.CODCENTRORESPON, U.NUMAPGR,U.IDPESSOA, U.NUMLOTE, U.CODLANCFINANC '
                   else if sGrupo = 'Plano' then
                      sSql :=  sSql + '    GROUP BY U.CODTIPDOC, U.NODOCUMENTO,DECODE(U.IDFORCLI,-1,U.NODOCUMENTO,P.RAZAOSOCIAL), U.IDPLANOPREV,U.IDMODULO, U.CODCENTRORESPON, U.NUMAPGR,U.IDPESSOA, U.NUMLOTE, U.CODLANCFINANC '
                   else if sGrupo = 'Patro' then
                      sSql :=  sSql + '    GROUP BY U.CODTIPDOC, U.NODOCUMENTO,DECODE(U.IDFORCLI,-1,U.NODOCUMENTO,P.RAZAOSOCIAL),U.IDPATRO,U.IDMODULO, U.CODCENTRORESPON, U.NUMAPGR,U.IDPESSOA, U.NUMLOTE, U.CODLANCFINANC ';
                   sSql :=  sSql + ' '+ #13 +
                   '    -- TAG REGNADATA_20_F '+ #13 +
                   '    UNION ALL '+ #13 +
                   '    -- (3.0) REGISTROS NA DATAREF DE CPMF '+ #13 +
                   '    -- TAG REGNADATA_30_I '+ #13 +
                   '    SELECT '+ #13 +
                   '       DECODE(XX.IDFORCLI,-1,'' '',''CPMF - ''||P.NOME) AS NOMEFORCLI, XX.SALDO, '' '' AS NODOCUMENTO, 0 AS NUMAPGR, ';
                   if sGrupo = 'Plano/Patro' then
                      sSql :=  sSql + ' XX.IDPLANOPREV, XX.IDPATRO, '
                   else if sGrupo = 'Plano' then
                      sSql :=  sSql + ' XX.IDPLANOPREV, '' '' AS IDPATRO, '
                   else if sGrupo = 'Patro' then
                      sSql :=  sSql + ' '' '' AS IDPLANOPREV, XX.IDPATRO, ';
                   sSql :=  sSql + '       3 AS TIPOREG, '' '' AS CODCENTRORESPON, XX.IDPESSOA, 0 AS NUMLOTE, 0 AS CODLANCFINANC '+ #13 +
                   '         '+ #13 +
                   '    FROM  '+ #13 +
                   '       PESSOA P, '+ #13 +
                   '       (SELECT '+ #13 +
                   '           X.IDFORCLI, SUM(X.SALDO * -1) AS SALDO, ';
                   if sGrupo = 'Plano/Patro' then
                      sSql :=  sSql + ' X.IDPLANOPREV, X.IDPATRO, '
                   else if sGrupo = 'Plano' then
                      sSql :=  sSql + ' X.IDPLANOPREV, '' '' AS IDPATRO, '
                   else if sGrupo = 'Patro' then
                      sSql :=  sSql + ' '' '' AS IDPLANOPREV, X.IDPATRO, ';
                   sSql :=  sSql + ' X.IDPESSOA '+ #13 +
                   '        FROM '+ #13 +
                   '           ( '+ #13 +
                   '            -- (3.1) REGISTROS BAIXADOS NA DATAREF DE CPMF '+ #13 +
                   '            -- TAG REGNADATA_31_I '+ #13 +
                   '            SELECT '+ #13 +
                   '               PO.IDBANCO AS IDFORCLI, 0 AS NUMAPGR, '' '' AS NODOCUMENTO, ';
                   if sGrupo = 'Plano/Patro' then
                      sSql :=  sSql + ' R.IDPLANOPREV, R.IDPATRO, '
                   else if sGrupo = 'Plano' then
                      sSql :=  sSql + ' R.IDPLANOPREV, '' '' AS IDPATRO, '
                   else if sGrupo = 'Patro' then
                      sSql :=  sSql + ' '' '' AS IDPLANOPREV, R.IDPATRO, ';
                   sSql :=  sSql + ' M.IDPESSOA, '' '' AS CODCENTRORESPON, SUM(R.VALOR) AS SALDO '+ #13 +
                   '            FROM '+ #13 +
                   '               MOVIMFINANC M, RATEIOFINANC R, PORTADORCONTA PO,  TIPORECEBDESEMB T '+ #13 +
                   '            WHERE '+ #13 +
                   '               (M.CODLANCFINANC IN(SELECT M.CODLANCFINANC FROM MOVIMFINANC M '+ #13 +
                   '                                   WHERE (IDMODULO = 3) '+ #13 +
                   '                                      AND (IDPESSOA = ' + IntToStr(iPessoa) + ') '+ #13 +
                   '                                      AND (DATALANCFINAN = TO_DATE('''+DateToStr(dDataRef)+''',''DD/MM/YYYY'')) '+ #13 +
                   '                                      AND (M.CODLANCFINANC IN (SELECT DISTINCT CODLANCFINANC FROM RATEIOFINANC '+ #13 +
                   '                                                               WHERE CODTIPDOC = (SELECT CODTIPDOCCPMF FROM PARAMCAP WHERE IDPESSOA = ' + IntToStr(iPessoa) + ' AND RECPAG = ''P''))))) '+ #13 +
                   '               AND ((' + sPatro + ' IS NULL) OR (R.IDPATRO = ' + sPatro + ')) '+ #13 +
                   '               AND ((' + sPlanoPrev + ' IS NULL) OR (R.IDPLANOPREV = ' + sPlanoPrev + ')) '+ #13 +
                   '               AND ((' + sFlgIndRecDes + ' IS NULL) OR (NVL(T.FLGINDICARECDES,''N'') = ' + sFlgIndRecDes + ')) '+ #13 +
                   '               AND (M.CODLANCFINANC = R.CODLANCFINANC) '+ #13 +
                   '               AND (M.CODPORTADOR = PO.CODPORTADOR) '+ #13 +
                   '               AND (R.CODTIPRECDES = T.CODTIPRECDES) '+ #13 +
                   '               AND (R.IDPESSOA = T.IDPESSOA) '+ #13 +
                   '               AND (R.RECPAG = T.RECPAG) '+ #13 +
                   '            GROUP BY R.IDPLANOPREV,R.IDPATRO,M.IDPESSOA,M.CODPORTADOR,PO.IDBANCO '+ #13 +
                   '            -- TAG REGNADATA_31_F '+ #13 +
                   '            UNION ALL '+ #13 +
                   '            -- (3.2) REGISTROS NA DATAREF DE CPMF NAO BAIXADOS '+ #13 +
                   '            -- TAG REGNADATA_32_I '+ #13 +
                   '            SELECT '+ #13 +
                   '               D.IDFORCLI, D.NUMAPGR, DECODE(D.COMPLDOCUMENTO,NULL,TO_CHAR(D.NODOCUMENTO),(TO_CHAR(D.NODOCUMENTO)||''/''||D.COMPLDOCUMENTO)) AS NODOCUMENTO, ';
                   if sGrupo = 'Plano/Patro' then
                      sSql :=  sSql + ' R.IDPLANOPREV, R.IDPATRO, '
                   else if sGrupo = 'Plano' then
                      sSql :=  sSql + ' R.IDPLANOPREV, '' '' AS IDPATRO, '
                   else if sGrupo = 'Patro' then
                      sSql :=  sSql + ' '' '' AS IDPLANOPREV, R.IDPATRO, ';
                   sSql :=  sSql + ' D.IDPESSOA, R.CODCENTRORESPON, SUM(R.VALOR) AS SALDO '+ #13 +
                   '            FROM '+ #13 +
                   '               DOCUMENTO D, LANCTODOCUM L, RATEIODOCUM R, TIPORECEBDESEMB T, '+ #13 +
                   '               (SELECT P.CODTIPDOCCPMF FROM PARAMCAP P WHERE P.IDPESSOA = ' + IntToStr(iPessoa) + ' AND P.RECPAG = ''P'') P  '+ #13 +
                   '            WHERE '+ #13 +
                   '               (D.DATAPROGRAMADA = TO_DATE('''+DateToStr(dDataRef)+''',''DD/MM/YYYY'')) '+ #13 +
                   '               AND (D.IDPESSOA = ' + IntToStr(iPessoa) + ') '+ #13 +
                   '               AND (D.RECPAG = ''P'') '+ #13 +
                   '               AND (D.OPERACAO IN (''2 '',''1 '')) '+ #13 +
                   '               AND (D.STATUS <> ''2'') '+ #13 +
                   '               AND ((' + sPatro + ' IS NULL) OR (R.IDPATRO = ' + sPatro + ')) '+ #13 +
                   '               AND ((' + sPlanoPrev + ' IS NULL) OR (R.IDPLANOPREV = ' + sPlanoPrev + ')) '+ #13 +
                   '               AND ((' + sFlgIndRecDes + ' IS NULL) OR (NVL(T.FLGINDICARECDES,''N'') = ' + sFlgIndRecDes + ')) '+ #13 +
                   '               AND (1 = ' + FFlgDocBaixado + ') '+ #13 +
                   '               AND (D.CODTIPDOC = P.CODTIPDOCCPMF) '+ #13 +
                   '               AND (D.CODDOCUMENTO = L.CODDOCUMENTO) '+ #13 +
                   '               AND (D.CODDOCUMENTO = R.CODDOCUMENTO) '+ #13 +
                   '               AND (R.CODTIPRECDES = T.CODTIPRECDES) '+ #13 +
                   '               AND (R.IDPESSOA = T.IDPESSOA) '+ #13 +
                   '               AND (R.RECPAG = T.RECPAG) '+ #13 +
                   '            GROUP BY D.IDFORCLI, D.NUMAPGR, D.COMPLDOCUMENTO, D.NODOCUMENTO, R.IDPLANOPREV, R.IDPATRO, D.IDPESSOA, R.CODCENTRORESPON '+ #13 +
                   '            -- TAG REGNADATA_32_F '+ #13 +
                   '            UNION ALL  '+ #13 +
                   '            -- (3.3) REGISTROS NA DATAREF DE CPMF NAO BAIXADOS DE TRANSF ENTRE CONTAS '+ #13 +
                   '            -- TAG REGNADATA_33_I '+ #13 +
                   '            SELECT  '+ #13 +
                   '               I.IDFORCLI, 0 AS NUMAPGR, '' '' AS NODOCUMENTO, ';
                   if sGrupo = 'Plano/Patro' then
                      sSql :=  sSql + ' R.IDPLANOPREV, R.IDPATRO, '
                   else if sGrupo = 'Plano' then
                      sSql :=  sSql + ' R.IDPLANOPREV, '' '' AS IDPATRO, '
                   else if sGrupo = 'Patro' then
                      sSql :=  sSql + ' '' '' AS IDPLANOPREV, R.IDPATRO, ';
                   sSql :=  sSql + ' I.IDPESSOA, '' '' AS CODCENTRORESPON, SUM(R.VLRCPMF) AS SALDO  '+ #13 +
                   '            FROM '+ #13 +
                   '                IMPOSTORETIDO  I, RATEIOIMPOSTORETIDO R  '+ #13 +
                   '            WHERE '+ #13 +
                   '                I.DATARETENCAO = TO_DATE('''+DateToStr(dDataRef)+''',''DD/MM/YYYY'') '+ #13 +
                   '                AND I.CODTIPOCUSTAGREG = (SELECT CODTIPOCUSTAGREG FROM PARAMFINANC) '+ #13 +
                   '                AND I.CODDOCUMENTO IS NULL '+ #13 +
                   '                AND I.NUMLOTEMANUAL = 0  '+ #13 +
                   '                AND I.CODLANCFINANC IS NOT NULL '+ #13 +
                   '                AND I.IDPESSOA = ' + IntToStr(iPessoa) + #13 +
                   '                AND (1 = ' + FFlgDocBaixado + ') '+ #13 +
                   '                AND ((' + sPatro + ' IS NULL) OR (R.IDPATRO = ' + sPatro + ')) '+ #13 +
                   '                AND ((' + sPlanoPrev + ' IS NULL) OR (R.IDPLANOPREV = ' + sPlanoPrev + ')) '+ #13 +
                   '                AND (I.IDIMPOSTORETIDO = R.IDIMPOSTORETIDO) '+ #13 +
                   '            GROUP BY R.IDPLANOPREV,R.IDPATRO, I.IDPESSOA, I.CODPORTADOR, I.IDFORCLI  '+ #13 +
                   '            -- TAG REGNADATA_33_F '+ #13 +
                   '       ) X ';
                   if sGrupo = 'Plano/Patro' then
                      sSql :=  sSql + '    GROUP BY X.IDFORCLI, X.IDPLANOPREV,X.IDPATRO, X.IDPESSOA )XX '
                   else if sGrupo = 'Plano' then
                      sSql :=  sSql + '    GROUP BY X.IDFORCLI, X.IDPLANOPREV, X.IDPESSOA )XX '
                   else if sGrupo = 'Patro' then
                      sSql :=  sSql + '    GROUP BY X.IDFORCLI,X.IDPATRO, X.IDPESSOA )XX ';
                   sSql :=  sSql + ' '+ #13 +
                   '    WHERE '+ #13 +
                   '       (XX.IDFORCLI = P.IDPESSOA(+)) '+ #13 +
                   '    -- TAG REGNADATA_30_F '+ #13 +
                   '    UNION ALL '+ #13 +
                   '     -- (4.0) REGISTROS DE INSS '+ #13 +
                   '     -- TAG REGNADATA_40_I '+ #13 +
                   '     SELECT  DISTINCT '+ #13 +
                   '        DECODE(D.IDFORCLI,-1,'' '',X.RAZAOSOCIAL||'' - INSS'') AS NOMEFORCLI, X.SALDO * -1, DECODE(D.COMPLDOCUMENTO,NULL,TO_CHAR(D.NODOCUMENTO),(TO_CHAR(D.NODOCUMENTO)||''/''||D.COMPLDOCUMENTO)) AS NODOCUMENTO, 0 AS NUMAPGR, ';
                   if sGrupo = 'Plano/Patro' then
                      sSql :=  sSql + ' R.IDPLANOPREV, R.IDPATRO, '
                   else if sGrupo = 'Plano' then
                      sSql :=  sSql + ' R.IDPLANOPREV, '' '' AS IDPATRO, '
                   else if sGrupo = 'Patro' then
                      sSql :=  sSql + ' '' '' AS IDPLANOPREV, R.IDPATRO, ';
                   sSql :=  sSql + '       3 AS TIPOREG, R.CODCENTRORESPON, D.IDPESSOA, 0 AS NUMLOTE, 0 AS CODLANCFINANC '+ #13 +
                   '     FROM '+ #13 +
                   '        DOCUMENTO D,LANCTODOCUM L,RATEIODOCUM R, TIPORECEBDESEMB T, '+ #13 +
                   '        ( '+ #13 +
                   '         -- (4.1) REGISTROS QUE NAO ESTAO EM GPS '+ #13 +
                   '         -- TAG REGNADATA_41_I '+ #13 +
                   '         SELECT DISTINCT  '+ #13 +
                   '            L.DATALANCTO AS DATALANCTO, D.IDFORCLI AS IDFORCLI, P.RAZAOSOCIAL AS RAZAOSOCIAL, D.CODDOCUMENTO, L.NUMLANCTO, DECODE(L.DEBCRE, ''D'', L.VALOR, L.VALOR*-1) AS SALDO, '+ #13 +
                   '            D.OPERACAO, D.NUMFATURA, T.PLACONTA, D.NODOCUMENTO '+ #13 +
                   '         FROM  '+ #13 +
                   //AL_16
                   '            PESSOA P, DOCUMENTO D, LANCTODOCUM L, TIPOALTERADOR T, RATEIODOCUM R, LANCIRRF N '+ #13 +
                   '         WHERE '+ #13 +
                   '            (L.DATALANCTO >= TO_DATE('''+DateToStr(dDataIniMesAnt)+''',''DD/MM/YYYY'')) '+ #13 +
                   '            AND (L.DATALANCTO <= TO_DATE('''+DateToStr(dDataFimMesAnt)+''',''DD/MM/YYYY'')) '+ #13 +
                   '            AND (L.OPERACAO      = ''4'') '+ #13 +
                   '            AND (D.IDPESSOA      = ' + IntToStr(iPessoa) + ') '+ #13 +
                   '            AND (1 = ' + FFlgDocBaixado + ') '+ #13 +
                   '            AND (D.RECPAG        = ''P'') '+ #13 +
                   '            AND (L.CODDOCINSS   IS NULL) '+ #13 +
                   //AL_16
                   '            AND (N.IDDOCINSS IS NULL) '+ #13 +
                   //AL_18
                   '            AND (NVL(N.VLRINSS,0) <> 0) '+ #13 +
                   '            AND (L.ESTORNO      IS NULL) '+ #13 +
                   '            AND (L.CODALTERADOR IN (SELECT CODALTERADOR FROM ALTXIMPOSTO WHERE CODIMPOSTO = 2)) '+ #13 +
                   '            AND ((' + sPatro + ' IS NULL) OR (R.IDPATRO = ' + sPatro + ')) '+ #13 +
                   '            AND ((' + sPlanoPrev + ' IS NULL) OR (R.IDPLANOPREV = ' + sPlanoPrev + ')) '+ #13 +
                   '            AND (D.CODDOCUMENTO  = L.CODDOCUMENTO) '+ #13 +
                   '            AND (P.IDPESSOA      = D.IDFORCLI) '+ #13 +
                   '            AND (L.CODALTERADOR  = T.CODALTERADOR) '+ #13 +
                   '            AND (D.CODDOCUMENTO = R.CODDOCUMENTO)'+ #13 +
                   '            AND (D.CODDOCUMENTO  = N.CODDOCUMENTO(+)) '+ #13 +
                   //AL_16
                   '            AND (D.CODDOCUMENTO = N.CODDOCUMENTO)'+ #13 +
                   '         -- TAG REGNADATA_41_F '+ #13 +
                   //AL_19
                   '         ) X '+ #13 +
                   '     WHERE '+ #13 +
                   '        (TO_DATE('''+DateToStr(dDataINSS)+''',''DD/MM/YYYY'') = TO_DATE('''+DateToStr(dDataRef)+''',''DD/MM/YYYY'')) '+ #13 +
                   '        AND ((' + sPatro + ' IS NULL) OR (R.IDPATRO = ' + sPatro + ')) '+ #13 +
                   '        AND ((' + sPlanoPrev + ' IS NULL) OR (R.IDPLANOPREV = ' + sPlanoPrev + ')) '+ #13 +
                   '        AND ((' + sFlgIndRecDes + ' IS NULL) OR (NVL(T.FLGINDICARECDES,''N'') = ' + sFlgIndRecDes + ')) '+ #13 +
                   '        AND (D.CODDOCUMENTO = X.CODDOCUMENTO) '+ #13 +
                   '        AND (D.CODDOCUMENTO = L.CODDOCUMENTO) '+ #13 +
                   '        AND (D.CODDOCUMENTO = R.CODDOCUMENTO) '+ #13 +
                   '        AND (L.NUMLANCTO = X.NUMLANCTO) '+ #13 +
                   '        AND (R.CODTIPRECDES = T.CODTIPRECDES) '+ #13 +
                   '        AND (R.IDPESSOA = T.IDPESSOA) '+ #13 +
                   '        AND (R.RECPAG = T.RECPAG) '+ #13 +
                   '     -- TAG REGNADATA_40_F '+ #13 +
                   '   ) U  '+ #13 +
                   'WHERE  '+ #13 +
                   '   ((' + sPatro + ' IS NULL) OR (U.IDPATRO = ' + sPatro + ')) '+ #13 +
                   '   AND ((' + sPlanoPrev + ' IS NULL) OR (U.IDPLANOPREV = ' + sPlanoPrev + ')) ';
                   if sGrupo = 'Plano/Patro' then
                      sSql :=  sSql +  '   AND (U.IDPATRO = P.IDPESSOA(+))  '+ #13 +
                                       '   AND (U.IDPLANOPREV = PT.IDPLANOPREV(+)) '
                   else if sGrupo = 'Plano' then
                      sSql :=  sSql + '    AND (U.IDPLANOPREV = PT.IDPLANOPREV(+)) '
                   else if sGrupo = 'Patro' then
                      sSql :=  sSql + '    AND (U.IDPATRO = P.IDPESSOA(+)) ';
                   sSql :=  sSql + '   AND (U.CODCENTRORESPON  = CN.CODCENTRORESPON(+)) '+ #13 +
                   '   AND (U.IDPESSOA  = CN.IDPESSOA(+)) ' + #13;
                   //Marilza Colpani - SOL: 122335/Kintana: 598524 - início
                    if sAtivPlano <> '' then
                      sSQL := sSql + '  AND (PT.ATIVO = '+ QuotedStr(sAtivPlano) + ')';
                   //Marilza Colpani - SOL: 122335/Kintana: 598524 - início

                   sSQL := sSql + '-- FIM DA QRYANALITICA '+ #13 +
                   '-- TAG QRYANALIT_F '+ #13 +
                   ' ';

   if sTipoDisp = 'Sintetica' then
   begin
      sSql :=  sSql + '   )UU  '+ #13 +
                      'GROUP BY UU.GRUPO, UU.NOMEGRUPO '+ #13 +
                      //AL_11
                      //AL_14
                      'ORDER BY TIPO, UU.NOMEGRUPO ';
   end;

   FSqlRetorno := sSql;

//   with TStringList.Create do
//   begin
//     Text := sSql;
//     if sTipoDisp = 'Sintetica' then
//       SaveToFile('c:\planus\temp\qryDispOperSintetica.sql')
//     else
//       SaveToFile('c:\planus\temp\qryDispOperAnalitica.sql');
//     Clear;
//     Free;
//   end;

   CmDebugToFile(sSql,'c:\planus\temp\qryDisponibilidade.txt');

   Result := GetDataPacket(sSql);
end;



//AL_8
function TCtrlDisponFinanc.ListDispDebug(sSqlDebug : String): OleVariant;
begin
   Result := GetDataPacket(sSqlDebug);
end;



end.
