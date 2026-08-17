//******************************************************************************
//Responsável.....: Edilaine Ferraresi
//Data............: 09/04/2014
//N. Kintana......: 2051763
//N. Sol..........: 155850-15363
//Descrição.......: Inclusão da Funcionalidade SPED
//Rotina..........: campo TIPOCONTABILIZACAO
//******************************************************************************
//******************************************************************************
//N. Sol..........: SOL 206751
//N. Kintana......: ktn 1999210
//Data............: 13/05/2013
//Responsável.....: Thiago Melo
//Descrição.......: Não grava alterações inclusoes de linhas de relatorio
//******************************************************************************}

{********************************************************}
{ Softtek                                               }
{ Analista Responsável: Arnaldo V. Scarin               }
{ Atualizado Em: 17/08/2011                             }
{*******************************************************}
//Responsável.....: Arnaldo Scarin
//Revisão.........: Paulo Nobre - 28/05/2012
Unit uDbLinhaRelatorio;

Interface
Uses uCmDbObject, uSistema, DB, uDataBase, uCmCustomCdbObject;

Type
   TDBLinhaRelatorio = Class(TCmDbObject)

   Private
      FIDLINHA: TCmDbField;
      FIDNATUREZA: TCmDbField;
      FDESCRICAO: TCmDbField;
      FCOD_LINHA: TCmDbField;
      FIDNORMA: TCmDbField;
      FidTipoDeCategoria: TCmDbField;
    FTIPOCONTABILIZACAO: TCmDbField;
      Procedure SetCOD_LINHA(Const Value: TCmDbField);
      Procedure SetDESCRICAO(Const Value: TCmDbField);
      Procedure SetIDLINHA(Const Value: TCmDbField);
      Procedure SetIDNATUREZA(Const Value: TCmDbField);
      Procedure SetIDNORMA(Const Value: TCmDbField);
      procedure SetidTipoDeCategoria(const Value: TCmDbField);
    procedure SetTIPOCONTABILIZACAO(const Value: TCmDbField);
   Public
      Property IDLINHA: TCmDbField Read FIDLINHA Write SetIDLINHA;
      Property IDNORMA: TCmDbField Read FIDNORMA Write SetIDNORMA;
      Property IDNATUREZA: TCmDbField Read FIDNATUREZA Write SetIDNATUREZA;
      Property DESCRICAO: TCmDbField Read FDESCRICAO Write SetDESCRICAO;
      Property COD_LINHA: TCmDbField Read FCOD_LINHA Write SetCOD_LINHA;
      Property TIPOCONTABILIZACAO : TCmDbField read FTIPOCONTABILIZACAO write SetTIPOCONTABILIZACAO;  // Edilaine - SOL 155850-15363 / KTN 2051763

      // Thiago Melo SOL 206751 ktn 1999210
      property idTipoDeCategoria: TCmDbField Read FidTipoDeCategoria write SetidTipoDeCategoria;
      // Thiago Melo SOL 206751 ktn 1999210

      Constructor Create(Aowner: TCmCustomCdbObject); Override;

      Function Insert: Boolean; Override;
      Function LoadFromDb: Boolean; Override;
   End;

Implementation

{ TDBLinhaRelatorio }

Constructor TDBLinhaRelatorio.Create(Aowner: TCmCustomCdbObject);
Begin
   Inherited;
   ErrorIfNoRowsAffected := False;

   TableName := 'LINHA_RELATORIO';

   fIDLINHA := CreateCmDbField('IDLINHA', // Nome do Campo
      ftFloat, // Tipo do Campo
      true, // Requerido
      false, // Primary Key
      false, // ReadOnly
      false, // Nulo se Zero
      ''); // Display Name
   fIDNORMA := CreateCmDbField('IDNORMA', // Nome do Campo
      ftFloat, // Tipo do Campo
      false, // Requerido
      false, // Primary Key
      false, // ReadOnly
      false, // Nulo se Zero
      ''); // Display Name
   fIDNATUREZA := CreateCmDbField('IDNATUREZA', // Nome do Campo
      ftFloat, // Tipo do Campo
      False, // Requerido
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
   fCOD_LINHA := CreateCmDbField('COD_LINHA', // Nome do Campo
      ftString, // Tipo do Campo
      True, // Requerido
      false, // Primary Key
      false, // ReadOnly
      false, // Nulo se Zero
      ''); // Display Name

   // Thiago Melo SOL 206751 ktn 1999210
   FidTipodeCategoria := CreateCmDbField('IDTIPODECATEGORIA', // Nome do Campo
      ftInteger, // Tipo do Campo
      True, // Requerido
      false, // Primary Key
      false, // ReadOnly
      false, // Nulo se Zero
      ''); // Display Name
   // Thiago Melo SOL 206751 ktn 1999210

   // Edilaine - SOL 155850-15363 / KTN 2051763
   FTIPOCONTABILIZACAO := CreateCmDbField('TIPOCONTABILIZACAO', // Nome do Campo
      ftInteger, // Tipo do Campo
      False, // Requerido
      false, // Primary Key
      false, // ReadOnly
      false, // Nulo se Zero
      ''); // Display Name

End;

Function TDBLinhaRelatorio.Insert: Boolean;
Begin
   fIDLinha.AsFloat := LeUltRegistro(Nil, 'LINHARELATORIO'); // PNOBRE  GetSequence('LinhaRelatorio');
   Result := Inherited Insert;
End;

Function TDBLinhaRelatorio.LoadFromDB: Boolean;
Begin
   Result := Inherited LoadFromDB;
End;

Procedure TDBLinhaRelatorio.SetCOD_LINHA(Const Value: TCmDbField);
Begin
   FCOD_LINHA := Value;
End;

Procedure TDBLinhaRelatorio.SetDESCRICAO(Const Value: TCmDbField);
Begin
   FDESCRICAO := Value;
End;

Procedure TDBLinhaRelatorio.SetIDLINHA(Const Value: TCmDbField);
Begin
   FIDLINHA := Value;
End;

Procedure TDBLinhaRelatorio.SetIDNATUREZA(Const Value: TCmDbField);
Begin
   FIDNATUREZA := Value;
End;

Procedure TDBLinhaRelatorio.SetIDNORMA(Const Value: TCmDbField);
Begin
   FIDNORMA := Value;
End;

procedure TDBLinhaRelatorio.SetidTipoDeCategoria(const Value: TCmDbField);
begin
  FidTipoDeCategoria := Value;
end;

procedure TDBLinhaRelatorio.SetTIPOCONTABILIZACAO(const Value: TCmDbField);
begin
  FTIPOCONTABILIZACAO := Value;
end;

End.

