{*******************************************************}
{                                                       }
{ CM Soluções Informática                               }
{ ** Todos os Direitos Reservados                       }
{ Gerada pelo "CM Bussines Object Builder"              }
{ Analista Responsável: Davi Ramos                      }
{ Atualizado Em: 18/06/2002                             }
{                                                       }
{*******************************************************}
Unit uDbDesenhoOrc;

Interface

Uses
  uCmCustomCdbObject, uCmDbObject, DB, uDataBase;

Type
  TDbDesenhoOrc = class(TCmDbObject)

  Private

    FOrigemcm      : TCmDbField;
    FNomelayout    : TCmDbField;
    FIdreports     : TCmDbField;
    FIdrelatorc    : TCmDbField;
    FIddesenhoorc  : TCmDbField;
    FFlgtipolayout : TCmDbField;

    Procedure SetOrigemcm      ( Const Value : TCMDbField );
    Procedure SetNomelayout    ( Const Value : TCMDbField );
    Procedure SetIdreports     ( Const Value : TCMDbField );
    Procedure SetIdrelatorc    ( Const Value : TCMDbField );
    Procedure SetIddesenhoorc  ( Const Value : TCMDbField );
    Procedure SetFlgtipolayout ( Const Value : TCMDbField );

  public

    Constructor Create(Aowner: TCmCustomCdbObject); Override;

    Function Insert :Boolean; Override;

    Property Origemcm      : TCmDbField Read FOrigemcm      Write SetOrigemcm;
    Property Nomelayout    : TCmDbField Read FNomelayout    Write SetNomelayout;
    Property Idreports     : TCmDbField Read FIdreports     Write SetIdreports;
    Property Idrelatorc    : TCmDbField Read FIdrelatorc    Write SetIdrelatorc;
    Property Iddesenhoorc  : TCmDbField Read FIddesenhoorc  Write SetIddesenhoorc;
    Property Flgtipolayout : TCmDbField Read FFlgtipolayout Write SetFlgtipolayout;
  End;

implementation

{ TDbDesenhoOrc }
//************************************************
constructor TDbDesenhoOrc.Create(Aowner: TCmCustomCdbObject);
begin
  inherited;
  ErrorIfNoRowsAffected := False;

  TableName := 'DESENHOORC';

  fOrigemcm      := CreateCmDbField(  'ORIGEMCM',     ftfloat , False, False, False, False, '' );
  fNomelayout    := CreateCmDbField(  'NOMELAYOUT',   ftString, False, False, False, True,  '' );
  fIdreports     := CreateCmDbField(  'IDREPORTS',    ftfloat , False, False, False, True,  '' );
  fIdrelatorc    := CreateCmDbField(  'IDRELATORC',   ftfloat , False, False, False, True,  '' );
  fIddesenhoorc  := CreateCmDbField(  'IDDESENHOORC', ftfloat , True,  True,  False, True,  '' );
  fFlgtipolayout := CreateCmDbField(  'FLGTIPOLAYOUT',ftString, False, False, False, True,  '' );
end;
//************************************************
Function TDbDesenhoOrc.Insert: Boolean;
Begin

  If ( fIddesenhoorc.AsFloat < 1 ) Then Begin

    fIddesenhoorc.AsFloat := GetSequence('DESENHOORC');
  End;

  Result := Inherited Insert;
End;
//************************************************
procedure TDbDesenhoOrc.SetFlgtipolayout( const Value: TCMDbField );
begin

  FFlgtipolayout := Value;
end;
//************************************************
procedure TDbDesenhoOrc.SetIddesenhoorc( const Value: TCMDbField );
begin

  FIddesenhoorc := Value;
end;
//************************************************
procedure TDbDesenhoOrc.SetIdrelatorc( const Value: TCMDbField );
begin

  FIdrelatorc := Value;
end;
//************************************************
procedure TDbDesenhoOrc.SetIdreports( const Value: TCMDbField );
begin

  FIdreports := Value;
end;
//************************************************
procedure TDbDesenhoOrc.SetNomelayout( const Value: TCMDbField );
begin

  FNomelayout := Value;
end;
//************************************************
procedure TDbDesenhoOrc.SetOrigemcm( const Value: TCMDbField );
begin

  FOrigemcm := Value;
end;
//************************************************
end.

