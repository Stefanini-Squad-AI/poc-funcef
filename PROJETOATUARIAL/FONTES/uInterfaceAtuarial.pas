// *************************************************************************************************
//                                   REGISTRO DE ALTERAÇÕES
// *************************************************************************************************
// Data        : 10.11.2003
// Responsável : Camille
// Pendencia   : 15487
// Alteração   : Alteração na rotina VoltaValorCotacao para buscar ultima cota encontrada, caso
//               não encontre na data desejada
// -------------------------------------------------------------------------------------------------
unit uInterfaceAtuarial;

interface

uses uFuncGerais, dBaseDados, dInterfaceAtuarial, dImportaTotalPrev, uGlobal,
    Wwquery, Wwdatsrc, SysUtils, Classes, Dialogs, DB, DBTables;


  procedure ConverteDias(iQtdDias: Integer; var wAnos: Word; var wMeses: Word; var wDias: Word);
  procedure InsereValorParticipante(iPartic, iTipoValor: Integer; eValor: Extended);
  procedure InsereTempoParticipante(iPartic, iTipoTempo: Integer; dData: TDateTime);
  function ExecutaRegraNumerica(sNumRegra, sSQL: String; var bErro: Boolean): String;
  function ExecutaRegraTempo(sNumRegra, sSQL: String; var bErro: Boolean): String;
  function CalcularValor(iTipo: Integer; var sNumRegra: String): Boolean;
  function CalcularTempo(iTipo: Integer; var sNumRegra: String): Boolean;
  function ImportaValor(iTipo: Integer): Boolean;
  function ImportaTempo(iTipo: Integer): Boolean;


  procedure InsereTempoRegra(iCD_TIPO, iEntid: Integer);
  procedure InsereValorRegra(iCD_TIPO, iEntid: Integer);
  procedure CalculaValores(iPlano, iPartic: Integer);
  function Garantia(iGarIdpessoa, iGarIdPessjur, iGarIdPlanoprev, iGarSeqProposta: Integer): Double;  // by Alexandre - 09/09/2000
  function RegraSRB(iPlano: Integer): String;
  procedure VerifIndiceHist(qryaux: TwwQuery; var sIndice: String;
      sIdPLanoPrev, sIdTipoReserva: String; sDataCota: String);
  function VoltaValorCotacao(qryaux: TwwQuery; sIndiceReajuste, sIdPlanoPrev,
      sIdTipoReserva, sDataMov: String): Double;



var
  bHouveErro: Boolean;
  qTempo: TList;
  rTempo: TTempo;


implementation

procedure CalculaValores(iPlano, iPartic: Integer);
var
  sSQL, sNumRegra, sSalMedio, sIDRegraSRB: String;
  dSldContaAss, dSldContribPart, dSldContribPatro, dSldTransfPart,
      dSldTransfPatro, dGarantia: Double;
  bErro: Boolean;
begin
  dSldContaAss     := 0;
  dSldContribPart  := 0;
  dSldContribPatro := 0;
  dSldTransfPart   := 0;
  dSldTransfPatro  := 0;

// Busca Participante/Assistido
  With DtmInterfaceAtuarial do
  begin
    qryPartAss.Close;
    qryPartAss.SQL[15] := '  '; 
    qryPartAss.SQL[42] := '  '; 
    qryPartAss.ParamByName('IDPESSOA').asInteger := iPartic;
    qryPartAss.Open;

    if qryPartAss.isEmpty then
      Exit;

    Try
      While not qryPartAss.Eof do
      begin
        qryPartAss.Last;
//------------------------------------------------------------------------------------
//                            Executar regra de Salario Médio
//------------------------------------------------------------------------------------
        dtmImportaTotalPrev.qryRegra.Close;
        dtmImportaTotalPrev.qryRegra.ParamByName('ANOMES').asString := FormatDateTime('yyyy/mm', WG_DT_REFER_BASE);
        dtmImportaTotalPrev.qryRegra.ParamByName('DATA').asDateTime := WG_DT_REFER_BASE;
        dtmImportaTotalPrev.qryRegra.ParamByName('IDPESSJUR').asInteger :=
            qryPartAss.FieldByName('IdPessJur').asInteger;
        dtmImportaTotalPrev.qryRegra.ParamByName('IDPLANOPREV').asInteger := iPlano;
        dtmImportaTotalPrev.qryRegra.ParamByName('IDPESSOA').asInteger :=
            qryPartAss.FieldByName('IdPessoa').asInteger;

        sIDRegraSRB := RegraSRB(iPlano);
        if sIDRegraSRB <> '' then
        begin
          Try
             sSalMedio := ExecutaRegraNumerica(sIDRegraSRB, sSQL, bErro);
          Except
             sSalMedio := '0';
          End;

          if bErro = True then
          begin
            MessageDlg('A Regra de Cálculo de Salário Médio - nº ' + sIDRegraSRB + ' - ' +
                   ' retornou um valor inválido = ' + sSalMedio,
                   mtError, [mbOk], 0);
            Exit;
          end;
        end; //if

        // Reserva
        With qryReserva do
        begin
          Close;
          ParamByName('ANOMES').asString       := FormatDateTime('yyyy/mm', WG_DT_REFER_BASE);
          ParamByName('IDPESSOA').AsInteger    := qryPartAss.FieldByName('IDPESSOA').AsInteger;
          ParamByName('IDPESSJUR').AsInteger   := qryPartAss.FieldByName('IDPESSJUR').AsInteger;
          ParamByName('IDPLANOPREV').AsInteger := iPlano;
          ParamByName('SEQPROPOSTA').AsInteger := qryPartAss.FieldByName('SEQPROPOSTA').AsInteger;
          Open;

          While not Eof do
          begin
            // Assistido
            if qryPartAss.FieldByName('FlgInterno').AsString = 'AS' then
               if (FieldByName('FLGCONTROLE').AsInteger = 0)
                   and (FieldByName('FLGTRANSFERENCIA').AsInteger = 0)
                   and (FieldByName('FLGTITULARCOLET').AsString = 'T') then
                 dSldContaAss := dSldContaAss + (FieldByName('VALORRESERVA').asFloat *
                     VoltaValorCotacao(qryAux,
                     qryReserva.FieldByName('INDICEREAJUSTE').asString,
                     IntToStr(iPlano),
                     qryReserva.FieldByName('IDTIPORESERVA').asString,
                     FormatDateTime('dd/mm/yyyy', WG_DT_REFER_BASE)));

            // Ativo ou Mantido
            if (qryPartAss.FieldByName('FlgInterno').AsString = 'AT') or
               (qryPartAss.FieldByName('FlgInterno').AsString = 'MA') then
            begin
              // Saldo da Conta de Contribuição do Participante
              if (FieldByName('FLGCONTROLE').AsInteger = 0) and
                 (FieldByName('FLGTRANSFERENCIA').AsInteger = 0) and
                 (FieldByName('FLGTITULARCOLET').AsString = 'T') then
                 dSldContribPart := dSldContribPart + (FieldByName('VALORRESERVA').asFloat *
                     VoltaValorCotacao(qryAux,
                     qryReserva.FieldByName('INDICEREAJUSTE').asString,
                     IntToStr(iPlano),
                     qryReserva.FieldByName('IDTIPORESERVA').asString,
                     FormatDateTime('dd/mm/yyyy', WG_DT_REFER_BASE)))

              // Saldo da Conta de Contribuição da Patrocinadora
              else if (FieldByName('FLGCONTROLE').AsInteger = 0) and
                      (FieldByName('FLGTRANSFERENCIA').AsInteger = 0) and
                      (FieldByName('FLGTITULARCOLET').AsString = 'P') then
                      dSldContribPatro := dSldContribPatro + (FieldByName('VALORRESERVA').asFloat *
                          VoltaValorCotacao(qryAux,
                          qryReserva.FieldByName('INDICEREAJUSTE').asString,
                          IntToStr(iPlano),
                          qryReserva.FieldByName('IDTIPORESERVA').asString,
                          FormatDateTime('dd/mm/yyyy', WG_DT_REFER_BASE)))

              // Saldo da Conta de Transferência do Participante
              else if (FieldByName('FLGCONTROLE').AsInteger = 0) and
                      (FieldByName('FLGTRANSFERENCIA').AsInteger = 1) and
                      (FieldByName('FLGTITULARCOLET').AsString = 'T') then
                      dSldTransfPart := dSldTransfPart + (FieldByName('VALORRESERVA').asFloat *
                          VoltaValorCotacao(qryAux,
                          qryReserva.FieldByName('INDICEREAJUSTE').asString,
                          IntToStr(iPlano),
                          qryReserva.FieldByName('IDTIPORESERVA').asString,
                          FormatDateTime('dd/mm/yyyy', WG_DT_REFER_BASE)))

              // Saldo da Conta de Transferência da Patrocinadora
              else if (FieldByName('FLGCONTROLE').AsInteger = 0) and
                      (FieldByName('FLGTRANSFERENCIA').AsInteger = 1) and
                      (FieldByName('FLGTITULARCOLET').AsString = 'P') then
                      dSldTransfPatro := dSldTransfPatro + (FieldByName('VALORRESERVA').asFloat *
                          VoltaValorCotacao(qryAux,
                          qryReserva.FieldByName('INDICEREAJUSTE').asString,
                          IntToStr(iPlano),
                          qryReserva.FieldByName('IDTIPORESERVA').asString,
                          FormatDateTime('dd/mm/yyyy', WG_DT_REFER_BASE)));
            end; //if

            Next;
          end; //while
        end; //with


        // Garantia
        dGarantia := Garantia(qryPartAss.FieldByName('IDPESSOA').AsInteger,
                              qryPartAss.FieldByName('IDPESSJUR').AsInteger,
                              iPlano,
                              qryPartAss.FieldByName('SEQPROPOSTA').AsInteger);

        if (dSldContaAss <> 0) and (ImportaValor(4)) then
         begin
           if CalcularValor(4, sNumRegra) then
            begin
              ExecutaRegraNumerica(sNumRegra, sSQL, bErro);
              if bErro then
                InsereValorParticipante(iPartic, 4, dSldContaAss);
            end
           else
             InsereValorParticipante(iPartic, 4, dSldContaAss);
         end;

        if (Trim(sSalMedio) <> '') and (ImportaValor(5)) then
         begin
           InsereValorParticipante(iPartic, 5, StrToFloat(sSalMedio));
         end;

        if (dSldContribPart <> 0) and (ImportaValor(6)) then
         begin
           if CalcularValor(6, sNumRegra) then
            begin
              ExecutaRegraNumerica(sNumRegra, sSQL, bErro);
              if bErro then
                InsereValorParticipante(iPartic, 6, dSldContribPart);
            end
           else
             InsereValorParticipante(iPartic, 6, dSldContribPart);
         end;


        if (dSldContribPatro <> 0) and (ImportaValor(7)) then
         begin
           if CalcularValor(7, sNumRegra) then
            begin
              ExecutaRegraNumerica(sNumRegra, sSQL, bErro);
              if bErro then
                InsereValorParticipante(iPartic, 7, dSldContribPatro);
            end
           else
             InsereValorParticipante(iPartic, 7, dSldContribPatro);
         end;

        if (dSldTransfPart <> 0) and (ImportaValor(8)) then
         begin
           if CalcularValor(8, sNumRegra) then
            begin
              ExecutaRegraNumerica(sNumRegra, sSQL, bErro);
              if bErro then
                InsereValorParticipante(iPartic, 8, dSldTransfPart);
            end
           else
             InsereValorParticipante(iPartic, 8, dSldTransfPart);
         end;

        if (dSldTransfPatro <> 0) and (ImportaValor(9)) then
         begin
           if CalcularValor(9, sNumRegra) then
            begin
              ExecutaRegraNumerica(sNumRegra, sSQL, bErro);
              if bErro then
                InsereValorParticipante(iPartic, 9, dSldTransfPatro);
            end
           else
             InsereValorParticipante(iPartic, 9, dSldTransfPatro);
         end;

        if (dGarantia <> 0) and (ImportaValor(10)) then
         begin
           if CalcularValor(10, sNumRegra) then
            begin
              ExecutaRegraNumerica(sNumRegra, sSQL, bErro);
              if bErro then
                InsereValorParticipante(iPartic, 10, dGarantia);
            end
           else
             InsereValorParticipante(iPartic, 10, dGarantia);
         end;


        dSldContaAss     := 0;
        dSldContribPart  := 0;
        dSldContribPatro := 0;
        dSldTransfPart   := 0;
        dSldTransfPatro  := 0;
        qryPartAss.Next;
      end; //while

    Except on E: Exception do
     begin
       bHouveErro := True;
       MessageDlg('Houve erro durante a importação:' + #13#10 + E.Message, mtError, [mbOk], 0);
     end;
    End; //Try-Except-End;
  end; //with
end;

function Garantia(iGarIdpessoa, iGarIdPessjur, iGarIdPlanoprev, iGarSeqProposta: Integer): Double;  // by Alexandre - 09/09/2000
var
   dResGarantia : double;
begin
   dResGarantia := 0;

   With DtmInterfaceAtuarial.qryGarantia do
   begin
     Close;
     ParamByName('ANOMES').asString       := FormatDateTime('yyyy/mm', WG_DT_REFER_BASE);
     ParamByName('IDPESSOA').AsInteger    := iGarIdPessoa;
     ParamByName('IDPESSJUR').AsInteger   := iGarIdPessJur;
     ParamByName('IDPLANOPREV').AsInteger := iGarIdPlanoPrev;
     ParamByName('SEQPROPOSTA').AsInteger := iGarSeqProposta;
     Open;

     While not eof do
     begin
       dResGarantia := dResGarantia + (FieldByName('VALORRESERVA').AsFloat *
           VoltaValorCotacao(DtmInterfaceAtuarial.qryAux,
           FieldByName('INDICEREAJUSTE').asString,
           IntToStr(iGarIdPlanoprev),
           DtmInterfaceAtuarial.qryReserva.FieldByName('IDTIPORESERVA').asString,
           FormatDateTime('dd/mm/yyyy', WG_DT_REFER_BASE)));
       Next;
     end;
   end;

   Garantia := dResGarantia;
end;

function RegraSRB(iPlano: Integer): String;
begin
  with DtmInterfaceAtuarial.qryIdRegraSRB do
   begin
     Close;
     ParamByName('IDPLANOPREV').asInteger := iPlano;
     Open;

     if isEmpty then
       Result := ''
     else
       Result := FieldByName('IDRGSALMEDIOATU').asString;
   end;
end;

procedure VerifIndiceHist(qryaux: TwwQuery; var sIndice: String;
    sIdPLanoPrev, sIdTipoReserva: String; sDataCota: String);
begin
  //verifica histórico de índices de reservas
  //para o mês informado
  //vai pegar a última moeda cadastrada
  qryaux.Close;
  qryaux.SQL.Clear;
  qryaux.SQL.Add(' SELECT  INDICEREAJUSTE '+
                 ' FROM HISTINDICERESERVA '+
                 ' WHERE '+
                 ' IDPLANOPREV = '''+sIdPLanoPrev+''' AND '+
                 ' IDTIPORESERVA = '''+sIdTipoReserva+''' AND '+
                 ' TO_DATE(TO_CHAR(DATAFIM,''DD/MM/YYYY''),''DD/MM/YYYY'')  '+
                 ' >= TO_DATE('''+sDataCota+''',''DD/MM/YYYY'') '+
                 ' ORDER BY DATAFIM DESC ');
  Try
    qryaux.Open;
  Except
    Exit;
  End;
  //se houver algum registro, quer dizer que já houve
  //mudança no cadastro de índice
  //então pego o primeiro registro e troco o id da função
  if not qryaux.isempty then
    sIndice := qryaux.fieldbyname('INDICEREAJUSTE').AsString;
end;

function VoltaValorCotacao(qryaux: Twwquery; sIndiceReajuste, sIdPlanoPrev,
    sIdTipoReserva, sDataMov: String): Double;
var
  cAux: char ;
  stipoMoeda: String;
begin
  Result := 0;
  if Trim(sIndiceReajuste) = '' then
    Exit;
    

  VerifIndiceHist(qryaux, sIndiceReajuste, sIdPlanoPrev, sIdTipoReserva, sDataMov);

  //transformar o número de cotas da reserva em moeda
  qryaux.Close;
  qryaux.SQL.Clear;
  qryaux.SQL.Add('SELECT  MOEPERIODICIDADE '+
                ' FROM MOEDA '+
                ' WHERE MOECODIGO = '+sIndiceReajuste+' ');
  Try
   qryaux.Open;
  Except
   Result := 0;
   Exit;
  End;
  
  if qryaux.IsEmpty then
  begin
    Result := 0;
    Exit;
  end;
   
  sTipoMoeda := qryAux.FieldByName('MOEPERIODICIDADE').AsString;
  qryaux.Close;
  qryaux.SQL.Clear;
  
  if sTipoMoeda = 'M' Then
  begin
    qryaux.SQL.add('SELECT  COTVALOR                         '+
                   ' FROM COTACAOMOEDA                       '+
                   ' WHERE MOECODIGO = '+sIndiceReajuste      +
                   ' AND COTDATA IN                          '+
                   ' (SELECT MAX(COTDATA) FROM COTACAOMOEDA  '+
                   '  WHERE  MOECODIGO = '+sIndicereajuste      +
                   '  AND    SUBSTR(COTMESREF,3,4)||SUBSTR(COTMESREF,1,2) <= '''+copy(sDataMov,7,4)+copy(sDataMov,4,2)+''') '); // CAMILLE - 10.11.2003
  end
  else begin
    qryaux.SQL.add('SELECT  COTVALOR '+
                   ' FROM COTACAOMOEDA '+
                   ' WHERE MOECODIGO = '+sIndiceReajuste+' '+
                   ' AND COTDATA IN '+
                   ' (SELECT MAX(COTDATA) FROM COTACAOMOEDA '+
                   '  WHERE MOECODIGO = '+sIndicereajuste+' '+
                   '  AND COTDATA     <= TO_DATE(''' + sDataMov +''',''DD/MM/YYYY'')) '); // CAMILLE - 10.11.2003
  end;
  
  Try
    qryaux.Open;
  Except
   Result := 0;
   Exit;
  End;
  
  if qryaux.IsEmpty then
  begin
    //erro - não encontrou cotacao para moeda
    Result := 0;
    Exit;
  end
  else
  begin
    cAux := DecimalSeparator;
    DecimalSeparator := '.';
    Result := StrToFloat(FormatFloat('0.00000000', qryaux.FieldByName('COTVALOR').asFloat)); //leorefer - 0901 - mudei de 6 para 8
    DecimalSeparator := cAux;
  end;
end;

procedure InsereTempoRegra(iCD_TIPO, iEntid: Integer);
begin
  with DtmImportaTotalPrev do
   begin
     Try
       qryInsTempoRegra.ParamByName('CD_TIPO_TEMPO').asInteger := iCD_TIPO;
       qryInsTempoRegra.ParamByName('CD_PESSOA_ENTID').asInteger := iEntid;
       qryInsTempoRegra.ParamByName('IR_IMPORTA').asString := 'S';
       qryInsTempoRegra.ExecSQL;
     Except
       qryUpdTempoRegra.ParamByName('CD_TIPO_TEMPO').asInteger := iCD_TIPO;
       qryUpdTempoRegra.ParamByName('CD_PESSOA_ENTID').asInteger := iEntid;
       qryUpdTempoRegra.ParamByName('IR_IMPORTA').asString := 'S';
       qryUpdTempoRegra.ExecSQL;
     End;
   end;
end;

procedure InsereValorRegra(iCD_TIPO, iEntid: Integer);
begin
  with DtmImportaTotalPrev do
   begin
     Try
       qryInsValorRegra.ParamByName('CD_TIPO_VALOR').asInteger := iCD_TIPO;
       qryInsValorRegra.ParamByName('CD_PESSOA_ENTID').asInteger := iEntid;
       qryInsValorRegra.ParamByName('IR_IMPORTA').asString := 'S';
       qryInsValorRegra.ExecSQL;
     Except
       qryUpdValorRegra.ParamByName('CD_TIPO_VALOR').asInteger := iCD_TIPO;
       qryUpdValorRegra.ParamByName('CD_PESSOA_ENTID').asInteger := iEntid;
       qryUpdValorRegra.ParamByName('IR_IMPORTA').asString := 'S';
       qryUpdValorRegra.ExecSQL;
     End;
   end;
end;

function CalcularValor(iTipo: Integer; var sNumRegra: String): Boolean;
begin
  with DtmImportaTotalPrev.QryVerifValorRegra do
   begin
     Try
       Close;
       ParamByname('CD_TIPO_VALOR').asInteger := iTipo;
       Open;
       sNumRegra := FieldByName('IDREGRA').asString;
       Result := (Trim(sNumRegra) <> '');
     Finally
       Close;
     End;
   end;
end;

function CalcularTempo(iTipo: Integer; var sNumRegra: String): Boolean;
begin
  with DtmImportaTotalPrev.QryVerifTempoRegra do
   begin
     Try
       Close;
       ParamByname('CD_TIPO_TEMPO').asInteger := iTipo;
       Open;
       sNumRegra := FieldByName('IDREGRA').asString;
       Result := (Trim(sNumRegra) <> '');
     Finally
       Close;
     End;
   end;
end;

function ImportaValor(iTipo: Integer): Boolean;
begin
  with DtmImportaTotalPrev.QryVerifValorRegra do
   begin
     Try
       Close;
       ParamByname('CD_TIPO_VALOR').asInteger := iTipo;
       Open;
       Result := (Trim(FieldByName('IR_IMPORTA').asString) = 'S');
     Finally
       Close;
     End;
   end;
end;

function ImportaTempo(iTipo: Integer): Boolean;
begin
  with DtmImportaTotalPrev.QryVerifTempoRegra do
   begin
     Try
       Close;
       ParamByname('CD_TIPO_TEMPO').asInteger := iTipo;
       Open;
       Result := (Trim(FieldByName('IR_IMPORTA').asString) = 'S');
     Finally
       Close;
     End;
   end;
end;

procedure InsereValorParticipante(iPartic, iTipoValor: Integer; eValor: Extended);
begin
  if eValor = 0 then
    Exit;

  with DtmImportaTotalPrev do
   begin
     Try
       qryInsValorParticipante.ParamByName('CD_PARTIC').asInteger := iPartic;
       qryInsValorParticipante.ParamByName('CD_TIPO_VALOR').asInteger := iTipoValor;
       qryInsValorParticipante.ParamByName('CD_VERSAO').asInteger := WG_CD_VERSAO;
       qryInsValorParticipante.ParamByName('VL_PARTICIPANTE').asFloat := eValor;
       qryInsValorParticipante.ExecSQL;
     Except
       qryUpdValorParticipante.ParamByName('CD_PARTIC').asInteger := iPartic;
       qryUpdValorParticipante.ParamByName('CD_TIPO_VALOR').asInteger := iTipoValor;
       qryUpdValorParticipante.ParamByName('CD_VERSAO').asInteger := WG_CD_VERSAO;
       qryUpdValorParticipante.ParamByName('VL_PARTICIPANTE').asFloat := eValor;
       qryUpdValorParticipante.ExecSQL;
     End;
   end; //with
end;

procedure InsereTempoParticipante(iPartic, iTipoTempo: Integer; dData: TDateTime);
var
  wAnos, wMeses, wDias: Word;
begin
  if dData = 0 then
    Exit;

  qTempo := TList.Create;
  qTempo.Capacity := 1;
  qTempo.Add(TTempo.Create);
  uFuncGerais.rTempo.Criatempo;

  with DtmImportaTotalPrev do
   begin
     Try
       qTempo := Tempo(dData, WG_DT_REFER_BASE);
       rTempo := qTempo.items[0];
       
       QryInsTempoParticipante.ParamByName('CD_PARTIC').asInteger := iPartic;
       QryInsTempoParticipante.ParamByName('CD_TIPO_TEMPO').asInteger := iTipoTempo;
       QryInsTempoParticipante.ParamByName('CD_VERSAO').asInteger := WG_CD_VERSAO;

       case iTipoTempo of
         // TEMPO DE SERVIÇO ANTERIOR
         5: QryInsTempoParticipante.ParamByName('DT_TEMPO').Clear;

         // TEMPO DE SERVIÇO
         6: QryInsTempoParticipante.ParamByName('DT_TEMPO').Clear;

         // TEMPO NÃO CREDITADO
         11: QryInsTempoParticipante.ParamByName('DT_TEMPO').Clear;
       else
         QryInsTempoParticipante.ParamByName('DT_TEMPO').asDateTime := dData;
       end;

       if (iTipoTempo = 5) or (iTipoTempo = 11) then
        begin
          Try
            ConverteDias(StrToInt(FormatFloat('0', dData)), wAnos, wMeses, wDias);
            QryInsTempoParticipante.ParamByName('QT_DIA_TEMPO').asInteger := wDias;
            QryInsTempoParticipante.ParamByName('QT_MES_TEMPO').asInteger := wMeses;
            QryInsTempoParticipante.ParamByName('QT_ANO_TEMPO').asInteger := wAnos;
          Except
            Exit;
          End;
        end
       else
        begin
          QryInsTempoParticipante.ParamByName('QT_DIA_TEMPO').asInteger := rTempo.dias;
          QryInsTempoParticipante.ParamByName('QT_MES_TEMPO').asInteger := rTempo.meses;
          QryInsTempoParticipante.ParamByName('QT_ANO_TEMPO').asInteger := rTempo.anos;
        end;
       QryInsTempoParticipante.ExecSQL;
     Except
       QryUpdTempoParticipante.ParamByName('CD_PARTIC').asInteger := iPartic;
       QryUpdTempoParticipante.ParamByName('CD_TIPO_TEMPO').asInteger := iTipoTempo;
       QryUpdTempoParticipante.ParamByName('CD_VERSAO').asInteger := WG_CD_VERSAO;

       case iTipoTempo of
         // TEMPO DE SERVIÇO ANTERIOR
         5: QryUpdTempoParticipante.ParamByName('DT_TEMPO').Clear;

         // TEMPO DE SERVIÇO
         6: QryUpdTempoParticipante.ParamByName('DT_TEMPO').Clear;

         // TEMPO NÃO CREDITADO
         11: QryUpdTempoParticipante.ParamByName('DT_TEMPO').Clear;
       else
         QryUpdTempoParticipante.ParamByName('DT_TEMPO').asDateTime := dData;
       end;

       if (iTipoTempo = 5) or (iTipoTempo = 11) then
        begin
          Try
            ConverteDias(StrToInt(FormatFloat('0', dData)), wAnos, wMeses, wDias);
            QryUpdTempoParticipante.ParamByName('QT_DIA_TEMPO').asInteger := wDias;
            QryUpdTempoParticipante.ParamByName('QT_MES_TEMPO').asInteger := wMeses;
            QryUpdTempoParticipante.ParamByName('QT_ANO_TEMPO').asInteger := wAnos;
          Except
            Exit;
          End;
        end
       else
        begin
          QryUpdTempoParticipante.ParamByName('QT_DIA_TEMPO').asInteger := rTempo.dias;
          QryUpdTempoParticipante.ParamByName('QT_MES_TEMPO').asInteger := rTempo.meses;
          QryUpdTempoParticipante.ParamByName('QT_ANO_TEMPO').asInteger := rTempo.anos;
        end;  
       QryUpdTempoParticipante.ExecSQL;
     End;
   end; //with
end;

function ExecutaRegraNumerica(sNumRegra, sSQL: String; var bErro: Boolean): String;
begin
  Result := '0';
  bErro := False;

  if Trim(sNumRegra) = '' then
    Exit;

  with DtmImportaTotalPrev do
   begin
     Regra.RuleName := sNumRegra;
     qryRegra.Close;
     qryRegra.Open;
     if qryRegra.IsEmpty then
      begin
        Result := '0';
        bErro := False;
        qryRegra.Close;
        Exit;
      end;

     Regra.QueryIn := qryRegra;
     Regra.IdCalculo := 0;
     Try
       Regra.Execute;
     Finally
     End;
     if not Regra.Error then
      begin
        Try
          StrToFloat(TruncValue(Regra.Result, 5));
        Except
          bErro := True;
          bHouveErro := True;
          MessageDlg('O valor retornado pela regra nº ' + sNumRegra + ' não é ' +
              'um valor válido. Verifique', mtError, [mbOk], 0);
          qryRegra.Close;
          Exit;
        End;

        Result := TruncValue(Regra.Result, 5);
      end
     else
       bErro := True;

     qryRegra.Close;
   end;
end;

function ExecutaRegraTempo(sNumRegra, sSQL: String; var bErro: Boolean): String;
begin
  Result := '0';
  bErro := False;

  if Trim(sNumRegra) = '' then
    Exit;

  with DtmImportaTotalPrev do
   begin
     Regra.RuleName := sNumRegra;
     qryRegra.Close;
     qryRegra.Open;
     if qryRegra.IsEmpty then
      begin
        Result := '0';
        bErro := False;
        qryRegra.Close;
        Exit;
      end;

     Regra.QueryIn := qryRegra;
     Regra.Execute;
     if not Regra.Error then
      begin
        Try
          StrToDate(Regra.Result);
        Except
          bErro := True;
          bHouveErro := True;
          MessageDlg('O valor retornado pela regra nº ' + sNumRegra + ' não é ' +
              'um valor válido. Verifique', mtError, [mbOk], 0);
          qryRegra.Close;
          Exit;
        End;

        Result := Regra.Result;
      end
     else
       bErro := True;

     qryRegra.Close;
   end;
end;

procedure ConverteDias(iQtdDias: Integer; var wAnos: Word; var wMeses: Word; var wDias: Word);
begin
  Try
    wAnos := StrToInt(FormatFloat('0', Int(iQtdDias / 365)));
    wMeses := StrToInt(FormatFloat('0', Int((iQtdDias - (wAnos * 365)) / 30)));
    wDias := StrToInt(FormatFloat('0', Int(iQtdDias - (wAnos * 365) - (wMeses * 30))));
  Except
    wAnos := 0;
    wMeses := 0;
    wDias := 0;
  End;
end;

end.
