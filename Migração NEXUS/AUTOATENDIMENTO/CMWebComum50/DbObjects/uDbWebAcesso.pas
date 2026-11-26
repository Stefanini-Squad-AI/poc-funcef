{*******************************************************}
{                                                       }
{ CM Soluções Informática                               }
{ ** Todos os Direitos Reservados                       }
{ Gerada pelo "CM Bussines Object Builder"              }
{ Analista Responsável: Nome do Desenvolvedor           }
{ Atualizado Em: 24/10/2002                             }
{                                                       }
{*******************************************************}

unit uDbWebAcesso;

interface

Uses uCmCustomCdbObject, uCmDbObject, uSistema, DB, uDataBase;

Type
  TDbWebAcesso = class(TCmDbObject)

  private
    FIdpessoa: TCmDbField;
    FSenhapessoal: TCmDbField;
    FLoginpessoal: TCmDbField;
    FIdusuario: TCmDbField;
    FDtaltera: TCmDbField;
    FFlgstatus: TCmDbField;
    FNumtentacess: TCmDbField;
    FDtultexport: TCmDbField;
    FLembrete: TCmDbField;
    procedure SetIdpessoa(const Value: TCmDbField);
    procedure SetLoginpessoal(const Value: TCmDbField);
    procedure SetSenhapessoal(const Value: TCmDbField);
    procedure SetDtaltera(const Value: TCmDbField);
    procedure SetIdusuario(const Value: TCmDbField);
    procedure SetFlgstatus(const Value: TCmDbField);
    procedure SetNumtentacess(const Value: TCmDbField);
    procedure SetDtultexport(const Value: TCmDbField);
    procedure SetLembrete(const Value: TCmDbField);

  public

     Property Senhapessoal: TCmDbField read FSenhapessoal write SetSenhapessoal;
     Property Loginpessoal: TCmDbField read FLoginpessoal write SetLoginpessoal;
     Property Idpessoa: TCmDbField read FIdpessoa write SetIdpessoa;
     Property Dtaltera: TCmDbField read FDtaltera write SetDtaltera;
     Property Idusuario: TCmDbField read FIdusuario write SetIdusuario;
     Property Flgstatus : TCmDbField read FFlgstatus write SetFlgstatus;
     Property Numtentacess : TCmDbField read FNumtentacess write SetNumtentacess;
     Property Dtultexport : TCmDbField read FDtultexport write SetDtultexport;
     Property Lembrete : TCmDbField read FLembrete write SetLembrete;

     Constructor Create(Aowner: TCmCustomCdbObject); Override;
  End;

implementation

{ TDbWebAcesso }

constructor TDbWebAcesso.Create(Aowner: TCmCustomCdbObject);
begin
  inherited;
  ErrorIfNoRowsAffected := False;

  TableName := 'WEBACESSO';

  fSenhapessoal := CreateCmDbField('SENHAPESSOAL',ftString,True,False,False,True,'Senha');
  fLoginpessoal := CreateCmDbField('LOGINPESSOAL',ftString,True,False,False,True,'Login');
  fIdpessoa     := CreateCmDbField('IDPESSOA',ftfloat,True,True,False,True,'Id. Pessoa');
  fDtaltera     := CreateCmDbField('DTALTERA',ftDateTime,True,False,False,True,'Data da última alteração');
  FIdusuario    := CreateCmDbField('IDUSUARIO',ftfloat,True,False,False,True,'Usuário que fez a última alteração');
  FFlgstatus    := CreateCmDbField('FLGSTATUS',ftfloat,True,False,False,True,'Status da senha');
  FNumtentacess := CreateCmDbField('NUMTENTACESS',ftfloat,False,False,False,True,'Número de tentativas de acesso');
  FDtultexport  := CreateCmDbField('DTULTEXPORT',ftDateTime,False,False,False,True,'Número de tentativas de acesso');
  FLembrete     := CreateCmDbField('LEMBRETE',ftString,False,False,False,False,'Lembrete da senha');
end;

procedure TDbWebAcesso.SetDtaltera(const Value: TCmDbField);
begin
  FDtaltera := Value;
end;

procedure TDbWebAcesso.SetDtultexport(const Value: TCmDbField);
begin
  FDtultexport := Value;
end;

procedure TDbWebAcesso.SetFlgstatus(const Value: TCmDbField);
begin
  FFlgstatus := Value;
end;

procedure TDbWebAcesso.SetIdpessoa(const Value: TCmDbField);
begin
  FIdpessoa := Value;
end;

procedure TDbWebAcesso.SetIdusuario(const Value: TCmDbField);
begin
  FIdusuario := Value;
end;

procedure TDbWebAcesso.SetLembrete(const Value: TCmDbField);
begin
  FLembrete := Value;
end;

procedure TDbWebAcesso.SetLoginpessoal(const Value: TCmDbField);
begin
  FLoginpessoal := Value;
end;

procedure TDbWebAcesso.SetNumtentacess(const Value: TCmDbField);
begin
  FNumtentacess := Value;
end;

procedure TDbWebAcesso.SetSenhapessoal(const Value: TCmDbField);
begin
  FSenhapessoal := Value;
end;

end.






