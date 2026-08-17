unit IvMLTP;

{$I IVMULTI.INC}

{$A-}

interface

uses
  Windows, SysUtils, Classes,
  IvSocket;

const
  DEFAULT_ADMIN_NAME_C = 'master';
  DEFAULT_BODY_C = 'mds';

  //SPACE_C = ' ';
  SEPARATOR_C = Chr(127);
  END_C = Chr(0);

  DEFAULT_PORT_C = 1099;

  CURRENT_MLTP_VERSION_C = 11;
  UTF8_MLTP_VERSION_C = 11;
  //GLOSSARY_MLTP_VERSION_C = 12;

  DEFAULT_TIMEOUT_C = 5000;
  DEFAULT_CODE_PAGE_C = 1252;

  // Result codes used by DSTP messages

  MLTP_OK_C = 0;
  MLTP_READ_ONLY_C = 1;
  MLTP_ERROR_C = 2;
  MLTP_NOT_FOUND_C = 3;
  MLTP_INVALID_DATA_C = 4;
  MLTP_ACCESS_ERROR_C = 5;
  MLTP_TOO_MANY_CONNECTIONS_C = 6;
  MLTP_NOT_ENOUGH_MEMORY_C = 7;
  MLTP_LOCKED_C = 8;
  MLTP_ALREADY_EXISTS_C = 9;
  MLTP_EXPIRED_C = 10;
  MLTP_INVALID_PARAMETER_C = 11;
  MLTP_NOT_SUPPORTED_C = 12;
  MLTP_INVALID_COMMAND_C = 13;
  MLTP_INVALID_VERSION_C = 14;
  MLTP_INVALID_LOCALE_CODING_C = 15;
  MLTP_TIMEOUT_C = 16;

  // Message ids

  MLTP_LOGIN_C = 'LOGIN';         // Login group
  MLTP_LOGOUT_C = 'LOGOUT';
  MLTP_OPEN_C = 'OPEN';
  MLTP_CLOSE_C = 'CLOSE';

  MLTP_TRANSLATE_C = 'TRANSLATE'; // Translate group
  MLTP_CONTEXT_C = 'CONTEXT';     // Context translate group

  MLTP_GET_C = 'GET';             // Get group

  MLTP_SET_C = 'SET';             // Set group

  MLTP_ADD_C = 'ADD';             // Edit group
  MLTP_RENAME_C = 'RENAME';
  MLTP_DELETE_C = 'DELETE';
  MLTP_EDIT_C = 'EDIT';
  MLTP_UPDATE_C = 'UPDATE';
  MLTP_POST_C = 'POST';
  MLTP_CANCEL_C = 'CANCEL';

  // DSTP Items

  MLTP_VERSION_C = 'VERSION';

  MLTP_DICTIONARYDATE_C = 'DICTIONARYDATE';

  MLTP_USER_C = 'USER';
  MLTP_USERS_C = 'USERS';

  MLTP_CLIENT_C = 'CLIENT';
  MLTP_CLIENTS_C = 'CLIENTS';

  MLTP_DICTIONARY_C = 'DICTIONARY';
  MLTP_DICTIONARIES_C = 'DICTIONARIES';

  MLTP_LANGUAGE_C = 'LANGUAGE';
  MLTP_LANGUAGECOUNT_C = 'LANGUAGECOUNT';
  MLTP_LANGUAGEDATA_C = 'LANGUAGEDATA';

  MLTP_LOCALE_C = 'LOCALE';
  MLTP_LOCALECOUNT_C = 'LOCALECOUNT';
  MLTP_LOCALEDATA_C = 'LOCALEDATA';

  MLTP_TRANSLATIONCOUNT_C = 'TRANSLATIONCOUNT';
  MLTP_TRANSLATION_C = 'TRANSLATION';
  MLTP_TRANSLATIONBYINDEX_C = 'TRANSLATIONBYINDEX';
  MLTP_TRANSLATIONBYNATIVE_C = 'TRANSLATIONBYNATIVE';

  MLTP_INFO_C = 'INFO';

  MLTP_LOG_C = 'LOG';

  // MDS Items

  MLTP_LICENSE_C = 'LICENSE';

type
  TIvMessageType = (ivmtUnknown, ivmtWide, ivmtAnsi, ivmtUTF8);
  TIvUserType = (ivutNone, ivutUser, ivutAuthor, ivutAdmin);

  TIvClientType =
  (
    ivctUnknown,
    ivctLM,
    ivctPM,
    ivctDelphi,
    ivctCBuilder,
    ivctJava,
    ivctVB,
    ivctWFC
  );

  TIvOperatingSystem =
  (
    ivosWindows,
    ivosJava,
    ivosLinux
  );

  TIvActionType = (ivatInfo, ivatWarning, ivatError, ivatFatalError);

  TIvMessageGroup = (ivmgLogin, ivmgTranslate, ivmgGet, ivmgSet, ivmgEdit);
  TIvMessageGroups = set of TIvMessageGroup;

  EIvSocketError = class(Exception);

  EIvMLTPError = class(Exception)
  public
    ResultCode: Integer;

    constructor CreateMsg(resultCode: Integer; msg: String);
  end;

  function IvIsDNSAddress(const value: String): Boolean;

  function DateTimeToMLTPString(value: TDateTime): String;
  function MLTPStringToDateTime(value: String): TDateTime;

implementation

uses
  IvParser;

function IvIsDNSAddress(const value: String): Boolean;
begin
  if value = '' then
    Result := False
  else
    Result := IsCharAlpha(value[1]);
end;

function DateTimeToMLTPString(value: TDateTime): String;
var
  year, month, day, hour, min, sec, mSec: Word;
begin
  // mm/dd/yyyy hh:mm:ss

  DecodeDate(value, year, month, day);
  DecodeTime(value, hour, min, sec, mSec);
  Result := Format('%d/%d/%d %d:%d:%d', [month, day, year, hour, min, sec]);
end;

function MLTPStringToDateTime(value: String): TDateTime;
var
  year, month, day, hour, min, sec: Word;
  parser: TIvAnsiParser;
begin
  // mm/dd/yyyy hh:mm:ss

  parser := TIvAnsiParser.CreateValue(value, '/');
  try
    month := parser.GetInteger;
    day := parser.GetInteger;
    parser.Separator := ' ';
    year := parser.GetInteger;
    parser.Separator := ':';
    hour := parser.GetInteger;
    min := parser.GetInteger;
    sec := parser.GetInteger;
    Result := EncodeDate(year, month, day) + EncodeTime(hour, min, sec, 0);
  finally
    parser.Free;
  end;
end;

constructor EIvMLTPError.CreateMsg(resultCode: Integer; msg: String);
begin
  if msg = '' then
    case resultCode of
      MLTP_OK_C: msg := 'OK';
      MLTP_READ_ONLY_C: msg := 'Read only access';
      MLTP_ERROR_C: msg := 'Error';
      MLTP_NOT_FOUND_C: msg := 'Not found';
      MLTP_INVALID_DATA_C: msg := 'Invalid data';
      MLTP_ACCESS_ERROR_C: msg := 'Access error';
      MLTP_TOO_MANY_CONNECTIONS_C: msg := 'Too many connections';
      MLTP_NOT_ENOUGH_MEMORY_C: msg := 'Not enough memory';
      MLTP_LOCKED_C: msg := 'Item is locked';
      MLTP_ALREADY_EXISTS_C: msg := 'Already exist';
      MLTP_EXPIRED_C: msg := 'Evaluation period of MDS has been expired';
      MLTP_INVALID_PARAMETER_C: msg := 'Invalid parameter';
      MLTP_NOT_SUPPORTED_C: msg := 'Not supported';
      MLTP_INVALID_COMMAND_C: msg := 'Invalid command';
      MLTP_INVALID_VERSION_C: msg := 'Invalid version';
      MLTP_INVALID_LOCALE_CODING_C: msg := 'Invalid locale coding';
      MLTP_TIMEOUT_C: msg := 'Timeout';
    else
      msg := 'Unknown MLTP error';
  end;

  inherited Create(msg);
  Self.resultCode := resultCode;
end;

end.
