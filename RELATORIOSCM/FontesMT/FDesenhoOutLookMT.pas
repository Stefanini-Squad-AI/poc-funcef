{-------------------------------------------------------------------------------
Desenvolvedor: Wylliam Leite da Silva
Data.........: 12/02/2015
SOL / PPM....: 248183 / 667246
Alteração....: Rotina de geração de relatório Boletos - Acompanhamento, foi
               alterado o tipo string para String Lista para comportar o select
               inteiro sem ser truncado
-------------------------------------------------------------------------------}
unit FDesenhoOutLookMT;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  FPAI, Spin, Buttons, TB97Tlbr, TB97Ctls, TB97, Wwdbigrd, Wwdbgrid,
  ppViewr, ExtCtrls, Grids, DBGrids, Mask, wwdbedit, ComCtrls, StdCtrls,
  DBCtrls, fcOutlookList, fcButton, fcImgBtn, fcShapeBtn, fcClearPanel,
  fcButtonGroup, fcOutlookBar, Db, Wwdatsrc, DBTables, Wwquery, ppBands,
  ppCache, ppClass, ppProd, ppReport, ppComm, ppRelatv, ppDB, ppDBPipe,
  ppDBBDE, ImgList, MontaSelect, IvDictio, IvMulti, IvEMulti, DBClient,
  uCtrlDataview, uCmSqlParams, ppFilDev, fFiltraSql, CmSqlWzd, uModulo,
  uCtrlReportsRelCM, ppTypes;

type
  TTipoReport = ( trQryManual, trDataModulo );

  TFrmDesenhoOutLook = class(TfrmPai)
    MsRelat: TMontaSelect;
    MsConsulta: TMontaSelect;
    svReport: TSaveDialog;
    opnReport: TOpenDialog;
    ImlReports: TImageList;
    ImlWork: TImageList;
    PpSql: TppBDEPipeline;
    dpDataView: TppBDEPipeline;
    RptCM: TppReport;
    ppHeaderBand1: TppHeaderBand;
    ppDetailBand1: TppDetailBand;
    ppFooterBand1: TppFooterBand;
    DsGrid: TwwDataSource;
    DsDadosConsulta: TwwDataSource;
    DsSql: TwwDataSource;
    LkReports: TfcOutlookBar;
    BtnConsultas: TfcShapeBtn;
    BtnRelatorios: TfcShapeBtn;
    BtnAssistentes: TfcShapeBtn;
    BtnEtiquetas: TfcShapeBtn;
    OutConsultas: TfcOutlookList;
    OutRelatorios: TfcOutlookList;
    OutAssistentes: TfcOutlookList;
    OutEtiquetas: TfcOutlookList;
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
    TreeReports: TTreeView;
    Nome: TLabel;
    LblDescConsulta: TLabel;
    LblMemConsulta: TLabel;
    EditNome: TwwDBEdit;
    DBMemo2: TDBMemo;
    DBMemo3: TDBMemo;
    GridSql: TDBGrid;
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
    CdsDadosConsulta: TClientDataSet;
    CdsDadosReports: TClientDataSet;
    CdsDataview: TClientDataSet;
    Cds: TClientDataSet;
    SqlParDadosReports: TCMSqlParams;
    SqlPar: TCMSqlParams;
    SqlParDadosConsulta: TCMSqlParams;
    DsDadosReports: TwwDataSource;
    DBCheckBox1: TDBCheckBox;
    procedure FormCreate(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
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
    procedure OutRelatoriosItems3Click(OutlookList: TfcCustomOutlookList;
      Item: TfcOutlookListItem);
    procedure OutRelatoriosItems2Click(OutlookList: TfcCustomOutlookList;
      Item: TfcOutlookListItem);
    procedure OutRelatoriosItems1Click(OutlookList: TfcCustomOutlookList;
      Item: TfcOutlookListItem);
    procedure OutRelatoriosItems0Click(OutlookList: TfcCustomOutlookList;
      Item: TfcOutlookListItem);
    procedure BtnConsultasClick(Sender: TObject);
    procedure OutConsultasItems0Click(OutlookList: TfcCustomOutlookList;
      Item: TfcOutlookListItem);
    procedure OutConsultasItems1Click(OutlookList: TfcCustomOutlookList;
      Item: TfcOutlookListItem);
    procedure OutConsultasItems2Click(OutlookList: TfcCustomOutlookList;
      Item: TfcOutlookListItem);
    procedure OutConsultasItems3Click(OutlookList: TfcCustomOutlookList;
      Item: TfcOutlookListItem);
    procedure OutAssistentesItems0Click(OutlookList: TfcCustomOutlookList;
      Item: TfcOutlookListItem);
    procedure OutAssistentesItems1Click(OutlookList: TfcCustomOutlookList;
      Item: TfcOutlookListItem);
    procedure OutEtiquetasItems0Click(OutlookList: TfcCustomOutlookList;
      Item: TfcOutlookListItem);
    procedure OutEtiquetasItems1Click(OutlookList: TfcCustomOutlookList;
      Item: TfcOutlookListItem);
  private
    { Private declarations }
    ChangeZoom, SemRelatorio: Boolean;
    ListaReports: TStringList;
    ArquivoSaida: TppArchiveDevice;
    Function FiltraRegistrosManual: TFrResult;
  public
    { Public declarations }
    CmSql: TCmSqlWzd;
    Relatorio: TCtrlReportsRelCM;
    Dataview: TCtrlDataview;
    procedure MontaArvoreRelatorio;
  end;

var
  FrmDesenhoOutLook: TFrmDesenhoOutLook;

implementation

uses DBaseDados, uSistema, uMensErro, fAguarde, fPreview, uEtiquetaCm, FTelaAut,
     FConsultaManualMT;

{$R *.DFM}

Function TFrmDesenhoOutLook.FiltraRegistrosManual: TFrResult;
Begin
  Result := FrError;

  If CdsDadosReports.FieldByName( 'FlgFiltroManual' ).AsString = 'S' then
     With TFrmFiltraSql.Create( Self ) Do
          Try
             If ( DsSql.DataSet As TClientDataset ).Active Then
                ( DsSql.DataSet As TClientDataset ).Close;

             ( DsSql.DataSet As TClientDataset ).Filtered := False;
             ( DsSql.DataSet As TClientDataset ).FilterOptions := [];
             ( DsSql.DataSet As TClientDataset ).Filter := '';
             SQLOrigem.Sql.Assign( SqlPar.Sql );

             If ShowModal = MrOk Then Begin
                If ( DsSql.DataSet As TClientDataset ).Active Then
                   ( DsSql.DataSet As TClientDataset ).Close;

                If bFiltered Then Begin
                   ( DsSql.DataSet As TClientDataset ).Filter   := sCondicoes;
                   ( DsSql.DataSet As TClientDataset ).Filtered := True;
                End;

                SqlPar.SQL.Assign( SQLOrigem.SQL );
                Result := FrFiltrado;
             End Else
                Result := FrError;
          Finally
             If Result = FrError Then Begin
                If ( DsSql.DataSet As TClientDataset ).Active Then
                   ( DsSql.DataSet As TClientDataset ).Close;

                ( DsSql.DataSet As TClientDataset ).Filtered := False;
                ( DsSql.DataSet As TClientDataset ).FilterOptions := [];
                ( DsSql.DataSet As TClientDataset ).Filter := '';
             End;

             Free;
          End;
end;

procedure TFrmDesenhoOutLook.MontaArvoreRelatorio;
Var
  TreePai, TreeFilho, TreeGrupo: TTreeNode;
  SOldNome, SOldGrupo: String;
Begin
  Try
     frmAguarde.Min := 0;
     frmAguarde.Max := 1;
     frmAguarde.Mostra( 'Abrindo Consulta de Relatórios...' );
     SqlPar.Open;
     frmAguarde.Next;

     frmAguarde.Min := 0;
     frmAguarde.Max := Cds.RecordCount;
     frmAguarde.Mostra( 'Montando Árvore de Relatórios...') ;

     sOldNome  := '';
     sOldGrupo := '';
     TreePai   := nil;
     TreeGrupo := nil;

     TreeReports.Items.Clear;
     ListaReports.Clear;

     While Not Cds.Eof Do Begin
           frmAguarde.Next;

           If SoldNome <> Cds.FieldByName( 'NOMEMODULO' ).AsString Then Begin
              TreePai := TreeReports.Items.Add( nil, Cds.FieldByName( 'NOMEMODULO' ).AsString );
              TreePai.ImageIndex    := 0;
              TreePai.SelectedIndex := 0;
              ListaReports.Add( '0/' + Cds.FieldByName( 'IdReports' ).AsString + '-' +
                                Cds.FieldByName('OrigemCm').AsString );
              sOldGrupo := '';
           End;

           If SoldGrupo <> Cds.FieldByName( 'DESCRICAO' ).AsString Then Begin
              TreeGrupo := TreeReports.Items.AddChild( TreePai, Cds.FieldByName( 'DESCRICAO' ).AsString );
              TreeGrupo.ImageIndex    := 3;
              TreeGrupo.SelectedIndex := 3;
              ListaReports.Add( '3/' + Cds.FieldByName( 'IdReports' ).AsString + '-' +
                                Cds.FieldByName( 'OrigemCm' ).AsString );
           End;

           TreeFilho := TreeReports.Items.AddChild( TreeGrupo, Cds.FieldByName( 'NAME' ).AsString );
           TreeFilho.ImageIndex    := 1;
           TreeFilho.SelectedIndex := 2;
           ListaReports.Add( '1/' + Cds.FieldByName( 'IdReports' ).AsString + '-' +
                             Cds.FieldByName( 'OrigemCm' ).AsString );

           SOldNome  := Cds.FieldByName( 'NOMEMODULO' ).AsString;
           sOldGrupo := Cds.FieldByName( 'DESCRICAO' ).AsString;
           Cds.Next;
     End;

     Cds.Close;
  Finally
     frmAguarde.Apaga;
  End;
end;

procedure TFrmDesenhoOutLook.FormCreate(Sender: TObject);
begin
  inherited;
  CmSql := TCmSqlWzd.Create;
  NtbReports.Height := 505;
  NtbReports.Width  := 677;
  NtbReports.PageIndex := 0;
  ListaReports := TStringLIst.Create;
  ArquivoSaida := TppArchiveDevice.Create( self );

  Relatorio := TCtrlReportsRelCM.Create;
  Relatorio.Initialize( DtmBaseDados.dbBaseDados, True, Sistema.ConnectionType,
                        Sistema.ConnectionSide, Sistema.AppRemoteServer, True );

  Dataview := TCtrlDataview.Create;
  Dataview.Initialize( DtmBaseDados.dbBaseDados, True, Sistema.ConnectionType,
                       Sistema.ConnectionSide, Sistema.AppRemoteServer, True );

  Dataview.Cds     := CdsDataview;
  CdsDataview.Data := Dataview.ListaDataview( -1 );
  LkReports.ActivePage := BtnConsultas;
end;

procedure TFrmDesenhoOutLook.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
  If CdsDadosReports.Active Then
     CdsDadosReports.Close;

  If CdsDadosConsulta.Active Then
     CdsDadosConsulta.Close;

  CmSql.Free;
  ListaReports.Free;
  ArquivoSaida.Free;
  Dataview.Free;
  Relatorio.Free;

  inherited;
end;

procedure TFrmDesenhoOutLook.spbPreviewWidthClick(Sender: TObject);
begin
  inherited;
  ChangeZoom := False;
  ppViewer1.ZoomSetting := zsPageWidth;
  SpinEdit1.Text := IntToStr( ppViewer1.CalculatedZoom );
  ChangeZoom := True;
end;

procedure TFrmDesenhoOutLook.spbPreview100PercentClick(Sender: TObject);
begin
  inherited;
  ChangeZoom := False;
  ppViewer1.ZoomSetting := zs100Percent;
  SpinEdit1.Text := IntToStr( ppViewer1.CalculatedZoom );
  ChangeZoom := True;
end;

procedure TFrmDesenhoOutLook.spbPreviewWholeClick(Sender: TObject);
begin
  inherited;
  ChangeZoom := False;
  ppViewer1.ZoomSetting := zsWholePage;
  SpinEdit1.Text := IntToStr( ppViewer1.CalculatedZoom );
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
  If opnReport.Execute then
     TfrmPreview.CreatePreview( Self, opnReport.FileName, opnReport.FileName );
end;

procedure TFrmDesenhoOutLook.bbtnSalvarClick(Sender: TObject);
Var
  sExtencao, sDeviceType: string;
begin
  inherited;
  If svReport.Execute Then Begin
     Try
        Screen.Cursor := crHourGlass;
        sExtencao     := UpperCase( Copy( svReport.FileName, Length( svReport.FileName ) - 2, 3 ) );
        sDeviceType   := '';

        If sExtencao = 'CSS' Then
           sDeviceType := 'CSSFile'
        Else
        If sExtencao = 'HTM' Then
           sDeviceType := 'HTMLFile'
        Else
        If sExtencao = 'RTF' Then
           sDeviceType := 'RTFFile'
        Else
        If sExtencao = 'XLS' Then
           sDeviceType := 'ExcelFile'
        Else
        If sExtencao = 'WK1' Then
           sDeviceType := 'LotusFile'
        Else
        If sExtencao = 'WQ1' Then
           sDeviceType := 'QuattroFile'
        Else
        If ( sExtencao = 'JPG' ) Or ( sExtencao = 'BMP' ) Then
           sDeviceType := 'GraphicFile';

        If sDeviceType = '' Then Begin
           ArquivoSaida.FileName  := svReport.FileName;
           ArquivoSaida.Publisher := ppViewer1.Report.Publisher;
           ppViewer1.Report.ResetDevices;
           ppViewer1.Report.PrintToDevices;
           ArquivoSaida.Publisher := Nil;
        End Else Begin
           ppViewer1.Report.TextFileName := svReport.FileName;
           ppViewer1.Report.ResetDevices;
           ppViewer1.Report.PrintToDevices;
        End;
     Finally
        Screen.Cursor := crDefault;
     End;
  end;
end;

procedure TFrmDesenhoOutLook.SpinEdit1Change(Sender: TObject);
begin
  inherited;
  ppViewer1.ZoomPercentage := StrToInt( SpinEdit1.Text );
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

  If Not SemRelatorio Then Begin
     LblPreviewPage.Caption := 'Pág. ' + IntToStr( ( ppViewer1.Report as TppReport ).AbsolutePageNo ) + ' de ' +
                               IntToStr( ( ppViewer1.Report as TppReport ).AbsolutePageCount );
     ChangeZoom     := False;
     SpinEdit1.Text := IntToStr( ppViewer1.CalculatedZoom );
     ChangeZoom     := True;
  End;
end;

procedure TFrmDesenhoOutLook.ppViewer1PrintStateChange(Sender: TObject);
var
  lPosition: TPoint;
begin
  inherited;

  If ppViewer1.Busy Then
     ppViewer1.Cursor := crHourGlass
  Else
     ppViewer1.Cursor := crDefault;

  GetCursorPos( lPosition );
  SetCursorPos( lPosition.X, lPosition.Y );
end;

procedure TFrmDesenhoOutLook.TreeReportsChange(Sender: TObject;
  Node: TTreeNode);
Var
 iIdReport, iOrigemCM: Integer;
 sAux: String;
begin
  inherited;
  If TreeReports.Selected <> Nil Then Begin
     If Node.ImageIndex = 1 Then Begin
        sAux := ListaReports[ Node.AbsoluteIndex ];
        sAux := Copy( sAux, 3, length( sAux ) );
        iIdReport := StrToInt( Copy( sAux, 1, Pos( '-', sAux ) - 1 ) );
        iOrigemCM := StrToInt( Copy( sAux, Pos( '-', sAux ) + 1, Length( sAux ) ) );

        CdsDadosReports.Close;
        SqlParDadosReports.Prepare;
        SqlParDadosReports.ParamByName( 'pIdReports' ).AsInteger  := iIdReport;
        SqlParDadosReports.ParamByName( 'pIdOrigemCm' ).AsInteger := iOrigemCM;
        SqlParDadosReports.Open;
     End;
  End;
end;

procedure TFrmDesenhoOutLook.OutRelatoriosItems3Click(
  OutlookList: TfcCustomOutlookList; Item: TfcOutlookListItem);
begin
  inherited;
  Modulo.CadastraReports( TrGrafico );
end;


procedure TFrmDesenhoOutLook.OutRelatoriosItems2Click(
  OutlookList: TfcCustomOutlookList; Item: TfcOutlookListItem);
Var
  aRptMemoryStream: TMemoryStream;

  //-----------------Início--------------
  //Wylliam Silva -> Kintana: 667246 SOL: 248183
  //String list que recebe o campo Long Raw com o layout do
  //relatório de Boletos Acompanhamento

  //strAux: string;
  slLayoutRel: TStringList;
  //------------------Fim-----------------
begin
  inherited;
  With CdsDadosReports do begin
       If IsEmpty Then
          Exit;

       With RptCM Do Begin
            ResetDevices;
            CloseDataPipelines;

            If Cds.Active Then
               Cds.Close;

            If ( DsSql.DataSet as TClientDataset ).Active Then
               ( DsSql.DataSet as TClientDataset ).Close;

            DsSql.DataSet := Cds;


            // ----------------------------------Início--------------------------------
            // Passa o resultado da query do layout do relatório para uma string list
            // pois quando era passado para uma variavel do tipo string o valor do campo
            // long raw do oracle era truncado
            // Wylliam Silva -> PPM: 667246 SOL: 248183

            slLayoutRel := TStringList.Create;

            slLayoutRel.Assign(FieldByName('DATAVIEWTEMPLATE'));
            Relatorio.substituiValorParam(slLayoutRel);
            ( DsSql.DataSet as TClientDataset ).Data := Dataview.GetDataPacket( slLayoutRel );

            //strAux := FieldByName('DATAVIEWTEMPLATE').AsString;
            //Relatorio.substituiValorParam(strAux);
            //( DsSql.DataSet as TClientDataset ).Data := Dataview.GetDataPacket( strAux );
            // ---------------Fim Wylliam Silva -> PPM: 667246 SOL: 248183-------------

            If FiltraRegistrosManual <> FrFiltrado Then
               Exit;

            SqlPar.Open;
            aRptMemoryStream := TMemoryStream.Create;
            aRptMemoryStream.Clear;

            Try
               TBlobField( CdsDadosReports.FieldByName( 'REPORTTEMPLATE' ) ).SaveToStream( aRptMemoryStream );
               aRptMemoryStream.Position := 0;
               Template.LoadFromStream( aRptMemoryStream );
               aRptMemoryStream.Free
            Except
               aRptMemoryStream.Free
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

procedure TFrmDesenhoOutLook.OutRelatoriosItems1Click(
  OutlookList: TfcCustomOutlookList; Item: TfcOutlookListItem);
Var
  sAux: String;
begin
  inherited;
  If NtbReports.PageIndex <> 0 Then
     NtbReports.PageIndex := 0;

  If MsRelat.Executar = MrOk Then Begin
     TreeReports.FullCollapse;
     sAux := '1/' + MsRelat.ValoresChave[ 0 ] + '-' + MsRelat.ValoresChave[ 1 ];
     TreeReports.Items.Item[ ListaReports.IndexOf( sAux ) ].Selected := True;
     TreeReportsChange( Self, TreeReports.Selected );
  End;
end;

procedure TFrmDesenhoOutLook.OutRelatoriosItems0Click(
  OutlookList: TfcCustomOutlookList; Item: TfcOutlookListItem);
begin
  inherited;
  Modulo.CadastraReports( trRelatorio );
  NtbReports.ActivePage := 'Relatorio';
end;

procedure TFrmDesenhoOutLook.BtnConsultasClick(Sender: TObject);
begin
  inherited;
  If LkReports.ActivePage = BtnRelatorios Then Begin
     If TreeReports.Items.Count = 0 Then
        MontaArvoreRelatorio;

     NtbReports.PageIndex := 0 // Relatorios
  End Else
     If LkReports.ActivePage =  BtnConsultas Then
        NtbReports.PageIndex := 1 //Consulta;
end;

procedure TFrmDesenhoOutLook.OutConsultasItems0Click(
  OutlookList: TfcCustomOutlookList; Item: TfcOutlookListItem);
begin
  inherited;
  If CdsDadosConsulta.Active Then
     CdsDadosConsulta.Close;

  AbrirForm( FrmConsultaManual, TFrmConsultaManual, False );
end;

procedure TFrmDesenhoOutLook.OutConsultasItems1Click(
  OutlookList: TfcCustomOutlookList; Item: TfcOutlookListItem);
begin
  inherited;
  If NtbReports.PageIndex <> 1 Then
     NtbReports.PageIndex := 1;

  If MsConsulta.Executar = MrOk Then Begin
     CdsDadosConsulta.Close;
     SqlParDadosConsulta.Prepare;
     SqlParDadosConsulta.ParamByName( 'PIDDATAVIEW' ).AsInteger := StrToInt( MsConsulta.ValoresChave[ 0 ] );
     SqlParDadosConsulta.ParamByName( 'PORIGEMCMDV' ).AsInteger := StrToInt( MsConsulta.ValoresChave[ 1 ] );
     SqlParDadosConsulta.Open;
  End;
end;

procedure TFrmDesenhoOutLook.OutConsultasItems2Click(
  OutlookList: TfcCustomOutlookList; Item: TfcOutlookListItem);
begin
  inherited;
  Try
     If Not CdsDadosConsulta.IsEmpty Then Begin
        Screen.Cursor := CrHourGlass;

        If Not CdsDadosConsulta.FieldByName( 'TEMPLATE' ).IsNull Then
           Cds.Data := Dataview.GetDataPacket( CdsDadosConsulta.FieldByName( 'TEMPLATE' ).AsString );

           If Not Cds.IsEmpty Then
              NtbReports.PageIndex := 3
           Else
              MsgDlg( 'A Consulta não retornou dados', 'Atenção', MtInformation, [MbOk], 0 );
     End;
  Finally
     Screen.Cursor := CrDefault;
  End;
end;

procedure TFrmDesenhoOutLook.OutConsultasItems3Click(
  OutlookList: TfcCustomOutlookList; Item: TfcOutlookListItem);
begin
  inherited;
  CmSql.DataDic.Executar;
end;

procedure TFrmDesenhoOutLook.OutAssistentesItems0Click(
  OutlookList: TfcCustomOutlookList; Item: TfcOutlookListItem);
begin
  inherited;
  If CmSql.Executar Then Begin
     Try
        If Not CdsDataView.Active Then
           CdsDataView.Data := Dataview.ListaDataview( -1, -1 );
           
        CdsDataView.Append;
        CdsDataView.FieldByName( 'NAME' ).AsString        := CmSql.NomeSql;
        CdsDataView.FieldByName( 'DESCRIPTION' ).AsString := CmSql.DescSql.Text;
        CdsDataView.FieldByName( 'TEMPLATE' ).AsString    := CmSql.Sql.Text;
        CdsDataView.FieldByName( 'CLASSNAME' ).AsString   := 'TDvQueryWzd';
        CdsDataView.Post;

        DataView.Gravar;
        CdsDadosConsulta.Data := Dataview.ListaDataviewInserido();
     Except
        CdsDataView.Cancel;
        CdsDataView.Close;
        Raise;
     End;
  End;
end;

procedure TFrmDesenhoOutLook.OutAssistentesItems1Click(
  OutlookList: TfcCustomOutlookList; Item: TfcOutlookListItem);
begin
  inherited;
  CmSql.ExportWzd.Executar;
end;

procedure TFrmDesenhoOutLook.OutEtiquetasItems0Click(
  OutlookList: TfcCustomOutlookList; Item: TfcOutlookListItem);
begin
  inherited;
  EtiquetaCm.AbrirFormConfig;
end;

procedure TFrmDesenhoOutLook.OutEtiquetasItems1Click(
  OutlookList: TfcCustomOutlookList; Item: TfcOutlookListItem);
begin
  inherited;
  EtiquetaCm.AbrirFormImpressao;
end;

end.
