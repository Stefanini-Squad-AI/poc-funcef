{*******************************************************}
{                                                       }
{ CM Soluções Informática                               }
{ ** Todos os Direitos Reservados                       }
{ Analista Responsável: Raniere S. M. da Silva          }
{ Criado Em: 11/03/2002                                 }
{                                                       }
{*******************************************************}

unit uCtrlPessoaFornServ;

interface
{$I VERSAO_PADRAO.INC}

uses SysUtils, uCMTypes, CmEventosCadastro, IvDictio,  uCMClientDataSet,
  uCtrlPessoa, uCtrlCustomRH, uDbFornServ;

type
  TCtrlPessoaFornServ = class(TCtrlCustomPessoaRH)
  protected
    procedure DoChangeDataBase; override;
    function  ProcessaOutros(Operacao: TOperacao; var Mensagem: string): boolean; override;
    function  ExecAppServer(Operacao: TOperacao): boolean; override;
  private
    FDb: TDbFornServ;
  public
    constructor Create; override;
    destructor  Destroy; override;

    function SelFornServ(IdPessoa: double): OleVariant;
  end;

implementation

uses  uMidasUtil, uCtrlFuncoesRH;
//*Variants,
{ TCtrlPessoaFornServ }

constructor TCtrlPessoaFornServ.Create;
begin
  inherited;
  FDb := TDbFornServ.Create(Self);
end;

destructor TCtrlPessoaFornServ.Destroy;
begin
  FDb.Free;
  inherited;
end;

procedure TCtrlPessoaFornServ.DoChangeDataBase;
begin
  inherited;
  FDb.DatabaseName := DataBaseName;
end;

function TCtrlPessoaFornServ.SelFornServ(IdPessoa: double): OleVariant;
begin
  FDb.IdPessoa.asFloat := IdPessoa;
  Result := GetDataPacket(FDb.sSqlSelect);
end;

function TCtrlPessoaFornServ.ProcessaOutros(Operacao: TOperacao; var Mensagem: string): boolean;
begin
  if (Operacao = opApagar) then
    CdsSubTipo.Delete;

  Result := ApplyCds(CdsSubTipo, FDb, [_DbPessoa.IdPessoa], [FDb.IdPessoa]);

  if not(Result) then
    Mensagem := FDb.MessageInfo;
end;

function TCtrlPessoaFornServ.ExecAppServer(Operacao: TOperacao): boolean;
begin
  Result := Connection.AppServer.ProcessaPessoaFornServ(Integer(Operacao),
    CdsPessoa.Data, CdsPessoafisica.Data, CdsDocpessoa.Data, CdsSubTipo.Data,
    CdsEndpess.Data, CdsTelendpess.Data, CdsContatopess.Data, CdsTelcontato.Data,
    CdsContaBancaria.Data, CdsImagensPessoa.Data, CdsImagensDOC.Data);
   //* {$IFDEF PADRAO_7_08_05}
   //* CdsAtributosPessoa.Data, CdsEventosPessoa.Data);
   //* {$ELSE}
   //* NULL, NULL);
    //*{$ENDIF}
end;

end.
