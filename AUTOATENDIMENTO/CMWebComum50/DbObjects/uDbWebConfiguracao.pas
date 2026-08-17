{*******************************************************}
{                                                       }
{ CM Soluções Informática                               }
{ ** Todos os Direitos Reservados                       }
{ Gerada pelo "CM Bussines Object Builder"              }
{ Analista Responsável: Nome do Desenvolvedor           }
{ Atualizado Em: 31/05/2002                             }
{                                                       }
{*******************************************************}

unit uDbWebConfiguracao;

interface
Uses uCmDbObject, uSistema, DB, uDataBase, uCmCustomCdbObject;

Type
  TDbWebConfiguracao = class(TCmDbObject)

  private
    FIdfundacao: TCmDbField;
    FNomebase: TCmDbField;
    FSenhamin: TCmDbField;
    FSenhamax: TCmDbField;
    FSenhacase: TCmDbField;
    FSenhacripto: TCmDbField;
    FSenhamaster: TCmDbField;
    FLoginmaster: TCmDbField;
    FFlgextemptmoatv: TCmDbField;
    FFlgctrchqatv: TCmDbField;
    FFlginfrendatv: TCmDbField;
    FNumsenhablq: TCmDbField;
    FPretextoexporta: TCmDbField;
    FPostextoexporta: TCmDbField;
    FRegranovousu: TCmDbField;
    FQrynovousu: TCmDbField;
    FQryLogin: TCmDbField;
    FRegraLogin: TCmDbField;
    FQryAcesso: TCmDbField;                              //Pendência 18467 - 16/02/2007
    FFlgEnvioSenha: TCmDbField;
    FFlgAtivoAutoEmp: TCmDbField;                        //Auto-Emprestimo - 22/08/2007
    FLoginAutoEmp: TCmDbField;                           //Auto-Emprestimo - 22/08/2007
    FSenhaAutoEmp: TCmDbField;                           //Pendência 23402 - 26/02/2007
    procedure SetQryAcesso(const Value: TCmDbField);     //Pendência 18467 - 16/02/2007
    procedure SetFlgEnvioSenha(const Value: TCmDbField); //Pendência 23402 - 26/02/2007
    procedure SetIdfundacao(const Value: TCmDbField);
    procedure SetNomebase(const Value: TCmDbField);
    procedure SetSenhamin(const Value: TCmDbField);
    procedure SetSenhamax(const Value: TCmDbField);
    procedure SetSenhacase(const Value: TCmDbField);
    procedure SetSenhacripto(const Value: TCmDbField);
    procedure SetLoginmaster(const Value: TCmDbField);
    procedure SetSenhamaster(const Value: TCmDbField);
    procedure SetFlgctrchqatv(const Value: TCmDbField);
    procedure SetFlgextemptmoatv(const Value: TCmDbField);
    procedure SetFlginfrendatv(const Value: TCmDbField);
    procedure SetNumsenhablq(const Value: TCmDbField);
    procedure SetPostextoexporta(const Value: TCmDbField);
    procedure SetPretextoexporta(const Value: TCmDbField);
    procedure SetRegranovousu(const Value: TCmDbField);
    procedure SetQrynovousu(const Value: TCmDbField);
    procedure SetQryLogin(const Value: TCmDbField);
    procedure SetRegraLogin(const Value: TCmDbField);
    procedure SetFlgAtivoAutoEmp(const Value: TCmDbField);
    procedure SetLoginAutoEmp(const Value: TCmDbField);
    procedure SetSenhaAutoEmp(const Value: TCmDbField);

  public
     Property Idfundacao: TCmDbField read FIdfundacao write SetIdfundacao;
     Property Nomebase: TCmDbField read FNomebase write SetNomebase;
     Property Senhamin: TCmDbField read FSenhamin write SetSenhamin;
     Property Senhamax: TCmDbField read FSenhamax write SetSenhamax;
     Property Senhacase: TCmDbField read FSenhacase write SetSenhacase;
     Property Senhacripto: TCmDbField read FSenhacripto write SetSenhacripto;
     Property Loginmaster: TCmDbField read FLoginmaster write SetLoginmaster;
     Property Senhamaster: TCmDbField read FSenhamaster write SetSenhamaster;
     Property Flgctrchqatv : TCmDbField read FFlgctrchqatv write SetFlgctrchqatv;
     Property Flginfrendatv : TCmDbField read FFlginfrendatv write SetFlginfrendatv;
     Property Flgextemptmoatv : TCmDbField read FFlgextemptmoatv write SetFlgextemptmoatv;
     Property Numsenhablq : TCmDbField read FNumsenhablq write SetNumsenhablq;
     Property Pretextoexporta : TCmDbField read FPretextoexporta write SetPretextoexporta;
     Property Postextoexporta : TCmDbField read FPostextoexporta write SetPostextoexporta;
     Property Regranovousu : TCmDbField read FRegranovousu write SetRegranovousu;
     Property Qrynovousu : TCmDbField read FQrynovousu write SetQrynovousu;
     Property RegraLogin : TCmDbField read FRegraLogin write SetRegraLogin;
     Property QryLogin : TCmDbField read FQryLogin write SetQryLogin;
    //Pendência 18467 - 16/02/2007
     Property QryAcesso : TCmDbField read FQryAcesso write SetQryAcesso;
    //Fim Pendência 18467
    //Pendência 23402 - 26/02/2007
     Property FlgEnvioSenha : TCmDbField read FFlgEnvioSenha write SetFlgEnvioSenha;
    //Fim Pendência 18467
     // Auto-Emprestimo - 22/08/2007
     Property LoginAutoEmp : TCmDbField read FLoginAutoEmp write SetLoginAutoEmp;
     Property SenhaAutoEmp : TCmDbField read FSenhaAutoEmp write SetSenhaAutoEmp;
     Property FlgAtivoAutoEmp : TCmDbField read FFlgAtivoAutoEmp write SetFlgAtivoAutoEmp;
     // Fim Auto-Emprestimo


     Constructor Create( AOwner : TCmCustomCdbObject ); Override;

     Function Insert :Boolean; Override;
     Function LoadFromDb :Boolean; Override;
  End;

implementation

{ TDbWebConfiguracao }

constructor TDbWebConfiguracao.Create( AOwner : TCmCustomCdbObject );
begin
  inherited;
  ErrorIfNoRowsAffected := False;

  TableName := 'WEBCONFIGURACAO';

   fIdfundacao      := CreateCmDbField('IDFUNDACAO',ftfloat,True,True,False,True,'Fundação');
   FNomebase        := CreateCmDbField('NOMEBASE',ftString,True,False,False,False,'Nome da base');
   FSenhamin        := CreateCmDbField('SENHAMIN',ftfloat,True,False,False,False,'Tamanho mínimo da senha');
   FSenhamax        := CreateCmDbField('SENHAMAX',ftfloat,True,False,False,False,'Tamanho máximo da senha');
   FSenhacase       := CreateCmDbField('SENHACASE',ftString,True,False,False,False,'Senha faz distinção de maiúsculas/minúsculas?');
   FSenhacripto     := CreateCmDbField('SENHACRIPTO',ftString,True,False,False,False,'Senha criptografada?');
   FLoginmaster     := CreateCmDbField('LOGINMASTER',ftString,False,False,False,False,'Login Master');
   FSenhamaster     := CreateCmDbField('SENHAMASTER',ftString,False,False,False,False,'Senha Master');
   FFlgctrchqatv    := CreateCmDbField('FLGCTRCHQATV',ftString,False,False,False,False,'Contra-Cheque apenas para ativos');
   FFlginfrendatv   := CreateCmDbField('FLGINFRENDATV',ftString,False,False,False,False,'Informe de Rendimentos apenas para ativos');
   FFlgextemptmoatv := CreateCmDbField('FLGEXTEMPTMOATV',ftString,False,False,False,False,'Extrato de Empréstimos apenas para ativos');
   FNumsenhablq     := CreateCmDbField('NUMSENHABLQ',ftFloat,False,False,False,False,'Número de tentativas de conexão até bloqueio');
   FPretextoexporta := CreateCmDbField('PRETEXTOEXPORTA',ftString,False,False,False,False,'Texto a ser inserido no início do arquivo de exportação de senhas');
   FPostextoexporta := CreateCmDbField('POSTEXTOEXPORTA',ftString,False,False,False,False,'Texto a ser inserido no final do arquivo de exportação de senhas');
   FRegranovousu    := CreateCmDbField('REGRANOVOUSU',ftFloat,False,False,False,True,'Regra de validação de novo usuário');
   FQrynovousu      := CreateCmDbField('QRYNOVOUSU',ftString,False,False,False,False,'Query de entrada da regra de validação de novo usuário');
   FRegraLogin      := CreateCmDbField('REGRALOGIN',ftFloat,False,False,False,True,'Regra de criação de login');
   FQryLogin        := CreateCmDbField('QRYLOGIN',ftString,False,False,False,False,'Query de criação de login');
   //Pendência 18467 - 16/02/2007
   FQryLogin        := CreateCmDbField('QRYACESSO',ftString,False,False,False,False,'Query de entrada das regras de validação de páginas e campos');
   //Fim Pendência 18467
   //Pendência 23402 - 28/02/2007- Padrão 14
   FFlgEnvioSenha   := CreateCmDbField('FLGENVIOSENHA',ftString,False,False,False,False,'Retorno na opção Esqueci minha Senha');
   //Fim Pendência 23402
   //Auto-Emprestimo - 22/08/2007
   FLoginAutoEmp    := CreateCmDbField('LOGINAUTOEMP',ftString,False,False,False,False,'Login Auto-Empréstimo');
   FSenhaAutoEmp    := CreateCmDbField('SENHAAUTOEMP',ftString,False,False,False,False,'Senha Auto-Empréstimo');
   FFlgAtivoAutoEmp := CreateCmDbField('FLGATIVOAUTOEMP',ftString,False,False,False,False,'Ativação do Auto-Empréstimo');
   //Fim Auto-Emprestimo
end;

function TDbWebConfiguracao.Insert: Boolean;
begin

   Result := Inherited Insert;

end;

function TDbWebConfiguracao.LoadFromDB: Boolean;
begin

   Result := Inherited LoadFromDB;

end;


procedure TDbWebConfiguracao.SetFlgctrchqatv(const Value: TCmDbField);
begin
  FFlgctrchqatv := Value;
end;

procedure TDbWebConfiguracao.SetFlgextemptmoatv(const Value: TCmDbField);
begin
  FFlgextemptmoatv := Value;
end;

procedure TDbWebConfiguracao.SetFlginfrendatv(const Value: TCmDbField);
begin
  FFlginfrendatv := Value;
end;

procedure TDbWebConfiguracao.SetIdfundacao(const Value: TCmDbField);
begin
  FIdfundacao := Value;
end;


procedure TDbWebConfiguracao.SetLoginmaster(const Value: TCmDbField);
begin
  FLoginmaster := Value;
end;

procedure TDbWebConfiguracao.SetNomebase(const Value: TCmDbField);
begin
  FNomebase := Value;
end;

procedure TDbWebConfiguracao.SetNumsenhablq(const Value: TCmDbField);
begin
  FNumsenhablq := Value;
end;

procedure TDbWebConfiguracao.SetPostextoexporta(const Value: TCmDbField);
begin
  FPostextoexporta := Value;
end;

procedure TDbWebConfiguracao.SetPretextoexporta(const Value: TCmDbField);
begin
  FPretextoexporta := Value;
end;

procedure TDbWebConfiguracao.SetQryLogin(const Value: TCmDbField);
begin
  FQryLogin := Value;
end;

procedure TDbWebConfiguracao.SetQrynovousu(const Value: TCmDbField);
begin
  FQrynovousu := Value;
end;

procedure TDbWebConfiguracao.SetRegraLogin(const Value: TCmDbField);
begin
  FRegraLogin := Value;
end;

procedure TDbWebConfiguracao.SetRegranovousu(const Value: TCmDbField);
begin
  FRegranovousu := Value;
end;

procedure TDbWebConfiguracao.SetSenhacase(const Value: TCmDbField);
begin
  FSenhacase := Value;
end;

procedure TDbWebConfiguracao.SetSenhacripto(const Value: TCmDbField);
begin
  FSenhacripto := Value;
end;

procedure TDbWebConfiguracao.SetSenhamaster(const Value: TCmDbField);
begin
  FSenhamaster := Value;
end;

procedure TDbWebConfiguracao.SetSenhamax(const Value: TCmDbField);
begin
  FSenhamax := Value;
end;

procedure TDbWebConfiguracao.SetSenhamin(const Value: TCmDbField);
begin
  FSenhamin := Value;
end;

//Pendência 18467 - 16/02/2007
procedure TDbWebConfiguracao.SetQryAcesso(const Value: TCmDbField);
begin
  FQryAcesso := Value;
end;
//Fim Pendência 18467

//Pendência 23402 - 28/02/2007- Padrão 14
procedure TDbWebConfiguracao.SetFlgEnvioSenha(const Value: TCmDbField);
begin
  FFlgEnvioSenha := Value;
end;
//Fim Pendência 23402

// Auto-Emprestimo - 22/08/2007
procedure TDbWebConfiguracao.SetFlgAtivoAutoEmp(const Value: TCmDbField);
begin
  FFlgAtivoAutoEmp := Value;
end;

procedure TDbWebConfiguracao.SetLoginAutoEmp(const Value: TCmDbField);
begin
  FLoginAutoEmp := Value;
end;

procedure TDbWebConfiguracao.SetSenhaAutoEmp(const Value: TCmDbField);
begin
  FSenhaAutoEmp := Value;
end;
// Fim Auto-Emprestimo

end.



