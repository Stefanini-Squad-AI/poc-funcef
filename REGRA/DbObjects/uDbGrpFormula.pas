{*******************************************************}
{                                                       }
{ CM Soluções Informática                               }
{ ** Todos os Direitos Reservados                       }
{ Gerada pelo "CM Bussines Object Builder"              }
{ Analista Responsável: Alexandre Ramos                 }
{ Atualizado Em: 03/05/2002                             }
{                                                       }
{*******************************************************}

unit uDbGrpFormula;

interface
Uses uCmDbObject, uSistema, DB, uDataBase, uCmCustomCdbObject;

Type
  TDbGrpFormula = class(TCmDbObject)

  private
    FDescgrupoformula: TCmDbField;
    FCodgrupoformula: TCmDbField;
    procedure SetCodgrupoformula(const Value: TCmDbField);
    procedure SetDescgrupoformula(const Value: TCmDbField);

  public

     Property Descgrupoformula: TCmDbField read FDescgrupoformula write SetDescgrupoformula;
     Property Codgrupoformula: TCmDbField read FCodgrupoformula write SetCodgrupoformula;

     Constructor Create(Aowner: TCmCustomCdbObject); Virtual;


     Function Insert :Boolean; Override;
     Function LoadFromDb :Boolean; Override;

     Function SelecionaTudoOrdenado:String;
  End;

implementation

{ TDbGrpformula }

constructor TDbGrpformula.Create;
begin
  inherited;
  ErrorIfNoRowsAffected := False;

  TableName := 'GRPFORMULA';

   fDescgrupoformula := CreateCmDbField('DESCGRUPOFORMULA',ftString,False,False,False,False,'Descrição do Grupo');
   fCodgrupoformula  := CreateCmDbField('CODGRUPOFORMULA',ftString,True,True,False,False,'Código ');
end;

function TDbGrpformula.Insert: Boolean;
begin

   Result := Inherited Insert;

end;

function TDbGrpformula.LoadFromDB: Boolean;
begin

   Result := Inherited LoadFromDB;

end;

function TDbGrpformula.SelecionaTudoOrdenado: String;
begin
  Result := 'SELECT * FROM GRPFORMULA ORDER BY DESCRICAO ';
end;

procedure TDbGrpformula.SetCodgrupoformula(const Value: TCmDbField);
begin
  FCodgrupoformula := Value;
end;

procedure TDbGrpformula.SetDescgrupoformula(const Value: TCmDbField);
begin
  FDescgrupoformula := Value;
end;

end.



