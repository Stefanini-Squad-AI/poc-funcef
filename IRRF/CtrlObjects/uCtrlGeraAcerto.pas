{ Alterações
{********************************************************************************
Analista.: Marcio Sanches Spinosa SOL 247088 PPM 645299.
Data.....: 09/12/2014
Sol......: 247088
PPM......: 645299.
Rotina...: NovoGeraAcerto
Descrição: Ajuste na rotina de geração do acerto.
*******************************************************************************
Analista.: Marcio Sanches Spinosa SOL 243371 PPM 602967
Data.....: 09/12/2014
Sol......: 243371
PPM......: 602967
Rotina...: NovoGeraAcerto
Descrição: Ajuste na rotina de geração do acerto.
*******************************************************************************
Analista.: Marcio Sanches Spinosa SOL 236090 PPM 462974
Data.....: 25/07/2014
Sol......: 236090
PPM......: 462974
Rotina...: ApagaLancIRAcerto
Descrição: Ajuste na rotina de desfazer acerto
*******************************************************************************
Analista.: Fernando Xavier/Edilaine Ferraresi/Marcio Spinosa SOL 226715 KINTANA 2061081
Data.....: 21/02/2014
Sol......: 226715
Kintana..: 2061081
Descrição: Ajustado solicitados em plantao
-------------------------------------------------------------------------------
Analista.: Marcio Sanches Spinosa SOL 225788 KINTANA 2059231
Data.....: 07/02/2014
Sol......: 225788
Kintana..: 2059231
Rotina...: Ajuste na query
Descrição: Ajuste na query
*******************************************************************************
Analista.: Marcio Sanches Spinosa SOL 217767 KINTANA 2049332
Data.....: 14/10/2013
Sol......: 217767
Kintana..: 2049332
Rotina...: bbtnConfirmarClick
Descrição: Ajuste na rotina de desfazer acerto
*******************************************************************************
Analista.: Marcio Sanches Spinosa SOL 217023 KINTANA 2046339
Data.....: 20/09/2013
Sol......: 217023
Kintana..: 2046339
Rotina...: AcertaValorRend
Descrição: Busca e inclusão dos IDINFORME 47, 48, 50, 51 tratados como 49
********************************************************************************
Analista.: Marcio Sanches Spinosa SOL 215621 KINTANA 2044679
Data.....: 03/09/2013
Sol......: 215621
Kintana..: 2044679
Rotina...: AcertaValorRend
Descrição: criação da rotina VerificaIsencao para verificar se a pessoa é isenta
********************************************************************************
Analista.: Edilaine Ferraresi
Data.....: 21/08/2013
Sol......: 202259
Kintana..: 2042903
Rotina...: CompensaValor, bVerificaAjusteIdoso, AjustaInformes, AcertaValorRend13,
           AcertaValorRend
Descrição: rotina compensaou todo o rendimento FUNCEF como exigibilidade suspensa
           sem aplicar percentual da ação
********************************************************************************
Analista.: Eraldo Silva
Data.....: 29/09/2011
Kintana..: 1433984
Sol......: 165436
Descrição: Incluir parametro para que a rotina compensa valor negativo passe a
           gravar o IDPROCJUD para as pessoas que possuem ação judicial
********************************************************************************}
{********************************************************************************
Analista.: Bruno Bastos
Data.....: 08/02/2010
Kintana..: 130707
Sol......: 734959
Descrição: Colocar no decode tratamento para o coddirf 25.
********************************************************************************}
{********************************************************************************
Analista.: Arnaldo V. Scarin
Data.....: 18/09/2009
Kintana..: 121847
Sol......: 591283
Descrição: Saldo de contribuição 13º: Caso permaneça o valor negativo, depois de
           percorrido os meses referentes ao 13º salário, lançar o saldo como
           rendimento 13º salário.
********************************************************************************}
{ FlgTipoReg
  N - Normal, registros normais, só são inseridos na busca
  D - Acerto de Dedução de Dependente
  C - Valor negativo compensado em um mês que teve margem
  P - O valor positivo de tudo o que foi compensado
  I - Acerto de devolução de contribuição de décimo terceiro de isento
  V - Acerto de Devolução de Contribuição de 13º
  R - Acerto de rendimento de décimo terceiro
  F - Acerto entre as fontes pagadoras
  A - Ajuste do valor do idoso de uma fonte para a outra
**********************************************************************
//---------------------------------------------------------------------
  Analista.: Bruno Bastos
  Kintana..: 606727
  SOL......: 122732
  Rotina...: Várias
  Descrição: Fazer acerto do mês do valor negativo em diante e não mais
             do início para o final do ano.
//---------------------------------------------------------------------
  Analista.: Bruno Bastos
  Kintana..: 611832
  SOL......: 122590
  Rotina...: Várias
  Descrição: Fazer acerto de valores negativos de isento.
//---------------------------------------------------------------------
  Analista.: Bruno Bastos
  Kintana..: 413536
  SOL......: 95579
  Rotina...: Várias
  Descrição: Ajuste da rotina de compensação de valores negativos.
//---------------------------------------------------------------------
  Analista.: Bruno Bastos
  Pendencia: 27594
  Rotina...: CompensaDeducoes
  Descrição: Ajuste no acerto de contribuição.
//---------------------------------------------------------------------
  Analista.: Claudio Faria
  Pendencia: 24608
  Rotina...: Varias
  Descrição: Novas maneira de parametrizar os acertos.
//---------------------------------------------------------------------
Analista.: Bruno Bastos
Pendencia: 26004
Data.....: 16/10/2007
Rotina...: AcertaDeducoes e InsereLancxInforme
Descrição: Acerto para verificar se a pessoa está isenta no momento do acerto e gravar o valor na
           linha de informe de rendimento isenta.
//---------------------------------------------------------------------}

unit uCtrlGeraAcerto;

interface

Uses sysutils, uCmControlObject, uCmDbObject, uSistema, DB, uDataBase, DbClient,
     classes, Forms, uCMMath,
     dbtables, mconnect, ucmFileUtils,
     uCmCustomCdbObject, ADODb, provider, {$IFDEF VERSAO0505} uComum {$ELSE} uCMTypes {$ENDIF},
     uCripto, wwQuery, uCtrLancIRRF, FProgresso, dBasedados;

  Type
    TCtrlGeraAcerto = Class(TCmControlObject)

    private
      CdsLancamentos   : TClientDataSet;
      CdsBuscaLancxInf : TClientDataSet;
      cdsAux           : TClientDataSet;
      cdsAux1          : TClientDataSet;
      cdsAux2          : TClientDataSet;
      CtrlLancIRRF     : TCtrLancIRRF;
      FMaxProgresso: Integer;
      FProgresso: Integer;

    protected
      procedure DoChangeDataBase; Override;
      procedure AfterInitialize; Override;
      procedure AjustaInformes(const piCodigoIrrf : Integer;
                               var psInfFuncef,
                                   psInfInss,
                                   psInfIdosoFuncef,
                                   psInfIdosoInss     : String;
                               var piInfFuncef,
                                   piInfINSS,
                                   piInfIdosoFuncef,
                                   piInfIdosoInss     : Integer
                                   );
    public
      bAgrupamentoPorIdInforme : Boolean ;
      iCodInformeAtc : Integer;
      sNroDocAtc, sFlgBuscaAtc : String;

      Property Progresso : Integer read FProgresso;
      Property MaxProgresso : Integer read FMaxProgresso;

      Constructor Create; Override;

      Destructor Destroy; Override;
      function ListGeraAcertoOld(const sAnoBusca : string;const sFiltroCPF : String) : OleVariant;
      Function ListGeraAcerto(const sAnoBusca : string;const sFiltroCPF : String) : OleVariant;

      procedure CompensaValor(const piCodigoIRRF     : Integer;
                              var prVlr              : Double;
                              var prVlrComp          : Double;
                              var prDif              : Double;
                              var prPercAcao         : Double;
                              const prValorIdoso     : Double;
                              const pbIdoso          : Boolean;
                              const psDataPagto      : String;
                              const piIdInfAcerto    : integer;
                              const piIdInfRendAcJud : integer;
                              const piIdInfIdosoFund : integer;
                              const piIdInfIdosoINSS : integer);


      function VerificaIdoso(var prVlrIdoso: Double;
                             const pdDataNasc : tDateTime;
                             const pdDataPagto : tDateTime): boolean;

      procedure ZeraValores(const piCodigoIRRF     : Integer;
                            var prVlr              : Double;
                            var prVlrComp          : Double;
                            const prValorIdoso     : Double;
                            const psDataPagto      : String;
                            const piIdInfAcerto    : integer;
                            const piIdInfRendAcJud : integer;
                            const piIdInfIdosoFund : integer;
                            const piIdInfIdosoINSS : integer;
                            const piIdInfRendComp13s : Integer);

      function NovoGeraAcerto(const sAnoBusca        : string;
                              const DataBuscaDados   : OleVariant;
                              const pbProcIntegral   : boolean;
                              const pCompensaAnoTodo : Boolean): Boolean;

      procedure AcertaValorRend(const piCodigoIRRF          : Integer;
                                const psAnoBusca            : string;
                                const pbCompOutraFonte   : boolean;
                                const piIdInfRendCompNeg : integer;
                                const piIdInfRendCompNeg13S : integer;
                                const piIdInfRendAcJud   : integer;
                                const piIdInfIdosoFund   : integer;
                                const piIdInfIdosoINSS   : integer;
                                const pCompensaAnoTodo   : Boolean;
                                const idInforme          : integer;
                                const idbenefirrf        : integer);

      procedure AcertaValorRend13(const piCodigoIRRF          : Integer;
                                const psAnoBusca            : string;
                                const pbCompOutraFonte   : boolean;
                                const piIdInfRendCompNeg : integer;
                                const piIdInfRendCompNeg13S : integer;
                                const piIdInfRendAcJud   : integer;
                                const piIdInfIdosoFund   : integer;
                                const piIdInfIdosoINSS   : integer;
                                const pCompensaAnoTodo   : Boolean;
                                const idInforme          : integer;
                                const idbenefirrf        : integer;
                                const piIdInfRendComp13S : integer);





      function bVerificaAjusteIdoso(idbenefirrf : integer; sDataPagto : String) : boolean;
      function fSomaValoresPorInforme(DataValores : OleVariant; idInformePesq : Integer; sNumDoc : string) : Real; //Marcio Sanches Spinosa SOL 217767 KINTANA 2049332
      function bVerificaAcumuladorPorInforme(DataValores : OleVariant; idInformePesq, idLancIrrfPesq : Integer; sNroDocPesq, sFlgBuscaPesq: String) : boolean;
      function bAtualizaFlagAcumulador(idInformePesq, idLancIrrfPesq : Integer) : boolean;
      function fDiferencaAjusteIdoso(idbenefirrf : integer; sDataPagto : String) : real;


      //Bruno Bastos - Sol - 122590  - Kintana - 611832 - Início
      procedure TrataIsento(const psAnoBusca           : string;
                            const piIdInfRendNegIsento : integer;
                            const pbCompOutraFonte     : boolean;
                            const pCompensaAnoTodo     : Boolean);
      //Bruno Bastos - Sol - 122590  - Kintana - 611832 - Fim

      function VerificaExistenciaAcaoJudicial(const piIdPessoa : Integer;
                                              const pdDataIni: TDateTime;
                                              const pdDataFim: TDateTime;
                                              var prPercAcao: Double) : boolean;


      procedure InsereLinha(const piIdinforme : integer;
                            const prVlrComp   : double;
                            const piFontePag  : integer;
                            const pbLancaRend : boolean = False;
                            const isTrataIdoso: Boolean = false);//Marcio Sanches Spinosa SOL 217767 KINTANA 2049332


      procedure InsereLinhaEspIdoso(const piIdinforme : integer;
                            const prVlrComp   : double;
                            const piFontePag  : integer;
                            const pbLancaRend : boolean = False);


      procedure AjustaIdoso(const prVlrBaseIdoso   : double;
                            const piIdInfIdosoFund : integer;
                            const piIdInfIdosoINSS : integer;
                            var pvlrIdoso        : Double);//Marcio Sanches Spinosa SOL 217767 KINTANA 2049332

      function BuscaLancxInforme(const psAnoBusca : String;
                                 const psMes      : String;
                                 const piIdBenef  : integer;
                                 //Bruno Bastos - 16/02/2009 - const piCodDirf  : integer): OleVariant;
                                 const piIdInformeFUNCEF : integer;
                                 const piIdInformeAcerto : integer;
                                 const piFontePag        : Integer;
                                 const pbAcertoIsento    : boolean;
                                 const pCompensaAnoTodo  : Boolean): OleVariant;  //Bruno Bastos - Sol 122590 - Kintana - 611832

      function BuscaLancxInformeDeducoes(const psAnoBusca        : String;
                                         const psIdHstFolhaBenef : String;
                                         const piIdBenef         : integer;
                                         const piCodDirf         : integer;
                                         const piIdInforme       : integer;
                                         const psMes             : String;
                                         Const bCompensaAnoTodo  : Boolean): OleVariant; //Bruno Bastos - Sol: 122732 Kintana: 606727

      function InsereLancIRRFAcerto(pIdLancIRRFComp, pIdLancIRRFAcerto: Integer): Boolean;

      function CompensaDeducoes(const piCodigoIRRF     : integer;
                                const sListaPessoas    : String;
                                const sListaInforme    : String;
                                const piAno            : integer;
                                const piIdInfAcerto    : integer;
                                const piIdInfAcerto13s : integer;
                                const pbCompOutraFonte : boolean;
                                const pCompensaAnoTodo : Boolean): Boolean;
       //Marcio Sanches Spinosa SOL 215621 KINTANA 2044679 - Inicio
      function VerificaIsencao (idhstfolhabenef : Integer;
                                idpessoa        : Integer) : Boolean;
      //Marcio Sanches Spinosa SOL 215621 KINTANA 2044679 - Fim

    End;


implementation

{ TCtrlGeraAcerto }
uses  FAcertaValorMT;

procedure TCtrlGeraAcerto.AfterInitialize;
begin
  inherited;
  CtrlLancIRRF.InitializeAs(self);
  CtrlLancIRRF.OpenTransaction := False;
end;

function TCtrlGeraAcerto.BuscaLancxInforme(const psAnoBusca : String;
                                           const psMes      : String;
                                           const piIdBenef  : integer;
                                           //Bruno Bastos - 16/02/2009 - const piCodDirf  : integer): OleVariant;
                                           const piIdInformeFUNCEF : integer;    // 4
                                           const piIdInformeAcerto : integer;    // 5
                                           const piFontePag        : Integer;    // 6
                                           const pbAcertoIsento    : boolean;
                                           const pCompensaAnoTodo  : Boolean): OleVariant; //Bruno Bastos - Sol 122590 - Kintana - 611832
Var
  sSql : String;

begin
  sSql :=' SELECT '+
           ' T.VALOR, '+
           ' T.IDLANCIRRF, '+
           ' T.FONTEPAGADORA, '+
           ' T.IDINFORME, '+
           ' L.CODNATUREZA, '+
           ' L.IDPLANOPREV, '+
           ' L.IDPATRO, '+
           ' L.IDPROGRAMA, '+
           ' L.IDPROCJUD, '+
           ' T.IDHSTFOLHABENEF, '+
           ' T.IDMODULO, '+
           ' T.DATAPAGAMENTO, '+
           ' T.ORD, '+
           ' T.MES, '+
           ' T.ORD2 '+
         ' FROM '+
           ' LANCIRRF L, '+
           '(SELECT '+
             ' SUM(LI.VLRLANC) AS VALOR, '+
             ' MIN(L.IDLANCIRRF) AS IDLANCIRRF, '+
             ' LI.FONTEPAGADORA, '+
             ' I.IDINFORME, '+
             ' L.CODNATUREZA, '+
             ' L.IDPLANOPREV, '+
             ' L.IDPATRO, '+
             ' L.IDPROGRAMA, '+
             ' L.IDPROCJUD, '+
             ' L.IDHSTFOLHABENEF, '+
             ' L.IDMODULO, '+
             ' L.DATAPAGAMENTO, '+
             ' TO_NUMBER(TO_CHAR(L.DATAPAGAMENTO, ''MM'')) AS ORD, '+
             ' TO_CHAR(L.DATAPAGAMENTO, ''MONTH'') AS MES, '+
             ' CASE '+
             '   WHEN TO_NUMBER(TO_CHAR(L.DATAPAGAMENTO, ''MM'')) < '+psMes+
             //'     THEN TO_NUMBER(TO_CHAR(L.DATAPAGAMENTO, ''MM'')) + 12 '+            // Edilaine - SOL 202259 / KTN 2042903
             '     THEN (TO_NUMBER(TO_CHAR(L.DATAPAGAMENTO, ''MM'')) - '+psMes+')*-1'+   // Edilaine - SOL 202259 / KTN 2042903
             '  WHEN TO_NUMBER(TO_CHAR(L.DATAPAGAMENTO, ''MM'')) = '+psMes+' THEN 99 ' + //XXX
             '     ELSE TO_NUMBER(TO_CHAR(L.DATAPAGAMENTO, ''MM'')) '+
             ' END AS ORD2 '+
           ' FROM '+
             ' LANCXINFORME LI, '+
             ' LANCIRRF L, '+
             ' INFORME I '+
           ' WHERE LI.IDLANCIRRF = L.IDLANCIRRF '+
             ' AND L.DATAPAGAMENTO BETWEEN TO_DATE('+QuotedStr('01/01/'+psAnoBusca)+', ''DD/MM/YYYY'') AND '+
                                         ' TO_DATE('+QuotedStr('31/12/'+psAnoBusca)+', ''DD/MM/YYYY'') '+
             ' AND L.IDBENEFIRRF = '+IntToStr(piIdBenef)+
             ' AND I.IDINFORME = LI.IDINFORME ';
             //Bruno Bastos - 16/02/2009 - ' AND I.CODDIRF = '+IntToStr(piCodDirf)+

             {//Bruno Bastos - Sol 122590 - Kintana - 611832 - Comentei essas linhas
             ' AND (I.IDINFORME IN ( SELECT IDINFORMEORIGEM FROM INFORMEDEPARA WHERE IDINFORMEDESTINO = '+IntToStr(piIdInformeFUNCEF)+') OR '+
             '     (I.IDINFORME  = '+IntToStr(piIdInformeFUNCEF)+')) ';
             }

  //Bruno Bastos - Sol 122590 - Kintana - 611832 - Início
  if (pbAcertoIsento) then
    sSql := sSql + {' AND (I.IDINFORME  = '+IntToStr(piIdInformeFUNCEF)+') '}
                 ' AND (I.IDINFORME IN ( SELECT IDINFORMEORIGEM FROM INFORMEDEPARA WHERE IDINFORMEDESTINO = '+IntToStr(piIdInformeFUNCEF)+') OR '+
                 '     (I.IDINFORME  IN ('+IntToStr(piIdInformeFUNCEF) + ',' + IntToStr(piIdInformeAcerto) + '))) ' // Desabilitado Baruc 23/01/2013 12:55

  else
  begin
    sSql := sSql + ' AND (I.IDINFORME  in ( '+IntToStr(piIdInformeFUNCEF)+','+ IntToStr(piIdInformeAcerto)+')) '

    {
    // Baruc em 23/01/2013 15:30
    if piFontePag = 2 then
      begin
        sSql := sSql +
                 ' AND (I.IDINFORME IN ( SELECT IDINFORMEORIGEM FROM INFORMEDEPARA WHERE IDINFORMEDESTINO = '+IntToStr(piIdInformeFUNCEF)+') OR '+
                 '     (I.IDINFORME  IN ('+IntToStr(piIdInformeFUNCEF) + ',' + IntToStr(piIdInformeAcerto) + '))) '; // Desabilitado Baruc 23/01/2013 12:55
      end
    else
      begin
        sSql := sSql +
                 ' AND (I.IDINFORME IN ( SELECT IDINFORMEORIGEM FROM INFORMEDEPARA WHERE IDINFORMEDESTINO = '+IntToStr(piIdInformeFUNCEF)+') OR '+
                 '     (I.IDINFORME  = '+IntToStr(piIdInformeFUNCEF)+  ',' + IntToStr(piIdInformeAcerto) + ')))'; // Desabilitado Baruc 23/01/2013 12:55
      end;
    }
  end;

  //Bruno Bastos - Sol 122590 - Kintana - 611832 - Fim
  sSql := sSql + ' AND NVL(L.IDMODULORESPON, L.IDMODULO) = 18 '+
             ' AND NVL(LI.FLGTIPOREG, ''N'') in (''N'', ''C'', ''A'') '+
          //   ' AND TO_NUMBER(TO_CHAR(L.DATAPAGAMENTO, ''MM'')) <> '+psMes+      // Edilaine - SOL 202259 / KTN 2042903
             ' GROUP BY '+
             ' I.IDINFORME, '+
             ' LI.FONTEPAGADORA, '+
             ' TO_NUMBER(TO_CHAR(L.DATAPAGAMENTO, ''MM'')), '+
             ' TO_CHAR(L.DATAPAGAMENTO, ''MONTH''), '+
             ' L.CODNATUREZA, '+
             ' L.IDPLANOPREV, '+
             ' L.IDPATRO, '+
             ' L.IDPROGRAMA, '+
             ' L.IDPROCJUD, '+
             ' L.IDHSTFOLHABENEF, '+
             ' L.IDMODULO, '+
             ' L.DATAPAGAMENTO) T '+
             //' ORDER BY ORD2 DESC, LI.FONTEPAGADORA) T '+
         ' WHERE T.IDLANCIRRF = L.IDLANCIRRF '+
           ' AND T.VALOR      > 0 ';

  if piFontePag = 1 then
    sSql := sSql + ' ORDER BY T.ORD2 /*DESC*/, T.FONTEPAGADORA, T.DATAPAGAMENTO '             // Edilaine - SOL 202259 / KTN 2042903
  else
    sSql := sSql + ' ORDER BY T.ORD2 /*DESC*/, T.FONTEPAGADORA DESC, T.DATAPAGAMENTO ';       // Edilaine - SOL 202259 / KTN 2042903

  Result := GetDataPacket(sSql);

end;

function TCtrlGeraAcerto.BuscaLancxInformeDeducoes(const psAnoBusca        : String;
                                                   const psIdHstFolhaBenef : String;
                                                   const piIdBenef         : integer;
                                                   const piCodDirf         : integer;
                                                   const piIdInforme       : integer;
                                                   const psMes             : String;
                                                   Const bCompensaAnoTodo  : Boolean): OleVariant;
Var sSql : String;
begin
  sSql := 'SELECT MIN(L1.IDLANCIRRF) AS IDLANCIRRF, '                                                                   + #13 +
          '       L1.IDBENEFIRRF, L1.IDHSTFOLHABENEF, '                                                                 + #13 +
          '       LX.FONTEPAGADORA, LX.IDINFORME, '                                                                     + #13 +
          '       SUM(LX.VLRLANC) AS VALOR, '                                                                           + #13 +
          '       L1.CODNATUREZA, L1.IDPLANOPREV, L1.IDPATRO, '                                                         + #13 +
          '       L1.IDPROGRAMA, L1.IDMODULO, L1.DATAPAGAMENTO, L1.IDPROCJUD '                                          + #13 +

          //Bruno Bastos - Sol 122732 - Kintana 606727 - Início
          ' ,CASE WHEN TO_NUMBER(TO_CHAR(L1.DATAPAGAMENTO, ''MM'')) < '+ psMes                                          + #13 +
          '    THEN TO_NUMBER(TO_CHAR(L1.DATAPAGAMENTO,''MM'')) + 12 '                                                  + #13 +
          '    ELSE TO_NUMBER(TO_CHAR(L1.DATAPAGAMENTO, ''MM'')) '                                                      + #13 +
          '  END AS ORD2 '                                                                                              + #13 +
          //Bruno Bastos - Sol 122732 - Kintana 606727 - Fim

          'FROM  LANCIRRF L1, LANCXINFORME LX, INFORME I '                                                              + #13 +
          'WHERE (L1.IDLANCIRRF              = LX.IDLANCIRRF) '                                                         + #13;

  //CPrev - 24608 - Inicio
//  If (piIDInforme = 50) Or (piIDInforme = 51) Then
//  Begin
//    sSql := sSql + '  AND (LX.IDINFORME               IN (50, 51)) '                                                    + #13;
//  End
//  Else
  Begin
    If (piIDInforme = 46) Or (piIDInforme = 133) Then
    Begin
      sSql := sSql + '  AND (LX.IDINFORME               IN (46, 133)) '                                                 + #13;
    End
    Else
    Begin
      sSql := sSql + '  AND (LX.IDINFORME               = ' + IntToStr(piIDInforme) + ') '                              + #13;
    End;
  End;
  //CPrev - 24608 - Fim

  sSql := sSql + '  AND (L1.IDHSTFOLHABENEF        <> ' + psIdHstFolhaBenef + ') '                                      + #13 +
                 '  AND (L1.IDBENEFIRRF             = ' + IntToStr(piIdBenef) +  ') '                                   + #13 +
                 '  AND (L1.IDMODULO                = 18) '                                                             + #13 +
                 '  AND (LX.IDINFORME               = I.IDINFORME) '                                                    + #13 +
                 '  AND (NVL(LX.FLGTIPOREG, ''N'') IN (''N'', ''C'')) '                                                 + #13 +
                 '  AND (L1.DATAPAGAMENTO BETWEEN TO_DATE(' + QuotedStr('01/01/' + psAnoBusca) + ', ''DD/MM/YYYY'')'    + #13 +
                 '                            AND TO_DATE(' + QuotedStr('31/12/' + psAnoBusca) + ', ''DD/MM/YYYY'')) '  + #13 +
                 'GROUP BY L1.IDBENEFIRRF, L1.IDHSTFOLHABENEF, LX.IDINFORME, LX.FONTEPAGADORA, '                        + #13 +
                 '         L1.CODNATUREZA, L1.IDPLANOPREV, L1.IDPATRO, L1.IDPROGRAMA, L1.IDMODULO, L1.DATAPAGAMENTO,L1.IDPROCJUD '   + #13 +
                 'HAVING SUM(LX.VLRLANC)>0 ';

  //CPrev - 24608 - Inicio
//  If (piIDInforme = 51) Or (piIDInforme = 133) Then
  If (piIDInforme = 133) Then
    sSql := sSql + 'ORDER BY  ORD2 DESC, LX.IDINFORME DESC, L1.IDHSTFOLHABENEF'
  Else
    sSql := sSql + 'ORDER BY  ORD2 DESC, LX.IDINFORME, L1.IDHSTFOLHABENEF';

  Result := GetDataPacket(sSql);
end;


function TCtrlGeraAcerto.CompensaDeducoes(const piCodigoIRRF     : Integer;
                                          const sListaPessoas    : String;
                                          const sListaInforme    : String;
                                          const piAno            : integer;
                                          const piIdInfAcerto    : integer;
                                          const piIdInfAcerto13s : integer;
                                          const pbCompOutraFonte : boolean;
                                          const pCompensaAnoTodo : Boolean): Boolean;
Var
  iContador,
  iMeses,
  iCodLanc1, iCodLanc2,
  rValor,
  rValorComp : Double;
  bPrim      : Boolean;
  sfiltro, sSql : String;
  iFontePagadora,
  iIdInforme : Integer;

  iIdInformeRend,
  iIdBenefIRRF : Integer; //CPrev - Pend. 21146
  iIdInformeFUNCEF : Integer;
  sMes             : String;

begin
  If piCodigoIRRF <> 25 then
    iIdInformeFUNCEF := 49
  else
    iIdInformeFUNCEF := 75;

  Try
    Result := True;
    iIdBenefIRRF   := cdsLancamentos.FieldByName('IDBENEFIRRF').AsInteger; //CPrev - Pend. 21146

    iCodLanc1      := 0;
    iCodLanc2      := 0;
    iFontePagadora := 0;
    iIdInforme     := 0;
    rValorComp     := 0;
    rValor         := cdslancamentos.FieldByName('VALOR').AsFloat * -1;
    sMes           := cdsLancamentos.FieldByName('ORD').AsString;

    CdsBuscaLancxInf.Data := BuscaLancxInformeDeducoes(IntToStr(piAno),
                                                       cdsLancamentos.FieldByName('IDHSTFOLHABENEF').AsString,
                                                       cdsLancamentos.FieldByName('IDBENEFIRRF').AsInteger,
                                                       cdsLancamentos.FieldByName('CODDIRF').AsInteger,
                                                       cdsLancamentos.FieldByName('IDINFORME').AsInteger,
                                                       sMes,
                                                       pCompensaAnoTodo);
                                                       //Bruno Bastos - Sol 122732 - Kintana 606727

    while (not CdsBuscaLancxInf.Eof) And (rValor > 0) Do
    Begin

      cdsAux.Close;
      sSql := 'SELECT (0) AS VLRLANCSINAL, IDINFORME, IDLANCIRRF, PERCLANC, VLRLANC, FONTEPAGADORA, FLGTIPOREG '+
              'FROM  LANCXINFORME  '+
              'WHERE (1 = 2)';
      cdsAux.data     := GetDataPacket(SSql);

      If rValor <= CdsBuscaLancxInf.FieldByName('VALOR').AsFloat Then
      Begin
        cdsAux.Insert;
        cdsAux.FieldByName('IDINFORME').AsInteger     := CdsBuscaLancxInf.FieldByName('IDINFORME').AsInteger;
        cdsAux.FieldByName('VLRLANC').AsFloat         := -(RoundCM(rValor, 2));
        cdsAux.FieldByName('VLRLANCSINAL').AsFloat    := -(RoundCM(rValor, 2));
        cdsAux.FieldByName('FONTEPAGADORA').AsInteger := CdsBuscaLancxInf.FieldByName('FONTEPAGADORA').AsInteger;
        cdsAux.FieldByName('IDLANCIRRF').AsInteger    := CdsBuscaLancxInf.FieldByName('IDLANCIRRF').AsInteger;
        cdsAux.FieldByName('FLGTIPOREG').AsString     := 'C';
        cdsAux.Post;
        rValorComp := rValorComp + rValor;
        rValor     := 0;
      End
      Else
      Begin
        cdsAux.Insert;
        cdsAux.FieldByName('IDINFORME').AsInteger     := CdsBuscaLancxInf.FieldByName('IDINFORME').AsInteger;
        cdsAux.FieldByName('VLRLANC').AsFloat         := -(RoundCM(CdsBuscaLancxInf.FieldByName('VALOR').AsFloat, 2));
        cdsAux.FieldByName('VLRLANCSINAL').AsFloat    := -(RoundCM(CdsBuscaLancxInf.FieldByName('VALOR').AsFloat, 2));
        cdsAux.FieldByName('FONTEPAGADORA').AsInteger := CdsBuscaLancxInf.FieldByName('FONTEPAGADORA').AsInteger;
        cdsAux.FieldByName('IDLANCIRRF').AsInteger    := CdsBuscaLancxInf.FieldByName('IDLANCIRRF').AsInteger;
        cdsAux.FieldByName('FLGTIPOREG').AsString     := 'C';
        cdsAux.Post;
        rValorComp := rValorComp + CdsBuscaLancxInf.FieldByName('VALOR').AsFloat;
        rValor     := rValor     - CdsBuscaLancxInf.FieldByName('VALOR').AsFloat;
      End;
      if iIdInforme = 0 Then
        iIdInforme := CdsBuscaLancxInf.FieldByName('IDINFORME').AsInteger;

      if iFontePagadora = 0 Then
        iFontePagadora := CdsBuscaLancxInf.FieldByName('FONTEPAGADORA').AsInteger;

      Try
        iCodLanc1 := 0;
        If not CtrlLancIRRF.GravaIRRF(Sistema.IdEmpresa, False, 0, Sistema.IdEmpresa,
                                      cdsLancamentos.FieldByName('IDBENEFIRRF').AsFloat,
                                      CdsBuscaLancxInf.FieldByName('CODNATUREZA').AsString,
                                      DateToStr(Date), 0, 0, 0, 0, 0, 0, 0, 0, 0,
                                      cdsAux.data, iCodLanc1, '', 0, 'S',
                                      CdsBuscaLancxInf.FieldByName('IDPLANOPREV').AsInteger,
                                      CdsBuscaLancxInf.FieldByName('IDPATRO').AsInteger,
                                      CdsBuscaLancxInf.FieldByName('IDPROGRAMA').AsInteger,
                                      bPrim,
                                      CdsBuscaLancxInf.FieldByName('IDMODULO').AsInteger,
                                      CdsBuscaLancxInf.FieldByName('IDMODULO').AsInteger,
                                      0, '',
                                      CdsBuscaLancxInf.FieldByName('IDHSTFOLHABENEF').AsInteger,
                                      '', '', '', 0, 0, True, 0, True,
                                      CdsBuscaLancxInf.FieldByName('DATAPAGAMENTO').AsString, 0 , 0 ,
                                      CdsBuscaLancxInf.FieldByName('IDPROCJUD').AsInteger  ) Then
          MessageInfo := 'Erro ao tentar inserir o LancIRRF';
      Except
        On E:Exception Do
        Begin
          If InTransaction Then
            Rollback;
          Result := False;
          MessageInfo := E.Message;
        End;
      End;

      Try
        InsereLancIRRFAcerto(cdslancamentos.fieldbyname('IDLANCIRRF').AsInteger, Trunc(iCodLanc1));
      Except
        On E:Exception Do
        Begin
          If InTransaction Then
            Rollback;
          Result := False;
          MessageInfo := E.Message;
        End;
      End;

      CdsBuscaLancxInf.Next;
    End;

    if not CdsBuscaLancxInf.IsEmpty Then
    begin
      cdsAux2.Close;
      Ssql := 'SELECT (0) AS VLRLANCSINAL, IDINFORME, IDLANCIRRF, PERCLANC, VLRLANC, FONTEPAGADORA, FLGTIPOREG '+
              'FROM  LANCXINFORME  '+
              'WHERE (1 = 2)';
      cdsAux2.data     := GetDataPacket(SSql);

      cdsAux2.Insert;
      cdsAux2.FieldByName('IDINFORME').AsInteger     := iIdInforme;
      cdsAux2.FieldByName('VLRLANC').AsFloat         := RoundCM(rValorComp, 2);
      cdsAux2.FieldByName('VLRLANCSINAL').AsFloat    := RoundCM(rValorComp, 2);
      cdsAux2.FieldByName('FONTEPAGADORA').AsInteger := iFontePagadora;
      cdsAux2.FieldByName('FLGTIPOREG').AsString     := 'P';
      cdsAux2.Post;

      {Inserir o lançamento positivo para o mês compensado}
      Try
        iCodLanc2 := 0;
        If not CtrlLancIRRF.GravaIRRF(Sistema.IdEmpresa, False, 0, Sistema.IdEmpresa,
                                      cdsLancamentos.FieldByName('IDBENEFIRRF').AsFloat,
                                      CdsBuscaLancxInf.FieldByName('CODNATUREZA').AsString,
                                      DateToStr(Date), 0, 0, 0, 0, 0, 0, 0, 0, 0,
                                      cdsAux2.data, iCodLanc2, '', 0, 'S',
                                      CdsBuscaLancxInf.FieldByName('IDPLANOPREV').AsInteger,
                                      CdsBuscaLancxInf.FieldByName('IDPATRO').AsInteger,
                                      CdsBuscaLancxInf.FieldByName('IDPROGRAMA').AsInteger,
                                      bPrim,
                                      CdsBuscaLancxInf.FieldByName('IDMODULO').AsInteger,
                                      CdsBuscaLancxInf.FieldByName('IDMODULO').AsInteger,
                                      0, '',
                                      CdsLancamentos.FieldByName('IDHSTFOLHABENEF').AsInteger,
                                      '', '', '', 0, 0, True, 0, True,
                                      CdsLancamentos.FieldByName('DATAPAGAMENTO').AsString, 0 , 0 ,
                                      CdsBuscaLancxInf.FieldByName('IDPROCJUD').AsInteger) Then
          MessageInfo := 'Erro ao tentar inserir o LancIRRF';
      Except
        On E:Exception Do
        Begin
          If InTransaction Then
            Rollback;
          Result := False;
          MessageInfo := E.Message;
        End;
      End;

      Try
        InsereLancIRRFAcerto(cdslancamentos.fieldbyname('IDLANCIRRF').AsInteger, Trunc(iCodLanc2));
      Except
        On E:Exception Do
        Begin
          If InTransaction Then
            Rollback;
          Result := False;
          MessageInfo := E.Message;
        End;
      End;
    End;

    if (rValor <> 0) and (pbCompOutraFonte) then
    begin
      cdsAux.Close;
      Ssql := ' SELECT FLGISENTOIRRF, FLGMOLESTIAGRAVE '+
              ' FROM PESSOAFISICA  '+
              ' WHERE IDPESSOA = '  + IntToStr(iIdBenefIRRF) ;
      cdsAux.Data := GetDataPacket(sSql);

      if ((cdsAux.FieldByName('FLGISENTOIRRF').AsInteger    = 1)  or
          (cdsAux.FieldByName('FLGMOLESTIAGRAVE').AsInteger = 1)) then
      begin
        cdsAux.Close;
        sSql := 'SELECT IDINFORMEDESTINO FROM INFORMEDEPARA WHERE IDINFORMEORIGEM = ' + IntToStr(iIdInformeFuncef);
        cdsAux.Data := GetDataPacket(sSql);
        if not cdsAux.IsEmpty then
          iIdInformeRend := cdsAux.FieldByName('IDINFORMEDESTINO').AsInteger
        else
          iIdInformeRend := iIdInformeFuncef;
      end
      else
      begin
        If piCodigoIRRF <> 25 then
          iIdInformeRend := piIdInfAcerto
        else
          iIdInformeRend := piIdInfAcerto13s;
      end;
      cdsAux2.Close;
      Ssql := 'SELECT (0) AS VLRLANCSINAL, IDINFORME, IDLANCIRRF, PERCLANC, VLRLANC, FONTEPAGADORA, FLGTIPOREG '+
              'FROM  LANCXINFORME  '+
              'WHERE (1 = 2)';
      cdsAux2.data     := GetDataPacket(SSql);

      cdsAux2.Insert;
      cdsAux2.FieldByName('IDINFORME').AsInteger     := iIdInformeRend;
      cdsAux2.FieldByName('VLRLANC').AsFloat         := RoundCM(rValor, 2);
      cdsAux2.FieldByName('VLRLANCSINAL').AsFloat    := RoundCM(rValor, 2);
      cdsAux2.FieldByName('FONTEPAGADORA').AsInteger := 1;
      cdsAux2.FieldByName('FLGTIPOREG').AsString     := 'C';
      cdsAux2.Post;

      {Inserir o lançamento de compensação na linha de rendimento}
      Try
        //CPrev - Pend. 27594 - Início
        cdsAux.Close;
        Ssql := ' SELECT DISTINCT LIR.*, LXI.FONTEPAGADORA FROM LANCIRRF LIR, LANCXINFORME LXI WHERE LIR.IDLANCIRRF = LXI.IDLANCIRRF AND LIR.IDLANCIRRF = '+ cdsLancamentos.FieldByName('IDLANCIRRF').AsString;

        cdsAux.Data := GetDataPacket(sSql);
        //CPrev - Pend. 27594 - Fim

        iCodLanc2 := 0;
        If not CtrlLancIRRF.GravaIRRF(Sistema.IdEmpresa, False, 0, Sistema.IdEmpresa,
                                      cdsLancamentos.FieldByName('IDBENEFIRRF').AsFloat,
                                      CdsAux.FieldByName('CODNATUREZA').AsString, //CPrev - Pend. 27594
                                      DateToStr(Date), 0, 0, 0, 0, 0, 0, 0, 0, 0,
                                      cdsAux2.data, iCodLanc2, '', 0, 'S',
                                      CdsAux.FieldByName('IDPLANOPREV').AsInteger,
                                      CdsAux.FieldByName('IDPATRO').AsInteger,
                                      CdsAux.FieldByName('IDPROGRAMA').AsInteger,
                                      bPrim,
                                      CdsAux.FieldByName('IDMODULO').AsInteger,
                                      CdsAux.FieldByName('IDMODULO').AsInteger,
                                      0, '',
                                      CdsLancamentos.FieldByName('IDHSTFOLHABENEF').AsInteger,
                                      '', '', '', 0, 0, True, 0, True,
                                      CdsLancamentos.FieldByName('DATAPAGAMENTO').AsString,0 , 0 ,
                                      CdsBuscaLancxInf.FieldByName('IDPROCJUD').AsInteger) Then
          MessageInfo := 'Erro ao tentar inserir o LancIRRF';
      Except
        On E:Exception Do
        Begin
          If InTransaction Then
            Rollback;
          Result := False;
          MessageInfo := E.Message;
        End;
      End;

      Try
        InsereLancIRRFAcerto(cdslancamentos.fieldbyname('IDLANCIRRF').AsInteger, Trunc(iCodLanc2));
      Except
        On E:Exception Do
        Begin
          If InTransaction Then
            Rollback;
          Result := False;
          MessageInfo := 'Erro ao tentar inserir LancIRRFAcerto.';
        End;
      End;

      { Insere a linha positiva com o valor inserido na linha de rendimento }
      cdsAux2.Close;
      Ssql := 'SELECT (0) AS VLRLANCSINAL, IDINFORME, IDLANCIRRF, PERCLANC, VLRLANC, FONTEPAGADORA, FLGTIPOREG '+
              'FROM  LANCXINFORME  '+
              'WHERE (1 = 2)';
      cdsAux2.data     := GetDataPacket(SSql);

      cdsAux2.Insert;
      //CPrev - Pend. 27594 - cdsAux2.FieldByName('IDINFORME').AsInteger     := iIdInforme;
      cdsAux2.FieldByName('IDINFORME').AsInteger     := CdsLancamentos.FieldByName('IDINFORME').AsInteger; //CPrev - Pend. 27594
      cdsAux2.FieldByName('VLRLANC').AsFloat         := RoundCM(rValor, 2);
      cdsAux2.FieldByName('VLRLANCSINAL').AsFloat    := RoundCM(rValor, 2);
      //CPrev - Pend. 27594 - cdsAux2.FieldByName('FONTEPAGADORA').AsInteger := iFontePagadora;
      cdsAux2.FieldByName('FONTEPAGADORA').AsInteger := cdsAux.FieldByName('FONTEPAGADORA').AsInteger; //CPrev - Pend. 27594
      cdsAux2.FieldByName('FLGTIPOREG').AsString     := 'P';
      cdsAux2.Post;

      {Inserir o lançamento positivo para o mês compensado}
      Try
        iCodLanc2 := 0;
        If not CtrlLancIRRF.GravaIRRF(Sistema.IdEmpresa, False, 0, Sistema.IdEmpresa,
                                      cdsLancamentos.FieldByName('IDBENEFIRRF').AsFloat,
                                      CdsAux.FieldByName('CODNATUREZA').AsString, //CPrev - Pend. 27594
                                      DateToStr(Date), 0, 0, 0, 0, 0, 0, 0, 0, 0,
                                      cdsAux2.data, iCodLanc2, '', 0, 'S',

                                      CdsAux.FieldByName('IDPLANOPREV').AsInteger,
                                      CdsAux.FieldByName('IDPATRO').AsInteger,
                                      CdsAux.FieldByName('IDPROGRAMA').AsInteger,
                                      bPrim,
                                      CdsAux.FieldByName('IDMODULO').AsInteger,
                                      CdsAux.FieldByName('IDMODULO').AsInteger,
                                      0, '',
                                      CdsLancamentos.FieldByName('IDHSTFOLHABENEF').AsInteger,
                                      '', '', '', 0, 0, True, 0, True,
                                      CdsLancamentos.FieldByName('DATAPAGAMENTO').AsString, 0 , 0
                                      CdsBuscaLancxInf.FieldByName('IDPROCJUD').AsInteger) Then
          MessageInfo := 'Erro ao tentar inserir o LancIRRF';
      Except
        On E:Exception Do
        Begin
          If InTransaction Then
            Rollback;
          Result := False;
          MessageInfo := E.Message;
        End;
      End;

      Try
        InsereLancIRRFAcerto(cdslancamentos.fieldbyname('IDLANCIRRF').AsInteger, Trunc(iCodLanc2));
      Except
        On E:Exception Do
        Begin
          If InTransaction Then
            Rollback;
          Result := False;
          MessageInfo := E.Message;
        End;
      End;

    End;
  Except
    On E:Exception Do
    Begin
      If InTransaction Then
        Rollback;
      Result := False;
      MessageInfo := E.Message;
    End;
  End;
end;

constructor TCtrlGeraAcerto.Create;
begin
  inherited;
  CdsLancamentos   := TClientDataSet.Create(nil);
  CdsBuscaLancxInf := TClientDataSet.Create(nil);
  cdsAux           := TClientDataSet.Create(nil);
  cdsAux1          := TClientDataSet.Create(nil);
  cdsAux2          := TClientDataSet.Create(nil);
  CtrlLancIRRF     := TCtrLancIRRF.Create;
end;

destructor TCtrlGeraAcerto.Destroy;
begin
  inherited;
  CdsLancamentos.free;
  CdsBuscaLancxInf.Free;
  cdsAux.Free;
  cdsAux1.Free;
  cdsAux2.Free;
  CtrlLancIRRF.Free;
end;

procedure TCtrlGeraAcerto.DoChangeDataBase;
begin
  inherited;

end;

function TCtrlGeraAcerto.InsereLancIRRFAcerto(pIdLancIRRFComp,
  pIdLancIRRFAcerto: Integer): Boolean;
Var
  sSql : String;

begin
  Try
    Result := True;
    sSql := ' INSERT INTO LANCIRRFACERTO (IDLANCIRRFCOMP, IDLANCIRRFACERTO) VALUES '+
            ' ( '+ InttoStr(pIdLancIrrfComp)+','+ InttoStr(pIdLancIrrfAcerto)+ ')';
    ExecSQL(sSql);
  Except
    Result := False;
  End;
end;

function TCtrlGeraAcerto.ListGeraAcertoOld(const sAnoBusca : string;const sFiltroCPF : String): OleVariant;
Var
  sSql : String;

begin

  sSql := ' SELECT '+
            ' T2.IDLANCIRRF, '+
            ' T2.NOME, T2.NUMDOCUMENTO, T2.CODDIRF, T2.IDBENEFIRRF, ''N'' AS FLGBUSCA, '+
            ' T2.DATAPAGAMENTO, '+
            ' T2.IDHSTFOLHABENEF, '+
            //Bruno Bastos - Sol - 122590 - Kintana - 611832 - Início
            ' T2.FLGNATUREZA, '+
//            ' T2.IDPLANOPREV, '+
//            ' T2.IDPATRO, '+
//            ' T2.IDPROGRAMA, '+
//            ' T2.IDMODULO, '+
            //Bruno Bastos - Sol - 122590 - Kintana - 611832 - Fim

            ' T2.IDINFORME, '+
            ' T2.ORD, T2.CODNATUREZA, T2.MES, T2.RENDBRUTO AS VALOR '+
            ' ,T2.DATANASC '+
            ' ,t2.fontepagadora '+
          ' FROM '+
            ' (SELECT '+
               ' T.IDLANCIRRF, '+
               ' T.DATANASC, '+
               ' T.NOME, T.NUMDOCUMENTO, T.CODDIRF, T.IDBENEFIRRF, T.ORD, T.CODNATUREZA, T.MES, '+
               ' T.DATAPAGAMENTO, '+
               ' T.IDINFORME, '+

               //Bruno Bastos - Sol - 122590 - Kintana - 611832 - Início
               ' T.FLGNATUREZA, '+
//               ' T.IDPLANOPREV, '+
//               ' T.IDPATRO, '+
//               ' T.IDPROGRAMA, '+
//               ' T.IDMODULO, '+
               //Bruno Bastos - Sol - 122590 - Kintana - 611832 - Fim

               ' T.IDHSTFOLHABENEF, '+
               ' t.fontepagadora, '+
               ' (T.JAN1 + T.FEV1 + T.MAR1 + T.ABR1 + T.MAI1 + T.JUN1 + T.JUL1 + T.AGO1 + T.SET1 + T.OUT1 + T.NOV1 + T.DEZ1) AS RENDBRUTO '+
             ' FROM '+
               ' ( '+
                ' SELECT '+
                  ' MIN(L.IDLANCIRRF) AS IDLANCIRRF, '+
                  ' L.IDHSTFOLHABENEF, '+
                  ' P.NOME, P.NUMDOCUMENTO, I.CODDIRF, L.IDBENEFIRRF, '+
                  ' TO_CHAR(L.DATAPAGAMENTO, ''MM'') AS ORD, '+
                  ' TO_CHAR(L.DATAPAGAMENTO, ''MONTH'') AS MES, '+
                  ' PF.DATANASC, '+

                  //Bruno Bastos - Sol - 122590 - Kintana - 611832 - Início
                  ' I.FLGNATUREZA, '+
//                  ' L.IDPLANOPREV, '+
//                  ' L.IDPATRO, '+
//                  ' L.IDPROGRAMA, '+
//                  ' L.IDMODULO, '+
                  //Bruno Bastos - Sol - 122590 - Kintana - 611832 - Fim

                  ' L.DATAPAGAMENTO, '+
                  ' li.fontepagadora, '+
                  ' LI.IDINFORME, '+
                  ' DECODE(L.CODNATUREZA,''7416'',''0561'',L.CODNATUREZA) AS CODNATUREZA, '+
                  ' SUM(DECODE(TO_CHAR(L.datapagamento,''MM''),''01'',DECODE(I.CODDIRF,''1'',LI.VLRLANC,''2'',DECODE(I.FLGNATUREZA,''N'',LI.VLRLANC*-1,LI.VLRLANC),''3'',LI.VLRLANC,''21'',LI.VLRLANC, ''25'', LI.VLRLANC, ''28'', LI.VLRLANC, ''32'', LI.VLRLANC),0)) AS JAN1, '+ //Bruno Bastos - Sol - 122590 - Kintana - 611832 - //Bruno Bastos - Sol: 130707 - Kintana: 734959
                  ' SUM(DECODE(TO_CHAR(L.datapagamento,''MM''),''02'',DECODE(I.CODDIRF,''1'',LI.VLRLANC,''2'',DECODE(I.FLGNATUREZA,''N'',LI.VLRLANC*-1,LI.VLRLANC),''3'',LI.VLRLANC,''21'',LI.VLRLANC, ''25'', LI.VLRLANC, ''28'', LI.VLRLANC, ''32'', LI.VLRLANC),0)) AS FEV1, '+ //Bruno Bastos - Sol - 122590 - Kintana - 611832 - //Bruno Bastos - Sol: 130707 - Kintana: 734959
                  ' SUM(DECODE(TO_CHAR(L.datapagamento,''MM''),''03'',DECODE(I.CODDIRF,''1'',LI.VLRLANC,''2'',DECODE(I.FLGNATUREZA,''N'',LI.VLRLANC*-1,LI.VLRLANC),''3'',LI.VLRLANC,''21'',LI.VLRLANC, ''25'', LI.VLRLANC, ''28'', LI.VLRLANC, ''32'', LI.VLRLANC),0)) AS MAR1, '+ //Bruno Bastos - Sol - 122590 - Kintana - 611832 - //Bruno Bastos - Sol: 130707 - Kintana: 734959
                  ' SUM(DECODE(TO_CHAR(L.datapagamento,''MM''),''04'',DECODE(I.CODDIRF,''1'',LI.VLRLANC,''2'',DECODE(I.FLGNATUREZA,''N'',LI.VLRLANC*-1,LI.VLRLANC),''3'',LI.VLRLANC,''21'',LI.VLRLANC, ''25'', LI.VLRLANC, ''28'', LI.VLRLANC, ''32'', LI.VLRLANC),0)) AS ABR1, '+ //Bruno Bastos - Sol - 122590 - Kintana - 611832 - //Bruno Bastos - Sol: 130707 - Kintana: 734959
                  ' SUM(DECODE(TO_CHAR(L.datapagamento,''MM''),''05'',DECODE(I.CODDIRF,''1'',LI.VLRLANC,''2'',DECODE(I.FLGNATUREZA,''N'',LI.VLRLANC*-1,LI.VLRLANC),''3'',LI.VLRLANC,''21'',LI.VLRLANC, ''25'', LI.VLRLANC, ''28'', LI.VLRLANC, ''32'', LI.VLRLANC),0)) AS MAI1, '+ //Bruno Bastos - Sol - 122590 - Kintana - 611832 - //Bruno Bastos - Sol: 130707 - Kintana: 734959
                  ' SUM(DECODE(TO_CHAR(L.datapagamento,''MM''),''06'',DECODE(I.CODDIRF,''1'',LI.VLRLANC,''2'',DECODE(I.FLGNATUREZA,''N'',LI.VLRLANC*-1,LI.VLRLANC),''3'',LI.VLRLANC,''21'',LI.VLRLANC, ''25'', LI.VLRLANC, ''28'', LI.VLRLANC, ''32'', LI.VLRLANC),0)) AS JUN1, '+ //Bruno Bastos - Sol - 122590 - Kintana - 611832 - //Bruno Bastos - Sol: 130707 - Kintana: 734959
                  ' SUM(DECODE(TO_CHAR(L.datapagamento,''MM''),''07'',DECODE(I.CODDIRF,''1'',LI.VLRLANC,''2'',DECODE(I.FLGNATUREZA,''N'',LI.VLRLANC*-1,LI.VLRLANC),''3'',LI.VLRLANC,''21'',LI.VLRLANC, ''25'', LI.VLRLANC, ''28'', LI.VLRLANC, ''32'', LI.VLRLANC),0)) AS JUL1, '+ //Bruno Bastos - Sol - 122590 - Kintana - 611832 - //Bruno Bastos - Sol: 130707 - Kintana: 734959
                  ' SUM(DECODE(TO_CHAR(L.datapagamento,''MM''),''08'',DECODE(I.CODDIRF,''1'',LI.VLRLANC,''2'',DECODE(I.FLGNATUREZA,''N'',LI.VLRLANC*-1,LI.VLRLANC),''3'',LI.VLRLANC,''21'',LI.VLRLANC, ''25'', LI.VLRLANC, ''28'', LI.VLRLANC, ''32'', LI.VLRLANC),0)) AS AGO1, '+ //Bruno Bastos - Sol - 122590 - Kintana - 611832 - //Bruno Bastos - Sol: 130707 - Kintana: 734959
                  ' SUM(DECODE(TO_CHAR(L.datapagamento,''MM''),''09'',DECODE(I.CODDIRF,''1'',LI.VLRLANC,''2'',DECODE(I.FLGNATUREZA,''N'',LI.VLRLANC*-1,LI.VLRLANC),''3'',LI.VLRLANC,''21'',LI.VLRLANC, ''25'', LI.VLRLANC, ''28'', LI.VLRLANC, ''32'', LI.VLRLANC),0)) AS SET1, '+ //Bruno Bastos - Sol - 122590 - Kintana - 611832 - //Bruno Bastos - Sol: 130707 - Kintana: 734959
                  ' SUM(DECODE(TO_CHAR(L.datapagamento,''MM''),''10'',DECODE(I.CODDIRF,''1'',LI.VLRLANC,''2'',DECODE(I.FLGNATUREZA,''N'',LI.VLRLANC*-1,LI.VLRLANC),''3'',LI.VLRLANC,''21'',LI.VLRLANC, ''25'', LI.VLRLANC, ''28'', LI.VLRLANC, ''32'', LI.VLRLANC),0)) AS OUT1, '+ //Bruno Bastos - Sol - 122590 - Kintana - 611832 - //Bruno Bastos - Sol: 130707 - Kintana: 734959
                  ' SUM(DECODE(TO_CHAR(L.datapagamento,''MM''),''11'',DECODE(I.CODDIRF,''1'',LI.VLRLANC,''2'',DECODE(I.FLGNATUREZA,''N'',LI.VLRLANC*-1,LI.VLRLANC),''3'',LI.VLRLANC,''21'',LI.VLRLANC, ''25'', LI.VLRLANC, ''28'', LI.VLRLANC, ''32'', LI.VLRLANC),0)) AS NOV1, '+ //Bruno Bastos - Sol - 122590 - Kintana - 611832 - //Bruno Bastos - Sol: 130707 - Kintana: 734959
                  ' SUM(DECODE(TO_CHAR(L.datapagamento,''MM''),''12'',DECODE(I.CODDIRF,''1'',LI.VLRLANC,''2'',DECODE(I.FLGNATUREZA,''N'',LI.VLRLANC*-1,LI.VLRLANC),''3'',LI.VLRLANC,''21'',LI.VLRLANC, ''25'', LI.VLRLANC, ''28'', LI.VLRLANC, ''32'', LI.VLRLANC),0)) AS DEZ1 '+  //Bruno Bastos - Sol - 122590 - Kintana - 611832 - //Bruno Bastos - Sol: 130707 - Kintana: 734959
                ' FROM INFORME I, LANCXINFORME LI, LANCIRRF L, NATURENDIMENTO N, PESSOA P, PESSOAFISICA PF '+
                ' WHERE (I.IDINFORME = LI.IDINFORME) '+
                  ' AND (LI.IDLANCIRRF = L.IDLANCIRRF) '+
                  ' AND (L.CODNATUREZA = N.CODNATUREZA) '+
                  //Bruno Bastos - Sol- 122590 - Kintana - 611832 - ' AND (N.FLGUSADONADIRF = ''S'') '+
                  //' AND P.IDPESSOA in (444451, 458586) '+ //Bruno Bastos - Sol- 122590 - Kintana - 611832 - Teste

                  ' AND LENGTH(I.CODINFORME) = 4 '+ //Bruno Bastos - Sol- 122590 - Kintana - 611832
//                  ' AND I.CODDIRF <> 3 '+ // Arnaldo V. Scarin - SOL: 147991 KTN: 1030433
                  ' AND I.IDINFORME <> 164 '+ // Arnaldo V. Scarin - SOL: 153899
                  ' AND P.IDPESSOA = L.IDBENEFIRRF '+
                  ' AND P.IDPESSOA = PF.IDPESSOA '+
                  ' AND (NVL(L.IDMODULORESPON,L.IDMODULO) = 18) '+
                  ' AND (L.datapagamento BETWEEN TO_DATE('+QuotedStr('01/01/'+sAnoBusca)+',''DD/MM/YYYY'') AND TO_DATE('+QuotedStr('31/12/'+sAnoBusca)+',''DD/MM/YYYY'')) ';
       If sFiltroCPF <> '' then
         sSql := sSql + '  AND P.NUMDOCUMENTO IN ('+sFiltroCPF+')';

       sSql := sSql + ' GROUP BY L.IDHSTFOLHABENEF, LI.IDINFORME, li.fontepagadora, L.DATAPAGAMENTO, PF.DATANASC, '+
                         //Bruno Bastos - Sol - 122590 - Kintana - 611832 - Início
                         ' I.FLGNATUREZA, '+
//                         ' L.IDPLANOPREV, '+
//                         ' L.IDPATRO, '+
//                         ' L.IDPROGRAMA, '+
//                         ' L.IDMODULO, '+
                         //Bruno Bastos - Sol - 122590 - Kintana - 611832 - Fim
                         ' P.NOME, P.NUMDOCUMENTO, DECODE(L.CODNATUREZA,''7416'',''0561'',L.CODNATUREZA),I.CODDIRF, '+
                         ' L.IDBENEFIRRF, TO_CHAR(L.DATAPAGAMENTO, ''MM''),   TO_CHAR(L.DATAPAGAMENTO, ''MONTH'')) T) T2 '+
          ' WHERE (T2.RENDBRUTO < 0) '+
          //Baruc - Sol 166319 - Kintana 1448130          
          ' AND T2.IDINFORME IN (168, 52, 49, 53, 45, 46, 50, 123, 124, 62, 75) '+
          ' ORDER BY T2.NOME, T2.CODDIRF DESC, T2.ORD, T2.FONTEPAGADORA ';
  with tStringlist.Create() do
  begin
    Text := sSql;
    SaveToFile('C:\Planus\temp\SqlCompensaValorNegativo.sql');
    clear;
    free;
  end;
  Result := GetDataPacket(Ssql);
end;

procedure TCtrlGeraAcerto.AjustaInformes(const piCodigoIrrf : Integer;
                                         var psInfFuncef,
                                             psInfInss,
                                             psInfIdosoFuncef,
                                             psInfIdosoInss     : String;
                                         var piInfFuncef,
                                             piInfINSS,
                                             piInfIdosoFuncef,
                                             piInfIdosoInss     : Integer);
begin
  case piCodigoIRRF of
   2,21 : begin //Marcio Sanches Spinosa SOL 217023 KINTANA 2046339
               psInfFuncef      := '49';
               psInfINSS        := '45';
               psInfIdosoFuncef := '52';
               psInfIdosoInss   := '53';
             end;
    25     : begin
               psInfFuncef      := '75';
               psInfINSS        := '77';
               psInfIdosoFuncef := '00';
               psInfIdosoInss   := '00';
             end;
    5      : begin
               psInfFuncef      := '62';
               psInfINSS        := '61';  //'45';  // Edilaine - SOL 202259 / KTN 2042903
               psInfIdosoFuncef := '123'; //Quando for processar 13º Salario
               psInfIdosoInss   := '124'; //'53';  // Edilaine - SOL 202259 / KTN 2042903
             end;
    20      :begin
               if (CdsLancamentos.FieldByName('idinforme').AsInteger = 47) then  //Marcio Sanches Spinosa SOL 217023 KINTANA 2046339
               begin
                 psInfFuncef      := '47';
                 psInfINSS        := '48';
                 psInfIdosoFuncef := '00';
                 psInfIdosoInss   := '00';
               end;
             end;
         3: begin

              if (CdsLancamentos.FieldByName('idinforme').AsInteger <> 50) then  //Marcio Sanches Spinosa SOL 217023 KINTANA 2046339
              begin
               psInfFuncef      := '49';
               psInfINSS        := '45';
               psInfIdosoFuncef := '52';
               psInfIdosoInss   := '53';
              end
              else
              begin
               psInfFuncef      := '50';
               psInfINSS        := '51';
               psInfIdosoFuncef := '52';
               psInfIdosoInss   := '53';
              end;
            end;

 // end;
  end;
  piInfFuncef      := StrToInt(psInfFuncef);
  piInfINSS        := StrToInt(psInfINSS);
  piInfIdosoFuncef := StrToInt(psInfIdosoFuncef);
  piInfIdosoInss   := StrToInt(psInfIdosoInss);
end;


procedure TCtrlGeraAcerto.ZeraValores(const piCodigoIRRF     : Integer;
                                      var prVlr              : Double;
                                      var prVlrComp          : Double;
                                      const prValorIdoso     : Double;
                                      const psDataPagto      : String;
                                      const piIdInfAcerto    : integer;
                                      const piIdInfRendAcJud : integer;
                                      const piIdInfIdosoFund : integer;
                                      const piIdInfIdosoINSS : integer;
                                      const piIdInfRendComp13s : Integer);
var sInformeFuncef,
    sInformeINSS,
    sInformeIdosoFuncef,
    sInformeIdosoInss : String;
    iInformeFuncef,
    iInformeINSS,
    iInformeIdosoFuncef,
    iInformeIdosoInss : Integer;
begin
  AjustaInformes(piCodigoIRRF,
                 sInformeFUNCEF,
                 sInformeINSS,
                 sInformeIdosoFuncef,
                 sInformeIdosoInss,
                 iInformeFUNCEF,
                 iInformeINSS,
                 iInformeIdosoFuncef,
                 iInformeIdosoINSS);

  if CdsLancamentos.FieldByName('FONTEPAGADORA').AsInteger = 1 then
  begin
    {Verifica se tem valor para compensar na mesma fonte pagadora...}
    if CdsBuscaLancxInf.FieldByName('FONTEPAGADORA').AsInteger = 1 then
    begin
      {Compensa na linha de rendimento da Fundação}
      if CdsBuscaLancxInf.Locate('IDINFORME; DATAPAGAMENTO', VarArrayOf([sInformeFuncef, psDataPagto]), []) then
      begin
        InsereLinha(iInformeFuncef, CdsBuscaLancxInf.FieldByName('VALOR').AsFloat, 1);
        prVlrComp := prVlrComp + CdsBuscaLancxInf.FieldByName('VALOR').AsFloat;
        prVlr     := prVlr - CdsBuscaLancxInf.FieldByName('VALOR').AsFloat;
      end;

      {Compensa na linha de rendimento de ação judicial}
      If piCodigoIRRF <> 25 then  // 13o. Salario
      begin
        if CdsBuscaLancxInf.Locate('IDINFORME; DATAPAGAMENTO', VarArrayOf([IntToStr(piIdInfRendAcJud), psDataPagto]), []) then
        begin
          InsereLinha(piIdInfRendAcJud, CdsBuscaLancxInf.FieldByName('VALOR').AsFloat, 1);
          prVlrComp := prVlrComp + CdsBuscaLancxInf.FieldByName('VALOR').AsFloat;
          prVlr     := prVlr - CdsBuscaLancxInf.FieldByName('VALOR').AsFloat;
        end;

        {Compensa na linha de idoso da Fundação}
        if CdsBuscaLancxInf.Locate('IDINFORME; DATAPAGAMENTO', VarArrayOf([IntToStr(piIdInfIdosoFund), psDataPagto]), []) then
        begin
          InsereLinha(piIdInfIdosoFund, CdsBuscaLancxInf.FieldByName('VALOR').AsFloat, 1);
          prVlrComp := prVlrComp + CdsBuscaLancxInf.FieldByName('VALOR').AsFloat;
          prVlr     := prVlr - CdsBuscaLancxInf.FieldByName('VALOR').AsFloat;
         // Baruc habilitou em 18/12/2012
          //AjustaIdoso(prValorIdoso, piIdInfIdosoFund, piIdInfIdosoINSS);
        end;
//         Marcio Sanches Spinosa SOL 247088 PPM 645299. - Inicio
        {Compensa na linha de idoso da Fundação}
        if CdsBuscaLancxInf.Locate('IDINFORME; DATAPAGAMENTO', VarArrayOf([IntToStr(piIdInfRendComp13s), psDataPagto]), []) then
        begin
          InsereLinha(piIdInfRendComp13s, CdsBuscaLancxInf.FieldByName('VALOR').AsFloat, 1);
          prVlrComp := prVlrComp + CdsBuscaLancxInf.FieldByName('VALOR').AsFloat;
          prVlr     := prVlr - CdsBuscaLancxInf.FieldByName('VALOR').AsFloat;
         // Baruc habilitou em 18/12/2012
          //AjustaIdoso(prValorIdoso, piIdInfIdosoFund, piIdInfIdosoINSS);
         //Marcio Sanches Spinosa SOL 247088 PPM 645299. - Fim
        end;
      end;
    end
    else
    begin
      {...senão compensa nas linhas da outra fonte}
      {Compensa na linha de rendimento do INSS}
      if CdsBuscaLancxInf.Locate('IDINFORME; DATAPAGAMENTO', VarArrayOf([sInformeINSS, psDataPagto]), []) then
      begin
        InsereLinha(iInformeINSS, CdsBuscaLancxInf.FieldByName('VALOR').AsFloat, 2);
        prVlrComp := prVlrComp + CdsBuscaLancxInf.FieldByName('VALOR').AsFloat;
        prVlr     := prVlr - CdsBuscaLancxInf.FieldByName('VALOR').AsFloat;
      end;

      If piCodigoIRRF <> 25 then  // 13o. Salario
      begin
        {Compensa na linha de idoso do INSS}
        if CdsBuscaLancxInf.Locate('IDINFORME; DATAPAGAMENTO', VarArrayOf([IntToStr(piIdInfIdosoINSS), psDataPagto]), []) then
        begin
          InsereLinha(piIdInfIdosoINSS, CdsBuscaLancxInf.FieldByName('VALOR').AsFloat, 2);
          prVlrComp := prVlrComp + CdsBuscaLancxInf.FieldByName('VALOR').AsFloat;
          prVlr     := prVlr - CdsBuscaLancxInf.FieldByName('VALOR').AsFloat;
        end;
      end;
    end
  end
  else
  begin
    {Verifica se tem valor para compensar na mesma fonte pagadora...}
    if CdsBuscaLancxInf.FieldByName('FONTEPAGADORA').AsInteger = 2 then
    begin
      {Compensa na linha de rendimento do INSS}
      if CdsBuscaLancxInf.Locate('IDINFORME; DATAPAGAMENTO', VarArrayOf([sInformeINSS, psDataPagto]), []) then
      begin
        InsereLinha(iInformeINSS, CdsBuscaLancxInf.FieldByName('VALOR').AsFloat, 2);
        prVlrComp := prVlrComp + CdsBuscaLancxInf.FieldByName('VALOR').AsFloat;
        prVlr     := prVlr - CdsBuscaLancxInf.FieldByName('VALOR').AsFloat;
      end;

      If piCodigoIRRF <> 25 then  // 13o. Salario
      begin
        {Compensa na linha de idoso do INSS}
        if CdsBuscaLancxInf.Locate('IDINFORME; DATAPAGAMENTO', VarArrayOf([IntToStr(piIdInfIdosoINSS), psDataPagto]), []) then
        begin
          InsereLinha(piIdInfIdosoINSS, CdsBuscaLancxInf.FieldByName('VALOR').AsFloat, 2);
          prVlrComp := prVlrComp + CdsBuscaLancxInf.FieldByName('VALOR').AsFloat;
          prVlr     := prVlr - CdsBuscaLancxInf.FieldByName('VALOR').AsFloat;
        end;
      end;
    end
    else
    begin
      {...senão compensa nas linhas da outra fonte}
      {Compensa na linha de rendimento da Fundação}
      if CdsBuscaLancxInf.Locate('IDINFORME; DATAPAGAMENTO', VarArrayOf([sInformeFUNCEF, psDataPagto]), []) then
      begin
        InsereLinha(iInformeFuncef, CdsBuscaLancxInf.FieldByName('VALOR').AsFloat, 1);
        prVlrComp := prVlrComp + CdsBuscaLancxInf.FieldByName('VALOR').AsFloat;
        prVlr     := prVlr - CdsBuscaLancxInf.FieldByName('VALOR').AsFloat;
      end;

      If piCodigoIRRF <> 25 then  // 13o. Salario
      begin
        {Compensa na linha de ação judicial}
        if CdsBuscaLancxInf.Locate('IDINFORME; DATAPAGAMENTO', VarArrayOf([IntToStr(piIdInfRendAcJud), psDataPagto]), []) then
        begin
          InsereLinha(piIdInfRendAcJud, CdsBuscaLancxInf.FieldByName('VALOR').AsFloat, 1);
          prVlrComp := prVlrComp + CdsBuscaLancxInf.FieldByName('VALOR').AsFloat;
          prVlr     := prVlr - CdsBuscaLancxInf.FieldByName('VALOR').AsFloat;
        end;

        {Compensa na linha de idoso da fundação}
        if CdsBuscaLancxInf.Locate('IDINFORME; DATAPAGAMENTO', VarArrayOf([IntToStr(piIdInfIdosoFund), psDataPagto]), []) then
        begin
          InsereLinha(piIdInfIdosoFund, CdsBuscaLancxInf.FieldByName('VALOR').AsFloat, 1);
          prVlrComp := prVlrComp + CdsBuscaLancxInf.FieldByName('VALOR').AsFloat;
          prVlr     := prVlr - CdsBuscaLancxInf.FieldByName('VALOR').AsFloat;
         // Baruc habilitou em 18/12/2012
          //AjustaIdoso(prValorIdoso, piIdInfIdosoFund, piIdInfIdosoINSS);
        end;
      end;
    end;
  end;
end;

function TCtrlGeraAcerto.NovoGeraAcerto(const sAnoBusca        : string;
                                        const DataBuscaDados   : OleVariant;
                                        const pbProcIntegral   : boolean;
                                        const pCompensaAnoTodo : Boolean): Boolean;
var
  iIdInfRendAcJud,
  iIdInfIdosoFund,
  iIdInfIdosoINSS,
  iIdInfRendCompNeg,
  iIdInfRendCompNegIsento : Integer; //Bruno Bastos - Sol - 122590  - Kintana - 611832
  iIdInfRendCompNeg13S, iIdInfRendComp13s : Integer;
  iIdInforme : Integer;
  idbenefirrf : Integer;
  idLancIrrf : Integer;
  iIdInfRendAcJud13 : integer; //Marcio Sanches Spinosa SOL 243371 PPM 602967
//  idinformeImposto : Integer;
begin
  Try
    bAgrupamentoPorIdInforme := false;
    iCodInformeAtc := 0;
    sNroDocAtc     := '';
    sFlgBuscaAtc   := '';

    Result := True;
    iIdInforme := 0;
    StartTransaction;
    CdsLancamentos.data    := DataBuscaDados;
    cdslancamentos.First;
    cdsAux.Data       := GetDataPacket(' SELECT '                   + #13 +
                                       '   IDINFORMEACJUD, '        + #13 +
                                       '   IDINFORMEACJUD13, '        + #13 + //Marcio Sanches Spinosa SOL 243371 PPM 602967
                                       '   IDINFRENDCOMPNEG, '      + #13 +
                                       '   IDINFRENDCOMPNEG13S,'+ #13 +
                                       '   IDINFORME65ANOS, '       + #13 +
                                       '   IDINFORME65INSS, '       + #13 +
                                       '   IDINFORME65ANOS13, '     + #13 +
                                       '   IDINFRENDCOMPNEGISENTO, ' + #13 +  //Bruno Bastos - Sol - 122590  - Kintana - 611832
                                       '   IDINFORMEMOLESTIA       ' + #13 +
                                       ' FROM '                + #13 +
                                       '   PARAMIRRF ');

    iIdInfRendAcJud   := cdsAux.FieldByName('IDINFORMEACJUD').AsInteger;
    iIdInfIdosoFund   := cdsAux.FieldByName('IDINFORME65ANOS').AsInteger;
    iIdInfIdosoINSS   := cdsAux.FieldByName('IDINFORME65INSS').AsInteger;
//    iIdInfRendCompNeg := cdsAux.FieldByName('IDINFRENDCOMPNEG').AsInteger;
    iIdInfRendCompNegIsento := cdsAux.FieldByName('IDINFRENDCOMPNEGISENTO').AsInteger; //Bruno Bastos - Sol - 122590 - Kintana - 611832
    iIdInfRendCompNeg13s := cdsAux.FieldByName('IDINFRENDCOMPNEG13S').AsInteger;
    iIdInfRendCompNeg := cdsAux.FieldByName('IDINFORMEMOLESTIA').AsInteger;
    iIdInfRendComp13s   :=  cdsAux.FieldByName('IDINFORME65ANOS13').AsInteger;
    iIdInfRendAcJud13   :=  cdsAux.FieldByName('IDINFORMEACJUD13').AsInteger; //Marcio Sanches Spinosa SOL 243371 PPM 602967
    while not CdsLancamentos.Eof do
    Begin
      iIdInforme  := cdslancamentos.FieldByName('IDINFORME').AsInteger;
      idbenefirrf := cdslancamentos.FieldByName('IDBENEFIRRF').AsInteger;
      idLancIrrf  := cdslancamentos.FieldByName('IDLANCIRRF').AsInteger;

      If (cdslancamentos.FieldByName('FLGBUSCA').AsString = 'S') and
        (bVerificaAcumuladorPorInforme(cdslancamentos.data, iIdInforme, idLancIrrf, sNroDocAtc, sFlgBuscaAtc))  Then
      Begin
        case cdslancamentos.FieldByName('CODDIRF').AsInteger of
          //Bruno Bastos - Sol - 122590 - Kintana - 611832 - Início
          1,28,32 : TrataIsento(sAnoBusca,
                                iIdInfRendCompNegIsento,
                                pbProcIntegral,
                                pCompensaAnoTodo);
          //Bruno Bastos - Sol - 122590 - Kintana - 611832 - Fim

          2 : AcertaValorRend(cdslancamentos.FieldByName('CODDIRF').AsInteger,
                              sAnoBusca,
                              pbProcIntegral,
                              iIdInfRendCompNeg,
                              iIdInfRendCompNeg13s,
                              iIdInfRendAcJud,
                              iIdInfIdosoFund,
                              iIdInfIdosoINSS,
                              pCompensaAnoTodo,
                              iIdInforme,
                              idbenefirrf);
          //Marcio Sanches Spinosa SOL 217023 KINTANA 2046339 - Inicio
          20: begin
                 if (CdsLancamentos.FieldByName('IDINFORME').AsInteger <> 47) then
                    AcertaValorRend(cdslancamentos.FieldByName('CODDIRF').AsInteger,
                                    sAnoBusca,
                                    pbProcIntegral,
                                    iIdInfRendCompNeg,
                                    iIdInfRendCompNeg13s,
                                    iIdInfRendAcJud,
                                    iIdInfIdosoFund,
                                    iIdInfIdosoINSS,
                                    pCompensaAnoTodo,
                                    iIdInforme,
                                    idbenefirrf)
                 else
                   AcertaValorRend(cdslancamentos.FieldByName('CODDIRF').AsInteger,
                                    sAnoBusca,
                                    pbProcIntegral,
                                    48,
                                    iIdInfRendCompNeg13s,
                                    iIdInfRendAcJud,
                                    iIdInfIdosoFund,
                                    iIdInfIdosoINSS,
                                    pCompensaAnoTodo,
                                    iIdInforme,
                                    idbenefirrf);
              end;
          // Marcio Sanches Spinosa SOL 217023 KINTANA 2046339 - Fim
          5 : AcertaValorRend13(cdslancamentos.FieldByName('CODDIRF').AsInteger,
                              sAnoBusca,
                              pbProcIntegral,
                              iIdInfRendCompNeg,
                              iIdInfRendCompNeg13s,
                          //Marcio Sanches Spinosa SOL 243371 PPM 602967  - Inicioo
//                              iIdInfRendAcJud,
                              iIdInfRendAcJud13,
                          //Marcio Sanches Spinosa SOL 243371 PPM 602967 - Fim    
                              iIdInfIdosoFund,
                              iIdInfIdosoINSS,
                              pCompensaAnoTodo,
                              iIdInforme,
                              idbenefirrf,
                              iIdInfRendComp13s);

           21 : CompensaDeducoes(cdslancamentos.FieldByName('CODDIRF').AsInteger,
                                   '',
                                   '',
                                   StrToInt(sAnoBusca),
                                   iIdInfRendCompNeg,
                                   iIdInfRendCompNeg13s,
                                   pbProcIntegral,
                                   pCompensaAnoTodo);




          3 : begin
              //Marcio Sanches Spinosa SOL 217023 KINTANA 2046339 - inicio
               if (CdsLancamentos.FieldByName('IDINFORME').AsInteger <> 50) then
                 CompensaDeducoes(cdslancamentos.FieldByName('CODDIRF').AsInteger,
                                   '',
                                   '',
                                   StrToInt(sAnoBusca),
                                   iIdInfRendCompNeg,
                                   iIdInfRendCompNeg13s,
                                   pbProcIntegral,
                                   pCompensaAnoTodo)
               else
                   AcertaValorRend(cdslancamentos.FieldByName('CODDIRF').AsInteger,
                                  sAnoBusca,
                                  pbProcIntegral,
                                  51,
                                  iIdInfRendCompNeg13s,
                                  iIdInfRendAcJud,
                                  iIdInfIdosoFund,
                                  iIdInfIdosoINSS,
                                  pCompensaAnoTodo,
                                  iIdInforme,
                                  idbenefirrf);
               //Marcio Sanches Spinosa SOL 217023 KINTANA 2046339 - Fimi
             end;


          25 : CompensaDeducoes(cdslancamentos.FieldByName('CODDIRF').AsInteger,
                                '',
                                '',
                                StrToInt(sAnoBusca),
                                iIdInfRendCompNeg,
                                iIdInfRendCompNeg13s,
                                True,
                                pCompensaAnoTodo);
        end;
      end;
      CdsLancamentos.Next;
    end;
     if dtmBaseDados.dbBaseDados.InTransaction then  //Marcio Sanches Spinosa SOL 236090 PPM 462974
        dtmBaseDados.dbBaseDados.Commit;
    //LimpaAgrupados();
    MessageInfo := 'Encerrado com sucesso';
  Except
    On E:Exception Do
    Begin
      If InTransaction Then
        Rollback;
      Result := False;
      MessageInfo := E.Message;
    End;
  End;
end;

function TCtrlGeraAcerto.VerificaIdoso(var prVlrIdoso: Double; const pdDataNasc, pdDataPagto: tDateTime): boolean;
var
  sSql : String;
  iMeses, iMesesIdoso : Integer;
begin
  If pdDataNasc = 0 then
    Result := False
  else
  begin
    try
      sSql := 'SELECT IDADEIDOSO, VLRIDOSO '+#13#10+
              'FROM HSTPARAMIRRF'+#13#10+
              'WHERE DATAINIVIGENCIA = (SELECT MAX(DATAINIVIGENCIA)'+#13#10+
              '                         FROM   HSTPARAMIRRF'+#13#10+
              '                         WHERE  DATAINIVIGENCIA <= TO_DATE(' + QuotedStr(DateToStr(pdDataPagto)) + ',''DD/MM/YYYY''))';
      cdsAux.data := GetDataPacket(sSql);
      prVlrIdoso  := cdsAux.fieldByname('VLRIDOSO').AsFloat;
      iMesesIdoso := cdsAux.fieldByname('IDADEIDOSO').AsInteger;
      iMeses      := DiasUteis.IntervaloMeses(pdDataNasc, pdDataPagto) div 12;
      Result      := iMeses >= iMesesIdoso;
    finally
      cdsAux.Close;
    end;
  end;
end;

procedure TCtrlGeraAcerto.CompensaValor(const piCodigoIRRF     : Integer;
                                        var prVlr              : Double;
                                        var prVlrComp          : Double;
                                        var prDif              : Double;
                                        var prPercAcao         : Double;
                                        const prValorIdoso     : Double;
                                        const pbIdoso          : Boolean;
                                        const psDataPagto      : String;
                                        const piIdInfAcerto    : integer;
                                        const piIdInfRendAcJud : integer;
                                        const piIdInfIdosoFund : integer;
                                        const piIdInfIdosoINSS : integer);
Var
  rVlrRendAcao : Double;
  sInformeFUNCEF, sInformeINSS, sInformeIdosoFuncef, sInformeIdosoInss : String;
  iInformeFUNCEF, iInformeINSS, iInformeIdosoFuncef, iInformeIdosoInss : Integer;
  rVlrPercAcao, rVlrDeducao : double; // Edilaine - SOL 202259 / KTN 2042903
begin
  AjustaInformes(piCodigoIRRF,
                 sInformeFUNCEF,
                 sInformeINSS,
                 sInformeIdosoFuncef,
                 sInformeIdosoInss,
                 iInformeFUNCEF,
                 iInformeINSS,
                 iInformeIdosoFuncef,
                 iInformeIdosoINSS
                 );

  // Edilaine - SOL 202259 / KTN 2042903
  if (prPercAcao > 0) and (piCodigoIRRF in [2,5]) and (CdsLancamentos.FieldByName('FONTEPAGADORA').AsInteger = 1) then
     rVlrPercAcao := RoundCM(prVlr * (prPercAcao/100), 2)
  else
     rVlrPercAcao := 0;
  // Edilaine - SOL 202259 / KTN 2042903 - fim

// verificar se o valor do idoso esta sendo deduzido do valor principal
  if prDif <= prValorIdoso then
  begin
    if CdsLancamentos.FieldByName('FONTEPAGADORA').AsInteger = 1 then
    begin
      {Verifica se tem valor para compensar na mesma fonte pagadora...}
      if CdsBuscaLancxInf.FieldByName('FONTEPAGADORA').AsInteger = 1 then
      begin
        {Compensa na linha de rendimento da Fundação}
        if CdsBuscaLancxInf.Locate('IDINFORME; DATAPAGAMENTO', VarArrayOf([sInformeFUNCEF, psDataPagto]), []) then
        begin
           rVlrDeducao := (prVlr - rVlrPercAcao);   // Edilaine - SOL 202259 / KTN 2042903

          if CdsBuscaLancxInf.FieldByName('VALOR').AsFloat <= rVlrDeducao then     // Edilaine - SOL 202259 / KTN 2042903
          begin
            // Edilaine - SOL 202259 / KTN 2042903
            if prPercAcao = 0 then
               rVlrDeducao := CdsBuscaLancxInf.FieldByName('VALOR').AsFloat;

            InsereLinha(iInformeFUNCEF, rVlrDeducao, 1);
            prVlrComp := prVlrComp + rVlrDeducao;
            prVlr     := prVlr - rVlrDeducao;
            // Edilaine - SOL 202259 / KTN 2042903 - fim
          end
          else
          begin
            // Edilaine - SOL 202259 / KTN 2042903
            InsereLinha(iInformeFUNCEF, rVlrDeducao, 1);
            prVlrComp := prVlrComp + rVlrDeducao;
            prVlr     := prVlr - rVlrDeducao;
            // Edilaine - SOL 202259 / KTN 2042903 - fim
          end;
        end;

        If piCodigoIRRF <> 25 then  // 13o. Salario
        begin
          {Compensa na linha de rendimento de ação judicial}
          if CdsBuscaLancxInf.Locate('IDINFORME; DATAPAGAMENTO', VarArrayOf([IntToStr(piIdInfRendAcJud), psDataPagto]), []) then
          begin
            if CdsBuscaLancxInf.FieldByName('VALOR').AsFloat <= prVlr then
            begin
              InsereLinha(piIdInfRendAcJud, CdsBuscaLancxInf.FieldByName('VALOR').AsFloat, 1);
              prVlrComp := prVlrComp + CdsBuscaLancxInf.FieldByName('VALOR').AsFloat;
              prVlr     := prVlr - CdsBuscaLancxInf.FieldByName('VALOR').AsFloat;
            end
            else
            begin
              InsereLinha(piIdInfRendAcJud, prVlr, 1);
              prVlrComp := prVlrComp + prVlr;
              prVlr     := prVlr - prVlr;
            end;
          end;

          {Compensa na linha de idoso da fundação}
          if pbIdoso {and (prDif < prValorIdoso)} then
          begin
            if CdsBuscaLancxInf.Locate('IDINFORME; DATAPAGAMENTO', VarArrayOf([IntToStr(piIdInfIdosoFund), psDataPagto]), []) then
            begin
//              if ((prDif - prValorIdoso)*-1) <= prVlr then  // Baruc em 23/01/2012 12:30
              if prVlr <= ((prDif - prValorIdoso)*-1) then
              begin
//                InsereLinha(piIdInfIdosoFund, ((prDif - prValorIdoso)*-1), 1);   // Baruc em 23/01/2012 12:30
                InsereLinha(piIdInfIdosoFund, prVlr, 1);
                {
                prVlrComp := prVlrComp + ((prDif - prValorIdoso) * -1);
                prVlr     := prVlr - ((prDif - prValorIdoso) * -1);
                }
                prVlrComp := prVlrComp + prVlr;
                prVlr     := prVlr - prVlr;
              end;
            end
            else
              begin
                InsereLinha(iInformeIdosoFuncef, prVlr, 1);
                prVlrComp := prVlrComp + prVlr;
                prVlr     := prVlr - prVlr;
              end;
              // Baruc habilitou em 18/12/2012
              //AjustaIdoso(prValorIdoso, piIdInfIdosoFund, piIdInfIdosoINSS);
          end;
        end;
      end
      else
      begin
        {...senão compensa nas linhas da outra fonte}
        {Compensa na linha de rendimento do Inss}
        if CdsBuscaLancxInf.Locate('IDINFORME; DATAPAGAMENTO', VarArrayOf([sInformeINSS, psDataPagto]), []) then
        begin
          if CdsBuscaLancxInf.FieldByName('VALOR').AsFloat <= prVlr then
          begin
            InsereLinha(iInformeINSS, CdsBuscaLancxInf.FieldByName('VALOR').AsFloat, 2);
            prVlrComp := prVlrComp + CdsBuscaLancxInf.FieldByName('VALOR').AsFloat;
            prVlr     := prVlr - CdsBuscaLancxInf.FieldByName('VALOR').AsFloat;
          end
          else
          begin
            InsereLinha(iInformeINSS, prVlr, 2);
            prVlrComp := prVlrComp + prVlr;
            prVlr     := prVlr - prVlr;
          end;
        end;

        If piCodigoIRRF <> 25 then  // 13o. Salario
        begin
          {Compensa na linha de idoso do INSS}
          if pbIdoso {and (prDif < prValorIdoso)} then
          begin
            if CdsBuscaLancxInf.Locate('IDINFORME; DATAPAGAMENTO', VarArrayOf([IntToStr(piIdInfIdosoINSS), psDataPagto]), []) then
            begin
              if ((prDif - prValorIdoso)*-1) <= prVlr then
              begin
                InsereLinha(piIdInfIdosoINSS, ((prDif - prValorIdoso)*-1), 2);
                prVlrComp := prVlrComp + ((prDif - prValorIdoso) * -1);
                prVlr     := prVlr - ((prDif - prValorIdoso) * -1);
              end
              else
              begin
                InsereLinha(piIdInfIdosoINSS, prVlr, 2);
                prVlrComp := prVlrComp + prVlr;
                prVlr     := prVlr - prVlr;
              end;
            end;
          end;
        end;
      end;
    end
    else
    begin
      {Verifica se tem valor para compensar na mesma fonte pagadora...}
      if CdsBuscaLancxInf.FieldByName('FONTEPAGADORA').AsInteger = 2 then
      begin
        {Compensa na linha de rendimento do INSS}
        if CdsBuscaLancxInf.Locate('IDINFORME; DATAPAGAMENTO', VarArrayOf([sInformeINSS, psDataPagto]), []) then
        begin
          if CdsBuscaLancxInf.FieldByName('VALOR').AsFloat <= prVlr then
          begin
            InsereLinha(iInformeINSS, CdsBuscaLancxInf.FieldByName('VALOR').AsFloat, 2);
            prVlrComp := prVlrComp + CdsBuscaLancxInf.FieldByName('VALOR').AsFloat;
            prVlr     := prVlr - CdsBuscaLancxInf.FieldByName('VALOR').AsFloat;
          end
          else
          begin
            InsereLinha(iInformeINSS, prVlr, 2);
            prVlrComp := prVlrComp + prVlr;
            prVlr     := prVlr - prVlr;
          end;
        end;

        If piCodigoIRRF <> 25 then  // 13o. Salario
        begin
          {Compensa na linha de idoso do Inss}
          if pbIdoso {and (prDif < prValorIdoso)} then
          begin
            if CdsBuscaLancxInf.Locate('IDINFORME; DATAPAGAMENTO', VarArrayOf([IntToStr(piIdInfIdosoINSS), psDataPagto]), []) then
            begin
              if ((prDif - prValorIdoso)*-1) <= prVlr then
              begin
                InsereLinha(piIdInfIdosoINSS, ((prDif - prValorIdoso)*-1), 2);
                prVlrComp := prVlrComp + ((prDif - prValorIdoso) * -1);
                prVlr     := prVlr - ((prDif - prValorIdoso) * -1);
              end
              else
              begin
                InsereLinha(piIdInfIdosoINSS, prVlr, 2);
                prVlrComp := prVlrComp + prVlr;
                prVlr     := prVlr - prVlr;
              end;
            end;
          end;
        end;
      end
      else
      begin
        {...senão compensa nas linhas da outra fonte}
        {Compensa na linha de rendimento da fundação}
        if CdsBuscaLancxInf.Locate('IDINFORME; DATAPAGAMENTO', VarArrayOf([sInformeFUNCEF, psDataPagto]), []) then
        begin
          if CdsBuscaLancxInf.FieldByName('VALOR').AsFloat <= prVlr then
          begin
            InsereLinha(iInformeFUNCEF, CdsBuscaLancxInf.FieldByName('VALOR').AsFloat, 1);
            prVlrComp := prVlrComp + CdsBuscaLancxInf.FieldByName('VALOR').AsFloat;
            prVlr     := prVlr - CdsBuscaLancxInf.FieldByName('VALOR').AsFloat;
          end
          else
          begin
            InsereLinha(iInformeFUNCEF, prVlr, 1);
            prVlrComp := prVlrComp + prVlr;
            prVlr     := prVlr - prVlr;
          end;
        end;

        If piCodigoIRRF <> 25 then  // 13o. Salario
        begin
          {Compensa na linha de rendimento de ação judicial}
          if CdsBuscaLancxInf.Locate('IDINFORME; DATAPAGAMENTO', VarArrayOf([IntToStr(piIdInfRendAcJud), psDataPagto]), []) then
          begin
            if CdsBuscaLancxInf.FieldByName('VALOR').AsFloat <= prVlr then
              begin
                InsereLinha(piIdInfRendAcJud, CdsBuscaLancxInf.FieldByName('VALOR').AsFloat, 1);
                prVlrComp := prVlrComp + CdsBuscaLancxInf.FieldByName('VALOR').AsFloat;
                prVlr     := prVlr - CdsBuscaLancxInf.FieldByName('VALOR').AsFloat;
              end
            else
              begin
                InsereLinha(piIdInfRendAcJud, prVlr, 1);
                prVlrComp := prVlrComp + prVlr;
                prVlr     := prVlr - prVlr;
              end;
          end;

          {Compensa na linha de idoso da Fundação}
          if pbIdoso {and (prDif < prValorIdoso)} then
          begin
            if CdsBuscaLancxInf.Locate('IDINFORME; DATAPAGAMENTO', VarArrayOf([IntToStr(piIdInfIdosoFund), psDataPagto]), []) then
            begin
              if ((prDif - prValorIdoso)*-1) <= prVlr then
              begin
                InsereLinha(piIdInfIdosoFund, ((prDif - prValorIdoso)*-1), 1);
                prVlrComp := prVlrComp + ((prDif - prValorIdoso) * -1);
                prVlr     := prVlr - ((prDif - prValorIdoso) * -1);
              end
              else
              begin
                InsereLinha(piIdInfIdosoFund, prVlr, 1);
                prVlrComp := prVlrComp + prVlr;
                prVlr     := prVlr - prVlr;
              end;
            end
            else
              begin
                InsereLinha(iInformeIdosoFuncef, prVlr, 1);
                prVlrComp := prVlrComp + prVlr;
                prVlr     := prVlr - prVlr;
              end;
              // Baruc habilitou em 18/12/2012
              //AjustaIdoso(prValorIdoso, piIdInfIdosoFund, piIdInfIdosoINSS);
          end;
        end;
      end;
    end;
  end
  else
  begin
    If piCodigoIRRF <> 25 then  // 13o. Salario
    begin
      {Se a diferença for maior que idoso, entende-se que a linha do idoso já está com o valor cheio.
       Sendo assim não é preciso alterar a linha de idoso.}
      if CdsLancamentos.FieldByName('FONTEPAGADORA').AsInteger = 1 then
      begin
        {Verifica se tem valor para compensar na mesma fonte pagadora...}
        if (CdsBuscaLancxInf.FieldByName('FONTEPAGADORA').AsInteger  = 1) then
          {and (CdsBuscaLancxInf.FieldByName('IDINFORME').AsInteger     <> 52)}
        begin
          {Compensa na linha de rendimento de ação judicial}
          if CdsBuscaLancxInf.Locate('IDINFORME; DATAPAGAMENTO', VarArrayOf([IntToStr(piIdInfRendAcJud), psDataPagto]), []) then
          begin
            InsereLinha(piIdInfRendAcJud, (prVlr * prPercAcao) / 100 , 1);
            prVlrComp    := prVlrComp + ((prVlr * prPercAcao) / 100);
            rVlrRendAcao := prVlr - ((prVlr * prPercAcao) / 100); //Bruno Bastos - 26/03/2009 - SOL: 95579 - Kintana: 413536 -
            //Bruno Bastos - 26/03/2009 - SOL: 95579 - Kintana: 413536 - prVlr     := prVlr - ((prVlr * prPercAcao) / 100);

            {Compensa na linha de rendimento da Fundação}
            if CdsBuscaLancxInf.Locate('IDINFORME; DATAPAGAMENTO', VarArrayOf([sInformeFUNCEF, psDataPagto]), []) then
            begin
              InsereLinha(iInformeFUNCEF, prVlr - ((prVlr * prPercAcao) / 100), 1);
              prVlrComp := prVlrComp + (prVlr - ((prVlr * prPercAcao) / 100));
              //Bruno Bastos - 26/03/2009 - SOL: 95579 - Kintana: 413536 - prVlr     := prVlr - (prVlr - ((prVlr * prPercAcao) / 100));
              prVlr     := prVlr - (rVlrRendAcao + (prVlr - ((prVlr * prPercAcao) / 100))); //Bruno Bastos - 26/03/2009 - SOL: 95579 - Kintana: 413536
            end;
          end
          else
          begin
            {Compensa na linha de rendimento da Fundação}
            if CdsBuscaLancxInf.Locate('IDINFORME; DATAPAGAMENTO', VarArrayOf([sInformeFUNCEF, psDataPagto]), []) then
            begin
              InsereLinha(iInformeFUNCEF, prVlr, 1);
              prVlrComp := prVlrComp + prVlr;
              prVlr     := prVlr - prVlr;
            end;
          end;
        end
        else
        begin
          {...senão compensa na outra fonte}
          {compensa na linha de rendimento do Inss}
          if CdsBuscaLancxInf.Locate('IDINFORME; DATAPAGAMENTO', VarArrayOf([sInformeINSS, psDataPagto]), []) then
          begin
            InsereLinha(iInformeINSS, prVlr, 2);
            prVlrComp := prVlrComp + prVlr;
            prVlr     := prVlr - prVlr;
          end;
        end;
      end
      else
      begin
        {Verifica se tem valor para compensar na mesma fonte pagadora...}
        if (CdsBuscaLancxInf.FieldByName('FONTEPAGADORA').AsInteger  = 2) then
        begin
          {Compensa na linha de rendimento do Inss}
          if CdsBuscaLancxInf.Locate('IDINFORME; DATAPAGAMENTO', VarArrayOf([sInformeINSS, psDataPagto]), []) then
          begin
            InsereLinha(iInformeINSS, prVlr, 2);
            prVlrComp := prVlrComp + prVlr;
            prVlr     := prVlr - prVlr;
          end;
        end
        else
        begin
          {...senão compensa na outra fonte}
          {Compensa na linha de rendimento de ação judicial}
          if CdsBuscaLancxInf.Locate('IDINFORME; DATAPAGAMENTO', VarArrayOf([IntToStr(piIdInfRendAcJud), psDataPagto]), []) then
          begin
            InsereLinha(piIdInfRendAcJud, (prVlr * prPercAcao) / 100 , 1);
            prVlrComp := prVlrComp + ((prVlr * prPercAcao) / 100);
            rVlrRendAcao := prVlr - ((prVlr * prPercAcao) / 100); //Bruno Bastos - 26/03/2009 - SOL: 95579 - Kintana: 413536 -
            //Bruno Bastos - 26/03/2009 - SOL: 95579 - Kintana: 413536 - prVlr     := prVlr - ((prVlr * prPercAcao) / 100);

            {Compensa na linha de rendimento da Fundação}
            if CdsBuscaLancxInf.Locate('IDINFORME; DATAPAGAMENTO', VarArrayOf([sInformeFUNCEF, psDataPagto]), []) then
            begin
              InsereLinha(iInformeFUNCEF, prVlr - ((prVlr * prPercAcao) / 100), 1);
              prVlrComp := prVlrComp + (prVlr - ((prVlr * prPercAcao) / 100));
              //Bruno Bastos - 26/03/2009 - SOL: 95579 - Kintana: 413536 - prVlr     := prVlr - (prVlr - ((prVlr * prPercAcao) / 100));
              prVlr     := prVlr - (rVlrRendAcao + (prVlr - ((prVlr * prPercAcao) / 100))); //Bruno Bastos - 26/03/2009 - SOL: 95579 - Kintana: 413536
            end;
          end
          else
          begin
            {Compensa na linha de rendimento da Fundação}
            if CdsBuscaLancxInf.Locate('IDINFORME; DATAPAGAMENTO', VarArrayOf([sInformeFUNCEF, psDataPagto]), []) then
            begin
              InsereLinha(iInformeFUNCEF, prVlr, 1);
              prVlrComp := prVlrComp + prVlr;
              prVlr     := prVlr - prVlr;
            end;
          end;
        end;
      end;
    end;
  end;
end;

procedure TCtrlGeraAcerto.InsereLinha(const piIdinforme : integer;
                                      const prVlrComp   : double;
                                      const piFontePag  : integer;
                                      const pbLancaRend : boolean;
                                      const isTrataIdoso: Boolean);
var
  sSql     : String;

  iCodLanc,
  rValor      : Double; //Bruno Bastos - Sol - 122590  - Kintana - 611832
  bPrim    : Boolean;

  //Bruno Bastos - Sol - 122590  - Kintana - 611832 - Início
  sDtComp,
  sDtAcerto   : string;

  iIdPlanoPrev,
  iIdPatro,
  iIdPrograma,
  iIdModulo    : Integer;
  //Bruno Bastos - Sol - 122590  - Kintana - 611832 - Fim

begin
  iIdPlanoPrev := 0;
  iIdPatro     := 0;
  iIdPrograma  := 0;
  iIdModulo    := 0;

  if prVlrComp > 0 then
  begin
 //   rValor := prVlrComp;
//    //Bruno Bastos - Sol - 122590  - Kintana - 611832 - Início
//    if not isTrataIdoso then
//    begin
      if pbLancaRend then
      begin
        sDtComp     := CdsLancamentos.FieldByName('DATAPAGAMENTO').AsString;
        sDtAcerto   := CdsLancamentos.FieldByName('DATAPAGAMENTO').AsString;
        rValor      := prVlrComp * -1;

        sSql        := ' SELECT IDPLANOPREV, IDPATRO, IDPROGRAMA, IDMODULO '+
                       ' FROM LANCIRRF WHERE IDLANCIRRF = '+CdsLancamentos.FieldByName('IDLANCIRRF').AsString;

        cdsAux.Data := GetDataPacket(SSql);

        iIdPlanoPrev := cdsAux.FieldByName('IDPLANOPREV').AsInteger;
        iIdPatro     := cdsAux.FieldByName('IDPATRO').AsInteger;
        iIdPrograma  := cdsAux.FieldByName('IDPROGRAMA').AsInteger;
        iIdModulo    := cdsAux.FieldByName('IDMODULO').AsInteger;

      end
      else
      begin
        sDtComp     := CdsBuscaLancxInf.FieldByName('DATAPAGAMENTO').AsString;
        sDtAcerto   := CdsLancamentos.FieldByName('DATAPAGAMENTO').AsString;
        rValor      := prVlrComp;
      end;
      //Bruno Bastos - Sol - 122590  - Kintana - 611832 - Fim

      cdsAux.Close;
      Ssql := 'SELECT (0) AS VLRLANCSINAL, IDINFORME, IDLANCIRRF, PERCLANC, VLRLANC, FONTEPAGADORA, FLGTIPOREG '+
              'FROM  LANCXINFORME  '+
              'WHERE (1 = 2)';
      cdsAux.data := GetDataPacket(SSql);

      cdsAux.Insert;
      cdsAux.FieldByName('IDINFORME').AsInteger     := piIdInforme;
       //Bruno Bastos - Sol - 122590  - Kintana - 611832 - cdsAux.FieldByName('VLRLANC').AsFloat         := -RoundCM(prVlrComp, 2);
      //Bruno Bastos - Sol - 122590  - Kintana - 611832 - cdsAux.FieldByName('VLRLANCSINAL').AsFloat    := -RoundCM(prVlrComp, 2);
      //Bruno Bastos - Sol - 122590  - Kintana - 611832 - cdsAux.FieldByName('FONTEPAGADORA').AsInteger := CdsBuscaLancxInf.FieldByName('FONTEPAGADORA').AsInteger;

      //Marcio Sanches Spinosa SOL 217767 KINTANA 2049332 - Inicio
      if not isTrataIdoso then
      begin

        cdsAux.FieldByName('VLRLANC').AsFloat         := -RoundCM(rValor, 2); //Bruno Bastos - Sol - 122590  - Kintana - 611832
        cdsAux.FieldByName('VLRLANCSINAL').AsFloat    := -RoundCM(rValor, 2); //Bruno Bastos - Sol - 122590  - Kintana - 611832
        cdsAux.FieldByName('FONTEPAGADORA').AsInteger := piFontePag;         //Bruno Bastos - Sol - 122590  - Kintana - 611832
        cdsAux.FieldByName('IDLANCIRRF').AsInteger    := CdsBuscaLancxInf.FieldByName('IDLANCIRRF').AsInteger;
        cdsAux.FieldByName('FLGTIPOREG').AsString     := 'C';
        cdsAux.Post;
      end
      else
      begin
        cdsAux.FieldByName('VLRLANC').AsFloat         := -RoundCM(0, 2); //Bruno Bastos - Sol - 122590  - Kintana - 611832
        cdsAux.FieldByName('VLRLANCSINAL').AsFloat    := -RoundCM(0, 2); //Bruno Bastos - Sol - 122590  - Kintana - 611832
        cdsAux.FieldByName('FONTEPAGADORA').AsInteger := piFontePag;         //Bruno Bastos - Sol - 122590  - Kintana - 611832
        cdsAux.FieldByName('IDLANCIRRF').AsInteger    := CdsBuscaLancxInf.FieldByName('IDLANCIRRF').AsInteger;
        cdsAux.FieldByName('FLGTIPOREG').AsString     := 'C';
        cdsAux.Post;

      end;
//      Marcio Sanches Spinosa SOL 217767 KINTANA 2049332 - Fim
      Try
        iCodLanc := 0;
        if pbLancaRend then
        begin
          If not CtrlLancIRRF.GravaIRRF(Sistema.IdEmpresa, False, 0, Sistema.IdEmpresa,
                                        cdsLancamentos.FieldByName('IDBENEFIRRF').AsFloat,
                                        cdsLancamentos.FieldByName('CODNATUREZA').AsString,
                                        DateToStr(Date), 0, 0, 0, 0, 0, 0, 0, 0, 0,
                                        cdsAux.data, iCodLanc, '', 0, 'S',
                                        iIdPlanoPrev,
                                        iIdPatro,
                                        iIdPrograma,
                                        bPrim,
                                        iIdModulo,
                                        iIdModulo,
                                        0, '',
                                        cdsLancamentos.FieldByName('IDHSTFOLHABENEF').AsInteger,
                                        '', '', '', 0, 0, True, 0, True,
                                        //Bruno Bastos - Sol - 122590 - Kintana - 611832 - CdsBuscaLancxInf.FieldByName('DATAPAGAMENTO').AsString) Then
                                        sDtComp) Then //Bruno Bastos - Sol - 122590 - Kintana - 611832
            MessageInfo := 'Erro ao tentar inserir o LancIRRF'
          else
            rValor      := prVlrComp;
        end
        else
        begin
          If not CtrlLancIRRF.GravaIRRF(Sistema.IdEmpresa, False, 0, Sistema.IdEmpresa,
                                        cdsLancamentos.FieldByName('IDBENEFIRRF').AsFloat,
                                        CdsBuscaLancxInf.FieldByName('CODNATUREZA').AsString,
                                        DateToStr(Date), 0, 0, 0, 0, 0, 0, 0, 0, 0,
                                        cdsAux.data, iCodLanc, '', 0, 'S',
                                        CdsBuscaLancxInf.FieldByName('IDPLANOPREV').AsInteger,
                                        CdsBuscaLancxInf.FieldByName('IDPATRO').AsInteger,
                                        CdsBuscaLancxInf.FieldByName('IDPROGRAMA').AsInteger,
                                        bPrim,
                                        CdsBuscaLancxInf.FieldByName('IDMODULO').AsInteger,
                                        CdsBuscaLancxInf.FieldByName('IDMODULO').AsInteger,
                                        0, '',
                                        CdsBuscaLancxInf.FieldByName('IDHSTFOLHABENEF').AsInteger,
                                        '', '', '', 0, 0, True, 0, True,
                                        //Bruno Bastos - Sol - 122590 - Kintana - 611832 - CdsBuscaLancxInf.FieldByName('DATAPAGAMENTO').AsString) Then
                                        sDtComp, 0 , 0 , CdsBuscaLancxInf.FieldByName('IDPROCJUD').AsInteger ) Then
            MessageInfo := 'Erro ao tentar inserir o LancIRRF';
        end;
      Except
        On E:Exception Do
        Begin
          If InTransaction Then
            Rollback;
          MessageInfo := E.Message;
        End;
      End;

      Try
        InsereLancIRRFAcerto(cdslancamentos.fieldbyname('IDLANCIRRF').AsInteger, Trunc(iCodLanc));
      Except
        On E:Exception Do
        Begin
          If InTransaction Then
            Rollback;
          MessageInfo := E.Message;
        End;
      End;

      cdsAux.Close;
//    end;
//    Ssql := 'SELECT (0) AS VLRLANCSINAL, IDINFORME, IDLANCIRRF, PERCLANC, VLRLANC, FONTEPAGADORA, FLGTIPOREG '+
//              'FROM  LANCXINFORME  '+
//              'WHERE (1 = 2)';
    cdsAux.data := GetDataPacket(SSql);


    case cdslancamentos.FieldByName('IDINFORME').AsInteger of
      49,52 :
        begin
          cdsAux.Insert;
          cdsAux.FieldByName('IDINFORME').AsInteger     := 49;
          //Bruno Bastos - Sol - 122590  - Kintana - 611832 - cdsAux.FieldByName('VLRLANC').AsFloat         := RoundCM(prVlrComp, 2);
          //Bruno Bastos - Sol - 122590  - Kintana - 611832 - cdsAux.FieldByName('VLRLANCSINAL').AsFloat    := RoundCM(prVlrComp, 2);
          cdsAux.FieldByName('VLRLANC').AsFloat         := RoundCM(rValor, 2); //Bruno Bastos - Sol - 122590  - Kintana - 611832
          cdsAux.FieldByName('VLRLANCSINAL').AsFloat    := RoundCM(rValor, 2); //Bruno Bastos - Sol - 122590  - Kintana - 611832
          cdsAux.FieldByName('FONTEPAGADORA').AsInteger := cdslancamentos.FieldByName('FONTEPAGADORA').AsInteger;
          cdsAux.FieldByName('FLGTIPOREG').AsString     := 'P';
          cdsAux.Post;
        end;
      45, 53 :
        begin
          cdsAux.Insert;
          cdsAux.FieldByName('IDINFORME').AsInteger     := 45;
          //Bruno Bastos - Sol - 122590  - Kintana - 611832 - cdsAux.FieldByName('VLRLANC').AsFloat         := RoundCM(prVlrComp, 2);
          //Bruno Bastos - Sol - 122590  - Kintana - 611832 - cdsAux.FieldByName('VLRLANCSINAL').AsFloat    := RoundCM(prVlrComp, 2);
          cdsAux.FieldByName('VLRLANC').AsFloat         := RoundCM(rValor, 2); //Bruno Bastos - Sol - 122590  - Kintana - 611832
          cdsAux.FieldByName('VLRLANCSINAL').AsFloat    := RoundCM(rValor, 2); //Bruno Bastos - Sol - 122590  - Kintana - 611832
          cdsAux.FieldByName('FONTEPAGADORA').AsInteger := cdslancamentos.FieldByName('FONTEPAGADORA').AsInteger;
          cdsAux.FieldByName('FLGTIPOREG').AsString     := 'P';
          cdsAux.Post;
        end;
       62, 123:
        begin
          cdsAux.Insert;
          cdsAux.FieldByName('IDINFORME').AsInteger     := 62;
          //Bruno Bastos - Sol - 122590  - Kintana - 611832 - cdsAux.FieldByName('VLRLANC').AsFloat         := RoundCM(prVlrComp, 2);
          //Bruno Bastos - Sol - 122590  - Kintana - 611832 - cdsAux.FieldByName('VLRLANCSINAL').AsFloat    := RoundCM(prVlrComp, 2);
          cdsAux.FieldByName('VLRLANC').AsFloat         := RoundCM(rValor, 2); //Bruno Bastos - Sol - 122590  - Kintana - 611832
          cdsAux.FieldByName('VLRLANCSINAL').AsFloat    := RoundCM(rValor, 2); //Bruno Bastos - Sol - 122590  - Kintana - 611832
          cdsAux.FieldByName('FONTEPAGADORA').AsInteger := cdslancamentos.FieldByName('FONTEPAGADORA').AsInteger;
          cdsAux.FieldByName('FLGTIPOREG').AsString     := 'P';
          cdsAux.Post;
        end;

      else
        begin
          cdsAux.Insert;
          cdsAux.FieldByName('IDINFORME').AsInteger     := cdslancamentos.FieldByName('IDINFORME').AsInteger;
          //Bruno Bastos - Sol - 122590  - Kintana - 611832 - cdsAux.FieldByName('VLRLANC').AsFloat         := RoundCM(prVlrComp, 2);
          //Bruno Bastos - Sol - 122590  - Kintana - 611832 - cdsAux.FieldByName('VLRLANCSINAL').AsFloat    := RoundCM(prVlrComp, 2);
          cdsAux.FieldByName('VLRLANC').AsFloat         := RoundCM(rValor, 2); //Bruno Bastos - Sol - 122590  - Kintana - 611832
          cdsAux.FieldByName('VLRLANCSINAL').AsFloat    := RoundCM(rValor, 2); //Bruno Bastos - Sol - 122590  - Kintana - 611832
          cdsAux.FieldByName('FONTEPAGADORA').AsInteger := cdslancamentos.FieldByName('FONTEPAGADORA').AsInteger;
          cdsAux.FieldByName('FLGTIPOREG').AsString     := 'P';
          cdsAux.Post;
        end;
    end;


    {Inserir o lançamento positivo para o mês compensado}
    Try
      iCodLanc := 0;
      if pbLancaRend then
      begin
        If not CtrlLancIRRF.GravaIRRF(Sistema.IdEmpresa, False, 0, Sistema.IdEmpresa,
                                      cdsLancamentos.FieldByName('IDBENEFIRRF').AsFloat,
                                      cdsLancamentos.FieldByName('CODNATUREZA').AsString,
                                      DateToStr(Date), 0, 0, 0, 0, 0, 0, 0, 0, 0,
                                      cdsAux.data, iCodLanc, '', 0, 'S',
                                      iIdPlanoPrev,
                                      iIdPatro,
                                      iIdPrograma,
                                      bPrim,
                                      iIdModulo,
                                      iIdModulo,
                                      0, '',
                                      cdsLancamentos.FieldByName('IDHSTFOLHABENEF').AsInteger,
                                      '', '', '', 0, 0, True, 0, True,
                                      //Bruno Bastos - Sol - 122590 - Kintana - 611832 - CdsBuscaLancxInf.FieldByName('DATAPAGAMENTO').AsString) Then
                                      sDtAcerto, 0, 0, CdsBuscaLancxInf.FieldByName('IDPROCJUD').AsInteger ) Then
                                      //Bruno Bastos - Sol - 122590 - Kintana - 611832
          MessageInfo := 'Erro ao tentar inserir o LancIRRF';
      end
      else
      begin
        If not CtrlLancIRRF.GravaIRRF(Sistema.IdEmpresa, False, 0, Sistema.IdEmpresa,
                                      cdsLancamentos.FieldByName('IDBENEFIRRF').AsFloat,
                                      CdsBuscaLancxInf.FieldByName('CODNATUREZA').AsString,
                                      DateToStr(Date), 0, 0, 0, 0, 0, 0, 0, 0, 0,
                                      cdsAux.data, iCodLanc, '', 0, 'S',
                                      CdsBuscaLancxInf.FieldByName('IDPLANOPREV').AsInteger,
                                      CdsBuscaLancxInf.FieldByName('IDPATRO').AsInteger,
                                      CdsBuscaLancxInf.FieldByName('IDPROGRAMA').AsInteger,
                                      bPrim,
                                      CdsBuscaLancxInf.FieldByName('IDMODULO').AsInteger,
                                      CdsBuscaLancxInf.FieldByName('IDMODULO').AsInteger,
                                      0, '',
                                      CdsLancamentos.FieldByName('IDHSTFOLHABENEF').AsInteger,
                                      '', '', '', 0, 0, True, 0, True,
                                      //Bruno Bastos - Sol - 122590 - Kintana - 611832 - CdsLancamentos.FieldByName('DATAPAGAMENTO').AsString) Then
                                      sDtAcerto, 0, 0, CdsBuscaLancxInf.FieldByName('IDPROCJUD').AsInteger) Then
                                      //Bruno Bastos - Sol - 122590 - Kintana - 611832
          MessageInfo := 'Erro ao tentar inserir o LancIRRF';
      end;
    Except
      On E:Exception Do
      Begin
        If InTransaction Then
          Rollback;
        MessageInfo := E.Message;
      End;
    End;

    Try
      InsereLancIRRFAcerto(cdslancamentos.fieldbyname('IDLANCIRRF').AsInteger, Trunc(iCodLanc));
    Except
      On E:Exception Do
      Begin
        If InTransaction Then
          Rollback;
        MessageInfo := E.Message;
      End;
    End;
  end;
end;



procedure TCtrlGeraAcerto.InsereLinhaEspIdoso(const piIdinforme : integer;
                                      const prVlrComp   : double;
                                      const piFontePag  : integer;
                                      const pbLancaRend : boolean);
var
  sSql     : String;

  iCodLanc,
  rValor      : Double; //Bruno Bastos - Sol - 122590  - Kintana - 611832
  bPrim    : Boolean;

  //Bruno Bastos - Sol - 122590  - Kintana - 611832 - Início
  sDtComp,
  sDtAcerto   : string;

  iIdPlanoPrev,
  iIdPatro,
  iIdPrograma,
  iIdModulo    : Integer;
  //Bruno Bastos - Sol - 122590  - Kintana - 611832 - Fim

begin
  iIdPlanoPrev := 0;
  iIdPatro     := 0;
  iIdPrograma  := 0;
  iIdModulo    := 0;

  if prVlrComp > 0 then
  begin
    //Bruno Bastos - Sol - 122590  - Kintana - 611832 - Início
    if pbLancaRend then
    begin
      sDtComp     := CdsLancamentos.FieldByName('DATAPAGAMENTO').AsString;
      sDtAcerto   := CdsLancamentos.FieldByName('DATAPAGAMENTO').AsString;
      rValor      := prVlrComp * -1;

      sSql        := ' SELECT IDPLANOPREV, IDPATRO, IDPROGRAMA, IDMODULO '+
                     ' FROM LANCIRRF WHERE IDLANCIRRF = '+CdsLancamentos.FieldByName('IDLANCIRRF').AsString;

      cdsAux.Data := GetDataPacket(SSql);

      iIdPlanoPrev := cdsAux.FieldByName('IDPLANOPREV').AsInteger;
      iIdPatro     := cdsAux.FieldByName('IDPATRO').AsInteger;
      iIdPrograma  := cdsAux.FieldByName('IDPROGRAMA').AsInteger;
      iIdModulo    := cdsAux.FieldByName('IDMODULO').AsInteger;

    end
    else
    begin
      sDtComp     := CdsBuscaLancxInf.FieldByName('DATAPAGAMENTO').AsString;
      sDtAcerto   := CdsLancamentos.FieldByName('DATAPAGAMENTO').AsString;
      rValor      := prVlrComp;
    end;
    //Bruno Bastos - Sol - 122590  - Kintana - 611832 - Fim

    cdsAux.Close;
    Ssql := 'SELECT (0) AS VLRLANCSINAL, IDINFORME, IDLANCIRRF, PERCLANC, VLRLANC, FONTEPAGADORA, FLGTIPOREG '+
            'FROM  LANCXINFORME  '+
            'WHERE (1 = 2)';
    cdsAux.data := GetDataPacket(SSql);

    cdsAux.Insert;
    cdsAux.FieldByName('IDINFORME').AsInteger     := piIdInforme;
    //Bruno Bastos - Sol - 122590  - Kintana - 611832 - cdsAux.FieldByName('VLRLANC').AsFloat         := -RoundCM(prVlrComp, 2);
    //Bruno Bastos - Sol - 122590  - Kintana - 611832 - cdsAux.FieldByName('VLRLANCSINAL').AsFloat    := -RoundCM(prVlrComp, 2);
    //Bruno Bastos - Sol - 122590  - Kintana - 611832 - cdsAux.FieldByName('FONTEPAGADORA').AsInteger := CdsBuscaLancxInf.FieldByName('FONTEPAGADORA').AsInteger;
    cdsAux.FieldByName('VLRLANC').AsFloat         := -RoundCM(rValor, 2); //Bruno Bastos - Sol - 122590  - Kintana - 611832
    cdsAux.FieldByName('VLRLANCSINAL').AsFloat    := -RoundCM(rValor, 2); //Bruno Bastos - Sol - 122590  - Kintana - 611832
    cdsAux.FieldByName('FONTEPAGADORA').AsInteger := piFontePag;         //Bruno Bastos - Sol - 122590  - Kintana - 611832
    cdsAux.FieldByName('IDLANCIRRF').AsInteger    := CdsBuscaLancxInf.FieldByName('IDLANCIRRF').AsInteger;
    cdsAux.FieldByName('FLGTIPOREG').AsString     := 'C';
    cdsAux.Post;

    Try
      iCodLanc := 0;
      if pbLancaRend then
      begin
        If not CtrlLancIRRF.GravaIRRF(Sistema.IdEmpresa, False, 0, Sistema.IdEmpresa,
                                      cdsLancamentos.FieldByName('IDBENEFIRRF').AsFloat,
                                      cdsLancamentos.FieldByName('CODNATUREZA').AsString,
                                      DateToStr(Date), 0, 0, 0, 0, 0, 0, 0, 0, 0,
                                      cdsAux.data, iCodLanc, '', 0, 'S',
                                      iIdPlanoPrev,
                                      iIdPatro,
                                      iIdPrograma,
                                      bPrim,
                                      iIdModulo,
                                      iIdModulo,
                                      0, '',
                                      cdsLancamentos.FieldByName('IDHSTFOLHABENEF').AsInteger,
                                      '', '', '', 0, 0, True, 0, True,
                                      //Bruno Bastos - Sol - 122590 - Kintana - 611832 - CdsBuscaLancxInf.FieldByName('DATAPAGAMENTO').AsString) Then
                                      sDtComp) Then //Bruno Bastos - Sol - 122590 - Kintana - 611832
          MessageInfo := 'Erro ao tentar inserir o LancIRRF'
        else
          rValor      := prVlrComp;
      end
      else
      begin
        If not CtrlLancIRRF.GravaIRRF(Sistema.IdEmpresa, False, 0, Sistema.IdEmpresa,
                                      cdsLancamentos.FieldByName('IDBENEFIRRF').AsFloat,
                                      CdsBuscaLancxInf.FieldByName('CODNATUREZA').AsString,
                                      DateToStr(Date), 0, 0, 0, 0, 0, 0, 0, 0, 0,
                                      cdsAux.data, iCodLanc, '', 0, 'S',
                                      CdsBuscaLancxInf.FieldByName('IDPLANOPREV').AsInteger,
                                      CdsBuscaLancxInf.FieldByName('IDPATRO').AsInteger,
                                      CdsBuscaLancxInf.FieldByName('IDPROGRAMA').AsInteger,
                                      bPrim,
                                      CdsBuscaLancxInf.FieldByName('IDMODULO').AsInteger,
                                      CdsBuscaLancxInf.FieldByName('IDMODULO').AsInteger,
                                      0, '',
                                      CdsBuscaLancxInf.FieldByName('IDHSTFOLHABENEF').AsInteger,
                                      '', '', '', 0, 0, True, 0, True,
                                      //Bruno Bastos - Sol - 122590 - Kintana - 611832 - CdsBuscaLancxInf.FieldByName('DATAPAGAMENTO').AsString) Then
                                      sDtComp, 0 , 0 , CdsBuscaLancxInf.FieldByName('IDPROCJUD').AsInteger ) Then
          MessageInfo := 'Erro ao tentar inserir o LancIRRF';
      end;
    Except
      On E:Exception Do
      Begin
        If InTransaction Then
          Rollback;
        MessageInfo := E.Message;
      End;
    End;

    Try
      InsereLancIRRFAcerto(cdslancamentos.fieldbyname('IDLANCIRRF').AsInteger, Trunc(iCodLanc));
    Except
      On E:Exception Do
      Begin
        If InTransaction Then
          Rollback;
        MessageInfo := E.Message;
      End;
    End;

    cdsAux.Close;
    cdsAux.data := GetDataPacket(SSql);


    case cdslancamentos.FieldByName('IDINFORME').AsInteger of
      49,52 :
        begin
          cdsAux.Insert;
          cdsAux.FieldByName('IDINFORME').AsInteger     := 49;
          //Bruno Bastos - Sol - 122590  - Kintana - 611832 - cdsAux.FieldByName('VLRLANC').AsFloat         := RoundCM(prVlrComp, 2);
          //Bruno Bastos - Sol - 122590  - Kintana - 611832 - cdsAux.FieldByName('VLRLANCSINAL').AsFloat    := RoundCM(prVlrComp, 2);
          cdsAux.FieldByName('VLRLANC').AsFloat         := RoundCM(rValor, 2); //Bruno Bastos - Sol - 122590  - Kintana - 611832
          cdsAux.FieldByName('VLRLANCSINAL').AsFloat    := RoundCM(rValor, 2); //Bruno Bastos - Sol - 122590  - Kintana - 611832
          cdsAux.FieldByName('FONTEPAGADORA').AsInteger := cdslancamentos.FieldByName('FONTEPAGADORA').AsInteger;
          cdsAux.FieldByName('FLGTIPOREG').AsString     := 'P';
          cdsAux.Post;
        end;
      45, 53 :
        begin
          cdsAux.Insert;
          cdsAux.FieldByName('IDINFORME').AsInteger     := 45;
          //Bruno Bastos - Sol - 122590  - Kintana - 611832 - cdsAux.FieldByName('VLRLANC').AsFloat         := RoundCM(prVlrComp, 2);
          //Bruno Bastos - Sol - 122590  - Kintana - 611832 - cdsAux.FieldByName('VLRLANCSINAL').AsFloat    := RoundCM(prVlrComp, 2);
          cdsAux.FieldByName('VLRLANC').AsFloat         := RoundCM(rValor, 2); //Bruno Bastos - Sol - 122590  - Kintana - 611832
          cdsAux.FieldByName('VLRLANCSINAL').AsFloat    := RoundCM(rValor, 2); //Bruno Bastos - Sol - 122590  - Kintana - 611832
          cdsAux.FieldByName('FONTEPAGADORA').AsInteger := cdslancamentos.FieldByName('FONTEPAGADORA').AsInteger;
          cdsAux.FieldByName('FLGTIPOREG').AsString     := 'P';
          cdsAux.Post;
        end;
      else
        begin
          cdsAux.Insert;
          cdsAux.FieldByName('IDINFORME').AsInteger     := cdslancamentos.FieldByName('IDINFORME').AsInteger;
          //Bruno Bastos - Sol - 122590  - Kintana - 611832 - cdsAux.FieldByName('VLRLANC').AsFloat         := RoundCM(prVlrComp, 2);
          //Bruno Bastos - Sol - 122590  - Kintana - 611832 - cdsAux.FieldByName('VLRLANCSINAL').AsFloat    := RoundCM(prVlrComp, 2);
          cdsAux.FieldByName('VLRLANC').AsFloat         := RoundCM(rValor, 2); //Bruno Bastos - Sol - 122590  - Kintana - 611832
          cdsAux.FieldByName('VLRLANCSINAL').AsFloat    := RoundCM(rValor, 2); //Bruno Bastos - Sol - 122590  - Kintana - 611832
          cdsAux.FieldByName('FONTEPAGADORA').AsInteger := cdslancamentos.FieldByName('FONTEPAGADORA').AsInteger;
          cdsAux.FieldByName('FLGTIPOREG').AsString     := 'P';
          cdsAux.Post;
        end;
    end;


    {Inserir o lançamento positivo para o mês compensado}
    Try
      iCodLanc := 0;
      if pbLancaRend then
      begin
        If not CtrlLancIRRF.GravaIRRF(Sistema.IdEmpresa, False, 0, Sistema.IdEmpresa,
                                      cdsLancamentos.FieldByName('IDBENEFIRRF').AsFloat,
                                      cdsLancamentos.FieldByName('CODNATUREZA').AsString,
                                      DateToStr(Date), 0, 0, 0, 0, 0, 0, 0, 0, 0,
                                      cdsAux.data, iCodLanc, '', 0, 'S',
                                      iIdPlanoPrev,
                                      iIdPatro,
                                      iIdPrograma,
                                      bPrim,
                                      iIdModulo,
                                      iIdModulo,
                                      0, '',
                                      cdsLancamentos.FieldByName('IDHSTFOLHABENEF').AsInteger,
                                      '', '', '', 0, 0, True, 0, True,
                                      //Bruno Bastos - Sol - 122590 - Kintana - 611832 - CdsBuscaLancxInf.FieldByName('DATAPAGAMENTO').AsString) Then
                                      sDtAcerto, 0, 0, CdsBuscaLancxInf.FieldByName('IDPROCJUD').AsInteger ) Then
                                      //Bruno Bastos - Sol - 122590 - Kintana - 611832
          MessageInfo := 'Erro ao tentar inserir o LancIRRF';
      end
      else
      begin
        If not CtrlLancIRRF.GravaIRRF(Sistema.IdEmpresa, False, 0, Sistema.IdEmpresa,
                                      cdsLancamentos.FieldByName('IDBENEFIRRF').AsFloat,
                                      CdsBuscaLancxInf.FieldByName('CODNATUREZA').AsString,
                                      DateToStr(Date), 0, 0, 0, 0, 0, 0, 0, 0, 0,
                                      cdsAux.data, iCodLanc, '', 0, 'S',
                                      CdsBuscaLancxInf.FieldByName('IDPLANOPREV').AsInteger,
                                      CdsBuscaLancxInf.FieldByName('IDPATRO').AsInteger,
                                      CdsBuscaLancxInf.FieldByName('IDPROGRAMA').AsInteger,
                                      bPrim,
                                      CdsBuscaLancxInf.FieldByName('IDMODULO').AsInteger,
                                      CdsBuscaLancxInf.FieldByName('IDMODULO').AsInteger,
                                      0, '',
                                      CdsLancamentos.FieldByName('IDHSTFOLHABENEF').AsInteger,
                                      '', '', '', 0, 0, True, 0, True,
                                      //Bruno Bastos - Sol - 122590 - Kintana - 611832 - CdsLancamentos.FieldByName('DATAPAGAMENTO').AsString) Then
                                      sDtAcerto, 0, 0, CdsBuscaLancxInf.FieldByName('IDPROCJUD').AsInteger) Then
                                      //Bruno Bastos - Sol - 122590 - Kintana - 611832
          MessageInfo := 'Erro ao tentar inserir o LancIRRF';
      end;
    Except
      On E:Exception Do
      Begin
        If InTransaction Then
          Rollback;
        MessageInfo := E.Message;
      End;
    End;

    Try
      InsereLancIRRFAcerto(cdslancamentos.fieldbyname('IDLANCIRRF').AsInteger, Trunc(iCodLanc));
    Except
      On E:Exception Do
      Begin
        If InTransaction Then
          Rollback;
        MessageInfo := E.Message;
      End;
    End;
  end;
end;


function TCtrlGeraAcerto.VerificaExistenciaAcaoJudicial(const piIdPessoa : Integer; const pdDataIni: TDateTime; const pdDataFim: TDateTime; var prPercAcao: Double) : boolean;
var
  sSql : String;
begin
  sSql := 'SELECT IDPessoa'+#13#10+
          '       ,DECODE(NVL(PERCACAO,0),0,0,1) as TEMACAO'+#13#10+
          '       ,PERCACAO'+#13#10+
          'FROM PROCJUD'+#13#10+
          'WHERE IDPESSOA = '+IntToStr(piIdPessoa)+#13#10+
          '  and DATAINICIO <= to_date('+ QuotedStr(DateToStr(pdDataFim)) +',''dd/mm/yyyy'')'+#13#10+
          '  and ( (DATAFINAL Is Null) or (DATAFINAL >= to_date('+ QuotedStr(DateToStr(pdDataIni)) +',''dd/mm/yyyy'')) )';
  cdsAux.data := GetDataPacket(SSql);
  Result      := (cdsAux.FieldByName('TEMACAO').AsInteger = 1);
  if Result then
    prPercAcao  := cdsAux.FieldByName('PERCACAO').AsFloat
  else
    prPercAcao  := 0;
end;


procedure TCtrlGeraAcerto.AjustaIdoso(const prVlrBaseIdoso   : double;
                                      const piIdInfIdosoFund : integer;
                                      const piIdInfIdosoINSS : integer;
                                      var pvlrIdoso        : Double);
var
  sSql        : String;
  bPrim       : Boolean;

  rVlrAjuste,
  rVlrIdoso,
  iCodLanc    : Double;

begin
  rVlrIdoso  := 0;
  rVlrAjuste := 0;

  cdsAux1.Close;
  Ssql := 'select sum(lxi.vlrlanc) as valor, '+
          '  decode(lxi.idinforme, '+ IntToStr(piIdInfIdosoFund) +', 1, '+ IntToStr(piIdInfIdosoINSS) +', 1, lxi.idinforme)  FONTEPAGADORA '+
//          ' FONTEPAGADORA ' +
          'from '+
          '  lancirrf     lir, '+
          '  lancxinforme lxi '+
          'where lir.idbenefirrf   = '+ CdsLancamentos.FieldByName('IDBENEFIRRF').AsString +
          '  and lir.datapagamento = '+ QuotedStr(CdsBuscaLancxInf.FieldByName('DATAPAGAMENTO').AsString) +
          '  and lir.idlancirrf = lxi.idlancirrf '+
          '  and lxi.idinforme in ('+ IntToStr(piIdInfIdosoFund) +','+ IntToStr(piIdInfIdosoINSS) +' ) '+
          'group by '+
          '  decode(lxi.idinforme, '+ IntToStr(piIdInfIdosoFund) +', 1, '+ IntToStr(piIdInfIdosoINSS) +', 1, lxi.idinforme) '+
          'having '+
          '  sum(lxi.vlrlanc) > 0 ';
  cdsAux1.data := GetDataPacket(SSql);

  if cdsAux1.Locate('FONTEPAGADORA', '1', []) then
    rVlrIdoso := cdsAux1.FieldByName('VALOR').AsFloat;

  cdsAux.Close;
  Ssql := 'SELECT (0) AS VLRLANCSINAL, IDINFORME, IDLANCIRRF, PERCLANC, VLRLANC, FONTEPAGADORA, FLGTIPOREG '+
          'FROM  LANCXINFORME  '+
          'WHERE (1 = 2)';
  cdsAux.data := GetDataPacket(SSql);
//  if cdsAux1.Locate('IDINFORME', '45', []) then
  if cdsAux1.Locate('FONTEPAGADORA', '2', []) then
    begin
      if cdsAux1.FieldByName('VALOR').AsFloat >= prVlrBaseIdoso  then
  //    if cdsAux1.FieldByName('VALOR').AsFloat >= (prVlrBaseIdoso - rVlrIdoso) then
        rVlrAjuste := prVlrBaseIdoso //- rVlrIdoso
      else
      begin
        rVlrAjuste := cdsAux1.FieldByName('VALOR').AsFloat;
        pvlrIdoso  := cdsAux1.FieldByName('VALOR').AsFloat; //Marcio Sanches Spinosa SOL 217767 KINTANA 2049332
      end;


      cdsAux.Insert;
      cdsAux.FieldByName('IDINFORME').AsInteger     := piIdInfIdosoINSS;
      cdsAux.FieldByName('VLRLANC').AsFloat         := -RoundCM(rVlrAjuste, 2);
      cdsAux.FieldByName('VLRLANCSINAL').AsFloat    := -RoundCM(rVlrAjuste, 2);
      cdsAux.FieldByName('FONTEPAGADORA').AsInteger := 2;
      cdsAux.FieldByName('IDLANCIRRF').AsInteger    := CdsBuscaLancxInf.FieldByName('IDLANCIRRF').AsInteger;
      cdsAux.FieldByName('FLGTIPOREG').AsString     := 'A';

      cdsAux.Post;

    end
  else
    begin
      if cdsAux1.FieldByName('VALOR').AsFloat >= prVlrBaseIdoso  then
  //    if cdsAux1.FieldByName('VALOR').AsFloat >= (prVlrBaseIdoso - rVlrIdoso) then
        rVlrAjuste := prVlrBaseIdoso //- rVlrIdoso
      else
        rVlrAjuste := cdsAux1.FieldByName('VALOR').AsFloat;
      // Baruc 21/12/2012 as 12:15 desativado para testes
      {

      cdsAux.Insert;
      cdsAux.FieldByName('IDINFORME').AsInteger     := 52;
      cdsAux.FieldByName('VLRLANC').AsFloat         := -RoundCM(rVlrAjuste, 2);
      cdsAux.FieldByName('VLRLANCSINAL').AsFloat    := -RoundCM(rVlrAjuste, 2);
      cdsAux.FieldByName('FONTEPAGADORA').AsInteger := 1;
      cdsAux.FieldByName('IDLANCIRRF').AsInteger    := CdsBuscaLancxInf.FieldByName('IDLANCIRRF').AsInteger;
      cdsAux.FieldByName('FLGTIPOREG').AsString     := 'A';
      cdsAux.Post;
      }
    end;


  if not cdsAux.IsEmpty then
  begin
    Try
      iCodLanc := 0;
      If not CtrlLancIRRF.GravaIRRF(Sistema.IdEmpresa, False, 0, Sistema.IdEmpresa,
                                    cdsLancamentos.FieldByName('IDBENEFIRRF').AsFloat,
                                    CdsBuscaLancxInf.FieldByName('CODNATUREZA').AsString,
                                    DateToStr(Date), 0, 0, 0, 0, 0, 0, 0, 0, 0,
                                    cdsAux.data, iCodLanc, '', 0, 'S',
                                    CdsBuscaLancxInf.FieldByName('IDPLANOPREV').AsInteger,
                                    CdsBuscaLancxInf.FieldByName('IDPATRO').AsInteger,
                                    CdsBuscaLancxInf.FieldByName('IDPROGRAMA').AsInteger,
                                    bPrim,
                                    CdsBuscaLancxInf.FieldByName('IDMODULO').AsInteger,
                                    CdsBuscaLancxInf.FieldByName('IDMODULO').AsInteger,
                                    0, '',
                                    CdsBuscaLancxInf.FieldByName('IDHSTFOLHABENEF').AsInteger,
                                    '', '', '', 0, 0, True, 0, True,
                                    CdsBuscaLancxInf.FieldByName('DATAPAGAMENTO').AsString, 0, 0,
                                    CdsBuscaLancxInf.FieldByName('IDPROCJUD').AsInteger) Then
        MessageInfo := 'Erro ao tentar inserir o LancIRRF';
    Except
      On E:Exception Do
      Begin
        If InTransaction Then
          Rollback;
        MessageInfo := E.Message;
      End;
    End;

    Try
      InsereLancIRRFAcerto(cdslancamentos.fieldbyname('IDLANCIRRF').AsInteger, Trunc(iCodLanc));
    Except
      On E:Exception Do
      Begin
        If InTransaction Then
          Rollback;
        MessageInfo := E.Message;
      End;
    End;



    cdsAux.Close;
//    if cdsAux1.Locate('FONTEPAGADORA', '2', []) then
//      begin
//        cdsAux.data := GetDataPacket(SSql);
//        cdsAux.Insert;
//        cdsAux.FieldByName('IDINFORME').AsInteger     := 49;
//        cdsAux.FieldByName('VLRLANC').AsFloat         := RoundCM(rVlrAjuste, 2);
//        cdsAux.FieldByName('VLRLANCSINAL').AsFloat    := RoundCM(rVlrAjuste, 2);
//        cdsAux.FieldByName('FONTEPAGADORA').AsInteger := 2;
//        cdsAux.FieldByName('FLGTIPOREG').AsString     := 'A';
//        cdsAux.Post;
//      end;


    {Inserir o lançamento positivo para o mês compensado}
    Try
      iCodLanc := 0;
      If not CtrlLancIRRF.GravaIRRF(Sistema.IdEmpresa, False, 0, Sistema.IdEmpresa,
                                    cdsLancamentos.FieldByName('IDBENEFIRRF').AsFloat,
                                    CdsBuscaLancxInf.FieldByName('CODNATUREZA').AsString,
                                    DateToStr(Date), 0, 0, 0, 0, 0, 0, 0, 0, 0,
                                    cdsAux.data, iCodLanc, '', 0, 'S',
                                    CdsBuscaLancxInf.FieldByName('IDPLANOPREV').AsInteger,
                                    CdsBuscaLancxInf.FieldByName('IDPATRO').AsInteger,
                                    CdsBuscaLancxInf.FieldByName('IDPROGRAMA').AsInteger,
                                    bPrim,
                                    CdsBuscaLancxInf.FieldByName('IDMODULO').AsInteger,
                                    CdsBuscaLancxInf.FieldByName('IDMODULO').AsInteger,
                                    0, '',
                                    CdsBuscaLancxInf.FieldByName('IDHSTFOLHABENEF').AsInteger,
                                    '', '', '', 0, 0, True, 0, True,
                                    CdsBuscaLancxInf.FieldByName('DATAPAGAMENTO').AsString,0, 0,
                                    CdsBuscaLancxInf.FieldByName('IDPROCJUD').AsInteger) Then
        MessageInfo := 'Erro ao tentar inserir o LancIRRF';
    Except
      On E:Exception Do
      Begin
        If InTransaction Then
          Rollback;
        MessageInfo := E.Message;
      End;
    End;

    Try
      InsereLancIRRFAcerto(cdslancamentos.fieldbyname('IDLANCIRRF').AsInteger, Trunc(iCodLanc));
    Except
      On E:Exception Do
      Begin
        If InTransaction Then
          Rollback;
        MessageInfo := E.Message;
      End;
    End;
  end;
end;


procedure TCtrlGeraAcerto.AcertaValorRend13(Const piCodigoIrrf          : Integer;
                                          const psAnoBusca            : string;
                                          const pbCompOutraFonte      : boolean;
                                          const piIdInfRendCompNeg    : integer;
                                          const piIdInfRendCompNeg13S : integer;
                                          const piIdInfRendAcJud      : integer;
                                          const piIdInfIdosoFund      : integer;
                                          const piIdInfIdosoINSS      : integer;
                                          const pCompensaAnoTodo      : Boolean;
                                          const idInforme             : integer;
                                          const idbenefirrf           : integer;
                                          const piIdInfRendComp13S    : integer);
Var
  sDataPagto    : String;
  iContFontePag : integer; {Tratar a abertura da query para qual fonte pagadora (1 - Funcef; 2 - INSS)}

  rPercAcao,
  rValorIdoso,
  rDif,
  rTotRend,
  rValor,
  rValorComp  : Double;

  bIdoso,
  bTemAcao    : Boolean;

  tbmSomaRend : tbookmark;
  sInformeFUNCEF, sInformeINSS, sInformeIdosoFuncef, sInformeIdosoINSS  : String;
  iInformeFUNCEF, iInformeINSS, iInformeIdosoFuncef, iInformeIdosoINSS  : integer;
  iIdRendCompNeg : Integer;
  sMes : String;
begin
  rDif := 0;
  rValorIdoso := 0;

  AjustaInformes(piCodigoIRRF,
                 sInformeFUNCEF,
                 sInformeINSS,
                 sInformeIdosoFuncef,
                 sInformeIdosoInss,
                 iInformeFUNCEF,
                 iInformeINSS,
                 iInformeIdosoFuncef,
                 iInformeIdosoINSS);

  If piCodigoIRRF in [ 2, 3, 20, 21 ] then //Marcio Sanches Spinosa SOL 217023 KINTANA 2046339
    iIdRendCompNeg := piIdInfRendCompNeg
  else
    iIdRendCompNeg := piIdInfRendCompNeg13s;
  // Baruc - para pegar todos os valore da mesma idinforme SOL 166319 - KTN 1448130
  rValor := fSomaValoresPorInforme(cdslancamentos.data, idInforme, CdsLancamentos.FieldByName('NUMDOCUMENTO').AsString) * -1;
  //rValor        :=  cdslancamentos.FieldByName('VALOR').AsFloat * -1;
  rValorComp    := 0;
  rTotRend      := 0;
  iContFontePag := cdslancamentos.FieldByName('FONTEPAGADORA').AsInteger;
//sMes          := cdsLancamentos.FieldByName('ORD').AsString;
  sMes          := cdsLancamentos.FieldByName('ORD').AsString;


  iCodInformeAtc := cdslancamentos.FieldByName('IDINFORME').AsInteger;
  sNroDocAtc     := cdsLancamentos.FieldByName('NUMDOCUMENTO').AsString;
  sFlgBuscaAtc   := cdsLancamentos.FieldByName('FLGBUSCA').AsString;


  // SOL 166319 - KTN 1448130
  // Bem se existir mais de uma fonte, deve compensar um por vez, com a seguinte regra.
  //  se o idInforme = 49 e tiver saldo, zere do idInforme = 45
  //  se o idInforme = 52 e tiver saldo, zere do idInforme = 53
  //  somente estes acima, os demais, faça a operação, se não zerar, assim deve ficar.
  repeat

    // Edilaine - SOL 202259 / KTN 2042903
    if not CdsBuscaLancxInf.isEmpty then
       CdsBuscaLancxInf.EmptyDataSet;
    // Edilaine - SOL 202259 / KTN 2042903 - fim

    if (iContFontePag = 1) then
    begin
      if cdslancamentos.FieldByName('FONTEPAGADORA').AsInteger = 1 then
        begin
          //Marcio Sanches Spinosa SOL 243371 PPM 602967 - Inicio
          CdsBuscaLancxInf.Data := BuscaLancxInforme(psAnoBusca,
                                                   sMes,
                                                   cdsLancamentos.FieldByName('IDBENEFIRRF').AsInteger,
                                                   piIdInfRendAcJud,//iInformeFUNCEF,
                                                   iInformeFUNCEF, { piIdInfRendCompNeg,}    // Edilaine - SOL 202259 / KTN 2042903
                                                   cdslancamentos.FieldByName('FONTEPAGADORA').AsInteger,
                                                   False,
                                                   pCompensaAnoTodo);
           //Marcio Sanches Spinosa SOL 243371 PPM 602967 - Fim

          if CdsBuscaLancxInf.RecordCount = 0  then
            CdsBuscaLancxInf.Data := BuscaLancxInforme(psAnoBusca,
                                                     sMes,
                                                     cdsLancamentos.FieldByName('IDBENEFIRRF').AsInteger,
                                                     piIdInfRendComp13S,//iInformeFUNCEF,
                                                     iInformeFUNCEF, { piIdInfRendCompNeg,}    // Edilaine - SOL 202259 / KTN 2042903
                                                     cdslancamentos.FieldByName('FONTEPAGADORA').AsInteger,
                                                     False,
                                                     pCompensaAnoTodo);
          if CdsBuscaLancxInf.RecordCount = 0  then
            begin
              CdsBuscaLancxInf.Data := BuscaLancxInforme(psAnoBusca,
                                                         sMes,
                                                         cdsLancamentos.FieldByName('IDBENEFIRRF').AsInteger,
                                                         iInformeIdosoFuncef,
                                                         0,
                                                         cdslancamentos.FieldByName('FONTEPAGADORA').AsInteger,
                                                         False,
                                                         pCompensaAnoTodo);

            end;

        end
    end
    else if (iContFontePag = 2) then
    begin
      if (pbCompOutraFonte) then
      begin
        if cdslancamentos.FieldByName('FONTEPAGADORA').AsInteger = 2 then
          CdsBuscaLancxInf.Data := BuscaLancxInforme(psAnoBusca,
                                                     sMes,
                                                     cdsLancamentos.FieldByName('IDBENEFIRRF').AsInteger,
                                                     iInformeIdosoINSS,
                                                     iInformeINSS,
                                                     cdslancamentos.FieldByName('FONTEPAGADORA').AsInteger,
                                                     False,
                                                     pCompensaAnoTodo);

          if CdsBuscaLancxInf.RecordCount = 0  then
            begin
              CdsBuscaLancxInf.Data := BuscaLancxInforme(psAnoBusca,
                                                         sMes,
                                                         cdsLancamentos.FieldByName('IDBENEFIRRF').AsInteger,
                                                         iInformeINSS,    //iInformeIdosoINSS
                                                         iInformeIdosoINSS,
                                                         cdslancamentos.FieldByName('FONTEPAGADORA').AsInteger,
                                                         False,
                                                         pCompensaAnoTodo);

            end;
      end;
    end
    else If (iContFontePag = 3) then
    begin
      if (pbCompOutraFonte) then
      begin
        if cdslancamentos.FieldByName('FONTEPAGADORA').AsInteger = 3 then
          CdsBuscaLancxInf.Data := BuscaLancxInforme(psAnoBusca,
                                                     sMes,
                                                     cdsLancamentos.FieldByName('IDBENEFIRRF').AsInteger,
                                                     iInformeINSS,
                                                     0,
                                                     cdslancamentos.FieldByName('FONTEPAGADORA').AsInteger,
                                                     False,
                                                     pCompensaAnoTodo)
        else
          CdsBuscaLancxInf.Data := BuscaLancxInforme(psAnoBusca,
                                                     sMes,
                                                     cdsLancamentos.FieldByName('IDBENEFIRRF').AsInteger,
                                                     iInformeFUNCEF,
                                                     piIdInfRendCompNeg,
                                                     cdslancamentos.FieldByName('FONTEPAGADORA').AsInteger,
                                                     False,
                                                     pCompensaAnoTodo);
      end;
    end
    else if (iContFontePag = 4) then
    begin
      if (pbCompOutraFonte) then
      begin
        if cdslancamentos.FieldByName('FONTEPAGADORA').AsInteger = 4 then
          CdsBuscaLancxInf.Data := BuscaLancxInforme(psAnoBusca,
                                                     sMes,
                                                     cdsLancamentos.FieldByName('IDBENEFIRRF').AsInteger,
                                                     iInformeIdosoINSS,
                                                     0,
                                                     cdslancamentos.FieldByName('FONTEPAGADORA').AsInteger,
                                                     False,
                                                     pCompensaAnoTodo);
//Marcio Sanches Spinosa SOL 247088 PPM 645299. - Inicio
//        else
//          CdsBuscaLancxInf.Data := BuscaLancxInforme(psAnoBusca,
//                                                     sMes,
//                                                     cdsLancamentos.FieldByName('IDBENEFIRRF').AsInteger,
//                                                     iInformeIdosoFuncef,
//                                                     0,
//                                                     cdslancamentos.FieldByName('FONTEPAGADORA').AsInteger,
//                                                     False,
//                                                     pCompensaAnoTodo);
//Marcio Sanches Spinosa SOL 247088 PPM 645299. - Fim
      end;
    end;

    while (not CdsBuscaLancxInf.Eof) And (rValor > 0) Do
    begin
      sDataPagto := '';
      if CdsBuscaLancxInf.FieldByName('DATAPAGAMENTO').AsString <> sDataPagto then
      begin
        tbmSomaRend := CdsBuscaLancxInf.GetBookmark;
        rTotRend    := 0;
        sDataPagto  := CdsBuscaLancxInf.FieldByName('DATAPAGAMENTO').AsString;
        while (not CdsBuscaLancxInf.Eof) and (sDataPagto = CdsBuscaLancxInf.FieldByName('DATAPAGAMENTO').AsString) do
        begin
          rTotRend := rTotRend + CdsBuscaLancxInf.FieldByName('VALOR').AsFloat;
          CdsBuscaLancxInf.Next;
        end;
        CdsBuscaLancxInf.GotoBookmark(tbmSomaRend);
      end;


      bIdoso   := VerificaIdoso(rValorIdoso,
                                CdsLancamentos.FieldByName('DATANASC').AsDateTime,
                                CdsLancamentos.FieldByName('DATAPAGAMENTO').AsDateTime);
      bTemAcao := VerificaExistenciaAcaoJudicial(CdsLancamentos.FieldByName('IDBENEFIRRF').AsInteger,
                                                 StrToDate('01/01/'+Copy(DateToStr(CdsLancamentos.FieldByName('DATANASC').AsDateTime), 7, 4)),
                                                 CdsBuscaLancxInf.FieldByName('DATAPAGAMENTO').AsDateTime,
                                                 rPercAcao);
      // AQUI COMEÇA O CALCULO DE COMPENSAÇÃO - BARUC 166319 - 1448130
      // By Baruc 18/12/2012

      if (rValor >= rTotRend) and  (rValor > 0) then
        begin
          ZeraValores(piCodigoIRRF,
                      rValor,
                      rValorComp,
                      rValorIdoso,
                      sDataPagto,
                      piIdInfRendCompNeg,
                      piIdInfRendAcJud,
                      piIdInfIdosoFund,
                      piIdInfIdosoINSS,
                      piIdInfRendComp13S);
          rDif := rValor;

          if (idInforme = 49) and (rDif > 0) then
            begin
              if bVerificaAjusteIdoso(idbenefirrf, sDataPagto) then
                begin
                  if rDif >= rValorIdoso then
                    begin
                      AjustaIdoso(rValorIdoso, idInforme, piIdInfRendComp13S, rValorIdoso);//Marcio Sanches Spinosa SOL 217767 KINTANA 2049332
                      InsereLinha(piIdInfIdosoFund, rValorIdoso, 1, False, True);//Marcio Sanches Spinosa SOL 217767 KINTANA 2049332
                      rDif := rValor - rValorIdoso;
                    end
                  else
                    begin
                      InsereLinha(piIdInfIdosoFund, rDif, 1);
                      rDif := 0;
                    end;
                end
              else
                begin
                  InsereLinha(idInforme, rDif, 1);
                end;
            end
          //Marcio Sanches Spinosa SOL 247088 PPM 645299. - Inicio
          else if ((idInforme = 62) and (rDif > 0) and (CdsBuscaLancxInf.Eof)) then
          begin
              if bVerificaAjusteIdoso(idbenefirrf, sDataPagto) then
              begin
                if rDif >= rValorIdoso then
                  begin
                    AjustaIdoso(rValorIdoso, idInforme, piIdInfRendComp13S, rValorIdoso);//Marcio Sanches Spinosa SOL 217767 KINTANA 2049332
                    InsereLinha(piIdInfRendComp13S, rValorIdoso, 1, False, False);//Marcio Sanches Spinosa SOL 217767 KINTANA 2049332
                    rDif := rValor - rValorIdoso;
                  end
                else
                  begin
                    InsereLinha(piIdInfIdosoFund, rDif, 1);
                    rDif := 0;
                  end;
              end
              else
              begin
                InsereLinha(piIdInfRendComp13S, rDif, 1);
              end;
          end
          else if (CdsBuscaLancxInf.eof) then
//          Marcio Sanches Spinosa SOL 247088 PPM 645299. - Fim
            begin
              if (bVerificaAjusteIdoso(idbenefirrf, sDataPagto)) and (rDif > 0) then
                begin
                  if rDif >= rValorIdoso then
                    begin
                      AjustaIdoso(rValorIdoso, piIdInfIdosoFund, piIdInfIdosoINSS, rValorIdoso);//Marcio Sanches Spinosa SOL 217767 KINTANA 2049332
                      InsereLinha(piIdInfIdosoInss, rValorIdoso, 2, False, true);//Marcio Sanches Spinosa SOL 217767 KINTANA 2049332
                      rDif := rValor - rValorIdoso;
                    end
                  else
                    InsereLinha(piIdInfIdosoInss, rDif, 2);
                end
              else
                begin
                  InsereLinha(idInforme, rDif, 2);

                end;
            end;
        end
      else
        begin
          CompensaValor(piCodigoIRRF,
                        rValor,
                        rValorComp,
                        rDif,
                        rPercAcao,
                        rValorIdoso,
                        bIdoso,
                        sDataPagto,
                        piIdInfRendCompNeg,
                        piIdInfRendAcJud,
                        piIdInfIdosoFund,
                        piIdInfIdosoINSS);

        end;

      while (not CdsBuscaLancxInf.Eof) and (sDataPagto = CdsBuscaLancxInf.FieldByName('DATAPAGAMENTO').AsString) do
        begin
          CdsBuscaLancxInf.Next;
        end;


        if rValor <> 0 then
          begin
            rValor  := rDif;
          end;

    end;
    Inc(iContFontePag);
  Until (rValor = 0) or (iContFontePag > 4);

end;




procedure TCtrlGeraAcerto.AcertaValorRend(Const piCodigoIrrf          : Integer;
                                          const psAnoBusca            : string;
                                          const pbCompOutraFonte      : boolean;
                                          const piIdInfRendCompNeg    : integer;
                                          const piIdInfRendCompNeg13S : integer;
                                          const piIdInfRendAcJud      : integer;
                                          const piIdInfIdosoFund      : integer;
                                          const piIdInfIdosoINSS      : integer;
                                          const pCompensaAnoTodo      : Boolean;
                                          const idInforme             : integer;
                                          const idbenefirrf           : integer);
Var
  sDataPagto    : String;
  iContFontePag : integer; {Tratar a abertura da query para qual fonte pagadora (1 - Funcef; 2 - INSS)}

  rPercAcao,
  rValorIdoso,
  rDif,
  rTotRend,
  rValor,
  rValorComp  : Double;

  bIdoso,
  bTemAcao    : Boolean;

  tbmSomaRend : tbookmark;
  sInformeFUNCEF, sInformeINSS, sInformeIdosoFuncef, sInformeIdosoINSS  : String;
  iInformeFUNCEF, iInformeINSS, iInformeIdosoFuncef, iInformeIdosoINSS  : integer;
  iIdRendCompNeg : Integer;
  sMes : String;
  flgIsento : Boolean; ///Marcio Sanches Spinosa SOL 215621 KINTANA 2044679
begin
  rDif := 0;
  rValorIdoso := 0;
  AjustaInformes(piCodigoIRRF,
                 sInformeFUNCEF,
                 sInformeINSS,
                 sInformeIdosoFuncef,
                 sInformeIdosoInss,
                 iInformeFUNCEF,
                 iInformeINSS,
                 iInformeIdosoFuncef,
                 iInformeIdosoINSS);

  If piCodigoIRRF in [ 2, 3,  21 ] then
    iIdRendCompNeg := piIdInfRendCompNeg
  else if (piCodigoIRRF in [20]) then
    iIdRendCompNeg := 48
  else
    iIdRendCompNeg := piIdInfRendCompNeg13s;
  // Baruc - para pegar todos os valore da mesma idinforme SOL 166319 - KTN 1448130
  rValor := fSomaValoresPorInforme(cdslancamentos.data, idInforme, CdsLancamentos.FieldByName('NUMDOCUMENTO').AsString) * -1;
  //rValor        :=  cdslancamentos.FieldByName('VALOR').AsFloat * -1;
  rValorComp    := 0;
  rTotRend      := 0;
  iContFontePag := cdslancamentos.FieldByName('FONTEPAGADORA').AsInteger;
//sMes          := cdsLancamentos.FieldByName('ORD').AsString;
  sMes          := cdsLancamentos.FieldByName('ORD').AsString;


  iCodInformeAtc := cdslancamentos.FieldByName('IDINFORME').AsInteger;
  sNroDocAtc     := cdsLancamentos.FieldByName('NUMDOCUMENTO').AsString;
  sFlgBuscaAtc   := cdsLancamentos.FieldByName('FLGBUSCA').AsString;

  //Marcio Sanches Spinosa SOL 215621 KINTANA 2044679 - Inicio
  flgIsento      := VerificaIsencao(CdsLancamentos.FieldByName('IDHSTFOLHABENEF').AsInteger,
                                    CdsLancamentos.FieldByName('IDBENEFIRRF').AsInteger);
  //Marcio Sanches Spinosa SOL 215621 KINTANA 2044679 - Fim

  // SOL 166319 - KTN 1448130
  // Bem se existir mais de uma fonte, deve compensar um por vez, com a seguinte regra.
  //  se o idInforme = 49 e tiver saldo, zere do idInforme = 45
  //  se o idInforme = 52 e tiver saldo, zere do idInforme = 53
  //  somente estes acima, os demais, faça a operação, se não zerar, assim deve ficar.
  repeat

    // Edilaine - SOL 202259 / KTN 2042903
    if not CdsBuscaLancxInf.IsEmpty then
       CdsBuscaLancxInf.EmptyDataSet;
    // Edilaine - SOL 202259 / KTN 2042903 - fim

    if (iContFontePag = 1) then
    begin

      if cdslancamentos.FieldByName('FONTEPAGADORA').AsInteger = 1 then
        begin
           //primeiro passo = idinforme 49
              CdsBuscaLancxInf.Data := BuscaLancxInforme(psAnoBusca,
                                                         sMes,
                                                         cdsLancamentos.FieldByName('IDBENEFIRRF').AsInteger,
                                                         iInformeFUNCEF,
//                                                         iInformeIdosoFuncef,
                                                         0,
                                                         cdslancamentos.FieldByName('FONTEPAGADORA').AsInteger,
                                                   //      False,
                                                         flgIsento,//Marcio Sanches Spinosa SOL 215621 KINTANA 2044679
                                                         pCompensaAnoTodo);

          //segundo passo = idinforme 168
          if CdsBuscaLancxInf.RecordCount = 0  then
            //Marcio Sanches Spinosa SOL 243371 PPM 602967 - Inicio
            CdsBuscaLancxInf.Data := BuscaLancxInforme(psAnoBusca,
                                           sMes,
                                           cdsLancamentos.FieldByName('IDBENEFIRRF').AsInteger,
                                           piIdInfRendAcJud,
                                           0,
                                           cdslancamentos.FieldByName('FONTEPAGADORA').AsInteger,
//                                                   False,
                                           flgIsento,//Marcio Sanches Spinosa SOL 215621 KINTANA 2044679
                                           pCompensaAnoTodo);
           //Marcio Sanches Spinosa SOL 243371 PPM 602967 - Fim

          //terceiro passo = idinforme 52
          if CdsBuscaLancxInf.RecordCount = 0  then
            CdsBuscaLancxInf.Data := BuscaLancxInforme(psAnoBusca,
                                                     sMes,
                                                     cdsLancamentos.FieldByName('IDBENEFIRRF').AsInteger,
                                                     iInformeIdosoFuncef,
//                                                     piIdInfRendCompNeg,
                                                     0,
                                                     cdslancamentos.FieldByName('FONTEPAGADORA').AsInteger,
  //                                                   False,
                                                     flgIsento,//Marcio Sanches Spinosa SOL 215621 KINTANA 2044679
                                                     pCompensaAnoTodo);

          //quarto passo = idinforme 54
          if CdsBuscaLancxInf.RecordCount = 0  then
            begin
              CdsBuscaLancxInf.Data := BuscaLancxInforme(psAnoBusca,
                                                         sMes,
                                                         cdsLancamentos.FieldByName('IDBENEFIRRF').AsInteger,
                                                         piIdInfRendCompNeg,
                                                         0,
                                                         cdslancamentos.FieldByName('FONTEPAGADORA').AsInteger,
                                                   //      False,
                                                         flgIsento,//Marcio Sanches Spinosa SOL 215621 KINTANA 2044679
                                                         pCompensaAnoTodo);

            end;

        end
    end
    else if (iContFontePag = 2) then
    begin
      if (pbCompOutraFonte) then
      begin
        if cdslancamentos.FieldByName('FONTEPAGADORA').AsInteger = 2 then
        begin  //Marcio Sanches Spinosa SOL 243371 PPM 602967 - Inicio
          CdsBuscaLancxInf.Data := BuscaLancxInforme(psAnoBusca,
                                                     sMes,
                                                     cdsLancamentos.FieldByName('IDBENEFIRRF').AsInteger,
                                                     iInformeINSS,    //iInformeIdosoINSS
                                                     iInformeIdosoINSS,  //Baruc 23/01/2013 15:40
                                                     cdslancamentos.FieldByName('FONTEPAGADORA').AsInteger,
//                                                     False,
                                                     flgIsento,//Marcio Sanches Spinosa SOL 215621 KINTANA 2044679
                                                     pCompensaAnoTodo);
          if CdsBuscaLancxInf.RecordCount = 0  then
            begin
            CdsBuscaLancxInf.Data := BuscaLancxInforme(psAnoBusca,
                                                     sMes,
                                                     cdsLancamentos.FieldByName('IDBENEFIRRF').AsInteger,
                                                     iInformeIdosoINSS,  //Baruc 23/01/2013 15:40
                                                     iInformeINSS,
                                                     cdslancamentos.FieldByName('FONTEPAGADORA').AsInteger,
//                                                     False,
                                                     flgIsento,//Marcio Sanches Spinosa SOL 215621 KINTANA 2044679
                                                     pCompensaAnoTodo);

            end;
        end; //Marcio Sanches Spinosa SOL 243371 PPM 602967 - Inicio
      end;
    end
    else If (iContFontePag = 3) then
    begin
      if (pbCompOutraFonte) then
      begin
        if cdslancamentos.FieldByName('FONTEPAGADORA').AsInteger = 3 then
          CdsBuscaLancxInf.Data := BuscaLancxInforme(psAnoBusca,
                                                     sMes,
                                                     cdsLancamentos.FieldByName('IDBENEFIRRF').AsInteger,
                                                     iInformeINSS,
                                                     0,
                                                     cdslancamentos.FieldByName('FONTEPAGADORA').AsInteger,
//                                                     False,
                                                     flgIsento,//Marcio Sanches Spinosa SOL 215621 KINTANA 2044679
                                                     pCompensaAnoTodo)
        else
          CdsBuscaLancxInf.Data := BuscaLancxInforme(psAnoBusca,
                                                     sMes,
                                                     cdsLancamentos.FieldByName('IDBENEFIRRF').AsInteger,
                                                     iInformeFUNCEF,
//                                                     piIdInfRendCompNeg,
                                                     iInformeIdosoFuncef,
                                                     cdslancamentos.FieldByName('FONTEPAGADORA').AsInteger,
//                                                     False,
                                                     flgIsento,//Marcio Sanches Spinosa SOL 215621 KINTANA 2044679
                                                     pCompensaAnoTodo);
      end;
    end
    else if (iContFontePag = 4) then
    begin
      if (pbCompOutraFonte) then
      begin
        if cdslancamentos.FieldByName('FONTEPAGADORA').AsInteger = 4 then
          CdsBuscaLancxInf.Data := BuscaLancxInforme(psAnoBusca,
                                                     sMes,
                                                     cdsLancamentos.FieldByName('IDBENEFIRRF').AsInteger,
                                                     iInformeIdosoINSS,
                                                     0,
                                                     cdslancamentos.FieldByName('FONTEPAGADORA').AsInteger,
//                                                     False,
                                                     flgIsento,//Marcio Sanches Spinosa SOL 215621 KINTANA 2044679
                                                     pCompensaAnoTodo)
        else
          CdsBuscaLancxInf.Data := BuscaLancxInforme(psAnoBusca,
                                                     sMes,
                                                     cdsLancamentos.FieldByName('IDBENEFIRRF').AsInteger,
                                                     iInformeIdosoINSS, //iInformeIdosoFuncef, Baruc
                                                     0,
                                                     cdslancamentos.FieldByName('FONTEPAGADORA').AsInteger,
//                                                     False,
                                                     flgIsento,//Marcio Sanches Spinosa SOL 215621 KINTANA 2044679
                                                     pCompensaAnoTodo);
      end;
    end;

    while (not CdsBuscaLancxInf.Eof) And (rValor > 0) Do
    begin
      sDataPagto := '';
      if CdsBuscaLancxInf.FieldByName('DATAPAGAMENTO').AsString <> sDataPagto then
      begin
        tbmSomaRend := CdsBuscaLancxInf.GetBookmark;
        rTotRend    := 0;
        sDataPagto  := CdsBuscaLancxInf.FieldByName('DATAPAGAMENTO').AsString;
        while (not CdsBuscaLancxInf.Eof) and (sDataPagto = CdsBuscaLancxInf.FieldByName('DATAPAGAMENTO').AsString) do
        begin
          rTotRend := rTotRend + CdsBuscaLancxInf.FieldByName('VALOR').AsFloat;
          CdsBuscaLancxInf.Next;
        end;
        CdsBuscaLancxInf.GotoBookmark(tbmSomaRend);
      end;


      bIdoso   := VerificaIdoso(rValorIdoso,
                                CdsLancamentos.FieldByName('DATANASC').AsDateTime,
                                CdsLancamentos.FieldByName('DATAPAGAMENTO').AsDateTime);
      bTemAcao := VerificaExistenciaAcaoJudicial(CdsLancamentos.FieldByName('IDBENEFIRRF').AsInteger,
                                                 StrToDate('01/01/'+Copy(DateToStr(CdsLancamentos.FieldByName('DATANASC').AsDateTime), 7, 4)),
                                                 CdsBuscaLancxInf.FieldByName('DATAPAGAMENTO').AsDateTime,
                                                 rPercAcao);
      // AQUI COMEÇA O CALCULO DE COMPENSAÇÃO - BARUC 166319 - 1448130
      // By Baruc 18/12/2012

      if (rValor >= rTotRend) and  (rValor > 0) then
        begin
          ZeraValores(piCodigoIRRF,
                      rValor,
                      rValorComp,
                      rValorIdoso,
                      sDataPagto,
                      piIdInfRendCompNeg,
                      piIdInfRendAcJud,
                      piIdInfIdosoFund,
                      piIdInfIdosoINSS,
                      -1);

          rDif := rValor;
//         Marcio Sanches Spinosa SOL 247088 PPM 645299. - Inicio
         if not (CdsBuscaLancxInf.Eof)
         and (CdsBuscaLancxInf.FieldByName('IDINFORME').AsString = '52')
         and (rDif <= rValorIdoso) then
          begin
             CdsBuscaLancxInf.Next;
          end;
//         Marcio Sanches Spinosa SOL 247088 PPM 645299. - Fim

          if (idInforme = 49) and (rDif > 0) then
            begin
              if bVerificaAjusteIdoso(idbenefirrf, sDataPagto) then
                begin
                  if rDif >= rValorIdoso then
                    begin
                      AjustaIdoso(rValorIdoso, piIdInfIdosoFund, piIdInfIdosoINSS, rValorIdoso);//Marcio Sanches Spinosa SOL 217767 KINTANA 2049332
                      InsereLinha(piIdInfIdosoFund, rValorIdoso, 1, False, True);//Marcio Sanches Spinosa SOL 217767 KINTANA 2049332
                      rDif := rValor - rValorIdoso;
                    end
                  else
                    begin
                      InsereLinha(piIdInfIdosoFund, rDif, 1);
                      rDif := 0;
                    end;
                end
              else
                begin
                 // InsereLinha(idInforme, rDif, 1);
                end;
            end
          else
            begin
              if (bVerificaAjusteIdoso(idbenefirrf, sDataPagto)) and (rDif > 0) then
                begin
                  //Marcio Sanches Spinosa SOL 243371 PPM 602967 - Inicio
//                  if rDif >= rValorIdoso then
//                    begin
//                      AjustaIdoso(rValorIdoso, piIdInfIdosoFund, piIdInfIdosoINSS, rValorIdoso);//Marcio Sanches Spinosa SOL 217767 KINTANA 2049332
//                      InsereLinha(piIdInfIdosoInss, rValorIdoso, 2, False, True);//Marcio Sanches Spinosa SOL 217767 KINTANA 2049332
//                      rDif := rValor - rValorIdoso;
//                    end
//                  else
//                    InsereLinha(piIdInfIdosoInss, rDif, 2);
                      //Marcio Sanches Spinosa SOL 243371 PPM 602967 - Fim
                end
              else
                begin
                  //InsereLinha(idInforme, rDif, 2);

                end;
            end;
        end
      else
        begin
          CompensaValor(piCodigoIRRF,
                        rValor,
                        rValorComp,
                        rDif,
                        rPercAcao,
                        rValorIdoso,
                        bIdoso,
                        sDataPagto,
                        piIdInfRendCompNeg,
                        piIdInfRendAcJud,
                        piIdInfIdosoFund,
                        piIdInfIdosoINSS);

           rValor := 0; //Marcio Sanches Spinosa SOL 243371 PPM 602967 - Inicio


        end;

      while (not CdsBuscaLancxInf.Eof) and (sDataPagto = CdsBuscaLancxInf.FieldByName('DATAPAGAMENTO').AsString) do
        begin
          CdsBuscaLancxInf.Next;
        end;


        if rValor <> 0 then
          begin
            rValor  := rDif;
          end;

    end;
    Inc(iContFontePag);
  Until (rValor = 0) or (iContFontePag > 4);

end;

procedure TCtrlGeraAcerto.TrataIsento(const psAnoBusca           : string;
                                      const piIdInfRendNegIsento : integer;
                                      const pbCompOutraFonte     : boolean;
                                      Const pCompensaAnoTodo     : Boolean);
var
  rValor,
  rValorComp    : double;

  iContFontePag : integer;
  sMes          : String;
  iIdInforme    : Integer; 
begin
  rValor        := Cdslancamentos.FieldByName('VALOR').AsFloat * -1;
  rValorComp    := 0;
  iContFontePag := 1;

  repeat
    sMes := cdsLancamentos.FieldByName('ORD').AsString;

    if cdsLancamentos.FieldByName('IDINFORME').AsInteger in [54, 55] then
    begin
      if (iContFontePag = 1) then
      begin
        if cdslancamentos.FieldByName('FONTEPAGADORA').AsInteger = 1 then
          iIdInforme := 54
        else
          iIdInforme := 55;

        CdsBuscaLancxInf.Data := BuscaLancxInforme(psAnoBusca,
                                                   sMes,
                                                   cdsLancamentos.FieldByName('IDBENEFIRRF').AsInteger,
                                                   iIdInforme,
                                                   0,
                                                   cdslancamentos.FieldByName('FONTEPAGADORA').AsInteger,
                                                   True,
                                                   pCompensaAnoTodo)
      end
      else if (pbCompOutraFonte) then
      begin
        if cdslancamentos.FieldByName('FONTEPAGADORA').AsInteger = 1 then
          iIdInforme := 55
        else
          iIdInforme := 54;
        CdsBuscaLancxInf.Data := BuscaLancxInforme(psAnoBusca,
                                                   sMes,
                                                   cdsLancamentos.FieldByName('IDBENEFIRRF').AsInteger,
                                                   iIdInforme,
                                                   0,
                                                   cdslancamentos.FieldByName('FONTEPAGADORA').AsInteger,
                                                   True,
                                                   pCompensaAnoTodo)
      end;
    end
    else
    begin
//      if cdsLancamentos.FieldByName('FLGNATUREZA').AsString = 'N' then
        CdsBuscaLancxInf.Data := BuscaLancxInformeDeducoes(psAnoBusca,
                                                           cdsLancamentos.FieldByName('IDHSTFOLHABENEF').AsString,
                                                           cdsLancamentos.FieldByName('IDBENEFIRRF').AsInteger,
                                                           cdsLancamentos.FieldByName('CODDIRF').AsInteger,
                                                           cdsLancamentos.FieldByName('IDINFORME').AsInteger,
                                                           sMes,
                                                           pCompensaAnoTodo);
    end;

    while (not CdsBuscaLancxInf.Eof) And (rValor > 0) Do
    begin
      if CdsBuscaLancxInf.FieldByName('VALOR').AsFloat > rValor then
      begin
        InsereLinha(CdsBuscaLancxInf.FieldByName('IDINFORME').AsInteger,
                    rValor,
                    CdsBuscaLancxInf.FieldByName('FONTEPAGADORA').AsInteger);
        rValor := 0
      end
      else
      begin
        rValor := rValor - CdsBuscaLancxInf.FieldByName('VALOR').AsFloat;
        InsereLinha(CdsBuscaLancxInf.FieldByName('IDINFORME').AsInteger,
                    CdsBuscaLancxInf.FieldByName('VALOR').AsFloat,
                    CdsBuscaLancxInf.FieldByName('FONTEPAGADORA').AsInteger);
      end;
      CdsBuscaLancxInf.Next;
    end;
    Inc(iContFontePag);

    if (iContFontePag > 2) and (rValor > 0) and (cdsLancamentos.FieldByName('FLGNATUREZA').AsString = 'N') then
    begin
      InsereLinha(piIdInfRendNegIsento,
                  rValor,
                  cdsLancamentos.FieldByName('FONTEPAGADORA').AsInteger, True);
      rValor := 0;
    end;

  Until (rValor = 0) or (iContFontePag > 2);
end;

function TCtrlGeraAcerto.ListGeraAcerto(const sAnoBusca,sFiltroCPF: String): OleVariant;
var sSql : String;
begin
  sSql := 'SELECT T2.IDLANCIRRF,' + #13#10 +
          '       T2.NOME,' + #13#10 +
          '       T2.NUMDOCUMENTO,' + #13#10 +
          '       T2.CODDIRF,' + #13#10 +
          '       T2.IDBENEFIRRF,' + #13#10 +
          '       ''N'' AS FLGBUSCA,' + #13#10 +
          '       T2.DATAPAGAMENTO,' + #13#10 +
          '       T2.IDHSTFOLHABENEF,' + #13#10 +
          '       T2.FLGNATUREZA,' + #13#10 +
          '       T2.IDINFORME,' + #13#10 +
          '       T2.ORD,' + #13#10 +
          '       T2.CODNATUREZA,' + #13#10 +
          '       T2.MES,' + #13#10 +
          '       T2.RENDBRUTO AS VALOR,' + #13#10 +
          '       T2.DATANASC,' + #13#10 +
          '       t2.fontepagadora' + #13#10 +
          '  FROM (SELECT T.IDLANCIRRF,' + #13#10 +
          '               T.DATANASC,' + #13#10 +
          '               T.NOME,' + #13#10 +
          '               T.NUMDOCUMENTO,' + #13#10 +
          '               T.CODDIRF,' + #13#10 +
          '               T.IDBENEFIRRF,' + #13#10 +
          '               T.ORD,' + #13#10 +
          '               T.CODNATUREZA,' + #13#10 +
          '               T.MES,' + #13#10 +
          '               T.DATAPAGAMENTO,' + #13#10 +
          '               T.IDINFORME,' + #13#10 +
          '               T.FLGNATUREZA,' + #13#10 +
          '               T.IDHSTFOLHABENEF,' + #13#10 +
          '               t.fontepagadora,' + #13#10 +
          '               (T.JAN1 + T.FEV1 + T.MAR1 + T.ABR1 + T.MAI1 + T.JUN1 + T.JUL1 +' + #13#10 +
          '               T.AGO1 + T.SET1 + T.OUT1 + T.NOV1 + T.DEZ1) AS RENDBRUTO' + #13#10 +
          '          FROM (SELECT MIN(L.IDLANCIRRF) AS IDLANCIRRF,' + #13#10 +
          '                       L.IDHSTFOLHABENEF,' + #13#10 +
          '                       P.NOME,' + #13#10 +
          '                       P.NUMDOCUMENTO,' + #13#10 +
          '                       I.CODDIRF,' + #13#10 +
          '                       L.IDBENEFIRRF,' + #13#10 +
          '                       TO_CHAR(L.DATAPAGAMENTO, ''MM'') AS ORD,' + #13#10 +
          '                       TO_CHAR(L.DATAPAGAMENTO, ''MONTH'') AS MES,' + #13#10 +
          '                       PF.DATANASC,' + #13#10 +
          '                       I.FLGNATUREZA,' + #13#10 +
          '                       L.DATAPAGAMENTO,' + #13#10 +
          '                       li.fontepagadora,' + #13#10 +
          '                       LI.IDINFORME,' + #13#10 +
          '                       DECODE(L.CODNATUREZA, ''7416'', ''0561'', L.CODNATUREZA) AS CODNATUREZA,' + #13#10 +
          '                       SUM(DECODE(TO_CHAR(L.datapagamento, ''MM''), ''01'', ' + #13#10 +
          '                                          DECODE(I.CODDIRF,''2'' , DECODE(I.FLGNATUREZA,''N'',LI.VLRLANC * -1,LI.VLRLANC),' + #13#10 +
          '                                                                 LI.VLRLANC),0)) AS JAN1, ' + #13#10 +
          '                       SUM(DECODE(TO_CHAR(L.datapagamento, ''MM''), ''02'', ' + #13#10 +
          '                                          DECODE(I.CODDIRF,''2'' , DECODE(I.FLGNATUREZA,''N'',LI.VLRLANC * -1,LI.VLRLANC), ' + #13#10 +
          '                                                                 LI.VLRLANC),0)) AS FEV1, ' + #13#10 +
          '                       SUM(DECODE(TO_CHAR(L.datapagamento, ''MM''), ''03'', ' + #13#10 +
          '                                          DECODE(I.CODDIRF,''2'' , DECODE(I.FLGNATUREZA,''N'',LI.VLRLANC * -1,LI.VLRLANC), ' + #13#10 +
          '                                                                 LI.VLRLANC),0)) AS MAR1, ' + #13#10 +
          '                       SUM(DECODE(TO_CHAR(L.datapagamento, ''MM''), ''04'', ' + #13#10 +
          '                                          DECODE(I.CODDIRF,''2'' , DECODE(I.FLGNATUREZA,''N'',LI.VLRLANC * -1,LI.VLRLANC), ' + #13#10 +
          '                                                                 LI.VLRLANC),0)) AS ABR1, ' + #13#10 +
          '                       SUM(DECODE(TO_CHAR(L.datapagamento, ''MM''), ''05'', ' + #13#10 +
          '                                          DECODE(I.CODDIRF,''2'' , DECODE(I.FLGNATUREZA,''N'',LI.VLRLANC * -1,LI.VLRLANC), ' + #13#10 +
          '                                                                 LI.VLRLANC),0)) AS MAI1, ' + #13#10 +
          '                       SUM(DECODE(TO_CHAR(L.datapagamento, ''MM''), ''06'', ' + #13#10 +
          '                                          DECODE(I.CODDIRF,''2'' , DECODE(I.FLGNATUREZA,''N'',LI.VLRLANC * -1,LI.VLRLANC), ' + #13#10 +
          '                                                                 LI.VLRLANC),0)) AS JUN1, ' + #13#10 +
          '                       SUM(DECODE(TO_CHAR(L.datapagamento, ''MM''), ''07'', ' + #13#10 +
          '                                          DECODE(I.CODDIRF,''2'' , DECODE(I.FLGNATUREZA,''N'',LI.VLRLANC * -1,LI.VLRLANC), ' + #13#10 +
          '                                                                 LI.VLRLANC),0)) AS JUL1, ' + #13#10 +
          '                       SUM(DECODE(TO_CHAR(L.datapagamento, ''MM''), ''08'', ' + #13#10 +
          '                                          DECODE(I.CODDIRF,''2'' , DECODE(I.FLGNATUREZA,''N'',LI.VLRLANC * -1,LI.VLRLANC), ' + #13#10 +
          '                                                                 LI.VLRLANC),0)) AS AGO1, ' + #13#10 +
          '                       SUM(DECODE(TO_CHAR(L.datapagamento, ''MM''), ''09'', ' + #13#10 +
          '                                          DECODE(I.CODDIRF,''2'' , DECODE(I.FLGNATUREZA,''N'',LI.VLRLANC * -1,LI.VLRLANC), ' + #13#10 +
          '                                                                 LI.VLRLANC),0)) AS SET1, ' + #13#10 +
          '                       SUM(DECODE(TO_CHAR(L.datapagamento, ''MM''), ''10'', ' + #13#10 +
          '                                          DECODE(I.CODDIRF,''2'' , DECODE(I.FLGNATUREZA,''N'',LI.VLRLANC * -1,LI.VLRLANC), ' + #13#10 +
          '                                                                 LI.VLRLANC),0)) AS OUT1, ' + #13#10 +
          '                       SUM(DECODE(TO_CHAR(L.datapagamento, ''MM''), ''11'', ' + #13#10 +
          '                                          DECODE(I.CODDIRF,''2'' , DECODE(I.FLGNATUREZA,''N'',LI.VLRLANC * -1,LI.VLRLANC), ' + #13#10 +
          '                                                                 LI.VLRLANC),0)) AS NOV1, ' + #13#10 +
          '                       SUM(DECODE(TO_CHAR(L.datapagamento, ''MM''), ''12'', ' + #13#10 +
          '                                          DECODE(I.CODDIRF,''2'' , DECODE(I.FLGNATUREZA,''N'',LI.VLRLANC * -1,LI.VLRLANC), ' + #13#10 +
          '                                                                 LI.VLRLANC),0)) AS DEZ1 ' + #13#10 +

          {
          '                       SUM(DECODE(TO_CHAR(L.datapagamento, ''MM''),' + #13#10 +
          '                                  ''01'',' + #13#10 +
          '                                  DECODE(I.CODDIRF,' + #13#10 +
          '                                         ''1'',' + #13#10 +
          '                                         LI.VLRLANC,' + #13#10 +
          '                                         ''2'',' + #13#10 +
          '                                         DECODE(I.FLGNATUREZA,' + #13#10 +
          '                                                ''N'',' + #13#10 +
          '                                                LI.VLRLANC * -1,' + #13#10 +
          '                                                LI.VLRLANC),' + #13#10 +
          '                                         ''3'',' + #13#10 +
          '                                         LI.VLRLANC,' + #13#10 +
          '                                         ''5'',' + #13#10 +
          '                                         LI.VLRLANC,' + #13#10 +
          '                                         ''21'',' + #13#10 +
          '                                         LI.VLRLANC,' + #13#10 +
          '                                         ''25'',' + #13#10 +
          '                                         LI.VLRLANC,' + #13#10 +
          '                                         ''28'',' + #13#10 +
          '                                         LI.VLRLANC,' + #13#10 +
          '                                         ''32'',' + #13#10 +
          '                                         LI.VLRLANC),' + #13#10 +
          '                                  0)) AS JAN1,' + #13#10 +
          '                       SUM(DECODE(TO_CHAR(L.datapagamento, ''MM''),' + #13#10 +
          '                                  ''02'',' + #13#10 +
          '                                  DECODE(I.CODDIRF,' + #13#10 +
          '                                         ''1'',' + #13#10 +
          '                                         LI.VLRLANC,' + #13#10 +
          '                                         ''2'',' + #13#10 +
          '                                         DECODE(I.FLGNATUREZA,' + #13#10 +
          '                                                ''N'',' + #13#10 +
          '                                                LI.VLRLANC * -1,' + #13#10 +
          '                                                LI.VLRLANC),' + #13#10 +
          '                                         ''3'',' + #13#10 +
          '                                         LI.VLRLANC,' + #13#10 +
          '                                         ''5'',' + #13#10 +
          '                                         LI.VLRLANC,' + #13#10 +
          '                                         ''21'',' + #13#10 +
          '                                         LI.VLRLANC,' + #13#10 +
          '                                         ''25'',' + #13#10 +
          '                                         LI.VLRLANC,' + #13#10 +
          '                                         ''28'',' + #13#10 +
          '                                         LI.VLRLANC,' + #13#10 +
          '                                         ''32'',' + #13#10 +
          '                                         LI.VLRLANC),' + #13#10 +
          '                                  0)) AS FEV1,' + #13#10 +
          '                       SUM(DECODE(TO_CHAR(L.datapagamento, ''MM''),' + #13#10 +
          '                                  ''03'',' + #13#10 +
          '                                  DECODE(I.CODDIRF,' + #13#10 +
          '                                         ''1'',' + #13#10 +
          '                                         LI.VLRLANC,' + #13#10 +
          '                                         ''2'',' + #13#10 +
          '                                         DECODE(I.FLGNATUREZA,' + #13#10 +
          '                                                ''N'',' + #13#10 +
          '                                                LI.VLRLANC * -1,' + #13#10 +
          '                                                LI.VLRLANC),' + #13#10 +
          '                                         ''3'',' + #13#10 +
          '                                         LI.VLRLANC,' + #13#10 +
          '                                         ''5'',' + #13#10 +
          '                                         LI.VLRLANC,' + #13#10 +
          '                                         ''21'',' + #13#10 +
          '                                         LI.VLRLANC,' + #13#10 +
          '                                         ''25'',' + #13#10 +
          '                                         LI.VLRLANC,' + #13#10 +
          '                                         ''28'',' + #13#10 +
          '                                         LI.VLRLANC,' + #13#10 +
          '                                         ''32'',' + #13#10 +
          '                                         LI.VLRLANC),' + #13#10 +
          '                                  0)) AS MAR1,' + #13#10 +
          '                       SUM(DECODE(TO_CHAR(L.datapagamento, ''MM''),' + #13#10 +
          '                                  ''04'',' + #13#10 +
          '                                  DECODE(I.CODDIRF,' + #13#10 +
          '                                         ''1'',' + #13#10 +
          '                                         LI.VLRLANC,' + #13#10 +
          '                                         ''2'',' + #13#10 +
          '                                         DECODE(I.FLGNATUREZA,' + #13#10 +
          '                                                ''N'',' + #13#10 +
          '                                                LI.VLRLANC * -1,' + #13#10 +
          '                                                LI.VLRLANC),' + #13#10 +
          '                                         ''3'',' + #13#10 +
          '                                         LI.VLRLANC,' + #13#10 +
          '                                         ''5'',' + #13#10 +
          '                                         LI.VLRLANC,' + #13#10 +
          '                                         ''21'',' + #13#10 +
          '                                         LI.VLRLANC,' + #13#10 +
          '                                         ''25'',' + #13#10 +
          '                                         LI.VLRLANC,' + #13#10 +
          '                                         ''28'',' + #13#10 +
          '                                         LI.VLRLANC,' + #13#10 +
          '                                         ''32'',' + #13#10 +
          '                                         LI.VLRLANC),' + #13#10 +
          '                                  0)) AS ABR1,' + #13#10 +
          '                       SUM(DECODE(TO_CHAR(L.datapagamento, ''MM''),' + #13#10 +
          '                                  ''05'',' + #13#10 +
          '                                  DECODE(I.CODDIRF,' + #13#10 +
          '                                         ''1'',' + #13#10 +
          '                                         LI.VLRLANC,' + #13#10 +
          '                                         ''2'',' + #13#10 +
          '                                         DECODE(I.FLGNATUREZA,' + #13#10 +
          '                                                ''N'',' + #13#10 +
          '                                                LI.VLRLANC * -1,' + #13#10 +
          '                                                LI.VLRLANC),' + #13#10 +
          '                                         ''3'',' + #13#10 +
          '                                         LI.VLRLANC,' + #13#10 +
          '                                         ''5'',' + #13#10 +
          '                                         LI.VLRLANC,' + #13#10 +
          '                                         ''21'',' + #13#10 +
          '                                         LI.VLRLANC,' + #13#10 +
          '                                         ''25'',' + #13#10 +
          '                                         LI.VLRLANC,' + #13#10 +
          '                                         ''28'',' + #13#10 +
          '                                         LI.VLRLANC,' + #13#10 +
          '                                         ''32'',' + #13#10 +
          '                                         LI.VLRLANC),' + #13#10 +
          '                                  0)) AS MAI1,' + #13#10 +
          '                       SUM(DECODE(TO_CHAR(L.datapagamento, ''MM''),' + #13#10 +
          '                                  ''06'',' + #13#10 +
          '                                  DECODE(I.CODDIRF,' + #13#10 +
          '                                         ''1'',' + #13#10 +
          '                                         LI.VLRLANC,' + #13#10 +
          '                                         ''2'',' + #13#10 +
          '                                         DECODE(I.FLGNATUREZA,' + #13#10 +
          '                                                ''N'',' + #13#10 +
          '                                                LI.VLRLANC * -1,' + #13#10 +
          '                                                LI.VLRLANC),' + #13#10 +
          '                                         ''3'',' + #13#10 +
          '                                         LI.VLRLANC,' + #13#10 +
          '                                         ''5'',' + #13#10 +
          '                                         LI.VLRLANC,' + #13#10 +
          '                                         ''21'',' + #13#10 +
          '                                         LI.VLRLANC,' + #13#10 +
          '                                         ''25'',' + #13#10 +
          '                                         LI.VLRLANC,' + #13#10 +
          '                                         ''28'',' + #13#10 +
          '                                         LI.VLRLANC,' + #13#10 +
          '                                         ''32'',' + #13#10 +
          '                                         LI.VLRLANC),' + #13#10 +
          '                                  0)) AS JUN1,' + #13#10 +
          '                       SUM(DECODE(TO_CHAR(L.datapagamento, ''MM''),' + #13#10 +
          '                                  ''07'',' + #13#10 +
          '                                  DECODE(I.CODDIRF,' + #13#10 +
          '                                         ''1'',' + #13#10 +
          '                                         LI.VLRLANC,' + #13#10 +
          '                                         ''2'',' + #13#10 +
          '                                         DECODE(I.FLGNATUREZA,' + #13#10 +
          '                                                ''N'',' + #13#10 +
          '                                                LI.VLRLANC * -1,' + #13#10 +
          '                                                LI.VLRLANC),' + #13#10 +
          '                                         ''3'',' + #13#10 +
          '                                         LI.VLRLANC,' + #13#10 +
          '                                         ''5'',' + #13#10 +
          '                                         LI.VLRLANC,' + #13#10 +
          '                                         ''21'',' + #13#10 +
          '                                         LI.VLRLANC,' + #13#10 +
          '                                         ''25'',' + #13#10 +
          '                                         LI.VLRLANC,' + #13#10 +
          '                                         ''28'',' + #13#10 +
          '                                         LI.VLRLANC,' + #13#10 +
          '                                         ''32'',' + #13#10 +
          '                                         LI.VLRLANC),' + #13#10 +
          '                                  0)) AS JUL1,' + #13#10 +
          '                       SUM(DECODE(TO_CHAR(L.datapagamento, ''MM''),' + #13#10 +
          '                                  ''08'',' + #13#10 +
          '                                  DECODE(I.CODDIRF,' + #13#10 +
          '                                         ''1'',' + #13#10 +
          '                                         LI.VLRLANC,' + #13#10 +
          '                                         ''2'',' + #13#10 +
          '                                         DECODE(I.FLGNATUREZA,' + #13#10 +
          '                                                ''N'',' + #13#10 +
          '                                                LI.VLRLANC * -1,' + #13#10 +
          '                                                LI.VLRLANC),' + #13#10 +
          '                                         ''3'',' + #13#10 +
          '                                         LI.VLRLANC,' + #13#10 +
          '                                         ''5'',' + #13#10 +
          '                                         LI.VLRLANC,' + #13#10 +
          '                                         ''21'',' + #13#10 +
          '                                         LI.VLRLANC,' + #13#10 +
          '                                         ''25'',' + #13#10 +
          '                                         LI.VLRLANC,' + #13#10 +
          '                                         ''28'',' + #13#10 +
          '                                         LI.VLRLANC,' + #13#10 +
          '                                         ''32'',' + #13#10 +
          '                                         LI.VLRLANC),' + #13#10 +
          '                                  0)) AS AGO1,' + #13#10 +
          '                       SUM(DECODE(TO_CHAR(L.datapagamento, ''MM''),' + #13#10 +
          '                                  ''09'',' + #13#10 +
          '                                  DECODE(I.CODDIRF,' + #13#10 +
          '                                         ''1'',' + #13#10 +
          '                                         LI.VLRLANC,' + #13#10 +
          '                                         ''2'',' + #13#10 +
          '                                         DECODE(I.FLGNATUREZA,' + #13#10 +
          '                                                ''N'',' + #13#10 +
          '                                                LI.VLRLANC * -1,' + #13#10 +
          '                                                LI.VLRLANC),' + #13#10 +
          '                                         ''3'',' + #13#10 +
          '                                         LI.VLRLANC,' + #13#10 +
          '                                         ''5'',' + #13#10 +
          '                                         LI.VLRLANC,' + #13#10 +
          '                                         ''21'',' + #13#10 +
          '                                         LI.VLRLANC,' + #13#10 +
          '                                         ''25'',' + #13#10 +
          '                                         LI.VLRLANC,' + #13#10 +
          '                                         ''28'',' + #13#10 +
          '                                         LI.VLRLANC,' + #13#10 +
          '                                         ''32'',' + #13#10 +
          '                                         LI.VLRLANC),' + #13#10 +
          '                                  0)) AS SET1,' + #13#10 +
          '                       SUM(DECODE(TO_CHAR(L.datapagamento, ''MM''),' + #13#10 +
          '                                  ''10'',' + #13#10 +
          '                                  DECODE(I.CODDIRF,' + #13#10 +
          '                                         ''1'',' + #13#10 +
          '                                         LI.VLRLANC,' + #13#10 +
          '                                         ''2'',' + #13#10 +
          '                                         DECODE(I.FLGNATUREZA,' + #13#10 +
          '                                                ''N'',' + #13#10 +
          '                                                LI.VLRLANC * -1,' + #13#10 +
          '                                                LI.VLRLANC),' + #13#10 +
          '                                         ''3'',' + #13#10 +
          '                                         LI.VLRLANC,' + #13#10 +
          '                                         ''5'',' + #13#10 +
          '                                         LI.VLRLANC,' + #13#10 +
          '                                         ''21'',' + #13#10 +
          '                                         LI.VLRLANC,' + #13#10 +
          '                                         ''25'',' + #13#10 +
          '                                         LI.VLRLANC,' + #13#10 +
          '                                         ''28'',' + #13#10 +
          '                                         LI.VLRLANC,' + #13#10 +
          '                                         ''32'',' + #13#10 +
          '                                         LI.VLRLANC),' + #13#10 +
          '                                  0)) AS OUT1,' + #13#10 +
          '                       SUM(DECODE(TO_CHAR(L.datapagamento, ''MM''),' + #13#10 +
          '                                  ''11'',' + #13#10 +
          '                                  DECODE(I.CODDIRF,' + #13#10 +
          '                                         ''1'',' + #13#10 +
          '                                         LI.VLRLANC,' + #13#10 +
          '                                         ''2'',' + #13#10 +
          '                                         DECODE(I.FLGNATUREZA,' + #13#10 +
          '                                                ''N'',' + #13#10 +
          '                                                LI.VLRLANC * -1,' + #13#10 +
          '                                                LI.VLRLANC),' + #13#10 +
          '                                         ''3'',' + #13#10 +
          '                                         LI.VLRLANC,' + #13#10 +
          '                                         ''5'',' + #13#10 +
          '                                         LI.VLRLANC,' + #13#10 +
          '                                         ''21'',' + #13#10 +
          '                                         LI.VLRLANC,' + #13#10 +
          '                                         ''25'',' + #13#10 +
          '                                         LI.VLRLANC,' + #13#10 +
          '                                         ''28'',' + #13#10 +
          '                                         LI.VLRLANC,' + #13#10 +
          '                                         ''32'',' + #13#10 +
          '                                         LI.VLRLANC),' + #13#10 +
          '                                  0)) AS NOV1,' + #13#10 +
          '                       SUM(DECODE(TO_CHAR(L.datapagamento, ''MM''),' + #13#10 +
          '                                  ''12'',' + #13#10 +
          '                                  DECODE(I.CODDIRF,' + #13#10 +
          '                                         ''1'',' + #13#10 +
          '                                         LI.VLRLANC,' + #13#10 +
          '                                         ''2'',' + #13#10 +
          '                                         DECODE(I.FLGNATUREZA,' + #13#10 +
          '                                                ''N'',' + #13#10 +
          '                                                LI.VLRLANC * -1,' + #13#10 +
          '                                                LI.VLRLANC),' + #13#10 +
          '                                         ''3'',' + #13#10 +
          '                                         LI.VLRLANC,' + #13#10 +
          '                                         ''5'',' + #13#10 +
          '                                         LI.VLRLANC,' + #13#10 +
          '                                         ''21'',' + #13#10 +
          '                                         LI.VLRLANC,' + #13#10 +
          '                                         ''25'',' + #13#10 +
          '                                         LI.VLRLANC,' + #13#10 +
          '                                         ''28'',' + #13#10 +
          '                                         LI.VLRLANC,' + #13#10 +
          '                                         ''32'',' + #13#10 +
          '                                         LI.VLRLANC),' + #13#10 +
          '                                  0)) AS DEZ1' + #13#10 +
          }
          
          '                  FROM INFORME        I,' + #13#10 +
          '                       LANCXINFORME   LI,' + #13#10 +
          '                       LANCIRRF       L,' + #13#10 +
          '                       NATURENDIMENTO N,' + #13#10 +
          '                       PESSOA         P,' + #13#10 +
          '                       PESSOAFISICA   PF' + #13#10 +
          '                 WHERE (I.IDINFORME = LI.IDINFORME)' + #13#10 +
          '                   AND (LI.IDLANCIRRF = L.IDLANCIRRF)' + #13#10 +
          //                  INSERIDO PELO BARUC PARA AGRUPAMENTO DE VALORES DO MESMO IDINFORME INICIO
          '                   AND (LI.FLGAGRUPADO IS NULL)' + #13#10 +
          //                  INSERIDO PELO BARUC PARA AGRUPAMENTO DE VALORES DO MESMO IDINFORME FIM                    
          '                   AND (L.CODNATUREZA = N.CODNATUREZA)' + #13#10 +
          '                   AND LENGTH(I.CODINFORME) = 4' + #13#10 +
          '                   AND I.IDINFORME <> 164' + #13#10 +
          '                   AND I.IDINFORME IN (45, 46, 47, 48, 49, 50, 51, 52, 53, 62, 75, 123, 124, 168, 195) ' + #13#10 +   //Fernando Xavier/Edilaine Ferraresi/Marcio Spinosa SOL 226715 KINTANA 2061081//Marcio Sanches Spinosa SOL 217023 KINTANA 2046339/ //MARCIO SANCHES SPINOSA SOL 217747
          //Marcio Sanches Spinosa SOL 243371 PPM 602967 - Inicio
//          '                   AND  LI.VLRLANC < 0 ' + //MARCIO SANCHES SPINOSA SOL 217747
//Marcio Sanches Spinosa SOL 243371 PPM 602967 - Fim
          '                   AND LI.FLGTIPOREG <> ''D'' ' + //MARCIO SANCHES SPINOSA SOL 217747//Marcio Sanches Spinosa SOL 225788 KINTANA 2059231
          '                   AND P.IDPESSOA = L.IDBENEFIRRF' + #13#10 +
          '                   AND P.IDPESSOA = PF.IDPESSOA' + #13#10 +
          '                   AND (NVL(L.IDMODULORESPON, L.IDMODULO) = 18)' + #13#10 +
          '                   AND (L.datapagamento BETWEEN' + #13#10 +
          '                       TO_DATE('+QuotedStr('01/01/'+sAnoBusca)+', ''DD/MM/YYYY'') AND' + #13#10 +
          '                       TO_DATE('+QuotedStr('31/12/'+sAnoBusca)+', ''DD/MM/YYYY''))' + #13#10;
  If sFiltroCPF <> '' then
    sSql := sSql + '  AND P.NUMDOCUMENTO IN ('+sFiltroCPF+')' + #13#10;
  sSql := sSql +
          '                 GROUP BY L.IDHSTFOLHABENEF,' + #13#10 +
          '                          LI.IDINFORME,' + #13#10 +
          '                          li.fontepagadora,' + #13#10 +
          '                          L.DATAPAGAMENTO,' + #13#10 +
          '                          PF.DATANASC,' + #13#10 +
          '                          I.FLGNATUREZA,' + #13#10 +
          '                          P.NOME,' + #13#10 +
          '                          P.NUMDOCUMENTO,' + #13#10 +
          '                          DECODE(L.CODNATUREZA, ''7416'', ''0561'', L.CODNATUREZA),' + #13#10 +
          '                          I.CODDIRF,' + #13#10 +
          '                          L.IDBENEFIRRF,' + #13#10 +
          '                          TO_CHAR(L.DATAPAGAMENTO, ''MM''),' + #13#10 +
          '                          TO_CHAR(L.DATAPAGAMENTO, ''MONTH'')) T) T2' + #13#10 +
          ' WHERE (T2.RENDBRUTO < 0) ' + #13#10 +
             //Baruc - Sol 166319 - Kintana 1448130
          ' AND T2.IDINFORME IN (45, 46, 47, 48, 49, 50, 51, 52, 53, 62, 75, 123, 124, 168, 195) ' + #13#10 + //Fernando Xavier/Edilaine Ferraresi/Marcio Spinosa SOL 226715 KINTANA 2061081  //Marcio Sanches Spinosa SOL 217023 KINTANA 2046339

          // Edilaine - SOL 202259 / KTN 2042903
          //Marcio Sanches Spinosa SOL 217023 KINTANA 2046339 - Inicio
          ' AND NOT EXISTS ((SELECT 1 FROM LANCIRRFACERTO LX, lancxinforme li2 ' + #13#10 +
           '       WHERE LX.idlancirrfcomp = T2.IDLANCIRRF    '+ #13#10 +
            '      and lx.idlancirrfacerto  = li2.IDLANCIRRF   '+ #13#10 +
            '       and LX.idlancirrfcomp = T2.IDLANCIRRF  ' +  #13#10 +
            ' and t2.idinforme = li2.idinforme ' +  #13#10 +
          '                   AND (T2.datapagamento BETWEEN' + #13#10 +
          '                       TO_DATE('+QuotedStr('01/01/'+sAnoBusca)+', ''DD/MM/YYYY'') AND' + #13#10 +
          '                       TO_DATE('+QuotedStr('31/12/'+sAnoBusca)+', ''DD/MM/YYYY''))' + #13#10 +
          '      and li2.idinforme IN (45, 46, 47, 48, 49, 50, 51, 52, 53, 62, 75, 123, 124, 168, 195))'+ #13#10 +//Fernando Xavier/Edilaine Ferraresi/Marcio Spinosa SOL 226715 KINTANA 2061081
          '                 ) ' + #13#10 +
          //Marcio Sanches Spinosa SOL 217023 KINTANA 2046339 - Fim
          // Edilaine - SOL 202259 / KTN 2042903 - fim

          ' ORDER BY T2.NOME, T2.CODDIRF DESC, T2.ORD, T2.FONTEPAGADORA';

  with tStringlist.Create() do
  begin
    Text := sSql;
    SaveToFile('C:\Planus\temp\SqlCompensaValorNegativo.sql');
    clear;
    free;
  end;
  Result := GetDataPacket(Ssql);
end;

function TCtrlGeraAcerto.bVerificaAjusteIdoso(idbenefirrf : integer; sDataPagto : String) : boolean;
var
 sSql : String;
 qryAuxW  : Twwquery;
 strData : String;
 iIdInformeLoc : Integer;
begin
  iIdInformeLoc := 0;
  strData := Copy(sDataPagto, 4,2) + Copy(sDataPagto, 7,4);
  sSql := '';
  sSql := ' SELECT LX.IDINFORME ';
  sSql := sSql + ' FROM LANCXINFORME LX, LANCIRRF LR ';
  sSql := sSql + ' WHERE LX.IDINFORME IN (52, 53) AND';
  sSql := sSql + ' LX.IDLANCIRRF = LR.IDLANCIRRF AND ';
  sSql := sSql + ' LX.FLGTIPOREG = ''C'' AND ';
  sSql := sSql + ' LX.IDLANCIRRF IN (SELECT LR.IDLANCIRRF FROM LANCIRRF LR ';
  sSql := sSql + ' WHERE LR.IDBENEFIRRF = ' + IntToStr(idbenefirrf) ;
  sSql := sSql + ' AND TO_CHAR(LR.DATAPAGAMENTO, ''MMYYYY'') = ' + strData + ')';
  qryAuxW := Twwquery.Create(Nil);
  qryAuxW.DataBaseName := 'BaseDados';
  qryAuxW.Close;
  qryAuxW.SQL.Clear;
  qryAuxW.SQL.Add(sSql);
  qryAuxW.Open;
  if not qryAuxW.Eof Then
    begin
        iIdInformeLoc := qryAuxW.FieldByName('IDINFORME').AsInteger;
        if iIdInformeLoc > 0 then
          Result := true
        else
          Result := false;
    end
  else
    Result := false {true};   // Edilaine - SOL 202259 / KTN 2042903
  freeandnil(qryAuxW);
end;

function TCtrlGeraAcerto.fSomaValoresPorInforme(DataValores : OleVariant; idInformePesq : Integer; sNumDoc : string) : Real;
var
  cdsAux: TClientDataSet;
  iCodInformeLoc : Integer;
  fValorInforme, X : Real;
  sNroDoc, sFlgBusca : String;
begin
  iCodInformeLoc := 0;
  fValorInforme := 0;
  sNroDoc := '';
  sFlgBusca := '';

  cdsAux  := TClientDataSet.Create(nil);
  cdsAux.Data := DataValores;
  cdsAux.First;

  //Marcio Sanches Spinosa SOL 217767 KINTANA 2049332 - Inicio
  cdsAux.Filtered := False;
  cdsAux.Filter   := 'NUMDOCUMENTO = ' + sNumDoc;
  cdsAux.Filtered := True;
  //Marcio Sanches Spinosa SOL 217767 KINTANA 2049332 - Fim

  while not cdsAux.Eof do
    begin
      iCodInformeLoc := cdsAux.FieldByName('IDINFORME').AsInteger;
      sNroDoc        := cdsAux.FieldByName('NUMDOCUMENTO').AsString;
      if (idInformePesq = iCodInformeLoc)
      and (cdsAux.FieldByName('FLGBUSCA').AsString = 'S')
      and(sNumDoc = sNroDoc) then //Marcio Sanches Spinosa SOL 217767 KINTANA 2049332
        begin
          fValorInforme := fValorInforme + cdsAux.FieldByName('VALOR').AsFloat;
          bAgrupamentoPorIdInforme := true;
          {
          cdsAux.Edit;
          cdsAux.FieldByName('FLGBUSCA').AsString := 'N';
          cdsAux.Post;

          sFlgBusca := CdsLancamentos.FieldByName('FLGBUSCA').AsString;
          X := cdsAux.FieldByName('VALOR').AsFloat;
          CdsLancamentos.DisableControls;
          CdsLancamentos.Edit;
          CdsLancamentos.FieldByName('FLGBUSCA').AsString := 'N';
          sFlgBusca := CdsLancamentos.FieldByName('FLGBUSCA').AsString;
          CdsLancamentos.Post;
          CdsLancamentos.EnableControls;

          frmAcertaValorMT.cdsBuscaDados.DisableControls;
          frmAcertaValorMT.cdsBuscaDados.Edit;
          frmAcertaValorMT.cdsBuscaDados.FieldByName('FLGBUSCA').AsString := 'N';
          frmAcertaValorMT.cdsBuscaDados.Post;
          frmAcertaValorMT.cdsBuscaDados.EnableControls;
          Application.ProcessMessages;
          }
        end;
      cdsAux.Next;
    end;
  cdsAux.free;
  result := fValorInforme;


end;

function TCtrlGeraAcerto.bVerificaAcumuladorPorInforme(DataValores : OleVariant; idInformePesq, idLancIrrfPesq : Integer; sNroDocPesq, sFlgBuscaPesq: String) : boolean;
var
  cdsAux: TClientDataSet;
  iCodInformeLoc : Integer;
  sNroDocLoc, sFlgBuscaLoc : String;
  bPesqLoc : boolean;

begin
  bPesqLoc := true;
  iCodInformeLoc := 0;
  sFlgBuscaLoc   := '';
  sNroDocLoc     := '';



  if (iCodInformeAtc = idInformePesq) and
     (sFlgBuscaAtc   =  sFlgBuscaPesq) and
     (sNroDocAtc     = sNroDocPesq) and
     (bAgrupamentoPorIdInforme = true) then
    begin
      bPesqLoc := false;
      bAtualizaFlagAcumulador(idInformePesq, idLancIrrfPesq);
    end
  else
    begin
      iCodInformeLoc := iCodInformeAtc;
      sFlgBuscaLoc   := sFlgBuscaAtc;
      sNroDocLoc     := sNroDocAtc;
      bPesqLoc := true;
    end;


{
  cdsAux  := TClientDataSet.Create(nil);
  cdsAux.Data := DataValores;
  cdsAux.First;

  while not cdsAux.Eof do
    begin
      if cdsAux.FieldByName('FLGBUSCA').AsString = 'S'  then
        begin
      cdsAux.Next;
    end;
  cdsAux.free;
}
  result := bPesqLoc;
end;

function TCtrlGeraAcerto.bAtualizaFlagAcumulador(idInformePesq, idLancIrrfPesq : Integer) : boolean;
var
 sSql : String;
 qryAux  : Twwquery;
begin
  try

    sSql := '';
    sSql := sSql + '  UPDATE LANCXINFORME SET FLGAGRUPADO = 2 ' ;
    sSql := sSql + '  WHERE IDINFORME =' + IntToStr(idInformePesq);
    sSql := sSql + '  AND IDLANCIRRF =' + IntToStr(idLancIrrfPesq);
    qryAux := Twwquery.Create(Nil);
    qryAux.DataBaseName := 'BaseDados';
    qryAux.Close;
    qryAux.SQL.Clear;
    qryAux.SQL.Add(sSql);
    qryAux.ExecSQL;
    result := true;
    freeandnil(qryAux);
  except
    on E: Exception Do
      begin
        result := false;
        freeandnil(qryAux);
      end;
  end;
end;

function TCtrlGeraAcerto.fDiferencaAjusteIdoso(idbenefirrf : integer; sDataPagto : String) : real;
var
  sSql : String;
  qryAuxW  : Twwquery;
  strData : String;
  rVlrPesq : Real;
begin
  rVlrPesq := 0;
  strData := Copy(sDataPagto, 4,2) + Copy(sDataPagto, 7,4);
  sSql := '';
  sSql := ' SELECT LX.VLRLANC ';
  sSql := sSql + ' FROM LANCXINFORME LX, LANCIRRF LR ';
  sSql := sSql + ' WHERE LX.IDINFORME IN (52, 53) AND ';
  sSql := sSql + ' LX.IDLANCIRRF = LR.IDLANCIRRF AND ';
  sSql := sSql + ' LX.FLGTIPOREG = ''C'' AND ';
  sSql := sSql + ' LX.IDLANCIRRF IN (SELECT LR.IDLANCIRRF FROM LANCIRRF LR ';
  sSql := sSql + ' WHERE LR.IDBENEFIRRF = ' + IntToStr(idbenefirrf) ;
  sSql := sSql + ' AND TO_CHAR(LR.DATAPAGAMENTO, ''MMYYYY'') = ' + strData + ' )';
  qryAuxW := Twwquery.Create(Nil);
  qryAuxW.DataBaseName := 'BaseDados';
  qryAuxW.Close;
  qryAuxW.SQL.Clear;
  qryAuxW.SQL.Add(sSql);
  qryAuxW.Open;
  if not qryAuxW.Eof Then
    rVlrPesq := qryAuxW.FieldByName('VLRLANC').AsFloat;
  Result := rVlrPesq;
  freeandnil(qryAuxW);
end;

//Marcio Sanches Spinosa SOL 215621 KINTANA 2044679 - Inicio
function TCtrlGeraAcerto.VerificaIsencao(idhstfolhabenef,
  idpessoa: Integer): Boolean;
var cds : TClientDataSet;
begin

 with TClientDataSet.Create(nil) do
 try
   begin
    Data := GetDataPacket(' SELECT DISTINCT H.FLGISENTOIRRF ' +
                            ' FROM HISTRUBSAL H ' +
                            ' WHERE H.IDHSTFOLHABENEF = ' + IntToStr(idhstfolhabenef) +
                            ' AND H.IDPESSOA = ' + IntToStr(idpessoa));
    Result := FieldByName('FLGISENTOIRRF').AsInteger = 1;
   end;
 finally
   Free;
 end;
end;
// Marcio Sanches Spinosa SOL 215621 KINTANA 2044679 - Fim

end.


