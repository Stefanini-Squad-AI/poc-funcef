//******************************************************************************
// Data      : 09/05/2006
// Código    : AL_1
// Pendencia :
// SOL       :
// Motivo    : Ajustes e melhorias de layout
//******************************************************************************

unit FParamOperAjuste;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  FOkCancelar, IvDictio, IvMulti, IvEMulti, MAHlpBtn, StdCtrls, Buttons,
  TB97Tlbr, TB97, ExtCtrls, wwdblook, Db, DBTables, Wwquery,
  uTeclado, Mask, wwdbedit, Wwdotdot, Wwdbcomb, wwdbdatetimepicker,
  CMDateTimePicker, FPreview;

type
  TfrmParamOperAjuste = class(TfrmOkCancelar)
    dblTipoFundo: TwwDBLookupCombo;
    Label1: TLabel;
    GroupBox1: TGroupBox;
    dtpInicio: TCMDateTimePicker;
    dtpFim: TCMDateTimePicker;
    Label3: TLabel;
    Label4: TLabel;
    Label5: TLabel;
    dblFundoInvest: TwwDBLookupCombo;
    procedure FormCreate(Sender: TObject);
    procedure bbtnConfirmarClick(Sender: TObject);
    procedure dblTipoFundoExit(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmParamOperAjuste: TfrmParamOperAjuste;

implementation
Uses FDmRelatoriosFundos, uBibliotecaInvest, FCadAjusteCertificado,UmensErro,
  UOperComum;
{$R *.DFM}

procedure TfrmParamOperAjuste.FormCreate(Sender: TObject);
begin
  inherited;
  dblTipoFundo.Text := frmCadAjusteCertificado.DblTipoFundo.Text;
  dblTipoFundo.LookupValue := frmCadAjusteCertificado.DblTipoFundo.LookupValue;
  dblTipoFundo.PerformSearch;
  dblFundoInvest.Text := frmCadAjusteCertificado.dblInvest.Text;
  dblFundoInvest.LookupValue := frmCadAjusteCertificado.dblInvest.LookupValue;
  dblFundoInvest.PerformSearch;
  dtpInicio.Text := frmCadAjusteCertificado.DbDtRefSaldo.Text;
  dtpInicio.DateTime := frmCadAjusteCertificado.DbDtRefSaldo.DateTime;
  dtpFim.Text := frmCadAjusteCertificado.DbDtRefSaldo.Text;
  dtpFim.DateTime := frmCadAjusteCertificado.DbDtRefSaldo.DateTime;
end;

procedure TfrmParamOperAjuste.bbtnConfirmarClick(Sender: TObject);
begin
  inherited;

  OperComum.LimpaParametros(DmRelatoriosFundo.qryAjuste);
  if dblTipoFundo.LookupValue <> '' then
     DmRelatoriosFundo.qryAjuste.ParamByName('IDTIPOFUNDOINVEST').AsString := dblTipoFundo.LookupValue;

  if dblFundoInvest.LookupValue <> '' then
     DmRelatoriosFundo.qryAjuste.ParamByName('IDFUNDOINVEST').AsString := dblFundoInvest.LookupValue;

  if Trim(dtpInicio.Text) <> '' then
     DmRelatoriosFundo.qryAjuste.ParamByName('DATAINI').AsDateTime := dtpInicio.DateTime;

  if Trim(dtpFim.Text) <> '' then
     DmRelatoriosFundo.qryAjuste.ParamByName('DATAFIM').AsDateTime := dtpFim.DateTime;

  if iPlanPrevCtbPatro <> 0 then
     DmRelatoriosFundo.qryAjuste.ParamByName('IDPLANPREVCTBPATR').AsInteger := iPlanPrevCtbPatro;

  if iTipoInvestUsu <> 0 then
     DmRelatoriosFundo.qryAjuste.ParamByName('IDTIPOINVEST').AsInteger := iTipoInvestUsu;

  DmRelatoriosFundo.qryAjuste.Open;

  if DmRelatoriosFundo.qryAjuste.IsEmpty then
  begin
     MsgDlg('Não há Operações de Ajuste','Mensagem do Sistema',mtInformation,[mbOK],0);
     DmRelatoriosFundo.qryAjuste.Close;
     Exit;
  end;

  DmRelatoriosFundo.qryAjuste.First;

  if Trim(dtpInicio.Text) = '' then
     DmRelatoriosFundo.lblAjusteDtInicio.Caption :=
                       DmRelatoriosFundo.qryAjuste.FieldByName('DATAOPERACAO').AsString
  else
     DmRelatoriosFundo.lblAjusteDtInicio.Caption := dtpInicio.Text;

  if Trim(dtpFim.Text) = '' then
  begin
     DmRelatoriosFundo.qryAjuste.Last;
     DmRelatoriosFundo.lblAjusteDtFim.Caption :=
                       DmRelatoriosFundo.qryAjuste.FieldByName('DATAOPERACAO').AsString;
     DmRelatoriosFundo.qryAjuste.First;
  end
  else
     DmRelatoriosFundo.lblAjusteDtFim.Caption := dtpFim.Text;

  TfrmPreview.CreateModalPreview(Application,
                                 DmRelatoriosFundo.rptAjuste,
                                 DmRelatoriosFundo.rptAjuste.PrinterSetup.DocumentName);

  ModalResult := mrOk;
end;

procedure TfrmParamOperAjuste.dblTipoFundoExit(Sender: TObject);
begin
  inherited;
  //Al_1
  OperComum.LimpaParametros(frmCadAjusteCertificado.QryFundoInvest);
  if Trim(dblTipoFundo.Text) = '' then
     frmCadAjusteCertificado.QryFundoInvest.ParamByName('IDTIPOFUNDOINVEST').Clear
  else
     frmCadAjusteCertificado.QryFundoInvest.ParamByName('IDTIPOFUNDOINVEST').AsInteger := StrToInt(dblTipoFundo.LookupValue);
  frmCadAjusteCertificado.QryFundoInvest.ParamByName('IDTIPOINVEST').AsInteger         := iTipoInvestUsu;
  frmCadAjusteCertificado.QryFundoInvest.Open;
end;

end.
