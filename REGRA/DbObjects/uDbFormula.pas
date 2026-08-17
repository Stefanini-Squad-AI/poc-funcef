{*******************************************************}
{                                                       }
{ CM Soluções Informática                               }
{ ** Todos os Direitos Reservados                       }
{ Gerada pelo "CM Bussines Object Builder"              }
{ Analista Responsável: Alexandre Ramos                 }
{ Atualizado Em: 04/06/2002                             }
{                                                       }
{*******************************************************}

unit uDbFormula;

interface
Uses uCmDbObject, uSistema, DB, uDataBase, uCmControlObject,
     uCmCustomCdbObject;

Type
  TDbFormula = class(TCmDbObject)

  private
    FCodgrupoformula: TCmDbField;
    FIdformula: TCmDbField;
    FExpressaoreal: TCmDbField;
    FDescricaoformula: TCmDbField;
    FExpressaoformula: TCmDbField;
    procedure SetCodgrupoformula(const Value: TCmDbField);
    procedure SetDescricaoformula(const Value: TCmDbField);
    procedure SetExpressaoformula(const Value: TCmDbField);
    procedure SetExpressaoreal(const Value: TCmDbField);
    procedure SetIdformula(const Value: TCmDbField);

  public

     Property Idformula: TCmDbField        read FIdformula        write SetIdformula;
     Property Expressaoreal: TCmDbField    read FExpressaoreal    write SetExpressaoreal;
     Property Expressaoformula: TCmDbField read FExpressaoformula write SetExpressaoformula;
     Property Descricaoformula: TCmDbField read FDescricaoformula write SetDescricaoformula;
     Property Codgrupoformula: TCmDbField  read FCodgrupoformula  write SetCodgrupoformula;

     Constructor Create(Aowner: TCmCustomCdbObject); Reintroduce; Virtual;

     Function Insert     :Boolean; Override;
     Function LoadFromDb :Boolean; Override;
     Function GetNextID  :Integer; 
  End;

implementation



{ TDbFormula }

constructor TDbFormula.Create;
begin
  inherited;
  ErrorIfNoRowsAffected := False;

  TableName := 'FORMULA';

   fIdformula := CreateCmDbField('IDFORMULA',ftfloat,True,True,False,False,'Identificador da Fórmula');
   fExpressaoreal := CreateCmDbField('EXPRESSAOREAL',ftString,False,False,False,False,'Expressão Real da Fórmula');
   fExpressaoformula := CreateCmDbField('EXPRESSAOFORMULA',ftString,False,False,False,False,'Expressão da Fórmula');
   fDescricaoformula := CreateCmDbField('DESCRICAOFORMULA',ftString,False,False,False,False,'Desrição da Fórmula');
   fCodgrupoformula := CreateCmDbField('CODGRUPOFORMULA',ftString,False,False,False,False,'Grupo de Fórmulas');
end;

function TDbFormula.GetNextID: Integer;
begin
   Result := GetSequence('FORMULA');
end;

function TDbFormula.Insert: Boolean;
begin

   fIdformula.AsFloat := GetSequence('FORMULA');
   Result := Inherited Insert;

end;

function TDbFormula.LoadFromDB: Boolean;
begin

   Result := Inherited LoadFromDB;

end;

procedure TDbFormula.SetCodgrupoformula(const Value: TCmDbField);
begin
  FCodgrupoformula := Value;
end;

procedure TDbFormula.SetDescricaoformula(const Value: TCmDbField);
begin
  FDescricaoformula := Value;
end;

procedure TDbFormula.SetExpressaoformula(const Value: TCmDbField);
begin
  FExpressaoformula := Value;
end;

procedure TDbFormula.SetExpressaoreal(const Value: TCmDbField);
begin
  FExpressaoreal := Value;
end;

procedure TDbFormula.SetIdformula(const Value: TCmDbField);
begin
  FIdformula := Value;
end;

end.



