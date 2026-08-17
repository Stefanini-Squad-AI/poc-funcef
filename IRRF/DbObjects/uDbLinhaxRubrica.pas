{*******************************************************}
{ Softtek                                               }
{ Analista Responsável: Arnaldo V. Scarin               }
{ Atualizado Em: 17/08/2011                             }
{*******************************************************}
//Responsável.....: Arnaldo Scarin
//Revisão.........: Paulo Nobre - 28/05/2012
Unit uDbLinhaxRubrica;

Interface
Uses uCmDbObject, uSistema, DB, uDataBase, uCmCustomCdbObject;

Type
   TDBLinhaxRubrica = Class(TCmDbObject)

   Private
      FIDASSOCIACAO: TCmDbField;
      FIdProvento: TCmDbField;
      FIDLinha: TCmDbField;
      Procedure SetIDASSOCIACAO(Const Value: TCmDbField);
      Procedure SetIDLinha(Const Value: TCmDbField);
      Procedure SetIDProvento(Const Value: TCmDbField);
   Public
      Property IDASSOCIACAO: TCmDbField Read FIDASSOCIACAO Write SetIDASSOCIACAO;
      Property IDLinha: TCmDbField Read FIDLinha Write SetIDLinha;
      Property IDProvento: TCmDbField Read FIDProvento Write SetIDProvento;

      Constructor Create(Aowner: TCmCustomCdbObject); Override;

      Function Insert: Boolean; Override;
      Function LoadFromDb: Boolean; Override;
   End;

Implementation

{ TDBNormaVigente }

Constructor TDBLinhaxRubrica.Create(Aowner: TCmCustomCdbObject);
Begin
   Inherited;
   ErrorIfNoRowsAffected := False;

   TableName := 'LinhaxRubrica';

   fIDASSOCIACAO := CreateCmDbField('IDASSOCIACAO', // Nome do Campo
      ftFloat, // Tipo do Campo
      true, // Requerido
      false, // Primary Key
      false, // ReadOnly
      false, // Nulo se Zero
      ''); // Display Name
   fIDLinha := CreateCmDbField('IDLinha', // Nome do Campo
      ftFloat, // Tipo do Campo
      False, // Requerido
      false, // Primary Key
      false, // ReadOnly
      false, // Nulo se Zero
      ''); // Display Name
   fIdProvento := CreateCmDbField('IdProvento', // Nome do Campo
      ftFloat, // Tipo do Campo
      False, // Requerido
      false, // Primary Key
      false, // ReadOnly
      false, // Nulo se Zero
      ''); // Display Name
End;

Function TDBLinhaxRubrica.Insert: Boolean;
Begin
   fIDASSOCIACAO.AsFloat := LeUltRegistro(Nil, 'LINHAXRUBRICA'); // pnobre GetSequence('LinhaxRubrica');
   Result := Inherited Insert;
End;

Function TDBLinhaxRubrica.LoadFromDb: Boolean;
Begin
   Result := Inherited LoadFromDB;
End;

Procedure TDBLinhaxRubrica.SetIDASSOCIACAO(Const Value: TCmDbField);
Begin
   FIDASSOCIACAO := Value;
End;

Procedure TDBLinhaxRubrica.SetIDLinha(Const Value: TCmDbField);
Begin
   FIDLinha := Value;
End;

Procedure TDBLinhaxRubrica.SetIDProvento(Const Value: TCmDbField);
Begin
   FIDProvento := Value;
End;

End.

