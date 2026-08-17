{*******************************************************}
{ Softtek                                               }
{ Analista Responsável: Arnaldo V. Scarin               }
{ Atualizado Em: 17/08/2011                             }
{*******************************************************}
//Responsável.....: Arnaldo Scarin
//Revisão.........: Paulo Nobre - 28/05/2012
Unit uDbTipoRelatorio;

Interface
Uses uCmDbObject, uSistema, DB, uDataBase, uCmCustomCdbObject;

Type
   TDBTipoRelatorio = Class(TCmDbObject)

   Private
      FIDTipo: TCmDbField;
      FDESCRICAO: TCmDbField;
      Procedure SetDESCRICAO(Const Value: TCmDbField);
      Procedure SetIDTipo(Const Value: TCmDbField);
   Public
      Property IDTipo: TCmDbField Read FIDTipo Write SetIDTipo;
      Property DESCRICAO: TCmDbField Read FDESCRICAO Write SetDESCRICAO;

      Constructor Create(Aowner: TCmCustomCdbObject); Override;

      Function Insert: Boolean; Override;
      Function LoadFromDb: Boolean; Override;
   End;

Implementation

{ TDBTipoRelatorio }

Constructor TDBTipoRelatorio.Create(Aowner: TCmCustomCdbObject);
Begin
   Inherited;
   ErrorIfNoRowsAffected := False;

   TableName := 'TIPO_RELATORIO';

   fIDTIPO := CreateCmDbField('IDTIPO', // Nome do Campo
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

Function TDBTipoRelatorio.Insert: Boolean;
Begin
   fIDTIPO.AsFloat := LeUltRegistro(Nil, 'TIPORELATORIO'); // PNOBRE  GetSequence('TipoRelatorio');
   Result := Inherited Insert;
End;

Function TDBTipoRelatorio.LoadFromDB: Boolean;
Begin
   Result := Inherited LoadFromDB;
End;

Procedure TDBTipoRelatorio.SetDESCRICAO(Const Value: TCmDbField);
Begin
   FDESCRICAO := Value;
End;

Procedure TDBTipoRelatorio.SetIDTIPO(Const Value: TCmDbField);
Begin
   FIDTIPO := Value;
End;

End.

