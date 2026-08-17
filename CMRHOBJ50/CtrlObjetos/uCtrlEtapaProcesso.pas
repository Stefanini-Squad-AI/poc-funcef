{*******************************************************}
{                                                       }
{ CM Soluções Informática                               }
{ ** Todos os Direitos Reservados                       }
{ Analista Responsável: Raniere S. M. da Silva          }
{ Criado Em: 27/11/2002                                 }
{                                                       }
{*******************************************************}
//********************************************************************************************************
//N. Sol..........: 174225
//N. Kintana......: 1572025
//Data............: 08/02/2012
//Responsável.....: Paulo Nobre
//Descrição.......: Refazendo rotinas de integração contabil e financeira para considerar o valor das etapas
//                  rateado pelo programas e subprogramas dos objetos
//********************************************************************************************************
//N. Sol..........: 172550
//N. Kintana......: 1555163
//Data............: 27/01/2012
//Responsável.....: Paulo Nobre
//Descrição.......: Incluir rotinas pegar dados de integração parametrizáveis
//********************************************************************************************************
//N. Sol..........: 172573 e 172553
//N. Kintana......: 1555789 e 1554889
//Data............: 24/01/2012
//Responsável.....: Paulo Nobre
//Descrição.......: Incluir rotinas para Calculo da Data Prevista de Pagamento
//********************************************************************************************************
//N. Sol..........: 171564
//N. Kintana......: 1538999
//Data............: 09/01/2012
//Responsável.....: Paulo Nobre
//Descrição.......: Recebendo o campo IDCBANCARIA na função GerarIntegracaoEtapa
//********************************************************************************************************
//N. Sol..........: 161760
//N. Kintana......: 1379145
//Data............: 01/08/2011
//Responsável.....: Paulo Nobre
//Descrição.......: Implementar novas rotinas de integração financeira. Retirar a forma atual (emulaçao da tela CAP/CAR)
//                  e substituir pelas funções de integração
//********************************************************************************************************
Unit uCtrlEtapaProcesso;

Interface

Uses SysUtils, Controls, Dialogs, Db, DbClient, uCmDbObject, uCmControlObject, uCMClientDataSet,
   uCtrlCustomRH, uCtrlLancamento, uCtrlDocumento, uCtrlHonorarioProcesso,
   uCtrlListTerceirosRH, uCtrlBancoPortFolha, uCtrlIntegraRH, uDbProcessoTrab, uDbEtapaProcTrab,
   uDbHonorarios, uDbImagens, uDbImovel, uDbEventoImovel, Wwquery, uSistema, uCMMath,
   uCtrlCorrigeObjEtapasProc, uCtrlPlacontasCapCar;

Type
   TCtrlEtapaProcesso = Class(TCtrlCustomRH)
   Protected
      FCtrlLancamento: TCtrlLancamento;
      FCtrlDocumento: TCtrlDocumento;
      FCtrlListTerceirosRH: TCtrlListTerceirosRH;
      FCtrlBancoPortFolha: TCtrlBancoPortFolha;
      FCtrlIntegraRH: TCtrlIntegraRH;
      FCtrlHonorarioProcesso: TCtrlHonorarioProcesso;
      FCtrlCorrigeObjEtapasProc: TCtrlCorrigeObjEtapasProc;

      FCdsDocumentos: TCMClientDataSet;

      FObrigaAbc: boolean;
      FObrigaCRespon: boolean;
      FUsaPlanoPatro: boolean;
      FPlnCodigo: OleVariant;
      FValorTotal_Original: double;
      FPortadorFormaPadrao: integer;
      FIdModulo: integer;
      FIdUsuario: integer;
      FIdEspAcesso: integer;
      FIdEmpresa: integer;
      FNumEtapas_Original: integer;
      FIdFavorecido: integer;
      FPlanoPrevGlobal: integer;
      FPatroGlobal: integer;
      FCodPortadorForma: integer;
      FIdPrograma: integer;
      FDataEmissao: TDate;
      FPlano: Integer;
      FPlanoPrev: integer;
      FPatro: integer;
      FCodEtapas_Original: OleVariant;
      FValorEtapas_Original: OleVariant;
      FValorHonorarios_Original: OleVariant;
      FCodTipRecDes: String;
      FListaNumDocCAP: String;
      FListaPlnCodigo: String;
      FCodCentroCusto: String;
      FCodCentroRespon: String;
      FCodAlterador: integer;
      FValorAlt: double;

      // SOL 172573-172553  KTN 1555789-1554889 - Paulo Nobre
      FFundacaoCidade: Integer;
      FFundacaoEstado: String;
      FFundacaoPais: Integer;

      Procedure DoChangeDataBase; Override;
      Procedure OnCreateAppServer; Override;
      Procedure AfterInitialize; Override;
      Procedure OnApplyCdsRecord(aCds: TClientDataSet; Const sTableName: String;
         CdsState: TUpdateStatus; Var Accept: boolean); Override;
      Procedure AfterApplyCdsRecord(aCds: TClientDataSet; Const sTableName: String;
         CdsState: TUpdateStatus; Accept: boolean); Override;
   Private
      FDbProcesso: TDbProcessoTrab;
      FDbEtapas: TDbEtapaProcTrab;
      FDbImagens: TDbImagens;
      FDbHonorarios: TDbHonorarios;
      FDbImovel: TDbImovel;
      FDbEventoImovel: TDbEventoImovel;

      FCdsProcesso: TCMClientDataSet;
      FCdsEtapas: TCMClientDataSet;
      FCdsImagens: TCMClientDataSet;
      FCdsHonorarios: TCMClientDataSet;
      FCdsImovel: TCMClientDataSet;
      FCdsEventoImovel: TCMClientDataSet;

      FCtrlPlacontasCapCar: TCtrlPlacontasCapCar;
      rPlaContas: TPlaContas;

      // SOL 161760 KTN 1379145 - Paulo Nobre
      FDescricaoLancamento: String;
      FCodDocumento: String;
      FNumDocumentoGerado: String;
      FPlnCodigoGerado: Integer;
      FNumPlanilhaGerada: String;

      Procedure GetDiferencaValorIntegra(Var ValEtapa, ValHonor: double);

      Function GerarIntegracaoCAP(Valor: double; DataPag: TDate): boolean;
      Function GerarIntegracaoCAR(Valor: double; DataPag: TDate): boolean;
      Function GerarIntegracaoContabil(Valor: double; IdPlanoPrev, IdPatro: integer;
         PlaConta: String; Plano: integer; PlaContaCredito, TipoOperacao,
         DescricaoLancamento: String): boolean;
      Function GerarCAP(Valor: double): boolean;
      Function GerarCAR(Valor: double): boolean;

      // SOL 172573-172553  KTN 1555789-1554889 - Paulo Nobre
      // Carrega Cidade, Estado e Pais da Fundacao
      Procedure CarregarCidadeEstadoPaisSistema;
   Public
      Constructor Create(UsuXFilial, UsuXCCusto, IdUsuarioGeral: String); Reintroduce;
      Destructor Destroy; Override;

      // Métodos de execução de Querys
      Function ListEtapas(NumProcTrab: double): OleVariant;
      Function ListImagens(NumProcTrab: double): OleVariant;

      Function GetUltimoNumSeq: integer;
      Function ApanhaProximoNumSeq(NumProcesso: String): integer;

      // Verifica se o Usuário especificado tiver agenda
      Function UsuarioComAgenda(IdUsuario: double): boolean;
      Function GerarHonorario(DataPag: TDate): boolean;
      Function GravarEtapaProcesso(GravarImagens: boolean;
         GravarHonorarios: boolean; IdBemAntes, IdConjuntoAntes: double): boolean;

      // Inicializa variáveis usadas na integração
      Procedure IniciarIntegracao(IdEmpresa, IdModulo, IdUsuario, IdEspAcesso: integer;
         UsaPlanoPatro, ObrigaAbc, ObrigaCRespon: boolean; PlanoPrevGlobal, PatroGlobal: integer);

      Procedure IniciarValoresContabeis;
      // Atualiza Total de Despesas de acordo com a Despesa informada
      Procedure AtualizarTotalDespesas(ValorDespesa: double);

      // Retorna os Valores do Processo
      Procedure GetValores(NumProcTrab: double; Var ValCausa, ValOrig, ValAtual, ValReal: double);

      // Faz a geração da integração com a Contabilidade e/ou CAP
      Function GerarIntegracao(FazCAP, FazContab: boolean;
         DataEmissao, DataPagamento: TDateTime; IdFavorecido, IdPlanoPrev, IdPatro: integer;
         PlaConta: String; Plano: integer; PlaContaCredito, TipoOperacao, CodTipRecDes,
         CodCentroRespon, CodCentroCusto: String;
         CodTipDoc, CodPortadorForma, IdPrograma: integer;
         ValorDif: double = 0; ValorLev: double = 0; ValorAlt: double = 0;
         CodAlterador: integer = 0; ValorMulta: double = 0): boolean;

      Function AtualizarObjetos(NumProcTrab: double): boolean;
      Function AtualizarCAF(IdBemAntes, IdConjuntoAntes: double): boolean;
      Function AtualizarImovel(IdImovel: double; Inicio: boolean): boolean;
      Function InserirEventoImovel(IdImovel: double; EviData: TDate;
         Inicio: boolean; EviDescricao: String; EviPercent, EviVlrAjustado: double): boolean;

      Function GerarIntegracaoRateioDespesas(FazCAP, FazContab: boolean; DataEmissao, DataPagamento: TDate;
         IdFavorecido, IdPlanoPrev, IdPatro: integer; PlaConta: String; Plano: integer;
         PlaContaCredito, TipoOperacao, CodTipRecDes: String; CodTipDoc: integer;
         DescricaoLancamento: String; Valor: double): boolean;

      // SOL 172573-172553  KTN 1555789-1554889 - Paulo Nobre
      Function CalcularDataPagamento(DataPagto: TDateTime; iQtdDias: Integer): TDateTime;

      Procedure ExcluiArrematacao(NumProcTrab, NumSeq, CodTipoRecurso: Double);

      /////////////////////////////////////////////////////////////////////////////////////////////////////////
      ///
      /////////// NOVAS FUNÇÕES PARA INTEGRAÇÃO CONTÁBIL E FINANCEIRA
      //
      ////////////////////////////////////////////////////////////////////////////////////////////////////////

      Function IntegrandoEtapaContabilFinanceiro(DataEmissao, DataPagamento: TDateTime;
         IdFavorecido, IdCBancaria, Plano, CodTipDoc, CodPortadorForma, IdPrograma: integer;
         CodCentroCusto, CodCentroRespon, EtapaObservacao, PagRec, sIdDesembolsoEtapa, sPagRecCustas, sIdDesembolsoCustas, sIntegraContabil: String;
         ValorEtapa, ValorEtapaVinc, ValorCustas: double; cdsEtapaxObjetos: TCMClientDataSet): boolean;

      Function ContabilizaUsandoCriteriosDeRateios(
         iNumProctrab, iPrograma, iIdPrograma, iPlano, iPlanoPrevCustas, iPatroCustas, iCodDocumento: Integer;
         sSub_Programa, sTipoLancamento, sDataLanc, sHist1, sHist2, sHist3, sHist4, sHist5: String;
         dValLanc: double; sContaDB, sContaCR, sCentroCusto, sDesembolso, sPagRec, sCodCentroRespon: String;
         Var FPlnCodigo: OleVariant): Boolean;

      Function LocalizaContasFundoADM(iPlano: Integer; sPlaConta: String): OleVariant;

      Function LocalizaObjAssociados(NumProcTrab, NumSeq, CodTipoRecurso: Double): OleVariant;
      Procedure ExcluiObjAssociados(NumProcTrab, NumSeq, CodTipoRecurso: Double);

      ////////////////////////////////////////////////////////////////////////////////////////////////////////////////

      Property CdsEtapas: TCMClientDataSet Read FCdsEtapas Write FCdsEtapas;
      Property CdsImagens: TCMClientDataSet Read FCdsImagens Write FCdsImagens;
      Property CdsHonorarios: TCMClientDataSet Read FCdsHonorarios Write FCdsHonorarios;
      Property CdsProcesso: TCMClientDataSet Read FCdsProcesso Write FCdsProcesso;
      Property CdsImovel: TCMClientDataSet Read FCdsImovel Write FCdsImovel;
      Property CdsEventoImovel: TCMClientDataSet Read FCdsEventoImovel Write FCdsEventoImovel;

      // SOL 161760 KTN 1379145 - Paulo Nobre
      Property CodDocumento: String Read FCodDocumento Write FCodDocumento;
      Property PlnCodigoGerado: Integer Read FPlnCodigoGerado Write FPlnCodigoGerado;
      Property NumDocumentoGerado: String Read FNumDocumentoGerado Write FNumDocumentoGerado;
      //
      Property NumPlanilhaGerada: String Read FNumPlanilhaGerada Write FNumPlanilhaGerada;

      // SOL 172573-172553  KTN 1555789-1554889 - Paulo Nobre
      Property fundacaoCidade: Integer Read FFundacaoCidade;
      Property fundacaoEstado: String Read FFundacaoEstado;
      Property fundacaoPais: Integer Read FFundacaoPais;
   End;

Implementation

Uses uCMTypes, uCtrlFuncoesRH;

{ TCtrlEtapaProcesso }

Constructor TCtrlEtapaProcesso.Create(UsuXFilial, UsuXCCusto, IdUsuarioGeral: String);
Begin
   FDbProcesso := TDbProcessoTrab.Create(Self);
   FDbEtapas := TDbEtapaProcTrab.Create(Self);
   FDbImagens := TDbImagens.Create(Self);
   FDbHonorarios := TDbHonorarios.Create(Self);
   FDbImovel := TDbImovel.Create(Self);
   FDbEventoImovel := TDbEventoImovel.Create(Self);

   FCtrlLancamento := TCtrlLancamento.Create;
   FCtrlDocumento := TCtrlDocumento.Create;
   FCtrlListTerceirosRH := TCtrlListTerceirosRH.Create(UsuXFilial, UsuXCCusto, IdUsuarioGeral);
   FCtrlBancoPortFolha := TCtrlBancoPortFolha.Create;
   FCtrlIntegraRH := TCtrlIntegraRH.Create(UsuXFilial, UsuXCCusto, IdUsuarioGeral);
   FCtrlHonorarioProcesso := TCtrlHonorarioProcesso.Create(UsuXFilial, UsuXCCusto, IdUsuarioGeral);

   FCtrlPlacontasCapCar := TCtrlPlacontasCapCar.Create;

   FCtrlLancamento.OpenTransaction := false;
   FCtrlDocumento.OpenTransaction := false;

   Inherited Create;
End;

Destructor TCtrlEtapaProcesso.Destroy;
Begin
   FreeAndNil(FDbProcesso);
   FreeAndNil(FDbEtapas);
   FreeAndNil(FDbImagens);
   FreeAndNil(FDbHonorarios);
   FreeAndNil(FDbImovel);
   FreeAndNil(FDbEventoImovel);
   FreeAndNil(FCtrlLancamento);
   FreeAndNil(FCtrlDocumento);
   FreeAndNil(FCtrlListTerceirosRH);
   FreeAndNil(FCtrlBancoPortFolha);
   FreeAndNil(FCtrlIntegraRH);
   FreeAndNil(FCtrlHonorarioProcesso);

   If Assigned(FctrlPlacontasCapCar) Then FreeAndNil(FctrlPlacontasCapCar);

   If (IsAppServer) Then
      Begin
         FreeAndNil(FCdsProcesso);
         FreeAndNil(FCdsEtapas);
         FreeAndNil(FCdsImagens);
         FreeAndNil(FCdsHonorarios);
         FreeAndNil(FCdsImovel);
         FreeAndNil(FCdsEventoImovel);
      End;
   Inherited;
End;

Procedure TCtrlEtapaProcesso.AfterInitialize;
Begin
   Inherited;
   FCtrlLancamento.InitializeAs(Self);
   FCtrlDocumento.InitializeAs(Self);
   FCtrlListTerceirosRH.InitializeAs(Self);
   FCtrlBancoPortFolha.InitializeAs(Self);
   FCtrlIntegraRH.InitializeAs(Self);
   FCtrlHonorarioProcesso.InitializeAs(Self);
   FCtrlPlacontasCapCar.InitializeAs(Self);
End;

Procedure TCtrlEtapaProcesso.OnCreateAppServer;
Begin
   Inherited;
   FCdsProcesso := TCMClientDataSet.Create(Nil);
   FCdsEtapas := TCMClientDataSet.Create(Nil);
   FCdsImagens := TCMClientDataSet.Create(Nil);
   FCdsHonorarios := TCMClientDataSet.Create(Nil);
   FCdsImovel := TCMClientDataSet.Create(Nil);
   FCdsEventoImovel := TCMClientDataSet.Create(Nil);
End;

Procedure TCtrlEtapaProcesso.DoChangeDataBase;
Begin
   Inherited;
   FDbProcesso.DataBaseName := DataBaseName;
   FDbEtapas.DataBaseName := DataBaseName;
   FDbImagens.DataBaseName := DataBaseName;
   FDbHonorarios.DataBaseName := DataBaseName;
   FDbImovel.DataBaseName := DataBaseName;
   FDbEventoImovel.DataBaseName := DataBaseName;

   FCtrlLancamento.DataBase := DataBase;
   FCtrlDocumento.DataBase := DataBase;
   FCtrlListTerceirosRH.DataBase := DataBase;
   FCtrlBancoPortFolha.DataBase := DataBase;
   FCtrlIntegraRH.DataBase := DataBase;
   FCtrlHonorarioProcesso.DataBase := DataBase;
End;

Function TCtrlEtapaProcesso.ListEtapas(NumProcTrab: double): OleVariant;
Var
   sSql: String;
Begin
   sSql := ('SELECT' + CR_LF +
      '  ET.*, TP.DESCRICAO AS ETAPA, TP.VALORHONOR,' + CR_LF +
      '  TP.FLGPENHORA, TP.FLGENCERRAMENTO,' + CR_LF +
      '  DECODE(NVL(ET.INDPENHORA, 0),1,''Imóvel'',2,''Ativo'',3,''Invest.'',4,''Numer.'','''') AS TIPOPENH,' + CR_LF +
      '  PENH.BEMPENHORADO, SP.DESCPENHORA' + CR_LF +
      'FROM' + CR_LF +
      '  ETAPAPROCTRAB ET, TIPORECTRAB TP, SITUACAOPENHORA SP,' + CR_LF +
      '  (SELECT DESBEM AS BEMPENHORADO, ET.NUMPROCTRAB, ET.NUMSEQ' + CR_LF +
      '   FROM BEM B, ETAPAPROCTRAB ET' + CR_LF +
      '   WHERE  (B.IDBEM = ET.IDBEM)' + CR_LF +
      '   AND    (ET.NUMPROCTRAB    = ' + FloatToStr(NumProcTrab) + ')' + CR_LF +
      '   UNION' + CR_LF +
      '   SELECT DESCCONJUNTO AS BEMPENHORADO, ET.NUMPROCTRAB, ET.NUMSEQ' + CR_LF +
      '   FROM CONJUNTO C, ETAPAPROCTRAB ET' + CR_LF +
      '   WHERE  (C.IDCONJUNTO = ET.IDCONJUNTO)' + CR_LF +
      '   AND    (ET.NUMPROCTRAB    = ' + FloatToStr(NumProcTrab) + ')' + CR_LF +
      '   UNION' + CR_LF +
      '   SELECT IMONOME AS BEMPENHORADO, ET.NUMPROCTRAB, ET.NUMSEQ' + CR_LF +
      '   FROM IMOVEL I, ETAPAPROCTRAB ET' + CR_LF +
      '   WHERE  (I.IDIMOVEL = ET.IDIMOVEL)' + CR_LF +
      '   AND    (ET.NUMPROCTRAB    = ' + FloatToStr(NumProcTrab) + ')' + CR_LF +
      '   UNION' + CR_LF +
      '   SELECT DESCINVESTIMENTO AS BEMPENHORADO, ET.NUMPROCTRAB, ET.NUMSEQ' + CR_LF +
      '   FROM INVESTIMENTO I, ETAPAPROCTRAB ET' + CR_LF +
      '   WHERE  (I.IDINVESTIMENTO = ET.IDINVESTIMENTO)' + CR_LF +
      '   AND    (ET.NUMPROCTRAB    = ' + FloatToStr(NumProcTrab) + ')' + CR_LF +
      '   UNION' + CR_LF +
      '   SELECT DESCFUNDOINVEST AS BEMPENHORADO, ET.NUMPROCTRAB, ET.NUMSEQ' + CR_LF +
      '   FROM FUNDOINVEST I, ETAPAPROCTRAB ET' + CR_LF +
      '   WHERE  (I.IDFUNDOINVEST = ET.IDFUNDOINVEST)' + CR_LF +
      '   AND    (ET.NUMPROCTRAB    = ' + FloatToStr(NumProcTrab) + ')' + CR_LF +
      '   UNION' + CR_LF +
      '   SELECT ''Numerário = '' || TO_CHAR(VALORREC) AS BEMPENHORADO, ET.NUMPROCTRAB, ET.NUMSEQ' + CR_LF +
      '   FROM ETAPAPROCTRAB ET' + CR_LF +
      '   WHERE  (ET.INDPENHORA = 4)' + CR_LF +
      '   AND    (ET.NUMPROCTRAB    = ' + FloatToStr(NumProcTrab) + ') ) PENH' + CR_LF +
      'WHERE' + CR_LF +
      '  (ET.NUMPROCTRAB    = ' + FloatToStr(NumProcTrab) + ') AND' + CR_LF +
      '  (ET.CODTIPORECURSO = TP.CODTIPORECURSO) AND' + CR_LF +
      '  (ET.NUMPROCTRAB    = PENH.NUMPROCTRAB(+)) AND' + CR_LF +
      '  (ET.NUMSEQ         = PENH.NUMSEQ(+)) AND' + CR_LF +
      '  (ET.IDSITPENHORA   = SP.IDSITUACAO(+)) ' + CR_LF +
      'ORDER BY ET.NUMSEQ '); //-- Renan cristiano SOL 133219 | Kintana 774633

   Result := GetDataPacket(sSql);
End;

Function TCtrlEtapaProcesso.ListImagens(NumProcTrab: double): OleVariant;
Begin
   Result := GetDataPacket(
      'SELECT' + CR_LF +
      '  EP.NUMSEQ, IMG.IDIMAGEM, IMG.IMAGEM, IMG.DESCRIMAGEM' + CR_LF +
      'FROM' + CR_LF +
      '  IMAGENS IMG, ETAPAPROCTRAB EP' + CR_LF +
      'WHERE' + CR_LF +
      '  (EP.NUMPROCTRAB = ' + FloatToStr(NumProcTrab) + ') AND' + CR_LF +
      '  (EP.IDIMAGEM    = IMG.IDIMAGEM)');
End;

Function TCtrlEtapaProcesso.GetUltimoNumSeq: integer;
Begin
   CdsEtapas.DisableControls;
   CdsEtapas.First;
   Result := 0;
   While Not (CdsEtapas.EOF) Do
      Begin
         If (CdsEtapas.FieldByName('NUMSEQ').asInteger > Result) Then
            Result := CdsEtapas.FieldByName('NUMSEQ').asInteger;
         CdsEtapas.Next;
      End;
   CdsEtapas.First;
   CdsEtapas.EnableControls;
End;

Function TCtrlEtapaProcesso.ApanhaProximoNumSeq(NumProcesso: String): integer;
Var
   _CdsAux: TCMClientDataSet;
Begin
   _CdsAux := TCMClientDataSet.Create(Nil);

   _CdsAux.Data := GetDataPacket(
      'SELECT MAX(NUMSEQ) AS NUMSEQ' + CR_LF +
      'FROM   ETAPAPROCTRAB' + CR_LF +
      'WHERE (NUMPROCTRAB = ' + NumProcesso + ')');

   Result := _CdsAux.FieldByName('NUMSEQ').asinteger + 1;

   _CdsAux.Free;
End;

Procedure TCtrlEtapaProcesso.GetValores(NumProcTrab: double; Var ValCausa,
   ValOrig, ValAtual, ValReal: double);
Var
   _CdsAux: TCMClientDataSet;
Begin
   _CdsAux := TCMClientDataSet.Create(Nil);

   _CdsAux.Data := GetDataPacket(
      'SELECT SUM(VALORRECL) AS VALCAUSA,' + CR_LF +
      '  SUM(VALORRECL * NVL(PERCORIG,0) / 100) AS VALORIG,' + CR_LF +
      '  SUM(VALORRECL * NVL(PERCORIG,0) / 100 * NVL(PERCPROB,0) / 100) AS VALATUAL,' + CR_LF +
      '  SUM(VALORSENTENCA) AS VALREAL' + CR_LF +
      'FROM   OBJPROCTRAB' + CR_LF +
      'WHERE (NUMPROCTRAB = ' + FloatToStr(NumProcTrab) + ')');

   ValCausa := _CdsAux.FieldByName('VALCAUSA').asFloat;
   ValOrig := _CdsAux.FieldByName('VALORIG').asFloat;
   ValAtual := _CdsAux.FieldByName('VALATUAL').asFloat;
   ValReal := _CdsAux.FieldByName('VALREAL').asFloat;

   _CdsAux.Free;
End;

Function TCtrlEtapaProcesso.UsuarioComAgenda(IdUsuario: double): boolean;
Begin
   _Cds.Data := GetDataPacket(
      'SELECT' + CR_LF +
      '  EP.NUMPROCTRAB, EP.NUMSEQ ' + CR_LF +
      'FROM' + CR_LF +
      '  ETAPAPROCTRAB EP, PROCESSOTRAB PT' + CR_LF +
      'WHERE' + CR_LF +
      '  (PT.IDADVOGCASA   = ' + FloatToStr(IdUsuario) + ') AND' + CR_LF +
      '  (PT.NUMPROCTRAB   = EP.NUMPROCTRAB) AND' + CR_LF +
      '  (EP.DATAREALOCOR >= SYSDATE)');

   Result := Not (_Cds.IsEmpty);
End;

Function TCtrlEtapaProcesso.GerarHonorario(DataPag: TDate): boolean;
Var
   _CdsAux: TCMClientDataSet;
Begin
   _CdsAux := TCMClientDataSet.Create(Nil);
   Try
      _CdsAux.Data := FCtrlHonorarioProcesso.ListHonorario(
         FCdsProcesso.FieldByName('NUMPROCTRAB').asFloat,
         FCdsProcesso.FieldByName('IDADVOGRECDA').asFloat, DataPag);
      If (_CdsAux.IsEmpty) Then
         Begin
            If (FCdsHonorarios.Locate('NUMSEQ', FCdsEtapas.FieldByName('NUMSEQ').asInteger, [])) Then
               FCdsHonorarios.Edit
            Else
               FCdsHonorarios.Insert;

            FCdsHonorarios.FieldByName('NUMSEQ').asInteger := FCdsEtapas.FieldByName('NUMSEQ').asInteger;
            FCdsHonorarios.FieldByName('NUMPROCTRAB').asFloat := FCdsProcesso.FieldByName('NUMPROCTRAB').asFloat;
            FCdsHonorarios.FieldByName('DATAPAGTOHONOR').asDateTime := DataPag;
            FCdsHonorarios.FieldByName('IDFORNSERV').asFloat := FCdsProcesso.FieldByName('IDADVOGRECDA').asFloat;
            FCdsHonorarios.FieldByName('VALORHONOR').asFloat := FCdsEtapas.FieldByName('VALORHONOR').asFloat;
            FCdsHonorarios.Post;
         End;
      Result := true;
   Except
      On E: Exception Do
         Begin
            MessageInfo := E.Message;
            Result := false;
         End;
   End;
   FreeAndNil(_CdsAux);
End;

Procedure TCtrlEtapaProcesso.OnApplyCdsRecord(aCds: TClientDataSet;
   Const sTableName: String; CdsState: TUpdateStatus; Var Accept: boolean);
Begin
   Inherited;
   If (Accept) And (sTableName = 'IMAGENS') And (CdsState = usDeleted) Then
      Begin
         ExecSQL(
            'UPDATE ETAPAPROCTRAB SET IDIMAGEM=NULL' + CR_LF +
            'WHERE (NUMPROCTRAB = ' + FCdsProcesso.FieldByName('NUMPROCTRAB').asString + ') AND' + CR_LF +
            '      (NUMSEQ      = ' + aCds.FieldByName('NUMSEQ').asString + ')');

         FCdsEtapas.Locate('NUMSEQ', aCds.FieldByName('NUMSEQ').asString, []);
         FCdsEtapas.Edit;
         FCdsEtapas.FieldByName('IDIMAGEM').Clear;
         FCdsEtapas.Post;
      End;
End;

Procedure TCtrlEtapaProcesso.AfterApplyCdsRecord(aCds: TClientDataSet;
   Const sTableName: String; CdsState: TUpdateStatus; Accept: boolean);
Begin
   Inherited;
   If (Accept) And (sTableName = 'IMAGENS') And (CdsState = usInserted) Then
      Begin
         FCdsEtapas.Locate('IDIMAGEM', aCds.FieldByName('IDIMAGEM').asString, []);
         FCdsEtapas.Edit;
         FCdsEtapas.FieldByName('IDIMAGEM').asFloat := FDbImagens.IdImagem.asFloat;
         FCdsEtapas.Post;
      End;
End;

Function TCtrlEtapaProcesso.GravarEtapaProcesso(GravarImagens, GravarHonorarios: boolean;
   IdBemAntes, IdConjuntoAntes: double): boolean;
Begin
   If (ConnectionSide = cnsClient) Then
      Begin
         Result := Connection.AppServer.GravarEtapaProcesso(FUsuXFilial, FUsuXCCusto,
            FIdUsuarioGeral, GravarImagens, GravarHonorarios, FCdsProcesso.Data,
            FCdsEtapas.Data, FCdsImagens.Data, FCdsHonorarios.Data, FCdsImovel.Data,
            FCdsEventoImovel.Data);
         If Not (Result) Then
            MessageInfo := Connection.AppServer.MessageInfo;
      End
   Else
      Begin
         FCdsEtapas.DisableControls;
         Try
            StartTransaction;

            Result := ApplyCds(FCdsProcesso, FDbProcesso, [], []);
            If Not (Result) Then
               Raise Exception.Create(FDbProcesso.MessageInfo);

            If (GravarImagens) Then
               Begin
                  Result := ApplyCds(FCdsImagens, FDbImagens, [], []);
                  If Not (Result) Then
                     Raise Exception.Create(FDbImagens.MessageInfo);
               End;

            Result := ApplyCds(FCdsEtapas, FDbEtapas,
               [FDbProcesso.NumProcTrab], [FDbEtapas.NumProcTrab]);
            If Not (Result) Then
               Raise Exception.Create(FDbEtapas.MessageInfo);

            If (GravarHonorarios) Then
               Begin
                  Result := ApplyCds(FCdsHonorarios, FDbHonorarios, [], []);
                  If Not (Result) Then
                     Raise Exception.Create(FDbHonorarios.MessageInfo);
               End;

            // Gravar Imóvel
            Result := ApplyCds(FCdsImovel, FDbImovel, [], []);
            If Not (Result) Then
               Raise Exception.Create(FDbImovel.MessageInfo);

            // Gravar Evento Imóvel
            Result := ApplyCds(FCdsEventoImovel, FDbEventoImovel, [], []);
            If Not (Result) Then
               Raise Exception.Create(FDbEventoImovel.MessageInfo);

            // Gravar Bem
            AtualizarCAF(IdBemAntes, IdConjuntoAntes);
            //
            Commit;
         Except
            On E: Exception Do
               Begin
                  Rollback;
                  Result := false;
                  MessageInfo := E.Message;
               End;
         End;
         FCdsEtapas.EnableControls;
      End;
End;

Procedure TCtrlEtapaProcesso.GetDiferencaValorIntegra(Var ValEtapa, ValHonor: double);
Var
   c: byte;
Begin
   ValEtapa := FCdsEtapas.FieldByName('VALORCUSTAS').asFloat;
   ValHonor := FCdsEtapas.FieldByName('VALORHONOR').asFloat;
   If (FValorTotal_Original > 0) Then
      For c := 1 To FNumEtapas_Original Do
         If (FCdsEtapas.FieldByName('NUMSEQ').asInteger = FCodEtapas_Original[c]) Then
            Begin
               ValEtapa := ValEtapa - FValorEtapas_Original[c];
               ValHonor := ValHonor - FValorHonorarios_Original[c];
               break;
            End;
End;

Procedure TCtrlEtapaProcesso.AtualizarTotalDespesas(ValorDespesa: double);
Begin
   FCdsProcesso.FieldByName('DESPESAPROC').asFloat :=
      FCdsProcesso.FieldByName('DESPESAPROC').asFloat + ValorDespesa;
End;

Function TCtrlEtapaProcesso.GerarIntegracao(FazCAP, FazContab: boolean; DataEmissao,
   DataPagamento: TDateTime; IdFavorecido, IdPlanoPrev, IdPatro: integer; PlaConta: String;
   Plano: integer; PlaContaCredito, TipoOperacao, CodTipRecDes, CodCentroRespon, CodCentroCusto: String;
   CodTipDoc, CodPortadorForma, IdPrograma: integer;
   ValorDif, ValorLev, ValorAlt: double; CodAlterador: integer; ValorMulta: double): boolean;
Var
   c: byte;
   dValDepois: Array[1..2] Of double; // 1º -> Valor da Etapa, 2º -> Valor do Honorário
Begin
   If (ConnectionSide = cnsClient) Then
      Begin
         Result := Connection.AppServer.GerarIntegracao(
            FIdModulo, FIdUsuario, FIdEmpresa, FUsaPlanoPatro, FUsuXFilial, FUsuXCCusto,
            FIdUsuarioGeral, FazCAP, FazContab, DataEmissao, DataPagamento, IdFavorecido,
            IdPlanoPrev, IdPatro, Plano, PlaConta, PlaContaCredito, TipoOperacao,
            CodTipRecDes, CodTipDoc, FIdEspAcesso, FObrigaAbc, FObrigaCRespon,
            FPlanoPrevGlobal, FPatroGlobal, FCdsProcesso.Data, FCdsEtapas.Data,
            FNumEtapas_Original, FCodEtapas_Original, FValorEtapas_Original,
            FValorHonorarios_Original, FValorTotal_Original);
         MessageInfo := Connection.AppServer.MessageInfo;
      End
   Else
      Begin
         Result := true;

         FCodTipRecDes := CodTipRecDes;
         FListaNumDocCAP := '';
         FListaPlnCodigo := '';
         FCodAlterador := CodAlterador;
         FValorAlt := ValorAlt;
         FCodPortadorForma := CodPortadorForma;
         FCodCentroCusto := CodCentroCusto;
         FCodCentroRespon := CodCentroRespon;
         FIdPrograma := IdPrograma;

         FDataEmissao := DataEmissao;
         Try
            If (FazCAP) Then
               Begin
                  FCdsDocumentos := TCMClientDataSet.Create(Nil);

                  FCtrlIntegraRH.CdsDocumentos := FCdsDocumentos;
                  FCtrlIntegraRH.ObrigaAbc := FObrigaAbc;
                  FCtrlIntegraRH.ObrigaCRespon := FObrigaCRespon;
                  FCtrlIntegraRH.IdEmpresa := FIdEmpresa;
                  FCtrlIntegraRH.IdModulo := FIdModulo;
                  FCtrlIntegraRH.IdUsuario := FIdUsuario;
                  FCtrlIntegraRH.CodTipDoc := CodTipDoc;

                  If Not (FCtrlIntegraRH.AbrirQueryDocumentos) Then
                     Raise Exception.Create(FCtrlIntegraRH.MessageInfo);
               End;

            FCdsEtapas.DisableControls;
            If ValorMulta = 0 Then // a multa é sempre da etapa atual
               FCdsEtapas.First;
            Try
               //             StartTransaction;

               While Not (FCdsEtapas.EOF) Do
                  Begin
                     If ValorDif > 0 Then
                        Begin
                           // Calcular o Valor a integrar pela diferença (ValorDif) entre
                           // Depósitos + Penhoras de Numerário - Levantamentos - Convolações.
                           dValDepois[1] := ValorDif;
                           dValDepois[2] := 0;
                        End
                     Else If ValorLev > 0 Then
                        Begin
                           // Calcular o Valor a integrar pela diferença (ValorLev) entre
                           // Levantamentos (Depois - Antes).
                           dValDepois[1] := ValorLev;
                           dValDepois[2] := 0;
                        End
                     Else If ValorMulta > 0 Then
                        Begin
                           // Calcular o Valor a integrar pela diferença (ValorLev) entre
                           // Levantamentos (Depois - Antes).
                           dValDepois[1] := ValorMulta;
                           dValDepois[2] := 0;
                        End
                     Else
                        // Calcular o Valor a integrar pela diferença entre o Valor da Etapa e Honorário
                        // antes de ser gravado pelo Valor atual (mudado pelo usuário).
                        GetDiferencaValorIntegra(dValDepois[1], dValDepois[2]);

                     If ((FazCAP) And (dValDepois[1] + dValDepois[2] > 0)) Or
                        ((FazContab) And (dValDepois[1] + dValDepois[2] <> 0)) Then
                        Begin
                           For c := 1 To 2 Do
                              Begin
                                 Case (c) Of
                                    1: // Etapas
                                       Begin
                                          FIdFavorecido := IdFavorecido;
                                          If ValorDif > 0 Then
                                             FDescricaoLancamento := 'Variação (Depósitos + Penhoras de Numerário + Penhoras de Investimento)' +
                                                ' do Processo Nº Interno: ' +
                                                FCdsEtapas.FieldByName('NUMPROCTRAB').asString +
                                                ' Número 1ª Inst.: ' +
                                                FCdsProcesso.FieldByName('PROCJCJNUM').asString
                                          Else If ValorLev > 0 Then
                                             FDescricaoLancamento := 'Levantamento de Depósitos e/ou Penhoras de Numerário' +
                                                ' do Processo Nº Interno: ' +
                                                FCdsEtapas.FieldByName('NUMPROCTRAB').asString +
                                                ' Número 1ª Inst.: ' +
                                                FCdsProcesso.FieldByName('PROCJCJNUM').asString
                                          Else If ValorMulta > 0 Then
                                             FDescricaoLancamento := 'Multa Ref. a Etapa Nº ' +
                                                FCdsEtapas.FieldByName('NUMSEQ').asString + ' (' +
                                                Copy(Trim(FCdsEtapas.FieldByName('ETAPA').asString), 1, 40) + ') do Processo Nº Interno ' +
                                                FCdsEtapas.FieldByName('NUMPROCTRAB').asString +
                                                ' Número 1ª Inst.: ' +
                                                FCdsProcesso.FieldByName('PROCJCJNUM').asString
                                          Else
                                             FDescricaoLancamento := Copy(Trim(FCdsEtapas.FieldByName('ETAPA').asString), 1, 40);
                                       End;
                                    2: // Honorários
                                       Begin
                                          FIdFavorecido := FCdsProcesso.FieldByName('IDADVOGRECDA').asInteger;
                                          FDescricaoLancamento := Copy('Honorários Relativos ao Processo ' +
                                             FCdsProcesso.FieldByName('PROCJCJNUM').asString, 1, 40);
                                       End;
                                 End;

                                 If (FIdFavorecido <= 0) Then
                                    continue;

                                 If (FazCAP) And (dValDepois[c] > 0) And (ValorLev = 0) Then
                                    If Not (GerarIntegracaoCAP(dValDepois[c], DataPagamento)) Then
                                       Raise Exception.Create(MessageInfo);

                                 If (ValorLev > 0) Then
                                    If Not (GerarIntegracaoCAR(dValDepois[c], DataPagamento)) Then
                                       Raise Exception.Create(MessageInfo);

                                 If (FazContab) And (dValDepois[c] <> 0) Then
                                    If Not (GerarIntegracaoContabil(dValDepois[c], IdPlanoPrev,
                                       IdPatro, PlaConta, Plano, PlaContaCredito, TipoOperacao,
                                       FDescricaoLancamento)) Then
                                       Begin
                                          Raise Exception.Create(MessageInfo);
                                       End;

                                 If (ValorDif > 0) Or (ValorLev > 0) Or (ValorMulta > 0) Then
                                    break; // para estas condições, só faz uma vez (C =1)
                              End;
                        End;
                     If (ValorDif > 0) Or (ValorLev > 0) Or (ValorMulta > 0) Then
                        break; // para estas condições, só faz uma vez. (1 ETAPA)

                     FCdsEtapas.Next;
                  End;

               //             Commit;

                              // Criação das mensagens de término do processo de integração
               If (FazCAP) And (ValorLev = 0) Then
                  Begin
                     If (FListaNumDocCAP <> '') Then
                        MessageInfo :=
                           'Contas a Pagar gerada com sucesso.' + CR_LF +
                           'Documento(s) Nº.: ' + FListaNumDocCAP
                     Else
                        MessageInfo :=
                           'Contas a Pagar não foi feita.';
                  End;

               If (ValorLev > 0) Then
                  Begin
                     If (FListaNumDocCAP <> '') Then
                        MessageInfo :=
                           'Contas a Receber gerada com sucesso.' + CR_LF +
                           'Documento(s) Nº.: ' + FListaNumDocCAP
                     Else
                        MessageInfo :=
                           'Contas a Receber não foi feita.';
                  End;

               If (FazContab) Then
                  Begin
                     If (MessageInfo <> '') Then
                        MessageInfo := MessageInfo + CR_LF + CR_LF;

                     If (FListaPlnCodigo <> '') Then
                        MessageInfo := MessageInfo +
                           'Contabilização gerada com sucesso.' + CR_LF +
                           'Planilha(s) Nº.: ' + FListaPlnCodigo
                     Else
                        MessageInfo := MessageInfo +
                           'Contabilidade não foi feita.';
                  End;
            Except
               On E: Exception Do
                  Begin
                     Rollback;
                     Result := false;
                     MessageInfo := E.Message;
                  End;
            End;

            If ValorMulta = 0 Then // a multa é sempre da etapa atual
               FCdsEtapas.First;
            FCdsEtapas.EnableControls;

            If (FazCAP) Then
               FCdsDocumentos.Free;
         Except
            On E: Exception Do
               Begin
                  Result := false;
                  MessageInfo := E.Message;
               End;
         End;

         // A nova situação passa a ser a "anterior", caso o usuário faça nova atualização
         IniciarValoresContabeis;
      End;
End;

Function TCtrlEtapaProcesso.GerarIntegracaoRateioDespesas(FazCAP, FazContab: boolean; DataEmissao,
   DataPagamento: TDate; IdFavorecido, IdPlanoPrev, IdPatro: integer; PlaConta: String;
   Plano: integer; PlaContaCredito, TipoOperacao, CodTipRecDes: String; CodTipDoc: integer;
   DescricaoLancamento: String; Valor: double): boolean;
Begin
   If (ConnectionSide = cnsClient) Then
      Begin
         Result := Connection.AppServer.GerarIntegracao(FazCAP, FazContab, DataEmissao,
            DataPagamento, IdFavorecido, IdPlanoPrev, IdPatro, PlaConta, Plano, PlaContaCredito,
            TipoOperacao, CodTipRecDes, CodTipDoc, DescricaoLancamento);
         If Not (Result) Then
            MessageInfo := Connection.AppServer.MessageInfo;
      End
   Else
      Begin
         Result := true;
         FCodTipRecDes := CodTipRecDes;
         FListaNumDocCAP := '';
         FListaPlnCodigo := '';

         Try
            If (FazCAP) Then
               Begin
                  FCdsDocumentos := TCMClientDataSet.Create(Nil);

                  FDataEmissao := DataEmissao;

                  FCtrlIntegraRH.CdsDocumentos := FCdsDocumentos;
                  FCtrlIntegraRH.ObrigaAbc := FObrigaAbc;
                  FCtrlIntegraRH.ObrigaCRespon := FObrigaCRespon;
                  FCtrlIntegraRH.IdEmpresa := FIdEmpresa;
                  FCtrlIntegraRH.IdModulo := FIdModulo;
                  FCtrlIntegraRH.IdUsuario := FIdUsuario;
                  FCtrlIntegraRH.CodTipDoc := CodTipDoc;

                  If Not (FCtrlIntegraRH.AbrirQueryDocumentos) Then
                     Raise Exception.Create(FCtrlIntegraRH.MessageInfo);
               End;

            Try
               StartTransaction;

               If ((FazCAP) And (Valor > 0)) Or
                  ((FazContab) And (Valor <> 0)) Then
                  Begin
                     FIdFavorecido := IdFavorecido;
                     If (FazCAP) And (Valor > 0) Then
                        If Not (GerarIntegracaoCAP(Valor, DataPagamento)) Then
                           Raise Exception.Create(MessageInfo);

                     If (FazContab) And (Valor <> 0) Then
                        If Not (GerarIntegracaoContabil(Valor, IdPlanoPrev,
                           IdPatro, PlaConta, Plano, PlaContaCredito, TipoOperacao,
                           DescricaoLancamento)) Then
                           Begin
                              Raise Exception.Create(MessageInfo);
                           End;
                  End;

               Commit;

               // Criação das mensagens de término do processo de integração
               If (FazCAP) Then
                  Begin
                     If (FListaNumDocCAP <> '') Then
                        MessageInfo :=
                           'Contas a Pagar gerada com sucesso.' + CR_LF +
                           'Documento(s) Nº.: ' + FListaNumDocCAP
                     Else
                        MessageInfo :=
                           'Contas a Pagar não foi feita.';
                  End;

               If (FazContab) Then
                  Begin
                     If (MessageInfo <> '') Then
                        MessageInfo := MessageInfo + CR_LF + CR_LF;

                     If (FListaPlnCodigo <> '') Then
                        MessageInfo := MessageInfo +
                           'Contabilização gerada com sucesso.' + CR_LF +
                           'Planilha(s) Nº.: ' + FListaPlnCodigo
                     Else
                        MessageInfo := MessageInfo +
                           'Contabilidade não foi feita.';
                  End;
            Except
               On E: Exception Do
                  Begin
                     Rollback;
                     Result := false;
                     MessageInfo := E.Message;
                  End;
            End;

            If (FazCAP) Then
               FCdsDocumentos.Free;
         Except
            On E: Exception Do
               Begin
                  Result := false;
                  MessageInfo := E.Message;
               End;
         End;
      End;
End;

Function TCtrlEtapaProcesso.GerarIntegracaoCAP(Valor: double; DataPag: TDate): boolean;
Var
   bErro: boolean;
Begin
   Try
      FCtrlIntegraRH.CodForma := FCodPortadorForma;
      FCtrlIntegraRH.CodCentroCusto := FCodCentroCusto;
      FCtrlIntegraRH.CodCentroRespon := FCodCentroRespon;
      FCtrlIntegraRH.IdPrograma := FIdPrograma;
      FCtrlIntegraRH.Observacao := FDescricaoLancamento;
      bErro := Not GerarCAP(Valor);
      If Not (bErro) Then
         Begin
            // Gravar no Banco os Documentos
            If Not (FCtrlIntegraRH.GravarDocumentos(
               False, FPlnCodigo, FPortadorFormaPadrao, FDataEmissao, DataPag, True,
               FUsaPlanoPatro, FPlanoPrev, FPatro, FPlano, '')) Then
               Begin
                  Raise Exception.Create(FCtrlIntegraRH.MessageInfo);
               End;

            FCdsDocumentos.EmptyDataSet;
         End;
   Except
      On E: Exception Do
         Begin
            MessageInfo := E.Message;
            bErro := true;
         End;
   End;

   If (bErro) Then
      MessageInfo := 'Contas a Pagar Não Efetuada.' + CR_LF + CR_LF + MessageInfo
   Else
      Begin
         If (FListaNumDocCAP = '') Then
            FListaNumDocCAP := FCtrlIntegraRH.NumDocGerados
         Else
            FListaNumDocCAP := FListaNumDocCAP + ',' + FCtrlIntegraRH.NumDocGerados;
      End;

   Result := Not (bErro);
End;

Function TCtrlEtapaProcesso.GerarCAP(Valor: double): boolean;
Begin
   Try
      If Not (FCtrlIntegraRH.SetDadosDocumento(
         -1,
         -1,
         FPlano,
         -1,
         FPortadorFormaPadrao,
         FIdFavorecido,
         '',
         IFF(FCodCentroRespon = '', CODCENTRORESPON_PADRAO, FCodCentroRespon),
         FCodTipRecDes,
         'P',
         'D',
         Valor,
         0,
         FCodCentroCusto,
         0,
         0,
         0,
         FPatro,
         FPlanoPrev)) Then
         Begin
            Raise Exception.Create(FCtrlIntegraRH.MessageInfo);
         End;

      Result := true;
   Except
      On E: Exception Do
         Begin
            MessageInfo := E.Message;
            Result := false;
         End;
   End;
End;

Function TCtrlEtapaProcesso.GerarIntegracaoCAR(Valor: double; DataPag: TDate): boolean;
Var
   bErro: boolean;
Begin
   Try
      bErro := Not (GerarCAR(Valor));
      If Not (bErro) Then
         Begin
            // Gravar no Banco os Documentos
            If Not (FCtrlIntegraRH.GravarDocumentos(
               false, FPlnCodigo, FPortadorFormaPadrao, FDataEmissao, DataPag, True,
               FUsaPlanoPatro, FPlanoPrev, FPatro, FPlano, '')) Then
               Begin
                  Raise Exception.Create(FCtrlIntegraRH.MessageInfo);
               End;

            FCdsDocumentos.EmptyDataSet;
         End;
   Except
      On E: Exception Do
         Begin
            MessageInfo := E.Message;
            bErro := true;
         End;
   End;

   If (bErro) Then
      MessageInfo := 'Contas a Receber Não Efetuada.' + CR_LF + CR_LF + MessageInfo
   Else
      Begin
         If (FListaNumDocCAP = '') Then
            FListaNumDocCAP := FCtrlIntegraRH.NumDocGerados
         Else
            FListaNumDocCAP := FListaNumDocCAP + ',' + FCtrlIntegraRH.NumDocGerados;
      End;

   Result := Not (bErro);
End;

Function TCtrlEtapaProcesso.GerarCAR(Valor: double): boolean;
Begin
   Try
      If Not (FCtrlIntegraRH.SetDadosDocumento(
         -1,
         -1,
         FPlano,
         -1,
         FPortadorFormaPadrao,
         FIdFavorecido,
         '',
         IFF(FCodCentroRespon = '', CODCENTRORESPON_PADRAO, FCodCentroRespon),
         FCodTipRecDes,
         'R',
         'C',
         Valor,
         0,
         FCodCentroCusto,
         0,
         0,
         0,
         FPatro,
         FPlanoPrev)) Then
         Begin
            Raise Exception.Create(FCtrlIntegraRH.MessageInfo);
         End;

      Result := true;
   Except
      On E: Exception Do
         Begin
            MessageInfo := E.Message;
            Result := false;
         End;
   End;
End;

Function TCtrlEtapaProcesso.GerarIntegracaoContabil(Valor: double; IdPlanoPrev, IdPatro: integer;
   PlaConta: String; Plano: integer; PlaContaCredito, TipoOperacao, DescricaoLancamento: String): boolean;
Var
   _CdsAux: TCmClientDataSet;
   bErro: boolean;
   IdPlano, dCodSubConta: double;
   sNumPlanilha, sDataEmissao, sContaDebito, sContaCredito: String;
Begin
   Result := false;
   Try
      _CdsAux := TCmClientDataSet.Create(Nil);

      bErro := false;
      FUsaPlanoPatro := True;
      Try
         // Implementar Lançamento na Contabilidade
         dCodSubConta := 0;
         _CdsAux.Data := FCtrlListTerceirosRH.ListEmpresaForn(FIdEmpresa, FIdFavorecido);

         If (_CdsAux.FieldByName('CONTACDESPESA').asString = '') Then
            Begin
               sContaDebito := PlaConta;
               IdPlano := Plano;
            End
         Else
            Begin
               sContaDebito := _CdsAux.FieldByName('CONTACDESPESA').asString;
               IdPlano := _CdsAux.FieldByName('PLANO').asInteger;
               dCodSubConta := _CdsAux.FieldByName('CODSUBCONTA').asFloat;
            End;

         sContaCredito := PlaContaCredito;
         If (sContaCredito = '') Then
            sContaCredito := _CdsAux.FieldByName('CONTACFORN').asString;

         // Gravar o Lançamento na Contabilidade
         If (sContaDebito <> '') And (sContaCredito <> '') Then
            Begin
               sDataEmissao := DateToStr(FDataEmissao);
               If (FCtrlLancamento.InsereLancaContab(
                  '2', // Tipo do Lançamento (0 - Débito; 1 - Crédito; 2 - Partida Dobrada)
                  FIdEmpresa, // Empresa
                  FIdModulo, // Módulo de Origem
                  FIdUsuario, // Usuário Ativo
                  IdPlano, // Plano de Contas
                  -1, // Unidade de Negócio
                  dCodSubConta, // Sub-Conta de Debito
                  dCodSubConta, // Sub-Conta de Crédito
                  IdPlanoPrev, // ID do Plano Previdenciário
                  IdPatro, // ID da Patrocinadora
                  FPlnCodigo, // Número da Planilha
                  0, // Número do Lançamento
                  sDataEmissao, // Data do Lançamento
                  Copy(sDataEmissao, 7, 4) + Copy(sDataEmissao, 3, 3), // Número do Documento
                  DescricaoLancamento, // 1ª Linha da Histórico
                  '', // 2ª Linha da Histórico
                  Copy(sDataEmissao, 7, 4) + Copy(sDataEmissao, 3, 3), // 3ª Linha da Histórico
                  '', // 4ª Linha da Histórico
                  '', // 5ª Linha da Histórico
                  TipoOperacao, // Tipo de Operação Indicado
                  FCodCentroCusto, // Centro de Custo para Débito
                  sContaDebito, // Conta para Débito
                  FCodCentroCusto, // Centro de Custo para Crédito
                  sContaCredito, // Conta para Crédito
                  '', // Código do Histórico Padrão
                  Valor, // Valor a ser Lançado
                  True, // Indica se os Lançamentos devem ser unidos em uma mesma Planilha
                  FUsaPlanoPatro // Indica se usa Plano da Patrocinadora
                  )) Then
                  FPlnCodigo := FCtrlLancamento.RetornoPlnCodigo
               Else
                  Raise Exception.Create(FCtrlLancamento.MessageInfo);
            End;
      Except
         On E: Exception Do
            Begin
               MessageInfo := E.Message;
               bErro := true;
            End;
      End;

      If (bErro) Then
         MessageInfo := 'Contabilização Não Efetuada.' + CR_LF + CR_LF + MessageInfo
      Else
         If (FPlnCodigo > 0) Then
            Begin
               sNumPlanilha := FloatToStr(FCtrlListTerceirosRH.GetNumeroPlanilha(FPlnCodigo));
               If (FListaPlnCodigo = '') Then
                  FListaPlnCodigo := sNumPlanilha;
            End
         Else
            FListaPlnCodigo := FListaPlnCodigo + ',' + sNumPlanilha;

      Result := Not (bErro);
   Finally
      FreeAndNil(_CdsAux);
   End;
End;

Procedure TCtrlEtapaProcesso.IniciarIntegracao(IdEmpresa, IdModulo, IdUsuario,
   IdEspAcesso: integer; UsaPlanoPatro, ObrigaAbc, ObrigaCRespon: boolean; PlanoPrevGlobal,
   PatroGlobal: integer);
Begin
   FIdEmpresa := IdEmpresa;
   FIdModulo := IdModulo;
   FIdUsuario := IdUsuario;
   FIdEspAcesso := IdEspAcesso;
   FPortadorFormaPadrao := FCtrlBancoPortFolha.GetCodPortFormaPadrao;
   FUsaPlanoPatro := UsaPlanoPatro;
   FObrigaAbc := ObrigaAbc;
   FObrigaCRespon := ObrigaCRespon;
   FPlanoPrevGlobal := PlanoPrevGlobal;
   FPatroGlobal := PatroGlobal;
End;

Procedure TCtrlEtapaProcesso.IniciarValoresContabeis;
Var
   c: integer;
Begin
   FCdsEtapas.DisableControls;
   FCdsEtapas.First;

   FNumEtapas_Original := FCdsEtapas.RecordCount;
   FCodEtapas_Original := VarArrayCreate([1, FNumEtapas_Original], varInteger);
   FValorEtapas_Original := VarArrayCreate([1, FNumEtapas_Original], varDouble);
   FValorHonorarios_Original := VarArrayCreate([1, FNumEtapas_Original], varDouble);
   FValorTotal_Original := 0;
   c := 0;
   While Not (FCdsEtapas.EOF) Do
      Begin
         Inc(c);
         FCodEtapas_Original[c] := FCdsEtapas.FieldByName('NUMSEQ').asInteger;
         FValorEtapas_Original[c] := FCdsEtapas.FieldByName('VALORCUSTAS').asFloat;
         FValorHonorarios_Original[c] := FCdsEtapas.FieldByName('VALORHONOR').asFloat;
         FValorTotal_Original := FValorTotal_Original + FValorEtapas_Original[c] + FValorHonorarios_Original[c];
         FCdsEtapas.Next;
      End;
   FCdsEtapas.First;
   FCdsEtapas.EnableControls;
End;

Function TCtrlEtapaProcesso.AtualizarObjetos(NumProcTrab: double): boolean;
Begin
   Result := ExecSQL(
      'UPDATE OBJPROCTRAB SET PERCPROB = 100' + CR_LF +
      'WHERE (NUMPROCTRAB = ' + FloatToStr(NumProcTrab) + ')' + CR_LF +
      'AND   (NVL(PERCPROB, 0) > 0)');
End;

Function TCtrlEtapaProcesso.AtualizarCAF(IdBemAntes, IdConjuntoAntes: double): boolean;
Var
   _CdsAux: TCmClientDataSet;
   bInicio: boolean;
   bmMarca: TBookMark;
   dIdBem, dIdConjunto, dValor: double;
Begin
   _CdsAux := TCmClientDataSet.Create(Nil);

   FCdsEtapas.First;
   While Not FCdsEtapas.Eof Do
      Begin
         dIdBem := 0;
         If (FCdsEtapas.FieldByName('IDBEM').asFloat > 0) Then
            Begin
               dValor := 0;
               dIdBem := FCdsEtapas.FieldByName('IDBEM').asFloat;

               _CdsAux.Data := GetDataPacket(
                  'SELECT' + CR_LF +
                  '  SUM(VALORREC) AS VALOR' + CR_LF +
                  'FROM' + CR_LF +
                  '  ETAPAPROCTRAB' + CR_LF +
                  'WHERE' + CR_LF +
                  '  (NUMPROCTRAB <> ' + FCdsProcesso.FieldByName('NUMPROCTRAB').asString + ') AND' + CR_LF +
                  IFF(IdBemAntes = 0, '', '(IDBEM    <> ' + FloatToStr(IdBemAntes) + ') AND' + CR_LF) +
                  '  (IDBEM    = ' + FloatToStr(dIdBem) + ')');

               bmMarca := FCdsEtapas.GetBookmark;
               FCdsEtapas.First;
               While Not FCdsEtapas.Eof Do
                  Begin
                     If (FCdsEtapas.FieldByName('IDBEM').asFloat = dIdBem) And
                        (FCdsEtapas.FieldByName('IDBEM').asFloat <> IdBemAntes) Then
                        dValor := dValor + FCdsEtapas.FieldByName('VALORREC').asFloat;
                     FCdsEtapas.Next;
                  End;
               FCdsEtapas.GotoBookmark(bmMarca);
               FCdsEtapas.FreeBookmark(bmMarca);
            End;

         If dIdBem > 0 Then
            Begin
               bInicio := _CdsAux.FieldByName('VALOR').asFloat + dValor > 0;
               ExecSQL(
                  'UPDATE BEM SET FLGPENHORA = ' + IFF(bInicio, '1', '0') + CR_LF +
                  'WHERE (IDBEM = ' + FloatToStr(dIdBem) + ')');
            End;

         FCdsEtapas.Next;
      End;

   If (IdBemAntes > 0) Then
      Begin
         dValor := 0;

         _CdsAux.Data := GetDataPacket(
            'SELECT' + CR_LF +
            '  SUM(VALORREC) AS VALOR' + CR_LF +
            'FROM' + CR_LF +
            '  ETAPAPROCTRAB' + CR_LF +
            'WHERE' + CR_LF +
            '  (NUMPROCTRAB <> ' + FCdsProcesso.FieldByName('NUMPROCTRAB').asString + ') AND' + CR_LF +
            '  (IDBEM    = ' + FloatToStr(IdBemAntes) + ')');

         FCdsEtapas.First;
         While Not FCdsEtapas.Eof Do
            Begin
               If (FCdsEtapas.FieldByName('IDBEM').asFloat = IdBemAntes) Then
                  Begin
                     dValor := dValor + FCdsEtapas.FieldByName('VALORREC').asFloat;
                     FCdsEtapas.Next;
                  End;
               FCdsEtapas.Next;
            End;

         bInicio := _CdsAux.FieldByName('VALOR').asFloat + dValor > 0;
         ExecSQL(
            'UPDATE BEM SET FLGPENHORA = ' + IFF(bInicio, '1', '0') + CR_LF +
            'WHERE (IDBEM = ' + FloatToStr(IdBemAntes) + ')');
      End;

   FCdsEtapas.First;
   While Not FCdsEtapas.Eof Do
      Begin
         dIdConjunto := 0;
         If (FCdsEtapas.FieldByName('IDCONJUNTO').asFloat > 0) Then
            Begin
               dValor := 0;
               dIdConjunto := FCdsEtapas.FieldByName('IDCONJUNTO').asFloat;

               _CdsAux.Data := GetDataPacket(
                  'SELECT' + CR_LF +
                  '  SUM(VALORREC) AS VALOR' + CR_LF +
                  'FROM' + CR_LF +
                  '  ETAPAPROCTRAB' + CR_LF +
                  'WHERE' + CR_LF +
                  '  (NUMPROCTRAB <> ' + FCdsEtapas.FieldByName('NUMPROCTRAB').asString + ') AND' + CR_LF +
                  IFF(IdConjuntoAntes = 0, '', '(IDCONJUNTO    <> ' + FloatToStr(IdConjuntoAntes) + ') AND' + CR_LF) +
                  '  (IDCONJUNTO    = ' + FloatToStr(dIdConjunto) + ')');

               bmMarca := FCdsEtapas.GetBookmark;
               FCdsEtapas.First;
               While Not FCdsEtapas.Eof Do
                  Begin
                     If (FCdsEtapas.FieldByName('IDCONJUNTO').asFloat = dIdConjunto) And
                        (FCdsEtapas.FieldByName('IDCONJUNTO').asFloat <> IdConjuntoAntes) Then
                        dValor := dValor + FCdsEtapas.FieldByName('VALORREC').asFloat;
                     FCdsEtapas.Next;
                  End;
               FCdsEtapas.GotoBookmark(bmMarca);
               FCdsEtapas.FreeBookmark(bmMarca);
            End;

         If dIdConjunto > 0 Then
            Begin
               bInicio := _CdsAux.FieldByName('VALOR').asFloat + dValor > 0;
               ExecSQL(
                  'UPDATE BEM SET FLGPENHORA = ' + IFF(bInicio, '1', '0') + CR_LF +
                  'WHERE (IDCONJUNTO = ' + FloatToStr(dIdConjunto) + ')');
            End;

         FCdsEtapas.Next;
      End;

   If (IdConjuntoAntes > 0) Then
      Begin
         dValor := 0;

         _CdsAux.Data := GetDataPacket(
            'SELECT' + CR_LF +
            '  SUM(VALORREC) AS VALOR' + CR_LF +
            'FROM' + CR_LF +
            '  ETAPAPROCTRAB' + CR_LF +
            'WHERE' + CR_LF +
            '  (NUMPROCTRAB <> ' + FCdsProcesso.FieldByName('NUMPROCTRAB').asString + ') AND' + CR_LF +
            '  (IDCONJUNTO    = ' + FloatToStr(IdConjuntoAntes) + ')');

         FCdsEtapas.First;
         While Not FCdsEtapas.Eof Do
            Begin
               If (FCdsEtapas.FieldByName('IDCONJUNTO').asFloat = IdConjuntoAntes) Then
                  Begin
                     dValor := dValor + FCdsEtapas.FieldByName('VALORREC').asFloat;
                     FCdsEtapas.Next;
                  End;
               FCdsEtapas.Next;
            End;

         bInicio := _CdsAux.FieldByName('VALOR').asFloat + dValor > 0;
         ExecSQL(
            'UPDATE BEM SET FLGPENHORA = ' + IFF(bInicio, '1', '0') + CR_LF +
            'WHERE (IDCONJUNTO = ' + FloatToStr(IdConjuntoAntes) + ')');
      End;
   FCdsEtapas.First;

   FreeAndNil(_CdsAux);
End;

Function TCtrlEtapaProcesso.AtualizarImovel(IdImovel: double; Inicio: boolean): boolean;
Var
   _CdsAux: TCmClientDataSet;
   NumSeqAtual: integer;
   dValor: double;
Begin
   // SOL 161760 KTN 1379145 - Paulo Nobre
   Try
      If (Inicio) Then
         Begin
            //                  FCdsImovel.FieldByName('FLGSTATUS').asString := 'P'
            ExecSQL('UPDATE IMOVEL SET FLGSTATUS = ''P'' WHERE IDIMOVEL = ' + FloatToStr(IdImovel));
         End
      Else
         Begin
            Result := FCdsImovel.Locate('IDIMOVEL', IdImovel, []);
            If (Result) Then
               Begin
                  FCdsImovel.Edit;
                  _CdsAux := TCmClientDataSet.Create(Nil);
                  _CdsAux.Data := GetDataPacket(
                     'SELECT' + CR_LF +
                     '  SUM(VALORREC) AS VALOR' + CR_LF +
                     'FROM' + CR_LF +
                     '  ETAPAPROCTRAB' + CR_LF +
                     'WHERE' + CR_LF +
                     //          '  (NUMPROCTRAB <> '+FCdsProcesso.FieldByName('NUMPROCTRAB').asString+') AND'+CR_LF+
                     '  (IDIMOVEL    = ' + FloatToStr(IdImovel) + ')');

                  dValor := _CdsAux.FieldByName('VALOR').asFloat;
                  If FCdsEtapas.State = dsInsert Then
                     dValor := dValor + FCdsEtapas.FieldByName('VALOR').asFloat
                  Else If FCdsEtapas.State = dsBrowse Then
                     dValor := dValor - FCdsEtapas.FieldByName('VALOR').asFloat
                  Else If FCdsEtapas.State = dsEdit Then
                     Begin
                        If FCdsEtapas.FieldByName('VALOR').asFloat > 0 Then
                           dValor := dValor - FCdsEtapas.FieldByName('VALOR').asFloat
                        Else
                           dValor := dValor + FCdsEtapas.FieldByName('VALOR').asFloat;
                     End;
                  If dValor = 0 Then
                     FCdsImovel.FieldByName('FLGSTATUS').asString := 'N'
                  Else
                     FCdsImovel.FieldByName('FLGSTATUS').asString := 'P';
                  _CdsAux.Free;
               End;
            FCdsImovel.Post;
         End;
   Except
      On E: Exception Do
         Begin
            MessageInfo := E.Message;
            Result := false;
         End;
   End;
End;

Function TCtrlEtapaProcesso.InserirEventoImovel(IdImovel: double; EviData: TDate;
   Inicio: boolean; EviDescricao: String; EviPercent, EviVlrAjustado: double): boolean;
Begin
   Try
      FCdsEventoImovel.Insert;
      FCdsEventoImovel.FieldByName('IDEVENTOIMOVEL').asFloat := GetSequence('IMOVEL');
      FCdsEventoImovel.FieldByName('IDIMOVEL').asFloat := IdImovel;
      FCdsEventoImovel.FieldByName('EVIDATA').asDateTime := EviData;
      FCdsEventoImovel.FieldByName('EVIDESCRICAO').asString := EviDescricao;
      FCdsEventoImovel.FieldByName('FLGTIPOEVENTO').asString := 'PE';
      FCdsEventoImovel.FieldByName('EVIPERCENT').asFloat := EviPercent;
      FCdsEventoImovel.FieldByName('EVIVLRAJUSTADO').asFloat := EviVlrAjustado;
      If (Inicio) Then
         FCdsEventoImovel.FieldByName('EVICABECALHO').asString := 'Início de Penhora'
      Else
         FCdsEventoImovel.FieldByName('EVICABECALHO').asString := 'Término de Penhora';
      FCdsEventoImovel.Post;

      Result := true;
   Except
      On E: Exception Do
         Begin
            MessageInfo := E.Message;
            Result := false;
         End;
   End;
End;

// SOL 172573-172553  KTN 1555789-1554889 - Paulo Nobre

Function TCtrlEtapaProcesso.CalcularDataPagamento(DataPagto: TDateTime; iQtdDias: Integer): TDateTime;
Var
   iPz: Integer;
   dDtaPz: TDateTime;
Begin
   carregarCidadeEstadoPaisSistema;

   If iQtdDias > 0 Then // Tem Prazo
      Begin
         iPz := 1;
         dDtaPz := DataPagto;
         While iPz <= iQtdDias Do
            Begin
               dDtaPz := dDtaPz + 1;
               While Not diasUteis.diaUtil(dDtaPz, fundacaoCidade, fundacaoPais, fundacaoEstado, True, True, False) Do
                  dDtaPz := dDtaPz + 1; // Achar o dia útil Posterior

               iPz := iPz + 1;
            End;
      End
   Else
      Begin
         dDtaPz := DataPagto;
         While Not diasUteis.diaUtil(dDtaPz, fundacaoCidade, fundacaoPais, fundacaoEstado, True, True, False) Do
            dDtaPz := dDtaPz + 1; // Achar o dia útil Posterior
      End;

   Result := dDtaPz;
End;

// SOL 172573-172553  KTN 1555789-1554889 - Paulo Nobre

Procedure TCtrlEtapaProcesso.CarregarCidadeEstadoPaisSistema;
Var
   _CdsAux: TCMClientDataSet;
   sSql: String;
Begin
   sSql := ' SELECT ' + CR_LF;
   sSql := sSql + '   c.IDCIDADES, p.IDPAIS, e.CODESTADO ' + CR_LF;
   sSql := sSql + ' FROM ' + CR_LF;
   sSql := sSql + '   CIDADES c, ' + CR_LF;
   sSql := sSql + '   ESTADO e, ' + CR_LF;
   sSql := sSql + '   PAIS p, ' + CR_LF;
   sSql := sSql + '   ENDPESS ep ' + CR_LF;
   sSql := sSql + ' WHERE ' + CR_LF;
   sSql := sSql + '   c.IDESTADO = e.IDESTADO ' + CR_LF;
   sSql := sSql + '   AND e.IDPAIS = p.IDPAIS ' + CR_LF;
   sSql := sSql + '   AND ep.IDCIDADES = c.IDCIDADES ' + CR_LF;
   sSql := sSql + '   AND ep.IDPESSOA = 1';

   _CdsAux := TCMClientDataSet.Create(Nil);
   _CdsAux.Data := GetDataPacket(sSql);

   FFundacaoCidade := _CdsAux.Fields[0].AsInteger;
   FFundacaoPais := _CdsAux.Fields[1].AsInteger;
   FFundacaoEstado := _CdsAux.Fields[2].AsString;

   _CdsAux.Free;
End;

// SOL 174225 KTN 1572025 - Paulo Nobre
/////////////////////////////////////////////////////////////////////////////////////////////////////////
///
/////////           NOVAS FUNÇÕES PARA INTEGRAÇÃO CONTÁBIL E FINANCEIRA
//
////////////////////////////////////////////////////////////////////////////////////////////////////////

Function TCtrlEtapaProcesso.IntegrandoEtapaContabilFinanceiro(DataEmissao, DataPagamento: TDateTime;
   IdFavorecido, IdCBancaria, Plano, CodTipDoc, CodPortadorForma, IdPrograma: Integer;
   CodCentroCusto, CodCentroRespon, EtapaObservacao, PagRec, sIdDesembolsoEtapa, sPagRecCustas, sIdDesembolsoCustas, sIntegraContabil: String;
   ValorEtapa, ValorEtapaVinc, ValorCustas: double; cdsEtapaxObjetos: TCMClientDataSet): boolean;
Var bErro: boolean;
   dValorTotalEtapas, dValorTmp1, dValorTmp2, dVlrEtapaRateadaPlanos, dVlrCustasRateadaPlanos, dValorTotalDocumento, rNumDocumento: Double;
   sHistorico123, sDebCred: String;
   iQtd, IdPlanoPrevCustas, IdPatroCustas, iNumOrdem, iCodDocumento : Integer;
   CdsContasFundoADM: TCMClientDataSet;
   Qry: TwwQuery;
Begin
   CdsContasFundoADM := TCMClientDataSet.Create(Nil);

   FPlnCodigo := 0;
   Result := False;
   MessageInfo := '';
   dValorTotalEtapas := ValorEtapa + ValorEtapaVinc;
   dValorTotalDocumento := dValorTotalEtapas + ValorCustas;

   Try
      Try
         cdsEtapaxObjetos.First;

         dValorTmp1 := dValorTotalEtapas / cdsEtapaxObjetos.RecordCount; // Rateando o Valor pela quantidade de objetos
         dValorTmp2 := ValorCustas / cdsEtapaxObjetos.RecordCount; // Rateando o Valor pela quantidade de objetos
         iQtd := 1;
         dVlrEtapaRateadaPlanos := 0;
         dVlrCustasRateadaPlanos := 0;

         // Gerar o Número Sequencial do Documento
         iNumOrdem := 1;
         rNumDocumento := StrToFloat(IntToStr(IdFavorecido) + IntToStr(iNumOrdem));
         While (FCtrlDocumento.ExisteNumDoc(PagRec, IdFavorecido, Sistema.IdEmpresa, rNumDocumento, '')) Do
            Begin
               Inc(iNumOrdem);
               rNumDocumento := StrToFloat(IntToStr(IdFavorecido) + IntToStr(iNumOrdem));
            End;

         // Parâmetros da CtrlDocumento
         FctrlDocumento.OpenTransaction := False;
         FctrlDocumento.Prepare(OpDocumento, odlEfetivo, sdocAberto);
         FctrlDocumento.UsaPlanoPatro := Sistema.UsaPlanoPatro;
         FctrlDocumento.IdUsuario := Sistema.idUsuario;
         FctrlDocumento.IdEspAcesso := Sistema.idEspAcesso;
         FctrlDocumento.IdModulo := Sistema.idModulo;
         FctrlDocumento.MessageInfo := '';

         iCodDocumento := FCtrlDocumento.GetSequenceDocumento; // Gerando o PLNCODIGO

         // Varrendo os objetos associados a etapa
         cdsEtapaxObjetos.First;
         While Not cdsEtapaxObjetos.EOF Do
            Begin
               // Macete usado para evitar as diferenças de arredondamento por conta das dízimas
               If iQtd < cdsEtapaxObjetos.RecordCount Then
                  Begin
                     dVlrEtapaRateadaPlanos := dVlrEtapaRateadaPlanos + dValorTmp1;
                     dVlrCustasRateadaPlanos := dVlrCustasRateadaPlanos + dValorTmp2;
                     inc(iQtd);
                  End
               Else
                  Begin
                     dVlrEtapaRateadaPlanos := dValorTotalEtapas - dVlrEtapaRateadaPlanos; // Acha o valor do último pela diferença
                     dVlrCustasRateadaPlanos := ValorCustas - dVlrCustasRateadaPlanos; // Acha o valor do último pela diferença
                  End;

               sHistorico123 := EtapaObservacao + ' / Objeto: ' + cdsEtapaxObjetos.FieldByName('DESCRICAO').asString; // Descrição do Objeto

               // Procura pelas Contas contábeis baseada no Desembolso da Etapa (atualizando o registro "rPlaContas")
               FctrlPlacontasCapCar.GetPlacontas(
                  CodPortadorForma, // CodPortForma
                  IdFavorecido, // idforcli
                  Sistema.IdEmpresa, // idEmpresa
                  IdPrograma, // Programa
                  cdsEtapaxObjetos.FieldByName('IDPATRO').asInteger, // IdPatro
                  CodCentroCusto, // codCentroCusto
                  sIdDesembolsoEtapa, // codtiporecdes
                  PagRec, // recpag
                  opldEfetivo, // operLanctoDocCapCar
                  False, // bLancaBaixa
                  rPlaContas, // PlaContas [var]
                  True, // bIntegraContab
                  cdsEtapaxObjetos.FieldByName('IDPLANOPREV').asInteger); //  IdPlanoPrev

               If (rPlaContas.sPlaconta = '') Or (rPlaContas.iPlano <= 0) Then
                  Raise exception.Create('Conta Contábil do Desembolso da Etapa não encontrada. Verifique  !');

               If trim(FctrlPlacontasCapCar.MessageInfo) <> '' Then
                  Raise exception.Create(FctrlPlacontasCapCar.MessageInfo);

               // Contabilizando a Etapa
               If Not ContabilizaUsandoCriteriosDeRateios(
                  cdsEtapaxObjetos.FieldByName('NUMPROCTRAB').asInteger, // Processo Interno
                  cdsEtapaxObjetos.FieldByName('IDTIPOPROC').asInteger, // Programa Juridico
                  IdPrograma, // Programa Diferenciado usado no Financeiro
                  Plano, // Plano Contabil
                  0, // Plano vai ser fornececido dentro da função
                  0, // Plano vai ser fornececido dentro da função
                  iCodDocumento,
                  cdsEtapaxObjetos.FieldByName('TIPCODIGO').asString, // Sub-Programa
                  'P', // (P)rovisionar
                  datetostr(DataEmissao), // Data da Correção
                  Copy(sHistorico123, 1, 40), // 1ª Linha
                  Copy(sHistorico123, 41, 40), // 2ª Linha
                  Copy(sHistorico123, 81, 40), // 3ª Linha
                  Copy('Programa: ' + cdsEtapaxObjetos.FieldByName('NOMETIPOPROC').asString, 1, 40), // 4ª Linha
                  Copy('SubPrograma: ' + cdsEtapaxObjetos.fieldbyname('TIPDESCRICAO').asString, 1, 40), // 5ª Linha
                  dVlrEtapaRateadaPlanos, // Valor do Lançamento
                  rPlaContas.sPlaconta, // Conta para Débito
                  rPlaContas.sPlacontaPass, // Conta para Crédito
                  CodCentroCusto, // Centro Custos
                  sIdDesembolsoEtapa, // Desembolso da Etapa
                  PagRec,
                  CodCentroRespon,
                  FPlnCodigo
                  ) Then
                  Raise Exception.Create(FCtrlLancamento.MessageInfo);

               If trim(FctrlDocumento.MessageInfo) <> '' Then
                  Raise exception.Create(FctrlDocumento.MessageInfo);

               // Custas foi informada na Etapa
               If ValorCustas > 0 Then
                  Begin
                     // Plano e Patro - PGA
                     IdPlanoPrevCustas := FCtrlListTerceirosRH.GetIdPlanoPrev(Sistema.IdEmpresa);
                     IdPatroCustas := FCtrlListTerceirosRH.GetIdPatro(Sistema.IdEmpresa);

                     // Procura pelas Contas contábeis baseada no Desembolso das Custas (atualizando o registro "rPlaContas")
                     FctrlPlacontasCapCar.GetPlacontas(
                        CodPortadorForma, // CodPortForma
                        IdFavorecido, // idforcli
                        Sistema.IdEmpresa, // idEmpresa
                        IdPrograma, // idPrograma
                        cdsEtapaxObjetos.FieldByName('IDPATRO').asInteger, // IdPatro
                        CodCentroCusto, // codCentroCusto
                        sIdDesembolsoCustas, // codtiporecdes
                        sPagRecCustas, // recpag
                        opldEfetivo, // operLanctoDocCapCar
                        False, // bLancaBaixa
                        rPlaContas, // PlaContas [var]
                        True, // bIntegraContab
                        cdsEtapaxObjetos.FieldByName('IDPLANOPREV').asInteger); //  IdPlanoPrev

                     If (rPlaContas.sPlaconta = '') Or (rPlaContas.iPlano <= 0) Then
                        Raise exception.Create('Conta Contábil do Desembolso da Custas não encontrada. Verifique  !');

                     If trim(FctrlPlacontasCapCar.MessageInfo) <> '' Then
                        Raise exception.Create(FctrlPlacontasCapCar.MessageInfo);

                     // Contabilizando as Custas Judiciais
                     If Not ContabilizaUsandoCriteriosDeRateios(
                        cdsEtapaxObjetos.FieldByName('NUMPROCTRAB').asInteger, // Processo Interno
                        cdsEtapaxObjetos.FieldByName('IDTIPOPROC').asInteger, // Programa Juridico
                        IdPrograma, // IdPrograma
                        Plano, // Numero do Plano Contabil
                        IdPlanoPrevCustas, // PGA
                        IdPatroCustas, // PGA
                        iCodDocumento,
                        cdsEtapaxObjetos.FieldByName('TIPCODIGO').asString, // Sub-Programa
                        'P', // (P)rovisionar
                        datetostr(DataEmissao), // Data da Correção
                        Copy(sHistorico123, 1, 40), // 1ª Linha
                        Copy(sHistorico123, 41, 40), // 2ª Linha
                        Copy(sHistorico123, 81, 40), // 3ª Linha
                        Copy('Programa: ' + cdsEtapaxObjetos.FieldByName('NOMETIPOPROC').asString, 1, 40), // 4ª Linha
                        Copy('SubPrograma: ' + cdsEtapaxObjetos.fieldbyname('TIPDESCRICAO').asString, 1, 40), // 5ª Linha
                        dVlrCustasRateadaPlanos, // Valor do Lançamento
                        rPlaContas.sPlaconta, // Conta para Débito
                        rPlaContas.sPlacontaPass, // Conta para Crédito
                        CodCentroCusto, // Centro Custos
                        sIdDesembolsoCustas, // Desembolso das Custas
                        sPagRecCustas,
                        CodCentroRespon,
                        FPlnCodigo
                        ) Then
                        Raise Exception.Create(FCtrlLancamento.MessageInfo);

                     // Lança a Contabilização do Fundo de Gestão Administrativa somente se for PREVIDENCIAL (1) E INVESTIMENTO (3)
                     // Se for ADMINISTRATIVA não lança
                     If IdPrograma <> 4 Then // 4 é o idprograma do Programa Administrativo
                        Begin
                           // Procurando as Contas contábeis do Fundo de Participação ADM, baseada na conta de DB (CUSTAS JUDICIAIS)
                           CdsContasFundoADM.Data := LocalizaContasFundoADM(Plano, rPlaContas.sPlaconta); // Conta Débito

                           // Contabilizando o Fundo de Gestão Administrativa, somente quando das Custas
                           If Not ContabilizaUsandoCriteriosDeRateios(
                              cdsEtapaxObjetos.FieldByName('NUMPROCTRAB').asInteger, // Processo Interno
                              cdsEtapaxObjetos.FieldByName('IDTIPOPROC').asInteger, // Programa Juridico
                              IdPrograma, // IdPrograma
                              Plano, // Numero do Plano Contabil
                              0, // Plano vai ser fornececido dentro da função
                              0, // Plano vai ser fornececido dentro da função
                              iCodDocumento,
                              cdsEtapaxObjetos.FieldByName('TIPCODIGO').asString, // Sub-Programa
                              'P', // (P)rovisionar
                              datetostr(DataEmissao), // Data da Correção
                              Copy(sHistorico123, 1, 40), // 1ª Linha
                              Copy(sHistorico123, 41, 40), // 2ª Linha
                              Copy(sHistorico123, 81, 40), // 3ª Linha
                              Copy('Programa: ' + cdsEtapaxObjetos.FieldByName('NOMETIPOPROC').asString, 1, 40), // 4ª Linha
                              Copy('SubPrograma: ' + cdsEtapaxObjetos.fieldbyname('TIPDESCRICAO').asString, 1, 40), // 5ª Linha
                              dVlrCustasRateadaPlanos, // Valor do Lançamento
                              CdsContasFundoADM.Fieldbyname('SEGFDOADMDEBITO').asString, // Conta para Débito
                              CdsContasFundoADM.Fieldbyname('SEGFDOADMCREDITO').asString, // Conta para Crédito
                              CodCentroCusto, // Centro Custos
                              sIdDesembolsoCustas,
                              sPagRecCustas,
                              CodCentroRespon,
                              FPlnCodigo
                              ) Then
                              Raise Exception.Create(FCtrlLancamento.MessageInfo);
                        End;
                  End;

               cdsEtapaxObjetos.Next;
            End;

         If (FPlnCodigo > 0) Then // Sucesso na Contabilização
            Begin
               NumPlanilhaGerada := FloatToStr(FCtrlListTerceirosRH.GetNumeroPlanilha(FPlnCodigo));
               PlnCodigoGerado := FPlnCodigo;

               ////////////////  GERANDO E GRAVANDO O FINANCEIRO  ////////////////////////////////

               // Inserir Fornecedor se este não existir e for para integrar com o CAP
               If (PagRec = 'P') Then // Pagar
                  Begin
                     _Cds.Data := GetDataPacket('SELECT IDPESSOA FROM FORNSERV WHERE IDPESSOA = ' + IntToStr(IdFavorecido));
                     If (_Cds.IsEmpty) Then
                        FCtrlDocumento.ForCli.Inserir(
                           IdFavorecido, // IdPessoa
                           Sistema.IdEmpresa, // IdEmpresa
                           0, 0, 0, '', '', '', '',
                           tfcFornecedor); // TTipoForCli
                  End
               Else // Receber
                  Begin
                     _Cds.Data := GetDataPacket('SELECT IDPESSOA FROM CLIENTEPESS WHERE IDPESSOA = ' + IntToStr(IdFavorecido));
                     If (_Cds.IsEmpty) Then
                        FCtrlDocumento.ForCli.Inserir(
                           IdFavorecido, // IdPessoa
                           Sistema.IdEmpresa, // IdEmpresa
                           0, 0, 0, '', '', '', '',
                           tfcCliente); // TTipoForCli
                  End;

               sDebCred := FCtrlDocumento.GetDebCre(CodTipDoc);

               // Seta valores para a tabela DOCUMENTO
               FctrlDocumento.SetValues(
                  iCodDocumento,
                  rNumDocumento,
                  '', '',
                  PagRec,
                  '2', '', '',
                  rPlaContas.sPlaconta, // Placonta
                  CodCentroCusto,
                  '', '', '', '', '', '', '',
                  EtapaObservacao,
                  DataPagamento, // Data de Lançamento e Vencimento
                  DataEmissao, // Data de Emissão
                  DataPagamento, // Data Programada
                  0, 0, 0, 0, 0, 0, 0, 0,
                  CodTipDoc, // Tipo de Documento
                  Sistema.idEmpresa,
                  Sistema.idModulo,
                  IdFavorecido,
                  0,
                  IdCBancaria,
                  -1, // Unidade de Negócios
                  Plano,
                  0, 0, 0, 0, 0,
                  Sistema.idUsuario,
                  Sistema.idEmpresa,
                  1, 0, 0,
                  CodPortadorForma,
                  0, 0,
                  CodPortadorForma,
                  0); // Criterio de Segregação

               If trim(FctrlDocumento.MessageInfo) <> '' Then
                  Raise exception.Create(FctrlDocumento.MessageInfo);

               // Seta valores para a tabela LANCTODOCUM
               FctrlDocumento.Lanctodocum.SetValues(
                  DataPagamento,
                  iCodDocumento,
                  0,
                  dValorTotalDocumento,
                  0,
                  dValorTotalDocumento,
                  -1, // Unidade de Negócios
                  FPlnCodigo, // Plncodigo gerado pela contabilização
                  0,
                  Sistema.idUsuario,
                  Sistema.idEmpresa,
                  0, 0,
                  CodTipDoc, // Tipo de Documento ex: 51
                  0, 0,
                  '2',
                  '', '', '',
                  EtapaObservacao,
                  '', '', '',
                  sDebCred, // (D)ebito ou (C)redito
                  Sistema.idModulo,
                  Plano,
                  Sistema.UsaPlanoPatro,
                  True,
                  CodPortadorForma);

               If trim(FctrlDocumento.MessageInfo) <> '' Then
                  Raise exception.Create(FctrlDocumento.MessageInfo);

               // Inserindo definitivamente o movimento nas tabelas
               If (FCtrlDocumento.Insert) Then
                  Begin
                     FNumDocumentoGerado := FloatToSTr(rNumDocumento);
                     FCodDocumento := IntToStr(iCodDocumento);
                  End
               Else
                  Raise Exception.Create(FCtrlDocumento.MessageInfo);

               // Criação das mensagens de término do processo de integração
               If FNumDocumentoGerado <> '' Then
                  Begin
                     MessageInfo :=
                        'Integração Contábil Realizada com Sucesso !' + CR_LF +
                        'Planilha Nº.: ' + NumPlanilhaGerada;

                     If PagRec = 'P' Then
                        MessageInfo := MessageInfo + CR_LF + CR_LF +
                           'Integração do Contas a Pagar Realizada com Sucesso !' + CR_LF +
                           'Documento Nº.: ' + FNumDocumentoGerado
                     Else
                        MessageInfo :=
                           'Integração do Contas a Receber Realizada com Sucesso !' + CR_LF +
                           'Documento Nº.: ' + FNumDocumentoGerado
                  End
               Else
                  MessageInfo := 'Integração Financeira não foi Realizada !';

               /////////////////////////////////////////////////////////////////////////////////////////////////

               Result := True;
            End
         Else
            MessageInfo := 'Integração Contábil não Realizada !' + CR_LF + CR_LF + MessageInfo;
      Except
         On E: Exception Do
            MessageInfo := E.Message;
      End;
   Finally
      FreeAndNil(Qry);
      FreeAndNil(CdsContasFundoADM);
   End;
End;

//*****************************************************************************************
// *********** Função para contabilizar usando critérios de rateio ************************
//*****************************************************************************************

Function TCtrlEtapaProcesso.ContabilizaUsandoCriteriosDeRateios(
   iNumProctrab, iPrograma, iIdPrograma, iPlano, iPlanoPrevCustas, iPatroCustas, iCodDocumento: Integer;
   sSub_Programa, sTipoLancamento, sDataLanc, sHist1, sHist2, sHist3, sHist4, sHist5: String;
   dValLanc: double; sContaDB, sContaCR, sCentroCusto, sDesembolso, sPagRec, sCodCentroRespon: String;
   Var FPlnCodigo: OleVariant): Boolean;
Var
   dValorSegregado, dValorSegrega, dValorCadaLitis, dValorTotalPlano: Double;
   iQtd, iQtdItensSegrega, iQtdTotalLitis, iPlanoSegrega, iPatroSegrega, idSegregaCriterio: Integer;
   sNumDoc: String;
   qrySegregacao: Twwquery;
Begin
   Try
      Try
         qrySegregacao := Twwquery.Create(Nil);
         Result := True;
         sNumDoc := Copy(sDataLanc, 7, 4) + Copy(sDataLanc, 3, 3); // Número do Documento

         // ******************************************************
         // PROGRAMA INVESTIMENTO - Financiamento Habitacional ou
         //	                    Investimento Imobiliário ou
         //		            A Classificar
         // ******************************************************
         If (iPrograma = 2) And ((sSub_Programa = '40') Or (sSub_Programa = '41') Or (sSub_Programa = '49')) Then
            Begin
               iQtd := 1;
               iQtdItensSegrega := 0;
               dValorSegregado := 0.00;
               dValorSegrega := 0.00;
               If (sSub_Programa = '41') Or (sSub_Programa = '49') Then
                  IdSegregaCriterio := 3
               Else
                  IdSegregaCriterio := 4;

               // Achando a quantidade de Planos para o cálculo do rateio
               qrySegregacao.DataBaseName := 'BaseDados';
               qrySegregacao.Close;
               qrySegregacao.SQL.Clear;
               qrySegregacao.SQL.Add('SELECT COUNT(*) QTDITEMS                                    ');
               qrySegregacao.SQL.Add('FROM SEGREGACOTACAO CT, SEGREGADATA SD                      ');
               qrySegregacao.SQL.Add('WHERE CT.IDSEGREGADATA = SD.IDSEGREGADATA                   ');
               qrySegregacao.SQL.Add('   AND SD.IDSEGREGACRITER = ' + quotedstr(inttostr(IdSegregaCriterio)));
               qrySegregacao.SQL.Add('   AND TO_DATE( ' + quotedstr(sDataLanc) + ', ''DD/MM/YYYY'') BETWEEN SD.DATAINI AND SD.DATAFIM  ');
               qrySegregacao.Open;
               If Not qrySegregacao.EOF Then
                  Begin
                     iQtdItensSegrega := qrySegregacao.fieldbyname('QTDITEMS').asInteger;

                     qrySegregacao.Close;
                     qrySegregacao.SQL.Clear;
                     qrySegregacao.SQL.Add('SELECT CT.IDSEGREGADATA, CT.IDSEGREGACOTACAO,               ');
                     qrySegregacao.SQL.Add('       CT.IDPLANOPREV, CT.IDPATRO, CT.COTACAO,              ');
                     qrySegregacao.SQL.Add('       SD.DATAFIM, SD.DATAINI, CR.DESCRICAO                 ');
                     qrySegregacao.SQL.Add('FROM SEGREGACOTACAO CT, SEGREGADATA SD, SEGREGACRITER CR    ');
                     qrySegregacao.SQL.Add('WHERE CT.IDSEGREGADATA = SD.IDSEGREGADATA                   ');
                     qrySegregacao.SQL.Add('   AND SD.IDSEGREGACRITER = CR.IDSEGREGACRITER              ');
                     qrySegregacao.SQL.Add('   AND SD.IDSEGREGACRITER = ' + quotedstr(inttostr(IdSegregaCriterio)));
                     qrySegregacao.SQL.Add('   AND TO_DATE( ' + quotedstr(sDataLanc) + ', ''DD/MM/YYYY'') BETWEEN SD.DATAINI AND SD.DATAFIM  ');
                     qrySegregacao.Open;
                     While Not qrySegregacao.EOF Do
                        Begin
                           // Macete usado para evitar as diferenças de arredondamento por conta das dízimas
                           If iQtd < iQtdItensSegrega Then
                              Begin
                                 dValorSegregado := RoundCM((dValLanc * qrySegregacao.fieldbyname('COTACAO').asFloat) / 100, 2);
                                 dValorSegrega := dValorSegrega + dValorSegregado;
                                 inc(iQtd);
                              End
                           Else
                              dValorSegregado := dValLanc - dValorSegrega; // Acha o valor do último pela diferença

                           // Provisionando ou Estornando
                           dValorSegregado := IFF(sTipoLancamento = 'P', Abs(dValorSegregado), Abs(dValorSegregado) * -1);

                           iPlanoSegrega := qrySegregacao.fieldbyname('IDPLANOPREV').asInteger;
                           iPatroSegrega := qrySegregacao.fieldbyname('IDPATRO').asInteger;

                           If iPlanoPrevCustas <> 0 Then // Se for Custas, então usa Plano passado - PGA
                              Begin
                                 iPlanoSegrega := iPlanoPrevCustas;
                                 iPatroSegrega := iPatroCustas
                              End;

                           If FCtrlLancamento.InsereLancaContab(
                              '2', // Tipo do Lançamento (0 - Débito; 1 - Crédito; 2 - Partida Dobrada)
                              Sistema.IdEmpresa, // Empresa
                              Sistema.IdModulo, // Módulo de Origem (719)
                              Sistema.IdUsuario, // Usuário Ativo
                              iPlano, // Plano de Contas
                              -1, // Unidade de Negócio
                              0, // Sub-Conta de Débito
                              0, // Sub-Conta de Crédito
                              iPlanoSegrega,
                              iPatroSegrega,
                              FPlnCodigo, // Número da Planilha
                              0, // Número do Lançamento
                              sDataLanc, // Data da Correção
                              sNumDoc, // Número do Documento
                              sHist1, // 1ª Linha do Histórico
                              sHist2, // 2ª Linha do Histórico
                              sHist3, // 3ª Linha do Histórico
                              sHist4, // 4ª Linha do Histórico
                              sHist5, // 5ª Linha do Histórico
                              sSub_Programa, // Sub-Programa (TIPCODIGO)
                              sCentroCusto, // Centro de Custo para Débito
                              sContaDB, // Conta para Débito
                              sCentroCusto, // Centro de Custo para Crédito
                              sContaCR, // Conta para Crédito
                              '', // Código do Histórico Padrão
                              dValorSegregado,
                              True, // Indica se os Lançamentos devem ser unidos em uma mesma Planilha
                              True, // Indica se usa Plano da Patrocinadora
                              ) Then
                              Begin
                                 FPlnCodigo := FCtrlLancamento.RetornoPlnCodigo;

                                 // Só lança este rateio se o Plano não for PGA
                                 If iPlanoPrevCustas = 0 Then
                                    Begin
                                       // Setando os valores para a tabela RATEIODOCUM
                                       FctrlDocumento.Rateiodocum.SetValues(
                                          dValorTotalPlano,
                                          0, 0, 0,
                                          Sistema.IdEmpresa,
                                          iCodDocumento,
                                          -1, // Unidade de Negócios
                                          0,
                                          Sistema.idUsuario,
                                          0,
                                          iPlano,
                                          iPlanoSegrega,
                                          iPatroSegrega,
                                          iIdPrograma, // IdPrograma
                                          0,
                                          Sistema.IdEmpresa,
                                          sDesembolso, // Desembolso
                                          sPagRec, // (P)agar ou (R)eceber
                                          sCodCentroRespon,
                                          sCentroCusto,
                                          '');
                                    End;
                              End
                           Else
                              Raise Exception.Create(FCtrlLancamento.MessageInfo);

                           qrySegregacao.Next;

                        End;
                  End;
            End;

         // ********************************************************
         // PROGRAMA INVESTIMENTO - Renda Fixa ou
         //                         Renda Variável ou
         //			    Estruturado ou Exterior
         // ********************************************************
         If (iPrograma = 2) And ((sSub_Programa = '43') Or (sSub_Programa = '44') Or (sSub_Programa = '45') Or (sSub_Programa = '46')) Then
            Begin
               iQtd := 1;
               iQtdItensSegrega := 0;
               dValorSegregado := 0.00;
               dValorSegrega := 0.00;
               // Achando a quantidade de Planos para o cálculo do rateio
               qrySegregacao.DataBaseName := 'BaseDados';
               qrySegregacao.Close;
               qrySegregacao.SQL.Clear;
               qrySegregacao.SQL.add('SELECT COUNT(*) QTDITEMS     ');
               qrySegregacao.SQL.add('FROM JURIDICORATEIOCONTABIL  ');
               qrySegregacao.SQL.ADD('WHERE PROGRAMA = ' + FloatToStr(iPrograma));
               qrySegregacao.SQL.ADD('      AND SUB_PROGRAMA  = ' + quotedStr(sSub_Programa));
               qrySegregacao.Open;
               If Not qrySegregacao.EOF Then
                  Begin
                     iQtdItensSegrega := qrySegregacao.fieldbyname('QTDITEMS').asInteger;

                     qrySegregacao.Close;
                     qrySegregacao.SQL.Clear;
                     qrySegregacao.SQL.Add('SELECT J.PERCRATEIO, P.IDPLANOPREV, P.IDPATRO        ');
                     qrySegregacao.SQL.add('FROM JURIDICORATEIOCONTABIL J, PLANPREVCONTABPATRO P   ');
                     qrySegregacao.SQL.ADD('WHERE J.PROGRAMA      = ' + FloatToStr(iPrograma));
                     qrySegregacao.SQL.ADD('      AND J.SUB_PROGRAMA  = ' + quotedStr(sSub_Programa));
                     qrySegregacao.SQL.ADD('      AND J.IDPLANPREVCTBPATR = P.IDPLANPREVCTBPATR ');
                     qrySegregacao.Open;
                     While Not qrySegregacao.EOF Do
                        Begin
                           // Macete usado para evitar as diferenças de arredondamento por conta das dízimas
                           If iQtd < iQtdItensSegrega Then
                              Begin
                                 dValorSegregado := RoundCM((dValLanc * qrySegregacao.fieldbyname('PERCRATEIO').asFloat) / 100, 2);
                                 dValorSegrega := dValorSegrega + dValorSegregado;
                                 inc(iQtd);
                              End
                           Else
                              dValorSegregado := dValLanc - dValorSegrega; // Acha o valor do último pela diferença

                           // Provisionando ou Estornando
                           dValorSegregado := IFF(sTipoLancamento = 'P', Abs(dValorSegregado), Abs(dValorSegregado) * -1);

                           iPlanoSegrega := qrySegregacao.fieldbyname('IDPLANOPREV').asInteger;
                           iPatroSegrega := qrySegregacao.fieldbyname('IDPATRO').asInteger;

                           If iPlanoPrevCustas <> 0 Then // Se for Custas, então usa Plano passado - PGA
                              Begin
                                 iPlanoSegrega := iPlanoPrevCustas;
                                 iPatroSegrega := iPatroCustas
                              End;

                           If FCtrlLancamento.InsereLancaContab(
                              '2', // Tipo do Lançamento (0 - Débito; 1 - Crédito; 2 - Partida Dobrada)
                              Sistema.IdEmpresa, // Empresa
                              Sistema.IdModulo, // Módulo de Origem (719)
                              Sistema.IdUsuario, // Usuário Ativo
                              iPlano, // Plano de Contas
                              -1, // Unidade de Negócio
                              0, // Sub-Conta de Débito
                              0, // Sub-Conta de Crédito
                              iPlanoSegrega,
                              iPatroSegrega,
                              FPlnCodigo, // Número da Planilha
                              0, // Número do Lançamento
                              sDataLanc, // Data da Correção
                              sNumDoc, // Número do Documento
                              sHist1, // 1ª Linha do Histórico
                              sHist2, // 2ª Linha do Histórico
                              sHist3, // 3ª Linha do Histórico
                              sHist4, // 4ª Linha do Histórico
                              sHist5, // 5ª Linha do Histórico
                              sSub_Programa, // Sub-Programa (TIPCODIGO)
                              sCentroCusto, // Centro de Custo para Débito
                              sContaDB, // Conta para Débito
                              sCentroCusto, // Centro de Custo para Crédito
                              sContaCR, // Conta para Crédito
                              '', // Código do Histórico Padrão
                              dValorSegregado,
                              True, // Indica se os Lançamentos devem ser unidos em uma mesma Planilha
                              True, // Indica se usa Plano da Patrocinadora
                              ) Then
                              Begin
                                 FPlnCodigo := FCtrlLancamento.RetornoPlnCodigo;

                                 // Só lança este rateio se o Plano não for PGA
                                 If iPlanoPrevCustas = 0 Then
                                    Begin
                                       // Setando os valores para a tabela RATEIODOCUM
                                       FctrlDocumento.Rateiodocum.SetValues(
                                          dValorTotalPlano,
                                          0, 0, 0,
                                          Sistema.IdEmpresa,
                                          iCodDocumento,
                                          -1, // Unidade de Negócios
                                          0,
                                          Sistema.idUsuario,
                                          0,
                                          iPlano,
                                          iPlanoSegrega,
                                          iPatroSegrega,
                                          iIdPrograma, // IdPrograma
                                          0,
                                          Sistema.IdEmpresa,
                                          sDesembolso, // Desembolso
                                          sPagRec, // (P)agar ou (R)eceber
                                          sCodCentroRespon,
                                          sCentroCusto,
                                          '');
                                    End;
                              End
                           Else
                              Raise Exception.Create(FCtrlLancamento.MessageInfo);

                           qrySegregacao.Next;
                        End;
                  End;
            End;

         // ********************************************
         // PROGRAMA INVESTIMENTO   - Empréstimo ou
         // PROGRAMA ADMINISTRATIVO - Administrativo ou
         // PROGRAMA PREVIDENCIAL   - Previdencial
         // ********************************************
         If ((iPrograma = 2) And (sSub_Programa = '42')) Or
            ((iPrograma = 3) And (sSub_Programa = '48')) Or
            ((iPrograma = 4) And (sSub_Programa = '47')) Then
            Begin
               iQtdTotalLitis := 0;
               dValorCadaLitis := 0.00;
               dValorTotalPlano := 0.00;
               // Achando a quantidade de Litis para ser usada no cálculo do rateio
               qrySegregacao.DataBaseName := 'BaseDados';
               qrySegregacao.Close;
               qrySegregacao.SQL.Clear;
               qrySegregacao.SQL.Add('SELECT SUM(QTD_TOTAL_PESSOAS) QTD_TOTAL_PESSOAS                ');
               qrySegregacao.SQL.Add('FROM (                                                         ');
               qrySegregacao.SQL.Add('SELECT COUNT(*) QTD_TOTAL_PESSOAS                              '); // Selecionando o Reclamante/Contra-parte
               qrySegregacao.SQL.Add('FROM PROCESSOTRAB PT, PESSOA P2, PARTPREVPLAN PR, PLANPREV PL  ');
               qrySegregacao.SQL.Add('WHERE PT.NUMPROCTRAB = ' + inttostr(iNumProctrab));
               qrySegregacao.SQL.Add('      AND PT.IDRECLAMANTE = PR.IDPESSOA (+)                    ');
               qrySegregacao.SQL.Add('      AND PT.IDMOTIVO IS NULL                                  ');
               qrySegregacao.SQL.Add('      AND PT.FLGSITPROC = ' + inttostr(IFF(sTipoLancamento = 'P', 0, 1))); // Provisão = aberto / Estorno = Encerrado
               qrySegregacao.SQL.Add('      AND PR.IDPESSJUR   = P2.IDPESSOA                        ');
               qrySegregacao.SQL.Add('      AND PR.IDPLANOPREV = PL.IDPLANOPREV                     ');
               qrySegregacao.SQL.Add('      AND PR.FLGDESATIVADO = 0                                '); // Ativo
               qrySegregacao.SQL.Add('UNION                                                          ');
               qrySegregacao.SQL.Add('SELECT COUNT(*) QTD_TOTAL_PESSOAS                              '); // Selecionando as Litis
               qrySegregacao.SQL.Add('FROM COPARTPROCTRAB C, VWPLANPREVCTBPATR VW                    ');
               qrySegregacao.SQL.Add('WHERE C.NUMPROCTRAB = ' + inttostr(iNumProctrab));
               qrySegregacao.SQL.Add('      AND C.IDPLANPREVCTBPATR = VW.IDPLANPREVCTBPATR           ');
               qrySegregacao.SQL.Add('      AND C.IDMOTIVO IS NULL                                   ');
               qrySegregacao.SQL.Add('      AND C.IDPLANPREVCTBPATR IS NOT NULL                      '); // Somente Litis com Plano/Patro
               qrySegregacao.SQL.Add('      AND C.INDTESTEMUNHA <> 3                                 '); // Sem a CEF
               qrySegregacao.SQL.Add('     )                                                         ');
               qrySegregacao.Open;
               If qrySegregacao.FieldByName('QTD_TOTAL_PESSOAS').asInteger > 0 Then
                  Begin
                     iQtdTotalLitis := qrySegregacao.FieldByName('QTD_TOTAL_PESSOAS').asInteger;

                     // Achando o valor de cada uma das Pessoas
                     dValorCadaLitis := dValLanc / iQtdTotalLitis;

                     // Localizando a qtd de Pessoas agrupadas por Plano/Patro
                     qrySegregacao.Close;
                     qrySegregacao.SQL.Clear;
                     qrySegregacao.SQL.Add('SELECT IDPLANOPREV, IDPATRO, SUM(QTD_PESSOAS_PLANO) QTD_PESSOAS_POR_PLANO  ');
                     qrySegregacao.SQL.Add('FROM (                                                                     ');

                     // Selecionando o Reclamante/Contra-parte
                     // PROGRAMA PREVIDENCIAL ou PROGRAMA INVESTIMENTO EMPRÉSTIMO
                     If ((iPrograma = 4) And (sSub_Programa = '47')) Or
                        ((iPrograma = 2) And (sSub_Programa = '42')) Then
                        Begin
                           qrySegregacao.SQL.Add('SELECT DECODE(PL.IDPLANOPREV, 19, 66, DECODE(PL.IDPLANOPREV, 79, 66, DECODE(PL.IDPLANOPREV, 29, 66, PL.IDPLANOPREV))) IDPLANOPREV,  '); // Selecionando o Reclamante / Contra-Parte
                           qrySegregacao.SQL.Add('       91008 IDPATRO,  ');
                        End
                     Else // PROGRAMA ADMINISTRATIVO (3 / 48)
                        Begin
                           qrySegregacao.SQL.Add('SELECT ' + inttostr(FCtrlListTerceirosRH.GetIdPlanoPrev(Sistema.IdEmpresa)) + ' IDPLANOPREV,   '); // PGA (110)
                           qrySegregacao.SQL.Add('       ' + inttostr(FCtrlListTerceirosRH.GetIdPatro(Sistema.IdEmpresa)) + ' IDPATRO,           '); // PGA (1117723)
                        End;
                     qrySegregacao.SQL.Add('           COUNT(*) QTD_PESSOAS_PLANO                            ');
                     qrySegregacao.SQL.Add('FROM PROCESSOTRAB PT, PESSOA P2, PARTPREVPLAN PR, PLANPREV PL   ');
                     qrySegregacao.SQL.Add('WHERE PT.NUMPROCTRAB = ' + inttostr(iNumProctrab));
                     qrySegregacao.SQL.Add('      AND PT.IDMOTIVO IS NULL                       ');
                     qrySegregacao.SQL.Add('      AND PT.IDRECLAMANTE = PR.IDPESSOA(+)          '); // Selecionando o Reclamante/Contra-parte
                     qrySegregacao.SQL.Add('      AND PT.FLGSITPROC = ' + inttostr(IFF(sTipoLancamento = 'P', 0, 1))); // Provisão = aberto / Estorno = Encerrado
                     qrySegregacao.SQL.Add('      AND PR.IDPESSJUR    = P2.IDPESSOA             ');
                     qrySegregacao.SQL.Add('      AND PR.IDPLANOPREV  = PL.IDPLANOPREV          ');
                     qrySegregacao.SQL.Add('      AND PR.FLGDESATIVADO = 0                      '); // Ativo
                     qrySegregacao.SQL.Add('GROUP BY DECODE(PL.IDPLANOPREV, 19, 66, DECODE(PL.IDPLANOPREV, 79, 66, DECODE(PL.IDPLANOPREV, 29, 66, PL.IDPLANOPREV))),  ');
                     qrySegregacao.SQL.Add('         91008                                      ');

                     qrySegregacao.SQL.Add('UNION                                                     ');

                     // Selecionando as Litis
                     // PROGRAMA PREVIDENCIAL ou PROGRAMA INVESTIMENTO EMPRÉSTIMO
                     If ((iPrograma = 4) And (sSub_Programa = '47')) Or
                        ((iPrograma = 2) And (sSub_Programa = '42')) Then
                        Begin
                           qrySegregacao.SQL.Add('SELECT DECODE(VW.IDPLANOPREV, 19, 66, DECODE(VW.IDPLANOPREV, 79, 66, DECODE(VW.IDPLANOPREV, 29, 66, VW.IDPLANOPREV ))) IDPLANOPREV,     '); // Litis
                           qrySegregacao.SQL.Add('       91008 IDPATRO,          ');
                        End
                     Else // PROGRAMA ADMINISTRATIVO  (3 / 48)
                        Begin
                           qrySegregacao.SQL.Add('SELECT ' + inttostr(FCtrlListTerceirosRH.GetIdPlanoPrev(Sistema.IdEmpresa)) + ' IDPLANOPREV,   '); // PGA (110)
                           qrySegregacao.SQL.Add('       ' + inttostr(FCtrlListTerceirosRH.GetIdPatro(Sistema.IdEmpresa)) + ' IDPATRO,           '); // PGA (1117723)
                        End;
                     qrySegregacao.SQL.Add('             COUNT(*) QTD_PESSOAS_PLANO                   ');
                     qrySegregacao.SQL.Add('FROM COPARTPROCTRAB C, VWPLANPREVCTBPATR VW               ');
                     qrySegregacao.SQL.Add('WHERE C.NUMPROCTRAB = ' + inttostr(iNumProctrab));
                     qrySegregacao.SQL.Add('      AND C.IDPLANPREVCTBPATR = VW.IDPLANPREVCTBPATR      ');
                     qrySegregacao.SQL.Add('      AND C.IDMOTIVO IS NULL                              ');
                     qrySegregacao.SQL.Add('      AND C.IDPLANPREVCTBPATR IS NOT NULL                 '); // Somente Litis com Plano/Patro
                     qrySegregacao.SQL.Add('      AND C.INDTESTEMUNHA <> 3                            '); // Sem a CEF
                     qrySegregacao.SQL.Add('GROUP BY DECODE(VW.IDPLANOPREV, 19, 66, DECODE(VW.IDPLANOPREV, 79, 66, DECODE(VW.IDPLANOPREV, 29, 66, VW.IDPLANOPREV ))),  ');
                     qrySegregacao.SQL.Add('         91008                                            ');
                     qrySegregacao.SQL.Add(' )                                                  ');
                     qrySegregacao.SQL.Add('GROUP BY IDPLANOPREV, IDPATRO                       ');
                     qrySegregacao.Open;
                     While Not qrySegregacao.EOF Do
                        Begin
                           // Achando o valor total de cada Plano
                           dValorTotalPlano := dValorCadaLitis * qrySegregacao.FieldByName('QTD_PESSOAS_POR_PLANO').asFloat;
                           // Provisionando ou Estornando
                           dValorTotalPlano := IFF(sTipoLancamento = 'P', Abs(dValorTotalPlano), Abs(dValorTotalPlano) * -1);

                           iPlanoSegrega := qrySegregacao.fieldbyname('IDPLANOPREV').asInteger;
                           iPatroSegrega := qrySegregacao.fieldbyname('IDPATRO').asInteger;

                           If iPlanoPrevCustas <> 0 Then // Se for Custas, então usa Plano passado - PGA
                              Begin
                                 iPlanoSegrega := iPlanoPrevCustas;
                                 iPatroSegrega := iPatroCustas
                              End;

                           If FCtrlLancamento.InsereLancaContab(
                              '2', // Tipo do Lançamento (0 - Débito; 1 - Crédito; 2 - Partida Dobrada)
                              Sistema.IdEmpresa, // Empresa
                              Sistema.IdModulo, // Módulo de Origem (719)
                              Sistema.IdUsuario, // Usuário Ativo
                              iPlano, // Plano de Contas
                              -1, // Unidade de Negócio
                              0, // Sub-Conta de Débito
                              0, // Sub-Conta de Crédito
                              iPlanoSegrega,
                              iPatroSegrega,
                              FPlnCodigo, // Número da Planilha
                              0, // Número do Lançamento
                              sDataLanc, // Data da Correção
                              sNumDoc, // Número do Documento
                              sHist1, // 1ª Linha do Histórico
                              sHist2, // 2ª Linha do Histórico
                              sHist3, // 3ª Linha do Histórico
                              sHist4, // 4ª Linha do Histórico
                              sHist5, // 5ª Linha do Histórico
                              sSub_Programa, // Sub-Programa (TIPCODIGO)
                              sCentroCusto, // Centro de Custo para Débito
                              sContaDB, // Conta para Débito
                              sCentroCusto, // Centro de Custo para Crédito
                              sContaCR, // Conta para Crédito
                              '', // Código do Histórico Padrão
                              dValorTotalPlano,
                              True, // Indica se os Lançamentos devem ser unidos em uma mesma Planilha
                              True, // Indica se usa Plano da Patrocinadora
                              ) Then
                              Begin
                                 FPlnCodigo := FCtrlLancamento.RetornoPlnCodigo;

                                 // Só lança este rateio se o Plano não for PGA
                                 If iPlanoPrevCustas = 0 Then
                                    Begin
                                       // Setando os valores para a tabela RATEIODOCUM
                                       FctrlDocumento.Rateiodocum.SetValues(
                                          dValorTotalPlano,
                                          0, 0, 0,
                                          Sistema.IdEmpresa,
                                          iCodDocumento,
                                          -1, // Unidade de Negócios
                                          0,
                                          Sistema.idUsuario,
                                          0,
                                          iPlano,
                                          iPlanoSegrega,
                                          iPatroSegrega,
                                          iIdPrograma, // IdPrograma
                                          0,
                                          Sistema.IdEmpresa,
                                          sDesembolso, // Desembolso
                                          sPagRec, // (P)agar ou (R)eceber
                                          sCodCentroRespon,
                                          sCentroCusto,
                                          '');
                                    End;
                              End
                           Else
                              Raise Exception.Create(FCtrlLancamento.MessageInfo);

                           qrySegregacao.Next;
                        End;
                  End;
            End;
      Except
         On E: Exception Do
            Begin
               MessageInfo := E.Message;
               Result := False;
            End;
      End;
   Finally
      FreeAndNil(qrySegregacao);
   End;
End;

Function TCtrlEtapaProcesso.LocalizaContasFundoADM(iPlano: integer; sPlaConta: String): OleVariant;
Var
   sSQL: String;
Begin
   sSql := sSql + 'SELECT                  ';
   sSql := sSql + '  C.FLGUSOEXCPGA,       ';
   sSql := sSql + '  C.SEGFDOADMDEBITO,    ';
   sSql := sSql + '  C.SEGFDOADMCREDITO    ';
   sSql := sSql + 'FROM                    ';
   sSql := sSql + '  PLANOCONTA C, PLANO P ';
   sSql := sSql + ' WHERE C.PLANO = ' + FloatToStr(iPlano);
   sSql := sSql + ' AND RTRIM(C.PLACONTA) = ' + Trim(sPlaConta);
   sSql := sSql + ' AND P.PLANO = C.PLANO ';
   Result := GetDataPacket(sSql);
End;

Procedure TCtrlEtapaProcesso.ExcluiObjAssociados(NumProcTrab, NumSeq, CodTipoRecurso: Double);
Var Qry: TwwQuery;
Begin
   Qry := TwwQuery.Create(Nil);
   Qry.DatabaseName := 'BaseDados';
   Qry.Close;
   Qry.SQL.Clear;
   Qry.SQL.Add('DELETE JUR_ETAPAXOBJETOPROC');
   Qry.SQL.Add('WHERE NUMPROCTRAB = ' + quotedstr(floattostr(NumProcTrab)));
   Qry.SQL.Add('      AND NUMSEQ  = ' + quotedstr(floattostr(NumSeq)));
   Qry.SQL.Add('      AND CODTIPORECURSO  = ' + quotedstr(floattostr(CodTipoRecurso)));
   Qry.execsql;

   freeandnil(Qry);
End;

Function TCtrlEtapaProcesso.LocalizaObjAssociados(NumProcTrab, NumSeq, CodTipoRecurso: Double): Olevariant;
Var
   sSQL: String;
Begin
   sSql := sSql + 'select e.numproctrab, e.codtiporecurso, e.DATAREALOCOR, e.DATAPREVPAGTO,   ';
   sSql := sSql + 'o.codtipoobjeto, o.idtipoproc, o.tipcodigo, ';
   sSql := sSql + 'p.IDPLANOPREV, p.IDPATRO, c.NOMETIPOPROC, T.TIPDESCRICAO, b.descricao  ';
   sSql := sSql + 'from JUR_ETAPAXOBJETOPROC j,  etapaproctrab e, objproctrab o, processotrab p, TIPOPROCESSO c, TIPOPER T, tipoobjproctrab b ';
   sSql := sSql + ' WHERE j.NUMPROCTRAB = ' + FloatToStr(NumProcTrab);
   sSql := sSql + ' AND j.NUMSEQ = ' + FloatToStr(NumSeq);
   sSql := sSql + ' AND j.CODTIPORECURSO = ' + FloatToStr(CodTipoRecurso);
   sSql := sSql + '      And e.numproctrab = j.numproctrab  ';
   sSql := sSql + '      And e.codtiporecurso = j.codtiporecurso ';
   sSql := sSql + '      And e.numseq = j.numseq                        ';
   sSql := sSql + '      And o.numproctrab = j.numproctrab             ';
   sSql := sSql + '      And o.codtipoobjeto = j.codtipoobjeto         ';
   sSql := sSql + '      And o.IDTIPOPROC = c.IDTIPOPROC               ';
   sSql := sSql + '      And o.TIPCODIGO = t.TIPCODIGO                 ';
   sSql := sSql + '      and o.codtipoobjeto = b.codtipoobjeto         ';
   sSql := sSql + '      And p.numproctrab = j.numproctrab  ';
   sSql := sSql + ' ORDER BY o.CODTIPOOBJETO ';
   Result := GetDataPacket(sSql);
End;

//////////////////////////////////////////////////////////////////////////////////////////////////////////

Procedure TCtrlEtapaProcesso.ExcluiArrematacao(NumProcTrab, NumSeq, CodTipoRecurso: Double);
Var Qry: TwwQuery;
Begin
   Qry := TwwQuery.Create(Nil);
   Qry.DatabaseName := 'BaseDados';
   Qry.Close;
   Qry.SQL.Clear;
   Qry.SQL.Add('DELETE ETAPA_DETALHAMENTO');
   Qry.SQL.Add('WHERE NUMPROCTRAB = ' + quotedstr(floattostr(NumProcTrab)));
   Qry.SQL.Add('      AND NUMSEQ  = ' + quotedstr(floattostr(NumSeq)));
   Qry.SQL.Add('      AND CODTIPORECURSO  = ' + quotedstr(floattostr(CodTipoRecurso)));
   Qry.execsql;

   freeandnil(Qry);
End;

End.

