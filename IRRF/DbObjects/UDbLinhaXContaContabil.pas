//******************************************************************************
//Responsável.....: Edilaine Ferraresi
//Data............: 09/04/2014
//N. Kintana......: 2051763
//N. Sol..........: 155850-15363
//Descrição.......: Inclusão da Funcionalidade SPED
//Rotina..........: inclusão PLANUTREZA
//*****************************************************************************}
{*******************************************************}
{ Softtek                                               }
{ Analista Responsável: Arnaldo V. Scarin               }
{ Atualizado Em: 17/08/2011                             }
{*******************************************************}
//Responsável.....: Arnaldo Scarin
//Revisão.........: Paulo Nobre - 28/05/2012
Unit UDbLinhaXContaContabil;

Interface
Uses uCmDbObject, uSistema, DB, uDataBase, uCmCustomCdbObject;

Type
   TDBLinhaXContaContabil = Class(TCmDbObject)

   Private
      FPLANO: TCmDbField;
      FIDASSOCIACAO: TCmDbField;
      FPLACONTA: TCmDbField;
      FIDLINHA: TCmDbField;
      FPLANATUREZA: TCmDbField;
      Procedure SetIDASSOCIACAO(Const Value: TCmDbField);
      Procedure SetIDLINHA(Const Value: TCmDbField);
      Procedure SetPLACONTA(Const Value: TCmDbField);
      Procedure SetPLANO(Const Value: TCmDbField);
   Public
      Property IDASSOCIACAO: TCmDbField Read FIDASSOCIACAO Write SetIDASSOCIACAO;
      Property IDLINHA: TCmDbField Read FIDLINHA Write SetIDLINHA;
      Property PLANO: TCmDbField Read FPLANO Write SetPLANO;
      Property PLACONTA: TCmDbField Read FPLACONTA Write SetPLACONTA;
      property PLANATUREZA : TCmDbField  read FPLANATUREZA write FPLANATUREZA;   // Edilaine - SOL 155850 / KTN 1235889

      Constructor Create(Aowner: TCmCustomCdbObject); Override;

      Function Insert: Boolean; Override;
      Function LoadFromDb: Boolean; Override;
   End;

Implementation

{ TDBNormaVigente }

Constructor TDBLinhaXContaContabil.Create(Aowner: TCmCustomCdbObject);
Begin
   Inherited;
   ErrorIfNoRowsAffected := False;

   TableName := 'LINHAXCONTACONTABIL';

   fIDASSOCIACAO := CreateCmDbField('IDASSOCIACAO', // Nome do Campo
      ftFloat, // Tipo do Campo
      true, // Requerido
      false, // Primary Key
      false, // ReadOnly
      false, // Nulo se Zero
      ''); // Display Name
   fIDLINHA := CreateCmDbField('IDLINHA', // Nome do Campo
      ftFloat, // Tipo do Campo
      False, // Requerido
      false, // Primary Key
      false, // ReadOnly
      false, // Nulo se Zero
      ''); // Display Name
   fPlano := CreateCmDbField('PLANO', // Nome do Campo
      ftFloat, // Tipo do Campo
      False, // Requerido
      false, // Primary Key
      false, // ReadOnly
      false, // Nulo se Zero
      ''); // Display Name
   fPLACONTA := CreateCmDbField('PLACONTA', // Nome do Campo
      ftString, // Tipo do Campo
      False, // Requerido
      false, // Primary Key
      false, // ReadOnly
      false, // Nulo se Zero
      ''); // Display Name
   // Edilaine - SOL 155850 / KTN 1235889
   fPLANATUREZA := CreateCmDbField('PLANATUREZA', // Nome do Campo
      ftString, // Tipo do Campo
      False, // Requerido
      false, // Primary Key
      false, // ReadOnly
      false, // Nulo se Zero
      ''); // Display Name
End;

Function TDBLinhaXContaContabil.Insert: Boolean;
Begin
   fIDASSOCIACAO.AsFloat := LeUltRegistro(Nil, 'LINHAXCONTACONTABIL'); // PNOBRE  GetSequence('LINHAXCONTACONTABIL');
   Result := Inherited Insert;
End;

Function TDBLinhaXContaContabil.LoadFromDb: Boolean;
Begin
   Result := Inherited LoadFromDB;
End;

Procedure TDBLinhaXContaContabil.SetIDASSOCIACAO(Const Value: TCmDbField);
Begin
   FIDASSOCIACAO := Value;
End;

Procedure TDBLinhaXContaContabil.SetIDLINHA(Const Value: TCmDbField);
Begin
   FIDLINHA := Value;
End;

Procedure TDBLinhaXContaContabil.SetPLACONTA(Const Value: TCmDbField);
Begin
   FPLACONTA := Value;
End;

Procedure TDBLinhaXContaContabil.SetPLANO(Const Value: TCmDbField);
Begin
   FPLANO := Value;
End;

End.

