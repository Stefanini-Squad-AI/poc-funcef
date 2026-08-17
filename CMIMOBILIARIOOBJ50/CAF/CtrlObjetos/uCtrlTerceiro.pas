unit uCtrlTerceiro;

interface

Uses SysUtils, Classes, DbClient, uCmControlObject, uSistema, CmEventosCadastro, uCMTypes,
     uCtrlPessoa, uDBTerceiro;

Type
   TCtrlTerceiro = class(TCtrlPessoa)

   Private

   Protected
      _dbTerceiro : TDbTerceiro;
      procedure DoChangeDataBase; Override;
      function  ProcessaOutros(Operacao : TOperacao; Var Mensagem : String) : boolean; Override;
      function  ExecAppServer(Operacao: TOperacao) : Boolean; Override;
   Public
      //----------------------------------------------------------------------------------
      // Métodos
      //----------------------------------------------------------------------------------
      constructor Create;  Override;
      destructor  Destroy; Override;
      //----------------------------------------------------------------------------------
      // Metodos de Persistencia
      //----------------------------------------------------------------------------------
      function SelTerceiro(nIdPessoa : Extended; iTipoTerceiro : Integer): OleVariant;
      function ListaTerceiro(fIdPessoa : Extended = -1; iTipoTerceiro : Integer = 0) : OleVariant;
   end;

implementation

{ TCtrlTerceiro }

constructor TCtrlTerceiro.Create;
begin
   inherited;
   _dbTerceiro := TDbTerceiro.Create;
end;

destructor TCtrlTerceiro.Destroy;
begin
   inherited;
   _dbTerceiro.Free;
end;

procedure TCtrlTerceiro.DoChangeDataBase;
begin
   inherited;
   _dbTerceiro.DataBaseName := DataBaseName;
end;

function TCtrlTerceiro.ProcessaOutros(Operacao : TOperacao; Var Mensagem : String) : boolean;
begin
   if Operacao = opApagar then
      cdsSubTipo.Delete;
   //-------------------------------------------------------------------------------------
   Result := ApplyCds(CdsSubTipo,_dbTerceiro,[_DBPessoa.IdPessoa],[_dbTerceiro.IdPessoa]);
   If Not Result Then Mensagem := _dbTerceiro.MessageInfo;
end;

function TCtrlTerceiro.ExecAppServer(Operacao: TOperacao): Boolean;
begin
   Result := Connection.AppServer.ProcessaPessoaAgencia(Integer(Operacao),
             CdsPessoa.Data, CdsPessoafisica.Data,
             CdsDocpessoa.Data, CdsSubTipo.Data, CdsEndpess.Data, CdsTelendpess.Data,
             CdsContatopess.Data, CdsTelcontato.Data, CdsContaBancaria.Data,
             CdsImagensPessoa.Data, CdsImagensDOC.Data);
end;

function TCtrlTerceiro.ListaTerceiro(fIdPessoa : Extended; iTipoTerceiro : Integer) : OleVariant;
var
   sSql : String;

begin
   //-------------------------------------------------------------------------------------
   // TIPOTERCEIRO -> 0 - Bens Aluguados; 1 - Destinatários de bens baixados
   //-------------------------------------------------------------------------------------
   sSql := ' SELECT PESSOA.NOME, ' + #13 +
           '        TERCEIRO.IDPESSOA ' + #13 +
           ' FROM TERCEIRO, '+ #13 +
           '      PESSOA '+ #13 +
           ' WHERE (TERCEIRO.IDPESSOA = PESSOA.IDPESSOA) ' + #13 +
           '   AND (TERCEIRO.TIPOTERCEIRO = ' + inttostr(iTipoTerceiro) + ') ' + #13;
   //-------------------------------------------------------------------------------------
   if fIdPessoa <> -1 then
      sSql := sSql + ' AND (TERCEIRO.IDPESSOA = ' + floattostr(fIdPessoa) + ') ' + #13;
   //-------------------------------------------------------------------------------------
   sSql := sSql + ' ORDER BY PESSOA.NOME ';
   //-------------------------------------------------------------------------------------
   Result := GetDataPacket( sSql );
end;

function TCtrlTerceiro.SelTerceiro(nIdPessoa : Extended; iTipoTerceiro : Integer): OleVariant;
begin
   _dbTerceiro.IdPessoa.AsFloat       := nIdPessoa;
   _dbTerceiro.TipoTerceiro.AsInteger := iTipoTerceiro;
   Result := GetDataPacket(_dbTerceiro.sSQLSelect);
end;

end.
