{*******************************************************}
{                                                       }
{ CM Soluções Informática                               }
{ ** Todos os Direitos Reservados                       }
{ Gerada pelo "CM Bussines Object Builder"              }
{ Analista Responsável: Igor Maia                       }
{ Atualizado Em: 10/01/2002                             }
{                                                       }
{*******************************************************}

unit uDbTamanho;

interface

Uses uCmDbObject, uSistema, DB, uDataBase, sysUtils, uCmCustomCdbObject;

Type
  TDbTamanho = class(TCmDbObject)

  private
    FDesctamanho: TCmDbField;
    FCodtamanho: TCmDbField;
    procedure SetCodtamanho(const Value: TCmDbField);
    procedure SetDesctamanho(const Value: TCmDbField);
  public

     Property Desctamanho: TCmDbField read FDesctamanho write SetDesctamanho;
     Property Codtamanho: TCmDbField read FCodtamanho write SetCodtamanho;

     Constructor Create(aOwner : TCmCustomCdbObject ); Override;

     Function Insert :Boolean; Override;
     Function Update :Boolean; Override;
     Function Delete :Boolean; Override;
     Function LoadFromDb :Boolean; Override;
  End;

implementation

{ TDbTamanho }

constructor TDbTamanho.Create(aOwner : TCmCustomCdbObject );
begin
  inherited;
  ErrorIfNoRowsAffected := False;

  TableName := 'TAMANHO';

   fDesctamanho := CreateCmDbField('DESCTAMANHO',ftString,True,False,False,True,'Descrição');
   fCodtamanho  := CreateCmDbField('CODTAMANHO',ftString,False,True,False,True,'Código');
end;

function TDbTamanho.Delete: Boolean;
begin
   fCodtamanho.AsString := Copy(fCodtamanho.asString+'    ',1,3);
   Result := Inherited Delete;
end;


function TDbTamanho.Insert: Boolean;
begin

   Result := Inherited Insert;

end;

function TDbTamanho.LoadFromDB: Boolean;
begin

   Result := Inherited LoadFromDB;

end;

procedure TDbTamanho.SetCodtamanho(const Value: TCmDbField);
begin
  FCodtamanho := Value;
end;

procedure TDbTamanho.SetDesctamanho(const Value: TCmDbField);
begin
  FDesctamanho := Value;
end;

function TDbTamanho.Update: Boolean;
begin
   fCodtamanho.AsString := Copy(fCodtamanho.asString+'    ',1,3);
   Result := Inherited Update;
end;

end.



