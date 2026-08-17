unit uCtrlTipoDespesaAV;
// *****************************************************************************
// ***************************** REGISTRO DE ALTERAÇÕES ************************
// *****************************************************************************
{ ----------------------------------------------------------------------------------
Rotina......: ListaTipoDespesaAV ,ListaTipoDespesaAVParam
Nº SOL......: 142550
Nº KINTANA..: 911790
Data........: 29/09/2010
Responsável.: Helen V. Bianchi
Descrição...: Adicionado a Função ListaTipoDespesaAV ,ListaTipoDespesaAVParam
------------------------------------------------------------------------------------}
//----------------------------------------------------------------------------------

interface

Uses DB, uCmDbObject, uCmControlObject, uCMTypes,
     SysUtils, dbclient, Provider, uDBTipoDespesaAV;

Type
   TCtrlTipoDespesaAV = class(TCmControlObject)
   Protected
      procedure DoChangeDataBase; Override;

   Private
      //----------------------------------------------------------------------------------
      // Classes de Persistência
      //----------------------------------------------------------------------------------
      _dbTipoDespesaAV : TDbTipoDespesaAV;

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
      function Procurar(nIdTipoDespesa : Extended) : OleVariant;
      //Helen - SOL Nº142550 KINTANA Nº 911790
      function ListaTipoDespesaAV(sClausula : String ) : OleVariant;
      function ListaTipoDespesaAVParam(sClausula : String ) : OleVariant;
      function VerificaDespesa(sClausula : String ) : OleVariant;
   end;

implementation

{ TCtrlTipoDespesaAV }

function TCtrlTipoDespesaAV.AplicaOperacao: Boolean;
Var
   sMensagem : String;
begin
   if ConnectionSide = cnsClient then
   begin
      Result := Connection.AppServer.AplicaOperacaoTIPODESPESAAV( Fcds.Data );
      if not Result then
         MessageInfo := Connection.AppServer.MessageInfo;
   end else
   begin
      try
         StartTransaction;

         Result := ApplyCds(Fcds,_dbTipoDespesaAV,[],[]);
         sMensagem := _dbTipoDespesaAV.MessageInfo;

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

constructor TCtrlTipoDespesaAV.Create;
begin
   inherited;
   _dbTipoDespesaAV := TDbTipoDespesaAV.Create(Self);
   fCds             := TClientDataSet.Create(nil);
end;

destructor TCtrlTipoDespesaAV.Destroy;
begin
   if fCds.Active then
      fCds.Close;

   fCds := nil;
   fCds.Free;

   _dbTipoDespesaAV.Free;

   inherited;
end;

procedure TCtrlTipoDespesaAV.DoChangeDataBase;
begin
   inherited;
   _dbTipoDespesaAV.DataBaseName := DataBaseName;
end;

function TCtrlTipoDespesaAV.ListaTipoDespesaAV(sClausula: String): OleVariant;
var
   sSql : String;
begin
   sSql := ' SELECT IDTIPODESPESA, DESTIPODESPESA, IDTIPOMOVIMENTACAO ' + #13 +
           ' FROM TIPODESPESAAV ' + #13 ;
   //-------------------------------------------------------------------------------------
   if sClausula <> '' then
      sSql := sSql + ' WHERE ( ' +  sClausula +  ') ' + #13;
   //-------------------------------------------------------------------------------------
   sSql := sSql + ' ORDER BY DESTIPODESPESA ';
   Result := GetDataPacket(sSql);
end;
function TCtrlTipoDespesaAV.ListaTipoDespesaAVParam(sClausula: String): OleVariant;
var
   sSql : String;
begin
   sSql := ' SELECT DISTINCT CT.IDTIPODESPESA, TP.DESTIPODESPESA, TP.IDTIPOMOVIMENTACAO ' + #13 +
           ' FROM  CONTASTIPOSMOVIMENTOGRUPOS CT , TIPODESPESAAV TP ' + #13 +
           ' WHERE CT.IDTIPODESPESA = TP.IDTIPODESPESA  ' + #13 ;
   //-------------------------------------------------------------------------------------
   if sClausula <> '' then
      sSql := sSql + ' AND ( ' +  sClausula +  ') ' + #13;
   //-------------------------------------------------------------------------------------
   sSql := sSql + ' ORDER BY TP.DESTIPODESPESA ';
   Result := GetDataPacket(sSql);
end;

function TCtrlTipoDespesaAV.Procurar(nIdTipoDespesa: Extended): OleVariant;
begin
   _dbTipoDespesaAV.IDTIPODESPESA.AsFloat := nIdTipoDespesa;
   Result := GetDataPacket(_dbTipoDespesaAV.sSQLSelect);
end;

procedure TCtrlTipoDespesaAV.Setcds(const Value: TClientDataSet);
begin
   Fcds := Value;
end;

function TCtrlTipoDespesaAV.VerificaDespesa(sClausula: String): OleVariant;
begin

end;

end.
