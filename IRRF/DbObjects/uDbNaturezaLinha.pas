{*******************************************************}
{ Softtek                                               }
{ Analista Responsável: Arnaldo V. Scarin               }
{ Atualizado Em: 17/08/2011                             }
{*******************************************************}
//Responsável.....: Arnaldo Scarin
//Revisão.........: Paulo Nobre - 28/05/2012
Unit uDbNaturezaLinha;

Interface
Uses uCmDbObject, uSistema, DB, uDataBase, uCmCustomCdbObject;

Type
   TDBNaturezaLinha = Class(TCmDbObject)

   Private
      FIDNATUREZA: TCmDbField;
      FDESCRICAO: TCmDbField;
      Procedure SetDESCRICAO(Const Value: TCmDbField);
      Procedure SetIDNATUREZA(Const Value: TCmDbField);
   Public
      Property IDNATUREZA: TCmDbField Read FIDNATUREZA Write SetIDNATUREZA;
      Property DESCRICAO: TCmDbField Read FDESCRICAO Write SetDESCRICAO;

      Constructor Create(Aowner: TCmCustomCdbObject); Override;

      Function Insert: Boolean; Override;
      Function LoadFromDb: Boolean; Override;
   End;

Implementation

{ TDBNaturezaLinha }

Constructor TDBNaturezaLinha.Create(Aowner: TCmCustomCdbObject);
Begin
   Inherited;
   ErrorIfNoRowsAffected := False;

   TableName := 'NATUREZA_LINHA';

   fIDNATUREZA := CreateCmDbField('IDNATUREZA', // Nome do Campo
      ftFloat, // Tipo do Campo
      true, // Requerido
      false, // Primary Key
      false, // ReadOnly
      false, // Nulo se Zero
      ''); // Display Name
   fDESCRICAO := CreateCmDbField('DESCRICAO', // Nome do Campo
      ftString, // Tipo do Campo
      True, // Requerido
      false, // Primary Key
      false, // ReadOnly
      false, // Nulo se Zero
      ''); // Display Name
End;

Function TDBNaturezaLinha.Insert: Boolean;
Begin
   fIDNATUREZA.AsFloat := LeUltRegistro(Nil, 'NATUREZALINHA'); // PNOBRE  GetSequence('NaturezaLinha');
   Result := Inherited Insert;
End;

Function TDBNaturezaLinha.LoadFromDB: Boolean;
Begin
   Result := Inherited LoadFromDB;
End;

Procedure TDBNaturezaLinha.SetDESCRICAO(Const Value: TCmDbField);
Begin
   FDESCRICAO := Value;
End;

Procedure TDBNaturezaLinha.SetIDNATUREZA(Const Value: TCmDbField);
Begin
   FIDNATUREZA := Value;
End;

End.

