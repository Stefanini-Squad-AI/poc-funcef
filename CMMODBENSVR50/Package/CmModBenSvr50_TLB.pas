unit CmModBenSvr50_TLB;

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
// File generated on 17/10/2002 13:04:30 from Type Library described below.

// ************************************************************************ //
// Type Lib: C:\ProjetosCM5\CmModBenSvr50\Package\CmModBenSvr50.tlb (1)
// IID\LCID: {285272E6-AD11-4385-874C-68CDF131A4C4}\0
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
  CmModBenSvr50MajorVersion = 1;
  CmModBenSvr50MinorVersion = 0;

  LIBID_CmModBenSvr50: TGUID = '{285272E6-AD11-4385-874C-68CDF131A4C4}';

  IID_IDmCmModBenSvr50: TGUID = '{B4655837-58C7-4448-9D63-B41D07A9DFE2}';
  CLASS_DmCmModBenSvr50: TGUID = '{57A23F95-F5DC-434D-84BD-6D0926F8FB3B}';
type

// *********************************************************************//
// Forward declaration of types defined in TypeLibrary                    
// *********************************************************************//
  IDmCmModBenSvr50 = interface;
  IDmCmModBenSvr50Disp = dispinterface;

// *********************************************************************//
// Declaration of CoClasses defined in Type Library                       
// (NOTE: Here we map each CoClass to its Default Interface)              
// *********************************************************************//
  DmCmModBenSvr50 = IDmCmModBenSvr50;


// *********************************************************************//
// Interface: IDmCmModBenSvr50
// Flags:     (4416) Dual OleAutomation Dispatchable
// GUID:      {B4655837-58C7-4448-9D63-B41D07A9DFE2}
// *********************************************************************//
  IDmCmModBenSvr50 = interface(IAppServer)
    ['{B4655837-58C7-4448-9D63-B41D07A9DFE2}']
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
    function  GravarProvento(ovDados: OleVariant): WordBool; safecall;
    function  AlterarTipoRubricaEmpresa(Visivel: WordBool; IdEmpresa: Integer): WordBool; safecall;
    function  GravarRubricaEmpresa(Operacao: Integer; IdProvento: Double; IdEmpresa: Integer; 
                                   const TipoRubrica: WideString; const CodProvDesc: WideString; 
                                   const DescrProvDesc: WideString): WordBool; safecall;
    function  GravarTipoBenSal(ovDados: OleVariant): WordBool; safecall;
    function  GravarRubricaIndiv(ovDados: OleVariant): WordBool; safecall;
    function  ProcessarInclusaoBeneficios(ovDados: OleVariant): WordBool; safecall;
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
// DispIntf:  IDmCmModBenSvr50Disp
// Flags:     (4416) Dual OleAutomation Dispatchable
// GUID:      {B4655837-58C7-4448-9D63-B41D07A9DFE2}
// *********************************************************************//
  IDmCmModBenSvr50Disp = dispinterface
    ['{B4655837-58C7-4448-9D63-B41D07A9DFE2}']
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
    function  GravarProvento(ovDados: OleVariant): WordBool; dispid 17;
    function  AlterarTipoRubricaEmpresa(Visivel: WordBool; IdEmpresa: Integer): WordBool; dispid 18;
    function  GravarRubricaEmpresa(Operacao: Integer; IdProvento: Double; IdEmpresa: Integer; 
                                   const TipoRubrica: WideString; const CodProvDesc: WideString; 
                                   const DescrProvDesc: WideString): WordBool; dispid 19;
    function  GravarTipoBenSal(ovDados: OleVariant): WordBool; dispid 20;
    function  GravarRubricaIndiv(ovDados: OleVariant): WordBool; dispid 21;
    function  ProcessarInclusaoBeneficios(ovDados: OleVariant): WordBool; dispid 22;
    function  ProcessaWorkFlow(ovWorkflowUsuario: OleVariant; ovWorkflow: OleVariant; 
                               ovPassoWorkflow: OleVariant; Operacao: Integer): WordBool; dispid 54;
    function  ProcessaGrupoUsu(ovDataViewAcesso: OleVariant; ovTabelaAcesso: OleVariant; 
                               ovColunaAcesso: OleVariant; ovGrupo: OleVariant; 
                               ovUsuario: OleVariant; ovPessoa: OleVariant; 
                               ovGrupoXUsu: OleVariant; ovAutoriza: OleVariant; 
                               ovAutorizaRpt: OleVariant; ovAutorizaMS: OleVariant; 
                               OperacaoProcessa: Integer): WordBool; dispid 53;
    function  GravarReports(ovCds: OleVariant): WordBool; dispid 55;
    function  ProcurarReports(IdReports: Integer; OrigemCm: Integer): WordBool; dispid 56;
    function  ProcessaConfig(ovCds: OleVariant; ovCdsReport: OleVariant; Operacao: Integer): WordBool; dispid 57;
    function  ProcessaConfigModelo(ovReports: OleVariant): WordBool; dispid 58;
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
// The Class CoDmCmModBenSvr50 provides a Create and CreateRemote method to          
// create instances of the default interface IDmCmModBenSvr50 exposed by              
// the CoClass DmCmModBenSvr50. The functions are intended to be used by             
// clients wishing to automate the CoClass objects exposed by the         
// server of this typelibrary.                                            
// *********************************************************************//
  CoDmCmModBenSvr50 = class
    class function Create: IDmCmModBenSvr50;
    class function CreateRemote(const MachineName: string): IDmCmModBenSvr50;
  end;

implementation

uses ComObj;

class function CoDmCmModBenSvr50.Create: IDmCmModBenSvr50;
begin
  Result := CreateComObject(CLASS_DmCmModBenSvr50) as IDmCmModBenSvr50;
end;

class function CoDmCmModBenSvr50.CreateRemote(const MachineName: string): IDmCmModBenSvr50;
begin
  Result := CreateRemoteComObject(MachineName, CLASS_DmCmModBenSvr50) as IDmCmModBenSvr50;
end;

end.
