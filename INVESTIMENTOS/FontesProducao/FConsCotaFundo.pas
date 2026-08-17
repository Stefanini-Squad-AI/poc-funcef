//******************************************************************************
// Data      : 31/03/2006
// Código    : AL_5
// Motivo    : Acerto na passagem das datas que estava apresentando problema como Date
//******************************************************************************
// Data      : 29/03/2006
// Código    : AL_4
// Pendencia : 21901
// Motivo    : Ajuste na query de seleção dos Fundos de Investimentos(qryFundoInvest)
//******************************************************************************
// Query    : QryCotaFundo
// Data     : 07/12/2004
// Descrição: Melhorias na Consulta
//******************************************************************************
// Data     : 06/12/2004
// Descrição: Retirada de duplicações no form
//******************************************************************************
// Form     : frmConsCotaFundo
// Data     : 03/12/2004
// Descrição: Nova tela de consulta para Cotas de Fundo de Investimento
//******************************************************************************
unit FConsCotaFundo;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  FOkCancelarInv, IvDictio, IvMulti, IvEMulti, MAHlpBtn, StdCtrls, Buttons,
  TB97Tlbr, TB97, fcLabel, ExtCtrls, wwdbdatetimepicker, CMDateTimePicker,
  wwdblook, Db, DBTables, Wwquery, Grids, Wwdbigrd, Wwdbgrid, FPreview;

type
  TfrmConsCotaFundo = class(TfrmOkCancelarInv)
    pnlOpcao: TPanel;
    Label11: TLabel;
    GpbPeriodo: TGroupBox;
    Label2: TLabel;
    dtDataInicio: TCMDateTimePicker;
    dtDataFim: TCMDateTimePicker;
    bbtnImprimir: TBitBtn;
    qryFundoInvest: TwwQuery;
    qryFundoInvestDESCFUNDOINVEST: TStringField;
    qryFundoInvestIDFUNDOINVEST: TFloatField;
    qryFundoInvestIDGESTORCARTEIRA: TFloatField;
    qryFundoInvestTRGDTINCLUSAO: TDateTimeField;
    qryFundoInvestTRGUSERINCLUSAO: TStringField;
    qryFundoInvestMOECODIGO: TFloatField;
    qryFundoInvestIDCARTEIRAINVEST: TFloatField;
    qryFundoInvestIDTIPOFUNDOINVEST: TFloatField;
    qryFundoInvestCNPJFUNDO: TStringField;
    qryFundoInvestSTAEXCLUSIVO: TStringField;
    qryFundoInvestPZOCARENCIA: TFloatField;
    qryFundoInvestPZOANIVERSARIO: TFloatField;
    qryFundoInvestPZOLIQAPLIC: TFloatField;
    qryFundoInvestPZOLIQRESG: TFloatField;
    qryFundoInvestQTDDECQTD: TFloatField;
    qryFundoInvestQTDDECVALOR: TFloatField;
    qryFundoInvestSTAFUNDO: TStringField;
    qryFundoInvestPZOAMORTIZACAO: TFloatField;
    qryFundoInvestPERCTXPERFORM: TFloatField;
    qryFundoInvestPERCTXADM: TFloatField;
    qryFundoInvestCODFUNCETIP: TStringField;
    qryFundoInvestSTAPROVISIONAIR: TStringField;
    qryFundoInvestSTAPROVISIONAIOF: TStringField;
    qryFundoInvestCONTRCETIP: TStringField;
    qryFundoInvestDTAINIPROC: TDateTimeField;
    dblInvest: TwwDBLookupCombo;
    dbgrdCotaFundoPerInv: TwwDBGrid;
    ToolbarSep972: TToolbarSep97;
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure FormCreate(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure dtDataInicioClick(Sender: TObject);
    procedure dtDataFimClick(Sender: TObject);
    procedure dblInvestCloseUp(Sender: TObject; LookupTable,
      FillTable: TDataSet; modified: Boolean);
    procedure bbtnConfirmarClick(Sender: TObject);
    procedure bbtnCancelarClick(Sender: TObject);
    procedure bbtnImprimirClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmConsCotaFundo: TfrmConsCotaFundo;

implementation

uses UDataBase, uMensErro, UDiasUteisInv, UBibliotecaInvest,
     UOperComum, FDmRelConsCotaFundo;

{$R *.DFM}

procedure TfrmConsCotaFundo.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
   dmRelConsCotaFundo.qryCotaFundo.Close;
   qryFundoInvest.Close;
   inherited;
end;

procedure TfrmConsCotaFundo.FormCreate(Sender: TObject);
begin
   inherited;
   if (TForm(Sender).Height > Application.MainForm.ClientHeight - 50{Tamanho da barra de tarefas e barra de staus}) or
      (TForm(Sender).Width > Application.MainForm.ClientWidth - 4 {Margem de segurança}) then
      WindowState := wsMaximized
   else
      WindowState := wsNormal;    
end;

procedure TfrmConsCotaFundo.FormShow(Sender: TObject);
begin
  inherited;
  OperComum.LimpaParametros(qryFundoInvest);
  qryFundoInvest.ParamByName('IDTIPOINVEST').AsInteger := iTipoInvestUsu;
  qryFundoInvest.Open;
end;

procedure TfrmConsCotaFundo.dtDataInicioClick(Sender: TObject);
begin
   dtDataFim.Clear;
   dblInvest.Text       := '';
   bbtnImprimir.Enabled := False;
   inherited;
   dmRelConsCotaFundo.qryCotaFundo.Close;
end;

procedure TfrmConsCotaFundo.dtDataFimClick(Sender: TObject);
begin
   dblInvest.Text       := '';
   bbtnImprimir.Enabled := False;
   inherited;
   dmRelConsCotaFundo.qryCotaFundo.Close;
end;

procedure TfrmConsCotaFundo.dblInvestCloseUp(Sender: TObject; LookupTable,
  FillTable: TDataSet; modified: Boolean);
begin
   bbtnImprimir.Enabled := False;
   inherited;
   dmRelConsCotaFundo.qryCotaFundo.Close;
end;

procedure TfrmConsCotaFundo.bbtnConfirmarClick(Sender: TObject);
begin
   inherited;
   //AL_5
   if Trim(dtDataInicio.Text) = '' then
   begin
      MsgDlg('A Data de Início do Período não foi informada.', 'Atenção', MtWarning, [MbOk], 0);
      if dtDataInicio.Canfocus then
         dtDataInicio.SetFocus;
      Exit;
   end;
   //AL_5
   if Trim(dtDataFim.Text) = '' then
   begin
      MsgDlg('A Data do Fim do Período não foi informada.', 'Atenção', MtWarning, [MbOk], 0);
      if dtDataFim.Canfocus then
         dtDataFim.SetFocus;
      Exit;
   end;

   with dmRelConsCotaFundo, dmRelConsCotaFundo.qryCotaFundo do
   begin
      OperComum.LimpaParametros(qryCotaFundo);
      ParamByName('IDTIPOINVEST').AsInteger  := iTipoInvestUsu;

      if Trim(dblInvest.Text) <> '' then
         ParamByName('IDFUNDOINVEST').AsInteger := qryFundoInvestIDFUNDOINVEST.AsInteger;
      //AL_5
      ParamByName('DATAINI').AsString        := dtDataInicio.Text;
      ParamByName('DATAFIM').AsString        := dtDataFim.Text;
      Open;
      if IsEmpty then
      begin
         MsgDlg('Não foi encontrado dados neste período para o'+#13+
                'Fundo de Investimento: '+dblInvest.Text+'.', 'Atenção', MtWarning, [MbOk], 0);
         if dtDataInicio.Canfocus then
            dtDataInicio.SetFocus;
      end
      else
         bbtnImprimir.Enabled := True;
   end;
end;

procedure TfrmConsCotaFundo.bbtnCancelarClick(Sender: TObject);
begin
   dtDataInicio.Clear;
   dtDataFim.Clear;
   dblInvest.Text       := '';
   bbtnImprimir.Enabled := False;
   inherited;
   dmRelConsCotaFundo.qryCotaFundo.Close;
   if dtDataInicio.Canfocus then
      dtDataInicio.SetFocus;
end;

procedure TfrmConsCotaFundo.bbtnImprimirClick(Sender: TObject);
begin
   inherited;
   with dmRelConsCotaFundo, dmRelConsCotaFundo.qryCotaFundo do
   begin
      DisableControls;
      lblDtIni.Caption := dtDataInicio.Text;
      lblDtFin.Caption := dtDataFim.Text;
      TfrmPreview.CreateModalPreview(Application,
                                     rptCotaFundo,
                                     rptCotaFundo.PrinterSetup.DocumentName);
      EnableControls;
   end;
end;

end.
