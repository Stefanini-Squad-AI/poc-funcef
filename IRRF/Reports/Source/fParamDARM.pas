unit fParamDARM;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  fParamReports_Padrao, CmParamReport, IvDictio, IvMulti, IvEMulti,
  MAHlpBtn, StdCtrls, Buttons, TB97Tlbr, TB97, ExtCtrls, wwdblook,
  wwdbdatetimepicker, CMDateTimePicker, uCmSqlParams, Db, DBClient,
  uCMClientDataSet, uMensErro;

type
  TfrmrptParamDARM = class(TfrmParamReports_Padrao)
    sqlJurosMulta: TCMSqlParams;
    cdsJurosMulta: TCMClientDataSet;
    gbPeriodoApu: TGroupBox;
    lblDataIni: TLabel;
    lblDataFim: TLabel;
    deDataIni: TCMDateTimePicker;
    deDataFim: TCMDateTimePicker;
    rgData: TRadioGroup;
    lblPerApu: TLabel;
    lblCodigo: TLabel;
    lblNatureza: TLabel;
    Label1: TLabel;
    edPerApur: TEdit;
    edCodigo: TEdit;
    dblcJuros: TwwDBLookupCombo;
    dblcMulta: TwwDBLookupCombo;
    rgVisualizaDARM: TRadioGroup;
    procedure FormCreate(Sender: TObject);
    procedure bbtnConfirmarClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmrptParamDARM: TfrmrptParamDARM;

implementation

{$R *.DFM}

procedure TfrmrptParamDARM.FormCreate(Sender: TObject);
begin
   inherited;
   sqlJurosMulta.Open;
   deDataIni.Date := Date;
   deDataFim.date := Date;
end;

procedure TfrmrptParamDARM.bbtnConfirmarClick(Sender: TObject);
begin
   if deDataIni.Text = '' then
   begin
      MsgDlg('Obrigatório preencher a Data de Início da Apuração','Erro',mtError,[mbOk],0);
      modalResult := mrNone;
      deDataIni.SetFocus;
      exit;
   end;
   if deDataFim.Text = '' then
   begin
      MsgDlg('Obrigatório preencher a Data Final da Apuração','Erro',mtError,[mbOk],0);
      modalResult := mrNone;
      deDataFim.SetFocus;
      exit;
   end;
   if edPerApur.Text = '' then
   begin
      MsgDlg('Obrigatório preencher a Competência','Erro',mtError,[mbOk],0);
      modalResult := mrNone;
      edPerApur.SetFocus;
      exit;
   end;
   if edCodigo.Text = '' then
   begin
      MsgDlg('Obrigatório preencher o Código de Pagamento','Erro',mtError,[mbOk],0);
      modalResult := mrNone;
      edCodigo.SetFocus;
      exit;
   end;

   if dblcJuros.Text = '' then
   begin
      MsgDlg('Obrigatório preencher o Alterador de Juros','Erro',mtError,[mbOk],0);
      modalResult := mrNone;
      edCodigo.SetFocus;
      exit;
   end;

   if dblcMulta.Text = '' then
   begin
      MsgDlg('Obrigatório preencher o Alterador de Multa','Erro',mtError,[mbOk],0);
      modalResult := mrNone;
      edCodigo.SetFocus;
      exit;
   end;

   Cmp_Padrao.ParamValues[0].AsDateTime := deDataIni.Date;
   Cmp_Padrao.ParamValues[1].AsDateTime := deDataFim.Date;
   Cmp_Padrao.ParamValues[2].AsInteger  := rgData.ItemIndex;
   Cmp_Padrao.ParamValues[3].Asstring   := edPerApur.Text;
   Cmp_Padrao.ParamValues[4].Asstring   := edCodigo.Text;
   Cmp_Padrao.ParamValues[5].AsInteger  := strToint(dblcJuros.lookupValue);
   Cmp_Padrao.ParamValues[6].AsInteger  := strToint(dblcMulta.LookupValue);
   Cmp_Padrao.ParamValues[7].AsInteger  := rgVisualizaDARM.ItemIndex;
end;

end.
