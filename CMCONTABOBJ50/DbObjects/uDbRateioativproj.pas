{*******************************************************}
{                                                       }
{ CM Soluções Informática                               }
{ ** Todos os Direitos Reservados                       }
{ Gerada pelo "CM Bussines Object Builder"              }
{ Analista Responsável: Veronica Almeida                }
{ Atualizado Em: 19/08/2002                             }
{                                                       }
{*******************************************************}

unit uDbRateioativproj;

interface

Uses uCmCustomCdbObject, uCmDbObject, DB, uDataBase;

Type
  TDbRateioativproj = class(TCmDbObject)

  private
    FPerexercicio: TCmDbField;
    FPernumero: TCmDbField;
    FIdpessoa: TCmDbField;
    FIdrateioativproj: TCmDbField;
    FUnidnegoc: TCmDbField;
    FVlrrateio: TCmDbField;
    procedure SetIdpessoa(const Value: TCmDbField);
    procedure SetIdrateioativproj(const Value: TCmDbField);
    procedure SetPerexercicio(const Value: TCmDbField);
    procedure SetPernumero(const Value: TCmDbField);
    procedure SetUnidnegoc(const Value: TCmDbField);
    procedure SetVlrrateio(const Value: TCmDbField);

  public

     Property Vlrrateio: TCmDbField read FVlrrateio write SetVlrrateio;
     Property Unidnegoc: TCmDbField read FUnidnegoc write SetUnidnegoc;
     Property Pernumero: TCmDbField read FPernumero write SetPernumero;
     Property Perexercicio: TCmDbField read FPerexercicio write SetPerexercicio;
     Property Idrateioativproj: TCmDbField read FIdrateioativproj write SetIdrateioativproj;
     Property Idpessoa: TCmDbField read FIdpessoa write SetIdpessoa;

     Constructor Create(Aowner: TCmCustomCdbObject); Override;

     Function Insert :Boolean; Override;

  End;

implementation

{ TDbRateioativproj }

constructor TDbRateioativproj.Create(Aowner: TCmCustomCdbObject);
begin
  inherited;
  ErrorIfNoRowsAffected := False;

  TableName := 'RATEIOATIVPROJ';

   fVlrrateio := CreateCmDbField('VLRRATEIO',ftfloat,False,False,False,True,'');
   fUnidnegoc := CreateCmDbField('UNIDNEGOC',ftfloat,False,False,False,True,'');
   fPernumero := CreateCmDbField('PERNUMERO',ftfloat,False,False,False,True,'');
   fPerexercicio := CreateCmDbField('PEREXERCICIO',ftfloat,False,False,False,True,'');
   fIdrateioativproj := CreateCmDbField('IDRATEIOATIVPROJ',ftfloat,True,True,False,True,'');
   fIdpessoa := CreateCmDbField('IDPESSOA',ftfloat,False,False,False,True,'');
end;

function TDbRateioativproj.Insert: Boolean;
begin

   fIdrateioativproj.AsFloat := GetSequence('RATEIOATIVPROJ');
   Result := Inherited Insert;

end;



procedure TDbRateioativproj.SetIdpessoa(const Value: TCmDbField);
begin
  FIdpessoa := Value;
end;

procedure TDbRateioativproj.SetIdrateioativproj(const Value: TCmDbField);
begin
  FIdrateioativproj := Value;
end;

procedure TDbRateioativproj.SetPerexercicio(const Value: TCmDbField);
begin
  FPerexercicio := Value;
end;

procedure TDbRateioativproj.SetPernumero(const Value: TCmDbField);
begin
  FPernumero := Value;
end;

procedure TDbRateioativproj.SetUnidnegoc(const Value: TCmDbField);
begin
  FUnidnegoc := Value;
end;

procedure TDbRateioativproj.SetVlrrateio(const Value: TCmDbField);
begin
  FVlrrateio := Value;
end;

end.



