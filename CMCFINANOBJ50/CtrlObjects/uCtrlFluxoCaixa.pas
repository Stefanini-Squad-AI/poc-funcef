// Alterações:
// inicio - André Tavares - pendência 18401 - 03/01/2005

{ --------------------------------------------------------------------------------------------------
Rotinas   : GeraFluxoReal
Data      : 03/01/2005
Autor     : André Tavares
Pendência : 18401
Descrição : Acerto no erro de sql.
---------------------------------------------------------------------------------------------------}

{ --------------------------------------------------------------------------------------------------
Rotinas   : GeraFluxoReal
Data      : 30/12/2004
Autor     : Rodolpho da Silva
Pendência : 18387
Descrição : Na geração do fluxo de caixa por dia, os lançamentos com data de disponibilidade não
            estavam sendo gerados corretamente.
---------------------------------------------------------------------------------------------------}
{ --------------------------------------------------------------------------------------------------
Rotinas   : GeraSaldoInicialFluxo
Data      : 21/09/2004
Autor     : André Tavares
Pendência : 17288
Descrição : o fluxo não está filtrando por plano corretamente, o saldo inicial não está correto.
---------------------------------------------------------------------------------------------------}
{ --------------------------------------------------------------------------------------------------
Rotinas   : GeraFluxoReal
Data      : 02/08/2004
Autor     : André Tavares
Pendência : 16149
Descrição : se a data de disponibilidade não estiver preenchida, entao preencher com a DATALANCFINAN.
---------------------------------------------------------------------------------------------------}
{ --------------------------------------------------------------------------------------------------
Rotinas   : Várias
Data      : 07/07/2004
Autor     : David Ayrolla
Pendência : 17038
Descrição : Incluir nas consultas ao fluxo orçado/realizado quebra por Plano.
---------------------------------------------------------------------------------------------------}
{ --------------------------------------------------------------------------------------------------
Rotina    : GeraFluxoPrevisto
Data      : 17/06/2004
Autor     : André Pontes
Pendência : 17042
Descrição : Correção da passagem do valor do campo IDCONTAORCAMEN
---------------------------------------------------------------------------------------------------}
{ --------------------------------------------------------------------------------------------------
Rotina    : ListDadosImpressao  - Aumentei o tamanho do campo virtual 'LinhaFluxo' na query
Data      : 07/07/2003
Autor     : André Tavares
Descrição : resolução da pendência 14406
---------------------------------------------------------------------------------------------------}
unit uCtrlFluxoCaixa;

interface

uses sysutils, uCmControlObject, uCmDbObject, DB, uDataBase, DbClient, uCMClientDataSet,
     uGeralFinanc, uCtrlFinanc, uCtrlListTercFinanc, uCtrlParamIntegra, uCtrlParamFinanc,
     uDiasUteis, Classes, uCtrlPadroes
     {$IFNDEF VERSAO0505} ,uCMTypes {$ENDIF};

type

   TCoresLegenda = record
                      sCorRecComPrev  : String;
                      sCorRecSemPrev  : String;
                      sCorPgtoComPrev : String;
                      sCorPgtoSemPrev : String;
                   end;

   TParamFluxo = record
                    dDataInicial    : TDateTime;
                    dDataFinal      : TDateTime;
                    dDataMin        : TDateTime;
                    dDataMax        : TDateTime;
                    dDataInicFluxo  : TDateTime;
                    dDataFinalFluxo : TDateTime;
                    rUnidNeg        : Double;
                    sCentroResp     : String;
                    sCentroCusto    : String;
                    rIDPlanoPrev    : Double;
                    rIDPatro        : Double;
                    sQuebra         : String;
                    Legenda         : TCoresLegenda;
                    sTipoFluxo      : String;
                    sPrazo          : String;
                    bFlxComparativo : Boolean;
                 end;

   TCtrlFluxoCaixa = Class(TCmControlObject)
   private
      GeralFinanc        : TGeralFinanc;
      CtrlListTerceiros  : TCtrlListTercFinanc;
      CtrlFinanc         : TCtrlFinanc;
      CtrlParamFinanc    : TCtrlParamFinanc;
      CtrlPadroes        : TCtrlPadroes;
      DiasUteis          : TDiasUteis; 

      F_rIDPessoa        : Double;
      F_rIDModulo        : Double;
      F_rIDUsuario       : Double;
      F_bUsaPlanoPatro   : Boolean;
      FMaxProgresso      : Longint;
      FTipoEmpresa       : String;

      sTitSalAnterior    : String;
      sTipSalTransp      : String;
      bDesVermelho       : Boolean;
      iNumArq            : Integer;

   public
      property IDPessoa: Double write F_rIDPessoa;
      property IDModulo: Double write F_rIDModulo;
      property IDUsuario: Double write F_rIDUsuario;
      property UsaPlanoPatro: Boolean write F_bUsaPlanoPatro;
      property MaxProgresso: Longint read FMaxProgresso;
      property TipoEmpresa: String read FTipoEmpresa write FTipoEmpresa;

      constructor Create(rIDPessoa,rIDModulo,rIDUsuario: Double; bUsaPlanoPatro: Boolean); reintroduce;
      destructor Destroy; override;

      procedure PreparaCtrl;

      function GeraFluxoPrevisto(rSaldoInic: Double; dDataInicial,dDataFinal: TDateTime;
                                 bGeraAtrasados: Boolean): Boolean;
      function GeraFluxoReal(dDataInicial,dDataFinal: TDateTime): Boolean;
      function GeraFluxoOrcOrcamen(rPeriodoInicial, rPeriodoFinal, rExercicio: Double): Boolean;
      function GeraMultiFluxoOrc(dDataInicial,dDataFinal: TDateTime;
                                 sFluxoOrigem, sFluxoDestino: String): Boolean;
      function CalculaSaldoInicFlxPrev(dDataRef: TDateTime): Double;

      function MontaFiltroSalInicial(rUnidNeg, rIDPatro, rIDPlanoPrev: Double;
                                     sCentroCusto, sCentroRespon: String): String;

      function BuscaMinMaxDataFlxOrc(sPrazoFluxo: String): OleVariant;
      function ExcluiLancFlxOrc(dDataInicial,dDataFinal: TDateTime; sPrazoFluxo: String): Boolean;
      procedure BuscaDataPeriodo(var dDataPeriodo: TDateTime; bDataInicial: Boolean;
                                 rExercicio, rPeriodo: Double);

      //Rotinas da Consulta dos Fluxo de Caixa

      function GeraSaldoInicialFluxo(ParamFluxo : TParamFluxo): Double;
      function GeraColunasFluxo(dDataInicial,dDataFinaL: TDateTime;
                                sAgrupamento,sTipoFluxo: String; bExibSabDom: Boolean): OleVariant;
      function GeraLinhasFluxo(ParamFluxo: TParamFluxo; bGeraValores: Boolean;
                               rSaldoInicial: Double): OleVariant;
      function GeraSomatorios(LinhasFluxo: OleVariant; ParamFluxo: TParamFluxo;
                              rSaldoInicial: Double): OleVariant;
      function ListDatasMinMax(sFluxo, sCampoData: String): OleVariant;
      function ListDadosImpressao(sOrientacao: String): OleVariant;
      function BuscaNomeFluxo(sTipoFluxo: String): String;
      procedure MontaFiltro(aSql: TStringList; ParamFluxo: TParamFluxo; bTodoPeriodo: Boolean);
   protected
      procedure DoChangeDataBase; override;
      procedure AfterInitialize; override;
   end;

implementation

{ TCtrlFinanc }

constructor TCtrlFluxoCaixa.Create(rIDPessoa, rIDModulo,
  rIDUsuario: Double; bUsaPlanoPatro: Boolean);
begin
   inherited Create;

   iNumArq:=0;

   F_rIDPessoa:=rIDPessoa;
   F_rIDModulo:=rIDModulo;
   F_rIDUsuario:=rIDUsuario;
   F_bUsaPlanoPatro:=bUsaPlanoPatro;

   FMaxProgresso:=0;

   GeralFinanc:=TGeralFinanc.Create;
   CtrlListTerceiros:=TCtrlListTercFinanc.Create;
   CtrlFinanc:=TCtrlFinanc.Create(rIDPessoa,rIDModulo,rIDUsuario,bUsaPlanoPatro);
   CtrlParamFinanc:=TCtrlParamFinanc.Create;
   CtrlPadroes:=TCtrlPadroes.Create;
   DiasUteis:=TDiasUteis.Create;
end;

destructor TCtrlFluxoCaixa.Destroy;
begin
   GeralFinanc.Free;
   CtrlListTerceiros.Free;
   CtrlFinanc.Free;
   CtrlParamFinanc.Free;
   CtrlPadroes.Free;
   DiasUteis.Free;
   inherited;
end;

procedure TCtrlFluxoCaixa.DoChangeDataBase;
begin
   inherited;
end;

procedure TCtrlFluxoCaixa.AfterInitialize;
begin
   inherited;
   CtrlListTerceiros.InitializeAs(Self);
   CtrlFinanc.InitializeAs(Self);
   CtrlParamFinanc.InitializeAs(Self);
   CtrlPadroes.InitializeAs(Self);
   GeralFinanc.InitializeAs(Self);
   DiasUteis.InitializeAs(Self);
   CtrlListTerceiros.OpenTransaction:=False;
   CtrlFinanc.OpenTransaction:=False;
   CtrlParamFinanc.OpenTransaction:=False;
   CtrlPadroes.OpenTransaction:=False;   
   GeralFinanc.OpenTransaction:=False;
   if (F_rIDPessoa<>0) then PreparaCtrl; //Não executará para cnsServer
end;

procedure TCtrlFluxoCaixa.PreparaCtrl;
begin
   with TCMClientDataSet.Create(nil) do
   try
      Data:=CtrlParamFinanc.ListParamFinanc(F_rIDPessoa);
      sTitSalAnterior:=FieldByName('TITSALDOANT').AsString;
      sTipSalTransp:=FieldByName('TITSALDOTRANSP').AsString;
      bDesVermelho:=(FieldByName('FLGDESVERM').AsString='S');
   finally
      Free;
   end;
end;

//==============================================================================
// Fluxo Previsto
//==============================================================================

function TCtrlFluxoCaixa.GeraFluxoPrevisto(rSaldoInic: Double; dDataInicial,
  dDataFinal: TDateTime; bGeraAtrasados: Boolean): Boolean;
var
   cdsAux            : TCMClientDataSet;
   cdsDocumento      : TCMClientDataSet;
   cdsOrcamento      : TCMClientDataSet;
   cdsInvestimento   : TCMClientDataSet;
   cdsPrevReceitaDia : TCMClientDataSet;

   sSql              : String;
   sCodTipRecDesAux  : String;
   sCentroResponAux  : String;
   sCentroResponGlb  : String;
   rUnidNegAux       : Double;
   rUnidNegGlb       : Double;
   rCodTipDocAux     : Double;
   rCodLancFinancAux : Double;
   rCodTipoDocInvest : Double;

   rTotalDocGeral    : Double;
   rTotalDocOMGeral  : Double;
   rTotalDocumento   : Double;
   rTotalDocOM       : Double;
   rDMais            : Double;
   rSaldoCorrente    : Double;
   rSaldoMoeda       : Double;
   rSaldoDoc         : Double;
   rSaldoDocOM       : Double;
   rCodDocSaldo      : Double;
   rValorCotacao     : Double;
   bLanca            : Boolean;
   dDataAux          : TDateTime;

begin
   MessageInfo:='';

   if ConnectionSide = cnsClient then
    begin
       Result:=Connection.AppServer.GeraFluxoPrevisto(rSaldoInic,
                                                      dDataInicial,
                                                      dDataFinal,
                                                      bGeraAtrasados,
                                                      F_rIDPessoa,
                                                      F_rIDModulo,
                                                      F_rIDUsuario,
                                                      F_bUsaPlanoPatro,
                                                      FTipoEmpresa);
       if not Result then MessageInfo:=Connection.AppServer.MessageInfo;
    end
   else
    begin
       StartTransaction;
       try
          cdsAux:=TCMClientDataSet.Create(nil);
          try
             //Busca qualquer recebimento analítico a ser utilizado na gravação do Saldo Anterior
             cdsAux.Data:=CtrlListTerceiros.ListTipoRD(F_rIDPessoa,'R','A');
             sCodTipRecDesAux:=cdsAux.FieldByName('CODTIPRECDES').AsString;

             //Busca Tipo de Documento usado em Transfêrencias
             cdsAux.Close;
             cdsAux.Data:=CtrlParamFinanc.ListParamFinanc(F_rIDPessoa);
             rCodTipoDocInvest:=0;
             if (cdsAux.FieldByName('CODTIPDOCINVEST').AsFloat<>0) then
                rCodTipoDocInvest:=cdsAux.FieldByName('CODTIPDOCINVEST').AsFloat;

             //Busca Unidade de Negócio e Centro de Respon a serem utilizados na gravação do Saldo Anterior
             cdsAux.Close;
             cdsAux.Data:=CtrlListTerceiros.ListParamGlobal(F_rIDPessoa);

             rUnidNegGlb:=cdsAux.FieldByName('UNIDNEGOC').AsFloat;
             rUnidNegAux:=rUnidNegGlb;

             sCentroResponGlb:=cdsAux.FieldByName('CODCENTRORESPON').AsString;
             sCentroResponAux:=sCentroResponGlb;

             //Busca Código de Tipo de Documento a ser utilizado na gravação do Saldo Anterior
             cdsAux.Close;
             cdsAux.Data:=CtrlListTerceiros.ListTipoDoc('R');
             rCodTipDocAux:=cdsAux.FieldByName('CODTIPDOC').AsFloat;

             //Limpa Fluxo Previsto
             Result:=ExecSQL('DELETE FLUXOPREVISTO WHERE (IDPESSOA = '+FloatToStr(F_rIDPessoa)+') ');
             if not(Result) then
              begin
                 Rollback;
                 Exit;
              end;

             //----------------------Início Geração do Saldo
             FMaxProgresso:=0;
             MessageInfo:='*Gerando Saldo...';

             Result:=CtrlFinanc.GravaFluxoPrev(sCentroResponAux,sCodTipRecDesAux,'R','N',
                                               StrToDate('01/01/1900'),rUnidNegAux,rSaldoInic,'',
                                               F_rIDPessoa,0,0,0,rCodTipDocAux);
             if not(Result) then
              begin
                 MessageInfo:=CtrlFinanc.MessageInfo;
                 Rollback;
                 Exit;
              end;

             Result:=CtrlFinanc.GravaFluxoPrev(sCentroResponAux,sCodTipRecDesAux,'R','N',
                                               dDataInicial-1,rUnidNegAux,0,'',F_rIDPessoa,
                                               0,0,0,rCodTipDocAux);
             if not(Result) then
              begin
                 MessageInfo:=CtrlFinanc.MessageInfo;
                 Rollback;
                 Exit;
              end;

             Result:=CtrlFinanc.GravaFluxoPrev(sCentroResponAux,sCodTipRecDesAux,'R','N',dDataInicial,
                                               rUnidNegAux,0,'',F_rIDPessoa,0,0,0,
                                               rCodTipDocAux);
             if not(Result) then
              begin
                 MessageInfo:=CtrlFinanc.MessageInfo;
                 Rollback;
                 Exit;
              end;

             Result:=CtrlFinanc.GravaFluxoPrev(sCentroResponAux,sCodTipRecDesAux,'R','N',dDataFinal,
                                               rUnidNegAux,0,'',F_rIDPessoa,0,0,0,
                                               rCodTipDocAux);
             if not(Result) then
              begin
                 MessageInfo:=CtrlFinanc.MessageInfo;
                 Rollback;
                 Exit;
              end; //----------------------Fim Geração do Saldo

             //-----------------------------------------------------------------
             //----------------------Início Dados vindos do CAP/CAR
             //-----------------------------------------------------------------
             rCodLancFinancAux:=0;
             cdsDocumento:=TCMClientDataSet.Create(nil);
             try
                //Carrega cdsDocumento
                sSql:='SELECT '+
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
                      '   ( (STATUS <> ''2'') OR (STATUS IS NULL)) AND '+
                      '   ((OPERACAO = ''1'') OR '+
                      '    (OPERACAO = ''2'') OR '+
                      '    (OPERACAO = ''3'') OR '+
                      '    (OPERACAO = ''10'') OR '+
                      '    (OPERACAO = ''11'') OR '+
                      '    (OPERACAO = ''12'') OR '+
                      '    (OPERACAO = ''13'') OR '+
                      '    (OPERACAO = ''14'')) AND '+
                      '    (IDPESSOA = '+FloatToStr(F_rIDPessoa)+') ';
                      
                if not(bGeraAtrasados) then
                   sSql:=sSql+'    AND (DATAPROGRAMADA >= TO_DATE ('''+
                              FormatDateTime('dd/mm/yyyy',dDataInicial-10)+''','+
                              '''DD/MM/YYYY'')) ';

                sSql:=sSql+'    AND (DATAPROGRAMADA <= TO_DATE ('''+
                           FormatDateTime('dd/mm/yyyy',dDataFinal+10)+''','+
                           '''DD/MM/YYYY'')) ';

                cdsDocumento.Data:=GetDataPacket(sSql);

                FMaxProgresso:=0;
                MessageInfo:='*Buscando dados do Contas a Pagar/Receber...';
                FMaxProgresso:=cdsDocumento.RecordCount;

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

                       //Na função PrimeiroDiaUtilPosterior, a DataProgramada foi subtraída de 1 para
                       //que a mesma teste a data corrente e não a data do dia seguinte.
                       //Data que o cliente paga
                       dDataAux:=DiasUteis.PrimeiroDiaUtilPosterior(Trunc(F_rIDPessoa),
                                    (cdsDocumento.FieldByName('DATAPROGRAMADA').AsDateTime-1),True,True,False);
                       //Data que o hotel recebe
                       dDataAux:=DiasUteis.PrimeiroDiaUtilPosterior(Trunc(F_rIDPessoa),
                                    (dDataAux+rDMais-1),True,True,False);

                       if (cdsDocumento.FieldByName('MOECODIGO').AsFloat<>0) then
                        begin
                           GeralFinanc.TestaCotacaoMoeda(cdsDocumento.FieldByName('MOECODIGO').AsFloat,
                                                         dDataAux,False,rValorCotacao);
                        end;

                       //Data dos Atrasados
                       if (dDataAux<dDataInicial) then dDataAux:=(dDataInicial-1);

                       if (dDataAux<=dDataFinal) then
                        begin
                           if (StrToIntDef(cdsDocumento.FieldByName('OPERACAO').AsString,0) in [1,2,10,11,12,14]) then
                            begin
                               CtrlFinanc.FazerAcumulaRateio(cdsDocumento.FieldByName('CODDOCUMENTO').AsFloat,
                                                            rTotalDocumento,rTotalDocOM);

                               rTotalDocGeral  :=rTotalDocumento;
                               rTotalDocOMGeral:=rTotalDocOM;

                               Result:=CtrlFinanc.FazerRateioDocum(0,
                                                       cdsDocumento.FieldByName('CODDOCUMENTO').AsFloat,
                                                       dDataAux,rTotalDocGeral,rTotalDocOMGeral,
                                                       rSaldoCorrente,rSaldoMoeda,rValorCotacao,
                                                       F_rIDPessoa,ParamIntegra.Plano,rCodLancFinancAux,
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
                                                          F_rIDPessoa,ParamIntegra.Plano,
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
             finally
                cdsDocumento.Free;
             end;  //----------------------Fim Dados vindos do CAP/CAR

             //-----------------------------------------------------------------
             //----------------------Início Dados vindos do Orçamento
             //-----------------------------------------------------------------             
             cdsOrcamento:=TCMClientDataSet.Create(nil);
             try
                //Carrega cds de Orçamentos
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
                                                 '   (DATAREFERENCIA >= TO_DATE('''+
                                                      FormatDateTime('dd/mm/yyyy',dDataInicial)+''','+
                                                      '''DD/MM/YYYY'')) AND '+
                                                 '   (DATAREFERENCIA <= TO_DATE('''+
                                                      FormatDateTime('dd/mm/yyyy',dDataFinal)+''','+
                                                      '''DD/MM/YYYY'')) AND '+
                                                 '   (IDPESSOA = '+FloatToStr(F_rIDPessoa)+') ');

                FMaxProgresso:=0;
                MessageInfo:='*Buscando dados do Orçamento...';
                FMaxProgresso:=cdsOrcamento.RecordCount;

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
                                              '    WHERE (IDPLANOORCAMEN = '+
                                 FloatToStr(cdsOrcamento.FieldByName('IDPLANOORCAMEN').AsFloat)+') AND '+
                                              '          (IDCONTAORCAMEN = '+
                                 // André Pontes - pendência 17042 - 17/06/2004
                                 // O campo passou a ser lido como ".AsString".
                                 cdsOrcamento.FieldByName('IDCONTAORCAMEN').AsString+')) P '+
                                              'WHERE '+
                                              '   (C.IDPLANOORCAMEN = '+
                                              FloatToStr(cdsOrcamento.FieldByName('IDPLANOORCAMEN').AsFloat)+') AND '+
                                              '   (C.IDCONTAORCAMEN = '+
                                             // André Pontes - pendência 17042 - 17/06/2004
                                             // O campo passou a ser lido como ".AsString".
                                             // Além disso estava sendo passado o campo IDPLANO ao invés de IDConta
                                              cdsOrcamento.FieldByName('IDCONTAORCAMEN').AsString+')');

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
                                                        F_rIDPessoa,0,
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
             finally
                cdsOrcamento.Free;
             end; //----------------------Fim Dados vindos do Orçamento


             //-----------------------------------------------------------------
             //----------------------Início Dados vindos do Investimento
             //-----------------------------------------------------------------

             cdsInvestimento:=TCMClientDataSet.Create(nil);
             try

                //Carrega cds de Invetimentos
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
                                                    '   (TIT.DATAVENCTITRENFIX >= TO_DATE('''+
                                                         FormatDateTime('dd/mm/yyyy',dDataInicial)+''','+
                                                         '''DD/MM/YYYY'')) AND '+
                                                    '    (TIT.DATAVENCTITRENFIX <= TO_DATE('''+
                                                         FormatDateTime('dd/mm/yyyy',dDataFinal)+''','+
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

                FMaxProgresso:=0;
                MessageInfo:='*Buscando dados do Investimento...';
                FMaxProgresso:=cdsInvestimento.RecordCount;

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
                                                        F_rIDPessoa,0,0,0,rCodTipoDocInvest);
                      if not(Result) then
                       begin
                          MessageInfo:=CtrlFinanc.MessageInfo;
                          Rollback;
                          Exit;
                       end;
                    end;
                   cdsInvestimento.Next;
                end;
             finally
                cdsInvestimento.Free;
             end; //----------------------Fim Dados vindos do Investimento


             //-----------------------------------------------------------------
             //----------------------Início Dados vindos da Previsão de Receita Diária (Hotéis)
             //-----------------------------------------------------------------
             if (FTipoEmpresa<>'P') then
              begin
                 cdsAux.Close;
                 cdsAux.Data:=GetDataPacket('SELECT '+
                                            '   T.CODCENTRORESPON, '+
                                            '   T.CODTIPRECDES, '+
                                            '   T.RECPAG, '+
                                            '   T.UNIDNEGOC, '+
                                            '   T.CODTIPDOC, '+
                                            '   T.CENTROCUSTOCREDIT '+
                                            'FROM '+
                                            '   TIPODEBCREDHOTEL T '+
                                            'WHERE '+
                                            '   (IDTIPODEBCRED IN (SELECT DISTINCT IDTIPODCDIARIA '+
                                            '                      FROM PARAMHOTEL '+
                                            '                      WHERE (IDHOTEL IN (SELECT IDHOTEL '+
                                            '                                         FROM HOTEL '+
                                            '                                         WHERE (IDPESSOA = '+
                                                 FloatToStr(F_rIDPessoa)+'))))) AND '+
                                            '   (T.CODTIPRECDES IS NOT NULL) ');

                 if  not(cdsAux.IsEmpty) then
                  begin
                     cdsPrevReceitaDia:=TCMClientDataSet.Create(nil);
                     try
                        cdsPrevReceitaDia.data:=GetDataPacket('SELECT '+
                                                '   DATA, '+
                                                '   SUM(DECODE(R.STATUSRESERVA,7,0, '+
                                                '       R.VLRDIARIA* (1 - (R.PERCDESCONTODIARIA/100)))) '+
                                                '       AS VALOR '+
                                                'FROM '+
                                                '   DATASIS D, '+
                                                '   RESERVAREDUZ RD, '+
                                                '   RESERVASFRONT R '+
                                                'WHERE '+
                                                '   (D.DATA >= TO_DATE('''+
                                                       FormatDateTime('dd/mm/yyyy',dDataInicial)+''','+
                                                       '''DD/MM/YYYY'')) AND '+
                                                '   (D.DATA <= TO_DATE('''+
                                                      FormatDateTime('dd/mm/yyyy',dDataFinal)+''','+
                                                      '''DD/MM/YYYY'')) AND '+
                                                '   (D.IDHOTEL IN (SELECT IDHOTEL '+
                                                '                  FROM HOTEL '+
                                                '                  WHERE (IDPESSOA = '+
                                                     FloatToStr(F_rIDPessoa)+'))) AND '+
                                                '   (RD.DATACHEGADA <= D.DATA) AND '+
                                                '   (RD.DATAPARTIDA > D.DATA) AND '+
                                                '   (RD.IDHOTEL = D.IDHOTEL) AND '+
                                                '   (R.IDRESERVASFRONT = RD.IDRESERVASFRONT) AND '+
                                                '   ((R.CODUH IS NULL) OR '+
                                                '    (R.CODUH IN (SELECT U.CODUH '+
                                                '                 FROM UH U '+
                                                '                 WHERE '+
                                                '                    (U.CODUH = R.CODUH) AND '+
                                                '                    (U.IDHOTEL = R.IDHOTEL) AND '+
                                                '                    (U.UHPOOL = ''S''))) OR '+
                                                '    (R.CODUH IN (SELECT PF.CODUH '+
                                                '                 FROM POOLFLUTUANTE PF '+
                                                '                 WHERE '+
                                                '                    (PF.CODUH = R.CODUH) AND '+
                                                '                    (PF.IDHOTEL = R.IDHOTEL) AND '+
                                                '                    (PF.DATAINICIO <= DATA) AND '+
                                                '                    (PF.DATAFIM > DATA)))) '+
                                                'GROUP BY DATA ');

                        FMaxProgresso:=0;
                        MessageInfo:='*Buscando dados da Previsão de Receita Diária...';
                        FMaxProgresso:=cdsPrevReceitaDia.RecordCount;

                        cdsPrevReceitaDia.First;
                        while not(cdsPrevReceitaDia.Eof) do
                        begin
                           MessageInfo:='*';
                           Result:=CtrlFinanc.GravaFluxoPrev(cdsAux.FieldByName('CODCENTRORESPON').AsString,
                                                             cdsAux.FieldByName('CODTIPRECDES').AsString,
                                                             cdsAux.FieldByName('RECPAG').AsString,'S',
                                                             cdsPrevReceitaDia.FieldByName('DATA').AsDateTime,
                                                             cdsAux.FieldByName('UNIDNEGOC').AsFloat,
                                                             cdsPrevReceitaDia.FieldByName('VALOR').AsFloat,
                                                             cdsAux.FieldByName('CENTROCUSTOCREDIT').AsString,
                                                             F_rIDPessoa,0,0,0,
                                                             cdsAux.FieldByName('CODTIPDOC').AsFloat);
                           if not(Result) then
                            begin
                               MessageInfo:=CtrlFinanc.MessageInfo;
                               Rollback;
                               Exit;
                            end;

                           cdsPrevReceitaDia.Next;
                        end;
                     finally
                        cdsPrevReceitaDia.Free;
                     end;
                  end;
              end;//----------------------Fim Dados vindos da Previsão de Receita Diária (Hotéis)

            //Grava LOG
            Result:=CtrlPadroes.GravaLogOperacoes(F_rIDPessoa,F_rIDModulo,F_rIDUsuario,
                                                 'Geração de Fluxo de Caixa Previsto',False);
            if not(Result) then
             begin
                MessageInfo:=CtrlPadroes.MessageInfo;
                Rollback;
                Exit;
             end;

             //Finaliza Transação
             Commit;
          finally
             cdsAux.Free;
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

function TCtrlFluxoCaixa.CalculaSaldoInicFlxPrev(dDataRef: TDateTime): Double;
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
         '   (M.IDPESSOA = '+FloatToStr(F_rIDPessoa)+') ';

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
   rMoedaCorrAux : Double;
   rMoedaCorr    : Double;
   rValor        : Double;
   cdsRateio : TCMClientDataSet;
begin
   MessageInfo:='';
   FMaxProgresso:=0;

   if ConnectionSide = cnsClient then
    begin
       Result:=Connection.AppServer.GeraFluxoReal(dDataInicial,dDataFinal,
                                                  F_rIDPessoa,
                                                  F_rIDModulo,
                                                  F_rIDUsuario,
                                                  F_bUsaPlanoPatro);

       if not Result then MessageInfo:=Connection.AppServer.MessageInfo;
    end
   else
    begin
       try
          with TCMClientDataSet.Create(nil) do
          try
             Data:=CtrlListTerceiros.ListParamGlobal(F_rIDPessoa);
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
                          '      (IDPESSOA = '+FloatToStr(F_rIDPessoa)+') ');

         if not(Result) then
          begin
             Rollback;
             Exit;
          end;

         cdsRateio:=TCMClientDataSet.Create(nil);
         try
           cdsRateio.Close;
           if CtrlFinanc.IntegraDispFinanc Then
        // início - André Tavares - pendência 16149 - 02/09/2004
              cdsRateio.Data:= GetDataPacket('SELECT '+
                                            '   R.*, '+
                                      // início - André Tavares - pendência 16149 - 02/09/2004
{
//                                            '   M.DATALANCFINAN '+
                                            // Marchetti Pendencia 16149 - 02/04/2004
                                            '   M.DATADISPFINANC AS DATALANCFINAN '+
}
                                            '   NVL(M.DATADISPFINANC, M.DATALANCFINAN) AS DATALANCFINAN '+
                                      // fim - André Tavares - pendência 16149 - 02/09/2004
                                            'FROM '+
                                            '   RATEIOFINANC R, '+
                                            '   MOVIMFINANC M, '+
                                            '   PORTADORCONTA C '+
                                            'WHERE '+

                                            '  (M.CODLANCFINANC = R.CODLANCFINANC) AND ' +

                                      //  Início - Rodolpho - P: 18387
                                      //========================================================
                                      //  Codigo anterior - Início
                                      //******************************************************
                                      // início - André Tavares - pendência 16149 - 02/09/2004
                                      {
                                            '   (M.DATADISPFINANC <= TO_DATE ('''+
                                            FormatDateTime('dd/mm/yyyy',dDataFinal)+
                                                           ''',''dd/mm/yyyy'')) AND  '+
                                            '   (M.DATADISPFINANC >= TO_DATE ('''+
                                            FormatDateTime('dd/mm/yyyy',dDataInicial)+
                                                           ''',''dd/mm/yyyy'')) AND '+
                                       }
                                       {     '   (M.DATALANCFINAN <= TO_DATE ('''+
                                            FormatDateTime('dd/mm/yyyy',dDataFinal)+
                                                           ''',''dd/mm/yyyy'')) AND  '+
                                            '   (M.DATALANCFINAN >= TO_DATE ('''+
                                            FormatDateTime('dd/mm/yyyy',dDataInicial)+
                                                           ''',''dd/mm/yyyy'')) AND '+ }
                                      // fim - André Tavares - pendência 16149 - 02/09/2004
                                      //  Código anterior - Fim
                                      //******************************************************
                                      // inicio - André Tavares - pendência 18401 - 03/01/2005
                                      {
                                            '   ((NVL(M.DATADISPFINANC, M.DATALANCFINAN) <= TO_DATE ('''+
                                            FormatDateTime('dd/mm/yyyy',dDataFinal)+
                                                           ''',''dd/mm/yyyy'')) AND  '+
                                            '   ((NVL(M.DATADISPFINANC, M.DATALANCFINAN) >= TO_DATE ('''+
                                            FormatDateTime('dd/mm/yyyy',dDataInicial)+
                                                           ''',''dd/mm/yyyy'')) AND '+
                                       }
                                            '   (NVL(M.DATADISPFINANC, M.DATALANCFINAN) <= TO_DATE ('''+
                                            FormatDateTime('dd/mm/yyyy',dDataFinal)+
                                                           ''',''dd/mm/yyyy'')) AND  '+
                                            '   (NVL(M.DATADISPFINANC, M.DATALANCFINAN) >= TO_DATE ('''+
                                            FormatDateTime('dd/mm/yyyy',dDataInicial)+
                                                           ''',''dd/mm/yyyy'')) AND '+
                                      // fim - André Tavares - pendência 18401 - 03/01/2005
                                      //========================================================
                                      //  Fim - Rodolpho - P: 18387



                                            '   (R.IDPESSOA = '+FloatToStr(F_rIDPessoa)+') AND '+
                                            '   (M.CODPORTADOR = C.CODPORTADOR) AND '+
                                            '   ((C.FLGGRAVAFLUXO = ''S'') OR '+
                                            '    (C.FLGGRAVAFLUXO IS NULL)) ')

            else
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
                                            '   (R.IDPESSOA = '+FloatToStr(F_rIDPessoa)+') AND '+
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
                                                 F_rIDPessoa,
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

           //Grava LOG
           Result:=CtrlPadroes.GravaLogOperacoes(F_rIDPessoa,F_rIDModulo,F_rIDUsuario,
                                                'Geração de Fluxo de Caixa Real',False);
           if not(Result) then
            begin
               MessageInfo:=CtrlPadroes.MessageInfo;
               Rollback;
               Exit;
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
                         '   (FOrc.IDPESSOA = '+FloatToStr(F_rIDPessoa)+') ');
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
                                'WHERE (IDPESSOA = '+FloatToStr(F_rIDPessoa)+') AND '+
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

      sSql:=sSql+'                            (FOrig.IDPESSOA = '+FloatToStr(F_rIDPessoa)+') AND '+
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

      //Grava LOG
      Result:=CtrlPadroes.GravaLogOperacoes(F_rIDPessoa,F_rIDModulo,F_rIDUsuario,
                                           'Geração do Flx de Cx Orçado a partir '+
                                           'do Flx de Cx Previsto',False);
      if not(Result) then
       begin
          MessageInfo:=CtrlPadroes.MessageInfo;
          Rollback;
          Exit;
       end;

      //Finaliza Transação
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
                   'WHERE (FOrc.IDPESSOA = '+FloatToStr(F_rIDPessoa)+') AND '+
                   '      (FOrc.Prazo= '''+sPrazoFluxo+''') AND '+
                   '      (FOrc.DataProgramada >= To_Date( '''+
                   FormatDateTime('dd/mm/yyyy',dDataInicial)+''',''dd/mm/yyyy'')) AND '+
                   '      (FOrc.DataProgramada <= To_Date( '''+
                   FormatDateTime('dd/mm/yyyy',dDataFinal)+''', ''dd/mm/yyyy'')) ');
end;

function TCtrlFluxoCaixa.GeraFluxoOrcOrcamen(rPeriodoInicial,
  rPeriodoFinal, rExercicio: Double): Boolean;
var
   dDataInicial   : TDateTime;
   dDataFinal     : TDateTime;
   sCResponGlobal : String;
   sCResponAux    : String;
   rUnidNegGlobal : Double;
   rUnidNegAux    : Double;
   cdsSaldo       : TCMClientDataSet;
   cdsComposicao  : TCMClientDataSet;
begin
   MessageInfo:='';
   if ConnectionSide = cnsClient then
    begin
       Result:=Connection.AppServer.GeraFluxoOrcOrcamen(rPeriodoInicial,
                                                        rPeriodoFinal,
                                                        rExercicio,
                                                        F_rIDPessoa,
                                                        F_rIDModulo,
                                                        F_rIDUsuario,
                                                        F_bUsaPlanoPatro);

       if not Result then MessageInfo:=Connection.AppServer.MessageInfo;
    end
   else
    begin
       try
          with TCMClientDataSet.Create(nil) do
          try
             //Busca Parâmetros Globais
             Data:=CtrlListTerceiros.ListParamGlobal(F_rIDPessoa);
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
                                          '   (S.IDPESSOA = '+FloatToStr(F_rIDPessoa)+') AND '+
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


                     Result:=CtrlFinanc.GravaFluxoOrc(F_rIDPessoa,
                                                      cdsSaldo.FieldByName('DATAREFERENCIA').AsDateTime,
                                                      cdsComposicao.FieldByName('CODTIPRECDES').AsString,
                                                      cdsComposicao.FieldByName('RECPAG').AsString,
                                                      sCResponAux,'L',rUnidNegAux,
                                                      (cdsSaldo.FieldByName('VLRORCADO').asFloat/
                                                       cdsComposicao.FieldByName('NUMLINHAS').asFloat),
                                                      cdsComposicao.FieldByName('CODTIPDOC').AsFloat);
                     if not(Result) then
                      begin
                         MessageInfo:=CtrlFinanc.MessageInfo;
                         Rollback;
                         Exit;
                      end;

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
end;

procedure TCtrlFluxoCaixa.BuscaDataPeriodo(var dDataPeriodo: TDateTime; bDataInicial: Boolean;
                                            rExercicio, rPeriodo: Double);
begin
   with TCMClientDataSet.Create(nil) do
   try
      Data:=GetDataPacket('SELECT DATAINIPERIODO, DATAFIMPERIODO '+
                          'FROM PERIODOORCAMEN '+
                          'WHERE (IDPESSOA = '+FloatToStr(F_rIDPessoa)+') AND '+
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

function TCtrlFluxoCaixa.ListDatasMinMax(sFluxo,
  sCampoData: String): OleVariant;
var
   sSql : String;
begin
   sSql:='SELECT  '+
         '   Min('+sCampoData+') AS DataInic, '+
         '   Max('+sCampoData+') AS DataFim '+
         'FROM  '+sFluxo+
         ' WHERE '+
         '  (IDPessoa = '+FloatToStr(F_rIDPessoa)+') AND '+
         '  ('+sCampoData+'<>To_Date(''01/01/1900'',''dd/mm/yyyy''))';
   Result:=GetDataPacket(sSql);
end;

function TCtrlFluxoCaixa.GeraSaldoInicialFluxo(ParamFluxo : TParamFluxo): Double;
  // início - andre tavares - pendência 17288 - 01/09/2004
  function GetMovimFinancPlanoPrev(dia : TdateTime; idplanoPrev: double): double;
  var cds : TcmClientDataset;
  begin
    result := 0;
    cds := TcmClientDataSet.Create(nil);
    try
      if (ParamFluxo.sTipoFluxo='P') then
      begin
        cds.data := ListDatasMinMax('FluxoPrevisto','DATAPROGRAMADA');
        if cds.FieldByName('DATAINIC').AsDateTime + 1 = dia then
          result := 0
        else
        begin
          cds.Data := getDataPacket(
                          ' SELECT '+
                          '   IDPLANOPREV, '+
                          ' SUM(DECODE(RECPAG,''R'',VALOR,-VALOR)) AS MOV '+
                          ' FROM FLUXOPREVISTO '+
                          ' WHERE (IDPESSOA = '+ FloatToStr(F_rIDPessoa) +') AND '+
                          '  (DATAPROGRAMADA >= TO_DATE('+ quotedStr(formatDateTime('dd/mm/yyyy', cds.FieldByName('DATAINIC').AsDateTime + 1)) +',''DD/MM/YYYY'')) '+
                          '  AND   (DATAPROGRAMADA < TO_DATE('+ quotedStr(formatDateTime('dd/mm/yyyy', dia)) +',''DD/MM/YYYY'')) '+
                          '  AND IDPLANOPREV =  '+ floatToStr(idplanoPrev)+
                          ' GROUP BY IDPLANOPREV '
          );
          result := cds.FieldByName('MOV').asFloat;
        end;
      end else if (ParamFluxo.sTipoFluxo='O') or (ParamFluxo.sTipoFluxo= 'OXR') then
      begin
        cds.data := ListDatasMinMax('FLUXOORCADO','DATAPROGRAMADA');
        if cds.FieldByName('DATAINIC').AsDateTime + 1 = dia then
          result := 0
        else
        begin
          cds.Data := getDataPacket(
                          ' SELECT '+
                          '   IDPLANOPREV, '+
                          ' SUM(DECODE(RECPAG,''R'',VALOR,-VALOR)) AS MOV '+
                          ' FROM FLUXOORCADO '+
                          ' WHERE (IDPESSOA = '+ FloatToStr(F_rIDPessoa) +') AND '+
                          '  (DATAPROGRAMADA >= TO_DATE('+ quotedStr(formatDateTime('dd/mm/yyyy', cds.FieldByName('DATAINIC').AsDateTime + 1)) +',''DD/MM/YYYY'')) '+
                          '  AND   (DATAPROGRAMADA < TO_DATE('+ quotedStr(formatDateTime('dd/mm/yyyy', dia)) +',''DD/MM/YYYY'')) '+
                          '  AND IDPLANOPREV =  '+ floatToStr(idplanoPrev)+
                          ' GROUP BY IDPLANOPREV '
          );
          result := cds.FieldByName('MOV').asFloat;
        end;
      end else if (ParamFluxo.sTipoFluxo='R') then
      begin
        cds.data := ListDatasMinMax('FLUXOREAL','DATACFLOAT');
        if cds.FieldByName('DATAINIC').AsDateTime + 1 = dia then
          result := 0
        else
        begin
          cds.Data := getDataPacket(
                          ' SELECT '+
                          '   IDPLANOPREV, '+
                          ' SUM(DECODE(RECPAG,''R'',VALOR,-VALOR)) AS MOV '+
                          ' FROM FLUXOORCADO '+
                          ' WHERE (IDPESSOA = '+ FloatToStr(F_rIDPessoa) +') AND '+
                          '  (DATACFLOAT >= TO_DATE('+ quotedStr(formatDateTime('dd/mm/yyyy', cds.FieldByName('DATAINIC').AsDateTime + 1)) +',''DD/MM/YYYY'')) '+
                          '  AND   (DATACFLOAT < TO_DATE('+ quotedStr(formatDateTime('dd/mm/yyyy', dia)) +',''DD/MM/YYYY'')) '+
                          '  AND IDPLANOPREV =  '+ floatToStr(idplanoPrev)+
                          ' GROUP BY IDPLANOPREV '
          );
          result := cds.FieldByName('MOV').asFloat;
        end;
      end;
    finally
      cds.free;
    end;
  end;
  // fim - andre tavares - pendência 17288 - 01/09/2004

var
   rValorCotacao      : Double;
   rSaldoAux          : Double;
   cdsAux             : TCMClientDataSet;
   sSql               : String;
   bSaldoDiferenciado : Boolean;
begin
   rSaldoAux:=0;

   bSaldoDiferenciado:=(ParamFluxo.dDataInicFluxo<>ParamFluxo.dDataMin);

   cdsAux:=TCMClientDataSet.Create(nil);
   try
     //----------------------------
     //Saldo para o Fluxo Previsto
     //----------------------------
     if (ParamFluxo.sTipoFluxo='P') then
      begin
         sSql:='SELECT SUM(DECODE(RECPAG,''R'',VALOR,-VALOR)) AS VALORC '+
               'FROM FLUXOPREVISTO '+
               'WHERE (IDPESSOA = '+FloatToStr(F_rIDPessoa)+') AND '+
               '      (DATAPROGRAMADA >= to_date(''01/01/1900'',''dd/mm/yyyy'')) AND '+
               '      (DATAPROGRAMADA < to_date('''+
                       FormatDateTime('dd/mm/yyyy',ParamFluxo.dDataInicFluxo)+''',''dd/mm/yyyy'')) ';

         if not(bSaldoDiferenciado) then
            sSql:='SELECT SUM(VALOR) AS VALORC '+
                  'FROM FLUXOPREVISTO '+
                  'WHERE (IDPESSOA = '+FloatToStr(F_rIDPessoa)+') AND '+
                  '      (DATAPROGRAMADA = to_date(''01/01/1900'',''dd/mm/yyyy'')) ';

         cdsAux.Data:=GetDataPacket(sSql);
         rSaldoAux:=cdsAux.FieldByName('VALORC').AsFloat;

         // início - andre tavares - pendência 17288 - 01/09/2004
         if formatFloat('0', ParamFluxo.rIDPlanoPrev) <> '0' then
         begin
           sSql:= 'SELECT '+
                  '  R.IDPLANOPREV, '+
                  '  SUM(DECODE(R.RECPAG,''R'',R.VALOR,R.VALOR*-1)) AS VALORC '+
                  ' FROM MOVIMFINANC M, RATEIOFINANC R '+
                  ' WHERE R.IDPLANOPREV = ' + floatToStr(ParamFluxo.rIdplanoprev)+ ' AND '+
                  ' (M.IDPESSOA = '+FloatToStr(F_rIDPessoa)+') AND '+
                  '       (M.STATUSCONCILIA <> ''C'') '+
                  ' AND (M.DATALANCFINAN  < TO_DATE('+ quotedStr(formatdateTime('dd/mm/yyyy', date)) +' ,''DD/MM/YYYY'')) '+
                  ' AND (M.CODLANCFINANC = R.CODLANCFINANC) '+
                  ' GROUP BY R.IDPLANOPREV ';
           cdsAux.Data:=GetDataPacket(sSql);
           rSaldoAux:=cdsAux.FieldByName('VALORC').AsFloat;
           rsaldoAux := rsaldoAux + GetMovimFinancPlanoPrev(ParamFluxo.dDataInicFluxo, ParamFluxo.rIDPlanoPrev);
         end;

         // fim - andre tavares - pendência 17288 - 01/09/2004


      end;

     //--------------------------
     //Saldo para o Fluxo Real
     //--------------------------

     if (ParamFluxo.sTipoFluxo='R') then
      begin
         sSql:='SELECT SUM(VALOR) AS VALORC,MOECODIGO FROM FLUXOREAL '+
               'WHERE (IDPESSOA = '+FloatToStr(F_rIDPessoa)+') '+
               '  AND (RECPAG = '''+'R'+''') '+
               '  AND (DATACFLOAT < to_date('''+
               FormatDateTime('dd/mm/yyyy',ParamFluxo.dDataInicFluxo)+''',''dd/MM/yyyy'')) ';
              // início - andre tavares - pendência 17288 - 01/09/2004
              // ' GROUP BY MOECODIGO';
              if formatFloat('0', ParamFluxo.rIDPlanoPrev) <> '0' then
              begin
                sSql := sSql +  ' AND IDPLANOPREV = '+ formatFloat('0', ParamFluxo.rIDPlanoPrev);
              end;
              sSql := sSql +  ' GROUP BY MOECODIGO';
              // fim - andre tavares - pendência 17288 - 01/09/2004

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
                'WHERE (IDPESSOA = '+FloatToStr(F_rIDPessoa)+') AND '+
                '      (RECPAG = '''+'P'+''') '+
               { MontaFiltroSalInicial(ParamFluxo.rUnidNeg,
                                      ParamFluxo.rIDPatro,
                                      ParamFluxo.rIDPlanoPrev,
                                      ParamFluxo.sCentroCusto,
                                      ParamFluxo.sCentroResp)+}
                ' AND (DATACFLOAT < to_date('''+
                FormatDateTime('dd/mm/yyyy',ParamFluxo.dDataInicFluxo)+''',''dd/MM/yyyy'')) ';
              // início - andre tavares - pendência 17288 - 01/09/2004
              // ' GROUP BY MOECODIGO';
              if formatFloat('0', ParamFluxo.rIDPlanoPrev) <> '0' then
              begin
                sSql := sSql +  ' AND IDPLANOPREV = '+ formatFloat('0', ParamFluxo.rIDPlanoPrev);
              end;
              sSql := sSql +  ' GROUP BY MOECODIGO';
              // fim - andre tavares - pendência 17288 - 01/09/2004

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
     if (ParamFluxo.sTipoFluxo='O') then
      begin
         sSql:='SELECT '+
               '   SUM(DECODE(RECPAG,''R'',VALOROUTRAMOEDA,VALOROUTRAMOEDA*-1)) AS VALORO, '+
               '   MOECODIGO, '+
               '   SUM(DECODE(RECPAG,''R'',VALOR,VALOR*-1))  AS VALORC '+
               'FROM FLUXOORCADO '+
               'WHERE (PRAZO = '''+ParamFluxo.sPrazo+''') AND '+
               '      (IDPESSOA = '+FloatToStr(F_rIDPessoa)+') AND '+
               '      (DATAPROGRAMADA < to_date('''+
               FormatDateTime('dd/mm/yyyy',ParamFluxo.dDataInicFluxo)+''',''dd/MM/yyyy'')) ';
              // início - andre tavares - pendência 17288 - 01/09/2004
              // ' GROUP BY MOECODIGO';
              if formatFloat('0', ParamFluxo.rIDPlanoPrev) <> '0' then
              begin
                sSql := sSql +  ' AND IDPLANOPREV = '+ formatFloat('0', ParamFluxo.rIDPlanoPrev);
              end;
              sSql := sSql +  ' GROUP BY MOECODIGO';
              // fim - andre tavares - pendência 17288 - 01/09/2004

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
  rIDPlanoPrev: Double; sCentroCusto, sCentroRespon: String): String;
begin
   Result:='';
   if (rUnidNeg<>0) then
      Result:=Result+' AND (UNIDNEGOC = '+FloatToStr(rUnidNeg)+') ';
   if (rIDPatro<>0) then
      Result:=Result+' AND (IDPATRO = '+FloatToStr(rIDPatro)+') ';
   if (rIDPlanoPrev<>0) then
      Result:=Result+' AND (IDPLANOPREV = '+formatFloat('0', rIDPlanoPrev)+') '; // tavares
//      Result:=Result+' AND (IDPLANOPREV = '+FloatToStr(rIDPlanoPrev)+') ';
   if (Trim(sCentroRespon)<>'') then
      Result:=Result+' AND (CODCENTRORESPON = '''+sCentroRespon+''') ';
   if (Trim(sCentroRespon)<>'') then
      Result:=Result+' AND (CODCENTROCUSTO = '''+sCentroCusto+''') ';
end;

//------------------------------------------------------------------------------
//Rotinas da Consulta dos Fluxo de Caixa
//------------------------------------------------------------------------------

function TCtrlFluxoCaixa.GeraColunasFluxo(dDataInicial,dDataFinaL: TDateTime;
                                          sAgrupamento,sTipoFluxo: String;
                                          bExibSabDom: Boolean): OleVariant;
var
   iDia            : Integer;
   iNumDias        : Integer;
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
                                          '   ''_'' AS TipoFluxo '+
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
             cdsColunasFluxo.FieldByName('TIPOFLUXO').AsString:=sTipoFluxo;
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
                 cdsColunasFluxo.FieldByName('TIPOFLUXO').AsString:=sTipoFluxo;
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
              cdsColunasFluxo.FieldByName('TIPOFLUXO').AsString:=sTipoFluxo;
              cdsColunasFluxo.Post;
           end;
       end;

      if (sAgrupamento='M') then //Fluxo Mensal
       begin
          iMesAux:=0;
          iContador:=0;
          dDataRef:=dDataInicial;
          for iDia:=1 to iNumDias do
          begin
             if (StrToInt(FormatDateTime('mm',dDataInicial+(iDia-1)))<>iMesAux) then
              begin
                 if (iMesAux<>0) then
                  begin
                     cdsColunasFluxo.Edit;
                     cdsColunasFluxo.FieldByName('DATAFINAL').AsDateTime:=dDataInicial+(iDia-1)-1;
                     cdsColunasFluxo.Post;
                  end;

                 Inc(iContador);
                 dDataRef:=dDataInicial+(iDia-1);

                 iMesAux:=StrToInt(FormatDateTime('mm',dDataRef));
                 cdsColunasFluxo.Append;
                 cdsColunasFluxo.FieldByName('DATAINICIAL').AsDateTime:=dDataRef;
                 cdsColunasFluxo.FieldByName('DATAFINAL').AsDateTime:=dDataRef;
                 cdsColunasFluxo.FieldByName('TITULO').AsString:=FormatDateTime('mm/yyyy',dDataRef);
                 cdsColunasFluxo.FieldByName('SUBTITULO').AsString:=IntToStr(iContador);
                 cdsColunasFluxo.FieldByName('SABDOM').AsString:='N';
                 cdsColunasFluxo.FieldByName('TIPOFLUXO').AsString:=sTipoFluxo;
                 cdsColunasFluxo.Post;
              end;
          end;

          if not(cdsColunasFluxo.IsEmpty) then
           begin
              cdsColunasFluxo.Edit;
              cdsColunasFluxo.FieldByName('DATAFINAL').AsDateTime:=dDataFinaL;
              cdsColunasFluxo.Post;
           end;
       end;

    Result:=cdsColunasFluxo.Data;
   finally
      cdsColunasFluxo.Free;
   end;
end;

function TCtrlFluxoCaixa.GeraLinhasFluxo(ParamFluxo: TParamFluxo; bGeraValores: Boolean;
                                         rSaldoInicial: Double): OleVariant;
var
   aSql        : TStringList;
   sFluxo      : String;
   rUltimo     : Double;
   sTipoFlxAux : String;
begin
   sFluxo:=BuscaNomeFluxo(ParamFluxo.sTipoFluxo);

   aSql:=TStringList.Create;
   with aSql do
   try
      //Estrutura de Saldo Anterior
      Add('SELECT ');

      if (ParamFluxo.sQuebra='UN') then
       begin
          Add('   -99999999999999999999999999999999999999999999999999 AS UnidNegoc, ');
          Add('   '' '' AS UnidadeNeg, ');
       end;

      if (ParamFluxo.sQuebra='CR') then
       begin
          Add('   ''0'' AS CodCentroRespon, ');
          Add('   '' '' AS Nome, ');
       end;

      if (ParamFluxo.sQuebra='CC') then
       begin
          Add('   ''0'' AS CodCentroCusto, ');
          Add('   '' '' AS Nome, ');
       end;

      //DAVID - Pendência 17038
      if (ParamFluxo.sQuebra='PL') then
       begin
          Add('       0 AS IdPlanoPrev, ');
          Add('   '' '' AS Nome, ');
       end;                           

      Add('   0 AS ORDEM, ');
      Add('   ''A''  AS POSICAO, ');
      Add('   0 AS CODLINHAFLUXO, ');
      Add('   0 AS CODCOMPLINHA, ');
      Add('   '''+sTitSalAnterior+''' AS LINHAFLUXO, ');
      Add('   ''0'' AS CODTIPRECDES, ');
      Add('   0 AS CODTIPDOC, ');
      Add('   ''R'' AS RECPAG, ');
      Add('   0 AS NUMCARCODTRD, ');
      Add('   ''X'' AS TIPOCALCULO, ');
      Add('   ''N'' AS FLGACUMULA, ');
      Add('   ''I'' AS POSICAOTOTAL, ');
      Add('   0 AS TOTAL, ');
      Add('   ''clBlack          '' AS CORCAMPO, ');
      Add('   0  AS NUMTERMOS, ');
      Add('   ''#'' AS LINHATOTAL ');
      Add('FROM DUAL ');
      Add('-- Linhas do Fluxo  ');
      Add('UNION ALL  ');

      //Estrutura das Linhas do Fluxo
      Add('SELECT ');

      //Estrutura para quebra por Unidade de Negócio,Centro de Responsabilidade ou Centro de Custo
      if (ParamFluxo.sQuebra='UN') then
       begin
          Add('   LF.UnidNegoc, ');
          Add('   LF.UnidadeNeg, ');
       end;

      if (ParamFluxo.sQuebra='CR') then
       begin
          Add('   LF.CodCentroRespon, ');
          Add('   LF.Nome, ');
       end;

      if (ParamFluxo.sQuebra='CC') then
       begin
          Add('   LF.CodCentroCusto, ');
          Add('   LF.Nome, ');
       end;

      //DAVID - Pendência 17038
      if (ParamFluxo.sQuebra='PL') then
       begin
          Add('   LF.IdPlanoPrev, ');
          Add('   LF.Nome, ');
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
          Add('   DECODE(LF.TIPOCALCULO,''R'',TOTTRD.Total,''P'',TotTRD.Total, '+
                                       '''C'',TOTTDOC.Total,''D'',TotTDOC.Total ) AS TOTAL, ');
          if (ParamFluxo.sTipoFluxo='P') then
           begin
              Add('   DECODE(LF.TIPOCALCULO,''C'',DECODE(QtdePrevTDOC.NumTermComPrev,null,'''+
                                            ParamFluxo.Legenda.sCorRecSemPrev+''','''+
                                            ParamFluxo.Legenda.sCorRecComPrev+'''),');
              Add('                         ''D'',DECODE(QtdePrevTDOC.NumTermComPrev,null,'''+
                                            ParamFluxo.Legenda.sCorPgtoSemPrev+''','''+
                                            ParamFluxo.Legenda.sCorPgtoComPrev+'''),');
              Add('                         ''R'',DECODE(QtdePrevTRD.NumTermComPrev,null,'''+
                                            ParamFluxo.Legenda.sCorRecSemPrev+''','''+
                                            ParamFluxo.Legenda.sCorRecComPrev+'''),');
              Add('                         ''P'',DECODE(QtdePrevTRD.NumTermComPrev,null,'''+
                                            ParamFluxo.Legenda.sCorPgtoSemPrev+''','''+
                                            ParamFluxo.Legenda.sCorPgtoComPrev+'''),''clBlack'')AS CORCAMPO, ');
           end
          else
           Add('   ''clBlack'' AS CORCAMPO, ');
       end
      else
       begin
          Add('   0 AS TOTAL, ');
          Add('   ''clBlack'' AS CORCAMPO, ');
       end;

      Add('   DECODE(LF.TIPOCALCULO,''R'',NumTRD.NaoZerados,'+
                                    '''P'',NumTRD.NaoZerados,'+
                                    '''C'',NumTDOC.NaoZerados,'+
                                    '''D'',NumTDOC.NaoZerados,0) AS NUMTERMOS, ');

      Add('   LF.LINHATOTAL ');
      Add('FROM ');

      if (ParamFluxo.sQuebra<>'') then
       begin
          Add('   (SELECT ');

          if (ParamFluxo.sQuebra='UN') then
           begin
              Add('       UN.UnidNegoc, ');
              Add('       UN.Nome AS UnidadeNeg, ');
           end;

          if (ParamFluxo.sQuebra='CR') then
           begin
              Add('       CR.CodCentroRespon, ');
              Add('       CR.Nome, ');
           end;

          if (ParamFluxo.sQuebra='CC') then
           begin
              Add('       CC.CodCentroCusto, ');
              Add('       CC.Nome, ');
           end;

          //DAVID - Pendência 17038
          if (ParamFluxo.sQuebra='PL') then
           begin
              Add('       PP.IdPlanoPrev, ');
              Add('       PP.Nome, ');
           end;

          Add('       LF1.ORDEM, ');
          Add('       LF1.POSICAO, ');
          Add('       LF1.CODLINHAFLUXO, ');
          Add('       LF1.CODCOMPLINHA, ');
          Add('       LF1.LINHAFLUXO, ');
          Add('       LF1.CODTIPRECDES, ');
          Add('       LF1.CODTIPDOC, ');
          Add('       LF1.RECPAG, ');
          Add('       LF1.NUMCARCODTRD, ');
          Add('       LF1.TIPOCALCULO, ');
          Add('       LF1.FLGACUMULA, ');
          Add('       LF1.POSICAOTOTAL, ');
          Add('       LF1.LINHATOTAL ');
          Add('    FROM ');
       end;

      // Estrutrura que fornece as Linhas Sintéticas
      Add('    -- Linhas do MontaFluxo ');
      Add('       (SELECT ');
      Add('           M.ORDEM, ');
      Add('           DECODE(M.POSICAOTOTAL,''I'',''A'',''Z'') AS POSICAO, ');
      Add('           M.CODLINHAFLUXO, ');
      Add('           M.CODLINHAFLUXO AS CODCOMPLINHA, ');
      Add('           M.DESCRICAO AS LINHAFLUXO, ');
      Add('           null AS CODTIPRECDES, ');
      Add('           0 AS CODTIPDOC, ');
      Add('           null AS RECPAG, ');
      Add('           0 AS NUMCARCODTRD, ');
      Add('           M.TIPOCALCULO, ');
      Add('           M.FLGACUMULA, ');
      Add('           M.POSICAOTOTAL, ');
      Add('           DECODE(M.TIPOCALCULO,''T'',null,''#'') AS LINHATOTAL ');
      Add('        FROM ');
      Add('           MONTAFLUXO M ');
      Add('        WHERE ');
      Add('           (M.IDPESSOA  = '+FloatToStr(F_rIDPessoa)+') ');
      Add('       UNION ALL ');
      // Estrutrura que fornece as Linhas do Fluxo Analítico
      Add('    -- Linhas do CompFluxo ');
      Add('        SELECT ');
      Add('           M.ORDEM, ');
      Add('           ''T'' AS POSICAO, ');
      Add('           M.CODLINHAFLUXO, ');
      Add('           C.CODCOMPLINHA, ');
      Add('           SubStr(''                    '',1,Length(RTrim(C.CODTIPRECDES)))'+
                             '||T.DESCRICAO AS LINHAFLUXO, ');
      Add('           C.CODTIPRECDES, ');
      Add('           C.CODTIPDOC, ');
      Add('           T.RECPAG, ');
      Add('           DECODE(Length(RTrim(C.CODTIPRECDES)),null,0,Length(RTrim(C.CODTIPRECDES))) '+
                      'AS NUMCARCODTRD, ');
      Add('           M.TIPOCALCULO, ');
      Add('           M.FLGACUMULA, ');
      Add('           M.POSICAOTOTAL, ');
      Add('           ''S'' AS LINHATOTAL ');
      Add('        FROM ');
      Add('           MONTAFLUXO M, ');
      Add('           COMPFLUXO C, ');
      Add('           TIPORECEBDESEMB T ');
      Add('        WHERE ');
      Add('           (M.IDPESSOA  = '+FloatToStr(F_rIDPessoa)+') AND ');
      Add('           (C.CODLINHAFLUXO = M.CODLINHAFLUXO) AND ');
      Add('           (C.CODTIPRECDES=T.CODTIPRECDES(+)) AND ');
      Add('           (C.RECPAG=T.RECPAG(+)) AND ');
      Add('           (C.IDPESSOA=T.IDPESSOA(+)) AND ');
      Add('           (M.TIPOCALCULO<>''C'') AND ');
      Add('           (M.TIPOCALCULO<>''D'') ');
      Add('       UNION ALL ');
      // Estrutrura que fornece as Sub-Linhas do Fluxo Analítico
      Add('    -- Sub-Linhas do CompFluxo ');
      Add('        SELECT ');
      Add('           M.ORDEM, ');
      Add('           ''T'' AS POSICAO, ');
      Add('           M.CODLINHAFLUXO, ');
      Add('           C.CODCOMPLINHA, ');
      Add('           SubStr(''                    '',1,Length(RTrim(T.CODTIPRECDES)))||'+
                             'T.DESCRICAO AS LINHAFLUXO, ');
      Add('           T.CODTIPRECDES, ');
      Add('           C.CODTIPDOC, ');
      Add('           T.RECPAG, ');
      Add('           DECODE(Length(RTrim(T.CODTIPRECDES)),null,0,Length(RTrim(T.CODTIPRECDES))) '+
                                    'AS NUMCARCODTRD, ');
      Add('           M.TIPOCALCULO, ');
      Add('           M.FLGACUMULA, ');
      Add('           M.POSICAOTOTAL, ');
      Add('           ''N'' AS LINHATOTAL ');
      Add('        FROM ');
      Add('           TIPORECEBDESEMB T, ');
      Add('           COMPFLUXO C, ');
      Add('           MONTAFLUXO M ');
      Add('        WHERE ');
      Add('           (M.IDPESSOA  = '+FloatToStr(F_rIDPessoa)+') AND ');
      Add('           (C.CODLINHAFLUXO = M.CODLINHAFLUXO) AND ');
      Add('           (RTrim(C.CODTIPRECDES)=SubStr(RTrim(T.CODTIPRECDES),1,Length(RTrim(C.CODTIPRECDES)))) AND ');
      Add('           (RTrim(C.CODTIPRECDES)<>RTrim(T.CODTIPRECDES)) AND ');
      Add('           (C.RECPAG = T.RECPAG) AND ');
      Add('           (T.IDPESSOA = C.IDPESSOA) AND ');
      Add('           (M.TIPOCALCULO<>''C'') AND ');
      Add('           (M.TIPOCALCULO<>''D'') ');
      Add('       UNION ALL ');
      // Estrutrura que fornece as Linhas por Tipo de Documento
      Add('     -- Linhas da Montagem por Codigo de Tipo de Documento ');
      Add('        SELECT ');
      Add('           M.ORDEM, ');
      Add('           ''D'' AS POSICAO, ');
      Add('           M.CODLINHAFLUXO, ');
      Add('           C.CODCOMPLINHA, ');
      Add('           ''    ''||T.DESCRICAO AS LINHAFLUXO, ');
      Add('           C.CODTIPRECDES, ');
      Add('           C.CODTIPDOC, ');
      Add('           T.RECPAG, ');
      Add('           0 AS NUMCARCODTRD, ');
      Add('           M.TIPOCALCULO, ');
      Add('           M.FLGACUMULA, ');
      Add('           M.POSICAOTOTAL, ');
      Add('           ''S'' AS LINHATOTAL ');
      Add('        FROM ');
      Add('           MONTAFLUXO M, ');
      Add('           COMPFLUXO C, ');
      Add('           TIPODOCRECPAG T ');
      Add('        WHERE ');
      Add('           (M.IDPESSOA  = '+FloatToStr(F_rIDPessoa)+') AND ');
      Add('           (C.CODLINHAFLUXO = M.CODLINHAFLUXO) AND ');


      if (ParamFluxo.sQuebra<>'') then
         Add('           (T.CODTIPDOC = C.CODTIPDOC)) LF1 ')
      else
         Add('           (T.CODTIPDOC = C.CODTIPDOC)) LF ');

      //Estrutura para quebra por Unidade de Negócio, Centro de Responsabilidade  ou
      //Centro de Custo
      //DAVID - Pendência 17038
      //...ou plano

      if (ParamFluxo.sQuebra='UN') then
       begin
          if not(ParamFluxo.bFlxComparativo) then
           begin
              Add('   ,(SELECT Distinct ');
              Add('            U.UnidNegoc, ');
              Add('            U.Nome ');
              Add('     FROM '+sFluxo+' Flx, UnidNegocio U ');
              Add('     WHERE (Flx.UnidNegoc=U.UnidNegoc) AND ');
              Add('           (Flx.IDPessoa='+FloatToStr(F_rIDPessoa)+') AND ');
              Add('           (Flx.IDPessoa=U.IDPessoa) ');
              if (ParamFluxo.rUnidNeg<>0) then
                  Add('           AND (U.UnidNegoc='+FloatToStr(ParamFluxo.rUnidNeg)+') ');
              MontaFiltro(aSql,ParamFluxo,True);
              Add('    ) UN ');
           end
          else
           begin
              //Estrutura de Unidades de Negócio para Fluxo Comparativo Orçado x Realizado
              sTipoFlxAux:=ParamFluxo.sTipoFluxo;

              Add('   ,( SELECT Distinct ');
              Add('             U.UnidNegoc, ');
              Add('             U.Nome ');
              Add('      FROM FluxoOrcado Flx, UnidNegocio U ');
              Add('      WHERE (Flx.UnidNegoc=U.UnidNegoc) AND ');
              Add('            (Flx.IDPessoa='+FloatToStr(F_rIDPessoa)+') AND ');
              Add('            (Flx.IDPessoa=U.IDPessoa) ');
              if (ParamFluxo.rUnidNeg<>0) then
                 Add('            AND (U.UnidNegoc='+FloatToStr(ParamFluxo.rUnidNeg)+') ');
              ParamFluxo.sTipoFluxo:='O';
              MontaFiltro(aSql,ParamFluxo,True);
              Add('     UNION');
              Add('      SELECT Distinct ');
              Add('             U.UnidNegoc, ');
              Add('             U.Nome ');
              Add('      FROM FluxoReal Flx, UnidNegocio U ');
              Add('      WHERE (Flx.UnidNegoc=U.UnidNegoc) AND ');
              Add('            (Flx.IDPessoa='+FloatToStr(F_rIDPessoa)+') AND ');
              Add('            (Flx.IDPessoa=U.IDPessoa) ');
              if (ParamFluxo.rUnidNeg<>0) then
                 Add('            AND (U.UnidNegoc='+FloatToStr(ParamFluxo.rUnidNeg)+') ');
              ParamFluxo.sTipoFluxo:='R';
              MontaFiltro(aSql,ParamFluxo,True);
              Add('    ) UN ');

              ParamFluxo.sTipoFluxo:=sTipoFlxAux;
           end;
       end;

      if (ParamFluxo.sQuebra='CR') then
       begin
          if not(ParamFluxo.bFlxComparativo) then
           begin
              Add('   ,(SELECT Distinct ');
              Add('            C.CodCentroRespon, ');
              Add('            C.Nome ');
              Add('     FROM '+sFluxo+' Flx, CentRespon C ');
              Add('     WHERE (Flx.CodCentroRespon=C.CodCentroRespon) AND ');
              Add('           (Flx.IDPessoa='+FloatToStr(F_rIDPessoa)+') AND ');
              Add('           (Flx.IDPessoa=C.IDPessoa) ');
              if (Trim(ParamFluxo.sCentroResp)<>'') then
                 Add('              AND (RTrim(C.CodCentroRespon)='+#39+
                     Trim(ParamFluxo.sCentroResp)+#39+') ');
              MontaFiltro(aSql,ParamFluxo,True);
              Add('     ) CR ');
           end
          else
           begin
              //Estrutura de Centros de responsabilidade para Fluxo Comparativo Orçado x Realizado

              sTipoFlxAux:=ParamFluxo.sTipoFluxo;

              Add('   ,( SELECT Distinct ');
              Add('             C.CodCentroRespon, ');
              Add('             C.Nome ');
              Add('      FROM FluxoOrcado Flx, CentRespon C ');
              Add('      WHERE (Flx.CodCentroRespon=C.CodCentroRespon) AND ');
              Add('            (Flx.IDPessoa='+FloatToStr(F_rIDPessoa)+') AND ');
              Add('            (Flx.IDPessoa=C.IDPessoa) ');
              if (Trim(ParamFluxo.sCentroResp)<>'') then
                 Add('               AND (RTrim(C.CodCentroRespon)='+#39+
                     Trim(ParamFluxo.sCentroResp)+#39+') ');
              ParamFluxo.sTipoFluxo:='O';
              MontaFiltro(aSql,ParamFluxo,True);
              Add('     UNION ');
              Add('      SELECT Distinct ');
              Add('             C.CodCentroRespon, ');
              Add('             C.Nome ');
              Add('      FROM FluxoReal Flx, CentRespon C ');
              Add('      WHERE (Flx.CodCentroRespon=C.CodCentroRespon) AND ');
              Add('            (Flx.IDPessoa='+FloatToStr(F_rIDPessoa)+') AND ');
              Add('            (Flx.IDPessoa=C.IDPessoa) ');
              if (Trim(ParamFluxo.sCentroResp)<>'') then
                 Add('               AND (RTrim(C.CodCentroRespon)='+#39+
                     Trim(ParamFluxo.sCentroResp)+#39+') ');
              ParamFluxo.sTipoFluxo:='R';
              MontaFiltro(aSql,ParamFluxo,True);
              Add('    ) CR ');

              ParamFluxo.sTipoFluxo:=sTipoFlxAux;
           end;
       end;

      if (ParamFluxo.sQuebra='CC') then
       begin
          if not(ParamFluxo.bFlxComparativo) then
           begin
              Add('   ,(SELECT Distinct ');
              Add('            C.CodCentroCusto, ');
              Add('            C.Nome ');
              Add('     FROM '+sFluxo+' Flx, CentCust C ');
              Add('     WHERE (Flx.CodCentroCusto=C.CodCentroCusto) AND ');
              Add('           (Flx.IDPessoa='+FloatToStr(F_rIDPessoa)+') AND ');
              Add('           (Flx.IDPessoa=C.IDEmpresa) ');
              if (Trim(ParamFluxo.sCentroCusto)<>'') then
                 Add('              AND (RTrim(C.CodCentroCusto)='+#39+
                     Trim(ParamFluxo.sCentroCusto)+#39+') ');
              MontaFiltro(aSql,ParamFluxo,True);
              Add('     ) CC ');
           end
          else
           begin
              //Estrutura de Centros de Custo para Fluxo Comparativo Orçado x Realizado

              sTipoFlxAux:=ParamFluxo.sTipoFluxo;

              Add('   ,( SELECT Distinct ');
              Add('             C.CodCentroCusto, ');
              Add('             C.Nome ');
              Add('      FROM FluxoOrcado Flx, CentCust C ');
              Add('      WHERE (Flx.CodCentroCusto=C.CodCentroCusto) AND ');
              Add('            (Flx.IDPessoa='+FloatToStr(F_rIDPessoa)+') AND ');
              Add('            (Flx.IDPessoa=C.IDEmpresa) ');
              if (Trim(ParamFluxo.sCentroCusto)<>'') then
                 Add('            AND (RTrim(C.CodCentroCusto)='+#39+
                     Trim(ParamFluxo.sCentroCusto)+#39+') ');
              ParamFluxo.sTipoFluxo:='O';
              MontaFiltro(aSql,ParamFluxo,True);
              Add('     UNION ');
              Add('      SELECT Distinct ');
              Add('             C.CodCentroCusto, ');
              Add('             C.Nome ');
              Add('      FROM FluxoReal Flx, CentCust C ');
              Add('      WHERE (Flx.CodCentroCusto=C.CodCentroCusto) AND ');
              Add('            (Flx.IDPessoa='+FloatToStr(F_rIDPessoa)+') AND ');
              Add('            (Flx.IDPessoa=C.IDEmpresa) ');
              if (Trim(ParamFluxo.sCentroCusto)<>'') then
                 Add('            AND (RTrim(C.CodCentroCusto)='+#39+
                     Trim(ParamFluxo.sCentroCusto)+#39+') ');
              ParamFluxo.sTipoFluxo:='R';
              MontaFiltro(aSql,ParamFluxo,True);
              Add('     ) CC ');

              ParamFluxo.sTipoFluxo:=sTipoFlxAux;
           end;
      end;


      //DAVID - Pendência 17038
      if (ParamFluxo.sQuebra='PL') then
       begin
          if not(ParamFluxo.bFlxComparativo) then
           begin
              Add('   ,(SELECT Distinct ');
              Add('            P.IdPlanoPrev, ');
              Add('            P.Nome ');
              Add('     FROM '+sFluxo+' Flx, PlanPrevContabil P ');
              Add('     WHERE (Flx.IdPlanoPrev=P.IdPlanoPrev) AND ');
              Add('           (Flx.IDPessoa='+FloatToStr(F_rIDPessoa)+') ');
              //Add('           (Flx.IDPessoa=U.IDPessoa) ');
              if (formatFloat('0', ParamFluxo.rIDPlanoPrev) <> '0') then  // tavares
                  Add('           AND (P.IdPlanoPrev='+formatFloat('0', ParamFluxo.rIDPlanoPrev)+') ');
              //if (ParamFluxo.rIDPlanoPrev<>0) then
              //    Add('           AND (P.IdPlanoPrev='+FloatToStr(ParamFluxo.rIDPlanoPrev)+') ');
              MontaFiltro(aSql,ParamFluxo,True);
              Add('    ) PP ');
           end
          else
           begin
              //Estrutura de Unidades de Negócio para Fluxo Comparativo Orçado x Realizado
              sTipoFlxAux:=ParamFluxo.sTipoFluxo;

              Add('   ,( SELECT Distinct ');
              Add('            P.IdPlanoPrev, ');
              Add('            P.Nome ');
              Add('     FROM FluxoOrcado Flx, PlanPrevContabil P ');
              Add('     WHERE (Flx.IdPlanoPrev=P.IdPlanoPrev) AND ');
              Add('           (Flx.IDPessoa='+FloatToStr(F_rIDPessoa)+') ');
              //Add('           (Flx.IDPessoa=U.IDPessoa) ');
              if (formatFloat('0', ParamFluxo.rIDPlanoPrev) <> '0') then // tavares
                Add('           AND (P.IdPlanoPrev='+formatFloat('0', ParamFluxo.rIDPlanoPrev)+') '); // tavares
              //if (ParamFluxo.rIDPlanoPrev<>0) then
              //    Add('           AND (P.IdPlanoPrev='+FloatToStr(ParamFluxo.rIDPlanoPrev)+') ');
              ParamFluxo.sTipoFluxo:='O';
              MontaFiltro(aSql,ParamFluxo,True);
              Add('     UNION');
              Add('      SELECT Distinct ');
              Add('            P.IdPlanoPrev, ');
              Add('            P.Nome ');
              Add('     FROM FluxoReal Flx, PlanPrevContabil P ');
              Add('     WHERE (Flx.IdPlanoPrev=P.IdPlanoPrev) AND ');
              Add('           (Flx.IDPessoa='+FloatToStr(F_rIDPessoa)+') ');
              //Add('           (Flx.IDPessoa=U.IDPessoa) ');
              if (formatFloat('0', ParamFluxo.rIDPlanoPrev) <> '0') then //tavares
                  Add('           AND (P.IdPlanoPrev='+FormatFloat('0', ParamFluxo.rIDPlanoPrev)+') ');
              //if (ParamFluxo.rIDPlanoPrev<>0) then
              //    Add('           AND (P.IdPlanoPrev='+FloatToStr(ParamFluxo.rIDPlanoPrev)+') ');
              ParamFluxo.sTipoFluxo:='R';
              MontaFiltro(aSql,ParamFluxo,True);
              Add('    ) PP ');

              ParamFluxo.sTipoFluxo:=sTipoFlxAux;
           end;
       end;



      if (ParamFluxo.sQuebra<>'') then Add('     ) LF ');

      //Estrutura para geração do Número de termos não zerados de um TRD
      if not(ParamFluxo.bFlxComparativo) then
       begin
          Add('   ,(SELECT ');

          if (ParamFluxo.sQuebra='UN') then Add('        Flx.UnidNegoc, ');
          if (ParamFluxo.sQuebra='CR') then Add('        Flx.CodCentroRespon, ');
          if (ParamFluxo.sQuebra='CC') then Add('        Flx.CodCentroCusto, ');

          //DAVID - Pendência 17038
          if (ParamFluxo.sQuebra='PL') then Add('        Flx.IdPlanoPrev, ');          

          Add('        TRD.CodTipRecDes, ');
          Add('        TRD.RecPag, ');
          Add('        COUNT(*) AS NaoZerados ');
          Add('     FROM '+sFluxo+' Flx, ');
          Add('          TIPORECEBDESEMB TRD ');
          Add('     WHERE ');
          Add('        (Flx.IDPessoa = '+FloatToStr(F_rIDPessoa)+') AND ');
          Add('        (Flx.IDPessoa = TRD.IDPessoa) AND ');
          Add('        (SubStr(Flx.CodTipRecDes,1,Length(RTrim(TRD.CODTIPRECDES)))='+
                       'RTrim(TRD.CODTIPRECDES)) AND ');
          Add('        (Flx.RecPag = TRD.RecPag) AND ');
          Add('        (Flx.IDPessoa = TRD.IDPessoa) AND ');          
          Add('        (Flx.VALOR<>0) AND (Flx.VALOR IS NOT NULL) ');

          MontaFiltro(aSql,ParamFluxo,True);

          if (ParamFluxo.sQuebra='')   then
              Add('     GROUP BY TRD.CodTipRecDes, TRD.RecPag) NumTRD, ');
          if (ParamFluxo.sQuebra='UN') then
              Add('     GROUP BY Flx.UnidNegoc, TRD.CodTipRecDes, TRD.RecPag) NumTRD, ');
          if (ParamFluxo.sQuebra='CR') then
              Add('     GROUP BY Flx.CodCentroRespon, TRD.CodTipRecDes, TRD.RecPag) NumTRD, ');
          if (ParamFluxo.sQuebra='CC') then
              Add('     GROUP BY Flx.CodCentroCusto, TRD.CodTipRecDes, TRD.RecPag) NumTRD, ');

          //DAVID - Pendência 17038
          if (ParamFluxo.sQuebra='PL') then
              Add('     GROUP BY Flx.IdPlanoPrev, TRD.CodTipRecDes, TRD.RecPag) NumTRD, ');
       end
      else
       begin
          //Estrutura para geração do Número de termos não zerados de um TRD no
          //Fluxo Comparativo Orçado x Realizado

          sTipoFlxAux:=ParamFluxo.sTipoFluxo;

          Add('   ,(SELECT ');

          if (ParamFluxo.sQuebra='UN') then Add('        U.UnidNegoc, ');
          if (ParamFluxo.sQuebra='CR') then Add('        U.CodCentroRespon, ');
          if (ParamFluxo.sQuebra='CC') then Add('        U.CodCentroCusto, ');

          //DAVID - Pendência 17038
          if (ParamFluxo.sQuebra='PL') then Add('        U.IdPlanoPrev, ');          

          Add('        U.CodTipRecDes, ');
          Add('        U.RecPag, ');
          Add('        SUM(U.NaoZerados) AS NaoZerados');
          Add('     FROM ');
          Add('        (SELECT ');

          if (ParamFluxo.sQuebra='UN') then Add('            Flx.UnidNegoc, ');
          if (ParamFluxo.sQuebra='CR') then Add('            Flx.CodCentroRespon, ');
          if (ParamFluxo.sQuebra='CC') then Add('            Flx.CodCentroCusto, ');

          //DAVID - Pendência 17038
          if (ParamFluxo.sQuebra='PL') then Add('            Flx.IdPlanoPrev, ');

          Add('            TRD.CodTipRecDes, ');
          Add('            TRD.RecPag, ');
          Add('            COUNT(*) AS NaoZerados ');
          Add('         FROM FluxoOrcado Flx, ');
          Add('              TIPORECEBDESEMB TRD ');
          Add('         WHERE ');
          Add('            (Flx.IDPessoa = '+FloatToStr(F_rIDPessoa)+') AND ');
          Add('            (Flx.IDPessoa = TRD.IDPessoa) AND ');
          Add('            (SubStr(Flx.CodTipRecDes,1,Length(RTrim(TRD.CODTIPRECDES)))='+
                            'RTrim(TRD.CODTIPRECDES)) AND ');
          Add('            (Flx.RecPag=TRD.RecPag) AND ');
          Add('            (Flx.VALOR<>0) AND (Flx.VALOR IS NOT NULL) ');

          ParamFluxo.sTipoFluxo:='O';
          MontaFiltro(aSql,ParamFluxo,True);

          if (ParamFluxo.sQuebra='')   then
              Add('         GROUP BY TRD.CodTipRecDes, TRD.RecPag ');
          if (ParamFluxo.sQuebra='UN') then
              Add('         GROUP BY Flx.UnidNegoc, TRD.CodTipRecDes, TRD.RecPag ');
          if (ParamFluxo.sQuebra='CR') then
              Add('         GROUP BY Flx.CodCentroRespon, TRD.CodTipRecDes, TRD.RecPag ');
          if (ParamFluxo.sQuebra='CC') then
              Add('         GROUP BY Flx.CodCentroCusto, TRD.CodTipRecDes, TRD.RecPag ');

          //DAVID - Pendência 17038
          if (ParamFluxo.sQuebra='PL') then
              Add('     GROUP BY Flx.IdPlanoPrev, TRD.CodTipRecDes, TRD.RecPag ');
              

          Add('        UNION ');

          Add('         SELECT ');

          if (ParamFluxo.sQuebra='UN') then Add('            Flx.UnidNegoc, ');
          if (ParamFluxo.sQuebra='CR') then Add('            Flx.CodCentroRespon, ');
          if (ParamFluxo.sQuebra='CC') then Add('            Flx.CodCentroCusto, ');

          //DAVID - Pendência 17038
          if (ParamFluxo.sQuebra='PL') then Add('            Flx.IdPlanoPrev, ');


          Add('            TRD.CodTipRecDes, ');
          Add('            TRD.RecPag, ');
          Add('            COUNT(*) AS NaoZerados ');
          Add('         FROM FluxoReal Flx, ');
          Add('              TIPORECEBDESEMB TRD ');
          Add('         WHERE ');
          Add('            (Flx.IDPessoa = '+FloatToStr(F_rIDPessoa)+') AND ');
          Add('            (Flx.IDPessoa = TRD.IDPessoa) AND ');
          Add('            (SubStr(Flx.CodTipRecDes,1,Length(RTrim(TRD.CODTIPRECDES)))='+
                            'RTrim(TRD.CODTIPRECDES)) AND ');
          Add('            (Flx.RecPag=TRD.RecPag) AND ');
          Add('            (Flx.VALOR<>0) AND (Flx.VALOR IS NOT NULL) ');

          ParamFluxo.sTipoFluxo:='R';
          MontaFiltro(aSql,ParamFluxo,True);

          if (ParamFluxo.sQuebra='')   then
              Add('         GROUP BY TRD.CodTipRecDes, TRD.RecPag) U ');
          if (ParamFluxo.sQuebra='UN') then
              Add('         GROUP BY Flx.UnidNegoc, TRD.CodTipRecDes, TRD.RecPag) U ');
          if (ParamFluxo.sQuebra='CR') then
              Add('         GROUP BY Flx.CodCentroRespon, TRD.CodTipRecDes, TRD.RecPag) U ');
          if (ParamFluxo.sQuebra='CC') then
              Add('         GROUP BY Flx.CodCentroCusto, TRD.CodTipRecDes, TRD.RecPag) U ');

          //DAVID - Pendência 17038
          if (ParamFluxo.sQuebra='PL') then
              Add('     GROUP BY Flx.IdPlanoPrev, TRD.CodTipRecDes, TRD.RecPag) U ');


          if (ParamFluxo.sQuebra='')   then
              Add('     GROUP BY U.CodTipRecDes, U.RecPag) NumTRD, ');
          if (ParamFluxo.sQuebra='UN') then
              Add('     GROUP BY U.UnidNegoc, U.CodTipRecDes, U.RecPag) NumTRD, ');
          if (ParamFluxo.sQuebra='CR') then
              Add('     GROUP BY U.CodCentroRespon, U.CodTipRecDes, U.RecPag) NumTRD, ');
          if (ParamFluxo.sQuebra='CC') then
              Add('     GROUP BY U.CodCentroCusto, U.CodTipRecDes, U.RecPag) NumTRD, ');

          //DAVID - Pendência 17038
          if (ParamFluxo.sQuebra='PL') then
              Add('     GROUP BY U.IdPlanoPrev, U.CodTipRecDes, U.RecPag) NumTRD, ');


          ParamFluxo.sTipoFluxo:=sTipoFlxAux;
       end;

      //Estrutura para geração do Número de termos não zerados de um TDOC
      if not(ParamFluxo.bFlxComparativo) then
       begin
          Add('    (SELECT ');

          if (ParamFluxo.sQuebra='UN') then Add('        Flx.UnidNegoc, ');
          if (ParamFluxo.sQuebra='CR') then Add('        Flx.CodCentroRespon, ');
          if (ParamFluxo.sQuebra='CC') then Add('        Flx.CodCentroCusto, ');

          //DAVID - Pendência 17038
          if (ParamFluxo.sQuebra='PL') then Add('        Flx.IdPlanoPrev, ');          

          Add('        TDOC.CodTipDoc, ');
          Add('        TDOC.RecPag, ');
          Add('        COUNT(*) AS NaoZerados ');
          Add('     FROM '+sFluxo+' Flx, ');
          Add('          TIPODOCRECPAG TDOC ');
          Add('     WHERE ');
          Add('        (Flx.IDPessoa = '+FloatToStr(F_rIDPessoa)+') AND ');
          Add('        (Flx.CODTIPDOC=TDOC.CODTIPDOC) AND ');
          Add('        NOT (TDOC.CODTIPDOC is null) AND ');
          Add('        (TDOC.CODTIPDOC<>0) AND ');
          Add('        (Flx.VALOR<>0) AND (Flx.VALOR IS NOT NULL) ');

          MontaFiltro(aSql,ParamFluxo,True);

          if (ParamFluxo.sQuebra='')   then
              Add('     GROUP BY TDOC.CODTIPDOC, TDOC.RecPag) NumTDOC ');
          if (ParamFluxo.sQuebra='UN') then
              Add('     GROUP BY Flx.UnidNegoc, TDOC.CODTIPDOC, TDOC.RecPag) NumTDOC ');
          if (ParamFluxo.sQuebra='CR') then
              Add('     GROUP BY Flx.CodCentroRespon, TDOC.CODTIPDOC, TDOC.RecPag) NumTDOC ');
          if (ParamFluxo.sQuebra='CC') then
              Add('     GROUP BY Flx.CodCentroCusto, TDOC.CODTIPDOC, TDOC.RecPag) NumTDOC ');

          //DAVID - Pendência 17038
          if (ParamFluxo.sQuebra='PL') then
              Add('     GROUP BY Flx.IdPlanoPrev, TDOC.CODTIPDOC, TDOC.RecPag) NumTDOC ');
              
       end
      else
       begin
          sTipoFlxAux:=ParamFluxo.sTipoFluxo;

          Add('    (SELECT ');

          if (ParamFluxo.sQuebra='UN') then Add('        U.UnidNegoc, ');
          if (ParamFluxo.sQuebra='CR') then Add('        U.CodCentroRespon, ');
          if (ParamFluxo.sQuebra='CC') then Add('        U.CodCentroCusto, ');

          //DAVID - Pendência 17038
          if (ParamFluxo.sQuebra='PL') then Add('        U.IdPlanoPrev, ');

          Add('        U.CodTipDoc, ');
          Add('        U.RecPag, ');
          Add('        SUM(U.NaoZerados) AS NaoZerados ');
          Add('     FROM ');
          Add('        (SELECT ');

          if (ParamFluxo.sQuebra='UN') then Add('        Flx.UnidNegoc, ');
          if (ParamFluxo.sQuebra='CR') then Add('        Flx.CodCentroRespon, ');
          if (ParamFluxo.sQuebra='CC') then Add('        Flx.CodCentroCusto, ');

          //DAVID - Pendência 17038
          if (ParamFluxo.sQuebra='PL') then Add('        Flx.IdPlanoPrev, ');

          Add('            TDOC.CodTipDoc, ');
          Add('            TDOC.RecPag, ');
          Add('            COUNT(*) AS NaoZerados ');
          Add('         FROM FluxoOrcado Flx, ');
          Add('              TIPODOCRECPAG TDOC ');
          Add('         WHERE ');
          Add('            (Flx.IDPessoa = '+FloatToStr(F_rIDPessoa)+') AND ');          
          Add('            (Flx.CODTIPDOC=TDOC.CODTIPDOC) AND ');
          Add('             NOT (TDOC.CODTIPDOC is null) AND ');
          Add('            (TDOC.CODTIPDOC<>0) AND ');
          Add('            (Flx.VALOR<>0) AND (Flx.VALOR IS NOT NULL) ');

          ParamFluxo.sTipoFluxo:='O';
          MontaFiltro(aSql,ParamFluxo,True);

          if (ParamFluxo.sQuebra='')   then
              Add('         GROUP BY TDOC.CODTIPDOC, TDOC.RecPag ');
          if (ParamFluxo.sQuebra='UN') then
              Add('         GROUP BY Flx.UnidNegoc, TDOC.CODTIPDOC, TDOC.RecPag ');
          if (ParamFluxo.sQuebra='CR') then
              Add('         GROUP BY Flx.CodCentroRespon, TDOC.CODTIPDOC, TDOC.RecPag ');
          if (ParamFluxo.sQuebra='CC') then
              Add('         GROUP BY Flx.CodCentroCusto, TDOC.CODTIPDOC, TDOC.RecPag ');

          //DAVID - Pendência 17038
          if (ParamFluxo.sQuebra='PL') then
              Add('     GROUP BY Flx.IdPlanoPrev, TDOC.CODTIPDOC, TDOC.RecPag ');

          Add('    UNION ');

          Add('        SELECT ');

          if (ParamFluxo.sQuebra='UN') then Add('        Flx.UnidNegoc, ');
          if (ParamFluxo.sQuebra='CR') then Add('        Flx.CodCentroRespon, ');
          if (ParamFluxo.sQuebra='CC') then Add('        Flx.CodCentroCusto, ');

          //DAVID - Pendência 17038
          if (ParamFluxo.sQuebra='PL') then Add('        Flx.IdPlanoPrev, ');

          Add('            TDOC.CodTipDoc, ');
          Add('            TDOC.RecPag, ');
          Add('            COUNT(*) AS NaoZerados ');
          Add('         FROM FluxoReal Flx, ');
          Add('              TIPODOCRECPAG TDOC ');
          Add('         WHERE ');
          Add('            (Flx.IDPessoa = '+FloatToStr(F_rIDPessoa)+') AND ');          
          Add('            (Flx.CODTIPDOC=TDOC.CODTIPDOC) AND ');
          Add('             NOT (TDOC.CODTIPDOC is null) AND ');
          Add('            (TDOC.CODTIPDOC<>0) AND ');
          Add('            (Flx.VALOR<>0) AND (Flx.VALOR IS NOT NULL) ');

          ParamFluxo.sTipoFluxo:='R';
          MontaFiltro(aSql,ParamFluxo,True);

          if (ParamFluxo.sQuebra='')   then
              Add('         GROUP BY TDOC.CODTIPDOC, TDOC.RecPag) U ');
          if (ParamFluxo.sQuebra='UN') then
              Add('         GROUP BY Flx.UnidNegoc, TDOC.CODTIPDOC, TDOC.RecPag) U ');
          if (ParamFluxo.sQuebra='CR') then
              Add('         GROUP BY Flx.CodCentroRespon, TDOC.CODTIPDOC, TDOC.RecPag) U ');
          if (ParamFluxo.sQuebra='CC') then
              Add('         GROUP BY Flx.CodCentroCusto, TDOC.CODTIPDOC, TDOC.RecPag) U ');

          //DAVID - Pendência 17038
          if (ParamFluxo.sQuebra='PL') then
              Add('     GROUP BY Flx.IdPlanoPrev, TDOC.CODTIPDOC, TDOC.RecPag) U ');


          if (ParamFluxo.sQuebra='')   then
              Add('     GROUP BY U.CODTIPDOC, U.RecPag) NumTDOC ');
          if (ParamFluxo.sQuebra='UN') then
              Add('     GROUP BY U.UnidNegoc, U.CODTIPDOC, U.RecPag) NumTDOC ');
          if (ParamFluxo.sQuebra='CR') then
              Add('     GROUP BY U.CodCentroRespon, U.CODTIPDOC, U.RecPag) NumTDOC ');
          if (ParamFluxo.sQuebra='CC') then
              Add('     GROUP BY U.CodCentroCusto, U.CODTIPDOC, U.RecPag) NumTDOC ');

          //DAVID - Pendência 17038
          if (ParamFluxo.sQuebra='PL') then
              Add('     GROUP BY U.IdPlanoPrev, U.CODTIPDOC, U.RecPag) NumTDOC ');
              
          ParamFluxo.sTipoFluxo:=sTipoFlxAux;
        end;

      //Estrutura de Geração dos Valores
      if bGeraValores then
       begin
          //Estrutura de Geração de Total dos Tipos de Rec/Des
          Add('   ,(SELECT ');

          if (ParamFluxo.sQuebra='UN') then Add('        Flx.UnidNegoc, ');
          if (ParamFluxo.sQuebra='CR') then Add('        Flx.CodCentroRespon, ');
          if (ParamFluxo.sQuebra='CC') then Add('        Flx.CodCentroCusto, ');

          //DAVID - Pendência 17038
          if (ParamFluxo.sQuebra='PL') then Add('        Flx.IdPlanoPrev, ');

          Add('        TRD.CodTipRecDes, ');
          Add('        TRD.RecPag, ');
          Add('        Sum(DECODE(TRD.RecPag,''R'',Flx.Valor,-Flx.Valor)) AS TOTAL ');
          Add('     FROM '+sFluxo+' Flx, ');
          Add('        TIPORECEBDESEMB TRD ');
          Add('     WHERE ');
          Add('        (Flx.IDPessoa = '+FloatToStr(F_rIDPessoa)+') AND ');
          Add('        (Flx.IDPessoa = TRD.IDPessoa) AND ');                     
          Add('        (SubStr(Flx.CodTipRecDes,1,Length(RTrim(TRD.CODTIPRECDES)))='+
              'RTrim(TRD.CODTIPRECDES)) AND ');
          Add('        (Flx.RecPag=TRD.RecPag) AND ');
          Add('        (Flx.VALOR<>0) AND (Flx.VALOR IS NOT NULL) ');

          MontaFiltro(aSql,ParamFluxo,False);

          if (ParamFluxo.sQuebra='') then
              Add('     GROUP BY TRD.CodTipRecDes, TRD.RecPag) TotTRD ');
          if (ParamFluxo.sQuebra='UN') then
              Add('     GROUP BY Flx.UnidNegoc, TRD.CodTipRecDes, TRD.RecPag) TotTRD ');
          if (ParamFluxo.sQuebra='CR') then
              Add('     GROUP BY Flx.CodCentroRespon, TRD.CodTipRecDes, TRD.RecPag) TotTRD ');
          if (ParamFluxo.sQuebra='CC') then
              Add('     GROUP BY Flx.CodCentroCusto, TRD.CodTipRecDes, TRD.RecPag) TotTRD ');

          //DAVID - Pendência 17038
          if (ParamFluxo.sQuebra='PL') then
              Add('     GROUP BY Flx.IdPlanoPrev, TRD.CodTipRecDes, TRD.RecPag) TotTRD ');

          //Estrutura de Geração de Totais dos Tipos Documento
          Add('   ,(SELECT ');
          if (ParamFluxo.sQuebra='UN') then Add('        Flx.UnidNegoc, ');
          if (ParamFluxo.sQuebra='CR') then Add('        Flx.CodCentroRespon, ');
          if (ParamFluxo.sQuebra='CC') then Add('        Flx.CodCentroCusto, ');

          //DAVID - Pendência 17038          
          if (ParamFluxo.sQuebra='PL') then Add('        Flx.IdPlanoPrev, ');

          Add('        TDOC.CodTipDoc, ');
          Add('        TDOC.RecPag, ');
          Add('        Sum(DECODE(TDOC.RecPag,''R'',Flx.Valor,-Flx.Valor)) AS TOTAL ');
          Add('     FROM '+sFluxo+' Flx, ');
          Add('        TIPODOCRECPAG TDOC ');
          Add('     WHERE ');
          Add('        (Flx.IDPESSOA='+FloatToStr(F_rIDPessoa)+') AND ');
          Add('        (Flx.CODTIPDOC=TDOC.CODTIPDOC) AND ');
          Add('         NOT (TDOC.CODTIPDOC is null) AND ');
          Add('        (TDOC.CODTIPDOC<>0) AND ');
          Add('        (Flx.VALOR<>0) AND (Flx.VALOR IS NOT NULL) ');

          MontaFiltro(aSql,ParamFluxo,False);

          if (ParamFluxo.sQuebra='') then
              Add('     GROUP BY TDOC.CodTipDoc, TDOC.RecPag) TotTDOC ');
          if (ParamFluxo.sQuebra='UN') then
              Add('     GROUP BY Flx.UnidNegoc, TDOC.CODTIPDOC, TDOC.RecPag) TotTDOC ');
          if (ParamFluxo.sQuebra='CR') then
              Add('     GROUP BY Flx.CodCentroRespon, TDOC.CODTIPDOC, TDOC.RecPag) TotTDOC ');
          if (ParamFluxo.sQuebra='CC') then
              Add('     GROUP BY Flx.CodCentroCusto, TDOC.CODTIPDOC, TDOC.RecPag) TotTDOC ');

          //DAVID - Pendência 17038
          if (ParamFluxo.sQuebra='PL') then
              Add('     GROUP BY Flx.IdPlanoPrev, TDOC.CODTIPDOC, TDOC.RecPag) TotTDOC ');

          //Estrutura de Geração de Cores dos Tipos de Documento
          if (ParamFluxo.sTipoFluxo='P') then
           begin
              Add('   ,(SELECT ');

              if (ParamFluxo.sQuebra='UN') then Add('        Flx.UnidNegoc, ');
              if (ParamFluxo.sQuebra='CR') then Add('        Flx.CodCentroRespon, ');
              if (ParamFluxo.sQuebra='CC') then Add('        Flx.CodCentroCusto, ');

              //DAVID - Pendência 17038
              if (ParamFluxo.sQuebra='PL') then Add('        Flx.IdPlanoPrev, ');
              
              Add('        TRD.CodTipRecDes, ');
              Add('        TRD.RecPag, ');
              Add('        Count(*) AS NumTermComPrev ');
              Add('     FROM FluxoPrevisto Flx, ');
              Add('          TIPORECEBDESEMB TRD ');
              Add('     WHERE ');
              Add('        (Flx.IDPessoa = '+FloatToStr(F_rIDPessoa)+') AND ');
              Add('        (Flx.IDPessoa = TRD.IDPessoa) AND ');
              Add('        (SubStr(Flx.CodTipRecDes,1,Length(RTrim(TRD.CODTIPRECDES)))='+
                  'RTrim(TRD.CODTIPRECDES)) AND ');
              Add('        (Flx.RecPag=TRD.RecPag) AND ');
              Add('        (Flx.VALOR<>0) AND (Flx.VALOR IS NOT NULL) AND ');
              Add('        (Flx.FLGPREVISAO=''S'') ');

              MontaFiltro(aSql,ParamFluxo,False);

              if (ParamFluxo.sQuebra='') then
                  Add('     GROUP BY TRD.CodTipRecDes, TRD.RecPag) QtdePrevTRD ');
              if (ParamFluxo.sQuebra='UN') then
                  Add('     GROUP BY Flx.UnidNegoc, TRD.CodTipRecDes, TRD.RecPag) QtdePrevTRD ');
              if (ParamFluxo.sQuebra='CR') then
                  Add('     GROUP BY Flx.CodCentroRespon, TRD.CodTipRecDes, TRD.RecPag) QtdePrevTRD ');
              if (ParamFluxo.sQuebra='CC') then
                  Add('     GROUP BY Flx.CodCentroCusto, TRD.CodTipRecDes, TRD.RecPag) QtdePrevTRD ');

              //DAVID - Pendência 17038
              if (ParamFluxo.sQuebra='PL') then
                  Add('     GROUP BY Flx.IdPlanoPrev, TRD.CodTipRecDes, TRD.RecPag) QtdePrevTRD ');


              Add('   ,(SELECT ');

              if (ParamFluxo.sQuebra='UN') then Add('        Flx.UnidNegoc, ');
              if (ParamFluxo.sQuebra='CR') then Add('        Flx.CodCentroRespon, ');
              if (ParamFluxo.sQuebra='CC') then Add('        Flx.CodCentroCusto, ');

              //DAVID - Pendência 17038
              if (ParamFluxo.sQuebra='PL') then Add('        Flx.IdPlanoPrev, ');

              Add('        TDOC.CodTipDoc, ');
              Add('        TDOC.RecPag, ');
              Add('        Count(*) AS NumTermComPrev ');
              Add('     FROM FluxoPrevisto Flx, ');
              Add('          TIPODOCRECPAG TDOC ');
              Add('     WHERE ');
              Add('        (Flx.IDPESSOA='+FloatToStr(F_rIDPessoa)+') AND ');              
              Add('        (Flx.CODTIPDOC=TDOC.CODTIPDOC) AND ');
              Add('         NOT (TDOC.CODTIPDOC is null) AND ');
              Add('        (TDOC.CODTIPDOC<>0) AND ');
              Add('        (Flx.VALOR<>0) AND (Flx.VALOR IS NOT NULL) AND ');
              Add('        (Flx.FLGPREVISAO=''S'') ');

              MontaFiltro(aSql,ParamFluxo,False);

              if (ParamFluxo.sQuebra='') then
                 Add('     GROUP BY TDOC.CodTipDoc, TDOC.RecPag) QtdePrevTDOC ');
              if (ParamFluxo.sQuebra='UN') then
                  Add('    GROUP BY Flx.UnidNegoc, TDOC.CODTIPDOC, TDOC.RecPag) QtdePrevTDOC ');
              if (ParamFluxo.sQuebra='CR') then
                  Add('    GROUP BY Flx.CodCentroRespon, TDOC.CODTIPDOC, TDOC.RecPag) QtdePrevTDOC ');
              if (ParamFluxo.sQuebra='CC') then
                  Add('    GROUP BY Flx.CodCentroCusto, TDOC.CODTIPDOC, TDOC.RecPag) QtdePrevTDOC ');

              if (ParamFluxo.sQuebra='PL') then
                  Add('     GROUP BY Flx.IdPlanoPrev, TDOC.CODTIPDOC, TDOC.RecPag) QtdePrevTDOC ');

           end; //Fim geração de Cores
       end;

      //Estrutura de Filtros e Join's da Qry principal
      Add('WHERE ');
      Add('   (LF.CodTipRecDes=NumTRD.CodTipRecDes(+)) AND ');
      Add('   (LF.RecPag=NumTRD.RecPag(+)) AND ');
      Add('   (LF.CodTipDoc=NumTDOC.CodTipDoc(+)) AND ');
      Add('   (LF.RecPag=NumTDOC.RecPag(+)) ');

      if (ParamFluxo.sQuebra='UN') then
       begin
          Add('   AND (LF.UnidNegoc=NumTRD.UnidNegoc(+)) ');
          Add('   AND (LF.UnidNegoc=NumTDOC.UnidNegoc(+)) ');
       end;

      if (ParamFluxo.sQuebra='CR') then
       begin
          Add('   AND (LF.CodCentroRespon=NumTRD.CodCentroRespon(+)) ');
          Add('   AND (LF.CodCentroRespon=NumTDOC.CodCentroRespon(+)) ');
       end;

      if (ParamFluxo.sQuebra='CC') then
       begin
          Add('   AND (LF.CodCentroCusto=NumTRD.CodCentroCusto(+)) ');
          Add('   AND (LF.CodCentroCusto=NumTDOC.CodCentroCusto(+)) ');
       end;

      //DAVID - Pendência 17038
      if (ParamFluxo.sQuebra='PL') then
       begin
          Add('   AND (LF.IdPlanoPrev=NumTRD.IdPlanoPrev(+)) ');
          Add('   AND (LF.IdPlanoPrev=NumTDOC.IdPlanoPrev(+)) ');
       end;

      if bGeraValores then
       begin
          Add('   AND (LF.CodTipRecDes=TotTRD.CodTipRecDes(+)) ');
          Add('   AND (LF.RecPag=TotTRD.RecPag(+)) ');
          Add('   AND (LF.CodTipDoc=TotTDOC.CodTipDoc(+)) ');
          Add('   AND (LF.RecPag=TotTDOC.RecPag(+)) ');

          if (ParamFluxo.sTipoFluxo='P') then
           begin
              Add('   AND (LF.CodTipRecDes=QtdePrevTRD.CodTipRecDes(+)) ');
              Add('   AND (LF.RecPag=QtdePrevTRD.RecPag(+))  ');
              Add('   AND (LF.CodTipDoc=QtdePrevTDOC.CodTipDoc(+)) ');
              Add('   AND (LF.RecPag=QtdePrevTDOC.RecPag(+)) ');
           end;

          if (ParamFluxo.sQuebra='UN') then
           begin
              Add('   AND (LF.UnidNegoc=TotTRD.UnidNegoc(+)) ');
              Add('   AND (LF.UnidNegoc=TotTDOC.UnidNegoc(+)) ');
              if (ParamFluxo.sTipoFluxo='P') then
               begin
                  Add('   AND (LF.UnidNegoc=QtdePrevTRD.UnidNegoc(+)) ');
                  Add('   AND (LF.UnidNegoc=QtdePrevTDOC.UnidNegoc(+)) ');
               end;
           end;

          if (ParamFluxo.sQuebra='CR') then
           begin
              Add('   AND (LF.CodCentroRespon=TotTRD.CodCentroRespon(+)) ');
              Add('   AND (LF.CodCentroRespon=TotTDOC.CodCentroRespon(+)) ');
              if (ParamFluxo.sTipoFluxo='P') then
               begin
                  Add('   AND (LF.CodCentroRespon=QtdePrevTRD.CodCentroRespon(+)) ');
                  Add('   AND (LF.CodCentroRespon=QtdePrevTDOC.CodCentroRespon(+)) ');
               end;
           end;

          if (ParamFluxo.sQuebra='CC') then
           begin
              Add('   AND (LF.CodCentroCusto=TotTRD.CodCentroCusto(+)) ');
              Add('   AND (LF.CodCentroCusto=TotTDOC.CodCentroCusto(+)) ');
              if (ParamFluxo.sTipoFluxo='P') then
               begin
                  Add('   AND (LF.CodCentroCusto=QtdePrevTRD.CodCentroCusto(+)) ');
                  Add('   AND (LF.CodCentroCusto=QtdePrevTDOC.CodCentroCusto(+)) ');
               end;
           end;

          //DAVID - Pendência 17038
          if (ParamFluxo.sQuebra='PL') then
           begin
              Add('   AND (LF.IdPlanoPrev=TotTRD.IdPlanoPrev(+)) ');
              Add('   AND (LF.IdPlanoPrev=TotTDOC.IdPlanoPrev(+)) ');
              if (ParamFluxo.sTipoFluxo='P') then
               begin
                  Add('   AND (LF.IdPlanoPrev=QtdePrevTRD.IdPlanoPrev(+)) ');
                  Add('   AND (LF.IdPlanoPrev=QtdePrevTDOC.IdPlanoPrev(+)) ');
               end;
           end;

       end;

      //Estrutura de Saldo a Transportar
      Add('--Linha de Saldo a Transportar ');
      Add('UNION ALL ');
      Add('SELECT ');

      if (ParamFluxo.sQuebra='UN') then
       begin
          Add('   99999999999999999999999999999999999999999999999999 AS UnidNegoc, ');
          Add('   '' '' AS UnidadeNeg, ');
       end;

      if (ParamFluxo.sQuebra='CR') then
       begin
          Add('   ''9999999999'' AS CodCentroRespon, ');
          Add('   '' '' AS Nome, ');
       end;

      if (ParamFluxo.sQuebra='CC') then
       begin
          Add('   ''9999999999'' AS CodCentroCusto, ');
          Add('   '' '' AS Nome, ');
       end;

      //DAVID - Pendência 17038
      if (ParamFluxo.sQuebra='PL') then
       begin
          Add('   9999999999 AS IdPlanoPrev, ');
          Add('   '' '' AS Nome, ');
       end;

      Add('   99999999999999999999999999999999999999999999999999 AS ORDEM, ');
      Add('   ''Z''  AS POSICAO, ');
      Add('   0 AS CODLINHAFLUXO, ');
      Add('   0 AS CODCOMPLINHA, ');
      Add('   '''+sTipSalTransp+''' AS LINHAFLUXO, ');
      Add('   ''99999999'' AS CODTIPRECDES, ');
      Add('   0 AS CODTIPDOC, ');
      Add('   ''R'' RECPAG, ');
      Add('   0 AS NUMCARCODTRD, ');
      Add('   ''X'' AS TIPOCALCULO, ');
      Add('   ''N'' AS FLGACUMULA, ');
      Add('   ''F'' AS POSICAOTOTAL, ');
      Add('   0 AS TOTAL, ');
      Add('   ''clBlack          '' AS CORCAMPO, ');
      Add('   0  AS NUMTERMOS, ');
      Add('   ''#'' AS LINHATOTAL ');
      Add('FROM DUAL ');

      //Estrutura de Ordenação
      Add('ORDER BY ');

     //Estrutura para quebra por Unidade de Negócio ou Centro de Responsabilidade
      if (ParamFluxo.sQuebra='UN') then Add('   UnidNegoc, ');
      if (ParamFluxo.sQuebra='CR') then Add('   CodCentroRespon, ');
      if (ParamFluxo.sQuebra='CC') then Add('   CodCentroCusto, ');

      //DAVID - Pendência 17038
      if (ParamFluxo.sQuebra='PL') then Add('   IdPlanoPrev, ');

      Add('   ORDEM, ');
      Add('   POSICAO, ');
      Add('   CODTIPRECDES ');
      Result:=GetDataPacket(aSql.Text);

   finally
       Free;
   end;

   if bGeraValores then
    begin
       //Gera Saldo Inicial
       if (rSaldoInicial=0) then rSaldoInicial:=GeraSaldoInicialFluxo(ParamFluxo);
       if (rSaldoInicial=-0.000001) then rSaldoInicial:=0;
       Result:=GeraSomatorios(Result,ParamFluxo,rSaldoInicial);
    end;
end;

function TCtrlFluxoCaixa.BuscaNomeFluxo(sTipoFluxo: String): String;
begin
   Result:='';
   if (sTipoFluxo='P') then Result:='FluxoPrevisto';
   if (sTipoFluxo='R') then Result:='FluxoReal';
   if (sTipoFluxo='O') then Result:='FluxoOrcado';
   if (sTipoFluxo='OXR') then Result:='FluxoOrcado';
end;

procedure TCtrlFluxoCaixa.MontaFiltro(aSql: TStringList; ParamFluxo: TParamFluxo;
          bTodoPeriodo: Boolean);
begin
   with aSql do
   begin
      //Estrutura para filtragem por Unid.Negóc. , C. Respon. , Centro de Custo, Plano e Patrocinador
      if  (ParamFluxo.rUnidNeg<>0) then
         Add('       AND (Flx.UnidNegoc='+FloatToStr(ParamFluxo.rUnidNeg)+') ');
      if Trim(ParamFluxo.sCentroResp)<>'' then
         Add('       AND (Flx.CodCentroRespon='''+Trim(ParamFluxo.sCentroResp)+''') ');
      if Trim(ParamFluxo.sCentroCusto)<>'' then
         Add('       AND (Flx.CodCentroCusto='''+Trim(ParamFluxo.sCentroCusto)+''') ');
//      if (ParamFluxo.rIDPlanoPrev<>0) then
//         Add('       AND (Flx.IDPLANOPREV='+FloatToStr(ParamFluxo.rIDPlanoPrev)+') ');
      if (formatFloat('0', ParamFluxo.rIDPlanoPrev) <> '0') then  // tavares
         Add('       AND (Flx.IDPLANOPREV='+formatFloat('0', ParamFluxo.rIDPlanoPrev)+') ');
      if (ParamFluxo.rIDPatro<>0) then
         Add('       AND (Flx.IDPATRO='+FloatToStr(ParamFluxo.rIDPatro)+') ');

      //Estrutura para filtragem por Prazo
      if (ParamFluxo.sTipoFluxo='O') then
       begin
          if (ParamFluxo.sPrazo='C') then Add('       AND (Flx.Prazo=''C'') ');
          if (ParamFluxo.sPrazo='M') then Add('       AND (Flx.Prazo=''M'') ');
          if (ParamFluxo.sPrazo='L') then Add('       AND (Flx.Prazo=''L'') ');
       end;

      if bTodoPeriodo then
       begin
          ParamFluxo.dDataInicial:=ParamFluxo.dDataInicFluxo;
          ParamFluxo.dDataFinal:=ParamFluxo.dDataFinalFluxo;
       end;

      //Estrutura de Filtragem por data
      if (ParamFluxo.sTipoFluxo='P') or (ParamFluxo.sTipoFluxo='O') then
       begin
          Add('       AND (Flx.DATAPROGRAMADA>=To_Date( '+
               #39+FormatDateTime('dd/mm/yyyy',ParamFluxo.dDataInicial)+#39+', '+
               #39+'DD/MM/YYYY'+#39+')) ');
          Add('       AND (Flx.DATAPROGRAMADA<=To_Date( '+
               #39+FormatDateTime('dd/mm/yyyy',ParamFluxo.dDataFinal)+#39+', '+
               #39+'DD/MM/YYYY'+#39+')) ');
       end
      else
      begin
          Add('       AND (Flx.DATACFLOAT>=To_Date( '+
               #39+FormatDateTime('dd/mm/yyyy',ParamFluxo.dDataInicial)+#39+', '+
               #39+'DD/MM/YYYY'+#39+')) ');
          Add('       AND (Flx.DATACFLOAT<=To_Date( '+
               #39+FormatDateTime('dd/mm/yyyy',ParamFluxo.dDataFinal)+#39+', '+
               #39+'DD/MM/YYYY'+#39+')) ');
       end;
   end;
end;

function TCtrlFluxoCaixa.GeraSomatorios(LinhasFluxo: OleVariant; ParamFluxo: TParamFluxo;
                                        rSaldoInicial: Double): OleVariant;
var
   bContinua         : Boolean;
   aSomatorio        : TStringList;
   cdsAux            : TCMClientDataSet;
   rSaldoTransportar : Double;

   function AssociaValores: Boolean;
   var
      sCorAux        : String;
      bCondicao      : Boolean;
      rUnidNeg       : Double;
      sCentroRespon  : String;
      sCentroCusto   : String;
      //----------------------
      rValorAux      : Double;
      iPosicao       : LongInt; 
   begin
      //
      //Rotina de associação de Total de uma linha ao total de uma outra linha de
      //mesmo código (CODCOMPLINHA)
      //

      iPosicao:=0;
      
      Result:=False;
      cdsAux.First;
      aSomatorio.Clear;
      while not(cdsAux.Eof) do
      begin
         if (cdsAux.FieldByName('CODLINHAFLUXO').AsFloat=
             cdsAux.FieldByName('CODCOMPLINHA').AsFloat) and
            (cdsAux.FieldByName('TIPOCALCULO').AsString<>'T') and
            (cdsAux.FieldByName('LINHATOTAL').AsString='#') and
            (cdsAux.FieldByName('TIPOCALCULO').AsString<>'X')then
          begin
             if (ParamFluxo.sQuebra='') then
                 aSomatorio.Add('#'+FloatToStr(cdsAux.FieldByName('CODLINHAFLUXO').AsFloat));
             if (ParamFluxo.sQuebra='UN') then
                 aSomatorio.Add('#'+FloatToStr(cdsAux.FieldByName('UnidNegoc').AsFloat)+'-'+
                                    FloatToStr(cdsAux.FieldByName('CODLINHAFLUXO').AsFloat));
             if (ParamFluxo.sQuebra='CR') then
                 aSomatorio.Add('#'+Trim(cdsAux.FieldByName('CodCentroRespon').AsString)+'-'+
                                    FloatToStr(cdsAux.FieldByName('CODLINHAFLUXO').AsFloat));
             if (ParamFluxo.sQuebra='CC') then
                 aSomatorio.Add('#'+Trim(cdsAux.FieldByName('CodCentroCusto').AsString)+'-'+
                                    FloatToStr(cdsAux.FieldByName('CODLINHAFLUXO').AsFloat));

             //DAVID - Pendência 17038
             if (ParamFluxo.sQuebra='PL') then
                 aSomatorio.Add('#'+Trim(cdsAux.FieldByName('IdPlanoPrev').AsString)+'-'+
                                    FloatToStr(cdsAux.FieldByName('CODLINHAFLUXO').AsFloat));

             aSomatorio.Add(FloatToStr(cdsAux.FieldByName('TOTAL').AsFloat));

          end;
         cdsAux.Next;
      end;

      cdsAux.First;
      while not(cdsAux.Eof) do
      begin
         if (cdsAux.FieldByName('CODLINHAFLUXO').AsFloat<>
             cdsAux.FieldByName('CODCOMPLINHA').AsFloat) and
            (cdsAux.FieldByName('TIPOCALCULO').AsString<>'T') and
            (cdsAux.FieldByName('TIPOCALCULO').AsString<>'X') then
          begin
             if (ParamFluxo.sQuebra='') then
                 iPosicao:=aSomatorio.IndexOf('#'+
                           FloatToStr(cdsAux.FieldByName('CODCOMPLINHA').AsFloat));

             if (ParamFluxo.sQuebra='UN') then
                 iPosicao:=aSomatorio.IndexOf('#'+
                           FloatToStr(cdsAux.FieldByName('UnidNegoc').AsFloat)+'-'+
                           FloatToStr(cdsAux.FieldByName('CODCOMPLINHA').AsFloat));

             if (ParamFluxo.sQuebra='CR') then
                 iPosicao:=aSomatorio.IndexOf('#'+
                           Trim(cdsAux.FieldByName('CodCentroRespon').AsString)+'-'+
                           FloatToStr(cdsAux.FieldByName('CODCOMPLINHA').AsFloat));

             if (ParamFluxo.sQuebra='CC') then
                 iPosicao:=aSomatorio.IndexOf('#'+
                             Trim(cdsAux.FieldByName('CodCentroCusto').AsString)+'-'+
                             FloatToStr(cdsAux.FieldByName('CODCOMPLINHA').AsFloat));

             //DAVID - Pendência 17038
             if (ParamFluxo.sQuebra='PL') then
                 iPosicao:=aSomatorio.IndexOf('#'+
                             Trim(cdsAux.FieldByName('IdPlanoPrev').AsString)+'-'+
                             FloatToStr(cdsAux.FieldByName('CODCOMPLINHA').AsFloat));

             if (iPosicao<>-1) then
              begin
                 rValorAux:=StrToFloat(aSomatorio.Strings[iPosicao+1]);
                 if (cdsAux.FieldByName('TOTAL').AsFloat<>rValorAux) then
                  begin
                     cdsAux.Edit;
                     cdsAux.FieldByName('TOTAL').AsFloat:=rValorAux;
                     cdsAux.Post;
                     Result:=True;
                  end;
              end;
          end;
         cdsAux.Next;
      end;
   end;

   function Totaliza: Boolean;
   var
      rUltimaLinha   : Double;
      iPosicao       : Longint;
      rTotal         : Double;
      PosicaoAtual   : TbookMark;
      PosicaoAux     : TbookMark;
      bComPrevisao   : Boolean;

      procedure GeraCorLinhaSoma;
      begin
         //Gera Cor das linhas de Somatório de outras linhas
         if (ParamFluxo.sTipoFluxo='P') then
          begin
             if (cdsAux.FieldByName('TIPOCALCULO').AsString='R') or
                (cdsAux.FieldByName('TIPOCALCULO').AsString='C') then
              begin
                 if bComPrevisao then
                    cdsAux.FieldByName('CORCAMPO').AsString:=
                                       ParamFluxo.Legenda.sCorRecComPrev
                 else
                    cdsAux.FieldByName('CORCAMPO').AsString:=
                                       ParamFluxo.Legenda.sCorRecSemPrev;
              end
             else
              begin
                 if bComPrevisao then
                    cdsAux.FieldByName('CORCAMPO').AsString:=
                                        ParamFluxo.Legenda.sCorPgtoComPrev
                 else
                    cdsAux.FieldByName('CORCAMPO').AsString:=
                                        ParamFluxo.Legenda.sCorPgtoSemPrev;
              end;
          end
         else
          begin
             if (rTotal<0) and bDesVermelho then
                 cdsAux.FieldByName('CORCAMPO').AsString:='clRed'
             else
                 cdsAux.FieldByName('CORCAMPO').AsString:='clBlack';
          end;
      end;

   begin
      //
      //Totalização de linhas do mesmo conjunto
      //
      rTotal:=0;
      iPosicao:=0;
      rUltimaLinha:=0;
      PosicaoAux:=nil;
      bComPrevisao:=False;

      Result:=False;

      cdsAux.First;
      while not(cdsAux.Eof) do
      begin
         if (cdsAux.FieldByName('TIPOCALCULO').AsString='T') or
            (cdsAux.FieldByName('TIPOCALCULO').AsString='X') then
          begin
             cdsAux.Next;
             Continue;
          end;

         if (cdsAux.FieldByName('CODLINHAFLUXO').AsFloat<>rUltimaLinha) then
          begin
             //-------------------------------------
             // Linha diferente do bloco anterior
             //-------------------------------------

             if (cdsAux.FieldByName('LINHATOTAL').AsString='#') then
              begin
                 //Testa se já existe alguma linha de total ainda pendente
                 if (PosicaoAux=nil) then
                  begin
                     rTotal:=0;
                     rUltimaLinha:=cdsAux.FieldByName('CODLINHAFLUXO').AsFloat;
                     bComPrevisao:=False;
                     PosicaoAux:=cdsAux.GetBookmark;
                  end
                 else
                  begin
                     //Guarda posição atual
                     PosicaoAtual:=cdsAux.GetBookmark;

                     //Resgata posição anterior
                     cdsAux.GotoBookmark(PosicaoAux);
                     cdsAux.FreeBookmark(PosicaoAux);
                     PosicaoAux:=nil;

                     if (cdsAux.FieldByName('TOTAL').AsFloat<>rTotal) then Result:=True;

                     cdsAux.Edit;
                     //Atribui valor
                     cdsAux.FieldByName('TOTAL').AsFloat:=rTotal;
                     GeraCorLinhaSoma;
                     cdsAux.Post;

                     //Atualiza Saldo a Transportar
                     if (cdsAux.FieldByName('LinhaTotal').AsString='#') and
                        (cdsAux.FieldByName('TipoCalculo').AsString<>'L') then
                         rSaldoTransportar:=rSaldoTransportar+rTotal;

                     cdsAux.GotoBookmark(PosicaoAtual);
                     cdsAux.FreeBookmark(PosicaoAtual);

                     //Zera parametros
                     rTotal:=0;
                     rUltimaLinha:=cdsAux.FieldByName('CODLINHAFLUXO').AsFloat;
                     bComPrevisao:=False;
                     PosicaoAux:=cdsAux.GetBookmark;
                  end; // fim do if de somatório pendente
              end
             else
              begin
                 //Guarda posição atual
                 PosicaoAtual:=cdsAux.GetBookmark;

                 //Resgata posição anterior
                 cdsAux.GotoBookmark(PosicaoAux);
                 cdsAux.FreeBookmark(PosicaoAux);
                 PosicaoAux:=nil;

                 if (cdsAux.FieldByName('TOTAL').AsFloat<>rTotal) then Result:=True;

                 cdsAux.Edit;
                 //Atribui valor
                 cdsAux.FieldByName('TOTAL').AsFloat:=rTotal;
                 GeraCorLinhaSoma;
                 cdsAux.Post;

                 //Atualiza Saldo a Transportar
                 if (cdsAux.FieldByName('LinhaTotal').AsString='#') and
                    (cdsAux.FieldByName('TipoCalculo').AsString<>'L') then
                     rSaldoTransportar:=rSaldoTransportar+rTotal;

                 cdsAux.GotoBookmark(PosicaoAtual);
                 cdsAux.FreeBookmark(PosicaoAtual);

                 //Zera parametros
                 rTotal:=0;
                 rUltimaLinha:=cdsAux.FieldByName('CODLINHAFLUXO').AsFloat;
                 bComPrevisao:=False;
              end;
          end
         else
          begin
             //---------------------
             //Mesmo bloco de linhas
             //---------------------

             if (cdsAux.FieldByName('LINHATOTAL').AsString='#') then
              begin
                 //Gravação de linhas de total de fim de bloco

                 if (cdsAux.FieldByName('TOTAL').AsFloat<>rTotal) then Result:=True;

                 cdsAux.Edit;

                 //Atribui valor
                 cdsAux.FieldByName('TOTAL').AsFloat:=rTotal;
                 GeraCorLinhaSoma;
                 cdsAux.Post;

                 //Atualiza Saldo a Transportar
                 if (cdsAux.FieldByName('LinhaTotal').AsString='#') and
                    (cdsAux.FieldByName('TipoCalculo').AsString<>'L') then
                     rSaldoTransportar:=rSaldoTransportar+rTotal;
              end
             else
              begin
                 //Testa se existe algum lançamento com previsão
                 if (ParamFluxo.sTipoFluxo='P') and
                    ((cdsAux.FieldByName('CORCAMPO').AsString=ParamFluxo.Legenda.sCorRecComPrev) or
                     (cdsAux.FieldByName('CORCAMPO').AsString=ParamFluxo.Legenda.sCorPgtoComPrev)) and
                    (cdsAux.FieldByName('TOTAL').AsFloat<>0) then
                    bComPrevisao:=True;

                 //Acumula valor
                 if (cdsAux.FieldByName('LinhaTotal').AsString='S') then
                    rTotal:=rTotal+cdsAux.FieldByName('TOTAL').AsFloat;
              end;
          end;       

         cdsAux.Next;
      end;

      if not(PosicaoAux=nil) then
       begin
          //Resgata posição anterior
          cdsAux.GotoBookmark(PosicaoAux);
          cdsAux.FreeBookmark(PosicaoAux);
          PosicaoAux:=nil;

          if (cdsAux.FieldByName('TOTAL').AsFloat<>rTotal) then Result:=True;

          //Atribui valor
          cdsAux.Edit;
          cdsAux.FieldByName('TOTAL').AsFloat:=rTotal;
          GeraCorLinhaSoma;
          cdsAux.Post;

          //Atualiza Saldo a Transportar
          if (cdsAux.FieldByName('LinhaTotal').AsString='#') and
             (cdsAux.FieldByName('TipoCalculo').AsString<>'L') then
              rSaldoTransportar:=rSaldoTransportar+rTotal;
       end;
   end;

begin
   cdsAux:=TCMClientDataSet.Create(nil);
   aSomatorio:=TStringList.Create;
   try
      cdsAux.Data:=LinhasFluxo;

      if (ParamFluxo.sQuebra='UN') then
       begin
          cdsAux.AddIndex('Indice','UnidNegoc;Ordem;Posicao;CodTipRecDes',[]);
          cdsAux.IndexName:='Indice';
       end;

      if (ParamFluxo.sQuebra='CR') then
       begin
          cdsAux.AddIndex('Indice','CodCentroRespon;Ordem;Posicao;CodTipRecDes',[]);
          cdsAux.IndexName:='Indice';
       end;

      if (ParamFluxo.sQuebra='CC') then
       begin
          cdsAux.AddIndex('Indice','CodCentroCusto;Ordem;Posicao;CodTipRecDes',[]);
          cdsAux.IndexName:='Indice';
       end;

      //DAVID - Pendência 17038
      if (ParamFluxo.sQuebra='PL') then
       begin
          cdsAux.AddIndex('Indice','IdPlanoPrev;Ordem;Posicao;CodTipRecDes',[]);
          cdsAux.IndexName:='Indice';
       end;                                    

      cdsAux.First;

      //Grava Saldo Anterior
      cdsAux.Edit;
      cdsAux.FieldByName('TOTAL').AsFloat:=rSaldoInicial;
      cdsAux.Post;

      bContinua:=True;
      rSaldoTransportar:=rSaldoInicial;
      Totaliza;

      while bContinua do
      begin
         bContinua:=AssociaValores;
         rSaldoTransportar:=rSaldoInicial;
         bContinua:=bContinua or Totaliza;
      end;

      //Grava Saldo a Transportar
      cdsAux.Last;
      cdsAux.Edit;
      cdsAux.FieldByName('TOTAL').AsFloat:=rSaldoTransportar;
      cdsAux.Post;

      Result:=cdsAux.Data;

   finally
      cdsAux.Free;
      aSomatorio.Free;
   end;
end;

function TCtrlFluxoCaixa.ListDadosImpressao(
  sOrientacao: String): OleVariant;
var
   sSql: String;
begin
   sSql:='SELECT '+
{ André Tavares  07/07/2003 - resolução da pendência 14406
         '   ''12345678901234567890123456789012345'' AS LinhaFluxo, '+
}         '   ''123456789012345678901234567890123456789012345678901234567890123456789'' AS LinhaFluxo, '+
         '   ''123456789012345678901234567890''      AS Data1, '+
         '   ''123456789012345678901234567890''      AS Valor1, '+
         '   0 AS Cor1, '+
         '   ''123456789012345678901234567890''      AS Data2, '+
         '   ''123456789012345678901234567890''      AS Valor2, '+
         '   0 AS Cor2, '+
         '   ''123456789012345678901234567890''      AS Data3, '+
         '   ''123456789012345678901234567890''      AS Valor3, '+
         '   0 AS Cor3, '+
         '   ''123456789012345678901234567890''      AS Data4, '+
         '   ''123456789012345678901234567890''      AS Valor4, '+
         '   0 AS Cor4, '+
         '   ''123456789012345678901234567890''      AS Data5, '+
         '   ''123456789012345678901234567890''      AS Valor5, '+
         '   0 AS Cor5 ';

   if (sOrientacao<>'RETRATO') then
    begin
       sSql:=sSql+'   ,''123456789012345678901234567890''     AS Data6, '+
                  '   ''123456789012345678901234567890''      AS Valor6, '+
                  '   0 AS Cor6, '+
                  '   ''123456789012345678901234567890''      AS Data7, '+
                  '   ''123456789012345678901234567890''      AS Valor7, '+
                  '   0 AS Cor7, '+
                  '   ''123456789012345678901234567890''      AS Data8, '+
                  '   ''123456789012345678901234567890''      AS Valor8, '+
                  '   0 AS Cor8 ';
    end;

    sSql:=sSql+'FROM '+
               '   Dual '+
               'WHERE '+
               '   (1=2) /*+OPTIMIZER_MODE RULE*/';
    Result:=GetDataPacket(sSql);
end;

end.

