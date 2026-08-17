unit IvCommon;

{$I IVMULTI.INC}

interface

uses
{$IFDEF WIN32}
  Windows,
{$ELSE}
  WinTypes, WinProcs,
{$ENDIF}
  SysUtils;

const
  { Product versions }

  PM_VER_C = '1.0';
  LM_VER_C = '4.0';
  MDS_VER_C = '1.2';
  VCL_VER_C = '4.2';
  VB_VER_C = VCL_VER_C;
  JAVA_VER_C = '2.0';
  WFC_VER_C = '1.0';
  WIN_VER_C = '1.0';
  CE_VER_C = '1.0';
  EPOC_VER_C = '1.0';
  PALM_VER_C = '1.0';
  WAP_VER_C = '1.0';

  VCL_VER_SUB_C = '19';
  VB_VER_SUB_C = VCL_VER_SUB_C;

  { Beta versions }

  BETA_LM_VER_C = '4.5';

{$IFDEF WIN32}
  { Registry keys }

  ML_KEY_C = '\Software\Multilizer';
  PM_KEY_C = ML_KEY_C + '\Project Manager\' + PM_VER_C;
  LM_KEY_C = ML_KEY_C + '\Language Manager\' + LM_VER_C;
  DS_KEY_C = ML_KEY_C + '\Dictionary Server\' + MDS_VER_C;
  DELPHI2_KEY_C = ML_KEY_C + '\Delphi 2\' + VCL_VER_C;
  DELPHI3_KEY_C = ML_KEY_C + '\Delphi 3\' + VCL_VER_C;
  DELPHI4_KEY_C = ML_KEY_C + '\Delphi 4\' + VCL_VER_C;
  DELPHI5_KEY_C = ML_KEY_C + '\Delphi 5\' + VCL_VER_C;
  CBUILDER1_KEY_C = ML_KEY_C + '\C++Builder 1\' + VCL_VER_C;
  CBUILDER3_KEY_C = ML_KEY_C + '\C++Builder 3\' + VCL_VER_C;
  CBUILDER4_KEY_C = ML_KEY_C + '\C++Builder 4\' + VCL_VER_C;
  CBUILDER5_KEY_C = ML_KEY_C + '\C++Builder 5\' + VCL_VER_C;
  VB_KEY_C = ML_KEY_C + '\Visual Basic\' + VB_VER_C;
  JAVA_KEY_C = ML_KEY_C + '\Java\' + JAVA_VER_C;
  WFC_KEY_C = ML_KEY_C + '\WFC\' + WFC_VER_C;
  WIN_KEY_C = ML_KEY_C + '\Windows\' + WIN_VER_C;
  CE_KEY_C = ML_KEY_C + '\Windows CE\' + CE_VER_C;
  EPOC_KEY_C = ML_KEY_C + '\EPOC\' + EPOC_VER_C;
  PALM_KEY_C = ML_KEY_C + '\Palm\' + PALM_VER_C;
  WAP_KEY_C = ML_KEY_C + '\WAP\' + WAP_VER_C;

  BETA_LM_KEY_C = ML_KEY_C + '\Language Manager\' + BETA_LM_VER_C;
{$ENDIF}

  { INI file data }

  INI_FILE_C = 'ivml16.ini';
  DELPHI1_SECTION_C = 'Delphi, ' + VCL_VER_C;
  VB16_SECTION_C = 'Visual Basic, ' + VB_VER_C;

  { Values }

  SERIAL_NUMBER_C = 'SerialNumber';
  ROOT_DIR_C = 'RootDir';
  DETECT_C = 'Detect';
  VENDOR_C = 'Vendor';
  DICTIONARY_CODE_C = 'DictionaryCode';

  LIMITED_VERSION_LANGAUGE_COUNT_C = 4;
  LIMITED_VERSION_TRANSLATION_COUNT_C = 500;

  ML_SHEET_C = 'Multilizer';
  ML_CONTROLS_SHEET_C = 'ML Controls';
  ML_OLD_SHEET_C = 'ML Old';

type
{$IFDEF WIN32}
  TIvString = AnsiString;
  {$IFDEF IVWIDE}
  TIvWideString = WideString;
  {$ELSE}
  TIvWideString = PWideChar;
  {$ENDIF}
{$ELSE}
  TIvString = PChar;
{$ENDIF}

  TIvByteOrder = (ivboBigEndian, ivboLittleEndian);
  TIvCharacterSet = (ivcsUnicode, ivcsCodePage, ivcsISOCodePage);
  TIvUnicodeFormat = (ivufUTF8, ivufUTF16, ivufJava);

  TIvDetectType = (ivdtDisabled, ivdtPrompt, ivdtEnabled);

  TIvVendor = (ivveInnoview, ivveZac);

  TIvLicense =
  (
    liNone,
    liLimited,
    liEvaluation,
    liStandard,
    liProfessional
  );

const
  VENDOR_NAMES_C: array[TIvVendor] of String =
  (
    'Innoview',
    'ZAC'
  );

  LICENSE_NAMES_C: array[TIvLicense] of String =
  (
    'No license', {ivlm}
    'Limited', {ivlm}
    'Evaluation', {ivlm}
    'Standard', {ivlm}
    'Professional' {ivlm}
  );

{$IFDEF WIN32}
  function SysAllocString(P: PWideChar): PWideChar; stdcall;
  function SysAllocStringLen(P: PWideChar; Len: Integer): PWideChar; stdcall;
  function SysReAllocStringLen(var str: PWideChar; const P: PWideChar; Len: Integer): Integer; stdcall;
  procedure SysFreeString(str: PWideChar); stdcall;
  function SysStringLen(str: PWideChar): Integer; stdcall;

  function MlFileAge(const fileName: string; local: Boolean): Integer;
  function IvWStrToStr(const source: TIvWideString; codePage: Integer): String;

  function IvGetTempFileName(prefix: String): String;
{$ENDIF}

implementation

{$IFDEF WIN32}
const
  OLEAUT = 'oleaut32.dll';

function SysAllocString; external OLEAUT name 'SysAllocString';
function SysAllocStringLen; external OLEAUT name 'SysAllocStringLen';
function SysReAllocStringLen; external OLEAUT name 'SysReAllocStringLen';
procedure SysFreeString; external OLEAUT name 'SysFreeString';
function SysStringLen; external OLEAUT name 'SysStringLen';

function MlFileAge(const fileName: string; local: Boolean): Integer;
var
  handle: THandle;
  findData: TWin32FindData;
  localFileTime: TFileTime;
begin
  handle := FindFirstFile(PChar(FileName), FindData);
  if handle <> INVALID_HANDLE_VALUE then
  begin
    Windows.FindClose(handle);
    if (findData.dwFileAttributes and FILE_ATTRIBUTE_DIRECTORY) = 0 then
    begin
      if local then
        FileTimeToLocalFileTime(findData.ftLastWriteTime, LocalFileTime)
      else
        localFileTime := findData.ftLastWriteTime;

      if FileTimeToDosDateTime(localFileTime, LongRec(Result).Hi, LongRec(Result).Lo) then
        Exit;
    end;
  end;
  Result := -1;
end;

function IvWStrToStr(const source: TIvWideString; codePage: Integer): String;
var
  len: Integer;
begin
  // Calculates the size of the ansi string, sets the string length and
  // converts the string

{$IFDEF IVWIDE}
  if (source = '') or (source[1] = #0) then
{$ELSE}
  if source^ = Chr(0) then
{$ENDIF}
    Result := ''
  else
  begin
    len := WideCharToMultiByte(codePage, 0, PWideChar(source), -1, nil, 0, nil, nil);
    SetLength(Result, len - 1);
    WideCharToMultiByte(codePage, 0, PWideChar(source), -1, PChar(Result), len, nil, nil);
  end;
end;

function IvGetTempFileName(prefix: String): String;
var
  path: array[0..MAX_PATH] of Char;
  buffer: array[0..MAX_PATH] of Char;
begin
  GetTempPath(Sizeof(path), path);
  GetTempFileName(path, PChar(prefix), 0, buffer);
  Result := buffer;
end;
{$ENDIF}

end.
