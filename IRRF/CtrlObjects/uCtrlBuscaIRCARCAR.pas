unit uCtrlBuscaIRCARCAR;

// *************************************************************************************************
// ***************************** REGISTRO DE ALTERAÇÕES ********************************************
// *************************************************************************************************
// Autor(a)    : Claudio Faria
// Data        : 06/03/2007
// Rotina      : BuscaIRRF
// Pendência   : 24642
// Descricao   : Ajuste na query que estava errada
//------------------------------------------------------------------------------
// Autor(a)    : Bruno Bastos
// Data        : 11.12.2006
// Rotina      : BuscaIRRF
// Pendência   : Sem pendência
// Descricao   : Coloquei o campo DataLancto da LanctoDocum no If que trata data pagamento ou data lançamento
//------------------------------------------------------------------------------
// Autor(a)    : Paulo Ramos
// Data        : 08.02.2006
// Rotina      : BuscaIRRF
// Pendência   : 21496
// Descricao   : Não pegar registros da LANCTODOCUM estornados.
//------------------------------------------------------------------------------
{ Alterações
**********************************************************************
Analista.: Bruno Bastos
Data.....: 03/08/2005
Pendencia: 19855
Rotina...: BuscaIRRF
Descrição: Alteração para buscar alterador no documento de origem ou englobado.
**********************************************************************
Analista.: Bruno Bastos
Data.....: 11/05/2005
Pendencia: 19025
Rotina...: BuscaIRRF
Descrição: Tirei todas as referências a tabela TipoAlterador com alias TA da
           query e coloquei o campo codtiprecdes da tipoalterador 
**********************************************************************
Analista.: Marchetti
Pendencia: 18442
Rotina...: BuscaIRRF
Descrição: Acertada a query para contemplar documentos englobados
**********************************************************************
Analista.: Marchetti
Pendencia: 17067
Rotina...: BuscaIRRF
Descrição: Busca o número de dependentes da tabela DEPendPESSOA
**********************************************************************
}


interface

Uses sysutils, uCmControlObject, uCmDbObject, uSistema, DB, uDataBase, DbClient,
     uCtrlParamIntegra, uCtrLancIRRF, {$IFNDEF VERSAO0505} uCMTypes {$endIF};
  Type
    TCtrlBuscaIRCARCAR = Class(TCmControlObject)

    private
      cdsInforme : TclientDataSet;
      cdsDocumento : TClientDataSet;
      cdsParamIRRF : TclientDataSet;
      cdsAux : TclientDataSet;
      cdsBuscaLanc : TClientDataSet;
      cdsLancamento : TclientDataSet;
      cdsRateioPlanoPatro : TclientDataSet;
      cdsTipoDesemb : TclientDataSet;
      cdsAlterador : TclientDataSet;
      cdsAltxImp : TclientDataSet;
      cdsFatura : TclientDataSet;
      cdsVazio  : TclientDataSet;
      LancIRRF : TCtrLancIRRF;

    protected

      procedure DoChangeDataBase; override;
      procedure AfterInitialize; override;


    public

      constructor Create; override;
      destructor Destroy; override;

      function Arredonda(rValor       : Real;
                         iNumDecimais : Integer
                        ): Real;

      function BuscaIRRF(DataNatureza   : String;
                         DataInforme    : OleVariant;
                         DataParamIRRF  : OleVariant;
                         IDEmpresa      : LongInt;
                         RecPag         : String;
                         dDataIni       : TDateTime;
                         dDataFim       : TDateTime;
                         IdModulo       : Integer;
                         UsaPlanoPatro  : Boolean;
                         GeraSoEmpProp  : Boolean;
                         TipoNatureza   : Integer
                        ): Boolean;

      procedure Atualizaposicao (cTexto : String);
      procedure Linha;


    private

      function OraData(const dData : TDateTime) : String;


    end;



implementation
Uses
    FBuscaIRCARCARMT;

{ TCtrlBuscaIRCARCAR }

procedure TCtrlBuscaIRCARCAR.AfterInitialize;
begin
  inherited;
  LancIRRF.InitializeAs(self);
  LancIRRF.OpenTransaction := False;
end;



function TCtrlBuscaIRCARCAR.Arredonda(rValor       : Real;
                                      iNumDecimais : Integer
                                     ): Real;
var
  sMascara, sAuxValor : String;
begin
  if iNumDecimais < 0 then
    sMascara := '%17.0f'
  else
    sMascara := '%17.' + IntToStr(iNumDecimais) + 'f';

  sAuxValor := trim(Format(sMascara, [rValor]));

  while pos('.', sAuxValor) <> 0 do Delete(sAuxValor, pos('.', sAuxValor), 1);

  Result := StrToFloat(sAuxValor)
end;



function TCtrlBuscaIRCARCAR.BuscaIRRF(DataNatureza   : String;
                                      DataInforme    : OleVariant;
                                      DataParamIRRF  : OleVariant;
                                      IDEmpresa      : LongInt;
                                      RecPag         : String;
                                      dDataIni       : TDateTime;
                                      dDataFim       : TDateTime;
                                      IdModulo       : Integer;
                                      UsaPlanoPatro  : Boolean;
                                      GeraSoEmpProp  : Boolean;
                                      TipoNatureza   : Integer
                                     ): Boolean;
var
  iPlano, iBenef, iCodAltIRRF, iCodAltCom, iCodAltINSS, iCodDocumento : LongInt;
  rValBase, rValIRRF, rValINSS, iCodLanc                              : Double;
  sContaContabil, sCodNatureza, sDataLanc, sSQL                       : String;
  bPrim, bInsereImposto, bOperacao2                                   : Boolean;
  rValRatIRRF, rValRatBase, rValRatINSS, rTotIRRF, rTotBase, rTotINSS : Double;
  iProcessado                                                         : Integer;
  bProcessa                                                           : Boolean;
  sCodCentroRespon, sCodtiprecdes, sPlacontac                         : String;
begin
  if ConnectionSide = cnsClient then
  begin
    Result := Connection.AppServer.BuscaIRRF(DataNatureza,
                                             DataInforme,
                                             DataParamIRRF,
                                             IDEmpresa,
                                             RecPag,
                                             dDataIni,
                                             dDataFim,
                                             IdModulo,
                                             UsaPlanoPatro,
                                             GeraSoEmpProp
                                            );

    if not(Result) then MessageInfo := Connection.AppServer.MessageInfo;
  end
  else  // if ConnectionSide = cnsClient
  begin
    frmBuscaIRCARCARMT.ProgressBar1.Position  := 0;
    frmBuscaIRCARCARMT.ProgressBar1.Min       := 0;
    frmBuscaIRCARCARMT.ProgressBar1.Max       := 100;
    frmBuscaIRCARCARMT.ProgressBar1.Update;
    frmBuscaIRCARCARMT.lblcontagem.Caption    := '';
    frmBuscaIRCARCARMT.lblcontagem.Update;
    frmBuscaIRCARCARMT.Repaint;

    Result            := True;
    cdsInforme.Data   := DataInforme;
    cdsParamIRRF.Data := DataParamIRRF;
    sSQL              := 'SELECT * FROM DUAL WHERE (1 = 2)';
    cdsVazio.Data     := GetDataPacket(sSQL);

    Linha;
    frmBuscaIRCARCARMT.memResult.Lines.Add('BUSCA IRRF NO CONTAS A PAGAR');
    Linha;
    frmBuscaIRCARCARMT.memResult.Lines.Add('Início do Processamento: '+formatdatetime('dd/mm/yyyy hh:nn:ss', now));
    Linha;

    // ---------------------------------------------------------------------------------------------

    sSQL :=
    'SELECT '                                                                                       + #13 +
    '  D.NUMFATURA, D.IDPESSOA, D.IDFORCLI, '                                                       + #13 +
    '  L.CODALTERADOR, L.CODDOCUMENTO, L.VALOR, L.OPERACAO, '                         + #13 + 
    '  P.VLRDEPENDENTE, '                                                                           + #13 +
    '  NVL(FS.NUMDEP, 0) AS NUMDEPIRRF, '                                                           + #13 +
    '  NVL(T.CODNATUREZA, FO.CODNATUREZA) AS CODNATUREZA, '                                         + #13 +
    '  Y.FLGCALCULAIMPOSTO, Y.ATIVO, Y.DESCRICAO AS NOMEDESEMBOLSO, '                               + #13 +
    '  NVL(T.CODTIPRECDES, NVL(N.CODTIPRECDES, P.CODTIPRECDES)) AS CODTIPRECDES, '                  + #13;

    if cdsParamIRRF.FieldByName('FLGPAGLANC').AsString <> 'L' then sSQL := sSQL +
    '  H.DataLANCTO, '                                                                               + #13

    Else
      sSQL := sSQL +
    '  L.DataLANCTO, '                                                                               + #13;

    sSQL := sSQL +
    '  T.DESCRICAO, T.PLACONTA '                                                                    + #13 +

    'FROM '                                                                                         + #13 +
    '  DOCUMENTO        D,  '                                                                       + #13 +
    '  LANCTODOCUM      L,  '                                                                       + #13 +
    '  PESSOAFISICA     PF, '                                                                       + #13 +
    '  FORNSERV         FO, '                                                                       + #13 +
    '  DEPENDPESSOA     FS, '                                                                       + #13 +
    '  TIPOALTERADOR    T , '                                                                       + #13 +
    '  NATURENDIMENTO   N,  '                                                                       + #13 +
    '  PARAMIRRF        P,  '                                                                       + #13 +
    '  ALTXIMPOSTO      A,  '                                                                       + #13;

    if cdsParamIRRF.FieldByName('FLGPAGLANC').AsString <> 'L' then sSQL := sSQL +
    '  ( '                                                                                          + #13 +
    '  SELECT '                                                                                     + #13 +
    '    DATALANCTO, CODDOCUMENTO '                                                                 + #13 +
    '  FROM '                                                                                       + #13 +
    '    LANCTODOCUM '                                                                              + #13 +
    '  WHERE '                                                                                      + #13 +
    '        LTRIM(RTRIM(OPERACAO))   = ''5'' '                                                     + #13 +
    '    AND DATALANCTO               BETWEEN ' + OraData(dDataIni) + ' AND ' + OraData(dDataFim)   + #13 +

    '  UNION '                                                                                      + #13 +

    '  SELECT '                                                                                     + #13 +
    '    LE.DataLANCTO, L.CODDOCUMENTO '                                                            + #13 +
    '  FROM '                                                                                       + #13 +
    '    LANCTODOCUM L, '                                                                           + #13 +
    '    DOCUMENTO   D, '                                                                           + #13 +
    '    DOCUMENTO   E, '                                                                           + #13 +
    '    LANCTODOCUM LE '                                                                           + #13 +
    '  WHERE '                                                                                      + #13 +
    '        D.STATUS         = ''2'' '                                                             + #13 +
    '    AND L.OPERACAO       = ''1'' '                                                             + #13 +
    '    AND L.CODDOCUMENTO   = D.CODDOCUMENTO '                                                    + #13 +
    '    AND D.NUMFATURA      = E.NUMFATURA '                                                       + #13 +
    '    AND E.OPERACAO       = ''3'' '                                                             + #13 +
    '    AND LE.CODDOCUMENTO  = E.CODDOCUMENTO '                                                    + #13 +
    '    AND LE.DataLANCTO    BETWEEN ' + OraData(dDataIni) + ' AND ' + OraData(dDataFim)           + #13 +
    '    AND LE.OPERACAO      = ''5'' '                                                             + #13 +
    '    AND D.RECPAG         = ''P'' '                                                             + #13 +
    '  ) H, '                                                                                       + #13;

    sSQL := sSQL +
    '  TIPORECEBDESEMB  Y   '                                                                       + #13;

    // ---------------------------------------------------------------------------------------------

    // SELECT PRINCIPAL - INICIO
    if cdsParamIRRF.FieldByName('FLGPAGLANC').AsString = 'L' then
    begin

      // Busca o IR por DATA DE LANCAMENTO
      sSQL := sSQL +
      'WHERE '                                                                                      + #13 +
      '      D.RECPAG                 = ' + QuotedStr(RecPag)                                       + #13 +
      '  AND L.DataLANCTO             BETWEEN ' + OraData(dDataIni) + ' AND ' + OraData(dDataFim)   + #13;

      if GeraSoEmpProp then sSQL := sSQL +
      '  AND D.IDPESSOA               = ' + IntToStr(IDEmpresa)                                     + #13;

      sSQL := sSQL +
      '  AND L.CODALTERADOR           = A.CODALTERADOR '                                            + #13 +
      '  AND A.CODIMPOSTO             = 1 '                                                         + #13 +
      '  AND LTRIM(RTRIM(L.OPERACAO)) IN (''2'', ''3'', ''4'') '                                    + #13 +
      '  AND D.CODDOCUMENTO           = L.CODDOCUMENTO '                                            + #13 +
      '  AND L.ESTORNO                IS NULL '                                                     + #13 +
      '  AND T.CODNATUREZA            = N.CODNATUREZA(+) '                                          + #13 +
      '  AND PF.IDPESSOA(+)           = D.IDFORCLI '                                                + #13 +
      '  AND FO.IDPESSOA(+)           = D.IDFORCLI '                                                + #13 +
      '  AND FS.IDPESSOA              = D.IDFORCLI '                                                + #13 +

      '  AND FS.Data                  = (SELECT MAX(DATA) FROM DEPendPESSOA DP WHERE DP.IDPESSOA = D.IDFORCLI) ' + #13 +

      '  AND P.IDPESSOA               = ' + IntToStr(IDEmpresa)                                     + #13 +
      '  AND L.CODALTERADOR           = T.CODALTERADOR '                                            + #13 +
      '  AND Y.CODTIPRECDES           = NVL(T.CODTIPRECDES, NVL(N.CODTIPRECDES, P.CODTIPRECDES)) '  + #13 +

      '  AND NOT EXISTS (SELECT 1 FROM LANCIRRF L WHERE L.CODDOCUMENTO = D.CODDOCUMENTO) '          + #13 +

      '  AND NVL(Y.ATIVO, ''S'')       = ''S'' '                                                    + #13 +
      '  AND Y.RECPAG                  = ''P'' '                                                    + #13 +
      '  AND Y.IDPESSOA                = P.IDPESSOA '                                               + #13;

      if TipoNatureza = 1 then sSQL := sSQL +
      '  AND ( '                                                                                    + #13 +
      '      NVL(T.CODNATUREZA, FO.CODNATUREZA) = ' + DataNatureza + ' OR '                         + #13 +
      '      NVL(T.CODNATUREZA, FO.CODNATUREZA) IS NULL '                                           + #13 +
      '      ) '                                                                                    + #13;

      sSQL := sSQL +
      'ORDER BY '                                                                                   + #13 +
      '  L.CODDOCUMENTO, L.DataLANCTO DESC ';

    end
    else  // if cdsParamIRRF.FieldByName('FLGPAGLANC').AsString = 'L'
    begin

      // Busca o IR por DATA DE PAGAMENTO
      sSQL := sSQL +
      'WHERE '                                                                                      + #13 +
      '      D.RECPAG                 = ' + QuotedStr(RecPag)                                       + #13 +
      '  AND H.DataLANCTO             BETWEEN ' + OraData(dDataIni) + ' AND ' + OraData(dDataFim)   + #13 +
      '  AND LTRIM(RTRIM(L.OPERACAO)) = ''4'' '                                                     + #13 +
      '  AND D.STATUS                 = ''2'' '                                                     + #13 +
      '  AND L.ESTORNO                IS NULL '                                                     + #13 +
      '  AND D.CODDOCUMENTO           = L.CODDOCUMENTO '                                            + #13 +
      '  AND L.CODALTERADOR           = T.CODALTERADOR '                                            + #13;

      if TipoNatureza = 1 then sSQL := sSQL +
      '  AND ( '                                                                                    + #13 +
      '      NVL(T.CODNATUREZA, FO.CODNATUREZA) = ' + DataNatureza + ' OR '                         + #13 +
      '      NVL(T.CODNATUREZA, FO.CODNATUREZA) IS NULL '                                           + #13 +
      '      ) '                                                                                    + #13;

      sSQL := sSQL +
      '  AND T.CODNATUREZA            = N.CODNATUREZA(+) '                                          + #13 +
      '  AND L.CODALTERADOR           = A.CODALTERADOR '                                            + #13 +
      '  AND P.IDPESSOA               = ' + IntToStr(IDEmpresa)                                     + #13 +
      '  AND A.CODIMPOSTO             = 1 '                                                         + #13 +
      '  AND PF.IDPESSOA(+)           = D.IDFORCLI '                                                + #13 +
      '  AND FO.IDPESSOA(+)           = D.IDFORCLI '                                                + #13 +

      '  AND NOT EXISTS (SELECT 1 FROM LANCIRRF L WHERE L.CODDOCUMENTO = D.CODDOCUMENTO) '          + #13 +

      '  AND FS.IDPESSOA              =  D.IDFORCLI '                                               + #13 +
      '  AND FS.Data                  = (SELECT MAX(DATA) FROM DEPENDPESSOA WHERE IDPESSOA = D.IDFORCLI) ' + #13 +

      '  AND L.CODDOCUMENTO           = H.CODDOCUMENTO '                                            + #13 +
      '  AND Y.CODTIPRECDES           = NVL(T.CODTIPRECDES, NVL(N.CODTIPRECDES, P.CODTIPRECDES)) '  + #13 +

	    '  AND NVL(Y.ATIVO, ''S'')      = ''S'' '                                                     + #13 +
	    '  AND Y.RECPAG                 = ''P'' '                                                     + #13 +
	    '  AND Y.IDPESSOA               = P.IDPESSOA '                                                + #13 +

      'ORDER BY '                                                                                   + #13 +
      '  L.CODDOCUMENTO, H.DataLANCTO DESC ';

    end;

    // ---------------------------------------------------------------------------------------------

    AtualizaPosicao ('SELECIONANDO DADOS. AGUARDE.');

    cdsDocumento.Data := GetDataPacket(sSQL);

    if cdsDocumento.Recordcount > 0 then
    begin
      // -------------------------------------------------------------------------------------------
      // VERIFICANDO SE AS CONDICOES DE PROCESSAMENTO ESTÃO SATISFEITAS - INICIO
      AtualizaPosicao ('VERIFICANDO A CONSISTENCIA DOS DADOS. AGUARDE');

      bProcessa := True;

      cdsDocumento.First;
      while not(cdsDocumento.EOF) do
      begin
        // Checa se CODNATUREZA está preenchido
        if trim(cdsdocumento.FieldByName('CODNATUREZA').AsString) = '' then
        begin
          frmBuscaIRCARCARMT.memResult.Lines.Add('O alterador ' + cdsdocumento.FieldByName('DESCRICAO').AsString +
                                                 ' está sem a informação de Natureza de Rendimentos Preenchida.');
          bProcessa := False;
        end;

        // Checa se PLACONTA está preenchido.
        if trim(cdsdocumento.FieldByName('PLACONTA').AsString) = '' then
        begin
          frmBuscaIRCARCARMT.memResult.Lines.Add('A conta contábil do Alterador ' + cdsdocumento.FieldByName('NOMEDESEMBOLSO').AsString +
                                                 ' não foi parametrizada.');
          bProcessa := False;
        end;

        if trim(cdsdocumento.FieldByName('ATIVO').AsString) = '' then
        begin
          frmBuscaIRCARCARMT.memResult.Lines.Add('O tipo de desembolso ' + cdsdocumento.FieldByName('NOMEDESEMBOLSO').AsString +
                                                 ' não está Ativo.');
          bProcessa := False;
        end;

        cdsDocumento.Next
      end;  // while not(cdsDocumento.EOF)
      // VERIFICANDO SE AS CONDICOES DE PROCESSAMENTO ESTÃO SATISFEITAS - FIM
      // -------------------------------------------------------------------------------------------

      if bProcessa then
      begin
        AtualizaPosicao ('PROCESSANDO. AGUARDE');

        iCodAltIRRF := cdsParamIRRF.FieldByName('CODALTIRRFCAP').AsInteger;
        iCodAltCom  := 0;
        iCodAltINSS := cdsParamIRRF.FieldByName('CODALTINSS').AsInteger;

        frmBuscaIRCARCARMT.ProgressBar1.Position  := 0;
        frmBuscaIRCARCARMT.ProgressBar1.Max       := cdsDocumento.RecordCount;
        frmBuscaIRCARCARMT.Repaint;

        iProcessado := 0;

        cdsDocumento.First;
        while not(cdsDocumento.EOF) do
        begin
          sCodTipRecDes   := cdsDocumento.FieldByName('CODTIPRECDES').AsString;
          sPlacontac      := '';
          iCodDocumento   := cdsDocumento.FieldByName('CODDOCUMENTO').AsInteger;
          iBenef          := cdsDocumento.FieldByName('IDFORCLI').AsInteger;
          sCodNatureza    := cdsDocumento.FieldByName('CODNATUREZA').AsString;
          sDataLanc       := cdsDocumento.FieldByName('DATALANCTO').AsString;
          rValBase        := 0;
          rValIRRF        := 0;
          rValINSS        := 0;
          sContaContabil  := '';
          iPlano          := 0;

          // ---------------------------------------------------------------------------------------

          sSQL :=
          'SELECT P.TIPO FROM PESSOA P WHERE P.IDPESSOA = ' + IntToStr(iBenef);

          cdsAux.Data := GetDataPacket(sSQL);

          // ---------------------------------------------------------------------------------------

          sSQL :=
          'SELECT '                                                   + #13 +
          '  CODALTERADOR,CODDOCUMENTO,DATALANCTO,VALOR,OPERACAO '    + #13 +
          'FROM '                                                     + #13 +
          '  LANCTODOCUM '                                            + #13 +
          'WHERE '                                                    + #13 +
          '      OPERACAO       IN (''2'', ''4'') '                   + #13 +
          '  AND ESTORNO        IS NULL '                             + #13 +
          '  AND CODDOCUMENTO   = ' + FormatFloat('#0', cdsDocumento.FieldByName('CODDOCUMENTO').AsFloat);

          cdsLancamento.Data := GetDataPacket(sSQL);

          // ---------------------------------------------------------------------------------------

          sSQL :=
          'SELECT '                                                                                   + #13 +
          '  R.IDPATRO, R.IDPLANOPREV, R.IDPROGRAMA, R.CODCENTROCUSTO, R.CODCENTRORESPON, '           + #13 +
          '  DECODE(T.TOTAL, 0, 0, (SUM(R.VALOR) / T.TOTAL)) AS PERC '                                + #13 +
          'FROM '                                                                                     + #13 +
          '  RATEIODOCUM R, '                                                                         + #13 +
          '  ( '                                                                                      + #13 +
          '  SELECT '                                                                                 + #13 +
          '    SUM(VALOR) AS TOTAL '                                                                  + #13 +
          '  FROM '                                                                                   + #13 +
          '    RATEIODOCUM '                                                                          + #13 +
          '  WHERE '                                                                                  + #13 +
          '    CODDOCUMENTO = ' + FormatFloat('#0', cdsDocumento.FieldByName('CODDOCUMENTO').AsFloat) + #13 +
          '  ) T '                                                                                    + #13 +
          'WHERE '                                                                                    + #13 +
          '  R.CODDOCUMENTO = ' + FormatFloat('#0', cdsDocumento.FieldByName('CODDOCUMENTO').AsFloat) + #13 +
          'GROUP BY '                                                                                 + #13 +
          '  R.IDPATRO, R.IDPLANOPREV, R.IDPROGRAMA, R.CODCENTROCUSTO, R.CODCENTRORESPON, T.TOTAL ';

          cdsRateioPlanoPatro.Data := GetDataPacket(sSQL);

          // ---------------------------------------------------------------------------------------

          bOperacao2     := False;
          bInsereImposto := False;

          cdsLancamento.First;
          while not(cdsLancamento.EOF) do
          begin
            if (trim(cdsLancamento.FieldByName('OPERACAO').AsString) = '2') then
            begin
              bOperacao2      := True;
              bInsereImposto  := True;
              sCodTiprecdes   := cdsDocumento.FieldByName('CODTIPRECDES').AsString;
              sPlacontac      := cdsDocumento.FieldByName('PLACONTA').AsString;
            end;

            // TRATA VALOR do IRRF - INICIO
            // DIRETO PELO ALTERADOR CADASTRADO NOS PARAMETROS
            if (cdsLancamento.FieldByName('CODALTERADOR').AsInteger = iCodAltIRRF) then
            begin
              rValIRRF := rValIRRF + (cdsLancamento.FieldByName('VALOR').AsFloat);

              sSQL :=
              'SELECT PLACONTA, PLANO ' + #13 +
              'FROM   TIPOALTERADOR  '  + #13 +
              'WHERE  CODALTERADOR = '  + IntToStr(cdsLancamento.FieldByName('CODALTERADOR').AsInteger);

              cdsAlterador.Data := GetDataPacket(sSQL);

              sContaContabil := cdsAlterador.FieldByName('PLACONTA').AsString;
              iPlano         := cdsAlterador.FieldByName('PLANO').AsInteger;

              if iPlano = 0 then iPlano := ParamIntegra.Plano;
            end
            else  // if (cdsLancamento.FieldByName('CODALTERADOR').AsInteger = iCodAltIRRF)
            begin
              // PROCURA NO CADASTRO DE ALTERADORES X IMPOSTOS
              sSQL :=
              'SELECT CODALTERADOR '    + #13 +
              'FROM   ALTXIMPOSTO '     + #13 +
              'WHERE  CODALTERADOR = '  + IntToStr(cdsLancamento.FieldByName('CODALTERADOR').AsInteger) +
              '  AND  CODIMPOSTO   = 1 ';

              cdsAltxImp.Data := GetDataPacket(sSQL);

              if not(cdsAltxImp.IsEmpty) then
              begin
                rValIRRF := rValIRRF + (cdsLancamento.FieldByName('VALOR').AsFloat);

                sSQL :=
                'SELECT PLACONTA, PLANO ' +
                'FROM   TIPOALTERADOR '   +
                'WHERE  CODALTERADOR = '  + IntToStr(cdsLancamento.FieldByName('CODALTERADOR').AsInteger);

                 cdsAlterador.Data := GetDataPacket(sSQL);

                 sContaContabil  := cdsAlterador.FieldByName('PLACONTA').AsString;
                 iPlano          := cdsAlterador.FieldByName('PLANO').AsInteger;

                 if iPlano = 0 then iPlano := ParamIntegra.Plano;

                 // TRATA VALOR do IRRF - FIM
              end
              else  // if not(cdsAltxImp.IsEmpty)
              begin
                // ---------------------------------------------------------------------------------
                // TRATA VALOR do INSS - INICIO
                if (cdsLancamento.FieldByName('CODALTERADOR').AsInteger = iCodAltINSS) then
                begin
                  rValINSS := rValINSS + (cdsLancamento.FieldByName('VALOR').AsFloat);
                end
                else
                begin
                  sSQL :=
                  'SELECT CODALTERADOR '    + #13 +
                  'FROM   ALTXIMPOSTO '     + #13 +
                  'WHERE  CODALTERADOR = '  + IntToStr(cdsLancamento.FieldByName('CODALTERADOR').AsInteger) + #13 +
                  '  AND  CODIMPOSTO   = 2 ';

                  cdsAltxImp.Data := GetDataPacket(sSQL);

                  if not(cdsAltxImp.IsEmpty) then
                        rValINSS := rValINSS + (cdsLancamento.FieldByName('VALOR').AsFloat);
                end;
                // TRATA VALOR do INSS - FIM
                // ---------------------------------------------------------------------------------
              end;  // if not(cdsAltxImp.IsEmpty)

              // TRATA BASE - INICIO
              if (cdsLancamento.FieldByName('OPERACAO').AsInteger <= 3) then
              begin
                rValBase := rValBase + (cdsLancamento.FieldByName('VALOR').AsFloat);
              end;
              // TRATA BASE - FIM

            end;  // if (cdsLancamento.FieldByName('CODALTERADOR').AsInteger = iCodAltIRRF)

            cdsLancamento.Next;
          end;  // while not(cdsLancamento.EOF)

          // ---------------------------------------------------------------------------------------

          if rValIRRF <> 0 then bInsereImposto := True;

          // ---------------------------------------------------------------------------------------

          if ((bOperacao2) or (rValIRRF <> 0)) and
             (rValBase <> 0) and
             (
             ((cdsAux.FieldByName('TIPO').AsString = 'J') and (rValIRRF <> 0)) or
             ((cdsAux.FieldByName('TIPO').AsString = 'F') and bInsereImposto )
             ) then
          begin
            try
              StartTransaction;

              bPrim     := True;
              rTotIRRF  := 0;
              rTotBase  := 0;
              rTotINSS  := 0;

              // -----------------------------------------------------------------------------------

              cdsRateioPlanoPatro.First;
              while not(cdsRateioPlanoPatro.EOF) do
              begin
                iCodLanc    := 0;
                rValRatIRRF := Arredonda(rValIRRF * cdsRateioPlanoPatro.FieldByName('PERC').AsFloat,2);
                rValRatBase := Arredonda(rValBase * cdsRateioPlanoPatro.FieldByName('PERC').AsFloat,2);
                rValRatINSS := Arredonda(rValINSS * cdsRateioPlanoPatro.FieldByName('PERC').AsFloat,2);

                sCodCentroRespon := cdsRateioPlanoPatro.FieldByName('CODCENTRORESPON').AsString;

                rTotIRRF    := rTotIRRF + rValRatIRRF;
                rTotBase    := rTotBase + rValRatBase;
                rTotINSS    := rTotINSS + rValRatINSS;

                LancIRRF.GravaIRRF(cdsDocumento.FieldByName('IDPESSOA').AsInteger,
                                   UsaPlanoPatro,
                                   iCodDocumento,
                                   IDEmpresa,
                                   iBenef,
                                   sCodNatureza,
                                   sDataLanc,
                                   rValRatBase,
                                   rValRatIRRF,
                                   rValRatINSS,
                                   0,
                                   rValRatBase,
                                   (rValIRRF/rValBase*100),
                                   0,
                                   0,
                                   0,
                                   cdsVazio.Data,
                                   iCodLanc,
                                   sContaContabil,
                                   iPlano,
                                   'N',
                                   cdsRateioPlanoPatro.FieldByName('IDPLANOPREV').AsInteger,
                                   cdsRateioPlanoPatro.FieldByName('IDPATRO').AsInteger,
                                   cdsRateioPlanoPatro.FieldByName('IDPROGRAMA').AsInteger,
                                   bPrim,
                                   IdModulo,
                                   IdModulo,
                                   -1,
                                   cdsRateioPlanoPatro.FieldByName('CODCENTROCUSTO').AsString,
                                   -1,
                                   sCodtiprecdes,
                                   sPlacontac,
                                   sCodCentroRespon,
                                   ((cdsDocumento.FieldByName('NUMDEPIRRF').asInteger)*(cdsDocumento.FieldByName('VLRDEPendENTE').asFloat))
                                  );

                cdsRateioPlanoPatro.Next;
              end;  // while not(cdsRateioPlanoPatro.EOF)

              // -----------------------------------------------------------------------------------

              cdsRateioPlanoPatro.First;
              cdsRateioPlanoPatro.Last;

              if (Format('%17.2f', [rTotIRRF]) <> Format('%17.2f', [rValIRRF])) or
                 (Format('%17.2f', [rTotBase]) <> Format('%17.2f', [rValBase])) or
                 (Format('%17.2f', [rTotINSS]) <> Format('%17.2f', [rValINSS])) then
              begin
                iCodLanc    := 0;
                rValRatIRRF := rValIRRF - rTotIRRF;
                rValRatBase := rValBase - rTotBase;
                rValRatINSS := rValINSS - rTotINSS;

                LancIRRF.GravaIRRF(cdsDocumento.FieldByName('IDPESSOA').AsInteger,
                                   UsaPlanoPatro,
                                   iCodDocumento,
                                   IDEmpresa,
                                   iBenef,
                                   sCodNatureza,
                                   sDataLanc,
                                   rValRatBase,
                                   rValRatIRRF,
                                   rValRatINSS,
                                   0,
                                   rValRatBase,
                                   (rValIRRF/rValBase*100),
                                   0,
                                   0,
                                   0,
                                   cdsVazio.Data,
                                   iCodLanc,
                                   sContaContabil,
                                   iPlano,
                                   'N',
                                   cdsRateioPlanoPatro.FieldByName('IDPLANOPREV').AsInteger,
                                   cdsRateioPlanoPatro.FieldByName('IDPATRO').AsInteger,
                                   cdsRateioPlanoPatro.FieldByName('IDPROGRAMA').AsInteger,
                                   bPrim,
                                   IdModulo,
                                   IdModulo,
                                   -1,
                                   cdsRateioPlanoPatro.FieldByName('CODCENTROCUSTO').AsString,
                                   -1,
                                   sCodtiprecdes,
                                   sPlacontac,
                                   sCodCentroRespon,
                                   ((cdsDocumento.FieldByName('NUMDEPIRRF').asInteger)*(cdsDocumento.FieldByName('VLRDEPendENTE').asFloat))
                                  );
              end;

              Commit;

            except
              on E:Exception do
              begin
                Rollback;
                Result := False;
                MessageInfo := E.Message;
              end;
            end;

          end;  // if ((bOperacao2) or (rValIRRF <> 0))

          // ---------------------------------------------------------------------------------------
          // ---------------------------------------------------------------------------------------

          if not(bOperacao2) then
          begin
            sSQL :=
            'SELECT CODDOCUMENTO '  + #13 +
            'FROM   DOCUMENTO '     + #13 +
            'WHERE  (NUMFATURA = ' + cdsDocumento.FieldByName('NUMFATURA').AsString + ') ' + #13 +
            '  AND  (OPERACAO  = ''1 '') ';

            cdsfatura.Data := getDataPacket(sSQL);

            cdsFatura.First;
            while not(cdsFatura.EOF) do
            begin
              sSQL :=
              'SELECT IDLANCIRRF '      +
              'FROM   LANCIRRF '        +
              'WHERE  CODDOCUMENTO = '  + cdsFatura.FieldByName('CODDOCUMENTO').AsString + #13 +
              '  AND  CODNATUREZA  = '  + QuotedStr(cdsdocumento.FieldByName('CODNATUREZA').AsString);

              cdsBuscaLanc.Data := GetDataPacket(sSQL);

              if not(cdsBuscaLanc.IsEmpty) then
              begin
                cdsFatura.Next;
                Continue;
              end;

              sSQL :=
              'SELECT '                                                                           + #13 +
              '  T.FLGCALCULAIMPOSTO '                                                            + #13 +
              'FROM '                                                                             + #13 +
              '  TIPORECEBDESEMB T, '                                                             + #13 +
              '  RATEIODOCUM     R  '                                                             + #13 +
              'WHERE '                                                                            + #13 +
              '      R.CODDOCUMENTO       = ' + cdsFatura.FieldByName('CODDOCUMENTO').AsString    + #13 +
              '  AND T.FLGCALCULAIMPOSTO  = ''S'' '                                               + #13 +
              '  AND T.ATIVO              = ''S'' '                                               + #13 +
              '  AND T.CODTIPRECDES       = R.CODTIPRECDES '                                      + #13 +
              '  AND T.RECPAG             = R.RECPAG '                                            + #13 +
              '  AND T.IDPESSOA           = R.IDPESSOA ';

              cdsTipoDesemb.Data := GetDataPacket(sSQL);

              if not(cdsTipoDesemb.IsEmpty) then bInsereImposto := True;

              iCodDocumento  := cdsFatura.FieldByName('CODDOCUMENTO').AsInteger;
              rValBase       := 0;
              rValIRRF       := 0;
              rValINSS       := 0;
              sContaContabil := '';
              iPlano         := 0;

              if cdsFatura.Recno = cdsFatura.RecordCount then
              begin
                sSQL :=
                'SELECT '                                                                         + #13 +
                '  CODALTERADOR, CODDOCUMENTO, DATALANCTO, VALOR, OPERACAO '                      + #13 +
                'FROM '                                                                           + #13 +
                '  LANCTODOCUM '                                                                  + #13 +
                'WHERE '                                                                          + #13 +
                '      CODDOCUMENTO = ' + cdsFatura.FieldByName('CODDOCUMENTO').AsString          + #13 +
                '  AND ESTORNO      IS NULL '                                                     + #13 +
                'UNION '                                                                          + #13 +
                'SELECT '                                                                         + #13 +
                '  CODALTERADOR, CODDOCUMENTO, DATALANCTO, VALOR, OPERACAO '                      + #13 +
                'FROM '                                                                           + #13 +
                '  LANCTODOCUM '                                                                  + #13 +
                'WHERE '                                                                          + #13 +
                '      OPERACAO = ''4 '' '                                                        + #13 +
                '  AND ESTORNO IS NULL '                                                          + #13 +
                '  AND CODDOCUMENTO IN '                                                          + #13 +
                '      ( '                                                                        + #13 +
                '      SELECT '                                                                   + #13 +
                '        CODDOCUMENTO '                                                           + #13 +
                '      FROM '                                                                     + #13 +
                '        DOCUMENTO '                                                              + #13 +
                '      WHERE '                                                                    + #13 +
                '            NUMFATURA = ' + cdsDocumento.FieldByName('NUMFATURA').AsString       + #13 +
                '        AND OPERACAO  = ''3 '' '                                                 + #13 +
                '      ) ';
              end
              else  // if cdsFatura.Recno = cdsFatura.RecordCount
              begin
                sSQL :=
                'SELECT CODALTERADOR, CODDOCUMENTO, DATALANCTO, VALOR, OPERACAO '                 + #13 +
                'FROM   LANCTODOCUM '                                                             + #13 +
                'WHERE  CODDOCUMENTO  = ' + cdsFatura.FieldByName('CODDOCUMENTO').AsString        + #13 +
                '  AND  ESTORNO       IS NULL ';
              end;  // if cdsFatura.Recno = cdsFatura.RecordCount

              cdsLancamento.Data := GetDataPacket(sSQL);

              sSQL :=
              'SELECT '                                                                           + #13 +
              '  R.IDPATRO, R.IDPLANOPREV, R.IDPROGRAMA, R.CODCENTROCUSTO, R.CODCENTRORESPON, '   + #13 +
              '  DECODE(T.TOTAL, 0, 0,(SUM(R.VALOR)/T.TOTAL)) AS PERC '                           + #13 +
              'FROM '                                                                             + #13 +
              '  RATEIODOCUM R, '                                                                 + #13 +
              '  ( '                                                                              + #13 +
              '  SELECT '                                                                         + #13 +
              '    SUM(VALOR) AS TOTAL '                                                          + #13 +
              '  FROM '                                                                           + #13 +
              '    RATEIODOCUM '                                                                  + #13 +
              '  WHERE '                                                                          + #13 +
              '    CODDOCUMENTO = ' + cdsFatura.FieldByName('CODDOCUMENTO').AsString              + #13 +
              '  ) T '                                                                            + #13 +
              'WHERE '                                                                            + #13 +
              '  R.CODDOCUMENTO = ' + cdsFatura.FieldByName('CODDOCUMENTO').AsString              + #13 +
              'GROUP BY '                                                                         + #13 +
              '  R.IDPATRO, R.IDPLANOPREV, R.IDPROGRAMA, R.CODCENTROCUSTO, R.CODCENTRORESPON, T.TOTAL ';

              cdsRateioPlanoPatro.Data := GetDataPacket(sSQL);

              cdsLancamento.First;
              while not(cdsLancamento.EOF) do
              begin
                if (cdsLancamento.FieldByName('CODALTERADOR').AsInteger = iCodAltIRRF) then
                begin
                  rValIRRF := rValIRRF + (cdsLancamento.FieldByName('VALOR').AsFloat);

                  sSQL :=
                  'SELECT PLACONTA, PLANO, CODNATUREZA '+
                  '  FROM TIPOALTERADOR '+
                  ' WHERE (CODALTERADOR = '+cdsLancamento.FieldByName('CODALTERADOR').AsString+') ';

                  cdsAlterador.Data := GetDataPacket(sSQL);

                  if sCodNatureza = '' then sCodNatureza := trim(cdsAlterador.FieldByName('CODNATUREZA').AsString);

                  sContaContabil := cdsAlterador.FieldByName('PLACONTA').AsString;
                  iPlano         := cdsAlterador.FieldByName('PLANO').AsInteger;
                  if iPlano = 0 then iPlano := ParamIntegra.Plano;

                end;  // if (cdsLancamento.FieldByName('CODALTERADOR').AsInteger = iCodAltIRRF)

                if RecPag = 'R' then
                begin
                  if (cdsLancamento.FieldByName('CODALTERADOR').AsInteger = iCodAltCom) then
                    rValBase := rValBase + (cdsLancamento.FieldByName('VALOR').AsFloat);
                end;

                if RecPag = 'P' then
                begin
                  if (cdsLancamento.FieldByName('OPERACAO').AsInteger <= 3) then
                    rValBase := rValBase + (cdsLancamento.FieldByName('VALOR').AsFloat);

                  if (cdsLancamento.FieldByName('CODALTERADOR').AsInteger = iCodAltINSS) then
                    rValINSS := rValINSS + (cdsLancamento.FieldByName('VALOR').AsFloat);
                end;

                cdsLancamento.Next;
              end;  // while not(cdsLancamento.EOF)

              if rValIRRF <> 0 then bInsereImposto := True;

              if (rValBase <> 0) and
                 (((cdsAux.FieldByName('TIPO').AsString = 'J') and (rValIRRF <> 0)) or
                 ((cdsAux.FieldByName('TIPO').AsString = 'F') and bInsereImposto)) then
              begin
                try
                  StartTransaction;

                  bPrim     := True;
                  rTotIRRF  := 0;
                  rTotBase  := 0;
                  rTotINSS  := 0;

                  cdsRateioPlanoPatro.First;
                  while not(cdsRateioPlanoPatro.EOF) do
                  begin
                    iCodLanc    := 0;
                    rValRatIRRF := Arredonda(rValIRRF * cdsRateioPlanoPatro.FieldByName('PERC').AsFloat,2);
                    rValRatBase := Arredonda(rValBase * cdsRateioPlanoPatro.FieldByName('PERC').AsFloat,2);
                    rValRatINSS := Arredonda(rValINSS * cdsRateioPlanoPatro.FieldByName('PERC').AsFloat,2);
                    rTotIRRF    := rTotIRRF + rValRatIRRF;
                    rTotBase    := rTotBase + rValRatBase;
                    rTotINSS    := rTotINSS + rValRatINSS;

                    sCodCentroRespon := cdsRateioPlanoPatro.FieldByName('CODCENTRORESPON').AsString;

                    LancIRRF.GravaIRRF(cdsDocumento.FieldByName('IDPESSOA').AsInteger,
                                       UsaPlanoPatro,
                                       iCodDocumento,
                                       IDEmpresa,
                                       iBenef,
                                       sCodNatureza,
                                       sDataLanc,
                                       rValRatBase,
                                       rValRatIRRF,
                                       rValRatINSS,
                                       0,
                                       rValRatBase,
                                       (rValIRRF/rValBase*100),
                                       0,
                                       0,
                                       0,
                                       cdsVazio.Data,
                                       iCodLanc,
                                       sContaContabil,
                                       iPlano,
                                       'N',
                                       cdsRateioPlanoPatro.FieldByName('IDPLANOPREV').AsInteger,
                                       cdsRateioPlanoPatro.FieldByName('IDPATRO').AsInteger,
                                       cdsRateioPlanoPatro.FieldByName('IDPROGRAMA').AsInteger,
                                       bPrim,
                                       IdModulo,
                                       IdModulo,
                                       -1,
                                       cdsRateioPlanoPatro.FieldByName('CODCENTROCUSTO').AsString,
                                       -1,
                                       sCodtiprecdes,
                                       sPlacontac,
                                       sCodCentroRespon,
                                       ((cdsDocumento.FieldByName('NUMDEPIRRF').asInteger)*(cdsDocumento.FieldByName('VLRDEPendENTE').asFloat))
                                      );

                    bPrim := False;

                    cdsRateioPlanoPatro.Next;
                  end;  // while not(cdsRateioPlanoPatro.EOF)

                  cdsRateioPlanoPatro.First;
                  cdsRateioPlanoPatro.Last;

                  if (Format('%17.2f',[rTotIRRF]) <> Format('%17.2f',[rValIRRF])) or
                     (Format('%17.2f',[rTotBase]) <> Format('%17.2f',[rValBase])) or
                     (Format('%17.2f',[rTotINSS]) <> Format('%17.2f',[rValINSS])) then
                  begin
                    iCodLanc    := 0;
                    rValRatIRRF := rValIRRF - rTotIRRF;
                    rValRatBase := rValBase - rTotBase;
                    rValRatINSS := rValINSS - rTotINSS;

                    LancIRRF.GravaIRRF(cdsDocumento.FieldByName('IDPESSOA').AsInteger,
                                       UsaPlanoPatro,
                                       iCodDocumento,
                                       IDEmpresa,
                                       iBenef,
                                       sCodNatureza,
                                       sDataLanc,
                                       rValRatBase,
                                       rValRatIRRF,
                                       rValRatINSS,
                                       0,
                                       rValRatBase,
                                       (rValIRRF/rValBase*100),
                                       0,
                                       0,
                                       0,
                                       cdsVazio.Data,
                                       iCodLanc,
                                       sContaContabil,
                                       iPlano,
                                       'N',
                                       cdsRateioPlanoPatro.FieldByName('IDPLANOPREV').AsInteger,
                                       cdsRateioPlanoPatro.FieldByName('IDPATRO').AsInteger,
                                       cdsRateioPlanoPatro.FieldByName('IDPROGRAMA').AsInteger,
                                       bPrim,
                                       IdModulo,
                                       IdModulo,
                                       -1,
                                       cdsRateioPlanoPatro.FieldByName('CODCENTROCUSTO').AsString,
                                       -1,
                                       sCodtiprecdes,
                                       sPlacontac,
                                       sCodCentroRespon,
                                       ((cdsDocumento.FieldByName('NUMDEPIRRF').asInteger)*(cdsDocumento.FieldByName('VLRDEPendENTE').asFloat))
                                      );
                  end;  // if (Format('%17.2f',[rTotIRRF]) <> Format('%17.2f',[rValIRRF])) or

                  Commit;

                except
                  on E:Exception do
                  begin
                    Rollback;
                    Result := False;
                    MessageInfo := E.Message;
                  end;
                end;
              end;  //if (rValBase <> 0)

              cdsFatura.Next;
            end;  // while not(cdsFatura.EOF)
          end;  // if not(bOperacao2)

          // ---------------------------------------------------------------------------------------
          // ---------------------------------------------------------------------------------------

          cdsDocumento.Next;

          frmBuscaIRCARCARMT.ProgressBar1.Position:=frmBuscaIRCARCARMT.ProgressBar1.Position + frmBuscaIRCARCARMT.ProgressBar1.Step;

          iProcessado := frmBuscaIRCARCARMT.ProgressBar1.Position;

          frmBuscaIRCARCARMT.lblcontagem.Caption := 'Processando '+IntToStr(iProcessado)+
                                                    ' de '+IntToStr(frmBuscaIRCARCARMT.ProgressBar1.Max);
          frmBuscaIRCARCARMT.repaint;

        end;  // while not(cdsDocumento.EOF)

        AtualizaPosicao ('Fim do Processo .');
        Linha;
        frmBuscaIRCARCARMT.memResult.Lines.Add('Fim do Processamento: ' + formatdatetime('dd/mm/yyyy hh:nn:ss', now));
        Linha;
      end
      else  // if bProcessa
      begin
        Linha;
        frmBuscaIRCARCARMT.memResult.Lines.Add('Estes erros precisam ser resolvidos para que o processamento possa ser efetuado ');
        AtualizaPosicao ('> PROC. CANCELADO DEVIDO A AUSENCIA DE PARAMETRIZAÇÃO');
        Linha;
        frmBuscaIRCARCARMT.memResult.Lines.Add('Fim do Processamento: '+formatdatetime('dd/mm/yyyy hh:nn:ss', now));
        Linha;
      end;  // if bProcessa
    end
    else  // if cdsDocumento.Recordcount > 0
    begin
      Linha;
      AtualizaPosicao ('> NÃO HÁ NADA A PROCESSAR.');
      Linha;
      frmBuscaIRCARCARMT.memResult.Lines.Add('Fim do Processamento: '+formatdatetime('dd/mm/yyyy hh:nn:ss', now));
      Linha;
    end;  // if cdsDocumento.Recordcount > 0
  end;  // // if ConnectionSide = cnsClient
end;



constructor TCtrlBuscaIRCARCAR.Create;
begin
  inherited;
  cdsInforme          := TClientDataSet.Create(nil);
  cdsDocumento        := TClientDataSet.Create(nil);
  cdsParamIRRF        := TclientDataSet.Create(nil);
  cdsAux              := TclientDataSet.Create(nil);
  cdsBuscaLanc        := TClientDataSet.Create(nil);
  cdsLancamento       := TclientDataSet.Create(nil);
  cdsRateioPlanoPatro := TclientDataSet.Create(nil);
  cdsTipoDesemb       := TclientDataSet.Create(nil);
  cdsAlterador        := TclientDataSet.Create(nil);
  cdsAltxImp          := TclientDataSet.Create(nil);
  CdsFatura           := TclientDataSet.Create(nil);
  cdsVazio            := TclientDataSet.Create(nil);
  LancIRRF            := TCtrLancIRRF.create;
end;

destructor TCtrlBuscaIRCARCAR.Destroy;
begin
  inherited;
  cdsInforme.free;
  cdsDocumento.free;
  cdsParamIRRF.free;
  cdsAux.free;
  cdsLancamento.free;
  cdsTipoDesemb.free;
  cdsAlterador.free;
  cdsAltxImp.free;
  cdsFatura.free;
  cdsVazio.free;
  LancIRRF.free;
  cdsBuscaLanc.Free;
end;

procedure TCtrlBuscaIRCARCAR.DoChangeDataBase;
begin
  inherited;

end;

procedure TCtrlBuscaIRCARCAR.Atualizaposicao (cTexto : String);
begin
    frmBuscaIRCARCARMT.pnlPosicao.Caption := cTexto;
    frmBuscaIRCARCARMT.Repaint;
end;

procedure TCtrlBuscaIRCARCAR.Linha;
begin
  frmBuscaIRCARCARMT.memResult.Lines.Add('-------------------------------------------------------'+
                                         '-------------------------');
  frmBuscaIRCARCARMT.Repaint;
end;



function TCtrlBuscaIRCARCAR.OraData(const dData: TDateTime) : String;
begin
   Result := 'TO_DATE(' + QuotedStr(FormatDateTime('DD/MM/YYYY', dData)) + ', ''DD/MM/YYYY'')';
end;



end.
