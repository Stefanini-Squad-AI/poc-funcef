//******************************************************************************************
//N. Sol..........: 137269
//N. Kintana......: 829602
//Data............: 10/10/2011
//Responsável.....: Paulo Nobre
//Descrição.......: Alteração en funções para inclusão de novo campos
//******************************************************************************************
Unit uDbDstAeroporto;

Interface

Uses uCmCustomCdbObject, uCmDbObject, DB, uDataBase;

Type
   TDbDstAeroporto = Class(TCmDbObject)

   Private
      FIdDstAeroporto: TCmDbField;
      FNmeDstAeroporto: TCmDbField;
      FIdCidade: TCmDbField;

   Public
      Property IdDstAeroporto: TCmDbField Read FIdDstAeroporto Write FIdDstAeroporto;
      Property NmeDstAeroporto: TCmDbField Read FNmeDstAeroporto Write FNmeDstAeroporto;
      Property IdCidade: TCmDbField Read FIdCidade Write FIdCidade;

      Constructor Create(Aowner: TCmCustomCdbObject); Override;

      Function Insert: Boolean; Override;
   End;

Implementation

{ TDbDstTarifa }

Constructor TDbDstAeroporto.Create(Aowner: TCmCustomCdbObject);
Begin
   Inherited;
   ErrorIfNoRowsAffected := False;

   TableName := 'DSTAEROPORTO';

   FIdDstAeroporto := CreateCmDbField('iddstaeroporto', ftfloat, True, True, False, True, '');
   FNmeDstAeroporto := CreateCmDbField('nmedstaeroporto', ftString, False, False, False, True, '');
   FIdCidade := CreateCmDbField('IdCidades', ftfloat, False, False, False, True, '');
End;

Function TDbDstAeroporto.Insert: Boolean;
Begin
   FIdDstAeroporto.AsFloat := GetSequence('DSTAEROPORTO');
   Result := Inherited Insert;
End;

End.

