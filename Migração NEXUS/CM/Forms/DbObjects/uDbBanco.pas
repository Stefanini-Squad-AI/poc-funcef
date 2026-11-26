{*******************************************************}
{                                                       }
{ CM Soluções Informática                               }
{ ** Todos os Direitos Reservados                       }
{ Gerada pelo "CM Bussines Object Builder"              }
{ Analista Responsável: Nome do Desenvolvedor           }
{ Atualizado Em: 22/02/2002                             }
{                                                       }
{*******************************************************}

unit uDbBanco;

interface

Uses uCmCustomCdbObject, uCmDbObject, DB;

Type
  TDbBanco = class(TCmDbObject)

  private
    FIdpessoa: TCmDbField;
    FMascaracc: TCmDbField;
    FFlgvalidacc: TCmDbField;
    FMascaraagencia: TCmDbField;
    FNumbanco: TCmDbField;
    procedure SetFlgvalidacc(const Value: TCmDbField);
    procedure SetIdpessoa(const Value: TCmDbField);
    procedure SetMascaraagencia(const Value: TCmDbField);
    procedure SetMascaracc(const Value: TCmDbField);
    procedure SetNumbanco(const Value: TCmDbField);

  public

     Property Numbanco: TCmDbField read FNumbanco write SetNumbanco;
     Property Mascaracc: TCmDbField read FMascaracc write SetMascaracc;
     Property Mascaraagencia: TCmDbField read FMascaraagencia write SetMascaraagencia;
     Property Idpessoa: TCmDbField read FIdpessoa write SetIdpessoa;
     Property Flgvalidacc: TCmDbField read FFlgvalidacc write SetFlgvalidacc;

     Constructor Create(Aowner: TCmCustomCdbObject); Override;

     Function Insert :Boolean; Override;
     Function LoadFromDb :Boolean; Override;

     function SqlListBanco: String;
  End;

implementation

{ TDbBanco }

constructor TDbBanco.Create(Aowner: TCmCustomCdbObject);
begin
  inherited;
  ErrorIfNoRowsAffected := False;

  TableName := 'BANCO';

   fNumbanco := CreateCmDbField('NUMBANCO',ftString,True,False,False,True,'Número do Banco');
   fMascaracc := CreateCmDbField('MASCARACC',ftString,False,False,False,True,'Mascara da Conta Corrente');
   fMascaraagencia := CreateCmDbField('MASCARAAGENCIA',ftString,False,False,False,True,'Mascara da Agência');
   fIdpessoa := CreateCmDbField('IDPESSOA',ftfloat,True,True,False,True,'Identificador Do Pessoa');
   fFlgvalidacc := CreateCmDbField('FLGVALIDACC',ftString,False,False,False,True,'Valida CC');
end;

function TDbBanco.Insert: Boolean;
begin
   Result := Inherited Insert;
end;

function TDbBanco.LoadFromDB: Boolean;
begin

   Result := Inherited LoadFromDB;

end;

procedure TDbBanco.SetFlgvalidacc(const Value: TCmDbField);
begin
  FFlgvalidacc := Value;
end;

procedure TDbBanco.SetIdpessoa(const Value: TCmDbField);
begin
  FIdpessoa := Value;
end;

procedure TDbBanco.SetMascaraagencia(const Value: TCmDbField);
begin
  FMascaraagencia := Value;
end;

procedure TDbBanco.SetMascaracc(const Value: TCmDbField);
begin
  FMascaracc := Value;
end;

procedure TDbBanco.SetNumbanco(const Value: TCmDbField);
begin
  FNumbanco := Value;
end;

function TDbBanco.SqlListBanco: String;
begin
  Result := ' SELECT ' +
            '   P.NOME, P.RAZAOSOCIAL, B.NUMBANCO, B.IDPESSOA, B.MASCARACC, B.MASCARAAGENCIA, B.FLGVALIDACC ' +
            ' FROM ' +
            '   PESSOA P, BANCO B ' +
            ' WHERE ' +
            '   P.IDPESSOA = B.IDPESSOA ' +
            ' ORDER BY ' +
            '   P.NOME ';
end;

end.



