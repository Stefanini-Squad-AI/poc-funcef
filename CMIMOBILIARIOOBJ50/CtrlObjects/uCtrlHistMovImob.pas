unit uCtrlHistMovImob;
{--------------------------------------------------------------------------------
ALTERAÇÕES / IMPLEMENTAÇÕES ----------------------------------------------------
--------------------------------------------------------------------------------
Rotina............: FormCreate
N. Sol.............: 92381
N. Kintana......: 394180
Data...............: 18/09/2008
Responsável...: Cássio Camargo
Descrição........: Inclusão dos Control Objects CtrlImobDocumento e
                   CtrlImobLancamento, com o objetivo de internalizar
                   funcionalidades.
--------------------------------------------------------------------------------}

interface

Uses SysUtils,           uCmControlObject, uCmDbObject,  uCmClientDataSet,   uDbHistMovImob,  uCMTypes,
     uCtrlFormaCalcImob, uCtrlRegra,       uCtrlPadroes, uComunsImobiliario, {uCtrlLancamento,} uCtrlPadrLancImovel,
     uCtrlParamIntegra,  uDiasUteis,       uFuncoesImob,
     //Cássio Camargo - 18/09/2008 - N. Sol 92381 -  N. Kintana 394180
     uCtrlImobLancamento;

Type
     TContabPD = Record
        Parametros    : TParamContabeisMT;
        dLancto       : TDateTime;
        NoDocumento   : Extended;
        IdUsuario     : Integer;
        IdPatroImovel : Integer;
        IdPlanoImovel : Integer;
        VlrTotal      : Extended;
     end;

     TSaldoDevedor = Record
        SaldoDevedor   : Currency;
        DataVencimento : TDateTime;
        Parcela        : Integer;
        QtdeInadimp    : Integer;
     end;

     TCtrlHistMovImob = class(TCmControlObject)
     private
       FDbHistMovImob     : TDbHistMovImob;

       FCdsHistMovImob    : TCMClientDataSet;
       FCdsItensCalc      : TCMClientDataSet;
       FCdsCondPag        : TCMClientDataSet;

       fValorCalculado    : Currency;
       FDataMov           : TDateTime;

       FiEmpresa          : Integer;
       FiModulo           : Integer;
       FiUsuario          : Integer;
       FUsaPlanoPatro     : Boolean;
       //Cássio Camargo - 18/09/2008 - N. Sol 92381 -  N. Kintana 394180
       //CtrlLancamento     : TCtrlLancamento;
       CtrlImobLancamento : TCtrlImobLancamento;
       CtrlPadrLancImovel : TCtrlPadrLancImovel;
       CtrlParamIntegra   : TCtrlParamIntegra;
       CtrlFormaCalcImob  : TCtrlFormaCalcImob;
       CtrlRegra          : TCtrlRegra;

       DiasUteis          : TDiasUteis;

       rSaldoDevedor      : Array of TSaldoDevedor;

       aImovel            : array of integer;

       procedure SetCdsHistMovImob(const Value: TCMClientDataSet);
       procedure SetDbHistMovImob(const Value: TDbHistMovImob);
       procedure SetCdsItensCalc(const Value: TCMClientDataSet);
       procedure SetCdsCondPag(const Value: TCMClientDataSet);

       procedure SetDataMov(const Value: TDateTime);
       procedure SetiEmpresa(const Value: Integer);
       procedure SetiModulo(const Value: Integer);
       procedure SetiUsuario(const Value: Integer);
       procedure SetUsaPlanoPatro(const Value: Boolean);
       function  OraNumero(const sNumero : String) : String;

       function ExecutaRegra(const iRegra : Integer) : Boolean;
       function BuscaParametrizacao(var vParamContabeis: array of TParamContabeisMT): Boolean;
       function DefineParamContabeis(var rParamContabeis: TParamContabeisMT): Boolean;
       function DefineHistorico(var sHistCtb :string): Boolean;
       function IntegraContabilidadePD(var vParamContabeis: array of TParamContabeisMT): Boolean;
       function IntegraContabilidade(var vParamContabeis: array of TParamContabeisMT): Boolean;
       function LookupValorRateadoPorImovel(const iIdHistMovImob : Integer) : OleVariant;
       function FazerLancamentoContab(var rParamContabeis: TParamContabeisMT; const sTipoLanc: char;
                                      const dLancto: TDateTime; const NumDoc, VlrLancto: Extended;
                                      const idUsuario, iIdPatroImovel, iIdPlanoImovel:Integer; iIdImovel: integer = -1): Boolean;

       function LookupSaldoDevedor(const iCondPag : Integer;
                                   const dDataMov : TDateTime) : OleVariant;

       function LookupQtdInadimplencia(const iCondPag : Integer;
                                       const dDataMov : TDateTime) : OleVariant;

       function LookupValorDesconto(const iCondPag : Integer) : OleVariant;

     protected
       procedure AfterInitialize;  Override;
       procedure OnCreateAppServer; Override;

     public
       constructor Create;  override;
       destructor  Destroy; override;

       property iEmpresa       : Integer          read FiEmpresa       write SetiEmpresa;
       property iModulo        : Integer          read FiModulo        write SetiModulo;
       property iUsuario       : Integer          read FiUsuario       write SetiUsuario;
       property UsaPlanoPatro  : Boolean          read FUsaPlanoPatro  write SetUsaPlanoPatro;

       property DbHistMovImob  : TDbHistMovImob   read FDbHistMovImob  write SetDbHistMovImob;
       property CdsHistMovImob : TCMClientDataSet read FCdsHistMovImob write SetCdsHistMovImob;
       property CdsItensCalc   : TCMClientDataSet read FCdsItensCalc   write SetCdsItensCalc;
       property CdsCondPag     : TCMClientDataSet read FCdsCondPag     write SetCdsCondPag;
       property DataMov        : TDateTime        read FDataMov        write SetDataMov;

       function GravaHistMovImob  : Boolean;
       function RetornaSaldoDevedor(const iCondPag : Integer;
                                    const dDataMov : TDateTime) : Currency;


       // Para trazer historico vazio basta passar -2 na condicao de pagamento e -1 no id do historico
       // Para trazer exclusivamente a linha do historico basta passar -1 no parametro acima e o id do historico desejado

       // iPlanilha
       // -1: Independe do conteudo do campo PLNCODIGO
       // -2: PLNCODIGO IS NULL
       // -3: PLNCODIGO IS NOT NULL

       // iDocumento
       // -1: Independe do conteudo do campo HMIDOCUMENTO
       // -2: HMIDOCUMENTO IS NULL
       // -3: HMIDOCUMENTO IS NOT NULL

       function LookupHistMovImob(const iIdCondPagImovel : Integer = -1;
                                  const iIdHistMovImob   : Integer = -1;
                                  const iTipoEvento      : Integer = -1;
                                  const iPlanilha        : Integer = -1;
                                  const iDocumento       : Integer = -1;
                                  const dDataIni         : TDateTime = -1;
                                  const dDataFim         : TDateTime = -1;
                                  const iContrato        : Integer = -1) : OLEVariant;

       function ProcessaCalculo(const iTipoMov   : Integer;
                                const iMes       : Integer;
                                const iAno       : Integer) : Boolean;

       function LookupCondPag(const iMes       : Integer;
                              const iAno       : Integer;
                              const iContrato  : Integer = -1;
                              const iCondPag   : Integer = -1;
                              const iFormaCalc : Integer = -1;
                              const sTipoCond  : String  = 'P') : OleVariant;

       function LookupCondicaoComDesconto(const iMes : Integer; const iAno : Integer) : OleVariant;

       function LookupContratoConfessado(const iContrato : Integer) : OleVariant;
       function LookupConfissaoOperacoes(const iContrato: Integer; const iCondPagImovel  : Integer = -1): OleVariant;

       function ContabilizaItens : Boolean;
       function DesfazContabilizacao(const iUsuario        : Integer;
                                     const iPlanilha       : Integer;
                                     const iModulo         : Integer;
                                     const iNumLan         : Integer;
                                     const bUsaPlanoPatro  : Boolean;
                                     const bExcluiPlanilha : Boolean;
                                     const bTransacao      : Boolean = True
                                    ) : Boolean;

       function ExisteLancamentoNoPeriodo(const iMes : Integer; const iAno : Integer; const iContrato : Integer = -1) : Boolean;
       function RetornaImoveisDocum(iIDContratoImovel: Integer): OleVariant;
     published

end;



implementation

{ TCtrlHistMovImob }

constructor TCtrlHistMovImob.Create;
begin
   inherited;
   FDbHistMovImob    := TDBHistMovImob.Create( Self );

   CtrlFormaCalcImob  := TCtrlFormaCalcImob.Create;
   CtrlRegra          := TCtrlRegra.Create;
   //Cássio Camargo - 18/09/2008 - N. Sol 92381 -  N. Kintana 394180
   //CtrlLancamento     := TCtrlLancamento.Create;
   CtrlImobLancamento := TCtrlImobLancamento.Create;
   CtrlPadrLancImovel := TCtrlPadrLancImovel.Create(FiEmpresa,FImodulo);
   CtrlParamIntegra   := TCtrlParamIntegra.Create;

   DiasUteis          := TDiasUteis.Create;
end;



destructor TCtrlHistMovImob.Destroy;
begin
   // Destrói os DbObjects criados
   FDbHistMovImob.Free;

   FreeAndNil(CtrlFormaCalcImob);
   FreeAndNil(CtrlRegra);
   //FreeAndNil(CtrlLancamento);
   FreeAndNil(CtrlImobLancamento);
   FreeAndNil(CtrlPadrLancImovel);

   FreeAndNil(DiasUteis);

   // Destrói os Cds criados somente se os mesmos foram criados pelo CtrlObject
   if isAppServer then
   begin
      FCdsHistMovImob.Free;
      FCdsItensCalc.Free;
      FCdsCondPag.Free;
   end;
   inherited;
end;



procedure TCtrlHistMovImob.OnCreateAppServer;
begin
   inherited;
   // Cria os Cds somente no caso de execução pela aplicação servidora, pois na
   // aplicação cliente, os mesmos já foram criados.
   FCdsHistMovImob := TCMClientDataSet.Create( nil );
   FCdsItensCalc   := TCMClientDataSet.Create( nil );
   FCdsCondPag     := TCMClientDataSet.Create( nil );
end;



procedure TCtrlHistMovImob.AfterInitialize;
begin
   inherited;
   // define o DataBase a ser utilizado
   CtrlFormaCalcImob.InitializeAs(Padroes);
   CtrlRegra.InitializeAs(Padroes);
   //Cássio Camargo - 18/09/2008 - N. Sol 92381 -  N. Kintana 394180
   //CtrlLancamento.InitializeAs(Padroes);
   CtrlImobLancamento.InitializeAs(Padroes);
   CtrlPadrLancImovel.InitializeAs(Padroes);
   CtrlParamIntegra.InitializeAs(Padroes);

   FDbHistMovImob.DataBaseName := DataBaseName;

   CtrlParamIntegra.GetParams(FiEmpresa,0,'','', tiSistema);
end;



function TCtrlHistMovImob.GravaHistMovImob: Boolean;
begin
   if ConnectionSide = cnsClient then begin
      Result := Connection.AppServer.GravaHistMovImob( CdsHistMovImob.Data );
      if not Result then MessageInfo := Connection.AppServer.MessageInfo;
   end
   else
   begin
      try
         if OpenTransaction then StartTransaction;

         // Aplica as alterações do Cds através do DbObject
         Result := ApplyCds( CdsHistMovImob, DbHistMovImob, [], [] );
         if not Result then raise Exception.Create( DbHistMovImob.MessageInfo );
         if OpenTransaction then Commit;
      except
         on E : Exception do
         begin
            Result := False;
            if OpenTransaction then Rollback;
            MessageInfo := E.Message;
         end;
      end;
   end;
end;



function TCtrlHistMovImob.LookupHistMovImob(const iIdCondPagImovel : Integer = -1;
                                            const iIdHistMovImob   : Integer = -1;
                                            const iTipoEvento      : Integer = -1;
                                            const iPlanilha        : Integer = -1;
                                            const iDocumento       : Integer = -1;
                                            const dDataIni         : TDateTime = -1;
                                            const dDataFim         : TDateTime = -1;
                                            const iContrato        : Integer = -1) : OLEVariant;
var
   sSQL : String;
begin

   sSql :=
   'SELECT DISTINCT '                                           + #13 +
   '    FCI.NOME,'                                              + #13 +
   '    CI.IDCONTRATOIMOVEL, '                                  + #13 +
   '    CI.CONNUMERO, '                                         + #13 +
   '    CI.CONNOME, '                                           + #13 +
   '    CPI.IDCONDPAGIMOVEL, '                                  + #13 +
   '    CPI.TIPOCONDPAG, '                                      + #13 +
   '    TCR.DESCCUSTORECIMO, '                                  + #13 +
   '    HMI.IDHISTMOVIMOB, '                                    + #13 +
   '    HMI.IDCONDPAGIMOVEL, '                                  + #13 +
   '    HMI.IDTIPOCUSTORECIMO, '                                + #13 +
   '    HMI.IDITEMCENTRALIZA, '                                 + #13 +
   '    HMI.HMIDATAMOV, '                                       + #13 +
   '    HMI.HMIVALOR, '                                         + #13 +
   '    HMI.HMIDOCUMENTO, '                                     + #13 +
   '    HMI.HMITIPOEVENTO, '                                    + #13 +
   '    HMI.PLNCODIGO, '                                        + #13 +
   '    HMI.HMIPARCELA, '                                       + #13 +
   '    LCI.DATAVENCIMENTO '                                    + #13 +
   'FROM '                                                      + #13 +
   '    HISTMOVIMOB HMI, '                                      + #13 +
   '    CONDPAGIMOVEL CPI, '                                    + #13 +
   '    CONTRATOIMOVEl CI, '                                    + #13 +
   '    FORMACALCIMOB FCI, '                                    + #13 +
   '    TIPOCUSTORECIMOV TCR, '                                 + #13 +
   '    LANCAMENTOSIMOVEL LCI '                                 + #13 +
   'WHERE '                                                     + #13 +
   '    CPI.IDCONDPAGIMOVEL   = HMI.IDCONDPAGIMOVEL '           + #13 +
   'AND CI.IDCONTRATOIMOVEL   = CPI.IDCONTRATOIMOVEL '          + #13 +
   'AND FCI.IDFORMACALCIMOB   = CPI.IDFORMACALCIMOB '           + #13 +
   'AND HMI.HMIDOCUMENTO      = LCI.IDDOCUMENTO(+) '            + #13 +
   'AND TCR.IDTIPOCUSTORECIMO = HMI.IDTIPOCUSTORECIMO '         + #13;


   // Para trazer historico vazio basta passar -2 na condicao de pagamento e -1 no id do historico
   if iIdCondPagImovel <> -1 then
      sSQL := sSQL + 'AND HMI.IDCONDPAGIMOVEL       = ' + IntToStr(iIdCondPagImovel)  + #13;

   // Para trazer exclusivamente a linha do historico basta passar -1 no parametro acima e o id do historico desejado
   if iIdHistMovImob   <> -1 then
      sSQL := sSQL + 'AND HMI.IDHISTMOVIMOB         = ' + IntToStr(iIdHistMovImob) + #13;

   if iTipoEvento <> -1 then
      sSQL := sSQL + 'AND HMI.HMITIPOEVENTO         = ' + IntToStr(iTipoEvento) + #13;

   if iContrato <> -1 then
      sSQL := sSQL + 'AND CI.IDCONTRATOIMOVEL       = ' + IntToStr(iContrato) + #13;

   // iPlanilha
   // -1: Independe do conteudo do campo PLNCODIGO
   // -2: PLNCODIGO IS NULL
   // -3: PLNCODIGO IS NOT NULL
   case iPlanilha of
      -1 : sSQL := sSQL;
      -2 : sSQL := sSQL + 'AND HMI.PLNCODIGO     IS NULL AND HMI.IDTIPOCUSTORECIMO <> HMI.IDITEMCENTRALIZA' + #13;
      -3 : sSQL := sSQL + 'AND HMI.PLNCODIGO     IS NOT NULL'                                               + #13;
   else
      sSQL := sSQL + 'AND HMI.PLNCODIGO         = ' + IntToStr(iPlanilha) + #13;
   end;

   // iDocumento
   // -1: Independe do conteudo do campo HMIDOCUMENTO
   // -2: HMIDOCUMENTO IS NULL
   // -3: HMIDOCUMENTO IS NOT NULL
   case iDocumento of
      -1 : sSQL := sSQL;
      -2 : sSQL := sSQL + 'AND HMI.HMIDOCUMENTO     IS NULL AND HMI.IDTIPOCUSTORECIMO = HMI.IDITEMCENTRALIZA' + #13;
      -3 : sSQL := sSQL + 'AND HMI.HMIDOCUMENTO     IS NOT NULL'                                              + #13;
   else
      sSQL := sSQL + 'AND HMI.HMIDOCUMENTO         = ' + IntToStr(iDocumento) + #13;
   end;

   if dDataIni <> -1 then
      sSQL := sSQL + 'AND HMI.HMIDATAMOV           >= TO_DATE(' + QuotedStr(FormatDateTime('dd/mm/yyyy', dDataIni)) + ',''DD/MM/YYYY'')' + #13;

   if dDataFim <> -1 then
      sSQL := sSQL + 'AND HMI.HMIDATAMOV           <= TO_DATE(' + QuotedStr(FormatDateTime('dd/mm/yyyy', dDataFim)) + ',''DD/MM/YYYY'')' + #13;

   sSQL := sSQL + 'ORDER BY CI.IDCONTRATOIMOVEL, CPI.IDCONDPAGIMOVEL, HMI.HMIPARCELA' + #13;

   Result := GetDataPacket( sSql );
end;



procedure TCtrlHistMovImob.SetiEmpresa(const Value: Integer);
begin
   FiEmpresa := Value;
end;



procedure TCtrlHistMovImob.SetiModulo(const Value: Integer);
begin
   FiModulo := Value;
end;



procedure TCtrlHistMovImob.SetCdsCondPag(const Value: TCMClientDataSet);
begin
   FCdsCondPag := Value;
end;



procedure TCtrlHistMovImob.SetCdsHistMovImob(const Value: TCMClientDataSet);
begin
   FCdsHistMovImob := Value;
end;



procedure TCtrlHistMovImob.SetDbHistMovImob(const Value: TDbHistMovImob);
begin
   FDbHistMovImob := Value;
end;



procedure TCtrlHistMovImob.SetCdsItensCalc(const Value: TCMClientDataSet);
begin
   FCdsItensCalc := Value;
end;



procedure TCtrlHistMovImob.SetiUsuario(const Value: Integer);
begin
   FiUsuario := Value;
end;



procedure TCtrlHistMovImob.SetDataMov(const Value: TDateTime);
begin
   FDataMov := Value;
end;



procedure TCtrlHistMovImob.SetUsaPlanoPatro(const Value: Boolean);
begin
   FUsaPlanoPatro := Value;
end;



function TCtrlHistMovImob.ProcessaCalculo(const iTipoMov   : Integer;
                                          const iMes       : Integer;
                                          const iAno       : Integer) : Boolean;
var
   sSQLRegra           : String;
   dVencimento         : TDateTime;
   iDiaV, iMesV, iAnoV : word;
   iAnoVenc, iMesVenc  : word;
   fSaldoDev           : Currency;
   iNumParcela         : Integer;
   sAno, sMes          : String;
   sAnoAux, sMesAux    : String;
   sAnoVenc, sMesVenc  : String;
   fValorAcumulado     : Currency;
   iPeriodo            : Integer;
   fValorDesconto      : Currency;
   dVencCondicao       : TDateTime;
begin
   try
      Result := True;
      FCdsCondPag.First;
      while not FCdsCondPag.eof do
      begin

         RetornaSaldoDevedor(FCdsCondPag.FieldByName('IDCONDPAGIMOVEL').AsInteger,FDataMov);

         iNumParcela := (rSaldoDevedor[0].Parcela + 1);

         fValorAcumulado := 0;

         _cds.IndexFieldNames := '';
         _cds.Data      := LookupValorDesconto(FCdsCondPag.FieldByName('IDCONDPAGIMOVEL').AsInteger);
         fValorDesconto := _cds.FieldByName('TOT_DESCONTO').AsCurrency;

         if FcdsCondPag.FieldByName('PRAZO').AsString = 'M' then iPeriodo := FcdsCondPag.FieldByName('PERIODO').AsInteger
         else                                                    iPeriodo := FcdsCondPag.FieldByName('PERIODO').AsInteger * 12;


         // Verifica se o primeiro vencimento
         if iNumParcela = 1 then iPeriodo := iPeriodo -1;

         DecodeDate(DiasUteis.SomaMeses(rSaldoDevedor[0].DataVencimento,iPeriodo), iAnoV, iMesV, iDiaV);

         if (iAnoV = iAno) and (iMesV = iMes) then
         begin
            // Verifica se o vencimento original é no ultimo dia do mes
            if iDiaV = DiasUteis.UltDiaMes(iAno,iMes) then
            begin
               dVencimento := DiasUteis.UltDiaMes(iAno,iMes);
            end
            else
            begin
               dVencimento := EncodeDate(iAno, iMes, iDiaV);
            end;

            sAno    := IntToStr(iAno);
            sMes    := IntToStr(iMes);

            if Length(sMes)    = 1 then sMes    := '0' + sMes;

            if iTipoMov = 1 then
            begin
               dVencimento := FcdsCondPag.FieldByName('DATAVENCIMENTO').AsDateTime;
               iNumParcela := FcdsCondPag.FieldByName('NUMPARCELAS').AsInteger;
            end;

            if (iTipoMov = 1) and (rSaldoDevedor[0].QtdeInadimp = 0) then
            begin
               FCdsCondPag.Next;
               Continue;
            end;

            FCdsItensCalc.Data := CtrlFormaCalcImob.LookupItemXFormaCalc(FCdsCondPag.FieldByName('IDFORMACALCIMOB').AsInteger,
                                                                         iTipoMov,
                                                                         -1,
                                                                         False);
            sSQLRegra := '';
            while not FCdsItensCalc.eof do
            begin

               if sSQLRegra <> '' then sSQLRegra := sSQLRegra + 'UNION' + #13;

               sSQLRegra := sSQLRegra +
               'SELECT'                                                                                             + #13 +
               ' ' + IntToStr(iMes) + ' AS MESPROCESSO, '                                                           + #13 +
               ' ' + IntToStr(iAno) + ' AS ANOPROCESSO, '                                                           + #13 +
               ' ' + IntToStr(iNumParcela) + ' AS NUMPARCELA, '                                                     + #13 +
               ' ' + FCdsItensCalc.FieldByName('IDTIPOCUSTORECIMO').AsString + ' AS IDITEMCALC, '                   + #13 +
               ' ' + FCdsItensCalc.FieldByName('SEQCALCULO').AsString + ' AS SEQCALCULO, '                          + #13 +
               '    CI.IDCONTRATOIMOVEL,'                                                                           + #13 +
               '    CI.IDCIDADES,'                                                                                  + #13 +
               '    CI.IDPAIS,'                                                                                     + #13 +
               '    CI.CODESTADO,'                                                                                  + #13 +
               '    CI.IDLOCATARIO,'                                                                                + #13 +
               '    CI.CODPORTFORMA,'                                                                               + #13 +
               '    CI.MOECODIGO AS MOECODIGOCORRENTE,'                                                             + #13 +
               '    CI.CONDATAINICAREN,'                                                                            + #13 +
               '    CI.CONDATACARENCIA,'                                                                            + #13 +
               '    CI.CONDATAINICIO,'                                                                              + #13 +
               '    CI.CONDATAFIM,'                                                                                 + #13 +
               '    MC.MOECODIGO,'                                                                                  + #13 +
               '    NVL(MC.MOESIGLA,''NULO'') AS MOESIGLA,'                                                         + #13 +
               '    NVL(PF.CODFORMA,0) AS CODFORMA,'                                                                + #13 +
               '    CP.IDCONDPAGIMOVEL,'                                                                            + #13 +
               '    CP.IDFORMACALCIMOB,'                                                                            + #13 +
               '    CP.VLRFINANC,'                                                                                  + #13 +
               '    CP.DATAINI,'                                                                                    + #13 +
               '    CP.PRAZO,'                                                                                      + #13 +
               '    CP.PERIODO,'                                                                                    + #13 +
               '    NVL(CP.TAXAJUROS,0) AS TAXAJUROS, '                                                             + #13 +
               '    CP.PERIODOTAXA,'                                                                                + #13 +
               '    CP.NUMPARCELAS,'                                                                                + #13 +
               '    CP.DATAFIM,'                                                                                    + #13 +
               '    CP.DATAVENCIMENTO AS DATAPRIMVENC,'                                                             + #13 +
               ' ' + QuotedStr(FormatDateTime('dd/mm/yyyy',dVencimento)) + ' AS DATAVENCIMENTO, '                   + #13 +
               '    TO_CHAR(CP.DATAVENCIMENTO,''DD'') AS DIAVENCIMENTO,'                                            + #13 +
               '    CP.TIPOCONDPAG,'                                                                                + #13 +
               '    CP.MESREFREAJUSTE,'                                                                             + #13 +
               '    CP.DATACARENCIA,'                                                                               + #13 +
               '    CP.DATAINIAMORTIZ,'                                                                             + #13 +
               '    CP.PERIODOREAJUSTE,'                                                                            + #13 +
               ' ' + QuotedStr(FormatDateTime('dd/mm/yyyy',FDataMov)) + ' AS DATAMOV,'                              + #13 +
               ' ' + QuotedStr(FormatDateTime('dd/mm/yyyy',rSaldoDevedor[0].DataVencimento)) + ' AS DATAULTVENC,'   + #13 +
               ' ' + OraNumero(FloatToStr(rSaldoDevedor[0].SaldoDevedor)) + ' AS SALDODEVEDOR,'                     + #13 +
               ' ' + IntToStr(rSaldoDevedor[0].QtdeInadimp) + ' AS QTDEINADIMP, '                                   + #13 +
               ' ' + OraNumero(FloatToStr(fValorCalculado)) + ' AS VALORCALCULADO,'                                 + #13 +
               ' ' + OraNumero(FloatToStr(fValorDesconto))  + ' AS VALORDESCONTO,'                                  + #13 +
               ' ' + OraNumero(FloatToStr(fValorAcumulado)) + ' AS VALORACUMULADO'                                  + #13 +
               'FROM'                                                                                               + #13 +
               '    CONDPAGIMOVEL CP,'                                                                              + #13 +
               '    CONTRATOIMOVEL CI,'                                                                             + #13 +
               '    MOEDA MC,'                                                                                      + #13 +
               '    PORTADORFORMA PF'                                                                               + #13 +
               'WHERE'                                                                                              + #13 +
               '    CI.IDCONTRATOIMOVEL = CP.IDCONTRATOIMOVEL'                                                      + #13 +
               'AND MC.MOECODIGO(+)     = CP.INDCORRECAO'                                                           + #13 +
               'AND CI.CODPORTFORMA     = PF.CODPORTFORMA(+)'                                                       + #13 +
               'AND CI.FLGTIPOCONTRATO  = ''D'''                                                                    + #13 +
               'AND CP.IDCONDPAGIMOVEL  = ' + FCdsCondPag.FieldByName('IDCONDPAGIMOVEL').AsString                   + #13;

               if iTipoMov = 0 then
               begin
                  sSQLRegra := sSQLRegra +
                  'AND (CP.DATAINI IS NULL OR CP.DATAFIM IS NULL OR '                                                  + #13 +
                    QuotedStr(sAno + '/' + sMes)  + 'BETWEEN TO_CHAR(CP.DATAINI,''YYYY/MM'') AND TO_CHAR(CP.DATAFIM,''YYYY/MM'')) ' + #13;
               end
               else
               begin

                  sAno    := IntToStr(iAno);
                  sMes    := IntToStr(iMes);

                  if Length(sMes)    = 1 then sMes    := '0' + sMes;

                  dVencCondicao := EncodeDate(StrToInt(sAno),StrToInt(sMes),15);
                  dVencCondicao := DiasUteis.SomaMeses(dVencCondicao,-1);
                  DecodeDate(dVencCondicao, iAnoV, iMesV, iDiaV);

                  sAno    := IntToStr(iAnoV);
                  sMes    := IntToStr(iMesV);
                  
                  if Length(sMes)    = 1 then sMes    := '0' + sMes;

                  sSQLRegra := sSQLRegra +
                  'AND TO_CHAR(CP.DATAFIM,''YYYY/MM'') = ' + QuotedStr(sAno + '/' + sMes) + #13;
               end;

               _cds.Data := GetDataPacket(sSQLRegra);
               _cds.IndexFieldNames := 'SEQCALCULO';

               if ExecutaRegra(FCdsItensCalc.FieldByName('IDREGRA').AsInteger) then
               begin
                  if ( (fValorCalculado = 0 ) and (FCdsItensCalc.FieldByName('FLGGRAVAZERO').AsInteger = 1) ) or
                     (fValorCalculado <> 0 ) then
                  begin
                     _Cds.Data := CtrlFormaCalcImob.LookupItemXFormaCalc(FCdsCondPag.FieldByName('IDFORMACALCIMOB').AsInteger,
                                                                         iTipoMov,
                                                                         -1,
                                                                         True);
                     FCdsHistMovImob.Append;
                     FCdsHistMovImob.FieldByName('NOME').AsString               := FCdsItensCalc.FieldByName('FORMACALCULO').AsString;
                     FCdsHistMovImob.FieldByName('IDCONTRATOIMOVEL').AsInteger  := FCdsCondPag.FieldByName('IDCONTRATOIMOVEL').AsInteger;
                     FCdsHistMovImob.FieldByName('CONNUMERO').AsString          := FCdsCondPag.FieldByName('CONNUMERO').AsString;
                     FCdsHistMovImob.FieldByName('CONNOME').AsString            := FCdsCondPag.FieldByName('CONNOME').AsString;
                     FCdsHistMovImob.FieldByName('DESCCUSTORECIMO').AsString    := FCdsItensCalc.FieldByName('NOMEITEM').AsString;
                     FCdsHistMovImob.FieldByName('IDCONDPAGIMOVEL').AsInteger   := FCdsCondPag.FieldByName('IDCONDPAGIMOVEL').AsInteger;
                     FCdsHistMovImob.FieldByName('IDTIPOCUSTORECIMO').AsInteger := FCdsItensCalc.FieldByName('IDTIPOCUSTORECIMO').AsInteger;
                     FCdsHistMovImob.FieldByName('HMIDATAMOV').AsDateTime       := FDataMov;
                     FCdsHistMovImob.FieldByName('HMITIPOEVENTO').AsInteger     := iTipoMov;
                     FCdsHistMovImob.FieldByName('HMIVALOR').AsCurrency         := fValorCalculado;
                     
                     FCdsHistMovImob.FieldByName('HMIPARCELA').AsInteger        := iNumParcela;

                     FCdsHistMovImob.FieldByName('IDITEMCENTRALIZA').AsInteger  := _Cds.FieldByName('IDTIPOCUSTORECIMO').AsInteger;
                     FCdsHistMovImob.Post;
                  end;
               end
               else
               begin
                  MessageInfo := 'Erro na execução da regra ' + FCdsItensCalc.FieldByName('IDREGRA').AsString;
                  Result      := False;
                  Exit;
               end;

               fValorAcumulado := fValorAcumulado + fValorCalculado;
               FCdsItensCalc.Next;
            end;
         end;
         FCdsCondPag.Next;
      end;
   except
      Result := False;
      MessageInfo := 'Erro ao processar cálculo de confissão de dívida';
   end;
end;



function TCtrlHistMovImob.ExecutaRegra(const iRegra: Integer): Boolean;
begin
   Result          := True;
   fValorCalculado := 0;
   
   // Carrega dados e parametros para o ctrlRegra
   CtrlRegra.CopiaData( _cds.Data );
   CtrlRegra.GravaCalculo := False;
   CtrlRegra.ReloadRule   := False;
   CtrlRegra.RuleNumber   := IntToStr(iRegra);

   // Executa a Regra e busca o resultado
   CtrlRegra.Execute;
   if not CtrlRegra.Error then fValorCalculado := Arredonda(StrToFloat( ComunsImobiliario.StrTran(CtrlRegra.Result,'.',',') ),2)
   else                        Result          := False;
end;



function TCtrlHistMovImob.LookupCondPag(const iMes, iAno : Integer; const iContrato, iCondPag,iFormaCalc: Integer; const sTipoCond : String): OleVariant;
var
   sSQL : String;
   sMes : String;
   sAno : String;
begin

   sAno := IntToStr(iAno);
   sMes := IntToStr(iMes);
   if Length(sMes) = 1 then sMes := '0' + sMes;

   sSQL :=
   'SELECT'                                                                                             + #13 +
   ' ' + IntToStr(iMes) + ' AS MESPROCESSO, '                                                           + #13 +
   ' ' + IntToStr(iAno) + ' AS ANOPROCESSO, '                                                           + #13 +
   '    CI.IDCONTRATOIMOVEL,'                                                                           + #13 +
   '    CI.IDCIDADES,'                                                                                  + #13 +
   '    CI.IDPAIS,'                                                                                     + #13 +
   '    CI.CONDIASTOLERANCIA,'                                                                          + #13 +
   '    CI.CONDIASREPASSE,'                                                                             + #13 +
   '    CI.CODESTADO,'                                                                                  + #13 +
   '    CI.FLGTIPODIATOLERA,'                                                                           + #13 +
   '    CI.IDLOCATARIO,'                                                                                + #13 +
   '    CI.CODPORTFORMA,'                                                                               + #13 +
   '    CI.CONNUMERO,'                                                                                  + #13 +
   '    CI.CONNOME,'                                                                                    + #13 +
   '    CI.MOECODIGO AS MOECODIGOCORRENTE,'                                                             + #13 +
   '    CI.CONDATAINICAREN,'                                                                            + #13 +
   '    CI.CONDATACARENCIA,'                                                                            + #13 +
   '    CI.CONDATAINICIO,'                                                                              + #13 +
   '    CI.CONDATAFIM,'                                                                                 + #13 +
   '    MC.MOECODIGO,'                                                                                  + #13 +
   '    MC.MOESIGLA,'                                                                                   + #13 +
   '    NVL(PF.CODFORMA,0) AS CODFORMA,'                                                                + #13 +
   '    CP.IDCONDPAGIMOVEL,'                                                                            + #13 +
   '    CP.IDFORMACALCIMOB,'                                                                            + #13 +
   '    CP.VLRFINANC,'                                                                                  + #13 +
   '    CP.DATAINI,'                                                                                    + #13 +
   '    CP.PRAZO,'                                                                                      + #13 +
   '    CP.PERIODO,'                                                                                    + #13 +
   '    CP.TAXAJUROS,'                                                                                  + #13 +
   '    CP.PERIODOTAXA,'                                                                                + #13 +
   '    CP.NUMPARCELAS,'                                                                                + #13 +
   '    CP.DATAFIM,'                                                                                    + #13 +
   '    CP.DATAVENCIMENTO,'                                                                             + #13 +
   '    TO_CHAR(CP.DATAVENCIMENTO,''DD'') AS DIAVENCIMENTO,'                                            + #13 +
   '    CP.TIPOCONDPAG,'                                                                                + #13 +
   '    CP.MESREFREAJUSTE,'                                                                             + #13 +
   '    CP.DATACARENCIA,'                                                                               + #13 +
   '    CP.DATAINIAMORTIZ,'                                                                             + #13 +
   '    CP.PERIODOREAJUSTE,'                                                                            + #13 +
   ' ' + QuotedStr(FormatDateTime('dd/mm/yyyy',FDataMov)) + ' AS DATAMOV'                               + #13 +
   'FROM'                                                                                               + #13 +
   '    CONDPAGIMOVEL CP,'                                                                              + #13 +
   '    CONTRATOIMOVEL CI,'                                                                             + #13 +
   '    MOEDA MC,'                                                                                      + #13 +
   '    PORTADORFORMA PF'                                                                               + #13 +
   'WHERE'                                                                                              + #13 +
   '    CI.IDCONTRATOIMOVEL = CP.IDCONTRATOIMOVEL'                                                      + #13 +
   'AND MC.MOECODIGO(+)     = CP.INDCORRECAO'                                                           + #13 +
   'AND CI.CODPORTFORMA     = PF.CODPORTFORMA(+)'                                                       + #13 +
   'AND CI.FLGTIPOCONTRATO  = ''D'''                                                                    + #13 +
   'AND (CP.DATAINI IS NULL OR CP.DATAFIM IS NULL OR ' +                                                
        QuotedStr(sAno + '/' + sMes)  + 'BETWEEN TO_CHAR(CP.DATAINI,''YYYY/MM'') AND TO_CHAR(CP.DATAFIM,''YYYY/MM'')) ' + #13;

   if iContrato  <> -1 then sSQL := sSQL + 'AND CP.IDCONTRATOIMOVEL = ' + IntToStr(iContrato)           + #13;

   if iCondPag   <> -1 then sSQL := sSQL + 'AND CP.IDCONDPAGIMOVEL  = ' + IntToStr(iCondPag)            + #13;

   if iFormaCalc <> -1 then sSQL := sSQL + 'AND CP.IDFORMACALCIMOB  = ' + IntToStr(iFormaCalc)          + #13;

   Result := GetDataPacket(sSQL);
end;



function TCtrlHistMovImob.ContabilizaItens: Boolean;
var
   iContrato       : Integer;
   iPlnCodigo      : Integer;
   vParamContabeis : array of TParamContabeisMT;    // Primeira Contabilização
begin
   Result := True;

   SetLength(vParamContabeis, FcdsHistMovImob.RecordCount);

   FcdsHistMovImob.First;
   OpenTransaction := False;
   try

      StartTransaction;
      while not FcdsHistMovImob.eof do
      begin
         iContrato  := FcdsHistMovImob.FieldByName('IDCONTRATOIMOVEL').AsInteger;
         iPlnCodigo := 0;

         while (iContrato = FcdsHistMovImob.FieldByName('IDCONTRATOIMOVEL').AsInteger) and
               (not FcdsHistMovImob.eof) do
         begin

            CtrlPadrLancImovel.ZeraVetorPadrLancContabil( vParamContabeis );

            _cds.Data := LookupValorRateadoPorImovel(FcdsHistMovImob.FieldByName('IDHISTMOVIMOB').AsInteger);

            if not BuscaParametrizacao( vParamContabeis ) then
               Raise Exception.Create('Não foi possível determinar os parâmetros de contabilização. '+ MessageInfo);

            FCdsItensCalc.Data := GetDataPacket('SELECT HMIDOCUMENTO FROM HISTMOVIMOB WHERE IDTIPOCUSTORECIMO = ' + FCDsHistMovImob.FieldByName('IDITEMCENTRALIZA').AsString + #13 +
                                                'AND HMIDATAMOV = ' + QuotedStr(FormatDateTime('dd/mm/yyyy',FCDsHistMovImob.FieldByName('HMIDATAMOV').AsDateTime)));

            if ParamIntegra.PartidaDobrada then
            begin
               if not IntegraContabilidadePD(vParamContabeis) then
                  Raise Exception.Create(MessageInfo);
            end
            else
            begin
               if not IntegraContabilidade(vParamContabeis) then
                  Raise Exception.Create(MessageInfo);
            end;

            FcdsHistMovImob.Next;
         end;
      end;
      Commit;
   except
      on e : Exception do
      begin
         Result      := False;
         MessageInfo := e.message;
      end;
   end;
end;



function TCtrlHistMovImob.BuscaParametrizacao(var vParamContabeis: array of TParamContabeisMT): Boolean;
var
   vRegistro: integer;
begin
   vRegistro        := 0;

   // Verifica a parametrização para item
   FcdsHistMovImob.First;
   while (not FcdsHistMovImob.Eof) do
   begin
      Result := DefineParamContabeis(vParamContabeis[vRegistro]);
      if Result then Result := DefineHistorico(vParamContabeis[vRegistro].sHistoricoCtb);

      if Result then
      begin
         if (vRegistro > 0) then
         begin
            if (vParamContabeis[vRegistro].sCodTipRecDes       <> vParamContabeis[0].sCodTipRecDes)       or
               (vParamContabeis[vRegistro].iUnidNegoc          <> vParamContabeis[0].iUnidNegoc)          or
               (vParamContabeis[vRegistro].bFlgIntegraContab   <> vParamContabeis[0].bFlgIntegraContab)   or
               (vParamContabeis[vRegistro].bFlgIntegraCapCar   <> vParamContabeis[0].bFlgIntegraCapCar)   then
            begin
               Result := False;
               Exit;
            end;
         end;
      end
      else
      begin
         exit;
      end;
      FcdsHistMovImob.Next;
      inc(vRegistro);
   end;
end;




function TCtrlHistMovImob.DefineParamContabeis(var rParamContabeis: TParamContabeisMT): Boolean;
var
   sRecPag  : String;
   iRecDes  : Integer;
   iCodErro : integer;
   sSQL     : String;
begin
   Result := True;
   try

      sRecPag := 'I';
      iRecDes := FcdsHistMovImob.FieldByName('IDTIPOCUSTORECIMO').AsInteger;


      if not CtrlPadrLancImovel.BuscaPadrLancContabil(rParamContabeis,
                                                      iCodErro,
                                                      sRecPag,
                                                      False,
                                                      FiEmpresa,
                                                      FiModulo,
                                                      iRecDes,
                                                      _cds.FieldByName('CODTIPIMOVEL').AsString,
                                                      -1,
                                                      FcdsHistMovImob.FieldByName('IDCONTRATOIMOVEL').AsInteger) then
         raise Exception.create ( CtrlPadrLancImovel.MessageInfo );
   except
      on e : Exception do
      begin
         Result      := False;
         MessageInfo := e.message;
      end;
   end;
end;



function TCtrlHistMovImob.DefineHistorico(var sHistCtb :string): Boolean;
begin
   try
      Result := True;
      sHistCtb := 'Contrato: ' + trim(FCdsHistMovImob.FieldByName('CONNUMERO').AsString) + ' - ' +
                  trim(FCdsHistMovImob.FieldByName('CONNOME').AsString)   + ' - ' +
                  trim(FCdsHistMovImob.FieldByName('DESCCUSTORECIMO').AsString);
      sHistCtb := sHistCtb + ' - Data Mov: ' + DateToStr(FCdsHistMovImob.FieldByName('HMIDATAMOV').AsDateTime);
   except
      Result      := False;
      sHistCtb    := '';
   end;
end;



function TCtrlHistMovImob.IntegraContabilidadePD(var vParamContabeis: array of TParamContabeisMT): Boolean;
var
   iRegistro, i : integer;
   vLancaPD     : Array of TContabPD;
   bNovoLancto  : Boolean;
   cdsContratoxImovel : TCMClientDataSet;
begin
   Result   := True;
   vLancaPD := nil;
   aImovel  := nil;
   cdsContratoxImovel := TCMClientDataSet.Create(nil);

   if (not vParamContabeis[0].bFlgIntegraContab) then Exit;

   vParamContabeis[0].iPlanilha := 0;
   try
     cdsContratoxImovel.Data := RetornaImoveisDocum(FCdsHistMovImob.FieldByName('IDCONTRATOIMOVEL').asInteger);
     try
      iRegistro := 0;
        for i := 0 to cdsContratoxImovel.RecordCount -1 do
        begin
          SetLength(aImovel, length(aImovel) + 1);
          aImovel[i] := cdsContratoxImovel.FieldByName('IDIMOVEL').AsInteger;
          cdsContratoxImovel.Next;
        end;


      _Cds.First;
      while not _Cds.eof do
      begin
         // Agrupa lancamentos que possuem a mesma parametrização ( = BJUNTA )
         bNovoLancto := True;
         for i := 0 to Length(vLancaPD)-1 do begin

            if (vParamContabeis[iRegistro].sContaContabilDebito  = vLancaPD[i].Parametros.sContaContabilDebito)  and
               (vParamContabeis[iRegistro].sSubContaDebito       = vLancaPD[i].Parametros.sSubContaDebito)       and
               (vParamContabeis[iRegistro].sCentroCustoDebito    = vLancaPD[i].Parametros.sCentroCustoDebito)    and
               (vParamContabeis[iRegistro].sContaContabilCredito = vLancaPD[i].Parametros.sContaContabilCredito) and
               (vParamContabeis[iRegistro].sSubContaCredito      = vLancaPD[i].Parametros.sSubContaCredito)      and
               (vParamContabeis[iRegistro].sCentroCustoCredito   = vLancaPD[i].Parametros.sCentroCustoCredito)   and
               (vParamContabeis[iRegistro].sHistoricoCtb         = vLancaPD[i].Parametros.sHistoricoCtb)         and
               (vParamContabeis[iRegistro].sHistoricoCapCar      = vLancaPD[i].Parametros.sHistoricoCapCar)      and
               (vParamContabeis[iRegistro].iExercicio            = vLancaPD[i].Parametros.iExercicio)            and
               (vParamContabeis[iRegistro].iPeriodo              = vLancaPD[i].Parametros.iPeriodo)              and
               (vParamContabeis[iRegistro].iIdRateioDocum        = vLancaPD[i].Parametros.iIdRateioDocum)        and
               (vParamContabeis[iRegistro].iCodDocumento         = vLancaPD[i].Parametros.iCodDocumento)         and
               (vParamContabeis[iRegistro].sContaDebCred         = vLancaPD[i].Parametros.sContaDebCred)         and
               (vParamContabeis[iRegistro].sContaResult          = vLancaPD[i].Parametros.sContaResult)          and
               (vParamContabeis[iRegistro].sCentroCustoResult    = vLancaPD[i].Parametros.sCentroCustoResult)    and
               (vParamContabeis[iRegistro].sSubContaResult       = vLancaPD[i].Parametros.sSubContaResult)       and
               (vParamContabeis[iRegistro].sCentroCustoDebCred   = vLancaPD[i].Parametros.sCentroCustoDebCred)   and
               (vParamContabeis[iRegistro].iUnidNegoc            = vLancaPD[i].Parametros.iUnidNegoc)            and
               (vParamContabeis[iRegistro].sSubContaDebCred      = vLancaPD[i].Parametros.sSubContaDebCred)      and
               (vParamContabeis[iRegistro].sCodTipRecDes         = vLancaPD[i].Parametros.sCodTipRecDes)         and
               (vParamContabeis[iRegistro].sCodCentroRespon      = vLancaPD[i].Parametros.sCodCentroRespon)      and
               (vParamContabeis[iRegistro].sTipCodigo            = vLancaPD[i].Parametros.sTipCodigo)            and
               (vParamContabeis[iRegistro].iIdSegregaCriter      = vLancaPD[i].Parametros.iIdSegregaCriter)      then begin

               bNovoLancto          := False;
               vLancaPD[i].VlrTotal := vLancaPD[i].VlrTotal + _cds.FieldByName('HMIVALOR').AsCurrency;
            end;
         end;


         if bNovoLancto then begin
            SetLength(vLancaPD,(Length(vLancaPD)+1) );
            i                         := High(vLancaPD);
            vLancaPD[i].Parametros    := vParamContabeis[iRegistro];
            vLancaPD[i].IdUsuario     := FiUsuario;
            vLancaPD[i].IdPlanoImovel := _cds.FieldByName('IDPLANOPREV').AsInteger;
            vLancaPD[i].IdPatroImovel := _cds.FieldByName('IDPATRO').AsInteger;
            vLancaPD[i].NoDocumento   := FCdsItensCalc.FieldByName('HMIDOCUMENTO').AsFloat;
            vLancaPD[i].dLancto       := FcdsHistMovImob.FieldByName('HMIDATAMOV').AsDateTime;
            vLancaPD[i].VlrTotal      := _cds.FieldByName('HMIVALOR').AsCurrency;
         end;

         _Cds.Next;
         inc(iRegistro);
      end;

      // Efetua o lançamento em partida dobrada
      for i := 0 to Length(vLancaPD) -1 do
      begin
         if i > 0 then vLancaPD[i].Parametros.iPlanilha := vLancaPD[0].Parametros.iPlanilha;

         Result := FazerLancamentoContab(vLancaPD[i].Parametros, '2',{2=Partida Dobrada}
                                         vLancaPD[i].dLancto,
                                         vLancaPD[i].NoDocumento,
                                         vLancaPD[i].VlrTotal,
                                         vLancaPD[i].IdUsuario,
                                         vLancaPD[i].IdPatroImovel,
                                           vLancaPD[i].IdPlanoImovel,
                                           aImovel[i]);
      end;

      if Result then
      begin
         for i := 0 to Length(vParamContabeis) -1 do
         begin
            vParamContabeis[i].iPlanilha := vLancaPD[0].Parametros.iPlanilha;
         end;
      end;
   except
      on e:exception do
      begin
         Result := False;
         MessageInfo := e.Message;
      end;
   end;
   finally
    FreeAndNil(cdsContratoxImovel);
   end;
end;



function TCtrlHistMovImob.IntegraContabilidade(var vParamContabeis: array of TParamContabeisMT): Boolean;
var
    iRegistro  : integer;
    fVlrLancto : extended;
begin
   Result := True;

   // Verifica se o lançamento não deve ser contabilizado - origem: Previsão não integra
   if (not vParamContabeis[0].bFlgIntegraContab) then Exit;

   vParamContabeis[0].iPlanilha := 0;
   
   try
      iRegistro := 0;
      _cds.First;
      while (not _cds.Eof) do
      begin

         if iRegistro > 0 then vParamContabeis[iRegistro].iPlanilha := vParamContabeis[0].iPlanilha;

         fVlrLancto := _cds.FieldByName('HMIVALOR').AsCurrency;

         Result := FazerLancamentoContab(vParamContabeis[iRegistro], '0', {0=Débito}
                                         FCdsHistMovImob.FieldByName('HMIDATAMOV').AsDateTime,
                                         FCdsItensCalc.FieldByName('HMIDOCUMENTO').AsFloat,
                                         fVlrLancto,
                                         FiUsuario,
                                         _cds.FieldByName('IDPATRO').AsInteger,
                                         _cds.FieldByName('IDPLANOPREV').AsInteger );

         if Result then
         begin
            Result := FazerLancamentoContab(vParamContabeis[iRegistro], '1', {0=Cédito}
                                            FCdsHistMovImob.FieldByName('HMIDATAMOV').AsDateTime,
                                            FCdsItensCalc.FieldByName('HMIDOCUMENTO').AsFloat,
                                            fVlrLancto,
                                            FiUsuario,
                                            _cds.FieldByName('IDPATRO').AsInteger,
                                            _cds.FieldByName('IDPLANOPREV').AsInteger );
         end;


         _cds.Next;
         inc(iRegistro);
      end;
   except
      on e:exception do
      begin
         Result      := False;
         MessageInfo :=  e.Message;
      end;
   end;
end;



function TCtrlHistMovImob.FazerLancamentoContab(var rParamContabeis: TParamContabeisMT; const sTipoLanc: char;
                                                const dLancto: TDateTime; const NumDoc, VlrLancto: Extended;
                                                const idUsuario, iIdPatroImovel, iIdPlanoImovel:Integer; iIdImovel : Integer): Boolean;
var
    sModulo         : string;
    iTestaPeriodo   : Integer;
    iEmpresa        : integer;
    sDataLancamento : string;
    bJunta          : Boolean;
    sCCustoD,
    sContaD,
    sCCustoC,
    sContaC         : string;
    iSubContaD,
    iSubContaC      : Integer;
    iIdPlanoPrev,
    iIdPatro        : Integer;
begin
   Result := True;
   try
      sDataLancamento := FormatDateTime('dd/mm/yyyy', dLancto);

      case StrtoInt(sTipoLanc) of
         0 : begin // Lançamento de Débito
                bJunta   := True;
                sCCustoD := rParamContabeis.sCentroCustoDebito;
                sContaD  := rParamContabeis.sContaContabilDebito;
                sCCustoC := '';
                sContaC  := '';
             end;
         1 : begin // Lançamento de Crédito
                bJunta   := True;
                sCCustoD := '';
                sContaD  := '';
                sCCustoC := rParamContabeis.sCentroCustoCredito;
                sContaC  := rParamContabeis.sContaContabilCredito;
             end;
         2 : begin // Lançamento em Partida Dobrada ( D/C )
                bJunta   := False;
                sCCustoD := rParamContabeis.sCentroCustoDebito;
                sContaD  := rParamContabeis.sContaContabilDebito;
                sCCustoC := rParamContabeis.sCentroCustoCredito;
                sContaC  := rParamContabeis.sContaContabilCredito;
             end;
      end;

      if iIdPatroImovel > 0 then iIdPatro := iIdPatroImovel
      else                       iIdPatro := CtrlParamIntegra.PatroGlobal;

      if iIdPlanoImovel > 0 then iIdPlanoPrev := iIdPlanoImovel
      else                       iIdPlanoPrev := CtrlParamIntegra.PlanoPrevGlobal;

      iSubContaD := 0;
      iSubContaC := 0;

      if rParamContabeis.sSubContaDebito <> ''  then iSubContaD := StrToInt(rParamContabeis.sSubContaDebito);
      if rParamContabeis.sSubContaCredito <> '' then iSubContaC := StrToInt(rParamContabeis.sSubContaCredito);

      //Cássio Camargo - 18/09/2008 - N. Sol 92381 -  N. Kintana 394180
      if CtrlImobLancamento.VerificaSegregacaoOrigem(aImovel) then
      begin
        CtrlImobLancamento.OpenTransaction := False;
        if not CtrlImobLancamento.InsereLancaContab(sTipoLanc,
                                                FiEmpresa,
                                                FiModulo,
                                                FiUsuario,
                                                CtrlParamIntegra.Plano,
                                                rParamContabeis.iUnidNegoc,
                                                iSubContaD,
                                                iSubContaC,
                                                iIdPlanoPrev,
                                                iIdPatro,
                                                rParamContabeis.iPlanilha, 0,
                                                sDataLancamento,
                                                FormatFloat('#0', NumDoc),
                                                rParamContabeis.sHistoricoCtb, '', '', '', '',
                                                rParamContabeis.sTipCodigo,
                                                sCCustoD, sContaD,
                                                sCCustoC, sContaC, '',
                                                VlrLancto, bJunta,
                                                FUsaPlanoPatro,
                                                rParamContabeis.iIdSegregaCriter, -1,
                                                -1, iIdImovel) then
           raise Exception.Create(CtrlImobLancamento.MessageInfo);
        if CtrlImobLancamento.RetornoPlnCodigo > 0 then
        begin
           rParamContabeis.iPlanilha := StrToInt(FloatToStr(CtrlImobLancamento.RetornoPlnCodigo));
           FcdsHistMovImob.Edit;
           FcdsHistMovImob.FieldByName('PLNCODIGO').AsInteger := rParamContabeis.iPlanilha;
           FcdsHistMovImob.Post;

           if not GravaHistMovImob then
              Raise Exception.Create(MessageInfo);
        end;
//      end
//      else
//      begin
//      CtrlLancamento.OpenTransaction := False;
//      if not CtrlLancamento.InsereLancaContab(sTipoLanc,
//                                              FiEmpresa,
//                                              FiModulo,
//                                              FiUsuario,
//                                              CtrlParamIntegra.Plano,
//                                              rParamContabeis.iUnidNegoc,
//                                              iSubContaD,
//                                              iSubContaC,
//                                              iIdPlanoPrev,
//                                              iIdPatro,
//                                              rParamContabeis.iPlanilha, 0,
//                                              sDataLancamento,
//                                              FormatFloat('#0', NumDoc),
//                                              rParamContabeis.sHistoricoCtb, '', '', '', '',
//                                              rParamContabeis.sTipCodigo,
//                                              sCCustoD, sContaD,
//                                              sCCustoC, sContaC, '',
//                                              VlrLancto, bJunta,
//                                              FUsaPlanoPatro,
//                                              rParamContabeis.iIdSegregaCriter) then
//         Raise Exception.Create(CtrlLancamento.MessageInfo);

//      if CtrlLancamento.RetornoPlnCodigo > 0 then
//      begin
//         rParamContabeis.iPlanilha := StrToInt(FloatToStr(CtrlLancamento.RetornoPlnCodigo));
//         FcdsHistMovImob.Edit;
//         FcdsHistMovImob.FieldByName('PLNCODIGO').AsInteger := rParamContabeis.iPlanilha;
//         FcdsHistMovImob.Post;

//         if not GravaHistMovImob then
//            Raise Exception.Create(MessageInfo);
//      end;
      end;
   except
      on e:exception do
      begin
         Result      := False;
         MessageInfo := e.Message
      end;
   end;
end;



function TCtrlHistMovImob.LookupValorRateadoPorImovel(const iIdHistMovImob: Integer): OleVariant;
var
   sSQL : String;
begin
   sSQL :=
   'SELECT'                                                                                     + #13 +
   '    I.CODTIPIMOVEL,'                                                                        + #13 +
   '    PPI.IDPATRO,'                                                                           + #13 +
   '    PPI.IDPLANOPREV,'                                                                       + #13 +
   '    SUM(HMI.HMIVALOR * ((CI.CIMVLRAJUSTADO / C.CONVLRAJUSTADO) * 100) / 100) AS HMIVALOR'   + #13 +
   'FROM'                                                                                       + #13 +
   '    IMOVEL I,'                                                                              + #13 +
   '    CONTRATOIMOVEL C,'                                                                      + #13 +
   '    CONTRATOXIMOVEL CI,'                                                                    + #13 +
   '    PLANOPATROXIMOVEL PPI,'                                                                 + #13 +
   '    CONDPAGIMOVEL CPI,'                                                                     + #13 +
   '    HISTMOVIMOB HMI'                                                                        + #13 +
   'WHERE'                                                                                      + #13 +
   '     I.IDIMOVEL           = CI.IDIMOVEL'                                                    + #13 +
   'AND HMI.IDHISTMOVIMOB     = ' + IntToStr(iIdHistMovImob)                                    + #13 +
   'AND CI.IDCONTRATOIMOVEL   = C.IDCONTRATOIMOVEL'                                             + #13 +
   'AND CPI.IDCONTRATOIMOVEL  = C.IDCONTRATOIMOVEL'                                             + #13 +
   'AND HMI.IDCONDPAGIMOVEL   = CPI.IDCONDPAGIMOVEL'                                            + #13 +
   'AND HMI.IDTIPOCUSTORECIMO <> HMI.IDITEMCENTRALIZA'                                          + #13 +
   'AND HMI.PLNCODIGO         IS NULL'                                                          + #13 +
   'AND PPI.IDIMOVEL(+)       = I.IDIMOVEL'                                                     + #13 +
   'GROUP BY'                                                                                   + #13 +
   '    I.CODTIPIMOVEL,'                                                                        + #13 +
   '    PPI.IDPATRO,'                                                                           + #13 +
   '    PPI.IDPLANOPREV'                                                                        + #13;

   Result := GetDataPacket(sSQL);
end;



function TCtrlHistMovImob.OraNumero(const sNumero: String): String;
var
   i              : Integer;
   sResult, sOra  : String;
   bPrimPonto     : Boolean;
begin
   sOra := '';
   bPrimPonto := False;

   for i := length(Trim(sNumero)) downto 1 do
   begin
      if sNumero[i] = ',' then
      begin
         if not bPrimPonto then
         begin
            sOra        := sOra + '.';
            bPrimPonto  := True;
         end
         else
         begin
            sOra := sOra;
         end;
      end
      else
      begin
         if sNumero[i] <> '.' then
         begin
            sOra := sOra + sNumero[i]
         end
         else
         begin
            if not bPrimPonto then
            begin
               sOra := sOra + '.';
               bPrimPonto := True;
            end
            else
            begin
               sOra := sOra;
            end;
         end;  // if sNumero[i] <> '.'
      end;  // if sNumero[i] = ','
   end;  // for i downto

   sResult := '';

   for i := length(sOra) downto 1 do
   begin
      sResult := sResult + sOra[i];
   end;

   Result := sResult;
end;



function TCtrlHistMovImob.DesfazContabilizacao(const iUsuario, iPlanilha, iModulo: Integer; const iNumLan: Integer; const bUsaPlanoPatro, bExcluiPlanilha, bTransacao: Boolean): Boolean;
begin
   Result := True;
   //Cássio Camargo - 18/09/2008 - N. Sol 92381 -  N. Kintana 394180
   //CtrlLancamento.OpenTransaction := bTransacao;
   CtrlImobLancamento.OpenTransaction := bTransacao;
   try
      //if not CtrlLancamento.ExcluiLancaContab(iUsuario,
      if not CtrlImobLancamento.ExcluiLancaContab(iUsuario,
                                              iPlanilha,
                                              iModulo,
                                              iNumLan,
                                              bUsaPlanoPatro,
                                              bExcluiPlanilha) then
      begin
         //MessageInfo := CtrlLancamento.MessageInfo;
         MessageInfo := CtrlImobLancamento.MessageInfo;
         Raise Exception.Create(MessageInfo);
      end;
   except
      on e:exception do
      begin
         Result      := False;
         MessageInfo := e.Message
      end;
   end;
end;



function TCtrlHistMovImob.LookupContratoConfessado(const iContrato: Integer): OleVariant;
var
   sSQL : String;
begin
   sSQL :=
   'SELECT'                                                        + #13 +
   '    CI.CONNUMERO || ''-'' || CI.CONNOME AS CONTRATO,'          + #13 +
   '    DOC.NODOCUMENTO,'                                          + #13 +
   '    DOC.DATAVENCTO,'                                           + #13 +
   '    LDO.VALOR'                                                 + #13 +
   'FROM'                                                          + #13 +
   '    CONTRATOIMOVEL CI,'                                        + #13 +
   '    CONFDIVIDAIMOB CD,'                                        + #13 +
   '    CONFDIVIDAIMOBXCONTR CC,'                                  + #13 +
   '    CONFDIVIDAIMOBXDOC CDD,'                                   + #13 +
   '    DOCUMENTO DOC,'                                            + #13 +
   '    LANCTODOCUM LDO'                                           + #13 +
   'WHERE'                                                         + #13 +
   '    CD.IDCONTRATORESULT  = ' + IntToStr(iContrato)             + #13 +
   'AND CC.IDCONFDIVIDAIMOB  = CD.IDCONFDIVIDAIMOB'                + #13 +
   'AND CI.IDCONTRATOIMOVEL  = CC.IDCONTRATOIMOVEL'                 + #13 +
   'AND CDD.IDCONFDIVIDAIMOB = CD.IDCONFDIVIDAIMOB'                + #13 +
   'AND CDD.IDCONTRATOIMOVEL   = CC.IDCONTRATOIMOVEL'                  + #13 +
   'AND DOC.CODDOCUMENTO     = CDD.CODDOCUMENTO'                   + #13 +
   'AND LDO.CODDOCUMENTO     = CDD.CODDOCUMENTO'                   + #13 +
   'AND LDO.NUMLANCTO        = CDD.IDLANCTODOCUMLIQ'               + #13 +
   'ORDER BY CONTRATO, NODOCUMENTO'                                + #13;

   Result := GetDataPacket(sSQL);
end;



function TCtrlHistMovImob.LookupConfissaoOperacoes(const iContrato, iCondPagImovel: Integer): OleVariant;
var
   sSQL : String;
begin
   sSQL :=
   'SELECT '                                                                            + #13 +
   '    TCR.DESCCUSTORECIMO, '                                                          + #13 +
   '    CDO.FLGTIPO, '                                                                  + #13 +
   '    DECODE(CDO.FLGTIPO, ''D'', ''Desconto'',''Acréscimo'') AS DESCTIPO,'            + #13 +
   '    CDO.VLROPERACAO, '                                                              + #13 +
   '    CDO.OBSERVACAO, '                                                               + #13 +
   '    CDO.FLGDESCCONDIC, '                                                            + #13 +
   '    DECODE(NVL(CDO.FLGDESCCONDIC,0), 0, ''Não'',''Sim'') AS DESCCOND,'              + #13 +
   '    CDO.IDCONFDIVIDAIMOB, '                                                         + #13 +
   '    CDO.IDTIPOCUSTORECIMO, '                                                        + #13 +
   '    CDO.IDCONDPAGIMOVEL, '                                                          + #13 +
   '    DECODE(CDO.IDCONDPAGIMOVEL,NULL,0,1) AS FLGESCOLHA,'                            + #13 +
   '    DECODE(CPI.TIPOCONDPAG,''P'',''Parcelamento'', ''S'',''Sinal'') AS CONDICAO,'   + #13 +
   '    CPI.VLRFINANC'                                                                  + #13 +
   'FROM '                                                                              + #13 +
   '    CONFDIVIDAIMOB CD, '                                                            + #13 +
   '    CONFDIVIDAIMOBXOPER CDO, '                                                      + #13 +
   '    TIPOCUSTORECIMOV TCR, '                                                         + #13 +
   '    CONDPAGIMOVEL CPI'                                                              + #13 +
   'WHERE '                                                                             + #13 +
   '    CDO.IDCONFDIVIDAIMOB  = CD.IDCONFDIVIDAIMOB '                                   + #13 +
   'AND TCR.IDTIPOCUSTORECIMO = CDO.IDTIPOCUSTORECIMO '                                 + #13 +
   'AND CDO.IDCONDPAGIMOVEL   = CPI.IDCONDPAGIMOVEL(+)'                                 + #13 +
   'AND CD.IDCONTRATORESULT   = ' + IntToStr(iContrato)                                 + #13;

   if iCondPagImovel > -1 then
      sSQL := sSQL + 'AND CDO.IDCONDPAGIMOVEL = ' + IntToStr(iCondPagImovel) + #13;

   Result := GetDataPacket(sSQL);
end;



function TCtrlHistMovImob.LookupSaldoDevedor(const iCondPag: Integer;const dDataMov: TDateTime): OleVariant;
var
   sSQL : String;
begin
   sSQL :=
   'SELECT'                                                                                                     + #13 +
   '    CP.IDCONDPAGIMOVEL,'                                                                                    + #13 +
   '    CP.VLRFINANC,'                                                                                          + #13 +
   '    HMI.TOTAL,'                                                                                             + #13 +
   '    NVL(DAT.DATAVENCIMENTO,CP.DATAVENCIMENTO) AS DATAVENCIMENTO, '                                          + #13 +
   '    NVL(PAR.PARCELA,0) AS PARCELA, '                                                                        + #13 +
   '    NVL(CP.VLRFINANC,0) + NVL(HMI.TOTAL,0) AS SALDODEVEDOR'                                                 + #13 +
   'FROM'                                                                                                       + #13 +
   '    CONDPAGIMOVEL CP,'                                                                                      + #13 +
   '    ('                                                                                                      + #13 +
   '      SELECT'                                                                                               + #13 +
   '          HMI.IDCONDPAGIMOVEL,'                                                                             + #13 +
   '          SUM(DECODE(FCX.TRATASALDODEV,1,HMI.HMIVALOR*-1,HMI.HMIVALOR)) AS TOTAL'                           + #13 +
   '      FROM'                                                                                                 + #13 +
   '          HISTMOVIMOB HMI,'                                                                                 + #13 +
   '          FORMACALCIMOBXITEM FCX,'                                                                          + #13 +
   '          CONDPAGIMOVEL CP'                                                                                 + #13 +
   '      WHERE'                                                                                                + #13 +
   '          HMI.IDCONDPAGIMOVEL      = ' + IntToStr(iCondPag)                                                 + #13 +
   '      AND HMI.HMIDATAMOV           <= TO_DATE(' + QuotedStr(FormatDateTime('dd/mm/yyyy',dDataMov)) + ',''DD/MM/YYYY'')' + #13 +
   '      AND CP.IDCONDPAGIMOVEL       = HMI.IDCONDPAGIMOVEL'                                                   + #13 +
   '      AND FCX.IDFORMACALCIMOB      = CP.IDFORMACALCIMOB'                                                    + #13 +
   '      AND FCX.IDTIPOCUSTORECIMO    = HMI.IDTIPOCUSTORECIMO'                                                 + #13 +
   '      AND NVL(FCX.TRATASALDODEV,0) <> 0'                                                                    + #13 +
   '      GROUP BY HMI.IDCONDPAGIMOVEL'                                                                         + #13 +
   '    ) HMI,'                                                                                                 + #13 +
   '    ('                                                                                                         + #13 +
   '     SELECT'                                                                                                   + #13 +
   '          HMI.IDCONDPAGIMOVEL,'                                                                                + #13 +
   '          MAX(LCI.DATAVENCIMENTO) AS DATAVENCIMENTO'                                                           + #13 +
   '      FROM'                                                                                                    + #13 +
   '          HISTMOVIMOB HMI,'                                                                                    + #13 +
   '          LANCAMENTOSIMOVEL LCI,'                                                                              + #13 +
   '          CONDPAGIMOVEL CP'                                                                                    + #13 +
   '      WHERE'                                                                                                   + #13 +
   '          HMI.IDCONDPAGIMOVEL      = ' + IntToStr(iCondPag)                                                    + #13 +
   '      AND HMI.HMIDATAMOV           < TO_DATE(' + QuotedStr(FormatDateTime('dd/mm/yyyy',dDataMov)) + ',''DD/MM/YYYY'')' + #13 +
   '      AND CP.IDCONDPAGIMOVEL       = HMI.IDCONDPAGIMOVEL'                                                      + #13 +
   '      AND LCI.IDDOCUMENTO          = HMI.HMIDOCUMENTO'                                                         + #13 +
   '      GROUP BY HMI.IDCONDPAGIMOVEL'                                                                            + #13 +
   '     ) DAT,'                                                                                                   + #13 +
   '    ('                                                                                                         + #13 +
   '     SELECT'                                                                                                   + #13 +
   '          HMI.IDCONDPAGIMOVEL,'                                                                                + #13 +
   '          MAX(HMI.HMIPARCELA) AS PARCELA'                                                                      + #13 +
   '      FROM'                                                                                                    + #13 +
   '          HISTMOVIMOB HMI,'                                                                                    + #13 +
   '          LANCAMENTOSIMOVEL LCI,'                                                                              + #13 +
   '          CONDPAGIMOVEL CP'                                                                                    + #13 +
   '      WHERE'                                                                                                   + #13 +
   '          HMI.IDCONDPAGIMOVEL      = ' + IntToStr(iCondPag)                                                    + #13 +
   '      AND LCI.DATAVENCIMENTO       <= TO_DATE(' + QuotedStr(FormatDateTime('dd/mm/yyyy',dDataMov)) + ',''DD/MM/YYYY'')' + #13 +
   '      AND CP.IDCONDPAGIMOVEL       = HMI.IDCONDPAGIMOVEL'                                                      + #13 +
   '      AND LCI.IDDOCUMENTO          = HMI.HMIDOCUMENTO'                                                         + #13 +
   '      GROUP BY HMI.IDCONDPAGIMOVEL'                                                                            + #13 +
   '     ) PAR'                                                                                                    + #13 +
   'WHERE'                                                                                                         + #13 +
   '    HMI.IDCONDPAGIMOVEL(+)  = CP.IDCONDPAGIMOVEL'                                                              + #13 +
   'AND DAT.IDCONDPAGIMOVEL(+)  = CP.IDCONDPAGIMOVEL'                                                              + #13 +
   'AND PAR.IDCONDPAGIMOVEL(+)  = CP.IDCONDPAGIMOVEL'                                                              + #13 +
   'AND CP.IDCONDPAGIMOVEL      = '  + IntToStr(iCondPag)                                                          + #13;

   Result := GetDataPacket(sSQL);
end;



function TCtrlHistMovImob.RetornaSaldoDevedor(const iCondPag: Integer; const dDataMov: TDateTime): Currency;
var
   cdsSaldoDev : TCMClientDataSet;
begin
   cdsSaldoDev := TCMClientDataSet.Create( nil );

   rSaldoDevedor := nil;
   SetLength(rSaldoDevedor,1);
   try
      cdsSaldoDev.Data := LookupSaldoDevedor(iCondPag,dDataMov);

      rSaldoDevedor[0].SaldoDevedor   := cdsSaldoDev.FieldByName('SALDODEVEDOR').AsCurrency;
      rSaldoDevedor[0].DataVencimento := cdsSaldoDev.FieldByName('DATAVENCIMENTO').AsCurrency;
      rSaldoDevedor[0].Parcela        := cdsSaldoDev.FieldByName('PARCELA').AsInteger;

      cdsSaldoDev.Data := LookupQtdInadimplencia(iCondPag,dDataMov);
      rSaldoDevedor[0].QtdeInadimp := cdsSaldoDev.FieldByName('TOT_INADIMP').AsInteger;

      Result := rSaldoDevedor[0].SaldoDevedor;
   finally
      FreeAndNil(cdsSaldoDev);
   end;
end;



function TCtrlHistMovImob.LookupQtdInadimplencia(const iCondPag: Integer; const dDataMov: TDateTime): OleVariant;
var
   sSQL : String;
begin
   sSQL :=
   'SELECT'                                                                                             + #13 +
   '   COUNT(*) AS TOT_INADIMP'                                                                         + #13 +
   'FROM'                                                                                               + #13 +
   '   ('                                                                                               + #13 +
   '    SELECT DISTINCT'                                                                                + #13 +
   '       LC.IDDOCUMENTO'                                                                              + #13 +
   '    FROM'                                                                                           + #13 +
   '       LANCAMENTOSIMOVEL LC,'                                                                       + #13 +
   '       ('                                                                                           + #13 +
   '        SELECT'                                                                                     + #13 +
   '             HMI.HMIDOCUMENTO,'                                                                     + #13 +
   '             MIN(LCI.DATALIMITE) AS DATALIMITE,'                                                    + #13 +
   '             MIN(REC.DATABAIXA) AS DATABAIXA'                                                       + #13 +
   '         FROM'                                                                                      + #13 +
   '             HISTMOVIMOB HMI,'                                                                      + #13 +
   '             LANCAMENTOSIMOVEL LCI,'                                                                + #13 +
   '             CONDPAGIMOVEL CP,'                                                                     + #13 +
   '             RECBTOPAGTO REC'                                                                       + #13 +
   '         WHERE'                                                                                     + #13 +
   '             HMI.IDCONDPAGIMOVEL      = ' + IntToStr(iCondPag)                                                    + #13 +
   '         AND HMI.HMIDATAMOV           < TO_DATE(' + QuotedStr(FormatDateTime('dd/mm/yyyy',dDataMov)) + ',''DD/MM/YYYY'')' + #13 +
   '         AND CP.IDCONDPAGIMOVEL       = HMI.IDCONDPAGIMOVEL'                                        + #13 +
   '         AND LCI.IDDOCUMENTO          = HMI.HMIDOCUMENTO'                                           + #13 +
   '         AND REC.CODDOCUMENTO(+)      = HMI.HMIDOCUMENTO'                                           + #13 +
   '         GROUP BY HMI.HMIDOCUMENTO'                                                                 + #13 +
   '        ) BX'                                                                                       + #13 +
   '    WHERE'                                                                                          + #13 +
   '        LC.IDDOCUMENTO = BX.HMIDOCUMENTO'                                                           + #13 +
   '    AND (BX.DATABAIXA IS NULL OR BX.DATABAIXA > LC.DATALIMITE)'                                     + #13 +
   '   ) DOC'                                                                                           + #13;

   Result := GetDataPacket(sSQL);

end;



function TCtrlHistMovImob.LookupValorDesconto(const iCondPag: Integer): OleVariant;
var
   sSQL : String;
begin
   sSQL :=
   'SELECT'                                                + #13 +
   '    NVL(SUM(VLROPERACAO),0) AS TOT_DESCONTO'           + #13 +
   'FROM'                                                  + #13 +
   '   CONFDIVIDAIMOBXOPER'                                + #13 +
   'WHERE'                                                 + #13 +
   '   IDCONDPAGIMOVEL      = ' + IntToStr(iCondPag)       + #13;

   Result := GetDataPacket(sSQL);
end;



function TCtrlHistMovImob.LookupCondicaoComDesconto(const iMes, iAno: Integer): OleVariant;
var
   sSQL                : String;
   sMes                : String;
   sAno                : String;

   iAnoV, iMesV, iDiaV : word;
   dVencimento         : TDateTime;
begin
   sAno    := IntToStr(iAno);
   sMes    := IntToStr(iMes);

   if Length(sMes)    = 1 then sMes    := '0' + sMes;

   dVencimento := StrToDate('01/'+ sMes + '/' + sAno);
   dVencimento := DiasUteis.SomaMeses(dVencimento,-1);
   DecodeDate(dVencimento,iAnoV, iMesV, iDiaV);

   sAno    := IntToStr(iAnoV);
   sMes    := IntToStr(iMesV);

   if Length(sMes)    = 1 then sMes    := '0' + sMes;

   sSQL :=
   'SELECT'                                                                                                     + #13 +
   '    CPI.IDCONDPAGIMOVEL,'                                                                                   + #13 +
   '    CPI.NUMPARCELAS + 1 AS NUMPARCELAS,'                                                                    + #13 +
   '    TO_DATE(TO_CHAR(CPI.DATAVENCIMENTO,''DD'') || ''/'' || TO_CHAR(CPI.DATAFIM + 30,''MM/YYYY''),''DD/MM/YYYY'') AS DATAVENCIMENTO,' + #13 +
   '    SUM(CDO.VLROPERACAO) AS VLRFINANC,'                                                                     + #13 +
   '    CPI.PRAZO,'                                                                                             + #13 +
   '    CPI.PERIODO,'                                                                                           + #13 +
   '    CPI.IDFORMACALCIMOB,'                                                                                   + #13 +
   '    CPI.IDCONTRATOIMOVEL,'                                                                                  + #13 +
   '    NVL(PF.CODFORMA,0) AS CODFORMA,'                                                                + #13 +
   '    CI.CONNUMERO,'                                                                                          + #13 +
   '    CI.CONNOME,'                                                                                            + #13 +
   '    CI.IDLOCATARIO,'                                                                                        + #13 +
   '    CI.MOECODIGO AS MOECODIGOCORRENTE'                                                                      + #13 +
   'FROM'                                                                                                       + #13 +
   '    CONTRATOIMOVEL CI,'                                                                                     + #13 +
   '    CONDPAGIMOVEL CPI,'                                                                                     + #13 +
   '    CONFDIVIDAIMOBXOPER CDO,'                                                                               + #13 +
   '    PORTADORFORMA PF'                                                                               + #13 +
   'WHERE'                                                                                                      + #13 +
   '    CI.IDCONTRATOIMOVEL = CPI.IDCONTRATOIMOVEL'                                                             + #13 +
   'AND CI.FLGTIPOCONTRATO = ''D'''                                                                             + #13 +
   'AND CDO.IDCONDPAGIMOVEL = CPI.IDCONDPAGIMOVEL'                                                              + #13 +
   'AND CI.CODPORTFORMA     = PF.CODPORTFORMA(+)'                                                       + #13 +
   'AND TO_CHAR(CPI.DATAFIM,''YYYYMM'') = ' + QuotedStr(sAno + sMes)                                            + #13 +
   'GROUP BY'                                                                                                   + #13 +
   '    CPI.IDCONDPAGIMOVEL,'                                                                                   + #13 +
   '    NUMPARCELAS,'                                                                                           + #13 +
   '    TO_DATE(TO_CHAR(CPI.DATAVENCIMENTO,''DD'') || ''/'' || TO_CHAR(CPI.DATAFIM + 30,''MM/YYYY''),''DD/MM/YYYY''),'  + #13 +
   '    CPI.PRAZO,'                                                                                             + #13 +
   '    CPI.PERIODO,'                                                                                           + #13 +
   '    CPI.IDFORMACALCIMOB,'                                                                                   + #13 +
   '    CPI.IDCONTRATOIMOVEL,'                                                                                  + #13 +
   '    PF.CODFORMA,'                                                                                           + #13 +
   '    CI.CONNUMERO,'                                                                                          + #13 +
   '    CI.CONNOME,'                                                                                            + #13 +
   '    CI.IDLOCATARIO,'                                                                                        + #13 +
   '    CI.MOECODIGO'                                                                                           + #13;

   
   Result := GetDataPacket(sSQL);
end;



function TCtrlHistMovImob.ExisteLancamentoNoPeriodo(const iMes : Integer; const iAno : Integer; const iContrato : Integer = -1) : Boolean;
var
   sSQL : String;
begin
   MessageInfo := '';

   sSQL :=
   'SELECT'                                                                                             + #13 +
   '   COUNT(L.IDCONTRATOIMOVEL) AS TOTAL'                                                              + #13 +
   'FROM'                                                                                               + #13 +
   '   LANCAMENTOSIMOVEL L,'                                                                            + #13 +
   '   CONTRATOIMOVEL    C'                                                                             + #13 +
   'WHERE'                                                                                              + #13 +
   '    L.IDCONTRATOIMOVEL = C.IDCONTRATOIMOVEL'                                                        + #13 +
   'AND C.FLGTIPOCONTRATO = ''D'''                                                                      + #13 +
   'AND L.ANOCOMPETENCIA = ' + IntToStr(iAno)                                                           + #13 +
   'AND L.MESCOMPETENCIA = ' + IntToStr(iMes)                                                           + #13;

   if iContrato <> -1 then
      sSQL := sSQL + 'AND L.IDCONTRATOIMOVEL = ' + IntToStr(iContrato) + #13;

   _cds.Data := GetDataPacket(sSQL);

   Result := (_cds.FieldByName('TOTAL').AsInteger > 0);

   if Result then MessageInfo := 'A competência informada já foi gerada';
end;



function TCtrlHistMovImob.RetornaImoveisDocum(iIDContratoImovel: Integer): OleVariant;
var
  sSQL : string;
begin
  sSQL := 'SELECT L.IDIMOVEL ' + #10#13 +
          '  FROM CONTRATOXIMOVEL C, ' + #10#13 +
          '       HISTMOVIMOB H, ' + #10#13 +
          '       LANCAMENTOSIMOVEL L ' + #10#13 +
          ' WHERE C.IDCONTRATOIMOVEL = L.IDCONTRATOIMOVEL ' + #10#13 +
          '   AND L.PLNCODIGO = H.PLNCODIGO ' + #10#13 +
          '   AND C.IDCONTRATOIMOVEL = ' + IntToStr(iIDContratoImovel);
  Result := GetDataPacket(sSQL);
end;                            
end.






