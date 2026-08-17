unit fRoteirosExecutados;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  FSairAjuda, IvDictio, IvMulti, IvEMulti, MAHlpBtn, StdCtrls, Buttons,
  TB97Tlbr, TB97, ExtCtrls, ImgList, fExecucaoRoteiros, TB97Ctls,
  wwdbdatetimepicker, CMDateTimePicker, fTelaAut, wwdblook, dBaseDados,
  uSistema, CMDBLookupCombo, Db, DBClient, uCMClientDataSet, uCtrlAtivo,
  uMensErro, Grids, Wwdbigrd, Wwdbgrid, JCLSysUtils, uCtrlCpExecRot,
  fResultExecucao;

type
  TfrmRoteirosExecutados = class(TfrmSairAjuda)
    ImlPadrao: TImageList;
    Dock972: TDock97;
    Toolbar971: TToolbar97;
    sbtnInserir: TToolbarButton97;
    sbtnRoteiros: TToolbarButton97;
    sbtnApagar: TToolbarButton97;
    pnlDados: TPanel;
    pnlFiltro: TPanel;
    lblDataInicial: TLabel;
    lblDataFinal: TLabel;
    lblAtivo: TLabel;
    dtDe: TCMDateTimePicker;
    dtAte: TCMDateTimePicker;
    btnConsultar: TBitBtn;
    CdsAtivo: TCMClientDataSet;
    dblkpAtivo: TCMDBLookupCombo;
    pnlRoteirosExecutados: TPanel;
    frpRoteirosExecutados: TGroupBox;
    dbgrdRoteirosExecutados: TwwDBGrid;
    dtsRoteirosExecutados: TDataSource;
    cdsRoteirosExecutados: TCMClientDataSet;
    cdsUltExecucao: TCMClientDataSet;
    ToolbarSep971: TToolbarSep97;
    procedure sbtnInserirClick(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure FormDestroy(Sender: TObject);
    procedure btnConsultarClick(Sender: TObject);
    procedure cdsRoteirosExecutadosAfterOpen(DataSet: TDataSet);
    procedure sbtnApagarClick(Sender: TObject);
    procedure sbtnRoteirosClick(Sender: TObject);
    procedure dbgrdRoteirosExecutadosDblClick(Sender: TObject);
    procedure cdsRoteirosExecutadosAfterClose(DataSet: TDataSet);
    procedure dbgrdRoteirosExecutadosCalcCellColors(Sender: TObject;
      Field: TField; State: TGridDrawState; Highlight: Boolean;
      AFont: TFont; ABrush: TBrush);
    procedure cdsRoteirosExecutadosAfterScroll(DataSet: TDataSet);
  private
    CtrlCpExecRot : TCtrlCpExecRot;
    CtrlAtivo     : TCtrlAtivo;
  public
    procedure MsgErro( sMsg : string );
  end;

var
  frmRoteirosExecutados: TfrmRoteirosExecutados;

implementation

{$R *.DFM}

procedure TfrmRoteirosExecutados.sbtnInserirClick(Sender: TObject);
begin
  inherited;
  frmExecutarRoteiros := TfrmExecutarRoteiros.Create( Self );
  try
    if frmExecutarRoteiros.ShowModal = mrOk then
    begin
      dblkpAtivo.LookupValue := frmExecutarRoteiros.dblkpAtivo.LookupValue;
      dtDe.Date              := frmExecutarRoteiros.dtDe.Date;
      dtAte.Date             := frmExecutarRoteiros.dtAte.Date;
      btnConsultarClick( nil );
    end;
  finally
    frmExecutarRoteiros.Free;
  end;
end;

procedure TfrmRoteirosExecutados.FormCreate(Sender: TObject);
begin
  inherited;
  CtrlCpExecRot := TCtrlCpExecRot.Create;
  CtrlCpExecRot.Initialize( DtmBaseDados.dbBaseDados, True, Sistema.ConnectionType,
   Sistema.ConnectionSide, Sistema.AppRemoteServer, True, MsgErro );


  CtrlCpExecRot.iIdUsuario   := Sistema.IdUsuario;
  CtrlCpExecRot.iIdEmpresa   := Sistema.IdEmpresa;
  CtrlCpExecRot.sNomeUsuario := Sistema.NomeUsuario;

  CtrlAtivo := TCtrlAtivo.Create;
  CtrlAtivo.InitializeAs( CtrlCpExecRot );

  CdsAtivo.Data := CtrlAtivo.CarregaAtivo;

  cdsUltExecucao.Data := CtrlCpExecRot.RecuperaUltimaExecucao;

  btnConsultarClick( nil );
end;

procedure TfrmRoteirosExecutados.MsgErro(sMsg: string);
begin
  MsgDlg( sMsg, 'Atenção', mtError, [mbOK], 0 );
end;

procedure TfrmRoteirosExecutados.FormDestroy(Sender: TObject);
begin
  CtrlCpExecRot.Free;
  CtrlAtivo.Free;
  inherited;
end;

procedure TfrmRoteirosExecutados.btnConsultarClick(Sender: TObject);
begin
  inherited;
  cdsRoteirosExecutados.Data := CtrlCpExecRot.ConsultaExecRot(
   0,
   StrToIntDef( dblkpAtivo.LookupValue, 0 ),
   Iff( dtDe.Text <> '', dtDe.Date, 0 ),
   Iff( dtAte.Text <> '', dtAte.Date, 0 ) );
end;

procedure TfrmRoteirosExecutados.cdsRoteirosExecutadosAfterOpen( DataSet : TDataSet );
begin
  inherited;
  TFloatField( DataSet.FieldByName('DTREF') ).DisplayFormat      := 'dd/mm/yyyy';
  TFloatField( DataSet.FieldByName('DTEXECUCAO') ).DisplayFormat := 'dd/mm/yyyy';

  sbtnApagar.Enabled   := not cdsRoteirosExecutados.IsEmpty;
  sbtnRoteiros.Enabled := not cdsRoteirosExecutados.IsEmpty;
end;

procedure TfrmRoteirosExecutados.sbtnApagarClick(Sender: TObject);
begin
  inherited;
  if cdsRoteirosExecutados.IsEmpty then exit;
  if MsgDlg( 'Deseja excluir a execução de roteiro selecionada?', 'Confirmação', mtConfirmation, [mbYes,mbNo], 0 ) = mrYes then
  begin
    if CtrlCpExecRot.ExcluiExecRot( cdsRoteirosExecutados.FieldByName('IDCPEXECROT').AsInteger ) then
      btnConsultarClick( nil );
  end;
end;

procedure TfrmRoteirosExecutados.sbtnRoteirosClick(Sender: TObject);
begin
  inherited;
  if cdsRoteirosExecutados.IsEmpty then exit;
  TfrmResultExecucao.Modo( 4 );
  frmResultExecucao := TfrmResultExecucao.Create( Self );
  try
    frmResultExecucao.cdsExecRot.Data  := CtrlCpExecRot.ConsultaExecRot(
     cdsRoteirosExecutados.FieldByName('IDCPEXECROT').AsInteger, 0, 0, 0 );
    frmResultExecucao.ShowModal;
  finally
    frmResultExecucao.Free;
  end;
end;

procedure TfrmRoteirosExecutados.dbgrdRoteirosExecutadosDblClick(
  Sender: TObject);
begin
  inherited;
  sbtnRoteirosClick( nil );
end;

procedure TfrmRoteirosExecutados.cdsRoteirosExecutadosAfterClose( DataSet : TDataSet );
begin
  inherited;
  sbtnApagar.Enabled   := False;
  sbtnRoteiros.Enabled := False;
end;

procedure TfrmRoteirosExecutados.dbgrdRoteirosExecutadosCalcCellColors(
  Sender: TObject; Field: TField; State: TGridDrawState;
  Highlight: Boolean; AFont: TFont; ABrush: TBrush);
begin
  inherited;
  if not ( gdSelected in State ) then
    if ( cdsRoteirosExecutados.RecNo mod 2 ) = 0 then
      ABrush.Color:= $00C0FFFF;
end;

procedure TfrmRoteirosExecutados.cdsRoteirosExecutadosAfterScroll(
  DataSet: TDataSet);
begin
  inherited;
  //
end;

end.
