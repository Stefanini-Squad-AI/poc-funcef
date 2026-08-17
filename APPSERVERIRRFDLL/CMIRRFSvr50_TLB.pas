unit CMIRRFSvr50_TLB;

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
// File generated on 02/10/2002 16:29:05 from Type Library described below.

// ************************************************************************ //
// Type Lib: C:\ProjetosCM5\AppServerIRRFDLL\CMIRRFSvr50.tlb (1)
// IID\LCID: {DD372AA6-1D4F-4677-8CDB-629E84B01A86}\0
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
  CMIRRFSvr50MajorVersion = 1;
  CMIRRFSvr50MinorVersion = 0;

  LIBID_CMIRRFSvr50: TGUID = '{DD372AA6-1D4F-4677-8CDB-629E84B01A86}';

  IID_IIRRF: TGUID = '{5239B7CF-8DC5-40D2-AE4D-FCC6F7225E0E}';
  CLASS_IRRF: TGUID = '{39B3FAE7-53C8-48FE-929B-2A21415A1BB5}';
type

// *********************************************************************//
// Forward declaration of types defined in TypeLibrary                    
// *********************************************************************//
  IIRRF = interface;
  IIRRFDisp = dispinterface;

// *********************************************************************//
// Declaration of CoClasses defined in Type Library                       
// (NOTE: Here we map each CoClass to its Default Interface)              
// *********************************************************************//
  IRRF = IIRRF;


// *********************************************************************//
// Interface: IIRRF
// Flags:     (4416) Dual OleAutomation Dispatchable
// GUID:      {5239B7CF-8DC5-40D2-AE4D-FCC6F7225E0E}
// *********************************************************************//
  IIRRF = interface(IAppServer)
    ['{5239B7CF-8DC5-40D2-AE4D-FCC6F7225E0E}']
    function  ConectaDB(const Usuario: WideString; const Senha: WideString; const Alias: WideString): WordBool; safecall;
    function  MessageInfo: WideString; safecall;
    function  GetDataPacket(const Ssql: WideString): OleVariant; safecall;
    function  GravarParamIRRF(DataParamIRRF: OleVariant): WordBool; safecall;
    function  ExcluirLancIRRF(DataLancIRRF: OleVariant; DataLancxInforme: OleVariant): WordBool; safecall;
    function  Deletar(IdLancIRRF: Integer; bPrincipal: WordBool): WordBool; safecall;
    function  GravarIRRF(IdPessoa: Integer; UsaPlanoPatro: WordBool; ICodDocumento: Integer; 
                         IEmpresaProp: Integer; IBenef: Integer; const sCodNatureza: WideString; 
                         const sDataLanc: WideString; rValBase: Currency; rValIRRF: Currency; 
                         rValINSS: Currency; rValPIS: Currency; rValRef: Currency; 
                         rPercIRRF: Currency; DataInf: OleVariant; var ICodLanc: Double; 
                         const sContaContabil: WideString; IPlano: Integer; 
                         const sFlgFolha: WideString; iIdPlanoPrev: Integer; iIdPatro: Integer; 
                         iIdPrograma: Integer; var bPrimVez: WordBool; iIdModulo: Integer; 
                         iIdMotivo: Integer; const sCodCentroCusto: WideString; 
                         iIdVersaoFolha: Integer; rValIOF: Integer): WordBool; safecall;
    function  GravarDarf(DataDarf: OleVariant): WordBool; safecall;
    function  GravarDocumento(DataDocumento: OleVariant; DataLancamentos: OleVariant; 
                              DataRateios: OleVariant; const Operacao: WideString; 
                              EspAcesso: Integer; IdUsuario: Integer): WordBool; safecall;
    function  IncluirRateio(DataRateio: OleVariant): WordBool; safecall;
    function  IncluirLancamento(DataLancamento: OleVariant): WordBool; safecall;
    function  ExcluirLancamento(CodDocumento: Integer; NumLancto: Integer): WordBool; safecall;
    function  AtualizaLancIRRF(IdDarf: Integer): WordBool; safecall;
    function  AtualizaLanc(IdDarf: Integer): WordBool; safecall;
    function  PegaId(const Tabela: WideString): Integer; safecall;
    function  PegaCountLancIRRF(IdDarf: Integer): Integer; safecall;
    function  BuscaIOF(IdEmpresa: Integer; const DataIni: WideString; const DataFim: WideString; 
                       const sNaturezaMantido: WideString; UsaPlanoPatro: WordBool; 
                       bPrimVez: WordBool): WordBool; safecall;
    function  BuscaIRRF(DataNatureza: OleVariant; DataInforme: OleVariant; 
                        DataParamIRRF: OleVariant; IdEmpresa: Integer; const RecPag: WideString; 
                        const DataIni: WideString; const DataFim: WideString; IdModulo: Integer; 
                        UsaPlanoPatro: WordBool; SoEmpresaProp: WordBool): WordBool; safecall;
    function  ExcluirCAPCAR(DataLancamentos: OleVariant; EspAcesso: Integer; IdUsuario: Integer): WordBool; safecall;
    function  GravaCAPCAR(IdPessoa: Integer; Agrupa: Integer; CodForINSS: Integer; 
                          SubConta: Integer; FormaPG: Integer; IdModulo: Integer; 
                          IdUsuario: Integer; TipoDoc: Integer; EspAcesso: Integer; 
                          DataLancamentos: OleVariant; const CentroCusto: WideString; 
                          const TipoDesemb: WideString; const sDataVenc: WideString; Plano: Integer): WordBool; safecall;
    function  GravaCAP(rTotalRateio: Currency; rTotalValor: Currency; const sDataLanc: WideString; 
                       const sContaC: WideString; const CentroCusto: WideString; 
                       const TipoDesemb: WideString; const sDataVenc: WideString; 
                       CodForINSS: Integer; SubConta: Integer; FormaPG: Integer; IdModulo: Integer; 
                       IdUsuario: Integer; IdPessoa: Integer; TipoDoc: Integer; EspAcesso: Integer; 
                       Plano: Integer): WordBool; safecall;
    function  GeraDArf(IdPessoa: Integer; IdModulo: Integer; IdUsuario: Integer; 
                       IdEspAcesso: Integer; DataRateio: OleVariant; DataLancamentos: OleVariant; 
                       DataCodigos: OleVariant; const DataIni: WideString; 
                       const DataFim: WideString; const DataVenc: WideString; 
                       const Obs: WideString; const Referencia: WideString; UsaPlanoPatro: WordBool): WordBool; safecall;
    function  GravaCAPDARF(IdPessoa: Integer; IdModulo: Integer; IcodDarf: Integer; 
                           IdUsuario: Integer; IdEspAcesso: Integer; 
                           const sCodNatureza: WideString; const DataIni: WideString; 
                           const DataFim: WideString; const DataVenc: WideString; 
                           const Obs: WideString; const Referencia: WideString; 
                           rValorDarf: Currency; UsaPlanoPatro: WordBool): WordBool; safecall;
    function  GeraFolha(IdEmpresa: Integer; iSistema: Integer; const sCodigoFolhaInv: WideString; 
                        const MesCobranca: WideString; const sCodigoFolhaVal: WideString; 
                        const CodNatureza: WideString; const sMolestiaGrava: WideString; 
                        const sAcima65: WideString; const sNaturendMantido: WideString; 
                        const sLinhaInforme: WideString; const sNatRendPIS: WideString; 
                        UsaPlanoPatro: WordBool; iHistRubSal: WordBool; DataMantido: OleVariant; 
                        const DataIni: WideString): WordBool; safecall;
    function  GravarInforme(DataInforme: OleVariant): WordBool; safecall;
    function  GravarIRRFPF(DataIRRFPF: OleVariant): WordBool; safecall;
    function  GravaNaturendimento(DataNaturendimento: OleVariant): WordBool; safecall;
    function  GravaRubricaxInforme(DataRubricaxInforme: OleVariant): WordBool; safecall;
    function  AplicaAlteracoesAlterador(DataAltxImpostos: OleVariant): WordBool; safecall;
    function  GravarDarfLanc(IdPessoa: Integer; IcodDarf: Integer; iLancIRRF: Integer; 
                             const sDataIni: WideString; const sDataFim: WideString; 
                             const sDataVenc: WideString; const sFolha: WideString; 
                             DataCodigo: OleVariant): WordBool; safecall;
    function  GetDataPacketTS(Ssql: OleVariant): OleVariant; safecall;
    function  ExecutarSQL(const Ssql: WideString): WordBool; safecall;
    function  GravaLogOperacoes(dIdPessoa: Double; dIdModulo: Double; dIdUsuario: Double; 
                                const sDescOperacao: WideString): WordBool; safecall;
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
    function  ExecSqlAndCommit(const Ssql: WideString): WordBool; safecall;
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
    function  GetContentFile(const sFileName: WideString): WideString; safecall;
    function  AtualizaIRRF(IdBenef: Integer; IdModulo: Integer; const CodNatureza: WideString): WordBool; safecall;
    function  ProcessaConfig(OvCds: OleVariant; OvCdsReport: OleVariant; Operacao: Integer): WordBool; safecall;
    function  ProcessaWorkFlow(ovWorkflowUsuario: OleVariant; ovWorkflow: OleVariant; 
                               ovPassoWorkflow: OleVariant; Operacao: Integer): WordBool; safecall;
    function  ProcessaGrupoUsu(ovDataViewAcesso: OleVariant; ovTabelaAcesso: OleVariant; 
                               ovColunaAcesso: OleVariant; ovGrupo: OleVariant; 
                               ovUsuario: OleVariant; ovPessoa: OleVariant; 
                               ovGrupoXUsu: OleVariant; ovAutoriza: OleVariant; 
                               ovAutorizaRpt: OleVariant; ovAutorizaMS: OleVariant; 
                               OperacaoProcessa: Integer): WordBool; safecall;
    function  GravarReports(ovCds: OleVariant): WordBool; safecall;
    function  ProcurarReports(IdReports: Integer; OrigemCm: Integer): WordBool; safecall;
    function  ProcessaConfigModelo(ovReports: OleVariant): WordBool; safecall;
  end;

// *********************************************************************//
// DispIntf:  IIRRFDisp
// Flags:     (4416) Dual OleAutomation Dispatchable
// GUID:      {5239B7CF-8DC5-40D2-AE4D-FCC6F7225E0E}
// *********************************************************************//
  IIRRFDisp = dispinterface
    ['{5239B7CF-8DC5-40D2-AE4D-FCC6F7225E0E}']
    function  ConectaDB(const Usuario: WideString; const Senha: WideString; const Alias: WideString): WordBool; dispid 1;
    function  MessageInfo: WideString; dispid 2;
    function  GetDataPacket(const Ssql: WideString): OleVariant; dispid 3;
    function  GravarParamIRRF(DataParamIRRF: OleVariant): WordBool; dispid 4;
    function  ExcluirLancIRRF(DataLancIRRF: OleVariant; DataLancxInforme: OleVariant): WordBool; dispid 5;
    function  Deletar(IdLancIRRF: Integer; bPrincipal: WordBool): WordBool; dispid 6;
    function  GravarIRRF(IdPessoa: Integer; UsaPlanoPatro: WordBool; ICodDocumento: Integer; 
                         IEmpresaProp: Integer; IBenef: Integer; const sCodNatureza: WideString; 
                         const sDataLanc: WideString; rValBase: Currency; rValIRRF: Currency; 
                         rValINSS: Currency; rValPIS: Currency; rValRef: Currency; 
                         rPercIRRF: Currency; DataInf: OleVariant; var ICodLanc: Double; 
                         const sContaContabil: WideString; IPlano: Integer; 
                         const sFlgFolha: WideString; iIdPlanoPrev: Integer; iIdPatro: Integer; 
                         iIdPrograma: Integer; var bPrimVez: WordBool; iIdModulo: Integer; 
                         iIdMotivo: Integer; const sCodCentroCusto: WideString; 
                         iIdVersaoFolha: Integer; rValIOF: Integer): WordBool; dispid 7;
    function  GravarDarf(DataDarf: OleVariant): WordBool; dispid 8;
    function  GravarDocumento(DataDocumento: OleVariant; DataLancamentos: OleVariant; 
                              DataRateios: OleVariant; const Operacao: WideString; 
                              EspAcesso: Integer; IdUsuario: Integer): WordBool; dispid 9;
    function  IncluirRateio(DataRateio: OleVariant): WordBool; dispid 10;
    function  IncluirLancamento(DataLancamento: OleVariant): WordBool; dispid 11;
    function  ExcluirLancamento(CodDocumento: Integer; NumLancto: Integer): WordBool; dispid 12;
    function  AtualizaLancIRRF(IdDarf: Integer): WordBool; dispid 13;
    function  AtualizaLanc(IdDarf: Integer): WordBool; dispid 14;
    function  PegaId(const Tabela: WideString): Integer; dispid 15;
    function  PegaCountLancIRRF(IdDarf: Integer): Integer; dispid 16;
    function  BuscaIOF(IdEmpresa: Integer; const DataIni: WideString; const DataFim: WideString; 
                       const sNaturezaMantido: WideString; UsaPlanoPatro: WordBool; 
                       bPrimVez: WordBool): WordBool; dispid 17;
    function  BuscaIRRF(DataNatureza: OleVariant; DataInforme: OleVariant; 
                        DataParamIRRF: OleVariant; IdEmpresa: Integer; const RecPag: WideString; 
                        const DataIni: WideString; const DataFim: WideString; IdModulo: Integer; 
                        UsaPlanoPatro: WordBool; SoEmpresaProp: WordBool): WordBool; dispid 18;
    function  ExcluirCAPCAR(DataLancamentos: OleVariant; EspAcesso: Integer; IdUsuario: Integer): WordBool; dispid 19;
    function  GravaCAPCAR(IdPessoa: Integer; Agrupa: Integer; CodForINSS: Integer; 
                          SubConta: Integer; FormaPG: Integer; IdModulo: Integer; 
                          IdUsuario: Integer; TipoDoc: Integer; EspAcesso: Integer; 
                          DataLancamentos: OleVariant; const CentroCusto: WideString; 
                          const TipoDesemb: WideString; const sDataVenc: WideString; Plano: Integer): WordBool; dispid 20;
    function  GravaCAP(rTotalRateio: Currency; rTotalValor: Currency; const sDataLanc: WideString; 
                       const sContaC: WideString; const CentroCusto: WideString; 
                       const TipoDesemb: WideString; const sDataVenc: WideString; 
                       CodForINSS: Integer; SubConta: Integer; FormaPG: Integer; IdModulo: Integer; 
                       IdUsuario: Integer; IdPessoa: Integer; TipoDoc: Integer; EspAcesso: Integer; 
                       Plano: Integer): WordBool; dispid 21;
    function  GeraDArf(IdPessoa: Integer; IdModulo: Integer; IdUsuario: Integer; 
                       IdEspAcesso: Integer; DataRateio: OleVariant; DataLancamentos: OleVariant; 
                       DataCodigos: OleVariant; const DataIni: WideString; 
                       const DataFim: WideString; const DataVenc: WideString; 
                       const Obs: WideString; const Referencia: WideString; UsaPlanoPatro: WordBool): WordBool; dispid 22;
    function  GravaCAPDARF(IdPessoa: Integer; IdModulo: Integer; IcodDarf: Integer; 
                           IdUsuario: Integer; IdEspAcesso: Integer; 
                           const sCodNatureza: WideString; const DataIni: WideString; 
                           const DataFim: WideString; const DataVenc: WideString; 
                           const Obs: WideString; const Referencia: WideString; 
                           rValorDarf: Currency; UsaPlanoPatro: WordBool): WordBool; dispid 23;
    function  GeraFolha(IdEmpresa: Integer; iSistema: Integer; const sCodigoFolhaInv: WideString; 
                        const MesCobranca: WideString; const sCodigoFolhaVal: WideString; 
                        const CodNatureza: WideString; const sMolestiaGrava: WideString; 
                        const sAcima65: WideString; const sNaturendMantido: WideString; 
                        const sLinhaInforme: WideString; const sNatRendPIS: WideString; 
                        UsaPlanoPatro: WordBool; iHistRubSal: WordBool; DataMantido: OleVariant; 
                        const DataIni: WideString): WordBool; dispid 24;
    function  GravarInforme(DataInforme: OleVariant): WordBool; dispid 25;
    function  GravarIRRFPF(DataIRRFPF: OleVariant): WordBool; dispid 26;
    function  GravaNaturendimento(DataNaturendimento: OleVariant): WordBool; dispid 27;
    function  GravaRubricaxInforme(DataRubricaxInforme: OleVariant): WordBool; dispid 28;
    function  AplicaAlteracoesAlterador(DataAltxImpostos: OleVariant): WordBool; dispid 30;
    function  GravarDarfLanc(IdPessoa: Integer; IcodDarf: Integer; iLancIRRF: Integer; 
                             const sDataIni: WideString; const sDataFim: WideString; 
                             const sDataVenc: WideString; const sFolha: WideString; 
                             DataCodigo: OleVariant): WordBool; dispid 31;
    function  GetDataPacketTS(Ssql: OleVariant): OleVariant; dispid 32;
    function  ExecutarSQL(const Ssql: WideString): WordBool; dispid 33;
    function  GravaLogOperacoes(dIdPessoa: Double; dIdModulo: Double; dIdUsuario: Double; 
                                const sDescOperacao: WideString): WordBool; dispid 36;
    function  ProcessaPessoaForne(Operacao: Integer; CdsPessoa: OleVariant; 
                                  CdsPessoaFisica: OleVariant; CdsDocPessoa: OleVariant; 
                                  CdsSubTipo: OleVariant; CdsEndPess: OleVariant; 
                                  CdsTelEndPess: OleVariant; CdsContatoPess: OleVariant; 
                                  CdsTelContato: OleVariant; CdsContaBancaria: OleVariant; 
                                  CdsImagensPessoa: OleVariant; CdsImagensDoc: OleVariant; 
                                  CdsImAgregForn: OleVariant; CdsEmpresaForn: OleVariant; 
                                  CdsFornXDesemb: OleVariant; CdsFornXRamo: OleVariant): WordBool; dispid 37;
    function  ProcessaPessoaCliente(Operacao: Integer; CdsPessoa: OleVariant; 
                                    CdsPessoaFisica: OleVariant; CdsDocPessoa: OleVariant; 
                                    CdsSubTipo: OleVariant; CdsEndPess: OleVariant; 
                                    CdsTelEndPess: OleVariant; CdsContatoPess: OleVariant; 
                                    CdsTelContato: OleVariant; CdsContaBancaria: OleVariant; 
                                    CdsImagensPessoa: OleVariant; CdsImagensDoc: OleVariant; 
                                    CdsEmpresaCliente: OleVariant; CdsTipoRecebCli: OleVariant; 
                                    CdsImAgregCli: OleVariant; CdsTiposCli: OleVariant): WordBool; dispid 39;
    function  ProcessaPessoaAgencia(Operacao: Integer; CdsPessoa: OleVariant; 
                                    CdsPessoaFisica: OleVariant; CdsDocPessoa: OleVariant; 
                                    CdsSubTipo: OleVariant; CdsEndPess: OleVariant; 
                                    CdsTelEndPess: OleVariant; CdsContatoPess: OleVariant; 
                                    CdsTelContato: OleVariant; CdsContaBancaria: OleVariant; 
                                    CdsImagensPessoa: OleVariant; CdsImagensDoc: OleVariant): WordBool; dispid 41;
    function  ProcessaPessoaBanco(Operacao: Integer; CdsPessoa: OleVariant; 
                                  CdsPessoaFisica: OleVariant; CdsDocPessoa: OleVariant; 
                                  CdsSubTipo: OleVariant; CdsEndPess: OleVariant; 
                                  CdsTelEndPess: OleVariant; CdsContatoPess: OleVariant; 
                                  CdsTelContato: OleVariant; CdsContaBancaria: OleVariant; 
                                  CdsImagensPessoa: OleVariant; CdsImagensDoc: OleVariant): WordBool; dispid 43;
    function  ExecSqlAndCommit(const Ssql: WideString): WordBool; dispid 45;
    function  ProcessaMensagem(CdsMensagem: OleVariant; iOperacaoMensage: Integer; 
                               IdMensagem: Integer): WordBool; dispid 47;
    function  GravaHistSenha(aCdsHistSenha: OleVariant): WordBool; dispid 50;
    function  GetDadosPessoa(rIdPessoa: Double; TipoGetPessoa: Integer; TipoPessoa: Integer; 
                             var ovPessoa: OleVariant; var ovPessoaFisica: OleVariant; 
                             var ovDocPessoa: OleVariant; var ovEndPess: OleVariant; 
                             var ovTelEndPess: OleVariant; var ovContatoPess: OleVariant; 
                             var ovTelContato: OleVariant; var ovContaBancaria: OleVariant; 
                             var ovImagensPessoa: OleVariant; var ovImagensDoc: OleVariant; 
                             var ovEstado: OleVariant; var ovNaturalidade: OleVariant; 
                             var ovBanco: OleVariant; var ovDocumento: OleVariant; 
                             var ovTipoDoc: OleVariant): WordBool; dispid 52;
    function  SelDadosCli(rIdEmpresa: Double; rIdForcli: Double; out ovSubTipo: OleVariant; 
                          out ovEmpresaCliente: OleVariant; out ovTipoReceb: OleVariant; 
                          out ovTipoRecebCli: OleVariant; out ovImAgreg: OleVariant; 
                          out ovImAgregCli: OleVariant; out ovTipos: OleVariant; 
                          out ovTiposCli: OleVariant): WordBool; dispid 54;
    function  SelDadosForne(rIdEmpresa: Double; rIdForcli: Double; out ovSubTipo: OleVariant; 
                            out ovEmpresaForne: OleVariant; out ovTipoDesemb: OleVariant; 
                            out ovImAgreg: OleVariant; out ovRamoForne: OleVariant; 
                            out ovTipoDesembForn: OleVariant; out ovImAgregForn: OleVariant; 
                            out ovRamoXForne: OleVariant): WordBool; dispid 56;
    function  GetContentFile(const sFileName: WideString): WideString; dispid 58;
    function  AtualizaIRRF(IdBenef: Integer; IdModulo: Integer; const CodNatureza: WideString): WordBool; dispid 34;
    function  ProcessaConfig(OvCds: OleVariant; OvCdsReport: OleVariant; Operacao: Integer): WordBool; dispid 65;
    function  ProcessaWorkFlow(ovWorkflowUsuario: OleVariant; ovWorkflow: OleVariant; 
                               ovPassoWorkflow: OleVariant; Operacao: Integer): WordBool; dispid 60;
    function  ProcessaGrupoUsu(ovDataViewAcesso: OleVariant; ovTabelaAcesso: OleVariant; 
                               ovColunaAcesso: OleVariant; ovGrupo: OleVariant; 
                               ovUsuario: OleVariant; ovPessoa: OleVariant; 
                               ovGrupoXUsu: OleVariant; ovAutoriza: OleVariant; 
                               ovAutorizaRpt: OleVariant; ovAutorizaMS: OleVariant; 
                               OperacaoProcessa: Integer): WordBool; dispid 61;
    function  GravarReports(ovCds: OleVariant): WordBool; dispid 66;
    function  ProcurarReports(IdReports: Integer; OrigemCm: Integer): WordBool; dispid 67;
    function  ProcessaConfigModelo(ovReports: OleVariant): WordBool; dispid 68;
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
// The Class CoIRRF provides a Create and CreateRemote method to          
// create instances of the default interface IIRRF exposed by              
// the CoClass IRRF. The functions are intended to be used by             
// clients wishing to automate the CoClass objects exposed by the         
// server of this typelibrary.                                            
// *********************************************************************//
  CoIRRF = class
    class function Create: IIRRF;
    class function CreateRemote(const MachineName: string): IIRRF;
  end;

implementation

uses ComObj;

class function CoIRRF.Create: IIRRF;
begin
  Result := CreateComObject(CLASS_IRRF) as IIRRF;
end;

class function CoIRRF.CreateRemote(const MachineName: string): IIRRF;
begin
  Result := CreateRemoteComObject(MachineName, CLASS_IRRF) as IIRRF;
end;

end.
