unit UMovReservaFB;

interface

uses
  Db, DBTables, Wwquery, Windows, Messages, SysUtils, Classes, Graphics,
  Controls, Forms, Dialogs, URegra,
  Machklb,Registry,checklst,stdctrls,  UdataBase, uAutorizacao, uSistema,Math,
  uParticipante, uAdmPrevFB, UFuncoesUteisFB, uConstFolha;


function AlimentaHistorico( qryAux                              : TwwQuery;
                            sIdpessjur,       sIdplanoprev,
                            sIdtiporeserva,   sIdpessoa,
                            sSeqProposta,     sVlMovCotas,
                            sVlSaldoResCotas, sIdbeneficio,
                            sIdContribuicao,  sIdEvento,
                            sIdRegra,         sMesReferencia    : string;
                            iFlgEntrada                         : integer;
                            Data                                : Tdate ;
                            bExcedente                          : Boolean ;
                            DataRefIndice                       : TDate ;
                            sIdParticipante                     : string;
                            aidHstfolhabenef: integer;  
                            var piIdHistorico                   : longint   ) : boolean;

function VoltaValorCotacao(qryaux : Twwquery ; sIndiceReajuste,sIdPlanoPrev , sIdTipoReserva ,sDataMov : String) : Double;

function VoltaValorCotExato(qryaux : Twwquery ; sIndiceReajuste, sDataMov : String ; var dValorCotacao : Double ; var DataCotacao : String) : Integer;

function VerificaCamposObrigContab( qryaux , qrycontab, qrycontabplano : Twwquery ;var sIncompl : string) : boolean;

procedure VerifIndiceHist(qryaux : twwquery;  var sIndice : String ; sIdPlanoPrev, sIdTipoReserva : String ; sDataCota : String);


function EstornaAlimentacaoReserva(
  aqryAux1, aqryAux2: twwquery;
  aidtitular: integer;
  aidhstfolhabenef: integer;
  asmespag: string): boolean;

var
   IUnidnegoc : Integer;
   sUnidnegoc : String;
   sIndiceMoedaCorrente : String;
   sDataref : String;
   psIDTPPAGTOANT, psFlgBenefMinimo : string; 


implementation

//-------------------------------------------------------//
function OraNumero(sNumero : string):string;
var i : integer;
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


//--------------------------verifica campos obrigatórios para contabilização---//
function VerificaCamposObrigContab( qryaux, qrycontab, qrycontabplano : Twwquery  ;var sIncompl : string) : boolean;
var sTipoDesc : string;
begin
   Result := False;
   sIncompl := '';

   if  inttostr(Sistema.IdEmpresa) = ''
   then begin
      if sIncompl = ''
      then sIncompl := 'Empresa Proprietária '
      else sIncompl := sIncompl +', Empresa Proprietária ';
   end;


   qryaux.close;
   qryaux.sql.clear;
   qryaux.sql.add(' SELECT USACRESPON, CODCENTRORESPON,USAABC , UNIDNEGOC, MOEDACORRENTE FROM PARAMGLOBAL '+
                  ' WHERE IDPESSOA = '+inttostr(Sistema.IdEmpresa)+'  ');
   qryaux.open;

   sIndiceMoedaCorrente := qryaux.fieldbyname('moedacorrente').AsString;


   if (qryaux.fieldbyname('usaabc').AsString = 'S') and
   (Trim(qrycontab.FieldByName('UNIDNEGOC').AsString) = '') and
   (Trim(qrycontabplano.FieldByName('UNIDNEGOC').AsString) = '')
   then begin
      if sIncompl = ''
      then sIncompl := 'Unidade de Negócio'
      else sIncompl := sIncompl +', Unidade de Negócio';
   end
   else if (qryaux.fieldbyname('usaabc').AsString = 'S') and
   (Trim(qrycontab.FieldByName('UNIDNEGOC').AsString) <> '') and
   (Trim(qrycontabplano.FieldByName('UNIDNEGOC').AsString) = '') then
   begin
      IUnidnegoc := qrycontab.fieldbyname('UNIDNEGOC').AsInteger;
      sUnidnegoc := qrycontab.fieldbyname('UNIDNEGOC').AsString;
   end
   else if (qryaux.fieldbyname('usaabc').AsString = 'S') and
   (Trim(qrycontab.FieldByName('UNIDNEGOC').AsString) = '') and
   (Trim(qrycontabplano.FieldByName('UNIDNEGOC').AsString) <> '') then
   begin
      IUnidnegoc := qrycontabplano.fieldbyname('UNIDNEGOC').AsInteger;
      sUnidnegoc := qrycontabplano.fieldbyname('UNIDNEGOC').AsString;
   end
   else
   begin
      if qryaux.fieldbyname('unidnegoc').AsString = '' then
      begin
         if sIncompl = ''
         then sIncompl := ' Parâmetro - Unidade de Negócio'
         else sIncompl := sIncompl +', Parâmtero - Unidade de Negócio';
      end
      else
      begin
        IUnidnegoc := qryaux.fieldbyname('UNIDNEGOC').AsInteger;
        sUnidnegoc := qryaux.fieldbyname('UNIDNEGOC').AsString;
      end;
   end;

   if (Trim(qrycontab.FieldByName('PLACONTAC').AsString) = '') and
      (Trim(qrycontabplano.FieldByName('PLACONTAC').AsString) = '')
   then begin
      if sIncompl = ''
      then sIncompl := 'Conta Contábil para Crédito'
      else sIncompl := sIncompl +', Conta Contábil para Crédito';
   end;

   if (Trim(qrycontab.FieldByName('PLACONTAD').AsString) = '') and
      (Trim(qrycontabplano.FieldByName('PLACONTAD').AsString) = '')
   then begin
      if sIncompl = ''
      then sIncompl := 'Conta Contábil para Débito'
      else sIncompl := sIncompl +', Conta Contábil para Débito';
   end;

   if (Trim(qrycontab.FieldByName('PLANO').AsString) = '') and
      (Trim(qrycontabplano.FieldByName('PLANO').AsString) = '')
   then begin
      if sIncompl = ''
      then sIncompl := 'Plano de Conta Contábil '
      else sIncompl := sIncompl +', Plano Conta Contábil ';
   end;

   if sIncompl <> ''
   then begin
      sTipoDesc := 'Informações incompletas para a Contabilização da Movimentação - ';
      sIncompl := sTipoDesc+sIncompl;
      Result := False;
   end
   else Result := True;
end; // VerificaCamposObrig




//--------------------------------------//-------------------------------------//
function VoltaValorCotacao(qryaux : Twwquery ; sIndiceReajuste, sIdPlanoPrev , sIdTipoReserva, sDataMov : String) : Double;
var cAux : char ;
    stipoMoeda : String;
begin
 Result := 0;
 if Trim(sIndiceReajuste) = '' then Exit;

 VerifIndiceHist(qryaux , sIndiceReajuste, sIdPlanoPrev , sIdTipoReserva ,sDataMov );

 //transformar o número de cotas da reserva em moeda
 qryaux.Close;
 qryaux.sql.clear;
 qryaux.SQL.add('SELECT  MOEPERIODICIDADE '+
                ' FROM MOEDA '+
                ' WHERE MOECODIGO = '+sIndiceReajuste+' ');
 Try
   qryaux.Open;
 Except
   result := 0;
   exit;
 End;
 if qryaux.IsEmpty then begin
   result := 0;
   exit;
 end;


 sTipoMoeda := qryAux.FieldByName('MOEPERIODICIDADE').AsString;
 qryaux.Close;
 qryaux.sql.clear;
 if sTipoMoeda = 'M' Then Begin

    qryaux.SQL.add('SELECT  COTVALOR '+
                   ' FROM COTACAOMOEDA '+
                   ' WHERE MOECODIGO = '+sIndiceReajuste+' '+
                   ' AND COTDATA IN '+
                   ' (SELECT MAX(COTDATA) FROM COTACAOMOEDA '+
                   ' WHERE MOECODIGO = '+sIndicereajuste+' '+
                   ' AND (COTMESREF = '''+copy(sDataMov,4,2)+copy(sDataMov,7,4)+ '''))'); 
  end
  else begin
    qryaux.SQL.add('SELECT  COTVALOR '+
                   ' FROM COTACAOMOEDA '+
                   ' WHERE MOECODIGO = '+sIndiceReajuste+' '+
                   ' AND COTDATA IN '+
                   ' (SELECT MAX(COTDATA) FROM COTACAOMOEDA '+
                   ' WHERE MOECODIGO = '+sIndicereajuste+' '+
                   ' AND COTDATA = TO_DATE(''' + sDataMov +''',''DD/MM/YYYY'')) '); 

  end;
  try
    qryaux.Open;
  except
   result := 0;
   exit;
  end;
 if qryaux.IsEmpty then
 begin
   //erro - não encontrou cotacao para moeda
   result := 0;
   exit;
 end
 else
 begin
    cAux := DecimalSeparator;
    DecimalSeparator := '.';
    result := strtofloat(truncaround(qryaux.fieldbyname('COTVALOR').AsString,8)); 
    DecimalSeparator := cAux;
 end;

end;

//--------------------------------//-------------------------------------------//

function VoltaValorCotExato(qryaux : Twwquery ; sIndiceReajuste, sDataMov : String ; var dValorCotacao : Double ; var DataCotacao : String) : Integer;
var cAux : char ;
begin

 //transformar o número de cotas da reserva em moeda
 qryaux.Close;
 qryaux.sql.clear;
 qryaux.SQL.add('SELECT  COTVALOR, COTDATA '+
                ' FROM COTACAOMOEDA '+
                ' WHERE MOECODIGO = '''+sIndiceReajuste+''' '+
                ' AND COTDATA IN '+
                ' (SELECT MAX(COTDATA) FROM COTACAOMOEDA '+
                ' WHERE MOECODIGO = '''+sIndicereajuste+''' '+
                ' AND COTDATA <= TO_DATE('''+sDataMov+''',''DD/MM/YYYY'') ) ');
 qryaux.Open;


 if qryaux.IsEmpty then
 begin
   //erro - não encontrou cotacao para moeda
   result := 0;
   DataCotacao := '';
   dValorCotacao := 0;
   exit;
 end
 else
 begin
    cAux := DecimalSeparator;
    DecimalSeparator := '.';
    DataCotacao := qryaux.fieldbyname('COTDATA').AsString;

    if not (strtodate(sDataMov) = strtodate(DataCotacao)) then
    result := 1
    else result := 2;

    dValorCotacao := strtofloat(truncaround(qryaux.fieldbyname('COTVALOR').AsString,6));
    DecimalSeparator := cAux;
 end;

end;



//-------------------------------------//--------------------------------------//
function AlimentaHistorico( qryAux                              : TwwQuery;
                            sIdpessjur,       sIdplanoprev,
                            sIdtiporeserva,   sIdpessoa,
                            sSeqProposta,     sVlMovCotas,
                            sVlSaldoResCotas, sIdbeneficio,
                            sIdContribuicao,  sIdEvento,
                            sIdRegra,         sMesReferencia    : string;
                            iFlgEntrada                         : integer;
                            Data                                : Tdate ;
                            bExcedente                          : Boolean ;
                            DataRefIndice                       : TDate ;
                            sIdParticipante                     : string;
                            aidHstfolhabenef: integer;  
                            var piIdHistorico                   : longint   ) : boolean;
var
   sIdHist : String;
   cAux : char;
   sPercentual,sValorIndice : String;
   sVlMovReal , sVlSaldoResAtual, sIndiceReajuste,sVlSaldoCont : String;

begin
   Result := False;

   if StrToFloat(ClienteNumero(sVlMovCotas)) = 0
   then begin
      Result := True;
      Exit;
   end
   else if StrToFloat(ClienteNumero(sVlMovCotas)) < 0
        then begin
           // inverter flgentrada
           if iFlgEntrada = 1
           then iFlgEntrada := 0
           else iFlgEntrada := 1;

           // inverter sinal do movimento
           sVlMovCotas := OraNumero( FloatToStr ( - StrToFloat(ClienteNumero(sVlMovCotas)) ) );
        end;

   if (Trim(sIdbeneficio) <> '' ) and (StrToInt(sIdBeneficio) <= 0)
   then sIdBeneficio := '';

   if (Trim(sIdContribuicao) <> '' ) and (StrToInt(sIdContribuicao) <= 0)
   then sIdContribuicao := '';

   sIdHist       := inttostr(LeUltRegistro(qryaux,'HISTMOVRESERVA'));
   piIdHistorico := StrToInt(sIdHist);

   if sIdpessjur = ''       then exit;
   if sIdplanoprev = ''     then exit;
   if sIdtiporeserva = ''   then exit;
   if sVlMovCotas = ''      then exit;
   if sVlSaldoResCotas = '' then exit;
   if (iFlgEntrada <> 0) and (iFlgEntrada <> 1) then exit;

   qryaux.close;
   if not (sIdContribuicao = '') then
   begin
      qryaux.close;
      qryaux.sql.clear;
      qryaux.sql.add(' SELECT PERCENTUAL FROM RESERVAXCONTRIB  '+
                     ' WHERE  IDCONTRIBUICAO = '''+sIdContribuicao+''' '+
                     ' AND    IDTIPORESERVA = '''+sIdtiporeserva+''' '+
                     ' AND    IDPLANOPREV = '''+sIdplanoprev+''' ');
      try
         qryaux.open;
      except
         Exit;
      end;
   end;

   if qryaux.IsEmpty then
   sPercentual := ''
   else sPercentual := qryaux.fieldbyname('Percentual').AsString;

   qryaux.close;
   qryaux.sql.clear;
   qryaux.sql.add(' SELECT INDICEREAJUSTE FROM RESERVAXPLANO WHERE '+
                  ' IDTIPORESERVA = '''+sIdtiporeserva+''' '+
                  ' AND IDPLANOPREV = '''+sIdplanoprev+''' ');
   try
      qryaux.open;
   except
      Exit;
   end;
   sIndiceReajuste := qryaux.fieldbyname('INDICEREAJUSTE').AsString;

   VerifIndiceHist(qryaux , sIndiceReajuste, sIdplanoprev, sIdTipoReserva,datetostr(datarefindice) );

   cAux := DecimalSeparator;
   DecimalSeparator := ',';
   sValorIndice := floattostr(VoltaValorCotacao(qryaux, sIndiceReajuste,
                                                sIdplanoprev, sIdTipoReserva, datetostr(datarefindice)));
   DecimalSeparator := cAux;

   if pos(',',sVlMovCotas) > 0 then
   begin
      cAux := DecimalSeparator;
      DecimalSeparator := ',';
      sVlMovReal := floattostr(strtofloat(sVlMovCotas) *
      VoltaValorCotacao(qryaux,sIndiceReajuste,sIdplanoprev, sIdTipoReserva,datetostr(datarefindice)) );
      DecimalSeparator := cAux;
   end
   else //if pos('.',sVlMovCotas) > 0 then
   begin
      cAux := DecimalSeparator;
      DecimalSeparator := '.';
      sVlMovReal := floattostr(strtofloat(sVlMovCotas) *
      VoltaValorCotacao(qryaux, sIndiceReajuste,sIdplanoprev, sIdTipoReserva,datetostr(datarefindice)) );
      DecimalSeparator := cAux;
   end;

   if pos(',',sVlSaldoResCotas) > 0 then
   begin
      cAux := DecimalSeparator;
      DecimalSeparator := ',';
      sVlSaldoResAtual := floattostr(strtofloat(sVlSaldoResCotas) *
      VoltaValorCotacao(qryaux, sIndiceReajuste,sIdplanoprev, sIdTipoReserva,datetostr(datarefindice)) );
      DecimalSeparator := cAux;
   end
   else //if pos('.',sVlSaldoResCotas) > 0 then
   begin
      cAux := DecimalSeparator;
      DecimalSeparator := '.';
      sVlSaldoResAtual := floattostr(strtofloat(sVlSaldoResCotas) *
      VoltaValorCotacao(qryaux,sIndiceReajuste,sIdplanoprev, sIdTipoReserva,datetostr(datarefindice)) );
      DecimalSeparator := cAux;
   end;

   cAux := DecimalSeparator;
   try
      if DecimalSeparator = ',' then
      begin
         if pos(',',sVlMovReal) > 0 then
         sVlMovReal := truncaround(sVlMovReal,2);
         if pos(',',sVlMovCotas) > 0 then
         sVlMovCotas := truncaround(sVlMovCotas,8);
         if pos(',',sVlSaldoResAtual) > 0 then
         sVlSaldoResAtual := truncaround(sVlSaldoResAtual,8);
         if pos(',',sVlSaldoResCotas) > 0 then
         sVlSaldoResCotas := truncaround(sVlSaldoResCotas,2);
      end;
   finally
      DecimalSeparator := '.';
      if pos('.',sVlMovReal) > 0 then
      sVlMovReal := truncaround(sVlMovReal,2);
      if pos('.',sVlMovCotas) > 0 then
      sVlMovCotas := truncaround(sVlMovCotas,8);
      if pos('.',sVlSaldoResAtual) > 0 then
      sVlSaldoResAtual := truncaround(sVlSaldoResAtual,2);
      if pos('.',sVlSaldoResCotas) > 0 then
      sVlSaldoResCotas := truncaround(sVlSaldoResCotas,8);
   end;
   DecimalSeparator := cAux;

   //testa se é uma atualização monetária
   if (sIdBeneficio = '') and
      (sIdContribuicao = '') and
      (sIdEvento = '') and (not bExcedente) then sVlMovCotas := '0';

   qryaux.Close;
   qryaux.sql.clear;
   qryaux.sql.Add(' SELECT MAX(IDHISTRESERVA) , DATAMOV, SALDOREAL ,IDEVENTOGERADOR,IDBENEFICIO, '+
                  ' IDCONTRIBUICAO,VLRCOTAS,VLRREAL, SALDOREALCONT '+
                  ' FROM HISTMOVRESERVA '+
                  ' WHERE  (IDPESSJUR     = '+sidpessjur     +') '+
                  ' AND    (IDPLANOPREV   = '+sidplanoprev   +') '+
                  ' AND    (IDPESSOA      = '+sidpessoa      +') '+
                  ' AND    (SEQPROPOSTA   = '+sSeqProposta   +') '+
                  ' AND    (IDTIPORESERVA = '+sIdTipoReserva +') '+
                  ' GROUP BY DATAMOV, SALDOREAL,IDEVENTOGERADOR,IDBENEFICIO, '+
                  ' IDCONTRIBUICAO,VLRCOTAS,VLRREAL, SALDOREALCONT ');
   try
      qryaux.open;
   except
      Exit;
   end;

   if qryaux.isempty then
      sVlSaldoCont := sVlMovReal
   else
   begin
      qryaux.Last;

      if (qryaux.FieldByName('IDEVENTOGERADOR').AsString = '') and
         (qryaux.FieldByName('IDBENEFICIO').AsString = '') and
         (qryaux.FieldByName('IDCONTRIBUICAO').AsString = '') and
         (qryaux.FieldByName('VLRCOTAS').AsFloat <= 0) then //o último lançamento foi uma atualização monetária
      begin
         sVlSaldoCont := sVlMovReal;
      end
      else
      begin
         cAux := DecimalSeparator;
         DecimalSeparator := '.';
         case iFlgEntrada of
            0: sVlSaldoCont := floattostr(qryaux.fieldbyname('SALDOREALCONT').AsFloat - strtofloat(sVlMovReal));
            1: sVlSaldoCont := floattostr(strtofloat(sVlMovReal) + qryaux.fieldbyname('SALDOREALCONT').AsFloat);
         end;
         DecimalSeparator := cAux;
      end;
   end;


   qryaux.close;
   qryaux.sql.clear;
   qryaux.sql.add(
     ' INSERT INTO HISTMOVRESERVA(IDHISTRESERVA, IDTIPORESERVA,DATAALIMENTACAO,'+
     ' VLRREAL,VLRCOTAS,IDBENEFICIO,IDCONTRIBUICAO,IDEVENTOGERADOR,'+
     ' SALDOREAL, SALDOCOTAS, IDPLANOPREV, IDPESSOA, IDPESSJUR, FLGENTRADA,IDREGRACALCULO,'+
     ' PERCENTUAL, SEQPROPOSTA,IDPARTICIPANTE,SALDOREALCONT,VALORINDICE,'+
     ' MESREFERENCIA,DATAMOV,NUMRECEBIMENTO,FLGPROCEDENCIA) '+  //INCLUI IDHSTFOLHABENEF DA VERSÃO EM NUMRECEBIMENTO
     ' VALUES('+sIdHist+','+sIdTipoReserva+ ',' +
     ' TO_DATE('''+ datetostr(datarefindice) + ''',''dd/mm/yyyy''),'+
     sVlMovReal+', '+sVlMovCotas+',');
   if sIdBeneficio = ''
   then qryaux.sql.add(' NULL, ')
   else qryaux.sql.add(sIdBeneficio  + ',');

   if Trim(sIdContribuicao) = ''
   then qryAux.SQL.Add(' NULL, ')
   else qryaux.sql.add(sIdContribuicao+',');

   if sIdEvento = ''
   then qryaux.sql.add(' NULL, ')
   else qryaux.sql.add(sIdEvento  + ',');

   qryaux.sql.add( OraNumero(sVlSaldoResAtual)+','+ OraNumero(sVlSaldoResCotas)+','+
                   sIdPlanoPrev+','+sIdPessoa+','+sIdPessJur+','+ IntToStr(iFlgEntrada)+','''+
                   sIdRegra+''','''+OraNumero(sPercentual)+''','+ sSeqProposta+','+
                   sidParticipante+','+ OraNumero(sVlSaldoCont)+','+OraNumero(sValorIndice)+ ' ,''' +
                   sMesReferencia + ''',SYSDATE,'+
     //INCLUI IDHSTFOLHABENEF DA VERSÃO EM NUMRECEBIMENTO
     //GRAVA FLGPROCEDENCIA = 2 PARA FOLHA
     inttostr(aidhstfolhabenef)+',2)');
   try
      qryaux.ExecSQL;
   except
      Exit;
   end;

   Result := True;
end;

procedure VerifIndiceHist(qryaux : twwquery;  var sIndice : String ; sIdPLanoPrev, sIdTipoReserva: String ; sDataCota : String);
begin
   //verifica histórico de índices de reservas
   //para o mês informado
   //vai pegar a última moeda cadastrada
   qryaux.Close;
   qryaux.sql.clear;
   qryaux.SQL.add(' SELECT  INDICEREAJUSTE '+
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
     exit;
   End;
   //se houver algum registro, que dizer que já houve
   //miudança no cadastro de índice
   //então pego o primeiro registro e troco o id da função
   if not qryaux.isempty then
      sIndice := qryaux.fieldbyname('INDICEREAJUSTE').AsString;

end;

function EstornaAlimentacaoReserva(
  aqryAux1, aqryAux2: twwquery;
  aidtitular: integer;
  aidhstfolhabenef: integer;
  asmespag: string): boolean;
var lssql: string;
begin
  result:=false;
  try
    lssql:=
      'SELECT IDPLANOPREV, IDPESSJUR, IDTIPORESERVA, IDPESSOA, SEQPROPOSTA, '+_clinefeed+
      '       SUM(DECODE(FLGENTRADA,1,-VLRCOTAS,0,VLRCOTAS,0)) AS VALOR '+_clinefeed+
      'FROM HISTMOVRESERVA '+_clinefeed+
      'WHERE IDPESSOA = '+inttostr(aidtitular)+' '+_clinefeed+
      'AND NUMRECEBIMENTO = '+inttostr(aidhstfolhabenef)+' '+_clinefeed+
      'AND IDBENEFICIO IN ('+_clinefeed+
      '  SELECT DISTINCT IDBENEFICIO '+_clinefeed+
      '  FROM HSTBENEFBFCIARIO '+_clinefeed+
      '  WHERE IDTITULAR = '+inttostr(aidtitular)+' '+_clinefeed+
      '  AND IDHSTFOLHABENEF = '+inttostr(aidhstfolhabenef)+' '+_clinefeed+
      '  AND MES = '+quotedstr(asmespag)+' '+_clinefeed+
      ')'+_clinefeed+
      'GROUP BY IDPLANOPREV, IDPESSJUR, IDTIPORESERVA, IDPESSOA, SEQPROPOSTA '+_clinefeed;
    aqryAux1.close;
    aqryAux1.sql.clear;
    aqryAux1.sql.add(lssql);
    aqryAux1.open;
    while not aqryAux1.eof do
    begin
      //faz update na reservapart
      lssql:=
        'UPDATE RESERVAPART '+_clinefeed+
        'SET VALORRESERVA = VALORRESERVA + '+
          oranumero(floattostr(aqryAux1.fieldbyname('VALOR').asfloat))+' '+_clinefeed+
        'WHERE IDPESSOA = '+inttostr(aidtitular)+' '+_clinefeed+
        'AND IDTIPORESERVA = '+inttostr(aqryAux1.fieldbyname('IDTIPORESERVA').asinteger)+' '+_clinefeed+
        'AND SEQPROPOSTA = '+inttostr(aqryAux1.fieldbyname('SEQPROPOSTA').asinteger)+' '+_clinefeed+
        'AND IDPESSJUR = '+inttostr(aqryAux1.fieldbyname('IDPESSJUR').asinteger)+' '+_clinefeed+
        'AND IDPLANOPREV = '+inttostr(aqryAux1.fieldbyname('IDPLANOPREV').asinteger)+' '+_clinefeed;
      aqryAux2.close;
      aqryAux2.sql.clear;
      aqryAux2.sql.add(lssql);
      aqryAux2.execsql;

      //elimina a histmovreserva
      lssql:=
        'DELETE FROM HISTMOVRESERVA '+_clinefeed+
        'WHERE IDPESSOA = '+inttostr(aidtitular)+' '+_clinefeed+
        'AND IDTIPORESERVA = '+inttostr(aqryAux1.fieldbyname('IDTIPORESERVA').asinteger)+' '+_clinefeed+
        'AND SEQPROPOSTA = '+inttostr(aqryAux1.fieldbyname('SEQPROPOSTA').asinteger)+' '+_clinefeed+
        'AND IDPESSJUR = '+inttostr(aqryAux1.fieldbyname('IDPESSJUR').asinteger)+' '+_clinefeed+
        'AND IDPLANOPREV = '+inttostr(aqryAux1.fieldbyname('IDPLANOPREV').asinteger)+' '+_clinefeed+
        'AND NUMRECEBIMENTO = '+inttostr(aidhstfolhabenef)+' '+_clinefeed+
        'AND IDBENEFICIO IN ('+_clinefeed+
        '  SELECT DISTINCT IDBENEFICIO '+_clinefeed+
        '  FROM HSTBENEFBFCIARIO '+_clinefeed+
        '  WHERE IDTITULAR = '+inttostr(aidtitular)+' '+_clinefeed+
        '  AND IDHSTFOLHABENEF = '+inttostr(aidhstfolhabenef)+' '+_clinefeed+
        '  AND MES = '+quotedstr(asmespag)+' '+_clinefeed+
        ')'+_clinefeed;
      aqryAux2.close;
      aqryAux2.sql.clear;
      aqryAux2.sql.add(lssql);
      aqryAux2.execsql;

      aqryAux1.next;
    end;
    result:=true;
  except
  end;
end;

end.
