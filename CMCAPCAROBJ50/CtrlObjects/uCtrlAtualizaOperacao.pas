unit uCtrlAtualizaOperacao;

interface

Uses sysutils, uCmControlObject, uCmDbObject, DB, uDataBase, DbClient, Classes,
     uCmTypes;

type

  TCtrlAtualizaOperacao = class(TCmControlObject)
  Protected
  private
    _CdsSel : TClientDataSet;
  Public
    constructor Create; Override;
    destructor  Destroy; Override;

    function GravaAtualizaOperacao(ovSel : OleVariant) : Boolean;
end;


implementation

{ TCtrlAtualizaOperacao }

function TCtrlAtualizaOperacao.GravaAtualizaOperacao(ovSel : OleVariant): Boolean;
begin
  inherited;
  if ConnectionSide = cnsClient then
  begin
    Result := Connection.AppServer.GravaAtualizaOperacao(ovSel);
    if not Result then MessageInfo := Connection.AppServer.MessageInfo;
  end
  else
  begin
    Result := True;
    StartTransaction;
    try
      _CdsSel.Data := ovSel;
      with _CdsSel do
      begin
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
          end;
          Next;
        end;
        Commit;
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
  _CdsSel.Free;
  inherited;
end;

end.
