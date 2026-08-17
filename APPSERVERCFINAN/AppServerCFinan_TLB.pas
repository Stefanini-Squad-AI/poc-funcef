unit AppServerCFinan_TLB;

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
// File generated on 03/10/2002 11:12:49 from Type Library described below.

// ************************************************************************ //
// Type Lib: C:\ProjetosCM5\AppServerCFinan\AppServerCFinan.tlb (1)
// IID\LCID: {486C7010-0A3F-40A8-B64B-521B204E1816}\0
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
  AppServerCFinanMajorVersion = 1;
  AppServerCFinanMinorVersion = 0;

  LIBID_AppServerCFinan: TGUID = '{486C7010-0A3F-40A8-B64B-521B204E1816}';

  IID_IDmCFinanSrv50: TGUID = '{B26899B8-B997-4308-AD0E-ADF5BAF5C419}';
  CLASS_DmCFinanSrv50: TGUID = '{BE0D13C9-4142-4C83-908B-B2A8E09B33B9}';
type

// *********************************************************************//
// Forward declaration of types defined in TypeLibrary                    
// *********************************************************************//
  IDmCFinanSrv50 = interface;
  IDmCFinanSrv50Disp = dispinterface;

// *********************************************************************//
// Declaration of CoClasses defined in Type Library                       
// (NOTE: Here we map each CoClass to its Default Interface)              
// *********************************************************************//
  DmCFinanSrv50 = IDmCFinanSrv50;


// *********************************************************************//
// Interface: IDmCFinanSrv50
// Flags:     (4416) Dual OleAutomation Dispatchable
// GUID:      {B26899B8-B997-4308-AD0E-ADF5BAF5C419}
// *********************************************************************//
  IDmCFinanSrv50 = interface(IAppServer)
    ['{B26899B8-B997-4308-AD0E-ADF5BAF5C419}']
    function  MessageInfo: WideString; safecall;
    function  ConectaDB(const UserName: WideString; const PassWord: WideString; 
                        const ServerName: WideString): WordBool; safecall;
    function  ExecSqlAndCommit(const sSql: WideString): WordBool; safecall;
    function  GetContentFile(const sFileName: WideString): WideString; safecall;
    function  GetDadosPessoa(rIDPessoa: Double; TipoGetPessoa: Integer; TipoPessoa: Integer; 
                             var ovPessoa: OleVariant; var ovPessoaFisica: OleVariant; 
                             var ovDocPessoa: OleVariant; var ovEndPess: OleVariant; 
                             var ovTelEndPess: OleVariant; var ovContatoPess: OleVariant; 
                             var ovTelContato: OleVariant; var ovContaBancaria: OleVariant; 
                             var ovImagensPessoa: OleVariant; var ovImagensDoc: OleVariant; 
                             var ovEstado: OleVariant; var ovNaturalidade: OleVariant; 
                             var ovBanco: OleVariant; var ovDocumento: OleVariant; 
                             var ovTipoDoc: OleVariant): WordBool; safecall;
    function  GetDataPacket(const sSql: WideString): OleVariant; safecall;
    function  GetDataPacketTS(lSQL: OleVariant): OleVariant; safecall;
    function  GravaHistSenha(aCdsHistSenha: OleVariant): WordBool; safecall;
    function  GravaLogOperacoes(dIDPessoa: Double; dIDModulo: Double; dIDUsuario: Double; 
                                const sDescOperacao: WideString): WordBool; safecall;
    function  ProcessaMensagem(CdsMensagem: OleVariant; iOperacaoMensage: Integer; 
                               IDMensagem: Integer): WordBool; safecall;
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
    function  ProcessaPessoaCliente(Operacao: Integer; CdsPessoa: OleVariant; 
                                    CdsPessoaFisica: OleVariant; CdsDocPessoa: OleVariant; 
                                    CdsSubTipo: OleVariant; CdsEndPess: OleVariant; 
                                    CdsTelEndPess: OleVariant; CdsContatoPess: OleVariant; 
                                    CdsTelContato: OleVariant; CdsContaBancaria: OleVariant; 
                                    CdsImagensPessoa: OleVariant; CdsImagensDoc: OleVariant; 
                                    CdsEmpresaCliente: OleVariant; CdsTipoRecebCli: OleVariant; 
                                    CdsImAgregCli: OleVariant; CdsTiposCli: OleVariant): WordBool; safecall;
    function  ProcessaPessoaForne(Operacao: Integer; CdsPessoa: OleVariant; 
                                  CdsPessoaFisica: OleVariant; CdsDocPessoa: OleVariant; 
                                  CdsSubTipo: OleVariant; CdsEndPess: OleVariant; 
                                  CdsTelEndPess: OleVariant; CdsContatoPess: OleVariant; 
                                  CdsTelContato: OleVariant; CdsContaBancaria: OleVariant; 
                                  CdsImagensPessoa: OleVariant; CdsImagensDoc: OleVariant; 
                                  CdsImAgregForn: OleVariant; CdsEmpresaForn: OleVariant; 
                                  CdsFornXDesemb: OleVariant; CdsFornXRamo: OleVariant): WordBool; safecall;
    function  SelDadosCli(rIDEmpresa: Double; rIDForCli: Double; out ovSubTipo: OleVariant; 
                          out ovEmpresaCliente: OleVariant; out ovTipoReceb: OleVariant; 
                          out ovTipoRecebCli: OleVariant; out ovImAgreg: OleVariant; 
                          out ovImAgregCli: OleVariant; out ovTipos: OleVariant; 
                          out ovTiposCli: OleVariant): WordBool; safecall;
    function  SelDadosForne(rIDEmpresa: Double; rIDForCli: Double; out ovSubTipo: OleVariant; 
                            out ovEmpresaForne: OleVariant; out ovTipoDesemb: OleVariant; 
                            out ovImAgreg: OleVariant; out ovRamoForne: OleVariant; 
                            out ovTipoDesembForn: OleVariant; out ovImAgregForn: OleVariant; 
                            out ovRamoXForne: OleVariant): WordBool; safecall;
    function  Concilia(rCodPortador: Double; dDataExtrato: TDateTime; ovDados: OleVariant; 
                       rIDPessoa: Double; rIDModulo: Double; rIDUsuario: Double; 
                       bUsaPlanoPatro: WordBool): WordBool; safecall;
    function  AplicaMarcacoes(rIDPessoa: Double; rIDModulo: Double; rIDUsuario: Double; 
                              bUsaPlanoPatro: WordBool; ovDados: OleVariant): WordBool; safecall;
    function  AtualizaDados(ovDados: OleVariant): WordBool; safecall;
    function  EncerraDisponibilidade(dDataRef: TDateTime; rIDPessoa: Double; rIDModulo: Double; 
                                     rIDUsuario: Double; bUsaPlanoPatro: WordBool): WordBool; safecall;
    function  GeraFluxoPrevisto(rSaldoInic: Double; dDataInicial: TDateTime; dDataFinal: TDateTime; 
                                bGeraAtrasados: WordBool; rIDPessoa: Double; rIDModulo: Double; 
                                rIDUsuario: Double; bUsaPlanoPatro: WordBool; 
                                const sTipoEmpresa: WideString): WordBool; safecall;
    function  GeraFluxoReal(dDataInicial: TDateTime; dDataFinal: TDateTime; rIDPessoa: Double; 
                            rIDModulo: Double; rIDUsuario: Double; bUsaPlanoPatro: WordBool): WordBool; safecall;
    function  GeraFluxoOrcOrcamen(rPeriodoInicial: Double; rPeriodoFinal: Double; 
                                  rExercicio: Double; rIDPessoa: Double; rIDModulo: Double; 
                                  rIDUsuario: Double; bUsaPlanoPatro: WordBool): WordBool; safecall;
    function  GeraMultiFluxoOrc(dDataInicial: TDateTime; dDataFinal: TDateTime; 
                                const sFluxoOrigem: WideString; const SFluxoDestino: WideString; 
                                rIDPessoa: Double; rIDModulo: Double; rIDUsuario: Double; 
                                bUsaPlanoPatro: WordBool): WordBool; safecall;
    function  AplicaAtualHistPad: WordBool; safecall;
    function  IncluiAlteraFluxo(ovDadosMontaFluxo: OleVariant; ovDadosCompFluxo: OleVariant): WordBool; safecall;
    function  ExcluiFluxo(ovDadosMontaFluxo: OleVariant; ovDadosCompFluxo: OleVariant): WordBool; safecall;
    function  GravaOrdenacao(LinhasFluxo: OleVariant): WordBool; safecall;
    function  AplicaAtualFluxoOrc(ovDados: OleVariant): WordBool; safecall;
    function  AplicaAtualParamFinanc(ovDados: OleVariant): WordBool; safecall;
    function  Regulariza(dDataRegularizacao: TDateTime; rIDPlano: Double; 
                         bIntegraContabil: WordBool; rIDPessoa: Double; rIDModulo: Double; 
                         rIDUsuario: Double; bUsaPlanoPatro: WordBool; 
                         ovDadosNaoIdentificados: OleVariant; ovDadosNaoConciliados: OleVariant): WordBool; safecall;
    function  AplicaAtualTiposAplic(ovDados: OleVariant): WordBool; safecall;
    function  AplicaAtualTRDxCRespon(ovDados: OleVariant): WordBool; safecall;
    function  TransfereFundos(ovDados: OleVariant; rIDPessoa: Double; rIDModulo: Double; 
                              rIDUsuario: Double; bUsaPlanoPatro: WordBool): WordBool; safecall;
    function  EstornoFinanceiro(dDataEstorno: TDateTime; dDataDisp: TDateTime; 
                                var rCodLancFinanc: Double; rIDPlano: Double; 
                                bIntegraContabil: WordBool; bRegNaoIdent: WordBool; 
                                rIDPessoa: Double; rIDModulo: Double; rIDUsuario: Double; 
                                bUsaPlanoPatro: WordBool): WordBool; safecall;
    function  GeraImpostoRateio(var rImposto: Double; rIDPessoa: Double; rIDModulo: Double; 
                                rIDUsuario: Double; bUsaPlanoPatro: WordBool): WordBool; safecall;
    function  AplicaMarcacoesDisp(ovDados: OleVariant; rIDPessoa: Double; rIDModulo: Double; 
                                  rIDUsuario: Double; bUsaPlanoPatro: WordBool): WordBool; safecall;
    function  GravaFinanceiro(ovDadosMovimFinanc: OleVariant; ovDadosRateioFinanc: OleVariant; 
                              ovDadosContab: OleVariant; bRegNaoIdent: WordBool; 
                              const sOperacao: WideString; rIDPlano: Double; 
                              bIntegraContabil: WordBool; bCalcImposto: WordBool; 
                              rIDPessoa: Double; rIDModulo: Double; rIDUsuario: Double; 
                              bUsaPlanoPatro: WordBool): WordBool; safecall;
    function  ExcluiFinanceiro(rCodLancFinanc: Double; rIDPessoa: Double; rIDModulo: Double; 
                               rIDUsuario: Double; bUsaPlanoPatro: WordBool): WordBool; safecall;
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
  end;

// *********************************************************************//
// DispIntf:  IDmCFinanSrv50Disp
// Flags:     (4416) Dual OleAutomation Dispatchable
// GUID:      {B26899B8-B997-4308-AD0E-ADF5BAF5C419}
// *********************************************************************//
  IDmCFinanSrv50Disp = dispinterface
    ['{B26899B8-B997-4308-AD0E-ADF5BAF5C419}']
    function  MessageInfo: WideString; dispid 1;
    function  ConectaDB(const UserName: WideString; const PassWord: WideString; 
                        const ServerName: WideString): WordBool; dispid 2;
    function  ExecSqlAndCommit(const sSql: WideString): WordBool; dispid 3;
    function  GetContentFile(const sFileName: WideString): WideString; dispid 4;
    function  GetDadosPessoa(rIDPessoa: Double; TipoGetPessoa: Integer; TipoPessoa: Integer; 
                             var ovPessoa: OleVariant; var ovPessoaFisica: OleVariant; 
                             var ovDocPessoa: OleVariant; var ovEndPess: OleVariant; 
                             var ovTelEndPess: OleVariant; var ovContatoPess: OleVariant; 
                             var ovTelContato: OleVariant; var ovContaBancaria: OleVariant; 
                             var ovImagensPessoa: OleVariant; var ovImagensDoc: OleVariant; 
                             var ovEstado: OleVariant; var ovNaturalidade: OleVariant; 
                             var ovBanco: OleVariant; var ovDocumento: OleVariant; 
                             var ovTipoDoc: OleVariant): WordBool; dispid 5;
    function  GetDataPacket(const sSql: WideString): OleVariant; dispid 7;
    function  GetDataPacketTS(lSQL: OleVariant): OleVariant; dispid 8;
    function  GravaHistSenha(aCdsHistSenha: OleVariant): WordBool; dispid 9;
    function  GravaLogOperacoes(dIDPessoa: Double; dIDModulo: Double; dIDUsuario: Double; 
                                const sDescOperacao: WideString): WordBool; dispid 10;
    function  ProcessaMensagem(CdsMensagem: OleVariant; iOperacaoMensage: Integer; 
                               IDMensagem: Integer): WordBool; dispid 11;
    function  ProcessaPessoaAgencia(Operacao: Integer; CdsPessoa: OleVariant; 
                                    CdsPessoaFisica: OleVariant; CdsDocPessoa: OleVariant; 
                                    CdsSubTipo: OleVariant; CdsEndPess: OleVariant; 
                                    CdsTelEndPess: OleVariant; CdsContatoPess: OleVariant; 
                                    CdsTelContato: OleVariant; CdsContaBancaria: OleVariant; 
                                    CdsImagensPessoa: OleVariant; CdsImagensDoc: OleVariant): WordBool; dispid 12;
    function  ProcessaPessoaBanco(Operacao: Integer; CdsPessoa: OleVariant; 
                                  CdsPessoaFisica: OleVariant; CdsDocPessoa: OleVariant; 
                                  CdsSubTipo: OleVariant; CdsEndPess: OleVariant; 
                                  CdsTelEndPess: OleVariant; CdsContatoPess: OleVariant; 
                                  CdsTelContato: OleVariant; CdsContaBancaria: OleVariant; 
                                  CdsImagensPessoa: OleVariant; CdsImagensDoc: OleVariant): WordBool; dispid 14;
    function  ProcessaPessoaCliente(Operacao: Integer; CdsPessoa: OleVariant; 
                                    CdsPessoaFisica: OleVariant; CdsDocPessoa: OleVariant; 
                                    CdsSubTipo: OleVariant; CdsEndPess: OleVariant; 
                                    CdsTelEndPess: OleVariant; CdsContatoPess: OleVariant; 
                                    CdsTelContato: OleVariant; CdsContaBancaria: OleVariant; 
                                    CdsImagensPessoa: OleVariant; CdsImagensDoc: OleVariant; 
                                    CdsEmpresaCliente: OleVariant; CdsTipoRecebCli: OleVariant; 
                                    CdsImAgregCli: OleVariant; CdsTiposCli: OleVariant): WordBool; dispid 15;
    function  ProcessaPessoaForne(Operacao: Integer; CdsPessoa: OleVariant; 
                                  CdsPessoaFisica: OleVariant; CdsDocPessoa: OleVariant; 
                                  CdsSubTipo: OleVariant; CdsEndPess: OleVariant; 
                                  CdsTelEndPess: OleVariant; CdsContatoPess: OleVariant; 
                                  CdsTelContato: OleVariant; CdsContaBancaria: OleVariant; 
                                  CdsImagensPessoa: OleVariant; CdsImagensDoc: OleVariant; 
                                  CdsImAgregForn: OleVariant; CdsEmpresaForn: OleVariant; 
                                  CdsFornXDesemb: OleVariant; CdsFornXRamo: OleVariant): WordBool; dispid 6;
    function  SelDadosCli(rIDEmpresa: Double; rIDForCli: Double; out ovSubTipo: OleVariant; 
                          out ovEmpresaCliente: OleVariant; out ovTipoReceb: OleVariant; 
                          out ovTipoRecebCli: OleVariant; out ovImAgreg: OleVariant; 
                          out ovImAgregCli: OleVariant; out ovTipos: OleVariant; 
                          out ovTiposCli: OleVariant): WordBool; dispid 13;
    function  SelDadosForne(rIDEmpresa: Double; rIDForCli: Double; out ovSubTipo: OleVariant; 
                            out ovEmpresaForne: OleVariant; out ovTipoDesemb: OleVariant; 
                            out ovImAgreg: OleVariant; out ovRamoForne: OleVariant; 
                            out ovTipoDesembForn: OleVariant; out ovImAgregForn: OleVariant; 
                            out ovRamoXForne: OleVariant): WordBool; dispid 16;
    function  Concilia(rCodPortador: Double; dDataExtrato: TDateTime; ovDados: OleVariant; 
                       rIDPessoa: Double; rIDModulo: Double; rIDUsuario: Double; 
                       bUsaPlanoPatro: WordBool): WordBool; dispid 17;
    function  AplicaMarcacoes(rIDPessoa: Double; rIDModulo: Double; rIDUsuario: Double; 
                              bUsaPlanoPatro: WordBool; ovDados: OleVariant): WordBool; dispid 18;
    function  AtualizaDados(ovDados: OleVariant): WordBool; dispid 19;
    function  EncerraDisponibilidade(dDataRef: TDateTime; rIDPessoa: Double; rIDModulo: Double; 
                                     rIDUsuario: Double; bUsaPlanoPatro: WordBool): WordBool; dispid 20;
    function  GeraFluxoPrevisto(rSaldoInic: Double; dDataInicial: TDateTime; dDataFinal: TDateTime; 
                                bGeraAtrasados: WordBool; rIDPessoa: Double; rIDModulo: Double; 
                                rIDUsuario: Double; bUsaPlanoPatro: WordBool; 
                                const sTipoEmpresa: WideString): WordBool; dispid 21;
    function  GeraFluxoReal(dDataInicial: TDateTime; dDataFinal: TDateTime; rIDPessoa: Double; 
                            rIDModulo: Double; rIDUsuario: Double; bUsaPlanoPatro: WordBool): WordBool; dispid 22;
    function  GeraFluxoOrcOrcamen(rPeriodoInicial: Double; rPeriodoFinal: Double; 
                                  rExercicio: Double; rIDPessoa: Double; rIDModulo: Double; 
                                  rIDUsuario: Double; bUsaPlanoPatro: WordBool): WordBool; dispid 23;
    function  GeraMultiFluxoOrc(dDataInicial: TDateTime; dDataFinal: TDateTime; 
                                const sFluxoOrigem: WideString; const SFluxoDestino: WideString; 
                                rIDPessoa: Double; rIDModulo: Double; rIDUsuario: Double; 
                                bUsaPlanoPatro: WordBool): WordBool; dispid 24;
    function  AplicaAtualHistPad: WordBool; dispid 27;
    function  IncluiAlteraFluxo(ovDadosMontaFluxo: OleVariant; ovDadosCompFluxo: OleVariant): WordBool; dispid 28;
    function  ExcluiFluxo(ovDadosMontaFluxo: OleVariant; ovDadosCompFluxo: OleVariant): WordBool; dispid 29;
    function  GravaOrdenacao(LinhasFluxo: OleVariant): WordBool; dispid 30;
    function  AplicaAtualFluxoOrc(ovDados: OleVariant): WordBool; dispid 31;
    function  AplicaAtualParamFinanc(ovDados: OleVariant): WordBool; dispid 32;
    function  Regulariza(dDataRegularizacao: TDateTime; rIDPlano: Double; 
                         bIntegraContabil: WordBool; rIDPessoa: Double; rIDModulo: Double; 
                         rIDUsuario: Double; bUsaPlanoPatro: WordBool; 
                         ovDadosNaoIdentificados: OleVariant; ovDadosNaoConciliados: OleVariant): WordBool; dispid 33;
    function  AplicaAtualTiposAplic(ovDados: OleVariant): WordBool; dispid 35;
    function  AplicaAtualTRDxCRespon(ovDados: OleVariant): WordBool; dispid 36;
    function  TransfereFundos(ovDados: OleVariant; rIDPessoa: Double; rIDModulo: Double; 
                              rIDUsuario: Double; bUsaPlanoPatro: WordBool): WordBool; dispid 25;
    function  EstornoFinanceiro(dDataEstorno: TDateTime; dDataDisp: TDateTime; 
                                var rCodLancFinanc: Double; rIDPlano: Double; 
                                bIntegraContabil: WordBool; bRegNaoIdent: WordBool; 
                                rIDPessoa: Double; rIDModulo: Double; rIDUsuario: Double; 
                                bUsaPlanoPatro: WordBool): WordBool; dispid 38;
    function  GeraImpostoRateio(var rImposto: Double; rIDPessoa: Double; rIDModulo: Double; 
                                rIDUsuario: Double; bUsaPlanoPatro: WordBool): WordBool; dispid 26;
    function  AplicaMarcacoesDisp(ovDados: OleVariant; rIDPessoa: Double; rIDModulo: Double; 
                                  rIDUsuario: Double; bUsaPlanoPatro: WordBool): WordBool; dispid 37;
    function  GravaFinanceiro(ovDadosMovimFinanc: OleVariant; ovDadosRateioFinanc: OleVariant; 
                              ovDadosContab: OleVariant; bRegNaoIdent: WordBool; 
                              const sOperacao: WideString; rIDPlano: Double; 
                              bIntegraContabil: WordBool; bCalcImposto: WordBool; 
                              rIDPessoa: Double; rIDModulo: Double; rIDUsuario: Double; 
                              bUsaPlanoPatro: WordBool): WordBool; dispid 39;
    function  ExcluiFinanceiro(rCodLancFinanc: Double; rIDPessoa: Double; rIDModulo: Double; 
                               rIDUsuario: Double; bUsaPlanoPatro: WordBool): WordBool; dispid 34;
    function  ProcessaWorkFlow(ovWorkflowUsuario: OleVariant; ovWorkflow: OleVariant; 
                               ovPassoWorkflow: OleVariant; Operacao: Integer): WordBool; dispid 40;
    function  ProcessaGrupoUsu(ovDataViewAcesso: OleVariant; ovTabelaAcesso: OleVariant; 
                               ovColunaAcesso: OleVariant; ovGrupo: OleVariant; 
                               ovUsuario: OleVariant; ovPessoa: OleVariant; 
                               ovGrupoXUsu: OleVariant; ovAutoriza: OleVariant; 
                               ovAutorizaRpt: OleVariant; ovAutorizaMS: OleVariant; 
                               OperacaoProcessa: Integer): WordBool; dispid 41;
    function  GravarReports(ovCds: OleVariant): WordBool; dispid 42;
    function  ProcurarReports(IdReports: Integer; OrigemCm: Integer): WordBool; dispid 43;
    function  ProcessaConfig(ovCds: OleVariant; ovCdsReport: OleVariant; Operacao: Integer): WordBool; dispid 44;
    function  ProcessaConfigModelo(ovReports: OleVariant): WordBool; dispid 45;
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
// The Class CoDmCFinanSrv50 provides a Create and CreateRemote method to          
// create instances of the default interface IDmCFinanSrv50 exposed by              
// the CoClass DmCFinanSrv50. The functions are intended to be used by             
// clients wishing to automate the CoClass objects exposed by the         
// server of this typelibrary.                                            
// *********************************************************************//
  CoDmCFinanSrv50 = class
    class function Create: IDmCFinanSrv50;
    class function CreateRemote(const MachineName: string): IDmCFinanSrv50;
  end;

implementation

uses ComObj;

class function CoDmCFinanSrv50.Create: IDmCFinanSrv50;
begin
  Result := CreateComObject(CLASS_DmCFinanSrv50) as IDmCFinanSrv50;
end;

class function CoDmCFinanSrv50.CreateRemote(const MachineName: string): IDmCFinanSrv50;
begin
  Result := CreateRemoteComObject(MachineName, CLASS_DmCFinanSrv50) as IDmCFinanSrv50;
end;

end.
