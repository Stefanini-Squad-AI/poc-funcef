unit uCtrlParamRelats;

interface

uses sysutils, uCmControlObject, uCmDbObject, DB, uDataBase, DbClient, uDbParamRelats, uCMTypes;

type
   TCtrlParamRelats = Class(TCmControlObject)

   private

      FDbParamRelats  : TDbParamRelats;
      FCdsParamRelats : TClientDataSet;


   public

      property DbParamRelats  : TDbParamRelats  read FDbParamRelats  write FDbParamRelats;
      property CdsParamRelats : TClientDataSet  read FCdsParamRelats write FCdsParamRelats;

      constructor Create; override;
      destructor Destroy; override;

      function Inserir: Boolean;
      function Alterar: Boolean;
      function Excluir(rIDParamRelats: Double): Boolean;

      function AplicaDados : Boolean;

      function ListParamRelats(rIDPessoa, rIDModulo: Double): OleVariant;


   protected

      procedure DoChangeDataBase; override;


   end;




implementation
{ TCtrlParamRelats }



constructor TCtrlParamRelats.Create;
begin
   inherited;
   FDbParamRelats:=TDbParamRelats.Create(Self);
   FCdsParamRelats:=TClientDataSet.Create(nil);
end;



destructor TCtrlParamRelats.Destroy;
begin
   FDbParamRelats.Free;
   FCdsParamRelats.Free;
   inherited;
end;



procedure TCtrlParamRelats.DoChangeDataBase;
begin
   inherited;
   FDbParamRelats.DataBaseName:=DataBaseName;
end;



function TCtrlParamRelats.Inserir: Boolean;
begin
   if ConnectionSide = cnsClient then
    begin
       Result := Connection.AppServer.InserirParamRelats;
       if not Result then MessageInfo := Connection.AppServer.MessageInfo;
    end
   else
    begin
       try
          CdsToDbObject(FCdsParamRelats,FDbParamRelats);
          StartTransaction;
          Result := FDbParamRelats.Insert;

          if not Result then
           begin
              MessageInfo := FDbParamRelats.MessageInfo;
              Rollback;
           end
          else
           Commit;

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



function TCtrlParamRelats.Alterar: Boolean;
begin
   if ConnectionSide = cnsClient then
    begin
       Result := Connection.AppServer.AlterarParamRelats;
       if not Result then MessageInfo := Connection.AppServer.MessageInfo;
    end
   else
    begin
       try
          CdsToDbObject(FCdsParamRelats,FDbParamRelats);
          StartTransaction;
          Result := FDbParamRelats.Update;

          if not Result then
           begin
              MessageInfo := FDbParamRelats.MessageInfo;
              Rollback;
           end
          else
           Commit;

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



function TCtrlParamRelats.Excluir(rIDParamRelats: Double): Boolean;
begin
   if ConnectionSide = cnsClient then
    begin
       Result := Connection.AppServer.ExcluirParamRelats(rIDParamRelats);
       if not Result then MessageInfo := Connection.AppServer.MessageInfo;
    end
   else
    begin
       try
          CdsToDbObject(FCdsParamRelats,FDbParamRelats);
          StartTransaction;

          FDbParamRelats.Idparamrelats.AsFloat:=rIDParamRelats;
          Result := FDbParamRelats.Delete;

          if not Result then
           begin
              MessageInfo := FDbParamRelats.MessageInfo;
              Rollback;
           end
          else
           Commit;

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



function TCtrlParamRelats.AplicaDados: Boolean;
begin
   if ConnectionSide = cnsClient then
    begin
       Result := Connection.AppServer.AplicaDadosParamRelats;
       if not Result then MessageInfo := Connection.AppServer.MessageInfo;
    end
   else
    begin
       try
          StartTransaction;
          Result := ApplyCds(FCdsParamRelats,FDbParamRelats,[],[]);

          if not Result then
           begin
              MessageInfo := FDbParamRelats.MessageInfo;
              Rollback;
           end
          else
           Commit;

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



function TCtrlParamRelats.ListParamRelats(rIDPessoa, rIDModulo: Double): OleVariant;
var
   sSql    : String;
begin
   sSql:='SELECT '+
         '   IDPARAMRELATS, '+
         '   IDMODULO, '+
         '   IDPESSOA, '+
         '   NOMECOMPO, '+
         '   DESCRICAO, '+
         '   VALOR, '+
         '   NOMERELATORIO '+
         'FROM '+
         '   PARAMRELATS '+
         'WHERE '+
         '   (IDMODULO = '+FloatToStr(rIDModulo)+') AND '+
         '   (IDPESSOA = '+FloatToStr(rIDPessoa)+') '+
         'ORDER BY NOMERELATORIO,DESCRICAO,VALOR ';
   Result:=GetDataPacket(sSql);
end;



end.
