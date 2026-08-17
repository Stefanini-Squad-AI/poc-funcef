//******************************************************************************
// Data      : 16/02/2007
// Código    : AL_1
// Pendencia : 22229
// SOL       : 42585
// Motivo    : Implementação de Consulta de Amortização Bloqueada (3 camadas)
// Desc      : A quandidade de decimal das cotas está sendo construído de acordo
//             com a dade de decimal do Fundo em HistFundo de acordo com a data
//             de operacao
//******************************************************************************
unit FConsAmortizacaoBloqMT;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  FOkCancelarRelInv, IvDictio, IvMulti, IvEMulti, MAHlpBtn, StdCtrls,
  Buttons, TB97Tlbr, TB97, fcLabel, ExtCtrls, uCmSqlParams, Db, Grids,
  Wwdbigrd, Wwdbgrid, DBClient, uCMClientDataSet, wwdblook,
  wwdbdatetimepicker, CMDateTimePicker, uCtrlInvestimento, UCtrlFundos,uCtrlPadroes,
  uCtrlParamInvest, FPreview, RConsAmortizacaoBloq,
  //AL_1
  uCtrlBiblioteca;

type
  TFrmConsAmortizacaoBloqMT = class(TfrmOkCancelarRelInv)
    pnlFiltros: TPanel;
    Label6: TLabel;
    Label8: TLabel;
    lblPlanoPrev: TLabel;
    lblFundoInvest: TLabel;
    edDataIni: TCMDateTimePicker;
    edDataFim: TCMDateTimePicker;
    dblPlanoPrev: TwwDBLookupCombo;
    dblFundoInvest: TwwDBLookupCombo;
    cdsPlanoPrev: TCMClientDataSet;
    grdConsulta: TwwDBGrid;
    cdsFundoInvest: TCMClientDataSet;
    dsConsulta: TDataSource;
    CdsConsulta: TCMClientDataSet;
    CMSqlParams1: TCMSqlParams;
    lblTipoFundo: TLabel;
    dblTipoFundo: TwwDBLookupCombo;
    cdsTipoFundo: TCMClientDataSet;
    procedure FormCreate(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure bbtnConfirmarClick(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure bbtnCancelarClick(Sender: TObject);
    procedure dblTipoFundoEnter(Sender: TObject);
    procedure dblTipoFundoCloseUp(Sender: TObject; LookupTable,
      FillTable: TDataSet; modified: Boolean);
    procedure dblTipoFundoExit(Sender: TObject);
    procedure bt_ImprimeClick(Sender: TObject);
    procedure edDataIniEnter(Sender: TObject);
    procedure edDataIniExit(Sender: TObject);
    procedure edDataFimEnter(Sender: TObject);
    procedure edDataFimExit(Sender: TObject);
    procedure dblPlanoPrevCloseUp(Sender: TObject; LookupTable,
      FillTable: TDataSet; modified: Boolean);
    procedure dblFundoInvestCloseUp(Sender: TObject; LookupTable,
      FillTable: TDataSet; modified: Boolean);
  private
    { Private declarations }
    bModif  : Boolean;
    wValAnt : String;
    dDtIniAnt, dDtFimAnt: TDateTime;

    CtrlInvestimento : TCtrlInvestimento;
    CtrlFundos: TCtrlFundos;

    RelConsAmortizacaoBloq  : TRelConsAmortizacaoBloq;

  public
    { Public declarations }
  end;

var
  FrmConsAmortizacaoBloqMT: TFrmConsAmortizacaoBloqMT;

implementation


{$R *.DFM}

procedure TFrmConsAmortizacaoBloqMT.FormCreate(Sender: TObject);
begin
  inherited;
  RelConsAmortizacaoBloq := TRelConsAmortizacaoBloq.Create(Self);

  CtrlInvestimento      := TCtrlInvestimento.Create;
  CtrlFundos            := TCtrlFundos.Create;

  CtrlInvestimento.InitializeAs(Padroes);
  CtrlFundos.InitializeAs(Padroes);

  CdsTipoFundo.Data     := CtrlFundos.ListTipoFundoInvest(CtrlPInv.IdTipoInvest);
  CdsFundoInvest.Data   := CtrlFundos.ListFundoInvest(CtrlPInv.IdTipoInvest);
  CdsPlanoPrev.Data     := CtrlInvestimento.ListPlanoPatro;
  
end;

procedure TFrmConsAmortizacaoBloqMT.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
  inherited;
  FreeAndNil(CtrlInvestimento);
  FreeAndNil(CtrlFundos);
end;

procedure TFrmConsAmortizacaoBloqMT.bbtnConfirmarClick(Sender: TObject);
var
   iTipoFundo, iFundoInvest, iPlanoPrev,i : Integer;
   sMascara: String;

begin
  inherited;
   i := 0;
   iTipoFundo    := -1;
   if Trim(dblTipoFundo.Text) <> '' then
      iTipoFundo := cdsTipoFundo.FieldByName('IDTIPOFUNDOINVEST').AsInteger;

   iFundoInvest  := -1;
   if Trim(dblFundoInvest.Text) <> '' then
      iFundoInvest := cdsFundoInvest.FieldByName('IDFUNDOINVEST').AsInteger;

   iPlanoPrev    := -1;
   if Trim(dblPlanoPrev.Text) <> '' then
      iPlanoPrev := cdsPlanoPrev.FieldByName('IDPLANPREVCTBPATR').AsInteger;
   //AL_1
   cdsConsulta.Data := CtrlFundos.ListConsAmortBloq(CtrlBiblioteca.IIf(edDataIni.Date = 0,-1,edDataIni.Date),CtrlBiblioteca.IIf(edDataFim.Date=0,-1,edDataFim.Date),
                                                    CtrlPInv.IdTipoInvest, iTipoFundo,
                                                    iFundoInvest, iPlanoPrev);
   //Construindo a mascara
   sMascara := '#,##0.';
   for i:= 1 to (cdsConsulta.FieldByName('QTDDECQTD').AsInteger -1) do
      sMascara := sMascara + '#';
   sMascara := sMascara + '0';

   // Aplicando a mascara de Valor no Cds
   For i:= 0 to (cdsConsulta.Fields.Count-1) do
   begin
      If cdsConsulta.Fields[i].FieldName = 'VLROPERACAO' then
      begin
         TFloatField(cdsConsulta.fields[i]).DisplayFormat:= '###,###,###,###.#0';
      end;
   end;

   // Aplicando a mascara de Qdade no Cds
   For i:= 0 to (cdsConsulta.Fields.Count-1) do
   begin
      If cdsConsulta.Fields[i].FieldName = 'QTDOPERACAO' then
      begin
         TFloatField(cdsConsulta.fields[i]).DisplayFormat:= sMascara;
      end;
   end;

   if cdsConsulta.IsEmpty then
      bt_Imprime.Enabled  := False
   else
      bt_Imprime.Enabled  := True;

end;

procedure TFrmConsAmortizacaoBloqMT.FormShow(Sender: TObject);
begin
  inherited;
  //AL_1
  cdsConsulta.Data   := CtrlFundos.ListConsAmortBloq(0,0,CtrlPInv.IdTipoInvest);
end;

procedure TFrmConsAmortizacaoBloqMT.bbtnCancelarClick(Sender: TObject);
begin
  inherited;
   //AL_1
   cdsConsulta.Data   := CtrlFundos.ListConsAmortBloq(0,0,CtrlPInv.IdTipoInvest);
   bt_Imprime.Enabled := False;
end;

procedure TFrmConsAmortizacaoBloqMT.dblTipoFundoEnter(Sender: TObject);
begin
  inherited;
  wValAnt := DblTipoFundo.LookupValue;
end;

procedure TFrmConsAmortizacaoBloqMT.dblTipoFundoCloseUp(Sender: TObject;
  LookupTable, FillTable: TDataSet; modified: Boolean);
begin
  inherited;
  bModif := modified;
  if ((modified) And (Trim(dblTipoFundo.Text) <> '')) Then
  begin
     cdsFundoInvest.Data   := CtrlFundos.ListFundoInvest(CtrlPInv.IdTipoInvest, StrToInt(dblTipoFundo.LookupValue));
     bbtnCancelarClick(Self);
  end;
end;

procedure TFrmConsAmortizacaoBloqMT.dblTipoFundoExit(Sender: TObject);
begin
  inherited;
  if ((bModif) And ((Trim(dblTipoFundo.Text) <> '') And (wValAnt <> DblTipoFundo.LookupValue))) then
     cdsFundoInvest.Data := CtrlFundos.ListFundoInvest(CtrlPInv.IdTipoInvest, StrToInt(dblTipoFundo.LookupValue));
  bModif := false;
end;

procedure TFrmConsAmortizacaoBloqMT.bt_ImprimeClick(Sender: TObject);
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

   RelConsAmortizacaoBloq.cdsAmortizacaoBloq.Data := cdsConsulta.Data;
   RelConsAmortizacaoBloq.lblPeriodo.Caption     := edDataIni.Text + ' a ' + edDataFim.Text;
   RelConsAmortizacaoBloq.lblEmpresa.Caption     := CtrlPInv.NomeEmpresa;

   if not cdsConsulta.IsEmpty then
      TFrmPreview.CreateModalPreview(Application,
                                     RelConsAmortizacaoBloq.rptAmortizacaoBloq,
                                     RelConsAmortizacaoBloq.rptAmortizacaoBloq.PrinterSetup.DocumentName);

   RelConsAmortizacaoBloq.cdsAmortizacaoBloq.EmptyDataSet;


end;

procedure TFrmConsAmortizacaoBloqMT.edDataIniEnter(Sender: TObject);
begin
  inherited;
  dDtIniAnt := edDataIni.DateTime;
end;

procedure TFrmConsAmortizacaoBloqMT.edDataIniExit(Sender: TObject);
begin
  inherited;
  if dDtIniAnt <> edDataIni.DateTime then
     bbtnCancelarClick(Self);
end;

procedure TFrmConsAmortizacaoBloqMT.edDataFimEnter(Sender: TObject);
begin
  inherited;
  dDtFimAnt := edDataFim.DateTime;
end;

procedure TFrmConsAmortizacaoBloqMT.edDataFimExit(Sender: TObject);
begin
  inherited;
  if dDtFimAnt <> edDataFim.DateTime then
     bbtnCancelarClick(Self);
end;

procedure TFrmConsAmortizacaoBloqMT.dblPlanoPrevCloseUp(Sender: TObject; LookupTable, FillTable: TDataSet; modified: Boolean);
begin
  inherited;
  if modified then
     bbtnCancelarClick(Self);
end;

procedure TFrmConsAmortizacaoBloqMT.dblFundoInvestCloseUp(Sender: TObject; LookupTable, FillTable: TDataSet; modified: Boolean);
begin
  inherited;
  if modified then
     bbtnCancelarClick(Self);
end;

end.
