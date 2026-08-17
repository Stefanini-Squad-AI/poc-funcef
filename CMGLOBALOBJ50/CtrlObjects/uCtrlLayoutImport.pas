unit uCtrlLayoutImport;

interface
                       
Uses
  DB, uDataBase, uCmControlObject, dbclient, uMidasUtil, sysutils,wwQuery, provider,
  uDbLayoutimport, uDbCollayoutimport, uCMTypes;

Type
  TCtrlLayoutImport = class(TCmControlObject)

  Protected
      procedure DoChangeDataBase; Override;
      procedure OnCreateAppServer;Override;
  private
    _dbLayoutImport: TdbLayoutImport;
    _dbCollayoutimport: TDbCollayoutimport;

    FCdsLayoutImport: TClientDataSet;
    FCdsColLayoutImport: TClientDataSet;
    procedure SetCdsLayoutImport(const Value: TClientDataSet);
    procedure SetCdsColLayoutImport(const Value: TClientDataSet);
  public
      Constructor Create; Override;
      Destructor  Destroy;Override;

      property CdsLayoutImport: TClientDataSet read FCdsLayoutImport write SetCdsLayoutImport;
      property CdsColLayoutImport: TClientDataSet read FCdsColLayoutImport write SetCdsColLayoutImport;

      function Grava : Boolean;
      function GetLayout(const idmodulo: integer = -1; const idLayoutImport: integer = -1): OleVariant;
      function GetColLayout(const idLayoutImport: integer = -1): OleVariant;
      function ApagaLayOut(Idlayoutimport: integer): boolean;
  end;

implementation


procedure TCtrlLayoutImport.DoChangeDataBase;
begin
  inherited;
  _dbLayoutImport.DatabaseName    := DataBaseName;
  _dbCollayoutimport.DatabaseName := DataBaseName;
end;

procedure TCtrlLayoutImport.OnCreateAppServer;
begin
  inherited;
  FCdsLayoutImport := TClientDataSet.Create(nil);
  FCdsCollayoutimport := TClientDataSet.Create(nil);
end;

constructor TCtrlLayoutImport.Create;
begin
  inherited;
  _dbLayoutImport := TdbLayoutImport.Create(self);
  _dbCollayoutimport := TdbCollayoutimport.Create(self);
end;

destructor TCtrlLayoutImport.Destroy;
begin
  inherited;
  _dbLayoutImport.Free;
  _dbCollayoutimport.Free;
  if isAppServer then
  begin
    FreeCds([FCdsLayoutImport]);
    FreeCds([FCdsCollayoutimport]);
  end;
end;

function TCtrlLayoutImport.Grava: Boolean;
begin
   If ConnectionSide = cnsClient then begin
      Result :=
           Connection.AppServer.AplicaOperacaoLayoutImport(FCdsLayoutImport.Data);
      If Not Result Then MessageInfo := Connection.AppServer.MessageInfo;
   End Else Begin
      MessageInfo := '';
      Try
         StartTransaction;
         Result := ApplyCDS(FCdsLayoutImport,_DbLayoutImport,[],[]);
         Result := ApplyCDS(FCdsColLayoutImport, _DbColLayoutImport, [_DbLayoutImport.Idlayoutimport], [_DbColLayoutImport.Idlayoutimport]);
         If Not Result Then Begin
            MessageInfo := _DbLayoutImport.MessageInfo;
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


procedure TCtrlLayoutImport.SetCdsLayoutImport(
  const Value: TClientDataSet);
begin
  FCdsLayoutImport := Value;
end;


procedure TCtrlLayoutImport.SetCdsColLayoutImport(
  const Value: TClientDataSet);
begin
  FCdsColLayoutImport := Value;
end;


function TCtrlLayoutImport.GetLayout(const idmodulo: integer = -1; const idLayoutImport: integer = -1): OleVariant;
var sSql : string;
begin
  sSql := ' SELECT L.* '+
          ' FROM LAYOUTIMPORT L '+
          ' WHERE 1 = 1 ';
  if idModulo <> -1 then
    sSql := sSql + ' AND L.IDMODULO = '+ intToStr(idmodulo);

  if idLayoutImport <> -1 then
    sSql := sSql + ' AND L.IDLAYOUTIMPORT = '+ intToStr(idLayoutImport);

  sSql := sSql + ' ORDER BY L.DESCLAYOUT ';

  result := getDataPacket(sSql);
end;

function TCtrlLayoutImport.GetColLayout(const idLayoutImport: integer = -1): OleVariant;
var sSql : string;
begin
  sSql := ' SELECT C.* FROM COLLAYOUTIMPORT C ';

  if idLayoutImport <> -1 then
    sSql := sSql + ' WHERE IDLAYOUTIMPORT = '+ intToStr(idLayoutImport);

  sSql := sSql + ' ORDER BY DESCCOLUNA ';

  result := getDataPacket(sSql);
end;

function TCtrlLayoutImport.ApagaLayOut(Idlayoutimport: integer): boolean;
begin
   If ConnectionSide = cnsClient then begin
      Result :=
           Connection.AppServer.AplicaOperacaoLayoutImport(FCdsLayoutImport.Data);
      If Not Result Then MessageInfo := Connection.AppServer.MessageInfo;
   End Else Begin
      MessageInfo := '';
      Try
         StartTransaction;
         Result := ExecSql('DELETE FROM COLLAYOUTIMPORT WHERE IDLAYOUTIMPORT = '+ IntToStr(Idlayoutimport));
         Result := ExecSql('DELETE FROM LAYOUTIMPORT WHERE IDLAYOUTIMPORT = '+ IntToStr(Idlayoutimport));
         If Not Result Then Begin
            MessageInfo := _DbLayoutImport.MessageInfo;
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

end.


