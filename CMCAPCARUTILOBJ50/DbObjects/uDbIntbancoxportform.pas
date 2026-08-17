{*******************************************************}
{                                                       }
{ CM Soluções Informática                               }
{ ** Todos os Direitos Reservados                       }
{ Gerada pelo "CM Bussines Object Builder"              }
{ Analista Responsável: Nome do Desenvolvedor           }
{ Atualizado Em: 09/04/2002                             }
{                                                       }
{*******************************************************}

unit uDbIntbancoxportform;

interface
Uses uCmDbObject, uSistema, DB, uDataBase, uCmCustomCdbObject;

Type
  TDbIntbancoxportform = class(TCmDbObject)

  private
    FIdparamintbanco: TCmDbField;
    FValparamintbanco: TCmDbField;
    FCodportforma: TCmDbField;
    procedure SetCodportforma(const Value: TCmDbField);
    procedure SetIdparamintbanco(const Value: TCmDbField);
    procedure SetValparamintbanco(const Value: TCmDbField);

  public

     Property Valparamintbanco: TCmDbField read FValparamintbanco write SetValparamintbanco;
     Property Idparamintbanco: TCmDbField read FIdparamintbanco write SetIdparamintbanco;
     Property Codportforma: TCmDbField read FCodportforma write SetCodportforma;

     Constructor Create(owner : TCmCustomCdbObject); Override;

     Function Insert :Boolean; Override;
     Function LoadFromDb :Boolean; Override;
  End;

implementation

{ TDbIntbancoxportform }

constructor TDbIntbancoxportform.Create(owner : TCmCustomCdbObject);
begin
  inherited;
  ErrorIfNoRowsAffected := False;

  TableName := 'INTBANCOXPORTFORM';

   fValparamintbanco := CreateCmDbField('VALPARAMINTBANCO',ftString,False,False,False,True,'');
   fIdparamintbanco := CreateCmDbField('IDPARAMINTBANCO',ftfloat,True,True,False,True,'');
   fCodportforma := CreateCmDbField('CODPORTFORMA',ftfloat,True,True,False,True,'');
end;

function TDbIntbancoxportform.Insert: Boolean;
begin
   Result := Inherited Insert;
end;

function TDbIntbancoxportform.LoadFromDB: Boolean;
begin

   Result := Inherited LoadFromDB;

end;

procedure TDbIntbancoxportform.SetCodportforma(const Value: TCmDbField);
begin
  FCodportforma := Value;
end;

procedure TDbIntbancoxportform.SetIdparamintbanco(const Value: TCmDbField);
begin
  FIdparamintbanco := Value;
end;

procedure TDbIntbancoxportform.SetValparamintbanco(
  const Value: TCmDbField);
begin
  FValparamintbanco := Value;
end;

end.



