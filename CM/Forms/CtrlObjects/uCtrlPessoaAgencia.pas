{*******************************************************}
{                                                       }
{ CM Soluções Informática  - Padrões de Desenvolvimento }
{ ** Todos os Direitos Reservados                       }
{                                                       }
{ - Classe de controle do Cadastro de Agências          }
{                                                       }
{ Analista Responsável: Gustavo Viegas                  }
{ Atualizado Em: 07/03/2002                             }
{                01/12/2003 - André Tavares - pendência 14891 }
{                                                       }
{*******************************************************}

unit uCtrlPessoaAgencia;

interface

Uses SysUtils, Classes, DbClient, uCmControlObject, uCtrlPessoa, uDbBanco, uCMTypes,
     ucmClientDataSet;

Type
  TCtrlPessoaAgencia = Class(TCtrlPessoa)
  private

  protected
    {**
      Metodo a ser sobrescrito para atribuição do DataBaseName as classes de controle
      adicionais criadas na classe herdada para o subtipo
    **}
    procedure DoChangeDataBase; Override;
    {**
      Método a ser sobrescrito para processamento dos CLientDataSets adicionais ao
      pessoa e do subtipo.
      O parâmetro operação indica a operação de opInserir, opAlterar, opApagar
    **}
    function ProcessaOutros(Operacao: TOperacao; Var Mensagem: String): Boolean; Override;
    function ExecAppServer(Operacao: TOperacao): Boolean; Override;
  public
    Constructor Create; Override;
    Destructor Destroy; Override;

    function SelAgencia(rIdpessoa: Double): OleVariant;
    function ValidaNumAgencia(sNumAgencia: String; dIdPessoa, dIdBanco: Double): Boolean;
    function BuscaParamGlobal(idEmpresa : integer): Integer;      
  End;

implementation

{ TCtrlPessoaAgencia }

constructor TCtrlPessoaAgencia.Create;
begin
  inherited;
end;

destructor TCtrlPessoaAgencia.Destroy;
begin

  inherited;
end;

procedure TCtrlPessoaAgencia.DoChangeDataBase;
begin
  inherited;

end;

function TCtrlPessoaAgencia.ProcessaOutros(Operacao: TOperacao;
  var Mensagem: String): Boolean;
begin
   If ( Operacao = opApagar ) Then CdsSubTipo.Delete;

   //CdsSubTipo >> _DbBanco
   Result := ApplyCds(CdsSubTipo , _DbAgenciabancaria , [_DbPessoa.Idpessoa], [_DbAgenciabancaria.Idpessoa] );
   If Not Result Then Mensagem := _DbAgenciabancaria.MessageInfo;
end;

function TCtrlPessoaAgencia.SelAgencia(rIdpessoa: Double): OleVariant;
begin
   _DbAgenciabancaria.Idpessoa.AsFloat := rIdpessoa;
   Result := GetDataPacket(_DbAgenciabancaria.SSqlSelect);
end;

function TCtrlPessoaAgencia.ValidaNumAgencia(sNumAgencia: String; dIdPessoa, dIdBanco: Double): Boolean;
begin
   _Cds.Data := GetDataPacket('SELECT IDPESSOA FROM AGENCIABANCARIA WHERE NUMAGENCIA = ' + QuotedStr(Trim(sNumAgencia)) + ' AND IDPESSOA <> ' + FloatToStr(dIdPessoa) + ' AND IDBANCO = ' + FloatToStr(dIdBanco));

   Result := _Cds.IsEmpty;

   _Cds.Close;
end;

function TCtrlPessoaAgencia.ExecAppServer(Operacao: TOperacao): Boolean;
begin
  Result := Connection.AppServer.ProcessaPessoaAgencia(Integer(Operacao),
            CdsPessoa.Data, CdsPessoafisica.Data,
            CdsDocpessoa.Data, CdsSubTipo.Data, CdsEndpess.Data, CdsTelendpess.Data,
            CdsContatopess.Data, CdsTelcontato.Data, CdsContaBancaria.Data,
            CdsImagensPessoa.Data, CdsImagensDOC.Data);
end;

function TCtrlPessoaAgencia.BuscaParamGlobal(idEmpresa: integer): Integer;
var  cdsLocal :TcmClientDataset;
begin
  result := 0;
  cdsLocal := TcmClientDataSet.Create(nil);
  try
    cdsLocal.Data := GetDataPacket(' SELECT FLGCGCAGENCIA FROM PARAMGLOBAL WHERE IDPESSOA = '+ intToStr(idEmpresa));
    result := cdsLocal.FieldByName('FLGCGCAGENCIA').asInteger;
  finally
    cdsLocal.Free;
  end;
end;

End.
