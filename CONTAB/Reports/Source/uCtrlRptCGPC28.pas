{ --------------------------------------------------------------------------------------------------
Rotina......: -
Nº SOL......: 132742, 132741, 132744, 132758, 132992, 132743
Nº KINTANA..: 767273, 767272, 767396, 767599, 770843, 767392
Data........: 21/05/2010
Responsável.: Fábio Henrique Beccaria Sampaio
Descrição...: Unit de controle dos relatórios para atender a CGPC28
---------------------------------------------------------------------------------------------------}
unit uCtrlRptCGPC28;

interface

uses Classes, DB, uDataBase, uCmControlObject, dbClient, SysUtils;

type
  TCtrlRptCGPC28 = Class(TCmControlObject)
  private
  public
    function ListaExercicio(iIdPessoa: integer): OleVariant;
    function ListaPeriodo(iIdPessoa,iExercicio: integer): OleVariant;
    function ListaPlano: OleVariant;
    function ListaPatro: OleVariant;
    function FazQuery(dRef1, dRef2: TDateTime;
                      sEmpresa, sPlano, sPlanoPrev, sPatro: String;
                      bMovimentacao, bRMil: Boolean; aContas: array of String): OleVariant;
  end;

implementation

uses uSistema, UData, uCMFileUtils, FSM_FxLib;

{ TCtrlRptDemonstrativo }

function TCtrlRptCGPC28.ListaExercicio(iIdPessoa: integer): OleVariant;
begin
  Result := GetDataPacket('SELECT DISTINCT PEREXERCICIO ' +
                          'FROM PERIODO ' +
                          'WHERE IDPESSOA = ' + IntToStr(iIdPessoa)+ ' ' +
                          '  AND PEREXERCICIO > 2009 ' + 
                          'ORDER BY PEREXERCICIO');
end;

function TCtrlRptCGPC28.ListaPeriodo(iIdPessoa, iExercicio: integer): OleVariant;
begin
  Result := GetDataPacket('SELECT PERNUMERO, PERNOME ' +
                          'FROM PERIODO ' +
                          'WHERE (IDPESSOA = ' + IntToStr(iIdPessoa) + ') ' +
                          '  AND (PEREXERCICIO = ' + IntToStr(iExercicio)+ ') ' +
                          '  AND (PERNUMERO > 0) '+
                          'ORDER BY PERNUMERO');
end;

function TCtrlRptCGPC28.ListaPlano: OleVariant;
begin
  Result := GetDataPacket('SELECT ''N'' AS SELECIONA, IDPLANOPREV, NOME ' +
                          'FROM PLANPREVCONTABIL ' +
                          'ORDER BY NOME');
end;

function TCtrlRptCGPC28.ListaPatro: OleVariant;
begin
  Result := GetDataPacket('SELECT ''N'' AS SELECIONA, PPA.NOME, PTR.IDPESSOA AS IDPATRO ' +
                          'FROM PESSOA PPA, PATRO PTR ' +
                          'WHERE PTR.IDPESSOA = PPA.IDPESSOA ' +
                          'ORDER BY NOME');
end;

function TCtrlRptCGPC28.FazQuery(dRef1, dRef2: TDateTime;
  sEmpresa, sPlano, sPlanoPrev, sPatro: String; bMovimentacao, bRMil: Boolean;
  aContas: array of String): OleVariant;
var
  Contador: Integer;
  SL: TStringList;
  sContas: String;
  sPSWhere: String;
  dRef3, dRef4: TDateTime;
  sDiv: String;
begin
  if Month(dRef1) = Month(dRef2) then begin
    dRef3 := EncodeDate(Year(dRef2)-1, Month(dRef2), Day(dRef2));
    dRef4 := EncodeDate(Year(dRef3)-1, Month(dRef3), Day(dRef3));
  end else begin
    dRef3 := UltimoDiaMes(EncodeDate(Year(dRef2), Month(dRef2), 1) - 1);
    dRef4 := UltimoDiaMes(EncodeDate(Year(dRef3), Month(dRef3), 1) - 1);
  end;

  sContas := '';
  for Contador := Low(aContas) to High(aContas) do
  begin
    if sContas <> '' then sContas := sContas + ',';
    sContas := sContas + QuotedStr(aContas[Contador]);
  end;

  // Filtro padrão dos Sub-Selects

  sPSWhere := '      AND (PS.IDPESSOA = ' + sEmpresa + ')' + #13#10 +
              '      AND (PS.PLANO = ' + sPlano + ')';

  if Trim(sPlanoPrev) <> '' then
  begin
    if Pos(',', sPlanoPrev) > 0 then
      sPSWhere := sPSWhere + #13#10 + '      AND (PS.IDPLANOPREV IN ('+sPlanoPrev+'))'
    else
      sPSWhere := sPSWhere + #13#10 + '      AND (PS.IDPLANOPREV = '+sPlanoPrev+')';
  end;

  if Trim(sPatro) <> '' then
  begin
    if Pos(',', sPatro) > 0 then
      sPSWhere := sPSWhere + #13#10 + '      AND (PS.IDPATRO IN ('+sPatro+'))'
    else
      sPSWhere := sPSWhere + #13#10 + '      AND (PS.IDPATRO = '+sPatro+')';
  end;

  if Trim(sContas) <> '' then
  begin
    if Pos(',', sContas) > 0 then
      sPSWhere := sPSWhere + #13#10 + '      AND (TRIM(PS.PLACONTA) IN ('+sContas+'))'
    else
      sPSWhere := sPSWhere + #13#10 + '      AND (TRIM(PS.PLACONTA) = '+sContas+')';
  end;

  if bRMil then
    sDiv := ' / 1000'
  else
    sDiv := '';

  SL := TStringList.Create;
  try
    SL.Clear;
    SL.Add('SELECT');
    SL.Add('  C.PLACONTA, C.PLANATUREZA,');
    if bMovimentacao then begin
      SL.Add('  (NVL(SR1.SALDO,0) - NVL(SR2.SALDO,0))'+sDiv+' AS SALDOREF1,');
      SL.Add('  (NVL(SR2.SALDO,0) - NVL(SR3.SALDO,0))'+sDiv+' AS SALDOREF2,');
      SL.Add('  (NVL(SR3.SALDO,0) - NVL(SR4.SALDO,0))'+sDiv+' AS SALDOREF3,');
      SL.Add('  DECODE( SIGN( (NVL(SR1.SALDO,0) - NVL(SR2.SALDO,0)) ), -1, ''C'', 1, ''D'', '' '') AS SALDOREF1_DC,');
      SL.Add('  DECODE( SIGN( (NVL(SR2.SALDO,0) - NVL(SR3.SALDO,0)) ), -1, ''C'', 1, ''D'', '' '') AS SALDOREF2_DC,');
      SL.Add('  DECODE( SIGN( (NVL(SR3.SALDO,0) - NVL(SR4.SALDO,0)) ), -1, ''C'', 1, ''D'', '' '') AS SALDOREF3_DC');
    end else begin
      SL.Add('  NVL(SR1.SALDO,0)'+sDiv+' AS SALDOREF1,');
      SL.Add('  NVL(SR2.SALDO,0)'+sDiv+' AS SALDOREF2,');
      SL.Add('  NVL(SR3.SALDO,0)'+sDiv+' AS SALDOREF3,');
      SL.Add('  DECODE( SIGN( NVL(SR1.SALDO,0) ), -1, ''C'', 1, ''D'', '' '') AS SALDOREF1_DC,');
      SL.Add('  DECODE( SIGN( NVL(SR2.SALDO,0) ), -1, ''C'', 1, ''D'', '' '') AS SALDOREF2_DC,');
      SL.Add('  DECODE( SIGN( NVL(SR3.SALDO,0) ), -1, ''C'', 1, ''D'', '' '') AS SALDOREF3_DC');
    end;
    SL.Add('FROM PLANOCONTA C,');

    SL.Add('   (SELECT');
    SL.Add('      PS.PLACONTA,');
    SL.Add('      SUM( NVL(PS.PLSDEBITOCORRENTE, 0) - NVL(PS.PLSCREDITOCOR, 0) ) AS SALDO');
    SL.Add('    FROM');
    SL.Add('      PLANOSALDO PS');
    SL.Add('    WHERE (PS.PEREXERCICIO = ' + IntToStr(Year(dRef1)) + ')');
    SL.Add('      AND ((PS.PERNUMERO <= ' + IntToStr(Month(dRef1)) + ') OR (PS.PERNUMERO IS NULL))');
    SL.Add(sPSWhere);
    SL.Add('    GROUP BY PS.PLACONTA ) SR1,');

    SL.Add('   (SELECT');
    SL.Add('      PS.PLACONTA,');
    SL.Add('      SUM( NVL(PS.PLSDEBITOCORRENTE, 0) - NVL(PS.PLSCREDITOCOR, 0) ) AS SALDO');
    SL.Add('    FROM');
    SL.Add('      PLANOSALDO PS');
    SL.Add('    WHERE (PS.PEREXERCICIO = ' + IntToStr(Year(dRef2)) + ')');
    SL.Add('      AND ((PS.PERNUMERO <= ' + IntToStr(Month(dRef2)) + ') OR (PS.PERNUMERO IS NULL))');
    SL.Add(sPSWhere);
    SL.Add('    GROUP BY PS.PLACONTA ) SR2,');

    SL.Add('   (SELECT');
    SL.Add('      PS.PLACONTA,');
    SL.Add('      SUM( NVL(PS.PLSDEBITOCORRENTE, 0) - NVL(PS.PLSCREDITOCOR, 0) ) AS SALDO');
    SL.Add('    FROM');
    SL.Add('      PLANOSALDO PS');
    SL.Add('    WHERE (PS.PEREXERCICIO = ' + IntToStr(Year(dRef3)) + ')');
    SL.Add('      AND ((PS.PERNUMERO <= ' + IntToStr(Month(dRef3)) + ') OR (PS.PERNUMERO IS NULL))');
    SL.Add(sPSWhere);
    SL.Add('    GROUP BY PS.PLACONTA ) SR3,');

    SL.Add('   (SELECT');
    SL.Add('      PS.PLACONTA,');
    SL.Add('      SUM( NVL(PS.PLSDEBITOCORRENTE, 0) - NVL(PS.PLSCREDITOCOR, 0) ) AS SALDO');
    SL.Add('    FROM');
    SL.Add('      PLANOSALDO PS');
    SL.Add('    WHERE (PS.PEREXERCICIO = ' + IntToStr(Year(dRef4)) + ')');
    SL.Add('      AND ((PS.PERNUMERO <= ' + IntToStr(Month(dRef4)) + ') OR (PS.PERNUMERO IS NULL))');
    SL.Add(sPSWhere);
    SL.Add('    GROUP BY PS.PLACONTA ) SR4');

    SL.Add('WHERE (C.PLACONTA = SR1.PLACONTA(+))');
    SL.Add('  AND (C.PLACONTA = SR2.PLACONTA(+))');
    SL.Add('  AND (C.PLACONTA = SR3.PLACONTA(+))');
    SL.Add('  AND (C.PLACONTA = SR4.PLACONTA(+))');
    SL.Add('  AND (C.PLANO = ' + sPlano + ')');

    if Trim(sContas) <> '' then
    begin
      if Pos(',', sContas) > 0 then
        SL.Add('  AND (TRIM(C.PLACONTA) IN ('+sContas+'))')
      else
        SL.Add('  AND (TRIM(C.PLACONTA) = '+sContas+')');
    end;

    SL.Add('ORDER BY C.PLACONTA');

    SL.SaveToFile(Sistema.RetornaCaminhoArquivos(Sistema.IdEmpresa) + '\RptCGPC28.txt');

    Result := GetDataPacket(SL.Text);

  finally
    SL.Free;
  end;

end;

end.
