{*******************************************************************************
Analista.: Edilaine Ferraresi
Data.....: 26/08/2013
Kintana..: 1235889
Sol......: 155850
Descrição: Inclusão da Funcionalidade SPED
*******************************************************************************}
{*******************************************************}
{ Softtek                                               }
{ Analista Responsável: Arnaldo V. Scarin               }
{ Atualizado Em: 17/08/2011                             }
{*******************************************************}
//Responsável.....: Arnaldo Scarin
//Revisão.........: Paulo Nobre - 28/05/2012
Unit uDbRelatorioDados;

Interface
Uses uCmDbObject, uSistema, DB, uDataBase, uCmCustomCdbObject;

Type
   TDbRelatorioDados = Class(TCmDbObject)

   Private
      FPERIODO: TCmDbField;
      FVLRPIS: TCmDbField;
      FVLRCOFINS: TCmDbField;
      FIdTipo: TCmDbField;
      FDATAGERACAO: TCmDbField;
      FNURECRETIFICADOR: TCmDbField;
      FEXERCICIO: TCmDbField;
      FIdNorma: TCmDbField;
      FIdRelatorioDados: TCmDbField;
      FNURECIBO: TCmDbField;
      FIdRelParam: TCmDbField;
    FRETIFICADORA: TCmDbField;
    FBASECALC: TCmDbField;
      Procedure SetDATAGERACAO(Const Value: TCmDbField);
      Procedure SetEXERCICIO(Const Value: TCmDbField);
      Procedure SetIdNorma(Const Value: TCmDbField);
      Procedure SetIdRelatorioDados(Const Value: TCmDbField);
      Procedure SetIdRelParam(Const Value: TCmDbField);
      Procedure SetIdTipo(Const Value: TCmDbField);
      Procedure SetNURECIBO(Const Value: TCmDbField);
      Procedure SetNURECRETIFICADOR(Const Value: TCmDbField);
      Procedure SetPERIODO(Const Value: TCmDbField);
      Procedure SetVLRCOFINS(Const Value: TCmDbField);
      Procedure SetVLRPIS(Const Value: TCmDbField);
    procedure SetRETIFICADORA(const Value: TCmDbField);
    procedure SetBASECALC(const Value: TCmDbField);
   Public
      Property IdRelatorioDados: TCmDbField Read FIdRelatorioDados Write SetIdRelatorioDados;
      Property IdTipo: TCmDbField Read FIdTipo Write SetIdTipo;
      Property IdNorma: TCmDbField Read FIdNorma Write SetIdNorma;
      Property IdRelParam: TCmDbField Read FIdRelParam Write SetIdRelParam;
      Property EXERCICIO: TCmDbField Read FEXERCICIO Write SetEXERCICIO;
      Property PERIODO: TCmDbField Read FPERIODO Write SetPERIODO;
      Property NURECIBO: TCmDbField Read FNURECIBO Write SetNURECIBO;
      Property NURECRETIFICADOR: TCmDbField Read FNURECRETIFICADOR Write SetNURECRETIFICADOR;
      Property DATAGERACAO: TCmDbField Read FDATAGERACAO Write SetDATAGERACAO;
      Property VLRPIS: TCmDbField Read FVLRPIS Write SetVLRPIS;
      Property VLRCOFINS: TCmDbField Read FVLRCOFINS Write SetVLRCOFINS;
      Property BASECALC: TCmDbField read FBASECALC write SetBASECALC;                  // Edilaine - SOL 155850 / KTN 1235889
      Property RETIFICADORA: TCmDbField read FRETIFICADORA write SetRETIFICADORA;      // Edilaine - SOL 155850 / KTN 1235889

      Constructor Create(Aowner: TCmCustomCdbObject); Override;

      Function Insert: Boolean; Override;
      Function LoadFromDb: Boolean; Override;
      function GetNumero : integer;
   End;

Implementation

{ TDbRelatorioDados }

Constructor TDbRelatorioDados.Create(Aowner: TCmCustomCdbObject);
Begin
   Inherited;
   ErrorIfNoRowsAffected := False;

   TableName := 'RELATORIO_DADOS_CADASTRAIS';

   fIdRelatorioDados := CreateCmDbField('IDRELATORIODADOS', // Nome do Campo
      ftFloat, // Tipo do Campo
      true, // Requerido
      true, // Primary Key
      false, // ReadOnly
      false, // Nulo se Zero
      ''); // Display Name
   fIdTipo := CreateCmDbField('IdTipo', // Nome do Campo
      ftFloat, // Tipo do Campo
      false, // Requerido
      false, // Primary Key
      false, // ReadOnly
      false, // Nulo se Zero
      ''); // Display Name
   fIdNorma := CreateCmDbField('IdNorma', // Nome do Campo
      ftFloat, // Tipo do Campo
      false, // Requerido
      false, // Primary Key
      false, // ReadOnly
      false, // Nulo se Zero
      ''); // Display Name
   fIdRelParam := CreateCmDbField('IdRelParam', // Nome do Campo
      ftFloat, // Tipo do Campo
      false, // Requerido
      false, // Primary Key
      false, // ReadOnly
      true, // Nulo se Zero               // Edilaine - SOL 155850 / KTN 1235889 - false por true
      ''); // Display Name
   fEXERCICIO := CreateCmDbField('EXERCICIO', // Nome do Campo
      ftString, // Tipo do Campo
      true, // Requerido
      false, // Primary Key
      false, // ReadOnly
      false, // Nulo se Zero
      ''); // Display Name
   fPERIODO := CreateCmDbField('PERIODO', // Nome do Campo
      ftString, // Tipo do Campo
      true, // Requerido
      false, // Primary Key
      false, // ReadOnly
      false, // Nulo se Zero
      ''); // Display Name
   FNURECIBO := CreateCmDbField('NURECIBO', // Nome do Campo
      ftString, // Tipo do Campo
      false, // Requerido                         // Edilaine - SOL 155850 / KTN 1235889 - true por false
      false, // Primary Key
      false, // ReadOnly
      false, // Nulo se Zero
      ''); // Display Name
   fNURECRETIFICADOR := CreateCmDbField('NURECRETIFICADOR', // Nome do Campo
      ftString, // Tipo do Campo
      false, // Requerido
      false, // Primary Key
      false, // ReadOnly
      false, // Nulo se Zero
      ''); // Display Name
   fDATAGERACAO := CreateCmDbField('DATAGERACAO', // Nome do Campo
      ftDateTime, // Tipo do Campo
      false, // Requerido
      false, // Primary Key
      false, // ReadOnly
      false, // Nulo se Zero
      ''); // Display Name
   fVLRPIS := CreateCmDbField('VLRPIS', // Nome do Campo
      ftFloat, // Tipo do Campo
      false, // Requerido
      false, // Primary Key
      false, // ReadOnly
      false, // Nulo se Zero
      ''); // Display Name
   fVLRCOFINS := CreateCmDbField('VLRCOFINS', // Nome do Campo
      ftFloat, // Tipo do Campo
      false, // Requerido
      false, // Primary Key
      false, // ReadOnly
      false, // Nulo se Zero
      ''); // Display Name
   fVLRPIS := CreateCmDbField('BASECALC',             // Edilaine - SOL 155850 / KTN 1235889
      ftFloat, // Tipo do Campo
      false, // Requerido
      false, // Primary Key
      false, // ReadOnly
      false, // Nulo se Zero
      ''); // Display Name
   fRETIFICADORA := CreateCmDbField('RETIFICADORA',   // Edilaine - SOL 155850 / KTN 1235889
      ftString, // Tipo do Campo
      true, // Requerido
      false, // Primary Key
      false, // ReadOnly
      false, // Nulo se Zero
      ''); // Display Name
End;

function TDbRelatorioDados.GetNumero: integer;
begin
  result := LeUltRegistro(Nil, 'RELATORIODADOSCADASTRAIS');   // Edilaine - SOL 155850 / KTN 1235889
end;

Function TDbRelatorioDados.Insert: Boolean;
Begin
   if fIdRelatorioDados.AsFloat <= 0 then   // Edilaine - SOL 155850 / KTN 1235889
      fIdRelatorioDados.AsFloat := LeUltRegistro(Nil, 'RELATORIODADOSCADASTRAIS'); // PNOBRE   GetSequence('RELATORIODADOSCADASTRAIS');
   Result := Inherited Insert;
End;

Function TDbRelatorioDados.LoadFromDB: Boolean;
Begin
   Result := Inherited LoadFromDB;
End;

procedure TDbRelatorioDados.SetBASECALC(const Value: TCmDbField);
begin
  FBASECALC := Value;
end;

Procedure TDbRelatorioDados.SetDATAGERACAO(Const Value: TCmDbField);
Begin
   FDATAGERACAO := Value;
End;

Procedure TDbRelatorioDados.SetEXERCICIO(Const Value: TCmDbField);
Begin
   FEXERCICIO := Value;
End;

Procedure TDbRelatorioDados.SetIdNorma(Const Value: TCmDbField);
Begin
   FIdNorma := Value;
End;

Procedure TDbRelatorioDados.SetIdRelatorioDados(Const Value: TCmDbField);
Begin
   FIdRelatorioDados := Value;
End;

Procedure TDbRelatorioDados.SetIdRelParam(Const Value: TCmDbField);
Begin
   FIdRelParam := Value;
End;

Procedure TDbRelatorioDados.SetIdTipo(Const Value: TCmDbField);
Begin
   FIdTipo := Value;
End;

Procedure TDbRelatorioDados.SetNURECIBO(Const Value: TCmDbField);
Begin
   FNURECIBO := Value;
End;

Procedure TDbRelatorioDados.SetNURECRETIFICADOR(Const Value: TCmDbField);
Begin
   FNURECRETIFICADOR := Value;
End;

Procedure TDbRelatorioDados.SetPERIODO(Const Value: TCmDbField);
Begin
   FPERIODO := Value;
End;

procedure TDbRelatorioDados.SetRETIFICADORA(const Value: TCmDbField);
begin
  FRETIFICADORA := Value;
end;

Procedure TDbRelatorioDados.SetVLRCOFINS(Const Value: TCmDbField);
Begin
   FVLRCOFINS := Value;
End;

Procedure TDbRelatorioDados.SetVLRPIS(Const Value: TCmDbField);
Begin
   FVLRPIS := Value;
End;

End.

