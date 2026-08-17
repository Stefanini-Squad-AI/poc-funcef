{*******************************************************}
{                                                       }
{ CM Soluções Informática                               }
{ ** Todos os Direitos Reservados                       }
{ Gerada pelo "CM Bussines Object Builder"              }
{ Analista Responsável: Sergio Fernandes de Almeida     }
{ Atualizado Em: 21/03/2002                             }
{                                                       }
{*******************************************************}

unit uDBConjunto;

interface
Uses uCmDbObject, uSistema, DB, uDataBase;

Type
  TDBConjunto = class(TCmDbObject)

  private
    FIdresponsavel: TCmDbField;
    FDescconjunto: TCmDbField;
    FDisponivel: TCmDbField;
    FIdpessoa: TCmDbField;
    FAlugado: TCmDbField;
    FIdconjunto: TCmDbField;
    FIdlocalizacao: TCmDbField;
    procedure SetAlugado(const Value: TCmDbField);
    procedure SetDescconjunto(const Value: TCmDbField);
    procedure SetDisponivel(const Value: TCmDbField);
    procedure SetIdconjunto(const Value: TCmDbField);
    procedure SetIdlocalizacao(const Value: TCmDbField);
    procedure SetIdpessoa(const Value: TCmDbField);
    procedure SetIdresponsavel(const Value: TCmDbField);

  public

     Property Idresponsavel: TCmDbField read FIdresponsavel write SetIdresponsavel;
     Property Idpessoa: TCmDbField read FIdpessoa write SetIdpessoa;
     Property Idlocalizacao: TCmDbField read FIdlocalizacao write SetIdlocalizacao;
     Property Idconjunto: TCmDbField read FIdconjunto write SetIdconjunto;
     Property Disponivel: TCmDbField read FDisponivel write SetDisponivel;
     Property Descconjunto: TCmDbField read FDescconjunto write SetDescconjunto;
     Property Alugado: TCmDbField read FAlugado write SetAlugado;

     Constructor Create; Override;

     Function Insert :Boolean; Override;
     Function LoadFromDb :Boolean; Override;
  End;

implementation

{ TDBConjunto }

constructor TDBConjunto.Create;
begin
   inherited;
   ErrorIfNoRowsAffected := False;

   TableName := 'CONJUNTO';

   fIdresponsavel := CreateCmDbField('IDRESPONSAVEL',ftfloat,True,False,False,False,'');
   fIdpessoa := CreateCmDbField('IDPESSOA',ftfloat,True,False,False,False,'');
   fIdlocalizacao := CreateCmDbField('IDLOCALIZACAO',ftfloat,True,False,False,False,'');
   fIdconjunto := CreateCmDbField('IDCONJUNTO',ftfloat,True,True,False,False,'');
   fDisponivel := CreateCmDbField('DISPONIVEL',ftfloat,False,False,False,False,'');
   fDescconjunto := CreateCmDbField('DESCCONJUNTO',ftString,True,False,False,False,'');
   fAlugado := CreateCmDbField('ALUGADO',ftfloat,False,False,False,False,'');
end;

function TDBConjunto.Insert: Boolean;
begin
   fIdconjunto.AsFloat := GetSequence('CONJUNTO');
   Result := Inherited Insert;
end;

function TDBConjunto.LoadFromDB: Boolean;
begin
   Result := Inherited LoadFromDB;
end;

procedure TDBConjunto.SetAlugado(const Value: TCmDbField);
begin
   FAlugado := Value;
end;

procedure TDBConjunto.SetDescconjunto(const Value: TCmDbField);
begin
   FDescconjunto := Value;
end;

procedure TDBConjunto.SetDisponivel(const Value: TCmDbField);
begin
   FDisponivel := Value;
end;

procedure TDBConjunto.SetIdconjunto(const Value: TCmDbField);
begin
   FIdconjunto := Value;
end;

procedure TDBConjunto.SetIdlocalizacao(const Value: TCmDbField);
begin
   FIdlocalizacao := Value;
end;

procedure TDBConjunto.SetIdpessoa(const Value: TCmDbField);
begin
   FIdpessoa := Value;
end;

procedure TDBConjunto.SetIdresponsavel(const Value: TCmDbField);
begin
   FIdresponsavel := Value;
end;

end.



