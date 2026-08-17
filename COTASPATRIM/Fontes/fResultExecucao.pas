unit fResultExecucao;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  FOkCancelar, IvDictio, IvMulti, IvEMulti, MAHlpBtn, StdCtrls, Buttons,
  TB97Tlbr, TB97, ExtCtrls, fcOutlookList, fcButton, fcImgBtn, fcShapeBtn,
  fcClearPanel, fcButtonGroup, fcOutlookBar, ComCtrls, Db, DBClient,
  uCMClientDataSet, DBCtrls, wwdblook, CMDBLookupCombo, wwdbdatetimepicker,
  CMDateTimePicker, Mask, Grids, Wwdbigrd, Wwdbgrid, uCtrlCpExecRot,
  CmParamReport, uCtrlCpRotApurado, uSistema, dBaseDados, uMensErro,
  fConsRoteiros, uCtrlRoteiros, JCLSysUtils, uCtrlAtivo, fRADConsultaDoc;

type
  TfrmResultExecucao = class(TfrmOkCancelar)
    pnlApuracoes: TPanel;
    pnlDetalhes: TPanel;
    StatusBar: TStatusBar;
    pnlTopDetalhes: TPanel;
    cdsRoteiros: TCMClientDataSet;
    cdsEntradas: TCMClientDataSet;
    cdsMovimentacoes: TCMClientDataSet;
    SplitterH: TSplitter;
    pnlCorpoDetalhes: TPanel;
    pnlDetRoteiro: TPanel;
    lblData: TLabel;
    dtApuracao: TCMDateTimePicker;
    lblRoteiro: TLabel;
    lblUsuario: TLabel;
    dbedtUsuario: TDBEdit;
    lblSituacao: TLabel;
    dbedtSituacao: TDBEdit;
    Label1: TLabel;
    dtExecucao: TCMDateTimePicker;
    lblObservacao: TLabel;
    dbmemObservacao: TDBMemo;
    dbedtNomeRoteiro: TDBEdit;
    dtsRoteiros: TDataSource;
    pnlDados: TPanel;
    pnlMovimentacoes: TPanel;
    pnlTopMovimentacoes: TPanel;
    dbgrdMovimentacoes: TwwDBGrid;
    SplitterV: TSplitter;
    dtsEntradas: TDataSource;
    dtsMovimentacoes: TDataSource;
    dbedtDocumento: TDBEdit;
    Label3: TLabel;
    pnlEntradas: TPanel;
    pgctrlEntradas: TPageControl;
    tabEntradas: TTabSheet;
    tabSQLEntrada: TTabSheet;
    dbgrdEntradas: TwwDBGrid;
    memSQL: TMemo;
    pnlLegenda: TPanel;
    Shape1: TShape;
    Label4: TLabel;
    Label5: TLabel;
    Shape2: TShape;
    bbtnConsultar: TBitBtn;
    Label6: TLabel;
    Shape3: TShape;
    cdsExecRot: TCMClientDataSet;
    pnlRoteiros: TPanel;
    dbgrdRoteiros: TwwDBGrid;
    pnlTopApuracoes: TPanel;
    pnlExecucao: TPanel;
    lblAtivo: TLabel;
    dblkpAtivo: TCMDBLookupCombo;
    lblDataInicial: TLabel;
    cmbData: TComboBox;
    cdsAtivo: TCMClientDataSet;
    btnDetalhes: TSpeedButton;
    procedure FormCreate(Sender: TObject);
    procedure cdsEntradasAfterOpen(DataSet: TDataSet);
    procedure cdsMovimentacoesAfterOpen(DataSet: TDataSet);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure cdsRoteirosAfterScroll(DataSet: TDataSet);
    procedure dbgrdRoteirosTitleButtonClick(Sender: TObject;
      AFieldName: String);
    procedure dbgrdRoteirosDrawDataCell(Sender: TObject; const Rect: TRect;
      Field: TField; State: TGridDrawState);
    procedure bbtnConsultarClick(Sender: TObject);
    procedure cdsRoteirosAfterOpen(DataSet: TDataSet);
    procedure FormShow(Sender: TObject);
    procedure FormDestroy(Sender: TObject);
    procedure dblkpAtivoCloseUp(Sender: TObject; LookupTable,
      FillTable: TDataSet; modified: Boolean);
    procedure cmbDataChange(Sender: TObject);
    procedure btnDetalhesClick(Sender: TObject);
  private

    CtrlCpRotApurado : TCtrlCpRotApurado;
    CtrlRoteiro      : TCtrlRoteiro;
    CtrlAtivo        : TCtrlAtivo;

    bAscending: boolean;
    bMaximizado : boolean;

    iHeight : integer;
    iWidth  : integer;

    procedure MaximizaJanela;
    procedure RestauraJanela;

    procedure WMSysCommand(var Msg: TWMSysCommand); message WM_SYSCOMMAND;

  public

    procedure PreencheStatusBar;

    procedure SelecionaExecucao;
    procedure SelecionaRoteiro;
    procedure OrdenaGrid( sColunaClicada : string );

    procedure MsgErro( sMsg : string );

    procedure ModoDialog;

    //Modo: 1 = Consulta; 2 = Simulação; 3 = Resultados de execução; 4 = Visualização na janela de execuções
    class procedure Modo( _iModo : integer );
  end;

var
  frmResultExecucao: TfrmResultExecucao;

implementation

var
  iModo : integer;

{$R *.DFM}

{ TfrmResultExecucao }

procedure TfrmResultExecucao.FormCreate(Sender: TObject);
begin
  inherited;

  CtrlCpRotApurado := TCtrlCpRotApurado.Create;
  CtrlCpRotApurado.Initialize( DtmBaseDados.dbBaseDados, True, Sistema.ConnectionType,
   Sistema.ConnectionSide, Sistema.AppRemoteServer, True, MsgErro );

  CtrlRoteiro := TCtrlRoteiro.Create;
  CtrlRoteiro.InitializeAs( CtrlCpRotApurado );

  CtrlAtivo := TCtrlAtivo.Create;
  CtrlAtivo.InitializeAs( CtrlCpRotApurado );

  StatusBar.Panels[0].Text := '';

  if iModo = 1 then
  begin
    frmConsRoteiros := TfrmConsRoteiros.Create( Self );
    frmConsRoteiros.cdsRoteiro.Data := CtrlRoteiro.LookupRoteiros;
    frmConsRoteiros.CdsAtivo.Data   := CtrlAtivo.CarregaAtivo;
    bbtnConsultar.Click;
    FormStyle   := fsMDIChild;
    Visible     := True;
    BorderIcons := BorderIcons + [biMinimize];
  end;

  iHeight := Height;
  iWidth  := Width ;
  bMaximizado := False;

  pgctrlEntradas.ActivePage := tabEntradas;
  bAscending := True;

  bbtnConsultar.Visible  := ( iModo = 1 );
  tb97Fundo.Visible      := ( iModo in [1, 2, 4] );
  tb97OkCancelar.Visible := ( iModo = 3 );

  case iModo of
   1 : Caption := 'Consulta roteiros executados';
   2 : Caption := 'Resultado da simulação de execução de roteiro';
   3 : Caption := 'Resultado da execução de roteiros';
   4 : Caption := 'Consulta roteiros executados';
  end;
end;

procedure TfrmResultExecucao.SelecionaRoteiro;
begin
  memSQL.Text := '';

  if not cdsRoteiros.Active then exit;

  if iModo in [ 1, 4 ] then
  begin
    cdsEntradas.Close;
    cdsEntradas.Data := CtrlCpRotApurado.DadosRotAprEnt( cdsRoteiros.FieldByName('IDCPROTAPURADO').AsInteger );
    memSQL.Text := MontaSQLEntrada( cdsEntradas );
    cdsMovimentacoes.Close;
    cdsMovimentacoes.Data := CtrlCpRotApurado.DadosRotAprMov( cdsRoteiros.FieldByName('IDCPROTAPURADO').AsInteger );
  end
  else
  begin
    if cdsEntradas.Active then
    begin
      cdsEntradas.Filtered := False;
      cdsEntradas.Filter := 'IDCPROTAPURADO = ' + Iff( cdsRoteiros.FieldByName('IDCPROTAPURADO').AsString <> '', cdsRoteiros.FieldByName('IDCPROTAPURADO').AsString, '0' );
      cdsEntradas.Filtered := True;
      cdsEntradas.First;
      memSQL.Text := MontaSQLEntrada( cdsEntradas );
    end;

    if cdsMovimentacoes.Active then
    begin
      cdsMovimentacoes.Filtered := False;
      cdsMovimentacoes.Filter := 'IDCPROTAPURADO = ' + Iff( cdsRoteiros.FieldByName('IDCPROTAPURADO').AsString <> '', cdsRoteiros.FieldByName('IDCPROTAPURADO').AsString, '0' );
      cdsMovimentacoes.Filtered := True;
      cdsMovimentacoes.First;
    end;
  end;

  btnDetalhes.Enabled := not cdsRoteiros.FieldByName('CODDOCUMENTO').IsNull;
end;

procedure TfrmResultExecucao.cdsEntradasAfterOpen(DataSet: TDataSet);
begin
  inherited;
  TFloatField( DataSet.FieldByName('VALOR') ).DisplayFormat := '#,##0.000000';
end;

procedure TfrmResultExecucao.cdsMovimentacoesAfterOpen(DataSet: TDataSet);
begin
  inherited;
  TFloatField( DataSet.FieldByName('VALOR') ).DisplayFormat := '#,##0.000000';
end;

procedure TfrmResultExecucao.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
  inherited;
  cdsEntradas.Filtered := False;
  cdsEntradas.Filter := '';
  cdsMovimentacoes.Filtered := False;
  cdsMovimentacoes.Filter := '';
end;

procedure TfrmResultExecucao.cdsRoteirosAfterScroll(DataSet: TDataSet);
begin
  inherited;
  SelecionaRoteiro;
end;

procedure TfrmResultExecucao.dbgrdRoteirosTitleButtonClick(Sender: TObject;
  AFieldName: String);
begin
  inherited;
  bAscending := not bAscending;
  OrdenaGrid( AFieldName );
end;

procedure TfrmResultExecucao.OrdenaGrid(sColunaClicada: string);
var
  IndexDef : TIndexDef;
  sCampoReal : string;
begin
  inherited;

  cdsRoteiros.IndexName := '';
  cdsRoteiros.IndexDefs.Clear;
  IndexDef := cdsRoteiros.IndexDefs.AddIndexDef;
  IndexDef.Name := IntToStr( GetTickCount );

  sCampoReal := sColunaClicada;

  if sCampoReal = 'CLASSIFEXIBICAO' then
    sCampoReal := 'CLASSIFICACAO';

  if bAscending then
  begin
    IndexDef.Fields := sCampoReal;
    IndexDef.DescFields := '';
    IndexDef.Options := [];
  end
  else
  begin
    IndexDef.Fields := sCampoReal;
    IndexDef.DescFields := sCampoReal;
    IndexDef.Options := [ixDescending];
  end;

  cdsRoteiros.IndexName := IndexDef.Name;
  cdsRoteiros.First;
end;

procedure TfrmResultExecucao.dbgrdRoteirosDrawDataCell(Sender: TObject;
  const Rect: TRect; Field: TField; State: TGridDrawState);
begin
  inherited;
  if not ( gdSelected in State ) then
  begin
    dbgrdRoteiros.Canvas.Font.Color := clBlack;
    if cdsRoteiros.FieldByName('FLGTIPOAPUR').AsString = 'M' then
      dbgrdRoteiros.Canvas.Brush.Color := $00CEFFFF
    else
      if cdsRoteiros.FieldByName('FLGTIPOAPUR').AsString = 'F' then
        dbgrdRoteiros.Canvas.Brush.Color := $00BBFFCC
      else
        dbgrdRoteiros.Canvas.Brush.Color := $00FFFFD5;
    dbgrdRoteiros.DefaultDrawDataCell( Rect, Field, State );
  end;
end;

procedure TfrmResultExecucao.ModoDialog;
begin
  Visible := False;
end;

procedure TfrmResultExecucao.WMSysCommand(var Msg: TWMSysCommand);
begin
  if iModo = 1 then
  begin
    if ( Msg.CmdType = SC_MAXIMIZE ) or( Msg.CmdType = 61490 ) then
    begin
      if bMaximizado then
        RestauraJanela
      else
        MaximizaJanela;
      exit;
    end;
  end;
  inherited;
end;

procedure TfrmResultExecucao.MaximizaJanela;
begin
  Height := Application.MainForm.ClientHeight - 60;
  Width  := Application.MainForm.ClientWidth - 6;
  Top    := 0;
  Left   := 0;
  bMaximizado := True;
end;

procedure TfrmResultExecucao.RestauraJanela;
begin
  Height := iHeight;
  Width  := iWidth;
  Top    := round( ( ( Application.MainForm.ClientHeight - 60 ) - Height ) / 2 );
  Left   := round( ( ( Application.MainForm.ClientWidth  - 6  ) - Width  ) / 2 );
  bMaximizado := False;
end;

procedure TfrmResultExecucao.bbtnConsultarClick(Sender: TObject);
begin
  inherited;
  if frmConsRoteiros.ShowModal = mrOk then
  begin
    cdsRoteiros.Data := CtrlCpRotApurado.ConsultaRotApurado(
     0,
     StrToIntDef( frmConsRoteiros.dblkpRoteiro.LookupValue, -1 ),
     0,
     StrToIntDef( frmConsRoteiros.dblkpAtivo.LookupValue, -1 ),
     iff( frmConsRoteiros.rdgrpTipoApur.ItemIndex = 0, 'M', iff( frmConsRoteiros.rdgrpTipoApur.ItemIndex = 1, 'D', iff( frmConsRoteiros.rdgrpTipoApur.ItemIndex = 2, 'F', '' ) ) ),
     Copy( frmConsRoteiros.cmbSituacao.Text, 1, 1 ),
     frmConsRoteiros.dtApuracao.DateTime,
     trim( frmConsRoteiros.edtUsuario.Text ),
     frmConsRoteiros.dtExecucao.DateTime,
     trim( frmConsRoteiros.edtNoDocumento.Text ),
     iff( frmConsRoteiros.cmbOperacao.ItemIndex = 1, 'D', iff( frmConsRoteiros.cmbOperacao.ItemIndex = 2, 'E', iff( frmConsRoteiros.cmbOperacao.ItemIndex = 3, 'P', '' ) ) ),
     StrToIntDef( frmConsRoteiros.edtNumLancto.Text, -1 ),
     trim( frmConsRoteiros.edtObs.Text )  
     );
  end;
end;

class procedure TfrmResultExecucao.Modo( _iModo : integer );
begin
  iModo := _iModo;
end;

procedure TfrmResultExecucao.cdsRoteirosAfterOpen(DataSet: TDataSet);
begin
  inherited;
  TDateTimeField( DataSet.FieldByName( 'DTAPURACAO' ) ).DisplayFormat := 'dd/mm/yyyy';
  TDateTimeField( DataSet.FieldByName( 'DTEXECUCAO' ) ).DisplayFormat := 'dd/mm/yyyy';
  PreencheStatusBar;
end;

procedure TfrmResultExecucao.FormShow(Sender: TObject);
var
  sAux : string;
begin
  inherited;
  pnlExecucao.Enabled := ( iModo = 3 );
  pnlExecucao.Visible := ( iModo > 1 );

  if iModo > 1 then
  begin
    sAux := '';
    cdsExecRot.Last;
    while not cdsExecRot.Bof do
    begin
      if sAux <> '' then sAux := sAux + ', ';
      sAux := sAux + cdsExecRot.FieldByName('IDCPATIVO').AsString;
      if cmbData.Items.IndexOf( FormatDateTime( 'dd/mm/yyyy', cdsExecRot.FieldByName('DTREF').AsDateTime ) ) < 0 then
        cmbData.Items.Add( FormatDateTime( 'dd/mm/yyyy', cdsExecRot.FieldByName('DTREF').AsDateTime ) );
      cdsExecRot.Prior;
    end;

    CdsAtivo.Data := CtrlAtivo.CarregaAtivo( sAux );

    cmbData.ItemIndex := 0;
    dblkpAtivo.LookupValue := cdsAtivo.FieldByName('IDCPATIVO').AsString;

    SelecionaExecucao;
  end
  else
    SelecionaRoteiro;
end;

procedure TfrmResultExecucao.MsgErro(sMsg: string);
begin
  MsgDlg( sMsg, 'Atenção', mtError, [mbOK], 0 );
end;

procedure TfrmResultExecucao.FormDestroy(Sender: TObject);
begin
  CtrlCpRotApurado.Free;
  CtrlRoteiro.Free;
  CtrlAtivo.Free;
  if iModo = 1 then
    frmConsRoteiros.Free;
end;

procedure TfrmResultExecucao.PreencheStatusBar;
var
  sAux : string;
begin
  sAux := '';
  sAux := IntToStr( cdsRoteiros.RecordCount ) + ' roteiro';
  if cdsRoteiros.RecordCount > 1 then sAux := sAux + 's';
  case iModo of
    1, 4 : sAux := sAux + ' encontrado';
    2    : sAux := sAux + ' simulado';
    3    : sAux := sAux + ' apurado';
  end;
  if cdsRoteiros.RecordCount > 1 then sAux := sAux + 's';
  StatusBar.Panels[0].Text := sAux + '. ';
end;

procedure TfrmResultExecucao.dblkpAtivoCloseUp(Sender: TObject;
  LookupTable, FillTable: TDataSet; modified: Boolean);
begin
  inherited;
  SelecionaExecucao;
end;

procedure TfrmResultExecucao.SelecionaExecucao;
begin
  if iModo <= 2 then exit;

  if iModo = 4 then
  begin
    cdsRoteiros.Data := CtrlCpRotApurado.ConsultaRotApurado( 0, 0,
     cdsExecRot.FieldByName('IDCPEXECROT').AsInteger, 0, '', '', 0,
     '', 0, '', '', 0, '' );
  end
  else
  begin
    cdsExecRot.First;
    cdsExecRot.Locate( 'IDCPATIVO;DTREF', VarArrayOf([dblkpAtivo.LookupValue, StrToDate( cmbData.Text ) ]), [] );

    cdsRoteiros.Filtered := False;
    cdsRoteiros.Filter := 'IDCPEXECROT = ' + cdsExecRot.FieldByName('IDCPEXECROT').AsString;
    cdsRoteiros.Filtered := True;
    cdsRoteiros.First;
  end;

  SelecionaRoteiro;
end;

procedure TfrmResultExecucao.cmbDataChange(Sender: TObject);
begin
  inherited;
  SelecionaExecucao;
end;

procedure TfrmResultExecucao.btnDetalhesClick(Sender: TObject);
var
  frmConsultaDoc : TfrmRadConsultaDoc;
begin
  inherited;
  TfrmRADConsultaDoc.SetDisparadorCapCar( False );
  frmConsultaDoc := TfrmRadConsultaDoc.Create( nil );
  try
    frmConsultaDoc.WindowState := wsNormal;
    frmConsultaDoc.BorderIcons := [biSystemMenu];
    frmConsultaDoc.SelecionarDoc( cdsRoteiros.FieldByName('CODDOCUMENTO').AsInteger, 0, False );
    frmConsultaDoc.ShowModal;
  finally
    frmConsultaDoc.Free;
  end;
end;

end.
