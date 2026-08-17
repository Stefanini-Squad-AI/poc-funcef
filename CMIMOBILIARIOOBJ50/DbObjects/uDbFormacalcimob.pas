{*******************************************************}
{                                                       }
{ CM Soluções Informática                               }
{ ** Todos os Direitos Reservados                       }
{ Gerada pelo "CM Bussines Object Builder"              }
{ Analista Responsável: Nome do Desenvolvedor           }
{ Atualizado Em: 28/09/2006                             }
{                                                       }
{*******************************************************}

unit uDbFormacalcimob;

interface

Uses uCmCustomCdbObject, uCmDbObject, DB, uDataBase;

Type
  TDbFormacalcimob = class(TCmDbObject)

  private
    FIdformacalcimob: TCmDbField;
    FIdmodulo: TCmDbField;
    FDescricao: TCmDbField;
    FNome: TCmDbField;
    procedure SetDescricao(const Value: TCmDbField);
    procedure SetIdformacalcimob(const Value: TCmDbField);
    procedure SetIdmodulo(const Value: TCmDbField);
    procedure SetNome(const Value: TCmDbField);

  public

     Property Nome: TCmDbField read FNome write SetNome;
     Property Idmodulo: TCmDbField read FIdmodulo write SetIdmodulo;
     Property Idformacalcimob: TCmDbField read FIdformacalcimob write SetIdformacalcimob;
     Property Descricao: TCmDbField read FDescricao write SetDescricao;

     Constructor Create(Aowner: TCmCustomCdbObject); Override;

     Function Insert :Boolean; Override;
  End;

implementation

{ TDbFormacalcimob }

constructor TDbFormacalcimob.Create(Aowner: TCmCustomCdbObject);
begin
  inherited;
  ErrorIfNoRowsAffected := False;

  TableName := 'FORMACALCIMOB';

   fNome := CreateCmDbField('NOME',ftString,False,False,False,True,'');
   fIdmodulo := CreateCmDbField('IDMODULO',ftfloat,False,False,False,True,'');
   fIdformacalcimob := CreateCmDbField('IDFORMACALCIMOB',ftfloat,True,True,False,True,'');
   fDescricao := CreateCmDbField('DESCRICAO',ftString,False,False,False,True,'');
end;

function TDbFormacalcimob.Insert: Boolean;
begin

   fIdformacalcimob.AsFloat := GetSequence('FORMACALCIMOB');
   Result := Inherited Insert;

end;


procedure TDbFormacalcimob.SetDescricao(const Value: TCmDbField);
begin
  FDescricao := Value;
end;

procedure TDbFormacalcimob.SetIdformacalcimob(const Value: TCmDbField);
begin
  FIdformacalcimob := Value;
end;

procedure TDbFormacalcimob.SetIdmodulo(const Value: TCmDbField);
begin
  FIdmodulo := Value;
end;

procedure TDbFormacalcimob.SetNome(const Value: TCmDbField);
begin
  FNome := Value;
end;

end.



