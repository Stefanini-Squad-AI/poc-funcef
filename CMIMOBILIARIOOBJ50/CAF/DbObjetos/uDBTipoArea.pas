{*******************************************************}
{                                                       }
{ CM Soluções Informática                               }
{ ** Todos os Direitos Reservados                       }
{ Gerada pelo "CM Bussines Object Builder"              }
{ Analista Responsável: Sergio Fernandes de Almeida     }
{ Atualizado Em: 21/02/2002                             }
{                                                       }
{*******************************************************}

unit uDBTipoArea;

interface

Uses uCmDbObject, uSistema, DB, uDataBase;

Type
  TDBTipoArea = class(TCmDbObject)

  private
    FDesctipoarea: TCmDbField;
    FIdtipoarea: TCmDbField;
    procedure SetDesctipoarea(const Value: TCmDbField);
    procedure SetIdtipoarea(const Value: TCmDbField);

  public

     Property Idtipoarea: TCmDbField read FIdtipoarea write SetIdtipoarea;
     Property Desctipoarea: TCmDbField read FDesctipoarea write SetDesctipoarea;

     Constructor Create; Override;

     Function Insert :Boolean; Override;
     Function LoadFromDb :Boolean; Override;
  End;

implementation

{ TDBTipoArea }

constructor TDBTipoArea.Create;
begin
  inherited;
  ErrorIfNoRowsAffected := False;

  TableName := 'TIPOAREA';

   fIdtipoarea := CreateCmDbField('IDTIPOAREA',ftfloat,True,True,False,True,'');
   fDesctipoarea := CreateCmDbField('DESCTIPOAREA',ftString,True,False,False,True,'');
end;

function TDBTipoArea.Insert: Boolean;
begin

   fIdtipoarea.AsFloat := GetSequence('TIPOAREA');
   Result := Inherited Insert;

end;

function TDBTipoArea.LoadFromDB: Boolean;
begin

   Result := Inherited LoadFromDB;

end;

procedure TDBTipoArea.SetDesctipoarea(const Value: TCmDbField);
begin
  FDesctipoarea := Value;
end;

procedure TDBTipoArea.SetIdtipoarea(const Value: TCmDbField);
begin
  FIdtipoarea := Value;
end;

end.



