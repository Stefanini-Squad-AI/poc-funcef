unit uCalcDocumento;

interface

uses Sysutils;

type
   TCalcDocumento = Class(TObject)


   private

   public

      function CalcIndiceCM(const iIndiceReajuste: integer; const dDataIni, dDataFim: TDateTime): extended;

      function ObterSaldoDoc(const iDocumento: Int64): Extended;

      function DataLimite(const dVencimentoOri: TDateTime; const iCidade, iPais, iConDiasTolera: integer;
               const sEstado, sTipoDiaTolera: string; const bConsideraBancario, bConsideraExtraordinario,
               bSabadoUtil: boolean): TDateTime;

      function CalcCM(const fTotReceber: Extended; const iIndiceReajuste: integer; const dDataIni, dDataFim: TDateTime):Extended;

      function CalcMulta(const fValor, fVlrMulta, fPercMulta: Extended; const iMoedaMulta: integer; const dDataPagto: TDateTime): Extended;

      function CalcJuros(const fValor, fValorMora, fPercentMora: Extended; const iMoedaMora, iFlgMoraProporc: integer; const sPeriodMora: string; const dDataIni, dDataFim: TDateTime): Extended;

   end;



var
  CalcDocumento : TCalcDocumento;



implementation

uses
   USistema, UDatabase, UModulo, UDiasInUteis, uFuncoesImob, uDocumento,
   dBaseDados, dCalcDocumento, dImobiliario;



function TCalcDocumento.CalcIndiceCM(const iIndiceReajuste: integer; const dDataIni,
  dDataFim: TDateTime): extended;
var
   fFatorCorrecao, fCotacaoFim, fCotacaoIni: Extended;
   sTipoCotacao, sPeriodicidade, sAnoIni, sMesIni, sAnoFim, sMesFim: string;
   dDataIniNova, dDataFimNova: TDateTime;
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

            if fCotacaoFim >= 0 then begin
               fFatorCorrecao := fFatorCorrecao * (1 + abs(fCotacaoFim / 100) );
            end else begin
               fFatorCorrecao := fFatorCorrecao / (1 + abs(fCotacaoFim / 100) );
            end;

            Next;
         end;

      end;

   end else if (sPeriodicidade = 'M') and (sTipoCotacao = 'P') then begin      // índice mensal, PERCENTUAL

      sAnoIni := IntToStr(DiasInUteis.ExtraiAno(dDataIni));
      sMesIni := IntToStr(DiasInUteis.ExtraiMes(dDataIni));
      if length(sMesIni) = 1 then sMesIni := '0' + sMesIni;

      sAnoFim := IntToStr(DiasInUteis.ExtraiAno(dDataFim));
      sMesFim := IntToStr(DiasInUteis.ExtraiMes(dDataFim));
      if length(sMesFim) = 1 then sMesFim := '0' + sMesFim;


      with dtmImobiliario.qryCotacoesIntervalo do begin

         LimpaParametros(dtmImobiliario.qryCotacoesIntervalo);

         ParamByName('INDICE').AsInteger     := iIndiceReajuste;
         ParamByName('ANOMESINI').AsString   := sAnoIni + sMesIni;
         ParamByName('ANOMESFIM').AsString   := sAnoFim + sMesFim;

         Open;
         First;

         // aqui precisamos calcular pró-rata
         dDataIniNova := dDataIni;
         while not(EOF) do begin

            // calcula o último dia do mes com referência na data inicial nova
            dDataFimNova := DiasInUteis.UltDiaMes(DiasInUteis.ExtraiAno(dDataIniNova),DiasInUteis.ExtraiMes(dDataIniNova));

            if dDataFim < dDataFimNova then dDataFimNova := dDataFim;


            iDiasMes := DiasInUteis.ExtraiDia(DiasInUteis.UltDiaMes(DiasInUteis.ExtraiAno(dDataIniNova), DiasInUteis.ExtraiMes(dDataIniNova)));
            iDiasCalculo := DiasInUteis.IntervaloDias(dDataIniNova, dDataFimNova) + 1;


            fCotacaoFim := dtmImobiliario.qryCotacoesIntervaloCOTVALOR.asFloat;

            if fCotacaoFim >= 0 then begin
               fFatorCorrecao := fFatorCorrecao * (1 + abs((fCotacaoFim / iDiasMes * iDiasCalculo) / 100) );  // com pro rata
            end else begin
               fFatorCorrecao := fFatorCorrecao / (1 + abs((fCotacaoFim / iDiasMes * iDiasCalculo) / 100) );  // com pro rata
            end;


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

   Result := fFatorCorrecao;
end;




function TCalcDocumento.ObterSaldoDoc(const iDocumento: int64): extended;
begin
   try
      with dtmCalcDocumento.qrySaldoDoc do begin
         LimpaParametros(dtmCalcDocumento.qrySaldoDoc);
         ParamByName('PCODDOCUMENTO').AsInteger := iDocumento;
         Open;
      end;

      Result := Arredonda(dtmCalcDocumento.qrySaldoDocSALDO.AsFloat, 2);

   finally
      dtmCalcDocumento.qrySaldoDoc.Close;
   end;
end;



function TCalcDocumento.DataLimite(const dVencimentoOri: TDateTime; const iCidade, iPais,
         iConDiasTolera: integer; const sEstado, sTipoDiaTolera: string; const bConsideraBancario,
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

    // seta o vencimento para o primeiro dia útil caso o vencimento tenha caido em dia inútil
    if not DiasInUteis.DiaUtil(dNovoDia,iCidade,iPais,sEstado,bConsideraBancario,bConsideraExtraordinario,bSabadoUtil) then begin
       dNovoDia := DiasInUteis.PrimeiroDiaUtilPosterior(dNovoDia,iCidade,iPais,sEstado,bConsideraBancario,bConsideraExtraordinario,bSabadoUtil);
    end;

    Result := dNovoDia;
end;



function TCalcDocumento.CalcCM(const fTotReceber: Extended;
  const iIndiceReajuste: integer; const dDataIni,
  dDataFim: TDateTime): Extended;
begin
   Result := Arredonda(fTotReceber * (CalcIndiceCM(iIndiceReajuste,dDataIni,dDataFim)-1), 2);
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
  fPercentMora: Extended; const iMoedaMora, iFlgMoraProporc: integer;
  const sPeriodMora: string; const dDataIni, dDataFim: TDateTime): Extended;
var
   iDifDias, iNumDias, iNumMeses, i: integer;
   fFatorMora, fVlrMora: Extended;
   dDataIniNova, dDataFimNova: TDateTime;
begin
   if sPeriodMora = 'D' then begin            // mora com periodicidade diária
      iDifDias := DiasInUteis.IntervaloDias(dDataIni,dDataFim);   // numero de dias de mora

      if fValorMora > 0 then begin            // mora por valor
         result := FuncoesImob.BuscaCotacao(iMoedaMora, dDataFim, false) * fValorMora * iDifDias;

      end else begin                          // mora por percentual
        fFatorMora := 1;
        for i := 1 to iDifDias do begin
           fFatorMora := fFatorMora * (1 + (fPercentMora / 100));
        end;
        fFatorMora := 1 - fFatorMora;
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
            fFatorMora := 1 - fFatorMora;
            result := fValor * fFatorMora;

         end;

      end else begin                // mora proporcional ao numero de dias - calcular pro rata

         fFatorMora := 1;
         fVlrMora   := 0;
         dDataIniNova := dDataIni;
         repeat
            dDataFimNova := DiasInUteis.UltDiaMes(DiasInUteis.ExtraiAno(dDataIniNova), DiasInUteis.ExtraiMes(dDataIniNova));

            if dDataFimNova > dDataFim then dDataFimNova := dDataFim;

            iDifDias := DiasInUteis.IntervaloDias(dDataIniNova, dDataFimNova);
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

end.
