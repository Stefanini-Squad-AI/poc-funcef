unit gs6_glbl;
{-----------------------------------------------------------------------------
                                 Global Values

       gs6_glbl Copyright (c) 1998 Griffin Solutions, Inc.

       Date
          4 Apr 1998

       Programmer:
          Richard F. Griffin                     tel: (912) 953-2680
          Griffin Solutions, Inc.             e-mail: halcyon@grifsolu.com
          102 Molded Stone Pl
          Warner Robins, GA  31088

       -------------------------------------------------------------
       This unit handles the types and constants that are common to
       multiple units.

   Changes:
        - Bug fix for MasterSource property when a record is inserted.  Error
          was raised on invalid variant type.  Also correcte problems with all
          records displaying during insert and when the Master key is blank.
------------------------------------------------------------------------------}
{$I gs6_flag.pas}
interface
uses
   Sysutils;
const

{$IFDEF HALCDEMO}
   gs6_Version         = 'Halcyon Demo Version 06.6.0 (21 Mar 00)';
{$ELSE}
   gs6_Version         = 'Halcyon Version 06.6.0 (21 Mar 00)';
{$ENDIF}

   Null_Record =  0;            {file not accessed yet}
   Next_Record = -1;            {Token value passed to read next record}
   Prev_Record = -2;            {Token value passed to read previous record}
   Top_Record  = -3;            {Token value passed to read first record}
   Bttm_Record = -4;            {Token value passed to read final record}
   Same_Record = -5;            {Token value passed to read record again}

   ValueHigh   =  1;            {Token value passed for key comparison high}
   ValueLow    = -1;            {Token value passed for key comparison low}
   ValueEqual  =  0;            {Token value passed for key comparison equal}
   MatchIsExact   = -1;            {Return Exact Match from Compare}
   MatchIsPartial =  0;            {Return Partial Match from Compare}
   MatchIsHigh    =  1;            {Return Partial match as high from Compare}

   MaxRecNum = $7FFFFFFF;
   MinRecNum = 0;
   IgnoreRecNum = -1;

   gsSQLTypeNA     = -1;
   gsSQLTypeVarStd = $10;
   gsSQLTypeVarDBF = gsSQLTypeVarStd + 1;
   MaxSQLSize = 32767;

   LogicalTrue: string = 'TtYyJj';
   LogicalFalse: string = 'FfNn';
   dBaseMemoSize = 512;     {Block size of dBase memo file data}
   FoxMemoSize   = 64;      {Block size of FoxPro memo file data}
   AreaLimit     = 40;


   {               Globally used constants and types                    }

   DB3File         = $03;       {First byte of dBase III(+) file}
   DB4File         = $03;       {First byte of dBase IV file}
   FxPFile         = $03;       {First byte of FoxPro file}
   DB3WithMemo     = $83;       {First byte of dBase III(+) file with memo}
   DB4WithMemo     = $8B;       {First byte of dBase IV file with memo}
   FXPWithMemo     = $F5;       {First byte of FoxPro file with memo}
   VFP3File        = $30;       {First byte of Visual FoxPro 3.0 file}


   GS_dBase_UnDltChr = #$20;     {Character for Undeleted Record}
   GS_dBase_DltChr   = #$2A;     {Character for Deleted Record}

   EOFMark    : char = #$1A;     {Character used for EOF in text files}

   GSchrNull = #0;

   GSMSecsInDay = 24 * 60 * 60 * 1000;
   GSTimeStampDiff = 1721425;
   dBaseJul19800101 = 2444240;
   {   Status Reporting Codes  }

   StatusStart     = -1;
   StatusStop      = 0;
   StatusIndexTo   = 1;
   StatusIndexWr   = 2;
   StatusSort      = 5;
   StatusCopy      = 6;
   StatusPack      = 11;
   StatusSearch    = 21;

   dosAccessDenied   =    5;         {File access denied}
   dosFileNotFound   =    2;         {File not found}
   dosInvalidAccess  =   12;         {Invalid file access code}
   dosLockViolated   =   33;         {Attempted to read locked disk}
   gsShortDiskRead   =  221;         {Short Disk Read}
   gsBadDBFHeader    = 1001;         {dBase DBF file header invalid}
   tpHeapOverflow    =  203;         {Heap overflow error}


type

   FloatNum = Double;

   {$IFDEF WIN32}
      {$IFDEF VER120}
      gsuint32 = Cardinal;
      {$ELSE}
      gsuint32 = longint;
      {$ENDIF}
      gsint32 = Integer;
   {$ENDIF}

   {$IFNDEF WIN32}
      SmallInt = integer;
      gsuint32 = longint;
      gsint32 = longint;
   {$ENDIF}

   GSstrTinyString = string[15];

   GSptrByteArray = ^GSaryByteArray;
   GSaryByteArray = array[0..65519] of byte;

   GSptrPointerArray = ^GSaryPointerArray;
   GSaryPointerArray = array[0..16379] of pointer;

   GSptrWordArray = ^GSaryWordArray;
   GSaryWordArray = array[0..32759] of word;

   GSptrLongIntArray = ^GSaryLongIntArray;
   GSaryLongIntArray = array[0..16379] of longint;

   GSptrCharArray = ^GSaryCharArray;
   GSaryCharArray = array[0..65519] of char;

   GSsetSortStatus = (Ascending, Descending, SortUp, SortDown,
                      SortDictUp, SortDictDown, NoSort,
                      AscendingGeneral, DescendingGeneral);

   GSsetLokProtocol = (Default, DB4Lock, ClipLock, FoxLock);

   GSsetIndexUnique = (Unique, Duplicates);

   CaptureStatus = Procedure(stat1,stat2,stat3 : longint);

   EHalcyonError = class(Exception);
   EHalcyonEncryption = class(Exception);


implementation


end.
