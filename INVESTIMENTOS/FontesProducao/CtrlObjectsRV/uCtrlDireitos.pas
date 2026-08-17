//*****************************************************************************//
//N. SIG..........: SIG TIBERO
//Data............: 
//Responsável.....: Everson Luiz Pereira da Cunha
//Descrição.......: Ajustes para adequação ao TIBERO
//--------------------------------------------------------------------------------
// Data      : 26/04/2010
// SOL       : 134432
// Motivo    : Foi somado as colunas quantidade, valor previsto, valor recebido
//             e valor cancelado a coluna remuneração, para a correção
//             da totalização das colunas acima.
//*****************************************************************************//
// Data      : 10/08/2007
// Código    : AL_3
// Pendência : 24957
// SOL       : 56201
// Motivo    : Implementação da List Consolidado por Investimento
//             Criação de uma Função SqlAnunciosCanc para montar o Sql
//******************************************************************************
// Data     : 03/11/2006
// Código   : AL_2
// Pendencia: 23670
// SOL      :
// Desc     : Segregação de Planos
//******************************************************************************
// Data     : 22/05/2006
// Código   : AL_1
// Pendencia: 22375
// SOL      : 43236
// Desc     : Implementação da Ctrl para Desmenbramento do Relatório de Cancelamento de Anúncios
//******************************************************************************

unit uCtrlDireitos;

interface

uses sysutils, uCmControlObject, uCmDbObject, DB, uDataBase, DbClient, uCMClientDataSet,
     uCtrlPadroes, uCmSqlParams,Classes
     {$IFNDEF VERSAO0505} ,uCMTypes {$ENDIF};

type
   TCtrlDireitos = Class(TCmControlObject)

   private
      _sql : TCMSqlParams;

      //AL_3
      Function SqlAnunciosCanc( dDataIni, dDataFim: TdateTime;
                                iPlanPrev: Integer = -1;
                                iInvestimento: Integer = -1;
                                iTipoOper: Integer = -1;
                                iSegmentacao: Integer = -1): String;
   public
      constructor Create; override;
      destructor Destroy; override;

      function ListaRelAnunciosCanc(dDataIni, dDataFim: TdateTime;
                                    iPlanPrev: Integer = -1;
                                    iInvestimento: Integer = -1;
                                    iTipoOper: Integer = -1;
                                    iSegmentacao: Integer = -1): OleVariant;
      // AL_3
      function ListaRelAnunciosCancCon(dDataIni, dDataFim: TdateTime;
                                       iPlanPrev: Integer = -1;
                                       iInvestimento: Integer = -1;
                                       iTipoOper: Integer = -1;
                                       iSegmentacao: Integer = -1): OleVariant;
   protected

   end;

implementation

{ TCtrlDireitos }

constructor TCtrlDireitos.Create;
begin
   inherited;
   _sql               := TCmSqlParams.Create(nil);
   _sql.ControlObject := Self;
end;

destructor TCtrlDireitos.Destroy;
begin
   inherited;
  _sql.Free;
end;

function TCtrlDireitos.ListaRelAnunciosCanc(dDataIni, dDataFim: TdateTime;
                                            iPlanPrev: Integer = -1;
                                            iInvestimento: Integer = -1;
                                            iTipoOper: Integer = -1;
                                            iSegmentacao: Integer = -1): OleVariant;
var sSQL: String;
    Lista: TStringList; // AL_3
begin
   //AL_3  - Este Sql deverá ser montado na função SqlAnunciosCanc
   sSql := SqlAnunciosCanc(dDataIni,dDataFim,iPlanPrev,iInvestimento,iTipoOper,iSegmentacao); //Renan Cristiano Sol 131501/1101 Kintana 760170

   Result := GetDataPacket(sSql);

end;

// AL_3
function TCtrlDireitos.ListaRelAnunciosCancCon(dDataIni, dDataFim: TdateTime;
                                               iPlanPrev: Integer = -1;
                                               iInvestimento: Integer = -1;
                                               iTipoOper: Integer = -1;
                                               iSegmentacao: Integer = -1): OleVariant;
var sSQL: String;
    Lista: TStringList;
begin

   sSql := 'SELECT * FROM (  '+ #13 +
           SqlAnunciosCanc(dDataIni,dDataFim,iPlanPrev,iInvestimento,iTipoOper,iSegmentacao)+ //Renan Cristiano Sol 131501/1101 Kintana 760170
           ' )  '+ #13 +
           'ORDER BY IDSEGMENTACAO,DESCINVESTIMENTO,DESCTIPOOPERACAO,DATAEX,BOLETA ' ; //Renan Cristiano Sol 131501/1101 Kintana 760170

   Result := GetDataPacket(sSql);

end;

function TCtrlDireitos.SqlAnunciosCanc(dDataIni, dDataFim: TdateTime; iPlanPrev, iInvestimento, iTipoOper, iSegmentacao: Integer): String;
begin
    Result := 'SELECT OI.NUMDOCUMENTO AS BOLETA, PP.PLANPRVCONTABPATRO, TP.DESCTIPOOPERACAO,                     ' + #10 + #13 +
        '       IV.DESCINVESTIMENTO, CI.DESCCARTINVEST, MB.SIGLAMOTBLOQ, MB.DESCMOTBLOQ,                   ' + #10 + #13 +
        '       CAN.DATAOPERACAO,                                                                          ' + #10 + #13 +
        '       OD.DATAOPER AS DATAEX, OD.DATACOM AS DATAPREVISTA, OD.DATAEX AS DATABASE,                  ' + #10 + #13 +
        '       DECODE(OI.IDTIPOOPERACAO, -70, ''Comum'', ''Investimento'') AS CONTA,                      ' + #10 + #13 +
        '       NVL(OI.QTDEOPERACAO,0) AS QTDPREVISTA,                                                     ' + #10 + #13 +
        '       (NVL(OI.VLROPERACAO,0) + NVL(OI.VLRREMUNERACAO,0))  AS VALORPREVISTO,                      ' + #10 + #13 + //
        '       NVL(REC.QTDEOPERACAO,0) AS QTDRECEBIDA,                                                    ' + #10 + #13 +
        '       NVL(CAN.QTDEOPERACAO,0) AS QTDCANCELADA,                                                   ' + #10 + #13 +
        '       OI.PRECOUNITOPERACAO,                                                                      ' + #10 + #13 +
        '       NVL(OI.VLROPERACAO,0) - NVL(REC.QTDEOPERACAO,0) - NVL(CAN.QTDEOPERACAO,0) AS VLROPERACAO,  ' + #10 + #13 +
//        '       (PP.PLANPRVCONTABPATRO || OD.DATAEX || TP.DESCTIPOOPERACAO || OI.IDOPERACAODIREITO) AS GRUPO, ' + #10 + #13 +                //SIG TIBERO - Everson Luiz
        '       (PP.PLANPRVCONTABPATRO || substr(OD.DATAEX, 0, 10) || TP.DESCTIPOOPERACAO || OI.IDOPERACAODIREITO) AS GRUPO, ' + #10 + #13 +   //SIG TIBERO - Everson Luiz
        '       ''0'' AS COR, SM.DESCSEGMENTACAO, SM.IDSEGMENTACAO                                         ' + #10 + #13 +
        'FROM OPERACAOINVEST OI, OPERACAODIREITO OD, PARAMINVEST PI, TIPOOPERACAO TP,                      ' + #10 + #13 +
        '     INVESTIMENTO IV, CARTEIRAINVEST CI, MOTIVOBLOQUEIO MB, VWPLANPREVCTBPATR PP,                 ' + #10 + #13 +
        //Renan Cristiano Sol 131501/1101 Kintana 760170 Inicio
        '     EMISSOR EM, SEGMENTACAOMERCADO SM,                                                          ' + #10 + #13 +
        //Renan Cristiano Sol 131501/1101 Kintana 760170 Fim

        '     (SELECT OI1.IDOPERACAOORIGEM, SUM(OI1.VLROPERACAO) AS QTDEOPERACAO                           ' + #10 + #13 +
        '      FROM OPERACAOINVEST OI1, PARAMINVEST PI1                                                    ' + #10 + #13 +
        '      WHERE OI1.IDOPERACAOORIGEM IS NOT NULL                                                      ' + #10 + #13 +
        '        AND OI1.IDTIPOOPERACAO IN (PI1.IDTIPOOPERDIRDIV, PI1.IDTIPOOPERDIRDIV + 10000,            ' + #10 + #13 +
        '                                   PI1.IDTIPOOPERDIRJUR, PI1.IDTIPOOPERDIRJUR + 10000,            ' + #10 + #13 +
        '                                   PI1.IDTIPOOPERDIRMUL, PI1.IDTIPOOPERDIRMUL + 10000)            ' + #10 + #13 +
        '        AND (OI1.DATAOPERACAO <= TO_DATE(' + QuotedStr(DateToStr(dDataFim)) + ', ' + QuotedStr('DD/MM/YYYY') + ')) ' + #10 + #13 +
        '      GROUP BY IDOPERACAOORIGEM) REC,                                                             ' + #10 + #13 +

        '     (SELECT OI1.IDOPERACAOORIGEM, SUM(OI1.VLROPERACAO + OI1.VLRREMUNERACAO) AS QTDEOPERACAO, OI1.DATAOPERACAO ' + #10 + #13 +  //
        '      FROM OPERACAOINVEST OI1, PARAMINVEST PI1                                                    ' + #10 + #13 +
        '      WHERE OI1.IDOPERACAOORIGEM IS NOT NULL                                                      ' + #10 + #13 +
        '        AND OI1.IDTIPOOPERACAO IN (-170, -10170)                                                  ' + #10 + #13 +
        '        AND (OI1.DATAOPERACAO BETWEEN TO_DATE(' + QuotedStr(DateToStr(dDataIni)) + ', ' + QuotedStr('DD/MM/YYYY') + ') AND  '+ #10 + #13 +
        '                                      TO_DATE(' + QuotedStr(DateToStr(dDataFim)) + ', ' + QuotedStr('DD/MM/YYYY') + ')) ' + #10 + #13 +
        '      GROUP BY OI1.IDOPERACAOORIGEM, OI1.DATAOPERACAO) CAN                                        ' + #10 + #13 +

        'WHERE OI.IDCARTEIRAGERENC IS NULL                                                                 ' + #10 + #13 +
        '  AND OI.IDTIPOOPERACAO IN (-70, -10070)                                                          ' + #10 + #13 +
        '  AND OI.ORIGDEST IS NOT NULL                                                                     ';
        //AL_2
        if iPlanPrev > 0 then
           Result := Result + '            AND (OI.IDPLANPREVCTBPATR = ' + IntToStr(iPlanPrev) + ') ';
        if iInvestimento > 0 then
           Result := Result + '            AND (OI.IDINVESTIMENTO = ' + IntToStr(iInvestimento) + ') ';
        if iTipoOper > 0 then
           Result := Result + '            AND (TP.IDTIPOOPERACAO = ' + IntToStr(iTipoOper) + ') ';
        //Renan Cristiano Sol 131501/1101 Kintana 760170 Inicio
        if iSegmentacao > 0 then
           Result := Result + '            AND (SM.IDSEGMENTACAO = ' + IntToStr(iSegmentacao) + ')';
        //Renan Cristiano Sol 131501/1101 Kintana 760170 Fim

        Result := Result + '  AND OD.IDTIPOOPERACAO IN (PI.IDTIPOOPERDIRDIV, PI.IDTIPOOPERDIRJUR, PI.IDTIPOOPERDIRMUL)        ' + #13 +
        '  AND OI.IDOPERACAODIREITO = OD.IDOPERACAODIREITO                                                 ' + #13 +
        '  AND OD.IDTIPOOPERACAO = TP.IDTIPOOPERACAO                                                       ' + #13 +
        '  AND OI.IDINVESTIMENTO = IV.IDINVESTIMENTO                                                       ' + #13 +
        '  AND OI.IDCARTEIRAINVEST = CI.IDCARTEIRAINVEST                                                   ' + #13 +
        '  AND OI.IDMOTIVOBLOQUEIO = MB.IDMOTIVOBLOQUEIO(+)                                                ' + #13 +
        '  AND OI.IDOPERACAOINVEST = REC.IDOPERACAOORIGEM(+)                                               ' + #13 +
        '  AND OI.IDPLANPREVCTBPATR = PP.IDPLANPREVCTBPATR                                                 ' + #13 +
        '  AND OI.IDOPERACAOINVEST = CAN.IDOPERACAOORIGEM                                                  ' + #13 +
        //Renan Cristiano Sol 131501/1101 Kintana 760170 Inicio
        '  AND IV.IDEMISSOR = EM.IDEMISSOR                                                                 ' + #13 +
        '  AND EM.IDSEGMENTACAO = SM.IDSEGMENTACAO                                                         ' + #13 +
        //Renan Cristiano Sol 131501/1101 Kintana 760170 Fim
        'ORDER BY PP.PLANPRVCONTABPATRO, SM.IDSEGMENTACAO, OD.DATAEX, TP.DESCTIPOOPERACAO, OI.IDOPERACAODIREITO, OI.NUMDOCUMENTO, IV.DESCINVESTIMENTO ';

end;

end.



