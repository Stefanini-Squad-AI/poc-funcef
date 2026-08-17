{*******************************************************}
{ Softtek                                               }
{ Analista Responsável: Arnaldo V. Scarin               }
{ Atualizado Em: 17/08/2011                             }
{*******************************************************}
//Responsável.....: Arnaldo Scarin
//Revisão.........: Paulo Nobre - 28/05/2012
Unit uDbLinhasDacon;

Interface
Uses uCmDbObject, uSistema, DB, uDataBase, uCmCustomCdbObject;

Type
   TDBLinhasDacon = Class(TCmDbObject)

   Private
      FIDLINHA: TCmDbField;
      FPLACONTA: TCmDbField;
      FVLRCREDITO: TCmDbField;
      FIDLINHADACON: TCmDbField;
      FVLRDEBITO: TCmDbField;
      FIDRELATORIODADOS: TCmDbField;
      FIDNORMA: TCmDbField;
      Procedure SetIDLINHA(Const Value: TCmDbField);
      Procedure SetIDLINHADACON(Const Value: TCmDbField);
      Procedure SetIDNORMA(Const Value: TCmDbField);
      Procedure SetIDRELATORIODADOS(Const Value: TCmDbField);
      Procedure SetPLACONTA(Const Value: TCmDbField);
      Procedure SetVLRCREDITO(Const Value: TCmDbField);
      Procedure SetVLRDEBITO(Const Value: TCmDbField);
   Public
      Property IDLINHADACON: TCmDbField Read FIDLINHADACON Write SetIDLINHADACON;
      Property IDRELATORIODADOS: TCmDbField Read FIDRELATORIODADOS Write SetIDRELATORIODADOS;
      Property IDLINHA: TCmDbField Read FIDLINHA Write SetIDLINHA;
      Property IDNORMA: TCmDbField Read FIDNORMA Write SetIDNORMA;
      Property PLACONTA: TCmDbField Read FPLACONTA Write SetPLACONTA;
      Property VLRDEBITO: TCmDbField Read FVLRDEBITO Write SetVLRDEBITO;
      Property VLRCREDITO: TCmDbField Read FVLRCREDITO Write SetVLRCREDITO;
      Constructor Create(Aowner: TCmCustomCdbObject); Override;
      Function Insert: Boolean; Override;
      Function Update: Boolean; Override;
      Function LoadFromDb: Boolean; Override;
   End;

Implementation

{ TDBLinhasDacon }

Constructor TDBLinhasDacon.Create(Aowner: TCmCustomCdbObject);
Begin
   Inherited;
   ErrorIfNoRowsAffected := False;

   TableName := 'Linhas_Dacon';

   fIDLinhaDacon := CreateCmDbField('IDLINHADACON', // Nome do Campo
      ftFloat, // Tipo do Campo
      true, // Requerido
      true, // Primary Key
      false, // ReadOnly
      false, // Nulo se Zero
      ''); // Display Name
   fIdRelatorioDAdos := CreateCmDbField('IdRelatorioDados', // Nome do Campo
      ftFloat, // Tipo do Campo
      true, // Requerido
      False, // Primary Key
      false, // ReadOnly
      false, // Nulo se Zero
      ''); // Display Name
   fIDLinha := CreateCmDbField('IDLinha', // Nome do Campo
      ftFloat, // Tipo do Campo
      true, // Requerido
      false, // Primary Key
      false, // ReadOnly
      false, // Nulo se Zero
      ''); // Display Name
   fIDNORMA := CreateCmDbField('IDNORMA', // Nome do Campo
      ftFloat, // Tipo do Campo
      true, // Requerido
      false, // Primary Key
      false, // ReadOnly
      false, // Nulo se Zero
      ''); // Display Name
   fPlaConta := CreateCmDbField('PlaConta', // Nome do Campo
      ftString, // Tipo do Campo
      True, // Requerido
      false, // Primary Key
      false, // ReadOnly
      false, // Nulo se Zero
      ''); // Display Name
   fVlrDebito := CreateCmDbField('VLRDEBITO', // Nome do Campo
      ftFloat, // Tipo do Campo
      False, // Requerido
      false, // Primary Key
      false, // ReadOnly
      false, // Nulo se Zero
      ''); // Display Name
   fVlrCredito := CreateCmDbField('VLRCREDITO', // Nome do Campo
      ftFloat, // Tipo do Campo
      False, // Requerido
      false, // Primary Key
      false, // ReadOnly
      false, // Nulo se Zero
      ''); // Display Name
End;

Function TDBLinhasDacon.Insert: Boolean;
Begin
   fIDLinhaDacon.AsFloat := LeUltRegistro(Nil, 'LINHASDACON'); // pnobre GetSequence('LINHASDACON');
   Result := Inherited Insert;
End;

Function TDBLinhasDacon.LoadFromDB: Boolean;
Begin
   Result := Inherited LoadFromDB;
End;

Procedure TDBLinhasDacon.SetIDLINHA(Const Value: TCmDbField);
Begin
   FIDLINHA := Value;
End;

Procedure TDBLinhasDacon.SetIDLINHADACON(Const Value: TCmDbField);
Begin
   FIDLINHADACON := Value;
End;

Procedure TDBLinhasDacon.SetIDNORMA(Const Value: TCmDbField);
Begin
   FIDNORMA := Value;
End;

Procedure TDBLinhasDacon.SetIDRELATORIODADOS(Const Value: TCmDbField);
Begin
   FIDRELATORIODADOS := Value;
End;

Procedure TDBLinhasDacon.SetPLACONTA(Const Value: TCmDbField);
Begin
   FPLACONTA := Value;
End;

Procedure TDBLinhasDacon.SetVLRCREDITO(Const Value: TCmDbField);
Begin
   FVLRCREDITO := Value;
End;

Procedure TDBLinhasDacon.SetVLRDEBITO(Const Value: TCmDbField);
Begin
   FVLRDEBITO := Value;
End;

Function TDBLinhasDacon.Update: Boolean;
Begin
   Result := Inherited Update;
End;

End.

