{*******************************************************}
{                                                       }
{ CM Soluções Informática                               }
{ ** Todos os Direitos Reservados                       }
{ Gerada pelo "CM Bussines Object Builder"              }
{ Analista Responsável: Marcos Inacio                   }
{ Atualizado Em: 16/01/2002                             }
{                                                       }
{*******************************************************}

unit uDbAltximposto;

interface
Uses uCmDbObject, uSistema, DB, uDataBase, uCmCustomCdbObject;

Type
  TDbAltximposto = class(TCmDbObject)

  private
    FCodtipocustagreg: TCmDbField;
    FCodimposto: TCmDbField;
    FIdaltximposto: TCmDbField;
    FCodalterador: TCmDbField;
    procedure SetCodalterador(const Value: TCmDbField);
    procedure SetCodimposto(const Value: TCmDbField);
    procedure SetCodtipocustagreg(const Value: TCmDbField);
    procedure SetIdaltximposto(const Value: TCmDbField);
  protected
    function GetSqlSelect: String; Override;
  public

     Property Idaltximposto: TCmDbField    read FIdaltximposto    write SetIdaltximposto;
     Property Codtipocustagreg: TCmDbField read FCodtipocustagreg write SetCodtipocustagreg;
     Property Codimposto: TCmDbField       read FCodimposto       write SetCodimposto;
     Property Codalterador: TCmDbField     read FCodalterador     write SetCodalterador;

     Constructor Create(Aowner: TCmCustomCdbObject); Override;

     Function Insert :Boolean; Override;
     Function LoadFromDb :Boolean; Override;
  End;

implementation

{ TDbAltximposto }

constructor TDbAltximposto.Create(Aowner: TCmCustomCdbObject);
begin
  inherited;
  ErrorIfNoRowsAffected := False;

  TableName := 'ALTXIMPOSTO';

   fIdaltximposto := CreateCmDbField('IDALTXIMPOSTO',ftfloat,True,True);
   fCodtipocustagreg := CreateCmDbField('CODTIPOCUSTAGREG',ftfloat,False);
   fCodimposto := CreateCmDbField('CODIMPOSTO',ftfloat,True);
   fCodalterador := CreateCmDbField('CODALTERADOR',ftfloat,False);
end;

function TDbAltximposto.GetSqlSelect: String;
begin
  Result := inherited GetSqlSelect;
end;

function TDbAltximposto.Insert: Boolean;
begin

   fIdaltximposto.AsFloat := GetSequence('ALTXIMPOSTO');
   Result := Inherited Insert;

end;

function TDbAltximposto.LoadFromDB: Boolean;
begin

   Result := Inherited LoadFromDB;

end;

procedure TDbAltximposto.SetCodalterador(const Value: TCmDbField);
begin
  FCodalterador := Value;
end;

procedure TDbAltximposto.SetCodimposto(const Value: TCmDbField);
begin
  FCodimposto := Value;
end;

procedure TDbAltximposto.SetCodtipocustagreg(const Value: TCmDbField);
begin
  FCodtipocustagreg := Value;
end;

procedure TDbAltximposto.SetIdaltximposto(const Value: TCmDbField);
begin
  FIdaltximposto := Value;
end;

end.



