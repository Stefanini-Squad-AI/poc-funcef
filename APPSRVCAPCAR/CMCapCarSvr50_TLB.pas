unit CMCapCarSvr50_TLB;

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

// PASTLWTR : $Revision:   1.88  $
// File generated on 08/08/2002 11:56:39 from Type Library described below.

// *************************************************************************//
// NOTE:                                                                      
// Items guarded by $IFDEF_LIVE_SERVER_AT_DESIGN_TIME are used by properties  
// which return objects that may need to be explicitly created via a function 
// call prior to any access via the property. These items have been disabled  
// in order to prevent accidental use from within the object inspector. You   
// may enable them by defining LIVE_SERVER_AT_DESIGN_TIME or by selectively   
// removing them from the $IFDEF blocks. However, such items must still be    
// programmatically created via a method of the appropriate CoClass before    
// they can be used.                                                          
// ************************************************************************ //
// Type Lib: C:\ProjetosCM5\AppSrvCAPCAR\CMCAPCARSvr50.tlb (1)
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
  CMCapCarSvr50MajorVersion = 1;
  CMCapCarSvr50MinorVersion = 0;

  LIBID_CMCapCarSvr50: TGUID = '{486C7010-0A3F-40A8-B64B-521B204E1816}';

  IID_IDmCapCarSrv50: TGUID = '{B26899B8-B997-4308-AD0E-ADF5BAF5C419}';
  CLASS_DmCapCarSrv50: TGUID = '{BE0D13C9-4142-4C83-908B-B2A8E09B33B9}';
type

// *********************************************************************//
// Forward declaration of types defined in TypeLibrary                    
// *********************************************************************//
  IDmCapCarSrv50 = interface;
  IDmCapCarSrv50Disp = dispinterface;

// *********************************************************************//
// Declaration of CoClasses defined in Type Library                       
// (NOTE: Here we map each CoClass to its Default Interface)              
// *********************************************************************//
  DmCapCarSrv50 = IDmCapCarSrv50;


// *********************************************************************//
// Interface: IDmCapCarSrv50
// Flags:     (4416) Dual OleAutomation Dispatchable
// GUID:      {B26899B8-B997-4308-AD0E-ADF5BAF5C419}
// *********************************************************************//
  IDmCapCarSrv50 = interface(IAppServer)
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
    function  GravarRamoxdesemb(Cds: OleVariant): WordBool; safecall;
    function  Gravarcheques(Cds: OleVariant): WordBool; safecall;
    function  GravarTipoclixreceb(Cds: OleVariant): WordBool; safecall;
    function  GravarReimprBloq(Cds: OleVariant; pLimpaNossoNumero: WordBool): WordBool; safecall;
    function  GravarMensagensCnab(fcodDocumento: Integer; PageIndex: Integer; 
                                  const Mens0: WideString; const Mens1: WideString; 
                                  const Mens2: WideString; const Mens3: WideString; 
                                  const Mens4: WideString; const Mens5: WideString; 
                                  const Mens6: WideString; const Mens7: WideString; 
                                  const Mens8: WideString; OvBloq: OleVariant; bDeleta: WordBool): WordBool; safecall;
    function  DeletaMensagens(CodDocumento: Double): WordBool; safecall;
    function  GravarDocxCobranca(DocPendentes: OleVariant; DocAssoc: OleVariant; 
                                 const sIdConta: WideString; ApagaExistentes: WordBool; 
                                 Mensagens: WordBool): WordBool; safecall;
    function  GravarClasfisxtipoagre(Cds: OleVariant): WordBool; safecall;
    function  GravarClasfisclifor(Cds: OleVariant): WordBool; safecall;
    function  GravarTiprecdesxtipagre(Cds: OleVariant): WordBool; safecall;
    function  GravarAltxccxprgxconta(Cds: OleVariant): WordBool; safecall;
    function  GravarAltccprgconta_Aplica(Cds: OleVariant): WordBool; safecall;
    function  GravarConfigbarras(Cds: OleVariant): WordBool; safecall;
    function  GravarCodigoscnab(Cds: OleVariant): WordBool; safecall;
    function  GravarConfigbloquete(Cds: OleVariant): WordBool; safecall;
    function  GravarConfigCheque(Cds: OleVariant): WordBool; safecall;
    function  GravarFormaRecPag(Cds: OleVariant): WordBool; safecall;
    function  GravarIntBancoXPortForm(Cds: OleVariant): WordBool; safecall;
    function  GravarModeloscnab(Cds: OleVariant): WordBool; safecall;
    function  GravaRelatorio(Cds: OleVariant): WordBool; safecall;
    function  GravaParamCap(Cds: OleVariant): WordBool; safecall;
    function  GravarPortadorconta(Cds: OleVariant): WordBool; safecall;
    function  GravarPortadorforma(Cds: OleVariant): WordBool; safecall;
    function  GravarTemplbloqcheque(Cds: OleVariant; Cds2: OleVariant): WordBool; safecall;
    function  ExcluirTemplbloqcheque(Cds: OleVariant; Cds2: OleVariant): WordBool; safecall;
    function  GravarTemplcheque(Cds: OleVariant; Cds2: OleVariant): WordBool; safecall;
    function  ExcluirTemplcheque(Cds: OleVariant; Cds2: OleVariant): WordBool; safecall;
    function  GravarTipcustagregconta(Cds: OleVariant): WordBool; safecall;
    function  GravarTipoagre(Cds: OleVariant): WordBool; safecall;
    function  GravarTipoalterador(Cds: OleVariant): WordBool; safecall;
    function  GravarTipodocrecpag(Cds: OleVariant): WordBool; safecall;
    function  GravarTipofatxclasfis(Cds: OleVariant): WordBool; safecall;
    function  GravarTipordcorresp(Cds: OleVariant): WordBool; safecall;
    function  GravarTipoRecebDesemb(Cds: OleVariant): WordBool; safecall;
    function  AlteraVencimento(Cod: Integer; Data: TDateTime): WordBool; safecall;
    procedure ConfigFatNotaReciboProcessaCds(Cds: OleVariant); safecall;
    function  GravarTipordxccxconta(Cds: OleVariant): WordBool; safecall;
    function  GravarTipordxccxconta_aplica(Cds: OleVariant): WordBool; safecall;
  end;

// *********************************************************************//
// DispIntf:  IDmCapCarSrv50Disp
// Flags:     (4416) Dual OleAutomation Dispatchable
// GUID:      {B26899B8-B997-4308-AD0E-ADF5BAF5C419}
// *********************************************************************//
  IDmCapCarSrv50Disp = dispinterface
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
    function  GravarRamoxdesemb(Cds: OleVariant): WordBool; dispid 17;
    function  Gravarcheques(Cds: OleVariant): WordBool; dispid 18;
    function  GravarTipoclixreceb(Cds: OleVariant): WordBool; dispid 19;
    function  GravarReimprBloq(Cds: OleVariant; pLimpaNossoNumero: WordBool): WordBool; dispid 20;
    function  GravarMensagensCnab(fcodDocumento: Integer; PageIndex: Integer; 
                                  const Mens0: WideString; const Mens1: WideString; 
                                  const Mens2: WideString; const Mens3: WideString; 
                                  const Mens4: WideString; const Mens5: WideString; 
                                  const Mens6: WideString; const Mens7: WideString; 
                                  const Mens8: WideString; OvBloq: OleVariant; bDeleta: WordBool): WordBool; dispid 22;
    function  DeletaMensagens(CodDocumento: Double): WordBool; dispid 23;
    function  GravarDocxCobranca(DocPendentes: OleVariant; DocAssoc: OleVariant; 
                                 const sIdConta: WideString; ApagaExistentes: WordBool; 
                                 Mensagens: WordBool): WordBool; dispid 24;
    function  GravarClasfisxtipoagre(Cds: OleVariant): WordBool; dispid 25;
    function  GravarClasfisclifor(Cds: OleVariant): WordBool; dispid 26;
    function  GravarTiprecdesxtipagre(Cds: OleVariant): WordBool; dispid 21;
    function  GravarAltxccxprgxconta(Cds: OleVariant): WordBool; dispid 27;
    function  GravarAltccprgconta_Aplica(Cds: OleVariant): WordBool; dispid 28;
    function  GravarConfigbarras(Cds: OleVariant): WordBool; dispid 29;
    function  GravarCodigoscnab(Cds: OleVariant): WordBool; dispid 30;
    function  GravarConfigbloquete(Cds: OleVariant): WordBool; dispid 31;
    function  GravarConfigCheque(Cds: OleVariant): WordBool; dispid 32;
    function  GravarFormaRecPag(Cds: OleVariant): WordBool; dispid 33;
    function  GravarIntBancoXPortForm(Cds: OleVariant): WordBool; dispid 34;
    function  GravarModeloscnab(Cds: OleVariant): WordBool; dispid 35;
    function  GravaRelatorio(Cds: OleVariant): WordBool; dispid 38;
    function  GravaParamCap(Cds: OleVariant): WordBool; dispid 41;
    function  GravarPortadorconta(Cds: OleVariant): WordBool; dispid 42;
    function  GravarPortadorforma(Cds: OleVariant): WordBool; dispid 43;
    function  GravarTemplbloqcheque(Cds: OleVariant; Cds2: OleVariant): WordBool; dispid 44;
    function  ExcluirTemplbloqcheque(Cds: OleVariant; Cds2: OleVariant): WordBool; dispid 45;
    function  GravarTemplcheque(Cds: OleVariant; Cds2: OleVariant): WordBool; dispid 46;
    function  ExcluirTemplcheque(Cds: OleVariant; Cds2: OleVariant): WordBool; dispid 47;
    function  GravarTipcustagregconta(Cds: OleVariant): WordBool; dispid 48;
    function  GravarTipoagre(Cds: OleVariant): WordBool; dispid 49;
    function  GravarTipoalterador(Cds: OleVariant): WordBool; dispid 50;
    function  GravarTipodocrecpag(Cds: OleVariant): WordBool; dispid 51;
    function  GravarTipofatxclasfis(Cds: OleVariant): WordBool; dispid 52;
    function  GravarTipordcorresp(Cds: OleVariant): WordBool; dispid 53;
    function  GravarTipoRecebDesemb(Cds: OleVariant): WordBool; dispid 54;
    function  AlteraVencimento(Cod: Integer; Data: TDateTime): WordBool; dispid 55;
    procedure ConfigFatNotaReciboProcessaCds(Cds: OleVariant); dispid 36;
    function  GravarTipordxccxconta(Cds: OleVariant): WordBool; dispid 37;
    function  GravarTipordxccxconta_aplica(Cds: OleVariant): WordBool; dispid 39;
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
// The Class CoDmCapCarSrv50 provides a Create and CreateRemote method to          
// create instances of the default interface IDmCapCarSrv50 exposed by              
// the CoClass DmCapCarSrv50. The functions are intended to be used by             
// clients wishing to automate the CoClass objects exposed by the         
// server of this typelibrary.                                            
// *********************************************************************//
  CoDmCapCarSrv50 = class
    class function Create: IDmCapCarSrv50;
    class function CreateRemote(const MachineName: string): IDmCapCarSrv50;
  end;


// *********************************************************************//
// OLE Server Proxy class declaration
// Server Object    : TDmCapCarSrv50
// Help String      : DmCFinanSrv50 Object
// Default Interface: IDmCapCarSrv50
// Def. Intf. DISP? : No
// Event   Interface: 
// TypeFlags        : (2) CanCreate
// *********************************************************************//
{$IFDEF LIVE_SERVER_AT_DESIGN_TIME}
  TDmCapCarSrv50Properties= class;
{$ENDIF}
  TDmCapCarSrv50 = class(TOleServer)
  private
    FIntf:        IDmCapCarSrv50;
{$IFDEF LIVE_SERVER_AT_DESIGN_TIME}
    FProps:       TDmCapCarSrv50Properties;
    function      GetServerProperties: TDmCapCarSrv50Properties;
{$ENDIF}
    function      GetDefaultInterface: IDmCapCarSrv50;
  protected
    procedure InitServerData; override;
  public
    constructor Create(AOwner: TComponent); override;
    destructor  Destroy; override;
    procedure Connect; override;
    procedure ConnectTo(svrIntf: IDmCapCarSrv50);
    procedure Disconnect; override;
    function  AS_ApplyUpdates(const ProviderName: WideString; Delta: OleVariant; 
                              MaxErrors: Integer; out ErrorCount: Integer; var OwnerData: OleVariant): OleVariant;
    function  AS_GetRecords(const ProviderName: WideString; Count: Integer; out RecsOut: Integer; 
                            Options: Integer; const CommandText: WideString; 
                            var Params: OleVariant; var OwnerData: OleVariant): OleVariant;
    function  AS_DataRequest(const ProviderName: WideString; Data: OleVariant): OleVariant;
    function  AS_GetProviderNames: OleVariant;
    function  AS_GetParams(const ProviderName: WideString; var OwnerData: OleVariant): OleVariant;
    function  AS_RowRequest(const ProviderName: WideString; Row: OleVariant; RequestType: Integer; 
                            var OwnerData: OleVariant): OleVariant;
    procedure AS_Execute(const ProviderName: WideString; const CommandText: WideString; 
                         var Params: OleVariant; var OwnerData: OleVariant);
    function  MessageInfo: WideString;
    function  ConectaDB(const UserName: WideString; const PassWord: WideString; 
                        const ServerName: WideString): WordBool;
    function  ExecSqlAndCommit(const sSql: WideString): WordBool;
    function  GetContentFile(const sFileName: WideString): WideString;
    function  GetDadosPessoa(rIDPessoa: Double; TipoGetPessoa: Integer; TipoPessoa: Integer; 
                             var ovPessoa: OleVariant; var ovPessoaFisica: OleVariant; 
                             var ovDocPessoa: OleVariant; var ovEndPess: OleVariant; 
                             var ovTelEndPess: OleVariant; var ovContatoPess: OleVariant; 
                             var ovTelContato: OleVariant; var ovContaBancaria: OleVariant; 
                             var ovImagensPessoa: OleVariant; var ovImagensDoc: OleVariant; 
                             var ovEstado: OleVariant; var ovNaturalidade: OleVariant; 
                             var ovBanco: OleVariant; var ovDocumento: OleVariant; 
                             var ovTipoDoc: OleVariant): WordBool;
    function  GetDataPacket(const sSql: WideString): OleVariant;
    function  GetDataPacketTS(lSQL: OleVariant): OleVariant;
    function  GravaHistSenha(aCdsHistSenha: OleVariant): WordBool;
    function  GravaLogOperacoes(dIDPessoa: Double; dIDModulo: Double; dIDUsuario: Double; 
                                const sDescOperacao: WideString): WordBool;
    function  ProcessaMensagem(CdsMensagem: OleVariant; iOperacaoMensage: Integer; 
                               IDMensagem: Integer): WordBool;
    function  ProcessaPessoaAgencia(Operacao: Integer; CdsPessoa: OleVariant; 
                                    CdsPessoaFisica: OleVariant; CdsDocPessoa: OleVariant; 
                                    CdsSubTipo: OleVariant; CdsEndPess: OleVariant; 
                                    CdsTelEndPess: OleVariant; CdsContatoPess: OleVariant; 
                                    CdsTelContato: OleVariant; CdsContaBancaria: OleVariant; 
                                    CdsImagensPessoa: OleVariant; CdsImagensDoc: OleVariant): WordBool;
    function  ProcessaPessoaBanco(Operacao: Integer; CdsPessoa: OleVariant; 
                                  CdsPessoaFisica: OleVariant; CdsDocPessoa: OleVariant; 
                                  CdsSubTipo: OleVariant; CdsEndPess: OleVariant; 
                                  CdsTelEndPess: OleVariant; CdsContatoPess: OleVariant; 
                                  CdsTelContato: OleVariant; CdsContaBancaria: OleVariant; 
                                  CdsImagensPessoa: OleVariant; CdsImagensDoc: OleVariant): WordBool;
    function  ProcessaPessoaCliente(Operacao: Integer; CdsPessoa: OleVariant; 
                                    CdsPessoaFisica: OleVariant; CdsDocPessoa: OleVariant; 
                                    CdsSubTipo: OleVariant; CdsEndPess: OleVariant; 
                                    CdsTelEndPess: OleVariant; CdsContatoPess: OleVariant; 
                                    CdsTelContato: OleVariant; CdsContaBancaria: OleVariant; 
                                    CdsImagensPessoa: OleVariant; CdsImagensDoc: OleVariant; 
                                    CdsEmpresaCliente: OleVariant; CdsTipoRecebCli: OleVariant; 
                                    CdsImAgregCli: OleVariant; CdsTiposCli: OleVariant): WordBool;
    function  ProcessaPessoaForne(Operacao: Integer; CdsPessoa: OleVariant; 
                                  CdsPessoaFisica: OleVariant; CdsDocPessoa: OleVariant; 
                                  CdsSubTipo: OleVariant; CdsEndPess: OleVariant; 
                                  CdsTelEndPess: OleVariant; CdsContatoPess: OleVariant; 
                                  CdsTelContato: OleVariant; CdsContaBancaria: OleVariant; 
                                  CdsImagensPessoa: OleVariant; CdsImagensDoc: OleVariant; 
                                  CdsImAgregForn: OleVariant; CdsEmpresaForn: OleVariant; 
                                  CdsFornXDesemb: OleVariant; CdsFornXRamo: OleVariant): WordBool;
    function  SelDadosCli(rIDEmpresa: Double; rIDForCli: Double; out ovSubTipo: OleVariant; 
                          out ovEmpresaCliente: OleVariant; out ovTipoReceb: OleVariant; 
                          out ovTipoRecebCli: OleVariant; out ovImAgreg: OleVariant; 
                          out ovImAgregCli: OleVariant; out ovTipos: OleVariant; 
                          out ovTiposCli: OleVariant): WordBool;
    function  SelDadosForne(rIDEmpresa: Double; rIDForCli: Double; out ovSubTipo: OleVariant; 
                            out ovEmpresaForne: OleVariant; out ovTipoDesemb: OleVariant; 
                            out ovImAgreg: OleVariant; out ovRamoForne: OleVariant; 
                            out ovTipoDesembForn: OleVariant; out ovImAgregForn: OleVariant; 
                            out ovRamoXForne: OleVariant): WordBool;
    function  GravarRamoxdesemb(Cds: OleVariant): WordBool;
    function  Gravarcheques(Cds: OleVariant): WordBool;
    function  GravarTipoclixreceb(Cds: OleVariant): WordBool;
    function  GravarReimprBloq(Cds: OleVariant; pLimpaNossoNumero: WordBool): WordBool;
    function  GravarMensagensCnab(fcodDocumento: Integer; PageIndex: Integer; 
                                  const Mens0: WideString; const Mens1: WideString; 
                                  const Mens2: WideString; const Mens3: WideString; 
                                  const Mens4: WideString; const Mens5: WideString; 
                                  const Mens6: WideString; const Mens7: WideString; 
                                  const Mens8: WideString; OvBloq: OleVariant; bDeleta: WordBool): WordBool;
    function  DeletaMensagens(CodDocumento: Double): WordBool;
    function  GravarDocxCobranca(DocPendentes: OleVariant; DocAssoc: OleVariant; 
                                 const sIdConta: WideString; ApagaExistentes: WordBool; 
                                 Mensagens: WordBool): WordBool;
    function  GravarClasfisxtipoagre(Cds: OleVariant): WordBool;
    function  GravarClasfisclifor(Cds: OleVariant): WordBool;
    function  GravarTiprecdesxtipagre(Cds: OleVariant): WordBool;
    function  GravarAltxccxprgxconta(Cds: OleVariant): WordBool;
    function  GravarAltccprgconta_Aplica(Cds: OleVariant): WordBool;
    function  GravarConfigbarras(Cds: OleVariant): WordBool;
    function  GravarCodigoscnab(Cds: OleVariant): WordBool;
    function  GravarConfigbloquete(Cds: OleVariant): WordBool;
    function  GravarConfigCheque(Cds: OleVariant): WordBool;
    function  GravarFormaRecPag(Cds: OleVariant): WordBool;
    function  GravarIntBancoXPortForm(Cds: OleVariant): WordBool;
    function  GravarModeloscnab(Cds: OleVariant): WordBool;
    function  GravaRelatorio(Cds: OleVariant): WordBool;
    function  GravaParamCap(Cds: OleVariant): WordBool;
    function  GravarPortadorconta(Cds: OleVariant): WordBool;
    function  GravarPortadorforma(Cds: OleVariant): WordBool;
    function  GravarTemplbloqcheque(Cds: OleVariant; Cds2: OleVariant): WordBool;
    function  ExcluirTemplbloqcheque(Cds: OleVariant; Cds2: OleVariant): WordBool;
    function  GravarTemplcheque(Cds: OleVariant; Cds2: OleVariant): WordBool;
    function  ExcluirTemplcheque(Cds: OleVariant; Cds2: OleVariant): WordBool;
    function  GravarTipcustagregconta(Cds: OleVariant): WordBool;
    function  GravarTipoagre(Cds: OleVariant): WordBool;
    function  GravarTipoalterador(Cds: OleVariant): WordBool;
    function  GravarTipodocrecpag(Cds: OleVariant): WordBool;
    function  GravarTipofatxclasfis(Cds: OleVariant): WordBool;
    function  GravarTipordcorresp(Cds: OleVariant): WordBool;
    function  GravarTipoRecebDesemb(Cds: OleVariant): WordBool;
    function  AlteraVencimento(Cod: Integer; Data: TDateTime): WordBool;
    procedure ConfigFatNotaReciboProcessaCds(Cds: OleVariant);
    function  GravarTipordxccxconta(Cds: OleVariant): WordBool;
    function  GravarTipordxccxconta_aplica(Cds: OleVariant): WordBool;
    property  DefaultInterface: IDmCapCarSrv50 read GetDefaultInterface;
  published
{$IFDEF LIVE_SERVER_AT_DESIGN_TIME}
    property Server: TDmCapCarSrv50Properties read GetServerProperties;
{$ENDIF}
  end;

{$IFDEF LIVE_SERVER_AT_DESIGN_TIME}
// *********************************************************************//
// OLE Server Properties Proxy Class
// Server Object    : TDmCapCarSrv50
// (This object is used by the IDE's Property Inspector to allow editing
//  of the properties of this server)
// *********************************************************************//
 TDmCapCarSrv50Properties = class(TPersistent)
  private
    FServer:    TDmCapCarSrv50;
    function    GetDefaultInterface: IDmCapCarSrv50;
    constructor Create(AServer: TDmCapCarSrv50);
  protected
  public
    property DefaultInterface: IDmCapCarSrv50 read GetDefaultInterface;
  published
  end;
{$ENDIF}


procedure Register;

implementation

uses ComObj;

class function CoDmCapCarSrv50.Create: IDmCapCarSrv50;
begin
  Result := CreateComObject(CLASS_DmCapCarSrv50) as IDmCapCarSrv50;
end;

class function CoDmCapCarSrv50.CreateRemote(const MachineName: string): IDmCapCarSrv50;
begin
  Result := CreateRemoteComObject(MachineName, CLASS_DmCapCarSrv50) as IDmCapCarSrv50;
end;

procedure TDmCapCarSrv50.InitServerData;
const
  CServerData: TServerData = (
    ClassID:   '{BE0D13C9-4142-4C83-908B-B2A8E09B33B9}';
    IntfIID:   '{B26899B8-B997-4308-AD0E-ADF5BAF5C419}';
    EventIID:  '';
    LicenseKey: nil;
    Version: 500);
begin
  ServerData := @CServerData;
end;

procedure TDmCapCarSrv50.Connect;
var
  punk: IUnknown;
begin
  if FIntf = nil then
  begin
    punk := GetServer;
    Fintf:= punk as IDmCapCarSrv50;
  end;
end;

procedure TDmCapCarSrv50.ConnectTo(svrIntf: IDmCapCarSrv50);
begin
  Disconnect;
  FIntf := svrIntf;
end;

procedure TDmCapCarSrv50.DisConnect;
begin
  if Fintf <> nil then
  begin
    FIntf := nil;
  end;
end;

function TDmCapCarSrv50.GetDefaultInterface: IDmCapCarSrv50;
begin
  if FIntf = nil then
    Connect;
  Assert(FIntf <> nil, 'DefaultInterface is NULL. Component is not connected to Server. You must call ''Connect'' or ''ConnectTo'' before this operation');
  Result := FIntf;
end;

constructor TDmCapCarSrv50.Create(AOwner: TComponent);
begin
  inherited Create(AOwner);
{$IFDEF LIVE_SERVER_AT_DESIGN_TIME}
  FProps := TDmCapCarSrv50Properties.Create(Self);
{$ENDIF}
end;

destructor TDmCapCarSrv50.Destroy;
begin
{$IFDEF LIVE_SERVER_AT_DESIGN_TIME}
  FProps.Free;
{$ENDIF}
  inherited Destroy;
end;

{$IFDEF LIVE_SERVER_AT_DESIGN_TIME}
function TDmCapCarSrv50.GetServerProperties: TDmCapCarSrv50Properties;
begin
  Result := FProps;
end;
{$ENDIF}

function  TDmCapCarSrv50.AS_ApplyUpdates(const ProviderName: WideString; Delta: OleVariant; 
                                         MaxErrors: Integer; out ErrorCount: Integer; 
                                         var OwnerData: OleVariant): OleVariant;
begin
  Result := DefaultInterface.AS_ApplyUpdates(ProviderName, Delta, MaxErrors, ErrorCount, OwnerData);
end;

function  TDmCapCarSrv50.AS_GetRecords(const ProviderName: WideString; Count: Integer; 
                                       out RecsOut: Integer; Options: Integer; 
                                       const CommandText: WideString; var Params: OleVariant; 
                                       var OwnerData: OleVariant): OleVariant;
begin
  Result := DefaultInterface.AS_GetRecords(ProviderName, Count, RecsOut, Options, CommandText, 
                                           Params, OwnerData);
end;

function  TDmCapCarSrv50.AS_DataRequest(const ProviderName: WideString; Data: OleVariant): OleVariant;
begin
  Result := DefaultInterface.AS_DataRequest(ProviderName, Data);
end;

function  TDmCapCarSrv50.AS_GetProviderNames: OleVariant;
begin
  Result := DefaultInterface.AS_GetProviderNames;
end;

function  TDmCapCarSrv50.AS_GetParams(const ProviderName: WideString; var OwnerData: OleVariant): OleVariant;
begin
  Result := DefaultInterface.AS_GetParams(ProviderName, OwnerData);
end;

function  TDmCapCarSrv50.AS_RowRequest(const ProviderName: WideString; Row: OleVariant; 
                                       RequestType: Integer; var OwnerData: OleVariant): OleVariant;
begin
  Result := DefaultInterface.AS_RowRequest(ProviderName, Row, RequestType, OwnerData);
end;

procedure TDmCapCarSrv50.AS_Execute(const ProviderName: WideString; const CommandText: WideString; 
                                    var Params: OleVariant; var OwnerData: OleVariant);
begin
  DefaultInterface.AS_Execute(ProviderName, CommandText, Params, OwnerData);
end;

function  TDmCapCarSrv50.MessageInfo: WideString;
begin
  Result := DefaultInterface.MessageInfo;
end;

function  TDmCapCarSrv50.ConectaDB(const UserName: WideString; const PassWord: WideString; 
                                   const ServerName: WideString): WordBool;
begin
  Result := DefaultInterface.ConectaDB(UserName, PassWord, ServerName);
end;

function  TDmCapCarSrv50.ExecSqlAndCommit(const sSql: WideString): WordBool;
begin
  Result := DefaultInterface.ExecSqlAndCommit(sSql);
end;

function  TDmCapCarSrv50.GetContentFile(const sFileName: WideString): WideString;
begin
  Result := DefaultInterface.GetContentFile(sFileName);
end;

function  TDmCapCarSrv50.GetDadosPessoa(rIDPessoa: Double; TipoGetPessoa: Integer; 
                                        TipoPessoa: Integer; var ovPessoa: OleVariant; 
                                        var ovPessoaFisica: OleVariant; 
                                        var ovDocPessoa: OleVariant; var ovEndPess: OleVariant; 
                                        var ovTelEndPess: OleVariant; 
                                        var ovContatoPess: OleVariant; 
                                        var ovTelContato: OleVariant; 
                                        var ovContaBancaria: OleVariant; 
                                        var ovImagensPessoa: OleVariant; 
                                        var ovImagensDoc: OleVariant; var ovEstado: OleVariant; 
                                        var ovNaturalidade: OleVariant; var ovBanco: OleVariant; 
                                        var ovDocumento: OleVariant; var ovTipoDoc: OleVariant): WordBool;
begin
  Result := DefaultInterface.GetDadosPessoa(rIDPessoa, TipoGetPessoa, TipoPessoa, ovPessoa, 
                                            ovPessoaFisica, ovDocPessoa, ovEndPess, ovTelEndPess, 
                                            ovContatoPess, ovTelContato, ovContaBancaria, 
                                            ovImagensPessoa, ovImagensDoc, ovEstado, 
                                            ovNaturalidade, ovBanco, ovDocumento, ovTipoDoc);
end;

function  TDmCapCarSrv50.GetDataPacket(const sSql: WideString): OleVariant;
begin
  Result := DefaultInterface.GetDataPacket(sSql);
end;

function  TDmCapCarSrv50.GetDataPacketTS(lSQL: OleVariant): OleVariant;
begin
  Result := DefaultInterface.GetDataPacketTS(lSQL);
end;

function  TDmCapCarSrv50.GravaHistSenha(aCdsHistSenha: OleVariant): WordBool;
begin
  Result := DefaultInterface.GravaHistSenha(aCdsHistSenha);
end;

function  TDmCapCarSrv50.GravaLogOperacoes(dIDPessoa: Double; dIDModulo: Double; 
                                           dIDUsuario: Double; const sDescOperacao: WideString): WordBool;
begin
  Result := DefaultInterface.GravaLogOperacoes(dIDPessoa, dIDModulo, dIDUsuario, sDescOperacao);
end;

function  TDmCapCarSrv50.ProcessaMensagem(CdsMensagem: OleVariant; iOperacaoMensage: Integer; 
                                          IDMensagem: Integer): WordBool;
begin
  Result := DefaultInterface.ProcessaMensagem(CdsMensagem, iOperacaoMensage, IDMensagem);
end;

function  TDmCapCarSrv50.ProcessaPessoaAgencia(Operacao: Integer; CdsPessoa: OleVariant; 
                                               CdsPessoaFisica: OleVariant; 
                                               CdsDocPessoa: OleVariant; CdsSubTipo: OleVariant; 
                                               CdsEndPess: OleVariant; CdsTelEndPess: OleVariant; 
                                               CdsContatoPess: OleVariant; 
                                               CdsTelContato: OleVariant; 
                                               CdsContaBancaria: OleVariant; 
                                               CdsImagensPessoa: OleVariant; 
                                               CdsImagensDoc: OleVariant): WordBool;
begin
  Result := DefaultInterface.ProcessaPessoaAgencia(Operacao, CdsPessoa, CdsPessoaFisica, 
                                                   CdsDocPessoa, CdsSubTipo, CdsEndPess, 
                                                   CdsTelEndPess, CdsContatoPess, CdsTelContato, 
                                                   CdsContaBancaria, CdsImagensPessoa, CdsImagensDoc);
end;

function  TDmCapCarSrv50.ProcessaPessoaBanco(Operacao: Integer; CdsPessoa: OleVariant; 
                                             CdsPessoaFisica: OleVariant; CdsDocPessoa: OleVariant; 
                                             CdsSubTipo: OleVariant; CdsEndPess: OleVariant; 
                                             CdsTelEndPess: OleVariant; CdsContatoPess: OleVariant; 
                                             CdsTelContato: OleVariant; 
                                             CdsContaBancaria: OleVariant; 
                                             CdsImagensPessoa: OleVariant; CdsImagensDoc: OleVariant): WordBool;
begin
  Result := DefaultInterface.ProcessaPessoaBanco(Operacao, CdsPessoa, CdsPessoaFisica, 
                                                 CdsDocPessoa, CdsSubTipo, CdsEndPess, 
                                                 CdsTelEndPess, CdsContatoPess, CdsTelContato, 
                                                 CdsContaBancaria, CdsImagensPessoa, CdsImagensDoc);
end;

function  TDmCapCarSrv50.ProcessaPessoaCliente(Operacao: Integer; CdsPessoa: OleVariant; 
                                               CdsPessoaFisica: OleVariant; 
                                               CdsDocPessoa: OleVariant; CdsSubTipo: OleVariant; 
                                               CdsEndPess: OleVariant; CdsTelEndPess: OleVariant; 
                                               CdsContatoPess: OleVariant; 
                                               CdsTelContato: OleVariant; 
                                               CdsContaBancaria: OleVariant; 
                                               CdsImagensPessoa: OleVariant; 
                                               CdsImagensDoc: OleVariant; 
                                               CdsEmpresaCliente: OleVariant; 
                                               CdsTipoRecebCli: OleVariant; 
                                               CdsImAgregCli: OleVariant; CdsTiposCli: OleVariant): WordBool;
begin
  Result := DefaultInterface.ProcessaPessoaCliente(Operacao, CdsPessoa, CdsPessoaFisica, 
                                                   CdsDocPessoa, CdsSubTipo, CdsEndPess, 
                                                   CdsTelEndPess, CdsContatoPess, CdsTelContato, 
                                                   CdsContaBancaria, CdsImagensPessoa, 
                                                   CdsImagensDoc, CdsEmpresaCliente, 
                                                   CdsTipoRecebCli, CdsImAgregCli, CdsTiposCli);
end;

function  TDmCapCarSrv50.ProcessaPessoaForne(Operacao: Integer; CdsPessoa: OleVariant; 
                                             CdsPessoaFisica: OleVariant; CdsDocPessoa: OleVariant; 
                                             CdsSubTipo: OleVariant; CdsEndPess: OleVariant; 
                                             CdsTelEndPess: OleVariant; CdsContatoPess: OleVariant; 
                                             CdsTelContato: OleVariant; 
                                             CdsContaBancaria: OleVariant; 
                                             CdsImagensPessoa: OleVariant; 
                                             CdsImagensDoc: OleVariant; CdsImAgregForn: OleVariant; 
                                             CdsEmpresaForn: OleVariant; 
                                             CdsFornXDesemb: OleVariant; CdsFornXRamo: OleVariant): WordBool;
begin
  Result := DefaultInterface.ProcessaPessoaForne(Operacao, CdsPessoa, CdsPessoaFisica, 
                                                 CdsDocPessoa, CdsSubTipo, CdsEndPess, 
                                                 CdsTelEndPess, CdsContatoPess, CdsTelContato, 
                                                 CdsContaBancaria, CdsImagensPessoa, CdsImagensDoc, 
                                                 CdsImAgregForn, CdsEmpresaForn, CdsFornXDesemb, 
                                                 CdsFornXRamo);
end;

function  TDmCapCarSrv50.SelDadosCli(rIDEmpresa: Double; rIDForCli: Double; 
                                     out ovSubTipo: OleVariant; out ovEmpresaCliente: OleVariant; 
                                     out ovTipoReceb: OleVariant; out ovTipoRecebCli: OleVariant; 
                                     out ovImAgreg: OleVariant; out ovImAgregCli: OleVariant; 
                                     out ovTipos: OleVariant; out ovTiposCli: OleVariant): WordBool;
begin
  Result := DefaultInterface.SelDadosCli(rIDEmpresa, rIDForCli, ovSubTipo, ovEmpresaCliente, 
                                         ovTipoReceb, ovTipoRecebCli, ovImAgreg, ovImAgregCli, 
                                         ovTipos, ovTiposCli);
end;

function  TDmCapCarSrv50.SelDadosForne(rIDEmpresa: Double; rIDForCli: Double; 
                                       out ovSubTipo: OleVariant; out ovEmpresaForne: OleVariant; 
                                       out ovTipoDesemb: OleVariant; out ovImAgreg: OleVariant; 
                                       out ovRamoForne: OleVariant; 
                                       out ovTipoDesembForn: OleVariant; 
                                       out ovImAgregForn: OleVariant; out ovRamoXForne: OleVariant): WordBool;
begin
  Result := DefaultInterface.SelDadosForne(rIDEmpresa, rIDForCli, ovSubTipo, ovEmpresaForne, 
                                           ovTipoDesemb, ovImAgreg, ovRamoForne, ovTipoDesembForn, 
                                           ovImAgregForn, ovRamoXForne);
end;

function  TDmCapCarSrv50.GravarRamoxdesemb(Cds: OleVariant): WordBool;
begin
  Result := DefaultInterface.GravarRamoxdesemb(Cds);
end;

function  TDmCapCarSrv50.Gravarcheques(Cds: OleVariant): WordBool;
begin
  Result := DefaultInterface.Gravarcheques(Cds);
end;

function  TDmCapCarSrv50.GravarTipoclixreceb(Cds: OleVariant): WordBool;
begin
  Result := DefaultInterface.GravarTipoclixreceb(Cds);
end;

function  TDmCapCarSrv50.GravarReimprBloq(Cds: OleVariant; pLimpaNossoNumero: WordBool): WordBool;
begin
  Result := DefaultInterface.GravarReimprBloq(Cds, pLimpaNossoNumero);
end;

function  TDmCapCarSrv50.GravarMensagensCnab(fcodDocumento: Integer; PageIndex: Integer; 
                                             const Mens0: WideString; const Mens1: WideString; 
                                             const Mens2: WideString; const Mens3: WideString; 
                                             const Mens4: WideString; const Mens5: WideString; 
                                             const Mens6: WideString; const Mens7: WideString; 
                                             const Mens8: WideString; OvBloq: OleVariant; 
                                             bDeleta: WordBool): WordBool;
begin
  Result := DefaultInterface.GravarMensagensCnab(fcodDocumento, PageIndex, Mens0, Mens1, Mens2, 
                                                 Mens3, Mens4, Mens5, Mens6, Mens7, Mens8, OvBloq, 
                                                 bDeleta);
end;

function  TDmCapCarSrv50.DeletaMensagens(CodDocumento: Double): WordBool;
begin
  Result := DefaultInterface.DeletaMensagens(CodDocumento);
end;

function  TDmCapCarSrv50.GravarDocxCobranca(DocPendentes: OleVariant; DocAssoc: OleVariant; 
                                            const sIdConta: WideString; ApagaExistentes: WordBool; 
                                            Mensagens: WordBool): WordBool;
begin
  Result := DefaultInterface.GravarDocxCobranca(DocPendentes, DocAssoc, sIdConta, ApagaExistentes, 
                                                Mensagens);
end;

function  TDmCapCarSrv50.GravarClasfisxtipoagre(Cds: OleVariant): WordBool;
begin
  Result := DefaultInterface.GravarClasfisxtipoagre(Cds);
end;

function  TDmCapCarSrv50.GravarClasfisclifor(Cds: OleVariant): WordBool;
begin
  Result := DefaultInterface.GravarClasfisclifor(Cds);
end;

function  TDmCapCarSrv50.GravarTiprecdesxtipagre(Cds: OleVariant): WordBool;
begin
  Result := DefaultInterface.GravarTiprecdesxtipagre(Cds);
end;

function  TDmCapCarSrv50.GravarAltxccxprgxconta(Cds: OleVariant): WordBool;
begin
  Result := DefaultInterface.GravarAltxccxprgxconta(Cds);
end;

function  TDmCapCarSrv50.GravarAltccprgconta_Aplica(Cds: OleVariant): WordBool;
begin
  Result := DefaultInterface.GravarAltccprgconta_Aplica(Cds);
end;

function  TDmCapCarSrv50.GravarConfigbarras(Cds: OleVariant): WordBool;
begin
  Result := DefaultInterface.GravarConfigbarras(Cds);
end;

function  TDmCapCarSrv50.GravarCodigoscnab(Cds: OleVariant): WordBool;
begin
  Result := DefaultInterface.GravarCodigoscnab(Cds);
end;

function  TDmCapCarSrv50.GravarConfigbloquete(Cds: OleVariant): WordBool;
begin
  Result := DefaultInterface.GravarConfigbloquete(Cds);
end;

function  TDmCapCarSrv50.GravarConfigCheque(Cds: OleVariant): WordBool;
begin
  Result := DefaultInterface.GravarConfigCheque(Cds);
end;

function  TDmCapCarSrv50.GravarFormaRecPag(Cds: OleVariant): WordBool;
begin
  Result := DefaultInterface.GravarFormaRecPag(Cds);
end;

function  TDmCapCarSrv50.GravarIntBancoXPortForm(Cds: OleVariant): WordBool;
begin
  Result := DefaultInterface.GravarIntBancoXPortForm(Cds);
end;

function  TDmCapCarSrv50.GravarModeloscnab(Cds: OleVariant): WordBool;
begin
  Result := DefaultInterface.GravarModeloscnab(Cds);
end;

function  TDmCapCarSrv50.GravaRelatorio(Cds: OleVariant): WordBool;
begin
  Result := DefaultInterface.GravaRelatorio(Cds);
end;

function  TDmCapCarSrv50.GravaParamCap(Cds: OleVariant): WordBool;
begin
  Result := DefaultInterface.GravaParamCap(Cds);
end;

function  TDmCapCarSrv50.GravarPortadorconta(Cds: OleVariant): WordBool;
begin
  Result := DefaultInterface.GravarPortadorconta(Cds);
end;

function  TDmCapCarSrv50.GravarPortadorforma(Cds: OleVariant): WordBool;
begin
  Result := DefaultInterface.GravarPortadorforma(Cds);
end;

function  TDmCapCarSrv50.GravarTemplbloqcheque(Cds: OleVariant; Cds2: OleVariant): WordBool;
begin
  Result := DefaultInterface.GravarTemplbloqcheque(Cds, Cds2);
end;

function  TDmCapCarSrv50.ExcluirTemplbloqcheque(Cds: OleVariant; Cds2: OleVariant): WordBool;
begin
  Result := DefaultInterface.ExcluirTemplbloqcheque(Cds, Cds2);
end;

function  TDmCapCarSrv50.GravarTemplcheque(Cds: OleVariant; Cds2: OleVariant): WordBool;
begin
  Result := DefaultInterface.GravarTemplcheque(Cds, Cds2);
end;

function  TDmCapCarSrv50.ExcluirTemplcheque(Cds: OleVariant; Cds2: OleVariant): WordBool;
begin
  Result := DefaultInterface.ExcluirTemplcheque(Cds, Cds2);
end;

function  TDmCapCarSrv50.GravarTipcustagregconta(Cds: OleVariant): WordBool;
begin
  Result := DefaultInterface.GravarTipcustagregconta(Cds);
end;

function  TDmCapCarSrv50.GravarTipoagre(Cds: OleVariant): WordBool;
begin
  Result := DefaultInterface.GravarTipoagre(Cds);
end;

function  TDmCapCarSrv50.GravarTipoalterador(Cds: OleVariant): WordBool;
begin
  Result := DefaultInterface.GravarTipoalterador(Cds);
end;

function  TDmCapCarSrv50.GravarTipodocrecpag(Cds: OleVariant): WordBool;
begin
  Result := DefaultInterface.GravarTipodocrecpag(Cds);
end;

function  TDmCapCarSrv50.GravarTipofatxclasfis(Cds: OleVariant): WordBool;
begin
  Result := DefaultInterface.GravarTipofatxclasfis(Cds);
end;

function  TDmCapCarSrv50.GravarTipordcorresp(Cds: OleVariant): WordBool;
begin
  Result := DefaultInterface.GravarTipordcorresp(Cds);
end;

function  TDmCapCarSrv50.GravarTipoRecebDesemb(Cds: OleVariant): WordBool;
begin
  Result := DefaultInterface.GravarTipoRecebDesemb(Cds);
end;

function  TDmCapCarSrv50.AlteraVencimento(Cod: Integer; Data: TDateTime): WordBool;
begin
  Result := DefaultInterface.AlteraVencimento(Cod, Data);
end;

procedure TDmCapCarSrv50.ConfigFatNotaReciboProcessaCds(Cds: OleVariant);
begin
  DefaultInterface.ConfigFatNotaReciboProcessaCds(Cds);
end;

function  TDmCapCarSrv50.GravarTipordxccxconta(Cds: OleVariant): WordBool;
begin
  Result := DefaultInterface.GravarTipordxccxconta(Cds);
end;

function  TDmCapCarSrv50.GravarTipordxccxconta_aplica(Cds: OleVariant): WordBool;
begin
  Result := DefaultInterface.GravarTipordxccxconta_aplica(Cds);
end;

{$IFDEF LIVE_SERVER_AT_DESIGN_TIME}
constructor TDmCapCarSrv50Properties.Create(AServer: TDmCapCarSrv50);
begin
  inherited Create;
  FServer := AServer;
end;

function TDmCapCarSrv50Properties.GetDefaultInterface: IDmCapCarSrv50;
begin
  Result := FServer.DefaultInterface;
end;

{$ENDIF}

procedure Register;
begin
  RegisterComponents('Servers',[TDmCapCarSrv50]);
end;

end.
