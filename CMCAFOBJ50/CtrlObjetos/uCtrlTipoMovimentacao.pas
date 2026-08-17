unit uCtrlTipoMovimentacao;
// *****************************************************************************
// ***************************** REGISTRO DE ALTERAÇÕES ************************
// *****************************************************************************
{ -------------------------------------------------------------------------------------
Rotina......: -
Nº SOL......: 142550
Nº KINTANA..: 911790
Data........: 29/09/2010
Responsável.: Helen V. Bianchi
Descrição...: Adicionado a Função ListaAcrescDecresc
--------------------------------------------------------------------------------------}
//-------------------------------------------------------------------------------------


interface

Uses DB, uCmDbObject, uCmControlObject, uMidasUtil, uCMTypes,
     SysUtils, dbclient, Provider, uDBTipoMovimentacao;

Type
   TCtrlTipoMovimentacao = class(TCmControlObject)
   Protected
      procedure DoChangeDataBase; Override;
      procedure OnCreateAppServer; Override;

   Private
      //----------------------------------------------------------------------------------
      // Classes de Persistência
      //----------------------------------------------------------------------------------
      _dbTipoMovimentacao : TDbTipoMovimentacao;

      Fcds: TClientDataSet;
      procedure Setcds(const Value: TClientDataSet);

   Public
      property cds : TClientDataSet read Fcds write Setcds;
      //----------------------------------------------------------------------------------
      // Métodos
      //----------------------------------------------------------------------------------
      constructor Create;  Override;
      destructor  Destroy; Override;
      //----------------------------------------------------------------------------------
      // Metodos de Persistencia
      //----------------------------------------------------------------------------------
      function AplicaOperacao : Boolean;
      function Procurar(nIdTipoMovimentacao : Extended) : OleVariant;
      function ListaTipoMovimentacao(sLancContab : String = '') : OleVariant;
      //Helen - SOL Nº142550 KINTANA Nº 911790
      function ListaAcrescDecresc( sClausula : String) : OleVariant;
   end;

implementation

{ TCtrlTipoMovimentacao }

function TCtrlTipoMovimentacao.AplicaOperacao: Boolean;
Var
   sMensagem : String;
begin
   if ConnectionSide = cnsClient then
   begin
      Result := Connection.AppServer.AplicaOperacaoTipoMovimentacao( Fcds.Data );
      if not Result then
         MessageInfo := Connection.AppServer.MessageInfo;
   end else
   begin
      try
         StartTransaction;

         Result := ApplyCds(Fcds,_dbTipoMovimentacao,[],[]);
         sMensagem := _dbTipoMovimentacao.MessageInfo;

         if not Result then
            Raise Exception.Create(sMensagem);

         Commit;
      except
         On E : Exception Do
         begin
            Rollback;
            Result := False;
            MessageInfo := E.Message;
         end;
      end;
   end;
end;

procedure TCtrlTipoMovimentacao.OnCreateAppServer;
begin
   inherited;
   fCds := TClientDataSet.Create(nil);
end;

constructor TCtrlTipoMovimentacao.Create;
begin
   inherited;
   _dbTipoMovimentacao := TDbTipoMovimentacao.Create(Self);
end;

destructor TCtrlTipoMovimentacao.Destroy;
begin
   if IsAppServer then
      FreeCDS([fCds]);

   _dbTipoMovimentacao.Free;

   inherited;
end;

procedure TCtrlTipoMovimentacao.DoChangeDataBase;
begin
   inherited;
   _dbTipoMovimentacao.DataBaseName := DataBaseName;
end;

function TCtrlTipoMovimentacao.Procurar(nIdTipoMovimentacao: Extended): OleVariant;
begin
   _dbTipoMovimentacao.IDTipoMovimentacao.AsFloat := nIdTipoMovimentacao;
   Result := GetDataPacket(_dbTipoMovimentacao.sSQLSelect);
end;

function TCtrlTipoMovimentacao.ListaTipoMovimentacao(sLancContab : String): OleVariant;
var
   sSql : String;
begin
   sSql := ' SELECT IDTIPOMOVIMENTACAO, DESCTIPOMOVIMENTACAO, LANCAMENTO ' + #13 +
           ' FROM TIPOMOVIMENTACAO ' + #13 ;
   //-------------------------------------------------------------------------------------
   if sLancContab <> '' then
      sSql := sSql + ' WHERE (LANCAMENTO = ' + #39 + sLancContab + #39 + ') ' + #13;
   //-------------------------------------------------------------------------------------
   sSql := sSql + ' ORDER BY DESCTIPOMOVIMENTACAO ';
   Result := GetDataPacket(sSql);
end;

procedure TCtrlTipoMovimentacao.Setcds(const Value: TClientDataSet);
begin
   Fcds := Value;
end;

function TCtrlTipoMovimentacao.ListaAcrescDecresc(sClausula: String): OleVariant;
var
   sSql : String;
begin
   //Helen - SOL Nº142550 KINTANA Nº 911790

   sSql := ' SELECT IDTIPOMOVIMENTACAO, DESCTIPOMOVIMENTACAO, LANCAMENTO ' + #13 +
           ' FROM TIPOMOVIMENTACAO ' + #13 ;
   //-------------------------------------------------------------------------------------
   if sClausula <> '' then
      sSql := sSql + ' WHERE ( ' +  sClausula +  ') ' + #13;
   //-------------------------------------------------------------------------------------
   sSql := sSql + ' ORDER BY DESCTIPOMOVIMENTACAO ';
   Result := GetDataPacket(sSql);
end;

end.
