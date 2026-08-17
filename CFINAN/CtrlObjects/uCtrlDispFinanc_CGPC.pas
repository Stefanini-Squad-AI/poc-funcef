unit uCtrlDispFinanc_CGPC;
{*
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
*}
interface

uses sysutils, uCmControlObject, uCmDbObject, DB, uDataBase, DbClient, uCMClientDataSet,
     uCtrlParamFinanc, uDiasUteis, UCtrlPadroes, uDbMovimFinanc, UCmSqlParams,
     uCMFileUtils, uCMTypes, Controls, Classes;

type
   TCtrlDisponFinanc_CGPC = Class(TCmControlObject)

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

constructor TCtrlDisponFinanc_CGPC.Create(rIDPessoa, rIDModulo, rIDUsuario: Double; bUsaPlanoPatro: Boolean);
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

destructor TCtrlDisponFinanc_CGPC.Destroy;
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

procedure TCtrlDisponFinanc_CGPC.DoChangeDataBase;
begin
   inherited;
   FDbMovimFinanc.DataBaseName:=DataBaseName;
end;

procedure TCtrlDisponFinanc_CGPC.OnCreateAppServer;
begin
   inherited;
   FcdsLancamento:=TCMClientDataSet.Create(nil);
end;

function TCtrlDisponFinanc_CGPC.ListLancamentos(rIDPessoa: Double; dDataRef: TDateTime): OleVariant;
var sSql : String;
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

function TCtrlDisponFinanc_CGPC.ListConsLancamentos(rIDPessoa, rIDPatro, rIDPlanoPrev: Double;dDataRef: TDateTime): OleVariant;
var sSql : String;
begin
   sSql:=' SELECT '+#13+
         '    U.DATALANCFINAN, '+#13+
         '    U.NUMCHQBORDERO, '+#13+
         '    U.HISTORICO, '+#13+
         '    U.STATUSCONCILIA, '+#13+
         '    U.ENTRADASAIDA, '+#13+
         '    U.VALORLANCFINAN, '+#13+
         '    U.CODPORTADOR, '+#13+
         '    U.DESCRICAO, '+#13+
         '    DECODE(U.CODLANCFINANC,-1,''Total Geral'', '+#13+
         '           DECODE(U.CODLANCFINANC,0,''Total por Plano/Patro'', '+#13+
         '           TO_CHAR(U.CODLANCFINANC))) AS CODLANCFINANC, '+#13+
         '    U.DATADISPFINANC, '+#13+
         '    U.ENTRADA, '+#13+
         '    U.SAIDA, '+#13+
         '    U.VALORAPLIC, '+#13+
         '    U.VALORRESGATE, '+#13+
         '    U.IDPLANOPREV, '+#13+
         '    U.IDPATRO, '+#13+
         '    U.NOMEPATRO, '+#13+
         '    U.NOMEPLANO '+#13+
         ' FROM '+#13+
         '    ((SELECT '+#13+
         '         TO_CHAR(M.DATALANCFINAN,''DD/MM/YYYY'') AS DATALANCFINAN, '+#13+
         '         M.NUMCHQBORDERO, '+#13+
         '         M.HISTORICO, '+#13+
         '         M.STATUSCONCILIA, '+#13+
         '         M.ENTRADASAIDA, '+#13+
         '         M.VALORLANCFINAN, '+#13+
         '         M.CODPORTADOR, '+#13+
         '         P.DESCRICAO, '+#13+
         '         M.CODLANCFINANC, '+#13+
         '         M.DATADISPFINANC, '+#13+
         '         SUM(DECODE(R.RECPAG,''R'',R.VALOR,0)) AS ENTRADA, '+#13+
         '         SUM(DECODE(R.RECPAG,''P'',R.VALOR,0)) AS SAIDA, '+#13+
         '         0 AS VALORAPLIC, '+#13+
         '         0 AS VALORRESGATE, '+#13+
         '         R.IDPLANOPREV, '+#13+
         '         R.IDPATRO, '+#13+
         '         PE.NOME AS NOMEPATRO, '+#13+
         '         PC.NOME AS NOMEPLANO '+#13+
         '      FROM '+#13+
         '         MOVIMFINANC M, '+#13+
         '         PORTADORCONTA P, '+#13+
         '         RATEIOFINANC R, '+#13+
         '         PESSOA PE, '+#13+
         '         PLANPREVCONTABIL PC '+#13+
         '      WHERE '+#13+
         '         (R.IDPATRO = PE.IDPESSOA(+)) AND '+#13+
         '         (R.IDPLANOPREV = PC.IDPLANOPREV(+)) AND '+#13+
         '         (M.CODPORTADOR = P.CODPORTADOR) AND '+#13+
         '         (M.CODLANCFINANC = R.CODLANCFINANC) AND '+#13+
         '         (M.DATADISPFINANC = TO_DATE('''+FormatDateTime('dd/mm/yyyy',dDataRef)+''',''dd/mm/yyyy'')) AND '+#13+
         '         (M.IDPESSOA = '+FloatToStr(rIDPessoa)+') AND '+#13+
         '         (M.STATUSCONCILIA <> ''C'') '+#13;

   if (rIDPlanoPrev<>0) then
       sSql:=sSql+'         AND (R.IDPLANOPREV = '+FloatToStr(rIDPlanoPrev)+') '+#13;

   if (rIDPatro<>0) then
       sSql:=sSql+'         AND (R.IDPATRO = '+FloatToStr(rIDPatro)+') '+#13;

   sSql:=sSql+'      GROUP BY '+#13+
              '         M.DATALANCFINAN, '+#13+
              '         M.NUMCHQBORDERO, '+#13+
              '         M.HISTORICO, '+#13+
              '         M.STATUSCONCILIA, '+#13+
              '         M.ENTRADASAIDA, '+#13+
              '         M.VALORLANCFINAN, '+#13+
              '         M.CODPORTADOR, '+#13+
              '         P.DESCRICAO, '+#13+
              '         M.CODLANCFINANC, '+#13+
              '         M.DATADISPFINANC, '+#13+
              '         R.IDPLANOPREV, '+#13+
              '         R.IDPATRO, '+#13+
              '         PE.NOME, '+#13+
              '         PC.NOME ) '+#13+
              'UNION ALL '+#13+
              ' (SELECT '+#13+
              '     '''' AS DATALANCFINAN, '+#13+
              '     '''' AS NUMCHQBORDERO, '+#13+
              '     '''' AS HISTORICO, '+#13+
              '     '''' AS STATUSCONCILIA, '+#13+
              '     '''' AS ENTRADASAIDA, '+#13+
              '     0 AS VALORLANCFINAN, '+#13+
              '     0  AS CODPORTADOR, '+#13+
              '     ''-'' AS DESCRICAO, '+#13+
              '     0 AS CODLANCFINANC, '+#13+
              '     M.DATADISPFINANC, '+#13+
              '     SUM(DECODE(R.RECPAG,''R'',R.VALOR,0)) AS ENTRADA, '+#13+
              '     SUM(DECODE(R.RECPAG,''P'',R.VALOR,0)) AS SAIDA, '+#13+
              '     DECODE(SIGN(SUM(DECODE(R.RECPAG,''R'',R.VALOR,R.VALOR*-1))),1, '+#13+
              '            SUM(DECODE(R.RECPAG,''R'',R.VALOR,R.VALOR*-1)),0) AS VALORAPLIC, '+#13+
              '     DECODE(SIGN(SUM(DECODE(R.RECPAG,''R'',R.VALOR,R.VALOR*-1))),-1, '+#13+
              '            SUM(DECODE(R.RECPAG,''P'',R.VALOR,R.VALOR*-1)),0) AS VALORRESGATE, '+#13+
              '     R.IDPLANOPREV, '+#13+
              '     R.IDPATRO, '+#13+
              '     PE.NOME AS NOMEPATRO, '+#13+
              '     PC.NOME AS NOMEPLANO '+#13+
              ' FROM '+#13+
              '    MOVIMFINANC M, '+#13+
              '    PORTADORCONTA P, '+#13+
              '    RATEIOFINANC R, '+#13+
              '    PESSOA PE, '+#13+
              '    PLANPREVCONTABIL PC '+#13+
              ' WHERE '+#13+
              '    (R.IDPATRO = PE.IDPESSOA(+)) AND '+#13+
              '    (R.IDPLANOPREV = PC.IDPLANOPREV(+)) AND '+#13+
              '    (M.CODPORTADOR = P.CODPORTADOR) AND '+#13+
              '    (M.CODLANCFINANC = R.CODLANCFINANC) AND '+#13+
              '    (M.DATADISPFINANC = TO_DATE('''+FormatDateTime('dd/mm/yyyy',dDataRef)+''',''dd/mm/yyyy'')) AND '+#13+
              '    (M.IDPESSOA = '+FloatToStr(rIDPessoa)+') AND '+#13+
              '    (M.STATUSCONCILIA <> ''C'') '+#13;
              
   if (rIDPlanoPrev<>0) then
       sSql:=sSql+'    AND (R.IDPLANOPREV = '+FloatToStr(rIDPlanoPrev)+') '+#13;

   if (rIDPatro<>0) then
       sSql:=sSql+'    AND (R.IDPATRO = '+FloatToStr(rIDPatro)+') '+#13;

   sSql:=sSql+' GROUP BY '+#13+
              '    M.DATADISPFINANC, '+#13+
              '    R.IDPLANOPREV, '+#13+
              '    R.IDPATRO, '+#13+
              '    PE.NOME, '+#13+
              '    PC.NOME) '+#13+
              'UNION ALL '+#13+
              ' (SELECT '+#13+
              '     '''' AS DATALANCFINAN, '+#13+
              '     '''' AS NUMCHQBORDERO, '+#13+
              '     '''' AS HISTORICO, '+#13+
              '     '''' AS STATUSCONCILIA, '+#13+
              '     '''' AS ENTRADASAIDA, '+#13+
              '     0 AS VALORLANCFINAN, '+#13+
              '     0  AS CODPORTADOR, '+#13+
              '     ''-'' AS DESCRICAO, '+#13+
              '     -1 AS CODLANCFINANC, '+#13+
              '     M.DATADISPFINANC, '+#13+
              '     SUM(DECODE(R.RECPAG,''R'',R.VALOR,0)) AS ENTRADA, '+#13+
              '     SUM(DECODE(R.RECPAG,''P'',R.VALOR,0)) AS SAIDA, '+#13+
              '     DECODE(SIGN(SUM(DECODE(R.RECPAG,''R'',R.VALOR,R.VALOR*-1))),1, '+#13+
              '            SUM(DECODE(R.RECPAG,''R'',R.VALOR,R.VALOR*-1)),0) AS VALORAPLIC, '+#13+
              '     DECODE(SIGN(SUM(DECODE(R.RECPAG,''R'',R.VALOR,R.VALOR*-1))),-1, '+#13+
              '            SUM(DECODE(R.RECPAG,''P'',R.VALOR,R.VALOR*-1)),0) AS VALORRESGATE, '+#13+
              '     0 AS IDPLANOPREV, '+#13+
              '     0 AS IDPATRO, '+#13+
              '     '''' AS NOMEPATRO, '+#13+
              '     '''' AS NOMEPLANO '+#13+
              '  FROM '+#13+
              '     MOVIMFINANC M, '+#13+
              '     PORTADORCONTA P, '+#13+
              '     RATEIOFINANC R, '+#13+
              '     PESSOA PE, '+#13+
              '     PLANPREVCONTABIL PC '+#13+
              '  WHERE '+#13+
              '     (R.IDPATRO = PE.IDPESSOA(+)) AND '+#13+
              '     (R.IDPLANOPREV = PC.IDPLANOPREV(+)) AND '+#13+
              '     (M.CODPORTADOR = P.CODPORTADOR) AND '+#13+
              '     (M.CODLANCFINANC = R.CODLANCFINANC) AND '+#13+
              '     (M.DATADISPFINANC = TO_DATE('''+FormatDateTime('dd/mm/yyyy',dDataRef)+''',''dd/mm/yyyy'')) AND '+#13+
              '     (M.IDPESSOA = '+FloatToStr(rIDPessoa)+') AND '+#13+
              '     (M.STATUSCONCILIA <> ''C'') '+#13;

   if (rIDPlanoPrev<>0) then
       sSql:=sSql+'    AND (R.IDPLANOPREV = '+FloatToStr(rIDPlanoPrev)+') '+#13;

   if (rIDPatro<>0) then
       sSql:=sSql+'    AND (R.IDPATRO = '+FloatToStr(rIDPatro)+') '+#13;

   sSql:=sSql+'  GROUP BY M.DATADISPFINANC)) U '+#13+
              'ORDER BY '+#13+
              '   U.DATADISPFINANC, '+#13+
              '   U.IDPLANOPREV, '+#13+
              '   U.IDPATRO, '+#13+
              '   U.DESCRICAO, '+#13+
              '   U.DATALANCFINAN, '+#13+
              '   U.ENTRADASAIDA ';

   Result:=GetDataPacket(sSql);
end;

function TCtrlDisponFinanc_CGPC.ListRelatDisp(rIDPessoa, rIDPatro,rIDPlanoPrev: Double; dDataRef: TDateTime): OleVariant;
var sSql : String;
begin
   sSql:='SELECT '+#13+
         '   TO_CHAR(M.DATALANCFINAN,''DD/MM/YYYY'') AS DATALANCFINAN, '+#13+
         '   M.NUMCHQBORDERO, '+#13+
         '   M.HISTORICO, '+#13+
         '   M.STATUSCONCILIA, '+#13+
         '   M.ENTRADASAIDA, '+#13+
         '   M.VALORLANCFINAN, '+#13+
         '   M.CODPORTADOR, '+#13+
         '   P.DESCRICAO, '+#13+
         '   M.CODLANCFINANC, '+#13+
         '   M.DATADISPFINANC, '+#13+
         '   E.NOMEEMPRESA, '+#13+
         '   SUM(DECODE(R.RECPAG,''R'',R.VALOR,0)) AS ENTRADA, '+#13+
         '   SUM(DECODE(R.RECPAG,''P'',R.VALOR,0)) AS SAIDA, '+#13+
         '   SUM(DECODE(R.RECPAG,''R'',R.VALOR,R.VALOR*-1)) AS SALDOAPLICRESTATE, '+#13+
         '   R.IDPLANOPREV, '+#13+
         '   R.IDPATRO, '+#13+
         '   PE.NOME AS NOMEPATRO, '+#13+
         '   PC.NOME AS NOMEPLANO '+#13+
         'FROM '+#13+
         '   MOVIMFINANC M, '+#13+
         '   PORTADORCONTA P, '+#13+
         '   RATEIOFINANC R, '+#13+
         '   PESSOA PE, '+#13+
         '   PLANPREVCONTABIL PC, '+#13+
         '   EMPRESAPROP E '+#13+
         'WHERE '+#13+
         '   (R.IDPATRO = PE.IDPESSOA(+)) AND '+#13+
         '   (R.IDPLANOPREV = PC.IDPLANOPREV(+)) AND '+#13+
         '   (M.CODPORTADOR = P.CODPORTADOR) AND '+#13+
         '   (M.DATADISPFINANC = TO_DATE('''+FormatDateTime('dd/mm/yyyy',dDataRef)+''',''dd/mm/yyyy'')) AND '+#13+
         '   (M.IDPESSOA = '+FloatToStr(rIDPessoa)+') AND '+#13+
         '   (M.STATUSCONCILIA <> ''C'') AND '+#13+
         '   (M.CODLANCFINANC = R.CODLANCFINANC) AND '+#13+
         '   (E.IDPESSOA = M.IDPESSOA) '+#13;

   if (rIDPlanoPrev<>0) then
       sSql:=sSql+'    AND (R.IDPLANOPREV = '+FloatToStr(rIDPlanoPrev)+') '+#13;

   if (rIDPatro<>0) then
       sSql:=sSql+'    AND (R.IDPATRO = '+FloatToStr(rIDPatro)+') '+#13;

   sSql:=sSql+'GROUP BY '+#13+
              '   M.DATALANCFINAN, '+#13+
              '   M.NUMCHQBORDERO, '+#13+
              '   M.HISTORICO, '+#13+
              '   M.STATUSCONCILIA, '+#13+
              '   M.ENTRADASAIDA, '+#13+
              '   M.VALORLANCFINAN, '+#13+
              '   M.CODPORTADOR, '+#13+
              '   P.DESCRICAO, '+#13+
              '   M.CODLANCFINANC, '+#13+
              '   M.DATADISPFINANC, '+#13+
              '   E.NOMEEMPRESA, '+#13+
              '   R.IDPLANOPREV, '+#13+
              '   R.IDPATRO, '+#13+
              '   PE.NOME, '+#13+
              '   PC.NOME '+#13+
              'ORDER BY '+#13+
              '   M.DATADISPFINANC, '+#13+
              '   R.IDPLANOPREV, '+#13+
              '   R.IDPATRO, '+#13+
              '   P.DESCRICAO, '+#13+
              '   M.DATALANCFINAN, '+#13+
              '   M.ENTRADASAIDA ';

   Result:=GetDataPacket(sSql);
end;

function TCtrlDisponFinanc_CGPC.ListDispDivergentes(rIDPessoa: Double;sMesAno: String): OleVariant;
var sSql : String;
begin
   sSql:='SELECT '+#13+
         '   M.DataDispFinanc, '+#13+
         '   PC.NOME AS NOMEPLANO, '+#13+
         '   PE.NOME AS NOMEPATRO '+#13+
         'FROM '+#13+
         '   MovimFinanc M, '+#13+
         '   RateioFinanc R, '+#13+
         '   PESSOA PE, '+#13+
         '   PLANPREVCONTABIL PC '+#13+
         'WHERE '+#13+
         '   (M.IDPESSOA = '+FloatToStr(rIDPessoa)+') AND '+#13+
         '   (R.IDPATRO = PE.IDPESSOA(+)) AND '+#13+
         '   (R.IDPLANOPREV = PC.IDPLANOPREV(+)) AND '+#13+
         '   (M.CodLancFinanc=R.CodLancFinanc) AND '+#13+
         '   (TO_CHAR(M.DataDispFinanc,''MM/YYYY'') = '''+sMesAno+''' ) AND '+#13+
         '   (SELECT Sum(Decode(R1.RECPAG,''R'',R1.Valor,-R1.Valor)) AS Total '+#13+
         '    FROM '+#13+
         '       MovimFinanc M1, '+#13+
         '       RateioFinanc R1 '+#13+
         '    WHERE '+#13+
         '       (M1.IDPESSOA = '+FloatToStr(rIDPessoa)+') AND '+#13+
         '       (M1.CodLancFinanc = R1.CodLancFinanc) AND '+#13+
         '       (M1.DataDispFinanc = M.DataDispFinanc) AND '+#13+
         '       ((R1.IDPATRO = R.IDPATRO) OR ((R1.IDPATRO IS NULL) AND (R.IDPATRO IS NULL))) AND '+#13+
         '       ((R1.IDPLANOPREV = R.IDPLANOPREV) OR '+#13+
         '        ((R1.IDPLANOPREV IS NULL) AND (R.IDPLANOPREV IS NULL))))<> 0 '+#13+
         'GROUP BY '+#13+
         '   M.DataDispFinanc, '+#13+
         '   PC.NOME , '+#13+
         '   PE.NOME ';
   Result:=GetDataPacket(sSql);
end;

function TCtrlDisponFinanc_CGPC.EncerraDisponibilidade(dDataRef: TDateTime): Boolean;
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

function TCtrlDisponFinanc_CGPC.AplicaMarcacoesDisp: Boolean;
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

function TCtrlDisponFinanc_CGPC.TestaDispFinanc(iIdPessoa,iIdUsuario : Integer;dDataOper : TDateTime): Boolean;
var sSql,fDispBloq,fUsuBloq : string;
    dDataDisp : TDateTime;
begin
   Result := True;

   if FlgIntegraDispFin then // Verifico se Faz Integracao com Disp. Financeira
   begin
      sSql := 'SELECT'+#13+
              '   PAR.FLGDISPBLOQ, PAR.DATABLOQDISPFINAN,'+#13+
              '   USU.IDUSUARIO, USU.FLGDISPFINANC'+#13+
              'FROM  PARAMFINANC PAR,USUARIOSISTEMA USU'+#13+
              'WHERE'+#13+
              '   (PAR.IDPESSOA =  '+IntToStr(iIdPessoa)+' )'+#13+
              '   AND (USU.IDUSUARIO = '+IntToStr(iIdUsuario)+')' ;

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

function TCtrlDisponFinanc_CGPC.FlgIntegraDispFin:boolean;
var sSql :string;
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

function TCtrlDisponFinanc_CGPC.IncluiDispFinanc(iIdPessoa, iIdUsuario,
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

function TCtrlDisponFinanc_CGPC.AlteraDispFinanc(iIdModulo, iCodDocumento,iCodLancFinanc : integer): boolean;
begin
   if ConnectionSide = cnsClient then
   begin
      Result := Connection.AppServer.AlteraDispFinanc(iIdModulo, iCodDocumento,
                                                      iCodLancFinanc);
      If Not Result Then
         MessageInfo := Connection.AppServer.MessageInfo;
   End 
   Else
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
function TCtrlDisponFinanc_CGPC.LimpaDispFinanc (iUsuario : Integer) : boolean;
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

function TCtrlDisponFinanc_CGPC.SelecionaDispFinanc(dDataRef:TDateTime): OleVariant;
var sSql : string;
begin
   sSql := 'SELECT '+#13+
           '  IDDISPFINANC,DATADISPFINANC,IDMODULO, '+#13+
           '  IDMODULOORIGEM,HISTORICO,VLRDISPFINANC, '+#13+
           '  TIPO,FLGEXCLUSAO,TIPOREG'+#13+
           'FROM DISPFINANC'+#13+
           'WHERE (DATADISPFINANC = TO_DATE('''+DateToStr(dDataRef)+''',''DD/MM/YYYY'')) ';

   Result := GetDataPacket(sSql);
end;

//AL_1
//AL_3
function TCtrlDisponFinanc_CGPC.ListDispSintetica (dDataIni, dDataFim : TDateTime;iPessoa, iUsuario : Integer): OleVariant;
var sSql : String;
begin
   sSql:= 'SELECT'+#13+
          '   DATAREF, NOMEPLANOPATRO, IDPATRO, IDPLANO,'+#13+
          '   SALDOANT, RECEBIMENTOS, DESEMBOLSOS, SALDODIA , TIPOREG '+#13+
          'FROM '+#13+
          '   (SELECT'+#13+
          '       DATAREF, NOMEPLANOPATRO, IDPATRO, IDPLANO, '+#13+
          '       SALDOANT, RECEBIMENTOS, DESEMBOLSOS, SALDODIA , TIPOREG'+#13+
          '    FROM LOGDISPONIBILIDADE'+#13+
          '    WHERE TIPOREG = ''0'' '+#13+
          '       AND IDPESSOA = '+ IntToStr(iPessoa) +#13+
          '       AND IDUSUARIO = '+ IntToStr(iUsuario) +#13+
          '       AND DATAREF >= TO_DATE('''+DateToStr(dDataIni)+''',''DD/MM/YYYY'') '+#13+
          '       AND DATAREF <= TO_DATE('''+DateToStr(dDataFim)+''',''DD/MM/YYYY'') '+#13+
          '    UNION '+#13+
          '    SELECT'+#13+
          '       DATAREF, NOMEPLANOPATRO, IDPATRO, IDPLANO, '+#13+
          '       SUM(NVL(SALDOANT,0)) AS SALDOANT,'+#13+
          '       SUM(NVL(RECEBIMENTOS,0)) AS RECEBIMENTOS,'+#13+
          '       SUM(NVL(DESEMBOLSOS,0)) AS DESEMBOLSOS, '+#13+
          '       (SUM(NVL(SALDOANT,0)) + SUM(NVL(RECEBIMENTOS,0)) + SUM(NVL(DESEMBOLSOS,0))) AS SALDODIA, '+#13+
          '       ''1'' AS TIPOREG '+#13+
          '    FROM LOGDISPONIBILIDADE'+#13+
          '    WHERE TIPOREG <> ''0'''+#13+
          '       AND TIPOREG <> ''5'''+#13+
          '       AND IDPESSOA = '+ IntToStr(iPessoa) +#13+
          '       AND IDUSUARIO = '+ IntToStr(iUsuario) +#13+
          '       AND DATAREF >= TO_DATE('''+DateToStr(dDataIni)+''',''DD/MM/YYYY'') '+#13+
          '       AND DATAREF <= TO_DATE('''+DateToStr(dDataFim)+''',''DD/MM/YYYY'') '+#13+
          '    GROUP BY NOMEPLANOPATRO, IDPATRO, IDPLANO, DATAREF'+#13+
          '    UNION '+#13+
          '    SELECT'+#13+
          '       DATAREF, NOMEPLANOPATRO, IDPATRO, IDPLANO, '+#13+
          '       SALDOANT, RECEBIMENTOS, DESEMBOLSOS, SALDODIA , TIPOREG'+#13+
          '    FROM LOGDISPONIBILIDADE'+#13+
          '    WHERE TIPOREG = ''5'' '+#13+
          '       AND IDPESSOA = '+ IntToStr(iPessoa) +#13+
          '       AND IDUSUARIO = '+ IntToStr(iUsuario) +#13+
          '       AND DATAREF >= TO_DATE('''+DateToStr(dDataIni)+''',''DD/MM/YYYY'') '+#13+
          '       AND DATAREF <= TO_DATE('''+DateToStr(dDataFim)+''',''DD/MM/YYYY'') '+#13+
          '    )'+#13+
          'ORDER BY DATAREF, TIPOREG, NOMEPLANOPATRO';
   Result:=GetDataPacket(sSql);
end;

//AL_1
//AL_3
function TCtrlDisponFinanc_CGPC.ListDispAnalitica(iPessoa, iPatro, iPlanoPrev, iUsuario : Integer;
                                                  dDataIni, dDataFim : TDateTime): OleVariant;
var sSql : String;
begin
   sSql:='SELECT '+#13+
         '   DATAREF, NUMDOC, NUMAPGR, NOMEFORCLI, NODOCUMENTO, NOMEFORCLI,SALDO, '+#13+
         '   CODCENTRORESPON, NOMEPLANOPATRO, NOME, IDPLANO, IDPATRO, TIPOREG, '+#13+
         '   SALDOANT, RECEBIMENTOS, DESEMBOLSOS, SALDODIA, '+#13+
         '   IDPESSOA, PLANO, PATRO '+#13+
         'FROM LOGDISPONIBILIDADE '+#13+
         'WHERE  IDPESSOA = '+ IntToStr(iPessoa) +#13+
         '   AND IDUSUARIO = '+ IntToStr(iUsuario) +#13+
         '   AND DATAREF >= TO_DATE('''+DateToStr(dDataIni)+''',''DD/MM/YYYY'') '+#13+
         '   AND DATAREF <= TO_DATE('''+DateToStr(dDataFim)+''',''DD/MM/YYYY'') '+#13;
         //AL_5
         if (iPatro = -1) and (iPlanoPrev = -1) then
            sSql := sSql + ' AND TIPOREG NOT IN (1,4) '+#13;
         if iPatro <> -1 then
            sSql := sSql + ' AND IDPATRO  = '+ IntToStr(iPatro)+#13;
         if iPlanoPrev <> -1 then
            sSql := sSql + ' AND IDPLANO   = '+ IntToStr(iPlanoPrev)+#13;
         sSql := sSql + ' ORDER BY DATAREF, NOMEPLANOPATRO, TIPOREG';

   Result:=GetDataPacket(sSql);
end;

//AL_1
function TCtrlDisponFinanc_CGPC.IIF(BooleanExpr: Boolean; IfTrue, IfFalse: String): String;
begin
   if BooleanExpr then Result := IfTrue else Result := IfFalse;
end;

//AL_1
function TCtrlDisponFinanc_CGPC.IIF(BooleanExpr: Boolean; IfTrue, IfFalse: Integer): Integer;
begin
   if BooleanExpr then Result := IfTrue else Result := IfFalse;
end;

//AL_1
function TCtrlDisponFinanc_CGPC.IIF(BooleanExpr: Boolean; IfTrue, IfFalse: TDateTime): TDateTime;
begin
   if BooleanExpr then Result := IfTrue else Result := IfFalse;
end;

//AL_1
function TCtrlDisponFinanc_CGPC.IIF(BooleanExpr: Boolean; IfTrue, IfFalse: Double): Double;
begin
   if BooleanExpr then Result := IfTrue else Result := IfFalse;
end;

//AL_1
procedure TCtrlDisponFinanc_CGPC.MontaParametros(dDataRef  : TDateTime;
                                                 iIdPessoa : integer;
                                                 var dDataAnt, 
                                                     dDataSaldoAnt, 
                                                     dDataINSS, 
                                                     dDataIniMes, 
                                                     dDataIniMesAnt,
                                                     dDataFimMesAnt, 
                                                     dDataIniIRRF, 
                                                     dDataFImIRRF, 
                                                     dDataDARF : TDateTime;
                                                 var iQuarta, 
                                                     iSaldoAntIRRF, 
                                                     iSaldoAntINSS : Integer);
var iAno, iMes, iDia : word;
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
function TCtrlDisponFinanc_CGPC.BuscaPrimeiroDiaIRRF(dDataRef:TDateTime; iIdPessoa: integer):TDateTime;
var iAno, iMes, iDia : word;
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
procedure TCtrlDisponFinanc_CGPC.SetCdsParamFinanc(const Value: TCMClientDataSet);
begin
  FCdsParamFinanc := Value;
end;

//AL_1
procedure TCtrlDisponFinanc_CGPC.AfterInitialize;
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
function TCtrlDisponFinanc_CGPC.ListLoteDispAnalitica(iPessoa, iPatro, iPlanoPrev : Integer;
                                                      dDataRef : TDateTime): OleVariant;
var sSql : String;
begin
   sSql:='SELECT'+#13+
         '   A.NUMLOTE, A.NUMAPGR, A.NOME, A.RAZAOSOCIAL, X.RECPAG,'+#13+
         '   A.NODOCUMENTO, (A.SALDO) AS VALOR, X.VALORTOT, 0 AS DIF'+#13+
         'FROM'+#13+
         '   MOVIMFINANC M,'+#13+
         '   (SELECT M.CODLANCFINANC, R.RECPAG, SUM(R.VALOR) AS VALORTOT'+#13+
         '    FROM MOVIMFINANC M, RATEIOFINANC R'+#13+
         '    WHERE'+#13+
         '       (((M.DATALANCFINAN  = TO_DATE('''+DateToStr(dDataRef)+''',''DD/MM/YYYY'')) AND (M.DATADISPFINANC IS NULL)) OR'+#13+
         '        ((M.DATALANCFINAN  = TO_DATE('''+DateToStr(dDataRef)+''',''DD/MM/YYYY'')) AND (M.DATADISPFINANC = TO_DATE('''+DateToStr(dDataRef)+''',''DD/MM/YYYY''))) OR '+#13+
         '        ((M.DATADISPFINANC = TO_DATE('''+DateToStr(dDataRef)+''',''DD/MM/YYYY''))))'+#13+
         '       AND (R.IDPATRO = '+ IntToStr(iPatro) + ')'+#13+
         '       AND (R.IDPLANOPREV = '+ IntToStr(iPlanoPrev) + ')'+#13+
         '       AND (M.IDPESSOA = '+ IntToStr(iPessoa) + ')'+#13+
         '       AND M.CODLANCFINANC = R.CODLANCFINANC'+#13+
         '    GROUP BY M.CODLANCFINANC, R.RECPAG) X,'+#13+
         '   (SELECT'+#13+
         '       M.CODLANCFINANC,'+#13+
         '       RC.NUMLOTE, D.NUMAPGR, CT.NOME, P.RAZAOSOCIAL,'+#13+
         '       D.NODOCUMENTO,'+#13+
         '       ROUND(SUM(((R.VALOR*S.SALDO)/L.VALOR)-(DECODE(P.VALOR,NULL,0,P.VALOR))),2) AS SALDO'+#13+
         '    FROM'+#13+
         '        MOVIMFINANC M, RECBTOPAGTO RC, DOCUMENTO D, LANCTODOCUM L,'+#13+
         // Alterado por Arnaldo V. Scarin em 25/01/2010
         // SOL: 129555 - Alteração da Disponibilidade Financeira
         // Troca da Tabela RateioDocum por View VW_RATEIODOCUM
         //'        RATEIODOCUM R, PESSOA P, CENTRESPON CT,'+#13+
         '        VW_RATEIODOCUM R, PESSOA P, CENTRESPON CT,'+#13+
         '        (SELECT P.CODTIPDOCCPMF FROM PARAMCAP P WHERE P.IDPESSOA = 1 AND P.RECPAG = ''P'') X,'+#13+
         '        (SELECT D.CODDOCUMENTO, SUM(DECODE(L.DEBCRE,''D'',L.VALOR,L.VALOR*-1)) AS SALDO'+#13+
         '         FROM DOCUMENTO D, LANCTODOCUM L'+#13+
         '         WHERE (D.OPERACAO IN (''2 ''))'+#13+
         '           AND (D.RECPAG = ''P'')'+#13+
         '           AND (D.IDPESSOA = 1)'+#13+
         '           AND (L.OPERACAO <> 5)'+#13+
         '           AND (D.CODDOCUMENTO = L.CODDOCUMENTO)'+#13+
         '         GROUP BY D.CODDOCUMENTO) S,'+#13+
         '        (SELECT LA.CODDOCUMENTO, DECODE(LA.DEBCRE,''D'',LA.VALOR * -1,LA.VALOR) AS VALOR'+#13+
         '         FROM RECBTOPAGTO RE, LANCTODOCUM LA'+#13+
         '         WHERE (RE.CODPORTFORMA IN (SELECT CODPORTFORMA FROM PORTADORFORMA WHERE LANCAFINANC = ''N''))'+#13+
         '           AND (LA.DEBCRE = ''D'')'+#13+
         '           AND (LA.NUMLANCTO = RE.NUMLANCTO)) P'+#13+
         '    WHERE'+#13+
         '       (((M.DATALANCFINAN  = TO_DATE('''+DateToStr(dDataRef)+''',''DD/MM/YYYY'')) AND (M.DATADISPFINANC IS NULL)) OR'+#13+
         '        ((M.DATALANCFINAN  = TO_DATE('''+DateToStr(dDataRef)+''',''DD/MM/YYYY'')) AND (M.DATADISPFINANC = TO_DATE('''+DateToStr(dDataRef)+''',''DD/MM/YYYY''))) OR '+#13+
         '        ((M.DATADISPFINANC = TO_DATE('''+DateToStr(dDataRef)+''',''DD/MM/YYYY''))))'+#13+
         '       AND (D.IDMODULO <> 79)'+#13+
         '       AND ((M.CODLANCTRANSF IS NULL) OR (M.CODLANCTRANSF = 0))'+#13+
         '       AND (M.STATUSCONCILIA <> ''C'')'+#13+
         '       AND (R.IDPATRO = '+ IntToStr(iPatro) + ')'+#13+
         '       AND (R.IDPLANOPREV = '+ IntToStr(iPlanoPrev) + ')'+#13+
         // Alterado por Arnaldo V. Scarin em 26/01/2010
         // SOL: 129555 - Alteração da Disponibilidade Financeira
         // Acerto do Filtro da Data de Vigência da View VW_RATEIODOCUM
         '       AND (R.EXERCICIO = '+QuotedStr(FormatDateTime('yyyy',dDataRef))+')'+#13+
         '       AND (M.IDPESSOA = '+ IntToStr(iPessoa) + ')'+#13+
         '       AND (L.OPERACAO <> 5)'+#13+
         '       AND (D.CODTIPDOC <> X.CODTIPDOCCPMF)'+#13+
         '       AND (D.OPERACAO = L.OPERACAO)'+#13+
         '       AND (D.OPERACAO IN (''2 ''))'+#13+
         '       AND (RC.CODLANCFINANC(+) = M.CODLANCFINANC)'+#13+
         '       AND (D.CODDOCUMENTO(+) = RC.CODDOCUMENTO)'+#13+
         '       AND (D.CODDOCUMENTO = L.CODDOCUMENTO)'+#13+
         '       AND (D.CODDOCUMENTO = R.CODDOCUMENTO) '+#13+
         '       AND (D.IDFORCLI = P.IDPESSOA)'+#13+
         '       AND (D.CODDOCUMENTO = S.CODDOCUMENTO) '+#13+
         '       AND (D.CODDOCUMENTO = P.CODDOCUMENTO(+))'+#13+         '       AND (R.CODCENTRORESPON  = CT.CODCENTRORESPON(+))'+
         '       AND (D.IDPESSOA  = CT.IDPESSOA)'+#13+
         '    GROUP BY RC.NUMLOTE, D.NUMAPGR, CT.NOME, D.NODOCUMENTO,P.RAZAOSOCIAL, M.CODLANCFINANC) A'+#13+
         'WHERE '+#13+
         '   M.CODLANCFINANC = A.CODLANCFINANC '+#13+
         '   AND M.CODLANCFINANC = X.CODLANCFINANC '+#13+
         'ORDER BY A.NUMLOTE, A.NOME ';
   Result:=GetDataPacket(sSql);
end;

//AL_5
function TCtrlDisponFinanc_CGPC.IncluiLogDisponibilidade(dDataRef : TDateTime;
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
function TCtrlDisponFinanc_CGPC.ListConsultaDoc(rCodLancFinanc: String;
                                                iPessoa, iPatro, iPlanoPrev : Integer): OleVariant;
var sSQL   : string;
begin
   sSql := 'SELECT SUM(A.VLRRATEIOEALT) AS VALOR, A.CODCENTRORESPON, A.RAZAOSOCIAL, A.NODOCUMENTO,'+ #13 +
           '       A.NUMAPGR, A.NUMLOTE, A.CODDOCUMENTO,A.CENTRORESPON'+ #13 +
           'FROM'+ #13 +
           '('+ #13 +
           'SELECT'+ #13 +
           '   SUM(TOT.VALOR) AS TOTALRATEIO,'+ #13 +
           '   SUM(NVL(ALT.VALOR,0)) AS TOTALTERADOR,'+ #13 +
           '   SUM(RT.VALOR) AS VLRRATEIOPLANO,'+ #13 +
           '   ROUND(SUM(NVL(RT.VALOR,0)) + ((SUM(NVL(RT.VALOR,0)) * SUM(NVL(ALT.VALOR,0))) / SUM(NVL(TOT.VALOR,0))),2) AS VLRRATEIOEALT,'+ #13 +
           '   RT.CODCENTRORESPON, P.RAZAOSOCIAL, D.NODOCUMENTO, D.NUMAPGR, RC.NUMLOTE, D.CODDOCUMENTO,'+ #13 +
           '   RT.IDPATRO, RT.IDPLANOPREV, RT.IDPESSOA, (CT.NOME) AS CENTRORESPON'+ #13 +
           ' FROM'+ #13 +
           // Alterado por Arnaldo V. Scarin em 25/01/2010
           // SOL: 129555 - Alteração da Disponibilidade Financeira
           // Troca da Tabela RateioDocum por View VW_RATEIODOCUM
           //'    RATEIODOCUM RT, PESSOA P, DOCUMENTO D, CENTRESPON CT,'+ #13 +
           '     VW_RATEIODOCUM RT, PESSOA P, DOCUMENTO D, CENTRESPON CT,'+ #13 +
           '    (SELECT D.NODOCUMENTO, D.NUMAPGR, R.NUMLOTE, D.CODDOCUMENTO'+ #13 +
           '     FROM RECBTOPAGTO R, DOCUMENTO D, LANCTODOCUM L'+ #13 +
           '     WHERE (R.CODLANCFINANC  IN (' + rCodLancFinanc + '))'+ #13 +
           '       AND (D.NUMFATURA IS NULL)'+ #13 +
           '       AND (R.CODDOCUMENTO  = L.CODDOCUMENTO)'+ #13 +
           '       AND (R.NUMLANCTO = L.NUMLANCTO)'+ #13 +
           '       AND (L.CODDOCUMENTO = D.CODDOCUMENTO)'+ #13 +
           '     UNION'+ #13 +
           '     SELECT D.NODOCUMENTO, D.NUMAPGR, X.NUMLOTE, D.CODDOCUMENTO'+ #13 +
           '     FROM DOCUMENTO D,'+ #13 +
           '          (SELECT R.NUMLOTE, D1.NODOCUMENTO'+ #13 +
           '           FROM RECBTOPAGTO R, DOCUMENTO D1, LANCTODOCUM L'+ #13 +
           '           WHERE (R.CODLANCFINANC  IN (' + rCodLancFinanc + '))'+ #13 +
           '             AND (D1.NUMFATURA IS NOT NULL'+ #13 +
           '             AND (R.CODDOCUMENTO  = L.CODDOCUMENTO)'+ #13 +
           '             AND (R.NUMLANCTO = L.NUMLANCTO)'+ #13 +
           '             AND (L.CODDOCUMENTO = D1.CODDOCUMENTO))) X'+ #13 +
           '     WHERE D.NUMFATURA IN (SELECT  D1.NUMFATURA'+ #13 +
           '                           FROM RECBTOPAGTO R, DOCUMENTO D1, LANCTODOCUM L'+ #13 +
           '                           WHERE (R.CODLANCFINANC  IN (' + rCodLancFinanc + '))'+ #13 +
           '                             AND (D1.NUMFATURA IS NOT NULL'+ #13 +
           '                             AND (R.CODDOCUMENTO  = L.CODDOCUMENTO)'+ #13 +
           '                             AND (R.NUMLANCTO = L.NUMLANCTO)'+ #13 +
           '                             AND (L.CODDOCUMENTO = D1.CODDOCUMENTO)))'+ #13 +
           '                             AND (D.OPERACAO <> 3)) RC,'+ #13 +
           '    (SELECT SUM(NVL(DECODE(L.DEBCRE,''C'',L.VALOR,L.VALOR *-1),0)) AS VALOR, D.CODDOCUMENTO'+ #13 +
           '     FROM RECBTOPAGTO R, DOCUMENTO D, LANCTODOCUM L'+ #13 +
           '     WHERE (R.CODLANCFINANC  IN (' + rCodLancFinanc + '))'+ #13 +
           '       AND (L.OPERACAO = 4)'+ #13 +
           '       AND (R.CODDOCUMENTO  = L.CODDOCUMENTO)'+ #13 +
           '       AND (L.CODDOCUMENTO = D.CODDOCUMENTO)'+ #13 +
           '     GROUP BY D.CODDOCUMENTO) ALT,'+ #13 +
           '    (SELECT SUM(NVL(RT.VALOR,0)) AS VALOR, RC.CODDOCUMENTO'+ #13 +
           '     FROM'+ #13 +
           // Alterado por Arnaldo V. Scarin em 25/01/2010
           // SOL: 129555 - Alteração da Disponibilidade Financeira
           // Troca da Tabela RateioDocum por View VW_RATEIODOCUM
           // '        RATEIODOCUM RT,'+ #13 +
           '        VW_RATEIODOCUM RT,'+ #13 +
           '        DOCUMENTO D,'+ #13 +
           '        (SELECT D.CODDOCUMENTO'+ #13 +
           '         FROM RECBTOPAGTO R, DOCUMENTO D, LANCTODOCUM L'+ #13 +
           '         WHERE (R.CODLANCFINANC IN (' + rCodLancFinanc + '))'+ #13 +
           '           AND (D.NUMFATURA IS NULL)'+ #13 +
           '           AND (R.CODDOCUMENTO  = L.CODDOCUMENTO)'+ #13 +
           '           AND (R.NUMLANCTO = L.NUMLANCTO)'+ #13 +
           '           AND (L.CODDOCUMENTO = D.CODDOCUMENTO)) RC'+ #13 +
           '     WHERE (RT.CODDOCUMENTO = RC.CODDOCUMENTO)'+ #13 +
           '       AND (RT.CODDOCUMENTO = D.CODDOCUMENTO)'+ #13 +
           // Alterado por Arnaldo V. Scarin em 26/01/2010
           // SOL: 129555 - Alteração da Disponibilidade Financeira
           // Acerto do Filtro da Data de Vigência da View VW_RATEIODOCUM
           '       AND (RT.EXERCICIO = Case when To_Char(D.DATAPROGRAMADA,''YYYY'') <= ''2009'' then ''2009'' Else ''2010'' end)'+#13+
           '     GROUP BY  RC.CODDOCUMENTO'+ #13 +
           '     UNION'+ #13 +
           '     SELECT SUM(NVL(RT.VALOR,0)) AS VALOR, RC.CODDOCUMENTO'+ #13 +
           '     FROM'+ #13 +
           // Alterado por Arnaldo V. Scarin em 25/01/2010
           // SOL: 129555 - Alteração da Disponibilidade Financeira
           // Troca da Tabela RateioDocum por View VW_RATEIODOCUM
           // '        RATEIODOCUM RT,'+ #13 +
           '        VW_RATEIODOCUM RT,'+#13+
           '        DOCUMENTO D,'+#13+
           '        (SELECT D.NODOCUMENTO, D.NUMAPGR, 0 AS NUMLOTE, D.CODDOCUMENTO'+ #13 +
           '         FROM DOCUMENTO D'+ #13 +
           '         WHERE D.NUMFATURA IN (SELECT  D1.NUMFATURA'+ #13 +
           '                               FROM RECBTOPAGTO R, DOCUMENTO D1, LANCTODOCUM L'+ #13 +
           '                               WHERE (R.CODLANCFINANC  IN (' + rCodLancFinanc + '))'+ #13 +
           '                                 AND (D1.NUMFATURA IS NOT NULL'+ #13 +
           '                                 AND (R.CODDOCUMENTO  = L.CODDOCUMENTO)'+ #13 +
           '                                 AND (R.NUMLANCTO = L.NUMLANCTO)'+ #13 +
           '                                 AND (L.CODDOCUMENTO = D1.CODDOCUMENTO)))'+ #13 +
           '                                 AND (D.OPERACAO <> 3)) RC'+ #13 +
           '     WHERE (RT.CODDOCUMENTO = RC.CODDOCUMENTO)'+ #13 +
           '       AND (RT.CODDOCUMENTO = D.CODDOCUMENTO)'+ #13 +
           // Alterado por Arnaldo V. Scarin em 26/01/2010
           // SOL: 129555 - Alteração da Disponibilidade Financeira
           // Acerto do Filtro da Data de Vigência da View VW_RATEIODOCUM
           '       AND (RT.EXERCICIO = Case when To_Char(D.DATAPROGRAMADA,''YYYY'') <= ''2009'' then ''2009'' Else ''2010'' end)'+#13+
           '     GROUP BY  RC.CODDOCUMENTO) TOT'+ #13 +
           ' WHERE (RT.IDPESSOA = ' + IntToStr(iPessoa) + ')'+ #13 +
           '   AND (RT.IDPATRO = ' + IntToStr(iPatro) + ')'+ #13 +
           '   AND (RT.IDPLANOPREV = ' + IntToStr(iPlanoPrev) + ')'+ #13 +
           '   AND (D.IDFORCLI = P.IDPESSOA)'+ #13 +
           '   AND (RT.CODDOCUMENTO = D.CODDOCUMENTO)'+ #13 +
           '   AND (RT.CODDOCUMENTO = RC.CODDOCUMENTO)'+ #13 +
           '   AND (RT.CODDOCUMENTO = ALT.CODDOCUMENTO(+))'+ #13 +
           '   AND (RT.CODDOCUMENTO = TOT.CODDOCUMENTO(+))'+ #13 +
           '   AND (RT.CODCENTRORESPON = CT.CODCENTRORESPON)'+ #13 +
           // Alterado por Arnaldo V. Scarin em 26/01/2010
           // SOL: 129555 - Alteração da Disponibilidade Financeira
           // Acerto do Filtro da Data de Vigência da View VW_RATEIODOCUM
           '   AND (RT.EXERCICIO = Case when To_Char(D.DATAPROGRAMADA,''YYYY'') <= ''2009'' then ''2009'' Else ''2010'' end)'+#13+
           ' GROUP BY RT.CODCENTRORESPON, P.RAZAOSOCIAL, D.NODOCUMENTO, D.NUMAPGR, RC.NUMLOTE, D.CODDOCUMENTO,'+ #13 +
           '          RT.IDPATRO, RT.IDPLANOPREV, RT.IDPESSOA, CT.NOME) A'+ #13 +
           'GROUP BY  A.CODCENTRORESPON, A.RAZAOSOCIAL, A.NODOCUMENTO, A.NUMAPGR, A.NUMLOTE, A.CODDOCUMENTO, A.CENTRORESPON'+ #13 +
           'ORDER BY A.RAZAOSOCIAL ';
   Result:=GetDataPacket(sSql);
end;

//AL_8
function TCtrlDisponFinanc_CGPC.ListDisponibilidade(sTipoDisp : String;
                                                    dDataRef : TDateTime;
                                                    iPessoa : Integer;
                                                    sPatro : String = 'null';
                                                    sPlanoPrev : String = 'null';
                                                    sFlgGrupo : String = '0';
                                                    sFlgIndRecDes : String = 'null';
                                                    sAtivPlano: String = 'null'): OleVariant;
var sSQL   : string;
    iAno, iMes, iDia : word;
    dDataAnt, dDataSaldoAnt, dDataIniMes, dDataIniMesAnt, dDataFimMesAnt, dDataINSS,
    dDataIniIRRF, dDataFimIRRF, dDataDARF : TDateTime;
    iSaldoAntINSS, iSaldoAntIRRF, iQuarta, iTipoRecDes: Integer;
    iiPessoa : Double;
    sGrupo : string;
    lstSql : TStrings;
begin
   lstSql := TStringList.Create;
   lstSql.Clear;
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
     lstSql.Add('SELECT');
     lstSql.Add('   UU.NOMEGRUPO,');
     lstSql.Add('   UU.GRUPO,');
     lstSql.Add('   TO_NUMBER(SUBSTR(UU.GRUPO,1,20)) AS IDPATRO,');
     lstSql.Add('   TO_NUMBER(SUBSTR(UU.GRUPO,21,20)) AS IDPLANOPREV,');
     lstSql.Add('   NVL(SUM(UU.SALDOANT),0) AS SALDOANT,');
     lstSql.Add('   NVL(SUM(UU.RECEBIMENTOS),0) AS RECEBIMENTOS,');
     lstSql.Add('   NVL(SUM(UU.DESEMBOLSOS),0) AS DESEMBOLSOS,');
     //AL_14
     lstSql.Add('   NVL((SUM(UU.SALDOANT) + SUM(UU.RECEBIMENTOS) + SUM(UU.DESEMBOLSOS)),0) AS SALDODIA, 0 AS TIPO');
     lstSql.Add('FROM');
     lstSql.Add('   (  ');
   end;
   lstSql.Add(' ' );
   lstSql.Add('-- (1) INICIO DA QRYANALITICA');
   lstSql.Add('-- TAG QRYANALIT_I');
   lstSql.Add('SELECT');
   lstSql.Add('   DECODE(DECODE(U.NUMAPGR,NULL,U.NODOCUMENTO,U.NUMAPGR),NULL,U.NODOCUMENTO,U.NUMAPGR) AS NUMDOC,');
   lstSql.Add('   U.NUMAPGR, U.NODOCUMENTO AS NODOCUMENTO,');
   lstSql.Add('   U.SALDO, U.CODCENTRORESPON,');
   lstSql.Add('   CN.NOME, U.IDPLANOPREV, U.IDPATRO, U.TIPOREG,');
   lstSql.Add('   NVL(DECODE(INSTR(''14'',TIPOREG),0,0,U.SALDO),0) AS SALDOANT,');
   lstSql.Add('   NVL(DECODE(INSTR(''23'',TIPOREG),0,0,DECODE(SIGN(U.SALDO),1,U.SALDO,0)),0) AS RECEBIMENTOS,');
   lstSql.Add('   NVL(DECODE(INSTR(''23'',TIPOREG),0,0,DECODE(SIGN(U.SALDO),-1,U.SALDO,0)),0) AS DESEMBOLSOS,');
   //AL_14
   lstSql.Add('   0 AS SALDODIA, U.IDPESSOA, U.NUMLOTE, U.CODLANCFINANC, 0 AS TIPO, ');
   if sGrupo = 'Plano/Patro' then
   begin
     lstSql.Add('   CASE WHEN ' + sFlgGrupo + ' = 0 THEN (PT.NOME ||'' - '' ||P.NOME)');
     //AL_15
     lstSql.Add('        WHEN ' + sFlgGrupo + ' = 1 THEN (PT.NOME)');
     //AL_15
     lstSql.Add('        WHEN ' + sFlgGrupo + ' = 2 THEN (P.NOME)');
     lstSql.Add('   END AS NOMEGRUPO,');
     lstSql.Add('   U.NOMEFORCLI || DECODE(');
     lstSql.Add('                          DECODE(U.IDPATRO,-1,''TOTAL GERAL'',');
     lstSql.Add('                          DECODE(U.IDPATRO,9999999,''TOTAL GERAL'',');
     lstSql.Add('                          DECODE(INSTR(''23'',TIPOREG),0,PT.NOME||'' - '' ||P.NOME,''''))),'''','''',');
     lstSql.Add('                          '' - '' || DECODE(U.IDPATRO, -1, ''TOTAL GERAL'',');
     lstSql.Add('                                   DECODE(U.IDPATRO, 9999999, ''TOTAL GERAL'',');
     lstSql.Add('                                   DECODE(INSTR(''23'', TIPOREG), 0, PT.NOME||'' - '' ||P.NOME,'''')))) AS NOMEFORCLI,');
     lstSql.Add('   (PT.NOME||'' - '' ||P.NOME) AS NOMEPLANOPATRO,');
     lstSql.Add('   PT.NOME AS PLANO, P.NOME AS PATRO, ');
   end
   else if sGrupo = 'Plano' then
   begin
     lstSql.Add('   CASE WHEN ' + sFlgGrupo + ' = 0 THEN (PT.NOME)');
     lstSql.Add('        WHEN ' + sFlgGrupo + ' = 1 THEN (PT.NOME)');
     lstSql.Add('        WHEN ' + sFlgGrupo + ' = 2 THEN ('' '')');
     lstSql.Add('   END AS NOMEGRUPO,');
     lstSql.Add('   U.NOMEFORCLI, (PT.NOME) AS NOMEPLANOPATRO, PT.NOME AS PLANO, '' '' AS PATRO, ');
   end
   else if sGrupo = 'Patro' then
   begin
     lstSql.Add('   CASE WHEN ' + sFlgGrupo + ' = 0 THEN (P.NOME)');
     lstSql.Add('        WHEN ' + sFlgGrupo + ' = 1 THEN ('' '')');
     lstSql.Add('        WHEN ' + sFlgGrupo + ' = 2 THEN (P.NOME)');
     lstSql.Add('   END AS NOMEGRUPO, U.NOMEFORCLI, (P.NOME) AS NOMEPLANOPATRO, '' '' AS PLANO, P.NOME AS PATRO, ');
   end;
   lstSql.Add('   CASE WHEN ' + sFlgGrupo + ' = 0 THEN (LPAD(U.IDPATRO,20,''0'') || LPAD(U.IDPLANOPREV,20,''0''))');
   lstSql.Add('        WHEN ' + sFlgGrupo + ' = 1 THEN (LPAD(''0'',20,''0'') || LPAD(U.IDPLANOPREV,20,''0''))');
   lstSql.Add('        WHEN ' + sFlgGrupo + ' = 2 THEN (LPAD(U.IDPATRO,20,''0'') || LPAD(''0'',20,''0''))');
   lstSql.Add('   END AS GRUPO');
   lstSql.Add('FROM CENTRESPON CN, ');
   if sGrupo = 'Plano/Patro' then
     lstSql.Add(' PESSOA P, PLANPREVCONTABIL PT, ')
   else if sGrupo = 'Plano' then
     lstSql.Add(' PLANPREVCONTABIL PT, ')
   else if sGrupo = 'Patro' then
     lstSql.Add(' PESSOA P, ');
   lstSql.Add('   (');
   lstSql.Add('    -- (1.0) SALDO ANTERIOR');
   lstSql.Add('    -- TAG SALDOANT_10_I');
   lstSql.Add('    SELECT ''SALDO INICIAL'' AS NOMEFORCLI, (DECODE(SIGN(SUM(SALDO)),-1,SUM(SALDO),0) + DECODE(SIGN(SUM(SALDO)),1,SUM(SALDO),0))  AS SALDO, '' '' AS NODOCUMENTO, 0 AS NUMAPGR, ');
   if sGrupo = 'Plano/Patro' then
     lstSql.Add(' IDPLANOPREV, IDPATRO, ')
   else if sGrupo = 'Plano' then
     lstSql.Add(' IDPLANOPREV, '' '' AS IDPATRO, ')
   else if sGrupo = 'Patro' then
     lstSql.Add(' '' '' AS IDPLANOPREV, IDPATRO, ');
   lstSql.Add('       1 AS TIPOREG, '' '' AS CODCENTRORESPON, IDPESSOA, 0 AS NUMLOTE, 0 AS CODLANCFINANC');
   lstSql.Add('    FROM');
   lstSql.Add('       (');
   lstSql.Add('        -- (1.1) SALDO ANTERIOR - REGISTROS BAIXADOS E MODULO <> INVESTIMENTOS');
   lstSql.Add('        -- TAG SALDOANT_11_I');
   lstSql.Add('        SELECT ''SALDO INICIAL'' AS NOMEFORCLI, SUM(DECODE(R.RECPAG,''R'',R.VALOR,R.VALOR*-1)) AS SALDO, R.IDPLANOPREV, R.IDPATRO, 0 AS IDFORCLI, 0 AS CODDOCUMENTO,');
   lstSql.Add('           M.IDPESSOA, 0 AS CODTIPDOC, 0 AS IDMODULO, 0 AS NUMAPGR, 1 AS TIPOREG, '' '' AS NODOCUMENTO, '' '' AS HISTORICOCOMPL, '' '' AS CODTIPRECDES, '' '' AS CODCENTRORESPON, ''F'' AS RECPAG');
   lstSql.Add('        FROM MOVIMFINANC M, RATEIOFINANC R, TIPORECEBDESEMB T');
   lstSql.Add('        WHERE  (M.DATADISPFINANC > TO_DATE('''+DateToStr(dDataSaldoAnt)+''',''DD/MM/YYYY''))');
   lstSql.Add('           AND (M.DATADISPFINANC < TO_DATE('''+DateToStr(dDataRef)+''',''DD/MM/YYYY''))');
   lstSql.Add('           AND (M.IDPESSOA = ' + IntToStr(iPessoa) + ')');
   lstSql.Add('           AND (M.STATUSCONCILIA <> ''C'')');
   lstSql.Add('           AND (M.VALORLANCFINAN <> 0)');
   lstSql.Add('           AND ( NOT EXISTS (SELECT * FROM MOVIMFINANC M1, RECBTOPAGTO R1, DOCUMENTO D1');
   lstSql.Add('                             WHERE ((M1.CODLANCTRANSF IS NULL) OR (M1.CODLANCTRANSF = 0))');
   lstSql.Add('                                AND (M1.IDPESSOA = ' + IntToStr(iPessoa) + ')');
   lstSql.Add('                                AND (M1.STATUSCONCILIA <> ''C'')');
   lstSql.Add('                                AND (M.DATADISPFINANC  > TO_DATE('''+DateToStr(dDataSaldoAnt)+''',''DD/MM/YYYY''))');
   lstSql.Add('                                AND (M.DATADISPFINANC  < TO_DATE('''+DateToStr(dDataRef)+''',''DD/MM/YYYY''))');
   lstSql.Add('                                AND (D1.IDMODULO = 79)');
   lstSql.Add('                                AND (R1.CODLANCFINANC(+) = M1.CODLANCFINANC)');
   lstSql.Add('                                AND (D1.CODDOCUMENTO(+)   = R1.CODDOCUMENTO)');
   lstSql.Add('                                AND (M1.CODLANCFINANC = M.CODLANCFINANC)))');
   lstSql.Add('           AND ((' + sPatro + ' IS NULL) OR (R.IDPATRO = ' + sPatro + '))');
   lstSql.Add('           AND ((' + sPlanoPrev + ' IS NULL) OR (R.IDPLANOPREV = ' + sPlanoPrev + '))');
   lstSql.Add('           AND ((' + sFlgIndRecDes + ' IS NULL) OR (NVL(T.FLGINDICARECDES,''N'') = ' + sFlgIndRecDes + '))');
   lstSql.Add('           AND (M.CODLANCFINANC = R.CODLANCFINANC)');
   lstSql.Add('           AND (R.CODTIPRECDES = T.CODTIPRECDES)');
   lstSql.Add('           AND (R.IDPESSOA = T.IDPESSOA)');
   lstSql.Add('           AND (R.RECPAG = T.RECPAG)');
   lstSql.Add('        GROUP BY R.IDPLANOPREV, R.IDPATRO, M.IDPESSOA');
   lstSql.Add('        -- TAG SALDOANT_11_F');
   lstSql.Add('        UNION ALL');
   lstSql.Add('        -- (1.2) SALDO ANTERIOR - REGISTRO BAIXADOS PELO RECBTO X PAGTO E MODULO <> INVESTIMENTOS');
   lstSql.Add('        -- TAG SALDOANT_12_I');
   lstSql.Add('        SELECT ''SALDO INICIAL'' AS NOMEFORCLI, SUM(DECODE(R.RECPAG,''R'',R.VALOR,R.VALOR*-1)) AS SALDO, R.IDPLANOPREV, R.IDPATRO, 0 AS IDFORCLI, 0 AS CODDOCUMENTO,');
   lstSql.Add('           M.IDPESSOA, 0 AS CODTIPDOC, 0 AS IDMODULO, 0 AS NUMAPGR, 1 AS TIPOREG, '' '' AS NODOCUMENTO, '' '' AS HISTORICOCOMPL, '' '' AS CODTIPRECDES, '' '' AS CODCENTRORESPON, ''F'' AS RECPAG');
   lstSql.Add('        FROM MOVIMFINANC M, RATEIOFINANC R, TIPORECEBDESEMB T');
   lstSql.Add('        WHERE  (M.DATADISPFINANC > TO_DATE('''+DateToStr(dDataSaldoAnt)+''',''DD/MM/YYYY''))');
   lstSql.Add('           AND (M.DATADISPFINANC < TO_DATE('''+DateToStr(dDataRef)+''',''DD/MM/YYYY''))');
   lstSql.Add('           AND (M.IDPESSOA = ' + IntToStr(iPessoa) + ')');
   lstSql.Add('           AND (M.STATUSCONCILIA <> ''C'')');
   lstSql.Add('           AND ((M.VALORLANCFINAN = 0) AND (M.CODLANCTRANSF IS NULL))');
   lstSql.Add('           AND ( NOT EXISTS (SELECT * FROM MOVIMFINANC M1, RECBTOPAGTO R1, DOCUMENTO D1');
   lstSql.Add('                             WHERE ((M1.CODLANCTRANSF IS NULL) OR (M1.CODLANCTRANSF = 0))');
   lstSql.Add('                                AND (M1.IDPESSOA = ' + IntToStr(iPessoa) + ')');
   lstSql.Add('                                AND (M1.STATUSCONCILIA <> ''C'')');
   lstSql.Add('                                AND (M.DATADISPFINANC  > TO_DATE('''+DateToStr(dDataSaldoAnt)+''',''DD/MM/YYYY''))');
   lstSql.Add('                                AND (M.DATADISPFINANC  < TO_DATE('''+DateToStr(dDataRef)+''',''DD/MM/YYYY''))');
   lstSql.Add('                                AND (D1.IDMODULO = 79)');
   lstSql.Add('                                AND (R1.CODLANCFINANC(+) = M1.CODLANCFINANC)');
   lstSql.Add('                                AND (D1.CODDOCUMENTO(+)  = R1.CODDOCUMENTO)');
   lstSql.Add('                                AND (M1.CODLANCFINANC = M.CODLANCFINANC)))');
   lstSql.Add('           AND ((' + sPatro + ' IS NULL) OR (R.IDPATRO = ' + sPatro + '))');
   lstSql.Add('           AND ((' + sPlanoPrev + ' IS NULL) OR (R.IDPLANOPREV = ' + sPlanoPrev + '))');
   lstSql.Add('           AND ((' + sFlgIndRecDes + ' IS NULL) OR (NVL(T.FLGINDICARECDES,''N'') = ' + sFlgIndRecDes + '))');
   lstSql.Add('           AND (M.CODLANCFINANC = R.CODLANCFINANC)');
   lstSql.Add('           AND (R.CODTIPRECDES = T.CODTIPRECDES)');
   lstSql.Add('           AND (R.IDPESSOA = T.IDPESSOA)');
   lstSql.Add('           AND (R.RECPAG = T.RECPAG)');
   lstSql.Add('        GROUP BY R.IDPLANOPREV, R.IDPATRO, M.IDPESSOA');
   lstSql.Add('        -- TAG SALDOANT_12_F');
   lstSql.Add('        UNION ALL');
   lstSql.Add('        -- (1.3) SALDO ANTERIOR - REGISTROS TRC ENTRE PLANOS E MODULO <> INVESTIMENTOS');
   lstSql.Add('        -- TAG SALDOANT_13_I');
   lstSql.Add('        SELECT ''SALDO INICIAL'' AS NOMEFORCLI, SUM(DECODE(R.RECPAG, ''R'', R.VALOR,R.VALOR*-1)) AS SALDO, R.IDPLANOPREV, R.IDPATRO, 0 AS IDFORCLI, 0 AS CODDOCUMENTO,');
   lstSql.Add('           M.IDPESSOA, 0 AS CODTIPDOC, 0 AS IDMODULO, 0 AS NUMAPGR, 1 AS TIPOREG, '' '' AS NODOCUMENTO, '' '' AS HISTORICOCOMPL, '' '' AS CODTIPRECDES, '' '' AS CODCENTRORESPON, ''F'' AS RECPAG');
   lstSql.Add('        FROM MOVIMFINANC M, RATEIOFINANC R, TIPORECEBDESEMB T');
   lstSql.Add('        WHERE (((M.DATALANCFINAN  BETWEEN TO_DATE('''+DateToStr(dDataSaldoAnt)+''',''DD/MM/YYYY'') AND TO_DATE('''+DateToStr(dDataAnt)+''',''DD/MM/YYYY'')) AND (M.DATADISPFINANC IS NULL)) OR');
   lstSql.Add('               ((M.DATALANCFINAN  BETWEEN TO_DATE('''+DateToStr(dDataSaldoAnt)+''',''DD/MM/YYYY'') AND TO_DATE('''+DateToStr(dDataAnt)+''',''DD/MM/YYYY'')) AND (M.DATADISPFINANC BETWEEN TO_DATE('''+DateToStr(dDataSaldoAnt)+''',''DD/MM/YYYY'') AND TO_DATE('''+DateToStr(dDataAnt)+''',''DD/MM/YYYY''))) OR');
   lstSql.Add('               ((M.DATADISPFINANC BETWEEN TO_DATE('''+DateToStr(dDataSaldoAnt)+''',''DD/MM/YYYY'') AND TO_DATE('''+DateToStr(dDataAnt)+''',''DD/MM/YYYY''))))');
   lstSql.Add('           AND (M.DATADISPFINANC > TO_DATE('''+DateToStr(dDataSaldoAnt)+''',''DD/MM/YYYY''))');
   lstSql.Add('           AND (M.IDPESSOA = ' + IntToStr(iPessoa) + ')');
   lstSql.Add('           AND (M.STATUSCONCILIA <> ''C'')');
   lstSql.Add('           AND (M.VALORLANCFINAN = 0)');
   lstSql.Add('           AND ((M.CODLANCTRANSF IS NOT NULL) AND (M.CODLANCTRANSF = M.CODLANCFINANC))');
   lstSql.Add('           AND ( NOT EXISTS (SELECT * FROM MOVIMFINANC M1, RECBTOPAGTO R1, DOCUMENTO D1');
   lstSql.Add('                             WHERE ((M1.CODLANCTRANSF IS NULL) OR (M1.CODLANCTRANSF = 0))');
   lstSql.Add('                                AND (M1.IDPESSOA = ' + IntToStr(iPessoa) + ')');
   lstSql.Add('                                AND (M1.IDMODULO <> 3)');
   lstSql.Add('                                AND (M1.STATUSCONCILIA <> ''C'')');
   lstSql.Add('                                AND (((M1.DATALANCFINAN  BETWEEN TO_DATE('''+DateToStr(dDataSaldoAnt)+''',''DD/MM/YYYY'') AND TO_DATE('''+DateToStr(dDataAnt)+''',''DD/MM/YYYY'')) AND (M1.DATADISPFINANC IS NULL)) OR');
   lstSql.Add('                                     ((M1.DATALANCFINAN  BETWEEN TO_DATE('''+DateToStr(dDataSaldoAnt)+''',''DD/MM/YYYY'') AND TO_DATE('''+DateToStr(dDataAnt)+''',''DD/MM/YYYY'')) AND (M1.DATADISPFINANC BETWEEN TO_DATE('''+DateToStr(dDataSaldoAnt)+''',''DD/MM/YYYY'') AND TO_DATE('''+DateToStr(dDataAnt)+''',''DD/MM/YYYY''))) OR');
   lstSql.Add('                                     ((M1.DATADISPFINANC BETWEEN TO_DATE('''+DateToStr(dDataSaldoAnt)+''',''DD/MM/YYYY'') AND TO_DATE('''+DateToStr(dDataAnt)+''',''DD/MM/YYYY''))))');
   lstSql.Add('                                AND (M1.DATADISPFINANC > TO_DATE('''+DateToStr(dDataSaldoAnt)+''',''DD/MM/YYYY''))');
   lstSql.Add('                                AND (D1.IDMODULO = 79)');
   lstSql.Add('                                AND (R1.CODLANCFINANC(+) = M1.CODLANCFINANC)');
   lstSql.Add('                                AND (D1.CODDOCUMENTO(+)   = R1.CODDOCUMENTO)');
   lstSql.Add('                                AND (M1.CODLANCFINANC = M.CODLANCFINANC)))');
   lstSql.Add('           AND ((' + sPatro + ' IS NULL) OR (R.IDPATRO = ' + sPatro + '))');
   lstSql.Add('           AND ((' + sPlanoPrev + ' IS NULL) OR (R.IDPLANOPREV = ' + sPlanoPrev + '))');
   lstSql.Add('           AND ((' + sFlgIndRecDes + ' IS NULL) OR (NVL(T.FLGINDICARECDES,''N'') = ' + sFlgIndRecDes + '))');
   lstSql.Add('           AND (M.CODLANCFINANC = R.CODLANCFINANC)');
   lstSql.Add('           AND (R.CODTIPRECDES = T.CODTIPRECDES)');
   lstSql.Add('           AND (R.IDPESSOA = T.IDPESSOA)');
   lstSql.Add('           AND (R.RECPAG = T.RECPAG)');
   lstSql.Add('        GROUP BY R.IDPLANOPREV, R.IDPATRO, M.IDPESSOA');
   lstSql.Add('        -- TAG SALDOANT_13_F');
   lstSql.Add('        UNION ALL');
   lstSql.Add('        -- (1.4) SALDO ANTERIOR - REGISTROS DE CPMF BAIXADOS');
   lstSql.Add('        -- TAG SALDOANT_14_I');
   lstSql.Add('        SELECT ''SALDO INICIAL'' AS NOMEFORCLI, SUM(R.VALOR) * -1 AS SALDO, R.IDPLANOPREV, R.IDPATRO, 0 AS IDFORCLI, 0 AS CODDOCUMENTO,');
   lstSql.Add('           M.IDPESSOA, 0 AS CODTIPDOC, 0 AS IDMODULO, 0 AS NUMAPGR, 1 AS TIPOREG, '' '' AS NODOCUMENTO, '' '' AS HISTORICOCOMPL, '' '' AS CODTIPRECDES, '' '' AS CODCENTRORESPON, ''F'' AS RECPAG');
   lstSql.Add('        FROM MOVIMFINANC M, RATEIOFINANC R, PORTADORCONTA PO, TIPORECEBDESEMB T');
   lstSql.Add('        WHERE (M.CODLANCFINANC IN (SELECT M.CODLANCFINANC FROM MOVIMFINANC M');
   lstSql.Add('                                WHERE (M.IDMODULO = 3)');
   lstSql.Add('                                      AND (IDPESSOA = ' + IntToStr(iPessoa) + ')');
   lstSql.Add('                                      AND (DATALANCFINAN > TO_DATE('''+DateToStr(dDataSaldoAnt)+''',''DD/MM/YYYY''))');
   lstSql.Add('                                      AND (DATALANCFINAN < TO_DATE('''+DateToStr(dDataRef)+''',''DD/MM/YYYY''))');
   lstSql.Add('                                      AND (M.CODLANCFINANC IN (SELECT DISTINCT CODLANCFINANC FROM RATEIOFINANC');
   lstSql.Add('                                                               WHERE CODTIPDOC = (SELECT CODTIPDOCCPMF FROM PARAMCAP WHERE IDPESSOA = ' + IntToStr(iPessoa) + ' AND RECPAG = ''P'')))))');
   lstSql.Add('           AND ((' + sPatro + ' IS NULL) OR (R.IDPATRO = ' + sPatro + '))');
   lstSql.Add('           AND ((' + sPlanoPrev + ' IS NULL) OR (R.IDPLANOPREV = ' + sPlanoPrev + '))');
   lstSql.Add('           AND ((' + sFlgIndRecDes + ' IS NULL) OR (NVL(T.FLGINDICARECDES,''N'') = ' + sFlgIndRecDes + '))');
   lstSql.Add('           AND (M.CODLANCFINANC = R.CODLANCFINANC)');
   lstSql.Add('           AND (M.CODPORTADOR = PO.CODPORTADOR)');
   lstSql.Add('           AND (R.CODTIPRECDES = T.CODTIPRECDES)');
   lstSql.Add('           AND (R.IDPESSOA = T.IDPESSOA)');
   lstSql.Add('           AND (R.RECPAG = T.RECPAG)');
   lstSql.Add('        GROUP BY R.IDPLANOPREV,R.IDPATRO,M.IDPESSOA,M.CODPORTADOR');
   lstSql.Add('        -- TAG SALDOANT_14_F');
   lstSql.Add('        UNION ALL');
   lstSql.Add('        -- (1.4.1) SALDO ANTERIOR - CPMF NAO BAIXADOS DE TRANSF ENTRE CONTAS');
   lstSql.Add('        -- TAG SALDOANT_141_I');
   lstSql.Add('        SELECT ''SALDO INICIAL'' AS NOMEFORCLI, SUM(R.VLRCPMF) * -1 AS SALDO, R.IDPLANOPREV, R.IDPATRO, 0 AS IDFORCLI, 0 AS CODDOCUMENTO,');
   lstSql.Add('           I.IDPESSOA, 0 AS CODTIPDOC, 0 AS IDMODULO, 0 AS NUMAPGR, 1 AS TIPOREG, '' '' AS NODOCUMENTO, '' '' AS HISTORICOCOMPL, '' '' AS CODTIPRECDES, '' '' AS CODCENTRORESPON, ''F'' AS RECPAG');
   lstSql.Add('        FROM IMPOSTORETIDO  I, RATEIOIMPOSTORETIDO R');
   lstSql.Add('        WHERE   I.DATARETENCAO > TO_DATE('''+DateToStr(dDataSaldoAnt)+''',''DD/MM/YYYY'')');
   lstSql.Add('            AND I.DATARETENCAO < TO_DATE('''+DateToStr(dDataRef)+''',''DD/MM/YYYY'')');
   lstSql.Add('            AND I.CODTIPOCUSTAGREG = (SELECT CODTIPOCUSTAGREG FROM PARAMFINANC)');
   lstSql.Add('            AND I.CODDOCUMENTO IS NULL');
   lstSql.Add('            AND I.NUMLOTEMANUAL = 0');
   lstSql.Add('            AND I.CODLANCFINANC IS NOT NULL');
   lstSql.Add('            AND I.IDPESSOA = ' + IntToStr(iPessoa) + '');
   lstSql.Add('            AND ((' + sPatro + ' IS NULL) OR (R.IDPATRO = ' + sPatro + '))');
   lstSql.Add('            AND ((' + sPlanoPrev + ' IS NULL) OR (R.IDPLANOPREV = ' + sPlanoPrev + '))');
   lstSql.Add('            AND (1 = ' + FFlgDocBaixado + ')');
   lstSql.Add('            AND (I.IDIMPOSTORETIDO = R.IDIMPOSTORETIDO)');
   lstSql.Add('        GROUP BY R.IDPLANOPREV,R.IDPATRO, I.IDPESSOA, I.CODPORTADOR, I.IDFORCLI');
   lstSql.Add('        -- TAG SALDOANT_141_F');
   lstSql.Add('        UNION ALL');
   lstSql.Add('        -- (1.5) SALDO ANTERIOR - REGISTROS DE CPMF NAO BAIXADOS');
   lstSql.Add('        -- TAG SALDOANT_15_I');
   lstSql.Add('        SELECT ''SALDO INICIAL'' AS NOMEFORCLI, SUM(R.VALOR) * -1 AS SALDO, R.IDPLANOPREV, R.IDPATRO, 0 AS IDFORCLI, 0 AS CODDOCUMENTO,');
   lstSql.Add('          D.IDPESSOA, 0 AS CODTIPDOC, 0 AS IDMODULO, 0 AS NUMAPGR, 1 AS TIPOREG, '' '' AS NODOCUMENTO, '' '' AS HISTORICOCOMPL, '' '' AS CODTIPRECDES, '' '' AS CODCENTRORESPON, ''F'' AS RECPAG');
   // Alterado por Arnaldo V. Scarin em 25/01/2010
   // SOL: 129555 - Alteração da Disponibilidade Financeira
   // Troca da Tabela RateioDocum por View VW_RATEIODOCUM
   //'           DOCUMENTO D, LANCTODOCUM L, RATEIODOCUM R, TIPORECEBDESEMB T,');
   lstSql.Add('        FROM DOCUMENTO D, LANCTODOCUM L, VW_RATEIODOCUM R, TIPORECEBDESEMB T,');
   lstSql.Add('           (SELECT P.CODTIPDOCCPMF FROM PARAMCAP P WHERE P.IDPESSOA = ' + IntToStr(iPessoa) + ' AND P.RECPAG = ''P'') P');
   lstSql.Add('        WHERE (D.DATAPROGRAMADA > TO_DATE('''+DateToStr(dDataSaldoAnt)+''',''DD/MM/YYYY''))');
   lstSql.Add('           AND (D.DATAPROGRAMADA < TO_DATE('''+DateToStr(dDataRef)+''',''DD/MM/YYYY''))');
   lstSql.Add('           AND (D.IDPESSOA = ' + IntToStr(iPessoa) + ')');
   lstSql.Add('           AND (D.RECPAG = ''P'')');
   lstSql.Add('           AND (D.OPERACAO IN (''2 '',''1 ''))');
   lstSql.Add('           AND (D.STATUS <> ''2'')');
   lstSql.Add('           AND ((' + sPatro + ' IS NULL) OR (R.IDPATRO = ' + sPatro + '))');
   lstSql.Add('           AND ((' + sPlanoPrev + ' IS NULL) OR (R.IDPLANOPREV = ' + sPlanoPrev + '))');
   lstSql.Add('           AND ((' + sFlgIndRecDes + ' IS NULL) OR (NVL(T.FLGINDICARECDES,''N'') = ' + sFlgIndRecDes + '))');
   lstSql.Add('           AND (1 = ' + FFlgDocBaixado + ')');
   lstSql.Add('           AND (D.CODTIPDOC = P.CODTIPDOCCPMF)');
   lstSql.Add('           AND (D.CODDOCUMENTO = L.CODDOCUMENTO)');
   lstSql.Add('           AND (D.CODDOCUMENTO = R.CODDOCUMENTO)');
   lstSql.Add('           AND (R.CODTIPRECDES = T.CODTIPRECDES)');
   // Alterado por Arnaldo V. Scarin em 26/01/2010
   // SOL: 129555 - Alteração da Disponibilidade Financeira
   // Acerto do Filtro da Data de Vigência da View VW_RATEIODOCUM
   lstSql.Add('           AND (R.EXERCICIO = '+QuotedStr(FormatDateTime('YYYY',dDataRef))+')');
   lstSql.Add('           AND (R.RECPAG = T.RECPAG)');
   lstSql.Add('        GROUP BY D.IDFORCLI, D.NUMAPGR, D.COMPLDOCUMENTO, D.NODOCUMENTO, R.IDPLANOPREV, R.IDPATRO, D.IDPESSOA, R.CODCENTRORESPON');
   lstSql.Add('        -- TAG SALDOANT_15_F');
   lstSql.Add('        UNION ALL');
   lstSql.Add('        -- (1.6) SALDO ANTERIOR - REGISTROS DE RECEBIMENTO E MODULO DE INVESTIMENTOS');
   lstSql.Add('        -- TAG SALDOANT_16_I');
   lstSql.Add('        SELECT A.NOMEFORCLI, A.SALDO, A.IDPLANOPREV, A.IDPATRO, A.IDFORCLI, A.CODDOCUMENTO,');
   lstSql.Add('           A.IDPESSOA, A.CODTIPDOC, A.IDMODULO, A.NUMAPGR, A.TIPOREG, A.NODOCUMENTO, L.HISTORICOCOMPL, A.CODTIPRECDES, A.CODCENTRORESPON, A.RECPAG');
   lstSql.Add('        FROM');
   lstSql.Add('           (SELECT ''SALDO INICIAL'' AS NOMEFORCLI, SUM(DECODE(L.DEBCRE,''D'',L.VALOR,L.VALOR * -1)-(DECODE(P.VALOR,NULL,0,P.VALOR))) AS SALDO, R.IDPLANOPREV, R.IDPATRO, D.IDFORCLI, D.CODDOCUMENTO,');
   lstSql.Add('                D.IDPESSOA, D.CODTIPDOC, D.IDMODULO, 0 AS NUMAPGR, 1 AS TIPOREG, DECODE(D.COMPLDOCUMENTO,NULL,TO_CHAR(D.NODOCUMENTO),(TO_CHAR(D.NODOCUMENTO)||''/''||D.COMPLDOCUMENTO)) AS NODOCUMENTO, R.CODTIPRECDES, '' '' AS CODCENTRORESPON, D.RECPAG');
   lstSql.Add('            FROM DOCUMENTO D,LANCTODOCUM L,');
   lstSql.Add('               (SELECT DISTINCT R1.IDPATRO,R1.IDPLANOPREV,R1.CODTIPRECDES, D1.CODDOCUMENTO');
   // Alterado por Arnaldo V. Scarin em 25/01/2010
   // SOL: 129555 - Alteração da Disponibilidade Financeira
   // Troca da Tabela RateioDocum por View VW_RATEIODOCUM
   //'                FROM RATEIODOCUM R1, DOCUMENTO D1, TIPORECEBDESEMB T');
   lstSql.Add('                FROM VW_RATEIODOCUM R1, DOCUMENTO D1, TIPORECEBDESEMB T');
   lstSql.Add('                WHERE (D1.DATADISPONIB > TO_DATE('''+DateToStr(dDataSaldoAnt)+''',''DD/MM/YYYY''))');
   lstSql.Add('                    AND (D1.DATADISPONIB < TO_DATE('''+DateToStr(dDataRef)+''',''DD/MM/YYYY''))');
   lstSql.Add('                    AND (D1.IDPESSOA = ' + IntToStr(iPessoa) + ')');
   lstSql.Add('                    AND (D1.OPERACAO IN (''2 ''))');
   lstSql.Add('                    AND (D1.RECPAG = ''R'')');
   lstSql.Add('                    AND (D1.IDMODULO  = 79)');
   lstSql.Add('                    AND ((' + sPatro + ' IS NULL) OR (R1.IDPATRO = ' + sPatro + '))');
   lstSql.Add('                    AND ((' + sPlanoPrev + ' IS NULL) OR (R1.IDPLANOPREV = ' + sPlanoPrev + '))');
   lstSql.Add('                    AND ((' + sFlgIndRecDes + ' IS NULL) OR (NVL(T.FLGINDICARECDES,''N'') = ' + sFlgIndRecDes + '))');
   lstSql.Add('                    AND (1 = ' + FFlgDocBaixado + ') ');
   lstSql.Add('                    AND (R1.CODTIPRECDES = T.CODTIPRECDES)');
   lstSql.Add('                    AND (R1.IDPESSOA = T.IDPESSOA)');
   lstSql.Add('                    AND (R1.RECPAG = T.RECPAG)');
   // Alterado por Arnaldo V. Scarin em 26/01/2010
   // SOL: 129555 - Alteração da Disponibilidade Financeira
   // Acerto do Filtro da Data de Vigência da View VW_RATEIODOCUM
   lstSql.Add('                    AND (R1.EXERCICIO = '+QuotedStr(FormatDateTime('YYYY',dDataRef))+')');
   lstSql.Add('                    AND (D1.CODDOCUMENTO = R1.CODDOCUMENTO)) R,');
   lstSql.Add('                (SELECT LA.CODDOCUMENTO, DECODE(LA.DEBCRE,''C'',LA.VALOR,LA.VALOR * -1) AS VALOR');
   lstSql.Add('                 FROM RECBTOPAGTO RE, LANCTODOCUM LA');
   lstSql.Add('                 WHERE RE.CODPORTFORMA IN (SELECT CODPORTFORMA FROM PORTADORFORMA WHERE LANCAFINANC = ''N'')');
   lstSql.Add('                    AND LA.DEBCRE = ''D''');
   lstSql.Add('                    AND LA.NUMLANCTO = RE.NUMLANCTO) P');
   lstSql.Add('            WHERE (D.DATADISPONIB > TO_DATE('''+DateToStr(dDataSaldoAnt)+''',''DD/MM/YYYY''))');
   lstSql.Add('                AND (D.DATADISPONIB < TO_DATE('''+DateToStr(dDataRef)+''',''DD/MM/YYYY''))');
   lstSql.Add('                AND (D.IDPESSOA = ' + IntToStr(iPessoa) + ')');
   lstSql.Add('                AND (NVL(L.VALOR,0) <> 0)');
   lstSql.Add('                AND (D.OPERACAO IN (''2 ''))');
   lstSql.Add('                AND (L.OPERACAO <> 5)');
   lstSql.Add('                AND (D.RECPAG = ''R'')');
   lstSql.Add('                AND (D.IDMODULO  = 79)');
   lstSql.Add('                AND ((' + sPatro + ' IS NULL) OR (R.IDPATRO = ' + sPatro + '))');
   lstSql.Add('                AND ((' + sPlanoPrev + ' IS NULL) OR (R.IDPLANOPREV = ' + sPlanoPrev + '))');
   lstSql.Add('                AND (D.CODDOCUMENTO = L.CODDOCUMENTO)');
   lstSql.Add('                AND (D.CODDOCUMENTO = R.CODDOCUMENTO)');
   lstSql.Add('                AND (D.CODDOCUMENTO = P.CODDOCUMENTO(+))');
   lstSql.Add('            GROUP BY D.IDFORCLI,D.DATAVENCTO,D.COMPLDOCUMENTO,D.NODOCUMENTO, D.DATAPROGRAMADA,L.DATALANCTO,R.CODTIPRECDES,');
   lstSql.Add('                R.IDPLANOPREV,R.IDPATRO,D.RECPAG,D.IDPESSOA,D.OPERACAO, D.CODTIPDOC,D.IDMODULO,D.CODDOCUMENTO');
   lstSql.Add('            HAVING SUM(NVL(L.VALOR,0)-(DECODE(P.VALOR,NULL,0,P.VALOR))) <> 0) A, LANCTODOCUM L');
   lstSql.Add('        WHERE A.CODDOCUMENTO = L.CODDOCUMENTO');
   lstSql.Add('           AND L.OPERACAO NOT IN (''4 '',''5 '')');
   lstSql.Add('        -- TAG SALDOANT_16_F');
   lstSql.Add('        UNION ALL');
   lstSql.Add('        -- (1.7) SALDO ANTERIOR - REGISTROS DE PAGAMENTO E MODULO DE INVESTIMENTOS');
   lstSql.Add('        -- TAG SALDOANT_17_I');
   lstSql.Add('        SELECT A.NOMEFORCLI, A.SALDO, A.IDPLANOPREV, A.IDPATRO, A.IDFORCLI, A.CODDOCUMENTO, A.IDPESSOA, A.CODTIPDOC, A.IDMODULO, A.NUMAPGR, A.TIPOREG, A.NODOCUMENTO, L.HISTORICOCOMPL, A.CODTIPRECDES, A.CODCENTRORESPON, A.RECPAG');
   lstSql.Add('        FROM (SELECT ''SALDO INICIAL'' AS NOMEFORCLI, SUM(DECODE(L.DEBCRE,''D'',L.VALOR,L.VALOR * -1)-(DECODE(P.VALOR,NULL,0,P.VALOR))) AS SALDO, R.IDPLANOPREV, R.IDPATRO, D.IDFORCLI, D.CODDOCUMENTO,');
   lstSql.Add('                D.IDPESSOA, D.CODTIPDOC, D.IDMODULO, 0 AS NUMAPGR, 1 AS TIPOREG, DECODE(D.COMPLDOCUMENTO,NULL,TO_CHAR(D.NODOCUMENTO),(TO_CHAR(D.NODOCUMENTO)||''/''||D.COMPLDOCUMENTO)) AS NODOCUMENTO, R.CODTIPRECDES, '' '' AS CODCENTRORESPON, D.RECPAG');
   lstSql.Add('             FROM DOCUMENTO D,LANCTODOCUM L,');
   lstSql.Add('                (SELECT DISTINCT R1.IDPATRO,R1.IDPLANOPREV,R1.CODTIPRECDES, D1.CODDOCUMENTO');
   // Alterado por Arnaldo V. Scarin em 25/01/2010
   // SOL: 129555 - Alteração da Disponibilidade Financeira
   // Troca da Tabela RateioDocum por View VW_RATEIODOCUM
   //'                 FROM RATEIODOCUM R1, DOCUMENTO D1, TIPORECEBDESEMB T');
   lstSql.Add('                 FROM VW_RATEIODOCUM R1, DOCUMENTO D1, TIPORECEBDESEMB T');
   lstSql.Add('                 WHERE (D1.DATADISPONIB > TO_DATE('''+DateToStr(dDataSaldoAnt)+''',''DD/MM/YYYY''))');
   lstSql.Add('                    AND (D1.DATADISPONIB < TO_DATE('''+DateToStr(dDataRef)+''',''DD/MM/YYYY''))');
   lstSql.Add('                    AND (D1.IDPESSOA = ' + IntToStr(iPessoa) + ')');
   lstSql.Add('                    AND (D1.OPERACAO IN (''2 ''))');
   lstSql.Add('                    AND (D1.RECPAG = ''P'')');
   lstSql.Add('                    AND (D1.IDMODULO  = 79)');
   lstSql.Add('                    AND ((' + sPatro + ' IS NULL) OR (R1.IDPATRO = ' + sPatro + '))');
   lstSql.Add('                    AND ((' + sPlanoPrev + ' IS NULL) OR (R1.IDPLANOPREV = ' + sPlanoPrev + '))');
   // Alterado por Arnaldo V. Scarin em 26/01/2010
   // SOL: 129555 - Alteração da Disponibilidade Financeira
   // Acerto do Filtro da Data de Vigência da View VW_RATEIODOCUM
   lstSql.Add('                    AND (R1.EXERCICIO = '+QuotedStr(FormatDateTime('YYYY',dDataRef))+')');
   lstSql.Add('                    AND ((' + sFlgIndRecDes + ' IS NULL) OR (NVL(T.FLGINDICARECDES,''N'') = ' + sFlgIndRecDes + '))');
   lstSql.Add('                    AND (1 = ' + FFlgDocBaixado + ')');
   lstSql.Add('                    AND (R1.CODTIPRECDES = T.CODTIPRECDES)');
   lstSql.Add('                    AND (R1.IDPESSOA = T.IDPESSOA)');
   lstSql.Add('                    AND (R1.RECPAG = T.RECPAG)');
   lstSql.Add('                    AND (D1.CODDOCUMENTO = R1.CODDOCUMENTO)) R,');
   lstSql.Add('                (SELECT LA.CODDOCUMENTO, DECODE(LA.DEBCRE,''C'',LA.VALOR,LA.VALOR * -1) AS VALOR');
   lstSql.Add('                 FROM RECBTOPAGTO RE, LANCTODOCUM LA');
   lstSql.Add('                 WHERE  RE.CODPORTFORMA IN (SELECT CODPORTFORMA FROM PORTADORFORMA WHERE LANCAFINANC = ''N'')');
   lstSql.Add('                    AND LA.DEBCRE = ''D''');
   lstSql.Add('                    AND LA.NUMLANCTO = RE.NUMLANCTO) P');
   lstSql.Add('             WHERE  (D.DATADISPONIB > TO_DATE('''+DateToStr(dDataSaldoAnt)+''',''DD/MM/YYYY''))');
   lstSql.Add('                AND (D.DATADISPONIB < TO_DATE('''+DateToStr(dDataRef)+''',''DD/MM/YYYY''))');
   lstSql.Add('                AND (D.IDPESSOA = ' + IntToStr(iPessoa) + ')');
   lstSql.Add('                AND (NVL(L.VALOR,0) <> 0)');
   lstSql.Add('                AND (D.OPERACAO IN (''2 ''))');
   lstSql.Add('                AND (L.OPERACAO <> 5)');
   lstSql.Add('                AND NOT Exists (Select 1 From DocumxDocum dxd');
   lstSql.Add('                                where dxd.iddocumento = d.coddocumento');
   lstSql.Add('                                  and dxd.flgdispfinanc = ''S'')');
   lstSql.Add('                AND (D.RECPAG = ''P'')');
   lstSql.Add('                AND (D.IDMODULO  = 79)');
   lstSql.Add('                AND ((' + sPatro + ' IS NULL) OR (R.IDPATRO = ' + sPatro + '))');
   lstSql.Add('                AND ((' + sPlanoPrev + ' IS NULL) OR (R.IDPLANOPREV = ' + sPlanoPrev + '))');
   lstSql.Add('                AND (D.CODDOCUMENTO = L.CODDOCUMENTO)');
   lstSql.Add('                AND (D.CODDOCUMENTO = R.CODDOCUMENTO)');
   lstSql.Add('                AND (D.CODDOCUMENTO = P.CODDOCUMENTO(+))');
   lstSql.Add('             GROUP BY D.IDFORCLI,D.DATAVENCTO,D.COMPLDOCUMENTO,D.NODOCUMENTO, D.DATAPROGRAMADA,L.DATALANCTO,R.CODTIPRECDES,');
   lstSql.Add('                R.IDPLANOPREV,R.IDPATRO,D.RECPAG,D.IDPESSOA,D.OPERACAO, D.CODTIPDOC,D.IDMODULO,D.CODDOCUMENTO');
   lstSql.Add('             HAVING SUM(NVL(L.VALOR,0)-(DECODE(P.VALOR,NULL,0,P.VALOR))) <> 0) A, LANCTODOCUM L');
   lstSql.Add('        WHERE A.CODDOCUMENTO = L.CODDOCUMENTO');
   lstSql.Add('           AND L.OPERACAO NOT IN (''4 '',''5 '')');
   lstSql.Add('        -- TAG SALDOANT_17_F');
   lstSql.Add('        UNION ALL');
   lstSql.Add('        -- (1.8) SALDO ANTERIOR - REGISTROS DE PAGAMENTO E RECEBIMENTO NAO BAIXADOS E MODULO <> INVESTIMENTOS');
   lstSql.Add('        -- TAG SALDOANT_18_I');
   lstSql.Add('        SELECT ''SALDO INICIAL'' AS NOMEFORCLI,  SUM(((R.VALOR*S.SALDO)/L.VALOR)-(DECODE(P.VALOR,NULL,0,P.VALOR))) AS SALDO, R.IDPLANOPREV, R.IDPATRO, D.IDFORCLI, D.CODDOCUMENTO,');
   lstSql.Add('           D.IDPESSOA, D.CODTIPDOC, D.IDMODULO, 0 AS NUMAPGR, 1 AS TIPOREG, DECODE(D.COMPLDOCUMENTO,NULL,TO_CHAR(D.NODOCUMENTO),');
   lstSql.Add('          (TO_CHAR(D.NODOCUMENTO)||''/''||D.COMPLDOCUMENTO)) AS NODOCUMENTO, L.HISTORICOCOMPL, R.CODTIPRECDES, '' '' AS CODCENTRORESPON, R.RECPAG');
   // Alterado por Arnaldo V. Scarin em 25/01/2010
   // SOL: 129555 - Alteração da Disponibilidade Financeira
   // Troca da Tabela RateioDocum por View VW_RATEIODOCUM
   //'           DOCUMENTO D,LANCTODOCUM L,RATEIODOCUM R, TIPORECEBDESEMB T,');
   lstSql.Add('        FROM DOCUMENTO D,LANCTODOCUM L,VW_RATEIODOCUM R, TIPORECEBDESEMB T,');
   lstSql.Add('           (SELECT P.CODTIPDOCCPMF FROM PARAMCAP P WHERE P.IDPESSOA = 1 AND P.RECPAG = ''P'') P,');
   lstSql.Add('           (SELECT D.CODDOCUMENTO, SUM(DECODE(L.DEBCRE,''D'',L.VALOR,L.VALOR*-1)) AS SALDO');
   lstSql.Add('            FROM DOCUMENTO D, LANCTODOCUM L');
   lstSql.Add('            WHERE (D.OPERACAO IN (''2 ''))');
   lstSql.Add('               AND (D.RECPAG = ''P'')');
   lstSql.Add('               AND (D.IDPESSOA = ' + IntToStr(iPessoa) + ')');
   lstSql.Add('               AND (L.OPERACAO <> 5)');
   lstSql.Add('               AND (D.CODDOCUMENTO = L.CODDOCUMENTO)');
   lstSql.Add('            GROUP BY D.CODDOCUMENTO) S,');
   lstSql.Add('           (SELECT LA.CODDOCUMENTO, DECODE(LA.DEBCRE,''D'',LA.VALOR * -1,LA.VALOR) AS VALOR');
   lstSql.Add('            FROM RECBTOPAGTO RE, LANCTODOCUM LA');
   lstSql.Add('            WHERE RE.CODPORTFORMA IN (SELECT CODPORTFORMA FROM PORTADORFORMA WHERE LANCAFINANC = ''N'')');
   lstSql.Add('               AND LA.DEBCRE = ''D''');
   lstSql.Add('               AND LA.NUMLANCTO = RE.NUMLANCTO) P');
   lstSql.Add('        WHERE (D.DATAPROGRAMADA > TO_DATE('''+DateToStr(dDataSaldoAnt)+''',''DD/MM/YYYY''))');
   lstSql.Add('           AND (D.DATAPROGRAMADA < TO_DATE('''+DateToStr(dDataRef)+''',''DD/MM/YYYY''))');
   lstSql.Add('           AND (D.IDPESSOA = ' + IntToStr(iPessoa) + ')');
   lstSql.Add('           AND (NVL(L.VALOR,0) <> 0)');
   lstSql.Add('           AND (D.OPERACAO IN (''2 ''))');
   lstSql.Add('           AND (D.STATUS <> 2)');
   lstSql.Add('           AND (D.RECPAG = ''P'')');
   lstSql.Add('           AND (L.OPERACAO <> 5)');
   lstSql.Add('           AND (D.IDMODULO  <> 79)');
   lstSql.Add('           AND NOT Exists (Select 1 From DocumxDocum dxd');
   lstSql.Add('                           where dxd.iddocumento = d.coddocumento');
   lstSql.Add('                             and dxd.flgdispfinanc = ''S'')');
   lstSql.Add('           AND (D.CODTIPDOC <> P.CODTIPDOCCPMF)');
   lstSql.Add('           AND ((' + sPatro + ' IS NULL) OR (R.IDPATRO = ' + sPatro + '))');
   lstSql.Add('           AND ((' + sPlanoPrev + ' IS NULL) OR (R.IDPLANOPREV = ' + sPlanoPrev + '))');
   lstSql.Add('           AND ((' + sFlgIndRecDes + ' IS NULL) OR (NVL(T.FLGINDICARECDES,''N'') = ' + sFlgIndRecDes + '))');
   lstSql.Add('           AND (1 = ' + FFlgDocBaixado + ')');
   // Alterado por Arnaldo V. Scarin em 26/01/2010
   // SOL: 129555 - Alteração da Disponibilidade Financeira
   // Acerto do Filtro da Data de Vigência da View VW_RATEIODOCUM
   lstSql.Add('           AND (R.EXERCICIO = '+QuotedStr(FormatDateTime('YYYY',dDataRef))+')');
   lstSql.Add('           AND (D.CODDOCUMENTO = L.CODDOCUMENTO)');
   lstSql.Add('           AND (D.OPERACAO = L.OPERACAO)');
   lstSql.Add('           AND (D.CODDOCUMENTO = R.CODDOCUMENTO)');
   lstSql.Add('           AND (D.CODDOCUMENTO = S.CODDOCUMENTO)');
   lstSql.Add('           AND (D.CODDOCUMENTO = P.CODDOCUMENTO(+))');
   lstSql.Add('           AND (R.CODTIPRECDES = T.CODTIPRECDES)');
   lstSql.Add('           AND (R.IDPESSOA = T.IDPESSOA)');
   lstSql.Add('           AND (R.RECPAG = T.RECPAG)');
   lstSql.Add('        GROUP BY D.IDFORCLI,D.DATAVENCTO,D.COMPLDOCUMENTO,D.NODOCUMENTO, D.DATAPROGRAMADA,L.HISTORICOCOMPL,L.DATALANCTO,R.CODTIPRECDES,');
   lstSql.Add('           R.IDPLANOPREV,R.IDPATRO,R.RECPAG,D.IDPESSOA,D.OPERACAO, D.CODTIPDOC,D.IDMODULO,D.CODDOCUMENTO');
   lstSql.Add('        HAVING SUM(((R.VALOR*S.SALDO)/L.VALOR)-(DECODE(P.VALOR,NULL,0,P.VALOR))) <> 0');
   lstSql.Add('        -- TAG SALDOANT_18_F');
   lstSql.Add('        UNION ALL');
   lstSql.Add('        -- (1.9) SALDO ANTERIOR - REGISTROS DE INSS');
   lstSql.Add('        -- TAG SALDOANT_19_I');
   lstSql.Add('        SELECT DISTINCT');
   lstSql.Add('              ''SALDO INICIAL'' AS NOMEFORCLI, (X.SALDO * -1) AS SALDO, R.IDPLANOPREV, R.IDPATRO, 0 AS IDFORCLI, 0 AS CODDOCUMENTO,');
   lstSql.Add('              D.IDPESSOA, 0 AS CODTIPDOC, 0 AS IDMODULO, 0 AS NUMAPGR, 1 AS TIPOREG, '' '' AS NODOCUMENTO, '' '' AS HISTORICOCOMPL, '' '' AS CODTIPRECDES, '' '' AS CODCENTRORESPON, ''F'' AS RECPAG');
   // Alterado por Arnaldo V. Scarin em 25/01/2010
   // SOL: 129555 - Alteração da Disponibilidade Financeira
   // Troca da Tabela RateioDocum por View VW_RATEIODOCUM
   //'           DOCUMENTO D,LANCTODOCUM L,RATEIODOCUM R, TIPORECEBDESEMB T,');
   lstSql.Add('        FROM DOCUMENTO D,LANCTODOCUM L,VW_RATEIODOCUM R, TIPORECEBDESEMB T,');
   lstSql.Add('           (');
   lstSql.Add('            -- (1.9.1) REGISTROS QUE NAO ESTAO EM GPS');
   lstSql.Add('            -- TAG SALDOANT_191_I');
   lstSql.Add('            SELECT DISTINCT');
   lstSql.Add('               L.DATALANCTO AS DATALANCTO, D.IDFORCLI AS IDFORCLI, P.RAZAOSOCIAL AS RAZAOSOCIAL, D.CODDOCUMENTO, L.NUMLANCTO, DECODE(L.DEBCRE, ''D'', L.VALOR, L.VALOR*-1) AS SALDO, D.OPERACAO, D.NUMFATURA, T.PLACONTA, D.NODOCUMENTO');
   //AL_16
   // Alterado por Arnaldo V. Scarin em 25/01/2010
   // SOL: 129555 - Alteração da Disponibilidade Financeira
   // Troca da Tabela RateioDocum por View VW_RATEIODOCUM
   //'               PESSOA P, DOCUMENTO D, LANCTODOCUM L, TIPOALTERADOR T, RATEIODOCUM R, LANCIRRF N');
   lstSql.Add('            FROM PESSOA P, DOCUMENTO D, LANCTODOCUM L, TIPOALTERADOR T, VW_RATEIODOCUM R, LANCIRRF N');
   lstSql.Add('            WHERE (L.DATALANCTO >= TO_DATE('''+DateToStr(dDataIniMesAnt)+''',''DD/MM/YYYY''))');
   lstSql.Add('              AND (L.DATALANCTO <= TO_DATE('''+DateToStr(dDataFimMesAnt)+''',''DD/MM/YYYY''))');
   lstSql.Add('              AND (L.OPERACAO      = ''4'')');
   lstSql.Add('              AND (D.IDPESSOA      = ' + IntToStr(iPessoa) + ')');
   lstSql.Add('              AND (D.RECPAG        = ''P'')');
   lstSql.Add('              AND (L.CODDOCINSS   IS NULL)');
   lstSql.Add('              AND (N.IDDOCINSS IS NULL)');
   lstSql.Add('              AND (NVL(N.VLRINSS,0) <> 0)');
   lstSql.Add('              AND (L.ESTORNO      IS NULL)');
   lstSql.Add('              AND (L.CODALTERADOR IN (SELECT CODALTERADOR FROM ALTXIMPOSTO WHERE CODIMPOSTO = 2))');
   lstSql.Add('              AND ((' + sPatro + ' IS NULL) OR (R.IDPATRO = ' + sPatro + '))');
   lstSql.Add('              AND ((' + sPlanoPrev + ' IS NULL) OR (R.IDPLANOPREV = ' + sPlanoPrev + '))');
   // Alterado por Arnaldo V. Scarin em 26/01/2010
   // SOL: 129555 - Alteração da Disponibilidade Financeira
   // Acerto do Filtro da Data de Vigência da View VW_RATEIODOCUM
   lstSql.Add('               AND (R.EXERCICIO = '+QuotedStr(FormatDateTime('YYYY',dDataRef))+')');
   lstSql.Add('               AND (1 = ' + FFlgDocBaixado + ')');
   lstSql.Add('               AND (D.CODDOCUMENTO  = L.CODDOCUMENTO)');
   lstSql.Add('               AND (P.IDPESSOA      = D.IDFORCLI)');
   lstSql.Add('               AND (L.CODALTERADOR  = T.CODALTERADOR)');
   lstSql.Add('               AND (D.CODDOCUMENTO = R.CODDOCUMENTO)');
   //AL_16
   lstSql.Add('               AND (D.CODDOCUMENTO  = N.CODDOCUMENTO(+))');
   lstSql.Add('           -- TAG SALDOANT_191_F');
   //AL_19
   lstSql.Add('            ) X');
   lstSql.Add('        WHERE  (1 = ' + IntToStr(iSaldoAntINSS) + ')');
   lstSql.Add('           AND ((' + sPatro + ' IS NULL) OR (R.IDPATRO = ' + sPatro + '))');
   lstSql.Add('           AND ((' + sPlanoPrev + ' IS NULL) OR (R.IDPLANOPREV = ' + sPlanoPrev + '))');
   lstSql.Add('           AND ((' + sFlgIndRecDes + ' IS NULL) OR (NVL(T.FLGINDICARECDES,''N'') = ' + sFlgIndRecDes + '))');
   lstSql.Add('           AND (D.CODDOCUMENTO = X.CODDOCUMENTO)');
   lstSql.Add('           AND (D.CODDOCUMENTO = L.CODDOCUMENTO)');
   lstSql.Add('           AND (D.CODDOCUMENTO = R.CODDOCUMENTO)');
   lstSql.Add('           AND (L.NUMLANCTO = X.NUMLANCTO)');
   lstSql.Add('           AND (R.CODTIPRECDES = T.CODTIPRECDES)');
   lstSql.Add('           AND (R.IDPESSOA = T.IDPESSOA)');
   lstSql.Add('           AND (R.RECPAG = T.RECPAG)');
   // Alterado por Arnaldo V. Scarin em 26/01/2010
   // SOL: 129555 - Alteração da Disponibilidade Financeira
   // Acerto do Filtro da Data de Vigência da View VW_RATEIODOCUM
   lstSql.Add('           AND (R.EXERCICIO = '+QuotedStr(FormatDateTime('YYYY',dDataRef))+')');
   lstSql.Add('        -- TAG SALDOANT_19_F');
   lstSql.Add('        UNION ALL');
   lstSql.Add('        -- (1.10) REGISTRO DE PAGAMENTOS ENGLOBADOS NAO BAIXADOS E MODULO <> INVESTIMENTOS');
   lstSql.Add('        -- TAG SALDOANT_110_I');
   lstSql.Add('        SELECT');
   lstSql.Add('           ''SALDO INICIAL'' AS NOMEFORCLI, SUM(A.SALDO) AS SALDO, A.IDPLANOPREV, A.IDPATRO, 0 AS IDFORCLI,');
   lstSql.Add('           0 AS CODDOCUMENTO, A.IDPESSOA, 0 AS CODTIPDOC, 0 AS IDMODULO, 0 AS NUMAPGR, 1 AS TIPOREG, '' '' AS NODOCUMENTO, '' '' AS HISTORICOCOMPL, '' '' AS CODTIPRECDES, '' '' AS CODCENTRORESPON, ''F'' AS RECPAG');
   lstSql.Add('        FROM');
   lstSql.Add('           (SELECT');
   lstSql.Add('               '' '' AS NOMEFORCLI, (SUM(((R.VALORRAT*S.SALDODOC)/abs(SS.SALDOTOT))))-((SUM(((R.VALORRAT*S.SALDODOC)/abs(SS.SALDOTOT))) * C.SALDOALT)/SS.SALDOTOT) AS SALDO,');
   lstSql.Add('               R.IDPLANOPREV, R.IDPATRO, D.IDFORCLI, D.CODDOCUMENTO, D.IDPESSOA, D.CODTIPDOC, D.IDMODULO, D.NUMAPGR, '' '' AS TIPOREG, DECODE(D.COMPLDOCUMENTO,NULL,TO_CHAR(D.NODOCUMENTO),(TO_CHAR(D.NODOCUMENTO)||''/''||D.COMPLDOCUMENTO)) AS NODOCUMENTO,');
   lstSql.Add('               L.HISTORICOCOMPL, R.CODTIPRECDES, R.CODCENTRORESPON, D.DATAPROGRAMADA, D.DATAVENCTO, L.DATALANCTO, R.RECPAG, D.NUMFATURA,  SS.SALDOTOT, C.SALDOALT');
   lstSql.Add('            FROM DOCUMENTO D, LANCTODOCUM L,');
   lstSql.Add('               (SELECT D.NUMFATURA, SUM(DECODE(L.DEBCRE,''D'',L.VALOR,L.VALOR*-1)) AS SALDOTOT');
   lstSql.Add('                FROM DOCUMENTO D, LANCTODOCUM L');
   lstSql.Add('                WHERE (D.OPERACAO IN (''1 ''))');
   lstSql.Add('                   AND (D.IDPESSOA = ' + IntToStr(iPessoa) + ')');
   lstSql.Add('                   AND (D.RECPAG = ''P'')');
   lstSql.Add('                   AND (D.NUMFATURA IS NOT NULL)');
   lstSql.Add('                   AND (D.OPERACAO = L.OPERACAO)');
   lstSql.Add('                   AND (D.CODDOCUMENTO = L.CODDOCUMENTO)');
   lstSql.Add('                GROUP BY D.NUMFATURA) SS,');
   lstSql.Add('               (SELECT D.CODDOCUMENTO, SUM(DECODE(L.DEBCRE,''D'',L.VALOR,L.VALOR*-1)) AS SALDODOC');
   lstSql.Add('                FROM DOCUMENTO D, LANCTODOCUM L');
   lstSql.Add('                WHERE (D.OPERACAO IN (''1 ''))');
   lstSql.Add('                   AND (D.IDPESSOA = ' + IntToStr(iPessoa) + ')');
   lstSql.Add('                   AND (D.RECPAG = ''P'')');
   lstSql.Add('                   AND (L.OPERACAO <> 5)');
   lstSql.Add('                   AND (D.CODDOCUMENTO = L.CODDOCUMENTO)');
   lstSql.Add('                GROUP BY D.CODDOCUMENTO) S,');
   lstSql.Add('               (SELECT D.NUMFATURA, R.CODTIPRECDES, R.IDPLANOPREV, R.IDPATRO, R.IDPESSOA, R.RECPAG, SUM(R.VALOR) AS VALORRAT,R.CODCENTRORESPON');
   // Alterado por Arnaldo V. Scarin em 25/01/2010
   // SOL: 129555 - Alteração da Disponibilidade Financeira
   // Troca da Tabela RateioDocum por View VW_RATEIODOCUM
   //'                FROM DOCUMENTO D, RATEIODOCUM R, TIPORECEBDESEMB T');
   lstSql.Add('                FROM DOCUMENTO D, VW_RATEIODOCUM R, TIPORECEBDESEMB T');
   lstSql.Add('                WHERE  (D.OPERACAO IN (''1 ''))');
   lstSql.Add('                   AND (D.IDPESSOA = ' + IntToStr(iPessoa) + ')');
   lstSql.Add('                   AND (D.RECPAG = ''P'')');
   lstSql.Add('                   AND (D.NUMFATURA IS NOT NULL)');
   lstSql.Add('                   AND (D.CODDOCUMENTO = R.CODDOCUMENTO)');
   lstSql.Add('                   AND ((' + sFlgIndRecDes + ' IS NULL) OR (NVL(T.FLGINDICARECDES,''N'') = ' + sFlgIndRecDes + '))');
   lstSql.Add('                   AND (R.CODTIPRECDES = T.CODTIPRECDES)');
   lstSql.Add('                   AND (R.IDPESSOA = T.IDPESSOA)');
   lstSql.Add('                   AND (R.RECPAG = T.RECPAG)');
   // Alterado por Arnaldo V. Scarin em 26/01/2010
   // SOL: 129555 - Alteração da Disponibilidade Financeira
   // Acerto do Filtro da Data de Vigência da View VW_RATEIODOCUM
   lstSql.Add('                   AND (R.EXERCICIO = '+QuotedStr(FormatDateTime('YYYY',dDataRef))+')');
   lstSql.Add('                GROUP BY R.CODTIPRECDES, R.IDPLANOPREV, R.IDPATRO, R.IDPESSOA, R.RECPAG, D.NUMFATURA,R.CODCENTRORESPON) R,');
   lstSql.Add('            (SELECT D.NUMFATURA, (SUM(DECODE(L.DEBCRE,''D'',L.VALOR,L.VALOR*-1))* -1) AS SALDOALT');
   lstSql.Add('             FROM DOCUMENTO D, LANCTODOCUM L');
   lstSql.Add('             WHERE (D.OPERACAO IN (''3 ''))');
   lstSql.Add('                AND (D.IDPESSOA = ' + IntToStr(iPessoa) + ')');
   lstSql.Add('                AND (D.RECPAG = ''P'')');
   lstSql.Add('                AND (L.OPERACAO NOT IN (''5 '',''3 ''))');
   lstSql.Add('                AND (D.CODDOCUMENTO = L.CODDOCUMENTO)');
   lstSql.Add('             GROUP BY D.NUMFATURA) C,');
   lstSql.Add('               (SELECT D.NUMFATURA, D.DATAPROGRAMADA, DECODE(D.COMPLDOCUMENTO,NULL,TO_CHAR(D.NODOCUMENTO),(TO_CHAR(D.NODOCUMENTO)||''/''||D.COMPLDOCUMENTO)) AS NODOCUMENTO');
   lstSql.Add('                FROM DOCUMENTO D');
   lstSql.Add('                WHERE (D.OPERACAO IN (''3 ''))');
   lstSql.Add('                   AND (D.IDPESSOA = ' + IntToStr(iPessoa) + ')');
   lstSql.Add('                   AND (D.RECPAG = ''P'')');
   lstSql.Add('                   AND (D.NUMFATURA IS NOT NULL)) X');
   lstSql.Add('            WHERE  (X.DATAPROGRAMADA > TO_DATE('''+DateToStr(dDataSaldoAnt)+''',''DD/MM/YYYY''))');
   lstSql.Add('               AND (X.DATAPROGRAMADA < TO_DATE('''+DateToStr(dDataRef)+''',''DD/MM/YYYY''))');
   lstSql.Add('               AND (D.RECPAG = ''P'')');
   lstSql.Add('               AND (NVL(SS.SALDOTOT,0) <> 0 )');
   lstSql.Add('               AND (D.STATUS <> ''2'')');
   lstSql.Add('               AND (D.OPERACAO IN (''1 ''))');
   lstSql.Add('               AND (L.OPERACAO <> 5)');
   lstSql.Add('               AND NOT Exists (Select 1 From DocumxDocum dxd');
   lstSql.Add('                               where dxd.iddocumento = d.coddocumento');
   lstSql.Add('                                 and dxd.flgdispfinanc = ''S'')');
   lstSql.Add('               AND (D.IDMODULO <> 79)');
   lstSql.Add('               AND (D.IDPESSOA = ' + IntToStr(iPessoa) + ')');
   lstSql.Add('               AND (1 = ' + FFlgDocBaixado + ')');
   lstSql.Add('               AND ((' + sPatro + ' IS NULL) OR (R.IDPATRO = ' + sPatro + '))');
   lstSql.Add('               AND ((' + sPlanoPrev + ' IS NULL) OR (R.IDPLANOPREV = ' + sPlanoPrev + '))');
   lstSql.Add('               AND (D.CODDOCUMENTO NOT IN (SELECT DISTINCT CODDOCUMENTO FROM LOTEXDOCUM))');
   lstSql.Add('               AND (D.CODDOCUMENTO = L.CODDOCUMENTO)');
   lstSql.Add('               AND (D.OPERACAO = L.OPERACAO)');
   lstSql.Add('               AND (D.NUMFATURA = R.NUMFATURA)');
   lstSql.Add('               AND (D.CODDOCUMENTO = S.CODDOCUMENTO)');
   lstSql.Add('               AND (D.NUMFATURA = SS.NUMFATURA)');
   lstSql.Add('               AND (D.NUMFATURA = C.NUMFATURA(+))');
   lstSql.Add('               AND (D.NUMFATURA = X.NUMFATURA)');
   lstSql.Add('            GROUP BY D.IDFORCLI, D.DATAVENCTO, D.COMPLDOCUMENTO, D.NODOCUMENTO, D.DATAPROGRAMADA,');
   lstSql.Add('                    L.HISTORICOCOMPL, L.DATALANCTO, R.CODTIPRECDES, R.IDPLANOPREV, R.IDPATRO,');
   lstSql.Add('                    R.RECPAG, D.IDPESSOA, D.OPERACAO, D.CODTIPDOC, D.IDMODULO, D.CODDOCUMENTO,');
   lstSql.Add('                    R.CODCENTRORESPON, D.NUMAPGR, D.NUMFATURA, SS.SALDOTOT, C.SALDOALT) A,');
   lstSql.Add('           (SELECT D.CODDOCUMENTO, D.NUMFATURA, D.DATAPROGRAMADA,  DECODE(D.COMPLDOCUMENTO,NULL,TO_CHAR(D.NODOCUMENTO),(TO_CHAR(D.NODOCUMENTO)||''/''||D.COMPLDOCUMENTO)) AS NODOCUMENTO, L.HISTORICOCOMPL');
   lstSql.Add('            FROM DOCUMENTO D, LANCTODOCUM L');
   lstSql.Add('            WHERE (D.OPERACAO IN (''3 ''))');
   lstSql.Add('               AND (D.IDPESSOA = ' + IntToStr(iPessoa) + ')');
   lstSql.Add('               AND (D.RECPAG = ''P'')');
   lstSql.Add('               AND (D.NUMFATURA IS NOT NULL)');
   lstSql.Add('               AND (L.OPERACAO = 3 )');
   lstSql.Add('               AND (D.CODDOCUMENTO = L.CODDOCUMENTO)');
   lstSql.Add('            UNION');
   lstSql.Add('            SELECT D.CODDOCUMENTO, D.NUMFATURA, D.DATAPROGRAMADA,  DECODE(D.COMPLDOCUMENTO,NULL,TO_CHAR(D.NODOCUMENTO),(TO_CHAR(D.NODOCUMENTO)||''/''||D.COMPLDOCUMENTO)) AS NODOCUMENTO, L.HISTORICOCOMPL');
   lstSql.Add('            FROM DOCUMENTO D, LANCTODOCUM L');
   lstSql.Add('            WHERE (D.OPERACAO IN (''3 ''))');
   lstSql.Add('               AND (D.IDPESSOA = ' + IntToStr(iPessoa) + ')');
   lstSql.Add('               AND (D.RECPAG = ''P'')');
   lstSql.Add('               AND (D.NUMFATURA IS NOT NULL)');
   lstSql.Add('               AND (L.OPERACAO = 5)');
   lstSql.Add('               AND (L.ESTORNO IS NULL)');
   lstSql.Add('               AND (D.CODDOCUMENTO = L.CODDOCUMENTO)) B');
   lstSql.Add('        WHERE A.NUMFATURA=B.NUMFATURA(+)');
   lstSql.Add('          AND (B.CODDOCUMENTO NOT IN (SELECT DISTINCT CODDOCUMENTO FROM LOTEXDOCUM))');
   lstSql.Add('          AND (B.CODDOCUMENTO NOT IN (SELECT DISTINCT CODDOCUMENTO FROM RECBTOPAGTO))');
   lstSql.Add('        GROUP BY A.NOMEFORCLI, A.IDPLANOPREV, A.IDPATRO, A.IDFORCLI, A.IDPESSOA, A.CODTIPDOC,');
   lstSql.Add('            A.IDMODULO, A.NUMAPGR, A.TIPOREG, B.NODOCUMENTO, B.HISTORICOCOMPL, A.CODTIPRECDES, A.CODCENTRORESPON, A.RECPAG');
   lstSql.Add('        -- TAG SALDOANT_110_F');
   lstSql.Add('      UNION ALL');
   lstSql.Add('        -- (1.11) REGISTROS DE IRRF QUE NAO ESTAO EM DARF GERADO DA SEMANA ANTERIOR');
   lstSql.Add('        -- TAG SALDOANT_111_I');
   lstSql.Add('        SELECT DISTINCT');
   lstSql.Add('           ''SALDO INICIAL'' AS NOMEFORCLI, (S.VALOR*-1) AS SALDO, R.IDPLANOPREV, R.IDPATRO, D.IDFORCLI,');
   lstSql.Add('           D.CODDOCUMENTO, D.IDPESSOA, D.CODTIPDOC, D.IDMODULO, 0 AS NUMAPGR, 1 AS TIPOREG, '' '' AS NODOCUMENTO, '' '' AS HISTORICOCOMPL, '' '' AS CODTIPRECDES, '' '' AS CODCENTRORESPON, ''F'' AS RECPAG');
   lstSql.Add('        FROM');
   // Alterado por Arnaldo V. Scarin em 25/01/2010
   // SOL: 129555 - Alteração da Disponibilidade Financeira
   // Troca da Tabela RateioDocum por View VW_RATEIODOCUM
   //'           DOCUMENTO D, LANCIRRF I, LANCTODOCUM L, RATEIODOCUM R, TIPORECEBDESEMB T,');
   lstSql.Add('           DOCUMENTO D, LANCIRRF I, LANCTODOCUM L, VW_RATEIODOCUM R, TIPORECEBDESEMB T,');
   lstSql.Add('           (SELECT CODALTERADOR FROM ALTXIMPOSTO WHERE CODIMPOSTO=1) X,');
   lstSql.Add('           (SELECT L.CODDOCUMENTO,L.CODALTERADOR,L.VALOR,L.NUMLANCTO');
   lstSql.Add('            FROM  LANCTODOCUM L, DOCUMENTO D');
   lstSql.Add('            WHERE  (D.DATAVENCTO BETWEEN TO_DATE('''+DateToStr(dDataIniIRRF)+''',''DD/MM/YYYY'') AND TO_DATE('''+DateToStr(dDataFimIRRF)+''',''DD/MM/YYYY''))');
   lstSql.Add('               AND (CODALTERADOR IN (SELECT CODALTERADOR FROM ALTXIMPOSTO WHERE CODIMPOSTO = 1))');
   lstSql.Add('               AND (L.CODDOCUMENTO=D.CODDOCUMENTO)) S');
   lstSql.Add('        WHERE (I.IDDARF IS NULL)');
   lstSql.Add('           AND (VLRIRRF <> 0)');
   lstSql.Add('           AND (L.CODALTERADOR IN X.CODALTERADOR)');
   lstSql.Add('           AND (D.RECPAG = ''P'')');
   lstSql.Add('           AND (D.IDPESSOA = ' + IntToStr(iPessoa) + ')');
   lstSql.Add('           AND (L.OPERACAO <> 5)');
   lstSql.Add('           AND (D.STATUS = 2)');
   lstSql.Add('           AND (1 = ' + IntToStr(iSaldoAntIRRF) + ')');
   lstSql.Add('           AND (1 = ' + FFlgDocBaixado + ')');
   lstSql.Add('           AND ((' + sPatro + ' IS NULL) OR (R.IDPATRO = ' + sPatro + '))');
   lstSql.Add('           AND ((' + sPlanoPrev + ' IS NULL) OR (R.IDPLANOPREV = ' + sPlanoPrev + '))');
   // Alterado por Arnaldo V. Scarin em 26/01/2010
   // SOL: 129555 - Alteração da Disponibilidade Financeira
   // Acerto do Filtro da Data de Vigência da View VW_RATEIODOCUM
   lstSql.Add('           AND (R.EXERCICIO = '+QuotedStr(FormatDateTime('YYYY',dDataRef))+')');
   lstSql.Add('           AND ((' + sFlgIndRecDes + ' IS NULL) OR (NVL(T.FLGINDICARECDES,''N'') = ' + sFlgIndRecDes + '))');
   lstSql.Add('           AND (D.CODDOCUMENTO = S.CODDOCUMENTO)');
   lstSql.Add('           AND (D.CODDOCUMENTO = L.CODDOCUMENTO)');
   lstSql.Add('           AND (D.CODDOCUMENTO = R.CODDOCUMENTO)');
   lstSql.Add('           AND (D.CODDOCUMENTO = I.CODDOCUMENTO(+))');
   lstSql.Add('           AND (R.CODTIPRECDES = T.CODTIPRECDES)');
   lstSql.Add('           AND (R.IDPESSOA = T.IDPESSOA)');
   lstSql.Add('           AND (R.RECPAG = T.RECPAG)');
   lstSql.Add('        -- TAG SALDOANT_111_F');
   lstSql.Add('        UNION ALL');
   lstSql.Add('        -- (1.12) REGISTRO ZERADOS PARA SAIREM OS PLANOS/PATROS SEM MOVIMENTO QUANDO HOUVER');
   lstSql.Add('        -- TAG SALDOANT_112_I');
   lstSql.Add('        SELECT');
   lstSql.Add('           ''SALDO INICIAL'' AS NOMEFORCLI, 0 AS SALDO, PA.IDPLANOPREV, PA.IDPATRO, 0 AS IDFORCLI, 0 AS CODDOCUMENTO,');
   lstSql.Add('           (' + IntToStr(iPessoa) + ') AS IDPESSOA,  0 AS CODTIPDOC, 0 AS IDMODULO, 0 AS NUMAPGR, 1 AS TIPOREG, '' '' AS NODOCUMENTO, '' '' AS HISTORICOCOMPL, '' '' AS CODTIPRECDES, '' '' AS CODCENTRORESPON, ''F'' AS RECPAG');
   lstSql.Add('        FROM PESSOA PE, PLANPREVCONTABPATRO PA, PLANPREVCONTABIL PL');
   lstSql.Add('        WHERE ((' + sPatro + ' IS NULL) OR (PA.IDPATRO = ' + sPatro + '))');
   lstSql.Add('           AND ((' + sPlanoPrev + ' IS NULL) OR (PA.IDPLANOPREV = ' + sPlanoPrev + '))');
   lstSql.Add('           AND (PA.IDPATRO = PE.IDPESSOA(+))');
   lstSql.Add('           AND (PA.IDPLANOPREV = PL.IDPLANOPREV) ');
   //Marilza Colpani - SOL: 122335/Kintana: 598524 - início
   if sAtivPlano <> '' then
     lstSql.Add('           AND (PL.ATIVO = '+ quotedstr (sAtivPlano) + ')');
   //Marilza Colpani - SOL: 122335/Kintana: 598524 - início
   lstSql.Add('        -- TAG SALDOANT_112_F ');
   // Alterado por Arnaldo V. Scarin em 20/01/2010
   // SOL: KTN:
   lstSql.Add('        UNION ALL');
   // Alterado por Arnaldo V. Scarin em 25/01/2010
   // SOL: 129555 - Alteração da Disponibilidade Financeira
   // Troca da Tabela RateioDocum por View VW_RATEIODOCUM
   lstSql.Add('        -- (1.13) SALDO ANTERIOR - REGISTROS DE RECEBIMENTO E MODULO DE INVESTIMENTOS');
   lstSql.Add('        -- TAG SALDOANT_113_I');
   lstSql.Add('        SELECT A.NOMEFORCLI,A.SALDO,A.IDPLANOPREV,A.IDPATRO,A.IDFORCLI,A.CODDOCUMENTO,');
   lstSql.Add('               A.IDPESSOA,A.CODTIPDOC,A.IDMODULO,A.NUMAPGR,A.TIPOREG,');
   lstSql.Add('               A.NODOCUMENTO,LD.HISTORICOCOMPL,A.CODTIPRECDES,A.CODCENTRORESPON,A.RECPAG');
   lstSql.Add('          FROM (SELECT ''SALDO INICIAL'' AS NOMEFORCLI,');
   lstSql.Add('                       SUM(DECODE(L.DEBCRE, ''D'', L.VALOR, L.VALOR * -1) -');
   lstSql.Add('                           (DECODE(P.VALOR, NULL, 0, P.VALOR))) AS SALDO,');
   lstSql.Add('                       R.IDPLANOPREV,R.IDPATRO,D.IDFORCLI,D.CODDOCUMENTO,');
   lstSql.Add('                       D.IDPESSOA,D.CODTIPDOC,D.IDMODULO,0 AS NUMAPGR,1 AS TIPOREG,');
   lstSql.Add('                       DECODE(D.COMPLDOCUMENTO,');
   lstSql.Add('                              NULL,');
   lstSql.Add('                              TO_CHAR(D.NODOCUMENTO),');
   lstSql.Add('                              (TO_CHAR(D.NODOCUMENTO) || ''/'' || D.COMPLDOCUMENTO)) AS NODOCUMENTO,');
   lstSql.Add('                       '' '' AS HISTORICOCOMPL,R.CODTIPRECDES,'' '' AS CODCENTRORESPON,D.RECPAG');
   lstSql.Add('                  FROM DOCUMENTO D');
   lstSql.Add('                  Join LANCTODOCUM L ON (D.CODDOCUMENTO = L.CODDOCUMENTO)');
   lstSql.Add('                  Join (with R1 AS (Select R2.IDPATRO,R2.IDPLANOPREV,R2.CODTIPRECDES,R2.coddocumento');
   lstSql.Add('                                    FROM VW_RATEIODOCUM R2');
   lstSql.Add('                                    WHERE (R2.EXERCICIO = '+QuotedStr(FormatDateTime('YYYY',dDataRef))+'))');
   lstSql.Add('                         SELECT R1.IDPATRO,R1.IDPLANOPREV,R1.CODTIPRECDES,D1.CODDOCUMENTO');
   lstSql.Add('                           FROM R1');
   lstSql.Add('                         Join DOCUMENTO D1 on R1.CodDocumento = d1.coddocumento');
   lstSql.Add('                        WHERE (D1.DATADISPONIB > TO_DATE('''+DateToStr(dDataSaldoAnt)+''',''DD/MM/YYYY''))');
   lstSql.Add('                          AND (D1.DATADISPONIB < TO_DATE('''+DateToStr(dDataRef)+''',''DD/MM/YYYY''))');
   lstSql.Add('                          AND (D1.IDPESSOA = 1)');
   lstSql.Add('                          AND (D1.OPERACAO IN (''2 ''))');
   lstSql.Add('                          AND (D1.RECPAG = ''R'')');
   lstSql.Add('                          AND ((' + sPatro + ' IS NULL) OR (R1.IDPATRO = ' + sPatro + '))');
   lstSql.Add('                          AND ((' + sPlanoPrev + ' IS NULL) OR (R1.IDPLANOPREV = ' + sPlanoPrev + '))');
   lstSql.Add('                  ) R On D.CODDOCUMENTO =  R.CODDOCUMENTO');
   lstSql.Add('                  Left Outer Join (SELECT LA.CODDOCUMENTO,');
   lstSql.Add('                                         DECODE(LA.DEBCRE,');
   lstSql.Add('                                                ''C'',');
   lstSql.Add('                                                LA.VALOR,');
   lstSql.Add('                                                LA.VALOR * -1) AS VALOR');
   lstSql.Add('                                    FROM RECBTOPAGTO RE');
   lstSql.Add('                                    Join LANCTODOCUM LA ON LA.NUMLANCTO =');
   lstSql.Add('                                                           RE.NUMLANCTO');
   lstSql.Add('                                   WHERE RE.CODPORTFORMA IN');
   lstSql.Add('                                         (SELECT CODPORTFORMA');
   lstSql.Add('                                            FROM PORTADORFORMA');
   lstSql.Add('                                           WHERE LANCAFINANC = ''N'')');
   lstSql.Add('                                     AND LA.DEBCRE = ''D'') P On (D.CODDOCUMENTO =');
   lstSql.Add('                                                               p.CODDOCUMENTO)');
   lstSql.Add('                  Join DOCUMXDOCUM DXD On (D.CODDOCUMENTO = DXD.IDDOCUMENTO)');
   lstSql.Add('                 WHERE (D.DATADISPONIB > TO_DATE('''+DateToStr(dDataSaldoAnt)+''',''DD/MM/YYYY''))');
   lstSql.Add('                   AND (D.DATADISPONIB < TO_DATE('''+DateToStr(dDataRef)+''',''DD/MM/YYYY''))');
   lstSql.Add('                   AND (D.IDPESSOA = 1)');
   lstSql.Add('                   AND (NVL(L.VALOR, 0) <> 0)');
   lstSql.Add('                   AND (D.OPERACAO IN (''2 ''))');
   lstSql.Add('                   AND (L.OPERACAO <> 5)');
   lstSql.Add('                   AND (D.RECPAG = ''R'')');
   lstSql.Add('                   AND (DXD.FLGDISPFINANC = ''S'')');
   lstSql.Add('                   -- Arnaldo V. Scarin - 09/02/2010');
   lstSql.Add('                AND NOT EXISTS (SELECT 1 FROM LANCTODOCUM');
   lstSql.Add('                                WHERE OPERACAO = ''5''');
   lstSql.Add('                                  AND CODDOCUMENTO = D.CODDOCUMENTO)');
   lstSql.Add('                -- Arnaldo V. Scarin - 09/02/2010');
   lstSql.Add('                   AND ((' + sPatro + ' IS NULL) OR (R.IDPATRO = ' + sPatro + '))');
   lstSql.Add('                   AND ((' + sPlanoPrev + ' IS NULL) OR (R.IDPLANOPREV = ' + sPlanoPrev + '))');
   lstSql.Add('                 GROUP BY D.IDFORCLI,D.DATAVENCTO,D.COMPLDOCUMENTO,D.NODOCUMENTO,');
   lstSql.Add('                          D.DATAPROGRAMADA,L.DATALANCTO,R.CODTIPRECDES,');
   lstSql.Add('                          R.IDPLANOPREV,R.IDPATRO,D.RECPAG,D.IDPESSOA,');
   lstSql.Add('                          D.OPERACAO,D.CODTIPDOC,D.IDMODULO,D.CODDOCUMENTO');
   lstSql.Add('                HAVING SUM(NVL(L.VALOR, 0) - (DECODE(P.VALOR, NULL, 0, P.VALOR))) <> 0) A');
   lstSql.Add('          Join LANCTODOCUM LD on (A.CODDOCUMENTO = LD.CODDOCUMENTO)');
   lstSql.Add('         where LD.OPERACAO NOT IN (''4 '', ''5 '')');
   lstSql.Add('        -- TAG SALDOANT_113_F');
   lstSql.Add('        UNION ALL');
   lstSql.Add('        -- (1.14) SALDO ANTERIOR - REGISTROS DE PAGAMENTO E MODULO DE INVESTIMENTOS');
   lstSql.Add('        -- TAG SALDOANT_114_I');
   lstSql.Add('         SELECT A.NOMEFORCLI, A.SALDO, A.IDPLANOPREV, A.IDPATRO, A.IDFORCLI, A.CODDOCUMENTO, A.IDPESSOA, A.CODTIPDOC, A.IDMODULO, A.NUMAPGR, A.TIPOREG, A.NODOCUMENTO, L.HISTORICOCOMPL, A.CODTIPRECDES, A.CODCENTRORESPON, A.RECPAG');
   lstSql.Add('         FROM (SELECT');
   lstSql.Add('                ''SALDO INICIAL'' AS NOMEFORCLI, SUM(DECODE(L.DEBCRE,''D'',L.VALOR,L.VALOR * -1)-(DECODE(P.VALOR,NULL,0,P.VALOR))) AS SALDO,');
   lstSql.Add(                 'R.IDPLANOPREV, R.IDPATRO, D.IDFORCLI, D.CODDOCUMENTO, D.IDPESSOA, D.CODTIPDOC, D.IDMODULO, 0 AS NUMAPGR, 1 AS TIPOREG,');
   lstSql.Add(                 'DECODE(D.COMPLDOCUMENTO,NULL,TO_CHAR(D.NODOCUMENTO),(TO_CHAR(D.NODOCUMENTO)||''/''||D.COMPLDOCUMENTO)) AS NODOCUMENTO, '' '' AS HISTORICOCOMPL, R.CODTIPRECDES, '' '' AS CODCENTRORESPON, D.RECPAG');
   lstSql.Add('             FROM DOCUMENTO D,LANCTODOCUM L,');
   lstSql.Add('                (SELECT DISTINCT R1.IDPATRO,R1.IDPLANOPREV,R1.CODTIPRECDES, D1.CODDOCUMENTO');
   // Alterado por Arnaldo V. Scarin em 25/01/2010
   // SOL: 129555 - Alteração da Disponibilidade Financeira
   // Troca da Tabela RateioDocum por View VW_RATEIODOCUM
   //'                 FROM RATEIODOCUM R1, DOCUMENTO D1');
   lstSql.Add('                 FROM VW_RATEIODOCUM R1, DOCUMENTO D1');
   lstSql.Add('                 WHERE (D1.DATADISPONIB > TO_DATE('''+DateToStr(dDataSaldoAnt)+''',''DD/MM/YYYY''))');
   lstSql.Add('                    AND (D1.DATADISPONIB < TO_DATE('''+DateToStr(dDataRef)+''',''DD/MM/YYYY''))');
   lstSql.Add('                    AND (D1.IDPESSOA = 1)');
   lstSql.Add('                    AND (D1.OPERACAO IN (''2 ''))');
   lstSql.Add('                    AND (D1.RECPAG = ''P'')');
   lstSql.Add('                    AND ((' + sPatro + ' IS NULL) OR (R1.IDPATRO = ' + sPatro + '))');
   lstSql.Add('                    AND ((' + sPlanoPrev + ' IS NULL) OR (R1.IDPLANOPREV = ' + sPlanoPrev + '))');
   // Alterado por Arnaldo V. Scarin em 26/01/2010
   // SOL: 129555 - Alteração da Disponibilidade Financeira
   // Acerto do Filtro da Data de Vigência da View VW_RATEIODOCUM
   lstSql.Add('                    AND (R1.EXERCICIO = '+QuotedStr(FormatDateTime('YYYY',dDataRef))+')');
   lstSql.Add('                    AND (D1.CODDOCUMENTO = R1.CODDOCUMENTO)) R,');
   lstSql.Add('                (SELECT LA.CODDOCUMENTO, DECODE(LA.DEBCRE,''C'',LA.VALOR,LA.VALOR * -1) AS VALOR');
   lstSql.Add('                 FROM RECBTOPAGTO RE, LANCTODOCUM LA');
   lstSql.Add('                 WHERE  RE.CODPORTFORMA IN (SELECT CODPORTFORMA FROM PORTADORFORMA WHERE LANCAFINANC = ''N'')');
   lstSql.Add('                    AND LA.DEBCRE = ''D''');
   lstSql.Add('                    AND LA.NUMLANCTO = RE.NUMLANCTO) P,');
   lstSql.Add('                --bruno bastos - 26/11/2009');
   lstSql.Add('                DOCUMXDOCUM DXD');
   lstSql.Add('             WHERE  (D.DATADISPONIB > TO_DATE('''+DateToStr(dDataSaldoAnt)+''',''DD/MM/YYYY''))');
   lstSql.Add('                AND (D.DATADISPONIB < TO_DATE('''+DateToStr(dDataRef)+''',''DD/MM/YYYY''))');
   lstSql.Add('                AND (D.IDPESSOA = 1)');
   lstSql.Add('                --bruno bastos - 26/11/2009');
   lstSql.Add('                AND (D.CODDOCUMENTO = DXD.IDDOCUMENTO)');
   lstSql.Add('                AND (DXD.FLGDISPFINANC = ''S'')');
   lstSql.Add('                AND (NVL(L.VALOR,0) <> 0)');
   lstSql.Add('                AND (D.OPERACAO IN (''2 ''))');
   lstSql.Add('                AND (L.OPERACAO <> 5)');
   lstSql.Add('                AND (D.RECPAG = ''P'')');
   lstSql.Add('                AND NOT Exists (Select 1 From DocumxDocum dxd');
   lstSql.Add('                                where dxd.iddocumento = d.coddocumento');
   lstSql.Add('                                  and dxd.flgdispfinanc = ''S'')');
   lstSql.Add('                --AND (D.IDMODULO  = 79)');
   lstSql.Add('                AND ((' + sPatro + ' IS NULL) OR (R.IDPATRO = ' + sPatro + '))');
   lstSql.Add('                AND ((' + sPlanoPrev + ' IS NULL) OR (R.IDPLANOPREV = ' + sPlanoPrev + '))');
   lstSql.Add('                AND (D.CODDOCUMENTO = L.CODDOCUMENTO)');
   lstSql.Add('                AND (D.CODDOCUMENTO = R.CODDOCUMENTO)');
   lstSql.Add('                AND (D.CODDOCUMENTO = P.CODDOCUMENTO(+))');
   lstSql.Add('             GROUP BY D.IDFORCLI,D.DATAVENCTO,D.COMPLDOCUMENTO,D.NODOCUMENTO,');
   lstSql.Add('                      D.DATAPROGRAMADA,L.DATALANCTO,R.CODTIPRECDES,');
   lstSql.Add('                      R.IDPLANOPREV,R.IDPATRO,D.RECPAG,D.IDPESSOA,D.OPERACAO,');
   lstSql.Add('                      D.CODTIPDOC,D.IDMODULO,D.CODDOCUMENTO');
   lstSql.Add('             HAVING SUM(NVL(L.VALOR,0)-(DECODE(P.VALOR,NULL,0,P.VALOR))) <> 0) A,');
   lstSql.Add('             LANCTODOCUM L');
   lstSql.Add('         WHERE A.CODDOCUMENTO = L.CODDOCUMENTO');
   lstSql.Add('            AND L.OPERACAO NOT IN (''4 '',''5 '')');
   lstSql.Add('        -- TAG SALDOANT_114_F');
   lstSql.Add('        --Bruno Bastos - 26/11/2009 - Fim');
   lstSql.Add('      )');
   if sGrupo = 'Plano/Patro' then
     lstSql.Add('   GROUP BY IDPLANOPREV, IDPATRO, IDPESSOA ')
   else if sGrupo = 'Plano' then
     lstSql.Add('   GROUP BY IDPLANOPREV, IDPESSOA ')
   else if sGrupo = 'Patro' then
     lstSql.Add('   GROUP BY IDPATRO, IDPESSOA ');
   lstSql.Add('    -- TAG SALDOANT_10_F');
   lstSql.Add('    UNION ALL');
   lstSql.Add('    -- (2.0) REGISTRO NA DATAREF');
   lstSql.Add('    -- TAG REGNADATA_20_I');
   lstSql.Add('    SELECT');
   lstSql.Add('       DECODE(U.IDFORCLI,-1,U.NODOCUMENTO,P.RAZAOSOCIAL) AS NOMEFORCLI, (SUM(DECODE(SIGN(U.SALDO),-1,U.SALDO,0)) + SUM(DECODE(SIGN(U.SALDO),1,U.SALDO,0))) AS SALDO, U.NODOCUMENTO, U.NUMAPGR, ');
   if sGrupo = 'Plano/Patro' then
     lstSql.Add(' U.IDPLANOPREV, U.IDPATRO, ')
   else if sGrupo = 'Plano' then
     lstSql.Add(' U.IDPLANOPREV, '' '' AS IDPATRO, ')
   else if sGrupo = 'Patro' then
     lstSql.Add(' '' '' AS IDPLANOPREV, U.IDPATRO, ');
   lstSql.Add('       DECODE(U.IDMODULO,79,2,3) AS TIPOREG, U.CODCENTRORESPON, U.IDPESSOA, U.NUMLOTE, U.CODLANCFINANC');
   lstSql.Add('    FROM PESSOA P, PESSOA PT, TIPORECEBDESEMB T, PLANPREVCONTABIL PP,');
   lstSql.Add('       TIPODOCRECPAG TD, MODULO M,');
   lstSql.Add('       (');
   lstSql.Add('        (');
   lstSql.Add('         -- (2.1) REGISTROS  BAIXADOS NA DATAREF <> DE INVESTIMENTOS');
   lstSql.Add('         -- TAG REGNADATA_21_I');
   lstSql.Add('         SELECT');
   lstSql.Add('            '' '' AS NOMEFORCLI, DECODE(R.RECPAG,''R'',R.VALOR,R.VALOR*-1) AS SALDO, R.IDPLANOPREV, R.IDPATRO, -1 AS IDFORCLI, 0 AS CODDOCUMENTO,');
   lstSql.Add('            M.IDPESSOA, 0 AS CODTIPDOC, 0 AS IDMODULO, 0 AS NUMAPGR, '' '' AS TIPOREG, M.HISTORICO||'' / ''||TO_CHAR(M.CODLANCFINANC,''9999999999'') AS NODOCUMENTO,');
   lstSql.Add('            '' '' AS HISTORICOCOMPL, R.CODTIPRECDES, R.CODCENTRORESPON, ''F'' AS RECPAG, RC.NUMLOTE, RC.CODLANCFINANC');
   lstSql.Add('         FROM MOVIMFINANC M, RATEIOFINANC R, TIPORECEBDESEMB T,');
   lstSql.Add('            (SELECT DISTINCT CODLANCFINANC, NUMLOTE FROM RECBTOPAGTO) RC');
   lstSql.Add('         WHERE (M.DATADISPFINANC = TO_DATE('''+DateToStr(dDataRef)+''',''DD/MM/YYYY''))');
   lstSql.Add('            AND (M.STATUSCONCILIA <> ''C'')');
   lstSql.Add('            AND (M.VALORLANCFINAN <> 0)');
   lstSql.Add('            AND (DECODE(R.RECPAG,''R'',R.VALOR,R.VALOR*-1))<>0');
   lstSql.Add('            AND ((M.CODLANCTRANSF IS NULL) OR (M.CODLANCTRANSF = 0))');
   lstSql.Add('            AND (M.IDPESSOA   = ' + IntToStr(iPessoa) + ')');
   lstSql.Add('            AND ( NOT EXISTS (SELECT * FROM MOVIMFINANC M1, RECBTOPAGTO R1, DOCUMENTO D1');
   lstSql.Add('                              WHERE');
   lstSql.Add('                                 (((M1.DATALANCFINAN = TO_DATE('''+DateToStr(dDataRef)+''',''DD/MM/YYYY'')) AND (M1.DATADISPFINANC IS NULL)) OR');
   lstSql.Add('                                  ((M1.DATALANCFINAN = TO_DATE('''+DateToStr(dDataRef)+''',''DD/MM/YYYY'')) AND (M1.DATADISPFINANC = TO_DATE('''+DateToStr(dDataRef)+''',''DD/MM/YYYY''))) OR');
   lstSql.Add('                                  ((M1.DATADISPFINANC = TO_DATE('''+DateToStr(dDataRef)+''',''DD/MM/YYYY''))))');
   lstSql.Add('                                 AND (D1.IDMODULO = 79)');
   lstSql.Add('                                 AND ((M1.CODLANCTRANSF IS NULL) OR (M1.CODLANCTRANSF = 0))');
   lstSql.Add('                                 AND (M1.STATUSCONCILIA <> ''C'')');
   lstSql.Add('                                 AND (M1.IDPESSOA = ' + IntToStr(iPessoa) + ')');
   lstSql.Add('                                 AND (R1.CODLANCFINANC(+) = M1.CODLANCFINANC)');
   lstSql.Add('                                 AND (D1.CODDOCUMENTO(+)   = R1.CODDOCUMENTO)');
   lstSql.Add('                                 AND (M1.CODLANCFINANC = M.CODLANCFINANC)))');
   lstSql.Add('            AND ((' + sPatro + ' IS NULL) OR (R.IDPATRO = ' + sPatro + '))');
   lstSql.Add('            AND ((' + sPlanoPrev + ' IS NULL) OR (R.IDPLANOPREV = ' + sPlanoPrev + '))');
   lstSql.Add('            AND ((' + sFlgIndRecDes + ' IS NULL) OR (NVL(T.FLGINDICARECDES,''N'') = ' + sFlgIndRecDes + '))');
   //AL_9
   //AL_10
   lstSql.Add('            AND (M.CODLANCFINANC  = R.CODLANCFINANC)');
   lstSql.Add('            AND (M.CODLANCFINANC  = RC.CODLANCFINANC(+))');
   lstSql.Add('            AND (R.CODTIPRECDES = T.CODTIPRECDES)');
   lstSql.Add('            AND (R.IDPESSOA = T.IDPESSOA)');
   lstSql.Add('            AND (R.RECPAG = T.RECPAG)');
   lstSql.Add('        -- TAG REGNADATA_21_F');
   lstSql.Add('        )');
   lstSql.Add('        UNION ALL');
   lstSql.Add('        (');
   lstSql.Add('         -- (2.2) REGISTROS BAIXADOS NA DATAREF <> DE INVESTIMENTOS E GERADOS PELO BAIXA DE RECBTO / PAGTO');
   lstSql.Add('         -- TAG REGNADATA_22_I');
   lstSql.Add('         SELECT');
   lstSql.Add('            '' '' AS NOMEFORCLI, DECODE(R.RECPAG,''R'',R.VALOR,R.VALOR*-1) AS SALDO, R.IDPLANOPREV, R.IDPATRO, -1 AS IDFORCLI, 0 AS CODDOCUMENTO,');
   //AL_17
   lstSql.Add('            M.IDPESSOA, R.CODTIPDOC, 0 AS IDMODULO, 0 AS NUMAPGR, '' '' AS TIPOREG, M.HISTORICO||'' / ''||TO_CHAR(M.CODLANCFINANC,''9999999999'') AS NODOCUMENTO,');
   lstSql.Add('            '' '' AS HISTORICOCOMPL, R.CODTIPRECDES, R.CODCENTRORESPON, ''F'' AS RECPAG, 0 AS NUMLOTE, 0 AS CODLANCFINANC');
   lstSql.Add('         FROM MOVIMFINANC M, RATEIOFINANC R, TIPORECEBDESEMB T');
   lstSql.Add('         WHERE (M.DATADISPFINANC = TO_DATE('''+DateToStr(dDataRef)+''',''DD/MM/YYYY''))');
   lstSql.Add('            AND (M.IDPESSOA = ' + IntToStr(iPessoa) + ')');
   lstSql.Add('            AND (M.STATUSCONCILIA <> ''C'')');
   lstSql.Add('            AND ((M.VALORLANCFINAN = 0) AND (M.CODLANCTRANSF IS NULL))');
   lstSql.Add('            AND ( NOT EXISTS (SELECT * FROM MOVIMFINANC M1, RECBTOPAGTO R1, DOCUMENTO D1');
   lstSql.Add('                              WHERE ((M1.CODLANCTRANSF IS NULL) OR (M1.CODLANCTRANSF = 0))');
   lstSql.Add('                                 AND (M1.IDPESSOA = ' + IntToStr(iPessoa) + ')');
   lstSql.Add('                                 AND (M1.STATUSCONCILIA <> ''C'')');
   lstSql.Add('                                 AND (M.DATADISPFINANC  = TO_DATE('''+DateToStr(dDataRef)+''',''DD/MM/YYYY''))');
   lstSql.Add('                                 AND (R1.CODLANCFINANC(+) = M1.CODLANCFINANC)');
   lstSql.Add('                                 AND (D1.CODDOCUMENTO(+)   = R1.CODDOCUMENTO)');
   lstSql.Add('                                 AND (D1.IDMODULO = 79)');
   lstSql.Add('                                 AND (M1.CODLANCFINANC = M.CODLANCFINANC)))');
   lstSql.Add('            AND ((' + sPatro + ' IS NULL) OR (R.IDPATRO = ' + sPatro + '))');
   lstSql.Add('            AND ((' + sPlanoPrev + ' IS NULL) OR (R.IDPLANOPREV = ' + sPlanoPrev + '))');
   lstSql.Add('            AND ((' + sFlgIndRecDes + ' IS NULL) OR (NVL(T.FLGINDICARECDES,''N'') = ' + sFlgIndRecDes + '))');
   lstSql.Add('            AND (M.CODLANCFINANC = R.CODLANCFINANC)');
   lstSql.Add('            AND (R.CODTIPRECDES = T.CODTIPRECDES)');
   lstSql.Add('            AND (R.IDPESSOA = T.IDPESSOA)');
   lstSql.Add('            AND (R.RECPAG = T.RECPAG)');
   lstSql.Add('        -- TAG REGNADATA_22_F');
   lstSql.Add('        )');
   lstSql.Add('        UNION ALL');
   lstSql.Add('        (');
   lstSql.Add('         -- (2.3) REGISTRO BAIXADOS NA DATAREF <> DE INVESTIMENTO  E GERADOS PELA TRANSF. ENTRE PLANOS');
   lstSql.Add('         -- TAG REGNADATA_23_I');
   lstSql.Add('         SELECT');
   lstSql.Add('            '' '' AS NOMEFORCLI, DECODE(R.RECPAG,''R'',R.VALOR,R.VALOR*-1) AS SALDO, R.IDPLANOPREV, R.IDPATRO, -1 AS IDFORCLI, 0 AS CODDOCUMENTO,');
   lstSql.Add('            M.IDPESSOA, 0 AS CODTIPDOC, 0 AS IDMODULO, 0 AS NUMAPGR, '' '' AS TIPOREG, M.HISTORICO||'' / ''||TO_CHAR(M.CODLANCFINANC,''9999999999'') AS NODOCUMENTO, ');
   lstSql.Add('            '' '' AS HISTORICOCOMPL, R.CODTIPRECDES, R.CODCENTRORESPON, ''F'' AS RECPAG, RC.NUMLOTE, RC.CODLANCFINANC');
   lstSql.Add('         FROM MOVIMFINANC M, RATEIOFINANC R,  RECBTOPAGTO RC, DOCUMENTO D, TIPORECEBDESEMB T');
   lstSql.Add('         WHERE (M.DATADISPFINANC = TO_DATE('''+DateToStr(dDataRef)+''',''DD/MM/YYYY''))');
   lstSql.Add('            AND (M.IDPESSOA   = ' + IntToStr(iPessoa) + ')');
   lstSql.Add('            AND ((M.CODLANCTRANSF IS NOT NULL) AND (M.CODLANCTRANSF = M.CODLANCFINANC))');
   lstSql.Add('            AND ((RC.CODLANCFINANC IS NULL) OR (D.IDMODULO NOT IN (79)))');
   lstSql.Add('            AND (M.STATUSCONCILIA <> ''C'')');
   lstSql.Add('            AND (M.VALORLANCFINAN = 0)');
   lstSql.Add('            AND (DECODE(R.RECPAG,''R'',R.VALOR,R.VALOR*-1)) <> 0');
   lstSql.Add('            AND ((' + sPatro + ' IS NULL) OR (R.IDPATRO = ' + sPatro + '))');
   lstSql.Add('            AND ((' + sPlanoPrev + ' IS NULL) OR (R.IDPLANOPREV = ' + sPlanoPrev + '))');
   lstSql.Add('            AND ((' + sFlgIndRecDes + ' IS NULL) OR (NVL(T.FLGINDICARECDES,''N'') = ' + sFlgIndRecDes + '))');
   //AL_9
   //AL_10
   lstSql.Add('            AND (M.CODLANCFINANC  = R.CODLANCFINANC)');
   lstSql.Add('            AND (RC.CODLANCFINANC(+) = M.CODLANCFINANC)');
   lstSql.Add('            AND (D.CODDOCUMENTO(+)   = RC.CODDOCUMENTO)');
   lstSql.Add('            AND (R.CODTIPRECDES = T.CODTIPRECDES)');
   lstSql.Add('            AND (R.IDPESSOA = T.IDPESSOA)');
   lstSql.Add('            AND (R.RECPAG = T.RECPAG)');
   lstSql.Add('        -- TAG REGNADATA_23_F');
   lstSql.Add('        )');
   lstSql.Add('        UNION ALL');
   lstSql.Add('        (');
   lstSql.Add('         -- (2.4) REGISTRO DE PAGAMENTOS NAO BAIXADOS NA DATAREF <> DE CPMF E MODULO <> INVESTIMENTOS');
   lstSql.Add('         -- TAG REGNADATA_24_I');
   lstSql.Add('         SELECT '' '' AS NOMEFORCLI, SUM(((R.VALOR*S.SALDO)/L.VALOR)-(DECODE(P.VALOR,NULL,0,P.VALOR))) AS SALDO, R.IDPLANOPREV, R.IDPATRO, D.IDFORCLI, D.CODDOCUMENTO,');
   lstSql.Add('            D.IDPESSOA, D.CODTIPDOC, D.IDMODULO, D.NUMAPGR, '' '' AS TIPOREG, DECODE(D.COMPLDOCUMENTO,NULL,TO_CHAR(D.NODOCUMENTO),(TO_CHAR(D.NODOCUMENTO)||''/''||D.COMPLDOCUMENTO)) AS NODOCUMENTO,');
   lstSql.Add('            L.HISTORICOCOMPL, R.CODTIPRECDES, R.CODCENTRORESPON, R.RECPAG, 0 AS NUMLOTE, 0 AS CODLANCFINANC');
   // Alterado por Arnaldo V. Scarin em 25/01/2010
   // SOL: 129555 - Alteração da Disponibilidade Financeira
   // Troca da Tabela RateioDocum por View VW_RATEIODOCUM
   //'            DOCUMENTO D, LANCTODOCUM L, RATEIODOCUM R, TIPORECEBDESEMB T,');
   lstSql.Add('         FROM DOCUMENTO D, LANCTODOCUM L, VW_RATEIODOCUM R, TIPORECEBDESEMB T,');
   lstSql.Add('            (SELECT P.CODTIPDOCCPMF FROM PARAMCAP P WHERE P.IDPESSOA = ' + IntToStr(iPessoa) + ' AND P.RECPAG = ''P'') P,');
   lstSql.Add('            (SELECT D.CODDOCUMENTO, SUM(DECODE(L.DEBCRE,''D'',L.VALOR,L.VALOR*-1)) AS SALDO');
   lstSql.Add('             FROM DOCUMENTO D, LANCTODOCUM L');
   lstSql.Add('             WHERE ((D.OPERACAO IN (''2 '')) OR (D.OPERACAO IN (''1 '') AND D.NUMFATURA IS NULL))');
   lstSql.Add('                AND (D.RECPAG = ''P'')');
   lstSql.Add('                AND (D.IDPESSOA = ' + IntToStr(iPessoa) + ')');
   lstSql.Add('                AND (L.OPERACAO <> 5)');
   lstSql.Add('                AND (D.CODDOCUMENTO = L.CODDOCUMENTO)');
   lstSql.Add('             GROUP BY D.CODDOCUMENTO) S,');
   lstSql.Add('            (SELECT LA.CODDOCUMENTO, DECODE(LA.DEBCRE,''D'',LA.VALOR * -1,LA.VALOR) AS VALOR');
   lstSql.Add('             FROM RECBTOPAGTO RE, LANCTODOCUM LA');
   lstSql.Add('             WHERE RE.CODPORTFORMA IN (SELECT CODPORTFORMA FROM PORTADORFORMA WHERE LANCAFINANC = ''N'')');
   lstSql.Add('                AND LA.DEBCRE = ''D''');
   lstSql.Add('                AND LA.NUMLANCTO = RE.NUMLANCTO) P');
   lstSql.Add('         WHERE (D.DATAPROGRAMADA = TO_DATE('''+DateToStr(dDataRef)+''',''DD/MM/YYYY''))');
   lstSql.Add('            AND (D.RECPAG = ''P'')');
   lstSql.Add('            AND (NVL(L.VALOR,0) <> 0)');
   //AL_16
   lstSql.Add('            AND ((D.OPERACAO IN (''2 '')) OR (D.OPERACAO IN (''1 '') AND D.NUMFATURA IS NULL))');
   lstSql.Add('            AND (L.OPERACAO <> 5)');
   lstSql.Add('            AND NOT Exists (Select 1 From DocumxDocum dxd');
   lstSql.Add('                            where dxd.iddocumento = d.coddocumento');
   lstSql.Add('                              and dxd.flgdispfinanc = ''S'')');
   lstSql.Add('            AND (D.CODTIPDOC <> P.CODTIPDOCCPMF)');
   lstSql.Add('            AND (D.IDMODULO  <> 79)');
   lstSql.Add('            AND (D.STATUS <> 2)');
   lstSql.Add('            AND (D.IDPESSOA = ' + IntToStr(iPessoa) + ')');
   lstSql.Add('            AND ((' + sPatro + ' IS NULL) OR (R.IDPATRO = ' + sPatro + '))');
   lstSql.Add('            AND ((' + sPlanoPrev + ' IS NULL) OR (R.IDPLANOPREV = ' + sPlanoPrev + '))');
   lstSql.Add('            AND ((' + sFlgIndRecDes + ' IS NULL) OR (NVL(T.FLGINDICARECDES,''N'') = ' + sFlgIndRecDes + '))');
   // Alterado por Arnaldo V. Scarin em 26/01/2010
   // SOL: 129555 - Alteração da Disponibilidade Financeira
   // Acerto do Filtro da Data de Vigência da View VW_RATEIODOCUM
   lstSql.Add('            AND (R.EXERCICIO = '+QuotedStr(FormatDateTime('YYYY',dDataRef))+')');
   lstSql.Add('            AND (1 = ' + FFlgDocBaixado + ')');
   //AL_12
   lstSql.Add('            AND (D.CODDOCUMENTO NOT IN (SELECT DISTINCT CODDOCUMENTO FROM LOTEXDOCUM))');
   lstSql.Add('            AND (D.CODDOCUMENTO = L.CODDOCUMENTO)');
   lstSql.Add('            AND (D.OPERACAO = L.OPERACAO)');
   lstSql.Add('            AND (D.CODDOCUMENTO = R.CODDOCUMENTO)');
   lstSql.Add('            AND (D.CODDOCUMENTO = S.CODDOCUMENTO)');
   lstSql.Add('            AND (D.CODDOCUMENTO = P.CODDOCUMENTO(+))');
   lstSql.Add('            AND (R.CODTIPRECDES = T.CODTIPRECDES)');
   lstSql.Add('            AND (R.IDPESSOA = T.IDPESSOA)');
   lstSql.Add('            AND (R.RECPAG = T.RECPAG)');
   lstSql.Add('         GROUP BY D.IDFORCLI, D.DATAVENCTO, D.COMPLDOCUMENTO, D.NODOCUMENTO, D.DATAPROGRAMADA,');
   lstSql.Add('                L.HISTORICOCOMPL, L.DATALANCTO, R.CODTIPRECDES, R.IDPLANOPREV, R.IDPATRO,');
   lstSql.Add('                R.RECPAG, D.IDPESSOA, D.OPERACAO, D.CODTIPDOC, D.IDMODULO, D.CODDOCUMENTO, R.CODCENTRORESPON, D.NUMAPGR');
   lstSql.Add('         HAVING SUM(((R.VALOR*S.SALDO)/L.VALOR)-(DECODE(P.VALOR,NULL,0,P.VALOR))) <> 0');
   lstSql.Add('        -- TAG REGNADATA_24_F');
   lstSql.Add('        )');
   lstSql.Add('        UNION ALL');
   lstSql.Add('        (');
   lstSql.Add('         -- (2.5) REGISTRO DE PAGAMENTOS NA DATAREF E MODULO = INVESTIMENTOS E <> DE CPMF');
   lstSql.Add('         -- TAG REGNADATA_25_I');
   lstSql.Add('         SELECT');
   lstSql.Add('            A.NOMEFORCLI, A.SALDO, A.IDPLANOPREV, A.IDPATRO, A.IDFORCLI, A.CODDOCUMENTO, A.IDPESSOA, A.CODTIPDOC, A.IDMODULO, A.NUMAPGR, A.TIPOREG,');
   lstSql.Add('            A.NODOCUMENTO, L.HISTORICOCOMPL, A.CODTIPRECDES, A.CODCENTRORESPON, A.RECPAG, 0 AS NUMLOTE, 0 AS CODLANCFINANC');
   lstSql.Add('         FROM');
   lstSql.Add('            (SELECT '' '' AS NOMEFORCLI, SUM(DECODE(L.DEBCRE,''D'',L.VALOR,L.VALOR * -1)-(DECODE(P.VALOR,NULL,0,P.VALOR))) AS SALDO, R.IDPLANOPREV, R.IDPATRO, D.IDFORCLI, D.CODDOCUMENTO,');
   lstSql.Add('                 D.IDPESSOA, D.CODTIPDOC, D.IDMODULO, D.NUMAPGR, '' '' AS TIPOREG,DECODE(D.COMPLDOCUMENTO,NULL,TO_CHAR(D.NODOCUMENTO),(TO_CHAR(D.NODOCUMENTO)||''/''||D.COMPLDOCUMENTO)) AS NODOCUMENTO, R.CODTIPRECDES, R.CODCENTRORESPON, D.RECPAG');
   lstSql.Add('             FROM DOCUMENTO D,LANCTODOCUM L,');
   lstSql.Add('                (SELECT DISTINCT R1.IDPATRO,R1.IDPLANOPREV,R1.CODTIPRECDES, D1.CODDOCUMENTO, R1.CODCENTRORESPON');
   // Alterado por Arnaldo V. Scarin em 25/01/2010
   // SOL: 129555 - Alteração da Disponibilidade Financeira
   // Troca da Tabela RateioDocum por View VW_RATEIODOCUM
   //'                 FROM RATEIODOCUM R1, DOCUMENTO D1, TIPORECEBDESEMB T');
   lstSql.Add('                 FROM VW_RATEIODOCUM R1, DOCUMENTO D1, TIPORECEBDESEMB T');
   lstSql.Add('                 WHERE  (D1.DATADISPONIB = TO_DATE('''+DateToStr(dDataRef)+''',''DD/MM/YYYY''))');
   lstSql.Add('                    AND (D1.IDPESSOA = ' + IntToStr(iPessoa) + ')');
   lstSql.Add('                    AND (D1.OPERACAO IN (''2 ''))');
   lstSql.Add('                    AND (D1.RECPAG = ''P'')');
   lstSql.Add('                    AND (D1.IDMODULO  = 79)');
   lstSql.Add('                    AND ((' + sPatro + ' IS NULL) OR (R1.IDPATRO = ' + sPatro + '))');
   lstSql.Add('                    AND ((' + sPlanoPrev + ' IS NULL) OR (R1.IDPLANOPREV = ' + sPlanoPrev + '))');
   lstSql.Add('                    AND ((' + sFlgIndRecDes + ' IS NULL) OR (NVL(T.FLGINDICARECDES,''N'') = ' + sFlgIndRecDes + '))');
   lstSql.Add('                    AND (R1.CODTIPRECDES = T.CODTIPRECDES)');
   lstSql.Add('                    AND (R1.IDPESSOA = T.IDPESSOA)');
   lstSql.Add('                    AND (R1.RECPAG = T.RECPAG)');
   // Alterado por Arnaldo V. Scarin em 26/01/2010
   // SOL: 129555 - Alteração da Disponibilidade Financeira
   // Acerto do Filtro da Data de Vigência da View VW_RATEIODOCUM
   lstSql.Add('                    AND (R1.EXERCICIO = '+QuotedStr(FormatDateTime('YYYY',dDataRef))+')');
   lstSql.Add('                    AND (D1.CODDOCUMENTO = R1.CODDOCUMENTO)) R,');
   lstSql.Add('                (SELECT LA.CODDOCUMENTO, DECODE(LA.DEBCRE,''C'',LA.VALOR,LA.VALOR * -1) AS VALOR');
   lstSql.Add('                 FROM RECBTOPAGTO RE, LANCTODOCUM LA');
   lstSql.Add('                 WHERE RE.CODPORTFORMA IN (SELECT CODPORTFORMA FROM PORTADORFORMA WHERE LANCAFINANC = ''N'')');
   lstSql.Add('                    AND LA.DEBCRE = ''D''');
   lstSql.Add('                    AND LA.NUMLANCTO = RE.NUMLANCTO) P');
   lstSql.Add('             WHERE  (D.DATADISPONIB = TO_DATE('''+DateToStr(dDataRef)+''',''DD/MM/YYYY''))');
   lstSql.Add('                AND (D.IDPESSOA = ' + IntToStr(iPessoa) + ')');
   lstSql.Add('                AND (NVL(L.VALOR,0) <> 0)');
   lstSql.Add('                AND (D.OPERACAO IN (''2 ''))');
   lstSql.Add('                AND (L.OPERACAO <> 5)');
   lstSql.Add('                AND NOT Exists (Select 1 From DocumxDocum dxd');
   lstSql.Add('                                where dxd.iddocumento = d.coddocumento');
   lstSql.Add('                                  and dxd.flgdispfinanc = ''S'')');
   lstSql.Add('                AND (D.RECPAG = ''P'')');
   lstSql.Add('                AND (D.IDMODULO  = 79)');
   lstSql.Add('                AND ((' + sPatro + ' IS NULL) OR (R.IDPATRO = ' + sPatro + '))');
   lstSql.Add('                AND ((' + sPlanoPrev + ' IS NULL) OR (R.IDPLANOPREV = ' + sPlanoPrev + '))');
   lstSql.Add('                AND (1 = ' + FFlgDocBaixado + ')');
   //AL_12
   lstSql.Add('                AND (D.CODDOCUMENTO NOT IN (SELECT DISTINCT CODDOCUMENTO FROM LOTEXDOCUM))');
   lstSql.Add('                AND (D.CODDOCUMENTO = L.CODDOCUMENTO)');
   lstSql.Add('                AND (D.CODDOCUMENTO = R.CODDOCUMENTO)');
   lstSql.Add('                AND (D.CODDOCUMENTO = P.CODDOCUMENTO(+))');
   lstSql.Add('             GROUP BY D.IDFORCLI, R.IDPLANOPREV, R.IDPATRO, D.IDPESSOA, D.CODDOCUMENTO, D.CODTIPDOC,');
   lstSql.Add('                      D.IDMODULO, D.NUMAPGR, D.NODOCUMENTO, D.COMPLDOCUMENTO, R.CODTIPRECDES, D.RECPAG, R.CODCENTRORESPON');
   lstSql.Add('             HAVING SUM(NVL(L.VALOR,0)-(DECODE(P.VALOR,NULL,0,P.VALOR))) <> 0) A, LANCTODOCUM L');
   lstSql.Add('         WHERE A.CODDOCUMENTO = L.CODDOCUMENTO');
   lstSql.Add('            AND L.OPERACAO NOT IN (''4 '',''5 '')');
   lstSql.Add('         -- TAG REGNADATA_25_F');
   lstSql.Add('        )');
   lstSql.Add('        UNION ALL');
   lstSql.Add('        (');
   lstSql.Add('         -- (2.6) REGISTRO DE RECEBIMENTOS NA DATAREF E MODULO = INVESTIMENTOS');
   lstSql.Add('         -- TAG REGNADATA_26_I');
   lstSql.Add('         SELECT');
   lstSql.Add('            A.NOMEFORCLI, A.SALDO, A.IDPLANOPREV, A.IDPATRO, A.IDFORCLI, A.CODDOCUMENTO, A.IDPESSOA, A.CODTIPDOC,');
   lstSql.Add('            A.IDMODULO, A.NUMAPGR, A.TIPOREG, A.NODOCUMENTO, L.HISTORICOCOMPL, A.CODTIPRECDES, A.CODCENTRORESPON, A.RECPAG, 0 AS NUMLOTE, 0 AS CODLANCFINANC');
   lstSql.Add('         FROM');
   lstSql.Add('            (SELECT '' '' AS NOMEFORCLI, SUM(DECODE(L.DEBCRE,''D'',L.VALOR,L.VALOR * -1)-(DECODE(P.VALOR,NULL,0,P.VALOR))) AS SALDO, R.IDPLANOPREV, R.IDPATRO, D.IDFORCLI,');
   lstSql.Add('                 D.CODDOCUMENTO, D.IDPESSOA, D.CODTIPDOC, D.IDMODULO, D.NUMAPGR,'' '' AS TIPOREG,DECODE(D.COMPLDOCUMENTO,NULL,');
   lstSql.Add('                 TO_CHAR(D.NODOCUMENTO),(TO_CHAR(D.NODOCUMENTO)||''/''||D.COMPLDOCUMENTO)) AS NODOCUMENTO, R.CODTIPRECDES, R.CODCENTRORESPON, D.RECPAG');
   lstSql.Add('             FROM DOCUMENTO D,LANCTODOCUM L,');
   lstSql.Add('                (SELECT DISTINCT R1.IDPATRO,R1.IDPLANOPREV,R1.CODTIPRECDES, D1.CODDOCUMENTO, R1.CODCENTRORESPON');
   // Alterado por Arnaldo V. Scarin em 25/01/2010
   // SOL: 129555 - Alteração da Disponibilidade Financeira
   // Troca da Tabela RateioDocum por View VW_RATEIODOCUM
   //'                 FROM RATEIODOCUM R1, DOCUMENTO D1, TIPORECEBDESEMB T');
   lstSql.Add('                 FROM VW_RATEIODOCUM R1, DOCUMENTO D1, TIPORECEBDESEMB T');
   lstSql.Add('                 WHERE  (D1.DATADISPONIB = TO_DATE('''+DateToStr(dDataRef)+''',''DD/MM/YYYY''))');
   lstSql.Add('                    AND (D1.IDPESSOA = ' + IntToStr(iPessoa) + ')');
   lstSql.Add('                    AND (D1.OPERACAO IN (''2 ''))');
   lstSql.Add('                    AND (D1.RECPAG = ''R'')');
   lstSql.Add('                    AND (D1.IDMODULO  = 79)');
   lstSql.Add('                    AND ((' + sPatro + ' IS NULL) OR (R1.IDPATRO = ' + sPatro + '))');
   lstSql.Add('                    AND ((' + sPlanoPrev + ' IS NULL) OR (R1.IDPLANOPREV = ' + sPlanoPrev + '))');
   lstSql.Add('                    AND ((' + sFlgIndRecDes + ' IS NULL) OR (NVL(T.FLGINDICARECDES,''N'') = ' + sFlgIndRecDes + '))');
   lstSql.Add('                    AND (1 = ' + FFlgDocBaixado + ')');
   lstSql.Add('                    AND (R1.CODTIPRECDES = T.CODTIPRECDES)');
   lstSql.Add('                    AND (R1.IDPESSOA = T.IDPESSOA)');
   lstSql.Add('                    AND (R1.RECPAG = T.RECPAG)');
   // Alterado por Arnaldo V. Scarin em 26/01/2010
   // SOL: 129555 - Alteração da Disponibilidade Financeira
   // Acerto do Filtro da Data de Vigência da View VW_RATEIODOCUM
   lstSql.Add('                    AND (R1.EXERCICIO = '+QuotedStr(FormatDateTime('YYYY',dDataRef))+')');
   lstSql.Add('                    AND (D1.CODDOCUMENTO = R1.CODDOCUMENTO)) R,');
   lstSql.Add('                (SELECT LA.CODDOCUMENTO, DECODE(LA.DEBCRE,''C'',LA.VALOR,LA.VALOR * -1) AS VALOR');
   lstSql.Add('                 FROM RECBTOPAGTO RE, LANCTODOCUM LA');
   lstSql.Add('                 WHERE RE.CODPORTFORMA IN (SELECT CODPORTFORMA FROM PORTADORFORMA WHERE LANCAFINANC = ''N'')');
   lstSql.Add('                   AND LA.DEBCRE = ''D''');
   lstSql.Add('                   AND LA.NUMLANCTO = RE.NUMLANCTO) P');
   lstSql.Add('             WHERE  (D.DATADISPONIB = TO_DATE('''+DateToStr(dDataRef)+''',''DD/MM/YYYY''))');
   lstSql.Add('                AND (D.IDPESSOA = ' + IntToStr(iPessoa) + ')');
   lstSql.Add('                AND (NVL(L.VALOR,0) <> 0)');
   lstSql.Add('                AND (D.OPERACAO IN (''2 ''))');
   lstSql.Add('                AND (L.OPERACAO <> 5)');
   lstSql.Add('                AND (D.RECPAG = ''R'')');
   lstSql.Add('                AND (D.IDMODULO  = 79)');
   lstSql.Add('                AND ((' + sPatro + ' IS NULL) OR (R.IDPATRO = ' + sPatro + '))');
   lstSql.Add('                AND ((' + sPlanoPrev + ' IS NULL) OR (R.IDPLANOPREV = ' + sPlanoPrev + '))');
   //AL_12
   lstSql.Add('                AND (D.CODDOCUMENTO NOT IN (SELECT DISTINCT CODDOCUMENTO FROM LOTEXDOCUM))');
   lstSql.Add('                AND (D.CODDOCUMENTO = L.CODDOCUMENTO)');
   lstSql.Add('                AND (D.CODDOCUMENTO = R.CODDOCUMENTO)');
   lstSql.Add('                AND (D.CODDOCUMENTO = P.CODDOCUMENTO(+))');
   lstSql.Add('             GROUP BY D.IDFORCLI, R.IDPLANOPREV, R.IDPATRO, D.IDPESSOA, D.CODDOCUMENTO, D.CODTIPDOC,');
   lstSql.Add('                      D.IDMODULO, D.NUMAPGR, D.NODOCUMENTO, D.COMPLDOCUMENTO,');
   lstSql.Add('                      R.CODTIPRECDES, D.RECPAG, R.CODCENTRORESPON');
   lstSql.Add('             HAVING SUM(NVL(L.VALOR,0)-(DECODE(P.VALOR,NULL,0,P.VALOR))) <> 0) A,');
   lstSql.Add('             LANCTODOCUM L');
   lstSql.Add('         WHERE A.CODDOCUMENTO = L.CODDOCUMENTO');
   lstSql.Add('            AND L.OPERACAO NOT IN (''4 '',''5 '')');
   lstSql.Add('         -- TAG REGNADATA_26_F');
   lstSql.Add('        )');
   lstSql.Add('        UNION ALL');
   lstSql.Add('        (');
   lstSql.Add('         -- (2.7) REGISTRO DE PAGAMENTOS NAO BAIXADOS ENGLOBADOS NA DATAREF E MODULO <> INVESTIMENTOS');
   lstSql.Add('         -- TAG REGNADATA_27_I');
   lstSql.Add('         SELECT A.NOMEFORCLI, SUM(A.SALDO) AS SALDO, A.IDPLANOPREV, A.IDPATRO, A.IDFORCLI, 0 AS CODDOCUMENTO,');
   lstSql.Add('             A.IDPESSOA, A.CODTIPDOC, A.IDMODULO, A.NUMAPGR, A.TIPOREG, B.NODOCUMENTO, B.HISTORICOCOMPL, A.CODTIPRECDES, A.CODCENTRORESPON, A.RECPAG, 0 AS NUMLOTE, 0 AS CODLANCFINANC');
   lstSql.Add('         FROM');
   lstSql.Add('            (SELECT '' '' AS NOMEFORCLI, (SUM(((R.VALORRAT*S.SALDODOC)/abs(SS.SALDOTOT))))-((SUM(((R.VALORRAT*S.SALDODOC)/abs(SS.SALDOTOT))) * DECODE(C.SALDOALT,NULL,0,C.SALDOALT))/SS.SALDOTOT) AS SALDO,');
   lstSql.Add('                R.IDPLANOPREV, R.IDPATRO, D.IDFORCLI, D.CODDOCUMENTO, D.IDPESSOA, D.CODTIPDOC, D.IDMODULO, D.NUMAPGR,  '' '' AS TIPOREG, DECODE(D.COMPLDOCUMENTO,NULL,TO_CHAR(D.NODOCUMENTO),TO_CHAR(D.NODOCUMENTO)||''/''||D.COMPLDOCUMENTO) AS NODOCUMENTO,');
   lstSql.Add('                L.HISTORICOCOMPL, R.CODTIPRECDES, R.CODCENTRORESPON, R.RECPAG, D.NUMFATURA, SS.SALDOTOT, C.SALDOALT');
   lstSql.Add('             FROM DOCUMENTO D, LANCTODOCUM L,');
   lstSql.Add('                (SELECT D.NUMFATURA, SUM(DECODE(L.DEBCRE,''D'',L.VALOR,L.VALOR*-1)) AS SALDOTOT');
   lstSql.Add('                 FROM DOCUMENTO D, LANCTODOCUM L');
   lstSql.Add('                 WHERE  (D.OPERACAO IN (''1 ''))');
   lstSql.Add('                    AND (D.IDPESSOA = ' + IntToStr(iPessoa) + ')');
   lstSql.Add('                    AND (D.RECPAG = ''P'')');
   lstSql.Add('                    AND (D.NUMFATURA IS NOT NULL)');
   lstSql.Add('                    AND (D.OPERACAO = L.OPERACAO)');
   lstSql.Add('                    AND (D.CODDOCUMENTO = L.CODDOCUMENTO)');
   lstSql.Add('                 GROUP BY D.NUMFATURA) SS,');
   lstSql.Add('                (SELECT D.CODDOCUMENTO, SUM(DECODE(L.DEBCRE,''D'',L.VALOR,L.VALOR*-1)) AS SALDODOC');
   lstSql.Add('                 FROM DOCUMENTO D, LANCTODOCUM L');
   lstSql.Add('                 WHERE  (D.OPERACAO IN (''1 ''))');
   lstSql.Add('                    AND (D.IDPESSOA = ' + IntToStr(iPessoa) + ')');
   lstSql.Add('                    AND (D.RECPAG = ''P'')');
   lstSql.Add('                    AND (L.OPERACAO <> 5)');
   lstSql.Add('                    AND NOT Exists (Select 1 From DocumxDocum dxd');
   lstSql.Add('                                    where dxd.iddocumento = d.coddocumento');
   lstSql.Add('                                      and dxd.flgdispfinanc = ''S'')');
   lstSql.Add('                    AND (D.CODDOCUMENTO = L.CODDOCUMENTO)');
   lstSql.Add('                 GROUP BY D.CODDOCUMENTO) S,');
   lstSql.Add('                (SELECT D.NUMFATURA, R.CODTIPRECDES, R.IDPLANOPREV, R.IDPATRO, R.IDPESSOA, R.RECPAG, SUM(R.VALOR) AS VALORRAT,R.CODCENTRORESPON');
   // Alterado por Arnaldo V. Scarin em 25/01/2010
   // SOL: 129555 - Alteração da Disponibilidade Financeira
   // Troca da Tabela RateioDocum por View VW_RATEIODOCUM
   //'                    DOCUMENTO D, RATEIODOCUM R, TIPORECEBDESEMB T');
   lstSql.Add('                 FROM DOCUMENTO D, VW_RATEIODOCUM R, TIPORECEBDESEMB T');
   lstSql.Add('                 WHERE  (D.OPERACAO IN (''1 ''))');
   lstSql.Add('                    AND (D.IDPESSOA = ' + IntToStr(iPessoa) + ')');
   lstSql.Add('                    AND ((' + sFlgIndRecDes + ' IS NULL) OR (NVL(T.FLGINDICARECDES,''N'') = ' + sFlgIndRecDes + '))');
   lstSql.Add('                    AND (D.RECPAG = ''P'')');
   lstSql.Add('                    AND (D.NUMFATURA IS NOT NULL)');
   lstSql.Add('                    AND (D.CODDOCUMENTO = R.CODDOCUMENTO)');
   lstSql.Add('                    AND (R.CODTIPRECDES = T.CODTIPRECDES)');
   lstSql.Add('                    AND (R.IDPESSOA = T.IDPESSOA)');
   lstSql.Add('                    AND (R.RECPAG = T.RECPAG)');
   // Alterado por Arnaldo V. Scarin em 26/01/2010
   // SOL: 129555 - Alteração da Disponibilidade Financeira
   // Acerto do Filtro da Data de Vigência da View VW_RATEIODOCUM
   lstSql.Add('                    AND (R.EXERCICIO = '+QuotedStr(FormatDateTime('YYYY',dDataRef))+')');
   lstSql.Add('                 GROUP BY R.CODTIPRECDES, R.IDPLANOPREV, R.IDPATRO, R.IDPESSOA, R.RECPAG, D.NUMFATURA,R.CODCENTRORESPON) R,');
   lstSql.Add('            (SELECT D.NUMFATURA, (SUM(DECODE(L.DEBCRE,''D'',L.VALOR,L.VALOR*-1))* -1) AS SALDOALT');
   lstSql.Add('             FROM DOCUMENTO D, LANCTODOCUM L');
   lstSql.Add('             WHERE  (D.OPERACAO IN (''3 ''))');
   lstSql.Add('                AND (D.IDPESSOA = ' + IntToStr(iPessoa) + ')');
   lstSql.Add('                AND (D.RECPAG = ''P'')');
   lstSql.Add('                AND (L.OPERACAO NOT IN (''5 '',''3 ''))');
   lstSql.Add('                AND (D.CODDOCUMENTO = L.CODDOCUMENTO)');
   lstSql.Add('             GROUP BY D.NUMFATURA) C,');
   lstSql.Add('                (SELECT');
   lstSql.Add('                    D.NUMFATURA, D.DATAPROGRAMADA, DECODE(D.COMPLDOCUMENTO,NULL,TO_CHAR(D.NODOCUMENTO),(TO_CHAR(D.NODOCUMENTO)||''/''||D.COMPLDOCUMENTO)) AS NODOCUMENTO');
   lstSql.Add('                 FROM');
   lstSql.Add('                    DOCUMENTO D');
   lstSql.Add('                 WHERE');
   lstSql.Add('                    (D.OPERACAO IN (''3 ''))');
   lstSql.Add('                    AND (D.IDPESSOA = ' + IntToStr(iPessoa) + ')');
   lstSql.Add('                    AND (D.RECPAG = ''P'')');
   lstSql.Add('                    AND (D.NUMFATURA IS NOT NULL)) X');
   lstSql.Add('             WHERE (X.DATAPROGRAMADA = TO_DATE('''+DateToStr(dDataRef)+''',''DD/MM/YYYY''))');
   lstSql.Add('                AND (D.RECPAG = ''P'')');
   lstSql.Add('                AND (NVL(SS.SALDOTOT,0) <> 0 )');
   lstSql.Add('                AND (D.OPERACAO IN (''1 ''))');
   lstSql.Add('                AND (L.OPERACAO <> 5)');
   lstSql.Add('                AND (D.IDMODULO <> 79)');
   lstSql.Add('                AND (D.IDPESSOA = ' + IntToStr(iPessoa) + ')');
   lstSql.Add('                AND (1 = ' + FFlgDocBaixado + ')');
   lstSql.Add('                AND ((' + sPatro + ' IS NULL) OR (R.IDPATRO = ' + sPatro + '))');
   lstSql.Add('                AND ((' + sPlanoPrev + ' IS NULL) OR (R.IDPLANOPREV = ' + sPlanoPrev + '))');
   //AL_12
   lstSql.Add('                AND (D.CODDOCUMENTO NOT IN (SELECT DISTINCT CODDOCUMENTO FROM LOTEXDOCUM))');
   lstSql.Add('                AND (D.CODDOCUMENTO = L.CODDOCUMENTO)');
   lstSql.Add('                AND (D.OPERACAO = L.OPERACAO)');
   lstSql.Add('                AND (D.NUMFATURA = R.NUMFATURA)');
   lstSql.Add('                AND (D.CODDOCUMENTO = S.CODDOCUMENTO)');
   lstSql.Add('                AND (D.NUMFATURA = SS.NUMFATURA)');
   lstSql.Add('                AND (D.NUMFATURA = C.NUMFATURA(+))');
   lstSql.Add('                AND (D.NUMFATURA = X.NUMFATURA)');
   lstSql.Add('             GROUP BY D.IDFORCLI, D.DATAVENCTO, D.COMPLDOCUMENTO, D.NODOCUMENTO, D.DATAPROGRAMADA,');
   lstSql.Add('                     L.HISTORICOCOMPL, L.DATALANCTO, R.CODTIPRECDES, R.IDPLANOPREV, R.IDPATRO,');
   lstSql.Add('                     R.RECPAG, D.IDPESSOA, D.OPERACAO, D.CODTIPDOC, D.IDMODULO, D.CODDOCUMENTO,');
   lstSql.Add('                     R.CODCENTRORESPON, D.NUMAPGR, D.NUMFATURA, SS.SALDOTOT, C.SALDOALT) A,');
   //AL_17
   lstSql.Add('            (SELECT D.CODDOCUMENTO, D.NUMFATURA, D.DATAPROGRAMADA, DECODE(D.COMPLDOCUMENTO,NULL,TO_CHAR(D.NODOCUMENTO),(TO_CHAR(D.NODOCUMENTO)||''/''||D.COMPLDOCUMENTO)) AS NODOCUMENTO, L.HISTORICOCOMPL');
   lstSql.Add('             FROM DOCUMENTO D, LANCTODOCUM L');
   lstSql.Add('             WHERE  (D.OPERACAO IN (''3 ''))');
   lstSql.Add('                AND (D.IDPESSOA = ' + IntToStr(iPessoa) + ')');
   lstSql.Add('                AND (D.RECPAG = ''P'')');
   lstSql.Add('                AND (D.NUMFATURA IS NOT NULL)');
   lstSql.Add('                AND (L.OPERACAO = 3)');
   lstSql.Add('                AND (D.CODDOCUMENTO NOT IN (SELECT DISTINCT CODDOCUMENTO FROM LOTEXDOCUM))'); // Se já existir na MovimFinanc
   lstSql.Add('                AND (D.CODDOCUMENTO = L.CODDOCUMENTO)');
   lstSql.Add('             UNION');
   lstSql.Add('             SELECT D.CODDOCUMENTO, D.NUMFATURA, D.DATAPROGRAMADA, DECODE(D.COMPLDOCUMENTO,NULL,TO_CHAR(D.NODOCUMENTO),(TO_CHAR(D.NODOCUMENTO)||''/''||D.COMPLDOCUMENTO)) AS NODOCUMENTO, L.HISTORICOCOMPL');
   lstSql.Add('             FROM DOCUMENTO D, LANCTODOCUM L');
   lstSql.Add('             WHERE (D.OPERACAO IN (''3 ''))');
   lstSql.Add('                AND (D.IDPESSOA = ' + IntToStr(iPessoa) + ')');
   lstSql.Add('                AND (D.RECPAG = ''P'')');
   lstSql.Add('                AND (D.NUMFATURA IS NOT NULL)');
   lstSql.Add('                AND (L.OPERACAO = 5)'); // Registros de baixa
   lstSql.Add('                AND (L.ESTORNO IS NULL)'); // Registros não estornados
   lstSql.Add('                AND (D.CODDOCUMENTO = L.CODDOCUMENTO)) B');
   lstSql.Add('         WHERE  A.NUMFATURA=B.NUMFATURA(+)');
   //AL_17
   lstSql.Add('             AND (B.CODDOCUMENTO NOT IN (SELECT DISTINCT CODDOCUMENTO FROM LOTEXDOCUM))');
   lstSql.Add('             AND (B.CODDOCUMENTO NOT IN (SELECT DISTINCT CODDOCUMENTO FROM RECBTOPAGTO))'); // Se já existir na MovimFinanc
   lstSql.Add('         GROUP BY');
   lstSql.Add('             A.NOMEFORCLI, A.IDPLANOPREV, A.IDPATRO, A.IDFORCLI, A.IDPESSOA, A.CODTIPDOC,');
   lstSql.Add('             A.IDMODULO, A.NUMAPGR, A.TIPOREG, B.NODOCUMENTO, B.HISTORICOCOMPL, A.CODTIPRECDES,');
   lstSql.Add('             A.CODCENTRORESPON, A.RECPAG');
   lstSql.Add('        -- TAG REGNADATA_27_F');
   lstSql.Add('        )');
   lstSql.Add('        UNION ALL');
   lstSql.Add('        (');
   lstSql.Add('         -- (2.8) REGISTRO NA DATAREF DE IRRF QUE NAO ESTAO EM DARF GERADO');
   lstSql.Add('         -- TAG REGNADATA_28_I');
   lstSql.Add('         SELECT DISTINCT '' '' AS NOMEFORCLI, S.VALOR*-1 AS SALDO, R.IDPLANOPREV, R.IDPATRO, D.IDFORCLI, D.CODDOCUMENTO, D.IDPESSOA, D.CODTIPDOC, D.IDMODULO, 0 AS NUMAPGR,');
   lstSql.Add('            '' '' AS TIPOREG, DECODE(D.COMPLDOCUMENTO,NULL,TO_CHAR(D.NODOCUMENTO),(TO_CHAR(D.NODOCUMENTO)||''/''||D.COMPLDOCUMENTO)) AS NODOCUMENTO, L.HISTORICOCOMPL, R.CODTIPRECDES, R.CODCENTRORESPON, R.RECPAG, 0 AS NUMLOTE, 0 AS CODLANCFINANC');
   // Alterado por Arnaldo V. Scarin em 25/01/2010
   // SOL: 129555 - Alteração da Disponibilidade Financeira
   // Troca da Tabela RateioDocum por View VW_RATEIODOCUM
   //'            DOCUMENTO D, LANCIRRF I, LANCTODOCUM L, RATEIODOCUM R,  TIPORECEBDESEMB T,');
   lstSql.Add('         FROM DOCUMENTO D, LANCIRRF I, LANCTODOCUM L, VW_RATEIODOCUM R,  TIPORECEBDESEMB T,');
   lstSql.Add('            (SELECT CODALTERADOR FROM ALTXIMPOSTO WHERE CODIMPOSTO=1) X,');
   lstSql.Add('            (SELECT L.CODDOCUMENTO,L.CODALTERADOR,L.VALOR,L.NUMLANCTO');
   lstSql.Add('             FROM LANCTODOCUM L, DOCUMENTO D');
   lstSql.Add('             WHERE  (D.DATAVENCTO BETWEEN TO_DATE('''+DateToStr(dDataIniIRRF)+''',''DD/MM/YYYY'') AND TO_DATE('''+DateToStr(dDataFimIRRF)+''',''DD/MM/YYYY''))');
   lstSql.Add('                AND (CODALTERADOR IN (SELECT CODALTERADOR FROM ALTXIMPOSTO WHERE CODIMPOSTO=1))');
   lstSql.Add('                AND (L.CODDOCUMENTO=D.CODDOCUMENTO)) S');
   lstSql.Add('         WHERE  (I.IDDARF IS NULL)');
   lstSql.Add('            AND (VLRIRRF <> 0)');
   lstSql.Add('            AND (L.CODALTERADOR IN X.CODALTERADOR)');
   lstSql.Add('            AND (D.RECPAG = ''P'')');
   lstSql.Add('            AND (D.IDPESSOA = ' + IntToStr(iPessoa) + ')');
   lstSql.Add('            AND (L.OPERACAO <> 5)');
   lstSql.Add('            AND (D.STATUS=2)');
   lstSql.Add('            AND ((' + sPatro + ' IS NULL) OR (R.IDPATRO = ' + sPatro + '))');
   lstSql.Add('            AND ((' + sPlanoPrev + ' IS NULL) OR (R.IDPLANOPREV = ' + sPlanoPrev + '))');
   lstSql.Add('            AND ((' + sFlgIndRecDes + ' IS NULL) OR (NVL(T.FLGINDICARECDES,''N'') = ' + sFlgIndRecDes + '))');
   lstSql.Add('            AND (1 = ' + FFlgDocBaixado + ')');
   lstSql.Add('            AND (D.CODDOCUMENTO = S.CODDOCUMENTO)');
   lstSql.Add('            AND (D.CODDOCUMENTO = L.CODDOCUMENTO)');
   lstSql.Add('            AND (D.CODDOCUMENTO = R.CODDOCUMENTO)');
   lstSql.Add('            AND (D.CODDOCUMENTO = I.CODDOCUMENTO(+))');
   lstSql.Add('            AND (R.CODTIPRECDES = T.CODTIPRECDES)');
   lstSql.Add('            AND (R.IDPESSOA = T.IDPESSOA)');
   lstSql.Add('            AND (R.RECPAG = T.RECPAG)');
   // Alterado por Arnaldo V. Scarin em 26/01/2010
   // SOL: 129555 - Alteração da Disponibilidade Financeira
   // Acerto do Filtro da Data de Vigência da View VW_RATEIODOCUM
   lstSql.Add('            AND (R.EXERCICIO = '+QuotedStr(FormatDateTime('YYYY',dDataRef))+')');
   lstSql.Add('         -- TAG REGNADATA_28_F');
   lstSql.Add('         ) ');
   // Alterado por Arnaldo V. Scarin em 20/01/2010
   // SOL:  KTN:

   lstSql.Add('        --bruno bastos - 26/11/2009 - início');
   lstSql.Add('        UNION ALL');
   lstSql.Add('        (');
   lstSql.Add('         -- (2.10) REGISTRO DE RECEBIMENTOS NA DATAREF PARA DOCUMENTOS DA DOCUMXDOCUM <> DE CPMF');
   lstSql.Add('         -- TAG REGNADATA_210_I');
   lstSql.Add('         SELECT');
   lstSql.Add('            A.NOMEFORCLI, A.SALDO, A.IDPLANOPREV, A.IDPATRO, A.IDFORCLI, A.CODDOCUMENTO, A.IDPESSOA, A.CODTIPDOC,');
   lstSql.Add('            A.IDMODULO, A.NUMAPGR, A.TIPOREG, A.NODOCUMENTO, L.HISTORICOCOMPL, A.CODTIPRECDES, A.CODCENTRORESPON, A.RECPAG, 0 AS NUMLOTE, 0 AS CODLANCFINANC');
   lstSql.Add('         FROM');
   lstSql.Add('            (SELECT');
   lstSql.Add('                 '''' AS NOMEFORCLI, SUM(DECODE(L.DEBCRE,''D'',L.VALOR,L.VALOR * -1)-(DECODE(P.VALOR,NULL,0,P.VALOR))) AS SALDO,');
   lstSql.Add('                 R.IDPLANOPREV, R.IDPATRO, D.IDFORCLI, D.CODDOCUMENTO, D.IDPESSOA, D.CODTIPDOC, D.IDMODULO, D.NUMAPGR,'' '' AS TIPOREG,');
   lstSql.Add('                 DECODE(D.COMPLDOCUMENTO,NULL,TO_CHAR(D.NODOCUMENTO),(TO_CHAR(D.NODOCUMENTO)||''/''||D.COMPLDOCUMENTO)) AS NODOCUMENTO, R.CODTIPRECDES, R.CODCENTRORESPON, D.RECPAG');
   lstSql.Add('             FROM DOCUMENTO D,LANCTODOCUM L,');
   lstSql.Add('                --bruno bastos - 26/11/2009');
   lstSql.Add('                DOCUMXDOCUM DXD,');
   lstSql.Add('                (SELECT DISTINCT R1.IDPATRO,R1.IDPLANOPREV,R1.CODTIPRECDES, D1.CODDOCUMENTO, R1.CODCENTRORESPON');
   // Alterado por Arnaldo V. Scarin em 25/01/2010
   // SOL: 129555 - Alteração da Disponibilidade Financeira
   // Troca da Tabela RateioDocum por View VW_RATEIODOCUM
   //'                 FROM RATEIODOCUM R1, DOCUMENTO D1');
   lstSql.Add('                 FROM VW_RATEIODOCUM R1, DOCUMENTO D1');
   lstSql.Add('                 WHERE  (D1.DATADISPONIB = TO_DATE('''+DateToStr(dDataRef)+''',''DD/MM/YYYY''))');
   lstSql.Add('                    AND (D1.IDPESSOA = 1)');
   lstSql.Add('                    AND (D1.OPERACAO IN (''2 ''))');
   lstSql.Add('                    AND (D1.RECPAG = ''R'')');
   lstSql.Add('                    AND ((' + sPatro + ' IS NULL) OR (R1.IDPATRO = ' + sPatro + '))');
   lstSql.Add('                    AND ((' + sPlanoPrev + ' IS NULL) OR (R1.IDPLANOPREV = ' + sPlanoPrev + '))');
   // Alterado por Arnaldo V. Scarin em 26/01/2010
   // SOL: 129555 - Alteração da Disponibilidade Financeira
   // Acerto do Filtro da Data de Vigência da View VW_RATEIODOCUM
   lstSql.Add('                    AND (R1.EXERCICIO = '+QuotedStr(FormatDateTime('YYYY',dDataRef))+')');
   lstSql.Add('                    AND (D1.CODDOCUMENTO = R1.CODDOCUMENTO)) R,');
   lstSql.Add('                (SELECT LA.CODDOCUMENTO, DECODE(LA.DEBCRE,''C'',LA.VALOR,LA.VALOR * -1) AS VALOR');
   lstSql.Add('                 FROM RECBTOPAGTO RE, LANCTODOCUM LA');
   lstSql.Add('                 WHERE  RE.CODPORTFORMA IN (SELECT CODPORTFORMA FROM PORTADORFORMA WHERE LANCAFINANC = ''N'')');
   lstSql.Add('                   AND LA.DEBCRE = ''D''');
   lstSql.Add('                   AND LA.NUMLANCTO = RE.NUMLANCTO) P');
   lstSql.Add('             WHERE  (D.DATADISPONIB = TO_DATE('''+DateToStr(dDataRef)+''',''DD/MM/YYYY''))');
   lstSql.Add('                AND (D.IDPESSOA = 1)');
   lstSql.Add('                 --bruno bastos - 26/11/2009');
   lstSql.Add('                AND (D.CODDOCUMENTO = DXD.IDDOCUMENTO)');
   lstSql.Add('                AND (DXD.FLGDISPFINANC = ''S'')');
   lstSql.Add('                and Not Exists (Select 1 From lanctoDocum lctdoc');
   lstSql.Add('                                where lctdoc.coddocumento = dxd.iddocumentopai');
   lstSql.Add('                                  and lctdoc.operacao = ''5 '')');
   lstSql.Add('                AND (NVL(L.VALOR,0) <> 0)');
   lstSql.Add('                AND (D.OPERACAO IN (''2 ''))');
   lstSql.Add('                AND (L.OPERACAO <> 5)');
   lstSql.Add('                AND (D.RECPAG = ''R'')');
   lstSql.Add('                AND ((' + sPatro + ' IS NULL) OR (R.IDPATRO = ' + sPatro + '))');
   lstSql.Add('                AND ((' + sPlanoPrev + ' IS NULL) OR (R.IDPLANOPREV = ' + sPlanoPrev + '))');
   lstSql.Add('                AND (D.CODDOCUMENTO = L.CODDOCUMENTO)');
   lstSql.Add('                AND (D.CODDOCUMENTO = R.CODDOCUMENTO)');
   lstSql.Add('                AND (D.CODDOCUMENTO = P.CODDOCUMENTO(+))');
   lstSql.Add('             GROUP BY D.IDFORCLI, R.IDPLANOPREV, R.IDPATRO, D.IDPESSOA, D.CODDOCUMENTO, D.CODTIPDOC,');
   lstSql.Add('                      D.IDMODULO, D.NUMAPGR, D.NODOCUMENTO, D.COMPLDOCUMENTO,');
   lstSql.Add('                      R.CODTIPRECDES, D.RECPAG, R.CODCENTRORESPON');
   lstSql.Add('             HAVING SUM(NVL(L.VALOR,0)-(DECODE(P.VALOR,NULL,0,P.VALOR))) <> 0) A,');
   lstSql.Add('             LANCTODOCUM L');
   lstSql.Add('         WHERE A.CODDOCUMENTO = L.CODDOCUMENTO');
   lstSql.Add('            AND L.OPERACAO NOT IN (''4 '',''5 '')');
   lstSql.Add('         -- TAG REGNADATA_210_F');
   lstSql.Add('        )');
   lstSql.Add('        --bruno bastos - 26/11/2009 - fim');
   lstSql.Add('       ) U');
   lstSql.Add('    WHERE  ((' + sPatro + ' IS NULL) OR (U.IDPATRO = ' + sPatro + '))');
   lstSql.Add('       AND ((' + sPlanoPrev + ' IS NULL) OR (U.IDPLANOPREV = ' + sPlanoPrev + '))');
   lstSql.Add('       AND (U.IDFORCLI = P.IDPESSOA(+))');
   lstSql.Add('       AND (U.IDPLANOPREV = PP.IDPLANOPREV(+))');
   lstSql.Add('       AND (U.IDPATRO = PT.IDPESSOA(+))');
   lstSql.Add('       AND (U.CODTIPDOC = TD.CODTIPDOC(+))');
   lstSql.Add('       AND (U.CODTIPRECDES = T.CODTIPRECDES(+))');
   lstSql.Add('       AND (U.IDPESSOA = T.IDPESSOA(+))');
   lstSql.Add('       AND (U.RECPAG = T.RECPAG(+))');
   lstSql.Add('       AND (U.IDMODULO = M.IDMODULO(+))  ');
   //Marilza Colpani - SOL: 122335/Kintana: 598524 - início
   if sAtivPlano <> '' then
     lstSql.Add('       AND (PP.ATIVO = '+ QuotedStr (sAtivPlano) + ')');
   //AL_17
   if sGrupo = 'Plano/Patro' then
     lstSql.Add('    GROUP BY U.CODTIPDOC, U.NODOCUMENTO,DECODE(U.IDFORCLI,-1,U.NODOCUMENTO,P.RAZAOSOCIAL), U.IDPLANOPREV,U.IDPATRO,U.IDMODULO, U.CODCENTRORESPON, U.NUMAPGR,U.IDPESSOA, U.NUMLOTE, U.CODLANCFINANC ')
   else if sGrupo = 'Plano' then
     lstSql.Add('    GROUP BY U.CODTIPDOC, U.NODOCUMENTO,DECODE(U.IDFORCLI,-1,U.NODOCUMENTO,P.RAZAOSOCIAL), U.IDPLANOPREV,U.IDMODULO, U.CODCENTRORESPON, U.NUMAPGR,U.IDPESSOA, U.NUMLOTE, U.CODLANCFINANC ')
   else if sGrupo = 'Patro' then
     lstSql.Add('    GROUP BY U.CODTIPDOC, U.NODOCUMENTO,DECODE(U.IDFORCLI,-1,U.NODOCUMENTO,P.RAZAOSOCIAL),U.IDPATRO,U.IDMODULO, U.CODCENTRORESPON, U.NUMAPGR,U.IDPESSOA, U.NUMLOTE, U.CODLANCFINANC ');
   lstSql.Add('    -- TAG REGNADATA_20_F');
   lstSql.Add('    UNION ALL');
   lstSql.Add('    -- (3.0) REGISTROS NA DATAREF DE CPMF');
   lstSql.Add('    -- TAG REGNADATA_30_I');
   lstSql.Add('    SELECT');
   lstSql.Add('       DECODE(XX.IDFORCLI,-1,'' '',''CPMF - ''||P.NOME) AS NOMEFORCLI, XX.SALDO, '' '' AS NODOCUMENTO, 0 AS NUMAPGR, ');
   if sGrupo = 'Plano/Patro' then
     lstSql.Add('       XX.IDPLANOPREV, XX.IDPATRO, ')
   else if sGrupo = 'Plano' then
     lstSql.Add('       XX.IDPLANOPREV, '' '' AS IDPATRO, ')
   else if sGrupo = 'Patro' then
     lstSql.Add(' '' '' AS IDPLANOPREV, XX.IDPATRO, ');
   lstSql.Add('       3 AS TIPOREG, '' '' AS CODCENTRORESPON, XX.IDPESSOA, 0 AS NUMLOTE, 0 AS CODLANCFINANC');
   lstSql.Add('    FROM');
   lstSql.Add('       PESSOA P,');
   lstSql.Add('       (SELECT');
   lstSql.Add('           X.IDFORCLI, SUM(X.SALDO * -1) AS SALDO, ');
   if sGrupo = 'Plano/Patro' then
     lstSql.Add(' X.IDPLANOPREV, X.IDPATRO, ')
   else if sGrupo = 'Plano' then
     lstSql.Add(' X.IDPLANOPREV, '' '' AS IDPATRO, ')
   else if sGrupo = 'Patro' then
     lstSql.Add(' '' '' AS IDPLANOPREV, X.IDPATRO, ');
   lstSql.Add(' X.IDPESSOA');
   lstSql.Add('        FROM');
   lstSql.Add('           (');
   lstSql.Add('            -- (3.1) REGISTROS BAIXADOS NA DATAREF DE CPMF');
   lstSql.Add('            -- TAG REGNADATA_31_I');
   lstSql.Add('            SELECT');
   lstSql.Add('               PO.IDBANCO AS IDFORCLI, 0 AS NUMAPGR, '' '' AS NODOCUMENTO, ');
   if sGrupo = 'Plano/Patro' then
     lstSql.Add(' R.IDPLANOPREV, R.IDPATRO, ')
   else if sGrupo = 'Plano' then
     lstSql.Add(' R.IDPLANOPREV, '' '' AS IDPATRO, ')
   else if sGrupo = 'Patro' then
     lstSql.Add(' '' '' AS IDPLANOPREV, R.IDPATRO, ');
   lstSql.Add(' M.IDPESSOA, '' '' AS CODCENTRORESPON, SUM(R.VALOR) AS SALDO');
   lstSql.Add('            FROM MOVIMFINANC M, RATEIOFINANC R, PORTADORCONTA PO,  TIPORECEBDESEMB T');
   lstSql.Add('            WHERE (M.CODLANCFINANC IN(SELECT M.CODLANCFINANC FROM MOVIMFINANC M');
   lstSql.Add('                                   WHERE (IDMODULO = 3)');
   lstSql.Add('                                      AND (IDPESSOA = ' + IntToStr(iPessoa) + ')');
   lstSql.Add('                                      AND (DATALANCFINAN = TO_DATE('''+DateToStr(dDataRef)+''',''DD/MM/YYYY''))');
   lstSql.Add('                                      AND (M.CODLANCFINANC IN (SELECT DISTINCT CODLANCFINANC FROM RATEIOFINANC');
   lstSql.Add('                                                               WHERE CODTIPDOC = (SELECT CODTIPDOCCPMF FROM PARAMCAP WHERE IDPESSOA = ' + IntToStr(iPessoa) + ' AND RECPAG = ''P'')))))');
   lstSql.Add('               AND ((' + sPatro + ' IS NULL) OR (R.IDPATRO = ' + sPatro + '))');
   lstSql.Add('               AND ((' + sPlanoPrev + ' IS NULL) OR (R.IDPLANOPREV = ' + sPlanoPrev + '))');
   lstSql.Add('               AND ((' + sFlgIndRecDes + ' IS NULL) OR (NVL(T.FLGINDICARECDES,''N'') = ' + sFlgIndRecDes + '))');
   lstSql.Add('               AND (M.CODLANCFINANC = R.CODLANCFINANC)');
   lstSql.Add('               AND (M.CODPORTADOR = PO.CODPORTADOR)');
   lstSql.Add('               AND (R.CODTIPRECDES = T.CODTIPRECDES)');
   lstSql.Add('               AND (R.IDPESSOA = T.IDPESSOA)');
   lstSql.Add('               AND (R.RECPAG = T.RECPAG)');
   lstSql.Add('            GROUP BY R.IDPLANOPREV,R.IDPATRO,M.IDPESSOA,M.CODPORTADOR,PO.IDBANCO');
   lstSql.Add('            -- TAG REGNADATA_31_F');
   lstSql.Add('            UNION ALL');
   lstSql.Add('            -- (3.2) REGISTROS NA DATAREF DE CPMF NAO BAIXADOS');
   lstSql.Add('            -- TAG REGNADATA_32_I');
   lstSql.Add('            SELECT');
   lstSql.Add('               D.IDFORCLI, D.NUMAPGR, DECODE(D.COMPLDOCUMENTO,NULL,TO_CHAR(D.NODOCUMENTO),(TO_CHAR(D.NODOCUMENTO)||''/''||D.COMPLDOCUMENTO)) AS NODOCUMENTO, ');
   if sGrupo = 'Plano/Patro' then
     lstSql.Add(' R.IDPLANOPREV, R.IDPATRO, ')
   else if sGrupo = 'Plano' then
     lstSql.Add(' R.IDPLANOPREV, '' '' AS IDPATRO, ')
   else if sGrupo = 'Patro' then
     lstSql.Add(' '' '' AS IDPLANOPREV, R.IDPATRO, ');
   lstSql.Add(' D.IDPESSOA, R.CODCENTRORESPON, SUM(R.VALOR) AS SALDO');
   // Alterado por Arnaldo V. Scarin em 25/01/2010
   // SOL: 129555 - Alteração da Disponibilidade Financeira
   // Troca da Tabela RateioDocum por View VW_RATEIODOCUM
   //'               DOCUMENTO D, LANCTODOCUM L, RATEIODOCUM R, TIPORECEBDESEMB T,');
   lstSql.Add('            FROM DOCUMENTO D, LANCTODOCUM L, VW_RATEIODOCUM R, TIPORECEBDESEMB T,');
   lstSql.Add('               (SELECT P.CODTIPDOCCPMF FROM PARAMCAP P WHERE P.IDPESSOA = ' + IntToStr(iPessoa) + ' AND P.RECPAG = ''P'') P');
   lstSql.Add('            WHERE  (D.DATAPROGRAMADA = TO_DATE('''+DateToStr(dDataRef)+''',''DD/MM/YYYY''))');
   lstSql.Add('               AND (D.IDPESSOA = ' + IntToStr(iPessoa) + ')');
   lstSql.Add('               AND (D.RECPAG = ''P'')');
   lstSql.Add('               AND (D.OPERACAO IN (''2 '',''1 ''))');
   lstSql.Add('               AND (D.STATUS <> ''2'')');
   lstSql.Add('               AND ((' + sPatro + ' IS NULL) OR (R.IDPATRO = ' + sPatro + '))');
   lstSql.Add('               AND ((' + sPlanoPrev + ' IS NULL) OR (R.IDPLANOPREV = ' + sPlanoPrev + '))');
   lstSql.Add('               AND ((' + sFlgIndRecDes + ' IS NULL) OR (NVL(T.FLGINDICARECDES,''N'') = ' + sFlgIndRecDes + '))');
   lstSql.Add('               AND (1 = ' + FFlgDocBaixado + ')');
   lstSql.Add('               AND (D.CODTIPDOC = P.CODTIPDOCCPMF)');
   lstSql.Add('               AND (D.CODDOCUMENTO = L.CODDOCUMENTO)');
   lstSql.Add('               AND (D.CODDOCUMENTO = R.CODDOCUMENTO)');
   lstSql.Add('               AND (R.CODTIPRECDES = T.CODTIPRECDES)');
   lstSql.Add('               AND (R.IDPESSOA = T.IDPESSOA)');
   lstSql.Add('               AND (R.RECPAG = T.RECPAG)');
   // Alterado por Arnaldo V. Scarin em 26/01/2010
   // SOL: 129555 - Alteração da Disponibilidade Financeira
   // Acerto do Filtro da Data de Vigência da View VW_RATEIODOCUM
   lstSql.Add('               AND (R.EXERCICIO = '+QuotedStr(FormatDateTime('YYYY',dDataRef))+')');
   lstSql.Add('            GROUP BY D.IDFORCLI, D.NUMAPGR, D.COMPLDOCUMENTO, D.NODOCUMENTO, R.IDPLANOPREV, R.IDPATRO, D.IDPESSOA, R.CODCENTRORESPON');
   lstSql.Add(                   '            -- TAG REGNADATA_32_F');
   lstSql.Add(                   '            UNION ALL');
   lstSql.Add(                   '            -- (3.3) REGISTROS NA DATAREF DE CPMF NAO BAIXADOS DE TRANSF ENTRE CONTAS');
   lstSql.Add(                   '            -- TAG REGNADATA_33_I');
   lstSql.Add(                   '            SELECT');
   lstSql.Add(                   '               I.IDFORCLI, 0 AS NUMAPGR, '' '' AS NODOCUMENTO, ');
   if sGrupo = 'Plano/Patro' then
     lstSql.Add(' R.IDPLANOPREV, R.IDPATRO, ')
   else if sGrupo = 'Plano' then
     lstSql.Add(' R.IDPLANOPREV, '' '' AS IDPATRO, ')
   else if sGrupo = 'Patro' then
     lstSql.Add(' '' '' AS IDPLANOPREV, R.IDPATRO, ');
   lstSql.Add(' I.IDPESSOA, '' '' AS CODCENTRORESPON, SUM(R.VLRCPMF) AS SALDO');
   lstSql.Add('            FROM IMPOSTORETIDO  I, RATEIOIMPOSTORETIDO R');
   lstSql.Add('            WHERE   I.DATARETENCAO = TO_DATE('''+DateToStr(dDataRef)+''',''DD/MM/YYYY'')');
   lstSql.Add('                AND I.CODTIPOCUSTAGREG = (SELECT CODTIPOCUSTAGREG FROM PARAMFINANC)');
   lstSql.Add('                AND I.CODDOCUMENTO IS NULL');
   lstSql.Add('                AND I.NUMLOTEMANUAL = 0');
   lstSql.Add('                AND I.CODLANCFINANC IS NOT NULL');
   lstSql.Add('                AND I.IDPESSOA = ' + IntToStr(iPessoa) );
   lstSql.Add('                AND (1 = ' + FFlgDocBaixado + ')');
   lstSql.Add('                AND ((' + sPatro + ' IS NULL) OR (R.IDPATRO = ' + sPatro + '))');
   lstSql.Add('                AND ((' + sPlanoPrev + ' IS NULL) OR (R.IDPLANOPREV = ' + sPlanoPrev + '))');
   lstSql.Add('                AND (I.IDIMPOSTORETIDO = R.IDIMPOSTORETIDO)');
   lstSql.Add('            GROUP BY R.IDPLANOPREV,R.IDPATRO, I.IDPESSOA, I.CODPORTADOR, I.IDFORCLI');
   lstSql.Add('            -- TAG REGNADATA_33_F');
   lstSql.Add('       ) X ');
   if sGrupo = 'Plano/Patro' then
     lstSql.Add('    GROUP BY X.IDFORCLI, X.IDPLANOPREV,X.IDPATRO, X.IDPESSOA ) XX ')
   else if sGrupo = 'Plano' then
     lstSql.Add('    GROUP BY X.IDFORCLI, X.IDPLANOPREV, X.IDPESSOA ) XX ')
   else if sGrupo = 'Patro' then
     lstSql.Add('    GROUP BY X.IDFORCLI,X.IDPATRO, X.IDPESSOA ) XX ');
   lstSql.Add('    WHERE');
   lstSql.Add('       (XX.IDFORCLI = P.IDPESSOA(+))');
   lstSql.Add('    -- TAG REGNADATA_30_F');
   lstSql.Add('    UNION ALL');
   lstSql.Add('     -- (4.0) REGISTROS DE INSS');
   lstSql.Add('     -- TAG REGNADATA_40_I');
   lstSql.Add('     SELECT  DISTINCT');
   lstSql.Add('        DECODE(D.IDFORCLI,-1,'' '',X.RAZAOSOCIAL||'' - INSS'') AS NOMEFORCLI, X.SALDO * -1, DECODE(D.COMPLDOCUMENTO,NULL,TO_CHAR(D.NODOCUMENTO),(TO_CHAR(D.NODOCUMENTO)||''/''||D.COMPLDOCUMENTO)) AS NODOCUMENTO, 0 AS NUMAPGR, ');
   if sGrupo = 'Plano/Patro' then
     lstSql.Add(' R.IDPLANOPREV, R.IDPATRO, ')
   else if sGrupo = 'Plano' then
     lstSql.Add(' R.IDPLANOPREV, '' '' AS IDPATRO, ')
   else if sGrupo = 'Patro' then
     lstSql.Add(' '' '' AS IDPLANOPREV, R.IDPATRO, ');
   lstSql.Add('       3 AS TIPOREG, R.CODCENTRORESPON, D.IDPESSOA, 0 AS NUMLOTE, 0 AS CODLANCFINANC');
   lstSql.Add('     FROM');
   // Alterado por Arnaldo V. Scarin em 25/01/2010
   // SOL: 129555 - Alteração da Disponibilidade Financeira
   // Troca da Tabela RateioDocum por View VW_RATEIODOCUM
   //'        DOCUMENTO D,LANCTODOCUM L,RATEIODOCUM R, TIPORECEBDESEMB T,');
   lstSql.Add('        DOCUMENTO D,LANCTODOCUM L,VW_RATEIODOCUM R, TIPORECEBDESEMB T,');
   lstSql.Add('        (');
   lstSql.Add('         -- (4.1) REGISTROS QUE NAO ESTAO EM GPS');
   lstSql.Add('         -- TAG REGNADATA_41_I');
   lstSql.Add('         SELECT DISTINCT');
   lstSql.Add('            L.DATALANCTO AS DATALANCTO, D.IDFORCLI AS IDFORCLI, P.RAZAOSOCIAL AS RAZAOSOCIAL, D.CODDOCUMENTO, L.NUMLANCTO, DECODE(L.DEBCRE, ''D'', L.VALOR, L.VALOR*-1) AS SALDO,');
   lstSql.Add('            D.OPERACAO, D.NUMFATURA, T.PLACONTA, D.NODOCUMENTO');
   //AL_16
   // Alterado por Arnaldo V. Scarin em 25/01/2010
   // SOL: 129555 - Alteração da Disponibilidade Financeira
   // Troca da Tabela RateioDocum por View VW_RATEIODOCUM
   //'            PESSOA P, DOCUMENTO D, LANCTODOCUM L, TIPOALTERADOR T, RATEIODOCUM R, LANCIRRF N');
   lstSql.Add('         FROM PESSOA P, DOCUMENTO D, LANCTODOCUM L, TIPOALTERADOR T, VW_RATEIODOCUM R, LANCIRRF N');
   lstSql.Add('         WHERE  (L.DATALANCTO >= TO_DATE('''+DateToStr(dDataIniMesAnt)+''',''DD/MM/YYYY''))');
   lstSql.Add('            AND (L.DATALANCTO <= TO_DATE('''+DateToStr(dDataFimMesAnt)+''',''DD/MM/YYYY''))');
   lstSql.Add('            AND (L.OPERACAO      = ''4'')');
   lstSql.Add('            AND (D.IDPESSOA      = ' + IntToStr(iPessoa) + ')');
   lstSql.Add('            AND (1 = ' + FFlgDocBaixado + ')');
   lstSql.Add('            AND (D.RECPAG        = ''P'')');
   lstSql.Add('            AND (L.CODDOCINSS   IS NULL)');
   lstSql.Add('            AND (N.IDDOCINSS IS NULL)');
   lstSql.Add('            AND (NVL(N.VLRINSS,0) <> 0)');
   lstSql.Add('            AND (L.ESTORNO      IS NULL)');
   lstSql.Add('            AND (L.CODALTERADOR IN (SELECT CODALTERADOR FROM ALTXIMPOSTO WHERE CODIMPOSTO = 2))');
   lstSql.Add('            AND ((' + sPatro + ' IS NULL) OR (R.IDPATRO = ' + sPatro + '))');
   lstSql.Add('            AND ((' + sPlanoPrev + ' IS NULL) OR (R.IDPLANOPREV = ' + sPlanoPrev + '))');
   // Alterado por Arnaldo V. Scarin em 26/01/2010
   // SOL: 129555 - Alteração da Disponibilidade Financeira
   // Acerto do Filtro da Data de Vigência da View VW_RATEIODOCUM
   lstSql.Add('            AND (R.EXERCICIO = '+QuotedStr(FormatDateTime('YYYY',dDataRef))+')');
   lstSql.Add('            AND (D.CODDOCUMENTO  = L.CODDOCUMENTO)');
   lstSql.Add('            AND (P.IDPESSOA      = D.IDFORCLI)');
   lstSql.Add('            AND (L.CODALTERADOR  = T.CODALTERADOR)');
   lstSql.Add('            AND (D.CODDOCUMENTO = R.CODDOCUMENTO)');
   lstSql.Add('            AND (D.CODDOCUMENTO  = N.CODDOCUMENTO(+))');
   //AL_16
   lstSql.Add('            AND (D.CODDOCUMENTO = N.CODDOCUMENTO)');
   lstSql.Add('         -- TAG REGNADATA_41_F');
   //AL_19
   lstSql.Add('         ) X');
   lstSql.Add('     WHERE  (TO_DATE('''+DateToStr(dDataINSS)+''',''DD/MM/YYYY'') = TO_DATE('''+DateToStr(dDataRef)+''',''DD/MM/YYYY''))');
   lstSql.Add('        AND ((' + sPatro + ' IS NULL) OR (R.IDPATRO = ' + sPatro + '))');
   lstSql.Add('        AND ((' + sPlanoPrev + ' IS NULL) OR (R.IDPLANOPREV = ' + sPlanoPrev + '))');
   lstSql.Add('        AND ((' + sFlgIndRecDes + ' IS NULL) OR (NVL(T.FLGINDICARECDES,''N'') = ' + sFlgIndRecDes + '))');
   lstSql.Add('        AND (D.CODDOCUMENTO = X.CODDOCUMENTO)');
   lstSql.Add('        AND (D.CODDOCUMENTO = L.CODDOCUMENTO)');
   lstSql.Add('        AND (D.CODDOCUMENTO = R.CODDOCUMENTO)');
   lstSql.Add('        AND (L.NUMLANCTO = X.NUMLANCTO)');
   lstSql.Add('        AND (R.CODTIPRECDES = T.CODTIPRECDES)');
   lstSql.Add('        AND (R.IDPESSOA = T.IDPESSOA)');
   lstSql.Add('        AND (R.RECPAG = T.RECPAG)');
   // Alterado por Arnaldo V. Scarin em 26/01/2010
   // SOL: 129555 - Alteração da Disponibilidade Financeira
   // Acerto do Filtro da Data de Vigência da View VW_RATEIODOCUM
   lstSql.Add('        AND (R.EXERCICIO = '+QuotedStr(FormatDateTime('YYYY',dDataRef))+')');
   lstSql.Add('     -- TAG REGNADATA_40_F');
   lstSql.Add('   ) U');
   lstSql.Add('WHERE  ((' + sPatro + ' IS NULL) OR (U.IDPATRO = ' + sPatro + '))');
   lstSql.Add('   AND ((' + sPlanoPrev + ' IS NULL) OR (U.IDPLANOPREV = ' + sPlanoPrev + ')) ');
   if sGrupo = 'Plano/Patro' then
   begin
    lstSql.Add('   AND (U.IDPATRO = P.IDPESSOA(+))');
    lstSql.Add('   AND (U.IDPLANOPREV = PT.IDPLANOPREV(+))')
   end
   else if sGrupo = 'Plano' then
     lstSql.Add('    AND (U.IDPLANOPREV = PT.IDPLANOPREV(+))')
   else if sGrupo = 'Patro' then
     lstSql.Add('    AND (U.IDPATRO = P.IDPESSOA(+)) ');
   lstSql.Add('   AND (U.CODCENTRORESPON  = CN.CODCENTRORESPON(+))');
   lstSql.Add('   AND (U.IDPESSOA  = CN.IDPESSOA(+)) ');
   //Marilza Colpani - SOL: 122335/Kintana: 598524 - início
   if sAtivPlano <> '' then
     lstSql.Add('   AND (PT.ATIVO = '+ QuotedStr(sAtivPlano) + ')');
   //Marilza Colpani - SOL: 122335/Kintana: 598524 - início

   lstSql.Add('-- FIM DA QRYANALITICA');
   lstSql.Add('-- TAG QRYANALIT_F');
   lstSql.Add(' ');
   if sTipoDisp = 'Sintetica' then
   begin
     lstSql.Add('   )UU');
     lstSql.Add('GROUP BY UU.GRUPO, UU.NOMEGRUPO');
          //AL_11
          //AL_14
     lstSql.Add('ORDER BY TIPO, UU.NOMEGRUPO ');
   end;
   With lstSql do
   begin
     FSqlRetorno := Text;
     CmDebugToFile(Text,'c:\planus\temp\qryDisponibilidade.txt');
     if sTipoDisp = 'Sintetica' then
       SaveToFile('c:\planus\temp\qryDispOperSintetica.sql')
     else
       SaveToFile('c:\planus\temp\qryDispOperAnalitica.sql');
     Clear;
     Free;
   end;
   Result := GetDataPacket(FSqlRetorno);
end;



//AL_8
function TCtrlDisponFinanc_CGPC.ListDispDebug(sSqlDebug : String): OleVariant;
begin
   Result := GetDataPacket(sSqlDebug);
end;



end.
