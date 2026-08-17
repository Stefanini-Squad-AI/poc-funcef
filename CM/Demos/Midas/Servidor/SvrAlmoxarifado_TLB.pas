unit SvrAlmoxarifado_TLB;

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
// File generated on 05/09/2001 15:08:17 from Type Library described below.

// ************************************************************************ //
// Type Lib: C:\ProjetosCM5\Almoxarifado\Servidor\SvrAlmoxarifado.tlb (1)
// IID\LCID: {D3A325CF-EA5B-488B-8EF0-325C823DC529}\0
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
  SvrAlmoxarifadoMajorVersion = 1;
  SvrAlmoxarifadoMinorVersion = 0;

  LIBID_SvrAlmoxarifado: TGUID = '{D3A325CF-EA5B-488B-8EF0-325C823DC529}';

  IID_IRdmAlmoxarifado: TGUID = '{ABE7003E-DFF2-468C-A50E-28EC0B8B9F32}';
  CLASS_RdmAlmoxarifado: TGUID = '{99C58BF5-F272-4E62-8101-F2AB2DD454BA}';
type

// *********************************************************************//
// Forward declaration of types defined in TypeLibrary                    
// *********************************************************************//
  IRdmAlmoxarifado = interface;
  IRdmAlmoxarifadoDisp = dispinterface;

// *********************************************************************//
// Declaration of CoClasses defined in Type Library                       
// (NOTE: Here we map each CoClass to its Default Interface)              
// *********************************************************************//
  RdmAlmoxarifado = IRdmAlmoxarifado;


// *********************************************************************//
// Interface: IRdmAlmoxarifado
// Flags:     (4416) Dual OleAutomation Dispatchable
// GUID:      {ABE7003E-DFF2-468C-A50E-28EC0B8B9F32}
// *********************************************************************//
  IRdmAlmoxarifado = interface(IAppServer)
    ['{ABE7003E-DFF2-468C-A50E-28EC0B8B9F32}']
    function  Inserir(CdsAlmox: OleVariant): WordBool; safecall;
    function  Alterar(CdsAlmox: OleVariant): WordBool; safecall;
    function  Deletar(iIdAlmox: Double): WordBool; safecall;
    function  MessageInfo: WideString; safecall;
    function  ConectaDb(const UserName: WideString; const PassWord: WideString; 
                        const ServerName: WideString): WordBool; safecall;
  end;

// *********************************************************************//
// DispIntf:  IRdmAlmoxarifadoDisp
// Flags:     (4416) Dual OleAutomation Dispatchable
// GUID:      {ABE7003E-DFF2-468C-A50E-28EC0B8B9F32}
// *********************************************************************//
  IRdmAlmoxarifadoDisp = dispinterface
    ['{ABE7003E-DFF2-468C-A50E-28EC0B8B9F32}']
    function  Inserir(CdsAlmox: OleVariant): WordBool; dispid 1;
    function  Alterar(CdsAlmox: OleVariant): WordBool; dispid 2;
    function  Deletar(iIdAlmox: Double): WordBool; dispid 3;
    function  MessageInfo: WideString; dispid 4;
    function  ConectaDb(const UserName: WideString; const PassWord: WideString; 
                        const ServerName: WideString): WordBool; dispid 5;
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
// The Class CoRdmAlmoxarifado provides a Create and CreateRemote method to          
// create instances of the default interface IRdmAlmoxarifado exposed by              
// the CoClass RdmAlmoxarifado. The functions are intended to be used by             
// clients wishing to automate the CoClass objects exposed by the         
// server of this typelibrary.                                            
// *********************************************************************//
  CoRdmAlmoxarifado = class
    class function Create: IRdmAlmoxarifado;
    class function CreateRemote(const MachineName: string): IRdmAlmoxarifado;
  end;

implementation

uses ComObj;

class function CoRdmAlmoxarifado.Create: IRdmAlmoxarifado;
begin
  Result := CreateComObject(CLASS_RdmAlmoxarifado) as IRdmAlmoxarifado;
end;

class function CoRdmAlmoxarifado.CreateRemote(const MachineName: string): IRdmAlmoxarifado;
begin
  Result := CreateRemoteComObject(MachineName, CLASS_RdmAlmoxarifado) as IRdmAlmoxarifado;
end;

end.
