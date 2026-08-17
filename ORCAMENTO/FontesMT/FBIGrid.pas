// *****************************************************************************
// ***************************** REGISTRO DE ALTERAÇÕES ************************
// *****************************************************************************
// Autor(a)    :  Ádler Teodoro de Souza
// Data        :  19/02/2009
// Pendência   : SOL 109421 KINTANA 496332
// Descricao   :  Alteração de gravação de arquivos de log na raiz do disco C: .
//------------------------------------------------------------------------------

Unit FBIGrid;

Interface

Uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  FSairAjuda, Db, DBTables, dxDBTLCl, dxGrClms, dxTL, dxDBCtrl, dxDBGrid,
  dxCntner, IvDictio, IvMulti, IvEMulti, MAHlpBtn, StdCtrls, Buttons,
  TB97Tlbr, TB97, ExtCtrls,uDataBase, Menus, dxPSCore, dxPSdxTLLnk,
  dxPSdxDBCtrlLnk, dxPSdxDBGrLnk, DBClient, uCMClientDataSet, uCmSqlParams;

Type
  TfrmBIGrid = class(TfrmSairAjuda)
    dxDBGrid1: TdxDBGrid;
    dsDxGrid: TDataSource;
    btnFiltro: TBitBtn;
    PopupMenu1: TPopupMenu;
    AlterarColunas1: TMenuItem;
    Imprimir1: TMenuItem;
    dxComponentPrinter1: TdxComponentPrinter;
    dxComponentPrinter1Link1: TdxDBGridReportLink;
    BitBtn1: TBitBtn;
    BitBtn2: TBitBtn;
    BitBtn3: TBitBtn;
    dxDBGrid1EMPRESA: TdxDBGridMaskColumn;
    dxDBGrid1DATAREFERENCIA: TdxDBGridMaskColumn;
    dxDBGrid1CCNOME: TdxDBGridMaskColumn;
    dxDBGrid1UNNOME: TdxDBGridMaskColumn;
    dxDBGrid1NOMEGRUPOORCAMEN: TdxDBGridMaskColumn;
    dxDBGrid1PPNOME: TdxDBGridMaskColumn;
    dxDBGrid1PRNOME: TdxDBGridMaskColumn;
    dxDBGrid1VLRREALIZADO: TdxDBGridMaskColumn;
    dxDBGrid1VLRORCADO: TdxDBGridMaskColumn;
    dxDBGrid1VLRRESERVADO: TdxDBGridMaskColumn;
    dxDBGrid1VLRCOMPROMETIDO: TdxDBGridMaskColumn;
    sqlDxGrid: TCMSqlParams;
    cdsDxGrid: TCMClientDataSet;
    Procedure btnFiltroClick(Sender: TObject);
    Procedure FormShow(Sender: TObject);
    Procedure dxDBGrid1BackgroundDrawEvent(Sender: TObject;
      ACanvas: TCanvas; ARect: TRect);
    Procedure AlterarColunas1Click(Sender: TObject);
    Procedure dxDBGrid1ShowColumn(Sender: TObject;
      Column: TdxDBTreeListColumn);
    Procedure dxDBGrid1DragEndHeader(Sender: TObject;
      AColumn: TdxTreeListColumn; P: TPoint;
      var NewPosInfo: TdxHeaderPosInfo; var Accept: Boolean);
    Procedure Imprimir1Click(Sender: TObject);
    Procedure dxDBGrid1GetLevelColor(Sender: TObject; ALevel: Integer;
      var AColor: TColor);
    Procedure BitBtn1Click(Sender: TObject);
    Procedure BitBtn2Click(Sender: TObject);
    Procedure BitBtn3Click(Sender: TObject);
  Private
    bConfirma,                                //Se True significa que o filtro foi alterado.
    bGrupoOrcamen, bCentroDeCusto, bPatrocinadora,
    bPlanoPrev, bUnidNegocio : Boolean;
    sDataIni, sDataFim : TDateTime;
    sNomeColuna : String;
    Procedure fMontarQueryGrid;
    Function GetColor(BColor, EColor: TColor; N, H: Integer): TColor;

    //iQtdeCampos : Integer;
  public
    { Public declarations }
  End;

Var
  frmBIGrid: TfrmBIGrid;

Implementation

Uses
  usistema, uMensErro, FBIParametros;

{$R *.DFM}

{ TfrmBIGrid }
//************************************************
Procedure TfrmBIGrid.FormShow(Sender: TObject);
Begin
  WindowState := wsMaximized;
  Inherited;
  btnFiltroClick(Sender);
End;
//************************************************
Procedure TfrmBIGrid.btnFiltroClick(Sender: TObject);
Begin
  Inherited;
  frmBIParametros := TfrmBIParametros.Create(Application);
  frmBIParametros.ShowModal;
  bConfirma := frmBIParametros.bConfirma;
  If bConfirma Then
  With frmBIParametros Do Begin
    sDataIni := edDataIni.Date;
    sDataFim := edDataFim.Date;

    bGrupoOrcamen    := chkGrupoOrcamen.Checked;
    bCentroDeCusto   := chkCentroDeCusto.Checked;
    bUnidNegocio     := chkUnidNegocio.Checked;
    bPlanoPrev       := chkPlanoPrev.Checked;
    bPatrocinadora   := chkPatrocinadora.Checked;

    dxDBGrid1.ClearGroupColumns;
    dxDBGrid1NOMEGRUPOORCAMEN.Visible            := bGrupoOrcamen;
    dxDBGrid1NOMEGRUPOORCAMEN.DisableCustomizing := (not bGrupoOrcamen);
    dxDBGrid1CCNOME.Visible                      := bCentroDeCusto;
    dxDBGrid1CCNOME.DisableCustomizing           := (not bCentroDeCusto);
    dxDBGrid1UNNOME.Visible                      := bUnidNegocio;
    dxDBGrid1UNNOME.DisableCustomizing           := (not bUnidNegocio);
    dxDBGrid1PPNOME.Visible                      := bPlanoPrev;
    dxDBGrid1PPNOME.DisableCustomizing           := (not bPlanoPrev);
    dxDBGrid1PRNOME.Visible                      := bPatrocinadora;
    dxDBGrid1PRNOME.DisableCustomizing           := (not bPatrocinadora);
    {
    dxDBGrid1VLRREALIZADO.Visible                := bIdGrupoDc;
    dxDBGrid1VLRREALIZADO.DisableCustomizing     := (not bIdGrupoDc);
    dxDBGrid1VLRORCADO.Visible                   := bIdGrupoDc;
    dxDBGrid1VLRORCADO.DisableCustomizing        := (not bIdGrupoDc);
    dxDBGrid1VLRRESERVADO.Visible                := bIdGrupoDc;
    dxDBGrid1VLRRESERVADO.DisableCustomizing     := (not bIdGrupoDc);
    dxDBGrid1VLRCOMPROMETIDO.Visible             := bIdGrupoDc;
    dxDBGrid1VLRCOMPROMETIDO.DisableCustomizing  := (not bIdGrupoDc);
    }
  End;

  frmBIParametros.Free;
  frmBIParametros := Nil;

  If bConfirma Then fMontarQueryGrid;
End;

procedure TfrmBIGrid.fMontarQueryGrid;
begin
   with sqlDxGrid do
   begin
      CdsDxGrid.Close;
      SQL.Clear;
      SQL.Add('SELECT /*+ OPTIMIZER_MODE RULE */');
      SQL.Add('   PE.NOME EMPRESA');
      SQL.Add('  ,TO_CHAR( SO.DATAREFERENCIA, ''MM/YYYY'' ) DATAREFERENCIA');

      If bCentroDeCusto Then
        SQL.Add('  ,CC.NOME CCNOME');

      If bUnidNegocio Then
        SQL.Add('  ,UN.NOME UNNOME');

      If bGrupoOrcamen Then
        SQL.Add('  ,GO.NOMEGRUPOORCAMEN');

      If bPlanoPrev Then
        SQL.Add('  ,PP.NOME PPNOME');

      If bPatrocinadora Then
        SQL.Add('  ,PT.NOME PRNOME');

      SQL.Add('  ,ROUND( SUM( SO.VLRREALIZADO ),    2 ) VLRREALIZADO');
      SQL.Add('  ,ROUND( SUM( SO.VLRORCADO ),       2 ) VLRORCADO');
      SQL.Add('  ,ROUND( SUM( SO.VLRRESERVADO ),    2 ) VLRRESERVADO');
      SQL.Add('  ,ROUND( SUM( SO.VLRCOMPROMETIDO ), 2 ) VLRCOMPROMETIDO');
      SQL.Add('FROM');
      SQL.Add('   SALDOORCADO SO');
      SQL.Add('  ,CONTASORCAMEN CO');

      If bCentroDeCusto Then
        SQL.Add('  ,CENTCUST CC');

      If bUnidNegocio Then
        SQL.Add('  ,UNIDNEGOCIO UN');

      If bGrupoOrcamen Then
        SQL.Add('  ,GRUPOORCAMEN GO');

      If bPlanoPrev Then
        SQL.Add('  ,PLANPREVCONTABIL PP');

      If bPatrocinadora Then Begin
        SQL.Add('  ,( SELECT');
        SQL.Add('      PA.IDPESSOA,');
        SQL.Add('      PE.NOME');
        SQL.Add('    FROM');
        SQL.Add('      PATRO PA,');
        SQL.Add('      PESSOA PE');
        SQL.Add('    WHERE');
        SQL.Add('      PA.IDPESSOA <> ' + IntToStr( Sistema.IdEmpresa ) + ' AND');
        SQL.Add('      PE.IDPESSOA = PA.IDPESSOA ) PT');
      End;
      SQL.Add('  ,PESSOA PE');
      SQL.Add('WHERE');
      SQL.Add('      ( PE.IDPESSOA       = ' + IntToStr( Sistema.IdEmpresa ) + ' )');
      SQL.Add('  AND ( CO.IDPESSOA       = PE.IDPESSOA )');

      If bGrupoOrcamen Then
        SQL.Add('  AND ( CO.IDGRUPOORCAMEN = GO.IDGRUPOORCAMEN )');

      If bCentroDeCusto Then
        SQL.Add('  AND ( CO.CODCENTROCUSTO = CC.CODCENTROCUSTO )');

      If bPlanoPrev Then
        SQL.Add('  AND ( CO.IDPLANOPREV    = PP.IDPLANOPREV )');

      If bUnidNegocio Then
        SQL.Add('  AND ( CO.UNIDNEGOC      = UN.UNIDNEGOC )');

      If bPatrocinadora Then
        SQL.Add('  AND ( CO.IDPATRO        = PT.IDPESSOA )');

      SQL.Add('  AND ( SO.IDPLANOORCAMEN = CO.IDPLANOORCAMEN )');
      SQL.Add('  AND ( SO.IDCONTAORCAMEN = CO.IDCONTAORCAMEN )');
      SQL.Add('  AND ( SO.DATAREFERENCIA >= ' + QuotedStr( FormatDateTime( 'dd/mm/yyyy', sdataini ) ) + ' )' );
      SQL.Add('  AND ( SO.DATAREFERENCIA <= ' + QuotedStr( FormatDateTime( 'dd/mm/yyyy', sdatafim ) ) + ' )' );
      SQL.Add('GROUP BY');
      SQL.Add('   PE.NOME');
      SQL.Add('  ,TO_CHAR( SO.DATAREFERENCIA, ''MM/YYYY'')');

      If bCentroDeCusto Then
        SQL.Add('  ,CC.NOME');

      If bUnidNegocio Then
        SQL.Add('  ,UN.NOME');

      If bGrupoOrcamen Then
        SQL.Add('  ,GO.NOMEGRUPOORCAMEN');

      If bPlanoPrev Then
        SQL.Add('  ,PP.NOME');

      If bPatrocinadora Then
        SQL.Add('  ,PT.NOME');

      //if not Prepared then Prepare;
      try
        //sql.SavetoFile( 'c:\sqlDxGrid.sql');
        sql.SavetoFile(Sistema.RetornaCaminhoArquivos(Sistema.IdEmpresa) + '\sqlDxGrid.sql');//Ádler Teodoro de Souza SOL 109421 KINTANA 496332
        Open;
        If CdsDxGrid.IsEmpty Then MsgDlg('Não há dados selecionados para o período informado','Erro', mtInformation,[ mbOk ], 0 );
      except
         on e : exception do showmessage( e.message );
      end;
   End;
End;

procedure TfrmBIGrid.AlterarColunas1Click(Sender: TObject);
begin
  inherited;
  dxDBGrid1.ColumnsCustomizing;
end;

procedure TfrmBIGrid.dxDBGrid1ShowColumn(Sender: TObject;
  Column: TdxDBTreeListColumn);
begin
  inherited;
  if Column.BandIndex = 1 then
  begin
     {
     dxDBGrid1QTDE_PERNOITES.Visible := (sNomeColuna = 'QTDE_PERNOITES');
     dxDBGrid1QTDE_OCUPADO.Visible := (sNomeColuna = 'QTDE_OCUPADO');
     dxDBGrid1QTDE_RESERVAS.Visible := (sNomeColuna = 'QTDE_RESERVAS');
     dxDBGrid1QTDE_CANCELAMENTOS.Visible := (sNomeColuna = 'QTDE_CANCELAMENTOS');
     dxDBGrid1QTDE_UH_CORTESIA.Visible := (sNomeColuna = 'QTDE_UH_CORTESIA');
     dxDBGrid1QTDE_UH_PERMUTA.Visible := (sNomeColuna = 'QTDE_UH_PERMUTA');
     dxDBGrid1QTDE_UH_NO_SHOW.Visible := (sNomeColuna = 'QTDE_UH_NO_SHOW');
     dxDBGrid1QTDE_UH_NO_SHOW_COBRADO.Visible := (sNomeColuna = 'QTDE_UH_NO_SHOW_COBRADO');
     dxDBGrid1QTDE_UH_WALK_IN.Visible := (sNomeColuna = 'QTDE_UH_WALK_IN');
     dxDBGrid1QTDE_DAY_USE.Visible := (sNomeColuna = 'QTDE_DAY_USE');
     dxDBGrid1QTDE_DAY_USE_COBRADO.Visible := (sNomeColuna = 'QTDE_DAY_USE_COBRADO');

     dxDBGrid1IDHOTEL.SummaryField := sNomeColuna;
     dxDBGrid1DATAREFERENCIA.SummaryField := sNomeColuna;
     dxDBGrid1ORIGEM.SummaryField := sNomeColuna;
     dxDBGrid1SEGMENTO.SummaryField := sNomeColuna;
     dxDBGrid1PROMOTOR.SummaryField := sNomeColuna;
     dxDBGrid1MEIO_COMUNICACAO.SummaryField := sNomeColuna;
     dxDBGrid1PAIS.SummaryField := sNomeColuna;
     dxDBGrid1ESTADO.SummaryField := sNomeColuna;
     dxDBGrid1CIDADES.SummaryField := sNomeColuna;
     dxDBGrid1TIPO_UH.SummaryField := sNomeColuna;
     dxDBGrid1POSTO.SummaryField := sNomeColuna;
     dxDBGrid1CLIENTE.SummaryField := sNomeColuna;
     dxDBGrid1GRUPO.SummaryField := sNomeColuna;
     dxDBGrid1VEICULOS.SummaryField := sNomeColuna;
     dxDBGrid1TARIFA.SummaryField := sNomeColuna;
     dxDBGrid1PACOTE.SummaryField := sNomeColuna;
     }
  end;
  dxDBGrid1.RefreshGroupColumns;

end;

procedure TfrmBIGrid.dxDBGrid1DragEndHeader(Sender: TObject;
  AColumn: TdxTreeListColumn; P: TPoint; var NewPosInfo: TdxHeaderPosInfo;
  var Accept: Boolean);
begin
  inherited;
  {
  if AColumn.BandIndex = 1 then
  case AColumn.Tag of
     0  : sNomeColuna := 'QTDE_PERNOITES';
     1  : sNomeColuna := 'QTDE_UH_PERMUTA';
     2  : sNomeColuna := 'QTDE_RESERVAS';
     3  : sNomeColuna := 'QTDE_UH_CORTESIA';
     4  : sNomeColuna := 'QTDE_UH_NO_SHOW';
     5  : sNomeColuna := 'QTDE_UH_NO_SHOW_COBRADO';
     6  : sNomeColuna := 'QTDE_UH_WALK_IN';
     7  : sNomeColuna := 'QTDE_DAY_USE';
     8  : sNomeColuna := 'QTDE_DAY_USE_COBRADO';
     9  : sNomeColuna := 'QTDE_OCUPADO';
     10 : sNomeColuna := 'QTDE_CANCELAMENTOS';
  end;
  }
end;

procedure TfrmBIGrid.dxDBGrid1BackgroundDrawEvent(Sender: TObject;
  ACanvas: TCanvas; ARect: TRect);
begin
  inherited;
  with ACanvas do
  begin
    Brush.Color := clLtGray;
    FillRect(ARect);
    if (Sender as TdxDBGrid).GroupColumnCount = 0 then
    begin
      Font.Color := clBlue;
      Font.Height := 24;
      TextOut(ARect.Left, ARect.Top, '      Grupos');
    end;
  end;
end;

procedure TfrmBIGrid.Imprimir1Click(Sender: TObject);
begin
  inherited;
  dxComponentPrinter1.Preview(True,nil);
end;

procedure TfrmBIGrid.dxDBGrid1GetLevelColor(Sender: TObject;
  ALevel: Integer; var AColor: TColor);
begin
  inherited;
  AColor := GetColor($00E0A59E, clWhite, ALevel, 7);
end;

function TfrmBIGrid.GetColor(BColor, EColor: TColor; N, H: Integer): TColor;
begin
    Result := RGB(Trunc(GetRValue(BColor) + (GetRValue(EColor)-GetRValue(BColor)) * N / H),
    Trunc(GetGValue(BColor) + (GetGValue(EColor)-GetGValue(BColor)) * N / H),
    Trunc(GetBValue(BColor) + (GetBValue(EColor)-GetBValue(BColor)) * N / H));
end;

procedure TfrmBIGrid.BitBtn1Click(Sender: TObject);
begin
  inherited;
  dxDBGrid1.FullExpand;
end;

procedure TfrmBIGrid.BitBtn2Click(Sender: TObject);
begin
  inherited;
  dxDBGrid1.FullCollapse;
end;

procedure TfrmBIGrid.BitBtn3Click(Sender: TObject);
begin
  inherited;
  dxComponentPrinter1.Preview(True,nil);
end;

end.
