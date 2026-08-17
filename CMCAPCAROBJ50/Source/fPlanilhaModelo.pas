{-------------------------------------------------------------------------------
-------------------------------- ALTERAÇÕES ------------------------------------
--------------------------------------------------------------------------------
 N. Solicitação: WO7933 - WO8229
 Dt Alteração..: 11/12/2024
 Responsável...: Luis Ferrari
 Descrição.....: Tela para gerar planilha modelo com todas as abas e dados atualizados para importação do rateio
                 de lançamentos de documentos.
--------------------------------------------------------------------------------
}
unit fPlanilhaModelo;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  FOkCancelar, IvDictio, IvMulti, IvEMulti, MAHlpBtn, StdCtrls, Buttons,
  TB97Tlbr, TB97, ExtCtrls, uCmSqlParams, ComObj, DB, DBClient,
  uCMClientDataSet;

type
  TFrmPlanilhaModelo = class(TfrmOkCancelar)
    SqlUnidNegoc: TCMSqlParams;
    SqlCentroRespon: TCMSqlParams;
    SQLTipoDesembolso: TCMSqlParams;
    Button1: TButton;
    SqlCentroCusto: TCMSqlParams;
    CdsCentroCusto: TCMClientDataSet;
    CdsUnidNegoc: TCMClientDataSet;
    CdsCentroRespon: TCMClientDataSet;
    CdsTipoDesenbolso: TCMClientDataSet;
    SqlProgramaPrev: TCMSqlParams;
    CdsProgramaPrev: TCMClientDataSet;
    SqlPatroPrev: TCMSqlParams;
    CdsPatroPrev: TCMClientDataSet;
    SqlPlanoPrev: TCMSqlParams;
    CdsPlanoPrev: TCMClientDataSet;
    procedure Button1Click(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  FrmPlanilhaModelo: TFrmPlanilhaModelo;

implementation

uses
   uMensErro, uDataBase, DBaseDados, uSistema, ustring, dReports,
   fMostraRelat, udiasuteis, JclMath, uFormManager,
   Registry, uCtrlParamIntegra, uFuncaoGeral, fAguarde, uCmDialogs;

{$R *.DFM}

procedure TFrmPlanilhaModelo.Button1Click(Sender: TObject);
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
const
  xlValidateList = 3;
  xlValidAlertStop = 1;
  xlBetween = 1;

begin
  inherited;
  SqlUnidNegoc.Prepare;
  SqlUnidNegoc.ParamByName('IDPESSOA').AsFloat := Sistema.idempresa;
  SqlUnidNegoc.Open;

  SqlCentroRespon.Prepare;
  SqlCentroRespon.Open;

  SQLTipoDesembolso.Prepare;
  SQLTipoDesembolso.Open;

  SqlCentroCusto.Prepare;
  SqlCentroCusto.Open;

  SqlPlanoPrev.Prepare;
  SqlPlanoPrev.Open;

  SqlProgramaPrev.Prepare;
  SqlProgramaPrev.Open;

  SqlPatroPrev.Prepare;
  SqlPatroPrev.Open;

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
    for i := 0 to CdsUnidNegoc.FieldCount - 1 do
    begin
      Worksheet.Cells[1, i + 1] := CdsUnidNegoc.Fields[i].FieldName; // Cabeçalhos
    end;

    CdsUnidNegoc.First;
    for i := 1 to CdsUnidNegoc.RecordCount do
    begin
      for j := 0 to CdsUnidNegoc.FieldCount - 1 do
      begin
        Worksheet.Cells[i + 1, j + 1] := CdsUnidNegoc.Fields[j].AsString; // Dados
      end;
      CdsUnidNegoc.Next;
    end;
    contAbaAtividadeProjeto := i;

    // Criar proxima aba e carregar dados da tabela

    Worksheet := Workbook.Worksheets.Add(EmptyParam, Workbook.Worksheets[Workbook.Worksheets.Count]);
    Worksheet.Name := 'CentroResponsabilidade';

    // Exportar dados da segunda tabela
    for i := 0 to CdsCentroRespon.FieldCount - 1 do
    begin
      Worksheet.Cells[1, i + 1] := CdsCentroRespon.Fields[i].FieldName; // Cabeçalhos
    end;

    CdsCentroRespon.First;
    for i := 1 to CdsCentroRespon.RecordCount do
    begin
      for j := 0 to CdsCentroRespon.FieldCount - 1 do
      begin
        Worksheet.Cells[i + 1, j + 1] := CdsCentroRespon.Fields[j].AsString; // Dados
      end;
      CdsCentroRespon.Next;
    end;
    contAbaCentroResponsabilidade := i;

    // Criar proxima aba e carregar dados da tabela

    Worksheet := Workbook.Worksheets.Add(EmptyParam, Workbook.Worksheets[Workbook.Worksheets.Count]);
    Worksheet.Name := 'TipoDesembolso';

    // Exportar dados da segunda tabela
    for i := 0 to CdsTipoDesenbolso.FieldCount - 1 do
    begin
      Worksheet.Cells[1, i + 1] := CdsTipoDesenbolso.Fields[i].FieldName; // Cabeçalhos
    end;

    CdsTipoDesenbolso.First;
    for i := 1 to CdsTipoDesenbolso.RecordCount do
    begin
      for j := 0 to CdsTipoDesenbolso.FieldCount - 1 do
      begin
        Worksheet.Cells[i + 1, j + 1] := CdsTipoDesenbolso.Fields[j].AsString; // Dados
      end;
      CdsTipoDesenbolso.Next;
    end;
    contAbaTipoDesembolso := i;

    // Criar proxima aba e carregar dados da tabela

    Worksheet := Workbook.Worksheets.Add(EmptyParam, Workbook.Worksheets[Workbook.Worksheets.Count]);
    Worksheet.Name := 'CentrodeCusto';

    // Exportar dados da segunda tabela
    for i := 0 to CdsCentroCusto.FieldCount - 1 do
    begin
      Worksheet.Cells[1, i + 1] := CdsCentroCusto.Fields[i].FieldName; // Cabeçalhos
    end;

    CdsCentroCusto.First;
    for i := 1 to CdsCentroCusto.RecordCount do
    begin
      for j := 0 to CdsCentroCusto.FieldCount - 1 do
      begin
        Worksheet.Cells[i + 1, j + 1] := CdsCentroCusto.Fields[j].AsString; // Dados
      end;
      CdsCentroCusto.Next;
    end;
    contAbaCentrodeCusto := i;

    // Criar proxima aba e carregar dados da tabela

    Worksheet := Workbook.Worksheets.Add(EmptyParam, Workbook.Worksheets[Workbook.Worksheets.Count]);
    Worksheet.Name := 'Programa';

    // Exportar dados da segunda tabela
    for i := 0 to CdsProgramaPrev.FieldCount - 1 do
    begin
      Worksheet.Cells[1, i + 1] := CdsProgramaPrev.Fields[i].FieldName; // Cabeçalhos
    end;

    CdsProgramaPrev.First;
    for i := 1 to CdsProgramaPrev.RecordCount do
    begin
      for j := 0 to CdsProgramaPrev.FieldCount - 1 do
      begin
        Worksheet.Cells[i + 1, j + 1] := CdsProgramaPrev.Fields[j].AsString; // Dados
      end;
      CdsProgramaPrev.Next;
    end;
    contAbaPrograma := i;

    // Criar proxima aba e carregar dados da tabela

    Worksheet := Workbook.Worksheets.Add(EmptyParam, Workbook.Worksheets[Workbook.Worksheets.Count]);
    Worksheet.Name := 'Patrocinadora';

    // Exportar dados da segunda tabela
    for i := 0 to CdsPatroPrev.FieldCount - 1 do
    begin
      Worksheet.Cells[1, i + 1] := CdsPatroPrev.Fields[i].FieldName; // Cabeçalhos
    end;

    CdsPatroPrev.First;
    for i := 1 to CdsPatroPrev.RecordCount do
    begin
      for j := 0 to CdsPatroPrev.FieldCount - 1 do
      begin
        Worksheet.Cells[i + 1, j + 1] := CdsPatroPrev.Fields[j].AsString; // Dados
      end;
      CdsPatroPrev.Next;
    end;
    contAbaPatrocinadora := i;

    // Criar proxima aba e carregar dados da tabela

    Worksheet := Workbook.Worksheets.Add(EmptyParam, Workbook.Worksheets[Workbook.Worksheets.Count]);
    Worksheet.Name := 'PlanoPrevidenciario';

    // Exportar dados da segunda tabela
    for i := 0 to CdsPlanoPrev.FieldCount - 1 do
    begin
      Worksheet.Cells[1, i + 1] := CdsPlanoPrev.Fields[i].FieldName; // Cabeçalhos
    end;

    CdsPlanoPrev.First;
    for i := 1 to CdsPlanoPrev.RecordCount do
    begin
      for j := 0 to CdsPlanoPrev.FieldCount - 1 do
      begin
        Worksheet.Cells[i + 1, j + 1] := CdsPlanoPrev.Fields[j].AsString; // Dados
      end;
      CdsPlanoPrev.Next;
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

    TargetSheet.Range['A2:A1000'].Formula := '=IFERROR(VLOOKUP(@Rateio!A:A,''AtividadeProjeto''!A:B,2,2),"")';

    // Macro para zerar as informações na planilha rateio
    TargetSheet := Workbook.Worksheets[1];

    Button := TargetSheet.Shapes.AddFormControl(1, 400, 50, 450, 30); // Tipo 2 = botão de formulário

    Button.OLEFormat.Object.Caption := 'Limpar Células';

    Button.OnAction := 'Limpar';

    Workbook.Names.Add('Limpar', 'Rateio!A2:J999');
    TargetSheet.Range['A2:J999'].ClearContents;

  finally
    // Excel.Quit; // Descomente se desejar fechar o Excel automaticamente
  end;

end;

end.
