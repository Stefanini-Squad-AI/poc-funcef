{*******************************************************}
{                                                       }
{ CM Soluções Informática                               }
{ ** Todos os Direitos Reservados                       }
{ Gerada pelo "CM Bussines Object Builder"              }
{ Analista Responsável: Nome do Desenvolvedor           }
{ Atualizado Em: 22/05/2002                             }
{                                                       }
{*******************************************************}

unit uDbMarcas;

interface
Uses uCmDbObject, uSistema, DB, uDataBase, uCmCustomCdbObject;

Type
  TDbMarcas = class(TCmDbObject)

  private
    FIdmarca: TCmDbField;
    FMrcnome: TCmDbField;
    procedure SetIdmarca(const Value: TCmDbField);
    procedure SetMrcnome(const Value: TCmDbField);

  public

     Property Mrcnome: TCmDbField read FMrcnome write SetMrcnome;
     Property Idmarca: TCmDbField read FIdmarca write SetIdmarca;

     Constructor Create(Aowner: TCmCustomCdbObject); Override;

     Function Insert :Boolean; Override;
     Function LoadFromDb :Boolean; Override;
  End;

implementation

{ TDbMarcas }

constructor TDbMarcas.Create(Aowner: TCmCustomCdbObject);
begin
  inherited;
  ErrorIfNoRowsAffected := False;

  TableName := 'MARCAS';

   fMrcnome := CreateCmDbField('MRCNOME',ftString,True,False,False,True,'Descrição');
   fIdmarca := CreateCmDbField('IDMARCA',ftfloat,True,True,False,True,'');
end;

function TDbMarcas.Insert: Boolean;
begin

   fIdmarca.AsFloat := GetSequence('MARCAS');
   Result := Inherited Insert;

end;

function TDbMarcas.LoadFromDB: Boolean;
begin

   Result := Inherited LoadFromDB;

end;

procedure TDbMarcas.SetIdmarca(const Value: TCmDbField);
begin
  FIdmarca := Value;
end;

procedure TDbMarcas.SetMrcnome(const Value: TCmDbField);
begin
  FMrcnome := Value;
end;


end.



