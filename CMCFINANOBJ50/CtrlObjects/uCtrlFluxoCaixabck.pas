unit uCtrlFluxoCaixa;

interface

uses sysutils, uCmControlObject, uCmDbObject, uSistema, DB, uDataBase, DbClient, uCMClientDataSet,
     uGeralFinanc, uCtrlFinanc, uCtrlListTercFinanc, uCtrlParamIntegra, uCtrlParamFinanc, Wwquery
     {$IFNDEF VERSAO0505} ,uCMTypes {$ENDIF};

type
   {TCoresLegenda = record
                      sCorRecComPrev  : String;
                      sCorRecSemPrev  : String;
                      sCorPgtoComPrev : String;
                      sCorPgtoSemPrev : String;
                   end;

   TParamFluxo = record
                    dDataInicial  : TDateTime;
                    dDataFinal    : TDateTime;
                    rUnidNeg      : Real;
                    sCentroResp   : String;
                    sCentroCusto  : String;
                    rIDPlanoPrev  : Real;
                    rIDPatro      : Real;
                    sQuebra       : String;
                    //sLegenda      : TCoresLegenda;
                 end;}

   TCtrlFluxoCaixa = Class(TCmControlObject)
   private
      GeralFinanc        : TGeralFinanc;
      CtrlListTerceiros  : TCtrlListTercFinanc;
      CtrlFinanc         : TCtrlFinanc;
      CtrlParamFinanc    : TCtrlParamFinanc;

      rCtrlIDPessoa      : Real;
      rCtrlIDModulo      : Real;
      rCtrlIDUsuario     : Real;
      bCtrlUsaPlanoPatro : Boolean;
      FMaxProgresso      : Longint;
      FMaxProgressoII    : Longint;
   public
      constructor Create(rIDPessoa,rIDModulo,rIDUsuario: Real; bUsaPlanoPatro: Boolean); reintroduce;
      destructor Destroy; override;

      property MaxProgresso: Longint read FMaxProgresso;
      property MaxProgressoII: Longint read FMaxProgresso;

      function GeraFluxoPrevisto(rSaldoInic: Real; dDataInicial,dDataFinal: TDateTime): Boolean;
      function GeraFluxoReal(dDataInicial,dDataFinal: TDateTime): Boolean;
      function GeraFluxoOrcOrcamen(rPeriodoInicial, rPeriodoFinal, rExercicio: Real): Boolean;
      function GeraMultiFluxoOrc(dDataInicial,dDataFinal: TDateTime;
                                 sFluxoOrigem, sFluxoDestino: String): Boolean;
      function CalculaSaldoInicFlxPrev(dDataRef: TDateTime): Real;
      function GeraSaldoInicialFluxo(sTipoFluxo: String; dDataRef: TDateTime;
                                     rUnidNeg, rIDPatro, rIDPlanoPrev: Real;
                                     sCentroCusto, sCentroRespon, sPrazo: String;
                                     bSaldoParcial: Boolean): Real;

      function MontaFiltroSalInicial(rUnidNeg, rIDPatro, rIDPlanoPrev: Real;
                                     sCentroCusto, sCentroRespon: String): String;

      function BuscaMinMaxDataFlxOrc(sPrazoFluxo: String): OleVariant;
      function ExcluiLancFlxOrc(dDataInicial,dDataFinal: TDateTime; sPrazoFluxo: String): Boolean;
      procedure BuscaDataPeriodo(var dDataPeriodo: TDateTime; bDataInicial: Boolean;
                                 rExercicio, rPeriodo: Real);

      //Rotinas da Consulta dos Fluxo de Caixa
      function GeraColunasFluxo(dDataInicial,dDataFinaL: TDateTime;
                                sAgrupamento: String; bExibSabDom: Boolean): OleVariant;
      {function GeraDadosFluxo(ParamFluxo: TParamFluxo; bGeraValores: Boolean;
                              sFluxo: String; sTipoBancoDados: String = 'ORA8I'): OleVariant;}

      function ListDatasMinMax(sFluxo, sCampoData: String): OleVariant;


   protected
      procedure DoChangeDataBase; override;
   end;


implementation

{ TCtrlFinanc }

uses Classes;

constructor TCtrlFluxoCaixa.Create(rIDPessoa, rIDModulo, rIDUsuario: Real;
  bUsaPlanoPatro: Boolean);
begin
   Inherited Create;

   FMaxProgresso:=0;
   
   rCtrlIDPessoa:=rIDPessoa;
   rCtrlIDModulo:=rIDModulo;
   rCtrlIDUsuario:=rIDUsuario;
   bCtrlUsaPlanoPatro:=bUsaPlanoPatro;

   GeralFinanc:=TGeralFinanc.Create;
   CtrlListTerceiros:=TCtrlListTercFinanc.Create;
   CtrlFinanc:=TCtrlFinanc.Create(rCtrlIDPessoa,rCtrlIDModulo,rCtrlIDUsuario,bCtrlUsaPlanoPatro);
   CtrlParamFinanc:=TCtrlParamFinanc.Create;
   ParamIntegra.GetParams(Trunc(rCtrlIDPessoa), 0, 'INTEGRACONTAB', 'PARAMFINANC', tiSistema);
end;

destructor TCtrlFluxoCaixa.Destroy;
begin
   GeralFinanc.Free;
   CtrlListTerceiros.Free;
   CtrlFinanc.Free;
   CtrlParamFinanc.Free;
   inherited;
end;

procedure TCtrlFluxoCaixa.DoChangeDataBase;
begin
   inherited;
   CtrlListTerceiros.Initialize(DataBase,True);
   CtrlFinanc.Initialize(DataBase,True);
   CtrlParamFinanc.Initialize(DataBase,True);
   GeralFinanc.Initialize(DataBase,True)
end;

//==============================================================================
// Fluxo Previsto
//==============================================================================

function TCtrlFluxoCaixa.GeraFluxoPrevisto(rSaldoInic: Real; dDataInicial,
  dDataFinal: TDateTime): Boolean;
var
   cdsAux            : TCMClientDataSet;
   cdsDocumento      : TCMClientDataSet;
   cdsOrcamento      : TCMClientDataSet;
   cdsInvestimento   : TCMClientDataSet;

   sCodTipRecDesAux  : String;
   sCentroResponAux  : String;
   sCentroResponGlb  : String;
   rUnidNegAux       : Real;
   rUnidNegGlb       : Real;
   rCodTipDocAux     : Real;
   rCodLancFinancAux : Real;
   rCodTipoDocInvest : Real;

   rTotalDocGeral    : Real;
   rTotalDocOMGeral  : Real;
   rTotalDocumento   : Real;
   rTotalDocOM       : Real;
   rDMais            : Real;
   rSaldoCorrente    : Real;
   rSaldoMoeda       : Real;
   rSaldoDoc         : Real;
   rSaldoDocOM       : Real;
   rCodDocSaldo      : Real;
   rValorCotacao     : Real;
   bLanca            : Boolean;
   dDataAux          : TDateTime;

begin
   MessageInfo:='';

   if ConnectionSide = cnsClient then
    begin
       Result:=Connection.AppServer.GeraFluxoPrevisto(rSaldoInic,dDataInicial,dDataFinal);
       if not Result then MessageInfo:=Connection.AppServer.MessageInfo;
    end
   else
    begin
       try
          cdsAux:=TCMClientDataSet.Create(nil);
          cdsDocumento:=TCMClientDataSet.Create(nil);
          cdsOrcamento:= TCMClientDataSet.Create(nil);
          cdsInvestimento:=TCMClientDataSet.Create(nil);

          try
             //Busca qualquer recebimento analítico a ser utilizado na gravação do Saldo Anterior
             cdsAux.Data:=CtrlListTerceiros.ListTipoRD(rCtrlIDPessoa,'R','A');
             sCodTipRecDesAux:=cdsAux.FieldByName('CODTIPRECDES').AsString;

             //Busca Tipo de Documento usado em Transfêrencias
             cdsAux.Close;
             cdsAux.Data:=CtrlParamFinanc.ListParamFinanc(rCtrlIDPessoa);
             rCodTipoDocInvest:=0;
             if (cdsAux.FieldByName('CODTIPDOCINVEST').AsFloat<>0) then
                rCodTipoDocInvest:=cdsAux.FieldByName('CODTIPDOCINVEST').AsFloat;

             //Busca Unidade de Negócio e Centro de Respon a serem utilizados na gravação do Saldo Anterior
             cdsAux.Close;
             cdsAux.Data:=CtrlListTerceiros.ListParamGlobal(rCtrlIDPessoa);
             rUnidNegGlb:=cdsAux.FieldByName('UNIDNEGOC').AsFloat;
             rUnidNegAux:=rUnidNegGlb;
             sCentroResponGlb:=cdsAux.FieldByName('CODCENTRORESPON').AsString;
             sCentroResponAux:=sCentroResponGlb;

             //Busca Código de Tipo de Documento a ser utilizado na gravação do Saldo Anterior
             cdsAux.Close;
             cdsAux.Data:=CtrlListTerceiros.ListTipoDoc('R');
             rCodTipDocAux:=cdsAux.FieldByName('CODTIPDOC').AsFloat;

             //Carrega cdsDocumento
             cdsDocumento.Data:=GetDataPacket('SELECT '+
                                              '   CODPORTFORMA, '+
                                              '   RECPAG, '+
                                              '   MOECODIGO, '+
                                              '   NUMFATURA, '+
                                              '   OPERACAO, '+
                                              '   CODDOCUMENTO, '+
                                              '   IDPESSOA, '+
                                              '   DATAPROGRAMADA '+
                                              'FROM '+
                                              '   DOCUMENTO '+
                                              'WHERE '+
                                              '   (STATUS <> ''2'') AND '+
                                              '   (DATAPROGRAMADA >= (TO_DATE (''' +
                                                   FormatDateTime('dd/mm/yyyy',dDataInicial)+ ''','+
                                              '    ''dd/mm/yyyy'')-10)) AND '+
                                              '   (DATAPROGRAMADA <= (TO_DATE (''' +
                                                   FormatDateTime('dd/mm/yyyy',dDataFinal)+ ''','+
                                              '    ''dd/mm/yyyy'')+10)) AND '+
                                              '   ((OPERACAO = ''1'') OR '+
                                              '    (OPERACAO = ''2'') OR '+
                                              '    (OPERACAO = ''3'') OR '+
                                              '    (OPERACAO = ''10'') OR '+
                                              '    (OPERACAO = ''11'') OR '+
                                              '    (OPERACAO = ''12'') OR '+
                                              '    (OPERACAO = ''13'') OR '+
                                              '    (OPERACAO = ''14'')) AND '+
                                              '    (IDPESSOA = '+FloatToStr(rCtrlIDPessoa)+') ');

             cdsOrcamento.Data:=GetDataPacket('SELECT '+
                                              '   IDCONTAORCAMEN, '+
                                              '   IDPLANOORCAMEN, '+
                                              '    DECODE(FLGRESCOMP,''C'', '+
                                              '           (VLRRESERVA - VLRCOMPROMISSO), '+
                                              '            VLRRESERVA) AS VALOR, '+
                                              '   DATAREFERENCIA, '+
                                              '   FLGRESCOMP '+
                                              'FROM '+
                                              '   RESERVAORCAMEN '+
                                              'WHERE '+
                                              '   ((FLGRESCOMP = ''C'' ) OR '+
                                              '    (FLGRESCOMP = ''R'' )) AND '+
                                              '   (FLGRESERVA = ''A'' ) AND '+
                                              '   (DATAREFERENCIA >= TO_DATE('+
                                                   FormatDateTime('dd/mm/yyyy',dDataInicial)+','+
                                                   '''DD/MM/YYYY'')) AND '+
                                              '   (DATAREFERENCIA <= TO_DATE('+
                                                   FormatDateTime('dd/mm/yyyy',dDataFinal)+','+
                                                   '''DD/MM/YYYY'')) AND '+
                                              '   (IDPESSOA = '+FloatToStr(rCtrlIDPessoa)+') ');

             cdsInvestimento.Data:=GetDataPacket('SELECT '+
                                                 '   SUM(DECODE(TIT.SALDOVLRRESGATE, '+
                                                 '       NULL, '+
                                                 '       DECODE(TIT.VLRRESGATE, '+
                                                 '              NULL,0,TIT.VLRRESGATE), '+
                                                 '       TIT.SALDOVLRRESGATE)) AS VALOR, '+
                                                 '       PLC.IDPADRLANCCONT, '+
                                                 '       TIT.DATAVENCTITRENFIX '+
                                                 'FROM '+
                                                 '   TITRENFIXA TIT, '+
                                                 '   CONTRATOINVESTIM CON, '+
                                                 '   TIPOCONTRINVEST TCO, '+
                                                 '   ETAPACONTRATOINV ETP, '+
                                                 '   TIPOOPERACAO TOP, '+
                                                 '   PADRLANCCONTINV PLC '+
                                                 'WHERE '+
                                                 '   (TIT.DATAVENCTITRENFIX >= TO_DATE('+
                                                      FormatDateTime('dd/mm/yyyy',dDataInicial)+','+
                                                      '''DD/MM/YYYY'')) AND '+
                                                 '    (TIT.DATAVENCTITRENFIX <= TO_DATE('+
                                                      FormatDateTime('dd/mm/yyyy',dDataFinal)+','+
                                                      '''DD/MM/YYYY'')) AND '+
                                                 '    (TIT.VLRRESGATE IS NOT NULL) AND '+
                                                 '    (TCO.IDTIPOINVEST = 1) AND '+
                                                 '    (TOP.NATUREZAOPERACAO = ''D'') AND '+
                                                 '    (TOP.IDTIPOOPERACAO > 0) AND '+
                                                 '    (PLC.IDTIPODESPINVEST IS NULL) AND '+
                                                 '    (PLC.IDFORCLI IS NULL) AND '+
                                                 '    (PLC.IDCARTEIRAINVEST IS NULL) AND '+
                                                 '    (TIT.IDTITRENFIXA = CON.IDINVESTIMENTO) AND '+
                                                 '    (CON.IDTIPOCONTRINVEST = TCO.IDTIPOCONTRINVEST) AND '+
                                                 '    (TCO.IDTIPOCONTRINVEST = ETP.IDTIPOCONTRINVEST) AND '+
                                                 '    (ETP.IDTIPOOPERACAO = TOP.IDTIPOOPERACAO) AND '+
                                                 '    (PLC.IDTIPOOPERACAO = TOP.IDTIPOOPERACAO) '+
                                                 'GROUP BY PLC.IDPADRLANCCONT, TIT.DATAVENCTITRENFIX ');

             if cdsInvestimento.IsEmpty then
              begin
                 if cdsOrcamento.IsEmpty then
                    FMaxProgresso:=cdsDocumento.RecordCount
                 else
                    FMaxProgresso:=cdsDocumento.RecordCount+cdsOrcamento.RecordCount;
              end
             else
              begin
                 if cdsOrcamento.IsEmpty then
                    FMaxProgresso:=cdsDocumento.RecordCount+cdsInvestimento.RecordCount
                 else
                    FMaxProgresso:=cdsDocumento.RecordCount+cdsOrcamento.RecordCount+
                                   cdsInvestimento.RecordCount;
              end;

             //Inicia Transação
             StartTransaction;

             //Limpa Fluxo Previsto
             Result:=ExecSQL('DELETE FLUXOPREVISTO WHERE (IDPESSOA = '+FloatToStr(rCtrlIDPessoa)+') ');
             if not(Result) then
              begin
                 Rollback;
                 Exit;
              end;

             Result:=CtrlFinanc.GravaFluxoPrev(sCentroResponAux,sCodTipRecDesAux,'R','N',
                                               StrToDate('01/01/1900'),rUnidNegAux,rSaldoInic,'',
                                               rCtrlIDPessoa,0,0,0,rCodTipDocAux);
             if not(Result) then
              begin
                 MessageInfo:=CtrlFinanc.MessageInfo;
                 Rollback;
                 Exit;
              end;

             Result:=CtrlFinanc.GravaFluxoPrev(sCentroResponAux,sCodTipRecDesAux,'R','N',
                                               dDataInicial-1,rUnidNegAux,rSaldoInic,'',rCtrlIDPessoa,
                                               0,0,0,rCodTipDocAux);
             if not(Result) then
              begin
                 MessageInfo:=CtrlFinanc.MessageInfo;
                 Rollback;
                 Exit;
              end;

             Result:=CtrlFinanc.GravaFluxoPrev(sCentroResponAux,sCodTipRecDesAux,'R','N',dDataInicial,
                                               rUnidNegAux,rSaldoInic,'',rCtrlIDPessoa,0,0,0,
                                               rCodTipDocAux);
             if not(Result) then
              begin
                 MessageInfo:=CtrlFinanc.MessageInfo;
                 Rollback;
                 Exit;
              end;

             Result:=CtrlFinanc.GravaFluxoPrev(sCentroResponAux,sCodTipRecDesAux,'R','N',dDataFinal,
                                               rUnidNegAux,rSaldoInic,'',rCtrlIDPessoa,0,0,0,
                                               rCodTipDocAux);
             if not(Result) then
              begin
                 MessageInfo:=CtrlFinanc.MessageInfo;
                 Rollback;
                 Exit;
              end;

             rCodLancFinancAux:=0;

             cdsDocumento.First;
             while not(cdsDocumento.Eof) do
             begin
                rTotalDocGeral:=0;
                rTotalDocOMGeral:=0;
                rTotalDocumento:=0;
                rTotalDocOM:=0;
                rDMais:=0;
                bLanca:=True;
                MessageInfo:='*';

                if (cdsDocumento.FieldByName('CODPORTFORMA').AsFloat<>0) then
                begin
                   cdsAux.Close;
                   cdsAux.Data:=GetDataPacket('SELECT DMAIS FROM PORTADORFORMA '+
                                              'WHERE (CODPORTFORMA = '+
                                              FloatToStr(cdsDocumento.FieldByName('CODPORTFORMA').AsFloat)+') ');

                   if (cdsDocumento.FieldByName('RECPAG').asString='P') then
                      rDMais:=cdsAux.FieldByName('DMAIS').AsFloat*(-1)
                   else
                      rDMais:=cdsAux.FieldByName('DMAIS').AsFloat;

                   if (cdsAux.FieldByName('DMAIS').AsFloat=999) then bLanca:=False;
                end;

                if bLanca then
                 begin
                    rCodDocSaldo:=cdsDocumento.FieldByName('CODDOCUMENTO').AsFloat;

                    //Gera Saldo do Documento
                    cdsAux.Close;
                    cdsAux.Data:=GetDataPacket('SELECT '+
                                               '   OPERACAO, '+
                                               '   DEBCRE, '+
                                               '   VALOR, '+
                                               '   VALOROUTRAMOEDA '+
                                               'FROM LANCTODOCUM '+
                                               'WHERE (CODDOCUMENTO = '+FloatToStr(rCodDocSaldo)+') ');
                    rSaldoCorrente:=0;
                    rSaldoMoeda:=0;
                    cdsAux.First;
                    while not(cdsAux.Eof) do
                    begin
                       if ((cdsDocumento.FieldByName('RECPAG').AsString='R') and
                           (cdsAux.FieldByName('DEBCRE').AsString='D')) or
                          ((cdsDocumento.FieldByName('RECPAG').AsString='P') and
                           (cdsAux.FieldByName('DEBCRE').AsString='C')) then
                        begin
                           rSaldoCorrente:=rSaldoCorrente+cdsAux.FieldByName('VALOR').AsFloat;
                           rSaldoMoeda:=rSaldoMoeda+cdsAux.FieldByName('VALOROUTRAMOEDA').AsFloat;
                        end
                       else
                        begin
                           rSaldoCorrente:=rSaldoCorrente-cdsAux.FieldByName('VALOR').AsFloat;
                           rSaldoMoeda:=rSaldoMoeda-cdsAux.FieldByName('VALOROUTRAMOEDA').AsFloat;
                        end;
                       cdsAux.Next;
                    end;
                    
                    dDataAux:=(cdsDocumento.FieldByName('DATAPROGRAMADA').AsDateTime+rDMais);
                    //Corrige a Data caso a mesma seja de um Sábado ou de um Domingo
                    if (DayOfWeek(dDataAux)=1) then dDataAux:=dDataAux+1;
                    if (DayOfWeek(dDataAux)=7) then dDataAux:=dDataAux+2;

                    if (cdsDocumento.FieldByName('MOECODIGO').AsFloat<>0) then
                     begin
                        GeralFinanc.TestaCotacaoMoeda(cdsDocumento.FieldByName('MOECODIGO').AsFloat,
                                                      dDataAux,False,rValorCotacao);
                     end;

                    if (dDataAux<dDataInicial) then dDataAux:=(dDataInicial-1);

                    if (dDataAux<=dDataFinal) then
                     begin
                        if (cdsDocumento.FieldByName('OPERACAO').AsInteger) in ([1,2,10,11,12,14]) then
                         begin
                            CtrlFinanc.FazerAcumulaRateio(cdsDocumento.FieldByName('CODDOCUMENTO').AsFloat,
                                                         rTotalDocumento,rTotalDocOM);

                            rTotalDocGeral  :=rTotalDocumento;
                            rTotalDocOMGeral:=rTotalDocOM;

                            Result:=CtrlFinanc.FazerRateioDocum(0,
                                                    cdsDocumento.FieldByName('CODDOCUMENTO').AsFloat,
                                                    dDataAux,rTotalDocGeral,rTotalDocOMGeral,
                                                    rSaldoCorrente,rSaldoMoeda,rValorCotacao,
                                                    rCtrlIDPessoa,ParamIntegra.Plano,rCodLancFinancAux,
                                                    'FP','','');

                            if not(Result) then
                             begin
                                MessageInfo:=CtrlFinanc.MessageInfo;
                                Rollback;
                                Exit;
                             end;
                         end
                        else
                         begin
                            cdsAux.Close;
                            cdsAux.Data:=GetDataPacket('SELECT '+
                                                       '   D.CODDOCUMENTO, '+
                                                       '   L.VALOR, '+
                                                       '   L.VALOROUTRAMOEDA '+
                                                       'FROM '+
                                                       '   DOCUMENTO D, '+
                                                       '   LANCTODOCUM L '+
                                                       'WHERE '+
                                                       '   (D.NUMFATURA = '+
                                                       cdsDocumento.FieldByName('NUMFATURA').AsString+
                                                       '    ) AND '+
                                                       '   ((RTRIM(D.OPERACAO) = ''1'') OR '+
                                                       '    (RTRIM(D.OPERACAO) = ''11'')) AND '+
                                                       '   (D.CODDOCUMENTO = L.CODDOCUMENTO) AND '+
                                                       '   (D.OPERACAO = L.OPERACAO)');
                            rTotalDocGeral:=0;
                            rTotalDocOMGeral:=0;

                            cdsAux.First;  //Faturas
                            while not(cdsAux.Eof) do
                            begin
                               rTotalDocumento:=0;
                               rTotalDocOM:=0;

                               CtrlFinanc.FazerAcumulaRateio(
                                               cdsAux.FieldByName('CODDOCUMENTO').AsFloat,
                                               rTotalDocumento,rTotalDocOM);

                               rTotalDocGeral  :=rTotalDocGeral+rTotalDocumento;
                               rTotalDocOMGeral:=rTotalDocOMGeral+rTotalDocOM;
                               cdsAux.Next;
                            end;  //Fim Faturas

                            cdsAux.First; //Faturas
                            while not(cdsAux.Eof) do
                            begin
                               if (rTotalDocGeral<>0) then
                                  rSaldoDoc:=(cdsAux.FieldByName('VALOR').asFloat*
                                              rSaldoCorrente)/rTotalDocGeral
                               else
                                  rSaldoDoc:=rSaldoCorrente;

                               if rTotalDocOMGeral <> 0 then
                                  rSaldoDocOM:=(cdsAux.FieldByName('VALOROUTRAMOEDA').asFloat*
                                                rSaldoMoeda)/rTotalDocOMGeral
                               else
                                  rSaldoDocOM:=rSaldoMoeda;

                               rSaldoDoc:=StrToFloat(Format('%17.2f',[rSaldoDoc]));
                               rSaldoDocOM:=StrToFloat(Format('%17.2f',[rSaldoDocOM]));

                               Result:=CtrlFinanc.FazerRateioDocum(0,
                                                       cdsAux.FieldByName('CODDOCUMENTO').AsFloat,
                                                       dDataAux,rTotalDocGeral,rTotalDocOMGeral,
                                                       rSaldoDoc,rSaldoDocOM,rValorCotacao,
                                                       rCtrlIDPessoa,ParamIntegra.Plano,
                                                       rCodLancFinancAux,'FP','','');
                               if not(Result) then
                                begin
                                   MessageInfo:=CtrlFinanc.MessageInfo;
                                   Rollback;
                                   Exit;
                                end;

                               cdsAux.Next;
                            end;  //Fim Faturas

                         end;
                     end;
                 end;
                cdsDocumento.Next;
             end;

             cdsOrcamento.First;
             while not(cdsOrcamento.Eof) do
             begin
                cdsAux.Close;
                MessageInfo:='*';
                
                cdsAux.Data:=GetDataPacket('SELECT '+
                                           '   P.NUMLINHAS, '+
                                           '   C.CODTIPRECDES, '+
                                           '   C.RECPAG, '+
                                           '   C.CODCENTRORESPON, '+
                                           '   C.UNIDNEGOC, '+
                                           '   C.CODCENTROCUSTO, '+
                                           '   C.IDPATRO, '+
                                           '   C.IDPLANOPREV, '+
                                           '   C.CODTIPDOC '+
                                           'FROM '+
                                           '   COMPCONTASORCAMEN C, '+
                                           '   (SELECT COUNT(*) AS NUMLINHAS '+
                                           '    FROM COMPCONTASORCAMEN '+
                                           '    WHERE (IDPLANOORCAMEN = :PLANOORC) AND '+
                                           '          (IDCONTAORCAMEN = :CONTAORC)) P '+
                                           'WHERE '+
                                           '   (C.IDPLANOORCAMEN = '+
                                           FloatToStr(cdsOrcamento.FieldByName('IDPLANOORCAMEN').AsFloat)+') AND '+
                                           '   (C.IDCONTAORCAMEN = '+
                                           FloatToStr(cdsOrcamento.FieldByName('IDPLANOORCAMEN').AsFloat)+')');

                dDataAux:=cdsOrcamento.FieldByName('DATAREFERENCIA').asDateTime;
                //Corrige a Data caso a mesma seja de um Sábado ou de um Domingo
                if (DayOfWeek(dDataAux)=1) then dDataAux:=dDataAux+1;
                if (DayOfWeek(dDataAux)=7) then dDataAux:=dDataAux+2;

                cdsAux.First;  //Composição
                while not(cdsAux.Eof) do
                begin

                   rSaldoCorrente:=(cdsOrcamento.FieldByName('VALOR').AsFloat/
                                    cdsAux.FieldByName('NUMLINHAS').AsFloat);

                   if cdsAux.FieldByName('CODCENTRORESPON').isNull then
                      sCentroResponAux:=sCentroResponGlb
                   else
                      sCentroResponAux:=cdsAux.FieldByName('CODCENTRORESPON').AsString;

                   if cdsAux.FieldByName('UNIDNEGOC').isNull then
                      rUnidNegAux:=rUnidNegGlb
                   else
                      rUnidNegAux:=cdsAux.FieldByName('UNIDNEGOC').AsFloat;

                   Result:=CtrlFinanc.GravaFluxoPrev(sCentroResponAux,
                                                     cdsAux.FieldByName('CODTIPRECDES').AsString,
                                                     cdsAux.FieldByName('RECPAG').AsString,'S',
                                                     dDataAux,rUnidNegAux,rSaldoCorrente,
                                                     cdsAux.FieldByName('CODCENTROCUSTO').AsString,
                                                     rCtrlIDPessoa,0,
                                                     cdsAux.FieldByName('IDPATRO').AsFloat,
                                                     cdsAux.FieldByName('IDPLANOPREV').AsFloat,
                                                     cdsAux.FieldByName('CODTIPDOC').AsFloat);
                   if not(Result) then
                    begin
                       MessageInfo:=CtrlFinanc.MessageInfo;
                       Rollback;
                       Exit;
                    end;

                   cdsAux.Next;
                end; //Fim Composição
                cdsOrcamento.Next;
             end;

             cdsInvestimento.First;
             while not(cdsInvestimento.Eof) do
             begin
                cdsAux.Close; //Composição Investimento
                MessageInfo:='*';
                
                cdsAux.Data:=GetDataPacket('SELECT CODTIPRECDES, RECPAG, UNIDNEGOC, CODCENTRORESPON '+
                                           'FROM PADRLANCCONTINV '+
                                           'WHERE (IDPADRLANCCONT = '+
                                           FloatToStr(cdsInvestimento.FieldByName('IDPADRLANCCONT').AsFloat)+') ');

                if not(cdsAux.IsEmpty) then
                 begin
                    dDataAux:=cdsInvestimento.FieldByName('DATAVENCTITRENFIX').asDateTime;

                   if (DayOfWeek(dDataAux)=1) then dDataAux:=dDataAux+1;
                   if (DayOfWeek(dDataAux)=7) then dDataAux:=dDataAux+2;

                   if cdsAux.FieldByName('RECPAG').AsString = 'P' then
                      rSaldoCorrente:=cdsInvestimento.FieldByName('VALOR').AsFloat*-1
                   else
                      rSaldoCorrente:=cdsInvestimento.FieldByName('VALOR').AsFloat;

                   if cdsAux.FieldByName('CODCENTRORESPON').isNull then
                      sCentroResponAux:=sCentroResponGlb
                   else
                      sCentroResponAux:=cdsAux.FieldByName('CODCENTRORESPON').AsString;

                   if cdsAux.FieldByName('UNIDNEGOC').isNull then
                      rUnidNegAux:=rUnidNegGlb
                   else
                      rUnidNegAux:=cdsAux.FieldByName('UNIDNEGOC').AsFloat;

                   Result:=CtrlFinanc.GravaFluxoPrev(sCentroResponAux,
                                                     cdsAux.FieldByName('CODTIPRECDES').AsString,
                                                     cdsAux.FieldByName('RECPAG').AsString,'S',
                                                     dDataAux,rUnidNegAux,rSaldoCorrente,'',
                                                     rCtrlIDPessoa,0,0,0,rCodTipoDocInvest);
                   if not(Result) then
                    begin
                       MessageInfo:=CtrlFinanc.MessageInfo;
                       Rollback;
                       Exit;
                    end;
                 end;
                cdsInvestimento.Next;
             end;

             Commit;
          finally
             cdsAux.Free;
             cdsDocumento.Free;
             cdsOrcamento.Free;
             cdsInvestimento.Free;
          end;
       except
          on E:Exception do
          begin
             Result := False;
             MessageInfo := E.Message;
             Rollback;
          end;
       end;
    end;
end;

function TCtrlFluxoCaixa.CalculaSaldoInicFlxPrev(dDataRef: TDateTime): Real;
var
   sSql   : String;
   cdsAux : TCMClientDataSet;
begin
   sSql:='SELECT '+
         '   SUM(DECODE(M.ENTRADASAIDA,''S'',-M.VALORLANCFINAN, '+
         '       M.VALORLANCFINAN)) AS SALDO '+
         'FROM   MOVIMFINANC M '+
         'WHERE '+
         '   (M.DATALANCFINAN <=TO_DATE('''+
              FormatDateTime('dd/mm/yyyy',dDataRef)+''',''DD/MM/YYYY'')) AND '+
         '   (M.STATUSCONCILIA NOT IN (''C'')) AND '+
         '   (M.IDPESSOA = '+FloatToStr(rCtrlIDPessoa)+') ';

   cdsAux:=TCMClientDataSet.Create(nil);
   try
      cdsAux.Data:=GetDataPacket(sSql);
      Result:=cdsAux.FieldByName('SALDO').AsFloat;
   finally
      cdsAux.Free;
   end;
end;

//==============================================================================
// Fluxo Real
//==============================================================================

function TCtrlFluxoCaixa.GeraFluxoReal(dDataInicial,
  dDataFinal: TDateTime): Boolean;
var
   rMoedaCorrAux : Real;
   rMoedaCorr    : Real;
   rValor        : Real;
   cdsRateio : TCMClientDataSet;
begin
   MessageInfo:='';
   FMaxProgresso:=0;

   if ConnectionSide = cnsClient then
    begin
       Result:=Connection.AppServer.GeraFluxoReal(dDataInicial,dDataFinal);
       if not Result then MessageInfo:=Connection.AppServer.MessageInfo;
    end
   else
    begin
       try
          with TCMClientDataSet.Create(nil) do
          try
             Data:=CtrlListTerceiros.ListParamGlobal(rCtrlIDPessoa);
             rMoedaCorrAux:=FieldByName('MOEDACORRENTE').AsFloat;
          finally
             Free;
          end;

          //Inicia Transação
          StartTransaction;

          //Limpa Fluxo Real
          Result:=ExecSQL('DELETE FLUXOREAL '+
                          'WHERE (DATACFLOAT >= TO_DATE (''' +
                          FormatDateTime('dd/mm/yyyy',dDataInicial)+''',''dd/mm/yyyy'')) AND '+
                          '      (DATACFLOAT <= TO_DATE (''' +
                          FormatDateTime('dd/mm/yyyy',dDataFinal)+''',''dd/mm/yyyy'')) AND '+
                          '      (IDPESSOA = '+FloatToStr(rCtrlIDPessoa)+') ');

         if not(Result) then
          begin
             Rollback;
             Exit;
          end;

         cdsRateio:=TCMClientDataSet.Create(nil);
         try
            cdsRateio.Data:=GetDataPacket('SELECT '+
                                          '   R.*, '+
                                          '   M.DATALANCFINAN '+
                                          'FROM '+
                                          '   RATEIOFINANC R, '+
                                          '   MOVIMFINANC M, '+
                                          '   PORTADORCONTA C '+
                                          'WHERE '+
                                          '   (M.CODLANCFINANC = R.CODLANCFINANC) AND '+
                                          '   (M.DATALANCFINAN <= TO_DATE ('''+
                                          FormatDateTime('dd/mm/yyyy',dDataFinal)+
                                                         ''',''dd/mm/yyyy'')) AND  '+
                                          '   (M.DATALANCFINAN >= TO_DATE ('''+
                                          FormatDateTime('dd/mm/yyyy',dDataInicial)+
                                                         ''',''dd/mm/yyyy'')) AND '+
                                          '   (R.IDPESSOA = '+FloatToStr(rCtrlIDPessoa)+') AND '+
                                          '   (M.CODPORTADOR = C.CODPORTADOR) AND '+
                                          '   ((C.FLGGRAVAFLUXO = ''S'') OR '+
                                          '    (C.FLGGRAVAFLUXO IS NULL)) ');

            FMaxProgresso:=cdsRateio.RecordCount;

            cdsRateio.First;
            while not(cdsRateio.Eof)do
            begin
               MessageInfo:='*';
               if (cdsRateio.FieldByName('MOECODIGO').AsFloat<>0) then
                begin
                   rMoedaCorr:=cdsRateio.FieldByName('MOECODIGO').AsFloat;
                   rValor:=cdsRateio.FieldByName('VALOROUTRAMOEDA').AsFloat;
                end
               else
                begin
                   rMoedaCorr:=rMoedaCorrAux;
                   rValor:=cdsRateio.FieldByName('VALOR').AsFloat;
                end;

               Result:=CtrlFinanc.GravaFluxoReal(cdsRateio.FieldByName('CODCENTRORESPON').AsString,
                                                 cdsRateio.FieldByName('CODTIPRECDES').AsString,
                                                 cdsRateio.FieldByName('RECPAG').AsString,
                                                 cdsRateio.FieldByName('CODCENTROCUSTO').AsString,
                                                 cdsRateio.FieldByName('DATALANCFINAN').AsDateTime,
                                                 rMoedaCorr,
                                                 cdsRateio.FieldByName('UNIDNEGOC').AsFloat,
                                                 rValor,
                                                 rCtrlIDPessoa,
                                                 cdsRateio.FieldByName('IDPROGRAMA').AsFloat,
                                                 cdsRateio.FieldByName('IDPATRO').AsFloat,
                                                 cdsRateio.FieldByName('IDPLANOPREV').AsFloat,
                                                 cdsRateio.FieldByName('CODTIPDOC').AsFloat);
               if not(Result) then
                begin
                   MessageInfo:=CtrlFinanc.MessageInfo;
                   Rollback;
                   Exit;
                end;

               cdsRateio.Next;
            end;

            //Finaliza Transação
            Commit;

         finally
            cdsRateio.Free;
         end;
       except
          on E:Exception do
          begin
             Result := False;
             MessageInfo := E.Message;
             Rollback;
          end;
       end;
    end;
end;

//==============================================================================
// Fluxo Orçado
//==============================================================================

function TCtrlFluxoCaixa.BuscaMinMaxDataFlxOrc(sPrazoFluxo: String): OleVariant;
begin
   Result:=GetDataPacket('SELECT '+
                         '   Min(FOrc.DataProgramada) AS DtMenor, '+
                         '   Max(FOrc.DataProgramada) AS DtMaior '+
                         'FROM '+
                         '   FluxoOrcado FOrc '+
                         'WHERE '+
                         '   (FOrc.Prazo= '''+sPrazoFluxo+''') AND '+
                         '   (FOrc.IDPESSOA = '+FloatToStr(rCtrlIDPessoa)+') ');
end;

function TCtrlFluxoCaixa.GeraMultiFluxoOrc(dDataInicial,dDataFinal: TDateTime;
                                           sFluxoOrigem, sFluxoDestino: String): Boolean;
var
   sSql : String;
begin
   MessageInfo:='';
   try
      //Testa se existe dados no Flx Previsto a serem transportados para o fluxo orçado
      if (sFluxoOrigem='PRV') then
         with TCMClientDataSet.Create(nil) do
         try
            Data:=GetDataPacket('SELECT Count(*) AS NUMREG '+
                                'FROM FluxoPrevisto '+
                                'WHERE (IDPESSOA = '+FloatToStr(rCtrlIDPessoa)+') AND '+
                                '      (DATAPROGRAMADA >= To_Date('''+
                                FormatDateTime('dd/mm/yyyy',dDataInicial)+''', ''dd/mm/yyyy'')) AND '+
                                '      (DATAPROGRAMADA <= To_Date('''+
                                FormatDateTime('dd/mm/yyyy',dDataFinal)+''',''dd/mm/yyyy'')) ');
            if (FieldByName('NUMREG').AsFloat<1) then
             begin
                MessageInfo:='Não existe nenhum Lançamento no Fluxo Previsto neste Período';
                Result:=False;
                Exit;
             end;
         finally
            Free;
         end;

      StartTransaction;
      //
      // Exclui Lancamentos do Fluxo de Destino para o período solicitado
      //
      Result:=ExcluiLancFlxOrc(dDataInicial,dDataFinal,sFluxoDestino);

      if not(Result) then
       begin
          Rollback;
          Exit;
       end;

      //
      // Cria novos Lancamentos no Fluxo de Destino para o período solicitado
      //
      sSql:='INSERT INTO FluxoOrcado FDest (FDest.IDPESSOA, '+
            '                            FDest.DATAPROGRAMADA, '+
            '                            FDest.CODTIPRECDES, '+
            '                            FDest.RECPAG, '+
            '                            FDest.UNIDNEGOC, '+
            '                            FDest.CODCENTRORESPON, '+
            '                            FDest.PRAZO, '+
            '                            FDest.MOECODIGO, '+
            '                            FDest.VALOR, '+
            '                            FDest.VALOROUTRAMOEDA, '+
            '                            FDest.LOTETRANSMISSAO, '+
            '                            FDest.IDEMPRESA, '+
            '                            FDest.CODCENTROCUSTO, '+
            '                            FDest.IDFLUXOORCADO, '+
            '                            FDest.FLGSIMULAATIVO, '+
            '                            FDest.IDPLANOPREV, '+
            '                            FDest.IDPATRO, '+
            '                            FDest.IDPROGRAMA, '+
            '                            FDest.CODTIPDOC) '+
            '                     SELECT FOrig.IDPESSOA, '+
            '                            FOrig.DATAPROGRAMADA, '+
            '                            FOrig.CODTIPRECDES, '+
            '                            FOrig.RECPAG, '+
            '                            FOrig.UNIDNEGOC, '+
            '                            FOrig.CODCENTRORESPON, '+
            '                            '''+sFluxoDestino+''' AS PRAZO, ';

      if (sFluxoOrigem='PRV') then
          sSql:=sSql+'                            NULL AS MOECODIGO, '
      else
          sSql:=sSql+'                            FOrig.MOECODIGO, ';

      sSql:=sSql+'                            FOrig.VALOR, ';

      if (sFluxoOrigem='PRV') then
          sSql:=sSql+'                            NULL AS VALOROUTRAMOEDA, '+
                     '                            NULL AS LOTETRANSMISSAO, '
      else
          sSql:=sSql+'                            FOrig.VALOROUTRAMOEDA, '+
                     '                            FOrig.LOTETRANSMISSAO, ';

      sSql:=sSql+'                            FOrig.IDEMPRESA, '+
                 '                            FOrig.CODCENTROCUSTO, '+
                 '                            SeqFluxoOrcado.NextVal AS IDFLUXOORCADO, ';

      if (sFluxoOrigem='PRV') then
          sSql:=sSql+'                            NULL AS FLGSIMULAATIVO, '
      else
          sSql:=sSql+'                            FOrig.FLGSIMULAATIVO, ';

      sSql:=sSql+'                            FOrig.IDPLANOPREV, '+
                 '                            FOrig.IDPATRO, '+
                 '                            FOrig.IDPROGRAMA, '+
                 '                            FOrig.CODTIPDOC ';

      if (sFluxoOrigem='PRV') then
         sSql:=sSql+'                      FROM FluxoPrevisto FOrig '+
                    '                      WHERE '
      else
         sSql:=sSql+'                      FROM FluxoOrcado FOrig '+
                    '                      WHERE (FOrig.Prazo= '''+sFluxoOrigem+''') AND ';

      sSql:=sSql+'                            (FOrig.IDPESSOA = '+FloatToStr(rCtrlIDPessoa)+') AND '+
                 '                            (FOrig.DataProgramada >= To_Date('''+
                                               FormatDateTime('dd/mm/yyyy',dDataInicial)+
                                              ''', ''dd/mm/yyyy'')) AND '+
                 '                            (FOrig.DataProgramada <= To_Date('''+
                                              FormatDateTime('dd/mm/yyyy',dDataFinal)+
                                              ''',''dd/mm/yyyy'')) ';

      Result:=ExecSQL(sSql);

      if not(Result) then
       begin
          Rollback;
          Exit;
       end;

      Commit;
   except
      on E:Exception do
      begin
         Result := False;
         MessageInfo := E.Message;
         Rollback;
      end;
   end;
end;

function TCtrlFluxoCaixa.ExcluiLancFlxOrc(dDataInicial,
  dDataFinal: TDateTime; sPrazoFluxo: String): Boolean;
begin
   Result:=ExecSQL('DELETE FluxoOrcado FOrc '+
                   'WHERE (FOrc.IDPESSOA = '+FloatToStr(rCtrlIDPessoa)+') AND '+
                   '      (FOrc.Prazo= '''+sPrazoFluxo+''') AND '+
                   '      (FOrc.DataProgramada >= To_Date( '''+
                   FormatDateTime('dd/mm/yyyy',dDataInicial)+''',''dd/mm/yyyy'')) AND '+
                   '      (FOrc.DataProgramada <= To_Date( '''+
                   FormatDateTime('dd/mm/yyyy',dDataFinal)+''', ''dd/mm/yyyy'')) ');
end;

function TCtrlFluxoCaixa.GeraFluxoOrcOrcamen(rPeriodoInicial,
  rPeriodoFinal, rExercicio: Real): Boolean;
var
   dDataInicial   : TDateTime;
   dDataFinal     : TDateTime;
   sCResponGlobal : String;
   sCResponAux    : String;
   rUnidNegGlobal : Real;
   rUnidNegAux    : Real;
   cdsSaldo       : TCMClientDataSet;
   cdsComposicao  : TCMClientDataSet;   
begin
   MessageInfo:='';
   
   try
      with TCMClientDataSet.Create(nil) do
      try
         //Busca Parâmetros Globais
         Data:=CtrlListTerceiros.ListParamGlobal(rCtrlIDPessoa);
         sCResponGlobal:=FieldByName('CODCENTRORESPON').AsString;
         rUnidNegGlobal:=FieldByName('UNIDNEGOC').AsFloat;

         //Busca datas dos períodos
         BuscaDataPeriodo(dDataInicial,True,rExercicio,rPeriodoInicial);
         BuscaDataPeriodo(dDataFinal,False,rExercicio,rPeriodoFinal);
      finally
         Free;
      end;

      //Testa se existe dados no Orçamento para transportar para o Fluxo Orçado LP
      cdsSaldo:=TCMClientDataSet.Create(nil);
      cdsComposicao:=TCMClientDataSet.Create(nil);
      try

         cdsSaldo.Data:=GetDataPacket('SELECT '+
                                      '   P.DATAINIPERIODO AS DATAREFERENCIA, '+
                                      '   SUM(S.VLRORCADO) AS VLRORCADO, '+
                                      '   S.IDCONTAORCAMEN, '+
                                      '   S.IDPLANOORCAMEN '+
                                      'FROM '+
                                      '   SALDOORCADO S, '+
                                      '   CONTASORCAMEN C, '+
                                      '   PERIODOORCAMEN P '+
                                      'WHERE '+
                                      '   (S.DATAREFERENCIA >= TO_DATE('''+
                                      FormatDateTime('dd/mm/yyyy',dDataInicial)+
                                           ''',''DD/MM/YYYY'')) AND '+
                                      '   (S.DATAREFERENCIA <= TO_DATE('''+
                                      FormatDateTime('dd/mm/yyyy',dDataFinal)+
                                           ''',''DD/MM/YYYY'')) AND '+
                                      '   (S.IDPESSOA = '+FloatToStr(rCtrlIDPessoa)+') AND '+
                                      '   (C.TIPOCALCREALIZADO = ''X'') AND '+
                                      '   (C.IDCONTAORCAMEN = S.IDCONTAORCAMEN) AND '+
                                      '   (C.IDPLANOORCAMEN = S.IDPLANOORCAMEN) AND '+
                                      '   (P.EXERCICIO = S.EXERCICIO) AND '+
                                      '   (P.PERIODO = S.PERIODO) AND '+
                                      '   (P.IDPESSOA = S.IDPESSOA) '+
                                      'GROUP BY P.DATAINIPERIODO, S.IDCONTAORCAMEN, S.IDPLANOORCAMEN ');

         if (cdsSaldo.IsEmpty) then
          begin
             MessageInfo:='Não existe nenhum Orçamento neste Período';
             Result:=False;
             Exit;
          end;

          StartTransaction;

          Result:=ExcluiLancFlxOrc(dDataInicial,dDataFinal,'L');
          if not(Result) then
           begin
              Rollback;
              Exit;
           end;

           cdsSaldo.First;
           while not(cdsSaldo.Eof) do
           begin
              MessageInfo:='*';

              cdsComposicao.Close;
              cdsComposicao.Data:=GetDataPacket('SELECT '+
                                                '   P.NUMLINHAS, '+
                                                '   C.CODTIPRECDES, '+
                                                '   C.RECPAG, '+
                                                '   C.CODCENTRORESPON, '+
                                                '   C.UNIDNEGOC, '+
                                                '   C.CODTIPDOC '+
                                                'FROM '+
                                                '   COMPCONTASORCAMEN C, '+
                                                '   (SELECT COUNT(*) AS NUMLINHAS '+
                                                '    FROM COMPCONTASORCAMEN '+
                                                '    WHERE '+
                                                '       (IDPLANOORCAMEN = '+
                                                FloatToStr(cdsSaldo.FieldByName('IDPLANOORCAMEN').AsFloat)+') AND '+
                                                '       (IDCONTAORCAMEN = '+
                                                cdsSaldo.FieldByName('IDCONTAORCAMEN').AsString+') AND '+
                                                '       (CODTIPRECDES is not null)) P '+
                                                'WHERE '+
                                                '   (C.IDPLANOORCAMEN = '+
                                                FloatToStr(cdsSaldo.FieldByName('IDPLANOORCAMEN').AsFloat)+') AND '+
                                                '   (C.IDCONTAORCAMEN = '+
                                                cdsSaldo.FieldByName('IDCONTAORCAMEN').AsString+') AND '+
                                                '   (C.CODTIPRECDES is not null) ');

              cdsComposicao.First;
              while not(cdsComposicao.Eof) do
              begin
                 if cdsComposicao.FieldByName('CODCENTRORESPON').isNull then
                    sCResponAux:=sCResponGlobal
                 else
                    sCResponAux:=cdsComposicao.FieldByName('CODCENTRORESPON').AsString;

                 if cdsComposicao.FieldByName('UNIDNEGOC').isNull then
                    rUnidNegAux:=rUnidNegGlobal
                 else
                    rUnidNegAux:=cdsComposicao.FieldByName('UNIDNEGOC').AsFloat;


                 Result:=CtrlFinanc.GravaFluxoOrc(rCtrlIDPessoa,
                                                  cdsSaldo.FieldByName('DATAREFERENCIA').AsDateTime,
                                                  cdsComposicao.FieldByName('CODTIPRECDES').AsString,
                                                  cdsComposicao.FieldByName('RECPAG').AsString,
                                                  sCResponAux,'L',rUnidNegAux,
                                                  (cdsSaldo.FieldByName('VLRORCADO').asFloat/
                                                   cdsComposicao.FieldByName('NUMLINHAS').asFloat),
                                                  cdsComposicao.FieldByName('CODTIPDOC').AsFloat);
                 cdsComposicao.Next;
              end;
              cdsSaldo.Next;
           end;

          Commit;
      finally
         cdsSaldo.Free;
         cdsComposicao.Free;
      end;
   except
      on E:Exception do
      begin
         Result := False;
         MessageInfo := E.Message;
      end;
   end;
end;

procedure TCtrlFluxoCaixa.BuscaDataPeriodo(var dDataPeriodo: TDateTime; bDataInicial: Boolean;
                                            rExercicio, rPeriodo: Real);
begin
   with TCMClientDataSet.Create(nil) do
   try
      Data:=GetDataPacket('SELECT DATAINIPERIODO, DATAFIMPERIODO '+
                          'FROM PERIODOORCAMEN '+
                          'WHERE (IDPESSOA = '+FloatToStr(rCtrlIDPessoa)+') AND '+
                          '      (EXERCICIO = '+FloatToStr(rExercicio)+') AND '+
                          '      (PERIODO = '+FloatToStr(rPeriodo)+') ');

      if bDataInicial then
         dDataPeriodo:=FieldByName('DATAINIPERIODO').AsDateTime
      else
         dDataPeriodo:=FieldByName('DATAFIMPERIODO').AsDateTime;
   finally
      Free;
   end;
end;

function  TCtrlFluxoCaixa.ListDatasMinMax(sFluxo, sCampoData: String): OleVariant;
var
   sSql : String;
begin
   sSql:='SELECT  '+
         '   Min('+sCampoData+') AS DataInic, '+
         '   Max('+sCampoData+') AS DataFim '+
         'FROM  '+sFluxo+
         ' WHERE '+
         '  (IDPessoa = '+FloatToStr(rCtrlIDPessoa)+') AND '+
         '  ('+sCampoData+'<>To_Date(''01/01/1900'',''dd/mm/yyyy''))';
   Result:=GetDataPacket(sSql);
end;

function TCtrlFluxoCaixa.GeraSaldoInicialFluxo(sTipoFluxo: String; dDataRef: TDateTime;
                                               rUnidNeg, rIDPatro, rIDPlanoPrev: Real;
                                               sCentroCusto, sCentroRespon, sPrazo: String;
                                               bSaldoParcial: Boolean): Real;
var
   rValorCotacao : Real;
   rSaldoAux     : Real;
   cdsAux        : TCMClientDataSet;
   sSql          : String;
begin
   rSaldoAux:=0;
   cdsAux:=TCMClientDataSet.Create(nil);
   try
     //----------------------------
     //Saldo para o Fluxo Previsto
     //----------------------------

     if (sTipoFluxo='P') then
      begin
         sSql:='SELECT SUM(DECODE(RECPAG,''R'',VALOR,-VALOR)) AS VALORC '+
               'FROM FLUXOPREVISTO '+
               'WHERE (IDPESSOA = '+FloatToStr(rCtrlIDPessoa)+') AND '+
               '      (DATAPROGRAMADA >= to_date(''01/01/1900'',''dd/mm/yyyy'')) AND '+
               '      (DATAPROGRAMADA < to_date('''+
                       FormatDateTime('dd/mm/yyyy',dDataRef)+''',''dd/mm/yyyy'')) ';

         if not(bSaldoParcial) then
            sSql:='SELECT SUM(VALOR) AS VALORC '+
                  'FROM FLUXOPREVISTO '+
                  'WHERE (IDPESSOA = '+FloatToStr(rCtrlIDPessoa)+') AND '+
                  '      (DATAPROGRAMADA = to_date(''01/01/1900'',''dd/mm/yyyy'')) ';

         cdsAux.Data:=GetDataPacket(sSql);
         rSaldoAux:=cdsAux.FieldByName('VALORC').AsFloat;
      end;

     //--------------------------
     //Saldo para o Fluxo Real
     //--------------------------

     if (sTipoFluxo='R') then
      begin
         sSql:='SELECT SUM(VALOR) AS VALORC,MOECODIGO FROM FLUXOREAL '+
               'WHERE (IDPESSOA = '+FloatToStr(rCtrlIDPessoa)+') '+
               '  AND (RECPAG = '''+'R'+''') '+
               MontaFiltroSalInicial(rUnidNeg,rIDPatro,rIDPlanoPrev,sCentroCusto,sCentroRespon)+
               '  AND (DATACFLOAT < to_date('''+
               FormatDateTime('dd/mm/yyyy',dDataRef)+''',''dd/MM/yyyy'')) '+
               ' GROUP BY MOECODIGO';

         cdsAux.Data:=GetDataPacket(sSql);

         cdsAux.First;
         while not(cdsAux.Eof) do
         begin
            GeralFinanc.TestaCotacaoMoeda(cdsAux.FieldByName('MOECODIGO').AsFloat,Now,
                                          False,rValorCotacao);
            if (rValorCotacao=0) then rValorCotacao :=1;
            rSaldoAux:=rSaldoAux+(cdsAux.FieldByName('VALORC').AsFloat*rValorCotacao);
            cdsAux.Next;
         end;

         cdsAux.Close;
         sSql:= 'SELECT SUM(VALOR) AS VALORC,MOECODIGO FROM FLUXOREAL '+
                'WHERE (IDPESSOA = '+FloatToStr(rCtrlIDPessoa)+') AND '+
                '      (RECPAG = '''+'P'+''') AND '+
                MontaFiltroSalInicial(rUnidNeg,rIDPatro,rIDPlanoPrev,sCentroCusto,sCentroRespon)+
                ' AND (DATACFLOAT < to_date('''+
                FormatDateTime('dd/mm/yyyy',dDataRef)+''',''dd/MM/yyyy'')) '+
                'GROUP BY MOECODIGO';

         cdsAux.Data:=GetDataPacket(sSql);

         cdsAux.First;
         while not(cdsAux.Eof) do
         begin
            GeralFinanc.TestaCotacaoMoeda(cdsAux.FieldByName('MOECODIGO').AsFloat,Now,
                                          False,rValorCotacao);
            if (rValorCotacao=0) then rValorCotacao:=1;
            rSaldoAux:=rSaldoAux-(cdsAux.FieldByName('VALORC').AsFloat*rValorCotacao);
            cdsAux.Next;
         end;

      end;

     //--------------------------
     //Saldo para o Fluxo Orçado
     //--------------------------
     if sTipoFluxo='O' then
      begin
         sSql:='SELECT '+
               '   SUM(DECODE(RECPAG,''R'',VALOROUTRAMOEDA,VALOROUTRAMOEDA*-1)) AS VALORO, '+
               '   MOECODIGO, '+
               '   SUM(DECODE(RECPAG,''R'',VALOR,VALOR*-1))  AS VALORC '+
               'FROM FLUXOORCADO '+
               'WHERE (PRAZO = '''+sPrazo+''') AND '+
               '      (IDPESSOA = '+FloatToStr(rCtrlIDPessoa)+') AND '+
               MontaFiltroSalInicial(rUnidNeg,rIDPatro,rIDPlanoPrev,sCentroCusto,sCentroRespon)+
               '  AND (DATAPROGRAMADA < to_date('''+
               FormatDateTime('dd/mm/yyyy',dDataRef)+''',''dd/MM/yyyy'')) '+
               ' GROUP BY MOECODIGO';

         cdsAux.Data:=GetDataPacket(sSql);

         cdsAux.First;
         while not(cdsAux.Eof) do
         begin
            if cdsAux.FieldByName('MOECODIGO').IsNull then
               rSaldoAux:=rSaldoAux+cdsAux.FieldByName('VALORC').AsFloat
            else
             begin
                GeralFinanc.TestaCotacaoMoeda(cdsAux.FieldByName('MOECODIGO').AsFloat,Now,
                                              False,rValorCotacao);

                if (rValorCotacao=0) then rValorCotacao :=1;
                rSaldoAux:=rSaldoAux+(cdsAux.FieldByName('VALORO').AsFloat*rValorCotacao);
             end;
            cdsAux.Next;
         end;
      end;
   finally
      cdsAux.Free;
   end;

   Result:=rSaldoAux;
end;

function TCtrlFluxoCaixa.MontaFiltroSalInicial(rUnidNeg, rIDPatro,
  rIDPlanoPrev: Real; sCentroCusto, sCentroRespon: String): String;
begin
   Result:='';
   if (rUnidNeg<>0) then
      Result:=Result+' AND (UNIDNEGOC = '+FloatToStr(rUnidNeg)+') ';
   if (rIDPatro<>0) then
      Result:=Result+' AND (IDPATRO = '+FloatToStr(rIDPatro)+') ';
   if (rIDPlanoPrev<>0) then
      Result:=Result+' AND (IDPLANOPREV = '+FloatToStr(rIDPlanoPrev)+') ';
   if (Trim(sCentroRespon)<>'') then
      Result:=Result+' AND (CODCENTRORESPON = '''+sCentroRespon+''') ';
   if (Trim(sCentroRespon)<>'') then
      Result:=Result+' AND (CODCENTROCUSTO = '''+sCentroCusto+''') ';
end;

//------------------------------------------------------------------------------
//Rotinas da Consulta dos Fluxo de Caixa
//------------------------------------------------------------------------------

function TCtrlFluxoCaixa.GeraColunasFluxo(dDataInicial,dDataFinaL: TDateTime;
                                          sAgrupamento: String; bExibSabDom: Boolean): OleVariant;
var
   iDia            : Integer;
   iNumDias        : Integer;
//   iNumColunas     : Integer;
   dDataRef        : TdateTime;
   iContador       : Integer;
   iMesAux         : Integer;
   bSemanaCheia    : Boolean;
   iDiaSemana      : Integer;
   cdsColunasFluxo : TCMClientDataSet;
begin
   cdsColunasFluxo:=TCMClientDataSet.Create(nil);
   try
      cdsColunasFluxo.Data:=GetDataPacket('SELECT '+
                                          '   To_Date(''01/01/2001'',''dd/mm/yyyy'') AS DataInicial, '+
                                          '   To_Date(''01/01/2001'',''dd/mm/yyyy'') AS DataFinal, '+
                                          '   ''123456789012345678901234567890'' AS Titulo, '+
                                          '   ''123456789012345678901234567890'' AS SubTitulo, '+
                                          '   ''N'' AS SabDom, '+
                                          '   0 AS NumeroColuna '+
                                          'FROM '+
                                          '   Dual '+
                                          'WHERE '+
                                          '   (1=2) /*+OPTIMIZER_MODE RULE*/ ');

      iNumDias:=Round(dDataFinaL-dDataInicial+1);
      iContador:=0;
      if (sAgrupamento='D') then  //Fluxo Diário
       begin
          for iDia:=1 to iNumDias do
          begin
             iDiaSemana:=DayOfWeek(dDataInicial+(iDia-1));
             if ((iDiaSemana=1) or (iDiaSemana=7)) and not(bExibSabDom) then Continue;

             Inc(iContador);
             cdsColunasFluxo.Append;
             cdsColunasFluxo.FieldByName('DATAINICIAL').AsDateTime:=(dDataInicial+(iDia-1));
             cdsColunasFluxo.FieldByName('DATAFINAL').AsDateTime:=(dDataInicial+(iDia-1));
             cdsColunasFluxo.FieldByName('TITULO').AsString:=
                             FormatDateTime('dd/mm/yyyy',(dDataInicial+(iDia-1)));
             cdsColunasFluxo.FieldByName('SABDOM').AsString:='N';

             case iDiaSemana of
                1: begin
                      cdsColunasFluxo.FieldByName('SUBTITULO').AsString:='Domingo';
                      cdsColunasFluxo.FieldByName('SABDOM').AsString:='S';
                   end;
                2: cdsColunasFluxo.FieldByName('SUBTITULO').AsString:='Segunda';
                3: cdsColunasFluxo.FieldByName('SUBTITULO').AsString:='Terça';
                4: cdsColunasFluxo.FieldByName('SUBTITULO').AsString:='Quarta';
                5: cdsColunasFluxo.FieldByName('SUBTITULO').AsString:='Quinta';
                6: cdsColunasFluxo.FieldByName('SUBTITULO').AsString:='Sexta';
                7: begin
                      cdsColunasFluxo.FieldByName('SUBTITULO').AsString:='Sábado';
                      cdsColunasFluxo.FieldByName('SABDOM').AsString:='S';
                   end;
             end;
             cdsColunasFluxo.FieldByName('NUMEROCOLUNA').AsFloat:=iContador;
             cdsColunasFluxo.Post;
          end;
       end;

      if (sAgrupamento='S') then //Fluxo Semanal
       begin
          iContador:=0;
          dDataRef:=dDataInicial;
          bSemanaCheia:=False;

          for iDia:=1 to iNumDias do
          begin
             bSemanaCheia:=False;
             if DayOfWeek(dDataInicial+(iDia-1))=7 then
              begin
                 Inc(iContador);
                 cdsColunasFluxo.Append;
                 cdsColunasFluxo.FieldByName('DATAINICIAL').AsDateTime:=dDataRef;
                 cdsColunasFluxo.FieldByName('DATAFINAL').AsDateTime:=(dDataInicial+(iDia-1));
                 cdsColunasFluxo.FieldByName('TITULO').AsString:=FormatDateTime('dd/mm',dDataRef)+
                                             ' - '+FormatDateTime('dd/mm',(dDataInicial+(iDia-1)));
                 cdsColunasFluxo.FieldByName('SABDOM').AsString:='N';
                 cdsColunasFluxo.FieldByName('SUBTITULO').AsString:=IntToStr(iContador);
                 cdsColunasFluxo.FieldByName('NUMEROCOLUNA').AsFloat:=iContador;
                 cdsColunasFluxo.Post;
                 dDataRef:=dDataInicial+(iDia-1)+1;
                 bSemanaCheia:=True;
              end;
          end;

          if not(bSemanaCheia) then
           begin
              Inc(iContador);
              cdsColunasFluxo.Append;
              cdsColunasFluxo.FieldByName('DATAINICIAL').AsDateTime:=dDataRef;
              cdsColunasFluxo.FieldByName('DATAFINAL').AsDateTime:=dDataFinaL;
              cdsColunasFluxo.FieldByName('TITULO').AsString:=FormatDateTime('dd/mm',dDataRef)+' - '+
                                                   FormatDateTime('dd/mm',dDataFinaL);
              cdsColunasFluxo.FieldByName('SABDOM').AsString:='N';
              cdsColunasFluxo.FieldByName('SUBTITULO').AsString:=IntToStr(iContador);
              cdsColunasFluxo.FieldByName('NUMEROCOLUNA').AsFloat:=iContador;
              cdsColunasFluxo.Post;
           end;
       end;

      if (sAgrupamento='M') then //Fluxo Mansal
       begin
          iMesAux:=0;
          iContador:=0;
          dDataRef:=dDataInicial;
          for iDia:=1 to iNumDias do
          begin
             if (StrToInt(FormatDateTime('mm',dDataInicial+(iDia-1)))<>iMesAux) or
                (iDia=iNumDias) then
              begin
                 if iDia=1 then
                  begin
                     dDataRef:=dDataInicial;
                     iMesAux:=StrToInt(FormatDateTime('mm',dDataInicial+(iDia-1)));
                  end
                 else
                  begin
                     Inc(iContador);
                     iMesAux:=StrToInt(FormatDateTime('mm',dDataInicial+(iDia-1)));
                     cdsColunasFluxo.Append;
                     cdsColunasFluxo.FieldByName('DATAINICIAL').AsDateTime:=dDataRef;
                     cdsColunasFluxo.FieldByName('DATAFINAL').AsDateTime:=dDataInicial+(iDia-1)-1;
                     cdsColunasFluxo.FieldByName('TITULO').AsString:=FormatDateTime('mm/yyyy',dDataRef);
                     cdsColunasFluxo.FieldByName('SUBTITULO').AsString:=IntToStr(iContador);
                     cdsColunasFluxo.FieldByName('SABDOM').AsString:='N';
                     cdsColunasFluxo.FieldByName('NUMEROCOLUNA').AsFloat:=iContador;
                     dDataRef:=dDataInicial+(iDia-1);
                     cdsColunasFluxo.Post;
                  end;
              end;
          end;

          cdsColunasFluxo.Edit;
          cdsColunasFluxo.FieldByName('DATAFINAL').AsDateTime:=dDataFinaL;
          cdsColunasFluxo.Post;

          Inc(iContador);
       end;

    Result:=cdsColunasFluxo.Data;
   finally
      cdsColunasFluxo.Free;
   end;
end;

{function GeraDadosFluxo(ParamFluxo: TParamFluxo; bGeraValores: Boolean;
                        sFluxo: String; sTipoBancoDados: String = 'ORA8I'): OleVariant;
var
   sSql : String;
begin
   {with TStringList.Create do
   try
      Claer;
      //Montagem do SQL
      Add('SELECT ');

      //Estrutura para quebra por Unidade de Negócio ou Centro de Responsabilidade
      case rgQuebra.ItemIndex of
         1: Add('   UN.UnidNegoc, UN.Nome AS UnidadeNeg, ');
         2: Add('   CR.CodCentroRespon, CR.Nome, ');
         3: Add('   CC.CodCentroCusto, CC.Nome, ');
      end;

      Add('   LF.ORDEM, ');
      Add('   LF.POSICAO, ');
      Add('   LF.CODLINHAFLUXO, ');
      Add('   LF.CODCOMPLINHA, ');
      Add('   LF.LINHAFLUXO, ');
      Add('   LF.CODTIPRECDES, ');
      Add('   LF.CODTIPDOC, ');
      Add('   LF.RECPAG, ');
      Add('   LF.NUMCARCODTRD, ');
      Add('   LF.TIPOCALCULO, ');
      Add('   LF.FLGACUMULA, ');
      Add('   LF.POSICAOTOTAL, ');

      if bGeraValores then
       begin
          if (sTipoBancoDados='ORA8I') then //Estrutura para Oracle mair igual a 8.0i
           begin
              //Estrutura que efetua os cálculos básicos
              Add('   (DECODE(LF.RECPAG,''R'',1,null,0,-1) * ');
              Add('         (SELECT Sum(Flx.Valor) ');
              Add('          FROM '+sFluxo+' Flx ');
              MontaFiltroTotalizador(qryLinhasFluxo,dDataInicial,dDataFinal,True);
              Add('         )) AS TOTAL, ');

              //Estrutura que gera as cores
              if sTipoFluxo='P' then
               begin
                  Add('   DECODE(LF.RECPAG,''R'', ');
                  Add('    DECODE((SELECT COUNT(*) ');
                  Add('          FROM '+sFluxo+' Flx ');
                  MontaFiltroTotalizador(qryLinhasFluxo,dDataInicial,dDataFinal,True);
                  Add('                AND (Flx.FLGPREVISAO=''S'') ');
                  Add('			   ),0, '''+sCorRecSemPrev+''', '''+sCorRecComPrev+'''), ');
                  Add('                    ''P'', ');
                  Add('    DECODE((SELECT COUNT(*) ');
                  Add('          FROM FluxoPrevisto Flx ');
                  MontaFiltroTotalizador(qryLinhasFluxo,dDataInicial,dDataFinal,True);
                  Add('                AND (Flx.FLGPREVISAO=''S'') ');
                  Add('			   ),0, '''+sCorPgtoSemPrev+''', '''+sCorPgtoComPrev+'''), ');
                  Add('			    Null,''clBlack'') AS CORCAMPO, ');
                end
               else
                Add('   ''clBlack'' AS CORCAMPO, ');
           end
          else
           begin
              Add('   0 AS TOTAL, ');
              Add('   ''123456789'' AS CORCAMPO, ');
           end;
       end
      else
       begin
          Add('   0 AS TOTAL, ');
          Add('   ''clBlack'' AS CORCAMPO, ');
       end;

      //Estrutura para filtragem das Linhas Zeradas
      if bUsaOracle8i then
       begin
          Add('   (SELECT ');
          Add('       COUNT(*) ');
          Add('    FROM '+sFluxo+' Flx ');
          Add('    WHERE ');
          Add('       ((((SubStr(Flx.CodTipRecDes,1,Length(RTrim(LF.CODTIPRECDES)))=RTrim(LF.CODTIPRECDES)) AND ');
          Add('          (Flx.RecPag=LF.RecPag)) OR ');
          Add('         ((Flx.CODTIPDOC=LF.CODTIPDOC) AND NOT (LF.CODTIPDOC is null) AND ');
          Add('          (LF.CODTIPDOC<>0))) AND (Flx.VALOR<>0) AND (Flx.VALOR IS NOT NULL)) ');

          if (sTipoFluxo='P') or (sTipoFluxo='O') then
           begin
              Add('                AND (Flx.DATAPROGRAMADA>=To_Date( '+
                   #39+FormatDateTime('dd/mm/yyyy',deDatIni.Date)+#39+', '+
                   #39+'DD/MM/YYYY'+#39+')) ');
              Add('                AND (Flx.DATAPROGRAMADA<=To_Date( '+
                   #39+FormatDateTime('dd/mm/yyyy',deDatFim.Date)+#39+', '+
                   #39+'DD/MM/YYYY'+#39+')) ) AS NUMTERMOS, ');
           end
          else
           begin
              Add('                AND (Flx.DATACFLOAT>=To_Date( '+
                   #39+FormatDateTime('dd/mm/yyyy',deDatIni.Date)+#39+', '+
                   #39+'DD/MM/YYYY'+#39+')) ');
              Add('                AND (Flx.DATACFLOAT<=To_Date( '+
                   #39+FormatDateTime('dd/mm/yyyy',deDatFim.Date)+#39+', '+
                   #39+'DD/MM/YYYY'+#39+')) ) AS NUMTERMOS, ');
           end;
       end
      else
       Add('   -1 AS NUMTERMOS, ');

      Add('   LF.LINHATOTAL ');
      Add('FROM ');
      // Estrutrura que fornece as Linhas Sintéticas
      Add('   -- Linhas do MontaFluxo ');
      Add('   (SELECT ');
      Add('       M.ORDEM, ');
      Add('       DECODE(M.POSICAOTOTAL,''I'',''A'',''Z'') AS POSICAO, ');
      Add('       M.CODLINHAFLUXO, ');
      Add('       M.CODLINHAFLUXO AS CODCOMPLINHA, ');
      Add('       M.DESCRICAO AS LINHAFLUXO, ');
      Add('       null AS CODTIPRECDES, ');
      Add('       0 AS CODTIPDOC, ');
      Add('       null AS RECPAG, ');
      Add('       0 AS NUMCARCODTRD, ');
      Add('       M.TIPOCALCULO, ');
      Add('       M.FLGACUMULA, ');
      Add('       M.POSICAOTOTAL, ');
      Add('       DECODE(M.TIPOCALCULO,''T'',null,''#'') AS LINHATOTAL ');
      Add('    FROM ');
      Add('       MONTAFLUXO M ');
      Add('    WHERE ');
      Add('       (M.IDPESSOA  = '+IntToStr(Sistema.IdEmpresa)+') ');
      Add('   UNION ALL ');
      // Estrutrura que fornece as Linhas do Fluxo Analítico
      Add('    -- Linhas do CompFluxo ');
      Add('    SELECT ');
      Add('       M.ORDEM, ');
      Add('       ''T'' AS POSICAO, ');
      Add('       M.CODLINHAFLUXO, ');
      Add('       C.CODCOMPLINHA, ');
      Add('       SubStr(''                    '',1,Length(RTrim(C.CODTIPRECDES)))'+
                  '||T.DESCRICAO AS LINHAFLUXO, ');
      Add('       C.CODTIPRECDES, ');
      Add('       C.CODTIPDOC, ');
      Add('       T.RECPAG, ');
      Add('       DECODE(Length(RTrim(C.CODTIPRECDES)),null,0,Length(RTrim(C.CODTIPRECDES))) '+
                  'AS NUMCARCODTRD, ');
      Add('       M.TIPOCALCULO, ');
      Add('       M.FLGACUMULA, ');
      Add('       M.POSICAOTOTAL, ');
      Add('       ''S'' AS LINHATOTAL ');
      Add('    FROM ');
      Add('       MONTAFLUXO M, ');
      Add('       COMPFLUXO C, ');
      Add('       TIPORECEBDESEMB T ');
      Add('    WHERE ');
      Add('       (M.IDPESSOA  = '+IntToStr(Sistema.IdEmpresa)+') AND ');
      Add('       (C.CODLINHAFLUXO = M.CODLINHAFLUXO) AND ');
      Add('       (C.CODTIPRECDES=T.CODTIPRECDES(+)) AND ');
      Add('       (C.RECPAG=T.RECPAG(+)) AND ');
      Add('       (C.IDPESSOA=T.IDPESSOA(+)) AND ');
      Add('       (M.TIPOCALCULO<>''C'') AND ');
      Add('       (M.TIPOCALCULO<>''D'') ');
      Add('   UNION ALL ');
      // Estrutrura que fornece as Sub-Linhas do Fluxo Analítico
      Add('    -- Sub-Linhas do CompFluxo ');
      Add('    SELECT ');
      Add('       M.ORDEM, ');
      Add('       ''T'' AS POSICAO, ');
      Add('       M.CODLINHAFLUXO, ');
      Add('       C.CODCOMPLINHA, ');
      Add('       SubStr(''                    '',1,Length(RTrim(T.CODTIPRECDES)))||'+
                  'T.DESCRICAO AS LINHAFLUXO, ');
      Add('       T.CODTIPRECDES, ');
      Add('       C.CODTIPDOC, ');
      Add('       T.RECPAG, ');
      Add('       DECODE(Length(RTrim(T.CODTIPRECDES)),null,0,Length(RTrim(T.CODTIPRECDES))) '+
                  'AS NUMCARCODTRD, ');
      Add('       M.TIPOCALCULO, ');
      Add('       M.FLGACUMULA, ');
      Add('       M.POSICAOTOTAL, ');
      Add('       ''N'' AS LINHATOTAL ');
      Add('    FROM ');
      Add('       TIPORECEBDESEMB T, ');
      Add('       COMPFLUXO C, ');
      Add('       MONTAFLUXO M ');
      Add('    WHERE ');
      Add('       (M.IDPESSOA  = '+IntToStr(Sistema.IdEmpresa)+') AND ');
      Add('       (C.CODLINHAFLUXO = M.CODLINHAFLUXO) AND ');
      Add('       (RTrim(C.CODTIPRECDES)=SubStr(RTrim(T.CODTIPRECDES),1,Length(RTrim(C.CODTIPRECDES)))) AND ');
      Add('       (RTrim(C.CODTIPRECDES)<>RTrim(T.CODTIPRECDES)) AND ');
      Add('       (C.RECPAG = T.RECPAG) AND ');
      Add('       (T.IDPESSOA = C.IDPESSOA) AND ');
      Add('       (M.TIPOCALCULO<>''C'') AND ');
      Add('       (M.TIPOCALCULO<>''D'') ');
      Add('    UNION ALL ');
      // Estrutrura que fornece as Linhas por Tipo de Documento
      Add('     -- Linhas da Montagem por Codigo de Tipo de Documento ');
      Add('     SELECT ');
      Add('        M.ORDEM, ');
      Add('        ''D'' AS POSICAO, ');
      Add('        M.CODLINHAFLUXO, ');
      Add('        C.CODCOMPLINHA, ');
      Add('        ''    ''||T.DESCRICAO AS LINHAFLUXO, ');
      Add('        C.CODTIPRECDES, ');
      Add('        C.CODTIPDOC, ');
      Add('        T.RECPAG, ');
      Add('        0 AS NUMCARCODTRD, ');
      Add('        M.TIPOCALCULO, ');
      Add('        M.FLGACUMULA, ');
      Add('        M.POSICAOTOTAL, ');
      Add('        ''S'' AS LINHATOTAL ');
      Add('     FROM ');
      Add('        MONTAFLUXO M, ');
      Add('        COMPFLUXO C, ');
      Add('        TIPODOCRECPAG T ');
      Add('     WHERE ');
      Add('        (M.IDPESSOA  = '+IntToStr(Sistema.IdEmpresa)+') AND ');
      Add('        (C.CODLINHAFLUXO = M.CODLINHAFLUXO) AND ');
      Add('        (T.CODTIPDOC = C.CODTIPDOC)) LF ');

      //Estrutura para quebra por Unidade de Negócio, Centro de Responsabilidade  ou
      //Centro de Custo
      case rgQuebra.ItemIndex of
         1: begin
               Add('   ,(Select Distinct ');
               Add('            D.UnidNegoc, ');
               Add('            D.Nome ');
               Add('     From '+sFluxo+' C, UnidNegocio D ');
               Add('     Where (C.UnidNegoc=D.UnidNegoc) AND ');
               Add('           (C.IDPessoa='+IntToStr(Sistema.IdEmpresa)+') ');
               if (Trim(dblcUnidNegoc.Text)<>'') then
                  Add('           AND (D.UnidNegoc='+dblcUnidNegoc.LookupValue+') ');
               Add('     Order by D.Nome) UN ');
            end;
         2: begin
               Add('   ,(Select Distinct ');
               Add('            C.CodCentroRespon, ');
               Add('            C.Nome ');
               Add('     From '+sFluxo+' F, CentRespon C ');
               Add('     Where (F.CodCentroRespon=C.CodCentroRespon) AND ');
               Add('           (F.CodCentroRespon<>''9999999999'') AND ');
               Add('           (F.IDPessoa='+IntToStr(Sistema.IdEmpresa)+') ');
               if (Trim(dblcCentroRespon.Text)<>'') then
                  Add('              AND (RTrim(C.CodCentroRespon)='+#39+
                      Trim(dblcCentroRespon.LookupValue)+#39+') ');
               Add('     Order by C.Nome) CR ');
            end;
         3: begin
               Add('   ,(Select Distinct ');
               Add('            C.CodCentroCusto, ');
               Add('            C.Nome ');
               Add('     From '+sFluxo+' F, CentCust C ');
               Add('     Where (F.CodCentroCusto=C.CodCentroCusto) AND ');
               Add('           (F.IDPessoa='+IntToStr(Sistema.IdEmpresa)+') ');
               if (Trim(dblcCentroCusto.Text)<>'') then
                  Add('              AND (RTrim(C.CodCentroCusto)='+#39+
                      Trim(dblcCentroCusto.LookupValue)+#39+') ');
               Add('     Order by C.Nome) CC ');
            end;
      end;

      Add('ORDER BY ');

      //Estrutura para quebra por Unidade de Negócio ou Centro de Responsabilidade
      case rgQuebra.ItemIndex of
         1: Add('   UN.UnidNegoc, ');
         2: Add('   CR.CodCentroRespon, ');
         3: Add('   CC.CodCentroCusto, ');
      end;

      Add('   LF.ORDEM, ');
      Add('   LF.POSICAO, ');
      Add('   LF.CODTIPRECDES ');
   end;

   qryLinhasFluxo.Open;

   // Gera Totais e Cores dos Recebimentos/Desembolsos para versões Oracle < 8.0i
   if (bCalcular) then
      if bUsaOracle8i then
         CalculaSomatorios(dDataInicial,dDataFinal)
      else
       begin
          qryLinhasFluxo.First;
          while not(qryLinhasFluxo.Eof) do
          begin
             //Gera as Cores dos Recebimentos/Desembolsos
             if (not(qryLinhasFluxo.FieldByName('CODTIPRECDES').IsNull) or
                 (qryLinhasFluxo.FieldByName('CODTIPDOC').AsFloat<>0)) then
                 GeraCoresRecDes(dDataInicial,dDataFinal);

             qryLinhasFluxo.Next;
          end;
          CalculaSomatorios(dDataInicial,dDataFinal);
       end;

   qryLinhasFluxo.First;

end; }

end.
