{*******************************************************}
{ Softtek                                               }
{ Analista Responsável: Arnaldo V. Scarin               }
{ Atualizado Em: 17/08/2011                             }
{*******************************************************}
//Responsável.....: Arnaldo Scarin
//Revisão.........: Paulo Nobre - 28/05/2012
Unit UDbNormaVigente;

Interface
Uses uCmDbObject, uSistema, DB, uDataBase, uCmCustomCdbObject;

Type
   TDBNormaVigente = Class(TCmDbObject)

   Private
      FIDTIPO: TCmDbField;
      FDATAFIM: TCmDbField;
      FDATAINICIO: TCmDbField;
      FDESCRICAO: TCmDbField;
      FIDNORMA: TCmDbField;
      Procedure SetDATAFIM(Const Value: TCmDbField);
      Procedure SetDATAINICIO(Const Value: TCmDbField);
      Procedure SetDESCRICAO(Const Value: TCmDbField);
      Procedure SetIDNORMA(Const Value: TCmDbField);
      Procedure SetIDTIPO(Const Value: TCmDbField);
   Public
      Property IDNORMA: TCmDbField Read FIDNORMA Write SetIDNORMA;
      Property IDTIPO: TCmDbField Read FIDTIPO Write SetIDTIPO;
      Property DESCRICAO: TCmDbField Read FDESCRICAO Write SetDESCRICAO;
      Property DATAINICIO: TCmDbField Read FDATAINICIO Write SetDATAINICIO;
      Property DATAFIM: TCmDbField Read FDATAFIM Write SetDATAFIM;

      Constructor Create(Aowner: TCmCustomCdbObject); Override;

      Function Insert: Boolean; Override;
      Function Update: Boolean; Override;
      Function LoadFromDb: Boolean; Override;
   End;

Implementation

{ TDBNormaVigente }

Constructor TDBNormaVigente.Create(Aowner: TCmCustomCdbObject);
Begin
   Inherited;
   ErrorIfNoRowsAffected := False;

   TableName := 'Norma_Vigente';

   fIDNORMA := CreateCmDbField('IDNORMA', // Nome do Campo
      ftFloat, // Tipo do Campo
      true, // Requerido
      true, // Primary Key
      false, // ReadOnly
      false, // Nulo se Zero
      ''); // Display Name
   fIDTIPO := CreateCmDbField('IDTIPO', // Nome do Campo
      ftFloat, // Tipo do Campo
      True, // Requerido
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
   fDATAINICIO := CreateCmDbField('DATAINICIO', // Nome do Campo
      ftDateTime, // Tipo do Campo
      False, // Requerido
      false, // Primary Key
      false, // ReadOnly
      false, // Nulo se Zero
      ''); // Display Name
   fDATAFIM := CreateCmDbField('DATAFIM', // Nome do Campo
      ftDateTime, // Tipo do Campo
      False, // Requerido
      false, // Primary Key
      false, // ReadOnly
      True, // Nulo se Zero  //Marcio Sanches Spinosa SOL: 126124/126125 Kintana: 656907/656908
      ''); // Display Name
End;

Function TDBNormaVigente.Insert: Boolean;
Begin
   fIDNorma.AsFloat := LeUltRegistro(Nil, 'NORMAVIGENTE'); // PNOBRE  GetSequence('NormaVigente');
   Result := Inherited Insert;
End;

Function TDBNormaVigente.LoadFromDB: Boolean;
Begin
   Result := Inherited LoadFromDB;
End;

Procedure TDBNormaVigente.SetDATAFIM(Const Value: TCmDbField);
Begin
   FDATAFIM := Value;
End;

Procedure TDBNormaVigente.SetDATAINICIO(Const Value: TCmDbField);
Begin
   FDATAINICIO := Value;
End;

Procedure TDBNormaVigente.SetDESCRICAO(Const Value: TCmDbField);
Begin
   FDESCRICAO := Value;
End;

Procedure TDBNormaVigente.SetIDNORMA(Const Value: TCmDbField);
Begin
   FIDNORMA := Value;
End;

Procedure TDBNormaVigente.SetIDTIPO(Const Value: TCmDbField);
Begin
   FIDTIPO := Value;
End;

Function TDBNormaVigente.Update: Boolean;
Begin
   Result := Inherited Update;
End;

End.

