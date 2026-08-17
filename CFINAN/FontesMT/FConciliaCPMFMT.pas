{*******************************************************}
{                                                       }
{ CM Soluções Informática  - Contas a Pagar \ Receber   }
{ ** Todos os Direitos Reservados                       }
{                                                       }
{ - Conciliação de CPMF                                 }
{ - Manutenção da Alíquota e Vigência de CPMF           }
{ - Baixa de CPMF                                       }
{ - Auditoria de CPMF                                   }
{                                                       }
{ Analista Responsável: Gustavo Viegas                  }
{ Atualizado Em: 26/12/2002                             }
{                                                       }
{*******************************************************}

unit FConciliaCPMFMT;     

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  FOkCancelar, IvDictio, IvMulti, IvEMulti, MAHlpBtn, StdCtrls, Buttons,
  TB97Tlbr, TB97, ExtCtrls, CMProcuraSubTipo, Grids, Wwdbigrd,
  Wwdbgrid, ComCtrls, TREdit, Db, DBTables, Wwdatsrc, DBCtrls,
  ZipMstr, Menus, uCtrlConciliaCPMF, ImgList, wwdbdatetimepicker,
  CMDateTimePicker, DBClient, wwdblook, CMDBLookupCombo, uCMClientDataSet, uCmSqlParams;
  
type
  TTipoRelatCPMF = (trSintetico, trAnalitico, trAnaliticoInconsistente, trAnaliticoPorData);

  TFrmConciliaCPMFMT = class(TfrmOkCancelar)
    PagCpmf: TPageControl;
    TbsConcilia: TTabSheet;
    PnlFiltro: TPanel;
    ProcForn: TCMProcuraForCli;
    GroupBox1: TGroupBox;
    DtProg: TCMDateTimePicker;
    GroupBox2: TGroupBox;
    ReNumLote: TRealEdit;
    BtnSeleciona: TBitBtn;
    PnlTotaVenc: TPanel;
    SbAdTodos: TBitBtn;
    SbAdInverte: TBitBtn;
    DsLotes: TwwDataSource;
    RgTipoSel: TRadioGroup;
    GroupBox3: TGroupBox;
    EdtCpmf: TRealEdit;
    BtnImprime: TBitBtn;
    CkbInconsistentes: TCheckBox;
    Lblval: TLabel;
    Bevel1: TBevel;
    TbsAuditoria: TTabSheet;
    ImlDocs: TImageList;
    BtnEmail: TBitBtn;
    BtnRecalcula: TBitBtn;
    BitBtn1: TBitBtn;
    BitBtn2: TBitBtn;
    Memo1: TMemo;
    RgDeviceOut: TRadioGroup;
    Bevel2: TBevel;
    Pb: TProgressBar;
    LblProgressInfo: TLabel;
    Bevel3: TBevel;
    PnlFileName: TPanel;
    Label2: TLabel;
    EdtNomeArquivo: TEdit;
    SpeedButton1: TSpeedButton;
    BtnProcessa: TBitBtn;
    BtnCancelaProc: TBitBtn;
    Bevel4: TBevel;
    TbsManutCpmf: TTabSheet;
    Panel1: TPanel;
    Label1: TLabel;
    Label3: TLabel;
    Label4: TLabel;
    CMDateTimePicker1: TCMDateTimePicker;
    CMDateTimePicker2: TCMDateTimePicker;
    ReAliquota: TDBRealEdit;
    GrdManut: TwwDBGrid;
    BtnManutAll: TBitBtn;
    BtnManutInverte: TBitBtn;
    Bevel5: TBevel;
    BitBtn5: TBitBtn;
    Bevel6: TBevel;
    DsManutCpmf: TwwDataSource;
    TbsBaixas: TTabSheet;
    CmpBaixas: TCMProcuraForCli;
    dblkFormaPag: TwwDBLookupCombo;
    FormaPag: TLabel;
    Label5: TLabel;
    Label6: TLabel;
    DtProgBaixa: TCMDateTimePicker;
    ReNumLoteBaixa: TRealEdit;
    BtnSelBaixa: TBitBtn;
    Panel2: TPanel;
    wwDBGrid1: TwwDBGrid;
    Panel3: TPanel;
    BitBtn4: TBitBtn;
    BitBtn6: TBitBtn;
    Panel4: TPanel;
    BtnBaixa: TBitBtn;
    DsLotesBaixas: TwwDataSource;
    GrdLotes: TwwDBGrid;
    PnlSum: TPanel;
    GroupBox4: TGroupBox;
    CmbContaBancaria: TCMDBLookupCombo;
    Label7: TLabel;
    CmbContaBancaria2: TCMDBLookupCombo;
    ppmDataRetencao: TPopupMenu;
    MnuAltDataRetencao: TMenuItem;
    DlgFile: TOpenDialog;
    ZipFile: TZipMaster;
    SQLContasCaixas: TCMSqlParams;
    CdsContasCaixas: TCMClientDataSet;
    SQLPortConta: TCMSqlParams;
    CdsPortConta: TCMClientDataSet;
    CdsManutCpmf: TCMClientDataSet;
    SQLManutCpmf: TCMSqlParams;
    CdsLotes: TCMClientDataSet;
    CdsLotesBaixas: TCMClientDataSet;
    procedure BtnSelecionaClick(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure SbAdTodosClick(Sender: TObject);
    procedure SbAdInverteClick(Sender: TObject);
    procedure bbtnConfirmarClick(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure bbtnCancelarClick(Sender: TObject);
    procedure BtnImprimeClick(Sender: TObject);
    procedure PagCpmfChange(Sender: TObject);
    procedure LblvalClick(Sender: TObject);
    procedure BtnEmailClick(Sender: TObject);
    procedure BtnRecalculaClick(Sender: TObject);
    procedure BtnProcessaClick(Sender: TObject);
    procedure BtnCancelaProcClick(Sender: TObject);
    procedure SpeedButton1Click(Sender: TObject);
    procedure RgDeviceOutClick(Sender: TObject);
    procedure BtnManutAllClick(Sender: TObject);
    procedure BtnManutInverteClick(Sender: TObject);
    procedure BitBtn5Click(Sender: TObject);
    procedure BtnSelBaixaClick(Sender: TObject);
    procedure BtnBaixaClick(Sender: TObject);
    procedure GrdLotesCalcCellColors(Sender: TObject; Field: TField;
      State: TGridDrawState; Highlight: Boolean; AFont: TFont;
      ABrush: TBrush);
    procedure MnuAltDataRetencaoClick(Sender: TObject);
    procedure CdsLotesAfterOpen(DataSet: TDataSet);
    procedure CdsLotesBeforePost(DataSet: TDataSet);
    procedure CdsLotesBaixasAfterOpen(DataSet: TDataSet);
  private
    { Private declarations }
    bCancela :Boolean;
    procedure LimpaConsultas;
    function IsCpmfConsistente :Boolean;
    procedure Progresso(Params: Array of Variant);
  public
    { Public declarations }
    TipoRelatCPMF, OldTipoRelatCPMF :TTipoRelatCPMF;
    OldImprimeRateio: Boolean;
    ImprimeRateio :Boolean;
    ConciliaCPMF: TCtrlConciliaCPMF;
  end;

var
  FrmConciliaCPMFMT: TFrmConciliaCPMFMT;

implementation

Uses uDataBase, dBaseDados, uSistema, uIntegraBack, uFuncaoGeral, uDiasUteis,
     uMensErro, uDocumento, fSelTipoImpressaoCPMF, fTelaAut, JclMapi, uModulo,
     fAguarde, uLancFinanc, uString, FProgressCpmf, uCMFileUtils, uCtrlPadroes,
     uCMTypes, uCMMath, JclMath, uCMDialogs, fPreview, uCtrlParamIntegra;
{$R *.DFM}


procedure TFrmConciliaCPMFMT.BtnSelecionaClick(Sender: TObject);
Var
  rValPrev :Double;
  dDataProgramada: TDateTime;
  iCodPortador: Integer;
begin
  inherited;
  If ConciliaCPMF.DtmConciliaCPMFMT.CdsRptConciliaCpmf.Active Then
  Begin
    If ConciliaCPMF.DtmConciliaCPMFMT.CdsRptConciliaCpmf.ChangeCount > 0 Then ConciliaCPMF.DtmConciliaCPMFMT.CdsRptConciliaCpmf.CancelUpdates;
    ConciliaCPMF.DtmConciliaCPMFMT.CdsRptConciliaCpmf.Close;
  End;

  If (DtProg.Text = '') And
     (ReNumLote.Value = 0.00) Then
  Begin
     MsgDlg('Favor Informar a Data ou o Número do Lote.','Auditoria de CPMF', mtInformation,[mbOk],0);
     Exit;
  End;

  If (ProcForn.Valida <> VcOk) Then Exit;

  if CmbContaBancaria.Text = '' then
     iCodPortador := 0
  Else
     iCodPortador := StrToIntDef(CmbContaBancaria.LookupValue,0);

  if DtProg.Text = '' then
    dDataProgramada := 0
  Else
    dDataProgramada := DtProg.Date;

  CdsLotes.Data := ConciliaCPMF.SelLotes(ProcForn.ForCliReg.Id, Trunc(ReNumLote.Value), RgTipoSel.ItemIndex,
                   iCodPortador, dDataProgramada, rValPrev, EdtCpmf.Value);

  PnlSum.Caption := 'Valor previsto da CPMF ' + Trim(FloatToStrf(rValPrev,ffNumber,17,2));
end;

procedure TFrmConciliaCPMFMT.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
  inherited;
  ConciliaCPMF.Free;
end;

procedure TFrmConciliaCPMFMT.SbAdTodosClick(Sender: TObject);
begin
  inherited;
  If Not CdsLotes.IsEmpty Then
  Begin
    Try
      CdsLotes.DisableControls;
      CdsLotes.First;
      While Not CdsLotes.Eof Do
      Begin
        If TComponent(Sender).Tag = 0 Then
        Begin
           If IsCpmfConsistente Then
           Begin
              CdsLotes.Edit;
              CdsLotes.FieldByName('FLGCONFIRMARECPAG').AsString := 'S';
              CdsLotes.Post;
           End;
        End
        Else
        Begin
           If Not IsCpmfConsistente Then
           Begin
              CdsLotes.Edit;
              CdsLotes.FieldByName('RECALCULA').AsInteger := 1;
              CdsLotes.Post;
           End;
        End;
        CdsLotes.Next;
      End;
      CdsLotes.First;
    finally
      CdsLotes.EnableControls;
    End;
  End;
end;

procedure TFrmConciliaCPMFMT.SbAdInverteClick(Sender: TObject);
begin
  inherited;
  If Not CdsLotes.IsEmpty Then
  Begin
    Try
       CdsLotes.DisableControls;
       CdsLotes.First;
       While Not CdsLotes.Eof Do
       Begin
          If TComponent(Sender).Tag = 0 Then
          Begin
             If IsCpmfConsistente Then
             Begin
                CdsLotes.Edit;
                If CdsLotes.FieldByName('FLGCONFIRMARECPAG').AsString = 'S' Then
                   CdsLotes.FieldByName('FLGCONFIRMARECPAG').AsString := 'N'
                Else
                   CdsLotes.FieldByName('FLGCONFIRMARECPAG').AsString := 'S';
                CdsLotes.Post;
             End;
          End
          Else
          Begin
             If Not IsCpmfConsistente Then
             Begin
                CdsLotes.Edit;
                If CdsLotes.FieldByName('RECALCULA').AsInteger = 0 Then
                   CdsLotes.FieldByName('RECALCULA').AsInteger := 1
                Else
                   CdsLotes.FieldByName('RECALCULA').AsInteger := 0;
                CdsLotes.Post;
             End;
          End;

          CdsLotes.Next;
       End;
       CdsLotes.First;
    finally
       CdsLotes.EnableControls;
    End;
  End;
End;

procedure TFrmConciliaCPMFMT.bbtnConfirmarClick(Sender: TObject);
begin
  inherited;
  If PagCpmf.ActivePage = TbsConcilia Then
  Begin
     Try
        If CdsLotes.State In [DsEdit, DsInsert] Then CdsLotes.Post;

        if not ConciliaCPMF.ProcessaConciliaCPMF(CdsLotes.Data,
                                                 (MsgDlg('Deseja Reprogramar os documentos não conciliados?','Confirmar',mtConfirmation, [mbYes,mbNo],0)=mryes)) then
           MsgDlg(ConciliaCPMF.MessageInfo,'Erro !',mtError,[mbOk],0);

        If ConciliaCPMF.DtmConciliaCPMFMT.CdsRptConciliaCpmf.Active Then
        Begin
          If ConciliaCPMF.DtmConciliaCPMFMT.CdsRptConciliaCpmf.ChangeCount > 0 Then ConciliaCPMF.DtmConciliaCPMFMT.CdsRptConciliaCpmf.CancelUpdates;
          ConciliaCPMF.DtmConciliaCPMFMT.CdsRptConciliaCpmf.Close;
        End;

        LimpaConsultas;
     finally
        CdsLotes.EnableControls
     End;
  End
end;

procedure TFrmConciliaCPMFMT.FormCreate(Sender: TObject);
begin
  inherited;
  ConciliaCPMF := TCtrlConciliaCPMF.Create;
  ConciliaCPMF.InitializeAs(Padroes);
  ConciliaCPMF.Progresso := Progresso;
  ConciliaCPMF.IdPessoa := Sistema.IdEmpresa;

  SQLPortConta.Prepare;
  SQLPortConta.Params[0].AsFloat := Sistema.IdEmpresa;
  SQLPortConta.Open;

  OldTipoRelatCPMF := trSintetico;
  OldImprimeRateio := True;

  ImprimeRateio := False;
  SQLContasCaixas.Sql.Clear;
  SQLContasCaixas.Sql.Add(' SELECT DESCRICAO,CODPORTFORMA, DMAIS, LANCAFINANC, PLANO, PLACONTA,  PLACONTACONTABCHQ, PLANOCONTABCHQ, FLGCONTABEMISCHQ  '+
                          ' FROM PORTADORFORMA '+
                          ' WHERE RECPAG = '''+ IntegraBack.RecPag + ''''+
                          ' AND PORTADORFORMA.IDPESSOA='  +IntToStr(Sistema.idEmpresa) + ' ORDER BY DESCRICAO');
  SQLContasCaixas.Open;

  TipoRelatCPMF := trSintetico;

  EdtCpmf.Value := 0.38;
  PagCpmf.ActivePage := TbsConcilia;

  LimpaConsultas;
end;

procedure TFrmConciliaCPMFMT.bbtnCancelarClick(Sender: TObject);
begin
  inherited;
  ProcForn.Text := '';
  DtProg.Text := '';
  ReNumLote.Value := 0;
  LimpaConsultas;
end;

procedure TFrmConciliaCPMFMT.LimpaConsultas;
begin
  If ConciliaCPMF.DtmConciliaCPMFMT.CdsRptConciliaCpmf.Active Then
  Begin
    If ConciliaCPMF.DtmConciliaCPMFMT.CdsRptConciliaCpmf.ChangeCount > 0 Then ConciliaCPMF.DtmConciliaCPMFMT.CdsRptConciliaCpmf.CancelUpdates;
    ConciliaCPMF.DtmConciliaCPMFMT.CdsRptConciliaCpmf.Close;
  End;

  CdsLotes.Data := ConciliaCPMF.SelLotesVazios;
  CdsLotesBaixas.Data := CdsLotes.Data;
End;

procedure TFrmConciliaCPMFMT.BtnImprimeClick(Sender: TObject);
Var
  FormImp :TFrmSelTipoImpressaoCPMF;
  bAnalitico :Boolean;
begin
  inherited;
  With ConciliaCPMF.DtmConciliaCPMFMT Do
  begin
    MemTitulo.Lines.Clear;
    MemTitulo.Lines.Add ('Listagem de Lançamento de CPMF ');

    If Trim(ProcForn.Text) <> '' Then
       MemTitulo.Lines.Add ('Favorecido: ' + ProcForn.Text);

    If ReNumLote.Value <> 0.00 Then
       MemTitulo.Lines.Add ('Lote Nº: '  + ReNumLote.Text);

    If DtProg.Text <> '' Then
       MemTitulo.Lines.Add ('Data Programada ' + DtProg.Text);

    Case RgTipoSel.ItemIndex Of
     0: MemTitulo.Lines.Add (' Todas as CPMF''s pendentes ');
     1: MemTitulo.Lines.Add (' Somente CPMF''s não Conciliadas ');
     2: MemTitulo.Lines.Add (' Somente CPMF''s Conciliadas ');
    End;

    If CkbInconsistentes.Checked Then
       MemTitulo.Lines.Add (' Lotes Com Valores Inconsistentes ');

    MemTituloAnal.Lines.Assign(MemTitulo.Lines);

    AbrirFormModal(FormImp,TFrmSelTipoImpressaoCPMF);

    bAnalitico :=  Not ((TipoRelatCPMF = trSintetico) Or
                       ((TipoRelatCPMF = trAnaliticoInconsistente) And
                       IsCpmfConsistente));

    GrDocumento.Visible := bAnalitico And ImprimeRateio;
    DetRateio.Visible := bAnalitico And ImprimeRateio;
    GfoterDocumento.Visible := bAnalitico Or ImprimeRateio;

    RgTituloDocs.Visible := bAnalitico;
    RgTituloRateio.Visible := ImprimeRateio;

    EdtDoc.Visible := ImprimeRateio;
    EdtData.Visible := ImprimeRateio;
    EdtRazaoSoc.Visible := ImprimeRateio;

    If ImprimeRateio Then
    Begin
      EdtSumValor.Font.Style := EdtSumValor.Font.Style + [fsBold];
      EdtSumPrev.Font.Style := EdtSumPrev.Font.Style + [fsBold];
      EdtSumEfet.Font.Style := EdtSumEfet.Font.Style + [fsBold];
    End
    Else
    Begin
      EdtSumValor.Font.Style := EdtSumValor.Font.Style - [fsBold];
      EdtSumPrev.Font.Style := EdtSumPrev.Font.Style - [fsBold];
      EdtSumEfet.Font.Style := EdtSumEfet.Font.Style - [fsBold];
    End;

    LblTotDoc.Visible := Not ImprimeRateio;
    LineSum.Visible := Not ImprimeRateio;

    DbtPrevEfetivo.Visible := Not ImprimeRateio;
    DbtPrevDoc.Visible := Not ImprimeRateio;

    If TipoRelatCPMF = trSintetico Then
    begin
      PpRptSintetico.DataSource := DsLotes;
      TFrmPreview.CreateModalPreview(Self, RptSintetico, 'Listagem de Lançamento de CPMF')
    end
    Else
    Begin
       Application.CreateForm(TFrmProgressCpmf,FrmProgressCpmf);
       Try
         FrmProgressCpmf.show;

         With CdsRptConciliaCpmf Do
         Begin
           IndexName := '';

           If IsEmpty Then
           Begin
             If Not Active Then SQLRptConciliaCpmf.Open;

             CdsLotes.First;

             FrmProgressCpmf.PbLote.Max := CdsLotes.RecordCount + 1;
             FrmProgressCpmf.PbLote.Position := 0;
             Application.ProcessMessages;

             While Not CdsLotes.Eof Do
             Begin
                FrmProgressCpmf.PbLote.Position := FrmProgressCpmf.PbLote.Position + 1;
                Application.ProcessMessages;

                If CdsDocs.Active Then CdsDocs.Close;

                If CdsLotes.FieldByName('ORIGEM').AsString = 'L' Then
                   SQLDocs.SQL.Assign(SQLDocsLote.SQL)
                Else
                   SQLDocs.SQL.Assign(SQLDocsManual.SQL);

                SQLDocs.Prepare;
                SQLDocs.Params[0].AsInteger := CdsLotes.FieldByName('NUMLOTE').AsInteger;
                SQLDocs.Open;

                FrmProgressCpmf.PbDocumento.Max := CdsDocs.RecordCount + 1;
                FrmProgressCpmf.PbDocumento.Position := 0;
                Application.ProcessMessages;

                While Not CdsDocs.Eof Do
                Begin
                  FrmProgressCpmf.PbDocumento.Position := FrmProgressCpmf.PbDocumento.Position + 1;
                  Application.ProcessMessages;

                  If (TipoRelatCPMF <> trSintetico) Then
                  Begin
                     If CdsRateioDocs.Active Then CdsRateioDocs.Close;

                     If (Trim(CdsDocs.FieldByName('OPERACAO').AsString) = '3') Or
                        (Trim(CdsDocs.FieldByName('OPERACAO').AsString) = '13') Then
                     Begin
                        If CdsLotes.FieldByName('ORIGEM').AsString = 'L' Then
                           SQLRateioDocs.SQL.Assign(SQLRateioDocsLoteParc.SQL)
                        Else
                           SQLRateioDocs.SQL.Assign(SQLRateioManualParc.SQL);
                     End
                     Else
                     Begin
                        If CdsLotes.FieldByName('ORIGEM').AsString = 'L' Then
                           SQLRateioDocs.SQL.Assign(SQLRateioDocsLote.SQL)
                        Else
                           SQLRateioDocs.SQL.Assign(SQLRateioManual.SQL);
                     End;

                     If (TipoRelatCPMF <> trSintetico) Then
                     begin
                        SQLRateioDocs.Prepare;
                        SQLRateioDocs.Params[0].AsFloat := EdtCpmf.Value;
                        SQLRateioDocs.Params[1].AsFloat := CdsDocs.FieldByName('CODDOCUMENTO').AsFloat;
                        SQLRateioDocs.Params[2].AsFloat := CdsLotes.FieldByName('NUMLOTE').AsFloat;
                        SQLRateioDocs.Open;
                     end
                     else
                     begin
                        SQLRateioDocs.Prepare;
                        SQLRateioDocs.Params[0].AsFloat := EdtCpmf.Value;
                        SQLRateioDocs.Params[1].AsFloat := 0;
                        SQLRateioDocs.Params[2].AsFloat := 0;
                        SQLRateioDocs.Open;
                     end;


                     FrmProgressCpmf.PbRateio.Max := CdsRateioDocs.RecordCount + 1;
                     FrmProgressCpmf.PbRateio.Position := 0;
                     Application.ProcessMessages;
                  End;

                  If (TipoRelatCPMF = trSintetico) Or CdsRateioDocs.Eof Then
                  Begin
                     FrmProgressCpmf.PbRateio.Max := 1;
                     FrmProgressCpmf.PbRateio.Position := 1;
                     Application.ProcessMessages;

                     CdsRptConciliaCpmf.Append;
                     CdsRptConciliaCpmf.FieldByName('DATAPROGRAMADA').AsDateTime := CdsDocs.FieldByName('DATAPROGRAMADA').AsDateTime;
                     CdsRptConciliaCpmf.FieldByName('LOTE_ORIGEM').AsString := CdsLotes.FieldByName('ORIGEM').AsString;
                     CdsRptConciliaCpmf.FieldByName('LOTE_NUMLOTE').AsFloat := CdsLotes.FieldByName('NUMLOTE').AsFloat;
                     CdsRptConciliaCpmf.FieldByName('LOTE_IDFORCLI').AsFloat := CdsLotes.FieldByName('IDFORCLI').AsFloat;
                     CdsRptConciliaCpmf.FieldByName('LOTE_IDPESSOA').AsFloat :=CdsLotes.FieldByName('IDPESSOA').AsFloat;
                     CdsRptConciliaCpmf.FieldByName('LOTE_VALCALCULADO').AsFloat := CdsLotes.FieldByName('VALCALCULADO').AsFloat;
                     CdsRptConciliaCpmf.FieldByName('LOTE_DATARETENCAO').AsDateTime := CdsLotes.FieldByName('DATARETENCAO').AsDateTime;
                     CdsRptConciliaCpmf.FieldByName('LOTE_FLGCONFIRMARECPAG').AsString := CdsLotes.FieldByName('FLGCONFIRMARECPAG').AsString;
                     CdsRptConciliaCpmf.FieldByName('LOTE_FAVORECIDO').AsString := CdsLotes.FieldByName('FAVORECIDO').AsString;
                     CdsRptConciliaCpmf.FieldByName('LOTE_NUMCHQBORDERO').AsString := CdsLotes.FieldByName('NUMCHQBORDERO').AsString;
                     CdsRptConciliaCpmf.FieldByName('LOTE_VALORLOTE').AsFloat := CdsLotes.FieldByName('VALORLOTE').AsFloat;
                     CdsRptConciliaCpmf.FieldByName('LOTE_VALPREVISTO').AsFloat := CdsLotes.FieldByName('VALPREVISTO').AsFloat;
                     CdsRptConciliaCpmf.FieldByName('LOTE_VALORAUDITORIA').AsFloat := CdsLotes.FieldByName('VALORAUDITORIA').AsFloat;
                     CdsRptConciliaCpmf.FieldByName('DOCUMENTO_CODDOCUMENTO').AsFloat := CdsDocs.FieldByName('CODDOCUMENTO').AsFloat;
                     CdsRptConciliaCpmf.FieldByName('DOCUMENTO_NUMAPGR').AsFloat := CdsDocs.FieldByName('NUMAPGR').AsFloat;
                     CdsRptConciliaCpmf.FieldByName('DOCUMENTO_DATALANCTO').AsDateTime := CdsDocs.FieldByName('DATALANCTO').AsDateTime;
                     CdsRptConciliaCpmf.FieldByName('DOCUMENTO_VALOR').AsFloat := CdsDocs.FieldByName('VALOR').AsFloat;
                     CdsRptConciliaCpmf.FieldByName('DOCUMENTO_RAZAOSOCIAL').AsString := CdsDocs.FieldByName('RAZAOSOCIAL').AsString;
                     CdsRptConciliaCpmf.FieldByName('DOCUMENTO_NUMLOTE').AsFloat := CdsDocs.FieldByName('NUMLOTE').AsFloat;
                     CdsRptConciliaCpmf.FieldByName('RATEIO_CODDOCUMENTO').AsFloat := CdsDocs.FieldByName('CODDOCUMENTO').AsFloat;
                     CdsRptConciliaCpmf.FieldByName('RATEIO_VALOR').AsFloat := CdsDocs.FieldByName('VALOR').AsFloat;
                     CdsRptConciliaCpmf.FieldByName('RATEIO_VLRPREVISTO').AsFloat := ((CdsDocs.FieldByName('VALOR').AsFloat * EdtCpmf.Value) / 100);

                     CdsRptConciliaCpmf.Post;
                  End
                  Else
                  Begin
                     While Not CdsRateioDocs.Eof Do
                     Begin
                        FrmProgressCpmf.PbRateio.Position := FrmProgressCpmf.PbRateio.Position + 1;
                        Application.ProcessMessages;

                        CdsRptConciliaCpmf.Append;
                        CdsRptConciliaCpmf.FieldByName('DATAPROGRAMADA').AsDateTime := CdsDocs.FieldByName('DATAPROGRAMADA').AsDateTime;
                        CdsRptConciliaCpmf.FieldByName('LOTE_ORIGEM').AsString := CdsLotes.FieldByName('ORIGEM').AsString;
                        CdsRptConciliaCpmf.FieldByName('LOTE_NUMLOTE').AsFloat := CdsLotes.FieldByName('NUMLOTE').AsFloat;
                        CdsRptConciliaCpmf.FieldByName('LOTE_IDFORCLI').AsFloat := CdsLotes.FieldByName('IDFORCLI').AsFloat;
                        CdsRptConciliaCpmf.FieldByName('LOTE_IDPESSOA').AsFloat :=CdsLotes.FieldByName('IDPESSOA').AsFloat;
                        CdsRptConciliaCpmf.FieldByName('LOTE_VALCALCULADO').AsFloat := CdsLotes.FieldByName('VALCALCULADO').AsFloat;
                        CdsRptConciliaCpmf.FieldByName('LOTE_DATARETENCAO').AsDateTime := CdsLotes.FieldByName('DATARETENCAO').AsDateTime;
                        CdsRptConciliaCpmf.FieldByName('LOTE_FLGCONFIRMARECPAG').AsString := CdsLotes.FieldByName('FLGCONFIRMARECPAG').AsString;
                        CdsRptConciliaCpmf.FieldByName('LOTE_FAVORECIDO').AsString := CdsLotes.FieldByName('FAVORECIDO').AsString;
                        CdsRptConciliaCpmf.FieldByName('LOTE_NUMCHQBORDERO').AsString := CdsLotes.FieldByName('NUMCHQBORDERO').AsString;
                        CdsRptConciliaCpmf.FieldByName('LOTE_VALORLOTE').AsFloat := CdsLotes.FieldByName('VALORLOTE').AsFloat;
                        CdsRptConciliaCpmf.FieldByName('LOTE_VALPREVISTO').AsFloat := CdsLotes.FieldByName('VALPREVISTO').AsFloat;
                        CdsRptConciliaCpmf.FieldByName('LOTE_VALORAUDITORIA').AsFloat := CdsLotes.FieldByName('VALORAUDITORIA').AsFloat;
                        CdsRptConciliaCpmf.FieldByName('DOCUMENTO_CODDOCUMENTO').AsFloat := CdsDocs.FieldByName('CODDOCUMENTO').AsFloat;
                        CdsRptConciliaCpmf.FieldByName('DOCUMENTO_NUMAPGR').AsFloat := CdsDocs.FieldByName('NUMAPGR').AsFloat;
                        CdsRptConciliaCpmf.FieldByName('DOCUMENTO_DATALANCTO').AsDateTime := CdsDocs.FieldByName('DATALANCTO').AsDateTime;
                        CdsRptConciliaCpmf.FieldByName('DOCUMENTO_VALOR').AsFloat := CdsDocs.FieldByName('VALOR').AsFloat;
                        CdsRptConciliaCpmf.FieldByName('DOCUMENTO_RAZAOSOCIAL').AsString := CdsDocs.FieldByName('RAZAOSOCIAL').AsString;
                        CdsRptConciliaCpmf.FieldByName('DOCUMENTO_NUMLOTE').AsFloat := CdsDocs.FieldByName('NUMLOTE').AsFloat;
                        CdsRptConciliaCpmf.FieldByName('RATEIO_CODDOCUMENTO').AsFloat := CdsRateioDocs.FieldByName('CODDOCUMENTO').AsFloat;
                        CdsRptConciliaCpmf.FieldByName('RATEIO_CODTIPRECDES').AsString := CdsRateioDocs.FieldByName('CODTIPRECDES').AsString;
                        CdsRptConciliaCpmf.FieldByName('RATEIO_CODCENTROCUSTO').AsString := CdsRateioDocs.FieldByName('CODCENTROCUSTO').AsString;
                        CdsRptConciliaCpmf.FieldByName('RATEIO_IDPROGRAMA').AsFloat := CdsRateioDocs.FieldByName('IDPROGRAMA').AsFloat;
                        CdsRptConciliaCpmf.FieldByName('RATEIO_VALOR').AsFloat := CdsRateioDocs.FieldByName('VALOR').AsFloat;
                        CdsRptConciliaCpmf.FieldByName('RATEIO_VLRPREVISTO').AsFloat := CdsRateioDocs.FieldByName('VLRPREVISTO').AsFloat;
                        CdsRptConciliaCpmf.FieldByName('RATEIO_VLREFETIVO').AsFloat := CdsRateioDocs.FieldByName('VLREFETIVO').AsFloat;
                        CdsRptConciliaCpmf.FieldByName('RATEIO_DESCRICAORD').AsString := CdsRateioDocs.FieldByName('RATEIO_DESCRICAORD').AsString;
                        CdsRptConciliaCpmf.FieldByName('RATEIO_NOMECC').AsString := CdsRateioDocs.FieldByName('RATEIO_NOMECC').AsString;
                        CdsRptConciliaCpmf.FieldByName('RATEIO_NOMEPRG').AsString := CdsRateioDocs.FieldByName('RATEIO_NOMEPRG').AsString;

                        CdsRptConciliaCpmf.Post;

                        CdsRateioDocs.Next;
                     End;
                  End;

                  CdsDocs.Next;
                End;

                CdsLotes.Next;
             End;
           End;
         End;

         FrmProgressCpmf.Close;

         Case TipoRelatCPMF of
           //trSintetico: TFrmPreview.CreateModalPreview(Self, RptSintetico, 'Listagem de Lançamento de CPMF');
           trAnaliticoPorData:
             Begin
               CdsRptConciliaCpmf.IndexName := 'IDXANALITICO';
               TFrmPreview.CreateModalPreview(Self, RptConsAnalCpmf, 'Listagem de Lançamento de CPMF');
             End;
           Else
             TFrmPreview.CreateModalPreview(Self, RptConciliaCpmf, 'Listagem de Lançamento de CPMF');
         End;

         FrmProgressCpmf.Free;
       Except
         FrmProgressCpmf.Close;
         FrmProgressCpmf.Free;
         Raise;
       End;
    End;
  End;

  OldTipoRelatCPMF := TipoRelatCPMF;
  OldImprimeRateio := ImprimeRateio;
end;

procedure TFrmConciliaCPMFMT.PagCpmfChange(Sender: TObject);
begin
  inherited;
  BtnEmail.Visible := (PagCpmf.ActivePage = TbsAuditoria);
  BtnImprime.Visible := (PagCpmf.ActivePage = TbsConcilia);

  BtnRecalcula.Visible := (PagCpmf.ActivePage = TbsConcilia);
  bbtnCancelar.Visible := (PagCpmf.ActivePage = TbsConcilia);
  bbtnConfirmar.Visible := (PagCpmf.ActivePage = TbsConcilia);
  TB97oKCancelar.Visible := (PagCpmf.ActivePage <> TbsManutCpmf);
  BtnBaixa.Visible := (PagCpmf.ActivePage = TbsBaixas);

  SQLManutCpmf.Open;
end;

procedure TFrmConciliaCPMFMT.LblvalClick(Sender: TObject);
begin
  inherited;
  CkbInconsistentes.Checked := Not CkbInconsistentes.Checked;
end;

procedure TFrmConciliaCPMFMT.BtnEmailClick(Sender: TObject);
Var
  sMensagem :String;
begin
  inherited;
  If ((RgDeviceOut.ItemIndex = 1) Or (RgDeviceOut.ItemIndex = 2)) And
     (Trim(EdtNomeArquivo.Text) = '') Then
    MsgDlg('Não foi informado o nome do arquivo de saída.','Auditoria de CPMF', mtInformation,[mbOk],0)
  Else
    If Not FileExists(EdtNomeArquivo.Text) Then
       MsgDlg('O Arquivo com a auditoria da CPMF não foi gerado ou foi apagado.','Auditoria de CPMF', mtInformation,[mbOk],0)
    Else
    Begin

      ZipFile.FSpecArgs.Clear;
      ZipFile.FSpecArgs.Add(EdtNomeArquivo.Text);
      ZipFile.ZipFilename := EdtNomeArquivo.Text + '.Zip';;
      ZipFile.Add;

      sMensagem := 'Solicito o cadastramento dos Relacionamentos "Tipo de Desenbolso X Centro de Custo X Programa X CPMF" listados no arquivo em anexo' +
                  (#13+#10) + (#13+#10) + 'Grato.';

      JclSimpleSendMail('destino@email.com.br','','Cadastro de "Tipo de Desenbolso X Centro de Custo X Programa X CPMF"',sMensagem,ZipFile.ZipFilename);
    End;
end;

procedure TFrmConciliaCPMFMT.BtnRecalculaClick(Sender: TObject);
begin
  inherited;
  if CdsLotes.State In [DsEdit, DsInsert] then CdsLotes.Post;

  if not ConciliaCPMF.Recalcula(CdsLotes.Data, Sistema.IdEspAcesso, Sistema.IdUsuario,
     ParamIntegra.Plano, Sistema.IdModulo, Sistema.UsaPlanoPatro, ParamIntegra.IntegraContab,
     ParamIntegra.PartidaDobrada, ParamIntegra.RecPag) then
     MsgDlg(ConciliaCPMF.MessageInfo,'Erro !',mtError,[mbOk],0);

  if ConciliaCPMF.DtmConciliaCPMFMT.CdsRptConciliaCpmf.Active then
  begin
    if ConciliaCPMF.DtmConciliaCPMFMT.CdsRptConciliaCpmf.ChangeCount > 0 then ConciliaCPMF.DtmConciliaCPMFMT.CdsRptConciliaCpmf.CancelUpdates;
    ConciliaCPMF.DtmConciliaCPMFMT.CdsRptConciliaCpmf.Close;
  end;

  BtnSeleciona.Click;
end;

procedure TFrmConciliaCPMFMT.BtnProcessaClick(Sender: TObject);
Var
  bAchou :Boolean;

function AtualizaControles(bStart :Boolean) :Boolean;
Begin
  Result := True;

  ConciliaCPMF.DtmConciliaCPMFMT.DsDados.DataSet := nil;
  bCancela := False;
  If bStart Then
  Begin
    If ConciliaCPMF.DtmConciliaCPMFMT.CdsResultado.Active Then
    Begin
       Result := (MsgDlg('Existem registros já processados, deseja processar novamente ?','Auditoria de CPMF',mtError,[mbNo,mbYes],0) = IdYes);

       If Not Result Then Exit;

       If ConciliaCPMF.DtmConciliaCPMFMT.CdsResultado.ChangeCount > 0 Then
          ConciliaCPMF.DtmConciliaCPMFMT.CdsResultado.CancelUpdates;
       ConciliaCPMF.DtmConciliaCPMFMT.CdsResultado.Close;
    End;

    ConciliaCPMF.DtmConciliaCPMFMT.SQLResultado.Open;
    ConciliaCPMF.DtmConciliaCPMFMT.SQLTipoRecebDesemb.Open;
    ConciliaCPMF.DtmConciliaCPMFMT.SQLCCust.Open;
    ConciliaCPMF.DtmConciliaCPMFMT.SQLPrograma.Open;

    Pb.Max := ConciliaCPMF.DtmConciliaCPMFMT.CdsTipoRecebDesemb.RecordCount;
  End
  Else
  Begin
    ConciliaCPMF.DtmConciliaCPMFMT.SQLTipoRecebDesemb.Open;
    ConciliaCPMF.DtmConciliaCPMFMT.SQLCCust.Open;
    ConciliaCPMF.DtmConciliaCPMFMT.SQLPrograma.Open;
  End;

  Pb.Position := 0;

  BtnCancelaProc.Enabled := bStart;
  BtnProcessa.Enabled := Not bStart;
End;

begin
  If ((RgDeviceOut.ItemIndex = 1) Or (RgDeviceOut.ItemIndex = 2)) And
     (Trim(EdtNomeArquivo.Text) = '') Then
    MsgDlg('Não foi informado o nome do arquivo de saída.','Auditoria de CPMF', mtInformation,[mbOk],0)
  Else
    Try
      If AtualizaControles(True) Then
        While (Not ConciliaCPMF.DtmConciliaCPMFMT.CdsTipoRecebDesemb.Eof) And (Not bCancela) Do
        Begin
          Pb.Position := Pb.Position + 1;
          LblProgressInfo.Caption := 'Processando Tipo de Desembolso ' + ConciliaCPMF.DtmConciliaCPMFMT.CdsTipoRecebDesemb.FieldByName('CODTIPRECDES').AsString + ' - ' + ConciliaCPMF.DtmConciliaCPMFMT.CdsTipoRecebDesemb.FieldByName('DESCRICAO').AsString;
          Application.ProcessMessages;

          ConciliaCPMF.DtmConciliaCPMFMT.CdsCCust.First;
          While Not ConciliaCPMF.DtmConciliaCPMFMT.CdsCCust.Eof Do
          Begin
            ConciliaCPMF.DtmConciliaCPMFMT.SQLTrdxCCxImposto.SQL.Text :=
                      ' SELECT ' +
                      '   CODTIPRECDES, CODCENTROCUSTO, IDPROGRAMA ' +
                      ' FROM ' +
                      '   TIPRECDESXTIPAGRE ' +
                      ' WHERE ' +
                      '   CODTIPRECDES = ' + QuotedStr(Espaco(Trim(ConciliaCPMF.DtmConciliaCPMFMT.CdsTipoRecebDesemb.FieldByName('CODTIPRECDES').AsString),15)) + ' AND ' +
                      '   RECPAG = ' + QuotedStr(IntegraBack.RecPag) + ' AND ' +
                      '   IDPESSOA = ' + IntToStr(Sistema.IdEmpresa) + ' AND ' +
                      '   CODCENTROCUSTO = ' + QuotedStr(Espaco(Trim(ConciliaCPMF.DtmConciliaCPMFMT.CDSCCust.FieldByName('CODCENTROCUSTO').AsString),10)) + ' AND ' +
                      '   IDEMPRESA = ' + IntToStr(Sistema.IdEmpresa) + ' AND ' +
                      '   IDPROGRAMA IS NULL ';
            ConciliaCPMF.DtmConciliaCPMFMT.SQLTrdxCCxImposto.Open;

            bAchou := (Not ConciliaCPMF.DtmConciliaCPMFMT.CdsTrdxCCxImposto.IsEmpty);

            If Not bAchou Then
            Begin
              ConciliaCPMF.DtmConciliaCPMFMT.CdsResultado.Append;
              ConciliaCPMF.DtmConciliaCPMFMT.CdsResultado.FieldByName('CODTIPRECDES').AsString := ConciliaCPMF.DtmConciliaCPMFMT.CdsTipoRecebDesemb.FieldByName('CODTIPRECDES').AsString;
              ConciliaCPMF.DtmConciliaCPMFMT.CdsResultado.FieldByName('DESCRICAO').AsString := ConciliaCPMF.DtmConciliaCPMFMT.CdsTipoRecebDesemb.FieldByName('DESCRICAO').AsString;
              ConciliaCPMF.DtmConciliaCPMFMT.CdsResultado.FieldByName('CODCENTROCUSTO').AsString := ConciliaCPMF.DtmConciliaCPMFMT.CdsCCust.FieldByName('CODCENTROCUSTO').AsString;
              ConciliaCPMF.DtmConciliaCPMFMT.CdsResultado.FieldByName('NOME').AsString := ConciliaCPMF.DtmConciliaCPMFMT.CdsCCust.FieldByName('NOME').AsString;
              ConciliaCPMF.DtmConciliaCPMFMT.CdsResultado.FieldByName('DESCPROGRAMA').AsString := '' ;
              ConciliaCPMF.DtmConciliaCPMFMT.CdsResultado.Post;
            End;

              ConciliaCPMF.DtmConciliaCPMFMT.CdsPrograma.First;
              While Not ConciliaCPMF.DtmConciliaCPMFMT.CdsPrograma.Eof Do
              Begin
                ConciliaCPMF.DtmConciliaCPMFMT.SQLTrdxCCxImposto.SQL.Text :=
                      ' SELECT ' +
                      '   CODTIPRECDES, CODCENTROCUSTO, IDPROGRAMA ' +
                      ' FROM ' +
                      '   TIPRECDESXTIPAGRE ' +
                      ' WHERE ' +
                      '   CODTIPRECDES = ' + QuotedStr(Espaco(Trim(ConciliaCPMF.DtmConciliaCPMFMT.CdsTipoRecebDesemb.FieldByName('CODTIPRECDES').AsString),15)) + ' AND ' +
                      '   RECPAG = ' + QuotedStr(IntegraBack.RecPag) + ' AND ' +
                      '   IDPESSOA = ' + IntToStr(Sistema.IdEmpresa) + ' AND ' +
                      '   CODCENTROCUSTO = ' + QuotedStr(Espaco(Trim(ConciliaCPMF.DtmConciliaCPMFMT.CdsCCust.FieldByName('CODCENTROCUSTO').AsString),10)) + ' AND ' +
                      '   IDEMPRESA = ' + IntToStr(Sistema.IdEmpresa) + ' AND ' +
                      '   IDPROGRAMA = ' + ConciliaCPMF.DtmConciliaCPMFMT.CdsPrograma.FieldByName('IDPROGRAMA').AsString;

                ConciliaCPMF.DtmConciliaCPMFMT.SQLTrdxCCxImposto.Open;

                bAchou := (Not ConciliaCPMF.DtmConciliaCPMFMT.CdsTrdxCCxImposto.IsEmpty);

                If Not bAchou Then
                Begin
                  ConciliaCPMF.DtmConciliaCPMFMT.CdsResultado.Append;
                  ConciliaCPMF.DtmConciliaCPMFMT.CdsResultado.FieldByName('CODTIPRECDES').AsString := ConciliaCPMF.DtmConciliaCPMFMT.CdsTipoRecebDesemb.FieldByName('CODTIPRECDES').AsString;
                  ConciliaCPMF.DtmConciliaCPMFMT.CdsResultado.FieldByName('DESCRICAO').AsString := ConciliaCPMF.DtmConciliaCPMFMT.CdsTipoRecebDesemb.FieldByName('DESCRICAO').AsString;
                  ConciliaCPMF.DtmConciliaCPMFMT.CdsResultado.FieldByName('CODCENTROCUSTO').AsString := ConciliaCPMF.DtmConciliaCPMFMT.CdsCCust.FieldByName('CODCENTROCUSTO').AsString;
                  ConciliaCPMF.DtmConciliaCPMFMT.CdsResultado.FieldByName('NOME').AsString := ConciliaCPMF.DtmConciliaCPMFMT.CdsCCust.FieldByName('NOME').AsString;
                  ConciliaCPMF.DtmConciliaCPMFMT.CdsResultado.FieldByName('DESCPROGRAMA').AsString := ConciliaCPMF.DtmConciliaCPMFMT.CdsPrograma.FieldByName('DESCPROGRAMA').AsString;
                  ConciliaCPMF.DtmConciliaCPMFMT.CdsResultado.Post;
                End;

                ConciliaCPMF.DtmConciliaCPMFMT.CdsPrograma.Next;
              End;

            ConciliaCPMF.DtmConciliaCPMFMT.CdsCCust.Next;
          End;

          ConciliaCPMF.DtmConciliaCPMFMT.CdsTipoRecebDesemb.Next;
        End;

      ConciliaCPMF.DtmConciliaCPMFMT.RptDados.ResetDevices;

      Case RgDeviceOut.ItemIndex of
        0: ConciliaCPMF.DtmConciliaCPMFMT.RptDados.DeviceType := 'Screen';
        1: ConciliaCPMF.DtmConciliaCPMFMT.RptDados.DeviceType := 'ReportTextFile';
        2: ConciliaCPMF.DtmConciliaCPMFMT.RptDados.DeviceType := 'ExcelFile';
        3: ConciliaCPMF.DtmConciliaCPMFMT.RptDados.DeviceType := 'Printer';
      End;

      ConciliaCPMF.DtmConciliaCPMFMT.HbnAuditoria.Visible := ((RgDeviceOut.ItemIndex = 0) Or (RgDeviceOut.ItemIndex = 3));
      ConciliaCPMF.DtmConciliaCPMFMT.FbdAuditoria.Visible := ((RgDeviceOut.ItemIndex = 0) Or (RgDeviceOut.ItemIndex = 3));
      ConciliaCPMF.DtmConciliaCPMFMT.RptDados.ShowPrintDialog := ((RgDeviceOut.ItemIndex = 0) Or (RgDeviceOut.ItemIndex = 3));
      ConciliaCPMF.DtmConciliaCPMFMT.RptDados.ArchiveFileName := EdtNomeArquivo.Text;
      ConciliaCPMF.DtmConciliaCPMFMT.RptDados.TextFileName := EdtNomeArquivo.Text;

      ConciliaCPMF.DtmConciliaCPMFMT.CdsResultado.First;
      ConciliaCPMF.DtmConciliaCPMFMT.DsDados.DataSet := ConciliaCPMF.DtmConciliaCPMFMT.CdsResultado;

      if RgDeviceOut.ItemIndex = 0 then
         TFrmPreview.CreateModalPreview(Self, ConciliaCPMF.DtmConciliaCPMFMT.RptDados, 'Auditoria de CPMF')
      else
         ConciliaCPMF.DtmConciliaCPMFMT.RptDados.Print;

      If bCancela Then
          LblProgressInfo.Caption := 'Cancelamento Solicitado pelo usuario. Aguardando Comado...'
      Else
          LblProgressInfo.Caption := 'Processamento Encerrado com sucesso. Aguardando Comando...';

      AtualizaControles(False);
    Except
      On E:Exception Do
      Begin
        LblProgressInfo.Caption := 'Processamento Encerrado com erros, verifique. Aguardando Comando...';
        AtualizaControles(False);
        MsgDlg(FormatErrorMessage(self,E,'Erro ao processar Auditoria de CPMF'),'Erro !',mtError,[mbOk],0);
      End;
    End;
end;

procedure TFrmConciliaCPMFMT.BtnCancelaProcClick(Sender: TObject);
begin
  inherited;
  bCancela := True;
  Application.ProcessMessages;
end;

procedure TFrmConciliaCPMFMT.SpeedButton1Click(Sender: TObject);
begin
  inherited;
  DlgFile.FileName := '';

  Case RgDeviceOut.ItemIndex of
  1: DlgFile.Filter := 'Arquivo Text|*.txt';
  2: DlgFile.Filter := 'Arquivo Excel|*.xls';
  Else
    Exit;
  End;

  If DlgFile.Execute Then
  Begin
    EdtNomeArquivo.Text := DlgFile.FileName;
  End;
end;

procedure TFrmConciliaCPMFMT.RgDeviceOutClick(Sender: TObject);
begin
  inherited;
  PnlFileName.Enabled := ((RgDeviceOut.ItemIndex = 1) Or (RgDeviceOut.ItemIndex = 2));
end;

procedure TFrmConciliaCPMFMT.BtnManutAllClick(Sender: TObject);
begin
  inherited;
  With CdsManutCpmf Do
  Begin
    DisableControls;
    First;
    While Not Eof Do
    Begin
      Edit;
      FieldByName('ALTERA').AsInteger := 1;
      Post;
      Next;
    End;
    First;
    EnableControls;
  End;
end;

procedure TFrmConciliaCPMFMT.BtnManutInverteClick(Sender: TObject);
begin
  inherited;
  With CdsManutCpmf Do
  Begin
    DisableControls;
    First;
    While Not Eof Do
    Begin
      Edit;
      If FieldByName('ALTERA').AsInteger = 1 Then
        FieldByName('ALTERA').AsInteger := 0
      Else
        FieldByName('ALTERA').AsInteger := 1;
      Post;
      Next;
    End;
    First;
    EnableControls;
  End;
end;

procedure TFrmConciliaCPMFMT.BitBtn5Click(Sender: TObject);
begin
  inherited;
  if ConciliaCPMF.AlteraAliquota(CdsManutCpmf.Data, ReAliquota.Value) then
    MsgDlg('Alíquota de CPMF alterada com sucesso','Auditoria de CPMF', mtInformation,[mbOk],0)
  Else
    MsgDlg('Erro ao alterar alíquota de CPMF.' + (#13+#10) + ConciliaCPMF.MessageInfo,'Erro !',mtError,[mbOk],0);
end;

procedure TFrmConciliaCPMFMT.BtnSelBaixaClick(Sender: TObject);
Var
  dDataProgBaixa: TDateTime; 
begin
  inherited;
  If DtProgBaixa.Date > Date Then
  Begin
     MsgDlg('Não é permitido efetuar pagamentos com data superior a de hoje.','Auditoria de CPMF', mtInformation,[mbOk],0);
     Exit;
  End;

  If (DtProgBaixa.Text = '') And
     (StrToIntDef(ReNumLoteBaixa.Text, 0) = 0.00) Then
  Begin
     MsgDlg('Favor Informar a Data ou o Número do Lote.','Auditoria de CPMF', mtInformation,[mbOk],0);
     Exit;
  End;

  If (CmpBaixas.Valida = VcOk) Then
    If (Trim(dblkFormaPag.Text) = '') Then
    Begin
      MsgDlg('É obrigatório a indicação do Contas/Caixas x Forma Pagamento','Auditoria de CPMF', mtInformation,[mbOk],0);
      If dblkFormaPag.CanFocus Then dblkFormaPag.SetFocus;
    End
    Else
    Begin
      LimpaConsultas;

      if DtProgBaixa.text = '' then
         dDataProgBaixa := 0
      else
         dDataProgBaixa := DtProgBaixa.Date;

      CdsLotesBaixas.Data := ConciliaCPMF.SelLotesBaixa(dDataProgBaixa, StrToIntDef(CmbContaBancaria2.LookupValue,0),
                             CmpBaixas.ForCliReg.Id, StrToIntDef(ReNumLoteBaixa.Text, 0));
    End;
end;

procedure TFrmConciliaCPMFMT.BtnBaixaClick(Sender: TObject);
begin
  inherited;
  If Not CdsLotesBaixas.IsEmpty Then
  Begin
    If CdsLotesBaixas.State In [DsEdit,DsInsert] Then CdsLotesBaixas.Post;


    If MsgDlg('Confirma baixa da(s) CPMF(s) selecionadas?','Confirmação',mtConfirmation, [mbYes, mbNo], 0) = mrYes Then
    Begin
      if not ConciliaCPMF.BaixaCpmf(CdsLotesBaixas.Data, CmpBaixas.ForCliReg.Id, StrToInt(dblkFormaPag.LookupValue), Sistema.IdModulo,
         Sistema.IdUsuario, Sistema.IdEspAcesso, ParamIntegra.Plano, DtProgBaixa.Date, Sistema.UsaPlanoPatro,
         ParamIntegra.IntegraContab, ParamIntegra.PartidaDobrada) then
         MsgDlg(ConciliaCPMF.MessageInfo,'Erro !',mtError,[mbOk],0);

      LimpaConsultas;
    End;
  End;
end;

function TFrmConciliaCPMFMT.IsCpmfConsistente: Boolean;
begin
  Result := (FormatFloat('#,##0.00',CdsLotes.FieldByName('VALCALCULADO').AsFloat) = FormatFloat('#,##0.00',CdsLotes.FieldByName('VALORAUDITORIA').AsFloat)) And
            (FormatFloat('#,##0.00',CdsLotes.FieldByName('VALCALCULADO').AsFloat) = FormatFloat('#,##0.00',CdsLotes.FieldByName('VALPREVISTO').AsFloat))
end;


procedure TFrmConciliaCPMFMT.GrdLotesCalcCellColors(Sender: TObject;
  Field: TField; State: TGridDrawState; Highlight: Boolean; AFont: TFont;
  ABrush: TBrush);
begin
  inherited;
  If Field.Name = 'FLGCONFIRMARECPAG' Then
     ABrush.Color := $00B5FDFD
  Else
     If (Not IsCpmfConsistente)  And
        (Not (gdSelected in State)) Then
     Begin
        AFont.Color := 0;
        ABrush.Color := $008080FF;
     End;
end;

procedure TFrmConciliaCPMFMT.MnuAltDataRetencaoClick(Sender: TObject);
Var
  dData: TDateTime;
  iNunLote: Integer;
begin
  inherited;
  dData := CdsLotes.FieldByName('DATARETENCAO').AsDateTime;

  If (Not CdsLotes.IsEmpty) And
     InputDate(Self.Caption, 'Nova Data de Retenção Lote nº. ' + CdsLotes.FieldByName('NUMLOTE').AsString, dData) And
     (dData <> CdsLotes.FieldByName('DATARETENCAO').AsDateTime) Then
  Begin
     If (CdsLotes.FieldByName('FLGCONFIRMARECPAG').AsString = 'N') Or
        (MsgDlg('Este lote já foi conciliado, deseja alterar a Data de Retenção mesmo assim?','Confirmar',mtConfirmation, [mbYes,mbNo],0)=mryes) Then
     Begin
        iNunLote := CdsLotes.FieldByName('NUMLOTE').AsInteger;
                                                                        
        if not ConciliaCPMF.AlteraDataRetencao(CdsLotes.Data, iNunLote, dData) then
           MsgDlg(ConciliaCPMF.MessageInfo,'Erro !',mtError,[mbOk],0);        

        MsgDlg('Data de Retenção alterada com sucesso.','Auditoria de CPMF', mtInformation,[mbOk],0);
        BtnSeleciona.Click;
     End;
  End;
end;

procedure TFrmConciliaCPMFMT.CdsLotesAfterOpen(DataSet: TDataSet);
begin
  inherited;
  DataSet.FieldByName('DATARETENCAO').Visible := (DtProg.Text = '');
  TFloatField(DataSet.FieldByName('VALCALCULADO')).DisplayFormat := '#,##0.00';
  TFloatField(DataSet.FieldByName('VALORLOTE')).DisplayFormat := '#,##0.00';
  TFloatField(DataSet.FieldByName('VALPREVISTO')).DisplayFormat := '#,##0.00';
  TFloatField(DataSet.FieldByName('VALORAUDITORIA')).DisplayFormat := '#,##0.00';
end;

procedure TFrmConciliaCPMFMT.CdsLotesBeforePost(DataSet: TDataSet);
begin
  inherited;
  If (DataSet.FieldByName('FLGCONFIRMARECPAG').AsString = 'S') And
     (Not IsCpmfConsistente) Then
  Begin
    MsgDlg('Não é possível conciliar LOTES com CPMF Inconsistente','Conciliação de CPMF', mtWarning	,[mbOk],0);
    Abort;
  End;

  If (DataSet.FieldByName('RECALCULA').AsInteger = 1) And
     IsCpmfConsistente Then
  Begin
     MsgDlg('Não é nescessário recalcular CPMF Consistente ','Conciliação de CPMF', mtWarning	,[mbOk],0);
     Abort;
  End;
end;

procedure TFrmConciliaCPMFMT.Progresso(Params: array of Variant);
begin
                                               
  if Params[0] = 0 then
  begin
     frmAguarde.Max := Params[1];
     frmAguarde.Mostra(Params[2]);
  end
  else
    if Params[0] = Params[1] then
       frmAguarde.Apaga
    else
       frmAguarde.Pos := Params[0];
end;

procedure TFrmConciliaCPMFMT.CdsLotesBaixasAfterOpen(DataSet: TDataSet);
begin
  inherited;
  TFloatField(DataSet.FieldByName('VALCALCULADO')).DisplayFormat := '#,##0.00';
  TFloatField(DataSet.FieldByName('VALORLOTE')).DisplayFormat := '#,##0.00';
  TFloatField(DataSet.FieldByName('VALPREVISTO')).DisplayFormat := '#,##0.00';
  TFloatField(DataSet.FieldByName('VALORAUDITORIA')).DisplayFormat := '#,##0.00';
end;

end.
