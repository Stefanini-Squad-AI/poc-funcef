unit uFuncoesEmprestimo;

interface

uses SysUtils, DModAutoAtendimento, DB, uCMClientDataSet, uTypesEmptmoAA,
     uMidasUtil, uDiasUteis, uSistema;


//Calcula datas do empréstimo
function CalcData( iIdPatro, iIdPlanoPrev : integer;
                   sSitFundacao, sTipoData, sMesReferencia,
                   sAnoReferencia, sFormaCobranca, sDataAssinatura: String;
                   iNumParc: Integer; sFlgInterno : string ): TDateTime;


//Data de Cobrança
function RetornaDataCobranca( iDia: Integer; sUtil, sAnterior, sMesCorrente,
                              sMesReferencia, sAnoReferencia, sDiasAposProc,
                              sDataAssinatura: String): String;


//Retorna próximo mês/ano
function ProximoMesAno( iMes, iAno : Integer ) : String;


//Retorna o dia útil
function DiaUtil( sDiaUtil, sMesAno: String ): String;


//Função que retorna se um determinado dia é útil ou não
function EDiaUtil( dData: TDateTime; iCidade, iPais: integer; sEstado: string;
                   bConsideraBancario, bConsideraExtraordinario,
                   bSabadoUtil: boolean ): boolean;


//Função que retorna se um determinado dia é feriado ou não
function Feriado( dData: TDateTime; iCidade, iPais: integer; sEstado: string;
                  bConsideraBancario, bConsideraExtraordinario: boolean ): boolean;


//Recupera salário base
function BuscaSalarioBase( iIdRegra,
                           iIdPessoaLocal         : integer;
                           var   fSalParticipacao : Currency;
                           var   fSalMantido      : Currency;
                           var   fSalAuxDoenca    : Currency;
                           var   fSalBenef        : Currency ): Currency;

//Recupera saldo de reserva
function BuscaReserva( iIdRegra,
                       iIdBenef,
                       iIdPessJur,
                       iIdPlanoPrev : integer;
                       dDtInsc      : TDateTime;
                       iLote        : integer ) : Currency;

//Recupera tava de juros
function BuscaTxJuros( iIdTipoContrEmptmo,
                       iIdRegra : integer;
                       fSldDevAnt,
                       fTxJurosAnt : Currency;
                       iNumParcelas,
                       iParcela : integer;
                       sSiglaIndexador : string;
                       dDataRef,
                       dDataCredito,
                       DataAssinatura,
                       DataInscricao : TDateTime;
                       iEvento,
                       iOrigem,
                       iPais,
                       iCidade,
                       iEstado : integer;
                       sUF : string;
                       iLote : integer ) : Currency;


implementation


//Calcula a data de crédito
function CalcData( iIdPatro, iIdPlanoPrev : integer;
                   sSitFundacao, sTipoData, sMesReferencia,
                   sAnoReferencia, sFormaCobranca, sDataAssinatura: String;
                   iNumParc: Integer; sFlgInterno : string ): TDateTime;
var
  sFlgMes, sData : String;
  dData : TDateTime;
  iDia, iMes, iAno     : Word;
begin

  sData := '';

  (* No caso da situação do participante ser CANCELADO, significa que o participante em
    questão é um(a) Beneficiário(a) e tem que ser tratado como ASSISTIDO *)
  if sFlgInterno = 'CA' then sFlgInterno := 'AS';

  //Se a situação do participante na fundação for cancelado, considerar como ativo na Patrocinadora
  if sSitFundacao = 'CA' then sSitFundacao := 'PT';

// -------------------------------------------------------------------------------------------------

  if sFormaCobranca = 'F' then
  begin

    cds.Close;
    cds.Data := WebEmprestimo.RecuperaDatasEmprestimo( iIdPatro, iIdPlanoPrev, 'PT' );

    if not cds.IsEmpty then
    begin

      (* verifica a data de acordo com a Folha da Patrocinadora *)

      //Se NORMAL
      if sTipoData = 'N' then
      begin
        if iNumParc >= 1 then
        begin
          sFlgMes := cds.FieldByName('FLGMESCOBN').AsString;
        end
        else
        begin
          sFlgMes := 'P';
        end;

        sData := RetornaDataCobranca( cds.FieldByName('DIACOBN').AsInteger,
                                      cds.FieldByName('FLGUTILN').AsString,
                                      cds.FieldByName('FLGDIAPOSANTN').AsString,
                                      sFlgMes,
                                      sMesReferencia,
                                      sAnoReferencia,
                                      '',
                                      sDataAssinatura );

        //Se ATRASO
        end
        else
          if sTipoData = 'A' then
          begin
            if iNumParc <= 1 then
            begin
              sFlgMes := cds.FieldByName('FLGMESCOBA').AsString;
            end
            else
            begin
              sFlgMes := 'P';
            end;

            sData := RetornaDataCobranca( cds.FieldByName('DIACOBA').AsInteger,
                                          cds.FieldByName('FLGUTILA').AsString,
                                          cds.FieldByName('FLGDIAPOSANTA').AsString,
                                          sFlgMes,
                                          sMesReferencia,
                                          sAnoReferencia,
                                          '',
                                          sDataAssinatura);

          //Se DEVOLUÇÃO
          end
          else
            if sTipoData = 'D' then
            begin
              if iNumParc >= 1 then
              begin
                sFlgMes := cds.FieldByName('FLGMESCOBD').AsString;
              end
              else
              begin
                sFlgMes := 'P';
              end;

              if length( trim( cds.FieldByName('DIASAPOSD').AsString ) ) <> 0 then
              begin
                dData := StrToDate( sDataAssinatura );
                DecodeDate( dData, iAno, iMes, iDia );

                sData := RetornaDataCobranca( Integer( iDia ),
                                              cds.FieldByName('FLGUTILD').AsString,
                                              cds.FieldByName('FLGDIAPOSANTD').AsString,
                                              'N',
                                              IntToStr( iMes ),
                                              IntToStr( iAno ),
                                              cds.FieldByName('DIASAPOSD').AsString,
                                              sDataAssinatura );

              end
              else
              begin
                sData := RetornaDataCobranca( cds.FieldByName('DIACOBD').AsInteger,
                                              cds.FieldByName('FLGUTILD').AsString,
                                              cds.FieldByName('FLGDIAPOSANTD').AsString,
                                              sFlgMes,
                                              sMesReferencia,
                                              sAnoReferencia,
                                              cds.FieldByName('DIASAPOSD').AsString,
                                              sDataAssinatura );
              end;

            //Se CRÉDITO
            end
            else
            begin

              if iNumParc <= 1 then
              begin
                sFlgMes := cds.FieldByName('FLGMESCOBC').AsString;
              end
              else
              begin
                sFlgMes := 'P';
              end;

              if Length( Trim( cds.FieldByName('DIASAPOSC').AsString)) <> 0 then
              begin
                dData := StrToDate(sDataAssinatura);
                DecodeDate(dData, iAno, iMes, iDia);
                sData := RetornaDataCobranca( Integer(iDia),
                                              cds.FieldByName('FLGUTILC').AsString,
                                              cds.FieldByName('FLGDIAPOSANTC').AsString,
                                              'N',
                                              IntToStr( iMes ),
                                              IntToStr( iAno ),
                                              cds.FieldByName('DIASAPOSC').AsString,
                                              sDataAssinatura );
              end
              else
              begin
                sData := RetornaDataCobranca( cds.FieldByName('DIACOBC').AsInteger,
                                              cds.FieldByName('FLGUTILC').AsString,
                                              cds.FieldByName('FLGDIAPOSANTC').AsString,
                                              sFlgMes,
                                              sMesReferencia,
                                              sAnoReferencia,
                                              cds.FieldByName('DIASAPOSC').AsString,
                                              sDataAssinatura);
              end;

            end; //Se NORMAL, ATRASO, DEVOLUÇÃO, CRÉDITO

      end;

// -------------------------------------------------------------------------------------------------

  (* se FormaCobranca *)
  end
  else if sFormaCobranca = 'C' then
  begin

    cds.Close;
    cds.Data := WebEmprestimo.RecuperaDatasEmprestimo( iIdPatro, iIdPlanoPrev, sSitFundacao );

    if not cds.IsEmpty then
    begin

      (* verifica a data de acordo com a Folha da Patrocinadora *)

      //Se NORMAL
      if sTipoData = 'N' then
      begin
        if iNumParc >= 1 then
        begin
          sFlgMes := cds.FieldByName('FLGMESCOBN').AsString;
        end
        else
        begin
          sFlgMes := 'P';
        end;
      
        sData := RetornaDataCobranca( cds.FieldByName('DIACOBN').AsInteger,
                                      cds.FieldByName('FLGUTILN').AsString,
                                      cds.FieldByName('FLGDIAPOSANTN').AsString,
                                      sFlgMes,
                                      sMesReferencia,
                                      sAnoReferencia,
                                      '',
                                      sDataAssinatura );

        //Se ATRASO
        end
        else
          if sTipoData = 'A' then
          begin
            if iNumParc <= 1 then
            begin
              sFlgMes := cds.FieldByName('FLGMESCOBA').AsString;
            end
            else
            begin
              sFlgMes := 'P';
            end;
          
            sData := RetornaDataCobranca( cds.FieldByName('DIACOBA').AsInteger,
                                          cds.FieldByName('FLGUTILA').AsString,
                                          cds.FieldByName('FLGDIAPOSANTA').AsString,
                                          sFlgMes,
                                          sMesReferencia,
                                          sAnoReferencia,
                                          '',
                                          sDataAssinatura);

          //Se DEVOLUÇÃO
          end
          else
            if sTipoData = 'D' then
            begin
              if iNumParc >= 1 then
              begin
                sFlgMes := cds.FieldByName('FLGMESCOBD').AsString;
              end
              else
              begin
                sFlgMes := 'P';
              end;

              if length( trim( cds.FieldByName('DIASAPOSD').AsString ) ) <> 0 then
              begin
                dData := StrToDate( sDataAssinatura );
                DecodeDate( dData, iAno, iMes, iDia );
              
                sData := RetornaDataCobranca( Integer( iDia ),
                                              cds.FieldByName('FLGUTILD').AsString,
                                              cds.FieldByName('FLGDIAPOSANTD').AsString,
                                              'N',
                                              IntToStr( iMes ),
                                              IntToStr( iAno ),
                                              cds.FieldByName('DIASAPOSD').AsString,
                                              sDataAssinatura );

              end
              else
              begin
                sData := RetornaDataCobranca( cds.FieldByName('DIACOBD').AsInteger,
                                              cds.FieldByName('FLGUTILD').AsString,
                                              cds.FieldByName('FLGDIAPOSANTD').AsString,
                                              sFlgMes,
                                              sMesReferencia,
                                              sAnoReferencia,
                                              cds.FieldByName('DIASAPOSD').AsString,
                                              sDataAssinatura );
              end;

            //Se CRÉDITO
            end
            else
            begin

              sFlgMes := cds.FieldByName('FLGMESCOBC').AsString;

              if Length( Trim( cds.FieldByName('DIASAPOSC').AsString)) <> 0 then
              begin
                dData := StrToDate(sDataAssinatura);
                DecodeDate(dData, iAno, iMes, iDia);
                sData := RetornaDataCobranca( Integer(iDia),
                                              cds.FieldByName('FLGUTILC').AsString,
                                              cds.FieldByName('FLGDIAPOSANTC').AsString,
                                              'N',
                                              IntToStr( iMes ),
                                              IntToStr( iAno ),
                                              cds.FieldByName('DIASAPOSC').AsString,
                                              sDataAssinatura );
              end
              else
              begin
                sData := RetornaDataCobranca( cds.FieldByName('DIACOBC').AsInteger,
                                              cds.FieldByName('FLGUTILC').AsString,
                                              cds.FieldByName('FLGDIAPOSANTC').AsString,
                                              sFlgMes,
                                              sMesReferencia,
                                              sAnoReferencia,
                                              cds.FieldByName('DIASAPOSC').AsString,
                                              sDataAssinatura);
              end;

            end; //Se NORMAL, ATRASO, DEVOLUÇÃO, CRÉDITO

      end;

  end;

  try
    Result := StrToDate( sData );
  except
    Result := 0;
  end;
  
end; {CalcDataCredito}




//Data de Cobrança
function RetornaDataCobranca( iDia: Integer; sUtil, sAnterior, sMesCorrente,
                              sMesReferencia, sAnoReferencia, sDiasAposProc,
                              sDataAssinatura: String): String;
var
  dData                            : TDateTime;
  sDia, sMesAno, sData, sDiaUtil   : String;
  iMes, iDiasAposProc, iCodeError  : Integer;
begin
  Result := '';

  //Formata o Mês de Referência p/ 2 dígitos
  if length(sMesReferencia) = 1 then sMesReferencia := '0' + sMesReferencia;

  //Formata o Dia p/ 2 dígitos
  sDia := IntToStr(iDia);
  if length(sDia) = 1 then sDia := '0' + sDia;

  if sMesCorrente = 'P'
  then sMesAno := ProximoMesAno( StrToInt( sMesReferencia ), StrToInt( sAnoReferencia ) )
  else sMesAno := sMesReferencia + '/' + sAnoReferencia;

  //Verifica se é ano bissexto
  if (sDia >= '29') and (Copy(sMesAno, 0, 2) = '02') then
  begin
    if StrToInt(Copy(sMesAno, 4, 4)) mod 4 = 0 then
    begin
       sDia := '29'
    end
    else
    begin
       sDia := '28';
    end;
  end;

  (* Faço o acerto do último dia do mês para os meses que não terminam em 31.
     Fevereiro já foi tratado acima. *)
  if (sDia > '30') and  (Copy(sMesAno, 0, 2) <> '02') then
  begin
    iMes := StrToInt(Copy(sMesAno, 0, 2));
    case iMes of
       4, 6, 9, 11: sDia := '30';
    end;
  end;

  dData := StrToDate(sDia + '/' + sMesAno);

  if sDiasAposProc = '' then sDiasAposProc := '0';
  Val(sDiasAposProc, iDiasAposProc, iCodeError);
  if iCodeError = 0 then dData := dData + iDiasAposProc;

  
  if sUtil = 'N' then
  begin // Dia normal(fixo) - Ex: se dia = 5, pega dia 5 do mes
    if DayOfWeek(dData) = 1 then
    begin            // Se dia da semana for domingo
       if sAnterior = 'A'      then sData := DateToStr(dData - 2)  // Pegar dia anterior. 6a. feira
       else if sAnterior = 'P' then sData := DateToStr(dData + 1)  // Pegar dia posterior. 2a feira
       else if sAnterior = 'N' then sData := DateToStr(dData);     // Pegar o proprio dia calculado
    end
    else if DayOfWeek(dData) = 7 then
      begin      //Se dia da semana for sábado
        if sAnterior      = 'A' then sData := DateToStr(dData - 1)  // Pegar dia anterior. 6a. feira
        else if sAnterior = 'P' then sData := DateToStr(dData + 2)  // Pegar dia posterior 2a. feira
        else if sAnterior = 'N' then sData := DateToStr(dData);     // Pegar o proprio dia calculado
      end else sData := DateToStr(dData);                           // Dia da semana é dia útil
  end
  else  // Dia util Ex.: se dia = 5, pega 5° dia útil do mes
  begin 
    sDiaUtil := DiaUtil( sDia, sMesAno ); // Chama funcao que retorna o dia util

    if Length(sDiaUtil) = 1 then sDiaUtil := '0' + sDiaUtil;

    if sDiasAposProc = '0' then
    begin
       sData := sDiaUtil + '/' + sMesAno;
    end
    else
    begin
      sData := DateToStr( DiasUteis.SomaDiasUteis( strToDate(sDataAssinatura),
                           StrToInt(sDiasAposProc), -1, -1, '', True, True, False));
    end;
  end; //fim - Dia util

  Result := sData;
end; {RetornaDataCobranca}



//Retorna próximo mês/ano
function ProximoMesAno( iMes, iAno : Integer ) : String;
var
  sMesAno: String;
begin
  Result := '';

  if iMes = 12 then
  begin
    sMesAno := '01/' + IntToStr(iAno + 1);
  end
  else
  begin
    iMes := iMes + 1;

    if iMes <= 9 then sMesAno  := '0' + IntToStr(iMes)
    else sMesAno  := IntToStr(iMes);

    sMesAno  := sMesAno + '/' + IntToStr(iAno);
  end;

  Result := sMesAno;
end; {ProximoMesAno}



//Retorna o dia útil
function DiaUtil( sDiaUtil, sMesAno: String ): String;
var
  iDia, iDiaUtil  : Integer;
  dData     : TDateTime;
begin
  Result   := '';
  iDia     := 1;
  iDiaUtil := 0;

  //O recurso abaixo teve de ser colocado enquanto não melhorar função
  if StrToInt( sDiaUtil ) > 20 then sDiaUtil := IntToStr(20);

  while StrToInt( sDiaUtil ) <> iDiaUtil do
  begin

    if Length( IntToStr( iDia ) ) = 1 then
       dData := StrToDate( '0' + IntToStr( iDia ) + '/' + sMesAno)
    else
       dData := StrToDate( IntToStr( iDia ) + '/' + sMesAno );

    //Se Dia da Semana nao for Domingo nem Sabado
    if ( DayOfWeek( dData ) <> 1) and ( DayOfWeek( dData ) <> 7 )  then
      iDiaUtil := iDiaUtil + 1;

    iDia := iDia + 1;

  end;

  Result := IntToStr( iDia - 1 );
end; {DiaUtil}
                              

//--------------------------------------------------------------------------------------------------
//    EDiaUtil: Função que retorna se um determinado dia é útil ou não
//--------------------------------------------------------------------------------------------------
//--------------------------------------------------------------------------------------------------
//    Parâmetros:
//       dData                :  data em questão
//       iCidade              :  id da Cidade (idCidades)
//       iPais                :  id do País (idPais)
//       sEstado              :  código do Estado (CodEstado)
//       bConsidera[_tipo_]   :  True  - conta também feriados [_tipo_]
//                               False - ignora feriados [_tipo_]
//       bSabadoUtil          :  True  - sábados serão considerados dias úteis
//                               False - sábados não serão considerados dias úteis
//
//       -------------------------------------------------------------------------------------------
//          passar (-1) caso os parâmetros (inteiros) não sejam necessários
//          passar ('') caso os parâmetros string não sejam necessários
//       -------------------------------------------------------------------------------------------
//
//--------------------------------------------------------------------------------------------------
function EDiaUtil( dData: TDateTime; iCidade, iPais: integer; sEstado: string;
                   bConsideraBancario, bConsideraExtraordinario,
                   bSabadoUtil: boolean ): boolean;
begin
  Result := True;
  // se for domingo não é útil
  if DayOfWeek(dData) = 1 then begin
    Result := False;
  end else begin
    // se for sábado e sábado não for considerado dia útil, não é útil
    if ( (DayOfWeek(dData) = 7) and (not(bSabadoUtil)) ) then begin
      Result := False;
    end else begin
      // senão, verifica se o dia é feriado
      if Feriado( dData, iCidade, iPais, sEstado, bConsideraBancario,
                  bConsideraExtraordinario ) then Result := False;
    end;
  end;
end;


//--------------------------------------------------------------------------------------------------
//    Feriado: Função que retorna se um determinado dia é feriado ou não
//--------------------------------------------------------------------------------------------------
//--------------------------------------------------------------------------------------------------
//    Parâmetros:
//       dData                :  data em questão
//       iCidade              :  id da Cidade (idCidades)
//       iPais                :  id do País (idPais)
//       sEstado              :  código do Estado (CodEstado)
//       bConsidera[_tipo_]   :  True  - conta também feriados [_tipo_]
//                               False - ignora feriados [_tipo_]
//
//       -------------------------------------------------------------------------------------------
//          passar (-1) caso os parâmetros (inteiros) não sejam necessários
//          passar ('') caso os parâmetros string não sejam necessários
//       -------------------------------------------------------------------------------------------
//
//--------------------------------------------------------------------------------------------------
function Feriado( dData: TDateTime; iCidade, iPais: integer; sEstado: string;
                  bConsideraBancario, bConsideraExtraordinario: boolean ): boolean;
var
  sTipos: string;
  cdsFeriados : TCMClientDataSet;
begin
  cdsFeriados := TCMClientDataSet.Create(nil);
  try
    // Define os tipos de feriados que se deseja levar em conta
    // Feriados ordinários são SEMPRE levados em conta
    // Feriados classistas NUNCA são contados
    sTipos := '''O''';
    if bConsideraBancario       then sTipos := sTipos + ',' + '''B''';
    if bConsideraExtraordinario then sTipos := sTipos + ',' + '''E''';

    cdsFeriados.Close;
    cdsFeriados.Data := WebEmprestimo.Feriados( dData, iCidade, iPais, sEstado, sTipos );

    Result := cdsFeriados.FieldByName('NO_FERIADOS').asInteger > 0;

    cdsFeriados.Close;
  finally
    cdsFeriados.Free;
  end;

end;




//Recupera salário base
function BuscaSalarioBase( iIdRegra,
                           iIdPessoaLocal   : integer;
                           var   fSalParticipacao : Currency;
                           var   fSalMantido      : Currency;
                           var   fSalAuxDoenca    : Currency;
                           var   fSalBenef        : Currency ): Currency;
var
  cdsDadosParticipante : TCMClientDataSet;
begin
  cdsDadosParticipante := TCMClientDataSet.Create( nil );
  try

    cdsDadosParticipante.Data := WebEmprestimo.DadosSalPart( iIdPessoaLocal );

    fSalParticipacao  := cdsDadosParticipante.FieldByName('SALPARTICIPACAO').AsCurrency;
    fSalMantido       := cdsDadosParticipante.FieldByName('SALMANTIDO').AsCurrency;
    fSalAuxDoenca     := cdsDadosParticipante.FieldByName('SALAUXDOENCA').AsCurrency;
    fSalBenef         := cdsDadosParticipante.FieldByName('VALORATUAL').AsCurrency;

    WebRegra.DatasetSalBase( iIdPessoaLocal, cdsDadosParticipante.Data );

    WebRegra.MessageInfo := '';
    Result := StrToFloat( ConvertePontoParaVirgulaStr( WebRegra.RegraString( IntToStr( iIdRegra ), iIdEmpresaProp ) ) );
    if WebRegra.MessageInfo <> '' then raise Exception.Create( WebRegra.MessageInfo );

  finally
    cdsDadosParticipante.Free;
  end;
end; {BuscaSalarioBase}



//Recupera saldo de reserva
function BuscaReserva( iIdRegra,
                       iIdBenef,
                       iIdPessJur,
                       iIdPlanoPrev : integer;
                       dDtInsc      : TDateTime;
                       iLote        : integer ) : Currency;
var
  sResultado : string;
begin
  WebRegra.DatasetReservaPoupanca( iIdBenef, iIdPessJur, iIdPlanoPrev, dDtInsc, iLote );
  WebRegra.MessageInfo := '';
  sResultado := WebRegra.RegraString( IntToStr( iIdRegra ), iIdEmpresaProp );

  if WebRegra.MessageInfo <> '' then raise Exception.Create( WebRegra.MessageInfo );
  if ( sResultado <> '' ) and ( sResultado <> 'NULO' )then
    Result := StrToFloat( ConvertePontoParaVirgulaStr( sResultado ) )
  else
    Result := 0;
end; {BuscaReserva}


//Recupera tava de juros
function BuscaTxJuros( iIdTipoContrEmptmo,
                       iIdRegra : integer;
                       fSldDevAnt,
                       fTxJurosAnt : Currency;
                       iNumParcelas,
                       iParcela : integer;
                       sSiglaIndexador : string;
                       dDataRef,
                       dDataCredito,
                       DataAssinatura,
                       DataInscricao : TDateTime;
                       iEvento,
                       iOrigem,
                       iPais,
                       iCidade,
                       iEstado : integer;
                       sUF : string;
                       iLote : integer ) : Currency;
var
  sResultado : string;
begin
  WebRegra.DatasetTxJuros( iIdTipoContrEmptmo,
                           fSldDevAnt,
                           fTxJurosAnt,
                           iNumParcelas,
                           iParcela,
                           sSiglaIndexador,
                           dDataRef,
                           dDataCredito,
                           DataAssinatura,
                           DataInscricao,
                           iEvento,
                           iOrigem,
                           iPais,
                           iCidade,
                           iEstado,
                           sUF,
                           iLote );


  WebRegra.MessageInfo := '';
  sResultado := WebRegra.RegraString( IntToStr( iIdRegra ), iIdEmpresaProp );
  if WebRegra.MessageInfo <> '' then raise Exception.Create( WebRegra.MessageInfo );

  if trim( sResultado ) <> '' then
    Result := StrToFloat( ConvertePontoParaVirgulaStr( sResultado ) )
  else
    Result := 0;
end; {BuscaTxJuros}


end.

