unit ServerDemoBO_TLB;

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
// File generated on 15/11/2001 11:13:44 from Type Library described below.

// ************************************************************************ //
// Type Lib: C:\ProjetosCM5\Cm\Utils\DemoBO\AppServer\ServerDemoBO.tlb (1)
// IID\LCID: {CEF59531-D9D1-11D5-B185-000000000000}\0
// Helpfile: 
// DepndLst: 
//   (1) v2.0 stdole, (C:\WINNT\System32\StdOle2.Tlb)
//   (2) v4.0 StdVCL, (C:\WINNT\System32\STDVCL40.DLL)
//   (3) v1.0 Midas, (C:\WINNT\System32\midas.dll)
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
  ServerDemoBOMajorVersion = 1;
  ServerDemoBOMinorVersion = 0;

  LIBID_ServerDemoBO: TGUID = '{CEF59531-D9D1-11D5-B185-000000000000}';

  IID_IDmDemoBO: TGUID = '{CEF59532-D9D1-11D5-B185-000000000000}';
  CLASS_DmDemoBO: TGUID = '{CEF59534-D9D1-11D5-B185-000000000000}';
type

// *********************************************************************//
// Forward declaration of types defined in TypeLibrary                    
// *********************************************************************//
  IDmDemoBO = interface;
  IDmDemoBODisp = dispinterface;

// *********************************************************************//
// Declaration of CoClasses defined in Type Library                       
// (NOTE: Here we map each CoClass to its Default Interface)              
// *********************************************************************//
  DmDemoBO = IDmDemoBO;


// *********************************************************************//
// Interface: IDmDemoBO
// Flags:     (4416) Dual OleAutomation Dispatchable
// GUID:      {CEF59532-D9D1-11D5-B185-000000000000}
// *********************************************************************//
  IDmDemoBO = interface(IAppServer)
    ['{CEF59532-D9D1-11D5-B185-000000000000}']
  end;

// *********************************************************************//
// DispIntf:  IDmDemoBODisp
// Flags:     (4416) Dual OleAutomation Dispatchable
// GUID:      {CEF59532-D9D1-11D5-B185-000000000000}
// *********************************************************************//
  IDmDemoBODisp = dispinterface
    ['{CEF59532-D9D1-11D5-B185-000000000000}']
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
// The Class CoDmDemoBO provides a Create and CreateRemote method to          
// create instances of the default interface IDmDemoBO exposed by              
// the CoClass DmDemoBO. The functions are intended to be used by             
// clients wishing to automate the CoClass objects exposed by the         
// server of this typelibrary.                                            
// *********************************************************************//
  CoDmDemoBO = class
    class function Create: IDmDemoBO;
    class function CreateRemote(const MachineName: string): IDmDemoBO;
  end;

implementation

uses ComObj;

class function CoDmDemoBO.Create: IDmDemoBO;
begin
  Result := CreateComObject(CLASS_DmDemoBO) as IDmDemoBO;
end;

class function CoDmDemoBO.CreateRemote(const MachineName: string): IDmDemoBO;
begin
  Result := CreateRemoteComObject(MachineName, CLASS_DmDemoBO) as IDmDemoBO;
end;

end.
