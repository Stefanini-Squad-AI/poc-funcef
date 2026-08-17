{*******************************************************}
{                                                       }
{ CM Soluções Informática  - Padrões de Desenvolvimento }
{ ** Todos os Direitos Reservados                       }
{                                                       }
{ - Classe de controle do Cadastro de Bancos            }
{                                                       }
{ Analista Responsável: Gustavo Viegas                  }
{ Atualizado Em: 07/03/2002                             }
{                                                       }
{*******************************************************}

unit uCtrlPessoaBanco;

interface

Uses SysUtils, Classes, DbClient, uCmControlObject, uCmTypes, uCtrlPessoa;

Type
  TCtrlPessoaBanco = Class(TCtrlPessoa)
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

    function SelBanco(rIdpessoa: Double): OleVariant;
    function ValidaNumBanco(rNumBanco, dIdPessoa: Double): Boolean;
  End;

implementation

{ TCtrlPessoaBanco }

constructor TCtrlPessoaBanco.Create;
begin
  inherited;

end;

destructor TCtrlPessoaBanco.Destroy;
begin

  inherited;
end;

procedure TCtrlPessoaBanco.DoChangeDataBase;
begin
  inherited;
  
end;

function TCtrlPessoaBanco.ProcessaOutros(Operacao: TOperacao;
  var Mensagem: String): Boolean;
begin
   If ( Operacao = opApagar ) Then CdsSubTipo.Delete;

   //CdsSubTipo >> _DbBanco
   Result := ApplyCds(CdsSubTipo , _DbBanco , [_DbPessoa.Idpessoa], [_DbBanco.Idpessoa] );
   If Not Result Then Mensagem := _DbBanco.MessageInfo;
end;

function TCtrlPessoaBanco.SelBanco(rIdpessoa: Double): OleVariant;
begin
   _DbBanco.Idpessoa.AsFloat := rIdpessoa;
   Result := GetDataPacket(_DbBanco.SSqlSelect);
end;

function TCtrlPessoaBanco.ValidaNumBanco(rNumBanco, dIdPessoa: Double): Boolean;
begin
   _Cds.Data := GetDataPacket('SELECT IDPESSOA FROM BANCO WHERE NUMBANCO = ' + QuotedStr(FloatToStr(rNumBanco)) + ' AND IDPESSOA <> ' + FloatToStr(dIdPessoa)) ;

   Result := _Cds.IsEmpty;

   _Cds.Close;
end;

function TCtrlPessoaBanco.ExecAppServer(Operacao: TOperacao): Boolean;
begin
  Result := Connection.AppServer.ProcessaPessoaBanco(Integer(Operacao),
            CdsPessoa.Data, CdsPessoafisica.Data,
            CdsDocpessoa.Data, CdsSubTipo.Data, CdsEndpess.Data, CdsTelendpess.Data,
            CdsContatopess.Data, CdsTelcontato.Data, CdsContaBancaria.Data,
            CdsImagensPessoa.Data, CdsImagensDOC.Data);
end;

end.


