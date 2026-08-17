unit IdDNSResolver;

{
Primary RFC - 1035

Domain Names Introduction
http://www.freesoft.org/CIE/Topics/10.htm

DNS Protocol Overview
http://www.freesoft.org/CIE/Topics/77.htm

Domain Naming
http://www.freesoft.org/CIE/Course/Section2/index.htm

RFC 1034 Domain Names - Concepts and Facilities
http://www.rfc-editor.org/rfc/rfc1034.txt

RFC 1035 Domain Names - Implementation and Specification
http://www.rfc-editor.org/rfc/rfc1035.txt

RFC 1591 Domain Name System Structure and Delegation
http://www.rfc-editor.org/rfc/rfc1591.txt

WhoIs
http://www.freesoft.org/CIE/Topics/38.htm

DIG
http://www.freesoft.org/CIE/Topics/35.htm

RFC 1183 New DNS RR Definitions.
http://www.rfc-editor.org/rfc/rfc1183.txt

RFC 1536 Common DNS Implementation Errors and Suggested Fixes.
http://www.rfc-editor.org/rfc/rfc1536.txt

RFC 1706 DNS NSAP Resource Records.
http://www.rfc-editor.org/rfc/rfc1706.txt

RFC 1912 Common DNS Operational and Configuration Errors.
http://www.rfc-editor.org/rfc/rfc

RFC 1995 Incremental Zone Transfer in DNS.
http://www.rfc-editor.org/rfc/rfc1995.txt

RFC 1996 A Mechanism for Prompt Notification of Zone Changes (DNS
NOTIFY).
http://www.rfc-editor.org/rfc/rfc1996.txt

RFC 2136 Dynamic Updates in the Domain Name System (DNS UPDATE).
http://www.rfc-editor.org/rfc/rfc2136.txt

RFC 2137 Secure Domain Name System Dynamic Update. D. Eastlake.
http://www.rfc-editor.org/rfc/rfc2137.txt

RFC 2181 Clarifications to the DNS Specification.
http://www.rfc-editor.org/rfc/rfc2181.txt

RFC 2182 Selection and Operation of Secondary DNS Servers.
http://www.rfc-editor.org/rfc/rfc2182.txt

RFC 2219 Use of DNS Aliases for Network Services.
http://www.rfc-editor.org/rfc/rfc2219.txt

RFC 2308 Negative Caching of DNS Queries (DNS NCACHE).
http://www.rfc-editor.org/rfc/rfc2308.txt

RFC 2536 DSA KEYs and SIGs in the Domain Name System (DNS).
http://www.rfc-editor.org/rfc/rfc2536.txt

RFC 2537 RSA/MD5 KEYs and SIGs in the Domain Name System (DNS).
http://www.rfc-editor.org/rfc/rfc2537.txt

RFC 2538 Storing Certificates in the Domain Name System (DNS).
http://www.rfc-editor.org/rfc/rfc2538.txt

RFC 2539 Storage of Diffie-Hellman Keys in the Domain Name System
(DNS).
http://www.rfc-editor.org/rfc/rfc2539.txt

RFC 2541 DNS Security Operational Considerations.
http://www.rfc-editor.org/rfc/rfc2541.txt

RFC 2606 Reserved Top Level DNS Names.
http://www.rfc-editor.org/rfc/rfc2606.txt

RFC 2671 Extension Mechanisms for DNS (EDNS0).
http://www.rfc-editor.org/rfc/rfc2671.txt

RFC 2672 Non-Terminal DNS Name Redirection.
http://www.rfc-editor.org/rfc/rfc2672.txt

RFC 2694 DNS extensions to Network Address Translators (DNS_ALG).
http://www.rfc-editor.org/rfc/rfc2694.txt

RFC 2782 A DNS RR for specifying the location of services (DNS SRV).
http://www.rfc-editor.org/rfc/rfc2782.txt

RFC 2826 IAB Technical Comment on the Unique DNS Root.
http://www.rfc-editor.org/rfc/rfc2826.txt

RFC 2845 Secret Key Transaction Authentication for DNS (TSIG).
http://www.rfc-editor.org/rfc/rfc2845.txt

RFC 2874 DNS Extensions to Support IPv6 Address Aggregation and
Renumbering.
http://www.rfc-editor.org/rfc/rfc2874.txt

RFC 2915 The Naming Authority Pointer (NAPTR) DNS Resource Record.
http://www.rfc-editor.org/rfc/rfc2915.txt

RFC 2916 E.164 number and DNS.
http://www.rfc-editor.org/rfc/rfc2916.txt

RFC 2929 Domain Name System (DNS) IANA Considerations.
http://www.rfc-editor.org/rfc/rfc2929.txt

RFC 2930 Secret Key Establishment for DNS (TKEY RR).
http://www.rfc-editor.org/rfc/rfc2930.txt

RFC 2931 DNS Request and Transaction Signatures
http://www.rfc-editor.org/rfc/rfc2931.txt

  2000-May-21 Hadi Hariri
    - Restructered component. Added methods and properties to allow resolving
      of a host with only one call, returning all the records in properties.
  2000-May-19 Hadi Hariri
    - Continued port to Indy
  2000-May-2 J. Peter Mugaas
    - Removed TIdDNSMessage class and moved the functionality to TIdDNSResolver
      Put many of the data-types into objects
      Added Procedure ResolveDNS to do the DNS resolve
  2000-May-1 J. Peter Mugaas
    - Ported to Indy
  2000-Jan-13 MT Lussier
    - Moved to new Palette Scheme (Winshoes Server)
  1999- July-24 Ray Malone
    - Completed
  1999- July-15 Ray Malone
    - Start Date
 }

//------------------------------------------------------------------------------
// A DNS REsolver sends a Dns Header and a DnsQuestion to a DNS server.
// Type DNS Header (tDNSHeader) is a component to store the header of
// a DNSResolver Query and Header DNS Server Response
// The ReEsolver sends the Server a header and the Sever returns it with various
// bits or values set.
// The Most significant are the Rcodes (Return Codes) If the Rcode is 0 the
// the server was able to complete the requested task. Otherwise it contains
// an error code for what when wrong. The RCodes are listed below.
//
// fQdCount is the number of entries in the request from a resolver to a server.
// fQdCount would normally be set to 1.
//
// fAnCount is set by the server to the number of answers to the query.
//
// fNsCount is the number of entries in the Name Server list
//
// fArCount is the number of additional records.
//
// TIdDNSHeader exposes all the fields of a header... even those only set by
// the server so it can be used to build a DNS server
//------------------------------------------------------------------------------

//-----------------------------------------------------------------------------
// A DnsResolver and Dns Server both deal with data in a manner designed to
// conserve bandwith and are not conducive to data structures. In other words
// the data must be parsed. The questions and replies in WinshoeDNSResolver are
// parsed so users can just assign and read data from pascal sturctures.
//------------------------------------------------------------------------------

//------------------------------------------------------------------------------
// Header, question, and response objects make up the DNS Message object.
// the TIdDNSQuestionList is used to hold both the send and received queries
// in easy to handle pascal data structures
// A Question Consists of a Name, Atype and aClass.
//   Name can be a domain name or an IP address depending on the type of
//   question. Question and answer types and Classes are given constant names
//   below;
//------------------------------------------------------------------------------
//
//------------------------------------------------------------------------------
// DNS Servers return data in various forms. the TIdDNSResolver parses this data
// and puts it in structures depending on its aType as shown in the Const
// QType definitions above.
// Data Structures for the Responses to the various Qtypes are defined below.
//------------------------------------------------------------------------------
//
// The PROCEDURE CreateQueryPacket takes the Mesage header and questions and
// formats them in to a query packet for sending. When the Server responds
// with a reply packet the  PROCEDURE DecodeReplyPacket formats the reply into
// the proper response data structures depending on the type of reponse.
//------------------------------------------------------------------------------

interface

Uses
  Classes,
  IdResourceStrings,
  SysUtils,
  IdGlobal,
  IdUDPClient;

const
  IdDNSResolver_ReceiveTimeout = 4000;

const
  //fBitCode Bits and Masks
  cQRBit      = $8000;   //QR when 0 = Question when 1 Response
  cQRMask     = $EFFF;
  cOpCodeBits = $7800;   //Operation Code See Constansts Defined Below
  cOpCodeMask = $87FF;
  cAABit      = $0400;   //Valid in Responses Authoritative Answer if set (1)
  cAAMask     = $FBFF;
  cTCBit      = $0200;   //Truncation Bit if Set Messages was truncated for length
  cTCMask     = $FDFF;
  cRDBit      = $0100;   //If set(1) Recursive Search is Resquested by Query
  cRDMask     = $FEFF;
  cRABit      = $0080;   //If set(1) Server supports Recursive Search (Available)
  cRAMask     = $FF7F;
  cRCodeBits  = $000F;   //Response Code. See Constansts Defined Below
  cRCodeMask  = $FFF0;

   //Question Operation Code Values
  cResQuery  = 0;
  cResIQuery = 1;
  cResStatus = 2;
  cOPCodeStrs : Array[cResQuery..cResStatus] Of String[7] =
     ('Query',
      'IQuery',
      'Status');

  // QType Identifes the type of Question
  cA     =  1;  // a Host Address
  cNS    =  2;  // An Authoritative name server
  cMD    =  3;  // A mail destination obsolete use MX (OBSOLETE)
  cMF    =  4;  // A mail forwarder obsolete use MX   (OBSOLETE)
  cName  =  5;  // The canonical name for an alias
  cSOA   =  6;  // Marks the start of a zone of authority
  cMB    =  7;  // A mail box domain name (Experimental)
  cMG    =  8;  // A mail group member (Experimental)
  cMR    =  9;  // A mail Rename Domain Name (Experimental)
  cNULL  = 10;  // RR (Experimental)
  cWKS   = 11;  // A well known service description
  cPTR   = 12;  // A Domain Name Pointer;
  cHINFO = 13;  // Host Information;
  cMINFO = 14;  // Mailbox or Mail List Information;
  cMX    = 15;  // Mail Exchange
  cTXT   = 16;  // Text String;
  cAXFR  = 252; // A Request for the Transfer of an entire zone;
  cMAILB = 253; // A request for mailbox related records (MB MG OR MR}
  cMAILA = 254; // A request for mail agent RRs (Obsolete see MX)
  cStar =  255; // A Request for all Records

  //QClass
  cIN  =  1;   //The Internet
  cCS  =  2;   // the CSNet Obsolete
  cCH  =  3;   // The Chaos Claee
  cHS  =  4;   // Hesiod [Dyer 87]

  //CStar any Class is same as QType for all records;
  cQClassStr :Array[cIN..CHs] Of String[3] =
  ('IN','CS','CH','HS');

  //Sever Response codes (RCode)
  cRCodeNoError   = 0;
  cRCodeFormatErr = 1;
  cRCodeServerErr = 2;
  cRCodeNameErr   = 3;
  cRCodeNotImplemented = 4;
  cRCodeRefused  = 5;

  cRCodeStrs : Array[cRCodeNoError..cRCodeRefused] Of String =
    (RSCodeNoError,
    RSCodeQueryFormat,
    RSCodeQueryServer,
    RSCodeQueryName,
    RSCodeQueryNotImplemented,
    RSCodeQueryQueryRefused);

//------------------------------------------------------------------------------
// Type DNS Header (tDNSHeader) is a component to store the header of
// a DNSResolver Query  And DNS Server Response
// The REsolver sends the Server a header and the Sever returns it with various
// bits or values set.
// The Most significant are the Rcodes (Return Codes) If the Rcode is 0 the
// the server was able to complete the requested task. Otherwise it contains
// an error code for what when wrong. The RCodes are listed immediately above.
//
// fQdCount is the number of entries in the request from a resolver to a server.
// fQdCount would normally be set to 1.
//
// fAnCount is set by the server to the number of answers to the query.
//
// fNsCount is the number of entries in the Name Server list
//
// fArCount is the number of additional records.
//
// TIdDNSHeader exposes all the fields of a header... even those only set by
// the server so it can be used to build a DNS server
//------------------------------------------------------------------------------

type
  TWKSBits = array[0..7] of byte;

  TRequestedRecord = cA..cStar;

  TRequestedRecords = set of TRequestedRecord;

  TIdDNSHeader = class(TObject)
  protected
    FAnCount: Word; //Number of Resource Records in Answer Section
    FArCount: Word; //Number of Resource Records in Additional records Section
    FBitCode: Word; //Holds Qr,OPCode AA TC RD RA RCode and Reserved Bits
    FId : Word;      //Query Id To type Responses to Queries
    FQdCount: Word; //Number of Question Entries in Question Section
    FNsCount: Word; //Number of Name Server Resource Recs in  Authority Rec Section
    function GetAA: Boolean;
    function GetOpCode: Word;
    function GetQr: Boolean;
    function GetRA: Boolean;
    function GetRCode: Word;
    function GetRD: Boolean;
    function GetTC: Boolean;
    procedure InitializefId;
    procedure SetAA(AuthAnswer: Boolean);
    procedure SetOpCode(OpCode: Word);
    procedure SetQr(IsResponse: Boolean);
    procedure SetRA(RecursionAvailable: Boolean);
    procedure SetRCode(RCode: Word);
    procedure SetRD(RecursionDesired: Boolean);
    procedure SetTC(IsTruncated: Boolean);
  public
    constructor Create;
    procedure InitVars; virtual;
    //
    property AA: boolean read GetAA write SetAA;
    property ANCount: Word read FAnCount write FAnCount;
    property ARCount: Word read FArCount write FArCount;
    property ID: Word read FId write FId;
    property NSCount: Word read FNsCount write FNsCount;
    property Opcode: Word read GetOpCode Write SetOpCode;
    property QDCount: Word read FQdCount write FQdCount;
    property Qr: Boolean read GetQr write SetQr;
    property RA: Boolean read GetRA write SetRA;
    property RCode: Word read GetRCode write SetRCode;
    property RD: Boolean read GetRD write SetRD;
    property TC: Boolean read GetTC write SetTC;
  end;

//-----------------------------------------------------------------------------
// A DnsResolver and Dns Server both deal with data in a manner designed to
// conserve bandwith and are not conducive to data structures. In other words
// the data must be parsed. The questions and replies in WinshoeDNSResolver are
// parsed so users can just assign and read data from pascal sturctures.
//------------------------------------------------------------------------------

  TQuestionItem = class(TCollectionItem)
  public
    QClass: Word;
    QName: string;
    QType: Word; // QType Identifes the type of Question
  end;

//------------------------------------------------------------------------------
// Header, question, and response objects make up the DNS Message object.
// the TIdDNSQuestionList is used to hold both the send and received queries
// in easy to handle pascal data structures
//------------------------------------------------------------------------------

  TIdDNSQuestionList = class(TCollection)
  protected
    function GetItem(Index: Integer): TQuestionItem;
    procedure SetItem(Index: Integer; const Value: TQuestionItem);
  public
    Constructor Create;  reintroduce;
    function Add: TQuestionItem;
    property Items[Index: Integer]: TQuestionItem read GetItem write SetItem; default;
  end;

//------------------------------------------------------------------------------
// DNS Servers return data in various forms. the TIdDNSResolver parses this data
// and puts it in structures depending on its aType as shown in the Const
// QType definitions above.
// Data Structures for the Responses to the various Qtypes are defined next.
//------------------------------------------------------------------------------

  THInfo = record
    CPUStr: ShortString;
    OsStr: ShortString;
  end;

  TMInfo = record
    EMailBox: ShortString;
    RMailBox: ShortString;
  end;

  TMX = record
    Exchange: ShortString;
    Preference: Word;
  end;

  TSOA = record
    Expire: Cardinal;
    Minimum: Cardinal;
    MName: ShortString;
    Refresh: Cardinal;
    Retry: Cardinal;
    RName: ShortString;
    Serial: Cardinal;
  end;

  TWKS = record
    Address: Cardinal;
    Bits: TWKSBits;
    Protocol: byte;
  end;

//------------------------------------------------------------------------------
// The Returnd Data (RData) from a server in response to a query can be in
// several formats the following variant record is used to hold the returned
// data.
//-----------------------------------------------------------------------------

  //TODO: This is a vestigal left over intermediate structure. It is no longer a
  // variant record because of CB. In 8.1 this intermediate step will be eliminated.
  TRdata = record
    DomainName: string;
    HInfo: THInfo;
    MInfo: TMInfo;
    MX: TMx;
    SOA: TSOA;
    A: Cardinal;
    WKS: TWks;
    Data: string;
    HostAddrStr: string;
  end;

//------------------------------------------------------------------------------
// The total Data returned by server in response to a query is stored the
// following Record  structure.
// The Name, Type, and Class  were defines as Qname, Qtype, and QClass above
// TTL is a dateTime Cardinal to tell when the information expires. This is uses
// By resolvers to cache data to hold network traffic to a mimimum.
// The Winshoe DNS Resolvers does not implement a cache.
// RData if defined above
// StarData is of indefinate length. the '*' Query type is send me everything
// It is Defined as an RData Type but a pascal variant record can not store
// a type String so we made a Star data string;
//-----------------------------------------------------------------------------

  TIdDNSResourceItem = class(TCollectionITem)
  public
    AType: Word;
    AClass: Word;
    Name: String;
    RData: TRData;
    RDLength: Word;
    TTL: Cardinal;
    StarData: string;
  end;

//------------------------------------------------------------------------------
// TIdDNSResourceList objects are used to hold the three kinds of information
// a server uses to reply to a Query;
// 3 TIdDNSResourceList objects are used in a TIdDNSResolver
//------------------------------------------------------------------------------

  TIdDNSResourceList = class(TCollection)
  protected
    function GetItem(Index: Integer): TIdDNSResourceItem;
    procedure SetItem(Index: Integer; const Value:TIdDNSResourceItem);
  public
    function Add: TIdDNSResourceItem ;
    constructor Create; reintroduce;
    property Items[Index: Integer]: TIdDNSResourceItem read GetItem write SetItem; default;
  published
    // Add functions here to resolve all types of queries.
    function GetDNSMxExchangeNameEx(Idx: Integer): string;
    function GetDNSRDataDomainName(Idx: Integer): string;
  end;

  TMXRecord = class(TIdDNSResourceItem)
  protected
    FPreference: Word;
    FExchange: string;
  public
    property Preference: Word read FPreference;
    property Exchange: string read FExchange;
  end;

  TARecord = class(TIdDNSResourceItem)
  protected
    FDomainName: string;
  public
    property DomainName: string read FDomainName;
  end;

  TNameRecord = class(TIdDNSResourceItem)
  protected
    FDomainName : string;
  public
    property DomainName : string read FDomainName;
  end;
  TPTRRecord = class(TIdDNSResourceItem)
  protected
    FDomainName : string;
  public
    property DomainName : string read FDomainName;
  end;

  THInfoRecord = class(TIdDNSResourceItem)
  protected
    FCPUStr: string;
    FOsStr: string;
  public
    property CPUStr: string read FCPUStr;
    property OsStr: string read FOsStr;
  end;

  TMInfoRecord = class(TIdDNSResourceItem)
  protected
    FEMmailBox: string;
    FRMailBox: string;
  public
    property EMmailBox: string read FEMmailBox;
    property RMailBox: string read FRMailBox;
  end;

  TMRecord = class(TIdDNSResourceItem)
  protected
    FEMailBox: string;
    FRMailBox: string;
  public
    property EMailBox: string read FEMailBox;
    property RMailBox: string read FRMailBox;
  end;

  TSOARecord = class(TIdDNSResourceItem)
  protected
    FExpire: Cardinal;
    FMinimum: Cardinal;
    FMName: string;
    FRefresh: Cardinal;
    FRetry: Cardinal;
    FRName: string;
    FSerial: Cardinal;
  public
    property Expire: Cardinal read FExpire;
    property Minimum: Cardinal read FMinimum;
    property MName: string read FMName;
    property Refresh: Cardinal read FRefresh;
    property Retry: Cardinal read FRetry;
    property RName: string read FRName;
    property Serial: Cardinal read FSerial;
  end;

  TWKSRecord = class(TIdDNSResourceItem)
  protected
    FAddress: Cardinal;
    FBits: TWKSBits;
    FProtocol: byte;
    //
    function GetBits(AIndex: Integer): Byte;
  public
    property Address: Cardinal read FAddress;
    property Bits[AIndex: Integer]: Byte read GetBits;
    property Protocol: byte read FProtocol;
  end;

  TIdDNSResolver = class(TIdUDPClient)
  protected
    FDNSAnList: TIdDNSResourceList;
    FDNSArList: TIdDNSResourceList;
    FDNSHeader: TIdDNSHeader;
    FDNSQdList: TIdDNSQuestionList;
    FDNSNsList: TIdDNSResourceList;
    FQPacket: string;
    FRPacket: string;
    FQPackSize: Integer;
    FRequestedRecords: TRequestedRecords;
    FRPackSize: Integer;

    FAnswers: TIdDNSResourceList;

    function CreateLabelStr(QName: string): string;
    procedure CreateQueryPacket;
    procedure DecodeReplyPacket;
  public
    procedure ClearVars; virtual;
    constructor Create(AOwner: TComponent); override;
    destructor Destroy; override;
    procedure ResolveDNS;
    procedure ResolveDomain(const ADomain: string);
    //
    property Answers: TIdDNSResourceList read FAnswers;
    property DNSAnList: TIdDNSResourceList read FDnsAnList write FDnsAnList;
    property DNSARList: TIdDNSResourceList read FDnsArList write FDnsArList;
    property DNSHeader: TIdDNSHeader read FDNSHeader write FDNSHeader;
    property DNSQDList: TIdDNSQuestionList read FDnsQdList write FDnsQdList;
    property DNSNSList: TIdDNSResourceList read FDnsNsList write FDnsNsList;
    property Port default IdPORT_DOMAIN;
    property QPacket: string read FQPacket write FQpacket;
    property RequestedRecords: TRequestedRecords read FRequestedRecords write FRequestedRecords;
    property RPacket: string read FRPacket write FRPacket;
    property ReceiveTimeout default IdDNSResolver_ReceiveTimeout;
  end;

  HiLoBytes = record
    HiByte: Byte;
    LoByte: Byte;
  end;

  WordRec = Record
    case byte of
      1:(TheBytes : HiLoBytes);
      2:(AWord : Word);
    end;

  HiLoWords = record
    HiWord,
    LowWord: Word;
  end;

  CardinalRec = record
    case Byte of
      1 :(aCardinal : Cardinal);
      2 :(Words : HILoWords);
    end;

 function GetQTypeStr(aQType: Integer): String;
 function GetQClassStr(QClass: Integer):String;

implementation

uses
  IdException;

//---------------------------Low Level Routines --------------------------------
//TODO: Use a variant record - more efficient. Move to IdGlobal
function TwoCharToWord(AChar1,AChar2: Char):Word;
  //Since Replys are returned as Strings, we need a rountime to convert two
  // characters which are a 2 byte U Int into a two byte unsigned integer
begin
  Result :=Word((Ord(AChar1) shl 8) and $FF00) or Word(Ord(AChar2) and $00FF);
end;

function FourCharToCardinal(AChar1,AChar2,AChar3,AChar4 : Char): Cardinal;
var
  ARes : CardinalRec;
begin
  ares.Words.HiWord := TwoCharToWord(AChar1,AChar2);
  aRes.Words.LowWord := TwoCharToWord(AChar3,AChar4);
  Result := ARes.aCardinal;
end;

function WordToTwoCharStr(AWord : Word): String;
begin
  //Since Queries are sent as Strings, we need a rountime to convert a UINT
  // into a two byte String
  Result := Chr ( Hi ( AWord ) ) + Chr ( Lo ( AWord ) );
end;

function GetRCodeStr(RCode : Integer): String;
begin
  if Rcode in [cRCodeNoError..cRCodeRefused] then
  begin
    Result :=  cRCodeStrs[Rcode];
  end  // if Rcode in [cRCodeNoError..cRCodeRefused] then
  else
  begin
    Result := RSCodeQueryUnknownError;
  end; //else.. if Rcode in [cRCodeNoError..cRCodeRefused] then
end;

function  GetQTypeStr ( aQType: Integer ) : String;
begin
  Case AQType Of
    cA     : Result := 'A';     // a Host Address
    cNS    : Result := 'NS';    // An Authoritative name server
    cMD    : Result := 'MD';    // A mail destination obsolete use MX (OBSOLETE)
    cMF    : Result := 'MF';    // A mail forwarder obsolete use MX   (OBSOLETE)
    cName  : Result := 'NAME';  // The canonical name for an alias
    cSOA   : Result := 'SOA';   // Marks the start of a zone of authority
    cMB    : Result := 'MB';    // A mail box domain name (Experimental)
    cMG    : Result := 'MG';    // A mail group member (Experimental)
    cMR    : Result := 'MR';    // A mail Rename Domain Name (Experimental)
    cNULL  : Result := 'NULL';  // RR (Experimental)
    cWKS   : Result := 'WKS';   // A well known service description
    cPTR   : Result := 'PTR';   // A Domain Name Pointer;
    cHINFO : Result := 'HINFO'; // Host Information;
    cMINFO : Result := 'MINFO'; // Mailbox or Mail List Information;
    cMX    : Result := 'MX';    // Mail Exchange
    cTXT   : Result := 'TXT';   // Text String;
    cAXFR  : Result := 'AXFR';  // A Request for the Transfer of an entire zone;
    cMAILB : Result := 'MAILB'; // A request for mailbox related records (MB MG OR MR}
    cMAILA : Result := 'MAILA'; // A request for mail agent RRs (Obsolete see MX)
    cStar : Result := '*';     // A Request for all Records
  else
    Result := IntToSTr ( aQType );
  end; //Case AQType Of
End;

function GetQClassStr(QClass: Integer):String;
begin
  if QClass in [cIN..CHs] then
  begin
    Result := cQClassStr[QClass];
  end // if QClass in [cIN..CHs] then
  else
  begin
    if QClass = 15 Then
    begin
      Result := 'MX';
    end  //if QClass = 15 Then
    else
    begin
      Result := IntToStr(QClass);
    end;  //else..if QClass = 15 Then
  end; // else..if QClass in [cIN..CHs] then
end;

function GetErrorStr(Code, Id :Integer): String;
begin
  case code Of
    1 : Result := Format ( RSQueryInvalidQueryCount, [ Id ] );
    2 : Result := Format ( RSQueryInvalidPacketSize, [ InttoSTr(Id) ] );
    3 : Result := Format ( RSQueryLessThanFour, [ Id ] );
    4 : Result := Format ( RSQueryInvalidHeaderID, [ Id ] );
    5 : Result := Format ( RSQueryLessThanTwelve, [ Id ] );
    6 : Result := Format ( RSQueryPackReceivedTooSmall, [Id] );
  end;  //case code Of
end;
//------------------------ End Low Level Routines ------------------------------


//----------------------- Start tDNSQuestionList -------------------------------
// Coded July 15, 1999 By RM
// A DNS Resolver uses a header structure to send information about
// requests to the server.
// This DNS Resolver puts the header into a Pascal object
// The Resolver then converts the object data into
// the RFC 1035 format before trasmission.
//------------------------------------------------------------------------------
constructor TIdDNSHeader.Create;
begin
  inherited Create;
  InitialIzeFid;
end;

procedure TIdDNSHeader.InitializefId;
begin
  Randomize;
  fId := Random ( 10000 );
end;

procedure TIdDNSHeader.InitVars;
begin
  fBitCode := 0; { Holds Qr,OPCode AA TC RD RA RCode and Reserved Bits           }
  fQdCount := 0; { Number of Question Entries in Question Section                }
  fAnCount := 0; { Number of Resource Records in Answer Section                  }
  fNsCount := 0; { Number of Name Server Resource Recs in  Authority Rec Section }
  fArCount := 0; { Number of Resource Records in Additional records Section      }
end;

function TIdDNSHeader.GetQR : Boolean;
begin
  Result := (fBitCode And cQRBit) = cQRBit;
end;

procedure TIdDNSHeader.SetQr( IsResponse : Boolean);
begin
  if IsResponse then
  begin
    fBitCode := fBitCode or cQRBit;
  end  //if IsResponse then
  else
  begin
    fBitCode := fBitCode And cQRMask
  end; //else..if IsResponse then
end;

function TIdDNSHeader.GetOpCode : Word;
begin
  Result := ( ( fBitCode and cOpCodeBits ) shr 11) and $000F;
end;

procedure TIdDNSHeader.SetOpCode(OpCode: Word);
Begin
  fBitCode := ( ( OpCode  Shl 11 ) and cOpCodeBits ) or
              ( fBitCode and cOpCodeMask );
end;

function TIdDNSHeader.GetAA : Boolean;
begin
  Result := ( fBitCode and cAABit ) = cAABit;
end;

procedure TIdDNSHeader.SetAA(AuthAnswer: Boolean);
begin
  if AuthAnswer then
  begin
    fBitCode := fBitCode Or cAABit;
  end //if AuthAnswer then
  else
  begin
    fBitCode := fBitCode And cAAMask;
  end; //else..if AuthAnswer then
end;

function TIdDNSHeader.GetTC : Boolean;
begin
  Result := ( fBitCode And cTCBit ) = cTCBit;
end;

procedure TIdDNSHeader.SetTC(IsTruncated: Boolean);
begin
  if IsTruncated then
  begin
    fBitCode := fBitCode or cTCBit;
  end // if IsTruncated then
  else
  begin
    fBitCode := fBitCode and cTCMask;
  end;  // else..if IsTruncated then
end;

function TIdDNSHeader.GetRD : Boolean;
begin
  Result := ( fBitCode And cRDBit ) = cRDBit;
end;

procedure TIdDNSHeader.SetRD(RecursionDesired: Boolean);
begin
  if RecursionDesired then
  begin
    fBitCode := fBitCode or cRDBit;
  end  // if RecursionDesired then
  else
  begin
    fBitCode := fBitCode and cRDMask;
  end; //else..if RecursionDesired then
end;

function TIdDNSHeader.GetRA : Boolean;
begin
  Result := (fBitCode and cRABit) = cRABit;
end;

procedure TIdDNSHeader.SetRA(RecursionAvailable: Boolean);
begin
  if RecursionAvailable then
  begin
    fBitCode := fBitCode Or cRABit;
  end  //if RecursionAvailable then
  else
  begin
    fBitCode := fBitCode And cRAMask;
  end;  //if RecursionAvailable then
end;

function TIdDNSHeader.GetRCode : Word;
begin
  Result := (fBitCode And cRCodeBits);
end;

procedure TIdDNSHeader.SetRCode(RCode: Word);
begin
  fBitCode := (RCode  And cRCodeBits) Or (fBitCode And cRCodeMask);
end;

//----------------------- Start TIdDNSQuestionList -------------------------------
// Coded July 15, 1999 By RM
// Since A DNS Resolver can present requests to resolve several Domain names in
// a single request, we have users put them in a list. The Resolver then converts
// them to RFC 1035 format before trasmission
//------------------------------------------------------------------------------

function TIdDNSQuestionList.Add: TQuestionItem;
begin
  Result := TQuestionItem ( inherited Add );
end;

constructor TIdDNSQuestionList.Create;
begin
  Inherited Create ( TQuestionItem );
end;

function TIdDNSQuestionList.GetItem(Index: Integer): TQuestionItem;
begin
  Result := TQuestionItem ( inherited Items [ Index ] );
end;

procedure TIdDNSQuestionList.SetItem(Index: Integer;
  const Value: TQuestionItem);
begin
  inherited SetItem ( Index, Value );
end;


//------------------------ End TIdDNSQuestionList --------------------------------


//------------------------Start TIdDNSResourceList -------------------------------
// Coded July 15, 1999 By RM
// Since A DNS Server can reply to  requests to resolve several Domain names in
// a single reply, we present users WITH a  list of replies. The Resolver has
// converted them from RFC 1035 format to the more useable list format after
// reception.
//------------------------------------------------------------------------------

constructor TIdDNSResourceList.Create;
begin
  Inherited Create(TIdDNSResourceItem);
end;

function TIdDNSResourceList.GetDNSRDataDomainName ( Idx : Integer): String;
begin
  if ( Idx < Count ) and ( Idx >= 0 ) then
  begin
    Result := TIdDNSResourceItem ( Items [ Idx ] ).RData.DomainName;
  end  //if ( Idx < Count ) and ( Idx >= 0 ) then
  else
    Result := '';
end;

function TIdDNSResourceList.GetDnsMxExchangeNameEx(Idx : Integer): String;
begin
  if (Idx < Count) and (Idx >= 0) then
  begin
    Result :=
      IntToStr ( TIdDNSResourceItem ( Items [ Idx ] ).RData.MX.Preference );
    While Length ( Result ) < 5 do
    begin
      Result := ' '+ Result;
    end; //While Length(Result) < 5 do
    Result :=
      Result + ' ' + TIdDNSResourceItem ( Items [ Idx ] ).RData.MX.Exchange;
  end  //if (Idx < fList.Count) and (Idx >= 0) then
  else
  begin
    Result := '';
  end; //else..if (Idx < fList.Count) and (Idx >= 0) then
end;

function TIdDNSResourceList.Add : TIdDNSResourceItem;
begin
  Result := TIdDNSResourceItem ( inherited Add );
end;

function TIdDNSResourceList.GetItem ( Index : Integer) : TIdDNSResourceItem;
begin
  Result := TIdDNSResourceItem ( inherited Items [ Index ] );
end;

procedure TIdDNSResourceList.SetItem ( Index : Integer;
  const Value: TIdDNSResourceItem);
begin
  inherited SetItem ( Index, Value );
end;

//------------------------- End TIdDNSResourceList--------------------------------

//--------------------- Start of TIdDNSResolver ---------------------------
// Coded July 15..17 1999 By RM
//------------------------------------------------------------------------------


constructor  TIdDNSResolver.Create(aOwner : tComponent);
begin
  Inherited Create ( aOwner );
  Port := IdPORT_DOMAIN;
  {This ReceiveTimout value seems to work}
  ReceiveTimeout := IdDNSResolver_ReceiveTimeout;
  {create the internal object structure}
  fDNSHeader := TIdDNSHeader.Create;
  fDnsQdList := TIdDNSQuestionList.Create;
  fDnsAnList := TIdDNSResourceList.Create;
  fDnsNsList := TIdDNSResourceList.Create;
  fDnsArList := TIdDNSResourceList.Create;
  FAnswers := TIdDNSREsourceList.Create;
end;

destructor TIdDNSResolver.Destroy;
begin
  fDNSHeader.Free;
  fDnsQdList.Free;
  fDnsAnList.Free;
  fDnsNsList.Free;
  fDnsArList.Free;
  FAnswers.Free;
  Inherited Destroy;
end;

procedure TIdDNSResolver.ResolveDNS;
begin
  try
    CreateQueryPacket;
    Send(QPacket);
    fRPacket := ReceiveString;
  finally DecodeReplyPacket; end;
end;

Procedure TIdDNSResolver.ClearVars;
begin
  fDNSHeader.InitVars;
  fDnsQdList.Clear;
  fDnsAnList.Clear;
  fDnsNsList.Clear;
  fDnsArList.Clear;
end;

function TIdDNSResolver.CreateLabelStr(QName : String) : String;
const
  aPeriod = '.';
var
  aLabel : String;
  ResultArray : Array[0..512] Of Char;
  NumBytes,
  aPos,
  RaIdx : Integer;

begin
  Result := '';
  FillChar ( ResultArray, SizeOf ( ResultArray ), 0 );
  aPos := Pos(aPeriod,QName);
  RaIdx := 0;
  while ( aPos <> 0 ) and ( ( RaIdx + aPos ) < SizeOf ( ResultArray ) ) do
  begin
    aLabel := Copy ( QName, 1, aPos - 1 );
    NumBytes := Succ( Length ( Alabel ) );
    Move ( aLabel, ResultArray [ RaIdx ], NumBytes );
    Inc ( RaIdx, NumBytes );
    Delete ( QName, 1, aPos );
    aPos := Pos( aPeriod, QName );
  end; //while
  Result := String(ResultArray);
end;

procedure TIdDNSResolver.CreateQueryPacket;
var
  QueryIdx : Integer;
  DnsQuestion : TQuestionItem;

  procedure DoDomainName(ADNS : String);
  var
    BufStr : String;
    aPos : Integer;
  begin                         { DoDomainName }
    while Length(aDns)>0 do
    begin
      aPos := Pos ( '.', aDns );
      if aPos = 0 then
      begin
        aPos := Length ( aDns ) + 1;
      end; //if aPos = 0 then
      BufStr := Copy( aDns, 1, aPos -1 );
      Delete ( aDns, 1, aPos );
      QPacket:=QPacket+Chr( Length ( BufStr ) ) + BufStr;
    end;
  end;                          { DoDomainName }

  procedure DoHostAddress(aDNS :String);
  var
    BufStr,
    BufStr2 : String;
    aPos : Integer;
  begin                         { DoHostAddress }
    while Length( aDns ) > 0 do
    begin
      aPos := Pos( '.', aDns );
      if aPos =0 then
      begin
        aPos := Length(aDns) + 1;
      end;  //if aPos =0 then
      BufStr := Copy(aDns, 1, aPos-1 );
      Delete ( aDns, 1, aPos);
      BufStr2 := Chr ( Length ( BufStr ) ) + BufStr + BufStr2;
    end;  // while Length( aDns ) > 0 do
    QPacket :=
      QPacket + BufStr2 + Chr ( 07 ) + 'in-addr' + Chr ( 04 ) + 'arpa';
  end;                          { DoHostAddress }

Begin                           { CreateQueryPacket }
  DNSHeader.fId := Random ( 62000 );
  DNSHeader.fQdCount := fDnsQdList.Count;
  if DNSHeader.fQdCount < 1 then
  begin
    Raise  EIdDnsResolverError.Create(GetErrorStr( 1, 1 ) );
  end; //if fQdCount < 1 Then
  QPacket := WordToTwoCharStr ( DNSHeader.fId );    //Query-ID
  QPacket := QPacket + WordToTwoCharStr ( DNSHeader.fBitCode ); // BitCodes
  QPacket := QPacket + WordToTwoCharStr ( DNSHeader.fQdCount ); // #Queries
  QPacket := QPacket + Chr ( 0 ) + Chr ( 0 )    // fAnCount
                       + Chr ( 0 ) + Chr ( 0 )    // fNsCount
                       + Chr ( 0 ) + Chr ( 0 );   // fArCount
  for QueryIdx := 0 To fDnsQdList.Count - 1 Do
  begin
    DNsQuestion := fDnsQdList.Items [ QueryIdx ];
    Case DNSQuestion.Qtype Of
      cA     : DoDomainName ( DNsQuestion.QName );
      cNS    : DoDomainName ( DNsQuestion.QName );
      cMD    : Raise  EIdDnsResolverError.Create( RSDNSMDISObsolete );
      cMF    : Raise  EIdDnsResolverError.Create( RSDNSMFIsObsolete );
      cName  : DoDomainName ( DNsQuestion.QName );
      cSOA   : DoDomainName ( DNsQuestion.Qname );
      cMB    : DoDomainName ( DNsQuestion.QName );
      cMG    : DoDomainName ( DNsQuestion.QName );
      cMR    : DoDomainName ( DNsQuestion.QName );
      cNULL  : DoDomainName ( DNsQuestion.QName );
      cWKS   : DoDomainName ( DNsQuestion.QName );
      cPTR   : DoHostAddress ( DNsQuestion.QName );
      cHINFO : DoDomainName ( DNsQuestion.QName );
      cMINFO : DoDomainName ( DNsQuestion.QName );
      cMX    : DoDomainName ( DNsQuestion.QName );
      cTXT   : DoDomainName ( DNsQuestion.QName );
      cAXFR  : DoDomainName ( DNsQuestion.QName );
      cMAILB : DoDomainName ( DNsQuestion.QName );
      cMailA : Raise  EIdDnsResolverError.Create ( RSDNSMailAObsolete );
      cSTar  : DoDomainName ( DNsQuestion.QName );
    end; // Case DNSQuestion.Qtype Of
    fQPacket := fQPacket + Chr(0);                    // Root is NULL length
    fQPacket := fQPacket + WordToTwoCharStr ( DNsQuestion.QType );   // QType
    fQPacket := fQPacket + WordToTwoCharStr ( DNsQuestion.QClass );  // QClass
  end;  //for QueryIdx := 0 To fDnsQdList.Count - 1 Do
  FQPackSize := Length( fQPacket );
end;                            { CreateQueryPacket }

procedure TIdDNSResolver.DecodeReplyPacket;
var
  CharCount : Integer;
  Idx : Integer;
  ReplyId : Word;

  function LabelsToDomainName(const SrcStr: String; var Idx: Integer): string;
  var
    LabelStr : String;
    Len : Integer;
    SavedIdx : Integer;
    AChar :Char;
  begin
    Result := '';
    SavedIdx := 0;
    repeat
      Len := Byte(SrcStr[Idx]);
      if Len > 63 then begin
        if SavedIdx = 0 then begin
          SavedIdx := Succ(Idx);
        end; // if SavedIdx = 0 then
        aChar := Char ( Len and $3F );
        Idx := TwoCharToWord( aChar, SrcStr[ Idx + 1 ] ) + 1;
      end; // if Len > 63 then
      if Idx > fRPackSize then begin
        raise EIdDnsResolverError.Create(GetErrorStr( 2, 2) );
      end; //if Idx > fRPackSize then
      SetLength ( LabelStr, Byte ( SrcStr [ Idx ] ) );
      Move ( SrcStr [ Idx + 1 ], LabelStr [ 1 ], Length ( LabelStr ) );
      Inc( Idx, Length ( LabelStr) + 1 );
      if (Idx - 1) > fRPackSize then begin
        Raise EIdDnsResolverError.Create ( GetErrorStr ( 2, 3 ) );
      end;
      Result := Result + LabelStr + '.';
    Until ( SrcStr [ Idx ] = Char ( 0 ) ) or ( Idx >= Length ( SrcStr ) );
    if Result [ Length ( Result ) ] = '.' then
    begin
      Delete ( Result, Length ( Result ), 1 );
    end; // if Result [ Length ( Result ) ] = '.' then
    if SavedIdx > 0 then
    begin
      Idx := SavedIdx;
    end; // if SavedIdx > 0 then
    Inc(Idx);
  end;

  function ParseQuestions(StrIdx : Integer): Integer;
  var
    DNSQuestion : TQuestionItem;
    Idx : Integer;
  Begin                         { ParseQuestions }
    for Idx := 1 To fDNSHeader.fQdCount do begin
      DnsQuestion := fDnsQdList.Add;
      DnsQuestion.QName := LabelsToDomainName(RPacket, StrIdx);
      if StrIdx > fRPackSize then begin
        Raise  EIdDnsResolverError.Create ( GetErrorStr( 2, 4 ) );
      end; //if StrIdx > fRPackSize then
      DnsQuestion.Qtype := TwoCharToWord ( RPacket [ StrIdx ], RPacket [ StrIdx + 1 ]);
      Inc ( StrIdx, 2 );
      if StrIdx > fRPackSize then
      begin
        Raise  EIdDnsResolverError.Create(GetErrorStr( 2, 5 ) );
      end; // if StrIdx > fRPackSize then
      DnsQuestion.QClass := TwoCharToWord(RPacket[StrIdx],RPacket[StrIdx+1]);
      if StrIdx + 1 > fRPackSize then
      begin
        Raise  EIdDnsResolverError.Create(GetErrorStr( 2, 6 ) );
      end;  // if StrIdx +1  > fRPackSize then
      Inc ( StrIdx, 2 );
    end;  // for Idx := 1 To fDNSHeader.fQdCount do
    Result := StrIdx;
  end;

  function ParseResource(NumItems, StrIdx: Integer; DnsList: TIdDNSResourceList)
    : Integer;
  var
    RDataStartIdx : Integer;
    DnsResponse : TIdDNSResourceItem;
    Idx : Integer;

    procedure ProcessRData(sIdx : Integer);

      procedure DoHostAddress;
      var
       Idx : Integer;

      begin                     { DoHostAddressRData }
        if sIdx + 3 > fRPackSize then
        begin
           Raise  EIdDnsResolverError.Create ( GetErrorStr ( 2, 7 ) );
        end; // if sIdx +3 > fRPackSize then
        for Idx := sIdx to sIdx + 3 do
        begin
           DnsResponse.RData.HostAddrStr := DNSResponse.RData.HostAddrStr +
             IntToStr ( Ord ( RPacket [ Idx ] ) ) + '.';
        end;  // for Idx := sIdx to sIdx + 3 do
        Delete ( DNSResponse.RData.HostAddrStr,
          Length ( DNSResponse.RData.HostAddrStr ), 1);
      end;                      { DoHostAddressRData }

      procedure DoDomainNameRData;
      begin
        DnsResponse.RData.DomainName := LabelsToDomainName(RPacket, sIdx);
        if (sIdx - 1) > fRPackSize then begin
          raise EIdDnsResolverError.Create(GetErrorStr(2, 8));
        end;
      end;

      procedure DoSOARdata;
      begin                     { DoSOARData }
        DNSResponse.RData.SOA.MName := LabelsToDomainName(RPacket,sIdx);
        if sIdx > fRPackSize then
        begin
          Raise  EIdDnsResolverError.Create(GetErrorStr( 2, 9 ) );
        end; // if sIdx > fRPackSize then
        DNSResponse.RData.SOA.RName := LabelsToDomainName(RPacket,sIdx);
        if sIdx + 4 > fRPackSize then
        begin
          Raise  EIdDnsResolverError.Create(GetErrorStr( 2, 10 ) );
        end; //if sIdx +4 > fRPackSize then
        DNSResponse.RData.SOA.Serial := FourCharToCardinal(RPacket[sIdx],RPacket[sIdx+1],RPacket[sIdx+2],RPacket[sIdx+3]);
        Inc ( sIdx, 4 );
        if sIdx + 4 > fRPackSize then
        begin
          Raise  EIdDnsResolverError.Create ( GetErrorStr ( 2, 11 ) );
        end; // if sIdx +4 > fRPackSize then
        DNSResponse.RData.SOA.Refresh := FourCharToCardinal ( RPacket[sIdx],RPacket[sIdx+1],RPacket[sIdx+2],RPacket[sIdx+3]);
        Inc ( sIdx, 4 );
        if sIdx + 4 > fRPackSize then
        begin
          Raise EIdDnsResolverError.Create ( GetErrorStr( 2, 12 ) );
        end;  //if sIdx +4 > fRPackSize then
        DNSResponse.RData.SOA.ReTry := FourCharToCardinal ( RPacket[ sIdx ],
          RPacket [ sIdx + 1 ], RPacket [ sIdx + 2 ], RPacket [ sIdx + 3 ] );
        Inc ( sIdx, 4);
        if sIdx + 4 > fRPackSize then
        begin
          Raise EIdDnsResolverError.Create(GetErrorStr( 2, 13 ) );
        end;  //If sIdx +4 > fRPackSize Then
        DNSResponse.RData.SOA.Expire := FourCharToCardinal ( RPacket [ sIdx ],
          RPacket [ sIdx + 1 ], RPacket [ sIdx + 2 ], RPacket [ sIdx + 3 ] );
        Inc ( sIdx, 4 );
        if sIdx + 3 > fRPackSize then
        begin
          Raise  EIdDnsResolverError.Create(GetErrorStr( 2, 14 ) );
        end; //  if sIdx + 3 > fRPackSize then
        DNSResponse.RData.SOA.Minimum := FourCharToCardinal(RPacket[sIdx],RPacket[sIdx+1],RPacket[sIdx+2],RPacket[sIdx+3]);
        Inc ( sIdx, 4 );
      end;                      { DoSOARData }

      procedure DoWKSRdata;
      begin                     { DoWKSRData }
        If sIdx + 4 > fRPackSize Then
        begin
          Raise EIdDnsResolverError.Create( GetErrorStr ( 2, 15 ) );
        end;  // If sIdx + 4 > fRPackSize Then
        DNSResponse.RData.WKS.Address :=
          FourCharToCardinal ( RPacket [ sIdx],RPacket[ sIdx + 1 ], RPacket [ sIdx + 2], RPacket [ sIdx + 3 ] );
        Inc ( sIdx, 4 );
        DNSResponse.RData.WKS.Protocol := Byte ( RPacket [ sIdx ] );
        Inc ( sIdx );
        if sIdx + 7 > fRPackSize then
        begin
          Raise  EIdDnsResolverError.Create(GetErrorStr( 2, 16 ) );
        end;  // if sIdx + 7 > fRPackSize then
        Move ( RPacket [ sIdx ], DNSResponse.RData.WKS.Bits, 8 );
      end;                      { DoWKSRData }

      procedure DoHInfoRdata;
      begin                     { DoHInfoRData }
        if sIdx + Ord ( RPacket [ sIdx ] ) + 1 > fRPackSize then
        begin
          Raise  EIdDnsResolverError.Create( GetErrorStr ( 2, 17 ) );
        end; //  if sIdx + Ord ( RPacket [ sIdx ] ) + 1 > fRPackSize then
        Move( RPacket [ sIdx ], DNSResponse.RData.Hinfo.CpuStr,
           Ord ( RPacket [ sIdx ] ) + 1 );
        sIdx := sIdx + Length ( DNSResponse.RData.Hinfo.CpuStr ) + 2;
        if sIdx + Ord ( RPacket [ sIdx ] ) + 1 > fRPackSize then
        begin
          Raise  EIdDnsResolverError.Create ( GetErrorStr ( 2, 18 ) );
        end;  // if sIdx + Ord ( RPacket [ sIdx ] ) + 1 > fRPackSize then
        Move ( RPacket [ sIdx ], DNSResponse.RData.Hinfo.OSStr,
          Ord ( RPacket [ sIdx ] ) + 1 );
      end;                      { DoHInfoRData }

      procedure DoMInfoRdata;
      begin                     { DoMInfoRData }
        DNSResponse.RData.Minfo.RMailBox :=
          LabelsToDomainName ( RPacket, sIdx );
        if sIdx > fRPackSize then
        begin
          Raise EIdDnsResolverError.Create( GetErrorStr ( 2, 19 ) );
        end; // if sIdx > fRPackSize then
        DNSResponse.RData.MinFo.EMailBox :=
          LabelsToDomainName ( RPacket, sIdx );
        if sIdx > fRPackSize then
        begin
          Raise EIdDnsResolverError.Create ( GetErrorStr ( 2, 20 ) );
        end; // if sIdx > fRPackSize then
      end;                      { DoMInfoRData }

      procedure DoMXRData;
      begin                     { DoMXRData }
        if sIdx + 2 > fRPackSize Then
        begin
          Raise EIdDnsResolverError.Create ( GetErrorStr ( 2, 21 ) );
        end; //if sIdx +2 > fRPackSize Then
        DNSResponse.RData.MX.Preference :=
          TwoCharToWord ( RPacket [ sIdx ], RPacket[ sIdx + 1 ] );
        Inc ( sIdx, 2 );
        if sIdx + 2 > fRPackSize then
        begin
          Raise EIdDnsResolverError.Create ( GetErrorStr( 2, 22 ) );
        end;
        DNSResponse.RData.Mx.Exchange := LabelsToDomainName( RPacket, sIdx );
      end;                      { DoMXRData }

      procedure DoMailBRdata;
      begin                     { DoMailRData }
        Raise EIdDnsResolverError.Create( RSDNSMailBNotImplemented );
      end;                      { DoMailRData }

    begin                       { ProcessRdata }
      case DnsResponse.AType of
        cA     : DoHostAddress;
        cNS    : DoDomainNameRData;
        cMD    : Raise EIdDnsResolverError.Create( RSDNSMDISObsolete );
        cMF    : Raise EIdDnsResolverError.Create( RSDNSMFIsObsolete );
        cName  : DoDomainNameRData;
        cSOA   : DoSOARdata;
        cMB    : DoDomainNameRData;
        cMG    : DoDomainNameRData;
        cMR    : DoDomainNameRData;
        cNULL  : DnsResponse.StarData :=
                   Copy ( RPacket, RDataStartIdx, DnsResponse.RdLength );
        cWKS   : DoWKSRdata;
        cPTR   : DoDomainNameRData;
        cHINFO : DoHInfoRdata;
        cMINFO : DoMInfoRdata;
        cMX    : DoMXRData;
        cTXT   : DnsResponse.StarData :=
                   Copy ( RPacket, RDataStartIdx, DnsResponse.RdLength);
        cAXFR  : DnsResponse.StarData :=
                   Copy ( RPacket, RDataStartIdx, DnsResponse.RdLength);
        cMAILB : DoMailBRData;
        cMailA : Raise EIdDnsResolverError.Create( RSDNSMFIsObsolete );
        cStar  : DnsResponse.StarData :=
                   Copy ( RPacket, RDataStartIdx, DnsResponse.RdLength);
        else
          { Showmessage('Atype is '+INtTostr(DnsResponse.AType)+' String Idx is '+IntTosTr(sIdx))};
      end;
    end;                        { ProcessRdata }

  begin                         { ParseResource }
    Result := 0;
    for Idx := 1 to NumItems do
    begin
      DnsResponse := DnsList.Add;
      DnsResponse.Name := LabelsToDomainName ( RPacket, StrIdx);
      if StrIdx + 10 > fRPackSize then
      begin
        Raise  EIdDnsResolverError.Create ( GetErrorStr ( 2, 23 ) );
      end; // if StrIdx +10 > fRPackSize then
      DnsResponse.aType :=
        TwoCharToWord ( RPacket [ StrIdx ], RPacket [ StrIdx + 1 ] );
      Inc(StrIdx, 2);
      DnsResponse.aClass :=
        TwoCharToWord ( RPacket [ StrIdx ], RPacket [ StrIdx + 1 ]);
      Inc(StrIdx, 2);
      DnsResponse.TTL :=
        FourCharToCardinal ( RPacket [ StrIdx ], RPacket[ StrIdx + 1 ],
        RPacket [ StrIdx + 2 ], RPacket [ StrIdx + 3 ] );
      Inc(StrIdx, 4);
      DnsResponse.RdLength :=
        TwoCharToWord ( RPacket [ StrIdx ], RPacket [ StrIdx + 1 ] );
      Inc(StrIdx, 2);
      if ((StrIdx + DnsResponse.RdLength) - 1 ) > fRPackSize then
      begin
        Raise  EIdDnsResolverError.Create(GetErrorStr( 2, 23));
      end;
      RDataStartIdx := StrIdx;
      ProcessRdata ( StrIdx );
      Inc ( StrIdx,DnsResponse.RdLength );

      Result := StrIdx;
      if StrIdx >= Length ( RPacket ) then
      begin
        Exit;
      end; // if StrIdx >= Length(RPacket) then
    end;
    if Result = 0 then
    begin
      Result := StrIdx;
    end;  //  if Result = 0 then
  end;                          { ParseResource }

begin                           { DecodeReplyPacket }
  ClearVars;
  fRPackSize := Length ( RPacket );
  if fRPackSize < 4 then begin
    raise EIdDnsResolverError.Create(GetErrorStr(3, 28));
  end; //if fRPackSize < 4 then
  CharCount := 1;
  ReplyId := TwoCharToWord(RPacket[1],RPacket[2]);
  if ReplyId <> fDNSHeader.fid then begin
    Raise EIdDnsResolverError.Create(GetErrorStr(4, fDNSHeader.Fid));
  end; //If ReplyId <> fid Then Begin
  Inc(CharCount, 4);
  fDNSHeader.fBitCode := TwoCharToWord( RPacket [ 3 ], RPacket [ 4 ] );
  if FDNSHeader.RCode <> 0 then begin
    Raise EIdDnsResolverError.Create(GetRCodeStr(FDNSHeader.RCode));
  end;  // if RCode <> 0 Then
  if fRPackSize < 12 then begin
    Raise EIdDnsResolverError.Create ( GetErrorStr( 5, 29 ) );
  end;  // if fRPackSize < 12 Then
  fDNSHeader.fQdCount := TwoCharToWord ( RPacket [ 5 ], RPacket [ 6 ] );
  fDNSHeader.fAnCount:= TwoCharToWord ( RPacket [ 7 ], RPacket [ 8 ] );
  fDNSHeader.fNsCount := TwoCharToWord ( RPacket[ 9 ], RPacket [ 10 ] );
  fDNSHeader.fArCount := TwoCharToWord ( RPacket[ 11 ], RPacket [ 12 ] );
  if ( fRPackSize < FQPackSize ) then begin
    Raise EIdDnsResolverError.Create(GetErrorStr( 5, 30 ) );
  end;  //if ( fRPackSize < FQPackSize ) then
  for Idx := 1 To fDNSHeader.fQdCount do begin
    CharCount := ParseQuestions ( 13 );
  end; //for Idx := 1 To fQdCount Do
  if (Charcount >= fRPackSize) and ( ( fDNSHeader.fAnCount > 0 ) or ( fDNSHeader.fNsCount > 0 ) or
   (fDNSHeader.fArCount > 0)) then begin
    Raise EIdDnsResolverError.Create ( GetErrorStr ( 6, 31 ) );
  end;   //it
  if fDNSHeader.fAnCount > 0 then begin
    CharCount := ParseResource(fDNSHeader.fAnCount, CharCount, fDnsAnList);
  end; // if fAnCount > 0 then
  if (Charcount >= fRPackSize) and ((fDNSHeader.fNsCount > 0) or (fDNSHeader.fArCount > 0))
   then begin
    raise EIdDnsResolverError.Create(GetErrorStr(6,32));
  end; // if
  if fDNSHeader.fNsCount > 0 then begin
    CharCount := ParseResource ( fDNSHeader.fNsCount, CharCount, fDnsNsList);
  end; // if fNsCount > 0 then
  if ( Charcount >= fRPackSize ) and ( fDNSHeader.fArCount > 0 ) then begin
    Raise  EIdDnsResolverError.Create ( GetErrorStr ( 6, 33 ) );
  end; // If (Charcount >= fRPackSize) and (fArCount > 0) then
  if fDNSHeader.fArCount > 0 then begin
    CharCount := ParseResource( fDNSHeader.fArCount, CharCount, fDnsArList);
  end;  //if fArCount > 0 then
  fRPackSize := CharCount;
end;                            { DecodeReplyPacket }

procedure TIdDNSResolver.ResolveDomain(const ADomain: string);
var
  i: Integer;
  Rec: TRequestedRecord;
  LRData: TRData;
begin
  ClearVars;
  // This is the main call of the component. Pass the ADomain as parameter
  // set the RequestedRecords and viola!
  DNSHeader.ID := DNSHeader.Id + 1;
  DNSHeader.Qr := False;
  DNSHeader.Opcode := cResQuery;
  DNSHeader.RD := True;  // Request Recursive search
  // Loop thru the set and add all the questions.
  for Rec := Low(TRequestedRecord) to High(TRequestedRecord) do begin
    if Rec in FRequestedRecords then begin
      DNSHeader.QdCount := DNSHEader.QdCount + 1;
      with DNSQDList.Add do begin
        QName := ADomain;
        QType := Rec;
        QClass := cIN;
      end;
    end;
  end;
  // TODO this currently uses a two step process. Read to collection items in one pass
  ResolveDNS;
  // Now examine the results
  for i := 0 to DNSAnList.Count - 1 do begin
    LRData := DNSAnList.Items[i].RData;
    case DNSAnList.Items[i].AType of
      cA:
        with TARecord.Create(Answers) do begin
          FDomainName := LRData.DomainName;
        end;
      cMX:
        with TMXRecord.Create(Answers) do begin
          FExchange := LRData.MX.Exchange;
          FPreference := LRData.MX.Preference;
        end;
      cNAME:
        with TNameRecord.Create(Answers) do begin
          FDomainName := LRData.DomainName;
        end;
      cSOA:
        with TSOARecord.Create(Answers) do begin
          FExpire := LRData.SOA.Expire;
          FMinimum := LRData.SOA.Minimum;
          FMName := LRData.SOA.MName;
          FRefresh := LRData.SOA.Refresh;
          FRetry := LRData.SOA.Retry;
          FRName := LRData.SOA.RName;
          FSerial := LRData.SOA.Serial;
        end;
      cWKS :
        with TWKSRecord.Create(Answers) do begin
          FAddress := LRData.WKS.Address;
          FBits := LRData.WKS.Bits;
          FProtocol := LRData.WKS.Protocol;
        end;
      cPTR :
        with TPTRRecord.Create(Answers) do begin
          FDomainName := LRData.HostAddrStr;
        end;
      cHINFO :
        with THInfoRecord.Create(Answers) do begin
          FCPUStr := LRData.HInfo.CPUStr;
          FOsStr := LRData.HInfo.OsStr;
        end;
      cMINFO:
        with TMInfoRecord.Create(Answers) do begin
          FEMmailBox := LRData.MInfo.EMailBox;
          FRMailBox := LRData.MInfo.RMailBox;
        end;
    end;
  end;
{
  cNS    =  2;  // An Authoritative name server
  cMD    =  3;  // A mail destination obsolete use MX (OBSOLETE)
  cMF    =  4;  // A mail forwarder obsolete use MX   (OBSOLETE)
  cName  =  5;  // The canonical name for an alias
  cSOA   =  6;  // Marks the start of a zone of authority
  cMB    =  7;  // A mail box domain name (Experimental)
  cMG    =  8;  // A mail group member (Experimental)
  cMR    =  9;  // A mail Rename Domain Name (Experimental)
  cNULL  = 10;  // RR (Experimental)
  cWKS   = 11;  // A well known service description
  cPTR   = 12;  // A Domain Name Pointer;
  cHINFO = 13;  // Host Information;
  cMINFO = 14;  // Mailbox or Mail List Information;
  cMX    = 15;  // Mail Exchange
  cTXT   = 16;  // Text String;
  cAXFR  = 252; // A Request for the Transfer of an entire zone;
  cMAILB = 253; // A request for mailbox related records (MB MG OR MR
  cMAILA = 254; // A request for mail agent RRs (Obsolete see MX)
  cStar =  255; // A Request for all Records
}
end;

{ TWKSRecord }

function TWKSRecord.GetBits(AIndex: Integer): Byte;
begin
  Result := FBits[Index];
end;

end.
