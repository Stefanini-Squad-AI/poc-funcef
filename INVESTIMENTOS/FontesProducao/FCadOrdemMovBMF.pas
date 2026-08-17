//******************************************************************************
// Data      : 18/07/2006
// Código    : AL_1
// Pendencia : 20453
// SOL       : 33866
// Desc      : Implementação da Trava Contábil por Módulo
//             Acerto para retirada de carteira gerêncial
//******************************************************************************
// Data     : 12/07/2004
// Motivo   : Implementaçao dos tipos de operaçao -102 e -103 na QryTipoOperacao (Reversao de Ope)
//******************************************************************************

unit FCadOrdemMovBMF;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  FCadastroCS, DBGrids, Grids, Wwdbigrd, Wwdbgrid,
  Buttons, ComCtrls, Mask, DBCtrls, wwdblook, IvDictio, IvMulti, IvEMulti,
  MontaSelect, DBTables, Db, Wwdatsrc, Wwquery, TB97Ctls, MAHlpBtn,
  TB97Tlbr, TB97, ExtCtrls, wwdbdatetimepicker, CMDateTimePicker, StdCtrls,
  CmEventosCadastro, ImgList, UOperacaoInvest, TREdit;

type
  TfrmOrdemMovBMF = class(TfrmCadastroCS)
    lblDtaOperacao: TLabel;
    lblCarteira: TLabel;
    lblSerie: TLabel;
    dblCarteira: TwwDBLookupCombo;
    dblSerie: TwwDBLookupCombo;
    PageControl1: TPageControl;
    TabSheet1: TTabSheet;
    Dock977: TDock97;
    Toolbar974: TToolbar97;
    BtIncDet: TSpeedButton;
    BtAltDet: TSpeedButton;
    BtDelDet: TSpeedButton;
    Dock978: TDock97;
    Toolbar975: TToolbar97;
    BtOkDet: TBitBtn;
    BtCancDet: TBitBtn;
    BtVoltaDet: TBitBtn;
    dbDtaOperacao: TCMDateTimePicker;
    lblTpContrato: TLabel;
    dblTipoContrato: TwwDBLookupCombo;
    dblCorretora: TwwDBLookupCombo;
    lblCorretora: TLabel;
    lblLote: TLabel;
    QryCarteira: TwwQuery;
    QryCorretValores: TwwQuery;
    QryInvestimento: TwwQuery;
    QryCarteiraIDCARTEIRAINVEST: TFloatField;
    QryCarteiraDESCCARTINVEST: TStringField;
    dbeNumDoc: TDBEdit;
    QryCorretValoresIDCORRETVALORES: TFloatField;
    QryCorretValoresSGLCORRETVALORES: TStringField;
    QryInvestimentoIDINVESTIMENTO: TFloatField;
    QryInvestimentoDESCINVESTIMENTO: TStringField;
    QryInvestimentoIDTIPOINVEST: TFloatField;
    QryInvestimentoIDEMISSOR: TFloatField;
    QryTipoContrInvest: TwwQuery;
    QryTipoContrInvestIDTIPOCONTRINVEST: TFloatField;
    QryTipoContrInvestDESCTIPOCTINVEST: TStringField;
    QryMoeda: TwwQuery;
    QryMoedaMOECODIGO: TFloatField;
    dblOperacao: TwwDBLookupCombo;
    lblTpOper: TLabel;
    QryTipoOperacao: TwwQuery;
    QryTipoOperacaoIDTIPOOPERACAO: TFloatField;
    QryTipoOperacaoDESCTIPOOPERACAO: TStringField;
    updDetalhe: TUpdateSQL;
    QryDetalhe: TwwQuery;
    QryDetalheHORAMOV: TStringField;
    QryDetalheQTDEORDENADA: TFloatField;
    QryDetalhePUORDMOVINV: TFloatField;
    QryDetalheVALOR: TFloatField;
    QryDetalheQTDEORDMOVINV: TFloatField;
    QryDetalheIDCUSTODIANTE: TFloatField;
    QryDetalheIDORDMOVINV: TFloatField;
    QryDetalheIDCORRETVALORES: TFloatField;
    v: TFloatField;
    QryDetalheDATAORDMOVINV: TDateTimeField;
    QryDetalheNUMDOCMOVINV: TStringField;
    QryDetalheSTATMOVINV: TStringField;
    QryDetalheIDUSUARIO: TFloatField;
    QryDetalheIDAUTORIZACAO: TFloatField;
    QryDetalheIDTIPOINVEST: TFloatField;
    QryDetalheIDTIPOOPERACAO: TFloatField;
    QryDetalheIDCARTEIRAINVEST: TFloatField;
    QryDetalheIDLOTE: TStringField;
    QryDetalheDATAAUTORIZACAO: TDateTimeField;
    QryDetalheIDBOLSAVALORES: TFloatField;
    QryDetalheDESCCARTINVEST: TStringField;
    QryDetalheSGLCORRETVALORES: TStringField;
    QryDetalheDESCTIPOOPERACAO: TStringField;
    QryDetalheDESCINVESTIMENTO: TStringField;
    QryDetalheSGLBOLSAVALORES: TStringField;
    QryDetalheSIGLATIPOOPER: TStringField;
    DsDetalhe: TwwDataSource;
    QryNumBoleta: TwwQuery;
    qryIDOPERACAOINVEST: TFloatField;
    qryIDCUSTODIANTE: TFloatField;
    qryIDCARTEIRAINVEST: TFloatField;
    qryIDTIPOINVEST: TFloatField;
    qryIDTIPOOPERACAO: TFloatField;
    qryIDINSTFIN: TFloatField;
    qryDATAOPERACAO: TDateTimeField;
    qryNUMDOCUMENTO2: TStringField;
    qryQTDEOPERACAO: TFloatField;
    qryPRECOUNITOPERACAO: TFloatField;
    qryVLROPERACAO: TFloatField;
    qryDATAVENCOPER: TDateTimeField;
    qryIDINVESTIMENTO: TFloatField;
    qryEMPRESAPROP: TFloatField;
    qryIDFORCLI: TFloatField;
    qryIDCORRETVALORES: TFloatField;
    qryMOECODIGO: TFloatField;
    qryIDCARTORIDEST: TFloatField;
    qryIDLOTE: TStringField;
    qryIDMODULO: TFloatField;
    qryIDINVESTDEST: TFloatField;
    qryIDORDMOVINV: TFloatField;
    qryIDCUSTORIG: TFloatField;
    qryIDCUSTDEST: TFloatField;
    qryVLRIR: TFloatField;
    QryDetalheDESCTIPOCTINVEST: TStringField;
    QryParamInvest: TwwQuery;
    QryParamInvestFLGORDMOVINV: TStringField;
    QryParamInvestIDBMF: TFloatField;
    updContratoInvestim: TUpdateSQL;
    QryContratoInvestim: TwwQuery;
    DsContratoInvestim: TwwDataSource;
    QryContratoInvestimIDCONTRATOINVEST: TFloatField;
    QryContratoInvestimIDTIPOCONTRINVEST: TFloatField;
    QryContratoInvestimIDEMISSOR: TFloatField;
    QryContratoInvestimIDINVESTIMENTO: TFloatField;
    QryContratoInvestimIDCORRETVALORES: TFloatField;
    QryContratoInvestimIDBOLSAVALORES: TFloatField;
    QryContratoInvestimSERIE: TStringField;
    QryContratoInvestimIDLOTE: TStringField;
    QryContratoInvestimIDCARTLASTRO: TFloatField;
    QryAux: TwwQuery;
    QryAuxIDLOTE: TStringField;
    QryVenda: TwwQuery;
    StringField1: TStringField;
    QryParamContrBMF: TwwQuery;
    QryDetalheIDTIPOCONTRINVEST: TFloatField;
    QryParamContrBMFPESOCONTRATO: TFloatField;
    QryParamContrBMFDATA: TDateTimeField;
    QryDetalheOBSAUTMOV: TStringField;
    QryDetalheOBSMOVINV: TStringField;
    Panel4: TPanel;
    lblQtdOperada: TLabel;
    rQtdOperada: TRealEdit;
    lblPosPrevista: TLabel;
    rQtdPrevista: TRealEdit;
    QryBuscaSaldoDiaAntCorret: TwwQuery;
    QryBuscaSaldoDiaAntCorretQTDCOMPRADA: TFloatField;
    QryBuscaSaldoDiaAntCorretQTDVENDIDA: TFloatField;
    lblPosicaoTotal: TLabel;
    rQtdAtualTotal: TRealEdit;
    lblPosicaoTotalCV: TLabel;
    QryBuscaSaldoDiaAntTotal: TwwQuery;
    FloatField1: TFloatField;
    FloatField2: TFloatField;
    QryTotalOperado: TwwQuery;
    lblPosPrevistaCV: TLabel;
    lblQtdOperadaCV: TLabel;
    QryTotalOperadoQTDCOMPRADA: TFloatField;
    QryTotalOperadoQTDVENDIDA: TFloatField;
    lblBoletaAF: TLabel;
    Label3: TLabel;
    Label5: TLabel;
    Label10: TLabel;
    rPUMedioV: TRealEdit;
    Panel7: TPanel;
    Panel5: TPanel;
    Panel1: TPanel;
    dbgSelecao: TDBGrid;
    Panel6: TPanel;
    dbgOperacao: TwwDBGrid;
    Label8: TLabel;
    rPUMedioC: TRealEdit;
    QryDetalheNATUREZAOPERACAO: TStringField;
    QryDetalheIDPLANPREVCTBPATR: TFloatField;
    Label1: TLabel;
    dblAutorizador: TwwDBLookupCombo;
    QryAutorizador: TwwQuery;
    QryAutorizadorIDUSUARIO: TFloatField;
    QryAutorizadorNOMEUSUARIO: TStringField;
    ToolbarButton971: TToolbarButton97;
    QryCarteiraIDCARTEIRAGERENC: TFloatField;
    QryDetalheIDCARTEIRAGERENC: TFloatField;
    dbeLote: TDBEdit;
    QryNumBoletaNUMDOCMOVINV: TStringField;
    QryNumBoletaIDLOTE: TStringField;
    procedure FormShow(Sender: TObject);
    procedure dbDtaOperacaoExit(Sender: TObject);
    procedure AbreQry(Sender: TObject);
    procedure AlimentaQryDetalhe;
    procedure dblCarteiraChange(Sender: TObject);
    procedure DesabilitaCamposDetalhe;
    procedure HabilitaCamposDetalhe;
    procedure PosicionaNumBoleta;
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    Procedure CmeCadastroFind(Sender: TObject);
    procedure sbtnProcurarClick(Sender: TObject);
    procedure dbgOperacaoKeyDown(Sender: TObject; var Key: Word;Shift: TShiftState);
    procedure dbgOperacaoKeyUp(Sender: TObject; var Key: Word;Shift: TShiftState);
    procedure dblTipoContratoChange(Sender: TObject);
    procedure BtIncDetClick(Sender: TObject);
    function ValidaCamposPrincipal : Boolean;
    procedure DesabilitaCampos;
    procedure BtOkDetClick(Sender: TObject);
    function ValidaCamposDetalhe : Boolean;
    procedure CancelaOperacao;
    procedure HabilitaCampos;
    procedure dbgOperacaoExit(Sender: TObject);
    procedure dbgOperacaoColExit(Sender: TObject);
    procedure BtCancDetClick(Sender: TObject);
    procedure dblTipoContratoCloseUp(Sender: TObject; LookupTable,FillTable: TDataSet; modified: Boolean);
    procedure dblSerieCloseUp(Sender: TObject; LookupTable,FillTable: TDataSet; modified: Boolean);
    procedure dblCarteiraCloseUp(Sender: TObject; LookupTable,FillTable: TDataSet; modified: Boolean);
    procedure FormKeyDown(Sender: TObject; var Key: Word;Shift: TShiftState);
    procedure dbgOperacaoEnter(Sender: TObject);
    procedure bbtnSairClick(Sender: TObject);
    procedure BtDelDetClick(Sender: TObject);
    procedure BtAltDetClick(Sender: TObject);
    procedure dbgOperacaoMouseDown(Sender: TObject; Button: TMouseButton;Shift: TShiftState; X, Y: Integer);
    procedure dbgOperacaoMouseUp(Sender: TObject; Button: TMouseButton;Shift: TShiftState; X, Y: Integer);
    procedure CmeCadastroAtualizaBotoes(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure AtualizaTipoOperacao;
    procedure dblCorretoraExit(Sender: TObject);
    procedure dblOperacaoExit(Sender: TObject);
    procedure MontaStatusBoleta;
    procedure dblOperacaoCloseUp(Sender: TObject; LookupTable,FillTable: TDataSet; modified: Boolean);
    procedure dblCorretoraCloseUp(Sender: TObject; LookupTable,FillTable: TDataSet; modified: Boolean);
    procedure LimpaTotais;
    function MontaSaldosPosicaoTotal : Double;
    function MontaTotalOperado : Double;
    procedure dblSerieExit(Sender: TObject);
    procedure MontaTotais;
    procedure dblTipoContratoExit(Sender: TObject);
    procedure dblCarteiraExit(Sender: TObject);
    procedure BtVoltaDetClick(Sender: TObject);
    procedure ToolbarButton971Click(Sender: TObject);
    procedure CmeCadastroBeforeConfirma(sender: TObject;
      var Accept: Boolean);
    procedure sbtnApagarClick(Sender: TObject);

  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmOrdemMovBMF: TfrmOrdemMovBMF;
  bDelete,bTrocaLine: Boolean;
  IDORDMOVINV : Integer;
  wTipoOrdMov,wOrdAutorizacao : String;
  dValor : Double;
  fQtdSaldoDiaAntTotal,fQtdSaldoDiaAntCorret,fQtdOperada,fQtdPrevista : Double;

implementation


uses UDatabase, DBaseDados,UMensErro,USistema, UOperComum,UBibliotecaInvest,
  FSimulacaoOperBMF, FTelaAut, UDiasUteisInv,
  //AL_1
  uCtrlInvContab;

{$R *.DFM}

procedure TfrmOrdemMovBMF.FormShow(Sender: TObject);
begin
  inherited;
    dbgOperacao.Font.Color := clGray;
    bTrocaLine  := True;
    dbDtaOperacao.Date := DiasUteisInv.PrimeiroDiaUtilPosterior(pRPI.DATAULTFECHBMF,-1,1,'',True,False,False);
    if dbDtaOperacao.CanFocus then
       dbDtaOperacao.SetFocus;

    MontaTotais;

    Qry.Open;
    QryTipoOperacao.Close;
    QryTipoOperacao.ParamByName('pIdTipoOperacao').Clear;
    QryTipoOperacao.Open;
    QryCarteira.Open;
    QryCorretValores.Open;
    QryTipoContrInvest.Open;
    QryMoeda.Open;
    QryDetalhe.Close;
    QryInvestimento.Close;
    QryInvestimento.ParamByName('pDataRef').Clear;
    QryInvestimento.Open;
    QryParamInvest.Open;
    QryAutorizador.Open;

    CMeCadastro.AtualizaBotoes(self);
    bDelete     := False;
    wTipoOrdMov := QryParamInvest.FieldByName('FLGORDMOVINV').AsString;
    MontaStatusBoleta;
end;

Procedure TfrmOrdemMovBMF.CmeCadastroFind(Sender: TObject);
Begin
   dbeLote.Text           := '';
   QryDetalhe.Close;
   DesabilitaCamposDetalhe;

   If (MontaSelect.ValoresChave.Count > 0) And (MontaSelect.ValoresChave[0] <> '') Then
   Begin

     dbDtaOperacao.Date := StrToDate(MontaSelect.ValoresChave[0]);

     dblCarteira.Text    := '';
     If MontaSelect.ValoresChave[1] <> '' Then
     begin
        //AL_1
        if QryCarteira.Locate('IDCARTEIRAINVEST', MontaSelect.ValoresChave[1], [loPartialKey]) Then
           dblCarteira.Text := QryCarteira.FieldByName('DESCCARTINVEST').AsString
     end;

     dblCorretora.Text    := '';
     If MontaSelect.ValoresChave[2] <> '' Then
        If QryCorretValores.Locate('IDCORRETVALORES', MontaSelect.ValoresChave[2], [loPartialKey]) Then
           dblCorretora.Text := QryCorretValores.FieldByName('SGLCORRETVALORES').AsString;

     dblOperacao.Text    := '';
     If MontaSelect.ValoresChave[3] <> '' Then
        If QryTipoOperacao.Locate('IDTIPOOPERACAO', MontaSelect.ValoresChave[3], [loPartialKey]) Then
           dblOperacao.Text := QryTipoOperacao.FieldByName('DESCTIPOOPERACAO').AsString;

     dblSerie.Text    := '';
     dbDtaOperacao.tag := 0;
     If MontaSelect.ValoresChave[4] <> '' Then
     begin
        QryInvestimento.Close;
        QryInvestimento.ParamByName('pDataRef').AsString := DateToStr(dbDtaOperacao.Date);
        QryInvestimento.Open;
        If QryInvestimento.Locate('IDINVESTIMENTO', MontaSelect.ValoresChave[4], []) Then
        begin
           dblSerie.Text := QryInvestimento.FieldByName('DESCINVESTIMENTO').AsString;
           dbDtaOperacao.tag := 1;
        end;
     end;

     dblTipoContrato.Text    := '';
     If MontaSelect.ValoresChave[6] <> '' Then
        If QryTipoContrInvest.Locate('IDTIPOCONTRINVEST', MontaSelect.ValoresChave[6], [loPartialKey]) Then
           dblTipoContrato.Text := QryTipoContrInvest.FieldByName('DESCTIPOCTINVEST').AsString;

     HabilitaCamposDetalhe;
   End;
End;

procedure TfrmOrdemMovBMF.AbreQry(Sender: TObject);
Begin
   With QryDetalhe Do
   Begin
      DisableControls;
      OperComum.LimpaParametros(QryDetalhe);
      If dbDtaOperacao.Text <> '' Then
         ParamByName('DATAORDMOVINV').AsString := dbDtaOperacao.Text
      Else
         ParamByName('DATAORDMOVINV').Clear;

      If dblCarteira.Text <> '' Then
      begin
         ParamByName('IDCARTEIRAINVEST').AsInteger := QryCarteira.FieldByName('IDCARTEIRAINVEST').AsInteger;
         //AL_1
         ParamByName('IDCARTEIRAGERENC').Clear;
      end
      Else
      begin
         ParamByName('IDCARTEIRAINVEST').Clear;
         ParamByName('IDCARTEIRAGERENC').Clear;
      end;

      If dblCorretora.Text <> '' Then
         ParamByName('IDCORRETVALORES').AsInteger := QryCorretValores.FieldByName('IDCORRETVALORES').AsInteger
      Else
         ParamByName('IDCORRETVALORES').Clear;

      If dblOperacao.Text <> '' Then
         ParamByName('IDTIPOOPERACAO').AsInteger := QryTipoOperacao.FieldByName('IDTIPOOPERACAO').AsInteger
      Else
         ParamByName('IDTIPOOPERACAO').Clear;

      If dblSerie.Text <> '' Then
         ParamByName('IDINVESTIMENTO').AsInteger := QryInvestimento.FieldByName('IDINVESTIMENTO').AsInteger
      Else
         ParamByName('IDINVESTIMENTO').Clear;

      If dblTipoContrato.Text <> '' Then
         ParamByName('IDTIPOCONTRINVEST').AsInteger := QryTipoContrInvest.FieldByName('IDTIPOCONTRINVEST').AsInteger
      Else
         ParamByName('IDTIPOCONTRINVEST').Clear;
      Open;

      dbeLote.Text := FieldByName('IDLOTE').AsString;

      EnableControls;
      AlimentaQryDetalhe;
   End;
   dbgOperacao.Options := dbgOperacao.Options - [TwwDBgridOption(dgEditing)];
End;

procedure TfrmOrdemMovBMF.AlimentaQryDetalhe;
var
   fQtdOperC,fVlrOperC,fQtdOperV,fVlrOperV : Double;
Begin
   With QryDetalhe Do
   Begin
      DisableControls;
      First;
      fVlrOperC := 0;
      fVlrOperV := 0;
      fQtdOperV := 0;
      fQtdOperC := 0;            
      rPUMedioV.Value := 0;
      rPUMedioC.Value := 0;
      While Not Eof Do
      Begin
         Edit;
         with QryParamContrBMF do
         begin
            Close;
            ParamByName('pIDTIPOCONTRINVEST').AsInteger :=
               QryTipoContrInvest.FieldByName('IDTIPOCONTRINVEST').AsInteger;
            Open;
         end;
         FieldByName('HORAMOV').AsString      :=
              FormatDateTime('HH:NN', FieldByName('DATAORDMOVINV').AsDateTime);
         QryDetalhe.FieldByName('VALOR').AsFloat := (QryDetalhe.FieldByName('QTDEORDENADA').AsFloat *
                                                   QryDetalhe.FieldByName('PUORDMOVINV').AsFloat);
         // Esta conta somente vale para IBOVESPA
         QryDetalhe.FieldByName('VALOR').AsFloat := QryDetalhe.FieldByName('VALOR').AsFloat *
                                                    QryParamContrBMFPESOCONTRATO.AsFloat;
         Post;
         if QryDetalhe.FieldByName('NATUREZAOPERACAO').AsString = 'A' then // Compra
         begin
            fQtdOperC := fQtdOperC + QryDetalhe.FieldByName('QTDEORDENADA').AsFloat;
            fVlrOperC := fVlrOperC + ((QryDetalhe.FieldByName('QTDEORDENADA').AsFloat *
                                     QryDetalhe.FieldByName('PUORDMOVINV').AsFloat));
         end
         else if QryDetalhe.FieldByName('NATUREZAOPERACAO').AsString = 'D' then // Venda
         begin
            fQtdOperV := fQtdOperV + QryDetalhe.FieldByName('QTDEORDENADA').AsFloat;
            fVlrOperV := fVlrOperV + ((QryDetalhe.FieldByName('QTDEORDENADA').AsFloat *
                                     QryDetalhe.FieldByName('PUORDMOVINV').AsFloat));
         end;
         Next;
      End;
      First;
      MontaTotais;
      rPUMedioV.Value := OperComum.DivValorZero(fVlrOperV,fQtdOperV);
      rPUMedioC.Value := OperComum.DivValorZero(fVlrOperC,fQtdOperC);
      EnableControls;
   End;
end;

procedure TfrmOrdemMovBMF.dbDtaOperacaoExit(Sender: TObject);
begin
  inherited;
   bDelete := False;
   If Not bDelete Then
   Begin
      AbreQry(Sender);
      If QryDetalhe.EOF Then
      Begin
         DesabilitaCamposDetalhe;
         BtIncDet.Enabled := True;
      End
      Else
         HabilitaCamposDetalhe;
   End;

   if (trim(dbDtaOperacao.Text) <> '') and (dbDtaOperacao.tag <> 1) then
   begin
      QryInvestimento.Close;
      QryInvestimento.ParamByName('pDataRef').AsString := dbDtaOperacao.Text;
      QryInvestimento.Open;
   end;
   dbDtaOperacao.tag := 0;

end;

procedure TfrmOrdemMovBMF.dblCarteiraChange(Sender: TObject);
begin
  inherited;
   If Not bDelete Then
   Begin
      AbreQry(Sender);
      If QryDetalhe.EOF Then
      Begin
         DesabilitaCamposDetalhe;
         BtIncDet.Enabled := True;
      End
      Else
         HabilitaCamposDetalhe;
   End;        
end;

procedure TfrmOrdemMovBMF.dblTipoContratoChange(Sender: TObject);
begin
  inherited;
   If Not bDelete Then
   Begin
      AbreQry(Sender);
      If QryDetalhe.EOF Then
      Begin
         DesabilitaCamposDetalhe;
         BtIncDet.Enabled := True;
      End
      Else
         HabilitaCamposDetalhe;
   End;
end;

procedure TfrmOrdemMovBMF.DesabilitaCamposDetalhe;
begin
   dbgOperacao.Enabled := False;
   BtAltDet.Enabled    := False;
   BtDelDet.Enabled    := False;
   BtIncDet.Enabled    := False;
end;

procedure TfrmOrdemMovBMF.HabilitaCamposDetalhe;
Begin
   dbgOperacao.Enabled := True;
   if QryDetalhe.FieldByName('STATMOVINV').AsString <> 'L' then
   begin
      BtAltDet.Enabled    := True;
      BtDelDet.Enabled    := True;
      BtIncDet.Enabled    := True;
      BtAltDet.Down       := False;
      BtDelDet.Down       := False;
      BtIncDet.Down       := False;
   end
   else
   begin
      BtAltDet.Enabled    := False;
      BtDelDet.Enabled    := False;
      BtIncDet.Enabled    := False;
      BtAltDet.Down       := True;
      BtDelDet.Down       := True;
      BtIncDet.Down       := True;
   end;
End;

procedure TfrmOrdemMovBMF.PosicionaNumBoleta;
Begin
   With QryNumBoleta Do
   Begin
      Close;
      if Trim(dblCorretora.Text) = '' then
         ParamByName('pIdCorretvalores').Clear
      else
         ParamByName('pIdCorretvalores').AsInteger := QryCorretValores.FieldByName('IDCORRETVALORES').AsInteger;
      Open;
      If Not FieldByName('IDLOTE').IsNull Then
         dbeLote.Text := FieldByName('IDLOTE').AsString
      Else
      begin
         if (QryDetalhe.State = DsInsert) and (dbeLote.Text = '')  then
            dbeLote.Text :=  'BMF'+'/'+FormatFloat('000000',
                 LeUltRegistro(Nil,'CONTDOCRENVAR'+Copy(dbDtaOperacao.Text,9,2)));
      end;
      Close;
   End;
End;

procedure TfrmOrdemMovBMF.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
  inherited;
    If DtmBaseDados.dbBaseDados.InTransaction Then
       DtmBaseDados.dbBaseDados.Rollback;
    Qry.Close;
    QryTipoOperacao.Close;
    QryCarteira.Close;
    QryCorretValores.Close;
    QryTipoContrInvest.Close;
    QryMoeda.Close;
    QryInvestimento.Close;
    QryDetalhe.Close;
    QryParamInvest.Open;
    QryContratoInvestim.Close;
    QryAux.Close;
    QryAutorizador.Close;
end;

procedure TfrmOrdemMovBMF.sbtnProcurarClick(Sender: TObject);
begin
  inherited;
   bDelete := False;
   CMeCadastro.AtualizaBotoes(self);
end;

procedure TfrmOrdemMovBMF.dbgOperacaoKeyDown(Sender: TObject;
  var Key: Word; Shift: TShiftState);
begin
   if QryDetalhe.State <> dsInsert then
      dbeLote.Text := QryDetalhe.FieldByName('IDLOTE').AsString;
   If Key = 27  Then
      Key := 0;

   If ((Key = 38) Or (Key = 40)) And
      (dbgOperacao.Options = [TwwDBgridOption(dgEditing),
                              TwwDBgridOption(dgAlwaysShowEditor),
                              TwwDBgridOption(dgTitles),
                              TwwDBgridOption(dgIndicator),
                              TwwDBgridOption(dgColumnResize),
                              TwwDBgridOption(dgColLines),
                              TwwDBgridOption(dgRowLines),
                              TwwDBgridOption(dgAlwaysShowSelection),
                              TwwDBgridOption(dgCancelOnExit),
                              TwwDBgridOption(dgWordWrap)]) Then
      Key := 0;
   MontaStatusBoleta;
  inherited;
end;

procedure TfrmOrdemMovBMF.dbgOperacaoKeyUp(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
   if QryDetalhe.State <> dsInsert then
      dbeLote.Text := QryDetalhe.FieldByName('IDLOTE').AsString;
   If Key = 27  Then
      Key := 0;

   If ((Key = 38) Or (Key = 40)) And
      (dbgOperacao.Options = [TwwDBgridOption(dgEditing),
                              TwwDBgridOption(dgAlwaysShowEditor),
                              TwwDBgridOption(dgTitles),
                              TwwDBgridOption(dgIndicator),
                              TwwDBgridOption(dgColumnResize),
                              TwwDBgridOption(dgColLines),
                              TwwDBgridOption(dgRowLines),
                              TwwDBgridOption(dgAlwaysShowSelection),
                              TwwDBgridOption(dgCancelOnExit),
                              TwwDBgridOption(dgWordWrap)]) Then
      Key := 0;
   MontaStatusBoleta;
  inherited;
end;

procedure TfrmOrdemMovBMF.BtIncDetClick(Sender: TObject);
Var
   sTime, sdbeNumDoc : String;

begin
   bTrocaLine := False;
   // Verifica os campos da principal e da detalhe
   If Not ValidaCamposPrincipal Then
   Begin
      BtIncDet.Down := False;
      bTrocaLine    := True;
      Exit;
   End;

   BtIncDet.Enabled    := False;
   BtAltDet.Enabled    := False;
   BtDelDet.Enabled    := False;
   BtOkDet.Enabled     := True;
   BtCancDet.Enabled   := True;
   BtVoltaDet.Enabled  := True;

   DesabilitaCampos;

   dbgOperacao.Enabled       := True;

   dbgOperacao.SelectedIndex := 0;
   dbgOperacao.Options       := dbgOperacao.Options + [TwwDBgridOption(dgEditing)];
   dbgOperacao.Font.Color    := clBlack;

   sdbeNumDoc := QryDetalhe.FieldByName('NUMDOCMOVINV').AsString;

   QryDetalhe.Append;

   PosicionaNumBoleta;

   if dbgOperacao.CanFocus then
      dbgOperacao.SetFocus;

   QryDetalhe.FieldByName('NUMDOCMOVINV').AsString := sdbeNumDoc;

   QryDetalhe.FieldByName('IDLOTE').AsString       := dbeLote.Text;

   If Length(TimeToStr(Time)) <> 8 Then
      sTime := ' '+TimeToStr(Time)
   Else
      sTime := TimeToStr(Time);

   sTime := Copy(sTime,1,5);

   QryDetalhe.FieldByName('HORAMOV').AsString      := sTime;
   QryDetalhe.FieldByName('QTDEORDMOVINV').AsFloat := 0;
   QryDetalhe.FieldByName('OBSAUTMOV').AsString    := wOrdAutorizacao;

   If Not DtmBaseDados.dbBaseDados.InTransaction Then
      DtmBaseDados.dbBaseDados.StartTransaction;
  inherited;

end;

function TfrmOrdemMovBMF.ValidaCamposPrincipal : Boolean;
begin
   Result := True;
   If Trim(dbDtaOperacao.Text) = '' Then
   Begin
      MsgDlg('Informe a Data de Operação.     ',
          'Mensagem do Sistema', MtError,[MbOk],0);
      if dbDtaOperacao.Canfocus then
         dbDtaOperacao.SetFocus;
      Result := False;
      Exit;
   End;
   If dblOperacao.Text = '' Then
   Begin
      MsgDlg('Informe a Operação.     ',
          'Mensagem do Sistema', MtError,[MbOk],0);
      if dblOperacao.Canfocus then
         dblOperacao.SetFocus;
      Result := False;
      Exit;
   End;
   If dblTipoContrato.Text = '' Then
   Begin
      MsgDlg('Informe o tipo de Contrato.         ',
          'Mensagem do Sistema', MtError,[MbOk],0);
      if dblTipoContrato.Canfocus then
         dblTipoContrato.SetFocus;
      Result := False;
      Exit;
   End;
   If dblSerie.Text = '' Then
   Begin
      MsgDlg('Informe a Série.         ',
          'Mensagem do Sistema', MtError,[MbOk],0);
      if dblSerie.Canfocus then
         dblSerie.SetFocus;
      Result := False;
      Exit;
   End;

   if pRPI.FLGCARTGERENC <> 'S' then
   begin
      If dblCarteira.Text = '' Then
      Begin
         MsgDlg('Informe a Carteira.     ',
             'Mensagem do Sistema', MtError,[MbOk],0);
         if dblCarteira.Canfocus then
            dblCarteira.SetFocus;
         Result := False;
         Exit;
      End;
   end;
   
   If dblCorretora.Text = '' Then
   Begin
      MsgDlg('Informe a Corretora.     ',
          'Mensagem do Sistema', MtError,[MbOk],0);
      if dblCorretora.Canfocus then
         dblCorretora.SetFocus;
      Result := False;
      Exit;
   End;
   If dblAutorizador.Text = '' Then
   Begin
      MsgDlg('Informe o autorizador da operação.     ',
          'Mensagem do Sistema', MtError,[MbOk],0);
      if dblAutorizador.Canfocus then
         dblAutorizador.SetFocus;
      Result := False;
      Exit;
   End;
end;

procedure TfrmOrdemMovBMF.DesabilitaCampos;
begin
   sbtnProcurar.Enabled      := False;
   dbDtaOperacao.Enabled     := False;
   dblCarteira.Enabled       := False;
   dblCorretora.Enabled      := False;
   dblOperacao.Enabled       := False;
   dblSerie.Enabled          := False;
   dblTipoContrato.Enabled   := False;
   dblAutorizador.Enabled    := False;
End;

procedure TfrmOrdemMovBMF.BtOkDetClick(Sender: TObject);
Var
   sTime       : String;
   idCustodia  : Integer;
   fQuantidade : Double;
begin
   bTrocaLine := True;
   //AL_1
   if not CtrlInvContab.TestaPeriodo(dbDtaOperacao.Text, 8) then
   begin
      MsgDlg(CtrlInvContab.MessageInfo, 'Mensagem do Sistema', MtWarning, [mbOk],0);
      if dbgOperacao.CanFocus then
         dbgOperacao.SetFocus;
      Exit;
   end;

   // Verifica se exige autorização
   if (pRPI.FLGORDMOVINV <> 'N') and (Trim(QryDetalhe.FieldByName('OBSAUTMOV').asString) = '') then
   begin
      MsgDlg('Falta informar a autorização da ordem.','Mensagem do Sistema', MtError,[MbOk],0);
      if dbgOperacao.CanFocus then
         dbgOperacao.SetFocus;
      Exit;
   end;
   // Verifica os campos da detalhe
   If Not ValidaCamposDetalhe Then
   Begin
      bTrocaLine := False;
      Exit;
   End;

   If dbeLote.Text = '' Then
   Begin
      MsgDlg('Falta número do lote.     ','Mensagem do Sistema', MtError,[MbOk],0);
      Exit;
   End;

   QryDetalhe.FieldByName('DATAORDMOVINV').AsDateTime := StrToDateTime(dbDtaOperacao.Text+
                                                     ' '+QryDetalhe.FieldByName('HORAMOV').AsString);

   If QryDetalhe.State = DsInsert Then
   Begin
      QryDetalhe.FieldByName('IDUSUARIO').AsInteger        := QryAutorizadorIDUSUARIO.AsInteger;
      QryDetalhe.FieldByName('IDTIPOINVEST').AsInteger     := 8;

      If Trim(dblCarteira.Text) <> '' Then
      Begin
         QryDetalhe.FieldByName('IDCARTEIRAINVEST').AsInteger :=
                    QryCarteira.FieldByName('IDCARTEIRAINVEST').AsInteger;

         QryDetalhe.FieldByName('IDCARTEIRAGERENC').AsInteger :=
                    QryCarteira.FieldByName('IDCARTEIRAGERENC').AsInteger;
         If QryCarteira.FieldByName('IDCARTEIRAGERENC').AsInteger = 0 Then
            QryDetalhe.FieldByName('IDCARTEIRAGERENC').Clear;
      End;


      QryDetalhe.FieldByName('IDCORRETVALORES').AsInteger  :=
                 QryCorretValores.FieldByName('IDCORRETVALORES').AsInteger;
      QryDetalhe.FieldByName('IDTIPOOPERACAO').AsInteger :=
                 QryTipoOperacao.FieldByName('IDTIPOOPERACAO').AsInteger;
      QryDetalhe.FieldByName('IDINVESTIMENTO').AsInteger :=
                 QryInvestimento.FieldByName('IDINVESTIMENTO').AsInteger;

      If wTipoOrdMov = 'N' then
         QryDetalhe.FieldByName('STATMOVINV').AsString   := 'A'   // Passo como Autorizado
      Else
         QryDetalhe.FieldByName('STATMOVINV').AsString   := 'A';   // Irei Autorizar depois no Form de Autorizacao
                                                                   // Qdo for feito Form, passar " " ao invés de 'A'

      QryDetalhe.FieldByName('IDORDMOVINV').AsInteger    := LeUltRegistro(nil,'ORDMOVINV');
      if Trim(QryDetalhe.FieldByName('OBSAUTMOV').AsString) <> '' then
         wOrdAutorizacao := QryDetalhe.FieldByName('OBSAUTMOV').AsString;
   End;

   QryDetalhe.FieldByName('IDCUSTODIANTE').AsInteger :=
      QryParamInvest.FieldByName('IDBMF').AsInteger;
   QryDetalhe.FieldByName('IDBOLSAVALORES').AsInteger :=
      QryParamInvest.FieldByName('IDBMF').AsInteger;
   QryDetalhe.FieldByName('IDAUTORIZACAO').AsInteger :=
      QryAutorizador.FieldByName('IDUSUARIO').AsInteger;
   QryDetalhe.FieldByName('IDPLANPREVCTBPATR').AsInteger := iPlanPrevCtbPatro;

   // Testa se o ContratoInvestim já existe para Inclusão
   if QryDetalhe.State = DsInsert then
   begin
      QryContratoInvestim.Close;
      QryContratoInvestim.ParamByName('IDINVESTIMENTO').AsInteger :=
         QryInvestimento.FieldByName('IDINVESTIMENTO').AsInteger;
      QryContratoInvestim.ParamByName('IDCARTLASTRO').AsInteger :=
         QryCarteira.FieldByName('IDCARTEIRAINVEST').AsInteger;
      QryContratoInvestim.ParamByName('IDCORRETVALORES').AsInteger :=
         QryCorretValores.FieldByName('IDCORRETVALORES').AsInteger;
      QryContratoInvestim.ParamByName('IDLOTE').AsString :=
         QryDetalhe.FieldByName('IDLOTE').AsString;
      QryContratoInvestim.Open;
      if QryContratoInvestim.isEmpty then
      begin
         QryContratoInvestim.Append;
         QryContratoInvestim.FieldByName('IDCONTRATOINVEST').AsInteger :=
            LeUltRegistro(nil,'CONTRATOINVESTIM');
         QryContratoInvestim.FieldByName('IDTIPOCONTRINVEST').AsInteger :=
            QryTipoContrInvest.FieldByName('IDTIPOCONTRINVEST').AsInteger;
         QryContratoInvestim.FieldByName('IDEMISSOR').AsInteger :=
            QryParamInvest.FieldByName('IDBMF').AsInteger;
         QryContratoInvestim.FieldByName('IDINVESTIMENTO').AsInteger :=
            QryInvestimento.FieldByName('IDINVESTIMENTO').AsInteger;
         QryContratoInvestim.FieldByName('IDCORRETVALORES').AsInteger :=
            QryCorretValores.FieldByName('IDCORRETVALORES').AsInteger;
         QryContratoInvestim.FieldByName('IDBOLSAVALORES').AsInteger :=
            QryParamInvest.FieldByName('IDBMF').AsInteger;
         QryContratoInvestim.FieldByName('SERIE').AsString :=
            QryInvestimento.FieldByName('DESCINVESTIMENTO').AsString;
         QryContratoInvestim.FieldByName('IDLOTE').AsString :=
            QryDetalhe.FieldByName('IDLOTE').AsString;
         QryContratoInvestim.FieldByName('IDCARTLASTRO').AsInteger :=
            QryCarteira.FieldByName('IDCARTEIRAINVEST').AsInteger;
      end;
   end;

   If Not DtmBaseDados.dbBaseDados.InTransaction Then
      DtmBaseDados.dbBaseDados.StartTransaction;

   Try
     QryDetalhe.Post;
     QryDetalhe.ApplyUpdates;
     QryDetalhe.CommitUpdates;
     If (QryContratoInvestim.State = DsInsert) Or (QryContratoInvestim.State = DsEdit)Then
     begin
        QryContratoInvestim.Post;
        QryContratoInvestim.ApplyUpdates;
        QryContratoInvestim.CommitUpdates;
     end;

     dbeLote.Text   := QryDetalhe.FieldByName('IDLOTE').AsString;

   Except
     MsgDlg('Não foi possível realizar a Operação.',
            'Mensagem do Sistema ',mtWarning,[mbOK],0);
     CancelaOperacao;
     QryDetalhe.Close;
     QryDetalhe.Open;
     AlimentaQryDetalhe;
     Exit;
   End;

   DtmBaseDados.dbBaseDados.Commit;

   IDORDMOVINV := QryDetalhe.FieldByName('IDORDMOVINV').AsInteger;

   HabilitaCampos;
   BtIncDet.Enabled    := True;
   BtAltDet.Enabled    := True;
   BtDelDet.Enabled    := True;
   BtOkDet.Enabled     := False;
   BtCancDet.Enabled   := False;
   BtVoltaDet.Enabled  := False;

   dbgOperacao.Options := dbgOperacao.Options - [TwwDBgridOption(dgEditing)];
   dbgOperacao.Color   := clSilver;
   QryDetalhe.Close;
   QryDetalhe.Open;
   AlimentaQryDetalhe;

   QryDetalhe.DisableControls;
   QryDetalhe.Locate('IDORDMOVINV', IDORDMOVINV, [loPartialKey]);
   QryDetalhe.EnableControls;
   // Inclui novo registro
   BtIncDet.Click;
   If Length(TimeToStr(Time)) <> 8 Then
      sTime := ' '+TimeToStr(Time)
   Else
      sTime := TimeToStr(Time);

   sTime := Copy(sTime,1,5);
   QryDetalhe.FieldByName('HORAMOV').AsString        := sTime;
end;

function TfrmOrdemMovBMF.ValidaCamposDetalhe : Boolean;
begin
   Result := True;
   If QryDetalhe.FieldByName('HORAMOV').IsNull Then
   Begin
      MsgDlg('Informe a Hora.                               ',
          'Mensagem do Sistema', MtError,[MbOk],0);
      if dbgOperacao.CanFocus then
         dbgOperacao.SetFocus;
      Result := False;
      Exit;
   End;

   If QryDetalhe.FieldByName('QTDEORDENADA').IsNull Then
   Begin
      MsgDlg('Informe a Quantidade Negociada.',
          'Mensagem do Sistema', MtError,[MbOk],0);
      if dbgOperacao.CanFocus then
         dbgOperacao.SetFocus;
      Result := False;
      Exit;
   End;

   If QryDetalhe.FieldByName('PUORDMOVINV').IsNull Then
   Begin
      MsgDlg('Informe o Preço.               ',
          'Mensagem do Sistema', MtError,[MbOk],0);
      if dbgOperacao.CanFocus then
         dbgOperacao.SetFocus;
      Result := False;
      Exit;
   End;

   If QryDetalhe.FieldByName('VALOR').IsNull Then
   Begin
      MsgDlg('Informe o Valor.               ',
          'Mensagem do Sistema', MtError,[MbOk],0);
      if dbgOperacao.CanFocus then
         dbgOperacao.SetFocus;
      Result := False;
      Exit;
   End;
end;

procedure TfrmOrdemMovBMF.CancelaOperacao;
begin
   bTrocaLine := True;
   HabilitaCampos;
   BtIncDet.Enabled    := True;
   BtAltDet.Enabled    := True;
   BtDelDet.Enabled    := True;
   BtOkDet.Enabled     := False;
   BtCancDet.Enabled   := False;
   BtVoltaDet.Enabled  := False;

   BtIncDet.Down       := False;
   BtAltDet.Down       := False;
   BtDelDet.Down       := False;

   QryDetalhe.Cancel;

   If DtmBaseDados.dbBaseDados.InTransaction Then
      DtmBaseDados.dbBaseDados.Rollback;

   dbgOperacao.Options       := dbgOperacao.Options - [TwwDBgridOption(dgEditing)];
   dbgOperacao.Font.Color    := clGray;
   dbgOperacao.Color         := clSilver;
   if dbgOperacao.CanFocus then
      dbgOperacao.SetFocus;

   QryDetalhe.Close;
   QryDetalhe.Open;
   AlimentaQryDetalhe;

   If QryDetalhe.IsEmpty Then
   Begin
      DesabilitaCamposDetalhe;
      BtIncDet.Enabled := True;
   End;
end;

procedure TfrmOrdemMovBMF.HabilitaCampos;
begin
   sbtnProcurar.Enabled      := True;
   dbDtaOperacao.Enabled     := True;
   dblCarteira.Enabled       := True;
   dblCorretora.Enabled      := True;
   dblOperacao.Enabled       := True;
   dblSerie.Enabled          := True;
   dblTipoContrato.Enabled   := True;
   dblAutorizador.Enabled    := True; 
End;

procedure TfrmOrdemMovBMF.dbgOperacaoExit(Sender: TObject);
begin
  inherited;
   KeyPreview := True;
   if (QryDetalhe.State = DsInsert) Or (QryDetalhe.State = DsEdit)Then
   begin
      with QryParamContrBMF do
      begin
         Close;
         ParamByName('pIDTIPOCONTRINVEST').AsInteger :=
            QryTipoContrInvest.FieldByName('IDTIPOCONTRINVEST').AsInteger;
         Open;
      end;
      QryDetalhe.FieldByName('VALOR').AsFloat := QryDetalhe.FieldByName('QTDEORDENADA').AsFloat *
                                                 QryDetalhe.FieldByName('PUORDMOVINV').AsFloat;
      // Esta conta somente vale para IBOVESPA
      QryDetalhe.FieldByName('VALOR').AsFloat := QryDetalhe.FieldByName('VALOR').AsFloat *
                                                 QryParamContrBMFPESOCONTRATO.AsFloat;
   end;
   MontaStatusBoleta;
end;

procedure TfrmOrdemMovBMF.dbgOperacaoColExit(Sender: TObject);
begin
   inherited;
   if QryDetalhe.State <> dsInsert then
      dbeLote.Text := QryDetalhe.FieldByName('IDLOTE').AsString;
   if (QryDetalhe.State = DsInsert) or (QryDetalhe.State = DsEdit)then
   begin
      with QryParamContrBMF do
      begin
         Close;
         ParamByName('pIDTIPOCONTRINVEST').AsInteger :=
            QryTipoContrInvest.FieldByName('IDTIPOCONTRINVEST').AsInteger;
         Open;
      end;
      QryDetalhe.FieldByName('VALOR').AsFloat := QryDetalhe.FieldByName('QTDEORDENADA').AsFloat *
                                                 QryDetalhe.FieldByName('PUORDMOVINV').AsFloat;
      // Esta conta somente vale para IBOVESPA
      QryDetalhe.FieldByName('VALOR').AsFloat := QryDetalhe.FieldByName('VALOR').AsFloat *
                                                 QryParamContrBMFPESOCONTRATO.AsFloat;
   end;
   MontaStatusBoleta;
end;

procedure TfrmOrdemMovBMF.BtCancDetClick(Sender: TObject);
begin
  inherited;
   CancelaOperacao;
   if QryDetalhe.State <> dsInsert then
      dbeLote.Text := QryDetalhe.FieldByName('IDLOTE').AsString;
end;

procedure TfrmOrdemMovBMF.dblTipoContratoCloseUp(Sender: TObject;
  LookupTable, FillTable: TDataSet; modified: Boolean);
begin
  inherited;
   If Not bDelete Then
   Begin
      AbreQry(Sender);
      If QryDetalhe.EOF Then
      Begin
         DesabilitaCamposDetalhe;
         BtIncDet.Enabled := True;
      End
      Else
         HabilitaCamposDetalhe;
   End;              
end;

procedure TfrmOrdemMovBMF.dblSerieCloseUp(Sender: TObject; LookupTable,
  FillTable: TDataSet; modified: Boolean);
begin
  inherited;
   If Not bDelete Then
   Begin
      AbreQry(Sender);
      If QryDetalhe.EOF Then
      Begin
         DesabilitaCamposDetalhe;
         BtIncDet.Enabled := True;
      End
      Else
         HabilitaCamposDetalhe;
   End;
   PosicionaNumBoleta;
   MontaTotais;  
end;

procedure TfrmOrdemMovBMF.dblCarteiraCloseUp(Sender: TObject; LookupTable,
  FillTable: TDataSet; modified: Boolean);
begin
  inherited;
   If Not bDelete Then
   Begin
      AbreQry(Sender);
      If QryDetalhe.EOF Then
      Begin
         DesabilitaCamposDetalhe;
         BtIncDet.Enabled := True;
      End
      Else
         HabilitaCamposDetalhe;
   End;                  
end;

procedure TfrmOrdemMovBMF.FormKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  inherited;
  If Key = VK_Return Then      //Enter - Troca de Campo
     SelectNext(ActiveControl,True,True)
end;

procedure TfrmOrdemMovBMF.dbgOperacaoEnter(Sender: TObject);
begin
  inherited;
   if QryDetalhe.State <> dsInsert then
      dbeLote.Text := QryDetalhe.FieldByName('IDLOTE').AsString;
   KeyPreview := False;
   MontaStatusBoleta;
end;

procedure TfrmOrdemMovBMF.MontaStatusBoleta;
begin
   if QryDetalhe.FieldByName('STATMOVINV').AsString = '' then
      lblBoletaAF.Caption := ''
   else if QryDetalhe.FieldByName('STATMOVINV').AsString = 'A' then
      lblBoletaAF.Caption := 'Boleta em Aberto'
   else if QryDetalhe.FieldByName('STATMOVINV').AsString = 'L' then
      lblBoletaAF.Caption := 'Boleta Fechada';
end;

procedure TfrmOrdemMovBMF.bbtnSairClick(Sender: TObject);
begin
  inherited;
   If DtmBaseDados.dbBaseDados.InTransaction Then
      DtmBaseDados.dbBaseDados.Rollback;
end;

procedure TfrmOrdemMovBMF.BtDelDetClick(Sender: TObject);
begin
  inherited;
   bDelete := True;
   If QryDetalhe.FieldByName('STATMOVINV').AsString = 'L' Then
   Begin
      MsgDlg('Ordem de movimentação já calculada. Não pode ser excluída.',
             'Mensagem do Sistema ',mtWarning,[mbOK],0);
      BtDelDet.Down := False;
      bTrocaLine    := True;
      Exit;
   End;
   // Pede Confirmacao
   If MsgDlg('Confirma Exclusão ?', 'Mensagem do Sistema ',
      mtConfirmation , [mbYes, mbNo], 0) = mrNo Then Begin
      BtDelDet.Down := False;
      bTrocaLine    := True;
      Exit;
   End;

   //--- Exclui a linha corrente
   Try
      DtmBaseDados.dbBaseDados.StartTransaction;

      //Verifica se existe ORDMOVINV para o CONTRATOINVESTIM após deleção
      QryContratoInvestim.Close;
      QryContratoInvestim.ParamByName('IDINVESTIMENTO').AsInteger :=
         QryDetalhe.FieldByName('IDINVESTIMENTO').AsInteger;
      QryContratoInvestim.ParamByName('IDCARTLASTRO').AsInteger :=
          QryDetalhe.FieldByName('IDCARTEIRAINVEST').AsInteger;
      QryContratoInvestim.ParamByName('IDCORRETVALORES').AsInteger :=
         QryDetalhe.FieldByName('IDCORRETVALORES').AsInteger;
      QryContratoInvestim.ParamByName('IDLOTE').AsString :=
         QryDetalhe.FieldByName('IDLOTE').AsString;

      QryAux.Close;
      QryAux.ParamByName('IDLOTE').AsString :=
         QryDetalhe.FieldByName('IDLOTE').AsString;

      QryDetalhe.Delete;
      QryDetalhe.ApplyUpdates;
      QryDetalhe.CommitUpdates;

      QryContratoInvestim.Open;
      QryAux.Open; // Abre após deleção da ORDMOVINV
      if QryAux.isEmpty then // Não existem ORDMOVINV para o IDLOTE -> Deve ser excluido CONTRATOINVESTIM
      begin
         QryContratoInvestim.Delete;
         QryContratoInvestim.ApplyUpdates;
         QryContratoInvestim.CommitUpdates;
      end;

      DtmBaseDados.dbBaseDados.Commit;
   Except
      DtmBaseDados.dbBaseDados.Rollback;
      MsgDlg('Registro não Excluido ...',
             'Mensagem do Sistema ',mtWarning,[mbOK],0);
   End;

   AlimentaQryDetalhe;

   If QryDetalhe.IsEmpty Then
   Begin
      dbDtaOperacao.Text     := '';
      dblCarteira.Text       := '';
      dblCorretora.Text      := '';
      dblOperacao.Text       := '';
      dblSerie.Text          := '';
      dblTipoContrato.Text   := '';
      dbeLote.Text           := '';
      DesabilitaCamposDetalhe;
      HabilitaCampos;
      bDelete := False;
      QryTipoOperacao.Close;
      QryTipoOperacao.ParamByName('pIdTipoOperacao').Clear;
      QryTipoOperacao.Open;
      MontaTotais;
      MontaStatusBoleta;
      rPUMedioV.Value := 0;
      rPUMedioC.Value := 0;      
   End
   Else
      HabilitaCamposDetalhe;
   MontaTotais;
   QryContratoInvestim.Close;
   QryAux.Close;
end;

procedure TfrmOrdemMovBMF.BtAltDetClick(Sender: TObject);
begin
   bTrocaLine := False;

   inherited;

   BtIncDet.Enabled    := False;
   BtAltDet.Enabled    := False;
   BtDelDet.Enabled    := False;
   BtOkDet.Enabled     := True;
   BtCancDet.Enabled   := True;
   BtVoltaDet.Enabled  := True;

   DesabilitaCampos;

   dbgOperacao.SelectedIndex := 0;
   dbgOperacao.Options       := dbgOperacao.Options + [TwwDBgridOption(dgEditing)];
   dbgOperacao.Font.Color    := clBlack;
   if dbgOperacao.CanFocus then
      dbgOperacao.SetFocus;

   if QryDetalhe.State <> dsInsert then
      dbeLote.Text := QryDetalhe.FieldByName('IDLOTE').AsString;
   IDORDMOVINV      := QryDetalhe.FieldByName('IDORDMOVINV').AsInteger;

   QryDetalhe.Edit;
   QryDetalhe.FieldByName('IDLOTE').AsString := dbeLote.Text;

   DtmBaseDados.dbBaseDados.StartTransaction;
end;

procedure TfrmOrdemMovBMF.dbgOperacaoMouseDown(Sender: TObject;
  Button: TMouseButton; Shift: TShiftState; X, Y: Integer);
begin
  inherited;
   if QryDetalhe.State <> dsInsert then
      dbeLote.Text := QryDetalhe.FieldByName('IDLOTE').AsString;
   MontaStatusBoleta;
end;

procedure TfrmOrdemMovBMF.dbgOperacaoMouseUp(Sender: TObject;
  Button: TMouseButton; Shift: TShiftState; X, Y: Integer);
begin
  inherited;
   if QryDetalhe.State <> dsInsert then
      dbeLote.Text := QryDetalhe.FieldByName('IDLOTE').AsString;
   MontaStatusBoleta;
end;

procedure TfrmOrdemMovBMF.CmeCadastroAtualizaBotoes(Sender: TObject);
begin
  inherited;
   pnlFundo.Enabled    := True;
end;

procedure TfrmOrdemMovBMF.FormCreate(Sender: TObject);
begin
  inherited;
   WindowState := wsMaximized;
end;

procedure TfrmOrdemMovBMF.AtualizaTipoOperacao;
var
   iTipoOperacao : integer;
   wTpOperacao : string;
begin
   with QryTipoOperacao do
   begin
      iTipoOperacao := QryTipoOperacao.FieldByName('IDTIPOOPERACAO').AsInteger;
      wTpOperacao   := QryTipoOperacao.FieldByName('DESCTIPOOPERACAO').AsString;
      Close;
      if (QryDetalhe.IsEmpty) then
         ParamByName('pIdTipoOperacao').Clear;
      if (not QryDetalhe.IsEmpty) and (Trim(dbeLote.Text)<>'') and
         (QryDetalhe.FieldByName('IDTIPOOPERACAO').AsInteger <> 0) then // Boleta Selecionada e qry com conteúdo
         ParamByName('pIdTipoOperacao').AsInteger := QryDetalhe.FieldByName('IDTIPOOPERACAO').AsInteger;
      Open;
      if wTpOperacao <> '' then
      begin
         Locate('IDTIPOOPERACAO', iTipoOperacao ,[]);
         dblOperacao.Text := QryTipoOperacao.FieldByName('DESCTIPOOPERACAO').AsString;
      end;
   end;
end;

procedure TfrmOrdemMovBMF.dblCorretoraExit(Sender: TObject);
begin
  inherited;
   If Not bDelete Then
   Begin
      AbreQry(Sender);
      If QryDetalhe.EOF Then
      Begin
         DesabilitaCamposDetalhe;
         BtIncDet.Enabled := True;
         BtIncDet.Down    := False;
      End
      Else
      begin
         HabilitaCamposDetalhe;
         MontaStatusBoleta;
      end;
      PosicionaNumBoleta;
      MontaTotais;
   end;
end;

procedure TfrmOrdemMovBMF.dblOperacaoExit(Sender: TObject);
begin
  inherited;
   If Not bDelete Then
   Begin
      AbreQry(Sender);
      If QryDetalhe.EOF Then
      Begin
         DesabilitaCamposDetalhe;
         BtIncDet.Enabled := True;
      End
      Else
      begin
         HabilitaCamposDetalhe;
      end;
   End;
end;

procedure TfrmOrdemMovBMF.dblOperacaoCloseUp(Sender: TObject; LookupTable,FillTable: TDataSet; modified: Boolean);
begin
  inherited;
   If Not bDelete Then
   Begin
      AbreQry(Sender);
      If QryDetalhe.EOF Then
      Begin
         DesabilitaCamposDetalhe;
         BtIncDet.Enabled := True;
      End
      Else
      begin
         HabilitaCamposDetalhe;
      end;
   End;      
end;

procedure TfrmOrdemMovBMF.dblCorretoraCloseUp(Sender: TObject; LookupTable,
  FillTable: TDataSet; modified: Boolean);
begin
  inherited;
   If Not bDelete Then
   Begin
      AbreQry(Sender);
      If QryDetalhe.EOF Then
      Begin
         DesabilitaCamposDetalhe;
         BtIncDet.Enabled := True;
         BtIncDet.Down    := False;
      End
      Else
      begin
         HabilitaCamposDetalhe;
         MontaStatusBoleta;
      end;
      PosicionaNumBoleta;
      MontaTotais;
   end;     
end;

procedure TfrmOrdemMovBMF.LimpaTotais;
begin
   rQtdAtualTotal.Value := 0;
   lblPosicaoTotalCV.Caption := '';

   rQtdOperada.Value := 0;
   lblQtdOperadaCV.Caption   := '';

   rQtdPrevista.Value := 0;
   lblPosPrevistaCV.Caption := '';
end;

procedure TfrmOrdemMovBMF.MontaTotais;
begin
   LimpaTotais;
   if (Trim(dblTipoContrato.Text) <> '') and (Trim(dblSerie.Text) <> '') then
   begin
      fQtdSaldoDiaAntTotal := MontaSaldosPosicaoTotal;
      fQtdOperada := MontaTotalOperado;
      if lblPosicaoTotalCV.Caption = 'V' then
         fQtdSaldoDiaAntTotal := fQtdSaldoDiaAntTotal * -1;
      if lblQtdOperadaCV.Caption = 'V' then
         fQtdOperada := fQtdOperada * -1;
      if (fQtdSaldoDiaAntTotal + fQtdOperada) > 0 then // está comprado
         lblPosPrevistaCV.Caption := 'C';
      if (fQtdSaldoDiaAntTotal + fQtdOperada) < 0 then // está vendido
         lblPosPrevistaCV.Caption := 'V';
      rQtdPrevista.Value := ABS(fQtdSaldoDiaAntTotal + fQtdOperada);
   end;
end;

function TfrmOrdemMovBMF.MontaSaldosPosicaoTotal:Double;
begin
   Result := 0;
   with QryBuscaSaldoDiaAntTotal do
   begin
      Close;
      if Trim(dblSerie.Text)= '' then
         ParamByName('IdInvestimento').Clear
      else
         ParamByName('IdInvestimento').asInteger := QryInvestimento.FieldByName('IDINVESTIMENTO').asInteger;
      if Trim(dblCorretora.Text)= '' then
         ParamByName('IdCorretValores').Clear
      else
         ParamByName('IdCorretValores').asInteger := QryCorretValores.FieldByName('IdCorretValores').asInteger;

      ParamByName('dDataAtu').asString        := dbDtaOperacao.Text;
      Open;
      if not IsEmpty then
      begin
         Result := ABS(ABS(QryBuscaSaldoDiaAntTotal.FieldByName('QTDCOMPRADA').AsFloat) -
                       ABS(QryBuscaSaldoDiaAntTotal.FieldByName('QTDVENDIDA').AsFloat));
         rQtdAtualTotal.Value := Result;

         if Result <> 0 then // Se possui posição
         begin
            // Se Posição Comprada
            if ABS(QryBuscaSaldoDiaAntTotal.FieldByName('QTDCOMPRADA').AsFloat) >
               ABS(QryBuscaSaldoDiaAntTotal.FieldByName('QTDVENDIDA').AsFloat) then // Pos. Comprada
               lblPosicaoTotalCV.Caption := 'C';
            if ABS(QryBuscaSaldoDiaAntTotal.FieldByName('QTDCOMPRADA').AsFloat) <
               ABS(QryBuscaSaldoDiaAntTotal.FieldByName('QTDVENDIDA').AsFloat) then // Pos. Vendida
               lblPosicaoTotalCV.Caption := 'V';
         end;
      end;
   end;
end;

function TfrmOrdemMovBMF.MontaTotalOperado: Double;
begin
   Result := 0;
   with QryTotalOperado do
   begin
      Close;
      if Trim(dblSerie.Text)= '' then
         ParamByName('IdInvestimento').Clear
      else
         ParamByName('IdInvestimento').asInteger := QryInvestimento.FieldByName('IDINVESTIMENTO').asInteger;
      ParamByName('dDataAtu').asString        := dbDtaOperacao.Text;
      if Trim(dblCorretora.Text)= '' then
         ParamByName('IDCORRETVALORES').Clear
      else
         ParamByName('IDCORRETVALORES').asInteger := QryCorretValores.FieldByName('IDCORRETVALORES').asInteger;
      ParamByName('dDataAtu').asString        := dbDtaOperacao.Text;
      Open;
      if not IsEmpty then
      begin
         Result := ABS(ABS(QryTotalOperado.FieldByName('QTDCOMPRADA').AsFloat) -
                       ABS(QryTotalOperado.FieldByName('QTDVENDIDA').AsFloat));
         rQtdOperada.Value := Result;

         if Result <> 0 then // Se possui posição
         begin
            // Se Posição Comprada
            if ABS(QryTotalOperado.FieldByName('QTDCOMPRADA').AsFloat) >
               ABS(QryTotalOperado.FieldByName('QTDVENDIDA').AsFloat) then // Pos. Comprada
               lblQtdOperadaCV.Caption := 'C'
            else
               lblQtdOperadaCV.Caption := 'V';
         end;
      end;
   end;
end;

procedure TfrmOrdemMovBMF.dblSerieExit(Sender: TObject);
begin
  inherited;
   If Not bDelete Then
   Begin
      AbreQry(Sender);
      If QryDetalhe.EOF Then
      Begin
         DesabilitaCamposDetalhe;
         BtIncDet.Enabled := True;
      End
      Else
         HabilitaCamposDetalhe;
   End;
   PosicionaNumBoleta;
   MontaTotais;
end;

procedure TfrmOrdemMovBMF.dblTipoContratoExit(Sender: TObject);
begin
  inherited;
   If Not bDelete Then
   Begin
      AbreQry(Sender);
      If QryDetalhe.EOF Then
      Begin
         DesabilitaCamposDetalhe;
         BtIncDet.Enabled := True;
      End
      Else
         HabilitaCamposDetalhe;
   End;
end;

procedure TfrmOrdemMovBMF.dblCarteiraExit(Sender: TObject);
begin
  inherited;
   If Not bDelete Then
   Begin
      AbreQry(Sender);
      If QryDetalhe.EOF Then
      Begin
         DesabilitaCamposDetalhe;
         BtIncDet.Enabled := True;
      End
      Else
         HabilitaCamposDetalhe;
   End;
end;

procedure TfrmOrdemMovBMF.BtVoltaDetClick(Sender: TObject);
begin
  inherited;
   CancelaOperacao;
   if QryDetalhe.State <> dsInsert then
      dbeLote.Text := QryDetalhe.FieldByName('IDLOTE').AsString;
end;

procedure TfrmOrdemMovBMF.ToolbarButton971Click(Sender: TObject);
begin
  inherited;
    AbrirForm(FrmSimulacaoOperBMF, TFrmSimulacaoOperBMF, False);
end;

procedure TfrmOrdemMovBMF.CmeCadastroBeforeConfirma(sender: TObject;
  var Accept: Boolean);
begin
  inherited;
   //AL_1
   if not CtrlInvContab.TestaPeriodo(dbDtaOperacao.Text, 8) then
   begin
      MsgDlg(CtrlInvContab.MessageInfo, 'Mensagem do Sistema', MtWarning, [mbOk],0);
      if dbgOperacao.CanFocus then
         dbgOperacao.SetFocus;
      Exit;
   end;
end;

procedure TfrmOrdemMovBMF.sbtnApagarClick(Sender: TObject);
begin
   //AL_1
   if not CtrlInvContab.TestaPeriodo(dbDtaOperacao.Text, 8) then
   begin
      MsgDlg(CtrlInvContab.MessageInfo, 'Mensagem do Sistema', MtWarning, [mbOk],0);
      CmeCadastro.AtualizaBotoes(Self);      
      Exit;
   end;
  inherited;
end;

end.
