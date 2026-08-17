unit uCtrlBMeF;

interface

uses sysutils, uCmControlObject, uCmDbObject, DB, uDataBase, DbClient
     {$IFNDEF VERSAO0505} ,uCMTypes {$ENDIF};

type
   TCtrlBMeF = Class(TCmControlObject)
   private

   public

      constructor Create; override;
      destructor Destroy; override;
      procedure OnCreateAppServer; override;

      function ListTipoInvestidor(iIdTipoInvestidor : Integer = -1): OleVariant;

   protected
      procedure DoChangeDataBase; override;

   end;

implementation

{TCtrlBMeF}

constructor TCtrlBMeF.Create;
begin
   inherited;
end;

destructor TCtrlBMeF.Destroy;
begin
   inherited;
end;

procedure TCtrlBMeF.OnCreateAppServer;
begin
   inherited;
end;

procedure TCtrlBMeF.DoChangeDataBase;
begin
   inherited;
end;

function TCtrlBMeF.ListTipoInvestidor(iIdTipoInvestidor: Integer = -1): OleVariant;
var
   sSql : String;
begin
   sSql := '';
   sSql := sSql + 'SELECT                                   ';
   sSql := sSql + '     IDTIPOINVESTIDOR, DESCTPINVESTIDOR  ';
   sSql := sSql + 'FROM TIPOINVESTIDOR                      ';
   if iIdTipoInvestidor <> -1 then
      sSql := sSql + 'AND IDCARTEIRAINVEST = ' + IntToStr(iIdTipoInvestidor);
   sSql := sSql + 'ORDER BY DESCTPINVESTIDOR ';
   Result := GetDataPacket(sSql);
end;

end.
