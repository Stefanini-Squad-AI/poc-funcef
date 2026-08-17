//******************************************************************************
// Data     : 22/08/2007
// Código   : AL_18
// Motivo   : Implementações na BuscaSaldoFundo( devido a criação de campo
//            saldobloqueado(Pendência 25706)
//******************************************************************************
// Data      : 01/02/2007
// Código    : AL_17
// Pendencia : 24349
// SOL       : 52712
// Desc      : Ajuste no tratamento de erro da rotina AlimentaFundo
//             Criado um parametro novo dom variável para retorno da
//               mensagem de erro
//******************************************************************************
// Data      : 20/07/2006
// Código    : AL_16
// Motivo    : Inclusão do reprocessamento
//******************************************************************************
// Data      : 19/07/2006
// Código    : AL_15
// Motivo    : Abertura da query "qryTipoFundoInvest"
//******************************************************************************
// Data      : 10/07/2006
// Código    : AL_14
// Pendencia : 20453
// SOL       : 33866
// Desc      : Implementação da Trava Contábil por Módulo
//******************************************************************************
// Data      : 20/02/2005
// Código    : AL_13
// Motivo    : Implementação da verificação de processo de atualização em andamento
//******************************************************************************
// Data     : 13/10/2005
// Linha(s) : Al_12
// Motivo   : Alteração no layout e ajuste no insert
//******************************************************************************
// Data     : 06/10/2005
// Linha(s) : Al_11
// Motivo   : Alteração no layout e implementação do campo OBSERVACAO
//******************************************************************************
// Data     : 30/05/2005
// Código   : AL_10
// Motivo   : Implementação do teste de período contabil em 3 camadas
//******************************************************************************
// Data     : 29/04/2005
// Linha(s) : Al_9
// Motivo   : Alterado a descrição do histórico, para passar apenas o nome do fundo e o plano
//******************************************************************************
// Data     : 02/12/2004
// AL_8
// Motivo   : Acerto na exclusao
//******************************************************************************
// Data     : 30/11/2004
// AL_7
// Motivo   : Busca o Saldo de Qtd do Fundo
//******************************************************************************
// Data     : 30/11/2004
// AL_6
// Motivo   : Update no Plano,CodDocumento e PlnCodigo na OPERACAOFUNDO
//******************************************************************************
// Data     : 08/11/2004
// AL_5
// Motivo   : Acerto na transação (Voltei com a herança qryDetalhe)
//******************************************************************************
// Data     : 27/10/2004
// AL_4
// Motivo   : Passa a gravar 0,00 no Campo VLRIOF
//******************************************************************************
// Data     : 19/10/2004
// AL_3
// Motivo   : Implementacao do relatório de Operacoes e melhorias no form
//******************************************************************************
// Data     : 24/09/2004
// Motivo   : Inclusão do Tipo de Operacao para Recebimentos e melhoria de código
//******************************************************************************
// Data     : 17/09/2004
// Motivo   : Incluido o parametro IDPLANPREVCTBPATR na qryDetalhe
//            Acerto no tabOrder do pnlControlesDet
//******************************************************************************
// Data     : 15/09/2004
// AL_2
// Motivo   : Melhoria de Lay-out, Implementado o Campo Data de Liquidação
//******************************************************************************
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
  wwdbdatetimepicker, CMDateTimePicker, FPreview, uCtrlInvContab, DBCtrls;

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
    //Al_11
    qryDetalheOBSERVACAO: TMemoField;
    //Al_12
    qryInvestDATAULTFECH: TDateTimeField;
    pgcRecebimentos: TPageControl;
    TbsRec: TTabSheet;
    tbsObservacao: TTabSheet;
    mObservacao: TDBMemo;
    Label3: TLabel;
    Label4: TLabel;
    //Ricardo Cristiano - 29/01/2010 - N. Sol 129885 -  N. Kintana 717793
    qryInvestDTAINIPROC: TDateTimeField;
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
  private
    bModal: Boolean;
    procedure StatusGeral;
    procedure StatusInclui;
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
   //Al_12
   StatusInclui;
  inherited;   
   if dbdDta.Canfocus then
      dbdDta.setfocus;
end;

procedure TfrmCadOperDividendosFdo.StatusGeral;
begin
   dblInvest.Enabled := True;
   dblTipoOper.Enabled := True;
   dbdDta.Enabled := True;
   sbtnProcurar.Enabled := True;

   if Trim(dblInvest.Text) = '' then
   begin
      sbtnInsDet.Enabled := False;
      sbtnAltDet.Enabled := False;
      sbtnExcluiDet.Enabled := False;
      dbgrdDet.Enabled := False;
   end
   else if Trim(dblTipoOper.Text) = '' then
   begin
      sbtnInsDet.Enabled := False;
      sbtnAltDet.Enabled := False;
      sbtnExcluiDet.Enabled := False;
      dbgrdDet.Enabled := False;
   end
   else
   begin
      if qryDetalhe.IsEmpty then
      begin
         sbtnInsDet.Enabled := True;
         sbtnAltDet.Enabled := False;
         sbtnExcluiDet.Enabled := False;
         dbgrdDet.Enabled := False;
      end
      else
      begin
         sbtnInsDet.Enabled := True;
         sbtnAltDet.Enabled := True;
         sbtnExcluiDet.Enabled := True;
         dbgrdDet.Enabled := True;
      end;
   end;
   bbtnOkDet.Enabled := False;
   bbtnCancelarDet.Enabled := False;
   bbtnVoltarDet.Enabled := False;
   bbtnConfirmar.Enabled := False;
   bbtnCancelar.Enabled := False;
end;

procedure TfrmCadOperDividendosFdo.StatusInclui;
begin
   sbtnProcurar.Enabled := False;
   dblInvest.Enabled := False;
   dblTipoOper.Enabled := False;

   sbtnAltDet.Enabled := False;
   sbtnExcluiDet.Enabled := False;

   bbtnOkDet.Enabled := True;
   bbtnCancelarDet.Enabled := True;
   bbtnVoltarDet.Enabled := True;
end;

procedure TfrmCadOperDividendosFdo.FormShow(Sender: TObject);
begin
  inherited;
  OperComum.LimpaParametros(qryTipoOper);
  //Ricardo Cristiano - 29/01/2010 - N. Sol 129885 -  N. Kintana 717793
  qryTipoOper.ParamByName('IDTIPOINVEST').AsInteger := iTipoInvestUsu;
  qryTipoOper.Open;

  MontaSelect.Filtro.Add('OPERACAOFUNDO.IDPLANPREVCTBPATR = '+ IntToStr(iPlanPrevCtbPatro));

  OperComum.LimpaParametros(qryInvest);
  qryInvest.ParamByName('IDTIPOINVEST').AsInteger := iTipoInvestUsu;
  qryInvest.Open;

  //Ricardo Cristiano - 29/01/2010 - N. Sol 129885 -  N. Kintana 717793
  if iTipoInvestUsu <> 0 then
     MontaSelect.Filtro.Add('OPERACAOFUNDO.IDTIPOINVEST = ' + IntToStr(iTipoInvestUsu));

  OperComum.LimpaParametros(DMRelOperRecebtoFdo.qryOperRecebtoFdo);
  DMRelOperRecebtoFdo.qryOperRecebtoFdo.ParamByName('IDPLANPREVCTBPATR').asInteger := iPlanPrevCtbPatro;
  DMRelOperRecebtoFdo.qryOperRecebtoFdo.Open;

  OperComum.LimpaParametros(qryDetalhe);
  qryDetalhe.ParamByName('IDTIPOINVEST').AsInteger      := iTipoInvestUsu;
  qryDetalhe.ParamByName('IDPLANPREVCTBPATR').AsInteger := iPlanPrevCtbPatro;
  qryDetalhe.ParamByName('IDFUNDOINVEST').AsInteger     := -1;
  qryDetalhe.Open;
  qryDetalhe.First;
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
   if dblInvest.lookupvalue <> '' then
   begin
      OperComum.LimpaParametros(DMRelOperRecebtoFdo.qryOperRecebtoFdo);
      DMRelOperRecebtoFdo.qryOperRecebtoFdo.ParambyName('IDFUNDOINVEST').asInteger  := StrToInt(dblInvest.LookupValue);
      if Trim(dblTipoOper.Text) <> '' then
         DMRelOperRecebtoFdo.qryOperRecebtoFdo.ParamByName('IDTIPOOPERACAO').asInteger := QryTipoOperIDTIPOOPERACAO.AsInteger;
      DMRelOperRecebtoFdo.qryOperRecebtoFdo.ParamByName('IDPLANPREVCTBPATR').asInteger := iPlanPrevCtbPatro;
      DMRelOperRecebtoFdo.qryOperRecebtoFdo.Open;

      OperComum.LimpaParametros(qryDetalhe);
      qryDetalhe.ParamByName('IDTIPOINVEST').AsInteger      := iTipoInvestUsu;
      qryDetalhe.ParamByName('IDPLANPREVCTBPATR').AsInteger := iPlanPrevCtbPatro;
      qryDetalhe.ParambyName('IDFUNDOINVEST').asInteger     := StrToInt(dblInvest.LookupValue);
      if Trim(dblTipoOper.Text) <> '' then
         qryDetalhe.ParamByName('IDTIPOOPERACAO').asInteger := QryTipoOperIDTIPOOPERACAO.AsInteger;
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

      case dsDet.State of
           dsInsert : dbdDta.SetFocus;
      end;

      // Altera Formato do Valor da Cota
      dbQtdCotas.DecDigits   := QryInvest.FieldByName('QTDDECQTD').AsInteger;
      wDisplay := '#,##0.';
      for x := 1 to dbQtdCotas.DecDigits do
          wDisplay := wDisplay + '0';
      qryDetalheQTDOPERACAO.DisplayFormat := wDisplay;

   end;
   // Define o status dos controles do form
   StatusGeral;
end;

procedure TfrmCadOperDividendosFdo.sbtnExcluiDetClick(Sender: TObject);
begin
 if (not qryDetalhe.IsEmpty) then
 begin
    // AL_10 - Inicio
    //AL_14
    if not CtrlInvContab.TestaPeriodo(qryDetalheDATAOPERACAO.AsString, iTipoInvestUsu) then
    begin
       MsgDlg(CtrlInvContab.MessageInfo, 'Mensagem do Sistema', mtWarning, [mbOk], 0);
       Exit;
    end;

    //AL_15
    OperComum.LimpaParametros(QryTipoFundoInvest);
    QryTipoFundoInvest.ParamByName('IDTIPOFUNDOINVEST').AsInteger :=
                       qryInvest.FieldByName('IDTIPOFUNDOINVEST').AsInteger;
    QryTipoFundoInvest.Open;

    //AL_13
    if VerEmAbertura(QryTipoFundoInvest.FieldByName('IDTIPOFUNDOINVEST').AsInteger) then
       Exit;

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

    If Not ExecutaQuery(QryAux,'DELETE FROM IRLITIGIO  WHERE IDOPERACAOFUNDO = '+
                        qryDetalhe.FieldByName('IDOPERACAOFUNDO').AsString) Then
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

    //AL_16
    If StrToDate(dbdDta.Text) <= QryTipoFundoInvest.FieldByName('DATAULTFECH').AsDateTime Then
    begin
       If Not Reprocessamento(iTipoInvestUsu,
                              qryInvest.FieldByName('IDTIPOFUNDOINVEST').AsInteger,
                              qryInvest.FieldByName('IDFUNDOINVEST').AsInteger,
                              iPlanPrevCtbPatro,
                              StrToDate(dbdDta.Text),
                              //Ricardo Cristiano - 29/01/2010 - N. Sol 129885 -  N. Kintana 717793
                              QryTipoFundoInvest.FieldByName('DATAULTFECH').AsDateTime,
                              qryInvest.FieldByName('DTAINIPROC').AsDateTime,
                              True) Then
          MsgDlg('Atenção : Não foi possível efetuar o Reprocessamento para esse Fundo!',
                 'Mensagem do Sistema', MtInformation,[MbOk],0)
       else
          MsgDlg('Operação Excluida com Sucesso.','Mensagem do Sistema', MtConfirmation,[MbOk],0);
    end
    else
       MsgDlg('Operação Excluida com Sucesso.','Mensagem do Sistema', MtConfirmation,[MbOk],0);
       
    QryTipoFundoInvest.Close;

    OperComum.LimpaParametros(DMRelOperRecebtoFdo.qryOperRecebtoFdo);
    DMRelOperRecebtoFdo.qryOperRecebtoFdo.ParambyName('IDFUNDOINVEST').asInteger  := StrToInt(dblInvest.LookupValue);
    if Trim(dblTipoOper.Text) <> '' then
       DMRelOperRecebtoFdo.qryOperRecebtoFdo.ParamByName('IDTIPOOPERACAO').asInteger := QryTipoOperIDTIPOOPERACAO.AsInteger;
    DMRelOperRecebtoFdo.qryOperRecebtoFdo.ParamByName('IDPLANPREVCTBPATR').asInteger := iPlanPrevCtbPatro;
    DMRelOperRecebtoFdo.qryOperRecebtoFdo.Open;

    OperComum.LimpaParametros(qryDetalhe);
    qryDetalhe.ParamByName('IDTIPOINVEST').AsInteger      := iTipoInvestUsu;
    qryDetalhe.ParamByName('IDPLANPREVCTBPATR').AsInteger := iPlanPrevCtbPatro;
    qryDetalhe.ParambyName('IDFUNDOINVEST').asInteger     := StrToInt(dblInvest.LookupValue);
    if Trim(dblTipoOper.Text) <> '' then
       qryDetalhe.ParamByName('IDTIPOOPERACAO').asInteger := QryTipoOperIDTIPOOPERACAO.AsInteger;
    qryDetalhe.Open;
    qryDetalhe.First;
    if qryDetalhe.Recordcount <> 0 then
       sbtnImprimir.Enabled := True
    else
       sbtnImprimir.Enabled := False;

 end;
 StatusGeral;
end;

procedure TfrmCadOperDividendosFdo.bbtnOkDetClick(Sender: TObject);
Var
  // AL_11
  iIdForCli, iPlanilha, iDocumento, iPlano : Integer;
  wDataVenc : TDateTime;
  fVlrCustoAcoes, fVlrVarAcoes : Currency;
  //AL_17
  sMens: String;
begin
  fVlrCustoAcoes := 0;
  fVlrVarAcoes   := 0;

  if dbdDta.Text = '' then
  begin
    ShowMessage('O Campo DATA deve ser preenchido');
    Exit;
  end;

  // AL_10 - Inicio
  //AL_14
  if not CtrlInvContab.TestaPeriodo(dbdDta.Text, iTipoInvestUsu) then
  begin
     MsgDlg(CtrlInvContab.MessageInfo, 'Mensagem do Sistema', mtWarning, [mbOk], 0);
     if dbdDta.CanFocus then
        dbdDta.SetFocus;
     Exit;
  end;

  //AL_15
  OperComum.LimpaParametros(QryTipoFundoInvest);
  QryTipoFundoInvest.ParamByName('IDTIPOFUNDOINVEST').AsInteger :=
                     qryInvest.FieldByName('IDTIPOFUNDOINVEST').AsInteger;
  QryTipoFundoInvest.Open;

  //AL_13
  if VerEmAbertura(QryTipoFundoInvest.FieldByName('IDTIPOFUNDOINVEST').AsInteger) then
     Exit;

  if dbQtdCotas.Text = '' then
  begin
    ShowMessage('O Campo Quantidade de Cotas deve ser preenchido');
    Exit;
  end;

  if DbPuDividendo.Text = '' then
  begin
    ShowMessage('O Campo PU de Dividendos deve ser preenchido');
    Exit;
  end;

  if DbValorBruto.Text = '' then
  begin
    ShowMessage('O Campo Valor Bruto deve ser preenchido');
    Exit;
  end;

  if DbValorIRRF.Text = '' then
  begin
    ShowMessage('O Campo Valor do IRRF deve ser preenchido');
    Exit;
  end;

  Try
    if not dtmBaseDados.dbBaseDados.InTransaction then
       dtmBaseDados.dbBaseDados.StartTransaction;

    if dsDet.DataSet.State in [dsInsert] then
       if qryDetalhe.FieldByName('IDOPERACAOFUNDO').AsInteger <=0 Then
          qryDetalhe.FieldByName('IDOPERACAOFUNDO').AsInteger := LeUltRegistro(nil,'OPERACAOFUNDO');
    //Al_12
    qryDetalhe.FieldByName('IDFUNDOINVEST').AsInteger     := StrToInt(dblInvest.LookupValue);
    if qryInvest.FieldByName('IDCARTEIRAINVEST').AsInteger > 0 then
       qryDetalhe.FieldByName('IDCARTEIRAINVEST').AsInteger  := qryInvest.FieldByName('IDCARTEIRAINVEST').AsInteger;

    qryDetalhe.FieldByName('IDPLANPREVCTBPATR').AsInteger := iPlanPrevCtbPatro;

    qryDetalhe.FieldByName('IDTIPOINVEST').AsInteger      := iTipoInvestUsu;

    qryDetalhe.FieldByName('IDTIPOOPERACAO').AsInteger    := QryTipoOper.FieldByName('IDTIPOOPERACAO').AsInteger;

    // AL_11
    wDataVenc:=StrToDate(dbdDta.Text);

    qryDetalhe.FieldByName('DATALIQUIDACAO').AsDateTime := StrToDate(dbDtaLiq.Text);

    qryDetalhe.FieldByName('VLRCOTA').AsFloat      := DbPuDividendo.Value;

    qryDetalhe.FieldByName('QTDOPERACAO').AsFloat  := dbQtdCotas.Value;
    //Alt_4
    qryDetalhe.FieldByName('VLRIOF').AsFloat       := 0;
    //Al_12
    //Al_11
    qryDetalhe.post;
    qryDetalhe.CommitUpdates;

    QryAux.Close;

    bbtnConfirmar.Enabled := True;
    //Al_12
    // AL_11 
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
    begin
       //AL_17
       if sMens <> '' then
          Raise Exception.Create('Não foi possível confirmar o Operação' + #13 +
                                 'Mensagem: ' + sMens)
       else
          Raise Exception.Create('Não foi possível efetuar este Operação' + #13 +
                                 'Ocorreu um problema durante o processo de gravação' + #13 +
                                 'Refaça a operação');
    end;


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

    ExecutaQuery(QryAux,'UPDATE OPERACAOFUNDO SET STACONFIRMA = ''S'' WHERE (IDOPERACAOFUNDO   = '''+
                IntToStr(qryDetalheIDOPERACAOFUNDO.AsInteger)  +''')');

    QryAux.Close;

    //Al_9
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

    dtmBaseDados.dbBaseDados.Commit;

    //AL_16
    If StrToDate(dbdDta.Text) < QryTipoFundoInvest.FieldByName('DATAULTFECH').AsDateTime Then
    begin
       If Not Reprocessamento(iTipoInvestUsu,
                              qryInvest.FieldByName('IDTIPOFUNDOINVEST').AsInteger,
                              qryInvest.FieldByName('IDFUNDOINVEST').AsInteger,
                              iPlanPrevCtbPatro,
                              StrToDate(dbdDta.Text),
                              //Ricardo Cristiano - 29/01/2010 - N. Sol 129885 -  N. Kintana 717793
                              QryTipoFundoInvest.FieldByName('DATAULTFECH').AsDateTime,
                              qryInvest.FieldByName('DTAINIPROC').AsDateTime,
                              True) Then
          MsgDlg('Atenção : Não foi possível efetuar o Reprocessamento para esse Fundo!',
                 'Mensagem do Sistema', MtInformation,[MbOk],0)
       else
          MsgDlg('Operação Concluida com Sucesso.','Mensagem do Sistema', MtConfirmation,[MbOk],0);
    end
    else
       MsgDlg('Operação Concluida com Sucesso.','Mensagem do Sistema', MtConfirmation,[MbOk],0);
       
    QryTipoFundoInvest.Close;

    StatusGeral;

    //Al_12
    bbtnCancelarDetClick(Sender);
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
  DMRelOperRecebtoFdo.qryOperRecebtoFdo.ParamByName('IDPLANPREVCTBPATR').asInteger := iPlanPrevCtbPatro;
  DMRelOperRecebtoFdo.qryOperRecebtoFdo.ParambyName('IDFUNDOINVEST').asInteger     := StrToInt(dblInvest.LookupValue);
  if Trim(dblTipoOper.Text) <> '' then
     DMRelOperRecebtoFdo.qryOperRecebtoFdo.ParamByName('IDTIPOOPERACAO').asInteger := QryTipoOperIDTIPOOPERACAO.AsInteger;
  DMRelOperRecebtoFdo.qryOperRecebtoFdo.Open;

  OperComum.LimpaParametros(qryDetalhe);
  qryDetalhe.ParamByName('IDTIPOINVEST').AsInteger      := iTipoInvestUsu;
  qryDetalhe.ParamByName('IDPLANPREVCTBPATR').AsInteger := iPlanPrevCtbPatro;
  qryDetalhe.ParambyName('IDFUNDOINVEST').asInteger     := StrToInt(dblInvest.LookupValue);
  if Trim(dblTipoOper.Text) <> '' then
     qryDetalhe.ParamByName('IDTIPOOPERACAO').asInteger := QryTipoOperIDTIPOOPERACAO.AsInteger;
  qryDetalhe.Open;
  qryDetalhe.First;
  if qryDetalhe.Recordcount <> 0 then
     sbtnImprimir.Enabled := True
  else
     sbtnImprimir.Enabled := False;

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
  
  if MontaSelect.RetornouValor then
  begin

     dblInvest.LookupValue := MontaSelect.ValoresChave[0];
     dblInvest.PerformSearch;
     
     dblTipoOper.LookupValue := MontaSelect.ValoresChave[1];
     dblTipoOper.PerformSearch;
     
     OperComum.LimpaParametros(DMRelOperRecebtoFdo.qryOperRecebtoFdo);
     DMRelOperRecebtoFdo.qryOperRecebtoFdo.ParamByName('IDPLANPREVCTBPATR').asInteger := iPlanPrevCtbPatro;
     DMRelOperRecebtoFdo.qryOperRecebtoFdo.ParambyName('IDFUNDOINVEST').asInteger     := StrToInt(montaSelect.ValoresChave[0]);
     DMRelOperRecebtoFdo.qryOperRecebtoFdo.ParamByName('IDTIPOOPERACAO').asInteger    := StrToInt(montaSelect.ValoresChave[1]);
     DMRelOperRecebtoFdo.qryOperRecebtoFdo.Open;

     OperComum.LimpaParametros(qryDetalhe);
     qryDetalhe.ParamByName('IDTIPOINVEST').AsInteger       := iTipoInvestUsu;
     qryDetalhe.ParamByName('IDPLANPREVCTBPATR').AsInteger  := iPlanPrevCtbPatro;
     qryDetalhe.ParambyName('IDFUNDOINVEST').asInteger      := StrToInt(montaSelect.ValoresChave[0]);
     qryDetalhe.ParamByName('IDTIPOOPERACAO').asInteger     := StrToInt(montaSelect.ValoresChave[1]);
     qryDetalhe.Open;
     
     qryDetalhe.First;
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
begin
  inherited;
   if ((dsDet.DataSet.State in [dsInsert,dsEdit]) and
       (Trim(dbDtaLiq.Text) <> '')) then
      qryDetalhe.FieldByName('DATALIQUIDACAO').AsDateTime := dbDtaLiq.Date;
   //AL_18      
   //AL_7
   BuscaSaldoFundo(qryInvest.FieldByName('IDFUNDOINVEST').AsInteger,
                   iPlanPrevCtbPatro, -1, dbdDta.Date,
                   fNull, fNull, fNull, fNull,
                   fNull, fNull, fNull, fSdoQtdCotas,
                   fNull, fNull, sDescFundo);
   dbQtdCotas.Value := fSdoQtdCotas;
end;

procedure TfrmCadOperDividendosFdo.dblInvestExit(Sender: TObject);
begin
  inherited;
   // AL_3  
   AtualizaFundoInvest
end;

procedure TfrmCadOperDividendosFdo.dblTipoOperExit(Sender: TObject);
begin
  inherited;
   // AL_3
   AtualizaFundoInvest;
end;

end.
