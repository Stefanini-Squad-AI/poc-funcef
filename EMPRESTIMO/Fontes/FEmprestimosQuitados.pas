{
--------------------------------------------------------------------------------
Pendência   : SOL160924 Kintana1354092
Responsável : Fanuel Junior
Data        : 07/07/2011
Descrição   : Correção do Erro "EInvalidOperation - Cannot make a visible window modal"
--------------------------------------------------------------------------------
Pendência   : SOL 138232 Kintana 843720
Responsável : BRUNO AZEVEDO
Data        : 08/09/2010
Descrição   : Criação do relatório "Empréstimos Quitados"
--------------------------------------------------------------------------------
}
unit FEmprestimosQuitados;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  fParamReports_Padrao, StdCtrls, wwdbdatetimepicker, CMDateTimePicker,
  CmParamReport, IvDictio, IvMulti, IvEMulti, MAHlpBtn, Buttons, TB97Tlbr,
  TB97, ExtCtrls, ppDB, ppDBPipe, ppDBBDE, ppVar, ppBands, ppCtrls,
  ppPrnabl, ppClass, ppCache, ppComm, ppRelatv, ppProd, ppReport, Db,
  DBTables, Wwquery, Wwdatsrc, QExport3, QExport3XLS, DBClient,
  uCMClientDataSet, shellApi, fPreview;

type
  TfrmEmprestimosQuitados = class(TfrmParamReports_Padrao)
    GroupBox2: TGroupBox;
    Label3: TLabel;
    edtDataInicio: TCMDateTimePicker;
    edtDataFim: TCMDateTimePicker;
    Label1: TLabel;
    chkGerarExcel: TCheckBox;
    dsDados: TwwDataSource;
    qryConsulta: TwwQuery;
    prEmprestimosQuitados: TppReport;
    ppHeaderBand1: TppHeaderBand;
    ppLabel1: TppLabel;
    ppLine1: TppLine;
    ppLabel2: TppLabel;
    ppLabel4: TppLabel;
    ppLabel5: TppLabel;
    ppLabel6: TppLabel;
    ppDetailBand1: TppDetailBand;
    ppDBText1: TppDBText;
    ppEmprestimosQuitados: TppBDEPipeline;
    qryConsultaCODRELATORIO: TFloatField;
    qryConsultaNOMERELATORIO: TStringField;
    qryConsultaTEXTO: TMemoField;
    ppEmprestimosQuitadosppField1: TppField;
    qryDados: TwwQuery;
    updDados: TUpdateSQL;
    ppEmprestimosQuitadosppField2: TppField;
    ppEmprestimosQuitadosppField3: TppField;
    ppEmprestimosQuitadosppField4: TppField;
    ppEmprestimosQuitadosppField5: TppField;
    ppEmprestimosQuitadosppField6: TppField;
    ppEmprestimosQuitadosppField7: TppField;
    ppEmprestimosQuitadosppField8: TppField;
    ppEmprestimosQuitadosppField9: TppField;
    ppEmprestimosQuitadosppField10: TppField;
    ppEmprestimosQuitadosppField11: TppField;
    ppEmprestimosQuitadosppField12: TppField;
    ppEmprestimosQuitadosppField13: TppField;
    ppEmprestimosQuitadosppField14: TppField;
    ppEmprestimosQuitadosppField15: TppField;
    ppEmprestimosQuitadosppField16: TppField;
    ppEmprestimosQuitadosppField17: TppField;
    ppEmprestimosQuitadosppField18: TppField;
    ppEmprestimosQuitadosppField19: TppField;
    ppDBText2: TppDBText;
    ppDBText3: TppDBText;
    ppDBText4: TppDBText;
    ppDBText5: TppDBText;
    ppDBText6: TppDBText;
    ppDBText7: TppDBText;
    ppDBText8: TppDBText;
    ppDBText9: TppDBText;
    ppDBText10: TppDBText;
    ppDBText11: TppDBText;
    ppDBText13: TppDBText;
    ppDBText14: TppDBText;
    ppDBText15: TppDBText;
    ppDBText16: TppDBText;
    ppDBText17: TppDBText;
    ppDBText18: TppDBText;
    ppDBText19: TppDBText;
    ppLabel7: TppLabel;
    ppLabel8: TppLabel;
    ppLabel9: TppLabel;
    ppLabel10: TppLabel;
    ppLabel11: TppLabel;
    ppLabel12: TppLabel;
    ppLabel13: TppLabel;
    ppLabel14: TppLabel;
    ppLabel15: TppLabel;
    ppLabel16: TppLabel;
    ppLabel17: TppLabel;
    ppLabel18: TppLabel;
    ppLabel19: TppLabel;
    ppLabel20: TppLabel;
    ppLabel21: TppLabel;
    qryConsultaREFERENCIA: TStringField;
    ppTitleBand1: TppTitleBand;
    procedure bbtnConfirmarClick(Sender: TObject);
  private
    iIdForm: Integer;
    function ChecaForm(): Integer;
    procedure AbrirExcel(pUrl: String);
  public

  end;

var
  frmEmprestimosQuitados: TfrmEmprestimosQuitados;

Const
  NOME_REPORT = 'ANÁLISE DE PRESTAÇÃO APÓS QUITAÇÃO';
  NOME_FORM   = 'frmEmprestimosQuitados';

implementation

uses
  UMensErro, UFuncoesEmptmo, fAguarde;

{$R *.DFM}

procedure TfrmEmprestimosQuitados.bbtnConfirmarClick(Sender: TObject);
var
  xSPPrenncheRelatorio: TStoredProc;
  xList: TStringList;
  i: Integer;
  bNovo: Boolean;
begin
  inherited;
  if (edtDataInicio.DateTime <= 0) then begin
    MsgDlg('É necessário preencher a Data de Início! ','Erro',mtError,[mbOk],0);
    edtDataInicio.SetFocus;
    Self.ModalResult := mrNone;
    Exit;
  end;

  if (edtDataFim.DateTime <= 0) then begin
    MsgDlg('É necessário preencher a Data Fim! ','Erro',mtError,[mbOk],0);
    edtDataFim.SetFocus;
    Self.ModalResult := mrNone;
    Exit;
  end;

  if (edtDataInicio.DateTime > edtDataFim.DateTime) then begin
    MsgDlg('A Data Fim não pode ser menor que a Data Início! ','Erro',mtError,[mbOk],0);
    edtDataFim.SetFocus;
    Self.ModalResult := mrNone;
    Exit;
  end;

  iIdForm := ChecaForm();
  if (iIdForm <= 0) then begin
    MsgDlg('Falta configuração para impressão do relatório! ','Erro',mtError,[mbOk],0);
    Self.ModalResult := mrNone;
    Exit;
  end;

  qryConsulta.Close;
  qryConsulta.SQL.Clear;
  qryConsulta.SQL.Add('SELECT CODRELATORIO, NOMERELATORIO, TEXTO, REFERENCIA FROM RELESPECIALEMPTMO');
  qryConsulta.SQL.Add(' WHERE CODRELATORIO = ' + IntToStr(iIdForm));
  qryConsulta.SQL.Add('   AND REFERENCIA = ''' + edtDataInicio.Text + ' - ' + edtDataFim.Text + '''');
  qryConsulta.SQL.Add(' ORDER BY TEXTO');
  qryConsulta.Open;

  bNovo := True;
  if not (qryConsulta.IsEmpty) then begin
    bNovo := (MsgDlg('Existe um relatório gerado com as datas informadas.'+#13+
                     'Deseja gerar um novo relatório? '+#13+
                     '(Caso deseje imprimir as informações existentes, selecione "Não")', 'Informação',
                      mtInformation, [mbYes, mbNo], 0) = mrYes);
  end;

  if (bNovo) then begin
    frmAguarde.Mostra('Configurando Relatório ...');
    try
      xSPPrenncheRelatorio := TStoredProc.Create(Application);
      xSPPrenncheRelatorio.DatabaseName   := 'BaseDados';
      xSPPrenncheRelatorio.StoredProcName := 'PR_ANALISEPRESTPOSQUIT';

      xSPPrenncheRelatorio.Params.CreateParam(ftDate,    'pDataInicio',    ptinput);
      xSPPrenncheRelatorio.Params.CreateParam(ftDate,    'pDataFim',       ptinput);
      xSPPrenncheRelatorio.Params.CreateParam(ftString,  'pNomeRelatorio', ptinput);
      xSPPrenncheRelatorio.Params.CreateParam(ftInteger, 'pIdForm',        ptinput);

      xSPPrenncheRelatorio.parambyName('pDataInicio').AsDateTime  := edtDataInicio.DateTime;
      xSPPrenncheRelatorio.parambyName('pDataFim').AsDateTime     := edtDataFim.DateTime;
      xSPPrenncheRelatorio.parambyName('pNomeRelatorio').AsString := NOME_REPORT;
      xSPPrenncheRelatorio.parambyName('pIdForm').AsInteger       := iIdForm;

      xSPPrenncheRelatorio.Prepare;
      xSPPrenncheRelatorio.ExecProc;
    finally
      xSPPrenncheRelatorio.Close;
      FreeAndNil(xSPPrenncheRelatorio);
    end;
  end;
  
  qryConsulta.Close;
  qryConsulta.SQL.Clear;
  qryConsulta.SQL.Add('SELECT CODRELATORIO, NOMERELATORIO, TEXTO, REFERENCIA FROM RELESPECIALEMPTMO');
  qryConsulta.SQL.Add(' WHERE CODRELATORIO = ' + IntToStr(iIdForm));
  qryConsulta.SQL.Add('   AND REFERENCIA = ''' + edtDataInicio.Text + ' - ' + edtDataFim.Text + '''');
  qryConsulta.SQL.Add(' ORDER BY TEXTO');
  qryConsulta.Open;
  frmAguarde.Apaga;

  if (qryConsulta.IsEmpty) then begin
    MsgDlg('Não existem relatórios referentes ao período selecionado! ','Erro',mtError,[mbOk],0);
    edtDataInicio.SetFocus;
    Self.ModalResult := mrNone;
    Exit;
  end else begin
    qryDados.Close;
    qryDados.Open;

    try
      qryConsulta.First;
      frmAguarde.Mostra('Gerando Relatório ...');
      while not qryConsulta.Eof do begin
        xList := Parse(qryConsulta.FieldByName('TEXTO').AsString,';', True);
        if not (xList[0] = 'Estornar') then begin
          qryDados.Insert;
          for i := 0 to xList.Count -1 do begin
            qryDados.Fields[i].AsString := xList[i];
          end;
          qryDados.Post;
        end;
        qryConsulta.Next;
      end;
    finally
      frmAguarde.Apaga;
      FreeAndNil(xList);
    end;

    //Fanuel Junior SOL160924 Kintana1354092
    TfrmPreview.CreateModalPreview(Application, prEmprestimosQuitados, 'Ánalise de Prestação Após Quitação');
    //prEmprestimosQuitados.Print;

    //GERAÇÃO DE ARQUIVO NO EXCEL
    if (chkGerarExcel.Checked) then begin
      prEmprestimosQuitados.TextFileName     := 'C:\Planus\temp\Relatorio_Analise_Prestacao_Apos_Quitacao.xls';
      prEmprestimosQuitados.AllowPrintToFile := True;
      prEmprestimosQuitados.ShowPrintDialog  := False;
      prEmprestimosQuitados.DeviceType       := 'ExcelFile';
      prEmprestimosQuitados.Print;

      AbrirExcel('C:\Planus\temp\Relatorio_Analise_Prestacao_Apos_Quitacao.xls')
    end;
  end;
end;

function TfrmEmprestimosQuitados.ChecaForm: Integer;
var
  xQry: TwwQuery;
begin
  xQry := TwwQuery.Create(Self);
  try
    xQry.DataBaseName := 'BaseDados';
    xQry.Close;
    xQry.Sql.Clear;
    xQry.Sql.Add('SELECT IDFORM FROM FORM');
    xQry.Sql.Add(' WHERE NOMEFORM = ' + QuotedStr(NOME_FORM));
    xQry.Open;

    Result := xQry.FieldByName('IDFORM').AsInteger;
  finally
    FreeAndNil(xQry);
  end;
end;

procedure TfrmEmprestimosQuitados.AbrirExcel(pUrl: String);
var
  vBuffer: String;
begin
  vBuffer := pUrl;
  if (Trim(vBuffer) <> '') then begin
    ShellExecute(Application.Handle, nil, PChar(vBuffer), nil, nil, SW_SHOWNORMAL);
  end;
end;

end.
