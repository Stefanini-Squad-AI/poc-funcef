{*******************************************************}
{                                                       }
{ CM Soluções Informática                               }
{ ** Todos os Direitos Reservados                       }
{ Analista Responsável: Raniere S. M. da Silva          }
{ Criado Em: 13/02/2003                                 }
{                                                       }
{*******************************************************}

unit uCtrlPessoaEstrangeiro;

interface
{$I VERSAO_PADRAO.INC}

uses SysUtils, uCMClientDataSet, CmEventosCadastro, uCMTypes, IvDictio, 
  uCtrlPessoa, uCtrlCustomRH, uDbEstrangeiro;

type
  TCtrlPessoaEstrangeiro = class(TCtrlCustomPessoaRH)
  protected
    procedure DoChangeDataBase; override;
    procedure OnCreateAppServer; override;
    function  ProcessaOutros(Operacao: TOperacao; var Mensagem: string): boolean; override;
  private
    FDbEstrangeiro: TDbEstrangeiro;
  public
    constructor Create; override;
    destructor  Destroy; override;

    function SelEstrangeiro(IdPessoa: double): OleVariant;
  end;

implementation

uses uMidasUtil, uCtrlFuncoesRH;

{ TCtrlPessoaEstrangeiro }

constructor TCtrlPessoaEstrangeiro.Create;
begin
  inherited;
  FDbEstrangeiro := TDbEstrangeiro.Create(Self);
end;

procedure TCtrlPessoaEstrangeiro.OnCreateAppServer;
begin
  inherited;
end;

destructor TCtrlPessoaEstrangeiro.Destroy;
begin
  FDbEstrangeiro.Free;
  inherited;
end;

procedure TCtrlPessoaEstrangeiro.DoChangeDataBase;
begin
  inherited;
  FDbEstrangeiro.DataBaseName := DataBaseName;
end;

function TCtrlPessoaEstrangeiro.SelEstrangeiro(IdPessoa: double): OleVariant;
begin
  FDbEstrangeiro.IdPessoa.asFloat := IdPessoa;
  Result := GetDataPacket(FDbEstrangeiro.sSqlSelect);
end;

function TCtrlPessoaEstrangeiro.ProcessaOutros(Operacao: TOperacao; var Mensagem: string): boolean;
begin
  try
    if (Operacao = opApagar) then
    begin
      EmptyCds([CdsSubTipo]);

      Result := ApplyCds(CdsSubTipo, FDbEstrangeiro, [], []);
      if not(Result) then
        raise Exception.Create(FDbEstrangeiro.MessageInfo);
    end
    else
    begin
      Result := ApplyCds(CdsSubTipo, FDbEstrangeiro, [_DbPessoa.IdPessoa], [FDbEstrangeiro.IdPessoa]);
      if not(Result) then
        raise Exception.Create(FDbEstrangeiro.MessageInfo);
    end;
  except
    on E:Exception do
    begin
      Result := false;
      Mensagem := E.Message;
    end;
  end;
end;

end.
