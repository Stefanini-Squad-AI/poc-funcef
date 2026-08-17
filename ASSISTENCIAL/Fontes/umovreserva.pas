
unit UMovReserva;

interface

uses
  Db, DBTables, Wwquery, Windows, Messages, SysUtils, Classes, Graphics,
  Controls, Forms, Dialogs, URegra,
  Machklb,Registry,checklst,stdctrls,  UdataBase, uAutorizacao, uSistema,Math, uParticipante ;


function MoveReserva(var sIdevento, sIdpessoa , sSeqPropostaorig, sNomeParticipante : String ; sIdbeneficio : String;
                     qrymov : twwquery ;  Regra : TRegra ;  serro : tmemo ;
                     sIdPessjurorig,sIdplanoOrig,sIdTipoReservaorig,
                     sIdPessjurdest,sIdplanodest,sIdTipoReservadest : String; var bIntegraContab : boolean ;
                     sValorMov : String ; DataRefMov : TDate ;  sSeqPropostadest, sNumProcesso, sTipoPrevidencia, sDtDireito : String;
                     iTotalBeneficiarios : Integer; rValorInfInss : Double; DataRefIndice : TDate  ) : Integer;
                     {result:
                     0 --> Não há cadastro de padrão de movimentaçào
                     1 --> Erro em alguns movimentos
                     2 --> Não deu erro
                     3 --> Todas erradas}

function AlimentaHistorico( qryaux : Twwquery;  var sIdpessjur, sIdplanoprev, sIdtiporeserva, sIdpessoa,sSeqProposta,
                           sVlMovCotas, sVlSaldoResCotas: String ;
                           sIdbeneficio, sIdContribuicao, sIdEvento, sIdRegra : String; iFlgEntrada : Integer
                           ; Data : Tdate ; bExcedente : Boolean ; DataRefIndice : TDate ; var sIdParticipante : String   ) : Boolean;

function VoltaValorCotacao(qryaux : Twwquery ; sIndiceReajuste, sDataMov : String) : Double;

function VoltaValorCotExato(qryaux : Twwquery ; sIndiceReajuste, sDataMov : String ; var dValorCotacao : Double ; var DataCotacao : String) : Integer;


function VerificaCamposObrigContab( qryaux , qrycontab, qrycontabplano : Twwquery ;var sIncompl : string) : boolean;

//funções de auxílio a converção
function TruncaRound(f:String;n:integer):string;
function Truncar(f:Double;n:integer):string;
function ArredondaValor(Valor : String) : Extended;

var
   IUnidnegoc : Integer;
   sUnidnegoc : String;
   sIndiceMoedaCorrente : String;
   sDataref : String;


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
function VoltaValorCotacao(qryaux : Twwquery ; sIndiceReajuste, sDataMov : String) : Double;
var cAux : char ;
begin
 //transformar o número de cotas da reserva em moeda
 qryaux.Close;
 qryaux.sql.clear;
 qryaux.SQL.add('SELECT  COTVALOR '+
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
   exit;
 end
 else
 begin
    cAux := DecimalSeparator;
    DecimalSeparator := '.';
    result := strtofloat(truncaround(qryaux.fieldbyname('COTVALOR').AsString,6));
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
function AlimentaHistorico(qryaux : Twwquery;  var sIdpessjur, sIdplanoprev, sIdtiporeserva, sIdpessoa, sSeqProposta,
                           sVlMovCotas, sVlSaldoResCotas: String ;
                           sIdbeneficio, sIdContribuicao, sIdEvento, sIdRegra : String; iFlgEntrada : Integer
                           ; Data : TDate ; bExcedente : Boolean;  DataRefIndice : TDate ; var sIdParticipante : String ) : Boolean;
var
   sIdHist : String;
   cAux : char;
   sPercentual,sValorIndice : String;
   sVlMovReal , sVlSaldoResAtual, sIndiceReajuste,sVlSaldoCont : String;
begin
   Result := False;

   //desconsiderar valor nulo
   cAux := DecimalSeparator;
   DecimalSeparator := '.';
   if strtofloat(sVlMovCotas) <= 0 then
   begin
      result :=true;
      exit;
   end;
   DecimalSeparator := cAux;

   sIdHist := inttostr(LeUltRegistro(qryaux,'HISTMOVRESERVA'));

   //if sIdRegra = '' then exit;
   if sIdpessjur = '' then exit;
   if sIdplanoprev = '' then exit;
   if sIdtiporeserva = '' then exit;
   //if sIdParticipante = '' then exit;
   //if sIdpessoa = '' then exit;
   //if sVlMovReal = '' then exit;
   if sVlMovCotas = '' then exit;
   //if sVlSaldoResAtual = '' then exit;
   if sVlSaldoResCotas = '' then exit;
   if (iFlgEntrada <> 0) and (iFlgEntrada <> 1) then exit;

   qryaux.close;
   if not (sIdContribuicao = '') then
   begin
      qryaux.close;
      qryaux.sql.clear;
      qryaux.sql.add(' SELECT PERCENTUAL FROM RESERVAXCONTRIB WHERE '+
                     ' IDCONTRIBUICAO = '''+sIdContribuicao+''' '+
                     ' AND IDTIPORESERVA = '''+sIdtiporeserva+''' '+
                     ' AND IDPLANOPREV = '''+sIdplanoprev+''' ');
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

   cAux := DecimalSeparator;
   DecimalSeparator := ',';
   sValorIndice := floattostr(VoltaValorCotacao(qryaux,sIndiceReajuste,datetostr(datarefindice)));
   DecimalSeparator := cAux;

   if pos(',',sVlMovCotas) > 0 then
   begin
      cAux := DecimalSeparator;
      DecimalSeparator := ',';
      sVlMovReal := floattostr(strtofloat(sVlMovCotas) *
      VoltaValorCotacao(qryaux,sIndiceReajuste,datetostr(datarefindice)) );
      DecimalSeparator := cAux;
   end
   else //if pos('.',sVlMovCotas) > 0 then
   begin
      cAux := DecimalSeparator;
      DecimalSeparator := '.';
      sVlMovReal := floattostr(strtofloat(sVlMovCotas) *
      VoltaValorCotacao(qryaux,sIndiceReajuste,datetostr(datarefindice)) );
      DecimalSeparator := cAux;
   end;

   if pos(',',sVlSaldoResCotas) > 0 then
   begin
      cAux := DecimalSeparator;
      DecimalSeparator := ',';
      sVlSaldoResAtual := floattostr(strtofloat(sVlSaldoResCotas) *
      VoltaValorCotacao(qryaux,sIndiceReajuste,datetostr(datarefindice)) );
      DecimalSeparator := cAux;
   end
   else //if pos('.',sVlSaldoResCotas) > 0 then
   begin
      cAux := DecimalSeparator;
      DecimalSeparator := '.';
      sVlSaldoResAtual := floattostr(strtofloat(sVlSaldoResCotas) *
      VoltaValorCotacao(qryaux,sIndiceReajuste,datetostr(datarefindice)) );
      DecimalSeparator := cAux;
   end;


   //se estiver com os tres identificadores em branco, considero que é
   //devido a uma atualização monetária
   //if ((sIdbeneficio = '') and  (sIdContribuicao = '') and  (sIdEvento = '')) then exit;

   cAux := DecimalSeparator;
   try
      if DecimalSeparator = ',' then
      begin
         if pos(',',sVlMovReal) > 0 then
         sVlMovReal := truncaround(sVlMovReal,2);
         if pos(',',sVlMovCotas) > 0 then
         sVlMovCotas := truncaround(sVlMovCotas,6);
         if pos(',',sVlSaldoResAtual) > 0 then
         sVlSaldoResAtual := truncaround(sVlSaldoResAtual,6);
         if pos(',',sVlSaldoResCotas) > 0 then
         sVlSaldoResCotas := truncaround(sVlSaldoResCotas,2);
      end;
   finally
      DecimalSeparator := '.';
      if pos('.',sVlMovReal) > 0 then
      sVlMovReal := truncaround(sVlMovReal,2);
      if pos('.',sVlMovCotas) > 0 then
      sVlMovCotas := truncaround(sVlMovCotas,6);
      if pos('.',sVlSaldoResAtual) > 0 then
      sVlSaldoResAtual := truncaround(sVlSaldoResAtual,2);
      if pos('.',sVlSaldoResCotas) > 0 then
      sVlSaldoResCotas := truncaround(sVlSaldoResCotas,6);
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
                  ' WHERE '+
                  ' (IDPLANOPREV = '+sidplanoprev+') '+
                  ' AND (IDPESSJUR = '+sidpessjur+') '+
                  ' AND (IDTIPORESERVA = '+sIdTipoReserva+') '+
                  ' AND (SEQPROPOSTA IN(NULL,'''+sSeqProposta+''')) '+
                  ' AND (IDPESSOA IN(NULL,'''+sidpessoa+''')) '+
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
   qryaux.sql.add(' INSERT INTO HISTMOVRESERVA(IDHISTRESERVA, IDTIPORESERVA,DATAMOV,'+
                  ' VLRREAL,VLRCOTAS,IDBENEFICIO,IDCONTRIBUICAO,IDEVENTOGERADOR,'+
                  ' SALDOREAL, SALDOCOTAS, IDPLANOPREV, IDPESSOA, IDPESSJUR, FLGENTRADA,IDREGRACALCULO,'+
                  ' PERCENTUAL, SEQPROPOSTA,IDPARTICIPANTE,SALDOREALCONT,VALORINDICE) '+
                  ' VALUES('+sIdHist+','+sIdTipoReserva+',SYSDATE,'+sVlMovReal+','+
                  ' '+sVlMovCotas+','''+sIdBeneficio+''','''+sIdContribuicao+''','+
                  ' '''+sIdEvento+''','+sVlSaldoResAtual+','+
                  ' '+sVlSaldoResCotas+','+sIdPlanoprev+','''+sIdpessoa+''','+sIdpessjur+','+
                  ' '+inttostr(iFlgEntrada)+','''+sIdRegra+''','''+sPercentual+''','+
                  ' '''+sSeqProposta+''','''+sidParticipante+''','+sVlSaldoCont+','+sValorIndice+') ');
   try
      qryaux.ExecSQL;
   except
      Exit;
   end;

   Result := True;
end;


//função principal-------------------------------------------------------------//

function MoveReserva(var sIdevento, sIdPessoa , sSeqPropostaOrig, sNomeParticipante : String ; sIdbeneficio : String;
                     qrymov : twwquery ; Regra : TRegra ;  serro : tmemo ;
                     sIdPessjurorig,sIdplanoOrig,sIdTipoReservaorig,
                     sIdPessjurdest,sIdplanodest,sIdTipoReservadest : String ; var bIntegraContab : boolean
                     ; sValorMov : String ; DataRefMov : TDate ; sSeqPropostaDest, sNumProcesso, sTipoPrevidencia, sDtDireito : String;
                     iTotalBeneficiarios : Integer; rValorInfInss : Double; DataRefIndice : TDate  ) : Integer;
var
   qryaux, qryregrain, qryreserva, qryauxcontab, qrytitular : twwquery;
   sIdpatroorig ,
   sIdpatrodest,
   sIdplanoprevorig,
   sIdplanoprevdest,
   sIdreservaorig,
   sIdreservadest,
   sIdregra,
   sIdregraValidacao ,
   sValorReserva ,
   sValorReservaDestino,
   sIndiceReajusteDestino,
   sValorResultado ,
   sIndiceReajuste ,
   sMesRef, sidpess : String;
   Tipo : String[1];
   sValorMoedaCorrente ,
   sValorRegraCotas,
   sValorReservaReal ,
   sValorRegracotasDestino ,
   sValorReservaRealDestino, sIncompl , sValorMovOriginal: String;
   bErro, bLista : boolean;
   Contador , ordem: Integer;
   cAux : char;
   sIdreservaaux : String;
   bAtualizaOrigem    : boolean;
   sDataAux : String;
   iTransCertas : Integer;

   //contabilidade
   plano,placontad ,placontac,
   unidnegoc, codcentrorespon,
   idempresaprop,idempresa,
   codsubconta,codcentrocustod,
   codcentrocustoc,
   matricula , inscricao,
   MesRef, mescobranca, dataref, sOpcoes : string ;
   valor : String;
   liperiodo,liexercicio,liempresa : longint;
   IdLote : Integer ;
   CodPortForm, sSeqProposta, sOpBenef : String;

//-------------------------------cálcula anomes anterior-----------------------//
   function SAnoMesAnterior(sAnoMes : string) : string;
   var iAno, iMes : integer;
      function AnoMesAnterior(iMes, iAno : integer) : string;
      var sAnoMes : string;
      begin
        Result := '';
        if iMes = 1
        then begin
           sAnoMes := IntToStr(iAno-1)+'/';
           sAnoMes := sAnoMes+'12';
        end
        else begin
          sAnoMes := IntToStr(iAno)+'/';
          iMes := iMes - 1;
          if iMes <= 9
          then sAnoMes := sAnoMes+'0'+IntToStr(iMes)
          else sAnoMes := sAnoMes+IntToStr(iMes);
        end;
        Result := sAnoMes;
      end;//AnoMesAnterior
   begin
      Result := '';
      iAno := StrToInt(Copy(sAnoMes,1,4));
      iMes := StrToInt(Copy(sAnoMes,6,2));
      Result := AnoMesAnterior(iMes,iAno);
   end;


//-------------------------------------//--------------------------------------//
   procedure PreencherQryIn(sValorReserva,sIndicereajuste,sValorReservaDestino,sIndiceReajusteDestino : String;Validacao: boolean);
   var sValorReal ,
       sValorMovCotasOrigem,
       sValorMovCotasDestino,
       sValorRealReservaDestino,
       sDataUltTransfOrig, sDataUltResgateOrig,
       sDataCarenciaOrig, sInscricaoDataOrig,
       sDataUltTransfDest, sDataUltResgateDest,
       sDataCarenciaDest, sInscricaoDataDest, sSql, sFlgBenefMin : String;
       cAux : char;
       sUltimoBeneficio,
       sSALPART,
       sREMTOTAL,
//       sValor, // CAMILLE - REFER - 15.03.99
       sIDTPPAGTOANT, // CAMILLE - REFER - 08.04.1999
       sValorINSS,
       sDataInscFund,
       sValorReservaTot, sMesReferencia: string;
   begin

   sDataUltTransfOrig := '';
   sDataUltResgateOrig := '';
   sDataCarenciaOrig := '';
   sInscricaoDataOrig := '';
   sDataUltTransfDest := '';
   sDataUltResgateDest := '';
   sDataCarenciaDest := '';
   sInscricaoDataDest := '';
   sFlgBenefMin := '';

   //pega dados da origem para regra
   qryaux.close;
   qryaux.sql.Clear;
   qryaux.sql.add(' SELECT DATACARENCIA, INSCRICAODATA FROM PARTPREVPLAN '+
                  ' WHERE (IDPLANOPREV = '+sidplanoprevorig+') '+
                  ' AND (IDPESSOA = '+sidpessoa+') '+
                  ' AND (IDPESSJUR = '+sidpatroorig+') '+
                  ' AND (SEQPROPOSTA = '+sseqpropostaorig+') ');
   try
      qryaux.open;
      sDataCarenciaOrig  := copy(qryaux.fieldbyname('DATACARENCIA').AsString,1,10);
      sInscricaoDataOrig := copy(qryaux.fieldbyname('INSCRICAODATA').AsString,1,10);
   except
   end;


   //pega a data da última transferência de reserva
   qryaux.close;
   qryaux.sql.Clear;
   qryaux.sql.add(' SELECT MAX(DATAMOV) DATAMOV '+
                  ' FROM HISTMOVRESERVA H, EVENTOGERADOR E '+
                  ' WHERE '+
                  ' (E.IDEVENTOGERADOR = H.IDEVENTOGERADOR) '+
                  ' AND (E.FLGINTERNO = ''TR'') '+
                  ' AND (H.IDPESSOA = '+sidpess+') '+
                  ' AND (H.IDPLANOPREV =  '+sidplanoprevorig+') '+
                  ' AND (H.IDPESSJUR = '+sidpatroorig+') '+
                  ' AND (H.SEQPROPOSTA = '+sseqpropostaorig+') ');
   try
      qryaux.open;
      sDataUltTransfOrig := copy(qryaux.fieldbyname('DATAMOV').AsString,1,10);
   except
   end;


   //pega a data da última transferência de reserva
   qryaux.close;
   qryaux.sql.Clear;
   qryaux.sql.add(' SELECT MAX(DATAMOV) DATAMOV '+
                  ' FROM HISTMOVRESERVA H, EVENTOGERADOR E '+
                  ' WHERE '+
                  ' (E.IDEVENTOGERADOR = H.IDEVENTOGERADOR) '+
                  ' AND (E.FLGINTERNO = ''RP'') '+
                  ' AND (H.IDPESSOA = '+sidpess+') '+
                  ' AND (H.IDPLANOPREV =  '+sidplanoprevorig+') '+
                  ' AND (H.IDPESSJUR = '+sidpatroorig+') '+
                  ' AND (H.SEQPROPOSTA = '+sseqpropostaorig+') ');
   try
      qryaux.open;
      sDataUltResgateOrig := copy(qryaux.fieldbyname('DATAMOV').AsString,1,10);
   except
   end;


   //pega dados do destino para regra
   qryaux.close;
   qryaux.sql.Clear;
   qryaux.sql.add(' SELECT DATACARENCIA, INSCRICAODATA FROM PARTPREVPLAN '+
                  ' WHERE (IDPLANOPREV = '+sidplanoprevdest+') '+
                  ' AND (IDPESSOA = '+sidpessoa+') '+
                  ' AND (IDPESSJUR = '+sidpatrodest+')');
                  if sseqpropostadest <> '' then
                  qryaux.sql.add(' AND (SEQPROPOSTA = '+sseqpropostadest+') ');
   try
      qryaux.open;
      sDataCarenciaDest  := copy(qryaux.fieldbyname('DATACARENCIA').AsString,1,10);
      sInscricaoDataDest := copy(qryaux.fieldbyname('INSCRICAODATA').AsString,1,10);
   except
   end;


   //pega a data da última transferência de reserva
   qryaux.close;
   qryaux.sql.Clear;
   qryaux.sql.add(' SELECT MAX(DATAMOV) DATAMOV '+
                  ' FROM HISTMOVRESERVA H, EVENTOGERADOR E '+
                  ' WHERE '+
                  ' (E.IDEVENTOGERADOR = H.IDEVENTOGERADOR) '+
                  ' AND (E.FLGINTERNO = ''TR'') '+
                  ' AND (H.IDPESSOA = '+sidpess+') '+
                  ' AND (H.IDPLANOPREV =  '+sidplanoprevdest+') '+
                  ' AND (H.IDPESSJUR = '+sidpatrodest+') ');
                  if sseqpropostadest <> '' then
                  qryaux.sql.add(' AND (SEQPROPOSTA = '+sseqpropostadest+') ');
   try
      qryaux.open;
      sDataUltTransfDest := copy(qryaux.fieldbyname('DATAMOV').AsString,1,10);
   except
   end;


   //pega a data do ultimo resgate
   qryaux.close;
   qryaux.sql.Clear;
   qryaux.sql.add(' SELECT MAX(DATAMOV) DATAMOV '+
                  ' FROM HISTMOVRESERVA H, EVENTOGERADOR E '+
                  ' WHERE '+
                  ' (E.IDEVENTOGERADOR = H.IDEVENTOGERADOR) '+
                  ' AND (E.FLGINTERNO = ''RP'') '+
                  ' AND (H.IDPESSOA = '+sidpess+') '+
                  ' AND (H.IDPLANOPREV =  '+sidplanoprevdest+') '+
                  ' AND (H.IDPESSJUR = '+sidpatrodest+') ');
                  if sseqpropostadest <> '' then
                  qryaux.sql.add(' AND (SEQPROPOSTA = '+sseqpropostadest+') ');
   try
      qryaux.open;
      sDataUltResgateDest := copy(qryaux.fieldbyname('DATAMOV').AsString,1,10);
   except
   end;


   if sValorReserva = '' then
   sValorReserva := '0';

   if sIndiceReajuste = '' then
   sIndiceReajuste := '0';

   if sValorReservaDestino = ''
   then sValorReservaDestino := '0';

   if sIndiceReajusteDestino = ''
   then sIndiceReajusteDestino := '0';

   //testa se o valor veio nulo
   //só que  em um formato diferente : 0.00 , 0,00 , 0.0000 ...
   try
      sValorMov := oranumero(sValorMov);
      cAux := DecimalSeparator;
      DecimalSeparator := '.';
      if strtofloat(sValorMov) = 0 then
      sValorMov := '0';
      DecimalSeparator := cAux;
   except
   end;

   if pos(',',sValorReservaDestino) > 0 then
   begin
      sValorReservaDestino := oranumero(sValorReservaDestino);
   end;

   if pos(',',sValorReserva) > 0 then
   begin
      sValorReserva := oranumero(sValorReserva);
   end;

   //verifica se a movimentação usa uma reserva de origem
   //diferente
   //se usa guarda o valor a transferir, que deve ser retirado da
   //origem, e marca o flg de atualizaçào
   //senão marca o flg para não atualizar e não atualiza o valor
   if sIdreservaOrig <> sIdreservaaux then
   begin
      sIdreservaaux := sIdreservaOrig;
      if (sValorMov <> '0')  then  //sValorMov := sValorReal
      else
      begin
          bAtualizaOrigem := False;
          //transforma o valor em cotas, foi passado em moeda
          sValorMov := trim(sValorMov);
          if pos(',',sValorMov) > 0 then
          begin
              sValorMov := oranumero(sValorMov);
          end;

       end;
     end
     else
     begin
        //bAtualizaOrigem := false;
     end;

     cAux := DecimalSeparator;
     DecimalSeparator := '.';
     try
        sValorRealReservaDestino := truncaround(floattostr(strtofloat(sValorReservaDestino)*VoltaValorCotacao(qryaux,sIndiceReajusteDestino,datetostr(DataRefIndice))),2);
        sValorMovCotasOrigem := truncaround(floattostr(strtofloat(sValorMov)/VoltaValorCotacao(qryaux,sIndiceReajuste,datetostr(DataRefIndice))),6);
        sValorMovCotasDestino := truncaround(floattostr(strtofloat(sValorMov)/VoltaValorCotacao(qryaux,sIndiceReajusteDestino,datetostr(DataRefIndice))),6);
     except
     end;
     sValorReal := truncaround(floattostr(strtofloat(sValorReserva)*VoltaValorCotacao(qryaux,sIndiceReajuste,datetostr(DataRefIndice))),2);
     DecimalSeparator := cAux;


     if sIdbeneficio = '' then//se não envolve um benefício
     begin

        if sValorMov = '' then sValorMov := '0';
        if sValorMovCotasOrigem = '' then sValorMovCotasOrigem := '0';
        if sValorMovCotasDestino = '' then sValorMovCotasDestino := '0';
        if sValorRealReservaDestino = '' then sValorRealReservaDestino := '0';

        qryregrain.close;
        qryregrain.sql.clear;
        qryregrain.sql.add('SELECT '+sValorReserva+' VALORRESERVAORIGEM,'''+sDataUltResgateOrig+''' DATAULTRESGATEORIG, '+
                           ''''+sDataUltResgateDest+''' DATAULTRESGATEDEST, '''+sDataUltTransfOrig+''' DATAULTTRANSFORIG,'+
                           ''''+sDataUltTransfDest+''' DATAULTTRANSFDEST,'+
                           ''''+sDataCarenciaOrig+''' DATACARENCIAORIG,'''+sDataCarenciaDest+''' DATACARENCIADEST, '+
                           ''''+sInscricaoDataOrig+''' DATAINSCRICAOORIG,'''+sInscricaoDataDest+''' DATAINSCRICAODEST,'+
                           ''+sIndiceReajuste+' INDICEREAJUSTEORIGEM,'+
                           ''+sValorMov+' VALORMOV,'+sValorMovCotasOrigem+' VALORMOVCOTASORIGEM,'+sValorMovCotasDestino+' VALORMOVCOTASDESTINO ,'+
                           ''''+sDataRef+''' DATAREF, '+
                           ''+sValorReal+' VALORREALRESERVAORIGEM , '+sValorReservaDestino+' VALORRESERVADESTINO, '+
                           ''+sIndiceReajusteDestino+' INDICEREAJUSTEDESTINO ,'+sValorRealReservaDestino+' VALORREALRESERVADESTINO '+
                           ' FROM DUAL');
        qryregrain.open;
     end
     else//se envolve um benefício, então traz dados atuariais do benefício
     begin

        //monta dados para query de entrada da regra
        qrytitular.close;
        qrytitular.sql.clear;
        qrytitular.sql.add('SELECT DISTINCT PESSOA.NOME AS TITULAR, PATRO.NOME AS PATRO, '+
                           '        PLANPREV.NOME AS PLANO, ELEGPATRO.MATRICULA, BENEFICIO.NOME AS BENEFICIO, BENEFICIO.FLGDESTBENEF, '+
                           '        BENEFICIO.FLGASSOCBENEFREF, BF.IDTITULAR, BF.IDPESSJUR, BF.IDPLANOPREV, BF.NUMEROPROCESSO, BF.IDBENEFICIO, '+
                           '        PP.VALORCALCINSS, PP.VALORINFINSS, PP.FLGDEVEEMPRESTIMO, PP.FLGDEVEASSISTENC, '+
                           '        PP.FLGDEVEPREVIDENC, PB.DTEVENTO, PB.DTDIREITO, '+
                           '        EG.NOME AS EVENTOGERADOR, EG.FLGINTERNO, EG.IDEVENTOGERADOR, ELEGPATRO.TEMPOSERVANTREAL, '+
                           '        BP.IDREGRAPAGAMENTO, BP.IDREGRACALCULO, PP.SEQPROPOSTA '+
                           ' FROM  BENEFBFCIARIO BF, PESSOA, PESSOA PATRO, PLANPREV, '+
                           '       ELEGPATRO, BENEFICIO, PARTPREVPLAN PP, PROCESSOBENEF PB, '+
                           '       EVENTOGERADOR EG, BENEFPLANPREV BP '+
                           ' WHERE (BF.NUMEROPROCESSO = '''+sNumProcesso+''') AND '+
                           '       (BF.IDTITULAR = '''+sIdpessoa+''') AND '+
                           //'       BF.IDPESSOA = '''+sIbbeneficiario+''' AND '+
                           '       (BF.IDBENEFICIO = '''+sIdBeneficio+''') AND '+
                           '       (BF.IDPLANOPREV = '''+sIdplanoprevorig+''') AND '+
                           '       (BF.IDPESSJUR = '''+sIdPatroorig+''') AND '+
                           '       (BF.IDSITBENEFICIO = 4) AND '+
                           '       (BF.IDTITULAR = PESSOA.IDPESSOA) AND '+
                           '       (BF.IDPESSJUR = PATRO.IDPESSOA) AND '+
                           '       (BF.IDPLANOPREV = PLANPREV.IDPLANOPREV) AND '+
                           '       (BF.IDPESSJUR = ELEGPATRO.IDPESSJUR) AND '+
                           '       (BF.IDTITULAR = ELEGPATRO.IDPESSOA) AND '+
                           '       (BF.IDBENEFICIO = BENEFICIO.IDBENEFICIO) AND '+
                           '       (BP.IDPLANOPREV = BF.IDPLANOPREV) AND '+
                           '       (BP.IDBENEFICIO = BF.IDBENEFICIO) AND '+
                           '       (BF.IDPESSJUR   = PP.IDPESSJUR)   AND '+
                           '       (BF.IDPLANOPREV = PP.IDPLANOPREV) AND '+
                           '       (BF.IDTITULAR   = PP.IDPESSOA) AND '+
                           '       (BF.NUMEROPROCESSO = PB.NUMEROPROCESSO) AND '+
                           '       (PB.IDEVENTOGERADOR = EG.IDEVENTOGERADOR) ');
        qrytitular.open;

        sMesReferencia   := Copy(sdataref,7,4)+'/'+Copy(sdataref,4,2);

        if qryTitular.FieldByName('IDREGRAPAGAMENTO').AsString <> '' then //Executa regra para calcular valor da Reserva do Particip.
           sValorReservaTot := OraNumero(CalcReservaPart(qryTitular.FieldByName('IDPESSJUR').AsInteger,
                                                      qryTitular.FieldByName('IDPLANOPREV').AsInteger,
                                                      qryTitular.FieldByName('IDTITULAR').AsInteger,
                                                      qryTitular.FieldByName('IDREGRAPAGAMENTO').AsInteger,
                                                      qryTitular.FieldByName('SEQPROPOSTA').AsInteger,
                                                      sDataRef,
                                                      sdataref,
                                                      qryTitular.FieldByName('IDBENEFICIO').AsString,
                                                      qryAux))
        else //Calcula o valor total da soma das reservas do participante
           sValorReservaTot := OraNumero(CalcReservaPart(qryTitular.FieldByName('IDPESSJUR').AsInteger,
                                                      qryTitular.FieldByName('IDPLANOPREV').AsInteger,
                                                      qryTitular.FieldByName('IDTITULAR').AsInteger,
                                                      -1,
                                                      qryTitular.FieldByName('SEQPROPOSTA').AsInteger,
                                                      sDataRef,
                                                      sdataref,
                                                      qryTitular.FieldByName('IDBENEFICIO').AsString,
                                                      qryAux));

        {if reValorInfInss.Text <> '' then
           sValorINSS := OraNumero(FloatToStr(reValorInfInss.Value))
        else
           sValorINSS := '0';}


        sUltimoBeneficio := ORANUMERO(CalcUltimoBeneficio(qryTitular.FieldByName('IdPessJur').AsInteger,
                                      qryTitular.FieldByName('IdPlanoPrev').AsInteger,
                                      qryTitular.FieldByName('IdTitular').AsInteger,
                                      sMesReferencia,
                                      sIDTPPAGTOANT, // CAMILLE - REFER - 08.04.1999
                                      sFlgBenefMin,qryAux));

        sSALPART  := ORANUMERO(CalcSalPart(qryTitular.FieldByName('IdPessJur').AsInteger,
                                           qryTitular.FieldByName('IdTitular').AsInteger,
                                           SAnoMesAnterior(sMesReferencia),
                                           qryAux));
        sREMTOTAL := ORANUMERO(CalcREMTOTAL(qryTitular.FieldByName('IdPessJur').AsInteger,
                                           qryTitular.FieldByName('IdTitular').AsInteger,
                                           SAnoMesAnterior(sMesReferencia),
                                           qryAux));


       {Verifica Quant de Benficiarios}
       {for i := 0 to chkLstBeneficiario.Items.Count - 1 do
            begin
               if chkLstBeneficiario.checked[i] then
               Inc(iTotalBeneficiarios);
            end;}
       {Fim - Verifica Quant de Benficiarios}

        sDataInscFund := CalcDataInscFund(qryTitular.FieldByName('IdTitular').AsInteger,qryAux);

        if Trim(sDataInscFund) = ''
        then sDataInscFund := DateToStr(Date);

        if Trim(sValorINSS) = ''
        then sValorINSS := '0';

        if Trim(sSalPart) = ''
        then sSalPart := '0';

        if Trim(sRemTotal) = ''
        then sRemTotal := '0';

        if Trim(sValorReservaTot) = ''
        then sValorReservaTot := '0';

        if Trim(sUltimoBeneficio) = ''
        then sUltimoBeneficio := '0';

        if sTipoPrevidencia = 'F'
        then begin
            sSQL := ' SELECT PP.IDPESSOA, PP.IDPESSJUR, PP.IDPLANOPREV, PP.INSCRICAODATA, PP.IDSITPART, '+
                    ''+sValorReserva+' VALORRESERVAORIGEM,'''+sDataUltResgateOrig+''' DATAULTRESGATEORIG, '+
                    ''''+sDataUltResgateDest+''' DATAULTRESGATEDEST, '''+sDataUltTransfOrig+''' DATAULTTRANSFORIG,'+
                    ''''+sDataUltTransfDest+''' DATAULTTRANSFDEST,'+
                    ''''+sDataCarenciaOrig+''' DATACARENCIAORIG,'''+sDataCarenciaDest+''' DATACARENCIADEST, '+
                    ''''+sInscricaoDataOrig+''' DATAINSCRICAOORIG,'''+sInscricaoDataDest+''' DATAINSCRICAODEST,'+
                    ''+sIndiceReajuste+' INDICEREAJUSTEORIGEM,'+
                    ''+sValorMov+' VALORMOV,'+sValorMovCotasOrigem+' VALORMOVCOTASORIGEM,'+sValorMovCotasDestino+' VALORMOVCOTASDESTINO ,'+
                    ''''+sDataRef+''' DATAREF, '+
                    ''''+sIDTPPAGTOANT+''' AS IDTPPAGTOANT, '+ // CAMILLE - REFER - 08.04.1999
                    ''+sValorReal+' VALORREALRESERVAORIGEM , '+sValorReservaDestino+' VALORRESERVADESTINO, '+
                    ''+sIndiceReajusteDestino+' INDICEREAJUSTEDESTINO ,'+sValorRealReservaDestino+' VALORREALRESERVADESTINO, '+
                    ''''+sDataInscFund+''' AS INSCRICAODATAFUND  , PF.DATANASC,                    '+
                    '        EL.SALTOTAL, '+sValorINSS+' AS VALINSS,EL.TEMPOSERVANTERIOR,           '+
                    '        EL.TEMPONAOCREDITADO,'+sSALPART+' AS VALORPROVENTO, '+sREMTOTAL+' AS VALORREMTOTAL, '+
                    '        BPL.VALORBASE1,BPL.VALORBASE2,BPL.VALORBASE3, '+
                    '        SF.TIPOSIT,SF.IDSITFUNC, '+sValorReservaTot+' AS VALORRESERVATOTAL,            '+
                    sUltimoBeneficio+' AS VLBENEFPGTO, '+
                    ''''+sDtDireito+''' AS DATADIREITO,      '+
                    IntToStr(iTotalBeneficiarios) + ' AS NUMBENEF, '+sFlgBenefMin+' FLGBENEFMIN ' +
                    ' FROM   ELEGPATRO EL, PARTPREVPLAN PP, PESSOAFISICA PF,  SITFUNC SF, BENEFPLANOPART BPL  '+
                    ' WHERE  (PP.IDPESSOA    = ''' +sidpessoa+''') AND ' +
                    '        (PP.IDPESSJUR   = ''' +sidpatroorig+''') AND ' +
                    '        (PP.IDPLANOPREV = ''' +sidplanoprevorig+''') AND ' +
                    '        (PP.SEQPROPOSTA = ''' +sseqproposta+''') AND ' +
                    '        (EL.IDPESSOA    = PP.IDPESSOA)      AND                                 '+
                    '        (EL.IDPESSJUR   = PP.IDPESSJUR)     AND                                 '+
                    '        (PF.IDPESSOA    = EL.IDPESSOA)      AND                                 '+
                    '        (EL.IDSITFUNC   = SF.IDSITFUNC(+))  AND '+
                    '        (PP.IDPESSOA    = BPL.IDPESSOA(+))  AND '+
                    '        (PP.IDPESSJUR   = BPL.IDPESSJUR(+)) AND  '+
                    '        (PP.IDPLANOPREV = BPL.IDPLANOPREV(+)) AND ' +
                    ' ('+qryTitular.FieldByName('IDBENEFICIO').AsString+' = BPL.IDBENEFICIO(+)) ';
        end
        else begin
              sSQL := 'SELECT PRI.IDTITULAR, PRI.IDPESSOA,      PRI.IDPLANOPREV,  PRI.IDBENEFICIO,   '+
                      ''+sValorReserva+' VALORRESERVAORIGEM,'''+sDataUltResgateOrig+''' DATAULTRESGATEORIG, '+
                      ''''+sDataUltResgateDest+''' DATAULTRESGATEDEST, '''+sDataUltTransfOrig+''' DATAULTTRANSFORIG,'+
                      ''''+sDataUltTransfDest+''' DATAULTTRANSFDEST,'+
                      ''''+sDataCarenciaOrig+''' DATACARENCIAORIG,'''+sDataCarenciaDest+''' DATACARENCIADEST, '+
                      ''''+sInscricaoDataOrig+''' DATAINSCRICAOORIG,'''+sInscricaoDataDest+''' DATAINSCRICAODEST,'+
                      ''+sIndiceReajuste+' INDICEREAJUSTEORIGEM,'+
                      ''+sValorMov+' VALORMOV,'+sValorMovCotasOrigem+' VALORMOVCOTASORIGEM,'+sValorMovCotasDestino+' VALORMOVCOTASDESTINO ,'+
                      ''''+sDtDireito+''' DATADIREITO, '+
                      ''+sValorReal+' VALORREALRESERVAORIGEM , '+sValorReservaDestino+' VALORRESERVADESTINO, '+
                      ''+sIndiceReajusteDestino+' INDICEREAJUSTEDESTINO ,'+sValorRealReservaDestino+' VALORREALRESERVADESTINO, '+
                      'PES.DATANASC,         PES.SEXO,          PRI.PERCENTUAL,   DEP.IDDEPENDENCIA, PRI.PRIORIDADE, '+
                      'CON.IDCONTRIBUICAO,   PRO.INSCRICAODATA, PRO.INSCRICAODATA AS DATAREF,  '+
                      'PRO.REQUERIMENTODATA, CPP.DATAINICIO,                      CPP.DTPRIMPAGAMENTO,  '+
                      'CPP.IDADEINGRESSO,    CPP.IDADEINGCOMERCIAL,               CPP.IDADEINGREAL,     '+
                      'ELE.SALTOTAL,         ELE.SALTOTAL AS VALORPROVENTO,       CNT.IDREGRACALCULO,   '+
                      'CPP.PRAZODIFERIMENTO, PRO.IDSITPLANOPREV,  PRO.IDSITPART,  CPP.VLCONTREAL,       '+
                      'CPP.VLBENEFREAL,      CPP.VLRCONTDIGITADO, CPP.VLRCONTCALCULADO, CPP.VALORBASE1, '+
                      'CPP.VALORBASE2,       CPP.VALORBASE3,      BPP.VLBENEFDIGITADO,  BPP.VLBENEFCALCULADO, '+
                      'BPP.VALORBASE1,       BPP.VALORBASE2,      BPP.VALORBASE3,   '+
                      sValorReservaTot   +' AS VALORRESERVATOTAL,             '+
                      sUltimoBeneficio+' AS VLBENEFPGTO,              '+
                      ''''+sdtDireito+''' AS DATADIREITO, '+
                      IntToStr(iTotalBeneficiarios)  + '  AS NUMBENEF '+
                      'FROM   BFCIARIOTITPLAN PRI,                                  '+
                             'DEPENTIT        DEP,                                  '+
                             'PESSOAFISICA    PES,                                  '+
                             'ELEGPATRO       ELE,                                  '+
                             'CONTRIBUICAO    CON,                                  '+
                             'TPCONTRIBUICAO  TPC,                                  '+
                             'PARTPREVPLAN    PRO,                                  '+
                             'CONTPREV        CNT,                                  '+
                             'CONTRIBPREVPARTP  CPP,                             '+
                             'BENEFPLANOPART  BPP                                   '+
                      'WHERE  (PRI.IDPESSJUR   =   '''+sidpatroorig+''') '+
                      'AND    (PRI.IDPLANOPREV =   '''+sidplanoprevorig+''') '+
                      'AND    (PRI.IDTITULAR   =   '''+sidpessoa+''') '+
                      'AND    (PRI.SEQPROPOSTA =   '''+sseqpropostaorig+''') '+
                      'AND    (PRI.IDBENEFICIO =   '''+sidbeneficio +''') '+
                      'AND    (PRI.IDTITULAR   = DEP.IDTITULAR  )                     '+
                      'AND    (PRI.IDPESSOA    = DEP.IDPESSOA  )                      '+
                      'AND    (PRI.IDPESSOA    = PES.IDPESSOA  )                      '+
                      'AND    (PRI.IDPESSJUR   = ELE.IDPESSJUR )                      '+
                      'AND    (PRI.IDTITULAR   = ELE.IDPESSOA )                       '+
                      'AND    (PRI.IDPESSJUR      = PRO.IDPESSJUR )                   '+
                      'AND    (PRI.IDPLANOPREV    = PRO.IDPLANOPREV )                 '+
                      'AND    (PRI.IDTITULAR      = PRO.IDPESSOA )                    '+
                      'AND    (PRI.SEQPROPOSTA    = PRO.SEQPROPOSTA )                 '+
                      'AND    (CNT.IDCONTRIBUICAO = CON.IDCONTRIBUICAO )              '+
                      'AND    (CNT.IDPLANOPREV    = PRO.IDPLANOPREV )                 '+
                      'AND    (CPP.IDPESSJUR      = PRO.IDPESSJUR )                   '+
                      'AND    (CPP.IDPLANOPREV    = PRO.IDPLANOPREV)                  '+
                      'AND    (CPP.IDPESSOA       = PRO.IDPESSOA )                    '+
                      'AND    (CPP.SEQPROPOSTA    = PRO.SEQPROPOSTA)                  '+
                      'AND    (CPP.IDBENEFICIO    = PRI.IDBENEFICIO)                  '+
                      'AND    (CPP.IDCONTRIBUICAO = CNT.IDCONTRIBUICAO)               '+
                      'AND    (CON.IDTPCONTRIBUICAO = TPC.IDTPCONTRIBUICAO)           '+
                      'AND    (TPC.FLGGERABENEF   = 1 )                               '+
                      'AND    (BPP.IDPESSJUR      = CPP.IDPESSJUR )                   '+
                      'AND    (BPP.IDPLANOPREV    = CPP.IDPLANOPREV)                  '+
                      'AND    (BPP.IDPESSOA       = CPP.IDPESSOA)                     '+
                      'AND    (BPP.SEQPROPOSTA    = CPP.SEQPROPOSTA)                  '+
                      'AND    (BPP.IDBENEFICIO    = PRI.IDBENEFICIO)                  ';
        end;

        qryregrain.Close;
        qryregrain.Sql.Clear;
        qryregrain.Sql.Add(sSQL);
        try
           qryregrain.Open;
        except
           //erro
        end;

     end;
   end;

//-------------------------------------//--------------------------------------//
   function AtualizaReserva(sIdPatro,sIdreserva,sIdPlanoprev,sIdpessoa,sSeqProposta,
                            Tipo,sValorResultado, MesRef : String) : boolean;
   begin

      result := false;

      qryreserva.close;
      qryreserva.sql.clear;
      qryreserva.sql.add(' UPDATE RESERVAPART SET VALORRESERVA = '+sValorResultado+'  '+
                     ' WHERE (IDPLANOPREV = '''+sIdplanoprev+''') '+
                     ' AND (IDTIPORESERVA = '''+sIdreserva+''') '+
                     ' AND (IDPESSJUR = '''+sIdPatro+''') '+
                     ' AND (IDPESSOA = '''+sIdpessoa+''') '+
                     ' AND (SEQPROPOSTA = '''+sSeqProposta+''') ');
      try
         qryreserva.Execsql;
      except
         Exit;
      end;

      result := true;

   end;


//-------------------------------------//--------------------------------------//
   function EncontraReserva(sIdPatro,sIdreserva,sIdPlanoprev,sIdpessoa,sSeqProposta : String) : boolean;
   begin
      result := false;
      //pega reserva de origem
      qryaux.close;
      qryaux.sql.clear;
      qryaux.sql.add(' SELECT P.DATAREFERENCIASA, P.PERCENTUALSAQUE , P.VALORRESERVA, ''P'' TIPO ,'+
                     ' INDICEREAJUSTE, NOME ,'+
                     ' P.CODPORTFORMA ,P.CODCENTRORESPON,P.IDEMPRESAPROP, '+
                     ' P.CODSUBCONTA,P.UNIDNEGOC,P.PLANO,P.PLACONTAD,P.PLACONTAC, '+
                     ' P.IDEMPRESA,P.CODCENTROCUSTOD,P.CODCENTROCUSTOC, EL.MATRICULA, PV.INSCRICAONUMERO '+
                     ' FROM RESERVAPART P, RESERVAXPLANO R , MOEDA , ELEGPATRO EL, PARTPREVPLAN PV'+
                     ' WHERE (P.IDPLANOPREV = '''+sIdplanoprev+''') '+
                     ' AND (P.IDTIPORESERVA = '''+sIdreserva+''') '+
                     ' AND (P.IDPESSJUR = '''+sIdPatro+''') '+
                     ' AND (P.IDPESSOA = '''+sIdpessoa+''') '+
                     ' AND (P.SEQPROPOSTA = '''+sSeqProposta+''') '+
                     ' AND (FLGATIVO = 1) '+
                     ' AND (R.IDPLANOPREV = P.IDPLANOPREV)  '+
                     ' AND (EL.IDPESSOA =  P.IDPESSOA) '+
                     ' AND (EL.IDPESSJUR = P.IDPESSJUR) '+
                     ' AND (PV.IDPESSOA = P.IDPESSOA) '+
                     ' AND (PV.IDPESSJUR = P.IDPESSJUR) '+
                     ' AND (PV.IDPLANOPREV = P.IDPLANOPREV) '+
                     ' AND (R.IDTIPORESERVA = P.IDTIPORESERVA) '+
                     ' AND (INDICEREAJUSTE = MOEDA.MOECODIGO(+)) '+
                     ' UNION  '+
                     ' SELECT P.DATAREFERENCIASA, P.PERCENTUALSAQUE , P.VALORRESERVA, ''C'' TIPO , '+
                     ' INDICEREAJUSTE, NOME , '+
                     ' P.CODPORTFORMA ,P.CODCENTRORESPON,P.IDEMPRESAPROP, '+
                     ' P.CODSUBCONTA,P.UNIDNEGOC,P.PLANO,P.PLACONTAD,P.PLACONTAC, '+
                     ' P.IDEMPRESA,P.CODCENTROCUSTOD,P.CODCENTROCUSTOC, '''' MATRICULA, 0 INSCRICAONUMERO '+
                     ' FROM RESERVAPART P, RESERVAXPLANO R , MOEDA '+
                     ' WHERE (P.IDPLANOPREV = '''+sIdplanoprev+''') '+
                     ' AND (P.IDTIPORESERVA = '''+sIdreserva+''') '+
                     ' AND (P.IDPESSJUR = '''+sIdPatro+''') '+
                     ' AND (P.SEQPROPOSTA = '''+sSeqProposta+''') '+
                     ' AND (P.FLGATIVO = 1) '+
                     ' AND (P.IDPESSJUR = P.IDPESSOA) '+
                     //' AND P.IDPESSOA = '''+sIdpessoa+''' '+
                     ' AND (R.IDPLANOPREV = P.IDPLANOPREV) '+
                     ' AND (R.IDTIPORESERVA = P.IDTIPORESERVA) '+
                     ' AND (INDICEREAJUSTE = MOEDA.MOECODIGO(+)) ');
      qryaux.open;

      //se não for uma reserva do participante, procuara nas coletivas
      {if qryaux.IsEmpty then
      begin
         qryaux.close;
         qryaux.sql.clear;
         qryaux.sql.add(' SELECT H.VALORRESERVA, ''C'' TIPO ,'+
                        ' INDICEREAJUSTE, MESREFERENCIA, NOME ,  '+
                        ' H.CODPORTFORMA ,H.CODCENTRORESPON,H.IDEMPRESAPROP, '+
                        ' H.CODSUBCONTA,H.UNIDNEGOC,H.PLANO,H.PLACONTAD,H.PLACONTAC, '+
                        ' H.IDEMPRESA,H.CODCENTROCUSTOD,H.CODCENTROCUSTOC '+
                        ' FROM HISTRESERVACOLETIVA H, RESERVAXPLANO R , MOEDA '+
                        ' WHERE H.IDPLANOPREV = '''+sIdplanoprev+''' '+
                        ' AND H.IDTIPORESERVA = '''+sIdreserva+''' '+
                        ' AND H.IDPESSJUR = '''+sIdPatro+''' '+
                        ' AND H.IDPLANOPREV = R.IDPLANOPREV  '+
                        ' AND H.IDTIPORESERVA = R.IDTIPORESERVA '+
                        ' AND INDICEREAJUSTE = MOEDA.MOECODIGO ');
         qryaux.open;
      end;}

      if qryaux.IsEmpty then exit
         else result := true;
   end;

begin
   Result := 0;
   bErro  := false;
   //sErro.lines.clear;

   //testa se é um evento ligado a um benefício
   //e valida dados necessários
   if (sIdbeneficio <> '') then
   begin
      if (iTotalBeneficiarios  <=0) then
      sOpBenef := 'Número total de beneficiários';

      if (sNumProcesso = '') and (sOpBenef = '') then
      sOpBenef := 'Número do Processo'
      else if (sNumProcesso = '') and (sOpBenef <> '') then
      sOpBenef := sOpBenef+ ' ,Número do processo';

      if (sDtDireito = '') and (sOpBenef = '') then
      sOpBenef := 'Data de Direito do Benefício'
      else if (sDtDireito = '') and (sOpBenef <> '') then
      sOpBenef := sOpBenef +' ,Data de Direito do Benefício';

      if sOpBenef <> '' then
      begin
         sErro.Lines.add('      Parâmetros da movimentação de reserva não preenchidos ==> '+sOpBenef+'.');
         Exit;
      end;
   end;


   qryaux := twwquery.Create(Application);
   qryaux.DatabaseName := 'BaseDados';

   qryauxContab := twwquery.Create(Application);
   qryauxContab.DatabaseName := 'BaseDados';

   qryreserva := twwquery.Create(Application);
   qryreserva.DatabaseName := 'BaseDados';

   qryregrain := twwquery.Create(Application);;
   qryregrain.DatabaseName := 'BaseDados';

   qrytitular := twwquery.Create(Application);;
   qrytitular.DatabaseName := 'BaseDados';

   Regra.DatabaseName := 'BaseDados';
   Regra.QueryIn := qryregrain;

   IdLote := LeUltRegistro (qryaux,'CTRLINTERFACE');

   sOpcoes := '';

   if sIdpessjurorig <> '' then
   begin
      sOpcoes := sOpcoes + ' AND (M.IDPATROORIG = '+sIdpessjurorig+') ';
   end;
   if sIdpessjurdest <> '' then
   begin
      sOpcoes := sOpcoes + ' AND (M.IDPATRODEST = '+sIdpessjurdest+') ';
   end;
   if sIdplanodest <> '' then
   begin
      sOpcoes := sOpcoes + ' AND (M.IDPLANOPREVDEST = '+sIdplanodest+') ';
   end;
   if sIdplanoorig <> '' then
   begin
      sOpcoes := sOpcoes + ' AND (M.IDPLANOPREVORIG = '+sIdplanoorig+') ';
   end;
   if sIdtiporeservaorig <> '' then
   begin
      sOpcoes := sOpcoes + ' AND (M.IDTIPORESERVAORIG = '+sIdtiporeservaorig+') ';
   end;
   if sIdtiporeservadest <> '' then
   begin
      sOpcoes := sOpcoes + ' AND (M.IDTIPORESERVADEST = '+sIdtiporeservadest+') ';
   end;
   if sIdBeneficio <> '' then
   begin
      sOpcoes := sOpcoes + ' AND (BENEFICIO.IDBENEFICIO = '+sIdBeneficio+') ';
   end;


   qrymov.Close;
   qrymov.sql.clear;
   qrymov.sql.add(' SELECT M.IDMOVIMENTO,M.IDEVENTOGERADOR, M.IDBENEFICIO , M.IDPATROORIG,'+
                  ' M.IDPATRODEST , M.IDPLANOPREVORIG, M.IDPLANOPREVDEST, M.IDTIPORESERVAORIG, '+
                  ' M.IDTIPORESERVADEST, M.IDREGRA, M.IDREGRAVALIDACAO, P.NOME RESERVAORIGEM, '+
                  ' C.NOME RESERVADESTINO, EV.NOME EVENTO , PORI.NOME PATROORIGEM , PDEST.NOME PATRODESTINO,'+
                  ' PLDEST.NOME PLANODESTINO , PLORI.NOME PLANOORIGEM , BENEFICIO.NOME BENEFICIO, REGRA.NOMEREGRA,'+
                  ' REGRAVAL.NOMEREGRA REGRAVAL, M.SEQMOV '+
                  ' FROM MOVRESERVA M, RESERVAXPLANO P , RESERVAXPLANO C, EVENTOGERADOR EV, '+
                  ' PESSOA PORI , PESSOA PDEST , PLANPREV PLORI , PLANPREV PLDEST, BENEFICIO , '+
                  ' REGRA , REGRA REGRAVAL '+
                  ' WHERE (M.IDEVENTOGERADOR = :idevento) '+
                  ' AND (M.IDEVENTOGERADOR = EV.IDEVENTOGERADOR) '+
                  ' AND (P.IDTIPORESERVA = M.IDTIPORESERVAORIG) '+
                  ' AND (P.IDPLANOPREV = M.IDPLANOPREVORIG )      '+
                  ' AND (C.IDTIPORESERVA = M.IDTIPORESERVADEST) '+
                  ' '+sOpcoes+' '+
                  ' AND (C.IDPLANOPREV = M.IDPLANOPREVDEST) '+
                  ' AND (BENEFICIO.IDBENEFICIO(+) = M.IDBENEFICIO) '+
                  ' AND (PLORI.IDPLANOPREV = M.IDPLANOPREVORIG) '+
                  ' AND (PLDEST.IDPLANOPREV = M.IDPLANOPREVDEST) '+
                  ' AND (PORI.IDPESSOA = M.IDPATROORIG) '+
                  ' AND (PDEST.IDPESSOA = M.IDPATRODEST) '+
                  ' AND (REGRA.IDREGRA = M.IDREGRA) '+
                  ' AND (REGRAVAL.IDREGRA(+) = M.IDREGRAVALIDACAO) '+
                  ' ORDER BY M.SEQMOV ');
   try
      qrymov.parambyname('idevento').AsString := sIdevento;
      //qrymov.parambyname('idbeneficio').AsString := sIdbeneficio;
      qrymov.open;
   except
      raise;
   end;

   if qrymov.IsEmpty then
   begin
      //não encontrou padrão de movimento
      Result := 0;
      sErro.Lines.add('      Não existem padrões de movimentação de reservas nos parâmetros informados.');
      Exit;
   end;//if

   cAux := DecimalSeparator;
   DecimalSeparator := '.';
   if sValorMov <> ''  then
   begin
      if strtofloat(oranumero(sValorMov)) = 0 then
      begin
         //valor da mov = 0
         Result := 1;
         sErro.Lines.add('      O valor da transferência de reservas igual a zero.');
         Exit;
      end;
   end;//if
   DecimalSeparator := cAux;
   sValorMovOriginal := sValorMov;


   sErro.Lines.add('');
   sErro.Lines.add('Participante: '+sNomeParticipante+' ');
   sErro.lines.add('Tranferência de Reserva(s) em vista do evento: '+qrymov.fieldbyname('evento').AsString+' ');
   if qrymov.fieldbyname('BENEFICIO').AsString  <> '' then
   sErro.lines.add('Benefício: '+qrymov.fieldbyname('beneficio').AsString+'');
   sErro.lines.add('----------------------------------------------------------------------------------------');
   sErro.lines.add('');

   qrymov.first;
   Contador := 0;
   ordem := 0;
   iTransCertas := 0;
   sDataref := datetostr(datarefmov);

   //testa par6ametro datarefindice
   try
      sDataAux := datetostr(datarefindice);
      if sDataAux = '' then DataRefIndice := datarefmov;
   except
      DataRefIndice := datarefmov;
   end;

   bAtualizaOrigem := true;
   while not qrymov.eof do
   begin
      inc(contador);
      blista := false;


      sIdpatroorig := qrymov.fieldbyname('IDPATROORIG').AsString;
      sIdpatrodest := qrymov.fieldbyname('IDPATRODEST').AsString;
      sIdplanoprevorig := qrymov.fieldbyname('IDPLANOPREVORIG').AsString;
      sIdplanoprevdest := qrymov.fieldbyname('IDPLANOPREVDEST').AsString;
      sIdreservaorig := qrymov.fieldbyname('IDTIPORESERVAORIG').AsString;
      sIdreservadest := qrymov.fieldbyname('IDTIPORESERVADEST').AsString;
      sIdregra := qrymov.fieldbyname('IDREGRA').AsString;
      sIdregraValidacao := qrymov.fieldbyname('IDREGRAVALIDACAO').AsString;
      if sseqpropostadest = '' then  sseqpropostadest := sseqpropostaorig ;


      sErro.lines.add('');
      sErro.lines.add('Transferência '+inttostr(contador)+' -');
      sErro.Lines.add('--------------------------------------------------------------');
      if qrymov.fieldbyname('PATROORIGEM').AsString <> '' then
      sErro.lines.add('Patrocinadora Origem: '+qrymov.fieldbyname('PATROORIGEM').AsString+'')
      else sErro.lines.add('Patrocinadora Origem: [Sem Valor]');

      if qrymov.fieldbyname('PLANOORIGEM').AsString <> '' then
      sErro.lines.add('Plano Origem: '+qrymov.fieldbyname('PLANOORIGEM').AsString+'')
      else sErro.lines.add('Plano Origem: [SemValor]');

      if qrymov.fieldbyname('RESERVAORIGEM').AsString <> '' then
      sErro.lines.add('Reserva de Origem: '+qrymov.fieldbyname('RESERVAORIGEM').AsString+'')
      else  sErro.lines.add('Reserva de Origem: [Sem Valor]');

      if qrymov.fieldbyname('PATRODESTINO').AsString <> '' then
      sErro.lines.add('Patrocinadora Destino: '+qrymov.fieldbyname('PATRODESTINO').AsString+'')
      else   sErro.lines.add('Patrocinadora Destino: [Sem Valor]');

      if qrymov.fieldbyname('PLANODESTINO').AsString <> '' then
      sErro.lines.add('Plano Destino: '+qrymov.fieldbyname('PLANODESTINO').AsString+'')
      else sErro.lines.add('Plano Destino: [Sem Valor]');

      if qrymov.fieldbyname('RESERVADESTINO').AsString <> '' then
      sErro.lines.add('Reserva Destino: '+qrymov.fieldbyname('RESERVADESTINO').AsString+'')
      else sErro.lines.add('Reserva Destino: [Sem Valor]');

      if qrymov.fieldbyname('NOMEREGRA').AsString <> '' then
      sErro.lines.add('Regra de Cálculo: '+qrymov.fieldbyname('NOMEREGRA').AsString+'')
      else sErro.lines.add('Regra de Cálculo: [Sem Valor]');

      if qrymov.fieldbyname('REGRAVAL').AsString <> '' then
      sErro.lines.add('Regra de Validação: '+qrymov.fieldbyname('REGRAVAL').AsString+'')
      else sErro.lines.add('Regra de Validação: [Sem Valor]');

      sErro.Lines.add('------------------------Lista de Erros------------------------');


      //reserva origem
      if not EncontraReserva(sIdPatroorig,sIdreservaorig,sIdPlanoprevorig,sIdpessoa,sSeqPropostaorig) then
      begin
         //erro- não encountrou reserva
         sErro.lines.add('      Reserva de Origem não encontrada ');
        bLista := true;
         bErro := true;
         qrymov.next;
         Continue;
      end;

      //procura campos de integração contábil
      //um nível acima da reservapart
      qryauxcontab.close;
      qryauxcontab.sql.clear;
      qryauxcontab.sql.add(' SELECT  '+
                           ' CODCENTRORESPON,IDEMPRESAPROP, '+
                           ' CODSUBCONTA,UNIDNEGOC,PLANO,PLACONTAD,PLACONTAC, '+
                           ' IDEMPRESA,CODCENTROCUSTOD,CODCENTROCUSTOC '+
                           ' FROM RESERVAXPLANO  '+
                           ' WHERE IDPLANOPREV = '+sIdplanoprevOrig+' AND IDTIPORESERVA = '+sIdreservaOrig+' ');
      qryauxcontab.open;


      //verifica campos abrigatórios para contabilidade, se integrado
      if bIntegraContab then
      begin
         if not VerificaCamposObrigContab(qryreserva,qryaux,qryauxcontab,sIncompl) then
         begin
            sErro.lines.add('      Reserva de origem - '+sIncompl+'');
            bLista := true;
            bErro := true;
            qrymov.next;
            Continue;
         end;
      end;

      dataref := datetostr(date);
      mesref := copy(dataref,7,4)+'/'+copy(dataref,4,2);
      mescobranca := mesref;
      if qryaux.fieldbyname('tipo').AsString = 'P' then
      begin
         matricula := qryaux.fieldbyname('matricula').AsString;
         inscricao := qryaux.fieldbyname('inscricaonumero').AsString;
      end
      else
      begin
         matricula := '';
         inscricao := '';
      end;
      liexercicio := 0;
      liperiodo := 0;


      idempresa :=  qryaux.fieldbyname('idempresa').AsString;
      unidnegoc :=  sunidnegoc; // já tratado na verificação de campos obrigatórios
      codcentrorespon := qryaux.fieldbyname('codcentrorespon').AsString;
      idempresaprop := qryaux.fieldbyname('idempresaprop').AsString;
      codsubconta := qryaux.fieldbyname('codsubconta').AsString;
      codcentrocustod := qryaux.fieldbyname('codcentrocustod').AsString;
      codcentrocustoc := qryaux.fieldbyname('codcentrocustoc').AsString;
      plano := qryaux.fieldbyname('plano').AsString;
      placontad := qryaux.fieldbyname('placontad').AsString;
      placontac := qryaux.fieldbyname('placontac').AsString;

      if not qryauxcontab.isempty then
      begin
         if idempresa = '' then idempresa :=  qryauxcontab.fieldbyname('idempresa').AsString;
         //if unidnegoc = '' then unidnegoc :=  qryauxcontab.fieldbyname('unidnegoc').AsString;
         if codcentrorespon = '' then codcentrorespon := qryauxcontab.fieldbyname('codcentrorespon').AsString;
         if idempresaprop = '' then idempresaprop := qryauxcontab.fieldbyname('idempresaprop').AsString;
         if codsubconta = '' then codsubconta := qryauxcontab.fieldbyname('codsubconta').AsString;
         if codcentrocustod = '' then codcentrocustod := qryauxcontab.fieldbyname('codcentrocustod').AsString;
         if codcentrocustoc = '' then codcentrocustoc := qryauxcontab.fieldbyname('codcentrocustoc').AsString;
         if plano = '' then plano := qryauxcontab.fieldbyname('plano').AsString;
         if placontad = '' then placontad := qryauxcontab.fieldbyname('placontad').AsString;
         if placontac = '' then placontac := qryauxcontab.fieldbyname('placontac').AsString;
      end;



      {try
         sDataRef := qryaux.fieldbyname('DATAREFERENCIASA').AsString;
      except
         sDataRef := '01/'+Copy(qryaux.fieldbyname('MESREFERENCIA').AsString,6,2)+'/'+Copy(qryaux.fieldbyname('MESREFERENCIA').AsString,1,4)+'';
      end;}

      cAux := DecimalSeparator;
      DecimalSeparator := '.';

      if qryaux.fieldbyname('valorreserva').AsString = '' then
      sValorReserva := '0'
      else  sValorReserva := qryaux.fieldbyname('valorreserva').AsString;

      sIndiceReajuste := qryaux.fieldbyname('indicereajuste').AsString;
      if sIndiceReajuste = '' then
      begin
         sErro.lines.add('      Indice de Reajuste da Reserva Origem não Cadastrado ');
         bLista := true;
         bErro := true;
         qrymov.next;
         DecimalSeparator := cAux;
         Continue;
      end;

      Tipo := qryaux.fieldbyname('tipo').AsString;
      //sValorMoedaCorrente :=  Floattostr(strtofloat(sValorReserva) * VoltaValorCotacao(sIndiceReajuste));

      //if tipo = 'C'  then
      //sMesRef := qryaux.fieldbyname('MESREFERENCIA').AsString
      //else
      sMesRef := '';


      if sIdreservaOrig <> sIdreservaaux then
      begin
         sValorMov := sValorMovOriginal;
      end;

      try
         sValorMov := oranumero(sValorMov);
      except
      end;

       try
         if (sValorMov = '')  then
         sValorMov := truncaround(floattostr(strtofloat(sValorReserva)*VoltaValorCotacao(qryaux,sIndiceReajuste,datetostr(DataRefIndice))),2);
      except
      end;


      //executa regras----------------------------------------------------------
      {if sIdRegraValidacao <> '' then
      begin
         regra.RuleName := sIdRegraValidacao;
         try
         //preencher qryin
         PreencherQryIn(sValorReserva,sIndicereajuste,True);
         Regra.Execute;
         except
            //erro na execução da regra
            sErro.lines.add('      Erro na execução da regra de validação de Transferência de Reservas ');
            bLista := true;
            bErro := true;
         end;

         if not ((uppercase(Regra.Result) = 'FALSE') or
                (uppercase(regra.Result) = 'TRUE')) then
         begin
           //erro no resulta do da regra de validação
           sErro.lines.add('      Erro no resultado da regra de validação de Transferência de Reservas (Resultado:'+regra.result+') ');
           bLista := true;
           bErro := true;
         end;

         if uppercase(regra.Result) = 'FALSE' then
         begin
            //movimento não autorizado pela regra
            sErro.lines.add('      Movimento não autorizado pela regra de validação de Transferência de Reservas ');
            bLista := true;
            bErro := true;
         end;

      end;

      regra.RuleName := sIdregra;
      try
         //preencher qryin
         PreencherQryIn(sValorReserva,sIndicereajuste,False);
         Regra.Execute;
      except
         //erro na execução da regra
         sErro.lines.add('      Erro na execução da regra de Cálculo de Transferência de Reservas ');
         bLista := true;
         bErro := true;
      end;

      if  (uppercase(Regra.Result) = 'FALSE') or
          (uppercase(regra.Result) = 'TRUE') or
          (regra.Result = '') then
      begin
        //erro no resulta do da regra de validação
        sErro.lines.add('      Erro no resultado da regra de Cálculo de Transferência de Reservas (Resultado:'+regra.result+') ');
        bLista := true;
        bErro := true;
      end;    }
      //fim execute regras------------------------------------------------------

      //valor da regra em cotas
      //sValorRegraCotas := Floattostr(strtofloat(regra.result) / VoltaValorCotacao(qryaux,sIndiceReajuste,datetostr(DataRefIndice)));
      sValorRegraCotas := truncaround(floattostr(strtofloat(sValorMov) / VoltaValorCotacao(qryaux,sIndiceReajuste,datetostr(DataRefIndice))),6);

      //atualiza reserva de origem, diminuindo o valor em cotas resultado da regra

      //valor resultante em cotas
      sValorResultado := truncaround(floattostr(strtofloat(sValorReserva) - strtofloat(sValorRegraCotas)),6);
      //valor resultante em moeda
      sValorReservaReal := truncaround(floattostr(strtofloat(sValorReserva) * VoltaValorCotacao(qryaux,sIndiceReajuste,datetostr(DataRefIndice)) - strtofloat(sValorMov)),2);

      //caso seja um atransferência total
      //para evitar erros nos arredondamentos
      if trunc(strtofloat(sValorReservaReal)) <= 0  then
      begin
         sValorResultado := '0.000000000000';
         sValorRegraCotas := sValorReserva;
      end;

      //pega o result da regra de cálculo
      // que será em cotas na mesma noeda da reserva de origem
      // e passa para moeda corrente
      //sValorMoedaCorrente := regra.result ;
      DecimalSeparator := cAux;



      //verifica se a reserva destino está relacionada ao participante
      //se não está, então relaciona
      if not EncontraReserva(sIdPatrodest,sIdreservadest,sIdPlanoprevdest,sIdpessoa,sSeqPropostadest) then
      begin

         //testa elegível
         qryaux.close;
         qryaux.sql.clear;
         qryaux.sql.add(' SELECT IDPESSOA FROM ELEGPATRO WHERE IDPESSOA = '''+sidpessoa+''' AND IDPESSJUR = '''+sIdPatrodest+''' ');
         qryaux.open;

         if qryaux.isempty then
         begin
            sErro.lines.add('      Pessoa não é elegível da Patrocinadora Destino ');
            bLista := true;
            bErro := true;
            qrymov.next;
            DecimalSeparator := cAux;
            Continue;
         end;

         //testa participante
         qryaux.close;
         qryaux.sql.clear;
         qryaux.sql.add(' SELECT IDPESSOA FROM PARTPREVPLAN WHERE  '+
                        ' (IDPESSOA = '''+sidpessoa+''') AND (IDPESSJUR = '''+sIdPatrodest+''') AND '+
                        ' (IDPLANOPREV = '''+sidplanoprevdest+''') ');
                        if sseqpropostadest <> '' then
                        qryaux.sql.add(' AND (SEQPROPOSTA = '+sseqpropostadest+') ');
         qryaux.open;

         if qryaux.isempty then
         begin
            sErro.lines.add('      Pessoa não é Participante do Plano Destino ');
            bLista := true;
            bErro := true;
            qrymov.next;
            DecimalSeparator := cAux;
            Continue;
         end;

         //relaciona reserva destino ao participante
         if tipo = 'C' then
         sidpess := sidpatrodest
         else sidpess := sidpessoa;

         qryaux.close;
         qryaux.sql.clear;
         qryaux.sql.add(' INSERT INTO RESERVAPART(IDPESSOA,IDPESSJUR,IDPLANOPREV,IDTIPORESERVA,SEQPROPOSTA,FLGATIVO)  '+
                        ' VALUES('''+sidpess+''','''+sIdPatrodest+''','+
                        ' '''+sidplanoprevdest+''','''+sIdreservadest+''','''+sseqpropostadest+''',1) ');
         try
            qryaux.Execsql;
         except
            sErro.lines.add('      Erro na associação da Reserva Destino ao Participante ');
            bLista := true;
            bErro := true;
            qrymov.next;
            DecimalSeparator := cAux;
            Continue;
         end;

      end;//if encontra

      //reserva resultado
      if not EncontraReserva(sIdPatrodest,sIdreservadest,sIdPlanoprevdest,sIdpessoa,sSeqPropostadest) then
      begin
         //erro- não encountrou reserva
         sErro.lines.add('      Reserva destino não foi encontrada ');
         bLista := true;
         bErro := true;
         qrymov.next;
         DecimalSeparator := cAux;
         Continue;
      end;

      //procura campos de integração contábil
      //um nível acima da reservapart
      qryauxcontab.close;
      qryauxcontab.sql.clear;
      qryauxcontab.sql.add(' SELECT  '+
                           ' CODCENTRORESPON,IDEMPRESAPROP, '+
                           ' CODSUBCONTA,UNIDNEGOC,PLANO,PLACONTAD,PLACONTAC, '+
                           ' IDEMPRESA,CODCENTROCUSTOD,CODCENTROCUSTOC '+
                           ' FROM RESERVAXPLANO  '+
                           ' WHERE IDPLANOPREV = '+sIdplanoprevDest+' AND IDTIPORESERVA = '+sIdreservaDest+' ');
      qryauxcontab.open;

      //verifica campos abrigatórios para contabilidade destino,
      //se não estiverem ok, não atualiza a reserva origem
      //se integrado
      if bIntegraContab then
      begin
         if not VerificaCamposObrigContab(qryreserva,qryaux,qryauxcontab,sIncompl) then
         begin
            sErro.lines.add('      Reserva Destino -  '+sIncompl+'');
            bLista := true;
            bErro := true;
            qrymov.next;
            Continue;
         end;
      end;

      inc(ordem);

      if bAtualizaOrigem then
      begin
         //se valor a ser retirado for maior que o valor da reserva origem, sai
         cAux := DecimalSeparator;
         DecimalSeparator := '.';
         //if strtofloat(sValorRegraCotas) >  strtofloat(sValorReserva) then
         if trunc(strtofloat(sValorReservaReal)) < 0 then
         begin
            sErro.lines.add('      Valor da tranferência é maior que o disponível na reserva de origem (Valor da Transferência:'+sValorMov+' - Valor Reserva:'+truncaround(floattostr(strtofloat(sValorReserva) * VoltaValorCotacao(qryaux,sIndiceReajuste,datetostr(DataRefIndice))),2)+') ');
            bLista := true;
            bErro := true;
            qrymov.next;
            DecimalSeparator := cAux;
            Continue;
         end;
         DecimalSeparator := cAux;


         if tipo = 'C' then
         sidpess := sidpatroorig
         else sidpess := sidpessoa;

         //joga na tmpdesc origem
         qryreserva.close;
         qryreserva.sql.clear;
         qryreserva.sql.add(' INSERT INTO TMPDESC(idtitular,idpessjur,idprovento,mesreferencia, '+
                           ' flgtipodesc,valor,idplanass,iddesconto,'+
                           ' idmotivo,mescobranca,idpessoa,idplanoprev,'+
                           ' matricula,inscricaonumero,numprioridade,ordem,numdependseguro,'+
                           ' flgdesconto,flgdescfolha,idfundacao,datareferencia,sistorigem,'+
                           ' PLANO, PLACONTAD, PLACONTAC , IDEMPRESA ,'+
                           ' UNIDNEGOC, CODCENTRORESPON, IDEMPRESAPROP, CODSUBCONTA, '+
                           ' CODCENTROCUSTOD, CODCENTROCUSTOC,CODTIPDOC, RECPAG,CODTIPRECDES,EXERCICIO,PERIODO,NODOCUMENTO,'+
                           ' COMPLDOCUMENTO,IDLOTE,DATACOBRANCA,TIPCODIGO,SITENVIO,DESCRICAO,SEQPROPOSTA)'+
                           ' VALUES('+sidpess+','+sIdpatroorig+','+
                           ' :PROVENTO,'''+mesref+''',''O'','+sValorMov+','+
                           ' '''','+sIdreservaorig+','''','''+mescobranca+''','+sIdpess+','+
                           ' '+sidplanoprevorig+','''+matricula+''',:inscricao,'+
                           ' ''0'','+inttostr(ordem)+',0,1,''O'','''',:DATAREF , '+
                           ' ''16'','+
                           ' :PLANO, :PLACONTAD, :PLACONTAC ,:IDEMPRESA,'+
                           ' :UNIDNEGOC, :CODCENTRORESPON, :IDEMPRESAPROP, :CODSUBCONTA, '+
                           ' :CODCENTROCUSTOD, :CODCENTROCUSTOC,'+
                           ' :CODTIPDOC, :RECPAG, :CODTIPRECDES, :EXERCICIO, :PERIODO , :NODOCUMENTO,'+
                           ' :COMPLDOCUMENTO,'+inttostr(idlote)+', :DATACOBRANCA , :TIPCODIGO,''0'','+
                           ' ''Transferência de Reservas'','''+sSeqPropostaorig+''' )');
         try

             qryreserva.parambyname('INSCRICAO').AsString := inscricao;
             qryreserva.parambyname('PROVENTO').AsString := '';
             qryreserva.parambyname('EXERCICIO').AsInteger := liexercicio;
             qryreserva.parambyname('PERIODO').AsInteger := liperiodo;
             qryreserva.parambyname('PLANO').AsString := plano;
             qryreserva.parambyname('PLACONTAD').AsString := placontad;
             qryreserva.parambyname('PLACONTAC').AsString := placontac;
             qryreserva.parambyname('IDEMPRESA').AsString := idempresa;
             qryreserva.parambyname('UNIDNEGOC').AsString := unidnegoc;
             qryreserva.parambyname('CODCENTRORESPON').AsString := codcentrorespon;
             qryreserva.parambyname('IDEMPRESAPROP').AsString := idempresaprop;
             qryreserva.parambyname('CODSUBCONTA').AsString :=codsubconta;
             qryreserva.parambyname('CODCENTROCUSTOD').AsString := codcentrocustod;
             qryreserva.parambyname('CODCENTROCUSTOC').AsString := codcentrocustoc;
             qryreserva.parambyname('CODTIPDOC').AsString := '';
             qryreserva.parambyname('RECPAG').AsString := 'P';
             qryreserva.parambyname('CODTIPRECDES').AsString := '';
             qryreserva.parambyname('NODOCUMENTO').AsString := '' ;
             qryreserva.parambyname('COMPLDOCUMENTO').AsString := '';
             qryreserva.parambyname('TIPCODIGO').AsString := '';
             //Valor := oranumero(sValorMov);
             //qryreserva.parambyname('valor').AsString := valor;
             qryreserva.parambyname('DATAREF').AsDate := strtodate(dataref) ;
             qryreserva.parambyname('DATACOBRANCA').AsDate := strtodate(dataref) ;
             qryreserva.ExecSql;
         except
            sErro.lines.add('      Erro no Envio da Contabilização da Reserva Origem ');
            bLista := true;
            bErro := true;
         end;

         //se encontrou a reserva desino então atualiza reserva origem
         if not AtualizaReserva(sIdPatroorig,sIdreservaorig,sIdPlanoprevorig,sIdpess,sSeqPropostaOrig,
                                Tipo,sValorResultado,sMesRef)
         then
         begin
            //erro
            sErro.lines.add('      Erro na Atualização da reserva origem ');
            bLista := true;
            bErro := true;
         end;

         //alimenta o histórico de movimentações de reservas - origem
         if not AlimentaHistorico(qryreserva,sIdpatroorig,sIdplanoprevorig,sIdreservaorig, sIdpess,sSeqPropostaOrig,
                sValorRegracotas, sValorResultado,
                '','', sIdEvento,sIdregra,0,date,false,DataRefIndice,sidpessoa)
         then
         begin
            //erro
            sErro.lines.add('      Erro na Atualização do Histórico de Movimentação de Reservas - Origem ');
            bLista := true;
            bErro := true;
         end;
      end;//if atualiza


      cAux := DecimalSeparator;
      DecimalSeparator := '.';
      if qryaux.fieldbyname('valorreserva').AsString = ''
      then sValorReservaDestino := '0'
      else sValorReservaDestino := qryaux.fieldbyname('valorreserva').AsString;
      
      sIndiceReajusteDestino := qryaux.fieldbyname('indicereajuste').AsString;
      if sIndiceReajusteDestino = '' then
      begin
         sErro.lines.add('      Indice de Reajuste da Reserva Destino não Cadastrado ');
         bLista := true;
         bErro := true;
         qrymov.next;
         DecimalSeparator := cAux;
         Continue;
      end;

      DecimalSeparator := cAux;

      Tipo := qryaux.fieldbyname('tipo').AsString;

      //if tipo = 'C'  then
      //sMesRef := qryaux.fieldbyname('MESREFERENCIA').AsString
      //else
      sMesRef := '';


      if qryaux.fieldbyname('tipo').AsString = 'P' then
      begin
         matricula := qryaux.fieldbyname('matricula').AsString;
         inscricao := qryaux.fieldbyname('inscricaonumero').AsString;
      end
      else
      begin
         matricula := '';
         inscricao := '';
      end;

      idempresa :=  qryaux.fieldbyname('idempresa').AsString;
      unidnegoc :=  sunidnegoc; // já tratado na verificação de campos obrigatórios
      codcentrorespon := qryaux.fieldbyname('codcentrorespon').AsString;
      idempresaprop := qryaux.fieldbyname('idempresaprop').AsString;
      codsubconta := qryaux.fieldbyname('codsubconta').AsString;
      codcentrocustod := qryaux.fieldbyname('codcentrocustod').AsString;
      codcentrocustoc := qryaux.fieldbyname('codcentrocustoc').AsString;
      plano := qryaux.fieldbyname('plano').AsString;
      placontad := qryaux.fieldbyname('placontad').AsString;
      placontac := qryaux.fieldbyname('placontac').AsString;


      if not qryauxcontab.isempty then
      begin
         if idempresa = '' then idempresa :=  qryauxcontab.fieldbyname('idempresa').AsString;
         //if unidnegoc = '' then unidnegoc :=  qryauxcontab.fieldbyname('unidnegoc').AsString;
         if codcentrorespon = '' then codcentrorespon := qryauxcontab.fieldbyname('codcentrorespon').AsString;
         if idempresaprop = '' then idempresaprop := qryauxcontab.fieldbyname('idempresaprop').AsString;
         if codsubconta = '' then codsubconta := qryauxcontab.fieldbyname('codsubconta').AsString;
         if codcentrocustod = '' then codcentrocustod := qryauxcontab.fieldbyname('codcentrocustod').AsString;
         if codcentrocustoc = '' then codcentrocustoc := qryauxcontab.fieldbyname('codcentrocustoc').AsString;
         if plano = '' then plano := qryauxcontab.fieldbyname('plano').AsString;
         if placontad = '' then placontad := qryauxcontab.fieldbyname('placontad').AsString;
         if placontac = '' then placontac := qryauxcontab.fieldbyname('placontac').AsString;
      end;

      {try
         sDataRef := qryaux.fieldbyname('DATAREFERENCIASA').AsString;
      except
         sDataRef := '01/'+Copy(qryaux.fieldbyname('MESREFERENCIA').AsString,6,2)+'/'+Copy(qryaux.fieldbyname('MESREFERENCIA').AsString,1,4)+'';
      end;}



      //testa se a moeda das reservas é a mesma
      //if sIndiceReajuste = sIndiceReajusteDestino then
      //sValorResultado := formatfloat('#0.00',strtofloat(sValorMoedaCorrente) + strtofloat(sValorReservaDestino))
      //else


      //executa regras----------------------------------------------------------
      if sIdRegraValidacao <> '' then
      begin
         regra.RuleName := sIdRegraValidacao;
         try
         //preencher qryin
         PreencherQryIn(sValorReserva,sIndicereajuste,sValorReservaDestino,sIndiceReajusteDestino,True);
         Regra.Execute;
         except
            //erro na execução da regra
            sErro.lines.add('      Erro na execução da regra de validação de Transferência de Reservas ');
            bLista := true;
            bErro := true;
         end;

         if not ((uppercase(Regra.Result) = 'FALSE') or
                (uppercase(regra.Result) = 'TRUE')) then
         begin
           //erro no resulta do da regra de validação
           sErro.lines.add('      Erro no resultado da regra de validação de Transferência de Reservas (Resultado:'+regra.result+') ');
           bLista := true;
           bErro := true;
         end;

         if uppercase(regra.Result) = 'FALSE' then
         begin
            //movimento não autorizado pela regra
            sErro.lines.add('      Movimento não autorizado pela regra de validação de Transferência de Reservas ');
            bLista := true;
            bErro := true;
         end;

      end;

      regra.RuleName := sIdregra;
      try
         //preencher qryin
         PreencherQryIn(sValorReserva,sIndicereajuste,sValorReservaDestino,sIndiceReajusteDestino,False);
         Regra.Execute;
      except
         //erro na execução da regra
         sErro.lines.add('      Erro na execução da regra de Cálculo de Transferência de Reservas ');
         bLista := true;
         bErro := true;
      end;

      if  (uppercase(Regra.Result) = 'FALSE') or
          (uppercase(regra.Result) = 'TRUE') or
          (regra.Result = '') then
      begin
        //erro no resulta do da regra de validação
        sErro.lines.add('      Erro no resultado da regra de Cálculo de Transferência de Reservas (Resultado:'+regra.result+') ');
        bLista := true;
        bErro := true;
      end
      else
      begin
         //fim execute regras------------------------------------------------------
         cAux := DecimalSeparator;
         DecimalSeparator := '.';

         //valor da regra(movimentação), que está em cotas
         sValorMoedaCorrente := regra.result ;

         if trunc(strtofloat(sValorMoedaCorrente)) <= 0  then
         begin
            sErro.lines.add('     Erro no Valor ['+regra.result+'], resultado da regra de cálculo. É menor ou igual a zero.');
            bLista := true;
            bErro := true;
            qrymov.next;
            DecimalSeparator := cAux;
            Continue;
         end;

         //valor resulltante da reserva destino em cotas
         sValorResultado := truncaround(floattostr(strtofloat(sValorMoedaCorrente) + strtofloat(sValorReservaDestino) ),2);
         //valor da regra em moeda
         sValorReservaRealDestino := truncaround(floattostr(strtofloat(sValorMoedaCorrente)*VoltaValorCotacao(qryaux,sIndiceReajusteDestino,datetostr(DataRefIndice))),2);
         //+  (strtofloat(sValorReservaDestino)*VoltaValorCotacao(qryaux,sIndiceReajusteDestino,datetostr(DataRefIndice))));
         //valor da movimentação em cotas
         //sValorRegracotasDestino := formatfloat('#0.000000',(strtofloat(sValorMoedaCorrente)/VoltaValorCotacao(sIndiceReajusteDestino)));
         //sValorRegraCotasDestino := formatfloat('#0.00',strtofloat(regra.result)* VoltaValorCotacao(qryaux,sIndiceReajusteDestino,datetostr(DataRefIndice)));

         //sValorReservaRealDestino := formatfloat('#0.00',(strtofloat(sValorReservaDestino) * VoltaValorCotacao(sIndiceReajuste)));
         DecimalSeparator := cAux;


         if tipo = 'C' then
         sidpess := sidpatrodest
         else sidpess := sidpessoa;

         inc(ordem);
         //joga na tmpdesc destino
         qryreserva.close;
         qryreserva.sql.clear;
         qryreserva.sql.add(' INSERT INTO TMPDESC(idtitular,idpessjur,idprovento,mesreferencia, '+
                           ' flgtipodesc,valor,idplanass,iddesconto,'+
                           ' idmotivo,mescobranca,idpessoa,idplanoprev,'+
                           ' matricula,inscricaonumero,numprioridade,ordem,numdependseguro,'+
                           ' flgdesconto,flgdescfolha,idfundacao,datareferencia,sistorigem,'+
                           ' PLANO, PLACONTAD, PLACONTAC , IDEMPRESA ,'+
                           ' UNIDNEGOC, CODCENTRORESPON, IDEMPRESAPROP, CODSUBCONTA, '+
                           ' CODCENTROCUSTOD, CODCENTROCUSTOC,CODTIPDOC, RECPAG,CODTIPRECDES,EXERCICIO,PERIODO,NODOCUMENTO,'+
                           ' COMPLDOCUMENTO,IDLOTE,DATACOBRANCA,TIPCODIGO,SITENVIO, DESCRICAO, SEQPROPOSTA)'+
                           ' VALUES('+sidpess+','+sIdpatrodest+','+
                           ' :PROVENTO,'''+mesref+''',''O'','+sValorReservaRealDestino+','+
                           ' '''','+sIdreservadest+','''','''+mescobranca+''','+sIdpess+','+
                           ' '+sidplanoprevdest+','''+matricula+''',:inscricao,'+
                           ' ''0'','+inttostr(ordem)+',0,0,''O'','''',:DATAREF '+
                           ' ,''16'','+
                           ' :PLANO, :PLACONTAD, :PLACONTAC ,:IDEMPRESA,'+
                           ' :UNIDNEGOC, :CODCENTRORESPON, :IDEMPRESAPROP, :CODSUBCONTA, '+
                           ' :CODCENTROCUSTOD, :CODCENTROCUSTOC,'+
                           ' :CODTIPDOC, :RECPAG, :CODTIPRECDES,:EXERCICIO, :PERIODO , :NODOCUMENTO,'+
                           ' :COMPLDOCUMENTO,'+inttostr(idlote)+',:DATACOBRANCA , :TIPCODIGO,''0'','+
                           ' ''Transferência de Reservas'','''+sSeqPropostaDest+''' )');
         try

             qryreserva.parambyname('INSCRICAO').AsString := inscricao;
             qryreserva.parambyname('PROVENTO').AsString := '';
             qryreserva.parambyname('EXERCICIO').AsInteger := liexercicio;
             qryreserva.parambyname('PERIODO').AsInteger := liperiodo;
             qryreserva.parambyname('PLANO').AsString := plano;
             qryreserva.parambyname('PLACONTAD').AsString := placontad;
             qryreserva.parambyname('PLACONTAC').AsString := placontac;
             qryreserva.parambyname('IDEMPRESA').AsString := idempresa;
             qryreserva.parambyname('UNIDNEGOC').AsString := unidnegoc;
             qryreserva.parambyname('CODCENTRORESPON').AsString := codcentrorespon;
             qryreserva.parambyname('IDEMPRESAPROP').AsString := idempresaprop;
             qryreserva.parambyname('CODSUBCONTA').AsString :=codsubconta;
             qryreserva.parambyname('CODCENTROCUSTOD').AsString := codcentrocustod;
             qryreserva.parambyname('CODCENTROCUSTOC').AsString := codcentrocustoc;
             qryreserva.parambyname('CODTIPDOC').AsString := '';
             qryreserva.parambyname('RECPAG').AsString := 'R';
             qryreserva.parambyname('CODTIPRECDES').AsString := '';
             qryreserva.parambyname('NODOCUMENTO').AsString := '' ;
             qryreserva.parambyname('COMPLDOCUMENTO').AsString := '';
             qryreserva.parambyname('TIPCODIGO').AsString := '';
             //qryreserva.parambyname('valor').AsString := sValorReservaRealDestino;
             qryreserva.parambyname('DATAREF').AsDate := strtodate(dataref) ;
             qryreserva.parambyname('DATACOBRANCA').AsDate := strtodate(dataref) ;
             qryreserva.ExecSql;
         except
            sErro.lines.add('      Erro no Envio da Contabilização Reserva Destino ');
            bLista := true;
            bErro := true;
         end;




         //atualiza reserva de destino
         if not AtualizaReserva(sIdPatrodest,sIdreservadest,sIdPlanoprevdest,sIdpess,sSeqPropostaDest,
                                Tipo,sValorResultado,sMesRef)
         then
         begin
            //erro
            sErro.lines.add('      Erro na Atualização da reserva destino ');
            bLista := true;
            bErro := true;
         end;

         //atualiza histórico de movimentação de reservas - destino
         if not AlimentaHistorico(qryreserva,sIdpatrodest,sIdplanoprevdest,sIdreservadest, sIdpess,sSeqPropostaDest,
                sValorMoedaCorrente{valor da regra} , sValorResultado {valor em cotas do resultado},
                '','', sIdEvento,sIdregra,1,date,false,DataRefIndice,sidpessoa)
         then
         begin
            //erro
            sErro.lines.add('      Erro na Atualização do Histórico de Movimentação de Reservas - Destino ');
            bLista := true;
            bErro := true;
         end;
      end;//else erro regra


      if not bLista then
      begin
         sErro.Lines.add('      Sem Erros');
         iTransCertas := iTransCertas + 1;
      end;


      qrymov.next;
   end;//while

   qryaux.close;
   qryreserva.close;
   qryregrain.close;
   qryauxContab.close;
   qryaux.Free ;
   qryreserva.free;
   qryregrain.free ;
   qryauxContab.free;



   {if not bErro then
   Result := 2
   else Result := 1;}

   if (iTransCertas > 0) and (berro) then result := 1  //fez alguma certa, mas houve erros
   else if (iTransCertas > 0) and (not berro) then result := 2 //todas certas
   else if (iTransCertas = 0) then result := 3 ;  //não fez nenhuma certa
end;

function truncar(f:Double;n:integer):string;
var
 i:integer;
 Inteiro , Decimal : String;
begin
    Result:= floattostr(f);

    i:=pos(decimalseparator,result);
    if i <> 0 then
    begin
       Inteiro := copy(Result,1,i);
       Decimal := Copy(Result,i+1,n);
       Result := Inteiro+Decimal;
    end;
end;

function TruncaRound(f:String;n:integer):string;
var
 i,j:integer;
// Inteiro , Decimal, DecimalPos, sAux : String; // CAMILLE - REFER - 15.03.99
// rDecimalPos, // CAMILLE - REFER - 15.03.99
 rInteiro : Extended;
 cAux :Char;
begin
   cAux := DecimalSeparator;
   Result := (f);

   i:=pos(',',result);
   if i=0 then
   begin
      DecimalSeparator := '.';
      i:= pos('.',result);
   end
   else
   begin
      DecimalSeparator := ',';
   end;

   if (i <> 0) and (length(copy(result,i+1,length(result)))>n) then
   begin
    // rInteiro := strtofloat(result);
       rInteiro := strtofloat(f)*power(10,n);
       j := pos(DecimalSeparator,floattostr(rinteiro));
       //if j <> 0 then  rInteiro := round(rinteiro);
       if j <> 0 then  rInteiro := ArredondaValor(floattostr(rinteiro));
       rInteiro := rInteiro/power(10,n);
       Result := copy(floattostr(rinteiro),1,i+n)
   end;
   DecimalSeparator := cAux;
end;

function ArredondaValor(Valor : String) : Extended;
var cAux : Char;
    i : Integer;
    sValorInt, sValorDec : String;
    dValorInt , dValorDec : Extended;
begin
   cAux := DecimalSeparator;

   if Valor = '' then
   begin
      Result := 0;
      exit;
   end;

   i:=pos(',',Valor);
   if i=0 then
   begin
      DecimalSeparator := '.';
      i:= pos('.',Valor);
   end
   else
   begin
      DecimalSeparator := ',';
   end;

   if i <> 0 then
   begin
      sValorInt := Copy(valor,0,i-1);
      sValorDec := Copy(valor,i+1,1);
      dValorInt := strtofloat(sValorInt);
      dValorDec := strtofloat(sValorDec);

      if dValorDec >= 5 then
      dValorInt := dValorInt + 1;
   end
   else dValorInt := StrToFloat(Valor);


   Result := dValorInt;
   DecimalSeparator := cAux;
end;


end.
