unit fMostraGraf;
// Data       : 07.08.2015
// Sol        : 148922/8841
// PPM        : 1628565
// Autor      : Jonas Otavio
// Rotina     : Botão Ajuda
// Descrição  : Confeccionar documentação do módulo de Empréstimo
//==============================================================================
//  Data      : 17/12/2012
//  Autor     : Higor Nayde Ferreira	
//  Rotina    : MontaArvoreRelatorio
//  Pendência : SOL 195642 Kintana 1869273
//  Descrição : Voltar Versão do SOL 143297.12044 pois o mesmo nao foi enviado no 
//				pacote extra
//==============================================================================
//  Data      : 17/10/2012
//  Autor     : Fernando Xavier
//  Rotina    : MontaArvoreRelatorio
//  Pendência : SOL 143297.12044 Kintana 1832792
//  Descrição : Alteração no order by adicionado o nome do relatorio na ordenação
//==============================================================================
//  Data      : 15/08/2012
//  Autor     : Thiago Melo
//  Rotina    : MontaArvoreRelatorio
//  Pendência : SOL 143297 Kintana 928391
//  Descrição : Foi adicionado condições para inclusão de grupo mestre no
//              MontaArvoreRelatorio
//==============================================================================
//  Data      : 15/09/2005
//  Autor     : Rodolpho da Silva
//  Rotina    : Diversas
//  Pendência : 5998
//  Descrição : Corrigir alguns bugs na tela
//==============================================================================


interface

uses
  Windows, FSairAjuda, Messages, SysUtils, Classes, Graphics, Controls, Forms,
  Dialogs, wwQuery, ppDBBDE, TB97, Buttons, Db, DBTables, ppReport, ExtCtrls,
  StdCtrls, Wwdatsrc, ppBands, ppProd, ppComm, ppCache, ppDB, ComCtrls,
  Spin, Grids, Wwdbigrd, Wwdbgrid, ppViewr, MAHlpBtn, dvDataVw, ppForms,
  uSistema, ppTypes, ppFilDev, uMensErro, TB97Tlbr, TB97Ctls,
  IvDictio, IvMulti, IvEMulti, FFiltraSql, fcTreeView, TeeProcs, TeEngine,
  Chart, DBChart, ImgList, uCmSqlParams, TeeStore, DBGrids, DBClient,
  uCMClientDataSet, Series, TeCanvas, uCtrlReportsRelCM;

  
type
  TfrmMostraGraf = class(TfrmSairAjuda)
    PnlPreview: TPanel;
    PnlRel: TPanel;
    MemHistorico: TMemo;
    Splitter1: TSplitter;
    Splitter2: TSplitter;
    pnlTree: TPanel;
    ImlReports: TImageList;
    TreeReports: TfcTreeView;
    BtnVisualizar: TBitBtn;
    BtnImprimir: TBitBtn;
    Dock973: TDock97;
    Toolbar972: TToolbar97;
    bbtnAbrir: TToolbarButton97;
    OpdGraf: TOpenDialog;
    SvdGraf: TSaveDialog;
    btSalvar: TToolbarButton97;
    ToolbarSep973: TToolbarSep97;
    ToolbarSep974: TToolbarSep97;
    CdsReport: TCMClientDataSet;
    _DadosGrafico: TCMClientDataSet;
    SqlReport: TCMSqlParams;
    SqlGrafico: TCMSqlParams;
    btMaisZoom: TToolbarButton97;
    btMenosZoom: TToolbarButton97;
    Timer: TTimer;
    ckAnimar: TCheckBox;
    ck3D: TCheckBox;
    Label1: TLabel;
    Label2: TLabel;
    procedure FormCreate(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure BtnVisualizarClick(Sender: TObject);
    procedure TreeReportsDblClick(TreeView: TfcCustomTreeView;
      Node: TfcTreeNode; Button: TMouseButton; Shift: TShiftState; X,
      Y: Integer);
    procedure TreeReportsChange(TreeView: TfcCustomTreeView;
      Node: TfcTreeNode);
    procedure BtnImprimirClick(Sender: TObject);
    procedure bbtnSalvarClick(Sender: TObject);
    procedure bbtnAbrirClick(Sender: TObject);
    procedure btMaisZoomClick(Sender: TObject);
    procedure btMenosZoomClick(Sender: TObject);
    procedure TimerTimer(Sender: TObject);
    procedure ckAnimarClick(Sender: TObject);
    procedure ck3DClick(Sender: TObject);
    procedure bbtnAjudaClick(Sender: TObject);
  private
    { Private declarations }
    MemoRodapeLocal : TStringList;
    bSomar          : boolean;
    CtrlReports     : TCtrlReportsRelCM;
    Grafico         : TDbChart;

    procedure MontaArvoreRelatorio;
    procedure CriaGrafico;
    Function  FiltraRegistrosManual: TFrResult;

    Procedure VisualizaGrafico;
    // Thiago Melo SOL 143297 Kintana 928391
    procedure InsereArvoreRecursiva (TreeReports: TfcTreeView; Pai : TfcTreeNode; idGrupoRelatorio : Double; idModulo: LongInt);
    //
  public
    { Public declarations }

  end;

var
  frmMostraGraf: TfrmMostraGraf;

implementation

uses FPreview, uString, dReports, uDataBase, DBaseDados,
     {teestore,}                     { <-- to load / save Charts }
     {EditChar, DBEditCh, EditPro,  }{ <-- to access the Editor Dialog }
     {ChartPro, }                    { <-- to support the Pro Series }
     TeePrevi,                     { <-- to print preview Charts }
     TeeAbout;


{$R *.DFM}

procedure TfrmMostraGraf.MontaArvoreRelatorio;
Var
  SOldNome, SOldGrupo: String;
  TreePai, TreeFilho, TreeGrupo: TfcTreeNode;

  qryGrupo, qryGrupos, qryAux : TwwQuery;
Begin
  FazQuery(DtmBaseDados.Qry,'Select R.IdReports, R.OrigemCm, M.NomeModulo, Decode(C.Descricao,null,R.Name,C.Descricao) as Name, G.Descricao ' +
                 'From Reports R, Modulo M, GrupoRelatorio G, ConfigReportsCM C ' +
                 'Where '+
                 ' ((R.IdModulo = ' + IntToStr(Sistema.IdModulo) + ') Or ' +
                 '  ((R.IdModulo = 2) And (R.IdDataView Is Not Null))) And ' +
                 ' (R.IdModulo = M.IdModulo) And ' +
                 ' (R.IdGrupoRelatorio = G.IdGrupoRelatorio(+)) And ' +
                 ' (C.IdReports(+) =  R.IdReports) And ' +
                 ' (C.OrigemCM(+) =  R.OrigemCM) And ' +
                 ' (R.OrigemCmGr = G.OrigemCmGr(+)) And (R.FLGTIPO = ''G'') ' +
                 'Order By M.NomeModulo, G.Descricao, R.Name');

  sOldNome := '';
  sOldGrupo := '';
  TreePai := nil;
  TreeGrupo := nil;

  TreeReports.Items.Clear;

// Thiago Melo SOL 143297 Kintana 928391
  qryGrupo              := TwwQuery.Create(Self);
  qryGrupo.DatabaseName := 'BaseDados';

  qryAux              := TwwQuery.Create(Self);
  qryAux.DatabaseName := 'BaseDados';

  try
    qryGrupo.Close;
    qryGrupo.Sql.Clear;

    qryGrupo.Sql.Add('Select M.NOMEMODULO');
    qryGrupo.Sql.Add('  From Reports R, Modulo M, GrupoRelatorio G, ConfigReportsCM C');
    qryGrupo.Sql.Add(' Where ((R.IdModulo = :IdModulo) Or');
    qryGrupo.Sql.Add('       ((R.IdModulo = 2) And (R.IdDataView Is Not Null)))');
    qryGrupo.Sql.Add('   And (R.IdModulo = M.IdModulo)');
    qryGrupo.Sql.Add('   And (R.IdGrupoRelatorio = G.IdGrupoRelatorio(+))');
    qryGrupo.Sql.Add('   And (C.IdReports(+) = R.IdReports)');
    qryGrupo.Sql.Add('   And (C.OrigemCM(+) = R.OrigemCM)');
    qryGrupo.Sql.Add('   And (R.OrigemCmGr = G.OrigemCmGr(+))');
    qryGrupo.Sql.Add('   And (R.FLGTIPO = ' + QuotedStr('G') + ')');
    qryGrupo.Sql.Add(' GROUP BY M.NOMEMODULO');
    qryGrupo.Sql.Add(' ORDER BY M.NOMEMODULO');

    qryGrupo.Params.Clear;
    qryGrupo.Params.CreateParam(ftInteger, 'IDMODULO', ptInput);
    qryGrupo.ParamByName('IDMODULO').AsInteger := Sistema.IdModulo;

    qryGrupo.Prepare;
    try
      qryGrupo.Open;
    except
      qryGrupo.Close;
      FreeAndNil(qryGrupo);
      Exit;
    end;

    while (not qryGrupo.Eof) do begin
      // Carregando Grupos
      TreePai := TreeReports.Items.Add(nil,qryGrupo.FieldByName('NOMEMODULO').AsString);
      TreePai.ImageIndex    := 0;
      TreePai.SelectedIndex := 0;

      qryGrupos              := TwwQuery.Create(Self);
      qryGrupos.DatabaseName := 'BaseDados';
      try
        qryGrupos.Close;
        qryGrupos.Sql.Clear;
        qryGrupos.Sql.Add('Select M.NOMEMODULO, G.Descricao');
        qryGrupos.Sql.Add(' From Reports R, Modulo M, GrupoRelatorio G, ConfigReportsCM C');
        qryGrupos.Sql.Add('Where ((R.IdModulo = :IdModulo) Or');
        qryGrupos.Sql.Add('      ((R.IdModulo = 2) And (R.IdDataView Is Not Null)))');
        qryGrupos.Sql.Add('  And (R.IdModulo = M.IdModulo)');
        qryGrupos.Sql.Add('  And (R.IdGrupoRelatorio = G.IdGrupoRelatorio(+))');
        qryGrupos.Sql.Add('  And (C.IdReports(+) = R.IdReports)');
        qryGrupos.Sql.Add('  And (C.OrigemCM(+) = R.OrigemCM)');
        qryGrupos.Sql.Add('  And (R.OrigemCmGr = G.OrigemCmGr(+))');
        qryGrupos.Sql.Add('  And (R.FLGTIPO = ' + QuotedStr('G') + ')');
        qryGrupos.Sql.Add('  AND G.IDGRUPOMESTRE = 0');
        qryGrupos.Sql.Add('GROUP BY M.NOMEMODULO, G.DESCRICAO');
        qryGrupos.Sql.Add('ORDER BY M.NOMEMODULO');

        qryGrupos.Params.Clear;
        qryGrupos.Params.CreateParam(ftInteger, 'IDMODULO', ptInput);
        qryGrupos.ParamByName('IDMODULO').AsInteger := Sistema.IdModulo;
        qryGrupos.Prepare;
        try
          qryGrupos.Open;
        except
          qryGrupos.Close;
          FreeAndNil(qryGrupos);
          Exit;
        end;

        if not qryGrupos.IsEmpty then begin
          while not qryGrupos.Eof do begin

            TreeGrupo := TreeReports.Items.AddChild(TreePai,qryGrupos.FieldByName('DESCRICAO').AsString);
            TreeGrupo.ImageIndex := 3;
            TreeGrupo.SelectedIndex := 3;

            qryAux.Close;
            qryAux.Sql.Clear;
            qryAux.Sql.Add('Select M.NOMEMODULO, G.Descricao, R.IdReports, R.OrigemCm, G.idgruporelatorio,');
            qryAux.Sql.Add('Decode(C.Descricao,null,R.Name,C.Descricao) as Name');
            qryAux.Sql.Add(' From Reports R, Modulo M, GrupoRelatorio G, ConfigReportsCM C');
            qryAux.Sql.Add('Where ((R.IdModulo = ' + IntToStr(Sistema.IdModulo) + ') Or');
            qryAux.Sql.Add('      ((R.IdModulo = 2) And (R.IdDataView Is Not Null)))');
            qryAux.Sql.Add('  And (R.IdModulo = M.IdModulo)');
            qryAux.Sql.Add('  And (R.IdGrupoRelatorio = G.IdGrupoRelatorio(+))');
            qryAux.Sql.Add('  And (C.IdReports(+) = R.IdReports)');
            qryAux.Sql.Add('  And (C.OrigemCM(+) = R.OrigemCM)');
            qryAux.Sql.Add('  And (R.OrigemCmGr = G.OrigemCmGr(+))');
            qryAux.Sql.Add('  And (R.FLGTIPO = ' + QuotedStr('G') + ')');
            qryAux.Sql.Add('  AND (M.NOMEMODULO = ' + QuotedStr(qryGrupos.FieldByName('NOMEMODULO').AsString) + ')');
            qryAux.Sql.Add('  AND (G.DESCRICAO  = ' + QuotedStr(qryGrupos.FieldByName('DESCRICAO').AsString)  + ')');
            qryAux.Sql.Add('  AND G.IDGRUPOMESTRE = 0');
            //qryAux.Sql.Add('ORDER BY M.NOMEMODULO');   // SOL 143297.12044 Kintana 1832792
            qryAux.Sql.Add('ORDER BY M.NOMEMODULO, R.Name'); // SOL 143297.12044 Kintana 1832792 // SOL 195642 Kintana 1869273

            try
              qryAux.Open;
            except
              qryAux.Close;
              FreeAndNil(qryAux);
              Exit;
            end;

            if not qryAux.IsEmpty then begin

              while not qryAux.Eof do begin

                TreeFilho := TreeReports.Items.AddChild(TreeGrupo,qryAux.FieldByName('NAME').AsString);
                TreeFilho.ImageIndex := 1;
                TreeFilho.SelectedIndex := 2;
                TreeFilho.StringData  := qryAux.FieldByName('IdReports').AsString;
                TreeFilho.StringData2 := qryAux.FieldByName('OrigemCm').AsString;

//                InsereArvoreRecursiva(TreeReports, TreeGrupo, qryAux.FieldByName('IDGRUPORELATORIO').AsFloat, Sistema.IdModulo);

                qryAux.Next;
              end;
            end;
            qryGrupos.Next;
          end;
          InsereArvoreRecursiva(TreeReports, TreeGrupo, qryAux.FieldByName('IDGRUPORELATORIO').AsFloat, Sistema.IdModulo);          
        end;
      finally
        qryGrupos.Close;
        FreeAndNil(qryGrupos);
      end;
      qryGrupo.Next;
    end;
  finally
    qryGrupo.Close;
    FreeAndNil(qryGrupo);

    qryAux.Close;
    FreeAndNil(qryAux);
  end;

// Thiago Melo SOL 143297 Kintana 928391


(*  While Not DtmBaseDados.Qry.Eof Do
  Begin
     If SoldNome <> DtmBaseDados.Qry.FieldByName('NOMEMODULO').AsString Then
     Begin
      TreePai := TreeReports.Items.Add(nil,DtmBaseDados.Qry.FieldByName('NOMEMODULO').AsString);
      TreePai.ImageIndex := 0;
      TreePai.SelectedIndex := 0;
      TreePai.StringData := DtmBaseDados.Qry.FieldByName('IdReports').AsString;
      TreePai.StringData2 := DtmBaseDados.Qry.FieldByName('OrigemCm').AsString;

      sOldGrupo := '';
     End;

     If SoldGrupo <> DtmBaseDados.Qry.FieldByName('DESCRICAO').AsString Then
     Begin
      TreeGrupo := TreeReports.Items.AddChild(TreePai,DtmBaseDados.Qry.FieldByName('DESCRICAO').AsString);
      TreeGrupo.ImageIndex := 3;
      TreeGrupo.SelectedIndex := 3;
      TreeGrupo.StringData := DtmBaseDados.Qry.FieldByName('IdReports').AsString;
      TreeGrupo.StringData2 := DtmBaseDados.Qry.FieldByName('OrigemCm').AsString;
     End;

     TreeFilho := TreeReports.Items.AddChild(TreeGrupo,DtmBaseDados.Qry.FieldByName('NAME').AsString);
     TreeFilho.ImageIndex := 1;
     TreeFilho.SelectedIndex := 2;
     TreeFilho.StringData := DtmBaseDados.Qry.FieldByName('IdReports').AsString;
     TreeFilho.StringData2 := DtmBaseDados.Qry.FieldByName('OrigemCm').AsString;

     SOldNome := DtmBaseDados.Qry.FieldByName('NOMEMODULO').AsString;
     sOldGrupo := DtmBaseDados.Qry.FieldByName('DESCRICAO').AsString;
     DtmBaseDados.Qry.Next;
  End;  *)

// Thiago Melo SOL 143297 Kintana 928391

  DtmBaseDados.Qry.Close;
end;

procedure TfrmMostraGraf.FormCreate(Sender: TObject);
begin
  inherited;
  MemoRodapeLocal := TStringList.Create;
  CtrlReports     := TCtrlReportsRelCM.Create;
  CtrlReports.Initialize( DtmBaseDados.dbBaseDados, True, Sistema.ConnectionType,
                          Sistema.ConnectionSide, Sistema.AppRemoteServer, True );
  MontaArvoreRelatorio;
  CriaGrafico;
end;

procedure TfrmMostraGraf.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
  FreeAndNil(MemoRodapeLocal);
  FreeAndNil(CtrlReports);
  FreeAndNil(Grafico);
  inherited;
  CdsReport.Close;
end;

Procedure TfrmMostraGraf.VisualizaGrafico;
Var
  I           : Integer;
  ChartStream : TStream;
  CdsAux      : TClientDataSet;

begin
  inherited;
  try
     If (Not CdsReport.FieldByName('REPORTTEMPLATE').IsNull) And
        (Not CdsReport.FieldByName('DATAVIEWTEMPLATE').IsNull) Then
     Begin
        _DadosGrafico.Close;
        SqlGrafico.SQL.Clear;
        SqlGrafico.SQL.Add(CdsReport.FieldByName('DATAVIEWTEMPLATE').AsString);
        CriaGrafico;

        If (FiltraRegistrosManual <> FrError) Then
        Begin
           SqlGrafico.Prepare;
           SqlGrafico.Open;
           CdsAux      := TClientDataSet.Create(nil);
           CdsAux.Data := CdsReport.Data;
           CdsAux.Edit;
           ChartStream := CdsAux.CreateBlobStream(CdsAux.FieldByName('REPORTTEMPLATE'),bmRead);
           CdsAux.Cancel;
           LoadChartFromStream(TCustomChart(Grafico),ChartStream);

           for i := 0 to (Grafico.SeriesCount - 1) do
           begin
              Grafico.Series[i].DataSource := _DadosGrafico;
              Grafico.RefreshDataSet(_DadosGrafico,Grafico.Series[i]);
           end;

           ck3D.Checked  := Grafico.View3D;
        End;
     End;

  finally
     FreeAndNil(ChartStream);
     FreeAndNil(CdsAux);
  end;
End;




procedure TfrmMostraGraf.BtnVisualizarClick(Sender: TObject);
begin
  inherited;
  If (TreeReports.Selected <> Nil) And (TreeReports.Selected.ImageIndex = 1) Then
     VisualizaGrafico;
end;




procedure TfrmMostraGraf.TreeReportsDblClick(TreeView: TfcCustomTreeView;
  Node: TfcTreeNode; Button: TMouseButton; Shift: TShiftState; X,
  Y: Integer);
begin
  inherited;
  if TreeReports.Items.Count <> 0 then
  begin
     If Node.ImageIndex = 1 Then  VisualizaGrafico;
  end;   
end;




procedure TfrmMostraGraf.TreeReportsChange(TreeView: TfcCustomTreeView;
  Node: TfcTreeNode);

begin
  inherited;
  If (Node <> Nil) And (Node.ImageIndex = 1) Then
  Begin
     CdsReport.Close;
     SqlReport.Prepare;
     SqlReport.Params[0].AsInteger := StrToInt(Node.Stringdata);
     SqlReport.Params[1].AsInteger := StrToInt(Node.Stringdata2);
     SqlReport.Open;

     MemHistorico.Lines.Clear;
     if Not CdsReport.IsEmpty then
     Begin
        MemHistorico.Lines.Add('Gráfico. Nº ' + Node.Stringdata + '\' + Node.Stringdata2);
        MemHistorico.Lines.Add(CdsReport.FieldByName('DESCRIPTION').AsString);
     End;
     BtnVisualizar.Enabled := true;
     BtnImprimir.Enabled := true;
  End
  else
  Begin
      BtnVisualizar.Enabled := false;
      BtnImprimir.Enabled := false;
  End;
end;




procedure TfrmMostraGraf.BtnImprimirClick(Sender: TObject);
begin
  inherited;
  ChartPreview(Self,Grafico);
end;




procedure TfrmMostraGraf.bbtnSalvarClick(Sender: TObject);
begin
  inherited;
  If SvdGraf.Execute Then
  Begin
     Case SvdGraf.FilterIndex of
     0: Grafico.SaveToBitmapFile(SvdGraf.FileName);
     1: Grafico.SaveToMetafile(SvdGraf.FileName)
     else
       SaveChartToFile(Grafico,SvdGraf.FileName);
     End;
  End;
end;




procedure TfrmMostraGraf.bbtnAbrirClick(Sender: TObject);
begin
  inherited;
  If OpdGraf.Execute Then
  Begin
     FreeAndNil(Grafico);
     CriaGrafico;
     LoadChartFromFile(TCustomChart(Grafico),OpdGraf.FileName);
  End;
end;




Function TfrmMostraGraf.FiltraRegistrosManual: TFrResult;
var
  FrmFiltraSql: TFrmFiltraSql;
  I : Integer; 
Begin

  Result := FrFull;

     Result := FrFull;
     if CdsReport.FieldByName('FLGFILTROMANUAL').AsString = 'S' then
       Try
        _DadosGrafico.Filtered      := False;
        _DadosGrafico.FilterOptions := [];
        _DadosGrafico.Filter        := '';

        Application.CreateForm(TFrmFiltraSql,FrmFiltraSql);
        FrmFiltraSql.SQLOrigem.Sql.Assign(SqlGrafico.SQL);
        FrmFiltraSql.bOrigemGrafico := True;
        If FrmFiltraSql.ShowModal = MrOk Then
        Begin
           _DadosGrafico.Close;
           If FrmFiltraSql.bFiltered Then Begin
              _DadosGrafico.Filter   := FrmFiltraSql.sCondicoes;
              _DadosGrafico.Filtered := True;
           End;

           SqlGrafico.SQL.Assign(FrmFiltraSql.SQLOrigem.SQL);

           Result := FrFiltrado;

        End
        Else
           Result := FrError;

{
        Case FrmFiltraSql.ShowModal of
          MrOk:    Result := FrFiltrado;
          MrAbort: Result := FrError;
        Else
                   Result := FrFull;
        End;
}

        MemoRodapeLocal.Clear;
        For I := 0 To FrmFiltraSql.MemoRodape.Lines.Count-1 Do Begin
          MemoRodapeLocal.Add(FrmFiltraSql.MemoRodape.Lines.Strings[I]); { Augusto 23/06/2003 }
        End;
        FrmFiltraSql.Free;

       Except
       raise;
        Result := FrError;
        _DadosGrafico.Close;
        _DadosGrafico.Filtered := False;
        _DadosGrafico.FilterOptions := [];
        _DadosGrafico.Filter := '';

        FrmFiltraSql.Free;
       End;
end;





procedure TfrmMostraGraf.btMaisZoomClick(Sender: TObject);
begin
  inherited;
  begin
    Grafico.View3DOptions.Zoom := Grafico.View3DOptions.Zoom + 5;
  end;
end;




procedure TfrmMostraGraf.btMenosZoomClick(Sender: TObject);
begin
  inherited;
  if Grafico.View3DOptions.Zoom > 0 then
     Grafico.View3DOptions.Zoom := Grafico.View3DOptions.Zoom - 5;
end;




procedure TfrmMostraGraf.TimerTimer(Sender: TObject);
begin
  inherited;
  if ckAnimar.Checked then
  begin
     if Grafico.SeriesList.CountActive = 0 then Exit;
     if (Grafico.SeriesList.Series[0] is TPieSeries) then
     begin
        (Grafico.SeriesList.Series[0] as TPieSeries).RotationAngle :=
        (Grafico.SeriesList.Series[0] as TPieSeries).RotationAngle + 1;
     end
     else
     begin
         if bSomar then
            Grafico.View3DOptions.Rotation := Grafico.View3DOptions.Rotation + 1
         else
            Grafico.View3DOptions.Rotation := Grafico.View3DOptions.Rotation - 1;

         if Grafico.View3DOptions.Rotation >= 440 then
           bSomar := False;
         if Grafico.View3DOptions.Rotation <= 281 then
           bSomar := true;
     end;
  end;
end;




procedure TfrmMostraGraf.ckAnimarClick(Sender: TObject);
begin
  inherited;
  Timer.Enabled := ckAnimar.Checked;
end;




procedure TfrmMostraGraf.ck3DClick(Sender: TObject);
begin
  inherited;
  Grafico.View3D := ck3D.Checked;
end;




procedure TfrmMostraGraf.CriaGrafico;
begin
  if Grafico <> nil then Grafico.Free;

  Grafico := TDBChart.Create(Self);
  with Grafico do
  begin
    Visible := True;
    Left := 1;
    Top := 33;
    Width := 561;
    Height := 351;
    AnimatedZoom := True;
    BackWall.Brush.Color := clWhite;
    BackWall.Brush.Style := bsClear;
    Title.Text.Text := '';
    Align := alClient;
    BevelOuter := bvNone;
    TabOrder := 0;
    Parent := PnlPreview;
  end;
end;

// Thiago Melo SOL 143297 Kintana 928391
procedure TfrmMostraGraf.InsereArvoreRecursiva (TreeReports: TfcTreeView; Pai : TfcTreeNode; idGrupoRelatorio : Double; idModulo: LongInt);
var
  TreeFilho, TreeGrupo : TfcTreeNode;
  qryRecursiva : TwwQuery;
  DescricaoGrupoRelatorio : String;  
begin
  qryRecursiva := TwwQuery.Create(Self);
  qryRecursiva.DataBaseName := 'BaseDados';
  try
    qryRecursiva.Close;
    qryRecursiva.Sql.Clear;
    qryRecursiva.Sql.Add('Select M.NOMEMODULO, G.Descricao, R.IdReports, R.OrigemCm, g.idgruporelatorio,');
    qryRecursiva.Sql.Add('Decode(C.Descricao,null,R.Name,C.Descricao) as Name');
    qryRecursiva.Sql.Add(' From Reports R, Modulo M, GrupoRelatorio G, ConfigReportsCM C');
    qryRecursiva.Sql.Add('Where ((R.IdModulo = ' + IntToStr(idModulo) + ') Or');
    qryRecursiva.Sql.Add('      ((R.IdModulo = 2) And (R.IdDataView Is Not Null)))');
    qryRecursiva.Sql.Add('  And (R.IdModulo = M.IdModulo)');
    qryRecursiva.Sql.Add('  And (R.IdGrupoRelatorio = G.IdGrupoRelatorio(+))');
    qryRecursiva.Sql.Add('  And (C.IdReports(+) = R.IdReports)');
    qryRecursiva.Sql.Add('  And (C.OrigemCM(+) = R.OrigemCM)');
    qryRecursiva.Sql.Add('  And (R.OrigemCmGr = G.OrigemCmGr(+))');
    qryRecursiva.Sql.Add('  And (R.FLGTIPO = ' + QuotedStr('G') + ')');
    qryRecursiva.Sql.Add('  AND  G.IDGRUPOMESTRE= ' + FloatToStr(idGrupoRelatorio));
    //qryRecursiva.Sql.Add('ORDER BY M.NOMEMODULO'); // SOL 143297.12044 Kintana 1832792
    qryRecursiva.Sql.Add('ORDER BY M.NOMEMODULO, R.Name'); // SOL 143297.12044 Kintana 1832792 //SOL 195642 Kintana 1869273
    qryRecursiva.Open;


    if not qryRecursiva.IsEmpty then begin

      DescricaoGrupoRelatorio := '';

      while not qryRecursiva.Eof do begin
        if DescricaoGrupoRelatorio <> Trim(qryRecursiva.FieldByName('descricao').AsString) then begin
          TreeGrupo := TreeReports.Items.AddChild(Pai,qryRecursiva.FieldByName('descricao').AsString);
          TreeGrupo.ImageIndex := 3;
          TreeGrupo.SelectedIndex := 3;

          TreeGrupo.StringData  := qryRecursiva.FieldByName('IdReports').AsString;
          TreeGrupo.StringData2 := qryRecursiva.FieldByName('OrigemCm').AsString;
        end;

        DescricaoGrupoRelatorio := Trim(qryRecursiva.FieldByName('descricao').AsString);

        TreeFilho := TreeReports.Items.AddChild(TreeGrupo,qryRecursiva.FieldByName('NAME').AsString);

        TreeFilho.ImageIndex := 1;
        TreeFilho.SelectedIndex := 2;
        TreeFilho.StringData  := qryRecursiva.FieldByName('IdReports').AsString;
        TreeFilho.StringData2 := qryRecursiva.FieldByName('OrigemCm').AsString;

        qryRecursiva.Next;
      end;

      InsereArvoreRecursiva(TreeReports, TreeGrupo, qryRecursiva.FieldByName('IDGRUPORELATORIO').AsFloat, IdModulo);
    end;
  finally
    qryRecursiva.Close;
    FreeAndNil(qryRecursiva);
  end;
end;
// Thiago Melo SOL 143297 Kintana 928391


procedure TfrmMostraGraf.bbtnAjudaClick(Sender: TObject);
begin
  inherited;
  // 148922/8841 - Jonas
  if  (Sistema.IdModulo        = 15)  then
      begin
           Application.HelpContext(230030)
      end;

end;

End.

