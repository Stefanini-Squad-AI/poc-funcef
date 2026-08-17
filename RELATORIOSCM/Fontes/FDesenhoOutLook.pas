unit FDesenhoOutLook;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  FPai, ExtCtrls, ComCtrls, StdCtrls, DBCtrls, Db, Wwdatsrc,
  DBTables, Wwquery, Grids, Wwdbigrd, Wwdbgrid, Mask, wwdbedit, MontaSelect,
  Spin, Buttons, TB97Tlbr, TB97Ctls, TB97, ppViewr, ppFilDev, ppComm,
  ppProd, ppReport, ppCache, ppDB, ppDBBDE, ppTypes, CmSqlWzd,
  IvDictio, IvMulti, IvEMulti, DBGrids, ffiltrasql, TeeProcs, TeEngine,
  Chart, DBChart, ppChrtDB, ppBands, ppClass, ppPrnabl, ppCtrls, ppChrt,
  fcOutlookList, fcButton, fcImgBtn, fcShapeBtn, fcClearPanel, DbClient,
  fcButtonGroup, fcOutlookBar, ppRelatv, ppDBPipe, ImgList;

type
  TTipoReport = ( trQryManual, trDataModulo );

  TFrmDesenhoOutLook = class(TfrmPai)
    ImlWork: TImageList;
    ImlReports: TImageList;
    QryDadosReports: TwwQuery;
    ScrollBox1: TScrollBox;
    NtbReports: TNotebook;
    LblConsAssoc: TLabel;
    LblGrupoRelat: TLabel;
    LblDescRelat: TLabel;
    LblSisRelat: TLabel;
    LblNomeRelat: TLabel;
    DbtNomeRelat: TDBText;
    DbtNomeConsRelat: TDBText;
    DbtGrupoRelat: TDBText;
    DbtSistRelat: TDBText;
    Shape1: TShape;
    DbCkbFiltro: TDBCheckBox;
    DbmDescRelat: TDBMemo;
    Nome: TLabel;
    LblDescConsulta: TLabel;
    LblMemConsulta: TLabel;
    EditNome: TwwDBEdit;
    DBMemo2: TDBMemo;
    DBMemo3: TDBMemo;
    DsDadosConsulta: TwwDataSource;
    QryDadosConsulta: TwwQuery;
    MsConsulta: TMontaSelect;
    MsRelat: TMontaSelect;
    DsSql: TwwDataSource;
    PnlPreview: TPanel;
    ppViewer1: TppViewer;
    wwDBGrid2: TwwDBGrid;
    Dock973: TDock97;
    Toolbar972: TToolbar97;
    spbPreview100Percent: TToolbarButton97;
    spbPreviewWhole: TToolbarButton97;
    spbPreviewPrint: TToolbarButton97;
    ToolbarSep973: TToolbarSep97;
    ToolbarSep974: TToolbarSep97;
    lblRelatPct: TLabel;
    spbPreviewWidth: TToolbarButton97;
    ToolbarSep975: TToolbarSep97;
    SpBtnNextPage: TSpeedButton;
    SpBtnLastPage: TSpeedButton;
    LblPreviewPage: TLabel;
    SpBtnPriorPage: TSpeedButton;
    SpBrnFirstPage: TSpeedButton;
    bbtnAbrir: TToolbarButton97;
    bbtnSalvar: TToolbarButton97;
    SpinEdit1: TSpinEdit;
    opnReport: TOpenDialog;
    PpSql: TppBDEPipeline;
    dpDataView: TppBDEPipeline;
    TreeReports: TTreeView;
    svReport: TSaveDialog;
    QryDadosReportsNOMEMODULO: TStringField;
    QryDadosReportsNOMERELATORIO: TStringField;
    QryDadosReportsDESCRICAO: TStringField;
    QryDadosReportsNOMECONSULTA: TStringField;
    QryDadosReportsFLGFILTROMANUAL: TStringField;
    QryDadosReportsDESCRIPTION: TMemoField;
    QryDadosReportsDATAVIEWTEMPLATE: TBlobField;
    QryDadosReportsREPORTTEMPLATE: TBlobField;
    QryDadosReportsNAME: TStringField;
    GridSql: TDBGrid;
    DsGrid: TwwDataSource;
    Qry: TwwQuery;
    QryDadosConsultaIDDATAVIEW: TFloatField;
    QryDadosConsultaNAME: TStringField;
    QryDadosConsultaDESCRIPTION: TMemoField;
    QryDadosConsultaTEMPLATE: TBlobField;
    QryDadosConsultaCLASSNAME: TStringField;
    QryDadosConsultaORIGEMCMDV: TFloatField;
    qryDataView: TwwQuery;
    LkReports: TfcOutlookBar;
    OutConsultas: TfcOutlookList;
    BtnConsultas: TfcShapeBtn;
    OutRelatorios: TfcOutlookList;
    BtnRelatorios: TfcShapeBtn;
    OutAssistentes: TfcOutlookList;
    BtnAssistentes: TfcShapeBtn;
    OutEtiquetas: TfcOutlookList;
    BtnEtiquetas: TfcShapeBtn;
    RptCM: TppReport;
    ppHeaderBand1: TppHeaderBand;
    ppDetailBand1: TppDetailBand;
    ppFooterBand1: TppFooterBand;
    procedure FormCreate(Sender: TObject);
    procedure FormDestroy(Sender: TObject);
    procedure spbPreviewWidthClick(Sender: TObject);
    procedure spbPreview100PercentClick(Sender: TObject);
    procedure spbPreviewWholeClick(Sender: TObject);
    procedure spbPreviewPrintClick(Sender: TObject);
    procedure bbtnAbrirClick(Sender: TObject);
    procedure bbtnSalvarClick(Sender: TObject);
    procedure SpinEdit1Change(Sender: TObject);
    procedure SpBrnFirstPageClick(Sender: TObject);
    procedure SpBtnPriorPageClick(Sender: TObject);
    procedure SpBtnNextPageClick(Sender: TObject);
    procedure SpBtnLastPageClick(Sender: TObject);
    procedure ppViewer1PageChange(Sender: TObject);
    procedure ppViewer1PrintStateChange(Sender: TObject);
    procedure TreeReportsChange(Sender: TObject; Node: TTreeNode);
    procedure fcOutlookBar1OutlookList1Items3Click(
      OutlookList: TfcCustomOutlookList; Item: TfcOutlookListItem);
    procedure fcOutlookBar1OutlookList1Items2Click(
      OutlookList: TfcCustomOutlookList; Item: TfcOutlookListItem);
    procedure fcOutlookBar1OutlookList1Items1Click(
      OutlookList: TfcCustomOutlookList; Item: TfcOutlookListItem);
    procedure fcOutlookBar1OutlookList1Items0Click(
      OutlookList: TfcCustomOutlookList; Item: TfcOutlookListItem);
    procedure BtnConsultasClick(Sender: TObject);
    procedure fcOutlookBar1OutlookList2Items2Click(
      OutlookList: TfcCustomOutlookList; Item: TfcOutlookListItem);
    procedure fcOutlookBar1OutlookList2Items1Click(
      OutlookList: TfcCustomOutlookList; Item: TfcOutlookListItem);
    procedure fcOutlookBar1OutlookList2Items0Click(
      OutlookList: TfcCustomOutlookList; Item: TfcOutlookListItem);
    procedure fcOutlookBar1OutlookList3Items1Click(
      OutlookList: TfcCustomOutlookList; Item: TfcOutlookListItem);
    procedure fcOutlookBar1OutlookList3Items0Click(
      OutlookList: TfcCustomOutlookList; Item: TfcOutlookListItem);
    procedure fcOutlookBar1OutlookList4Items1Click(
      OutlookList: TfcCustomOutlookList; Item: TfcOutlookListItem);
    procedure fcOutlookBar1OutlookList4Items0Click(
      OutlookList: TfcCustomOutlookList; Item: TfcOutlookListItem);
    procedure OutRelatoriosItems3Click(OutlookList: TfcCustomOutlookList;
      Item: TfcOutlookListItem);
  private
    { Private declarations }
    ChangeZoom, SemRelatorio: Boolean;
    ListaReports: TStringList;
    ArquivoSaida : TppArchiveDevice;
    //RelatManual: TppReport;
    Function FiltraRegistrosManual: TFrResult;
  public
    { Public declarations }
    CmSql: TCmSqlWzd;
    procedure MontaArvoreRelatorio;    
  end;

var
  FrmDesenhoOutLook: TFrmDesenhoOutLook;

implementation

Uses DBaseDados, uDataBase, fPreview, uMensErro, FConsultaManual,
     FTelaAut, uSistema, uEtiquetaCm, fAguarde, UModulo;

{$R *.DFM}

procedure TFrmDesenhoOutLook.MontaArvoreRelatorio;
Var
    SOldNome, SOldGrupo: String;
    TreePai, TreeFilho, TreeGrupo: TTreeNode;
Begin
  Try
    frmAguarde.Min := 0;
    frmAguarde.Max := 1;
    frmAguarde.Mostra('Abrindo Consulta de Relatórios');

    FazQuery(DtmBaseDados.Qry,'Select R.IdReports, R.OrigemCm, M.NomeModulo, R.Name, G.Descricao ' +
                   'From REPORTS R, Modulo M, GRUPORELATORIO G ' +
                   'Where (R.FormEventos is null) And (R.IdModulo = M.IdModulo) And ' +
                   '(R.IdGrupoRelatorio = G.IdGrupoRelatorio) and (R.OrigemCmGr = G.OrigemCmGr) ' +
                   'Order By M.NomeModulo, G.Descricao, R.Name');

    frmAguarde.Next;

    frmAguarde.Min := 0;
    frmAguarde.Max := DtmBaseDados.Qry.RecordCount;
    frmAguarde.Mostra('Montando Árvore de Relatórios');

    sOldNome := '';
    sOldGrupo := '';
    TreePai := nil;
    TreeGrupo := nil;

    TreeReports.Items.Clear;
    ListaReports.Clear;

    While Not DtmBaseDados.Qry.Eof Do
    Begin
       frmAguarde.Next;
       If SoldNome <> DtmBaseDados.Qry.FieldByName('NOMEMODULO').AsString Then
       Begin
        TreePai := TreeReports.Items.Add(nil,DtmBaseDados.Qry.FieldByName('NOMEMODULO').AsString);
        TreePai.ImageIndex := 0;
        TreePai.SelectedIndex := 0;
        ListaReports.Add('0/' + DtmBaseDados.Qry.FieldByName('IdReports').AsString + '-' +
                         DtmBaseDados.Qry.FieldByName('OrigemCm').AsString);

        sOldGrupo := '';
       End;

       If SoldGrupo <> DtmBaseDados.Qry.FieldByName('DESCRICAO').AsString Then
       Begin
        TreeGrupo := TreeReports.Items.AddChild(TreePai,DtmBaseDados.Qry.FieldByName('DESCRICAO').AsString);
        TreeGrupo.ImageIndex := 3;
        TreeGrupo.SelectedIndex := 3;
        ListaReports.Add('3/' +DtmBaseDados.Qry.FieldByName('IdReports').AsString + '-' +
                         DtmBaseDados.Qry.FieldByName('OrigemCm').AsString);
       End;


       TreeFilho := TreeReports.Items.AddChild(TreeGrupo,DtmBaseDados.Qry.FieldByName('NAME').AsString);
       TreeFilho.ImageIndex := 1;
       TreeFilho.SelectedIndex := 2;
       ListaReports.Add('1/' + DtmBaseDados.Qry.FieldByName('IdReports').AsString + '-' +
                         DtmBaseDados.Qry.FieldByName('OrigemCm').AsString);


       SOldNome := DtmBaseDados.Qry.FieldByName('NOMEMODULO').AsString;
       sOldGrupo := DtmBaseDados.Qry.FieldByName('DESCRICAO').AsString;
       DtmBaseDados.Qry.Next;
    End;
    DtmBaseDados.Qry.Close;
  finally
    frmAguarde.Apaga;
  End;
end;

procedure TFrmDesenhoOutLook.FormCreate(Sender: TObject);
begin
  inherited;
  CmSql := TCmSqlWzd.Create;
  NtbReports.Height := 505;
  NtbReports.Width := 677;
  ListaReports := TStringLIst.Create;
  ArquivoSaida := TppArchiveDevice.Create(self);

  qryDataView.Sql.Add(Sistema.PrefixoServidor + 'DATAVIEW WHERE 1=2');
  If Not QryDadosReports.Prepared Then QryDadosReports.Prepare;
  If Not QryDadosConsulta.Prepared Then QryDadosConsulta.Prepare;
  LkReports.ActivePage := BtnConsultas;
end;

procedure TFrmDesenhoOutLook.FormDestroy(Sender: TObject);
begin
  CmSql.Free;
  ListaReports.Free;
  ArquivoSaida.Free;
  If QryDadosReports.Active Then QryDadosReports.Close;
  If QryDadosReports.Prepared Then QryDadosReports.UnPrepare;
  If QryDadosConsulta.Active Then QryDadosConsulta.Close;
  If QryDadosConsulta.Prepared Then QryDadosConsulta.UnPrepare;  
  inherited;
end;

procedure TFrmDesenhoOutLook.spbPreviewWidthClick(Sender: TObject);
begin
  inherited;
  ChangeZoom := False;
  ppViewer1.ZoomSetting := zsPageWidth;
  SpinEdit1.Text := IntToStr(ppViewer1.CalculatedZoom);
  ChangeZoom := True;
end;

procedure TFrmDesenhoOutLook.spbPreview100PercentClick(Sender: TObject);
begin
  inherited;
  ChangeZoom := False;
  ppViewer1.ZoomSetting := zs100Percent;
  SpinEdit1.Text := IntToStr(ppViewer1.CalculatedZoom);
  ChangeZoom := True;
end;

procedure TFrmDesenhoOutLook.spbPreviewWholeClick(Sender: TObject);
begin
  inherited;
  ChangeZoom := False;
  ppViewer1.ZoomSetting := zsWholePage;
  SpinEdit1.Text := IntToStr(ppViewer1.CalculatedZoom);
  ChangeZoom := True;
end;

procedure TFrmDesenhoOutLook.spbPreviewPrintClick(Sender: TObject);
begin
  inherited;
  ppViewer1.Print;
end;

procedure TFrmDesenhoOutLook.bbtnAbrirClick(Sender: TObject);
begin
  inherited;
  if opnReport.Execute then
     TfrmPreview.CreatePreview(Self, opnReport.FileName, opnReport.FileName );
end;

procedure TFrmDesenhoOutLook.bbtnSalvarClick(Sender: TObject);
Var
   sExtencao, sDeviceTipe: string;
begin
     inherited;
     if svReport.Execute then
     begin
          try
            Screen.Cursor := crHourGlass ;

            sExtencao := Copy(svReport.FileName,Length(svReport.FileName)-2,3);
            sDeviceTipe := '';

            If sExtencao = 'Css' Then
               sDeviceTipe := 'CSSFile'
            Else
            If sExtencao = 'Htm' Then
               sDeviceTipe := 'HTMLFile'
            Else
            If sExtencao = 'Rtf' Then
               sDeviceTipe := 'RTFFile'
            Else
            If sExtencao = 'Xls' Then
               sDeviceTipe := 'ExcelFile'
            Else
            If sExtencao = 'Wk1' Then
               sDeviceTipe := 'LotusFile'
            Else
            If sExtencao = 'Wq1' Then
               sDeviceTipe := 'QuattroFile'
            Else
            If (sExtencao = 'Jpg') Or (sExtencao = 'Bmp') Then
                sDeviceTipe := 'GraphicFile';

            If sDeviceTipe = '' Then
            Begin
               ArquivoSaida.FileName := svReport.FileName;
               ArquivoSaida.Publisher := ppViewer1.Report.Publisher ;
               ppViewer1.Report.ResetDevices;
               ppViewer1.Report.PrintToDevices;
               ArquivoSaida.Publisher := nil ;
            End
            Else
            Begin
              ppViewer1.Report.TextFileName := svReport.FileName;
              ppViewer1.Report.ResetDevices;
              ppViewer1.Report.PrintToDevices;
            End;
          finally
             Screen.Cursor := crDefault ;
          end;
     end;
end;

procedure TFrmDesenhoOutLook.SpinEdit1Change(Sender: TObject);
begin
  inherited;
  If Not ChangeZoom Then Exit;
  ppViewer1.ZoomPercentage := StrToINt(SpinEdit1.Text);
end;

procedure TFrmDesenhoOutLook.SpBrnFirstPageClick(Sender: TObject);
begin
  inherited;
  ppViewer1.FirstPage;
end;

procedure TFrmDesenhoOutLook.SpBtnPriorPageClick(Sender: TObject);
begin
  inherited;
  ppViewer1.PriorPage;
end;

procedure TFrmDesenhoOutLook.SpBtnNextPageClick(Sender: TObject);
begin
  inherited;
  ppViewer1.NextPage;
end;

procedure TFrmDesenhoOutLook.SpBtnLastPageClick(Sender: TObject);
begin
  inherited;
  ppViewer1.LastPage;
end;

procedure TFrmDesenhoOutLook.ppViewer1PageChange(Sender: TObject);
begin
  inherited;
  If not SemRelatorio Then
  begin
       LblPreviewPage.Caption := 'Pág. ' + IntToStr((ppViewer1.Report as TppReport).AbsolutePageNo) + ' de ' +
       IntToStr((ppViewer1.Report as TppReport).AbsolutePageCount);
       ChangeZoom := False;
       SpinEdit1.Text := IntToStr(ppViewer1.CalculatedZoom);
       ChangeZoom := True;
  end;
end;

procedure TFrmDesenhoOutLook.ppViewer1PrintStateChange(Sender: TObject);
var
  lPosition: TPoint;
begin
  inherited;

  if ppViewer1.Busy then
     ppViewer1.Cursor := crHourGlass
  else
      ppViewer1.Cursor := crDefault;

  GetCursorPos(lPosition);
  SetCursorPos(lPosition.X, lPosition.Y);
end;

procedure TFrmDesenhoOutLook.TreeReportsChange(Sender: TObject;
  Node: TTreeNode);
Var
 sAux: String;
 iIdReport, iOrigemCM: Integer;
begin
  inherited;
  If (TreeReports.Selected <> Nil) Then
  Begin
    If Node.ImageIndex = 1 Then
    Begin
       sAux := ListaReports[Node.AbsoluteIndex];
       sAux := Copy(sAux,3,length(sAux));
       iIdReport := StrToInt(Copy(sAux,1,Pos('-',sAux)-1));
       iOrigemCM := StrToInt(Copy(sAux,Pos('-',sAux)+1,Length(sAux)));
       If Not QryDadosReports.Prepared Then QryDadosReports.Prepare;
       QryDadosReports.Close;
       QryDadosReports.Params[0].AsInteger := iIdReport;
       QryDadosReports.Params[1].AsInteger := iOrigemCM;
       QryDadosReports.Open;
    End;
  End;
end;

Function TFrmDesenhoOutLook.FiltraRegistrosManual: TFrResult;
Begin
  Result := FrError;
  if QryDadosReports.FieldByName('flgFiltroManual').AsString = 'S' then
    With TFrmfiltrasql.Create(Self) Do
       Try
         (DsSql.DataSet As TwwQuery).Filtered := False;
         (DsSql.DataSet As TwwQuery).FilterOptions := [];
         (DsSql.DataSet As TwwQuery).Filter := '';

         CdsOrigem := (DsSql.DataSet As TClientDataset);

         Case ShowModal of
           MrOk:    Result := FrFiltrado;
           MrAbort: Result := FrError;
         Else
           Result := FrFull;
         End;
       Finally
         If Result = FrError Then
         Begin
           If (DsSql.DataSet As TwwQuery).Active Then (DsSql.DataSet As TwwQuery).Close;
           (DsSql.DataSet As TwwQuery).Filtered := False;
           (DsSql.DataSet As TwwQuery).FilterOptions := [];
           (DsSql.DataSet As TwwQuery).Filter := '';
         End;

         Free;
       End;
end;


procedure TFrmDesenhoOutLook.fcOutlookBar1OutlookList1Items3Click(
  OutlookList: TfcCustomOutlookList; Item: TfcOutlookListItem);
begin
  inherited;
  CmSql.DataDic.Executar;
end;

procedure TFrmDesenhoOutLook.fcOutlookBar1OutlookList1Items2Click(
  OutlookList: TfcCustomOutlookList; Item: TfcOutlookListItem);
begin
  inherited;
  Try
    If Not QryDadosConsulta.IsEmpty Then
    Begin
       Screen.Cursor := CrHourGlass;
       If Not QryDadosConsulta.FieldByName('TEMPLATE').IsNull Then
          If FazQuery(Qry,QryDadosConsulta.FieldByName('TEMPLATE').AsString) Then
             NtbReports.PageIndex := 3
          Else
             MsgDlg('A Consulta Não retornou dados','Atenção',MtInformation,[MbOk],0);          
    End;
  Finally
    Screen.Cursor := CrDefault;
  End;
end;

procedure TFrmDesenhoOutLook.fcOutlookBar1OutlookList1Items1Click(
  OutlookList: TfcCustomOutlookList; Item: TfcOutlookListItem);
begin
  inherited;
  If NtbReports.PageIndex <> 1 Then NtbReports.PageIndex := 1;

  If MsConsulta.Executar = MrOk Then
  Begin
     QryDadosConsulta.Close;
     If Not QryDadosConsulta.Prepared Then QryDadosConsulta.Prepare;
     QryDadosConsulta.Params[0].AsInteger := StrToInt(MsConsulta.ValoresChave[0]);
     QryDadosConsulta.Params[1].AsInteger := StrToInt(MsConsulta.ValoresChave[1]);
     QryDadosConsulta.Open;
  End;
end;

procedure TFrmDesenhoOutLook.fcOutlookBar1OutlookList1Items0Click(
  OutlookList: TfcCustomOutlookList; Item: TfcOutlookListItem);
begin
  inherited;
  If QryDadosConsulta.Active Then QryDadosConsulta.Close;
  AbrirFormModal(FrmConsultaManual,TFrmConsultaManual);
end;

procedure TFrmDesenhoOutLook.BtnConsultasClick(
  Sender: TObject);
begin
  inherited;
  If LkReports.ActivePage = BtnRelatorios Then
  Begin
     If TreeReports.Items.Count = 0 Then MontaArvoreRelatorio;
     NtbReports.PageIndex := 0 // Relatorios
  End
  Else
    If LkReports.ActivePage =  BtnConsultas Then
       NtbReports.PageIndex := 1 //Consulta;
end;

procedure TFrmDesenhoOutLook.fcOutlookBar1OutlookList2Items2Click(
  OutlookList: TfcCustomOutlookList; Item: TfcOutlookListItem);
Var
  aRptMemoryStream :TBlobStream;
begin
  inherited;
  with QryDadosReports do
  begin
    If IsEmpty Then Exit;

    with RptCM do
    begin
        ResetDevices;
        CloseDataPipelines;
        If Qry.Active Then Qry.Close;

        If ((DsSql.DataSet as TwwQuery).Active) Then (DsSql.DataSet as TwwQuery).Close;
        DsSql.DataSet := Qry;
        (DsSql.DataSet as TwwQuery).Sql.Clear;
        (DsSql.DataSet as TwwQuery).Sql.Text := FieldByName('DATAVIEWTEMPLATE').AsString;

        If (FiltraRegistrosManual = FrError) Then Exit;

        PpSql.DataSource := DsSql;
        aRptMemoryStream := TBlobStream.Create(QryDadosReportsREPORTTEMPLATE, bmRead);
        Try
           aRptMemoryStream.Position := 0;
           Template.LoadFromStream(aRptMemoryStream);
           aRptMemoryStream.Destroy;
        Except
           aRptMemoryStream.Destroy;
        End;

        Datapipeline := PpSql;
    end;
  end;

  ppViewer1.Report := RptCM;
  ppViewer1.Report.PrintToDevices;
  ppViewer1.LastPage;
  ppViewer1.FirstPage;

  NtbReports.PageIndex := 4;
end;

procedure TFrmDesenhoOutLook.fcOutlookBar1OutlookList2Items1Click(
  OutlookList: TfcCustomOutlookList; Item: TfcOutlookListItem);
Var
  sAux: String;
begin
  inherited;
  If NtbReports.PageIndex <> 0 Then NtbReports.PageIndex := 0;
  If MsRelat.Executar = MrOk Then
  Begin
     TreeReports.FullCollapse;
     sAux := '1/' + MsRelat.ValoresChave[0] + '-' + MsRelat.ValoresChave[1];
     TreeReports.Items.Item[ListaReports.IndexOf(sAux)].Selected := True;
     TreeReportsChange(Self,TreeReports.Selected);
  End;
end;

procedure TFrmDesenhoOutLook.fcOutlookBar1OutlookList2Items0Click(
  OutlookList: TfcCustomOutlookList; Item: TfcOutlookListItem);
begin
  inherited;
  Modulo.CadastraReports(trRelatorio);
  NtbReports.ActivePage := 'Relatorio';
end;

procedure TFrmDesenhoOutLook.fcOutlookBar1OutlookList3Items1Click(
  OutlookList: TfcCustomOutlookList; Item: TfcOutlookListItem);
begin
  inherited;
  CmSql.ExportWzd.Executar;
end;

procedure TFrmDesenhoOutLook.fcOutlookBar1OutlookList3Items0Click(
  OutlookList: TfcCustomOutlookList; Item: TfcOutlookListItem);
begin
  inherited;
  If CmSql.Executar Then
  Begin
    Try
     If Not qryDataView.Active Then qryDataView.Open;

     qryDataView.Append;
     qryDataView.FieldByName('IDDATAVIEW').AsFloat  := LeUltRegistro(nil,'DATAVIEW');
     qryDataView.FieldByName('NAME').AsString        := CmSql.NomeSql;
     qryDataView.FieldByName('DESCRIPTION').AsString := CmSql.DescSql.Text;
     qryDataView.FieldByName('TEMPLATE').AsString    := CmSql.Sql.Text;
     qryDataView.FieldByName('CLASSNAME').AsString    := 'TDvQueryWzd';
     qryDataView.Post;

     QryDadosConsulta.Close;
     If Not QryDadosConsulta.Prepared Then QryDadosConsulta.Prepare;
     QryDadosConsulta.Params[0].AsInteger := qryDataView.FieldByName('IDDATAVIEW').AsInteger;
     QryDadosConsulta.Params[1].AsInteger := 0;
     qryDataView.Close;
     QryDadosConsulta.Open;
    Except
     qryDataView.Cancel;
     qryDataView.Close;
     Raise;
    End;
  End;
end;

procedure TFrmDesenhoOutLook.fcOutlookBar1OutlookList4Items1Click(
  OutlookList: TfcCustomOutlookList; Item: TfcOutlookListItem);
begin
  inherited;
  EtiquetaCm.AbrirFormImpressao;
end;

procedure TFrmDesenhoOutLook.fcOutlookBar1OutlookList4Items0Click(
  OutlookList: TfcCustomOutlookList; Item: TfcOutlookListItem);
begin
  inherited;
  EtiquetaCm.AbrirFormConfig;
end;

procedure TFrmDesenhoOutLook.OutRelatoriosItems3Click(
  OutlookList: TfcCustomOutlookList; Item: TfcOutlookListItem);
begin
  inherited;
  Modulo.CadastraReports(TrGrafico);
end;

end.


