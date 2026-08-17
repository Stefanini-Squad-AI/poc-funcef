unit UGeraPlanilhaModelo;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  FOkCancelar, IvDictio, IvMulti, IvEMulti, MAHlpBtn, StdCtrls, Buttons,
  TB97Tlbr, TB97, ExtCtrls, uCmSqlParams, ComObj, DB, dbtables, DBClient,
  uCMClientDataSet;

const
  xlValidateList = 3;
  xlValidAlertStop = 1;
  xlBetween = 1;
  xlSheetVeryHidden = 2;
  xlSheetHidden = 1;

procedure PlanilhaModeloCustos;
procedure AbrirTabelas;

implementation

procedure PlanilhaModeloCustos;
var
  Excel: OleVariant;
  Workbook: OleVariant;
  Worksheet: OleVariant;
  VBModule: OLEVariant;
  VBA_Code: string;
  i,j: Integer;
  contAbaAtividadeProjeto,contAbaCentroResponsabilidade,contAbaTipoDesembolso,
  contAbaCentrodeCusto,contAbaPrograma,contAbaPatrocinadora,contAbaPlanoPrevidenciario : integer;
  ExcelApp, SourceSheet, TargetSheet, ComboBoxAux, Button: OleVariant;
  SqlUnidNegoc, SqlCentroRespon, SqlTipoDesenbolso,
  SqlCentroCusto, SqlProgramaPrev, SqlPatroPrev, SqlPlanoPrev : TQuery;

begin
  //AbrirTabelas;
  SqlUnidNegoc := TQuery.Create(Application);
  SqlUnidNegoc.DatabaseName := 'BASEDADOS';

  SqlUnidNegoc.Close;
  with (SqlUnidNegoc.SQL) do
  begin
    Clear;
    Add('SELECT '  +
        '   NOME,UNIDNEGOC  '  +
        'FROM   '  +
        '  UNIDNEGOCIO      '  +
        'WHERE              '  +
        '  (IDPESSOA = 1)    '   +
        'AND UNETIPO = ''A'' AND ATIVO = ''S''  '  +
        'ORDER BY    '    +
        '  NOME      ');
  end;
  SqlUnidNegoc.open;

  SqlCentroRespon := TQuery.Create(Application);
  SqlCentroRespon.DatabaseName := 'BASEDADOS';

  SqlCentroRespon.Close;
  with (SqlCentroRespon.SQL) do
  begin
    Clear;
    Add('SELECT '  +
        '      CEN.NOME,    '  +
        '      CEN.CODCENTRORESPON  '  +
        'FROM  '  +
        '    CENTRESPON CEN, '  +
        '    PESSOAXCRESP PES   '  +
        'WHERE                  '  +
        '     (CEN.CODCENTRORESPON=PES.CODCENTRORESPON)   '  +
        'AND CEN.ANALITICOSINTET = ''A''    '  +
        'AND CEN.ATIVO = ''S''   '  +
        'GROUP BY CEN.NOME,CEN.CODCENTRORESPON    '  +
        'ORDER BY CEN.NOME   ');
  end;
  SqlCentroRespon.open;

  SqlTipoDesenbolso := TQuery.Create(Application);
  SqlTipoDesenbolso.DatabaseName := 'BASEDADOS';

  SqlTipoDesenbolso.Close;
  with (SqlTipoDesenbolso.SQL) do
  begin
    Clear;
    Add('SELECT  '  +
        '        DESCRICAO,     '  +
        '        CODTIPRECDES   '  +
        'FROM                   '  +
        '    TIPORECEBDESEMB    '  +
        'WHERE ATIVO = ''S''    '  +
        'order by DESCRICAO     ');
  end;
  SqlTipoDesenbolso.open;

  SqlCentroCusto := TQuery.Create(Application);
  SqlCentroCusto.DatabaseName := 'BASEDADOS';

  SqlCentroCusto.Close;
  with (SqlCentroCusto.SQL) do
  begin
    Clear;
    Add('SELECT   '  +
        '   NOME,  '  +
        '   CODCENTROCUSTO   '  +
        'FROM    '  +
        '   CENTCUST  '  +
        'WHERE ATIVO = ''S''   '  +
        'AND STATUSGRUPOCDC = ''A''  '  +
        'ORDER BY NOME');
  end;
  SqlCentroCusto.open;

  SqlProgramaPrev := TQuery.Create(Application);
  SqlProgramaPrev.DatabaseName := 'BASEDADOS';

  SqlProgramaPrev.Close;
  with (SqlProgramaPrev.SQL) do
  begin
    Clear;
    Add('SELECT  '  +
        '   DESCPROGRAMA,  '  +
        '   IDPROGRAMA     '  +
        'FROM   '  +
        '   PROGRAMA   '  +
        'ORDER BY      '  +
        '   DESCPROGRAMA  ');
  end;
  SqlProgramaPrev.open;

  SqlPatroPrev := TQuery.Create(Application);
  SqlPatroPrev.DatabaseName := 'BASEDADOS';

  SqlPatroPrev.Close;
  with (SqlPatroPrev.SQL) do
  begin
    Clear;
    Add('SELECT   '  +
        '   PESSOA.NOME,  '  +
        '   PATRO.IDPESSOA as IDPATRO   '  +
        'FROM    '  +
        '   PESSOA,  '  +
        '   PATRO    '  +
        'WHERE   '  +
        '   PESSOA.IDPESSOA = PATRO.IDPESSOA  '  +
        'ORDER BY  '  +
        '   PESSOA.NOME  ');
  end;
  SqlPatroPrev.open;

  SqlPlanoPrev := TQuery.Create(Application);
  SqlPlanoPrev.DatabaseName := 'BASEDADOS';

  SqlPlanoPrev.Close;
  with (SqlPlanoPrev.SQL) do
  begin
    Clear;
    Add('SELECT   '  +
       '   NOME, '  +
       '   IDPLANOPREV   '  +
       'FROM   '  +
       '   PLANPREVCONTABIL  '  +
       'WHERE    '  +
       '   NVL(ATIVO, ''S'') = ''S''  '  +
       'ORDER BY  '  +
       '   NOME  ');
  end;
  SqlPlanoPrev.open;

  // Criar instância do Excel
  Excel := CreateOleObject('Excel.Application');
  try
    Excel.Visible := True; // Torna o Excel visível
    Workbook := Excel.Workbooks.Add;

    // Criar primeira aba e carregar dados
    Worksheet := Workbook.Worksheets[1];
    Worksheet.Name := 'Rateio';
    // Cabeçalho do Rateio
    Worksheet.Cells[1, 1] := 'ID-Atividade/Projeto';
    Worksheet.Cells[1, 2] := 'ID-Centro Responsabilidade';
    Worksheet.Cells[1, 3] := 'ID-Tipo Desembolso';
    Worksheet.Cells[1, 4] := 'ID-Centro Custo';
    Worksheet.Cells[1, 5] := 'Programa';
    Worksheet.Cells[1, 6] := 'Patrocinadora';
    Worksheet.Cells[1, 7] := 'Plano Previdenciario';
    Worksheet.Cells[1, 8] := 'Valor';

    // Criar segunda aba e carregar dados da segunda tabela

    Worksheet := Workbook.Worksheets.Add(EmptyParam, Workbook.Worksheets[Workbook.Worksheets.Count]);
    Worksheet.Name := 'importacao';
    // Cabeçalho da importacao , ira receber somente os codigos
    Worksheet.Cells[1, 1] := 'ID-Atividade/Projeto';
    Worksheet.Cells[1, 2] := 'ID-Centro Responsabilidade';
    Worksheet.Cells[1, 3] := 'ID-Tipo Desembolso';
    Worksheet.Cells[1, 4] := 'ID-Centro Custo';
    Worksheet.Cells[1, 5] := 'Programa';
    Worksheet.Cells[1, 6] := 'Patrocinadora';
    Worksheet.Cells[1, 7] := 'Plano Previdenciario';
    Worksheet.Cells[1, 8] := 'Valor';

    // Criar proxima aba e carregar dados da tabela

    Worksheet := Workbook.Worksheets.Add(EmptyParam, Workbook.Worksheets[Workbook.Worksheets.Count]);
    Worksheet.Name := 'AtividadeProjeto';

    // Exportar dados da primeira tabela
    for i := 0 to SqlUnidNegoc.FieldCount - 1 do
    begin
      Worksheet.Cells[1, i + 1] := SqlUnidNegoc.Fields[i].FieldName; // Cabeçalhos
    end;

    SqlUnidNegoc.First;
    for i := 1 to SqlUnidNegoc.RecordCount do
    begin
      for j := 0 to SqlUnidNegoc.FieldCount - 1 do
      begin
        Worksheet.Cells[i + 1, j + 1] := SqlUnidNegoc.Fields[j].AsString; // Dados
      end;
      SqlUnidNegoc.Next;
    end;
    contAbaAtividadeProjeto := i;

    // Criar proxima aba e carregar dados da tabela

    Worksheet := Workbook.Worksheets.Add(EmptyParam, Workbook.Worksheets[Workbook.Worksheets.Count]);
    Worksheet.Name := 'CentroResponsabilidade';

    // Exportar dados da segunda tabela
    for i := 0 to SqlCentroRespon.FieldCount - 1 do
    begin
      Worksheet.Cells[1, i + 1] := SqlCentroRespon.Fields[i].FieldName; // Cabeçalhos
    end;

    SqlCentroRespon.First;
    for i := 1 to SqlCentroRespon.RecordCount do
    begin
      for j := 0 to SqlCentroRespon.FieldCount - 1 do
      begin
        Worksheet.Cells[i + 1, j + 1] := SqlCentroRespon.Fields[j].AsString; // Dados
      end;
      SqlCentroRespon.Next;
    end;
    contAbaCentroResponsabilidade := i;

    // Criar proxima aba e carregar dados da tabela

    Worksheet := Workbook.Worksheets.Add(EmptyParam, Workbook.Worksheets[Workbook.Worksheets.Count]);
    Worksheet.Name := 'TipoDesembolso';

    // Exportar dados da segunda tabela
    for i := 0 to SqlTipoDesenbolso.FieldCount - 1 do
    begin
      Worksheet.Columns['B'].NumberFormat := '@';
      Worksheet.Cells[1, i + 1] := SqlTipoDesenbolso.Fields[i].FieldName; // Cabeçalhos
    end;

    SqlTipoDesenbolso.First;
    for i := 1 to SqlTipoDesenbolso.RecordCount do
    begin
      for j := 0 to SqlTipoDesenbolso.FieldCount - 1 do
      begin
        Worksheet.Cells[i + 1, j + 1] := SqlTipoDesenbolso.Fields[j].AsString; // Dados
      end;
      SqlTipoDesenbolso.Next;
    end;
    contAbaTipoDesembolso := i;

    // Criar proxima aba e carregar dados da tabela

    Worksheet := Workbook.Worksheets.Add(EmptyParam, Workbook.Worksheets[Workbook.Worksheets.Count]);
    Worksheet.Name := 'CentrodeCusto';

    // Exportar dados da segunda tabela
    for i := 0 to SqlCentroCusto.FieldCount - 1 do
    begin
      Worksheet.Cells[1, i + 1] := QuotedStr(SqlCentroCusto.Fields[i].FieldName); // Cabeçalhos
    end;

    SqlCentroCusto.First;
    for i := 1 to SqlCentroCusto.RecordCount do
    begin
      for j := 0 to SqlCentroCusto.FieldCount - 1 do
      begin
        Worksheet.Cells[i + 1, j + 1] := SqlCentroCusto.Fields[j].AsString; // Dados
      end;
      SqlCentroCusto.Next;
    end;
    contAbaCentrodeCusto := i;

    // Criar proxima aba e carregar dados da tabela

    Worksheet := Workbook.Worksheets.Add(EmptyParam, Workbook.Worksheets[Workbook.Worksheets.Count]);
    Worksheet.Name := 'Programa';

    // Exportar dados da segunda tabela
    for i := 0 to SqlProgramaPrev.FieldCount - 1 do
    begin
      Worksheet.Cells[1, i + 1] := SqlProgramaPrev.Fields[i].FieldName; // Cabeçalhos
    end;

    SqlProgramaPrev.First;
    for i := 1 to SqlProgramaPrev.RecordCount do
    begin
      for j := 0 to SqlProgramaPrev.FieldCount - 1 do
      begin
        Worksheet.Cells[i + 1, j + 1] := SqlProgramaPrev.Fields[j].AsString; // Dados
      end;
      SqlProgramaPrev.Next;
    end;
    contAbaPrograma := i;

    // Criar proxima aba e carregar dados da tabela

    Worksheet := Workbook.Worksheets.Add(EmptyParam, Workbook.Worksheets[Workbook.Worksheets.Count]);
    Worksheet.Name := 'Patrocinadora';

    // Exportar dados da segunda tabela
    for i := 0 to SqlPatroPrev.FieldCount - 1 do
    begin
      Worksheet.Cells[1, i + 1] := SqlPatroPrev.Fields[i].FieldName; // Cabeçalhos
    end;

    SqlPatroPrev.First;
    for i := 1 to SqlPatroPrev.RecordCount do
    begin
      for j := 0 to SqlPatroPrev.FieldCount - 1 do
      begin
        Worksheet.Cells[i + 1, j + 1] := SqlPatroPrev.Fields[j].AsString; // Dados
      end;
      SqlPatroPrev.Next;
    end;
    contAbaPatrocinadora := i;

    // Criar proxima aba e carregar dados da tabela

    Worksheet := Workbook.Worksheets.Add(EmptyParam, Workbook.Worksheets[Workbook.Worksheets.Count]);
    Worksheet.Name := 'PlanoPrevidenciario';

    // Exportar dados da segunda tabela
    for i := 0 to SqlPlanoPrev.FieldCount - 1 do
    begin
      Worksheet.Cells[1, i + 1] := SqlPlanoPrev.Fields[i].FieldName; // Cabeçalhos
    end;

    SqlPlanoPrev.First;
    for i := 1 to SqlPlanoPrev.RecordCount do
    begin
      for j := 0 to SqlPlanoPrev.FieldCount - 1 do
      begin
        Worksheet.Cells[i + 1, j + 1] := SqlPlanoPrev.Fields[j].AsString; // Dados
      end;
      SqlPlanoPrev.Next;
    end;
    contAbaPlanoPrevidenciario := i;

    // Adiciona uma ComboBox na planilha de Rateio
    TargetSheet := Workbook.Worksheets[1];

    TargetSheet.Range['A2:A1000'].Validation.Add(xlValidateList, xlValidAlertStop, xlBetween, '=AtividadeProjeto!$A$1:$A$' + inttostr(contAbaAtividadeProjeto));
    TargetSheet.Range['B2:B1000'].Validation.Add(xlValidateList, xlValidAlertStop, xlBetween, '=CentroResponsabilidade!$A$1:$A$' + inttostr(contAbaCentroResponsabilidade));
    TargetSheet.Range['C2:C1000'].Validation.Add(xlValidateList, xlValidAlertStop, xlBetween, '=TipoDesembolso!$A$1:$A$' + inttostr(contAbaTipoDesembolso));
    TargetSheet.Range['D2:D1000'].Validation.Add(xlValidateList, xlValidAlertStop, xlBetween, '=CentrodeCusto!$A$1:$A$' + inttostr(contAbaCentrodeCusto));
    TargetSheet.Range['E2:E1000'].Validation.Add(xlValidateList, xlValidAlertStop, xlBetween, '=Programa!$A$1:$A$' + inttostr(contAbaPrograma));
    TargetSheet.Range['F2:F1000'].Validation.Add(xlValidateList, xlValidAlertStop, xlBetween, '=Patrocinadora!$A$1:$A$' + inttostr(contAbaPatrocinadora));
    TargetSheet.Range['G2:G1000'].Validation.Add(xlValidateList, xlValidAlertStop, xlBetween, '=PlanoPrevidenciario!$A$1:$A$' + inttostr(contAbaPlanoPrevidenciario));

    // adiciona a formula na planilha importacao (a que vai realmente ser consumida na importação do rateio)
    TargetSheet := Workbook.Worksheets[2];
                          
    TargetSheet.Range['A2:A1000'].Formula := '=IFERROR(VLOOKUP(@Rateio!A:A,''AtividadeProjeto''!A:B,2,false),"")';
    TargetSheet.Range['B2:B1000'].Formula := '=IFERROR(VLOOKUP(@Rateio!B:B,''CentroResponsabilidade''!A:B,2,false),"")';
    TargetSheet.Range['C2:C1000'].Formula := '=IFERROR(VLOOKUP(@Rateio!C:C,''TipoDesembolso''!A:B,2,false),"")';
    TargetSheet.Range['D2:D1000'].Formula := '=IFERROR(VLOOKUP(@Rateio!D:D,''CentrodeCusto''!A:B,2,false),"")';
    TargetSheet.Range['E2:E1000'].Formula := '=IFERROR(VLOOKUP(@Rateio!E:E,''Programa''!A:B,2,false),"")';
    TargetSheet.Range['F2:F1000'].Formula := '=IFERROR(VLOOKUP(@Rateio!F:F,''Patrocinadora''!A:B,2,false),"")';
    TargetSheet.Range['G2:G1000'].Formula := '=IFERROR(VLOOKUP(@Rateio!G:G,''PlanoPrevidenciario''!A:B,2,false),"")';
    TargetSheet.Range['H2:H1000'].Formula := '=IF(Rateio!H2="","",Rateio!H2)';
    Workbook.Worksheets['Rateio'].Select;

    for i := 3 to 9 do
      Workbook.Worksheets[i].Visible := xlSheetVeryHidden;

  finally
    // Excel.Quit; // Descomente se desejar fechar o Excel automaticamente
  end;

end;

procedure AbrirTabelas;
var
  SqlUnidNegoc, SqlCentroRespon, SQLTipoDesembolso,
  SqlCentroCusto, SqlProgramaPrev, SqlPatroPrev, SqlPlanoPrev : TQuery;
Begin
  SqlUnidNegoc := TQuery.Create(Application);
  SqlUnidNegoc.DatabaseName := 'BASEDADOS';

  SqlUnidNegoc.Close;
  with (SqlUnidNegoc.SQL) do
  begin
    Clear;
    Add('SELECT '  +
        '   NOME,UNIDNEGOC  '  +
        'FROM   '  +
        '  UNIDNEGOCIO      '  +
        'WHERE              '  +
        '  (IDPESSOA = :IDPESSOA)    '   +
        'AND UNETIPO = ''A'' AND ATIVO = ''S''  '  +
        'ORDER BY    '    +
        '  NOME      ');
  end;
  SqlUnidNegoc.open;

  SqlCentroRespon := TQuery.Create(Application);
  SqlCentroRespon.DatabaseName := 'BASEDADOS';

  SqlCentroRespon.Close;
  with (SqlCentroRespon.SQL) do
  begin
    Clear;
    Add('SELECT '  +
        '      CEN.NOME,    '  +
        '      CEN.CODCENTRORESPON  '  +
        'FROM  '  +
        '    CENTRESPON CEN, '  +
        '    PESSOAXCRESP PES   '  +
        'WHERE                  '  +
        '     (CEN.CODCENTRORESPON=PES.CODCENTRORESPON)   '  +
        'AND CEN.ANALITICOSINTET = ''A''    '  +
        'AND CEN.ATIVO = ''S''   '  +
        'GROUP BY CEN.NOME,CEN.CODCENTRORESPON    '  +
        'ORDER BY CEN.NOME   ');
  end;
  SqlCentroRespon.open;

  SQLTipoDesembolso := TQuery.Create(Application);
  SQLTipoDesembolso.DatabaseName := 'BASEDADOS';

  SQLTipoDesembolso.Close;
  with (SQLTipoDesembolso.SQL) do
  begin
    Clear;
    Add('SELECT  '  +
        '        DESCRICAO,     '  +
        '        CODTIPRECDES   '  +
        'FROM                   '  +
        '    TIPORECEBDESEMB    '  +
        'WHERE ATIVO = ''S''    '  +
        'order by DESCRICAO     ');
  end;
  SQLTipoDesembolso.open;

  SqlCentroCusto := TQuery.Create(Application);
  SqlCentroCusto.DatabaseName := 'BASEDADOS';

  SqlCentroCusto.Close;
  with (SqlCentroCusto.SQL) do
  begin
    Clear;
    Add('SELECT   '  +
        '   NOME,  '  +
        '   CODCENTROCUSTO   '  +
        'FROM    '  +
        '   CENTCUST  '  +
        'WHERE ATIVO = ''S''   '  +
        'AND STATUSGRUPOCDC = ''A''  '  +
        'ORDER BY NOME');
  end;
  SqlCentroCusto.open;

  SqlProgramaPrev := TQuery.Create(Application);
  SqlProgramaPrev.DatabaseName := 'BASEDADOS';

  SqlProgramaPrev.Close;
  with (SqlProgramaPrev.SQL) do
  begin
    Clear;
    Add('SELECT  '  +
        '   DESCPROGRAMA,  '  +
        '   IDPROGRAMA     '  +
        'FROM   '  +
        '   PROGRAMA   '  +
        'ORDER BY      '  +
        '   DESCPROGRAMA  ');
  end;
  SqlProgramaPrev.open;

  SqlPatroPrev := TQuery.Create(Application);
  SqlPatroPrev.DatabaseName := 'BASEDADOS';

  SqlPatroPrev.Close;
  with (SqlPatroPrev.SQL) do
  begin
    Clear;
    Add('SELECT   '  +
        '   PESSOA.NOME,  '  +
        '   PATRO.IDPESSOA as IDPATRO   '  +
        'FROM    '  +
        '   PESSOA,  '  +
        '   PATRO    '  +
        'WHERE   '  +
        '   PESSOA.IDPESSOA = PATRO.IDPESSOA  '  +
        'ORDER BY  '  +
        '   PESSOA.NOME  ');
  end;
  SqlPatroPrev.open;

  SqlPlanoPrev := TQuery.Create(Application);
  SqlPlanoPrev.DatabaseName := 'BASEDADOS';

  SqlPlanoPrev.Close;
  with (SqlPlanoPrev.SQL) do
  begin
    Clear;
    Add('SELECT   '  +
       '   NOME, '  +
       '   IDPLANOPREV   '  +
       'FROM   '  +
       '   PLANPREVCONTABIL  '  +
       'WHERE    '  +
       '   NVL(ATIVO, ''S'') = ''S''  '  +
       'ORDER BY  '  +
       '   NOME  ');
  end;
  SqlPlanoPrev.open;


end;

end.
