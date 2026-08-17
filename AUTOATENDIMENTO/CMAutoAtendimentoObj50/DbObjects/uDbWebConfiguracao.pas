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

   fIdfundacao     := CreateCmDbField('IDFUNDACAO',ftfloat,True,True,False,True,'Fundação');
   FNomebase       := CreateCmDbField('NOMEBASE',ftString,True,False,False,False,'Nome da base');
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


end.



