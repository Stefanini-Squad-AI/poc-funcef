//******************************************************************************
// Data      : 08/05/2007
// Codigo    : AL_5
// Pendência : 25297
// Motivo    : Implementação da Permissão do Uso da Carteira Gerencial em
//             virtude do parâmetro do sistema Utiliza carteira/Data
//******************************************************************************
// Data      : 31/08/2006
// Codigo    : AL_4
// Motivo    :  Implementação do plano/patrocinador
// ******************************************************************************
// Data      : 07/06/2005
// Código    : Al_3
// Motivo    : Implementação da "DATAOPERACAO"  nas query´s qryDetVlPagRec e qryDetVlPagRec2 e
//             passagem de valor no parametro "VARGROUP"
// ******************************************************************************
// Data      : 12/04/2005
// Motivo    : Alterações em todas as Querys para unificar o SQL em uma query só do DmRelCarteiraGerenc.
// Código:   : AL_2
// ******************************************************************************
// Data      : 03/03/2005
// Motivo    : Retirada a proporção da despesas devido a uma boleta operando com duas carteiras gerenciais
// Código    : QryValoresPagarReceber
// ******************************************************************************
// Data      : 28/02/2005
// Motivo    : Implementação do tratamento PARA AS OPERAÇÕES QUE SE ENCONTRAM NA PASTA OUTROS
//             DA OPERAÇÃO GERENCIAL
// Código    : qryHistCaixa
// ******************************************************************************
// Data      : 21/02/2005
// Motivo    : Retirada a implementação do tratamento da provisao da subscrição por
//             anuncio de proventos, no momento da baixa de compensação
// Código    : QryValoresPagarReceber
// ******************************************************************************
// Data      : 17/02/2005
// Motivo    : Implementação do tratamento da provisao da subscrição por anuncio de proventos,
//             no momento da baixa de compensação
// Código    : QryValoresPagarReceber
// ******************************************************************************
// Data      : 06/01/2005
// Motivo    : Implementação da busca dos Anúncios vencidos e não recebidos
// Código:   : QryValoresPagarReceber
// ******************************************************************************
// Data      : 20/12/2004
// Motivo    : Implementação DA VERIFICAÇÃO DO VALOR PARA AS DESPESAS
// Código:   : qryHistCaixa
// ******************************************************************************
// Data      : 10/11/2004
// Motivo    : Implementação da Ficha do Analítico referênte da VALORES A PAGAR/RECEBER.
// Código:   : AL_1
//******************************************************************************
// Data      : 10/11/2004
// Motivo    : * Identação do SQL da query QryValoresPagarReceber
//             * Alteração da query QryValoresPagarReceber -
//               Acerto no Rateio das Carteiras Gerenciais pelo Valor e não pela Qtde
// ******************************************************************************
// Data      : 04/10/2004
// Motivo    : Implementação da busca das despesas pela proprorção ,QryValoresPagarReceber
// ******************************************************************************
// Data      : 24/05/2004
// Motivo    : Inclusao do campo DATAMOVCARTINV na qryRendaVariavel e no GRId
// ******************************************************************************
// Data	    : 29/04/2004
// Origem	 : FUNCEF
// Função	 : QryValoresPagarReceber
// Motivo(S)     : Ajustes
// ******************************************************************************
// Data	    : 05/04/2004
// Origem	 : FUNCEF
// Função	 : QryValoresPagarReceber
// Motivo(S) : Erro, antecipação de recebimento de Direitos não era
//                       tratado e o mesmo continuava aparecendo na consulta
//                       Valores a Pagar/Receber.
// ******************************************************************************

unit FConsCartGerenc;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  FOkCancelarInv, IvDictio, IvMulti, IvEMulti, MAHlpBtn, StdCtrls, Buttons,
  TB97Tlbr, TB97, fcLabel, ExtCtrls, ComCtrls, Db, DBTables, Wwquery, FPreview,
  wwdblook, wwdbdatetimepicker, CMDateTimePicker, Grids, Wwdbigrd, Wwdbgrid,
  Wwdatsrc, Gauges, ppDB, ppComm, ppRelatv, ppDBPipe, ppDBBDE, Menus, Mask,
  wwdbedit, TREdit, URegra, mxDB, mxstore, mxtables, TeEngine, Series,
  TeeProcs, Chart, mxgraph;

type
  TfrmConsCartGerenc = class(TfrmOkCancelarInv)
    PnlSelecao: TPanel;
    Label3: TLabel;
    Label4: TLabel;
    dData: TCMDateTimePicker;
    dblCarteira: TwwDBLookupCombo;
    qryCarteira: TwwQuery;
    pgcMercados: TPageControl;
    qryCarteiraIDCARTEIRAINVEST: TFloatField;
    qryCarteiraIDCARTEIRAGERENC: TFloatField;
    qryCarteiraDESCCARTGERENC: TStringField;
    tbsRendaVariavel: TTabSheet;
    dbgRendaVariavel: TwwDBGrid;
    btImprimir: TBitBtn;
    ToolbarSep972: TToolbarSep97;
    tbsCaixaCota: TTabSheet;
    dbgValoresPagarReceber: TwwDBGrid;
    qryRendaVariavel: TwwQuery;
    dsRendaVariavel: TwwDataSource;
    pmnuRendaVariavel: TPopupMenu;
    RVFixarColuna: TMenuItem;
    RVLiberarColuna: TMenuItem;
    N1: TMenuItem;
    RVLiberaTodasColunas: TMenuItem;
    MenuItem3: TMenuItem;
    pmnuCaixaCota: TPopupMenu;
    CCFixarColuna: TMenuItem;
    CCLiberarColuna: TMenuItem;
    MenuItem7: TMenuItem;
    CCLiberaTodasColunas: TMenuItem;
    tbsResumo: TTabSheet;
    pnlQuantCotas: TPanel;
    fcLabel2: TfcLabel;
    pnlValCota: TPanel;
    fcLabel3: TfcLabel;
    pnlPatrimonio: TPanel;
    fcLabel4: TfcLabel;
    pnlRentabilidade: TPanel;
    redPatrimonio: TRealEdit;
    redQtdCotas: TRealEdit;
    redValCota: TRealEdit;
    qryRegra1: TwwQuery;
    qryRegra1NOMEREGRA: TStringField;
    qryRegra1IDREGRA: TFloatField;
    qryRegra2: TwwQuery;
    qryAux: TwwQuery;
    regRentabilidade: TRegra;
    qryRegra2IDREGRA: TFloatField;
    qryRegra2NOMEREGRA: TStringField;
    tbsHistCaixa: TTabSheet;
    dbgCaixa: TwwDBGrid;
    dsHistCaixa: TwwDataSource;
    qryHistCaixa: TwwQuery;
    pnlTotal: TPanel;
    dbrSaldoAtu: TDBRealEdit;
    fcLabel6: TfcLabel;
    QryValoresPagarReceber: TwwQuery;
    DsValoresPagarReceber: TwwDataSource;
    Panel1: TPanel;
    fcLabel7: TfcLabel;
    fcLabel10: TfcLabel;
    fcLabel11: TfcLabel;
    fcLabel12: TfcLabel;
    Panel2: TPanel;
    edtInd1Mes: TRealEdit;
    edtInd1Ano: TRealEdit;
    edtVarMes: TwwDBEdit;
    edtVarAno: TwwDBEdit;
    dblRegra1: TwwDBLookupCombo;
    dblRegra2: TwwDBLookupCombo;
    edtInd2Mes: TRealEdit;
    edtInd2Ano: TRealEdit;
    btnCalcRegra1: TBitBtn;
    btnCalcRegra2: TBitBtn;
    edtVarDia: TwwDBEdit;
    Panel3: TPanel;
    fcLabel1: TfcLabel;
    DBRealEdit1: TDBRealEdit;
    QryUltDataMov: TwwQuery;
    tbsDetPagRec: TTabSheet;
    dbgDetValoresPagarReceber: TwwDBGrid;
    qryDetVlPagRec: TwwQuery;
    dsDetVlPagRec: TwwDataSource;
    qryDetVlPagRecNUMDOCUMENTO: TStringField;
    qryDetVlPagRecDESCINVESTIMENTO: TStringField;
    qryDetVlPagRecRATEIO: TFloatField;
    qryDetVlPagRecQTDE: TFloatField;
    qryDetVlPagRecPRECO: TFloatField;
    qryDetVlPagRecTOTDESP: TFloatField;
    qryDetVlPagRecTOTQTD: TFloatField;
    dbgDetValoresPagarReceber2: TwwDBGrid;
    qryDetVlPagRec2: TwwQuery;
    StringField1: TStringField;
    StringField2: TStringField;
    FloatField1: TFloatField;
    FloatField2: TFloatField;
    dsDetVlPagRec2: TwwDataSource;
    qryDetVlPagRec2VLROPERACAO: TFloatField;
    qryHistCaixaTIPOREL: TFloatField;
    qryHistCaixaCODISIN: TStringField;
    qryHistCaixaINVESTIMENTO: TStringField;
    qryHistCaixaDATAOPER: TDateTimeField;
    qryHistCaixaVALOR: TFloatField;
    qryHistCaixaSALDO: TFloatField;
    qryHistCaixaQUANTIDADE: TFloatField;
    qryHistCaixaCOTACAO: TFloatField;
    qryHistCaixaDATAMOVCARTINV: TDateTimeField;
    qryHistCaixaLOTE: TFloatField;
    qryHistCaixaIDCARTEIRAINVEST: TFloatField;
    qryHistCaixaIDINVESTIMENTO: TFloatField;
    qryHistCaixaIDLOTE: TStringField;
    qryHistCaixaOPERACAO: TStringField;
    qryHistCaixaVENCIMENTO: TDateTimeField;
    qryHistCaixaCORRETORA: TStringField;
    qryHistCaixaIDEVENTOCAIXACOTA: TFloatField;
    qryHistCaixaCARTEIRA: TStringField;
    qryHistCaixaIDCOR: TFloatField;
    qryHistCaixaIDHISTCAIXA: TFloatField;
    qryHistCaixaREG: TFloatField;
    qryRendaVariavelTIPOREL: TFloatField;
    qryRendaVariavelCARTEIRA: TStringField;
    qryRendaVariavelCODISIN: TStringField;
    qryRendaVariavelINVESTIMENTO: TStringField;
    qryRendaVariavelDATAOPER: TDateTimeField;
    qryRendaVariavelVALOR: TFloatField;
    qryRendaVariavelSALDO: TFloatField;
    qryRendaVariavelQUANTIDADE: TFloatField;
    qryRendaVariavelCOTACAO: TFloatField;
    qryRendaVariavelDATAMOVCARTINV: TDateTimeField;
    qryRendaVariavelLOTE: TFloatField;
    qryRendaVariavelIDCARTEIRAINVEST: TFloatField;
    qryRendaVariavelIDINVESTIMENTO: TFloatField;
    qryRendaVariavelIDLOTE: TStringField;
    qryRendaVariavelOPERACAO: TStringField;
    qryRendaVariavelVENCIMENTO: TDateTimeField;
    qryRendaVariavelCORRETORA: TStringField;
    qryRendaVariavelIDCOR: TFloatField;
    qryRendaVariavelIDEVENTOCAIXACOTA: TFloatField;
    qryRendaVariavelIDHISTCAIXA: TFloatField;
    qryRendaVariavelREG: TFloatField;
    qryHistCaixaSALDOTOTAL: TFloatField;
    qryRendaVariavelSALDOTOTAL: TFloatField;
    QryValoresPagarReceberTIPOREL: TFloatField;
    QryValoresPagarReceberCARTEIRA: TStringField;
    QryValoresPagarReceberCODISIN: TStringField;
    QryValoresPagarReceberINVESTIMENTO: TStringField;
    QryValoresPagarReceberDATAOPER: TDateTimeField;
    QryValoresPagarReceberVALOR: TFloatField;
    QryValoresPagarReceberSALDO: TFloatField;
    QryValoresPagarReceberQUANTIDADE: TFloatField;
    QryValoresPagarReceberCOTACAO: TFloatField;
    QryValoresPagarReceberDATAMOVCARTINV: TDateTimeField;
    QryValoresPagarReceberLOTE: TFloatField;
    QryValoresPagarReceberIDCARTEIRAINVEST: TFloatField;
    QryValoresPagarReceberIDINVESTIMENTO: TFloatField;
    QryValoresPagarReceberIDLOTE: TStringField;
    QryValoresPagarReceberOPERACAO: TStringField;
    QryValoresPagarReceberVENCIMENTO: TDateTimeField;
    QryValoresPagarReceberCORRETORA: TStringField;
    QryValoresPagarReceberIDCOR: TFloatField;
    QryValoresPagarReceberIDEVENTOCAIXACOTA: TFloatField;
    QryValoresPagarReceberIDHISTCAIXA: TFloatField;
    QryValoresPagarReceberREG: TFloatField;
    QryValoresPagarReceberSALDOTOTAL: TFloatField;
    //Al_3
    qryDetVlPagRec2DATAOPERACAO: TDateTimeField;
    qryDetVlPagRecDATAOPERACAO: TDateTimeField;
    //AL_4
    QryPatroPlanPrevContab: TwwQuery;
    QryPatroPlanPrevContabIDPLANPREVCTBPATR: TFloatField;
    QryPatroPlanPrevContabIDPLANOPREV: TFloatField;
    QryPatroPlanPrevContabIDPATRO: TFloatField;
    QryPatroPlanPrevContabPLANPRVCONTABPATRO: TStringField;
    dblPlanoPatr: TwwDBLookupCombo;
    Label1: TLabel;
    //Al_3 - Fim
    procedure dDataEnter(Sender: TObject);
    //AL_4
    procedure bbtnCancelarClick(Sender: TObject);
    procedure btImprimirClick(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure dblCarteiraEnter(Sender: TObject);
    procedure RVFixarColunaClick(Sender: TObject);
    procedure CCFixarColunaClick(Sender: TObject);
    procedure RVLiberarColunaClick(Sender: TObject);
    procedure CCLiberarColunaClick(Sender: TObject);
    procedure RVLiberaTodasColunasClick(Sender: TObject);
    procedure CCLiberaTodasColunasClick(Sender: TObject);
    procedure pmnuRendaVariavelPopup(Sender: TObject);
    procedure pmnuCaixaCotaPopup(Sender: TObject);
    procedure dblRegra1Change(Sender: TObject);
    procedure dblRegra1Exit(Sender: TObject);
    procedure dblRegra2Change(Sender: TObject);
    procedure dblRegra2Exit(Sender: TObject);
    procedure btnCalcRegra1Click(Sender: TObject);
    procedure btnCalcRegra2Click(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure dbgCaixaDrawDataCell(Sender: TObject; const Rect: TRect;
      Field: TField; State: TGridDrawState);
    procedure FormActivate(Sender: TObject);
    procedure QryValoresPagarReceberAfterOpen(DataSet: TDataSet);
    //AL_4
    procedure bbtnConfirmarClick(Sender: TObject);
    //AL_5
    procedure dDataExit(Sender: TObject);
  private
    { Private declarations }
    sData: String;
    bFechada: Boolean;
    procedure AbreConsulta;
    procedure AbreQuery;
    procedure FechaQuery;

    // AL_2
    procedure MontaQuery;

  public
    { Public declarations }
  end;

var
  frmConsCartGerenc: TfrmConsCartGerenc;

implementation

uses UBibliotecaInvest, DBaseDados, ComObj, UDataBase, UMensErro, FDmRelCarteiraGerenc,
     UOperComum, UDiasUteisInv, FPrincipal,
//AL_5
URendaVariavel;

{$R *.DFM}

{ TfrmConsCartGerenc }

procedure TfrmConsCartGerenc.AbreConsulta;
begin
   if (Trim(dData.Text) = '') then
   begin
      MsgDlg('Informe a Data.', 'Mensagem do Sistema', mtWarning,[MbOk],0);
      if dData.CanFocus then
         dData.SetFocus;
      Exit;
   end;

   if Trim(dblCarteira.Text) = '' then
   begin
      MsgDlg('Selecione a Carteira.', 'Mensagem do Sistema', mtWarning,[MbOk],0);
      if dblCarteira.CanFocus then
         dblCarteira.SetFocus;
      Exit;
   end;

   //AL_4
   if Trim(dblPlanoPatr.Text) = '' then
   begin
      MsgDlg('Selecione o Plano/Patrocinadora.', 'Mensagem do Sistema', mtWarning,[MbOk],0);
      if dblPlanoPatr.CanFocus then
         dblPlanoPatr.SetFocus;
      Exit;
   end;

   pgcMercados.ActivePage := tbsRendaVariavel;

   AbreQuery;
end;

procedure TfrmConsCartGerenc.AbreQuery;
var
    wFatorCDI : Double;
    dDataFim, dDataAnt, dDtaAtual  : TDateTime;
    I, iIdTipoInvest               : integer;
begin
   QryUltDataMov.Close;
   QryUltDataMov.Open;
   dDtaAtual    := QryUltDataMov.FieldByName('DATAHISTCOTA').AsDateTime;
   QryUltDataMov.Close;

   If (dDtaAtual <> 0) And (dData.Date > dDtaAtual) Then
      dData.Text  := DateToStr(dDtaAtual);

   OperComum.LimpaParametros(qryRendaVariavel);
   //AL_4
   qryRendaVariavel.ParamByName('IDCARTEIRAGERENC').AsInteger  := StrToInt(dblCarteira.LookupValue);
   //AL_2
   qryRendaVariavel.ParamByName('DATAINI').AsString            := dData.Text;
   //Al_3
   qryRendaVariavel.ParamByName('VARGROUP').AsString           := 'A';
   qryRendaVariavel.ParamByName('IDPLANPREVCTBPATR').AsInteger := StrToInt(dblPlanoPatr.LookupValue);
   qryRendaVariavel.Open;

   iIdTipoInvest  := iTipoInvestUsu;
   dDataFim       := StrToDate(dData.Text);
   iTipoInvestUsu := 2;
   I              := 1;

   While I <= 3 Do
   Begin
      dDataFim    := dDataFim + 1;
      While not DiasUteisInv.DiaUtil(dDataFim,-1,1,'',True,False,False) Do
        dDataFim  := dDataFim + 1;   // Achar o próximo dia útil
      I := I+1;
   End;

   iTipoInvestUsu := iIdTipoInvest;

   OperComum.LimpaParametros(QryValoresPagarReceber);
   //AL_4
   QryValoresPagarReceber.ParamByName('IDCARTEIRAGERENC').AsInteger  := StrToInt(dblCarteira.LookupValue);
   QryValoresPagarReceber.ParamByName('DATAINI').AsString            := dData.Text;
   QryValoresPagarReceber.ParamByName('DATAFIM').AsString            := DateToStr(dDataFim);
   //Al_3
   QryValoresPagarReceber.ParamByName('VARGROUP').AsString           := 'A';
   QryValoresPagarReceber.ParamByName('IDPLANPREVCTBPATR').AsInteger := StrToInt(dblPlanoPatr.LookupValue);
   QryValoresPagarReceber.Open;

   iTipoInvestUsu := 5;
   dDataAnt       := StrToDate(dData.Text)-1;
   While not DiasUteisInv.DiaUtil(dDataAnt,-1,1,'',True,False,False) Do
      dDataAnt    := dDataAnt - 1;   // Achar o dia útil anterior

   OperComum.LimpaParametros(qryHistCaixa);
   //AL_4
   qryHistCaixa.ParamByName('IDCARTEIRAGERENC').AsInteger   := StrToInt(dblCarteira.LookupValue);
   // AL_2
   qryHistCaixa.ParamByName('DATAINI').AsString             := dData.Text;
   qryHistCaixa.ParamByName('DATAANTERIOR').AsString        := DateToStr(dDataAnt);
   //Al_3
   qryHistCaixa.ParamByName('VARGROUP').AsString            := 'A';
   qryHistCaixa.ParamByName('IDPLANPREVCTBPATR').AsInteger := StrToInt(dblPlanoPatr.LookupValue);
   qryHistCaixa.Open;

   OperComum.LimpaParametros(DmRelCarteiraGerenc.qryResumoCota);
   //AL_4
   DmRelCarteiraGerenc.qryResumoCota.ParamByName('IDCARTEIRAGERENC').AsInteger  := StrToInt(dblCarteira.LookupValue);
   DmRelCarteiraGerenc.qryResumoCota.ParamByName('DATA').AsString               := dData.Text;
   DmRelCarteiraGerenc.qryResumoCota.ParamByName('IDPLANPREVCTBPATR').AsInteger := StrToInt(dblPlanoPatr.LookupValue);
   DmRelCarteiraGerenc.qryResumoCota.Open;
   redQtdCotas.Value   := 0;
   redValCota.Value    := 0.000000000;
   redPatrimonio.Value := 0.00;

   OperComum.LimpaParametros(DmRelCarteiraGerenc.qryRentabilidadeCota);
   //AL_4
   DmRelCarteiraGerenc.qryRentabilidadeCota.ParamByName('IDCARTEIRAGERENC').AsInteger := StrToInt(dblCarteira.LookupValue);
   DmRelCarteiraGerenc.qryRentabilidadeCota.ParamByName('DATA').AsString                 := dData.Text;
   DmRelCarteiraGerenc.qryRentabilidadeCota.ParamByName('IDPLANPREVCTBPATR').AsInteger   := StrToInt(dblPlanoPatr.LookupValue);
   DmRelCarteiraGerenc.qryRentabilidadeCota.Open;
   while not DmRelCarteiraGerenc.qryResumoCota.Eof do
   begin
      case DmRelCarteiraGerenc.qryResumoCotaIDEVENTOCAIXACOTA.AsInteger of
      -3: redQtdCotas.Value   := DmRelCarteiraGerenc.qryResumoCotaVLRHISTCOTA.AsFloat;
      -2: redValCota.Value    := DmRelCarteiraGerenc.qryResumoCotaVLRHISTCOTA.AsFloat;
      -1: redPatrimonio.Value := DmRelCarteiraGerenc.qryResumoCotaVLRHISTCOTA.AsFloat;
      end;
      DmRelCarteiraGerenc.qryResumoCota.Next;
   end;

   edtInd1Mes.Value := 0.0000;
   edtInd1Ano.Value := 0.0000;
   edtInd2Mes.Value := 0.0000;
   edtInd2Ano.Value := 0.0000;

   bFechada                     := False;
   dbgRendaVariavel.FixedCols   := 0;
   RVLiberaTodasColunas.Enabled := False;
   RVLiberarColuna.Enabled      := False;
   RVFixarColuna.Enabled        := True;
   dbgValoresPagarReceber.FixedCols := 0;
   CCLiberaTodasColunas.Enabled := False;
   CCLiberarColuna.Enabled      := False;
   CCFixarColuna.Enabled        := True;

end;

procedure TfrmConsCartGerenc.FechaQuery;
begin
   if not bFechada then
   begin
      //AL_4
      redQtdCotas.Value   := 0;
      redValCota.Value    := 0.000000000;
      redPatrimonio.Value := 0.00;
      edtInd1Mes.Value    := 0.0000;
      edtInd1Ano.Value    := 0.0000;
      edtInd2Mes.Value    := 0.0000;
      edtInd2Ano.Value    := 0.0000;
      pgcMercados.ActivePage := tbsRendaVariavel;
   end;
   bFechada := True;
   dbgRendaVariavel.FixedCols   := 0;
   RVLiberaTodasColunas.Enabled := False;
   RVLiberarColuna.Enabled      := False;
   RVFixarColuna.Enabled        := False;
   dbgValoresPagarReceber.FixedCols := 0;
   CCLiberaTodasColunas.Enabled := False;
   CCLiberarColuna.Enabled      := False;
   CCFixarColuna.Enabled        := False;

end;

procedure TfrmConsCartGerenc.dDataEnter(Sender: TObject);
begin
  inherited;
  sData := Trim(dData.Text);
end;

//AL_4
procedure TfrmConsCartGerenc.bbtnCancelarClick(Sender: TObject);
begin
  inherited;
  FechaQuery;
end;

//AL_4
procedure TfrmConsCartGerenc.btImprimirClick(Sender: TObject);
Var
   dDataAnt, dDataFim : TDateTime;
   I, iIdTipoInvest   : Integer;
begin
   if (Trim(dData.Text) = '') then
   begin
      if dData.CanFocus then
         dData.SetFocus;
      Exit;
   end;

   if Trim(dblCarteira.Text) = '' then
   begin
      if dblCarteira.CanFocus then
         dblCarteira.SetFocus;
      Exit;
   end;

   if Trim(dblPlanoPatr.Text) = '' then
   begin
      if dblPlanoPatr.CanFocus then
         dblPlanoPatr.SetFocus;
      Exit;
   end;

   inherited;

   iIdTipoInvest  := iTipoInvestUsu;
   dDataFim       := StrToDate(dData.Text);
   iTipoInvestUsu := 2;
   I              := 1;

   While I <= 3 Do
   Begin
      dDataFim    := dDataFim + 1;
      While not DiasUteisInv.DiaUtil(dDataFim,-1,1,'',True,False,False) Do
        dDataFim  := dDataFim + 1;   // Achar o próximo dia útil
      I := I + 1;
   End;

   iTipoInvestUsu := 5;
   dDataAnt       := StrToDate(dData.Text) - 1;
   While not DiasUteisInv.DiaUtil(dDataAnt,-1,1,'',True,False,False) Do
      dDataAnt    := dDataAnt - 1;   // Achar o dia útil anterior

   iTipoInvestUsu := iIdTipoInvest;

   with DmRelCarteiraGerenc.qryCartGerencial do
   begin
      Close;
      ParamByName('DATA').AsString              := dData.Text;
      ParamByName('IDCARTEIRAGERENC').AsInteger := StrToInt(dblCarteira.LookupValue);
      ParamByName('IDPLANPREVCTBPATR').AsInteger:= StrToInt(dblPlanoPatr.LookupValue);
      Open;
   end;

   DmRelCarteiraGerenc.qryCartGerencialDet.Filtered := False;
   DmRelCarteiraGerenc.qryCartGerencialDet.Filter   := '';
   DmRelCarteiraGerenc.qryCartGerencialDet.Filtered := True;

   with DmRelCarteiraGerenc.qryCartGerencialDet do
   begin
      Close;
      //Al_3
      ParamByName('VARGROUP').AsString          := 'A';
      ParamByName('DATAANTERIOR').AsString      := DateToStr(dDataAnt);
      ParamByName('DATAINI').AsString           := dData.Text;
      ParamByName('DATAFIM').AsString           := DateToStr(dDataFim);
      ParamByName('IDCARTEIRAGERENC').AsInteger := StrToInt(dblCarteira.LookupValue);
      ParamByName('IDPLANPREVCTBPATR').AsInteger:= StrToInt(dblPlanoPatr.LookupValue);
      Open;
   end;

   // AL_1
   // COMPRA
   with DmRelCarteiraGerenc.qryAnaliticoCompra do
   begin
      Close;
      ParamByName('DT_INI').AsString            := dData.Text;
      ParamByName('DT_FIM').AsString            := DateToStr(dDataFim);
      ParamByName('IDCARTEIRAGERENC').AsInteger := StrToInt(dblCarteira.LookupValue);
      ParamByName('IDPLANPREVCTBPATR').AsInteger:= StrToInt(dblPlanoPatr.LookupValue);
      Open;
   end;

   // VENDA
   with DmRelCarteiraGerenc.qryAnaliticoVenda do
   begin
      Close;
      ParamByName('DT_INI').AsString            := dData.Text;
      ParamByName('DT_FIM').AsString            := DateToStr(dDataFim);
      ParamByName('IDCARTEIRAGERENC').AsInteger := StrToInt(dblCarteira.LookupValue);
      ParamByName('IDPLANPREVCTBPATR').AsInteger:= StrToInt(dblPlanoPatr.LookupValue);
      Open;
   end;

   // DESPESAS A PAGAR
   with DmRelCarteiraGerenc.qryAnaliticoDesp do
   begin
      Close;
      ParamByName('DT_INI').AsString            := dData.Text;
      ParamByName('DT_FIM').AsString            := DateToStr(dDataFim);
      ParamByName('IDCARTEIRAGERENC').AsInteger := StrToInt(dblCarteira.LookupValue);
      ParamByName('IDPLANPREVCTBPATR').AsInteger:= StrToInt(dblPlanoPatr.LookupValue);
      Open;
   end;

   DmRelCarteiraGerenc.qryCartGerencialDet.Filter := 'TIPOREL = ' + DmRelCarteiraGerenc.qryCartGerencialTIPOREL.AsString;

   if Trim(dblRegra1.Text) = '' then
   begin
      DmRelCarteiraGerenc.lblNomePriIndicador.Caption := '';
      DmRelCarteiraGerenc.lblVarPriIndMensal.Caption  := '';
      DmRelCarteiraGerenc.lblVarPriIndAnual.Caption   := '';
   end else begin
      DmRelCarteiraGerenc.lblNomePriIndicador.Caption := dblRegra1.Text  + '%';
      DmRelCarteiraGerenc.lblVarPriIndMensal.Caption  := edtInd1Mes.Text + '%';
      DmRelCarteiraGerenc.lblVarPriIndAnual.Caption   := edtInd1Ano.Text + '%';
   end;

   if Trim(dblRegra2.Text) = '' then
   begin
      DmRelCarteiraGerenc.lblNomeSegIndicador.Caption := '';
      DmRelCarteiraGerenc.lblVarSegIndMensal.Caption  := '';
      DmRelCarteiraGerenc.lblVarSegIndAnual.Caption   := '';
   end else begin
      DmRelCarteiraGerenc.lblNomeSegIndicador.Caption := dblRegra2.Text  + '%';
      DmRelCarteiraGerenc.lblVarSegIndMensal.Caption  := edtInd2Mes.Text + '%';
      DmRelCarteiraGerenc.lblVarSegIndAnual.Caption   := edtInd2Ano.Text + '%';
   end;

   DmRelCarteiraGerenc.lblData.Caption     := dData.Text;

   DmRelCarteiraGerenc.lblCarteira.Caption := dblCarteira.Text;

   DmRelCarteiraGerenc.lblPlano.Caption    := dblPlanoPatr.Text;

   DmRelCarteiraGerenc.pplResumoCota.DataSource    := DmRelCarteiraGerenc.dsResumoCota;
   DmRelCarteiraGerenc.pplRentabilidade.DataSource := DmRelCarteiraGerenc.dsRentabilidadeCota;

   TfrmPreview.CreateModalPreview(Application,
                                  DmRelCarteiraGerenc.pprCompCarteiraGerenc,
                                  DmRelCarteiraGerenc.pprCompCarteiraGerenc.PrinterSetup.DocumentName);

end;

//AL_4
procedure TfrmConsCartGerenc.FormShow(Sender: TObject);
var dDtaAtual : TDateTime;
begin
  inherited;

   // AL_2
   MontaQuery;

   FechaQuery;

   qryCarteira.Open;

   QryPatroPlanPrevContab.Open;

   OperComum.LimpaParametros(qryRegra1);
   qryRegra1.ParamByName('IDTIPOREGRA').AsInteger := pRPI.IDTIPOREGRARENT;
   qryRegra1.Open;

   OperComum.LimpaParametros(qryRegra2);
   qryRegra2.ParamByName('IDTIPOREGRA').AsInteger := pRPI.IDTIPOREGRARENT;
   qryRegra2.Open;

   QryUltDataMov.Close;
   QryUltDataMov.Open;
   dData.Text  := QryUltDataMov.FieldByName('DATAHISTCOTA').AsString;
   QryUltDataMov.Close;

end;

//AL_4
procedure TfrmConsCartGerenc.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
  inherited;
  DmRelCarteiraGerenc.qryCartGerencial.Close;
  DmRelCarteiraGerenc.qryCartGerencialDet.Close;
  QryPatroPlanPrevContab.Close;  
  qryCarteira.Close;
  qryRegra1.Close;
  qryRegra2.Close;
end;

procedure TfrmConsCartGerenc.dblCarteiraEnter(Sender: TObject);
begin
  inherited;
  sData := Trim(dblCarteira.Text);
end;

procedure TfrmConsCartGerenc.RVFixarColunaClick(Sender: TObject);
begin
  inherited;
  dbgRendaVariavel.FixedCols := dbgRendaVariavel.FixedCols + 1;
end;

procedure TfrmConsCartGerenc.CCFixarColunaClick(Sender: TObject);
begin
  inherited;
  dbgValoresPagarReceber.FixedCols := dbgValoresPagarReceber.FixedCols + 1;
end;

procedure TfrmConsCartGerenc.RVLiberarColunaClick(Sender: TObject);
begin
  inherited;
  dbgRendaVariavel.FixedCols := dbgRendaVariavel.FixedCols - 1;
end;

procedure TfrmConsCartGerenc.CCLiberarColunaClick(Sender: TObject);
begin
  inherited;
  dbgValoresPagarReceber.FixedCols := dbgValoresPagarReceber.FixedCols - 1;
end;

procedure TfrmConsCartGerenc.RVLiberaTodasColunasClick(Sender: TObject);
begin
  inherited;
  dbgRendaVariavel.FixedCols := 0;
end;

procedure TfrmConsCartGerenc.CCLiberaTodasColunasClick(Sender: TObject);
begin
  inherited;
  dbgValoresPagarReceber.FixedCols := 0;
end;

procedure TfrmConsCartGerenc.pmnuRendaVariavelPopup(Sender: TObject);
begin
  inherited;
  if dbgRendaVariavel.DataSource.DataSet.Active then
  begin
     if dbgRendaVariavel.FixedCols = 0 then begin
        RVLiberarColuna.Enabled := False;
        RVLiberaTodasColunas.Enabled := False;
        end
     else begin
        RVLiberarColuna.Enabled := True;
        RVLiberaTodasColunas.Enabled := True;
     end;

     if dbgRendaVariavel.FixedCols = dbgRendaVariavel.GetColCount then
        RVFixarColuna.Enabled := False
     else
        RVFixarColuna.Enabled := True;
  end
  else
  begin
     RVLiberarColuna.Enabled := False;
     RVLiberaTodasColunas.Enabled := False;
     RVFixarColuna.Enabled := False
  end;
end;

procedure TfrmConsCartGerenc.pmnuCaixaCotaPopup(Sender: TObject);
begin
  inherited;
  if dbgValoresPagarReceber.DataSource.DataSet.Active then
  begin
     if dbgValoresPagarReceber.FixedCols = 0 then begin
        CCLiberarColuna.Enabled := False;
        CCLiberaTodasColunas.Enabled := False;
        end
     else begin
        CCLiberarColuna.Enabled := True;
        CCLiberaTodasColunas.Enabled := True;
     end;

     if dbgValoresPagarReceber.FixedCols = dbgValoresPagarReceber.GetColCount then
        CCFixarColuna.Enabled := False
     else
        CCFixarColuna.Enabled := True;
  end
  else
  begin
     CCLiberarColuna.Enabled := False;
     CCLiberaTodasColunas.Enabled := False;
     CCFixarColuna.Enabled := False
  end;
end;

procedure TfrmConsCartGerenc.dblRegra1Change(Sender: TObject);
begin
  inherited;
  if Trim(dblRegra1.Text) = '' then
     btnCalcRegra1.Visible := False
  else btnCalcRegra1.Visible := True;
end;

procedure TfrmConsCartGerenc.dblRegra1Exit(Sender: TObject);
begin
  inherited;
  if Trim(dblRegra1.Text) = '' then
     btnCalcRegra1.Visible := False
  else btnCalcRegra1.Visible := True;
end;

procedure TfrmConsCartGerenc.dblRegra2Change(Sender: TObject);
begin
  inherited;
  if Trim(dblRegra2.Text) = '' then
     btnCalcRegra2.Visible := False
  else btnCalcRegra2.Visible := True;
end;

procedure TfrmConsCartGerenc.dblRegra2Exit(Sender: TObject);
begin
  inherited;
  if Trim(dblRegra2.Text) = '' then
     btnCalcRegra2.Visible := False
  else btnCalcRegra2.Visible := True;
end;

procedure TfrmConsCartGerenc.btnCalcRegra1Click(Sender: TObject);
begin
   inherited;
   // Inicia o cálculo da regra do Primeiro Indicador - Mes
   qryAux.Close;
   qryAux.SQL.Clear;
   qryAux.SQL.Add('SELECT ');
   qryAux.SQL.Add('LAST_DAY((TO_DATE(' + QuotedStr(dData.Text) + ',''DD/MM/YYYY'') - TO_NUMBER(DECODE( TO_CHAR(TO_DATE(' + QuotedStr(dData.Text) + ',''DD/MM/YYYY''),''DD''),31,31,30)))) AS DATAINICIO,');
   qryAux.SQL.Add(QuotedStr(dData.Text) + ' AS DATAFINAL, ');
   qryAux.SQL.Add('100 AS PERCENTUAL, ');
   qryAux.SQL.Add('0.00 AS TAXA, ');
   qryAux.SQL.Add('-1 AS IDCIDADES, ');
   qryAux.SQL.Add(' 1 AS IDPAIS, ');
   qryAux.SQL.Add(''' '' AS CODESTADO');
   qryAux.SQL.Add('FROM DUAL');
   qryAux.Open;

   // Chama regra de cálculo da Variação do Indicador
   regRentabilidade.RuleName := qryRegra1IDREGRA.AsString;
   regRentabilidade.QueryIn  := qryAux;
   try
      //regRentabilidade.PassoaPasso;
      regRentabilidade.Execute;
   except
      on E:Exception do
      begin
         MsgDlg('Não foi possível calcular a Variação Mensal da Regra: ' + #13 +
                '  ' + qryRegra1NOMEREGRA.AsString + #13 +
                'Com a Mensagem:' + #13 +
                '  ' + E.Message, 'Mensagem do Sistema', mtWarning,[MbOk],0);
         Exit;
      end;
   end;
   edtInd1Mes.Value := StrToFloat(TrocaPontoVirgula(regRentabilidade.Result));

   // Inicia o cálculo da regra do Primeiro Indicador - Ano
   qryAux.Close;
   qryAux.SQL.Clear;
   qryAux.SQL.Add('SELECT ');
   qryAux.SQL.Add('TO_DATE(''31/12/'' ||  TO_CHAR( TO_NUMBER( TO_CHAR( TO_DATE(' + QuotedStr(dData.Text) + ',''DD/MM/YYYY''),''YYYY'')) -1,''9999''),''DD/MM/YYYY'') AS DATAINICIO, ');
   qryAux.SQL.Add(QuotedStr(dData.Text) + ' AS DATAFINAL, ');
   qryAux.SQL.Add('100 AS PERCENTUAL, ');
   qryAux.SQL.Add('0.00 AS TAXA, ');
   qryAux.SQL.Add('-1 AS IDCIDADES, ');
   qryAux.SQL.Add(' 1 AS IDPAIS, ');
   qryAux.SQL.Add(''' '' AS CODESTADO');
   qryAux.SQL.Add('FROM DUAL');
   qryAux.Open;

   // Chama regra de cálculo da Variação do Indicador
   regRentabilidade.RuleName := qryRegra1IDREGRA.AsString;
   regRentabilidade.QueryIn  := qryAux;
   try
      //regRentabilidade.PassoaPasso;
      regRentabilidade.Execute;
   except
      on E:Exception do
      begin
         MsgDlg('Não foi possível calcular a Variação Anual da Regra: ' + #13 +
                '  ' + qryRegra1NOMEREGRA.AsString + #13 +
                'Com a Mensagem:' + #13 +
                '  ' + E.Message, 'Mensagem do Sistema', mtWarning,[MbOk],0);
         Exit;
      end;
   end;
   edtInd1Ano.Value := StrToFloat(TrocaPontoVirgula(regRentabilidade.Result));
end;

procedure TfrmConsCartGerenc.btnCalcRegra2Click(Sender: TObject);
begin
   inherited;
   // Inicia o cálculo da regra do Segundo Indicador - Mes
   qryAux.Close;
   qryAux.SQL.Clear;
   qryAux.SQL.Add('SELECT ');
   qryAux.SQL.Add('LAST_DAY((TO_DATE(' + QuotedStr(dData.Text) + ',''DD/MM/YYYY'') - TO_NUMBER(DECODE( TO_CHAR(TO_DATE(' + QuotedStr(dData.Text) + ',''DD/MM/YYYY''),''DD''),31,31,30)))) AS DATAINICIO, ');
   qryAux.SQL.Add(QuotedStr(dData.Text) + ' AS DATAFINAL, ');
   qryAux.SQL.Add('100 AS PERCENTUAL, ');
   qryAux.SQL.Add('0.00 AS TAXA, ');
   qryAux.SQL.Add('-1 AS IDCIDADES, ');
   qryAux.SQL.Add(' 1 AS IDPAIS, ');
   qryAux.SQL.Add(''' '' AS CODESTADO');
   qryAux.SQL.Add('FROM DUAL');
   qryAux.Open;

   // Chama regra de cálculo da Variação do Indicador
   regRentabilidade.RuleName := qryRegra2IDREGRA.AsString;
   regRentabilidade.QueryIn  := qryAux;
   try
      //regRentabilidade.PassoaPasso;
      regRentabilidade.Execute;
   except
      on E:Exception do
      begin
         MsgDlg('Não foi possível Variação Mensal da Regra: ' + #13 +
                '  ' + qryRegra2NOMEREGRA.AsString + #13 +
                'Com a Mensagem:' + #13 +
                '  ' + E.Message, 'Mensagem do Sistema', mtWarning,[MbOk],0);
         Exit;
      end;
   end;
   edtInd2Mes.Value := StrToFloat(TrocaPontoVirgula(regRentabilidade.Result));

   // Inicia o cálculo da regra do Segundo Indicador - Ano
   qryAux.Close;
   qryAux.SQL.Clear;
   qryAux.SQL.Add('SELECT ');
   qryAux.SQL.Add('TO_DATE(''31/12/'' ||  TO_CHAR( TO_NUMBER( TO_CHAR( TO_DATE(' + QuotedStr(dData.Text) + ',''DD/MM/YYYY''),''YYYY'')) -1,''9999''),''DD/MM/YYYY'') AS DATAINICIO, ');
   qryAux.SQL.Add(QuotedStr(dData.Text) + ' AS DATAFINAL, ');
   qryAux.SQL.Add('100 AS PERCENTUAL, ');
   qryAux.SQL.Add('0.00 AS TAXA, ');
   qryAux.SQL.Add('-1 AS IDCIDADES, ');
   qryAux.SQL.Add(' 1 AS IDPAIS, ');
   qryAux.SQL.Add(''' '' AS CODESTADO');
   qryAux.SQL.Add('FROM DUAL');
   qryAux.Open;

   // Chama regra de cálculo da Variação do Indicador
   regRentabilidade.RuleName := qryRegra2IDREGRA.AsString;
   regRentabilidade.QueryIn  := qryAux;
   try
      //regRentabilidade.PassoaPasso;
      regRentabilidade.Execute;
   except
      on E:Exception do
      begin
         MsgDlg('Erro ao calcular a Variação Mensal da Regra: ' + #13 +
                '  ' + qryRegra2NOMEREGRA.AsString + #13 +
                'Com a Mensagem:' + #13 +
                '  ' + E.Message, 'Mensagem do Sistema', MtError,[MbOk],0);
         Exit;
      end;
   end;
   edtInd2Ano.Value := StrToFloat(TrocaPontoVirgula(regRentabilidade.Result));
end;

procedure TfrmConsCartGerenc.FormCreate(Sender: TObject);
begin
   if (TForm(Sender).Height > FrmPrincipal.ClientHeight - 50{Tamanho da barra de tarefas e barra de staus}) or
      (TForm(Sender).Width  > FrmPrincipal.ClientWidth  - 4 {Margem de segurança}) then
      WindowState := wsMaximized
   else
      WindowState := wsNormal;

  inherited;
 // TESTE

 // AL_1
 tbsDetPagRec.TabVisible := False;
end;

procedure TfrmConsCartGerenc.dbgCaixaDrawDataCell(Sender: TObject;
  const Rect: TRect; Field: TField; State: TGridDrawState);
begin
  inherited;
  if not ((gdSelected in State) or (gdFixed in State)) then
  begin
     if qryHistCaixa.FieldByName('IDCOR').AsInteger <> 0 then
        dbgCaixa.Canvas.Brush.Color := qryHistCaixa.FieldByName('IDCOR').AsInteger
     else
        dbgCaixa.Canvas.Brush.Color := clwhite;

        dbgCaixa.DefaultDrawDataCell(Rect, Field, State);
  end
  else if (gdSelected in State) or (gdFocused in State) then
  begin
     if qryHistCaixa.FieldByName('IDCOR').AsInteger <> 0 then
        dbgCaixa.Canvas.Font.Color := qryHistCaixa.FieldByName('IDCOR').AsInteger
     else
        dbgCaixa.Canvas.Font.Color := clWhite;

     if (State = [gdSelected]) then
        dbgCaixa.Canvas.Brush.Color := clNavy;

     dbgCaixa.DefaultDrawDataCell(Rect, Field, State);
  end;
end;

procedure TfrmConsCartGerenc.FormActivate(Sender: TObject);
begin
  inherited;

  PnlFundo.Enabled := True;

end;

procedure TfrmConsCartGerenc.QryValoresPagarReceberAfterOpen(
  DataSet: TDataSet);
var
   sDataInicioParam : String;
   sDataFinalParam  : String;
   sDtFimParam      : TDateTime;
   I                : Integer;

begin
  inherited;

  // AL_1
  if QryValoresPagarReceberREG.AsFloat < 3 then
  begin
     tbsDetPagRec.TabVisible := True;

     sDtFimParam := StrToDate(dData.Text);
     I           := 1;

     while I <= 3 Do
     begin
        sDtFimParam := sDtFimParam + 1;

        while not DiasUteisInv.DiaUtil(sDtFimParam,-1,1,'',True,False,False) Do
          sDtFimParam  := sDtFimParam + 1;   // Achar o próximo dia útil

        I := I + 1;
     end;

     sDataInicioParam := dData.Text;
     sDataFinalParam  := DateToStr(sDtFimParam);
     
     // COMPRA
     if QryValoresPagarReceberREG.AsFloat = 0 then
     begin
          qryDetVlPagRec.Close;
          dbgDetValoresPagarReceber2.Enabled := True;
          dbgDetValoresPagarReceber2.Visible := True;
          dbgDetValoresPagarReceber.Enabled  := False;
          dbgDetValoresPagarReceber.Visible  := False;

          qryDetVlPagRec2.Close;
          qryDetVlPagRec2.Sql.Clear;
          //Al_3
          qryDetVlPagRec2.Sql.Add('SELECT DATAOPERACAO,                                                               ');
          qryDetVlPagRec2.Sql.Add('       NUMDOCUMENTO,                                                               ');
          qryDetVlPagRec2.Sql.Add('       DESCINVESTIMENTO,                                                           ');
          qryDetVlPagRec2.Sql.Add('       QTDE,                                                                       ');
          qryDetVlPagRec2.Sql.Add('       PRECO,                                                                      ');
          qryDetVlPagRec2.Sql.Add('       VLROPERACAO                                                                 ');
          qryDetVlPagRec2.Sql.Add('  FROM (                                                                           ');
          //Al_3
          qryDetVlPagRec2.Sql.Add('        SELECT DATAOPERACAO,                                                       ');
          qryDetVlPagRec2.Sql.Add('               NUMDOCUMENTO,                                                       ');
          qryDetVlPagRec2.Sql.Add('               QTDEOPERACAO        AS QTDE,                                        ');
          qryDetVlPagRec2.Sql.Add('               PRECOUNITOPERACAO   AS PRECO,                                       ');
          qryDetVlPagRec2.Sql.Add('               IV.DESCINVESTIMENTO,                                                ');
          qryDetVlPagRec2.Sql.Add('               OI.VLROPERACAO                                                      ');
          qryDetVlPagRec2.Sql.Add('          FROM HISTCARTINV    HC,                                                  ');
          qryDetVlPagRec2.Sql.Add('               OPERACAOINVEST OI,                                                  ');
          qryDetVlPagRec2.Sql.Add('               TIPOOPERACAO   TP,                                                  ');
          qryDetVlPagRec2.Sql.Add('               INVESTIMENTO   IV                                                   ');
          qryDetVlPagRec2.Sql.Add('         WHERE OI.DATAOPERACAO <= TO_DATE(' + QuotedStr(sDataInicioParam) + ',' + QuotedStr('DD/MM/YYYY') + ')');
          qryDetVlPagRec2.Sql.Add('           AND(OI.DATAVENCOPER  > TO_DATE(' + QuotedStr(sDataInicioParam) + ',' + QuotedStr('DD/MM/YYYY') + ')');
          qryDetVlPagRec2.Sql.Add('           AND OI.DATAVENCOPER <= TO_DATE(' + QuotedStr(sDataFinalParam) + ',' + QuotedStr('DD/MM/YYYY') + '))');
          qryDetVlPagRec2.Sql.Add('           AND (((' + QuotedStr(qryCarteiraIDCARTEIRAGERENC.AsString) + ' IS NOT NULL) AND (OI.IDCARTEIRAGERENC = ' + QuotedStr(qryCarteiraIDCARTEIRAGERENC.AsString) + ')) OR ((' + QuotedStr(qryCarteiraIDCARTEIRAGERENC.AsString) + ' IS NULL) AND (OI.IDCARTEIRAGERENC IS NOT NULL)))');
          qryDetVlPagRec2.Sql.Add('           AND TP.FLGCORRET          = ' + QuotedStr('S')                           );
          qryDetVlPagRec2.Sql.Add('           AND OI.IDOPERACAODIREITO IS NULL                                        ');
          qryDetVlPagRec2.Sql.Add('           AND OI.IDTIPOINVEST       = 2                                           ');
          qryDetVlPagRec2.Sql.Add('           AND HC.TIPMOVCARTINV      = ' + QuotedStr('OPE')                         );
          qryDetVlPagRec2.Sql.Add('           AND HC.NATURMOVCARTINV    = ' + QuotedStr('A')                           );
          qryDetVlPagRec2.Sql.Add('           AND HC.IDOPERACAOINVEST   = OI.IDOPERACAOINVEST                         ');
          qryDetVlPagRec2.Sql.Add('           AND TP.IDTIPOOPERACAO     = OI.IDTIPOOPERACAO                           ');
          qryDetVlPagRec2.Sql.Add('           AND OI.IDINVESTIMENTO     = IV.IDINVESTIMENTO                           ');
          qryDetVlPagRec2.Sql.Add('       )                                                                           ');
          //Al_3
          qryDetVlPagRec2.Sql.Add('ORDER BY DATAOPERACAO, NUMDOCUMENTO, DESCINVESTIMENTO,PRECO                        ');
          qryDetVlPagRec2.Open;
     end;

     // DESPESAS
     if QryValoresPagarReceberREG.AsFloat = 1 then
     begin
          qryDetVlPagRec2.Close;
          dbgDetValoresPagarReceber2.Enabled := False;
          dbgDetValoresPagarReceber2.Visible := False;
          dbgDetValoresPagarReceber.Enabled  := True;
          dbgDetValoresPagarReceber.Visible  := True;

          qryDetVlPagRec.Close;
          qryDetVlPagRec.Sql.Clear;
          //Al_3
          qryDetVlPagRec.Sql.Add('SELECT DATAOPERACAO,                                                                               ');
          qryDetVlPagRec.Sql.Add('       NUMDOCUMENTO,                                                                               ');
          qryDetVlPagRec.Sql.Add('       DESCINVESTIMENTO,                                                                           ');
          qryDetVlPagRec.Sql.Add('       ROUND(((TOTDESP/DECODE(TOTDESP,0,0,TOTQTD))*QTDE),2) AS RATEIO,                             ');
          qryDetVlPagRec.Sql.Add('       QTDE,                                                                                       ');
          qryDetVlPagRec.Sql.Add('       PRECOUNITOPERACAO AS PRECO,                                                                 ');
          qryDetVlPagRec.Sql.Add('       TOTDESP,                                                                                    ');
          qryDetVlPagRec.Sql.Add('       TOTQTD                                                                                      ');
          qryDetVlPagRec.Sql.Add('  FROM (                                                                                           ');
          qryDetVlPagRec.Sql.Add('        SELECT ' + QuotedStr('DESPESAS A PAGAR') + ' AS DESCRICAO,                                            ');
          qryDetVlPagRec.Sql.Add('               OI.NUMDOCUMENTO,                                                                    ');
          qryDetVlPagRec.Sql.Add('               OI.VLROPERACAO AS QTDE,                                                             ');
          qryDetVlPagRec.Sql.Add('               OI.DATAOPERACAO, OI.DATAVENCOPER, OI.IDOPERACAOINVEST,                              ');
          qryDetVlPagRec.Sql.Add('               OI.IDCARTEIRAINVEST, OI.IDCARTEIRAGERENC, OI.PRECOUNITOPERACAO, IV.DESCINVESTIMENTO,');
          qryDetVlPagRec.Sql.Add('               (SELECT SUM(DP.VLRDESPOPER)                                                         ');
          qryDetVlPagRec.Sql.Add('                FROM DESPOPERINVEST DP, OPERACAOINVEST OII                                         ');
          qryDetVlPagRec.Sql.Add('                WHERE (OII.NUMDOCUMENTO    = OI.NUMDOCUMENTO)                                      ');
          qryDetVlPagRec.Sql.Add('                  AND (OII.IDTIPOINVEST    = 2)                                                    ');
          qryDetVlPagRec.Sql.Add('                  AND (OII.IDCARTEIRAGERENC IS NOT NULL)                                           ');
          qryDetVlPagRec.Sql.Add('                  AND (DP.IDOPERACAOINVEST = OII.IDOPERACAOINVEST))*-1 AS TOTDESP,                 ');
          qryDetVlPagRec.Sql.Add('               (SELECT SUM(OII.QTDEOPERACAO)                                                       ');
          qryDetVlPagRec.Sql.Add('                FROM   OPERACAOINVEST OII                                                          ');
          qryDetVlPagRec.Sql.Add('                WHERE (OII.NUMDOCUMENTO    = OI.NUMDOCUMENTO)                                      ');
          qryDetVlPagRec.Sql.Add('                  AND (OII.IDTIPOINVEST    = 2)                                                    ');
          qryDetVlPagRec.Sql.Add('                  AND (OII.IDCARTEIRAGERENC IS NOT NULL)) AS TOTQTD                                ');
          qryDetVlPagRec.Sql.Add('          FROM OPERACAOINVEST OI, INVESTIMENTO IV                                                  ');
          qryDetVlPagRec.Sql.Add('         WHERE (OI.DATAOPERACAO <= TO_DATE(' + QuotedStr(sDataInicioParam) + ',' + QuotedStr('DD/MM/YYYY') + '))');
          qryDetVlPagRec.Sql.Add('           AND ((OI.DATAVENCOPER    >  TO_DATE(' + QuotedStr(sDataInicioParam) + ',' + QuotedStr('DD/MM/YYYY') + ')) AND');
          qryDetVlPagRec.Sql.Add('               (OI.DATAVENCOPER    <= TO_DATE(' + QuotedStr(sDataFinalParam) + ',' + QuotedStr('DD/MM/YYYY') + ')))');
          qryDetVlPagRec.Sql.Add('           AND (((' + QuotedStr(qryCarteiraIDCARTEIRAGERENC.AsString) + ' IS NOT NULL) AND (OI.IDCARTEIRAGERENC = ' + QuotedStr(qryCarteiraIDCARTEIRAGERENC.AsString) + ')) OR                               ');
          qryDetVlPagRec.Sql.Add('               ((' + QuotedStr(qryCarteiraIDCARTEIRAGERENC.AsString) + ' IS NULL)     AND (OI.IDCARTEIRAGERENC IS NOT NULL)))                           ');
          qryDetVlPagRec.Sql.Add('           AND (OI.IDTIPOINVEST     = 2)                                                           ');
          qryDetVlPagRec.Sql.Add('           AND (OI.IDINVESTIMENTO = IV.IDINVESTIMENTO)                                             ');
          qryDetVlPagRec.Sql.Add('       )                                                                                           ');
          //Al_3
          qryDetVlPagRec.Sql.Add('ORDER BY DATAOPERACAO, NUMDOCUMENTO, DESCINVESTIMENTO, PRECOUNITOPERACAO                           ');
          qryDetVlPagRec.Open;
     end;

     // VENDA
     if QryValoresPagarReceberREG.AsFloat = 2 then
     begin
          qryDetVlPagRec.Close;
          dbgDetValoresPagarReceber2.Enabled := True;
          dbgDetValoresPagarReceber2.Visible := True;
          dbgDetValoresPagarReceber.Enabled  := False;
          dbgDetValoresPagarReceber.Visible  := False;

          qryDetVlPagRec2.Close;
          qryDetVlPagRec2.Sql.Clear;
          //Al_3
          qryDetVlPagRec2.Sql.Add('SELECT DATAOPERACAO,                                                               ');
          qryDetVlPagRec2.Sql.Add('       NUMDOCUMENTO,                                                               ');
          qryDetVlPagRec2.Sql.Add('       DESCINVESTIMENTO,                                                           ');
          qryDetVlPagRec2.Sql.Add('       QTDE,                                                                       ');
          qryDetVlPagRec2.Sql.Add('       PRECO,                                                                      ');
          qryDetVlPagRec2.Sql.Add('       VLROPERACAO                                                                 ');
          qryDetVlPagRec2.Sql.Add('  FROM (                                                                           ');
          //Al_3
          qryDetVlPagRec2.Sql.Add('        SELECT DATAOPERACAO,                                                       ');
          qryDetVlPagRec2.Sql.Add('               NUMDOCUMENTO,                                                       ');
          qryDetVlPagRec2.Sql.Add('               QTDEOPERACAO        AS QTDE,                                        ');
          qryDetVlPagRec2.Sql.Add('               PRECOUNITOPERACAO   AS PRECO,                                       ');
          qryDetVlPagRec2.Sql.Add('               IV.DESCINVESTIMENTO,                                                ');
          qryDetVlPagRec2.Sql.Add('               OI.VLROPERACAO                                                      ');
          qryDetVlPagRec2.Sql.Add('          FROM HISTCARTINV    HC,                                                  ');
          qryDetVlPagRec2.Sql.Add('               OPERACAOINVEST OI,                                                  ');
          qryDetVlPagRec2.Sql.Add('               TIPOOPERACAO   TP,                                                  ');
          qryDetVlPagRec2.Sql.Add('               INVESTIMENTO   IV                                                   ');
          qryDetVlPagRec2.Sql.Add('         WHERE OI.DATAOPERACAO <= TO_DATE(' + QuotedStr(sDataInicioParam) + ',' + QuotedStr('DD/MM/YYYY') + ')');
          qryDetVlPagRec2.Sql.Add('           AND(OI.DATAVENCOPER  > TO_DATE(' + QuotedStr(sDataInicioParam) + ',' + QuotedStr('DD/MM/YYYY') + ')');
          qryDetVlPagRec2.Sql.Add('           AND OI.DATAVENCOPER <= TO_DATE(' + QuotedStr(sDataFinalParam) + ',' + QuotedStr('DD/MM/YYYY') + '))');
          qryDetVlPagRec2.Sql.Add('           AND (((' + QuotedStr(qryCarteiraIDCARTEIRAGERENC.AsString) + ' IS NOT NULL) AND (OI.IDCARTEIRAGERENC = ' + QuotedStr(qryCarteiraIDCARTEIRAGERENC.AsString) + ')) OR ((' + QuotedStr(qryCarteiraIDCARTEIRAGERENC.AsString) + ' IS NULL) AND (OI.IDCARTEIRAGERENC IS NOT NULL)))');
          qryDetVlPagRec2.Sql.Add('           AND TP.FLGCORRET          = ' + QuotedStr('S')                           );
          qryDetVlPagRec2.Sql.Add('           AND OI.IDOPERACAODIREITO IS NULL                                        ');
          qryDetVlPagRec2.Sql.Add('           AND OI.IDTIPOINVEST       = 2                                           ');
          qryDetVlPagRec2.Sql.Add('           AND HC.TIPMOVCARTINV      = ' + QuotedStr('OPE')                         );
          qryDetVlPagRec2.Sql.Add('           AND HC.NATURMOVCARTINV    = ' + QuotedStr('D')                           );
          qryDetVlPagRec2.Sql.Add('           AND HC.IDOPERACAOINVEST   = OI.IDOPERACAOINVEST                         ');
          qryDetVlPagRec2.Sql.Add('           AND TP.IDTIPOOPERACAO     = OI.IDTIPOOPERACAO                           ');
          qryDetVlPagRec2.Sql.Add('           AND OI.IDINVESTIMENTO     = IV.IDINVESTIMENTO                           ');
          qryDetVlPagRec2.Sql.Add('       )                                                                           ');
          //Al_3
          qryDetVlPagRec2.Sql.Add('ORDER BY DATAOPERACAO, NUMDOCUMENTO, DESCINVESTIMENTO, PRECO                       ');
          qryDetVlPagRec2.Open;
     end;
  end
  else
      tbsDetPagRec.TabVisible := False;
end;

// AL_2
procedure TfrmConsCartGerenc.MontaQuery;
var
   iCount    : Integer;
   iLinha    : Integer;
   iLinhaIni : Integer;
   iLinhaFim : Integer;

begin
   {*** QryRendaVariavel ***}
   QryRendaVariavel.Sql.Clear;

   iCount := DmRelCarteiraGerenc.qryCartGerencialDet.Sql.Count;
   iLinha := 0;

   for iLinha := 0 to iCount do
   begin
        if Trim(DmRelCarteiraGerenc.qryCartGerencialDet.Sql[iLinha]) = '--- RENDA VARIAVEL ---' then
        begin
             iLinhaIni := iLinha + 1;
             Break;
        end;
   end;

   for iLinha := iLinhaIni to iCount do
   begin
        if Trim(DmRelCarteiraGerenc.qryCartGerencialDet.Sql[iLinha]) = '--- FIM RENDA VARIAVEL ---' then
        begin
             iLinhaFim := iLinha - 1;
             Break;
        end;
   end;

   for iLinha := iLinhaIni to iLinhaFim do
   begin
        QryRendaVariavel.Sql.Add(DmRelCarteiraGerenc.qryCartGerencialDet.Sql[iLinha]);
   end;

   QryRendaVariavel.Sql.Add('ORDER BY DESCINVESTIMENTO');

   QryRendaVariavel.ParamByName('DATAINI').DataType          := ftString;
   QryRendaVariavel.ParamByName('IDCARTEIRAGERENC').DataType := ftInteger;
   //Al_3
   QryRendaVariavel.ParamByName('VARGROUP').AsString         := 'A';

   //AL_4
   QryRendaVariavel.ParamByName('IDPLANPREVCTBPATR').DataType:= ftInteger;

   QryHistCaixa.Sql.Clear;

   iCount := DmRelCarteiraGerenc.qryCartGerencialDet.Sql.Count;
   iLinha := 0;

   for iLinha := 0 to iCount do
   begin
        if Trim(DmRelCarteiraGerenc.qryCartGerencialDet.Sql[iLinha]) = '--- SALDO DE CAIXA ---' then
        begin
             iLinhaIni := iLinha + 1;
             Break;
        end;
   end;

   for iLinha := iLinhaIni to iCount do
   begin
        if Trim(DmRelCarteiraGerenc.qryCartGerencialDet.Sql[iLinha]) = '--- FIM SALDO DE CAIXA ---' then
        begin
             iLinhaFim := iLinha - 1;
             Break;
        end;
   end;

   for iLinha := iLinhaIni to iLinhaFim do
   begin
        QryHistCaixa.Sql.Add(DmRelCarteiraGerenc.qryCartGerencialDet.Sql[iLinha]);
   end;

   QryHistCaixa.Sql.Add('ORDER BY DATAHISTCAIXA, IDHISTCAIXA');

   QryHistCaixa.ParamByName('DATAANTERIOR').DataType     := ftString;
   QryHistCaixa.ParamByName('DATAINI').DataType          := ftString;
   QryHistCaixa.ParamByName('IDCARTEIRAGERENC').DataType := ftInteger;
   //Al_3
   QryHistCaixa.ParamByName('VARGROUP').AsString         := 'A';

   //AL_4
   QryHistCaixa.ParamByName('IDPLANPREVCTBPATR').DataType:= ftInteger;     

   QryValoresPagarReceber.Sql.Clear;

   iCount := DmRelCarteiraGerenc.qryCartGerencialDet.Sql.Count;
   iLinha := 0;

   for iLinha := 0 to iCount do
   begin
        if Trim(DmRelCarteiraGerenc.qryCartGerencialDet.Sql[iLinha]) = '--- VALORES A PAGAR/RECEBER ---' then
        begin
             iLinhaIni := iLinha + 1;
             Break;
        end;
   end;

   for iLinha := iLinhaIni to iCount do
   begin
        if Trim(DmRelCarteiraGerenc.qryCartGerencialDet.Sql[iLinha]) = '--- FIM VALORES A PAGAR/RECEBER ---' then
        begin
             iLinhaFim := iLinha - 1;
             Break;
        end;
   end;

   for iLinha := iLinhaIni to iLinhaFim do
   begin
        QryValoresPagarReceber.Sql.Add(DmRelCarteiraGerenc.qryCartGerencialDet.Sql[iLinha]);
   end;

   QryValoresPagarReceber.Sql.Add('ORDER BY REG, DESCRICAO');

   QryValoresPagarReceber.ParamByName('DATAINI').DataType          := ftString;
   QryValoresPagarReceber.ParamByName('DATAFIM').DataType          := ftString;
   QryValoresPagarReceber.ParamByName('IDCARTEIRAGERENC').DataType := ftInteger;
   //Al_3
   QryValoresPagarReceber.ParamByName('VARGROUP').AsString         := 'A';
   //AL_4
   QryValoresPagarReceber.ParamByName('IDPLANPREVCTBPATR').DataType:= ftInteger;
end;

//AL_4
procedure TfrmConsCartGerenc.bbtnConfirmarClick(Sender: TObject);
//AL_5
Var
   sMens: String;
begin
  inherited;
  //AL_5
  sMens := '';
  If (dData.Text <> '') and
     (Not RendaVariavel.PermiteUtilizarCarteiraGerenc(dData.Date,sMens)) then
  begin
     MsgDlg(sMens,'Mensagem do Sistema', mtWarning, [mbOk],0);
     OperComum.LimpaParametros(QryRendaVariavel);
     OperComum.LimpaParametros(qryHistCaixa);
     OperComum.LimpaParametros(QryValoresPagarReceber);
     OperComum.LimpaParametros(qryDetVlPagRec);
     dData.Clear;
     dblCarteira.Clear;
     dblPlanoPatr.Clear;
     redPatrimonio.Clear;
     redQtdCotas.Clear;
     redValCota.Clear;
     edtVarDia.Clear;
     edtVarMes.Clear;
     edtVarAno.Clear;
     edtInd1Mes.Clear;
     edtInd1Ano.Clear;
     edtInd2Mes.Clear;
     edtInd2Ano.Clear;
     dblRegra1.Clear;
     dblRegra2.Clear;
     dbrSaldoAtu.Clear;
     dData.SetFocus;
     Exit;
  end
  else
  begin // Fim AL_5

     FechaQuery;

     AbreConsulta;
  end;
end;

//AL_5
procedure TfrmConsCartGerenc.dDataExit(Sender: TObject);
Var
  sMens: String;
begin
  sMens := '';
  If (dData.Text <> '') and
     (Not RendaVariavel.PermiteUtilizarCarteiraGerenc(dData.Date,sMens)) then
  begin
     MsgDlg(sMens,'Mensagem do Sistema', mtWarning, [mbOk],0);
     OperComum.LimpaParametros(QryRendaVariavel);
     OperComum.LimpaParametros(qryHistCaixa);
     OperComum.LimpaParametros(QryValoresPagarReceber);
     OperComum.LimpaParametros(qryDetVlPagRec);
     dData.Clear;
     dblCarteira.Clear;
     dblPlanoPatr.Clear;
     redPatrimonio.Clear;
     redQtdCotas.Clear;
     redValCota.Clear;
     edtVarDia.Clear;
     edtVarMes.Clear;
     edtVarAno.Clear;
     edtInd1Mes.Clear;
     edtInd1Ano.Clear;
     edtInd2Mes.Clear;
     edtInd2Ano.Clear;
     dblRegra1.Clear;
     dblRegra2.Clear;
     dbrSaldoAtu.Clear;
     dData.SetFocus;
     Exit;
  end;
  inherited;
end;

end.
