//******************************************************************************
// Data      : 14/05/2008
// Código    : AL_6
// Pendencia : 26319
// SOL       : 68708
// Motivo    : Implementação de ajuste na buscar do histórico do Fundo no Procurar.
//              E nas demais query´s.
//******************************************************************************
// Data      : 28/04/2008
// Código    : AL_5
// Pendencia : 26319
// SOL       : 68708
// Motivo    : Implementação para buscar o histórico do Fundo no Procurar.
//******************************************************************************
// Data      : 06/11/2006
// Código    : AL_4
// Pendencia : 22360
// SOL       : 43224
// Motivo    : Implementação da Data no Relatório.
//******************************************************************************
// Data      : 16/01/2006
// Código    : AL_3
// Motivo    : Implementado do PROCURAR na tela
//******************************************************************************
// Data      : 13/01/2006
// Código    : AL_2
// Motivo    : Implementado o filtro por tipo de investimento.
//******************************************************************************
// Data      : 09/11/2004
// Linha     : AL_1
// Motivo    : Filtrar por tipo de investimento
//******************************************************************************

unit FConsCarteiraFundos;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  FOkCancelarInv, StdCtrls, Buttons, wwdbdatetimepicker, CMDateTimePicker,
  IvDictio, IvMulti, IvEMulti, MAHlpBtn, TB97Tlbr, TB97, fcLabel, ExtCtrls,
  Db, DBTables, Wwquery, wwdblook, Wwdatsrc, Grids, Wwdbigrd, Wwdbgrid,
  ComCtrls, ImgList, Gauges, FPreview, TB97Ctls,
  //AL_3
  MontaSelect, 
  //AL_5
  DBClient, MSFMontaSelect;

type
  TFrmConsCarteiraFundos = class(TfrmOkCancelarInv)
    QryAux: TwwQuery;
    QryFundoInvestOperacao: TwwQuery;
    QryFundoInvestOperacaoIDFUNDOINVEST: TFloatField;
    QryFundoInvestOperacaoDESCFUNDOINVEST: TStringField;
    QryFundoInvestOperacaoIDCARTEIRAINVEST: TFloatField;
    QryFundoInvestOperacaoIDTIPOFUNDOINVEST: TFloatField;
    PnlSelecao: TPanel;
    Label3: TLabel;
    dData: TCMDateTimePicker;
    Label4: TLabel;
    DbLkCFundoInvest: TwwDBLookupCombo;
    btImprimir: TBitBtn;
    PgCCarteiras: TPageControl;
    TbOperCompr: TTabSheet;
    TbTitPrivados: TTabSheet;
    TbTitPublicos: TTabSheet;
    TbBolsaBmf: TTabSheet;
    TbSwap: TTabSheet;
    TbDespCorret: TTabSheet;
    TbOutrasContas: TTabSheet;
    dbgBolsaBMF: TwwDBGrid;
    pnlProgresso: TPanel;
    dbgOperCompr: TwwDBGrid;
    dbgTitPrivados: TwwDBGrid;
    dbgTitPublicos: TwwDBGrid;
    dbgSwap: TwwDBGrid;
    dbgDespCorret: TwwDBGrid;
    dbgOutrasContas: TwwDBGrid;
    DbLkCPlanPrevCtbPatr: TwwDBLookupCombo;
    Label6: TLabel;
    ToolbarSep972: TToolbarSep97;
    ImlPadrao: TImageList;
    gauProgresso: TGauge;
    ToolbarSep973: TToolbarSep97;
    bbtnExcluir: TBitBtn;
    QryPatroPlanPrevContab: TwwQuery;
    QryPatroPlanPrevContabIDPLANPREVCTBPATR: TFloatField;
    QryPatroPlanPrevContabIDPLANOPREV: TFloatField;
    QryPatroPlanPrevContabIDPATRO: TFloatField;
    QryPatroPlanPrevContabPLANPRVCONTABPATRO: TStringField;
    updOperCompr: TUpdateSQL;
    QryTitPrivados: TwwQuery;
    QryTitPrivadosIDFDOTITPRIVADOS: TFloatField;
    QryTitPrivadosDESCFUNDOINVEST: TStringField;
    QryTitPrivadosDESCCONTRAPARTE: TStringField;
    QryTitPrivadosCODIGO: TStringField;
    QryTitPrivadosSTAATIVPASS: TStringField;
    QryTitPrivadosDATACOMPRA: TDateTimeField;
    QryTitPrivadosDATAVENCIMENTO: TDateTimeField;
    QryTitPrivadosVLRPRINCIPAL: TFloatField;
    QryTitPrivadosINDEXADOR: TStringField;
    QryTitPrivadosTAXA: TFloatField;
    QryTitPrivadosVLRFINANCEIRO: TFloatField;
    QryTitPrivadosCUPOMTAXA: TFloatField;
    QryTitPrivadosCODSNDDEBENTURE: TStringField;
    QryTitPrivadosQTDDEBENTURES: TFloatField;
    QryTitPrivadosSTAGARANTIA: TStringField;
    QryTitPrivadosDATAOPER: TDateTimeField;
    DsTitPrivados: TwwDataSource;
    updTitPrivados: TUpdateSQL;
    QryTitPublicos: TwwQuery;
    QryTitPublicosIDFDOTITPUBLICOS: TFloatField;
    QryTitPublicosDESCFUNDOINVEST: TStringField;
    QryTitPublicosDESCCONTRAPARTE: TStringField;
    QryTitPublicosCODIGO: TStringField;
    QryTitPublicosSTAATIVPASS: TStringField;
    QryTitPublicosDATAEMISSAO: TDateTimeField;
    QryTitPublicosDATAVENCIMENTO: TDateTimeField;
    QryTitPublicosQUANTIDADE: TFloatField;
    QryTitPublicosTAXA: TFloatField;
    QryTitPublicosINDEXADOR: TStringField;
    QryTitPublicosPUCOMPRA: TFloatField;
    QryTitPublicosPUVENCIMENTO: TFloatField;
    QryTitPublicosVLRFINANCEIRO: TFloatField;
    QryTitPublicosDATACOMPRA: TDateTimeField;
    QryTitPublicosSTAGARANTIA: TStringField;
    QryTitPublicosDATAOPER: TDateTimeField;
    DsTitPublicos: TwwDataSource;
    updTitPublicos: TUpdateSQL;
    QryBolsaBmf: TwwQuery;
    QryBolsaBmfIDFDOCARTACOES: TFloatField;
    QryBolsaBmfDESCFUNDOINVEST: TStringField;
    QryBolsaBmfDESCINVESTIMENTO: TStringField;
    QryBolsaBmfSTAATIVPASS: TStringField;
    QryBolsaBmfQUANTIDADE: TFloatField;
    QryBolsaBmfVLRAJUSTE: TFloatField;
    QryBolsaBmfVLRFINANCEIRO: TFloatField;
    QryBolsaBmfDATAMOV: TDateTimeField;
    DsBolsaBmf: TwwDataSource;
    updBolsaBmf: TUpdateSQL;
    QrySwap: TwwQuery;
    QrySwapIDFDOSWAP: TFloatField;
    QrySwapDESCFUNDOINVEST: TStringField;
    QrySwapDESCCONTRAPARTE: TStringField;
    QrySwapCODIGO: TStringField;
    QrySwapDATACOMPRA: TDateTimeField;
    QrySwapDATAVENCIMENTO: TDateTimeField;
    QrySwapVLRPRINCIPAL: TFloatField;
    QrySwapINDEXADORPASS: TStringField;
    QrySwapTAXAPASSIVO: TFloatField;
    QrySwapVLRFINANCPASS: TFloatField;
    QrySwapINDEXADORATIVO: TStringField;
    QrySwapTAXAATIVO: TFloatField;
    QrySwapVLRFINANCATIVO: TFloatField;
    QrySwapTAXAPASSIVOPRE: TFloatField;
    QrySwapTAXAATIVOPRE: TFloatField;
    QrySwapEMISSOR: TStringField;
    QrySwapSTAGARANTIA: TStringField;
    QrySwapDATAOPER: TDateTimeField;
    DsSwap: TwwDataSource;
    updSwap: TUpdateSQL;
    QryDespCorret: TwwQuery;
    QryDespCorretIDFDODESPCORRET: TFloatField;
    QryDespCorretDESCFUNDOINVEST: TStringField;
    QryDespCorretDESCCORRETORA: TStringField;
    QryDespCorretTIPOCORRETORA: TStringField;
    QryDespCorretCNPJCORRETORA: TStringField;
    QryDespCorretNUMOPERACAO: TFloatField;
    QryDespCorretVLRTABBOVESPA: TFloatField;
    QryDespCorretVLRDEVBOVESPA: TFloatField;
    QryDespCorretVLREFEPGBOVESPA: TFloatField;
    QryDespCorretVLRTABBMF: TFloatField;
    QryDespCorretVLRDEVBMF: TFloatField;
    QryDespCorretVLREFEPGBMF: TFloatField;
    QryDespCorretVLRTABBOLSA: TFloatField;
    QryDespCorretVLRDEVBOLSA: TFloatField;
    QryDespCorretVLREFEPGBOLSA: TFloatField;
    DsDespCorret: TwwDataSource;
    updDespCorret: TUpdateSQL;
    QryOutrasContas: TwwQuery;
    QryOutrasContasDESCFUNDOINVEST: TStringField;
    QryOutrasContasDESCOUTRASCONTAS: TStringField;
    QryOutrasContasVLRCONTAS: TFloatField;
    QryOutrasContasIDFDOOUTRASCONTAS: TFloatField;
    DsOutrasContas: TwwDataSource;
    updOutrasContas: TUpdateSQL;
    QryOperCompr: TwwQuery;
    DsOperCompr: TwwDataSource;
    QryOperComprIDFDOOPERCOMPR: TFloatField;
    QryOperComprDESCFUNDOINVEST: TStringField;
    QryOperComprDESCCONTRAPARTE: TStringField;
    QryOperComprLASTRO: TStringField;
    QryOperComprDATAOPER: TDateTimeField;
    QryOperComprDATAEMISSAO: TDateTimeField;
    QryOperComprDATAVENCIMENTO: TDateTimeField;
    QryOperComprSTAATIVPASS: TStringField;
    QryOperComprQUANTIDADE: TFloatField;
    QryOperComprTAXA: TFloatField;
    QryOperComprINDEXADOR: TStringField;
    QryOperComprPUCOMPRA: TFloatField;
    QryOperComprPUVENCIMENTO: TFloatField;
    QryOperComprVLRFINANCEIRO: TFloatField;
    QryOperComprDESCCTRPAROPER: TStringField;
    QryOperComprINDEXADORCTRPAR: TStringField;
    QryOperComprPERCTRPAROPER: TFloatField;
    QryOperComprTAXACTRPAROPER: TFloatField;
    QryOperComprDATARELOPER: TDateTimeField;
    QryOperComprDATAREVEROPER: TDateTimeField;
    Dock972: TDock97;
    Toolbar971: TToolbar97;
    sbtnProcurar: TToolbarButton97;
    MontaSelect: TMontaSelect;
    procedure FormShow(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure FormActivate(Sender: TObject);
    procedure AbreQry;
    procedure FechaQry;
    procedure bbtnConfirmarClick(Sender: TObject);
    procedure bbtnCancelarClick(Sender: TObject);
    procedure DbLkCFundoInvestCloseUp(Sender: TObject; LookupTable,
      FillTable: TDataSet; modified: Boolean);
    procedure btImprimirClick(Sender: TObject);
    procedure bbtnExcluirClick(Sender: TObject);
    procedure DbLkCPlanPrevCtbPatrCloseUp(Sender: TObject; LookupTable,
      FillTable: TDataSet; modified: Boolean);
    procedure DbLkCPlanPrevCtbPatrExit(Sender: TObject);
    procedure DbLkCFundoInvestExit(Sender: TObject);
    procedure dDataExit(Sender: TObject);
    procedure sbtnProcurarClick(Sender: TObject);
  private
    { Private declarations }
    ExcelApp, Sheet:Variant;    
    //AL_5        
    function sSubQueryFUN : String;

  public
    { Public declarations }
  end;

var
  FrmConsCarteiraFundos: TFrmConsCarteiraFundos;

implementation

uses UBibliotecaInvest, DBaseDados, ComObj, UDataBase, UMensErro, FDmRelCarteiraFundos,
     UOperComum;

{$R *.DFM}

procedure TFrmConsCarteiraFundos.FormShow(Sender: TObject);
begin
  inherited;
  //AL_5
  MontaSelect.Filtro.Add(sSubQueryFUN);

  dData.Date := Date;
  
  QryFundoInvestOperacao.ParamByName('DATAOPERACAO').AsString := DateToStr(Date);
  // Al_1
  QryFundoInvestOperacao.ParamByName('IDTIPOINVEST').AsInteger := iTipoInvestUsu;
  QryFundoInvestOperacao.Open;

  QryPatroPlanPrevContab.Open;

  FechaQry;
end;

procedure TFrmConsCarteiraFundos.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
  inherited;
  QryFundoInvestOperacao.Close;
  QryPatroPlanPrevContab.Close;
end;

procedure TFrmConsCarteiraFundos.FormActivate(Sender: TObject);
begin
  inherited;
  PnlFundo.Enabled := True;
  WindowState      := wsMaximized;
end;

procedure TfrmConsCarteiraFundos.AbreQry;
var sData: String;
begin
   sData := dData.Text;
   gauProgresso.MinValue := 0;
   gauProgresso.MaxValue := 0;

   OperComum.LimpaParametros(QryOperCompr);
   if Vazio(DbLkCPlanPrevCtbPatr.Text) then
      QryOperCompr.ParamByName('IDPLANPREVCTBPATR').AsInteger := iPlanPrevCtbPatro
   else
      QryOperCompr.ParamByName('IDPLANPREVCTBPATR').AsInteger := StrToInt(DbLkCPlanPrevCtbPatr.LookupValue);
   if not Vazio(DbLkCFundoInvest.Text) then
      QryOperCompr.ParamByName('IDFUNDOINVEST').AsInteger  :=
                   QryFundoInvestOperacao.FieldByName('IDFUNDOINVEST').AsInteger;
   QryOperCompr.ParamByName('DATA').AsString := sData;
   //Al_2
   QryOperCompr.ParamByName('IDTIPOINVEST').AsInteger  := iTipoInvestUsu;
   QryOperCompr.Open;
   gauProgresso.MaxValue := gauProgresso.MaxValue + QryOperCompr.RecordCount;

   //AL_4
   OperComum.LimpaParametros(QryTitPrivados);
   if Vazio(DbLkCPlanPrevCtbPatr.Text) then
      QryTitPrivados.ParamByName('IDPLANPREVCTBPATR').AsInteger := iPlanPrevCtbPatro
   else
      QryTitPrivados.ParamByName('IDPLANPREVCTBPATR').AsInteger := StrToInt(DbLkCPlanPrevCtbPatr.LookupValue);
   if not Vazio(DbLkCFundoInvest.Text) then
      QryTitPrivados.ParamByName('IDFUNDOINVEST').AsInteger     :=
                   QryFundoInvestOperacao.FieldByName('IDFUNDOINVEST').AsInteger;
   QryTitPrivados.ParamByName('DATA').AsString := sData;
   //Al_2
   QryTitPrivados.ParamByName('IDTIPOINVEST').AsInteger  := iTipoInvestUsu;
   QryTitPrivados.Open;
   gauProgresso.MaxValue := gauProgresso.MaxValue + QryTitPrivados.RecordCount;

   //AL_4

   OperComum.LimpaParametros(QryTitPublicos);
   if Vazio(DbLkCPlanPrevCtbPatr.Text) then
      QryTitPublicos.ParamByName('IDPLANPREVCTBPATR').AsInteger := iPlanPrevCtbPatro
   else
      QryTitPublicos.ParamByName('IDPLANPREVCTBPATR').AsInteger := StrToInt(DbLkCPlanPrevCtbPatr.LookupValue);
   if not Vazio(DbLkCFundoInvest.Text) then
      QryTitPublicos.ParamByName('IDFUNDOINVEST').AsInteger     :=
                   QryFundoInvestOperacao.FieldByName('IDFUNDOINVEST').AsInteger;
   QryTitPublicos.ParamByName('DATA').AsString := sData;
   //Al_2
   QryTitPublicos.ParamByName('IDTIPOINVEST').AsInteger  := iTipoInvestUsu;
   QryTitPublicos.Open;
   gauProgresso.MaxValue := gauProgresso.MaxValue + QryTitPublicos.RecordCount;

   //AL_4

   OperComum.LimpaParametros(QryBolsaBmf);
   if Vazio(DbLkCPlanPrevCtbPatr.Text) then
      QryBolsaBmf.ParamByName('IDPLANPREVCTBPATR').AsInteger := iPlanPrevCtbPatro
   else
      QryBolsaBmf.ParamByName('IDPLANPREVCTBPATR').AsInteger := StrToInt(DbLkCPlanPrevCtbPatr.LookupValue);
   if not Vazio(DbLkCFundoInvest.Text) then
      QryBolsaBmf.ParamByName('IDFUNDOINVEST').AsInteger     :=
                   QryFundoInvestOperacao.FieldByName('IDFUNDOINVEST').AsInteger;
   QryBolsaBmf.ParamByName('DATA').AsString := sData;
   //Al_2
   QryBolsaBmf.ParamByName('IDTIPOINVEST').AsInteger  := iTipoInvestUsu;
   QryBolsaBmf.Open;
   gauProgresso.MaxValue := gauProgresso.MaxValue + QryBolsaBmf.RecordCount;

   //AL_4

   OperComum.LimpaParametros(QrySwap);
   if Vazio(DbLkCPlanPrevCtbPatr.Text) then
      QrySwap.ParamByName('IDPLANPREVCTBPATR').AsInteger := iPlanPrevCtbPatro
   else
      QrySwap.ParamByName('IDPLANPREVCTBPATR').AsInteger := StrToInt(DbLkCPlanPrevCtbPatr.LookupValue);
   if not Vazio(DbLkCFundoInvest.Text) then
      QrySwap.ParamByName('IDFUNDOINVEST').AsInteger     :=
                   QryFundoInvestOperacao.FieldByName('IDFUNDOINVEST').AsInteger;
   QrySwap.ParamByName('DATA').AsString := sData;
   //Al_2
   QrySwap.ParamByName('IDTIPOINVEST').AsInteger  := iTipoInvestUsu;
   QrySwap.Open;
   gauProgresso.MaxValue := gauProgresso.MaxValue + QrySwap.RecordCount;

   //AL_4

   OperComum.LimpaParametros(QryDespCorret);
   if Vazio(DbLkCPlanPrevCtbPatr.Text) then
      QryDespCorret.ParamByName('IDPLANPREVCTBPATR').AsInteger := iPlanPrevCtbPatro
   else
      QryDespCorret.ParamByName('IDPLANPREVCTBPATR').AsInteger := StrToInt(DbLkCPlanPrevCtbPatr.LookupValue);
   if not Vazio(DbLkCFundoInvest.Text) then
      QryDespCorret.ParamByName('IDFUNDOINVEST').AsInteger     :=
                   QryFundoInvestOperacao.FieldByName('IDFUNDOINVEST').AsInteger;
   QryDespCorret.ParamByName('DATA').AsString := sData;
   //Al_2
   QryDespCorret.ParamByName('IDTIPOINVEST').AsInteger  := iTipoInvestUsu;
   QryDespCorret.Open;
   gauProgresso.MaxValue := gauProgresso.MaxValue + QryDespCorret.RecordCount;

   //AL_4

   OperComum.LimpaParametros(QryOutrasContas);
   if Vazio(DbLkCPlanPrevCtbPatr.Text) then
      QryOutrasContas.ParamByName('IDPLANPREVCTBPATR').AsInteger := iPlanPrevCtbPatro
   else
      QryOutrasContas.ParamByName('IDPLANPREVCTBPATR').AsInteger := StrToInt(DbLkCPlanPrevCtbPatr.LookupValue);
   if not Vazio(DbLkCFundoInvest.Text) then
      QryOutrasContas.ParamByName('IDFUNDOINVEST').AsInteger     :=
                   QryFundoInvestOperacao.FieldByName('IDFUNDOINVEST').AsInteger;
   QryOutrasContas.ParamByName('DATA').AsString := sData;
   //Al_2
   QryOutrasContas.ParamByName('IDTIPOINVEST').AsInteger  := iTipoInvestUsu;
   QryOutrasContas.Open;
   gauProgresso.MaxValue := gauProgresso.MaxValue + QryOutrasContas.RecordCount;

   //AL_4

    with DmRelCarteiraFundos do
    begin
     // Abre queries do Relatório
      Opercomum.LimpaParametros(qryCarteiraFundo);
      qryCarteiraFundo.Close;
      if Vazio(DbLkCPlanPrevCtbPatr.Text) then
         qryCarteiraFundo.ParamByName('IDPLANPREVCTBPATR').AsInteger := iPlanPrevCtbPatro
      else
         qryCarteiraFundo.ParamByName('IDPLANPREVCTBPATR').AsInteger := StrToInt(DbLkCPlanPrevCtbPatr.LookupValue);
      if not Vazio(DbLkCFundoInvest.Text) then
         qryCarteiraFundo.ParamByName('IDFUNDOINVEST').AsInteger     :=
                      QryFundoInvestOperacao.FieldByName('IDFUNDOINVEST').AsInteger;
      qryCarteiraFundo.ParamByName('DATA').AsString := sData;
      //Al_2
      qryCarteiraFundo.ParamByName('IDTIPOINVEST').AsInteger  := iTipoInvestUsu;
      qryCarteiraFundo.Open;

      qryCarteiraFundoDet.Filter    := '';
      Opercomum.LimpaParametros(qryCarteiraFundoDet);
      if Vazio(DbLkCPlanPrevCtbPatr.Text) then
         qryCarteiraFundoDet.ParamByName('IDPLANPREVCTBPATR').AsInteger := iPlanPrevCtbPatro
      else
         qryCarteiraFundoDet.ParamByName('IDPLANPREVCTBPATR').AsInteger := StrToInt(DbLkCPlanPrevCtbPatr.LookupValue);
      if not Vazio(DbLkCFundoInvest.Text) then
         qryCarteiraFundoDet.ParamByName('IDFUNDOINVEST').AsInteger     :=
                      QryFundoInvestOperacao.FieldByName('IDFUNDOINVEST').AsInteger;
      qryCarteiraFundoDet.ParamByName('DATA').AsString := sData;
      //Al_2
      qryCarteiraFundoDet.ParamByName('IDTIPOINVEST').AsInteger  := iTipoInvestUsu;
      qryCarteiraFundoDet.Open;

      if qryCarteiraFundoDet.IsEmpty then
      begin
         btImprimir.Enabled := False;
         bbtnExcluir.Enabled := False;
      end else begin
         btImprimir.Enabled := True;
         bbtnExcluir.Enabled := True;
      end;

   end;
end;

procedure TFrmConsCarteiraFundos.FechaQry;
begin
   OperComum.LimpaParametros(QryOperCompr);

   OperComum.LimpaParametros(QryTitPrivados);

   OperComum.LimpaParametros(QryTitPublicos);

   OperComum.LimpaParametros(QryBolsaBmf);

   OperComum.LimpaParametros(QrySwap);

   OperComum.LimpaParametros(QryDespCorret);

   OperComum.LimpaParametros(QryOutrasContas);

   Opercomum.LimpaParametros(DmRelCarteiraFundos.qryCarteiraFundo);
   Opercomum.LimpaParametros(DmRelCarteiraFundos.qryCarteiraFundoDet);

   btImprimir.Enabled  := False;
   bbtnExcluir.Enabled := False;

   //AL_4
   PgCCarteiras.ActivePage := TbOutrasContas;
end;

procedure TFrmConsCarteiraFundos.bbtnConfirmarClick(Sender: TObject);
begin
   inherited;
   if (Trim(dData.Text) = '') then
   begin
      MsgDlg('Data não selecionada.','Mensagem do Sistema ',mtWarning,[mbOK],0);
      if dData.CanFocus then
         dData.SetFocus;
      Exit;
   end;
   //AL_4
   if Trim(DbLkCPlanPrevCtbPatr.Text) = '' then
   begin
      MsgDlg('Plano / Patrocinadora não selecionado.','Mensagem do Sistema ',mtWarning,[mbOK],0);
      if DbLkCPlanPrevCtbPatr.CanFocus then
         DbLkCPlanPrevCtbPatr.SetFocus;
      Exit;
   end;
   AbreQry;
end;

procedure TFrmConsCarteiraFundos.bbtnCancelarClick(Sender: TObject);
begin
   inherited;
   FechaQry;
end;


procedure TFrmConsCarteiraFundos.DbLkCFundoInvestCloseUp(Sender: TObject;
  LookupTable, FillTable: TDataSet; modified: Boolean);
begin
   inherited;
   if modified then FechaQry;
end;

procedure TFrmConsCarteiraFundos.btImprimirClick(Sender: TObject);
begin
   inherited;
   //AL_4
   DmRelCarteiraFundos.pplData.Text := dData.Text;

   TfrmPreview.CreateModalPreview(Application,
                                  DmRelCarteiraFundos.rptCarteiraFundos,
                                  DmRelCarteiraFundos.rptCarteiraFundos.PrinterSetup.DocumentName);
end;

procedure TFrmConsCarteiraFundos.bbtnExcluirClick(Sender: TObject);
begin
  if MsgDlg('Confirma Exclusão ?','Mensagem ',mtInformation,
            [mbYes, mbNo],0) = mrYes  Then
  begin
     inherited;
     gauProgresso.Progress := 0;
     gauProgresso.ShowText := True;
     with DmRelCarteiraFundos do
     begin
        try     // Finally
           try  // Except
              if not dtmBaseDados.dbBaseDados.InTransaction then
                 dtmBaseDados.dbBaseDados.StartTransaction;

              // Exclui Operações Compromissadas
              PgCCarteiras.ActivePage := TbOperCompr;
              QryOperCompr.First;
              while not QryOperCompr.Eof do
              begin
                 QryOperCompr.Delete;
                 gauProgresso.Progress := gauProgresso.Progress + 1;
              end;

              // Exclui Titulos Privados
              PgCCarteiras.ActivePage := TbTitPrivados;
              QryTitPrivados.First;
              while not QryTitPrivados.Eof do
              begin
                 QryTitPrivados.Delete;
                 gauProgresso.Progress := gauProgresso.Progress + 1;
              end;

              // Exclui Titulos Públicos
              PgCCarteiras.ActivePage := TbTitPublicos;
              QryTitPublicos.First;
              while not QryTitPublicos.Eof do
              begin
                 QryTitPublicos.Delete;
                 gauProgresso.Progress := gauProgresso.Progress + 1;
              end;

              // Exclui Bolsas/BM&F
              PgCCarteiras.ActivePage := TbBolsaBmf;
              QryBolsaBmf.First;
              while not QryBolsaBmf.Eof do
              begin
                 QryBolsaBmf.Delete;
                 gauProgresso.Progress := gauProgresso.Progress + 1;
              end;

              // Exclui Swap
              PgCCarteiras.ActivePage := TbSwap;
              QrySwap.First;
              while not QrySwap.Eof do
              begin
                 QrySwap.Delete;
                 gauProgresso.Progress := gauProgresso.Progress + 1;
              end;

              // Exclui Despesas com Corretagem
              PgCCarteiras.ActivePage := TbDespCorret;
              QryDespCorret.First;
              while not QryDespCorret.Eof do
              begin
                 QryDespCorret.Delete;
                 gauProgresso.Progress := gauProgresso.Progress + 1;
              end;

              // Exclui Outras Contas
              PgCCarteiras.ActivePage := TbOutrasContas;
              QryOutrasContas.First;
              while not QryOutrasContas.Eof do
              begin
                 QryOutrasContas.Delete;
                 gauProgresso.Progress := gauProgresso.Progress + 1;
              end;

              QryOperCompr.ApplyUpdates;
              QryTitPrivados.ApplyUpdates;
              QryTitPublicos.ApplyUpdates;
              QryBolsaBmf.ApplyUpdates;
              QrySwap.ApplyUpdates;
              QryDespCorret.ApplyUpdates;
              QryOutrasContas.ApplyUpdates;

              dtmBaseDados.dbBaseDados.Commit;
              MsgDlg('Exclusão Efetuada com Sucesso.','Mensagem do Sistema ',mtInformation,[mbOK],0);
              FechaQry;
              dData.SetFocus;
           except on E: Exception do
              begin
                 dtmBaseDados.dbBaseDados.Rollback;
                 MsgDlg('Ocorreu um problema na Exclusão.' + #13 + E.Message,
                        'Mensagem do Sistema ',mtError,[mbOK],0);
                 AbreQry;
              end;
           end;
        finally
           QryOperCompr.CommitUpdates;
           QryTitPrivados.CommitUpdates;
           QryTitPublicos.CommitUpdates;
           QryBolsaBmf.CommitUpdates;
           QrySwap.CommitUpdates;
           QryDespCorret.CommitUpdates;
           QryOutrasContas.CommitUpdates;
           gauProgresso.Progress := 0;
           gauProgresso.ShowText := False;
        end;
     end;
  end;
end;

procedure TFrmConsCarteiraFundos.DbLkCPlanPrevCtbPatrCloseUp(
  Sender: TObject; LookupTable, FillTable: TDataSet; modified: Boolean);
begin
   inherited;
   if modified then
      FechaQry;
end;

procedure TFrmConsCarteiraFundos.DbLkCPlanPrevCtbPatrExit(Sender: TObject);
begin
  inherited;
  if Vazio(DbLkCPlanPrevCtbPatr.Text) then
     FechaQry;
end;

procedure TFrmConsCarteiraFundos.DbLkCFundoInvestExit(Sender: TObject);
begin
   inherited;
   if Vazio(DbLkCFundoInvest.Text) then
      FechaQry;
end;

procedure TFrmConsCarteiraFundos.dDataExit(Sender: TObject);
begin
  inherited;
  OperComum.LimpaParametros(QryFundoInvestOperacao);
  //Alteração realizada em 28/04/2008
  QryFundoInvestOperacao.ParamByName('DATAOPERACAO').AsString := dData.text; //DateToStr(Date);
  QryFundoInvestOperacao.ParamByName('IDTIPOINVEST').AsInteger := iTipoInvestUsu;
  QryFundoInvestOperacao.Open;

  FechaQry;
end;

//AL_3
procedure TFrmConsCarteiraFundos.sbtnProcurarClick(Sender: TObject);
begin
  inherited;
  
  MontaSelect.Executar;

  if MontaSelect.RetornouValor then
  begin
     dData.Text := montaSelect.ValoresChave[2];

     if DbLkCPlanPrevCtbPatr.CanFocus then
        DbLkCPlanPrevCtbPatr.SetFocus;

     DbLkCPlanPrevCtbPatr.LookupValue := montaSelect.ValoresChave[1];
     DbLkCPlanPrevCtbPatr.PerFormSearch;

     if DbLkCFundoInvest.CanFocus then
        DbLkCFundoInvest.SetFocus;

     DbLkCFundoInvest.LookupValue     := montaSelect.ValoresChave[0];
     DbLkCFundoInvest.PerFormSearch;

     if bbtnConfirmar.CanFocus then
        bbtnConfirmar.SetFocus;

     AbreQry;
  end;
end;

//AL_5
function TFrmConsCarteiraFundos.sSubQueryFUN : String;
begin
  //AL_6
  Result := '(HISTFUNDOINVEST.IDFUNDOINVEST || TO_CHAR(HISTFUNDOINVEST.DTAVIGENCIA,''DD/MM/YYYY, HH24:MI:SS'') IN '+
            '(SELECT FND.IDFUNDOINVEST || TO_CHAR(MAX(FND.DTAVIGENCIA),''DD/MM/YYYY, HH24:MI:SS'') '+
            ' FROM HISTFUNDOINVEST FND, TIPOFUNDOINVEST TFI '+
            ' WHERE (TFI.IDTIPOINVEST      = '+IntToStr(iTipoInvestUsu)+') '+
            ' AND   (FND.IDTIPOFUNDOINVEST = TFI.IDTIPOFUNDOINVEST) '+
            ' AND   (FND.DTAVIGENCIA      <= MOVIMENTO.DATA) '+
            ' AND   (FND.IDFUNDOINVEST     = MOVIMENTO.IDFUNDOINVEST) '+
            ' GROUP BY FND.IDFUNDOINVEST)) ';
end;

end.


