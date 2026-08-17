unit uCtrlParamCotasPatrim;
{ --------------------------------------------------------------------------------------------------
Data      : 18/08/2006
Autor     : Marcus Santos Oliveira
Pendencia : Falta Cadastrar pendencia
Descrição : CTRL do Cadastro de Tipo de Entrada.
---------------------------------------------------------------------------------------------------}

interface

uses sysutils, uCmControlObject, uCmDbObject, DB, uDataBase, DbClient,
     udbCpAtivo, uCMClientDataSet, UCMTypes, Dialogs, usistema, udbParamCotaPatrim;

type
   TCtrlParamCotasPatrim = Class(TCmControlObject)
   private

     _dbParamCotaPatrim: TdbParamCotaPatrim;

   public
      cds : TCMClientDataSet;


      function CarregaParamSistema(iIdPessoa: integer): OleVariant;
      Function GravaParam: Boolean;
      constructor Create; override;
      destructor Destroy; override;

      function GruposRegra : OLEVariant;
   protected
      procedure DoChangeDataBase; override;
   end;

implementation

constructor TCtrlParamCotasPatrim.Create;
begin
  inherited;
  _dbParamCotaPatrim:= TdbParamCotaPatrim.Create(self);
  Cds:= TCMClientDataSet.Create(nil);
end;

destructor TCtrlParamCotasPatrim.Destroy;
begin
  _dbParamCotaPatrim.Free;
  if IsAppServer then
    Cds.Free;
  inherited;
end;

procedure TCtrlParamCotasPatrim.DoChangeDataBase;
begin
  inherited;
  _dbParamCotaPatrim.DataBaseName := databasename;
end;


function TCtrlParamCotasPatrim.GravaParam: Boolean;
begin
   MessageInfo:='';
   if ConnectionSide = cnsClient then
    begin
       Result:=Connection.AppServer.GravaCota;
       if not Result then MessageInfo:=Connection.AppServer.MessageInfo;
    end
   else
    begin
       try
          StartTransaction;
          Result:=ApplyCds( cds, _dbParamCotaPatrim, [],[]);
          if not(Result) then
            Raise Exception.Create(_dbParamCotaPatrim.MessageInfo);
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

function TCtrlParamCotasPatrim.CarregaParamSistema( iIdPessoa: integer): OleVariant;
begin
  Result := GetDataPacket('SELECT * FROM PARAMCOTAPATRIM WHERE IDEMPRESA = ' + IntToStr(iIdPessoa));
end;

function TCtrlParamCotasPatrim.GruposRegra: OLEVariant;
begin
  Result := GetDatapacket( ' select * from gruporegra ' );
end;

end.
