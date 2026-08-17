//********************************************************************************************************
// Data	     : 28/05/2008
// Codigo    : AL_9
// Pendência : 24716
// SOL       : 55534
// Função    : Out of Memory
//******************************************************************************
// Data     : 07/07/2006
// Código   : AL_8
// Desc     : Retirada do Saldo CCI de Custódia da BuscaTodosSaldosInvestLote
//******************************************************************************
// Data     : 08/06/2006
// Código   : AL_7
// Pendencia: 20777
// SOL      : 35179
// Desc     : Implementação de Provisão de Perda por fluxo de percentual
//******************************************************************************
// Data     : 03/04/2006
// Código   : AL_6
// Pendencia: 21403
// SOL      : 39846
// Desc     : Implementação de Saldo CC/CCI na Histcustodia
//******************************************************************************
// Data     : 24/03/2006
// Código   : AL_5
// Motivo   : Atualização da crítica de cálculo de IR para Renda Variavel
//******************************************************************************
// Data     : 10/02/2006
// Código   : AL_4
// Motivo   : Implementação do recolhimento de CPMF conforme a Portaria MF No. 433,
//            de 27 de dezembro de 2005
//******************************************************************************
// Data     : 10/05/2005
// Código   : AL_3
// Motivo   : Incluido a udiasuteis e alterado para utilizar na funcionalidade de CPMF
//******************************************************************************
// Data     : 06/10/2004
// Código   : AL_2
// Motivo   : Alteração Legislação CPMF
//******************************************************************************
// Data     : 22/06/2004
// Código   : AL_1
// Motivo   : Inclusão de variável na função BuscaTodosSaldosInvestLote
//******************************************************************************
// Sistema  .: Investimentos
// Objetivo .: Unit com os cálculos dos impostos
// Unit     .: UImpostos
// Data     .: 25/07/2000
//------------------------------------------------------------------

unit UImpostos;

interface

Uses
   Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
   Db, USistema, Wwquery, OleCtrls, vcf1, IvDictio, IvMulti, IvEMulti,
   MAHlpBtn, StdCtrls, TB97Tlbr, TB97, ExtCtrls,DBTables,Math,UMensErro,
   UOperacaoInvest;

Type
   TImpostos = Class(TObject)
   private
    //
   public
      // Função que calcula o IOF
      function CalculaIOF(iTipo:longint;dDataIni,dDataFim:TDateTime;
                        fVlrAqui,fVlrAtual:Double;sFlgIOF:String):Double;
      // Função busca aliquota do IR
      function BuscaAliquotaIR(iTipoInvest,iTipoOper,iTipoMercado :Integer;
                         DtaVigencia :TDateTime):Double;
      // Função que calcula o IR
      Function CalculaIR(iTipoInvestimento,iIDInvestimento,iCarteiraInvest, iCarteiraGerenc,
                         iTipoOperacao, iTipoMercado :Integer;
                         sLote : String;
                         dDataIni,dDataFim : TDateTime;
                         fVlrInicial,fVlrAtual,fVlrIOF:Double;sFlgIR,sFlgTrataIR :String;
                         var fVlrRendimento : Double):Double;//Currency;

      // Função que verifica se há provisionamento de IR
      function BuscaProvisaoIR(iTipoInvestimento,iIDInvestimento:Integer):Boolean;

      // Procedure que grava o IR Litigio
      function GravaIrLitigio(IdTipoInvestimento        :Integer;
                              DataFatoGerador           :TDateTime;
                              IdOperacaoInvest          :Integer;
                              DesFatoGerador            :String;
                              IdInvestimento,IDPlanoPrev,IDPatrocinadora :integer;
                              VlrIRLitigio              :Double;
                              VlrRendimento             :Double  = 0;
                              iIdOperRenfix             :Integer = -1;
                              iIdOperFundo              :Integer = -1;
                              iIdHistCartInv            :Integer = -1;
                              iIdHistRenfix             :Integer = -1;
                              iIdHistFundo              :Integer = -1):boolean;

      // Procedure atualiza o saldo Litígio
      Procedure AtualizaIrLitigio(dDataAtualizacao :TDateTime);

      // Procedure que Exclui os registros atualiza o saldo Litígio
      procedure EstornaIRLitigio(IDOperacaoInvest :Integer;dDataEstorno:TDateTime);

      // função que Exclui do SaldoIRLitigio
      function ExcluiSaldoIRLitigio(dDataAtualizacao:TDateTime):boolean;

      // função que grava Contabilização Saldo IR Litígio de Renda Fixa
      function ContabSaldoIRLitigio(dDataAtualizacao:TDateTime;iTipoInvest:Integer;
                                    wVlrVariacao:double;var wPlano,wPlanilha:integer):boolean;

      function CalculaSaldoIRLitigio(dDataAtualizacao:TDateTime;iTipoInvest:Integer):boolean;

      function BuscaPadraoContabil(iTipoInvest,iTipoOperacao,iTipoDespesa:integer;wVlrVariacao:double):string;

      // Função busca aliquota do CPMF
      function BuscaAliquotaCPMF(DtaVigencia :String):Double;

      function CalculaDataLiqCPMF(dDataLancto :TDateTime):TDateTime;

      function VerificaRetTrimestral(dDataRef:TDateTime;bDiaUtil,bOper:boolean):boolean;

      function BuscaDataUltRET(dDataRef:TDateTime):TDateTime;

   end;

var
   Impostos : TImpostos;
   wVlrIOF,wVlrIRDia,wVlrVariacao  : Double;
   wTipoRecDesBol,wMensErro : string;
   bCriaLancto : boolean;
   wPlanilha, wDocumento, wPlano :Integer;

implementation

Uses
  DBaseDados,UBibliotecaInvest,UOperComum, dOperComum,
  dFuncoesInvest, UFuncoesRendaFixa, UDataBase, uDiasUteisInv, uDiasUteis;

// Função que calcula o IOF
function TImpostos.CalculaIOF(iTipo:longint;dDataIni,dDataFim:TDateTime;
                    fVlrAqui,fVlrAtual:Double;sFlgIOF:String):Double;
var
   iPrazo : Double;
begin
   Result := 0;
   iPrazo := (dDataFim - dDataIni);
   if ( (iTipo = 1) and                                 // 1 = Renda Fixa
        (sFlgIOF = 'S') and                             // Cálcula IOF
        (iPrazo < 30) and                               // Prazo
        (dDataIni >= StrToDate('01/07/1999')) and       // início vigência
        (dDataFim >= StrToDate('01/08/1999')) ) then    // início de cobrança
   begin
      With dtmFuncoesInvest.QryIOF Do
      Begin
         Close;
         if not(Prepared) then Prepare;
         ParamByName('PRAZO').asFloat := iPrazo;
         Open;
         Result := (fVlrAtual - fVlrAqui)* (FieldByName('PERCENTUAL').AsFloat/100);
         If Result  < 0 Then
            Result := 0;
         Result := StrToFloat(FormatFloat('#0.00',Result));
         Close;
      End;
   end;
end;

function TImpostos.BuscaAliquotaIR(iTipoInvest,iTipoOper,iTipoMercado :Integer;
                         DtaVigencia :TDateTime):Double;
begin
   Result := 0;
   // -------------------------------------------------------------------------------------------------
   //    Verifica o Padrão de Aliquota mais adequado
   // -------------------------------------------------------------------------------------------------
   // Caso mais detalhado: For Tipo de operação e Data
   If ((iTipoOper <> 0) and (iTipoOper <> -1))  then
   begin
      with dtmFuncoesInvest.QryPadraoIROPE do
      begin
         Close;
         if not(Prepared) then Prepare;
         ParamByName('IDTIPOOPERACAO').asInteger   :=iTipoOper;
         ParamByName('DTREF').asDateTime           :=DtaVigencia;
         Open;
      end;
      if dtmFuncoesInvest.QryPadraoIROPE.RecordCount > 1 then
         Result := -4 // Erro: ambigüidade no Padrão de Lançamento
      else
         Result:=dtmFuncoesInvest.QryPadraoIROPE.FieldByName('ALIQUOTA').AsFloat;
   end;

   // Escolheu o investimento e o mercado
   If ( (iTipoInvest >0) and (iTipoMercado >0) and (iTipoOper=-1))  then
   begin
      with dtmFuncoesInvest.QryPadraoIRMer do
      begin
         Close;
         if not(Prepared) then Prepare;
         ParamByName('IDTIPOINVEST').asInteger :=iTipoInvest;
         ParamByName('IDMERCADO').asInteger    :=iTipoMercado;
         ParamByName('DTREF').asDateTime       :=DtaVigencia;
         Open;
      end;
      if dtmFuncoesInvest.QryPadraoIRMer.RecordCount > 1 then
         Result := -4 // Erro: ambigüidade no Padrão de Lançamento
      else
         Result:=dtmFuncoesInvest.QryPadraoIRMer.FieldByName('ALIQUOTA').AsFloat;
   end;

   // Buscar só o investimento
   If Result=0  then
   begin
      with dtmFuncoesInvest.QryPadraoIR do
      begin
         Close;
         if not(Prepared) then Prepare;
         ParamByName('IDTIPOINVEST').asInteger := iTipoInvest;
         ParamByName('DTREF').AsString         := DateToStr(DtaVigencia);
         Open;
      end;
      if dtmFuncoesInvest.QryPadraoIR.RecordCount > 1 then
         Result := -4 // Erro: ambigüidade no Padrão de Lançamento
      else
         Result:=dtmFuncoesInvest.QryPadraoIR.FieldByName('ALIQUOTA').AsFloat;
   end;
End;

// Função que calcula o IR
Function TImpostos.CalculaIR(iTipoInvestimento,iIDInvestimento,iCarteiraInvest,iCarteiraGerenc,
                             iTipoOperacao,iTipoMercado :Integer;
                             sLote :String;
                             dDataIni,dDataFim:TDateTime;
                             fVlrInicial,fVlrAtual,fVlrIOF:Double;sFlgIR,sFlgTrataIR :String;
                             var fVlrRendimento : Double):Double;//Currency;
Var
  wSaldoInutil,wAliquota : Double;
Begin
   Result := 0;
   If sFlgIR='S' Then        //  Apura IR
   Begin
      If sFlgTrataIR <> 'N' Then
      Begin
         If (dDataIni<StrToDate('01/01/1998')) And (iIDInvestimento <> 0) Then
         Begin
            //AL_1
            //AL_2
            //AL_6
            //AL_7
            //AL_8
            OperComum.BuscaTodosSaldosInvestLote(
                          iCarteiraInvest,
                          iCarteiraGerenc,
                          iIDInvestimento,
                          9999999,-1,sLote,'01/01/1998', -1,
                          wSaldoInutil,fVlrInicial,wSaldoInutil,wSaldoInutil,wSaldoInutil,
                          wSaldoInutil,wSaldoInutil,wSaldoInutil,wSaldoInutil,wSaldoInutil,
                          wSaldoInutil,wSaldoInutil,wSaldoInutil,wSaldoInutil,wSaldoInutil,
                          wSaldoInutil,wSaldoInutil,wSaldoInutil,wSaldoInutil);
         End;
         wAliquota:=BuscaAliquotaIR(iTipoInvestimento,iTipoOperacao,iTipoMercado,dDataFim);
         If wAliquota<>0 Then
         begin
            if sFlgTrataIR = 'V' then                      // Fato Gerador -> Valor da Operação
            begin
               fVlrRendimento := fVlrAtual;
               Result :=(fVlrRendimento*(wAliquota/100)-0.0049);
            end
            else if sFlgTrataIR = 'G' then                 // Fato Gerador -> Ganho Capital
            begin
               fVlrRendimento := fVlrAtual-fVlrInicial-fVlrIOF;
               Result :=((fVlrRendimento)*(wAliquota/100)-0.0049);
            end;
            Result := StrToFloat(FormatFloat('#0.00',Result));
         end;
      End;
   End
End;

function TImpostos.BuscaProvisaoIR(iTipoInvestimento,iIDInvestimento:Integer):Boolean;
begin
   Result:= False;
   // -------------------------------------------------------------------------------------------------
   //    Verifica o Padrão  mais adequado
   // -------------------------------------------------------------------------------------------------
   If iTipoInvestimento = 2 then // Renda Variável
   begin
      //AL_5
      if pRPI.FLGPROVISIONAIRRV = 'S' then
         Result := True;
   end
   else if iTipoInvestimento = 1 then // Renda Fixa
   begin
      with dtmFuncoesInvest.QryProvIRRF do
      begin
         Close;
         if not(Prepared) then Prepare;
         ParamByName('IDTITRENFIXA').asInteger   := iIDInvestimento;
         Open;
         if RecordCount > 1 then // Erro: ambigüidade no Padrão de Lançamento
            MsgDlg('Status para provisionamento de IR não encontrado para o imposto de renda ', 'Erro', mtError, [mbOk],0)
         else if (RecordCount > 0) and
                 (not (FieldByName('IRRFFLGPROVISIONAIR').IsNull)) and
                 (FieldByName('FLGPROVISIONAIRRF').AsString = 'S') then
            Result := True;

         if (RecordCount > 0) and (FieldByName('FLGPROVISIONAIR').IsNull) then
         begin
            dtmFuncoesInvest.QryParamInvest.Close;
            dtmFuncoesInvest.QryParamInvest.Open;
            if dtmFuncoesInvest.QryParamInvest.FieldByName('FLGPROVISIONAIRRF').AsString = 'S' then
               Result := True;
         end;
         Close;
      end;
   end;
   dtmFuncoesInvest.QryProvIRRV.Close;
   dtmFuncoesInvest.QryParamInvest.Close;
end;

procedure TImpostos.EstornaIRLitigio(IDOperacaoInvest :Integer;dDataEstorno:TDateTime);
begin
   with dtmFuncoesInvest.QryDeleteSaldoLitigio Do
   begin
      Close;
      ParamByName('IDOPERACAOINVEST').AsInteger :=IDOPERACAOINVEST;
      ExecSql;
   end;
   with dtmFuncoesInvest.QryDeleteLitigio Do
   begin
      Close;
      ParamByName('IDOPERACAOINVEST').AsInteger :=IDOPERACAOINVEST;
      ExecSql;
   end;
end;


function TImpostos.GravaIrLitigio(IdTipoInvestimento    :Integer;
                                  DataFatoGerador       :TDateTime;
                                  IdOperacaoInvest      :Integer;
                                  DesFatoGerador        :String;
                                  IdInvestimento,IDPlanoPrev,IDPatrocinadora :integer;
                                  VlrIRLitigio          :Double;
                                  VlrRendimento         :Double = 0;
                                  iIdOperRenfix         :Integer = -1;
                                  iIdOperFundo          :Integer = -1;
                                  iIdHistCartInv        :Integer = -1;
                                  iIdHistRenfix         :Integer = -1;
                                  iIdHistFundo          :Integer = -1 ):boolean;
begin
   //AL_9
   Result := True;
   if (VlrIRLitigio = 0) and (VlrRendimento=0) then
      Exit;
   try
      // ORIGEMIRLITIGIO
      // 1  - Renda Fixa
      // 2  - Renda Variavel
      // 3  - BM&F
      // 4  - Fundos de Renda Fixa
      // 5  - Fundos de Renda Variavel
      // 7  - FUNDO IMOBILIARIO'

      // -1  - RESULTADO TRIMESTRE RENDA FIXA
      // -2  - RESULTADO TRIMESTRE RENDA VARIAVEL
      // -5 - RESULTADO TRIMESTRE FDO ACOES
      // -7 - RESULTADO TRIMESTRE FDO IMOBILIARIO

      // Fundos de Investimento (Troca do IdTipoInvest pelo IdOrigemLitigio)
      if IdTipoInvestimento = 5 then
         IdTipoInvestimento := 4  // Fundo de Renda Fixa
      else if IdTipoInvestimento = 6 then
         IdTipoInvestimento := 5;  // Fundo de Ações

      OperComum.LimpaParametros(dtmFuncoesInvest.QryInsertLitigio);

      dtmFuncoesInvest.QryInsertLitigio.ParamByName('IDIRLITIGIO').AsInteger       := LeUltRegistro(Nil,'IRLITIGIO');
      dtmFuncoesInvest.QryInsertLitigio.ParamByName('IDORIGEMIRLITIGIO').AsInteger := IdTipoInvestimento;
      dtmFuncoesInvest.QryInsertLitigio.ParamByName('DATAFATOGERADOR').AsDateTime  := DataFatoGerador;
      dtmFuncoesInvest.QryInsertLitigio.ParamByName('DESFATOGERADOR').AsString     := DesFatoGerador;
      dtmFuncoesInvest.QryInsertLitigio.ParamByName('VLRIRLITIGIO').AsFloat        := VlrIRLitigio;
      dtmFuncoesInvest.QryInsertLitigio.ParamByName('IDMODULO').AsInteger          := Sistema.IdModulo;
      dtmFuncoesInvest.QryInsertLitigio.ParamByName('IDPLANOPREV').AsInteger       := IDPlanoPrev;
      dtmFuncoesInvest.QryInsertLitigio.ParamByName('IDPATROCINADORA').AsInteger   := IDPatrocinadora;
      dtmFuncoesInvest.QryInsertLitigio.ParamByName('VLRRENDIMENTO').AsFloat       := VlrRendimento;

      if IdInvestimento <> -1 then
         dtmFuncoesInvest.QryInsertLitigio.ParamByName('IDINVESTIMENTO').AsInteger    := IdInvestimento;

      if IdOperacaoInvest <> -1 then
         dtmFuncoesInvest.QryInsertLitigio.ParamByName('IDOPERACAOINVEST').AsInteger   := IdOperacaoInvest;

      if iIdOperRenfix <> -1 then
         dtmFuncoesInvest.QryInsertLitigio.ParamByName('IDOPERRENFIX').AsInteger   := iIdOperRenfix;

      if iIdOperFundo <>  -1 then
         dtmFuncoesInvest.QryInsertLitigio.ParamByName('IDOPERACAOFUNDO').AsInteger   := iIdOperFundo;

      if iIdHistCartInv <> -1 then
         dtmFuncoesInvest.QryInsertLitigio.ParamByName('IDHISTCARTINV').AsInteger := iIdHistCartInv;

      if iIdHistRenfix  <> -1 then
         dtmFuncoesInvest.QryInsertLitigio.ParamByName('IDHISTRENFIX').AsInteger  := iIdHistRenfix;

      if iIdHistFundo   <> -1 then
         dtmFuncoesInvest.QryInsertLitigio.ParamByName('IDHISTFUNDO').AsInteger   := iIdHistFundo;

      dtmFuncoesInvest.QryInsertLitigio.ExecSql;
   except on E: Exception do
      begin
         Result := False;
         MsgDlg('Ocorreu um problema ao Gravar o IR.'#13+
                E.Message,'Mensagem do Sistema ',mtError,[mbOK],0);
      end;
   end;
end;

function TImpostos.ExcluiSaldoIRLitigio(dDataAtualizacao:TDateTime):boolean;
begin
   Result := True;
   try
      with dtmFuncoesInvest.QrySaldoLitigio Do
      begin
         Close;
         ParamByName('DATAATUALIZACAO').AsDateTime := dDataAtualizacao;
         Open;
         while not EOF do
         begin
            // Excluir Contabil
            OperComum.ProcExclui(-1, FieldByName('PLNCODIGO').AsInteger,
                                 FieldByName('PLANO').AsInteger,-1, dDataAtualizacao, True);
            Next;
         end;
         // Deleta da SaldoIRLitigio
         with dtmFuncoesInvest.QryAux do
         begin
            Close;
            SQL.Clear;
            SQL.Text := 'DELETE FROM SALDOIRLITIGIO WHERE DATAATUALIZACAO = TO_DATE('''+
                         DateToStr(dDataAtualizacao)+''',''DD/MM/YYYY'')';
            ExecSQL;
         end;
      end;
   except
      begin
         MsgDlg('Ocorreu um problema na exclusão de '#13+
                'Saldos de IR Litígio!','Mensagem do Sistema',mtError,[mbOK],0);
         Result := False;
         Exit;
      end;
   end;
end;

Procedure TImpostos.AtualizaIrLitigio(dDataAtualizacao :TDateTime);
Begin
   // Busca Tratamento do Indice
   with dtmFuncoesInvest.QryTrataIndice do
   begin
      Close;
      ParamByName('pMOEDAATULIT').AsInteger := pRPI.MOEDAATULIT;
      Open;
      if IsEmpty then
      begin
         MsgDlg('Falta definir índice para a atualização do IR Litígio ','Mensagem do Sistema', mtError, [mbOk],0);
         Exit;
      end;
   end;
   // Inicia o processamento
   try
      if not dtmBaseDados.dbBaseDados.InTransaction then
         dtmBaseDados.dbBaseDados.StartTransaction;
      // Excluo atualizações existentes para o dia
      if not ExcluiSaldoIRLitigio(dDataAtualizacao) then
         Exit;
      // R.Fixa - Recalculo o Saldo e Gravo e Contabilizo
      if not CalculaSaldoIRLitigio(dDataAtualizacao,1) then
         Exit;
      // R.Variavel - Recalculo o Saldo e Gravo e Contabilizo
      if not CalculaSaldoIRLitigio(dDataAtualizacao,2) then
         Exit;

      dtmBaseDados.dbBaseDados.Commit;
   except on E: Exception do
      begin
         dtmBaseDados.dbBaseDados.Rollback;
         MsgDlg('Ocorreu um problema na atualização de '#13+
                'Saldo de IR Litígio!'#13+
                E.Message,'Mensagem do Sistema ',mtError,[mbOK],0);
      end;
   end;
end;

function TImpostos.CalculaSaldoIRLitigio(dDataAtualizacao:TDateTime;iTipoInvest:Integer):boolean;
var
   wVlrAtualizado,wVlrPrincipal,wFatorAcumulado,wVlrContabil : Double;
   dDataAnterior : TDateTime;
   ano, mes, dia : word;
   sPlaConta : string;
begin
   Result := True;
   with dtmFuncoesInvest.QryPlanoPatroPlanoPrev do
   begin
      Close;
      ParamByName('dDataRef').AsDateTime := dDataAtualizacao;
      Open;
      while not EOF do
      begin
         with dtmFuncoesInvest.QrySelectIRLitigio do
         begin
            Close;
            ParamByName('dDataRef').AsDateTime          := dDataAtualizacao;
            ParamByName('pIDORIGEMIRLITIGIO').AsInteger := iTipoInvest;
            ParamByName('pPLANO').AsInteger             := dtmFuncoesInvest.QryPlanoPatroPlanoPrev.FieldByName('PLANO').AsInteger;
            ParamByName('pIDPLANOPREV').AsInteger       := dtmFuncoesInvest.QryPlanoPatroPlanoPrev.FieldByName('IDPLANOPREV').AsInteger;
            ParamByName('pIDPATROCINADORA').AsInteger   := dtmFuncoesInvest.QryPlanoPatroPlanoPrev.FieldByName('IDPATROCINADORA').AsInteger;
            Open;
            if not IsEmpty then
            begin
               wVlrPrincipal   := 0;
               wVlrVariacao    := 0;
               wVlrAtualizado  := 0;
               while not EOF do
               begin
                  // Calculo o fator acumulado SELIC
                  wFatorAcumulado:= FuncoesRendaFixa.AcumuladoIRLitigio(pRPI.MOEDAATULIT,
                                                     dtmFuncoesInvest.QryTrataIndice.FieldByName('DESCTRATAIND').AsString,
                                                     dDataAtualizacao,
                                                     100.00);
                  wVlrPrincipal  := wVlrPrincipal + FieldByName('VLRIRLITIGIO').AsFloat;
                  wVlrAtualizado := wVlrAtualizado + (FieldByName('VLRIRLITIGIO').AsFloat * wFatorAcumulado);
                  wVlrVariacao   := wVlrAtualizado - wVlrPrincipal;
                  Next;
               end;
               // Monta data D-1
               dDataAnterior := dDataAtualizacao-1;
               while not DiasUteisInv.DiaUtil(dDataAnterior,-1,1,'',True,False,False) do
                  dDataAnterior := dDataAnterior-1;   // Achar o dia útil anterior
               DecodeDate(dDataAnterior, ano, mes, dia);
               // Busca a Padrao da conta contábil
               if iTipoInvest = 1 then      // Renda Fixa
                  sPlaConta := BuscaPadraoContabil(iTipoInvest,-7,-22,ABS(wVlrVariacao))
               else if iTipoInvest = 2 then // Renda Variável
                  sPlaConta := BuscaPadraoContabil(iTipoInvest,-8,-22,ABS(wVlrVariacao))
               else if iTipoInvest = 8 then // BM&F
                  sPlaConta := BuscaPadraoContabil(iTipoInvest,-16,-22,ABS(wVlrVariacao));
               if sPlaConta = '' then
               begin
                  MsgDlg('Não foi encontrado padrão da conta contábil'#13+
                         'para atualização do Saldo de IR Litígio!'#13,'Mensagem do Sistema ',mtError,[mbOK],0);
                  Result := False;
                  Exit;
               end;
               // Trazer o Saldo da Conta Contábil
               wVlrContabil := OperComum.BuscaSaldoContabil(
                                     dtmFuncoesInvest.QryPlanoPatroPlanoPrev.FieldByName('PLANO').AsInteger,
                                     dtmFuncoesInvest.QryPlanoPatroPlanoPrev.FieldByName('IDPLANOPREV').AsInteger,
                                     dtmFuncoesInvest.QryPlanoPatroPlanoPrev.FieldByName('IDPATROCINADORA').AsInteger,
                                     ano,mes,Sistema.idEmpresa,
                                     dDataAnterior,sPlaConta );

               // verificar se o saldo e Devedor ou Credor ????
               wVlrVariacao := wVlrAtualizado - wVlrContabil;
               // Insere o Saldo Atual
               try
                  dtmFuncoesInvest.QryInsertSaldoIrLitigio.Close;
                  dtmFuncoesInvest.QryInsertSaldoIrLitigio.ParamByName('IDSALDOIRLITIGIO').AsInteger := LeUltRegistro(Nil,'SALDOIRLITIGIO');
                  dtmFuncoesInvest.QryInsertSaldoIrLitigio.ParamByName('PLNCODIGO').Clear;
                  dtmFuncoesInvest.QryInsertSaldoIrLitigio.ParamByName('PLANO').Clear;
                  dtmFuncoesInvest.QryInsertSaldoIrLitigio.ParamByName('IDIRLITIGIO').Clear;
                  dtmFuncoesInvest.QryInsertSaldoIrLitigio.ParamByName('DATAATUALIZACAO').AsDateTime :=dDataAtualizacao;
                  dtmFuncoesInvest.QryInsertSaldoIrLitigio.ParamByName('VLRSLDIRLITIGIO').AsFloat := wVlrVariacao;
                  dtmFuncoesInvest.QryInsertSaldoIrLitigio.ParamByName('IDMODULO').AsInteger := Sistema.IdModulo;
                  dtmFuncoesInvest.QryInsertSaldoIrLitigio.ParamByName('IDTIPOINVEST').AsInteger := iTipoInvest;
                  dtmFuncoesInvest.QryInsertSaldoIrLitigio.ExecSQL;
                  // Contabiliza operação
                  if ContabSaldoIRLitigio(dDataAtualizacao,iTipoInvest,wVlrVariacao,wPlano,wPlanilha) then
                  begin
                     dtmFuncoesInvest.QryUpdateSaldoIrLitigio.Close;
                     dtmFuncoesInvest.QryUpdateSaldoIrLitigio.ParamByName('pPLNCODIGO').AsInteger := wPlanilha;
                     dtmFuncoesInvest.QryUpdateSaldoIrLitigio.ParamByName('pPLANO').AsInteger     := wPlano;
                     dtmFuncoesInvest.QryUpdateSaldoIrLitigio.ParamByName('pIDSALDOIRLITIGIO').AsInteger :=
                        dtmFuncoesInvest.QryInsertSaldoIrLitigio.ParamByName('IDSALDOIRLITIGIO').AsInteger;
                     dtmFuncoesInvest.QryUpdateSaldoIrLitigio.ExecSQL;
                  end;
               except on E: Exception do
                  begin
                     MsgDlg('Ocorreu um problema na atualização de '#13+
                            'Saldo de IR Litígio!'#13+
                            E.Message,'Mensagem do Sistema ',mtError,[mbOK],0);
                     Result := False;
                     Exit;
                  end;
               end;
            end;
         end;
         Next;
      end;
   end;
end;

// Grava Contabilização Saldo IR Litígio de Renda Fixa
function TImpostos.ContabSaldoIRLitigio(dDataAtualizacao:TDateTime;iTipoInvest:Integer;
                              wVlrVariacao:double;var wPlano,wPlanilha : integer):boolean;
var
   iTipoOperacao,iTipoDespesa : integer;
begin
   Result := True;
   iTipoDespesa := 0;
   iTipoOperacao := 0;
   if iTipoInvest = 1  then        // Renda Fixa
   begin
      iTipoOperacao := -7;         // Atualização IR Litigio Renda Fixa
      if wVlrVariacao >= 0 then
         iTipoDespesa  := -22      // IR Litigio Positivo
      else
         iTipoDespesa  := -23;     // IR Litigio Negativo
   end
   else if iTipoInvest = 2 then    // Renda Variável
   begin
      iTipoOperacao := -8;         // Atualização IR Litigio Renda Variavel
      if wVlrVariacao >= 0 then
         iTipoDespesa  := -22      // IR Litigio Positivo
      else
         iTipoDespesa  := -23;     // IR Litigio Negativo
   end
   else if iTipoInvest = 8 then    // BM&F
   begin
      iTipoOperacao := -8;         // Atualização IR Litigio BM&F
      if wVlrVariacao >= 0 then
         iTipoDespesa  := -22      // IR Litigio Positivo
      else
         iTipoDespesa  := -23;     // IR Litigio Negativo
   end;
   bCriaLancto := true;
   wTipoRecDesBol := '';
   wPlanilha := -1;
   wPlano    := -1;
   wDocumento:= -1;
   if OperComum.LancaOperRFRV(Sistema.IdEmpresa,Sistema.IdModulo
                           ,iTipoInvest,-1,iTipoOperacao,iTipoDespesa,-1,-1,-1,'','','','','',
                           wTipoRecDesBol,bCriaLancto,0,
                           wVlrVariacao,
                           dDataAtualizacao,dDataAtualizacao,
                           wPlano,wPlanilha,wDocumento,wMensErro) <> 0 then
   begin
      MsgDlg('Operação cancelada: Ocorreu um problema'#13+
             'no lançamento contábil','Mensagem do Sistema ',mtWarning,[mbOK],0);
      Result := False;
   end;
end;

function TImpostos.BuscaPadraoContabil(iTipoInvest,iTipoOperacao,iTipoDespesa:integer;wVlrVariacao:double):string;
var
   iAchouPadrao : integer;
   iPlano,iSubContaDebOp,iSubContaCredOp, iUnidNegocOp : integer;
   sContaDebOp, sContaCredOp, sCentroCustoDebOp,sCentroCustoCredOp, sCentroResponOp,
   sTipoRecDesOp, sTipoPerOp, sHistoricoOp,sRecPagNaoOp:string;
begin
   Result := '';
   iAchouPadrao := OperComum.BuscaPadrLanc(Sistema.idEmpresa, iTipoInvest, iTipoOperacao,iTipoDespesa,
                      -1, -1, wVlrVariacao, '', 'DOP', iPlano, iSubContaDebOp,
                      iSubContaCredOp, iUnidNegocOp, sContaDebOp, sContaCredOp, sCentroCustoDebOp,
                      sCentroCustoCredOp, sCentroResponOp, sTipoRecDesOp, sTipoPerOp, sHistoricoOp,
                      sRecPagNaoOp);
   if (iTipoOperacao = -7) and (iAchouPadrao = 0) then
      Result := sContaDebOp
   else if (iTipoOperacao = -8) and (iAchouPadrao = 0) then
      Result := sContaCredOp;
end;

function TImpostos.BuscaAliquotaCPMF(DtaVigencia :string):Double;
begin
   Result := 0;
   with dtmFuncoesInvest.QryBuscaAliqCPMF do
   begin
      Close;
      if not(Prepared) then Prepare;
      ParamByName('dDataVigencia').AsString := DtaVigencia;
      Open;
      if not IsEmpty then
         Result:=dtmFuncoesInvest.QryBuscaAliqCPMF.FieldByName('ALIQUOTA').AsFloat;
   end;
end;

function TImpostos.CalculaDataLiqCPMF(dDataLancto : TDateTime):TDateTime;
Var
   i, iDiaSemanaCPMF, iDiaSemanaLancto, iDiasEntre : Integer;
   bExisteFeriado   : boolean;
   //Al_4
   Year, Month, Day : Word;
   dDataRecCPMF     : TDateTime;
Begin
   Result := 0;
   //Al_4
   // Portaria MF No. 433, de 27 de dezembro de 2005 - implementação a partir de 01/03/2005
   if ((pRPI.DATAINIRECCPMF = 0) Or (dDataLancto < pRPI.DATAINIRECCPMF)) then
   begin
      iDiaSemanaCPMF := 0;
      if pRPI.DIASEMANACPMF      = 'Domingo' then
         iDiaSemanaCPMF := 1
      else if pRPI.DIASEMANACPMF = 'Segunda' then
         iDiaSemanaCPMF := 2
      else if pRPI.DIASEMANACPMF = 'Terça'   then
         iDiaSemanaCPMF := 3
      else if pRPI.DIASEMANACPMF = 'Quarta'  then
         iDiaSemanaCPMF := 4
      else if pRPI.DIASEMANACPMF = 'Quinta'  then
         iDiaSemanaCPMF := 5
      else if pRPI.DIASEMANACPMF = 'Sexta'   then
         iDiaSemanaCPMF := 6
      else if pRPI.DIASEMANACPMF = 'Sábado'  then
         iDiaSemanaCPMF := 7;

      iDiaSemanaLancto  := DayOfWeek(dDataLancto);

      bExisteFeriado    := False;
      while not bExisteFeriado do
      begin
         iDiasEntre := iDiaSemanaCPMF - iDiaSemanaLancto;
         if iDiasEntre < pRPI.DIASUTEISCPMF then  // Válido somente se pRPI.DIASUTEISCPMF = 2
         begin
            if iDiasEntre = 0 then
               Result := dDataLancto + 7
            else if iDiasEntre = 1 then
               Result := dDataLancto + 8;
         end
         else
            Result  := dDataLancto + iDiasEntre;

         //AL_3
         // Verifica de o Result é feriado
         if DiasUteisInv.DiaUtil(Result,-1,1,'',True,False,False) then
            bExisteFeriado := True
         else
         begin
            while not DiasUteisInv.DiaUtil(Result,-1,1,'',True,False,False) do
            begin
               iDiaSemanaCPMF := iDiaSemanaCPMF - 1;
               Result := dDataLancto - 1;
            end;
         end;
         //AL_3 - Fim
      end;
   //Al_4
   end
   else
   begin
      DecodeDate(dDataLancto, Year, Month, Day);
      if ((Day >= 1) And (Day <= 10)) then
         dDataRecCPMF := StrToDate('10/'+IntToStr(Month)+'/'+IntToStr(Year))
      else if ((Day >= 11) And (Day <= 20)) then
         dDataRecCPMF := StrToDate('20/'+IntToStr(Month)+'/'+IntToStr(Year))
      else if (Day >= 21) then
         dDataRecCPMF := DiasUteisInv.UltDiaMes(Year, Month);

      for i := 1 to pRPI.PZORECCPMF do
      begin
         dDataRecCPMF    := dDataRecCPMF + 1;
         while not DiasUteisInv.DiaUtil(dDataRecCPMF,-1,1,'',True,False,False) do
            dDataRecCPMF := dDataRecCPMF + 1;
      end;
      Result := dDataRecCPMF;
   end;
end;

// Verifica se na data de referência deverá ser gerado a
// Gravação Trimestral de Impostos (RET)
function TImpostos.VerificaRetTrimestral(dDataRef:TDateTime;bDiaUtil,bOper:boolean):boolean;
var
   ano, mes, dia : word;
   dDataRET : TDateTime;
begin
   Result := False;
   if pRPI.STARET = 'S' then
   begin
      DecodeDate(dDataRef, ano, mes, dia);
      if mes in [3,6,9,12] then
      begin
         if bDiaUtil then
         begin
            dDataRET := DiasUteisInv.UltDiaUtilMes(ano,mes,1,-1,'',True,False,False);
         end
         else
            dDataRET := DiasUteisInv.UltDiaMes(ano, mes);
         if dDataRef = dDataRET then
         begin
            if not bOper then
              Result := True;
         end;
      end
   end;
end;

function TImpostos.BuscaDataUltRET(dDataRef:TDateTime):TDateTime;
var
   ano, mes, dia, anoant : word;
   dDataIni,dDataRET : TDateTime;
begin
   Result := 0;
   if pRPI.STARET = 'S' then
   begin
      DecodeDate(dDataRef, ano, mes, dia);
      dia := 31;
      mes := 12;
      anoant := ano -1; // Ano anterior
      dDataRET := EncodeDate(anoant, mes, dia);
      Result := dDataRET;
      dDataIni := dDataRET;
      while dDataIni < dDataRef do
      begin
         Result := dDataIni;
         dDataIni := DiasUteisInv.SomaMeses(dDataIni,3);
      end;
   end;
end;

end.
