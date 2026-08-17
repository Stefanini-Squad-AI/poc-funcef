unit uCtrlContratos;

interface

uses sysutils, uCmControlObject, uCmDbObject, uSistema, DB, uDataBase, DbClient,
     uCMClientDataSet {$IFNDEF VERSAO0505} ,uCMTypes {$ENDIF};
type
   TCtrlContratos = Class(TCmControlObject)

   private
      F_rIDPessoa  : Double;
   public
      constructor Create(rIDPessoa: Double); reintroduce;
      destructor Destroy; override;

      function ListContratos(rIDContrato: Double): OleVariant;
      function ListContratosxUsuario(rIDContrato, rIDUsuario: Double): OleVariant;

      procedure OnCreateAppServer; override;
   protected
      procedure DoChangeDataBase; override;
   end;

implementation

{ TCtrlContratos }

constructor TCtrlContratos.Create(rIDPessoa: Double);
begin
   F_rIDPessoa:=rIDPessoa;
   inherited Create;
end;

destructor TCtrlContratos.Destroy;
begin
  inherited;

end;

procedure TCtrlContratos.DoChangeDataBase;
begin
  inherited;

end;

procedure TCtrlContratos.OnCreateAppServer;
begin
  inherited;

end;

function TCtrlContratos.ListContratos(rIDContrato: Double): OleVariant;
var
   sSql: String;
begin
   sSql:='SELECT * '+
         'FROM '+
         '   CONTRATOCONTR C '+
         'WHERE '+
         '   (C.IDPESSOA = '+FloatToStr(F_rIDPessoa)+') ';

   if (rIDContrato<>0) then
      sSql:=sSql+'   AND (C.IDCONTRATO = '+FloatToStr(rIDContrato)+') ';

   sSql:=sSql+'ORDER BY NOMECONTRATO ';
   Result:=GetDataPacket(sSql);
end;

function TCtrlContratos.ListContratosxUsuario(rIDContrato, rIDUsuario: Double): OleVariant;
var
   sSql   : String;
begin
   sSql:='SELECT * '+
         'FROM '+
         '   CONTRATOCONTR C '+
         'WHERE '+
         '   (C.IDPESSOA = '+FloatToStr(F_rIDPessoa)+') ';

   if (rIDContrato<>0) then
      sSql:=sSql+'   AND (C.IDCONTRATO = '+FloatToStr(rIDContrato)+') ';

   if (rIDUsuario<>0) then
      sSql:=sSql+'   AND (C.IDCONTRATO IN (SELECT IDCONTRATO FROM CONTRATOUSUARIO '+
                                          'WHERE (IDUSUARIO = '+FloatToStr(rIDUsuario)+'))) ';

   sSql:=sSql+'ORDER BY C.NOMECONTRATO ';

   Result:=GetDataPacket(sSql);
end;

end.
 