//******************************************************************************
// Data      : 17/01/2007
// Código    :
// Pendencia : 22229
// SOL       :
// Motivo    : Implementação
//******************************************************************************

unit FConsAmortizacaoRecMT;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  FOkCancelarRelInv, IvDictio, IvMulti, IvEMulti, MAHlpBtn, StdCtrls,
  Buttons, TB97Tlbr, TB97, fcLabel, ExtCtrls, wwdblook, wwdbdatetimepicker,
  CMDateTimePicker,  Grids, Wwdbigrd, Wwdbgrid, uCmSqlParams, Db, DBClient,
  uCMClientDataSet,  uMensErro, uSistema, FPreview, uCtrlPadroes,
  uCtrlInvestimento, UCtrlFundos, RConsAmortizacaoRec, UBibliotecaInvest;

type
  TFrmConsAmortizacaoRecMT = class(TfrmOkCancelarRelInv)
    pnlFiltros: TPanel;
    Label6: TLabel;
    Label8: TLabel;
    lblTipoFundo: TLabel;
    lblPlanoPrev: TLabel;
    edDataIni: TCMDateTimePicker;
    edDataFim: TCMDateTimePicker;
    dblTipoFundo: TwwDBLookupCombo;
    dblPlanoPrev: TwwDBLookupCombo;
    lblFundoInvest: TLabel;
    dblFundoInvest: TwwDBLookupCombo;
    grdConsulta: TwwDBGrid;
    CMSqlParams1: TCMSqlParams;
    cdsConsulta: TCMClientDataSet;
    dsConsulta: TDataSource;
    dblTipoOperacao: TwwDBLookupCombo;
    lblTipoOperacao: TLabel;
    cdsTipoFundo: TCMClientDataSet;
    cdsFundoInvest: TCMClientDataSet;
    cdsPlanoPrev: TCMClientDataSet;
    cdsTipoOper: TCMClientDataSet;
    CMSqlParams2: TCMSqlParams;
    cdsConsultaDESCTIPOFUNDOINV: TStringField;
    cdsConsultaPLANPRVCONTABPATRO: TStringField;
    cdsConsultaDESCFUNDOINVEST: TStringField;
    cdsConsultaDESCTIPOOPERACAO: TStringField;
    cdsConsultaDATAOPERACAO: TDateTimeField;
    cdsConsultaVLROPERACAO: TFloatField;
    procedure bt_ImprimeClick(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure bbtnConfirmarClick(Sender: TObject);
    procedure bbtnCancelarClick(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure dblTipoFundoCloseUp(Sender: TObject; LookupTable,
      FillTable: TDataSet; modified: Boolean);
    procedure dblTipoFundoEnter(Sender: TObject);
    procedure dblTipoFundoExit(Sender: TObject);
  private
    { Private declarations }

    bModif  : Boolean;
    wValAnt : String;

    CtrlInvestimento       : TCtrlInvestimento;
    CtrlFundos             : TCtrlFundos;
    RelConsAmortizacaoRec  : TRelConsAmortizacaoRec;

  public
    { Public declarations }
  end;

var
  FrmConsAmortizacaoRecMT: TFrmConsAmortizacaoRecMT;

implementation

{$R *.DFM}

procedure TFrmConsAmortizacaoRecMT.bt_ImprimeClick(Sender: TObject);
var iTipoFundo, iFundoInvest, iPlanoPrev, iTipoOper : Integer;
begin
  inherited;
   iTipoFundo   := -1;
   if Trim(dblTipoFundo.Text) <> '' then
      iTipoFundo := cdsTipoFundo.FieldByName('IDTIPOFUNDOINVEST').AsInteger;

   iFundoInvest := -1;
   if Trim(dblFundoInvest.Text) <> '' then
      iFundoInvest := cdsFundoInvest.FieldByName('IDFUNDOINVEST').AsInteger;

   iPlanoPrev   := -1;
   if Trim(dblPlanoPrev.Text) <> '' then
      iPlanoPrev := cdsPlanoPrev.FieldByName('IDPLANPREVCTBPATR').AsInteger;

   iTipoOper    := 0;
   if Trim(dblTipoOperacao.Text) <> '' then
      iTipoOper  := cdsTipoOper.FieldByName('IDTIPOOPERACAO').AsInteger;

   RelConsAmortizacaoRec.cdsAmortizacaoRec.Data := cdsConsulta.Data;
   RelConsAmortizacaoRec.lblPeriodo.Caption     := edDataIni.Text + ' a ' + edDataFim.Text;
   RelConsAmortizacaoRec.lblEmpresa.Caption     := Sistema.NomeEmpresa;

   if not cdsConsulta.IsEmpty then
      TFrmPreview.CreateModalPreview(Application,
                                     RelConsAmortizacaoRec.rptAmortizacaoRec,
                                     RelConsAmortizacaoRec.rptAmortizacaoRec.PrinterSetup.DocumentName);

   RelConsAmortizacaoRec.cdsAmortizacaoRec.EmptyDataSet;

end;

procedure TFrmConsAmortizacaoRecMT.FormCreate(Sender: TObject);
begin
  inherited;
   RelConsAmortizacaoRec := TRelConsAmortizacaoRec.Create(Self);
   CtrlInvestimento      := TCtrlInvestimento.Create;
   CtrlFundos            := TCtrlFundos.Create;

   CtrlInvestimento.InitializeAs(Padroes);
   CtrlFundos.InitializeAs(Padroes);

   cdsTipoFundo.Data     := CtrlFundos.ListTipoFundoInvest(iTipoInvestUsu);
   cdsFundoInvest.Data   := CtrlFundos.ListFundoInvest(iTipoInvestUsu);
   cdsPlanoPrev.Data     := CtrlInvestimento.ListPlanoPatro;
   cdsTipoOper.Data      := CtrlInvestimento.ListTipoOperacao(iTipoInvestUsu);
end;

procedure TFrmConsAmortizacaoRecMT.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
   FreeAndNil(CtrlInvestimento);
   FreeAndNil(CtrlFundos);

  inherited;

end;

procedure TFrmConsAmortizacaoRecMT.bbtnConfirmarClick(Sender: TObject);
var iTipoFundo, iFundoInvest, iPlanoPrev, iTipoOper : Integer;
begin
  inherited;
   iTipoFundo    := -1;
   if Trim(dblTipoFundo.Text) <> '' then
      iTipoFundo := cdsTipoFundo.FieldByName('IDTIPOFUNDOINVEST').AsInteger;

   iFundoInvest  := -1;
   if Trim(dblFundoInvest.Text) <> '' then
      iFundoInvest := cdsFundoInvest.FieldByName('IDFUNDOINVEST').AsInteger;

   iPlanoPrev    := -1;
   if Trim(dblPlanoPrev.Text) <> '' then
      iPlanoPrev := cdsPlanoPrev.FieldByName('IDPLANPREVCTBPATR').AsInteger;

   iTipoOper     := 0;
   if Trim(dblTipoOperacao.Text) <> '' then
      iTipoOper  := cdsTipoOper.FieldByName('IDTIPOOPERACAO').AsInteger;

   cdsConsulta.Data := CtrlFundos.ListConsAmortRec(edDataIni.Text, edDataFim.Text,
                                                   iTipoInvestUsu, iTipoFundo,
                                                   iFundoInvest, iPlanoPrev, iTipoOper); 
   if cdsConsulta.IsEmpty then
      bt_Imprime.Enabled  := False
   else
      bt_Imprime.Enabled  := True;

end;

procedure TFrmConsAmortizacaoRecMT.bbtnCancelarClick(Sender: TObject);
begin
  inherited;
   cdsConsulta.Data   := CtrlFundos.ListConsAmortRec('', '');
   bt_Imprime.Enabled := False;
end;

procedure TFrmConsAmortizacaoRecMT.FormShow(Sender: TObject);
begin
  inherited;
   cdsConsulta.Data   := CtrlFundos.ListConsAmortRec('', '');
end;

procedure TFrmConsAmortizacaoRecMT.dblTipoFundoCloseUp(Sender: TObject;
  LookupTable, FillTable: TDataSet; modified: Boolean);
begin
  inherited;
  bModif := modified;
  if ((modified) And (Trim(dblTipoFundo.Text) <> '')) Then
     cdsFundoInvest.Data   := CtrlFundos.ListFundoInvest(iTipoInvestUsu, StrToInt(dblTipoFundo.LookupValue));

end;

procedure TFrmConsAmortizacaoRecMT.dblTipoFundoEnter(Sender: TObject);
begin
  inherited;
   wValAnt := DblTipoFundo.LookupValue;
end;

procedure TFrmConsAmortizacaoRecMT.dblTipoFundoExit(Sender: TObject);
begin
  inherited;
  if ((Not bModif) And ((Trim(dblTipoFundo.Text) <> '') And (wValAnt <> DblTipoFundo.LookupValue))) then
     cdsFundoInvest.Data := CtrlFundos.ListFundoInvest(iTipoInvestUsu, StrToInt(dblTipoFundo.LookupValue));
  bModif := false;
end;

end.
