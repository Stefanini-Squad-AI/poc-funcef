{*******************************************************}
{                                                       }
{ CM Soluções Informática                               }
{ ** Todos os Direitos Reservados                       }
{ Analista Responsável: Davi Ramos                      }
{ Atualizado Em: Julho/2002                             }
{                                                       }
{*******************************************************}
Unit uDtmOrcamentoSvr50;

Interface

Uses
  Windows, Messages, SysUtils, Classes, ComServ, ComObj, VCLCom, DataBkr,
  DBClient, OrcamentoSvr50_TLB, StdVcl, DBTables, Db, uCMTypes, uDataBase,
  uMidasUtil, uCtrlPadroesSrvr, uCtrlPadroes, ComCtrls, Dialogs, Forms,
  //
  // Controls de negócio
  //
  uCtrlAlterorcamento, uCtrlCadCenario,         uCtrlCadContasOrc,      uCtrlCadGrupos,
  uCtrlCadLayoutOrc,   uCtrlCadTipoCriterioRat, uCtrlCadUsuxCResp,      uCtrlCadValCriterioRat,
  uCtrlCenarioOrcamen, uCtrlCompContasOrcamen,  uCtrlContaOrcamentaria, uCtrlCopiaContaOrcamen,
  uCtrlCriaRelatorio,  uCtrlDocrecxcomp,        uCtrlLancamentoorc,     uCtrlLinhasRelatOrc,
  uCtrlParamorcamento, uCtrlPeriodoOrcamen,     uCtrlPlanoOrcamen,      uCtrlPlanoTrabalho,
  uCtrlReservaorcamen, uCtrlResxcomp,           uCtrlSaldoorcado,       uCtrlSaldoorcadoant,
  uCtrlValoresCenario, uFuncoesOrcamento,       uCtrlGeraDados,         uCtrlEntCadDadosEspecial,
  uCtrlCadContasOrcPorGrupo, uRecCodigo ;
Type
  TdtmOrcamentoSrv50 = class(TRemoteDataModule, IOrcamentoSrv50)
    dbOrcamento: TDatabase;
    ssnOrcamento: TSession;
    Procedure RemoteDataModuleCreate(Sender: TObject);
    Procedure RemoteDataModuleDestroy(Sender: TObject);

  Private
    { Private declarations }

    TempDir: String;
    _MessageInfo: String;
    _PadroesSrvr: TCtrlPadroesSrvr;
    //
    // Controls de negócio
    //
    CtrlPadroes              : TCtrlPadroes;
    CtrlAlterorcamento       : TCtrlAlterorcamento;
    CtrlCadCenario           : TCtrlCadCenario;
    CtrlCadContasOrc         : TCtrlCadContasOrc;
    CtrlCadGrupos            : TCtrlCadGrupos;
    CtrlCadLayoutOrc         : TCtrlCadLayoutOrc;
    CtrlCadTipoCriterioRat   : TCtrlCadTipoCriterioRat;
    CtrlCadUsuxCResp         : TCtrlCadUsuxCResp;
    CtrlCadValCriterioRat    : TCtrlCadValCriterioRat;
    CtrlCenarioOrcamen       : TCtrlCenarioOrcamen;
    CtrlCompContasOrcamen    : TCtrlCompContasOrcamen;
    CtrlContaOrcamentaria    : TCtrlContaOrcamentaria;
    CtrlCopiaContaOrcamen    : TCtrlCopiaContaOrcamen;
    CtrlCriaRelatorio        : TCtrlCriaRelatorio;
    CtrlDocrecxcomp          : TCtrlDocrecxcomp;
    CtrlLancamentoorc        : TCtrlLancamentoorc;
    CtrlLinhasRelatOrc       : TCtrlLinhasRelatOrc;
    CtrlParamorcamento       : TCtrlParamorcamento;
    CtrlPeriodoOrcamen       : TCtrlPeriodoOrcamen;
    CtrlPlanoOrcamen         : TCtrlPlanoOrcamen;
    CtrlPlanoTrabalho        : TCtrlPlanoTrabalho;
    CtrlReservaorcamen       : TCtrlReservaorcamen;
    CtrlResxcomp             : TCtrlResxcomp;
    CtrlSaldoorcado          : TCtrlSaldoorcado;
    CtrlSaldoorcadoant       : TCtrlSaldoorcadoant;
    CtrlValorescenario       : TCtrlValorescenario;
    CtrlGeraDados            : TCtrlGeraDados;
    CtrlEntCadDadosEspecial  : TCtrlEntCadDadosEspecial;
    CtrlCadContasOrcPorGrupo : TCtrlCadContasOrcPorGrupo;
    Procedure MensagemPadroes( sMens: String );

  Protected
    // Métodos da aplicação
    class procedure UpdateRegistry(Register: Boolean; const ClassID, ProgID: string); override;
    function MessageInfo: WideString; safecall;
    function ConectaDB(const UserName, PassWord,
      ServerName: WideString): WordBool; safecall;
    function ExecSqlAndCommit(const sSql: WideString): WordBool; safecall;
    function GetContentFile(const sFileName: WideString): WideString; safecall;
    function GetDadosPessoa(rIdPessoa: Double; TipoGetPessoa,
      TipoPessoa: Integer; var ovPessoa, ovPessoaFisica, ovDocPessoa,
      ovEndPess, ovTelEndPess, ovContatoPess, ovTelContato,
      ovContaBancaria, ovImagensPessoa, ovImagensDoc, ovEstado,
      ovNaturalidade, ovBanco, ovDocumento,
      ovTipoDoc: OleVariant): WordBool; safecall;
    function GetDataPacket(const sSql: WideString): OleVariant; safecall;
    function GetDataPacketTS(lSQL: OleVariant): OleVariant; safecall;
    function GravaHistSenha(aCdsHistSenha: OleVariant): WordBool; safecall;
    function GravaLogOperacoes(dIdPessoa, dIdModulo, dIdUsuario: Double;
      const sDescOperacao: WideString): WordBool; safecall;
    function ProcessaMensagem(CdsMensagem: OleVariant; iOperacaoMensage,
      IdMensagem: Integer): WordBool; safecall;
    function ProcessaPessoaAgencia(Operacao: Integer; CdsPessoa,
      CdsPessoaFisica, CdsDocPessoa, CdsSubTipo, CdsEndPess, CdsTelEndPess,
      CdsContatoPess, CdsTelContato, CdsContaBancaria, CdsImagensPessoa,
      CdsImagensDoc: OleVariant): WordBool; safecall;
    function ProcessaPessoaBanco(Operacao: Integer; CdsPessoa, CdsPessoaFisica,
      CdsDocPessoa, CdsSubTipo, CdsEndPess, CdsTelEndPess, CdsContatoPess,
      CdsTelContato, CdsContaBancaria, CdsImagensPessoa,
      CdsImagensDoc: OleVariant): WordBool; safecall;
    function ProcessaPessoaCliente(Operacao: Integer; CdsPessoa,
      CdsPessoaFisica, CdsDocPessoa, CdsSubTipo, CdsEndPess, CdsTelEndPess,
      CdsContatoPess, CdsTelContato, CdsContaBancaria, CdsImagensPessoa,
      CdsImagensDoc, CdsEmpresaCliente, CdsTipoRecebCli, CdsImAgregCli,
      CdsTiposCli: OleVariant): WordBool; safecall;
    function ProcessaPessoaForne(Operacao: Integer; CdsPessoa, CdsPessoaFisica,
      CdsDocPessoa, CdsSubTipo, CdsEndPess, CdsTelEndPess, CdsContatoPess,
      CdsTelContato, CdsContaBancaria, CdsImagensPessoa, CdsImagensDoc,
      CdsImAgregForn, CdsEmpresaForn, CdsFornXDesemb,
      CdsFornXRamo: OleVariant): WordBool; safecall;
    function SelDadosCli(rIdEmpresa, rIdForcli: Double; out ovSubTipo,
      ovEmpresaCliente, ovTipoReceb, ovTipoRecebCli, ovImAgreg,
      ovImAgregCli, ovTipos, ovTiposCli: OleVariant): WordBool; safecall;
    function SelDadosForne(rIdEmpresa, rIdForcli: Double; out ovSubTipo,
      ovEmpresaForne, ovTipoDesemb, ovImAgreg, ovRamoForne,
      ovTipoDesembForn, ovImAgregForn, ovRamoXForne: OleVariant): WordBool;
      safecall;
    function ProcessaWorkFlow(ovWorkflowUsuario, ovWorkflow,
      ovPassoWorkflow: OleVariant; oPeracao: Integer): WordBool; safecall;
    function ProcessaGrupoUsu(ovDataViewAcesso, ovTabelaAcesso, ovColunaAcesso,
      ovGrupo, ovUsuario, ovPessoa, ovGrupoXUsu, ovAutoriza, ovAutorizaRpt,
      ovAutorizaMS: OleVariant; OperacaoProcessa: Integer): WordBool;
      safecall;
    function GravarReports(ovCds: OleVariant): WordBool; safecall;
    function ProcurarReports(IdReports, OrigemCm: Integer): WordBool; safecall;
    function ProcessaConfig(ovCds, ovCdsReport: OleVariant;
      Operacao: Integer): WordBool; safecall;
    function ProcessaConfigModelo(ovReports: OleVariant): WordBool; safecall;

    // Métodos do negócio
    Function AplicaOperacaoAlterorcamento    ( CdsAlterorcamentoData    : OleVariant ) : WordBool; SafeCall;
    Function AplicaOperacaoCadCenario        ( CdsData                  : OleVariant ) : WordBool; SafeCall;
    Function AplicaOperacaoSaldoorcadoant    ( CdsSaldoorcadoantData    : OleVariant ) : WordBool; SafeCall;
    Function AplicaOperacaoSaldoorcado       ( CdsSaldoorcadoData       : OleVariant ) : WordBool; SafeCall;
    Function AplicaOperacaoResxcomp          ( CdsResxcompData          : OleVariant ) : WordBool; SafeCall;
    Function AplicaOperacaoReservaorcamen    ( CdsReservaorcamenData    : OleVariant ) : WordBool; SafeCall;
    Function AplicaOperacaoPlanoTrabalho     ( CdsPlanoTrabalhoData     : OleVariant ) : WordBool; SafeCall;
    Function AplicaOperacaoPlanoOrcamen      ( CdsPlanoOrcamenData      : OleVariant ) : WordBool; SafeCall;
    Function AplicaOperacaoPeriodoOrcamen    ( CdsPeriodoOrcamenData    : OleVariant ) : WordBool; SafeCall;
    Function AplicaOperacaoParamorcamento    ( CdsParamorcamentoData    : OleVariant ) : WordBool; SafeCall;
    Function AplicaOperacaoLinhasRelatOrc    ( CdsLinhasRelatOrcData    : OleVariant ) : WordBool; SafeCall;
    Function AplicaOperacaoLancamentoorc     ( CdsLancamentoorcData     : OleVariant ) : WordBool; SafeCall;
    Function AplicaOperacaoDocrecxcomp       ( CdsDocrecxcompData       : OleVariant ) : WordBool; SafeCall;
    Function GravarCriaRelatorio             ( CdsCriaRelatoriodata,
                                               CdsLinhasRelatOrcData    : OleVariant ) : WordBool; SafeCall;
    Function ExcluirCriaRelatorio            ( CdsCriaRelatoriodata,
                                               CdsLinhasRelatOrcData    : OleVariant ) : WordBool; SafeCall;
    Function AplicaOperacaoContaOrcamen      ( CdsInsContasDesData      : OleVariant ) : WordBool; SafeCall;
    Function AplicaOperacaoCompDes           ( CdsInsCompDesData        : OleVariant ) : WordBool; SafeCall;
    Function AplicaOperacaoContaOrcamentaria ( CdsContasorcamenData     : OleVariant ) : WordBool; SafeCall;
    Function AplicaOperacaoCompContasOrcamen ( CdsCompContasOrcamenData : OleVariant ) : WordBool; SafeCall;
    Function AplicaOperacaoCenarioOrcamen    ( CdsCenarioOrcamenData    : OleVariant ) : WordBool; SafeCall;
    Function AplicaOperacaoValorCriRatOrc    ( CdsValorCriRatOrcData    : OleVariant ) : WordBool; SafeCall;
    Function AplicaOperacaoPessoaXCresp      ( CdsSelecionadosData      : OleVariant ) : WordBool; SafeCall;
    Function AplicaOperacaoCadTipoCriterioRatDeleta( CdsCadTipoCriterioRatData,
                                                     CdsDataViewData    : OleVariant ): WordBool; SafeCall;
    Function AplicaOperacaoCadTipoCriterioRatGravar( CdsCadTipoCriterioRatData,
                                                     CdsDataViewData    : OleVariant ): WordBool; SafeCall;
    Function AplicaOperacaoCadLayOutOrc      ( CdsData,
                                               CdsReportsData           : OleVariant ) : WordBool; SafeCall;
    Function AplicaOperacaoCadLayOutOrcDelete( CdsData                  : OleVariant ) : WordBool; SafeCall;

    Function AplicaOperacaoCadGrupos         ( CdsCadGruposData         : OleVariant ) : WordBool; SafeCall;
    Function AplicaOperacaoCadContasOrcDelete( CdsMovOrcamentoData ,
                                               CdsTodoDetData ,
                                               CdsData                  : OleVariant ) : WordBool; SafeCall;
    Function AplicaOperacaoCadContasOrcGravar( CdsData,
                                               CdsDetData ,
                                               CdsDetContaOrcData ,
                                               CdsDetFluxoData ,
                                               CdsDetContaReaData ,
                                               CdsDetCondData,
                                               CdsDataViewData          : OleVariant ) : WordBool; SafeCall;
    Function AplicaOperacaoValorescenario    ( CdsValorescenarioData    : OleVariant ) : WordBool; SafeCall;
    Function AplicaOperacaoLogCenario        ( CdsLogCenarioData        : OleVariant ) : WordBool; SafeCall;
    Function GravaLogOperacoesOrc( pIdEmpresa,
                                   pIdModulo,
                                   pIdUsuario : Integer;
                                   Const pLog       : WideString ) : WordBool; SafeCall;
    Function GravarValCriterio( pIdValorCriRatOrc               : Double;
                                pSistemaIdEmpresa               : Integer;
                                Const pdblcExercicioLookUpValue : WideString;
                                Const pdblcPeriodoLookUpValue   : WideString;
                                pSistemaIdPessoa                : Integer;
                                Const pdblcCentCustLookUpValue  : WideString;
                                Const pdblcCriterioLookUpValue  : WideString;
                                pdbrValorBaseValue              : Double ) : WordBool; SafeCall;
    Function  CadGruposInclui(const pNOMEGRUPOORCAMEN: WideString;
                              const pFLGSINALGRUPO: WideString; const pFLGRESULTADO: WideString;
                              const pFLGANALSINT: WideString; const pCODGRUPOORC: WideString): WordBool; safecall;
    Function  CadGruposAltera(const pNOMEGRUPOORCAMEN: WideString;
                              const pFLGSINALGRUPO: WideString; const pFLGRESULTADO: WideString;
                              const pFLGANALSINT: WideString; const pCODGRUPOORC: WideString;
                              pIDGRUPOORCAMEN: Double): WordBool; safecall;
    Function  CadGruposExclui(pIDGRUPOORCAMEN: Double): WordBool; safecall;
    Function  GeraDadosIniciaGeracao(const pdblkExerciciotext: WideString;
                                     prgrpTipoItemIndex: Integer;
                                     const pdblcCenarioText: WideString; psePosIni1Value: Integer;
                                     psePosFim1Value: Integer; const pedConteudo1Text: WideString;
                                     const pdblkExercicioLookupValue: WideString;
                                     const pdblcCenarioLookupValue: WideString;
                                     pcbBuscaSaldoAnteriorChecked: WordBool): WordBool; safecall;
    Function  GeraDadosVerificaPeriodo(pIdEmpresa: Integer; pdblkExercicioVal: Integer;
                     iPeriodoAtu: Integer; const pdblkExercicioText: WideString): WordBool; safecall;

    Function  AtualizaTabela(const pSql: WideString): WordBool; safecall;
    Function  EntCadDadosEspecialInsereEspecial(idcriterioratorc: Integer; idplanoorcamen: Integer;
                                                exercicio: Integer; periodo: Integer;
                                                idpessoa: Integer;
                                                const idcontaorcamen: WideString;
                                                const datareferencia: WideString; vlrrealizado: Double;
                                                vlrorcado: Double; vlrrateioori: Double;
                                                vlrrealacum: Double; vlrorcacum: Double;
                                                percutilrateio: Double): WordBool; safecall;
    Function  EntCadDadosEspecialAltEspecial(idcriterioratorc: Integer; idplanoorcamen: Integer;
                                             idpessoa: Integer; const idcontaorcamen: WideString;
                                             const datareferencia: WideString; vlrorcado: Double;
                                             vlrrateioori: Double; vlrorcacum: Double;
                                             percutilrateio: Double): WordBool; safecall;

    Procedure StartTransactionOrc; SafeCall;
    Procedure CommitOrc; SafeCall;
    Procedure RollBackOrc; SafeCall;
  Public
    { Public declarations }

  End;

Implementation

{$R *.DFM}

class procedure TdtmOrcamentoSrv50.UpdateRegistry(Register: Boolean; const ClassID, ProgID: string);
begin
  if Register then
  begin
    inherited UpdateRegistry(Register, ClassID, ProgID);
    EnableSocketTransport(ClassID);
    EnableWebTransport(ClassID);
  end else
  begin
    DisableSocketTransport(ClassID);
    DisableWebTransport(ClassID);
    inherited UpdateRegistry(Register, ClassID, ProgID);
  end;
end;


function TdtmOrcamentoSrv50.ConectaDB(const UserName, PassWord,
  ServerName: WideString): WordBool;
begin
  Try
    Result := _PadroesSrvr.ConectaDb(UserName, PassWord, ServerName);
    If Not Result Then _MessageInfo := _PadroesSrvr.MessageInfo;
  Except
    On E:Exception Do
    Begin
       Result := False;
       _MessageInfo := E.Message;
    End;
  End;
end;

function TdtmOrcamentoSrv50.GravaLogOperacoes(dIdPessoa, dIdModulo,
  dIdUsuario: Double; const sDescOperacao: WideString): WordBool;
begin
    Result := _PadroesSrvr.GravaLogOperacoes(dIdPessoa, dIdModulo,
            dIdUsuario, sDescOperacao);
end;

function TdtmOrcamentoSrv50.GetDataPacket(
  const sSql: WideString): OleVariant;
begin
    Result := _PadroesSrvr.GetDataPacket(sSql);
end;

function TdtmOrcamentoSrv50.ProcessaPessoaAgencia(Operacao: Integer;
  CdsPessoa, CdsPessoaFisica, CdsDocPessoa, CdsSubTipo, CdsEndPess,
  CdsTelEndPess, CdsContatoPess, CdsTelContato, CdsContaBancaria,
  CdsImagensPessoa, CdsImagensDoc: OleVariant): WordBool;
begin
  Result := _PadroesSrvr.ProcessaPessoaAgencia(Operacao,
            CdsPessoa, CdsPessoaFisica, CdsDocPessoa, CdsSubTipo, CdsEndPess,
            CdsTelEndPess, CdsContatoPess, CdsTelContato, CdsContaBancaria,
            CdsImagensPessoa, CdsImagensDoc)
end;

function TdtmOrcamentoSrv50.ProcessaPessoaBanco(Operacao: Integer;
  CdsPessoa, CdsPessoaFisica, CdsDocPessoa, CdsSubTipo, CdsEndPess,
  CdsTelEndPess, CdsContatoPess, CdsTelContato, CdsContaBancaria,
  CdsImagensPessoa, CdsImagensDoc: OleVariant): WordBool;
begin
    Result := _PadroesSrvr.ProcessaPessoaBanco(Operacao,
              CdsPessoa, CdsPessoaFisica, CdsDocPessoa, CdsSubTipo, CdsEndPess,
              CdsTelEndPess, CdsContatoPess, CdsTelContato, CdsContaBancaria,
              CdsImagensPessoa, CdsImagensDoc);
end;

function TdtmOrcamentoSrv50.ProcessaPessoaCliente(Operacao: Integer;
  CdsPessoa, CdsPessoaFisica, CdsDocPessoa, CdsSubTipo, CdsEndPess,
  CdsTelEndPess, CdsContatoPess, CdsTelContato, CdsContaBancaria,
  CdsImagensPessoa, CdsImagensDoc, CdsEmpresaCliente, CdsTipoRecebCli,
  CdsImAgregCli, CdsTiposCli: OleVariant): WordBool;
begin
    Result := _PadroesSrvr.ProcessaPessoaCliente(Operacao,
              CdsPessoa, CdsPessoaFisica, CdsDocPessoa, CdsSubTipo, CdsEndPess,
              CdsTelEndPess, CdsContatoPess, CdsTelContato, CdsContaBancaria,
              CdsImagensPessoa, CdsImagensDoc, CdsEmpresaCliente, CdsTipoRecebCli,
              CdsImAgregCli, CdsTiposCli)
end;

function TdtmOrcamentoSrv50.ProcessaPessoaForne(Operacao: Integer;
  CdsPessoa, CdsPessoaFisica, CdsDocPessoa, CdsSubTipo, CdsEndPess,
  CdsTelEndPess, CdsContatoPess, CdsTelContato, CdsContaBancaria,
  CdsImagensPessoa, CdsImagensDoc, CdsImAgregForn, CdsEmpresaForn,
  CdsFornXDesemb, CdsFornXRamo: OleVariant): WordBool;
begin
    Result := _PadroesSrvr.ProcessaPessoaForne(Operacao,
              CdsPessoa, CdsPessoaFisica, CdsDocPessoa, CdsSubTipo, CdsEndPess,
              CdsTelEndPess, CdsContatoPess, CdsTelContato, CdsContaBancaria,
              CdsImagensPessoa, CdsImagensDoc, CdsImAgregForn, CdsEmpresaForn,
              CdsFornXDesemb, CdsFornXRamo);
end;

function TdtmOrcamentoSrv50.ExecSqlAndCommit(
  const sSql: WideString): WordBool;
begin
    Result := _PadroesSrvr.ExecSqlAndCommit(sSql);
end;

function TdtmOrcamentoSrv50.ProcessaMensagem(CdsMensagem: OleVariant;
  iOperacaoMensage, IdMensagem: Integer): WordBool;
begin
    Result := _PadroesSrvr.ProcessaMensagem(CdsMensagem, iOperacaoMensage, IdMensagem);
end;

function TdtmOrcamentoSrv50.GravaHistSenha(
  aCdsHistSenha: OleVariant): WordBool;
begin
    Result := _PadroesSrvr.GravaHistSenha(aCdsHistSenha);
end;

function TdtmOrcamentoSrv50.GetDadosPessoa(rIdPessoa: Double; TipoGetPessoa,
  TipoPessoa: Integer; var ovPessoa, ovPessoaFisica, ovDocPessoa,
  ovEndPess, ovTelEndPess, ovContatoPess, ovTelContato,
  ovContaBancaria, ovImagensPessoa, ovImagensDoc, ovEstado,
  ovNaturalidade, ovBanco, ovDocumento,
  ovTipoDoc: OleVariant): WordBool;
begin
    Result := _PadroesSrvr.GetDadosPessoa(rIdPessoa, TipoGetPessoa,
             TipoPessoa, ovPessoa, ovPessoaFisica, ovDocPessoa,
             ovEndPess, ovTelEndPess, ovContatoPess, ovTelContato,
             ovContaBancaria, ovImagensPessoa, ovImagensDoc, ovEstado,
             ovNaturalidade, ovBanco, ovDocumento,
             ovTipoDoc);
end;

function TdtmOrcamentoSrv50.SelDadosCli(rIdEmpresa, rIdForcli: Double;
  out ovSubTipo, ovEmpresaCliente, ovTipoReceb, ovTipoRecebCli, ovImAgreg,
  ovImAgregCli, ovTipos, ovTiposCli: OleVariant): WordBool;
begin
    Result := _PadroesSrvr.SelDadosCli(rIdEmpresa, rIdForcli, ovSubTipo,
              ovEmpresaCliente, ovTipoReceb, ovTipoRecebCli, ovImAgreg,
              ovImAgregCli, ovTipos, ovTiposCli);
end;

function TdtmOrcamentoSrv50.SelDadosForne(rIdEmpresa, rIdForCli: Double;
  out ovSubTipo, ovEmpresaForne, ovTipoDesemb, ovImAgreg, ovRamoForne,
  ovTipoDesembForn, ovImAgregForn, ovRamoXForne: OleVariant): WordBool;
begin
    Result := _PadroesSrvr.SelDadosForne(rIdEmpresa, rIdForCli,
             ovSubTipo, ovEmpresaForne, ovTipoDesemb, ovImAgreg, ovRamoForne,
             ovTipoDesembForn, ovImAgregForn, ovRamoXForne);
end;

function TdtmOrcamentoSrv50.GetDataPacketTS(lSQL: OleVariant): OleVariant;
begin
    Result := _PadroesSrvr.GetDataPacketTS(lSQL);
end;

function TdtmOrcamentoSrv50.GetContentFile(
  const sFileName: WideString): WideString;
begin
    Result := _PadroesSrvr.GetContentFile(sFileName);
end;

procedure TdtmOrcamentoSrv50.MensagemPadroes(sMens: string);
begin

  _MessageInfo := sMens;
end;

function TdtmOrcamentoSrv50.MessageInfo: WideString;
begin

  Result := _MessageInfo;
end;
function TdtmOrcamentoSrv50.ProcessaWorkFlow(ovWorkflowUsuario, ovWorkflow,
  ovPassoWorkflow: OleVariant; oPeracao: Integer): WordBool;
begin
  Result := _PadroesSrvr.ProcessaWorkFlow(ovWorkflowUsuario, ovWorkflow,
            ovPassoWorkflow, oPeracao);
end;

function TdtmOrcamentoSrv50.ProcessaGrupoUsu(ovDataViewAcesso,
  ovTabelaAcesso, ovColunaAcesso, ovGrupo, ovUsuario, ovPessoa,
  ovGrupoXUsu, ovAutoriza, ovAutorizaRpt, ovAutorizaMS: OleVariant;
  OperacaoProcessa: Integer): WordBool;
begin
  Result := _PadroesSrvr.ProcessaGrupoUsu(ovDataViewAcesso,
            ovTabelaAcesso, ovColunaAcesso, ovGrupo, ovUsuario, ovPessoa,
            ovGrupoXUsu, ovAutoriza, ovAutorizaRpt, ovAutorizaMS, OperacaoProcessa);
end;

function TdtmOrcamentoSrv50.GravarReports(ovCds: OleVariant): WordBool;
begin
  Result := _PadroesSrvr.GravarReports(ovCds);
end;

function TdtmOrcamentoSrv50.ProcurarReports(IdReports,
  OrigemCm: Integer): WordBool;
begin
  Result := _PadroesSrvr.ProcurarReports(IdReports, OrigemCm);
end;

function TdtmOrcamentoSrv50.ProcessaConfig(ovCds, ovCdsReport: OleVariant;
  Operacao: Integer): WordBool;
begin
  Result := _PadroesSrvr.ProcessaConfig(ovCds, ovCdsReport, Operacao);
end;

function TdtmOrcamentoSrv50.ProcessaConfigModelo(
  ovReports: OleVariant): WordBool;
begin
  Result := _PadroesSrvr.ProcessaConfigModelo(ovReports);
end;
//************************************************
Procedure TdtmOrcamentoSrv50.RemoteDataModuleCreate(Sender: TObject);
Begin

  _MessageInfo := '';
  {**
    Gera um DatabaseName diferente para cada aplicação cliente conectada e
    atribui o DatabaseName para algumas queryes
  **}

  TempDir := GeraDataBaseName( Self, DbOrcamento, True, ssnOrcamento );
  {**
    Cria as classes de controle da mesma forma que criadas na aplicação cliente
    só que especificando o connectionSide como servidor.
    Parâmetros como o remote server, connectadab, podem ser passados como default.

    Verificar a nescessidade de eventos de mensagens diferentes para conponentes
    diferentes a criar mais de um MessageInfo, a princípio todos os Controls responde
    sempres ao mesmo MessageInfo
  **}
  _PadroesSrvr := TCtrlPadroesSrvr.Create;
  _PadroesSrvr.Initialize( DbOrcamento, True, cntBde, cnsServer, nil, false, MensagemPadroes, nil, True);

  CtrlPadroes := TCtrlPadroes.Create;
  CtrlPadroes.InitializeAs(_PadroesSrvr);

  CtrlCadCenario := TCtrlCadCenario.Create;
  CtrlCadCenario.InitializeAs(_PadroesSrvr);

  CtrlAlterorcamento := TCtrlAlterorcamento.Create;
  CtrlAlterorcamento.InitializeAs(_PadroesSrvr);

  CtrlCadCenario := TCtrlCadCenario.Create;
  CtrlCadCenario.InitializeAs(_PadroesSrvr);

  CtrlCadContasOrc := TCtrlCadContasOrc.Create;
  CtrlCadContasOrc.InitializeAs(_PadroesSrvr);

  CtrlCadGrupos := TCtrlCadGrupos.Create;
  CtrlCadGrupos.InitializeAs(_PadroesSrvr);

  CtrlCadLayoutOrc := TCtrlCadLayoutOrc.Create;
  CtrlCadLayoutOrc.InitializeAs(_PadroesSrvr);

  CtrlCadTipoCriterioRat := TCtrlCadTipoCriterioRat.Create;
  CtrlCadTipoCriterioRat.InitializeAs(_PadroesSrvr);

  CtrlCadUsuxCResp := TCtrlCadUsuxCResp.Create;
  CtrlCadUsuxCResp.InitializeAs(_PadroesSrvr);

  CtrlCadValCriterioRat := TCtrlCadValCriterioRat.Create;
  CtrlCadValCriterioRat.InitializeAs(_PadroesSrvr);

  CtrlCenarioOrcamen := TCtrlCenarioOrcamen.Create;
  CtrlCenarioOrcamen.InitializeAs(_PadroesSrvr);

  CtrlCompContasOrcamen := TCtrlCompContasOrcamen.Create;
  CtrlCompContasOrcamen.InitializeAs(_PadroesSrvr);

  CtrlContaOrcamentaria := TCtrlContaOrcamentaria.Create;
  CtrlContaOrcamentaria.InitializeAs(_PadroesSrvr);

  CtrlCopiaContaOrcamen := TCtrlCopiaContaOrcamen.Create;
  CtrlCopiaContaOrcamen.InitializeAs(_PadroesSrvr);

  CtrlCriaRelatorio := TCtrlCriaRelatorio.Create;
  CtrlCriaRelatorio.InitializeAs(_PadroesSrvr);

  CtrlDocrecxcomp := TCtrlDocrecxcomp.Create;
  CtrlDocrecxcomp.InitializeAs(_PadroesSrvr);

  CtrlLancamentoorc := TCtrlLancamentoorc.Create;
  CtrlLancamentoorc.InitializeAs(_PadroesSrvr);

  CtrlLinhasRelatOrc := TCtrlLinhasRelatOrc.Create;
  CtrlLinhasRelatOrc.InitializeAs(_PadroesSrvr);

  CtrlParamorcamento := TCtrlParamorcamento.Create;
  CtrlParamorcamento.InitializeAs(_PadroesSrvr);

  CtrlPeriodoOrcamen := TCtrlPeriodoOrcamen.Create;
  CtrlPeriodoOrcamen.InitializeAs(_PadroesSrvr);

  CtrlPlanoOrcamen := TCtrlPlanoOrcamen.Create;
  CtrlPlanoOrcamen.InitializeAs(_PadroesSrvr);

  CtrlPlanoTrabalho := TCtrlPlanoTrabalho.Create;
  CtrlPlanoTrabalho.InitializeAs(_PadroesSrvr);

  CtrlReservaorcamen := TCtrlReservaorcamen.Create;
  CtrlReservaorcamen.InitializeAs(_PadroesSrvr);

  CtrlResxcomp := TCtrlResxcomp.Create;
  CtrlResxcomp.InitializeAs(_PadroesSrvr);

  CtrlSaldoorcado := TCtrlSaldoorcado.Create;
  CtrlSaldoorcado.InitializeAs(_PadroesSrvr);

  CtrlSaldoorcadoant := TCtrlSaldoorcadoant.Create;
  CtrlSaldoorcadoant.InitializeAs(_PadroesSrvr);

  CtrlValorescenario := TCtrlValorescenario.Create;
  CtrlValorescenario.InitializeAs(_PadroesSrvr);

  CtrlGeraDados := TCtrlGeraDados.Create;
  CtrlGeraDados.InitializeAs(_PadroesSrvr);

  CtrlEntCadDadosEspecial := TCtrlEntCadDadosEspecial.Create;
  CtrlEntCadDadosEspecial.InitializeAs(_PadroesSrvr);

  CtrlCadContasOrcPorGrupo := TCtrlCadContasOrcPorGrupo.Create;
  CtrlCadContasOrcPorGrupo.InitializeAs(_PadroesSrvr);
End;
//************************************************
Procedure TdtmOrcamentoSrv50.RemoteDataModuleDestroy(Sender: TObject);

Begin

  _PadroesSrvr.Free;
  CtrlAlterorcamento.Free;
  CtrlCadCenario.Free;
  CtrlCadContasOrc.Free;
  CtrlCadGrupos.Free;;
  CtrlCadLayoutOrc.Free;
  CtrlCadTipoCriterioRat.Free;
  CtrlCadUsuxCResp.Free;
  CtrlCadValCriterioRat.Free;
  CtrlCenarioOrcamen.Free;
  CtrlCompContasOrcamen.Free;
  CtrlContaOrcamentaria.Free;
  CtrlCopiaContaOrcamen.Free;
  CtrlCriaRelatorio.Free;
  CtrlDocrecxcomp.Free;
  CtrlLancamentoorc.Free;
  CtrlLinhasRelatOrc.Free;
  CtrlParamorcamento.Free;
  CtrlPeriodoOrcamen.Free;
  CtrlPlanoOrcamen.Free;
  CtrlPlanoTrabalho.Free;
  CtrlReservaorcamen.Free;
  CtrlResxcomp.Free;
  CtrlSaldoorcado.Free;
  CtrlSaldoorcadoant.Free;
  CtrlValorescenario.Free;
  CtrlGeraDados.Free;
  CtrlEntCadDadosEspecial.Free;
  CtrlCadContasOrcPorGrupo.Free;

  If DbOrcamento.Connected Then DbOrcamento.CLose;
  If ssnOrcamento.Active   Then ssnOrcamento.Close;
End;
//************************************************
Function TdtmOrcamentoSrv50.AplicaOperacaoAlterOrcamento( CdsAlterOrcamentoData: OleVariant ): WordBool;
Begin

  Try
    CtrlAlterorcamento.CdsAlterorcamento.Data := CdsAlterOrcamentoData;
    Result := CtrlAlterorcamento.AplicaOperacaoAlterOrcamento;
    If Not Result Then
      _MessageInfo := CtrlAlterorcamento.MessageInfo;
  Except
    On E:Exception Do
    Begin
      Result := False;
      _MessageInfo := E.Message;
    End;
  End;
End;
//************************************************
Function TdtmOrcamentoSrv50.AplicaOperacaoCadCenario( CdsData : OleVariant ) : WordBool;
Begin
  Try
    CtrlCadCenario.CdsCadCenario.Data := CdsData;
    Result := CtrlCadCenario.AplicaOperacaoCadCenario;

    If Not Result Then
      _MessageInfo := CtrlCadCenario.MessageInfo;
  Except
    On E:Exception Do
    Begin
      Result := False;
      _MessageInfo := E.Message;
    End;
  End;
End;
//************************************************
Function TdtmOrcamentoSrv50.AplicaOperacaoCadContasOrcDelete( CdsMovOrcamentoData,
                                                              CdsTodoDetData,
                                                              CdsData        : OleVariant ) : WordBool;
Begin

  Try
    CtrlCadContasOrc.CdsMovOrcamento.Data := CdsMovOrcamentoData;
    CtrlCadContasOrc.CdsTodoDet.Data      := CdsTodoDetData;
    CtrlCadContasOrc.Cds.Data             := CdsData;

    Result := CtrlCadContasOrc.AplicaOperacaoCadContasOrcDelete;

    If Not Result Then
      _MessageInfo := CtrlCadContasOrc.MessageInfo;
  Except
    On E:Exception Do
    Begin
      Result := False;
      _MessageInfo := E.Message;
    End;
  End;
End;
//************************************************
Function TdtmOrcamentoSrv50.AplicaOperacaoCadContasOrcGravar( CdsData,
                                                              CdsDetData,
                                                              CdsDetContaOrcData,
                                                              CdsDetFluxoData,
                                                              CdsDetContaReaData,
                                                              CdsDetCondData,
                                                              CdsDataViewData  : OleVariant): WordBool;
Begin
  Try
    CtrlCadContasOrc.Cds.Data            := CdsData;
    CtrlCadContasOrc.CdsDet.Data         := CdsDetData;
    CtrlCadContasOrc.CdsDetContaOrc.Data := CdsDetContaOrcData;
    CtrlCadContasOrc.CdsDetFluxo.Data    := CdsDetFluxoData;
    CtrlCadContasOrc.CdsDetContaRea.Data := CdsDetContaReaData;
    CtrlCadContasOrc.CdsDetCond.Data     := CdsDetCondData;
    CtrlCadContasOrc.CdsDataView.Data    := CdsDataViewData;
    
    Result := CtrlCadContasOrc.AplicaOperacaoCadContasOrcGravar;
    If Not Result Then
      _MessageInfo := CtrlCadContasOrc.MessageInfo;
  Except
    On E:Exception Do
    Begin
      Result := False;
      _MessageInfo := E.Message;
    End;
  End;
End;
//************************************************
Function TdtmOrcamentoSrv50.AplicaOperacaoCadGrupos( CdsCadGruposData : OleVariant ) : WordBool;
Begin
{
  Try
    CtrlCadGrupos.CdsCadGrupos.Data := CdsCadGruposData;

    Result := CtrlCadGrupos.AplicaOperacaoCadGrupos;

    If Not Result Then
      _MessageInfo := CtrlCadGrupos.MessageInfo;
  Except
    On E:Exception Do
    Begin
      Result := False;
      _MessageInfo := E.Message;
    End;
  End;
}
End;
//************************************************
Function TdtmOrcamentoSrv50.AplicaOperacaoCadLayOutOrc( CdsData,
                                                        CdsReportsData : OleVariant ) : WordBool;
Begin

  Try
    CtrlCadLayoutOrc.Cds.Data        := CdsData;
    CtrlCadLayoutOrc.CdsReports.Data := CdsReportsData;

    Result := CtrlCadLayoutOrc.AplicaOperacaoCadLayOutOrc;

    If Not Result Then
      _MessageInfo := CtrlCadLayoutOrc.MessageInfo;
  Except
    On E:Exception Do
    Begin
      Result := False;
      _MessageInfo := E.Message;
    End;
  End;
End;
//************************************************
Function TdtmOrcamentoSrv50.AplicaOperacaoCadLayOutOrcDelete( CdsData : OleVariant ) : WordBool;
Begin

  Try
    CtrlCadLayoutOrc.Cds.Data        := CdsData;

    Result := CtrlCadLayoutOrc.AplicaOperacaoCadLayOutOrcDelete;

    If Not Result Then
      _MessageInfo := CtrlCadLayoutOrc.MessageInfo;
  Except
    On E:Exception Do
    Begin
      Result := False;
      _MessageInfo := E.Message;
    End;
  End;
End;
//************************************************
Function TdtmOrcamentoSrv50.AplicaOperacaoCadTipoCriterioRatGravar( CdsCadTipoCriterioRatData,
                                                                    CdsDataViewData : OleVariant ): WordBool;
Begin

  Try
    CtrlCadTipoCriterioRat.CdsCadTipoCriterioRat.Data := CdsCadTipoCriterioRatData;
    CtrlCadTipoCriterioRat.CdsDataView.Data           := CdsDataViewData;

    Result := CtrlCadTipoCriterioRat.AplicaOperacaoCadTipoCriterioRatGravar;

    If Not Result Then
      _MessageInfo := CtrlCadTipoCriterioRat.MessageInfo;
  Except
    On E:Exception Do
    Begin
      Result := False;
      _MessageInfo := E.Message;
    End;
  End;
End;
//************************************************
Function TdtmOrcamentoSrv50.AplicaOperacaoCadTipoCriterioRatDeleta( CdsCadTipoCriterioRatData,
                                                                    CdsDataViewData : OleVariant ): WordBool;
Begin

  Try
    CtrlCadTipoCriterioRat.CdsCadTipoCriterioRat.Data := CdsCadTipoCriterioRatData;
    CtrlCadTipoCriterioRat.CdsDataView.Data           := CdsDataViewData;

    Result := CtrlCadTipoCriterioRat.AplicaOperacaoCadTipoCriterioRatDeleta;

    If Not Result Then
      _MessageInfo := CtrlCadTipoCriterioRat.MessageInfo;
  Except
    On E:Exception Do
    Begin
      Result := False;
      _MessageInfo := E.Message;
    End;
  End;
End;
//************************************************
Function TdtmOrcamentoSrv50.AplicaOperacaoCenarioOrcamen( CdsCenarioOrcamenData : OleVariant ): WordBool;
Begin

  Try
    CtrlCenarioOrcamen.CdsCenarioOrcamen.Data := CdsCenarioOrcamenData;

    Result := CtrlCenarioOrcamen.AplicaOperacaoCenarioOrcamen;

    If Not Result Then
      _MessageInfo := CtrlCenarioOrcamen.MessageInfo;
  Except
    On E:Exception Do
    Begin
      Result := False;
      _MessageInfo := E.Message;
    End;
  End;
End;
//************************************************
Function TdtmOrcamentoSrv50.AplicaOperacaoCompContasOrcamen( CdsCompContasOrcamenData: OleVariant): WordBool;
Begin

  Try
    CtrlCompContasOrcamen.CdsCompContasOrcamen.Data := CdsCompContasOrcamenData;

    Result := CtrlCompContasOrcamen.AplicaOperacaoCompContasOrcamen;

    If Not Result Then
      _MessageInfo := CtrlCompContasOrcamen.MessageInfo;
  Except
    On E:Exception Do
    Begin
      Result := False;
      _MessageInfo := E.Message;
    End;
  End;
End;
//************************************************
Function TdtmOrcamentoSrv50.AplicaOperacaoCompDes( CdsInsCompDesData : OleVariant ) : WordBool;
Begin

  Try
    CtrlCopiaContaOrcamen.CdsInsCompDes.Data := CdsInsCompDesData;

    Result := CtrlCopiaContaOrcamen.AplicaOperacaoCompDes;

    If Not Result Then
      _MessageInfo := CtrlCopiaContaOrcamen.MessageInfo;
  Except
    On E:Exception Do
    Begin
      Result := False;
      _MessageInfo := E.Message;
    End;
  End;
End;
//************************************************
Function TdtmOrcamentoSrv50.AplicaOperacaoContaOrcamen( CdsInsContasDesData : OleVariant ): WordBool;
Var
  Mensagem : String;
Begin

  Try
    Mensagem := '';
    CtrlCopiaContaOrcamen.CdsInsContasDes.Data := CdsInsContasDesData;

    Result := CtrlCopiaContaOrcamen.AplicaOperacaoContaOrcamen( Mensagem );

    If Not Result Then
      _MessageInfo := CtrlCopiaContaOrcamen.MessageInfo;
  Except
    On E:Exception Do
    Begin
      Result := False;
      _MessageInfo := E.Message;
    End;
  End;
End;
//************************************************
Function TdtmOrcamentoSrv50.AplicaOperacaoContaOrcamentaria( CdsContasorcamenData : OleVariant ) : WordBool;
Begin

  Try
    CtrlContaOrcamentaria.CdsContasOrcamen.Data := CdsContasorcamenData;

    Result := CtrlContaOrcamentaria.AplicaOperacaoContaOrcamentaria;

    If Not Result Then
      _MessageInfo := CtrlContaOrcamentaria.MessageInfo;
  Except
    On E:Exception Do
    Begin
      Result := False;
      _MessageInfo := E.Message;
    End;
  End;
End;
//************************************************
Function TdtmOrcamentoSrv50.AplicaOperacaoDocRecXComp( CdsDocRecXCompData : OleVariant ) : WordBool;
Begin

  Try
    CtrlDocRecXComp.CdsDocRecXComp.Data := CdsDocRecXCompData;

    Result := CtrlDocRecXComp.AplicaOperacaoDocRecXComp;

    If Not Result Then
      _MessageInfo := CtrlDocRecXComp.MessageInfo;
  Except
    On E:Exception Do
    Begin
      Result := False;
      _MessageInfo := E.Message;
    End;
  End;
End;
//************************************************
Function TdtmOrcamentoSrv50.AplicaOperacaoLancamentoOrc( CdsLancamentoorcData : OleVariant ) : WordBool;
Begin

  Try
    CtrlLancamentoOrc.CdsLancamentoOrc.Data := CdsLancamentoOrcData;

    Result := CtrlLancamentoOrc.AplicaOperacaoLancamentoOrc;

    If Not Result Then
      _MessageInfo := CtrlLancamentoOrc.MessageInfo;
  Except
    On E:Exception Do
    Begin
      Result := False;
      _MessageInfo := E.Message;
    End;
  End;
End;
//************************************************
Function TdtmOrcamentoSrv50.AplicaOperacaoLinhasRelatOrc( CdsLinhasRelatOrcData : OleVariant ) : WordBool;
Begin

  Try
    CtrlLinhasRelatOrc.CdsLinhasRelatOrc.Data := CdsLinhasRelatOrcData;

    Result := CtrlLinhasRelatOrc.AplicaOperacaoLinhasRelatOrc;

    If Not Result Then
      _MessageInfo := CtrlLinhasRelatOrc.MessageInfo;
  Except
    On E:Exception Do
    Begin
      Result := False;
      _MessageInfo := E.Message;
    End;
  End;
End;
//************************************************
Function TdtmOrcamentoSrv50.AplicaOperacaoLogCenario( CdsLogCenarioData : OleVariant ) : WordBool;
Begin

  Try
    CtrlValoresCenario.CdsLogCenario.Data := CdsLogCenarioData;

    Result := CtrlValoresCenario.AplicaOperacaoLogCenario;

    If Not Result Then
      _MessageInfo := CtrlValoresCenario.MessageInfo;
  Except
    On E:Exception Do
    Begin
      Result := False;
      _MessageInfo := E.Message;
    End;
  End;
End;
//************************************************
Function TdtmOrcamentoSrv50.AplicaOperacaoParamOrcamento( CdsParamOrcamentoData : OleVariant ) : WordBool;
Begin

  Try
    CtrlParamorcamento.CdsParamOrcamento.Data := CdsParamorcamentoData;

    Result := CtrlParamorcamento.AplicaOperacaoParamorcamento;

    If Not Result Then
      _MessageInfo := CtrlParamorcamento.MessageInfo;
  Except
    On E:Exception Do
    Begin
      Result := False;
      _MessageInfo := E.Message;
    End;
  End;
End;
//************************************************
Function TdtmOrcamentoSrv50.AplicaOperacaoPeriodoOrcamen( CdsPeriodoOrcamenData : OleVariant ) : WordBool;
Begin

  Try
    CtrlPeriodoOrcamen.CdsPeriodoOrcamen.Data := CdsPeriodoOrcamenData;

    Result := CtrlPeriodoOrcamen.AplicaOperacaoPeriodoOrcamen;

    If Not Result Then
      _MessageInfo := CtrlPeriodoOrcamen.MessageInfo;
  Except
    On E:Exception Do
    Begin
      Result := False;
      _MessageInfo := E.Message;
    End;
  End;
End;
//************************************************
Function TdtmOrcamentoSrv50.AplicaOperacaoPessoaXCresp( CdsSelecionadosData: OleVariant): WordBool;
Begin

  Try
    CtrlCadUsuxCResp.CdsSelecionados.Data := CdsSelecionadosData;

    Result := CtrlCadUsuxCResp.AplicaOperacaoPessoaXCresp;

    If Not Result Then
      _MessageInfo := CtrlCadUsuxCResp.MessageInfo;
  Except
    On E:Exception Do
    Begin
      Result := False;
      _MessageInfo := E.Message;
    End;
  End;
End;
//************************************************
Function TdtmOrcamentoSrv50.AplicaOperacaoPlanoOrcamen( CdsPlanoOrcamenData : OleVariant ) : WordBool;
Begin

  Try
    CtrlPlanoOrcamen.CdsPlanoOrcamen.Data := CdsPlanoOrcamenData;

    Result := CtrlPlanoOrcamen.AplicaOperacaoPlanoOrcamen;

    If Not Result Then
      _MessageInfo := CtrlPlanoOrcamen.MessageInfo;
  Except
    On E:Exception Do
    Begin
      Result := False;
      _MessageInfo := E.Message;
    End;
  End;
End;
//************************************************
Function TdtmOrcamentoSrv50.AplicaOperacaoPlanoTrabalho( CdsPlanoTrabalhoData : OleVariant ) : WordBool;
Begin

  Try
    CtrlPlanoTrabalho.CdsPlanoTrabalho.Data := CdsPlanoTrabalhoData;

    Result := CtrlPlanoTrabalho.AplicaOperacaoPlanoTrabalho;

    If Not Result Then
      _MessageInfo := CtrlPlanoTrabalho.MessageInfo;
  Except
    On E:Exception Do
    Begin
      Result := False;
      _MessageInfo := E.Message;
    End;
  End;
End;
//************************************************
Function TdtmOrcamentoSrv50.AplicaOperacaoReservaorcamen( CdsReservaOrcamenData : OleVariant ) : WordBool;
Begin

  Try
    CtrlReservaorcamen.CdsReservaOrcamen.Data := CdsReservaOrcamenData;

    Result := CtrlReservaorcamen.AplicaOperacaoReservaOrcamen;

    If Not Result Then
      _MessageInfo := CtrlReservaorcamen.MessageInfo;
  Except
    On E:Exception Do
    Begin
      Result := False;
      _MessageInfo := E.Message;
    End;
  End;
End;
//************************************************
Function TdtmOrcamentoSrv50.AplicaOperacaoResXComp( CdsResXCompData : OleVariant ) : WordBool;
Begin

  Try
    CtrlResXComp.CdsResXComp.Data := CdsResXCompData;

    Result := CtrlResXComp.AplicaOperacaoResXComp;

    If Not Result Then
      _MessageInfo := CtrlResXComp.MessageInfo;
  Except
    On E:Exception Do
    Begin
      Result := False;
      _MessageInfo := E.Message;
    End;
  End;
End;
//************************************************
Function TdtmOrcamentoSrv50.AplicaOperacaoSaldoOrcado( CdsSaldoorcadoData : OleVariant ) : WordBool;
Begin

  Try
    CtrlSaldoOrcado.CdsSaldoOrcado.Data := CdsSaldoOrcadoData;

    Result := CtrlSaldoOrcado.AplicaOperacaoSaldoOrcado;

    If Not Result Then
      _MessageInfo := CtrlSaldoOrcado.MessageInfo;
  Except
    On E:Exception Do
    Begin
      Result := False;
      _MessageInfo := E.Message;
    End;
  End;
End;
//************************************************
Function TdtmOrcamentoSrv50.AplicaOperacaoSaldoOrcadoAnt( CdsSaldoOrcadoAntData : OleVariant ) : WordBool;
Begin

  Try
    CtrlSaldoOrcadoAnt.CdsSaldoOrcadoAnt.Data := CdsSaldoOrcadoAntData;

    Result := CtrlSaldoOrcadoAnt.AplicaOperacaoSaldoOrcadoAnt;

    If Not Result Then
      _MessageInfo := CtrlSaldoOrcadoAnt.MessageInfo;
  Except
    On E:Exception Do
    Begin
      Result := False;
      _MessageInfo := E.Message;
    End;
  End;
End;
//************************************************
Function TdtmOrcamentoSrv50.AplicaOperacaoValorCriRatOrc( CdsValorCriRatOrcData : OleVariant ) : WordBool;
Begin

  Try
    CtrlCadValCriterioRat.CdsValorCriRatOrc.Data := CdsValorCriRatOrcData;

    Result := CtrlCadValCriterioRat.AplicaOperacaoValorCriRatOrc;

    If Not Result Then
      _MessageInfo := CtrlCadValCriterioRat.MessageInfo;
  Except
    On E:Exception Do
    Begin
      Result := False;
      _MessageInfo := E.Message;
    End;
  End;
End;
//************************************************
Function TdtmOrcamentoSrv50.GravarValCriterio( pIdValorCriRatOrc               : Double;
                                pSistemaIdEmpresa               : Integer;
                                Const pdblcExercicioLookUpValue : WideString;
                                Const pdblcPeriodoLookUpValue   : WideString;
                                pSistemaIdPessoa                : Integer;
                                Const pdblcCentCustLookUpValue  : WideString;
                                Const pdblcCriterioLookUpValue  : WideString;
                                pdbrValorBaseValue              : Double ) : WordBool;
Begin
  Try
    Result := CtrlCadValCriterioRat.GravarValCriterio( pIdValorCriRatOrc,
                                                       pSistemaIdEmpresa,
                                                       pdblcExercicioLookUpValue,
                                                       pdblcPeriodoLookUpValue,
                                                       pSistemaIdPessoa,
                                                       pdblcCentCustLookUpValue,
                                                       pdblcCriterioLookUpValue,
                                                       pdbrValorBaseValue );
    If Not Result Then
      _MessageInfo := CtrlCadValCriterioRat.MessageInfo;
  Except
    On E:Exception Do
    Begin
      Result := False;
      _MessageInfo := E.Message;
    End;
  End;
End;
//************************************************
Function TdtmOrcamentoSrv50.AplicaOperacaoValoresCenario( CdsValoresCenarioData : OleVariant ) : WordBool;
Begin

  Try
    CtrlValoresCenario.CdsValoresCenario.Data := CdsValoresCenarioData;

    Result := CtrlValoresCenario.AplicaOperacaoValoresCenario;

    If Not Result Then
      _MessageInfo := CtrlValoresCenario.MessageInfo;
  Except
    On E:Exception Do
    Begin
      Result := False;
      _MessageInfo := E.Message;
    End;
  End;
End;
//************************************************
Function TdtmOrcamentoSrv50.ExcluirCriaRelatorio( CdsCriaRelatorioData,
                                                  CdsLinhasRelatOrcData : OleVariant): WordBool;
Begin

  Try
    CtrlCriaRelatorio.CdsCriaRelatorio.Data :=  CdsCriaRelatorioData;
    CtrlCriaRelatorio.CdsLinhasRelatOrc.Data := CdsLinhasRelatOrcData;

    Result := CtrlCriaRelatorio.ExcluirCriaRelatorio;

    If Not Result Then
      _MessageInfo := CtrlCriaRelatorio.MessageInfo;
  Except
    On E:Exception Do
    Begin
      Result := False;
      _MessageInfo := E.Message;
    End;
  End;
End;
//************************************************
Function TdtmOrcamentoSrv50.GravarCriaRelatorio(CdsCriaRelatoriodata,
  CdsLinhasRelatOrcData: OleVariant): WordBool;
Begin

  Try
    CtrlCriaRelatorio.CdsCriaRelatorio.Data :=  CdsCriaRelatorioData;
    CtrlCriaRelatorio.CdsLinhasRelatOrc.Data := CdsLinhasRelatOrcData;

    Result := CtrlCriaRelatorio.GravarCriaRelatorio;

    If Not Result Then
      _MessageInfo := CtrlCriaRelatorio.MessageInfo;
  Except
    On E:Exception Do
    Begin
      Result := False;
      _MessageInfo := E.Message;
    End;
  End;
End;
//************************************************
Procedure TdtmOrcamentoSrv50.StartTransactionOrc;
Begin

  CtrlContaOrcamentaria.StartTransactionOrc;
End;
//************************************************
Procedure TdtmOrcamentoSrv50.CommitOrc;
Begin

  CtrlContaOrcamentaria.CommitOrc;
End;
//************************************************
Procedure TdtmOrcamentoSrv50.RollBackOrc;
Begin

  CtrlContaOrcamentaria.RollBackOrc;
End;
//************************************************
Function TdtmOrcamentoSrv50.GravaLogOperacoesOrc( pIdEmpresa,
                                                  pIdModulo,
                                                  pIdUsuario : Integer;
                                                  Const pLog       : WideString ) : WordBool;
Begin

  Result := CtrlPadroes.GravaLogOperacoes( pIdEmpresa, pIdModulo, pIdUsuario,
                                           pLog,       False );
End;
//************************************************
Function TdtmOrcamentoSrv50.CadGruposInclui(const pNOMEGRUPOORCAMEN: WideString;
                              const pFLGSINALGRUPO: WideString; const pFLGRESULTADO: WideString;
                              const pFLGANALSINT: WideString; const pCODGRUPOORC: WideString): WordBool;
Begin
  Try
    Result := CtrlCadGrupos.CadGruposInclui( pNOMEGRUPOORCAMEN,
                                             pFLGSINALGRUPO,
                                             pFLGRESULTADO,
                                             pFLGANALSINT,
                                             pCODGRUPOORC );
    If Not Result Then
      _MessageInfo := CtrlCadGrupos.MessageInfo;
  Except
    On E:Exception Do
    Begin
      Result := False;
      _MessageInfo := E.Message;
    End;
  End;
End;
//************************************************
Function TdtmOrcamentoSrv50.CadGruposAltera(const pNOMEGRUPOORCAMEN: WideString;
                              const pFLGSINALGRUPO: WideString; const pFLGRESULTADO: WideString;
                              const pFLGANALSINT: WideString; const pCODGRUPOORC: WideString;
                              pIDGRUPOORCAMEN: Double): WordBool;
Begin
  Try
    Result := CtrlCadGrupos.CadGruposAltera( pNOMEGRUPOORCAMEN,
                                             pFLGSINALGRUPO,
                                             pFLGRESULTADO,
                                             pFLGANALSINT,
                                             pCODGRUPOORC,
                                             pIDGRUPOORCAMEN );
    If Not Result Then
      _MessageInfo := CtrlCadGrupos.MessageInfo;
  Except
    On E:Exception Do
    Begin
      Result := False;
      _MessageInfo := E.Message;
    End;
  End;
End;
//************************************************
Function TdtmOrcamentoSrv50.CadGruposExclui(pIDGRUPOORCAMEN: Double): WordBool;
Begin
  Try
    Result := CtrlCadGrupos.CadGruposExclui( pIDGRUPOORCAMEN );
    If Not Result Then
      _MessageInfo := CtrlCadGrupos.MessageInfo;
  Except
    On E:Exception Do
    Begin
      Result := False;
      _MessageInfo := E.Message;
    End;
  End;
End;
//************************************************
Function TdtmOrcamentoSrv50.GeraDadosIniciaGeracao(const pdblkExerciciotext: WideString;
                                     prgrpTipoItemIndex: Integer;
                                     const pdblcCenarioText: WideString; psePosIni1Value: Integer;
                                     psePosFim1Value: Integer; const pedConteudo1Text: WideString;
                                     const pdblkExercicioLookupValue: WideString;
                                     const pdblcCenarioLookupValue: WideString;
                                     pcbBuscaSaldoAnteriorChecked: WordBool): WordBool;
Begin
  Try
    Result := CtrlGeraDados.IniciaGeracao( pdblkExerciciotext,
                                           prgrpTipoItemIndex,
                                           pdblcCenarioText,
                                           psePosIni1Value,
                                           psePosFim1Value,
                                           pedConteudo1Text,
                                           pdblkExercicioLookupValue,
                                           pdblcCenarioLookupValue,
                                           pcbBuscaSaldoAnteriorChecked );

    If Not Result Then
      _MessageInfo := CtrlGeraDados.MessageInfo;
  Except
    On E:Exception Do
    Begin
      Result := False;
      _MessageInfo := E.Message;
    End;
  End;
End;
//************************************************
Function TdtmOrcamentoSrv50.GeraDadosVerificaPeriodo(pIdEmpresa: Integer; pdblkExercicioVal: Integer;
                                       iPeriodoAtu: Integer; const pdblkExercicioText: WideString): WordBool;
Begin
  Try
    Result := CtrlGeraDados.VerificaPeriodo( pIdEmpresa,
                                   pdblkExercicioVal,
                                   iPeriodoAtu,
                                   pdblkExerciciotext );
  Except
    On E:Exception Do Begin
      _MessageInfo := E.Message;
      Result := False;
    End;
  End;
End;
//************************************************
Function  TdtmOrcamentoSrv50.AtualizaTabela(const pSql: WideString): WordBool;
Begin
  Try
    Result := CtrlGeraDados.AtualizaTabela( pSql );
  Except
    On E:Exception Do Begin
      _MessageInfo := E.Message;
      Result := False;
    End;
  End;
End;
//************************************************
Function  TdtmOrcamentoSrv50.EntCadDadosEspecialInsereEspecial(idcriterioratorc: Integer; idplanoorcamen: Integer;
                                                exercicio: Integer; periodo: Integer;
                                                idpessoa: Integer;
                                                const idcontaorcamen: WideString;
                                                const datareferencia: WideString; vlrrealizado: Double;
                                                vlrorcado: Double; vlrrateioori: Double;
                                                vlrrealacum: Double; vlrorcacum: Double;
                                                percutilrateio: Double) : WordBool;
Begin
  Try
    Result := CtrlEntCadDadosEspecial.InsereEspecial( idcriterioratorc,
                                                      idplanoorcamen,
                                                      exercicio,
                                                      periodo,
                                                      idpessoa,
                                                      idcontaorcamen,
                                                      datareferencia,
                                                      vlrrealizado,
                                                      vlrorcado,
                                                      vlrrateioori,
                                                      vlrrealacum,
                                                      vlrorcacum,
                                                      percutilrateio );
  Except
    On E:Exception Do Begin
      _MessageInfo := E.Message;
      Result := False;
    End;
  End;
End;
//************************************************
Function  TdtmOrcamentoSrv50.EntCadDadosEspecialAltEspecial(idcriterioratorc: Integer; idplanoorcamen: Integer;
                                             idpessoa: Integer; const idcontaorcamen: WideString;
                                             const datareferencia: WideString; vlrorcado: Double;
                                             vlrrateioori: Double; vlrorcacum: Double;
                                             percutilrateio: Double) : WordBool;
Begin

  Try
    Result := CtrlEntCadDadosEspecial.AltEspecial( idcriterioratorc,
                                                   idplanoorcamen,
                                                   idpessoa,
                                                   idcontaorcamen,
                                                   datareferencia,
                                                   vlrorcado,
                                                   vlrrateioori,
                                                   vlrorcacum,
                                                   percutilrateio );
  Except
    On E:Exception Do Begin
      _MessageInfo := E.Message;
      Result := False;
    End;
  End;
End;
//************************************************
Initialization
  TComponentFactory.Create( ComServer,
                            TdtmOrcamentoSrv50,
                            Class_Orcamento,
                            ciMultiInstance,
                            tmApartment );
End.

