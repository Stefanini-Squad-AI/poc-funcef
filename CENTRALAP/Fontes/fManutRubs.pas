{-----------------------------------------------------------------------------
Autor(a)    :  Henrique Massão
Data        :  27/02/2009
Pendência   :  SOL 109421 KINTANA 496332
Descricao   :  Alteração de gravação de arquivos de log na raiz do disco C:
------------------------------------------------------------------------------}
(*******************************************************************************
 Analista Responsável: Gustavo Viegas
 - Atualizado em 04/10/2000
   Implementação da possibilidade de alterar o status daas RUBS para todas
   as RUBS ou somente para a SELECIONADA;
   Correção na seleção do motivo de Cancelamento/Recebimento da RUBS
*******************************************************************************)

unit fManutRubs;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  FOkCancelar, IvDictio, IvMulti, IvEMulti, MAHlpBtn, StdCtrls, Buttons,
  TB97Tlbr, TB97, ExtCtrls, Grids, Wwdbigrd, Wwdbgrid, Menus, MontaSelect,
  TREdit, db, DBTables, Wwdatsrc, Wwquery, ppCtrls, ppBands, ppPrnabl,
  ppClass, ppProd, ppReport, ppComm, ppCache, ppDB, ppDBBDE, ppStrtch,
  ppSubRpt, ppRegion, ppRichTx, ppForms, ppPrvDlg, ppTypes, ppMemo, ppVar,
  ppRelatv, ppDBPipe,ufiario,Drubs, FTelaAut, ppEndUsr, ComCtrls, wwriched;

type
  TfrmManutRubs = class(TfrmOkCancelar)
    Panel1: TPanel;
    PpmRubsPendentes: TPopupMenu;
    PpmEmite: TMenuItem;
    PpmGera2via: TMenuItem;
    PpmEmite2Via: TMenuItem;
    PpmCancela: TMenuItem;
    Panel6: TPanel;
    Splitter3: TSplitter;
    Panel26: TPanel;
    MontaSelect: TMontaSelect;
    Panel3: TPanel;
    BtnSeleciona: TBitBtn;
    PnlDadosSel: TPanel;
    qryTipoDocRubPendentes: TwwQuery;
    qryRUBpendentes: TwwQuery;
    dsTipoDocRubPendentes: TwwDataSource;
    dsRUBpendentes: TwwDataSource;
    UpdRUBpendentes: TUpdateSQL;
    UpdTipoDocRubPendentes: TUpdateSQL;
    RgSelPor: TRadioGroup;
    PnlBenefRubs: TPanel;
    Label39: TLabel;
    Label11: TLabel;
    Label7: TLabel;
    Label8: TLabel;
    edPatro: TEdit;
    edmat: TEdit;
    ednome: TEdit;
    edcpf: TEdit;
    PnlDadosRubs: TPanel;
    GroupBox1: TGroupBox;
    EdtRubIni: TRealEdit;
    EdtRubFin: TRealEdit;
    MnuEmiteSel: TMenuItem;
    MnuEmiteAll: TMenuItem;
    Selecionado2: TMenuItem;
    Todos2: TMenuItem;
    MnuGera2All: TMenuItem;
    MnuGera2Sel: TMenuItem;
    MnuCancelaAll: TMenuItem;
    MnuCancelaSel: TMenuItem;
    PnlHist: TPanel;
    wwDBGrid6: TwwDBGrid;
    Panel31: TPanel;
    SplHist: TSplitter;
    Panel2: TPanel;
    GrdDocRecebidos: TwwDBGrid;
    Panel24: TPanel;
    QryHistRubs: TwwQuery;
    QryHistRubsHISTORICO: TMemoField;
    QryHistRubsTRGDTINCLUSAO: TDateTimeField;
    QryHistRubsIDRUBS: TFloatField;
    QryHistRubsIDHISTMOVRUBS: TFloatField;
    DsHistRubs: TwwDataSource;
    Encerra1: TMenuItem;
    Selecionado1: TMenuItem;
    Todos1: TMenuItem;
    GpbStatus: TGroupBox;
    Cks1: TCheckBox;
    Cks2: TCheckBox;
    Cks3: TCheckBox;
    Cks4: TCheckBox;
    Cks6: TCheckBox;
    Cks5: TCheckBox;
    Cks7: TCheckBox;
    qryRubXBeneficio: TwwQuery;
    qryRubXBeneficioNOME: TStringField;
    DsRubXBeneficio: TwwDataSource;
    Panel4: TPanel;
    PnlBenf: TPanel;
    GrdRubPendente: TwwDBGrid;
    Panel25: TPanel;
    Panel30: TPanel;
    wwDBGrid4: TwwDBGrid;
    SplBenef: TSplitter;
    BtnImprime: TBitBtn;
    ppRubs: TppBDEPipeline;
    RptRubs: TppReport;
    HeaderBand1: TppHeaderBand;
    ppLabel1: TppLabel;
    Line1: TppLine;
    LblEmpresa: TppLabel;
    DetailBand1: TppDetailBand;
    FooterBand1: TppFooterBand;
    Line2: TppLine;
    LblSistema: TppLabel;
    RptRubsDBText1: TppDBText;
    RptRubsDBText2: TppDBText;
    RptRubsDBText3: TppDBText;
    RptRubsLabel1: TppLabel;
    RptRubsLabel2: TppLabel;
    RptRubsLabel3: TppLabel;
    SubDocumentos: TppSubReport;
    RptRubsChildReport1: TppChildReport;
    SubBeneficios: TppSubReport;
    RptRubsChildReport2: TppChildReport;
    SubHistorico: TppSubReport;
    RptRubsChildReport3: TppChildReport;
    PpDocs: TppBDEPipeline;
    PpHistorico: TppBDEPipeline;
    Ppbenf: TppBDEPipeline;
    RptRubsChildReport1DetailBand1: TppDetailBand;
    RptRubsChildReport1DBText1: TppDBText;
    RptRubsChildReport1DBText2: TppDBText;
    RptRubsChildReport1Label1: TppLabel;
    RptRubsChildReport1Label2: TppLabel;
    RptRubsChildReport1HeaderBand1: TppHeaderBand;
    RptRubsChildReport2DetailBand1: TppDetailBand;
    RptRubsChildReport2HeaderBand1: TppHeaderBand;
    RptRubsChildReport2DBText1: TppDBText;
    RptRubsChildReport2Label1: TppLabel;
    RptRubsChildReport3DetailBand1: TppDetailBand;
    RptRubsChildReport3HeaderBand1: TppHeaderBand;
    RptRubsChildReport3DBText1: TppDBText;
    RptRubsChildReport3Label1: TppLabel;
    RptRubsChildReport3Label2: TppLabel;
    RptRubsRegion1: TppRegion;
    RptRubsLine1: TppLine;
    PnlSelVisible: TPanel;
    CkbBenf: TCheckBox;
    CkbDoc: TCheckBox;
    CkbHist: TCheckBox;
    QryHistRubsSTATUS: TStringField;
    RptRubsChildReport3DBMemo1: TppDBMemo;
    Calc2: TppSystemVariable;
    Calc1: TppSystemVariable;
    qryfiario: TwwQuery;
    qryfiarioIDPESSOA: TFloatField;
    qryfiarioIDTITULAR: TFloatField;
    qrygrupo: TwwQuery;
    QRYDELETECONTROLATERMO: TwwQuery;
    qryRUBpendentesIDRUBS: TFloatField;
    qryRUBpendentesSTATUS: TStringField;
    qryRUBpendentesFLGSTATUS: TStringField;
    qryRUBpendentesFLGOLDSTATUS: TStringField;
    qryRUBpendentesIDCANCELAMENTO: TFloatField;
    qryRUBpendentesIDHISTBAIXA: TFloatField;
    qryRUBpendentesIDHISTLANCTO: TFloatField;
    qryRUBpendentesDATAMOV: TDateTimeField;
    qryTipoDocRubPendentesNOMEDOCUMENTO: TStringField;
    qryTipoDocRubPendentesIDDOCUMENTO: TFloatField;
    qryTipoDocRubPendentesFLGRECEBIDO: TStringField;
    qryTipoDocRubPendentesOLDFLGRECEBIDO: TStringField;
    qryTipoDocRubPendentesIDTIPODOCXRUB: TFloatField;
    qryTipoDocRubPendentesIDRUBXBENEFICIO: TFloatField;
    qryTipoDocRubPendentesIDRUBS: TFloatField;
    qryTipoDocRubPendentesIDBENEFICIARIO: TFloatField;
    qryTipoDocRubPendentesDATARECEB: TDateTimeField;
    qrygrupoIDPESSOA: TFloatField;
    qrygrupoIDCARTAPADRAO: TFloatField;
    qrygrupoIDETIQPADRAO: TFloatField;
    qrygrupoIDTIPOATENDPADRAO: TFloatField;
    qrygrupoIDDOCRG: TFloatField;
    qrygrupoFLGCTRLPROTOCOLO: TFloatField;
    qrygrupoIDFIARIOENDINC: TFloatField;
    qrygrupoIDFIARIOENDALT: TFloatField;
    qrygrupoIDFIARIOENDEXC: TFloatField;
    qrygrupoIDFIARIOCCINC: TFloatField;
    qrygrupoIDFIARIOCCALT: TFloatField;
    qrygrupoIDFIARIOCCEXC: TFloatField;
    qrygrupoIDFIARIOTELINC: TFloatField;
    qrygrupoIDFIARIOTELALT: TFloatField;
    qrygrupoIDFIARIOTELEXC: TFloatField;
    qrygrupoIDPROTOCOLORUB: TFloatField;
    MSParticipDepen: TMontaSelect;
    qryBuscaRubs: TwwQuery;
    Imprimir1: TMenuItem;
    QryCamposRub: TwwQuery;
    QryDados: TwwQuery;
    DsDados: TwwDataSource;
    UpdBuscaRubs: TUpdateSQL;
    Selecionada1: TMenuItem;
    Todas1: TMenuItem;
    qryaux: TwwQuery;
    qryBuscaRubsIDRUBS: TFloatField;
    qryBuscaRubsFLGSTATUS: TStringField;
    qryBuscaRubsIDREPORTS: TFloatField;
    qryBuscaRubsIDCONFIGRUBS: TFloatField;
    qryBuscaRubsDESCRUB: TStringField;
    qryBuscaRubsNOMETXTRUB: TStringField;
    qryBuscaRubsNOMEDOCRUB: TStringField;
    qryBuscaRubsSEPARADORCOLUNAS: TStringField;
    qryBuscaRubsNUMDIASCARTAAVISO: TFloatField;
    qryBuscaRubsFLGDELIMITALINHA: TStringField;
    qryBuscaRubsIDCARTACOBRANCA: TFloatField;
    wwDBRichEditOBS: TwwDBRichEdit;
    Label1: TLabel;
    qryTipoDocRubPendentesOBS: TStringField;
    ppDetalhe_Dependente_IRRF: TppBDEPipeline;
    PpDados: TppBDEPipeline;
    ppdetalhe_documentos: TppBDEPipeline;
    RptModelo: TppReport;
    ppDetailBand2: TppDetailBand;
    ppDBText1: TppDBText;
    ppDBText2: TppDBText;
    DsgnCM: TppDesigner;
    ppDetalhe_Telefones: TppBDEPipeline;
    ppDetalhe_Dependente: TppBDEPipeline;
    ppDetalhe_Beneficiario: TppBDEPipeline;
    procedure GrdDocRecebidosDblClick(Sender: TObject);
    procedure GrdDocRecebidosCalcCellColors(Sender: TObject; Field: TField;
      State: TGridDrawState; Highlight: Boolean; AFont: TFont;
      ABrush: TBrush);
    procedure FormCreate(Sender: TObject);
    procedure BtnSelecionaClick(Sender: TObject);
    procedure bbtnConfirmarClick(Sender: TObject);
    procedure qryRUBpendentesAfterScroll(DataSet: TDataSet);
    procedure RgSelPorClick(Sender: TObject);
    procedure bbtnCancelarClick(Sender: TObject);
    procedure MnuEmiteSelClick(Sender: TObject);
    procedure Cks1Click(Sender: TObject);
    procedure LblEmpresaPrint(Sender: TObject);
    procedure LblSistemaPrint(Sender: TObject);
    procedure BtnImprimeClick(Sender: TObject);
    procedure CkbBenfClick(Sender: TObject);
    procedure CkbDocClick(Sender: TObject);
    procedure CkbHistClick(Sender: TObject);
    procedure FormCloseQuery(Sender: TObject; var CanClose: Boolean);
    procedure GrdRubPendenteMouseDown(Sender: TObject;
      Button: TMouseButton; Shift: TShiftState; X, Y: Integer);
    procedure Selecionada1Click(Sender: TObject);
    procedure Todas1Click(Sender: TObject);
    procedure wwDBRichEditOBSEnter(Sender: TObject);
    procedure wwDBRichEditOBSExit(Sender: TObject);
    procedure GravaEmissaoCarta(Sender: TObject);
  private
    { Private declarations }
    bAbreConsultas :Boolean;
    sStatusRubs :String;
    Procedure LimpaGrid;
  public
    { Public declarations }
    procedure ConfiguraConsulta(bConsulta:Boolean);
  end;

var
  frmManutRubs: TfrmManutRubs;
  // andre tavares 24/01/2002
  s : string;

implementation

uses uRubs, uFuncaoGeral, DAtend, uDataBase, uMensErro, uSistema, FPrincipal, dBasedados, FPREVIEW;

{$R *.DFM}

procedure TfrmManutRubs.GrdDocRecebidosDblClick(Sender: TObject);
Var
  BmMarca :TbookMark;
  bRecebido :Boolean;
  idTipoBaixa :LongInt;
begin
  inherited;
  With qryTipoDocRubPendentes Do
  Begin
     If (Not bAbreConsultas) And (Not IsEmpty) Then
     Begin
        Edit;
        If qryTipoDocRubPendentes.FieldByName('FLGRECEBIDO').AsString = 'S' Then
        Begin
          qryTipoDocRubPendentesDATARECEB.Clear;
          qryTipoDocRubPendentesFLGRECEBIDO.AsString := 'N';
        End
        Else
        Begin
          qryTipoDocRubPendentesDATARECEB.asDateTime := Date;
          qryTipoDocRubPendentesFLGRECEBIDO.AsString := 'S'
        End;
        Post;

        BmMarca := GetBookmark;
        First;
        bRecebido := True;

        While Not Eof Do
        Begin
           bRecebido := (bRecebido And (qryTipoDocRubPendentes.FieldByName('FLGRECEBIDO').AsString = 'S'));
           Next;
        End;

        If bRecebido Then
        Begin
           qryRUBpendentes.Edit;
           qryRUBpendentesSTATUS.AsString := Rubs.DescricaoStatus(srEncerrado);
           qryRUBpendentesFLGSTATUS.AsString := '7';
           Rubs.StatusRubs := srEncerrado;
           idTipoBaixa := Rubs.GetTipoBaixa;

           If idTipoBaixa > 0  Then
              qryRUBpendentesIDCANCELAMENTO.AsFloat := idTipoBaixa
           Else
              qryRUBpendentesIDCANCELAMENTO.Clear;

           qryRUBpendentes.Post;
        End
        Else
        Begin
           If qryRUBpendentesFLGSTATUS.AsString = IntToStr(Integer(srEncerrado) + 1) Then
           Begin
              qryRUBpendentes.Edit;
              qryRUBpendentesSTATUS.AsString := Rubs.DescricaoStatus(TStatusRubs(qryRUBpendentesFLGOLDSTATUS.AsInteger - 1));
              qryRUBpendentesFLGSTATUS.AsString := qryRUBpendentesFLGOLDSTATUS.AsString;
              qryRUBpendentesIDCANCELAMENTO.Clear;
              qryRUBpendentes.Post;
           End;
        End;

        If BookmarkValid(BmMarca) Then
        Begin
           GotoBookMark(BmMarca);
           FreeBookmark(BmMarca);
        End;
     End;
  End;
end;

procedure TfrmManutRubs.GrdDocRecebidosCalcCellColors(Sender: TObject;
  Field: TField; State: TGridDrawState; Highlight: Boolean; AFont: TFont;
  ABrush: TBrush);
begin
  inherited;
  If Field.FieldName = 'FLGRECEBIDO' Then  ABrush.Color := $00C6FFFF;
end;

procedure TfrmManutRubs.FormCreate(Sender: TObject);
begin
  inherited;
  //Henrique Massão
  RptModelo.Template.FileName:=Sistema.RetornaCaminhoArquivos(Sistema.IdEmpresa) + '\teste.TXT ';
  Fiario := nil;
  Fiario := TFiario.Create;
  sStatusRubs := '';
  RgSelPorClick(Self);
  s := '';
end;

procedure TfrmManutRubs.BtnSelecionaClick(Sender: TObject);
Var
  rIdPessoa, rIdtitular, rIdPessJur, rIdPlanoPrev :Real;
  sFraseFiltro :String;
  ms : boolean;
begin
  inherited;
  LimpaGrid;
  rIdPessoa  := 0;
  rIdtitular := 0;
  rIdPessJur := 0;
  rIdPlanoPrev := 0;
  ms := false;

  Case RgSelPor.ItemIndex Of
   0:
   Begin

    If MontaSelect.Executar = MrOk Then
    Begin
       rIdPessoa  := StrToIntDef(MontaSelect.ValoresChave[12],-1);
       rIdtitular := StrToIntDef(MontaSelect.ValoresChave[9],-1);
       rIdPessJur := StrToIntDef(MontaSelect.ValoresChave[8],-1);
       ednome.Text    := MontaSelect.ValoresChave[0];
       edcpf.Text     := MontaSelect.ValoresChave[1];
       edmat.Text     := MontaSelect.ValoresChave[2];
       edPatro.Text   := MontaSelect.ValoresChave[5];
       ms := true;
    End
    Else
      Exit;
   End;
   1:
   Begin
     rIdtitular := 0;
     rIdPessoa  := 0;
     rIdPessJur := 0;
     ms := false;
   End;
   2:
   begin
      MsParticipDepen.executar;
      if MsParticipDepen.RetornouValor then
      begin
        rIdPessoa    := StrToIntDef(MsParticipDepen.ValoresChave[9], -1);
        rIdtitular   := StrToIntDef(MsParticipDepen.ValoresChave[7], -1);
        rIdPessJur   := StrToIntDef(MsParticipDepen.ValoresChave[6], 0);
        rIdPlanoPrev := StrToIntDef(MsParticipDepen.ValoresChave[10], 0);
        edNome.text  := MsParticipDepen.ValoresChave[0];
        edMat.text   := MsParticipDepen.ValoresChave[2];
        edCpf.text   := MsParticipDepen.ValoresChave[1];
        edPatro.text := MsParticipDepen.ValoresChave[6];
        ms := false;
      end
      else
      begin
        Exit;
      end;
   end;
  End;

   If (rIdtitular <> 0) then
     With DtmAtend.qryplanprev Do
     Begin
       If Active Then close;
       If Not Prepared Then Prepare;
       ParamByName('IDPESSOA').AsFloat := rIdtitular;
       ParamByName('IDPESSJUR').AsFloat := rIdPessJur;
       Open;
     End;
      if not DtmAtend.qryplanprev.IsEmpty then
        rIdPlanoPrev := DtmAtend.qryplanprev.FieldByName('idplanoprev').AsFloat
      else
      begin
        if MsParticipDepen.RetornouValor and not ms then
          rIdPlanoPrev := strToInt(MsParticipDepen.ValoresChave[10]);
      end;

   With qryTipoDocRubPendentes Do
   Begin
     if Active then Close;
     If (rIdtitular <> 0) then
     Begin
        Sql.Text := SQLDOCPEND +
                    ' RX.IDPESSJUR = ' + FloatToStr(rIdPessJur) +
                    ' AND  RX.IDTITULAR = ' + FloatToStr(rIdtitular) +
                    ' AND  RX.IDPESSOA = ' + FloatToStr(rIdPessoa) +
                    ' AND  RX.IDPLANOPREV = ' + FloatToStr(rIdPlanoPrev) + ' AND ' +
                    WHEREDOCPEND;

     End
     Else
     Begin
        Sql.Text := SQLDOCPEND +
                    FuncaoGeral.Decode(EdtRubIni.Value,0,'',' R.IDRUBS >= ' + EdtRubIni.Text + ' AND ') +
                    FuncaoGeral.Decode(EdtRubFin.Value,0,'',' R.IDRUBS <= ' + EdtRubFin.Text + ' AND ') +
                    FuncaoGeral.Decode(sStatusRubs,'','',' ( R.FLGSTATUS IN (' + sStatusRubs + ')) AND ') +
                    WHEREDOCPEND;
     End;


     qryTipoDocRubPendentes.Open;

     // entra aqui se é rub de recadastramento
     If not ms and (rIdtitular <> 0) and (MsParticipDepen.retornouValor)
               and (qryTipoDocRubPendentes.RecordCount = 0) then
     Begin
        rIdPessJur := 0;
        Close;
        Sql.Text := SQLDOCPEND +
                    ' RX.IDPESSJUR is null '+
                    ' AND  RX.IDTITULAR = ' + MsParticipDepen.ValoresChave[7] +
                    ' AND  RX.IDPESSOA = ' + MsParticipDepen.ValoresChave[9] +
                    ' AND  RX.IDPLANOPREV is null ' + ' AND ' +
                    WHEREDOCPEND;

       Open;
     end;

   End;

   With qryRUBpendentes Do
   Begin
     if Active then Close;
     // neste bloco fiz o mesmo dos blocos acima
     If (rIdtitular <> 0) and (rIdPessJur <> 0) Then
     Begin
        sFraseFiltro := ' Rx.IDPESSJUR = ' + FloatToStr(rIdPessJur) +
                        ' AND  Rx.IDTITULAR = ' + FloatToStr(rIdtitular) +
                        ' AND  Rx.IDPESSOA = ' + FloatToStr(rIdPessoa) +
                        ' AND  Rx.IDPLANOPREV = ' + FloatToStr(DtmAtend.qryplanprev.FieldByName('idplanoprev').AsFloat)+
                        ' AND ';

        Sql.Text := SQLRUBSPEND + sFraseFiltro +  WHERERUBSPEND;
     End
     // entra aqui se é rub de recadastramento
     else If not ms and (rIdtitular <> 0) and (rIdPessJur = 0) Then
     Begin
        sFraseFiltro := ' Rx.IDPESSJUR is null ' +
                        ' AND  Rx.IDPESSOA = ' + MsParticipDepen.ValoresChave[9] +
                        ' AND  Rx.IDPLANOPREV is null AND ';
        Sql.Text := SQLRUBSPEND + sFraseFiltro +  WHERERUBSPEND;
     end

     Else if (rIdtitular = 0) then
     Begin
        sFraseFiltro :=
           FuncaoGeral.Decode(EdtRubIni.Value,0,'',' R.IDRUBS >= ' + EdtRubIni.Text + ' AND ') +
           FuncaoGeral.Decode(EdtRubFin.Value,0,'',' R.IDRUBS <= ' + EdtRubFin.Text + ' AND ') +
           FuncaoGeral.Decode(sStatusRubs,'','',' ( R.FLGSTATUS IN (' + sStatusRubs + ')) AND ');

        Sql.Text := SQLRUBSPEND + sFraseFiltro + WHERERUBSPEND;
     End;
     Open;

     If bAbreConsultas Then
     Begin
        If QryHistRubs.Active Then QryHistRubs.Close;
        QryHistRubs.Open;

        If qryRubXBeneficio.Active Then qryRubXBeneficio.Close;
        qryRubXBeneficio.Open;
     End;
   End;
end;

Procedure TfrmManutRubs.LimpaGrid;
Begin
  ednome.Text    := '';
  edcpf.Text     := '';
  edmat.Text     := '';
  edPatro.Text   := '';

  FuncaoGeral.FechaQry([qryTipoDocRubPendentes,qryRUBpendentes, QryHistRubs, qryRubXBeneficio], false, True);
  qryTipoDocRubPendentes.Open;
  qryRUBpendentes.Open;

  If bAbreConsultas Then
  Begin
     QryHistRubs.Open;
  End;
// andre tavares 26/03/2002
  qryRubXBeneficio.Open;

  With DtmAtend.qryplanprev Do
  Begin
    If Active Then close;
    If Not Prepared Then Prepare;
    ParamByName('IDPESSOA').AsFloat := -1;
    ParamByName('IDPESSJUR').AsFloat := -1;
    Open;
  End;

  With qryTipoDocRubPendentes Do
  Begin
    if Active then Close;
    if Not Prepared then Prepare;
    Sql.text := SQLDOCPEND + ' 1=2';
    Open;
  End;

  With qryRUBpendentes Do
  Begin
    if Active then Close;
    if Not Prepared then Prepare;
    Sql.text := SQLRUBSPEND + ' 1=2';
    Open;
  End;
End;

procedure TfrmManutRubs.bbtnConfirmarClick(Sender: TObject);
Var
  bPedeComplemento :Boolean;
  DESCRICAO : STRING;
begin
  inherited;
  if  dtmBaseDados.dbBaseDados.InTransaction then
    RollbackTransacao;
  StartTransacao;

  try
    try
      try
        QRYDELETECONTROLATERMO.EXECSQL;
      except
        MessageDlg('        Não Foi possível Executar a QUERY '+#13+#10+'QRYDELETECONTROLATERMO', mtError, [mbOK], 0);
      end;
    Rubs.DeletaArquivos := True;

    qryRUBpendentes.First;
    bPedeComplemento := True;

    If bAbreConsultas Then
    Begin
      QryHistRubs.DataSource := nil;
    End;

    While Not qryRUBpendentes.Eof Do
    Begin
        Rubs.IdRubs := qryRUBpendentesIDRUBS.AsInteger;
        If (qryRUBpendentesFLGSTATUS.AsString <> qryRUBpendentesFLGOLDSTATUS.AsString) Then
        Begin
           Rubs.StatusRubs := TStatusRubs(qryRUBpendentesFLGSTATUS.AsInteger - 1);
           Rubs.IdTipoBaixa :=  qryRUBpendentesIDCANCELAMENTO.AsInteger;
           Rubs.Edit;
            If qryfiario.Active Then qryfiario.close;

           qryfiario.ParamByName('IDrubs').AsInteger :=qryRUBpendentesIDRUBS.AsInteger;

           qryfiario.Open;
           Case qryRUBpendentesFLGSTATUS.AsInteger of
              1  :DESCRICAO := 'Gerada';
              2  :DESCRICAO := 'Emitida';
              3  :DESCRICAO := 'Regerada';
              4  :DESCRICAO := 'Reemitida';
              5  :DESCRICAO := 'Cancelada';
              6  :DESCRICAO := 'Com Carta Enviada';
              7  :DESCRICAO := 'Recebida';
              8  :DESCRICAO := 'Etiqueta Emitida';
              9  :DESCRICAO := 'Carta de Rosto Emitida';
              10 :DESCRICAO := 'Termo Emitido';
              11 :DESCRICAO := 'Documento Recebido';
              12 :DESCRICAO := 'Documento Pendente';
          Else
           DESCRICAO := 'Operação não informada'
         End;

           If qrygrupo.Active then qrygrupo.Close;
            qrygrupo.Open ;


            If (qrygrupo.isEmpty = FALSE) and (qryGrupoIDPROTOCOLORUB.AsInteger <> 0) and
              not(qryGrupoIDPROTOCOLORUB.isNull)then
            begin
              Fiario.IdGrupo := qryGrupoIDPROTOCOLORUB.AsInteger;
              Fiario.IdPessoa := qryfiarioIDPESSOA.AsInteger;
              Fiario.IdTitular := qryfiarioIDTITULAR.AsInteger;
              Fiario.Idusuario :=sistema.idusuario;
              Fiario.Idmodulo :=  19;
              Fiario.Idrubs := qryRUBpendentesIDRUBS.AsInteger;
              Fiario.Descricao :=  'Rub '+DESCRICAO;
              Fiario.DataInclusao := Date;
              Fiario.Inserir;
            end;


           If ((qryRUBpendentesFLGSTATUS.AsString = '2') Or
               (qryRUBpendentesFLGSTATUS.AsString = '4')) Then
           Begin
              If bPedeComplemento Then
              Begin
                 bPedeComplemento := False;
              End;
              rubs.edit;
              Rubs.NumRub      := qryRUBpendentesIDRUBS.AsFloat;
              Rubs.Emite;
           End;
        End;

        qryTipoDocRubPendentes.First;
        While Not qryTipoDocRubPendentes.Eof Do
        Begin
              Rubs.Documento.Nome := qryTipoDocRubPendentes.FieldByName('NOMEDOCUMENTO').AsString;
              Rubs.Documento.IdtipoDocxRub := qryTipoDocRubPendentes.FieldByName('IDTIPODOCXRUB').AsInteger;
              If (qryTipoDocRubPendentes.FieldByName('OLDFLGRECEBIDO').AsString <> qryTipoDocRubPendentes.FieldByName('FLGRECEBIDO').AsString) Then
              Begin
                Rubs.Documento.DataRecebimento := Date;
              end
              else
              begin
                Rubs.Documento.DataRecebimento := qryTipoDocRubPendentes.FieldByName('DATARECEB').AsDateTime;
              end;
              Rubs.Documento.Recebido := (qryTipoDocRubPendentes.FieldByName('FLGRECEBIDO').AsString = 'S');
// tavares 20/08/2003
              Rubs.Documento.OBS := qryTipoDocRubPendentes.FieldByName('OBS').AsString;
              Rubs.Documento.Edit;


           qryTipoDocRubPendentes.Next;

        End;

        qryRUBpendentes.Next;

    End;

  finally
    CommitTransacao;

    If bAbreConsultas Then
    Begin
      QryHistRubs.DataSource := dsRUBpendentes;
      qryRubXBeneficio.DataSource := dsRUBpendentes;
    End;
    MsgDlg('Operação concluída com sucesso','Sucesso',MtInformation,[MbOk],0);
    LimpaGrid;
  end;
  except
    RollbackTransacao;
    If bAbreConsultas Then
    Begin
      QryHistRubs.DataSource := dsRUBpendentes;
      qryRubXBeneficio.DataSource := dsRUBpendentes;
    End;
    MsgDlg('Erro ao atualizar RUBS','Erro',MtError,[MbOk],0);
  end;
end;

procedure TfrmManutRubs.qryRUBpendentesAfterScroll(DataSet: TDataSet);
begin
  inherited;
  If Not qryRUBpendentes.IsEmpty Then
     qryTipoDocRubPendentes.Filter := 'IDRUBS = ' +  qryRUBpendentesIDRUBS.AsString;
end;

procedure TfrmManutRubs.RgSelPorClick(Sender: TObject);
begin
  inherited;
  PnlDadosRubs.Visible := (RgSelPor.ItemIndex = 1);
  PnlBenefRubs.Visible := Not PnlDadosRubs.Visible;
  LimpaGrid;
end;

procedure TfrmManutRubs.bbtnCancelarClick(Sender: TObject);
begin
  inherited;
  FuncaoGeral.FechaQry([qryTipoDocRubPendentes,qryRUBpendentes],false,True);

  if  dtmBaseDados.dbBaseDados.InTransaction then
    RollbackTransacao;

  qryTipoDocRubPendentes.Open;
  qryRUBpendentes.Open;
end;

procedure TfrmManutRubs.MnuEmiteSelClick(Sender: TObject);
Var
  idTipoBaixa :Integer;
begin
  inherited;

  If (Not qryRUBpendentes.IsEmpty) And
     (qryRUBpendentesSTATUS.AsString <>  '7') Then
  Begin
     //Tag Negativo: Aplica Alterções a todos os documentos do Grid.
     If (Sender AS TmenuItem).Tag < 0 Then qryRUBpendentes.First;
     idTipoBaixa := -1;

     repeat
        qryRUBpendentes.Edit;
        qryRUBpendentesSTATUS.AsString := Rubs.DescricaoStatus(TStatusRubs(Abs((Sender AS TmenuItem).Tag)));
        qryRUBpendentesFLGSTATUS.AsString := IntToStr(Abs((Sender AS TmenuItem).Tag) + 1);

        If (Abs((Sender AS TmenuItem).Tag) In [4,6]) Then
        Begin
           If Abs((Sender AS TmenuItem).Tag) = 4 Then
              Rubs.StatusRubs := srCancelado
           Else
              Rubs.StatusRubs := srEncerrado;

           If idTipoBaixa = -1 Then idTipoBaixa := Rubs.GetTipoBaixa;

           If idTipoBaixa > 0  Then
              qryRUBpendentesIDCANCELAMENTO.AsFloat := idTipoBaixa
           Else
              qryRUBpendentesIDCANCELAMENTO.Clear;
        End
        Else
          qryRUBpendentesIDCANCELAMENTO.Clear;

        qryRUBpendentes.Post;
        If (Sender AS TmenuItem).Tag < 0 Then qryRUBpendentes.Next;

     until (((Sender AS TmenuItem).Tag > 0) Or qryRUBpendentes.Eof);
  End;

end;


procedure TfrmManutRubs.Cks1Click(Sender: TObject);
Var
  X:Integer;
begin
  inherited;
  sStatusRubs := '';
  For X:=0 To GpbStatus.ControlCount - 1 Do
  Begin
    If (GpbStatus.Controls[x] Is TCheckBox) Then
    Begin
       If (GpbStatus.Controls[x] As TCheckBox).Checked Then
       Begin
          If sStatusRubs = '' Then
             sStatusRubs := '''' + IntToStr((GpbStatus.Controls[x] As TCheckBox).Tag) + ''''
          Else
             sStatusRubs := sStatusRubs + ',''' + IntToStr((GpbStatus.Controls[x] As TCheckBox).Tag) + '''';
       End;
    End;
  End;
end;

procedure TfrmManutRubs.ConfiguraConsulta(bConsulta:Boolean);
Begin
// andre tavares 26/03/2002
  SplBenef.Visible := bConsulta;
  PnlHist.Visible := bConsulta;
  SplHist.Visible := bConsulta;
  PnlSelVisible.Visible := bConsulta;
  bbtnConfirmar.Visible := Not bConsulta;
  bbtnCancelar.Visible := Not bConsulta;
  BtnImprime.Visible := bConsulta;
  bAbreConsultas := bConsulta;

  If bConsulta Then
  Begin
     ppRegisterForm(TppCustomPreviewer, TppPrintPreview);
     GrdRubPendente.PopupMenu := nil;
  End
  Else
     GrdRubPendente.PopupMenu := PpmRubsPendentes;

End;

procedure TfrmManutRubs.LblEmpresaPrint(Sender: TObject);
begin
  inherited;
  LblEmpresa.Caption := Sistema.NomeEmpresa;
end;

procedure TfrmManutRubs.LblSistemaPrint(Sender: TObject);
begin
  inherited;
  LblSistema.Caption := Sistema.NomeModulo + ' ' + Sistema.Versao;
end;

procedure TfrmManutRubs.BtnImprimeClick(Sender: TObject);
begin
  inherited;
  If Not qryRUBpendentes.IsEmpty Then
  Begin
     RptRubs.Device := DvScreen;
     RptRubs.Print;
  End;
end;

procedure TfrmManutRubs.CkbBenfClick(Sender: TObject);
begin
  inherited;
  SubBeneficios.Visible := CkbBenf.Checked;
end;

procedure TfrmManutRubs.CkbDocClick(Sender: TObject);
begin
  inherited;
  SubDocumentos.Visible := CkbDoc.Checked;
end;

procedure TfrmManutRubs.CkbHistClick(Sender: TObject);
begin
  inherited;
  SubHistorico.Visible := CkbHist.Checked;
end;


procedure TfrmManutRubs.FormCloseQuery(Sender: TObject;
  var CanClose: Boolean);
begin
  inherited;
  try
    Fiario.Free;
  except end;
end;

procedure TfrmManutRubs.GrdRubPendenteMouseDown(Sender: TObject;
  Button: TMouseButton; Shift: TShiftState; X, Y: Integer);
begin
  inherited;
  if upperCase(qryRUBpendentesSTATUS.asString) = 'REEMITIDA' Then
  begin
    PpmEmite.Enabled := false;
    PpmGera2via.Enabled := false;
    PpmEmite2Via.Enabled := false;
  end
  else if (upperCase(qryRUBpendentesSTATUS.asString) = 'CANCELADA') or
          (upperCase(qryRUBpendentesSTATUS.asString) = 'ENCERRADA') or
          (upperCase(qryRUBpendentesSTATUS.asString) = 'RECEBIDA') then
  begin
    PpmEmite.Enabled := false;
    PpmGera2via.Enabled := false;
    PpmEmite2Via.Enabled := false;
    Encerra1.Enabled := false;
    PpmCancela.Enabled := false;
  end
  else
  begin
    PpmEmite.Enabled := true;
    PpmGera2via.Enabled := true;
    PpmEmite2Via.Enabled := true;
    Encerra1.Enabled := true;
    PpmCancela.Enabled := true;
  end;
end;

procedure TfrmManutRubs.GravaEmissaoCarta(Sender: TObject);
begin
   try
   If (Application.MessageBox('As RUBS foram impressas corretamente?','Central de Atendimento ao Público',Mb_YesNo + Mb_IConQuestion) = Id_Yes) Then
   begin
     qryAux.Close;
     qryAux.SQL.Text := ' update RUBS       '+
                        ' set FLGSTATUS = 2 '+
                        ' where IDRUBS =    '+ qryRUBpendentes.fieldByName('IDRUBS').asString;
     qryAux.ExecSQL;

     qryAux.Close;
     qryAux.SQL.Text := ' INSERT INTO HISTMOVRUBS '+
                        ' (IDHISTMOVRUBS, IDRUBS, FLGSTATUS, DATAMOV, HISTORICO) '+
                        ' VALUES ( '+ intToStr(LeultRegistro(nil,'HISTMOVRUBS')) + ', '+ qryRUBpendentes.fieldByName('IDRUBS').asString + ' , 2, '
                        + 'to_date(' + quotedStr(DateTimeToStr(now)) + ',''dd/mm/yyyy hh24:mi:ss'')' +', ' + quotedStr('RUBS Emitida (impressa)') + ') ';
     qryAux.ExecSQL;
   end

  except
    RollbackTransacao;
  end;
end;


procedure TfrmManutRubs.Selecionada1Click(Sender: TObject);
begin
  inherited;
  DtmRubs.PrintRubs(QryRubPendentesIDRUBS.asInteger, rptModelo);
end;

procedure TfrmManutRubs.Todas1Click(Sender: TObject);
begin
  inherited;
  QryRubPendentes.First;
  while not QryRubPendentes.Eof do
  begin
    DtmRubs.PrintRubs(QryRubPendentesIDRUBS.asInteger, rptModelo);
    QryRubPendentes.Next;
  end;
end;

procedure TfrmManutRubs.wwDBRichEditOBSEnter(Sender: TObject);
begin
  inherited;
  qryTipoDocRubPendentes.Edit;
end;

procedure TfrmManutRubs.wwDBRichEditOBSExit(Sender: TObject);
begin
  inherited;
  if qryTipoDocRubPendentes.state in [dsEdit, dsInsert] then
    qryTipoDocRubPendentes.Post;
end;

end.
