//******************************************************************************
// Data      : 13/03/2007
// Codigo    : AL_22
// Pendência :
// Sol       :
// Motivo    : Alteração na orderm de gravação dos eventos para apuração da cota,
//             na rotina CalculaCaixaCota
//******************************************************************************
// Data      : 31/08/2006
// Codigo    : AL_21
// Pendência :
// Sol       :
// Motivo    :  Implementação do plano/patrocinador
//******************************************************************************
// Data      : 22/03/2006
// Código    : AL_20
// Pendencia :
// SOL       :
// Motivo    : Ajuste na composição do Patrimônio Final, na busca do saldo do caixa final
//             do dia.
// ******************************************************************************
// Data     : 28/06/2005
// Código   : AL_19
// Motivo   : Inicialização das variaveis com zero, no momento do while na carteira gerencial.
//            para apurar o patrimonio
// ******************************************************************************
// Data     : 20/06/2005
// Código   : AL_18
// Motivo   : Ajuste para limpar as mensagens na tela de processo de atualização
// ******************************************************************************
// Data     : 06/06/2005
// Código   : AL_17
// Motivo   : Implementação da montagem da data final para busca da liquida;áo de renda variavel.
// ******************************************************************************
// Data     : 06/06/2005
// Código   : AL_16
// Motivo   : Alterado de posição a abertura da qryCarteiraGerenc para o inicio da
//            função para haver um unico while de processo.
// ******************************************************************************
// Data     : 06/06/2005
// Código   : AL_15
// Motivo   : Implementação das mensagens informativas de processamento.
// ******************************************************************************
// Data     : 06/06/2005
// Código   : AL_14
// Motivo   : Implementação das variaveis iCount e iIdCarteiraXEvento.
// ******************************************************************************
// Data     : 06/06/2005
// Código   : AL_13
// Motivo   : Retirado o "abort" para ser tratada a mensagem da função de saida.
// ******************************************************************************
// Data     : 06/06/2005
// Código   : AL_12
// Motivo   : Implementação de teste do evento.
// ******************************************************************************
// Data     : 06/06/2005
// Código   : AL_11
// Motivo   : Reirado para utilizar a rotina que agregará o o patrimonio.
// ******************************************************************************
// Data     : 06/06/2005
// Código   : AL_10
// Motivo   : Implementação para obtermos um patrimonio unico (FDmRelCarteiraGerenc).
// ******************************************************************************
// Data     : 06/06/2005
// Código   : AL_9
// Motivo   : Alterado a rotina para função. Foi neccessáario para abortar o processo.
// ******************************************************************************
// Data     : 10/05/2005
// Código   : AL_8
// Motivo   : Retirado ...
// ******************************************************************************
// Data     : 09/05/2005
// Código   : AL_8
// Motivo   : Apuração de CPMF deve ser feita conforme os fundos devido ao feriados de bolsa
// ******************************************************************************
// Data     : 07/02/2005
// Código   : AL_7
// Motivo   : Implementação do acerto para o dia 01/02/2005 devido a Resgate
// ******************************************************************************
// Data     : 05/01/2005
// Código   : AL_6
// Motivo   : Retirado o código comentado
// ******************************************************************************
// Data     : 05/01/2005
// Código   : AL_4
// Motivo   : Implementado a exclusão do CMPF gerado no calculo de cotas da cart. gerencial
// ******************************************************************************
// Data     : 29/11/2004
// Código   : AL_3
// Motivo   : Implementação do acerto para o dia 20/10/2004 devido a Incorp/Aplicação
// ******************************************************************************
// Data     : 26/11/2004
// Código   : AL_2
// Motivo   : Implementação do acerto para o dia 15/10/2004 devido a Incorp/Aplicação
//******************************************************************************
// Data     : 11/10/2004
// Linha(s) : AL_1
// Motivo   : Passa a somar Compras com Despesas
//******************************************************************************

unit UCotaComum;

interface

Uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  Db, USistema, Wwquery, OleCtrls, vcf1, IvDictio, IvMulti, IvEMulti,
  MAHlpBtn, StdCtrls, TB97Tlbr, TB97, ExtCtrls;

type

   TCotaComum = Class(TObject)

   private

//

   public

      function  BuscaEventosHistCota(dData : TDateTime;
                                     iCarteiraInvest, iCarteiraGerenc,
                                     iPlanoPrev, iEvento               : Integer) : Double;

      function  BuscaCarteiraXevento(iCarteiraInvest, iCarteiraGerenc, iEvento : Integer) : Integer;

      function  BuscaEventoPorTpOper(iCarteiraInvest, iCarteiraGerenc, iTipoOper : Integer) : Integer;

      function  AtualizaCota(dData              : TDateTime;
                             idCarteiraP, idCarteiraG, iPlanoPrev,
                             idCarteiraXEvento  : Integer;
                             fValor             : Double): Boolean;

      // Valor da Carteira de R. Variável
      procedure GravaValorCartRenVar(dDataOper : TDateTime;
                                     iCarteiraInvest, iCarteiraGerenc, iPlanoPrev : Integer);

      // Valor do Caixa
      procedure GravaValorCaixa(dDataOper : TDateTime;
                                iCarteiraInvest, iCarteiraGerenc, iPlanoPrev : Integer);

      // Valor a Liquidar de BM&F
      procedure GravaValorLiquidarBMF(dDataOper : TDateTime;
                                      iCarteiraInvest, iCarteiraGerenc, iPlanoPrev : Integer);

      // Valor Liquidar a Renda Variável
      procedure GravaValorLiquidarRVariavel(dDataOper : TDateTime;
                                            iCarteiraInvest, iCarteiraGerenc, iPlanoPrev : Integer);

      // Valor a Pagar e a Receber Provisão
      procedure GravaValorPagarReceber(dDataOper : TDateTime;
                                       iCarteiraInvest, iCarteiraGerenc, iPlanoPrev : Integer);

      // Valor da Aplicacao a Cotizar
      procedure GravaValorAplicCotizar(dDataOper : TDateTime;
                                       iCarteiraInvest, iCarteiraGerenc, iPlanoPrev : Integer);

      // Valor do Resgate a cotizar
      procedure GravaValorResgCotizar(dDataOper : TDateTime;
                                      iCarteiraInvest, iCarteiraGerenc, iPlanoPrev : Integer);

      // Valor do CPMF
      procedure GravaValorCPMF(dDataOper : TDateTime;
                               iCarteiraInvest, iCarteiraGerenc, iPlanoPrev : Integer);

      procedure GravaEventosCota(dDataOper : TDateTime;
                                 iCarteiraInvest, iCarteiraGerenc, iPlanoPrev : Integer);

      //Al_9
      //Função de Atualização do Saldo de Caixa e Calculo de Cota
      function CalculaCaixaCota(dDataAnt, dDataOper : TDateTime) : Boolean;

   end;

var
  CotaComum : TCotaComum;

implementation

uses
  DCotaComum, UOperComum, UMensErro, uDataBase, UCaixaComum, UBibliotecaInvest,
  //AL_18
  //Al_10
  UProvisaoComum, DBaseDados, UDiasUteisInv, FFechtoCartGerenc, FDmRelCarteiraGerenc,
  uString;

function TCotaComum.BuscaEventosHistCota(dData : TDateTime;
                                        iCarteiraInvest, iCarteiraGerenc,
                                        iPlanoPrev, iEvento               : Integer) : Double;
begin
   //AL_21
   OperComum.LimpaParametros(DtmCotaComum.QryBuscaEventosCotas);
   With DtmCotaComum Do
   Begin

      QryBuscaEventosCotas.ParamByName('DATA').AsString               := DateToStr(dData);
      QryBuscaEventosCotas.ParamByName('IDPLANPREVCTBPATR').AsInteger := iPlanoPrev;
      QryBuscaEventosCotas.ParamByName('IDEVENTOCAIXACOTA').AsInteger := iEvento;
      If iCarteiraInvest > 0 Then
         QryBuscaEventosCotas.ParamByName('IDCARTEIRAINVEST').AsInteger  := iCarteiraInvest;
      If iCarteiraGerenc > 0 Then
         QryBuscaEventosCotas.ParamByName('IDCARTEIRAGERENC').AsInteger  := iCarteiraGerenc;
      QryBuscaEventosCotas.Open;

      Result := QryBuscaEventosCotas.FieldByName('SALDO').AsFloat;

      QryBuscaEventosCotas.Close;
   End;
end;

function TCotaComum.BuscaCarteiraXevento(iCarteiraInvest, iCarteiraGerenc, iEvento : Integer) : Integer;
begin
   With DtmCotaComum Do
   Begin
      QryBuscaCarteiraXevento.Close;
      QryBuscaCarteiraXevento.ParamByName('IDEVENTOCAIXACOTA').AsInteger := iEvento;

      QryBuscaCarteiraXevento.ParamByName('IDCARTEIRAINVEST').AsInteger  := iCarteiraInvest;
      If iCarteiraInvest = 0 Then
         QryBuscaCarteiraXevento.ParamByName('IDCARTEIRAINVEST').Clear;

      QryBuscaCarteiraXevento.ParamByName('IDCARTEIRAGERENC').AsInteger  := iCarteiraGerenc;
      If iCarteiraGerenc = 0 Then
         QryBuscaCarteiraXevento.ParamByName('IDCARTEIRAGERENC').Clear;

      QryBuscaCarteiraXevento.Open;
      Result := QryBuscaCarteiraXevento.FieldByName('IDCARTEIRAXEVENTO').AsInteger;
      QryBuscaCarteiraXevento.Close;
   End;
end;

function TCotaComum.BuscaEventoPorTpOper(iCarteiraInvest, iCarteiraGerenc, iTipoOper : Integer) : Integer;
begin
   With DtmCotaComum Do
   begin
      OperComum.LimpaParametros(QryBuscaEventoPorTpOper);
      QryBuscaEventoPorTpOper.Close;
      QryBuscaEventoPorTpOper.ParamByName('IDCARTEIRAINVEST').AsInteger    := iCarteiraInvest;
      QryBuscaEventoPorTpOper.ParamByName('IDTIPOOPERACAO').AsInteger      := iTipoOper;
      If iCarteiraGerenc <> 0 Then
         QryBuscaEventoPorTpOper.ParamByName('IDCARTEIRAGERENC').AsInteger := iCarteiraGerenc;
      QryBuscaEventoPorTpOper.Open;
      Result := QryBuscaEventoPorTpOper.FieldByName('IDCARTEIRAXEVENTO').AsInteger;
      QryBuscaEventoPorTpOper.Close;
   end;
end;

function TCotaComum.AtualizaCota(dData: TDateTime;
                                 idCarteiraP, idCarteiraG, iPlanoPrev,
                                 idCarteiraXEvento : Integer;
                                 fValor: Double): Boolean;
var
   iIdHistCota: Integer;
begin
   try
      // Grava o Histórico do Evento de Cota
      iIdHistCota := LeUltRegistro(Nil,'HISTCOTA');

      with dtmCotaComum do
      begin
         OperComum.LimpaParametros(qryInsereHistCota);
         qryInsereHistCota.ParamByName('IDHISTCOTA').AsInteger          := iIdHistCota;
         //AL_21
         qryInsereHistCota.ParamByName('IDPLANPREVCTBPATR').AsInteger   := iPlanoPrev;
         qryInsereHistCota.ParamByName('IDCARTEIRAXEVENTO').AsInteger   := idCarteiraXEvento;
         qryInsereHistCota.ParamByName('IDCARTEIRAINVEST').AsInteger    := idCarteiraP;
         if idCarteiraG = 0 then
            qryInsereHistCota.ParamByName('IDCARTEIRAGERENC').Clear
         else
            qryInsereHistCota.ParamByName('IDCARTEIRAGERENC').AsInteger := idCarteiraG;
         qryInsereHistCota.ParamByName('DATAHISTCOTA').AsDateTime       := dData;
         qryInsereHistCota.ParamByName('VLRHISTCOTA').AsFloat           := ABS(fValor);
         qryInsereHistCota.Prepare;
         qryInsereHistCota.ExecSQL;
      end;

      Result := True;
   except
      //AL_21
      Result := False;
   end;
end;

// Valor da Carteira de R. Variável
procedure TCotaComum.GravaValorCartRenVar(dDataOper : TDateTime;
                                         iCarteiraInvest, iCarteiraGerenc, iPlanoPrev : Integer);
Var
   iIdCarteiraXEvento : Integer;
begin
   //AL_21
   OperComum.LimpaParametros(DtmCotaComum.QryBuscaValorCartRenVar);
   With DtmCotaComum Do
   begin
      If iCarteiraInvest > 0 Then
         QryBuscaValorCartRenVar.ParambyName('IDCARTEIRAINVEST').AsInteger  := iCarteiraInvest;

      If iCarteiraGerenc > 0 Then
         QryBuscaValorCartRenVar.ParambyName('IDCARTEIRAGERENC').AsInteger  := iCarteiraGerenc;

      QryBuscaValorCartRenVar.ParambyName('IDPLANPREVCTBPATR').AsInteger    := iPlanoPrev;
      QryBuscaValorCartRenVar.ParambyName('DATA').AsString                  := DateToStr(dDataOper);
      QryBuscaValorCartRenVar.Open;

      iIdCarteiraXEvento := BuscaCarteiraXevento(iCarteiraInvest,iCarteiraGerenc, -4);
      If iIdCarteiraXEvento <> 0 Then
      begin
         if not AtualizaCota(dDataOper, iCarteiraInvest, iCarteiraGerenc, iPlanoPrev,
                            iIdCarteiraXEvento, QryBuscaValorCartRenVar.FieldByName('SALDO').AsFloat) then
            MsgDlg('Não foi possível atualizar a Cota com os eventos da Carteira de Renda Variável!',
                   'Mensagem do Sistema',mtWarning,[mbOk],0);
      end;

      QryBuscaValorCartRenVar.Close;
   end;
end;

// Valor do Caixa
procedure TCotaComum.GravaValorCaixa(dDataOper : TDateTime;
                                    iCarteiraInvest, iCarteiraGerenc, iPlanoPrev : Integer);
Var
   iIdCarteiraXEvento : Integer;
   cSaldoCaixa        : Currency;
begin
    //AL_21
    //Busca Saldo Atual
    cSaldoCaixa    := CaixaComum.BuscaSaldoCaixa(dDataOper,
                                                iCarteiraInvest, iCarteiraGerenc, iPlanoPrev, 'ATU');
   If (cSaldoCaixa <> 0) Then
   begin
      iIdCarteiraXEvento := BuscaCarteiraXevento(iCarteiraInvest, iCarteiraGerenc, -6);
      If iIdCarteiraXEvento <> 0 Then
      begin
         if not AtualizaCota(dDataOper, iCarteiraInvest, iCarteiraGerenc, iPlanoPrev,
                             iIdCarteiraXEvento, cSaldoCaixa ) then
            MsgDlg('Não foi possível atualizar a Cota com o Valor de Caixa!',
                   'Mensagem do Sistema',mtWarning,[mbOk],0);
      end;
   end;
end;

// Valor a Liquidar de BM&F
procedure TCotaComum.GravaValorLiquidarBMF(dDataOper : TDateTime;
                                           iCarteiraInvest, iCarteiraGerenc, iPlanoPrev : Integer);
var
   iEvento, iIdCarteiraXEvento : Integer;
begin
   //AL_21
   OperComum.LimpaParametros(DtmCotaComum.QryTotalLiquidoBMF);
   With DtmCotaComum Do
   begin
      If iCarteiraInvest > 0 Then
         QryTotalLiquidoBMF.ParambyName('IDCARTEIRAINVEST').AsInteger  := iCarteiraInvest;

      If iCarteiraGerenc > 0 Then
         QryTotalLiquidoBMF.ParambyName('IDCARTEIRAGERENC').AsInteger  := iCarteiraGerenc;

      QryTotalLiquidoBMF.ParambyName('IDPLANPREVCTBPATR').AsInteger    := iPlanoPrev;
      QryTotalLiquidoBMF.ParambyName('DATA').AsString                  := DateToStr(dDataOper);
      QryTotalLiquidoBMF.Open;
      If QryTotalLiquidoBMF.FieldByname('SALDO').AsFloat > 0 Then
         iEvento := -8
      Else If QryTotalLiquidoBMF.FieldByname('SALDO').AsFloat < 0 Then
         iEvento := -7
      Else
         iEvento := -1;

      While Not QryTotalLiquidoBMF.Eof Do
      begin
         If (QryTotalLiquidoBMF.FieldByname('SALDO').AsFloat <> 0) Then
         begin
            iIdCarteiraXEvento := BuscaCarteiraXevento(iCarteiraInvest, iCarteiraGerenc, iEvento);
            //AL_21
            If iIdCarteiraXEvento <> 0 Then
            begin
               if not AtualizaCota(QryTotalLiquidoBMF.FieldByname('DATAVENCOPER').AsDateTime,
                                   iCarteiraInvest, iCarteiraGerenc, iPlanoPrev,
                                   iIdCarteiraXEvento, ABS(QryTotalLiquidoBMF.FieldByname('SALDO').AsFloat)) then
                  MsgDlg('Não foi possível atualizar a Cota com os eventos de BM&F!',
                         'Mensagem do Sistema',mtWarning,[mbOk],0);
            end;
         end;
         QryTotalLiquidoBMF.Next;
      end;
      QryTotalLiquidoBMF.Close;
   end;
end;

// Valor a Liquidar de Renda variavel
procedure TCotaComum.GravaValorLiquidarRVariavel(dDataOper : TDateTime;
                                                 iCarteiraInvest, iCarteiraGerenc, iPlanoPrev : Integer);
var
   I, iIdCarteiraXEvento, iIdTipoInvest : Integer;
   dDataFim                          : TDateTime;
begin
   With DtmCotaComum Do
   begin
      iIdTipoInvest  := iTipoInvestUsu;
      dDataFim       := dDataOper;
      iTipoInvestUsu := 2;
      I              := 1;
      While I <= 3 Do
      Begin
         dDataFim   := dDataFim + 1;
         While not DiasUteisInv.DiaUtil(dDataFim,-1,1,'',True,False,False) Do
           dDataFim := dDataFim + 1;   // Achar o próximo dia útil
         I := I + 1;
      End;
      iTipoInvestUsu := iIdTipoInvest;

      //AL_21
      OperComum.LimpaParametros(DtmCotaComum.QryTotalLiquidoRVariavel);
      If iCarteiraInvest > 0 Then
         QryTotalLiquidoRVariavel.ParambyName('IDCARTEIRAINVEST').AsInteger := iCarteiraInvest;

      If iCarteiraGerenc > 0 Then
         QryTotalLiquidoRVariavel.ParambyName('IDCARTEIRAGERENC').AsInteger := iCarteiraGerenc;

      QryTotalLiquidoRVariavel.ParambyName('IDPLANPREVCTBPATR').AsInteger   := iPlanoPrev;
      QryTotalLiquidoRVariavel.ParambyName('DATAINI').AsString              := DateToStr(dDataOper);
      QryTotalLiquidoRVariavel.ParambyName('DATAFIM').AsString              := DateToStr(dDataFim);
      QryTotalLiquidoRVariavel.Open;

      If QryTotalLiquidoRVariavel.FieldByname('VENDA').AsFloat <> 0 Then
      begin
         iIdCarteiraXEvento := BuscaCarteiraXevento(iCarteiraInvest, iCarteiraGerenc, -8);
         //AL_21
         If iIdCarteiraXEvento <> 0 Then
         begin
            if not AtualizaCota(dDataOper,
                                iCarteiraInvest, iCarteiraGerenc, iPlanoPrev,
                                iIdCarteiraXEvento, ABS(QryTotalLiquidoRVariavel.FieldByname('VENDA').AsFloat)) then
               MsgDlg('Não foi possível atualizar a Cota com o Valor a Liquidar de Renda variavel!',
                      'Mensagem do Sistema',mtWarning,[mbOk],0);
         end;
      end;

      If (QryTotalLiquidoRVariavel.FieldByname('COMPRA').AsFloat-
          QryTotalLiquidoRVariavel.FieldByname('DESPESAS').AsFloat) <> 0 Then
      begin
         iIdCarteiraXEvento := BuscaCarteiraXevento(iCarteiraInvest, iCarteiraGerenc, -7);
         //AL_21
         If iIdCarteiraXEvento <> 0 Then
         begin
            // AL_1
            if not AtualizaCota(dDataOper,
                                iCarteiraInvest, iCarteiraGerenc, iPlanoPrev,
                                iIdCarteiraXEvento, ABS(QryTotalLiquidoRVariavel.FieldByname('COMPRA').AsFloat +
                                                        QryTotalLiquidoRVariavel.FieldByname('DESPESAS').AsFloat)) then
               MsgDlg('Não foi possível atualizar a Cota com o Valor de compras e despesas de Renda variavel!',
                      'Mensagem do Sistema',mtWarning,[mbOk],0);
         end;
      end;

      QryTotalLiquidoRVariavel.Close;
   end;
end;

// Valor a Pagar e a Receber Provisão
procedure TCotaComum.GravaValorPagarReceber(dDataOper : TDateTime;
                                 iCarteiraInvest, iCarteiraGerenc, iPlanoPrev : Integer);
var
   iIdCarteiraXEvento : Integer;
begin
   //AL_21
   OperComum.LimpaParametros(DtmCotaComum.QryTotalPagarReceber);
   With DtmCotaComum Do
   begin
      If iCarteiraInvest > 0 Then
         QryTotalPagarReceber.ParambyName('IDCARTEIRAINVEST').AsInteger  := iCarteiraInvest;

      If iCarteiraGerenc > 0 Then
         QryTotalPagarReceber.ParambyName('IDCARTEIRAGERENC').AsInteger  := iCarteiraGerenc;

      QryTotalPagarReceber.ParambyName('DATAINI').AsString            := DateToStr(dDataOper);
      QryTotalPagarReceber.Open;

      If QryTotalPagarReceber.FieldByname('RECEBER').AsFloat <> 0 Then
      begin
         iIdCarteiraXEvento := BuscaCarteiraXevento(iCarteiraInvest, iCarteiraGerenc, -12);
         If iIdCarteiraXEvento <> 0 Then
         begin
            if not AtualizaCota(dDataOper,
                                iCarteiraInvest, iCarteiraGerenc, iPlanoPrev,
                                iIdCarteiraXEvento, ABS(QryTotalPagarReceber.FieldByname('RECEBER').AsFloat)) then
               MsgDlg('Não foi possível atualizar a Cota com o Valor a Receber da Provisão!',
                      'Mensagem do Sistema',mtWarning,[mbOk],0);
         end;
      end;

      If QryTotalPagarReceber.FieldByname('PAGAR').AsFloat <> 0 Then
      begin
         iIdCarteiraXEvento := BuscaCarteiraXevento(iCarteiraInvest, iCarteiraGerenc, -11);
         If iIdCarteiraXEvento <> 0 Then
         begin
            if not AtualizaCota(dDataOper,
                                iCarteiraInvest, iCarteiraGerenc, iPlanoPrev,
                                iIdCarteiraXEvento, ABS(QryTotalPagarReceber.FieldByname('PAGAR').AsFloat)) then
               MsgDlg('Não foi possível atualizar a Cota com o Valor a Pagar da Provisão!',
                      'Mensagem do Sistema',mtWarning,[mbOk],0);
         end;
      end;

      QryTotalPagarReceber.Close;
   end;
end;

// Valor da Aplicacao a Cotizar
procedure TCotaComum.GravaValorAplicCotizar(dDataOper : TDateTime;
                                            iCarteiraInvest, iCarteiraGerenc, iPlanoPrev : Integer);
Var
   iIdCarteiraXEvento : Integer;
begin
   //AL_21
   OperComum.LimpaParametros(DtmCotaComum.QryAplicacao);
   With DtmCotaComum Do
   begin
      If iCarteiraInvest > 0 Then
         QryAplicacao.ParambyName('IDCARTEIRAINVEST').AsInteger := iCarteiraInvest;

      If iCarteiraGerenc > 0 Then
         QryAplicacao.ParambyName('IDCARTEIRAGERENC').AsInteger := iCarteiraGerenc;

      QryAplicacao.ParambyName('IDPLANPREVCTBPATR').AsInteger   := iPlanoPrev;
      QryAplicacao.ParambyName('DATA').AsString                 := DateToStr(dDataOper);
      QryAplicacao.Open;
      If (QryAplicacao.FieldByname('SALDO').AsFloat <> 0) Then
      begin
         iIdCarteiraXEvento := BuscaCarteiraXevento(iCarteiraInvest, iCarteiraGerenc, -9);
         If iIdCarteiraXEvento <> 0 Then
         begin
            if not AtualizaCota(dDataOper, iCarteiraInvest, iCarteiraGerenc, iPlanoPrev,
                                iIdCarteiraXEvento, QryAplicacao.FieldByname('SALDO').AsFloat) then
               MsgDlg('Não foi possível atualizar a Cota com o Valor da Aplicacao a Cotizar!',
                      'Mensagem do Sistema',mtWarning,[mbOk],0);
         end;
      end;
      QryAplicacao.Close;
   end;
end;

// Valor do Resgate a cotizar
procedure TCotaComum.GravaValorResgCotizar(dDataOper : TDateTime;
                                           iCarteiraInvest, iCarteiraGerenc, iPlanoPrev : Integer);
Var
   iIdCarteiraXEvento : Integer;
begin
   //AL_21
   OperComum.LimpaParametros(DtmCotaComum.QryResgate);
   With DtmCotaComum Do
   begin
      If iCarteiraInvest > 0 Then
         QryResgate.ParambyName('IDCARTEIRAINVEST').AsInteger := iCarteiraInvest;

      If iCarteiraGerenc > 0 Then
         QryResgate.ParambyName('IDCARTEIRAGERENC').AsInteger := iCarteiraGerenc;

      QryResgate.ParambyName('IDPLANPREVCTBPATR').AsInteger   := iPlanoPrev;
      QryResgate.ParambyName('DATA').AsString                 := DateToStr(dDataOper);
      QryResgate.Open;
      If (QryResgate.FieldByname('SALDO').AsFloat <> 0) Then
      begin
         iIdCarteiraXEvento := BuscaCarteiraXevento(iCarteiraInvest, iCarteiraGerenc, -10);
         If iIdCarteiraXEvento <> 0 Then
         begin
            if not AtualizaCota(dDataOper, iCarteiraInvest, iCarteiraGerenc, iPlanoPrev,
                                iIdCarteiraXEvento, QryResgate.FieldByname('SALDO').AsFloat) then
               MsgDlg('Não foi possível atualizar a Cota com o Valor do Resgate a Cotizar!',
                      'Mensagem do Sistema',mtWarning,[mbOk],0);
         end;
      end;
      QryResgate.Close;
   end;
end;

// Valor do CPMF
procedure TCotaComum.GravaValorCPMF(dDataOper : TDateTime;
                                    iCarteiraInvest, iCarteiraGerenc, iPlanoPrev : Integer);
Var
   iIdCarteiraXEvento : Integer;
begin
   //AL_21
   OperComum.LimpaParametros(DtmCotaComum.QryCPMFDia);
   With DtmCotaComum Do
   begin
      If iCarteiraInvest > 0 Then
         QryCPMFDia.ParamByName('IDCARTEIRAINVEST').AsInteger := iCarteiraInvest;

      If iCarteiraGerenc > 0 Then
         QryCPMFDia.ParamByName('IDCARTEIRAGERENC').AsInteger := iCarteiraGerenc;

      QryCPMFDia.ParamByName('IDPLANPREVCTBPATR').AsInteger   := iPlanoPrev;
      QryCPMFDia.ParamByName('DATA').AsString                 := DateToStr(dDataOper);
      QryCPMFDia.Open;
      If (QryCPMFDia.FieldByName('SALDO').AsFloat > 0) Then
      begin
         iIdCarteiraXEvento := BuscaCarteiraXevento(iCarteiraInvest, iCarteiraGerenc, -13);
         If iIdCarteiraXEvento <> 0 Then
         begin
            if not AtualizaCota(dDataOper, iCarteiraInvest, iCarteiraGerenc, iPlanoPrev,
                                iIdCarteiraXEvento, ABS(QryCPMFDia.FieldByName('SALDO').AsFloat)*-1) then
               MsgDlg('Não foi possível atualizar a Cota com o Valor do CPMF!',
                      'Mensagem do Sistema',mtWarning,[mbOk],0);
         end;
      end;
      QryCPMFDia.Close;
   end;
end;

procedure TCotaComum.GravaEventosCota(dDataOper : TDateTime;
                                      iCarteiraInvest, iCarteiraGerenc, iPlanoPrev : Integer);
begin
   GravaValorLiquidarBMF(dDataOper, iCarteiraInvest, iCarteiraGerenc, iPlanoPrev);
   GravaValorLiquidarRVariavel(dDataOper, iCarteiraInvest, iCarteiraGerenc, iPlanoPrev);
   GravaValorPagarReceber(dDataOper, iCarteiraInvest, iCarteiraGerenc, iPlanoPrev);
   GravaValorAplicCotizar(dDataOper, iCarteiraInvest, iCarteiraGerenc, iPlanoPrev);
   GravaValorResgCotizar(dDataOper, iCarteiraInvest, iCarteiraGerenc, iPlanoPrev);
   GravaValorCPMF(dDataOper, iCarteiraInvest, iCarteiraGerenc, iPlanoPrev);
end;

//Al_9
//AL_5
//Rotina de Atualização do Saldo de Caixa e Calculo de Cota
function TCotaComum.CalculaCaixaCota(dDataAnt, dDataOper : TDateTime) : Boolean;
var
   cVlrApl, cVlrResg, cVlrDisponibilidade, cVlrExigibilidade, cVlrPatrimonio: Currency;
   dQtdeCotas, dValorCota, dValorizacao, dAplCotizar, dResCotizar : Double;
   //Al_14
   iCount, iIdCarteiraXEvento : Integer;
   dDataFim : TDateTime;
begin
   //AL_21
   With DtmCotaComum Do
   begin
      Try
         QryPatroPlanPrevContab.Close;
         QryPatroPlanPrevContab.Open;
         //Al_16
         //Busca todas as Carteiras Gerenciais para processar
         QryCarteiraGerenc.Close;
         QryCarteiraGerenc.Open;

         frmFechtoCartGerenc.prbCartGerenc.Max := QryCarteiraGerenc.RecordCount*QryPatroPlanPrevContab.RecordCount;

         frmFechtoCartGerenc.prbAtualiza.Max   := 4;

         //Al_16 - Fim

         //Al_15
         //AL_18
         frmFechtoCartGerenc.lblEventos.Caption := Espaco(' ',96);
         frmFechtoCartGerenc.lblEventos.Repaint;
         frmFechtoCartGerenc.lblEventos.Caption := 'Preparando o dia '+DateToStr(dDataOper)+' para Atualizar';
         frmFechtoCartGerenc.lblEventos.Repaint;
         //Al_15 - Fim
         //AL_8 -
         //Exclui as cotas do dia para frente
         QryDeleteHistCota.Close;
         QryDeleteHistCota.ParamByName('DATAHISTCOTA').AsString      := DateToStr(dDataOper);
         QryDeleteHistCota.ExecSQL;
         //Al_15
         frmFechtoCartGerenc.prbAtualiza.StepIt;

         //AL_8
         //AL_4
         //Exclui a Provisão de CPMF no dia da data origem
         QryDeleteHistProvCPMFDia.Close;
         QryDeleteHistProvCPMFDia.ParamByName('DATAORIGEM').AsString := DateToStr(dDataOper);
         QryDeleteHistProvCPMFDia.ExecSQL;
         //Al_15
         frmFechtoCartGerenc.prbAtualiza.StepIt;

         //Al_15
         //AL_18
         frmFechtoCartGerenc.lblEventos.Caption := Espaco(' ',96);
         frmFechtoCartGerenc.lblEventos.Repaint;
         frmFechtoCartGerenc.lblEventos.Caption := 'Atualização das Operações e Despesas de Renda Variável';
         frmFechtoCartGerenc.lblEventos.Repaint;
         //Al_15 - Fim
         //Atualiza as operações e despesas das Ordens de Renda Variável de D-3 no caixa
         If Not CaixaComum.AtualizaOperacaoDespesasRV(dDataOper) Then
            Raise Exception.Create('Ocorreu um problema na Atualização das operações de Renda Variável.');

         frmFechtoCartGerenc.prbAtualiza.StepIt;
         //Al_15
         //AL_18
         frmFechtoCartGerenc.lblEventos.Caption := Espaco(' ',96);
         frmFechtoCartGerenc.lblEventos.Repaint;
         frmFechtoCartGerenc.lblEventos.Caption := 'Atualização das Provisões';
         frmFechtoCartGerenc.lblEventos.Repaint;
         //Al_15 - Fim
         //Atualização da provisões vencidas e nao vencidas(Direito e Cpmf)
         If Not ProvisaoComum.AtualizaProvisao(dDataOper) Then
            Raise Exception.Create('Ocorreu um problema na Atualização das provisões(Direito e Cpmf).');

         //Al_16

         //Al_15
         frmFechtoCartGerenc.prbAtualiza.StepIt;

         iTipoInvestUsu := 2;

         //Al_17
         iCount         := 1;
         dDataFim       := dDataOper;
         While iCount <= 3 Do
         Begin
            dDataFim   := dDataFim + 1;
            While not DiasUteisInv.DiaUtil(dDataFim,-1,1,'',True,False,False) Do
              dDataFim := dDataFim + 1;   // Achar o próximo dia útil
            iCount := iCount + 1;
         End;

         //Para obter a data util do modulo de Fundos
         iTipoInvestUsu := 5;
         dDataAnt       := dDataOper - 1;
         While not DiasUteisInv.DiaUtil(dDataAnt,-1,1,'',True,False,False) Do
            dDataAnt    := dDataAnt - 1;   // Achar o dia útil anterior

         frmFechtoCartGerenc.prbAtualiza.Max    := 0;
         frmFechtoCartGerenc.prbAtualiza.StepIt;

         While Not QryPatroPlanPrevContab.Eof Do
         begin
            frmFechtoCartGerenc.lblPlano.Caption := Espaco(' ',96);
            frmFechtoCartGerenc.lblPlano.Repaint;
            frmFechtoCartGerenc.lblPlano.Caption := QryPatroPlanPrevContab.FieldByName('PLANPRVCONTABPATRO').AsString;
            frmFechtoCartGerenc.lblPlano.Repaint;

            //Al_15
            //AL_18
            frmFechtoCartGerenc.lblEventos.Caption := Espaco(' ',96);
            frmFechtoCartGerenc.lblEventos.Repaint;
            frmFechtoCartGerenc.lblEventos.Caption := 'Atualização do Saldo de Caixa com a valorização dos Fundos';
            frmFechtoCartGerenc.lblEventos.Repaint;
            //Al_15 - Fim
            iTipoInvestUsu := 5;
            //Busca a valorização dos fundos para atualizar o saldo de caixa
            dValorizacao := CaixaComum.CalculaValorizacaoFACFIF(DateToStr(dDataAnt), DateToStr(dDataOper),
                                                                QryPatroPlanPrevContab.FieldByName('IDPLANPREVCTBPATR').AsString,
                                                                '5');
            iTipoInvestUsu := 2;

         //Al_17 - Fim

            //Al_16

            //AL_18
            frmFechtoCartGerenc.lblEventos.Caption := Espaco(' ',96);
            frmFechtoCartGerenc.lblEventos.Repaint;
            frmFechtoCartGerenc.lblEventos.Caption := 'Apuração dos Eventos de Caixa/Cota                             ';
            frmFechtoCartGerenc.lblEventos.Repaint;
            //Grava eventos de Cota
            QryCarteiraGerenc.First;
            While Not QryCarteiraGerenc.Eof Do
            Begin
               OperComum.LimpaParametros(QryVerPosRendaVar);
               QryVerPosRendaVar.ParamByName('IDPLANPREVCTBPATR').AsInteger :=
                                       QryPatroPlanPrevContab.FieldByName('IDPLANPREVCTBPATR').AsInteger;
               QryVerPosRendaVar.ParamByName('IDCARTEIRAGERENC').AsInteger  :=
                                       QryCarteiraGerenc.FieldByName('IDCARTEIRAGERENC').AsInteger;
               QryVerPosRendaVar.ParamByName('DATA').AsString               := DateToStr(dDataOper);
               QryVerPosRendaVar.Open;
               if QryVerPosRendaVar.IsEmpty then
               begin
                  frmFechtoCartGerenc.prbCartGerenc.StepIt;
                  QryCarteiraGerenc.Next;
                  Continue;
               end;
               frmFechtoCartGerenc.lblCartGerenc.Caption := Espaco(' ',96);
               frmFechtoCartGerenc.lblCartGerenc.Repaint;
               frmFechtoCartGerenc.lblCartGerenc.Caption := QryCarteiraGerenc.FieldByName('DESCCARTGERENC').AsString;
               frmFechtoCartGerenc.lblCartGerenc.Repaint;

               //AL_22
               //Atualiza os saldos do caixa conforme as operações
               if not CaixaComum.AtualizaSaldoDasOperacoes(dDataOper,
                                                           QryCarteiraGerenc.FieldByName('IDCARTEIRAINVEST').AsInteger,
                                                           QryCarteiraGerenc.FieldByName('IDCARTEIRAGERENC').AsInteger,
                                                           QryPatroPlanPrevContab.FieldByName('IDPLANPREVCTBPATR').AsInteger) then
                  Raise Exception.Create('Ocorreu um problema na Atualização do Saldo de Caixa.');

               //AL_22
               //Busca e provisiona o CPMF do dia
               OperComum.LimpaParametros(QryCPMFDiaProvisao);
               If QryCarteiraGerenc.FieldByName('IDCARTEIRAINVEST').AsInteger > 0 Then
                  QryCPMFDiaProvisao.ParambyName('IDCARTEIRAINVEST').AsInteger  :=
                           QryCarteiraGerenc.FieldByName('IDCARTEIRAINVEST').AsInteger;

               If QryCarteiraGerenc.FieldByName('IDCARTEIRAGERENC').AsInteger > 0 Then
                  QryCPMFDiaProvisao.ParambyName('IDCARTEIRAGERENC').AsInteger  :=
                           QryCarteiraGerenc.FieldByName('IDCARTEIRAGERENC').AsInteger;

               QryCPMFDiaProvisao.ParambyName('IDPLANPREVCTBPATR').AsInteger  :=
                           QryPatroPlanPrevContab.FieldByName('IDPLANPREVCTBPATR').AsInteger;

               QryCPMFDiaProvisao.ParambyName('DATA').AsString := DateToStr(dDataOper);
               QryCPMFDiaProvisao.Open;

               If (QryCPMFDiaProvisao.FieldByname('VLRHISTCAIXA').AsFloat > 0) Then
               begin
                  //AL_8
                  If Not ProvisaoComum.GravaCPMFProvisao(dDataOper,
                                                         QryCPMFDiaProvisao.FieldByname('VLRHISTCAIXA').AsFloat,
                                                         0, 0,
                                                         QryCarteiraGerenc.FieldByName('IDCARTEIRAINVEST').AsInteger,
                                                         QryCarteiraGerenc.FieldByName('IDCARTEIRAGERENC').AsInteger,
                                                         QryPatroPlanPrevContab.FieldByName('IDPLANPREVCTBPATR').AsInteger) Then
                     Raise Exception.Create('Ocorreu um problema na Provisão de CPMF.');
                  //AL_8
               end;

               QryCPMFDiaProvisao.Close;

               //AL_22

               //Grava a valorização do saldo no caixa
               If Not CaixaComum.ValorizacaoSaldoCaixa(DateToStr(dDataAnt), DateToStr(dDataOper),
                                                       QryCarteiraGerenc.FieldByName('IDCARTEIRAINVEST').AsInteger,
                                                       QryCarteiraGerenc.FieldByName('IDCARTEIRAGERENC').AsInteger,
                                                       QryPatroPlanPrevContab.FieldByName('IDPLANPREVCTBPATR').AsInteger,
                                                       dValorizacao) then
                  Raise Exception.Create('Ocorreu um problema na gravação da valorização do Saldo de Caixa.');

               //AL_22
               //Al_10
               OperComum.LimpaParametros(DmRelCarteiraGerenc.qryCartGerencialDet);
               OperComum.LimpaParametros(QryComposcaoPatrimonial);
               QryComposcaoPatrimonial.Sql.Clear;
               //Al_20
               QryComposcaoPatrimonial.Sql.Add('SELECT IDGROUP, IDEVENTOCAIXACOTA, DATAOPER, ');
               QryComposcaoPatrimonial.Sql.Add('SUM(VALOR) AS VALOR FROM ( ');
               QryComposcaoPatrimonial.Sql.Add(DmRelCarteiraGerenc.qryCartGerencialDet.Sql.GetText);
               QryComposcaoPatrimonial.Sql.Add(' ) GROUP BY IDGROUP, IDEVENTOCAIXACOTA, DATAOPER');
               QryComposcaoPatrimonial.ParamByName('VARGROUP').AsString          := 'S';
               QryComposcaoPatrimonial.ParamByName('DATAANTERIOR').AsString      := DateToStr(dDataAnt);
               QryComposcaoPatrimonial.ParamByName('DATAINI').AsString           := DateToStr(dDataOper);
               QryComposcaoPatrimonial.ParamByName('DATAFIM').AsString           := DateToStr(dDataFim);
               QryComposcaoPatrimonial.ParamByName('IDPLANPREVCTBPATR').AsInteger:=
                                       QryPatroPlanPrevContab.FieldByName('IDPLANPREVCTBPATR').AsInteger;
               QryComposcaoPatrimonial.ParamByName('IDCARTEIRAGERENC').AsInteger :=
                                       QryCarteiraGerenc.FieldByName('IDCARTEIRAGERENC').AsInteger;
               QryComposcaoPatrimonial.Open;

               if QryComposcaoPatrimonial.RecordCount > 0 then
                  frmFechtoCartGerenc.prbAtualiza.Max   := QryComposcaoPatrimonial.RecordCount + 11
               else
                  frmFechtoCartGerenc.prbAtualiza.Max   := QryComposcaoPatrimonial.RecordCount + 2;

               frmFechtoCartGerenc.prbAtualiza.StepIt;

               //AL_22
               //Al_19
               cVlrPatrimonio      := 0;
               dAplCotizar         := 0;
               dResCotizar         := 0;

               QryComposcaoPatrimonial.First;
               While Not QryComposcaoPatrimonial.Eof do
               begin
                  if QryComposcaoPatrimonial.FieldByName('VALOR').AsFloat <> 0  then
                  begin
                     //CARTEIRA DE RENDA VARIAVEL
                     if QryComposcaoPatrimonial.FieldByName('IDGROUP').AsString = '1' then
                     begin
                        iIdCarteiraXEvento := BuscaCarteiraXevento(
                                                   QryCarteiraGerenc.FieldByName('IDCARTEIRAINVEST').AsInteger,
                                                   QryCarteiraGerenc.FieldByName('IDCARTEIRAGERENC').AsInteger,
                                                   -4);
                        if iIdCarteiraXEvento <> 0 Then
                        begin
                           if not AtualizaCota(dDataOper,
                                               QryCarteiraGerenc.FieldByName('IDCARTEIRAINVEST').AsInteger,
                                               QryCarteiraGerenc.FieldByName('IDCARTEIRAGERENC').AsInteger,
                                               QryPatroPlanPrevContab.FieldByName('IDPLANPREVCTBPATR').AsInteger,
                                               iIdCarteiraXEvento,
                                               QryComposcaoPatrimonial.FieldByName('VALOR').AsFloat) then
                              Raise Exception.Create('Ocorreu um problema na gravação do evento "Carteira de Renda Variavel" na Cota.');
                        end;

                        cVlrPatrimonio := cVlrPatrimonio + QryComposcaoPatrimonial.FieldByName('VALOR').AsFloat;
                     end
                     //VALOR A PAGAR/RECEBER
                     else if QryComposcaoPatrimonial.FieldByName('IDGROUP').AsString = '3' then
                     begin
                        iIdCarteiraXEvento := BuscaCarteiraXevento(
                                                   QryCarteiraGerenc.FieldByName('IDCARTEIRAINVEST').AsInteger,
                                                   QryCarteiraGerenc.FieldByName('IDCARTEIRAGERENC').AsInteger,
                                                   -14);
                        if iIdCarteiraXEvento <> 0 Then
                        begin
                           if not AtualizaCota(dDataOper,
                                               QryCarteiraGerenc.FieldByName('IDCARTEIRAINVEST').AsInteger,
                                               QryCarteiraGerenc.FieldByName('IDCARTEIRAGERENC').AsInteger,
                                               QryPatroPlanPrevContab.FieldByName('IDPLANPREVCTBPATR').AsInteger,
                                               iIdCarteiraXEvento,
                                               QryComposcaoPatrimonial.FieldByName('VALOR').AsFloat) then
                              Raise Exception.Create('Ocorreu um problema na gravação do evento "Valores a Pagar/Receber" na Cota.');
                        end;

                        cVlrPatrimonio := cVlrPatrimonio + QryComposcaoPatrimonial.FieldByName('VALOR').AsFloat;
                     end
                     //Al_20
                     //SALDO DE CAIXA (REMUNERAÇÃO)
                     else if ((QryComposcaoPatrimonial.FieldByName('IDGROUP').AsString = '4') And
                              (QryComposcaoPatrimonial.FieldByName('IDEVENTOCAIXACOTA').AsInteger = -6)) then
                     begin
                        if (QryComposcaoPatrimonial.FieldByName('DATAOPER').AsDateTime = dDataOper) then
                        begin
                           iIdCarteiraXEvento := BuscaCarteiraXevento(
                                      QryCarteiraGerenc.FieldByName('IDCARTEIRAINVEST').AsInteger,
                                      QryCarteiraGerenc.FieldByName('IDCARTEIRAGERENC').AsInteger,
                                      -6);

                           if iIdCarteiraXEvento <> 0 Then
                           begin
                              if not AtualizaCota(dDataOper,
                                                  QryCarteiraGerenc.FieldByName('IDCARTEIRAINVEST').AsInteger,
                                                  QryCarteiraGerenc.FieldByName('IDCARTEIRAGERENC').AsInteger,
                                                  QryPatroPlanPrevContab.FieldByName('IDPLANPREVCTBPATR').AsInteger,
                                                  iIdCarteiraXEvento,
                                                  QryComposcaoPatrimonial.FieldByName('VALOR').AsFloat) then
                                 Raise Exception.Create('Ocorreu um problema na gravação do evento "Valores a Pagar/Receber" na Cota.');
                           end;

                           cVlrPatrimonio := cVlrPatrimonio + QryComposcaoPatrimonial.FieldByName('VALOR').AsFloat;
                        end;
                     end;
                  end;
                  QryComposcaoPatrimonial.Next;
                  frmFechtoCartGerenc.prbAtualiza.StepIt;
               end;
               //Al_10 - Fim
               QryComposcaoPatrimonial.Close;

               //Grava os eventos que compoem a cota
               GravaEventosCota(dDataOper,
                                QryCarteiraGerenc.FieldByName('IDCARTEIRAINVEST').AsInteger,
                                QryCarteiraGerenc.FieldByName('IDCARTEIRAGERENC').AsInteger,
                                QryPatroPlanPrevContab.FieldByName('IDPLANPREVCTBPATR').AsInteger);
               frmFechtoCartGerenc.prbAtualiza.StepIt;

               If cVlrPatrimonio <> 0 Then
               Begin
                  dQtdeCotas     := BuscaEventosHistCota(dDataAnt,
                                    QryCarteiraGerenc.FieldByName('IDCARTEIRAINVEST').AsInteger,
                                    QryCarteiraGerenc.FieldByName('IDCARTEIRAGERENC').AsInteger,
                                    QryPatroPlanPrevContab.FieldByName('IDPLANPREVCTBPATR').AsInteger,
                                    -3);
                  frmFechtoCartGerenc.prbAtualiza.StepIt;

                  If dQtdeCotas   = 0 Then
                     dQtdeCotas  := 1000;

                  //Apura cota do dia
                  dValorCota := OperComum.Round(OperComum.DivValorZero(cVlrPatrimonio, dQtdeCotas),9);
                  //Al_2 - Fim
                  frmFechtoCartGerenc.prbAtualiza.StepIt;

                  //Cotiza Aplicação
                  dAplCotizar   := OperComum.Round(OperComum.DivValorZero(
                                     CaixaComum.BuscaValorCaixa(
                                        dDataOper,
                                        QryCarteiraGerenc.FieldByName('IDCARTEIRAINVEST').AsInteger,
                                        QryCarteiraGerenc.FieldByName('IDCARTEIRAGERENC').AsInteger,
                                        -9,
                                        QryPatroPlanPrevContab.FieldByName('IDPLANPREVCTBPATR').AsInteger),dValorCota),9);
                  frmFechtoCartGerenc.prbAtualiza.StepIt;

                  //Al_7
                  If (DateToStr(dDataOper) = '01/02/2005') Then
                  begin
                     cVlrResg   := CaixaComum.BuscaValorCaixa(dDataOper,
                                              QryCarteiraGerenc.FieldByName('IDCARTEIRAINVEST').AsInteger,
                                              QryCarteiraGerenc.FieldByName('IDCARTEIRAGERENC').AsInteger,
                                              -10,
                                              QryPatroPlanPrevContab.FieldByName('IDPLANPREVCTBPATR').AsInteger);
                    //Apura cota do dia
                     dValorCota := OperComum.Round(OperComum.DivValorZero((cVlrPatrimonio+ABS(cVlrResg)), dQtdeCotas),9);
                  end;
                  //Al_7 - Fim

                  frmFechtoCartGerenc.prbAtualiza.StepIt;

                  //Cotiza Regate
                  dResCotizar   := OperComum.Round(OperComum.DivValorZero(
                                     CaixaComum.BuscaValorCaixa(dDataOper,
                                        QryCarteiraGerenc.FieldByName('IDCARTEIRAINVEST').AsInteger,
                                        QryCarteiraGerenc.FieldByName('IDCARTEIRAGERENC').AsInteger,
                                        -10,
                                        QryPatroPlanPrevContab.FieldByName('IDPLANPREVCTBPATR').AsInteger),dValorCota),9);
                  frmFechtoCartGerenc.prbAtualiza.StepIt;

                  If (dAplCotizar <> 0) Or (dResCotizar <> 0) Then
                  begin
                     dQtdeCotas         := dQtdeCotas + dAplCotizar - dResCotizar;
                     //Apura cota do dia
                     dValorCota         := OperComum.Round(OperComum.DivValorZero(cVlrPatrimonio, dQtdeCotas),9);

                     iIdCarteiraXEvento := BuscaCarteiraXevento(
                                        QryCarteiraGerenc.FieldByName('IDCARTEIRAINVEST').AsInteger,
                                        QryCarteiraGerenc.FieldByName('IDCARTEIRAGERENC').AsInteger,
                                        -10);

                     //Grava Resgate a Cotizar
                     //Al_12
                     if iIdCarteiraXEvento <> 0 Then
                     begin
                        if not AtualizaCota(dDataOper,
                                            QryCarteiraGerenc.FieldByName('IDCARTEIRAINVEST').AsInteger,
                                            QryCarteiraGerenc.FieldByName('IDCARTEIRAGERENC').AsInteger,
                                            QryPatroPlanPrevContab.FieldByName('IDPLANPREVCTBPATR').AsInteger,
                                            iIdCarteiraXEvento, dResCotizar) then
                           Raise Exception.Create('Não foi possível atualizar a Cota com o Resgate a Cotizar!');
                     end;

                     iIdCarteiraXEvento := BuscaCarteiraXevento(
                                                QryCarteiraGerenc.FieldByName('IDCARTEIRAINVEST').AsInteger,
                                                QryCarteiraGerenc.FieldByName('IDCARTEIRAGERENC').AsInteger,
                                                -9);

                     //Grava Aplicação a Cotizar
                     //Al_12
                     if iIdCarteiraXEvento <> 0 Then
                     begin
                        if not AtualizaCota(dDataOper,
                                            QryCarteiraGerenc.FieldByName('IDCARTEIRAINVEST').AsInteger,
                                            QryCarteiraGerenc.FieldByName('IDCARTEIRAGERENC').AsInteger,
                                            QryPatroPlanPrevContab.FieldByName('IDPLANPREVCTBPATR').AsInteger,
                                            iIdCarteiraXEvento, dAplCotizar) then
                           Raise Exception.Create('Não foi possível atualizar a Cota com a Aplicação a Cotizar!');
                     end;

                  end;

                  frmFechtoCartGerenc.prbAtualiza.StepIt;

                  iIdCarteiraXEvento := BuscaCarteiraXevento(
                                             QryCarteiraGerenc.FieldByName('IDCARTEIRAINVEST').AsInteger,
                                             QryCarteiraGerenc.FieldByName('IDCARTEIRAGERENC').AsInteger,
                                             -1);
                  //Grava Patrimonio Final
                  //Al_12
                  if iIdCarteiraXEvento <> 0 Then
                  begin
                     if not AtualizaCota(dDataOper,
                                         QryCarteiraGerenc.FieldByName('IDCARTEIRAINVEST').AsInteger,
                                         QryCarteiraGerenc.FieldByName('IDCARTEIRAGERENC').AsInteger,
                                         QryPatroPlanPrevContab.FieldByName('IDPLANPREVCTBPATR').AsInteger,
                                         iIdCarteiraXEvento, cVlrPatrimonio) then
                        Raise Exception.Create('Não foi possível atualizar a Cota com o Patrimônio Final!');
                  end;
                  frmFechtoCartGerenc.prbAtualiza.StepIt;

                  iIdCarteiraXEvento := BuscaCarteiraXevento(
                                             QryCarteiraGerenc.FieldByName('IDCARTEIRAINVEST').AsInteger,
                                             QryCarteiraGerenc.FieldByName('IDCARTEIRAGERENC').AsInteger,
                                             -3);
                  //Grava Quantidade de Cotas
                  //Al_12
                  if iIdCarteiraXEvento <> 0 Then
                  begin
                     if not AtualizaCota(dDataOper,
                                         QryCarteiraGerenc.FieldByName('IDCARTEIRAINVEST').AsInteger,
                                         QryCarteiraGerenc.FieldByName('IDCARTEIRAGERENC').AsInteger,
                                         QryPatroPlanPrevContab.FieldByName('IDPLANPREVCTBPATR').AsInteger,
                                         iIdCarteiraXEvento, dQtdeCotas) then
                        Raise Exception.Create('Não foi possível atualizar a Cota com a Quantidade de Cotas!');
                  end;
                  frmFechtoCartGerenc.prbAtualiza.StepIt;

                  iIdCarteiraXEvento := BuscaCarteiraXevento(
                                             QryCarteiraGerenc.FieldByName('IDCARTEIRAINVEST').AsInteger,
                                             QryCarteiraGerenc.FieldByName('IDCARTEIRAGERENC').AsInteger,
                                             -2);
                  //Grava Valor de Cota
                  //Al_12
                  if iIdCarteiraXEvento <> 0 Then
                  begin
                     if not AtualizaCota(dDataOper,
                                         QryCarteiraGerenc.FieldByName('IDCARTEIRAINVEST').AsInteger,
                                         QryCarteiraGerenc.FieldByName('IDCARTEIRAGERENC').AsInteger,
                                         QryPatroPlanPrevContab.FieldByName('IDPLANPREVCTBPATR').AsInteger,
                                         iIdCarteiraXEvento, dValorCota) then
                        Raise Exception.Create('Não foi possível atualizar a Cota com o Valor de Cota!');
                  end;
                  frmFechtoCartGerenc.prbAtualiza.StepIt;
               end;

               QryCarteiraGerenc.Next;

               //AL_18
               frmFechtoCartGerenc.lblEventos.Caption := Espaco(' ',96);
               frmFechtoCartGerenc.lblEventos.Repaint;
               //Al_13

               frmFechtoCartGerenc.prbAtualiza.Max   := 0;
               frmFechtoCartGerenc.prbAtualiza.StepIt;

               frmFechtoCartGerenc.prbCartGerenc.StepIt;
            end;

            QryPatroPlanPrevContab.Next;

            frmFechtoCartGerenc.lblCartGerenc.Caption := Espaco(' ',96);
            frmFechtoCartGerenc.lblCartGerenc.Repaint;

            frmFechtoCartGerenc.prbAtualiza.Max    := 0;
            frmFechtoCartGerenc.prbAtualiza.StepIt;
         end;
         Result := True;
      Except
         On E:Exception Do Begin
           MsgDlg('O Processo de Fechamento das Carteiras Gerenciais foi cancelado!'#13+
                  'Mensagem : '+E.Message,'Mensagem do Sistema',mtWarning,[mbOk],0);
           Result := False;
         End;
      end;
      QryComposcaoPatrimonial.Close;
      QryPatroPlanPrevContab.Close;
      QryCPMFDiaProvisao.Close;
      QryCarteiraGerenc.Close;
   end;

   frmFechtoCartGerenc.lblPlano.Caption := Espaco(' ',96);
   frmFechtoCartGerenc.lblPlano.Repaint;

   frmFechtoCartGerenc.lblCartGerenc.Caption := Espaco(' ',96);
   frmFechtoCartGerenc.lblCartGerenc.Repaint;

   frmFechtoCartGerenc.prbCartGerenc.Max := 0;
   frmFechtoCartGerenc.prbCartGerenc.StepIt;

   frmFechtoCartGerenc.lblEventos.Caption := Espaco(' ',96);
   frmFechtoCartGerenc.lblEventos.Repaint;

   frmFechtoCartGerenc.prbAtualiza.Max    := 0;
   frmFechtoCartGerenc.prbAtualiza.StepIt;
   //AL_21 - Fim
//Al_13 - Fim
end;
//AL_5 - Fim

end.
