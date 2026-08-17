{-------------------------------------------------------------------------------
----------------------- ALTERAÇÕES / IMPLEMENTAÇÕES ----------------------------
--------------------------------------------------------------------------------
N. Solicitação.....: WO3701
Data da Alteração..: 09/10/2023
Responsável........: Everson Cunha
Descrição..........: Inclusão do campo FLAGATIVO.
--------------------------------------------------------------------------------
N. SIG.............: 130640
Data da Alteração..: 29/11/2022
Responsável........: Everson Cunha
Descrição..........: Ajuste/melhoria para não apresentar item sem parcelas
--------------------------------------------------------------------------------}

unit uCtrlItemContratual;

interface

uses sysutils, uCmControlObject, uCmDbObject, uSistema, DB, uDataBase, DbClient,
     uCMClientDataSet,uCMTypes, uDbItemContratual;

type
   TCtrlItemContratual = Class(TCmControlObject)

   private
    FDbItemContratual   : TDbItemContratual;
    FCdsItemContratual  : TCMClientDataSet;
   public
      property CdsItemContratual: TCMClientDataSet read FCdsItemContratual  write FCdsItemContratual;

      constructor Create; override;
      destructor Destroy; override;

      procedure OnCreateAppServer; override;
      function AplicaAtualItem: Boolean;
      function ListItemContratual(rIDPessoa, rIDItem: Double): OleVariant;
      function ListItemContratualNaoRelObjeto(rIDPessoa, rIDObjeto, rIDItem: Double): OleVariant;
      function ListItemXContrato(rIDPessoa, rIDContrato: Double): OleVariant;
   protected
      procedure DoChangeDataBase; override;
      procedure AfterInitialize; override;
   end;

implementation

{ TCtrlItemContratual }

constructor TCtrlItemContratual.Create;
begin
   inherited;
   FDbItemContratual:=TDbItemContratual.Create(Self);
end;

procedure TCtrlItemContratual.OnCreateAppServer;
begin
   inherited;
   FCdsItemContratual:=TCMClientDataSet.Create(nil);
end;

destructor TCtrlItemContratual.Destroy;
begin
   inherited;
   FDbItemContratual.Free;
   if IsAppServer then FCdsItemContratual.Free;
end;

procedure TCtrlItemContratual.DoChangeDataBase;
begin
   inherited;
   FDbItemContratual.DataBaseName:=DataBaseName;
end;

procedure TCtrlItemContratual.AfterInitialize;
begin
   inherited;
end;

function TCtrlItemContratual.AplicaAtualItem: Boolean;
begin
   MessageInfo:='';
   if ConnectionSide = cnsClient then
    begin
       Result := Connection.AppServer.AplicaAtualItem(FCdsItemContratual.Data);
       if not Result then MessageInfo := Connection.AppServer.MessageInfo;
    end
   else
    begin
       StartTransaction;
       try
          Result:=ApplyCds(FCdsItemContratual,FDbItemContratual,[],[]);
          if not(Result) then
           begin
              MessageInfo:=FDbItemContratual.MessageInfo;
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

function TCtrlItemContratual.ListItemContratual(rIDPessoa,
  rIDItem: Double): OleVariant;
var
   sSql : String;
begin
   sSql:='SELECT * '+
         'FROM ITEMCONTRATUAL '+
         'WHERE (IDPESSOA = '+FloatToStr(rIDPessoa)+') ';
   if (rIDItem<>0) then
       sSql:=sSql+'      AND (IDITEM = '+FloatToStr(rIDItem)+') ';
   Result:=GetDataPacket(sSql);
end;

function TCtrlItemContratual.ListItemContratualNaoRelObjeto(rIDPessoa,
  rIDObjeto, rIDItem: Double): OleVariant;
var
   sSql : String;
begin
   sSql:='SELECT I.* '+#13+
         'FROM ITEMCONTRATUAL I '+#13+
         'WHERE (I.IDPESSOA = '+FloatToStr(rIDPessoa)+') AND '+#13+
         '      (NOT EXISTS(SELECT * FROM OBJETOXITEM OXI '+#13+
                           'WHERE (OXI.IDPESSOA = '+FloatToStr(rIDPessoa)+') AND '+#13+
                           '      (OXI.IDOBJETO = '+FloatToStr(rIDObjeto)+') AND '+#13+
                           '      (OXI.IDITEM = I.IDITEM)) OR '+#13+
                           '      (I.IDITEM = '+FloatToStr(rIDItem)+'))' +#13+
         'ORDER BY NOME_ITEM';
   Result:=GetDataPacket(sSql);
end;

function TCtrlItemContratual.ListItemXContrato(rIDPessoa,
  rIDContrato: Double): OleVariant;
var
   sSql : String;
begin
   sSql:='SELECT '+
         '   I.IDITEM, '+
         '   I.IDPESSOA, '+
         '   I.NOME_ITEM, '+
         '   I.TIPOCOBRANCA '+
         'FROM '+
         '   ITEMCONTRATUAL I, '+
         '   OBJETOSXITEMCONTR O '+
         'WHERE '+
         '   (I.IDPESSOA = '+FloatToStr(rIDPessoa)+') AND '+
         '   (O.IDCONTRATO = '+FloatToStr(rIDContrato)+') AND '+
         '   (I.TIPOCOBRANCA IN (''PQ'',''PV'',''EQ'',''EV'')) AND '+
         '   (I.IDITEM = O.IDITEM) AND '+
         '   (NVL(O.NUMPARCELAS, 0) <> 0) '+ //Everson Cunha - SIG130640
         '   AND (NVL(O.FLGATIVO, ''S'') = ''S'') '+ //Everson Cunha - WO3701
         'ORDER BY NOME_ITEM ';
   Result:=GetDataPacket(sSql);
end;

end.
