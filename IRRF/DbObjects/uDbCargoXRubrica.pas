{*******************************************************}
{ Softtek                                               }
{ Analista Responsável: Arnaldo V. Scarin               }
{ Atualizado Em: 17/08/2011                             }
{*******************************************************}
//Responsável.....: Arnaldo Scarin
//Revisão.........: Paulo Nobre - 28/05/2012
Unit uDbCargoXRubrica;

Interface
Uses uCmDbObject, uSistema, DB, uDataBase, uCmCustomCdbObject;

Type
   TDBCargoxRubrica = Class(TCmDbObject)

   Private
      FIdCargo: TCmDbField;
      FIDASSOCIACAO: TCmDbField;
      FIdProvento: TCmDbField;
      FIDNorma: TCmDbField;
      FIdDesconto: TCmDbField;
      Procedure SetIDASSOCIACAO(Const Value: TCmDbField);
      Procedure SetIDNorma(Const Value: TCmDbField);
      Procedure SetIDCargo(Const Value: TCmDbField);
      Procedure SetIDProvento(Const Value: TCmDbField);
      Procedure SetIdDesconto(Const Value: TCmDbField);
   Public
      Property IDASSOCIACAO: TCmDbField Read FIDASSOCIACAO Write SetIDASSOCIACAO;
      Property IDNorma: TCmDbField Read FIDNorma Write SetIDNorma;
      Property IDProvento: TCmDbField Read FIDProvento Write SetIDProvento;
      Property IDCargo: TCmDbField Read FIDCargo Write SetIDCargo;
      Property IdDesconto: TCmDbField Read FIdDesconto Write SetIdDesconto;

      Constructor Create(Aowner: TCmCustomCdbObject); Override;

      Function Insert: Boolean; Override;
      Function LoadFromDb: Boolean; Override;
   End;

Implementation

{ TDBNormaVigente }

Constructor TDBCargoxRubrica.Create(Aowner: TCmCustomCdbObject);
Begin
   Inherited;
   ErrorIfNoRowsAffected := False;

   TableName := 'CargoxRubrica';

   fIDASSOCIACAO := CreateCmDbField('IDASSOCIACAO', // Nome do Campo
      ftFloat, // Tipo do Campo
      true, // Requerido
      false, // Primary Key
      false, // ReadOnly
      false, // Nulo se Zero
      ''); // Display Name
   fIDNorma := CreateCmDbField('IDNorma', // Nome do Campo
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
   fIdCargo := CreateCmDbField('IdCargo', // Nome do Campo
      ftFloat, // Tipo do Campo
      False, // Requerido
      false, // Primary Key
      false, // ReadOnly
      false, // Nulo se Zero
      ''); // Display Name
   fIdDesconto := CreateCmDbField('FlgDesconto', // Nome do Campo
      ftFloat, // Tipo do Campo
      False, // Requerido
      false, // Primary Key
      false, // ReadOnly
      false, // Nulo se Zero
      ''); // Display Name

End;

Function TDBCargoxRubrica.Insert: Boolean;
Begin
   fIDASSOCIACAO.AsFloat := LeUltRegistro(Nil, 'CARGOXRUBRICA'); // pnobre GetSequence('CargoxRubrica');
   Result := Inherited Insert;
End;

Function TDBCargoxRubrica.LoadFromDb: Boolean;
Begin
   Result := Inherited LoadFromDB;
End;

Procedure TDBCargoxRubrica.SetIDASSOCIACAO(Const Value: TCmDbField);
Begin
   FIDASSOCIACAO := Value;
End;

Procedure TDBCargoxRubrica.SetIDCargo(Const Value: TCmDbField);
Begin
   FIDCargo := Value;
End;

Procedure TDBCargoxRubrica.SetIDNorma(Const Value: TCmDbField);
Begin
   FIDNorma := Value;
End;

Procedure TDBCargoxRubrica.SetIDProvento(Const Value: TCmDbField);
Begin
   FIDProvento := Value;
End;

Procedure TDBCargoxRubrica.SetIdDesconto(Const Value: TCmDbField);
Begin
   FIdDesconto := Value;
End;


End.

