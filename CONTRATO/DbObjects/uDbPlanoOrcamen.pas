{*******************************************************}
{                                                       }
{ CM Soluções Informática                               }
{ ** Todos os Direitos Reservados                       }
{ Gerada pelo "CM Bussines Object Builder"              }
{ Analista Responsável: Davi Ramos                      }
{ Atualizado Em: 05/04/2002                             }
{                                                       }
{*******************************************************}
Unit uDbPlanoOrcamen;

Interface
Uses uCmCustomCdbObject, uCmDbObject, DB, uDataBase;

Type
  TDbPlanoOrcamen = class(TCmDbObject)

  Private
    FNomeplanoorc  : TCmDbField;
    FIdplanoorcamen: TCmDbField;
    FMascaraGrupo: TCmDbField;

    Procedure SetNomeplanoorc(const Value: TCmDbField);
    Procedure SetIdplanoorcamen(const Value: TCmDbField);
    procedure SetMascaraGrupo(const Value: TCmDbField);

  Public

    Property Nomeplanoorc   : TCmDbField Read FNomeplanoorc   Write SetNomeplanoorc;
    Property MascaraGrupo   : TCmDbField Read FMascaraGrupo   Write SetMascaraGrupo;
    Property Idplanoorcamen : TCmDbField Read FIdplanoorcamen Write SetIdplanoorcamen;

    Constructor Create( Aowner: TCmCustomCdbObject); Override;

    Function Insert :Boolean; Override;
    Function LoadFromDb :Boolean; Override;
  End;

Implementation

{ TDbPlanoOrcamen }
//************************************************
Constructor TDbPlanoOrcamen.Create( Aowner: TCmCustomCdbObject);
Begin
  Inherited;
  ErrorIfNoRowsAffected := False;

  TableName := 'PLANOORCAMENTARIO';

  FNomeplanoorc   := CreateCmDbField('NOMEPLANOORC',   ftString, True, False, False, True, 'Nome do Plano Orçamentário' );
  FMascaraGrupo   := CreateCmDbField('MASCARAGRUPO',   ftString, True, False, False, True, 'Máscara dos Grupos Orçamentários' );
  FIdplanoorcamen := CreateCmDbField('IDPLANOORCAMEN', ftfloat,  True, True,  False, True, 'Código do Plano Orçamentário' );
End;
//************************************************
Function TDbPlanoOrcamen.Insert: Boolean;
Begin

   fIdplanoorcamen.AsFloat := GetSequence('PLANOORCAMENTARIO');
   Result := Inherited Insert;

End;
//************************************************
Function TDbPlanoOrcamen.LoadFromDB: Boolean;
Begin

   Result := Inherited LoadFromDB;

End;
//************************************************
Procedure TDbPlanoOrcamen.SetIdplanoorcamen(const Value: TCmDbField);
Begin

  FIdplanoorcamen := Value;
End;
//************************************************
procedure TDbPlanoOrcamen.SetMascaraGrupo(const Value: TCmDbField);
begin
  FMascaraGrupo := Value;
end;

Procedure TDbPlanoOrcamen.SetNomeplanoorc(const Value: TCmDbField);
Begin

  FNomeplanoorc := Value;
End;
//************************************************
End.

