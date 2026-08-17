{*******************************************************}
{                                                       }
{ CM Soluções Informática                               }
{ ** Todos os Direitos Reservados                       }
{ Gerada pelo "CM Bussines Object Builder"              }
{ Analista Responsável: Veronica L. M. Almeida          }
{ Atualizado Em: 03/01/2002                             }
{                                                       }
{*******************************************************}

unit uDbPlano;

interface

Uses uCmCustomCdbObject, uCmDbObject,  DB, uDataBase;

Type
  TDbPlano = class(TCmDbObject)

  private
    FPlano             : TCmDbField;
    FIdUsuarioInclusao : TCmDbField;
    FDescPlano         : TCmDbField;
    FMascara           : TCmDbField;
    procedure SetPlano(const Value: TCmDbField);
    procedure SetIdUsuarioInclusao(const Value: TCmDbField);
    procedure SetDescPlano(const Value: TCmDbField);
    procedure SetMascara(const Value: TCmDbField);
  public
     Property IdUsuarioInclusao : TCmDbField Read FIdUsuarioInclusao Write SetIdUsuarioInclusao;
     Property DescPlano         : TCmDbField Read FDescPlano         Write SetDescPlano;
     Property Mascara           : TCmDbField Read FMascara           Write SetMascara;
     Property Plano             : TCmDbField Read FPlano             Write SetPlano;

     Constructor Create(Aowner: TCmCustomCdbObject); Override;

     Function Insert     :Boolean; Override;
     Function LoadFromDb :Boolean; Override;
  End;

implementation

{ TDbPeriodo }

constructor TDbPlano.Create(Aowner: TCmCustomCdbObject);
begin
  inherited;

  ErrorIfNoRowsAffected := False;

  TableName := 'PLANO';

  {Campo,Tipo,Obrigatorio,Chave, ReadOnly,NullSeZero}

  FPlano             := CreateCmDbField('PLANO',ftFloat,True,True,False,False);
  FIdUsuarioInclusao := CreateCmDbField('IDUSUARIOINCLUSAO',ftfloat,True,False,False,False);
  FDescPlano         := CreateCmDbField('DESCPLANO',ftString);
  FMascara           := CreateCmDbField('MASCARA',ftString);
end;

function TDbPlano.Insert: Boolean;
begin
   FPlano.AsFloat := GetSequence('PLANO');
   Result := Inherited Insert;
end;

function TDbPlano.LoadFromDb: Boolean;
begin
   Result := Inherited LoadFromDb;
end;


procedure TDbPlano.SetIdUsuarioInclusao(const Value: TCmDbField);
begin
   FIdUsuarioInclusao := Value;
end;

procedure TDbPlano.SetDescPlano(const Value: TCmDbField);
begin
  FDescPlano := Value;
end;

procedure TDbPlano.SetMascara(const Value: TCmDbField);
begin
  FMascara := Value;
end;

procedure TDbPlano.SetPlano(const Value: TCmDbField);
begin
  FPlano := Value;
end;


end.

