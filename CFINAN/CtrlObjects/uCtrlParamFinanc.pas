unit uCtrlParamFinanc;

interface

uses sysutils, uCmControlObject, uCmDbObject, DB, uDataBase, DbClient, uDbParamfinanc, uCMTypes;

type
   TCtrlParamFinanc = Class(TCmControlObject)

   private

      FDbParamFinanc  : TDbParamFinanc;
      FCdsParamFinanc : TClientDataSet;
      //AL_1
      FIntervalDisp : String;

      procedure SetIntervalDisp(const Value: String);


   public

      property CdsParamFinanc : TClientDataSet  read FCdsParamFinanc write FCdsParamFinanc;
      //AL_1
      property IntervalDisp : String read FIntervalDisp write SetIntervalDisp;

      constructor Create; override;
      destructor Destroy; override;
      procedure OnCreateAppServer; override;

      function AplicaAtualParamFinanc : Boolean;
      function ListParamFinanc(rIDPessoa: Double): OleVariant;
      function ListParamRelats(rIDPessoa, rIDModulo: Double): OleVariant;


   protected

      procedure DoChangeDataBase; override;


   end;




implementation
{ TCtrlParamRelats }




constructor TCtrlParamFinanc.Create;
begin
   inherited;
   FDbParamFinanc:=TDbParamfinanc.Create(Self);
end;



destructor TCtrlParamFinanc.Destroy;
begin
   FDbParamFinanc.Free;
   if IsAppServer then FCdsParamFinanc.Free;
   inherited;
end;



procedure TCtrlParamFinanc.OnCreateAppServer;
begin
   inherited;
   FCdsParamFinanc:=TClientDataSet.Create(nil);
end;



procedure TCtrlParamFinanc.DoChangeDataBase;
begin
   inherited;
   FDbParamFinanc.DataBaseName:=DataBaseName;
end;



function TCtrlParamFinanc.ListParamFinanc(rIDPessoa: Double): OleVariant;
begin
   Result:=GetDataPacket('SELECT LTRIM(CONTALANCNAOIDENT) AS CONTALANCNAOIDENT, '+
                         '       P.* FROM PARAMFINANC P WHERE (IDPESSOA='+FloatToStr(rIDPessoa)+') ');
end;



function TCtrlParamFinanc.AplicaAtualParamFinanc: Boolean;
begin
   if ConnectionSide = cnsClient then
    begin
       Result := Connection.AppServer.AplicaAtualParamFinanc(FCdsParamFinanc.Data);
       if not Result then MessageInfo := Connection.AppServer.MessageInfo;
    end
   else
    begin
       try
          StartTransaction;

          Result := ApplyCds(FCdsParamFinanc,FDbParamFinanc,[],[]);
          if not Result then
           begin
              MessageInfo := FDbParamFinanc.MessageInfo;
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



function TCtrlParamFinanc.ListParamRelats(rIDPessoa,
  rIDModulo: Double): OleVariant;
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



//AL_1
procedure TCtrlParamFinanc.SetIntervalDisp(const Value: String);
begin
  FIntervalDisp := Value;
end;



end.
