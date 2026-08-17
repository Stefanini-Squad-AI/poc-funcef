unit uCtrlCarteiraInvest;

interface

uses sysutils, uCmControlObject, uCmDbObject, DB, uDataBase, DbClient,
     uDbCarteiraInvest
     {$IFNDEF VERSAO0505} ,uCMTypes {$ENDIF};

type
   TCtrlCarteiraInvest = Class(TCmControlObject)
   private
      FCdsCarteiraInvest : TClientDataSet;
      FDbCarteiraInvest  : TDbCarteiraInvest;

    procedure SetCdsCarteiraInvest(const Value: TClientDataSet);
    procedure SetDbCarteiraInvest(const Value: TDbCarteiraInvest);
   public
      property CdsCarteiraInvest : TClientDataSet read FCdsCarteiraInvest write SetCdsCarteiraInvest;
      property DbCarteiraInvest  : TDbCarteiraInvest read FDbCarteiraInvest write SetDbCarteiraInvest;

      constructor Create; override;

      destructor  Destroy; override;

      procedure   OnCreateAppServer; override;

      function AplicaAtualCarteiraInvest : Boolean;

      function ListCarteiraInvest(iIdCarteiraInvest : Integer = 0) : OleVariant;

   protected
      procedure DoChangeDataBase; override;

   end;
implementation

{ TCtrlCarteiraInvest }

function TCtrlCarteiraInvest.AplicaAtualCarteiraInvest: Boolean;
begin
   if ConnectionSide = cnsClient then
   begin
      Result := Connection.AppServer.AplicaAtualCarteiraInvest(FCdsCarteiraInvest.Data);
      if not Result then MessageInfo := Connection.AppServer.MessageInfo;
   end
   else
   begin
      try
         StartTransaction;

         Result := ApplyCds(FCdsCarteiraInvest,FDbCarteiraInvest,[],[]);
         if not Result then
            Raise Exception.Create(FDbCarteiraInvest.MessageInfo)
         else
            Commit;
      except
         on E:Exception do
         begin
            Rollback;
            Result := False;
            MessageInfo := E.Message;
         end;
      end;
   end;
end;

constructor TCtrlCarteiraInvest.Create;
begin
  inherited;
   FDbCarteiraInvest := TDbCarteiraInvest.Create(Self);
end;

destructor TCtrlCarteiraInvest.Destroy;
begin
  inherited;
   FreeAndNil(FDbCarteiraInvest);
   if IsAppServer then FreeAndNil(FCdsCarteiraInvest);
end;

procedure TCtrlCarteiraInvest.DoChangeDataBase;
begin
  inherited;
   FDbCarteiraInvest.DataBaseName := DataBaseName;
end;

function TCtrlCarteiraInvest.ListCarteiraInvest(iIdCarteiraInvest: Integer): OleVariant;
var  sSql : String;
begin
   sSql := '';
   sSql := sSql + 'SELECT IDCARTEIRAINVEST, DESCCARTINVEST, IDGESTORCARTEIRA, FLGCARTPROP,';
   sSql := sSql + '       FLGCALCDIARIO, DATAINICIO, FLGTRATALOTE, IDPLANOPREV, IDPATROCINADORA,';
   sSql := sSql + '       IDTIPOINVEST, IDMERCADO, FLGORDMOVINV, DATAULTFECH, IDDAIEACART,';
   sSql := sSql + '       FLGCARTLASTRO, FLGCARTTERC, IDCONSELHINVEST, FLGCONTABILIZA ';
   sSql := sSql + 'FROM CARTEIRAINVEST ';
   if (iIdCarteiraInvest > 0) then
      sSql := sSql + 'WHERE IDCARTEIRAINVEST = '+IntToStr(iIdCarteiraInvest);
   sSql := sSql + ' ORDER BY DESCCARTINVEST ';
   Result := GetDataPacket(sSql);
end;

procedure TCtrlCarteiraInvest.OnCreateAppServer;
begin
  inherited;
   FCdsCarteiraInvest := TClientDataSet.Create(nil);
end;

procedure TCtrlCarteiraInvest.SetCdsCarteiraInvest(
  const Value: TClientDataSet);
begin
  FCdsCarteiraInvest := Value;
end;

procedure TCtrlCarteiraInvest.SetDbCarteiraInvest(
  const Value: TDbCarteiraInvest);
begin
  FDbCarteiraInvest := Value;
end;

end.
