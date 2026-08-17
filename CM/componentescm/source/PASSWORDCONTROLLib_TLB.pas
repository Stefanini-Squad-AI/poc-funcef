unit PASSWORDCONTROLLib_TLB;

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
// File generated on 04/04/2001 22:34:57 from Type Library described below.

// ************************************************************************ //
// Type Lib: C:\WINNT\System32\passcryp.dll (1)
// IID\LCID: {84382D75-F855-11D1-841C-3891B9000000}\0
// Helpfile: 
// DepndLst: 
//   (1) v2.0 stdole, (C:\WINNT\System32\stdole2.tlb)
//   (2) v4.0 StdVCL, (C:\WINNT\System32\STDVCL40.DLL)
// Errors:
//   Error creating palette bitmap of (TPasswordCtl) : Error reading control bitmap
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
  PASSWORDCONTROLLibMajorVersion = 1;
  PASSWORDCONTROLLibMinorVersion = 0;

  LIBID_PASSWORDCONTROLLib: TGUID = '{84382D75-F855-11D1-841C-3891B9000000}';

  IID_IPasswordCtl: TGUID = '{84382D82-F855-11D1-841C-3891B9000000}';
  CLASS_PasswordCtl: TGUID = '{84382D83-F855-11D1-841C-3891B9000000}';

// *********************************************************************//
// Declaration of Enumerations defined in Type Library                    
// *********************************************************************//
// Constants for enum tagAlgorithm
type
  tagAlgorithm = TOleEnum;
const
  ALG_MD2 = $00008001;
  ALG_MD4 = $00008002;
  ALG_MD5 = $00008003;
  ALG_SHA1 = $00008004;
  ALG_MAC = $00008005;

type

// *********************************************************************//
// Forward declaration of types defined in TypeLibrary                    
// *********************************************************************//
  IPasswordCtl = interface;
  IPasswordCtlDisp = dispinterface;

// *********************************************************************//
// Declaration of CoClasses defined in Type Library                       
// (NOTE: Here we map each CoClass to its Default Interface)              
// *********************************************************************//
  PasswordCtl = IPasswordCtl;


// *********************************************************************//
// Interface: IPasswordCtl
// Flags:     (4416) Dual OleAutomation Dispatchable
// GUID:      {84382D82-F855-11D1-841C-3891B9000000}
// *********************************************************************//
  IPasswordCtl = interface(IDispatch)
    ['{84382D82-F855-11D1-841C-3891B9000000}']
    function  GenHash(const Password: WideString): WideString; safecall;
    function  Get_Algorithm: tagAlgorithm; safecall;
    procedure Set_Algorithm(pVal: tagAlgorithm); safecall;
    property Algorithm: tagAlgorithm read Get_Algorithm write Set_Algorithm;
  end;

// *********************************************************************//
// DispIntf:  IPasswordCtlDisp
// Flags:     (4416) Dual OleAutomation Dispatchable
// GUID:      {84382D82-F855-11D1-841C-3891B9000000}
// *********************************************************************//
  IPasswordCtlDisp = dispinterface
    ['{84382D82-F855-11D1-841C-3891B9000000}']
    function  GenHash(const Password: WideString): WideString; dispid 1;
    property Algorithm: tagAlgorithm dispid 2;
  end;


// *********************************************************************//
// OLE Control Proxy class declaration
// Control Name     : TPasswordCtl
// Help String      : PasswordCtl Class
// Default Interface: IPasswordCtl
// Def. Intf. DISP? : No
// Event   Interface: 
// TypeFlags        : (2) CanCreate
// *********************************************************************//
  TPasswordCtl = class(TOleControl)
  private
    FIntf: IPasswordCtl;
    function  GetControlInterface: IPasswordCtl;
  protected
    procedure CreateControl;
    procedure InitControlData; override;
  public
    function  GenHash(const Password: WideString): WideString;
    property  ControlInterface: IPasswordCtl read GetControlInterface;
    property  DefaultInterface: IPasswordCtl read GetControlInterface;
  published
    property Algorithm: TOleEnum index 2 read GetTOleEnumProp write SetTOleEnumProp stored False;
  end;

procedure Register;

implementation

uses ComObj;

procedure TPasswordCtl.InitControlData;
const
  CControlData: TControlData2 = (
    ClassID: '{84382D83-F855-11D1-841C-3891B9000000}';
    EventIID: '';
    EventCount: 0;
    EventDispIDs: nil;
    LicenseKey: nil (*HR:$80040154*);
    Flags: $00000000;
    Version: 401);
begin
  ControlData := @CControlData;
end;

procedure TPasswordCtl.CreateControl;

  procedure DoCreate;
  begin
    FIntf := IUnknown(OleObject) as IPasswordCtl;
  end;

begin
  if FIntf = nil then DoCreate;
end;

function TPasswordCtl.GetControlInterface: IPasswordCtl;
begin
  CreateControl;
  Result := FIntf;
end;

function  TPasswordCtl.GenHash(const Password: WideString): WideString;
begin
  Result := DefaultInterface.GenHash(Password);
end;

procedure Register;
begin
  RegisterComponents('ActiveX',[TPasswordCtl]);
end;

end.
