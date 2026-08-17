//******************************************************************************
// Data     : 07/03/2007
// Pendencia: 24658
// SOL      : 55067
// Motivo   : Implementações da consulta de transferência de integralização de cotas
//******************************************************************************

unit FConsTransfPlanoCotaIntegr;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  FOkCancelarRelInv, IvDictio, IvMulti, IvEMulti, MAHlpBtn, StdCtrls,
  Buttons, TB97Tlbr, TB97, fcLabel, ExtCtrls, wwdbdatetimepicker,
  CMDateTimePicker, Grids, Wwdbigrd, Wwdbgrid, DBTables, Db, Wwdatsrc,
  wwdblook, Wwquery, FPreview;

type
  TFrmConsTransfPlanoCotaIntegr = class(TfrmOkCancelarRelInv)
    QryTipoCota: TwwQuery;
    QryPlanoPatroOrigem: TwwQuery;
    QryTipoFundo: TwwQuery;
    QryFundoInvest: TwwQuery;
    QryTipoFundoInvest: TwwQuery;
    pnlDados: TPanel;
    lblPlanoPatroOrigem: TLabel;
    lblFundo: TLabel;
    lblClasse: TLabel;
    lblTipoCota: TLabel;
    dblkPlanPatroOrig: TwwDBLookupCombo;
    dblkFundoInvest: TwwDBLookupCombo;
    dblkTipoFundo: TwwDBLookupCombo;
    dblkTipoCota: TwwDBLookupCombo;
    Panel1: TPanel;
    dbGrd: TwwDBGrid;
    Label6: TLabel;
    edDataIni: TCMDateTimePicker;
    Label8: TLabel;
    edDataFim: TCMDateTimePicker;
    procedure FormShow(Sender: TObject);
    procedure bbtnConfirmarClick(Sender: TObject);
    procedure bbtnCancelarClick(Sender: TObject);
    procedure bt_ImprimeClick(Sender: TObject);
    procedure edDataFimExit(Sender: TObject);
    procedure dblkTipoFundoExit(Sender: TObject);
    //AL_2
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  FrmConsTransfPlanoCotaIntegr: TFrmConsTransfPlanoCotaIntegr;

implementation

uses uOperComum, uBibliotecaInvest, uMensErro, FDMRelTransfPlanoCotaIntegr;

{$R *.DFM}

procedure TFrmConsTransfPlanoCotaIntegr.FormShow(Sender: TObject);
begin
  inherited;

   OperComum.LimpaParametros(QryTipoFundo);
   QryTipoFundo.ParamByName('IDTIPOINVEST').AsInteger := iTipoInvestUsu;
   QryTipoFundo.Open;  

   OperComum.LimpaParametros(QryPlanoPatroOrigem);
   QryPlanoPatroOrigem.Open;

   dblkPlanPatroOrig.LookupValue := IntToStr(iPlanPrevCtbPatro);
   dblkPlanPatroOrig.PerformSearch;

   edDataIni.Text := DateToStr(Date);
   edDataFim.Text := DateToStr(Date);
   OperComum.LimpaParametros(QryFundoInvest);
   QryFundoInvest.ParamByName('IDTIPOINVEST').AsInteger := iTipoInvestUsu;
   if QryTipoFundo.RecordCount = 1 Then
   begin
      dblkTipoFundo.LookupValue := QryTipoFundo.FieldByName('IDTIPOFUNDOINVEST').AsString;
      dblkTipoFundo.PerformSearch;

      edDataIni.Text := QryTipoFundo.FieldByName('DATAULTFECH').AsString;
      edDataFim.Text := QryTipoFundo.FieldByName('DATAULTFECH').AsString;

      QryFundoInvest.ParamByName('DATAFIM').AsString       :=
                     QryTipoFundo.FieldByName('DATAULTFECH').AsString;
      QryFundoInvest.ParamByName('IDTIPOFUNDOINVEST').AsInteger :=
                     QryTipoFundo.FieldByName('IDTIPOFUNDOINVEST').AsInteger;
   end
   else
      QryFundoInvest.ParamByName('DATAFIM').AsString       := DateToStr(Date);
   QryFundoInvest.Open;

   OperComum.LimpaParametros(QryTipoCota);
   QryTipoCota.Open;

   lblTipoCota.Visible  := (iTipoInvestUsu in [9,10]);
   dblkTipoCota.Visible := (iTipoInvestUsu in [9,10]);
   
end;

procedure TFrmConsTransfPlanoCotaIntegr.bbtnConfirmarClick(Sender: TObject);
begin
   if Trim(edDataIni.Text) = '' then
   begin
      MsgDlg('Informe a Data Inicial.', 'Mensagem do Sistema', mtWarning, [mbOk], 0);
      if edDataIni.CanFocus then
         edDataIni.SetFocus;
      Exit;
   end;

   if Trim(edDataFim.Text) = '' then
   begin
      MsgDlg('Informe a Data Final.', 'Mensagem do Sistema', mtWarning, [mbOk], 0);
      if edDataFim.CanFocus then
         edDataFim.SetFocus;
      Exit;
   end;

   if edDataIni.Date > edDataIni.Date then
   begin
      MsgDlg('A Data Inicial não pode ser maior que a Data Final.', 'Mensagem do Sistema', mtWarning, [mbOk], 0);
      if edDataIni.CanFocus then
         edDataIni.SetFocus;
      Exit;
   end;

   if Trim(dblkPlanPatroOrig.Text) = '' then
   begin
      MsgDlg('Informe o Plano / Patrocinadora de Origem.', 'Mensagem do Sistema', mtWarning, [mbOk], 0);
      if dblkPlanPatroOrig.CanFocus then
         dblkPlanPatroOrig.SetFocus;
      Exit;
   end;   

  inherited;

   with DmTransfPlanoCotaIntegr do
   begin
      //AL_2
      OperComum.LimpaParametros(DmTransfPlanoCotaIntegr.QryTransfPlanoCotaIntegr);
      QryTransfPlanoCotaIntegr.ParamByName('IDTIPOINVEST').AsInteger         := iTipoInvestUsu;
      if (dblkPlanPatroOrig.Text) <> '' then
         QryTransfPlanoCotaIntegr.ParamByName('IDPLANPREVCTBPATR').AsInteger := StrToInt(dblkPlanPatroOrig.LookupValue);
      if (dblkFundoInvest.Text) <> '' then
         QryTransfPlanoCotaIntegr.ParamByName('IDFUNDOINVEST').AsInteger     := StrToInt(dblkFundoInvest.LookupValue);
      QryTransfPlanoCotaIntegr.ParamByName('DATAINI').AsString               := edDataIni.Text;
      QryTransfPlanoCotaIntegr.ParamByName('DATAFIM').AsString               := edDataFim.Text;
      if (dblkTipoFundo.Text) <> '' then
          QryTransfPlanoCotaIntegr.ParamByName('IDTIPOFUNDOINVEST').AsInteger:= StrToInt(dblkTipoFundo.LookupValue);
      if ((dblkTipoCota.Visible) and (Trim(dblkTipoCota.Text) <> '')) then
         QryTransfPlanoCotaIntegr.ParamByName('IDTIPOCOTA').AsInteger        := StrToInt(dblkTipoCota.LookupValue);
      QryTransfPlanoCotaIntegr.Open;

      if QryTransfPlanoCotaIntegr.IsEmpty then
         bt_Imprime.Enabled := False
      else
         bt_Imprime.Enabled := True;
   end;
end;

procedure TFrmConsTransfPlanoCotaIntegr.bbtnCancelarClick(Sender: TObject);
begin
  inherited;
   with DmTransfPlanoCotaIntegr do
   begin
      OperComum.LimpaParametros(DmTransfPlanoCotaIntegr.QryTransfPlanoCotaIntegr);
      QryTransfPlanoCotaIntegr.Open;
   end;   
   bt_Imprime.Enabled := False;
end;

procedure TFrmConsTransfPlanoCotaIntegr.bt_ImprimeClick(Sender: TObject);
begin
  inherited;
   with DmTransfPlanoCotaIntegr do
   begin
      if not QryTransfPlanoCotaIntegr.IsEmpty then
      begin
         QryTransfPlanoCotaIntegr.DisableControls;
         
         ppTipoCota.Visible    := (iTipoInvestUsu in [9,10]);

         pplPeriodoFDO.Caption := 'Período: ' + edDataIni.Text + ' a ' + edDataFim.Text;

         TFrmPreview.CreateModalPreview(Application,
                                        pprTransfPlanoCotaIntegr,
                                        pprTransfPlanoCotaIntegr.PrinterSetup.DocumentName);
         QryTransfPlanoCotaIntegr.EnableControls;

      end;
   end;      
end;

procedure TFrmConsTransfPlanoCotaIntegr.edDataFimExit(Sender: TObject);
begin
  inherited;
   OperComum.LimpaParametros(QryFundoInvest);
   QryFundoInvest.ParamByName('IDTIPOINVEST').AsInteger      := iTipoInvestUsu;
   if Trim(edDataFim.Text) <> '' then
      QryFundoInvest.ParamByName('DATAFIM').AsString         := edDataFim.Text
   else
      QryFundoInvest.ParamByName('DATAFIM').AsString         := DateToStr(Date);

   if Trim(dblkTipoFundo.Text) <> '' then
      QryFundoInvest.ParamByName('IDTIPOFUNDOINVEST').AsInteger := StrToInt(dblkTipoFundo.LookupValue);

   QryFundoInvest.Open;
end;

procedure TFrmConsTransfPlanoCotaIntegr.dblkTipoFundoExit(Sender: TObject);
begin
  inherited;
   OperComum.LimpaParametros(QryFundoInvest);
   QryFundoInvest.ParamByName('IDTIPOINVEST').AsInteger      := iTipoInvestUsu;
   if Trim(edDataFim.Text) <> '' then
      QryFundoInvest.ParamByName('DATAFIM').AsString         := edDataFim.Text
   else
      QryFundoInvest.ParamByName('DATAFIM').AsString         := DateToStr(Date);

   if Trim(dblkTipoFundo.Text) <> '' then
      QryFundoInvest.ParamByName('IDTIPOFUNDOINVEST').AsInteger := StrToInt(dblkTipoFundo.LookupValue);

   QryFundoInvest.Open;
end;

//AL_2
procedure TFrmConsTransfPlanoCotaIntegr.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
  inherited;
   OperComum.LimpaParametros(QryTipoCota);
   OperComum.LimpaParametros(QryTipoFundo);
   OperComum.LimpaParametros(QryFundoInvest);
   OperComum.LimpaParametros(QryTipoFundoInvest);
   OperComum.LimpaParametros(QryPlanoPatroOrigem);
   OperComum.LimpaParametros(DmTransfPlanoCotaIntegr.QryTransfPlanoCotaIntegr);
end;

end.
