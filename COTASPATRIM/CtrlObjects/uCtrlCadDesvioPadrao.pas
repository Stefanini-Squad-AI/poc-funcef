{ --------------------------------------------------------------------------------------------------
Data      : 30/08/2006
Autor     : Marcus Santos Oliveira
Pendencia : 23203
Descrição : CTRL do Cadastro de Desvio Padrão
---------------------------------------------------------------------------------------------------}
unit uCtrlCadDesvioPadrao;

interface

uses sysutils, uCmControlObject, uCmDbObject, DB, uDataBase, DbClient,
     udbCpAtivo, uCMClientDataSet, UCMTypes,
     Dialogs, uCtrlPadroes, udbCpDesvio;

type
   TCtrlCadDesvioPadrao = Class(TCmControlObject)
   private

     _dbCpDesvioPadrao: TDbCpdesvio;

   public
     _Cds: TCMClientDataSet;
     _CdsCarrega: TCMClientDataSet;

      Function GravaDadosDesvio: Boolean;
      constructor Create; override;
      destructor Destroy; override;
      procedure OnCreateAppServer; override;
   protected
      procedure DoChangeDataBase; override;
   end;


implementation

constructor TCtrlCadDesvioPadrao.Create;
begin
  inherited;
    _dbCpDesvioPadrao:= TDbCpdesvio.Create(self);
    _Cds:= TCMClientDataSet.Create(nil);
    _CdsCarrega:= TCMClientDataSet.Create(nil);
end;

destructor TCtrlCadDesvioPadrao.Destroy;
begin
    _dbCpDesvioPadrao.Free;

  if IsAppServer then
     _Cds.Free;
     _CdsCarrega.Free;
  inherited;
end;

procedure TCtrlCadDesvioPadrao.DoChangeDataBase;
begin
  inherited;
  _dbCpDesvioPadrao.DataBaseName := databasename;

end;

procedure TCtrlCadDesvioPadrao.OnCreateAppServer;
begin
  inherited;

end;

function TCtrlCadDesvioPadrao.GravaDadosDesvio: Boolean;
begin
   MessageInfo:='';
   if ConnectionSide = cnsClient then
    begin
       Result:=Connection.AppServer.GravaDadosDesvio;
       if not Result then MessageInfo:=Connection.AppServer.MessageInfo;
    end
   else
    begin
       try
          StartTransaction;
          Result:=ApplyCds(_Cds, _dbCpDesvioPadrao, [],[]);

          if not(Result) then
              Raise Exception.Create(_dbCpDesvioPadrao.MessageInfo);

           Commit;
           Result:= True;
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


end.
