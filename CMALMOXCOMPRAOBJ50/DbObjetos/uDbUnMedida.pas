{*******************************************************}
{                                                       }
{ CM Soluções Informática                               }
{ ** Todos os Direitos Reservados                       }
{ Gerada pelo "CM Bussines Object Builder"              }
{ Analista Responsável: Igor Maia                       }
{ Atualizado Em: 10/01/2002                             }
{                                                       }
{*******************************************************}

unit uDbUnMedida;

interface
Uses uCmDbObject, uSistema, DB, uDataBase, sysUtils, uCmCustomCdbObject;

Type
  TDbUnMedida = class(TCmDbObject)

  private
    FDescMedida: TCmDbField;
    FCodMedida: TCmDbField;
    procedure SetCodMedida(const Value: TCmDbField);
    procedure SetDescMedida(const Value: TCmDbField);
  public

     Property DescMedida : TCmDbField read FDescMedida write SetDescMedida;
     Property CodMedida  : TCmDbField read FCodMedida write SetCodMedida;

     Constructor Create(aOwner : TCmCustomCdbObject ); Override;

     Function Insert :Boolean; Override;
     Function Delete :Boolean; Override;
     Function Update :Boolean; Override;
     Function LoadFromDb :Boolean; Override;
  End;

implementation

{ TDbUnMedida }

constructor TDbUnMedida.Create(aOwner : TCmCustomCdbObject );
begin
  inherited;
  ErrorIfNoRowsAffected := False;

  TableName := 'UNMEDIDA';

   fDescmedida := CreateCmDbField('DESCMEDIDA' ,ftString,False,False,False,True,'Descrição');
   fCodmedida  := CreateCmDbField('CODMEDIDA'  ,ftString,False,True,False,True,'Código');
end;

function TDbUnMedida.Delete: Boolean;
begin
   FCodMedida.AsString := Copy(FCodMedida.AsString +'        ',1,4);
   Result := Inherited Delete;
end;

function TDbUnMedida.Insert: Boolean;
begin
   Result := Inherited Insert;
end;

function TDbUnMedida.LoadFromDB: Boolean;
begin
   Result := Inherited LoadFromDB;
end;

procedure TDbUnMedida.SetCodMedida(const Value: TCmDbField);
begin
  FCodMedida := Value;
end;

procedure TDbUnMedida.SetDescMedida(const Value: TCmDbField);
begin
  FDescMedida := Value;
end;

function TDbUnMedida.Update: Boolean;
begin
   FCodMedida.AsString := Copy(FCodMedida.AsString +'        ',1,4);
   Result := Inherited Update;
end;

end.



