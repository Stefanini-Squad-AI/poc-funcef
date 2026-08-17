unit uCtrlTabelaDeParaCC;

interface

uses
   DB, uDataBase, uCmControlObject, dbclient, sysutils,
   Provider, ComCtrls, CMProcuraMask, CMProcura, DBTables,
   uDbTabelaDeParaCC, uDbCampoDeParaCC,
   {$IFNDEF VERSAO0505} uCMTypes {$ENDIF};

type
   TTipoOrdemLista = (ttpNome, ttpCodigo);

   TCtrlTabelaDeParaCC = Class(TCmControlObject)

   private

      dbTabelaDeParaCC  : TDbTabelaDeParaCC;
      dbCampoDeParaCC   : TDbCampoDeParaCC;

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

      function ListaTabelaDeParaCC(IDTabela: Double): OleVariant;

      function ListTabela: OleVariant;

      function Gravar: Boolean;
      function Apagar: Boolean;

   end;



implementation



constructor TCtrlTabelaDeParaCC.Create;
begin
   inherited;
   dbTabelaDeParaCC := TDbTabelaDeParaCC.Create(Self);
   dbCampoDeParaCC  := TDbCampoDeParaCC.Create(Self);
end;



destructor TCtrlTabelaDeParaCC.Destroy;
begin
   inherited;

   dbTabelaDeParaCC.Free;
   dbCampoDeParaCC.Free;

   if IsAppServer then
   begin
      FcdsMestre.Free;
      FcdsDetalhe.Free;
   end;
end;



function TCtrlTabelaDeParaCC.Gravar: Boolean;
var
   Msg : String;
begin
   if ConnectionSide = cnsClient then
   begin
      Result := Connection.AppServer.GravarTabelaDeParaCC(FcdsMestre.Data, FcdsDetalhe.Data);

      if not(Result) then MessageInfo := Connection.AppServer.MessageInfo;
   end
   else
   begin
      try
         StartTransaction;

         // Pai
         Result := ApplyCds(FcdsMestre, dbTabelaDeParaCC,[],[] );
         Msg    := dbTabelaDeParaCC.MessageInfo;
         if not(Result) then Raise Exception.Create(Msg);

         // Filhos
         Result := ApplyCds(FcdsDetalhe, dbCampoDeParaCC, [dbTabelaDeParaCC.IDTabeladeparaCC], [dbCampoDeParaCC.IDTabeladeparaCC]);
         Msg    := dbCampoDeParaCC.MessageInfo;
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



procedure TCtrlTabelaDeParaCC.DoChangeDataBase;
begin
   inherited;

   dbTabelaDeParaCC.DataBaseName := DataBaseName;
   dbCampoDeParaCC.DataBaseName  := DataBaseName;
end;



procedure TCtrlTabelaDeParaCC.OnCreateAppServer;
begin
   inherited;

   FCdsMestre  := TClientDataSet.Create(nil);
   FCdsDetalhe := TClientDataSet.Create(nil);
end;



function TCtrlTabelaDeParaCC.ListaTabelaDeParaCC(IDTabela: Double): OleVariant;
var
   sSQL     : String;
begin
   sSQL :=
   'SELECT '                  + #13 +
   '   IDTABELADEPARACC, '    + #13 +
   '   NOMETABELA, '          + #13 +
   '   NOMECAMPODATA, '       + #13 +
   '   NOMECAMPOEMPRESA '     + #13 +
   'FROM '                    + #13 +
   '   TABELADEPARACC '       + #13;

   if IDTabela <> 0 then sSQL := sSQL  +
   'WHERE ' + #13 +
   '   IDTABELADEPARACC = ' + FormatFloat('#0', IDTabela);

   sSQL := sSQL +
   'ORDER BY ' + #13 +
   '   NOMETABELA ';

   Result := GetDataPacket(sSQL);
end;



procedure TCtrlTabelaDeParaCC.SetcdsDetalhe(const Value: TClientDataSet);
begin
   FcdsDetalhe := Value;
end;



procedure TCtrlTabelaDeParaCC.SetcdsMestre(const Value: TClientDataSet);
begin
   FcdsMestre := Value;
end;



function TCtrlTabelaDeParaCC.Apagar: Boolean;
var
   sMsg  : String;
begin
   if ConnectionSide = cnsClient then
   begin
      Result := Connection.AppServer.ApagarTabelaDeParaCC ( FcdsDetalhe.Data, FcdsMestre.Data );
      if not(Result) then MessageInfo := Connection.AppServer.MessageInfo;
   end
   else
   begin
      try
         StartTransaction;

         // itens Filhos
         Result := ApplyCds(FcdsDetalhe,dbCampoDeParaCC,[],[] );
         sMsg   := dbCampoDeParaCC.MessageInfo;
         if not(Result) then Raise Exception.Create(sMsg);

         // Pai
         Result := ApplyCds(FcdsMestre,dbTabelaDeParaCC,[],[] );
         sMsg   := dbTabelaDeParaCC.MessageInfo;
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



function TCtrlTabelaDeParaCC.ListTabela: OleVariant;
var
   sSQL : String;
begin
   sSQL   := 'SELECT TABLE_NAME FROM ALL_TABLES WHERE OWNER = ''CM'' ';
   Result := GetDataPacket(sSQL);
end;



end.
