{*******************************************************}
{                                                       }
{ CM Soluções Informática                               }
{ ** Todos os Direitos Reservados                       }
{ Gerada pelo "CM Bussines Object Builder"              }
{ Analista Responsável: Nome do Desenvolvedor           }
{ Atualizado Em: 13/12/2003                             }
{                                                       }
{*******************************************************}

unit uDbPlanoPatroxImovel;

interface

Uses uCmCustomCdbObject, uCmDbObject, DB, uDataBase;

Type
  TDbPlanoPatroxImovel = class(TCmDbObject)

  private
    FIdplanoprev: TCmDbField;
    FIdpatro: TCmDbField;
    FIdimovel: TCmDbField;
    FPpipercentrateio: TCmDbField;
    FFlgTipo: TCmDbField;
    procedure SetIdimovel(const Value: TCmDbField);
    procedure SetIdpatro(const Value: TCmDbField);
    procedure SetIdplanoprev(const Value: TCmDbField);
    procedure SetPpipercentrateio(const Value: TCmDbField);
    procedure SetFlgTipo(const Value: TCmDbField); // Marcio Motta - 31/05/2004 - 16859

  public

     Property Ppipercentrateio : TCmDbField read FPpipercentrateio write SetPpipercentrateio;
     Property Idplanoprev      : TCmDbField read FIdplanoprev write SetIdplanoprev;
     Property Idpatro          : TCmDbField read FIdpatro write SetIdpatro;
     Property Idimovel         : TCmDbField read FIdimovel write SetIdimovel;
     Property FlgTipo          : TCmDbField read FFlgTipo write SetFlgTipo; // Marcio Motta - 31/05/2004 - 16859

     Constructor Create(Aowner: TCmCustomCdbObject); Override;

     Function Insert :Boolean; Override;
  End;

implementation

{ TDbPlanoPatroxImovel }

constructor TDbPlanoPatroxImovel.Create(Aowner: TCmCustomCdbObject);
begin
  inherited;
  ErrorIfNoRowsAffected := False;

  TableName := 'PLANOPATROXIMOVEL';

  fPpipercentrateio := CreateCmDbField('PPIPERCENTRATEIO',ftfloat,False,False,False,True,'');
  fIdplanoprev      := CreateCmDbField('IDPLANOPREV',ftfloat,True,True,False,True,'');
  fIdpatro          := CreateCmDbField('IDPATRO',ftfloat,True,True,False,True,'');
  fIdimovel         := CreateCmDbField('IDIMOVEL',ftfloat,True,True,False,True,'');
  fFlgTipo          := CreateCmDbField('FLGTIPO',ftString ,False,False,False,True,'');
end;

function TDbPlanoPatroxImovel.Insert: Boolean;
begin
   Result := Inherited Insert;
end;


procedure TDbPlanoPatroxImovel.SetFlgTipo(const Value: TCmDbField);
begin
  FFlgTipo := Value;
end;

procedure TDbPlanoPatroxImovel.SetIdimovel(const Value: TCmDbField);
begin
  FIdimovel := Value;
end;

procedure TDbPlanoPatroxImovel.SetIdpatro(const Value: TCmDbField);
begin
  FIdpatro := Value;
end;

procedure TDbPlanoPatroxImovel.SetIdplanoprev(const Value: TCmDbField);
begin
  FIdplanoprev := Value;
end;

procedure TDbPlanoPatroxImovel.SetPpipercentrateio(
  const Value: TCmDbField);
begin
  FPpipercentrateio := Value;
end;

end.



