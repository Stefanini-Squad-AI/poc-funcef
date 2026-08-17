unit uCtrlTabelaDeParaCR;

interface

uses
   DB, uDataBase, uCmControlObject, dbclient, sysutils,
   Provider, ComCtrls, CMProcuraMask, CMProcura, DBTables,
   uDbTabelaDeParaCR, uDbCampoDeParaCR,
   {$IFNDEF VERSAO0505} uCMTypes {$ENDIF};

type
   TTipoOrdemLista = (ttpNome, ttpCodigo);

   TCtrlTabelaDeParaCR = Class(TCmControlObject)

   private

      dbTabelaDeParaCR  : TDbTabelaDeParaCR;
      dbCampoDeParaCR   : TDbCampoDeParaCR;

      FcdsMestre        : TClientDataSet;
      FcdsDetalhe       : TClientDataSet;

      procedure SetcdsMestre(const Value: TClientDataSet);
      procedure SetcdsDetalhe(const Value: TClientDataSet);


   protected

      procedure DoChangeDataBase; Override;
      procedure OnCreateAppServer;override;


   public

      constructor Create; override;
      destructor Destroy; override;

      property cdsMestre   : TClientDataSet  read FcdsMestre   write SetcdsMestre;
      property cdsDetalhe  : TClientDataSet  read FcdsDetalhe  write SetcdsDetalhe;

      function ListaTabelaDeParaCR(IDTabela: Double): OleVariant;

      function ListTabela: OleVariant;

      function Gravar: Boolean;
      function Apagar: Boolean;

   end;



implementation



constructor TCtrlTabelaDeParaCR.Create;
begin
   inherited;
   dbTabelaDeParaCR := TDbTabelaDeParaCR.Create(Self);
   dbCampoDeParaCR  := TDbCampoDeParaCR.Create(Self);
end;



destructor TCtrlTabelaDeParaCR.Destroy;
begin
   inherited;

   dbTabelaDeParaCR.Free;
   dbCampoDeParaCR.Free;

   if IsAppServer then
   begin
      FcdsMestre.Free;
      FcdsDetalhe.Free;
   end;
end;



function TCtrlTabelaDeParaCR.Gravar: Boolean;
var
   Msg : String;
begin
   if ConnectionSide = cnsClient then
   begin
      Result := Connection.AppServer.GravarTabelaDeParaCR(FcdsMestre.Data, FcdsDetalhe.Data);

      if not(Result) then MessageInfo := Connection.AppServer.MessageInfo;
   end
   else
   begin
      try
         StartTransaction;

         // Pai
         Result := ApplyCds(FcdsMestre, dbTabelaDeParaCR,[],[] );
         Msg    := dbTabelaDeParaCR.MessageInfo;
         if not(Result) then Raise Exception.Create(Msg);

         // Filhos
         Result := ApplyCds(FcdsDetalhe, dbCampoDeParaCR, [dbTabelaDeParaCR.IDTabeladeparaCR], [dbCampoDeParaCR.IDTabeladeparaCR]);
         Msg    := dbCampoDeParaCR.MessageInfo;
         if not(Result) then Raise Exception.Create(Msg);

         Commit;

      except
         on E:Exception Do
         begin
            Rollback;
            Result := False;
            MessageInfo := E.Message;
         end;
      end;
   end;
end;



procedure TCtrlTabelaDeParaCR.DoChangeDataBase;
begin
   inherited;

   dbTabelaDeParaCR.DataBaseName := DataBaseName;
   dbCampoDeParaCR.DataBaseName  := DataBaseName;
end;



procedure TCtrlTabelaDeParaCR.OnCreateAppServer;
begin
   inherited;

   FCdsMestre  := TClientDataSet.Create(nil);
   FCdsDetalhe := TClientDataSet.Create(nil);
end;



function TCtrlTabelaDeParaCR.ListaTabelaDeParaCR(IDTabela: Double): OleVariant;
var
   sSQL     : String;
begin
   sSQL :=
   'SELECT '                  + #13 +
   '   IDTABELADEPARACR, '    + #13 +
   '   NOMETABELA, '          + #13 +
   '   NOMECAMPODATA, '       + #13 +
   '   NOMECAMPOEMPRESA '     + #13 +
   'FROM '                    + #13 +
   '   TABELADEPARACR '       + #13;

   if IDTabela <> 0 then sSQL := sSQL  +
   'WHERE ' + #13 +
   '   IDTABELADEPARACR = ' + FormatFloat('#0', IDTabela);

   sSQL := sSQL +
   'ORDER BY ' + #13 +
   '   NOMETABELA ';

   Result := GetDataPacket(sSQL);
end;



procedure TCtrlTabelaDeParaCR.SetcdsDetalhe(const Value: TClientDataSet);
begin
   FcdsDetalhe := Value;
end;



procedure TCtrlTabelaDeParaCR.SetcdsMestre(const Value: TClientDataSet);
begin
   FcdsMestre := Value;
end;



function TCtrlTabelaDeParaCR.Apagar: Boolean;
var
   sMsg  : String;
begin
   if ConnectionSide = cnsClient then
   begin
      Result := Connection.AppServer.ApagarTabelaDeParaCR ( FcdsDetalhe.Data, FcdsMestre.Data );
      if not(Result) then MessageInfo := Connection.AppServer.MessageInfo;
   end
   else
   begin
      try
         StartTransaction;

         // itens Filhos
         Result := ApplyCds(FcdsDetalhe,dbCampoDeParaCR,[],[] );
         sMsg   := dbCampoDeParaCR.MessageInfo;
         if not(Result) then Raise Exception.Create(sMsg);

         // Pai
         Result := ApplyCds(FcdsMestre,dbTabelaDeParaCR,[],[] );
         sMsg   := dbTabelaDeParaCR.MessageInfo;
         if not(Result) then Raise Exception.Create(sMsg);

         Commit;

      except
         on E:Exception Do
         begin
            Rollback;
            Result := False;
            MessageInfo := E.Message;
         end;
      end;
   end;
end;



function TCtrlTabelaDeParaCR.ListTabela: OleVariant;
var
   sSQL : String;
begin
   sSQL   := 'SELECT TABLE_NAME FROM ALL_TABLES WHERE OWNER = ''CM'' ';
   Result := GetDataPacket(sSQL);
end;



end.
