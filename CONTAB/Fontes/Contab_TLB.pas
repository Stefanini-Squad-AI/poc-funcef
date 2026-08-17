unit Contab_TLB;

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
// File generated on 04/05/2004 16:34:19 from Type Library described below.

// ************************************************************************ //
// Type Lib: C:\ProjetosCM5\Contab\Fontes\Contab.tlb (1)
// IID\LCID: {01A7E221-7502-11D4-B8A1-0050DACF7228}\0
// Helpfile: 
// DepndLst: 
//   (1) v1.0 stdole, (C:\WINNT\system32\stdole32.tlb)
//   (2) v1.0 StdVCL, (C:\WINNT\System32\STDVCL32.DLL)
// Errors:
//   Hint: Parameter 'AtivProj' of ICMContabRegra.SaldoConta changed to 'AtivProj_'
//   Hint: Parameter 'Valor' of ICMContabRegra.Exp changed to 'Valor_'
//   Hint: Parameter 'AtivProj' of ICMContabRegra.MovConta changed to 'AtivProj_'
//   Hint: Parameter 'AtivProj' of ICMContabRegra.Mov_D changed to 'AtivProj_'
//   Hint: Parameter 'AtivProj' of ICMContabRegra.Mov_C changed to 'AtivProj_'
//   Hint: Parameter 'NumExAnt' of ICMContabRegra.SaldoContaExAnt changed to 'NumExAnt_'
//   Hint: Parameter 'NumExAnt' of ICMContabRegra.MovContaPerAnt changed to 'NumExAnt_'
//   Hint: Parameter 'NumExAnt' of ICMContabRegra.Mov_DPerAnt changed to 'NumExAnt_'
//   Hint: Parameter 'NumExAnt' of ICMContabRegra.Mov_CPerAnt changed to 'NumExAnt_'
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
  ContabMajorVersion = 1;
  ContabMinorVersion = 0;

  LIBID_Contab: TGUID = '{01A7E221-7502-11D4-B8A1-0050DACF7228}';


implementation

uses ComObj;

end.
