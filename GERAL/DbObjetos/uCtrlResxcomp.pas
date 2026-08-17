unit uCtrlResxcomp;

interface

Uses
  DB, uDataBase, uCmControlObject, dbclient, uMidasUtil, sysutils, wwQuery, provider, uDbResxcomp, uCMTypes;

Type
  TCtrlResxcomp = class(TCmControlObject)

  Protected
      procedure DoChangeDataBase; Override;
      procedure OnCreateAppServer;Override;
  private
    _dbResxcomp: TdbResxcomp;
    FCdsResxcomp: TClientDataSet;
    procedure SetCdsResxcomp(const Value: TClientDataSet);
  public
      Constructor Create; Override;
      Destructor  Destroy;Override;

      Function LerUltimaSequencia: Integer;
      
      property CdsResxcomp: TClientDataSet
                            read FCdsResxcomp write SetCdsResxcomp;

      function AplicaOperacaoResXComp : Boolean;
      function Procurar(idResxcomp:Double): OleVariant;
      procedure Inserir(idresxcomp, idpessoa, idreserva,
        idcompromisso: integer);
      procedure Excluir(idresxcomp: integer);
      procedure AltReservas(idpessoa, idcompromisso: integer);

  end;

implementation


procedure TCtrlResxcomp.DoChangeDataBase;
begin
  inherited;
  _dbResxcomp.DatabaseName := DataBaseName;
end;

procedure TCtrlResxcomp.OnCreateAppServer;
begin
  inherited;
  FCdsResxcomp := TClientDataSet.Create(nil);
end;

constructor TCtrlResxcomp.Create;
begin
  inherited;
  _dbResxcomp := TdbResxcomp.Create(Self);
end;

destructor TCtrlResxcomp.Destroy;
begin
  inherited;
  _dbResxcomp.Free;
  if isAppServer then begin
    FreeCds([FCdsResxcomp]);
  end;
end;

function TCtrlResxcomp.AplicaOperacaoResXComp: Boolean;
begin
   If ConnectionSide = cnsClient then begin
      Result := Connection.AppServer.AplicaOperacaoResXComp( FCdsResxcomp.Data );
      If Not Result Then MessageInfo := Connection.AppServer.MessageInfo;
   End Else Begin
      MessageInfo := '';
      Try
         StartTransaction;
         Result := ApplyCDS(FCdsResxcomp,_DbResxcomp,[],[]);
         If Not Result Then Begin
            MessageInfo := _DbResxcomp.MessageInfo;
            Abort;
         End Else
            Commit;
      Except
         On E:Exception Do Begin
            Result := False;
            Rollback;
            MessageInfo := MessageInfo + E.Message;
         End;
      End;
   End;
end;

function TCtrlResxcomp.Procurar(idresxcomp:Double): OleVariant;
begin
   _DbResxcomp.Idresxcomp.AsFloat := idresxcomp;
   Result := GetDataPacket(_DbResxcomp.SSqlSelect);
end;

procedure TCtrlResxcomp.SetCdsResxcomp(
  const Value: TClientDataSet);
begin
  FCdsResxcomp := Value;
end;

procedure TCtrlResxcomp.Inserir(idresxcomp, idpessoa, idreserva,
  idcompromisso: integer);
var sSql: string;
begin
  sSql := 'INSERT INTO RESXCOMP ' +
          '(IDRESXCOMP, IDRESERVA, IDCOMPROMISSO, IDPESSOA) VALUES ' +
          '(' + IntToStr(idresxcomp) + ', ' + IntToStr(idreserva) +
          ', ' + IntToStr(idcompromisso) + ', ' + IntToStr(idpessoa) + ')';
  ExecSQL(sSql);
end;

procedure TCtrlResxcomp.Excluir(idresxcomp: integer);
var sSql: string;
begin
  sSql := 'DELETE FROM RESXCOMP ' +
          'WHERE IDRESXCOMP = ' + IntToStr(idresxcomp);
  ExecSQL(sSql);
end;

procedure TCtrlResxcomp.AltReservas(idpessoa, idcompromisso: integer);
var sSql: string;
begin
  sSql := 'DELETE RESXCOMP WHERE ' +
          '(IDPESSOA = ' + IntToStr(idpessoa) + ') AND (IDCOMPROMISSO = ' +
          IntToStr(idcompromisso) + ')';
  ExecSQL(sSql);
end;
//************************************************
Function TCtrlResxcomp.LerUltimaSequencia : Integer;
Begin

  Result := GetSequence( 'RESXCOMP' );
End;
//************************************************
end.


