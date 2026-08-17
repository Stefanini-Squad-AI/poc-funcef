unit uCtrlAplicFinanc;

interface

uses sysutils, uCmControlObject, uCmDbObject, uDbHistPadrao, uSistema, DB, uDataBase, DbClient,
     uDbAplicacoes, uCMClientDataSet;

type
   TCtrlAplicFinanc = Class(TCmControlObject)

   private

      FDbAplicacoes  : TDbAplicacoes;
      FCdsAplicacoes : TCMClientDataSet;


   public

      property CdsAplicacoes: TCMClientDataSet read FCdsAplicacoes write FCdsAplicacoes;

      constructor Create; override;
      destructor Destroy; override;

      function ListAplicacoes(rCodLancAplic: Double): OleVariant;

      procedure OnCreateAppServer; override;


   protected

      procedure DoChangeDataBase; override;


   end;




implementation
{ TCtrlAplicFinanc }




constructor TCtrlAplicFinanc.Create;
begin
   inherited;
   FDbAplicacoes:=TDbAplicacoes.Create(Self);
end;



destructor TCtrlAplicFinanc.Destroy;
begin
   FDbAplicacoes.Free;
   if IsAppServer then FCdsAplicacoes.Free;
   inherited;
end;



procedure TCtrlAplicFinanc.OnCreateAppServer;
begin
   inherited;
   FCdsAplicacoes:=TCMClientDataSet.Create(nil);
end;



procedure TCtrlAplicFinanc.DoChangeDataBase;
begin
   inherited;
end;



function TCtrlAplicFinanc.ListAplicacoes(rCodLancAplic: Double): OleVariant;
begin
   Result:=GetDataPacket('SELECT * '+
                         'FROM APLICACOES '+
                         'WHERE (CODLANCAPLIC='+FloatToStr(rCodLancAplic)+')');
end;



end.
