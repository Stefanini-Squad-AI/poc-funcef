{*******************************************************}
{                                                       }
{ CM Soluções Informática                               }
{ ** Todos os Direitos Reservados                       }
{ Gerada pelo "CM Bussines Object Builder"              }
{ Analista Responsável: Sergio Fernandes de Almeida     }
{ Atualizado Em: 22/02/2002                             }
{                                                       }
{*******************************************************}

unit uDBObraTipoEtapa;

interface

Uses uCmDbObject, uSistema, DB, uDataBase;

Type
  TDBObraTipoEtapa = class(TCmDbObject)

  private
     FDescobratipoetapa: TCmDbField;
     FIdobratipoetapa: TCmDbField;
     procedure SetDescobratipoetapa(const Value: TCmDbField);
     procedure SetIdobratipoetapa(const Value: TCmDbField);

  public
     Property Idobratipoetapa: TCmDbField read FIdobratipoetapa write SetIdobratipoetapa;
     Property Descobratipoetapa: TCmDbField read FDescobratipoetapa write SetDescobratipoetapa;

     Constructor Create; Override;

     Function Insert :Boolean; Override;
     Function LoadFromDb :Boolean; Override;

  End;

implementation

{ TDBObraTipoEtapa }

constructor TDBObraTipoEtapa.Create;
begin
   inherited;
   ErrorIfNoRowsAffected := False;

   TableName := 'CAFOBRATIPOETAPA';

   fIdobratipoetapa := CreateCmDbField('IDOBRATIPOETAPA',ftfloat,True,True,False,True,'');
   fDescobratipoetapa := CreateCmDbField('DESCOBRATIPOETAPA',ftString,False,False,False,True,'');
end;

function TDBObraTipoEtapa.Insert: Boolean;
begin
   fIdobratipoetapa.AsFloat := GetSequence('CAFOBRATIPOETAPA');
   Result := Inherited Insert;
end;

function TDBObraTipoEtapa.LoadFromDB: Boolean;
begin
   Result := Inherited LoadFromDB;
end;

procedure TDBObraTipoEtapa.SetDescobratipoetapa(const Value: TCmDbField);
begin
   FDescobratipoetapa := Value;
end;

procedure TDBObraTipoEtapa.SetIdobratipoetapa(const Value: TCmDbField);
begin
   FIdobratipoetapa := Value;
end;

end.



