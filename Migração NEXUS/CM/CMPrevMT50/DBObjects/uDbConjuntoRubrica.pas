{*******************************************************}
{                                                       }
{ CM Soluções Informática                               }
{ ** Todos os Direitos Reservados                       }
{ Gerada pelo "CM Bussines Object Builder"              }
{ Analista Responsável: Nome do Desenvolvedor           }
{ Atualizado Em: 13/12/2005                             }
{                                                       }
{*******************************************************}

unit uDbConjuntorubrica;

interface

Uses uCmCustomCdbObject, uCmDbObject, DB, uDataBase;

Type
  TDbConjuntorubrica = class(TCmDbObject)

  private
    FCodigo: TCmDbField;
    FDescricao: TCmDbField;
    FIdconjuntorubrica: TCmDbField;
    procedure SetCodigo(const Value: TCmDbField);
    procedure SetDescricao(const Value: TCmDbField);
    procedure SetIdconjuntorubrica(const Value: TCmDbField);

  public

     Property Idconjuntorubrica: TCmDbField read FIdconjuntorubrica write SetIdconjuntorubrica;
     Property Descricao: TCmDbField read FDescricao write SetDescricao;
     Property Codigo: TCmDbField read FCodigo write SetCodigo;

     Constructor Create(Aowner: TCmCustomCdbObject); Override;

     Function Insert :Boolean; Override;
  End;

implementation

{ TDbConjuntorubrica }

constructor TDbConjuntorubrica.Create(Aowner: TCmCustomCdbObject);
begin
  inherited;
  ErrorIfNoRowsAffected := False;

  TableName := 'CONJUNTORUBRICA';

   fIdconjuntorubrica := CreateCmDbField('IDCONJUNTORUBRICA',ftfloat,True,True,False,True,'');
   fDescricao := CreateCmDbField('DESCRICAO',ftString,False,False,False,True,'');
   fCodigo := CreateCmDbField('CODIGO',ftString,False,False,False,True,'');
end;

function TDbConjuntorubrica.Insert: Boolean;
begin

   fIdconjuntorubrica.AsFloat := GetSequence('CONJUNTORUBRICA');
   Result := Inherited Insert;

end;


procedure TDbConjuntorubrica.SetCodigo(const Value: TCmDbField);
begin
  FCodigo := Value;
end;

procedure TDbConjuntorubrica.SetDescricao(const Value: TCmDbField);
begin
  FDescricao := Value;
end;

procedure TDbConjuntorubrica.SetIdconjuntorubrica(const Value: TCmDbField);
begin
  FIdconjuntorubrica := Value;
end;

end.



