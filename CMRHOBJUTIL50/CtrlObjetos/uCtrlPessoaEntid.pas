{*******************************************************}
{                                                       }
{ CM Soluções Informática                               }
{ ** Todos os Direitos Reservados                       }
{ Analista Responsável: Raniere S. M. da Silva          }
{ Criado Em: 11/03/2002                                 }
{                                                       }
{*******************************************************}

unit uCtrlPessoaEntid;

interface
{$I VERSAO_PADRAO.INC}

uses SysUtils, CmEventosCadastro, IvDictio,  uCtrlPessoa, uDbTerceiro,
  uCMTypes, uCtrlCustomRH;

type
  TCtrlPessoaEntid = class(TCtrlCustomPessoaRH)
  protected
    procedure DoChangeDataBase; override;
    function  ProcessaOutros(Operacao: TOperacao; var Mensagem: string): boolean; override;
    function  ExecAppServer(Operacao: TOperacao): boolean; override;
  private
    FDb: TDbTerceiro;
  public
    constructor Create; override;
    destructor  Destroy; override;

    function ListSubTipo(IdPessoa: double): OleVariant;
  end;

implementation

//*uses Variants;

{ TCtrlPessoaEntid }

constructor TCtrlPessoaEntid.Create;
begin
  inherited;
  FDb := TDbTerceiro.Create(Self);
end;

destructor TCtrlPessoaEntid.Destroy;
begin
  FDb.Free;
  inherited;
end;

procedure TCtrlPessoaEntid.DoChangeDataBase;
begin
  inherited;
  FDb.DatabaseName := DataBaseName;
end;

function TCtrlPessoaEntid.ListSubTipo(IdPessoa: double): OleVariant;
begin
  FDb.IdPessoa.asFloat := Idpessoa;
  Result := GetDataPacket(FDb.sSqlSelect);
end;

function TCtrlPessoaEntid.ProcessaOutros(Operacao: TOperacao; var Mensagem: string): boolean;
begin
  if (Operacao = opApagar) then
    CdsSubTipo.Delete;

  Result := ApplyCds(CdsSubTipo, FDb, [_DbPessoa.IdPessoa], [FDb.IdPessoa]);

  if not(Result) then
    Mensagem := FDb.MessageInfo;
end;

function TCtrlPessoaEntid.ExecAppServer(Operacao: TOperacao): boolean;
begin
  Result := Connection.AppServer.ProcessaPessoaEntidade(Integer(Operacao),
    CdsPessoa.Data, CdsPessoafisica.Data, CdsDocpessoa.Data, CdsSubTipo.Data,
    CdsEndpess.Data, CdsTelendpess.Data, CdsContatopess.Data, CdsTelcontato.Data,
    CdsContaBancaria.Data, CdsImagensPessoa.Data, CdsImagensDOC.Data);
  //*  {$IFDEF PADRAO_7_08_05}
  //*   CdsAtributosPessoa.Data, CdsEventosPessoa.Data);
  //*   {$ELSE}
   //*  NULL, NULL);
   //*  {$ENDIF}
end;

end.
