unit uCtrlProdServ;

interface

uses sysutils, uCmControlObject, uCmDbObject, uSistema, DB, uDataBase, DbClient,
     uCMClientDataSet,uCMTypes, uDbObjetoContratual;

type
   TCtrlProdServ = Class(TCmControlObject)

   private
      FDbObjetoContratual   : TDbObjetoContratual;
      FCdsObjeto            : TCMClientDataSet;
   public
      property CdsObjeto: TCMClientDataSet read FCdsObjeto  write FCdsObjeto;

      constructor Create; override;
      destructor Destroy; override;

      procedure OnCreateAppServer; override;
      function AplicaAtualObjeto: Boolean;
      function ListProdServ(rIDPessoa, rIDObjeto: Double): OleVariant;
   protected
      procedure DoChangeDataBase; override;
      procedure AfterInitialize; override;
   end;

implementation

{ TCtrl }


constructor TCtrlProdServ.Create;
begin
   inherited;
   FDbObjetoContratual:=TDbObjetoContratual.Create(Self);
end;

procedure TCtrlProdServ.OnCreateAppServer;
begin
   inherited;
   FCdsObjeto:=TCMClientDataSet.Create(nil);
end;

destructor TCtrlProdServ.Destroy;
begin
   inherited;
   if IsAppServer then FCdsObjeto.Free;
end;

procedure TCtrlProdServ.DoChangeDataBase;
begin
   inherited;
   FDbObjetoContratual.DataBaseName:=DataBaseName;
end;

procedure TCtrlProdServ.AfterInitialize;
begin
   inherited;
end;

function TCtrlProdServ.AplicaAtualObjeto: Boolean;
begin
   MessageInfo:='';
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

function TCtrlProdServ.ListProdServ(rIDPessoa, rIDObjeto: Double): OleVariant;
var
   sSql : String;
begin
   sSql:='SELECT * FROM OBJETOCONTRATUAL WHERE (IDPESSOA = '+FloatToStr(rIDPessoa)+') ';
   if (rIDObjeto<>0) then sSql:=sSql+' AND (IDOBJETO = '+FloatToStr(rIDObjeto)+') ';
   Result:=GetDataPacket(sSql);
end;

end.
