{*******************************************************}
{                                                       }
{ CM Soluções Informática                               }
{ ** Todos os Direitos Reservados                       }
{ Gerada pelo "CM Bussines Object Builder"              }
{ Analista Responsável: Sergio Fernandes de Almeida     }
{ Atualizado Em: 12/03/2002                             }
{                                                       }
{*******************************************************}

unit uDBClassexGrupo;

interface

Uses uCmDbObject, DB, uCmCustomCdbObject;

Type
  TDBClassexGrupo = class(TCmDbObject)

  private
    FIdclassebem: TCmDbField;
    FIdgrupo: TCmDbField;
    procedure SetIdclassebem(const Value: TCmDbField);
    procedure SetIdgrupo(const Value: TCmDbField);

  public
    Property Idgrupo: TCmDbField read FIdgrupo write SetIdgrupo;
    Property Idclassebem: TCmDbField read FIdclassebem write SetIdclassebem;

    Constructor Create(Aowner: TCmCustomCdbObject); Override;

    Function Insert :Boolean; Override;
    Function LoadFromDb :Boolean; Override;
  End;

implementation

{ TDBClassexGrupo }

constructor TDBClassexGrupo.Create(Aowner: TCmCustomCdbObject);
begin
   inherited;
   ErrorIfNoRowsAffected := False;

   TableName := 'CLASSEXGRUPO';

   fIdgrupo := CreateCmDbField('IDGRUPO',ftfloat,True,True,False,True,'');
   fIdclassebem := CreateCmDbField('IDCLASSEBEM',ftfloat,True,True,False,True,'');
end;

function TDBClassexGrupo.Insert: Boolean;
begin
   Result := Inherited Insert;
end;

function TDBClassexGrupo.LoadFromDB: Boolean;
begin
   Result := Inherited LoadFromDB;
end;

procedure TDBClassexGrupo.SetIdclassebem(const Value: TCmDbField);
begin
   FIdclassebem := Value;
end;

procedure TDBClassexGrupo.SetIdgrupo(const Value: TCmDbField);
begin
   FIdgrupo := Value;
end;

end.



