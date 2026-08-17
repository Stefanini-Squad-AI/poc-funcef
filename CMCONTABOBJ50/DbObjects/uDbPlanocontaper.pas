{*******************************************************}
{                                                       }
{ CM Soluções Informática                               }
{ ** Todos os Direitos Reservados                       }
{ Gerada pelo "CM Bussines Object Builder"              }
{ Analista Responsável: Veronica Almeida                }
{ Atualizado Em: 16/08/2002                             }
{                                                       }
{*******************************************************}

unit uDbPlanocontaper;

interface

Uses uCmCustomCdbObject, uCmDbObject, DB, uDataBase;

Type
  TDbPlanocontaper = class(TCmDbObject)

  private
    FPlaconta: TCmDbField;
    FPlatipo: TCmDbField;
    FPlanome: TCmDbField;
    FIdpessoa: TCmDbField;
    FPerexercicio: TCmDbField;
    FPernumero: TCmDbField;
    FIdplanocontaper: TCmDbField;
    FPlano: TCmDbField;
    FPlaInativa: TCmDbField;
    procedure SetIdpessoa(const Value: TCmDbField);
    procedure SetIdplanocontaper(const Value: TCmDbField);
    procedure SetPerexercicio(const Value: TCmDbField);
    procedure SetPernumero(const Value: TCmDbField);
    procedure SetPlaconta(const Value: TCmDbField);
    procedure SetPlano(const Value: TCmDbField);
    procedure SetPlanome(const Value: TCmDbField);
    procedure SetPlatipo(const Value: TCmDbField);
    procedure SetPlaInativa(const Value: TCmDbField);

  public
     Property Platipo: TCmDbField read FPlatipo write SetPlatipo;
     Property PlaInativa: TCmDbField read FPlaInativa write SetPlaInativa;
     Property Planome: TCmDbField read FPlanome write SetPlanome;
     Property Plano: TCmDbField read FPlano write SetPlano;
     Property Placonta: TCmDbField read FPlaconta write SetPlaconta;
     Property Pernumero: TCmDbField read FPernumero write SetPernumero;
     Property Perexercicio: TCmDbField read FPerexercicio write SetPerexercicio;
     Property Idplanocontaper: TCmDbField read FIdplanocontaper write SetIdplanocontaper;
     Property Idpessoa: TCmDbField read FIdpessoa write SetIdpessoa;

     Constructor Create(Aowner: TCmCustomCdbObject); Override;

     Function Insert :Boolean; Override;
  End;

implementation

{ TDbPlanocontaper }

constructor TDbPlanocontaper.Create(Aowner: TCmCustomCdbObject);
begin
  inherited;
  ErrorIfNoRowsAffected := False;

  TableName := 'PLANOCONTAPER';

   fPlatipo         := CreateCmDbField('PLATIPO',ftString,False,False,False,True,'');
   fPlaInativa      := CreateCmDbField('PLAINATIVA',ftString,False,False,False,True,'');
   fPlanome         := CreateCmDbField('PLANOME',ftString,False,False,False,True,'');
   fPlano           := CreateCmDbField('PLANO',ftfloat,False,False,False,True,'');
   fPlaconta        := CreateCmDbField('PLACONTA',ftString,False,False,False,True,'');
   fPernumero       := CreateCmDbField('PERNUMERO',ftfloat,False,False,False,True,'');
   fPerexercicio    := CreateCmDbField('PEREXERCICIO',ftfloat,False,False,False,True,'');
   fIdplanocontaper := CreateCmDbField('IDPLANOCONTAPER',ftfloat,True,True,False,True,'');
   fIdpessoa        := CreateCmDbField('IDPESSOA',ftfloat,False,False,False,True,'');
end;

function TDbPlanocontaper.Insert: Boolean;
begin

   fIdplanocontaper.AsFloat := GetSequence('PLANOCONTAPER');
   Result := Inherited Insert;

end;


procedure TDbPlanocontaper.SetIdpessoa(const Value: TCmDbField);
begin
  FIdpessoa := Value;
end;

procedure TDbPlanocontaper.SetIdplanocontaper(const Value: TCmDbField);
begin
  FIdplanocontaper := Value;
end;

procedure TDbPlanocontaper.SetPerexercicio(const Value: TCmDbField);
begin
  FPerexercicio := Value;
end;

procedure TDbPlanocontaper.SetPernumero(const Value: TCmDbField);
begin
  FPernumero := Value;
end;

procedure TDbPlanocontaper.SetPlaconta(const Value: TCmDbField);
begin
  FPlaconta := Value;
end;

procedure TDbPlanocontaper.SetPlaInativa(const Value: TCmDbField);
begin
  FPlaInativa := Value;
end;

procedure TDbPlanocontaper.SetPlano(const Value: TCmDbField);
begin
  FPlano := Value;
end;

procedure TDbPlanocontaper.SetPlanome(const Value: TCmDbField);
begin
  FPlanome := Value;
end;

procedure TDbPlanocontaper.SetPlatipo(const Value: TCmDbField);
begin
  FPlatipo := Value;
end;


end.



