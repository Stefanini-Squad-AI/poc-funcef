//******************************************************************************
// Data      : 16/02/2007
// Codigo    : AL_01
// Pendência : 24475
// Sol       :
// Motivo    : Consulta de Boleta de Operação dos Fundos.
//******************************************************************************

unit FConsBoletaOperFundosMT;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  FOkCancelarRelInv, wwdbdatetimepicker, CMDateTimePicker, StdCtrls,
  wwdblook, Db, DBClient, uCMClientDataSet, IvDictio, IvMulti, IvEMulti,
  MAHlpBtn, Buttons, TB97Tlbr, TB97, fcLabel, ExtCtrls, uCmSqlParams,
  Grids, Wwdbigrd, Wwdbgrid, uCtrlPadroes, uCtrlInvestimento, UCtrlFundos,
  UBibliotecaInvest, uMensErro, uSistema, FPreview;

type
  TFrmConsBoletaOperFundosMT = class(TfrmOkCancelarRelInv)
    cdsTipoFundo: TCMClientDataSet;
    cdsFundoInvest: TCMClientDataSet;
    cdsPlanoPrev: TCMClientDataSet;
    pnlFiltros: TPanel;
    lblTipoFundo: TLabel;
    lblPlanoPrev: TLabel;
    lblFundoInvest: TLabel;
    dblTipoFundo: TwwDBLookupCombo;
    dblPlanoPrev: TwwDBLookupCombo;
    dblFundoInvest: TwwDBLookupCombo;
    gpbPeriodo: TGroupBox;
    Label8: TLabel;
    dDataFim: TCMDateTimePicker;
    Label6: TLabel;
    dDataIni: TCMDateTimePicker;
    CMSqlParams1: TCMSqlParams;
    procedure FormCreate(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure dblTipoFundoCloseUp(Sender: TObject; LookupTable,
      FillTable: TDataSet; modified: Boolean);
    procedure dblTipoFundoEnter(Sender: TObject);
    procedure dblTipoFundoExit(Sender: TObject);
    procedure bt_ImprimeClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
    bModif  : Boolean;
    wValAnt : String;

    CtrlInvestimento       : TCtrlInvestimento;
    CtrlFundos             : TCtrlFundos;
  end;

var
  FrmConsBoletaOperFundosMT: TFrmConsBoletaOperFundosMT;

implementation

uses RConsBoletaOperFundo;

{$R *.DFM}

procedure TFrmConsBoletaOperFundosMT.FormCreate(Sender: TObject);
begin
  inherited;
   CtrlInvestimento      := TCtrlInvestimento.Create;
   CtrlFundos            := TCtrlFundos.Create;

   CtrlInvestimento.InitializeAs(Padroes);
   CtrlFundos.InitializeAs(Padroes);

   cdsTipoFundo.Data     := CtrlFundos.ListTipoFundoInvest(iTipoInvestUsu);
   cdsPlanoPrev.Data     := CtrlInvestimento.ListPlanoPatro;
   cdsFundoInvest.Data   := CtrlFundos.ListFundoInvest(iTipoInvestUsu);
end;

procedure TFrmConsBoletaOperFundosMT.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
  inherited;
   FreeAndNil(CtrlInvestimento);
   FreeAndNil(CtrlFundos);
end;

procedure TFrmConsBoletaOperFundosMT.dblTipoFundoCloseUp(Sender: TObject;
  LookupTable, FillTable: TDataSet; modified: Boolean);
begin
  inherited;
  bModif := modified;
  if ((modified) And (Trim(dblTipoFundo.Text) <> '')) Then
     cdsFundoInvest.Data   := CtrlFundos.ListFundoInvest(iTipoInvestUsu, StrToInt(dblTipoFundo.LookupValue));
end;

procedure TFrmConsBoletaOperFundosMT.dblTipoFundoEnter(Sender: TObject);
begin
  inherited;
   wValAnt := DblTipoFundo.LookupValue;
end;

procedure TFrmConsBoletaOperFundosMT.dblTipoFundoExit(Sender: TObject);
begin
  inherited;
  if ((Not bModif) And ((Trim(dblTipoFundo.Text) <> '') And (wValAnt <> DblTipoFundo.LookupValue))) then
     cdsFundoInvest.Data := CtrlFundos.ListFundoInvest(iTipoInvestUsu, StrToInt(dblTipoFundo.LookupValue));
  bModif := false;
end;

procedure TFrmConsBoletaOperFundosMT.bt_ImprimeClick(Sender: TObject);
var iTipoFundo, iFundoInvest, iPlanoPrev : Integer;
begin
  inherited;
   if Trim(dDataIni.Text) = '' then
   begin
      MsgDlg('Informar a data inicial.','Mensagem do Sistema',mtWarning,[MbOk],0);
      if dDataIni.CanFocus then
         dDataIni.SetFocus;
      Exit;
   end;

   if Trim(dDataFim.Text) = '' then
   begin
      MsgDlg('Informar a data final.','Mensagem do Sistema',mtWarning,[MbOk],0);
      if dDataFim.CanFocus then
         dDataFim.SetFocus;
      Exit;
   end;

   if (dDataFim.Date < dDataIni.Date) then
   begin
      MsgDlg('Data Final menor que a data inicial.','Mensagem do Sistema',mtWarning,[MbOk],0);
      if dDataFim.CanFocus then
         dDataFim.SetFocus;
      Exit;
   end;

   iTipoFundo    := -1;
   if Trim(dblTipoFundo.Text) <> '' then
      iTipoFundo := cdsTipoFundo.FieldByName('IDTIPOFUNDOINVEST').AsInteger;

   iPlanoPrev    := -1;
   if Trim(dblPlanoPrev.Text) <> '' then
      iPlanoPrev := cdsPlanoPrev.FieldByName('IDPLANPREVCTBPATR').AsInteger;      

   iFundoInvest  := -1;
   if Trim(dblFundoInvest.Text) <> '' then
      iFundoInvest := cdsFundoInvest.FieldByName('IDFUNDOINVEST').AsInteger;

   RelConsBoletaOperFundo.cdsBoletaFundo.Data := CtrlFundos.ListConsBoleta(dDataIni.Text, dDataFim.Text,
                                                                           iTipoInvestUsu, iTipoFundo,
                                                                           iFundoInvest, iPlanoPrev);
   if not RelConsBoletaOperFundo.cdsBoletaFundo.IsEmpty then
   begin
      RelConsBoletaOperFundo.LblSistema.Caption := Sistema.NomeModulo;   

      RelConsBoletaOperFundo.lblEmpresa.Caption := Sistema.NomeEmpresa;

      TFrmPreview.CreateModalPreview(Application,
                                     RelConsBoletaOperFundo.rptBoletaFundo,
                                     RelConsBoletaOperFundo.rptBoletaFundo.PrinterSetup.DocumentName);

      RelConsBoletaOperFundo.cdsBoletaFundo.EmptyDataSet;
   end;

end;

end.
