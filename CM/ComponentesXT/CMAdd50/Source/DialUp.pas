(****************************************** |******************************************
 *  DIALUP, telefonicke pripojeni site    * |*  DIALUP, dial-up networking component  *
 *     komponenta pro Delphi 3,4,5 (32b)  * |*                 for Delphi 3,4,5 (32b) *
 *             (c) 1998,99,2000 BEALsoft  * |*              (c) 1998,99,2000 BEALsoft *
 *                       v2.0             * |*                       v2.0             *
 *________________________________________* |*________________________________________*
 *    !! TATO KOMPONENTA JE ZDARMA !!     * |*     !! THIS COMPONENT IS FREE !!       *
 ****************************************** |******************************************)
// Autor / Author:
// Aleš Berka, aberka@atlas.cz, ICQ UIN 2365308, http://bealsoft.cjb.net/ or http://bealsoft.zde.cz/
// - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -
// See README.TXT for details, description of properties and methods
// Prectete si CTIMNE.TXT, kde jsou popsany vsechny dulezite funkce a vlastnosti

// Thanx to Davide Moretti for his RAS API and TAPI header (Quite big amount of
// code in this component is his work). You can reach him via e-mail: dave@rimini.com
// Also thanx to Magenta Systems ltd. for perfstats methods!

// Note: This component doesn't like multiple instance (to avoid troubles, maintain
//       only one instance of this component.

// News in v1.1
//   fixed bug - SetEntryUserName and SetEntryPassword
//   new - dynamic loading of dll, only when needed => you can add this component to
//         delphi on computer w/out RAS DLLs.
//
// News in v1.2
//   new - GetIP(<HANDLE_TO_CONNECTION>) sets properties ServerIP,ClientIP
//
// News in v1.3
//   new - In Win98, Win95 (with MSDUN 1.2 [MSDUN12.exe] installed) and in WinNT you can get
//           transfer statistics. Except NT you can also get connection speed.
//           InitializePerfStats(BOOL,BOOL) - 1st BOOL - Get values immediately
//                                            2nd BOOL - Don't use DUNA_KEY property,
//                                                       use 1st value found in registry {RECOMMENDED}
//                                                        // Available keys are in DUNA after calling SearchDUNA
//           GetPerfStats - write actual values into properties:
//                        - BytesXmit,BytesRecv,ConnectionSpeed
// News in v1.31
//   new - PORTUGUESE translation ;-)
// News in v1.32
//   new - POLISH translation (Wow! This component seems to be internation soon :-) )
//
// News in v2.0
//   new - imported D. Moretti's TAPI header
//   new - Language independent code (languages are stored in resources)
//         by WK (THANX!)
//   new - German translation - also thanx to WK
//   fix - compatibility with C++ builder (thanx to Peter Mojdis)
//   new - Connection speed is also available for Windows NT 4.0> (2000)
//   change -
//           InitializePerfStats(BOOL,BOOL,HANDLE,PCHAR)
//                                     - 1st BOOL - Get values immediately
//                                       2nd BOOL - Don't use DUNA_KEY property,
//                                         use 1st value found in registry {RECOMMENDED}
//                                         // Available keys are in DUNA after calling SearchDUNA
//                                       HANDLE - RAS connection handle from which get
//                                                connection speed under NT
//                                       PCHAR - RAS device-name
//

unit DialUp;

interface

uses
  SysUtils, Windows, Dialogs, Classes, ExtCtrls, Forms, Messages;

{$R DIALLANG.RES}

const MaxEntries = 100; //It's enough

type
{******************************************************}
{******************************************************}

  PPERF_DATA_BLOCK = ^PERF_DATA_BLOCK ;
  PERF_DATA_BLOCK = RECORD  // pdb
                      Signature:  Array[0..3] Of WideChar; // Signature: Unicode "PERF"
                      LittleEndian: DWORD;                // 0 = Big Endian, 1 = Little Endian
                      Version: DWORD;                     // Version of these data structures
                                                          // starting at 1
                      Revision: DWORD;                    // Revision of these data structures
                                                          // starting at 0 for each Version
                      TotalByteLength: DWORD;             // Total length of data block
                      HeaderLength: DWORD;                // Length of this structure
                      NumObjectTypes: DWORD;              // Number of types of objects
                                                          // being reported
                      DefaultObject: integer;             // Object Title Index of default
                                                          // object to display when data from
                                                          // this system is retrieved (-1 =
                                                          // none, but this is not expected to
                                                          // be used)
                      SystemTime: TSystemTime ;           // Time at the system under
                                                          // measurement
                      PerfTime: TLargeInteger ;           // Performance counter value
                                                          // at the system under measurement
                      PerfFreq: TLargeInteger;            // Performance counter frequency
                                                          // at the system under measurement
                      PerfTime100nSec: TLargeInteger;     // Performance counter time in 100 nsec
                                                          // units at the system under measurement
                      SystemNameLength: DWORD;            // Length of the system name
                      SystemNameOffset: DWORD;            // Offset, from beginning of this
                                                          // structure, to name of system
                                                          // being measured
                    end ;
  PPERF_OBJECT_TYPE =^PERF_OBJECT_TYPE ;
  PERF_OBJECT_TYPE = RECORD    // pot
                       TotalByteLength: DWORD;             // Length of this object definition
                                                           // including this structure, the
                                                           // counter definitions, and the
                                                           // instance definitions and the
                                                           // counter blocks for each instance:
                                                           // This is the offset from this
                                                           // structure to the next object, if
                                                           // any
                       DefinitionLength: DWORD;            // Length of object definition,
                                                           // which includes this structure
                                                           // and the counter definition
                                                           // structures for this object: this
                                                           // is the offset of the first
                                                           // instance or of the counters
                                                           // for this object if there is
                                                           // no instance
                       HeaderLength: DWORD;                // Length of this structure: this
                                                           // is the offset to the first
                                                           // counter definition for this
                                                           // object
                       ObjectNameTitleIndex: DWORD;        // Index to name in Title Database
                       ObjectNameTitle: DWORD;             // Initially NULL, for use by
                                                           // analysis program to point to
                                                           // retrieved title string
                       ObjectHelpTitleIndex: DWORD;        // Index to Help in Title Database
                       ObjectHelpTitle: DWORD;             // Initially NULL, for use by
                                                           // analysis program to point to
                                                           // retrieved title string
                       DetailLevel: DWORD;                 // Object level of detail (for
                                                           // controlling display complexity);
                                                           // will be min of detail levels
                                                           // for all this object's counters
                       NumCounters: DWORD;                 // Number of counters in each
                                                           // counter block (one counter
                                                           // block per instance)
                       DefaultCounter: integer;            // Default counter to display when
                                                           // this object is selected, index
                                                           // starting at 0 (-1 = none, but
                                                           // this is not expected to be used)
                       NumInstances: integer;              // Number of object instances
                                                           // for which counters are being
                                                           // returned from the system under
                                                           // measurement. If the object defined
                                                           // will never have any instance data
                                                           // structures (PERF_INSTANCE_DEFINITION)
                                                           // then this value should be -1, if the
                                                           // object can have 0 or more instances,
                                                           // but has none present, then this
                                                           // should be 0, otherwise this field
                                                           // contains the number of instances of
                                                           // this counter.
                       CodePage: DWORD;                    // 0 if instance strings are in
                                                           // UNICODE, else the Code Page of
                                                           // the instance names
                       PerfTime: TLargeInteger;            // Sample Time in "Object" units
                       PerfFreq: TLargeInteger;            // Frequency of "Object" units in
                                                           // counts per second.
                   end ;
  PPERF_COUNTER_DEFINITION = ^PERF_COUNTER_DEFINITION ;
  PERF_COUNTER_DEFINITION = RECORD  // pcd
                              ByteLength: DWORD;                  // Length in bytes of this structure
                              CounterNameTitleIndex: DWORD;       // Index of Counter name into
                                                                  // Title Database
                              CounterNameTitle: DWORD;            // Initially NULL, for use by
                                                                  // analysis program to point to
                                                                  // retrieved title string
                              CounterHelpTitleIndex: DWORD;       // Index of Counter Help into
                                                                  // Title Database
                              CounterHelpTitle: DWORD;            // Initially NULL, for use by
                                                                  // analysis program to point to
                                                                  // retrieved title string
                              DefaultScale: integer;              // Power of 10 by which to scale
                                                                  // chart line if vertical axis is 100
                                                                  // 0 ==> 1, 1 ==> 10, -1 ==>1/10, etc.
                              DetailLevel: DWORD;                 // Counter level of detail (for
                                                                  // controlling display complexity)
                              CounterType: DWORD;                 // Type of counter
                              CounterSize: DWORD;                 // Size of counter in bytes
                              CounterOffset: DWORD;               // PERF_COUNTER_BLOCK to the first
                                                                  // byte of this counter
                            end ;
  PPERF_INSTANCE_DEFINITION = ^PERF_INSTANCE_DEFINITION ;
  PERF_INSTANCE_DEFINITION = RECORD // pid
                               ByteLength: DWORD;                  // Length in bytes of this structure,
                                                                   // including the subsequent name
                               ParentObjectTitleIndex: DWORD;      // Title Index to name of "parent"
                                                                   // object (e.g., if thread, then
                                                                   // process is parent object type);
                                                                   // if logical drive, the physical
                                                                   // drive is parent object type
                               ParentObjectInstance: DWORD;        // Index to instance of parent object
                                                                   // type which is the parent of this
                                                                   // instance.
                               UniqueID: integer;                  // A unique ID used instead of
                                                                   // matching the name to identify
                                                                   // this instance, -1 = none
                               NameOffset: DWORD;                  // Offset from beginning of
                                                                   // this struct to the Unicode name
                                                                   // of this instance
                               NameLength: DWORD;                  // Length in bytes of name; 0 = none
                                                                   // this length includes the characters
                                                                   // in the string plus the size of the
                                                                   // terminating NULL char. It does not
                                                                   // include any additional pad bytes to
                                                                   // correct structure alignment
                             end;
  PPERF_COUNTER_BLOCK= ^PERF_COUNTER_BLOCK ;
  PERF_COUNTER_BLOCK = record  // pcb
                         ByteLength: DWORD;                   // Length in bytes of this structure,
                                                              // including the following counters
                       end;

{******************************************************}
{******************************************************}
{******************************************************}
// RAS API header by Davide Moretti
{******************************************************}
{******************************************************}
{******************************************************}
(*RASAPI*){* Copyright (c) 1992-1995, Microsoft Corporation, all rights reserved
(*RASAPI*)**
(*RASAPI*)** ras.h
(*RASAPI*)** Remote Access external API
(*RASAPI*)** Public header for external API clients
(*RASAPI*)*}
(*RASAPI*)
(*RASAPI*){ Delphi conversion by Davide Moretti <dmoretti@iper.net> }
(*RASAPI*){ Note: All functions and structures defaults to Ansi. If you want to use
(*RASAPI*)  Unicode structs and funcs, use the names ending with 'W' }
(*RASAPI*)
(*RASAPI*)const
(*RASAPI*){ These are from lmcons.h }
(*RASAPI*)  DNLEN            = 15;  // Maximum domain name length
(*RASAPI*)  UNLEN            = 256; // Maximum user name length
(*RASAPI*)  PWLEN            = 256; // Maximum password length
(*RASAPI*)  NETBIOS_NAME_LEN = 16;  // NetBIOS net name (bytes)
(*RASAPI*)
(*RASAPI*)  RAS_MaxDeviceType     = 16;
(*RASAPI*)  RAS_MaxPhoneNumber    = 128;
(*RASAPI*)  RAS_MaxIpAddress      = 15;
(*RASAPI*)  RAS_MaxIpxAddress     = 21;
(*RASAPI*)  RAS_MaxEntryName      = 256;
(*RASAPI*)  RAS_MaxDeviceName     = 128;
(*RASAPI*)  RAS_MaxCallbackNumber = RAS_MaxPhoneNumber;
(*RASAPI*)
(*RASAPI*)type
(*RASAPI*)  LPHRasConn = ^THRasConn;
(*RASAPI*)  THRasConn  = Longint;
(*RASAPI*)
(*RASAPI*){* Identifies an active RAS connection.  (See RasEnumConnections) *}
(*RASAPI*)  LPRasConnW = ^TRasConnW;
(*RASAPI*)  TRasConnW  = record
(*RASAPI*)    dwSize       : Longint;
(*RASAPI*)    hrasconn     : THRasConn;
(*RASAPI*)    szEntryName  : Array[0..RAS_MaxEntryName] of WideChar;
(*RASAPI*)    szDeviceType : Array[0..RAS_MaxDeviceType] of WideChar;
(*RASAPI*)    szDeviceName : Array[0..RAS_MaxDeviceName] of WideChar;
(*RASAPI*)  end;
(*RASAPI*)
(*RASAPI*)  LPRasConnA = ^TRasConnA;
(*RASAPI*)  TRasConnA  = record
(*RASAPI*)    dwSize       : Longint;
(*RASAPI*)    hrasconn     : THRasConn;
(*RASAPI*)    szEntryName  : Array[0..RAS_MaxEntryName] of AnsiChar;
(*RASAPI*)    szDeviceType : Array[0..RAS_MaxDeviceType] of AnsiChar;
(*RASAPI*)    szDeviceName : Array[0..RAS_MaxDeviceName] of AnsiChar;
(*RASAPI*)  end;
(*RASAPI*)
(*RASAPI*)  LPRasConn = ^TRasConn;
(*RASAPI*)  TRasConn  = TRasConnA;
(*RASAPI*)
(*RASAPI*)const
(*RASAPI*){* Enumerates intermediate states to a connection.  (See RasDial) *}
(*RASAPI*)  RASCS_PAUSED = $1000;
(*RASAPI*)  RASCS_DONE   = $2000;
(*RASAPI*)
(*RASAPI*)type
(*RASAPI*)  LPRasConnState = ^TRasConnState;
(*RASAPI*)  TRasConnState  = Integer;
(*RASAPI*)
(*RASAPI*)const
(*RASAPI*)  RASCS_OpenPort                  = 0;
(*RASAPI*)  RASCS_PortOpened                = 1;
(*RASAPI*)  RASCS_ConnectDevice             = 2;
(*RASAPI*)  RASCS_DeviceConnected           = 3;
(*RASAPI*)  RASCS_AllDevicesConnected       = 4;
(*RASAPI*)  RASCS_Authenticate              = 5;
(*RASAPI*)  RASCS_AuthNotify                = 6;
(*RASAPI*)  RASCS_AuthRetry                 = 7;
(*RASAPI*)  RASCS_AuthCallback              = 8;
(*RASAPI*)  RASCS_AuthChangePassword        = 9;
(*RASAPI*)  RASCS_AuthProject               = 10;
(*RASAPI*)  RASCS_AuthLinkSpeed             = 11;
(*RASAPI*)  RASCS_AuthAck                   = 12;
(*RASAPI*)  RASCS_ReAuthenticate            = 13;
(*RASAPI*)  RASCS_Authenticated             = 14;
(*RASAPI*)  RASCS_PrepareForCallback        = 15;
(*RASAPI*)  RASCS_WaitForModemReset         = 16;
(*RASAPI*)  RASCS_WaitForCallback           = 17;
(*RASAPI*)  RASCS_Projected                 = 18;
(*RASAPI*)  RASCS_StartAuthentication       = 19;
(*RASAPI*)  RASCS_CallbackComplete          = 20;
(*RASAPI*)  RASCS_LogonNetwork              = 21;
(*RASAPI*)
(*RASAPI*)  RASCS_Interactive               = RASCS_PAUSED;
(*RASAPI*)  RASCS_RetryAuthentication       = RASCS_PAUSED + 1;
(*RASAPI*)  RASCS_CallbackSetByCaller       = RASCS_PAUSED + 2;
(*RASAPI*)  RASCS_PasswordExpired           = RASCS_PAUSED + 3;
(*RASAPI*)
(*RASAPI*)  RASCS_Connected                 = RASCS_DONE;
(*RASAPI*)  RASCS_Disconnected              = RASCS_DONE + 1;
(*RASAPI*)
(*RASAPI*)type
(*RASAPI*){* Describes the status of a RAS connection.  (See RasConnectionStatus)*}
(*RASAPI*)  LPRasConnStatusW = ^TRasConnStatusW;
(*RASAPI*)  TRasConnStatusW  = record
(*RASAPI*)    dwSize         : Longint;
(*RASAPI*)    rasconnstate   : TRasConnState;
(*RASAPI*)    dwError        : LongInt;
(*RASAPI*)    szDeviceType   : Array[0..RAS_MaxDeviceType] of WideChar;
(*RASAPI*)    szDeviceName   : Array[0..RAS_MaxDeviceName] of WideChar;
(*RASAPI*)  end;
(*RASAPI*)
(*RASAPI*)  LPRasConnStatusA = ^TRasConnStatusA;
(*RASAPI*)  TRasConnStatusA  = record
(*RASAPI*)    dwSize         : Longint;
(*RASAPI*)    rasconnstate   : TRasConnState;
(*RASAPI*)    dwError        : LongInt;
(*RASAPI*)    szDeviceType   : Array[0..RAS_MaxDeviceType] of AnsiChar;
(*RASAPI*)    szDeviceName   : Array[0..RAS_MaxDeviceName] of AnsiChar;
(*RASAPI*)  end;
(*RASAPI*)
(*RASAPI*)  LPRasConnStatus = ^TRasConnStatus;
(*RASAPI*)  TRasConnStatus  = TRasConnStatusA;
(*RASAPI*)
(*RASAPI*){* Describes connection establishment parameters.  (See RasDial)*}
(*RASAPI*)  LPRasDialParamsW = ^TRasDialParamsW;
(*RASAPI*)  TRasDialParamsW  = record
(*RASAPI*)    dwSize           : LongInt;
(*RASAPI*)    szEntryName      : Array[0..RAS_MaxEntryName] of WideChar;
(*RASAPI*)    szPhoneNumber    : Array[0..RAS_MaxPhoneNumber] of WideChar;
(*RASAPI*)    szCallbackNumber : Array[0..RAS_MaxCallbackNumber] of WideChar;
(*RASAPI*)    szUserName       : Array[0..UNLEN] of WideChar;
(*RASAPI*)    szPassword       : Array[0..PWLEN] of WideChar;
(*RASAPI*)    szDomain         : Array[0..DNLEN] of WideChar;
(*RASAPI*)  end;
(*RASAPI*)
(*RASAPI*)  LPRasDialParamsA = ^TRasDialParamsA;
(*RASAPI*)  TRasDialParamsA  = record
(*RASAPI*)    dwSize           : LongInt;
(*RASAPI*)    szEntryName      : Array[0..RAS_MaxEntryName] of AnsiChar;
(*RASAPI*)    szPhoneNumber    : Array[0..RAS_MaxPhoneNumber] of AnsiChar;
(*RASAPI*)    szCallbackNumber : Array[0..RAS_MaxCallbackNumber] of AnsiChar;
(*RASAPI*)    szUserName       : Array[0..UNLEN] of AnsiChar;
(*RASAPI*)    szPassword       : Array[0..PWLEN] of AnsiChar;
(*RASAPI*)    szDomain         : Array[0..DNLEN] of AnsiChar;
(*RASAPI*)  end;
(*RASAPI*)
(*RASAPI*)  LPRasDialParams = ^TRasDialParams;
(*RASAPI*)  TRasDialParams  = TRasDialParamsA;
(*RASAPI*)
(*RASAPI*){* Describes extended connection establishment options.  (See RasDial)*}
(*RASAPI*)  LPRasDialExtensions = ^TRasDialExtensions;
(*RASAPI*)  TRasDialExtensions  = record
(*RASAPI*)    dwSize            : LongInt;
(*RASAPI*)    dwfOptions        : LongInt;
(*RASAPI*)    hwndParent        : HWND;
(*RASAPI*)    reserved          : LongInt;
(*RASAPI*)  end;
(*RASAPI*)
(*RASAPI*)const
(*RASAPI*){* 'dwfOptions' bit flags.*}
(*RASAPI*)  RDEOPT_UsePrefixSuffix           = $00000001;
(*RASAPI*)  RDEOPT_PausedStates              = $00000002;
(*RASAPI*)  RDEOPT_IgnoreModemSpeaker        = $00000004;
(*RASAPI*)  RDEOPT_SetModemSpeaker           = $00000008;
(*RASAPI*)  RDEOPT_IgnoreSoftwareCompression = $00000010;
(*RASAPI*)  RDEOPT_SetSoftwareCompression    = $00000020;
(*RASAPI*)
(*RASAPI*)
(*RASAPI*)type
(*RASAPI*)
(*RASAPI*){* Describes an enumerated RAS phone book entry name.  (See RasEntryEnum)*}
(*RASAPI*)  LPRasEntryNameW = ^TRasEntryNameW;
(*RASAPI*)  TRasEntryNameW  = record
(*RASAPI*)    dwSize        : Longint;
(*RASAPI*)    szEntryName   : Array[0..RAS_MaxEntryName] of WideChar;
(*RASAPI*)  end;
(*RASAPI*)
(*RASAPI*)  LPRasEntryNameA = ^TRasEntryNameA;
(*RASAPI*)  TRasEntryNameA  = record
(*RASAPI*)    dwSize        : Longint;
(*RASAPI*)    szEntryName   : Array[0..RAS_MaxEntryName] of AnsiChar;
(*RASAPI*)  end;
(*RASAPI*)
(*RASAPI*)  LPRasEntryName = ^TRasEntryName;
(*RASAPI*)  TRasEntryName  = TRasEntryNameA;
(*RASAPI*)
(*RASAPI*){* Protocol code to projection data structure mapping.*}
(*RASAPI*)  LPRasProjection = ^TRasProjection;
(*RASAPI*)  TRasProjection  = Integer;
(*RASAPI*)
(*RASAPI*)const
(*RASAPI*)  RASP_Amb        = $10000;
(*RASAPI*)  RASP_PppNbf     = $803F;
(*RASAPI*)  RASP_PppIpx     = $802B;
(*RASAPI*)  RASP_PppIp      = $8021;
(*RASAPI*)
(*RASAPI*)
(*RASAPI*)type
(*RASAPI*){* Describes the result of a RAS AMB (Authentication Message Block)
(*RASAPI*)** projection.  This protocol is used with NT 3.1 and OS/2 1.3 downlevel
(*RASAPI*)** RAS servers.*}
(*RASAPI*)  LPRasAmbW = ^TRasAmbW;
(*RASAPI*)  TRasAmbW  = record
(*RASAPI*)    dwSize         : Longint;
(*RASAPI*)    dwError        : Longint;
(*RASAPI*)    szNetBiosError : Array[0..NETBIOS_NAME_LEN] of WideChar;
(*RASAPI*)    bLana          : Byte;
(*RASAPI*)  end;
(*RASAPI*)
(*RASAPI*)  LPRasAmbA = ^TRasAmbA;
(*RASAPI*)  TRasAmbA  = record
(*RASAPI*)    dwSize         : Longint;
(*RASAPI*)    dwError        : Longint;
(*RASAPI*)    szNetBiosError : Array[0..NETBIOS_NAME_LEN] of AnsiChar;
(*RASAPI*)    bLana          : Byte;
(*RASAPI*)  end;
(*RASAPI*)
(*RASAPI*)  LPRasAmb = ^TRasAmb;
(*RASAPI*)  TRasAmb  = TRasAmbA;
(*RASAPI*)
(*RASAPI*){* Describes the result of a PPP NBF (NetBEUI) projection.*}
(*RASAPI*)  LPRasPppNbfW = ^TRasPppNbfW;
(*RASAPI*)  TRasPppNbfW  = record
(*RASAPI*)    dwSize             : Longint;
(*RASAPI*)    dwError            : Longint;
(*RASAPI*)    dwNetBiosError     : Longint;
(*RASAPI*)    szNetBiosError     : Array[0..NETBIOS_NAME_LEN] of WideChar;
(*RASAPI*)    szWorkstationName  : Array[0..NETBIOS_NAME_LEN] of WideChar;
(*RASAPI*)    bLana              : Byte;
(*RASAPI*)  end;
(*RASAPI*)
(*RASAPI*)  LPRasPppNbfA = ^TRasPppNbfA;
(*RASAPI*)  TRasPppNbfA  = record
(*RASAPI*)    dwSize             : Longint;
(*RASAPI*)    dwError            : Longint;
(*RASAPI*)    dwNetBiosError     : Longint;
(*RASAPI*)    szNetBiosError     : Array[0..NETBIOS_NAME_LEN] of AnsiChar;
(*RASAPI*)    szWorkstationName  : Array[0..NETBIOS_NAME_LEN] of AnsiChar;
(*RASAPI*)    bLana              : Byte;
(*RASAPI*)  end;
(*RASAPI*)
(*RASAPI*)  LpRaspppNbf = ^TRasPppNbf;
(*RASAPI*)  TRasPppNbf  = TRasPppNbfA;
(*RASAPI*)
(*RASAPI*){* Describes the results of a PPP IPX (Internetwork Packet Exchange)
(*RASAPI*)** projection.*}
(*RASAPI*)  LPRasPppIpxW = ^TRasPppIpxW;
(*RASAPI*)  TRasPppIpxW  = record
(*RASAPI*)    dwSize       : Longint;
(*RASAPI*)    dwError      : Longint;
(*RASAPI*)    szIpxAddress : Array[0..RAS_MaxIpxAddress] of WideChar;
(*RASAPI*)  end;
(*RASAPI*)
(*RASAPI*)  LPRasPppIpxA = ^TRasPppIpxA;
(*RASAPI*)  TRasPppIpxA  = record
(*RASAPI*)    dwSize       : Longint;
(*RASAPI*)    dwError      : Longint;
(*RASAPI*)    szIpxAddress : Array[0..RAS_MaxIpxAddress] of AnsiChar;
(*RASAPI*)  end;
(*RASAPI*)
(*RASAPI*)  LPRasPppIpx = ^TRasPppIpx;
(*RASAPI*)  TRasPppIpx  = TRasPppIpxA;
(*RASAPI*)
(*RASAPI*){* Describes the results of a PPP IP (Internet) projection.*}
(*RASAPI*)  LPRasPppIpW = ^TRasPppIpW;
(*RASAPI*)  TRasPppIpW  = record
(*RASAPI*)    dwSize      : Longint;
(*RASAPI*)    dwError     : Longint;
(*RASAPI*)    szIpAddress : Array[0..RAS_MaxIpAddress] of WideChar;
(*RASAPI*)
(*RASAPI*){$IFNDEF WINNT35COMPATIBLE}
(*RASAPI*)    {* This field was added between Windows NT 3.51 beta and Windows NT 3.51
(*RASAPI*)    ** final, and between Windows 95 M8 beta and Windows 95 final.  If you do
(*RASAPI*)    ** not require the server address and wish to retrieve PPP IP information
(*RASAPI*)    ** from Windows NT 3.5 or early Windows NT 3.51 betas, or on early Windows
(*RASAPI*)    ** 95 betas, define WINNT35COMPATIBLE.
(*RASAPI*)    **
(*RASAPI*)    ** The server IP address is not provided by all PPP implementations,
(*RASAPI*)    ** though Windows NT server's do provide it.    *}
(*RASAPI*)    szServerIpAddress: Array[0..RAS_MaxIpAddress] of WideChar;
(*RASAPI*){$ENDIF}
(*RASAPI*)  end;
(*RASAPI*)
(*RASAPI*)  LPRasPppIpA = ^TRasPppIpA;
(*RASAPI*)  TRasPppIpA  = record
(*RASAPI*)    dwSize      : Longint;
(*RASAPI*)    dwError     : Longint;
(*RASAPI*)    szIpAddress : Array[0..RAS_MaxIpAddress] of AnsiChar;
(*RASAPI*)
(*RASAPI*){$IFNDEF WINNT35COMPATIBLE} {* See RASPPPIPW comment. *}
(*RASAPI*)    szServerIpAddress: Array[0..RAS_MaxIpAddress] of AnsiChar;
(*RASAPI*){$ENDIF}
(*RASAPI*)  end;
(*RASAPI*)
(*RASAPI*)  LPRasPppIp = ^TRasPppIp;
(*RASAPI*)  TRasPppIp  = TRasPppIpA;
(*RASAPI*)
(*RASAPI*)
(*RASAPI*)const
(*RASAPI*){* If using RasDial message notifications, get the notification message code
(*RASAPI*)** by passing this string to the RegisterWindowMessageA() API.
(*RASAPI*)** WM_RASDIALEVENT is used only if a unique message cannot be registered.*}
(*RASAPI*)  RASDIALEVENT    = 'RasDialEvent';
(*RASAPI*)  WM_RASDIALEVENT = $CCCD;
(*RASAPI*)
(*RASAPI*)
(*RASAPI*){* Prototypes for caller's RasDial callback handler.  Arguments are the
(*RASAPI*)** message ID (currently always WM_RASDIALEVENT), the current RASCONNSTATE and
(*RASAPI*)** the error that has occurred (or 0 if none).  Extended arguments are the
(*RASAPI*)** handle of the RAS connection and an extended error code.
(*RASAPI*)*}
(*RASAPI*){
(*RASAPI*)typedef VOID (WINAPI *RASDIALFUNC)( UINT, RASCONNSTATE, DWORD );
(*RASAPI*)typedef VOID (WINAPI *RASDIALFUNC1)( HRASCONN, UINT, RASCONNSTATE, DWORD, DWORD );
(*RASAPI*)
(*RASAPI*)For Delphi: Just define the callback as
(*RASAPI*)procedure RASCallback(msg: Integer; state: TRasConnState;
(*RASAPI*)    dwError: Longint); stdcall;
(*RASAPI*) or
(*RASAPI*)procedure RASCallback1(hConn: THRasConn; msg: Integer;
(*RASAPI*)    state: TRasConnState; dwError: Longint; dwEexterror: Longint); stdcall;
(*RASAPI*)}
(*RASAPI*)
(*RASAPI*){* External RAS API function prototypes.
(*RASAPI*)*}
(*RASAPI*){Note: for Delphi the function without 'A' or 'W' is the Ansi one
(*RASAPI*)  as on the other Delphi headers}
(*RASAPI*)
(*RASAPI*)function RasDialA(lpRasDialExt: LPRasDialExtensions; lpszPhoneBook: PAnsiChar;
(*RASAPI*)                  var params: TRasDialParamsA; dwNotifierType: Longint;
(*RASAPI*)                  lpNotifier: Pointer; var rasconn: THRasConn): Longint; stdcall;
(*RASAPI*)function RasDialW(lpRasDialExt: LPRasDialExtensions; lpszPhoneBook: PWideChar;
(*RASAPI*)                  var params: TRasDialParamsW; dwNotifierType: Longint;
(*RASAPI*)                  lpNotifier: Pointer; var rasconn: THRasConn): Longint; stdcall;
(*RASAPI*)function RasDial(lpRasDialExt: LPRasDialExtensions; lpszPhoneBook: PAnsiChar;
(*RASAPI*)                 var params: TRasDialParams; dwNotifierType: Longint;
(*RASAPI*)                 lpNotifier: Pointer; var rasconn: THRasConn): Longint; stdcall;
(*RASAPI*)
(*RASAPI*)function RasEnumConnectionsA(RasConnArray: LPRasConnA; var lpcb: Longint;
(*RASAPI*)                             var lpcConnections: Longint): Longint; stdcall;
(*RASAPI*)function RasEnumConnectionsW(RasConnArray: LPRasConnW; var lpcb: Longint;
(*RASAPI*)                             var lpcConnections: Longint): Longint; stdcall;
(*RASAPI*)function RasEnumConnections(RasConnArray: LPRasConn; var lpcb: Longint;
(*RASAPI*)                             var lpcConnections: Longint): Longint; stdcall;
(*RASAPI*)
(*RASAPI*)function RasEnumEntriesA(Reserved: PAnsiChar; lpszPhoneBook: PAnsiChar;
(*RASAPI*)                         entrynamesArray: LPRasEntryNameA; var lpcb: Longint;
(*RASAPI*)                         var lpcEntries: Longint): Longint; stdcall;
(*RASAPI*)function RasEnumEntriesW(reserved: PWideChar; lpszPhoneBook: PWideChar;
(*RASAPI*)                         entrynamesArray: LPRasEntryNameW; var lpcb: Longint;
(*RASAPI*)                         var lpcEntries: Longint): Longint; stdcall;
(*RASAPI*)function RasEnumEntries(reserved: PAnsiChar; lpszPhoneBook: PAnsiChar;
(*RASAPI*)                        entrynamesArray: LPRasEntryName; var lpcb: Longint;
(*RASAPI*)                        var lpcEntries: Longint): Longint; stdcall;
(*RASAPI*)
(*RASAPI*)function RasGetConnectStatusA(hConn: THRasConn; var lpStatus: TRasConnStatusA): Longint; stdcall;
(*RASAPI*)function RasGetConnectStatusW(hConn: THRasConn;var lpStatus: TRasConnStatusW): Longint; stdcall;
(*RASAPI*)function RasGetConnectStatus(hConn: THRasConn;var lpStatus: TRasConnStatus): Longint; stdcall;
(*RASAPI*)
(*RASAPI*)function RasGetErrorStringA(errorValue: Integer;erroString: PAnsiChar;cBufSize: Longint): Longint; stdcall;
(*RASAPI*)function RasGetErrorStringW(errorValue: Integer;erroString: PWideChar;cBufSize: Longint): Longint; stdcall;
(*RASAPI*)function RasGetErrorString(errorValue: Integer;erroString: PAnsiChar;cBufSize: Longint): Longint; stdcall;
(*RASAPI*)
(*RASAPI*)function RasHangUpA(hConn: THRasConn): Longint; stdcall;
(*RASAPI*)function RasHangUpW(hConn: THRasConn): Longint; stdcall;
(*RASAPI*)function RasHangUp(hConn: THRasConn): Longint; stdcall;
(*RASAPI*)
(*RASAPI*)function RasGetProjectionInfoA(hConn: THRasConn; rasproj: TRasProjection;
(*RASAPI*)                               lpProjection: Pointer; var lpcb: Longint): Longint; stdcall;
(*RASAPI*)function RasGetProjectionInfoW(hConn: THRasConn; rasproj: TRasProjection;
(*RASAPI*)                               lpProjection: Pointer; var lpcb: Longint): Longint; stdcall;
(*RASAPI*)function RasGetProjectionInfo(hConn: THRasConn; rasproj: TRasProjection;
(*RASAPI*)                              lpProjection: Pointer; var lpcb: Longint): Longint; stdcall;
(*RASAPI*)
(*RASAPI*)function RasCreatePhonebookEntryA(hwndParentWindow: HWND;lpszPhoneBook: PAnsiChar): Longint; stdcall;
(*RASAPI*)function RasCreatePhonebookEntryW(hwndParentWindow: HWND;lpszPhoneBook: PWideChar): Longint; stdcall;
(*RASAPI*)function RasCreatePhonebookEntry(hwndParentWindow: HWND;lpszPhoneBook: PAnsiChar): Longint; stdcall;
(*RASAPI*)
(*RASAPI*)function RasEditPhonebookEntryA(hwndParentWindow: HWND; lpszPhoneBook: PAnsiChar;
(*RASAPI*)                                lpszEntryName: PAnsiChar): Longint; stdcall;
(*RASAPI*)function RasEditPhonebookEntryW(hwndParentWindow: HWND; lpszPhoneBook: PWideChar;
(*RASAPI*)                                lpszEntryName: PWideChar): Longint; stdcall;
(*RASAPI*)function RasEditPhonebookEntry(hwndParentWindow: HWND; lpszPhoneBook: PAnsiChar;
(*RASAPI*)                               lpszEntryName: PAnsiChar): Longint; stdcall;
(*RASAPI*)
(*RASAPI*)function RasSetEntryDialParamsA(lpszPhoneBook: PAnsiChar; var lpDialParams: TRasDialParamsA;
(*RASAPI*)                                fRemovePassword: LongBool): Longint; stdcall;
(*RASAPI*)function RasSetEntryDialParamsW(lpszPhoneBook: PWideChar; var lpDialParams: TRasDialParamsW;
(*RASAPI*)                                fRemovePassword: LongBool): Longint; stdcall;
(*RASAPI*)function RasSetEntryDialParams(lpszPhoneBook: PAnsiChar; var lpDialParams: TRasDialParams;
(*RASAPI*)                               fRemovePassword: LongBool): Longint; stdcall;
(*RASAPI*)
(*RASAPI*)function RasGetEntryDialParamsA(lpszPhoneBook: PAnsiChar; var lpDialParams: TRasDialParamsA;
(*RASAPI*)                                var lpfPassword: LongBool): Longint; stdcall;
(*RASAPI*)function RasGetEntryDialParamsW(lpszPhoneBook: PWideChar; var lpDialParams: TRasDialParamsW;
(*RASAPI*)                                var lpfPassword: LongBool): Longint; stdcall;
(*RASAPI*)function RasGetEntryDialParams(lpszPhoneBook: PAnsiChar; var lpDialParams: TRasDialParams;
(*RASAPI*)                               var lpfPassword: LongBool): Longint; stdcall;
(*RASAPI*)
(*RASAPI*){**
(*RASAPI*)** raserror.h
(*RASAPI*)** Remote Access external API
(*RASAPI*)** RAS specific error codes *}
(*RASAPI*)
(*RASAPI*)const
(*RASAPI*)  RASBASE = 600;
(*RASAPI*)  SUCCESS = 0;
(*RASAPI*)
(*RASAPI*)  PENDING                              = (RASBASE+0);
(*RASAPI*)  ERROR_INVALID_PORT_HANDLE            = (RASBASE+1);
(*RASAPI*)  ERROR_PORT_ALREADY_OPEN              = (RASBASE+2);
(*RASAPI*)  ERROR_BUFFER_TOO_SMALL               = (RASBASE+3);
(*RASAPI*)  ERROR_WRONG_INFO_SPECIFIED           = (RASBASE+4);
(*RASAPI*)  ERROR_CANNOT_SET_PORT_INFO           = (RASBASE+5);
(*RASAPI*)  ERROR_PORT_NOT_CONNECTED             = (RASBASE+6);
(*RASAPI*)  ERROR_EVENT_INVALID                  = (RASBASE+7);
(*RASAPI*)  ERROR_DEVICE_DOES_NOT_EXIST          = (RASBASE+8);
(*RASAPI*)  ERROR_DEVICETYPE_DOES_NOT_EXIST      = (RASBASE+9);
(*RASAPI*)  ERROR_BUFFER_INVALID                 = (RASBASE+10);
(*RASAPI*)  ERROR_ROUTE_NOT_AVAILABLE            = (RASBASE+11);
(*RASAPI*)  ERROR_ROUTE_NOT_ALLOCATED            = (RASBASE+12);
(*RASAPI*)  ERROR_INVALID_COMPRESSION_SPECIFIED  = (RASBASE+13);
(*RASAPI*)  ERROR_OUT_OF_BUFFERS                 = (RASBASE+14);
(*RASAPI*)  ERROR_PORT_NOT_FOUND                 = (RASBASE+15);
(*RASAPI*)  ERROR_ASYNC_REQUEST_PENDING          = (RASBASE+16);
(*RASAPI*)  ERROR_ALREADY_DISCONNECTING          = (RASBASE+17);
(*RASAPI*)  ERROR_PORT_NOT_OPEN                  = (RASBASE+18);
(*RASAPI*)  ERROR_PORT_DISCONNECTED              = (RASBASE+19);
(*RASAPI*)  ERROR_NO_ENDPOINTS                   = (RASBASE+20);
(*RASAPI*)  ERROR_CANNOT_OPEN_PHONEBOOK          = (RASBASE+21);
(*RASAPI*)  ERROR_CANNOT_LOAD_PHONEBOOK          = (RASBASE+22);
(*RASAPI*)  ERROR_CANNOT_FIND_PHONEBOOK_ENTRY    = (RASBASE+23);
(*RASAPI*)  ERROR_CANNOT_WRITE_PHONEBOOK         = (RASBASE+24);
(*RASAPI*)  ERROR_CORRUPT_PHONEBOOK              = (RASBASE+25);
(*RASAPI*)  ERROR_CANNOT_LOAD_STRING             = (RASBASE+26);
(*RASAPI*)  ERROR_KEY_NOT_FOUND                  = (RASBASE+27);
(*RASAPI*)  ERROR_DISCONNECTION                  = (RASBASE+28);
(*RASAPI*)  ERROR_REMOTE_DISCONNECTION           = (RASBASE+29);
(*RASAPI*)  ERROR_HARDWARE_FAILURE               = (RASBASE+30);
(*RASAPI*)  ERROR_USER_DISCONNECTION             = (RASBASE+31);
(*RASAPI*)  ERROR_INVALID_SIZE                   = (RASBASE+32);
(*RASAPI*)  ERROR_PORT_NOT_AVAILABLE             = (RASBASE+33);
(*RASAPI*)  ERROR_CANNOT_PROJECT_CLIENT          = (RASBASE+34);
(*RASAPI*)  ERROR_UNKNOWN                        = (RASBASE+35);
(*RASAPI*)  ERROR_WRONG_DEVICE_ATTACHED          = (RASBASE+36);
(*RASAPI*)  ERROR_BAD_STRING                     = (RASBASE+37);
(*RASAPI*)  ERROR_REQUEST_TIMEOUT                = (RASBASE+38);
(*RASAPI*)  ERROR_CANNOT_GET_LANA                = (RASBASE+39);
(*RASAPI*)  ERROR_NETBIOS_ERROR                  = (RASBASE+40);
(*RASAPI*)  ERROR_SERVER_OUT_OF_RESOURCES        = (RASBASE+41);
(*RASAPI*)  ERROR_NAME_EXISTS_ON_NET             = (RASBASE+42);
(*RASAPI*)  ERROR_SERVER_GENERAL_NET_FAILURE     = (RASBASE+43);
(*RASAPI*)  WARNING_MSG_ALIAS_NOT_ADDED          = (RASBASE+44);
(*RASAPI*)  ERROR_AUTH_INTERNAL                  = (RASBASE+45);
(*RASAPI*)  ERROR_RESTRICTED_LOGON_HOURS         = (RASBASE+46);
(*RASAPI*)  ERROR_ACCT_DISABLED                  = (RASBASE+47);
(*RASAPI*)  ERROR_PASSWD_EXPIRED                 = (RASBASE+48);
(*RASAPI*)  ERROR_NO_DIALIN_PERMISSION           = (RASBASE+49);
(*RASAPI*)  ERROR_SERVER_NOT_RESPONDING          = (RASBASE+50);
(*RASAPI*)  ERROR_FROM_DEVICE                    = (RASBASE+51);
(*RASAPI*)  ERROR_UNRECOGNIZED_RESPONSE          = (RASBASE+52);
(*RASAPI*)  ERROR_MACRO_NOT_FOUND                = (RASBASE+53);
(*RASAPI*)  ERROR_MACRO_NOT_DEFINED              = (RASBASE+54);
(*RASAPI*)  ERROR_MESSAGE_MACRO_NOT_FOUND        = (RASBASE+55);
(*RASAPI*)  ERROR_DEFAULTOFF_MACRO_NOT_FOUND     = (RASBASE+56);
(*RASAPI*)  ERROR_FILE_COULD_NOT_BE_OPENED       = (RASBASE+57);
(*RASAPI*)  ERROR_DEVICENAME_TOO_LONG            = (RASBASE+58);
(*RASAPI*)  ERROR_DEVICENAME_NOT_FOUND           = (RASBASE+59);
(*RASAPI*)  ERROR_NO_RESPONSES                   = (RASBASE+60);
(*RASAPI*)  ERROR_NO_COMMAND_FOUND               = (RASBASE+61);
(*RASAPI*)  ERROR_WRONG_KEY_SPECIFIED            = (RASBASE+62);
(*RASAPI*)  ERROR_UNKNOWN_DEVICE_TYPE            = (RASBASE+63);
(*RASAPI*)  ERROR_ALLOCATING_MEMORY              = (RASBASE+64);
(*RASAPI*)  ERROR_PORT_NOT_CONFIGURED            = (RASBASE+65);
(*RASAPI*)  ERROR_DEVICE_NOT_READY               = (RASBASE+66);
(*RASAPI*)  ERROR_READING_INI_FILE               = (RASBASE+67);
(*RASAPI*)  ERROR_NO_CONNECTION                  = (RASBASE+68);
(*RASAPI*)  ERROR_BAD_USAGE_IN_INI_FILE          = (RASBASE+69);
(*RASAPI*)  ERROR_READING_SECTIONNAME            = (RASBASE+70);
(*RASAPI*)  ERROR_READING_DEVICETYPE             = (RASBASE+71);
(*RASAPI*)  ERROR_READING_DEVICENAME             = (RASBASE+72);
(*RASAPI*)  ERROR_READING_USAGE                  = (RASBASE+73);
(*RASAPI*)  ERROR_READING_MAXCONNECTBPS          = (RASBASE+74);
(*RASAPI*)  ERROR_READING_MAXCARRIERBPS          = (RASBASE+75);
(*RASAPI*)  ERROR_LINE_BUSY                      = (RASBASE+76);
(*RASAPI*)  ERROR_VOICE_ANSWER                   = (RASBASE+77);
(*RASAPI*)  ERROR_NO_ANSWER                      = (RASBASE+78);
(*RASAPI*)  ERROR_NO_CARRIER                     = (RASBASE+79);
(*RASAPI*)  ERROR_NO_DIALTONE                    = (RASBASE+80);
(*RASAPI*)  ERROR_IN_COMMAND                     = (RASBASE+81);
(*RASAPI*)  ERROR_WRITING_SECTIONNAME            = (RASBASE+82);
(*RASAPI*)  ERROR_WRITING_DEVICETYPE             = (RASBASE+83);
(*RASAPI*)  ERROR_WRITING_DEVICENAME             = (RASBASE+84);
(*RASAPI*)  ERROR_WRITING_MAXCONNECTBPS          = (RASBASE+85);
(*RASAPI*)  ERROR_WRITING_MAXCARRIERBPS          = (RASBASE+86);
(*RASAPI*)  ERROR_WRITING_USAGE                  = (RASBASE+87);
(*RASAPI*)  ERROR_WRITING_DEFAULTOFF             = (RASBASE+88);
(*RASAPI*)  ERROR_READING_DEFAULTOFF             = (RASBASE+89);
(*RASAPI*)  ERROR_EMPTY_INI_FILE                 = (RASBASE+90);
(*RASAPI*)  ERROR_AUTHENTICATION_FAILURE         = (RASBASE+91);
(*RASAPI*)  ERROR_PORT_OR_DEVICE                 = (RASBASE+92);
(*RASAPI*)  ERROR_NOT_BINARY_MACRO               = (RASBASE+93);
(*RASAPI*)  ERROR_DCB_NOT_FOUND                  = (RASBASE+94);
(*RASAPI*)  ERROR_STATE_MACHINES_NOT_STARTED     = (RASBASE+95);
(*RASAPI*)  ERROR_STATE_MACHINES_ALREADY_STARTED = (RASBASE+96);
(*RASAPI*)  ERROR_PARTIAL_RESPONSE_LOOPING       = (RASBASE+97);
(*RASAPI*)  ERROR_UNKNOWN_RESPONSE_KEY           = (RASBASE+98);
(*RASAPI*)  ERROR_RECV_BUF_FULL                  = (RASBASE+99);
(*RASAPI*)  ERROR_CMD_TOO_LONG                   = (RASBASE+100);
(*RASAPI*)  ERROR_UNSUPPORTED_BPS                = (RASBASE+101);
(*RASAPI*)  ERROR_UNEXPECTED_RESPONSE            = (RASBASE+102);
(*RASAPI*)  ERROR_INTERACTIVE_MODE               = (RASBASE+103);
(*RASAPI*)  ERROR_BAD_CALLBACK_NUMBER            = (RASBASE+104);
(*RASAPI*)  ERROR_INVALID_AUTH_STATE             = (RASBASE+105);
(*RASAPI*)  ERROR_WRITING_INITBPS                = (RASBASE+106);
(*RASAPI*)  ERROR_X25_DIAGNOSTIC                 = (RASBASE+107);
(*RASAPI*)  ERROR_ACCT_EXPIRED                   = (RASBASE+108);
(*RASAPI*)  ERROR_CHANGING_PASSWORD              = (RASBASE+109);
(*RASAPI*)  ERROR_OVERRUN                        = (RASBASE+110);
(*RASAPI*)  ERROR_RASMAN_CANNOT_INITIALIZE       = (RASBASE+111);
(*RASAPI*)  ERROR_BIPLEX_PORT_NOT_AVAILABLE      = (RASBASE+112);
(*RASAPI*)  ERROR_NO_ACTIVE_ISDN_LINES           = (RASBASE+113);
(*RASAPI*)  ERROR_NO_ISDN_CHANNELS_AVAILABLE     = (RASBASE+114);
(*RASAPI*)  ERROR_TOO_MANY_LINE_ERRORS           = (RASBASE+115);
(*RASAPI*)  ERROR_IP_CONFIGURATION               = (RASBASE+116);
(*RASAPI*)  ERROR_NO_IP_ADDRESSES                = (RASBASE+117);
(*RASAPI*)  ERROR_PPP_TIMEOUT                    = (RASBASE+118);
(*RASAPI*)  ERROR_PPP_REMOTE_TERMINATED          = (RASBASE+119);
(*RASAPI*)  ERROR_PPP_NO_PROTOCOLS_CONFIGURED    = (RASBASE+120);
(*RASAPI*)  ERROR_PPP_NO_RESPONSE                = (RASBASE+121);
(*RASAPI*)  ERROR_PPP_INVALID_PACKET             = (RASBASE+122);
(*RASAPI*)  ERROR_PHONE_NUMBER_TOO_LONG          = (RASBASE+123);
(*RASAPI*)  ERROR_IPXCP_NO_DIALOUT_CONFIGURED    = (RASBASE+124);
(*RASAPI*)  ERROR_IPXCP_NO_DIALIN_CONFIGURED     = (RASBASE+125);
(*RASAPI*)  ERROR_IPXCP_DIALOUT_ALREADY_ACTIVE   = (RASBASE+126);
(*RASAPI*)  ERROR_ACCESSING_TCPCFGDLL            = (RASBASE+127);
(*RASAPI*)  ERROR_NO_IP_RAS_ADAPTER              = (RASBASE+128);
(*RASAPI*)  ERROR_SLIP_REQUIRES_IP               = (RASBASE+129);
(*RASAPI*)  ERROR_PROJECTION_NOT_COMPLETE        = (RASBASE+130);
(*RASAPI*)  ERROR_PROTOCOL_NOT_CONFIGURED        = (RASBASE+131);
(*RASAPI*)  ERROR_PPP_NOT_CONVERGING             = (RASBASE+132);
(*RASAPI*)  ERROR_PPP_CP_REJECTED                = (RASBASE+133);
(*RASAPI*)  ERROR_PPP_LCP_TERMINATED             = (RASBASE+134);
(*RASAPI*)  ERROR_PPP_REQUIRED_ADDRESS_REJECTED  = (RASBASE+135);
(*RASAPI*)  ERROR_PPP_NCP_TERMINATED             = (RASBASE+136);
(*RASAPI*)  ERROR_PPP_LOOPBACK_DETECTED          = (RASBASE+137);
(*RASAPI*)  ERROR_PPP_NO_ADDRESS_ASSIGNED        = (RASBASE+138);
(*RASAPI*)  ERROR_CANNOT_USE_LOGON_CREDENTIALS   = (RASBASE+139);
(*RASAPI*)  ERROR_TAPI_CONFIGURATION             = (RASBASE+140);
(*RASAPI*)  ERROR_NO_LOCAL_ENCRYPTION            = (RASBASE+141);
(*RASAPI*)  ERROR_NO_REMOTE_ENCRYPTION           = (RASBASE+142);
(*RASAPI*)  ERROR_REMOTE_REQUIRES_ENCRYPTION     = (RASBASE+143);
(*RASAPI*)  ERROR_IPXCP_NET_NUMBER_CONFLICT      = (RASBASE+144);
(*RASAPI*)  ERROR_INVALID_SMM                    = (RASBASE+145);
(*RASAPI*)  ERROR_SMM_UNINITIALIZED              = (RASBASE+146);
(*RASAPI*)  ERROR_NO_MAC_FOR_PORT                = (RASBASE+147);
(*RASAPI*)  ERROR_SMM_TIMEOUT                    = (RASBASE+148);
(*RASAPI*)  ERROR_BAD_PHONE_NUMBER               = (RASBASE+149);
(*RASAPI*)  ERROR_WRONG_MODULE                   = (RASBASE+150);
(*RASAPI*)
(*RASAPI*)  RASBASEEND                           = (RASBASE+150);
(*RASAPI*)
(*RASAPI*){* Copyright (c) 1995, Microsoft Corporation, all rights reserved
(*RASAPI*)**
(*RASAPI*)** rnaph.h  (to be merged with ras.h)
(*RASAPI*)**
(*RASAPI*)** Remote Access external API
(*RASAPI*)** Public header for external API clients
(*RASAPI*)**}
(*RASAPI*)
(*RASAPI*){*
(*RASAPI*)   Original conversion by Gideon le Grange <legrang@adept.co.za>
(*RASAPI*)   Merged with ras.pas by Davide Moretti <dmoretti@iper.net>
(*RASAPI*)*}
(*RASAPI*)
(*RASAPI*)const
(*RASAPI*)  RAS_MaxAreaCode   =  10;
(*RASAPI*)  RAS_MaxPadType    =  32;
(*RASAPI*)  RAS_MaxX25Address = 200;
(*RASAPI*)  RAS_MaxFacilities = 200;
(*RASAPI*)  RAS_MaxUserData   = 200;
(*RASAPI*)
(*RASAPI*)
(*RASAPI*)type
(*RASAPI*)(* Describes a RAS IP Address *)
(*RASAPI*)  LPRasIPAddr = ^TRasIPAddr;
(*RASAPI*)  TRasIPAddr = record
(*RASAPI*)    A, B, C, D: Byte;
(*RASAPI*)  end;
(*RASAPI*)
(*RASAPI*)(* Describes a RAS phonebook entry *)
(*RASAPI*)  LPRasEntryA = ^TRasEntryA;
(*RASAPI*)  TRasEntryA  = record
(*RASAPI*)    dwSize,
(*RASAPI*)    dwfOptions,
(*RASAPI*)    dwCountryID,
(*RASAPI*)    dwCountryCode          : Longint;
(*RASAPI*)    szAreaCode             : array[0.. RAS_MaxAreaCode] of AnsiChar;
(*RASAPI*)    szLocalPhoneNumber     : array[0..RAS_MaxPhoneNumber] of AnsiChar;
(*RASAPI*)    dwAlternatesOffset     : Longint;
(*RASAPI*)    ipaddr,
(*RASAPI*)    ipaddrDns,
(*RASAPI*)    ipaddrDnsAlt,
(*RASAPI*)    ipaddrWins,
(*RASAPI*)    ipaddrWinsAlt          : TRasIPAddr;
(*RASAPI*)    dwFrameSize,
(*RASAPI*)    dwfNetProtocols,
(*RASAPI*)    dwFramingProtocol      : Longint;
(*RASAPI*)    szScript               : Array[0..MAX_PATH - 1] of AnsiChar;
(*RASAPI*)    szAutodialDll          : Array [0..MAX_PATH - 1] of AnsiChar;
(*RASAPI*)    szAutodialFunc         : Array [0..MAX_PATH - 1] of AnsiChar;
(*RASAPI*)    szDeviceType           : Array [0..RAS_MaxDeviceType] of AnsiChar;
(*RASAPI*)    szDeviceName           : Array [0..RAS_MaxDeviceName] of AnsiChar;
(*RASAPI*)    szX25PadType           : Array [0..RAS_MaxPadType] of AnsiChar;
(*RASAPI*)    szX25Address           : Array [0..RAS_MaxX25Address] of AnsiChar;
(*RASAPI*)    szX25Facilities        : Array [0..RAS_MaxFacilities] of AnsiChar;
(*RASAPI*)    szX25UserData          : Array [0..RAS_MaxUserData] of AnsiChar;
(*RASAPI*)    dwChannels,
(*RASAPI*)    dwReserved1,
(*RASAPI*)    dwReserved2            : Longint;
(*RASAPI*)  end;
(*RASAPI*)
(*RASAPI*)  LPRasEntryW = ^TRasEntryW;
(*RASAPI*)  TRasEntryW  = record
(*RASAPI*)    dwSize,
(*RASAPI*)    dwfOptions,
(*RASAPI*)    dwCountryID,
(*RASAPI*)    dwCountryCode          : Longint;
(*RASAPI*)    szAreaCode             : array[0.. RAS_MaxAreaCode] of WideChar;
(*RASAPI*)    szLocalPhoneNumber     : array[0..RAS_MaxPhoneNumber] of WideChar;
(*RASAPI*)    dwAlternatesOffset     : Longint;
(*RASAPI*)    ipaddr,
(*RASAPI*)    ipaddrDns,
(*RASAPI*)    ipaddrDnsAlt,
(*RASAPI*)    ipaddrWins,
(*RASAPI*)    ipaddrWinsAlt          : TRasIPAddr;
(*RASAPI*)    dwFrameSize,
(*RASAPI*)    dwfNetProtocols,
(*RASAPI*)    dwFramingProtocol      : Longint;
(*RASAPI*)    szScript               : Array[0..MAX_PATH - 1] of WideChar;
(*RASAPI*)    szAutodialDll          : Array [0..MAX_PATH - 1] of WideChar;
(*RASAPI*)    szAutodialFunc         : Array [0..MAX_PATH - 1] of WideChar;
(*RASAPI*)    szDeviceType           : Array [0..RAS_MaxDeviceType] of WideChar;
(*RASAPI*)    szDeviceName           : Array [0..RAS_MaxDeviceName] of WideChar;
(*RASAPI*)    szX25PadType           : Array [0..RAS_MaxPadType] of WideChar;
(*RASAPI*)    szX25Address           : Array [0..RAS_MaxX25Address] of WideChar;
(*RASAPI*)    szX25Facilities        : Array [0..RAS_MaxFacilities] of WideChar;
(*RASAPI*)    szX25UserData          : Array [0..RAS_MaxUserData] of WideChar;
(*RASAPI*)    dwChannels,
(*RASAPI*)    dwReserved1,
(*RASAPI*)    dwReserved2            : Longint;
(*RASAPI*)  end;
(*RASAPI*)
(*RASAPI*)  LPRasEntry = ^TRasEntry;
(*RASAPI*)  TRasEntry  = TRasEntryA;
(*RASAPI*)
(*RASAPI*)(* Describes Country Information *)
(*RASAPI*)  LPRasCtryInfo = ^TRasCtryInfo;
(*RASAPI*)  TRasCtryInfo  = record
(*RASAPI*)    dwSize,
(*RASAPI*)    dwCountryID,
(*RASAPI*)    dwNextCountryID,
(*RASAPI*)    dwCountryCode,
(*RASAPI*)    dwCountryNameOffset : Longint;
(*RASAPI*)  end;
(*RASAPI*)
(*RASAPI*)(* Describes RAS Device Information *)
(*RASAPI*)  LPRasDevInfoA = ^TRasDevInfoA;
(*RASAPI*)  TRasDevInfoA  = record
(*RASAPI*)    dwSize       : Longint;
(*RASAPI*)    szDeviceType : Array[0..RAS_MaxDeviceType] of AnsiChar;
(*RASAPI*)    szDeviceName : Array[0..RAS_MaxDeviceName] of AnsiChar;
(*RASAPI*)  end;
(*RASAPI*)
(*RASAPI*)  LPRasDevInfoW = ^TRasDevInfoW;
(*RASAPI*)  TRasDevInfoW  = record
(*RASAPI*)    dwSize       : Longint;
(*RASAPI*)    szDeviceType : Array[0..RAS_MaxDeviceType] of WideChar;
(*RASAPI*)    szDeviceName : Array[0..RAS_MaxDeviceName] of WideChar;
(*RASAPI*)  end;
(*RASAPI*)
(*RASAPI*)  LPRasDevInfo = ^TRasDevInfo;
(*RASAPI*)  TRasDevInfo  = TRasDevInfoA;
(*RASAPI*)
(*RASAPI*)const
(*RASAPI*)(* TRasEntry 'dwfOptions' bit flags. *)
(*RASAPI*)  RASEO_UseCountryAndAreaCodes = $00000001;
(*RASAPI*)  RASEO_SpecificIpAddr         = $00000002;
(*RASAPI*)  RASEO_SpecificNameServers    = $00000004;
(*RASAPI*)  RASEO_IpHeaderCompression    = $00000008;
(*RASAPI*)  RASEO_RemoteDefaultGateway   = $00000010;
(*RASAPI*)  RASEO_DisableLcpExtensions   = $00000020;
(*RASAPI*)  RASEO_TerminalBeforeDial     = $00000040;
(*RASAPI*)  RASEO_TerminalAfterDial      = $00000080;
(*RASAPI*)  RASEO_ModemLights            = $00000100;
(*RASAPI*)  RASEO_SwCompression          = $00000200;
(*RASAPI*)  RASEO_RequireEncryptedPw     = $00000400;
(*RASAPI*)  RASEO_RequireMsEncryptedPw   = $00000800;
(*RASAPI*)  RASEO_RequireDataEncryption  = $00001000;
(*RASAPI*)  RASEO_NetworkLogon           = $00002000;
(*RASAPI*)  RASEO_UseLogonCredentials    = $00004000;
(*RASAPI*)  RASEO_PromoteAlternates      = $00008000;
(*RASAPI*)
(*RASAPI*)(* TRasEntry 'dwfNetProtocols' bit flags. (session negotiated protocols) *)
(*RASAPI*)  RASNP_Netbeui = $00000001;  // Negotiate NetBEUI
(*RASAPI*)  RASNP_Ipx     = $00000002;  // Negotiate IPX
(*RASAPI*)  RASNP_Ip      = $00000004;  // Negotiate TCP/IP
(*RASAPI*)
(*RASAPI*)(* TRasEntry 'dwFramingProtocols' (framing protocols used by the server) *)
(*RASAPI*)  RASFP_Ppp  = $00000001;  // Point-to-Point Protocol (PPP)
(*RASAPI*)  RASFP_Slip = $00000002;  // Serial Line Internet Protocol (SLIP)
(*RASAPI*)  RASFP_Ras  = $00000004;  // Microsoft proprietary protocol
(*RASAPI*)
(*RASAPI*)(* TRasEntry 'szDeviceType' strings *)
(*RASAPI*)  RASDT_Modem = 'modem';     // Modem
(*RASAPI*)  RASDT_Isdn  = 'isdn';      // ISDN
(*RASAPI*)  RASDT_X25   = 'x25';      // X.25
(*RASAPI*)
(*RASAPI*)(* RAS functions found in RNAPH.DLL *)
(*RASAPI*)function RasValidateEntryNameA(lpszPhonebook,szEntry: PAnsiChar): Longint; stdcall;
(*RASAPI*)function RasValidateEntryNameW(lpszPhonebook,szEntry: PWideChar): Longint; stdcall;
(*RASAPI*)function RasValidateEntryName(lpszPhonebook,szEntry: PAnsiChar): Longint; stdcall;
(*RASAPI*)
(*RASAPI*)function RasRenameEntryA(lpszPhonebook,szEntryOld,szEntryNew: PAnsiChar): Longint; stdcall;
(*RASAPI*)function RasRenameEntryW(lpszPhonebook,szEntryOld,szEntryNew: PWideChar): Longint; stdcall;
(*RASAPI*)function RasRenameEntry(lpszPhonebook,szEntryOld,szEntryNew: PAnsiChar): Longint; stdcall;
(*RASAPI*)
(*RASAPI*)function RasDeleteEntryA(lpszPhonebook,szEntry: PAnsiChar): Longint; stdcall;
(*RASAPI*)function RasDeleteEntryW(lpszPhonebook,szEntry: PWideChar): Longint; stdcall;
(*RASAPI*)function RasDeleteEntry(lpszPhonebook,szEntry: PAnsiChar): Longint; stdcall;
(*RASAPI*)
(*RASAPI*)function RasGetEntryPropertiesA(lpszPhonebook, szEntry: PAnsiChar; lpbEntry: Pointer;
(*RASAPI*)                                var lpdwEntrySize: Longint; lpbDeviceInfo: Pointer;
(*RASAPI*)                                var lpdwDeviceInfoSize: Longint): Longint; stdcall;
(*RASAPI*)function RasGetEntryPropertiesW(lpszPhonebook, szEntry: PWideChar; lpbEntry: Pointer;
(*RASAPI*)                                var lpdwEntrySize: Longint; lpbDeviceInfo: Pointer;
(*RASAPI*)                                var lpdwDeviceInfoSize: Longint): Longint; stdcall;
(*RASAPI*)function RasGetEntryProperties(lpszPhonebook, szEntry: PAnsiChar; lpbEntry: Pointer;
(*RASAPI*)                                var lpdwEntrySize: Longint; lpbDeviceInfo: Pointer;
(*RASAPI*)                                var lpdwDeviceInfoSize: Longint): Longint; stdcall;
(*RASAPI*)
(*RASAPI*)function RasSetEntryPropertiesA(lpszPhonebook, szEntry: PAnsiChar; lpbEntry: Pointer;
(*RASAPI*)                                dwEntrySize: Longint; lpbDeviceInfo: Pointer;
(*RASAPI*)                                dwDeviceInfoSize: Longint): Longint; stdcall;
(*RASAPI*)function RasSetEntryPropertiesW(lpszPhonebook, szEntry: PWideChar; lpbEntry: Pointer;
(*RASAPI*)                                dwEntrySize: Longint; lpbDeviceInfo: Pointer;
(*RASAPI*)                                dwDeviceInfoSize: Longint): Longint; stdcall;
(*RASAPI*)function RasSetEntryProperties(lpszPhonebook, szEntry: PAnsiChar; lpbEntry: Pointer;
(*RASAPI*)                               dwEntrySize: Longint; lpbDeviceInfo: Pointer;
(*RASAPI*)                               dwDeviceInfoSize: Longint): Longint; stdcall;
(*RASAPI*)
(*RASAPI*)function RasGetCountryInfoA(var lpCtryInfo: TRasCtryInfo;var lpdwSize: Longint): Longint; stdcall;
(*RASAPI*)function RasGetCountryInfoW(var lpCtryInfo: TRasCtryInfo;var lpdwSize: Longint): Longint; stdcall;
(*RASAPI*)function RasGetCountryInfo(var lpCtryInfo: TRasCtryInfo;var lpdwSize: Longint): Longint; stdcall;
(*RASAPI*)
(*RASAPI*)function RasEnumDevicesA(lpBuff: LpRasDevInfoA; var lpcbSize: Longint;
(*RASAPI*)                         var lpcDevices: Longint): Longint; stdcall;
(*RASAPI*)function RasEnumDevicesW(lpBuff: LpRasDevInfoW; var lpcbSize: Longint;
(*RASAPI*)                         var lpcDevices: Longint): Longint; stdcall;
(*RASAPI*)function RasEnumDevices(lpBuff: LpRasDevInfo; var lpcbSize: Longint;
(*RASAPI*)                         var lpcDevices: Longint): Longint; stdcall;
(*RASAPI*)

{******************************************************}
{******************************************************}
{******************************************************}
// TAPI header by Davide Moretti
{******************************************************}
{******************************************************}
{******************************************************}
{++ BUILD Version: 0000    // Increment this if a change has global effects

The  Telephony  API  is jointly copyrighted by Intel and Microsoft.  You are
granted  a royalty free worldwide, unlimited license to make copies, and use
the   API/SPI  for  making  applications/drivers  that  interface  with  the
specification provided that this paragraph and the Intel/Microsoft copyright
statement is maintained as is in the text and source code files.

Copyright 1995-96 Microsoft, all rights reserved.
Portions copyright 1992, 1993 Intel/Microsoft, all rights reserved.

Module Name:

		tapi.h

Notes:

		Additions to the Telephony Application Programming Interface (TAPI) since
		version 1.0 are noted by version number (e.g. "TAPI v1.4").

--}

{ Converted to Delphi by Davide Moretti <dave@rimini.com> }

{
	-- TAPI VERSION INFO -- TAPI VERSION INFO -- TAPI VERSION INFO --
	-- TAPI VERSION INFO -- TAPI VERSION INFO -- TAPI VERSION INFO --
	-- TAPI VERSION INFO -- TAPI VERSION INFO -- TAPI VERSION INFO --

	To build a 32bit TAPI 1.4 application remove the $DEFINE TAPI20 below
}
(*TAPI*){$IFDEF WIN32}
(*TAPI*){$DEFINE TAPI20}
(*TAPI*){$ENDIF}
(*TAPI*)
(*TAPI*){$A-}
(*TAPI*)
(*TAPI*)const
(*TAPI*){$IFDEF TAPI20}
(*TAPI*)	TAPI_CURRENT_VERSION = $00020000;
(*TAPI*){$ELSE}
(*TAPI*)  TAPI_CURRENT_VERSION = $00010004;
(*TAPI*){$ENDIF}
(*TAPI*)
(*TAPI*){ #pragma pack(1) }
(*TAPI*)
(*TAPI*){ Type definitions of the data types used in tapi }
(*TAPI*)
(*TAPI*)type
(*TAPI*)  LPHCall = ^THCall;
(*TAPI*)  THCall = Longint;
(*TAPI*)  LPHLine = ^THLine;
(*TAPI*)  THLine = Longint;
(*TAPI*)  LPHPhone = ^THPhone;
(*TAPI*)  THPhone = Longint;
(*TAPI*)  LPHLineApp = ^THLineApp;
(*TAPI*)  THLineApp = Longint;
(*TAPI*)	LPHPhoneApp = ^THPhoneApp;
(*TAPI*)  THPhoneApp = Longint;
(*TAPI*)
(*TAPI*)  LPHIcon = ^HIcon;
(*TAPI*)
(*TAPI*)
(*TAPI*)TLineCallback = procedure(hDevice, dwMessage, dwInstance,
(*TAPI*)		dwParam1, dwParam2, dwParam3: Longint);
(*TAPI*){$IFDEF WIN32}
(*TAPI*)		stdcall;
(*TAPI*){$ENDIF}
(*TAPI*)TPhoneCallback = procedure(hDevice, dwMessage, dwInstance,
(*TAPI*)		dwParam1, dwParam2, dwParam3: Longint);
(*TAPI*){$IFDEF WIN32}
(*TAPI*)		stdcall;
(*TAPI*){$ENDIF}
(*TAPI*)
(*TAPI*){ Messages for Phones and Lines }
(*TAPI*)
(*TAPI*)const
(*TAPI*)  LINE_ADDRESSSTATE                       = 0;
(*TAPI*)  LINE_CALLINFO                           = 1;
(*TAPI*)  LINE_CALLSTATE                          = 2;
(*TAPI*)  LINE_CLOSE                              = 3;
(*TAPI*)  LINE_DEVSPECIFIC                        = 4;
(*TAPI*)  LINE_DEVSPECIFICFEATURE                 = 5;
(*TAPI*)  LINE_GATHERDIGITS                       = 6;
(*TAPI*)  LINE_GENERATE                           = 7;
(*TAPI*)  LINE_LINEDEVSTATE                       = 8;
(*TAPI*)  LINE_MONITORDIGITS                      = 9;
(*TAPI*)  LINE_MONITORMEDIA                       = 10;
(*TAPI*)  LINE_MONITORTONE                        = 11;
(*TAPI*)  LINE_REPLY                              = 12;
(*TAPI*)  LINE_REQUEST                            = 13;
(*TAPI*)  PHONE_BUTTON                            = 14;
(*TAPI*)  PHONE_CLOSE                             = 15;
(*TAPI*)  PHONE_DEVSPECIFIC                       = 16;
(*TAPI*)  PHONE_REPLY                             = 17;
(*TAPI*)  PHONE_STATE                             = 18;
(*TAPI*)  LINE_CREATE                             = 19;             { TAPI v1.4 }
(*TAPI*)  PHONE_CREATE                            = 20;             { TAPI v1.4 }
(*TAPI*){$IFDEF TAPI20}
(*TAPI*)  LINE_AGENTSPECIFIC                      = 21;             { TAPI v2.0 }
(*TAPI*)  LINE_AGENTSTATUS                        = 22;             { TAPI v2.0 }
(*TAPI*)  LINE_APPNEWCALL                         = 23;             { TAPI v2.0 }
(*TAPI*)  LINE_PROXYREQUEST                       = 24;             { TAPI v2.0 }
(*TAPI*)  LINE_REMOVE                             = 25;             { TAPI v2.0 }
(*TAPI*)  PHONE_REMOVE                            = 26;             { TAPI v2.0 }
(*TAPI*){$ENDIF}
(*TAPI*)
(*TAPI*)
(*TAPI*)
(*TAPI*)  INITIALIZE_NEGOTIATION                  = $FFFFFFFF;
(*TAPI*)
(*TAPI*)  LINEADDRCAPFLAGS_FWDNUMRINGS            = $00000001;
(*TAPI*)  LINEADDRCAPFLAGS_PICKUPGROUPID          = $00000002;
(*TAPI*)  LINEADDRCAPFLAGS_SECURE                 = $00000004;
(*TAPI*)  LINEADDRCAPFLAGS_BLOCKIDDEFAULT         = $00000008;
(*TAPI*)  LINEADDRCAPFLAGS_BLOCKIDOVERRIDE        = $00000010;
(*TAPI*)  LINEADDRCAPFLAGS_DIALED                 = $00000020;
(*TAPI*)  LINEADDRCAPFLAGS_ORIGOFFHOOK            = $00000040;
(*TAPI*)  LINEADDRCAPFLAGS_DESTOFFHOOK            = $00000080;
(*TAPI*)  LINEADDRCAPFLAGS_FWDCONSULT             = $00000100;
(*TAPI*)  LINEADDRCAPFLAGS_SETUPCONFNULL          = $00000200;
(*TAPI*)  LINEADDRCAPFLAGS_AUTORECONNECT          = $00000400;
(*TAPI*)  LINEADDRCAPFLAGS_COMPLETIONID           = $00000800;
(*TAPI*)  LINEADDRCAPFLAGS_TRANSFERHELD           = $00001000;
(*TAPI*)  LINEADDRCAPFLAGS_TRANSFERMAKE           = $00002000;
(*TAPI*)  LINEADDRCAPFLAGS_CONFERENCEHELD         = $00004000;
(*TAPI*)  LINEADDRCAPFLAGS_CONFERENCEMAKE         = $00008000;
(*TAPI*)  LINEADDRCAPFLAGS_PARTIALDIAL            = $00010000;
(*TAPI*)  LINEADDRCAPFLAGS_FWDSTATUSVALID         = $00020000;
(*TAPI*)  LINEADDRCAPFLAGS_FWDINTEXTADDR          = $00040000;
(*TAPI*)  LINEADDRCAPFLAGS_FWDBUSYNAADDR          = $00080000;
(*TAPI*)  LINEADDRCAPFLAGS_ACCEPTTOALERT          = $00100000;
(*TAPI*)  LINEADDRCAPFLAGS_CONFDROP               = $00200000;
(*TAPI*)  LINEADDRCAPFLAGS_PICKUPCALLWAIT         = $00400000;
(*TAPI*){$IFDEF TAPI20}
(*TAPI*)  LINEADDRCAPFLAGS_PREDICTIVEDIALER       = $00800000;      { TAPI v2.0 }
(*TAPI*)  LINEADDRCAPFLAGS_QUEUE                  = $01000000;      { TAPI v2.0 }
(*TAPI*)  LINEADDRCAPFLAGS_ROUTEPOINT             = $02000000;      { TAPI v2.0 }
(*TAPI*)  LINEADDRCAPFLAGS_HOLDMAKESNEW           = $04000000;      { TAPI v2.0 }
(*TAPI*)  LINEADDRCAPFLAGS_NOINTERNALCALLS        = $08000000;      { TAPI v2.0 }
(*TAPI*)  LINEADDRCAPFLAGS_NOEXTERNALCALLS        = $10000000;      { TAPI v2.0 }
(*TAPI*)  LINEADDRCAPFLAGS_SETCALLINGID           = $20000000;      { TAPI v2.0 }
(*TAPI*){$ENDIF}
(*TAPI*)
(*TAPI*)  LINEADDRESSMODE_ADDRESSID               = $00000001;
(*TAPI*)  LINEADDRESSMODE_DIALABLEADDR            = $00000002;
(*TAPI*)
(*TAPI*)  LINEADDRESSSHARING_PRIVATE              = $00000001;
(*TAPI*)  LINEADDRESSSHARING_BRIDGEDEXCL          = $00000002;
(*TAPI*)  LINEADDRESSSHARING_BRIDGEDNEW           = $00000004;
(*TAPI*)  LINEADDRESSSHARING_BRIDGEDSHARED        = $00000008;
(*TAPI*)  LINEADDRESSSHARING_MONITORED            = $00000010;
(*TAPI*)
(*TAPI*)  LINEADDRESSSTATE_OTHER                  = $00000001;
(*TAPI*)  LINEADDRESSSTATE_DEVSPECIFIC            = $00000002;
(*TAPI*)  LINEADDRESSSTATE_INUSEZERO              = $00000004;
(*TAPI*)  LINEADDRESSSTATE_INUSEONE               = $00000008;
(*TAPI*)  LINEADDRESSSTATE_INUSEMANY              = $00000010;
(*TAPI*)  LINEADDRESSSTATE_NUMCALLS               = $00000020;
(*TAPI*)  LINEADDRESSSTATE_FORWARD                = $00000040;
(*TAPI*)  LINEADDRESSSTATE_TERMINALS              = $00000080;
(*TAPI*)  LINEADDRESSSTATE_CAPSCHANGE             = $00000100;      { TAPI v1.4 }
(*TAPI*)
(*TAPI*)  LINEADDRFEATURE_FORWARD                 = $00000001;
(*TAPI*)  LINEADDRFEATURE_MAKECALL                = $00000002;
(*TAPI*)  LINEADDRFEATURE_PICKUP                  = $00000004;
(*TAPI*)  LINEADDRFEATURE_SETMEDIACONTROL         = $00000008;
(*TAPI*)  LINEADDRFEATURE_SETTERMINAL             = $00000010;
(*TAPI*)  LINEADDRFEATURE_SETUPCONF               = $00000020;
(*TAPI*)  LINEADDRFEATURE_UNCOMPLETECALL          = $00000040;
(*TAPI*)  LINEADDRFEATURE_UNPARK                  = $00000080;
(*TAPI*){$IFDEF TAPI20}
(*TAPI*)  LINEADDRFEATURE_PICKUPHELD              = $00000100;      { TAPI v2.0 }
(*TAPI*)  LINEADDRFEATURE_PICKUPGROUP             = $00000200;      { TAPI v2.0 }
(*TAPI*)  LINEADDRFEATURE_PICKUPDIRECT            = $00000400;      { TAPI v2.0 }
(*TAPI*)  LINEADDRFEATURE_PICKUPWAITING           = $00000800;      { TAPI v2.0 }
(*TAPI*)  LINEADDRFEATURE_FORWARDFWD              = $00001000;      { TAPI v2.0 }
(*TAPI*)  LINEADDRFEATURE_FORWARDDND              = $00002000;      { TAPI v2.0 }
(*TAPI*){$ENDIF}
(*TAPI*)
(*TAPI*){$IFDEF TAPI20}
(*TAPI*)  LINEAGENTFEATURE_SETAGENTGROUP          = $00000001;      { TAPI v2.0 }
(*TAPI*)  LINEAGENTFEATURE_SETAGENTSTATE          = $00000002;      { TAPI v2.0 }
(*TAPI*)  LINEAGENTFEATURE_SETAGENTACTIVITY       = $00000004;      { TAPI v2.0 }
(*TAPI*)  LINEAGENTFEATURE_AGENTSPECIFIC          = $00000008;      { TAPI v2.0 }
(*TAPI*)  LINEAGENTFEATURE_GETAGENTACTIVITYLIST   = $00000010;      { TAPI v2.0 }
(*TAPI*)  LINEAGENTFEATURE_GETAGENTGROUP          = $00000020;      { TAPI v2.0 }
(*TAPI*)
(*TAPI*)  LINEAGENTSTATE_LOGGEDOFF                = $00000001;      { TAPI v2.0 }
(*TAPI*)  LINEAGENTSTATE_NOTREADY                 = $00000002;      { TAPI v2.0 }
(*TAPI*)  LINEAGENTSTATE_READY                    = $00000004;      { TAPI v2.0 }
(*TAPI*)  LINEAGENTSTATE_BUSYACD                  = $00000008;      { TAPI v2.0 }
(*TAPI*)  LINEAGENTSTATE_BUSYINCOMING             = $00000010;      { TAPI v2.0 }
(*TAPI*)  LINEAGENTSTATE_BUSYOUTBOUND             = $00000020;      { TAPI v2.0 }
(*TAPI*)  LINEAGENTSTATE_BUSYOTHER                = $00000040;      { TAPI v2.0 }
(*TAPI*)  LINEAGENTSTATE_WORKINGAFTERCALL         = $00000080;      { TAPI v2.0 }
(*TAPI*)  LINEAGENTSTATE_UNKNOWN                  = $00000100;      { TAPI v2.0 }
(*TAPI*)  LINEAGENTSTATE_UNAVAIL                  = $00000200;      { TAPI v2.0 }
(*TAPI*)
(*TAPI*)  LINEAGENTSTATUS_GROUP                   = $00000001;      { TAPI v2.0 }
(*TAPI*)  LINEAGENTSTATUS_STATE                   = $00000002;      { TAPI v2.0 }
(*TAPI*)  LINEAGENTSTATUS_NEXTSTATE               = $00000004;      { TAPI v2.0 }
(*TAPI*)  LINEAGENTSTATUS_ACTIVITY                = $00000008;      { TAPI v2.0 }
(*TAPI*)  LINEAGENTSTATUS_ACTIVITYLIST            = $00000010;      { TAPI v2.0 }
(*TAPI*)  LINEAGENTSTATUS_GROUPLIST               = $00000020;      { TAPI v2.0 }
(*TAPI*)  LINEAGENTSTATUS_CAPSCHANGE              = $00000040;      { TAPI v2.0 }
(*TAPI*)  LINEAGENTSTATUS_VALIDSTATES             = $00000080;      { TAPI v2.0 }
(*TAPI*)  LINEAGENTSTATUS_VALIDNEXTSTATES         = $00000100;      { TAPI v2.0 }
(*TAPI*){$ENDIF}
(*TAPI*)
(*TAPI*)
(*TAPI*)  LINEANSWERMODE_NONE                     = $00000001;
(*TAPI*)  LINEANSWERMODE_DROP                     = $00000002;
(*TAPI*)  LINEANSWERMODE_HOLD                     = $00000004;
(*TAPI*)
(*TAPI*)  LINEBEARERMODE_VOICE                    = $00000001;
(*TAPI*)  LINEBEARERMODE_SPEECH                   = $00000002;
(*TAPI*)  LINEBEARERMODE_MULTIUSE                 = $00000004;
(*TAPI*)  LINEBEARERMODE_DATA                     = $00000008;
(*TAPI*)  LINEBEARERMODE_ALTSPEECHDATA            = $00000010;
(*TAPI*)  LINEBEARERMODE_NONCALLSIGNALING         = $00000020;
(*TAPI*)  LINEBEARERMODE_PASSTHROUGH              = $00000040;      { TAPI v1.4 }
(*TAPI*){$IFDEF TAPI20}
(*TAPI*)  LINEBEARERMODE_RESTRICTEDDATA           = $00000080;      { TAPI v2.0 }
(*TAPI*){$ENDIF}
(*TAPI*)
(*TAPI*)  LINEBUSYMODE_STATION                    = $00000001;
(*TAPI*)  LINEBUSYMODE_TRUNK                      = $00000002;
(*TAPI*)  LINEBUSYMODE_UNKNOWN                    = $00000004;
(*TAPI*)  LINEBUSYMODE_UNAVAIL                    = $00000008;
(*TAPI*)
(*TAPI*)  LINECALLCOMPLCOND_BUSY                  = $00000001;
(*TAPI*)  LINECALLCOMPLCOND_NOANSWER              = $00000002;
(*TAPI*)
(*TAPI*)  LINECALLCOMPLMODE_CAMPON                = $00000001;
(*TAPI*)  LINECALLCOMPLMODE_CALLBACK              = $00000002;
(*TAPI*)  LINECALLCOMPLMODE_INTRUDE               = $00000004;
(*TAPI*)  LINECALLCOMPLMODE_MESSAGE               = $00000008;
(*TAPI*)
(*TAPI*)  LINECALLFEATURE_ACCEPT                  = $00000001;
(*TAPI*)  LINECALLFEATURE_ADDTOCONF               = $00000002;
(*TAPI*)  LINECALLFEATURE_ANSWER                  = $00000004;
(*TAPI*)  LINECALLFEATURE_BLINDTRANSFER           = $00000008;
(*TAPI*)  LINECALLFEATURE_COMPLETECALL            = $00000010;
(*TAPI*)  LINECALLFEATURE_COMPLETETRANSF          = $00000020;
(*TAPI*)  LINECALLFEATURE_DIAL                    = $00000040;
(*TAPI*)  LINECALLFEATURE_DROP                    = $00000080;
(*TAPI*)  LINECALLFEATURE_GATHERDIGITS            = $00000100;
(*TAPI*)  LINECALLFEATURE_GENERATEDIGITS          = $00000200;
(*TAPI*)  LINECALLFEATURE_GENERATETONE            = $00000400;
(*TAPI*)  LINECALLFEATURE_HOLD                    = $00000800;
(*TAPI*)  LINECALLFEATURE_MONITORDIGITS           = $00001000;
(*TAPI*)  LINECALLFEATURE_MONITORMEDIA            = $00002000;
(*TAPI*)  LINECALLFEATURE_MONITORTONES            = $00004000;
(*TAPI*)  LINECALLFEATURE_PARK                    = $00008000;
(*TAPI*)  LINECALLFEATURE_PREPAREADDCONF          = $00010000;
(*TAPI*)  LINECALLFEATURE_REDIRECT                = $00020000;
(*TAPI*)  LINECALLFEATURE_REMOVEFROMCONF          = $00040000;
(*TAPI*)  LINECALLFEATURE_SECURECALL              = $00080000;
(*TAPI*)  LINECALLFEATURE_SENDUSERUSER            = $00100000;
(*TAPI*)  LINECALLFEATURE_SETCALLPARAMS           = $00200000;
(*TAPI*)  LINECALLFEATURE_SETMEDIACONTROL         = $00400000;
(*TAPI*)  LINECALLFEATURE_SETTERMINAL             = $00800000;
(*TAPI*)  LINECALLFEATURE_SETUPCONF               = $01000000;
(*TAPI*)  LINECALLFEATURE_SETUPTRANSFER           = $02000000;
(*TAPI*)  LINECALLFEATURE_SWAPHOLD                = $04000000;
(*TAPI*)  LINECALLFEATURE_UNHOLD                  = $08000000;
(*TAPI*)  LINECALLFEATURE_RELEASEUSERUSERINFO     = $10000000;      { TAPI v1.4 }
(*TAPI*){$IFDEF TAPI20}
(*TAPI*)  LINECALLFEATURE_SETTREATMENT            = $20000000;      { TAPI v2.0 }
(*TAPI*)  LINECALLFEATURE_SETQOS                  = $40000000;      { TAPI v2.0 }
(*TAPI*)  LINECALLFEATURE_SETCALLDATA             = $80000000;      { TAPI v2.0 }
(*TAPI*){$ENDIF}
(*TAPI*)
(*TAPI*){$IFDEF TAPI20}
(*TAPI*)  LINECALLFEATURE2_NOHOLDCONFERENCE       = $00000001;      { TAPI v2.0 }
(*TAPI*)  LINECALLFEATURE2_ONESTEPTRANSFER        = $00000002;      { TAPI v2.0 }
(*TAPI*)  LINECALLFEATURE2_COMPLCAMPON            = $00000004;      { TAPI v2.0 }
(*TAPI*)  LINECALLFEATURE2_COMPLCALLBACK          = $00000008;      { TAPI v2.0 }
(*TAPI*)  LINECALLFEATURE2_COMPLINTRUDE           = $00000010;      { TAPI v2.0 }
(*TAPI*)  LINECALLFEATURE2_COMPLMESSAGE           = $00000020;      { TAPI v2.0 }
(*TAPI*)  LINECALLFEATURE2_TRANSFERNORM           = $00000040;      { TAPI v2.0 }
(*TAPI*)  LINECALLFEATURE2_TRANSFERCONF           = $00000080;      { TAPI v2.0 }
(*TAPI*)  LINECALLFEATURE2_PARKDIRECT             = $00000100;      { TAPI v2.0 }
(*TAPI*)  LINECALLFEATURE2_PARKNONDIRECT          = $00000200;      { TAPI v2.0 }
(*TAPI*){$ENDIF}
(*TAPI*)
(*TAPI*)  LINECALLINFOSTATE_OTHER                 = $00000001;
(*TAPI*)  LINECALLINFOSTATE_DEVSPECIFIC           = $00000002;
(*TAPI*)  LINECALLINFOSTATE_BEARERMODE            = $00000004;
(*TAPI*)  LINECALLINFOSTATE_RATE                  = $00000008;
(*TAPI*)  LINECALLINFOSTATE_MEDIAMODE             = $00000010;
(*TAPI*)  LINECALLINFOSTATE_APPSPECIFIC           = $00000020;
(*TAPI*)  LINECALLINFOSTATE_CALLID                = $00000040;
(*TAPI*)  LINECALLINFOSTATE_RELATEDCALLID         = $00000080;
(*TAPI*)  LINECALLINFOSTATE_ORIGIN                = $00000100;
(*TAPI*)  LINECALLINFOSTATE_REASON                = $00000200;
(*TAPI*)  LINECALLINFOSTATE_COMPLETIONID          = $00000400;
(*TAPI*)  LINECALLINFOSTATE_NUMOWNERINCR          = $00000800;
(*TAPI*)  LINECALLINFOSTATE_NUMOWNERDECR          = $00001000;
(*TAPI*)  LINECALLINFOSTATE_NUMMONITORS           = $00002000;
(*TAPI*)  LINECALLINFOSTATE_TRUNK                 = $00004000;
(*TAPI*)  LINECALLINFOSTATE_CALLERID              = $00008000;
(*TAPI*)  LINECALLINFOSTATE_CALLEDID              = $00010000;
(*TAPI*)  LINECALLINFOSTATE_CONNECTEDID           = $00020000;
(*TAPI*)  LINECALLINFOSTATE_REDIRECTIONID         = $00040000;
(*TAPI*)  LINECALLINFOSTATE_REDIRECTINGID         = $00080000;
(*TAPI*)  LINECALLINFOSTATE_DISPLAY               = $00100000;
(*TAPI*)  LINECALLINFOSTATE_USERUSERINFO          = $00200000;
(*TAPI*)  LINECALLINFOSTATE_HIGHLEVELCOMP         = $00400000;
(*TAPI*)  LINECALLINFOSTATE_LOWLEVELCOMP          = $00800000;
(*TAPI*)  LINECALLINFOSTATE_CHARGINGINFO          = $01000000;
(*TAPI*)  LINECALLINFOSTATE_TERMINAL              = $02000000;
(*TAPI*)  LINECALLINFOSTATE_DIALPARAMS            = $04000000;
(*TAPI*)  LINECALLINFOSTATE_MONITORMODES          = $08000000;
(*TAPI*){$IFDEF TAPI20}
(*TAPI*)  LINECALLINFOSTATE_TREATMENT             = $10000000;      { TAPI v2.0 }
(*TAPI*)  LINECALLINFOSTATE_QOS                   = $20000000;      { TAPI v2.0 }
(*TAPI*)  LINECALLINFOSTATE_CALLDATA              = $40000000;      { TAPI v2.0 }
(*TAPI*){$ENDIF}
(*TAPI*)
(*TAPI*)  LINECALLORIGIN_OUTBOUND                 = $00000001;
(*TAPI*)  LINECALLORIGIN_INTERNAL                 = $00000002;
(*TAPI*)  LINECALLORIGIN_EXTERNAL                 = $00000004;
(*TAPI*)  LINECALLORIGIN_UNKNOWN                  = $00000010;
(*TAPI*)  LINECALLORIGIN_UNAVAIL                  = $00000020;
(*TAPI*)  LINECALLORIGIN_CONFERENCE               = $00000040;
(*TAPI*)  LINECALLORIGIN_INBOUND                  = $00000080;      { TAPI v1.4 }
(*TAPI*)
(*TAPI*)  LINECALLPARAMFLAGS_SECURE               = $00000001;
(*TAPI*)  LINECALLPARAMFLAGS_IDLE                 = $00000002;
(*TAPI*)  LINECALLPARAMFLAGS_BLOCKID              = $00000004;
(*TAPI*)  LINECALLPARAMFLAGS_ORIGOFFHOOK          = $00000008;
(*TAPI*)  LINECALLPARAMFLAGS_DESTOFFHOOK          = $00000010;
(*TAPI*){$IFDEF TAPI20}
(*TAPI*)  LINECALLPARAMFLAGS_NOHOLDCONFERENCE     = $00000020;      { TAPI v2.0 }
(*TAPI*)  LINECALLPARAMFLAGS_PREDICTIVEDIAL       = $00000040;      { TAPI v2.0 }
(*TAPI*)  LINECALLPARAMFLAGS_ONESTEPTRANSFER      = $00000080;      { TAPI v2.0 }
(*TAPI*){$ENDIF}
(*TAPI*)
(*TAPI*)  LINECALLPARTYID_BLOCKED                 = $00000001;
(*TAPI*)  LINECALLPARTYID_OUTOFAREA               = $00000002;
(*TAPI*)  LINECALLPARTYID_NAME                    = $00000004;
(*TAPI*)  LINECALLPARTYID_ADDRESS                 = $00000008;
(*TAPI*)  LINECALLPARTYID_PARTIAL                 = $00000010;
(*TAPI*)  LINECALLPARTYID_UNKNOWN                 = $00000020;
(*TAPI*)  LINECALLPARTYID_UNAVAIL                 = $00000040;
(*TAPI*)
(*TAPI*)  LINECALLPRIVILEGE_NONE                  = $00000001;
(*TAPI*)  LINECALLPRIVILEGE_MONITOR               = $00000002;
(*TAPI*)  LINECALLPRIVILEGE_OWNER                 = $00000004;
(*TAPI*)
(*TAPI*)  LINECALLREASON_DIRECT                   = $00000001;
(*TAPI*)  LINECALLREASON_FWDBUSY                  = $00000002;
(*TAPI*)  LINECALLREASON_FWDNOANSWER              = $00000004;
(*TAPI*)  LINECALLREASON_FWDUNCOND                = $00000008;
(*TAPI*)  LINECALLREASON_PICKUP                   = $00000010;
(*TAPI*)  LINECALLREASON_UNPARK                   = $00000020;
(*TAPI*)  LINECALLREASON_REDIRECT                 = $00000040;
(*TAPI*)  LINECALLREASON_CALLCOMPLETION           = $00000080;
(*TAPI*)  LINECALLREASON_TRANSFER                 = $00000100;
(*TAPI*)  LINECALLREASON_REMINDER                 = $00000200;
(*TAPI*)  LINECALLREASON_UNKNOWN                  = $00000400;
(*TAPI*)  LINECALLREASON_UNAVAIL                  = $00000800;
(*TAPI*)  LINECALLREASON_INTRUDE                  = $00001000;      { TAPI v1.4 }
(*TAPI*)  LINECALLREASON_PARKED                   = $00002000;      { TAPI v1.4 }
(*TAPI*){$IFDEF TAPI20}
(*TAPI*)  LINECALLREASON_CAMPEDON                 = $00004000;      { TAPI v2.0 }
(*TAPI*)  LINECALLREASON_ROUTEREQUEST             = $00008000;      { TAPI v2.0 }
(*TAPI*){$ENDIF}
(*TAPI*)
(*TAPI*)  LINECALLSELECT_LINE                     = $00000001;
(*TAPI*)  LINECALLSELECT_ADDRESS                  = $00000002;
(*TAPI*)  LINECALLSELECT_CALL                     = $00000004;
(*TAPI*)
(*TAPI*)  LINECALLSTATE_IDLE                      = $00000001;
(*TAPI*)  LINECALLSTATE_OFFERING                  = $00000002;
(*TAPI*)  LINECALLSTATE_ACCEPTED                  = $00000004;
(*TAPI*)  LINECALLSTATE_DIALTONE                  = $00000008;
(*TAPI*)  LINECALLSTATE_DIALING                   = $00000010;
(*TAPI*)  LINECALLSTATE_RINGBACK                  = $00000020;
(*TAPI*)  LINECALLSTATE_BUSY                      = $00000040;
(*TAPI*)  LINECALLSTATE_SPECIALINFO               = $00000080;
(*TAPI*)  LINECALLSTATE_CONNECTED                 = $00000100;
(*TAPI*)  LINECALLSTATE_PROCEEDING                = $00000200;
(*TAPI*)  LINECALLSTATE_ONHOLD                    = $00000400;
(*TAPI*)  LINECALLSTATE_CONFERENCED               = $00000800;
(*TAPI*)  LINECALLSTATE_ONHOLDPENDCONF            = $00001000;
(*TAPI*)  LINECALLSTATE_ONHOLDPENDTRANSFER        = $00002000;
(*TAPI*)  LINECALLSTATE_DISCONNECTED              = $00004000;
(*TAPI*)  LINECALLSTATE_UNKNOWN                   = $00008000;
(*TAPI*)
(*TAPI*){$IFDEF TAPI20}
(*TAPI*)  LINECALLTREATMENT_SILENCE               = $00000001;      { TAPI v2.0 }
(*TAPI*)  LINECALLTREATMENT_RINGBACK              = $00000002;      { TAPI v2.0 }
(*TAPI*)  LINECALLTREATMENT_BUSY                  = $00000003;      { TAPI v2.0 }
(*TAPI*)  LINECALLTREATMENT_MUSIC                 = $00000004;      { TAPI v2.0 }
(*TAPI*){$ENDIF}
(*TAPI*)
(*TAPI*)  LINECARDOPTION_PREDEFINED               = $00000001;      { TAPI v1.4 }
(*TAPI*)  LINECARDOPTION_HIDDEN                   = $00000002;      { TAPI v1.4 }
(*TAPI*)
(*TAPI*)  LINECONNECTEDMODE_ACTIVE                = $00000001;      { TAPI v1.4 }
(*TAPI*)  LINECONNECTEDMODE_INACTIVE              = $00000002;      { TAPI v1.4 }
(*TAPI*){$IFDEF TAPI20}
(*TAPI*)  LINECONNECTEDMODE_ACTIVEHELD            = $00000004;      { TAPI v2.0 }
(*TAPI*)  LINECONNECTEDMODE_INACTIVEHELD          = $00000008;      { TAPI v2.0 }
(*TAPI*)  LINECONNECTEDMODE_CONFIRMED             = $00000010;      { TAPI v2.0 }
(*TAPI*){$ENDIF}
(*TAPI*)
(*TAPI*)  LINEDEVCAPFLAGS_CROSSADDRCONF           = $00000001;
(*TAPI*)  LINEDEVCAPFLAGS_HIGHLEVCOMP             = $00000002;
(*TAPI*)  LINEDEVCAPFLAGS_LOWLEVCOMP              = $00000004;
(*TAPI*)  LINEDEVCAPFLAGS_MEDIACONTROL            = $00000008;
(*TAPI*)  LINEDEVCAPFLAGS_MULTIPLEADDR            = $00000010;
(*TAPI*)  LINEDEVCAPFLAGS_CLOSEDROP               = $00000020;
(*TAPI*)  LINEDEVCAPFLAGS_DIALBILLING             = $00000040;
(*TAPI*)  LINEDEVCAPFLAGS_DIALQUIET               = $00000080;
(*TAPI*)  LINEDEVCAPFLAGS_DIALDIALTONE            = $00000100;
(*TAPI*)
(*TAPI*)  LINEDEVSTATE_OTHER                      = $00000001;
(*TAPI*)  LINEDEVSTATE_RINGING                    = $00000002;
(*TAPI*)  LINEDEVSTATE_CONNECTED                  = $00000004;
(*TAPI*)  LINEDEVSTATE_DISCONNECTED               = $00000008;
(*TAPI*)  LINEDEVSTATE_MSGWAITON                  = $00000010;
(*TAPI*)  LINEDEVSTATE_MSGWAITOFF                 = $00000020;
(*TAPI*)  LINEDEVSTATE_INSERVICE                  = $00000040;
(*TAPI*)  LINEDEVSTATE_OUTOFSERVICE               = $00000080;
(*TAPI*)  LINEDEVSTATE_MAINTENANCE                = $00000100;
(*TAPI*)  LINEDEVSTATE_OPEN                       = $00000200;
(*TAPI*)  LINEDEVSTATE_CLOSE                      = $00000400;
(*TAPI*)  LINEDEVSTATE_NUMCALLS                   = $00000800;
(*TAPI*)  LINEDEVSTATE_NUMCOMPLETIONS             = $00001000;
(*TAPI*)  LINEDEVSTATE_TERMINALS                  = $00002000;
(*TAPI*)  LINEDEVSTATE_ROAMMODE                   = $00004000;
(*TAPI*)  LINEDEVSTATE_BATTERY                    = $00008000;
(*TAPI*)  LINEDEVSTATE_SIGNAL                     = $00010000;
(*TAPI*)  LINEDEVSTATE_DEVSPECIFIC                = $00020000;
(*TAPI*)  LINEDEVSTATE_REINIT                     = $00040000;
(*TAPI*)  LINEDEVSTATE_LOCK                       = $00080000;
(*TAPI*)  LINEDEVSTATE_CAPSCHANGE                 = $00100000;      { TAPI v1.4 }
(*TAPI*)  LINEDEVSTATE_CONFIGCHANGE               = $00200000;      { TAPI v1.4 }
(*TAPI*)  LINEDEVSTATE_TRANSLATECHANGE            = $00400000;      { TAPI v1.4 }
(*TAPI*)  LINEDEVSTATE_COMPLCANCEL                = $00800000;      { TAPI v1.4 }
(*TAPI*)  LINEDEVSTATE_REMOVED                    = $01000000;      { TAPI v1.4 }
(*TAPI*)
(*TAPI*)  LINEDEVSTATUSFLAGS_CONNECTED            = $00000001;
(*TAPI*)  LINEDEVSTATUSFLAGS_MSGWAIT              = $00000002;
(*TAPI*)  LINEDEVSTATUSFLAGS_INSERVICE            = $00000004;
(*TAPI*)  LINEDEVSTATUSFLAGS_LOCKED               = $00000008;
(*TAPI*)
(*TAPI*)  LINEDIALTONEMODE_NORMAL                 = $00000001;
(*TAPI*)  LINEDIALTONEMODE_SPECIAL                = $00000002;
(*TAPI*)  LINEDIALTONEMODE_INTERNAL               = $00000004;
(*TAPI*)  LINEDIALTONEMODE_EXTERNAL               = $00000008;
(*TAPI*)  LINEDIALTONEMODE_UNKNOWN                = $00000010;
(*TAPI*)  LINEDIALTONEMODE_UNAVAIL                = $00000020;
(*TAPI*)
(*TAPI*)  LINEDIGITMODE_PULSE                     = $00000001;
(*TAPI*)  LINEDIGITMODE_DTMF                      = $00000002;
(*TAPI*)  LINEDIGITMODE_DTMFEND                   = $00000004;
(*TAPI*)
(*TAPI*)  LINEDISCONNECTMODE_NORMAL               = $00000001;
(*TAPI*)  LINEDISCONNECTMODE_UNKNOWN              = $00000002;
(*TAPI*)  LINEDISCONNECTMODE_REJECT               = $00000004;
(*TAPI*)  LINEDISCONNECTMODE_PICKUP               = $00000008;
(*TAPI*)  LINEDISCONNECTMODE_FORWARDED            = $00000010;
(*TAPI*)  LINEDISCONNECTMODE_BUSY                 = $00000020;
(*TAPI*)  LINEDISCONNECTMODE_NOANSWER             = $00000040;
(*TAPI*)  LINEDISCONNECTMODE_BADADDRESS           = $00000080;
(*TAPI*)  LINEDISCONNECTMODE_UNREACHABLE          = $00000100;
(*TAPI*)  LINEDISCONNECTMODE_CONGESTION           = $00000200;
(*TAPI*)  LINEDISCONNECTMODE_INCOMPATIBLE         = $00000400;
(*TAPI*)  LINEDISCONNECTMODE_UNAVAIL              = $00000800;
(*TAPI*)  LINEDISCONNECTMODE_NODIALTONE           = $00001000;      { TAPI v1.4 }
(*TAPI*){$IFDEF TAPI20}
(*TAPI*)  LINEDISCONNECTMODE_NUMBERCHANGED        = $00002000;      { TAPI v2.0 }
(*TAPI*)  LINEDISCONNECTMODE_OUTOFORDER           = $00004000;      { TAPI v2.0 }
(*TAPI*)  LINEDISCONNECTMODE_TEMPFAILURE          = $00008000;      { TAPI v2.0 }
(*TAPI*)  LINEDISCONNECTMODE_QOSUNAVAIL           = $00010000;      { TAPI v2.0 }
(*TAPI*)  LINEDISCONNECTMODE_BLOCKED              = $00020000;      { TAPI v2.0 }
(*TAPI*)  LINEDISCONNECTMODE_DONOTDISTURB         = $00040000;      { TAPI v2.0 }
(*TAPI*)  LINEDISCONNECTMODE_CANCELLED            = $00080000;      { TAPI v2.0 }
(*TAPI*){$ENDIF}
(*TAPI*)
(*TAPI*)  LINEERR_ALLOCATED                       = $80000001;
(*TAPI*)  LINEERR_BADDEVICEID                     = $80000002;
(*TAPI*)  LINEERR_BEARERMODEUNAVAIL               = $80000003;
(*TAPI*)  LINEERR_CALLUNAVAIL                     = $80000005;
(*TAPI*)  LINEERR_COMPLETIONOVERRUN               = $80000006;
(*TAPI*)  LINEERR_CONFERENCEFULL                  = $80000007;
(*TAPI*)  LINEERR_DIALBILLING                     = $80000008;
(*TAPI*)  LINEERR_DIALDIALTONE                    = $80000009;
(*TAPI*)  LINEERR_DIALPROMPT                      = $8000000A;
(*TAPI*)  LINEERR_DIALQUIET                       = $8000000B;
(*TAPI*)  LINEERR_INCOMPATIBLEAPIVERSION          = $8000000C;
(*TAPI*)  LINEERR_INCOMPATIBLEEXTVERSION          = $8000000D;
(*TAPI*)  LINEERR_INIFILECORRUPT                  = $8000000E;
(*TAPI*)  LINEERR_INUSE                           = $8000000F;
(*TAPI*)  LINEERR_INVALADDRESS                    = $80000010;
(*TAPI*)  LINEERR_INVALADDRESSID                  = $80000011;
(*TAPI*)  LINEERR_INVALADDRESSMODE                = $80000012;
(*TAPI*)  LINEERR_INVALADDRESSSTATE               = $80000013;
(*TAPI*)  LINEERR_INVALAPPHANDLE                  = $80000014;
(*TAPI*)  LINEERR_INVALAPPNAME                    = $80000015;
(*TAPI*)  LINEERR_INVALBEARERMODE                 = $80000016;
(*TAPI*)  LINEERR_INVALCALLCOMPLMODE              = $80000017;
(*TAPI*)  LINEERR_INVALCALLHANDLE                 = $80000018;
(*TAPI*)  LINEERR_INVALCALLPARAMS                 = $80000019;
(*TAPI*)  LINEERR_INVALCALLPRIVILEGE              = $8000001A;
(*TAPI*)  LINEERR_INVALCALLSELECT                 = $8000001B;
(*TAPI*)  LINEERR_INVALCALLSTATE                  = $8000001C;
(*TAPI*)  LINEERR_INVALCALLSTATELIST              = $8000001D;
(*TAPI*)  LINEERR_INVALCARD                       = $8000001E;
(*TAPI*)  LINEERR_INVALCOMPLETIONID               = $8000001F;
(*TAPI*)  LINEERR_INVALCONFCALLHANDLE             = $80000020;
(*TAPI*)  LINEERR_INVALCONSULTCALLHANDLE          = $80000021;
(*TAPI*)  LINEERR_INVALCOUNTRYCODE                = $80000022;
(*TAPI*)  LINEERR_INVALDEVICECLASS                = $80000023;
(*TAPI*)  LINEERR_INVALDEVICEHANDLE               = $80000024;
(*TAPI*)  LINEERR_INVALDIALPARAMS                 = $80000025;
(*TAPI*)  LINEERR_INVALDIGITLIST                  = $80000026;
(*TAPI*)  LINEERR_INVALDIGITMODE                  = $80000027;
(*TAPI*)  LINEERR_INVALDIGITS                     = $80000028;
(*TAPI*)  LINEERR_INVALEXTVERSION                 = $80000029;
(*TAPI*)  LINEERR_INVALGROUPID                    = $8000002A;
(*TAPI*)  LINEERR_INVALLINEHANDLE                 = $8000002B;
(*TAPI*)  LINEERR_INVALLINESTATE                  = $8000002C;
(*TAPI*)  LINEERR_INVALLOCATION                   = $8000002D;
(*TAPI*)  LINEERR_INVALMEDIALIST                  = $8000002E;
(*TAPI*)  LINEERR_INVALMEDIAMODE                  = $8000002F;
(*TAPI*)  LINEERR_INVALMESSAGEID                  = $80000030;
(*TAPI*)  LINEERR_INVALPARAM                      = $80000032;
(*TAPI*)  LINEERR_INVALPARKID                     = $80000033;
(*TAPI*)  LINEERR_INVALPARKMODE                   = $80000034;
(*TAPI*)  LINEERR_INVALPOINTER                    = $80000035;
(*TAPI*)  LINEERR_INVALPRIVSELECT                 = $80000036;
(*TAPI*)  LINEERR_INVALRATE                       = $80000037;
(*TAPI*)  LINEERR_INVALREQUESTMODE                = $80000038;
(*TAPI*)  LINEERR_INVALTERMINALID                 = $80000039;
(*TAPI*)  LINEERR_INVALTERMINALMODE               = $8000003A;
(*TAPI*)  LINEERR_INVALTIMEOUT                    = $8000003B;
(*TAPI*)  LINEERR_INVALTONE                       = $8000003C;
(*TAPI*)  LINEERR_INVALTONELIST                   = $8000003D;
(*TAPI*)  LINEERR_INVALTONEMODE                   = $8000003E;
(*TAPI*)  LINEERR_INVALTRANSFERMODE               = $8000003F;
(*TAPI*)  LINEERR_LINEMAPPERFAILED                = $80000040;
(*TAPI*)  LINEERR_NOCONFERENCE                    = $80000041;
(*TAPI*)  LINEERR_NODEVICE                        = $80000042;
(*TAPI*)  LINEERR_NODRIVER                        = $80000043;
(*TAPI*)  LINEERR_NOMEM                           = $80000044;
(*TAPI*)  LINEERR_NOREQUEST                       = $80000045;
(*TAPI*)  LINEERR_NOTOWNER                        = $80000046;
(*TAPI*)  LINEERR_NOTREGISTERED                   = $80000047;
(*TAPI*)  LINEERR_OPERATIONFAILED                 = $80000048;
(*TAPI*)  LINEERR_OPERATIONUNAVAIL                = $80000049;
(*TAPI*)  LINEERR_RATEUNAVAIL                     = $8000004A;
(*TAPI*)  LINEERR_RESOURCEUNAVAIL                 = $8000004B;
(*TAPI*)  LINEERR_REQUESTOVERRUN                  = $8000004C;
(*TAPI*)  LINEERR_STRUCTURETOOSMALL               = $8000004D;
(*TAPI*)  LINEERR_TARGETNOTFOUND                  = $8000004E;
(*TAPI*)  LINEERR_TARGETSELF                      = $8000004F;
(*TAPI*)  LINEERR_UNINITIALIZED                   = $80000050;
(*TAPI*)  LINEERR_USERUSERINFOTOOBIG              = $80000051;
(*TAPI*)  LINEERR_REINIT                          = $80000052;
(*TAPI*)  LINEERR_ADDRESSBLOCKED                  = $80000053;
(*TAPI*)  LINEERR_BILLINGREJECTED                 = $80000054;
(*TAPI*)  LINEERR_INVALFEATURE                    = $80000055;
(*TAPI*)  LINEERR_NOMULTIPLEINSTANCE              = $80000056;
(*TAPI*){$IFDEF TAPI20}
(*TAPI*)  LINEERR_INVALAGENTID                    = $80000057;      { TAPI v2.0 }
(*TAPI*)  LINEERR_INVALAGENTGROUP                 = $80000058;      { TAPI v2.0 }
(*TAPI*)  LINEERR_INVALPASSWORD                   = $80000059;      { TAPI v2.0 }
(*TAPI*)  LINEERR_INVALAGENTSTATE                 = $8000005A;      { TAPI v2.0 }
(*TAPI*)  LINEERR_INVALAGENTACTIVITY              = $8000005B;      { TAPI v2.0 }
(*TAPI*)  LINEERR_DIALVOICEDETECT                 = $8000005C;      { TAPI v2.0 }
(*TAPI*){$ENDIF}
(*TAPI*)
(*TAPI*)  LINEFEATURE_DEVSPECIFIC                 = $00000001;
(*TAPI*)  LINEFEATURE_DEVSPECIFICFEAT             = $00000002;
(*TAPI*)  LINEFEATURE_FORWARD                     = $00000004;
(*TAPI*)  LINEFEATURE_MAKECALL                    = $00000008;
(*TAPI*)  LINEFEATURE_SETMEDIACONTROL             = $00000010;
(*TAPI*)  LINEFEATURE_SETTERMINAL                 = $00000020;
(*TAPI*){$IFDEF TAPI20}
(*TAPI*)  LINEFEATURE_SETDEVSTATUS                = $00000040;      { TAPI v2.0 }
(*TAPI*)  LINEFEATURE_FORWARDFWD                  = $00000080;      { TAPI v2.0 }
(*TAPI*)  LINEFEATURE_FORWARDDND                  = $00000100;      { TAPI v2.0 }
(*TAPI*){$ENDIF}
(*TAPI*)
(*TAPI*)  LINEFORWARDMODE_UNCOND                  = $00000001;
(*TAPI*)  LINEFORWARDMODE_UNCONDINTERNAL          = $00000002;
(*TAPI*)  LINEFORWARDMODE_UNCONDEXTERNAL          = $00000004;
(*TAPI*)  LINEFORWARDMODE_UNCONDSPECIFIC          = $00000008;
(*TAPI*)  LINEFORWARDMODE_BUSY                    = $00000010;
(*TAPI*)  LINEFORWARDMODE_BUSYINTERNAL            = $00000020;
(*TAPI*)  LINEFORWARDMODE_BUSYEXTERNAL            = $00000040;
(*TAPI*)  LINEFORWARDMODE_BUSYSPECIFIC            = $00000080;
(*TAPI*)  LINEFORWARDMODE_NOANSW                  = $00000100;
(*TAPI*)  LINEFORWARDMODE_NOANSWINTERNAL          = $00000200;
(*TAPI*)  LINEFORWARDMODE_NOANSWEXTERNAL          = $00000400;
(*TAPI*)  LINEFORWARDMODE_NOANSWSPECIFIC          = $00000800;
(*TAPI*)  LINEFORWARDMODE_BUSYNA                  = $00001000;
(*TAPI*)  LINEFORWARDMODE_BUSYNAINTERNAL          = $00002000;
(*TAPI*)  LINEFORWARDMODE_BUSYNAEXTERNAL          = $00004000;
(*TAPI*)  LINEFORWARDMODE_BUSYNASPECIFIC          = $00008000;
(*TAPI*)  LINEFORWARDMODE_UNKNOWN                 = $00010000;      { TAPI v1.4 }
(*TAPI*)  LINEFORWARDMODE_UNAVAIL                 = $00020000;      { TAPI v1.4 }
(*TAPI*)
(*TAPI*)  LINEGATHERTERM_BUFFERFULL               = $00000001;
(*TAPI*)  LINEGATHERTERM_TERMDIGIT                = $00000002;
(*TAPI*)  LINEGATHERTERM_FIRSTTIMEOUT             = $00000004;
(*TAPI*)  LINEGATHERTERM_INTERTIMEOUT             = $00000008;
(*TAPI*)  LINEGATHERTERM_CANCEL                   = $00000010;
(*TAPI*)
(*TAPI*)  LINEGENERATETERM_DONE                   = $00000001;
(*TAPI*)  LINEGENERATETERM_CANCEL                 = $00000002;
(*TAPI*)
(*TAPI*){$IFDEF TAPI20}
(*TAPI*){
(*TAPI*) These constants are mutually exclusive - there's no way to specify more
(*TAPI*) than one at a time (and it doesn't make sense, either) so they're
(*TAPI*) ordinal rather than bits.
(*TAPI*)}
(*TAPI*)  LINEINITIALIZEEXOPTION_USEHIDDENWINDOW      = $00000001; { TAPI v2.0 }
(*TAPI*)  LINEINITIALIZEEXOPTION_USEEVENT             = $00000002; { TAPI v2.0 }
(*TAPI*)  LINEINITIALIZEEXOPTION_USECOMPLETIONPORT    = $00000003; { TAPI v2.0 }
(*TAPI*){$ENDIF}
(*TAPI*)
(*TAPI*)  LINELOCATIONOPTION_PULSEDIAL            = $00000001;     { TAPI v1.4 }
(*TAPI*)
(*TAPI*)  LINEMAPPER                              = $FFFFFFFF;
(*TAPI*)
(*TAPI*)  LINEMEDIACONTROL_NONE                   = $00000001;
(*TAPI*)  LINEMEDIACONTROL_START                  = $00000002;
(*TAPI*)  LINEMEDIACONTROL_RESET                  = $00000004;
(*TAPI*)  LINEMEDIACONTROL_PAUSE                  = $00000008;
(*TAPI*)  LINEMEDIACONTROL_RESUME                 = $00000010;
(*TAPI*)  LINEMEDIACONTROL_RATEUP                 = $00000020;
(*TAPI*)  LINEMEDIACONTROL_RATEDOWN               = $00000040;
(*TAPI*)  LINEMEDIACONTROL_RATENORMAL             = $00000080;
(*TAPI*)  LINEMEDIACONTROL_VOLUMEUP               = $00000100;
(*TAPI*)  LINEMEDIACONTROL_VOLUMEDOWN             = $00000200;
(*TAPI*)  LINEMEDIACONTROL_VOLUMENORMAL           = $00000400;
(*TAPI*)
(*TAPI*)  LINEMEDIAMODE_UNKNOWN                   = $00000002;
(*TAPI*)  LINEMEDIAMODE_INTERACTIVEVOICE          = $00000004;
(*TAPI*)  LINEMEDIAMODE_AUTOMATEDVOICE            = $00000008;
(*TAPI*)  LINEMEDIAMODE_DATAMODEM                 = $00000010;
(*TAPI*)  LINEMEDIAMODE_G3FAX                     = $00000020;
(*TAPI*)  LINEMEDIAMODE_TDD                       = $00000040;
(*TAPI*)  LINEMEDIAMODE_G4FAX                     = $00000080;
(*TAPI*)  LINEMEDIAMODE_DIGITALDATA               = $00000100;
(*TAPI*)  LINEMEDIAMODE_TELETEX                   = $00000200;
(*TAPI*)  LINEMEDIAMODE_VIDEOTEX                  = $00000400;
(*TAPI*)  LINEMEDIAMODE_TELEX                     = $00000800;
(*TAPI*)  LINEMEDIAMODE_MIXED                     = $00001000;
(*TAPI*)  LINEMEDIAMODE_ADSI                      = $00002000;
(*TAPI*)  LINEMEDIAMODE_VOICEVIEW                 = $00004000;      { TAPI v1.4 }
(*TAPI*)  LAST_LINEMEDIAMODE                      = $00004000;
(*TAPI*)
(*TAPI*)  LINEOFFERINGMODE_ACTIVE                 = $00000001;      { TAPI v1.4 }
(*TAPI*)  LINEOFFERINGMODE_INACTIVE               = $00000002;      { TAPI v1.4 }
(*TAPI*)
(*TAPI*){$IFDEF TAPI20}
(*TAPI*)  LINEOPENOPTION_SINGLEADDRESS            = $80000000;      { TAPI v2.0 }
(*TAPI*)  LINEOPENOPTION_PROXY                    = $40000000;      { TAPI v2.0 }
(*TAPI*){$ENDIF}
(*TAPI*)
(*TAPI*)  LINEPARKMODE_DIRECTED                   = $00000001;
(*TAPI*)  LINEPARKMODE_NONDIRECTED                = $00000002;
(*TAPI*)
(*TAPI*){$IFDEF TAPI20}
(*TAPI*)  LINEPROXYREQUEST_SETAGENTGROUP          = $00000001;      { TAPI v2.0 }
(*TAPI*)  LINEPROXYREQUEST_SETAGENTSTATE          = $00000002;      { TAPI v2.0 }
(*TAPI*)  LINEPROXYREQUEST_SETAGENTACTIVITY       = $00000003;      { TAPI v2.0 }
(*TAPI*)  LINEPROXYREQUEST_GETAGENTCAPS           = $00000004;      { TAPI v2.0 }
(*TAPI*)  LINEPROXYREQUEST_GETAGENTSTATUS         = $00000005;      { TAPI v2.0 }
(*TAPI*)  LINEPROXYREQUEST_AGENTSPECIFIC          = $00000006;      { TAPI v2.0 }
(*TAPI*)  LINEPROXYREQUEST_GETAGENTACTIVITYLIST   = $00000007;      { TAPI v2.0 }
(*TAPI*)  LINEPROXYREQUEST_GETAGENTGROUPLIST      = $00000008;      { TAPI v2.0 }
(*TAPI*){$ENDIF}
(*TAPI*)
(*TAPI*)  LINEREMOVEFROMCONF_NONE                 = $00000001;
(*TAPI*)  LINEREMOVEFROMCONF_LAST                 = $00000002;
(*TAPI*)  LINEREMOVEFROMCONF_ANY                  = $00000003;
(*TAPI*)
(*TAPI*)  LINEREQUESTMODE_MAKECALL                = $00000001;
(*TAPI*)  LINEREQUESTMODE_MEDIACALL               = $00000002;
(*TAPI*)  LINEREQUESTMODE_DROP                    = $00000004;
(*TAPI*)  LAST_LINEREQUESTMODE                    = LINEREQUESTMODE_MEDIACALL;
(*TAPI*)
(*TAPI*)  LINEROAMMODE_UNKNOWN                    = $00000001;
(*TAPI*)  LINEROAMMODE_UNAVAIL                    = $00000002;
(*TAPI*)  LINEROAMMODE_HOME                       = $00000004;
(*TAPI*)  LINEROAMMODE_ROAMA                      = $00000008;
(*TAPI*)  LINEROAMMODE_ROAMB                      = $00000010;
(*TAPI*)
(*TAPI*)  LINESPECIALINFO_NOCIRCUIT               = $00000001;
(*TAPI*)  LINESPECIALINFO_CUSTIRREG               = $00000002;
(*TAPI*)  LINESPECIALINFO_REORDER                 = $00000004;
(*TAPI*)  LINESPECIALINFO_UNKNOWN                 = $00000008;
(*TAPI*)  LINESPECIALINFO_UNAVAIL                 = $00000010;
(*TAPI*)
(*TAPI*)  LINETERMDEV_PHONE                       = $00000001;
(*TAPI*)  LINETERMDEV_HEADSET                     = $00000002;
(*TAPI*)  LINETERMDEV_SPEAKER                     = $00000004;
(*TAPI*)
(*TAPI*)  LINETERMMODE_BUTTONS                    = $00000001;
(*TAPI*)  LINETERMMODE_LAMPS                      = $00000002;
(*TAPI*)  LINETERMMODE_DISPLAY                    = $00000004;
(*TAPI*)  LINETERMMODE_RINGER                     = $00000008;
(*TAPI*)  LINETERMMODE_HOOKSWITCH                 = $00000010;
(*TAPI*)  LINETERMMODE_MEDIATOLINE                = $00000020;
(*TAPI*)  LINETERMMODE_MEDIAFROMLINE              = $00000040;
(*TAPI*)  LINETERMMODE_MEDIABIDIRECT              = $00000080;
(*TAPI*)
(*TAPI*)  LINETERMSHARING_PRIVATE                 = $00000001;
(*TAPI*)  LINETERMSHARING_SHAREDEXCL              = $00000002;
(*TAPI*)  LINETERMSHARING_SHAREDCONF              = $00000004;
(*TAPI*)
(*TAPI*)  LINETOLLLISTOPTION_ADD                  = $00000001;
(*TAPI*)  LINETOLLLISTOPTION_REMOVE               = $00000002;
(*TAPI*)
(*TAPI*)  LINETONEMODE_CUSTOM                     = $00000001;
(*TAPI*)  LINETONEMODE_RINGBACK                   = $00000002;
(*TAPI*)  LINETONEMODE_BUSY                       = $00000004;
(*TAPI*)  LINETONEMODE_BEEP                       = $00000008;
(*TAPI*)  LINETONEMODE_BILLING                    = $00000010;
(*TAPI*)
(*TAPI*)  LINETRANSFERMODE_TRANSFER               = $00000001;
(*TAPI*)  LINETRANSFERMODE_CONFERENCE             = $00000002;
(*TAPI*)
(*TAPI*)  LINETRANSLATEOPTION_CARDOVERRIDE        = $00000001;
(*TAPI*)  LINETRANSLATEOPTION_CANCELCALLWAITING   = $00000002;      { TAPI v1.4 }
(*TAPI*)  LINETRANSLATEOPTION_FORCELOCAL          = $00000004;      { TAPI v1.4 }
(*TAPI*)  LINETRANSLATEOPTION_FORCELD             = $00000008;      { TAPI v1.4 }
(*TAPI*)
(*TAPI*)  LINETRANSLATERESULT_CANONICAL           = $00000001;
(*TAPI*)  LINETRANSLATERESULT_INTERNATIONAL       = $00000002;
(*TAPI*)  LINETRANSLATERESULT_LONGDISTANCE        = $00000004;
(*TAPI*)  LINETRANSLATERESULT_LOCAL               = $00000008;
(*TAPI*)  LINETRANSLATERESULT_INTOLLLIST          = $00000010;
(*TAPI*)  LINETRANSLATERESULT_NOTINTOLLLIST       = $00000020;
(*TAPI*)  LINETRANSLATERESULT_DIALBILLING         = $00000040;
(*TAPI*)  LINETRANSLATERESULT_DIALQUIET           = $00000080;
(*TAPI*)  LINETRANSLATERESULT_DIALDIALTONE        = $00000100;
(*TAPI*)  LINETRANSLATERESULT_DIALPROMPT          = $00000200;
(*TAPI*){$IFDEF TAPI20}
(*TAPI*)  LINETRANSLATERESULT_VOICEDETECT         = $00000400;      { TAPI v2.0 }
(*TAPI*){$ENDIF}
(*TAPI*)
(*TAPI*)  PHONEBUTTONFUNCTION_UNKNOWN             = $00000000;
(*TAPI*)  PHONEBUTTONFUNCTION_CONFERENCE          = $00000001;
(*TAPI*)  PHONEBUTTONFUNCTION_TRANSFER            = $00000002;
(*TAPI*)  PHONEBUTTONFUNCTION_DROP                = $00000003;
(*TAPI*)  PHONEBUTTONFUNCTION_HOLD                = $00000004;
(*TAPI*)  PHONEBUTTONFUNCTION_RECALL              = $00000005;
(*TAPI*)  PHONEBUTTONFUNCTION_DISCONNECT          = $00000006;
(*TAPI*)  PHONEBUTTONFUNCTION_CONNECT             = $00000007;
(*TAPI*)  PHONEBUTTONFUNCTION_MSGWAITON           = $00000008;
(*TAPI*)  PHONEBUTTONFUNCTION_MSGWAITOFF          = $00000009;
(*TAPI*)  PHONEBUTTONFUNCTION_SELECTRING          = $0000000A;
(*TAPI*)  PHONEBUTTONFUNCTION_ABBREVDIAL          = $0000000B;
(*TAPI*)  PHONEBUTTONFUNCTION_FORWARD             = $0000000C;
(*TAPI*)  PHONEBUTTONFUNCTION_PICKUP              = $0000000D;
(*TAPI*)  PHONEBUTTONFUNCTION_RINGAGAIN           = $0000000E;
(*TAPI*)  PHONEBUTTONFUNCTION_PARK                = $0000000F;
(*TAPI*)  PHONEBUTTONFUNCTION_REJECT              = $00000010;
(*TAPI*)  PHONEBUTTONFUNCTION_REDIRECT            = $00000011;
(*TAPI*)  PHONEBUTTONFUNCTION_MUTE                = $00000012;
(*TAPI*)  PHONEBUTTONFUNCTION_VOLUMEUP            = $00000013;
(*TAPI*)  PHONEBUTTONFUNCTION_VOLUMEDOWN          = $00000014;
(*TAPI*)  PHONEBUTTONFUNCTION_SPEAKERON           = $00000015;
(*TAPI*)  PHONEBUTTONFUNCTION_SPEAKEROFF          = $00000016;
(*TAPI*)  PHONEBUTTONFUNCTION_FLASH               = $00000017;
(*TAPI*)  PHONEBUTTONFUNCTION_DATAON              = $00000018;
(*TAPI*)  PHONEBUTTONFUNCTION_DATAOFF             = $00000019;
(*TAPI*)  PHONEBUTTONFUNCTION_DONOTDISTURB        = $0000001A;
(*TAPI*)  PHONEBUTTONFUNCTION_INTERCOM            = $0000001B;
(*TAPI*)  PHONEBUTTONFUNCTION_BRIDGEDAPP          = $0000001C;
(*TAPI*)  PHONEBUTTONFUNCTION_BUSY                = $0000001D;
(*TAPI*)  PHONEBUTTONFUNCTION_CALLAPP             = $0000001E;
(*TAPI*)  PHONEBUTTONFUNCTION_DATETIME            = $0000001F;
(*TAPI*)  PHONEBUTTONFUNCTION_DIRECTORY           = $00000020;
(*TAPI*)  PHONEBUTTONFUNCTION_COVER               = $00000021;
(*TAPI*)  PHONEBUTTONFUNCTION_CALLID              = $00000022;
(*TAPI*)  PHONEBUTTONFUNCTION_LASTNUM             = $00000023;
(*TAPI*)  PHONEBUTTONFUNCTION_NIGHTSRV            = $00000024;
(*TAPI*)  PHONEBUTTONFUNCTION_SENDCALLS           = $00000025;
(*TAPI*)  PHONEBUTTONFUNCTION_MSGINDICATOR        = $00000026;
(*TAPI*)  PHONEBUTTONFUNCTION_REPDIAL             = $00000027;
(*TAPI*)  PHONEBUTTONFUNCTION_SETREPDIAL          = $00000028;
(*TAPI*)  PHONEBUTTONFUNCTION_SYSTEMSPEED         = $00000029;
(*TAPI*)  PHONEBUTTONFUNCTION_STATIONSPEED        = $0000002A;
(*TAPI*)  PHONEBUTTONFUNCTION_CAMPON              = $0000002B;
(*TAPI*)  PHONEBUTTONFUNCTION_SAVEREPEAT          = $0000002C;
(*TAPI*)  PHONEBUTTONFUNCTION_QUEUECALL           = $0000002D;
(*TAPI*)  PHONEBUTTONFUNCTION_NONE                = $0000002E;
(*TAPI*)
(*TAPI*)  PHONEBUTTONMODE_DUMMY                   = $00000001;
(*TAPI*)  PHONEBUTTONMODE_CALL                    = $00000002;
(*TAPI*)  PHONEBUTTONMODE_FEATURE                 = $00000004;
(*TAPI*)  PHONEBUTTONMODE_KEYPAD                  = $00000008;
(*TAPI*)  PHONEBUTTONMODE_LOCAL                   = $00000010;
(*TAPI*)  PHONEBUTTONMODE_DISPLAY                 = $00000020;
(*TAPI*)
(*TAPI*)  PHONEBUTTONSTATE_UP                     = $00000001;
(*TAPI*)  PHONEBUTTONSTATE_DOWN                   = $00000002;
(*TAPI*)  PHONEBUTTONSTATE_UNKNOWN                = $00000004;      { TAPI v1.4 }
(*TAPI*)  PHONEBUTTONSTATE_UNAVAIL                = $00000008;      { TAPI v1.4 }
(*TAPI*)
(*TAPI*)  PHONEERR_ALLOCATED                      = $90000001;
(*TAPI*)  PHONEERR_BADDEVICEID                    = $90000002;
(*TAPI*)  PHONEERR_INCOMPATIBLEAPIVERSION         = $90000003;
(*TAPI*)  PHONEERR_INCOMPATIBLEEXTVERSION         = $90000004;
(*TAPI*)  PHONEERR_INIFILECORRUPT                 = $90000005;
(*TAPI*)  PHONEERR_INUSE                          = $90000006;
(*TAPI*)  PHONEERR_INVALAPPHANDLE                 = $90000007;
(*TAPI*)  PHONEERR_INVALAPPNAME                   = $90000008;
(*TAPI*)  PHONEERR_INVALBUTTONLAMPID              = $90000009;
(*TAPI*)  PHONEERR_INVALBUTTONMODE                = $9000000A;
(*TAPI*)  PHONEERR_INVALBUTTONSTATE               = $9000000B;
(*TAPI*)  PHONEERR_INVALDATAID                    = $9000000C;
(*TAPI*)  PHONEERR_INVALDEVICECLASS               = $9000000D;
(*TAPI*)  PHONEERR_INVALEXTVERSION                = $9000000E;
(*TAPI*)  PHONEERR_INVALHOOKSWITCHDEV             = $9000000F;
(*TAPI*)  PHONEERR_INVALHOOKSWITCHMODE            = $90000010;
(*TAPI*)  PHONEERR_INVALLAMPMODE                  = $90000011;
(*TAPI*)  PHONEERR_INVALPARAM                     = $90000012;
(*TAPI*)  PHONEERR_INVALPHONEHANDLE               = $90000013;
(*TAPI*)  PHONEERR_INVALPHONESTATE                = $90000014;
(*TAPI*)  PHONEERR_INVALPOINTER                   = $90000015;
(*TAPI*)  PHONEERR_INVALPRIVILEGE                 = $90000016;
(*TAPI*)  PHONEERR_INVALRINGMODE                  = $90000017;
(*TAPI*)  PHONEERR_NODEVICE                       = $90000018;
(*TAPI*)  PHONEERR_NODRIVER                       = $90000019;
(*TAPI*)  PHONEERR_NOMEM                          = $9000001A;
(*TAPI*)  PHONEERR_NOTOWNER                       = $9000001B;
(*TAPI*)  PHONEERR_OPERATIONFAILED                = $9000001C;
(*TAPI*)  PHONEERR_OPERATIONUNAVAIL               = $9000001D;
(*TAPI*)  PHONEERR_RESOURCEUNAVAIL                = $9000001F;
(*TAPI*)  PHONEERR_REQUESTOVERRUN                 = $90000020;
(*TAPI*)  PHONEERR_STRUCTURETOOSMALL              = $90000021;
(*TAPI*)  PHONEERR_UNINITIALIZED                  = $90000022;
(*TAPI*)  PHONEERR_REINIT                         = $90000023;
(*TAPI*)
(*TAPI*)
(*TAPI*){$IFDEF TAPI20}
(*TAPI*)  PHONEFEATURE_GETBUTTONINFO              = $00000001;      { TAPI v2.0 }
(*TAPI*)  PHONEFEATURE_GETDATA                    = $00000002;      { TAPI v2.0 }
(*TAPI*)  PHONEFEATURE_GETDISPLAY                 = $00000004;      { TAPI v2.0 }
(*TAPI*)  PHONEFEATURE_GETGAINHANDSET             = $00000008;      { TAPI v2.0 }
(*TAPI*)  PHONEFEATURE_GETGAINSPEAKER             = $00000010;      { TAPI v2.0 }
(*TAPI*)  PHONEFEATURE_GETGAINHEADSET             = $00000020;      { TAPI v2.0 }
(*TAPI*)  PHONEFEATURE_GETHOOKSWITCHHANDSET       = $00000040;      { TAPI v2.0 }
(*TAPI*)  PHONEFEATURE_GETHOOKSWITCHSPEAKER       = $00000080;      { TAPI v2.0 }
(*TAPI*)  PHONEFEATURE_GETHOOKSWITCHHEADSET       = $00000100;      { TAPI v2.0 }
(*TAPI*)  PHONEFEATURE_GETLAMP                    = $00000200;      { TAPI v2.0 }
(*TAPI*)  PHONEFEATURE_GETRING                    = $00000400;      { TAPI v2.0 }
(*TAPI*)  PHONEFEATURE_GETVOLUMEHANDSET           = $00000800;      { TAPI v2.0 }
(*TAPI*)  PHONEFEATURE_GETVOLUMESPEAKER           = $00001000;      { TAPI v2.0 }
(*TAPI*)  PHONEFEATURE_GETVOLUMEHEADSET           = $00002000;      { TAPI v2.0 }
(*TAPI*)  PHONEFEATURE_SETBUTTONINFO              = $00004000;      { TAPI v2.0 }
(*TAPI*)  PHONEFEATURE_SETDATA                    = $00008000;      { TAPI v2.0 }
(*TAPI*)  PHONEFEATURE_SETDISPLAY                 = $00010000;      { TAPI v2.0 }
(*TAPI*)  PHONEFEATURE_SETGAINHANDSET             = $00020000;      { TAPI v2.0 }
(*TAPI*)  PHONEFEATURE_SETGAINSPEAKER             = $00040000;      { TAPI v2.0 }
(*TAPI*)  PHONEFEATURE_SETGAINHEADSET             = $00080000;      { TAPI v2.0 }
(*TAPI*)  PHONEFEATURE_SETHOOKSWITCHHANDSET       = $00100000;      { TAPI v2.0 }
(*TAPI*)  PHONEFEATURE_SETHOOKSWITCHSPEAKER       = $00200000;      { TAPI v2.0 }
(*TAPI*)  PHONEFEATURE_SETHOOKSWITCHHEADSET       = $00400000;      { TAPI v2.0 }
(*TAPI*)  PHONEFEATURE_SETLAMP                    = $00800000;      { TAPI v2.0 }
(*TAPI*)  PHONEFEATURE_SETRING                    = $01000000;      { TAPI v2.0 }
(*TAPI*)  PHONEFEATURE_SETVOLUMEHANDSET           = $02000000;      { TAPI v2.0 }
(*TAPI*)  PHONEFEATURE_SETVOLUMESPEAKER           = $04000000;      { TAPI v2.0 }
(*TAPI*)  PHONEFEATURE_SETVOLUMEHEADSET           = $08000000;      { TAPI v2.0 }
(*TAPI*){$ENDIF}
(*TAPI*)
(*TAPI*)  PHONEHOOKSWITCHDEV_HANDSET              = $00000001;
(*TAPI*)  PHONEHOOKSWITCHDEV_SPEAKER              = $00000002;
(*TAPI*)  PHONEHOOKSWITCHDEV_HEADSET              = $00000004;
(*TAPI*)
(*TAPI*)  PHONEHOOKSWITCHMODE_ONHOOK              = $00000001;
(*TAPI*)  PHONEHOOKSWITCHMODE_MIC                 = $00000002;
(*TAPI*)  PHONEHOOKSWITCHMODE_SPEAKER             = $00000004;
(*TAPI*)  PHONEHOOKSWITCHMODE_MICSPEAKER          = $00000008;
(*TAPI*)  PHONEHOOKSWITCHMODE_UNKNOWN             = $00000010;
(*TAPI*)
(*TAPI*){$IFDEF TAPI20}
(*TAPI*)  PHONEINITIALIZEEXOPTION_USEHIDDENWINDOW     = $00000001;  { TAPI v2.0 }
(*TAPI*)  PHONEINITIALIZEEXOPTION_USEEVENT            = $00000002;  { TAPI v2.0 }
(*TAPI*)  PHONEINITIALIZEEXOPTION_USECOMPLETIONPORT   = $00000003;  { TAPI v2.0 }
(*TAPI*){$ENDIF}
(*TAPI*)
(*TAPI*)  PHONELAMPMODE_DUMMY                     = $00000001;
(*TAPI*)  PHONELAMPMODE_OFF                       = $00000002;
(*TAPI*)  PHONELAMPMODE_STEADY                    = $00000004;
(*TAPI*)  PHONELAMPMODE_WINK                      = $00000008;
(*TAPI*)  PHONELAMPMODE_FLASH                     = $00000010;
(*TAPI*)  PHONELAMPMODE_FLUTTER                   = $00000020;
(*TAPI*)  PHONELAMPMODE_BROKENFLUTTER             = $00000040;
(*TAPI*)  PHONELAMPMODE_UNKNOWN                   = $00000080;
(*TAPI*)
(*TAPI*)  PHONEPRIVILEGE_MONITOR                  = $00000001;
(*TAPI*)  PHONEPRIVILEGE_OWNER                    = $00000002;
(*TAPI*)
(*TAPI*)  PHONESTATE_OTHER                        = $00000001;
(*TAPI*)  PHONESTATE_CONNECTED                    = $00000002;
(*TAPI*)  PHONESTATE_DISCONNECTED                 = $00000004;
(*TAPI*)  PHONESTATE_OWNER                        = $00000008;
(*TAPI*)  PHONESTATE_MONITORS                     = $00000010;
(*TAPI*)  PHONESTATE_DISPLAY                      = $00000020;
(*TAPI*)  PHONESTATE_LAMP                         = $00000040;
(*TAPI*)  PHONESTATE_RINGMODE                     = $00000080;
(*TAPI*)  PHONESTATE_RINGVOLUME                   = $00000100;
(*TAPI*)  PHONESTATE_HANDSETHOOKSWITCH            = $00000200;
(*TAPI*)  PHONESTATE_HANDSETVOLUME                = $00000400;
(*TAPI*)  PHONESTATE_HANDSETGAIN                  = $00000800;
(*TAPI*)  PHONESTATE_SPEAKERHOOKSWITCH            = $00001000;
(*TAPI*)  PHONESTATE_SPEAKERVOLUME                = $00002000;
(*TAPI*)  PHONESTATE_SPEAKERGAIN                  = $00004000;
(*TAPI*)  PHONESTATE_HEADSETHOOKSWITCH            = $00008000;
(*TAPI*)  PHONESTATE_HEADSETVOLUME                = $00010000;
(*TAPI*)  PHONESTATE_HEADSETGAIN                  = $00020000;
(*TAPI*)  PHONESTATE_SUSPEND                      = $00040000;
(*TAPI*)  PHONESTATE_RESUME                       = $00080000;
(*TAPI*)  PHONESTATE_DEVSPECIFIC                  = $00100000;
(*TAPI*)  PHONESTATE_REINIT                       = $00200000;
(*TAPI*)  PHONESTATE_CAPSCHANGE                   = $00400000;      { TAPI v1.4 }
(*TAPI*)  PHONESTATE_REMOVED                      = $00800000;      { TAPI v1.4 }
(*TAPI*)
(*TAPI*)  PHONESTATUSFLAGS_CONNECTED              = $00000001;
(*TAPI*)  PHONESTATUSFLAGS_SUSPENDED              = $00000002;
(*TAPI*)
(*TAPI*)  STRINGFORMAT_ASCII                      = $00000001;
(*TAPI*)  STRINGFORMAT_DBCS                       = $00000002;
(*TAPI*)  STRINGFORMAT_UNICODE                    = $00000003;
(*TAPI*)  STRINGFORMAT_BINARY                     = $00000004;
(*TAPI*)
(*TAPI*)  TAPI_REPLY                              = WM_USER + 99;
(*TAPI*)
(*TAPI*)  TAPIERR_CONNECTED                       = 0;
(*TAPI*)  TAPIERR_DROPPED                         = -1;
(*TAPI*)  TAPIERR_NOREQUESTRECIPIENT              = -2;
(*TAPI*)  TAPIERR_REQUESTQUEUEFULL                = -3;
(*TAPI*)  TAPIERR_INVALDESTADDRESS                = -4;
(*TAPI*)  TAPIERR_INVALWINDOWHANDLE               = -5;
(*TAPI*)  TAPIERR_INVALDEVICECLASS                = -6;
(*TAPI*)  TAPIERR_INVALDEVICEID                   = -7;
(*TAPI*)  TAPIERR_DEVICECLASSUNAVAIL              = -8;
(*TAPI*)  TAPIERR_DEVICEIDUNAVAIL                 = -9;
(*TAPI*)  TAPIERR_DEVICEINUSE                     = -10;
(*TAPI*)  TAPIERR_DESTBUSY                        = -11;
(*TAPI*)  TAPIERR_DESTNOANSWER                    = -12;
(*TAPI*)  TAPIERR_DESTUNAVAIL                     = -13;
(*TAPI*)  TAPIERR_UNKNOWNWINHANDLE                = -14;
(*TAPI*)  TAPIERR_UNKNOWNREQUESTID                = -15;
(*TAPI*)  TAPIERR_REQUESTFAILED                   = -16;
(*TAPI*)  TAPIERR_REQUESTCANCELLED                = -17;
(*TAPI*)  TAPIERR_INVALPOINTER                    = -18;
(*TAPI*)
(*TAPI*)
(*TAPI*)  TAPIMAXDESTADDRESSSIZE                  = 80;
(*TAPI*)  TAPIMAXAPPNAMESIZE                      = 40;
(*TAPI*)  TAPIMAXCALLEDPARTYSIZE                  = 40;
(*TAPI*)  TAPIMAXCOMMENTSIZE                      = 80;
(*TAPI*)  TAPIMAXDEVICECLASSSIZE                  = 40;
(*TAPI*)  TAPIMAXDEVICEIDSIZE                     = 40;
(*TAPI*)
(*TAPI*)
(*TAPI*)
(*TAPI*)type
(*TAPI*)  LPLineAddressCaps = ^TLineAddressCaps;
(*TAPI*)  TLineAddressCaps = record
(*TAPI*)    dwTotalSize,
(*TAPI*)    dwNeededSize,
(*TAPI*)    dwUsedSize,
(*TAPI*)    dwLineDeviceID,
(*TAPI*)    dwAddressSize,
(*TAPI*)    dwAddressOffset,
(*TAPI*)    dwDevSpecificSize,
(*TAPI*)    dwDevSpecificOffset,
(*TAPI*)    dwAddressSharing,
(*TAPI*)    dwAddressStates,
(*TAPI*)    dwCallInfoStates,
(*TAPI*)    dwCallerIDFlags,
(*TAPI*)    dwCalledIDFlags,
(*TAPI*)    dwConnectedIDFlags,
(*TAPI*)    dwRedirectionIDFlags,
(*TAPI*)    dwRedirectingIDFlags,
(*TAPI*)    dwCallStates,
(*TAPI*)    dwDialToneModes,
(*TAPI*)    dwBusyModes,
(*TAPI*)    dwSpecialInfo,
(*TAPI*)    dwDisconnectModes,
(*TAPI*)    dwMaxNumActiveCalls,
(*TAPI*)    dwMaxNumOnHoldCalls,
(*TAPI*)    dwMaxNumOnHoldPendingCalls,
(*TAPI*)    dwMaxNumConference,
(*TAPI*)    dwMaxNumTransConf,
(*TAPI*)    dwAddrCapFlags,
(*TAPI*)    dwCallFeatures,
(*TAPI*)    dwRemoveFromConfCaps,
(*TAPI*)    dwRemoveFromConfState,
(*TAPI*)    dwTransferModes,
(*TAPI*)    dwParkModes,
(*TAPI*)    dwForwardModes,
(*TAPI*)    dwMaxForwardEntries,
(*TAPI*)    dwMaxSpecificEntries,
(*TAPI*)    dwMinFwdNumRings,
(*TAPI*)    dwMaxFwdNumRings,
(*TAPI*)    dwMaxCallCompletions,
(*TAPI*)    dwCallCompletionConds,
(*TAPI*)    dwCallCompletionModes,
(*TAPI*)    dwNumCompletionMessages,
(*TAPI*)    dwCompletionMsgTextEntrySize,
(*TAPI*)    dwCompletionMsgTextSize,
(*TAPI*)    dwCompletionMsgTextOffset,
(*TAPI*)
(*TAPI*)    dwAddressFeatures: Longint;                     { TAPI v1.4 }
(*TAPI*)
(*TAPI*){$IFDEF TAPI20}
(*TAPI*)    dwPredictiveAutoTransferStates,                 { TAPI v2.0 }
(*TAPI*)    dwNumCallTreatments,                            { TAPI v2.0 }
(*TAPI*)    dwCallTreatmentListSize,                        { TAPI v2.0 }
(*TAPI*)    dwCallTreatmentListOffset,                      { TAPI v2.0 }
(*TAPI*)    dwDeviceClassesSize,                            { TAPI v2.0 }
(*TAPI*)    dwDeviceClassesOffset,                          { TAPI v2.0 }
(*TAPI*)    dwMaxCallDataSize,                              { TAPI v2.0 }
(*TAPI*)    dwCallFeatures2,                                { TAPI v2.0 }
(*TAPI*)    dwMaxNoAnswerTimeout,                           { TAPI v2.0 }
(*TAPI*)    dwConnectedModes,                               { TAPI v2.0 }
(*TAPI*)    dwOfferingModes,                                { TAPI v2.0 }
(*TAPI*)    dwAvailableMediaModes: Longint;                 { TAPI v2.0 }
(*TAPI*){$ENDIF}
(*TAPI*)  end;
(*TAPI*)
(*TAPI*)  LPLineAddressStatus = ^TLineAddressStatus;
(*TAPI*)  TLineAddressStatus = record
(*TAPI*)    dwTotalSize,
(*TAPI*)    dwNeededSize,
(*TAPI*)    dwUsedSize,
(*TAPI*)    dwNumInUse,
(*TAPI*)    dwNumActiveCalls,
(*TAPI*)    dwNumOnHoldCalls,
(*TAPI*)    dwNumOnHoldPendCalls,
(*TAPI*)    dwAddressFeatures,
(*TAPI*)    dwNumRingsNoAnswer,
(*TAPI*)    dwForwardNumEntries,
(*TAPI*)    dwForwardSize,
(*TAPI*)    dwForwardOffset,
(*TAPI*)    dwTerminalModesSize,
(*TAPI*)    dwTerminalModesOffset,
(*TAPI*)    dwDevSpecificSize,
(*TAPI*)    dwDevSpecificOffset: Longint;
(*TAPI*)  end;
(*TAPI*)
(*TAPI*){$IFDEF TAPI20}
(*TAPI*)  LPLineAgentActivityEntry = ^TLineAgentActivityEntry;
(*TAPI*)  TLineAgentActivityEntry = record
(*TAPI*)    dwID,                                           { TAPI v2.0 }
(*TAPI*)    dwNameSize,                                     { TAPI v2.0 }
(*TAPI*)    dwNameOffset: Longint;                          { TAPI v2.0 }
(*TAPI*)  end;
(*TAPI*)
(*TAPI*)  LPLineAgentActivityList = ^TLineAgentActivityList;
(*TAPI*)  TLineAgentActivityList = record
(*TAPI*)    dwTotalSize,                                    { TAPI v2.0 }
(*TAPI*)    dwNeededSize,                                   { TAPI v2.0 }
(*TAPI*)    dwUsedSize,                                     { TAPI v2.0 }
(*TAPI*)    dwNumEntries,                                   { TAPI v2.0 }
(*TAPI*)    dwListSize,                                     { TAPI v2.0 }
(*TAPI*)    dwListOffset: Longint;                          { TAPI v2.0 }
(*TAPI*)  end;
(*TAPI*)
(*TAPI*)  LPLineAgentCaps = ^TLineAgentCaps;
(*TAPI*)  TLineAgentCaps = record
(*TAPI*)    dwTotalSize,                                    { TAPI v2.0 }
(*TAPI*)    dwNeededSize,                                   { TAPI v2.0 }
(*TAPI*)    dwUsedSize,                                     { TAPI v2.0 }
(*TAPI*)    dwAgentHandlerInfoSize,                         { TAPI v2.0 }
(*TAPI*)    dwAgentHandlerInfoOffset,                       { TAPI v2.0 }
(*TAPI*)    dwCapsVersion,                                  { TAPI v2.0 }
(*TAPI*)    dwFeatures,                                     { TAPI v2.0 }
(*TAPI*)    dwStates,                                       { TAPI v2.0 }
(*TAPI*)    dwNextStates,                                   { TAPI v2.0 }
(*TAPI*)    dwMaxNumGroupEntries,                           { TAPI v2.0 }
(*TAPI*)    dwAgentStatusMessages,                          { TAPI v2.0 }
(*TAPI*)    dwNumAgentExtensionIDs,                         { TAPI v2.0 }
(*TAPI*)    dwAgentExtensionIDListSize,                     { TAPI v2.0 }
(*TAPI*)    dwAgentExtensionIDListOffset: Longint;          { TAPI v2.0 }
(*TAPI*)  end;
(*TAPI*)
(*TAPI*)  LPLineAgentGroupEntry = ^TLineAgentGroupEntry;
(*TAPI*)  TLineAgentGroupEntry = record
(*TAPI*)    GroupID: record
(*TAPI*)      dwGroupID1,                                   { TAPI v2.0 }
(*TAPI*)      dwGroupID2,                                   { TAPI v2.0 }
(*TAPI*)      dwGroupID3,                                   { TAPI v2.0 }
(*TAPI*)      dwGroupID4: Longint;                          { TAPI v2.0 }
(*TAPI*)    end;
(*TAPI*)    dwNameSize,                                     { TAPI v2.0 }
(*TAPI*)    dwNameOffset: Longint;                          { TAPI v2.0 }
(*TAPI*)  end;
(*TAPI*)
(*TAPI*)  LPLineAgentGroupList = ^TLineAgentGroupList;
(*TAPI*)  TLineAgentGroupList = record
(*TAPI*)    dwTotalSize,                                    { TAPI v2.0 }
(*TAPI*)    dwNeededSize,                                   { TAPI v2.0 }
(*TAPI*)    dwUsedSize,                                     { TAPI v2.0 }
(*TAPI*)    dwNumEntries,                                   { TAPI v2.0 }
(*TAPI*)    dwListSize,                                     { TAPI v2.0 }
(*TAPI*)    dwListOffset: Longint;                          { TAPI v2.0 }
(*TAPI*)  end;
(*TAPI*)
(*TAPI*)  LPLineAgentStatus = ^TLineAgentStatus;
(*TAPI*)  TLineAgentStatus = record
(*TAPI*)    dwTotalSize,                                    { TAPI v2.0 }
(*TAPI*)    dwNeededSize,                                   { TAPI v2.0 }
(*TAPI*)    dwUsedSize,                                     { TAPI v2.0 }
(*TAPI*)    dwNumEntries,                                   { TAPI v2.0 }
(*TAPI*)    dwGroupListSize,                                { TAPI v2.0 }
(*TAPI*)    dwGroupListOffset,                              { TAPI v2.0 }
(*TAPI*)    dwState,                                        { TAPI v2.0 }
(*TAPI*)    dwNextState,                                    { TAPI v2.0 }
(*TAPI*)    dwActivityID,                                   { TAPI v2.0 }
(*TAPI*)    dwActivitySize,                                 { TAPI v2.0 }
(*TAPI*)    dwActivityOffset,                               { TAPI v2.0 }
(*TAPI*)    dwAgentFeatures,                                { TAPI v2.0 }
(*TAPI*)    dwValidStates,                                  { TAPI v2.0 }
(*TAPI*)    dwValidNextStates: Longint;                     { TAPI v2.0 }
(*TAPI*)  end;
(*TAPI*)
(*TAPI*)  LPLineAppInfo = ^TLineAppInfo;
(*TAPI*)  TLineAppInfo = record
(*TAPI*)    dwMachineNameSize,                              { TAPI v2.0 }
(*TAPI*)    dwMachineNameOffset,                            { TAPI v2.0 }
(*TAPI*)    dwUserNameSize,                                 { TAPI v2.0 }
(*TAPI*)    dwUserNameOffset,                               { TAPI v2.0 }
(*TAPI*)    dwModuleFilenameSize,                           { TAPI v2.0 }
(*TAPI*)    dwModuleFilenameOffset,                         { TAPI v2.0 }
(*TAPI*)    dwFriendlyNameSize,                             { TAPI v2.0 }
(*TAPI*)    dwFriendlyNameOffset,                           { TAPI v2.0 }
(*TAPI*)    dwMediaModes,                                   { TAPI v2.0 }
(*TAPI*)    dwAddressID: Longint;                           { TAPI v2.0 }
(*TAPI*)  end;
(*TAPI*){$ENDIF}
(*TAPI*)
(*TAPI*)  LPLineDialParams = ^TLineDialParams;
(*TAPI*)  TLineDialParams = record
(*TAPI*)    dwDialPause,
(*TAPI*)    dwDialSpeed,
(*TAPI*)    dwDigitDuration,
(*TAPI*)    dwWaitForDialtone: Longint;
(*TAPI*)  end;
(*TAPI*)
(*TAPI*)  LPLineCallInfo = ^TLineCallInfo;
(*TAPI*)  TLineCallInfo = record
(*TAPI*)    dwTotalSize,
(*TAPI*)    dwNeededSize,
(*TAPI*)    dwUsedSize: Longint;
(*TAPI*)    hLine: THLine;
(*TAPI*)    dwLineDeviceID,
(*TAPI*)    dwAddressID,
(*TAPI*)    dwBearerMode,
(*TAPI*)    dwRate,
(*TAPI*)    dwMediaMode,
(*TAPI*)    dwAppSpecific,
(*TAPI*)    dwCallID,
(*TAPI*)    dwRelatedCallID,
(*TAPI*)    dwCallParamFlags,
(*TAPI*)    dwCallStates,
(*TAPI*)    dwMonitorDigitModes,
(*TAPI*)    dwMonitorMediaModes: Longint;
(*TAPI*)    DialParams: TLineDialParams;
(*TAPI*)    dwOrigin,
(*TAPI*)    dwReason,
(*TAPI*)    dwCompletionID,
(*TAPI*)    dwNumOwners,
(*TAPI*)    dwNumMonitors,
(*TAPI*)    dwCountryCode,
(*TAPI*)    dwTrunk,
(*TAPI*)    dwCallerIDFlags,
(*TAPI*)    dwCallerIDSize,
(*TAPI*)    dwCallerIDOffset,
(*TAPI*)    dwCallerIDNameSize,
(*TAPI*)    dwCallerIDNameOffset,
(*TAPI*)    dwCalledIDFlags,
(*TAPI*)    dwCalledIDSize,
(*TAPI*)    dwCalledIDOffset,
(*TAPI*)    dwCalledIDNameSize,
(*TAPI*)    dwCalledIDNameOffset,
(*TAPI*)    dwConnectedIDFlags,
(*TAPI*)    dwConnectedIDSize,
(*TAPI*)    dwConnectedIDOffset,
(*TAPI*)    dwConnectedIDNameSize,
(*TAPI*)    dwConnectedIDNameOffset,
(*TAPI*)    dwRedirectionIDFlags,
(*TAPI*)    dwRedirectionIDSize,
(*TAPI*)    dwRedirectionIDOffset,
(*TAPI*)    dwRedirectionIDNameSize,
(*TAPI*)    dwRedirectionIDNameOffset,
(*TAPI*)    dwRedirectingIDFlags,
(*TAPI*)    dwRedirectingIDSize,
(*TAPI*)    dwRedirectingIDOffset,
(*TAPI*)    dwRedirectingIDNameSize,
(*TAPI*)    dwRedirectingIDNameOffset,
(*TAPI*)    dwAppNameSize,
(*TAPI*)    dwAppNameOffset,
(*TAPI*)    dwDisplayableAddressSize,
(*TAPI*)    dwDisplayableAddressOffset,
(*TAPI*)    dwCalledPartySize,
(*TAPI*)    dwCalledPartyOffset,
(*TAPI*)    dwCommentSize,
(*TAPI*)    dwCommentOffset,
(*TAPI*)    dwDisplaySize,
(*TAPI*)    dwDisplayOffset,
(*TAPI*)    dwUserUserInfoSize,
(*TAPI*)    dwUserUserInfoOffset,
(*TAPI*)    dwHighLevelCompSize,
(*TAPI*)    dwHighLevelCompOffset,
(*TAPI*)    dwLowLevelCompSize,
(*TAPI*)    dwLowLevelCompOffset,
(*TAPI*)    dwChargingInfoSize,
(*TAPI*)    dwChargingInfoOffset,
(*TAPI*)    dwTerminalModesSize,
(*TAPI*)    dwTerminalModesOffset,
(*TAPI*)    dwDevSpecificSize,
(*TAPI*)    dwDevSpecificOffset: Longint;
(*TAPI*)
(*TAPI*){$IFDEF TAPI20}
(*TAPI*)    dwCallTreatment,                                { TAPI v2.0 }
(*TAPI*)    dwCallDataSize,                                 { TAPI v2.0 }
(*TAPI*)    dwCallDataOffset,                               { TAPI v2.0 }
(*TAPI*)    dwSendingFlowspecSize,                          { TAPI v2.0 }
(*TAPI*)    dwSendingFlowspecOffset,                        { TAPI v2.0 }
(*TAPI*)    dwReceivingFlowspecSize,                        { TAPI v2.0 }
(*TAPI*)    dwReceivingFlowspecOffset: Longint;             { TAPI v2.0 }
(*TAPI*){$ENDIF}
(*TAPI*)  end;
(*TAPI*)
(*TAPI*)  LPLineCallList = ^TLineCallList;
(*TAPI*)  TLineCallList = record
(*TAPI*)    dwTotalSize,
(*TAPI*)    dwNeededSize,
(*TAPI*)    dwUsedSize,
(*TAPI*)    dwCallsNumEntries,
(*TAPI*)    dwCallsSize,
(*TAPI*)    dwCallsOffset: Longint;
(*TAPI*)  end;
(*TAPI*)
(*TAPI*)  LPLineCallParams = ^TLineCallParams;
(*TAPI*)  TLineCallParams = record            { Defaults:        }
(*TAPI*)    dwTotalSize,                    { ---------        }
(*TAPI*)    dwBearerMode,                   { voice            }
(*TAPI*)    dwMinRate,                      { (3.1kHz)         }
(*TAPI*)    dwMaxRate,                      { (3.1kHz)         }
(*TAPI*)    dwMediaMode,                    { interactiveVoice }
(*TAPI*)    dwCallParamFlags,               { 0                }
(*TAPI*)    dwAddressMode,                  { addressID        }
(*TAPI*)    dwAddressID: Longint;           { (any available)  }
(*TAPI*)    DialParams: TLineDialParams;    { (0, 0, 0, 0)     }
(*TAPI*)    dwOrigAddressSize,              { 0                }
(*TAPI*)    dwOrigAddressOffset,
(*TAPI*)    dwDisplayableAddressSize,
(*TAPI*)    dwDisplayableAddressOffset,
(*TAPI*)    dwCalledPartySize,              { 0                }
(*TAPI*)    dwCalledPartyOffset,
(*TAPI*)    dwCommentSize,                  { 0                }
(*TAPI*)    dwCommentOffset,
(*TAPI*)    dwUserUserInfoSize,             { 0                }
(*TAPI*)    dwUserUserInfoOffset,
(*TAPI*)    dwHighLevelCompSize,            { 0                }
(*TAPI*)    dwHighLevelCompOffset,
(*TAPI*)    dwLowLevelCompSize,             { 0                }
(*TAPI*)    dwLowLevelCompOffset,
(*TAPI*)    dwDevSpecificSize,              { 0                }
(*TAPI*)    dwDevSpecificOffset: Longint;
(*TAPI*)
(*TAPI*){$IFDEF TAPI20}
(*TAPI*)    dwPredictiveAutoTransferStates,                 { TAPI v2.0 }
(*TAPI*)    dwTargetAddressSize,                            { TAPI v2.0 }
(*TAPI*)    dwTargetAddressOffset,                          { TAPI v2.0 }
(*TAPI*)    dwSendingFlowspecSize,                          { TAPI v2.0 }
(*TAPI*)    dwSendingFlowspecOffset,                        { TAPI v2.0 }
(*TAPI*)    dwReceivingFlowspecSize,                        { TAPI v2.0 }
(*TAPI*)    dwReceivingFlowspecOffset,                      { TAPI v2.0 }
(*TAPI*)    dwDeviceClassSize,                              { TAPI v2.0 }
(*TAPI*)    dwDeviceClassOffset,                            { TAPI v2.0 }
(*TAPI*)    dwDeviceConfigSize,                             { TAPI v2.0 }
(*TAPI*)    dwDeviceConfigOffset,                           { TAPI v2.0 }
(*TAPI*)    dwCallDataSize,                                 { TAPI v2.0 }
(*TAPI*)    dwCallDataOffset,                               { TAPI v2.0 }
(*TAPI*)    dwNoAnswerTimeout,                              { TAPI v2.0 }
(*TAPI*)    dwCallingPartyIDSize,                           { TAPI v2.0 }
(*TAPI*)    dwCallingPartyIDOffset: Longint;                { TAPI v2.0 }
(*TAPI*){$ENDIF}
(*TAPI*)  end;
(*TAPI*)
(*TAPI*)  LPLineCallStatus = ^TLineCallStatus;
(*TAPI*)  TLineCallStatus = record
(*TAPI*)    dwTotalSize,
(*TAPI*)    dwNeededSize,
(*TAPI*)    dwUsedSize,
(*TAPI*)    dwCallState,
(*TAPI*)    dwCallStateMode,
(*TAPI*)    dwCallPrivilege,
(*TAPI*)    dwCallFeatures,
(*TAPI*)    dwDevSpecificSize,
(*TAPI*)    dwDevSpecificOffset: Longint;
(*TAPI*)
(*TAPI*){$IFDEF TAPI20}
(*TAPI*)    dwCallFeatures2: Longint;                       { TAPI v2.0 }
(*TAPI*)  {$IFDEF WIN32}
(*TAPI*)    tStateEntryTime: TSystemTime;                   { TAPI v2.0 }
(*TAPI*)  {$ELSE}
(*TAPI*)    tStateEntryTime: array[0..7] of Word;           { TAPI v2.0 }
(*TAPI*)  {$ENDIF}
(*TAPI*){$ENDIF}
(*TAPI*)  end;
(*TAPI*)
(*TAPI*)
(*TAPI*){$IFDEF TAPI20}
(*TAPI*)  LPLineCallTreatmentEntry = ^TLineCallTreatmentEntry;
(*TAPI*)  TLineCallTreatmentEntry = record
(*TAPI*)    dwCallTreatmentID,                              { TAPI v2.0 }
(*TAPI*)    dwCallTreatmentNameSize,                        { TAPI v2.0 }
(*TAPI*)    dwCallTreatmentNameOffset: Longint;             { TAPI v2.0 }
(*TAPI*)  end;
(*TAPI*){$ENDIF}
(*TAPI*)
(*TAPI*)
(*TAPI*)  LPLineCardEntry = ^TLineCardEntry;
(*TAPI*)  TLineCardEntry = record
(*TAPI*)    dwPermanentCardID,
(*TAPI*)    dwCardNameSize,
(*TAPI*)    dwCardNameOffset,
(*TAPI*)    dwCardNumberDigits,                             { TAPI v1.4 }
(*TAPI*)    dwSameAreaRuleSize,                             { TAPI v1.4 }
(*TAPI*)    dwSameAreaRuleOffset,                           { TAPI v1.4 }
(*TAPI*)    dwLongDistanceRuleSize,                         { TAPI v1.4 }
(*TAPI*)    dwLongDistanceRuleOffset,                       { TAPI v1.4 }
(*TAPI*)    dwInternationalRuleSize,                        { TAPI v1.4 }
(*TAPI*)    dwInternationalRuleOffset,                      { TAPI v1.4 }
(*TAPI*)    dwOptions: Longint;                             { TAPI v1.4 }
(*TAPI*)  end;
(*TAPI*)
(*TAPI*)  LPLineCountryEntry = ^TLineCountryEntry;
(*TAPI*)  TLineCountryEntry = record
(*TAPI*)    dwCountryID,                                    { TAPI v1.4 }
(*TAPI*)    dwCountryCode,                                  { TAPI v1.4 }
(*TAPI*)    dwNextCountryID,                                { TAPI v1.4 }
(*TAPI*)    dwCountryNameSize,                              { TAPI v1.4 }
(*TAPI*)    dwCountryNameOffset,                            { TAPI v1.4 }
(*TAPI*)    dwSameAreaRuleSize,                             { TAPI v1.4 }
(*TAPI*)    dwSameAreaRuleOffset,                           { TAPI v1.4 }
(*TAPI*)    dwLongDistanceRuleSize,                         { TAPI v1.4 }
(*TAPI*)    dwLongDistanceRuleOffset,                       { TAPI v1.4 }
(*TAPI*)    dwInternationalRuleSize,                        { TAPI v1.4 }
(*TAPI*)    dwInternationalRuleOffset: Longint;             { TAPI v1.4 }
(*TAPI*)  end;
(*TAPI*)
(*TAPI*)  LPLineCountryList = ^TLineCountryList;
(*TAPI*)  TLineCountryList = record
(*TAPI*)    dwTotalSize,                                    { TAPI v1.4 }
(*TAPI*)    dwNeededSize,                                   { TAPI v1.4 }
(*TAPI*)    dwUsedSize,                                     { TAPI v1.4 }
(*TAPI*)    dwNumCountries,                                 { TAPI v1.4 }
(*TAPI*)    dwCountryListSize,                              { TAPI v1.4 }
(*TAPI*)    dwCountryListOffset: Longint;                   { TAPI v1.4 }
(*TAPI*)  end;
(*TAPI*)
(*TAPI*)  LPLineDevCaps = ^TLineDevCaps;
(*TAPI*)  TLineDevCaps = record
(*TAPI*)    dwTotalSize,
(*TAPI*)    dwNeededSize,
(*TAPI*)    dwUsedSize,
(*TAPI*)    dwProviderInfoSize,
(*TAPI*)    dwProviderInfoOffset,
(*TAPI*)    dwSwitchInfoSize,
(*TAPI*)    dwSwitchInfoOffset,
(*TAPI*)    dwPermanenTLineID,
(*TAPI*)    dwLineNameSize,
(*TAPI*)    dwLineNameOffset,
(*TAPI*)    dwStringFormat,
(*TAPI*)    dwAddressModes,
(*TAPI*)    dwNumAddresses,
(*TAPI*)    dwBearerModes,
(*TAPI*)    dwMaxRate,
(*TAPI*)    dwMediaModes,
(*TAPI*)    dwGenerateToneModes,
(*TAPI*)    dwGenerateToneMaxNumFreq,
(*TAPI*)    dwGenerateDigitModes,
(*TAPI*)    dwMonitorToneMaxNumFreq,
(*TAPI*)    dwMonitorToneMaxNumEntries,
(*TAPI*)    dwMonitorDigitModes,
(*TAPI*)    dwGatherDigitsMinTimeout,
(*TAPI*)    dwGatherDigitsMaxTimeout,
(*TAPI*)    dwMedCtlDigitMaxListSize,
(*TAPI*)    dwMedCtlMediaMaxListSize,
(*TAPI*)    dwMedCtlToneMaxListSize,
(*TAPI*)    dwMedCtlCallStateMaxListSize,
(*TAPI*)    dwDevCapFlags,
(*TAPI*)    dwMaxNumActiveCalls,
(*TAPI*)    dwAnswerMode,
(*TAPI*)    dwRingModes,
(*TAPI*)    dwLineStates,
(*TAPI*)    dwUUIAcceptSize,
(*TAPI*)    dwUUIAnswerSize,
(*TAPI*)    dwUUIMakeCallSize,
(*TAPI*)    dwUUIDropSize,
(*TAPI*)    dwUUISendUserUserInfoSize,
(*TAPI*)    dwUUICallInfoSize: Longint;
(*TAPI*)    MinDialParams,
(*TAPI*)    MaxDialParams,
(*TAPI*)    DefaultDialParams: TLineDialParams;
(*TAPI*)    dwNumTerminals,
(*TAPI*)    dwTerminalCapsSize,
(*TAPI*)    dwTerminalCapsOffset,
(*TAPI*)    dwTerminalTextEntrySize,
(*TAPI*)    dwTerminalTextSize,
(*TAPI*)    dwTerminalTextOffset,
(*TAPI*)    dwDevSpecificSize,
(*TAPI*)    dwDevSpecificOffset,
(*TAPI*)
(*TAPI*)    dwLineFeatures: Longint;                        { TAPI v1.4 }
(*TAPI*)
(*TAPI*){$IFDEF TAPI20}
(*TAPI*)    dwSettableDevStatus,                            { TAPI v2.0 }
(*TAPI*)    dwDeviceClassesSize,                            { TAPI v2.0 }
(*TAPI*)    dwDeviceClassesOffset: Longint;                 { TAPI v2.0 }
(*TAPI*){$ENDIF}
(*TAPI*)  end;
(*TAPI*)
(*TAPI*)  LPLineDevStatus = ^TLineDevStatus;
(*TAPI*)  TLineDevStatus = record
(*TAPI*)    dwTotalSize,
(*TAPI*)    dwNeededSize,
(*TAPI*)    dwUsedSize,
(*TAPI*)    dwNumOpens,
(*TAPI*)    dwOpenMediaModes,
(*TAPI*)    dwNumActiveCalls,
(*TAPI*)    dwNumOnHoldCalls,
(*TAPI*)    dwNumOnHoldPendCalls,
(*TAPI*)    dwLineFeatures,
(*TAPI*)    dwNumCallCompletions,
(*TAPI*)    dwRingMode,
(*TAPI*)    dwSignalLevel,
(*TAPI*)    dwBatteryLevel,
(*TAPI*)    dwRoamMode,
(*TAPI*)    dwDevStatusFlags,
(*TAPI*)    dwTerminalModesSize,
(*TAPI*)    dwTerminalModesOffset,
(*TAPI*)    dwDevSpecificSize,
(*TAPI*)    dwDevSpecificOffset: Longint;
(*TAPI*)
(*TAPI*){$IFDEF TAPI20}
(*TAPI*)    dwAvailableMediaModes,                          { TAPI v2.0 }
(*TAPI*)    dwAppInfoSize,                                  { TAPI v2.0 }
(*TAPI*)    dwAppInfoOffset: Longint;                       { TAPI v2.0 }
(*TAPI*){$ENDIF}
(*TAPI*)  end;
(*TAPI*)
(*TAPI*)  LPLineExtensionID = ^TLineExtensionID;
(*TAPI*)  TLineExtensionID = record
(*TAPI*)    dwExtensionID0,
(*TAPI*)    dwExtensionID1,
(*TAPI*)    dwExtensionID2,
(*TAPI*)    dwExtensionID3: Longint;
(*TAPI*)  end;
(*TAPI*)
(*TAPI*)  LPLineForward = ^TLineForward;
(*TAPI*)  TLineForward = record
(*TAPI*)    dwForwardMode,
(*TAPI*)    dwCallerAddressSize,
(*TAPI*)    dwCallerAddressOffset,
(*TAPI*)    dwDestCountryCode,
(*TAPI*)    dwDestAddressSize,
(*TAPI*)    dwDestAddressOffset: Longint;
(*TAPI*)  end;
(*TAPI*)
(*TAPI*)  LPLineForwardList = ^TLineForwardList;
(*TAPI*)  TLineForwardList = record
(*TAPI*)    dwTotalSize,
(*TAPI*)    dwNumEntries: Longint;
(*TAPI*)  end;
(*TAPI*)
(*TAPI*)  LPLineGenerateTone = ^TLineGenerateTone;
(*TAPI*)  PLINEGENERATETONE = ^TLineGENERATETONE;
(*TAPI*)  TLineGenerateTone = record
(*TAPI*)    dwFrequency,
(*TAPI*)    dwCadenceOn,
(*TAPI*)    dwCadenceOff,
(*TAPI*)    dwVolume: Longint;
(*TAPI*)  end;
(*TAPI*)
(*TAPI*){$IFDEF TAPI20}
(*TAPI*)  THandleUnion = record
(*TAPI*)    case Integer of
(*TAPI*)      0: (hEvent: THandle);
(*TAPI*)      1: (hCompletionPort: THandle);
(*TAPI*)  end;
(*TAPI*)
(*TAPI*)  LPLineInitializeExParams = ^TLineInitializeExParams;
(*TAPI*)  TLineInitializeExParams = record
(*TAPI*)    dwTotalSize,                                    { TAPI v2.0 }
(*TAPI*)    dwNeededSize,                                   { TAPI v2.0 }
(*TAPI*)    dwUsedSize,                                     { TAPI v2.0 }
(*TAPI*)    dwOptions: Longint;                             { TAPI v2.0 }
(*TAPI*)
(*TAPI*)    Handles: THandleUnion;
(*TAPI*)
(*TAPI*)    dwCompletionKey: Longint;                       { TAPI v2.0 }
(*TAPI*)  end;
(*TAPI*){$ENDIF}
(*TAPI*)
(*TAPI*)  LPLineLocationEntry = ^TLineLocationEntry;
(*TAPI*)  TLineLocationEntry = record
(*TAPI*)    dwPermanentLocationID,
(*TAPI*)    dwLocationNameSize,
(*TAPI*)    dwLocationNameOffset,
(*TAPI*)    dwCountryCode,
(*TAPI*)    dwCityCodeSize,
(*TAPI*)    dwCityCodeOffset,
(*TAPI*)    dwPreferredCardID,
(*TAPI*)
(*TAPI*)    dwLocalAccessCodeSize,                          { TAPI v1.4 }
(*TAPI*)    dwLocalAccessCodeOffset,                        { TAPI v1.4 }
(*TAPI*)    dwLongDistanceAccessCodeSize,                   { TAPI v1.4 }
(*TAPI*)    dwLongDistanceAccessCodeOffset,                 { TAPI v1.4 }
(*TAPI*)    dwTollPrefixListSize,                           { TAPI v1.4 }
(*TAPI*)    dwTollPrefixListOffset,                         { TAPI v1.4 }
(*TAPI*)    dwCountryID,                                    { TAPI v1.4 }
(*TAPI*)    dwOptions,                                      { TAPI v1.4 }
(*TAPI*)    dwCancelCallWaitingSize,                        { TAPI v1.4 }
(*TAPI*)    dwCancelCallWaitingOffset: Longint;             { TAPI v1.4 }
(*TAPI*)  end;
(*TAPI*)
(*TAPI*)  LPLineMediaControlCallState = ^TLineMediaControlCallState;
(*TAPI*)  TLineMediaControlCallState = record
(*TAPI*)    dwCallStates,
(*TAPI*)    dwMediaControl: Longint;
(*TAPI*)  end;
(*TAPI*)
(*TAPI*)  LPLineMediaControlDigit = ^TLineMediaControlDigit;
(*TAPI*)  TLineMediaControlDigit = record
(*TAPI*)    dwDigit,
(*TAPI*)    dwDigitModes,
(*TAPI*)    dwMediaControl: Longint;
(*TAPI*)  end;
(*TAPI*)
(*TAPI*)  LPLineMediaControlMedia = ^TLineMediaControlMedia;
(*TAPI*)  TLineMediaControlMedia = record
(*TAPI*)    dwMediaModes,
(*TAPI*)    dwDuration,
(*TAPI*)    dwMediaControl: Longint;
(*TAPI*)  end;
(*TAPI*)
(*TAPI*)  LPLineMediaControlTone = ^TLineMediaControlTone;
(*TAPI*)  TLineMediaControlTone = record
(*TAPI*)    dwAppSpecific,
(*TAPI*)    dwDuration,
(*TAPI*)    dwFrequency1,
(*TAPI*)    dwFrequency2,
(*TAPI*)    dwFrequency3,
(*TAPI*)    dwMediaControl: Longint;
(*TAPI*)  end;
(*TAPI*)
(*TAPI*){$IFDEF TAPI20}
(*TAPI*)  LPLineMessage = ^TLineMessage;
(*TAPI*)  TLineMessage = record
(*TAPI*)    hDevice,                                        { TAPI v2.0 }
(*TAPI*)    dwMessageID,                                    { TAPI v2.0 }
(*TAPI*)    dwCallbackInstance,                             { TAPI v2.0 }
(*TAPI*)    dwParam1,                                       { TAPI v2.0 }
(*TAPI*)    dwParam2,                                       { TAPI v2.0 }
(*TAPI*)    dwParam3: Longint;                              { TAPI v2.0 }
(*TAPI*)  end;
(*TAPI*){$ENDIF}
(*TAPI*)
(*TAPI*)  LPLineMonitorTone = ^TLineMonitorTone;
(*TAPI*)  TLineMonitorTone = record
(*TAPI*)    dwAppSpecific,
(*TAPI*)    dwDuration,
(*TAPI*)    dwFrequency1,
(*TAPI*)    dwFrequency2,
(*TAPI*)    dwFrequency3: Longint;
(*TAPI*)  end;
(*TAPI*)
(*TAPI*)  LPLineProviderEntry = ^TLineProviderEntry;
(*TAPI*)  TLineProviderEntry = record
(*TAPI*)    dwPermanentProviderID,                          { TAPI v1.4 }
(*TAPI*)    dwProviderFilenameSize,                         { TAPI v1.4 }
(*TAPI*)    dwProviderFilenameOffset: Longint;              { TAPI v1.4 }
(*TAPI*)  end;
(*TAPI*)
(*TAPI*)  LPLineProviderList = ^TLineProviderList;
(*TAPI*)  TLineProviderList = record
(*TAPI*)    dwTotalSize,                                    { TAPI v1.4 }
(*TAPI*)    dwNeededSize,                                   { TAPI v1.4 }
(*TAPI*)    dwUsedSize,                                     { TAPI v1.4 }
(*TAPI*)    dwNumProviders,                                 { TAPI v1.4 }
(*TAPI*)    dwProviderListSize,                             { TAPI v1.4 }
(*TAPI*)    dwProviderListOffset: Longint;                  { TAPI v1.4 }
(*TAPI*)  end;
(*TAPI*)
(*TAPI*){$IFDEF TAPI20}
(*TAPI*)  LPLineProxyRequest = ^TLineProxyRequest;
(*TAPI*)  TLineProxyRequest = record
(*TAPI*)    dwSize,                                         { TAPI v2.0 }
(*TAPI*)    dwClientMachineNameSize,                        { TAPI v2.0 }
(*TAPI*)    dwClientMachineNameOffset,                      { TAPI v2.0 }
(*TAPI*)    dwClientUserNameSize,                           { TAPI v2.0 }
(*TAPI*)    dwClientUserNameOffset,                         { TAPI v2.0 }
(*TAPI*)    dwClientAppAPIVersion,                          { TAPI v2.0 }
(*TAPI*)    dwRequestType: Longint;                         { TAPI v2.0 }
(*TAPI*)
(*TAPI*)    case Integer of
(*TAPI*)      0: (
(*TAPI*)        SetAgentGroup: record
(*TAPI*)          dwAddressID: Longint;                     { TAPI v2.0 }
(*TAPI*)          GroupList: TLineAgentGroupList;           { TAPI v2.0 }
(*TAPI*)        end;
(*TAPI*)        );
(*TAPI*)      1: (
(*TAPI*)        SetAgentState: record
(*TAPI*)          dwAddressID,                              { TAPI v2.0 }
(*TAPI*)          dwAgentState,                             { TAPI v2.0 }
(*TAPI*)          dwNextAgentState: Longint;                { TAPI v2.0 }
(*TAPI*)        end;
(*TAPI*)        );
(*TAPI*)      2: (
(*TAPI*)        SetAgentActivity: record
(*TAPI*)          dwAddressID: Longint;                     { TAPI v2.0 }
(*TAPI*)          dwActivityID: Longint;                    { TAPI v2.0 }
(*TAPI*)        end;
(*TAPI*)        );
(*TAPI*)      3: (
(*TAPI*)        GetAgentCaps: record
(*TAPI*)          dwAddressID: Longint;                     { TAPI v2.0 }
(*TAPI*)          AgentCaps: TLineAgentCaps;                { TAPI v2.0 }
(*TAPI*)        end;
(*TAPI*)        );
(*TAPI*)      4: (
(*TAPI*)        GetAgentStatus: record
(*TAPI*)          dwAddressID: Longint;                     { TAPI v2.0 }
(*TAPI*)          AgentStatus: TLineAgentStatus;            { TAPI v2.0 }
(*TAPI*)        end;
(*TAPI*)        );
(*TAPI*)      5: (
(*TAPI*)        AgentSpecific: record
(*TAPI*)          dwAddressID,                              { TAPI v2.0 }
(*TAPI*)          dwAgentExtensionIDIndex,                  { TAPI v2.0 }
(*TAPI*)          dwSize: Longint;                          { TAPI v2.0 }
(*TAPI*)          Params: array[0..0] of Byte;              { TAPI v2.0 }
(*TAPI*)        end;
(*TAPI*)        );
(*TAPI*)      6: (
(*TAPI*)        GetAgentActivityList: record
(*TAPI*)          dwAddressID: Longint;                     { TAPI v2.0 }
(*TAPI*)          ActivityList: TLineAgentActivityList;     { TAPI v2.0 }
(*TAPI*)        end;
(*TAPI*)        );
(*TAPI*)      7: (
(*TAPI*)        GetAgentGroupList: record
(*TAPI*)          dwAddressID: Longint;                     { TAPI v2.0 }
(*TAPI*)          GroupList: TLineAgentGroupList;          { TAPI v2.0 }
(*TAPI*)        end;
(*TAPI*)        );
(*TAPI*)  end;
(*TAPI*){$ENDIF}
(*TAPI*)
(*TAPI*)
(*TAPI*)  LPLineReqMakeCall = ^TLineReqMakeCall;
(*TAPI*)  TLineReqMakeCall = record
(*TAPI*)    szDestAddress: array[0..TAPIMAXDESTADDRESSSIZE - 1] of Char;
(*TAPI*)    szAppName: array[0..TAPIMAXAPPNAMESIZE - 1] of Char;
(*TAPI*)    szCalledParty: array[0..TAPIMAXCALLEDPARTYSIZE - 1] of Char;
(*TAPI*)    szComment: array[0..TAPIMAXCOMMENTSIZE - 1] of Char;
(*TAPI*)  end;
(*TAPI*)
(*TAPI*){$IFDEF TAPI20}
(*TAPI*)  LPLineReqMakeCallW = ^TLineReqMakeCallW;
(*TAPI*)  TLineReqMakeCallW = record
(*TAPI*)    szDestAddress: array[0..TAPIMAXDESTADDRESSSIZE - 1] of WideChar;
(*TAPI*)    szAppName: array[0..TAPIMAXAPPNAMESIZE - 1] of WideChar;
(*TAPI*)    szCalledParty: array[0..TAPIMAXCALLEDPARTYSIZE - 1] of WideChar;
(*TAPI*)    szComment: array[0..TAPIMAXCOMMENTSIZE - 1] of WideChar;
(*TAPI*)  end;
(*TAPI*){$ENDIF}
(*TAPI*)
(*TAPI*)
(*TAPI*)  LPLineReqMediaCall = ^TLineReqMediaCall;
(*TAPI*)  TLineReqMediaCall = record
(*TAPI*)    HWnd: HWnd;
(*TAPI*)		wRequestID: WPARAM;
(*TAPI*)    szDeviceClass: array[0..TAPIMAXDEVICECLASSSIZE - 1] of Char;
(*TAPI*)    ucDeviceID: array[0..TAPIMAXDEVICEIDSIZE - 1] of Byte;
(*TAPI*)    dwSize,
(*TAPI*)    dwSecure: Longint;
(*TAPI*)    szDestAddress: array[0..TAPIMAXDESTADDRESSSIZE] of Char;
(*TAPI*)    szAppName: array[0..TAPIMAXAPPNAMESIZE] of Char;
(*TAPI*)    szCalledParty: array[0..TAPIMAXCALLEDPARTYSIZE] of Char;
(*TAPI*)    szComment: array[0..TAPIMAXCOMMENTSIZE] of Char;
(*TAPI*)  end;
(*TAPI*)
(*TAPI*){$IFDEF TAPI20}
(*TAPI*)  LPLineReqMediaCallW = ^TLineReqMediaCallW;
(*TAPI*)  TLineReqMediaCallW = record
(*TAPI*)    HWnd: HWnd;
(*TAPI*)    wRequestID: WPARAM;
(*TAPI*)    szDeviceClass: array[0..TAPIMAXDEVICECLASSSIZE - 1] of WideChar;
(*TAPI*)    ucDeviceID: array[0..TAPIMAXDEVICEIDSIZE - 1] of Byte;
(*TAPI*)    dwSize,
(*TAPI*)    dwSecure: Longint;
(*TAPI*)    szDestAddress: array[0..TAPIMAXDESTADDRESSSIZE] of WideChar;
(*TAPI*)    szAppName: array[0..TAPIMAXAPPNAMESIZE] of WideChar;
(*TAPI*)    szCalledParty: array[0..TAPIMAXCALLEDPARTYSIZE] of WideChar;
(*TAPI*)    szComment: array[0..TAPIMAXCOMMENTSIZE] of WideChar;
(*TAPI*)  end;
(*TAPI*){$ENDIF}
(*TAPI*)
(*TAPI*)
(*TAPI*)  LPLineTermCaps = ^TLineTermCaps;
(*TAPI*)  TLineTermCaps = record
(*TAPI*)    dwTermDev,
(*TAPI*)    dwTermModes,
(*TAPI*)    dwTermSharing: Longint;
(*TAPI*)  end;
(*TAPI*)
(*TAPI*)  LPLineTranslateCaps = ^TLineTranslateCaps;
(*TAPI*)  TLineTranslateCaps = record
(*TAPI*)    dwTotalSize,
(*TAPI*)    dwNeededSize,
(*TAPI*)    dwUsedSize,
(*TAPI*)    dwNumLocations,
(*TAPI*)    dwLocationListSize,
(*TAPI*)    dwLocationListOffset,
(*TAPI*)    dwCurrentLocationID,
(*TAPI*)    dwNumCards,
(*TAPI*)    dwCardListSize,
(*TAPI*)    dwCardListOffset,
(*TAPI*)    dwCurrentPreferredCardID: Longint;
(*TAPI*)  end;
(*TAPI*)
(*TAPI*)  LPLineTranslateOutput = ^TLineTranslateOutput;
(*TAPI*)  TLineTranslateOutput = record
(*TAPI*)    dwTotalSize,
(*TAPI*)    dwNeededSize,
(*TAPI*)    dwUsedSize,
(*TAPI*)    dwDialableStringSize,
(*TAPI*)    dwDialableStringOffset,
(*TAPI*)    dwDisplayableStringSize,
(*TAPI*)    dwDisplayableStringOffset,
(*TAPI*)    dwCurrentCountry,
(*TAPI*)    dwDestCountry,
(*TAPI*)    dwTranslateResults: Longint;
(*TAPI*)  end;
(*TAPI*)
(*TAPI*)  LPPhoneButtonInfo = ^TPhoneButtonInfo;
(*TAPI*)  TPhoneButtonInfo = record
(*TAPI*)    dwTotalSize,
(*TAPI*)    dwNeededSize,
(*TAPI*)    dwUsedSize,
(*TAPI*)    dwButtonMode,
(*TAPI*)    dwButtonFunction,
(*TAPI*)    dwButtonTextSize,
(*TAPI*)    dwButtonTextOffset,
(*TAPI*)    dwDevSpecificSize,
(*TAPI*)    dwDevSpecificOffset,
(*TAPI*)
(*TAPI*)    dwButtonState: Longint;                         { TAPI v1.4 }
(*TAPI*)  end;
(*TAPI*)
(*TAPI*)  LPPhoneCaps = ^TPhoneCaps;
(*TAPI*)  TPhoneCaps = record
(*TAPI*)    dwTotalSize,
(*TAPI*)    dwNeededSize,
(*TAPI*)    dwUsedSize,
(*TAPI*)    dwProviderInfoSize,
(*TAPI*)    dwProviderInfoOffset,
(*TAPI*)    dwPhoneInfoSize,
(*TAPI*)    dwPhoneInfoOffset,
(*TAPI*)    dwPermanenTPhoneID,
(*TAPI*)    dwPhoneNameSize,
(*TAPI*)    dwPhoneNameOffset,
(*TAPI*)    dwStringFormat,
(*TAPI*)    dwPhoneStates,
(*TAPI*)    dwHookSwitchDevs,
(*TAPI*)    dwHandsetHookSwitchModes,
(*TAPI*)    dwSpeakerHookSwitchModes,
(*TAPI*)    dwHeadsetHookSwitchModes,
(*TAPI*)    dwVolumeFlags,
(*TAPI*)    dwGainFlags,
(*TAPI*)    dwDisplayNumRows,
(*TAPI*)    dwDisplayNumColumns,
(*TAPI*)    dwNumRingModes,
(*TAPI*)    dwNumButtonLamps,
(*TAPI*)    dwButtonModesSize,
(*TAPI*)    dwButtonModesOffset,
(*TAPI*)    dwButtonFunctionsSize,
(*TAPI*)    dwButtonFunctionsOffset,
(*TAPI*)    dwLampModesSize,
(*TAPI*)    dwLampModesOffset,
(*TAPI*)    dwNumSetData,
(*TAPI*)    dwSetDataSize,
(*TAPI*)    dwSetDataOffset,
(*TAPI*)    dwNumGetData,
(*TAPI*)    dwGetDataSize,
(*TAPI*)    dwGetDataOffset,
(*TAPI*)    dwDevSpecificSize,
(*TAPI*)    dwDevSpecificOffset: Longint;
(*TAPI*)
(*TAPI*){$IFDEF TAPI20}
(*TAPI*)    dwDeviceClassesSize,                            { TAPI v2.0 }
(*TAPI*)    dwDeviceClassesOffset,                          { TAPI v2.0 }
(*TAPI*)    dwPhoneFeatures,                                { TAPI v2.0 }
(*TAPI*)    dwSettableHandsetHookSwitchModes,               { TAPI v2.0 }
(*TAPI*)    dwSettableSpeakerHookSwitchModes,               { TAPI v2.0 }
(*TAPI*)    dwSettableHeadsetHookSwitchModes,               { TAPI v2.0 }
(*TAPI*)    dwMonitoredHandsetHookSwitchModes,              { TAPI v2.0 }
(*TAPI*)    dwMonitoredSpeakerHookSwitchModes,              { TAPI v2.0 }
(*TAPI*)    dwMonitoredHeadsetHookSwitchModes: Longint;     { TAPI v2.0 }
(*TAPI*){$ENDIF}
(*TAPI*)  end;
(*TAPI*)
(*TAPI*)  LPPhoneExtensionId = ^TPhoneExtensionId;
(*TAPI*)  TPhoneExtensionId = record
(*TAPI*)    dwExtensionID0,
(*TAPI*)    dwExtensionID1,
(*TAPI*)    dwExtensionID2,
(*TAPI*)    dwExtensionID3: Longint;
(*TAPI*)  end;
(*TAPI*)
(*TAPI*){$IFDEF TAPI20}
(*TAPI*)  LPPhoneInitializeExParams = ^TPhoneInitializeExParams;
(*TAPI*)  TPhoneInitializeExParams = record
(*TAPI*)    dwTotalSize,                                    { TAPI v2.0 }
(*TAPI*)    dwNeededSize,                                   { TAPI v2.0 }
(*TAPI*)    dwUsedSize,                                     { TAPI v2.0 }
(*TAPI*)    dwOptions: Longint;                             { TAPI v2.0 }
(*TAPI*)
(*TAPI*)    Handles: THandleUnion;
(*TAPI*)
(*TAPI*)    dwCompletionKey: Longint;                       { TAPI v2.0 }
(*TAPI*)  end;
(*TAPI*)
(*TAPI*)  LPPhoneMessage = ^TPhoneMessage;
(*TAPI*)  TPhoneMessage = record
(*TAPI*)    hDevice,                                        { TAPI v2.0 }
(*TAPI*)    dwMessageID,                                    { TAPI v2.0 }
(*TAPI*)    dwCallbackInstance,                             { TAPI v2.0 }
(*TAPI*)    dwParam1,                                       { TAPI v2.0 }
(*TAPI*)    dwParam2,                                       { TAPI v2.0 }
(*TAPI*)    dwParam3: Longint;                              { TAPI v2.0 }
(*TAPI*)  end;
(*TAPI*){$ENDIF}
(*TAPI*)
(*TAPI*)  LPPhoneStatus = ^TPhoneStatus;
(*TAPI*)  TPhoneStatus = record
(*TAPI*)    dwTotalSize,
(*TAPI*)    dwNeededSize,
(*TAPI*)    dwUsedSize,
(*TAPI*)    dwStatusFlags,
(*TAPI*)    dwNumOwners,
(*TAPI*)    dwNumMonitors,
(*TAPI*)    dwRingMode,
(*TAPI*)    dwRingVolume,
(*TAPI*)    dwHandsetHookSwitchMode,
(*TAPI*)    dwHandsetVolume,
(*TAPI*)    dwHandsetGain,
(*TAPI*)    dwSpeakerHookSwitchMode,
(*TAPI*)    dwSpeakerVolume,
(*TAPI*)    dwSpeakerGain,
(*TAPI*)    dwHeadsetHookSwitchMode,
(*TAPI*)    dwHeadsetVolume,
(*TAPI*)    dwHeadsetGain,
(*TAPI*)    dwDisplaySize,
(*TAPI*)    dwDisplayOffset,
(*TAPI*)    dwLampModesSize,
(*TAPI*)    dwLampModesOffset,
(*TAPI*)    dwOwnerNameSize,
(*TAPI*)    dwOwnerNameOffset,
(*TAPI*)    dwDevSpecificSize,
(*TAPI*)    dwDevSpecificOffset: Longint;
(*TAPI*)
(*TAPI*){$IFDEF TAPI20}
(*TAPI*)    dwPhoneFeatures: Longint;                       { TAPI v2.0 }
(*TAPI*){$ENDIF}
(*TAPI*)  end;
(*TAPI*)
(*TAPI*)  LPVarString = ^TVarString;
(*TAPI*)  TVarString = record
(*TAPI*)    dwTotalSize,
(*TAPI*)    dwNeededSize,
(*TAPI*)    dwUsedSize,
(*TAPI*)    dwStringFormat,
(*TAPI*)    dwStringSize,
(*TAPI*)    dwStringOffset: Longint;
(*TAPI*)  end;
(*TAPI*)
(*TAPI*)
(*TAPI*)function lineAccept(
(*TAPI*)  hCall: THCall;
(*TAPI*)  lpsUserUserInfo: PChar;
(*TAPI*)  dwSize: Longint): Longint;
(*TAPI*){$IFDEF WIN32}
(*TAPI*)  stdcall;
(*TAPI*){$ENDIF}
(*TAPI*)
(*TAPI*)function lineAddProvider(                           { TAPI v1.4 }
(*TAPI*)  lpszProviderFilename: PChar;
(*TAPI*)  hwndOwner: HWnd;
(*TAPI*)  var lpdwPermanentProviderID: Longint): Longint;
(*TAPI*){$IFDEF WIN32}
(*TAPI*)  stdcall;
(*TAPI*){$ENDIF}
(*TAPI*)
(*TAPI*){$IFDEF WIN32}
(*TAPI*)function lineAddProviderA(                          { TAPI v1.4 }
(*TAPI*)  lpszProviderFilename: PChar;
(*TAPI*)  hwndOwner: HWnd;
(*TAPI*)  var lpdwPermanentProviderID: Longint): Longint; stdcall;
(*TAPI*)
(*TAPI*)function lineAddProviderW(
(*TAPI*)  lpszProviderFilename: PWideChar;
(*TAPI*)  hwndOwner: HWnd;
(*TAPI*)  var lpdwPermanentProviderID: Longint): Longint; stdcall;
(*TAPI*){$ENDIF}
(*TAPI*)
(*TAPI*)function lineAddToConference(
(*TAPI*)    hConfCall: THCall;
(*TAPI*)    hConsultCall: THCall): Longint;
(*TAPI*){$IFDEF WIN32}
(*TAPI*)  stdcall;
(*TAPI*){$ENDIF}
(*TAPI*)
(*TAPI*){$IFDEF TAPI20}
(*TAPI*)function lineAgentSpecific(                         { TAPI v2.0 }
(*TAPI*)  hLine: THLine;
(*TAPI*)  dwAddressID: Longint;
(*TAPI*)  dwAgentExtensionIDIndex: Longint;
(*TAPI*)  lpParams: Pointer;
(*TAPI*)  dwSize: Longint): Longint; stdcall;
(*TAPI*){$ENDIF}
(*TAPI*)
(*TAPI*)function lineAnswer(
(*TAPI*)  hCall: THCall;
(*TAPI*)  lpsUserUserInfo: PChar;
(*TAPI*)  dwSize: Longint): Longint;
(*TAPI*){$IFDEF WIN32}
(*TAPI*)  stdcall;
(*TAPI*){$ENDIF}
(*TAPI*)
(*TAPI*)function lineBlindTransfer(
(*TAPI*)  hCall: THCall;
(*TAPI*)  lpszDestAddress: PChar;
(*TAPI*)  dwCountryCode: Longint): Longint;
(*TAPI*){$IFDEF WIN32}
(*TAPI*)  stdcall;
(*TAPI*){$ENDIF}
(*TAPI*)
(*TAPI*){$IFDEF WIN32}
(*TAPI*)function lineBlindTransferA(
(*TAPI*)  hCall: THCall;
(*TAPI*)  lpszDestAddress: PChar;
(*TAPI*)  dwCountryCode: Longint): Longint; stdcall;
(*TAPI*)
(*TAPI*)function lineBlindTransferW(
(*TAPI*)  hCall: THCall;
(*TAPI*)  lpszDestAddress: PWideChar;
(*TAPI*)  dwCountryCode: Longint): Longint; stdcall;
(*TAPI*){$ENDIF}
(*TAPI*)
(*TAPI*)function lineClose(
(*TAPI*)  hLine: THLine): Longint;
(*TAPI*){$IFDEF WIN32}
(*TAPI*)  stdcall;
(*TAPI*){$ENDIF}
(*TAPI*)
(*TAPI*)function lineCompleteCall(
(*TAPI*)  hCall: THCall;
(*TAPI*)  var lpdwCompletionID: Longint;
(*TAPI*)  dwCompletionMode: Longint;
(*TAPI*)  dwMessageID: Longint): Longint;
(*TAPI*){$IFDEF WIN32}
(*TAPI*)  stdcall;
(*TAPI*){$ENDIF}
(*TAPI*)
(*TAPI*)function lineCompleteTransfer(
(*TAPI*)  hCall: THCall;
(*TAPI*)  hConsultCall: THCall;
(*TAPI*)  var lphConfCall: THCall;
(*TAPI*)  dwTransferMode: Longint): Longint;
(*TAPI*){$IFDEF WIN32}
(*TAPI*)  stdcall;
(*TAPI*){$ENDIF}
(*TAPI*)
(*TAPI*)function lineConfigDialog(
(*TAPI*)  dwDeviceID: Longint;
(*TAPI*)  hwndOwner: HWnd;
(*TAPI*)  lpszDeviceClass: PChar): Longint;
(*TAPI*){$IFDEF WIN32}
(*TAPI*)  stdcall;
(*TAPI*){$ENDIF}
(*TAPI*)
(*TAPI*){$IFDEF WIN32}
(*TAPI*)function lineConfigDialogA(
(*TAPI*)  dwDeviceID: Longint;
(*TAPI*)  hwndOwner: HWnd;
(*TAPI*)  lpszDeviceClass: PChar): Longint; stdcall;
(*TAPI*)
(*TAPI*)function lineConfigDialogW(
(*TAPI*)  dwDeviceID: Longint;
(*TAPI*)  hwndOwner: HWnd;
(*TAPI*)  lpszDeviceClass: PWideChar): Longint; stdcall;
(*TAPI*){$ENDIF}
(*TAPI*)
(*TAPI*)function lineConfigDialogEdit(                      { TAPI v1.4 }
(*TAPI*)  dwDeviceID: Longint;
(*TAPI*)  hwndOwner: HWnd;
(*TAPI*)  lpszDeviceClass: PChar;
(*TAPI*)  lpDeviceConfigIn: Pointer;
(*TAPI*)  dwSize: Longint;
(*TAPI*)  var lpDeviceConfigOut: TVarString): Longint;
(*TAPI*){$IFDEF WIN32}
(*TAPI*)  stdcall;
(*TAPI*){$ENDIF}
(*TAPI*)
(*TAPI*){$IFDEF WIN32}
(*TAPI*)function lineConfigDialogEditA(                     { TAPI v1.4 }
(*TAPI*)  dwDeviceID: Longint;
(*TAPI*)  hwndOwner: HWnd;
(*TAPI*)  lpszDeviceClass: PChar;
(*TAPI*)  lpDeviceConfigIn: Pointer;
(*TAPI*)  dwSize: Longint;
(*TAPI*)  var lpDeviceConfigOut: TVarString): Longint; stdcall;
(*TAPI*)
(*TAPI*)function lineConfigDialogEditW(
(*TAPI*)  dwDeviceID: Longint;
(*TAPI*)  hwndOwner: HWnd;
(*TAPI*)  lpszDeviceClass: PWideChar;
(*TAPI*)  lpDeviceConfigIn: Pointer;
(*TAPI*)  dwSize: Longint;
(*TAPI*)  var lpDeviceConfigOut: TVarString): Longint; stdcall;
(*TAPI*){$ENDIF}
(*TAPI*)
(*TAPI*)function lineConfigProvider(                        { TAPI v1.4 }
(*TAPI*)  hwndOwner: HWnd;
(*TAPI*)  dwPermanentProviderID: Longint): Longint;
(*TAPI*){$IFDEF WIN32}
(*TAPI*)  stdcall;
(*TAPI*){$ENDIF}
(*TAPI*)
(*TAPI*)function lineDeallocateCall(
(*TAPI*)    hCall: THCall): Longint;
(*TAPI*){$IFDEF WIN32}
(*TAPI*)  stdcall;
(*TAPI*){$ENDIF}
(*TAPI*)
(*TAPI*)function lineDevSpecific(
(*TAPI*)  hLine: THLine;
(*TAPI*)  dwAddressID: Longint;
(*TAPI*)  hCall: THCall;
(*TAPI*)  lpParams: Pointer;
(*TAPI*)  dwSize: Longint): Longint;
(*TAPI*){$IFDEF WIN32}
(*TAPI*)  stdcall;
(*TAPI*){$ENDIF}
(*TAPI*)
(*TAPI*)function lineDevSpecificFeature(
(*TAPI*)  hLine: THLine;
(*TAPI*)  dwFeature: Longint;
(*TAPI*)  lpParams: Pointer;
(*TAPI*)  dwSize: Longint): Longint;
(*TAPI*){$IFDEF WIN32}
(*TAPI*)  stdcall;
(*TAPI*){$ENDIF}
(*TAPI*)
(*TAPI*)function lineDial(
(*TAPI*)  hCall: THCall;
(*TAPI*)  lpszDestAddress: PChar;
(*TAPI*)  dwCountryCode: Longint): Longint;
(*TAPI*){$IFDEF WIN32}
(*TAPI*)  stdcall;
(*TAPI*){$ENDIF}
(*TAPI*)
(*TAPI*){$IFDEF WIN32}
(*TAPI*)function lineDialA(
(*TAPI*)  hCall: THCall;
(*TAPI*)  lpszDestAddress: PChar;
(*TAPI*)  dwCountryCode: Longint): Longint; stdcall;
(*TAPI*)
(*TAPI*)function lineDialW(
(*TAPI*)  hCall: THCall;
(*TAPI*)  lpszDestAddress: PWideChar;
(*TAPI*)  dwCountryCode: Longint): Longint; stdcall;
(*TAPI*){$ENDIF}
(*TAPI*)
(*TAPI*)function lineDrop(
(*TAPI*)  hCall: THCall;
(*TAPI*)  lpsUserUserInfo: PChar;
(*TAPI*)  dwSize: Longint): Longint;
(*TAPI*){$IFDEF WIN32}
(*TAPI*)  stdcall;
(*TAPI*){$ENDIF}
(*TAPI*)
(*TAPI*)function lineForward(
(*TAPI*)  hLine: THLine;
(*TAPI*)  bAllAddresses: Longint;
(*TAPI*)  dwAddressID: Longint;
(*TAPI*)  var lpForwardList: TLineForwardList;
(*TAPI*)  dwNumRingsNoAnswer: Longint;
(*TAPI*)  var lphConsultCall: THCall;
(*TAPI*)  lpCallParams: LPLineCallParams): Longint;
(*TAPI*){$IFDEF WIN32}
(*TAPI*)  stdcall;
(*TAPI*){$ENDIF}
(*TAPI*)
(*TAPI*){$IFDEF WIN32}
(*TAPI*)function lineForwardA(
(*TAPI*)  hLine: THLine;
(*TAPI*)  bAllAddresses: Longint;
(*TAPI*)  dwAddressID: Longint;
(*TAPI*)  var lpForwardList: TLineForwardList;
(*TAPI*)  dwNumRingsNoAnswer: Longint;
(*TAPI*)  var lphConsultCall: THCall;
(*TAPI*)  lpCallParams: LPLineCallParams): Longint; stdcall;
(*TAPI*)
(*TAPI*)function lineForwardW(
(*TAPI*)  hLine: THLine;
(*TAPI*)  bAllAddresses: Longint;
(*TAPI*)  dwAddressID: Longint;
(*TAPI*)  var lpForwardList: TLineForwardList;
(*TAPI*)  dwNumRingsNoAnswer: Longint;
(*TAPI*)  var lphConsultCall: THCall;
(*TAPI*)  lpCallParams: LPLineCallParams): Longint; stdcall;
(*TAPI*){$ENDIF}
(*TAPI*)
(*TAPI*)function lineGatherDigits(
(*TAPI*)  hCall: THCall;
(*TAPI*)  dwDigitModes: Longint;
(*TAPI*)  lpsDigits: PChar;
(*TAPI*)  dwNumDigits: Longint;
(*TAPI*)  lpszTerminationDigits: PChar;
(*TAPI*)  dwFirstDigitTimeout: Longint;
(*TAPI*)  dwInterDigitTimeout: Longint): Longint;
(*TAPI*){$IFDEF WIN32}
(*TAPI*)  stdcall;
(*TAPI*){$ENDIF}
(*TAPI*)
(*TAPI*){$IFDEF WIN32}
(*TAPI*)function lineGatherDigitsA(
(*TAPI*)  hCall: THCall;
(*TAPI*)  dwDigitModes: Longint;
(*TAPI*)  lpsDigits: PChar;
(*TAPI*)  dwNumDigits: Longint;
(*TAPI*)  lpszTerminationDigits: PChar;
(*TAPI*)  dwFirstDigitTimeout: Longint;
(*TAPI*)  dwInterDigitTimeout: Longint): Longint; stdcall;
(*TAPI*)
(*TAPI*)function lineGatherDigitsW(
(*TAPI*)  hCall: THCall;
(*TAPI*)  dwDigitModes: Longint;
(*TAPI*)  lpsDigits: PWideChar;
(*TAPI*)  dwNumDigits: Longint;
(*TAPI*)  lpszTerminationDigits: PWideChar;
(*TAPI*)  dwFirstDigitTimeout: Longint;
(*TAPI*)  dwInterDigitTimeout: Longint): Longint; stdcall;
(*TAPI*){$ENDIF}
(*TAPI*)
(*TAPI*)function lineGenerateDigits(
(*TAPI*)  hCall: THCall;
(*TAPI*)  dwDigitMode: Longint;
(*TAPI*)  lpszDigits: PChar;
(*TAPI*)  dwDuration: Longint): Longint;
(*TAPI*){$IFDEF WIN32}
(*TAPI*)  stdcall;
(*TAPI*){$ENDIF}
(*TAPI*)
(*TAPI*){$IFDEF WIN32}
(*TAPI*)function lineGenerateDigitsA(
(*TAPI*)  hCall: THCall;
(*TAPI*)  dwDigitMode: Longint;
(*TAPI*)  lpszDigits: PChar;
(*TAPI*)  dwDuration: Longint): Longint; stdcall;
(*TAPI*)
(*TAPI*)function lineGenerateDigitsW(
(*TAPI*)  hCall: THCall;
(*TAPI*)  dwDigitMode: Longint;
(*TAPI*)  lpszDigits: PWideChar;
(*TAPI*)  dwDuration: Longint): Longint; stdcall;
(*TAPI*){$ENDIF}
(*TAPI*)
(*TAPI*)function lineGenerateTone(
(*TAPI*)  hCall: THCall;
(*TAPI*)  dwToneMode: Longint;
(*TAPI*)  dwDuration: Longint;
(*TAPI*)  dwNumTones: Longint;
(*TAPI*)  lpTones: LPLineGenerateTone): Longint;
(*TAPI*){$IFDEF WIN32}
(*TAPI*)  stdcall;
(*TAPI*){$ENDIF}
(*TAPI*)
(*TAPI*)function lineGetAddressCaps(
(*TAPI*)  hLineApp: THLineApp;
(*TAPI*)  dwDeviceID: Longint;
(*TAPI*)  dwAddressID: Longint;
(*TAPI*)  dwAPIVersion: Longint;
(*TAPI*)  dwExtVersion: Longint;
(*TAPI*)  var lpAddressCaps: TLineAddressCaps): Longint;
(*TAPI*){$IFDEF WIN32}
(*TAPI*)  stdcall;
(*TAPI*){$ENDIF}
(*TAPI*)
(*TAPI*){$IFDEF WIN32}
(*TAPI*)function lineGetAddressCapsA(
(*TAPI*)  hLineApp: THLineApp;
(*TAPI*)  dwDeviceID: Longint;
(*TAPI*)  dwAddressID: Longint;
(*TAPI*)  dwAPIVersion: Longint;
(*TAPI*)  dwExtVersion: Longint;
(*TAPI*)  var lpAddressCaps: TLineAddressCaps): Longint; stdcall;
(*TAPI*)
(*TAPI*)function lineGetAddressCapsW(
(*TAPI*)  hLineApp: THLineApp;
(*TAPI*)  dwDeviceID: Longint;
(*TAPI*)  dwAddressID: Longint;
(*TAPI*)  dwAPIVersion: Longint;
(*TAPI*)  dwExtVersion: Longint;
(*TAPI*)  var lpAddressCaps: TLineAddressCaps): Longint; stdcall;
(*TAPI*){$ENDIF}
(*TAPI*)
(*TAPI*)function lineGetAddressID(
(*TAPI*)  hLine: THLine;
(*TAPI*)  var lpdwAddressID: Longint;
(*TAPI*)  dwAddressMode: Longint;
(*TAPI*)  lpsAddress: PChar;
(*TAPI*)  dwSize: Longint): Longint;
(*TAPI*){$IFDEF WIN32}
(*TAPI*)  stdcall;
(*TAPI*){$ENDIF}
(*TAPI*)
(*TAPI*){$IFDEF WIN32}
(*TAPI*)function lineGetAddressIDA(
(*TAPI*)  hLine: THLine;
(*TAPI*)  var lpdwAddressID: Longint;
(*TAPI*)  dwAddressMode: Longint;
(*TAPI*)  lpsAddress: PChar;
(*TAPI*)  dwSize: Longint): Longint; stdcall;
(*TAPI*)
(*TAPI*)function lineGetAddressIDW(
(*TAPI*)  hLine: THLine;
(*TAPI*)  var lpdwAddressID: Longint;
(*TAPI*)  dwAddressMode: Longint;
(*TAPI*)  lpsAddress: PWideChar;
(*TAPI*)  dwSize: Longint): Longint; stdcall;
(*TAPI*){$ENDIF}
(*TAPI*)
(*TAPI*)function lineGetAddressStatus(
(*TAPI*)  hLine: THLine;
(*TAPI*)  dwAddressID: Longint;
(*TAPI*)  var lpAddressStatus: TLineAddressStatus): Longint;
(*TAPI*){$IFDEF WIN32}
(*TAPI*)  stdcall;
(*TAPI*){$ENDIF}
(*TAPI*)
(*TAPI*){$IFDEF WIN32}
(*TAPI*)function lineGetAddressStatusA(
(*TAPI*)  hLine: THLine;
(*TAPI*)  dwAddressID: Longint;
(*TAPI*)  var lpAddressStatus: TLineAddressStatus): Longint; stdcall;
(*TAPI*)
(*TAPI*)function lineGetAddressStatusW(
(*TAPI*)  hLine: THLine;
(*TAPI*)  dwAddressID: Longint;
(*TAPI*)  var lpAddressStatus: TLineAddressStatus): Longint; stdcall;
(*TAPI*){$ENDIF}
(*TAPI*)
(*TAPI*){$IFDEF TAPI20}
(*TAPI*)function lineGetAgentActivityList(                  { TAPI v2.0 }
(*TAPI*)  hLine: THLine;
(*TAPI*)  dwAddressID: Longint;
(*TAPI*)  var lpAgentActivityList: TLineAgentActivityList): Longint; stdcall;
(*TAPI*)
(*TAPI*)function lineGetAgentActivityListA(                 { TAPI v2.0 }
(*TAPI*)  hLine: THLine;
(*TAPI*)  dwAddressID: Longint;
(*TAPI*)  var lpAgentActivityList: TLineAgentActivityList): Longint; stdcall;
(*TAPI*)
(*TAPI*)function lineGetAgentActivityListW(                 { TAPI v2.0 }
(*TAPI*)  hLine: THLine;
(*TAPI*)  dwAddressID: Longint;
(*TAPI*)  var lpAgentActivityList: TLineAgentActivityList): Longint; stdcall;
(*TAPI*)
(*TAPI*)function lineGetAgentCaps(                          { TAPI v2.0 }
(*TAPI*)  hLineApp: THLineApp;
(*TAPI*)  dwDeviceID: Longint;
(*TAPI*)  dwAddressID: Longint;
(*TAPI*)  dwAppAPIVersion: Longint;
(*TAPI*)  var lpAgentCaps: TLineAgentCaps): Longint; stdcall;
(*TAPI*)
(*TAPI*)function lineGetAgentCapsA(                         { TAPI v2.0 }
(*TAPI*)  hLineApp: THLineApp;
(*TAPI*)  dwDeviceID: Longint;
(*TAPI*)  dwAddressID: Longint;
(*TAPI*)  dwAppAPIVersion: Longint;
(*TAPI*)  var lpAgentCaps: TLineAgentCaps): Longint; stdcall;
(*TAPI*)
(*TAPI*)function lineGetAgentCapsW(                         { TAPI v2.0 }
(*TAPI*)  hLineApp: THLineApp;
(*TAPI*)  dwDeviceID: Longint;
(*TAPI*)  dwAddressID: Longint;
(*TAPI*)  dwAppAPIVersion: Longint;
(*TAPI*)  var lpAgentCaps: TLineAgentCaps): Longint; stdcall;
(*TAPI*)
(*TAPI*)function lineGetAgentGroupList(                     { TAPI v2.0 }
(*TAPI*)  hLine: THLine;
(*TAPI*)  dwAddressID: Longint;
(*TAPI*)  var lpAgentGroupList: TLineAgentGroupList): Longint; stdcall;
(*TAPI*)
(*TAPI*)function lineGetAgentGroupListA(                    { TAPI v2.0 }
(*TAPI*)  hLine: THLine;
(*TAPI*)  dwAddressID: Longint;
(*TAPI*)  var lpAgentGroupList: TLineAgentGroupList): Longint; stdcall;
(*TAPI*)
(*TAPI*)function lineGetAgentGroupListW(                    { TAPI v2.0 }
(*TAPI*)  hLine: THLine;
(*TAPI*)  dwAddressID: Longint;
(*TAPI*)  var lpAgentGroupList: TLineAgentGroupList): Longint; stdcall;
(*TAPI*)
(*TAPI*)function lineGetAgentStatus(                        { TAPI v2.0 }
(*TAPI*)  hLine: THLine;
(*TAPI*)  dwAddressID: Longint;
(*TAPI*)  var lpAgentStatus: TLineAgentStatus): Longint; stdcall;
(*TAPI*)
(*TAPI*)function lineGetAgentStatusA(                       { TAPI v2.0 }
(*TAPI*)  hLine: THLine;
(*TAPI*)  dwAddressID: Longint;
(*TAPI*)  var lpAgentStatus: TLineAgentStatus): Longint; stdcall;
(*TAPI*)
(*TAPI*)function lineGetAgentStatusW(                       { TAPI v2.0 }
(*TAPI*)  hLine: THLine;
(*TAPI*)  dwAddressID: Longint;
(*TAPI*)  var lpAgentStatus: TLineAgentStatus): Longint; stdcall;
(*TAPI*){$ENDIF}
(*TAPI*)
(*TAPI*)function lineGetAppPriority(                        { TAPI v1.4 }
(*TAPI*)  lpszAppFilename: PChar;
(*TAPI*)  dwMediaMode: Longint;
(*TAPI*)  lpExtensionID: LPLineExtensionID;
(*TAPI*)  dwRequestMode: Longint;
(*TAPI*)  lpExtensionName: LPVarString;
(*TAPI*)  var lpdwPriority: Longint): Longint;
(*TAPI*){$IFDEF WIN32}
(*TAPI*)  stdcall;
(*TAPI*){$ENDIF}
(*TAPI*)
(*TAPI*){$IFDEF WIN32}
(*TAPI*)function lineGetAppPriorityA(                       { TAPI v1.4 }
(*TAPI*)  lpszAppFilename: PChar;
(*TAPI*)  dwMediaMode: Longint;
(*TAPI*)  lpExtensionID: LPLineExtensionID;
(*TAPI*)  dwRequestMode: Longint;
(*TAPI*)  lpExtensionName: LPVarString;
(*TAPI*)  var lpdwPriority: Longint): Longint; stdcall;
(*TAPI*)
(*TAPI*)function lineGetAppPriorityW(                       { TAPI v1.4 }
(*TAPI*)  lpszAppFilename: PWideChar;
(*TAPI*)  dwMediaMode: Longint;
(*TAPI*)  lpExtensionID: LPLineExtensionID;
(*TAPI*)  dwRequestMode: Longint;
(*TAPI*)  lpExtensionName: LPVarString;
(*TAPI*)  var lpdwPriority: Longint): Longint; stdcall;
(*TAPI*){$ENDIF}
(*TAPI*)
(*TAPI*)function lineGetCallInfo(
(*TAPI*)  hCall: THCall;
(*TAPI*)  var lpCallInfo: TLineCallInfo): Longint;
(*TAPI*){$IFDEF WIN32}
(*TAPI*)  stdcall;
(*TAPI*){$ENDIF}
(*TAPI*)
(*TAPI*){$IFDEF WIN32}
(*TAPI*)function lineGetCallInfoA(
(*TAPI*)  hCall: THCall;
(*TAPI*)  var lpCallInfo: TLineCallInfo): Longint; stdcall;
(*TAPI*)
(*TAPI*)function lineGetCallInfoW(
(*TAPI*)  hCall: THCall;
(*TAPI*)  var lpCallInfo: TLineCallInfo): Longint; stdcall;
(*TAPI*){$ENDIF}
(*TAPI*)
(*TAPI*)function lineGetCallStatus(
(*TAPI*)  hCall: THCall;
(*TAPI*)  var lpCallStatus: TLineCallStatus): Longint;
(*TAPI*){$IFDEF WIN32}
(*TAPI*)  stdcall;
(*TAPI*){$ENDIF}
(*TAPI*)
(*TAPI*)function lineGetConfRelatedCalls(
(*TAPI*)  hCall: THCall;
(*TAPI*)  var lpCallList: TLineCallList): Longint;
(*TAPI*){$IFDEF WIN32}
(*TAPI*)  stdcall;
(*TAPI*){$ENDIF}
(*TAPI*)
(*TAPI*)function lineGetCountry(                            { TAPI v1.4 }
(*TAPI*)  dwCountryID: Longint;
(*TAPI*)  dwAPIVersion: Longint;
(*TAPI*)  var lpLineCountryList: TLineCountryList): Longint;
(*TAPI*){$IFDEF WIN32}
(*TAPI*)  stdcall;
(*TAPI*){$ENDIF}
(*TAPI*)
(*TAPI*){$IFDEF WIN32}
(*TAPI*)function lineGetCountryA(                           { TAPI v1.4 }
(*TAPI*)  dwCountryID: Longint;
(*TAPI*)  dwAPIVersion: Longint;
(*TAPI*)  var lpLineCountryList: TLineCountryList): Longint; stdcall;
(*TAPI*)
(*TAPI*)function lineGetCountryW(                           { TAPI v1.4 }
(*TAPI*)  dwCountryID: Longint;
(*TAPI*)  dwAPIVersion: Longint;
(*TAPI*)  var lpLineCountryList: TLineCountryList): Longint; stdcall;
(*TAPI*){$ENDIF}
(*TAPI*)
(*TAPI*)function lineGetDevCaps(
(*TAPI*)  hLineApp: THLineApp;
(*TAPI*)  dwDeviceID: Longint;
(*TAPI*)  dwAPIVersion: Longint;
(*TAPI*)  dwExtVersion: Longint;
(*TAPI*)  var lpLineDevCaps: TLineDevCaps): Longint;
(*TAPI*){$IFDEF WIN32}
(*TAPI*)  stdcall;
(*TAPI*){$ENDIF}
(*TAPI*)
(*TAPI*){$IFDEF WIN32}
(*TAPI*)function lineGetDevCapsA(
(*TAPI*)  hLineApp: THLineApp;
(*TAPI*)  dwDeviceID: Longint;
(*TAPI*)  dwAPIVersion: Longint;
(*TAPI*)  dwExtVersion: Longint;
(*TAPI*)  var lpLineDevCaps: TLineDevCaps): Longint; stdcall;
(*TAPI*)
(*TAPI*)function lineGetDevCapsW(
(*TAPI*)  hLineApp: THLineApp;
(*TAPI*)  dwDeviceID: Longint;
(*TAPI*)  dwAPIVersion: Longint;
(*TAPI*)  dwExtVersion: Longint;
(*TAPI*)  var lpLineDevCaps: TLineDevCaps): Longint; stdcall;
(*TAPI*){$ENDIF}
(*TAPI*)
(*TAPI*)function lineGetDevConfig(
(*TAPI*)  dwDeviceID: Longint;
(*TAPI*)  var lpDeviceConfig: TVarString;
(*TAPI*)  lpszDeviceClass: PChar): Longint;
(*TAPI*){$IFDEF WIN32}
(*TAPI*)  stdcall;
(*TAPI*){$ENDIF}
(*TAPI*)
(*TAPI*){$IFDEF WIN32}
(*TAPI*)function lineGetDevConfigA(
(*TAPI*)  dwDeviceID: Longint;
(*TAPI*)  var lpDeviceConfig: TVarString;
(*TAPI*)  lpszDeviceClass: PChar): Longint; stdcall;
(*TAPI*)
(*TAPI*)function lineGetDevConfigW(
(*TAPI*)  dwDeviceID: Longint;
(*TAPI*)  var lpDeviceConfig: TVarString;
(*TAPI*)  lpszDeviceClass: PWideChar): Longint; stdcall;
(*TAPI*){$ENDIF}
(*TAPI*)
(*TAPI*)function lineGetNewCalls(
(*TAPI*)  hLine: THLine;
(*TAPI*)  dwAddressID: Longint;
(*TAPI*)  dwSelect: Longint;
(*TAPI*)  var lpCallList: TLineCallList): Longint;
(*TAPI*){$IFDEF WIN32}
(*TAPI*)  stdcall;
(*TAPI*){$ENDIF}
(*TAPI*)
(*TAPI*)function lineGetIcon(
(*TAPI*)  dwDeviceID: Longint;
(*TAPI*)  lpszDeviceClass: PChar;
(*TAPI*)  var lphIcon: HIcon): Longint;
(*TAPI*){$IFDEF WIN32}
(*TAPI*)  stdcall;
(*TAPI*){$ENDIF}
(*TAPI*)
(*TAPI*){$IFDEF WIN32}
(*TAPI*)function lineGetIconA(
(*TAPI*)  dwDeviceID: Longint;
(*TAPI*)  lpszDeviceClass: PChar;
(*TAPI*)  var lphIcon: HIcon): Longint; stdcall;
(*TAPI*)
(*TAPI*)function lineGetIconW(
(*TAPI*)  dwDeviceID: Longint;
(*TAPI*)  lpszDeviceClass: PWideChar;
(*TAPI*)  var lphIcon: HIcon): Longint; stdcall;
(*TAPI*){$ENDIF}
(*TAPI*)
(*TAPI*)function lineGetID(
(*TAPI*)  hLine: THLine;
(*TAPI*)  dwAddressID: Longint;
(*TAPI*)  hCall: THCall;
(*TAPI*)  dwSelect: Longint;
(*TAPI*)  var lpDeviceID: TVarString;
(*TAPI*)  lpszDeviceClass: PChar): Longint;
(*TAPI*){$IFDEF WIN32}
(*TAPI*)  stdcall;
(*TAPI*){$ENDIF}
(*TAPI*)
(*TAPI*){$IFDEF WIN32}
(*TAPI*)function lineGetIDA(
(*TAPI*)  hLine: THLine;
(*TAPI*)  dwAddressID: Longint;
(*TAPI*)  hCall: THCall;
(*TAPI*)  dwSelect: Longint;
(*TAPI*)  var lpDeviceID: TVarString;
(*TAPI*)  lpszDeviceClass: PChar): Longint; stdcall;
(*TAPI*)
(*TAPI*)function lineGetIDW(
(*TAPI*)  hLine: THLine;
(*TAPI*)  dwAddressID: Longint;
(*TAPI*)  hCall: THCall;
(*TAPI*)  dwSelect: Longint;
(*TAPI*)  var lpDeviceID: TVarString;
(*TAPI*)  lpszDeviceClass: PWideChar): Longint; stdcall;
(*TAPI*){$ENDIF}
(*TAPI*)
(*TAPI*)function lineGetLineDevStatus(
(*TAPI*)  hLine: THLine;
(*TAPI*)  var lpLineDevStatus: TLineDevStatus): Longint;
(*TAPI*){$IFDEF WIN32}
(*TAPI*)  stdcall;
(*TAPI*){$ENDIF}
(*TAPI*)
(*TAPI*){$IFDEF WIN32}
(*TAPI*)function lineGetLineDevStatusA(
(*TAPI*)  hLine: THLine;
(*TAPI*)  var lpLineDevStatus: TLineDevStatus): Longint; stdcall;
(*TAPI*)
(*TAPI*)function lineGetLineDevStatusW(
(*TAPI*)  hLine: THLine;
(*TAPI*)  var lpLineDevStatus: TLineDevStatus): Longint; stdcall;
(*TAPI*){$ENDIF}
(*TAPI*)
(*TAPI*){$IFDEF TAPI20}
(*TAPI*)function lineGetMessage(                            { TAPI v2.0 }
(*TAPI*)  hLineApp: THLineApp;
(*TAPI*)  var lpMessage: TLineMessage;
(*TAPI*)  dwTimeout: Longint): Longint; stdcall;
(*TAPI*){$ENDIF}
(*TAPI*)
(*TAPI*)function lineGetNumRings(
(*TAPI*)  hLine: THLine;
(*TAPI*)  dwAddressID: Longint;
(*TAPI*)  var lpdwNumRings: Longint): Longint;
(*TAPI*){$IFDEF WIN32}
(*TAPI*)  stdcall;
(*TAPI*){$ENDIF}
(*TAPI*)
(*TAPI*)function lineGetProviderList(                       { TAPI v1.4 }
(*TAPI*)  dwAPIVersion: Longint;
(*TAPI*)  var lpProviderList: TLineProviderList): Longint;
(*TAPI*){$IFDEF WIN32}
(*TAPI*)  stdcall;
(*TAPI*){$ENDIF}
(*TAPI*)
(*TAPI*){$IFDEF WIN32}
(*TAPI*)function lineGetProviderListA(
(*TAPI*)  dwAPIVersion: Longint;
(*TAPI*)  var lpProviderList: TLineProviderList): Longint; stdcall;
(*TAPI*)
(*TAPI*)function lineGetProviderListW(
(*TAPI*)  dwAPIVersion: Longint;
(*TAPI*)  var lpProviderList: TLineProviderList): Longint; stdcall;
(*TAPI*){$ENDIF}
(*TAPI*)
(*TAPI*)function lineGetRequest(
(*TAPI*)  hLineApp: THLineApp;
(*TAPI*)  dwRequestMode: Longint;
(*TAPI*)  lpRequestBuffer: Pointer): Longint;
(*TAPI*){$IFDEF WIN32}
(*TAPI*)  stdcall;
(*TAPI*){$ENDIF}
(*TAPI*)
(*TAPI*){$IFDEF WIN32}
(*TAPI*)function lineGetRequestA(
(*TAPI*)  hLineApp: THLineApp;
(*TAPI*)  dwRequestMode: Longint;
(*TAPI*)  lpRequestBuffer: Pointer): Longint; stdcall;
(*TAPI*)
(*TAPI*)function lineGetRequestW(
(*TAPI*)  hLineApp: THLineApp;
(*TAPI*)  dwRequestMode: Longint;
(*TAPI*)  lpRequestBuffer: Pointer): Longint; stdcall;
(*TAPI*){$ENDIF}
(*TAPI*)
(*TAPI*)function lineGetStatusMessages(
(*TAPI*)  hLine: THLine;
(*TAPI*)  var lpdwLineStates: Longint;
(*TAPI*)  var lpdwAddressStates: Longint): Longint;
(*TAPI*){$IFDEF WIN32}
(*TAPI*)  stdcall;
(*TAPI*){$ENDIF}
(*TAPI*)
(*TAPI*)function lineGetTranslateCaps(
(*TAPI*)  hLineApp: THLineApp;
(*TAPI*)  dwAPIVersion: Longint;
(*TAPI*)  var lpTranslateCaps: TLineTranslateCaps): Longint;
(*TAPI*){$IFDEF WIN32}
(*TAPI*)  stdcall;
(*TAPI*){$ENDIF}
(*TAPI*)
(*TAPI*){$IFDEF WIN32}
(*TAPI*)function lineGetTranslateCapsA(
(*TAPI*)  hLineApp: THLineApp;
(*TAPI*)  dwAPIVersion: Longint;
(*TAPI*)  var lpTranslateCaps: TLineTranslateCaps): Longint; stdcall;
(*TAPI*)
(*TAPI*)function lineGetTranslateCapsW(
(*TAPI*)  hLineApp: THLineApp;
(*TAPI*)  dwAPIVersion: Longint;
(*TAPI*)  var lpTranslateCaps: TLineTranslateCaps): Longint; stdcall;
(*TAPI*){$ENDIF}
(*TAPI*)
(*TAPI*)function lineHandoff(
(*TAPI*)  hCall: THCall;
(*TAPI*)  lpszFileName: PChar;
(*TAPI*)  dwMediaMode: Longint): Longint;
(*TAPI*){$IFDEF WIN32}
(*TAPI*)  stdcall;
(*TAPI*){$ENDIF}
(*TAPI*)
(*TAPI*){$IFDEF WIN32}
(*TAPI*)function lineHandoffA(
(*TAPI*)  hCall: THCall;
(*TAPI*)  lpszFileName: PChar;
(*TAPI*)  dwMediaMode: Longint): Longint; stdcall;
(*TAPI*)
(*TAPI*)function lineHandoffW(
(*TAPI*)  hCall: THCall;
(*TAPI*)  lpszFileName: PWideChar;
(*TAPI*)  dwMediaMode: Longint): Longint; stdcall;
(*TAPI*){$ENDIF}
(*TAPI*)
(*TAPI*)function lineHold(
(*TAPI*)	hCall: THCall): Longint;
(*TAPI*){$IFDEF WIN32}
(*TAPI*)	stdcall;
(*TAPI*){$ENDIF}
(*TAPI*)
(*TAPI*)function lineInitialize(
(*TAPI*)	var lphLineApp: THLineApp;
(*TAPI*)	hInstance: HInst;
(*TAPI*)	lpfnCallback: TLineCallback;
(*TAPI*)	lpszAppName: PChar;
(*TAPI*)	var lpdwNumDevs: Longint): Longint;
(*TAPI*){$IFDEF WIN32}
(*TAPI*)	stdcall;
(*TAPI*){$ENDIF}
(*TAPI*)
(*TAPI*){$IFDEF TAPI20}
(*TAPI*)function lineInitializeEx(                          { TAPI v2.0 }
(*TAPI*)	var lphLineApp: THLineApp;
(*TAPI*)	hInstance: HInst;
(*TAPI*)	lpfnCallback: TLineCallback;
(*TAPI*)	lpszFriendlyAppName: PChar;
(*TAPI*)	var lpdwNumDevs: Longint;
(*TAPI*)	var lpdwAPIVersion: Longint;
(*TAPI*)	var lpLineInitializeExParams: TLineInitializeExParams): Longint; stdcall;
(*TAPI*)
(*TAPI*)function lineInitializeExA(                         { TAPI v2.0 }
(*TAPI*)	var lphLineApp: THLineApp;
(*TAPI*)	hInstance: HInst;
(*TAPI*)	lpfnCallback: TLineCallback;
(*TAPI*)	lpszFriendlyAppName: PChar;
(*TAPI*)	var lpdwNumDevs: Longint;
(*TAPI*)  var lpdwAPIVersion: Longint;
(*TAPI*)  var lpLineInitializeExParams: TLineInitializeExParams): Longint; stdcall;
(*TAPI*)
(*TAPI*)function lineInitializeExW(                         { TAPI v2.0 }
(*TAPI*)  var lphLineApp: THLineApp;
(*TAPI*)  hInstance: HInst;
(*TAPI*)  lpfnCallback: TLineCallback;
(*TAPI*)  lpszFriendlyAppName: PWideChar;
(*TAPI*)  var lpdwNumDevs: Longint;
(*TAPI*)  var lpdwAPIVersion: Longint;
(*TAPI*)  var lpLineInitializeExParams: TLineInitializeExParams): Longint; stdcall;
(*TAPI*){$ENDIF}
(*TAPI*)
(*TAPI*)function lineMakeCall(
(*TAPI*)  hLine: THLine;
(*TAPI*)  var lphCall: THCall;
(*TAPI*)  lpszDestAddress: PChar;
(*TAPI*)  dwCountryCode: Longint;
(*TAPI*)  lpCallParams: LPLineCallParams): Longint;
(*TAPI*){$IFDEF WIN32}
(*TAPI*)  stdcall;
(*TAPI*){$ENDIF}
(*TAPI*)
(*TAPI*){$IFDEF WIN32}
(*TAPI*)function lineMakeCallA(
(*TAPI*)  hLine: THLine;
(*TAPI*)  var lphCall: THCall;
(*TAPI*)  lpszDestAddress: PChar;
(*TAPI*)  dwCountryCode: Longint;
(*TAPI*)  lpCallParams: LPLineCallParams): Longint; stdcall;
(*TAPI*)
(*TAPI*)function lineMakeCallW(
(*TAPI*)  hLine: THLine;
(*TAPI*)  var lphCall: THCall;
(*TAPI*)  lpszDestAddress: PWideChar;
(*TAPI*)  dwCountryCode: Longint;
(*TAPI*)  lpCallParams: LPLineCallParams): Longint; stdcall;
(*TAPI*){$ENDIF}
(*TAPI*)
(*TAPI*)function lineMonitorDigits(
(*TAPI*)  hCall: THCall;
(*TAPI*)  dwDigitModes: Longint): Longint;
(*TAPI*){$IFDEF WIN32}
(*TAPI*)  stdcall;
(*TAPI*){$ENDIF}
(*TAPI*)
(*TAPI*)function lineMonitorMedia(
(*TAPI*)  hCall: THCall;
(*TAPI*)  dwMediaModes: Longint): Longint;
(*TAPI*){$IFDEF WIN32}
(*TAPI*)  stdcall;
(*TAPI*){$ENDIF}
(*TAPI*)
(*TAPI*)function lineMonitorTones(
(*TAPI*)  hCall: THCall;
(*TAPI*)  lpToneList: LPLineMonitorTone;
(*TAPI*)  dwNumEntries: Longint): Longint;
(*TAPI*){$IFDEF WIN32}
(*TAPI*)  stdcall;
(*TAPI*){$ENDIF}
(*TAPI*)
(*TAPI*)function lineNegotiateAPIVersion(
(*TAPI*)  hLineApp: THLineApp;
(*TAPI*)  dwDeviceID: Longint;
(*TAPI*)  dwAPILowVersion: Longint;
(*TAPI*)  dwAPIHighVersion: Longint;
(*TAPI*)  var lpdwAPIVersion: Longint;
(*TAPI*)  var lpExtensionID: TLineExtensionID): Longint;
(*TAPI*){$IFDEF WIN32}
(*TAPI*)  stdcall;
(*TAPI*){$ENDIF}
(*TAPI*)
(*TAPI*)function lineNegotiateExtVersion(
(*TAPI*)  hLineApp: THLineApp;
(*TAPI*)  dwDeviceID: Longint;
(*TAPI*)  dwAPIVersion: Longint;
(*TAPI*)  dwExtLowVersion: Longint;
(*TAPI*)  dwExtHighVersion: Longint;
(*TAPI*)  var lpdwExtVersion: Longint): Longint;
(*TAPI*){$IFDEF WIN32}
(*TAPI*)  stdcall;
(*TAPI*){$ENDIF}
(*TAPI*)
(*TAPI*)function lineOpen(
(*TAPI*)  hLineApp: THLineApp;
(*TAPI*)  dwDeviceID: Longint;
(*TAPI*)  var lphLine: THLine;
(*TAPI*)  dwAPIVersion: Longint;
(*TAPI*)  dwExtVersion: Longint;
(*TAPI*)  dwCallbackInstance: Longint;
(*TAPI*)  dwPrivileges: Longint;
(*TAPI*)  dwMediaModes: Longint;
(*TAPI*)  lpCallParams: LPLineCallParams): Longint;
(*TAPI*){$IFDEF WIN32}
(*TAPI*)  stdcall;
(*TAPI*){$ENDIF}
(*TAPI*)
(*TAPI*){$IFDEF WIN32}
(*TAPI*)function lineOpenA(
(*TAPI*)  hLineApp: THLineApp;
(*TAPI*)  dwDeviceID: Longint;
(*TAPI*)  var lphLine: THLine;
(*TAPI*)  dwAPIVersion: Longint;
(*TAPI*)  dwExtVersion: Longint;
(*TAPI*)  dwCallbackInstance: Longint;
(*TAPI*)  dwPrivileges: Longint;
(*TAPI*)  dwMediaModes: Longint;
(*TAPI*)  lpCallParams: LPLineCallParams): Longint; stdcall;
(*TAPI*)
(*TAPI*)function lineOpenW(
(*TAPI*)  hLineApp: THLineApp;
(*TAPI*)  dwDeviceID: Longint;
(*TAPI*)  var lphLine: THLine;
(*TAPI*)  dwAPIVersion: Longint;
(*TAPI*)  dwExtVersion: Longint;
(*TAPI*)  dwCallbackInstance: Longint;
(*TAPI*)  dwPrivileges: Longint;
(*TAPI*)  dwMediaModes: Longint;
(*TAPI*)  lpCallParams: LPLineCallParams): Longint; stdcall;
(*TAPI*){$ENDIF}
(*TAPI*)
(*TAPI*)function linePark(
(*TAPI*)  hCall: THCall;
(*TAPI*)  dwParkMode: Longint;
(*TAPI*)  lpszDirAddress: PChar;
(*TAPI*)  lpNonDirAddress: LPVarString): Longint;
(*TAPI*){$IFDEF WIN32}
(*TAPI*)  stdcall;
(*TAPI*){$ENDIF}
(*TAPI*)
(*TAPI*){$IFDEF WIN32}
(*TAPI*)function lineParkA(
(*TAPI*)  hCall: THCall;
(*TAPI*)  dwParkMode: Longint;
(*TAPI*)  lpszDirAddress: PChar;
(*TAPI*)  lpNonDirAddress: LPVarString): Longint; stdcall;
(*TAPI*)
(*TAPI*)function lineParkW(
(*TAPI*)  hCall: THCall;
(*TAPI*)  dwParkMode: Longint;
(*TAPI*)  lpszDirAddress: PWideChar;
(*TAPI*)  lpNonDirAddress: LPVarString): Longint; stdcall;
(*TAPI*){$ENDIF}
(*TAPI*)
(*TAPI*)function linePickup(
(*TAPI*)  hLine: THLine;
(*TAPI*)  dwAddressID: Longint;
(*TAPI*)  var lphCall: THCall;
(*TAPI*)  lpszDestAddress: PChar;
(*TAPI*)  lpszGroupID: PChar): Longint;
(*TAPI*){$IFDEF WIN32}
(*TAPI*)  stdcall;
(*TAPI*){$ENDIF}
(*TAPI*)
(*TAPI*){$IFDEF WIN32}
(*TAPI*)function linePickupA(
(*TAPI*)  hLine: THLine;
(*TAPI*)  dwAddressID: Longint;
(*TAPI*)  var lphCall: THCall;
(*TAPI*)  lpszDestAddress: PChar;
(*TAPI*)  lpszGroupID: PChar): Longint; stdcall;
(*TAPI*)
(*TAPI*)function linePickupW(
(*TAPI*)  hLine: THLine;
(*TAPI*)  dwAddressID: Longint;
(*TAPI*)  var lphCall: THCall;
(*TAPI*)  lpszDestAddress: PWideChar;
(*TAPI*)  lpszGroupID: PWideChar): Longint; stdcall;
(*TAPI*){$ENDIF}
(*TAPI*)
(*TAPI*)function linePrepareAddToConference(
(*TAPI*)  hConfCall: THCall;
(*TAPI*)  var lphConsultCall: THCall;
(*TAPI*)  lpCallParams: LPLineCallParams): Longint;
(*TAPI*){$IFDEF WIN32}
(*TAPI*)  stdcall;
(*TAPI*){$ENDIF}
(*TAPI*)
(*TAPI*){$IFDEF WIN32}
(*TAPI*)function linePrepareAddToConferenceA(
(*TAPI*)  hConfCall: THCall;
(*TAPI*)  var lphConsultCall: THCall;
(*TAPI*)  lpCallParams: LPLineCallParams): Longint; stdcall;
(*TAPI*)
(*TAPI*)function linePrepareAddToConferenceW(
(*TAPI*)  hConfCall: THCall;
(*TAPI*)  var lphConsultCall: THCall;
(*TAPI*)  lpCallParams: LPLineCallParams): Longint; stdcall;
(*TAPI*){$ENDIF}
(*TAPI*)
(*TAPI*){$IFDEF TAPI20}
(*TAPI*)function lineProxyMessage(                          { TAPI v2.0 }
(*TAPI*)  hLine: THLine;
(*TAPI*)  hCall: THCall;
(*TAPI*)  dwMsg: Longint;
(*TAPI*)  dwParam1: Longint;
(*TAPI*)  dwParam2: Longint;
(*TAPI*)  dwParam3: Longint): Longint; stdcall;
(*TAPI*)
(*TAPI*)function lineProxyResponse(                         { TAPI v2.0 }
(*TAPI*)  hLine: THLine;
(*TAPI*)  var lpProxyRequest: TLineProxyRequest;
(*TAPI*)  dwResult: Longint): Longint; stdcall;
(*TAPI*){$ENDIF}
(*TAPI*)
(*TAPI*)function lineRedirect(
(*TAPI*)  hCall: THCall;
(*TAPI*)  lpszDestAddress: PChar;
(*TAPI*)  dwCountryCode: Longint): Longint;
(*TAPI*){$IFDEF WIN32}
(*TAPI*)  stdcall;
(*TAPI*){$ENDIF}
(*TAPI*)
(*TAPI*){$IFDEF WIN32}
(*TAPI*)function lineRedirectA(
(*TAPI*)  hCall: THCall;
(*TAPI*)  lpszDestAddress: PChar;
(*TAPI*)  dwCountryCode: Longint): Longint; stdcall;
(*TAPI*)
(*TAPI*)function lineRedirectW(
(*TAPI*)  hCall: THCall;
(*TAPI*)  lpszDestAddress: PWideChar;
(*TAPI*)  dwCountryCode: Longint): Longint; stdcall;
(*TAPI*){$ENDIF}
(*TAPI*)
(*TAPI*)function lineRegisterRequestRecipient(
(*TAPI*)  hLineApp: THLineApp;
(*TAPI*)  dwRegistrationInstance: Longint;
(*TAPI*)  dwRequestMode: Longint;
(*TAPI*)  bEnable: Longint): Longint;
(*TAPI*){$IFDEF WIN32}
(*TAPI*)  stdcall;
(*TAPI*){$ENDIF}
(*TAPI*)
(*TAPI*)function lineReleaseUserUserInfo(                   { TAPI v1.4 }
(*TAPI*)  hCall: THCall): Longint;
(*TAPI*){$IFDEF WIN32}
(*TAPI*)  stdcall;
(*TAPI*){$ENDIF}
(*TAPI*)
(*TAPI*)function lineRemoveFromConference(
(*TAPI*)    hCall: THCall): Longint;
(*TAPI*){$IFDEF WIN32}
(*TAPI*)  stdcall;
(*TAPI*){$ENDIF}
(*TAPI*)
(*TAPI*)function lineRemoveProvider(                        { TAPI v1.4 }
(*TAPI*)    dwPermanentProviderID: Longint;
(*TAPI*)    hwndOwner: HWnd): Longint;
(*TAPI*){$IFDEF WIN32}
(*TAPI*)  stdcall;
(*TAPI*){$ENDIF}
(*TAPI*)
(*TAPI*)function lineSecureCall(
(*TAPI*)    hCall: THCall): Longint;
(*TAPI*){$IFDEF WIN32}
(*TAPI*)  stdcall;
(*TAPI*){$ENDIF}
(*TAPI*)
(*TAPI*)function lineSendUserUserInfo(
(*TAPI*)    hCall: THCall;
(*TAPI*)    lpsUserUserInfo: PChar;
(*TAPI*)    dwSize: Longint): Longint;
(*TAPI*){$IFDEF WIN32}
(*TAPI*)  stdcall;
(*TAPI*){$ENDIF}
(*TAPI*)
(*TAPI*){$IFDEF TAPI20}
(*TAPI*)function lineSetAgentActivity(                      { TAPI v2.0 }
(*TAPI*)  hLine: THLine;
(*TAPI*)  dwAddressID: Longint;
(*TAPI*)  dwActivityID: Longint): Longint; stdcall;
(*TAPI*)
(*TAPI*)function lineSetAgentGroup(                         { TAPI v2.0 }
(*TAPI*)  hLine: THLine;
(*TAPI*)  dwAddressID: Longint;
(*TAPI*)  var lpAgentGroupList: TLineAgentGroupList): Longint; stdcall;
(*TAPI*)
(*TAPI*)function lineSetAgentState(                         { TAPI v2.0 }
(*TAPI*)  hLine: THLine;
(*TAPI*)  dwAddressID: Longint;
(*TAPI*)  dwAgentState: Longint;
(*TAPI*)  dwNextAgentState: Longint): Longint; stdcall;
(*TAPI*){$ENDIF}
(*TAPI*)
(*TAPI*)function lineSetAppPriority(                        { TAPI v1.4 }
(*TAPI*)  lpszAppFilename: PChar;
(*TAPI*)  dwMediaMode: Longint;
(*TAPI*)  lpExtensionID: LPLineExtensionID;
(*TAPI*)  dwRequestMode: Longint;
(*TAPI*)  lpszExtensionName: PChar;
(*TAPI*)  dwPriority: Longint): Longint;
(*TAPI*){$IFDEF WIN32}
(*TAPI*)  stdcall;
(*TAPI*){$ENDIF}
(*TAPI*)
(*TAPI*){$IFDEF WIN32}
(*TAPI*)function lineSetAppPriorityA(                       { TAPI v1.4 }
(*TAPI*)  lpszAppFilename: PChar;
(*TAPI*)  dwMediaMode: Longint;
(*TAPI*)  lpExtensionID: LPLineExtensionID;
(*TAPI*)  dwRequestMode: Longint;
(*TAPI*)  lpszExtensionName: PChar;
(*TAPI*)  dwPriority: Longint): Longint; stdcall;
(*TAPI*)
(*TAPI*)function lineSetAppPriorityW(                       { TAPI v1.4 }
(*TAPI*)  lpszAppFilename: PWideChar;
(*TAPI*)  dwMediaMode: Longint;
(*TAPI*)  lpExtensionID: LPLineExtensionID;
(*TAPI*)  dwRequestMode: Longint;
(*TAPI*)  lpszExtensionName: PWideChar;
(*TAPI*)  dwPriority: Longint): Longint; stdcall;
(*TAPI*){$ENDIF}
(*TAPI*)
(*TAPI*)function lineSetAppSpecific(
(*TAPI*)  hCall: THCall;
(*TAPI*)  dwAppSpecific: Longint): Longint;
(*TAPI*){$IFDEF WIN32}
(*TAPI*)  stdcall;
(*TAPI*){$ENDIF}
(*TAPI*)
(*TAPI*){$IFDEF TAPI20}
(*TAPI*)function lineSetCallData(                           { TAPI v2.0 }
(*TAPI*)  hCall: THCall;
(*TAPI*)  lpCallData: Pointer;
(*TAPI*)  dwSize: Longint): Longint; stdcall;
(*TAPI*){$ENDIF}
(*TAPI*)
(*TAPI*)function lineSetCallParams(
(*TAPI*)  hCall: THCall;
(*TAPI*)  dwBearerMode: Longint;
(*TAPI*)  dwMinRate: Longint;
(*TAPI*)  dwMaxRate: Longint;
(*TAPI*)  lpDialParams: LPLineDialParams): Longint;
(*TAPI*){$IFDEF WIN32}
(*TAPI*)  stdcall;
(*TAPI*){$ENDIF}
(*TAPI*)
(*TAPI*)function lineSetCallPrivilege(
(*TAPI*)  hCall: THCall;
(*TAPI*)  dwCallPrivilege: Longint): Longint;
(*TAPI*){$IFDEF WIN32}
(*TAPI*)  stdcall;
(*TAPI*){$ENDIF}
(*TAPI*)
(*TAPI*){$IFDEF TAPI20}
(*TAPI*)function lineSetCallQualityOfService(               { TAPI v2.0 }
(*TAPI*)  hCall: THCall;
(*TAPI*)  lpSendingFlowspec: Pointer;
(*TAPI*)  dwSendingFlowspecSize: Longint;
(*TAPI*)  lpReceivingFlowspec: Pointer;
(*TAPI*)  dwReceivingFlowspecSize: Longint): Longint; stdcall;
(*TAPI*)
(*TAPI*)function lineSetCallTreatment(                      { TAPI v2.0 }
(*TAPI*)  hCall: THCall;
(*TAPI*)  dwTreatment: Longint): Longint; stdcall;
(*TAPI*){$ENDIF}
(*TAPI*)
(*TAPI*)function lineSetCurrentLocation(
(*TAPI*)  hLineApp: THLineApp;
(*TAPI*)  dwLocation: Longint): Longint;
(*TAPI*){$IFDEF WIN32}
(*TAPI*)  stdcall;
(*TAPI*){$ENDIF}
(*TAPI*)
(*TAPI*)function lineSetDevConfig(
(*TAPI*)  dwDeviceID: Longint;
(*TAPI*)  lpDeviceConfig: Pointer;
(*TAPI*)  dwSize: Longint;
(*TAPI*)  lpszDeviceClass: PChar): Longint;
(*TAPI*){$IFDEF WIN32}
(*TAPI*)  stdcall;
(*TAPI*){$ENDIF}
(*TAPI*)
(*TAPI*){$IFDEF WIN32}
(*TAPI*)function lineSetDevConfigA(
(*TAPI*)  dwDeviceID: Longint;
(*TAPI*)  lpDeviceConfig: Pointer;
(*TAPI*)  dwSize: Longint;
(*TAPI*)  lpszDeviceClass: PChar): Longint; stdcall;
(*TAPI*)
(*TAPI*)function lineSetDevConfigW(
(*TAPI*)  dwDeviceID: Longint;
(*TAPI*)  lpDeviceConfig: Pointer;
(*TAPI*)  dwSize: Longint;
(*TAPI*)  lpszDeviceClass: PWideChar): Longint; stdcall;
(*TAPI*){$ENDIF}
(*TAPI*)
(*TAPI*){$IFDEF TAPI20}
(*TAPI*)function lineSetLineDevStatus(                      { TAPI v2.0 }
(*TAPI*)  hLine: THLine;
(*TAPI*)  dwStatusToChange: Longint;
(*TAPI*)  fStatus: Longint): Longint; stdcall;
(*TAPI*){$ENDIF}
(*TAPI*)
(*TAPI*)function lineSetMediaControl(
(*TAPI*)    hLine: THLine;
(*TAPI*)    dwAddressID: Longint;
(*TAPI*)    hCall: THCall;
(*TAPI*)    dwSelect: Longint;
(*TAPI*)    var lpDigitList: TLineMediaControlDigit;
(*TAPI*)    dwDigitNumEntries: Longint;
(*TAPI*)    var lpMediaList: TLineMediaControlMedia;
(*TAPI*)    dwMediaNumEntries: Longint;
(*TAPI*)    var lpToneList: TLineMediaControlTone;
(*TAPI*)    dwToneNumEntries: Longint;
(*TAPI*)    var lpCallStateList: TLineMediaControlCallState;
(*TAPI*)    dwCallStateNumEntries: Longint): Longint;
(*TAPI*){$IFDEF WIN32}
(*TAPI*)  stdcall;
(*TAPI*){$ENDIF}
(*TAPI*)
(*TAPI*)function lineSetMediaMode(
(*TAPI*)  hCall: THCall;
(*TAPI*)  dwMediaModes: Longint): Longint;
(*TAPI*){$IFDEF WIN32}
(*TAPI*)  stdcall;
(*TAPI*){$ENDIF}
(*TAPI*)
(*TAPI*)function lineSetNumRings(
(*TAPI*)  hLine: THLine;
(*TAPI*)  dwAddressID: Longint;
(*TAPI*)  dwNumRings: Longint): Longint;
(*TAPI*){$IFDEF WIN32}
(*TAPI*)  stdcall;
(*TAPI*){$ENDIF}
(*TAPI*)
(*TAPI*)function lineSetStatusMessages(
(*TAPI*)  hLine: THLine;
(*TAPI*)  dwLineStates: Longint;
(*TAPI*)  dwAddressStates: Longint): Longint;
(*TAPI*){$IFDEF WIN32}
(*TAPI*)  stdcall;
(*TAPI*){$ENDIF}
(*TAPI*)
(*TAPI*)function lineSetTerminal(
(*TAPI*)  hLine: THLine;
(*TAPI*)  dwAddressID: Longint;
(*TAPI*)  hCall: THCall;
(*TAPI*)  dwSelect: Longint;
(*TAPI*)  dwTerminalModes: Longint;
(*TAPI*)  dwTerminalID: Longint;
(*TAPI*)  bEnable: Longint): Longint;
(*TAPI*){$IFDEF WIN32}
(*TAPI*)  stdcall;
(*TAPI*){$ENDIF}
(*TAPI*)
(*TAPI*)function lineSetTollList(
(*TAPI*)  hLineApp: THLineApp;
(*TAPI*)  dwDeviceID: Longint;
(*TAPI*)  lpszAddressIn: PChar;
(*TAPI*)  dwTollListOption: Longint): Longint;
(*TAPI*){$IFDEF WIN32}
(*TAPI*)  stdcall;
(*TAPI*){$ENDIF}
(*TAPI*)
(*TAPI*){$IFDEF WIN32}
(*TAPI*)function lineSetTollListA(
(*TAPI*)  hLineApp: THLineApp;
(*TAPI*)  dwDeviceID: Longint;
(*TAPI*)  lpszAddressIn: PChar;
(*TAPI*)  dwTollListOption: Longint): Longint; stdcall;
(*TAPI*)
(*TAPI*)function lineSetTollListW(
(*TAPI*)  hLineApp: THLineApp;
(*TAPI*)  dwDeviceID: Longint;
(*TAPI*)  lpszAddressInW: PWideChar;
(*TAPI*)  dwTollListOption: Longint): Longint; stdcall;
(*TAPI*){$ENDIF}
(*TAPI*)
(*TAPI*)function lineSetupConference(
(*TAPI*)  hCall: THCall;
(*TAPI*)  hLine: THLine;
(*TAPI*)  var lphConfCall: THCall;
(*TAPI*)  var lphConsultCall: THCall;
(*TAPI*)  dwNumParties: Longint;
(*TAPI*)  lpCallParams: LPLineCallParams): Longint;
(*TAPI*){$IFDEF WIN32}
(*TAPI*)  stdcall;
(*TAPI*){$ENDIF}
(*TAPI*)
(*TAPI*){$IFDEF WIN32}
(*TAPI*)function lineSetupConferenceA(
(*TAPI*)  hCall: THCall;
(*TAPI*)  hLine: THLine;
(*TAPI*)  var lphConfCall: THCall;
(*TAPI*)  var lphConsultCall: THCall;
(*TAPI*)  dwNumParties: Longint;
(*TAPI*)  lpCallParams: LPLineCallParams): Longint; stdcall;
(*TAPI*)
(*TAPI*)function lineSetupConferenceW(
(*TAPI*)  hCall: THCall;
(*TAPI*)  hLine: THLine;
(*TAPI*)  var lphConfCall: THCall;
(*TAPI*)  var lphConsultCall: THCall;
(*TAPI*)  dwNumParties: Longint;
(*TAPI*)  lpCallParams: LPLineCallParams): Longint; stdcall;
(*TAPI*){$ENDIF}
(*TAPI*)
(*TAPI*)function lineSetupTransfer(
(*TAPI*)  hCall: THCall;
(*TAPI*)  var lphConsultCall: THCall;
(*TAPI*)  lpCallParams: LPLineCallParams): Longint;
(*TAPI*){$IFDEF WIN32}
(*TAPI*)  stdcall;
(*TAPI*){$ENDIF}
(*TAPI*)
(*TAPI*){$IFDEF WIN32}
(*TAPI*)function lineSetupTransferA(
(*TAPI*)  hCall: THCall;
(*TAPI*)  var lphConsultCall: THCall;
(*TAPI*)  lpCallParams: LPLineCallParams): Longint; stdcall;
(*TAPI*)
(*TAPI*)function lineSetupTransferW(
(*TAPI*)  hCall: THCall;
(*TAPI*)  var lphConsultCall: THCall;
(*TAPI*)  lpCallParams: LPLineCallParams): Longint; stdcall;
(*TAPI*){$ENDIF}
(*TAPI*)
(*TAPI*)function lineShutdown(
(*TAPI*)  hLineApp: THLineApp): Longint;
(*TAPI*){$IFDEF WIN32}
(*TAPI*)  stdcall;
(*TAPI*){$ENDIF}
(*TAPI*)
(*TAPI*)function lineSwapHold(
(*TAPI*)  hActiveCall: THCall;
(*TAPI*)  hHeldCall: THCall): Longint;
(*TAPI*){$IFDEF WIN32}
(*TAPI*)  stdcall;
(*TAPI*){$ENDIF}
(*TAPI*)
(*TAPI*)function lineTranslateAddress(
(*TAPI*)  hLineApp: THLineApp;
(*TAPI*)  dwDeviceID: Longint;
(*TAPI*)  dwAPIVersion: Longint;
(*TAPI*)  lpszAddressIn: PChar;
(*TAPI*)  dwCard: Longint;
(*TAPI*)  dwTranslateOptions: Longint;
(*TAPI*)  var lpTranslateOutput: TLineTranslateOutput): Longint;
(*TAPI*){$IFDEF WIN32}
(*TAPI*)  stdcall;
(*TAPI*){$ENDIF}
(*TAPI*)
(*TAPI*){$IFDEF WIN32}
(*TAPI*)function lineTranslateAddressA(
(*TAPI*)  hLineApp: THLineApp;
(*TAPI*)  dwDeviceID: Longint;
(*TAPI*)  dwAPIVersion: Longint;
(*TAPI*)  lpszAddressIn: PChar;
(*TAPI*)  dwCard: Longint;
(*TAPI*)  dwTranslateOptions: Longint;
(*TAPI*)  var lpTranslateOutput: TLineTranslateOutput): Longint; stdcall;
(*TAPI*)
(*TAPI*)function lineTranslateAddressW(
(*TAPI*)  hLineApp: THLineApp;
(*TAPI*)  dwDeviceID: Longint;
(*TAPI*)  dwAPIVersion: Longint;
(*TAPI*)  lpszAddressIn: PWideChar;
(*TAPI*)  dwCard: Longint;
(*TAPI*)  dwTranslateOptions: Longint;
(*TAPI*)  var lpTranslateOutput: TLineTranslateOutput): Longint; stdcall;
(*TAPI*){$ENDIF}
(*TAPI*)
(*TAPI*)function lineTranslateDialog(                       { TAPI v1.4 }
(*TAPI*)  hLineApp: THLineApp;
(*TAPI*)  dwDeviceID: Longint;
(*TAPI*)  dwAPIVersion: Longint;
(*TAPI*)  hwndOwner: HWnd;
(*TAPI*)  lpszAddressIn: PChar): Longint;
(*TAPI*){$IFDEF WIN32}
(*TAPI*)  stdcall;
(*TAPI*){$ENDIF}
(*TAPI*)
(*TAPI*){$IFDEF WIN32}
(*TAPI*)function lineTranslateDialogA(                      { TAPI v1.4 }
(*TAPI*)  hLineApp: THLineApp;
(*TAPI*)  dwDeviceID: Longint;
(*TAPI*)  dwAPIVersion: Longint;
(*TAPI*)  hwndOwner: HWnd;
(*TAPI*)  lpszAddressIn: PChar): Longint; stdcall;
(*TAPI*)
(*TAPI*)function lineTranslateDialogW(
(*TAPI*)  hLineApp: THLineApp;
(*TAPI*)  dwDeviceID: Longint;
(*TAPI*)  dwAPIVersion: Longint;
(*TAPI*)  hwndOwner: HWnd;
(*TAPI*)  lpszAddressIn: PWideChar): Longint; stdcall;
(*TAPI*){$ENDIF}
(*TAPI*)
(*TAPI*)function lineUncompleteCall(
(*TAPI*)  hLine: THLine;
(*TAPI*)  dwCompletionID: Longint): Longint;
(*TAPI*){$IFDEF WIN32}
(*TAPI*)  stdcall;
(*TAPI*){$ENDIF}
(*TAPI*)
(*TAPI*)function lineUnhold(
(*TAPI*)  hCall: THCall): Longint;
(*TAPI*){$IFDEF WIN32}
(*TAPI*)  stdcall;
(*TAPI*){$ENDIF}
(*TAPI*)
(*TAPI*)function lineUnpark(
(*TAPI*)  hLine: THLine;
(*TAPI*)  dwAddressID: Longint;
(*TAPI*)  var lphCall: THCall;
(*TAPI*)  lpszDestAddress: PChar): Longint;
(*TAPI*){$IFDEF WIN32}
(*TAPI*)  stdcall;
(*TAPI*){$ENDIF}
(*TAPI*)
(*TAPI*){$IFDEF WIN32}
(*TAPI*)function lineUnparkA(
(*TAPI*)  hLine: THLine;
(*TAPI*)  dwAddressID: Longint;
(*TAPI*)  var lphCall: THCall;
(*TAPI*)  lpszDestAddress: PChar): Longint; stdcall;
(*TAPI*)
(*TAPI*)function lineUnparkW(
(*TAPI*)  hLine: THLine;
(*TAPI*)  dwAddressID: Longint;
(*TAPI*)  var lphCall: THCall;
(*TAPI*)  lpszDestAddress: PWideChar): Longint; stdcall;
(*TAPI*){$ENDIF}
(*TAPI*)
(*TAPI*)function phoneClose(
(*TAPI*)  hPhone: THPhone): Longint;
(*TAPI*){$IFDEF WIN32}
(*TAPI*)  stdcall;
(*TAPI*){$ENDIF}
(*TAPI*)
(*TAPI*)function phoneConfigDialog(
(*TAPI*)  dwDeviceID: Longint;
(*TAPI*)  hwndOwner: HWnd;
(*TAPI*)  lpszDeviceClass: PChar): Longint;
(*TAPI*){$IFDEF WIN32}
(*TAPI*)  stdcall;
(*TAPI*){$ENDIF}
(*TAPI*)
(*TAPI*){$IFDEF WIN32}
(*TAPI*)function phoneConfigDialogA(
(*TAPI*)  dwDeviceID: Longint;
(*TAPI*)  hwndOwner: HWnd;
(*TAPI*)  lpszDeviceClass: PChar): Longint; stdcall;
(*TAPI*)
(*TAPI*)function phoneConfigDialogW(
(*TAPI*)  dwDeviceID: Longint;
(*TAPI*)  hwndOwner: HWnd;
(*TAPI*)  lpszDeviceClass: PWideChar): Longint; stdcall;
(*TAPI*){$ENDIF}
(*TAPI*)
(*TAPI*)function phoneDevSpecific(
(*TAPI*)  hPhone: THPhone;
(*TAPI*)  lpParams: Pointer;
(*TAPI*)  dwSize: Longint): Longint;
(*TAPI*){$IFDEF WIN32}
(*TAPI*)  stdcall;
(*TAPI*){$ENDIF}
(*TAPI*)
(*TAPI*)function phoneGetButtonInfo(
(*TAPI*)  hPhone: THPhone;
(*TAPI*)  dwButtonLampID: Longint;
(*TAPI*)  var lpButtonInfo: TPhoneButtonInfo): Longint;
(*TAPI*){$IFDEF WIN32}
(*TAPI*)  stdcall;
(*TAPI*){$ENDIF}
(*TAPI*)
(*TAPI*){$IFDEF WIN32}
(*TAPI*)function phoneGetButtonInfoA(
(*TAPI*)  hPhone: THPhone;
(*TAPI*)  dwButtonLampID: Longint;
(*TAPI*)  var lpButtonInfo: TPhoneButtonInfo): Longint; stdcall;
(*TAPI*)
(*TAPI*)function phoneGetButtonInfoW(
(*TAPI*)  hPhone: THPhone;
(*TAPI*)  dwButtonLampID: Longint;
(*TAPI*)  var lpButtonInfo: TPhoneButtonInfo): Longint; stdcall;
(*TAPI*){$ENDIF}
(*TAPI*)
(*TAPI*)function phoneGetData(
(*TAPI*)  hPhone: THPhone;
(*TAPI*)  dwDataID: Longint;
(*TAPI*)  lpData: Pointer;
(*TAPI*)  dwSize: Longint): Longint;
(*TAPI*){$IFDEF WIN32}
(*TAPI*)  stdcall;
(*TAPI*){$ENDIF}
(*TAPI*)
(*TAPI*)function phoneGetDevCaps(
(*TAPI*)  hPhoneApp: THPhoneApp;
(*TAPI*)  dwDeviceID: Longint;
(*TAPI*)  dwAPIVersion: Longint;
(*TAPI*)  dwExtVersion: Longint;
(*TAPI*)  var lpPhoneCaps: TPhoneCaps): Longint;
(*TAPI*){$IFDEF WIN32}
(*TAPI*)  stdcall;
(*TAPI*){$ENDIF}
(*TAPI*)
(*TAPI*){$IFDEF WIN32}
(*TAPI*)function phoneGetDevCapsA(
(*TAPI*)  hPhoneApp: THPhoneApp;
(*TAPI*)  dwDeviceID: Longint;
(*TAPI*)  dwAPIVersion: Longint;
(*TAPI*)  dwExtVersion: Longint;
(*TAPI*)  var lpPhoneCaps: TPhoneCaps): Longint; stdcall;
(*TAPI*)
(*TAPI*)function phoneGetDevCapsW(
(*TAPI*)  hPhoneApp: THPhoneApp;
(*TAPI*)  dwDeviceID: Longint;
(*TAPI*)  dwAPIVersion: Longint;
(*TAPI*)  dwExtVersion: Longint;
(*TAPI*)  var lpPhoneCaps: TPhoneCaps): Longint; stdcall;
(*TAPI*){$ENDIF}
(*TAPI*)
(*TAPI*)function phoneGetDisplay(
(*TAPI*)  hPhone: THPhone;
(*TAPI*)  var lpDisplay: TVarString): Longint;
(*TAPI*){$IFDEF WIN32}
(*TAPI*)  stdcall;
(*TAPI*){$ENDIF}
(*TAPI*)
(*TAPI*)function phoneGetGain(
(*TAPI*)  hPhone: THPhone;
(*TAPI*)  dwHookSwitchDev: Longint;
(*TAPI*)  var lpdwGain: Longint): Longint;
(*TAPI*){$IFDEF WIN32}
(*TAPI*)  stdcall;
(*TAPI*){$ENDIF}
(*TAPI*)
(*TAPI*)function phoneGetHookSwitch(
(*TAPI*)  hPhone: THPhone;
(*TAPI*)  lpdwHookSwitchDevs: Longint): Longint;
(*TAPI*){$IFDEF WIN32}
(*TAPI*)  stdcall;
(*TAPI*){$ENDIF}
(*TAPI*)
(*TAPI*)function phoneGetIcon(
(*TAPI*)  dwDeviceID: Longint;
(*TAPI*)  lpszDeviceClass: PChar;
(*TAPI*)  var lphIcon: HIcon): Longint;
(*TAPI*){$IFDEF WIN32}
(*TAPI*)  stdcall;
(*TAPI*){$ENDIF}
(*TAPI*)
(*TAPI*){$IFDEF WIN32}
(*TAPI*)function phoneGetIconA(
(*TAPI*)  dwDeviceID: Longint;
(*TAPI*)  lpszDeviceClass: PChar;
(*TAPI*)  var lphIcon: HIcon): Longint; stdcall;
(*TAPI*)
(*TAPI*)function phoneGetIconW(
(*TAPI*)  dwDeviceID: Longint;
(*TAPI*)  lpszDeviceClass: PWideChar;
(*TAPI*)  var lphIcon: HIcon): Longint; stdcall;
(*TAPI*){$ENDIF}
(*TAPI*)
(*TAPI*)function phoneGetID(
(*TAPI*)  hPhone: THPhone;
(*TAPI*)  var lpDeviceID: TVarString;
(*TAPI*)  lpszDeviceClass: PChar): Longint;
(*TAPI*){$IFDEF WIN32}
(*TAPI*)  stdcall;
(*TAPI*){$ENDIF}
(*TAPI*)
(*TAPI*){$IFDEF WIN32}
(*TAPI*)function phoneGetIDA(
(*TAPI*)  hPhone: THPhone;
(*TAPI*)  var lpDeviceID: TVarString;
(*TAPI*)  lpszDeviceClass: PChar): Longint; stdcall;
(*TAPI*)
(*TAPI*)function phoneGetIDW(
(*TAPI*)  hPhone: THPhone;
(*TAPI*)  var lpDeviceID: TVarString;
(*TAPI*)  lpszDeviceClass: PWideChar): Longint; stdcall;
(*TAPI*){$ENDIF}
(*TAPI*)
(*TAPI*)function phoneGetLamp(
(*TAPI*)  hPhone: THPhone;
(*TAPI*)  dwButtonLampID: Longint;
(*TAPI*)  var lpdwLampMode: Longint): Longint;
(*TAPI*){$IFDEF WIN32}
(*TAPI*)  stdcall;
(*TAPI*){$ENDIF}
(*TAPI*)
(*TAPI*){$IFDEF TAPI20}
(*TAPI*)function phoneGetMessage(                           { TAPI v2.0 }
(*TAPI*)  hPhoneApp: THPhoneApp;
(*TAPI*)  var lpMessage: TPhoneMessage;
(*TAPI*)  dwTimeout: Longint): Longint; stdcall;
(*TAPI*){$ENDIF}
(*TAPI*)
(*TAPI*)function phoneGetRing(
(*TAPI*)  hPhone: THPhone;
(*TAPI*)  var lpdwRingMode: Longint;
(*TAPI*)  var lpdwVolume: Longint): Longint;
(*TAPI*){$IFDEF WIN32}
(*TAPI*)  stdcall;
(*TAPI*){$ENDIF}
(*TAPI*)
(*TAPI*)function phoneGetStatus(
(*TAPI*)  hPhone: THPhone;
(*TAPI*)  var lpPhoneStatus: TPhoneStatus): Longint;
(*TAPI*){$IFDEF WIN32}
(*TAPI*)  stdcall;
(*TAPI*){$ENDIF}
(*TAPI*)
(*TAPI*){$IFDEF WIN32}
(*TAPI*)function phoneGetStatusA(
(*TAPI*)  hPhone: THPhone;
(*TAPI*)  var lpPhoneStatus: TPhoneStatus): Longint; stdcall;
(*TAPI*)
(*TAPI*)function phoneGetStatusW(
(*TAPI*)  hPhone: THPhone;
(*TAPI*)  var lpPhoneStatus: TPhoneStatus): Longint; stdcall;
(*TAPI*){$ENDIF}
(*TAPI*)
(*TAPI*)function phoneGetStatusMessages(
(*TAPI*)  hPhone: THPhone;
(*TAPI*)  var lpdwPhoneStates: Longint;
(*TAPI*)  var lpdwButtonModes: Longint;
(*TAPI*)  var lpdwButtonStates: Longint): Longint;
(*TAPI*){$IFDEF WIN32}
(*TAPI*)  stdcall;
(*TAPI*){$ENDIF}
(*TAPI*)
(*TAPI*)function phoneGetVolume(
(*TAPI*)  hPhone: THPhone;
(*TAPI*)  dwHookSwitchDev: Longint;
(*TAPI*)  var lpdwVolume: Longint): Longint;
(*TAPI*){$IFDEF WIN32}
(*TAPI*)  stdcall;
(*TAPI*){$ENDIF}
(*TAPI*)
(*TAPI*)function phoneInitialize(
(*TAPI*)  var lphPhoneApp: THPhoneApp;
(*TAPI*)  hInstance: HInst;
(*TAPI*)  lpfnCallback: TPhoneCallback;
(*TAPI*)  lpszAppName: PChar;
(*TAPI*)  var lpdwNumDevs: Longint): Longint;
(*TAPI*){$IFDEF WIN32}
(*TAPI*)  stdcall;
(*TAPI*){$ENDIF}
(*TAPI*)
(*TAPI*){$IFDEF TAPI20}
(*TAPI*)function phoneInitializeEx(                         { TAPI v2.0 }
(*TAPI*)  var lphPhoneApp: THPhoneApp;
(*TAPI*)  hInstance: HInst;
(*TAPI*)  lpfnCallback: TPhoneCallback;
(*TAPI*)  lpszFriendlyAppName: PChar;
(*TAPI*)  var lpdwNumDevs: Longint;
(*TAPI*)  var lpdwAPIVersion: Longint;
(*TAPI*)  var lpPhoneInitializeExParams: TPhoneInitializeExParams): Longint; stdcall;
(*TAPI*)
(*TAPI*)function phoneInitializeExA(                        { TAPI v2.0 }
(*TAPI*)  var lphPhoneApp: THPhoneApp;
(*TAPI*)  hInstance: HInst;
(*TAPI*)  lpfnCallback: TPhoneCallback;
(*TAPI*)  lpszFriendlyAppName: PChar;
(*TAPI*)  var lpdwNumDevs: Longint;
(*TAPI*)  var lpdwAPIVersion: Longint;
(*TAPI*)  var lpPhoneInitializeExParams: TPhoneInitializeExParams): Longint; stdcall;
(*TAPI*)
(*TAPI*)function phoneInitializeExW(                        { TAPI v2.0 }
(*TAPI*)  var lphPhoneApp: THPhoneApp;
(*TAPI*)  hInstance: HInst;
(*TAPI*)  lpfnCallback: TPhoneCallback;
(*TAPI*)  lpszFriendlyAppName: PWideChar;
(*TAPI*)  var lpdwNumDevs: Longint;
(*TAPI*)  var lpdwAPIVersion: Longint;
(*TAPI*)  var lpPhoneInitializeExParams: TPhoneInitializeExParams): Longint; stdcall;
(*TAPI*){$ENDIF}
(*TAPI*)
(*TAPI*)function phoneNegotiateAPIVersion(
(*TAPI*)  hPhoneApp: THPhoneApp;
(*TAPI*)  dwDeviceID: Longint;
(*TAPI*)  dwAPILowVersion: Longint;
(*TAPI*)  dwAPIHighVersion: Longint;
(*TAPI*)  var lpdwAPIVersion: Longint;
(*TAPI*)  var lpExtensionID: TPhoneExtensionID): Longint;
(*TAPI*){$IFDEF WIN32}
(*TAPI*)  stdcall;
(*TAPI*){$ENDIF}
(*TAPI*)
(*TAPI*)function phoneNegotiateExtVersion(
(*TAPI*)  hPhoneApp: THPhoneApp;
(*TAPI*)  dwDeviceID: Longint;
(*TAPI*)  dwAPIVersion: Longint;
(*TAPI*)  dwExtLowVersion: Longint;
(*TAPI*)  dwExtHighVersion: Longint;
(*TAPI*)  var lpdwExtVersion: Longint): Longint;
(*TAPI*){$IFDEF WIN32}
(*TAPI*)  stdcall;
(*TAPI*){$ENDIF}
(*TAPI*)
(*TAPI*)function phoneOpen(
(*TAPI*)  hPhoneApp: THPhoneApp;
(*TAPI*)  dwDeviceID: Longint;
(*TAPI*)  var lphPhone: THPhone;
(*TAPI*)  dwAPIVersion: Longint;
(*TAPI*)  dwExtVersion: Longint;
(*TAPI*)  dwCallbackInstance: Longint;
(*TAPI*)  dwPrivilege: Longint): Longint;
(*TAPI*){$IFDEF WIN32}
(*TAPI*)  stdcall;
(*TAPI*){$ENDIF}
(*TAPI*)
(*TAPI*)function phoneSetButtonInfo(
(*TAPI*)  hPhone: THPhone;
(*TAPI*)  dwButtonLampID: Longint;
(*TAPI*)  var lpButtonInfo: TPhoneButtonInfo): Longint;
(*TAPI*){$IFDEF WIN32}
(*TAPI*)  stdcall;
(*TAPI*){$ENDIF}
(*TAPI*)
(*TAPI*){$IFDEF WIN32}
(*TAPI*)function phoneSetButtonInfoA(
(*TAPI*)  hPhone: THPhone;
(*TAPI*)  dwButtonLampID: Longint;
(*TAPI*)  var lpButtonInfo: TPhoneButtonInfo): Longint; stdcall;
(*TAPI*)
(*TAPI*)function phoneSetButtonInfoW(
(*TAPI*)  hPhone: THPhone;
(*TAPI*)  dwButtonLampID: Longint;
(*TAPI*)  var lpButtonInfo: TPhoneButtonInfo): Longint; stdcall;
(*TAPI*){$ENDIF}
(*TAPI*)
(*TAPI*)function phoneSetData(
(*TAPI*)  hPhone: THPhone;
(*TAPI*)  dwDataID: Longint;
(*TAPI*)  lpData: Pointer;
(*TAPI*)  dwSize: Longint): Longint;
(*TAPI*){$IFDEF WIN32}
(*TAPI*)  stdcall;
(*TAPI*){$ENDIF}
(*TAPI*)
(*TAPI*)function phoneSetDisplay(
(*TAPI*)  hPhone: THPhone;
(*TAPI*)  dwRow: Longint;
(*TAPI*)  dwColumn: Longint;
(*TAPI*)  lpsDisplay: PChar;
(*TAPI*)  dwSize: Longint): Longint;
(*TAPI*){$IFDEF WIN32}
(*TAPI*)  stdcall;
(*TAPI*){$ENDIF}
(*TAPI*)
(*TAPI*)function phoneSetGain(
(*TAPI*)  hPhone: THPhone;
(*TAPI*)  dwHookSwitchDev: Longint;
(*TAPI*)  dwGain: Longint): Longint;
(*TAPI*){$IFDEF WIN32}
(*TAPI*)  stdcall;
(*TAPI*){$ENDIF}
(*TAPI*)
(*TAPI*)function phoneSetHookSwitch(
(*TAPI*)  hPhone: THPhone;
(*TAPI*)  dwHookSwitchDevs: Longint;
(*TAPI*)  dwHookSwitchMode: Longint): Longint;
(*TAPI*){$IFDEF WIN32}
(*TAPI*)  stdcall;
(*TAPI*){$ENDIF}
(*TAPI*)
(*TAPI*)function phoneSetLamp(
(*TAPI*)  hPhone: THPhone;
(*TAPI*)  dwButtonLampID: Longint;
(*TAPI*)  dwLampMode: Longint): Longint;
(*TAPI*){$IFDEF WIN32}
(*TAPI*)  stdcall;
(*TAPI*){$ENDIF}
(*TAPI*)
(*TAPI*)function phoneSetRing(
(*TAPI*)  hPhone: THPhone;
(*TAPI*)  dwRingMode: Longint;
(*TAPI*)  dwVolume: Longint): Longint;
(*TAPI*){$IFDEF WIN32}
(*TAPI*)  stdcall;
(*TAPI*){$ENDIF}
(*TAPI*)
(*TAPI*)function phoneSetStatusMessages(
(*TAPI*)  hPhone: THPhone;
(*TAPI*)  dwPhoneStates: Longint;
(*TAPI*)  dwButtonModes: Longint;
(*TAPI*)  dwButtonStates: Longint): Longint;
(*TAPI*){$IFDEF WIN32}
(*TAPI*)  stdcall;
(*TAPI*){$ENDIF}
(*TAPI*)
(*TAPI*)function phoneSetVolume(
(*TAPI*)  hPhone: THPhone;
(*TAPI*)  dwHookSwitchDev: Longint;
(*TAPI*)  dwVolume: Longint): Longint;
(*TAPI*){$IFDEF WIN32}
(*TAPI*)  stdcall;
(*TAPI*){$ENDIF}
(*TAPI*)
(*TAPI*)function phoneShutdown(
(*TAPI*)  hPhoneApp: THPhoneApp): Longint;
(*TAPI*){$IFDEF WIN32}
(*TAPI*)  stdcall;
(*TAPI*){$ENDIF}
(*TAPI*)
(*TAPI*)function tapiGetLocationInfo(
(*TAPI*)  lpszCountryCode: PChar;
(*TAPI*)  lpszCityCode: PChar): Longint;
(*TAPI*){$IFDEF WIN32}
(*TAPI*)  stdcall;
(*TAPI*){$ENDIF}
(*TAPI*)
(*TAPI*){$IFDEF WIN32}
(*TAPI*)function tapiGetLocationInfoA(
(*TAPI*)  lpszCountryCode: PChar;
(*TAPI*)  lpszCityCode: PChar): Longint; stdcall;
(*TAPI*)
(*TAPI*)function tapiGetLocationInfoW(
(*TAPI*)    lpszCountryCodeW: PWideChar;
(*TAPI*)    lpszCityCodeW: PWideChar): Longint; stdcall;
(*TAPI*){$ENDIF}
(*TAPI*)
(*TAPI*)function tapiRequestDrop(
(*TAPI*)  hwnd: HWnd;
(*TAPI*)  wRequestID: WParam): Longint;
(*TAPI*){$IFDEF WIN32}
(*TAPI*)  stdcall;
(*TAPI*){$ENDIF}
(*TAPI*)
(*TAPI*)function tapiRequestMakeCall(
(*TAPI*)  lpszDestAddress: PChar;
(*TAPI*)  lpszAppName: PChar;
(*TAPI*)  lpszCalledParty: PChar;
(*TAPI*)  lpszComment: PChar): Longint;
(*TAPI*){$IFDEF WIN32}
(*TAPI*)  stdcall;
(*TAPI*){$ENDIF}
(*TAPI*)
(*TAPI*){$IFDEF WIN32}
(*TAPI*)function tapiRequestMakeCallA(
(*TAPI*)  lpszDestAddress: PChar;
(*TAPI*)  lpszAppName: PChar;
(*TAPI*)  lpszCalledParty: PChar;
(*TAPI*)  lpszComment: PChar): Longint; stdcall;
(*TAPI*)
(*TAPI*)function tapiRequestMakeCallW(
(*TAPI*)  lpszDestAddress: PWideChar;
(*TAPI*)  lpszAppName: PWideChar;
(*TAPI*)  lpszCalledParty: PWideChar;
(*TAPI*)  lpszComment: PWideChar): Longint; stdcall;
(*TAPI*){$ENDIF}
(*TAPI*)
(*TAPI*)function tapiRequestMediaCall(
(*TAPI*)  hwnd: HWnd;
(*TAPI*)  wRequestID: WParam;
(*TAPI*)  lpszDeviceClass: PChar;
(*TAPI*)  lpDeviceID: PChar;
(*TAPI*)  dwSize: Longint;
(*TAPI*)  dwSecure: Longint;
(*TAPI*)  lpszDestAddress: PChar;
(*TAPI*)  lpszAppName: PChar;
(*TAPI*)  lpszCalledParty: PChar;
(*TAPI*)  lpszComment: PChar): Longint;
(*TAPI*){$IFDEF WIN32}
(*TAPI*)  stdcall;
(*TAPI*){$ENDIF}
(*TAPI*)
(*TAPI*){$IFDEF WIN32}
(*TAPI*)function tapiRequestMediaCallA(
(*TAPI*)  hwnd: HWnd;
(*TAPI*)  wRequestID: WParam;
(*TAPI*)  lpszDeviceClass: PChar;
(*TAPI*)  lpDeviceID: PChar;
(*TAPI*)  dwSize: Longint;
(*TAPI*)  dwSecure: Longint;
(*TAPI*)  lpszDestAddress: PChar;
(*TAPI*)  lpszAppName: PChar;
(*TAPI*)  lpszCalledParty: PChar;
(*TAPI*)  lpszComment: PChar): Longint; stdcall;
(*TAPI*)
(*TAPI*)function tapiRequestMediaCallW(
(*TAPI*)  hwnd: HWnd;
(*TAPI*)  wRequestID: WParam;
(*TAPI*)  lpszDeviceClass: PWideChar;
(*TAPI*)  lpDeviceID: PWideChar;
(*TAPI*)  dwSize: Longint;
(*TAPI*)  dwSecure: Longint;
(*TAPI*)  lpszDestAddress: PWideChar;
(*TAPI*)  lpszAppName: PWideChar;
(*TAPI*)  lpszCalledParty: PWideChar): Longint; stdcall;
(*TAPI*){$ENDIF}
(*TAPI*)
(*TAPI*){
(*TAPI*)
(*TAPI*)TAPIERROR_FORMATMESSAGE - macro to convert a TAPI error constant
(*TAPI*)    into a constant that FormatMessage will accept
(*TAPI*)
(*TAPI*)        TAPIERR : Negative numbers and 0
(*TAPI*)            Map to : strip off high WORD
(*TAPI*)            Example: 0xFFFFFFFF (-1) becomes 0x0000FFFF
(*TAPI*)        LINEERR : Start at 0x80000000
(*TAPI*)            Map to : strip off 0x80000000 and add 0xE000
(*TAPI*)            Example: 0x80000004 becomes 0x0000E004
(*TAPI*)        PHONEERR: Start at 0x90000000
(*TAPI*)            Map to : strip off 0x90000000 and add 0xF000
(*TAPI*)            Example: 0x9000000A becomes 0x0000F00A
(*TAPI*)
(*TAPI*)        pseudocode:
(*TAPI*)
(*TAPI*)        if (__ErrCode__ is a TAPIERR)
(*TAPI*)            strip off high word
(*TAPI*)
(*TAPI*)            else if (__ErrCode__ is a PHONEERR)
(*TAPI*)                strip off 0x90000000
(*TAPI*)                add 0xE000
(*TAPI*)
(*TAPI*)                else
(*TAPI*)                    strip off 0x80000000
(*TAPI*)                    add 0xF000
(*TAPI*)}
(*TAPI*)
(*TAPI*)
(*TAPI*)function TAPIERROR_FORMATMESSAGE (ErrCode: Longint): Longint;
(*TAPI*) {$A+}

type
  TOnEntryGet   = procedure (Sender : TObject; EntryName : Array of {Ansi}Char) of Object;
  TStandartEv   = procedure (Sender : TObject) of object;
  TOnNotConn    = procedure (Sender : TObject; ErrorCode : Integer; ErrorMessage : String) of object;
  TOnAsyncEvent = procedure (Sender : TObject; State : TRasConnState; Error : Integer;
                             MessageText : String) of object;
  TOnError      = procedure (Sender : TObject; ErrorCode : Integer; ErrorMessage : String) of Object;
  TOnActiveConn = procedure (Sender : TObject; Handle : THRasConn; Status : TRasConnStatus;
                             StatusString : String;
                             EntryName, DeviceType, DeviceName : PChar) of object;

  TDialMode = (dmAsync,dmSync); //dmAsync - Function will exit BEFORE finishing dialing
                                //          Events : onDialing,onError,onAsyncEvent
                                //dmSync  - Function will exit AFTER finishing dialing
                                //          Events : onDialing,onConnect,onNotConnected

  TRasLanguage = (ralgGerman, ralgEnglish, ralgCzech, ralgPortuguese, ralgPolish); // WK
                 { WK German = 1000, Engl=2000, Cz=3000, Port=4000, Pol=5000}

  TDialUp = class(TComponent)
  private
    FEntries    : TStringList;
    FDialMode   : TDialMode;
    FEntry2Dial : String;
    FLanguage   : TRasLanguage;
    FLangFaktor : Integer; // WK
    FSIP,FCIP   : String;
    FDUNA       : TStringList;
    FDUNAKey    : String;
    FTimer      : TTimer;
    FStatsXmit,FStatsRecv,FStatsConnSpeed : DWord;
    FStatsXmitTot,FStatsRecvTot           : DWord;
    FStatsXmitCon,FStatsRecvCon           : DWord;
    FPerfStatsHandle                      : THandle;
    FPerfStatsDeviceName                  : String;

    FOnEntryGet                           : TOnEntryGet;
    FOnDialing, FOnConnected              : TStandartEv;
    FOnNotConnected                       : TOnNotConn;
    FOnAsyncEvent                         : TOnAsyncEvent;
    FOnError                              : TOnError;
    FOnActiveConn                         : TOnActiveConn;

    procedure ResetPerfStats;
    Function GetLanguage : TRasLanguage; // WK
    Procedure SetLanguage(Value: TRasLanguage); // WK

    function GetRasBaudRate(hRasConn: THRASConn; DeviceName: PChar; var dwBaud: DWord): Boolean;

  protected
    procedure Timer(Sender: TObject); virtual;

  public
    hRAS : ThRASConn; {Handle to RAS connection dialed with by this component when connected}
    AsyncStatus : Boolean;
    AMsg,AError : Integer;
    AState      : TRasConnState;

    constructor Create(AOwner:TComponent); override;
    destructor Destroy; override;
    function Dial : Integer;
    function GetEntries : Integer;
    function GetConnections(var NumEntries: Integer): Integer;
    function HangUp : Integer;
    function HangUpConn(Handle : THRasConn) : Integer;
    function CreateEntry : Integer;
    function EditEntry : Integer;
    function DeleteEntry : Integer;
    function RenameEntryTo(S : String) : Integer;
    function SetEntryUserName(Value : String) : Integer;
    function SetEntryPassword(Value : String) : Integer;
    function RemovePassword : Integer;
    function GetEntryUserName(var Value : String) : Integer;
    function GetEntryPassword(var Value : String) : Integer;
    function StatusString(State: TRasConnState; Error: Integer): String;
    function GetIP(HRC : THRasConn) : Integer;
    function InitializePerfStats (Start, Search: boolean; hRasConn: THandle;
                                  DeviceName: String): boolean ;
    function SearchDUNA: Boolean;
    function GetPerfStats: Boolean;

  published
    property Name;
    property Tag;
    property DialMode : TDialMode
      read FDialMode write FDialMode;
    property Entries : TStringList
      read FEntries;
    property Entry : String
      read FEntry2Dial write FEntry2Dial;
    property Language : TRasLanguage
       Read GetLanguage Write SetLanguage; // WK modified
    property ServerIP : String
      read FSIP;
    property ClientIP : String
      read FCIP;
    property DUNA : TStringList
      read FDUNA;
    property DUNA_Key : String
      read FDUNAKey write FDUNAKey;
    property BytesXmit : DWord
      read FStatsXmit;
    property BytesRecv : DWord
      read FStatsRecv;
    property ConnectionSpeed : DWord
      read FStatsConnSpeed;

    property OnEntryGet : TOnEntryGet
      read FOnEntryGet write FOnEntryGet;
    property OnDialing : TStandartEv
      read FOnDialing write FOnDialing;
    property OnConnect : TStandartEv
      read FOnConnected write FOnConnected;
    property OnNotConnected : TOnNotConn
      read FOnNotConnected write FOnNotConnected;
    property OnAsyncEvent : TOnAsyncEvent
      read FOnAsyncEvent write FOnAsyncEvent;
    property OnError : TOnError
      read FOnError write FOnError;
    property OnActiveConnection : TOnActiveConn
      read FOnActiveConn write FOnActiveConn;
  end;


implementation

var
  datasize: integer = 0 ;   // performance data buffer size

const

  TOTALBYTES =  8192 ;    // initial buffer size for NT performance data
  BYTEINCREMENT = 1024 ;  // make it bigger

// NT performance counter identifiers, assume they are fixed data
  Pdata_RAS_Total   = '906' ;
  Pdata_Bytes_Xmit  = 872 ;
  Pdata_Bytes_Recv  = 874 ;
  // connect speed is not available on NT

// keys and names for Win95 performance statistics under HKEY_DYN_DATA
  Reg_PerfStatStart 	= 'PerfStats\StartStat';
  Reg_PerfStatData 		= 'PerfStats\StatData';
  Reg_PerfStatStop 		= 'PerfStats\StopStat';
  Reg_PerfAdap 			= 'Dial-Up Adapter' ;
  Reg_PerfXmit 			= 'TotalBytesXmit' ;
  Reg_PerfRecv 			= 'TotalBytesRecvd' ;
  Reg_PerfConn 			= 'ConnectSpeed' ;

  Reg_PerfStatEmum   = 'System\CurrentControlSet\Control\PerfStats\Enum' ;

{ other keys... Win9x only
Dial-Up Adapter #2\
"Dial-Up Adapter\Buffer"
"Dial-Up Adapter\Framing"
"Dial-Up Adapter\Overrun "
"Dial-Up Adapter\Alignment"
"Dial-Up Adapter\Timeout"
"Dial-Up Adapter\CRC"
"Dial-Up Adapter\Runts"
"Dial-Up Adapter\FramesXmit"
"Dial-Up Adapter\FramesRecvd"
"Dial-Up Adapter\BytesXmit"	these are the same as Total
"Dial-Up Adapter\BytesRecvd"	}


var xSelf : Pointer;

procedure TDialUp.Timer(Sender: TObject);
begin
  FTimer.Enabled:=False;
  if not AsyncStatus then Exit;
  if Assigned(FOnAsyncEvent) then
    FOnAsyncEvent(Self, AState, AError, StatusString(AState, AError));
  AsyncStatus:=False;
end;


procedure RasCallback(msg: Integer; state: TRasConnState; Error: Integer); stdcall;
begin
  While TDialUp(xSelf).AsyncStatus=True do ;
  TDialUp(xSelf).AsyncStatus:=True;
  TDialUp(xSelf).AMsg:=Msg;
  TDialUp(xSelf).AState:=State;
  TDialUp(xSelf).AError:=Error;
  TDialUp(xSelf).FTimer.Enabled:=True;
//  TDialUp(xSelf).FOnDialing(xSelf);
//  TDialUp(xSelf).OnAsyncEvent(xSelf,State,Error,TDialUp(xSelf).StatusString(state, error));
end;
{~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~}

//procedure RasCallback(Msg: Integer; State: TRasConnState; Error: Integer); stdcall; forward;


{~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~}

constructor TDialUp.Create(AOwner:TComponent);
begin
  inherited Create(AOwner);
  AsyncStatus:=False;
  FEntries:=TStringList.Create;
  FTimer:=TTimer.Create(Self);
  FTimer.Enabled:=False; FTimer.Interval:=1;

  FLangFaktor := 2000;         // WK
  FLanguage   := ralgEnglish;  // WK

  FTimer.OnTimer:=Timer;
  FDUNA:=TStringList.Create;
  SearchDUNA;
end;


{~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~}

destructor TDialUp.Destroy;
begin
  FEntries.Free;
  FTimer.Free;
  FDUNA.Free;
  inherited Destroy;
end;

{ WK }
Function TDialUp.GetLanguage     : TRasLanguage;
Begin
  Result:=FLanguage;
End;

Procedure TDialUp.SetLanguage(Value: TRasLanguage);
Begin
  FLanguage:=Value;
  FLangFaktor:=(Ord(Value)+1) * 1000;
End;
{ wk }

{~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~}

Function TDialUp.Dial : Integer;
var
  Fp                  : LongBool;
  R                   : Integer;
  C                   : Array[0..100] of Char;
  ErrS                : String;
  DialParams          : TRasDialParams;

begin
  HangUp;

  FillChar(DialParams, SizeOf(TRasDialParams), 0);
  with DialParams do
  begin
    dwSize:=Sizeof(TRasDialParams);
    StrPCopy(szEntryName, FEntry2Dial);
  end;

  R:=RasGetEntryDialParams(nil, DialParams, Fp);
  if R<>0 then
  begin
    Result:=R;
    if Assigned(FOnError) then FOnError(Self,R,'GetEntryDialParams failed');
    Exit;
  end;

  hRAS:=0;
  if DialMode=dmSync then // Synchronous dial
  begin
    if Assigned(FOnDialing) then FOnDialing(Self);
    R:=RasDial(nil, nil, DialParams, 0, nil, hRAS);
    if R=0 then
    begin
      if Assigned(FOnConnected) then
        FOnConnected(Self)
    end else
    begin
      if hRas<>0 then
        HangUpConn(hRas);
      RasGetErrorString(R, C, 100); ErrS:=C;
      if Assigned(FOnNotConnected) then FOnNotConnected(Self,R,ErrS);
    end;
  end else // Asynchronous dial

  begin
    // Async dial
    xSelf:=Self;
    if Assigned(FOnDialing) then FOnDialing(Self);
    R:=RasDial(nil, nil, DialParams, 0, @RasCallback, hRAS);
    if R<>0 then
    begin
      RasGetErrorString(R,C,100);
      if Assigned(FOnError) then FOnError(Self,R,C);
    end;
  end;
  Result:=R;
end;


{~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~}

Function TDialUp.GetEntries : Integer;
var
  BuffSize          : Integer;
  Entries           : Integer;
  Entry             : Array[1..MaxEntries] of TRasEntryName;
  X,Result_         : Integer;
begin
  Result:=0;
  FEntries.Clear;
  Entry[1].dwSize:=SizeOf(TRasEntryName);
  BuffSize:=SizeOf(TRasEntryName)*MaxEntries;
  Result_:=RasEnumEntries(nil, nil, @Entry[1], BuffSize, Entries);
  if (Result_=0) and (Entries>0) then
  begin
    for X:=1 to Entries do
    begin
      FEntries.Add(Entry[x].szEntryName);
      If Assigned(FOnEntryGet) then FOnEntryGet(Self,Entry[x].szEntryName);
    end;
  end else
  Result:=Result_;
end;


{~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~}

Function TDialUp.GetConnections(var NumEntries: Integer): Integer;
var
    BufSize                     : Integer;
    X                           : Integer;
    Entries                     : Array[1..MaxEntries] of TRasConn;
    Stat                        : TRasConnStatus;
    Result_                     : Integer;
    S                           : String;
begin
  Result:=0;

  Entries[1].dwSize := SizeOf(TRasConn);
  Bufsize:=SizeOf(TRasConn)*MaxEntries;
  FillChar(Stat, Sizeof(TRasConnStatus), 0);
  Stat.dwSize:=Sizeof(TRasConnStatus);

  Result_:=RasEnumConnections(@Entries[1], BufSize, NumEntries);
  if Result_=0 then
  begin
    if NumEntries > 0 then

    for X:=1 to NumEntries do
    begin
      RasGetConnectStatus(Entries[X].HRasConn, Stat);
      S:=StatusString(Stat.RasConnState, Stat.dwError);
      if Assigned(FOnActiveConn) then FOnActiveConn(Self, Entries[X].HRasConn,
                                                    Stat, S,
                                                    @Entries[X].szEntryName,
                                                    @Entries[X].szDeviceType,
                                                    @Entries[X].szDeviceName);
    end;
  end else Result:=Result_;
end;


{~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~}

Function TDialUp.HangUp : Integer;
begin
  Result:=HangUpConn(hRas);
end;


{~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~}

Function TDialUp.HangUpConn(Handle : THRasConn) : Integer;
var
  Stat:TRasConnStatus;
begin
  FillChar(Stat, Sizeof(TRasConnStatus), 0);
  Stat.dwSize:=Sizeof(TRasConnStatus); // Must be zeroed and sized
  Result:=RasHangUp(Handle);
  if( result<>0 )then exit ;

  while (RasGetConnectStatus(handle,stat)<>ERROR_INVALID_HANDLE) do
  begin
    sleep(0);
    Application.ProcessMessages;
  end; // Wait actual closure, else port could remain locked
end;


{~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~}


Function TDialUp.CreateEntry : Integer;
begin
  if (Owner is TForm) then
    Result:=RasCreatePhonebookEntry((Owner as TForm).Handle, nil) else
    Result:=RasCreatePhonebookEntry(0, nil);
end;


{~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~}

Function TDialUp.EditEntry : Integer;
begin
  if (Owner is TForm) then
    Result:=RasEditPhonebookEntry((Owner as TForm).Handle, nil, PChar(FEntry2Dial)) else
    Result:=RasEditPhonebookEntry(0, nil, PChar(FEntry2Dial));
end;

{~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~}

Function TDialUp.RenameEntryTo(S : String) : Integer;
begin
  Result:=RasRenameEntry(nil, PChar(FEntry2Dial), PChar(S));
end;

{~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~}

Function TDialUp.DeleteEntry : Integer;
begin
  Result:=RasDeleteEntry(nil, PChar(FEntry2Dial))
end;


{~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~}

function TDialUp.SetEntryUserName(Value : String) : Integer;
var DialParams : TRasDialParams;
    Fp         : LongBool;
begin
  FillChar(DialParams, SizeOf(TRasDialParams), 0);
  with DialParams do
  begin
    dwSize:=Sizeof(TRasDialParams);
    StrPCopy(szEntryName, FEntry2Dial);
  end;

  Result:=RasGetEntryDialParams(nil, DialParams, Fp);
  if (Result<>0) then exit;

  StrPCopy(DialParams.szUserName, Value);
  Result:=RasSetEntryDialParams(nil, DialParams, False);
end;

{~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~}

function TDialUp.SetEntryPassword(Value : String) : Integer;
var DialParams : TRasDialParams;
    Fp         : LongBool;
begin
  FillChar(DialParams, SizeOf(TRasDialParams), 0);
  with DialParams do
  begin
    dwSize:=Sizeof(TRasDialParams);
    StrPCopy(szEntryName, FEntry2Dial);
  end;
  Result:=RasGetEntryDialParams(nil, DialParams, Fp);
  if (Result<>0) then exit;

  StrPCopy(DialParams.szPassword, Value);
  Result:=RasSetEntryDialParams(nil, DialParams, False);
end;

{~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~}

function TDialUp.RemovePassword : Integer;
var DialParams : TRasDialParams;
begin
  with DialParams do
  begin
    dwSize:=Sizeof(TRasDialParams);
    StrPCopy(szEntryName, PChar(FEntry2Dial));
  end;
  Result:=RasSetEntryDialParams(nil, DialParams, True);
end;

{~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~}

function TDialUp.GetEntryUserName(var Value : String) : Integer;
var
  Fp         : LongBool;
  R          : Integer;
  DialParams : TRasDialParams;
begin
  FillChar(DialParams, SizeOf(TRasDialParams), 0);
  with DialParams do
  begin
    dwSize:=Sizeof(TRasDialParams);
    StrPCopy(szEntryName, FEntry2Dial);
  end;
  R:=RasGetEntryDialParams(nil, DialParams, Fp);
  if R=0 then
  with DialParams do
  begin
    Value:=szUserName;
  end;
  Result:=R;
end;

{~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~}

function TDialUp.GetEntryPassword(var Value : String) : Integer;
var
  Fp         : LongBool;
  R          : Integer;
  DialParams : TRasDialParams;
begin
  FillChar(DialParams, SizeOf(TRasDialParams), 0);
  with DialParams do
  begin
    dwSize:=Sizeof(TRasDialParams);
    StrPCopy(szEntryName, FEntry2Dial);
  end;
  R:=RasGetEntryDialParams(nil, DialParams, Fp);
  if R=0 then
  with DialParams do
  begin
    if Fp then
      Value:=szPassword else Value:='';
  end;
  Result:=R;
end;

{~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~}
{ WK changed to LoadStr-methodes }
function TDialUp.StatusString(State: TRasConnState; Error: Integer): String;
var
  C      : Array[0..100] of Char;
  S      : String;
begin
  if Error<>0 then
  begin
    RasGetErrorString(Error, C, 100);
    Result:=C;
  end else
  begin
    S:='';
    case State of
      RASCS_OpenPort:
        S:=LoadStr(FLangFaktor+ 1);
      RASCS_PortOpened:
        S:=LoadStr(FLangFaktor+ 2);
      RASCS_ConnectDevice:
        S:=LoadStr(FLangFaktor+ 3);
      RASCS_DeviceConnected:
        S:=LoadStr(FLangFaktor+ 4);
      RASCS_AllDevicesConnected:
        S:=LoadStr(FLangFaktor+ 5);
      RASCS_Authenticate:
        S:=LoadStr(FLangFaktor+ 6);
      RASCS_AuthNotify:
        S:=LoadStr(FLangFaktor+ 7);
      RASCS_AuthRetry:
        S:=LoadStr(FLangFaktor+ 8);
      RASCS_AuthCallback:
        S:=LoadStr(FLangFaktor+ 9);
      RASCS_AuthChangePassword:
        S:=LoadStr(FLangFaktor+10);
      RASCS_AuthProject:
        S:=LoadStr(FLangFaktor+11);
      RASCS_AuthLinkSpeed:
        S:=LoadStr(FLangFaktor+12);
      RASCS_AuthAck:
        S:=LoadStr(FLangFaktor+13);
      RASCS_ReAuthenticate:
        S:=LoadStr(FLangFaktor+14);
      RASCS_Authenticated:
        S:=LoadStr(FLangFaktor+15);
      RASCS_PrepareForCallback:
        S:=LoadStr(FLangFaktor+16);
      RASCS_WaitForModemReset:
        S:=LoadStr(FLangFaktor+17);
      RASCS_WaitForCallback:
        S:=LoadStr(FLangFaktor+18);
      RASCS_Projected:
        S:=LoadStr(FLangFaktor+19);
      RASCS_StartAuthentication:
        S:=LoadStr(FLangFaktor+20);
      RASCS_CallbackComplete:
        S:=LoadStr(FLangFaktor+21);
      RASCS_LogonNetwork:
        S:=LoadStr(FLangFaktor+22);

      RASCS_Interactive:
        S:=LoadStr(FLangFaktor+23);
      RASCS_RetryAuthentication:
        S:=LoadStr(FLangFaktor+24);
      RASCS_CallbackSetByCaller:
        S:=LoadStr(FLangFaktor+25);
      RASCS_PasswordExpired:
        S:=LoadStr(FLangFaktor+26);

      RASCS_Connected:
        S:=LoadStr(FLangFaktor+27);
      RASCS_Disconnected:
        S:=LoadStr(FLangFaktor+28);
    end;
    Result:=S;
  end;
end;
{ wk }

{****************************************************************************}
{****************************************************************************}
{****************************************************************************}
{****************************************************************************}

var
  Rnaph_Initialized       : Boolean = False;
  Is_Rnaph                : Boolean = False;
  Lib                     : HModule;

{~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~}

function Rnaph_(const func: String): Pointer;
begin
  if not Rnaph_Initialized then
  begin
    // Try first with RASAPI32.DLL
    Lib:=LoadLibrary('rasapi32.dll');
    if Lib<>0 then
    begin
      Result:=GetProcAddress(Lib, PChar(Func+'A'));
      if Result<>nil then
      begin
        Rnaph_Initialized:=True;
        Exit;
      end else
      begin
        Result:=GetProcAddress(Lib, PChar(Func));
        if Result<>nil then
        begin
          Rnaph_Initialized:=True;
          Exit;
        end;
      end;
    end else raise Exception.Create('Error opening rasapi.dll');
    // function not found - try rnaph.dll
    Lib:=LoadLibrary('rnaph.dll');
    if Lib<>0 then
    begin
      Result:=GetProcAddress(Lib, PChar(Func));
      if Result <> nil then
      begin
        Rnaph_Initialized:=True;
        Is_Rnaph:=True;
        Exit;
      end else raise Exception.Create('Function '+Func+' not found!');
    end else raise Exception.Create('Error opening rnaph.dll');
  end else
  begin
    if Is_Rnaph then Result:=GetProcAddress(Lib,PChar(Func))
    else
    begin
      Result:=GetProcAddress(lib,PChar(Func+'A'));
      if Result=nil then Result:=GetProcAddress(lib,PChar(Func));
    end;
    if Result=nil then raise Exception.Create('Function '+Func+' not found!');
  end;
end;

{~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~}

function RasValidateEntryName(lpszPhonebook, szEntry: PAnsiChar): Longint;
var
  F      : Function(lpszPhonebook, szEntry: PAnsiChar): Longint; stdcall;
begin
  @F:=Rnaph_('RasValidateEntryName');
  Result:=F(lpszPhonebook, szEntry);
end;

{~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~}

function RasRenameEntry(lpszPhonebook, szEntryOld, szEntryNew: PAnsiChar): Longint;
var
  F      : function(lpszPhonebook, szEntryOld, szEntryNew: PAnsiChar): Longint; stdcall;
begin
  @F:=rnaph_('RasRenameEntry');
  Result:=F(lpszPhonebook, szEntryOld, szEntryNew);
end;

{~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~}

function RasDeleteEntry(lpszPhonebook, szEntry: PAnsiChar): Longint;
var
  F      : function(lpszPhonebook, szEntry: PAnsiChar): Longint; stdcall;
begin
  @F:=Rnaph_('RasDeleteEntry');
  Result:=F(lpszPhonebook, szEntry);
end;

{~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~}

function RasGetEntryProperties(lpszPhonebook, szEntry: PAnsiChar; lpbEntry: Pointer;
    var lpdwEntrySize: Longint; lpbDeviceInfo: Pointer;
    var lpdwDeviceInfoSize: Longint): Longint;
var
  F                  : function(lpszPhonebook, szEntry: PAnsiChar; lpbEntry: Pointer;
                                lpdwEntrySize      : Longint;
                                lpbDeviceInfo      : Pointer;
                                lpdwDeviceInfoSize : Longint): Longint; stdcall;
begin
  @F:=Rnaph_('RasGetEntryProperties');
  Result:=F(lpszPhonebook, szEntry, lpbEntry, lpdwEntrySize, lpbDeviceInfo, lpdwDeviceInfoSize);
end;

{~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~}

function RasSetEntryProperties(lpszPhonebook, szEntry: PAnsiChar;
	  lpbEntry: Pointer; dwEntrySize: Longint; lpbDeviceInfo: Pointer;
    dwDeviceInfoSize: Longint): Longint;
var
  F                   : function(lpszPhonebook, szEntry: PAnsiChar;
                                 lpbEntry: Pointer; dwEntrySize: Longint;
                                 lpbDeviceInfo: Pointer;
                                 dwDeviceInfoSize: Longint): Longint; stdcall;
begin
  @F:=Rnaph_('RasSetEntryProperties');
  Result:=F(lpszPhonebook, szEntry, lpbEntry, dwEntrySize, lpbDeviceInfo, dwDeviceInfoSize);
end;

{~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~}

function RasGetCountryInfo(var lpCtryInfo: TRasCtryInfo; var lpdwSize: Longint): Longint;
var
  F                   : function(var lpCtryInfo: TRasCtryInfo;
                                 var lpdwSize: Longint): Longint; stdcall;
begin
  @F:=Rnaph_('RasGetCountryInfo');
  Result:=F(lpCtryInfo, lpdwSize);
end;

{~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~}

function RasEnumDevices(lpBuff: LpRasDevInfo; var lpcbSize: Longint;
                        var lpcDevices: Longint): Longint;
var
  F                   : function(lpBuff: LpRasDevInfo; var lpcbSize: Longint;
                                 var lpcDevices: Longint): Longint; stdcall;
begin
  @F:=Rnaph_('RasEnumDevices');
  Result:=F(lpBuff, lpcbSize, lpcDevices);
end;

{~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~}

function RasDialA(lpRasDialExt: LPRasDialExtensions; lpszPhoneBook: PAnsiChar;
                  var params: TRasDialParamsA; dwNotifierType: Longint;
                  lpNotifier: Pointer; var rasconn: THRasConn): Longint;
var F : function (lpRasDialExt: LPRasDialExtensions; lpszPhoneBook: PAnsiChar;
                  var params: TRasDialParamsA; dwNotifierType: Longint;
                  lpNotifier: Pointer; var rasconn: THRasConn): Longint; stdcall;
begin
  @F:=Rnaph_('RasDialA');
  Result:=F(lpRasDialExt, lpszPhoneBook, params, dwNotifierType, lpNotifier, rasconn);
end;
function RasDialW(lpRasDialExt: LPRasDialExtensions; lpszPhoneBook: PWideChar;
                  var params: TRasDialParamsW; dwNotifierType: Longint;
                  lpNotifier: Pointer; var rasconn: THRasConn): Longint;
var F : function (lpRasDialExt: LPRasDialExtensions; lpszPhoneBook: PWideChar;
                  var params: TRasDialParamsW; dwNotifierType: Longint;
                  lpNotifier: Pointer; var rasconn: THRasConn): Longint; stdcall;
begin
  @F:=Rnaph_('RasDialW');
  Result:=F(lpRasDialExt, lpszPhoneBook, params, dwNotifierType, lpNotifier, rasconn);
end;
function RasDial(lpRasDialExt: LPRasDialExtensions; lpszPhoneBook: PAnsiChar;
                 var params: TRasDialParams; dwNotifierType: Longint;
                 lpNotifier: Pointer; var rasconn: THRasConn): Longint;
var F : function(lpRasDialExt: LPRasDialExtensions; lpszPhoneBook: PAnsiChar;
                 var params: TRasDialParams; dwNotifierType: Longint;
                 lpNotifier: Pointer; var rasconn: THRasConn): Longint; stdcall;
begin
  @F:=Rnaph_('RasDialA');
  Result:=F(lpRasDialExt, lpszPhoneBook, params, dwNotifierType, lpNotifier, rasconn);
end;

function RasEnumConnectionsA(RasConnArray: LPRasConnA; var lpcb: Longint;
                             var lpcConnections: Longint): Longint;
var F : function(RasConnArray: LPRasConnA; var lpcb: Longint;
                             var lpcConnections: Longint): Longint; stdcall;
begin
  @F:=Rnaph_('RasEnumConnectionsA');
  Result:=F(RasConnArray,lpcb,lpcConnections);
end;
function RasEnumConnectionsW(RasConnArray: LPRasConnW; var lpcb: Longint;
                             var lpcConnections: Longint): Longint;
var F : function(RasConnArray: LPRasConnW; var lpcb: Longint;
                             var lpcConnections: Longint): Longint; stdcall;
begin
  @F:=Rnaph_('RasEnumConnectionsW');
  Result:=F(RasConnArray,lpcb,lpcConnections);
end;
function RasEnumConnections(RasConnArray: LPRasConn; var lpcb: Longint;
                             var lpcConnections: Longint): Longint;
var F : function (RasConnArray: LPRasConn; var lpcb: Longint;
                             var lpcConnections: Longint): Longint; stdcall;
begin
  @F:=Rnaph_('RasEnumConnectionsA');
  Result:=F(RasConnArray,lpcb,lpcConnections);
end;
function RasEnumEntriesA(Reserved: PAnsiChar; lpszPhoneBook: PAnsiChar;
                         entrynamesArray: LPRasEntryNameA; var lpcb: Longint;
                         var lpcEntries: Longint): Longint;
var F : function (Reserved: PAnsiChar; lpszPhoneBook: PAnsiChar;
                         entrynamesArray: LPRasEntryNameA; var lpcb: Longint;
                         var lpcEntries: Longint): Longint; stdcall;
begin
  @F:=Rnaph_('RasEnumEntriesA');
  Result:=F(Reserved,lpszPhoneBook,EntryNamesArray,lpcb,lpcEntries);
end;
function RasEnumEntriesW(reserved: PWideChar; lpszPhoneBook: PWideChar;
                         entrynamesArray: LPRasEntryNameW; var lpcb: Longint;
                         var lpcEntries: Longint): Longint;
var F : function (reserved: PWideChar; lpszPhoneBook: PWideChar;
                         entrynamesArray: LPRasEntryNameW; var lpcb: Longint;
                         var lpcEntries: Longint): Longint; stdcall;
begin
  @F:=Rnaph_('RasEnumEntriesW');
  Result:=F(Reserved,lpszPhoneBook,EntryNamesArray,lpcb,lpcEntries);
end;
function RasEnumEntries(reserved: PAnsiChar; lpszPhoneBook: PAnsiChar;
                        entrynamesArray: LPRasEntryName; var lpcb: Longint;
                        var lpcEntries: Longint): Longint;
var F : function (reserved: PAnsiChar; lpszPhoneBook: PAnsiChar;
                        entrynamesArray: LPRasEntryName; var lpcb: Longint;
                        var lpcEntries: Longint): Longint; stdcall;
begin
  @F:=Rnaph_('RasEnumEntriesA');
  Result:=F(Reserved,lpszPhoneBook,EntryNamesArray,lpcb,lpcEntries);
end;
function RasGetConnectStatusA(hConn: THRasConn; var lpStatus: TRasConnStatusA): Longint;
var F : function (hConn: THRasConn; var lpStatus: TRasConnStatusA): Longint; stdcall;
begin
  @F:=Rnaph_('RasGetConnectStatusA');
  Result:=F(hConn,lpStatus);
end;
function RasGetConnectStatusW(hConn: THRasConn;var lpStatus: TRasConnStatusW): Longint;
var F : function (hConn: THRasConn;var lpStatus: TRasConnStatusW): Longint; stdcall;
begin
  @F:=Rnaph_('RasGetConnectStatusW');
  Result:=F(hConn,lpStatus);
end;
function RasGetConnectStatus(hConn: THRasConn;var lpStatus: TRasConnStatus): Longint;
var F : function (hConn: THRasConn;var lpStatus: TRasConnStatus): Longint; stdcall;
begin
  @F:=Rnaph_('RasGetConnectStatusA');
  Result:=F(hConn,lpStatus);
end;
function RasGetErrorStringA(errorValue: Integer;erroString: PAnsiChar;cBufSize: Longint): Longint;
var F : function (errorValue: Integer;erroString: PAnsiChar;cBufSize: Longint): Longint; stdcall;
begin
  @F:=Rnaph_('RasGetErrorStringA');
  Result:=F(errorValue,erroString,cBufSize);
end;
function RasGetErrorStringW(errorValue: Integer;erroString: PWideChar;cBufSize: Longint): Longint;
var F : function (errorValue: Integer;erroString: PWideChar;cBufSize: Longint): Longint; stdcall;
begin
  @F:=Rnaph_('RasGetErrorStringW');
  Result:=F(errorValue,erroString,cBufSize);
end;
function RasGetErrorString(errorValue: Integer;erroString: PAnsiChar;cBufSize: Longint): Longint;
var F : function (errorValue: Integer;erroString: PAnsiChar;cBufSize: Longint): Longint; stdcall;
begin
  @F:=Rnaph_('RasGetErrorStringA');
  Result:=F(errorValue,erroString,cBufSize);
end;
function RasHangUpA(hConn: THRasConn): Longint;
var F : function (hConn: THRasConn): Longint; stdcall;
begin
  @F:=Rnaph_('RasHangUpA');
  Result:=F(hConn);
end;
function RasHangUpW(hConn: THRasConn): Longint;
var F : function (hConn: THRasConn): Longint; stdcall;
begin
  @F:=Rnaph_('RasHangUpW');
  Result:=F(hConn);
end;
function RasHangUp(hConn: THRasConn): Longint;
var F : function (hConn: THRasConn): Longint; stdcall;
begin
  @F:=Rnaph_('RasHangUpA');
  Result:=F(hConn);
end;
function RasGetProjectionInfoA(hConn: THRasConn; rasproj: TRasProjection;
                               lpProjection: Pointer; var lpcb: Longint): Longint;
var F : function (hConn: THRasConn; rasproj: TRasProjection;
                               lpProjection: Pointer; var lpcb: Longint): Longint; stdcall;
begin
  @F:=Rnaph_('RasGetProjectionInfoA');
  Result:=F(hConn,RasProj,lpProjection,lpcb);
end;
function RasGetProjectionInfoW(hConn: THRasConn; rasproj: TRasProjection;
                               lpProjection: Pointer; var lpcb: Longint): Longint;
var F : function (hConn: THRasConn; rasproj: TRasProjection;
                               lpProjection: Pointer; var lpcb: Longint): Longint; stdcall;
begin
  @F:=Rnaph_('RasGetProjectionInfoW');
  Result:=F(hConn,RasProj,lpProjection,lpcb);
end;
function RasGetProjectionInfo(hConn: THRasConn; rasproj: TRasProjection;
                              lpProjection: Pointer; var lpcb: Longint): Longint;
var F : function (hConn: THRasConn; rasproj: TRasProjection;
                              lpProjection: Pointer; var lpcb: Longint): Longint; stdcall;
begin
  @F:=Rnaph_('RasGetProjectionInfoA');
  Result:=F(hConn,RasProj,lpProjection,lpcb);
end;
function RasCreatePhonebookEntryA(hwndParentWindow: HWND;lpszPhoneBook: PAnsiChar): Longint;
var F : function (hwndParentWindow: HWND;lpszPhoneBook: PAnsiChar): Longint; stdcall;
begin
  @F:=Rnaph_('RasCreatePhonebookEntryA');
  Result:=F(hwndParentWindow,lpszPhoneBook);
end;
function RasCreatePhonebookEntryW(hwndParentWindow: HWND;lpszPhoneBook: PWideChar): Longint;
var F : function (hwndParentWindow: HWND;lpszPhoneBook: PWideChar): Longint; stdcall;
begin
  @F:=Rnaph_('RasCreatePhonebookEntryW');
  Result:=F(hwndParentWindow,lpszPhoneBook);
end;
function RasCreatePhonebookEntry(hwndParentWindow: HWND;lpszPhoneBook: PAnsiChar): Longint;
var F : function (hwndParentWindow: HWND;lpszPhoneBook: PAnsiChar): Longint; stdcall;
begin
  @F:=Rnaph_('RasCreatePhonebookEntryA');
  Result:=F(hwndParentWindow,lpszPhoneBook);
end;
function RasEditPhonebookEntryA(hwndParentWindow: HWND; lpszPhoneBook: PAnsiChar;
                                lpszEntryName: PAnsiChar): Longint;
var F : function (hwndParentWindow: HWND; lpszPhoneBook: PAnsiChar;
                                lpszEntryName: PAnsiChar): Longint; stdcall;
begin
  @F:=Rnaph_('RasEditPhonebookEntryA');
  Result:=F(hwndParentWindow,lpszPhoneBook,lpszEntryName);
end;
function RasEditPhonebookEntryW(hwndParentWindow: HWND; lpszPhoneBook: PWideChar;
                                lpszEntryName: PWideChar): Longint;
var F : function (hwndParentWindow: HWND; lpszPhoneBook: PWideChar;
                                lpszEntryName: PWideChar): Longint; stdcall;
begin
  @F:=Rnaph_('RasEditPhonebookEntryW');
  Result:=F(hwndParentWindow,lpszPhoneBook,lpszEntryName);
end;
function RasEditPhonebookEntry(hwndParentWindow: HWND; lpszPhoneBook: PAnsiChar;
                               lpszEntryName: PAnsiChar): Longint;
var F : function (hwndParentWindow: HWND; lpszPhoneBook: PAnsiChar;
                               lpszEntryName: PAnsiChar): Longint; stdcall;
begin
  @F:=Rnaph_('RasEditPhonebookEntryA');
  Result:=F(hwndParentWindow,lpszPhoneBook,lpszEntryName);
end;
function RasSetEntryDialParamsA(lpszPhoneBook: PAnsiChar; var lpDialParams: TRasDialParamsA;
                                fRemovePassword: LongBool): Longint;
var F : function (lpszPhoneBook: PAnsiChar; var lpDialParams: TRasDialParamsA;
                                fRemovePassword: LongBool): Longint; stdcall;
begin
  @F:=Rnaph_('RasSetEntryDialParamsA');
  Result:=F(lpszPhoneBook,lpDialParams,fRemovePassword);
end;
function RasSetEntryDialParamsW(lpszPhoneBook: PWideChar; var lpDialParams: TRasDialParamsW;
                                fRemovePassword: LongBool): Longint;
var F : function (lpszPhoneBook: PWideChar; var lpDialParams: TRasDialParamsW;
                                fRemovePassword: LongBool): Longint; stdcall;
begin
  @F:=Rnaph_('RasSetEntryDialParamsW');
  Result:=F(lpszPhoneBook,lpDialParams,fRemovePassword);
end;
function RasSetEntryDialParams(lpszPhoneBook: PAnsiChar; var lpDialParams: TRasDialParams;
                               fRemovePassword: LongBool): Longint;
var F : function (lpszPhoneBook: PAnsiChar; var lpDialParams: TRasDialParams;
                               fRemovePassword: LongBool): Longint; stdcall;
begin
  @F:=Rnaph_('RasSetEntryDialParamsA');
  Result:=F(lpszPhoneBook,lpDialParams,fRemovePassword);
end;
function RasGetEntryDialParamsA(lpszPhoneBook: PAnsiChar; var lpDialParams: TRasDialParamsA;
                                var lpfPassword: LongBool): Longint;
var F : function (lpszPhoneBook: PAnsiChar; var lpDialParams: TRasDialParamsA;
                                var lpfPassword: LongBool): Longint; stdcall;
begin
  @F:=Rnaph_('RasGetEntryDialParamsA');
  Result:=F(lpszPhoneBook,lpDialParams,lpfPassword);
end;
function RasGetEntryDialParamsW(lpszPhoneBook: PWideChar; var lpDialParams: TRasDialParamsW;
                                var lpfPassword: LongBool): Longint;
var F : function (lpszPhoneBook: PWideChar; var lpDialParams: TRasDialParamsW;
                                var lpfPassword: LongBool): Longint; stdcall;
begin
  @F:=Rnaph_('RasGetEntryDialParamsW');
  Result:=F(lpszPhoneBook,lpDialParams,lpfPassword);
end;
function RasGetEntryDialParams(lpszPhoneBook: PAnsiChar; var lpDialParams: TRasDialParams;
                               var lpfPassword: LongBool): Longint;
var F : function (lpszPhoneBook: PAnsiChar; var lpDialParams: TRasDialParams;
                               var lpfPassword: LongBool): Longint; stdcall;
begin
  @F:=Rnaph_('RasGetEntryDialParamsA');
  Result:=F(lpszPhoneBook,lpDialParams,lpfPassword);
end;

//RNAPH
function RasValidateEntryNameA(lpszPhonebook,szEntry: PAnsiChar): Longint;
var F : function (lpszPhonebook,szEntry: PAnsiChar): Longint; stdcall;
begin
  @F:=Rnaph_('RasValidateEntryNameA');
  Result:=F(lpszPhoneBook,szEntry);
end;
function RasValidateEntryNameW(lpszPhonebook,szEntry: PWideChar): Longint;
var F : function (lpszPhonebook,szEntry: PWideChar): Longint; stdcall;
begin
  @F:=Rnaph_('RasValidateEntryNameW');
  Result:=F(lpszPhoneBook,szEntry);
end;

function RasRenameEntryA(lpszPhonebook,szEntryOld,szEntryNew: PAnsiChar): Longint;
var F : function (lpszPhonebook,szEntryOld,szEntryNew: PAnsiChar): Longint; stdcall;
begin
  @F:=Rnaph_('RasRenameEntryA');
  Result:=F(lpszPhonebook,szEntryOld,szEntryNew);
end;

function RasRenameEntryW(lpszPhonebook,szEntryOld,szEntryNew: PWideChar): Longint;
var F : function (lpszPhonebook,szEntryOld,szEntryNew: PWideChar): Longint; stdcall;
begin
  @F:=Rnaph_('RasRenameEntryW');
  Result:=F(lpszPhonebook,szEntryOld,szEntryNew);
end;


function RasDeleteEntryA(lpszPhonebook,szEntry: PAnsiChar): Longint;
var F : function (lpszPhonebook,szEntry: PAnsiChar): Longint; stdcall;
begin
  @F:=Rnaph_('RasDeleteEntryA');
  Result:=F(lpszPhonebook,szEntry);
end;

function RasDeleteEntryW(lpszPhonebook,szEntry: PWideChar): Longint;
var F : function (lpszPhonebook,szEntry: PWideChar): Longint; stdcall;
begin
  @F:=Rnaph_('RasDeleteEntryW');
  Result:=F(lpszPhonebook,szEntry);
end;

function RasGetEntryPropertiesA(lpszPhonebook, szEntry: PAnsiChar; lpbEntry: Pointer;
                                var lpdwEntrySize: Longint; lpbDeviceInfo: Pointer;
                                var lpdwDeviceInfoSize: Longint): Longint;
var F : function (lpszPhonebook, szEntry: PAnsiChar; lpbEntry: Pointer;
                                var lpdwEntrySize: Longint; lpbDeviceInfo: Pointer;
                                var lpdwDeviceInfoSize: Longint): Longint; stdcall;
begin
  @F:=Rnaph_('RasGetEntryPropertiesA');
  Result:=F(lpszPhoneBook,szEntry,lpbEntry,lpdwEntrySize,lpbDeviceInfo,lpdwDeviceInfoSize);
end;

function RasGetEntryPropertiesW(lpszPhonebook, szEntry: PWideChar; lpbEntry: Pointer;
                                var lpdwEntrySize: Longint; lpbDeviceInfo: Pointer;
                                var lpdwDeviceInfoSize: Longint): Longint;
var F : function (lpszPhonebook, szEntry: PWideChar; lpbEntry: Pointer;
                                var lpdwEntrySize: Longint; lpbDeviceInfo: Pointer;
                                var lpdwDeviceInfoSize: Longint): Longint; stdcall;
begin
  @F:=Rnaph_('RasGetEntryPropertiesW');
  Result:=F(lpszPhoneBook,szEntry,lpbEntry,lpdwEntrySize,lpbDeviceInfo,lpdwDeviceInfoSize);
end;


function RasSetEntryPropertiesA(lpszPhonebook, szEntry: PAnsiChar; lpbEntry: Pointer;
                                dwEntrySize: Longint; lpbDeviceInfo: Pointer;
                                dwDeviceInfoSize: Longint): Longint;
var F : function (lpszPhonebook, szEntry: PAnsiChar; lpbEntry: Pointer;
                                dwEntrySize: Longint; lpbDeviceInfo: Pointer;
                                dwDeviceInfoSize: Longint): Longint; stdcall;
begin
  @F:=Rnaph_('RasSetEntryPropertiesA');
  Result:=F(lpszPhoneBook,szEntry,lpbEntry,dwEntrySize,lpbDeviceInfo,dwDeviceInfoSize);
end;

function RasSetEntryPropertiesW(lpszPhonebook, szEntry: PWideChar; lpbEntry: Pointer;
                                dwEntrySize: Longint; lpbDeviceInfo: Pointer;
                                dwDeviceInfoSize: Longint): Longint;
var F : function (lpszPhonebook, szEntry: PWideChar; lpbEntry: Pointer;
                                dwEntrySize: Longint; lpbDeviceInfo: Pointer;
                                dwDeviceInfoSize: Longint): Longint; stdcall;
begin
  @F:=Rnaph_('RasSetEntryPropertiesW');
  Result:=F(lpszPhoneBook,szEntry,lpbEntry,dwEntrySize,lpbDeviceInfo,dwDeviceInfoSize);
end;

function RasGetCountryInfoA(var lpCtryInfo: TRasCtryInfo;var lpdwSize: Longint): Longint;
var F : function (var lpCtryInfo: TRasCtryInfo;var lpdwSize: Longint): Longint; stdcall;
begin
  @F:=Rnaph_('RasGetCountryInfoA');
  Result:=F(lpCtryInfo,lpdwSize);
end;

function RasGetCountryInfoW(var lpCtryInfo: TRasCtryInfo;var lpdwSize: Longint): Longint;
var F : function (var lpCtryInfo: TRasCtryInfo;var lpdwSize: Longint): Longint; stdcall;
begin
  @F:=Rnaph_('RasGetCountryInfoW');
  Result:=F(lpCtryInfo,lpdwSize);
end;

function RasEnumDevicesA(lpBuff: LpRasDevInfoA; var lpcbSize: Longint;
                         var lpcDevices: Longint): Longint;
var F : function (lpBuff: LpRasDevInfoA; var lpcbSize: Longint;
                         var lpcDevices: Longint): Longint; stdcall;
begin
  @F:=Rnaph_('RasEnumDevicesA');
  Result:=F(lpBuff,lpcbSize,lpcDevices);
end;

function RasEnumDevicesW(lpBuff: LpRasDevInfoW; var lpcbSize: Longint;
                         var lpcDevices: Longint): Longint;
var F : function (lpBuff: LpRasDevInfoW; var lpcbSize: Longint;
                         var lpcDevices: Longint): Longint; stdcall;
begin
  @F:=Rnaph_('RasEnumDevicesW');
  Result:=F(lpBuff,lpcbSize,lpcDevices);
end;


function TDialUp.GetIP(HRC : THRASConn) : Integer;
var RASPppIp: TRASPppIp;
    lpcp    : Integer;
begin
  Result:=0; FCIP:=''; FSIP:='';
  if HRC=0 then Exit;
  FillChar(RASPppIp,SizeOf(TRASPppIp),#00);
  RASPppIp.dwSize:=SizeOf(TRASPppIp); lpcp:=RASPppIp.dwSize;
  Result:=RASGetProjectionInfo(HRC,RASP_PppIp,@RASPppIp,lpcp);
  if Result=0 then {OK}
  begin
    FCIP:=RASPppIp.szIpAddress;
    FSIP:=RASPppIp.szServerIpAddress;
  end;
end;

function TDialUp.SearchDUNA: Boolean;
var TempKey, Temp2Key                 : HKey;
    keyname, lockey                   : String;
    NumSubKeys, NumValues, count      : Integer;
    dwType, dwSize, Len               : DWORD ;
begin
  Result:=False;
  if (Win32Platform<>VER_PLATFORM_WIN32_WINDOWS) then exit; {Not W9X ! Exit!}
  DUNA.Clear;
  TempKey:=0; Temp2Key:=0;
  Result:=RegOpenKeyEx(HKEY_LOCAL_MACHINE,PChar(Reg_PerfStatEmum),0,KEY_READ,TempKey)=ERROR_SUCCESS;
  if Result then
    Result:=RegOpenKeyEx(HKEY_DYN_DATA,PChar(Reg_PerfStatStart),0,KEY_READ,Temp2Key)=ERROR_SUCCESS;
  if Result then
  begin
    NumSubKeys:=0;
    NumValues:=0;
    RegQueryInfoKey(TempKey,nil,nil,nil,@NumSubKeys,nil,nil,@NumValues,nil,nil,nil,nil) ;
    if NumSubKeys<>0 then
    begin
      SetString(LocKey,nil,33);
      for Count:=0 to (NumSubKeys-1) do
      begin
        Len:=33;
        RegEnumKeyEx(TempKey,Count,PChar(LocKey),Len,nil,nil,nil,nil);
        KeyName:=PChar(LocKey)+'\'+Reg_PerfConn;
        if RegQueryValueEx(Temp2Key,PChar(keyname),nil,@dwType,nil,@dwSize)=ERROR_SUCCESS then
          DUNA.Add(PChar(lockey));
      end ;
    end ;
  end ;
  if TempKey<>0 then RegCloseKey(TempKey);
  if Temp2Key<>0 then RegCloseKey(Temp2Key);
  if DUNA.Count<>0 then DUNA.Sort;
end;

function TDialUp.InitializePerfStats(Start,Search: Boolean; hRasConn: THandle;
                                     DeviceName: String) : Boolean;
var TempKey                      : HKey;
    KeyName                      : String;
    dwType, dwSize               : DWORD;
    TempData                     : Pointer;
function InitData(ValueName: String) : Boolean;
begin
  Result:=False;
  ValueName:=FDunaKey+'\'+ValueName ;
  if RegQueryValueEx(TempKey,PChar(ValueName),nil,@dwType,nil,@dwSize)=ERROR_SUCCESS then
  begin
    try		// read data but ignore it
      GetMem(TempData,dwSize) ;
      Result:=RegQueryValueEx(TempKey,PChar(ValueName),nil,@dwType,TempData,@dwSize)=ERROR_SUCCESS;
    finally
      FreeMem (TempData);
    end;
  end;
end;

begin
  Result:=False;
  FPerfStatsHandle:=hRasConn;
  FPerfStatsDeviceName:=DeviceName;

  if Win32Platform=VER_PLATFORM_WIN32s then Exit; {Win32s? Quit!}
  Result:=True;
  if Win32Platform=VER_PLATFORM_WIN32_WINDOWS then {Win9X? Continue:}
  begin
    if Search then
    begin
      SearchDUNA;
      if DUNA.Count=0 then
      begin
        Result:=False;
        Exit;
      end;
      FDUNAKey:=DUNA[0]; // set first
    end;
    TempKey:=0;
    if Start then KeyName:=Reg_PerfStatStart
      else KeyName:=Reg_PerfStatStop;
    Result:=RegOpenKeyEx(HKEY_DYN_DATA,PChar(KeyName),0,KEY_ALL_ACCESS,TempKey)=ERROR_SUCCESS;
    if Result then
    begin
      Result:=InitData(Reg_PerfXmit);
      if Result then Result:=InitData(Reg_PerfRecv);
      if Result then Result:=InitData(Reg_PerfConn);
      RegCloseKey(TempKey);
    end;
  end;
  if Result then
  begin
    if Start then Result:=GetPerfStats; // get counters
    ResetPerfStats; // set current
  end;
end;

function TDialUp.GetPerfStats : Boolean;
var TempKey                          : HKey;
    dwType,dwSize,ConnSpd            : DWORD ;
    PerfData                         : PPERF_DATA_BLOCK ;
    PerfObj                          : PPERF_OBJECT_TYPE ;
    PerfCDef                         : PPERF_COUNTER_DEFINITION ;
    PerfmCDef                        : array [1..50] of PPERF_COUNTER_DEFINITION ;
    PerfInst                         : PPERF_INSTANCE_DEFINITION ;
    PerfCBlk                         : PPERF_COUNTER_BLOCK ;
    RegBuff,ObjPtr,DefPtr,CountPtr   : PChar ;
    ActualSize,DataType              : Integer;
    ObjNr,InstNr,CountNr             : Integer ;
    DatValue                         : ^Cardinal;
    LoopFlag                         : Boolean ;

function GetData (ValueName: string; var Info: DWORD): boolean ;
begin
  ValueName:=FDUNAKey+'\'+ValueName ;
  dwSize:=4; // data is four bytes of binary, aka a DWORD
  Result:=RegQueryValueEx(TempKey,PChar(ValueName),nil,@dwType,@Info,@dwSize)=ERROR_SUCCESS;
end;

begin
  RegBuff:=nil;
  Result:=False;
  if Win32Platform=VER_PLATFORM_WIN32s then exit;
  if Win32Platform=VER_PLATFORM_WIN32_WINDOWS then  // Win95/98
  begin //
    TempKey:=0;
    Result:=RegOpenKeyEx(HKEY_DYN_DATA,PChar(Reg_PerfStatData),0,KEY_READ,TempKey)=ERROR_SUCCESS;
    if Result then
    begin //
      Result:=GetData(Reg_PerfXmit,fStatsXmitTot);
      if Result then Result:=GetData(Reg_PerfRecv,FStatsRecvTot);
      if Result then Result:=GetData(Reg_PerfConn,ConnSpd);
      RegCloseKey(TempKey);
      if Result then
      begin //
        if FStatsXmitTot<FStatsXmitCon then ResetPerfStats;
        if FStatsRecvTot<FStatsRecvCon then ResetPerfStats;
        FStatsConnSpeed:=ConnSpd;
        FStatsXmit:=FStatsXmitTot-FStatsXmitCon;
        FStatsRecv:=FStatsRecvTot-FStatsRecvCon;
      end;
    end;
  end else
  begin                           // Win NT
    if not GetRasBaudRate(FPerfStatsHandle, PChar(FPerfStatsDeviceName), FStatsConnSpeed) then
      FStatsConnSpeed:=0;

    DataType:=REG_NONE;        // Windows NT performance data
    try
      // start with small buffer, it will be increased in size if necessary the
      // first time, to that required for the returned performance data
      if DataSize=0 then DataSize:=TOTALBYTES;
      GetMem(RegBuff,DataSize);
      ActualSize:=DataSize;
      while RegQueryValueEx(HKEY_PERFORMANCE_DATA,PChar(PData_RAS_Total),nil,@DataType,PByte(RegBuff),@ActualSize)=ERROR_MORE_DATA do
      begin //
        FreeMem(RegBuff);
        Inc(DataSize,BYTEINCREMENT);  // increase buffers size by 1K
        GetMem(RegBuff,DataSize);
        ActualSize:=DataSize;
      end; //
      // get performance data block
      if ActualSize<100 then Exit;     // forget it
      Pointer(PerfData):=RegBuff;   // PERF_DATA_BLOCK
      // get performance object type blocks
      if PerfData.NumObjectTypes=0 then Exit;   // no objects to process
      ObjPtr:=RegBuff+PerfData.HeaderLength;
      for ObjNr:=1 to PerfData.NumObjectTypes do
      begin
        Application.ProcessMessages;
        Pointer(PerfObj):=ObjPtr;  // PERF_OBJECT_TYPE
        DefPtr:=ObjPtr+PerfObj.HeaderLength;
        // get performance counter definitions
        if PerfObj.NumCounters>0 then
        begin
          // read through definitions, really looking for length
          for Countnr:=1 to PerfObj.NumCounters do
          begin //
            Pointer(PerfmcDef[Countnr]):=DefPtr;  // keep each definitition
            Pointer(PerfcDef):=DefPtr;  // PERF_COUNTER_DEFINITION
            Inc(DefPtr, PerfcDef.ByteLength);
            if CountNr>50 then exit;
            Application.ProcessMessages;
          end;
            // now get counter data, perhaps from multiple instances
            LoopFlag:=True;
            InstNr:=1;
            while LoopFlag do
            begin
              if PerfObj.NumInstances>=1 then
              begin
                Pointer(PerfInst):=DefPtr;  // PERF_INSTANCE_DEFINITON
                // Instance Name:=WideCharToString
                Inc(DefPtr,PerfInst.ByteLength);
              end;
              // get counter block, then read actual data values
              Countptr:=DefPtr;  // after reading through blocks
              Pointer(PerfCBlk):=CountPtr;  // PERF_COUNTER_BLOCK
              // get counter data, currently only doublewords
              for CountNr:=1 to PerfObj.NumCounters do
              begin
                if PerfMCDef[CountNr].CounterNameTitleIndex=Pdata_Bytes_Xmit then
                begin
                  Pointer(DatValue):=CountPtr+PerfMCDef[Countnr].CounterOffset;
                  if DatValue^>FStatsXmit then
                    FStatsXmit:=Datvalue^;
                end;
                if PerfMCDef[CountNr].CounterNameTitleIndex=Pdata_Bytes_Recv then
                begin
                  Pointer(datvalue):=CountPtr +
                  PerfMCDef[Countnr].CounterOffset;
                  if Datvalue^>FStatsRecv then
                    FStatsRecv:=Datvalue^;
                end;
              end;
              Inc(DefPtr, PerfCBlk.ByteLength);
              // check for more instances of these counters
              if PerfObj.NumInstances>=1 then
              begin
                Inc(InstNr);
                if InstNr>PerfObj.NumInstances then LoopFlag:=False;
              end else
              LoopFlag:=False;
            end;
          end;
          ObjPtr:=ObjPtr+PerfObj.TotalByteLength;
        end;
        Result:=True;
      finally
        if RegBuff<>nil then Freemem(RegBuff);
    end;
  end;
end;

procedure TDialUp.ResetPerfStats;
begin
  FStatsXmitCon:=FStatsXmitTot; // tot counters are from IPL
  FStatsRecvCon:=FStatsRecvTot;
  FStatsXmit:=0;                // current connection
  FStatsRecv:=0;
  FStatsConnSpeed:=0;
end;
(*TAPI*){$A-}
(*TAPI*){$IFDEF WIN32}
(*TAPI*)
(*TAPI*)function lineAccept; external 'Tapi32.dll' name 'lineAccept';
(*TAPI*)function lineAddProvider; external 'Tapi32.dll' name 'lineAddProvider';
(*TAPI*)function lineAddProviderA; external 'Tapi32.dll' name 'lineAddProvider';
(*TAPI*)function lineAddProviderW; external 'Tapi32.dll' name 'lineAddProviderW';
(*TAPI*)function lineAddToConference; external 'Tapi32.dll' name 'lineAddToConference';
(*TAPI*){$IFDEF TAPI20}
(*TAPI*)function lineAgentSpecific; external 'Tapi32.dll' name 'lineAgentSpecific';
(*TAPI*){$ENDIF}
(*TAPI*)function lineAnswer; external 'Tapi32.dll' name 'lineAnswer';
(*TAPI*)function lineBlindTransfer; external 'Tapi32.dll' name 'lineBlindTransfer';
(*TAPI*)function lineBlindTransferA; external 'Tapi32.dll' name 'lineBlindTransfer';
(*TAPI*)function lineBlindTransferW; external 'Tapi32.dll' name 'lineBlindTransferW';
(*TAPI*)function lineClose; external 'Tapi32.dll' name 'lineClose';
(*TAPI*)function lineCompleteCall; external 'Tapi32.dll' name 'lineCompleteCall';
(*TAPI*)function lineCompleteTransfer; external 'Tapi32.dll' name 'lineCompleteTransfer';
(*TAPI*)function lineConfigDialog; external 'Tapi32.dll' name 'lineConfigDialog';
(*TAPI*)function lineConfigDialogA; external 'Tapi32.dll' name 'lineConfigDialog';
(*TAPI*)function lineConfigDialogW; external 'Tapi32.dll' name 'lineConfigDialogW';
(*TAPI*)function lineConfigDialogEdit; external 'Tapi32.dll' name 'lineConfigDialogEdit';
(*TAPI*)function lineConfigDialogEditA; external 'Tapi32.dll' name 'lineConfigDialogEdit';
(*TAPI*)function lineConfigDialogEditW; external 'Tapi32.dll' name 'lineConfigDialogEditW';
(*TAPI*)function lineConfigProvider; external 'Tapi32.dll' name 'lineConfigProvider';
(*TAPI*)function lineDeallocateCall; external 'Tapi32.dll' name 'lineDeallocateCall';
(*TAPI*)function lineDevSpecific; external 'Tapi32.dll' name 'lineDevSpecific';
(*TAPI*)function lineDevSpecificFeature; external 'Tapi32.dll' name 'lineDevSpecificFeature';
(*TAPI*)function lineDial; external 'Tapi32.dll' name 'lineDial';
(*TAPI*)function lineDialA; external 'Tapi32.dll' name 'lineDial';
(*TAPI*)function lineDialW; external 'Tapi32.dll' name 'lineDialW';
(*TAPI*)function lineDrop; external 'Tapi32.dll' name 'lineDrop';
(*TAPI*)function lineForward; external 'Tapi32.dll' name 'lineForward';
(*TAPI*)function lineForwardA; external 'Tapi32.dll' name 'lineForward';
(*TAPI*)function lineForwardW; external 'Tapi32.dll' name 'lineForwardW';
(*TAPI*)function lineGatherDigits; external 'Tapi32.dll' name 'lineGatherDigits';
(*TAPI*)function lineGatherDigitsA; external 'Tapi32.dll' name 'lineGatherDigits';
(*TAPI*)function lineGatherDigitsW; external 'Tapi32.dll' name 'lineGatherDigitsW';
(*TAPI*)function lineGenerateDigits; external 'Tapi32.dll' name 'lineGenerateDigits';
(*TAPI*)function lineGenerateDigitsA; external 'Tapi32.dll' name 'lineGenerateDigits';
(*TAPI*)function lineGenerateDigitsW; external 'Tapi32.dll' name 'lineGenerateDigitsW';
(*TAPI*)function lineGenerateTone; external 'Tapi32.dll' name 'lineGenerateTone';
(*TAPI*)function lineGetAddressCaps; external 'Tapi32.dll' name 'lineGetAddressCaps';
(*TAPI*)function lineGetAddressCapsA; external 'Tapi32.dll' name 'lineGetAddressCaps';
(*TAPI*)function lineGetAddressCapsW; external 'Tapi32.dll' name 'lineGetAddressCapsW';
(*TAPI*)function lineGetAddressID; external 'Tapi32.dll' name 'lineGetAddressID';
(*TAPI*)function lineGetAddressIDA; external 'Tapi32.dll' name 'lineGetAddressID';
(*TAPI*)function lineGetAddressIDW; external 'Tapi32.dll' name 'lineGetAddressIDW';
(*TAPI*)function lineGetAddressStatus; external 'Tapi32.dll' name 'lineGetAddressStatus';
(*TAPI*)function lineGetAddressStatusA; external 'Tapi32.dll' name 'lineGetAddressStatus';
(*TAPI*)function lineGetAddressStatusW; external 'Tapi32.dll' name 'lineGetAddressStatusW';
(*TAPI*){$IFDEF TAPI20}
(*TAPI*)function lineGetAgentStatus; external 'Tapi32.dll' name 'lineGetAgentStatus';
(*TAPI*)function lineGetAgentStatusA; external 'Tapi32.dll' name 'lineGetAgentStatus';
(*TAPI*)function lineGetAgentStatusW; external 'Tapi32.dll' name 'lineGetAgentStatusW';
(*TAPI*)function lineGetAgentGroupList; external 'Tapi32.dll' name 'lineGetAgentGroupList';
(*TAPI*)function lineGetAgentGroupListA; external 'Tapi32.dll' name 'lineGetAgentGroupList';
(*TAPI*)function lineGetAgentGroupListW; external 'Tapi32.dll' name 'lineGetAgentGroupListW';
(*TAPI*)function lineGetAgentCaps; external 'Tapi32.dll' name 'lineGetAgentCaps';
(*TAPI*)function lineGetAgentCapsA; external 'Tapi32.dll' name 'lineGetAgentCaps';
(*TAPI*)function lineGetAgentCapsW; external 'Tapi32.dll' name 'lineGetAgentCapsW';
(*TAPI*)function lineGetAgentActivityList; external 'Tapi32.dll' name 'lineGetAgentActivityList';
(*TAPI*)function lineGetAgentActivityListA; external 'Tapi32.dll' name 'lineGetAgentActivityList';
(*TAPI*)function lineGetAgentActivityListW; external 'Tapi32.dll' name 'lineGetAgentActivityListW';
(*TAPI*){$ENDIF}
(*TAPI*)function lineGetAppPriority; external 'Tapi32.dll' name 'lineGetAppPriority';
(*TAPI*)function lineGetAppPriorityA; external 'Tapi32.dll' name 'lineGetAppPriority';
(*TAPI*)function lineGetAppPriorityW; external 'Tapi32.dll' name 'lineGetAppPriorityW';
(*TAPI*)function lineGetCallInfo; external 'Tapi32.dll' name 'lineGetCallInfo';
(*TAPI*)function lineGetCallInfoA; external 'Tapi32.dll' name 'lineGetCallInfo';
(*TAPI*)function lineGetCallInfoW; external 'Tapi32.dll' name 'lineGetCallInfoW';
(*TAPI*)function lineGetCallStatus; external 'Tapi32.dll' name 'lineGetCallStatus';
(*TAPI*)function lineGetConfRelatedCalls; external 'Tapi32.dll' name 'lineGetConfRelatedCalls';
(*TAPI*)function lineGetCountry; external 'Tapi32.dll' name 'lineGetCountry';
(*TAPI*)function lineGetCountryA; external 'Tapi32.dll' name 'lineGetCountry';
(*TAPI*)function lineGetCountryW; external 'Tapi32.dll' name 'lineGetCountryW';
(*TAPI*)function lineGetDevCaps; external 'Tapi32.dll' name 'lineGetDevCaps';
(*TAPI*)function lineGetDevCapsA; external 'Tapi32.dll' name 'lineGetDevCaps';
(*TAPI*)function lineGetDevCapsW; external 'Tapi32.dll' name 'lineGetDevCapsW';
(*TAPI*)function lineGetDevConfig; external 'Tapi32.dll' name 'lineGetDevConfig';
(*TAPI*)function lineGetDevConfigA; external 'Tapi32.dll' name 'lineGetDevConfig';
(*TAPI*)function lineGetDevConfigW; external 'Tapi32.dll' name 'lineGetDevConfigW';
(*TAPI*)function lineGetNewCalls; external 'Tapi32.dll' name 'lineGetNewCalls';
(*TAPI*)function lineGetIcon; external 'Tapi32.dll' name 'lineGetIcon';
(*TAPI*)function lineGetIconA; external 'Tapi32.dll' name 'lineGetIcon';
(*TAPI*)function lineGetIconW; external 'Tapi32.dll' name 'lineGetIconW';
(*TAPI*)function lineGetID; external 'Tapi32.dll' name 'lineGetID';
(*TAPI*)function lineGetIDA; external 'Tapi32.dll' name 'lineGetID';
(*TAPI*)function lineGetIDW; external 'Tapi32.dll' name 'lineGetIDW';
(*TAPI*)function lineGetLineDevStatus; external 'Tapi32.dll' name 'lineGetLineDevStatus';
(*TAPI*)function lineGetLineDevStatusA; external 'Tapi32.dll' name 'lineGetLineDevStatus';
(*TAPI*)function lineGetLineDevStatusW; external 'Tapi32.dll' name 'lineGetLineDevStatusW';
(*TAPI*){$IFDEF TAPI20}
(*TAPI*)function lineGetMessage; external 'Tapi32.dll' name 'lineGetMessage';
(*TAPI*){$ENDIF}
(*TAPI*)function lineGetNumRings; external 'Tapi32.dll' name 'lineGetNumRings';
(*TAPI*)function lineGetProviderList; external 'Tapi32.dll' name 'lineGetProviderList';
(*TAPI*)function lineGetProviderListA; external 'Tapi32.dll' name 'lineGetProviderList';
(*TAPI*)function lineGetProviderListW; external 'Tapi32.dll' name 'lineGetProviderListW';
(*TAPI*)function lineGetRequest; external 'Tapi32.dll' name 'lineGetRequest';
(*TAPI*)function lineGetRequestA; external 'Tapi32.dll' name 'lineGetRequest';
(*TAPI*)function lineGetRequestW; external 'Tapi32.dll' name 'lineGetRequestW';
(*TAPI*)function lineGetStatusMessages; external 'Tapi32.dll' name 'lineGetStatusMessages';
(*TAPI*)function lineGetTranslateCaps; external 'Tapi32.dll' name 'lineGetTranslateCaps';
(*TAPI*)function lineGetTranslateCapsA; external 'Tapi32.dll' name 'lineGetTranslateCaps';
(*TAPI*)function lineGetTranslateCapsW; external 'Tapi32.dll' name 'lineGetTranslateCapsW';
(*TAPI*)function lineHandoff; external 'Tapi32.dll' name 'lineHandoff';
(*TAPI*)function lineHandoffA; external 'Tapi32.dll' name 'lineHandoff';
(*TAPI*)function lineHandoffW; external 'Tapi32.dll' name 'lineHandoffW';
(*TAPI*)function lineHold; external 'Tapi32.dll' name 'lineHold';
(*TAPI*)function lineInitialize; external 'Tapi32.dll' name 'lineInitialize';
(*TAPI*){$IFDEF TAPI20}
(*TAPI*)function lineInitializeEx; external 'Tapi32.dll' name 'lineInitializeEx';
(*TAPI*)function lineInitializeExA; external 'Tapi32.dll' name 'lineInitializeEx';
(*TAPI*)function lineInitializeExW; external 'Tapi32.dll' name 'lineInitializeExW';
(*TAPI*){$ENDIF}
(*TAPI*)function lineMakeCall; external 'Tapi32.dll' name 'lineMakeCall';
(*TAPI*)function lineMakeCallA; external 'Tapi32.dll' name 'lineMakeCall';
(*TAPI*)function lineMakeCallW; external 'Tapi32.dll' name 'lineMakeCallW';
(*TAPI*)function lineMonitorDigits; external 'Tapi32.dll' name 'lineMonitorDigits';
(*TAPI*)function lineMonitorMedia; external 'Tapi32.dll' name 'lineMonitorMedia';
(*TAPI*)function lineMonitorTones; external 'Tapi32.dll' name 'lineMonitorTones';
(*TAPI*)function lineNegotiateAPIVersion; external 'Tapi32.dll' name 'lineNegotiateAPIVersion';
(*TAPI*)function lineNegotiateExtVersion; external 'Tapi32.dll' name 'lineNegotiateExtVersion';
(*TAPI*)function lineOpen; external 'Tapi32.dll' name 'lineOpen';
(*TAPI*)function lineOpenA; external 'Tapi32.dll' name 'lineOpen';
(*TAPI*)function lineOpenW; external 'Tapi32.dll' name 'lineOpenW';
(*TAPI*)function linePark; external 'Tapi32.dll' name 'linePark';
(*TAPI*)function lineParkA; external 'Tapi32.dll' name 'linePark';
(*TAPI*)function lineParkW; external 'Tapi32.dll' name 'lineParkW';
(*TAPI*)function linePickup; external 'Tapi32.dll' name 'linePickup';
(*TAPI*)function linePickupA; external 'Tapi32.dll' name 'linePickup';
(*TAPI*)function linePickupW; external 'Tapi32.dll' name 'linePickupW';
(*TAPI*)function linePrepareAddToConference; external 'Tapi32.dll' name 'linePrepareAddToConference';
(*TAPI*)function linePrepareAddToConferenceA; external 'Tapi32.dll' name 'linePrepareAddToConference';
(*TAPI*)function linePrepareAddToConferenceW; external 'Tapi32.dll' name 'linePrepareAddToConferenceW';
(*TAPI*){$IFDEF TAPI20}
(*TAPI*)function lineProxyMessage; external 'Tapi32.dll' name 'lineProxyMessage';
(*TAPI*)function lineProxyResponse; external 'Tapi32.dll' name 'lineProxyResponse';
(*TAPI*){$ENDIF}
(*TAPI*)function lineRedirect; external 'Tapi32.dll' name 'lineRedirect';
(*TAPI*)function lineRedirectA; external 'Tapi32.dll' name 'lineRedirect';
(*TAPI*)function lineRedirectW; external 'Tapi32.dll' name 'lineRedirectW';
(*TAPI*)function lineRegisterRequestRecipient; external 'Tapi32.dll' name 'lineRegisterRequestRecipient';
(*TAPI*)function lineReleaseUserUserInfo; external 'Tapi32.dll' name 'lineReleaseUserUserInfo';
(*TAPI*)function lineRemoveFromConference; external 'Tapi32.dll' name 'lineRemoveFromConference';
(*TAPI*)function lineRemoveProvider; external 'Tapi32.dll' name 'lineRemoveProvider';
(*TAPI*)function lineSecureCall; external 'Tapi32.dll' name 'lineSecureCall';
(*TAPI*)function lineSendUserUserInfo; external 'Tapi32.dll' name 'lineSendUserUserInfo';
(*TAPI*){$IFDEF TAPI20}
(*TAPI*)function lineSetAgentActivity; external 'Tapi32.dll' name 'lineSetAgentActivity';
(*TAPI*)function lineSetAgentGroup; external 'Tapi32.dll' name 'lineSetAgentGroup';
(*TAPI*)function lineSetAgentState; external 'Tapi32.dll' name 'lineSetAgentState';
(*TAPI*){$ENDIF}
(*TAPI*)function lineSetAppPriority; external 'Tapi32.dll' name 'lineSetAppPriority';
(*TAPI*)function lineSetAppPriorityA; external 'Tapi32.dll' name 'lineSetAppPriority';
(*TAPI*)function lineSetAppPriorityW; external 'Tapi32.dll' name 'lineSetAppPriorityW';
(*TAPI*)function lineSetAppSpecific; external 'Tapi32.dll' name 'lineSetAppSpecific';
(*TAPI*){$IFDEF TAPI20}
(*TAPI*)function lineSetCallData; external 'Tapi32.dll' name 'lineSetCallData';
(*TAPI*){$ENDIF}
(*TAPI*)function lineSetCallParams; external 'Tapi32.dll' name 'lineSetCallParams';
(*TAPI*)function lineSetCallPrivilege; external 'Tapi32.dll' name 'lineSetCallPrivilege';
(*TAPI*){$IFDEF TAPI20}
(*TAPI*)function lineSetCallQualityOfService; external 'Tapi32.dll' name 'lineSetCallQualityOfService';
(*TAPI*)function lineSetCallTreatment; external 'Tapi32.dll' name 'lineSetCallTreatment';
(*TAPI*){$ENDIF}
(*TAPI*)function lineSetCurrentLocation; external 'Tapi32.dll' name 'lineSetCurrentLocation';
(*TAPI*)function lineSetDevConfig; external 'Tapi32.dll' name 'lineSetDevConfig';
(*TAPI*)function lineSetDevConfigA; external 'Tapi32.dll' name 'lineSetDevConfig';
(*TAPI*)function lineSetDevConfigW; external 'Tapi32.dll' name 'lineSetDevConfigW';
(*TAPI*){$IFDEF TAPI20}
(*TAPI*)function lineSetLineDevStatus; external 'Tapi32.dll' name 'lineSetLineDevStatus';
(*TAPI*){$ENDIF}
(*TAPI*)function lineSetMediaControl; external 'Tapi32.dll' name 'lineSetMediaControl';
(*TAPI*)function lineSetMediaMode; external 'Tapi32.dll' name 'lineSetMediaMode';
(*TAPI*)function lineSetNumRings; external 'Tapi32.dll' name 'lineSetNumRings';
(*TAPI*)function lineSetStatusMessages; external 'Tapi32.dll' name 'lineSetStatusMessages';
(*TAPI*)function lineSetTerminal; external 'Tapi32.dll' name 'lineSetTerminal';
(*TAPI*)function lineSetTollList; external 'Tapi32.dll' name 'lineSetTollList';
(*TAPI*)function lineSetTollListA; external 'Tapi32.dll' name 'lineSetTollList';
(*TAPI*)function lineSetTollListW; external 'Tapi32.dll' name 'lineSetTollListW';
(*TAPI*)function lineSetupConference; external 'Tapi32.dll' name 'lineSetupConference';
(*TAPI*)function lineSetupConferenceA; external 'Tapi32.dll' name 'lineSetupConference';
(*TAPI*)function lineSetupConferenceW; external 'Tapi32.dll' name 'lineSetupConferenceW';
(*TAPI*)function lineSetupTransfer; external 'Tapi32.dll' name 'lineSetupTransfer';
(*TAPI*)function lineSetupTransferA; external 'Tapi32.dll' name 'lineSetupTransfer';
(*TAPI*)function lineSetupTransferW; external 'Tapi32.dll' name 'lineSetupTransferW';
(*TAPI*)function lineShutdown; external 'Tapi32.dll' name 'lineShutdown';
(*TAPI*)function lineSwapHold; external 'Tapi32.dll' name 'lineSwapHold';
(*TAPI*)function lineTranslateAddress; external 'Tapi32.dll' name 'lineTranslateAddress';
(*TAPI*)function lineTranslateAddressA; external 'Tapi32.dll' name 'lineTranslateAddress';
(*TAPI*)function lineTranslateAddressW; external 'Tapi32.dll' name 'lineTranslateAddressW';
(*TAPI*)function lineTranslateDialog; external 'Tapi32.dll' name 'lineTranslateDialog';
(*TAPI*)function lineTranslateDialogA; external 'Tapi32.dll' name 'lineTranslateDialog';
(*TAPI*)function lineTranslateDialogW; external 'Tapi32.dll' name 'lineTranslateDialogW';
(*TAPI*)function lineUncompleteCall; external 'Tapi32.dll' name 'lineUncompleteCall';
(*TAPI*)function lineUnhold; external 'Tapi32.dll' name 'lineUnhold';
(*TAPI*)function lineUnpark; external 'Tapi32.dll' name 'lineUnpark';
(*TAPI*)function lineUnparkA; external 'Tapi32.dll' name 'lineUnpark';
(*TAPI*)function lineUnparkW; external 'Tapi32.dll' name 'lineUnparkW';
(*TAPI*)function phoneClose; external 'Tapi32.dll' name 'phoneClose';
(*TAPI*)function phoneConfigDialog; external 'Tapi32.dll' name 'phoneConfigDialog';
(*TAPI*)function phoneConfigDialogA; external 'Tapi32.dll' name 'phoneConfigDialog';
(*TAPI*)function phoneConfigDialogW; external 'Tapi32.dll' name 'phoneConfigDialogW';
(*TAPI*)function phoneDevSpecific; external 'Tapi32.dll' name 'phoneDevSpecific';
(*TAPI*)function phoneGetButtonInfo; external 'Tapi32.dll' name 'phoneGetButtonInfo';
(*TAPI*)function phoneGetButtonInfoA; external 'Tapi32.dll' name 'phoneGetButtonInfo';
(*TAPI*)function phoneGetButtonInfoW; external 'Tapi32.dll' name 'phoneGetButtonInfoW';
(*TAPI*)function phoneGetData; external 'Tapi32.dll' name 'phoneGetData';
(*TAPI*)function phoneGetDevCaps; external 'Tapi32.dll' name 'phoneGetDevCaps';
(*TAPI*)function phoneGetDevCapsA; external 'Tapi32.dll' name 'phoneGetDevCaps';
(*TAPI*)function phoneGetDevCapsW; external 'Tapi32.dll' name 'phoneGetDevCapsW';
(*TAPI*)function phoneGetDisplay; external 'Tapi32.dll' name 'phoneGetDisplay';
(*TAPI*)function phoneGetGain; external 'Tapi32.dll' name 'phoneGetGain';
(*TAPI*)function phoneGetHookSwitch; external 'Tapi32.dll' name 'phoneGetHookSwitch';
(*TAPI*)function phoneGetIcon; external 'Tapi32.dll' name 'phoneGetIcon';
(*TAPI*)function phoneGetIconA; external 'Tapi32.dll' name 'phoneGetIcon';
(*TAPI*)function phoneGetIconW; external 'Tapi32.dll' name 'phoneGetIconW';
(*TAPI*)function phoneGetID; external 'Tapi32.dll' name 'phoneGetID';
(*TAPI*)function phoneGetIDA; external 'Tapi32.dll' name 'phoneGetID';
(*TAPI*)function phoneGetIDW; external 'Tapi32.dll' name 'phoneGetIDW';
(*TAPI*)function phoneGetLamp; external 'Tapi32.dll' name 'phoneGetLamp';
(*TAPI*){$IFDEF TAPI20}
(*TAPI*)function phoneGetMessage; external 'Tapi32.dll' name 'phoneGetMessage';
(*TAPI*){$ENDIF}
(*TAPI*)function phoneGetRing; external 'Tapi32.dll' name 'phoneGetRing';
(*TAPI*)function phoneGetStatus; external 'Tapi32.dll' name 'phoneGetStatus';
(*TAPI*)function phoneGetStatusA; external 'Tapi32.dll' name 'phoneGetStatus';
(*TAPI*)function phoneGetStatusW; external 'Tapi32.dll' name 'phoneGetStatusW';
(*TAPI*)function phoneGetStatusMessages; external 'Tapi32.dll' name 'phoneGetStatusMessages';
(*TAPI*)function phoneGetVolume; external 'Tapi32.dll' name 'phoneGetVolume';
(*TAPI*)function phoneInitialize; external 'Tapi32.dll' name 'phoneInitialize';
(*TAPI*){$IFDEF TAPI20}
(*TAPI*)function phoneInitializeEx; external 'Tapi32.dll' name 'phoneInitializeEx';
(*TAPI*)function phoneInitializeExA; external 'Tapi32.dll' name 'phoneInitializeEx';
(*TAPI*)function phoneInitializeExW; external 'Tapi32.dll' name 'phoneInitializeExW';
(*TAPI*){$ENDIF}
(*TAPI*)function phoneNegotiateAPIVersion; external 'Tapi32.dll' name 'phoneNegotiateAPIVersion';
(*TAPI*)function phoneNegotiateExtVersion; external 'Tapi32.dll' name 'phoneNegotiateExtVersion';
(*TAPI*)function phoneOpen; external 'Tapi32.dll' name 'phoneOpen';
(*TAPI*)function phoneSetButtonInfo; external 'Tapi32.dll' name 'phoneSetButtonInfo';
(*TAPI*)function phoneSetButtonInfoA; external 'Tapi32.dll' name 'phoneSetButtonInfo';
(*TAPI*)function phoneSetButtonInfoW; external 'Tapi32.dll' name 'phoneSetButtonInfoW';
(*TAPI*)function phoneSetData; external 'Tapi32.dll' name 'phoneSetData';
(*TAPI*)function phoneSetDisplay; external 'Tapi32.dll' name 'phoneSetDisplay';
(*TAPI*)function phoneSetGain; external 'Tapi32.dll' name 'phoneSetGain';
(*TAPI*)function phoneSetHookSwitch; external 'Tapi32.dll' name 'phoneSetHookSwitch';
(*TAPI*)function phoneSetLamp; external 'Tapi32.dll' name 'phoneSetLamp';
(*TAPI*)function phoneSetRing; external 'Tapi32.dll' name 'phoneSetRing';
(*TAPI*)function phoneSetStatusMessages; external 'Tapi32.dll' name 'phoneSetStatusMessages';
(*TAPI*)function phoneSetVolume; external 'Tapi32.dll' name 'phoneSetVolume';
(*TAPI*)function phoneShutdown; external 'Tapi32.dll' name 'phoneShutdown';
(*TAPI*)function tapiGetLocationInfo; external 'Tapi32.dll' name 'tapiGetLocationInfo';
(*TAPI*)function tapiGetLocationInfoA; external 'Tapi32.dll' name 'tapiGetLocationInfo';
(*TAPI*)function tapiGetLocationInfoW; external 'Tapi32.dll' name 'tapiGetLocationInfoW';
(*TAPI*)function tapiRequestDrop; external 'Tapi32.dll' name 'tapiRequestDrop';
(*TAPI*)function tapiRequestMakeCall; external 'Tapi32.dll' name 'tapiRequestMakeCall';
(*TAPI*)function tapiRequestMakeCallA; external 'Tapi32.dll' name 'tapiRequestMakeCall';
(*TAPI*)function tapiRequestMakeCallW; external 'Tapi32.dll' name 'tapiRequestMakeCallW';
(*TAPI*)function tapiRequestMediaCall; external 'Tapi32.dll' name 'tapiRequestMediaCall';
(*TAPI*)function tapiRequestMediaCallA; external 'Tapi32.dll' name 'tapiRequestMediaCall';
(*TAPI*)function tapiRequestMediaCallW; external 'Tapi32.dll' name 'tapiRequestMediaCallW';
(*TAPI*)
(*TAPI*){$ELSE}
(*TAPI*)
(*TAPI*)function tapiRequestMakeCall; external 'TAPI' index 28;
(*TAPI*)function tapiRequestMediaCall; external 'TAPI' index 101;
(*TAPI*)function tapiRequestDrop; external 'TAPI' index 112;
(*TAPI*)function lineRegisterRequestRecipient; external 'TAPI' index 10;
(*TAPI*)function tapiGetLocationInfo; external 'TAPI' index 85;
(*TAPI*)function lineSetCurrentLocation; external 'TAPI' index 81;
(*TAPI*)function lineSetTollList; external 'TAPI' index 3;
(*TAPI*)function lineTranslateAddress; external 'TAPI' index 19;
(*TAPI*)function lineGetTranslateCaps; external 'TAPI' index 100;
(*TAPI*)function lineAccept; external 'TAPI' index 82;
(*TAPI*)function lineAddToConference; external 'TAPI' index 47;
(*TAPI*)function lineAnswer; external 'TAPI' index 103;
(*TAPI*)function lineBlindTransfer; external 'TAPI' index 25;
(*TAPI*)function lineClose; external 'TAPI' index 78;
(*TAPI*)function lineCompleteCall; external 'TAPI' index 76;
(*TAPI*)function lineCompleteTransfer; external 'TAPI' index 73;
(*TAPI*)function lineConfigDialog; external 'TAPI' index 12;
(*TAPI*)function lineConfigDialogEdit; external 'TAPI' index 135;
(*TAPI*)function lineDeallocateCall; external 'TAPI' index 111;
(*TAPI*)function lineDevSpecific; external 'TAPI' index 21;
(*TAPI*)function lineDevSpecificFeature; external 'TAPI' index 22;
(*TAPI*)function lineDial; external 'TAPI' index 29;
(*TAPI*)function lineDrop; external 'TAPI' index 23;
(*TAPI*)function lineForward; external 'TAPI' index 87;
(*TAPI*)function lineGatherDigits; external 'TAPI' index 52;
(*TAPI*)function lineGenerateDigits; external 'TAPI' index 105;
(*TAPI*)function lineGenerateTone; external 'TAPI' index 80;
(*TAPI*)function lineGetAddressCaps; external 'TAPI' index 71;
(*TAPI*)function lineGetAddressID; external 'TAPI' index 104;
(*TAPI*)function lineGetAddressStatus; external 'TAPI' index 60;
(*TAPI*)function lineGetCallInfo; external 'TAPI' index 97;
(*TAPI*)function lineGetCallStatus; external 'TAPI' index 94;
(*TAPI*)function lineGetConfRelatedCalls; external 'TAPI' index 72;
(*TAPI*)function lineGetDevCaps; external 'TAPI' index 116;
(*TAPI*)function lineGetDevConfig; external 'TAPI' index 79;
(*TAPI*)function lineGetNewCalls; external 'TAPI' index 34;
(*TAPI*)function lineGetIcon; external 'TAPI' index 53;
(*TAPI*)function lineGetID; external 'TAPI' index 40;
(*TAPI*)function lineGetLineDevStatus; external 'TAPI' index 49;
(*TAPI*)function lineGetNumRings; external 'TAPI' index 62;
(*TAPI*)function lineGetRequest; external 'TAPI' index 86;
(*TAPI*)function lineGetStatusMessages; external 'TAPI' index 45;
(*TAPI*)function lineHandoff; external 'TAPI' index 11;
(*TAPI*)function lineHold; external 'TAPI' index 6;
(*TAPI*)function lineInitialize; external 'TAPI' index 33;
(*TAPI*)function lineMakeCall; external 'TAPI' index 32;
(*TAPI*)function lineMonitorDigits; external 'TAPI' index 24;
(*TAPI*)function lineMonitorMedia; external 'TAPI' index 15;
(*TAPI*)function lineMonitorTones; external 'TAPI' index 31;
(*TAPI*)function lineNegotiateAPIVersion; external 'TAPI' index 64;
(*TAPI*)function lineNegotiateExtVersion; external 'TAPI' index 17;
(*TAPI*)function lineOpen; external 'TAPI' index 46;
(*TAPI*)function linePark; external 'TAPI' index 5;
(*TAPI*)function linePickup; external 'TAPI' index 102;
(*TAPI*)function linePrepareAddToConference; external 'TAPI' index 50;
(*TAPI*)function lineRedirect; external 'TAPI' index 38;
(*TAPI*)function lineRemoveFromConference; external 'TAPI' index 43;
(*TAPI*)function lineSecureCall; external 'TAPI' index 57;
(*TAPI*)function lineSendUserUserInfo; external 'TAPI' index 63;
(*TAPI*)function lineSetAppSpecific; external 'TAPI' index 88;
(*TAPI*)function lineSetCallParams; external 'TAPI' index 2;
(*TAPI*)function lineSetCallPrivilege; external 'TAPI' index 95;
(*TAPI*)function lineSetDevConfig; external 'TAPI' index 107;
(*TAPI*)function lineSetMediaControl; external 'TAPI' index 37;
(*TAPI*)function lineSetMediaMode; external 'TAPI' index 115;
(*TAPI*)function lineSetNumRings; external 'TAPI' index 61;
(*TAPI*)function lineSetStatusMessages; external 'TAPI' index 44;
(*TAPI*)function lineSetTerminal; external 'TAPI' index 108;
(*TAPI*)function lineSetupConference; external 'TAPI' index 48;
(*TAPI*)function lineSetupTransfer; external 'TAPI' index 65;
(*TAPI*)function lineShutdown; external 'TAPI' index 8;
(*TAPI*)function lineSwapHold; external 'TAPI' index 109;
(*TAPI*)function lineUncompleteCall; external 'TAPI' index 41;
(*TAPI*)function lineUnhold; external 'TAPI' index 113;
(*TAPI*)function lineUnpark; external 'TAPI' index 77;
(*TAPI*)function lineReleaseUserUserInfo; external 'TAPI' index 139;
(*TAPI*)function phoneClose; external 'TAPI' index 119;
(*TAPI*)function phoneConfigDialog; external 'TAPI' index 16;
(*TAPI*)function phoneDevSpecific; external 'TAPI' index 9;
(*TAPI*)function phoneGetButtonInfo; external 'TAPI' index 4;
(*TAPI*)function phoneGetData; external 'TAPI' index 93;
(*TAPI*)function phoneGetDevCaps; external 'TAPI' index 114;
(*TAPI*)function phoneGetDisplay; external 'TAPI' index 83;
(*TAPI*)function phoneGetGain; external 'TAPI' index 68;
(*TAPI*)function phoneGetHookSwitch; external 'TAPI' index 27;
(*TAPI*)function phoneGetIcon; external 'TAPI' index 74;
(*TAPI*)function phoneGetID; external 'TAPI' index 106;
(*TAPI*)function phoneGetLamp; external 'TAPI' index 117;
(*TAPI*)function phoneGetRing; external 'TAPI' index 70;
(*TAPI*)function phoneGetStatus; external 'TAPI' index 39;
(*TAPI*)function phoneGetStatusMessages; external 'TAPI' index 55;
(*TAPI*)function phoneGetVolume; external 'TAPI' index 59;
(*TAPI*)function phoneInitialize; external 'TAPI' index 35;
(*TAPI*)function phoneNegotiateAPIVersion; external 'TAPI' index 7;
(*TAPI*)function phoneNegotiateExtVersion; external 'TAPI' index 14;
(*TAPI*)function phoneOpen; external 'TAPI' index 89;
(*TAPI*)function phoneSetButtonInfo; external 'TAPI' index 42;
(*TAPI*)function phoneSetData; external 'TAPI' index 92;
(*TAPI*)function phoneSetDisplay; external 'TAPI' index 98;
(*TAPI*)function phoneSetGain; external 'TAPI' index 67;
(*TAPI*)function phoneSetHookSwitch; external 'TAPI' index 51;
(*TAPI*)function phoneSetLamp; external 'TAPI' index 118;
(*TAPI*)function phoneSetRing; external 'TAPI' index 69;
(*TAPI*)function phoneSetStatusMessages; external 'TAPI' index 56;
(*TAPI*)function phoneSetVolume; external 'TAPI' index 54;
(*TAPI*)function phoneShutdown; external 'TAPI' index 26;
(*TAPI*)function lineTranslateDialog; external 'TAPI' index 13;
(*TAPI*)function lineGetCountry; external 'TAPI' index 143;
(*TAPI*)function lineGetAppPriority; external 'TAPI' index 58;
(*TAPI*)function lineSetAppPriority; external 'TAPI' index 66;
(*TAPI*)function lineAddProvider; external 'TAPI' index 141;
(*TAPI*)function lineConfigProvider; external 'TAPI' index 75;
(*TAPI*)function lineRemoveProvider; external 'TAPI' index 142;
(*TAPI*)function lineGetProviderList; external 'TAPI' index 129;
(*TAPI*)
(*TAPI*){$ENDIF}
(*TAPI*)
(*TAPI*)function TAPIERROR_FORMATMESSAGE (ErrCode: Longint): Longint;
(*TAPI*)  begin
(*TAPI*)  if ErrCode > $FFFF0000 then
(*TAPI*)    Result := ErrCode and $FFFF
(*TAPI*)  else if ErrCode and $10000000 <> 0 then
(*TAPI*)    Result := ErrCode - $90000000 + $F000
(*TAPI*)  else
(*TAPI*)    Result := ErrCode - $80000000 + $F000;
(*TAPI*)  end;
(*TAPI*) {$A+}


procedure LineCallBackFunc(hDevice, dwMessage, dwInstance,
                           dwParam1, dwParam2, dwParam3: Longint); stdcall;
begin
  // Nothing
end;


function TDialUp.GetRasBaudRate(hRasConn: THRASConn; DeviceName: PChar; var dwBaud: DWord): Boolean;
const szAppName : PChar = 'RasBaud';
    hCall : THCall = 0;
var hInstance: THandle;
    hLineApp: THLineApp;
    dwNumDevs, dwDeviceID, dwApiVersion : Integer;
    hLine: THLine;
    ExtensionId: TLineExtensionID;
    lpCallList: LPLineCallList;
    lpCalls: ^THCall;
    dwNumCalls: DWord;
    lpLineDevCaps_: LPLineDevCaps;
    LineCallInfo: TLineCallInfo;

    lpszRasDeviceName: LPSTR;
    lpszTapiDeviceName: LPSTR;
    lReturn: Longint;

begin
  Result:=False;
  dwBaud:=0;

  lpszRasDeviceName := DeviceName; // RasConnStatus.szDeviceName;

  hInstance := GetModuleHandle(nil);

  lReturn:=lineInitialize(hLineApp, hInstance, lineCallbackFunc,
                          szAppName, dwNumDevs);
  if (lReturn <>0) then
  begin
     // lineInitialize failed
     Exit;
  end;

  lpCallList:= LPLineCallList(LocalAlloc(LMEM_FIXED, sizeof(TLINECALLLIST) + 128));
  lpCallList^.dwTotalSize := LocalSize(Cardinal(lpCallList));

  lpLineDevCaps_ := LPLineDevCaps(LocalAlloc(LMEM_FIXED, sizeof(TLINEDEVCAPS) + 1024));
  lpLineDevCaps_^.dwTotalSize := LocalSize(Cardinal(lpLineDevCaps_));

  LineCallInfo.dwTotalSize := sizeof(TLINECALLINFO);

  for dwDeviceID:= 0 to dwNumDevs-1 do
  begin
    lReturn:=lineNegotiateAPIVersion (hLineApp, dwDeviceID,
                                      TAPI_CURRENT_VERSION, TAPI_CURRENT_VERSION,
                                      dwApiVersion, ExtensionID);
    if (lReturn <> 0 ) then
    begin
      // This line device isn't useable by RAS anyway.
      continue;
    end;

    // Get the name of this TAPI line device.
    while(TRUE) do
    begin
      lReturn := lineGetDevCaps(hLineApp, dwDeviceID, dwApiVersion, 0, lpLineDevCaps_^);
      if (lReturn<>0) then
      begin
        // lineGetDevCaps error
        Break;
      end;

      if (lpLineDevCaps_.dwNeededSize <= lpLineDevCaps_.dwTotalSize) then
            break;

         // Buffer wasn't big enough.  Reallocate.
         lpLineDevCaps_ := LPLineDevCaps(LocalReAlloc(Cardinal(lpLineDevCaps_),
               lpLineDevCaps_.dwNeededSize, LMEM_MOVEABLE));
         lpLineDevCaps_.dwTotalSize := LocalSize(Cardinal(lpLineDevCaps_));
      end;

      if (lReturn<>0) then  // Failed lineGetDevCaps
         continue;

      lpszTapiDeviceName:=PChar(Integer(lpLineDevCaps_)+(lpLineDevCaps_.dwLineNameOffset));


      // Is this TAPI line device the one RAS is using?
      if (lstrcmp(lpszRasDeviceName, lpszTapiDeviceName) <> 0) then
         continue;

      // Have to open the line to get any possible call handles
      lReturn:=lineOpen(hLineApp, dwDeviceID, hLine,
               dwApiVersion, 0, 0, LINECALLPRIVILEGE_NONE, 0, nil);
      if (lReturn <> 0) then
      begin
        // Failed to open.  RAS can't be using this line. (FormatLineError(lReturn, szBuff))
        Continue;
      end;

      // Now get all outstanding call handles
      while (TRUE) do
      begin
        lReturn:=lineGetNewCalls(hLine, 0, LINECALLSELECT_LINE,
                  lpCallList^);
         if (lReturn <> 0) then
         begin
           Break;
            // If this fails, something is seriously wrong, but RAS
            // is very unlikely to be using this line.
            // FormatLineError(lReturn, szBuff))
         end;

         if (lpCallList.dwNeededSize <= lpCallList.dwTotalSize) then
            break;

         // buffer wasn't big enough (not likely to happen, but could).
         // Reallocate and try again.

         lpCallList := LPLineCallList(LocalReAlloc(Cardinal(lpCallList), lpCallList.dwNeededSize, LMEM_MOVEABLE));
         lpCallList.dwTotalSize := LocalSize(Cardinal(lpCallList));
      end;

      if (lReturn<>0) then  // Failed to get the new call list.
         continue;

      dwNumCalls := lpCallList.dwCallsNumEntries;

      lpCalls:=Pointer(Integer(lpCallList)+lpCallList.dwCallsOffset);

      // No calls on this line?  Try the next line.
      if (dwNumCalls = 0) then
         continue;

      // Identify which call RAS is using.

      // ASSUMPTION:  The speed of the first call is good enough.
      // If a modem is used, only one call per line is possible.
      // If ISDN is used, all calls on the line are the same speed.
      // Modem banks will be represented as one modem per line.

      hCall := lpCalls^;

      break;
   end;

   if (hCall<>0) then
   begin
     lReturn := lineGetCallInfo(hCall, LineCallInfo);
      if (lReturn<>0) then
      begin
        // lineGetCallInfo failed (FormatLineError(lReturn, szBuff)))
        hCall := 0;
      end else
      begin
         dwBaud := LineCallInfo.dwRate;
      end;
   end;

   LocalFree(Cardinal(lpCallList));
   LocalFree(Cardinal(lpLineDevCaps_));
   lineShutdown(hLineApp);  // closing all calls and lines here also.

   result:=(hCall<>0);
end;


initialization

finalization
  if Rnaph_initialized and Is_rnaph then FreeLibrary(lib);
end.

