Unit uDbAssinatura;

Interface
Uses uCmDbObject, uSistema, DB, uDataBase, uCmCustomCdbObject;

Type
   TDBAssinatura = Class(TCmDbObject)

   Private
      FIDASSINATURA: TCmDbField;
      FDESCRICAO: TCmDbField;
      FIDPESSOA: TCmDbField;
      FASSINATURA: TCmDbField;
      Procedure SetIDASSINATURA(Const Value: TCmDbField);
      Procedure SetDESCRICAO(Const Value: TCmDbField);
      Procedure SetIDPESSOA(Const Value: TCmDbField);
      Procedure SetASSINATURA(Const Value: TCmDbField);
   Public
      Property IDASSINATURA: TCmDbField Read FIDASSINATURA Write SetIDASSINATURA;
      Property DESCRICAO: TCmDbField Read FDESCRICAO Write SetDESCRICAO;
      Property IDPESSOA: TCmDbField Read FIDPESSOA Write SetIDPESSOA;
      Property ASSINATURA: TCmDbField Read FASSINATURA Write SetASSINATURA;
      Constructor Create(Aowner: TCmCustomCdbObject); Override;
      Function Insert: Boolean; Override;
      Function Update: Boolean; Override;
      Function LoadFromDb: Boolean; Override;
   End;

Implementation

{ TDBAssinatura }

Constructor TDBAssinatura.Create(Aowner: TCmCustomCdbObject);
Begin
   Inherited;
   ErrorIfNoRowsAffected := False;

   TableName := 'ASSINATURA';

   fIDASSINATURA := CreateCmDbField('IDASSINATURA', // Nome do Campo
      ftFloat, // Tipo do Campo
      true, // Requerido
      true, // Primary Key
      false, // ReadOnly
      false, // Nulo se Zero
      ''); // Display Name
   fDESCRICAO := CreateCmDbField('DESCRICAO', // Nome do Campo
      ftString, // Tipo do Campo
      true, // Requerido
      False, // Primary Key
      false, // ReadOnly
      false, // Nulo se Zero
      ''); // Display Name
   fIDPESSOA := CreateCmDbField('IDPESSOA', // Nome do Campo
      ftFloat, // Tipo do Campo
      true, // Requerido
      false, // Primary Key
      false, // ReadOnly
      false, // Nulo se Zero
      ''); // Display Name
   fASSINATURA := CreateCmDbField('ASSINATURA', // Nome do Campo
      ftBlob, // Tipo do Campo
      true, // Requerido
      false, // Primary Key
      false, // ReadOnly
      false, // Nulo se Zero
      ''); // Display Name
End;

Function TDBAssinatura.Insert: Boolean;
Begin
   fIDASSINATURA.AsFloat := GetSequence('ASSINATURA'); // pnobre GetSequence('LINHASDACON');
   Result := Inherited Insert;
End;

Function TDBAssinatura.LoadFromDB: Boolean;
Begin
   Result := Inherited LoadFromDB;
End;

Procedure TDBAssinatura.SetIDASSINATURA(Const Value: TCmDbField);
Begin
   FIDASSINATURA := Value;
End;

Procedure TDBAssinatura.SetDESCRICAO(Const Value: TCmDbField);
Begin
   FDESCRICAO := Value;
End;

Procedure TDBAssinatura.SetIDPESSOA(Const Value: TCmDbField);
Begin
   FIDPESSOA := Value;
End;

Procedure TDBAssinatura.SetASSINATURA(Const Value: TCmDbField);
Begin
   fASSINATURA := Value;
End;

Function TDBAssinatura.Update: Boolean;
Begin
   Result := Inherited Update;
End;

End.

