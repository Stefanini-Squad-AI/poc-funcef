unit uCtrlExecQryRH;

interface

uses Classes, DbClient, SysUtils, uCmDbObject, uCmControlObject, IvDictio,
  uCtrlFuncoesRH;

type
  TCtrlExecQryRH = class(TCtrlFuncoesRH)
  private
    FCds: TClientDataSet;

    function RetirarComentarios(SQL: string): string;
  public
    function Open(SQL: string): boolean;

    function ExecutarSQL(SQL: string): boolean;
    function ExecutarListaSQL(ListaSQL: string): boolean;

    property Cds: TClientDataSet read FCds write FCds;
  end;

var
  CtrlExecQryRH: TCtrlExecQryRH;

implementation

uses uCMTypes;

function TCtrlExecQryRH.RetirarComentarios(SQL: string): string;
var
  iPosIni, iPosFinal: integer;
begin
  SQL := Trim(SQL);

  // Retirar comentários simples
  iPosIni := Pos('--',SQL);
  while (iPosIni > 0) do
  begin
    iPosFinal := Pos(CR_LF, Copy(SQL,iPosIni,Length(SQL)-iPosIni));

    if (iPosFinal > 0) then
      Delete(SQL, iPosIni, iPosFinal-1)
    else
      Delete(SQL, iPosIni, Length(SQL)-iPosIni+1);

    iPosIni := Pos('--',SQL);
  end;

  // Retirar comentários compostos
  iPosIni := Pos('/*',SQL);
  while (iPosIni > 0) do
  begin
    iPosFinal := Pos('*/', SQL);

    if (iPosFinal > 0) then
      Delete(SQL, iPosIni, iPosFinal-iPosIni+2)
    else
      Delete(SQL, iPosIni, Length(SQL)-iPosIni+1);

    iPosIni := Pos('/*',SQL);
  end;

  SQL := Trim(SQL);
  Result := SQL;
end;

function TCtrlExecQryRH.Open(SQL: string): boolean;
begin
  SQL := RetirarComentarios(SQL);
  if (UpperCase(Copy(SQL,1,6)) = 'INSERT') or
     (UpperCase(Copy(SQL,1,6)) = 'UPDATE') or
     (UpperCase(Copy(SQL,1,6)) = 'DELETE') then
  begin
    FCds.Close;
    Result := ExecutarSQL(SQL);
  end
  else
  begin
    try
      FCds.Data := GetDataPacket(SQL);
      Result := true;
    except
      Result := false;
    end;
  end;  
end;

function TCtrlExecQryRH.ExecutarSQL(SQL: string): boolean;
begin
  if (ConnectionSide = cnsClient) then
  begin
    Result := Connection.AppServer.ExecutarSQL(SQL);
    if not(Result) then
      MessageInfo := Connection.AppServer.MessageInfo;
  end
  else
  begin
    try
      StartTransaction;

      Result := ExecSQL(SQL);
      if not(Result) then
        raise Exception.Create(MessageInfo);

      Commit;
    except
      Rollback;
      Result := false;
    end;
  end;
end;

function TCtrlExecQryRH.ExecutarListaSQL(ListaSQL: string): boolean;
var
  c: byte;
  _ComandosSQL: TStringList;
begin
  if (ConnectionSide = cnsClient) then
  begin
    Result := Connection.AppServer.ExecutarListaSQL(ListaSQL);
    if not(Result) then
      MessageInfo := Connection.AppServer.MessageInfo;
  end
  else
  begin
    if (Trim(ListaSQL) = '') then
    begin
      Result := true;
      MessageInfo := ('Nenhuma Instrução Executada.');
      exit;
    end;

    _ComandosSQL := TStringList.Create;

    try
      StartTransaction;

      _ComandosSQL.Text := ListaSQL;
      for c:=0 to _ComandosSQL.Count-1 do
        if not(ExecSql(_ComandosSQL[c])) then
          raise Exception.Create(MessageInfo);

      Commit;
      Result := true;
    except
      on E: Exception do
      begin
        Rollback;
        Result := false;
        MessageInfo := E.Message;
      end;
    end;
    _ComandosSQL.Free;
  end;
end;

end.
