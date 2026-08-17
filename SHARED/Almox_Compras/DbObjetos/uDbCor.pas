{*******************************************************}
{                                                       }
{ CM Soluções Informática                               }
{ ** Todos os Direitos Reservados                       }
{ Gerada pelo "CM Bussines Object Builder"              }
{ Analista Responsável: Igor Maia                       }
{ Atualizado Em: 10/01/2002                             }
{                                                       }
{*******************************************************}

unit uDbCor;

interface
Uses uCmDbObject, uSistema, DB, uDataBase, sysUtils, uCmCustomCdbObject;

Type
  TDbCor = class(TCmDbObject)

  private
    FDesccor: TCmDbField;
    FCodcor: TCmDbField;
    procedure SetCodcor(const Value: TCmDbField);
    procedure SetDesccor(const Value: TCmDbField);

  public

     Property Desccor: TCmDbField read FDesccor write SetDesccor;
     Property Codcor: TCmDbField read FCodcor write SetCodcor;

     Constructor Create(aOwner : TCmCustomCdbObject ); Override;

     Function Insert :Boolean; Override;
     Function Update :Boolean; Override;
     Function Delete :Boolean; Override;
     Function LoadFromDb :Boolean; Override;
  End;

implementation

{ TDbCor }

constructor TDbCor.Create(aOwner : TCmCustomCdbObject );
begin
  inherited;
  ErrorIfNoRowsAffected := False;

  TableName := 'COR';

  fDesccor := CreateCmDbField('DESCCOR',ftString,True,False,False,True,'Descrição');
  fCodcor  := CreateCmDbField('CODCOR'  ,ftString,False,True,False,True,'Código');

end;

function TDbCor.Delete: Boolean;
begin
   fCodcor.asString := Copy(fCodcor.asString+'            ',1,5);
   Result := Inherited Delete;
end;

function TDbCor.Insert: Boolean;
begin

   Result := Inherited Insert;

end;

function TDbCor.LoadFromDB: Boolean;
begin

   Result := Inherited LoadFromDB;

end;

procedure TDbCor.SetCodcor(const Value: TCmDbField);
begin
  FCodcor := Value;
end;

procedure TDbCor.SetDesccor(const Value: TCmDbField);
begin
  FDesccor := Value;
end;

function TDbCor.Update: Boolean;
begin
   fCodcor.asString := Copy(fCodcor.asString+'            ',1,5);
   Result := Inherited Update;
end;

end.



