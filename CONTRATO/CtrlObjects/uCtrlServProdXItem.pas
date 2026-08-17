unit uCtrlServProdXItem;
//***************************************************************************************
//Rotina             : ListServComItem
//N. SIG..........   : 23656.58467
//Data da Alteração: : 14/11/2017
//Alteração Form:    : uCtrlServProdXItem
//Responsável:       : Cássio Rovaroto
//Descrição.......   : Inclusão do campo FLGMAODEOBRA no SQL que recupera os Produtos/Serviços
//***************************************************************************************
{
-----------------------------------------------------------------------------
Nº SOL......: 172384/9603
Nº KINTANA..: 1661662
Data........: 25/06/2012
Responsável.: Vander Campos
Descrição...: - Integração com o Planejamento Orçamentário
-----------------------------------------------------------------------------
}

interface

uses sysutils, uCmControlObject, uCmDbObject, uSistema, DB, uDataBase, DbClient,
     uCMClientDataSet, uCMTypes, uDbObjetoXItem;

type
   TCtrlServProdxItem = Class(TCmControlObject)

   private
      FDbObjetoXItem   : TDbObjetoxItem;
      FCdsObjetoXItem  : TCMClientDataSet;
   public
      property CdsObjetoxItem: TCMClientDataSet read FCdsObjetoXItem write FCdsObjetoXItem;

      constructor Create; override;
      destructor Destroy; override;


      function AplicaServProdxItem: Boolean;
      function ListServProdXItem (rIDPessoa, rIDObjeto, rIDItem: Double): OleVariant;
      function ListServComItem   (rIDPessoa: Double): OleVariant;

      procedure OnCreateAppServer; override;
   protected
      procedure DoChangeDataBase; override;
      procedure AfterInitialize; override;
   end;

implementation

{ TCtrlProdxItem }

constructor TCtrlServProdxItem.Create;
begin
   inherited;
   FDbObjetoXItem:=TDbObjetoXItem.Create(Self);
end;

procedure TCtrlServProdxItem.OnCreateAppServer;
begin
   inherited;
   FCdsObjetoXItem:=TCMClientDataSet.Create(nil);
end;

procedure TCtrlServProdxItem.AfterInitialize;
begin
   inherited;

end;

destructor TCtrlServProdxItem.Destroy;
begin
   inherited;
   if IsAppServer then FCdsObjetoXItem.Free;
end;

procedure TCtrlServProdxItem.DoChangeDataBase;
begin
   inherited;
   FDbObjetoXItem.DataBaseName:=DataBaseName;
end;

function TCtrlServProdxItem.AplicaServProdxItem: Boolean;
begin
   MessageInfo:='';
   if ConnectionSide = cnsClient then
    begin
       Result := Connection.AppServer.AplicaServProdxItem(FCdsObjetoXItem.Data);
       if not Result then MessageInfo := Connection.AppServer.MessageInfo;
    end
   else
    begin
       StartTransaction;
       try
          Result:=ApplyCds(FCdsObjetoXItem,FDbObjetoXItem,[],[]);
          if not(Result) then
           begin
              MessageInfo:=FDbObjetoXItem.MessageInfo;
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

function TCtrlServProdxItem.ListServProdXItem(rIDPessoa,rIDObjeto,rIDItem: Double): OleVariant;
var sSql : String;
begin
   sSql:='SELECT O.NOMEOBJETO, I.NOME_ITEM , R.DESCRICAO AS DESC_TIPRECDES, OXI.* '+
         'FROM OBJETOXITEM OXI, OBJETOCONTRATUAL O, ITEMCONTRATUAL I, TIPORECEBDESEMB R '+
         'WHERE (OXI.IDPESSOA = '+FloatToStr(rIDPessoa)+') AND '+
         '      (OXI.IDOBJETO = O.IDOBJETO) AND '+
         '      (OXI.IDITEM = I.IDITEM) AND '+
         '      (OXI.CODTIPRECDES = R.CODTIPRECDES(+)) AND '+
         '      (OXI.RECPAG = R.RECPAG(+)) ';
   if (rIDObjeto <> 0) then
       sSql := sSql + ' AND (OXI.IDOBJETO = '+FloatToStr(rIDObjeto)+') ';
   if (rIDItem <> 0) then
       sSql := sSql + ' AND (OXI.IDITEM = '+FloatToStr(rIDItem)+') ';
   Result := GetDataPacket(sSql);
end;

function TCtrlServProdxItem.ListServComItem(rIDPessoa: Double): OleVariant;
var sSql, sParam : String;
begin
   // Define Parametros
   sParam := ' AND OXI.IDPESSOA = ' + FloatToStr(rIdPessoa) +#13;


   // Define Sql
   // Vander Campos - SOL: 172384/9603 - KINTANA: 1661662
   // Incluso -> OXI.CODTIPRECDES, NVL(R.Flgobrigareserva, ''N'') Flgobrigareserva
   //            Tiporecebdesemb R
   //            and OXI.IDPESSOA     = R.IDPESSOA
   //            and OXI.RECPAG       = R.RECPAG
   //            and OXI.CODTIPRECDES = R.CODTIPRECDES(+)
   //
   sSql := 'SELECT DISTINCT O.IDOBJETO, O.NOMEOBJETO, '+#13+
           '  OXI.CODTIPRECDES, NVL(R.Flgobrigareserva, ''N'') Flgobrigareserva ' + #13 +
           '  , O.TIPOOBJETO ' + #13 + //Cássio Rovaroto -  SIG nº 23656.58467
           '  FROM OBJETOXITEM OXI, OBJETOCONTRATUAL O, Tiporecebdesemb R '+#13+
           ' WHERE OXI.IDOBJETO = O.IDOBJETO '+ #13 +
           '   and OXI.IDPESSOA = R.IDPESSOA '+ #13 +
           '   and OXI.RECPAG   = R.RECPAG '  + #13 +
           '   and OXI.CODTIPRECDES = R.CODTIPRECDES(+) ' + #13 + sParam +
           ' ORDER BY O.NOMEOBJETO ';

   Result := GetDataPacket(sSql);
end;


end.
