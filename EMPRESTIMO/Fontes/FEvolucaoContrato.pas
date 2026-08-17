{
--------------------------------------------------------------------------------
Pendência   : SOL 166903 Kintana 1463131
Responsável : VINICIUS FERREIRA
Data        : 04/11/2011
Descrição   : Correção de erro ao gerar relatório e incluir campo ErroPrest.
--------------------------------------------------------------------------------
Pendência   : SOL 160924 Kintana 1354092
Responsável : Fanuel Junior
Data        : 07/07/2011
Descrição   : Correção do Erro "EInvalidOperation - Cannot make a visible window modal"
--------------------------------------------------------------------------------
Pendência   : SOL 138228 Kintana 843767
Responsável : BRUNO AZEVEDO
Data        : 08/09/2010
Descrição   : Criação do relatório "Evolução de contrato"
--------------------------------------------------------------------------------
}
unit FEvolucaoContrato;

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
  TfrmEvolucaoContrato = class(TfrmParamReports_Padrao)
    GroupBox2: TGroupBox;
    Label3: TLabel;
    edtDataInicio: TCMDateTimePicker;
    edtDataFim: TCMDateTimePicker;
    Label1: TLabel;
    chkGerarExcel: TCheckBox;
    dsDados: TwwDataSource;
    qryConsulta: TwwQuery;
    prEvolucaoContrato: TppReport;
    ppHeaderBand1: TppHeaderBand;
    ppLabel1: TppLabel;
    ppLine1: TppLine;
    ppLabel2: TppLabel;
    ppLabel4: TppLabel;
    ppLabel5: TppLabel;
    ppLabel6: TppLabel;
    ppDetailBand1: TppDetailBand;
    ppDBText1: TppDBText;
    ppEvolucaoContrato: TppBDEPipeline;
    qryConsultaCODRELATORIO: TFloatField;
    qryConsultaNOMERELATORIO: TStringField;
    qryConsultaTEXTO: TMemoField;
    ppEvolucaoContratoppField1: TppField;
    qryDados: TwwQuery;
    updDados: TUpdateSQL;
    ppEvolucaoContratoppField2: TppField;
    ppEvolucaoContratoppField3: TppField;
    ppEvolucaoContratoppField4: TppField;
    ppEvolucaoContratoppField5: TppField;
    ppEvolucaoContratoppField6: TppField;
    ppEvolucaoContratoppField7: TppField;
    ppEvolucaoContratoppField8: TppField;
    ppEvolucaoContratoppField9: TppField;
    ppEvolucaoContratoppField10: TppField;
    ppEvolucaoContratoppField11: TppField;
    ppEvolucaoContratoppField12: TppField;
    ppEvolucaoContratoppField13: TppField;
    ppEvolucaoContratoppField14: TppField;
    ppEvolucaoContratoppField15: TppField;
    ppEvolucaoContratoppField16: TppField;
    ppEvolucaoContratoppField17: TppField;
    ppEvolucaoContratoppField18: TppField;
    ppEvolucaoContratoppField19: TppField;
    ppEvolucaoContratoppField20: TppField;
    ppEvolucaoContratoppField21: TppField;
    ppEvolucaoContratoppField22: TppField;
    ppEvolucaoContratoppField23: TppField;
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
    ppDBText12: TppDBText;
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
    ppLabel22: TppLabel;
    ppLabel23: TppLabel;
    ppDBText20: TppDBText;
    qryConsultaREFERENCIA: TStringField;
    ppTitleBand1: TppTitleBand;
    ppLabel3: TppLabel;
    ppDBText21: TppDBText;
    ppEvolucaoContratoppField24: TppField;
    ppLabel24: TppLabel;
    ppDBText22: TppDBText;
    procedure bbtnConfirmarClick(Sender: TObject);
  private
    iIdForm: Integer;
    function ChecaForm(): Integer;
    procedure AbrirExcel(pUrl: String);
  public

  end;

var
  frmEvolucaoContrato: TfrmEvolucaoContrato;

Const
  NOME_REPORT = 'EVOLUÇÃO DE CONTRATO';
  NOME_FORM   = 'frmEvolucaoContrato';

implementation

uses
  UMensErro, UFuncoesEmptmo, fAguarde;

{$R *.DFM}

procedure TfrmEvolucaoContrato.bbtnConfirmarClick(Sender: TObject);
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
      xSPPrenncheRelatorio.StoredProcName := 'PR_RELEVOLUCAOCONTRATO';

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
      //while i < 15 do begin //Vinicius Ferreira - SOL 166903 Kintana 1463131
      while not qryConsulta.Eof do begin //Vinicius Ferreira - SOL 166903 Kintana 1463131
        xList := Parse(qryConsulta.FieldByName('TEXTO').AsString,';', True);
        if not (xList[0] = 'Contrato') then begin
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
       
    //Fanuel Junior SOL 160924 Kintana 1354092
    TfrmPreview.CreateModalPreview(Application, prEvolucaoContrato, 'Relatório de Evolução de Contrato.');
    //prEvolucaoContrato.Print;

    //GERAÇÃO DE ARQUIVO NO EXCEL
    if (chkGerarExcel.Checked) then begin
      prEvolucaoContrato.TextFileName     := 'C:\Planus\temp\Relatorio_Evolução_Contrato.xls';
      prEvolucaoContrato.AllowPrintToFile := True;
      prEvolucaoContrato.ShowPrintDialog  := False;
      prEvolucaoContrato.DeviceType       := 'ExcelFile';
      prEvolucaoContrato.Print;

      AbrirExcel('C:\Planus\temp\Relatorio_Evolução_Contrato.xls')
    end;
  end;
end;

function TfrmEvolucaoContrato.ChecaForm: Integer;
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

procedure TfrmEvolucaoContrato.AbrirExcel(pUrl: String);
var
  vBuffer: String;
begin
  vBuffer := pUrl;
  if (Trim(vBuffer) <> '') then begin
    ShellExecute(Application.Handle, nil, PChar(vBuffer), nil, nil, SW_SHOWNORMAL);
  end;
end;

end.
