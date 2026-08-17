unit IdException;

interface

uses
  SysUtils;

type
  EIdException = class(Exception);
  TClassIdException = class of EIdException;
  //
  EIdAlreadyConnected = class(EIdException);
  // You can add EIdSilentException to the list of ignored exceptions to reduce debugger "trapping"
  // of "normal" exceptions
  EIdSilentException = class(EIdException);

  EIdInvalidServiceName = class(EIdException);
  {This exception is for protocol errors such as 404 HTTP error}
  EIdProtocolReplyError = class(EIdException)
  protected
    FReplyErrorCode : Integer;
  public
    // Params must be in this order to avoid conflict with CreateHelp constructor in CBuilder
    constructor CreateError(const anErrCode: Integer; const asReplyMessage: string); reintroduce;
     virtual;
    property ReplyErrorCode: Integer read FReplyErrorCode;
  end;

//------------------------------------------------------------------------------
// THE EDnsResolverError is used so the resolver can repond to only resolver
// execeptions.
//------------------------------------------------------------------------------
  EIdDnsResolverError = Class(EIdException);

  {Socket exceptions}
  EIdInvalidSocket = class(EIdException);

  EIdSocketError = class(EIdException)
  private
    FLastError: Integer;
  public
    // Params must be in this order to avoid conflict with CreateHelp constructor in CBuilder
    constructor CreateError(const anErr: Integer; const asMsg: string); virtual;
    //
    property LastError: Integer read FLastError;
  end;

  {TCP Connection}
  EIdConnClosedGracefully = class(EIdSilentException);
  EIdResponseError = class(EIdException);
  EIdClosedSocket = class(EIdException);

  {TIdTrivial FTP Exception }
  EIdTFTPException               = class(EIdException);
  EIdTFTPFileNotFound            = class(EIdTFTPException);
  EIdTFTPAccessViolation         = class(EIdTFTPException);
  EIdTFTPAllocationExceeded      = class(EIdTFTPException);
  EIdTFTPIllegalOperation        = class(EIdTFTPException);
  EIdTFTPUnknownTransferID       = class(EIdTFTPException);
  EIdTFTPFileAlreadyExists       = class(EIdTFTPException);
  EIdTFTPNoSuchUser              = class(EIdTFTPException);
  EIdTFTPOptionNegotiationFailed = class(EIdTFTPException);  // RFC 1782

  {Icmp exceptions}
  EIdIcmpException = class(EIdException);

  EIdSetSizeExceeded = class(EIdException);
implementation

{ EidProtocolReplyError }

constructor EIdProtocolReplyError.CreateError(const anErrCode: Integer; const asReplyMessage: string);
begin
  inherited Create(asReplyMessage);
  FReplyErrorCode := anErrCode;
end;

constructor EIdSocketError.CreateError(const anErr: Integer; const asMsg: string);
begin
  FLastError := anErr;
  inherited Create(asMsg);
end;

end.
