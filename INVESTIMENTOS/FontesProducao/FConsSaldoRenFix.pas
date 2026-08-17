//******************************************************************************
// Data      : 24/01/2008
// Código    : AL_6
// Pendencia : 27146
// SOL       :
// Desc      : Implementação do "Cód.ISIN" do papel
//******************************************************************************
// Data      : 02/08/2007
// Código    : AL_5
// Pendencia : 24957
// SOL       : 56201
// Desc      : Implementacao de Saldo Consolidado por investimento
//******************************************************************************
// Data      : 29/01/2007
// Código    : AL_4
// Pendencia : 23705
// SOL       : 40671
// Desc      : Implementacao de Penhora do Juridico na qryTipoOperacao
//********************************************************************************************************
//Data	    : 23/11/2005
//Código    : AL_3
//Motivo(S) : Ajuste nas qry para captar saldo da sexta feira para títulos que não tenham
//               saldos no fim de semana
//******************************************************************************
//Data	    : 01/06/2005
//Query     :
//Motivo(S) : Implementação de IOF e Valor Líquido
//******************************************************************************
//Data	     : 29/03/2005
//Query     : qryHistorico
//Motivo(S) : Inclusão da Carteira SPC. (DFM)
//********************************************************************************************************
// Data     : 27/09/2004
// Código   : AL_2
// Descrição: Implementacao da combo CbxAplic e DbDtRefAplc
//********************************************************************************************************
// Data     : 10/08/2004
// Código   : AL_1
// Descrição: Ajuste no posicionamento, TabControl e Teclas de atalho dos controles
//********************************************************************************************************
// Data     : 16/04/2004
// Origem   : CM
// Função   : bbtnConfirmarClick
// Linha(s) : 145
// Motivo   : Inclusão do Parâmetro bAbertura
//********************************************************************************************************

unit FConsSaldoRenFix;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  FOkCancelarInv, IvDictio, IvMulti, IvEMulti, MAHlpBtn, StdCtrls, Buttons,
  TB97Tlbr, TB97, fcLabel, ExtCtrls, Db, DBTables, Wwquery, wwdblook,FPreview,
  wwdbdatetimepicker, CMDateTimePicker, Grids, Wwdbigrd, Wwdbgrid;

type
  TfrmConsSaldoRenFix = class(TfrmOkCancelarInv)
    pnlFiltros: TPanel;
    dtDataRef: TCMDateTimePicker;
    dblInvestimento: TwwDBLookupCombo;
    qryInvestimento: TwwQuery;
    Label1: TLabel;
    Label3: TLabel;
    Panel2: TPanel;
    Panel11: TPanel;
    dbgOperacoes: TwwDBGrid;
    Panel3: TPanel;
    Panel4: TPanel;
    dbgItens: TwwDBGrid;
    bbtnImprimir: TBitBtn;
    ToolbarSep972: TToolbarSep97;
    Splitter1: TSplitter;
    qryInvestimentoIDINVESTIMENTO: TFloatField;
    qryInvestimentoDESCINVESTIMENTO: TStringField;
    Label4: TLabel;
    dblEmissor: TwwDBLookupCombo;
    qryEmissor: TwwQuery;
    rdgPosicao: TRadioGroup;
    chkExpandido: TCheckBox;
    qryPlanPrevCtbPatr: TwwQuery;
    dblPlanPrevCtbPatr: TwwDBLookupCombo;
    Label2: TLabel;
    qryPlanPrevCtbPatrIDPLANPREVCTBPATR: TFloatField;
    qryPlanPrevCtbPatrPLANPRVCONTABPATRO: TStringField;
    qryClasseTit: TwwQuery;
    dblkClasseTit: TwwDBLookupCombo;
    lblClasse: TLabel;
    qryClasseTitIDCLASSETIT: TFloatField;
    qryClasseTitDESCCLASSETIT: TStringField;
    CbxAplic: TComboBox;
    lblOpcao: TLabel;
    Label5: TLabel;
    DbDtRefAplc: TCMDateTimePicker;
    cbxPenhora: TCheckBox;
    ChkConsolidado: TCheckBox;
    procedure FormShow(Sender: TObject);
    procedure bbtnConfirmarClick(Sender: TObject);
    procedure bbtnImprimirClick(Sender: TObject);
    procedure bbtnCancelarClick(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure FormCreate(Sender: TObject);
    procedure dblEmissorCloseUp(Sender: TObject; LookupTable,
      FillTable: TDataSet; modified: Boolean);
    procedure rdgPosicaoClick(Sender: TObject);
    procedure dtDataRefChange(Sender: TObject);
    procedure dblInvestimentoCloseUp(Sender: TObject; LookupTable,
      FillTable: TDataSet; modified: Boolean);
    procedure dblEmissorExit(Sender: TObject);
    procedure dblPlanPrevCtbPatrChange(Sender: TObject);
    procedure CbxAplicExit(Sender: TObject);
    procedure ChkConsolidadoClick(Sender: TObject);
  private
    { Private declarations }
    procedure FechaConsulta;
  public
    { Public declarations }
  end;

var
  frmConsSaldoRenFix: TfrmConsSaldoRenFix;

implementation

uses UMensErro, UBibliotecaInvest, FDMRelRenFixSaldo, uOperComum,
     UDiasUteisInv;

{$R *.DFM}

procedure TfrmConsSaldoRenFix.FormShow(Sender: TObject);
begin
   qryInvestimento.Open;
   qryEmissor.Open;
   qryPlanPrevCtbPatr.Open;
   qryClasseTit.Open;
   FechaConsulta;
   inherited;
   dtDataRef.Date := pRPI.DATAULTFECHRF;
   rdgPosicao.ItemIndex := 0;
   //AL_2
   CbxAplic.ItemIndex := 0;
   CbxAplic.Text := 'Todas';
   DbDtRefAplc.Text  := '';
end;

procedure TfrmConsSaldoRenFix.bbtnConfirmarClick(Sender: TObject);
// AL_3
var sDataIni: String;
begin
   inherited;
   if Trim(dtDataRef.Text) = '' then
   begin
      MsgDlg('Falta Data Referência para o Relatório.','Mensagem do Sistema ',mtWarning,[mbOK],0);
      if dtDataRef.CanFocus then
         dtDataRef.SetFocus;
      exit;
   end;

   //AL_5
   If ChkConsolidado.Checked then
   begin
      dblPlanPrevCtbPatr.clear;
      dblEmissor.clear;
      chkExpandido.Checked := False;
      DbDtRefAplc.Text := '';
      CbxAplic.ItemIndex := 0;
   end; // Fim AL_5

   //AL_2
   DmRelRenFixSaldo.qryHistorico.Close;
   DmRelRenFixSaldo.qryItens.Close;
   dbgItens.Refresh;
   //AL_2
   if ((CbxAplic.ItemIndex > 0) And (DbDtRefAplc.Text = '')) Then
       DbDtRefAplc.Text := DateToStr(pRPI.DTMUDACPMF);

   //AL_6 - Ini - Acertos e retirada do With - Mostra ISIN
   OperComum.LimpaParametros(DmRelRenFixSaldo.qryHistorico);
   OperComum.LimpaParametros(DmRelRenFixSaldo.qryItens);
   OperComum.LimpaParametros(DmRelRenFixSaldo.QrySaldoRenFixCons);

   DmRelRenFixSaldo.QrySaldoRenFixCons.Sql.Clear;

   DmRelRenFixSaldo.QrySaldoRenFixCons.Sql.Add('SELECT DESCCLASSETIT,SIGLAEMISSOR,INVESTIMENTO,CODISIN,DATAHISTRENFIX,FLGNEGOCIACAO,'+ #13);
   DmRelRenFixSaldo.QrySaldoRenFixCons.Sql.Add('DESCARTEIRASPC,DATAOPERACAO,VENCOPERACAO,DATAVIGENCIA,'+ #13);
   DmRelRenFixSaldo.QrySaldoRenFixCons.Sql.Add('SUM(SALDOQTDHISTRENFI) AS SALDOQTDHISTRENFI, '+ #13);
   DmRelRenFixSaldo.QrySaldoRenFixCons.Sql.Add('SUM(SALDOVLRHISTRENFI) AS SALDOVLRHISTRENFI, '+ #13);
   DmRelRenFixSaldo.QrySaldoRenFixCons.Sql.Add('SUM(VLRIOF) AS VLRIOF, '+ #13);
   DmRelRenFixSaldo.QrySaldoRenFixCons.Sql.Add('SUM(QTDPENHORA) AS QTDPENHORA,'+ #13);
   DmRelRenFixSaldo.QrySaldoRenFixCons.Sql.Add('SUM(PERCPENHORA) AS PERCPENHORA,' + #13);
   DmRelRenFixSaldo.QrySaldoRenFixCons.Sql.Add('SUM(QTDCARTHIPO) AS QTDCARTHIPO,' + #13);
   DmRelRenFixSaldo.QrySaldoRenFixCons.Sql.Add('SUM(SALDOVLRHISTLIQ) AS SALDOVLRHISTLIQ,' + #13);
   DmRelRenFixSaldo.QrySaldoRenFixCons.Sql.Add('SUM(VLRCARTHIPO) AS VLRCARTHIPO FROM ( ' + #13);
   DmRelRenFixSaldo.QrySaldoRenFixCons.Sql.Add( '' + #13);
   DmRelRenFixSaldo.QrySaldoRenFixCons.Sql.Add(DmRelRenFixSaldo.qryHistorico.Sql.GetText);
   DmRelRenFixSaldo.QrySaldoRenFixCons.Sql.Add( '' + #13);
   DmRelRenFixSaldo.QrySaldoRenFixCons.Sql.Add( ' ) ' + #13);
   DmRelRenFixSaldo.QrySaldoRenFixCons.Sql.Add( ' GROUP BY DESCCLASSETIT,SIGLAEMISSOR,INVESTIMENTO,CODISIN,DATAHISTRENFIX,FLGNEGOCIACAO,DESCARTEIRASPC,DATAOPERACAO,VENCOPERACAO,DATAVIGENCIA' + #13);
   DmRelRenFixSaldo.QrySaldoRenFixCons.Sql.Add( ' ORDER BY DESCCLASSETIT,SIGLAEMISSOR,INVESTIMENTO,CODISIN,DATAHISTRENFIX,FLGNEGOCIACAO,DESCARTEIRASPC,DATAOPERACAO,VENCOPERACAO,DATAVIGENCIA' + #13);

   DmRelRenFixSaldo.QrySaldoRenFixCons.ParamByName('IDPLANPREVCTBPATR').dataType :=  ftInteger;
   if Trim(dblPlanPrevCtbPatr.Text) <> '' then
   begin
      DmRelRenFixSaldo.qryHistorico.ParamByName('IDPLANPREVCTBPATR').AsInteger :=  qryPlanPrevCtbPatrIDPLANPREVCTBPATR.AsInteger;
      DmRelRenFixSaldo.qryItens.ParamByName('IDPLANPREVCTBPATR').AsInteger     :=  qryPlanPrevCtbPatrIDPLANPREVCTBPATR.AsInteger;
   end;

   if Trim(dtDataRef.Text) <> '' then
   begin
      // AL_3
      sDataIni := DateToStr(DiasUteisInv.UltDiaUtilAnterior(dtDataRef.Date,-1,1,'',True,False,False));
      DmRelRenFixSaldo.qryHistorico.ParamByName('DATAINI').AsString        := sDataIni;
      DmRelRenFixSaldo.qryHistorico.ParamByName('DATAHISTRENFIX').AsString := DateToStr(dtDataRef.Date);
      DmRelRenFixSaldo.qryItens.ParamByName('DATAINI').AsString            := sDataIni;
      DmRelRenFixSaldo.qryItens.ParamByName('DATAHISTRENFIX').AsString     := DateToStr(dtDataRef.Date);
      DmRelRenFixSaldo.QrySaldoRenFixCons.ParamByName('DATAINI').AsString        := sDataIni;
      DmRelRenFixSaldo.QrySaldoRenFixCons.ParamByName('DATAHISTRENFIX').AsString := DateToStr(dtDataRef.Date);
   end;

   DmRelRenFixSaldo.QrySaldoRenFixCons.ParamByName('IDINVESTIMENTO').dataType := FtInteger ;
   if Trim(dblInvestimento.Text) <> '' then
   begin
      DmRelRenFixSaldo.qryHistorico.ParamByName('IDINVESTIMENTO').AsInteger := StrToInt(dblInvestimento.LookupValue);
      DmRelRenFixSaldo.qryItens.ParamByName('IDINVESTIMENTO').AsInteger     := StrToInt(dblInvestimento.LookupValue);
      DmRelRenFixSaldo.QrySaldoRenFixCons.ParamByName('IDINVESTIMENTO').AsInteger := StrToInt(dblInvestimento.LookupValue)
   end;

   DmRelRenFixSaldo.QrySaldoRenFixCons.ParamByName('IDEMISSOR').dataType := FtInteger;
   if Trim(dblEmissor.Text) <> '' then
   begin
      DmRelRenFixSaldo.qryHistorico.ParamByName('IDEMISSOR').AsInteger      := StrToInt(dblEmissor.LookupValue);
      DmRelRenFixSaldo.qryItens.ParamByName('IDEMISSOR').AsInteger          := StrToInt(dblEmissor.LookupValue);
   end;

   DmRelRenFixSaldo.QrySaldoRenFixCons.ParamByName('IDCLASSETIT').dataType := FtInteger;
   if Trim(dblkClasseTit.Text) <> '' then
   begin
      DmRelRenFixSaldo.qryHistorico.ParamByName('IDCLASSETIT').AsInteger       := StrToInt(dblkClasseTit.LookupValue);
      DmRelRenFixSaldo.qryItens.ParamByName('IDCLASSETIT').AsInteger           := StrToInt(dblkClasseTit.LookupValue);
      DmRelRenFixSaldo.QrySaldoRenFixCons.ParamByName('IDCLASSETIT').AsInteger := StrToInt(dblkClasseTit.LookupValue)
   end;

   if rdgPosicao.ItemIndex = 0 Then
   begin
      DmRelRenFixSaldo.qryHistorico.ParamByName('ABERTURA').AsInteger := 1;
      DmRelRenFixSaldo.qryItens.ParamByName('ABERTURA').AsInteger := 1;
      DmRelRenFixSaldo.QrySaldoRenFixCons.ParamByName('ABERTURA').AsInteger := 1;
      if ChkConsolidado.Checked then
         DmRelRenFixSaldo.Titulo.Caption := 'Saldos de Renda Fixa (Abertura)- Consolidado por Investimento'
      else
         DmRelRenFixSaldo.rptRenFixSaldoTitulo.Caption := 'Saldos de Renda Fixa (Abertura)';
      lbNomDescricao.Caption := 'Saldos de Renda Fixa (Abertura)';
   end
   else
   begin
      DmRelRenFixSaldo.qryHistorico.ParamByName('ABERTURA').AsInteger := 2;
      DmRelRenFixSaldo.qryItens.ParamByName('ABERTURA').AsInteger := 2;
      DmRelRenFixSaldo.QrySaldoRenFixCons.ParamByName('ABERTURA').AsInteger := 2;
      if ChkConsolidado.Checked then
         DmRelRenFixSaldo.Titulo.Caption := 'Saldos de Renda Fixa (Fechamento)- Consolidado por Investimento'
      else
         DmRelRenFixSaldo.rptRenFixSaldoTitulo.Caption := 'Saldos de Renda Fixa (Fechamento)';
      lbNomDescricao.Caption := 'Saldos de Renda Fixa (Fechamento)';
   end;

   //AL_2
   DmRelRenFixSaldo.QrySaldoRenFixCons.ParamByName('DATAOPERACAO').dataType := FtString;
   DmRelRenFixSaldo.QrySaldoRenFixCons.ParamByName('TIPOMENOR').dataType := FtInteger;
   DmRelRenFixSaldo.QrySaldoRenFixCons.ParamByName('TIPOMAIOR').dataType := FtInteger;
   if Trim(DbDtRefAplc.Text) <> '' then
   begin
      if CbxAplic.ItemIndex = 1 Then
      begin
         DmRelRenFixSaldo.qryHistorico.ParamByName('DATAOPERACAO').AsString := DbDtRefAplc.Text;
         DmRelRenFixSaldo.qryHistorico.ParamByName('TIPOMENOR').AsInteger   := CbxAplic.ItemIndex;
      end
      else if CbxAplic.ItemIndex = 2 then
      begin
         DmRelRenFixSaldo.qryHistorico.ParamByName('DATAOPERACAO').AsString := DbDtRefAplc.Text;
         DmRelRenFixSaldo.qryHistorico.ParamByName('TIPOMAIOR').AsInteger   := CbxAplic.ItemIndex;
      end;
   end;

   //AL_4
   if cbxPenhora.Checked then
   begin
      DmRelRenFixSaldo.qryHistorico.ParamByName('FLGPENHORA').AsString := '1';
      DmRelRenFixSaldo.QrySaldoRenFixCons.ParamByName('FLGPENHORA').AsString := '1';
   end
   else
   begin
      DmRelRenFixSaldo.qryHistorico.ParamByName('FLGPENHORA').AsString := '0';
      DmRelRenFixSaldo.QrySaldoRenFixCons.ParamByName('FLGPENHORA').AsString := '0';
   end;

   DmRelRenFixSaldo.qryHistorico.DisableControls;
   DmRelRenFixSaldo.qryHistorico.Open;
   DmRelRenFixSaldo.qryHistorico.EnableControls;

   DmRelRenFixSaldo.qryItens.Filter := '';
   DmRelRenFixSaldo.qryItens.Filtered := False;
   DmRelRenFixSaldo.qryItens.DisableControls;
   DmRelRenFixSaldo.qryItens.Open;
   DmRelRenFixSaldo.qryItens.EnableControls;
   DmRelRenFixSaldo.qryItens.Filtered := True;

   if not DmRelRenFixSaldo.qryHistorico.IsEmpty then
   begin
      DmRelRenFixSaldo.qryItens.Filter := 'IDHISTRENFIX = ' + DmRelRenFixSaldo.qryHistoricoIDHISTRENFIX.AsString;
      bbtnImprimir.Enabled := True;
   end
   else
   begin
      DmRelRenFixSaldo.qryItens.Filter := 'IDHISTRENFIX = 0';
      bbtnImprimir.Enabled := False
   end;

   if ChkConsolidado.Checked then
   begin
      DmRelRenFixSaldo.ppLabel36.Visible := True;
      DmRelRenFixSaldo.ppLabel36.Caption := 'Saldo em: '+dtDataRef.text;
      DmRelRenFixSaldo.QrySaldoRenFixCons.Open;
   end;
   //AL_6 - Fim
end;

procedure TfrmConsSaldoRenFix.bbtnImprimirClick(Sender: TObject);
Var
 sDataIni : String;
begin
   inherited;
   DmRelRenFixSaldo.qryHistorico.DisableControls;
   DmRelRenFixSaldo.qryItens.DisableControls;
   if chkExpandido.Checked then
      DmRelRenFixSaldo.srptRenFixSaldo.ExpandAll := True
   else
      DmRelRenFixSaldo.srptRenFixSaldo.ExpandAll := False;

   //AL_5
   //AL_6
   if ChkConsolidado.Checked = False then
      TfrmPreview.CreateModalPreview(Application,
                                     DmRelRenFixSaldo.rptRenFixSaldo,
                                     DmRelRenFixSaldo.rptRenFixSaldo.PrinterSetup.DocumentName)
   else
      TfrmPreview.CreateModalPreview(Application,
                                     DmRelRenFixSaldo.rptRenFixSaldoCons,
                                     DmRelRenFixSaldo.rptRenFixSaldoCons.PrinterSetup.DocumentName);
   DmRelRenFixSaldo.qryHistorico.EnableControls;
   DmRelRenFixSaldo.qryItens.EnableControls;
end;

procedure TfrmConsSaldoRenFix.bbtnCancelarClick(Sender: TObject);
begin
   inherited;
   FechaConsulta;
   if dtDataRef.CanFocus then
      dtDataRef.SetFocus;
end;

procedure TfrmConsSaldoRenFix.FormClose(Sender: TObject; var Action: TCloseAction);
begin
   qryInvestimento.Close;
   qryEmissor.Close;
   qryPlanPrevCtbPatr.Close;
   DmRelRenFixSaldo.qryHistorico.Close;
   DmRelRenFixSaldo.qryItens.Close;
   qryClasseTit.Close;
   //AL_5
   DmRelRenFixSaldo.QrySaldoRenFixCons.Close;
   inherited;
end;

procedure TfrmConsSaldoRenFix.FormCreate(Sender: TObject);
begin
  inherited;
  WindowState := wsMaximized;
end;

procedure TfrmConsSaldoRenFix.dblEmissorCloseUp(Sender: TObject; LookupTable,
                                                FillTable: TDataSet; modified: Boolean);
begin
  inherited;
  if (modified) then
     FechaConsulta;
end;

procedure TfrmConsSaldoRenFix.rdgPosicaoClick(Sender: TObject);
begin
   inherited;
   FechaConsulta;
   if rdgPosicao.ItemIndex = 0 Then
      lbNomDescricao.Caption := 'Saldos de Renda Fixa (Abertura)'
   else
      lbNomDescricao.Caption := 'Saldos de Renda Fixa (Fechamento)';
end;

procedure TfrmConsSaldoRenFix.dtDataRefChange(Sender: TObject);
begin
   inherited;
   FechaConsulta;
end;

procedure TfrmConsSaldoRenFix.dblInvestimentoCloseUp(Sender: TObject; LookupTable,
                                                     FillTable: TDataSet; modified: Boolean);
begin
  inherited;
  if (modified) then
     FechaConsulta;
end;

procedure TfrmConsSaldoRenFix.dblEmissorExit(Sender: TObject);
begin
   inherited;
   OperComum.LimpaParametros(qryInvestimento);
   if (Trim(dblEmissor.Text) <> '') then
      qryInvestimento.ParamByName('IDEMISSOR').AsInteger := StrToInt(dblEmissor.LookupValue);
   qryInvestimento.Open;
end;

procedure TfrmConsSaldoRenFix.dblPlanPrevCtbPatrChange(Sender: TObject);
begin
   inherited;
   FechaConsulta;
end;

procedure TfrmConsSaldoRenFix.FechaConsulta;
begin
   OperComum.LimpaParametros(DmRelRenFixSaldo.qryHistorico);
   OperComum.LimpaParametros(DmRelRenFixSaldo.qryItens);
   bbtnImprimir.Enabled := False;
end;

//AL_2
procedure TfrmConsSaldoRenFix.CbxAplicExit(Sender: TObject);
begin
  inherited;
   //AL_2
   If CbxAplic.ItemIndex = 0 then
      DbDtRefAplc.Clear;

   If ((DbDtRefAplc.Text  = '') And (CbxAplic.ItemIndex > 0)) then
       DbDtRefAplc.Text  := DateToStr(pRPI.DTMUDACPMF);
end;

//AL_5
procedure TfrmConsSaldoRenFix.ChkConsolidadoClick(Sender: TObject);
begin
  inherited;
  If ChkConsolidado.Checked then
  begin
     dblPlanPrevCtbPatr.clear;
     dblEmissor.clear;
     chkExpandido.Checked := False;
     DbDtRefAplc.Text := '';
     CbxAplic.ItemIndex := 0;
     //AL_6
     FechaConsulta;
  end;
end;

end.

