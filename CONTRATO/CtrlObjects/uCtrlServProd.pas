unit uCtrlServProd;

interface

uses sysutils, uCmControlObject, uCmDbObject, uSistema, DB, uDataBase, DbClient,
     uCMClientDataSet,uCMTypes, uDbObjetoContratual;

type
   TCtrlServProd = Class(TCmControlObject)

   private
      FDbObjetoContratual   : TDbObjetoContratual;
      FCdsObjeto            : TCMClientDataSet;
   public
      property CdsObjeto: TCMClientDataSet read FCdsObjeto  write FCdsObjeto;

      constructor Create; override;
      destructor Destroy; override;

      procedure OnCreateAppServer; override;
      function AplicaAtualObjeto: Boolean;
      function ListServProd(rIDPessoa, rIDObjeto: Double): OleVariant;
      function ListServProdXContrato(rIDPessoa, rIDContrato, rIDItem: Double): OleVariant;
   protected
      procedure DoChangeDataBase; override;
      procedure AfterInitialize; override;
   end;

implementation

{ TCtrl }


constructor TCtrlServProd.Create;
begin
   inherited;
   FDbObjetoContratual:=TDbObjetoContratual.Create(Self);
end;

procedure TCtrlServProd.OnCreateAppServer;
begin
   inherited;
   FCdsObjeto:=TCMClientDataSet.Create(nil);
end;

destructor TCtrlServProd.Destroy;
begin
   inherited;
   if IsAppServer then FCdsObjeto.Free;
end;

procedure TCtrlServProd.DoChangeDataBase;
begin
   inherited;
   FDbObjetoContratual.DataBaseName:=DataBaseName;
end;

procedure TCtrlServProd.AfterInitialize;
begin
   inherited;
end;

function TCtrlServProd.AplicaAtualObjeto: Boolean;
begin
   MessageInfo:='';
   if ConnectionSide = cnsClient then
    begin
       Result := Connection.AppServer.AplicaAtualObjeto(FCdsObjeto.Data);
       if not Result then MessageInfo := Connection.AppServer.MessageInfo;
    end
   else
    begin
       StartTransaction;
       try
          Result:=ApplyCds(FCdsObjeto,FDbObjetoContratual,[],[]);
          if not(Result) then
           begin
              MessageInfo:=FDbObjetoContratual.MessageInfo;
              Rollback;
           end
          else
           Commit;
       except
          on E:Exception do
          begin
             MessageInfo := E.Message;
             Rollback;
          end;
       end;
    end;
end;

function TCtrlServProd.ListServProd(rIDPessoa, rIDObjeto: Double): OleVariant;
var sSql, sParam : String;
begin
   sParam := '';
   if rIDPessoa <> 0 then sParam := sParam + ' AND IDPESSOA = ' + FloatToStr(rIDPessoa) +#13;
   if rIDObjeto <> 0 then sParam := sParam + ' AND IDOBJETO = ' + FloatToStr(rIDObjeto) +#13;

   sSql := 'SELECT * ' +#13+
           '  FROM OBJETOCONTRATUAL ' +#13+
           ' WHERE 1=1 ' +#13+ sParam +
           ' ORDER BY NOMEOBJETO ';

   Result := GetDataPacket( sSql );
end;

function TCtrlServProd.ListServProdXContrato(rIDPessoa, rIDContrato,
  rIDItem: Double): OleVariant;
var
   sSql : String;
begin
   sSql:='SELECT '+
         '   C.IDOBJETO, '+
         '   C.IDPESSOA, '+
         '   C.CODARTIGO, '+
         '   C.NOMEOBJETO, '+
         '   C.TIPOOBJETO '+
         'FROM '+
         '   OBJETOCONTRATUAL C, '+
         '   OBJETOSXITEMCONTR O '+
         'WHERE '+
         '   (C.IDPESSOA   = '+FloatToStr(rIDPessoa)+') AND '+
         '   (O.IDCONTRATO = '+FloatToStr(rIDContrato)+') AND '+
         '   (O.IDOBJETO   = C.IDOBJETO) ';

   if (rIDItem<>0) then
      sSql:=sSql+'   AND (O.IDITEM     = '+FloatToStr(rIDItem)+') ';

   sSql:=sSql+'ORDER BY NOMEOBJETO ';
   Result:=GetDataPacket(sSql);
end;

end.
