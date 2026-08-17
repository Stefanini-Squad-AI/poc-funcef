{*******************************************************}
{                                                       }
{ CM Soluções Informática                               }
{ ** Todos os Direitos Reservados                       }
{ Gerada pelo "CM Bussines Object Builder"              }
{ Analista Responsável: Veronica Almeida                }
{ Atualizado Em: 03/01/2003                             }
{                                                       }
{*******************************************************}

unit uDbDiasbloqmod;

interface

Uses uCmCustomCdbObject, uCmDbObject, DB, uDataBase;

Type
  TDbDiasbloqmod = class(TCmDbObject)

  private
    FIdpessoa: TCmDbField;
    FNumdias: TCmDbField;
    FIdmodulo: TCmDbField;
    procedure SetIdmodulo(const Value: TCmDbField);
    procedure SetIdpessoa(const Value: TCmDbField);
    procedure SetNumdias(const Value: TCmDbField);

  public

     Property Numdias: TCmDbField read FNumdias write SetNumdias;
     Property Idpessoa: TCmDbField read FIdpessoa write SetIdpessoa;
     Property Idmodulo: TCmDbField read FIdmodulo write SetIdmodulo;

     Constructor Create(Aowner: TCmCustomCdbObject); Override;

     Function Insert :Boolean; Override;
  End;

implementation

{ TDbDiasbloqmod }

constructor TDbDiasbloqmod.Create(Aowner: TCmCustomCdbObject);
begin
  inherited;
  ErrorIfNoRowsAffected := False;

  TableName := 'DIASBLOQMOD';

   fNumdias := CreateCmDbField('NUMDIAS',ftfloat,True,False,False,False,'');
   fIdpessoa := CreateCmDbField('IDPESSOA',ftfloat,True,True,False,True,'');
   fIdmodulo := CreateCmDbField('IDMODULO',ftfloat,True,True,False,True,'');
end;

function TDbDiasbloqmod.Insert: Boolean;
begin
   Result := Inherited Insert;

end;


procedure TDbDiasbloqmod.SetIdmodulo(const Value: TCmDbField);
begin
  FIdmodulo := Value;
end;

procedure TDbDiasbloqmod.SetIdpessoa(const Value: TCmDbField);
begin
  FIdpessoa := Value;
end;

procedure TDbDiasbloqmod.SetNumdias(const Value: TCmDbField);
begin
  FNumdias := Value;
end;

end.



