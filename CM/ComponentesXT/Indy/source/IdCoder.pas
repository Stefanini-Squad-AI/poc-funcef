unit IdCoder;

{ TODO : Make Notifications a record of Int + String }

{
2000-Oct-28 Pete Mee
 - Fixed bug in GetNotification.  Repetitive data entries were not extracted
   correctly from the internal list.
2000-May-10 Pete Mee
 - Merged output strings into notifications.  Coded data is now notification,
   or may still be gleaned through GetCodedData.  
2000-Apr-21 Pete Mee
 - Added options for ignoring notifications / output strings and also
   having the strings returned through the same procedure.
2000-Apr-18 Pete Mee
 - Added OnNotification.
2000-Apr-17 Pete Mee
 - Added AutoCompleteInput property.
 - Optimized InternSetBufferSize.
 - Moved TakesFileName and TakesKey vars to TIdCoder from TIdCoderItem.
2000-Apr-16 Pete Mee
 - Added option for returned output (returned from CodeString & CompletedInput).
2000-Apr-13 Pete Mee
 - Added FPriority.
2000-Mar-27 Pete Mee
 - Added FBytesIn, FBytesOut and FByteCount
2000-Mar-03 Pete Mee
 - Added file and MIME options.
 - Added Coder Collection - TWinshoeCoderItem and TWinshoeCoderCollection
2000-Jan-27 Peter Mee
 - Altered CodeString to be a while loop instead of recursive.
2000-Jan-25 Peter Mee
 - Added numerous comments.
 - Added Reset procedure and altered Integer values to LongWord
2000-Jan-15 Peter Mee
 - Added OutputString in the coder base.  All coders should use this procedure for their
   output.
2000-Jan-09 Peter Mee
 - Added PWinshoeCoder for pluggability.
2000-Jan-06 Peter Mee
 - Some code optimisations done.
1999-Dec-05 Pete Mee
 - Fixed bug in CodeString.
1999-Nov-23 Pete Mee
 - Split EncodeWinshoe into abstract base (this file) and
   CoderWinshoeBinToASCII.pas.
}

interface

Uses
  Classes,
  IdBaseComponent, IdGlobal;

const
  CT_Creation = 0;
  CT_Realisation = $80;

  // Coder Priorities
  CP_FALLBACK = 0;
  CP_IMF = 1;
  CP_STANDARD = 8;

  // Notification messages - generic
  CN_CODED_DATA = 0;
  CN_DATA_START_FOUND = 1;
  CN_DATA_END_FOUND = 2;
  CN_CODING_STARTED = 3;
  CN_CODING_ENDED = 4;
  CN_NEW_FILENAME = 5;

  // Notifications messages - IMF coders
  CN_IMF_CODER_START = 20; // Not actually used??
  CN_IMF_BODY_START = CN_IMF_CODER_START + 1;
  CN_IMF_BODY_PART_END = CN_IMF_CODER_START + 2;
  CN_IMF_HEAD_VALUE = CN_IMF_CODER_START + 3;
  CN_IMF_NEW_MULTIPART = CN_IMF_CODER_START + 4; // New boundary found...
  CN_IMF_END_MULTIPART = CN_IMF_CODER_START + 5; // Boundary end
  CN_IMF_DATA_END = CN_IMF_CODER_START + 6;
  CN_IMF_NEW_FILENAME = CN_NEW_FILENAME;

  // Notification messages - UU coders
  CN_UU_CODER_START = 40;
  CN_UU_TABLE_FOUND = CN_UU_CODER_START + 1;
  CN_UU_BEGIN_FOUND = CN_UU_CODER_START + 2;
  CN_UU_TABLE_BEGIN_ABORT = CN_UU_CODER_START + 3;
  CN_UU_LAST_CHAR_FOUND = CN_UU_CODER_START + 4;
  CN_UU_END_FOUND = CN_UU_CODER_START + 5;
  CN_UU_TABLE_CHANGED = CN_UU_CODER_START + 6;
  CN_UU_PRIVILEGE_FOUND = CN_UU_CODER_START + 7;
  CN_UU_PRIVILEGE_ERROR = CN_UU_CODER_START + 8;
  CN_UU_NEW_FILENAME = CN_NEW_FILENAME;
Type
  TStringEvent = procedure(ASender: TComponent; const AOut: String) of Object;
  TIntStringEvent = procedure(ASender: TComponent; AVal : Integer;
    const AOut: String) of Object;

  { TODO : Change to Int64, or override within IncByteCount? }
  TQWord = packed record
    L : LongWord;
    H : LongWord;
  end;

  PIdCoder = ^TIdCoder;
  TIdCoder = class(TIdBaseComponent)
  protected
    // Whether the output is to have a CR+LF appended each time
    FAddCRLF : Boolean;

    FAutoCompleteInput : Boolean;

    // A count of the number of bytes processed *by the coder*. This is left
    // to the individual coder to update as it is not always clear cut what is
    // processed at any point in time.  Coders should use IncByteCount to
    // increase the value and should not update this var directly.
    FByteCount : TQWord;

    // Number of bytes in and out - stats stuff
    FBytesIn : TQWord;
    FBytesOut : TQWord;

    // FCBufferSize: Required size of buffered data before Coder is called
    FCBufferSize : LongWord;

    // FCBufferedData: Amount of data stored in FCBuffer
    FCBufferedData : LongWord;

    // FCBuffer: The container for current data
    FCBuffer : string;

    // For those coders that take/require a filename as a parameter
    FFileName : String;

    FIgnoreCodedData : Boolean;
    FIgnoreNotification : Boolean;

    // Whether or not CompletedInput called - reset by Reset
    FInCompletion : Boolean;

    // For those coders that take/require a key (for crypography)
    FKey : String;

    // Priorty of a CT_REALISATION coder.
    FPriority : Byte;

     // Event for use as an alternative to FOutputString
    FOnCodedData: TStringEvent;

    // Event for notification messages...
    FOnNotification : TIntStringEvent;

    // Internal output for use by CodeString and CompletedInput
    FOutputStrings : TStringList;

    FTakesFileName : Boolean;

    FTakesKey : Boolean;

    // Use event
    FUseEvent : Boolean;

    // Codes the FCBufferSize size of data held in FCBuffer
    procedure Coder; virtual;

    // Codes the remaining FCBufferedData size of data held in FCBuffer
    procedure CompleteCoding; virtual;

    // Increases the FByteCount variable
    procedure IncByteCount(bytes : LongWord);

    // Allows for on-the-fly altering of the FCBuffer's size
    procedure InternSetBufferSize(BufferSize : Integer);

    // Principal output notifier - all notifications should be channeled
    // through this procedure
    procedure OutputNotification(AVal : Integer; AStr : String);

    // Principal output procedure - all output should be channeled through
    // this procedure
    procedure OutputString(s : String);
  public
    constructor Create(AOwner : TComponent); override;
    destructor Destroy; override;

    // Input options - different ways of getting data into the coder
    function CodeString(AStr : String) : String;
    procedure CodeStringFromCoder(Sender: TComponent; const sOut: string);

    // The finalisation procedure - this should be used by the caller to
    // indicate all input has finished.
    function CompletedInput : String; virtual;

    function GetCodedData : String; virtual;
    function GetNotification : String; virtual;

    // Used to reset the buffer's contents and any other variables
    // altered during input.  This procedure should not alter any
    // possible output options.
    procedure Reset; virtual;

    // Procedure for checking the FKey - expected to be overriden by relevant
    // coders
    procedure SetKey(const key : String); virtual;

    // Procedure to alter the base FCBufferSize.  This should be overriden by
    // any coder that requires strict guidelines on the buffer size.
    procedure SetBufferSize(ASize : LongWord); virtual;

    // Where output is to be channelled through a seprate procedure from the
    // input, OnWrite is the event.
    property AddCRLF : Boolean read FAddCRLF write FAddCRLF;
    property AutoCompleteInput : Boolean read fAutoCompleteInput
      write fAutoCompleteInput;
    property BufferSize : LongWord read FCBufferSize write SetBufferSize;
    property ByteCount : TQWord read FByteCount;
    property BytesIn : TQWord read FBytesIn;
    property BytesOut : TQWord read FBytesOut;
    property FileName : String read FFileName write FFileName;
    property IgnoreCodedData : Boolean read FIgnoreCodedData
      write FIgnoreCodedData;
    property IgnoreNotification : Boolean read FIgnoreNotification
      write FIgnoreNotification;
    property Key : String read FKey write SetKey;
    property OnCodedData: TStringEvent read FOnCodedData write FOnCodedData;
    property OnNotification : TIntStringEvent read FOnNotification
      write FOnNotification;
    property Priority : Byte read FPriority;
    property TakesFileName : Boolean read FTakesFileName;
    property TakesKey : Boolean read FTakesKey;
    property UseEvent : Boolean read FUseEvent write FUseEvent;
  end;

  CIdCoder = class of TIdCoder;

  PIdCoderItem = ^TIdCoderItem;
  TIdCoderItem = class(TCollectionItem)
  protected
    FCoderType : Byte;
    FCoderPriority : Byte;

    // The Content Type is needed for some coders - BinHex for example
    FContentType : String;
    FContentTransferEncoding : String;

    FIdCoderClass : CIdCoder;
  public
    property CoderType : Byte read FCoderType;
    property CoderPriority : Byte read FCoderPriority;
    property ContentType : String read FContentType;
    property ContentTransferEncoding : String read FContentTransferEncoding;
    property IdCoderClass : CIdCoder read FIdCoderClass
      write FIdCoderClass;
  end;

  TIdCoderCollection = class(TCollection)
  protected
    FCount : LongWord;

    function GetCoder(Index : LongWord): TIdCoderItem;
    function Add : TIdCoderItem;
  public
    constructor Create(ItemClass : TCollectionItemClass);

    function AddCoder : TIdCoderItem;
    function GetCoderType(ContentType, ContentTransferEncoding : String;
      CoderType : Byte): TIdCoderItem;
    function GetExactCoderType(ContentType, ContentTransferEncoding : String;
      CoderType : Byte): TIdCoderItem;

    property Items[Index : LongWord] : TIdCoderItem read GetCoder;
    property ItemCount : LongWord read FCount;
  end;

  procedure RegisterCoderClass(ClassType : CIdCoder;
    CoderType, CoderPriority : Byte;
    ContentType, ContentTransferEncoding : String);
  procedure IncQWord(var QWord : TQWord; IncVal : LongWord);

var
   CoderCollective : TIdCoderCollection;

implementation

Uses
  SysUtils;

procedure RegisterCoderClass;
var
   item : TIdCoderItem;
begin
    item := CoderCollective.AddCoder;
    item.IdCoderClass := ClassType;
    item.FCoderType := CoderType;
    item.FCoderPriority := CoderPriority;
    item.FContentType := ContentType;
    item.FContentTransferEncoding := ContentTransferEncoding;
end;

procedure IncQWord;
var
   i : LongWord;
begin
     // Set QWord.L to be the higher value and i to be the lower
     if QWord.L > IncVal then begin
        i := IncVal;
     end else begin
         i := QWord.L;
         QWord.L := IncVal;
     end;

     // If the last bit is set, need to test for a carry
     if QWord.L and $80000000 = $80000000 then begin
        Inc(QWord.L, i);
        if QWord.L and $80000000 <> $00000000 then begin
           if QWord.H and $80000000 = $80000000 then begin
              Inc(QWord.H);
              if QWord.H and $80000000 <> $80000000 then begin
                 // If someone finds a need to get this far (2^64 bytes)
                 // then could make an event to let them know!!
                 QWord.L := 0;
                 QWord.H := 0;
              end;
           end else begin
               Inc(QWord.H);
           end;
        end;
     end else begin
         Inc(QWord.L, i);
     end;
end;

///////////
// TIdCoder
///////////

constructor TIdCoder.Create;
begin
     inherited Create(AOwner);
     // Make sure the FCBufferSize is of a valid value
     FCBufferSize := 4096;
     FAddCRLF := False;
     fAutoCompleteInput := False;
     FByteCount.L := 0;
     FByteCount.H := 0;
     FBytesIn.L := 0;
     FBytesIn.H := 0;
     FBytesOut.L := 0;
     FBytesOut.H := 0;
     FPriority := CP_FALLBACK;
     FInCompletion := False;
     FIgnoreCodedData := False;
     FIgnoreNotification := False;
     FFileName := '';
     FTakesFileName := False;
     FKey := '';
     FTakesKey := False;
     FUseEvent := False;
     FOutputStrings := TStringList.Create;
     // Do not call reset here as this could cause problems for a higher
     // abstraction that is using an inherited create (which they should be
     // doing anyway).
     SetLength(FCBuffer, FCBufferSize);
end;

procedure TIdCoder.Reset;
begin
     // InternSetBufferSize resets the buffer's size and 'clears' the contents
     InternSetBufferSize(FCBufferSize);
     FInCompletion := False;
     FOutputStrings.Clear;
end;

procedure TIdCoder.SetBufferSize;
begin
  InternSetBufferSize(ASize);
end;

procedure TIdCoder.Coder;
var
   s : string;
begin
     // This is the default action for the base coder:
     // To make the root level working, just copy out the FCBuffer to the
     // OutputString procedure.
     SetLength(s, FCBufferSize);
     System.Move(FCBuffer[1], s[1], FCBufferSize);
     UniqueString(s);
     OutputString(s);
     FCBufferedData := 0;
end;

procedure TIdCoder.CompleteCoding;
var
   s : string;
begin
     // This is the default action for the base coder:
     // To make the root level working, just copy out the FCBuffer to the
     // OutputString procedure.
     SetLength(s, FCBufferedData);
     UniqueString(s);
     System.Move(FCBuffer[1], s[1], FCBufferedData);
     OutputString(s);
     IncByteCount(FCBufferedData);
     FCBufferedData := 0;
end;

procedure TIdCoder.CodeStringFromCoder;
begin
     CodeString(sOut);
end;

function TIdCoder.CodeString;
var
   i : Integer;
   str : string;
begin
     str := AStr;
     IncQWord(FBytesIn, length(str));
     while str <> '' do begin
           i := FCBufferSize - FCBufferedData;
           if Length(str) >= i then begin
              // Fill buffer from new data.
              System.Move(str[1], FCBuffer[FCBufferedData + 1], 
                i);

              // Alter s to contain only unused data
              str := Copy(str, i + 1, length(str));
              FCBufferedData := FCBufferSize;

              // Code the buffer - this *should* set the data to null again...
              // this depends on the coder's use of the buffer - see below for
              // the recursive usage
              Coder;

           end else begin
               // There is room for the new data in the current buffer - just
               // append the data.
               System.Move(str[1], FCBuffer[FCBufferedData + 1], 
                 Length(str));
               Inc(FCBufferedData, Length(str));
               str := '';
           end;
     end;
     // FOutputString will be the result of the current coding - could always
     // be null if UseEvent = True.
     if fAutoCompleteInput then begin
      result := CompletedInput;
     end else begin
      result := GetNotification;
     end;
end;

function TIdCoder.CompletedInput;
begin
     // Some coders may require some additional processing before the
     // finalisation code is sparked.  CompletedInput could be overriden but
     // it's default is to simple call the completion code.
     FInCompletion := True;
     CompleteCoding;
     // FOutputString will be the result of the current coding - could always
     // be null if UseEvent = True.
     result := GetNotification;
end;

procedure TIdCoder.IncByteCount;
begin
     // Could be done in asm to speed up... but this is meant to be Delphi...
     IncQWord(FByteCount, bytes);
end;

procedure TIdCoder.SetKey;
begin
     FKey := key;
end;

destructor TIdCoder.Destroy;
begin
  FOutputStrings.Free;
  inherited;
end;

procedure TIdCoder.OutputNotification;
begin
  if FUseEvent then begin
    if Assigned(FOnNotification) then begin
      FOnNotification(Self, AVal, AStr);
    end;
  end else begin
    FOutputStrings.Add(IntToStr(AVal) + ';' + AStr);
  end;
end;

procedure TIdCoder.OutputString;
var
  s1 : String;
begin
     // This is where the Output is given back to the caller.
     if FAddCRLF then begin
      s1 := s + CR + LF;
     end else begin
      s1 := s;
     end;

     IncQWord(FBytesOut, length(s1));

     if FUseEvent then begin
        if Assigned(FOnCodedData) then begin
          OnCodedData(Self, s1);
        end;
     end else begin
        FOutputStrings.Add(IntToStr(CN_CODED_DATA) + ';' + s1);
     end;
end;

procedure TIdCoder.InternSetBufferSize;
begin
     // The only reason this will be altered is if the contents are about
     // to change anyway.  Therefore loss of contents is not a problem.
     // Any coder calling this procedure must preserve any data in the FCBuffer
     // before calling this method.
     if BufferSize > length(FCBuffer) then begin
      SetLength(FCBuffer, BufferSize);
      UniqueString(FCBuffer);
     end;
     FCBufferSize := BufferSize;
     FCBufferedData := 0;
end;

function TIdCoder.GetNotification;
var
  s, ent : String;
  exWhile : Boolean;
begin
  if FIgnoreNotification and FIgnoreCodedData then
  begin
    FOutputStrings.Clear;
    result := '';
  end
  else
  begin
    if FOutputStrings.Count > 0 then
    begin
      s := FOutputStrings[0];
      if s[1] <> '0' then
      begin
        // This is a single notification
        FOutputStrings.Delete(0);
        result := s;
      end
      else
      begin
        // This is a (possible series of) data output
        exWhile := False;
        FOutputStrings.Delete(0);
        Fetch(s, ';');
        while not exWhile do
        begin
          if FOutputStrings.Count > 0 then
          begin
            ent := FOutputStrings[0];
            if ent[1] = '0' then
            begin
              Fetch(ent, ';');
              s := s + ent;
              FOutputStrings.Delete(0);
            end
            else
            begin
              exWhile := True;
            end;
          end
          else
          begin
            exWhile := True;
          end;

          if FOutputStrings.Count = 0 then
          begin
            exWhile := True;
          end;
        end;
        result := '0;' + s;
      end;
    end
    else
    begin
      result := '';
    end;
  end;
end;

function TIdCoder.GetCodedData;
var
  s : String;
  i : Integer;
begin
  if FIgnoreNotification and FIgnoreCodedData then
  begin
    FOutputStrings.Clear;
    result := '';
  end
  else
  begin
    if FOutputStrings.Count > 0 then
    begin
      s := FOutputStrings[0];
      if s[1] = '0' then
      begin
        FOutputStrings.Delete(0);
        result := s;
        Fetch(result, ';');
      end
      else
        if FIgnoreNotification then
        begin
          i := FOutputStrings.Count;
          while FOutputStrings[0][1] <> '0' do
          begin
            FOutputStrings.Delete(0);
            Dec(i);
            If i <= 0 then
              break;
          end;
          result := GetCodedData;
        end
        else
        begin
          result := '';
        end;
    end
    else
    begin
      result := '';
    end;
  end;
end;

/////////////////////
// TIdCoderCollection
/////////////////////

constructor TIdCoderCollection.Create;
begin
  inherited Create(ItemClass);
  FCount := 0;
end;

function TIdCoderCollection.Add;
begin
     Inc(FCount);
     result := TIdCoderItem(inherited Add);
end;

function TIdCoderCollection.GetCoder;
begin
     result := TIdCoderItem(inherited Items[Index]);
end;

function TIdCoderCollection.AddCoder;
begin
     result := Self.Add;
end;

function TIdCoderCollection.GetExactCoderType;
var
   i : Integer;
   TWCI : TIdCoderItem;
begin
     result := Nil;
     i := 0;
     while i < Count do begin
           TWCI := Items[i];
           if CoderType = TWCI.CoderType then begin

              // Check transfer encoding first... it's more likely to match
              // exactly
              if LowerCase(TWCI.ContentTransferEncoding) = LowerCase(ContentTransferEncoding) then begin
                 if LowerCase(TWCI.ContentType) = LowerCase(ContentType) then begin
                    result := GetCoder(i);
                    break;
                 end;
              end;
           end;

           Inc(i);
     end;
end;

function TIdCoderCollection.GetCoderType;
var
   i : Integer;
   TWCI : TIdCoderItem;
   found : Boolean;
begin
  result := Nil;
  TWCI := GetExactCoderType(ContentType, ContentTransferEncoding, CoderType);
  if TWCI = nil then begin
     i := 0;
     found := false;
     if ContentTransferEncoding <> '' then begin
        while i < Count do begin
           TWCI := Items[i];
           if CoderType = TWCI.CoderType then begin

              // Check transfer encoding first... it's more likely to match
              // exactly
              if (LowerCase(TWCI.ContentTransferEncoding) =
                  LowerCase(ContentTransferEncoding))
              and (ContentTransferEncoding <> '') then begin
                result := TWCI;
                found := True;
                break;
              end;
           end;

           Inc(i);
        end;
     end;
     if (not found) and (ContentType <> '') then begin
        while i < Count do begin
           TWCI := Items[i];
           if CoderType = TWCI.CoderType then begin

              // Check transfer encoding first... it's more likely to match
              // exactly
              if (LowerCase(TWCI.ContentType) =
                  LowerCase(ContentType))
              and (ContentType <> '') then begin
                result := TWCI;
                found := True;
                break;
              end;
           end;

           Inc(i);
        end;
     end;
     if not found then begin
        // Return the default coder
        result := GetExactCoderType('application/octet-stream', '', CoderType);
     end;
  end else begin
    result := TWCI;
  end;
end;

initialization
  CoderCollective := TIdCoderCollection.Create(TIdCoderItem);
  RegisterCoderClass(TIdCoder, CT_CREATION, CP_FALLBACK,
    'application/octet-stream', '');
  RegisterCoderClass(TIdCoder, CT_REALISATION, CP_FALLBACK,
    'application/octet-stream', '');

finalization
  CoderCollective.Free;
end.