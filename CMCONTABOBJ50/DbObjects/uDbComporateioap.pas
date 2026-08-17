{*******************************************************}
{                                                       }
{ CM Soluções Informática                               }
{ ** Todos os Direitos Reservados                       }
{ Gerada pelo "CM Bussines Object Builder"              }
{ Analista Responsável: Veronica Almeida                }
{ Atualizado Em: 20/08/2002                             }
{                                                       }
{*******************************************************}

unit uDbComporateioap;

interface

Uses uCmCustomCdbObject, uCmDbObject,  DB, uDataBase;

Type
  TDbComporateioap = class(TCmDbObject)

  private
    FPercrateio: TCmDbField;
    FIdpessoa: TCmDbField;
    FUnidnegoc: TCmDbField;
    FIdrateioapextra: TCmDbField;
    procedure SetIdpessoa(const Value: TCmDbField);
    procedure SetIdrateioapextra(const Value: TCmDbField);
    procedure SetPercrateio(const Value: TCmDbField);
    procedure SetUnidnegoc(const Value: TCmDbField);

  public

     Property Unidnegoc: TCmDbField read FUnidnegoc write SetUnidnegoc;
     Property Percrateio: TCmDbField read FPercrateio write SetPercrateio;
     Property Idrateioapextra: TCmDbField read FIdrateioapextra write SetIdrateioapextra;
     Property Idpessoa: TCmDbField read FIdpessoa write SetIdpessoa;

     Constructor Create(Aowner: TCmCustomCdbObject); Override;

     Function Insert :Boolean; Override;
  End;

implementation

{ TDbComporateioap }

constructor TDbComporateioap.Create(Aowner: TCmCustomCdbObject);
begin
  inherited;
  ErrorIfNoRowsAffected := False;

  TableName := 'COMPORATEIOAP';

   fUnidnegoc := CreateCmDbField('UNIDNEGOC',ftfloat,True,True,False,True,'');
   fPercrateio := CreateCmDbField('PERCRATEIO',ftfloat,False,False,False,True,'');
   fIdrateioapextra := CreateCmDbField('IDRATEIOAPEXTRA',ftfloat,True,True,False,True,'');
   fIdpessoa := CreateCmDbField('IDPESSOA',ftfloat,True,True,False,True,'');
end;

function TDbComporateioap.Insert: Boolean;
begin

   Result := Inherited Insert;

end;


procedure TDbComporateioap.SetIdpessoa(const Value: TCmDbField);
begin
  FIdpessoa := Value;
end;

procedure TDbComporateioap.SetIdrateioapextra(const Value: TCmDbField);
begin
  FIdrateioapextra := Value;
end;

procedure TDbComporateioap.SetPercrateio(const Value: TCmDbField);
begin
  FPercrateio := Value;
end;

procedure TDbComporateioap.SetUnidnegoc(const Value: TCmDbField);
begin
  FUnidnegoc := Value;
end;

end.



