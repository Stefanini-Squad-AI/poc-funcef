unit OrcamentoSvr50_TLB;

// ************************************************************************ //
// WARNING                                                                    
// -------                                                                    
// The types declared in this file were generated from data read from a       
// Type Library. If this type library is explicitly or indirectly (via        
// another type library referring to this type library) re-imported, or the   
// 'Refresh' command of the Type Library Editor activated while editing the   
// Type Library, the contents of this file will be regenerated and all        
// manual modifications will be lost.                                         
// ************************************************************************ //

// PASTLWTR : $Revision:   1.88.1.0.1.0  $
// File generated on 10/02/2003 10:34:50 from Type Library described below.

// ************************************************************************ //
// Type Lib: C:\ProjetosCM5\AppServerOrcamento\OrcamentoSvr50.tlb (1)
// IID\LCID: {BCEED78B-15F4-4891-8D0F-F1D78F25B612}\0
// Helpfile: 
// DepndLst: 
//   (1) v1.0 Midas, (C:\WINNT\System32\midas.dll)
//   (2) v2.0 stdole, (C:\WINNT\System32\stdole2.tlb)
//   (3) v4.0 StdVCL, (C:\WINNT\System32\STDVCL40.DLL)
// ************************************************************************ //
{$TYPEDADDRESS OFF} // Unit must be compiled without type-checked pointers. 
interface

uses Windows, ActiveX, Classes, Graphics, OleServer, OleCtrls, StdVCL, 
  MIDAS;

// *********************************************************************//
// GUIDS declared in the TypeLibrary. Following prefixes are used:        
//   Type Libraries     : LIBID_xxxx                                      
//   CoClasses          : CLASS_xxxx                                      
//   DISPInterfaces     : DIID_xxxx                                       
//   Non-DISP interfaces: IID_xxxx                                        
// *********************************************************************//
const
  // TypeLibrary Major and minor versions
  OrcamentoSvr50MajorVersion = 1;
  OrcamentoSvr50MinorVersion = 0;

  LIBID_OrcamentoSvr50: TGUID = '{BCEED78B-15F4-4891-8D0F-F1D78F25B612}';

  IID_IOrcamentoSrv50: TGUID = '{D472E692-899F-4F65-A15D-2F1569C90952}';
  CLASS_Orcamento: TGUID = '{376987BE-79C4-46AA-999B-4BFC223CA5AE}';
type

// *********************************************************************//
// Forward declaration of types defined in TypeLibrary                    
// *********************************************************************//
  IOrcamentoSrv50 = interface;
  IOrcamentoSrv50Disp = dispinterface;

// *********************************************************************//
// Declaration of CoClasses defined in Type Library                       
// (NOTE: Here we map each CoClass to its Default Interface)              
// *********************************************************************//
  Orcamento = IOrcamentoSrv50;


// *********************************************************************//
// Interface: IOrcamentoSrv50
// Flags:     (4416) Dual OleAutomation Dispatchable
// GUID:      {D472E692-899F-4F65-A15D-2F1569C90952}
// *********************************************************************//
  IOrcamentoSrv50 = interface(IAppServer)
    ['{D472E692-899F-4F65-A15D-2F1569C90952}']
    function  ConectaDB(const UserName: WideString; const PassWord: WideString; 
                        const ServerName: WideString): WordBool; safecall;
    function  MessageInfo: WideString; safecall;
    function  GravaLogOperacoes(dIdPessoa: Double; dIdModulo: Double; dIdUsuario: Double; 
                                const sDescOperacao: WideString): WordBool; safecall;
    function  GetDataPacket(const sSql: WideString): OleVariant; safecall;
    function  ProcessaPessoaForne(Operacao: Integer; CdsPessoa: OleVariant; 
                                  CdsPessoaFisica: OleVariant; CdsDocPessoa: OleVariant; 
                                  CdsSubTipo: OleVariant; CdsEndPess: OleVariant; 
                                  CdsTelEndPess: OleVariant; CdsContatoPess: OleVariant; 
                                  CdsTelContato: OleVariant; CdsContaBancaria: OleVariant; 
                                  CdsImagensPessoa: OleVariant; CdsImagensDoc: OleVariant; 
                                  CdsImAgregForn: OleVariant; CdsEmpresaForn: OleVariant; 
                                  CdsFornXDesemb: OleVariant; CdsFornXRamo: OleVariant): WordBool; safecall;
    function  ProcessaPessoaCliente(Operacao: Integer; CdsPessoa: OleVariant; 
                                    CdsPessoaFisica: OleVariant; CdsDocPessoa: OleVariant; 
                                    CdsSubTipo: OleVariant; CdsEndPess: OleVariant; 
                                    CdsTelEndPess: OleVariant; CdsContatoPess: OleVariant; 
                                    CdsTelContato: OleVariant; CdsContaBancaria: OleVariant; 
                                    CdsImagensPessoa: OleVariant; CdsImagensDoc: OleVariant; 
                                    CdsEmpresaCliente: OleVariant; CdsTipoRecebCli: OleVariant; 
                                    CdsImAgregCli: OleVariant; CdsTiposCli: OleVariant): WordBool; safecall;
    function  ProcessaPessoaAgencia(Operacao: Integer; CdsPessoa: OleVariant; 
                                    CdsPessoaFisica: OleVariant; CdsDocPessoa: OleVariant; 
                                    CdsSubTipo: OleVariant; CdsEndPess: OleVariant; 
                                    CdsTelEndPess: OleVariant; CdsContatoPess: OleVariant; 
                                    CdsTelContato: OleVariant; CdsContaBancaria: OleVariant; 
                                    CdsImagensPessoa: OleVariant; CdsImagensDoc: OleVariant): WordBool; safecall;
    function  ProcessaPessoaBanco(Operacao: Integer; CdsPessoa: OleVariant; 
                                  CdsPessoaFisica: OleVariant; CdsDocPessoa: OleVariant; 
                                  CdsSubTipo: OleVariant; CdsEndPess: OleVariant; 
                                  CdsTelEndPess: OleVariant; CdsContatoPess: OleVariant; 
                                  CdsTelContato: OleVariant; CdsContaBancaria: OleVariant; 
                                  CdsImagensPessoa: OleVariant; CdsImagensDoc: OleVariant): WordBool; safecall;
    function  ExecSqlAndCommit(const sSql: WideString): WordBool; safecall;
    function  ProcessaMensagem(CdsMensagem: OleVariant; iOperacaoMensage: Integer; 
                               IdMensagem: Integer): WordBool; safecall;
    function  GravaHistSenha(aCdsHistSenha: OleVariant): WordBool; safecall;
    function  GetDadosPessoa(rIdPessoa: Double; TipoGetPessoa: Integer; TipoPessoa: Integer; 
                             var ovPessoa: OleVariant; var ovPessoaFisica: OleVariant; 
                             var ovDocPessoa: OleVariant; var ovEndPess: OleVariant; 
                             var ovTelEndPess: OleVariant; var ovContatoPess: OleVariant; 
                             var ovTelContato: OleVariant; var ovContaBancaria: OleVariant; 
                             var ovImagensPessoa: OleVariant; var ovImagensDoc: OleVariant; 
                             var ovEstado: OleVariant; var ovNaturalidade: OleVariant; 
                             var ovBanco: OleVariant; var ovDocumento: OleVariant; 
                             var ovTipoDoc: OleVariant): WordBool; safecall;
    function  SelDadosCli(rIdEmpresa: Double; rIdForcli: Double; out ovSubTipo: OleVariant; 
                          out ovEmpresaCliente: OleVariant; out ovTipoReceb: OleVariant; 
                          out ovTipoRecebCli: OleVariant; out ovImAgreg: OleVariant; 
                          out ovImAgregCli: OleVariant; out ovTipos: OleVariant; 
                          out ovTiposCli: OleVariant): WordBool; safecall;
    function  SelDadosForne(rIdEmpresa: Double; rIdForcli: Double; out ovSubTipo: OleVariant; 
                            out ovEmpresaForne: OleVariant; out ovTipoDesemb: OleVariant; 
                            out ovImAgreg: OleVariant; out ovRamoForne: OleVariant; 
                            out ovTipoDesembForn: OleVariant; out ovImAgregForn: OleVariant; 
                            out ovRamoXForne: OleVariant): WordBool; safecall;
    function  GetDataPacketTS(lSQL: OleVariant): OleVariant; safecall;
    function  GetContentFile(const sFileName: WideString): WideString; safecall;
    function  AplicaOperacaoCadCenario(CdsData: OleVariant): WordBool; safecall;
    function  AplicaOperacaoAlterOrcamento(CdsAlterOrcamentoData: OleVariant): WordBool; safecall;
    function  AplicaOperacaoSaldoOrcadoAnt(CdsSaldoOrcadoAntData: OleVariant): WordBool; safecall;
    function  AplicaOperacaoSaldoOrcado(CdsSaldoOrcadoData: OleVariant): WordBool; safecall;
    function  AplicaOperacaoResXComp(CdsResXCompData: OleVariant): WordBool; safecall;
    function  AplicaOperacaoReservaOrcamen(CdsReservaOrcamenData: OleVariant): WordBool; safecall;
    function  AplicaOperacaoPlanoTrabalho(CdsPlanoTrabalhoData: OleVariant): WordBool; safecall;
    function  AplicaOperacaoPlanoOrcamen(CdsPlanoOrcamenData: OleVariant): WordBool; safecall;
    function  AplicaOperacaoPeriodoOrcamen(CdsPeriodoOrcamenData: OleVariant): WordBool; safecall;
    function  AplicaOperacaoParamOrcamento(CdsParamOrcamentoData: OleVariant): WordBool; safecall;
    function  AplicaOperacaoLinhasRelatOrc(CdsLinhasRelatOrcData: OleVariant): WordBool; safecall;
    function  AplicaOperacaoLancamentoOrc(CdsLinhasRelatOrcData: OleVariant): WordBool; safecall;
    function  AplicaOperacaoDocRecXComp(CdsDocRecXCompData: OleVariant): WordBool; safecall;
    function  GravarCriaRelatorio(CdsCriaRelatorioData: OleVariant; 
                                  CdsLinhasRelatOrcData: OleVariant): WordBool; safecall;
    function  ExcluirCriaRelatorio(CdsCriaRelatorioData: OleVariant; 
                                   CdsLinhasRelatOrcData: OleVariant): WordBool; safecall;
    function  AplicaOperacaoContaOrcamen(CdsInsContasDesData: OleVariant): WordBool; safecall;
    function  AplicaOperacaoCompDes(CdsInsCompDesData: OleVariant): WordBool; safecall;
    function  AplicaOperacaoContaOrcamentaria(CdsContasOrcamenData: OleVariant): WordBool; safecall;
    function  AplicaOperacaoCompContasOrcamen(CdsCompContasOrcamenData: OleVariant): WordBool; safecall;
    function  AplicaOperacaoCenarioOrcamen(CdsCenarioOrcamenData: OleVariant): WordBool; safecall;
    function  AplicaOperacaoValorCriRatOrc(CdsValorCriRatOrcData: OleVariant): WordBool; safecall;
    function  AplicaOperacaoPessoaXCResp(CdsSelecionaDados: OleVariant): WordBool; safecall;
    function  AplicaOperacaoCadTipoCriterioRatDeleta(CdsCadTipoCriterioRatData: OleVariant; 
                                                     CdsDataViewData: OleVariant): WordBool; safecall;
    function  AplicaOperacaoCadTipoCriterioRatGravar(CdsCadTipoCriterioRatData: OleVariant; 
                                                     CdsDataViewData: OleVariant): WordBool; safecall;
    function  AplicaOperacaoCadLayOutOrc(CdsData: OleVariant; CdsReportsData: OleVariant): WordBool; safecall;
    function  AplicaOperacaoCadGrupos(CdsCadGruposData: OleVariant): WordBool; safecall;
    function  AplicaOperacaoCadContasOrcDelete(CdsMovOrcamentoData: OleVariant; 
                                               CdsTodoDetData: OleVariant; CdsData: OleVariant): WordBool; safecall;
    function  AplicaOperacaoCadContasOrcGravar(CdsData: OleVariant; CdsDetData: OleVariant; 
                                               CdsDetContaOrcData: OleVariant; 
                                               CdsDetFluxoData: OleVariant; 
                                               CdsDetContaReaData: OleVariant; 
                                               CdsDetcondData: OleVariant; 
                                               CdsDataViewData: OleVariant): WordBool; safecall;
    function  AplicaOperacaoValoresCenario(CdsValoresCenarioData: OleVariant): WordBool; safecall;
    function  AplicaOperacaoLogCenario(CdsLogCenarioData: OleVariant): WordBool; safecall;
    procedure StartTransactionOrc; safecall;
    procedure CommitOrc; safecall;
    procedure RollBackOrc; safecall;
    function  GravaLogOperacoesOrc(pIdEmpresa: Integer; pIdModulo: Integer; pIdUsuario: Integer; 
                                   const pLog: WideString): WordBool; safecall;
    function  ProcessaGrupoUsu(ovDataViewAcesso: OleVariant; ovTabelaAcesso: OleVariant; 
                               ovColunaAcesso: OleVariant; ovGrupo: OleVariant; 
                               ovUsuario: OleVariant; ovPessoa: OleVariant; 
                               ovGrupoXUsu: OleVariant; ovAutoriza: OleVariant; 
                               ovAutorizaRpt: OleVariant; ovAutorizaMS: OleVariant; 
                               OperacaoProcessa: Integer): WordBool; safecall;
    function  ProcessaWorkFlow(ovWorkflowUsuario: OleVariant; ovWorkflow: OleVariant; 
                               ovPassoWorkflow: OleVariant; Operacao: Integer): WordBool; safecall;
    function  GravarReports(ovCds: OleVariant): WordBool; safecall;
    function  ProcurarReports(IdReports: Integer; OrigemCm: Integer): WordBool; safecall;
    function  ProcessaConfig(ovCds: OleVariant; ovCdsReport: OleVariant; Operacao: Integer): WordBool; safecall;
    function  ProcessaConfigModelo(ovReports: OleVariant): WordBool; safecall;
    function  GravarValCriterio(pIdValorCriRatOrc: Double; pSistemaIdEmpresa: Integer; 
                                const pdblcExercicioLookUpValue: WideString; 
                                const pdblcPeriodoLookUpValue: WideString; 
                                pSistemaIdPessoa: Integer; 
                                const pdblcCentCustLookUpValue: WideString; 
                                const pdblcCriterioLookUpValue: WideString; 
                                pdbrValorBaseValue: Double): WordBool; safecall;
    function  CadGruposInclui(const pNOMEGRUPOORCAMEN: WideString; 
                              const pFLGSINALGRUPO: WideString; const pFLGRESULTADO: WideString; 
                              const pFLGANALSINT: WideString; const pCODGRUPOORC: WideString): WordBool; safecall;
    function  CadGruposAltera(const pNOMEGRUPOORCAMEN: WideString; 
                              const pFLGSINALGRUPO: WideString; const pFLGRESULTADO: WideString; 
                              const pFLGANALSINT: WideString; const pCODGRUPOORC: WideString; 
                              pIDGRUPOORCAMEN: Double): WordBool; safecall;
    function  CadGruposExclui(pIDGRUPOORCAMEN: Double): WordBool; safecall;
    function  GeraDadosIniciaGeracao(const pdblkExerciciotext: WideString; 
                                     prgrpTipoItemIndex: Integer; 
                                     const pdblcCenarioText: WideString; psePosIni1Value: Integer; 
                                     psePosFim1Value: Integer; const pedConteudo1Text: WideString; 
                                     const pdblkExercicioLookupValue: WideString; 
                                     const pdblcCenarioLookupValue: WideString; 
                                     pcbBuscaSaldoAnteriorChecked: WordBool): WordBool; safecall;
    function  GeraDadosVerificaPeriodo(pIdEmpresa: Integer; pdblkExercicioVal: Integer; 
                                       iPeriodoAtu: Integer; const pdblkExerciciotext: WideString): WordBool; safecall;
    function  AtualizaTabela(const pSql: WideString): WordBool; safecall;
    function  EntCadDadosEspecialInsereEspecial(idcriterioratorc: Integer; idplanoorcamen: Integer; 
                                                exercicio: Integer; periodo: Integer; 
                                                idpessoa: Integer; 
                                                const idcontaorcamen: WideString; 
                                                const datareferencia: WideString; 
                                                vlrrealizado: Double; vlrorcado: Double; 
                                                vlrrateioori: Double; vlrrealacum: Double; 
                                                vlrorcacum: Double; percutilrateio: Double): WordBool; safecall;
    function  EntCadDadosEspecialAltEspecial(idcriterioratorc: Integer; idplanoorcamen: Integer; 
                                             idpessoa: Integer; const idcontaorcamen: WideString; 
                                             const datareferencia: WideString; vlrorcado: Double; 
                                             vlrrateioori: Double; vlrorcacum: Double; 
                                             percutilrateio: Double): WordBool; safecall;
    function  AplicaOperacaoCadLayOutOrcDelete(CdsData: OleVariant): WordBool; safecall;
  end;

// *********************************************************************//
// DispIntf:  IOrcamentoSrv50Disp
// Flags:     (4416) Dual OleAutomation Dispatchable
// GUID:      {D472E692-899F-4F65-A15D-2F1569C90952}
// *********************************************************************//
  IOrcamentoSrv50Disp = dispinterface
    ['{D472E692-899F-4F65-A15D-2F1569C90952}']
    function  ConectaDB(const UserName: WideString; const PassWord: WideString; 
                        const ServerName: WideString): WordBool; dispid 1;
    function  MessageInfo: WideString; dispid 2;
    function  GravaLogOperacoes(dIdPessoa: Double; dIdModulo: Double; dIdUsuario: Double; 
                                const sDescOperacao: WideString): WordBool; dispid 3;
    function  GetDataPacket(const sSql: WideString): OleVariant; dispid 4;
    function  ProcessaPessoaForne(Operacao: Integer; CdsPessoa: OleVariant; 
                                  CdsPessoaFisica: OleVariant; CdsDocPessoa: OleVariant; 
                                  CdsSubTipo: OleVariant; CdsEndPess: OleVariant; 
                                  CdsTelEndPess: OleVariant; CdsContatoPess: OleVariant; 
                                  CdsTelContato: OleVariant; CdsContaBancaria: OleVariant; 
                                  CdsImagensPessoa: OleVariant; CdsImagensDoc: OleVariant; 
                                  CdsImAgregForn: OleVariant; CdsEmpresaForn: OleVariant; 
                                  CdsFornXDesemb: OleVariant; CdsFornXRamo: OleVariant): WordBool; dispid 5;
    function  ProcessaPessoaCliente(Operacao: Integer; CdsPessoa: OleVariant; 
                                    CdsPessoaFisica: OleVariant; CdsDocPessoa: OleVariant; 
                                    CdsSubTipo: OleVariant; CdsEndPess: OleVariant; 
                                    CdsTelEndPess: OleVariant; CdsContatoPess: OleVariant; 
                                    CdsTelContato: OleVariant; CdsContaBancaria: OleVariant; 
                                    CdsImagensPessoa: OleVariant; CdsImagensDoc: OleVariant; 
                                    CdsEmpresaCliente: OleVariant; CdsTipoRecebCli: OleVariant; 
                                    CdsImAgregCli: OleVariant; CdsTiposCli: OleVariant): WordBool; dispid 6;
    function  ProcessaPessoaAgencia(Operacao: Integer; CdsPessoa: OleVariant; 
                                    CdsPessoaFisica: OleVariant; CdsDocPessoa: OleVariant; 
                                    CdsSubTipo: OleVariant; CdsEndPess: OleVariant; 
                                    CdsTelEndPess: OleVariant; CdsContatoPess: OleVariant; 
                                    CdsTelContato: OleVariant; CdsContaBancaria: OleVariant; 
                                    CdsImagensPessoa: OleVariant; CdsImagensDoc: OleVariant): WordBool; dispid 7;
    function  ProcessaPessoaBanco(Operacao: Integer; CdsPessoa: OleVariant; 
                                  CdsPessoaFisica: OleVariant; CdsDocPessoa: OleVariant; 
                                  CdsSubTipo: OleVariant; CdsEndPess: OleVariant; 
                                  CdsTelEndPess: OleVariant; CdsContatoPess: OleVariant; 
                                  CdsTelContato: OleVariant; CdsContaBancaria: OleVariant; 
                                  CdsImagensPessoa: OleVariant; CdsImagensDoc: OleVariant): WordBool; dispid 8;
    function  ExecSqlAndCommit(const sSql: WideString): WordBool; dispid 9;
    function  ProcessaMensagem(CdsMensagem: OleVariant; iOperacaoMensage: Integer; 
                               IdMensagem: Integer): WordBool; dispid 10;
    function  GravaHistSenha(aCdsHistSenha: OleVariant): WordBool; dispid 11;
    function  GetDadosPessoa(rIdPessoa: Double; TipoGetPessoa: Integer; TipoPessoa: Integer; 
                             var ovPessoa: OleVariant; var ovPessoaFisica: OleVariant; 
                             var ovDocPessoa: OleVariant; var ovEndPess: OleVariant; 
                             var ovTelEndPess: OleVariant; var ovContatoPess: OleVariant; 
                             var ovTelContato: OleVariant; var ovContaBancaria: OleVariant; 
                             var ovImagensPessoa: OleVariant; var ovImagensDoc: OleVariant; 
                             var ovEstado: OleVariant; var ovNaturalidade: OleVariant; 
                             var ovBanco: OleVariant; var ovDocumento: OleVariant; 
                             var ovTipoDoc: OleVariant): WordBool; dispid 12;
    function  SelDadosCli(rIdEmpresa: Double; rIdForcli: Double; out ovSubTipo: OleVariant; 
                          out ovEmpresaCliente: OleVariant; out ovTipoReceb: OleVariant; 
                          out ovTipoRecebCli: OleVariant; out ovImAgreg: OleVariant; 
                          out ovImAgregCli: OleVariant; out ovTipos: OleVariant; 
                          out ovTiposCli: OleVariant): WordBool; dispid 13;
    function  SelDadosForne(rIdEmpresa: Double; rIdForcli: Double; out ovSubTipo: OleVariant; 
                            out ovEmpresaForne: OleVariant; out ovTipoDesemb: OleVariant; 
                            out ovImAgreg: OleVariant; out ovRamoForne: OleVariant; 
                            out ovTipoDesembForn: OleVariant; out ovImAgregForn: OleVariant; 
                            out ovRamoXForne: OleVariant): WordBool; dispid 14;
    function  GetDataPacketTS(lSQL: OleVariant): OleVariant; dispid 15;
    function  GetContentFile(const sFileName: WideString): WideString; dispid 16;
    function  AplicaOperacaoCadCenario(CdsData: OleVariant): WordBool; dispid 17;
    function  AplicaOperacaoAlterOrcamento(CdsAlterOrcamentoData: OleVariant): WordBool; dispid 18;
    function  AplicaOperacaoSaldoOrcadoAnt(CdsSaldoOrcadoAntData: OleVariant): WordBool; dispid 19;
    function  AplicaOperacaoSaldoOrcado(CdsSaldoOrcadoData: OleVariant): WordBool; dispid 21;
    function  AplicaOperacaoResXComp(CdsResXCompData: OleVariant): WordBool; dispid 22;
    function  AplicaOperacaoReservaOrcamen(CdsReservaOrcamenData: OleVariant): WordBool; dispid 23;
    function  AplicaOperacaoPlanoTrabalho(CdsPlanoTrabalhoData: OleVariant): WordBool; dispid 24;
    function  AplicaOperacaoPlanoOrcamen(CdsPlanoOrcamenData: OleVariant): WordBool; dispid 25;
    function  AplicaOperacaoPeriodoOrcamen(CdsPeriodoOrcamenData: OleVariant): WordBool; dispid 26;
    function  AplicaOperacaoParamOrcamento(CdsParamOrcamentoData: OleVariant): WordBool; dispid 27;
    function  AplicaOperacaoLinhasRelatOrc(CdsLinhasRelatOrcData: OleVariant): WordBool; dispid 28;
    function  AplicaOperacaoLancamentoOrc(CdsLinhasRelatOrcData: OleVariant): WordBool; dispid 29;
    function  AplicaOperacaoDocRecXComp(CdsDocRecXCompData: OleVariant): WordBool; dispid 30;
    function  GravarCriaRelatorio(CdsCriaRelatorioData: OleVariant; 
                                  CdsLinhasRelatOrcData: OleVariant): WordBool; dispid 31;
    function  ExcluirCriaRelatorio(CdsCriaRelatorioData: OleVariant; 
                                   CdsLinhasRelatOrcData: OleVariant): WordBool; dispid 32;
    function  AplicaOperacaoContaOrcamen(CdsInsContasDesData: OleVariant): WordBool; dispid 33;
    function  AplicaOperacaoCompDes(CdsInsCompDesData: OleVariant): WordBool; dispid 20;
    function  AplicaOperacaoContaOrcamentaria(CdsContasOrcamenData: OleVariant): WordBool; dispid 34;
    function  AplicaOperacaoCompContasOrcamen(CdsCompContasOrcamenData: OleVariant): WordBool; dispid 35;
    function  AplicaOperacaoCenarioOrcamen(CdsCenarioOrcamenData: OleVariant): WordBool; dispid 36;
    function  AplicaOperacaoValorCriRatOrc(CdsValorCriRatOrcData: OleVariant): WordBool; dispid 37;
    function  AplicaOperacaoPessoaXCResp(CdsSelecionaDados: OleVariant): WordBool; dispid 38;
    function  AplicaOperacaoCadTipoCriterioRatDeleta(CdsCadTipoCriterioRatData: OleVariant; 
                                                     CdsDataViewData: OleVariant): WordBool; dispid 39;
    function  AplicaOperacaoCadTipoCriterioRatGravar(CdsCadTipoCriterioRatData: OleVariant; 
                                                     CdsDataViewData: OleVariant): WordBool; dispid 40;
    function  AplicaOperacaoCadLayOutOrc(CdsData: OleVariant; CdsReportsData: OleVariant): WordBool; dispid 41;
    function  AplicaOperacaoCadGrupos(CdsCadGruposData: OleVariant): WordBool; dispid 42;
    function  AplicaOperacaoCadContasOrcDelete(CdsMovOrcamentoData: OleVariant; 
                                               CdsTodoDetData: OleVariant; CdsData: OleVariant): WordBool; dispid 43;
    function  AplicaOperacaoCadContasOrcGravar(CdsData: OleVariant; CdsDetData: OleVariant; 
                                               CdsDetContaOrcData: OleVariant; 
                                               CdsDetFluxoData: OleVariant; 
                                               CdsDetContaReaData: OleVariant; 
                                               CdsDetcondData: OleVariant; 
                                               CdsDataViewData: OleVariant): WordBool; dispid 44;
    function  AplicaOperacaoValoresCenario(CdsValoresCenarioData: OleVariant): WordBool; dispid 45;
    function  AplicaOperacaoLogCenario(CdsLogCenarioData: OleVariant): WordBool; dispid 46;
    procedure StartTransactionOrc; dispid 48;
    procedure CommitOrc; dispid 49;
    procedure RollBackOrc; dispid 50;
    function  GravaLogOperacoesOrc(pIdEmpresa: Integer; pIdModulo: Integer; pIdUsuario: Integer; 
                                   const pLog: WideString): WordBool; dispid 52;
    function  ProcessaGrupoUsu(ovDataViewAcesso: OleVariant; ovTabelaAcesso: OleVariant; 
                               ovColunaAcesso: OleVariant; ovGrupo: OleVariant; 
                               ovUsuario: OleVariant; ovPessoa: OleVariant; 
                               ovGrupoXUsu: OleVariant; ovAutoriza: OleVariant; 
                               ovAutorizaRpt: OleVariant; ovAutorizaMS: OleVariant; 
                               OperacaoProcessa: Integer): WordBool; dispid 53;
    function  ProcessaWorkFlow(ovWorkflowUsuario: OleVariant; ovWorkflow: OleVariant; 
                               ovPassoWorkflow: OleVariant; Operacao: Integer): WordBool; dispid 54;
    function  GravarReports(ovCds: OleVariant): WordBool; dispid 55;
    function  ProcurarReports(IdReports: Integer; OrigemCm: Integer): WordBool; dispid 56;
    function  ProcessaConfig(ovCds: OleVariant; ovCdsReport: OleVariant; Operacao: Integer): WordBool; dispid 57;
    function  ProcessaConfigModelo(ovReports: OleVariant): WordBool; dispid 58;
    function  GravarValCriterio(pIdValorCriRatOrc: Double; pSistemaIdEmpresa: Integer; 
                                const pdblcExercicioLookUpValue: WideString; 
                                const pdblcPeriodoLookUpValue: WideString; 
                                pSistemaIdPessoa: Integer; 
                                const pdblcCentCustLookUpValue: WideString; 
                                const pdblcCriterioLookUpValue: WideString; 
                                pdbrValorBaseValue: Double): WordBool; dispid 51;
    function  CadGruposInclui(const pNOMEGRUPOORCAMEN: WideString; 
                              const pFLGSINALGRUPO: WideString; const pFLGRESULTADO: WideString; 
                              const pFLGANALSINT: WideString; const pCODGRUPOORC: WideString): WordBool; dispid 59;
    function  CadGruposAltera(const pNOMEGRUPOORCAMEN: WideString; 
                              const pFLGSINALGRUPO: WideString; const pFLGRESULTADO: WideString; 
                              const pFLGANALSINT: WideString; const pCODGRUPOORC: WideString; 
                              pIDGRUPOORCAMEN: Double): WordBool; dispid 60;
    function  CadGruposExclui(pIDGRUPOORCAMEN: Double): WordBool; dispid 61;
    function  GeraDadosIniciaGeracao(const pdblkExerciciotext: WideString; 
                                     prgrpTipoItemIndex: Integer; 
                                     const pdblcCenarioText: WideString; psePosIni1Value: Integer; 
                                     psePosFim1Value: Integer; const pedConteudo1Text: WideString; 
                                     const pdblkExercicioLookupValue: WideString; 
                                     const pdblcCenarioLookupValue: WideString; 
                                     pcbBuscaSaldoAnteriorChecked: WordBool): WordBool; dispid 63;
    function  GeraDadosVerificaPeriodo(pIdEmpresa: Integer; pdblkExercicioVal: Integer; 
                                       iPeriodoAtu: Integer; const pdblkExerciciotext: WideString): WordBool; dispid 47;
    function  AtualizaTabela(const pSql: WideString): WordBool; dispid 62;
    function  EntCadDadosEspecialInsereEspecial(idcriterioratorc: Integer; idplanoorcamen: Integer; 
                                                exercicio: Integer; periodo: Integer; 
                                                idpessoa: Integer; 
                                                const idcontaorcamen: WideString; 
                                                const datareferencia: WideString; 
                                                vlrrealizado: Double; vlrorcado: Double; 
                                                vlrrateioori: Double; vlrrealacum: Double; 
                                                vlrorcacum: Double; percutilrateio: Double): WordBool; dispid 64;
    function  EntCadDadosEspecialAltEspecial(idcriterioratorc: Integer; idplanoorcamen: Integer; 
                                             idpessoa: Integer; const idcontaorcamen: WideString; 
                                             const datareferencia: WideString; vlrorcado: Double; 
                                             vlrrateioori: Double; vlrorcacum: Double; 
                                             percutilrateio: Double): WordBool; dispid 65;
    function  AplicaOperacaoCadLayOutOrcDelete(CdsData: OleVariant): WordBool; dispid 66;
    function  AS_ApplyUpdates(const ProviderName: WideString; Delta: OleVariant; 
                              MaxErrors: Integer; out ErrorCount: Integer; var OwnerData: OleVariant): OleVariant; dispid 20000000;
    function  AS_GetRecords(const ProviderName: WideString; Count: Integer; out RecsOut: Integer; 
                            Options: Integer; const CommandText: WideString; 
                            var Params: OleVariant; var OwnerData: OleVariant): OleVariant; dispid 20000001;
    function  AS_DataRequest(const ProviderName: WideString; Data: OleVariant): OleVariant; dispid 20000002;
    function  AS_GetProviderNames: OleVariant; dispid 20000003;
    function  AS_GetParams(const ProviderName: WideString; var OwnerData: OleVariant): OleVariant; dispid 20000004;
    function  AS_RowRequest(const ProviderName: WideString; Row: OleVariant; RequestType: Integer; 
                            var OwnerData: OleVariant): OleVariant; dispid 20000005;
    procedure AS_Execute(const ProviderName: WideString; const CommandText: WideString; 
                         var Params: OleVariant; var OwnerData: OleVariant); dispid 20000006;
  end;

// *********************************************************************//
// The Class CoOrcamento provides a Create and CreateRemote method to          
// create instances of the default interface IOrcamentoSrv50 exposed by              
// the CoClass Orcamento. The functions are intended to be used by             
// clients wishing to automate the CoClass objects exposed by the         
// server of this typelibrary.                                            
// *********************************************************************//
  CoOrcamento = class
    class function Create: IOrcamentoSrv50;
    class function CreateRemote(const MachineName: string): IOrcamentoSrv50;
  end;

implementation

uses ComObj;

class function CoOrcamento.Create: IOrcamentoSrv50;
begin
  Result := CreateComObject(CLASS_Orcamento) as IOrcamentoSrv50;
end;

class function CoOrcamento.CreateRemote(const MachineName: string): IOrcamentoSrv50;
begin
  Result := CreateRemoteComObject(MachineName, CLASS_Orcamento) as IOrcamentoSrv50;
end;

end.
