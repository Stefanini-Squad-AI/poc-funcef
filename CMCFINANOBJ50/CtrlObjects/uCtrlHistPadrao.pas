unit uCtrlHistPadrao;

interface

uses sysutils, uCmControlObject, uCmDbObject, uDbHistPadrao, DB, uDataBase, DbClient,
     uCMClientDataSet, uCtrlPadroes, uCMTypes;

type
   TCtrlHistPadrao = Class(TCmControlObject)

   private

      FDbHistPadrao  : TDbHistPadrao;
      FCdsHistPadrao : TCMClientDataSet;
      CtrlPadroes    : TCtrlPadroes;


   public

      property CdsHistPadrao: TCMClientDataSet read FCdsHistPadrao write FCdsHistPadrao;

      constructor Create; override;
      destructor Destroy; override;

      function AplicaAtualHistPad(rIDPessoa,rIDModulo,rIDUsuario: Double): Boolean;
      function ListHsitoricoPadrao(rHistPadFinan: Double): OleVariant;

      procedure OnCreateAppServer; override;


   protected

      procedure DoChangeDataBase; override;
      procedure AfterInitialize; override;


   end;



implementation
{ TCtrlHistPadrao }



constructor TCtrlHistPadrao.Create;
begin
   inherited;
   FDbHistPadrao:=TDbHistPadrao.Create(Self);
   CtrlPadroes:=TCtrlPadroes.Create;
end;



destructor TCtrlHistPadrao.Destroy;
begin
   FDbHistPadrao.Free;
   CtrlPadroes.Free;
   if IsAppServer then FCdsHistPadrao.Free;
   inherited;
end;



procedure TCtrlHistPadrao.OnCreateAppServer;
begin
   inherited;
   FCdsHistPadrao:=TCMClientDataSet.Create(nil);
end;



procedure TCtrlHistPadrao.AfterInitialize;
begin
   inherited;
   CtrlPadroes.InitializeAs(Self);
end;



procedure TCtrlHistPadrao.DoChangeDataBase;
begin
   inherited;
   FDbHistPadrao.DataBaseName:=DataBaseName;
end;



function TCtrlHistPadrao.AplicaAtualHistPad(rIDPessoa,rIDModulo,rIDUsuario: Double): Boolean;
begin
   if ConnectionSide = cnsClient then
    begin
       Result := Connection.AppServer.AplicaAtualizacoesHistPad(FCdsHistPadrao.Data);
       if not Result then MessageInfo := Connection.AppServer.MessageInfo;
    end
   else
    begin
       try
          StartTransaction;

          Result:=ApplyCds(FCdsHistPadrao,FDbHistPadrao,[],[]);

          if not Result then
           begin
              MessageInfo := FDbHistPadrao.MessageInfo;
              Rollback;
           end
          else
           begin
              Result:=CtrlPadroes.GravaLogOperacoes(rIDPessoa,rIDModulo,rIDUsuario,
                                                   'Inclusão/Alteração/Exclusão de Histórico Padrão',False);
              if not(Result) then
               begin
                  MessageInfo:=CtrlPadroes.MessageInfo;
                  Rollback;
               end
              else
               Commit;
           end;

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



function TCtrlHistPadrao.ListHsitoricoPadrao(rHistPadFinan: Double): OleVariant;
var
   sSql : String;
begin
   sSql:='SELECT * '+
         'FROM HISTORICOFINAN ';

   if (rHistPadFinan<>0) then sSql:=sSql+'WHERE (HISTPADFINAN = '+FloatToStr(rHistPadFinan)+') ';
   sSql:=sSql+'ORDER BY DESCRICAO';

   Result:=GetDataPacket(sSql);
end;



end.
