unit uCtrlResponsavel;

interface

uses SysUtils, Classes, DbClient, uCmControlObject, uCMTypes, uSistema, CmEventosCadastro,
  uCtrlPessoa, uDBResponsavel;

type
  TCtrlResponsavel = class(TCtrlPessoa)
  protected
    _dbResponsavel : TDbResponsavel;
    procedure DoChangeDataBase; Override;
    function  ProcessaOutros(Operacao : TOperacao; Var Mensagem : String) : boolean; Override;
    function  ExecAppServer(Operacao: TOperacao) : Boolean; Override;
  public
    constructor Create;  Override;
    destructor  Destroy; Override;

    function SelResponsavel(nIdResponsavel: Extended): OleVariant;
    function ListaResponsavel(fIdResponsavel : Extended = -1): OleVariant;
  end;

implementation

{ TCtrlResponsavel }

constructor TCtrlResponsavel.Create;
begin
   inherited;
   _dbResponsavel := TDbResponsavel.Create(Self);
end;

destructor TCtrlResponsavel.Destroy;
begin
   _dbResponsavel.Free;
   inherited;
end;

procedure TCtrlResponsavel.DoChangeDataBase;
begin
   inherited;
   _dbResponsavel.DataBaseName := DataBaseName;
end;

function TCtrlResponsavel.ProcessaOutros(Operacao : TOperacao; Var Mensagem : String) : boolean;
begin
   if Operacao = opApagar then
      cdsSubTipo.Delete;
   //-------------------------------------------------------------------------------------
   Result := ApplyCds(CdsSubTipo,_DBResponsavel,[_DBPessoa.IdPessoa],[_DBResponsavel.Idresponsavel]);
   If Not Result Then Mensagem := _DBResponsavel.MessageInfo;
end;

function TCtrlResponsavel.ExecAppServer(Operacao: TOperacao): Boolean;
begin
  Result := Connection.AppServer.ProcessaPessoaAgencia(Integer(Operacao),
            CdsPessoa.Data, CdsPessoafisica.Data,
            CdsDocpessoa.Data, CdsSubTipo.Data, CdsEndpess.Data, CdsTelendpess.Data,
            CdsContatopess.Data, CdsTelcontato.Data, CdsContaBancaria.Data,
            CdsImagensPessoa.Data, CdsImagensDOC.Data);
end;

function TCtrlResponsavel.ListaResponsavel(fIdResponsavel : Extended): OleVariant;
var
   sSql : String;
begin
   sSql := ' SELECT PESSOA.NOME, ' + #13 +
           '        RESPONSAVEL.IDRESPONSAVEL ' + #13 +
           ' FROM RESPONSAVEL, '+ #13 +
           '      PESSOA '+ #13 +
           ' WHERE (RESPONSAVEL.IDRESPONSAVEL = PESSOA.IDPESSOA) ' + #13 ;
   //-------------------------------------------------------------------------------------
   if fIdResponsavel <> -1 then
      sSql := sSql + '   AND (RESPONSAVEL.IDRESPONSAVEL = ' + floattostr(fIdResponsavel) + ') ' + #13;
   //-------------------------------------------------------------------------------------
   sSql := sSql + ' ORDER BY PESSOA.NOME ';
   //-------------------------------------------------------------------------------------
   Result := GetDataPacket( sSql );
end;

function TCtrlResponsavel.SelResponsavel(nIdResponsavel: Extended): OleVariant;
begin
   _dbResponsavel.IDResponsavel.AsFloat := nIdResponsavel;
   Result := GetDataPacket(_dbResponsavel.sSQLSelect);
end;

end.
