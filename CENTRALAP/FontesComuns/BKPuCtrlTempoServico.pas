unit uCtrlTempoServico;

interface

Uses SysUtils, uCmControlObject, uCmDbObject, uCmClientDataSet,
     uCmTypes,  UDiasUteis, uCmFileUtils, DB;

Type

  TTpDesconto = (TpDescontoEspecial,TpDescontoSimples);

  TRecTempo   = Record
                 TempoTotal,
                 TempoSimples: LongInt
                End;

  TCtrlTempoServico = class(TCmControlObject)

  private
    Function PeriodoConcomitante(IdPessoa, Sequencia: Integer; DataInicial, DataFinal: String): integer;
    Function ProcessaAcrecimos  (IdPessoa, Sequencia: Integer; TempoCalculado:Double;
                                 CodTipInsaubr, DataInicial, DataFinal, DataFimProc: String):Integer;
    Function ProcessaDescontos  (IdPessoa, Sequencia: Integer;
                                 FatorMultiplicador:Double;
                                 DataInicial, DataFinal, DataFimProc: String;
                                 TipoDesconto: TTpDesconto;
                                 DataSetProcesso : TCmClientDataSet):Integer;
    Function OraNumero          (sNumero : string):string;
    Function PegaDataDoServidor : String;
    Function TransformaDiasTempo(Tempo:Integer):String;
    function AnoBissexto        (aAno:Integer):Boolean;
    function Replicate          (aTexto:string;NumVezes:Integer):string;
 protected

 public
   Function BuscaTempoContrib  (IdPatro, IdPessoa: Integer):TRecTempo;
   Function TempoExtenso         (Tempo: longInt) : String;
   Function ProcessaHistContrib  (Grava : Boolean; IdPessoa: Integer; StrDataFinal:String):Boolean;
   function BuscaDadosFundacao   (Idpessoa : Integer) : Olevariant;
   function BuscaMatricula       (Matricula : string) : Olevariant;
   function BuscaTempoServico    (Idpessoa : integer; anoMesDiaRef : string) : Olevariant;
   function BuscaUltEventoPrev   (IdPessoa : integer) : Olevariant;
   Function CalcTempoContrib     (IdPessoa, Sequencia, FlgContaTempoServico, FlgTipoCalculo: Integer;
                                  DataInicial, DataFinal, DataFimProc: String):Integer;
   function CalculaTempos(idpessoa : Integer; data : TdateTime): OleVariant;
 published

end;

implementation

{ TCtrlTempoServico }

Function  TCtrlTempoServico.PeriodoConcomitante(IdPessoa, Sequencia: Integer;
                                                DataInicial, DataFinal: String) : integer;
var cdsLocal : TcmClientDataset;
Begin
  cdsLocal := TcmClientDataSet.Create(nil);
  try
    If Trim(DataFinal) = '' Then DataFinal := PegaDataDoServidor;// tavares DateToStr(Date);
    // Verifica se no historico do participante, ja nao existe uma empresa com o periodo igual.
      CdsLocal.Data := GetDataPacket(' SELECT SEQHISTFUNC FROM HISTFUNCPREV                 ' +
                              ' WHERE IDPESSOA    =  ' + IntToStr(IdPessoa)  + ' AND ' +
                              '      SEQHISTFUNC <> ' + IntToStr(Sequencia) + ' AND ' +
                              '      (DATAINICIO BETWEEN TO_DATE(' +QuotedStr(DataInicial)+ ',' + '''DD/MM/YYYY'') AND ' +
                              '                          TO_DATE(' +QuotedStr(DataFinal)  + ',' + '''DD/MM/YYYY'')     ' +
                              '     OR DATAFINAL BETWEEN TO_DATE(' +QuotedStr(DataInicial)+ ',' + '''DD/MM/YYYY'') AND ' +

                              '     TO_DATE(' +QuotedStr(DataFinal)  + ',' + '''DD/MM/YYYY''))    ');
  finally

    if CdsLocal.IsEmpty then
      result := 1
    else
      result := 0;

    CdsLocal.Free;
  end;
End;


Function TCtrlTempoServico.ProcessaHistContrib(Grava : Boolean; IdPessoa: Integer; StrDataFinal:String):Boolean;
Var
  cdsLocalAux, cdsLocal2 : TcmClientDataset;
  wFlgConcomitante, wTempoSimples,
  wTempoCalc, wTempoDescontoEspecial, wTempoDescontoSimples,
  wTempoAcrecimo:Integer;
Begin
  Result := False;

  { Cria Objetos Locais }
  CdsLocalAux := TcmClientDataset.Create(nil);
  cdsLocal2 := TcmClientDataset.Create(nil);

  { Inicio da Rotina }
  Try
       if grava then
       begin
         startTransaction;
         try
           { Apaga o Histórico de Tempo de Contribuicao }
           ExecSql(' UPDATE HISTFUNCPREV SET  '+
                   ' TEMPOCALC        = NULL, '+
                   ' TEMPOCALCINSALUB = NULL, '+
                   ' TEMPOSIMPLES     = NULL  '+
                   ' WHERE IDPESSOA = ' + IntToStr(IdPessoa));
         except on e : Exception do
         begin
           RollBack;
           Result := False;
           MessageInfo := e.Message;
         end;
       end;

       cdsLocal2.close;
       cdsLocal2.Data := GetDataPacket(' SELECT TEMPOCALC, TEMPOCALCINSALUB, TEMPOSIMPLES '+
                                       ' FROM HISTFUNCPREV WHERE IDPESSOA = ' + IntToStr(IdPessoa));
       cdsLocal2.First;
        { Apaga o Histórico de Tempo de Contribuicao }
        while not cdsLocal2.Eof do
        begin
          cdsLocal2.Edit;
          cdsLocal2.FieldByName('TEMPOCALC').clear;
          cdsLocal2.FieldByName('TEMPOCALCINSALUB').clear;
          cdsLocal2.FieldByName('TEMPOSIMPLES').clear;
          cdsLocal2.Post;
          cdsLocal2.Next;
        end;

        { Busca Todos os Lancamentos da Pessoa Ordenado por Data Inicial, Sequencia }
        CdsLocal2.Close;
        cdsLocal2.Data := GetDataPacket(' SELECT * FROM HISTFUNCPREV H, TPINSALUBRI T      '+
                                       ' WHERE H.IDPESSOA = ' + IntToStr(IdPessoa)+'  AND '+
                                       '       H.CODTPINSALUBRI = T.CODTPINSALUBRI(+) AND '+
                                       '      H.DATAINICIO    <= TO_DATE(' +QuotedStr(StrDataFinal)  + ',' + '''DD/MM/YYYY'') ' +
                                       ' ORDER BY H.IDPESSOA, H.DATAINICIO, H.SEQHISTFUNC ');
        { Caso não Tenha Volta }
        If cdsLocal2.IsEmpty Then
        begin
          Result := True;
          Exit;
        End;

        { Varre Arquivo Processando os periodos }
        While Not cdsLocal2.Eof Do Begin
          { Testa Datas, Caso processo Unitário mostra mensagem caso Batch aborta }
          If (cdsLocal2.FieldByName('DATAFINAL').AsDateTime < cdsLocal2.FieldByName('DATAINICIO').AsDateTime) And
             (cdsLocal2.FieldByName('DATAFINAL').AsDateTime <> 0)
          Then Begin
            { Proximo Registro e Volta }
            cdsLocal2.Next;
            Continue;
          End;

          { Calcula Tempo Sem Descontos deste periodo }
          wTempoSimples := CalcTempoContrib(cdsLocal2.FieldByName('IDPESSOA').AsInteger,
                                            cdsLocal2.FieldByName('SEQHISTFUNC').AsInteger,
                                            cdsLocal2.FieldByName('FLGCONTATS').AsInteger,
                                            1, // Calculo Normal
                                            cdsLocal2.FieldByName('DATAINICIO').AsString,
                                            cdsLocal2.FieldByName('DATAFINAL').AsString,
                                            StrDataFinal);

          { Processa Descontos de tempos Concomitantes Especiais e Simples }
          wTempoDescontoEspecial := ProcessaDescontos(cdsLocal2.FieldByName('IDPESSOA').AsInteger,
                                                      cdsLocal2.FieldByName('SEQHISTFUNC').AsInteger,
                                                      cdsLocal2.FieldByName('FATOR').AsFloat,
                                                      cdsLocal2.FieldByName('DATAINICIO').AsString,
                                                      cdsLocal2.FieldByName('DATAFINAL').AsString,
                                                      StrDataFinal, TpDescontoEspecial,
                                                      cdsLocal2); { Calcula descontos especiais }

          wTempoDescontoSimples  := ProcessaDescontos(cdsLocal2.FieldByName('IDPESSOA').AsInteger,
                                                      cdsLocal2.FieldByName('SEQHISTFUNC').AsInteger,
                                                      cdsLocal2.FieldByName('FATOR').AsFloat,
                                                      cdsLocal2.FieldByName('DATAINICIO').AsString,
                                                      cdsLocal2.FieldByName('DATAFINAL').AsString,
                                                      StrDataFinal, TpDescontoSimples,
                                                      cdsLocal2); { Calcula descontos simples }

          { Processa Acrecimos de tempos Especiais }
          wTempoAcrecimo:= ProcessaAcrecimos(cdsLocal2.FieldByName('IDPESSOA').AsInteger,
                                             cdsLocal2.FieldByName('SEQHISTFUNC').AsInteger,
                                             (wTempoSimples-wTempoDescontoEspecial),
                                             cdsLocal2.FieldByName('CODTPINSALUBRI').AsString,
                                             cdsLocal2.FieldByName('DATAINICIO').AsString,
                                             cdsLocal2.FieldByName('DATAFINAL').AsString,
                                             StrDataFinal);

          { Acerta Tempo de Contribuicao Real, com Descontos }
          wTempoCalc    := ((wTempoSimples - wTempoDescontoEspecial) + wTempoAcrecimo);
          wTempoSimples := (wTempoSimples - wTempoDescontoSimples);

          { Testa e Gera flag se Tempo é Concomitante }
          wFlgConcomitante := PeriodoConcomitante(cdsLocal2.FieldByName('IDPESSOA').AsInteger,
                                         cdsLocal2.FieldByName('SEQHISTFUNC').AsInteger,
                                         cdsLocal2.FieldByName('DATAINICIO').AsString,
                                         cdsLocal2.FieldByName('DATAFINAL').AsString);


          { Guarda Tempo de Contribuicao em Dias }
          CdsLocalAux.Close;
          CdsLocalAux.Data := GetDataPacket(' SELECT TEMPOCALC, TEMPOSIMPLES,          '+
                                            '        TEMPOCALCINSALUB, FLGCONCOMITANTE '+
                                            ' FROM HISTFUNCPREV WHERE IDPESSOA =       '+ cdsLocal2.FieldByName('IDPESSOA').AsString + ' AND ' +
                                            '      SEQHISTFUNC = ' + cdsLocal2.FieldByName('SEQHISTFUNC').AsString);

          CdsLocalAux.First;
          while not CdsLocalAux.Eof do
          begin
            CdsLocalAux.Edit;
            CdsLocalAux.FieldbyName('TEMPOCALC').asString := IntToStr(wTempoCalc);
            CdsLocalAux.FieldbyName('TEMPOSIMPLES').asString := IntToStr(wTempoSimples);
            CdsLocalAux.FieldbyName('TEMPOCALCINSALUB').asString := IntToStr(wTempoAcrecimo);
            CdsLocalAux.FieldbyName('FLGCONCOMITANTE').asString := IntToStr(wFlgConcomitante);
            CdsLocalAux.Post;
            CdsLocalAux.Next;
          end;

         if grava then
         begin
           try
             { Guarda Tempo de Contribuicao em Dias }
             ExecSql(' UPDATE HISTFUNCPREV SET '+
                     '   TEMPOCALC        = '+IntToStr(wTempoCalc)         +', '+
                     '   TEMPOSIMPLES     = '+IntToStr(wTempoSimples)      +', '+
                     '   TEMPOCALCINSALUB = '+IntToStr(wTempoAcrecimo)     +', '+
                     '   FLGCONCOMITANTE  = '+IntToStr(wFlgConcomitante)   +
                     ' WHERE IDPESSOA    = ' + cdsLocal2.FieldByName('IDPESSOA').AsString + ' AND ' +
                     '       SEQHISTFUNC = ' + cdsLocal2.FieldByName('SEQHISTFUNC').AsString);
           except
             On E:Exception Do
             Begin
               if grava then
                 RollBack;
                 MessageInfo := 'Erro ao gravar o Tempo de Contribuição, Pessoa ('+IntToStr(IdPessoa)+') '+#13+
                                'com a mensagem '+E.Message;
             End;
           end;
         end;

          { Proximo Registro }
          cdsLocal2.Next;
        End; { While }

      { Grava o Tempo Total da Pessoa }
      Result := True;
    end;

  Finally
    { Libera Objetos Locais }
    if grava then
      commit;
    CdsLocalAux.Free;
    CdsLocal2.Free;
  End;

End;


//******************************************************************************
// Busca o Tempos de Contribuicao calculado de uma pessoa
Function TCtrlTempoServico.BuscaTempoContrib(IdPatro, IdPessoa: Integer):TRecTempo;
Var
  CdsLocal : TcmClientDataset;
Begin
  CdsLocal := TcmClientDataset.Create(nil);
  Result.TempoTotal :=0; Result.TempoSimples :=0;
// Inicio da Rotina
  Try
// Busca Todos os Lancamentos da Pessoa
      cdsLocal.Data := GetDataPacket(' SELECT TEMPOSERVCALC, TEMPOSIMPLES FROM ELEGPATRO   '+
                                     ' WHERE IDPESSJUR = ' + IntToStr(IdPatro)+' AND '+
                                     '      IDPESSOA  = ' + IntToStr(IdPessoa)  );
// Caso não tenha volta
      If CdsLocal.IsEmpty Then
      begin
        CdsLocal.Free;
        Exit;
      End;
// Pega o tempo total e simples
      Result.TempoTotal   := CdsLocal.FieldByName('TEMPOSERVCALC').AsInteger;
      Result.TempoSimples := CdsLocal.FieldByName('TEMPOSIMPLES').AsInteger;
  Except
// Caso de Erro mostra Mensagem
    On E:Exception Do Begin
      MessageInfo := 'Erro ao Buscar o Tempo de Contribuição, Pessoa ('+IntToStr(IdPessoa)+') '+#13+
                  'com a mensagem '+E.Message;
    End;
  End;
  CdsLocal.Free;
End;

//******************************************************************************
// Processa os Acrecimos no tempo de Contribuicao
Function  TCtrlTempoServico.ProcessaAcrecimos(IdPessoa, Sequencia: Integer;
                                              TempoCalculado:Double;
                                              CodTipInsaubr,
                                              DataInicial, DataFinal, DataFimProc: String):Integer;
Var
  CdsLocal : TCmClientDataset;
  wFator   : real;
Begin
  Result :=0;
  CdsLocal := TCmClientDataset.Create(nil);

  try
  // Caso não possua Insalubridade Sai Fora
    If Trim(CodTipInsaubr) = '' Then
    begin
      Exit;
    end;
  // Caso DataFinal Vazia = Data Atual
    If Trim(DataFinal) = '' Then
      DataFinal := PegaDataDoServidor;// tavares DateToStr(Date);
  // Caso Data Final maior que a Data Fim de Processamento
  // Data Final passa a ser a Data Fim de Processamento
    If StrToDate(DataFinal) > StrToDate(DataFimProc) Then
      DataFinal := DataFimProc;
  // Caso Tempo Negativo Zera Dias Calculados
    If TempoCalculado < 0 Then
      TempoCalculado :=0;
  // Busca Fator de Multiplicacao
    CdsLocal.Data := GetDataPacket(' SELECT FATOR, TEMPOPERMANMINIMO, FLGTEMPOCONTINUO, IDREGRAINSALUBRI ' +
                                   ' FROM TPINSALUBRI WHERE CODTPINSALUBRI = ' + QuotedStr(CodTipInsaubr));
  // Guarda Fator Multiplicador
    wFator:= CdsLocal.FieldByName('FATOR').AsFloat;
  // Gera Resultado
    Result := Trunc((TempoCalculado*wFator) - TempoCalculado);
  finally
    CdsLocal.Free;
  end;
End;


//******************************************************************************
// Processa os Descontos no tempo de Contribuicao
Function TCtrlTempoServico.ProcessaDescontos(IdPessoa, Sequencia: Integer;
                                             FatorMultiplicador:Double;
                                             DataInicial, DataFinal, DataFimProc: String;
                                             TipoDesconto: TTpDesconto;
                                             DataSetProcesso : TCmClientDataSet):Integer;
Var
  wDataFimCalc,wDataIniCalc : String;
  wTempoCalc, wTotalDescontos,
  wTipoDesconto :Integer;
  CdsLocal : TcmClientDataset;
  sSql : string;
  SavePlace: TBookmark;
Begin
  wTotalDescontos:=0;
  cdsLocal := TcmClientDataset.Create(nil);
  try
    // Caso DataFinal Vazia = Data Atual
      If Trim(DataFinal) = '' Then DataFinal := PegaDataDoServidor; // Tavares DateToStr(Date);

    // Caso Data Final maior que a Data Fim de Processamento
    // Data Final passa a ser a Data Fim de Processamento
      If StrToDate(DataFinal) > StrToDate(DataFimProc) Then DataFinal := DataFimProc;

    // Busca Registros Concomitantes com o Processado
        sSql :=  ' SELECT NVL(H.DATAFINAL, SYSDATE) AS DATAFINAL, H.*, T.* '+
                 ' FROM HISTFUNCPREV H, TPINSALUBRI T    ' +
                 ' WHERE H.IDPESSOA    =  ' + IntToStr(IdPessoa)  + ' AND ' +
                 '      H.SEQHISTFUNC <> ' + IntToStr(Sequencia) + ' AND ' +
                 '      H.CODTPINSALUBRI = T.CODTPINSALUBRI(+)       AND ';
        If TipoDesconto = TpDescontoSimples Then Begin
        sSql := sSql + ' ((H.CODTPINSALUBRI IS NULL) OR (H.CODTPINSALUBRI IS NOT NULL AND FLGCONTATS = 0)) AND ';

        End;
        sSql := sSql + ' (( /*(H.TEMPOCALC IS NULL) AND*/ (NVL(T.FATOR,0) >= '+OraNumero(FloatToStr(FatorMultiplicador))+') ) OR '+
          '       (NVL(T.FATOR,0) > '+OraNumero(FloatToStr(FatorMultiplicador))+') OR '+
          '       (H.FLGCONTATS= 0 AND H.DATAINICIO <= TO_DATE('+QuotedStr(DataInicial)+',''DD/MM/YYYY'')) '+
          '      )  AND ' +
          '      (   ' +
          '      (H.DATAINICIO BETWEEN TO_DATE(' +QuotedStr(DataInicial)+ ',' + '''DD/MM/YYYY'') AND ' +
          '                            TO_DATE(' +QuotedStr(DataFinal)  + ',' + '''DD/MM/YYYY'')     ' +
          '       OR ' +
          '       H.DATAFINAL  BETWEEN TO_DATE(' +QuotedStr(DataInicial)+ ',' + '''DD/MM/YYYY'') AND ' +
          '                            TO_DATE(' +QuotedStr(DataFinal)  + ',' + '''DD/MM/YYYY''))    ' +
          '       OR ' +
          '      (H.DATAINICIO < TO_DATE(' +QuotedStr(DataInicial)+ ',' + '''DD/MM/YYYY'')  ' +
          '       AND ' +
          '       NVL(H.DATAFINAL, SYSDATE) > TO_DATE(' +QuotedStr(DataFinal)  + ',' + '''DD/MM/YYYY'')) AND ' +
          '         (NVL(T.FATOR,0) >= '+OraNumero(FloatToStr(FatorMultiplicador))+')'+
          '      )   ' +
          'ORDER BY DATAINICIO ';

          cdsLocal.Data := GetDataPacket(sSql);
    // Caso não Possua Registros, sai Fora
        If cdsLocal.IsEmpty Then Begin
          Result:=0;
          Exit;
        End;
    { Augusto }
    SavePlace := DataSetProcesso.GetBookmark;
    cdsLocal.First;
    While Not cdsLocal.Eof Do Begin
      If DataSetProcesso.Locate('SEQHISTFUNC',cdsLocal.FieldByName('SEQHISTFUNC').AsString, []) Then
      Begin
        If DataSetProcesso.FieldByName('TEMPOCALC').asInteger <> -1 Then
        Begin
          cdsLocal.Edit;
          cdsLocal.FieldByName('FLGCONTATS').AsString := '0';
          cdsLocal.Post;
        End;
      End;
      cdsLocal.Next;
    End;
    DataSetProcesso.GotoBookmark(SavePlace);
    cdsLocal.First;

    {---}

    // Se a data de Inicio de Calculo é menor que o Inicio do Processo, o Calculo
    // Assume a data de Inicio do processo, caso contrario assume a mesma.
        If (cdsLocal.FieldByName('DATAINICIO').AsDateTime < StrToDate(DataInicial)) Then begin
          wDataIniCalc:=DataInicial;
        End Else Begin
          wDataIniCalc := cdsLocal.FieldByName('DATAINICIO').AsString;
        End;

    //------------------------------------------------------------------------------
    // Processa Registros
        While Not cdsLocal.Eof Do Begin
          // Caso marcado para n"ao processar sai fora
          If cdsLocal.FieldByName('FLGCONTATS').AsString = '0' Then Begin
           cdsLocal.Next;
           Continue;
          End;

    // Caso Data Inicial seja menor que a Data de Inicio do Proximo calculo, ignora
          If StrToDate(wDataIniCalc) > cdsLocal.FieldByName('DATAFINAL').AsDateTime Then Begin
    // Proximo Registro e Volta ao Inicio
           cdsLocal.Next;
           Continue;
          End;



    // Gera a data final que sera calculada,
    // Caso data final deste registro seja maior que a final do processo,
    // data final = a do processo
          If (cdsLocal.FieldByName('DATAFINAL').AsDateTime > StrToDate(DataFinal)) Then
          begin
            wDataFimCalc  := DataFinal;
            wTipoDesconto := 2;
          End
          Else
          Begin
            wDataFimCalc := cdsLocal.FieldByName('DATAFINAL').AsString;
            wTipoDesconto := 1;
          End;

    // Calcula Tempo Sem Descontos deste periodo
          wTempoCalc := CalcTempoContrib(cdsLocal.FieldByName('IDPESSOA').AsInteger,
                                         cdsLocal.FieldByName('SEQHISTFUNC').AsInteger,
                                         cdsLocal.FieldByName('FLGCONTATS').AsInteger,
                                         wTipoDesconto, // Calculo Especial caso descontando
                                         wDataIniCalc,
                                         wDataFimCalc,
                                         DataFimProc);

          { Acumula descontos especiais }
          wTotalDescontos:= (wTotalDescontos+wTempoCalc);

    // Proximo Registro
          cdsLocal.Next;

    // Se a data de Inicio do Proximo Calculo é menor que o final da ultima está e a data
    // de inicio do proximo Calculo
          If (cdsLocal.FieldByName('DATAINICIO').AsDateTime < StrToDate(wDataFimCalc)) Then
          begin
            wDataIniCalc:=DateToStr(StrToDate(wDataFimCalc)+1);
          End
          Else
          Begin
            wDataIniCalc := cdsLocal.FieldByName('DATAINICIO').AsString;
          End;

    // Caso a data de Inicio do Proximo calculo passe da Data Final do Processo, sai Fora
          If StrToDate(wDataIniCalc) > StrToDate(DataFinal) Then
          Begin
            Break;
          End;
        End;
    // Seta Resultado
      Result := wTotalDescontos;

  finally
    cdsLocal.Free;
  end;

End;


//******************************************************************************
// Calcula e Retorna Tempo de Contribuicao Deste Periodo
Function TCtrlTempoServico.CalcTempoContrib(IdPessoa, Sequencia, FlgContaTempoServico,
                                            FlgTipoCalculo: Integer; DataInicial,
                                            DataFinal, DataFimProc: String):Integer;
Var
  wAnoI, wMesI, wDiaI,
  wAnoF, wMesF, wDiaF :Word;
  wStrAno, wStrMes, wStrDia, wStrDataI, wStrDataF, wStrTempoFinal:String;
  wTempoFinal, I :Integer;
Begin
  Result :=0;
// Caso Tempo não conte para tempo de Serviço Acumulado sai fora

// Caso DataFinal Vazia = Data Atual
  If Trim(DataFinal) = '' Then
    DataFinal := PegaDataDoServidor;
// Caso Data Final maior que a Data Fim de Processamento
// Data Final passa a ser a Data Fim de Processamento
  If StrToDate(DataFinal) > StrToDate(DataFimProc) Then
    DataFinal := DataFimProc;

// Decodifica as Datas
// Incial
  DecodeDate(StrToDate(DataInicial),wAnoI,wMesI,wDiaI); // Inical
  wStrAno := IntToStr(wAnoI);
  If wMesI >= 10 Then
    wStrMes := IntToStr(wMesI)
  Else wStrMes := '0' + IntToStr(wMesI);
  If wDiaI >= 10 Then
    wStrDia := IntToStr(wDiaI)
  Else wStrDia := '0' + IntToStr(wDiaI);
    wStrDataI := wStrAno+wStrMes+wStrDia;
// Final
  DecodeDate(StrToDate(DataFinal),  wAnoF,wMesF,wDiaF); // Final

// Caso mes Final seja FEREVEIRO, Ultimo dia conta como 30. (Testa se é Bissexto)
    If ((wMesF = 02) And ((wDiaF = 29) Or ((wDiaF = 28)))) Then
    Begin
      wDiaF:=30;
    End;

    wStrAno := IntToStr(wAnoF);
    If wMesF >= 10 Then
     wStrMes:= IntToStr(wMesF)
    Else
     wStrMes:= '0' + IntToStr(wMesF);
    If wDiaF >= 10 Then
     wStrDia:= IntToStr(wDiaF)
    Else
     wStrDia := '0' + IntToStr(wDiaF);

    wStrDataF := wStrAno + wStrMes + wStrDia;

// Calcula Tempo Final
    wTempoFinal := StrToInt(wStrDataF) - StrToInt(wStrDataI);

// Caso Não seja dia 31 o Final Soma 1 dia para acerto
  if (wDiaF <> 31) Then wTempoFinal:= (wTempoFinal+1);

// Decodifica Tempo Final
  wStrTempoFinal := IntToStr(wTempoFinal);
  I := Length(wStrTempoFinal);
  wStrTempoFinal:= StringOfChar('0',(6-I))+wStrTempoFinal; // Acerta Tamanho para 6 Casas
  wStrAno :=Copy(wStrTempoFinal,1,2);
  wStrMes :=Copy(wStrTempoFinal,3,2);
  wStrDia :=Copy(wStrTempoFinal,5,2);

//------------------------------------------------------------------------------
// Acerta datas \\

// Regras Passadas Pela Ursula Para Acerto da Data Final
// Caso Dias Maior que 30 Acerta
  If (wStrDia > '30')  Then Begin
// Acerta Dia Final
    wTempoFinal:=(wTempoFinal-70);
    wStrTempoFinal := IntToStr(wTempoFinal);
    I := Length(wStrTempoFinal);
    wStrTempoFinal:= StringOfChar('0',(6-I))+wStrTempoFinal; // Acerta Tamanho para 6 Casas
    wStrAno :=Copy(wStrTempoFinal,1,2);
    wStrMes :=Copy(wStrTempoFinal,3,2);
    wStrDia :=Copy(wStrTempoFinal,5,2);
  End;

// Caso Meses > 12 Aumenta Ano
  If wStrMes > '12' Then Begin
// Acerta Dia Final
    wTempoFinal:=(wTempoFinal-8800);
    wStrTempoFinal := IntToStr(wTempoFinal);
    I := Length(wStrTempoFinal);
    wStrTempoFinal:= StringOfChar('0',(6-I))+wStrTempoFinal; // Acerta Tamanho para 6 Casas
    wStrAno :=Copy(wStrTempoFinal,1,2);
    wStrMes :=Copy(wStrTempoFinal,3,2);
    wStrDia :=Copy(wStrTempoFinal,5,2);
  End;

// Caso Dias = 30 Aumenta Mes
  If wStrDia = '30' Then Begin
    wStrMes:= IntToStr((StrToInt(wStrMes)+1));
    If (StrToInt(wStrMes) < 10) Then wStrMes:= '0'+wStrMes;
    wStrDia:= '00';
  End;

// Caso Meses = 12 Aumenta Ano
  If wStrMes = '12' Then Begin
    wStrAno:= IntToStr((StrToInt(wStrAno)+1));
    wStrMes:= '00';
  End;

// Monta e seta Resultado
  wTempoFinal  := (StrToInt(wStrAno)*360)+
                  (StrToInt(wStrMes)*30)+
                   StrToInt(wStrDia);
  Result := wTempoFinal;
End;


Function TCtrlTempoServico.OraNumero(sNumero : string):string;
var i : LongInt;
    sOra : string;
begin
   sOra := '';
   for i := 1 to length(Trim(sNumero))
   do begin
     if sNumero[i] = ','
     then sOra := sOra + '.'
     else sOra := sOra + sNumero[i]
   end;
   Result := sOra;
end;

// tavares
Function TCtrlTempoServico.PegaDataDoServidor: String;
var
  ano, mes, dia : word;
  CDSLocal : TCmClientDataset;
Begin
  CDSLocal := TCmClientDataset.Create(nil);
  Try
    CDSLocal.Data := GetDataPacket(' SELECT SYSDATE AS DATASERVIDOR FROM DUAL ');
    DecodeDate(CDSLocal.FieldByName('DATASERVIDOR').AsDateTime, ano, mes, dia);
    Result := IntToStr(dia)+'/'+inttostr(mes)+'/'+inttostr(ano);
  Finally
    CdsLocal.Free;
  End;
End;

//******************************************************************************
// Retorna tempo em extenso
Function TCtrlTempoServico.TempoExtenso(Tempo: longInt):String;
Var
  wStrAno, wStrMes, wStrDia, wStrTempo :String;
  I:Integer;
Begin
// Decodifica Tempo Final
  wStrTempo:=IntToStr(Tempo);
// Caso Vazio, Sai Fora
  If Trim(wStrTempo) = '' Then Exit;

  wStrTempo := TransformaDiasTempo(StrToInt(wStrTempo));
  I := Length(wStrTempo);
  wStrTempo:= StringofChar('0',(6-I))+wStrTempo; // Acerta Tamanho para 6 Casas
  wStrAno  :=Copy(wStrTempo,1,2);
  wStrMes  :=Copy(wStrTempo,3,2);
  wStrDia  :=Copy(wStrTempo,5,2);
// Monta String do Resultador
  Result := wStrAno + ' ano(s), '+
            wStrMes + ' mes(es) e '+
            wStrDia + ' dia(s) ';
End;

//******************************************************************************
// Transforma numero de dias Dias em Tempo DDMMAAAA
Function TCtrlTempoServico.TransformaDiasTempo(Tempo:Integer):String;
Var
  I:Integer;
  wAnoF, wMesF, wDiaF:Double;
  wAno, wMes, wDia, wStrTempo:String;
Begin
  Result :='';

// Calcula Tempos
  wAnoF := (Tempo/360);
  wMesF := (Frac(wAnoF)*12);
  wDiaF := Round((wMesF-Int(wMesF))*30);

// Separa Tempos
  wAno := FloatToStr( Int( wAnoF ) );
  wMes := FloatToStr( Int( wMesF ) );
  wDia := FloatToStr( Int( wDiaF ) );

  If StrToInt(wAno) < 10 Then wAno:= '0'+wAno;
  If StrToInt(wMes) < 10 Then wMes:= '0'+wMes;
  If StrToInt(wDia) < 10 Then wDia:= '0'+wDia;

// Caso Dias = 30 Aumenta Mes
  If wDia = '30' Then Begin
    wMes:= IntToStr((StrToInt(wMes)+1));
    If (StrToInt(wMes) < 10) Then wMes:= '0'+wMes;
    wDia:= '00';
  End;
// Caso Meses = 12 Aumenta Ano
  If wMes = '12' Then Begin
    wAno:= IntToStr((StrToInt(wAno)+1));
    wMes:= '00';
  End;

  wStrTempo:=wAno+wMes+wDia;

  I := Length(wStrTempo);

  Result := StringofChar('0',(6-I))+wStrTempo; // Acerta Tamanho para 6 Casas

End;


function TCtrlTempoServico.BuscaDadosFundacao(Idpessoa: Integer): Olevariant;
begin
  result := GetDataPacket(' SELECT P.NOME , P.RAZAOSOCIAL, E.LOGRADOURO,         '+
                          '       E.NUMERO, E.COMPLEMENTO, E.BAIRRO,             '+
                          '       C.NOME AS CIDADE, C.CODESTADO, E.CEP, I.IMAGEM '+
                          ' FROM PESSOA P, ENDPESS E, IMAGENS I, CIDADES C       '+
                          ' WHERE (P.IDPESSOA  = '+ IntToStr(IdPessoa) +') AND   '+
                          '       (P.IDPESSOA  =  E.IDPESSOA(+))           AND   '+
                          '       (E.IDCIDADES = C.IDCIDADES(+))           AND   '+
                          '       (P.IDIMAGEM  = I.IDIMAGEM(+))                  ');
end;

function TCtrlTempoServico.BuscaMatricula(Matricula: string): Olevariant;
begin
  result := GetDataPacket(' SELECT  ELEGPATRO.IDPESSOA, ELEGPATRO.MATRICULA, PESSOA.NOME, '+
                          '   PESSOA.NUMDOCUMENTO, PESSOA.IDPESSOA                        '+
                          ' FROM ELEGPATRO, PESSOA                                        '+
                          ' WHERE (ELEGPATRO.MATRICULA LIKE ''' + Matricula + '%'')       '+
                          ' AND (PESSOA.IDPESSOA = ELEGPATRO.IDPESSOA )                   ');
end;

function TCtrlTempoServico.BuscaTempoServico(Idpessoa: integer; anoMesDiaRef: string): Olevariant;
var strAux : string;
begin
  result := GetDataPacket(
      ' SELECT EL.MATRICULA AS MATRICULAATUAL,                                                  '+
      '  H.IDPESSOA,   H.IDPESSJUR,  H.SEQHISTFUNC, H.IDDOCUMENTO, H.CODTPINSALUBRI,            '+
      '  DECODE(H.FLGCONTATS,1,''Sim'',''Não'') AS FLGCONTATSTRANSF, H.DATAINICIO, H.DATAFINAL, '+
      '  H.CARGO,       H.VALORCARGO,  H.FUNCAO,     H.VINCEMPREG, H.MATRICULA,   H.EMPRESA,    '+
      '  H.TEMPOCALC,  DECODE(H.FLGCONCOMITANTE,1,''Sim'',''Não'') AS FLGCONCOMITANTETRANSF,    '+
      '  H.FLGCONCOMITANTE,                                                                     '+
      '  H.NUMDOCUMENTO AS CPF,  TI.FATOR,  EL.TEMPOSERVANTERIOR, EL.TEMPOSITESPECIAL,          '+
      '  EL.TEMPONAOCREDITADO, P.NOME, H.FLGCONTATS,                                            '+
      '  EL.TEMPOSERVCALC,                                                                      '+
      '  EL.TEMPOSIMPLES AS TEMPOSEMCONVERSAO,                                                '+
      '  ''100 ano(s), 11 mes(es) e 29 dia(s) '' AS TEMPOSEMCONVERSAOEXT,                       '+
      '  ''100 ano(s), 11 mes(es) e 29 dia(s) '' AS TEMPOINDIVEXT,                              '+
      '  ''100 ano(s), 11 mes(es) e 29 dia(s) '' AS TEMPOTOTALEXT                               '+
      ' FROM                                                                                    '+
      '  PESSOA P,                                                                              '+
      '  ELEGPATRO EL,                                                                          '+
      '  HISTFUNCPREV H,                                                                        '+
      '  TPINSALUBRI TI                                                                         '+
      ' WHERE                                                                                   '+
      '     (H.IDPESSOA = '+IntTostr(Idpessoa)+')                                               '+
      ' AND (EL.IDPESSOA = H.IDPESSOA)                                                          '+
      ' AND (P.IDPESSOA  = H.IDPESSOA)                                                          '+
      ' AND (H.CODTPINSALUBRI = TI.CODTPINSALUBRI(+))                                           '+
      ' AND (TO_CHAR(H.DATAINICIO,''YYYY/MM/DD'') <= '+ QuotedStr( anoMesDiaRef )+')'+
      ' ORDER BY H.DATAINICIO, H.SEQHISTFUNC                                                    ');
end;

function TCtrlTempoServico.BuscaUltEventoPrev(IdPessoa: integer): Olevariant;
begin
  result := GetDataPacket(' SELECT E1.DATAEVENTO AS DATAINICIO, E2.DATAFINAL                    '+
                          ' FROM EVENTOSPREV E1,                                                  '+
                          '     SITPART     SP,                                                   '+
                          '     (SELECT EP.IDPESSOA, EP.DATAEVENTO AS DATAFINAL                   '+
                          '      FROM EVENTOSPREV EP, SITPART ST                                  '+
                          '      WHERE (EP.IDPESSOA = '+ IntToStr(IdPessoa) +')                   '+
                          '        AND (EP.IDSITPARTNOVO = ST.IDSITPART)                          '+
                          '        AND (ST.DESCRICAO LIKE ''%APOSENTADO%'')                       '+
                          '        AND IDPESSOA IN (SELECT E.IDPESSOA                             '+
                          '                         FROM EVENTOSPREV E, SITPART S                 '+
                          '                         WHERE (E.IDPESSOA = '+ IntToStr(IdPessoa) +') '+
                          '                           AND (E.IDSITPARTNOVO = S.IDSITPART)         '+
                          '                           AND (S.FLGINTERNO = ''MA''))) E2            '+
                          ' WHERE (E1.IDPESSOA = '+ IntToStr(IdPessoa) +')                        '+
                          '  AND (E1.IDSITPARTNOVO = SP.IDSITPART)                                '+
                          '  AND (SP.FLGINTERNO = ''MA'')                                         '+
                          '  AND (E1.IDPESSOA = E2.IDPESSOA(+))');
end;





function TCtrlTempoServico.AnoBissexto(aAno:Integer):Boolean;
begin
  if (aAno mod 4  = 0) then
     AnoBissexto := True
  else
     AnoBissexto := False;
end;


function TCtrlTempoServico.Replicate(aTexto:string;NumVezes:Integer):string;
var
  I:Integer;
  Temp:string;
begin
  Temp:='';
  for I:=1 to NumVezes do
    Temp:=Temp+aTexto;
  Result:=Temp;
end;


function TCtrlTempoServico.CalculaTempos(idpessoa : Integer; data : TdateTime): OleVariant;
var cdsLocal, CdsLocal2, CdsLocalAux : TCMclientDataSet;
    sTempoTotal, sTempoSemConversao : string;
    dia, mes, ano : word;
    TempoTotalSimples, TempoTotal, wTempoIndiv, wTempoSimples,
    wTempoDescontoEspecial, wTempoDescontoSimples, wTempoAcrecimo,
    wTempoCalc, wflgConcomitante : LongInt;
begin
  CdsLocal    := TCMclientDataSet.Create(nil);
  CdsLocal2   := TCMclientDataSet.Create(nil);
  CdsLocalAux := TCMclientDataSet.Create(nil);

  { Busca Todos os Lancamentos da Pessoa Ordenado por Data Inicial, Sequencia }
  CdsLocal2.Close;
  CdsLocal2.Data := GetDataPacket('SELECT H.*, T.* FROM HISTFUNCPREV H, TPINSALUBRI T      '+
                                  ' WHERE H.IDPESSOA = ' + IntToStr(IdPessoa)+'  AND '+
                                  '       H.CODTPINSALUBRI = T.CODTPINSALUBRI(+) AND '+
                                  '      H.DATAINICIO    <= TO_DATE(' +QuotedStr(dateToStr(data))  + ',' + '''DD/MM/YYYY'') ' +
                                  ' ORDER BY H.IDPESSOA, H.DATAINICIO, H.SEQHISTFUNC ');

  CdsLocal2.First;
  while not CdsLocal2.Eof do
  begin
    CdsLocal2.Edit;
    CdsLocal2.FieldByName('TEMPOCALC').asInteger := -1;
    CdsLocal2.FieldByName('TEMPOSIMPLES').asInteger := 0;
    CdsLocal2.Post;
    CdsLocal2.Next;
  end;
  CdsLocal2.First;

  TempoTotalSimples := 0;
  TempoTotal := 0;
 { Varre Arquivo Processando os periodos }
 cdsLocal2.First;
  While Not cdsLocal2.Eof Do Begin
    { Testa Datas, Caso processo Unitário mostra mensagem caso Batch aborta }
    If (cdsLocal2.FieldByName('DATAFINAL').AsDateTime < cdsLocal2.FieldByName('DATAINICIO').AsDateTime) And
       (cdsLocal2.FieldByName('DATAFINAL').AsDateTime <> 0)
    Then Begin
      { Proximo Registro e Volta }
      cdsLocal2.Next;
      Continue;
    End;


    { Calcula Tempo Sem Descontos deste periodo }
    wTempoSimples := CalcTempoContrib(cdsLocal2.FieldByName('IDPESSOA').AsInteger,
                                      cdsLocal2.FieldByName('SEQHISTFUNC').AsInteger,
                                      cdsLocal2.FieldByName('FLGCONTATS').AsInteger,
                                      1, // Calculo Normal
                                      cdsLocal2.FieldByName('DATAINICIO').AsString,
                                      cdsLocal2.FieldByName('DATAFINAL').AsString,
                                      DateToStr(data));

    { Processa Descontos de tempos Concomitantes Especiais e Simples }
    wTempoDescontoEspecial := ProcessaDescontos(cdsLocal2.FieldByName('IDPESSOA').AsInteger,
                                                cdsLocal2.FieldByName('SEQHISTFUNC').AsInteger,
                                                cdsLocal2.FieldByName('FATOR').AsFloat,
                                                cdsLocal2.FieldByName('DATAINICIO').AsString,
                                                cdsLocal2.FieldByName('DATAFINAL').AsString,
                                                DateToStr(data), TpDescontoEspecial,
                                                cdsLocal2); { Calcula descontos especiais }

    wTempoDescontoSimples  := ProcessaDescontos(cdsLocal2.FieldByName('IDPESSOA').AsInteger,
                                                cdsLocal2.FieldByName('SEQHISTFUNC').AsInteger,
                                                cdsLocal2.FieldByName('FATOR').AsFloat,
                                                cdsLocal2.FieldByName('DATAINICIO').AsString,
                                                cdsLocal2.FieldByName('DATAFINAL').AsString,
                                                DateToStr(data), TpDescontoSimples,
                                                cdsLocal2); { Calcula descontos simples }

    { Processa Acrecimos de tempos Especiais }
    wTempoAcrecimo := ProcessaAcrecimos(cdsLocal2.FieldByName('IDPESSOA').AsInteger,
                                        cdsLocal2.FieldByName('SEQHISTFUNC').AsInteger,
                                       (wTempoSimples-wTempoDescontoEspecial),
                                        cdsLocal2.FieldByName('CODTPINSALUBRI').AsString,
                                        cdsLocal2.FieldByName('DATAINICIO').AsString,
                                        cdsLocal2.FieldByName('DATAFINAL').AsString,
                                        DateToStr(data));


    { Testa e Gera flag se Tempo é Concomitante }
    wFlgConcomitante := PeriodoConcomitante(cdsLocal2.FieldByName('IDPESSOA').AsInteger,
                                   cdsLocal2.FieldByName('SEQHISTFUNC').AsInteger,
                                   cdsLocal2.FieldByName('DATAINICIO').AsString,
                                   cdsLocal2.FieldByName('DATAFINAL').AsString);



    { Acerta Tempo de Contribuicao Real, com Descontos }

     wTempoCalc    := ((wTempoSimples - wTempoDescontoEspecial) + wTempoAcrecimo);
     wTempoSimples := (wTempoSimples - wTempoDescontoSimples);

    If cdsLocal2.FieldByName('FLGCONTATS').AsInteger = 1 Then
      TempoTotal        := TempoTotal + wTempoCalc;
    If Trim(cdsLocal2.FieldByName('CODTPINSALUBRI').AsString) = '' Then
      TempoTotalSimples := TempoTotalSimples + wTempoSimples;

    cdsLocal2.Edit;
    cdsLocal2.FieldbyName('TEMPOCALC').asString        := IntToStr(wTempoCalc);
    cdsLocal2.FieldbyName('TEMPOSIMPLES').asString     := IntToStr(wTempoSimples);
    cdsLocal2.FieldbyName('TEMPOCALCINSALUB').asString := IntToStr(wTempoAcrecimo);
    cdsLocal2.FieldbyName('FLGCONCOMITANTE').asString  := IntToStr(wFlgConcomitante);
    cdsLocal2.Post;

    cdsLocal2.Next;
  end; //while

  try
    try
      decodeDate(data, ano, mes, dia);
      CdsLocal.Close;
      CdsLocal.Data := BuscaTempoServico(idpessoa, intToStr(ano) + '/' + intToStr(mes) + '/' + intToStr(dia));

      CdsLocalAux.Close;
      CdsLocalAux.Data := CdsLocal.Data;
      CdsLocalAux.Close;
      CdsLocalAux.CreateDataset;

      CdsLocal.first;
      CdsLocal2.first;
      while not cdsLocal.Eof do
      begin
        CdsLocalAux.Insert;
        CdsLocalAux.FieldByName('MATRICULAATUAL').AsString    := CdsLocal.FieldByName('MATRICULAATUAL').AsString;
        CdsLocalAux.FieldByName('IDPESSOA').asInteger         := CdsLocal.FieldByName('IDPESSOA').AsInteger;
        CdsLocalAux.FieldByName('SEQHISTFUNC').asInteger      := CdsLocal.FieldByName('SEQHISTFUNC').AsInteger;
        CdsLocalAux.FieldByName('IDDOCUMENTO').asInteger      := CdsLocal.FieldByName('IDDOCUMENTO').AsInteger;
        CdsLocalAux.FieldByName('CODTPINSALUBRI').AsString    := CdsLocal.FieldByName('CODTPINSALUBRI').AsString;
        CdsLocalAux.FieldByName('DATAINICIO').asString        := CdsLocal.FieldByName('DATAINICIO').AsString;
        CdsLocalAux.FieldByName('DATAFINAL').AsString         := CdsLocal.FieldByName('DATAFINAL').AsString;
        CdsLocalAux.FieldByName('CARGO').AsString             := CdsLocal.FieldByName('CARGO').AsString;
        CdsLocalAux.FieldByName('VALORCARGO').AsFloat         := CdsLocal.FieldByName('VALORCARGO').AsFloat;
        CdsLocalAux.FieldByName('FUNCAO').AsString            := CdsLocal.FieldByName('FUNCAO').AsString;
        CdsLocalAux.FieldByName('VINCEMPREG').AsString        := CdsLocal.FieldByName('VINCEMPREG').AsString;
        CdsLocalAux.FieldByName('MATRICULA').AsString         := CdsLocal.FieldByName('MATRICULA').AsString;
        CdsLocalAux.FieldByName('EMPRESA').AsString           := CdsLocal.FieldByName('EMPRESA').AsString;
        CdsLocalAux.FieldByName('TEMPOCALC').AsFloat          := CdsLocal2.FieldByName('TEMPOCALC').AsFloat;
        CdsLocalAux.FieldByName('FLGCONCOMITANTE').AsInteger  := CdsLocal.FieldByName('FLGCONCOMITANTE').AsInteger;
        CdsLocalAux.FieldByName('FLGCONCOMITANTETRANSF').AsString  := CdsLocal.FieldByName('FLGCONCOMITANTETRANSF').AsString;
        CdsLocalAux.FieldByName('CPF').AsString               := CdsLocal.FieldByName('CPF').AsString;
        CdsLocalAux.FieldByName('FATOR').AsFloat              := CdsLocal2.FieldByName('FATOR').AsFloat;
        CdsLocalAux.FieldByName('TEMPOSERVANTERIOR').AsInteger:= CdsLocal.FieldByName('TEMPOSERVANTERIOR').AsInteger;
        CdsLocalAux.FieldByName('TEMPOSITESPECIAL').AsInteger := CdsLocal.FieldByName('TEMPOSITESPECIAL').AsInteger;
        CdsLocalAux.FieldByName('TEMPONAOCREDITADO').AsInteger:= CdsLocal.FieldByName('TEMPONAOCREDITADO').AsInteger;
        CdsLocalAux.FieldByName('NOME').AsString              := CdsLocal.FieldByName('NOME').AsString;
        CdsLocalAux.FieldByName('FLGCONTATS').AsFloat         := CdsLocal2.FieldByName('FLGCONTATS').AsFloat;
        CdsLocalAux.FieldByName('TEMPOSERVCALC').AsFloat      := CdsLocal2.FieldByName('TEMPOCALC').AsFloat;
        CdsLocalAux.FieldByName('TEMPOSEMCONVERSAO').AsFloat  := CdsLocal2.FieldByName('TEMPOSIMPLES').AsFloat;
        CdsLocalAux.FieldByName('TEMPOINDIVEXT').AsString     := CdsLocal.FieldByName('TEMPOINDIVEXT').AsString;
        CdsLocalAux.FieldByName('TEMPOTOTALEXT').AsString     := CdsLocal.FieldByName('TEMPOTOTALEXT').AsString;
        CdsLocalAux.FieldByName('TEMPOSEMCONVERSAOEXT').AsString  := CdsLocal.FieldByName('TEMPOSEMCONVERSAOEXT').AsString;
        CdsLocalAux.Post;
        CdsLocal.Next;
        CdsLocal2.Next;
      end;

      CdsLocalAux.First;
      CdsLocal.First;
     // escrever tempos de servicos por extenso
      if not CdsLocalAux.EOF Then
      Begin
        CdsLocalAux.Edit;
        CdsLocalAux.FieldByName('TEMPOSERVCALC').AsInteger     := TempoTotal;
        CdsLocalAux.FieldByName('TEMPOSEMCONVERSAO').AsInteger := TempoTotalSimples;
        CdsLocalAux.Post;

        sTempoTotal        := TempoExtenso(CdsLocalAux.FieldByName('TEMPOSERVCALC').AsInteger);
        sTempoSemConversao := TempoExtenso(CdsLocalAux.FieldByName('TEMPOSEMCONVERSAO').AsInteger);

        while not CdsLocalAux.EOF Do
        begin
          CdsLocalAux.Edit;
          CdsLocalAux.FieldByName('TEMPOTOTALEXT').AsString         := sTempoTotal;
          CdsLocalAux.FieldByName('TEMPOSEMCONVERSAOEXT').AsString  := sTempoSemConversao;

          if CdsLocalAux.FieldByName('FLGCONCOMITANTE').AsInteger = 1 then
            CdsLocalAux.FieldByName('FLGCONCOMITANTETRANSF').AsString := 'Sim'
          else
            CdsLocalAux.FieldByName('FLGCONCOMITANTETRANSF').AsString := 'Não';

          wTempoIndiv := CalcTempoContrib(CdsLocalAux.FieldByName('IDPESSOA').AsInteger,
                                          CdsLocalAux.FieldByName('SEQHISTFUNC').AsInteger,
                                          CdsLocalAux.FieldByName('FLGCONTATS').AsInteger,
                                          1, // Calculo Normal
                                          CdsLocalAux.FieldByName('DATAINICIO').AsString,
                                          CdsLocalAux.FieldByName('DATAFINAL').AsString,
                                          DateToStr(data));

          CdsLocalAux.FieldByName('TEMPOINDIVEXT').AsString    := TempoExtenso(wTempoIndiv);
          CdsLocalAux.Post;
          CdsLocalAux.Next;
          CdsLocal.Next;
        end;
      end;
    except on e : Exception do
      MessageInfo := e.Message;
    end;
  finally
    CdsLocal.Close;
    CdsLocal.Data := CdsLocalAux.Data;
    result := CdsLocal.Data;
    CdsLocal.Free;
    CdsLocal2.Free;
    CdsLocalAux.Free;
  end;
end;

end.

