{*******************************************************}
{                                                       }
{ CM Soluções Informática                               }
{ ** Todos os Direitos Reservados                       }
{ Gerada pelo "CM Bussines Object Builder"              }
{ Analista Responsável: Nome do Desenvolvedor           }
{ Atualizado Em: 26/01/2006                             }
{                                                       }
{*******************************************************}

unit uDbAdmfdoinvest;

interface

Uses uCmCustomCdbObject, uCmDbObject, DB, uDataBase;

Type
  TDbAdmfdoinvest = class(TCmDbObject)

  private
    FDesadmfdoinvest: TCmDbField;
    FIdadmfdoinvest: TCmDbField;
    procedure SetDesadmfdoinvest(const Value: TCmDbField);
    procedure SetIdadmfdoinvest(const Value: TCmDbField);

  public

     Property Idadmfdoinvest: TCmDbField read FIdadmfdoinvest write SetIdadmfdoinvest;
     Property Desadmfdoinvest: TCmDbField read FDesadmfdoinvest write SetDesadmfdoinvest;

     Constructor Create(Aowner: TCmCustomCdbObject); Override;

     Function Insert :Boolean; Override;
  End;

implementation

{ TDbAdmfdoinvest }

constructor TDbAdmfdoinvest.Create(Aowner: TCmCustomCdbObject);
begin
  inherited;
  ErrorIfNoRowsAffected := False;

  TableName := 'ADMFDOINVEST';

   fIdadmfdoinvest := CreateCmDbField('IDADMFDOINVEST',ftfloat,True,True,False,True,'');
   fDesadmfdoinvest := CreateCmDbField('DESADMFDOINVEST',ftString,False,False,False,True,'');
end;

function TDbAdmfdoinvest.Insert: Boolean;
begin
   Result := Inherited Insert;
end;

procedure TDbAdmfdoinvest.SetDesadmfdoinvest(const Value: TCmDbField);
begin
  FDesadmfdoinvest := Value;
end;

procedure TDbAdmfdoinvest.SetIdadmfdoinvest(const Value: TCmDbField);
begin
  FIdadmfdoinvest := Value;
end;

end.



