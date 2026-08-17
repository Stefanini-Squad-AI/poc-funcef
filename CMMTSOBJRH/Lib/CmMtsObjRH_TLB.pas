unit CmMtsObjRH_TLB;

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
// File generated on 23/01/2003 15:13:45 from Type Library described below.

// ************************************************************************ //
// Type Lib: C:\ProjetosCM5\CmMtsObjRH\Lib\CmMtsObjRH.tlb (1)
// IID\LCID: {88988C7F-4AF3-4118-9884-DA010AED948A}\0
// Helpfile: 
// DepndLst: 
//   (1) v2.0 stdole, (C:\WINNT\System32\stdole2.tlb)
//   (2) v4.0 StdVCL, (C:\WINNT\System32\STDVCL40.DLL)
// ************************************************************************ //
{$TYPEDADDRESS OFF} // Unit must be compiled without type-checked pointers. 
interface

uses Windows, ActiveX, Classes, Graphics, OleServer, OleCtrls, StdVCL;

// *********************************************************************//
// GUIDS declared in the TypeLibrary. Following prefixes are used:        
//   Type Libraries     : LIBID_xxxx                                      
//   CoClasses          : CLASS_xxxx                                      
//   DISPInterfaces     : DIID_xxxx                                       
//   Non-DISP interfaces: IID_xxxx                                        
// *********************************************************************//
const
  // TypeLibrary Major and minor versions
  CmMtsObjRHMajorVersion = 1;
  CmMtsObjRHMinorVersion = 0;

  LIBID_CmMtsObjRH: TGUID = '{88988C7F-4AF3-4118-9884-DA010AED948A}';

  IID_IObjRubricaIndiv: TGUID = '{6061428E-E816-4BE4-BC71-5CAE6C7EEC9E}';
  CLASS_ObjRubricaIndiv: TGUID = '{F37C851A-B0B7-4D18-936E-A296CFC461FC}';
type

// *********************************************************************//
// Forward declaration of types defined in TypeLibrary                    
// *********************************************************************//
  IObjRubricaIndiv = interface;
  IObjRubricaIndivDisp = dispinterface;

// *********************************************************************//
// Declaration of CoClasses defined in Type Library                       
// (NOTE: Here we map each CoClass to its Default Interface)              
// *********************************************************************//
  ObjRubricaIndiv = IObjRubricaIndiv;


// *********************************************************************//
// Interface: IObjRubricaIndiv
// Flags:     (4416) Dual OleAutomation Dispatchable
// GUID:      {6061428E-E816-4BE4-BC71-5CAE6C7EEC9E}
// *********************************************************************//
  IObjRubricaIndiv = interface(IDispatch)
    ['{6061428E-E816-4BE4-BC71-5CAE6C7EEC9E}']
    function  GetXmlRubricaIndiv(var sMensagem: WideString; var sConnectionString: WideString; 
                                 IdPessoa: Double; var XmlRubricaIndiv: WideString): WordBool; safecall;
    function  GravarRubricaIndiv(var sMensagem: WideString; var sConnectionString: WideString; 
                                 bControlaTransacao: WordBool; const XmlRubricaIndiv: WideString): WordBool; safecall;
    function  GetProximoNumSeq(var sMensagem: WideString; var sConnectionString: WideString; 
                               IdPessoa: Double; IdRubrica: Double; IdEmpresa: Integer; 
                               var ProximoNumSeq: Integer): WordBool; safecall;
  end;

// *********************************************************************//
// DispIntf:  IObjRubricaIndivDisp
// Flags:     (4416) Dual OleAutomation Dispatchable
// GUID:      {6061428E-E816-4BE4-BC71-5CAE6C7EEC9E}
// *********************************************************************//
  IObjRubricaIndivDisp = dispinterface
    ['{6061428E-E816-4BE4-BC71-5CAE6C7EEC9E}']
    function  GetXmlRubricaIndiv(var sMensagem: WideString; var sConnectionString: WideString; 
                                 IdPessoa: Double; var XmlRubricaIndiv: WideString): WordBool; dispid 3;
    function  GravarRubricaIndiv(var sMensagem: WideString; var sConnectionString: WideString; 
                                 bControlaTransacao: WordBool; const XmlRubricaIndiv: WideString): WordBool; dispid 1;
    function  GetProximoNumSeq(var sMensagem: WideString; var sConnectionString: WideString; 
                               IdPessoa: Double; IdRubrica: Double; IdEmpresa: Integer; 
                               var ProximoNumSeq: Integer): WordBool; dispid 2;
  end;

// *********************************************************************//
// The Class CoObjRubricaIndiv provides a Create and CreateRemote method to          
// create instances of the default interface IObjRubricaIndiv exposed by              
// the CoClass ObjRubricaIndiv. The functions are intended to be used by             
// clients wishing to automate the CoClass objects exposed by the         
// server of this typelibrary.                                            
// *********************************************************************//
  CoObjRubricaIndiv = class
    class function Create: IObjRubricaIndiv;
    class function CreateRemote(const MachineName: string): IObjRubricaIndiv;
  end;

implementation

uses ComObj;

class function CoObjRubricaIndiv.Create: IObjRubricaIndiv;
begin
  Result := CreateComObject(CLASS_ObjRubricaIndiv) as IObjRubricaIndiv;
end;

class function CoObjRubricaIndiv.CreateRemote(const MachineName: string): IObjRubricaIndiv;
begin
  Result := CreateRemoteComObject(MachineName, CLASS_ObjRubricaIndiv) as IObjRubricaIndiv;
end;

end.
