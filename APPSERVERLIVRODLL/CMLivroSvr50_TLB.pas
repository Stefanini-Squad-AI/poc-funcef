unit CMLivroSvr50_TLB;

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
// File generated on 23/10/2002 18:34:36 from Type Library described below.

// ************************************************************************ //
// Type Lib: C:\ProjetosCM5\AppServerLivroDLL\CMLivroSvr50.tlb (1)
// IID\LCID: {8A2B6FBC-1DBE-46D4-AA52-1FA68A8C9E16}\0
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
  CMLivroSvr50MajorVersion = 1;
  CMLivroSvr50MinorVersion = 0;

  LIBID_CMLivroSvr50: TGUID = '{8A2B6FBC-1DBE-46D4-AA52-1FA68A8C9E16}';

  IID_ILivro: TGUID = '{9F8C58A0-07B8-433A-A10B-7EC14F04242B}';
  CLASS_Livro: TGUID = '{0C013E8B-2E60-4214-9FA2-A69C0C15C475}';
type

// *********************************************************************//
// Forward declaration of types defined in TypeLibrary                    
// *********************************************************************//
  ILivro = interface;
  ILivroDisp = dispinterface;

// *********************************************************************//
// Declaration of CoClasses defined in Type Library                       
// (NOTE: Here we map each CoClass to its Default Interface)              
// *********************************************************************//
  Livro = ILivro;


// *********************************************************************//
// Interface: ILivro
// Flags:     (4416) Dual OleAutomation Dispatchable
// GUID:      {9F8C58A0-07B8-433A-A10B-7EC14F04242B}
// *********************************************************************//
  ILivro = interface(IAppServer)
    ['{9F8C58A0-07B8-433A-A10B-7EC14F04242B}']
    function  InserirCiap(CdsCiap: OleVariant): WordBool; safecall;
    function  AlteraCiap(CdsCiap: OleVariant): WordBool; safecall;
    function  ExcluirCiap(CdsCiap: OleVariant): WordBool; safecall;
    function  InserirClasFisc(CdsClasFisc: OleVariant): OleVariant; safecall;
    function  AlterarClasFisc(CdsClasFisc: OleVariant): WordBool; safecall;
    function  ExcluirClasFisc(CdsClasFisc: OleVariant): WordBool; safecall;
    function  InserirModeloNF(CdsModeloNF: OleVariant): WordBool; safecall;
    function  AlterarModeloNF(CdsModeloNF: OleVariant): WordBool; safecall;
    function  ExcluirModeloNF(CdsModeloNF: OleVariant): WordBool; safecall;
    function  InserirEquipamentoECF(CdsEquipamentoECF: OleVariant): WordBool; safecall;
    function  AlterarEquipamentoECF(CdsEquipamentoECF: OleVariant): WordBool; safecall;
    function  ExcluirEquipamentoECF(CdsEquipamentoECF: OleVariant): WordBool; safecall;
    function  InserirTermoLivro(CdsTermoLivro: OleVariant): WordBool; safecall;
    function  AlterarTermoLivro(CdsTermoLivro: OleVariant): WordBool; safecall;
    function  ExcluirTermoLivro(CdsTermoLivro: OleVariant): WordBool; safecall;
    function  AplicaAlteracoesTipoAgre(CdsAltxImpostos: OleVariant): WordBool; safecall;
    function  AplicaAlteracoesAlterador(Cds: OleVariant): WordBool; safecall;
    function  GeraLivro(CdsLancamentos: OleVariant; IdEmpresa: Integer; 
                        const CodModelo: WideString; const CodFiscal: WideString): WordBool; safecall;
    function  GeraCiap(CdsBem: OleVariant; IdPessoa: Integer): WordBool; safecall;
    function  InserirParamLivro(CdsParamLivro: OleVariant): WordBool; safecall;
    function  AlterarParamLivro(CdsParamLivro: OleVariant): WordBool; safecall;
    function  ExcluirParamLivro(CdsParamLivro: OleVariant): WordBool; safecall;
    function  GeraLivroEntrada(CdsRecebeNF: OleVariant; const ModeloNFEntra: WideString; 
                               const ModeloNFFrete: WideString; const ModeloNFDevol: WideString; 
                               IdPessoa: Integer): WordBool; safecall;
    function  GeraLivroISS(CdsNotaVHL: OleVariant; IdEmpresa: Integer; IdHotel: Integer): WordBool; safecall;
    function  GeraLivroISSVHF(CdsNotaFront: OleVariant; IdEmpresa: Integer; IdHotel: Integer): WordBool; safecall;
    function  GravarLivro(CdsLivro: OleVariant; CdsLivroDetalhe: OleVariant): WordBool; safecall;
    function  ExcluirLivro(CdsLivro: OleVariant; CdsLivroDetalhe: OleVariant): WordBool; safecall;
    function  AplicaAlteracoes(Cds: OleVariant): WordBool; safecall;
    function  GravaParamApuracao(Data: OleVariant): WordBool; safecall;
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
    function  PegaIdAltxImposto: Double; safecall;
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
    function  ProcessaConfig(ovCds: OleVariant; ovCdsReport: OleVariant; Operacao: Integer): WordBool; safecall;
    function  ProcessaConfigModelo(ovReports: OleVariant): WordBool; safecall;
    function  GravarApuracaoPis(DataApuracaoPis: OleVariant): WordBool; safecall;
    function  GeraLivroPis(DataLancamentos: OleVariant; IdEmpresa: Integer; 
                           const CodModelo: WideString): WordBool; safecall;
    function  GeraLivroPisVHF(DataNotaFront: OleVariant; IdEmpresa: Integer; IdHotel: Integer): WordBool; safecall;
    function  GeraPisSaidaVHL(DataNotaVHL: OleVariant; IdEmpresa: Integer; IdHotel: Integer): WordBool; safecall;
  end;

// *********************************************************************//
// DispIntf:  ILivroDisp
// Flags:     (4416) Dual OleAutomation Dispatchable
// GUID:      {9F8C58A0-07B8-433A-A10B-7EC14F04242B}
// *********************************************************************//
  ILivroDisp = dispinterface
    ['{9F8C58A0-07B8-433A-A10B-7EC14F04242B}']
    function  InserirCiap(CdsCiap: OleVariant): WordBool; dispid 17;
    function  AlteraCiap(CdsCiap: OleVariant): WordBool; dispid 18;
    function  ExcluirCiap(CdsCiap: OleVariant): WordBool; dispid 19;
    function  InserirClasFisc(CdsClasFisc: OleVariant): OleVariant; dispid 20;
    function  AlterarClasFisc(CdsClasFisc: OleVariant): WordBool; dispid 21;
    function  ExcluirClasFisc(CdsClasFisc: OleVariant): WordBool; dispid 22;
    function  InserirModeloNF(CdsModeloNF: OleVariant): WordBool; dispid 23;
    function  AlterarModeloNF(CdsModeloNF: OleVariant): WordBool; dispid 24;
    function  ExcluirModeloNF(CdsModeloNF: OleVariant): WordBool; dispid 25;
    function  InserirEquipamentoECF(CdsEquipamentoECF: OleVariant): WordBool; dispid 26;
    function  AlterarEquipamentoECF(CdsEquipamentoECF: OleVariant): WordBool; dispid 27;
    function  ExcluirEquipamentoECF(CdsEquipamentoECF: OleVariant): WordBool; dispid 28;
    function  InserirTermoLivro(CdsTermoLivro: OleVariant): WordBool; dispid 29;
    function  AlterarTermoLivro(CdsTermoLivro: OleVariant): WordBool; dispid 30;
    function  ExcluirTermoLivro(CdsTermoLivro: OleVariant): WordBool; dispid 31;
    function  AplicaAlteracoesTipoAgre(CdsAltxImpostos: OleVariant): WordBool; dispid 32;
    function  AplicaAlteracoesAlterador(Cds: OleVariant): WordBool; dispid 33;
    function  GeraLivro(CdsLancamentos: OleVariant; IdEmpresa: Integer; 
                        const CodModelo: WideString; const CodFiscal: WideString): WordBool; dispid 34;
    function  GeraCiap(CdsBem: OleVariant; IdPessoa: Integer): WordBool; dispid 35;
    function  InserirParamLivro(CdsParamLivro: OleVariant): WordBool; dispid 36;
    function  AlterarParamLivro(CdsParamLivro: OleVariant): WordBool; dispid 37;
    function  ExcluirParamLivro(CdsParamLivro: OleVariant): WordBool; dispid 38;
    function  GeraLivroEntrada(CdsRecebeNF: OleVariant; const ModeloNFEntra: WideString; 
                               const ModeloNFFrete: WideString; const ModeloNFDevol: WideString; 
                               IdPessoa: Integer): WordBool; dispid 39;
    function  GeraLivroISS(CdsNotaVHL: OleVariant; IdEmpresa: Integer; IdHotel: Integer): WordBool; dispid 40;
    function  GeraLivroISSVHF(CdsNotaFront: OleVariant; IdEmpresa: Integer; IdHotel: Integer): WordBool; dispid 41;
    function  GravarLivro(CdsLivro: OleVariant; CdsLivroDetalhe: OleVariant): WordBool; dispid 42;
    function  ExcluirLivro(CdsLivro: OleVariant; CdsLivroDetalhe: OleVariant): WordBool; dispid 43;
    function  AplicaAlteracoes(Cds: OleVariant): WordBool; dispid 44;
    function  GravaParamApuracao(Data: OleVariant): WordBool; dispid 45;
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
    function  PegaIdAltxImposto: Double; dispid 46;
    function  ProcessaWorkFlow(ovWorkflowUsuario: OleVariant; ovWorkflow: OleVariant; 
                               ovPassoWorkflow: OleVariant; Operacao: Integer): WordBool; dispid 47;
    function  ProcessaGrupoUsu(ovDataViewAcesso: OleVariant; ovTabelaAcesso: OleVariant; 
                               ovColunaAcesso: OleVariant; ovGrupo: OleVariant; 
                               ovUsuario: OleVariant; ovPessoa: OleVariant; 
                               ovGrupoXUsu: OleVariant; ovAutoriza: OleVariant; 
                               ovAutorizaRpt: OleVariant; ovAutorizaMS: OleVariant; 
                               OperacaoProcessa: Integer): WordBool; dispid 53;
    function  GravarReports(ovCds: OleVariant): WordBool; dispid 54;
    function  ProcurarReports(IdReports: Integer; OrigemCm: Integer): WordBool; dispid 50;
    function  ProcessaConfig(ovCds: OleVariant; ovCdsReport: OleVariant; Operacao: Integer): WordBool; dispid 55;
    function  ProcessaConfigModelo(ovReports: OleVariant): WordBool; dispid 56;
    function  GravarApuracaoPis(DataApuracaoPis: OleVariant): WordBool; dispid 48;
    function  GeraLivroPis(DataLancamentos: OleVariant; IdEmpresa: Integer; 
                           const CodModelo: WideString): WordBool; dispid 49;
    function  GeraLivroPisVHF(DataNotaFront: OleVariant; IdEmpresa: Integer; IdHotel: Integer): WordBool; dispid 51;
    function  GeraPisSaidaVHL(DataNotaVHL: OleVariant; IdEmpresa: Integer; IdHotel: Integer): WordBool; dispid 52;
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
// The Class CoLivro provides a Create and CreateRemote method to          
// create instances of the default interface ILivro exposed by              
// the CoClass Livro. The functions are intended to be used by             
// clients wishing to automate the CoClass objects exposed by the         
// server of this typelibrary.                                            
// *********************************************************************//
  CoLivro = class
    class function Create: ILivro;
    class function CreateRemote(const MachineName: string): ILivro;
  end;

implementation

uses ComObj;

class function CoLivro.Create: ILivro;
begin
  Result := CreateComObject(CLASS_Livro) as ILivro;
end;

class function CoLivro.CreateRemote(const MachineName: string): ILivro;
begin
  Result := CreateRemoteComObject(MachineName, CLASS_Livro) as ILivro;
end;

end.
