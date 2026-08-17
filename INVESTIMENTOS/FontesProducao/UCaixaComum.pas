//******************************************************************************
// Data      : 31/08/2006
// Codigo    : AL_6
// Motivo    : Implementação do plano/patrocinador
//******************************************************************************
// Data      : 08/08/2006
// Código    : AL_5
// Pendencia : 23026
// Motivo    : Retirado a critica para buscar apenas tipo de operação com ID maior q zero
//******************************************************************************
// Data      : 08/08/2006
// Código    : AL_4
// Motivo    : Alterada a busca das operações de resgate da PEDIDOFUNDO para OPERACAOFUNDO
//******************************************************************************
// Data      : 18/04/2006
// Código    : AL_3
// Motivo    : Melhorar na performance da rotina MontaQryValorizacaoFACFIF.
// ******************************************************************************
// Data     : 20/12/2004
// Código   : AL_2
// Motivo   : Implementação a critica de valor para atualizar saldo de despesas
//            qdo for diferente de zero.
// ******************************************************************************
// Data     : 26/11/2004
// Código   : AL_1
// Motivo   : Implementação da rotina para não alterar o Saldo
//******************************************************************************
// Data     : 14/04/2004
// Origem   : FUNCEF
// Função   : AtualizaSaldoDasOperacoes
// Motivo   : Atualizar sempre o Saldo para as operações.
//******************************************************************************

unit UCaixaComum;


interface

Uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  Db, USistema, Wwquery, OleCtrls, vcf1, IvDictio, IvMulti, IvEMulti,
  MAHlpBtn, StdCtrls, TB97Tlbr, TB97, ExtCtrls;


type

   TCaixaComum = Class(TObject)

   private

//

   public

      //AL_3
      //Monta a query de valorização do FAQ/FIF
      procedure MontaQryValorizacaoFACFIF(sDataIni, sDataFim, sTipoOpeApl, sTipoOpeResg,
                                          sTipoInvest, sPlanoPrev : String);

      //Busca saldo do caixa
      function  BuscaSaldoCaixa(dData        : TDateTime;
                                idCarteiraP, idCarteiraG, iPlanoPrev : Integer;
                                sTipMovCaixa : String) : Currency;

      //Calcula a valorização referente ao saldo de um dia para o outros dos Fundos FAQ/FIC
      function  CalculaValorizacaoFACFIF(sDataIni, sDataFim, sPlanoPrev, sTipoInvest : String) : Double;

      //Com a Valoriza Atualiza o Saldo do Caixa e Grava
      function  ValorizacaoSaldoCaixa(sDataAnt, sDataOper : String;
                                      idCarteiraP, idCarteiraG, iPlanoPrev : Integer;
                                      dValorizacao : Double) : Boolean;

      //Grava eventos na tabela HISTCAIXA
      function  InsertHistCaixa(dData               : TDateTime;
                                idCarteiraP, idCarteiraG, idCarteiraXEvento,
                                idOperacaoInvest, idOperacaoDireito, iPlanoPrev : Integer;
                                sTipMovCaixa, sDescInvest      : String;
                                fValor, fNovoSaldo  : Currency) : Byte;

      //Busca valor do caixa
      //AL_6
      function  BuscaValorCaixa(dData        : TDateTime;
                                idCarteiraP, idCarteiraG, iEvento, iPlanoPrev : Integer) : Currency;

      //Busca eventos de caixa
      function  GravaEventosCaixa(dDataOper  : TDateTime;
                                  iPlanoPrev, idTipoOperacao,idTipoDespInvest,
                                  idCarteiraP,idCarteiraG,
                                  idOperacaoInvest,idOperacaoDireito: Integer;
                                  sDescInvest      : String;
                                  fValor           : Currency;
                                  var fSaldoCaixa  : Currency) : Boolean;

      //Atualiza os eventos na tabela HistCaixa e o Saldo das mesmas
      function  AtualizaHistCaixa(dData            : TDateTime;
                                  idCarteiraP, idCarteiraG, idCarteiraXEvento,
                                  idOperacaoInvest,idOperacaoDireito, iPlanoPrev : Integer;
                                  sDescInvest      : String;
                                  fValor           : Currency;
                                  var fSaldoCaixa  : Currency)  : Byte;

      //Atualiza os saldos das operações realizada no dia
      //AL_6
      function  AtualizaSaldoDasOperacoes(dData        : TDateTime;
                                          idCarteiraP, idCarteiraG, iPlanoPrev : Integer) : Boolean;

      //Atualiza as operações e despesas das Ordens de Renda Variável de D-3 no caixa
      function AtualizaOperacaoDespesasRV(dData        : TDateTime) : Boolean;

      //Funções dde apuração do CPMF
      function  PeriodoCPMF(dDataOper : TDateTime; var dDataIni, dDataFim : TDateTime) : Byte;

      //AL_6
   end;

var
  CaixaComum : TCaixaComum;

implementation

uses
  DCaixaComum, UOperComum, uDataBase, UCotaComum, uMensErro, UProvisaoComum, UDiasUteisInv,
  UImpostos, DCotaComum, DBaseDados;

//AL_3
procedure TCaixaComum.MontaQryValorizacaoFACFIF(sDataIni, sDataFim, sTipoOpeApl, sTipoOpeResg,
                                                sTipoInvest, sPlanoPrev : String);
begin
   With dtmCaixaComum.QryValorizacao Do
   begin
      Sql.Clear;
      Sql.Add('SELECT DATA, SUM(QUANTIDADE) AS QUANTIDADE, SUM(VLRCOTA) AS VLRCOTA, SUM(SALDO) AS SALDO,');
      Sql.Add('SUM(SALDOCOT) AS SALDOCOT, SUM(VLRAPLICACAO) AS VLRAPLICACAO, SUM(VLRRESGATE) AS VLRRESGATE,');
      Sql.Add('IDRELATORIO');
      Sql.Add('FROM (');
      Sql.Add('   SELECT SALDO.DATAMOVFUNDO AS DATA,0 AS QUANTIDADE, 0 AS VLRCOTA, SALDO.SALDOVLRFUNDO AS SALDO,');
      Sql.Add('         (SALDO.SALDOVLRFUNDO - NVL(APL.VLRMOVFUNDO,0) + NVL(RESG.VLRMOVFUNDO,0)) AS SALDOCOT,');
      Sql.Add('          NVL(APL.VLRMOVFUNDO,0) AS VLRAPLICACAO , NVL(RESG.VLRMOVFUNDO,0) AS VLRRESGATE, 1 AS IDRELATORIO');
      Sql.Add('   FROM');
      Sql.Add('     (SELECT SUM(H1.SALDOQTDCOTAS) AS SALDOQTDCOTAS, SUM(H1.SALDOVLRFUNDO) AS SALDOVLRFUNDO, H1.DATAMOVFUNDO');
      Sql.Add('      FROM HISTFUNDO H1');
      Sql.Add('      WHERE (H1.IDHISTFUNDO IN');
      Sql.Add('               (SELECT MAX(H.IDHISTFUNDO) AS IDHISTFUNDO');
      Sql.Add('                FROM HISTFUNDO H ');
      Sql.Add('                WHERE (H.IDTIPOINVEST = ('+sTipoInvest+')) AND');
      Sql.Add('               (H.IDPLANPREVCTBPATR   = ('+sPlanoPrev +')) AND');
      //AL_6
      Sql.Add('               (H.IDFUNDOINVEST      >  0)   AND');
      Sql.Add('               (H.DATAAPLICACAO      <= TO_DATE('''+sDataFim+''',''DD/MM/YYYY'')) AND');
      Sql.Add('               (H.DATAMOVFUNDO       >= TO_DATE('''+sDataIni+''',''DD/MM/YYYY'')) AND');
      Sql.Add('               (H.DATAMOVFUNDO       <= TO_DATE('''+sDataFim+''',''DD/MM/YYYY'')) AND');
      Sql.Add('               (H.TIPMOVFUNDO        <> ''PIR'')               ');
      Sql.Add('                GROUP BY H.IDTIPOINVEST, H.IDPLANPREVCTBPATR, H.IDFUNDOINVEST, H.DATAAPLICACAO, H.DATAMOVFUNDO)) AND');
      Sql.Add('            (H1.SALDOQTDCOTAS > 0)');
      Sql.Add('      GROUP BY H1.DATAMOVFUNDO) SALDO,');
      Sql.Add('     (SELECT OP.DATAOPERACAO AS DATAMOVFUNDO, SUM(OP.VLROPERACAO) AS VLRMOVFUNDO');
      Sql.Add('      FROM  OPERACAOFUNDO OP');
      Sql.Add('      WHERE OP.IDTIPOINVEST       = ('+sTipoInvest+') AND');
      Sql.Add('            OP.IDPLANPREVCTBPATR  = ('+sPlanoPrev +') AND');
      //AL_6
      Sql.Add('            OP.IDFUNDOINVEST     >  0   AND');
      Sql.Add('            OP.DATAOPERACAO      >= TO_DATE('''+sDataIni+''',''DD/MM/YYYY'') AND');
      Sql.Add('            OP.DATAOPERACAO      <= TO_DATE('''+sDataFim+''',''DD/MM/YYYY'') AND');
      Sql.Add('            OP.IDTIPOOPERACAO    IN ('+sTipoOpeApl+') ');
      Sql.Add('      GROUP BY OP.DATAOPERACAO) APL,');
      //AL_4
      Sql.Add('     (SELECT OP.DATAOPERACAO AS DATAMOVFUNDO, SUM(OP.VLROPERACAO) AS VLRMOVFUNDO');
      Sql.Add('      FROM  OPERACAOFUNDO OP');
      Sql.Add('      WHERE OP.IDTIPOINVEST       = ('+sTipoInvest+') AND');
      Sql.Add('            OP.IDPLANPREVCTBPATR  = ('+sPlanoPrev +') AND');
      //AL_6
      Sql.Add('            OP.IDFUNDOINVEST     >  0   AND');
      Sql.Add('            OP.DATAOPERACAO      >= TO_DATE('''+sDataIni+''',''DD/MM/YYYY'') AND');
      Sql.Add('            OP.DATAOPERACAO      <= TO_DATE('''+sDataFim+''',''DD/MM/YYYY'') AND');
      Sql.Add('            OP.IDTIPOOPERACAO    IN ('+sTipoOpeResg+') ');
      Sql.Add('      GROUP BY OP.DATAOPERACAO) RESG');
      Sql.Add('WHERE');
      Sql.Add('   (APL.DATAMOVFUNDO(+)   = SALDO.DATAMOVFUNDO) AND');
      Sql.Add('   (RESG.DATAMOVFUNDO(+)  = SALDO.DATAMOVFUNDO)');
      Sql.Add('GROUP BY SALDO.DATAMOVFUNDO, APL.VLRMOVFUNDO, RESG.VLRMOVFUNDO, SALDO.SALDOVLRFUNDO, SALDO.SALDOQTDCOTAS');
      Sql.Add(')GROUP BY DATA, IDRELATORIO');
      Open;
   end;
end;

function TCaixaComum.BuscaSaldoCaixa(dData        : TDateTime;
                                     idCarteiraP, idCarteiraG, iPlanoPrev   : Integer;
                                     sTipMovCaixa : String): Currency;
begin
   with dtmCaixaComum do
   begin
      //Verifica movimento no dia
      If sTipMovCaixa = 'OPE' Then
      begin
         OperComum.LimpaParametros(QryVerRegSaldo);
         QryVerRegSaldo.Close;
         QryVerRegSaldo.ParamByName('DATAHISTCAIXA').AsDateTime      := dData;
         QryVerRegSaldo.ParamByName('TIPMOVCAIXA').AsString          := sTipMovCaixa;
         QryVerRegSaldo.ParamByName('IDCARTEIRAINVEST').AsInteger    := idCarteiraP;
         If idCarteiraG <> 0 Then
            QryVerRegSaldo.ParamByName('IDCARTEIRAGERENC').AsInteger := idCarteiraG;
         //AL_6
         QryVerRegSaldo.ParamByName('IDPLANPREVCTBPATR').AsInteger   := iPlanoPrev;
         QryVerRegSaldo.Open;

         //Não tem movimento no dia, busca o próximo saldo
         If QryVerRegSaldo.IsEmpty Then
            sTipMovCaixa  := '';
      end;

      QrySaldoCaixa.Close;
      QrySaldoCaixa.Sql.Clear;
      QrySaldoCaixa.Sql.Add(' SELECT * ');
      QrySaldoCaixa.Sql.Add(' FROM   HISTCAIXA HC');
      QrySaldoCaixa.Sql.Add(' WHERE  HC.IDHISTCAIXA IN');
      QrySaldoCaixa.Sql.Add('       (SELECT MAX(IDHISTCAIXA)');
      QrySaldoCaixa.Sql.Add('        FROM   HISTCAIXA');
      //AL_6
      QrySaldoCaixa.Sql.Add('        WHERE  ');
      QrySaldoCaixa.Sql.Add('            IDPLANPREVCTBPATR = '+IntToStr(iPlanoPrev));
      QrySaldoCaixa.Sql.Add('        AND IDCARTEIRAINVEST  = '+IntToStr(idCarteiraP)+'');
      If idCarteiraG > 0 Then
         QrySaldoCaixa.Sql.Add('     AND IDCARTEIRAGERENC  = '+IntToStr(idCarteiraG)+'')
      else
         QrySaldoCaixa.Sql.Add('     AND IDCARTEIRAGERENC > 0 ');
      QrySaldoCaixa.Sql.Add('        AND DATAHISTCAIXA     = ');
      QrySaldoCaixa.Sql.Add('           (SELECT MAX(DATAHISTCAIXA) FROM HISTCAIXA WHERE');
      QrySaldoCaixa.Sql.Add('                IDPLANPREVCTBPATR = '+IntToStr(iPlanoPrev));
      QrySaldoCaixa.Sql.Add('            AND IDCARTEIRAINVEST  = '+IntToStr(idCarteiraP)+'');
      If idCarteiraG > 0 Then
         QrySaldoCaixa.Sql.Add('         AND IDCARTEIRAGERENC  = '+IntToStr(idCarteiraG)+'')
      else
         QrySaldoCaixa.Sql.Add('         AND IDCARTEIRAGERENC > 0 ');
      If sTipMovCaixa = '' Then
      begin
         QrySaldoCaixa.Sql.Add('         AND DATAHISTCAIXA    <  TO_DATE('''+DateToStr(dData)+''',''DD/MM/YYYY'') ');
         QrySaldoCaixa.Sql.Add('         AND TIPMOVCAIXA       = ''ATU''');
      end
      else
      begin
         QrySaldoCaixa.Sql.Add('         AND DATAHISTCAIXA    <= TO_DATE('''+DateToStr(dData)+''',''DD/MM/YYYY'') ');
         QrySaldoCaixa.Sql.Add('         AND TIPMOVCAIXA       = '''+sTipMovCaixa+''' ');
      end;
      QrySaldoCaixa.Sql.Add(')');
      If sTipMovCaixa <> '' Then
         QrySaldoCaixa.Sql.Add('     AND TIPMOVCAIXA       = '''+sTipMovCaixa+''' ');
      QrySaldoCaixa.Sql.Add(')');
      QrySaldoCaixa.Open;

      Result := QrySaldoCaixa.FieldByName('SLDHISTCAIXA').AsFloat;

      If (QrySaldoCaixa.FieldByName('DATAHISTCAIXA').AsDateTime < dData) And
         (sTipMovCaixa = 'ATU') Or (Result = 0) Then
      Begin
         QrySaldoCaixa.Close;
         QrySaldoCaixa.Sql.Clear;
         QrySaldoCaixa.Sql.Add(' SELECT * ');
         QrySaldoCaixa.Sql.Add(' FROM   HISTCAIXA HC');
         QrySaldoCaixa.Sql.Add(' WHERE  HC.IDHISTCAIXA IN');
         //AL_6
         QrySaldoCaixa.Sql.Add('       (SELECT MAX(IDHISTCAIXA)');
         QrySaldoCaixa.Sql.Add('        FROM HISTCAIXA WHERE ');
         QrySaldoCaixa.Sql.Add('            IDPLANPREVCTBPATR = '+IntToStr(iPlanoPrev));
         QrySaldoCaixa.Sql.Add('        AND IDCARTEIRAINVEST  = '+IntToStr(idCarteiraP));
         If idCarteiraG <> 0 Then
            QrySaldoCaixa.Sql.Add('     AND IDCARTEIRAGERENC  = '+IntToStr(idCarteiraG))
         Else
            QrySaldoCaixa.Sql.Add('     AND IDCARTEIRAGERENC >  0 ');
         QrySaldoCaixa.Sql.Add('        AND DATAHISTCAIXA     = ');
         QrySaldoCaixa.Sql.Add('           (SELECT MAX(DATAHISTCAIXA) FROM HISTCAIXA WHERE');
         QrySaldoCaixa.Sql.Add('                IDPLANPREVCTBPATR = '+IntToStr(iPlanoPrev));
         QrySaldoCaixa.Sql.Add('            AND IDCARTEIRAINVEST  = '+IntToStr(idCarteiraP));
         If idCarteiraG <> 0 Then
            QrySaldoCaixa.Sql.Add('         AND IDCARTEIRAGERENC  = '+IntToStr(idCarteiraG))
         Else
            QrySaldoCaixa.Sql.Add('         AND IDCARTEIRAGERENC >  0 ');
         QrySaldoCaixa.Sql.Add('            AND DATAHISTCAIXA    <  TO_DATE('''+DateToStr(dData)+''',''DD/MM/YYYY'')');
         QrySaldoCaixa.Sql.Add('        ) )');
         QrySaldoCaixa.Open;

         Result := QrySaldoCaixa.FieldByName('SLDHISTCAIXA').AsFloat;
      end;
      QrySaldoCaixa.Close;
      QryVerRegSaldo.Close;
   end;
end;

function TCaixaComum.CalculaValorizacaoFACFIF(sDataIni, sDataFim, sPlanoPrev, sTipoInvest : String) : Double;
var
   sTipoOpeResg, sTipoOpeApl : String;
   fValorizacao, fQtdCotas   : Double;
begin
   Result := 0;

   With DtmCaixaComum Do
   begin
      //AL_3

      //AL_5
      // Busca dados do Tipo de Operacao - Aplicação
      FazQuery(qryAuxiliar,'SELECT * FROM TIPOOPERACAO WHERE IDTIPOINVEST IN (' + sTipoInvest + ')' +
                           ' AND (CODTIPDOC IS NOT NULL)'+
                           ' AND (NATUREZAOPERACAO =  ''A'')');
      while not qryAuxiliar.Eof do
      begin
         //Busca id's de operação da aplicação do FAQ e FIF
         sTipoOpeApl := sTipoOpeApl + qryAuxiliar.FieldByName('IDTIPOOPERACAO').AsString + ', ';
         qryAuxiliar.Next;
      end;
      Delete(sTipoOpeApl,Length(sTipoOpeApl)-1,2);

      //AL_5
      // Busca dados do Tipo de Operacao - Resgate
      FazQuery(qryAuxiliar,'SELECT * FROM TIPOOPERACAO WHERE IDTIPOINVEST IN (' + sTipoInvest + ')' +
                   ' AND (CODTIPDOC IS NOT NULL)'+
                   ' AND (NATUREZAOPERACAO =  ''D'')');
      while not qryAuxiliar.Eof do
      begin
         //Busca id's de operação do resgate do FAQ e FIF
         sTipoOpeResg := sTipoOpeResg + qryAuxiliar.FieldByName('IDTIPOOPERACAO').AsString + ', ';
         qryAuxiliar.Next;
      end;
      Delete(sTipoOpeResg,Length(sTipoOpeResg)-1,2);

      //AL_3
      //Monta a query de saldo dos FAQ e FIF
      MontaQryValorizacaoFACFIF(sDataIni, sDataFim,
                                sTipoOpeApl, sTipoOpeResg, sTipoInvest, sPlanoPrev);

      if Not QryValorizacao.IsEmpty Then
      begin
         //Inicio do calculo da valorização
         fQtdCotas := OperComum.DivValorZero(QryValorizacao.FieldByName('SALDO').AsFloat,1000);

         //A primeira cota é 1000
         QryValorizacao.Edit;
         fValorizacao  := 1000;
         QryValorizacao.FieldByName('VLRCOTA').AsFloat        := 1000;
         QryValorizacao.FieldByName('QUANTIDADE').AsFloat     := fQtdCotas;
         QryValorizacao.Post;

         QryValorizacao.Next;
         While Not QryValorizacao.Eof Do
         Begin
            QryValorizacao.Edit;

            QryValorizacao.FieldByName('VLRCOTA').AsFloat     :=
                         OperComum.DivValorZero(QryValorizacao.FieldByName('SALDOCOT').AsFloat,fQtdCotas);

            fQtdCotas := OperComum.DivValorZero(QryValorizacao.FieldByName('SALDOCOT').AsFloat,
                                                QryValorizacao.FieldByName('VLRCOTA').AsFloat);
            fQtdCotas := fQtdCotas+
                         OperComum.DivValorZero(QryValorizacao.FieldByName('VLRAPLICACAO').AsFloat-
                                                QryValorizacao.FieldByName('VLRRESGATE').AsFloat,
                                                QryValorizacao.FieldByName('VLRCOTA').AsFloat);
            QryValorizacao.FieldByName('QUANTIDADE').AsFloat  := fQtdCotas;
            QryValorizacao.Post;
            fValorizacao        := QryValorizacao.FieldByName('VLRCOTA').AsFloat;
            QryValorizacao.Next;
         End;

         QryValorizacao.Close;

         Result := (OperComum.DivValorZero(fValorizacao,1000)-1)*100;
         Result :=  OperComum.DivValorZero(Result,100)+ 1;
      end;
   end;
end;

function TCaixaComum.ValorizacaoSaldoCaixa(sDataAnt, sDataOper : String;
                                           idCarteiraP, idCarteiraG, iPlanoPrev : Integer;
                                           dValorizacao : Double) : Boolean;
var
   cRemuneracao, cSaldoCaixaAnt, cSaldoCaixa, cSaldoCaixaAtu  : Currency;
   iIdCarteiraXevento : Integer;
begin
   Result := True;
   Try
      With DtmCaixaComum do
      begin
         If dValorizacao <> 0 Then
         begin
            //AL_6
            //Busca Saldo Anterior
            cSaldoCaixaAnt := BuscaSaldoCaixa(StrToDate(sDataAnt),
                                              idCarteiraP, idCarteiraG, iPlanoPrev, 'ATU');

            //AL_6
            //Busca Saldo Atual
            cSaldoCaixa    := BuscaSaldoCaixa(StrToDate(sDataOper),
                                              idCarteiraP, idCarteiraG, iPlanoPrev, 'OPE');

            //AL_6
            //Busca Saldo Atualizado
            cSaldoCaixaAtu := BuscaSaldoCaixa(StrToDate(sDataOper),
                                              idCarteiraP, idCarteiraG, iPlanoPrev, 'ATU');

            //Obtem a remuneração
            cRemuneracao   := (OperComum.Round(cSaldoCaixaAnt*dValorizacao,2)-cSaldoCaixaAnt);

            //Atualiza o ultimo saldo com a remuneração do dia
            If cSaldoCaixa  = 0 Then
               cSaldoCaixa := cSaldoCaixaAtu;

            cSaldoCaixa := cSaldoCaixa + cRemuneracao;

            If cSaldoCaixa  <> 0 Then
            begin
               If cSaldoCaixaAtu <> cSaldoCaixa then
               begin
                  iIdCarteiraXevento := CotaComum.BuscaCarteiraXevento(idCarteiraP,
                                                                       idCarteiraG, -6);
                  If iIdCarteiraXevento <> 0 Then
                  begin
                     //AL_6
                     If (InsertHistCaixa(StrToDate(sDataOper),
                                         idCarteiraP, idCarteiraG, iIdCarteiraXevento,
                                         -1, -1,
                                         iPlanoPrev,
                                         'ATU', '',
                                         cRemuneracao,
                                         cSaldoCaixa) > 0)  Then
                        Raise Exception.Create('Ocorreu um problema ao incluir o Saldo de Caixa.');
                  end;
               end;
            end;
         end;
      end;
   Except
      //AL_6
      on E: Exception do
      begin
         // Mostra Mensagens e sai da Rotina
         MsgDlg('Não foi possível atualizar o Saldo de Caixa. Verifique!' + #13 +
                 E.Message, 'Mensagem do Sistema',mtWarning,[mbOK],0);
         Result := False;
      end;
   End;
end;

function TCaixaComum.InsertHistCaixa(dData              : TDateTime;
                                     idCarteiraP, idCarteiraG, idCarteiraXEvento,
                                     idOperacaoInvest, idOperacaoDireito, iPlanoPrev : Integer;
                                     sTipMovCaixa, sDescInvest      : String;
                                     fValor, fNovoSaldo : Currency) : Byte;
begin
   try
      // Grava o Histórico do Evento com o novo saldo
      OperComum.LimpaParametros(dtmCaixaComum.qryInsereHistCaixa);
      with dtmCaixaComum.qryInsereHistCaixa do
      begin
         ParamByName('IDHISTCAIXA').AsInteger          := LeUltRegistro(Nil,'HISTCAIXA');
         //AL_6
         if iPlanoPrev > 0 then
            ParamByName('IDPLANPREVCTBPATR').AsInteger := iPlanoPrev;
         ParamByName('IDCARTEIRAXEVENTO').AsInteger    := idCarteiraXEvento;
         ParamByName('IDCARTEIRAINVEST').AsInteger     := idCarteiraP;
         if idCarteiraG > 0 then
            ParamByName('IDCARTEIRAGERENC').AsInteger  := idCarteiraG;
         if idOperacaoInvest > 0 then
            ParamByName('IDOPERACAOINVEST').AsInteger  := idOperacaoInvest;
         ParamByName('DATAHISTCAIXA').AsDateTime       := dData;
         ParamByName('VLRHISTCAIXA').AsFloat           := fValor;
         ParamByName('SLDHISTCAIXA').AsFloat           := fNovoSaldo;
         if idOperacaoDireito > 0 then
            ParamByName('IDOPERACAODIREITO').AsInteger := idOperacaoDireito;
         ParamByName('TIPMOVCAIXA').AsString           := sTipMovCaixa;
         ParamByName('DESCINVESTIMENTO').AsString      := sDescInvest;
         Prepare;
         ExecSQL;
      end;
      Result := 0;
   except
      Result := 3;
   end;
end;

//AL_6
function TCaixaComum.BuscaValorCaixa(dData        : TDateTime;
                                     idCarteiraP, idCarteiraG, iEvento, iPlanoPrev : Integer) : Currency;
begin
   with dtmCaixaComum do
   begin
      OperComum.LimpaParametros(QryBuscaValorCaixa);
      QryBuscaValorCaixa.ParamByName('IDCARTEIRAINVEST').AsInteger    := idCarteiraP;
      If idCarteiraG > 0 Then
         QryBuscaValorCaixa.ParamByName('IDCARTEIRAGERENC').AsInteger := idCarteiraG;
      QryBuscaValorCaixa.ParamByName('IDEVENTOCAIXACOTA').AsInteger   := iEvento;
      QryBuscaValorCaixa.ParamByName('DATAHISTCAIXA').AsDateTime      := dData;
      QryBuscaValorCaixa.ParamByName('IDPLANPREVCTBPATR').AsInteger   := iPlanoPrev;
      QryBuscaValorCaixa.Open;
      Result := QryBuscaValorCaixa.FieldByName('VLRHISTCAIXA').AsFloat;
      QryBuscaValorCaixa.Close;
   end;
end;

function TCaixaComum.GravaEventosCaixa(dDataOper           : TDateTime;
                                       iPlanoPrev, idTipoOperacao, idTipoDespInvest,
                                       idCarteiraP,  idCarteiraG,  idOperacaoInvest,
                                       idOperacaoDireito   : Integer;
                                       sDescInvest         : String;
                                       fValor              : Currency;
                                       var fSaldoCaixa     : Currency) : Boolean;
var
   wSQL : String;
   qryAux: TwwQuery;
begin
   Result := True;
   qryAux := TwwQuery.Create(Application);
   qryAux.DatabaseName := 'BaseDados';
   Try
      wSQL := ' CE.IDCARTEIRAINVEST = '+IntToStr(idCarteiraP);

      if (idTipoOperacao <> 0) then
      begin
         wSQL := wSQL + ' AND EV.IDTIPOOPERACAO = '+IntToStr(idTipoOperacao);
         wSQL := wSQL + ' AND EV.IDTIPODESPINVEST IS NULL';
      end
      else if (idTipoDespInvest <> 0) then
      begin
         wSQL := wSQL + ' AND EV.IDTIPODESPINVEST = '+IntToStr(idTipoDespInvest);
         wSQL := wSQL + ' AND EV.IDTIPOOPERACAO IS NULL';
      end;

      if idCarteiraG <> 0 then
         wSQL := wSQL + ' AND CE.IDCARTEIRAGERENC = '+IntToStr(idCarteiraG)
      else
         wSQL := wSQL + ' AND CE.IDCARTEIRAGERENC IS NULL ';

      //Grava HistCaixa
      FazQuery(QryAux,
               ' SELECT CE.IDCARTEIRAXEVENTO ' +
               ' FROM EVENTOCAIXACOTA EV, CARTEIRAXEVENTO CE ' +
               ' WHERE EV.IDEVENTOCAIXACOTA = CE.IDEVENTOCAIXACOTA AND ' + wSQL+'');

      If QryAux.RecordCount = 1 Then
      Begin
         if idOperacaoInvest  = 0 Then idOperacaoInvest  := -1;
         If idOperacaoDireito = 0 Then idOperacaoDireito := -1;

         //Atualiza a tabela HistCaixa e o saldo das mesmas
         If (AtualizaHistCaixa(dDataOper,
                               idCarteiraP,
                               idCarteiraG,
                               QryAux.FieldByName('IDCARTEIRAxEVENTO').AsInteger,
                               idOperacaoInvest,
                               idOperacaoDireito, iPlanoPrev,
                               sDescInvest,
                               fValor, fSaldoCaixa) >= 2)  Then
         Begin
            Result := False;
            Exit;
         End;
      End;
   Except
      Result := False;
   End;
end;

//-----------------------------------------------------------------
// Retorna:  0: Tudo OK
//           1: O Evento encontrado não é Evento de Caixa
//           2: A carteira não possui Evento de Caixa cadastrado
//           3: Erro na Abertura de queries ou na Gravação de dados
//-----------------------------------------------------------------
function TCaixaComum.AtualizaHistCaixa(dData           : TDateTime;
                                       idCarteiraP, idCarteiraG, idCarteiraXEvento,
                                       idOperacaoInvest, idOperacaoDireito, iPlanoPrev : Integer;
                                       sDescInvest     : String;
                                       fValor          : Currency;
                                       var fSaldoCaixa : Currency) : Byte;
var
    fNovoSaldo   : Double;
begin

   If idOperacaoInvest  <= 0 Then
      idOperacaoInvest  := -1;

   If idOperacaoDireito <= 0 Then
      idOperacaoDireito := -1;

   If iPlanoPrev        <= 0 Then
      iPlanoPrev        := -1;

   With DtmCaixaComum Do
   begin
      try
         // Busca o Evento
         OperComum.LimpaParametros(QryBuscaEventoCaixaCota);
         QryBuscaEventoCaixaCota.Close;
         QryBuscaEventoCaixaCota.ParamByName('IDCARTEIRAXEVENTO').AsInteger :=  idCarteiraXEvento;
         QryBuscaEventoCaixaCota.Open;

         If QryBuscaEventoCaixaCota.IsEmpty then
         begin
            // Não encontrou o Evento
            Result := 2;
            Exit;
         end;

         if not (QryBuscaEventoCaixaCota.FieldByName('STACAIXA').AsString = 'S') then
         begin
            // Não é evento de Caixa
            Result := 1;
            Exit;
         end;

         If fSaldoCaixa  = -1 Then
            fSaldoCaixa := 0;

         //AL_1
         // Verifica se o evento soma ou diminui o saldo e calcula novo saldo
         if QryBuscaEventoCaixaCota.FieldByName('STASOMADIMINUI').AsString   = 'S' then
            fNovoSaldo := fSaldoCaixa + Abs(fValor)
         else if QryBuscaEventoCaixaCota.FieldByName('STASOMADIMINUI').AsString = 'D' then
            fNovoSaldo := fSaldoCaixa - Abs(fValor)
         else
            fNovoSaldo := fSaldoCaixa;
         //Al_1 - Fim

         fSaldoCaixa   := fNovoSaldo;

         Result        := InsertHistCaixa(dData,
                                          idCarteiraP, idCarteiraG, idCarteiraXEvento,
                                          idOperacaoInvest, idOperacaoDireito, iPlanoPrev,
                                          'OPE', sDescInvest,
                                          fValor, fNovoSaldo);
      except
         Result := 3;
      end;
      QryBuscaEventoCaixaCota.Close;
   end;
end;

//AL_6
//Atualiza os saldos das operações realizada no dia
function  TCaixaComum.AtualizaSaldoDasOperacoes(dData        : TDateTime;
                                                idCarteiraP, idCarteiraG, iPlanoPrev  : Integer) : Boolean;
Var
   cSaldoCaixaAnt, cSaldoCaixaAtu : Currency;
begin
   Result := True;
   With DtmCaixaComum Do
   begin
      Try
         //Deleta o Saldo Atualizado do Dia
         OperComum.LimpaParametros(QryDeleteSaldoAtu);
         QryDeleteSaldoAtu.Close;
         QryDeleteSaldoAtu.ParamByName('DATAHISTCAIXA').AsDateTime      := dData;
         QryDeleteSaldoAtu.ParamByName('IDCARTEIRAINVEST').AsInteger    := idCarteiraP;
         If idCarteiraG > 0 Then
            QryDeleteSaldoAtu.ParamByName('IDCARTEIRAGERENC').AsInteger := idCarteiraG;
         QryDeleteSaldoAtu.ParamByName('IDPLANPREVCTBPATR').AsInteger   := iPlanoPrev;
         QryDeleteSaldoAtu.ExecSQL;

         cSaldoCaixaAnt := BuscaSaldoCaixa(dData, idCarteiraP, idCarteiraG, iPlanoPrev, '');

         //Busca todas as Operaçoes do Dia
         OperComum.LimpaParametros(QryBuscaOperacoes);
         QryBuscaOperacoes.Close;
         QryBuscaOperacoes.ParamByName('DATAHISTCAIXA').AsDateTime      := dData;
         QryBuscaOperacoes.ParamByName('IDCARTEIRAINVEST').AsInteger    := idCarteiraP;
         If idCarteiraG <> 0 Then
            QryBuscaOperacoes.ParamByName('IDCARTEIRAGERENC').AsInteger := idCarteiraG;
         QryBuscaOperacoes.ParamByName('IDPLANPREVCTBPATR').AsInteger   := iPlanoPrev;
         QryBuscaOperacoes.Open;

         cSaldoCaixaAtu := cSaldoCaixaAnt;
         While Not QryBuscaOperacoes.EOF Do
         begin
            // Busca o Evento
            QryAuxiliar.Close;
            QryAuxiliar.SQL.Clear;
            QryAuxiliar.SQL.Add('SELECT EC.STACAIXA, EC.STASOMADIMINUI ' +
                                'FROM CARTEIRAXEVENTO CX, EVENTOCAIXACOTA EC ' +
                                'WHERE CX.IDCARTEIRAXEVENTO = ' + QryBuscaOperacoes.FieldByName('IDCARTEIRAXEVENTO').AsString + ' AND ' +
                                '      CX.IDEVENTOCAIXACOTA = EC.IDEVENTOCAIXACOTA');
            QryAuxiliar.Open;

            // Verifica se o evento soma ou diminui o saldo e calcula novo saldo
            if QryAuxiliar.FieldByName('STASOMADIMINUI').AsString = 'S' then
               cSaldoCaixaAtu := cSaldoCaixaAtu + Abs(QryBuscaOperacoes.FieldByName('VLRHISTCAIXA').AsFloat)
            else if QryAuxiliar.FieldByName('STASOMADIMINUI').AsString = 'D' then
               cSaldoCaixaAtu := cSaldoCaixaAtu - Abs(QryBuscaOperacoes.FieldByName('VLRHISTCAIXA').AsFloat);

            //Atualiza Saldo das Operações
            OperComum.LimpaParametros(QryAtualizaSaldoOperacao);
            QryAtualizaSaldoOperacao.Close;
            QryAtualizaSaldoOperacao.ParamByName('SLDHISTCAIXA').AsFloat  := cSaldoCaixaAtu;
            QryAtualizaSaldoOperacao.ParamByName('IDHISTCAIXA').AsInteger :=
                                     QryBuscaOperacoes.FieldByName('IDHISTCAIXA').AsInteger;
            QryAtualizaSaldoOperacao.ExecSql;

            QryBuscaOperacoes.Next;
         end;
      Except
         Result := False;
      end;

      QryAuxiliar.Close;
      QryBuscaOperacoes.Close;
   end;
end;

//AL_6
function TCaixaComum.AtualizaOperacaoDespesasRV(dData : TDateTime) : Boolean;
Var
   iCarteiraP, iCarteiraG, iPlanoPrev : Integer;
   fSaldoCaixa               : Currency;
begin
   iCarteiraP := 0;
   iCarteiraG := 0;
   iPlanoPrev := 0;
   With DtmCaixaComum Do
   Begin
     Try

       //Limpa operações e despesas
       OperComum.LimpaParametros(QryDeleteOperDesp);
       QryDeleteOperDesp.Close;
       QryDeleteOperDesp.ParamByName('DATA').AsString        := DateToStr(dData);
       QryDeleteOperDesp.ExecSql;

       //Monta Query
       OperComum.LimpaParametros(QryBuscaOperDespLiquidar);
       QryBuscaOperDespLiquidar.Close;
       QryBuscaOperDespLiquidar.ParamByName('DATA').AsString := DateToStr(dData);
       QryBuscaOperDespLiquidar.Open;

       QryBuscaOperDespLiquidar.First;

       //Grava as Operações e Despesas
       While Not QryBuscaOperDespLiquidar.EOF Do
       begin
          If ((iCarteiraP <> QryBuscaOperDespLiquidar.FieldByName('IDCARTEIRAINVEST').AsInteger)   Or
              (iCarteiraG <> QryBuscaOperDespLiquidar.FieldByName('IDCARTEIRAGERENC').AsInteger)   Or
              (iPlanoPrev <> QryBuscaOperDespLiquidar.FieldByName('IDPLANPREVCTBPATR').AsInteger)) Then
             fSaldoCaixa  := BuscaSaldoCaixa(dData,
                                             QryBuscaOperDespLiquidar.FieldByName('IDCARTEIRAINVEST').AsInteger,
                                             QryBuscaOperDespLiquidar.FieldByName('IDCARTEIRAGERENC').AsInteger,
                                             QryBuscaOperDespLiquidar.FieldByName('IDPLANPREVCTBPATR').AsInteger, 'OPE');

          iCarteiraP := QryBuscaOperDespLiquidar.FieldByName('IDCARTEIRAINVEST').AsInteger;
          iCarteiraG := QryBuscaOperDespLiquidar.FieldByName('IDCARTEIRAGERENC').AsInteger;
          iPlanoPrev := QryBuscaOperDespLiquidar.FieldByName('IDPLANPREVCTBPATR').AsInteger;
          //Al_2
          If QryBuscaOperDespLiquidar.FieldByName('VALOR').AsFloat <> 0 Then
          begin
             If Not GravaEventosCaixa(dData,
                                      QryBuscaOperDespLiquidar.FieldByName('IDPLANPREVCTBPATR').AsInteger,
                                      QryBuscaOperDespLiquidar.FieldByName('IDTIPOOPERACAO').AsInteger,
                                      QryBuscaOperDespLiquidar.FieldByName('IDTIPODESPINVEST').AsInteger,
                                      QryBuscaOperDespLiquidar.FieldByName('IDCARTEIRAINVEST').AsInteger,
                                      QryBuscaOperDespLiquidar.FieldByName('IDCARTEIRAGERENC').AsInteger,
                                      QryBuscaOperDespLiquidar.FieldByName('IDOPERACAOINVEST').AsInteger,
                                      -1{OperacaoDireito},
                                      QryBuscaOperDespLiquidar.FieldByName('DESCINVESTIMENTO').AsString,
                                      QryBuscaOperDespLiquidar.FieldByName('VALOR').AsFloat,
                                      fSaldoCaixa) Then
                Raise Exception.Create('Ocorreu um problema ao gravar as despesas no Caixa.');
          end;

          QryBuscaOperDespLiquidar.Next;

          If  (QryBuscaOperDespLiquidar.Eof) Or
             ((iCarteiraP <> QryBuscaOperDespLiquidar.FieldByName('IDCARTEIRAINVEST').AsInteger)  Or
              (iCarteiraG <> QryBuscaOperDespLiquidar.FieldByName('IDCARTEIRAGERENC').AsInteger)   Or
              (iPlanoPrev <> QryBuscaOperDespLiquidar.FieldByName('IDPLANPREVCTBPATR').AsInteger)) Then
          Begin
             If Not CaixaComum.AtualizaSaldoDasOperacoes(dData, iCarteiraP, iCarteiraG, iPlanoPrev) Then
                Raise Exception.Create('Ocorreu um problema ao Atualizar o Saldo das despesas no Caixa.');
          end;
       end;

       Result := True;

     Except
        on E: Exception do
        begin
           // Mostra Mensagens e sai da Rotina
           MsgDlg('Não foi possível atualizar as Operações e Depesas a Liquidar!'+#13 +
                   E.Message, 'Mensagem do Sistema',mtWarning,[mbOK],0);
           Result := False;
        end;
     End;
     QryBuscaOperDespLiquidar.Close;
   End;
end;

function TCaixaComum.PeriodoCPMF(dDataOper : TDateTime; var dDataIni, dDataFim : TDateTime) : Byte;
begin
   If dDataOper = Impostos.CalculaDataLiqCPMF(dDataOper) Then
   begin
      dDataFim := dDataOper;

      While DayOfWeek(dDataFim) >= 4 do //Quarta da semana ou menor
      begin
         dDataFim := dDataFim - 1;
         While not DiasUteisInv.DiaUtil(dDataFim,-1,1,'',True,False,False) Do
           dDataFim := dDataFim - 1;   // Achar o dia útil anterior
      end;

      dDataIni  := dDataFim;

      While DayOfWeek(dDataFim) <= 5 do //Busca sexta-feira passada
      begin
         dDataFim := dDataFim - 1;
         While not DiasUteisInv.DiaUtil(dDataFim,-1,1,'',True,False,False) Do
           dDataFim := dDataFim - 1;   // Achar o dia útil anterior
      end;

      While DayOfWeek(dDataFim) >= 5 do //Quinta da semana passada
      begin
         dDataFim := dDataFim - 1;
         While not DiasUteisInv.DiaUtil(dDataFim,-1,1,'',True,False,False) Do
           dDataFim := dDataFim - 1;   // Achar o dia útil anterior
      end;

      result := 0;

   end
   else
      result := 1;
end;

end.
