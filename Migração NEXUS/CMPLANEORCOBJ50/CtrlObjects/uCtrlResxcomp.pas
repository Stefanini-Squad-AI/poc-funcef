unit uCtrlResxcomp;

interface

Uses
  DB, uDataBase, uCmControlObject, dbclient, uMidasUtil, sysutils, wwQuery, provider,
  uDbResxcomp, uCMTypes, Classes;

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

      function ListarReservasDoCompromisso(idCompromisso: double; idPessoa: integer): OleVariant;

      function ListarCompromissosDaReserva(idReserva: double; idPessoa: integer): OleVariant;

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
  _dbResxcomp.Free;
  if isAppServer then begin
    FreeCds([FCdsResxcomp]);
  end;
  inherited;
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


function TCtrlResxcomp.ListarReservasDoCompromisso(idCompromisso: double; idPessoa: integer): OleVariant;
// Função que retorna as RESERVAS utilizadas por um COMPROMISSO
var
  sSql: TStringList;

begin
  sSql := TStringList.Create;

  sSql.Add('SELECT R.NUMRESERVA, ');
  sSql.Add('       R.IDCONTAORCAMEN, ');
  sSql.Add('       R.DATAREFERENCIA, ');
  sSql.Add('       R.VLRRESERVA, ');
  sSql.Add('       R.FLGRESERVA, ');
  sSql.Add('       R.OBSRESERVA, ');
  sSql.Add('       R.IDRESERVAORCAMEN, ');
  sSql.Add('       X.IDRESXCOMP, ');
  sSql.Add('       X.IDPESSOA, ');
  sSql.Add('       X.IDRESERVA, ');
  sSql.Add('       X.IDCOMPROMISSO, ');
  sSql.Add('       C.CODCENTRORESPON ');
  sSql.Add('  FROM RESERVAORCAMEN R, ');
  sSql.Add('       RESXCOMP X, ');
  sSql.Add('       CONTASORCAMEN C ');
  sSql.Add(' WHERE (X.IDPESSOA = ' + IntToStr(idPessoa) + ')' );
  sSql.Add('   AND (X.IDCOMPROMISSO = ' + FloatToStr(idCompromisso) + ')' );
  sSql.Add('   AND (R.IDRESERVAORCAMEN = X.IDRESERVA) ');
  sSql.Add('   AND (R.FLGRESCOMP = ''R'') ');
  sSql.Add('   AND (C.IDCONTAORCAMEN = R.IDCONTAORCAMEN) ');
  sSql.Add('   AND (C.IDPLANOORCAMEN = R.IDPLANOORCAMEN) ');

  Result := GetDataPacket(sSql);
end;

function TCtrlResxcomp.ListarCompromissosDaReserva(idReserva: double; idPessoa: integer): OleVariant;
// Função que retorna os COMPROMISSOS gerados de uma RESERVA
var
  sSql: TStringList;

begin
  sSql := TStringList.Create;

  sSql.Add('SELECT * ');
  sSql.Add('  FROM RESXCOMP ');
  sSql.Add(' WHERE IDRESERVA = ' + FloatToStr(IdReserva));
  sSql.Add('   AND IDPESSOA = ' + IntToStr(IdPessoa));

  Result := GetDataPacket(sSql);
end;

end.


