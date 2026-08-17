{*******************************************************}
{ Softtek                                               }
{ Analista Responsável: Arnaldo V. Scarin               }
{ Atualizado Em: 17/08/2011                             }
{*******************************************************}
//Responsável.....: Arnaldo Scarin
//Revisão.........: Paulo Nobre - 28/05/2012
Unit uDbLinhaxTipoDesemb;

Interface
Uses uCmDbObject, uSistema, DB, uDataBase, uCmCustomCdbObject;

Type
   TDBLinhaxTipoDesemb = Class(TCmDbObject)

   Private
      FIDASSOCIACAO: TCmDbField;
      FIDLinha: TCmDbField;
      FIDNorma: TCmDbField;
      FCodTipRecDes: TCmDbField;
      Procedure SetIDASSOCIACAO(Const Value: TCmDbField);
      Procedure SetIDLinha(Const Value: TCmDbField);
      Procedure SetIDNorma(Const Value: TCmDbField);

      Procedure SetCodTipRecDes(Const Value: TCmDbField);
   Public
      Property IDASSOCIACAO: TCmDbField Read FIDASSOCIACAO Write SetIDASSOCIACAO;
      Property IDLinha: TCmDbField Read FIDLinha Write SetIDLinha;
      Property IDNorma: TCmDbField Read FIDNorma Write SetIDNorma;
      Property CodTipRecDes: TCmDbField Read FCodTipRecDes Write SetCodTipRecDes;

      Constructor Create(Aowner: TCmCustomCdbObject); Override;

      Function Insert: Boolean; Override;
      Function LoadFromDb: Boolean; Override;
   End;

Implementation

{ TDBNormaVigente }

Constructor TDBLinhaxTipoDesemb.Create(Aowner: TCmCustomCdbObject);
Begin
   Inherited;
   ErrorIfNoRowsAffected := False;

   TableName := 'LinhaxTipoDesembolso';

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
   FCodTipRecDes := CreateCmDbField('CodTipRecDes', // Nome do Campo
      ftString, // Tipo do Campo
      False, // Requerido
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
End;

Function TDBLinhaxTipoDesemb.Insert: Boolean;
Begin
   fIDASSOCIACAO.AsFloat := LeUltRegistro(Nil, 'LINHAXTIPODESEMB'); // pnobre GetSequence('LinhaxTipoDesemb');
   Result := Inherited Insert;
End;

Function TDBLinhaxTipoDesemb.LoadFromDb: Boolean;
Begin
   Result := Inherited LoadFromDB;
End;

Procedure TDBLinhaxTipoDesemb.SetCodTipRecDes(Const Value: TCmDbField);
Begin
   FCodTipRecDes := Value;
End;

Procedure TDBLinhaxTipoDesemb.SetIDASSOCIACAO(Const Value: TCmDbField);
Begin
   FIDASSOCIACAO := Value;
End;

Procedure TDBLinhaxTipoDesemb.SetIDLinha(Const Value: TCmDbField);
Begin
   FIDLinha := Value;
End;

Procedure TDBLinhaxTipoDesemb.SetIDNorma(Const Value: TCmDbField);
Begin
   FIDNorma := Value;
End;



End.

