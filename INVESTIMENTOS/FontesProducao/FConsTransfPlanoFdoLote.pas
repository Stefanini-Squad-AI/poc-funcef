//******************************************************************************
// Data      : 09/03/2007
// Código    : AL_3
// Motivo    : Implementação do tipo de cotas
//******************************************************************************
// Data     : 11/12/2006
// Código   : AL_2
// Pendencia: 23954
// Motivo   : Implementações para o Fundo de Participações
//*************************************************************************
// Data     : 03/11/2006
// Código   : AL_1
// Pendencia: 23787 
// SOL      : 43633 
// Motivo   : Implementação do relatório de transferência entre plano
//*************************************************************************

unit FConsTransfPlanoFdoLote;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  FOkCancelarRelInv, IvDictio, IvMulti, IvEMulti, MAHlpBtn, StdCtrls,
  Buttons, TB97Tlbr, TB97, fcLabel, ExtCtrls, wwdbdatetimepicker,
  CMDateTimePicker, Grids, Wwdbigrd, Wwdbgrid, DBTables, Db, Wwdatsrc,
  wwdblook, Wwquery, FPreview;

type
  TFrmConsTransfPlanoFdoLote = class(TfrmOkCancelarRelInv)
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
  FrmConsTransfPlanoFdoLote: TFrmConsTransfPlanoFdoLote;

implementation

uses uOperComum, uBibliotecaInvest, uMensErro, FDMRelTransfPlanoLoteFDO;

{$R *.DFM}

procedure TFrmConsTransfPlanoFdoLote.FormShow(Sender: TObject);
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

   //AL_3
   lblTipoCota.Visible  := (iTipoInvestUsu in [9,10]);
   dblkTipoCota.Visible := (iTipoInvestUsu in [9,10]);
   
end;

procedure TFrmConsTransfPlanoFdoLote.bbtnConfirmarClick(Sender: TObject);
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

   with DmTransfPlanoLoteFDO do
   begin
      //AL_2
      OperComum.LimpaParametros(DmTransfPlanoLoteFDO.QryTransfPlanoLoteFDO);
      QryTransfPlanoLoteFDO.ParamByName('IDTIPOINVEST').AsInteger         := iTipoInvestUsu;
      if (dblkPlanPatroOrig.Text) <> '' then
         QryTransfPlanoLoteFDO.ParamByName('IDPLANPREVCTBPATR').AsInteger := StrToInt(dblkPlanPatroOrig.LookupValue);
      if (dblkFundoInvest.Text) <> '' then
         QryTransfPlanoLoteFDO.ParamByName('IDFUNDOINVEST').AsInteger     := StrToInt(dblkFundoInvest.LookupValue);
      QryTransfPlanoLoteFDO.ParamByName('DATAINI').AsString               := edDataIni.Text;
      QryTransfPlanoLoteFDO.ParamByName('DATAFIM').AsString               := edDataFim.Text;
      if (dblkTipoFundo.Text) <> '' then
          QryTransfPlanoLoteFDO.ParamByName('IDTIPOFUNDOINVEST').AsInteger:= StrToInt(dblkTipoFundo.LookupValue);
      if ((dblkTipoCota.Visible) and (Trim(dblkTipoCota.Text) <> '')) then
         QryTransfPlanoLoteFDO.ParamByName('IDTIPOCOTA').AsInteger        := StrToInt(dblkTipoCota.LookupValue);
      QryTransfPlanoLoteFDO.Open;

      if QryTransfPlanoLoteFDO.IsEmpty then
         bt_Imprime.Enabled := False
      else
         bt_Imprime.Enabled := True;
   end;
end;

procedure TFrmConsTransfPlanoFdoLote.bbtnCancelarClick(Sender: TObject);
begin
  inherited;
   with DmTransfPlanoLoteFDO do
   begin
      OperComum.LimpaParametros(QryTransfPlanoLoteFDO);
      QryTransfPlanoLoteFDO.Open;
   end;   
   bt_Imprime.Enabled := False;
end;

procedure TFrmConsTransfPlanoFdoLote.bt_ImprimeClick(Sender: TObject);
begin
  inherited;
   with DmTransfPlanoLoteFDO do
   begin
      if not QryTransfPlanoLoteFDO.IsEmpty then
      begin
         QryTransfPlanoLoteFDO.DisableControls;

         //AL_3
         ppTipoCota.Visible    := (iTipoInvestUsu in [9,10]);         

         pplPeriodoFDO.Caption := 'Período: ' + edDataIni.Text + ' a ' + edDataFim.Text;

         TFrmPreview.CreateModalPreview(Application,
                                        pprTransfPlanoLoteFDO,
                                        pprTransfPlanoLoteFDO.PrinterSetup.DocumentName);
         QryTransfPlanoLoteFDO.EnableControls;

      end;
   end;      
end;

procedure TFrmConsTransfPlanoFdoLote.edDataFimExit(Sender: TObject);
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

procedure TFrmConsTransfPlanoFdoLote.dblkTipoFundoExit(Sender: TObject);
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
procedure TFrmConsTransfPlanoFdoLote.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
  inherited;
   OperComum.LimpaParametros(QryTipoCota);
   OperComum.LimpaParametros(QryTipoFundo);
   OperComum.LimpaParametros(QryFundoInvest);
   OperComum.LimpaParametros(QryTipoFundoInvest);
   OperComum.LimpaParametros(QryPlanoPatroOrigem);
   OperComum.LimpaParametros(DmTransfPlanoLoteFDO.QryTransfPlanoLoteFDO);
end;

end.
