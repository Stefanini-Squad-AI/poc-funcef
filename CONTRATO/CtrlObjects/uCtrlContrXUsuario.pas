{-------------------------------------------------------------------------------
ALTERAÇÕES / IMPLEMENTAÇÕES ----------------------------------------------------
{ ------------------------------------------------------------------------------
N. WO...........: WO7622
Data............: 02/02/2024
Responsável.....: Helen V Bianchi
Descrição.......: Criação da funcionalidade Cadastro -> Contrato x Usuários.
--------------------------------------------------------------------------------
}
unit uCtrlContrXUsuario;

interface

uses sysutils, uCmControlObject, uCmDbObject, uSistema, DB, uDataBase, DbClient,
     uCMClientDataSet,uCMTypes, uDbContratoUsuario;

type
   TCtrlContrXUsuario = Class(TCmControlObject)

   private
      FDbContrXUsuario  : TDbContratoUsuario;
      FCdsContrXUsuario : TCMClientDataSet;
   public
      property CdsContrXUsuario: TCMClientDataSet read FCdsContrXUsuario  write FCdsContrXUsuario;

      constructor Create; override;
      destructor Destroy; override;

      procedure OnCreateAppServer; override;
      function AplicaAtualContrXUsuario: Boolean;
      function ListUsuariosxContrato(rIDContrato: Double; bSoFaltantes: Boolean): OleVariant;
    

   protected
      procedure DoChangeDataBase; override;
      procedure AfterInitialize;  override;
   end;

implementation

{ TCtrlContrXUsuario }

constructor TCtrlContrXUsuario.Create;
begin
   inherited;
   FDbContrXUsuario:=TDbContratousuario.Create(Self);
end;

procedure TCtrlContrXUsuario.OnCreateAppServer;
begin
   inherited;
   FCdsContrXUsuario:=TCMClientDataSet.Create(nil);
end;

procedure TCtrlContrXUsuario.AfterInitialize;
begin
   inherited;
end;

destructor TCtrlContrXUsuario.Destroy;
begin
   inherited;
   FDbContrXUsuario.Free;
   if IsAppServer then FCdsContrXUsuario.Free;
end;

procedure TCtrlContrXUsuario.DoChangeDataBase;
begin
   inherited;
   FDbContrXUsuario.DataBaseName:=DataBaseName;
end;

function TCtrlContrXUsuario.ListUsuariosxContrato(rIDContrato: Double; bSoFaltantes: Boolean): OleVariant;
var
   sSql   : String;
begin
   if (bSoFaltantes) then
   begin
       sSql:=
       ' SELECT ' +  FloatToStr(rIDContrato)+' AS IDCONTRATO '+ '  , U.IDUSUARIO , U.NOMEUSUARIO, P.NOME'+
       ' FROM USUARIOSISTEMA U , PESSOA P                               '+
       ' WHERE U.BLOQUEADO = ''N''                                      '+
       '  AND U.IDUSUARIO = P.IDPESSOA                                  '+
       '  AND (SELECT COUNT(1) FROM CONTRATOUSUARIO C                   '+
       '       WHERE C.IDUSUARIO = U.IDUSUARIO                          '+
       '         AND C.IDCONTRATO = ' +FloatToStr(rIDContrato)  + ') = 0'+
       '   ORDER BY U.NOMEUSUARIO '                       ;
   end
   else
       sSql:=
         ' SELECT C.IDCONTRATO,   C.IDUSUARIO,    U.NOMEUSUARIO , P.NOME'+
         ' FROM CONTRATOUSUARIO C, CONTRATOCONTR CC, USUARIOSISTEMA U,PESSOA P '+
         ' WHERE 1=1                                     '+
         ' AND C.IDCONTRATO = CC.IDCONTRATO              '+
         ' AND (CC.IDPESSOA = 1)                         '+
         ' AND U.IDUSUARIO = C.IDUSUARIO                 '+
         '  AND U.IDUSUARIO = P.IDPESSOA                 '+
         ' AND C.IDCONTRATO = ' +FloatToStr(rIDContrato)  +
         ' ORDER BY U.NOMEUSUARIO '                       ;
   Result:=GetDataPacket(sSql);
end;
function TCtrlContrXUsuario.AplicaAtualContrXUsuario: Boolean;
begin
   MessageInfo := '';
   if ConnectionSide = cnsClient then
    begin
       Result := Connection.AppServer.AplicaAtualContrXUsuario(FCdsContrXUsuario.Data);
       if not Result then MessageInfo := Connection.AppServer.MessageInfo;
    end
   else
    begin
       StartTransaction;
       try
          Result:=ApplyCds(FCdsContrXUsuario,FDbContrXUsuario,[],[]);
          if not(Result) then
           begin
              MessageInfo:=FDbContrXUsuario.MessageInfo;
              Rollback;
           end
          else
           Commit;
       except
          on E:Exception do
          begin
             Result:=False;
             MessageInfo := E.Message;
             Rollback;
          end;
       end;
    end;
end;


end.
