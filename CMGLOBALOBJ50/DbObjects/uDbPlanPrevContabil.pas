unit uDbPlanPrevContabil;

//***************************************************************************************
//Rotina:            Vários
//Nº SOL:            126865
//Nº KINTANA         667421
//Data da Alteração: 02/02/2010
//Responsável:       Ricardo A.
//Descrição:         Criação do campo FLGEXCLUSIVOCONTAB.
//**************************************************************************************

//------------------------------------------------------------------------------
//
// Autor......: Arnaldo V. Scarin
// Data.......: 09/11/2009
// Sol........: 126170
// Kintana....: 657025
// Descrição..: Inclusão de Campo para USO PGA no cadastro de Plano Previdenciario
//              Contabil
//
//--------------------------------------------------------------------------------

interface

Uses uCmCustomCdbObject, uCmDbObject, DB, uDataBase;

Type
   TDbPlanPrevContabil = class(TCmDbObject)

   private
      FNome: TCmDbField;
      FIdplanoprev: TCmDbField;
      FIdplanoprevprev: TCmDbField;
      FCodorcamento: TCmDbField;
      FSiglaorcamento: TCmDbField;
      FCodspc: TCmDbField;
      FAtivo: TCmDbField;
      FFLGNaoidentificado: TCmDbField;
      FflgUsoPGA: TCmDbField;

      // Ricardo A. SOL 126865 KTN 667421
      FFlgExclusivoContab: TCmDbField;
      // FIM Ricardo A. SOL 126865 KTN 667421

      procedure SetCodorcamento(const Value: TCmDbField);
      procedure SetIdplanoprev(const Value: TCmDbField);
      procedure SetIdplanoprevprev(const Value: TCmDbField);
      procedure SetNome(const Value: TCmDbField);
      procedure SetCodspc(const Value: TCmDbField);
      procedure SetSiglaorcamento(const Value: TCmDbField);
      procedure SetAtivo(const Value: TCmDbField);
      procedure SetFLGNaoidentificado(const Value: TCmDbField);
      procedure SetflgUsoPGA(const Value: TCmDbField);

      // Ricardo A. SOL 126865 KTN 667421
      procedure SetFlgExclusivoContab(const Value: TCmDbField);
      // FIM Ricardo A. SOL 126865 KTN 667421
   public

      Property Nome               : TCmDbField read FNome               write SetNome;
      Property Idplanoprev        : TCmDbField read FIdplanoprev        write SetIdplanoprev;
      Property Idplanoprevprev    : TCmDbField read FIdplanoprevprev    write SetIdplanoprevprev;
      Property Codorcamento       : TCmDbField read FCodorcamento       write SetCodorcamento;
      Property Siglaorcamento     : TCmDbField read FSiglaorcamento     write SetSiglaorcamento;
      Property Codspc             : TCmDbField read FCodspc             write SetCodspc;
      Property Ativo              : TCmDbField read FAtivo              write SetAtivo;
      Property FLGNaoidentificado : TCmDbField read FFLGNaoidentificado write SetFLGNaoidentificado;
      Property flgUsoPGA          : TCmDbField read FflgUsoPGA          write SetflgUsoPGA;

      // Ricardo A. SOL 126865 KTN 667421
      Property FlgExclusivoContab : TCmDbField read FFlgExclusivoContab write SetFlgExclusivoContab;
      // FIM Ricardo A. SOL 126865 KTN 667421

      constructor Create(Aowner: TCmCustomCdbObject); override;

      function Insert: Boolean; override;
      function LoadFromDb: Boolean; override;

   end;



implementation
{ TDbPlanPrevContabil }



constructor TDbPlanPrevContabil.Create(Aowner: TCmCustomCdbObject);
begin
   inherited;
   ErrorIfNoRowsAffected := False;

   TableName         := 'PLANPREVCONTABIL';

   fNome               := CreateCmDbField('NOME',              ftString,  False, False, False, True, 'Nome');
   fIdplanoprev        := CreateCmDbField('IDPLANOPREV',       ftfloat,   True,  True,  False, True, 'Código');
   fIdplanoprevprev    := CreateCmDbField('IDPLANOPREVPREV',   ftfloat,   False, False, False, True, 'Cód. Pln. Prevd.');
   fCodorcamento       := CreateCmDbField('CODORCAMENTO',      ftString,  False, False, False, True, 'Cód. Orçamento');
   FSiglaorcamento     := CreateCmDbField('SIGLAORCAMENTO',    ftString,  False, False, False, True, 'Sigla SPC');
   FCodspc             := CreateCmDbField('CODSPC',            ftString,  False, False, False, True, 'Cód. SPC');
   FAtivo              := CreateCmDbField('ATIVO',             ftString,  False, False, False, True, 'Ativo');
   FFLGNaoidentificado := CreateCmDbField('FLGNAOIDENTIFICAD', ftString,  False, False, False, True, 'Não Identificado');
   FflgUsoPGA          := CreateCmDbField('FLGUSOPGA',         ftString,  False, False, False, True, 'Uso PGA');

   // Ricardo A. SOL 126865 KTN 667421
   FFlgExclusivoContab := CreateCmDbField('FLGEXCLUSIVOCONTAB',ftString,  False, False, False, True, 'Uso excluvivo da contabilidade');
   // FIM Ricardo A. SOL 126865 KTN 667421
end;

function TDbPlanPrevContabil.Insert: Boolean;
begin
// P. 23368 04/10/2006
   fIdplanoprev.AsFloat := GetSequence('PLANPREV');
   Result               := inherited Insert;
end;



function TDbPlanPrevContabil.LoadFromDB: Boolean;
begin
   Result := inherited LoadFromDB;
end;

procedure TDbPlanPrevContabil.SetAtivo(const Value: TCmDbField);
begin
  FAtivo := Value;
end;

procedure TDbPlanPrevContabil.SetCodorcamento(const Value: TCmDbField);
begin
   FCodorcamento := Value;
end;

procedure TDbPlanPrevContabil.SetCodspc(const Value: TCmDbField);
begin
  FCodspc := Value;
end;

procedure TDbPlanPrevContabil.SetFlgExclusivoContab(
  const Value: TCmDbField);
begin
  // Ricardo A. SOL 126865 KTN 667421
  FFlgExclusivoContab := Value;
  // FIM Ricardo A. SOL 126865 KTN 667421
end;

procedure TDbPlanPrevContabil.SetFLGNaoidentificado(
  const Value: TCmDbField);
begin
  FFLGNaoidentificado := Value;
end;

procedure TDbPlanPrevContabil.SetflgUsoPGA(const Value: TCmDbField);
begin
  FflgUsoPGA := Value;
end;

procedure TDbPlanPrevContabil.SetIdplanoprev(const Value: TCmDbField);
begin
   FIdplanoprev := Value;
end;

procedure TDbPlanPrevContabil.SetIdplanoprevprev(const Value: TCmDbField);
begin
   FIdplanoprevprev := Value;
end;

procedure TDbPlanPrevContabil.SetNome(const Value: TCmDbField);
begin
   FNome := Value;
end;

procedure TDbPlanPrevContabil.SetSiglaorcamento(const Value: TCmDbField);
begin
  FSiglaorcamento := Value;
end;

end.
