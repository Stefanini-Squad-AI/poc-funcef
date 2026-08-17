unit MtsMestreDetalhe_TLB;

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
// File generated on 08/01/2003 20:55:38 from Type Library described below.

// ************************************************************************ //
// Type Lib: C:\ProjetosCM5\MtsMestreDetalhe\Lib\MtsMestreDetalhe.tlb (1)
// IID\LCID: {1AEB3C3B-BC77-4F79-9B6B-E8402D1B6DDD}\0
// Helpfile: 
// DepndLst: 
//   (1) v2.0 stdole, (C:\WINNT\System32\Stdole2.tlb)
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
  MtsMestreDetalheMajorVersion = 1;
  MtsMestreDetalheMinorVersion = 0;

  LIBID_MtsMestreDetalhe: TGUID = '{1AEB3C3B-BC77-4F79-9B6B-E8402D1B6DDD}';

  IID_IObjMestreDetalhe: TGUID = '{93F023C4-9379-4EE5-A6F7-4FD8123B0849}';
  CLASS_ObjMestreDetalhe: TGUID = '{24C16C46-77AB-4D35-9288-DECEFA07EBFB}';
type

// *********************************************************************//
// Forward declaration of types defined in TypeLibrary                    
// *********************************************************************//
  IObjMestreDetalhe = interface;
  IObjMestreDetalheDisp = dispinterface;

// *********************************************************************//
// Declaration of CoClasses defined in Type Library                       
// (NOTE: Here we map each CoClass to its Default Interface)              
// *********************************************************************//
  ObjMestreDetalhe = IObjMestreDetalhe;


// *********************************************************************//
// Interface: IObjMestreDetalhe
// Flags:     (4416) Dual OleAutomation Dispatchable
// GUID:      {93F023C4-9379-4EE5-A6F7-4FD8123B0849}
// *********************************************************************//
  IObjMestreDetalhe = interface(IDispatch)
    ['{93F023C4-9379-4EE5-A6F7-4FD8123B0849}']
    function  ProcessaXml(var sMensagem: WideString; const XmlTbMestre: WideString; 
                          const XmlTbDetalhe: WideString; Operacao: Integer; 
                          const sConnectionString: WideString; bControlaTransacao: WordBool): WordBool; safecall;
    function  ExcluiMestreDet(var sMensagem: WideString; IdTbMestre: Integer; 
                              const sConnectionString: WideString; bControlaTransacao: WordBool): WordBool; safecall;
    function  GetXml(var sMensagem: WideString; var XmlMestre: WideString; 
                     var XmlDetalhe: WideString; IdTbMestre: Integer; 
                     const sConnectionString: WideString): WordBool; safecall;
  end;

// *********************************************************************//
// DispIntf:  IObjMestreDetalheDisp
// Flags:     (4416) Dual OleAutomation Dispatchable
// GUID:      {93F023C4-9379-4EE5-A6F7-4FD8123B0849}
// *********************************************************************//
  IObjMestreDetalheDisp = dispinterface
    ['{93F023C4-9379-4EE5-A6F7-4FD8123B0849}']
    function  ProcessaXml(var sMensagem: WideString; const XmlTbMestre: WideString; 
                          const XmlTbDetalhe: WideString; Operacao: Integer; 
                          const sConnectionString: WideString; bControlaTransacao: WordBool): WordBool; dispid 2;
    function  ExcluiMestreDet(var sMensagem: WideString; IdTbMestre: Integer; 
                              const sConnectionString: WideString; bControlaTransacao: WordBool): WordBool; dispid 1;
    function  GetXml(var sMensagem: WideString; var XmlMestre: WideString; 
                     var XmlDetalhe: WideString; IdTbMestre: Integer; 
                     const sConnectionString: WideString): WordBool; dispid 3;
  end;

// *********************************************************************//
// The Class CoObjMestreDetalhe provides a Create and CreateRemote method to          
// create instances of the default interface IObjMestreDetalhe exposed by              
// the CoClass ObjMestreDetalhe. The functions are intended to be used by             
// clients wishing to automate the CoClass objects exposed by the         
// server of this typelibrary.                                            
// *********************************************************************//
  CoObjMestreDetalhe = class
    class function Create: IObjMestreDetalhe;
    class function CreateRemote(const MachineName: string): IObjMestreDetalhe;
  end;

implementation

uses ComObj;

class function CoObjMestreDetalhe.Create: IObjMestreDetalhe;
begin
  Result := CreateComObject(CLASS_ObjMestreDetalhe) as IObjMestreDetalhe;
end;

class function CoObjMestreDetalhe.CreateRemote(const MachineName: string): IObjMestreDetalhe;
begin
  Result := CreateRemoteComObject(MachineName, CLASS_ObjMestreDetalhe) as IObjMestreDetalhe;
end;

end.
