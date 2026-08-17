unit FCadConfOrdemMovBmf;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  FCadastroCS, DBGrids, Grids, Wwdbigrd, Wwdbgrid,
  Buttons, ComCtrls, Mask, DBCtrls, wwdblook, IvDictio, IvMulti, IvEMulti,
  MontaSelect, DBTables, Db, Wwdatsrc, Wwquery, TB97Ctls, MAHlpBtn,
  TB97Tlbr, TB97, ExtCtrls, wwdbdatetimepicker, CMDateTimePicker, StdCtrls,
  CmEventosCadastro, ImgList, UOperacaoInvest, TREdit, uCtrlInvContab;

type
  TfrmConfOrdemMovBMF = class(TfrmCadastroCS)
    lblDtaOperacao: TLabel;
    lblCarteira: TLabel;
    lblSerie: TLabel;
    dblCarteira: TwwDBLookupCombo;
    dblSerie: TwwDBLookupCombo;
    PageControl1: TPageControl;
    TabSheet1: TTabSheet;
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
    QryCarteiraIDCARTEIRAGERENC: TFloatField;
    QryDetalheIDCARTEIRAGERENC: TFloatField;
    dbeLote: TDBEdit;
    QryNumBoletaNUMDOCMOVINV: TStringField;
    QryNumBoletaIDLOTE: TStringField;
    btnNenhuma: TBitBtn;
    BtnInverte: TBitBtn;
    btnTodas: TBitBtn;
    ToolbarSep972: TToolbarSep97;
    ToolbarSep973: TToolbarSep97;
    ToolbarSep974: TToolbarSep97;
    QryDetalheSTACONFIRMA: TStringField;
    BtAutConfirma: TBitBtn;
    ToolbarSep975: TToolbarSep97;
    procedure FormShow(Sender: TObject);
    procedure dbDtaOperacaoExit(Sender: TObject);

    procedure AlimentaQryDetalhe;
    procedure dblCarteiraChange(Sender: TObject);
    procedure PosicionaNumBoleta;
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    Procedure CmeCadastroFind(Sender: TObject);
    procedure sbtnProcurarClick(Sender: TObject);
    procedure dblTipoContratoChange(Sender: TObject);

    procedure dblTipoContratoCloseUp(Sender: TObject; LookupTable,FillTable: TDataSet; modified: Boolean);
    procedure dblSerieCloseUp(Sender: TObject; LookupTable,FillTable: TDataSet; modified: Boolean);
    procedure dblCarteiraCloseUp(Sender: TObject; LookupTable,FillTable: TDataSet; modified: Boolean);
    procedure FormKeyDown(Sender: TObject; var Key: Word;Shift: TShiftState);
    procedure dbgOperacaoEnter(Sender: TObject);
    procedure bbtnSairClick(Sender: TObject);
    procedure CmeCadastroAtualizaBotoes(Sender: TObject);
    procedure FormCreate(Sender: TObject);

    procedure dblCorretoraExit(Sender: TObject);
    procedure dblOperacaoExit(Sender: TObject);

    procedure dblOperacaoCloseUp(Sender: TObject; LookupTable,FillTable: TDataSet; modified: Boolean);
    procedure dblCorretoraCloseUp(Sender: TObject; LookupTable,FillTable: TDataSet; modified: Boolean);
    procedure LimpaTotais;
    function MontaSaldosPosicaoTotal : Double;
    function MontaTotalOperado : Double;
    procedure dblSerieExit(Sender: TObject);
    procedure MontaTotais;
    procedure dblTipoContratoExit(Sender: TObject);
    procedure dblCarteiraExit(Sender: TObject);
    procedure CmeCadastroBeforeConfirma(sender: TObject;
      var Accept: Boolean);
    procedure QryDetalheSTACONFIRMAChange(Sender: TField);
    procedure btnTodasClick(Sender: TObject);
    procedure BtnInverteClick(Sender: TObject);
    procedure btnNenhumaClick(Sender: TObject);
    procedure BtAutConfirmaClick(Sender: TObject);

  private
    { Private declarations }

    procedure AbreQry;

    procedure HabilitaBotaoConfirma;

    function  VerifFechamento : Boolean;

    function  VerificaCorretoras : Boolean;
  public
    { Public declarations }
  end;

var
  frmConfOrdemMovBMF: TfrmConfOrdemMovBMF;
  bDelete, bTrocaLine, bGrid : Boolean;
  iCorretora, IDORDMOVINV : Integer;
  wTipoOrdMov,wOrdAutorizacao : String;
  dValor : Double;
  fQtdSaldoDiaAntTotal,fQtdSaldoDiaAntCorret,fQtdOperada,fQtdPrevista : Double;

implementation

uses UDatabase, DBaseDados,UMensErro,USistema, UOperComum, UBibliotecaInvest,
     FTelaAut, UDiasUteisInv, FPrincipal;

{$R *.DFM}

procedure TfrmConfOrdemMovBMF.FormShow(Sender: TObject);
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

    QryDetalheQTDEORDENADA.ReadOnly   := True;
    QryDetalhePUORDMOVINV.ReadOnly    := True;
    QryDetalheOBSAUTMOV.ReadOnly      := True;

end;

Procedure TfrmConfOrdemMovBMF.CmeCadastroFind(Sender: TObject);
Begin
   dbeLote.Text           := '';
   QryDetalhe.Close;

   If (MontaSelect.ValoresChave.Count > 0) And (MontaSelect.ValoresChave[0] <> '') Then
   Begin

     dbDtaOperacao.Date := StrToDate(MontaSelect.ValoresChave[0]);

     dblCarteira.Text    := '';
     If MontaSelect.ValoresChave[1] <> '' Then
     begin
        if QryCarteira.Locate('IDCARTEIRAINVEST', MontaSelect.ValoresChave[1], [loPartialKey]) Then
           dblCarteira.Text := QryCarteira.FieldByName('DESCCARTINVEST').AsString;
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
   End;
End;

procedure TfrmConfOrdemMovBMF.AbreQry;
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
      if IsEmpty then
      begin
         dbgOperacao.Options := dbgOperacao.Options - [TwwDBgridOption(dgEditing)];
         close;
      end
      else
      begin
         If Not DtmBaseDados.dbBaseDados.InTransaction Then
            DtmBaseDados.dbBaseDados.StartTransaction;

         dbgOperacao.Options := dbgOperacao.Options + [TwwDBgridOption(dgEditing)];
      end;
   End;
End;

procedure TfrmConfOrdemMovBMF.AlimentaQryDetalhe;
var
   fQtdOperC,fVlrOperC,fQtdOperV,fVlrOperV : Double;
Begin
   With QryDetalhe Do
   Begin
      QryDetalheVALOR.ReadOnly  := False;
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
         with QryParamContrBMF do
         begin
            Close;
            ParamByName('pIDTIPOCONTRINVEST').AsInteger :=
               QryTipoContrInvest.FieldByName('IDTIPOCONTRINVEST').AsInteger;
            Open;
         end;
         
         Edit;
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
       QryDetalheVALOR.ReadOnly  := True;      
   End;
end;

procedure TfrmConfOrdemMovBMF.dbDtaOperacaoExit(Sender: TObject);
begin
  inherited;
   bDelete := False;
   If Not bDelete Then
      AbreQry;

   if (trim(dbDtaOperacao.Text) <> '') and (dbDtaOperacao.tag <> 1) then
   begin
      QryInvestimento.Close;
      QryInvestimento.ParamByName('pDataRef').AsString := dbDtaOperacao.Text;
      QryInvestimento.Open;
   end;
   
   dbDtaOperacao.tag := 0;

end;

procedure TfrmConfOrdemMovBMF.dblCarteiraChange(Sender: TObject);
begin
  inherited;
   If Not bDelete Then
      AbreQry;
end;

procedure TfrmConfOrdemMovBMF.dblTipoContratoChange(Sender: TObject);
begin
  inherited;
   If Not bDelete Then
      AbreQry;
end;

procedure TfrmConfOrdemMovBMF.PosicionaNumBoleta;
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

procedure TfrmConfOrdemMovBMF.FormClose(Sender: TObject;
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

procedure TfrmConfOrdemMovBMF.sbtnProcurarClick(Sender: TObject);
begin
  inherited;
   bDelete := False;
   CMeCadastro.AtualizaBotoes(self);
end;

procedure TfrmConfOrdemMovBMF.dblTipoContratoCloseUp(Sender: TObject;
  LookupTable, FillTable: TDataSet; modified: Boolean);
begin
  inherited;
   If Not bDelete Then
      AbreQry;
end;

procedure TfrmConfOrdemMovBMF.dblSerieCloseUp(Sender: TObject; LookupTable,
  FillTable: TDataSet; modified: Boolean);
begin
  inherited;
   If Not bDelete Then
      AbreQry;

   PosicionaNumBoleta;
   MontaTotais;
end;

procedure TfrmConfOrdemMovBMF.dblCarteiraCloseUp(Sender: TObject; LookupTable,
  FillTable: TDataSet; modified: Boolean);
begin
  inherited;
   If Not bDelete Then
      AbreQry;
end;

procedure TfrmConfOrdemMovBMF.FormKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  inherited;
  If Key = VK_Return Then      //Enter - Troca de Campo
     SelectNext(ActiveControl,True,True)
end;

procedure TfrmConfOrdemMovBMF.dbgOperacaoEnter(Sender: TObject);
begin
  inherited;
   bGrid := True;
end;

procedure TfrmConfOrdemMovBMF.bbtnSairClick(Sender: TObject);
begin
  inherited;
   If DtmBaseDados.dbBaseDados.InTransaction Then
      DtmBaseDados.dbBaseDados.Rollback;
end;

procedure TfrmConfOrdemMovBMF.CmeCadastroAtualizaBotoes(Sender: TObject);
begin
  inherited;
   pnlFundo.Enabled    := True;
end;

procedure TfrmConfOrdemMovBMF.FormCreate(Sender: TObject);
begin
  inherited;
   if (TForm(Sender).Height > FrmPrincipal.ClientHeight - 50{Tamanho da barra de tarefas e barra de staus}) or
      (TForm(Sender).Width > FrmPrincipal.ClientWidth - 4 {Margem de segurança}) then
      WindowState := wsMaximized
   else
      WindowState := wsNormal;
end;

procedure TfrmConfOrdemMovBMF.dblCorretoraExit(Sender: TObject);
begin
  inherited;
   If Not bDelete Then
   Begin
      AbreQry;
      PosicionaNumBoleta;
      MontaTotais;
   end;
end;

procedure TfrmConfOrdemMovBMF.dblOperacaoExit(Sender: TObject);
begin
  inherited;
   If Not bDelete Then
      AbreQry;
end;

procedure TfrmConfOrdemMovBMF.dblOperacaoCloseUp(Sender: TObject; LookupTable,FillTable: TDataSet; modified: Boolean);
begin
  inherited;
   If Not bDelete Then
      AbreQry;
end;

procedure TfrmConfOrdemMovBMF.dblCorretoraCloseUp(Sender: TObject; LookupTable,
  FillTable: TDataSet; modified: Boolean);
begin
  inherited;
   If Not bDelete Then
   Begin
      AbreQry;

      PosicionaNumBoleta;
      MontaTotais;
   end;     
end;

procedure TfrmConfOrdemMovBMF.LimpaTotais;
begin
   rQtdAtualTotal.Value := 0;
   lblPosicaoTotalCV.Caption := '';

   rQtdOperada.Value := 0;
   lblQtdOperadaCV.Caption   := '';

   rQtdPrevista.Value := 0;
   lblPosPrevistaCV.Caption := '';
end;

procedure TfrmConfOrdemMovBMF.MontaTotais;
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

function TfrmConfOrdemMovBMF.MontaSaldosPosicaoTotal:Double;
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

function TfrmConfOrdemMovBMF.MontaTotalOperado: Double;
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

procedure TfrmConfOrdemMovBMF.dblSerieExit(Sender: TObject);
begin
  inherited;
   If Not bDelete Then
      AbreQry;

   PosicionaNumBoleta;
   MontaTotais;
end;

procedure TfrmConfOrdemMovBMF.dblTipoContratoExit(Sender: TObject);
begin
  inherited;
   If Not bDelete Then
      AbreQry;
end;

procedure TfrmConfOrdemMovBMF.dblCarteiraExit(Sender: TObject);
begin
  inherited;
   If Not bDelete Then
      AbreQry;
end;

procedure TfrmConfOrdemMovBMF.CmeCadastroBeforeConfirma(sender: TObject;
  var Accept: Boolean);
begin
  inherited;
   if not CtrlInvContab.TestaPeriodo(dbDtaOperacao.Text, 8) then
   begin
      MsgDlg(CtrlInvContab.MessageInfo, 'Mensagem do Sistema', MtWarning, [mbOk],0);
      if dbgOperacao.CanFocus then
         dbgOperacao.SetFocus;
      Exit;
   end;
end;

procedure TfrmConfOrdemMovBMF.HabilitaBotaoConfirma;
begin
   if QryDetalheSTATMOVINV.Value <> 'L' Then
      if QryDetalheSTACONFIRMA.Value <> QryDetalheSTACONFIRMA.OldValue then
         BtAutConfirma.Enabled := True;
end;

function TfrmConfOrdemMovBMF.VerifFechamento: Boolean;
begin
   if bGrid then
   begin
      If QryDetalheSTATMOVINV.Value = 'L' Then
      begin
         MsgDlg('Operação já Fechada. Não pode ser alterada.',
                 'Mensagem do Sistema ',mtWarning,[mbOK],0);
           AbreQry;
         Result := false;
         Exit;
      end;
   end;

   Result := true;
end;

procedure TfrmConfOrdemMovBMF.QryDetalheSTACONFIRMAChange(Sender: TField);
begin
  inherited;
   if QryDetalhe.RecordCount > 0 then
   begin
      If Not VerifFechamento Then
      Begin
         QryDetalhe.Cancel;
         Exit;
      End;
      HabilitaBotaoConfirma;
   end;   
end;

procedure TfrmConfOrdemMovBMF.btnTodasClick(Sender: TObject);
begin
  inherited;
   if QryDetalhe.IsEmpty then
      Exit;

   bGrid := False;
   
   If Not VerifFechamento Then
      Exit;

   If Not DtmBaseDados.dbBaseDados.InTransaction Then
      DtmBaseDados.dbBaseDados.StartTransaction;

   With QryDetalhe Do
   Begin
      DisableControls;
      First;
      While Not Eof Do
      Begin
         If FieldByName('STATMOVINV').AsString = 'L' Then
         begin
            MsgDlg('Existe uma Operação já Fechada. Não pode ser alterada.',
                   'Mensagem do Sistema ',mtWarning,[mbOK],0);
            EnableControls;
            Cancel;
            AbreQry;
            Exit;
         end;

         Edit;
         FieldByName('STACONFIRMA').AsString := 'S';
         Post;
         Next;
      End;
      First;
      EnableControls;
   End;
end;

procedure TfrmConfOrdemMovBMF.BtnInverteClick(Sender: TObject);
begin
  inherited;
   if QryDetalhe.IsEmpty then
      Exit;

   bGrid := False;

   If Not VerifFechamento Then
      Exit;

   If Not DtmBaseDados.dbBaseDados.InTransaction Then
      DtmBaseDados.dbBaseDados.StartTransaction;

   With QryDetalhe Do
   Begin
      DisableControls;
      First;
      While Not Eof Do
      Begin
         If FieldByName('STATMOVINV').AsString = 'L' Then
         begin
            MsgDlg('Existe uma Operação já Fechada. Não pode ser alterada.',
                   'Mensagem do Sistema ',mtWarning,[mbOK],0);
            EnableControls;
            Cancel;
            AbreQry;
            Exit;
         end;

         Edit;
         If (FieldByName('STACONFIRMA').AsString  = 'S') Then
             FieldByName('STACONFIRMA').AsString := 'N'
         Else
             FieldByName('STACONFIRMA').AsString := 'S';
         Post;    
         Next;
      End;
      First;
      EnableControls;
   End;
end;

procedure TfrmConfOrdemMovBMF.btnNenhumaClick(Sender: TObject);
begin
  inherited;
   if QryDetalhe.IsEmpty then
      Exit;

   bGrid := False;

   If Not VerifFechamento Then
      Exit;
      
   If Not DtmBaseDados.dbBaseDados.InTransaction Then
      DtmBaseDados.dbBaseDados.StartTransaction;

   With QryDetalhe Do
   Begin
      DisableControls;
      First;
      While Not Eof Do
      Begin
         If FieldByName('STATMOVINV').AsString = 'L' Then
         begin
            MsgDlg('Existe uma Operação já Fechada. Não pode ser alterada.',
                   'Mensagem do Sistema ',mtWarning,[mbOK],0);
            EnableControls;
            Cancel;
            AbreQry;
            Exit;
         end;

         Edit;
         FieldByName('STACONFIRMA').AsString := 'N';
         Post;
         Next;
      End;
      First;
      EnableControls;
   End;
end;

function TfrmConfOrdemMovBMF.VerificaCorretoras: Boolean;
var iIdCorretora : integer;
begin
   Result       := False;
   iCorretora   := 0;
   iIdCorretora := 0;
   With QryDetalhe Do
   Begin
      DisableControls;
      First;
      While Not Eof Do
      Begin
         If iIdCorretora <> FieldByName('IDCORRETVALORES').AsInteger Then
         Begin
            iCorretora   := iCorretora +1;
            iIdCorretora := FieldByName('IDCORRETVALORES').AsInteger ;
         End;
         Next;
      End;
      First;
      EnableControls;
   End;
   If iCorretora > 1 Then
      Result := True;
end;

procedure TfrmConfOrdemMovBMF.BtAutConfirmaClick(Sender: TObject);
begin
  inherited;
  If DtmBaseDados.dbBaseDados.InTransaction Then
  Begin
     Try
       If VerificaCorretoras Then //Se tiver mais de uma da a mensagem
       Begin
          If MsgDlg('Há '+IntToStr(iCorretora)+' Corretoras diferentes, confirma ?', 'Mensagem do Sistema ',
             mtConfirmation , [mbYes, mbNo], 0) = mrNo Then
          Begin
             DtmBaseDados.dbBaseDados.Rollback;
             Exit;
          End;
       End;
       QryDetalhe.ApplyUpdates;
       QryDetalhe.CommitUpdates;
       DtmBaseDados.dbBaseDados.Commit;
     Except
       //Rollbacka Transação
       DtmBaseDados.dbBaseDados.Rollback;
       MsgDlg('Não foi possível realizar a Operação.',
              'Mensagem do Sistema ',mtWarning,[mbOK],0);
     End;
     BtAutConfirma.Enabled := False;
  End;
end;

end.
