//******************************************************************************
// Data      : 13/03/2007
// Código    : AL_5
// Motivo    : Ajuste na impressão do plano individual, o plano que estava sendo
//             passado era a do sistema e o certo é o selecionado na tela
//******************************************************************************
// Data      : 21/08/2006
// Código    : AL_4
// Pendencia : 23126
// SOL       : 45112
// Motivo    : Implementação para utilização do Fundo de Inv. em Participação
//******************************************************************************
// Data      : 23/02/2005
// Código    : Al_3
// Motivo    : Ajuste no layout da tela.
//******************************************************************************
// Data     : 12/12/2005
// Linha(s) : Al_2
// Motivo   : Implementação do tratamento de saldo sintetico conforme a susbcrição
//******************************************************************************
// Data     : 20/10/2005
// Linha(s) : AL_1
// Motivo   : Ajuste no layout da tela (retirando o max)
//******************************************************************************

unit FConsSldQtdCotasInteg;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  FOkCancelarRelInv, IvDictio, IvMulti, IvEMulti, MAHlpBtn, StdCtrls,
  Buttons, TB97Tlbr, TB97, fcLabel, ExtCtrls, Grids, Wwdbigrd, Wwdbgrid,
  wwdbdatetimepicker, CMDateTimePicker, wwdblook, Db, DBTables, Wwquery, FPreview,
  DBGrids;

type
  TFrmConsSldQtdCotasInteg = class(TfrmOkCancelarRelInv)
    pnlConsulta: TPanel;
    LblDtaRef: TLabel;
    dDataRef: TCMDateTimePicker;
    DbGMovFdoNormal: TwwDBGrid;
    QryTipoFundo: TwwQuery;
    QryTipoFundoIDTIPOFUNDOINVEST: TFloatField;
    QryTipoFundoIDTIPOINVEST: TFloatField;
    QryTipoFundoDESCTIPOFUNDOINV: TStringField;
    QryTipoFundoDATAULTFECH: TDateTimeField;
    QryFundoInvest: TwwQuery;
    QryFundoInvestDESCFUNDOINVEST: TStringField;
    QryFundoInvestIDFUNDOINVEST: TFloatField;
    QryFundoInvestMOECODIGO: TFloatField;
    QryFundoInvestIDCARTEIRAINVEST: TFloatField;
    QryFundoInvestIDTIPOFUNDOINVEST: TFloatField;
    QryFundoInvestSTAEXCLUSIVO: TStringField;
    QryFundoInvestPZOCARENCIA: TFloatField;
    QryFundoInvestPZOANIVERSARIO: TFloatField;
    QryFundoInvestQTDDECQTD: TFloatField;
    QryFundoInvestQTDDECVALOR: TFloatField;
    QryFundoInvestSTAFUNDO: TStringField;
    QryFundoInvestPZOAMORTIZACAO: TFloatField;
    QryFundoInvestPERCTXPERFORM: TFloatField;
    QryFundoInvestPERCTXADM: TFloatField;
    QryFundoInvestSTAPROVISIONAIR: TStringField;
    QryFundoInvestDATAINICIOFUNDO: TDateTimeField;
    QryFundoInvestIDTIPOINVEST: TFloatField;
    QryFundoInvestDTAINIPROC: TDateTimeField;
    QryFundoInvestIDGESTORCARTEIRA: TFloatField;
    dblTipoFundo: TwwDBLookupCombo;
    lbTipoFundo: TLabel;
    dblFundoInvest: TwwDBLookupCombo;
    lbFundoInvest: TLabel;
    QryTipoCota: TwwQuery;
    QryTipoCotaIDTIPOCOTA: TFloatField;
    QryTipoCotaDESCTIPOCOTA: TStringField;
    lbTipoCota: TLabel;
    dblTipoCota: TwwDBLookupCombo;
    //AL_4
    qryPlanPrevCtbPatr: TwwQuery;
    qryPlanPrevCtbPatrPLANPRVCONTABPATRO: TStringField;
    qryPlanPrevCtbPatrIDPLANPREVCTBPATR: TFloatField;
    dblPlanPrevCtbPatr: TwwDBLookupCombo;
    lblPlanoPatro: TLabel;
    procedure FormShow(Sender: TObject);
    procedure dblTipoFundoExit(Sender: TObject);
    procedure dDataRefExit(Sender: TObject);
    procedure bbtnConfirmarClick(Sender: TObject);
    procedure bt_ImprimeClick(Sender: TObject);
    procedure bbtnSairClick(Sender: TObject);
    //AL_4
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure DbGMovFdoNormalCalcCellColors(Sender: TObject; Field: TField;
      State: TGridDrawState; Highlight: Boolean; AFont: TFont;
      ABrush: TBrush);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  FrmConsSldQtdCotasInteg: TFrmConsSldQtdCotasInteg;

implementation

uses FDmRelSldQtdCotasInteg, UOperComum, UMensErro, UBibliotecaInvest, UDiasUteisInv;

{$R *.DFM}

procedure TFrmConsSldQtdCotasInteg.FormShow(Sender: TObject);
begin
  inherited;
   dDataRef.Date := Date;
   //AL_4
   OperComum.LimpaParametros(QryTipoFundo);   
   QryTipoFundo.ParamByName('IDTIPOINVEST').AsInteger := iTipoInvestUsu;
   QryTipoFundo.Open;

   QryTipoCota.Close;
   QryTipoCota.Open;

   QryFundoInvest.Close;
   QryFundoInvest.Open;

   //AL_4
   qryPlanPrevCtbPatr.Close;
   qryPlanPrevCtbPatr.Open;

   OperComum.LimpaParametros(DmRelSldQtdCotasInteg.QrySldQtdCotasInteg);
   DmRelSldQtdCotasInteg.QrySldQtdCotasInteg.Open;

   //AL_4
   lbTipoCota.Visible  := (iTipoInvestUsu in [9,10]);
   dblTipoCota.Visible := (iTipoInvestUsu in [9,10]);

end;

procedure TFrmConsSldQtdCotasInteg.dblTipoFundoExit(Sender: TObject);
begin
  inherited;
   OperComum.LimpaParametros(QryFundoInvest);
   QryFundoInvest.ParamByName('DATAMOVFUNDO').AsString          := dDataRef.Text;
   QryFundoInvest.ParamByName('IDTIPOINVEST').AsInteger         := iTipoInvestUsu;
   If Trim(dblTipoFundo.Text) <> '' then
      QryFundoInvest.ParamByName('IDTIPOFUNDOINVEST').AsInteger := StrToInt(dblTipoFundo.LookupValue);
   QryFundoInvest.Open;
end;

procedure TFrmConsSldQtdCotasInteg.dDataRefExit(Sender: TObject);
begin
  inherited;
   If Trim(dDataRef.Text) = '' then
   begin
      MsgDlg('Informe a data de referência','Mensagem do Sistema',mtWarning,[MbOk],0);
      if dDataRef.CanFocus then
         dDataRef.SetFocus;
   end;
   OperComum.LimpaParametros(QryFundoInvest);
   QryFundoInvest.ParamByName('DATAMOVFUNDO').AsString          := dDataRef.Text;
   QryFundoInvest.ParamByName('IDTIPOINVEST').AsInteger         := iTipoInvestUsu;
   If Trim(dblTipoFundo.Text) <> '' then
      QryFundoInvest.ParamByName('IDTIPOFUNDOINVEST').AsInteger := StrToInt(dblTipoFundo.LookupValue);
   QryFundoInvest.Open;
end;

procedure TFrmConsSldQtdCotasInteg.bbtnConfirmarClick(Sender: TObject);
begin
  inherited;
   OperComum.LimpaParametros(DmRelSldQtdCotasInteg.QrySldQtdCotasInteg);
   OperComum.LimpaParametros(DmRelSldQtdCotasInteg.QrySldQtdCotasIntegAn);

   //AL_4
   with DmRelSldQtdCotasInteg Do
   begin

      QrySldQtdCotasInteg.DisableControls;

      QrySldQtdCotasInteg.Filter    := '';
      QrySldQtdCotasInteg.Filtered  := False;

      QrySldQtdCotasInteg.ParamByName('IDTIPOINVEST').AsInteger      := iTipoInvestUsu;
      QrySldQtdCotasInteg.ParamByName('DATAHISTCOTAINTEG').AsString  := dDataRef.Text;
      If Trim(dblPlanPrevCtbPatr.Text) <> '' then
         QrySldQtdCotasInteg.ParamByName('IDPLANPREVCTBPATR').AsInteger := StrToInt(dblPlanPrevCtbPatr.LookupValue);
      If Trim(dblTipoFundo.Text) <> '' then
         QrySldQtdCotasInteg.ParamByName('IDTIPOFUNDOINVEST').AsInteger := StrToInt(dblTipoFundo.LookupValue);
      If Trim(dblFundoInvest.Text) <> '' then
         QrySldQtdCotasInteg.ParamByName('IDFUNDOINVEST').AsInteger := StrToInt(dblFundoInvest.LookupValue);
      If ((dblTipoCota.Visible) And (Trim(dblTipoCota.Text) <> '')) then
         QrySldQtdCotasInteg.ParamByName('IDTIPOCOTA').AsInteger := StrToInt(dblTipoCota.LookupValue);
      QrySldQtdCotasInteg.Open;

      QrySldQtdCotasIntegAn.DisableControls;

      QrySldQtdCotasIntegAn.Filter    := '';
      QrySldQtdCotasIntegAn.Filtered  := False;

      QrySldQtdCotasIntegAn.ParamByName('IDTIPOINVEST').AsInteger      := iTipoInvestUsu;
      QrySldQtdCotasIntegAn.ParamByName('DATAHISTCOTAINTEG').AsString  := dDataRef.Text;
      If Trim(dblPlanPrevCtbPatr.Text) <> '' then
         QrySldQtdCotasIntegAn.ParamByName('IDPLANPREVCTBPATR').AsInteger := StrToInt(dblPlanPrevCtbPatr.LookupValue);
      If Trim(dblTipoFundo.Text) <> '' then
         QrySldQtdCotasIntegAn.ParamByName('IDTIPOFUNDOINVEST').AsInteger := StrToInt(dblTipoFundo.LookupValue);
      If Trim(dblFundoInvest.Text) <> '' then
         QrySldQtdCotasIntegAn.ParamByName('IDFUNDOINVEST').AsInteger := StrToInt(dblFundoInvest.LookupValue);
      If ((dblTipoCota.Visible) And (Trim(dblTipoCota.Text) <> '')) then
         QrySldQtdCotasIntegAn.ParamByName('IDTIPOCOTA').AsInteger := StrToInt(dblTipoCota.LookupValue);
      QrySldQtdCotasIntegAn.Open;

      QrySldQtdCotasInteg.EnableControls;
      QrySldQtdCotasIntegAn.EnableControls;

     // QrySldQtdCotasIntegAnDESCTIPOCOTA.Visible := dblTipoCota.Visible;

      ppGroupHeaderBand2.Visible := (Trim(dblPlanPrevCtbPatr.Text) = '');

      pplPlano.Visible := (Trim(dblPlanPrevCtbPatr.Text) <> '');

      //AL_5
      pplPlano.Caption := dblPlanPrevCtbPatr.Text;

   end;
end;

procedure TFrmConsSldQtdCotasInteg.bt_ImprimeClick(Sender: TObject);
begin
  inherited;

  if Not DmRelSldQtdCotasInteg.QrySldQtdCotasInteg.IsEmpty then
  begin
     Try
       DmRelSldQtdCotasInteg.lblPeriodoRef.Caption := dDataRef.Text;
       DmRelSldQtdCotasInteg.ppTipoCota.Visible    := (iTipoInvestUsu in [9,10]);
       DmRelSldQtdCotasInteg.ppDbTipoCota.Visible  := (iTipoInvestUsu in [9,10]);

       DmRelSldQtdCotasInteg.QrySldQtdCotasIntegAn.DisableControls;
       TfrmPreview.CreateModalPreview(Application,
                                      DmRelSldQtdCotasInteg.rpSldQtdCotasInteg,
                                      DmRelSldQtdCotasInteg.rpSldQtdCotasInteg.PrinterSetup.DocumentName);
     Finally
       DmRelSldQtdCotasInteg.QrySldQtdCotasIntegAn.Filter := '';
       DmRelSldQtdCotasInteg.QrySldQtdCotasIntegAn.Filtered := False;
       DmRelSldQtdCotasInteg.QrySldQtdCotasIntegAn.EnableControls;
     end;
  end;
end;

procedure TFrmConsSldQtdCotasInteg.bbtnSairClick(Sender: TObject);
begin
  inherited;
   dDataRef.Date := Date;
   OperComum.LimpaParametros(DmRelSldQtdCotasInteg.QrySldQtdCotasInteg);
   OperComum.LimpaParametros(QryTipoCota);
   OperComum.LimpaParametros(QryFundoInvest);
   OperComum.LimpaParametros(QryTipoFundo);
end;

//AL_4
procedure TFrmConsSldQtdCotasInteg.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
  inherited;
   QryTipoFundo.Close;
   QryTipoCota.Close;
   QryFundoInvest.Close;
   qryPlanPrevCtbPatr.Close;
   DmRelSldQtdCotasInteg.QrySldQtdCotasInteg.Close;
   DmRelSldQtdCotasInteg.QrySldQtdCotasIntegAn.Close;
end;

procedure TFrmConsSldQtdCotasInteg.DbGMovFdoNormalCalcCellColors(
  Sender: TObject; Field: TField; State: TGridDrawState;
  Highlight: Boolean; AFont: TFont; ABrush: TBrush);
begin
  inherited;
  // faz com que as linhas do grid tenham cores alternadas
  if State <> [gdSelected] then begin
     if not Highlight then begin
        // linhas ímpares = amarelo, linhas pares = branco
        if ((Sender as TwwDBGrid).CalcCellRow mod 2) = 0 then begin
           ABrush.Color := $00C0FFFF; // amarelo bebê
        end else begin
           ABrush.Color := clWhite;
        end;
     end;
  end else begin
     ABrush.Color := clHighLight;
     AFont.Color  := clHighLightText;
  end;
end;

end.
