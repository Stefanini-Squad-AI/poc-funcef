{*******************************************************}
{ Softtek                                               }
{ Analista Responsável: Arnaldo V. Scarin               }
{ Atualizado Em: 17/08/2011                             }
{*******************************************************}
//Responsável.....: Arnaldo Scarin
//Revisão.........: Paulo Nobre - 28/05/2012
Unit uDBParametrosRelatorio;

Interface
Uses uCmDbObject, uSistema, DB, uDataBase, uCmCustomCdbObject;

Type
   TDbParametrosRelatorio = Class(TCmDbObject)

   Private
      FDESCRICAO: TCmDbField;
      FGRUPO: TCmDbField;
      FC_INICIO: TCmDbField;
      FC_FIM: TCmDbField;
      FORDEM: TCmDbField;
      FC_TAMANHO: TCmDbField;
      FVALOR: TCmDbField;
      FIDRELPARAM: TCmDbField;
      Procedure SetC_FIM(Const Value: TCmDbField);
      Procedure SetC_INICIO(Const Value: TCmDbField);
      Procedure SetC_TAMANHO(Const Value: TCmDbField);
      Procedure SetDESCRICAO(Const Value: TCmDbField);
      Procedure SetGRUPO(Const Value: TCmDbField);
      Procedure SetIDRELPARAM(Const Value: TCmDbField);
      Procedure SetORDEM(Const Value: TCmDbField);
      Procedure SetVALOR(Const Value: TCmDbField);
   Public
      Property IDRELPARAM: TCmDbField Read FIDRELPARAM Write SetIDRELPARAM;
      Property DESCRICAO: TCmDbField Read FDESCRICAO Write SetDESCRICAO;
      Property GRUPO: TCmDbField Read FGRUPO Write SetGRUPO;
      Property ORDEM: TCmDbField Read FORDEM Write SetORDEM;
      Property VALOR: TCmDbField Read FVALOR Write SetVALOR;
      Property C_INICIO: TCmDbField Read FC_INICIO Write SetC_INICIO;
      Property C_FIM: TCmDbField Read FC_FIM Write SetC_FIM;
      Property C_TAMANHO: TCmDbField Read FC_TAMANHO Write SetC_TAMANHO;

      Constructor Create(Aowner: TCmCustomCdbObject); Override;

      Function Insert: Boolean; Override;
      Function LoadFromDb: Boolean; Override;
   End;

Implementation

{ TDbParametrosRelatorio }

Constructor TDbParametrosRelatorio.Create(Aowner: TCmCustomCdbObject);
Begin
   Inherited;
   ErrorIfNoRowsAffected := False;

   TableName := 'PARAMETROS_RELATORIO';

   fIDRELPARAM := CreateCmDbField('IDRELPARAM', // Nome do Campo
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
   fGRUPO := CreateCmDbField('GRUPO', // Nome do Campo
      ftString, // Tipo do Campo
      True, // Requerido
      false, // Primary Key
      false, // ReadOnly
      false, // Nulo se Zero
      ''); // Display Name
   fOrdem := CreateCmDbField('ORDEM', // Nome do Campo
      ftFloat, // Tipo do Campo
      True, // Requerido
      false, // Primary Key
      false, // ReadOnly
      false, // Nulo se Zero
      ''); // Display Name
   fValor := CreateCmDbField('Valor', // Nome do Campo
      ftString, // Tipo do Campo
      false, // Requerido
      false, // Primary Key
      false, // ReadOnly
      false, // Nulo se Zero
      ''); // Display Name
   fC_INICIO := CreateCmDbField('C_INICIO', // Nome do Campo
      ftFloat, // Tipo do Campo
      False, // Requerido
      false, // Primary Key
      false, // ReadOnly
      false, // Nulo se Zero
      ''); // Display Name
   FC_FIM := CreateCmDbField('C_FIM', // Nome do Campo
      ftFloat, // Tipo do Campo
      False, // Requerido
      false, // Primary Key
      false, // ReadOnly
      false, // Nulo se Zero
      ''); // Display Name
   fC_TAMANHO := CreateCmDbField('C_TAMANHO', // Nome do Campo
      ftFloat, // Tipo do Campo
      False, // Requerido
      false, // Primary Key
      false, // ReadOnly
      false, // Nulo se Zero
      ''); // Display Name
End;

Function TDbParametrosRelatorio.Insert: Boolean;
Begin
   fIDRELPARAM.AsFloat := LeUltRegistro(Nil, 'PARAMETROSRELATORIO'); // PNOBRE  GetSequence('ParametrosRelatorio');
   Result := Inherited Insert;
End;

Function TDbParametrosRelatorio.LoadFromDB: Boolean;
Begin
   Result := Inherited LoadFromDB;
End;

Procedure TDbParametrosRelatorio.SetC_FIM(Const Value: TCmDbField);
Begin
   FC_FIM := Value;
End;

Procedure TDbParametrosRelatorio.SetC_INICIO(Const Value: TCmDbField);
Begin
   FC_INICIO := Value;
End;

Procedure TDbParametrosRelatorio.SetC_TAMANHO(Const Value: TCmDbField);
Begin
   FC_TAMANHO := Value;
End;

Procedure TDbParametrosRelatorio.SetDESCRICAO(Const Value: TCmDbField);
Begin
   FDESCRICAO := Value;
End;

Procedure TDbParametrosRelatorio.SetGRUPO(Const Value: TCmDbField);
Begin
   FGRUPO := Value;
End;

Procedure TDbParametrosRelatorio.SetIDRELPARAM(Const Value: TCmDbField);
Begin
   FIDRELPARAM := Value;
End;

Procedure TDbParametrosRelatorio.SetORDEM(Const Value: TCmDbField);
Begin
   FORDEM := Value;
End;

Procedure TDbParametrosRelatorio.SetVALOR(Const Value: TCmDbField);
Begin
   FVALOR := Value;
End;

End.

