unit uImprimeRelatorio;

interface

uses Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
     Db, DBTables, Wwquery, Wwdatsrc, ppDB, ppDBBDE, ppReport, ppEndUsr, StdCtrls,
     ppForms, ppTypes, ppPrvDlg;

type
  TErrorReports  = 0..10;
  TTipoImpressao = (tpAbreQuery, tpQueryComDados);

  TImprimeRelatorio = class
  private
    FDesigner: TppDesigner;
    FRelatorio: TppReport;
    FPipeLine: TppBDEPipeline;
    FQueryDados,
    FQueryReport: TQuery;
    FUpdateSQL: TUpdateSQL;

    FidOrigemCM: byte;
    FidModulo: integer;
    FGravaLogSQL: boolean;
    FDescricaoRelat, FNomeRelat, FArqTemplate: string;
    FqryDados, FTemplate, FTemplatePadrao: TStringList;
    FErrorReports: TErrorReports;
    FTipoImpressao: TTipoImpressao;
    FLayoutPadrao: TStringList;

    procedure SetOrigemCM(OrigemCM: byte);
    procedure SetQueryDados(QueryDados: TStringList);
    procedure SetLayoutPadrao(Layout: TStringList);
    procedure SetGravaLogSQL(Opcao: boolean);
    function  GetGravaLogSQL: boolean;

    function  AbreQueryDadosReport (Parametros: array of variant): TErrorReports;
    function  AbreQueryReport (sppReport:string; idModulo:integer): TErrorReports;
    function GetQueryDados: TStringList;
  public
    constructor Create;
    destructor  Destroy; override;
    function    Iniciar(Designer:TppDesigner;
                        Relatorio:TppReport;
                        PipeLine:TppBDEPipeline;
                        QueryDados:TQuery;
                        LayoutPad:TStringList;
                        sDescricaoRelat,sNomeRelat,sArqTemplate:string;
                        idModulo:integer): TErrorReports;

    procedure Imprimir(Parametros: array of variant);
    procedure Configurar;
    procedure RestaurarConfiguracao;

    property TipoImpressao: TTipoImpressao read FTipoImpressao write FTipoImpressao default tpAbreQuery;
    property QueryDados: TStringList read GetQueryDados write SetQueryDados;
    property LayoutPadrao: TStringList read FLayoutPadrao write SetLayoutPadrao;
    property OrigemCM: byte read FIdOrigemCM write SetOrigemCM default 1;
    property GravaLogSQL: boolean read GetGravaLogSQL  write SetGravaLogSQL default true;
  end;

var
  ImprimeRelatorio: TImprimeRelatorio;

implementation

uses uSistema, uDataBase, uMensErro, printers;

const
  CR_LF               = #13+#10;
  SEM_ERRO            = 0;
  ERRO_PARAM_IDMODULO = 1;
  ERRO_PARAM_LAYOUT   = 2;
  ERRO_PARAM_NOMEREL  = 3;
  ERRO_QUERY_DADOS    = 4;
  ERRO_QUERY_REPORT   = 5;

constructor TImprimeRelatorio.Create;
begin
  inherited Create;

  FTipoImpressao  := tpAbreQuery;
  FErrorReports   := SEM_ERRO;
  FidOrigemCM     := 1;
  FGravaLogSQL    := true;
  FArqTemplate    := 'RelatorioCM.tmp';
  FTemplate       := TStringList.Create;
  FTemplatePadrao := TStringList.Create;
  FqryDados       := TStringList.Create;

  try
    // -----------------------------------------------------------------------------------
    // Criação do UpdateSQL da Query para o Layout do Relatório
    FUpdateSQL := TUpdateSQL.Create(Application);
    with (FUpdateSQL.InsertSQL) do
    begin
      Add('insert into REPORTS');
      Add('  (IDREPORTS, NAME, IDMODULO, ORIGEMCM, PPREPORT, TEMPLATE)');
      Add('values');
      Add('  (:IDREPORTS, :NAME, :IDMODULO, :ORIGEMCM, :PPREPORT, :TEMPLATE)');
    end;

    with (FUpdateSQL.ModifySQL) do
    begin
      Add('update REPORTS');
      Add('set');
      Add('  IDREPORTS = :IDREPORTS,');
      Add('  NAME      = :NAME,');
      Add('  IDMODULO  = :IDMODULO,');
      Add('  ORIGEMCM  = :ORIGEMCM,');
      Add('  PPREPORT  = :PPREPORT,');
      Add('  TEMPLATE  = :TEMPLATE');
      Add('where');
      Add('  IDREPORTS = :OLD_IDREPORTS and');
      Add('  NAME      = :OLD_NAME      and');
      Add('  IDMODULO  = :OLD_IDMODULO  and');
      Add('  ORIGEMCM  = :OLD_ORIGEMCM');
    end;

    with (FUpdateSQL.DeleteSQL) do
    begin
      Add('delete from REPORTS');
      Add('where');
      Add('  IDREPORTS = :OLD_IDREPORTS and');
      Add('  NAME      = :OLD_NAME      and');
      Add('  IDMODULO  = :OLD_IDMODULO  and');
      Add('  ORIGEMCM  = :OLD_ORIGEMCM');
    end;

    // -----------------------------------------------------------------------------------
    // Criação da Query para o Layout do Relatório
    FQueryReport := TQuery.Create(Application);
    with (FQueryReport.SQL) do
    begin
      Clear;
      Add('SELECT');
      Add('  IDREPORTS, NAME, IDMODULO, ORIGEMCM, PPREPORT, TEMPLATE');
      Add('FROM');
      Add('  REPORTS');
      Add('WHERE');
      Add('  (PPREPORT = :PPREPORT) AND');
      Add('  (IDMODULO = :IDMODULO)');
    end;
    FQueryReport.DatabaseName  := 'BaseDados';
    FQueryReport.UpdateObject  := FUpdateSQL;
    FQueryReport.UpdateMode    := upWhereKeyOnly;
    FQueryReport.CachedUpdates := true;
  except
  end;
end;

destructor TImprimeRelatorio.Destroy;
begin
  FQueryReport.Close;
  FQueryDados.Close;

  FqryDados.Free;
  FTemplate.Free;
  FTemplatePadrao.Free;
  FQueryReport.Free;

  inherited Destroy;
end;

function TImprimeRelatorio.Iniciar(Designer:TppDesigner; Relatorio:TppReport;
  PipeLine:TppBDEPipeline; QueryDados:TQuery; LayoutPad:TStringList;
  sDescricaoRelat,sNomeRelat,sArqTemplate:string; idModulo:integer): TErrorReports;
begin
  Result := SEM_ERRO;

  if (Trim(sNomeRelat) <> '') then
    FNomeRelat := sNomeRelat
  else
  begin
    FErrorReports := ERRO_PARAM_NOMEREL;
    Result        := ERRO_PARAM_NOMEREL;
    exit;
  end;

  if (idModulo > 0) then
    FidModulo := idModulo
  else
  begin
    FErrorReports := ERRO_PARAM_IDMODULO;
    Result        := ERRO_PARAM_IDMODULO;
    exit;
  end;

  if Assigned(LayoutPad) then
    FTemplatePadrao.Assign(LayoutPad)
  else
  begin
    FErrorReports := ERRO_PARAM_LAYOUT;
    Result        := ERRO_PARAM_LAYOUT;
    exit;
  end;

  if (Trim(sArqTemplate) <> '') then
    FArqTemplate := sArqTemplate
  else
    FArqTemplate := 'RelatorioCM.tmp';

  FDescricaoRelat := sDescricaoRelat;
  FDesigner       := Designer;
  FRelatorio      := Relatorio;
  FPipeLine       := PipeLine;
  FQueryDados     := QueryDados;

  // -----------------------------------------------------------------------------------
  // Padronização do Relatório
  FRelatorio.Language            := lgPortugueseBrazil;
  FRelatorio.AllowPrintToArchive := true;
  FRelatorio.AllowPrintToFile    := true;
  FRelatorio.SaveAsTemplate      := true;
  FRelatorio.CachePages          := true;
  FRelatorio.Columns             := 1;
  FRelatorio.DataPipeline        := FPipeLine;
  FRelatorio.Template.FileName   := Sistema.TempDir + FArqTemplate;
  FRelatorio.Template.SaveTo     := stFile;
  FRelatorio.Template.Format     := ftASCII;

  // -----------------------------------------------------------------------------------
  // Padronização do PipeLine do Relatório
  PipeLine.OpenDataSource  := false;
  PipeLine.CloseDataSource := false;

  // -----------------------------------------------------------------------------------
  // Padronização do Visualizador do Relatório
  FDesigner.Report       := FRelatorio;
  FDesigner.Caption      := FDescricaoRelat;
  FDesigner.Position     := poScreenCenter;
  FDesigner.ShowData     := true;
  FDesigner.TabsVisible  := true;
  FDesigner.Visible      := false;
  FDesigner.WindowHeight := 400;
  FDesigner.WindowWidth  := 600;
  FDesigner.WindowLeft   := 100;
  FDesigner.WindowTop    := 50;
  FDesigner.WindowState  := wsMaximized;

  // -----------------------------------------------------------------------------------
  // Registro o Form de visualização
  ppRegisterForm(TppCustomPreviewer, TppPrintPreview);

  try
    if (AbreQueryReport (FNomeRelat, FidModulo) <> SEM_ERRO) then
    begin
      MsgDlg('Ocorreu um erro ao tentar abrir a configuração'+CR_LF+
        'no momento da inicialização do Relatório', 'Erro', mtError, [mbOk], 0);
      Result :=  ERRO_QUERY_REPORT;
      exit;
    end;

    if (FQueryReport.IsEmpty) then
    begin
      if (Trim(FTemplatePadrao.Text) <> '') then
        FTemplatePadrao.SaveToFile(Sistema.TempDir + FArqTemplate)
      else
      begin
        FRelatorio.Template.FileName := Sistema.TempDir + FArqTemplate;
        FRelatorio.Template.SaveToFile;
      end;
      FTemplate.LoadFromFile(Sistema.TempDir + FArqTemplate);

      FQueryReport.Insert;
      FQueryReport.FieldByName('IDREPORTS').asInteger := LeUltRegistro(nil,'REPORTS');
      FQueryReport.FieldByName('ORIGEMCM').asInteger  := FidOrigemCM;
      FQueryReport.FieldByName('IDMODULO').asInteger  := FidModulo;
      FQueryReport.FieldByName('PPREPORT').asString   := FNomeRelat;
      FQueryReport.FieldByName('NAME').asString       := FDescricaoRelat;
      FQueryReport.FieldByName('TEMPLATE').asVariant  := FTemplate.Text;
      FQueryReport.Post;
      FQueryReport.ApplyUpdates;
    end
    else
    begin
      if (Trim(FQueryReport.FieldByName('TEMPLATE').asString) <> '') then
        FTemplate.Text := FQueryReport.FieldByName('TEMPLATE').asString
      else
      if (Trim(FTemplatePadrao.Text) <> '') then
        FTemplate.Text := FTemplatePadrao.Text
      else
      begin
        FRelatorio.Template.FileName := Sistema.TempDir + FArqTemplate;
        FRelatorio.Template.SaveToFile;
        FTemplate.LoadFromFile(Sistema.TempDir + FArqTemplate);
      end;

      FTemplate.SaveToFile(Sistema.TempDir + FArqTemplate);
    end;

    FRelatorio.Template.FileName := Sistema.TempDir + FArqTemplate;
    FRelatorio.Template.LoadFromFile;
  except
    MsgDlg('Ocorreu um erro ao tentar recuperar a configuração', 'Erro', mtError, [mbOk], 0);
  end;
end;

function TImprimeRelatorio.AbreQueryReport (sppReport:string; idModulo:integer): TErrorReports;
begin
  try
    with (FQueryReport) do
    begin
      if (Active) then
        Close;
      if not(Prepared) then
        Prepare;

      ParamByName('PPREPORT').asString  := sppReport;
      ParamByName('IDMODULO').asInteger := idModulo;
      Open;
    end;
    FErrorReports := SEM_ERRO;
    Result        := SEM_ERRO;
  except
    FErrorReports := ERRO_QUERY_REPORT;
    Result        := ERRO_QUERY_REPORT;
  end;
end;

function TImprimeRelatorio.AbreQueryDadosReport (Parametros: array of variant): TErrorReports;
var
  c: byte;
begin
  FErrorReports := SEM_ERRO;
  Result        := SEM_ERRO;

  if (Trim(FQueryDados.Text) <> '') then
  try
    with (FQueryDados) do
    begin
      if (Active) then
        Close;

      SQL.Assign (FqryDados);

      if not(Prepared) then
        Prepare;

      if (FQueryDados.ParamCount > 0) then
        for c:=0 to High(Parametros) do
          Params[c].Value := Parametros[c];

      Open;
    end;
  except
    on E: Exception do
    begin
      MsgDlg('Faltam dados para a seleção do registro !', 'Erro', mtError, [mbOk], 0);
      FErrorReports := ERRO_QUERY_DADOS;
      Result        := ERRO_QUERY_DADOS;
    end;
  end;

  if (FGravaLogSQL) then
    FQueryDados.SQL.SaveToFile('C:\QRY.TXT');
end;

procedure TImprimeRelatorio.SetOrigemCM(OrigemCM: byte);
begin
  FidOrigemCM := OrigemCM;
end;

procedure TImprimeRelatorio.SetQueryDados(QueryDados: TStringList);
begin
  FqryDados.Assign(QueryDados);
end;

procedure TImprimeRelatorio.SetLayoutPadrao(Layout: TStringList);
begin
  FTemplatePadrao.Assign(Layout);
end;

procedure TImprimeRelatorio.SetGravaLogSQL(Opcao: boolean);
begin
  FGravaLogSQL := Opcao;
end;

function TImprimeRelatorio.GetGravaLogSQL: boolean;
begin
  Result := FGravaLogSQL;
end;

procedure TImprimeRelatorio.Imprimir (Parametros: array of variant);
begin
  if ((FTipoImpressao = tpAbreQuery) and (AbreQueryDadosReport(Parametros) = SEM_ERRO)) or
     (FTipoImpressao = tpQueryComDados) then
  begin
    FRelatorio.Device := dvScreen;
    FRelatorio.Print;
  end;
end;

procedure TImprimeRelatorio.Configurar;
begin
  if (AbreQueryReport (FNomeRelat, FidModulo) = SEM_ERRO) then
  begin
    try
      FDesigner.Report.Template.SaveTo   := stFile;
      FDesigner.Report.Template.Format   := ftASCII;
      FDesigner.Report.Template.FileName := Sistema.TempDir + FArqTemplate;
      FDesigner.Report.Template.LoadFromFile;
      FDesigner.ShowModal;
      FDesigner.Report.Template.SaveTo   := stFile;
      FDesigner.Report.Template.Format   := ftASCII;
      FDesigner.Report.Template.FileName := Sistema.TempDir + FArqTemplate;
      FDesigner.Report.Template.SaveToFile;
      FTemplate.LoadFromFile(Sistema.TempDir + FArqTemplate);

      FQueryReport.Edit;
      FQueryReport.FieldByName('TEMPLATE').asVariant := FTemplate.Text;
      FQueryReport.Post;
      FQueryReport.ApplyUpdates;
    except
    end;
  end
  else
    MsgDlg('Ocorreu um erro ao tentar abrir a configuração'+CR_LF+
      'no momento da configuração', 'Erro', mtError, [mbOk], 0);
end;

procedure TImprimeRelatorio.RestaurarConfiguracao;
begin
  if (AbreQueryReport (FNomeRelat, FidModulo) = SEM_ERRO) then
  begin
    try
      FTemplate.Text := FTemplatePadrao.Text;
      FTemplate.SaveToFile(Sistema.TempDir + FArqTemplate);

      FQueryReport.Edit;
      FQueryReport.FieldByName('TEMPLATE').asVariant := FTemplate.Text;
      FQueryReport.Post;
      FQueryReport.ApplyUpdates;

      FRelatorio.Template.FileName := Sistema.TempDir + FArqTemplate;
      FRelatorio.Template.LoadFromFile;
    except
      MsgDlg('Ocorreu um erro ao tentar restaurar a configuração', 'Erro', mtError, [mbOk], 0);
    end;
  end
  else
    MsgDlg('Ocorreu um erro ao tentar abrir a configuração'+CR_LF+
      'no momento da restauração da configuração original', 'Erro', mtError, [mbOk], 0);
end;

function TImprimeRelatorio.GetQueryDados: TStringList;
begin
  Result := FqryDados;
end;

end.
