{
-------------------------------------------------------------------------------
Pendência   : SOL 148659 Kintana 1048531
Responsável : Bruno Azevedo
Data        : 01/02/2011
Descrição   : Adicionado os campos "DataQuitacao", "VlrParcela" e "VlrFGQC".
-------------------------------------------------------------------------------
Pendência   : SOL 156581 Kintana 1238385
Responsável : BRUNO AZEVEDO
Data        : 19/04/2011
Descrição   : Ajuste na impressão do relatório.
--------------------------------------------------------------------------------
Pendência   : SOL 138233 Kintana 843723
Responsável : Ádler Souza / Bruno Azevedo
Data        : 30/09/2010
Descrição   : Criação do relatório "Saldo Residual"
-------------------------------------------------------------------------------}

unit FSaldoResidual;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  fParamReports_Padrao, StdCtrls, wwdbdatetimepicker, CMDateTimePicker,
  CmParamReport, IvDictio, IvMulti, IvEMulti, MAHlpBtn, Buttons, TB97Tlbr,
  TB97, ExtCtrls, ppDB, ppDBPipe, ppDBBDE, ppVar, ppBands, ppCtrls,
  ppPrnabl, ppClass, ppCache, ppComm, ppRelatv, ppProd, ppReport, Db,
  DBTables, Wwquery, Wwdatsrc, QExport3, QExport3XLS, DBClient,
  uCMClientDataSet, shellApi, ppParameter, jpeg, fPreview;

type
  TFrmSaldoResidual = class(TfrmParamReports_Padrao)
    GroupBox2: TGroupBox;
    Label3: TLabel;
    edtDataInicio: TCMDateTimePicker;
    edtDataFim: TCMDateTimePicker;
    Label1: TLabel;
    chkGerarExcel: TCheckBox;
    dsDados: TwwDataSource;
    qryConsulta: TwwQuery;
    prSaldoResidual: TppReport;
    ppHeaderBand1: TppHeaderBand;
    ppLabel1: TppLabel;
    ppLine1: TppLine;
    ppLabel2: TppLabel;
    ppLabel4: TppLabel;
    ppLabel5: TppLabel;
    ppDetailBand1: TppDetailBand;
    ppDBText1: TppDBText;
    ppSaldoResidual: TppBDEPipeline;
    qryConsultaCODRELATORIO: TFloatField;
    qryConsultaNOMERELATORIO: TStringField;
    qryConsultaTEXTO: TMemoField;
    qryDados: TwwQuery;
    updDados: TUpdateSQL;
    ppDBText2: TppDBText;
    ppDBText6: TppDBText;
    ppDBText9: TppDBText;
    ppLabel8: TppLabel;
    ppLabel11: TppLabel;
    qryConsultaREFERENCIA: TStringField;
    ppTitleBand1: TppTitleBand;
    ppLabel3: TppLabel;
    ppDBText21: TppDBText;
    ppLabel24: TppLabel;
    ppLabel25: TppLabel;
    ppParameterList1: TppParameterList;
    ppDtInicio: TppLabel;
    ppDtFim: TppLabel;
    ppLabel6: TppLabel;
    ppLabel7: TppLabel;
    ppLabel9: TppLabel;
    ppImage1: TppImage;
    ppFooterBand1: TppFooterBand;
    ppCalc42: TppSystemVariable;
    ppLabel162: TppLabel;
    ppSystemVariable1: TppSystemVariable;
    ppSaldoResidualppField6: TppField;
    ppSaldoResidualppField7: TppField;
    ppSaldoResidualppField8: TppField;
    ppLabel10: TppLabel;
    ppDBText3: TppDBText;
    ppDBText4: TppDBText;
    ppLabel12: TppLabel;
    ppDBText5: TppDBText;
    ppLabel13: TppLabel;
    procedure bbtnConfirmarClick(Sender: TObject);
  private
    iIdForm: Integer;
    function ChecaForm(): Integer;
    procedure AbrirExcel(pUrl: String);
  public

  end;

var
  FrmSaldoResidual: TFrmSaldoResidual;

Const
  NOME_REPORT = 'SALDO RESIDUAL';
  NOME_FORM   = 'frmSaldoResidual';

implementation

uses
  UMensErro, UFuncoesEmptmo, fAguarde;

{$R *.DFM}

procedure TFrmSaldoResidual.bbtnConfirmarClick(Sender: TObject);
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
                     'Deseja gerar um novo relatório? ', 'Informação',
                      mtInformation, [mbYes, mbNo], 0) = mrYes);
  end;

  if (bNovo) then begin
    frmAguarde.Mostra('Configurando Relatório ...');
    try
      xSPPrenncheRelatorio := TStoredProc.Create(Application);
      xSPPrenncheRelatorio.DatabaseName   := 'BaseDados';
      xSPPrenncheRelatorio.StoredProcName := 'PR_SALDORESIDUAL';

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
        if not (xList[0] = 'CONTRATO') then begin
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

    with prSaldoResidual do
    begin
      ppDtInicio.Caption := edtDataInicio.Text;
      ppDtFim.Caption    := edtDataFim.Text;
    end;

    //BRUNO AZEVEDO SOL KINTANA
    TfrmPreview.CreateModalPreview(Application, prSaldoResidual, 'Relatório de Saldo Residual');

    //GERAÇÃO DE ARQUIVO NO EXCEL
    if (chkGerarExcel.Checked) then begin
      prSaldoResidual.TextFileName     := 'C:\PLANUS\temp\Relatorio_Saldo_Residual.xls';
      prSaldoResidual.AllowPrintToFile := True;
      prSaldoResidual.ShowPrintDialog  := False;
      prSaldoResidual.DeviceType       := 'ExcelFile';
      prSaldoResidual.Print;

      AbrirExcel('C:\PLANUS\temp\Relatorio_Saldo_Residual.xls');
    end;
  end;
end;

function TFrmSaldoResidual.ChecaForm: Integer;
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

procedure TFrmSaldoResidual.AbrirExcel(pUrl: String);
var
  vBuffer: String;
begin
  vBuffer := pUrl;
  if (Trim(vBuffer) <> '') then begin
    ShellExecute(Application.Handle, nil, PChar(vBuffer), nil, nil, SW_SHOWNORMAL);
  end;
end;

end.
