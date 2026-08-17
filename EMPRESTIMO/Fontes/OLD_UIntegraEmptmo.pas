{---------------------------Alteração-------------------------------------------
Pendência   : SOL 114575 KINTANA 535771
Responsável : Jéssica Lana
Data        : 24/04/2009
Descrição   : Gravar arquivos com a query de entrada na pasta C:\PLANUS\TEMP.
-------------------------------------------------------------------------------}
unit UIntegraEmptmo;

// -------------------------------------------------------------------------------------------------
//
// -------------------------------------------------------------------------------------------------

interface

uses
   forms,          (* TApplication *)
   wwquery,        (* TwwQuery *)
   dbtables,       (* TTable *)
   DB,             (* TFieldType *)
   classes,        (* TStringList *)
   dialogs,        (* Message_ *)
   sysutils,       (* FileExists *)
   stdctrls,       (* TLabel *)
   Controls,
   comctrls,       (* TProgressBar *)
   uTypesEmptmo;


type
   TIntegraEmptmo = Class(TObject)

   private { Private declarations }

      (* procedimento que abre a tabela de parâmetros de acordo com com os parâmetros passados *)
      procedure AbreParamIntegra(const iTipoContrato, iItem, iPlano, iPatro: Int64);

      (* procedimento que busca a Entidade Contábil associada a um Plano *)
      function EntidadeContabil(const iPlano: Int64): int64;

      (* funções de manipulação de tabelas temporárias PARADOX para consolidação
         da contabilização de eventos *)
      function DefineEstruturaTabelaPDX(var T: TTable): Boolean;

      procedure GravaItemPDX(const sOrigemContab, sTipoContab: String; var T: TTable;
      							  var rParamIntegra: TParamIntegra; const dDataLanc: TDateTime;
                             const iExercicio, iPeriodo: Integer);

      (* função que consolida os lançamentos e gera a efetiva contabilização *)
      function ConsolidaContabiliza(const sHistorico: String): Int64;

      procedure GravaPlanilha(const iPlanilha: Int64; const sTipoContab: String = 'N');

      procedure MontaParamCAPCAR(var rParam: TParamIntegra; const iTipoDocRec, iTipoDocPag: Int64;
                                 const dDataLanc, dDataVenc: TDateTime; const qry: TwwQuery);

      function ComparaParam(var rParam1, rParam2: TParamIntegra): Boolean;

      function BuscaRamoForCli(const sSituacao, sRecPag: String): Int64;

      function InsereDocumento(var rParam: TParamIntegra; var sErro: TStringList): Boolean;
      function LancaRateio(var rParam: TParamIntegra; var sErro: TStringList): Boolean;
      function LancaDocumento(var   rParam      : TParamIntegra;
                              const fValor      : Currency;
                              const sHistorico  : String;
                              var   iPlanilha   : Integer;
                              var   sErro       : TStringList
                              ): Boolean;

      function SetMensagem(const iDocumento: Int64; const vMsgCnab: Array of String;
                           var sErro: TStringList): Boolean;

      (* Função que efetua cada par de lançamentos contábeis *)
      function LancamentoContabil(var rParamContabeis: TParamIntegra;
                                  const sDebCre, sHistorico: String;
                                  const bMostraMsg: Boolean;
                                  var iPlanilha: Integer;
                                  var sMensContab: String): Boolean;

      function AtualizaHistoricoComDocumento(const rParam: TParamIntegra;
                                             var sErro: TStringList): Boolean;

      function AtualizaHistoricoComFlgEnvio(const iHistorico: Int64; var sErro: TStringList): Boolean;

      function ConsolidaInsTmpDesc(const sNomePatro, sHistorico, sAnoMesCob: String;
                                   const iLote, iExercicio, iPeriodo: Integer;
                                   var sErro : TStringList;
                                   var iTotalReg : Integer;
                                   var fTotalPatro: Currency): Boolean;

      function DefineEstruturaTabelaTEMP(var T: TTable): Boolean;

      function GravaTabelaTemp(var   T                : TTable;
                               const qry              : TwwQuery;
                               const rParamIntegra    : TParamIntegra;
                               const dDataLanc        : TDateTime;
                               const iExercicio       : Integer;
                               const iPeriodo         : Integer
                               ): Boolean;

      function InsertTmpDesc(const Registro: TDadosTmpDesc): Boolean;

      procedure LimpaRegistroTmpDesc(var Registro: TDadosTmpDesc);


   public { Public declarations }

      (* Procedimento limpa/inicializa o registro de parâmetros *)
      procedure LimpaParamIntegra(var rParamIntegra: TParamIntegra);

      (* Procedimento que busca a parametrização financeira/contábil dos itens *)
      function BuscaParamIntegra(const sOrigemContab: String; var rParamIntegra: TParamIntegra; qry: TwwQuery): integer;

      (* Função de contabilização de itens em batch *)
      function ContabilizaItens(const sOrigemContab, sTipoContab, sSQL, sHistorico: string;
                                const dDataLanc: TDateTime; var sResult, sErro: TStringList;
                                var iPlanilhaResult: Integer): integer;

      procedure CriaTabelaPDX(const sTabela: String; var T: TTable);

      function ExcluiTabelaPDX(const sTabela: String; var T: TTable): Boolean;

      function EnviaCAPCAR(const sSQL, sHistorico,sNomePatro: String; const dDataLanc: TDateTime;
                           var iPlanilha: Integer; var sResult, sErro: TStringList): Integer;

      function EnviaTMPDESC(const sSQL, sHistorico, sNomePatro, sAnoMesCob: String;
                            const dDataLanc: TDateTime; var sResult, sErro: TStringList;
                            const iPatro: Integer; var iLote, iTotalReg: Integer;
                            var fTotalPatro: Currency): Integer;

      function InsertCtrlInterface(const iIDLote, iNumReg, iPatro: Int64;
                                   const sMesRef: String;
                                   const fValor: Currency): Boolean;

      function ExcluiTMPDESC(const iContratoEmptmo : Int64;
                             const iParcela        : Integer;
                             const sMesCobranca    : String;
			      				  const bMostraMsg      : Boolean = True
                             ): Boolean;

      (* Verifica se é possível excluir a folha *)
      function ValidaFolha(const idContrato: Int64; iMesCobranca, iAnoCobranca: Integer;
                           var sStatus: TStatusEnvio; const bMostraMsg: Boolean): Boolean;

      (* Verifica se há itns marcados para envio e ainda não *)
      function VerificaEnvio: Boolean;

      function ExcluiContabil(const iPlanilha : int64; var sMsg : String) : Integer;
      function ExcluiFinanceiro(const iDocumento : int64; var sMsg : String) : Integer;
      function EfetuaBaixaCAR(const iDocumento : int64) : Boolean;

      function DesfazEnvio(const iContratoEmptmo: Int64;
                           const iParcela       : Integer;
                           const iAno           : Integer;
                           const iMes           : Integer;
                           const dDataPrevista  : TDateTime;
                           const bCompetencia   : Boolean;
                           const sFormaEnvio    : String;
                           const bMostraMsg     : Boolean = True
                          ): Boolean;

      function VerificaDocumento(const iCodDocumento : Int64;
                                 var sMsg : String) : Integer;

      function VerificaPlanilha(const iPlanilha : Int64; var sMsg : String) : Integer;

   end;




var IntegraEmptmo : TIntegraEmptmo;



implementation
uses
   dBaseDados, uDataBase, uSistema, uMensErro, dEmptmo, FProgresso, uIntegraBack, uFuncaoGeral,
   UCalcEmptmo,    (* BuscaData *)
   UFuncoesEmptmo, (* BuscaSitPart *)
   dIntegraEmptmo,
   UModulo,        (* TModulo *)
   ULancContab,    (* TestaPeriodo *)
   UDocumento;     (* Rotinas do CAPCAR *)




procedure TIntegraEmptmo.AbreParamIntegra(const iTipoContrato, iItem, iPlano, iPatro: Int64);
var
   sSql: String;
begin

   sSql :=
   'SELECT '                                                                  + #13 +
   '  PI.IDPARAMINTEGRAEP , PI.DESCPARAMINTEGRA, PI.IDPLANOPREVCONTAB, '      + #13 +
   '  PI.IDPLANOPREV      , PI.IDPATRO         , PI.IDTIPOEMPTMO     , '      + #13 +
   '  PI.IDTIPOCONTREMPTMO, PI.IDITEMEMPTMO    , PI.IDPESSOA         , '      + #13 +
   '  PI.IDEMPRESA        , PI.PLANO           , PI.CCDEBFOLHA       , '      + #13 +
   '  PI.CCCREDFOLHA      , PI.SUBCDEBFOLHA    , PI.SUBCCREDFOLHA    , '      + #13 +
   '  PI.CCUSTDEBFOLHA    , PI.CCUSTCREDFOLHA  , PI.CCDEBFINAN       , '      + #13 +
   '  PI.CCCREDFINAN      , PI.SUBCDEBFINAN    , PI.SUBCCREDFINAN    , '      + #13 +
   '  PI.CCUSTDEBFINAN    , PI.CCUSTCREDFINAN  , PI.CODCENTRORESPON  , '      + #13 +
   '  PI.UNIDNEGOC        , PI.RECPAGFINAN     , PI.TIPORECDESFINAN  , '      + #13 +
   '  PI.RECPAGFOLHA      , PI.TIPORECDESFOLHA , PI.RECPAG '                  + #13 +
   'FROM '                                                                    + #13 +
   '  PARAMINTEGRAEP PI '                                                     + #13 +
   'WHERE '                                                                   + #13 +
   '      ( PI.IDPESSOA          = ' + IntToStr(Sistema.IDEmpresa) + ' ) '    + #13 +
   '  AND ( PI.IDITEMEMPTMO      = ' + IntToStr(iItem)             + ' ) '    + #13 +
   '  AND ( PI.IDTIPOCONTREMPTMO = ' + IntToStr(iTipoContrato)     + ' ) '    + #13;

   if iPlano > 0 then begin
      sSql := sSql +
      ' AND ( PI.IDPLANOPREV = ' + IntToStr(iPlano) + ' ) '                   + #13;
   end else begin
      sSql := sSql +
      ' AND ( PI.IDPLANOPREV IS NULL ) '                                      + #13;
   end;

   if iPatro > 0 then begin
      sSql := sSql +
      ' AND ( PI.IDPATRO = ' + IntToStr(iPatro) + ' ) '                       + #13;
   end else begin
      sSql := sSql +
      ' AND ( PI.IDPATRO IS NULL ) '                                          + #13;
   end;

   dtmEmptmo.qryParamIntegra.SQL.Clear;
   dtmEmptmo.qryParamIntegra.SQL.Text := sSql;
   dtmEmptmo.qryParamIntegra.Open;
end;



function TIntegraEmptmo.EntidadeContabil(const iPlano: Int64): int64;
begin
   Result := -1;

   with dtmEmptmo.qryEntidadeContabil do begin
      LimpaParametros(dtmEmptmo.qryEntidadeContabil);
      ParamByName('PIDPLANOPREV').AsInteger := iPlano;
      Open;

      if not(isEmpty) then Result := dtmEmptmo.qryEntidadeContabilIDPLANPREVC.AsInteger;
   end;
end;



(* -------------------------------------------------------------------------------------------------
   ContabilizaItens: Função que contabiliza itens, em batch.
                     Os itens a serem contabilizados são definidos pela query que será
                     passada para a função

   -------------------------------------------------------------------------------------------------
   O SQL a ser passado deverá ser um SELECT na HistMovEmptmo, com as seguintes características
   obigatórias:

   SELECT
      H.IDHISTMOVEMPTMO       ID do Histórico
      H.IDCONTRATOEMPTMO      ID do Contrato
      TC.IDTIPOCONTREMPTMO    ID do Tipo de Contrato
      H.IDITEMEMPTMO          ID do Item a ser contabilizado
      C.IDPLANOPREV           ID do Plano Previdencial
      C.IDPATRO               ID da Patrocinadora
      H.HMEVLRPREVISTO        Valor a ser contabilizado (no caso de provisão)
      H.HMEVLREFETIVO         Valor a ser contabilizado (no caso de recebimento)
      H.HMEFORMACOBRANCA      'F' = Folha   |__ define quais contas a usar na contabilização
                              'C' = CaP/CaR |
      ITC.TIPCODIGO
   WHERE
      TE.IDEMPRESAPROP =      Filtrar obrigatoriamente por Sistema.IDEmpresa

      AND ( (H.HMECENTRALIZA = 0) OR (H.HMECENTRALIZA IS NULL) )
                              Contabilizar apenas os itens que não são totalizadores
   ORDER BY
      HMEANOCOMPETENCIA, HMEMESCOMPETENCIA, H.IDCONTRATOEMPTMO

   -------------------------------------------------------------------------------------------------
   Parâmetros:

      sOrigemContab  :  'C' --> apropriação/provisão	grupo "Finan"
      					:  'F' --> retorno da folha		grupo "Folha"

      sTipoContab  	:  'N' --> contabilização
      					:  'E' --> estorno

      sSQL           :  SQL que será usado para buscar os itens (ver acima)
      dDataLanc

      sResult        :  linhas "de acerto" que serão exibidas, se for o caso
      sErro          :  linhas "de erro" que serão exibidas, se for o caso

      sHistorico     :  Histórico-padrão a ser passado para a Contabilidade

   -------------------------------------------------------------------------------------------------
   Códigos de retorno (controle de erro):
       0 : Lançamento(s) realizados com sucesso
      -1 : ERRO ao tentar selecionar os itens a contabilizar
      -2 : Query não retornou itens a contabilizar
      -3 : ERRO ao tentar criar tabela para agrupamento
      -4 : ERRO ao buscar Parâmetros de Integração
      -5 : ERRO ao fazer o Lançamento Contábil
      -6 : ERRO no Período Contábil
      -7 : Processo interrompido pelo usuário sem contabilização

--------------------------------------------------------------------------------------------------*)
function TIntegraEmptmo.ContabilizaItens(const sOrigemContab, sTipoContab, sSQL, sHistorico: String;
                                         const dDataLanc: TDateTime; var sResult, sErro: TStringList;
                                         var iPlanilhaResult: Integer): Integer;
var
   sModulo, s           : String;
   sDataLanc            : String;
   iEmpresa             : Integer;
   iExercicio           : Integer;
   iPeriodo             : Integer;
   iResultBusca, i      : Integer;
   TabelaPDX            : TTable;
   qryAux               : TwwQuery;
   qryItensContabiliza  : TwwQuery;
   rPreparaParamIntegra : TParamIntegra;
begin
   Result := 0;

   (* incializa a tabela *)
   TabelaPDX := nil;

   (* cria a query Auxiliar *)
   qryAux               := TwwQuery.Create(Application);
// Jéssica Lana SOL 114575 Kintana 535771 24/04/2009
// qryAux.DatabaseName  := copy(Sistema.TempDir, 1, length(Sistema.TempDir) - 1);
   qryAux.DatabaseName  := copy(ftempregra, 1, length(ftempregra) - 1);

   (* cria a query que deve resultar nos itens a serem contabilizados *)
   qryItensContabiliza              := TwwQuery.Create(Application);
   qryItensContabiliza.DatabaseName := 'BaseDados';

   try

      // -------------------------------------------------------------------------------------------
      (* 1º - seleção dos itens a contabilizar *)
      // -------------------------------------------------------------------------------------------

      try
         MostraEspera('Selecionando Itens a contabilizar...');
         try
            qryItensContabiliza.SQL.Text := sSql;
            qryItensContabiliza.Open;
         except
            on E:Exception do begin
               sErro.Add(E.Message);
               Result := -1; (* ERRO ao abrir *)
               Exit;
            end;(* on *)
         end;(* try..except *)

      finally
         EscondeEspera;
      end;

      (* abre a tabela de itens a contabilizar - não havendo, sai... *)
      if qryItensContabiliza.isEmpty then begin
         Result := -2;  (* não há itens *)
         Exit;
      end;

      // -------------------------------------------------------------------------------------------
      (* 2º - manipulação da tabela temporária Paradox *)
      // -------------------------------------------------------------------------------------------

      (* exclui a tabela *)
      if not(IntegraEmptmo.ExcluiTabelaPDX('CCEMPTMO.DB', TabelaPDX)) then begin
         sErro.Add('Erro ao Excluir Tabela Temporária.');
         Result := -3;  (* não conseguiu excluir  *)
         Exit;
      end;

      (* cria a tabela *)
      try
         IntegraEmptmo.CriaTabelaPDX('CCEMPTMO.DB', TabelaPDX);
      except
         on E:Exception do begin
            sErro.Add(E.Message);
            Result := -3;  (* não conseguir criar *)
            Exit;
         end;
      end;

      (* define a estrutura da tabela *)
      if not(DefineEstruturaTabelaPDX(TabelaPDX)) then begin
         sErro.Add('ERRO ao tentar criar tabela para agrupamento');
         Result := -3;  (* não conseguir criar *)
         Exit;
      end;

      // -------------------------------------------------------------------------------------------
      (* 3º - prepara os itens para posterior contabilização *)
      // -------------------------------------------------------------------------------------------

      (* faz o TestaPeriodo apenas aqui, pois a Data de Lançamento será única *)
      sDataLanc      := FormatDateTime('dd/mm/yyyy', dDataLanc);
      iEmpresa       := Sistema.idEmpresa;
      sModulo        := IntToStr(Sistema.idModulo);

      if TestaPeriodo(False, 'BaseDados', sDataLanc, sModulo, iExercicio, iPeriodo, iEmpresa, s) = 0 then
      begin
         (* tendo conseguido, começa a iterar pela query *)
         with qryItensContabiliza do begin

            First;
            i := 0;
            MostraFormProgresso('Preparando Itens para contabilização...', 0, qryItensContabiliza.RecordCount, True, True);

            while not(EOF) do begin

               inc(i);
               AndaFormProgresso(i);

               (* Verifica se o usuário Cancelou a Operação *)
               if frmProgresso.Cancelou then begin
                  sErro.Add('Processo interrompido pelo usuário. Não houve contabilização.');
                  Result := -7;
                  Exit;
               end;


               // ----------------------------------------------------------------------------------

               (* procura os conjuntos de parâmetros e preenche o registro *)
               iResultBusca := BuscaParamIntegra(sOrigemContab, rPreparaParamIntegra, qryItensContabiliza);

               // ----------------------------------------------------------------------------------


               case iResultBusca of

                 -5: begin (* grava no memErro item que deu errado *) end;
                 -4: begin (* grava no memErro item que deu errado *) end;

                  0: GravaItemPDX(sOrigemContab, sTipoContab, TabelaPDX, rPreparaParamIntegra, dDataLanc,
                                  iExercicio, iPeriodo);
               end;

               Application.ProcessMessages;
               Next;
            end;
         end; (* with *)

         EscondeFormProgresso;

         qryAux.SQL.Add('SELECT COUNT(*) AS TOTAL FROM "CCEMPTMO.DB" CCEMPTO');
         qryAux.Open;

         (* NÃO há registro na tabela Temporária. Houve erro na busca de Parâmetros *)
         if qryAux.FieldByName('TOTAL').AsInteger = 0 then begin
            sErro.Add('NÃO há registros na tabela Temporária.');
            Result := -4;
            Exit;
         end;


      // -------------------------------------------------------------------------------------------
      (* 4º - Contabilização *)
      // -------------------------------------------------------------------------------------------

         MostraEspera('Executando lançamentos contábeis...');

         (* aqui ocorre a contabilização *)
         iPlanilhaResult := ConsolidaContabiliza(sHistorico);

         if iPlanilhaResult > 0 then begin

            try
               (* grava a planilha resultante em todos os registros da HistMovEmptmo afetados *)
               if sOrigemContab = 'C' then GravaPlanilha(iPlanilhaResult, sTipoContab);
            except
               (* mostrar mensagem de erro e gravar no memErro *)
               Result := -5;
            end;

         end else begin
            Result := -5;
         end; (* if iPlanilhaResult > 0 *)

      // -------------------------------------------------------------------------------------------
      (* FIM *)
      // -------------------------------------------------------------------------------------------

      end else begin

         (* mensagem de erro de TestaPeriodo *)
         Result := -6;

      end; (* if TestaPeriodo *)


   finally
      EscondeFormProgresso;
      EscondeEspera;

      qryAux.Free;
      qryItensContabiliza.Free;

      if TabelaPDX <> nil then TabelaPDX.Close;
      if TabelaPDX <> nil then TabelaPDX.Free;
   end;
end;



function TIntegraEmptmo.BuscaParamIntegra(const sOrigemContab: string; var rParamIntegra: TParamIntegra;
                                          qry: TwwQuery): integer;
begin
   (* nenhum padrão encontrado, a princípio *)
   Result := 0;

   (* inicializa os parâmetros para Integração *)
   LimpaParamIntegra(rParamIntegra);

   (* passa os dados necessários *)
   rParamIntegra.iHistorico      := qry.FieldByName('IDHISTMOVEMPTMO').AsInteger;
   rParamIntegra.iTipoContrato   := qry.FieldByName('IDTIPOCONTREMPTMO').AsInteger;
   rParamIntegra.iItem           := qry.FieldByName('IDITEMEMPTMO').AsInteger;
   rParamIntegra.iPlanoPrev      := qry.FieldByName('IDPLANOPREV').AsInteger;
   rParamIntegra.iPatro          := qry.FieldByName('IDPATRO').AsInteger;
   rParamIntegra.sFormaEnvio     := qry.FieldByName('HMEFORMACOBRANCA').AsString;
   rParamIntegra.sTipoPer        := qry.FieldByName('TIPCODIGO').AsString;

   (* o valor a lançar depende do tipo de contabilização *)
   if sOrigemContab = 'C' then begin
      rParamIntegra.fVlrLanc     := qry.FieldByName('HMEVLRPREVISTO').AsFloat;   (* provisão --> valor previsto *)
   end else begin
      rParamIntegra.fVlrLanc     := qry.FieldByName('HMEVLREFETIVO').AsFloat;    (* recebimento patro --> valor efetivo *)
   end;

   try
      // 1º passo: caso mais detalhado: Plano + Patro ----------------------------------------------
      IntegraEmptmo.AbreParamIntegra(rParamIntegra.iTipoContrato, rParamIntegra.iItem,
                                     rParamIntegra.iPlanoPrev, rParamIntegra.iPatro);

      (* se houver mais de 1 registro --> ERRO: ambigüidade nos parâmetros *)
//      if dtmEmptmo.qryParamIntegra.RecordCount > 1 then Result := -4;


      // 2º Passo: apenas Patro --------------------------------------------------------------------
      if ( (Result = 0) and (dtmEmptmo.qryParamIntegra.isEmpty) ) then begin

         IntegraEmptmo.AbreParamIntegra(rParamIntegra.iTipoContrato, rParamIntegra.iItem, -1,
                                        rParamIntegra.iPatro);

         (* se houver mais de 1 registro --> ERRO: ambigüidade nos parâmetros *)
//         if dtmEmptmo.qryParamIntegra.RecordCount > 1 then Result := -4;
      end;


      // 2º Passo: apenas Plano --------------------------------------------------------------------
      if ( (Result = 0) and (dtmEmptmo.qryParamIntegra.isEmpty) ) then begin

         IntegraEmptmo.AbreParamIntegra(rParamIntegra.iTipoContrato, rParamIntegra.iItem,
                                        rParamIntegra.iPlanoPrev, -1);

         (* se houver mais de 1 registro --> ERRO: ambigüidade nos parâmetros *)
//         if dtmEmptmo.qryParamIntegra.RecordCount > 1 then Result := -4;
      end;


      // 4º (e último) Passo: nem Plano tampouco Patro ---------------------------------------------
      if ( (Result = 0) and (dtmEmptmo.qryParamIntegra.isEmpty) ) then begin

         IntegraEmptmo.AbreParamIntegra(rParamIntegra.iTipoContrato, rParamIntegra.iItem, -1, -1);

         (* se houver mais de 1 registro --> ERRO: ambigüidade nos parâmetros *)
//         if dtmEmptmo.qryParamIntegra.RecordCount > 1 then Result := -4;
      end;


      // Finalmentes: resultado da Busca -----------------------------------------------------------
      if Result = 0 then begin

         (* verifica se agora foi encontrado algum Padrão de Lançamento *)
         if ( (dtmEmptmo.qryParamIntegra.Active) and not(dtmEmptmo.qryParamIntegra.isEmpty) ) then begin

            (* acaba de completar o registro dos parâmetros *)
            rParamIntegra.iPlano := dtmEmptmo.qryParamIntegraPLANO.AsInteger;

            if not(dtmEmptmo.qryParamIntegraCCDEBFOLHA.isNULL) then        rParamIntegra.sContaDFolha         := dtmEmptmo.qryParamIntegraCCDEBFOLHA.AsString;
            if not(dtmEmptmo.qryParamIntegraCCUSTDEBFOLHA.isNULL) then     rParamIntegra.sCentroCustoDFolha   := dtmEmptmo.qryParamIntegraCCUSTDEBFOLHA.AsString;
            if not(dtmEmptmo.qryParamIntegraSUBCDEBFOLHA.isNULL) then      rParamIntegra.iSubContaDFolha      := dtmEmptmo.qryParamIntegraSUBCDEBFOLHA.AsInteger;
            if not(dtmEmptmo.qryParamIntegraCCCREDFOLHA.isNULL) then       rParamIntegra.sContaCFolha         := dtmEmptmo.qryParamIntegraCCCREDFOLHA.AsString;
            if not(dtmEmptmo.qryParamIntegraCCUSTCREDFOLHA.isNULL) then    rParamIntegra.sCentroCustoCFolha   := dtmEmptmo.qryParamIntegraCCUSTCREDFOLHA.AsString;
            if not(dtmEmptmo.qryParamIntegraSUBCCREDFOLHA.isNULL) then     rParamIntegra.iSubContaCFolha      := dtmEmptmo.qryParamIntegraSUBCCREDFOLHA.AsInteger;
            if not(dtmEmptmo.qryParamIntegraCCDEBFINAN.isNULL) then        rParamIntegra.sContaDFinan         := dtmEmptmo.qryParamIntegraCCDEBFINAN.AsString;
            if not(dtmEmptmo.qryParamIntegraCCUSTDEBFINAN.isNULL) then     rParamIntegra.sCentroCustoDFinan   := dtmEmptmo.qryParamIntegraCCUSTDEBFINAN.AsString;
            if not(dtmEmptmo.qryParamIntegraSUBCDEBFINAN.isNULL) then      rParamIntegra.iSubContaDFinan      := dtmEmptmo.qryParamIntegraSUBCDEBFINAN.AsInteger;
            if not(dtmEmptmo.qryParamIntegraCCCREDFINAN.isNULL) then       rParamIntegra.sContaCFinan         := dtmEmptmo.qryParamIntegraCCCREDFINAN.AsString;
            if not(dtmEmptmo.qryParamIntegraCCUSTCREDFINAN.isNULL) then    rParamIntegra.sCentroCustoCFinan   := dtmEmptmo.qryParamIntegraCCUSTCREDFINAN.AsString;
            if not(dtmEmptmo.qryParamIntegraSUBCCREDFINAN.isNULL) then     rParamIntegra.iSubContaCFinan      := dtmEmptmo.qryParamIntegraSUBCCREDFINAN.AsInteger;

            if not(dtmEmptmo.qryParamIntegraTIPORECDESFOLHA.isNULL) then   rParamIntegra.sTipoRecDesFolha     := dtmEmptmo.qryParamIntegraTIPORECDESFOLHA.AsString;
            if not(dtmEmptmo.qryParamIntegraRECPAGFOLHA.isNULL) then       rParamIntegra.sRecPagFolha         := dtmEmptmo.qryParamIntegraRECPAGFOLHA.AsString;
            if not(dtmEmptmo.qryParamIntegraTIPORECDESFINAN.isNULL) then   rParamIntegra.sTipoRecDesFinan     := dtmEmptmo.qryParamIntegraTIPORECDESFINAN.AsString;
            if not(dtmEmptmo.qryParamIntegraRECPAGFINAN.isNULL) then       rParamIntegra.sRecPagFinan         := dtmEmptmo.qryParamIntegraRECPAGFINAN.AsString;

            if not(dtmEmptmo.qryParamIntegraUNIDNEGOC.isNULL) then         rParamIntegra.iUnidNegoc           := dtmEmptmo.qryParamIntegraUNIDNEGOC.AsInteger;
            if not(dtmEmptmo.qryParamIntegraCODCENTRORESPON.isNULL) then   rParamIntegra.sCentroRespon        := dtmEmptmo.qryParamIntegraCODCENTRORESPON.AsString;

            if not(dtmEmptmo.qryParamIntegraIDPLANOPREVCONTAB.IsNull) then begin
               rParamIntegra.iPlanPrevContab := dtmEmptmo.qryParamIntegraIDPLANOPREVCONTAB.AsInteger;
            end else begin
               rParamIntegra.iPlanPrevContab := EntidadeContabil(rParamIntegra.iPlanoPrev);
            end;

         end else begin
            // Erro: nenhum Padrão de Lançamento que atenda os parâmetros passados
            Result := -5;
         end;

      end;

   finally
      (* fecha, obrigatoriamente, a tabela de parâmetros *)
      dtmEmptmo.qryParamIntegra.Close;
   end;
end;



function TIntegraEmptmo.LancamentoContabil(var rParamContabeis: TParamIntegra;
                                           const sDebCre, sHistorico: String;
                                           const bMostraMsg: Boolean;
                                           var iPlanilha: Integer;
                                           var sMensContab: String): Boolean;
var
   sTipoLanc               : String;
   sContaD, sContaC        : String;
   sCCustoD, sCCustoC      : String;
   sSContaD, sSContaC      : String;
   sHist1, sHist2, sHist3  : String; (* histórico-padrão contábil *)
   sHist4, sHist5          : String; (* histórico-padrão contábil *)
begin
   Result := False;

   (* Histórico-Padrão *)
   FuncaoGeral.ArrumaHistorico(sHistorico, sHist1, sHist2, sHist3, sHist4, sHist5);


   (* faz os ajustes necessários para (D)ébito ou (C)rédito *)
   case sDebCre[1] of

      'C':
      begin
         sTipoLanc := '1';
         sContaD   := '';
         sCCustoD  := '';
         sSContaD  := '';
         sContaC   := rParamContabeis.sContaContab;
         sCCustoC  := rParamContabeis.sCentroCustoContab;
         if rParamContabeis.iSubContaContab > 0 then sSContaC := IntToStr(rParamContabeis.iSubContaContab);
      end;

      'D':
      begin
         sTipoLanc := '0';
         sContaD   := rParamContabeis.sContaContab;
         sCCustoD  := rParamContabeis.sCentroCustoContab;
         if rParamContabeis.iSubContaContab > 0 then sSContaD := IntToStr(rParamContabeis.iSubContaContab);
         sCCustoC  := '';
         sContaC   := '';
         sSContaC  := '';
      end;

   end;

   (* -------------------------------------------------------------------- *)
   (*                                                                      *)
   (*    Fazer, posteriormente, as verificações de PermiteSubConta         *)
   (*    e ObrigaCentroCusto ???   -->  desempenho, redundância            *)
   (*                                                                      *)
   (* -------------------------------------------------------------------- *)


   try

      iPlanilha :=
(* DINIZ
  A função LANCACONTAB não retorna se efetuou o lançamento com sucesso ou não, logo
  fui obrigado a colocar o bMostraMsg para TRUE, para que eu pudesse observar quando
  ocorria um erro. *)

      LancaContab(TRUE                                     (* bMostraMsg *),
                  'BaseDados',
                  FormatDateTime('dd/mm/yyyy', rParamContabeis.dDataLanc),
                  IntToStr(Sistema.IDModulo),
                  sTipoLanc,                                (* 0 = débito, 1 = crédito, 2 = partida dobrada *)
                  sDebCre,                                  (* D = débito, C = crédito *)
                  '', '', '', '', '', '', '', '', '', '',   (* tipo conversão: em branco mesmo *)
                  '',                                       (* NumDocumento *)
                  sHist1, sHist2, sHist3, sHist4, sHist5,   (* histórico-padrão contábil *)
                  rParamContabeis.sTipoPer,                 (* Grupo de Lançamento *)
                  sCCustoD, sContaD, sCCustoC, sContaC,     (* contas contábeis e centros de custo *)
                  rParamContabeis.iExercicio,
                  rParamContabeis.iPeriodo,
                  Sistema.IdEmpresa,
                  Sistema.IdUsuario,
                  rParamContabeis.iPlano,
                  rParamContabeis.fVlrLanc,
                  0, 0, 0, 0, 0, 0, 0, 0,                   (* valores em outras moedas: em branco mesmo *)
                  IntToStr(rParamContabeis.iUnidNegoc),
                  True,                                     (* bJunta *)
                  0, 0,                                     (* Valor Gerencial ? *)
                  sSContaD,                                 (* SubConta a Débito *)
                  sSContaC,                                 (* SubConta a Crédito *)
                  '',                                       (* sCodHist *)
                  '',                                       (* sElemento ? *)
                  iPlanilha, sMensContab,
                  IntegraBack.MascaraPlano, True, 0,
                  rParamContabeis.iPlanPrevContab,          (* Entidade Contábil *)
                  rParamContabeis.iPatro,
                  Sistema.UsaPlanoPatro);

      if iPlanilha <= 0 then begin
         (* integração com contabilidade falhou; exibe a mensagem de erro correspondente *)
      end;

   except
      (* integração com contabilidade falhou; exibe a mensagem de erro correspondente *)
   end;
end;



procedure TIntegraEmptmo.LimpaParamIntegra(var rParamIntegra: TParamIntegra);
begin
   rParamIntegra.iHistorico            := -1;
   rParamIntegra.iContrato             := -1;
   rParamIntegra.iTipoContrato         := -1;
   rParamIntegra.iPlanoPrev            := -1;
   rParamIntegra.iPatro                := -1;
   rParamIntegra.iPessoa               := -1;

   rParamIntegra.iCodPortForma         := -1;
   rParamIntegra.iCodForma             := -1;

   rParamIntegra.iItem                 := -1;

   rParamIntegra.iPlanPrevContab       := -1;

   rParamIntegra.iPlano                := -1;

   rParamIntegra.sAnoMesCompetencia    := '';

   rParamIntegra.sContaDFolha          := '';
   rParamIntegra.sCentroCustoDFolha    := '';
   rParamIntegra.iSubContaDFolha       := -1;
   rParamIntegra.sContaCFolha          := '';
   rParamIntegra.iSubContaCFolha       := -1;
   rParamIntegra.sCentroCustoCFolha    := '';
   rParamIntegra.sContaDFinan          := '';
   rParamIntegra.sCentroCustoDFinan    := '';
   rParamIntegra.iSubContaDFinan       := -1;
   rParamIntegra.sContaCFinan          := '';
   rParamIntegra.iSubContaCFinan       := -1;
   rParamIntegra.sCentroCustoCFinan    := '';

   rParamIntegra.sContaContab          := '';
   rParamIntegra.sCentroCustoContab    := '';
   rParamIntegra.iSubContaContab       := -1;
   rParamIntegra.iExercicio            := -1;
   rParamIntegra.iPeriodo              := -1;

   rParamIntegra.sTipoPer              := '';
   rParamIntegra.iTipoDoc              := -1;
   rParamIntegra.sRecPag               := '';
   rParamIntegra.sCCBaixa              := '';

   rParamIntegra.sTipoRecDesFolha      := '';
   rParamIntegra.sRecPagFolha          := '';
   rParamIntegra.sTipoRecDesFinan      := '';
   rParamIntegra.sRecPagFinan          := '';
   rParamIntegra.sFormaEnvio           := '';

   rParamIntegra.iUnidNegoc            := -1;
   rParamIntegra.sCentroRespon         := '';
   rParamIntegra.sDescricao            := '';

   rParamIntegra.iMoeda                := -1;
   rParamIntegra.fVlrLanc              := 0;

   rParamIntegra.dDataLanc             := -1;
   rParamIntegra.dDataVenc             := -1;

   rParamIntegra.iPlanilha             := -1;
//   rParamIntegra.iDocumento            := -1;
   rParamIntegra.iRateioDocum          := -1;
   rParamIntegra.iLanctoDocum          := -1;

   rParamIntegra.sDebCre               := '';
   rParamIntegra.bEmisBloq             := False;
   rParamIntegra.fNumDocumento         := 0;
end;



procedure TIntegraEmptmo.CriaTabelaPDX(const sTabela: String; var T: TTable);
begin
   T              := TTable.Create(Application);
   T.Active       := False;
 //Jéssica Lana SOL 114575 Kintana 535771 24/04/2009 
 //T.DataBaseName := copy(Sistema.TempDir, 1, length(Sistema.TempDir) - 1);
   T.DataBaseName := copy(ftempregra, 1, length(ftempregra) - 1);
   T.TableType    := ttParadox;
   T.TableName    := sTabela;
end;



function TIntegraEmptmo.DefineEstruturaTabelaPDX(var T: TTable): Boolean;
begin
   Result := True;

   if not T.Exists then begin

      try
         (* define a estrutura da tabela *)
         T.FieldDefs.Clear;
         T.FieldDefs.Add('IDHISTMOVEMPTMO',     ftInteger,   0, False);
         T.FieldDefs.Add('HMEVLRPREVISTO',      ftFloat,     0, False);
         T.FieldDefs.Add('DATALANCTO',          ftDate,      0, False);
         T.FieldDefs.Add('IDPATRO',             ftInteger,   0, False);
         T.FieldDefs.Add('IDPLANOPREVCONTAB',   ftInteger,   0, False);
         T.FieldDefs.Add('IDEMPRESA',           ftInteger,   0, False);
         T.FieldDefs.Add('PLANO',               ftInteger,   0, False);
         T.FieldDefs.Add('CCDEB',               ftString,   18, False);
         T.FieldDefs.Add('CCCRED',              ftString,   18, False);
         T.FieldDefs.Add('SUBCDEB',             ftInteger,   0, False);
         T.FieldDefs.Add('SUBCCRED',            ftInteger,   0, False);
         T.FieldDefs.Add('CCUSTDEB',            ftString,   10, False);
         T.FieldDefs.Add('CCUSTCRED',           ftString,   10, False);
         T.FieldDefs.Add('UNIDNEGOC',           ftInteger,   0, False);
         T.FieldDefs.Add('TIPCODIGO',           ftString,    2, False);
         T.FieldDefs.Add('EXERCICIO',           ftInteger,   0, False);
         T.FieldDefs.Add('PERIODO',             ftInteger,   0, False);
         T.FieldDefs.Add('ITCPRIORIDADE',       ftInteger,   0, False);

         (* adiciona um índice primário à tabela *)
         // T.IndexDefs.Clear;
         // T.IndexDefs.Add('', 'ID', [ixPrimary, ixUnique]);

         (* cria efetivamente a tabela *)
         T.CreateTable;
         T.Open;

      except
         Result := False;
      end; (* try..except *)

   end; (* if *)
end;



function TIntegraEmptmo.ExcluiTabelaPDX(const sTabela: String; var T: TTable): Boolean;
begin
   Result := True;

   try
   // Jéssica Lana SOL 114575 Kintana 535771 24/04/2009
   // if FileExists(Sistema.TempDir + sTabela) then begin
      if FileExists(ftempregra + sTabela) then begin

         (* exclui a tabela *)
       // Result := DeleteFile(Sistema.TempDir + sTabela);
          Result := DeleteFile(ftempregra + sTabela);

         (* exclui a chave primária *)
         // DeleteFile(Sistema.TempDir + 'CCEMPTMO.PX');
         // DeleteFile(Sistema.TempDir + 'CCEMPTMO.VAL');
      end;

   except
      Result := False;
   end;
end;



procedure TIntegraEmptmo.GravaItemPDX(const sOrigemContab, sTipoContab: String; var T: TTable;
												  var rParamIntegra: TParamIntegra; const dDataLanc: TDateTime;
                                      const iExercicio, iPeriodo: Integer);
begin
   T.Append;

   T.FieldByName('IDHISTMOVEMPTMO').AsInteger   := rParamIntegra.iHistorico;
   T.FieldByName('DATALANCTO').AsDateTime       := dDataLanc;
   T.FieldByName('HMEVLRPREVISTO').AsFloat      := abs(rParamIntegra.fVlrLanc);
   T.FieldByName('IDPATRO').AsInteger           := rParamIntegra.iPatro;
   T.FieldByName('IDPLANOPREVCONTAB').AsInteger := rParamIntegra.iPlanPrevContab;
   T.FieldByName('IDEMPRESA').AsInteger         := Sistema.IDEmpresa;
   T.FieldByName('PLANO').AsInteger             := rParamIntegra.iPlano;
   T.FieldByName('UNIDNEGOC').AsInteger         := rParamIntegra.iUnidNegoc;
   T.FieldByName('TIPCODIGO').AsString          := rParamIntegra.sTipoPer;
   T.FieldByName('EXERCICIO').AsInteger         := iExercicio;
   T.FieldByName('PERIODO').AsInteger           := iPeriodo;

	if sOrigemContab = 'C' then begin

      (* se o valor for negativo ou se for estorno, inverte as contas e etc de débito/crédito
         se os for negativo E se for estorno, não faz nada *)
      if ( (sTipoContab = 'E') xor (rParamIntegra.fVlrLanc < 0) ) then begin

         T.FieldByName('CCDEB').AsString           := rParamIntegra.sContaCFinan;
         T.FieldByName('CCCRED').AsString          := rParamIntegra.sContaDFinan;

         if rParamIntegra.iSubContaDFinan > 0 then       T.FieldByName('SUBCDEB').AsInteger  := rParamIntegra.iSubContaCFinan;
         if rParamIntegra.iSubContaCFinan > 0 then       T.FieldByName('SUBCCRED').AsInteger := rParamIntegra.iSubContaDFinan;
         if rParamIntegra.sCentroCustoDFinan <> '' then  T.FieldByName('CCUSTDEB').AsString  := rParamIntegra.sCentroCustoCFinan;
         if rParamIntegra.sCentroCustoCFinan <> '' then  T.FieldByName('CCUSTCRED').AsString := rParamIntegra.sCentroCustoDFinan;

      end else begin

         T.FieldByName('CCDEB').AsString           := rParamIntegra.sContaDFinan;
         T.FieldByName('CCCRED').AsString          := rParamIntegra.sContaCFinan;

         if rParamIntegra.iSubContaDFinan > 0 then       T.FieldByName('SUBCDEB').AsInteger  := rParamIntegra.iSubContaDFinan;
         if rParamIntegra.iSubContaCFinan > 0 then       T.FieldByName('SUBCCRED').AsInteger := rParamIntegra.iSubContaCFinan;
         if rParamIntegra.sCentroCustoDFinan <> '' then  T.FieldByName('CCUSTDEB').AsString  := rParamIntegra.sCentroCustoDFinan;
         if rParamIntegra.sCentroCustoCFinan <> '' then  T.FieldByName('CCUSTCRED').AsString := rParamIntegra.sCentroCustoCFinan;

      end;

   end else begin (* if sOrigemContab = 'F' *)

      (* se o valor for negativo ou se for estorno, inverte as contas e etc de débito/crédito
         se os for negativo E se for estorno, não faz nada *)
      if ( (sTipoContab = 'E') xor (rParamIntegra.fVlrLanc < 0) ) then begin

         T.FieldByName('CCDEB').AsString           := rParamIntegra.sContaCFolha;
         T.FieldByName('CCCRED').AsString          := rParamIntegra.sContaDFolha;

         if rParamIntegra.iSubContaDFolha > 0 then       T.FieldByName('SUBCDEB').AsInteger  := rParamIntegra.iSubContaCFolha;
         if rParamIntegra.iSubContaCFolha > 0 then       T.FieldByName('SUBCCRED').AsInteger := rParamIntegra.iSubContaDFolha;
         if rParamIntegra.sCentroCustoDFolha <> '' then  T.FieldByName('CCUSTDEB').AsString  := rParamIntegra.sCentroCustoCFolha;
         if rParamIntegra.sCentroCustoCFolha <> '' then  T.FieldByName('CCUSTCRED').AsString := rParamIntegra.sCentroCustoDFolha;

      end else begin

         T.FieldByName('CCDEB').AsString           := rParamIntegra.sContaDFolha;
         T.FieldByName('CCCRED').AsString          := rParamIntegra.sContaCFolha;

         if rParamIntegra.iSubContaDFolha > 0 then       T.FieldByName('SUBCDEB').AsInteger  := rParamIntegra.iSubContaDFolha;
         if rParamIntegra.iSubContaCFolha > 0 then       T.FieldByName('SUBCCRED').AsInteger := rParamIntegra.iSubContaCFolha;
         if rParamIntegra.sCentroCustoDFolha <> '' then  T.FieldByName('CCUSTDEB').AsString  := rParamIntegra.sCentroCustoDFolha;
         if rParamIntegra.sCentroCustoCFolha <> '' then  T.FieldByName('CCUSTCRED').AsString := rParamIntegra.sCentroCustoCFolha;

      end;

   end; (* if sOrigemContab *)

   T.Post;
end;



function TIntegraEmptmo.ConsolidaContabiliza(const sHistorico: String): Int64;
var
   qryConsolida      : TwwQuery;
   iPlanilha         : Integer;
   rParamContabeis   : TParamIntegra;
   sSQL              : String;
   sMensagemContab   : String;
begin

   qryConsolida               := TwwQuery.Create(Application);
 // Jéssica Lana SOL 114575 Kintana 535771 24/04/2009
 // qryConsolida.DataBaseName  := copy(Sistema.TempDir, 1, length(Sistema.TempDir) - 1);
    qryConsolida.DataBaseName  := copy(ftempregra, 1, length(ftempregra) - 1);

   (* 'inicializa' a Planilha e a mensagem da LancaContab *)
   iPlanilha         := 0;
   sMensagemContab   := '';



   // ----------------------------------------------------------------------------------------------
   //    Lançamento a Débito
   // ----------------------------------------------------------------------------------------------

   (* agrupa os lançamentos a débito *)
   sSQL :=
   'SELECT ' +
   '  SUM(HMEVLRPREVISTO) AS VLR_LANC, ' +
   '  PLANO, DATALANCTO, IDPATRO, IDPLANOPREVCONTAB, ' +
   '  CCDEB, SUBCDEB, CCUSTDEB, UNIDNEGOC, TIPCODIGO, ' +
   '  EXERCICIO, PERIODO ' +
   'FROM ' +
   '  "CCEMPTMO.DB" CCEMPTO ' +
   'GROUP BY ' +
   '  PLANO, DATALANCTO, IDPATRO, IDPLANOPREVCONTAB, ' +
   '  CCDEB, SUBCDEB, CCUSTDEB, UNIDNEGOC, TIPCODIGO, ' +
   '  EXERCICIO, PERIODO ';

   qryConsolida.Close;
   qryConsolida.SQL.Text := sSql;

   try
      qryConsolida.Open;

      (* executa todos os lançamentos a débito *)
      with qryConsolida do begin
         First;
         while not(EOF) do begin

            (* limpa o record de parâmetros *)
            LimpaParamIntegra(rParamContabeis);

            (* monta o record de parâmetros *)
            rParamContabeis.iPatro                 := qryConsolida.FieldByName('IDPATRO').AsInteger;
            rParamContabeis.iPlanPrevContab        := qryConsolida.FieldByName('IDPLANOPREVCONTAB').AsInteger;

            rParamContabeis.iPlano                 := qryConsolida.FieldByName('PLANO').AsInteger;

            rParamContabeis.sContaContab           := qryConsolida.FieldByName('CCDEB').AsString;
            rParamContabeis.sCentroCustoContab     := qryConsolida.FieldByName('CCUSTDEB').AsString;
            rParamContabeis.iSubContaContab        := qryConsolida.FieldByName('SUBCDEB').AsInteger;

            rParamContabeis.sTipoPer               := qryConsolida.FieldByName('TIPCODIGO').AsString;

            rParamContabeis.iUnidNegoc             := qryConsolida.FieldByName('UNIDNEGOC').AsInteger;

            rParamContabeis.fVlrLanc               := qryConsolida.FieldByName('VLR_LANC').AsFloat;

            rParamContabeis.dDataLanc              := qryConsolida.FieldByName('DATALANCTO').AsDateTime;
            rParamContabeis.iExercicio             := qryConsolida.FieldByName('EXERCICIO').AsInteger;
            rParamContabeis.iPeriodo               := qryConsolida.FieldByName('PERIODO').AsInteger;

            (* Passa os parâmtros para a função que vai fazer os últimos ajustes
               e chamar a LancaContab *)
            LancamentoContabil(rParamContabeis, 'D', sHistorico, False, iPlanilha, sMensagemContab);

            Next;
         end;(* while *)

      end;(* with *)

      Result := iPlanilha;

   except
      Result := -1;
   end;



   // ----------------------------------------------------------------------------------------------
   //    Lançamento a Crédito
   // ----------------------------------------------------------------------------------------------

   (* se foi feita a contabilização do débito corretamente... *)

   if Result > 0 then begin

      (* agrupa os lançamentos a crédito *)
      sSQL :=
      'SELECT ' +
      '  SUM(HMEVLRPREVISTO) AS VLR_LANC, ' +
      '  PLANO, DATALANCTO, IDPATRO, IDPLANOPREVCONTAB, ' +
      '  CCCRED, SUBCCRED, CCUSTCRED, UNIDNEGOC, TIPCODIGO, ' +
      '  EXERCICIO, PERIODO ' +
      'FROM ' +
      '  "CCEMPTMO.DB" CCEMPTO ' +
      'GROUP BY ' +
      '  PLANO, DATALANCTO, IDPATRO, IDPLANOPREVCONTAB, ' +
      '  CCCRED, SUBCCRED, CCUSTCRED, UNIDNEGOC, TIPCODIGO, ' +
      '  EXERCICIO, PERIODO ';

      qryConsolida.Close;
      qryConsolida.SQL.Text := sSql;

      try
         qryConsolida.Open;

         (* executa todos os lançamentos a crédito *)
         with qryConsolida do begin
            First;
            while not(EOF) do begin

               (* monta o record de parâmetros *)
               LimpaParamIntegra(rParamContabeis);

               (* monta o record de parâmetros *)
               rParamContabeis.iPatro                := qryConsolida.FieldByName('IDPATRO').AsInteger;
               rParamContabeis.iPlanPrevContab       := qryConsolida.FieldByName('IDPLANOPREVCONTAB').AsInteger;

               rParamContabeis.iPlano                := qryConsolida.FieldByName('PLANO').AsInteger;

               rParamContabeis.sContaContab          := qryConsolida.FieldByName('CCCRED').AsString;
               rParamContabeis.sCentroCustoContab    := qryConsolida.FieldByName('CCUSTCRED').AsString;
               rParamContabeis.iSubContaContab       := qryConsolida.FieldByName('SUBCCRED').AsInteger;

               rParamContabeis.sTipoPer              := qryConsolida.FieldByName('TIPCODIGO').AsString;

               rParamContabeis.iUnidNegoc            := qryConsolida.FieldByName('UNIDNEGOC').AsInteger;
 //            rParamContabeis.sHistorico            := qryConsolida.FieldByName(' ').AsString;

               rParamContabeis.fVlrLanc              := qryConsolida.FieldByName('VLR_LANC').AsFloat;

               rParamContabeis.dDataLanc             := qryConsolida.FieldByName('DATALANCTO').AsDateTime;
               rParamContabeis.iExercicio            := qryConsolida.FieldByName('EXERCICIO').AsInteger;
               rParamContabeis.iPeriodo              := qryConsolida.FieldByName('PERIODO').AsInteger;

               (* Passa os parâmtros para a função que vai fazer os últimos ajustes
                    e chamar a LancaContab *)
               LancamentoContabil(rParamContabeis, 'C', sHistorico, False, iPlanilha, sMensagemContab);

               Next;
            end;
         end;

         Result := iPlanilha;

      except
         Result := -2;
      end;

   end;
end;



function TIntegraEmptmo.AtualizaHistoricoComFlgEnvio(const iHistorico: Int64; var sErro: TStringList): Boolean;
begin
   (* Retorno da Função *)
   Result := True;

   try

      with dtmEmptmo.qryUpdateFlgEnvio do begin
         LimpaParametros(dtmEmptmo.qryUpdateFlgEnvio);
         ParamByName('PIDHISTMOVEMPTMO').AsInteger :=  iHistorico;
         ExecSQL;
      end;

   except

      on E:Exception do begin
         sErro.Add(E.Message);
         Result := False;
      end;

   end; 
end;



function TIntegraEmptmo.AtualizaHistoricoComDocumento(const rParam: TParamIntegra; var sErro: TStringList): Boolean;
begin
   (* Retorno da Função *)

   Result := True;
   try

      with dtmEmptmo.qryUpdateDocumento do begin

         LimpaParametros(dtmEmptmo.qryUpdateDocumento);

         if rParam.iPlanilha > 0 then begin
            ParamByName('PPLNCODIGO').AsInteger        := rParam.iPlanilha;
         end;

         ParamByName('PCODDOCUMENTO').AsInteger    := rParam.iDocumento;
         ParamByName('PIDHISTMOVEMPTMO').AsInteger :=  rParam.iHistorico;

         ExecSQL;
      end;

   except

      on E:Exception do begin
         sErro.Add(E.Message);
         Result := False;
      end; (* on *)

   end; (* try..except *)
end;



procedure TIntegraEmptmo.GravaPlanilha(const iPlanilha: Int64; const sTipoContab: String);
var
   TabelaPDX : TTable;
   qryTrab: TwwQuery;
begin
   (* prepara a criação da tabela *)
   TabelaPDX              := TTable.Create(Application);
   TabelaPDX.Active       := False;
 //Jéssica Lana SOL 114575 Kintana 535771 24/04/2009
 //TabelaPDX.DataBaseName := copy(Sistema.TempDir, 1, length(Sistema.TempDir) - 1);
   TabelaPDX.DataBaseName := copy(ftempregra, 1, length(ftempregra) - 1);
   TabelaPDX.TableType    := ttParadox;
   TabelaPDX.TableName    := 'CCEMPTMO.DB';

   if sTipoContab = 'E' then begin
      qryTrab := dtmEmptmo.qryUpdateEstornoContabil;  (* Estorno *)
   end else begin
      qryTrab := dtmEmptmo.qryUpdatePlanilha;         (* Normal *)
   end;

   try
      TabelaPDX.Open;

      TabelaPDX.First;
      while not(TabelaPDX.EOF) do begin

         with qryTrab do begin
            LimpaParametros(qryTrab);
            ParamByName('PIDHISTMOVEMPTMO').AsInteger := TabelaPDX.FieldByName('IDHISTMOVEMPTMO').AsInteger;
            ParamByName('PPLNCODIGO').AsInteger       := iPlanilha;
            ExecSQL;
         end;

         (* marcar também os itens centralizadores como estornados *)
         if sTipoContab = 'E' then begin

            with dtmEmptmo.qryBuscaItemCentralizador do begin
               LimpaParametros(dtmEmptmo.qryBuscaItemCentralizador);
               ParamByName('PIDHISTMOVEMPTMO').AsInteger := TabelaPDX.FieldByName('IDHISTMOVEMPTMO').AsInteger;
               Open;

               if not(isEmpty) then begin
                  with qryTrab do begin
                     LimpaParametros(qryTrab);
                     ParamByName('PIDHISTMOVEMPTMO').AsInteger := dtmEmptmo.qryBuscaItemCentralizadorIDHISTMOVEMPTMO.AsInteger;
                     ParamByName('PPLNCODIGO').AsInteger       := iPlanilha;
                     ExecSQL;
                  end;
               end; (* if not(isEmpty) *)

               Close; (* qryBuscaItemCentralizador *)
            end; (* with qry... *)
         end; (* if sTipoContab *)

         TabelaPDX.Next;

      end; (* while not(TabelaPDX.EOF) *)

      TabelaPDX.Close;

   finally
      if TabelaPDX <> nil then TabelaPDX.Free;
   end;
end;



(* -------------------------------------------------------------------------------------------------
   EnviaItensCAPCAR: Função que integra com CaP/CaR, em batch.
                     Os itens a serem integrados são definidos pela query que será
                     passada para a função

   -------------------------------------------------------------------------------------------------
   O SQL a ser passado deverá ser um SELECT na HistMovEmptmo, com as seguintes características
   obigatórias:

   SELECT
      H.IDHISTMOVEMPTMO             ID do Histórico
      H.IDCONTRATOEMPTMO            ID do Contrato
      TC.IDTIPOCONTREMPTMO          ID do Tipo de Contrato
      H.IDITEMEMPTMO                ID do Item a ser contabilizado
      C.IDPLANOPREV                 ID do Plano Previdencial
      C.IDPATRO                     ID da Patrocinadora
      H.HMEVLRPREVISTO              Valor a ser lançado
      H.HMEDATAPREVISTA             Data prevista para vencimento (original)
      H.HMEDATAVENCTO               Data prevista para vencimento (atualizada)

   WHERE
      TE.IDEMPRESAPROP =            Filtrar obrigatoriamente por Sistema.IDEmpresa

      H.HMEFORMACOBRANCA = 'C'      Apenas os itens que devem ser enviados para o CaP/CaR

      AND ((H.HMECENTRALIZA = 1)    Enviar apenas os itens que são totalizadores, ou
      OR  (H.HMEDESTACADO = 1))     os itens que são cobrados em destacado

   ORDER BY
      H.IDCONTRATOEMPTMO, HMEANOCOBRANCA, HMEMESCOBRANCA, "CONTABAIXA"

   -------------------------------------------------------------------------------------------------
   Parâmetros:

      sSQL           :  SQL que será usado para buscar os itens (ver acima)
      dDataLanc
      dDataVenc

      sResult        :  linhas "de acerto" que serão exibidas, se for o caso
      sErro          :  linhas "de erro" que serão exibidas, se for o caso

      sHistorico     :  Histórico-padrão a ser passado para a Contabilidade

   -------------------------------------------------------------------------------------------------
   Códigos de retorno (controle de erro):
       0 : Envio(s) realizados com sucesso
      -1 : ERRO ao tentar selecionar os itens a enviar ao CAP/CAR
      -2 : Query não retornou itens a Enviar
      -3 : ERRO ao inserir Documento
      -4 : ERRO no Rateio do Documento
      -5 : ERRO ao inserir Mensagens no Documento
      -6 : ERRO ao Lançar Documento
      -7 : ERRO ao Atualizar Histórico com o Documento
      -8 : Processo interrompido pelo usuário sem envio

----------------------------------------------------------------------------------------------------*)
function TIntegraEmptmo.EnviaCAPCAR(const sSQL, sHistorico, sNomePatro: String;
                                    const dDataLanc: TDateTime; var iPlanilha: Integer;
                                    var sResult, sErro: TStringList): Integer;
var
   dDataVenc         : TDateTime;
   fTotal 				: Currency;
   i, j, k           : Integer;
   iTipoDocRec			: Int64;
   iTipoDocPag			: Int64;
   qryItensCAPCAR		: TwwQuery;
   rParamAtual       : TParamIntegra;
   rParamAnterior    : TParamIntegra;
   vMsgCnab  			: array[0..8] of string;
begin
   Result := 0;

   if ParametrosSistema then begin

      if not dtmEmptmo.qryParamEmptmoTIPODOCPAG.IsNULL then begin
         iTipoDocPag := dtmEmptmo.qryParamEmptmoTIPODOCPAG.AsInteger;
      end else begin
         iTipoDocPag := -1;
      end;

      if not dtmEmptmo.qryParamEmptmoTIPODOCREC.IsNULL then begin
         iTipoDocRec := dtmEmptmo.qryParamEmptmoTIPODOCREC.AsInteger;
      end else begin
         iTipoDocRec := -1;
      end;

   end else begin

      (* A tabela Parâmetros do Sistema está vazia *)
      sErro.Add('ERRO nos Parâmetros do Sistema.');
      Result := -1; (* ERRO ao abrir *)
      Exit;

   end; (* if ParametrosSistema *)

   for j := 0 to 8 do vMsgCnab[j] := '';

   (* cria as queries necessárias *)
   qryItensCAPCAR                := TwwQuery.Create(Application);
   qryItensCAPCAR.DatabaseName   := 'BaseDados';

   try

      try
         MostraEspera('Selecionando Itens para Contas a Pagar/Receber...');

         try
            qryItensCAPCAR.SQL.Text := sSql;
            qryItensCAPCAR.Open;
         except
            on E:Exception do begin
               sErro.Add('ERRO ao tentar selecionar os registros - ' + sNomePatro);
               sErro.Add(E.Message);
               Result := -1; (* ERRO ao abrir *)
               Exit;
            end;
         end;

      finally
         EscondeEspera;
      end;

      if qryItensCAPCAR.isEmpty then begin
         sErro.Add('Não existem registros para envio [CAPCAR] - ' + sNomePatro);
         Result := -2;  (* não há itens *)
         Exit;
      end;

      (* tendo conseguido, começa a iterar pela query *)
      with qryItensCAPCAR do begin

         First;
         i := 0;
         j := 0;

         MostraFormProgresso('Enviando Itens para Contas a Pagar/Receber...', i, qryItensCAPCAR.RecordCount, True, True);
         Application.ProcessMessages;

         dDataVenc := qryItensCAPCAR.FieldByName('HMEDATAVENCTO').AsDateTime;

         (* guarda os valores do 1º registro para comparação *)
         MontaParamCAPCAR(rParamAnterior, iTipoDocRec, iTipoDocPag, dDataLanc, dDataVenc, qryItensCAPCAR);
         MontaParamCAPCAR(rParamAtual, iTipoDocRec, iTipoDocPag, dDataLanc, dDataVenc, qryItensCAPCAR);

         (* Vai-se criar um único documento para todos os itens de um contrato que tiverem
            o mesmo mês e ano de cobrança.  Cada item corresponderá a um RateioDocum, e haverá
            um LanctoDocum com o valor total dos itens. *)

         while not(EOF) do begin

            (* cria o Documento com os dados do registro 'ANTERIOR'.
               função que insere Cliente/Fornecedor e insere Documento *)
            if not(InsereDocumento(rParamAnterior, sErro)) then begin
               Result := -3;  (* ERRO ao inserir Documento *)
               Exit;
            end else begin
               (* atribuição do Código do Documento *)
               rParamAtual.iDocumento := rParamAnterior.iDocumento;
            end;(* Insere Documento *)

            fTotal := 0;

            (* compara os campos-chaves do registro 'ATUAL' com o 'ANTERIOR' *)
            while ( not(EOF) and (ComparaParam(rParamAnterior, rParamAtual)) ) do begin

               fTotal := fTotal + rParamAtual.fVlrLanc;

               if ( (j >= 0) and (j <= 8) ) then begin
                  vMsgCnab[j] := rParamAtual.sDescricao + ' [ ' + rParamAtual.sAnoMesCompetencia
                                 + ' ] = ' + FloatToStr(rParamAtual.fVlrLanc);
               end else begin
                  (* se o nº de linhas for superior a 9, NÃO MOSTRA LINHA ALGUMA *)
                  for k := 0 to 8 do vMsgCnab[k] := '';
               end;

               (* cria o RateioDocum com os dados do registro 'ATUAL'
                  função que faz o Rateio do documento *)
               if not(LancaRateio(rParamAtual, sErro)) then begin
                  Result := -4;  (* ERRO no Rateio do Documento *)
                  Exit;
               end;(* Lança Rateio *)

                (* Faz update na tabela HISTMOVEMPTMO com os dados do Documento do CAPCAR *)
               if not(AtualizaHistoricoComDocumento(rParamAtual, sErro)) then begin
                  Result := -7;  (* ERRO ao Atualizar Histórico com o Documento *)
                  Exit;
               end;

                (* Faz update na tabela HISTMOVEMPTMO com o FLGENVIO para enviado (NULL) *)
               if not(AtualizaHistoricoComFlgEnvio(rParamAtual.iHistorico, sErro)) then begin
                  Result := -7;  (* ERRO ao Atualizar Histórico com o Documento *)
                  Exit;
               end;

               inc(i);
               inc(j);
               AndaFormProgresso(i);
               Next; (* qryItensCAPCAR - loop interno - EOF + compara *)

               (* atualiza os parâmetros 'ATUAIS' *)
               MontaParamCAPCAR(rParamAtual, iTipoDocRec, iTipoDocPag, dDataLanc, dDataVenc, qryItensCAPCAR);

            end; (* while de comparação*)

            if rParamAtual.sRecPag = 'R' then begin
               (* Seta MensagensCNAB com os dados do registro 'ANTERIOR' *)
               if not(SetMensagem(rParamAnterior.iDocumento, vMsgCnab, sErro)) then begin
                  Result := -5;  (* ERRO ao inserir Mensagens no Documento *)
                  Exit;
               end;
            end;(* if *)

            (* cria o LanctoDocum com os dados do registro 'ANTERIOR', mais
               a totalização de todos os registros 'ATUAIS'
               função que faz o lançamento do Documento *)
            if not(LancaDocumento(rParamAnterior, fTotal, sHistorico, iPlanilha, sErro)) then begin
               Result := -6;  (* ERRO ao Lançar Documento *)
               Exit;
            end;

             (* atualiza os parâmetros 'ANTERIORES' *)
            MontaParamCAPCAR(rParamAnterior, iTipoDocRec, iTipoDocPag, dDataLanc, dDataVenc, qryItensCAPCAR);

            (* Limpando o vetor das Mensagens *)
            for j := 0  to 8 do vMsgCnab[j] := '';

            inc(i);
            j := 0;

            AndaFormProgresso(i);

            (* Verifica se o usuário Cancelou a Operação *)
            if frmProgresso.Cancelou then begin
               sErro.Add('Processo interrompido pelo usuário.');
               Result := -8;
               Exit;
            end;

         end;(* while *)
      end; (* with *)

   finally
      EscondeFormProgresso;
      EscondeEspera;

      qryItensCAPCAR.Free;
   end;
end;



(* função que insere Cliente/Fornecedor e insere Documento *)
function TIntegraEmptmo.InsereDocumento(var rParam: TParamIntegra; var sErro: TStringList): Boolean;
var
   qryAux      : TwwQuery;
   rSitPart    : TSitPart;
   iRamoForCli : Integer;
begin
   Result := True;

   // ----------------------------------------------------------------------------------------------
   //    Criação do Cliente/Fornecedor
   // ----------------------------------------------------------------------------------------------

   (* busca a situação do participante *)
   rSitPart := FuncoesEmptmo.BuscaSitPart(rParam.iPessoa);

   (* busca o Ramo do Cliente/Fornecedor *)
   iRamoForCli := BuscaRamoForCli(rSitPart.flgInterno, rParam.sRecPag);

   if rParam.sRecPag = 'R' then begin

      try
         (* Criar Cliente *)
         Documento.ForCli.Inserir(rParam.iPessoa,				   (* IdPessoa *)
                                  Sistema.IdEmpresa,			   (* IEmpresaCC *)
                                  -1,								   (* ICodSubConta *)
                                  IntegraBack.Plano,			   (* IPlano *)
                                  iRamoForCli,					   (* IRamoTipoCli *)
                                  Sistema.IdEmpresa,			   (* AutorizacaoIdEmpresa *)
                                  rParam.sCentroCustoDFinan,   (* sCCusto *)
                                  '',								   (* sContaCadianto *)
                                  rParam.sContaDFinan,		   (* sContaCForn *)
                                  '',								   (* sContaCDespesa *)
                                  'C',								   (* sFornCli *)
                                  False);							   (* bExibeMensagem *)
      except

         on E:Exception do begin
            sErro.Add(#13 + 'Erro ao Inserir Cliente. Participante: ' + IntToStr(rParam.iPessoa) + #13);
            sErro.Add(E.Message);
            Result := False;
            Exit;
         end;

      end;(* try..except *)

   end else begin

      try
         (* Criar Fornecedor *)
         Documento.ForCli.Inserir(rParam.iPessoa,              (* IdPessoa *)
                                  Sistema.IdEmpresa,           (* IEmpresaCC *)
                                  -1,                          (* ICodSubConta *)
                                  IntegraBack.Plano,           (* IPlano *)
                                  iRamoForCli,                 (* IRamoTipoCli *)
                                  Sistema.IdEmpresa,           (* AutorizacaoIdEmpresa *)
                                  rParam.sCentroCustoCFinan,   (* sCCusto *)
                                  '',                          (* sContaCadianto *)
                                  rParam.sContaCFinan,         (* sContaCForn *)
                                  '',                          (* sContaCDespesa *)
                                  'F',                         (* sFornCli *)
                                  False);                      (* bExibeMensagem *)

      except

         on E:Exception do begin
            sErro.Add(#13 + 'Erro ao Inserir Fornecedor. Participante: ' + IntToStr(rParam.iPessoa) + #13);
            sErro.Add(E.Message);
            Result := False;
            Exit;
         end;

      end;

   end;


   // ----------------------------------------------------------------------------------------------
   //    Criação do Documento
   // ----------------------------------------------------------------------------------------------

   qryAux               := TwwQuery.Create(Application);
   qryAux.DatabaseName  := 'BaseDados';

   try
      (* Gerar codigo do documento *)
      rParam.iDocumento := Documento.GetCodigo(qryAux);

      if rParam.iDocumento <= 0 then begin
         sErro.Add('Erro ao Gerar código do Documento');
         Result := False;
         Exit;
      end;

      try

         Documento.IdContaBancaria := rParam.IDCBancaria;
         
         Documento.Inserir(qryAux,
                           rParam.iDocumento,            (* iCodDocumento        *)
                           IntToStr(Sistema.IdModulo),   (* sModulo              *)
                           IntToStr(IntegraBack.Plano),  (* sPlano               *)
                           rParam.sCCBaixa,              (* sPlaconta            *)
                           rParam.sCentroCustoDFinan,    (* sCCusto              *)
                           rParam.iMoeda,                (* iMoeCodigo           *)
                           0,                            (* UnidNegoc            *)
                           Sistema.IdEmpresa,            (* IdPessoa             *)
                           rParam.iPessoa,               (* IdForCli             *)
                           rParam.iTipoDoc,              (* CodTipDoc            *)
                           rParam.iCodPortForma,         (* CodPortForma         *)
                           rParam.sRecPag,               (* sRecPag              *)
                           rParam.iContrato,             (* NoDocumento          *)
                           '000',                        (* ComplDocumento       *)
                           DateToStr(rParam.dDataLanc),  (* DataEmissao          *)
                           DateToStr(rParam.dDataVenc),  (* DataVencto           *)
                           DateToStr(rParam.dDataVenc),  (* DataProgramada       *)
                           '0',  (* sStatus *)           (* documento em aberto  *)
                           -1,                           (* NumFatura            *)
                           '2',                          (* sOperacao            *)
                           Sistema.IdUsuario,            (* IdUsuarioInclusao    *)
                           -1,                           (* iCodSubConta         *)
                           rParam.iCodForma,             (* iCodForma            *)
                           '',                           (* sNumLeitCodBarras    *)
                           '',                           (* sNumDigCodBarras     *)
                           rParam.bEmisBloq,             (* bEmisBloq            *)
                           0,                            (* rValorJuros          *)
                           0,                            (* rVlrMulta            *)
                           0);                           (* iIndiceCorrecao      *)

      except

         on E:Exception do begin
            sErro.Add(#13 + 'Erro ao Inserir Documento. Participante: ' + IntToStr(rParam.iPessoa) + #13);
            sErro.Add(E.Message);
            Result := False;
            Exit;
         end;

      end;

   finally

     qryAux.Free;

   end;
end;



function TIntegraEmptmo.BuscaRamoForCli(const sSituacao, sRecPag: String): Int64;
var
   qryAux   : TwwQuery;
   sSql     : String;
begin

   sSql :=
   'SELECT '                                             + #13 +
   '  TIPOFAVPATRO, TIPOFAVATIVOS, TIPOFAVASSISTIDOS, '  + #13 +
   '  TIPOCLIPATRO, TIPOCLIATIVOS, TIPOCLIASSISTIDOS, '  + #13 +
   '  TIPOFAVMANTIDOS, TIPOFAVMANTPARC, '                + #13 +
   '  TIPOCLIMANTIDOS, TIPOCLIMANTPARC '                 + #13 +
   'FROM '                                               + #13 +
   '  PARAMAPREV ';

   (* Cria a Query Auxiliar *)
   qryAux               := TwwQuery.Create(Application);
   qryAux.DatabaseName  := 'BaseDados';

   try
      qryAux.SQL.Text := sSql;
      qryAux.Open;

      with qryAux do begin

         if sRecPag = 'R' then begin (* Buscar Cliente *)

            if sSituacao = 'AT' then Result := FieldByname('TIPOCLIATIVOS').AsInteger     else
            if sSituacao = 'AS' then Result := FieldByname('TIPOCLIASSISTIDOS').AsInteger else
            if sSituacao = 'CA' then Result := FieldByname('TIPOCLIASSISTIDOS').AsInteger else
            if sSituacao = 'PT' then Result := FieldByname('TIPOCLIPATRO').AsInteger      else
            if sSituacao = 'MA' then Result := FieldByname('TIPOCLIMANTIDOS').AsInteger   else
            if sSituacao = 'MP' then Result := FieldByname('TIPOCLIMANTPARC').AsInteger
            else Result := FieldByname('TIPOCLIMANTIDOS').AsInteger;

         end else begin (* Buscar Fornecedor *)

            if sSituacao = 'AT' then Result := FieldByname('TIPOFAVATIVOS').AsInteger     else
            if sSituacao = 'AS' then Result := FieldByname('TIPOFAVASSISTIDOS').AsInteger else
            if sSituacao = 'CA' then Result := FieldByname('TIPOFAVASSISTIDOS').AsInteger else
            if sSituacao = 'PT' then Result := FieldByname('TIPOFAVPATRO').AsInteger      else
            if sSituacao = 'MA' then Result := FieldByname('TIPOFAVMANTIDOS').AsInteger   else
            if sSituacao = 'MP' then Result := FieldByname('TIPOFAVMANTPARC').AsInteger
            else Result := FieldByname('TIPOFAVMANTIDOS').AsInteger;

         end;

      end;

   finally
     qryAux.Free;
   end;
end;



(* função que faz o Rateio do documento *)
function TIntegraEmptmo.LancaRateio(var rParam: TParamIntegra; var sErro: TStringList): Boolean;
begin
   Result := True;

   try

      rParam.iRateioDocum :=
      Documento.Rateio.Inserir(rParam.iDocumento,        (* iCodDocumento     *)
                               rParam.sTipoRecDesFinan,	(* CodTipRecDes      *)
                               rParam.sRecPag,           (* RecPag            *)
                               rParam.sCentroRespon,     (* CodCentroRespon   *)
                               Sistema.IdEmpresa,        (* IdPessoa          *)
                               rParam.fVlrLanc,          (* Valor             *)
                               0,                        (* ValorOutraMoeda   *)
                               Sistema.IdUsuario,        (* IdUsuarioInclusao *)
                               rParam.iUnidNegoc,        (* UnidNegoc         *)
                               -1,                       (* IdReservaOrcamen  *)
                               Modulo.sCentroCusto,      (* sCodCentroCusto   *)
                               rParam.iPatro,            (* IdPatro           *)
                               Modulo.iPrograma,         (* IdPrograma        *)
                               rParam.iPlanPrevContab);  (* IdPlanoPrev       *)

   except

      on E:Exception do begin
         sErro.Add(#13 + 'Erro ao Inserir Rateio. Participante: ' + IntToStr(rParam.iPessoa) + #13);
         sErro.Add(E.Message);
         Result := False;
      end;

   end;
end;



procedure TIntegraEmptmo.MontaParamCaPCaR(var rParam: TParamIntegra;
                                          const iTipoDocRec, iTipoDocPag: Int64;
                                          const dDataLanc, dDataVenc: TDateTime;
                                          const qry: TwwQuery);
begin
   BuscaParamIntegra('C', rParam, qry);

   with qry do begin

      rParam.iContrato             := FieldByName('IDCONTRATOEMPTMO').AsInteger;
      rParam.iPessoa               := FieldByName('IDPESSOA').AsInteger;
      rParam.sRecPag               := FieldByName('HMERECPAG').AsString;
      rParam.sCCBaixa              := FieldByName('CONTABAIXA').AsString;
      rParam.sDescricao            := FieldByName('ITEDESCRICAO').AsString;
      rParam.sAnoMesCompetencia    := FieldByName('ANOMESCOMPETENCIA').AsString;
      rParam.IDCBancaria           := FieldByName('IDCBANCARIA').AsInteger;

      if rParam.sRecPag = 'R' then begin

         (* a Receber *)
         if not(FieldByName('PORTFORMAREC').IsNull) then rParam.iCodPortForma := FieldByName('PORTFORMAREC').AsInteger;
         rParam.bEmisBloq  := True;
         rParam.iCodForma  := -1;
         rParam.sDebCre    := 'D';
         rParam.iTipoDoc   := iTipoDocRec;

      end else begin

         (* a Pagar *)
         if not FieldByName('PORTFORMAPAG').IsNull then  rParam.iCodPortForma := FieldByName('PORTFORMAPAG').AsInteger;
         if not FieldByName('CODFORMAPAG').IsNull then   rParam.iCodForma     := FieldByName('CODFORMAPAG').AsInteger;

         rParam.bEmisBloq := False;
         rParam.sDebCre   := 'C';
         rParam.iTipoDoc  := iTipoDocPag;

      end; (* if rParam.sRecPag *)

      rParam.iMoeda     := Modulo.iMoedaCorrente;
      rParam.dDataLanc  := dDataLanc;
      rParam.dDataVenc  := dDataVenc;

   end;(* with *)
end;



function TIntegraEmptmo.ComparaParam(var rParam1, rParam2: TParamIntegra): Boolean;
begin
   if ( (rParam1.iPessoa <> rParam2.iPessoa) or (rParam1.iContrato <> rParam2.iContrato) ) then begin
      Result := False;
   end else begin
      Result := True;
   end;
end;



(* função que faz o lançamento do Documento *)
function TIntegraEmptmo.LancaDocumento(var   rParam      : TParamIntegra;
                                       const fValor      : Currency;
                                       const sHistorico  : String;
                                       var   iPlanilha   : Integer;
                                       var   sErro       : TStringList
                                       ): Boolean;
var
   qryAux : TwwQuery;
begin
   Result := True;

   qryAux               := TwwQuery.Create(Application);
   qryAux.DatabaseName  := 'BaseDados';

   try
     (* Gerar número do Lançamento *)
      rParam.iLanctoDocum := Documento.GerarNumLancto(qryAux, rParam.iDocumento);

      if rParam.iLanctoDocum <= 0 then begin
         Result := False;
         Exit;
      end;

      try
         Documento.CriarLanctoDoc(qryAux,                                     (* query auxiliar *)
                                  rParam.iDocumento,                          (* iCodDocumento *)
                                  rParam.iLanctoDocum,                        (* iNumLancto *)
                                  -1,                                         (* CodAlterador *)
                                  iPlanilha,                                  (* PnlCodigo *)
                                  DateToStr(rParam.dDataLanc),                (* DataLancto *)
                                  fValor,                                     (* Valor *)
                                  0,                                          (* ValorOutraMoeda *)
                                  -1,                                         (* Estorno *)
                                  rParam.sDebCre,                             (* DebCre *)
                                  '2',                                        (* sOperacao *)
                                  sHistorico + IntToStr(rParam.iContrato),    (* HistoricoCompl *)
                                  Sistema.IdUsuario,                          (* idUsuarioInclusao *)
                                  False,                                      (* bContabiliza *)
                                  -1,                                         (* iCodPortForma *)
                                  '');                                        (* sNumChqBord *)

         (* variável passada como referência que retorna Código
            da planilha que contém a contabilização deste lançamento *)
        rParam.iPlanilha := iPlanilha;

      except

         on E:Exception do begin
            sErro.Add(#13 + 'Erro ao Lançar Documento. Participante: ' + IntToStr(rParam.iPessoa) + #13);
            sErro.Add(E.Message);
            Result := False;
         end;

      end;(* try..except *)

   finally
     qryAux.Free;
   end;
end;



function TIntegraEmptmo.SetMensagem(const iDocumento: Int64; const vMsgCnab: Array of String;
                                    var sErro: TStringList): Boolean;
begin
   (* Operação realizada com sucesso - Retorno da Função *)
   Result := True;

   try

      if not(Documento.IntBanco.SetaMensagensCNAB(iDocumento, -1, vMsgCNAB)) then begin
         Result := False;
         Exit;
      end;

   except

      on E:Exception do begin
         sErro.Add(#13 + 'ERRO ao inserir Mensagens no Documento: ' + IntToStr(iDocumento) + #13);
         sErro.Add(E.Message);
         Result := False;
      end;

   end;
end;




(* -------------------------------------------------------------------------------------------------
   EnviaTMPDESC: Função que prepara o Insert na TMPDESC, em batch.
                 Os registros a serem inseridos são definidos pela query que será
                 passada para a função

   -------------------------------------------------------------------------------------------------
   O SQL a ser passado deverá ser um SELECT na HistMovEmptmo, com as seguintes características
   obigatórias:

   SELECT
      H.IDHISTMOVEMPTMO       ID do Histórico
      H.IDCONTRATOEMPTMO      ID do Contrato
      TC.IDTIPOCONTREMPTMO    ID do Tipo de Contrato
      H.IDITEMEMPTMO          ID do Item a ser contabilizado
      C.IDPLANOPREV           ID do Plano Previdencial
      C.IDPATRO               ID da Patrocinadora
      H.HMEVLRPREVISTO        Valor a ser contabilizado
      H.HMEFORMACOBRANCA      'F' = Folha   |__ define quais contas a usar na contabilização
                              'C' = CaP/CaR |
   WHERE
      TE.IDEMPRESAPROP =      Filtrar obrigatoriamente por Sistema.IDEmpresa

   ORDER BY
      HMEANOCOMPETENCIA, HMEMESCOMPETENCIA, H.IDCONTRATOEMPTMO

   -------------------------------------------------------------------------------------------------
   Parâmetros:

      sSQL           :  SQL que será usado para buscar os registros (ver acima)
      dDataLanc

      sResult        :  linhas "de acerto" que serão exibidas, se for o caso
      sErro          :  linhas "de erro" que serão exibidas, se for o caso

      sHistorico     :  Histórico-padrão a ser inserido na TMPDESC

   -------------------------------------------------------------------------------------------------
   Códigos de retorno (controle de erro):
       0 : Envio realizado com sucesso
      -1 : ERRO ao tentar selecionar os registros a inserir
      -2 : Query não retornou registros
      -3 : ERRO ao tentar criar tabela para agrupamento
      -4 : Processo interrompido pelo usuário sem o Insert na TMPDESC
      -5 : ERRO na busca de Parâmetros Contábeis
      -6 : ERRO - ambigüidade de Parâmetros Contábeis

--------------------------------------------------------------------------------------------------*)
function TIntegraEmptmo.EnviaTMPDESC(const sSQL, sHistorico, sNomePatro, sAnoMesCob: String;
                                     const dDataLanc: TDateTime; var sResult, sErro: TStringList;
                                     const iPatro: Integer; var iLote, iTotalReg: Integer;
                                     var fTotalPatro: Currency): Integer;
var
   sModulo              : String;
   sMsgErroTestaPeriodo : String;
   iEmpresa             : Integer;
   iExercicio           : Integer;
   iPeriodo             : Integer;
   iResultBusca, i      : Integer;
   TabelaPDX            : TTable;
   qryPreparaTmpDesc    : TwwQuery;
   rPreparaParamIntegra	: TParamIntegra;
begin
   (* Retorno da Função *)
   Result := 0;

   (* cria a query que busca os registros a serem inseridos na TMPDESC *)
   qryPreparaTmpDesc                := TwwQuery.Create(Application);
   qryPreparaTmpDesc.DatabaseName   := 'BaseDados';

   try

      try
         MostraEspera(sNomePatro + ' - Selecionando Contratos para Envio...');

         try

            qryPreparaTmpDesc.SQL.Text := sSql;
            qryPreparaTmpDesc.Open;

         except

            on E:Exception do begin
               sErro.Add('ERRO ao tentar selecionar os registros [FOLHA] - ' + sNomePatro);
               sErro.Add(E.Message);
               Result := -1; (* ERRO ao tentar selecionar os registros a inserir *)
               Exit;
            end;

         end; (* try..except do Open da qry *)

      finally
         (* EscondeEspera; não pode ser chamado após o "open", pois o fetch demora *)
      end; (* try..finally do Open da qry *)

      if qryPreparaTmpDesc.isEmpty then begin
         sErro.Add('Não existem registros para envio [FOLHA] - ' + sNomePatro);
         Result := -2;  (* Query não retornou registros *)
         Exit;
      end;(* if qry is Empty *)


      (* gera novo Lote - apenas se já não houver sido passado um lote *)
      if iLote = -1 then iLote := LeUltRegistro(nil,'CTRLINTERFACE');

      (* exclui a tabela temporária Paradox *)
      if not(IntegraEmptmo.ExcluiTabelaPDX('TMPEMPTMO.DB', TabelaPDX)) then begin
         sErro.Add('Erro ao Excluir Tabela Temporária.');
         Result := -3;  (* não conseguir excluir tabela temporária *)
         Exit;
      end;


      try
         (* prepara a criação da tabela *)
         IntegraEmptmo.CriaTabelaPDX('TMPEMPTMO.DB', TabelaPDX);
      except
         on E:Exception do begin
            sErro.Add('ERRO ao tentar criar tabela para agrupamento [FOLHA] - ' + sNomePatro);
            sErro.Add(E.Message);
            Result := -3;  (* não conseguir criar tabela temporária *)
            Exit;
         end;(* on *)
      end;(* try..except da criação da tabela *)


      (* define a estrutura da tabela *)
      if not(DefineEstruturaTabelaTEMP(TabelaPDX)) then begin
         sErro.Add('ERRO ao tentar criar tabela para agrupamento [FOLHA] - ' + sNomePatro);
         Result := -3;  (* não conseguir criar tabela temporária *)
         Exit;
      end;

      (* faz o TestaPeriodo apenas aqui, pois a Data de Lançamento será única *)
      iEmpresa       := Sistema.idEmpresa;
      sModulo        := IntToStr(Sistema.idModulo);

      if TestaPeriodo(False, 'BaseDados', FormatDateTime('dd/mm/yyyy', dDataLanc), sModulo,
                      iExercicio, iPeriodo, iEmpresa, sMsgErroTestaPeriodo (* mensagem de erro *)) = 0 then
      begin

         (* Primeiro Registro *)
         qryPreparaTmpDesc.First;

         i := 0;

         EscondeEspera;
         MostraFormProgresso(sNomePatro + ' - Preparando Contratos para envio...', 0, (* Mínimo *)
                             qryPreparaTmpDesc.RecordCount, (* Máximo *)
                             True, (* botão cancelar visível *)
                             True); (* botão cancelar habilitado *)

         (* Laço de todos os registros que serão gravados na TmpDesc *)
         while not(qryPreparaTmpDesc.EOF) do begin

            inc(i);
            AndaFormProgresso(i);

            (* Verifica se o usuário Cancelou a Operação *)
            if frmProgresso.Cancelou then begin
               sErro.Add('Processo interrompido pelo usuário. Não houve envio [FOLHA] - ' + sNomePatro);
               Result := -4;
               Exit;
            end;(* if Cancelou *)

            (* Busca os Parâmetros de Integração *)
            iResultBusca := IntegraEmptmo.BuscaParamIntegra('C', rPreparaParamIntegra, qryPreparaTmpDesc);

            case iResultBusca of
               -5: sErro.Add('ERRO na busca de Parâmetros Contábeis [FOLHA] - ' + sNomePatro);
               -6: sErro.Add('ERRO - ambigüidade de Parâmetros Contábeis [FOLHA] - ' + sNomePatro);

               0:
               begin
                  (* Conseguiu buscar os Parâmetros Contábeis *)

                  if GravaTabelaTemp(TabelaPDX, qryPreparaTmpDesc, rPreparaParamIntegra, dDataLanc, iExercicio, iPeriodo) then
                  begin

                     (* Faz update na tabela HISTMOVEMPTMO com o FLGENVIO para enviado (NULL) *)
                     if not(AtualizaHistoricoComFlgEnvio(qryPreparaTmpDesc.FieldByName('IDHISTMOVEMPTMO').AsInteger, sErro)) then
                     begin
                        sErro.Add(sNomePatro + ' - [FOLHA] Erro ao atualizar situação de envio do Participante - ' +
                                  qryPreparaTmpDesc.FieldByName('IDPESSOA').AsString);
                     end;

                  end else begin

                     sErro.Add(sNomePatro + ' - [FOLHA] ERRO ao inserir na tabela temporária - ' +
                               qryPreparaTmpDesc.FieldByName('IDPESSOA').AsString);

                  end; (* if GravaTabelaTemp *)

               end; (* 0 *)
            end;(* case *)

            Application.ProcessMessages;

            (* Próximo registro *)
            qryPreparaTmpDesc.Next;

         end;(* while *)

         EscondeFormProgresso;

         if not(ConsolidaInsTmpDesc(sNomePatro, sHistorico, sAnoMesCob, iLote, iExercicio, iPeriodo,
                                    sErro, iTotalReg, fTotalPatro)) then
         begin
            sErro.Add('ERRO ao inserir na TMPDESC - ' + sNomePatro);
         end;(* if ConsolidaInsTempDesc *)

      end else begin

         (* mensagem de erro de TestaPeriodo *)
         sErro.Add(sMsgErroTestaPeriodo +  '-  ERRO - ' + sNomePatro);

      end; (* if TestaPeriodo *)

   finally
      EscondeFormProgresso;
      qryPreparaTmpDesc.Free;

      if TabelaPDX <> nil then TabelaPDX.Close;
      if TabelaPDX <> nil then TabelaPDX.Free;
   end;
end;



procedure TIntegraEmptmo.LimpaRegistroTmpDesc(var Registro: TDadosTmpDesc);
begin
   with Registro do begin
      IdPessoa          := 0;
      IdTitular         := 0;
      IdPessjur         := 0;
      IdPlanoprev       := 0;
      IdLote            := 0;
      IdProvento        := 0;
      IdDesconto        := 0;
      IdEmpresa         := 0;
      IdEmpresaProp     := 0;
      IdMotivo          := 0;
      CodAlterador      := 0;
      CodPortForma      := 0;
      CodTipDoc         := 0;
      Exercicio         := 0;
      NoDocumento       := 0;
      NumPrioridade     := 0;
      Ordem             := 0;
      Periodo           := 0;
      Plano             := 0;
      PlnCodigoPrev     := 0;
      UnidNegoc         := 0;
      FlgDesconto       := 0;
      InscricaoNumero   := 0;
      FlgAtrasoDevol    := '';
      FlgDescFolha      := '';
      FlgTipoDesc       := '';
      RecPag            := '';
      SitEnvio          := '';
      CodCentroCustoC   := '';
      CodCentroCustoD   := '';
      CodCentroRespon   := '';
      Matricula         := '';
      CodTipRecDes      := '';
      PlaContaD         := '';
      PlaContaC         := '';
      TipCodigo         := '';
      ComplDocumento    := '';
      MesCobranca       := '';
      MesReferencia     := '';
      Referencia        := '';
      CodProvDesc       := '';
      Descricao         := '';
      DataReferencia    := 0;
      DataCobranca      := 0;
      Valor             := 0;
      ValorInfo         := 0;
      Parcela           := 0;
      NumParcelas       := 0;

   end;(* with *)
end;



function TIntegraEmptmo.InsertCtrlInterface(const iIDLote, iNumReg, iPatro: Int64;
                                            const sMesRef: String;
                                            const fValor: Currency): Boolean;
begin
   (* função que grava na tabela CTRLINTERFACE, tendo como saída True se a operação foi
      bem sucedida e False caso negativo *)
   with dtmEmptmo.qryInsertCtrlInterface do begin

      LimpaParametros(dtmEmptmo.qryInsertCtrlInterface);

      ParamByName('PIDLOTE').AsInteger            := iIDLote;
      ParamByName('PTIPO').AsString               := 'E';
      ParamByName('PDATAIDATMP').AsDate           := SysDate;
      ParamByName('PFLGIDATMP').AsInteger         := 1;
      ParamByName('PFLGVOLTATMP').AsInteger       := 0;
      ParamByName('PVLRTOTAL').AsCurrency         := fValor;
      ParamByName('PIDPESSOA').AsInteger          := iPatro;
      ParamByName('PNUMREG').AsInteger            := iNumReg;
      ParamByName('PMESREFERENCIA').AsString      := sMesRef;
      ParamByName('PFLGIDAINTERFACE').AsInteger   := 0;
      ParamByName('PFLGVOLTAINTERFACE').AsInteger := 0;

      try
         ExecSQL;
         Result := True;
      except
         Result := False;
      end; (* try..except *)

   end;(* with *)
end;



function TIntegraEmptmo.InsertTmpDesc(const Registro : TDadosTmpDesc): Boolean;
var
   sMesR, sMesC : String;
begin
   (* função que grava na tabela TMPDESC, tendo como saída True se a operação foi
      bem sucedida e False caso negativo *)
   with dtmEmptmo.qryInsertTmpDesc do begin

      LimpaParametros(dtmEmptmo.qryInsertTmpDesc);

      ParamByName('PIDMODULO').AsInteger   := Sistema.IdModulo;
      ParamByName('PSISTORIGEM').AsInteger := Sistema.IdModulo;

      if Registro.IdPessoa  > 0           then ParamByName('PIDPESSOA').AsInteger         := Registro.IdPessoa;
      if Registro.IdTitular > 0           then ParamByName('PIDTITULAR').AsInteger        := Registro.IdTitular;
      if Registro.IdPessjur > 0           then ParamByName('PIDPESSJUR').AsInteger        := Registro.IdPessjur;
      if Registro.IdPlanoprev > 0         then ParamByName('PIDPLANOPREV').AsInteger      := Registro.IdPlanoprev;
      if Registro.NoDocumento > 0         then ParamByName('PNODOCUMENTO').AsInteger      := Registro.NoDocumento;
      if Registro.CodAlterador > 0        then ParamByName('PCODALTERADOR').AsInteger     := Registro.CodAlterador;
      if Registro.Plano > 0               then ParamByName('PPLANO').AsInteger            := Registro.Plano;
      if Registro.Ordem > 0               then ParamByName('PORDEM').AsInteger            := Registro.Ordem;
      if Registro.CodPortForma > 0        then ParamByName('PCODPORTFORMA').AsInteger     := Registro.CodPortForma;
      if Registro.UnidNegoc > 0           then ParamByName('PUNIDNEGOC').AsInteger        := Registro.UnidNegoc;
      if Registro.Periodo > 0             then ParamByName('PPERIODO').AsInteger          := Registro.Periodo;
      if Registro.InscricaoNumero > 0     then ParamByName('PINSCRICAONUMERO').AsInteger  := Registro.InscricaoNumero;
      if Registro.IdLote > 0              then ParamByName('PIDLOTE').AsInteger           := Registro.IdLote;
      if Registro.FlgDesconto > 0         then ParamByName('PFLGDESCONTO').AsInteger      := Registro.FlgDesconto;
      if Registro.CodTipDoc > 0           then ParamByName('PCODTIPDOC').AsInteger        := Registro.CodTipDoc;
      if Registro.NumPrioridade > 0       then ParamByName('PNUMPRIORIDADE').AsInteger    := Registro.NumPrioridade;
      if Registro.IdProvento > 0          then ParamByName('PIDPROVENTO').AsInteger       := Registro.IdProvento;
      if Registro.IdEmpresa > 0           then ParamByName('PIDEMPRESA').AsInteger        := Registro.IdEmpresa;
      if Registro.IdMotivo > 0            then ParamByName('PIDMOTIVO').AsInteger         := Registro.IdMotivo;
      if Registro.Exercicio > 0           then ParamByName('PEXERCICIO').AsInteger        := Registro.Exercicio;
      if Registro.PlnCodigoPrev > 0       then ParamByName('PPLNCODIGOPREV').AsInteger    := Registro.PlnCodigoPrev;
      if Registro.IdDesconto > 0          then ParamByName('PIDDESCONTO').AsInteger       := Registro.IdDesconto;
      if Registro.IdEmpresaProp > 0       then ParamByName('PIDEMPRESAPROP').AsInteger    := Registro.IdEmpresaProp;
      if Registro.Matricula <> ''         then ParamByName('PMATRICULA').AsString         := Registro.Matricula;
      if Registro.TipCodigo <> ''         then ParamByName('PTIPCODIGO').AsString         := Registro.TipCodigo;

      // -------------------------------------------------------------------------------------------

      (* Acerto do formato de MESREF e MESCOB - inserção da "/" *)

      if Registro.MesReferencia <> '' then begin
         sMesR := copy(Registro.MesReferencia, 1, 4) + '/' + copy(Registro.MesReferencia, 5, 2);
         ParamByName('PMESREFERENCIA').AsString := sMesR;
      end;

      if Registro.MesCobranca <> '' then begin
         sMesC := copy(Registro.MesCobranca, 1, 4) + '/' + copy(Registro.MesCobranca, 5, 2);
         ParamByName('PMESCOBRANCA').AsString   := sMesC;
      end;

      // -------------------------------------------------------------------------------------------

      if Registro.Descricao <> ''         then ParamByName('PDESCRICAO').AsString         := Registro.Descricao;
      if Registro.ComplDocumento <> ''    then ParamByName('PCOMPLDOCUMENTO').AsString    := Registro.ComplDocumento;
      if Registro.FlgTipoDesc <> ''       then ParamByName('PFLGTIPODESC').AsString       := Registro.FlgTipoDesc;
      if Registro.CodCentroCustoD <> ''   then ParamByName('PCODCENTROCUSTOD').AsString   := Registro.CodCentroCustoD;
      if Registro.CodCentroCustoC <> ''   then ParamByName('PCODCENTROCUSTOC').AsString   := Registro.CodCentroCustoC;
      if Registro.CodCentroRespon <> ''   then ParamByName('PCODCENTRORESPON').AsString   := Registro.CodCentroRespon;
      if Registro.PlaContaD <> ''         then ParamByName('PPLACONTAD').AsString         := Registro.PlaContaD;
      if Registro.PlaContaC <> ''         then ParamByName('PPLACONTAC').AsString         := Registro.PlaContaC;
      if Registro.FlgDescFolha <> ''      then ParamByName('PFLGDESCFOLHA').AsString      := Registro.FlgDescFolha;
      if Registro.FlgAtrasoDevol <> ''    then ParamByName('PFLGATRASODEVOL').AsString    := Registro.FlgAtrasoDevol;
      if Registro.CodTipRecDes <> ''      then ParamByName('PCODTIPRECDES').AsString      := Registro.CodTipRecDes;
      if Registro.CodProvDesc <> ''       then ParamByName('PCODPROVDESC').AsString       := Registro.CodProvDesc;
      if Registro.SitEnvio <> ''          then ParamByName('PSITENVIO').AsString          := Registro.SitEnvio;

      if Registro.Referencia <> ''        then ParamByName('PREFERENCIA').AsString        := Registro.Referencia;
      if Registro.RecPag <> ''            then ParamByName('PRECPAG').AsString            := Registro.RecPag;
      if Registro.DataReferencia <> 0     then ParamByName('PDATAREFERENCIA').AsDate      := Registro.DataReferencia;
      if Registro.DataCobranca <> 0       then ParamByName('PDATACOBRANCA').AsDate        := Registro.DataCobranca;
      if Registro.Valor <> 0              then ParamByName('PVALOR').AsCurrency           := Registro.Valor;
      if Registro.ValorInfo <> 0          then ParamByName('PVALORINFO').AsFloat          := Registro.ValorInfo;
      if Registro.Parcela <> 0            then ParamByName('PPARCELA').AsInteger          := Registro.Parcela;
      if Registro.NumParcelas <> 0        then ParamByName('PNUMPARCELAS').AsInteger      := Registro.NumParcelas;

      try
         ExecSQL;
         Result := True;
      except
         Result := False;
      end;

   end;(* with *)
end;



function TIntegraEmptmo.DefineEstruturaTabelaTEMP(var T: TTable): Boolean;
begin
   Result := True;

   try
      (* define a estrutura da tabela *)
      T.FieldDefs.Clear;
      T.FieldDefs.Add('IDHISTMOVEMPTMO',     ftInteger,   0, False);
      T.FieldDefs.Add('HMEVLRPREVISTO',      ftFloat,     0, False);
      T.FieldDefs.Add('DATALANCTO',          ftDate,      0, False);
      T.FieldDefs.Add('IDTITULAR',           ftInteger,   0, False);
      T.FieldDefs.Add('IDBENEF',             ftInteger,   0, False);
      T.FieldDefs.Add('IDPATRO',             ftInteger,   0, False);
      T.FieldDefs.Add('IDPLANOPREV',         ftInteger,   0, False);
      T.FieldDefs.Add('IDRUBRICA',           ftInteger,   0, False);
      T.FieldDefs.Add('IDCONTRATOEMPTMO',    ftInteger,   0, False);
      T.FieldDefs.Add('IDEMPRESA',           ftInteger,   0, False);
      T.FieldDefs.Add('EXERCICIO',           ftInteger,   0, False);
      T.FieldDefs.Add('PERIODO',             ftInteger,   0, False);
      T.FieldDefs.Add('PLANO',               ftInteger,   0, False);
      T.FieldDefs.Add('UNIDNEGOC',           ftInteger,   0, False);
      T.FieldDefs.Add('INSCRICAONUMERO',     ftInteger,   0, False);
      T.FieldDefs.Add('ANOMESCOMPETENCIA',   ftString,    6, False);
      T.FieldDefs.Add('CCUSTDEB',            ftString,   10, False);
      T.FieldDefs.Add('CCUSTCRED',           ftString,   10, False);
      T.FieldDefs.Add('CODCENTRORESPON',     ftString,   10, False);
      T.FieldDefs.Add('MATRICULA',           ftString,   13, False);
      T.FieldDefs.Add('CCDEB',               ftString,   18, False);
      T.FieldDefs.Add('CCCRED',              ftString,   18, False);
      T.FieldDefs.Add('TIPCODIGO',           ftString,    2, False);
      T.FieldDefs.Add('TIPORECDES',          ftString,   15, False);
      T.FieldDefs.Add('RECPAG',              ftString,    1, False);
      T.FieldDefs.Add('CODPROVDESC',         ftString,   15, False);
      T.FieldDefs.Add('HMEFORMACOBRANCA',    ftString,    1, False);
      T.FieldDefs.Add('ITCPRIORIDADE',       ftInteger,   0, False);
      T.FieldDefs.Add('HMEPARCELA',          ftInteger,   0, False);
      T.FieldDefs.Add('HMENUMPARCELAS',      ftInteger,   0, False);
      T.FieldDefs.Add('HMETIPOFOLHA',        ftString,    1, False);

      (* cria efetivamente a tabela *)
      T.CreateTable;
      T.Open;

   except
      Result := False;
   end;
end;



function TIntegraEmptmo.GravaTabelaTemp(var   T                : TTable;
                                        const qry              : TwwQuery;
                                        const rParamIntegra    : TParamIntegra;
                                        const dDataLanc        : TDateTime;
                                        const iExercicio       : Integer;
                                        const iPeriodo         : Integer
                                        ): Boolean;
var
	sSQL	 : String;
   qryAux : TwwQuery;
begin
   (* Operação realizada com sucesso - Retorno da Função *)
   Result := True;

   sSQL :=
   'SELECT '                                                         + #13 +
   '	CODPROVDESC '                                                  + #13 +
   'FROM '                                                           + #13 +
   '  RUBRICAXPESS '                                                 + #13 +
   'WHERE '                                                          + #13 +
   '      IDPESSOA   = ' + qry.FieldByName('IDPATRO').AsString       + #13 +
   '  AND IDRUBRICA  = ' + qry.FieldByName('IDRUBRICA').AsString;

   (* Cria a Query Auxiliar *)
   qryAux               := TwwQuery.Create(Application);
   qryAux.DatabaseName  := 'BaseDados';

   try

      qryAux.SQL.Text := sSQL;
      qryAux.Open;

      T.Append;

      T.FieldByName('IDHISTMOVEMPTMO').AsInteger   := rParamIntegra.iHistorico;
      T.FieldByName('HMEVLRPREVISTO').AsFloat      := abs(rParamIntegra.fVlrLanc);
      T.FieldByName('DATALANCTO').AsDateTime       := dDataLanc;
      T.FieldByName('ANOMESCOMPETENCIA').AsString  := qry.FieldByName('ANOMESCOMPETENCIA').AsString;
      T.FieldByName('IDBENEF').AsInteger           := qry.FieldByName('IDBENEF').AsInteger;
      T.FieldByName('IDTITULAR').AsInteger         := qry.FieldByName('IDPESSOA').AsInteger;
      T.FieldByName('IDPATRO').AsInteger           := rParamIntegra.iPatro;
      T.FieldByName('IDPLANOPREV').AsInteger       := rParamIntegra.iPlanoPrev;
      T.FieldByName('IDRUBRICA').AsInteger         := qry.FieldByName('IDRUBRICA').AsInteger;
      T.FieldByName('IDCONTRATOEMPTMO').AsInteger  := qry.FieldByName('IDCONTRATOEMPTMO').AsInteger;
      T.FieldByName('IDEMPRESA').AsInteger         := Sistema.IDEmpresa;
      T.FieldByName('EXERCICIO').AsInteger         := iExercicio;
      T.FieldByName('PERIODO').AsInteger           := iPeriodo;
      T.FieldByName('PLANO').AsInteger             := rParamIntegra.iPlano;
      T.FieldByName('UNIDNEGOC').AsInteger         := rParamIntegra.iUnidNegoc;
      T.FieldByName('INSCRICAONUMERO').AsInteger   := qry.FieldByName('INSCRICAONUMERO').AsInteger;
      T.FieldByName('CODCENTRORESPON').AsString    := rParamIntegra.sCentroRespon;
      T.FieldByName('MATRICULA').AsString          := qry.FieldByName('MATRICULA').AsString;
      T.FieldByName('TIPCODIGO').AsString          := rParamIntegra.sTipoPer;
      T.FieldByName('TIPORECDES').AsString         := rParamIntegra.sTipoRecDesFolha;
      T.FieldByName('RECPAG').AsString             := qry.FieldByName('HMERECPAG').AsString;
      T.FieldByName('CODPROVDESC').AsString        := qryAux.FieldByName('CODPROVDESC').AsString;
      T.FieldByName('HMEFORMACOBRANCA').AsString   := qry.FieldByName('HMEFORMACOBRANCA').AsString;
      T.FieldByName('ITCPRIORIDADE').AsInteger     := qry.FieldByName('ITCPRIORIDADE').AsInteger;
      T.FieldByName('HMEPARCELA').AsInteger        := qry.FieldByName('HMEPARCELA').AsInteger;
      T.FieldByName('HMENUMPARCELAS').AsInteger    := qry.FieldByName('HMENUMPARCELAS').AsInteger;
      T.FieldByName('HMETIPOFOLHA').AsString       := qry.FieldByName('HMETIPOFOLHA').AsString;

      (* se o valor for negativo, inverte as contas e etc de débito/crédito *)
      if rParamIntegra.fVlrLanc < 0 then begin

         T.FieldByName('CCDEB').AsString           := rParamIntegra.sContaCFolha;
         T.FieldByName('CCCRED').AsString          := rParamIntegra.sContaDFolha;

         if rParamIntegra.sCentroCustoDFolha <> '' then  T.FieldByName('CCUSTDEB').AsString  := rParamIntegra.sCentroCustoCFolha;
         if rParamIntegra.sCentroCustoCFolha <> '' then  T.FieldByName('CCUSTCRED').AsString := rParamIntegra.sCentroCustoDFolha;

      end else begin

         T.FieldByName('CCDEB').AsString           := rParamIntegra.sContaDFolha;
         T.FieldByName('CCCRED').AsString          := rParamIntegra.sContaCFolha;

         if rParamIntegra.sCentroCustoDFolha <> '' then  T.FieldByName('CCUSTDEB').AsString  := rParamIntegra.sCentroCustoDFolha;
         if rParamIntegra.sCentroCustoCFolha <> '' then  T.FieldByName('CCUSTCRED').AsString := rParamIntegra.sCentroCustoCFolha;

      end;

      try
         T.Post;
      except
         Result := False;
      end;

   finally
      qryAux.Close;
      qryAux.Free;
   end;
end;



function TIntegraEmptmo.ConsolidaInsTmpDesc(const sNomePatro, sHistorico, sAnoMesCob: String;
                                            const iLote, iExercicio, iPeriodo: Integer;
                                            var sErro: TStringList; var iTotalReg: Integer;
                                            var fTotalPatro: Currency): Boolean;
var
   qryConsolida         : TwwQuery;
   rTmpDesc             : TDadosTmpDesc;
   rSitPart             : TSitPart;
   sSQL                 : String;
   dDataRef             : TDateTime;
   i                    : Integer;
begin
   (* Retorno da Função *)
   Result := True;

   (* agrupa os registros *)
   case Modulo.iFlgAgrupaParc of

      0: sSQL :=
         'SELECT ' +
         '  SUM(HMEVLRPREVISTO) AS VALOR, ' +
         '  ANOMESCOMPETENCIA, IDTITULAR, IDBENEF,     IDPLANOPREV, IDEMPRESA , IDPATRO, ' +
         '  CODCENTRORESPON  , IDRUBRICA, TIPORECDES , MATRICULA ,  RECPAG , ' +
         '  IDCONTRATOEMPTMO , EXERCICIO, TIPCODIGO ,  PERIODO, ' +
         '  INSCRICAONUMERO  , CCUSTDEB , DATALANCTO , UNIDNEGOC ,  CCCRED , ' +
         '  CCUSTCRED, CODPROVDESC, CCDEB, PLANO, ' +
         '  HMEFORMACOBRANCA , HMETIPOFOLHA ' +
         'FROM ' +
         '  "TMPEMPTMO.DB" TMPEMPTMO ' +
         'GROUP BY ' +
         '  ANOMESCOMPETENCIA, IDTITULAR, IDBENEF, IDPLANOPREV, IDEMPRESA , IDPATRO, ' +
         '  CODCENTRORESPON  , IDRUBRICA, TIPORECDES , MATRICULA , RECPAG , ' +
         '  IDCONTRATOEMPTMO , EXERCICIO, TIPCODIGO , PERIODO, ' +
         '  INSCRICAONUMERO  , CCUSTDEB , DATALANCTO , UNIDNEGOC , CCCRED , ' +
         '  CCUSTCRED, CODPROVDESC, CCDEB, PLANO, ' +
         '  HMEFORMACOBRANCA , HMETIPOFOLHA';

      1: sSQL :=
         'SELECT ' +
         '  SUM(HMEVLRPREVISTO) AS VALOR, ' +
         '  ANOMESCOMPETENCIA, IDTITULAR, IDBENEF,     IDPLANOPREV, IDEMPRESA , IDPATRO, ' +
         '  CODCENTRORESPON  , IDRUBRICA, TIPORECDES , MATRICULA ,  RECPAG , ' +
         '  IDCONTRATOEMPTMO , EXERCICIO, HMEPARCELA , TIPCODIGO ,  PERIODO, ' +
         '  INSCRICAONUMERO  , CCUSTDEB , DATALANCTO , UNIDNEGOC ,  CCCRED , ' +
         '  CCUSTCRED, CODPROVDESC, CCDEB, PLANO, ' +
         '  HMEFORMACOBRANCA , HMETIPOFOLHA, HMENUMPARCELAS, ITCPRIORIDADE ' +
         'FROM ' +
         '  "TMPEMPTMO.DB" TMPEMPTMO ' +
         'GROUP BY ' +
         '  ANOMESCOMPETENCIA, IDTITULAR, IDBENEF, IDPLANOPREV, IDEMPRESA , IDPATRO, ' +
         '  CODCENTRORESPON  , IDRUBRICA, TIPORECDES , MATRICULA , RECPAG , ' +
         '  IDCONTRATOEMPTMO , EXERCICIO, HMEPARCELA , TIPCODIGO , PERIODO, ' +
         '  INSCRICAONUMERO  , CCUSTDEB , DATALANCTO , UNIDNEGOC , CCCRED , ' +
         '  CCUSTCRED, CODPROVDESC, CCDEB, PLANO, ' +
         '  HMEFORMACOBRANCA , HMETIPOFOLHA, HMENUMPARCELAS, ITCPRIORIDADE ';

      2: sSQL :=
         'SELECT ' +
         '  SUM(HMEVLRPREVISTO) AS VALOR, ' +
         '  IDTITULAR, IDBENEF,     IDPLANOPREV, IDEMPRESA , IDPATRO, ' +
         '  CODCENTRORESPON  , IDRUBRICA, TIPORECDES , MATRICULA ,  RECPAG , ' +
         '  IDCONTRATOEMPTMO , EXERCICIO, TIPCODIGO ,  PERIODO, ' +
         '  INSCRICAONUMERO  , CCUSTDEB , DATALANCTO , UNIDNEGOC ,  CCCRED , ' +
         '  CCUSTCRED, CODPROVDESC, CCDEB, PLANO, ' +
         '  HMEFORMACOBRANCA , HMETIPOFOLHA, ITCPRIORIDADE ' +
         'FROM ' +
         '  "TMPEMPTMO.DB" TMPEMPTMO ' +
         'GROUP BY ' +
         '  IDTITULAR, IDBENEF, IDPLANOPREV, IDEMPRESA , IDPATRO, ' +
         '  CODCENTRORESPON  , IDRUBRICA, TIPORECDES , MATRICULA , RECPAG , ' +
         '  IDCONTRATOEMPTMO , EXERCICIO, TIPCODIGO , PERIODO, ' +
         '  INSCRICAONUMERO  , CCUSTDEB , DATALANCTO , UNIDNEGOC , CCCRED , ' +
         '  CCUSTCRED, CODPROVDESC, CCDEB, PLANO, ' +
         '  HMEFORMACOBRANCA , HMETIPOFOLHA, ITCPRIORIDADE';

   end; (* Case Modulo.iFlgAgrupaParc *)

   qryConsolida := TwwQuery.Create(Application);

   try

      qryConsolida.Close;
    //Jéssica Lana SOL 114575 Kintana 535771 24/04/2009
    //qryConsolida.DataBaseName  := copy(Sistema.TempDir, 1, length(Sistema.TempDir) - 1);
      qryConsolida.DataBaseName  := copy(ftempregra, 1, length(ftempregra) - 1);
      qryConsolida.SQL.Text      := sSql;

      try

         MostraEspera(sNomePatro + ' - Agrupando Contratos para envio...');
         qryConsolida.Open;

      finally
         EscondeEspera;
      end;

      (* executa todos os lançamentos a débito *)
      with qryConsolida do begin

         (* SUM retona sempre um registro mesmo que ZERADO *)
         if ( (RecordCount < 1) or (isEmpty) or (FieldByName('IDBENEF').AsInteger = 0) ) then begin
            Result := False;
            Exit;
         end;

         iTotalReg   := 0;
         fTotalPatro := 0;

         First;

         i := 0;
         MostraFormProgresso(sNomePatro + ' - Enviando...', 0, RecordCount, True, True);

         while not(EOF) do begin

            inc(i);
            AndaFormProgresso(i);

            (* limpa o record de dados *)
            LimpaRegistroTmpDesc(rTmpDesc);

            (* monta o record de dados *)
            rTmpDesc.IdPessoa        := FieldByName('IDBENEF').AsInteger;
            rTmpDesc.IdTitular       := FieldByName('IDTITULAR').AsInteger;
            rTmpDesc.IdPessjur       := FieldByName('IDPATRO').AsInteger;
            rTmpDesc.IdPlanoprev     := FieldByName('IDPLANOPREV').AsInteger;
            rTmpDesc.IdLote          := iLote;
            rTmpDesc.IdProvento      := FieldByName('IDRUBRICA').AsInteger;
            rTmpDesc.IdDesconto      := FieldByName('IDCONTRATOEMPTMO').AsInteger;
            rTmpDesc.IdEmpresa       := FieldByName('IDEMPRESA').AsInteger;
            rTmpDesc.IdEmpresaProp   := FieldByName('IDEMPRESA').AsInteger;
            rTmpDesc.Exercicio       := iExercicio;
            rTmpDesc.NoDocumento     := FieldByName('IDCONTRATOEMPTMO').AsInteger;
            rTmpDesc.NumPrioridade   := 1;
            rTmpDesc.Periodo         := iPeriodo;
            rTmpDesc.Plano           := FieldByName('PLANO').AsInteger;
            rTmpDesc.UnidNegoc       := FieldByName('UNIDNEGOC').AsInteger;
            rTmpDesc.FlgDesconto     := 1;
            rTmpDesc.InscricaoNumero := FieldByName('INSCRICAONUMERO').AsInteger;

            (* Tipo de Folha - (B)enefício ou (P)atrocinadora *)
            rTmpDesc.FlgDescFolha    := FieldByName('HMETIPOFOLHA').AsString;

            dDataRef := StrToDate('01/' + Copy(sAnoMesCob, 5, 2) + '/' + Copy(sAnoMesCob, 1, 4));

            rTmpDesc.DataReferencia  := dDataRef;
            rTmpDesc.ComplDocumento  := '1';
            rTmpDesc.FlgTipoDesc     := 'E';
            rTmpDesc.SitEnvio        := '0';
            rTmpDesc.RecPag          := 'P'; // qryConsolida.FieldByName('RECPAG').AsString;
            rTmpDesc.CodCentroCustoC := FieldByName('CCUSTCRED').AsString;
            rTmpDesc.CodCentroCustoD := FieldByName('CCUSTDEB').AsString;
            rTmpDesc.CodCentroRespon := FieldByName('CODCENTRORESPON').AsString;
            rTmpDesc.Matricula       := FieldByName('MATRICULA').AsString;
            rTmpDesc.CodTipRecDes    := FieldByName('TIPORECDES').AsString;
            rTmpDesc.PlaContaD       := FieldByName('CCDEB').AsString;
            rTmpDesc.PlaContaC       := FieldByName('CCCRED').AsString;
            rTmpDesc.TipCodigo       := FieldByName('TIPCODIGO').AsString;
            rTmpDesc.MesCobranca     := sAnoMesCob;
            rTmpDesc.MesReferencia   := FieldByName('ANOMESCOMPETENCIA').AsString;

            (* tratamento do flgAtrasoDevol - precisa ? *)
            rTmpDesc.FlgAtrasoDevol  := 'N';

            if rTmpDesc.MesReferencia < rTmpDesc.MesCobranca then rTmpDesc.FlgAtrasoDevol  := 'A';


            (* se não agrupa parcelas, pode passar o nº das mesmas *)
            if Modulo.iFlgAgrupaParc = 1 then begin

               rTmpDesc.Referencia  := FormatFloat('000', FieldByName('HMEPARCELA').AsFloat) + '/' +
                                       FormatFloat('000', (FieldByName('HMENUMPARCELAS').AsFloat + FieldByName('HMEPARCELA').AsFloat));

               rTmpDesc.ValorInfo   := FieldByName('HMENUMPARCELAS').AsInteger;

               rTmpDesc.Parcela     := FieldByName('HMEPARCELA').AsInteger;
               rTmpDesc.NumParcelas := FieldByName('HMENUMPARCELAS').AsInteger + FieldByName('HMEPARCELA').AsInteger;

               rTmpDesc.Ordem       := FieldByName('ITCPRIORIDADE').AsInteger;

            end; (* Modulo.iFlgAgrupaParc = 1 *)


            rTmpDesc.CodProvDesc     := FieldByName('CODPROVDESC').AsString;
            rTmpDesc.Descricao       := sHistorico;
            rTmpDesc.Valor           := FieldByName('VALOR').AsCurrency;

            dDataRef := CalcEmptmo.BuscaData('N', (* Normal *)
                                             FieldByName('HMEFORMACOBRANCA').AsString, (* Tipo de Cobrança *)
                                             rSitPart.flgInterno,
                                             FieldByName('IDPATRO').AsInteger,
                                             FieldByName('IDPLANOPREV').AsInteger,
                                             2, (* Parcelas, isto é mais de 1 parcela *)
                                             dDataRef);

            rTmpDesc.DataCobranca    := dDataRef;

            (* função que grava o record de dados na tabela TMPDESC, tendo como saída True
               se a operação foi bem sucedida e False caso negativo *)
            if not(InsertTmpDesc(rTmpDesc)) then begin

               (* Operação com Erro - Não inseriu na TMPDESC *)
               sErro.Add('Erro ao inserir Participante - ' + FieldByName('IDBENEF').AsString);

               (* Retorno da função indicará que houve pelo menos 1 registro com erro *)
               Result := False;

            end else begin

               (* Operação bem sucedida - INSERIU na TMPDESC *)
               inc(iTotalReg);
               fTotalPatro := fTotalPatro + FieldByName('VALOR').AsCurrency;

            end;

            (* Próximo registro *)
            Next;

         end;(* while *)

      end;(* with *)

   finally
      EscondeFormProgresso;
      qryConsolida.Free;
   end;
end;



(*	Função que exclui todas as parcelas de um participante na TMPDESC *)
function TIntegraEmptmo.ExcluiTMPDESC(const iContratoEmptmo : Int64;
                                      const iParcela        : Integer;
                                      const sMesCobranca    : String;
                                      const bMostraMsg      : Boolean
                                      ): Boolean;
var
   sMsg     : String;
begin
   sMsg    	:= '';
   Result   := True;

   with dtmIntegraEmptmo.qryExcluiTMPDESC do begin
      LimpaParametros(dtmIntegraEmptmo.qryExcluiTMPDESC);
      ParamByName('PIDESCONTO').AsInteger    := iContratoEmptmo;

      if sMesCobranca <> '' then ParamByName('PMESCOBRANCA').AsString   := sMesCobranca;
      if iParcela > -1 then      ParamByName('PREFERENCIA').AsString    := FormatFloat('000', iParcela);
   end;

   try
      dtmIntegraEmptmo.qryExcluiTMPDESC.ExecSQL;
   except
      sMsg    	:= 'Erro ao excluir registros na TMPDESC.';
      Result	:= False;
   end;

   if ( (bMostraMsg) and (Trim(sMsg) <> '') ) then MsgDlg(sMsg, 'Empréstimo', mtError, [mbOk], 0);
end;



function TIntegraEmptmo.ValidaFolha(const idContrato: Int64; iMesCobranca, iAnoCobranca: Integer;
												var sStatus: TStatusEnvio; const bMostraMsg: Boolean): Boolean;
var
	lsMesCobranca, Msg : String;
begin
	(* foi inserido mais 2 parametros: 1 para fazer o controle do status do envio e outro para mostrar ou nao
   	mensagens.  *)
   Result := False;
   Msg    := '';

  // verifica se exite parcela e se foi enviada na TMPDESC
    {1ºPasso ===========================================================}
   lsMesCobranca   := IntToStr(iAnoCobranca) + '/' + FormatFloat('00',iMesCobranca);
   dtmEmptmo.qryAux.Close;
   dtmEmptmo.qryAux.Sql.Clear;
   dtmEmptmo.qryAux.Sql.Add(' SELECT COUNT(*) AS OCORRENCIA, ' +
                            '        SITENVIO                ' +
                            '        FLGDESCFOLHA            ' +
                            ' FROM   TMPDESC                 ' +
                            ' WHERE  MESCOBRANCA = ' + '''' + lsMesCobranca + '''' +
                            '    AND IDDESCONTO  = ' + IntToStr(idContrato)        +
                            '    AND IDMODULO    = ' + IntToStr(Sistema.IdModulo)  +
                            ' GROUP BY SITENVIO, FLGDESCFOLHA                    ');
   try
      dtmEmptmo.qryAux.Open;
   except
      sStatus := sFolhaError;
      MsgDlg('Erro ao abrir tabela.','Empréstimo',MtError,[mbOk],0);
      Exit;
   end;


   if dtmEmptmo.qryAux.IsEmpty Then
   begin
      sStatus   := sFolhaError;
      if bMostraMsg then
         Result :=  MsgDlg('Não há registro enviados para Folha de Benefícios.'+#13+
                      'Deseja continuar o processo?','Empréstimo',
                        mtConfirmation,[mbYes, mbNo], 0) = mrYes;

   end else if dtmEmptmo.qryAux.RecordCount > 1 then begin
      (* SE RETORNAR MAIS DE UM REGISTRO PODE HAVER INCONSISTÊNCIA,
      POIS, PARA UM MESCOBRANCA EXISTE UMA RUBRICA ENVIADA E OUTRA NÃO. *)
      sStatus := sFolhaError;
      Msg     := 'Existem problemas no Envio.';

   (* B ==> Folha Beneficio *)
   (* P ==> Folha Patrocinadora *)
   end else if ( (dtmEmptmo.qryAux.FieldByName('FLGDESCFOLHA').AsString = 'B') and
           (dtmEmptmo.qryAux.FieldByName('SITENVIO').AsInteger =  1) ) then
   begin
      sStatus := sFolhaProc;
      Msg     :=  'A parcela já foi Enviada pela Folha de Benefícios'+#13+
                  'Não é possível efetuar operação.';
   end else begin
      Result   := True;
   end;

   if ( (bMostraMsg) and (Trim(Msg) <> '') ) then MsgDlg(Msg,'Empréstimo', mtError, [mbOk], 0);
end;



function TIntegraEmptmo.VerificaEnvio: Boolean;
begin
   Result := False;

   try

      with dtmEmptmo.qrySaidaSistema do begin
         LimpaParametros(dtmEmptmo.qrySaidaSistema);
         ParamByName('PIDEMPRESAPROP').AsInteger := Sistema.idEmpresa;
         Open;

         if not(isEmpty) then begin
            Result := dtmEmptmo.qrySaidaSistemaTOTAL_ITENS.asInteger > 0;
         end;
      end;

   finally
      dtmEmptmo.qrySaidaSistema.Close;
   end;
end;



function TIntegraEmptmo.ExcluiFinanceiro(const iDocumento : int64; var sMsg : String) : Integer;
begin
   Result := 0;

   // ----------------------------------------------------------------------------------------------

   Result := VerificaDocumento(iDocumento, sMsg);

   if Result  = 0 then begin

      try
         (* exclui as msgs CNAB (se houver) *)
         with dtmEmptmo.qryDeleteMsgCnab do begin
            LimpaParametros(dtmEmptmo.qryDeleteMsgCnab);
            ParamByName('PCODDOCUMENTO').AsInteger := iDocumento;
            ExecSQL;
         end;

         Application.ProcessMessages;

         // -------------------------------------------------------------------------------------------------

         (* exclui os RecbtoPagto *)
         with dtmEmptmo.qryExcluiRecbtoPagto do begin
            LimpaParametros(dtmEmptmo.qryExcluiRecbtoPagto);
            ParamByName('PCODDOCUMENTO').asInteger := iDocumento;
            ExecSQL;
         end;

         Application.ProcessMessages;

         (* exclui os LoteXDocum *)
         with dtmEmptmo.qryExcluiLotexDocum do begin
            LimpaParametros(dtmEmptmo.qryExcluiLotexDocum);
            ParamByName('PCODDOCUMENTO').asInteger := iDocumento;
            ExecSQL;
         end;

         Application.ProcessMessages;

         (* exclui os RateioDocum *)
         with dtmEmptmo.qryExcluiRateioDocum do begin
            LimpaParametros(dtmEmptmo.qryExcluiRateioDocum);
            ParamByName('PCODDOCUMENTO').asInteger := iDocumento;
            ExecSQL;
         end;

         Application.ProcessMessages;

         (* exclui os LanctoDocum *)
         with dtmEmptmo.qryExcluiLanctoDocum do begin
            LimpaParametros(dtmEmptmo.qryExcluiLanctoDocum);
            ParamByName('PCODDOCUMENTO').asInteger := iDocumento;
            ExecSQL;
         end;

         Application.ProcessMessages;

         (* exclui o Documento *)
         with dtmEmptmo.qryExcluiDocumento do begin
            LimpaParametros(dtmEmptmo.qryExcluiDocumento);
            ParamByName('PCODDOCUMENTO').asInteger := iDocumento;
            ExecSQL;
         end;
      except
         Result := -1;
      end;
   end;
end;



function TIntegraEmptmo.EfetuaBaixaCAR(const iDocumento : int64) : Boolean;
var
   fSaldoDoc        : Real;
   fSaldoOutraMoeda : Real;
   iNumLancto       : int64;
   iPlanilha        : integer;

begin
   Result := True;

   Documento.Saldo.GetSaldoDoc(iDocumento,'', (* Data do Saldo - Saldo Atual *)
                               'R', (* RecPag *) fSaldoDoc, fSaldoOutraMoeda);

   iNumLancto := Documento.GerarNumLancto(dtmEmptmo.QryAux, iDocumento);

   if iNumLancto <= 0 then begin
      Result := False;
      Exit;
   end;

   try
      Documento.CriarLanctoDoc(dtmEmptmo.QryAux,                    (* query auxiliar *)
                               iDocumento,                          (* iCodDocumento *)
                               iNumLancto,                          (* iNumLancto *)
                               -1,                                  (* CodAlterador *)
                               iPlanilha,                           (* PnlCodigo *)
                               DateToStr(SysDate)  ,                (* DataLancto *)
                               fSaldoDoc,                           (* Valor *)
                               0,                                   (* ValorOutraMoeda *)
                               -1,                                  (* Estorno *)
                               'C',                                 (* DebCre *)
                               '5',                                 (* sOperacao *)
                               'Cancelamento de Documento',         (* HistoricoCompl *)
                               Sistema.IdUsuario,                   (* idUsuarioInclusao *)
                               False,                               (* bContabiliza *)
                               -1,                                  (* iCodPortForma *)
                               '');                                 (* sNumChqBord *)
   except
      Result := False;
   end;
end;



function TIntegraEmptmo.ExcluiContabil(const iPlanilha: Int64; var sMsg : String) : Integer;
begin
   Result := 0;

   (* só exclui a planilha se esta existir, é claro... *)
   if iPlanilha <> -1 then begin

      Result := VerificaPlanilha(iPlanilha, sMsg);

      if Result = 0 then begin
         try
            (* exclui os lançamentos da planilha *)
            with dtmEmptmo.qryExcluiLancContab do begin
               LimpaParametros(dtmEmptmo.qryExcluiLancContab);
               ParamByName('PPLNCODIGO').asInteger := iPlanilha;
               ExecSQL;
            end;

            Application.ProcessMessages;

            (* exclui própria planilha *)
            with dtmEmptmo.qryExcluiPlanilha do begin
               LimpaParametros(dtmEmptmo.qryExcluiPlanilha);
               ParamByName('PPLNCODIGO').asInteger := iPlanilha;
               ExecSQL;
            end;
         except
            Result := -1;
         end;
      end;
   end;
end;



function TIntegraEmptmo.DesfazEnvio(const iContratoEmptmo: Int64;
                                    const iParcela       : Integer;
                                    const iAno           : Integer;
                                    const iMes           : Integer;
                                    const dDataPrevista  : TDateTime;
                                    const bCompetencia   : Boolean;
                                    const sFormaEnvio    : String;
                                    const bMostraMsg     : Boolean
                                    ): Boolean;
var
   bTransacao : Boolean;
   sAnoMes    : String;
   sSQL       : String;
   sMsg       : String;
begin
   bTransacao := False;
   if not(dtmBaseDados.dbBaseDados.InTransaction) then begin
      bTransacao := True;
      StartTransacao;
   end;

   try

      sAnoMes := '';
      if ( (iAno > 0) and (iMes > 0) ) then begin
         sAnoMes := FormatFloat('0000', iAno) + '/' + FormatFloat('00', iMes);
      end;

      (* 1º - já exclui da tmpdesc o que puder ser exlcuído... *)
      if ( (sFormaEnvio = '') or (sFormaEnvio = 'F') ) then begin

         if not(ExcluiTMPDESC(iContratoEmptmo, iParcela, sAnoMes, bMostraMsg)) then begin

            if (bTransacao and dtmBaseDados.dbBaseDados.InTransaction) then RollBackTransacao;
            Result := False;
            Exit;
         end;

      end; (* if sFormaEnvio *)


      (* 2º - exclui do CaR os registros de lá ... *)
      if ( (sFormaEnvio = '') or (sFormaEnvio = 'C') ) then begin

         sSQL :=
         'SELECT '                                                               + #13 +
         '  CON.IDCONTRATOEMPTMO, '                                              + #13 +
         '  HST.HMEANOCOBRANCA, '                                                + #13 +
         '  HST.HMEMESCOBRANCA, '                                                + #13 +
         '  HST.CODDOCUMENTO, '                                                  + #13 +
         '  HST.HMEFORMACOBRANCA, '                                              + #13 +
         '  PES.NOME, '                                                          + #13 +
         '  DOC.STATUS, '                                                        + #13 +
         '  DOC.EMISBLOQ, '                                                      + #13 +
         '  SUM(HST.HMEVLRPREVISTO) AS HMEVLRPREVISTO '                          + #13 +
         'FROM '                                                                 + #13 +
         '  PESSOA          PES, '                                               + #13 +
         '  HISTMOVEMPTMO   HST, '                                               + #13 +
         '  DOCUMENTO       DOC, '                                               + #13 +
         '  CONTRATOEMPTMO  CON  '                                               + #13 +
         'WHERE '                                                                + #13 +
         '      ( CON.IDCONTRATOEMPTMO = ' + IntToStr(iContratoEmptmo) + ' ) '   + #13 +
         '  AND ( (HST.HMECENTRALIZA   = 1) OR (HST.HMEDESTACADO = 1)) '         + #13 +
         '  AND ( HST.FLGENVIO         IS NULL ) '                               + #13 +
         '  AND ( HST.FLGBAIXADO       IS NOT NULL ) '                           + #13;

         if (not bCompetencia) and ((iMes + iAno) > 0) then begin
            sSQL := sSQL +
              ' AND  (HST.HMEANOCOBRANCA || ''/'' || HST.HMEMESCOBRANCA = ' + sAnoMes + ')'       + #13;
         end else if (bCompetencia) and ((iMes + iAno) > 0) then begin
            sSQL := sSQL +
              ' AND  (HST.HMEANOCOMPETENCIA || ''/'' || HST.HMEMESCOMPETENCIA = ' + sAnoMes + ')' + #13;
         end;

         sSQL := sSQL +
         ' AND  (CON.IDCONTRATOEMPTMO   = HST.IDCONTRATOEMPTMO)'                         + #13 +
         ' AND  (CON.IDPESSOA           = PES.IDPESSOA         )'                        + #13 +
         ' AND  (HST.CODDOCUMENTO       = DOC.CODDOCUMENTO (+) )'                        + #13 +
         ' GROUP BY CON.IDCONTRATOEMPTMO, HST.HMEANOCOBRANCA,  HST.HMEMESCOBRANCA, '     + #13 +
         '          HST.CODDOCUMENTO, HST.HMEFORMACOBRANCA, PES.NOME, DOC.STATUS,  '     + #13 +
         '          DOC.EMISBLOQ                                                   '     ;

         with dtmIntegraEmptmo.qryExcluiFinanceiro do begin
            Close;
            SQL.Clear;
            SQL.Text := sSql;
            Open;
            while not(EOF) do begin
               ExcluiFinanceiro(FieldByName('CODDOCUMENTO').AsInteger, sMsg);
               Next;
            end;
            Close;
         end;

      end; (* if sFormaEnvio *)

      (* 3º - marca novamente os registros com flgenvio = 0 *)

      if (sFormaEnvio = '') or (sFormaEnvio = 'C') then begin
         with dtmIntegraEmptmo.qryRemarcaEnvio do begin
            LimpaParametros(dtmIntegraEmptmo.qryRemarcaEnvio);
            ParamByName('PIDCONTRATOEMPTMO').AsInteger    := iContratoEmptmo;

            if ( (iAno > 0) and (iMes > 0) ) then begin
               ParamByName('PHMEANOCOBRANCA').AsInteger   := iAno;
               ParamByName('PHMEMESCOBRANCA').AsInteger   := iMes;
            end;

            if iParcela > -1 then ParamByName('PHMEPARCELA').AsInteger := iParcela;

            if sFormaEnvio = 'C' then ParamByName('PHMEFORMACOBRANCA').AsString := sFormaEnvio;

            ExecSQL;
         end;
      end;

      (* *)

      if (bTransacao and dtmBaseDados.dbBaseDados.InTransaction) then CommitTransacao;
      Result := True;

   except
      if (bTransacao and dtmBaseDados.dbBaseDados.InTransaction) then RollBackTransacao;
      Result := False;
   end;
end;



function TIntegraEmptmo.VerificaDocumento(const iCodDocumento : Int64; var sMsg : String) : Integer;
var
   sSql              : String;
   qryAux            : TwwQuery;
begin
   (* Cria a Query Auxiliar *)

   try
      qryAux               := TwwQuery.Create(Application);
      qryAux.DatabaseName  := 'BaseDados';
      Result               := 0;

      try
         sSql :=
         'SELECT '                           + #13 +
         '  EMISBLOQ, STATUS '               + #13 +
         'FROM '                             + #13 +
         '  DOCUMENTO '                      + #13 +
         'WHERE '                            + #13 +
         '  ( CODDOCUMENTO  = ' + IntToStr(iCodDocumento) + ' ) '  + #13;

         qryAux.SQL.Text := sSql;
         qryAux.Open;

         if not(qryAux.isEmpty) then begin           // FDIAS - FCRT - 19.02.2002
            if qryAux.FieldByName('EMISBLOQ').AsString = 'S' then begin
               sMsg       := 'Arquivo de pagamento já enviado. Operação não pode ser efetuada.';
               Result     := -2;
            end;

            if Trim(qryAux.FieldByName('Status').AsString) = '2' then begin
               sMsg       := 'Empréstimo já foi creditado. Operação não pode ser efetuada.';
               Result     := -3;
            end;
         end;
      except
         Result := -1;
      end;

   finally
      qryAux.Close;
      qryAux.Free;
   end;
end;



function TIntegraEmptmo.VerificaPlanilha(const iPlanilha : Int64; var sMsg : String) : Integer;
var
   sSql              : String;
   qryAux            : TwwQuery;
   dDataLanc         : TDateTime;
   iEmpresa          : Integer;
   sModulo           : String;
   iExercicio        : Integer;
   iPeriodo          : Integer;
begin
   (* Cria a Query Auxiliar *)

   try
      qryAux               := TwwQuery.Create(Application);
      qryAux.DatabaseName  := 'BaseDados';
      Result               := 0;
      try
         sSql :=
         'SELECT '                           + #13 +
         '  PLNDATDIA '                      + #13 +
         'FROM '                             + #13 +
         '  PLANILHA '                       + #13 +
         'WHERE '                            + #13 +
         '  ( PLNCODIGO  = ' + IntToStr(iPlanilha) + ' ) '  + #13;

         qryAux.SQL.Text := sSql;
         qryAux.Open;

         if not(qryAux.isEmpty) then begin
            dDataLanc := qryAux.FieldByName('PLNDATDIA').AsDateTime;

           iEmpresa       := Sistema.idEmpresa;
           sModulo        := IntToStr(Sistema.idModulo);

           if TestaPeriodo(False, 'BaseDados', FormatDateTime('dd/mm/yyyy', dDataLanc), sModulo,
                                  iExercicio, iPeriodo, iEmpresa, sMsg) <> 0 then begin
              Result := -2;
           end;
         end;
      except
         Result := -1;
      end;

   finally
      qryAux.Close;
      qryAux.Free;
   end;
end;



end.
