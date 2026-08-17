unit IdCoderIMF;

interface

{TODO: Complete & register TIMFUUDecoder }

{
2000-Jun-10 Pete Mee
 - Fixed some minor but annoying bugs.
2000-Nov-17 Pete Mee
 - Fixed some bugs
}

uses
  Classes,
  IdCoder,
  SysUtils;

const
  ConstIMFStart = 0;
  ConstIMFMessageStart = 1;
  ConstIMFBoundaryEnd = 2;

  // Keep as lower case
  ConstContentType = 'content-type';
  ConstContentTransferEncoding = 'content-transfer-encoding';
  ConstContentDisposition = 'content-disposition';
  ConstContentMD5 = 'content-md5';

  ConstBoundary = 'boundary';
  ConstFileName = 'filename';
  ConstName = 'name';

type
  TIdIMFDecoder = class(TIdCoder)
  protected
    FState : Byte;
    FContentType, FContentTransferEncoding : String;
    FDefaultContentType, FDefaultContentTransferEncoding : String;
    FDefaultContentFound, FDefaultContentTypeFound,
      FDefaultContentTransferEncodingFound : Boolean;
    FLastContentType, FLastContentTransferEncoding : String;
    FCurHeader, FTrueString : String;
    FMIMEBoundary : TStringList;
    FInternalDecoder : TIdCoder;

    procedure CreateDecoder; virtual;

    procedure Coder; override;
    procedure CompleteCoding; override;

    procedure IMFStart; virtual;
    procedure IMFMessageStart; virtual;
    procedure IMFBoundaryEnd; virtual;

    procedure ProcessHeader; virtual;
    procedure RenewCoder; virtual;

    procedure WriteOutput(Sender : TComponent; const sOut : String);
  public
    constructor Create(AOwner : TComponent); override;
    destructor Destroy; override;

    procedure Reset; override;
  end;

  TIdIMFUUDecoder = class(TIdIMFDecoder)
  protected
    procedure CreateDecoder; override;
    procedure RenewCoder; override;
  public
    constructor Create(AOwner : TComponent); override;
    destructor Destroy; override;
  end;

implementation

uses
  IdGlobal;

//////////////
// TIdCoderIMF
//////////////

constructor TIdIMFDecoder.Create;
begin
  FMIMEBoundary := TStringList.Create;
  inherited Create(AOwner);
  FState := ConstIMFStart;
  FContentType := '';
  FContentTransferEncoding := '';
  FDefaultContentType := '';
  fDefaultContentTransferEncoding := '8bit';
  FDefaultContentFound := False;
  FDefaultContentTypeFound := False;
  FDefaultContentTransferEncodingFound := False;
  FLastContentType := '';
  FLastContentTransferEncoding := '';
  FCurHeader := '';
  FTrueString := '';
  fAddCRLF := False;
  CreateDecoder; // Calls the overriden version
  FInternalDecoder.UseEvent := True;
  FInternalDecoder.OnCodedData := WriteOutput;
end;

destructor TIdIMFDecoder.Destroy;
begin
  FMIMEBoundary.Free;
  inherited Destroy;
end;

procedure TIdIMFDecoder.CreateDecoder;
var
   CItem : TIdCoderItem;
begin
  CItem := CoderCollective.GetCoderType('',
         '7bit', CT_REALISATION); // Use default
  FInternalDecoder := CItem.IdCoderClass.Create(Self);
end;

procedure TIdIMFDecoder.Reset;
begin
  inherited;
  FState := ConstIMFStart;
end;

procedure TIdIMFDecoder.RenewCoder;
var
  CItem : TIdCoderItem;
  exactType, exactEnc, temp : String;
begin
  temp := FContentType;
  exactType := Fetch(temp, ';');
  temp := FContentTransferEncoding;
  exactEnc := Fetch(temp, ';');

  // Check current FContentType & FContentTransferEncoding against last ones.
  if (FContentType <> FLastContentType) or
  (FContentTransferEncoding <> FLastContentTransferEncoding) then begin
    FInternalDecoder.Free;
    CItem := CoderCollective.GetCoderType(exactType, exactEnc, CT_REALISATION);
    FInternalDecoder := CItem.IdCoderClass.Create(Self);
    FInternalDecoder.UseEvent := True;
    FInternalDecoder.OnCodedData := WriteOutput;
  end;

  FLastContentType := exactType;
  FLastContentTransferEncoding := exactEnc;

end;

procedure TIdIMFDecoder.Coder;
begin
  case FState of
    ConstIMFStart : IMFStart;
    ConstIMFMessageStart : IMFMessageStart;
    ConstIMFBoundaryEnd : IMFBoundaryEnd;
  end;
end;

procedure TIdIMFDecoder.CompleteCoding;
begin
  fInCompletion := True;
  while FCBufferedData > 0 do begin
    InternSetBufferSize(FCBufferedData);
    FCBufferedData := FCBufferSize;
    Coder;
  end;
  FInternalDecoder.CompletedInput;
  OutputNotification(CN_IMF_DATA_END, '');
  FCBufferedData := 0;
end;

procedure TIdIMFDecoder.IMFStart;
var
  i : LongWord;
  s : String;
  processLine : Boolean;
begin
  // Looking for a header called Content-Transfer-Encoding
  if FCBufferedData = 0 then Exit;

  s := Copy(FCBuffer, 1, FCBufferedData);
  i := IndyPos(CR, s);

  while i > 0 do begin
    FTrueString := FTrueString + Copy(s, 1, i);

    If (s[1] = ' ') or (s[1] = #9) then begin
      // Trim the beginning
      ProcessLine := True;
      while ProcessLine do begin
        if (s[1] = ' ') or (s[1] = #9) then begin
          System.Delete(s, 1, 1);
        end else begin
          ProcessLine := False;
        end;
      end;

      i := Length(FCurHeader);
      if i > 0 then begin
        if not ((FCurHeader[i] = ' ') or (FCurHeader[i] = #9)) then begin
          FCurHeader := FCurHeader + ' ';
        end;
      end;

      i := IndyPos(CR, s);
    end;

    FCurHeader := FCurHeader + Copy(s, 1, i - 1);
    s := Copy(s, i + 1, length(s));

    // Prepare s for exit
    if length(s) > 0 then begin
      if s[1] = LF then begin
        s := Copy(s, 2, length(s));
        FTrueString := FTrueString + LF;
      end;
    end;

    // Check what is in FCurHeader
    FCurHeader := Trim(FCurHeader);
    if Length(FCurHeader) > 0 then begin

      if Length(s) > 0 then begin
        if (s[1] = ' ') or (s[1] = #9) then begin
          ProcessLine := False;
        end else begin
          ProcessLine := True;
        end;
      end else begin
        ProcessLine := False;
      end;

      if ProcessLine then begin
        ProcessHeader;
      end;

    end else begin
        FState := ConstIMFMessageStart;
        OutputString(FTrueString);
        FTrueString := '';
        Break;
    end;

    i := IndyPos(CR, s);
  end;

  FDefaultContentFound := True; // If not in first header, no defaults...

  if FState = ConstIMFStart then begin
    if fInCompletion then begin
      // No end to this 'header' section
      OutputString(s);
      s := '';
    end else begin
      FCurHeader := FCurHeader + s;
    end;
  end;
  FCBufferedData := LongWord(length(s));
  System.Move(s[1], FCBuffer[1], FCBufferedData);
  if FState = ConstIMFMessageStart then begin
    OutputString(CR + LF);
    OutputNotification(CN_IMF_BODY_START, '');
    RenewCoder;
    IMFMessageStart;
  end;
end;

procedure TIdIMFDecoder.ProcessHeader;
var
  paramWork : String;
  i : LongWord;

  function GetQuotedPair(const AString : String) : String;
  var
    li : LongWord;
    ls  : String;
    testSpace : Boolean;
  begin
    if length(AString) = 0 then begin
      result := '';
    end else begin
      ls := AString;
      if ls[1] = '"' then begin
        ls := Copy(ls, 2, length(ls));
        li := IndyPos('"', ls);
        if li > 0 then begin
          result := Copy(ls, 1, li - 1);
          testSpace := False;
        end else begin
          testSpace := True;
        end;
      end else begin
        testSpace := True;
      end;

      if testSpace then begin
        result := Fetch(ls, ' ');
      end;

    end;
  end;

begin
  OutputNotification(CN_IMF_HEAD_VALUE, FCurHeader);

  case FCurHeader[1] of
    'c', 'C' : begin
      if lowercase(Copy(FCurHeader, 1, length(ConstContentTransferEncoding)))
        = ConstContentTransferEncoding then begin
        // Content-Transfer-Encoding:  <- discard field name
        Fetch(FCurHeader, ':');
        FContentTransferEncoding := Trim(FCurHeader);
        if not FDefaultContentFound then begin
          FDefaultContentTransferEncodingFound := True;
          fDefaultContentTransferEncoding := FContentTransferEncoding;
        end;

      end else if lowercase(Copy(FCurHeader, 1, Length(ConstContentType)))
        = ConstContentType then begin
        // Content-Type: <- discard field name
        Fetch(FCurHeader, ':');
        FContentType := Trim(FCurHeader);
        if not FDefaultContentFound then begin
          FDefaultContentTypeFound := True;
          FDefaultContentType := FContentType;
        end;

        // Now check for the boundary
        i := IndyPos(ConstBoundary + '=', LowerCase(FContentType));
        If i > 0 then begin
          paramWork := Copy(FContentType, i + 9, length(FContentType));

          i := IndyPos('"', paramWork);
          if i > 0 then begin
            paramWork := Copy(paramWork, i + 1, length(paramWork));
          end;

          i := IndyPos('"', paramWork);
          if i > 0 then begin
            paramWork := Copy(paramWork, 1, i - 1);
          end;

          FMIMEBoundary.Insert(0, paramWork);
        end;

        i := IndyPos(ConstName + '=', LowerCase(FContentType));
        if i > 0 then begin
          paramWork := Copy(FContentType, i + 1 + LongWord(length(ConstName)),
            length(FContentType));
          FFileName := GetQuotedPair(paramWork);
          OutputNotification(CN_IMF_NEW_FILENAME, FFileName);
          FTakesFileName := True;
        end;

      end else if lowercase(Copy(FCurHeader, 1, Length(ConstContentDisposition)))
        = ConstContentDisposition then begin
        // Content-Disposition: <- discard field name
        Fetch(FCurHeader, ':');
        i := IndyPos(ConstFileName + '=', LowerCase(FCurHeader));
        if i > 0 then begin
          FCurHeader := Copy(FCurHeader, i + LongWord(length(ConstFileName)) + 1,
            length(FCurHeader));
          FFileName := GetQuotedPair(FCurHeader);
          OutputNotification(CN_IMF_NEW_FILENAME, FFileName);
          FTakesFileName := True;
        end;
      end else begin
        OutputString(FTrueString);
        FTrueString := '';
      end;
    end;
  else begin
      OutputString(FTrueString);
      FTrueString := '';
    end;
  end;
  FCurHeader := '';
end;

procedure TIdIMFDecoder.IMFMessageStart;
var
  i, bPos, mPos, mIndicator : LongWord;
  s, mData, mTemp : String;
begin
  if FCBufferedData = 0 then Exit;

  s := Copy(FCBuffer, 1, FCBufferedData);

  if FMIMEBoundary.Count > 0 then begin
    // Look for the boundary / boundaries
    mPos := LongWord(-1);
    mIndicator := LongWord(-1);
    for i := 0 to FMIMEBoundary.Count - 1 do begin
      bPos := IndyPos(FMIMEBoundary[i], s);
      if (bPos < mPos) and (bPos <> 0) then begin
        mPos := bPos;
        mIndicator := i;
      end;
    end;

    if mIndicator <> LongWord(-1) then begin
      // Located the indicator
      mData := Copy(s, 1, mPos - 1);
      i := Length(mData);
      if i >= 4 then begin
        mTemp := Copy(mData, length(mData) - 3, 4);
        If mTemp = CR + LF + '--' then begin
          mData := Copy(mData, 1, i - 4);
          i := 4;
        end else begin
          i := 5;
        end;
      end else if i >= 2 then begin
        If (mData[i] = '-') and (mData[i-1] = '-') then begin
          mData := Copy(mData, 1, i - 2);
        end;
      end;

      // mData is now all data before the first boundary
      // Update s with what's left
      s := Copy(s, length(mData) + 1, length(s));

      if length(mData) > 0 then begin
        // No point doing this if there's nothing to do...
        FInternalDecoder.CodeString(mData);
        FInternalDecoder.CompletedInput;
        FInternalDecoder.Reset;
      end else if (FInternalDecoder.BytesIn.L > 0) or
        (FInternalDecoder.BytesIn.H > 0) then begin
        // If coder has had data - still need to be complete it.
        FInternalDecoder.CompletedInput;
        FInternalDecoder.Reset;
      end;

      // Previous section now completed.
      // Start new section with notification
      OutputNotification(CN_IMF_NEW_MULTIPART, FMIMEBoundary[mIndicator]);
      if i >=4 then begin
        FCurHeader := CR + LF + '--' + FMIMEBoundary[mIndicator];
      end else if i >= 2 then begin
        FCurHeader := '--' + FMIMEBoundary[mIndicator];
      end else begin
        { TODO : Check what may occur here & cope with it. }
      end;

      mPos := IndyPos(FMIMEBoundary[mIndicator], s);
      s := Copy(s, mPos + LongWord(length(FMIMEBoundary[mIndicator])), length(s));

      FCBufferedData := length(s);
      System.Move(s[1], FCBuffer[1], FCBufferedData);

      FState := ConstIMFBoundaryEnd;
    end else begin
      FInternalDecoder.CodeString(s);
      FCBufferedData := 0;
    end;

  end else begin
    // No MIME parts
    FInternalDecoder.CodeString(s);
    FCBufferedData :=0;
  end;
end;

procedure TIdIMFDecoder.IMFBoundaryEnd;
var
  s : String;
begin
  if FCBufferedData = 0 then Exit;

  if FCBufferSize < 4 then begin
    InternSetBufferSize(5);
    // and then exit to fill buffer...
  end else if (FCBufferedData < 4) and fInCompletion then begin
    // See what can be detected...
    case FCBufferedData of
      1 : begin
        // ToDo..
      end;
      2 : begin
        // ToDo..
      end;
      3 : begin
        // ToDo..
      end;
    end;
    FCBufferedData := 0;
  end else if FCBufferedData >= 4 then begin
    // Got everything needed to check
    s := Copy(FCBuffer, 1, FCBufferedData);
    if (s[1] = '-') and (s[2] = '-') then begin
      OutputNotification(CN_IMF_END_MULTIPART, '');
      FCurHeader := FCurHeader + '--';
      s := Copy(s, 3, length(s));
    end;

    // Remove possibility of mal-formed single hyphen
    if s[1] = '-' then begin
      FCurHeader := FCurHeader + s[1];
      s := Copy(s, 2, length(s));
    end;

    if s[1] = CR then begin
      FCurHeader := FCurHeader + s[1];
      s := Copy(s, 2, length(s));
    end;

    if s[1] = LF then begin
      FCurHeader := FCurHeader + s[1];
      s := Copy(s, 2, length(s));
    end;

    if length(FCurHeader) > 0 then begin
      OutputString(FCurHeader);
      FCurHeader := '';
    end;

    FCBufferedData := length(s);
    System.Move(s[1], FCBuffer[1], FCBufferedData);
    FState := ConstIMFStart;
  end; // else exit to re-fill buffer
end;

procedure TIdIMFDecoder.WriteOutput;
begin
  OutputString(sOut);
end;

//////////////////
// TIdIMFUUDecoder
//////////////////

constructor TIdIMFUUDecoder.Create;
begin
  inherited Create(AOwner);
end;

destructor TIdIMFUUDecoder.Destroy;
begin
  inherited;
end;

procedure TIdIMFUUDecoder.RenewCoder;
begin
  // Do nothing - keep UU intact.
end;

procedure TIdIMFUUDecoder.CreateDecoder;
var
   CItem : TIdCoderItem;
begin
  CItem := CoderCollective.GetCoderType('',
         'x-uu', CT_REALISATION);
  if CItem = Nil then begin
    inherited;
  end else begin
    FInternalDecoder := CItem.IdCoderClass.Create(Self);
  end;
end;

initialization
  // 7bit, 8bit & binary are not strictly coded in any way.  Hence,
  // output same as input is possible as a fallback position
  RegisterCoderClass(TIdCoder, CT_REALISATION, CP_FALLBACK,
    '', '7bit');
  RegisterCoderClass(TIdCoder, CT_REALISATION, CP_FALLBACK,
    '', '8bit');
  RegisterCoderClass(TIdCoder, CT_REALISATION, CP_FALLBACK,
    '', 'binary');
  RegisterCoderClass(TIdIMFDecoder, CT_REALISATION, CP_IMF or CP_STANDARD,
    'text/', '8bit');
  // Don't register this yet - it crashes...
{  RegisterCoderClass(TIdIMFUUDecoder, CT_REALISATION, CP_IMF or CP_STANDARD,
    'text/', 'x-uu');
}end.