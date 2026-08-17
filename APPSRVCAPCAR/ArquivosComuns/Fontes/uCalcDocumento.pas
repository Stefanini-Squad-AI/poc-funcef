unit uCalcDocumento;

interface

uses Sysutils, Dialogs;

type
   TCalcDocumento = Class(TObject)


   private

   public

      function CalcIndiceCM(const iIndiceReajuste: integer; const dDataIni, dDataFim: TDateTime; const iUsaMesAnterior: Integer = 0): extended;

      function ObterSaldoDoc(const iDocumento: Int64; var dUltLancBaixa:TDateTime;
                             var fTotBaixa, fTotAlterador : Extended;
                             const iCodAltMulta:Integer = -1; const iCodAltJuros:Integer = -1;
                             const iCodAltCM:Integer = -1; const dLimite: TDateTime = -1): Extended;

      function DataLimite(const dVencimentoOri: TDateTime; const iCidade, iPais, iConDiasTolera, iConDiasRepasse: integer;
               const sEstado, sTipoDiaTolera: string; const bConsideraBancario, bConsideraExtraordinario,
               bSabadoUtil: boolean): TDateTime;

      function CalcCM(const fTotReceber: Extended; const iIndiceReajuste: integer; const dDataIni, dDataFim: TDateTime; const iUsaMesAnterior: Integer = 0; const bCalculaFatorNegativo:Boolean = False):Extended;

      function CalcMulta(const fValor, fVlrMulta, fPercMulta: Extended; const iMoedaMulta: integer; const dDataPagto: TDateTime): Extended;

      function CalcJuros(const fValor, fValorMora, fPercentMora: Extended; const iMoedaMora, iFlgMoraProporc : integer; const sPeriodMora : string; const dDataIni, dDataFim: TDateTime): Extended;

      procedure ApagarMotivoConciliacao (const iCodDocumento, iIdParcFinancImov: Int64; const sFlgTipo: string);

      procedure GravarMotivoConciliacao (const iCodDocumento, iIdParcFinancImov, iIdUsuario, iCodDocDiverge, iNumLanctoDiverge: Int64; const iDifDias, iDifVlr: Variant; const sMotivo, sFlgTipo: string; const dDataConcilia: TDateTime = -1);

      function LiberaLanc( const iErro, iDoc, iUser: Integer) : Boolean;
   end;



var
  CalcDocumento : TCalcDocumento;



implementation

uses
   USistema, UDatabase, UModulo, UDiasInUteis, uFuncoesImob, math,
   dBaseDados, dCalcDocumento, dImobiliario, dLancImovel, uMensErro;


function TCalcDocumento.CalcIndiceCM(const iIndiceReajuste: integer; const dDataIni,
                        dDataFim: TDateTime; const iUsaMesAnterior: Integer): extended;
var
   fFatorCorrecao, fCotacaoFim, fCotacaoIni: Extended;
   sTipoCotacao, sPeriodicidade, sAnoIni, sMesIni, sAnoFim, sMesFim: string;
   dDataIniCalc, dDataFimCalc, dDataIniNova, dDataFimNova: TDateTime;
   iDiasMes, iDiasCalculo: integer;

begin
   fFatorCorrecao := 1;

   // primeiro verifica a periodicidade e tipo da cotação
   with dtmImobiliario.qryIndice do begin
      LimpaParametros(dtmImobiliario.qryIndice);
      ParamByName('MOEDA').AsInteger := iIndiceReajuste;

      Open;

      // se não se encontrar a moeda ou se as flags forem nulas, sai com Resultado 1
      if ( (dtmImobiliario.qryIndice.IsEmpty) or (dtmImobiliario.qryIndiceFLGPERCVALOR.isNull) or (dtmImobiliario.qryIndiceMOEPERIODICIDADE.isNULL) ) then begin
         Result := 1;
         dtmImobiliario.qryIndice.Close;
         Exit;
      end;

      sTipoCotacao      := dtmImobiliario.qryIndiceFLGPERCVALOR.asString;
      sPeriodicidade    := dtmImobiliario.qryIndiceMOEPERIODICIDADE.asString;

      Close;
   end;

   if (sPeriodicidade = 'D') and (sTipoCotacao = 'P') then begin       // índice diário, PERCENTUAL

      with dtmImobiliario.qryCotacoesIntervalo do begin

         LimpaParametros(dtmImobiliario.qryCotacoesIntervalo);
         ParamByName('INDICE').AsInteger     := iIndiceReajuste;
         ParamByName('PDATAINI').AsDateTime  := dDataIni;
         ParamByName('PDATAFIM').AsDateTime  := dDataFim;

         Open;
         First;

         while not(EOF) do begin
            fCotacaoFim := dtmImobiliario.qryCotacoesIntervaloCOTVALOR.asFloat;

            fFatorCorrecao := fFatorCorrecao * (1 + (fCotacaoFim / 100) );

// Vinicius - 18/03/2005 - Pend.18850 - Fator acumulado sem ser felo valor absoluto.
//            if fCotacaoFim >= 0 then begin
//               fFatorCorrecao := fFatorCorrecao * (1 + abs(fCotacaoFim / 100) );
//            end else begin
//               fFatorCorrecao := fFatorCorrecao / (1 + abs(fCotacaoFim / 100) );
//            end;

            Next;
         end;

      end;

   end else if (sPeriodicidade = 'M') and (sTipoCotacao = 'P') then begin      // índice mensal, PERCENTUAL

      // utilia variáveis auxiliares para efetuar calculo, para não interferir no
      // valor recebido pela função
      dDataIniCalc := dDataIni;
      dDataFimCalc := dDataFim;

      // Subtrai um mes quando for usar o indice do mes anterior
      if iUsaMesAnterior <> 0 then begin
         dDataIniCalc := DiasInUteis.SomaMeses(dDataIniCalc, (iUsaMesAnterior * -1) );
         dDataFimCalc := DiasInUteis.SomaMeses(dDataFimCalc, (iUsaMesAnterior * -1) );
      end;

      sAnoIni := IntToStr(DiasInUteis.ExtraiAno(dDataIniCalc));
      sMesIni := IntToStr(DiasInUteis.ExtraiMes(dDataIniCalc));
      if length(sMesIni) = 1 then sMesIni := '0' + sMesIni;

      sAnoFim := IntToStr(DiasInUteis.ExtraiAno(dDataFimCalc));
      sMesFim := IntToStr(DiasInUteis.ExtraiMes(dDataFimCalc));
      if length(sMesFim) = 1 then sMesFim := '0' + sMesFim;


      with dtmImobiliario.qryCotacoesIntervalo do begin

         LimpaParametros(dtmImobiliario.qryCotacoesIntervalo);

         ParamByName('INDICE').AsInteger     := iIndiceReajuste;
         ParamByName('ANOMESINI').AsString   := sAnoIni + sMesIni;
         ParamByName('ANOMESFIM').AsString   := sAnoFim + sMesFim;

         Open;
         First;

         // aqui precisamos calcular pró-rata
         dDataIniNova := dDataIniCalc;
         while not(EOF) do begin

            // calcula o último dia do mes com referência na data inicial nova
            dDataFimNova := DiasInUteis.UltDiaMes(DiasInUteis.ExtraiAno(dDataIniNova),DiasInUteis.ExtraiMes(dDataIniNova));

            if dDataFimCalc < dDataFimNova then dDataFimNova := dDataFimCalc;


            iDiasMes := DiasInUteis.ExtraiDia(DiasInUteis.UltDiaMes(DiasInUteis.ExtraiAno(dDataIniNova), DiasInUteis.ExtraiMes(dDataIniNova)));
            iDiasCalculo := DiasInUteis.IntervaloDias(dDataIniNova, dDataFimNova) + 1;


            fCotacaoFim := dtmImobiliario.qryCotacoesIntervaloCOTVALOR.asFloat;

            // Calculo Pro-Rata - fator composto
            fFatorCorrecao := fFatorCorrecao * ( Power(1 + (fCotacaoFim/100), (iDiasCalculo/iDiasMes) ) );

// Vinicius - 18/03/2005 - Pend.18850 - Fator acumulado sem ser felo valor absoluto.
//            if fCotacaoFim >= 0 then begin
//               fFatorCorrecao := fFatorCorrecao * (1 + abs((fCotacaoFim / iDiasMes * iDiasCalculo) / 100) );  // com pro rata
//            end else begin
//               fFatorCorrecao := fFatorCorrecao / (1 + abs((fCotacaoFim / iDiasMes * iDiasCalculo) / 100) );  // com pro rata
//            end;


            Next;
            dDataIniNova := StrToDate('01/'+
                            copy(dtmImobiliario.qryCotacoesIntervaloCOTMESREF.AsString,1,2)+'/'+ //mes
                            copy(dtmImobiliario.qryCotacoesIntervaloCOTMESREF.AsString,3,4));  // ano
         end;
      end;

   end else if (sTipoCotacao = 'V') then begin       // índice VALOR

      fCotacaoIni    := FuncoesImob.BuscaCotacao(iIndiceReajuste, dDataIni, False);
      fCotacaoFim    := FuncoesImob.BuscaCotacao(iIndiceReajuste, dDataFim, False);

      fFatorCorrecao := fCotacaoFim / fCotacaoIni;


   end else begin                                   // índice anual
      // o índice anual não é suportado pelo sistema
      Result := 1;
      Exit;
   end;


   // verifica se o fator pode ser negativo, se não puder, zera a correção
//   if not(bPodeNegativo) then if fFatorCorrecao < 1 then fFatorCorrecao := 1;

   Result := fFatorCorrecao;
end;




function TCalcDocumento.ObterSaldoDoc(const iDocumento: Int64; var dUltLancBaixa:TDateTime;
                                      var fTotBaixa, fTotAlterador : Extended;
                                      const iCodAltMulta,iCodAltJuros,iCodAltCM:Integer;
                                      const dLimite: TDateTime): extended;
begin
   // 17/12/03 - Vinicius: Caso o documento já tenha sido baixado parcialmente, deve-se
   //            considerar como saldo os alteradores lançados até a data da ultima baixa.
   //            não excluir os alteradores anteriores, apurar apenas o Juros e CM entre a
   //            data da ultima baixa e a nova data, lançando em novos alteradores.

   try
      with dtmCalcDocumento do begin
         LimpaParametros(dtmCalcDocumento.qrySaldoDoc);
         qrySaldoDoc.ParamByName('PCODDOCUMENTO').AsInteger := iDocumento;
         qrySaldoDoc.ParamByName('PCODALTMULTA').AsInteger  := iCodAltMulta;
         qrySaldoDoc.ParamByName('PCODALTJUROS').AsInteger  := iCodAltJuros;
         qrySaldoDoc.ParamByName('PCODALTCM').AsInteger     := iCodAltCM;
         if dLimite > 0 then qrySaldoDoc.ParamByName('PDTLIMITE').AsDateTime := dLimite;
         qrySaldoDoc.Open;

         if (qrySaldoDocULTBAIXA.IsNull) or
            (qrySaldoDocULTBAIXA.AsDateTime <= qrySaldoDocDATAVENCTO.AsDateTime) then begin
            Result := Arredonda(qrySaldoDocTOT_RECEBER.AsFloat -
                                qrySaldoDocTOT_RECEBIDO.AsFloat, 2);
         end else begin
            Result := Arredonda(qrySaldoDocTOT_RECEBER.AsFloat + qrySaldoDocTOT_ALTERADOR.AsFloat -
                                qrySaldoDocTOT_RECEBIDO.AsFloat, 2);
         end;

         dUltLancBaixa := qrySaldoDocULTBAIXA.AsDateTime;
         fTotBaixa     := qrySaldoDocTOT_RECEBIDO.AsFloat;
         fTotAlterador := qrySaldoDocTOT_ALTERADOR.AsFloat;
      end;
   finally
      dtmCalcDocumento.qrySaldoDoc.Close;
   end;
end;



function TCalcDocumento.DataLimite(const dVencimentoOri: TDateTime; const iCidade, iPais,
         iConDiasTolera, iConDiasRepasse: integer; const sEstado, sTipoDiaTolera: string; const bConsideraBancario,
         bConsideraExtraordinario, bSabadoUtil: boolean): TDateTime;
var
   dNovoDia: TDateTime;
begin

    dNovoDia := dVencimentoOri;

    // o contrato possui dias de tolerância do recebimento
    if iConDiasTolera > 0 then begin

       // dias de tolerância contados em dias úteis
       if sTipoDiaTolera = 'U' then begin
          dNovoDia := DiasInUteis.SomaDiasUteis(dNovoDia, iConDiasTolera, iCidade, iPais, sEstado,
                                  bConsideraBancario, bConsideraExtraordinario, bSabadoUtil);

       // dias de tolerância contados em dias corridos
       end else begin
          dNovoDia := dNovoDia + iConDiasTolera;
       end;
    end;

    // Soma os dias de Repasse da Administradora
    if iConDiasRepasse > 0 then begin
      if Sistema.IdModulo = 135 then begin       // para Alienação verifica se o repasse será em dias uteis
        // dias de repasse contados em dias úteis
        if sTipoDiaTolera = 'U' then begin
           dNovoDia := DiasInUteis.SomaDiasUteis(dNovoDia, iConDiasRepasse, iCidade, iPais, sEstado,
                                   bConsideraBancario, bConsideraExtraordinario, bSabadoUtil);

        // dias de repasse contados em dias corridos
        end else begin
           dNovoDia := dNovoDia + iConDiasRepasse;
        end;
      end else begin
        dNovoDia := dNovoDia + iConDiasRepasse;
      end;
    end;

    // seta o vencimento para o primeiro dia útil caso o vencimento tenha caido em dia inútil
    if not DiasInUteis.DiaUtil(dNovoDia,iCidade,iPais,sEstado,bConsideraBancario,bConsideraExtraordinario,bSabadoUtil) then begin
       dNovoDia := DiasInUteis.PrimeiroDiaUtilPosterior(dNovoDia,iCidade,iPais,sEstado,bConsideraBancario,bConsideraExtraordinario,bSabadoUtil);
    end;

    Result := dNovoDia;
end;



function TCalcDocumento.CalcCM(const fTotReceber: Extended; const iIndiceReajuste: integer;
                               const dDataIni, dDataFim: TDateTime; const iUsaMesAnterior: integer;
                               const bCalculaFatorNegativo: Boolean): Extended;
var fFator : Extended;
begin
   Result := 0;
   fFator := CalcIndiceCM(iIndiceReajuste, dDataIni, dDataFim, iUsaMesAnterior) -1;
   if fFator > 0 then begin
      Result := Arredonda(fTotReceber * fFator, 2);
   end else begin
      if bCalculaFatorNegativo then begin
         Result := Arredonda(fTotReceber * fFator, 2);
      end;
   end;
end;




function TCalcDocumento.CalcMulta(const fValor, fVlrMulta,
  fPercMulta: Extended; const iMoedaMulta: integer; const dDataPagto: TDateTime): Extended;

var
   fCotacao: Extended;
begin
   if fVlrMulta > 0 then begin
      fCotacao := FuncoesImob.BuscaCotacao(iMoedaMulta, dDataPagto, False);
      Result := Arredonda(fValor *  fCotacao, 2);
   end else begin
      Result := Arredonda(fValor * (fPercMulta /100), 2);
   end;
end;





function TCalcDocumento.CalcJuros(const fValor, fValorMora,
  fPercentMora: Extended; const iMoedaMora, iFlgMoraProporc : integer;
  const sPeriodMora : string; const dDataIni, dDataFim: TDateTime): Extended;
var
   iDifDias, iNumDias, iNumMeses, i: integer;
   fFatorMora, fVlrMora: Extended;
   dDataIniNova, dDataFimNova: TDateTime;
begin
   if sPeriodMora = 'D' then begin            // mora com periodicidade diária
      iDifDias := DiasInUteis.IntervaloDias(dDataIni,dDataFim) + 1;   // numero de dias de mora

      if fValorMora > 0 then begin            // mora por valor
         result := FuncoesImob.BuscaCotacao(iMoedaMora, dDataFim, false) * fValorMora * iDifDias;

      end else begin                          // mora por percentual
        fFatorMora := 1;
        for i := 1 to iDifDias do begin
           fFatorMora := fFatorMora * (1 + (fPercentMora / 100));
        end;
        fFatorMora := fFatorMora - 1;
        result := fValor * fFatorMora;

      end;

   end else begin                    // mora com periodicidade mensal

      if iFlgMoraProporc = 0 then begin    // a mora não é proporcional
         iNumMeses := DiasInUteis.IntervaloMeses(dDataIni, dDataFim);

         if fValorMora > 0 then begin      // mora por valor
            result := FuncoesImob.BuscaCotacao(iMoedaMora, dDataFim, false) * fValorMora * iNumMeses;

         end else begin                    // mora por percentual
            fFatorMora := 1;
            for i := 1 to iDifDias do begin
               fFatorMora := fFatorMora * (1 + (fPercentMora / 100));
            end;
            fFatorMora := fFatorMora - 1;
            result := fValor * fFatorMora;
         end;

      end else begin                // mora proporcional ao numero de dias - calcular pro rata

         fFatorMora := 1;
         fVlrMora   := 0;
         dDataIniNova := dDataIni;
         repeat
            dDataFimNova := DiasInUteis.UltDiaMes(DiasInUteis.ExtraiAno(dDataIniNova), DiasInUteis.ExtraiMes(dDataIniNova));

            if dDataFimNova > dDataFim then dDataFimNova := dDataFim;

            iDifDias := DiasInUteis.IntervaloDias(dDataIniNova, dDataFimNova) + 1;
            iNumDias := DiasInUteis.ExtraiDia(DiasInUteis.UltDiaMes(DiasInUteis.ExtraiAno(dDataFimNova), DiasInUteis.ExtraiMes(dDataFimNova)));

            if fValorMora > 0 then begin  // mora por valor
               fVlrMora := fVlrMora + (fValorMora / iNumDias * iDifDias);
            end else begin            // mora por percentual
               fFatorMora := fFatorMora * ((fPercentMora / 100 / iNumDias * iDifDias) + 1);
            end;

            dDataIniNova := DiasInUteis.SomaMeses(dDataIniNova,1);

            dDataIniNova := StrToDate('01/'+IntToStr(DiasInUteis.ExtraiMes(dDataIniNova))+'/'+IntToStr(DiasInUteis.ExtraiAno(dDataIniNova)));

         until dDataFimNova = dDataFim;

         if fValorMora > 0 then begin    // mora por valor
            Result := fVlrMora;
         end else begin
            fFatorMora := fFatorMora - 1;
            Result := fValor * fFatorMora;
         end;
      end;
   end;
end;



procedure TCalcDocumento.ApagarMotivoConciliacao (const iCodDocumento,iIdParcFinancImov: Int64; const sFlgTipo: string);
var bTransacao : Boolean;
begin
   bTransacao := False;
   if not dtmBaseDados.dbBaseDados.InTransaction then begin
      StartTransacao;
      bTransacao := True;
   end;

   with dtmLancImovel.qryDelConciliaDoc do begin
      LimpaParametros(dtmLancImovel.qryDelConciliaDoc);
      if sFlgTipo <> '' then
         ParamByName('PFLGTIPO').AsString := sFlgTipo;
      if iCodDocumento > 0 then
         ParamByName('PIDDOCUMENTO').AsInteger := iCodDocumento;
      if iIdParcFinancImov > 0 then
         ParamByName('PIDPARCFINANCIMOV').AsInteger := iIdParcFinancImov;
      ExecSQL;
   end;

   if bTransacao then CommitTransacao;
end;



procedure TCalcDocumento.GravarMotivoConciliacao (const iCodDocumento, iIdParcFinancImov, iIdUsuario, iCodDocDiverge, iNumLanctoDiverge: Int64; const iDifDias, iDifVlr: Variant; const sMotivo, sFlgTipo: string; const dDataConcilia: TDateTime = -1);
{ TIPOS  -  A - Abono Geral
            C - Abono de Correção
            M - Abono de Multa
            J - Abono de Juros
            D - Gerou Doc
            L - Liberação de Lançamentos ( Tela FExecLiberaLanc )
            R - Repactuação Contratual de Alienação
            E - Abono de Resíduo de Alienação
}
begin
   with dtmLancImovel.qryInsConciliaDoc do begin
      LimpaParametros(dtmLancImovel.qryInsConciliaDoc);
      ParamByName('PIDCONCILIADOC').AsInteger := LeUltRegistro(nil,'CONCILIADOC');
      if iCodDocumento > 0      then ParamByName('PIDDOCUMENTO').AsInteger := iCodDocumento;
      if iIdParcFinancImov > 0  then ParamByName('PIDPARCFINANCIMOV').AsInteger := iIdParcFinancImov;
      if iCodDocDiverge > 0     then ParamByName('PIDDOCDIVERGE').AsInteger := iCodDocDiverge;
      if iNumLanctoDiverge > 0  then ParamByName('PNUMLANCTODIVERGE').AsInteger := iNumLanctoDiverge;
      if iDifDias <> null       then ParamByName('PDIFDIAS').AsInteger := iDifDias;
      if iDifVlr  <> null       then ParamByName('PDIFVLR').AsFloat    := iDifVlr;
      if dDataConcilia > 0 then
           ParamByName('PDATA').AsDateTime   := dDataConcilia
      else ParamByName('PDATA').AsDateTime   := date;
      ParamByName('PIDUSUARIO').AsInteger   := iIdUsuario;
      ParamByName('PMOTIVO').AsString       := sMotivo;
      ParamByName('PFLGTIPO').AsString      := sFlgTipo;

      ExecSQL;
   end;
end;


function TCalcDocumento.LiberaLanc( const iErro, iDoc, iUser: Integer) : Boolean;
var
   sMotivo: string;
begin
  inherited;
  Result := False;
  if InputQuery('Motivo para Liberação', 'Motivo',sMotivo) then begin

      StartTransacao;
      try
         // GRAVAR O COD DO ERRO COM SEU ABS PARA NA INTEGRAÇÃO LIBERAR
         with dtmCalcDocumento do begin
            LimpaParametros(qryUpdLiberaLanc);
            qryUpdLiberaLanc.ParamByName('PFLGERRO').AsInteger := ABS(iErro);
            qryUpdLiberaLanc.ParamByName('PIDDOCUMENTO').AsInteger := iDoc;
            qryUpdLiberaLanc.ExecSQL;
         end;

         // EXCLUIR O MOTIVO QUE ANTERIORMENTE POSSA TER SIDO CADASTRADA
         ApagarMotivoConciliacao(iDoc, -1, 'L');

         // INSERIR O MOTIVO DA LIBERAÇÃO
         GravarMotivoConciliacao(iDoc, -1, iUser, -1, -1, NULL, NULL, sMotivo, 'L');

         CommitTransacao;
         Result := True;
      except
         RollBackTransacao;
         MsgDlg('Ocorreu algum erro na tentativa de se registrar a liberação.','erro',mtError,[mbok],0);
         Result := False;
      end;
  end;
end;



end.
