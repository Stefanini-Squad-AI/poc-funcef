unit fConfereRegraMT;

//------------------------------------------------------------------------------
//N. Sol.............: 131939
//N. Kintana.........: 755306
//Data...............: 08/03/2010
//Responsável........: Ricardo Alves
//Descrição..........: implementação e Validação dos campos data de Composição e
//  Plano Contábil na janela Consistência de Regras.

{------------------------------------------------------------------------------
  Desenvolvedor: Marcus Oliveira
  Data         : 07/02/2007
  Pendência    : 24438 - FUNCEF  Não estava sendo visualizado o ultimo registro
                 mesmo usando a barra de rolagem
-------------------------------------------------------------------------------
  Desenvolvedor: Marcus Oliveira
  Data         : 29.09.2006
  Pendência    : 23335 - FUNCEF Incluir um opção para marcar e desmarcar todos
                                os itens.
-------------------------------------------------------------------------------
  Desenvolvedor: Antonio Marcos Fernandes de Souza - mnemônico(amf)
  Data         : 21.03.2006
  Pendência    : 21788 - FUNCEF
                 Falha no teste de condição de fSoma <> 0 (ponto flutuante)
  Solução      : Utilizei a biblioteca JCL function IsFloatZero.
--------------------------------------------------------------------------------
  Desenvolvedor: Antonio Marcos Fernandes de Souza - mnemônico(amf)
  Data         : 17.03.2006
  Pendência    : 21788 - FUNCEF
  Solução      : Somei as linhas retornadas no cdsSaldo para cada conta.
--------------------------------------------------------------------------------
  Desenvolvedor: Antonio Marcos Fernandes de Souza - mnemônico(amf)
  Data         : 05.01.2006 - 09.01.2006
  Pendência    : 20900 - Solicito a possibilidade de fazer  seleções múltiplas
                 para os campos plano e patrocinadora, similar ao relatório do
                 Razão Analítico.
  Solução      - Mudança na interface permitindo que o usuário selecione 1 ou mais
                 patrocinadoras, assim como, planos previdenciários. A nova reali-
                 dade exigiu a criação de um novo método no CtrlPlanoSaldo, o
                 método RetornaSaldoContaExercLista.
               - Alteração no relatório de consistências para que sejam impressas
                 a lista de patrocinadoras e a lista de planos previdenciários. Modifi-
                 quei o posicionamento dos labels no design do relatório.
{------------------------------------------------------------------------------
  Desenvolvedor: Alex Pereira
  Data         : 14/03/2005
  Pendência    : 18804
  Solução      : Prever saldo de movimentações e saldo atual
------------------------------------------------------------------------------}
{------------------------------------------------------------------------------
  Desenvolvedor: Alex Pereira
  Data         : 18/02/05
  Pendência    : 18694
  Solução      : Ajustar a tela para aceitar tanto planos como patros separadamente
------------------------------------------------------------------------------}
interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  FOkCancelar, ComCtrls, StdCtrls, wwdblook, Buttons, CheckLst, IvDictio,
  IvMulti, IvEMulti, MAHlpBtn, TB97Tlbr, TB97, ExtCtrls, uCtrlPeriodo,
  uCMTypes, Db, DBClient, JCLSysUtils,
  uCMClientDataSet, uCtrlContab, uCtrlSPCConsiste, uCtrlPlanoSaldo, Mask,
  Grids, DBGrids, dxTL, dxCntner, ImgList, CmParamReport, ppPrnabl,
  ppClass, ppCtrls, ppDB, ppDBPipe, ppBands, ppCache, ppComm, ppRelatv,
  ppProd, ppReport, fPreview, ppVar, uCMMath, Wwdbigrd, Wwdbgrid,
  uCmSqlParams, wwclient, uMensErro, JCLMath;

type
  TfrmConfereRegraMT = class(TfrmOkCancelar)
    CdsExercicio: TCMClientDataSet;
    CdsPeriodo: TCMClientDataSet;
    cdsSPCConsiste: TCMClientDataSet;
    cdsSaldo: TCMClientDataSet;
    cdsResult: TCMClientDataSet;
    cdsResultPLACONTA: TStringField;
    cdsResultSALDOCONTA: TFloatField;
    cdsResultIDSPCCONSISTE: TFloatField;
    pnlFiltro: TPanel;
    Bevel1: TBevel;
    dblkExercicio: TwwDBLookupCombo;
    dblkPeriodo: TwwDBLookupCombo;
    ImageList: TImageList;
    CmParamReport: TCmParamReport;
    bbtnImprimir: TBitBtn;
    ToolbarSep972: TToolbarSep97;
    ppReport: TppReport;
    ppHeaderBand1: TppHeaderBand;
    ppDetailBand: TppDetailBand;
    ppFooterBand1: TppFooterBand;
    ppDBPipeline: TppDBPipeline;
    dtsPrint: TDataSource;
    ppDBText1: TppDBText;
    ppLabel1: TppLabel;
    ppLine1: TppLine;
    ppLine2: TppLine;
    ppSystemVariable1: TppSystemVariable;
    ppLabel2: TppLabel;
    ppLabel3: TppLabel;
    lblTipo: TppLabel;
    ppLabel5: TppLabel;
    ppLabel6: TppLabel;
    ppLabel7: TppLabel;
    ppLabel8: TppLabel;
    ppLabel9: TppLabel;
    ppLabel10: TppLabel;
    lblPExercicio: TppLabel;
    lblPPeriodo: TppLabel;
    lblPPatrocinadora: TppLabel;
    lblPPlano: TppLabel;
    ppLabel13: TppLabel;
    ppLabel14: TppLabel;
    ppLabel15: TppLabel;
    ppLine3: TppLine;
    ppDBText2: TppDBText;
    ppGroup1: TppGroup;
    ppGroupHeaderBand: TppGroupHeaderBand;
    ppGroupFooterBand: TppGroupFooterBand;
    cdsResultDESCRICAO: TStringField;
    cdsResultCONTAS: TStringField;
    cdsResultSALDOREGRA: TFloatField;
    ppDBText3: TppDBText;
    ppSaldoRegra: TppDBText;
    ppLine4: TppLine;
    ppDBText4: TppDBText;
    lblPPResult: TppLabel;
    ppShape1: TppShape;
    ppLabel4: TppLabel;
    ppLine5: TppLine;
    ppSystemVariable2: TppSystemVariable;
    Label3: TLabel;
    Label4: TLabel;
    pnlRegras: TPanel;
    pgcPatroPlanoResult: TPageControl;
    tbsResult: TTabSheet;
    GroupBox1: TGroupBox;
    dbgResult: TwwDBGrid;
    tabRegras: TTabSheet;
    tabPatroPlano: TTabSheet;
    grpPlanoPrev: TGroupBox;
    dbgrPlanoPrev: TwwDBGrid;
    grpPatro: TGroupBox;
    dbgrPatro: TwwDBGrid;
    dsPat: TDataSource;
    dsPrev: TDataSource;
    sqlPatro: TCMSqlParams;
    sqlPlanoPrev: TCMSqlParams;
    cdsPlanoPrev: TwwClientDataSet;
    cdsPatro: TwwClientDataSet;
    tabResultado: TTabSheet;
    GroupBox2: TGroupBox;
    dxTreeList: TdxTreeList;
    dxTreeListColumn1: TdxTreeListColumn;
    dxTreeListColumn2: TdxTreeListColumn;
    dxTreeListColumn3: TdxTreeListColumn;
    Panel1: TPanel;
    SpeedButton1: TSpeedButton;
    SpeedButton2: TSpeedButton;
    pnlTxtResult: TPanel;
    grpProcesso: TGroupBox;
    prgbPassos: TProgressBar;
    ListView: TListView;
    Panel2: TPanel;
    btnMarcarTodas: TSpeedButton;
    btnDesmarcarTodas: TSpeedButton;
    procedure FormCreate(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure dblkExercicioCloseUp(Sender: TObject; LookupTable,
      FillTable: TDataSet; modified: Boolean);
    procedure btnMarcarTodasClick(Sender: TObject);
    procedure btnDesmarcarTodasClick(Sender: TObject);
    procedure bbtnConfirmarClick(Sender: TObject);
    procedure btnExpandeClick(Sender: TObject);
    procedure btnContraiClick(Sender: TObject);
    procedure bbtnCancelarClick(Sender: TObject);
    procedure bbtnImprimirClick(Sender: TObject);
    procedure lblTipoPrint(Sender: TObject);
    procedure lblPExercicioPrint(Sender: TObject);
    procedure lblPPeriodoPrint(Sender: TObject);
    procedure lblPPatrocinadoraPrint(Sender: TObject);
    procedure lblPPlanoPrint(Sender: TObject);
    procedure lblPPResultPrint(Sender: TObject);
    procedure ppSaldoRegraPrint(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure pgcPatroPlanoResultChange(Sender: TObject);
    procedure dblkPeriodoChange(Sender: TObject);
  private
    bHaInconsistencia : boolean;

    CtrlPeriodo     : TCtrlPeriodo;
    CtrlContab      : TCtrlContab;
    CtrlSPCConsiste : TCtrlSPCConsiste;
    CtrlPlanoSaldo  : TCtrlPlanoSaldo;

    function Mascara( s : string ) : string;
    function ObterSelecionados(const cdsLista: TwwClientDataSet;
                               const sFieldName: string):string;
    procedure MontaResultado;
  public
    { Public declarations }
  end;

var
  frmConfereRegraMT: TfrmConfereRegraMT;

implementation

uses DBaseDados, uSistema, uCtrlParamIntegra;

{$R *.DFM}

procedure TfrmConfereRegraMT.FormCreate(Sender: TObject);
//var
//  ListItem : TListItem;
//  iIdAnt : integer;
//  sContas : string;
begin
  inherited;

  CtrlPeriodo := TCtrlPeriodo.Create;
  CtrlPeriodo.Initialize( dtmBaseDados.dbBaseDados,True,Sistema.ConnectionType,
                          Sistema.ConnectionSide,Sistema.AppRemoteServer,False );

  CdsExercicio.Data := CtrlPeriodo.ListExercicios( Sistema.IdEmpresa, True );

  CtrlContab := TCtrlContab.Create;
  CtrlContab.InitializeAs( CtrlPeriodo );

  if not CtrlContab.SelecionaParametros( Sistema.IdEmpresa ) Then
    ShowMessage( CtrlContab.MessageInfo );

  CtrlSPCConsiste := TCtrlSPCConsiste.Create;
  CtrlSPCConsiste.InitializeAs( CtrlPeriodo );

  cdsPatro.Data := CtrlSPCConsiste.RecuperaPatro;
  cdsPlanoPrev.Data := CtrlSPCConsiste.RecuperaPlano;


  CtrlPlanoSaldo := TCtrlPlanoSaldo.Create;
  CtrlPlanoSaldo.InitializeAs( CtrlPeriodo );

  // Ricardo A. SOL 131939 KTN 755306
//  cdsSPCConsiste.Data := CtrlSPCConsiste.SelecionaTodos( ParamIntegra.Plano );

//  cdsSPCConsiste.First;
//  iIdAnt   := -1;
//  sContas  := '';
//  ListItem := nil;
//
//
//  while not cdsSPCConsiste.Eof do
//  begin
//
//    if cdsSPCConsiste.FieldByName('IDSPCCONSISTE').AsInteger <> iIdAnt then
//    begin
//
//      if ListItem <> nil then ListItem.SubItems.Add( sContas );
//      ListItem := ListView.Items.Add;
//      ListItem.Caption := cdsSPCConsiste.FieldByName('DESCRICAO').AsString;
//      ListItem.SubItems.Add( cdsSPCConsiste.FieldByName('IDSPCCONSISTE').AsString );
//      sContas := '(' + Mascara(
//       cdsSPCConsiste.FieldByName('PLACONTA').AsString ) + ')';
//      iIdAnt := cdsSPCConsiste.FieldByName('IDSPCCONSISTE').AsInteger;
//    end
//    else
//      sContas := sContas + ' + (' + Mascara(
//       cdsSPCConsiste.FieldByName('PLACONTA').AsString ) + ')';
//
//    cdsSPCConsiste.Next;
//
//  end;
//  if ListItem <> nil then ListItem.SubItems.Add( sContas );
  // FIM Ricardo A. SOL 131939 KTN 755306
end;

procedure TfrmConfereRegraMT.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  inherited;
  CtrlPeriodo.free;
  CtrlContab.free;
  CtrlSPCConsiste.free;
  CtrlPlanoSaldo.free;
end;

procedure TfrmConfereRegraMT.dblkExercicioCloseUp(Sender: TObject;
  LookupTable, FillTable: TDataSet; modified: Boolean);
begin
  inherited;
  dblkPeriodo.LookupValue := '';
  CdsPeriodo.Close;
  if trim( dblkExercicio.Text ) <> '' then
  begin
    dblkPeriodo.Enabled := True;
    CdsPeriodo.Data   := CtrlPeriodo.ListPeriodo( Sistema.IdEmpresa, tbpTodos,
     StrToInt( trim( dblkExercicio.Text ) ), 0 );
  end
  else
    dblkPeriodo.Enabled := False;
end;

procedure TfrmConfereRegraMT.btnMarcarTodasClick(Sender: TObject);
var
  i : integer;
begin
  inherited;
  for i := 0 to ( ListView.Items.Count - 1 ) do
    ListView.Items[i].Checked := True;


end;

procedure TfrmConfereRegraMT.btnDesmarcarTodasClick(Sender: TObject);
var
  i : integer;
begin
  inherited;
  for i := 0 to ( ListView.Items.Count - 1 ) do
    ListView.Items[i].Checked := False;
end;

function TfrmConfereRegraMT.Mascara(s: string): string;
begin
  Result := FormatMaskText( CtrlContab.MascaraContaParam + ';0; ', s );
  Result := StringReplace( Result, '. ', '', [rfReplaceAll] );
  Result := StringReplace( Result, ' .', '', [rfReplaceAll] );
  Result := StringReplace( Result, ' ', '', [rfReplaceAll] );
end;

procedure TfrmConfereRegraMT.bbtnConfirmarClick(Sender: TObject);
var
  i,
  iQtdeSel: integer;
  sListaPlanoPrev, sListaPatro: string;
  fSaldo, fSoma : extended;
begin
  inherited;
  if trim( dblkExercicio.Text ) = '' then
  begin
    ShowMessage( 'Informe o exercício.' );
    dblkExercicio.SetFocus;
    exit;
  end;

  if trim( dblkPeriodo.Text ) = '' then
  begin
    ShowMessage( 'Informe o período.' );
    dblkPeriodo.SetFocus;
    exit;
  end;

  iQtdeSel := 0;
  for i := 0 to ( ListView.Items.Count - 1 ) do
    if ListView.Items[i].Checked then inc( iQtdeSel );

  if iQtdeSel = 0 then
  begin
    ShowMessage( 'Selecione ao menos uma regra para consistir.' );
    exit;
  end;

  prgbPassos.Max := iQtdeSel;

  cdsResult.Close;
  cdsResult.Filtered := False;
  cdsResult.Filter := '';
  cdsResult.CreateDataSet;

  bHaInconsistencia := False;

  sListaPlanoPrev  := ObterSelecionados(cdsPlanoPrev, 'IDPLANOPREV');
  sListaPatro      := ObterSelecionados(cdsPatro, 'IDPESSOA');

  for i := 0 to  ( ListView.Items.Count - 1 ) do
  begin
    if ListView.Items[i].Checked then
    begin
      cdsSaldo.Close;

      cdsSPCConsiste.Filter   := 'IDSPCCONSISTE=' + ListView.Items[i].SubItems.Strings[0];
      cdsSPCConsiste.Filtered := True;

      fSoma := 0;

      cdsSPCConsiste.First;
      while not cdsSPCConsiste.Eof do
      begin


        if (cdsSPCConsiste.FieldByName('FLGSALDOOUMOVIM').IsNull) or
           (cdsSPCConsiste.FieldByName('FLGSALDOOUMOVIM').AsString = 'S') then
             cdsSaldo.Data := CtrlPlanoSaldo.RetornaSaldoContaExercLista(
             StrToInt( dblkExercicio.Text ),
             cdsPeriodo.FieldByName('PERNUMERO').AsInteger,
             ParamIntegra.Plano,
             Sistema.IdEmpresa,
             cdsSPCConsiste.FieldByName('PLACONTA').AsString,
             tAtual,
             sListaPlanoPrev,
             sListaPatro,
             true )
        else
             cdsSaldo.Data := CtrlPlanoSaldo.RetornaSaldoContaExercLista(
             StrToInt( dblkExercicio.Text ),
             cdsPeriodo.FieldByName('PERNUMERO').AsInteger,
             ParamIntegra.Plano,
             Sistema.IdEmpresa,
             cdsSPCConsiste.FieldByName('PLACONTA').AsString,
             tSoAtual,
             sListaPlanoPrev,
             sListaPatro,
             true );


        while not cdsSaldo.Eof do
        begin
           fSaldo := RoundCM(fSaldo, 2) + RoundCM (cdsSaldo.FieldByName('DEBITO').AsFloat - cdsSaldo.FieldByName('CREDITO').AsFloat, 2);
           cdsSaldo.Next;
        end;
        fSoma  := RoundCM(fSoma, 2) + RoundCM(fSaldo, 2);

        cdsResult.Insert;
        cdsResultIDSPCCONSISTE.AsInteger := cdsSPCConsiste.FieldByName('IDSPCCONSISTE').AsInteger;
        cdsResultPLACONTA.AsString       := Mascara( cdsSPCConsiste.FieldByName('PLACONTA').AsString );
        cdsResultSALDOCONTA.AsFloat      := fSaldo;
        cdsResultDESCRICAO.AsString      := cdsSPCConsiste.FieldByName('DESCRICAO').AsString;
        cdsResultCONTAS.AsString         := ListView.Items[i].SubItems[1];
        cdsResult.Post;

        fSaldo := 0;

        cdsSPCConsiste.Next;
      end;

      cdsResult.Filtered := False;
      cdsResult.Filter   := 'IDSPCCONSISTE=' + cdsSPCConsiste.FieldByName('IDSPCCONSISTE').AsString;
      cdsResult.Filtered := True;
      cdsResult.First;
      while not cdsResult.Eof do
      begin
        cdsResult.Edit;
        cdsResultSALDOREGRA.AsFloat := fSoma;
        cdsResult.Post;
        cdsResult.Next;
      end;
      cdsResult.Filtered := False;

      if (not IsFloatZero(fSoma)) then
         bHaInconsistencia := True;

      cdsSPCConsiste.Filter   := '';
      cdsSPCConsiste.Filtered := False;

      prgbPassos.StepIt;
    end;
  end;

  MontaResultado;
  pnlFiltro.Enabled := False;
  bbtnImprimir.Enabled := True;
  cdsSaldo.Close;
  pgcPatroPlanoResult.ActivePage := tabResultado;
end;

procedure TfrmConfereRegraMT.btnExpandeClick(Sender: TObject);
begin
  inherited;
  dxTreeList.FullExpand;
end;

procedure TfrmConfereRegraMT.btnContraiClick(Sender: TObject);
begin
  inherited;
  dxTreeList.FullCollapse;
end;

procedure TfrmConfereRegraMT.MontaResultado;
var
  Node, NodeChild : TdxTreeListNode;
  iIdAnt : integer;
begin
  inherited;
  dxTreeList.ClearNodes;

  iIdAnt := -1;

  cdsResult.First;
  Node := nil;

  while not cdsResult.Eof do
  begin

    if iIdAnt <> cdsResultIDSPCCONSISTE.AsInteger then
    begin
      Node := dxTreeList.Add;
      Node.Strings[0]    := cdsResultDESCRICAO.AsString;
      Node.Strings[1]    := cdsResultCONTAS.AsString;
      Node.Strings[2]    := FormatFloat( '#,#0.00', cdsResultSALDOREGRA.AsFloat );
      Node.ImageIndex    := iff( cdsResultSALDOREGRA.AsFloat = 0, 0, 1 );
      Node.SelectedIndex := Node.ImageIndex;
    end;

    NodeChild := Node.AddChild;
    NodeChild.Strings[0]    := cdsResultPLACONTA.AsString;
    NodeChild.Strings[2]    := FormatFloat( '#,#0.00', cdsResultSALDOCONTA.AsFloat );
    NodeChild.ImageIndex    := -1;
    NodeChild.SelectedIndex := NodeChild.ImageIndex;

    iIdAnt := cdsResultIDSPCCONSISTE.AsInteger;

    cdsResult.Next;
  end;

  if not bHaInconsistencia then
  begin
    pnlTxtResult.Font.Color := clBlue;
    pnlTxtResult.Caption := 'Nenhuma inconsistência foi encontrada.'
  end
  else
  begin
    pnlTxtResult.Font.Color := clMaroon;
    pnlTxtResult.Caption := 'Foram encontradas inconsistências.'
  end;

  cdsResult.Filtered := False;
end;

procedure TfrmConfereRegraMT.bbtnCancelarClick(Sender: TObject);
begin
  inherited;
  cdsResult.Close;
  pnlFiltro.Enabled := True;
  bbtnImprimir.Enabled := False;
end;

procedure TfrmConfereRegraMT.bbtnImprimirClick(Sender: TObject);
begin
  inherited;
  if CmParamReport.Execute then
  begin
    ppDetailBand.Visible      := ( CmParamReport.ParamByName('rbTipo').AsString = 'D' );
    ppGroupFooterBand.Visible := ( CmParamReport.ParamByName('rbTipo').AsString = 'D' );

    if CmParamReport.ParamByName('rbRegras').AsString = 'T' then
    begin
      cdsResult.Filtered := False;
      cdsResult.Filter := '';
    end
    else
      if CmParamReport.ParamByName('rbRegras').AsString = 'I' then
      begin
        cdsResult.Filtered := True;
        cdsResult.Filter := 'SALDOREGRA<>0';
      end
      else
      begin
        cdsResult.Filtered := True;
        cdsResult.Filter := 'SALDOREGRA=0';
      end;

    TFrmPreview.CreateModalPreview( Application, ppReport, 'Consistência de Regras - Relatório');
  end;
end;

procedure TfrmConfereRegraMT.lblTipoPrint(Sender: TObject);
begin
  inherited;
  lblTipo.Text := 'Relatório ';
end;

procedure TfrmConfereRegraMT.lblPExercicioPrint(Sender: TObject);
begin
  inherited;
  lblPExercicio.Caption := dblkExercicio.Text;
end;

procedure TfrmConfereRegraMT.lblPPeriodoPrint(Sender: TObject);
begin
  inherited;
  lblPPeriodo.Caption := dblkPeriodo.Text;
end;

procedure TfrmConfereRegraMT.lblPPatrocinadoraPrint(Sender: TObject);
begin
  inherited;
  lblPPatrocinadora.Caption := ObterSelecionados(cdsPatro, 'NOME');
end;

procedure TfrmConfereRegraMT.lblPPlanoPrint(Sender: TObject);
begin
  inherited;
  lblPPlano.Caption := ObterSelecionados(cdsPlanoPrev, 'NOME');

end;

procedure TfrmConfereRegraMT.lblPPResultPrint(Sender: TObject);
begin
  inherited;
  lblPPResult.Caption := '- ' + pnlTxtResult.Caption;
end;

procedure TfrmConfereRegraMT.ppSaldoRegraPrint(Sender: TObject);
begin
  inherited;
  if cdsResultSALDOREGRA.AsFloat = 0 then
    ppSaldoRegra.Font.Style := []
  else
    ppSaldoRegra.Font.Style := [fsBold];
end;

procedure TfrmConfereRegraMT.FormShow(Sender: TObject);
begin
  inherited;
  sqlPlanoPrev.Open;
  TwwClientDataSet(CdsPlanoPrev).ControlType.Add('MARCA;CheckBox;S;N');
  sqlPatro.Open;
  TwwClientDataSet(CdsPatro).ControlType.Add('MARCA;CheckBox;S;N');

  pgcPatroPlanoResult.ActivePage := tabRegras
end;

procedure TfrmConfereRegraMT.pgcPatroPlanoResultChange(Sender: TObject);
begin
  inherited;
  if pgcPatroPlanoResult.ActivePage = tabResultado then
     bbtnConfirmarClick(Sender);
end;

function TfrmConfereRegraMT.ObterSelecionados(
  const cdsLista: TwwClientDataSet; const sFieldName: string): string;
begin
   Result := '';
   cdsLista.First;
   while not cdsLista.Eof do
   begin
      if cdsLista.FieldByName('MARCA').AsString = 'S' then
      begin
      if Result = '' then
         Result := cdsLista.FieldByName(sFieldName).AsString
      else
         Result := Result + ',' + cdsLista.FieldByName(sFieldName).AsString;
      end;
      cdsLista.Next;
   end;
end;

procedure TfrmConfereRegraMT.dblkPeriodoChange(Sender: TObject);
var
  ListItem : TListItem;
  iIdAnt : integer;
  wYear, wMonth, wDay: Word;
  sContas : string;

  dData: TDateTime;
begin
  inherited;
  // Ricardo A. SOL 131939 KTN 755306
  ListView.Items.Clear;

  if dblkPeriodo.Text = '' then
    Exit;

  wYear := StrToInt( dblkExercicio.Text );
  wMonth := cdsPeriodo.FieldByName('PERNUMERO').AsInteger;
  wDay := MonthDays[ IsLeapYear( wYear ), wMonth ];
  dData := EncodeDate( wYear, wMonth, wDay );

  cdsSPCConsiste.Data := CtrlSPCConsiste.SelecionaItemSpcConsisteRegra( dData );

  iIdAnt   := -1;
  sContas  := '';
  ListItem := nil;

  cdsSPCConsiste.First;
  while not cdsSPCConsiste.Eof do
  begin

    if cdsSPCConsiste.FieldByName('IDSPCCONSISTE').AsInteger <> iIdAnt then
    begin

      if ListItem <> nil then
        ListItem.SubItems.Add( sContas );
      ListItem := ListView.Items.Add;
      ListItem.Caption := cdsSPCConsiste.FieldByName('DESCRICAO').AsString;
      ListItem.SubItems.Add( cdsSPCConsiste.FieldByName('IDSPCCONSISTE').AsString );
      sContas := '(' + Mascara(
       cdsSPCConsiste.FieldByName('PLACONTA').AsString ) + ')';
      iIdAnt := cdsSPCConsiste.FieldByName('IDSPCCONSISTE').AsInteger;
    end
    else
      sContas := sContas + ' + (' + Mascara(
       cdsSPCConsiste.FieldByName('PLACONTA').AsString ) + ')';

    cdsSPCConsiste.Next;

  end;
  if Assigned( ListItem ) then
    ListItem.SubItems.Add( sContas );
  // FIM Ricardo A. SOL 131939 KTN 755306
end;

end.
