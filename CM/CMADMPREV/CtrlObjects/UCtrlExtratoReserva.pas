// *****************************************************************************
// ***************************** REGISTRO DE ALTERAÇÕES ************************
// *****************************************************************************
// Autor(a)    : Claudio Faria
// Rotina      : Varias
// Data        : 16/08/2007
// Pendência   : 19962
// Alteração   : Troca do DateToStr para FormatDateTime.
// -----------------------------------------------------------------------------
//  Autor      : Gleyber
//  Rotina     : EmiteExtratoReservaMensal
//  Data       : 14/07/2004
//  Pendência  : 17081
//  Descrição  : Passa a utilizar a DATAINDICE ao invés da DATAALIMENTACAO
//------------------------------------------------------------------------------
unit UCtrlExtratoReserva;

interface

Uses SysUtils, uCmControlObject, uCmDbObject,
     {$IFDEF VERSAO0505} uComum, uSistema, {$ELSE} uCMTypes, {$ENDIF}
     uCmClientDataSet, uMidasUtil, UCMFileUtils;

Type

  TCtrlExtratoReserva = class(TCmControlObject)
  private
   DATAGERAL : STRING;
  protected

  public
     function EmiteExtratoReservaMensal( psMesCobranca      : string;
                                         piIdPessJur        : longint;
                                         piIdPlanoPrev      : longint;
                                         piIdPessoa         : longint;
                                         piSeqProposta      : longint;
                                         pbFiltraPatro      : boolean;
                                         piIdPatroFiltro    : longint;
                                         pstrSituacao       : string;
                                         pstrMatricula      : string): OLEVariant;

     function EmiteExtratoReservaTrimestral
                                       ( psMesCobranca      : string;
                                         piIdPessJur        : longint;
                                         piIdPlanoPrev      : longint;
                                         piIdPessoa         : longint;
                                         piSeqProposta      : longint;
                                         pbFiltraPatro      : boolean;
                                         piIdPatroFiltro    : longint;
                                         pstrSituacao       : string;
                                         pstrMatricula      : string): OLEVariant;
     function EmiteExtratoReservaConsolidado
                                       ( psAno              : string;
                                         piIdPessJur        : longint;
                                         piIdPlanoPrev      : longint;
                                         piIdPessoa         : longint;
                                         piSeqProposta      : longint;
                                         pbFiltraPatro      : boolean;
                                         piIdPatroFiltro    : longint;
                                         pstrSituacao       : string;
                                         pstrMatricula      : string;
                                         pbIncluiAnteriores : boolean ): OLEVariant;
     function TrazUltDiaData     ( aData                    : TDateTime  ) : TDateTime;

     function SAnoMesAnterior    ( sAnoMes                  : string     ) : string;

     function AnoMesAnterior     ( iMes                     : integer;
                                   iAno                     : integer    ) : string;

     function BuscaSaldoNoMes    ( piIdPessJur              : longint;
                                   piIdPlanoPrev            : longint;
                                   piIdPessoa               : longint;
                                   piSeqProposta            : longint;
                                   psMesReferencia          : string;
                                   psCodHierarquia          : string;
                                   pbBuscaAtual             : boolean    ) : double;

     function BuscaDataCota      ( piIdPessJur,
                                   piIdPlanoPrev,
                                   piIdPessoa,
                                   piSeqProposta            : longint;
                                   psMesReferencia          : string     ): string;

     function VoltaValorCotacao  ( sIndiceReajuste          : string;
                                   sIdPlanoPrev             : string;
                                   sIdTipoReserva           : string;
                                   sDataMov                 : string;
                                   piBuscaPelaData          : Integer = 0   ) : double; 
     function BuscaFundacao      ( piIdFundacao             : longint    ) : OLEVariant;

     function BuscaPatro         ( piIdFundacao             : longint    ) : OLEVariant;

     function BuscaSituacao      ( piIdFundacao             : longint    ) : OLEVariant;

     procedure PreencheCamposCalculados( cds                : TCMClientDataSet; Flag_tipo : Integer);


  published

end;

implementation

{ TCtrlExtratoReserva }
function TCtrlExtratoReserva.TrazUltDiaData(aData:TDateTime):TDateTime;

var
  mDiaMes          : array[1..12] of Word;
  Day, Month, Year : Word;
begin
  DecodeDate(aData,Year,Month,Day);
  mDiaMes[01] := 31;
  mDiaMes[02] := 28;
  mDiaMes[03] := 31;
  mDiaMes[04] := 30;
  mDiaMes[05] := 31;
  mDiaMes[06] := 30;
  mDiaMes[07] := 31;
  mDiaMes[08] := 31;
  mDiaMes[09] := 30;
  mDiaMes[10] := 31;
  mDiaMes[11] := 30;
  mDiaMes[12] := 31;

  TrazUltDiaData := EncodeDate(Year, Month, mDiaMes[Month]);
end;

function TCtrlExtratoReserva.AnoMesAnterior(iMes, iAno: integer): string;
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
end;

procedure TCtrlExtratoReserva.PreencheCamposCalculados( cds : TCMClientDataSet; Flag_Tipo : Integer);
var sAnoMesAnt : string;
    dAux       : double;
    sDataAux   : string;
    dCota      : double;
    mesano : string;
    mesano1 : string;
begin

     { A linha abaixo foi adicionada para resolver um problema com conexões ADO,
       que faz com que qualquer dataset venha como "ReadOnly". A função utilizada
       remonta o dataset, permitindo a sua atualização.}
     cds.Data := CopyClientDataSet( cds );

     cds.First;
     while not cds.Eof do
     begin
        if Flag_tipo = 1 then
             sAnoMesAnt := SAnoMesAnterior(cds.FieldbyName('MESREFERENCIA').AsString);
         if Flag_tipo = 2 then
           begin
             sAnoMesAnt := cds.FieldbyName('MESREFERENCIA').AsString;  
          end;
            if Flag_tipo = 3 then
           begin
             sAnoMesAnt := cds.FieldbyName('MESREFERENCIA').AsString;  
          end;


        dAux       := 0;

        if (cds.FieldByName('TIPO_CONTA').AsString = 'CPI') or  (cds.FieldByName('TIPO_CONTA').AsString = 'XXX')
        then begin

           if (cds.FieldByName('TIPO_CONTA').AsString = 'CPI') then dAux := 0;
           dAux   := dAux + BuscaSaldoNoMes (cds.FieldByName('IDPESSJUR').AsInteger,
                                    cds.FieldByName('IDPLANOPREV').AsInteger,
                                    cds.FieldByName('IDPESSOA').AsInteger,
                                    cds.FieldByName('SEQPROPOSTA').AsInteger,
                                    sAnoMesAnt,
                                    '20101',
                                    False);
           dAux  := dAux + BuscaSaldoNoMes (cds.FieldByName('IDPESSJUR').AsInteger,
                                    cds.FieldByName('IDPLANOPREV').AsInteger,
                                    cds.FieldByName('IDPESSOA').AsInteger,
                                    cds.FieldByName('SEQPROPOSTA').AsInteger,
                                    sAnoMesAnt,
                                    '20102',
                                    False);

           // Buscar cota no dia anterior ao mês que está sendo feito
           sDataAux := BuscaDataCota (cds.FieldByName('IDPESSJUR').AsInteger,
                                      cds.FieldByName('IDPLANOPREV').AsInteger,
                                      cds.FieldByName('IDPESSOA').AsInteger,
                                      cds.FieldByName('SEQPROPOSTA').AsInteger,
                                      sAnoMesAnt);

           if Trim(sDataAux) = ''
           then sDataAux := cds.FieldByName('INSCRICAODATA').AsString;

           If Flag_tipo = 1
            Then  dCota  := VoltaValorCotacao('112', '','', sDataAux)
            Else  dCota  := VoltaValorCotacao('112', '','', sDataAux, 1);

           cds.Edit;
           cds.FieldByName('DATASALDOANT').AsString := sDataAux;
           cds.FieldByName('SALDOANT').AsFloat      := dAux;
           cds.FieldByName('SALDOANTCOTA').AsFloat  := dAux;
           if Flag_tipo >  1 then
           begin
             cds.FieldByName('VALOR_DA_COTA').AsFloat  := dCota;
             cds.FieldByName('DATA_LANCAMENTO').AsString  := DATAGERAL;
             cds.FieldByName('VALOR_ULT_COTA').AsFloat  := VoltaValorCotacao('112', '','', sDataAux);
             cds.FieldByName('DATA_ULT_COTA').AsString  := DATAGERAL;
           end;
           cds.Post;

        end;

        if (cds.FieldByName('TIPO_CONTA').AsString = 'CIP') or (cds.FieldByName('TIPO_CONTA').AsString = 'XXX')
        then begin
           if (cds.FieldByName('TIPO_CONTA').AsString = 'CIP') then dAux := 0;

           dAux   := dAux + BuscaSaldoNoMes (cds.FieldByName('IDPESSJUR').AsInteger,
                                    cds.FieldByName('IDPLANOPREV').AsInteger,
                                    cds.FieldByName('IDPESSOA').AsInteger,
                                    cds.FieldByName('SEQPROPOSTA').AsInteger,
                                    sAnoMesAnt,
                                    '10101',
                                    False);
           dAux  := dAux + BuscaSaldoNoMes (cds.FieldByName('IDPESSJUR').AsInteger,
                                    cds.FieldByName('IDPLANOPREV').AsInteger,
                                    cds.FieldByName('IDPESSOA').AsInteger,
                                    cds.FieldByName('SEQPROPOSTA').AsInteger,
                                    sAnoMesAnt,
                                    '10102',
                                    False);
           dAux  := dAux + BuscaSaldoNoMes (cds.FieldByName('IDPESSJUR').AsInteger,
                                    cds.FieldByName('IDPLANOPREV').AsInteger,
                                    cds.FieldByName('IDPESSOA').AsInteger,
                                    cds.FieldByName('SEQPROPOSTA').AsInteger,
                                    sAnoMesAnt,
                                    '10103',
                                    False);
           dAux  := dAux + BuscaSaldoNoMes (cds.FieldByName('IDPESSJUR').AsInteger,
                                    cds.FieldByName('IDPLANOPREV').AsInteger,
                                    cds.FieldByName('IDPESSOA').AsInteger,
                                    cds.FieldByName('SEQPROPOSTA').AsInteger,
                                    sAnoMesAnt,
                                    '10104',
                                    False);
           dAux  := dAux + BuscaSaldoNoMes (cds.FieldByName('IDPESSJUR').AsInteger,
                                    cds.FieldByName('IDPLANOPREV').AsInteger,
                                    cds.FieldByName('IDPESSOA').AsInteger,
                                    cds.FieldByName('SEQPROPOSTA').AsInteger,
                                    sAnoMesAnt,
                                    '10105',
                                    False);
           dAux  := dAux + BuscaSaldoNoMes (cds.FieldByName('IDPESSJUR').AsInteger,
                                    cds.FieldByName('IDPLANOPREV').AsInteger,
                                    cds.FieldByName('IDPESSOA').AsInteger,
                                    cds.FieldByName('SEQPROPOSTA').AsInteger,
                                    sAnoMesAnt,
                                    '10106',
                                    False);
           dAux  := dAux + BuscaSaldoNoMes (cds.FieldByName('IDPESSJUR').AsInteger,
                                    cds.FieldByName('IDPLANOPREV').AsInteger,
                                    cds.FieldByName('IDPESSOA').AsInteger,
                                    cds.FieldByName('SEQPROPOSTA').AsInteger,
                                    sAnoMesAnt,
                                    '10107',
                                    False);
           dAux  := dAux + BuscaSaldoNoMes (cds.FieldByName('IDPESSJUR').AsInteger,
                                    cds.FieldByName('IDPLANOPREV').AsInteger,
                                    cds.FieldByName('IDPESSOA').AsInteger,
                                    cds.FieldByName('SEQPROPOSTA').AsInteger,
                                    sAnoMesAnt,
                                    '10108',
                                    False);
           dAux  := dAux + BuscaSaldoNoMes (cds.FieldByName('IDPESSJUR').AsInteger,
                                    cds.FieldByName('IDPLANOPREV').AsInteger,
                                    cds.FieldByName('IDPESSOA').AsInteger,
                                    cds.FieldByName('SEQPROPOSTA').AsInteger,
                                    sAnoMesAnt,
                                    '10109',
                                    False);
           dAux  := dAux + BuscaSaldoNoMes (cds.FieldByName('IDPESSJUR').AsInteger,
                                    cds.FieldByName('IDPLANOPREV').AsInteger,
                                    cds.FieldByName('IDPESSOA').AsInteger,
                                    cds.FieldByName('SEQPROPOSTA').AsInteger,
                                    sAnoMesAnt,
                                    '10110',
                                    False);
           dAux  := dAux + BuscaSaldoNoMes (cds.FieldByName('IDPESSJUR').AsInteger,
                                    cds.FieldByName('IDPLANOPREV').AsInteger,
                                    cds.FieldByName('IDPESSOA').AsInteger,
                                    cds.FieldByName('SEQPROPOSTA').AsInteger,
                                    sAnoMesAnt,
                                    '10111',
                                    False);
           dAux  := dAux + BuscaSaldoNoMes (cds.FieldByName('IDPESSJUR').AsInteger,
                                    cds.FieldByName('IDPLANOPREV').AsInteger,
                                    cds.FieldByName('IDPESSOA').AsInteger,
                                    cds.FieldByName('SEQPROPOSTA').AsInteger,
                                    sAnoMesAnt,
                                    '10112',
                                    False);
           dAux  := dAux + BuscaSaldoNoMes (cds.FieldByName('IDPESSJUR').AsInteger,
                                    cds.FieldByName('IDPLANOPREV').AsInteger,
                                    cds.FieldByName('IDPESSOA').AsInteger,
                                    cds.FieldByName('SEQPROPOSTA').AsInteger,
                                    sAnoMesAnt,
                                    '10113',
                                    False);

           // Buscar cota no dia anterior ao mês que está sendo feito
           sDataAux := BuscaDataCota (cds.FieldByName('IDPESSJUR').AsInteger,
                                      cds.FieldByName('IDPLANOPREV').AsInteger,
                                      cds.FieldByName('IDPESSOA').AsInteger,
                                      cds.FieldByName('SEQPROPOSTA').AsInteger,
                                      sAnoMesAnt);

           if Trim(sDataAux) = ''
           then sDataAux := cds.FieldByName('INSCRICAODATA').AsString;

           If Flag_tipo = 1
            Then dCota  := VoltaValorCotacao('112', '','', sDataAux)
            Else dCota  := VoltaValorCotacao('112', '','', sDataAux, 1);

           cds.Edit;
           cds.FieldByName('DATASALDOANT').AsString := sDataAux;
           cds.FieldByName('SALDOANT').AsFloat      := dAux;
           cds.FieldByName('SALDOANTCOTA').AsFloat  := dAux;
           if Flag_tipo > 1 then
           begin
             cds.FieldByName('VALOR_DA_COTA').AsFloat  := dCota;
             cds.FieldByName('DATA_LANCAMENTO').AsString  := DATAGERAL;
             cds.FieldByName('VALOR_ULT_COTA').AsFloat  := VoltaValorCotacao('112', '','', sDataAux);
             cds.FieldByName('DATA_ULT_COTA').AsString  := DATAGERAL;
          end;
           cds.Post;

        end;


        dAux := BuscaSaldoNoMes (cds.FieldByName('IDPESSJUR').AsInteger,
                                 cds.FieldByName('IDPLANOPREV').AsInteger,
                                 cds.FieldByName('IDPESSOA').AsInteger,
                                 cds.FieldByName('SEQPROPOSTA').AsInteger,
                                 cds.FieldbyName('MESREFERENCIA').AsString,
                                 '518', True);

        cds.Edit;
        cds.FieldByName('IDADEBSALDADO').AsInteger := Trunc(dAux/12); // a idade está em meses

        dAux := BuscaSaldoNoMes (cds.FieldByName('IDPESSJUR').AsInteger,
                                 cds.FieldByName('IDPLANOPREV').AsInteger,
                                 cds.FieldByName('IDPESSOA').AsInteger,
                                 cds.FieldByName('SEQPROPOSTA').AsInteger,
                                 cds.FieldbyName('MESREFERENCIA').AsString,
                                 '303', True);

        cds.FieldByName('BSALDADO').AsFloat := dAux;

        dAux := BuscaSaldoNoMes (cds.FieldByName('IDPESSJUR').AsInteger,
                                 cds.FieldByName('IDPLANOPREV').AsInteger,
                                 cds.FieldByName('IDPESSOA').AsInteger,
                                 cds.FieldByName('SEQPROPOSTA').AsInteger,
                                 cds.FieldbyName('MESREFERENCIA').AsString,
                                 '401', True);

        dAux := dAux + BuscaSaldoNoMes (cds.FieldByName('IDPESSJUR').AsInteger,
                                 cds.FieldByName('IDPLANOPREV').AsInteger,
                                 cds.FieldByName('IDPESSOA').AsInteger,
                                 cds.FieldByName('SEQPROPOSTA').AsInteger,
                                 cds.FieldbyName('MESREFERENCIA').AsString,
                                 '402', True);

        cds.FieldByName('RESERVABSALDADO').AsFloat := dAux;
        cds.Post;

        cds.Next;
     end;

end;



function TCtrlExtratoReserva.BuscaSaldoNoMes( piIdPessJur      : longint;
                                              piIdPlanoPrev    : longint;
                                              piIdPessoa       : longint;
                                              piSeqProposta    : longint;
                                              psMesReferencia  : string;
                                              psCodHierarquia  : string;
                                              pbBuscaAtual    : boolean    ) : double;
var cds : TCMClientDataSet;
    dValorEncontrado : double;
begin

 cds := TCMClientDataSet.Create(nil);
 try
     Result           := 0;
     dValorEncontrado := 0;

     // Se o codigo da reserva for maior que 3, buscar da reserva part pois
     // sao reservas carregadas na migração e cujo valor na histmovreserva
     // está errado nas 1as. migracoes efetuadas
     if psCodHierarquia < '3'
     then begin
        cds.Data := GetDataPacket(' SELECT H.SALDOCOTAS, PP.INSCRICAODATA                            '+
                       ' FROM   HISTMOVRESERVA H, PARTPREVPLAN PP,RESERVAXPLANO RPX                   '+
                       ' WHERE  H.IDPESSJUR    = '+IntToStr(piIdPessJur)                              +
                       ' AND    H.IDPLANOPREV  = '+IntToStr(piIdPlanoPrev)                            +
                       ' AND    H.IDPESSOA     = '+IntToStr(piIdPessoa)                               +
                       ' AND    H.SEQPROPOSTA  = '+IntToStr(piSeqProposta)                            +
                       ' AND    PP.IDPESSJUR   = H.IDPESSJUR                                         '+
                       ' AND    PP.IDPLANOPREV = H.IDPLANOPREV                                       '+
                       ' AND    PP.IDPESSOA    = H.IDPESSOA                                          '+
                       ' AND    H.SALDOCOTAS    > 0                                                 '+
                       ' AND    PP.SEQPROPOSTA = H.SEQPROPOSTA     '+
                       ' AND    RPX.IDTIPORESERVA = H.IDTIPORESERVA '+
                       ' AND    RPX.CODHIERARQUIA = '+QuotedStr(psCodHierarquia)+
                       ' AND    H.DATAINDICE = ( SELECT MAX(HT.DATAINDICE)                     '+ 
                       '                            FROM   HISTMOVRESERVA HT, RESERVAXPLANO RP       '+
                       '                            WHERE  HT.IDPESSJUR   = '+IntToStr(piIdPessJur)   +
                       '                            AND    HT.IDPLANOPREV = '+IntToStr(piIdPlanoPrev) +
                       '                            AND    HT.IDPESSOA    = '+IntToStr(piIdPessoa)    +
                       '                            AND    HT.SEQPROPOSTA = '+IntToStr(piSeqProposta) +
                       '                            AND    (TO_CHAR(HT.DATAINDICE,''YYYY/MM'') <= '''+psMesReferencia+''')  '+
                       '                            AND    RP.IDPLANOPREV   = HT.IDPLANOPREV '+
                       '                            AND    HT.SALDOCOTAS  > 0 '+
                       '                            AND    RP.IDTIPORESERVA = HT.IDTIPORESERVA '+
                       '                            AND    RP.CODHIERARQUIA = '''+psCodHierarquia+''') ');
        if not cds.IsEmpty
        then 
         dValorEncontrado := cds.FieldByname('SALDOCOTAS').AsFloat
     end;

     if dValorEncontrado <= 0
     then begin
        if pbBuscaAtual
        then begin
           cds.Data := GetDataPacket(' SELECT RP.VALORRESERVA, PP.INSCRICAODATA      '+
                          ' FROM   RESERVAPART RP, RESERVAXPLANO R, PARTPREVPLAN PP  '+
                          ' WHERE  RP.IDPESSJUR    = '+IntToStr(piIdPessJur)          +
                          ' AND    RP.IDPLANOPREV  = '+IntToStr(piIdPlanoPrev)        +
                          ' AND    RP.IDPESSOA     = '+IntToStr(piIdPessoa)           +
                          ' AND    RP.SEQPROPOSTA  = '+IntToStr(piSeqProposta)        +
                          ' AND    PP.IDPESSJUR    = RP.IDPESSJUR                    '+
                          ' AND    PP.IDPLANOPREV  = RP.IDPLANOPREV                  '+
                          ' AND    PP.IDPESSOA     = RP.IDPESSOA                     '+
                          ' AND    PP.SEQPROPOSTA  = RP.SEQPROPOSTA                  '+
                          ' AND    R.IDPLANOPREV   = 33                              '+
                          ' AND    R.IDPLANOPREV   = RP.IDPLANOPREV                  '+
                          ' AND    R.IDTIPORESERVA = RP.IDTIPORESERVA                '+
                          ' AND    R.CODHIERARQUIA = '''+psCodHierarquia+'''         ');
           if not cds.IsEmpty
           then 
                 dValorEncontrado := cds.FieldByname('VALORRESERVA').AsFloat
        end;
     end;
     Result := dValorEncontrado;
 finally
   cds.Free;
 end;
end;

function TCtrlExtratoReserva.EmiteExtratoReservaMensal( psMesCobranca   : string;
                                                        piIdPessJur     : longint;
                                                        piIdPlanoPrev   : longint;
                                                        piIdPessoa      : longint;
                                                        piSeqProposta   : longint;
                                                        pbFiltraPatro   : boolean;
                                                        piIdPatroFiltro : longint;
                                                        pstrSituacao    : string;
                                                        pstrMatricula   : string): OLEVariant;

var sSQL : string;
    cds  : TCMClientDataSet;
    Flag_Tipo : Integer;
begin

  cds := TCMClientDataSet.Create(nil);
  try

     sSQL := ' SELECT IDPESSJUR, IDPLANOPREV, IDPESSOA, SEQPROPOSTA, MATRICULA, '+
             '        INSCRICAODATA,  MESREFERENCIA,                                   '+
             '        '''+psMesCobranca+''' AS ANOMESREF,                       '+
             '        DECODE( SUBSTR('''+psMesCobranca+''',6,2),                '+
             '                             ''01'', ''JANEIRO'',                 '+
             '                             ''02'', ''FEVEREIRO'',               '+
             '                             ''03'', ''MARçO'',                   '+
             '                             ''04'', ''ABRIL'',                   '+
             '                             ''05'', ''MAIO'',                    '+
             '                             ''06'', ''JUNHO'',                   '+
             '                             ''07'', ''JULHO'',                   '+
             '                             ''08'', ''AGOSTO'',                  '+
             '                             ''09'', ''SETEMBRO'',                '+
             '                             ''10'', ''OUTUBRO'',                 '+
             '                             ''11'', ''NOVEMBRO'',                '+
             '                             ''12'', ''DEZEMBRO'')||''/''||SUBSTR(+'''+psMesCobranca+''',1,4)  AS MESREFERENCIA1, '+
             '        DATA_LANCAMENTO, PARTICIPANTE, DESCRICAO, NOME_CONTA, TIPO_CONTA, FLGENTRADA,                            '+
             '        VALOR_DA_COTA, QUANT_COTA,                                                                               '+
             '        (VALOR_DA_COTA * QUANT_COTA) AS VALOR_EM_REAL,                                                           '+
             '        DATASALDOANT,                                                                                         '+
             '        0 AS SALDOANT, 0 AS SALDOANTCOTA,                                                                        '+
             '        0 AS IDADEBSALDADO, 0 AS BSALDADO, 0 AS RESERVABSALDADO                                                  '+
             ' FROM                                                                                                            '+
             ' (                                                                                                               '+
             '    SELECT 1 AS TIPO, H.IDPESSJUR, H.IDPLANOPREV, H.IDPESSOA, H.SEQPROPOSTA, EL.MATRICULA,                                                                  '+
             '           PP.INSCRICAODATA,                                                                    '+
             '           NVL(TO_CHAR(H.DATAINDICE, ''DD/MM/YYYY''), TO_CHAR(H.DATAINDICE,''DD/MM/YYYY'') ) AS DATA_LANCAMENTO,                                 '+
             '           P.NOME        AS PARTICIPANTE,                                                                                                                   '+
             '           NVL(DECODE(SUBSTR(H.MESREFERENCIA,6,2),''13'', DECODE(C.NOME, NULL, DECODE(B.NOME, NULL, ''Evento ''||EG.NOME, B.NOME), ''Alim. Mensal ''||C.NOME)||''(13o.)'' ,                   '+
             '                                                      DECODE(C.NOME, NULL, DECODE(B.NOME, NULL, ''Evento ''||EG.NOME,B.NOME),''Alim. Mensal ''||C.NOME)), ''Entrada Manual'') AS DESCRICAO, '+
             '           DECODE(H.IDTIPORESERVA, 26, ''CONTA IDENTIFICADA DA PATROCINADORA (CPI)'',                                            '+
             '                                   27, ''CONTA IDENTIFICADA DA PATROCINADORA (CPI)'',                                            '+
             '                                       ''CONTA INDIVIDUAL DO PARTICIPANTE (CIP)'' ) AS NOME_CONTA,                               '+
             '           DECODE(H.IDTIPORESERVA, 26, ''CPI'',                                                                                  '+
             '                                   27, ''CPI'',                                                                                  '+
             '                                       ''CIP'' ) AS TIPO_CONTA,                                                                  '+
             '           H.FLGENTRADA,                                                                                                         '+
             '           SUM(H.VALORINDICE) AS VALOR_DA_COTA,                                                                                  '+
             '           SUM(DECODE(H.FLGENTRADA,1, NVL(H.VLRCOTAS,0), -NVL(H.VLRCOTAS,0)))    AS QUANT_COTA,                                  '+
             '           SUM(DECODE(H.FLGENTRADA,1, NVL(H.VLRREAL,0) , -NVL(H.VLRREAL,0 )))    AS VALOR_EM_REAL,                               '+
             '           TO_CHAR(SYSDATE, ''DD/MM/YYYY'') AS DATASALDOANT, 0 AS SALDOANT, 0 AS SALDOANTCOTA,                                   '+
             '           0 AS IDADEBSALDADO, 0 AS BSALDADO, 0 AS RESERVABSALDADO , H.MESREFERENCIA                                    '+
             '     FROM   PESSOA P, ELEGPATRO EL, PARTPREVPLAN PP, HISTMOVRESERVA H, CONTRIBUICAO C, BENEFICIO B,           '+
             '            EVENTOGERADOR EG                                                                                                     '+
             '     WHERE (TO_CHAR(H.DATAINDICE,''YYYY/MM'') = '''+psMesCobranca+''')  ';

      if (pbFiltraPatro = True) or (pstrSituacao <> '') or (pstrMatricula <> '')
     then begin
        if pbFiltraPatro
        then sSQL := sSQL + ' AND H.IDPESSJUR         = '+IntToStr(piIdPatroFiltro);

        if pstrSituacao <> ''
        then sSQL := sSQL + ' AND PP.IDSITPART IN ('+pstrSituacao+')';

        if pstrMatricula <> ''
        then sSQL := sSQL + ' AND EL.MATRICULA IN ('+pstrMatricula+')';
     end
     else begin
        sSQL := sSQL + ' AND    H.IDPESSJUR         = '+IntToStr(piIdPessJur)   +
                       ' AND    H.IDPESSOA          = '+IntToStr(piIdPessoa)    +
                       ' AND    H.IDPLANOPREV       = '+IntToStr(piIdPlanoPrev) ;
     end;

     sSQL := sSQL +' AND ((H.VLRCOTAS > 0) OR (H.VLRREAL > 0) )                                           '+
             '  AND    H.IDTIPORESERVA     IN (12,13,14,15,16,17,18,19,20,47,48,50,80,26,27)            '+
             '  AND    PP.IDPESSJUR        = H.IDPESSJUR                                                '+
             '  AND    PP.IDPLANOPREV      = H.IDPLANOPREV                                              '+
             '  AND    PP.IDPESSOA         = H.IDPESSOA                                                 '+
             '  AND    PP.SEQPROPOSTA      = H.SEQPROPOSTA                                              '+
             '  AND    EL.IDPESSJUR        = PP.IDPESSJUR                                               '+
             '  AND    EL.IDPESSOA         = PP.IDPESSOA                                                '+
             '  AND    P.IDPESSOA          = EL.IDPESSOA                                                '+
             '  AND    C.IDCONTRIBUICAO(+)    = H.IDCONTRIBUICAO                                           '+
             '  AND    B.IDBENEFICIO(+)       = H.IDBENEFICIO                                           '+
             '  AND    EG.IDEVENTOGERADOR(+)  = H.IDEVENTOGERADOR                                       '+
             '  GROUP BY H.IDPESSJUR, H.IDPLANOPREV, H.IDPESSOA, H.SEQPROPOSTA, EL.MATRICULA,           '+
             '           TO_CHAR(H.DATAINDICE,''DD/MM/YYYY''),                                      '+
             '           PP.INSCRICAODATA,                                                               '+
             '           P.NOME,                                                                          '+
             '           H.MESREFERENCIA, C.NOME,                                                          '+
             '           B.NOME,                                                                          '+
             '           EG.NOME,                                                                         '+
             '           H.IDTIPORESERVA,                                                                 '+
             '           H.FLGENTRADA, H.MESREFERENCIA ,                                                                  '+
             '           TO_CHAR(SYSDATE, ''DD/MM/YYYY'')                                                 '+

             '  UNION ALL                                                                               '+

             '  SELECT 2 AS TIPO, R.IDPESSJUR, R.IDPLANOPREV, R.IDPESSOA, R.SEQPROPOSTA, EL.MATRICULA,  '+
             '         PP.INSCRICAODATA,                                                                '+
             '         TO_CHAR(PP.INSCRICAODATA, ''DD/MM/YYYY'') AS DATA_LANCAMENTO,                    '+
             '         P.NOME        AS PARTICIPANTE,                                                   '+
             '         RP.NOME       AS DESCRICAO,                                                     '+
             '         DECODE(R.IDTIPORESERVA, 26, ''CONTA IDENTIFICADA DA PATROCINADORA (CPI)'',       '+
             '                                 27, ''CONTA IDENTIFICADA DA PATROCINADORA (CPI)'',       '+
             '                                     ''CONTA INDIVIDUAL DO PARTICIPANTE (CIP)'' ) AS NOME_CONTA, '+
             '         DECODE(R.IDTIPORESERVA, 26, ''CPI'',                                             '+
             '                                 27, ''CPI'',                                             '+
             '                                     ''CIP'' ) AS TIPO_CONTA,                             '+
             '         1 AS FLGENTRADA,                                                                 '+
             '         C.COTVALOR AS VALOR_DA_COTA,                                                     '+
             '         R.VALORRESERVA AS QUANT_COTA,                                                    '+
             '         C.COTVALOR * R.VALORRESERVA  AS VALOR_EM_REAL,                                   '+
             '         TO_CHAR(SYSDATE, ''DD/MM/YYYY'') AS DATASALDOANT, 0 AS SALDOANT, 0 AS SALDOANTCOTA, '+
             '         0 AS IDADEBSALDADO, 0 AS BSALDADO, 0 AS RESERVABSALDADO,                          '+
             '         TO_CHAR(PP.INSCRICAODATA, ''YYYY/MM'')  AS MESREFERENCIA                                 '+
             ' FROM    PESSOA P, ELEGPATRO EL, PARTPREVPLAN PP, RESERVAPART R , RESERVAXPLANO RP, COTACAOMOEDA C '+
             ' WHERE   TO_CHAR(PP.INSCRICAODATA, ''YYYY/MM'') <= '''+psMesCobranca+'''';

     if (pbFiltraPatro = True) or (pstrSituacao <> '') or (pstrMatricula <> '')
     then begin
        if pbFiltraPatro
        then sSQL := sSQL + ' AND R.IDPESSJUR         = '+IntToStr(piIdPatroFiltro);

        if pstrSituacao <> ''
        then sSQL := sSQL + ' AND PP.IDSITPART IN ('+pstrSituacao+')';

        if pstrMatricula <> ''
        then sSQL := sSQL + ' AND EL.MATRICULA IN ('+pstrMatricula+')';
     end
     else begin
        sSQL := sSQL + ' AND    R.IDPESSJUR         = '+IntToStr(piIdPessJur)   +
                       ' AND    R.IDPESSOA          = '+IntToStr(piIdPessoa)    +
                       ' AND    R.IDPLANOPREV       = '+IntToStr(piIdPlanoPrev) ;
     end;

     sSQL := sSQL +
             ' AND    R.IDTIPORESERVA     IN (12,13,14,15,16,17,18,19,20,47,48,50,80,26,27)            '+
             ' AND    PP.IDPESSJUR        = R.IDPESSJUR                                                '+
             ' AND    PP.IDPLANOPREV      = R.IDPLANOPREV                                              '+
             ' AND    PP.IDPESSOA         = R.IDPESSOA                                                 '+
             ' AND    PP.SEQPROPOSTA      = R.SEQPROPOSTA                                              '+
             ' AND    EL.IDPESSJUR        = PP.IDPESSJUR                                               '+
             ' AND    EL.IDPESSOA         = PP.IDPESSOA                                                '+
             ' AND    P.IDPESSOA          = EL.IDPESSOA                                                '+
             ' AND    RP.IDPLANOPREV      = R.IDPLANOPREV                                              '+
             ' AND    RP.IDTIPORESERVA    = R.IDTIPORESERVA                                            '+
             ' AND    R.VALORRESERVA     > 0                                                           '+
             ' AND    C.MOECODIGO(+)      = 112                                                        '+
             ' AND    ((TO_CHAR(C.COTDATA,''DD/MM/YYYY'') = TO_CHAR(PP.INSCRICAODATA,''DD/MM/YYYY'')) OR (C.COTDATA IS NULL) ) '+
             ' AND    (( NOT EXISTS (SELECT 1 FROM RESERVAXCONTRIB RC                                  '+
             '                       WHERE  RC.IDTIPORESERVA = R.IDTIPORESERVA                         '+
             '                       AND    RC.IDPLANOPREV = R.IDPLANOPREV) ) AND                      '+
             '         ( NOT EXISTS (SELECT 1 FROM HISTMOVRESERVA HM                                   '+
             '                       WHERE  HM.IDPESSJUR     = R.IDPESSJUR                             '+
             '                       AND    HM.IDPLANOPREV   = R.IDPLANOPREV                           '+
             '                       AND    HM.IDPESSOA      = R.IDPESSOA                              '+
             '                       AND    HM.SEQPROPOSTA   = R.SEQPROPOSTA                           '+
             '                       AND    HM.IDTIPORESERVA = R.IDTIPORESERVA)                        '+
             '          )                                                                              '+
             '         )                                                                               '+
             ' )                                                                                       '+
             ' ORDER BY MATRICULA, TIPO_CONTA, TO_DATE(DATA_LANCAMENTO,''DD/MM/YYYY''), NOME_CONTA, DESCRICAO ';

     cds.Data := GetDataPacket(sSQL);
      Flag_Tipo := 1;

     PreencheCamposCalculados( cds, Flag_Tipo );

     Result := cds.Data;
  finally
    cds.Free;
  end;


end;

function TCtrlExtratoReserva.EmiteExtratoReservaTrimestral( psMesCobranca   : string;
                                                            piIdPessJur     : longint;
                                                            piIdPlanoPrev   : longint;
                                                            piIdPessoa      : longint;
                                                            piSeqProposta   : longint;
                                                            pbFiltraPatro   : boolean;
                                                            piIdPatroFiltro : longint;
                                                            pstrSituacao    : string;
                                                            pstrMatricula   : string): OLEVariant;
var sSQL : string;
    cds  : TCMClientDataSet;
    sAnoMesIni : string;
    sAnoMesFim : string;
    Flag_Tipo : Integer;
begin
  sAnoMesFim := psMesCobranca;
  sAnoMesIni := SAnoMesAnterior(sAnoMesFim);
  sAnoMesIni := SAnoMesAnterior(sAnoMesIni);

  cds := TCMClientDataSet.Create(nil);
  try
    sSQL := ' SELECT IDPESSJUR, IDPLANOPREV, IDPESSOA, SEQPROPOSTA, MATRICULA, '+
             '        INSCRICAODATA, MESREFERENCIA,                               '+ 
             ''''+Copy(sAnoMesIni,6,2)+'/'+Copy(sAnoMesIni,1,4)+' - '+Copy(sAnoMesFim,6,2)+'/'+Copy(sAnoMesFim,1,4)+''' AS TRIMESTRE,  '+
             ''''+sAnoMesIni+''' AS ANOMESREF,                                                                                         '+
             '        DECODE( SUBSTR('''+sAnoMesIni+''',6,2),                   '+
             '                             ''01'', ''JANEIRO'',                 '+
             '                             ''02'', ''FEVEREIRO'',               '+
             '                             ''03'', ''MARçO'',                   '+
             '                             ''04'', ''ABRIL'',                   '+
             '                             ''05'', ''MAIO'',                    '+
             '                             ''06'', ''JUNHO'',                   '+
             '                             ''07'', ''JULHO'',                   '+
             '                             ''08'', ''AGOSTO'',                  '+
             '                             ''09'', ''SETEMBRO'',                '+
             '                             ''10'', ''OUTUBRO'',                 '+
             '                             ''11'', ''NOVEMBRO'',                '+
             '                             ''12'', ''DEZEMBRO'')||''/''||SUBSTR(+'''+psMesCobranca+''',1,4)  AS MESREF, '+ 
             '        DATA_LANCAMENTO, PARTICIPANTE, DESCRICAO, NOME_CONTA, TIPO_CONTA, FLGENTRADA,                     '+
             '        VALOR_DA_COTA, QUANT_COTA, VALOR_EM_REAL, DATASALDOANT,                                           '+
             '        0 AS SALDOANT, 0 AS SALDOANTCOTA,DATAALIMENTACAO,                                                 '+
             '        0 AS IDADEBSALDADO, 0 AS BSALDADO, 0 AS RESERVABSALDADO,                                          '+
             '        0 AS VALOR_ULT_COTA, ''          '' AS DATA_ULT_COTA                                              '+ 
             ' FROM                                                                                                     '+
             ' (                                                                                                        '+
             '    SELECT 1 AS TIPO, H.IDPESSJUR, H.IDPLANOPREV, H.IDPESSOA, H.SEQPROPOSTA, EL.MATRICULA,                '+
             '           PP.INSCRICAODATA,  TO_CHAR(H.DATAINDICE,''YYYY/MM'')  AS DATAALIMENTACAO,                      '+ 
             '           NVL(TO_CHAR(H.DATAINDICE, ''DD/MM/YYYY''), TO_CHAR(H.DATAINDICE,''DD/MM/YYYY'') ) AS DATA_LANCAMENTO, '+
             '           P.NOME        AS PARTICIPANTE,                                                                        '+
             '           NVL(DECODE(SUBSTR(H.MESREFERENCIA,6,2),''13'', DECODE(C.NOME, NULL, DECODE(B.NOME, NULL, ''Evento ''||EG.NOME, B.NOME), ''Alim. Mensal ''||C.NOME)||''(13o.)'' ,                   '+
             '                                                      DECODE(C.NOME, NULL, DECODE(B.NOME, NULL, ''Evento ''||EG.NOME,B.NOME),''Alim. Mensal ''||C.NOME)), ''Entrada Manual'') AS DESCRICAO, '+
             '           DECODE(H.IDTIPORESERVA, 26, ''CONTA IDENTIFICADA DA PATROCINADORA (CPI)'',                                            '+
             '                                   27, ''CONTA IDENTIFICADA DA PATROCINADORA (CPI)'',                                            '+
             '                                       ''CONTA INDIVIDUAL DO PARTICIPANTE (CIP)'' ) AS NOME_CONTA,                               '+
             '           DECODE(H.IDTIPORESERVA, 26, ''CPI'',                                                                                  '+
             '                                   27, ''CPI'',                                                                                  '+
             '                                       ''CIP'' ) AS TIPO_CONTA,                                                                  '+
             '           H.FLGENTRADA,                                                                                                         '+
             '           SUM(H.VALORINDICE) AS VALOR_DA_COTA,                                                                                  '+
             '           SUM(DECODE(H.FLGENTRADA,1, NVL(H.VLRCOTAS,0), -NVL(H.VLRCOTAS,0)))    AS QUANT_COTA,                                  '+
             '           SUM(DECODE(H.FLGENTRADA,1, NVL(H.VLRREAL,0) , -NVL(H.VLRREAL,0 )))    AS VALOR_EM_REAL,                               '+
             '           TO_CHAR(SYSDATE, ''DD/MM/YYYY'') AS DATASALDOANT, 0 AS SALDOANT, 0 AS SALDOANTCOTA,                                   '+
             '           0 AS IDADEBSALDADO, 0 AS BSALDADO, 0 AS RESERVABSALDADO , H.MESREFERENCIA                                             '+
             '     FROM   PESSOA P, ELEGPATRO EL, PARTPREVPLAN PP, HISTMOVRESERVA H, CONTRIBUICAO C,  BENEFICIO B,           '+
             '            EVENTOGERADOR EG                                                                                                     '+
             '     WHERE ( (TO_CHAR(H.DATAINDICE,''YYYY/MM'') >= '''+sAnoMesIni+''') AND  '+
             '             (TO_CHAR(H.DATAINDICE,''YYYY/MM'') <= '''+sAnoMesFim+''')      '+
             '           ) ';


     if (pbFiltraPatro = True) or (pstrSituacao <> '') or (pstrMatricula <> '')
     then begin
        if pbFiltraPatro
        then sSQL := sSQL + ' AND H.IDPESSJUR         = '+IntToStr(piIdPatroFiltro);

        if pstrSituacao <> ''
        then sSQL := sSQL + ' AND PP.IDSITPART IN ('+pstrSituacao+')';

        if pstrMatricula <> ''
        then sSQL := sSQL + ' AND EL.MATRICULA IN ('+pstrMatricula+')';
     end
     else begin
        sSQL := sSQL + ' AND    H.IDPESSJUR         = '+IntToStr(piIdPessJur)   +
                       ' AND    H.IDPESSOA          = '+IntToStr(piIdPessoa)    +
                       ' AND    H.IDPLANOPREV       = '+IntToStr(piIdPlanoPrev) ;
     end;

     sSQL := sSQL +' AND ((H.VLRCOTAS > 0) OR (H.VLRREAL > 0) )                                         '+
             '  AND    H.IDTIPORESERVA     IN (12,13,14,15,16,17,18,19,20,47,48,50,80,26,27)            '+
             '  AND    PP.IDPESSJUR        = H.IDPESSJUR                                                '+
             '  AND    PP.IDPLANOPREV      = H.IDPLANOPREV                                              '+
             '  AND    PP.IDPESSOA         = H.IDPESSOA                                                 '+
             '  AND    PP.SEQPROPOSTA      = H.SEQPROPOSTA                                              '+
             '  AND    EL.IDPESSJUR        = PP.IDPESSJUR                                               '+
             '  AND    EL.IDPESSOA         = PP.IDPESSOA                                                '+
             '  AND    P.IDPESSOA          = EL.IDPESSOA                                                '+
             '  AND    C.IDCONTRIBUICAO(+)    = H.IDCONTRIBUICAO                                        '+
             '  AND    B.IDBENEFICIO(+)       = H.IDBENEFICIO                                           '+
             '  AND    EG.IDEVENTOGERADOR(+)  = H.IDEVENTOGERADOR                                       '+
             '  GROUP BY H.IDPESSJUR, H.IDPLANOPREV, H.IDPESSOA, H.SEQPROPOSTA, EL.MATRICULA,           '+
             '           TO_CHAR(H.DATAINDICE,''DD/MM/YYYY''),                                          '+
             '           PP.INSCRICAODATA,                                                              '+
             '           P.NOME,                                                                        '+
             '           H.MESREFERENCIA, C.NOME,                                                       '+
             '           B.NOME,                                                                        '+
             '           EG.NOME,                                                                       '+
             '           H.IDTIPORESERVA,H.MESREFERENCIA ,                                              '+
             '           H.FLGENTRADA,                                                                  '+
             '           TO_CHAR(H.DATAINDICE,''YYYY/MM'') ,                                            '+ 
             '           TO_CHAR(SYSDATE, ''DD/MM/YYYY'')                                               '+

             '  UNION ALL                                                                               '+

             '  SELECT 2 AS TIPO, R.IDPESSJUR, R.IDPLANOPREV, R.IDPESSOA, R.SEQPROPOSTA, EL.MATRICULA,  '+
             '         PP.INSCRICAODATA,                                                                '+
             '         TO_CHAR(PP.INSCRICAODATA, ''DD/MM/YYYY'') AS DATA_LANCAMENTO,                    '+
             '         TO_CHAR(PP.INSCRICAODATA, ''DD/MM/YYYY'') AS DATAALIMENTACAO,                    '+
             '         P.NOME        AS PARTICIPANTE,                                                   '+
             '         RP.NOME        AS DESCRICAO,                                                     '+
             '         DECODE(R.IDTIPORESERVA, 26, ''CONTA IDENTIFICADA DA PATROCINADORA (CPI)'',       '+
             '                                 27, ''CONTA IDENTIFICADA DA PATROCINADORA (CPI)'',       '+
             '                                     ''CONTA INDIVIDUAL DO PARTICIPANTE (CIP)'' ) AS NOME_CONTA, '+
             '         DECODE(R.IDTIPORESERVA, 26, ''CPI'',                                             '+
             '                                 27, ''CPI'',                                             '+
             '                                     ''CIP'' ) AS TIPO_CONTA,                             '+
             '         1 AS FLGENTRADA,                                                                 '+
             '         C.COTVALOR AS VALOR_DA_COTA,                                                     '+
             '         R.VALORRESERVA AS QUANT_COTA,                                                    '+
             '         C.COTVALOR * R.VALORRESERVA  AS VALOR_EM_REAL,                                   '+
             '         TO_CHAR(SYSDATE, ''DD/MM/YYYY'') AS DATASALDOANT, 0 AS SALDOANT, 0 AS SALDOANTCOTA, '+
             '         0 AS IDADEBSALDADO, 0 AS BSALDADO, 0 AS RESERVABSALDADO,                         '+
             '         TO_CHAR(PP.INSCRICAODATA, ''YYYY/MM'') MESREFERENCIA                             '+
             ' FROM    PESSOA P, ELEGPATRO EL, PARTPREVPLAN PP, RESERVAPART R , RESERVAXPLANO RP, COTACAOMOEDA C '+
             ' WHERE   TO_CHAR(PP.INSCRICAODATA, ''YYYY/MM'') <= '''+sAnoMesIni+'''';

     if (pbFiltraPatro = True) or (pstrSituacao <> '') or (pstrMatricula <> '')
     then begin
        if pbFiltraPatro
        then sSQL := sSQL + ' AND R.IDPESSJUR         = '+IntToStr(piIdPatroFiltro);

        if pstrSituacao <> ''
        then sSQL := sSQL + ' AND PP.IDSITPART IN ('+pstrSituacao+')';

        if pstrMatricula <> ''
        then sSQL := sSQL + ' AND EL.MATRICULA IN ('+pstrMatricula+')';
     end
     else begin
        sSQL := sSQL + ' AND    R.IDPESSJUR         = '+IntToStr(piIdPessJur)   +
                       ' AND    R.IDPESSOA          = '+IntToStr(piIdPessoa)    +
                       ' AND    R.IDPLANOPREV       = '+IntToStr(piIdPlanoPrev) ;
     end;

     sSQL := sSQL +
             ' AND    R.IDTIPORESERVA     IN (12,13,14,15,16,17,18,19,20,47,48,50,80,26,27)            '+
             ' AND    PP.IDPESSJUR        = R.IDPESSJUR                                                '+
             ' AND    PP.IDPLANOPREV      = R.IDPLANOPREV                                              '+
             ' AND    PP.IDPESSOA         = R.IDPESSOA                                                 '+
             ' AND    PP.SEQPROPOSTA      = R.SEQPROPOSTA                                              '+
             ' AND    EL.IDPESSJUR        = PP.IDPESSJUR                                               '+
             ' AND    EL.IDPESSOA         = PP.IDPESSOA                                                '+
             ' AND    P.IDPESSOA          = EL.IDPESSOA                                                '+
             ' AND    RP.IDPLANOPREV      = R.IDPLANOPREV                                              '+
             ' AND    RP.IDTIPORESERVA    = R.IDTIPORESERVA                                            '+
             ' AND    R.VALORRESERVA     > 0                                                           '+
             ' AND    C.MOECODIGO(+)      = 112                                                        '+
             ' AND    ((TO_CHAR(C.COTDATA,''DD/MM/YYYY'') = TO_CHAR(PP.INSCRICAODATA,''DD/MM/YYYY'')) OR (C.COTDATA IS NULL) ) '+
             ' AND    (( NOT EXISTS (SELECT 1 FROM RESERVAXCONTRIB RC                                  '+
             '                       WHERE  RC.IDTIPORESERVA = R.IDTIPORESERVA                         '+
             '                       AND    RC.IDPLANOPREV = R.IDPLANOPREV) ) AND                      '+
             '         ( NOT EXISTS (SELECT 1 FROM HISTMOVRESERVA HM                                   '+
             '                       WHERE  HM.IDPESSJUR     = R.IDPESSJUR                             '+
             '                       AND    HM.IDPLANOPREV   = R.IDPLANOPREV                           '+
             '                       AND    HM.IDPESSOA      = R.IDPESSOA                              '+
             '                       AND    HM.SEQPROPOSTA   = R.SEQPROPOSTA                           '+
             '                       AND    HM.IDTIPORESERVA = R.IDTIPORESERVA)                        '+
             '          )                                                                              '+
             '         )                                                                               '+
             ' )                                                                                       '+
             ' ORDER BY MATRICULA, TIPO_CONTA, TO_DATE(DATA_LANCAMENTO,''DD/MM/YYYY''), NOME_CONTA, DESCRICAO                  ';



     cds.Data := GetDataPacket(sSQL);

     Flag_Tipo := 2;
     PreencheCamposCalculados( cds, Flag_Tipo );

     Result := cds.Data;
  finally
    cds.Free;
  end;


end;


function TCtrlExtratoReserva.EmiteExtratoReservaConsolidado( psAno           : string;
                                                             piIdPessJur     : longint;
                                                             piIdPlanoPrev   : longint;
                                                             piIdPessoa      : longint;
                                                             piSeqProposta   : longint;
                                                             pbFiltraPatro   : boolean;
                                                             piIdPatroFiltro : longint;
                                                             pstrSituacao    : string;
                                                             pstrMatricula   : string;
                                                             pbIncluiAnteriores : boolean ): OLEVariant;
var sSQL  : string;
    cds   : TCMClientDataSet;
    cds1  : TCMClientDataSet;
    sAnoMesIni : string;
    sAnoMesFim : string;
    Flag_Tipo : Integer;
    smesaux : string;
    smatriculaaux : string;
begin
  sAnoMesFim := psAno+'/13';
  sAnoMesIni := psAno+'/01';


  cds := TCMClientDataSet.Create(nil);
  cds1 := TCMClientDataSet.Create(nil);
  try

    sSQL :=   ' SELECT   HPART.TIPO, HPART.IDPESSJUR,  HPART.IDPLANOPREV,  HPART.IDPESSOA,  HPART.SEQPROPOSTA,  HPART.MATRICULA, '+
             ''''+sAnoMesIni+''' AS ANOMESREF, HPART.DATAINDICE,                                      '+
             ''''+psAno+''' AS ANO,                                                                  '+
             '''31/12/'+psAno+''' AS DATASALDOANT, 0 AS SALDOANT, 0 AS SALDOANTCOTA,                 '+
             '       ''XXX'' AS TIPO_CONTA,  ''XXXXXXXXXXXXXXX'' AS DATA_LANCAMENTO,                                                       '+
             '       0 AS IDADEBSALDADO, 0 AS BSALDADO, 0 AS RESERVABSALDADO,0 AS VALOR_DA_COTA ,     '+
             '       HPART.NOME        AS PARTICIPANTE,HPART.INSCRICAODATA, HPART.MESREFERENCIA,                                                 '+
             '       DECODE(SUBSTR(HPART.MESREFERENCIA,6,2), ''01'', ''Janeiro'',                              '+
             '                                              ''02'', ''Fevereiro'',           '+
             '                                              ''03'', ''Março'',               '+
             '                                              ''04'', ''Abril'',               '+
             '                                              ''05'', ''Maio'',                '+
             '                                              ''06'', ''Junho'',               '+
             '                                              ''07'', ''Julho'',               '+
             '                                              ''08'', ''Agosto'',              '+
             '                                              ''09'', ''Setembro'',            '+
             '                                              ''10'', ''Outubro'',             '+
             '                                              ''11'', ''Novembro'',            '+
             '                                              ''12'', ''Dezembro'')||''/''||SUBSTR(HPART.MESREFERENCIA,1,4) AS MESREFERENCIA, '+
             ' 0       AS QUANT_COTA_PATRO,                                  '+
             ' SUM(HPART.VLRCOTAS)   AS QUANT_COTA_PART,                                   '+
             ' 0  AS QUANT_COTA_TOTAL,           '+
             '    0      AS VALOR_EM_REAL_PATRO,                               '+
             ' SUM(HPART.VLRREAL)    AS VALOR_EM_REAL_PART,                                '+
             '  0  AS VALOR_EM_REAL_TOTAL,          '+
             '  ''99/99/9999'' AS DATA_ULT_COTA,  '+
             '  0  AS VALOR_ULT_COTA  '+
            ' FROM                ';

             sSQL :=  sSQL + '  (SELECT ''PART'' AS TIPO, H.DATAINDICE, TO_CHAR(H.DATAINDICE,''YYYY/MM'') AS MESREFERENCIA, H.IDPESSJUR, H.IDPLANOPREV, H.IDPESSOA,           '+
             '               H.SEQPROPOSTA,P.NOME,EL.MATRICULA, PP.INSCRICAODATA,'+
             '               SUM(DECODE(H.FLGENTRADA,1, NVL(H.VLRREAL,0) , -NVL(H.VLRREAL,0 )))    AS VLRREAL,                               '+
             '               SUM(DECODE(H.FLGENTRADA,1, NVL(H.VLRCOTAS,0), -NVL(H.VLRCOTAS,0))) AS VLRCOTAS '+
               '        FROM   HISTMOVRESERVA H, PESSOA P,      ELEGPATRO EL,      PARTPREVPLAN PP                                 '+
             '        WHERE  H.IDPLANOPREV = 33                                                 '+
             '        AND   ((H.VLRCOTAS > 0) OR  (H.VLRREAL > 0) )                              '+
             '        AND    H.IDTIPORESERVA IN (12,13,14,15,16,17,18,19,20,47,48,50,80)   '+
             '        AND    TO_CHAR(H.DATAINDICE,''YYYY/MM'') >= '''+psAno+'/01'+'''  '+
             '        AND    TO_CHAR(H.DATAINDICE,''YYYY/MM'') <= '''+psAno+'/12'+'''  ';
        if (pbFiltraPatro = True) or (pstrSituacao <> '') or (pstrMatricula <> '')
        then begin
        if pbFiltraPatro
        then sSQL := sSQL + ' AND H.IDPESSJUR         = '+IntToStr(piIdPatroFiltro);

        if pstrSituacao <> ''
        then sSQL := sSQL + ' AND PP.IDSITPART IN ('+pstrSituacao+')';

        if pstrMatricula <> ''
        then sSQL := sSQL + ' AND EL.MATRICULA IN ('+pstrMatricula+')';
     end
     else begin
        sSQL := sSQL + ' AND    H.IDPESSJUR         = '+IntToStr(piIdPessJur)   +
                       ' AND    H.IDPESSOA          = '+IntToStr(piIdPessoa)    +
                       ' AND    H.IDPLANOPREV       = '+IntToStr(piIdPlanoPrev) ;
     end;
     sSQL := sSQL + ' AND    P.IDPESSOA       = EL.IDPESSOA                                     '+
             ' AND    EL.IDPESSOA =   H.IDPESSOA                                                '+
             ' AND    H.IDPESSJUR(+)       = PP.IDPESSJUR                                       '+
             ' AND    H.IDPLANOPREV(+)     = PP.IDPLANOPREV                                     '+
             ' AND    H.IDPESSOA(+)        = PP.IDPESSOA                                        '+
             ' AND    H.SEQPROPOSTA(+)     = PP.SEQPROPOSTA                                     '+
             ' AND    H.IDPESSJUR         = PP.IDPESSJUR                                       '+
             ' AND    H.IDPLANOPREV       = PP.IDPLANOPREV                                     '+
             ' AND    H.IDPESSOA          = PP.IDPESSOA                                        '+
             ' AND    H.SEQPROPOSTA       = PP.SEQPROPOSTA                                     ';



        sSQL := sSQL +       '        GROUP BY  H.IDPESSJUR, H.IDPLANOPREV, H.IDPESSOA,         '+
             '                 H.SEQPROPOSTA ,                                                  '+
             '                  H.DATAINDICE, EL.MATRICULA ,P.NOME,PP.INSCRICAODATA        '+
             '                  ORDER BY  H.DATAINDICE ) HPART                                    ';

        sSQL := sSQL + 'GROUP BY  HPART.IDPESSJUR,  HPART.IDPLANOPREV,  HPART.IDPESSOA,  HPART.SEQPROPOSTA,  HPART.MATRICULA, '+
                      'HPART.DATAINDICE, '+   
                      'HPART.MESREFERENCIA, HPART.TIPO,   '+
                      '          HPART.NOME,HPART.INSCRICAODATA '+
                      'ORDER  BY  HPART.IDPESSJUR,  HPART.IDPLANOPREV,  HPART.IDPESSOA,  HPART.SEQPROPOSTA,  HPART.MATRICULA, HPART.MESREFERENCIA, '+
                      'HPART.TIPO ';

     cds.Data := GetDataPacket(sSQL);

     Flag_Tipo := 3;
     cds.First;
     while not cds.Eof do
     begin
     smesaux := cds.FieldbyName('mesreferencia').AsString ;
     smatriculaaux :=  cds.FieldbyName('matricula').AsString   ;
      sSQL :=   ' SELECT ''PATR'' AS TIPO,  TO_CHAR(H.DATAINDICE,''YYYY/MM'') AS MESREFERENCIA, H.IDPESSJUR, H.IDPLANOPREV, H.IDPESSOA,           '+
             '               H.SEQPROPOSTA,P.NOME,EL.MATRICULA,PP.INSCRICAODATA, '+
             '               SUM(DECODE(H.FLGENTRADA,1, NVL(H.VLRREAL,0) , -NVL(H.VLRREAL,0 )))    AS VLRREAL,    '+
             '               SUM(DECODE(H.FLGENTRADA,1, NVL(H.VLRCOTAS,0), -NVL(H.VLRCOTAS,0))) AS VLRCOTAS '+
             '         FROM   HISTMOVRESERVA H, PESSOA P, ELEGPATRO EL,  PARTPREVPLAN PP                                 '+
             '        WHERE  H.IDPLANOPREV = 33                                                 '+
             '        AND   ((H.VLRCOTAS > 0) OR (H.VLRREAL > 0) )                              '+
             '        AND    H.IDTIPORESERVA IN (26,27)        '+
             '        AND   TO_CHAR(H.DATAINDICE,''YYYY/MM'')  = '+QuotedStr(smesaux);

     if (pbFiltraPatro = True) or (pstrSituacao <> '') or (pstrMatricula <> '')
     then begin
        if pbFiltraPatro
        then sSQL := sSQL + ' AND H.IDPESSJUR         = '+IntToStr(piIdPatroFiltro);

        if pstrSituacao <> ''
        then sSQL := sSQL + ' AND PP.IDSITPART IN ('+pstrSituacao+')';

        if pstrMatricula <> ''
        then sSQL := sSQL + ' AND EL.MATRICULA = ('+smatriculaaux+')';
     end
     else begin
        sSQL := sSQL + ' AND    H.IDPESSJUR         = '+IntToStr(piIdPessJur)   +
                       ' AND    H.IDPESSOA          = '+IntToStr(piIdPessoa)    +
                       ' AND    H.IDPLANOPREV       = '+IntToStr(piIdPlanoPrev) ;
     end;
     sSQL := sSQL + ' AND    P.IDPESSOA       = EL.IDPESSOA                                        '+
             ' AND    H.IDPESSJUR(+)       = PP.IDPESSJUR                                       '+
             ' AND    H.IDPLANOPREV(+)     = PP.IDPLANOPREV                                     '+
             ' AND    EL.IDPESSOA =   H.IDPESSOA                                                '+
             ' AND    H.IDPESSOA(+)        = PP.IDPESSOA                                        '+
             ' AND    H.SEQPROPOSTA(+)     = PP.SEQPROPOSTA                                     '+
             ' AND    H.IDPESSJUR         = PP.IDPESSJUR                                       '+
             ' AND    H.IDPLANOPREV       = PP.IDPLANOPREV                                     '+
             ' AND    H.IDPESSOA          = PP.IDPESSOA                                        '+
             ' AND    H.SEQPROPOSTA       = PP.SEQPROPOSTA                                     ';


     sSQL := sSQL +  ' GROUP BY  H.IDPESSJUR, H.IDPLANOPREV, H.IDPESSOA,         '+
             '                 H.SEQPROPOSTA,                                                   '+
             '                 H.DATAINDICE ,EL.MATRICULA ,P.NOME,PP.INSCRICAODATA          '+
             '                 ORDER BY  H.DATAINDICE  ';
       cds1.Data := GetDataPacket(sSQL);


        cds.Edit;
        if not cds1.Eof    then
         begin
           cds.FieldByName('QUANT_COTA_PATRO').AsFloat :=
                           cds1.FieldByName('VLRCOTAS').AsFloat;
           cds.FieldByName('QUANT_COTA_TOTAL').AsFloat      :=
               cds.FieldByName('QUANT_COTA_PART').AsFloat + cds1.FieldByName('VLRCOTAS').AsFloat;
           cds.FieldByName('VALOR_EM_REAL_PATRO').AsFloat  :=
               cds1.FieldByName('VLRREAL').AsFloat ;
           cds.FieldByName('VALOR_EM_REAL_TOTAL').AsFloat  :=
                    cds.FieldByName('VALOR_EM_REAL_PART').AsFloat + cds1.FieldByName('VLRREAL').AsFloat;
         end else
         begin
          cds.FieldByName('QUANT_COTA_PATRO').AsFloat :=
                           0;
           cds.FieldByName('QUANT_COTA_TOTAL').AsFloat      :=
               cds.FieldByName('QUANT_COTA_PART').AsFloat ;
           cds.FieldByName('VALOR_EM_REAL_PATRO').AsFloat  :=
               0 ;
           cds.FieldByName('VALOR_EM_REAL_TOTAL').AsFloat  :=
                    cds.FieldByName('VALOR_EM_REAL_PART').AsFloat ;

         end;
       cds.Post;
      cds.Next;
     end;


     PreencheCamposCalculados( cds,Flag_Tipo );

     Result := cds.Data;
  finally
    cds.Free;
    cds1.Free;
  end;

end;

function TCtrlExtratoReserva.SAnoMesAnterior(sAnoMes: string): string;
var iAno, iMes : integer;
begin
   Result := '';
   iAno := StrToInt(Copy(sAnoMes,1,4));
   iMes := StrToInt(Copy(sAnoMes,6,2));
   Result := AnoMesAnterior(iMes,iAno);
end;

function TCtrlExtratoReserva.VoltaValorCotacao(sIndiceReajuste,
                                               sIdPlanoPrev ,
                                               sIdTipoReserva,
                                               sDataMov : String;
                                               piBuscaPelaData : Integer = 0   ) : double;
var cAux : char ;
    stipoMoeda : String;
    cds : TCMClientDataSet;
begin
  if Trim(sIndiceReajuste) = '' then Exit;

  Result := 0;
  cds    := TCMClientDataSet.Create(nil);

  try
    cds.Data := GetDataPacket( ' SELECT  MOEPERIODICIDADE ' +
                               ' FROM MOEDA '               +
                               ' WHERE MOECODIGO = 112');
    if cds.IsEmpty then
    begin
      Result := 0;
      Exit;
    end;

    sTipoMoeda := cds.FieldByName('MOEPERIODICIDADE').AsString;
    if sTipoMoeda = 'M' then
    Begin
      cds.Close;

      If piBuscaPelaData = 0 Then
        cds.Data := GetDataPacket( 'SELECT  COTVALOR,COTDATA '                                +
                                   ' FROM COTACAOMOEDA '                                      +
                                   ' WHERE MOECODIGO = ' + sIndiceReajuste + ' '              +
                                   '   AND COTDATA = '                                        +
                                   '                 (SELECT MAX(COTDATA) FROM COTACAOMOEDA ' +
                                   '                  WHERE MOECODIGO = 112  )')
       Else
         cds.Data := GetDataPacket( 'SELECT  COTVALOR,COTDATA '                                +
                                    ' FROM COTACAOMOEDA '                                      +
                                    ' WHERE MOECODIGO = ' + sIndiceReajuste + ' '              +
                                    '   AND COTDATA = '                                        +
                                    '                 (SELECT MAX(COTDATA) FROM COTACAOMOEDA ' +
                                    '                  WHERE MOECODIGO = 112  '                +
                                    '                    AND COTDATA   <= TO_DATE(''' + sDataMov +''',''DD/MM/YYYY'') ) ');
      DATAGERAL   := FormatDateTime('dd/mm/yyyy', cds.fieldbyname('COTDATA').AsDateTime) ; 
    end
    else
    begin
      cds.Close;

      If piBuscaPelaData = 0 Then
        cds.Data := GetDataPacket( ' SELECT  COTVALOR,COTDATA '                                +
                                   ' FROM COTACAOMOEDA '                                      +
                                   ' WHERE MOECODIGO = '+sIndiceReajuste+' '                  +
                                   '   AND COTDATA = '                                        +
                                   '                 (SELECT MAX(COTDATA) FROM COTACAOMOEDA ' +
                                   '                  WHERE MOECODIGO =   112 ) ')
      Else
        cds.Data := GetDataPacket( ' SELECT  COTVALOR,COTDATA '+
                                   ' FROM COTACAOMOEDA '+
                                   ' WHERE MOECODIGO = '+sIndiceReajuste+' '+
                                   '   AND COTDATA   = '+
                                   '                   (SELECT MAX(COTDATA) FROM COTACAOMOEDA '+
                                   '                    WHERE MOECODIGO =  112   '+
                                   '                      AND COTDATA   <= TO_DATE(''' + sDataMov +''',''DD/MM/YYYY'') ) ');

      DATAGERAL   := FormatDateTime('dd/mm/yyyy', cds.fieldbyname('COTDATA').AsDATETIME); 
    end;

    if cds.IsEmpty then
    begin
      Result := 0;
      Exit;
    end
    else
    begin
      Result := cds.fieldbyname('COTVALOR').AsFloat;
    end;

  finally
     cds.Free;
  end;
end;

function TCtrlExtratoReserva.BuscaFundacao(
  piIdFundacao: longint): OLEVariant;
begin
   Result := GetDataPacket( 'SELECT P.NOME , P.RAZAOSOCIAL, '+
                            '       RTRIM(E.LOGRADOURO)||'' - ''||RTRIM(E.NUMERO)||'' - ''||RTRIM(E.COMPLEMENTO)||'' - ''|| '+
                            '       RTRIM(E.BAIRRO)||'' - ''||RTRIM(C.NOME)||'' - ''||RTRIM(ES.CODESTADO) AS LOGRADOURO,    '+
                            '       E.IDENDERECO,E.CEP, I.IDIMAGEM, I.IMAGEM                                                '+
                            ' FROM   PESSOA P, ENDPESS E, IMAGENS I, CIDADES C, ESTADO ES                                   '+
                            ' WHERE ( P.IDPESSOA      = '+IntToStr(piIdFundacao)+' )                                        '+
                            ' AND   ( E.IDENDERECO(+) = P.IDENDCOMERCIAL)                                                   '+
                            ' AND   ( C.IDCIDADES(+)  = E.IDCIDADES     )                                                   '+
                            ' AND   ( ES.IDESTADO(+)  = C.IDESTADO      )                                                   '+
                            ' AND   ( I.IDIMAGEM(+)   = P.IDIMAGEM      )                                                   ');
end;


function TCtrlExtratoReserva.BuscaDataCota(piIdPessJur,
                                           piIdPlanoPrev,
                                           piIdPessoa,
                                           piSeqProposta   : longint;
                                           psMesReferencia : string): string;
var cds : TCMClientDataSet;
begin

 Result := '';
 cds    := TCMClientDataSet.Create(nil);
 try
    cds.Data := GetDataPacket( ' SELECT MAX(TO_CHAR(H.DATAINDICE, ''DD/MM/YYYY'')) AS DATA_LANCAMENTO  '+
                               ' FROM   HISTMOVRESERVA H                           '+
                               ' WHERE  H.IDPESSJUR         = '+IntToStr(piIdPessJur)                     +
                               ' AND    H.IDPLANOPREV       = '+IntToStr(piIdPlanoPrev)                   +
                               ' AND    H.IDPESSOA          = '+IntToStr(piIdPessoa)                      +
                               ' AND    H.SEQPROPOSTA       = '+IntToStr(piSeqProposta)                   +
                               ' AND    H.MESREFERENCIA     = '''+psMesReferencia+'''                     '+
                               ' AND    H.IDCONTRIBUICAO    IS NOT NULL                                   ');

    if cds.IsEmpty
    then Result := ''
    else Result := cds.FieldByName('DATA_LANCAMENTO').AsString;
 finally
    cds.Free;
 end;
end;

function TCtrlExtratoReserva.BuscaPatro(piIdFundacao: longint): OLEVariant;
begin
   Result := GetDataPacket( ' SELECT * FROM '+
                            ' ( SELECT 1 AS ORDEM, P.IDPESSOA, P.NOME '+
                            '   FROM   PESSOA P, PATRO PT             '+
                            '   WHERE  PT.IDPESSOA = P.IDPESSOA       '+
                            '   UNION                                 '+
                            '   SELECT 0 AS ORDEM, -1 AS IDPESSOA, ''< Todas > '' AS NOME FROM DUAL '+
                            ' ) '+
                            ' ORDER BY ORDEM, NOME ');

end;


function TCtrlExtratoReserva.BuscaSituacao(piIdFundacao: longint): OLEVariant;
begin
   Result := GetDataPacket( ' SELECT 1 AS FILTRA, IDSITPART, DESCRICAO '+
                            ' FROM   SITPART                           '+
                            ' WHERE IDSITPART IN (1,18,53,57,19,32,10,11,12,13,16,17,21,3) '+
                            ' ORDER BY DESCRICAO                       ');

end;



end.

