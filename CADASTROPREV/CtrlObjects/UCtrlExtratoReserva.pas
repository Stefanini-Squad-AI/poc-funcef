unit UCtrlExtratoReserva;

interface

Uses SysUtils, uCmControlObject, uCmDbObject,
     {$IFDEF VERSAO0505} uComum, uSistema, {$ELSE} uCMTypes, {$ENDIF}
     uCmClientDataSet, uMidasUtil;

Type

  TCtrlExtratoReserva = class(TCmControlObject)
  private

  protected

  public
     function EmiteExtratoReservaMensal( psMesCobranca   : string;
                                         piIdPessJur     : longint;
                                         piIdPlanoPrev   : longint;
                                         piIdPessoa      : longint;
                                         piSeqProposta   : longint;
                                         pbFiltraPatro   : boolean;
                                         piIdPatroFiltro : longint;
                                         pstrSituacao    : string;
                                         pstrMatricula   : string): OLEVariant;

     function EmiteExtratoReservaTrimestral
                                       ( psMesCobranca   : string;
                                         piIdPessJur     : longint;
                                         piIdPlanoPrev   : longint;
                                         piIdPessoa      : longint;
                                         piSeqProposta   : longint;
                                         pbFiltraPatro   : boolean;
                                         piIdPatroFiltro : longint;
                                         pstrSituacao    : string;
                                         pstrMatricula   : string): OLEVariant;
     function EmiteExtratoReservaConsolidado
                                       ( psAno           : string;
                                         piIdPessJur     : longint;
                                         piIdPlanoPrev   : longint;
                                         piIdPessoa      : longint;
                                         piSeqProposta   : longint;
                                         pbFiltraPatro   : boolean;
                                         piIdPatroFiltro : longint;
                                         pstrSituacao    : string;
                                         pstrMatricula   : string): OLEVariant;
     function TrazUltDiaData     ( aData           : TDateTime  ) : TDateTime;

     function SAnoMesAnterior    ( sAnoMes         : string     ) : string;

     function AnoMesAnterior     ( iMes            : integer;
                                   iAno            : integer    ) : string;

     function BuscaSaldoNoMes    ( piIdPessJur     : longint;
                                   piIdPlanoPrev   : longint;
                                   piIdPessoa      : longint;
                                   piSeqProposta   : longint;
                                   psMesReferencia : string;
                                   psCodHierarquia : string;
                                   pbBuscaAtual    : boolean    ) : double;

     function BuscaDataCota      ( piIdPessJur,
                                   piIdPlanoPrev,
                                   piIdPessoa,
                                   piSeqProposta   : longint;
                                   psMesReferencia : string): string;
                                   
     function VoltaValorCotacao  ( sIndiceReajuste : string;
                                   sIdPlanoPrev    : string;
                                   sIdTipoReserva  : string;
                                   sDataMov        : string     ) : double;
     function BuscaFundacao      ( piIdFundacao    : longint    ) : OLEVariant;

     function BuscaPatro         ( piIdFundacao    : longint    ) : OLEVariant;

     function BuscaSituacao      ( piIdFundacao    : longint    ) : OLEVariant;

     procedure PreencheCamposCalculados( cds : TCMClientDataSet);
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

procedure TCtrlExtratoReserva.PreencheCamposCalculados( cds : TCMClientDataSet);
var sTipoReserva : string;
    sAnoMesAnt : string;
    dAux       : double;
    sDataAux   : string;
    dCota      : double;
begin

     { DAVID - 10/09/03
       A linha abaixo foi adicionada para resolver um problema com conexões ADO,
       que faz com que qualquer dataset venha como "ReadOnly". A função utilizada
       remonta o dataset, permitindo a sua atualização.}
     cds.Data := CopyClientDataSet( cds );

     cds.First;
     while not cds.Eof do
     begin
        sAnoMesAnt := SAnoMesAnterior(cds.FieldbyName('ANOMESREF').AsString);
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
        end;

        
        sDataAux := BuscaDataCota (cds.FieldByName('IDPESSJUR').AsInteger,
                                   cds.FieldByName('IDPLANOPREV').AsInteger,
                                   cds.FieldByName('IDPESSOA').AsInteger,
                                   cds.FieldByName('SEQPROPOSTA').AsInteger,
                                   sAnoMesAnt);

        dCota    := VoltaValorCotacao('112', '','', sDataAux);

        cds.Edit;
        cds.FieldByName('DATASALDOANT').AsString := sDataAux;
        cds.FieldByName('SALDOANT').AsFloat      := dAux * dCota;
        cds.FieldByName('SALDOANTCOTA').AsFloat  := dAux;
        cds.Post;

        dAux := BuscaSaldoNoMes (cds.FieldByName('IDPESSJUR').AsInteger,
                                 cds.FieldByName('IDPLANOPREV').AsInteger,
                                 cds.FieldByName('IDPESSOA').AsInteger,
                                 cds.FieldByName('SEQPROPOSTA').AsInteger,
                                 cds.FieldbyName('ANOMESREF').AsString,
                                 '518', True);

        cds.Edit;
        cds.FieldByName('IDADEBSALDADO').AsInteger := Trunc(dAux/12); // a idade está em meses

        dAux := BuscaSaldoNoMes (cds.FieldByName('IDPESSJUR').AsInteger,
                                 cds.FieldByName('IDPLANOPREV').AsInteger,
                                 cds.FieldByName('IDPESSOA').AsInteger,
                                 cds.FieldByName('SEQPROPOSTA').AsInteger,
                                 cds.FieldbyName('ANOMESREF').AsString,
                                 '303', True);

        cds.FieldByName('BSALDADO').AsFloat := dAux;

        dAux := BuscaSaldoNoMes (cds.FieldByName('IDPESSJUR').AsInteger,
                                 cds.FieldByName('IDPLANOPREV').AsInteger,
                                 cds.FieldByName('IDPESSOA').AsInteger,
                                 cds.FieldByName('SEQPROPOSTA').AsInteger,
                                 cds.FieldbyName('ANOMESREF').AsString,
                                 '401', True);

        dAux := dAux + BuscaSaldoNoMes (cds.FieldByName('IDPESSJUR').AsInteger,
                                 cds.FieldByName('IDPLANOPREV').AsInteger,
                                 cds.FieldByName('IDPESSOA').AsInteger,
                                 cds.FieldByName('SEQPROPOSTA').AsInteger,
                                 cds.FieldbyName('ANOMESREF').AsString,
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
begin

 cds := TCMClientDataSet.Create(nil);
 try
     Result := 0;
     cds.Data := GetDataPacket(' SELECT H.SALDOCOTAS '+
                    ' FROM   HISTMOVRESERVA H '+
                    ' WHERE  H.IDPESSJUR   = '+IntToStr(piIdPessJur)+
                    ' AND    H.IDPLANOPREV = '+IntToStr(piIdPlanoPrev)+
                    ' AND    H.IDPESSOA    = '+IntToStr(piIdPessoa)+
                    ' AND    H.SEQPROPOSTA = '+IntToStr(piSeqProposta)+
                    ' AND    H.IDHISTRESERVA = ( SELECT MAX(HT.IDHISTRESERVA) '+
                    '                            FROM   HISTMOVRESERVA HT, RESERVAXPLANO RP  '+
                    '                            WHERE  HT.IDPESSJUR   = '+IntToStr(piIdPessJur)+
                    '                            AND    HT.IDPLANOPREV = '+IntToStr(piIdPlanoPrev)+
                    '                            AND    HT.IDPESSOA    = '+IntToStr(piIdPessoa)+
                    '                            AND    HT.SEQPROPOSTA = '+IntToStr(piSeqProposta)+
                    '                            AND    HT.MESREFERENCIA = '''+psMesReferencia+''''+
                    '                            AND    HT.IDCONTRIBUICAO IS NOT NULL               '+
                    '                            AND    RP.IDPLANOPREV   = HT.IDPLANOPREV '+
                    '                            AND    RP.IDTIPORESERVA = HT.IDTIPORESERVA '+
                    '                            AND    RP.CODHIERARQUIA = '''+psCodHierarquia+''') ');
     if not cds.IsEmpty
     then Result := cds.FieldByname('SALDOCOTAS').AsFloat
     else begin
        if pbBuscaAtual
        then begin
           cds.Data := GetDataPacket(' SELECT RP.VALORRESERVA '+
                          ' FROM   RESERVAPART RP, RESERVAXPLANO R '+
                          ' WHERE  RP.IDPESSJUR    = '+IntToStr(piIdPessJur)+
                          ' AND    RP.IDPLANOPREV  = '+IntToStr(piIdPlanoPrev)+
                          ' AND    RP.IDPESSOA     = '+IntToStr(piIdPessoa)+
                          ' AND    RP.SEQPROPOSTA  = '+IntToStr(piSeqProposta)+
                          ' AND    R.IDPLANOPREV   = RP.IDPLANOPREV '+
                          ' AND    R.IDTIPORESERVA = RP.IDTIPORESERVA '+
                          ' AND    R.CODHIERARQUIA = '''+psCodHierarquia+''' ');
           if not cds.IsEmpty
           then Result := cds.FieldByname('VALORRESERVA').AsFloat
        end;
     end;  
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
begin

  cds := TCMClientDataSet.Create(nil);
  try
     sSQL := ' SELECT H.IDPESSJUR, H.IDPLANOPREV, H.IDPESSOA, H.SEQPROPOSTA, EL.MATRICULA,                                             '+
             '        H.MESREFERENCIA AS ANOMESREF,                                                                                    '+
             '        DECODE(SUBSTR(H.MESREFERENCIA,6,2), ''01'', ''Janeiro'',                                                          '+
             '                                            ''02'', ''Fevereiro'',                                                        '+
             '                                            ''03'', ''Março'',                                                            '+
             '                                            ''04'', ''Abril'',                                                            '+
             '                                            ''05'', ''Maio'',                                                             '+
             '                                            ''06'', ''Junho'',                                                            '+
             '                                            ''07'', ''Julho'',                                                            '+
             '                                            ''08'', ''Agosto'',                                                           '+
             '                                            ''09'', ''Setembro'',                                                         '+
             '                                            ''10'', ''Outubro'',                                                          '+
             '                                            ''11'', ''Novembro'',                                                         '+
             '                                            ''12'', ''Dezembro'')||''/''||SUBSTR(H.MESREFERENCIA,1,4) AS MESREFERENCIA,   '+
             '       TO_CHAR(HC.DATARECEBIMENTO, ''DD/MM/YYYY'') AS DATA_LANCAMENTO,                                                    '+
             '       P.NOME        AS PARTICIPANTE,                                                                                     '+
             '       DECODE(H.IDTIPORESERVA, 26, ''Conta Identificada da Patrocinadora (CPI)'',                                         '+
             '                               27, ''Conta Identificada da Patrocinadora (CPI)'',                                         '+
             '                                   ''Conta Individual do Participante (CIP)'' ) AS NOME_CONTA,                            '+
             '       DECODE(H.IDTIPORESERVA, 26, ''CPI'',                                                                               '+
             '                               27, ''CPI'',                                                                               '+
             '                                   ''CIP'' ) AS TIPO_CONTA,                                                               '+
             '       C.NOME               AS DESCRICAO,                                                                                 '+
             '       H.FLGENTRADA,                                                                                                      '+
             '       NVL(H.VALORINDICE,0) AS VALOR_DA_COTA,                                                                             '+
             '       DECODE(H.FLGENTRADA,1, NVL(H.VLRCOTAS,0), -NVL(H.VLRCOTAS,0))    AS QUANT_COTA,                               '+
             '       DECODE(H.FLGENTRADA,1, NVL(H.VLRREAL,0) , -NVL(H.VLRREAL,0 ))    AS VALOR_EM_REAL,                            '+
             '       SYSDATE AS DATASALDOANT, 0 AS SALDOANT, 0 AS SALDOANTCOTA, 0 AS IDADEBSALDADO, 0 AS BSALDADO, 0 AS RESERVABSALDADO  '+
             ' FROM   PESSOA P, ELEGPATRO EL, PARTPREVPLAN PP, HISTMOVRESERVA H, CONTRIBUICAO C, HSTCONTRIBPREV HC                 '+
             ' WHERE  H.MESREFERENCIA     = '''+psMesCobranca+'''                                                                  ';
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

     sSQL := sSQL +
             ' AND    H.IDTIPORESERVA     IN (12,13,14,15,16,17,18,19,20,47,48,50,80,26,27)                                             '+
             ' AND    PP.IDPESSJUR        = H.IDPESSJUR                                                                                 '+
             ' AND    PP.IDPLANOPREV      = H.IDPLANOPREV                                                                               '+
             ' AND    PP.IDPESSOA         = H.IDPESSOA                                                                                  '+
             ' AND    PP.SEQPROPOSTA      = H.SEQPROPOSTA                                                                               '+
             ' AND    EL.IDPESSJUR        = PP.IDPESSJUR                                                                                '+
             ' AND    EL.IDPESSOA         = PP.IDPESSOA                                                                                 '+
             ' AND    P.IDPESSOA          = EL.IDPESSOA                                                                                 '+
             ' AND    C.IDCONTRIBUICAO    = H.IDCONTRIBUICAO                                                                            '+
             ' AND    HC.IDPESSJUR        = H.IDPESSJUR                                                                                 '+
             ' AND    HC.IDPLANOPREV      = H.IDPLANOPREV                                                                               '+
             ' AND    HC.IDPESSOA         = H.IDPESSOA                                                                                  '+
             ' AND    HC.SEQPROPOSTA      = H.SEQPROPOSTA                                                                               '+
             ' AND    HC.MESCOBRANCA      = H.MESREFERENCIA                                                                             '+
             ' AND    HC.IDCONTRIBUICAO   = H.IDCONTRIBUICAO                                                                            '+
             ' ORDER BY MATRICULA, TIPO_CONTA, NOME_CONTA, DATA_LANCAMENTO, DESCRICAO  ';     cds.Data := GetDataPacket(sSQL);

     PreencheCamposCalculados( cds );

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
begin
  sAnoMesFim := psMesCobranca;
  sAnoMesIni := SAnoMesAnterior(sAnoMesFim);
  sAnoMesIni := SAnoMesAnterior(sAnoMesIni);

  cds := TCMClientDataSet.Create(nil);
  try
     sSQL := ' SELECT H.IDPESSJUR, H.IDPLANOPREV, H.IDPESSOA, H.SEQPROPOSTA, EL.MATRICULA,                                             '+
             ''''+Copy(sAnoMesIni,6,2)+'/'+Copy(sAnoMesIni,1,4)+' - '+Copy(sAnoMesFim,6,2)+'/'+Copy(sAnoMesFim,1,4)+''' AS TRIMESTRE,  '+
             ''''+sAnoMesIni+''' AS ANOMESREF,                                                                                         '+
             '        DECODE(SUBSTR(H.MESREFERENCIA,6,2), ''01'', ''Janeiro'',                                                          '+
             '                                            ''02'', ''Fevereiro'',                                                        '+
             '                                            ''03'', ''Março'',                                                            '+
             '                                            ''04'', ''Abril'',                                                            '+
             '                                            ''05'', ''Maio'',                                                             '+
             '                                            ''06'', ''Junho'',                                                            '+
             '                                            ''07'', ''Julho'',                                                            '+
             '                                            ''08'', ''Agosto'',                                                           '+
             '                                            ''09'', ''Setembro'',                                                         '+
             '                                            ''10'', ''Outubro'',                                                          '+
             '                                            ''11'', ''Novembro'',                                                         '+
             '                                            ''12'', ''Dezembro'')||''/''||SUBSTR(H.MESREFERENCIA,1,4) AS MESREFERENCIA,   '+
             '       TO_CHAR(HC.DATARECEBIMENTO, ''DD/MM/YYYY'') AS DATA_LANCAMENTO,                                                    '+
             '       P.NOME        AS PARTICIPANTE,                                                                                     '+
             '       DECODE(H.IDTIPORESERVA, 26, ''Conta Identificada da Patrocinadora (CPI)'',                                         '+
             '                               27, ''Conta Identificada da Patrocinadora (CPI)'',                                         '+
             '                                   ''Conta Individual do Participante (CIP)'' ) AS NOME_CONTA,                            '+
             '       DECODE(H.IDTIPORESERVA, 26, ''CPI'',                                                                               '+
             '                               27, ''CPI'',                                                                               '+
             '                                   ''CIP'' ) AS TIPO_CONTA,                                                               '+
             '       C.NOME               AS DESCRICAO,                                                                                 '+
             '       H.FLGENTRADA,                                                                                                      '+
             '       NVL(H.VALORINDICE,0) AS VALOR_DA_COTA,                                                                             '+
             '       DECODE(H.FLGENTRADA,1, NVL(H.VLRCOTAS,0), -NVL(H.VLRCOTAS,0))    AS QUANT_COTA,                                    '+
             '       DECODE(H.FLGENTRADA,1, NVL(H.VLRREAL,0) , -NVL(H.VLRREAL,0 ))    AS VALOR_EM_REAL,                                 '+
             '       SYSDATE AS DATASALDOANT, 0 AS SALDOANT, 0 AS SALDOANTCOTA, 0 AS IDADEBSALDADO, 0 AS BSALDADO, 0 AS RESERVABSALDADO '+
             ' FROM   PESSOA P, ELEGPATRO EL, PARTPREVPLAN PP, HISTMOVRESERVA H, CONTRIBUICAO C, HSTCONTRIBPREV HC                      '+
             ' WHERE  H.MESREFERENCIA     >= '''+sAnoMesIni+'''                                                                         '+
             ' AND    H.MESREFERENCIA     <= '''+sAnoMesFim+'''                                                                         ';

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

     sSQL := sSQL + ' AND    H.IDTIPORESERVA     IN (12,13,14,15,16,17,18,19,20,47,48,50,80,26,27)                                             '+
             ' AND    PP.IDPESSJUR        = H.IDPESSJUR                                                                                 '+
             ' AND    PP.IDPLANOPREV      = H.IDPLANOPREV                                                                               '+
             ' AND    PP.IDPESSOA         = H.IDPESSOA                                                                                  '+
             ' AND    PP.SEQPROPOSTA      = H.SEQPROPOSTA                                                                               '+
             ' AND    EL.IDPESSJUR        = PP.IDPESSJUR                                                                                '+
             ' AND    EL.IDPESSOA         = PP.IDPESSOA                                                                                 '+
             ' AND    P.IDPESSOA          = EL.IDPESSOA                                                                                 '+
             ' AND    C.IDCONTRIBUICAO    = H.IDCONTRIBUICAO                                                                            '+
             ' AND    HC.IDPESSJUR        = H.IDPESSJUR                                                                                 '+
             ' AND    HC.IDPLANOPREV      = H.IDPLANOPREV                                                                               '+
             ' AND    HC.IDPESSOA         = H.IDPESSOA                                                                                  '+
             ' AND    HC.SEQPROPOSTA      = H.SEQPROPOSTA                                                                               '+
             ' AND    HC.MESCOBRANCA      = H.MESREFERENCIA                                                                             '+
             ' AND    HC.IDCONTRIBUICAO   = H.IDCONTRIBUICAO                                                                            '+
             ' ORDER BY MATRICULA, TIPO_CONTA, NOME_CONTA, DATA_LANCAMENTO, DESCRICAO  ';

     cds.Data := GetDataPacket(sSQL);


     PreencheCamposCalculados( cds );

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
                                                             pstrMatricula   : string): OLEVariant;
var sSQL : string;
    cds  : TCMClientDataSet;
    sAnoMesIni : string;
    sAnoMesFim : string;
begin
  sAnoMesFim := psAno+'/13';
  sAnoMesIni := psAno+'/01';


  cds := TCMClientDataSet.Create(nil);
  try
     sSQL := ' SELECT   PP.IDPESSJUR,  PP.IDPLANOPREV,  PP.IDPESSOA,  PP.SEQPROPOSTA,  EL.MATRICULA, '+
             ''''+sAnoMesIni+''' AS ANOMESREF,                                                       '+
             ''''+psAno+''' AS ANO,                                                                  '+
             '''31/12/'+psAno+''' AS DATASALDOANT, 0 AS SALDOANT, 0 AS SALDOANTCOTA,                 '+
             '       ''XXX'' AS TIPO_CONTA,                                                          '+
             '       0 AS IDADEBSALDADO, 0 AS BSALDADO, 0 AS RESERVABSALDADO,                        '+
             '       P.NOME        AS PARTICIPANTE,                                                  '+
             '       DECODE(SUBSTR(MESES.MES,6,2), ''01'', ''Janeiro'',                              '+
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
             '                                              ''12'', ''Dezembro'')||''/''||SUBSTR(HPAT.MESREFERENCIA,1,4) AS MESREFERENCIA, '+
             ' HPAT.DATA_LANCAMENTO,                                                         '+                            
             ' NVL(HPAT.VALORINDICE,0) AS VALOR_DA_COTA,                                     '+
             ' NVL(HPAT.VLRCOTAS,0)    AS QUANT_COTA_PATRO,                                  '+
             ' NVL(HPART.VLRCOTAS,0)   AS QUANT_COTA_PART,                                   '+
             ' (NVL(HPAT.VLRCOTAS,0) + NVL(HPART.VLRCOTAS,0)) AS QUANT_COTA_TOTAL,           '+
             ' NVL(HPAT.VLRREAL,0)     AS VALOR_EM_REAL_PATRO,                               '+
             ' NVL(HPART.VLRREAL,0)    AS VALOR_EM_REAL_PART,                                '+
             ' (NVL(HPAT.VLRREAL,0) +  NVL(HPART.VLRREAL,0)) AS VALOR_EM_REAL_TOTAL          '+
             ' FROM  PESSOA P,      ELEGPATRO EL,      PARTPREVPLAN PP,                      '+
             '      ( SELECT '''+psAno+'/01'' AS MES FROM DUAL UNION                         '+
             '        SELECT '''+psAno+'/02'' AS MES FROM DUAL UNION                         '+
             '        SELECT '''+psAno+'/03'' AS MES FROM DUAL UNION                         '+
             '        SELECT '''+psAno+'/04'' AS MES FROM DUAL UNION                         '+
             '        SELECT '''+psAno+'/05'' AS MES FROM DUAL UNION                         '+
             '        SELECT '''+psAno+'/06'' AS MES FROM DUAL UNION                         '+
             '        SELECT '''+psAno+'/07'' AS MES FROM DUAL UNION                         '+
             '        SELECT '''+psAno+'/08'' AS MES FROM DUAL UNION                         '+
             '        SELECT '''+psAno+'/09'' AS MES FROM DUAL UNION                         '+
             '        SELECT '''+psAno+'/10'' AS MES FROM DUAL UNION                         '+
             '        SELECT '''+psAno+'/11'' AS MES FROM DUAL UNION                         '+
             '        SELECT '''+psAno+'/12'' AS MES FROM DUAL UNION                         '+
             '        SELECT '''+psAno+'/13'' AS MES FROM DUAL  ) MESES,                     '+
             '     (  SELECT H.MESREFERENCIA, H.IDPESSJUR, H.IDPLANOPREV, H.IDPESSOA,           '+
             '               H.SEQPROPOSTA, SUM(H.VLRCOTAS) VLRCOTAS, SUM(H.VLRREAL) AS VLRREAL,'+
             '               MAX(H.VALORINDICE) AS VALORINDICE,                                 '+
             '               TO_CHAR(HC.DATARECEBIMENTO, ''DD/MM/YYYY'') AS DATA_LANCAMENTO     '+
             '        FROM   HISTMOVRESERVA H, HSTCONTRIBPREV HC                                '+
             '        WHERE  H.IDPLANOPREV = 33                                                 '+
             '        AND    H.IDTIPORESERVA IN (26,27)                                         '+
             '        AND    H.IDCONTRIBUICAO IS NOT NULL                                       '+
             '        AND    HC.IDPLANOPREV      = H.IDPLANOPREV                                '+
             '        AND    HC.IDPESSOA         = H.IDPESSOA                                   '+
             '        AND    HC.SEQPROPOSTA      = H.SEQPROPOSTA                                '+
             '        AND    HC.MESCOBRANCA      = H.MESREFERENCIA                              '+
             '        AND    HC.IDCONTRIBUICAO   = H.IDCONTRIBUICAO                             '+
             '        GROUP BY H.MESREFERENCIA, H.IDPESSJUR, H.IDPLANOPREV, H.IDPESSOA,         '+
             '                 H.SEQPROPOSTA, TO_CHAR(HC.DATARECEBIMENTO, ''DD/MM/YYYY'') ) HPAT, '+
             '     (  SELECT MESREFERENCIA, IDPESSJUR, IDPLANOPREV, IDPESSOA, SEQPROPOSTA,      '+
             '               SUM(VLRCOTAS) VLRCOTAS, SUM(VLRREAL) AS VLRREAL                    '+
             '        FROM   HISTMOVRESERVA                                                     '+
             '        WHERE  IDPLANOPREV = 33                                                   '+
             '        AND    IDTIPORESERVA IN (12,13,14,15,16,17,18,19,20,47,48,50,80)          '+
             '        AND    IDCONTRIBUICAO IS NOT NULL                                         '+
             '        GROUP BY MESREFERENCIA, IDPESSJUR, IDPLANOPREV, IDPESSOA, SEQPROPOSTA) HPART '+
             ' WHERE  EL.IDPESSJUR         = PP.IDPESSJUR                                       '+
             ' AND    EL.IDPESSOA          = PP.IDPESSOA                                        ';

     if (pbFiltraPatro = True) or (pstrSituacao <> '') or (pstrMatricula <> '')
     then begin
        if pbFiltraPatro
        then sSQL := sSQL + ' AND HPAT.IDPESSJUR         = '+IntToStr(piIdPatroFiltro);

        if pstrSituacao <> ''
        then sSQL := sSQL + ' AND PP.IDSITPART IN ('+pstrSituacao+')';

        if pstrMatricula <> ''
        then sSQL := sSQL + ' AND EL.MATRICULA IN ('+pstrMatricula+')';
     end
     else begin
        sSQL := sSQL + ' AND    HPAT.IDPESSJUR         = '+IntToStr(piIdPessJur)   +
                       ' AND    HPAT.IDPESSOA          = '+IntToStr(piIdPessoa)    +
                       ' AND    HPAT.IDPLANOPREV       = '+IntToStr(piIdPlanoPrev) ;
     end;


     sSQL := sSQL + ' AND    P.IDPESSOA           = EL.IDPESSOA                                        '+
             ' AND    HPAT.IDPESSJUR       = PP.IDPESSJUR                                       '+
             ' AND    HPAT.IDPLANOPREV     = PP.IDPLANOPREV                                     '+
             ' AND    HPAT.IDPESSOA        = PP.IDPESSOA                                        '+
             ' AND    HPAT.SEQPROPOSTA     = PP.SEQPROPOSTA                                     '+
             ' AND    HPAT.MESREFERENCIA   = MESES.MES                                          '+
             ' AND    HPART.IDPESSJUR       = PP.IDPESSJUR                                      '+
             ' AND    HPART.IDPLANOPREV     = PP.IDPLANOPREV                                    '+
             ' AND    HPART.IDPESSOA        = PP.IDPESSOA                                       '+
             ' AND    HPART.SEQPROPOSTA     = PP.SEQPROPOSTA                                    '+
             ' AND    HPART.MESREFERENCIA   = MESES.MES                                         ';

     cds.Data := GetDataPacket(sSQL);


     PreencheCamposCalculados( cds );

     Result := cds.Data;
  finally
    cds.Free;
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
                                               sDataMov : String) : Double;
var cAux : char ;
    stipoMoeda : String;
    cds : TCMClientDataSet;
begin

 if Trim(sIndiceReajuste) = '' then Exit;
 Result := 0;
 cds    := TCMClientDataSet.Create(nil);
 try

    cds.Data := GetDataPacket( 'SELECT  MOEPERIODICIDADE FROM MOEDA '+
                               ' WHERE MOECODIGO = '+sIndiceReajuste+' ');
    if cds.IsEmpty
    then begin
      Result := 0;
      Exit;
    end;

    sTipoMoeda := cds.FieldByName('MOEPERIODICIDADE').AsString;
    if sTipoMoeda = 'M'
    then Begin
       cds.Close;
       cds.Data := GetDataPacket( 'SELECT  COTVALOR '+
                                  ' FROM COTACAOMOEDA '+
                                  ' WHERE MOECODIGO = '+sIndiceReajuste+' '+
                                  ' AND COTDATA IN '+
                                  ' (SELECT MAX(COTDATA) FROM COTACAOMOEDA '+
                                  ' WHERE MOECODIGO = '+sIndicereajuste+' '+
                                  ' AND (COTMESREF = '''+copy(sDataMov,4,2)+copy(sDataMov,7,4)+ '''))'); // CAMILLE - 09.02.2000
    end
    else begin
        cds.Close;
        cds.Data := GetDataPacket( 'SELECT  COTVALOR '+
                       ' FROM COTACAOMOEDA '+
                       ' WHERE MOECODIGO = '+sIndiceReajuste+' '+
                       ' AND COTDATA IN '+
                       ' (SELECT MAX(COTDATA) FROM COTACAOMOEDA '+
                       ' WHERE MOECODIGO = '+sIndicereajuste+' '+
                       ' AND COTDATA <= TO_DATE(''' + sDataMov +''',''DD/MM/YYYY'')) ');
    end;

    if cds.IsEmpty
    then begin
      Result := 0;
      Exit;
    end
    else begin
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
    cds.Data := GetDataPacket( ' SELECT MIN(TO_CHAR(HC.DATARECEBIMENTO, ''DD/MM/YYYY'')) AS DATA_LANCAMENTO  '+
                               ' FROM   HISTMOVRESERVA H, HSTCONTRIBPREV HC                             '+
                               ' WHERE  H.IDPESSJUR         = '+IntToStr(piIdPessJur)                     +
                               ' AND    H.IDPLANOPREV       = '+IntToStr(piIdPlanoPrev)                   +
                               ' AND    H.IDPESSOA          = '+IntToStr(piIdPessoa)                      +
                               ' AND    H.SEQPROPOSTA       = '+IntToStr(piSeqProposta)                   +
                               ' AND    H.MESREFERENCIA     = '''+psMesReferencia+'''                   '+
                               ' AND    H.IDCONTRIBUICAO    IS NOT NULL                                 '+
                               ' AND    HC.IDPLANOPREV      = H.IDPLANOPREV                             '+
                               ' AND    HC.IDPESSOA         = H.IDPESSOA                                '+
                               ' AND    HC.SEQPROPOSTA      = H.SEQPROPOSTA                             '+
                               ' AND    HC.MESCOBRANCA      = H.MESREFERENCIA                           '+
                               ' AND    HC.IDCONTRIBUICAO   = H.IDCONTRIBUICAO                          ');

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

