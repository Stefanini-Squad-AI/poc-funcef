unit uCtrlAtualizaOperacao;

interface

Uses sysutils, uCmControlObject, uCmDbObject, DB, uDataBase, DbClient, Classes,
     uCmTypes;

type

  TCtrlAtualizaOperacao = class(TCmControlObject)
  Protected
  private
  Public
    _CdsSel : TClientDataSet;
    constructor Create; Override;
    destructor  Destroy; Override;
    function ConfirmaAtualizaOperacao : Boolean;
end;


implementation

{ TCtrlAtualizaOperacao }

function TCtrlAtualizaOperacao.ConfirmaAtualizaOperacao: Boolean;
var
  Pos : TBookmark;
begin
  inherited;
  if ConnectionSide = cnsClient then
  begin
    Result := Connection.AppServer.GravaParamCap(_Cds.Data);
    if not Result then MessageInfo := Connection.AppServer.MessageInfo;
  end
  else
  begin
    Result := True;
    StartTransaction;
    try
      with _cdsSel do
      begin
        pos := GetBookmark;
        DisableControls;
        First;
        while not EOF do
        begin
          if FieldByName('OPERACAO').AsString <> FieldByName('OPERACAOANTERIOR').AsString then
          begin
            if not ExecSQL(' UPDATE LANCTODOCUM SET OPERACAO = ' +
                             QuotedStr(FieldByName('OPERACAO').AsString) +
                           ' WHERE CODDOCUMENTO =  ' + FieldByName('CODDOCUMENTO').AsString +
                           '       AND NUMLANCTO = ' + FieldByName('NUMLANCTO').AsString) then
              Raise Exception.Create(MessageInfo);

            if not ExecSQL(' UPDATE DOCUMENTO SET OPERACAO = ' +
                             QuotedStr(FieldByName('OPERACAO').AsString) +
                           ' WHERE CODDOCUMENTO =  ' + FieldByName('CODDOCUMENTO').AsString) then
              Raise Exception.Create(MessageInfo);
            Next;
          end;
        end;
        Commit;
        GotoBookmark(Pos);
        FreeBookmark(Pos);
        EnableControls;
      end;
    except
      on E:Exception do
      begin
        Result := False;
        Rollback;
        MessageInfo := E.Message;
      end;
    end;
  end;
end;

constructor TCtrlAtualizaOperacao.Create;
begin
  inherited;
  _CdsSel := TClientDataSet.Create(nil);
end;

destructor TCtrlAtualizaOperacao.Destroy;
begin
  inherited;
  if isAppServer then _CdsSel.Free;
end;

end.
 