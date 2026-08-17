//******************************************************************************
//Data	     : 14/03/2006
//Codigo     : AL_3
// Pendência : 24740
// SOL       : 55666
//Função     : Tratar operacoes de Transf. Planos para ficar com o valor negativo
//******************************************************************************
// Data     : 12/12/2005
// Código   : AL_2
// Pendencia: 20901
// Sol      : 38821
// Motivo   : Criação do campo FLGREGIMECXCOMP e DTAREGIMECXCOMP na PARAMINVEST
//            para testar a utilização de regime de Caixa ou Competência nas
//            Operações de Renda Fixa
//******************************************************************************
//Data	    : 24/08/2005
//Código    : AL_1
//Motivo(S) : Ajuste no tela para implementação de repactuação (PAS e DFM)
//******************************************************************************

unit FConsOperRenFix;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  FOkCancelarInv, IvDictio, IvMulti, IvEMulti, MAHlpBtn, StdCtrls, Buttons,
  TB97Tlbr, TB97, fcLabel, ExtCtrls, Db, DBTables, Wwquery, wwdblook,FPreview,
  wwdbdatetimepicker, CMDateTimePicker, Grids, Wwdbigrd, Wwdbgrid, Menus,
  //AL_2
  uInvestimento;

type
  TfrmConsOperRenFix = class(TfrmOkCancelarInv)
    pnlDados: TPanel;
    dtDataInicio: TCMDateTimePicker;
    dtDataFim: TCMDateTimePicker;
    dblInvestimento: TwwDBLookupCombo;
    qryInvestimento: TwwQuery;
    Label1: TLabel;
    Label2: TLabel;
    Label3: TLabel;
    pnlOperacoes: TPanel;
    pnlTitOperacoes: TPanel;
    dbgOperacoes: TwwDBGrid;
    pnlItems: TPanel;
    pnlTitItems: TPanel;
    dbgItens: TwwDBGrid;
    bbtnImprimir: TBitBtn;
    ToolbarSep972: TToolbarSep97;
    splSeparaGrids: TSplitter;
    dblEmissor: TwwDBLookupCombo;
    Label4: TLabel;
    qryEmissor: TwwQuery;
    qryPlanPrevCtbPatr: TwwQuery;
    dblPlanPrevCtbPatr: TwwDBLookupCombo;
    Label5: TLabel;
    qryPlanPrevCtbPatrPLANPRVCONTABPATRO: TStringField;
    qryPlanPrevCtbPatrIDPLANPREVCTBPATR: TFloatField;
    qryPlanPrevCtbPatrIDPLANOPREV: TFloatField;
    qryPlanPrevCtbPatrIDPATRO: TFloatField;
    GroupBox1: TGroupBox;
    chkExpItens: TCheckBox;
    chkExpVenc: TCheckBox;
    dbgVencimentos: TwwDBGrid;
    pmnuVencimentos: TPopupMenu;
    splSepVencimentos: TSplitter;
    mnuMostraVencimentos: TMenuItem;
    mnuEscondeVencimentos: TMenuItem;
    procedure FormShow(Sender: TObject);
    procedure bbtnConfirmarClick(Sender: TObject);
    procedure bbtnImprimirClick(Sender: TObject);
    procedure bbtnCancelarClick(Sender: TObject);
    procedure dtDataInicioExit(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure FormCreate(Sender: TObject);
    procedure dblEmissorCloseUp(Sender: TObject; LookupTable,
      FillTable: TDataSet; modified: Boolean);
    procedure dblEmissorExit(Sender: TObject);
    procedure dblEmissorChange(Sender: TObject);
    procedure dblInvestimentoChange(Sender: TObject);
    procedure dtDataInicioChange(Sender: TObject);
    procedure dtDataFimChange(Sender: TObject);
    procedure dblPlanPrevCtbPatrChange(Sender: TObject);
    procedure mnuMostraVencimentosClick(Sender: TObject);
    procedure mnuEscondeVencimentosClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
    procedure FechaConsulta;
  end;

var
  frmConsOperRenFix: TfrmConsOperRenFix;

implementation

uses FDMRelRenFixOper, uOperComum, UMensErro, UBibliotecaInvest;

{$R *.DFM}

procedure TfrmConsOperRenFix.FechaConsulta;
begin
  OperComum.LimpaParametros(DmRelRenFixOper.qryOperacoes);
  OperComum.LimpaParametros(DmRelRenFixOper.qryItens);
  bbtnImprimir.Enabled := False;
end;

procedure TfrmConsOperRenFix.FormShow(Sender: TObject);
begin
   qryInvestimento.Open;
   qryEmissor.Open;
   qryPlanPrevCtbPatr.Open;
   FechaConsulta;
   inherited;
   dtDataInicio.Date := pRPI.DATAULTFECHRF;
   dtDataFim.Date := pRPI.DATAULTFECHRF;
   // AL_1
   dbgVencimentos.Visible := False;
   splSepVencimentos.Visible := False;
   mnuEscondeVencimentos.Enabled := False;
   mnuMostraVencimentos.Enabled := True;
end;

procedure TfrmConsOperRenFix.bbtnConfirmarClick(Sender: TObject);
begin
   inherited;
   if Trim(dtDataInicio.Text) = '' then
   begin
      MsgDlg('Falta Data Inicio para o Relatório.','Mensagem do Sistema ',mtWarning,[mbOK],0);
      dtDataInicio.SetFocus;
      exit;
   end;
   if Trim(dtDataFim.Text) = '' then
   begin
      MsgDlg('Falta Data Final para o Relatório.','Mensagem do Sistema ',mtWarning,[mbOK],0);
      dtDataFim.SetFocus;
      exit;
   end;
   // AL_1
   Opercomum.LimpaParametros(DmRelRenFixOper.qryOperacoes);
   Opercomum.LimpaParametros(DmRelRenFixOper.qryItens);
   Opercomum.LimpaParametros(DmRelRenFixOper.qryVencimentos);

   DmRelRenFixOper.qryOperacoes.ParamByName('DATAINI').AsString := dtDataInicio.Text;
   DmRelRenFixOper.qryOperacoes.ParamByName('DATAFIM').AsString := dtDataFim.Text;
   if Trim(dblInvestimento.Text) <> '' then
      DmRelRenFixOper.qryOperacoes.ParamByName('IDINVESTIMENTO').AsString     := dblInvestimento.LookupValue;
   if Trim(dblEmissor.Text) <> '' then
      DmRelRenFixOper.qryOperacoes.ParamByName('IDEMISSOR').AsString          := dblEmissor.LookupValue;
   if Trim(dblPlanPrevCtbPatr.Text) <> '' then
      DmRelRenFixOper.qryOperacoes.ParamByName('IDPLANPREVCTBPATR').AsInteger := qryPlanPrevCtbPatrIDPLANPREVCTBPATR.AsInteger; //iPlanPrevCtbPatro;
   //AL_2
   DmRelRenFixOper.qryOperacoes.ParamByName('FLGREGIMECXCOMP').AsString := 'N';
   if Investimentos.Params.FLGREGIMECXCOMP = 'S' then //Se utiliza Regime de Caixa e nâo de Competência
   begin
      if dtDataInicio.Date >= Investimentos.Params.DTAREGIMECXCOMP then
         DmRelRenFixOper.qryOperacoes.ParamByName('FLGREGIMECXCOMP').AsString := 'S';
   end;

   DmRelRenFixOper.qryOperacoes.Open;
   if not DmRelRenFixOper.qryOperacoes.IsEmpty then
   begin
      DmRelRenFixOper.qryItens.Filter := 'IDOPERRENFIX = ' + DmRelRenFixOper.qryOperacoesIDOPERRENFIX.AsString;
      DmRelRenFixOper.qryVencimentos.Filter := 'IDOPERRENFIX = ' + DmRelRenFixOper.qryOperacoesIDOPERRENFIX.AsString;
      bbtnImprimir.Enabled := True;
   end
   else
   begin
      DmRelRenFixOper.qryItens.Filter := 'IDOPERRENFIX = 0';
      DmRelRenFixOper.qryVencimentos.Filter := 'IDOPERRENFIX = 0';
      bbtnImprimir.Enabled := False;
   end;

   DmRelRenFixOper.qryItens.ParamByName('DATAINI').AsString := dtDataInicio.Text;
   DmRelRenFixOper.qryItens.ParamByName('DATAFIM').AsString := dtDataFim.Text;
   if Trim(dblPlanPrevCtbPatr.Text) <> '' then
      DmRelRenFixOper.qryItens.ParamByName('IDPLANPREVCTBPATR').AsInteger := qryPlanPrevCtbPatrIDPLANPREVCTBPATR.AsInteger; //iPlanPrevCtbPatro;
   DmRelRenFixOper.qryItens.Open;

   DmRelRenFixOper.qryVencimentos.ParamByName('DATAINI').AsString := dtDataInicio.Text;
   DmRelRenFixOper.qryVencimentos.ParamByName('DATAFIM').AsString := dtDataFim.Text;
   if Trim(dblInvestimento.Text) <> '' then
      DmRelRenFixOper.qryVencimentos.ParamByName('IDINVESTIMENTO').AsString     := dblInvestimento.LookupValue;
   if Trim(dblPlanPrevCtbPatr.Text) <> '' then
      DmRelRenFixOper.qryVencimentos.ParamByName('IDPLANPREVCTBPATR').AsInteger := qryPlanPrevCtbPatrIDPLANPREVCTBPATR.AsInteger; //iPlanPrevCtbPatro;
   DmRelRenFixOper.qryVencimentos.Open;
   // AL_1
end;

procedure TfrmConsOperRenFix.bbtnImprimirClick(Sender: TObject);
begin
  inherited;
  // AL_1
  DmRelRenFixOper.lblPeriodo.Caption := 'Período: ' + dtDataInicio.Text + ' a ' + dtDataFim.Text;

  if Trim(dblEmissor.Text) <> '' then
     DmRelRenFixOper.lblEmissor.Caption := 'Emissor: ' + Trim(dblEmissor.Text)
  else DmRelRenFixOper.lblEmissor.Caption := '';

  DmRelRenFixOper.qryOperacoes.DisableControls;
  DmRelRenFixOper.qryItens.DisableControls;
  if chkExpItens.Checked then
     DmRelRenFixOper.srptRenFixOper.ExpandAll := True
  else
     DmRelRenFixOper.srptRenFixOper.ExpandAll := False;
  if chkExpVenc.Checked then
     DmRelRenFixOper.srptVencimentos.ExpandAll := True
  else
     DmRelRenFixOper.srptVencimentos.ExpandAll := False;

  TfrmPreview.CreateModalPreview(Application,
                                 DmRelRenFixOper.rptRenFixOper,
                                 DmRelRenFixOper.rptRenFixOper.PrinterSetup.DocumentName);

  DmRelRenFixOper.qryOperacoes.EnableControls;
  DmRelRenFixOper.qryItens.EnableControls;
end;

procedure TfrmConsOperRenFix.bbtnCancelarClick(Sender: TObject);
begin
  inherited;
  FechaConsulta;
  dtDataInicio.SetFocus;
end;

procedure TfrmConsOperRenFix.dtDataInicioExit(Sender: TObject);
begin
  inherited;
  if Trim(dtDataFim.Text) = '' then
     dtDataFim.DateTime := dtDataInicio.DateTime;
end;

procedure TfrmConsOperRenFix.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
   qryInvestimento.Close;
   qryEmissor.Close;
   qryPlanPrevCtbPatr.Close;
   DmRelRenFixOper.qryOperacoes.Close;
   DmRelRenFixOper.qryItens.Close;
   inherited;
end;

procedure TfrmConsOperRenFix.FormCreate(Sender: TObject);
begin
  inherited;
  WindowState := wsMaximized;
end;

procedure TfrmConsOperRenFix.dblEmissorCloseUp(Sender: TObject;
  LookupTable, FillTable: TDataSet; modified: Boolean);
begin
  inherited;
  if (modified) then
     qryInvestimento.Close;
     if (Trim(dblEmissor.Text) <> '') then
        qryInvestimento.ParamByName('IDEMISSOR').AsString := dblEmissor.LookupValue
     else
        qryInvestimento.ParamByName('IDEMISSOR').Clear;
     qryInvestimento.Open;
end;

procedure TfrmConsOperRenFix.dblEmissorExit(Sender: TObject);
begin
  inherited;
  qryInvestimento.Close;
  if Trim(dblEmissor.Text) <> '' then
     qryInvestimento.ParamByName('IDEMISSOR').AsString := dblEmissor.LookupValue
  else
     qryInvestimento.ParamByName('IDEMISSOR').Clear;
  qryInvestimento.Open;
end;

procedure TfrmConsOperRenFix.dblEmissorChange(Sender: TObject);
begin
  inherited;
  FechaConsulta;
end;

procedure TfrmConsOperRenFix.dblInvestimentoChange(Sender: TObject);
begin
  inherited;
  FechaConsulta;
end;

procedure TfrmConsOperRenFix.dtDataInicioChange(Sender: TObject);
begin
  inherited;
  FechaConsulta;
end;

procedure TfrmConsOperRenFix.dtDataFimChange(Sender: TObject);
begin
  inherited;
  FechaConsulta;
end;

procedure TfrmConsOperRenFix.dblPlanPrevCtbPatrChange(Sender: TObject);
begin
  inherited;
  FechaConsulta;
end;

procedure TfrmConsOperRenFix.mnuMostraVencimentosClick(Sender: TObject);
begin
   inherited;
   // AL_1
   dbgVencimentos.Visible := True;
   splSepVencimentos.Visible := True;
   mnuEscondeVencimentos.Enabled := True;
   mnuMostraVencimentos.Enabled := False;
end;

procedure TfrmConsOperRenFix.mnuEscondeVencimentosClick(Sender: TObject);
begin
   inherited;
   // AL_1
   dbgVencimentos.Visible := False;
   splSepVencimentos.Visible := False;
   mnuEscondeVencimentos.Enabled := False;
   mnuMostraVencimentos.Enabled := True;
end;

end.
