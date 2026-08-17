unit uObjRubricaIndiv;



interface

uses
  ActiveX, MtsObj, Mtx, ComObj, CmMtsObjRH_TLB, StdVcl;

type
  TObjRubricaIndiv = class(TMtsAutoObject, IObjRubricaIndiv)
  protected
    function GetXmlRubricaIndiv(var sMensagem, sConnectionString: WideString;
      IdPessoa: double; var XmlRubricaIndiv: WideString): WordBool; safecall;
    function GetProximoNumSeq(var sMensagem, sConnectionString: WideString;
      IdPessoa, IdRubrica: Double; IdEmpresa: Integer;
      var ProximoNumSeq: Integer): WordBool; safecall;

    function GravarRubricaIndiv(var sMensagem, sConnectionString: WideString;
      bControlaTransacao: WordBool; const XmlRubricaIndiv: WideString): WordBool; safecall;
  end;

implementation

uses SysUtils, ComServ, uCMTypes, AdoDb, uMidasUtil, uCtrlRubricaIndiv;

function TObjRubricaIndiv.GetXmlRubricaIndiv(var sMensagem,
  sConnectionString: WideString; IdPessoa: Double;
  var XmlRubricaIndiv: WideString): WordBool;
var
  _Ctrl: TCtrlRubricaIndiv;
  _AdoConnection: TADOConnection;
begin
  _Ctrl := TCtrlRubricaIndiv.Create;
  _AdoConnection := TADOConnection.Create(nil);

  try
    _AdoConnection.ConnectionString := sConnectionString;
    _AdoConnection.CursorLocation := clUseServer;
    _AdoConnection.LoginPrompt := false;
    _AdoConnection.Open;

    _Ctrl.Initialize(nil, false, cntAdo, cnsServer, nil, false, nil, _AdoConnection, true);

    Result := _Ctrl.GetXmlRubricaIndiv(IdPessoa, XmlRubricaIndiv);

    if not(Result) then
      raise Exception.Create(_Ctrl.MessageInfo);

    Result := true;

    _Ctrl.Free;
    _AdoConnection.Free;
  except
    on E: Exception do
    begin
      Result := false;
      _Ctrl.Free;
      _AdoConnection.Free;
      sMensagem := E.Message;
    end;
  end;
end;

function TObjRubricaIndiv.GetProximoNumSeq(var sMensagem,
  sConnectionString: WideString; IdPessoa, IdRubrica: Double;
  IdEmpresa: Integer; var ProximoNumSeq: Integer): WordBool;
var
  _Ctrl: TCtrlRubricaIndiv;
  _AdoConnection: TADOConnection;
begin
  _Ctrl := TCtrlRubricaIndiv.Create;
  _AdoConnection := TADOConnection.Create(nil);

  try
    _AdoConnection.ConnectionString := sConnectionString;
    _AdoConnection.CursorLocation := clUseServer;
    _AdoConnection.LoginPrompt := false;
    _AdoConnection.Open;

    _Ctrl.Initialize(nil, false, cntAdo, cnsServer, nil, false, nil, _AdoConnection, true);

    ProximoNumSeq := _Ctrl.UltimoNumSeq(IdPessoa, IdRubrica, IdEmpresa) + 1;

    Result := true;

    _Ctrl.Free;
    _AdoConnection.Free;
  except
    on E: Exception do
    begin
      Result := false;
      ProximoNumSeq := -1;
      _Ctrl.Free;
      _AdoConnection.Free;
      sMensagem := E.Message;
    end;
  end;
end;

function TObjRubricaIndiv.GravarRubricaIndiv(var sMensagem,
  sConnectionString: WideString; bControlaTransacao: WordBool;
  const XmlRubricaIndiv: WideString): WordBool;
var
  _Ctrl: TCtrlRubricaIndiv;
  _AdoConnection: TADOConnection;
begin
  _Ctrl := TCtrlRubricaIndiv.Create;
  _AdoConnection := TADOConnection.Create(nil);

  try
    _AdoConnection.ConnectionString := sConnectionString;
    _AdoConnection.CursorLocation := clUseServer;
    _AdoConnection.LoginPrompt := false;
    _AdoConnection.Open;

    _Ctrl.Initialize(nil, bControlaTransacao, cntAdo, cnsServer, nil, false, nil, _AdoConnection, true);

    XmlToCds(XmlRubricaIndiv, _Ctrl.CdsRubricaIndiv);

    Result := _Ctrl.GravarRubricaIndiv;
    if not(Result) then
      raise Exception.Create(_Ctrl.MessageInfo);

    Result := true;

    _Ctrl.Free;
    _AdoConnection.Free;
  except
    on E:Exception do
    begin
      Result := false;
      _Ctrl.Free;
      _AdoConnection.Free;
      sMensagem := E.Message;
    end;
  end;
end;

initialization
  TAutoObjectFactory.Create(ComServer, TObjRubricaIndiv, Class_ObjRubricaIndiv,
    ciMultiInstance, tmApartment);
end.
