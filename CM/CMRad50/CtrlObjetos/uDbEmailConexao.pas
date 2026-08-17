{*******************************************************}
{                                                       }
{ CM Soluções Informática                               }
{ ** Todos os Direitos Reservados                       }
{ Gerada pelo "CM Bussines Object Builder"              }
{ Analista Responsável: Nome do Desenvolvedor           }
{ Atualizado Em: 31/10/2006                             }
{                                                       }
{*******************************************************}

unit uDbEmailConexao;

interface

Uses uCmCustomCdbObject, uCmDbObject, DB, uDataBase;

Type
  TDbEmailConexao = class(TCmDbObject)

  private
    FUsername: TCmDbField;
    FFlgautentic: TCmDbField;
    FSmtpserver: TCmDbField;
    FNomeexibicao: TCmDbField;
    FIdemailconexao: TCmDbField;
    FPorta: TCmDbField;
    FPassword: TCmDbField;
    procedure SetFlgautentic(const Value: TCmDbField);
    procedure SetIdemailconexao(const Value: TCmDbField);
    procedure SetNomeexibicao(const Value: TCmDbField);
    procedure SetPassword(const Value: TCmDbField);
    procedure SetPorta(const Value: TCmDbField);
    procedure SetSmtpserver(const Value: TCmDbField);
    procedure SetUsername(const Value: TCmDbField);

  public

     Property Username: TCmDbField read FUsername write SetUsername;
     Property Smtpserver: TCmDbField read FSmtpserver write SetSmtpserver;
     Property Porta: TCmDbField read FPorta write SetPorta;
     Property Password: TCmDbField read FPassword write SetPassword;
     Property Nomeexibicao: TCmDbField read FNomeexibicao write SetNomeexibicao;
     Property Idemailconexao: TCmDbField read FIdemailconexao write SetIdemailconexao;
     Property Flgautentic: TCmDbField read FFlgautentic write SetFlgautentic;

     Constructor Create(Aowner: TCmCustomCdbObject); Override;

  End;

implementation

{ TDbEmailConexao }

constructor TDbEmailConexao.Create(Aowner: TCmCustomCdbObject);
begin
  inherited;
  ErrorIfNoRowsAffected := False;

  TableName := 'EMAILCONEXAO';

   fUsername := CreateCmDbField('USERNAME',ftString,False,False,False,True,'Username');
   fPassword := CreateCmDbField('PASSWORD',ftString,False,False,False,True,'Senha');
   fSmtpserver := CreateCmDbField('SMTPSERVER',ftString,False,False,False,True,'Servidor SMTP');
   fPorta := CreateCmDbField('PORTA',ftfloat,False,False,False,False,'Porta');
   fNomeexibicao := CreateCmDbField('NOMEEXIBICAO',ftString,False,False,False,True,'Nome para exibição');
   fIdemailconexao := CreateCmDbField('IDEMAILCONEXAO',ftfloat,True,True,False,True,'Id. Conexão e-mail');
   fFlgautentic := CreateCmDbField('FLGAUTENTIC',ftfloat,False,False,False,False,'Requer autenticação');
end;

procedure TDbEmailConexao.SetFlgautentic(const Value: TCmDbField);
begin
  FFlgautentic := Value;
end;

procedure TDbEmailConexao.SetIdemailconexao(const Value: TCmDbField);
begin
  FIdemailconexao := Value;
end;

procedure TDbEmailConexao.SetNomeexibicao(const Value: TCmDbField);
begin
  FNomeexibicao := Value;
end;

procedure TDbEmailConexao.SetPassword(const Value: TCmDbField);
begin
  FPassword := Value;
end;

procedure TDbEmailConexao.SetPorta(const Value: TCmDbField);
begin
  FPorta := Value;
end;

procedure TDbEmailConexao.SetSmtpserver(const Value: TCmDbField);
begin
  FSmtpserver := Value;
end;

procedure TDbEmailConexao.SetUsername(const Value: TCmDbField);
begin
  FUsername := Value;
end;

end.



