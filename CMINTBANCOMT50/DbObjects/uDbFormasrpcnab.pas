{*******************************************************}
{                                                       }
{ CM Soluções Informática                               }
{ ** Todos os Direitos Reservados                       }
{ Gerada pelo "CM Bussines Object Builder"              }
{ Analista Responsável: Nome do Desenvolvedor           }
{ Atualizado Em: 22/04/2008                             }
{                                                       }
{*******************************************************}

unit uDbFormasrpcnab;

interface

Uses uCmCustomCdbObject, uCmDbObject, DB, uDataBase;

Type
  TDbFormasrpcnab = class(TCmDbObject)

  private
    FCodformasrpcnab: TCmDbField;
    FIdmodeloscnab: TCmDbField;
    FIdformasrpcnab: TCmDbField;
    FDescformasrpcnab: TCmDbField;
    procedure SetCodformasrpcnab(const Value: TCmDbField);
    procedure SetDescformasrpcnab(const Value: TCmDbField);
    procedure SetIdformasrpcnab(const Value: TCmDbField);
    procedure SetIdmodeloscnab(const Value: TCmDbField);

  public

     Property Idmodeloscnab: TCmDbField read FIdmodeloscnab write SetIdmodeloscnab;
     Property Idformasrpcnab: TCmDbField read FIdformasrpcnab write SetIdformasrpcnab;
     Property Descformasrpcnab: TCmDbField read FDescformasrpcnab write SetDescformasrpcnab;
     Property Codformasrpcnab: TCmDbField read FCodformasrpcnab write SetCodformasrpcnab;

     Constructor Create(Aowner: TCmCustomCdbObject); Override;

     Function Insert :Boolean; Override;
  End;

implementation

{ TDbFormasrpcnab }

constructor TDbFormasrpcnab.Create(Aowner: TCmCustomCdbObject);
begin
  inherited;
  ErrorIfNoRowsAffected := False;

  TableName := 'FORMASRPCNAB';

   fIdmodeloscnab := CreateCmDbField('IDMODELOSCNAB',ftfloat,False,False,False,True,'');
   fIdformasrpcnab := CreateCmDbField('IDFORMASRPCNAB',ftfloat,True,True,False,True,'');
   fDescformasrpcnab := CreateCmDbField('DESCFORMASRPCNAB',ftString,False,False,False,True,'');
   fCodformasrpcnab := CreateCmDbField('CODFORMASRPCNAB',ftString,False,False,False,True,'');
end;

function TDbFormasrpcnab.Insert: Boolean;
begin

   fIdformasrpcnab.AsFloat := GetSequence('FORMASRPCNAB');
   Result := Inherited Insert;

end;


procedure TDbFormasrpcnab.SetCodformasrpcnab(const Value: TCmDbField);
begin
  FCodformasrpcnab := Value;
end;

procedure TDbFormasrpcnab.SetDescformasrpcnab(const Value: TCmDbField);
begin
  FDescformasrpcnab := Value;
end;

procedure TDbFormasrpcnab.SetIdformasrpcnab(const Value: TCmDbField);
begin
  FIdformasrpcnab := Value;
end;

procedure TDbFormasrpcnab.SetIdmodeloscnab(const Value: TCmDbField);
begin
  FIdmodeloscnab := Value;
end;

end.



