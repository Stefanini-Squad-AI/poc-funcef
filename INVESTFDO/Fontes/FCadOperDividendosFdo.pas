//******************************************************************************
// Autor    : Fabio Fagundes
// Data     : 04/07/2005
// Código   : AL_11
// Motivo   : Implementação da qryPlanPrevCtbPatr
//            Retirando ShowMessage para MsgDlg, Trim nos testes de string e CanFocus
//            no bbtnOkDet
//******************************************************************************
// Autor    : Marco Turon
// Data     : 30/05/2005
// Código   : AL_10
// Motivo   : Implementação do teste de período contabil em 3 camadas
//******************************************************************************
// Autor    : Ricardo Cristiano
// Data     : 29/04/2005
// Linha(s) : Al_9
// Motivo   : Alterado a descrição do histórico, para passar apenas o nome do fundo e o plano
//******************************************************************************
// Autor    : Fabio Fagundes
// Data     : 02/12/2004
// AL_8
// Motivo   : Acerto na exclusao
//******************************************************************************
// Autor    : Fabio Fagundes
// Data     : 30/11/2004
// AL_7
// Motivo   : Busca o Saldo de Qtd do Fundo
//******************************************************************************
// Autor    : Fabio Fagundes
// Data     : 30/11/2004
// AL_6
// Motivo   : Update no Plano,CodDocumento e PlnCodigo na OPERACAOFUNDO
//******************************************************************************
// Autor    : Fabio Fagundes
// Data     : 08/11/2004
// AL_5
// Motivo   : Acerto na transação (Voltei com a herança qryDetalhe)
//******************************************************************************
// Autor    : Fabio Fagundes
// Data     : 27/10/2004
// AL_4
// Motivo   : Passa a gravar 0,00 no Campo VLRIOF
//******************************************************************************
// Autor    : Fabio Fagundes
// Data     : 19/10/2004
// AL_3
// Motivo   : Implementacao do relatório de Operacoes e melhorias no form
//******************************************************************************
// Autor    : Fabio Fagundes
// Data     : 24/09/2004
// Motivo   : Inclusão do Tipo de Operacao para Recebimentos e melhoria de código
//******************************************************************************
// Autor    : Ricardo Cristiano
// Data     : 17/09/2004
// Motivo   : Incluido o parametro IDPLANPREVCTBPATR na qryDetalhe
//            Acerto no tabOrder do pnlControlesDet
//******************************************************************************
// Autor    : Ricardo Cristiano
// Data     : 15/09/2004
// AL_2
// Motivo   : Melhoria de Lay-out, Implementado o Campo Data de Liquidação
//******************************************************************************
// Autor    : Ricardo Cristiano
// Data     : 01/08/2004
// AL_1
// Motivo   : Tratamento de usuários qdo cliente for VALIA
//******************************************************************************

unit FCadOperDividendosFdo;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  FCadastroMDetCSInv, CmEventosCadastro, ImgList, MontaSelect, DBTables,
  IvDictio, IvMulti, IvEMulti, Db, Wwdatsrc, Wwquery, MAHlpBtn, TB97Tlbr,
  fcLabel, StdCtrls, Buttons, TB97Ctls, TB97, Grids, Wwdbigrd, Wwdbgrid,
  ComCtrls, TabControlDetalhe, ExtCtrls, wwdblook, TREdit,
  wwdbdatetimepicker, CMDateTimePicker, FPreview, uCtrlInvContab;

type
  TfrmCadOperDividendosFdo = class(TfrmCadastroMDetInv)
    qryAux: TwwQuery;
    dsInvest: TwwDataSource;
    qryInvest: TwwQuery;
    qryInvestDESCFUNDOINVEST: TStringField;
    qryInvestIDFUNDOINVEST: TFloatField;
    qryInvestIDGESTORCARTEIRA: TFloatField;
    qryInvestTRGDTINCLUSAO: TDateTimeField;
    qryInvestTRGUSERINCLUSAO: TStringField;
    qryInvestMOECODIGO: TFloatField;
    qryInvestIDCARTEIRAINVEST: TFloatField;
    qryInvestIDTIPOFUNDOINVEST: TFloatField;
    qryInvestCNPJFUNDO: TStringField;
    qryInvestSTAEXCLUSIVO: TStringField;
    qryInvestPZOCARENCIA: TFloatField;
    qryInvestPZOANIVERSARIO: TFloatField;
    qryInvestPZOLIQAPLIC: TFloatField;
    qryInvestPZOLIQRESG: TFloatField;
    qryInvestQTDDECQTD: TFloatField;
    qryInvestQTDDECVALOR: TFloatField;
    qryInvestSTAFUNDO: TStringField;
    qryInvestPZOAMORTIZACAO: TFloatField;
    qryInvestPERCTXPERFORM: TFloatField;
    qryInvestPERCTXADM: TFloatField;
    qryInvestCODFUNCETIP: TStringField;
    qryInvestSTAPROVISIONAIR: TStringField;
    qryInvestSTAPROVISIONAIOF: TStringField;
    qryInvestCONTRCETIP: TStringField;
    qryInvestDATAREFERENCIA: TStringField;
    dblInvest: TwwDBLookupCombo;
    Investimento: TLabel;
    QryOperFundo: TwwQuery;
    QryBuscaTipoOper: TwwQuery;
    QryBuscaTipoOperIDTIPOINVEST: TFloatField;
    QryBuscaTipoOperIDTIPOOPERACAO: TFloatField;
    QryBuscaTipoOperIDMERCADO: TFloatField;
    QryBuscaTipoOperDESCTIPOOPERACAO: TStringField;
    QryBuscaTipoOperNATUREZAOPERACAO: TStringField;
    QryBuscaTipoOperTIPOCUSTODIA: TStringField;
    QryBuscaTipoOperVENCIMENTO: TFloatField;
    QryBuscaTipoOperTIPCREDOR: TStringField;
    QryBuscaTipoOperFLGTRANSF: TStringField;
    QryBuscaTipoOperFLGCORRET: TStringField;
    QryBuscaTipoOperFLGORDMOVINV: TStringField;
    QryBuscaTipoOperFLGTRATAIR: TStringField;
    QryUpdParaminvest: TwwQuery;
    StringField1: TStringField;
    FloatField19: TFloatField;
    FloatField20: TFloatField;
    DateTimeField1: TDateTimeField;
    StringField2: TStringField;
    FloatField21: TFloatField;
    FloatField22: TFloatField;
    FloatField23: TFloatField;
    StringField3: TStringField;
    StringField4: TStringField;
    FloatField24: TFloatField;
    FloatField25: TFloatField;
    FloatField26: TFloatField;
    FloatField27: TFloatField;
    FloatField28: TFloatField;
    FloatField29: TFloatField;
    StringField5: TStringField;
    FloatField30: TFloatField;
    FloatField31: TFloatField;
    FloatField32: TFloatField;
    StringField6: TStringField;
    StringField7: TStringField;
    StringField8: TStringField;
    StringField9: TStringField;
    QryUpdTipoFundoInvest: TwwQuery;
    QryTipoFundoInvest: TwwQuery;
    lblDtaOper: TLabel;
    Label8: TLabel;
    Label9: TLabel;
    Label10: TLabel;
    Label11: TLabel;
    Label12: TLabel;
    dbdDta: TCMDateTimePicker;
    dbQtdCotas: TRealEdit;
    DbPuDividendo: TDBRealEdit;
    DbValorBruto: TDBRealEdit;
    DbValorIRRF: TDBRealEdit;
    DbValorLiquido: TDBRealEdit;
    Label1: TLabel;
    dbrQtdUsufruto: TDBRealEdit;
    edtValorUsufruto: TRealEdit;
    Label2: TLabel;
    dbDtaLiq: TCMDateTimePicker;
    lblDtaLiq: TLabel;
    qryTipoOper: TwwQuery;
    qryTipoOperIDTIPOINVEST: TFloatField;
    qryTipoOperIDTIPOOPERACAO: TFloatField;
    qryTipoOperIDMERCADO: TFloatField;
    qryTipoOperCODTIPDOC: TFloatField;
    qryTipoOperDESCTIPOOPERACAO: TStringField;
    qryTipoOperNATUREZAOPERACAO: TStringField;
    qryTipoOperTIPOCUSTODIA: TStringField;
    qryTipoOperVENCIMENTO: TFloatField;
    qryTipoOperFLGGERACONTAB: TFloatField;
    qryTipoOperFLGGERACAPCAR: TFloatField;
    qryTipoOperRECPAG: TStringField;
    qryTipoOperTIPCREDOR: TStringField;
    qryTipoOperFLGGERACAF: TFloatField;
    qryTipoOperFLGTRANSF: TStringField;
    qryTipoOperTRGDTINCLUSAO: TDateTimeField;
    qryTipoOperTRGUSERINCLUSAO: TStringField;
    qryTipoOperFLGCORRET: TStringField;
    qryTipoOperFLGORDMOVINV: TStringField;
    qryTipoOperIDMOTIVOBLOQUEIO: TFloatField;
    qryTipoOperFLGOPDIREITO: TStringField;
    qryTipoOperFLGAGE: TStringField;
    qryTipoOperFLGDATAEX: TStringField;
    qryTipoOperFLGDATACOM: TStringField;
    qryTipoOperFLGINVORIGEM: TStringField;
    qryTipoOperFLGPERC: TStringField;
    qryTipoOperFLGPARIDADE: TStringField;
    qryTipoOperFLGPRZBOLSA: TStringField;
    qryTipoOperFLGPRZEMP: TStringField;
    qryTipoOperFLGATADEC: TStringField;
    qryTipoOperFLGFORMAPAGREC: TStringField;
    qryTipoOperFLGDIVACAO: TStringField;
    qryTipoOperFLGINIPAG: TStringField;
    qryTipoOperFLGJUROS: TStringField;
    qryTipoOperMOTBLOQCARTORIG: TFloatField;
    qryTipoOperMOTBLOQCARTDEST: TFloatField;
    qryTipoOperTIPSALDOCARTORIG: TStringField;
    qryTipoOperTIPSALDOCARTDEST: TStringField;
    qryTipoOperFLGTRATAIR: TStringField;
    qryTipoOperSIGLATIPOOPER: TStringField;
    qryTipoOperFLGISENTOIR: TStringField;
    qryTipoOperFLGGRAVAIRLITIGIO: TStringField;
    qryTipoOperFLGOPGERENC: TStringField;
    qryTipoOperTIPOMOVTO: TStringField;
    qryTipoOperSTAATIVO: TStringField;
    qryTipoOperFLGRENTABILIDADE: TStringField;
    sbtnImprimir: TToolbarButton97;
    dblTipoOper: TwwDBLookupCombo;
    lblTipoOper: TLabel;
    qryDetalheIDOPERACAOFUNDO: TFloatField;
    qryDetalheIDCARTEIRAINVEST: TFloatField;
    qryDetalheIDPEDIDOFUNDO: TFloatField;
    qryDetalheIDTIPOINVEST: TFloatField;
    qryDetalheIDTIPOOPERACAO: TFloatField;
    qryDetalheIDFUNDOINVEST: TFloatField;
    qryDetalheDATAOPERACAO: TDateTimeField;
    qryDetalheDATALIQUIDACAO: TDateTimeField;
    qryDetalheQTDOPERACAO: TFloatField;
    qryDetalheVLROPERACAO: TFloatField;
    qryDetalheVLRCOTA: TFloatField;
    qryDetalheVLRIR: TFloatField;
    qryDetalheVLRIOF: TFloatField;
    qryDetalheVLRRENDIMENTO: TFloatField;
    qryDetalheVLRLIQUIDO: TFloatField;
    qryDetalheSTACONFIRMA: TStringField;
    qryDetalheIDOPERACAOORIGEM: TFloatField;
    qryDetalheIDPLANPREVCTBPATR: TFloatField;
    qryDetalheDATACOTIZACAO: TDateTimeField;
    qryDetalheVLRDESCONTO: TFloatField;
    qryDetalheQTDUSUFRUTO: TFloatField;
    qryDetalheDESCTIPOOPERACAO: TStringField;
    qryDetalheDESCFUNDOINVEST: TStringField;
    qryDetalhePLANPRVCONTABPATRO: TStringField;
    dblkPlanPatro: TwwDBLookupCombo;
    lblPlanPatro: TLabel;
    procedure FormActivate(Sender: TObject);
    procedure sbtnInsDetClick(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure dblInvestCloseUp(Sender: TObject; LookupTable,
      FillTable: TDataSet; modified: Boolean);
    procedure sbtnExcluiDetClick(Sender: TObject);
    procedure bbtnOkDetClick(Sender: TObject);
    procedure bbtnCancelarDetClick(Sender: TObject);
    procedure bbtnVoltarDetClick(Sender: TObject);
    procedure FormCloseQuery(Sender: TObject; var CanClose: Boolean);
    procedure FormPaint(Sender: TObject);
    procedure DbPuDividendoExit(Sender: TObject);
    procedure DbValorBrutoExit(Sender: TObject);
    procedure sbtnProcurarClick(Sender: TObject);
    procedure dbrQtdUsufrutoExit(Sender: TObject);
    procedure dbQtdCotasExit(Sender: TObject);
    procedure dblTipoOperCloseUp(Sender: TObject; LookupTable,
      FillTable: TDataSet; modified: Boolean);
    procedure sbtnImprimirClick(Sender: TObject);
    procedure dbdDtaExit(Sender: TObject);
    procedure dblInvestExit(Sender: TObject);
    procedure dblTipoOperExit(Sender: TObject);
    procedure dblkPlanPatroCloseUp(Sender: TObject; LookupTable,
      FillTable: TDataSet; modified: Boolean);
    procedure dblkPlanPatroExit(Sender: TObject);
  private
    bModal: Boolean;
    procedure StatusGeral;
    procedure StatusInclui;
    // AL_10
//    procedure StatusAltera;
    Procedure Decimais;
    Procedure CalculaValor;
    procedure AtualizaFundoInvest;
    procedure SetModal(bMod: Boolean);    
  published
    { Published declarations }
     Property fModal: boolean read bModal write SetModal;
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmCadOperDividendosFdo: TfrmCadOperDividendosFdo;
  fVlrRendimento : Double;
  //AL_7
  fSdoQtdCotas : Double;
  //AL_11
  dDataOper, dDataVenc : String;
  fPUDividendo : Double;
implementation

uses UBibliotecaInvest, UFundoComum, UDataBase, UOperComum, UmensErro,
     UImpostos, UDiasUteisInv, DBaseDados, uSistema, FDMRelOperRecebtoFdo,
  dFundoComum;

{$R *.DFM}

procedure TfrmCadOperDividendosFdo.FormActivate(Sender: TObject);
begin
  inherited;
  PnlFundo.Enabled := True;
  WindowState      := wsMaximized;
end;

procedure TfrmCadOperDividendosFdo.sbtnInsDetClick(Sender: TObject);
begin
  inherited;
   //AL_11 Ini
{   qryDetalhe.Insert;
   qryDetalheDATAOPERACAO.Clear;
   qryDetalheDATALIQUIDACAO.Clear;
   qryDetalheQTDUSUFRUTO.Clear;
   qryDetalheVLRCOTA.Clear;
   qryDetalheVLROPERACAO.Clear;
   qryDetalheVLRIR.Clear;
   qryDetalheVLRLIQUIDO.Clear; }

   dbQtdCotas.Clear;

   if Trim(dDataOper) <> '' then
     qryDetalheDATAOPERACAO.AsDateTime := StrToDate(dDataOper);
   if Trim(dDataVenc) <> '' then
      qryDetalheDATALIQUIDACAO.AsDateTime :=  StrToDate(dDataVenc);
   if Trim(FloatToStr(fPUDividendo)) <> '' then
      qryDetalheVLRCOTA.AsFloat :=  fPUDividendo;
   StatusInclui;
   if dbdDta.Canfocus then
      dbdDta.setfocus;
end;

procedure TfrmCadOperDividendosFdo.StatusGeral;
begin
   dblInvest.Enabled     := True;
   dblTipoOper.Enabled   := True;
   dblkPlanPatro.Enabled := True;
   dbdDta.Enabled        := True;
   sbtnProcurar.Enabled  := True;

   if Trim(dblInvest.Text) = '' then
   begin
      sbtnInsDet.Enabled := False;
      sbtnAltDet.Enabled := False;
      sbtnExcluiDet.Enabled := False;
      //AL_11
      //dbgrdDet.Enabled := False;
   end
   else if Trim(dblTipoOper.Text) = '' then
   begin
      sbtnInsDet.Enabled := False;
      sbtnAltDet.Enabled := False;
      sbtnExcluiDet.Enabled := False;
      //AL_11
      //dbgrdDet.Enabled := False;
   end
   else if Trim(dblkPlanPatro.Text) = '' then
   begin
      sbtnInsDet.Enabled := False;
      sbtnAltDet.Enabled := False;
      sbtnExcluiDet.Enabled := False;
      //AL_11
      //dbgrdDet.Enabled := False;
   end
   else
   begin
      if qryDetalhe.IsEmpty then
      begin
         sbtnInsDet.Enabled := True;
         sbtnAltDet.Enabled := False;
         sbtnExcluiDet.Enabled := False;
         //AL_11
         //dbgrdDet.Enabled := False;
      end
      else
      begin
         sbtnInsDet.Enabled := True;
         sbtnAltDet.Enabled := True;
         sbtnExcluiDet.Enabled := True;
         //AL_11
         //dbgrdDet.Enabled := True;
      end;
   end;
   bbtnOkDet.Enabled := False;
   bbtnCancelarDet.Enabled := False;
//   bbtnVoltarDet.Enabled := False;
   bbtnConfirmar.Enabled := False;
   bbtnCancelar.Enabled := False;
end;

procedure TfrmCadOperDividendosFdo.StatusInclui;
begin
   sbtnProcurar.Enabled  := False;
   dblInvest.Enabled     := False;
   dblTipoOper.Enabled   := False;
   dblkPlanPatro.Enabled := False;

   sbtnAltDet.Enabled    := False;
   sbtnExcluiDet.Enabled := False;

   bbtnOkDet.Enabled       := True;
   bbtnCancelarDet.Enabled := True;
   bbtnVoltarDet.Enabled   := True;
end;

// AL_10
{procedure TfrmCadOperDividendosFdo.StatusAltera;
begin
   sbtnProcurar.Enabled    := False;
   dblInvest.Enabled       := False;
   dblTipoOper.Enabled := False;

   sbtnInsDet.Enabled      := False;
   sbtnExcluiDet.Enabled   := False;

   bbtnOkDet.Enabled       := True;
   bbtnCancelarDet.Enabled := True;
   bbtnVoltarDet.Enabled   := True;
end; }

procedure TfrmCadOperDividendosFdo.FormShow(Sender: TObject);
begin
  inherited;
  //AL_11 Ini
  DMRelOperRecebtoFdo.qryPlanPrevCtbPatr.Open;

  OperComum.LimpaParametros(qryTipoOper);
  qryTipoOper.Open;
  //AL_11
  //MontaSelect.Filtro.Add('OPERACAOFUNDO.IDPLANPREVCTBPATR = '+ IntToStr(iPlanPrevCtbPatro));

  qryInvest.Close;
  qryInvest.ParamByName('IDTIPOINVEST').AsInteger := iTipoInvestUsu;
  qryInvest.Open;

  OperComum.LimpaParametros(DMRelOperRecebtoFdo.qryOperRecebtoFdo);
  //AL_11 Ini
  if Trim(dblkPlanPatro.Text) <> '' then
     DMRelOperRecebtoFdo.qryOperRecebtoFdo.ParamByName('IDPLANPREVCTBPATR').asInteger := DMRelOperRecebtoFdo.qryPlanPrevCtbPatrIDPLANPREVCTBPATR.AsInteger;
  //AL_11 Fim
  DMRelOperRecebtoFdo.qryOperRecebtoFdo.Open;

  OperComum.LimpaParametros(qryDetalhe);
  //AL_11 Ini
  if Trim(dblkPlanPatro.Text) <> '' then
     qryDetalhe.ParamByName('IDPLANPREVCTBPATR').asInteger := DMRelOperRecebtoFdo.qryPlanPrevCtbPatrIDPLANPREVCTBPATR.AsInteger;
  //AL_11 Fim
  qryDetalhe.Open;
//  qryDetalhe.First;
  if qryDetalhe.Recordcount <> 0 then
     sbtnImprimir.Enabled := True
  else
     sbtnImprimir.Enabled := False;

  dbgrdDet.BringToFront;

  // Carrega quantidade de casas decimais
  Decimais;

  // Define o status dos controles do form
  StatusGeral;
end;

Procedure TfrmCadOperDividendosFdo.Decimais;
var tmpQry : TQuery;
begin
   tmpQry := TQuery.Create(Self);
   tmpQry.DatabaseName := 'BaseDados';
   tmpQry.sql.Add('SELECT MAX(QTDDECQTD) AS DECIMAIS FROM FUNDOINVEST');
   tmpQry.Open;

   if tmpQry.RecordCount > 0 then
      dbQtdCotas.DecDigits := tmpQry.FieldByName('DECIMAIS').AsInteger
   else
      dbQtdCotas.DecDigits := 0;

   tmpQry.Free;
end;

procedure TfrmCadOperDividendosFdo.dblInvestCloseUp(Sender: TObject;
 LookupTable, FillTable: TDataSet; modified: Boolean);
begin
   AtualizaFundoInvest;
end;

procedure TfrmCadOperDividendosFdo.AtualizaFundoInvest;
var x: integer;
    wDisplay: String;
begin
//   if dblInvest.lookupvalue <> '' then
//   begin
      OperComum.LimpaParametros(DMRelOperRecebtoFdo.qryOperRecebtoFdo);
      if Trim(dblInvest.Text) <> '' then
         DMRelOperRecebtoFdo.qryOperRecebtoFdo.ParambyName('IDFUNDOINVEST').asInteger  := StrToInt(dblInvest.LookupValue);
      if Trim(dblTipoOper.Text) <> '' then
         DMRelOperRecebtoFdo.qryOperRecebtoFdo.ParamByName('IDTIPOOPERACAO').asInteger := QryTipoOperIDTIPOOPERACAO.AsInteger;
      //AL_11 Ini
      if Trim(dblkPlanPatro.Text) <> '' then
         DMRelOperRecebtoFdo.qryOperRecebtoFdo.ParamByName('IDPLANPREVCTBPATR').asInteger := DMRelOperRecebtoFdo.qryPlanPrevCtbPatrIDPLANPREVCTBPATR.AsInteger;
      //AL_11 Fim
      DMRelOperRecebtoFdo.qryOperRecebtoFdo.Open;

      OperComum.LimpaParametros(qryDetalhe);
      //AL_11 Ini
      if Trim(dblInvest.Text) <> '' then
         qryDetalhe.ParambyName('IDFUNDOINVEST').asInteger  := StrToInt(dblInvest.LookupValue);
      if Trim(dblTipoOper.Text) <> '' then
         qryDetalhe.ParamByName('IDTIPOOPERACAO').asInteger := QryTipoOperIDTIPOOPERACAO.AsInteger;
      if Trim(dblkPlanPatro.Text) <> '' then
         qryDetalhe.ParamByName('IDPLANPREVCTBPATR').asInteger := DMRelOperRecebtoFdo.qryPlanPrevCtbPatrIDPLANPREVCTBPATR.AsInteger;
      //AL_11 Fim
      qryDetalhe.Open;

      if qryDetalhe.Recordcount <> 0 then
         sbtnImprimir.Enabled := True
      else
         sbtnImprimir.Enabled := False;

      sbtnInsDet.Enabled    := True;
      sbtnAltDet.Enabled    := True;
      sbtnExcluiDet.Enabled := True;
      dblInvest.Enabled     := True;
      dblTipoOper.Enabled   := True;
      dblkPlanPatro.Enabled := True;

//      dsOperRecebtoFdo
      case dsDet.State of
           dsInsert : dbdDta.SetFocus;
      end;

      // Altera Formato do Valor da Cota
      dbQtdCotas.DecDigits   := QryInvest.FieldByName('QTDDECQTD').AsInteger;
      wDisplay := '#,##0.';
      for x := 1 to dbQtdCotas.DecDigits do
          wDisplay := wDisplay + '0';
      qryDetalheQTDOPERACAO.DisplayFormat := wDisplay;

//   end;
   // Define o status dos controles do form
   StatusGeral;
end;

procedure TfrmCadOperDividendosFdo.sbtnExcluiDetClick(Sender: TObject);
Var
   wStr : String;
begin
 if (not qryDetalhe.IsEmpty) then
 begin
    // AL_10 - Inicio
    if not CtrlInvContab.TestaPeriodo(qryDetalheDATAOPERACAO.AsString) then
    begin
       MsgDlg(CtrlInvContab.MessageInfo, 'Mensagem do Sistema', mtWarning, [mbOk], 0);
       Exit;
    end;

    If MsgDlg('Confirma Exclusão ?','Mensagem ',mtInformation,
             [mbYes, mbNo],0) = mrNo  Then
       Exit;

    if not dtmBaseDados.dbBaseDados.InTransaction then
       dtmBaseDados.dbBaseDados.StartTransaction;

    //AL_8 Ini
    OperComum.LimpaParametros(QryOperFundo);
    QryOperFundo.ParamByName('IDOPERACAOFUNDO').AsInteger :=
                        qryDetalhe.FieldByName('IDOPERACAOFUNDO').AsInteger;
    QryOperFundo.Open;

    If Not QryOperFundo.IsEmpty Then
    begin
       If Not ProcExcluiFundo(QryOperFundo.FieldByName('CODDOCUMENTO').AsInteger,
                              QryOperFundo.FieldByName('PLNCODIGO').AsInteger,
                              QryOperFundo.FieldByName('PLANO').AsInteger,
                              QryOperFundo.FieldByName('IDTIPOINVEST').AsInteger,
                              QryOperFundo.FieldByName('DATAOPERACAO').AsDateTime,
                              True) Then
       Begin
          If dtmBaseDados.dbBaseDados.InTransaction then
             dtmBaseDados.dbBaseDados.Rollback;
          QryOperFundo.Close;
          Abort;
       End;
    End;
    QryOperFundo.Close;
    //AL_8 Fim

    wStr :=
    'DELETE FROM IRLITIGIO   '+
    'WHERE IDOPERACAOFUNDO = '+ qryDetalhe.FieldByName('IDOPERACAOFUNDO').AsString;

    If Not ExecutaQuery(QryAux,wStr) Then
    Begin
       MsgDlg('Não foi possível excluir o IR Litigio.','Erro',mtError,[mbOk],0);
       QryAux.Close;
       Abort;
    End;
    QryAux.Close;

    If Not ExecutaQuery(QryAux,'DELETE FROM HISTFUNDO WHERE IDOPERACAOFUNDO = '+
                        qryDetalhe.FieldByName('IDOPERACAOFUNDO').AsString) Then
    Begin
       MsgDlg('Não foi possível excluir o Histórico da Operação.','Erro',mtError,[mbOk],0);
       QryAux.Close;
       Abort;
    End;
    //AL_3
    If Not ExecutaQuery(QryAux,'DELETE FROM OPERACAOFUNDO WHERE IDOPERACAOFUNDO = '+
                        qryDetalhe.FieldByName('IDOPERACAOFUNDO').AsString) Then
    Begin
       MsgDlg('Não foi possível excluir a Operação.','Erro',mtError,[mbOk],0);
       QryAux.Close;
       Abort;
    End;

    QryAux.Close;

//    inherited;

    If dtmBaseDados.dbBaseDados.InTransaction then
       dtmBaseDados.dbBaseDados.Commit;

    OperComum.LimpaParametros(DMRelOperRecebtoFdo.qryOperRecebtoFdo);
    //AL_11 Ini
    if Trim(dblInvest.Text) <> '' then
       DMRelOperRecebtoFdo.qryOperRecebtoFdo.ParambyName('IDFUNDOINVEST').asInteger  := StrToInt(dblInvest.LookupValue);
    if Trim(dblTipoOper.Text) <> '' then
       DMRelOperRecebtoFdo.qryOperRecebtoFdo.ParamByName('IDTIPOOPERACAO').asInteger := QryTipoOperIDTIPOOPERACAO.AsInteger;
    if Trim(dblkPlanPatro.Text) <> '' then
       DMRelOperRecebtoFdo.qryOperRecebtoFdo.ParamByName('IDPLANPREVCTBPATR').asInteger := DMRelOperRecebtoFdo.qryPlanPrevCtbPatrIDPLANPREVCTBPATR.AsInteger;
    //AL_11 Fim
    DMRelOperRecebtoFdo.qryOperRecebtoFdo.Open;

    OperComum.LimpaParametros(qryDetalhe);
    //AL_11 Ini
    if Trim(dblInvest.Text) <> '' then
       qryDetalhe.ParambyName('IDFUNDOINVEST').asInteger  := StrToInt(dblInvest.LookupValue);
    if Trim(dblTipoOper.Text) <> '' then
       qryDetalhe.ParamByName('IDTIPOOPERACAO').asInteger := QryTipoOperIDTIPOOPERACAO.AsInteger;
    if Trim(dblkPlanPatro.Text) <> '' then
       qryDetalhe.ParamByName('IDPLANPREVCTBPATR').asInteger := DMRelOperRecebtoFdo.qryPlanPrevCtbPatrIDPLANPREVCTBPATR.AsInteger;
    //AL_11 Fim
    qryDetalhe.Open;
//    qryDetalhe.First;
    if qryDetalhe.Recordcount <> 0 then
       sbtnImprimir.Enabled := True
    else
       sbtnImprimir.Enabled := False;

 end;
 StatusGeral;
end;

procedure TfrmCadOperDividendosFdo.bbtnOkDetClick(Sender: TObject);
//AL_17
Var
sMens: String;
Var
  iIdForCli, iPlanilha, iDocumento, iPlano, I : Integer;
  wDataVenc : TDateTime;
  fVlrCustoAcoes, fVlrVarAcoes : Currency;
begin
  fVlrCustoAcoes := 0;
  fVlrVarAcoes   := 0;

  //AL_11 Ini
  if Trim(dbdDta.Text) = '' then
  begin
     MsgDlg('O Campo DATA deve ser preenchido!', 'Mensagem do Sistema', mtWarning, [mbOk], 0);
     if dbdDta.CanFocus then
        dbdDta.SetFocus;
     Exit;
  end;
  //AL_11 Fim

  // AL_10 - Inicio
  if not CtrlInvContab.TestaPeriodo(dbdDta.Text) then
  begin
     MsgDlg(CtrlInvContab.MessageInfo, 'Mensagem do Sistema', mtWarning, [mbOk], 0);
     if dbdDta.CanFocus then
        dbdDta.SetFocus;
     Exit;
  end;

  if Trim(dbQtdCotas.Text) = '' then
  begin
     MsgDlg('O Campo Quantidade de Cotas deve ser preenchido!', 'Mensagem do Sistema', mtWarning, [mbOk], 0);
     if dbQtdCotas.CanFocus then
        dbQtdCotas.SetFocus;
     Exit;
  end;

  if Trim(DbPuDividendo.Text) = '' then
  begin
     MsgDlg('O Campo PU de Dividendos deve ser preenchido!', 'Mensagem do Sistema', mtWarning, [mbOk], 0);
     if DbPuDividendo.CanFocus then
        DbPuDividendo.SetFocus;
     Exit;
  end;

  if Trim(DbValorBruto.Text) = '' then
  begin
     MsgDlg('O Campo Valor Bruto deve ser preenchido!', 'Mensagem do Sistema', mtWarning, [mbOk], 0);
     if DbValorBruto.CanFocus then
        DbValorBruto.SetFocus;
     Exit;
  end;

  if Trim(DbValorIRRF.Text) = '' then
  begin
     MsgDlg('O Campo Valor do IRRF deve ser preenchido!', 'Mensagem do Sistema', mtWarning, [mbOk], 0);
     if DbValorIRRF.CanFocus then
        DbValorIRRF.SetFocus;
     Exit;
  end;

  Try
    if not dtmBaseDados.dbBaseDados.InTransaction then
       dtmBaseDados.dbBaseDados.StartTransaction;

    if dsDet.DataSet.State in [dsInsert] then
       if qryDetalhe.FieldByName('IDOPERACAOFUNDO').AsInteger <=0 Then
          qryDetalhe.FieldByName('IDOPERACAOFUNDO').AsInteger := LeUltRegistro(nil,'OPERACAOFUNDO');

    qryDetalhe.FieldByName('IDFUNDOINVEST').Value         := StrToInt(dblInvest.LookupValue);

    qryDetalhe.FieldByName('IDCARTEIRAINVEST').AsInteger  := qryInvest.FieldByName('IDCARTEIRAINVEST').AsInteger;

    //AL_11 Ini
    qryDetalhe.FieldByName('IDPLANPREVCTBPATR').asInteger := DMRelOperRecebtoFdo.qryPlanPrevCtbPatrIDPLANPREVCTBPATR.AsInteger;

    qryDetalhe.FieldByName('IDTIPOINVEST').AsInteger      := iTipoInvestUsu;

    qryDetalhe.FieldByName('IDTIPOOPERACAO').AsInteger    := QryTipoOper.FieldByName('IDTIPOOPERACAO').AsInteger;

    I:=1;
    wDataVenc:=StrToDate(dbdDta.Text);

    // AL_2
{    While I<= QryAux.FieldByName('VENCIMENTO').AsInteger Do
    Begin
       wDataVenc := wDataVenc+1;
       While not DiasUteisInv.DiaUtil(wDataVenc,-1,1,'',True,False,False) Do
         wDataVenc := wDataVenc+1;   // Achar o próximo dia útil
       I:=I+1;
    End;}

    qryDetalhe.FieldByName('DATALIQUIDACAO').AsDateTime := StrToDate(dbDtaLiq.Text); // wDataVenc;

    qryDetalhe.FieldByName('VLRCOTA').AsFloat      := DbPuDividendo.Value;

    qryDetalhe.FieldByName('QTDOPERACAO').AsFloat  := dbQtdCotas.Value;
    //Alt_4
    qryDetalhe.FieldByName('VLRIOF').AsFloat       := 0;

    QryAux.Close;

    bbtnConfirmar.Enabled := True;

    pnlControlesDet.SendToBack;

    qryDetalhe.post;
    qryDetalhe.CommitUpdates;

    iPlanilha  := -1;
    iDocumento := -1;
    iPlano     := -1;

    iIdForCli := OperComum.BuscaForCli(qryDetalheIDTIPOINVEST.AsInteger,
                     qryInvestIDGESTORCARTEIRA.AsInteger,
                     qryDetalheIDTIPOOPERACAO.AsInteger, pRPI.IDTIPOCLIENTEEMI);

    //AL_17
    If Not AlimentaFundo(qryDetalheIDTIPOINVEST.AsInteger,
        qryDetalheIDTIPOOPERACAO.AsInteger,
        qryDetalheIDCARTEIRAINVEST.AsInteger,
        qryDetalheIDFUNDOINVEST.AsInteger,
        iPlanoPrevContab,
        iPatrocinadora,
        qryDetalheIDOPERACAOFUNDO.AsInteger,
        qryDetalheIDOPERACAOFUNDO.AsInteger,
        qryInvestQTDDECQTD.AsInteger,
        qryInvestIDTIPOFUNDOINVEST.AsInteger,
        iIdForCli,
        qryDetalheDATAOPERACAO.AsDateTime,
        qryDetalheDATAOPERACAO.AsDateTime,
        qryDetalheDATALIQUIDACAO.AsDateTime,
        qryDetalheQTDOPERACAO.AsFloat, qryDetalheVLRCOTA.AsFloat,
        qryDetalheVLROPERACAO.AsFloat,
        qryDetalheVLRIR.AsFloat,
        0{IOF},
        'R',
        Trim(QryTipoOperDESCTIPOOPERACAO.AsString)+' / '+
        qryInvestDESCFUNDOINVEST.AsString, 'OPE', True,
        iPlanPrevCtbPatro,-1,-1,
        qryDetalheVLRRENDIMENTO.AsFloat, sMens) Then
        Raise Exception.Create('Ocorreu um erro na Gravação da Operação.');

    If qryDetalhe.FieldByName('VLRIR').AsFloat > 0 Then
    begin
       if not Impostos.GravaIrLitigio(qryDetalheIDTIPOINVEST.AsInteger,
                      qryDetalheDATAOPERACAO.AsDateTime,
                      -1,
                      'IRRF (LIMINAR)/DIVIDENDOS - '+qryInvestDESCFUNDOINVEST.AsString,
                      -1, iPlanoPrevContab, iPlanPrevCtbPatro,
                      qryDetalhe.FieldByName('VLRIR').AsFloat,
                      fVlrRendimento,-1,qryDetalheIDOPERACAOFUNDO.AsInteger) then
          Raise Exception.Create('Ocorreu um erro ao Gravar o IR Litígio');
    end;

    ExecutaQuery(QryAux,
          'UPDATE OPERACAOFUNDO SET STACONFIRMA = ''S'' WHERE '+
          '(IDOPERACAOFUNDO   = '''+
                IntToStr(qryDetalheIDOPERACAOFUNDO.AsInteger)  +''')');

    QryAux.Close;

    //Al_9 - Ricardo - 29/04/2005
    If Not ContabilizacaoFinanceiro(iPlano, iPlanilha, iDocumento,
            qryDetalhe.FieldByName('IDTIPOOPERACAO').AsInteger,
            qryDetalhe.FieldByName('IDTIPOINVEST').AsInteger,
            qryDetalhe.FieldByName('IDCARTEIRAINVEST').AsInteger,
            QryInvest.FieldByName('IDTIPOFUNDOINVEST').AsInteger,
            iIdForCli,
            qryDetalhe.FieldByName('IDFUNDOINVEST').AsInteger,
            qryDetalhe.FieldByName('DATAOPERACAO').AsDateTime,
            qryDetalhe.FieldByName('DATALIQUIDACAO').AsDateTime,
            'OPE', 'A',
            qryInvestDESCFUNDOINVEST.AsString+' / '+sPlanPrevCtbPatro,
            True,
            qryDetalhe.FieldByName('VLRLIQUIDO').AsFloat,
            0, 0, 0, 0, fVlrCustoAcoes, fVlrVarAcoes, -1, edtValorUsufruto.Value) Then
       Raise Exception.Create('Ocorreu um erro na Contabilização.');

       //Al_6
       // Update no Plano,CodDocumento e PlnCodigo na OPERACAOFUNDO
       With DmFundoComum.QryUpdOpeFinCtb Do
       Begin
         Opercomum.LimpaParametros(DmFundoComum.QryUpdOpeFinCtb);
         ParamByName('IDOPERACAOFUNDO').AsInteger   := qryDetalheIDOPERACAOFUNDO.AsInteger;
         ParamByName('PLANO').AsInteger             := iPlano;
         ParamByName('PLNCODIGO').AsInteger         := iPlanilha;
         ParamByName('CODDOCUMENTO').AsInteger      := iDocumento;
         ExecSQL;
       End;

//    inherited;
    //AL_11 Ini
    if Trim(DateToStr(dbdDta.Date)) <> '' then // Para segurar o conteúdo das variáveis.
    begin
       dDataOper    := dbdDta.Text;
       dDataVenc    := dbDtaLiq.Text;
       fPUDividendo := DbPuDividendo.Value;
    end;
    //AL_11 Fim

    dtmBaseDados.dbBaseDados.Commit;

    StatusGeral;

  Except
    on E:Exception do
    begin
       MsgDlg('Erro ao Gravar a Operação.'#13 + 'Com a Mensagem:'#13 + E.Message,'Erro',mtError,[mbOk],0);
       dtmBaseDados.dbBaseDados.Rollback;
       bbtnCancelarDet.Click;
       dblInvest.SetFocus;
    end;
  End;

  OperComum.LimpaParametros(DMRelOperRecebtoFdo.qryOperRecebtoFdo);
  //AL_11 Ini
  if Trim(dblkPlanPatro.Text) <> '' then
     DMRelOperRecebtoFdo.qryOperRecebtoFdo.ParamByName('IDPLANPREVCTBPATR').asInteger := DMRelOperRecebtoFdo.qryPlanPrevCtbPatrIDPLANPREVCTBPATR.AsInteger;
  //AL_11 Fim
  if Trim(dblInvest.Text) <> '' then
     DMRelOperRecebtoFdo.qryOperRecebtoFdo.ParambyName('IDFUNDOINVEST').asInteger     := StrToInt(dblInvest.LookupValue);
  if Trim(dblTipoOper.Text) <> '' then
     DMRelOperRecebtoFdo.qryOperRecebtoFdo.ParamByName('IDTIPOOPERACAO').asInteger := QryTipoOperIDTIPOOPERACAO.AsInteger;
  DMRelOperRecebtoFdo.qryOperRecebtoFdo.Open;

  OperComum.LimpaParametros(qryDetalhe);
  //AL_11 Ini
  if Trim(dblkPlanPatro.Text) <> '' then
     qryDetalhe.ParamByName('IDPLANPREVCTBPATR').asInteger := DMRelOperRecebtoFdo.qryPlanPrevCtbPatrIDPLANPREVCTBPATR.AsInteger;
  //AL_11 Fim
  if Trim(dblInvest.Text) <> '' then
     qryDetalhe.ParambyName('IDFUNDOINVEST').asInteger     := StrToInt(dblInvest.LookupValue);
  if Trim(dblTipoOper.Text) <> '' then
     qryDetalhe.ParamByName('IDTIPOOPERACAO').asInteger := QryTipoOperIDTIPOOPERACAO.AsInteger;
  qryDetalhe.Open;
//  qryDetalhe.First;
  if qryDetalhe.Recordcount <> 0 then
     sbtnImprimir.Enabled := True
  else
     sbtnImprimir.Enabled := False;
  //AL_11
  bbtnVoltarDet.Click;
end;

procedure TfrmCadOperDividendosFdo.bbtnCancelarDetClick(Sender: TObject);
begin
  inherited;
  StatusGeral;
end;

procedure TfrmCadOperDividendosFdo.bbtnVoltarDetClick(Sender: TObject);
begin
  inherited;
   StatusGeral;
end;

procedure TfrmCadOperDividendosFdo.FormCloseQuery(Sender: TObject;
  var CanClose: Boolean);
begin
  inherited;
  QryTipoOper.Close;
  QryAux.Close;
  qryInvest.Close;
  //AL_11 Ini
  DMRelOperRecebtoFdo.qryPlanPrevCtbPatr.Close;
end;

procedure TfrmCadOperDividendosFdo.FormPaint(Sender: TObject);
begin
  inherited;
   PnlFundo.Enabled :=True;
   pnlMestre.Enabled:=True;
end;

procedure TfrmCadOperDividendosFdo.DbPuDividendoExit(Sender: TObject);
begin
   inherited;
   CalculaValor;
end;

procedure TfrmCadOperDividendosFdo.DbValorBrutoExit(Sender: TObject);
begin
  inherited;
   fVlrRendimento := 0;
   DbValorIRRF.Value := Impostos.CalculaIr(iTipoInvestUsu,
                         0{Investiment}, 0{Carteira}, 0{CARTEIRAGERENC}, 0{TipoOperacao}, 0{Mercado}, ''{Lote},
                         dbdDta.Date, dbdDta.Date,
                         0,
                         DbValorBruto.Value, 0,
                         'S',
                         QryTipoOper.FieldByName('FLGTRATAIR').AsString,
                         fVlrRendimento);

   DbValorLiquido.Value := DbValorBruto.Value;
end;

procedure TfrmCadOperDividendosFdo.sbtnProcurarClick(Sender: TObject);
var x: Integer;
    wDisplay: String;
begin

  inherited;

  PnlFundo.Enabled :=True;
  pnlMestre.Enabled:=True;

  sbtnInsDet.Enabled    := True;
  sbtnAltDet.Enabled    := True;
  sbtnExcluiDet.Enabled := True;
  dblInvest.Enabled     := True;
  dblTipoOper.Enabled   := True;
  dblkPlanPatro.Enabled := True;

  if MontaSelect.RetornouValor then
  begin
     dblInvest.LookupValue := MontaSelect.ValoresChave[0];
     dblInvest.PerformSearch;
     OperComum.LimpaParametros(DMRelOperRecebtoFdo.qryOperRecebtoFdo);
     //AL_11 Ini
     if Trim(dblkPlanPatro.Text) <> '' then
        DMRelOperRecebtoFdo.qryOperRecebtoFdo.ParamByName('IDPLANPREVCTBPATR').asInteger := DMRelOperRecebtoFdo.qryPlanPrevCtbPatrIDPLANPREVCTBPATR.AsInteger;
     //AL_11 Fim
     DMRelOperRecebtoFdo.qryOperRecebtoFdo.ParambyName('IDFUNDOINVEST').asInteger  := StrToInt(montaSelect.ValoresChave[0]);
     DMRelOperRecebtoFdo.qryOperRecebtoFdo.ParamByName('IDTIPOOPERACAO').asInteger := StrToInt(montaSelect.ValoresChave[1]);
     DMRelOperRecebtoFdo.qryOperRecebtoFdo.Open;

     OperComum.LimpaParametros(qryDetalhe);
     //AL_11 Ini
     if Trim(dblkPlanPatro.Text) <> '' then
        qryDetalhe.ParamByName('IDPLANPREVCTBPATR').asInteger := DMRelOperRecebtoFdo.qryPlanPrevCtbPatrIDPLANPREVCTBPATR.AsInteger;
     //AL_11 Fim

     qryDetalhe.ParambyName('IDFUNDOINVEST').asInteger  := StrToInt(montaSelect.ValoresChave[0]);
     qryDetalhe.ParamByName('IDTIPOOPERACAO').asInteger := StrToInt(montaSelect.ValoresChave[1]);
     qryDetalhe.Open;
//     qryDetalhe.First;
     if qryDetalhe.Recordcount <> 0 then
     begin
        // AL_3
        sbtnImprimir.Enabled := True;
        qryDetalhe.Locate('IDOPERACAOFUNDO',MontaSelect.ValoresChave[2],[]);
     end
     else
        sbtnImprimir.Enabled := False;

     dbQtdCotas.DecDigits   := QryInvest.FieldByName('QTDDECQTD').AsInteger;
     wDisplay := '#,##0.';
     for x := 1 to dbQtdCotas.DecDigits do
         wDisplay := wDisplay + '0';
     qryDetalheQTDOPERACAO.DisplayFormat := wDisplay;
  end;

  // Define o status dos controles do form
  StatusGeral;
end;

procedure TfrmCadOperDividendosFdo.dbrQtdUsufrutoExit(Sender: TObject);
begin
   inherited;
   CalculaValor;
end;

procedure TfrmCadOperDividendosFdo.dbQtdCotasExit(Sender: TObject);
begin
   inherited;
   CalculaValor;
end;

procedure TfrmCadOperDividendosFdo.CalculaValor;
begin
   DbValorBruto.Value := OperComum.Round((dbQtdCotas.Value - dbrQtdUsufruto.Value)*DbPuDividendo.Value,2);
   edtValorUsufruto.Value := OperComum.Round(dbrQtdUsufruto.Value * DbPuDividendo.Value,2);
   DbValorBrutoExit(Self);
end;

procedure TfrmCadOperDividendosFdo.dblTipoOperCloseUp(Sender: TObject;
  LookupTable, FillTable: TDataSet; modified: Boolean);
begin
  inherited;
   AtualizaFundoInvest;
end;

procedure TfrmCadOperDividendosFdo.sbtnImprimirClick(Sender: TObject);
begin
  inherited;
   if not DMRelOperRecebtoFdo.qryOperRecebtoFdo.IsEmpty then
   begin
      DMRelOperRecebtoFdo.qryOperRecebtoFdo.DisableControls;
      DMRelOperRecebtoFdo.qryOperRecebtoFdo.First;
      DMRelOperRecebtoFdo.lblDtaFin.Caption := DateToStr(DMRelOperRecebtoFdo.qryOperRecebtoFdoDATAOPERACAO.AsDateTime);
      while not DMRelOperRecebtoFdo.qryOperRecebtoFdo.EOF do
      begin
         DMRelOperRecebtoFdo.lblDtaIni.Caption := DateToStr(DMRelOperRecebtoFdo.qryOperRecebtoFdoDATAOPERACAO.AsDateTime);
         DMRelOperRecebtoFdo.qryOperRecebtoFdo.Next;
      end;
   end;

   if not bModal then
      TFrmPreview.CreateModalPreview(Application,
                                     DMRelOperRecebtoFdo.rptOperRecebtoFdo,
                                     DMRelOperRecebtoFdo.rptOperRecebtoFdo.PrinterSetup.DocumentName)
   else
      DMRelOperRecebtoFdo.rptOperRecebtoFdo.PrintToDevices;

   if bModal then
      bbtnSair.Click;
end;

procedure TfrmCadOperDividendosFdo.SetModal(bMod: Boolean);
begin
   bModal := bMod;
end;

procedure TfrmCadOperDividendosFdo.dbdDtaExit(Sender: TObject);
//AL_7
var fNull, fSdoQtdCotas : Double;
    sDescFundo  : String;
    //AL_11
    iPlano : Integer;
begin
  inherited;
   if Trim(dbdDta.Text) <> '' then
   begin
      if ((dsDet.DataSet.State in [dsInsert,dsEdit]) and
          (Trim(dbDtaLiq.Text) <> '')) then
         qryDetalhe.FieldByName('DATALIQUIDACAO').AsDateTime := dbDtaLiq.Date; // wDataVenc;
      //AL_7
      //AL_11 Ini
      if Trim(dblkPlanPatro.Text) <> '' then
         iPlano := DMRelOperRecebtoFdo.qryPlanPrevCtbPatrIDPLANPREVCTBPATR.AsInteger
      else
         iPlano := iPlanPrevCtbPatro;

      BuscaSaldoFundo(qryInvest.FieldByName('IDFUNDOINVEST').AsInteger,
                      iPlano, -1, dbdDta.Date,
                      fNull, fNull, fNull, fNull,
                      fNull, fNull, fNull, fSdoQtdCotas,
                      fNull, sDescFundo);
      if fSdoQtdCotas = 0 then
         MsgDlg('O Fundo não possui Saldo para o dia Informado. ', 'Mensagem do Sistema', mtWarning, [mbOk], 0);
      //AL_11 Fim
      dbQtdCotas.Value := fSdoQtdCotas;
   end;
end;

procedure TfrmCadOperDividendosFdo.dblInvestExit(Sender: TObject);
begin
  inherited;
   // AL_3
   AtualizaFundoInvest;
end;

procedure TfrmCadOperDividendosFdo.dblTipoOperExit(Sender: TObject);
begin
  inherited;
   // AL_3
   AtualizaFundoInvest;
end;

procedure TfrmCadOperDividendosFdo.dblkPlanPatroCloseUp(Sender: TObject;
  LookupTable, FillTable: TDataSet; modified: Boolean);
begin
  inherited;
   AtualizaFundoInvest;
   SelectNext(ActiveControl,True,True)
end;

procedure TfrmCadOperDividendosFdo.dblkPlanPatroExit(Sender: TObject);
begin
  inherited;
   AtualizaFundoInvest;
   SelectNext(ActiveControl,True,True)
end;

end.
