
{-------------------------------------------------------------------------------
ALTERAÇÕES / IMPLEMENTAÇÕES ----------------------------------------------------
--------------------------------------------------------------------------------
Pendência   : SIG 37689
Responsável : Darivalo Alencar
Data        : 05/05/2017
Descrição   : Inclusão de campos TEMPOSERVTOTAL,TEMPOSERVTOTDIA ,TEMPOSERVTOTMES
              na pgHistoricoFuncional de fConspart
--------------------------------------------------------------------------------
Pendência   : SOL 37791  KINTANA 523676
Responsável : Marcelo Almeida
Data        : 20/10/2010
Descrição   : Incluir da BuscaTempoServico as informações de cadastros anteriores do participante.
--------------------------------------------------------------------------------
// Atualizado em 16/12/2003 - André Tavares - pendência 15563
--------------------------------------------------------------------------------
}

unit uCtrlTempoServico;

interface

Uses SysUtils, uCmControlObject, uCmDbObject, uCmClientDataSet,
     uCmTypes,  UDiasUteis, DB, uMidasUtil, uCmFileUtils;

Type

  TTpDesconto = (TpDescontoEspecial,TpDescontoSimples);

  TRecTempo   = Record
                 TempoTotal,
                 TempoSimples: LongInt
                End;

  TCtrlTempoServico = class(TCmControlObject)

  private
    //Inicio -  Pendência   : SOL 37791  KINTANA 523676
    FTotalizadorTempoCalc  : Integer;
    FTotalizadorTempoSimples : Integer;
    FTotalizadorTempoCalcExt : String;
    FTotalizadorTempoSimplesExt : String;
    //Inicio -  Pendência   : SOL 37791  KINTANA 523676

    Function ProcessaAcrecimos  (IdPessoa, Sequencia: Integer; TempoCalculado:Double;
                                 CodTipInsaubr, DataInicial, DataFinal, DataFimProc: String):Integer;
    Function ProcessaDescontos  (IdPessoa, Sequencia: Integer;
                                 FatorMultiplicador:Double;
                                 DataInicial, DataFinal, DataFimProc: String;
                                 TipoDesconto: TTpDesconto;
                                 DataSetProcesso : TCmClientDataSet):Integer;
    Function OraNumero          (sNumero : string):string;
    Function PegaDataDoServidor : String;
    function AnoBissexto        (aAno:Integer):Boolean;
    function Replicate          (aTexto:string;NumVezes:Integer):string;
    function InTransaction: boolean;
 protected

 public
    //Inicio -  Pendência   : SOL 37791  KINTANA 523676
    property TotalizadorTempoCalc  : Integer read FTotalizadorTempoCalc;
    property TotalizadorTempoSimples : Integer read FTotalizadorTempoSimples;
    property TotalizadorTempoCalcExt : String read FTotalizadorTempoCalcExt;
    property TotalizadorTempoSimplesExt : String read FTotalizadorTempoSimplesExt;
    //Inicio -  Pendência   : SOL 37791  KINTANA 523676

   Constructor Create; Override;
   Function BuscaTempoContrib  (IdPatro, IdPessoa: Integer):TRecTempo;
   Function TempoExtenso         (Tempo: longInt) : String;
   function BuscaDadosFundacao   (Idpessoa : Integer) : Olevariant;
   function BuscaMatricula       (Matricula : string) : Olevariant;
   function BuscaTempoServico    (Idpessoa : integer; anoMesDiaRef : string; AConsiderarRegistrosAnteriores : Boolean = False) : Olevariant;
   Function CalcTempoContrib     (IdPessoa, Sequencia, FlgContaTempoServico, FlgTipoCalculo: Integer;
                                  DataInicial, DataFinal, DataFimProc: String):Integer;

   function CalculaTempos(idpessoa : Integer; data : TdateTime;
                          ContaTempoManut : Boolean = false; DataTempoManut : string = ''; AConsiderarRegistrosAnteriores : Boolean = False): OleVariant;

   Function PeriodoConcomitante(IdPessoa, Sequencia: Integer; DataInicial, DataFinal: String): integer;

   function validaDataEntrada(pIdPessoa: Integer; pdata, pDataManut : tDateTime): integer;

   // verifica se há alguma data em aberto
   function TemTempoAberto(idpessoa : integer): Boolean;

    Function TransformaDiasTempo(Tempo:Integer):String;

    Function BuscaTemposServico(IdPessoa,iIdBusca: Integer): Integer; //Darivaldo Alencar SIG37689
 published

end;

implementation

{ TCtrlTempoServico }



Function  TCtrlTempoServico.PeriodoConcomitante(IdPessoa, Sequencia: Integer;
                                                DataInicial, DataFinal: String) : integer;
var cdsLocal : TcmClientDataset;
    flgConc1, flgConc2 : Boolean;
Begin
  cdsLocal := TcmClientDataSet.Create(nil);
  result := 0;
  flgConc1 := false;
  flgConc2 := false;
  try
    If Trim(DataFinal) = '' Then DataFinal := PegaDataDoServidor;
    // Verifica se no historico do participante, ja nao existe uma empresa com o periodo igual.

    CdsLocal.Data := GetDataPacket(' SELECT SEQHISTFUNC, DATAINICIO, NVL( TO_CHAR( DATAFINAL, ''DD/MM/YYYY''), TO_CHAR(SYSDATE, ''DD/MM/YYYY'') ) AS DATAFINAL '+
                                   ' FROM HISTFUNCPREV WHERE IDPESSOA = ' + IntToStr(IdPessoa)  + ' AND ' +
                                   ' SEQHISTFUNC <> ' + IntToStr(Sequencia));
    cdsLocal.First;
    while not cdsLocal.Eof do
    begin
      flgConc1 := (strToDate(DataInicial) >= strToDate(cdsLocal.fieldByName('DATAINICIO').asString)) and
                 (strToDate(DataInicial) <= strToDate(cdsLocal.fieldByName('DATAFINAL').asString));
      flgConc2 := (strToDate(DataFinal) >= strToDate(cdsLocal.fieldByName('DATAINICIO').asString)) and
                 (strToDate(DataFinal) <= strToDate(cdsLocal.fieldByName('DATAFINAL').asString));
      if flgConc1 or flgConc2 then
        result := 1;

      cdsLocal.next;
    end;
  finally
    CdsLocal.Free;
  end;
End;

//******************************************************************************
// Busca o Tempos de Contribuicao calculado de uma pessoa
Function TCtrlTempoServico.BuscaTempoContrib(IdPatro, IdPessoa: Integer): TRecTempo;
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
  cdsLocal.Close;
  try
    // Caso DataFinal Vazia = Data Atual
      If Trim(DataFinal) = '' Then
        DataFinal := PegaDataDoServidor; // Tavares DateToStr(Date);
    // Caso Data Final maior que a Data Fim de Processamento
    // Data Final passa a ser a Data Fim de Processamento

      If StrToDate(DataFinal) > StrToDate(DataFimProc) Then
        DataFinal := DataFimProc;

    // Busca Registros Concomitantes com o Processado
       sSql :=  'SELECT NVL(TO_CHAR(H.DATAFINAL, ''DD/MM/YYYY''), TO_DATE(' +QuotedStr(DataFinal)  + ',' + '''DD/MM/YYYY'') ) AS DATAFINAL, H.*, T.* '+
                 'FROM HISTFUNCPREV H, TPINSALUBRI T    ' +
                 'WHERE H.IDPESSOA    =  ' + IntToStr(IdPessoa)  + ' AND ' +
                 '      H.SEQHISTFUNC <> ' + IntToStr(Sequencia) + ' AND ' +
                 '      H.CODTPINSALUBRI = T.CODTPINSALUBRI(+)       AND ';


        sSql := sSql +  '      (   ' +
                        '       ( (NVL(T.FATOR,0) >= '+OraNumero(FloatToStr(FatorMultiplicador))+') ) OR '+
                        '       (NVL(T.FATOR,0) > '+OraNumero(FloatToStr(FatorMultiplicador))+') OR '+
                        '       (H.DATAINICIO <= TO_DATE('+QuotedStr(DataInicial)+',''DD/MM/YYYY'')) '+
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
                        '       NVL(H.DATAFINAL, TO_DATE(' +QuotedStr(DataFinal)  + ',' + '''DD/MM/YYYY'') ) > TO_DATE(' +QuotedStr(DataFinal)  + ',' + '''DD/MM/YYYY'')) AND ' +
                        '         (NVL(T.FATOR,0) >= '+OraNumero(FloatToStr(FatorMultiplicador))+')'+
                        '      )   ' +
                        'ORDER BY DATAINICIO ';
          cdsLocal.Close;

          cdsLocal.Data := GetDataPacket(sSql);
          cdsLocal.Data := CopyClientDataset(cdsLocal);
// início - André Tavares - 16/02/2004
          if cdsLocal.RecordCount >= 1 then
          begin
            // Gleyber - Pendência 23146 - 24/08/2006
            sSql :=  ' SELECT NVL(TO_CHAR(H.DATAFINAL, ''DD/MM/YYYY''), TO_DATE(' +QuotedStr(DataFinal)  + ',' + '''DD/MM/YYYY'') ) AS DATAFINAL, H.*, T.* '+
                     ' FROM HISTFUNCPREV H, TPINSALUBRI T    ' +
                     ' WHERE H.IDPESSOA    =  ' + IntToStr(IdPessoa)  + ' AND ' +
                     '       H.SEQHISTFUNC > ' + IntToStr(Sequencia) + ' AND ' +
                     '       H.CODTPINSALUBRI = T.CODTPINSALUBRI(+)       AND ';

            sSql := sSql +  '      (   ' +
                            '       ( (NVL(T.FATOR,0) >= '+OraNumero(FloatToStr(FatorMultiplicador))+') ) OR '+
                            '       (NVL(T.FATOR,0) < '+OraNumero(FloatToStr(FatorMultiplicador))+') OR '+
                            '       (H.DATAINICIO <= TO_DATE('+QuotedStr(DataInicial)+',''DD/MM/YYYY'')) '+
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
                            // Gleyber - Pendência 23146 - 24/08/2006
                            '       NVL(H.DATAFINAL, TO_DATE(' +QuotedStr(DataFinal)  + ',' + '''DD/MM/YYYY'') ) > TO_DATE(' +QuotedStr(DataFinal)  + ',' + '''DD/MM/YYYY'')) AND ' +
                            '         (NVL(T.FATOR,0) >= '+OraNumero(FloatToStr(FatorMultiplicador))+')'+
                            '      )   ' +
                            ' ORDER BY DATAINICIO ';
            cdsLocal.Data := GetDataPacket(sSql);
          end;
// fim - André Tavares - 16/02/2004

    // Caso não Possua Registros, sai Fora
        If (cdsLocal.IsEmpty) Then
        Begin
          Result:=0;
          Exit;
        End;
    { Augusto }
    SavePlace := DataSetProcesso.GetBookmark;

    //DAVID - Para poder alterar query com ADO (02/10/2003).
    CdsLocal.Data := CopyClientDataSet( CdsLocal );

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

// Caso DataFinal Vazia = Data Atual
  If Trim(DataFinal) = '' Then DataFinal := PegaDataDoServidor; // tavares
// Caso Data Final maior que a Data Fim de Processamento
// Data Final passa a ser a Data Fim de Processamento

  If StrToDate(DataFinal) > StrToDate(DataFimProc) Then DataFinal := DataFimProc;

// Decodifica as Datas \\
// Incial
  DecodeDate(StrToDate(DataInicial),wAnoI,wMesI,wDiaI); // Inical
    wStrAno :=IntToStr(wAnoI);
    If wMesI >= 10 Then wStrMes:= IntToStr(wMesI) Else wStrMes:= '0'+IntToStr(wMesI);
    If wDiaI >= 10 Then wStrDia:= IntToStr(wDiaI) Else wStrDia:= '0'+IntToStr(wDiaI);
    wStrDataI:= wStrAno+wStrMes+wStrDia;
// Final
  DecodeDate(StrToDate(DataFinal),  wAnoF,wMesF,wDiaF); // Final

// Caso mes Final seja FEREVEIRO, Ultimo dia conta como 30. (Testa se é Bissexto)
    If ((wMesF = 02) And ((wDiaF = 29) Or ( (wDiaF = 28)  ) ) )
    Then Begin
      wDiaF:=30;
    End;

    wStrAno :=IntToStr(wAnoF);
    If wMesF >= 10 Then wStrMes:= IntToStr(wMesF) Else wStrMes:= '0'+IntToStr(wMesF);
    If wDiaF >= 10 Then wStrDia:= IntToStr(wDiaF) Else wStrDia:= '0'+IntToStr(wDiaF);
    wStrDataF:= wStrAno+wStrMes+wStrDia;

// Calcula Tempo Final
  wTempoFinal:= StrToInt(wStrDataF)-StrToInt(wStrDataI);

// Caso Não seja dia 31 o Final Soma 1 dia para acerto
// tavares 11/10/2002 { Augusto }
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

// Augusto 17/10/2002
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
  try
    wTempoFinal  := (StrToInt(wStrAno)*360)+
                    (StrToInt(wStrMes)*30)+
                     StrToInt(wStrDia);
  except
    wTempoFinal  := 0;
    MessageInfo := 'Erro - A Data Final não pode ser menor que a Data Inicial!'+#13#10+
                   'O resultado da simulação estará comprometido.';
  end;
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
    CDSLocal.Data := GetDataPacket(' SELECT TRUNC(SYSDATE) AS DATASERVIDOR FROM DUAL ');

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

function TCtrlTempoServico.BuscaTempoServico(Idpessoa: integer; anoMesDiaRef: string; AConsiderarRegistrosAnteriores : Boolean = False): Olevariant;
var strAux : string;
begin
  if AConsiderarRegistrosAnteriores then
  begin
    result := GetDataPacket(
        // André Tavares - 14/01/2003 - pendência 15922 - inclui o campo FLGTEMPOMANUT na query
        ' SELECT EL.MATRICULA AS MATRICULAATUAL, H.FLGTEMPOMANUT,                                 '+
        '  H.IDPESSOA,   H.IDPESSJUR,  H.SEQHISTFUNC, H.IDDOCUMENTO, H.CODTPINSALUBRI, SF.TIPOSIT,            '+
        '  DECODE(H.FLGCONTATS,1,''Sim'',''Não'') AS FLGCONTATSTRANSF, H.DATAINICIO, TRUNC((CASE WHEN SF.TIPOSIT = ''A'' THEN SYSDATE ELSE EL.DATADEMISSAO END)) DATAFINAL, '+ // H.DATAFINAL
  //Início: SOL 143794 KINATA 943403 by Marcelo Almeida
        '  H.CARGO,       H.VALORCARGO,  H.FUNCAO,     H.VINCEMPREG, NVL(H.MATRICULA, EL.MATRICULA) MATRICULA,   H.EMPRESA,    '+
  //Fim: SOL 143794 KINATA 943403 by Marcelo Almeida
        '  H.TEMPOCALC,  DECODE(H.FLGCONCOMITANTE,1,''Sim'',''Não'') AS FLGCONCOMITANTETRANSF,    '+
        '  H.FLGCONCOMITANTE,                                                                     '+
        '  H.NUMDOCUMENTO AS CPF,  TI.FATOR,  EL.TEMPOSERVANTERIOR, EL.TEMPOSITESPECIAL,          '+
        '  EL.TEMPONAOCREDITADO, P.NOME, NVL(H.FLGCONTATS, 0) AS FLGCONTATS,                      '+
        '  EL.TEMPOSERVCALC,                                                                      '+
        '  EL.TEMPOSIMPLES AS TEMPOSEMCONVERSAO,                                                  '+
        '  0 AS TEMPOSERVCALCSIMULA, 0 AS TEMPOSEMCONVSIMULA, ''DD/MM/YYYY'' AS DATAREF, ''DD/MM/YYYY'' AS DATAREFSIMULA, '+ //andre tavares - 09/03/2004 tempos de simulação
        '  ''100 ano(s), 11 mes(es) e 29 dia(s) '' AS TEMPOSEMCONVERSAOEXT,                       '+
        '  ''100 ano(s), 11 mes(es) e 29 dia(s) '' AS TEMPOSEMCONVERSAOEXTSIMULA, '+//andre tavares - 09/03/2004 tempos de simulação
        '  ''100 ano(s), 11 mes(es) e 29 dia(s) '' AS TEMPOINDIVEXT,                              '+
        '  ''100 ano(s), 11 mes(es) e 29 dia(s) '' AS TEMPOTOTALEXT,                               '+
        '  ''100 ano(s), 11 mes(es) e 29 dia(s) '' AS TEMPOTOTALEXTSIMULA '+//andre tavares - 09/03/2004 tempos de simulação
        ' FROM                                                                                    '+
        '  PESSOA P,                                                                              '+
        '  ELEGPATRO EL,                                                                          '+
        '  HISTFUNCPREV H,                                                                        '+
        '  TPINSALUBRI TI,                                                                        '+
  //Início: SOL 143794 KINATA 943403 by Marcelo Almeida
        '  SITFUNC SF                                                                             '+
  //Fim: SOL 143794 KINATA 943403 by Marcelo Almeida
        ' WHERE                                                                                   '+
  //Início: SOL 143794 KINATA 943403 by Marcelo Almeida
        //      '     (H.IDPESSOA = '+IntTostr(Idpessoa)+')                                               '+
        '     (H.IDPESSOA IN (SELECT P.idpessoa FROM pessoa P WHERE P.numdocumento = (SELECT P.numdocumento FROM pessoa P WHERE P.idpessoa = '+IntTostr(Idpessoa)+' AND ROWNUM = 1)))                                               '+
  //Fim: SOL 143794 KINATA 943403 by Marcelo Almeida
        ' AND (H.IDPESSOA = EL.IDPESSOA(+))                                                          '+
        ' AND (H.IDPESSJUR = EL.IDPESSJUR(+)) '+
        ' AND (P.IDPESSOA  = H.IDPESSOA)                                                          '+
        ' AND (H.CODTPINSALUBRI = TI.CODTPINSALUBRI(+))                                           '+
        ' AND (TO_CHAR(H.DATAINICIO,''YYYY/MM/DD'') <= '+ QuotedStr( anoMesDiaRef )+')'+
  //Início: SOL 143794 KINATA 943403 by Marcelo Almeida
        ' AND (SF.Idsitfunc = EL.idsitfunc)                                                    '+
  //Fim: SOL 143794 KINATA 943403 by Marcelo Almeida
        ' ORDER BY H.DATAINICIO, H.SEQHISTFUNC                                                    ');
  end
  else
  begin
    result := GetDataPacket(
        // André Tavares - 14/01/2003 - pendência 15922 - inclui o campo FLGTEMPOMANUT na query
        ' SELECT EL.MATRICULA AS MATRICULAATUAL, H.FLGTEMPOMANUT,                                 '+
        '  H.IDPESSOA,   H.IDPESSJUR,  H.SEQHISTFUNC, H.IDDOCUMENTO, H.CODTPINSALUBRI, SF.TIPOSIT,            '+
        '  DECODE(H.FLGCONTATS,1,''Sim'',''Não'') AS FLGCONTATSTRANSF, H.DATAINICIO, H.DATAFINAL, '+
        '  H.CARGO,       H.VALORCARGO,  H.FUNCAO,     H.VINCEMPREG, H.MATRICULA,   H.EMPRESA,    '+
        '  H.TEMPOCALC,  DECODE(H.FLGCONCOMITANTE,1,''Sim'',''Não'') AS FLGCONCOMITANTETRANSF,    '+
        '  H.FLGCONCOMITANTE,                                                                     '+
        '  H.NUMDOCUMENTO AS CPF,  TI.FATOR,  EL.TEMPOSERVANTERIOR, EL.TEMPOSITESPECIAL,          '+
        '  EL.TEMPONAOCREDITADO, P.NOME, NVL(H.FLGCONTATS, 0) AS FLGCONTATS,                      '+
        '  EL.TEMPOSERVCALC,                                                                      '+
        '  EL.TEMPOSIMPLES AS TEMPOSEMCONVERSAO,                                                  '+
        '  0 AS TEMPOSERVCALCSIMULA, 0 AS TEMPOSEMCONVSIMULA, ''DD/MM/YYYY'' AS DATAREF, ''DD/MM/YYYY'' AS DATAREFSIMULA, '+ //andre tavares - 09/03/2004 tempos de simulação
        '  ''100 ano(s), 11 mes(es) e 29 dia(s) '' AS TEMPOSEMCONVERSAOEXT,                       '+
        '  ''100 ano(s), 11 mes(es) e 29 dia(s) '' AS TEMPOSEMCONVERSAOEXTSIMULA, '+//andre tavares - 09/03/2004 tempos de simulação
        '  ''100 ano(s), 11 mes(es) e 29 dia(s) '' AS TEMPOINDIVEXT,                              '+
        '  ''100 ano(s), 11 mes(es) e 29 dia(s) '' AS TEMPOTOTALEXT,                               '+
        '  ''100 ano(s), 11 mes(es) e 29 dia(s) '' AS TEMPOTOTALEXTSIMULA '+//andre tavares - 09/03/2004 tempos de simulação
        ' FROM                                                                                    '+
        '  PESSOA P,                                                                              '+
        '  ELEGPATRO EL,                                                                          '+
        '  HISTFUNCPREV H,                                                                        '+
        '  TPINSALUBRI TI                                                                         '+
        //Início: SOL 143794 KINATA 943403 by Marcelo Almeida
        '  ,SITFUNC SF                                                                            '+
        //Fim: SOL 143794 KINATA 943403 by Marcelo Almeida
        ' WHERE                                                                                   '+
        '     (H.IDPESSOA = '+IntTostr(Idpessoa)+')                                               '+
        ' AND (H.IDPESSOA = EL.IDPESSOA(+))                                                          '+
        ' AND (H.IDPESSJUR = EL.IDPESSJUR(+)) '+
        ' AND (P.IDPESSOA  = H.IDPESSOA)                                                          '+
        ' AND (H.CODTPINSALUBRI = TI.CODTPINSALUBRI(+))                                           '+
        ' AND (TO_CHAR(H.DATAINICIO,''YYYY/MM/DD'') <= '+ QuotedStr( anoMesDiaRef )+')'+
        //Início: SOL 143794 KINATA 943403 by Marcelo Almeida
        ' AND (SF.Idsitfunc = EL.idsitfunc)                                                    '+
        //Fim: SOL 143794 KINATA 943403 by Marcelo Almeida

        ' ORDER BY H.DATAINICIO, H.SEQHISTFUNC                                                    ');
  end;
end;


function TCtrlTempoServico.AnoBissexto(aAno:Integer):Boolean;
begin
  AnoBissexto := isLeapYear(aAno);
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

function TCtrlTempoServico.CalculaTempos(idpessoa : Integer; data : TdateTime;
                                         ContaTempoManut : Boolean = false; DataTempoManut : string = ''; AConsiderarRegistrosAnteriores : Boolean = False): OleVariant;
var cdsLocal, CdsLocal2, cdsLocalAux, cdsLocalSimula  : TCMclientDataSet;
  // inicio andre tavares 09/003/2004 - tempo simulado
    sTempoTotalSimulado, sTempoSemConversaoSimulado,
  // fim andre tavares 09/003/2004 - tempo simulado
    sTempoTotal, sTempoSemConversao : string;
    dia, mes, ano : word;
  // inicio andre tavares 09/003/2004 - tempo simulado
    wTempoSimplesSimulado, wTempoDescontoEspecialSimulado,
    wTempoDescontoSimplesSimulado, wTempoAcrecimoSimulado, wTempoCalcSimulado,
    TempoTotalSimulado, TempoTotalSimplesSimulado,
  // fim andre tavares 09/003/2004 - tempo simulado
    TempoTotalSimples, TempoTotal, wTempoIndiv, wTempoSimples,
    wTempoDescontoEspecial, wTempoDescontoSimples, wTempoAcrecimo,
    wTempoCalc, wflgConcomitante, iTotal: integer;
//Inicio -  Pendência   : SOL 37791  KINTANA 523676
    wTotalizadorTempoCalc, wTotalizadorTempoSimples : integer;
    sTotalizadorTempoCalc, sTotalizadorTempoSimples : String;
//Inicio -  Pendência   : SOL 37791  KINTANA 523676
    dataFimCorr, dataIniNext : Extended;
    bNext, bSimula: Boolean;
    sNome, sSql : string;
    dataAux, dataCorrente : TdateTime;
    sDtManut, sDataMax : string;
    IseqHist : array  of longint; IseqMaxData : array of LongInt; // andre tavares - 08/03/2004
    i : integer;

begin
  // pega a data corrente do servidor para cálculo de tempo normal
  sDataMax               := '';// andre tavares - 08/03/2004
  dataCorrente           := StrToDate(PegaDataDoServidor);// andre tavares - 08/03/2004
  TempoTotalSimples      := 0;
  TempoTotal             := 0;
  wTempoIndiv            := 0;
  // inicio andre tavares 09/003/2004 - tempo simulado
  wTempoSimplesSimulado          := 0;
  wTempoDescontoEspecialSimulado := 0;
  wTempoDescontoSimplesSimulado  := 0;
  wTempoAcrecimoSimulado         := 0;
  wTempoCalcSimulado             := 0;
  TempoTotalSimulado             := 0;
  TempoTotalSimplesSimulado      := 0;
  // fim andre tavares 09/003/2004 - tempo simulado

  wTempoSimples          := 0;
  wTempoDescontoEspecial := 0;
  wTempoDescontoSimples  := 0;
  wTempoAcrecimo         := 0;
  wTempoCalc             := 0;
  wflgConcomitante       := 0;
  dataFimCorr            := 0;
  dataIniNext            := 0;
  iTotal                 := 0;
  bSimula                := false;
  sNome                  := '';
  sSql                   := '';
  CdsLocal    := TCMclientDataSet.Create(nil);
  CdsLocal2   := TCMclientDataSet.Create(nil);
  CdsLocalSimula  := TCMclientDataSet.Create(nil);
  CdsLocalAux := TCMclientDataSet.Create(nil);
  dataAux     := strToDate(formatDateTime('dd/mm/yyyy', date));
  sdtManut := dateToStr(data); // andre tavares - 09/03/2004

  { Busca Todos os Lancamentos da Pessoa Ordenado por Data Inicial, Sequencia }
  CdsLocal2.Close;
  // tavares 11/04/2003 modo simulação

  if (data <> DataCorrente) OR (strToDate(sDtManut) <> Date) then
  begin
    bSimula := true;
  end;

  //INÍCIO - andre tavares - 08/03/2004 pega a sequencia do tempo onde a dataFinal é nula
  sSql := ' SELECT SEQHISTFUNC FROM HISTFUNCPREV WHERE IDPESSOA = '+ IntToStr(IdPessoa)+ ' AND '+
          ' DATAFINAL IS NULL';
  CdsLocal2.Data := GetDataPacket(sSql);
  cdsLocal2.LogChanges := false;
  CdsLocal2.First;
  i := 0;
  setLength(IseqHist, CdsLocal2.RecordCount);
  while not CdsLocal2.eof do
  begin
    IseqHist[i] := CdsLocal2.fieldByName('SEQHISTFUNC').asInteger;
    i := i + 1;
    CdsLocal2.Next;
  end;
  //FIM - andre tavares - 08/03/2004 pega a sequencia do tempo onde a dataFinal é nula

  if trim(DataTempoManut) = '' then
  begin
    dataAux := strToDate(formatDateTime('dd/mm/yyyy', data));
    DataTempoManut := formatDateTime('dd/mm/yyyy', data);
  end;

  if cdsLocal2.IsEmpty then // se não existe uma data em aberto então pega a maior data final
  begin
    sSql := ' SELECT SEQHISTFUNC, DATAFINAL FROM HISTFUNCPREV WHERE IDPESSOA = '+ IntToStr(IdPessoa) +
            ' AND  DATAFINAL = (SELECT MAX(DATAFINAL) FROM HISTFUNCPREV WHERE IDPESSOA = ' + IntToStr(IdPessoa) +')';
    CdsLocal2.Data  := GetDataPacket(sSql);
    sDataMax := cdsLocal2.FieldByName('DATAFINAL').asString;
    CdsLocal2.First;
    i := 0;
    setLength(IseqMaxData, CdsLocal2.RecordCount);
    while not CdsLocal2.eof do
    begin
      IseqMaxData[i]     := CdsLocal2.fieldByName('SEQHISTFUNC').asInteger;
      i := i + 1;
      CdsLocal2.Next;
    end;
  end;
  //Inicio -  Pendência   : SOL 37791  KINTANA 523676
  if AConsiderarRegistrosAnteriores then
  begin
// 08/03/2004 andre tavares
    sSql:= ' SELECT TO_CHAR((CASE WHEN SF.TIPOSIT = ''A'' THEN SYSDATE ELSE EL.DATADEMISSAO END), ''DD/MM/YYYY'') DATAFINAL, '+
                      ' H.SEQHISTFUNC,          '+
                      ' H.IDDOCUMENTO,          '+
                      ' H.IDPESSJUR,            '+
                      ' H.CODTPINSALUBRI,       '+
                      ' H.DATAFINAL,            '+
                      ' H.CARGO,                '+
                      ' H.FUNCAO,               '+
                      ' H.TEMPOCALCINSALUB,     '+
                      ' H.DATAINICIO,           '+
                      ' H.EMPRESA,              '+
                      ' H.VALORCARGO,           '+
                      ' H.NUMDOCUMENTO,         '+
                      ' H.FLGCONTATS,           '+
                      ' H.VINCEMPREG,           '+
                      ' NVL(H.MATRICULA, EL.MATRICULA) MATRICULA,            '+
                      ' H.IDPESSOA,             '+
                      ' H.TEMPOCALC,            '+
                      ' H.FLGCONCOMITANTE,      '+
                      ' H.DATAPROCESSO,         '+
                      ' H.TRGDTINCLUSAO,        '+
                      ' H.TRGUSERINCLUSAO,      '+
                      ' H.TEMPOSIMPLES,         '+
                      ' H.FLGTEMPOMANUT,        '+
                                    '       T.* FROM HISTFUNCPREV H, TPINSALUBRI T, ELEGPATRO EL, SITFUNC SF      '+
                                    ' WHERE H.IDPESSOA IN (SELECT P.idpessoa FROM pessoa P WHERE P.numdocumento IN (SELECT P.numdocumento FROM pessoa P WHERE P.idpessoa = ' + IntToStr(IdPessoa)+'))  AND '+
                                    '       H.CODTPINSALUBRI = T.CODTPINSALUBRI(+) AND '+
                                    '       H.DATAINICIO    <= TO_DATE(' + QuotedStr(dateToStr(data))  + ',' + '''DD/MM/YYYY'') ' +
                                    ' AND   NVL(H.FLGTEMPOMANUT, 0) = 0  '+
                                    ' AND H.IDPESSOA = EL.IDPESSOA(+)  '+
                                    ' AND H.IDPESSJUR = EL.IDPESSJUR(+)  '+
                                    ' AND SF.Idsitfunc = EL.idsitfunc  '+
           ' UNION SELECT TO_CHAR((CASE WHEN SF.TIPOSIT = ''A'' THEN SYSDATE ELSE EL.DATADEMISSAO END), ''DD/MM/YYYY'') DATAFINAL, '+
                                 ' H.SEQHISTFUNC,          '+
                                 ' H.IDDOCUMENTO,          '+
                                 ' H.IDPESSJUR,            '+
                                 ' H.CODTPINSALUBRI,       '+
                                 ' H.DATAFINAL,            '+
                                 ' H.CARGO,                '+
                                 ' H.FUNCAO,               '+
                                 ' H.TEMPOCALCINSALUB,     '+
                                 ' H.DATAINICIO,           '+
                                 ' H.EMPRESA,              '+
                                 ' H.VALORCARGO,           '+
                                 ' H.NUMDOCUMENTO,         '+
                                 ' H.FLGCONTATS,           '+
                                 ' H.VINCEMPREG,           '+
                                 ' NVL(H.MATRICULA, EL.MATRICULA) MATRICULA,            '+
                                 ' H.IDPESSOA,             '+
                                 ' H.TEMPOCALC,            '+
                                 ' H.FLGCONCOMITANTE,      '+
                                 ' H.DATAPROCESSO,         '+
                                 ' H.TRGDTINCLUSAO,        '+
                                 ' H.TRGUSERINCLUSAO,      '+
                                 ' H.TEMPOSIMPLES,         '+
                                 ' H.FLGTEMPOMANUT,        '+
                                    ' T.* FROM HISTFUNCPREV H, TPINSALUBRI T, ELEGPATRO EL, SITFUNC SF      '+
                                    ' WHERE H.IDPESSOA IN (SELECT P.idpessoa FROM pessoa P WHERE P.numdocumento = (SELECT P.numdocumento FROM pessoa P WHERE P.idpessoa = ' + IntToStr(IdPessoa)+' AND ROWNUM = 1))  AND '+
                                    '       H.CODTPINSALUBRI = T.CODTPINSALUBRI(+) AND '+
                                    '       H.DATAINICIO    <= TO_DATE(' + QuotedStr(DataTempoManut)  + ',' + '''DD/MM/YYYY'') ' +
                                    ' AND   H.FLGTEMPOMANUT = 1  '+
                                    ' AND H.IDPESSOA = EL.IDPESSOA(+) '+
                                    ' AND H.IDPESSJUR = EL.IDPESSJUR(+) '+
                                    ' AND SF.Idsitfunc = EL.idsitfunc '+
                                    ' ORDER BY IDPESSOA, DATAINICIO, SEQHISTFUNC ';
  end
  else
  begin
// 08/03/2004 andre tavares
    sSql:= ' SELECT NVL(TO_CHAR(H.DATAFINAL, ''DD/MM/YYYY''), ' + quotedStr(formatDateTime('DD/MM/YYYY', data)) + ' ) AS DATAFINAL, '+
                      ' H.SEQHISTFUNC,          '+
                      ' H.IDDOCUMENTO,          '+
                      ' H.IDPESSJUR,            '+
                      ' H.CODTPINSALUBRI,       '+
                      ' H.DATAFINAL,            '+
                      ' H.CARGO,                '+
                      ' H.FUNCAO,               '+
                      ' H.TEMPOCALCINSALUB,     '+
                      ' H.DATAINICIO,           '+
                      ' H.EMPRESA,              '+
                      ' H.VALORCARGO,           '+
                      ' H.NUMDOCUMENTO,         '+
                      ' H.FLGCONTATS,           '+
                      ' H.VINCEMPREG,           '+
                      ' H.MATRICULA,            '+
                      ' H.IDPESSOA,             '+
                      ' H.TEMPOCALC,            '+
                      ' H.FLGCONCOMITANTE,      '+
                      ' H.DATAPROCESSO,         '+
                      ' H.TRGDTINCLUSAO,        '+
                      ' H.TRGUSERINCLUSAO,      '+
                      ' H.TEMPOSIMPLES,         '+
                      ' H.FLGTEMPOMANUT,        '+
                                    '       T.* FROM HISTFUNCPREV H, TPINSALUBRI T      '+
                                    ' WHERE H.IDPESSOA = ' + IntToStr(IdPessoa)+'  AND '+
                                    '       H.CODTPINSALUBRI = T.CODTPINSALUBRI(+) AND '+
                                    '       H.DATAINICIO    <= TO_DATE(' + QuotedStr(dateToStr(data))  + ',' + '''DD/MM/YYYY'') ' +
                                    ' AND   NVL(H.FLGTEMPOMANUT, 0) = 0  '+

           ' UNION SELECT NVL(TO_CHAR(H.DATAFINAL, ''DD/MM/YYYY''), ' + quotedStr(formatDateTime('DD/MM/YYYY', data)) + ') AS DATAFINAL, '+
                                 ' H.SEQHISTFUNC,          '+
                                 ' H.IDDOCUMENTO,          '+
                                 ' H.IDPESSJUR,            '+
                                 ' H.CODTPINSALUBRI,       '+
                                 ' H.DATAFINAL,            '+
                                 ' H.CARGO,                '+
                                 ' H.FUNCAO,               '+
                                 ' H.TEMPOCALCINSALUB,     '+
                                 ' H.DATAINICIO,           '+
                                 ' H.EMPRESA,              '+
                                 ' H.VALORCARGO,           '+
                                 ' H.NUMDOCUMENTO,         '+
                                 ' H.FLGCONTATS,           '+
                                 ' H.VINCEMPREG,           '+
                                 ' H.MATRICULA,            '+
                                 ' H.IDPESSOA,             '+
                                 ' H.TEMPOCALC,            '+
                                 ' H.FLGCONCOMITANTE,      '+
                                 ' H.DATAPROCESSO,         '+
                                 ' H.TRGDTINCLUSAO,        '+
                                 ' H.TRGUSERINCLUSAO,      '+
                                 ' H.TEMPOSIMPLES,         '+
                                 ' H.FLGTEMPOMANUT,        '+
                                    ' T.* FROM HISTFUNCPREV H, TPINSALUBRI T      '+
                                    ' WHERE H.IDPESSOA = ' + IntToStr(IdPessoa)+'  AND '+
                                    '       H.CODTPINSALUBRI = T.CODTPINSALUBRI(+) AND '+
                                    '       H.DATAINICIO    <= TO_DATE(' + QuotedStr(DataTempoManut)  + ',' + '''DD/MM/YYYY'') ' +
                                    ' AND   H.FLGTEMPOMANUT = 1  '+
                                    ' ORDER BY IDPESSOA, DATAINICIO, SEQHISTFUNC ';
  end;
  //Fim -  Pendência   : SOL 37791  KINTANA 523676

    CdsLocalSimula.Data := GetDataPacket(sSql);
    cdsLocalSimula.LogChanges := false;
    CdsLocalSimula.Data := CopyClientDataSet(CdsLocalSimula);

  //Inicio -  Pendência   : SOL 37791  KINTANA 523676
  if AConsiderarRegistrosAnteriores then
  begin
    sSql := ' SELECT TO_CHAR((CASE WHEN SF.TIPOSIT = ''A'' THEN SYSDATE ELSE EL.DATADEMISSAO END), ''DD/MM/YYYY'') DATAFINAL, NVL(H.MATRICULA, EL.MATRICULA) MATRICULA, H.*, T.* FROM HISTFUNCPREV H, TPINSALUBRI T, ELEGPATRO EL, SITFUNC SF'+
                                    ' WHERE  H.IDPESSOA IN (SELECT P.idpessoa FROM pessoa P WHERE P.numdocumento = (SELECT P.numdocumento FROM pessoa P WHERE P.idpessoa = ' + IntToStr(IdPessoa)+' AND ROWNUM = 1))  AND '+
                                    '        H.CODTPINSALUBRI = T.CODTPINSALUBRI(+) AND '+
                                    '        H.DATAINICIO    <= TO_DATE(' +QuotedStr(dateToStr(dataCorrente))  + ',' + '''DD/MM/YYYY'') ' +
                                    '        AND H.IDPESSOA = EL.IDPESSOA(+) ' +
                                    '        AND H.IDPESSJUR = EL.IDPESSJUR(+) ' +
                                    '        AND SF.Idsitfunc = EL.idsitfunc ' +
                                    ' ORDER BY H.IDPESSOA, H.DATAINICIO, H.SEQHISTFUNC ';
  end
  else
  begin
    sSql := ' SELECT NVL(TO_CHAR(H.DATAFINAL, ''DD/MM/YYYY''), ' + quotedStr(formatDateTime('DD/MM/YYYY', dataCorrente)) + ') AS DATAFINAL, H.*, T.* FROM HISTFUNCPREV H, TPINSALUBRI T '+
                                    ' WHERE  H.IDPESSOA = ' + IntToStr(IdPessoa)+'  AND '+
                                    '        H.CODTPINSALUBRI = T.CODTPINSALUBRI(+) AND '+
                                    '        H.DATAINICIO    <= TO_DATE(' +QuotedStr(dateToStr(dataCorrente))  + ',' + '''DD/MM/YYYY'') ' +
                                    ' ORDER BY H.IDPESSOA, H.DATAINICIO, H.SEQHISTFUNC ';
  end;
  //Fim -  Pendência   : SOL 37791  KINTANA 523676

  CdsLocal2.Data := GetDataPacket(sSql);
  CdsLocal2.Data := CopyClientDataSet(CdsLocal2);

// inicio - andre tavares - 08/03/2004
  for i := 0 to length(iSeqMaxData)-1 do
  begin
    if (cdsLocalSimula.Locate('SEQHISTFUNC', IntToStr(iSeqMaxData[i]), [])) Then
    begin
      cdsLocalSimula.Edit;
      cdsLocalSimula.FieldByName('DATAFINAL').asDateTime := data;
      cdsLocalSimula.Post;
    end;
  end;
  cdsLocalSimula.Data := CopyClientDataSet(cdsLocalSimula);

// fim - andre tavares - 08/03/2004

  if not InTransaction then
    startTransaction;
// andre tavares - 08/01/2004 - coloquei a condição bSimula para não gravar simulações
  try
   { Apaga o Histórico de Tempo de Contribuicao }
   ExecSql(' UPDATE HISTFUNCPREV SET  '+
           ' TEMPOCALC        = NULL, '+
           ' TEMPOCALCINSALUB = NULL, '+
           ' TEMPOSIMPLES     = NULL  '+
           ' WHERE IDPESSOA = ' + IntToStr(IdPessoa));
  except on e : Exception do
  begin
// andre tavares - 08/01/2004 - coloquei a condição bSimula para não gravar simulações
   MessageInfo := e.Message;
  end;
  end;
// andre tavares - 08/01/2004 - coloquei a condição bSimula para não gravar simulações

  //DAVID - Para poder alterar query com ADO (02/10/2003).
  CdsLocal2.Data := CopyClientDataSet( CdsLocal2 );

  CdsLocal2.First;
  while not CdsLocal2.Eof do
  begin
    CdsLocal2.Edit;
    CdsLocal2.FieldByName('TEMPOCALC').asInteger    := -1;
    CdsLocal2.FieldByName('TEMPOSIMPLES').asInteger :=  0;
    CdsLocal2.Post;
    CdsLocal2.Next;
  end;

  while not CdsLocalSimula.Eof do
  begin
    CdsLocalSimula.Edit;
    CdsLocalSimula.FieldByName('TEMPOCALC').asInteger    := -1;
    CdsLocalSimula.FieldByName('TEMPOSIMPLES').asInteger :=  0;
    CdsLocalSimula.Post;
    CdsLocalSimula.Next;
  end;


  TempoTotalSimples := 0;
  TempoTotal := 0;
 { Varre Arquivo Processando os periodos }

  cdsLocal2.First;
  cdsLocalSimula.First;
  While Not cdsLocal2.Eof Do
  Begin
    dataAux := strToDate(formatDateTime('dd/mm/yyyy', data));
    { Testa Datas, Caso processo Unitário mostra mensagem caso Batch aborta }
    If (cdsLocal2.FieldByName('DATAFINAL').AsDateTime < cdsLocal2.FieldByName('DATAINICIO').AsDateTime) And
       (cdsLocal2.FieldByName('DATAFINAL').AsDateTime <> 0)
    Then
    Begin
      { Proximo Registro e Volta }
      cdsLocal2.Next;
      Continue;
    End;

    { Calcula Tempo Sem Descontos deste periodo }
    // inicio andre tavares 09/003/2004 - tempo simulado
    if not CdsLocalSimula.Eof then
    begin
      wTempoSimplesSimulado := CalcTempoContrib(CdsLocalSimula.FieldByName('IDPESSOA').AsInteger,
                                        CdsLocalSimula.FieldByName('SEQHISTFUNC').AsInteger,
                                        CdsLocalSimula.FieldByName('FLGCONTATS').AsInteger,
                                        1, // Calculo Normal
                                        CdsLocalSimula.FieldByName('DATAINICIO').AsString,
                                        CdsLocalSimula.FieldByName('DATAFINAL').AsString,
                                        formatDateTime('dd/mm/yyyy', dataAux));

      wTempoDescontoEspecialSimulado := ProcessaDescontos(CdsLocalSimula.FieldByName('IDPESSOA').AsInteger,
                                                  CdsLocalSimula.FieldByName('SEQHISTFUNC').AsInteger,
                                                  CdsLocalSimula.FieldByName('FATOR').AsFloat,
                                                  CdsLocalSimula.FieldByName('DATAINICIO').AsString,
                                                  CdsLocalSimula.FieldByName('DATAFINAL').AsString,
                                                  formatDateTime('dd/mm/yyyy', dataAux),
                                                  TpDescontoEspecial,
                                                  CdsLocalSimula); { Calcula descontos especiais }

      wTempoDescontoSimplesSimulado  := ProcessaDescontos(CdsLocalSimula.FieldByName('IDPESSOA').AsInteger,
                                                  CdsLocalSimula.FieldByName('SEQHISTFUNC').AsInteger,
                                                  CdsLocalSimula.FieldByName('FATOR').AsFloat,
                                                  CdsLocalSimula.FieldByName('DATAINICIO').AsString,
                                                  CdsLocalSimula.FieldByName('DATAFINAL').AsString,
                                                  DateToStr(dataAux),
                                                  TpDescontoSimples,
                                                  CdsLocalSimula); { Calcula descontos simples }

      { Testa e Gera flag se Tempo é Concomitante }
      wFlgConcomitante := PeriodoConcomitante(CdsLocalSimula.FieldByName('IDPESSOA').AsInteger,
                                              CdsLocalSimula.FieldByName('SEQHISTFUNC').AsInteger,
                                              CdsLocalSimula.FieldByName('DATAINICIO').AsString,
                                              CdsLocalSimula.FieldByName('DATAFINAL').AsString);

      if wFlgConcomitante = 0 then //06/04/2004
        { Processa Acrecimos de tempos Especiais }
        wTempoAcrecimoSimulado := ProcessaAcrecimos(CdsLocalSimula.FieldByName('IDPESSOA').AsInteger,
                                            CdsLocalSimula.FieldByName('SEQHISTFUNC').AsInteger,
                                           (wTempoSimplesSimulado - wTempoDescontoEspecialSimulado),
                                            CdsLocalSimula.FieldByName('CODTPINSALUBRI').AsString,
                                            CdsLocalSimula.FieldByName('DATAINICIO').AsString,
                                            CdsLocalSimula.FieldByName('DATAFINAL').AsString,
                                            DateToStr(dataAux))
      else
        wTempoAcrecimoSimulado := ProcessaAcrecimos(CdsLocalSimula.FieldByName('IDPESSOA').AsInteger,
                                            CdsLocalSimula.FieldByName('SEQHISTFUNC').AsInteger,
                                            wTempoSimplesSimulado,
                                            CdsLocalSimula.FieldByName('CODTPINSALUBRI').AsString,
                                            CdsLocalSimula.FieldByName('DATAINICIO').AsString,
                                            CdsLocalSimula.FieldByName('DATAFINAL').AsString,
                                            DateToStr(dataAux));

      wTempoCalcSimulado    := ((wTempoSimplesSimulado - wTempoDescontoEspecialSimulado) + wTempoAcrecimoSimulado);
      wTempoSimplesSimulado := (wTempoSimplesSimulado - wTempoDescontoSimplesSimulado);

      If CdsLocalSimula.FieldByName('FLGCONTATS').AsInteger = 1 Then
      begin
        TempoTotalSimulado := TempoTotalSimulado + wTempoCalcSimulado;
        TempoTotalSimplesSimulado := TempoTotalSimplesSimulado + wTempoSimplesSimulado;
      end;

      cdsLocalSimula.Next;
    end;
    // fim andre tavares 09/003/2004 - tempo simulado

    wTempoSimples := CalcTempoContrib(cdsLocal2.FieldByName('IDPESSOA').AsInteger,
                                      cdsLocal2.FieldByName('SEQHISTFUNC').AsInteger,
                                      cdsLocal2.FieldByName('FLGCONTATS').AsInteger,
                                      1, // Calculo Normal
                                      cdsLocal2.FieldByName('DATAINICIO').AsString,
                                      cdsLocal2.FieldByName('DATAFINAL').AsString,
                                      formatDateTime('dd/mm/yyyy', dataCorrente));

    { Processa Descontos de tempos Concomitantes Especiais e Simples }


    wTempoDescontoEspecial := ProcessaDescontos(cdsLocal2.FieldByName('IDPESSOA').AsInteger,
                                                cdsLocal2.FieldByName('SEQHISTFUNC').AsInteger,
                                                cdsLocal2.FieldByName('FATOR').AsFloat,
                                                cdsLocal2.FieldByName('DATAINICIO').AsString,
                                                cdsLocal2.FieldByName('DATAFINAL').AsString,
                                                formatDateTime('dd/mm/yyyy', dataCorrente),
                                                TpDescontoEspecial,
                                                cdsLocal2); { Calcula descontos especiais }


    wTempoDescontoSimples  := ProcessaDescontos(cdsLocal2.FieldByName('IDPESSOA').AsInteger,
                                                cdsLocal2.FieldByName('SEQHISTFUNC').AsInteger,
                                                cdsLocal2.FieldByName('FATOR').AsFloat,
                                                cdsLocal2.FieldByName('DATAINICIO').AsString,
                                                cdsLocal2.FieldByName('DATAFINAL').AsString,
                                                formatDateTime('dd/mm/yyyy', dataCorrente),
                                                TpDescontoSimples,
                                                cdsLocal2); { Calcula descontos simples }

    { Testa e Gera flag se Tempo é Concomitante }
    wFlgConcomitante := PeriodoConcomitante(CdsLocal2.FieldByName('IDPESSOA').AsInteger,
                                   CdsLocal2.FieldByName('SEQHISTFUNC').AsInteger,
                                   CdsLocal2.FieldByName('DATAINICIO').AsString,
                                   CdsLocal2.FieldByName('DATAFINAL').AsString);

    if wFlgConcomitante = 0 then //06/04/2004
      { Processa Acrecimos de tempos Especiais }
      wTempoAcrecimo := ProcessaAcrecimos(cdsLocal2.FieldByName('IDPESSOA').AsInteger,
                                          cdsLocal2.FieldByName('SEQHISTFUNC').AsInteger,
                                         (wTempoSimples-wTempoDescontoEspecial),
                                          cdsLocal2.FieldByName('CODTPINSALUBRI').AsString,
                                          cdsLocal2.FieldByName('DATAINICIO').AsString,
                                          cdsLocal2.FieldByName('DATAFINAL').AsString,
                                          formatDateTime('dd/mm/yyyy', dataCorrente))
    else
      { Processa Acrecimos de tempos Especiais }
      wTempoAcrecimo := ProcessaAcrecimos(cdsLocal2.FieldByName('IDPESSOA').AsInteger,
                                          cdsLocal2.FieldByName('SEQHISTFUNC').AsInteger,
                                         (wTempoSimples),
                                          cdsLocal2.FieldByName('CODTPINSALUBRI').AsString,
                                          cdsLocal2.FieldByName('DATAINICIO').AsString,
                                          cdsLocal2.FieldByName('DATAFINAL').AsString,
                                          formatDateTime('dd/mm/yyyy', dataCorrente));

    { Acerta Tempo de Contribuicao Real, com Descontos }

     wTempoCalc    := ((wTempoSimples - wTempoDescontoEspecial) + wTempoAcrecimo);
     wTempoSimples := (wTempoSimples - wTempoDescontoSimples);

    If cdsLocal2.FieldByName('FLGCONTATS').AsInteger = 1 Then
    begin
      TempoTotal := TempoTotal + wTempoCalc;
      TempoTotalSimples := TempoTotalSimples + wTempoSimples;
    end;

    cdsLocal2.Edit;
    cdsLocal2.FieldbyName('TEMPOCALC').asString        := IntToStr(wTempoCalc);
    cdsLocal2.FieldbyName('TEMPOSIMPLES').asString     := IntToStr(wTempoSimples);
    cdsLocal2.FieldbyName('TEMPOCALCINSALUB').asString := IntToStr(wTempoAcrecimo);
    cdsLocal2.FieldbyName('FLGCONCOMITANTE').asString  := IntToStr(wFlgConcomitante);
    cdsLocal2.Post;

//Inicio -  Pendência   : SOL 37791  KINTANA 523676
    wTotalizadorTempoCalc := wTotalizadorTempoCalc + wTempoCalc;
    wTotalizadorTempoSimples := wTotalizadorTempoSimples + wTempoSimples;
//Fim -  Pendência   : SOL 37791  KINTANA 523676

// andre tavares - 08/01/2004 - coloquei a condição bSimula para não gravar simulações
    try
     { Guarda Tempo de Contribuicao em Dias }

      if bsimula then
         ExecSql(' UPDATE HISTFUNCPREV SET '+
                 '   TEMPOCALC        = '+IntToStr(wTempoCalc)         +', '+
                 '   TEMPOSIMPLES     = '+IntToStr(wTempoSimples)      +', '+
                 '   TEMPOCALCINSALUB = '+IntToStr(wTempoAcrecimo)     +', '+
                 '   FLGCONCOMITANTE  = '+IntToStr(wFlgConcomitante)   +', '+
                 '   DATAFINAL        = TO_DATE('+ quotedStr(cdsLocal2.FieldByName('DATAFINAL').AsString)  +', ''DD/MM/YYYY'')'+
                 ' WHERE IDPESSOA     = '+ cdsLocal2.FieldByName('IDPESSOA').AsString + ' AND ' +
                 '       SEQHISTFUNC  = '+ cdsLocal2.FieldByName('SEQHISTFUNC').AsString)
      else
         ExecSql(' UPDATE HISTFUNCPREV SET '+
                 '   TEMPOCALC        = '+IntToStr(wTempoCalc)         +', '+
                 '   TEMPOSIMPLES     = '+IntToStr(wTempoSimples)      +', '+
                 '   TEMPOCALCINSALUB = '+IntToStr(wTempoAcrecimo)     +', '+
                 '   FLGCONCOMITANTE  = '+IntToStr(wFlgConcomitante)   +
                 ' WHERE IDPESSOA     = '+ cdsLocal2.FieldByName('IDPESSOA').AsString + ' AND ' +
                 '       SEQHISTFUNC  = '+ cdsLocal2.FieldByName('SEQHISTFUNC').AsString);

    except
     On E:Exception Do
     Begin
// andre tavares - 08/01/2004 - coloquei a condição bSimula para não gravar simulações
       MessageInfo := 'Erro ao gravar o Tempo de Contribuição, Pessoa ('+IntToStr(IdPessoa)+') '+#13+
                      'com a mensagem '+E.Message;
     End;
    end;
// andre tavares - 08/01/2004 - coloquei a condição bSimula para não gravar simulações
    cdsLocal2.Next;
  end; //while

  try
    try
      decodeDate(dataCorrente, ano, mes, dia);
      CdsLocal.Close;

      CdsLocal.Data := BuscaTempoServico(idpessoa, intToStr(ano) + '/' + intToStr(mes) + '/' + intToStr(dia), AConsiderarRegistrosAnteriores);
      cdsLocal.LogChanges := false;

      CdsLocalAux.Close;
      CdsLocalAux.Data := CopyClientDataSet(CdsLocal);


      CdsLocalAux.First;
     // escrever tempos de servicos por extenso
      if not CdsLocalAux.EOF Then
      Begin
        wTempoIndiv := 0;
        CdsLocalAux.Edit;
        CdsLocalAux.FieldByName('TEMPOSERVCALC').asString      := intToStr(TempoTotal);
        CdsLocalAux.FieldByName('TEMPOSEMCONVERSAO').asInteger := TempoTotalSimples;
        CdsLocalAux.FieldByName('TEMPOCALC').asInteger         := 0;

        // inicio andre tavares 09/003/2004 - tempo simulado
        CdsLocalAux.FieldByName('TEMPOSERVCALCSIMULA').asString := intToStr(TempoTotalSimulado);
        CdsLocalAux.FieldByName('TEMPOSEMCONVSIMULA').asInteger := TempoTotalSimplesSimulado;

        if trim(sDataMax) <> '' then
          CdsLocalAux.FieldByName('DATAREF').asString := sDataMax
        else
          CdsLocalAux.FieldByName('DATAREF').asString := DateTostr(DataCorrente);

        CdsLocalAux.FieldByName('DATAREFSIMULA').asString := DateTostr(Data);
        // fim andre tavares 09/003/2004 - tempo simulado

        CdsLocalAux.Post;

        sTempoTotal        := TempoExtenso(CdsLocalAux.FieldByName('TEMPOSERVCALC').AsInteger);
        sTempoSemConversao := TempoExtenso(CdsLocalAux.FieldByName('TEMPOSEMCONVERSAO').AsInteger);

        // inicio andre tavares 09/003/2004 - tempo simulado
        sTempoTotalSimulado        := TempoExtenso(CdsLocalAux.FieldByName('TEMPOSERVCALCSIMULA').AsInteger);
        sTempoSemConversaoSimulado := TempoExtenso(CdsLocalAux.FieldByName('TEMPOSEMCONVSIMULA').AsInteger);
        // fim andre tavares 09/003/2004 - tempo simulado

// andre tavares - 08/01/2004 - coloquei a condição bSimula para não gravar simulações
        try

         ExecSql(' UPDATE ELEGPATRO SET TEMPOSERVCALC    = ' +CdsLocalAux.FieldByName('TEMPOSERVCALC').AsString +', '+
                 '                      TEMPOSIMPLES     = ' +CdsLocalAux.FieldByName('TEMPOSEMCONVERSAO').AsString +', '+
                 '                      TEMPOSITESPECIAL = ' + intToStr(CdsLocalAux.FieldByName('TEMPOSERVCALC').asInteger -
                                                                        CdsLocalAux.FieldByName('TEMPOSEMCONVERSAO').asInteger) +' '+
                 ' WHERE IDPESSOA = ' + CdsLocalAux.FieldByName('IDPESSOA').AsString);

         except
         On E:Exception Do
          Begin
// andre tavares - 08/01/2004 - coloquei a condição bSimula para não gravar simulações
            MessageInfo := 'Erro ao gravar o Tempo de Contribuição, Pessoa ('+IntToStr(IdPessoa)+') '+#13+
                           'com a mensagem '+E.Message;
          End;
         end;

        while not CdsLocalAux.EOF Do
        begin
          CdsLocalAux.Edit;

          // fim - ANDRÉ TAVARES - pendência 15922

          CdsLocalAux.FieldByName('TEMPOTOTALEXT').AsString         := sTempoTotal;
          CdsLocalAux.FieldByName('TEMPOSEMCONVERSAOEXT').AsString  := sTempoSemConversao;

        // inicio andre tavares 09/003/2004 - tempo simulado
          CdsLocalAux.FieldByName('TEMPOTOTALEXTSIMULA').AsString         := sTempoTotalSimulado;
          CdsLocalAux.FieldByName('TEMPOSEMCONVERSAOEXTSIMULA').AsString  := sTempoSemConversaoSimulado;

          CdsLocalAux.FieldByName('TEMPOSERVCALCSIMULA').asString := intToStr(TempoTotalSimulado);
          CdsLocalAux.FieldByName('TEMPOSEMCONVSIMULA').asInteger := TempoTotalSimplesSimulado;

          // 06/04/2004
          CdsLocalAux.FieldByName('TEMPOSERVCALC').asInteger       := TempoTotal;
          CdsLocalAux.FieldByName('TEMPOSEMCONVERSAO').asInteger   := TempoTotalSimples;
          CdsLocalAux.FieldByName('TEMPOSERVCALCSIMULA').asInteger := TempoTotalSimulado;
          CdsLocalAux.FieldByName('TEMPOSEMCONVSIMULA').asInteger  := TempoTotalSimplesSimulado;


          if trim(sDataMax) <> '' then
            CdsLocalAux.FieldByName('DATAREF').asString := sDataMax
          else
            CdsLocalAux.FieldByName('DATAREF').asString := DateTostr(DataCorrente);
          CdsLocalAux.FieldByName('DATAREFSIMULA').asString := DateTostr(Data);

        // FIM andre tavares 09/003/2004 - tempo simulado


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
                                          formatDateTime('dd/mm/yyyy', DataCorrente));

          CdsLocalAux.FieldByName('TEMPOINDIVEXT').AsString    := TempoExtenso(wTempoIndiv);
          CdsLocalAux.FieldByName('TEMPOCALC').asInteger       := wTempoIndiv;
          CdsLocalAux.Post;
         // andre tavares - 08/01/2004 - coloquei a condição bSimula para não gravar simulações
          try

         { Guarda Tempo de Contribuicao em Dias }
           ExecSql(' UPDATE HISTFUNCPREV SET '+
                   '   TEMPOCALC        = '+CdsLocalAux.FieldByName('TEMPOCALC').asString    +', '+
                   '   TEMPOSIMPLES     = '+intToStr(wTempoIndiv)+', '+
                   '   FLGCONCOMITANTE  = '+CdsLocalAux.FieldByName('FLGCONCOMITANTE').asString   +
                   ' WHERE IDPESSOA     = '+CdsLocalAux.FieldByName('IDPESSOA').AsString + ' AND '+
                   '       SEQHISTFUNC  = '+CdsLocalAux.FieldByName('SEQHISTFUNC').AsString);
          except
          On E:Exception Do
            begin
            // andre tavares - 08/01/2004 - coloquei a condição bSimula para não gravar simulações
               MessageInfo := 'Erro ao gravar o Tempo de Contribuição, Pessoa ('+IntToStr(IdPessoa)+') '+#13+
                            'com a mensagem '+E.Message;
            end;
          end;
          // andre tavares - 08/01/2004 - coloquei a condição bSimula para não gravar simulações
         CdsLocalAux.Next;
        end; // while
      end; // if

//Inicio -  Pendência   : SOL 37791  KINTANA 523676
      sTotalizadorTempoCalc := TempoExtenso(wTotalizadorTempoCalc);
      sTotalizadorTempoSimples := TempoExtenso(wTotalizadorTempoSimples);
      FTotalizadorTempoCalc  := wTotalizadorTempoCalc;
      FTotalizadorTempoSimples := wTotalizadorTempoSimples;
      FTotalizadorTempoCalcExt := sTotalizadorTempoCalc;
      FTotalizadorTempoSimplesExt := sTotalizadorTempoSimples;
//Fim -  Pendência   : SOL 37791  KINTANA 523676

      //INÍCIO - andre tavares - 08/03/2004
      // devolve a data nula

//Inicio : Pendência: SOL 37791  KINTANA 523676
      if not(AConsiderarRegistrosAnteriores) then
      begin
        for i := 0 to length(iSeqHist)-1 do
        begin
          if (cdsLocalAux.Locate('SEQHISTFUNC', IntToStr(iSeqHist[i]), [])) Then
          begin
            cdsLocalAux.Edit;
            cdsLocalAux.FieldByName('DATAFINAL').Clear;
            cdsLocalAux.Post;
          end;
        end;
      end
      else
      begin
        cdsLocalAux.First;
        try
          while not(cdsLocalAux.Eof) do
          begin
            if (cdsLocalAux.FieldByName('TIPOSIT').AsString = 'A') then
            begin
              cdsLocalAux.Edit;
              cdsLocalAux.FieldByName('DATAFINAL').Clear;
              cdsLocalAux.Post;
            end;
            cdsLocalAux.Next;
          end;
        finally
          cdsLocalAux.First;
        end;
      end;
//Termino : Pendência: SOL 37791  KINTANA 523676

      CdsLocalAux.Data := CopyClientDataSet(CdsLocalAux);
      // andre tavares - 08/01/2004 - coloquei a condição bSimula para não gravar simulações
      if (not bSimula) and (not ContaTempoManut) Then
        commit
      else
        RollBack;

    except on e : Exception do
      begin
        MessageInfo := e.Message;
      // andre tavares - 08/01/2004 - coloquei a condição bSimula para não gravar simulações
        RollBack;
      end;
    end;
  finally
    CdsLocal.Close;
    CdsLocal.Data := cdsLocalAux.Data;
    result := CdsLocal.Data;
    CdsLocal.Free;
    CdsLocal2.Free;
    CdsLocalAux.Free;
    cdsLocalSimula.Free;
  end;
end;

//Indica se há uma transação em andamento
function TCtrlTempoServico.InTransaction: boolean;
begin
  if DbConnectionType = cntBDE then
    Result := DataBase.InTransaction
  else
    Result := DbAdoConnection.InTransaction;
end;



constructor TCtrlTempoServico.Create;
begin
 inherited;
 //Inicio -  Pendência   : SOL 37791  KINTANA 523676
 FTotalizadorTempoCalc := 0;
 FTotalizadorTempoSimples := 0;
 FTotalizadorTempoCalcExt := EmptyStr;
 FTotalizadorTempoSimplesExt := EmptyStr;
 //Inicio -  Pendência   : SOL 37791  KINTANA 523676

end;

// verifica se há alguma data em aberto
function TCtrlTempoServico.TemTempoAberto(idpessoa : integer): Boolean;
var cdsLocal : TcmClientDataSet;
begin
    cdsLocal := TcmClientDataSet.Create(nil);
    cdsLocal.Data := GetDataPacket(' SELECT SEQHISTFUNC FROM HISTFUNCPREV WHERE IDPESSOA = '+ IntToStr(IdPessoa) +
                                   ' AND DATAFINAL IS NULL ');
    result := not cdsLocal.IsEmpty;
    cdsLocal.Free;
end;


// para não deixar entrar com data inválida
function TCtrlTempoServico.validaDataEntrada(pIdPessoa: Integer; pdata, pDataManut : tDateTime): integer;
var cdsLocal: TcmClientDataset;
begin
  result := 0;
  cdsLocal := TcmClientDataSet.Create(nil);
  try
    cdsLocal.Close;
    cdsLocal.Data := GetDataPacket('SELECT IDPESSOA, DATAINICIO, DATAFINAL, FLGTEMPOMANUT FROM HISTFUNCPREV '+
                                   ' WHERE IDPESSOA = '+ intToStr(pidPessoa) +'  AND NVL(FLGTEMPOMANUT, 0) = 0 ');
    cdsLocal.first;
    while not cdsLocal.eof do
    begin
      if (pData > 0) and (pData < cdsLocal.fieldByName('DATAINICIO').asDateTime) and
         (not cdsLocal.fieldByName('DATAINICIO').isNull) and
         (cdsLocal.fieldByName('FLGTEMPOMANUT').asInteger = 0) then
      begin
        result := 1;
        exit;
      end;
      if (pDataManut > 0) and (pDataManut < cdsLocal.fieldByName('DATAINICIO').asDateTime) and
         (not cdsLocal.fieldByName('DATAINICIO').isNull) and
         (cdsLocal.fieldByName('FLGTEMPOMANUT').asInteger = 1) then
      begin
        result := 2;
        exit;
      end;
      cdsLocal.Next;
    end;
    cdsLocal.Close;
    cdsLocal.Data := GetDataPacket('SELECT IDPESSOA, DATAINICIO, DATAFINAL, FLGTEMPOMANUT FROM HISTFUNCPREV '+
                                   ' WHERE IDPESSOA = '+ intToStr(pidPessoa) +' AND DATAFINAL IS NULL AND NVL(FLGTEMPOMANUT, 0) <> 1');
    if cdsLocal.IsEmpty then
    begin
      result := 3;
      exit;
    end;

    cdsLocal.Close;
    cdsLocal.Data := GetDataPacket('SELECT IDPESSOA, DATAINICIO, DATAFINAL, FLGTEMPOMANUT FROM HISTFUNCPREV '+
                                   ' WHERE IDPESSOA = '+ intToStr(pidPessoa) +' AND DATAFINAL IS NULL ');
    cdsLocal.First;
    while not cdsLocal.Eof do
    begin
      if (cdsLocal.fieldByName('FLGTEMPOMANUT').asInteger = 1) and
         (not cdsLocal.fieldByName('DATAFINAL').isnull) then
      begin
        result := 4;
        exit;
      end;
      cdsLocal.next;
    end;

  finally
    cdsLocal.free;
  end;
end;

//Darivaldo Alencar SIG37689 -inicio
function TCtrlTempoServico.BuscaTemposServico(IdPessoa,iIdBusca: Integer): Integer;
var cdsLocal: TcmClientDataset;
begin
  result := 0;
  try
    cdsLocal := TcmClientDataSet.Create(nil);
    cdsLocal.Data := GetDataPacket('SELECT TEMPOSERVTOTAL,TEMPOSERVTOTMES, TEMPOSERVTOTDIA ' +
                                   'FROM ELEGPATRO WHERE IDPESSOA =' + IntToStr(IdPessoa));
    result:= cdsLocal.fields[iIdBusca].asInteger;
  finally
    FreeAndNil(cdsLocal);
  end;
end;
//Darivaldo Alencar SIG37689 -fim

end.







