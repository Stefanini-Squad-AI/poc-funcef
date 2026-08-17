// *****************************************************************************
// ***************************** REGISTRO DE ALTERAÇÕES ************************
// *****************************************************************************
// Autor(a)    : Paulo Ramos
// Data        : 01/02/2006
// Rotina      : executaCalculoTabuaServico
// Pendência   : 21452
// Descricao   : Ajuste na rotina de geração das tábuas de serviço (comutação)
//               normal e recalculada.
//------------------------------------------------------------------------------
unit uGlobal;

interface

uses Classes, DBTables, SysUtils;

Type
  TFormula = Record
    iCD_FORMULA: Integer;
    sNO_VARIAVEL_INICIAL: String;
    sNO_VARIAVEL_INICIAL2: String;
    sNO_VARIAVEL_FINAL: String;
    sNO_VARIAVEL_RESULT: String;
    sDS_FORMULA: String;
    sIR_TABUA: String;
  end;

Type
  TFormulaComSomatorio = Record
    iCD_FORMULA: Integer;
    sNO_VARIAVEL_INICIAL: String;
    sNO_VARIAVEL_INICIAL2: String;
    sNO_VARIAVEL_FINAL: String;
    sNO_VARIAVEL_RESULT: String;
    sDS_FORMULA: String;
    sIR_TABUA: String;
  end;

function isFormulaComSomatorio(iCD_FORMULA: Integer): Boolean;
function getFormulasComSomatorio: String;
procedure setListaformulas;
procedure setListaFormulasComSomatorio(iCD_GRUPO_FORMULA: Integer);
procedure inicializaFormulas;
procedure inicializaFormulasComSomatorio;
procedure setConsultaFormulasRotina;
procedure setConsultaFormulasComSomatorio;
procedure setConsultaVariaveisFormula;

Var
  WG_CD_VERSAO        : Integer;
  WG_CD_PESSOA_ENTID  : Integer;
  WG_CD_PESSOA_PATROC : Integer;
  WG_CD_PLANO         : Integer;
  WG_DT_REFER_BASE    : Tdatetime;
  WG_ENTID_PATROC_PLANO_HIST, WG_ENTID_PATROC_PLANO  : String;

  QryFormulasRotina: TQuery;
  QryFormulasComSomatorio: TQuery;
  QryVariaveisFormula: TQuery;
  lstFormulasComSomatorio: TStringList;
  formulas: array [1..500] of TFormula;
  formulasComSomatorio: array [1..500] of TFormulaComSomatorio;
  //---

implementation

function isFormulaComSomatorio(iCD_FORMULA: Integer): Boolean;
var qry: TQuery;
begin
   Try
      Result := False;
      QryVariaveisFormula.Close;
      QryVariaveisFormula.ParamByName('CD_FORMULA').asInteger := iCD_FORMULA;
      QryVariaveisFormula.Open;

      While not QryVariaveisFormula.Eof do
      Begin
         //--- Verifica somente para as variáveis que não são de Resultado, ou Inicial, ou Final.
         If (not ((QryVariaveisFormula.FieldByName('NO_VARIAVEL').asString = QryVariaveisFormula.FieldByName('NO_VARIAVEL_RESULT').asString) or
            (QryVariaveisFormula.FieldByName('NO_VARIAVEL').asString = QryVariaveisFormula.FieldByName('NO_VARIAVEL_INICIAL').asString) or
            (QryVariaveisFormula.FieldByName('NO_VARIAVEL').asString = QryVariaveisFormula.FieldByName('NO_VARIAVEL_INICIAL2').asString) or
            (QryVariaveisFormula.FieldByName('NO_VARIAVEL').asString = QryVariaveisFormula.FieldByName('NO_VARIAVEL_FINAL').asString))) then
            Try
               qry := TQuery.Create(Nil);
               qry.DataBaseName := 'BaseDados';
               qry.SQL.Add('SELECT CD_FORMULA, NO_VARIAVEL_INICIAL');
               qry.SQL.Add('FROM FI_FORMULA');
               qry.SQL.Add('WHERE NO_VARIAVEL_RESULT = ' + QuotedStr(QryVariaveisFormula.FieldByName('NO_VARIAVEL').asString));
               qry.Open;

               Result := (Trim(qry.FieldByName('NO_VARIAVEL_INICIAL').asString) <> '');
               If Result then
                  Break;
            Finally
               qry.Close;
               FreeAndNil(qry);
         End;

         QryVariaveisFormula.Next;
      End; //while
   Finally
      QryVariaveisFormula.Close;
   End;
end;

function getFormulasComSomatorio: String;
var i: Integer;
begin
   Result := '0';
   If lstFormulasComSomatorio.Count > 0 then
      For i := 0 to lstFormulasComSomatorio.Count - 1 do
         Result := Result + ', ' + lstFormulasComSomatorio.Strings[i];
end;

procedure setListaformulas;
var i, iCD_FORMULA: Integer;
begin
   i := 1;
   inicializaFormulas;
   setConsultaVariaveisFormula;

   lstFormulasComSomatorio := TStringList.create;
   lstFormulasComSomatorio.Clear;

   While not QryFormulasRotina.Eof do
   Begin
      iCD_FORMULA := QryFormulasRotina.FieldByName('CD_FORMULA').asInteger;

      If isFormulaComSomatorio(iCD_FORMULA) then
      Begin
         lstFormulasComSomatorio.Add(IntToStr(iCD_FORMULA));

         QryFormulasRotina.Next;
         Continue;
      End
      Else
      Begin
         formulas[i].iCD_FORMULA := iCD_FORMULA;
         formulas[i].sNO_VARIAVEL_INICIAL := QryFormulasRotina.FieldByName('NO_VARIAVEL_INICIAL').asString;
         formulas[i].sNO_VARIAVEL_INICIAL2 := QryFormulasRotina.FieldByName('NO_VARIAVEL_INICIAL2').asString;
         formulas[i].sNO_VARIAVEL_FINAL := QryFormulasRotina.FieldByName('NO_VARIAVEL_FINAL').asString;
         formulas[i].sNO_VARIAVEL_RESULT := QryFormulasRotina.FieldByName('NO_VARIAVEL_RESULT').asString;
         formulas[i].sDS_FORMULA := QryFormulasRotina.FieldByName('DS_FORMULA').asString;
         formulas[i].sIR_TABUA := QryFormulasRotina.FieldByName('IR_TABUA').asString;

         inc(i);
      End;

      QryFormulasRotina.Next;
   End;
end;

procedure setListaFormulasComSomatorio(iCD_GRUPO_FORMULA: Integer);
var i: Integer;
begin
   i := 1;
   inicializaFormulasComSomatorio;

   QryFormulasComSomatorio.Close;
   QryFormulasComSomatorio.ParamByName('CD_GRUPO_FORMULA').asInteger := iCD_GRUPO_FORMULA;
   QryFormulasComSomatorio.SQL[15] := '  AND FI_FORMULA.CD_FORMULA IN (' + getFormulasComSomatorio + ')';
   QryFormulasComSomatorio.Open;

   While not QryFormulasComSomatorio.Eof do
   Begin
      formulasComSomatorio[i].iCD_FORMULA := QryFormulasComSomatorio.FieldByName('CD_FORMULA').asInteger;
      formulasComSomatorio[i].sNO_VARIAVEL_INICIAL := QryFormulasComSomatorio.FieldByName('NO_VARIAVEL_INICIAL').asString;
      formulasComSomatorio[i].sNO_VARIAVEL_INICIAL2 := QryFormulasComSomatorio.FieldByName('NO_VARIAVEL_INICIAL2').asString;
      formulasComSomatorio[i].sNO_VARIAVEL_FINAL := QryFormulasComSomatorio.FieldByName('NO_VARIAVEL_FINAL').asString;
      formulasComSomatorio[i].sNO_VARIAVEL_RESULT := QryFormulasComSomatorio.FieldByName('NO_VARIAVEL_RESULT').asString;
      formulasComSomatorio[i].sDS_FORMULA := QryFormulasComSomatorio.FieldByName('DS_FORMULA').asString;
      formulasComSomatorio[i].sIR_TABUA := QryFormulasComSomatorio.FieldByName('IR_TABUA').asString;

      inc(i);
      QryFormulasComSomatorio.Next;
   End;
end;

procedure inicializaFormulas;
var i: Integer;
begin
   For i := 1 to 500 do
   Begin
      formulas[i].iCD_FORMULA := -1;
      formulas[i].sNO_VARIAVEL_INICIAL := '';
      formulas[i].sNO_VARIAVEL_INICIAL2 := '';
      formulas[i].sNO_VARIAVEL_FINAL := '';
      formulas[i].sNO_VARIAVEL_RESULT := '';
      formulas[i].sDS_FORMULA := '';
      formulas[i].sIR_TABUA := '';
   End;
end;

procedure inicializaFormulasComSomatorio;
var i: Integer;
begin
   For i := 1 to 500 do
   Begin
      formulasComSomatorio[i].iCD_FORMULA := -1;
      formulasComSomatorio[i].sNO_VARIAVEL_INICIAL := '';
      formulasComSomatorio[i].sNO_VARIAVEL_INICIAL2 := '';
      formulasComSomatorio[i].sNO_VARIAVEL_FINAL := '';
      formulasComSomatorio[i].sNO_VARIAVEL_RESULT := '';
      formulasComSomatorio[i].sDS_FORMULA := '';
      formulasComSomatorio[i].sIR_TABUA := '';
   End;
end;

procedure setConsultaFormulasRotina;
begin
   QryFormulasRotina := TQuery.Create(Nil);
   QryFormulasRotina.DataBaseName := 'BaseDados';

   With QryFormulasRotina.SQL do
   Begin
      Add('SELECT NR_ORDEM_FORMULA, FI_FORMULA.CD_FORMULA, DS_FORMULA, NO_VARIAVEL_RESULT,');
      Add('       NO_VARIAVEL_INICIAL, NO_VARIAVEL_FINAL, NO_VARIAVEL_INICIAL2, IR_TABUA');
      Add('FROM FI_SEQUENCIA_FORMULA, FI_FORMULA, FI_VARIAVEL');
      Add('WHERE FI_SEQUENCIA_FORMULA.CD_FORMULA = FI_FORMULA.CD_FORMULA');
      Add('  AND FI_FORMULA.NO_VARIAVEL_RESULT = FI_VARIAVEL.NO_VARIAVEL');
      Add('  AND FI_SEQUENCIA_FORMULA.CD_GRUPO_FORMULA = :CD_GRUPO_FORMULA');
      Add('  AND FI_FORMULA.NO_VARIAVEL_INICIAL IS NULL');
      Add('ORDER BY FI_SEQUENCIA_FORMULA.NR_ORDEM_FORMULA');
   End;
end;

procedure setConsultaFormulasComSomatorio;
begin
   QryFormulasComSomatorio := TQuery.Create(Nil);
   QryFormulasComSomatorio.DataBaseName := 'BaseDados';

   With QryFormulasComSomatorio.SQL do
   Begin
      Add('SELECT NR_ORDEM_FORMULA, FI_FORMULA.CD_FORMULA, DS_FORMULA, NO_VARIAVEL_RESULT,');
      Add('       NO_VARIAVEL_INICIAL, NO_VARIAVEL_FINAL, NO_VARIAVEL_INICIAL2, IR_TABUA');
      Add('FROM FI_SEQUENCIA_FORMULA, FI_FORMULA, FI_VARIAVEL');
      Add('WHERE FI_SEQUENCIA_FORMULA.CD_FORMULA = FI_FORMULA.CD_FORMULA');
      Add('  AND FI_FORMULA.NO_VARIAVEL_RESULT = FI_VARIAVEL.NO_VARIAVEL');
      Add('  AND FI_SEQUENCIA_FORMULA.CD_GRUPO_FORMULA = :CD_GRUPO_FORMULA');
      Add('  AND FI_FORMULA.NO_VARIAVEL_INICIAL IS NOT NULL');
      Add(' ');
      Add('UNION');
      Add(' ');
      Add('SELECT NR_ORDEM_FORMULA, FI_FORMULA.CD_FORMULA, DS_FORMULA, NO_VARIAVEL_RESULT,');
      Add('       NO_VARIAVEL_INICIAL, NO_VARIAVEL_FINAL, NO_VARIAVEL_INICIAL2, IR_TABUA');
      Add('FROM FI_SEQUENCIA_FORMULA, FI_FORMULA, FI_VARIAVEL');
      Add('WHERE FI_SEQUENCIA_FORMULA.CD_FORMULA = FI_FORMULA.CD_FORMULA');
      Add('  AND FI_FORMULA.NO_VARIAVEL_RESULT = FI_VARIAVEL.NO_VARIAVEL');
      Add('/*  AND FI_FORMULA.CD_FORMULA IN CD_FORMULA   -- linha alterada [15]*/');
      Add('ORDER BY NR_ORDEM_FORMULA');
   End;
end;

procedure setConsultaVariaveisFormula;
begin
   QryVariaveisFormula := TQuery.Create(Nil);
   QryVariaveisFormula.DataBaseName := 'BaseDados';

   With QryVariaveisFormula.SQL do
   Begin
      Add('SELECT NO_VARIAVEL, NO_VARIAVEL_RESULT, NO_VARIAVEL_INICIAL, NO_VARIAVEL_INICIAL2, NO_VARIAVEL_FINAL');
      Add('FROM FI_VARIAVEL_FORMULA, FI_FORMULA');
      Add('WHERE FI_VARIAVEL_FORMULA.CD_FORMULA = FI_FORMULA.CD_FORMULA');
      Add('  AND FI_VARIAVEL_FORMULA.CD_FORMULA = :CD_FORMULA');
   End;
end;

end.
