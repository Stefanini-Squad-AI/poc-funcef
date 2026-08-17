unit uCtrlCenarioOrcamen;

interface

Uses
  DB,       uDataBase,         uCmControlObject, dbclient, sysutils, wwQuery, provider,
  uCMTypes, uDbCenarioOrcamen;

Type
  TCtrlCenarioOrcamen = class(TCmControlObject)

  Protected
      procedure DoChangeDataBase; Override;
      Procedure OnCreateAppServer; Override;
  private

    _dbCenarioOrcamen  : TdbCenarioOrcamen;
    FCdsCenarioOrcamen : TClientDataSet;

    Procedure SetCdsCenarioOrcamen(const Value: TClientDataSet);

  Public
      Constructor Create; Override;
      Destructor  Destroy;Override;

      property CdsCenarioOrcamen: TClientDataSet read FCdsCenarioOrcamen write SetCdsCenarioOrcamen;

      function AplicaOperacaoCenarioOrcamen : Boolean;
      function Procurar(idCenarioOrcamen:Double): OleVariant;

  end;

implementation


procedure TCtrlCenarioOrcamen.DoChangeDataBase;
begin
  inherited;
  _dbCenarioOrcamen.DatabaseName := DataBaseName;
end;
//************************************************
Procedure TCtrlCenarioOrcamen.OnCreateAppServer;
Begin
  Inherited;

  CdsCenarioOrcamen := TClientDataSet.Create( Nil );
End;

constructor TCtrlCenarioOrcamen.Create;
begin
  inherited;
  _dbCenarioOrcamen := TdbCenarioOrcamen.Create( Self );
  FCdsCenarioOrcamen := TClientDataSet.Create(nil);
end;

destructor TCtrlCenarioOrcamen.Destroy;
begin
  inherited;
  _dbCenarioOrcamen.Free;
  FCdsCenarioOrcamen.Free;
end;

function TCtrlCenarioOrcamen.AplicaOperacaoCenarioOrcamen: Boolean;
begin
   If ConnectionSide = cnsClient then begin
      Result := Connection.AppServer.AplicaOperacaoCenarioOrcamen( FCdsCenarioOrcamen.Data );
      If Not Result Then MessageInfo := Connection.AppServer.MessageInfo;
   End Else Begin
      MessageInfo := '';
      Try
         StartTransaction;
         Result := ApplyCDS(FCdsCenarioOrcamen,_DbCenarioOrcamen,[],[]);
         If Not Result Then Begin
            MessageInfo := _DbCenarioOrcamen.MessageInfo;
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


function TCtrlCenarioOrcamen.Procurar(idCenarioOrcamen:Double): OleVariant;
begin
   _DbCenarioOrcamen.IdCenarioOrcamen.AsFloat := idCenarioOrcamen;
   Result := GetDataPacket(_DbCenarioOrcamen.SSqlSelect);
end;

procedure TCtrlCenarioOrcamen.SetCdsCenarioOrcamen(
  const Value: TClientDataSet);
begin
  FCdsCenarioOrcamen := Value;
end;


end.


