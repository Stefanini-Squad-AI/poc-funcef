{*******************************************************}
{                                                       }
{ CM Soluções Informática                               }
{ ** Todos os Direitos Reservados                       }
{ Gerada pelo "CM Bussines Object Builder"              }
{ Analista Responsável: Veronioca Almoeda               }
{ Atualizado Em: 20/08/2002                             }
{                                                       }
{*******************************************************}

unit uDbRateioapextra;

interface

Uses uCmCustomCdbObject, uCmDbObject, DB, uDataBase;

Type
  TDbRateioapextra = class(TCmDbObject)

  private
    FIdpessoa: TCmDbField;
    FNomerateio: TCmDbField;
    FIdrateioapextra: TCmDbField;
    FUnidnegoc: TCmDbField;
    procedure SetIdpessoa(const Value: TCmDbField);
    procedure SetIdrateioapextra(const Value: TCmDbField);
    procedure SetNomerateio(const Value: TCmDbField);
    procedure SetUnidnegoc(const Value: TCmDbField);

  public

     Property Unidnegoc: TCmDbField read FUnidnegoc write SetUnidnegoc;
     Property Nomerateio: TCmDbField read FNomerateio write SetNomerateio;
     Property Idrateioapextra: TCmDbField read FIdrateioapextra write SetIdrateioapextra;
     Property Idpessoa: TCmDbField read FIdpessoa write SetIdpessoa;

     Constructor Create(Aowner: TCmCustomCdbObject); Override;

     Function Insert :Boolean; Override;
  End;

implementation

{ TDbRateioapextra }

constructor TDbRateioapextra.Create(Aowner: TCmCustomCdbObject);
begin
  inherited;
  ErrorIfNoRowsAffected := False;

  TableName := 'RATEIOAPEXTRA';

   fUnidnegoc := CreateCmDbField('UNIDNEGOC',ftfloat,False,False,False,True,'');
   fNomerateio := CreateCmDbField('NOMERATEIO',ftString,False,False,False,True,'');
   fIdrateioapextra := CreateCmDbField('IDRATEIOAPEXTRA',ftfloat,True,True,False,True,'');
   fIdpessoa := CreateCmDbField('IDPESSOA',ftfloat,False,False,False,True,'');
end;

function TDbRateioapextra.Insert: Boolean;
begin

   fIdrateioapextra.AsFloat := GetSequence('RATEIOAPEXTRA');
   Result := Inherited Insert;

end;


procedure TDbRateioapextra.SetIdpessoa(const Value: TCmDbField);
begin
  FIdpessoa := Value;
end;

procedure TDbRateioapextra.SetIdrateioapextra(const Value: TCmDbField);
begin
  FIdrateioapextra := Value;
end;

procedure TDbRateioapextra.SetNomerateio(const Value: TCmDbField);
begin
  FNomerateio := Value;
end;

procedure TDbRateioapextra.SetUnidnegoc(const Value: TCmDbField);
begin
  FUnidnegoc := Value;
end;

end.



