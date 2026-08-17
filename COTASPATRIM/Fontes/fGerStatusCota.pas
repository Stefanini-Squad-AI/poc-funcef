unit fGerStatusCota;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  FSairAjuda, StdCtrls, wwdbdatetimepicker, CMDateTimePicker, IvDictio,
  IvMulti, IvEMulti, MAHlpBtn, Buttons, TB97Tlbr, TB97, ExtCtrls,
  uCmSqlParams, Db, Wwdatsrc, DBClient, uCMClientDataSet, Grids, DBGrids,
  ImgList, TB97Ctls, Wwdbigrd, Wwdbgrid, Menus, math, ComCtrls, TeEngine,
  Series, TeeProcs, Chart, DBChart, wwdblook, CMDBLookupCombo,
  uCtrlAtivo, dBaseDados, uSistema, uMensErro, fCalculoCota, uCtrlCpValorCota,
  JCLSysUtils, fCotasCalculadas;

type
  TfrmGerStatusCota = class(TfrmSairAjuda)
    cdsCotas: TCMClientDataSet;
    dtsCotas: TwwDataSource;
    CdsAtivo: TCMClientDataSet;
    pnlDados: TPanel;
    pnlFiltro: TPanel;
    lblDataInicial: TLabel;
    lblDataFinal: TLabel;
    lblAtivo: TLabel;
    dtDe: TCMDateTimePicker;
    dtAte: TCMDateTimePicker;
    btnConsultar: TBitBtn;
    dblkpAtivo: TCMDBLookupCombo;
    pnlRoteirosExecutados: TPanel;
    PageControl: TPageControl;
    tabCotas: TTabSheet;
    tabEvolucao: TTabSheet;
    DBChart: TDBChart;
    Series1: TLineSeries;
    cdsUltCota: TCMClientDataSet;
    ImlPadrao: TImageList;
    Dock972: TDock97;
    Toolbar971: TToolbar97;
    sbtnInserir: TToolbarButton97;
    sbtnApagar: TToolbarButton97;
    dbgrdCotas: TwwDBGrid;
    ToolbarSep971: TToolbarSep97;
    sbtnDetalhes: TToolbarButton97;
    sbtnDivulgar: TToolbarButton97;
    lblSituacao: TLabel;
    cmbSituacao: TComboBox;
    sbtnSolicitarDivulgacao: TToolbarButton97;
    sbtnRecalcular: TToolbarButton97;
    procedure dbgrdCotasCalcCellColors(Sender: TObject; Field: TField;
      State: TGridDrawState; Highlight: Boolean; AFont: TFont;
      ABrush: TBrush);
    procedure FormCreate(Sender: TObject);
    procedure FormDestroy(Sender: TObject);
    procedure btnConsultarClick(Sender: TObject);
    procedure sbtnInserirClick(Sender: TObject);
    procedure cdsCotasAfterOpen(DataSet: TDataSet);
    procedure sbtnDetalhesClick(Sender: TObject);
    procedure dbgrdCotasDblClick(Sender: TObject);
    procedure cdsCotasAfterClose(DataSet: TDataSet);
    procedure cdsCotasAfterScroll(DataSet: TDataSet);
    procedure sbtnDivulgarClick(Sender: TObject);
    procedure sbtnApagarClick(Sender: TObject);
    procedure sbtnSolicitarDivulgacaoClick(Sender: TObject);
    procedure sbtnRecalcularClick(Sender: TObject);
  private
    bMaximizado : boolean;

    iHeight : integer;
    iWidth  : integer;

    CtrlAtivo       : TCtrlAtivo;
    CtrlCpValorCota : TCtrlCpValorCota;

    procedure WMSysCommand(var Msg: TWMSysCommand); message WM_SYSCOMMAND;

    procedure MaximizaJanela;
    procedure RestauraJanela;

  public
    procedure MsgErro( sMsg : string );
  end;

var
  frmGerStatusCota: TfrmGerStatusCota;

implementation

{$R *.DFM}

procedure TfrmGerStatusCota.dbgrdCotasCalcCellColors(Sender: TObject;
  Field: TField; State: TGridDrawState; Highlight: Boolean; AFont: TFont;
  ABrush: TBrush);
begin
  inherited;
  if not ( gdSelected in State ) then
    if ( cdsCotas.RecNo mod 2 ) = 0 then
      ABrush.Color:= $00C0FFFF;
end;

procedure TfrmGerStatusCota.FormCreate(Sender: TObject);
begin
  inherited;
  CtrlCpValorCota := TCtrlCpValorCota.Create;
  CtrlCpValorCota.Initialize( DtmBaseDados.dbBaseDados, True, Sistema.ConnectionType,
   Sistema.ConnectionSide, Sistema.AppRemoteServer, True, MsgErro );

  CtrlCpValorCota.iIdUsuario   := Sistema.IdUsuario;
  CtrlCpValorCota.iIdEmpresa   := Sistema.IdEmpresa;
  CtrlCpValorCota.sNomeUsuario := Sistema.NomeUsuario;

  CtrlAtivo := TCtrlAtivo.Create;
  CtrlAtivo.InitializeAs( CtrlCpValorCota );

  CdsAtivo.Data := CtrlAtivo.CarregaAtivo;

  cdsUltCota.Data := CtrlCpValorCota.RecuperaUltimaCota;

  iHeight := Height;
  iWidth  := Width ;

  bMaximizado := False;

  cmbSituacao.ItemIndex := 0;

  btnConsultarClick( nil );
end;

procedure TfrmGerStatusCota.FormDestroy(Sender: TObject);
begin
  CtrlCpValorCota.Free;
  CtrlAtivo.Free;
  inherited;
end;

procedure TfrmGerStatusCota.MsgErro(sMsg: string);
begin
  MsgDlg( sMsg, 'Atenção', mtError, [mbOK], 0 );
end;

procedure TfrmGerStatusCota.btnConsultarClick(Sender: TObject);
begin
  inherited;
  cdsCotas.Data := CtrlCpValorCota.ConsultaCotas(
   0,
   StrToIntDef( dblkpAtivo.LookupValue, 0 ),
   Iff( dtDe.Text <> '', dtDe.Date, 0 ),
   Iff( dtAte.Text <> '', dtAte.Date, 0 ),
   cmbSituacao.ItemIndex );
end;

procedure TfrmGerStatusCota.sbtnInserirClick(Sender: TObject);
begin
  inherited;
  frmCalculoCota := TfrmCalculoCota.Create( Self );
  try
    if frmCalculoCota.ShowModal = mrOk then
    begin
      dblkpAtivo.LookupValue := frmCalculoCota.dblkpAtivo.LookupValue;
      dtAte.Date             := frmCalculoCota.dtAte.Date;
      cmbSituacao.ItemIndex  := 0;
      btnConsultarClick( nil );
    end;
  finally
    frmCalculoCota.Free;
  end;
end;

procedure TfrmGerStatusCota.cdsCotasAfterOpen(DataSet: TDataSet);
begin
  inherited;
  TFloatField( DataSet.FieldByName('DTCOTA') ).DisplayFormat     := 'dd/mm/yyyy';
  TFloatField( DataSet.FieldByName('PATRIMONIO') ).DisplayFormat := '#,##0.00';
  TFloatField( DataSet.FieldByName('TOTALCOTAS') ).DisplayFormat := '#,##0.000000';
  TFloatField( DataSet.FieldByName('VALOR') ).DisplayFormat      := '#,##0.000000';

  sbtnDetalhes.Enabled := not cdsCotas.IsEmpty;
end;

procedure TfrmGerStatusCota.WMSysCommand(var Msg: TWMSysCommand);
begin
  if ( Msg.CmdType = SC_MAXIMIZE ) or( Msg.CmdType = 61490 ) then
  begin
    if bMaximizado then
      RestauraJanela
    else
      MaximizaJanela;
    exit;
  end;
  inherited;
end;

procedure TfrmGerStatusCota.MaximizaJanela;
begin
  Height := Application.MainForm.ClientHeight - 60;
  Width  := Application.MainForm.ClientWidth - 6;
  Top    := 0;
  Left   := 0;
  bMaximizado := True;
end;

procedure TfrmGerStatusCota.RestauraJanela;
begin
  Height := iHeight;
  Width  := iWidth;
  Top    := round( ( ( Application.MainForm.ClientHeight - 60 ) - Height ) / 2 );
  Left   := round( ( ( Application.MainForm.ClientWidth  - 6  ) - Width  ) / 2 );
  bMaximizado := False;
end;

procedure TfrmGerStatusCota.sbtnDetalhesClick(Sender: TObject);
begin
  inherited;
  if cdsCotas.IsEmpty then exit;
  TfrmCotasCalculadas.Modo( 2 );
  frmCotasCalculadas := TfrmCotasCalculadas.Create( Self );
  try
    frmCotasCalculadas.cdsValorCota.Data  := CtrlCpValorCota.ConsultaCotas(
     cdsCotas.FieldByName('IDCPVALORCOTA').AsInteger, 0, 0, 0, 0 );
    frmCotasCalculadas.ShowModal;
  finally
    frmCotasCalculadas.Free;
  end;
end;

procedure TfrmGerStatusCota.dbgrdCotasDblClick(Sender: TObject);
begin
  inherited;
  sbtnDetalhesClick( nil );
end;

procedure TfrmGerStatusCota.cdsCotasAfterClose(DataSet: TDataSet);
begin
  inherited;
  sbtnDetalhes.Enabled := False;
end;

procedure TfrmGerStatusCota.cdsCotasAfterScroll(DataSet: TDataSet);
begin
  inherited;
  sbtnApagar.Enabled              := ( cdsCotas.FieldByName('FLGSTATUS').AsString = 'C' ) or
                                     ( ( cdsCotas.FieldByName('FLGSTATUS').AsString = 'P' ) and ( cdsCotas.FieldByName('FLGOK').AsString = 'N' ) ) or
                                     ( ( cdsCotas.FieldByName('FLGSTATUS').AsString = 'N' ) and ( cdsCotas.FieldByName('FLGOK').AsString = 'N' ) );
  sbtnRecalcular.Enabled          := ( cdsCotas.FieldByName('FLGSTATUS').AsString = 'C' ) or
                                     ( ( cdsCotas.FieldByName('FLGSTATUS').AsString = 'P' ) and ( cdsCotas.FieldByName('FLGOK').AsString = 'R' ) ) or
                                     ( cdsCotas.FieldByName('FLGSTATUS').AsString = 'D' ) or
                                     ( cdsCotas.FieldByName('FLGSTATUS').AsString = 'R' ) ;
  sbtnSolicitarDivulgacao.Enabled := ( cdsCotas.FieldByName('FLGSTATUS').AsString = 'C' );
  sbtnDivulgar.Enabled            := ( cdsCotas.FieldByName('FLGSTATUS').AsString = 'P' ) and ( cdsCotas.FieldByName('FLGOK').AsString = 'S' ) ;
end;

procedure TfrmGerStatusCota.sbtnDivulgarClick(Sender: TObject);
begin
  inherited;
  if MsgDlg( 'Deseja divulgar a cota selecionada?', 'Confirmação', mtConfirmation, [mbYes,mbNo], 0 ) = mrYes then
  begin
    if CtrlCpValorCota.DivulgaCota( cdsCotas.FieldByName('IDCPVALORCOTA').AsInteger ) then
      btnConsultarClick( nil );
  end;
end;

procedure TfrmGerStatusCota.sbtnApagarClick(Sender: TObject);
begin
  inherited;
  if MsgDlg( 'Deseja excluir a cota selecionada?', 'Confirmação', mtConfirmation, [mbYes,mbNo], 0 ) = mrYes then
  begin
    if CtrlCpValorCota.ExcluiCota( cdsCotas.FieldByName('IDCPVALORCOTA').AsInteger ) then
      btnConsultarClick( nil );
  end;
end;

procedure TfrmGerStatusCota.sbtnSolicitarDivulgacaoClick(Sender: TObject);
begin
  inherited;
  if MsgDlg( 'Deseja solicitar a divulgação da cota selecionada?', 'Confirmação', mtConfirmation, [mbYes,mbNo], 0 ) = mrYes then
  begin
    if CtrlCpValorCota.SolicitaDivulgacao( cdsCotas.FieldByName('IDCPVALORCOTA').AsInteger ) then
      btnConsultarClick( nil );
  end;
end;

procedure TfrmGerStatusCota.sbtnRecalcularClick(Sender: TObject);
begin
  inherited;
  //
end;

end.
