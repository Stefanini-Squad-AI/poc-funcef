unit FExcluiLogTabelasMT;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  FOkCancelar, StdCtrls, wwdbdatetimepicker, CMDateTimePicker, Grids,
  Wwdbigrd, Wwdbgrid, ExtCtrls, IvDictio, IvMulti, IvEMulti, MAHlpBtn,
  Buttons, TB97Tlbr, TB97, ComCtrls, Db, DBClient, uCMClientDataSet,
  uCtrlLogTabelas, uCtrlLogTabelasIndx, uCtrlRetLogTabelas, Spin;

type
  TFrmExcluiLogTabelas = class(TfrmOkCancelar)
    Panel1: TPanel;
    RgTabela: TRadioGroup;
    Panel2: TPanel;
    dbgexclui: TwwDBGrid;
    GbLimites: TGroupBox;
    dtpdataexclui: TCMDateTimePicker;
    PbExclusao: TProgressBar;
    Cds: TCMClientDataSet;
    Ds: TDataSource;
    TmrProgresso: TTimer;
    Label1: TLabel;
    SeLinhas: TSpinEdit;
    Label2: TLabel;
    BtnSeleciona: TBitBtn;
    procedure FormCreate(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure BtnSelecionaClick(Sender: TObject);
    procedure bbtnCancelarClick(Sender: TObject);
    procedure TmrProgressoTimer(Sender: TObject);
    procedure bbtnConfirmarClick(Sender: TObject);
  private
    { Private declarations }
    LogTabelas: TCtrlLogTabelas;
    LogTabelasIndx: TCtrlLogTabelasIndx;
    RetLogTabelas: TCtrlRetLogTabelas;
  public
    { Public declarations }
  end;

var
  FrmExcluiLogTabelas: TFrmExcluiLogTabelas;

implementation

{$R *.DFM}

Uses uMensErro, dBasedados, uSistema, uMidasUtil;

procedure TFrmExcluiLogTabelas.FormCreate(Sender: TObject);
begin
  inherited;
  LogTabelas := TCtrlLogTabelas.Create;
  LogTabelas.Initialize( DtmBaseDados.dbBaseDados, True, Sistema.ConnectionType,
                         Sistema.ConnectionSide, Sistema.AppRemoteServer, True );

  LogTabelasIndx := TCtrlLogTabelasIndx.Create;
  LogTabelasIndx.Initialize( DtmBaseDados.dbBaseDados, True, Sistema.ConnectionType,
                             Sistema.ConnectionSide, Sistema.AppRemoteServer, True );

  RetLogTabelas := TCtrlRetLogTabelas.Create;
  RetLogTabelas.Initialize( DtmBaseDados.dbBaseDados, True, Sistema.ConnectionType,
                            Sistema.ConnectionSide, Sistema.AppRemoteServer, True );

  DtpDataExclui.Date := Date - 31;
end;

procedure TFrmExcluiLogTabelas.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
  inherited;
  LogTabelas.Free;
  LogTabelasIndx.Free;
  RetLogTabelas.Free;
end;

procedure TFrmExcluiLogTabelas.BtnSelecionaClick(Sender: TObject);
begin
  inherited;
  Case RgTabela.ItemIndex Of
       0: Cds.Data := LogTabelas.ListaLogTabelas( 0, DtpDataExclui.Date, SeLinhas.Value );
       1: Cds.Data := LogTabelasIndx.ListaLogTabelasIndx( 0, DtpDataExclui.Date, SeLinhas.Value );
       2: Cds.Data := RetLogTabelas.ListaRetLogTabelas( 0, DtpDataExclui.Date, SeLinhas.Value );
  End;
end;

procedure TFrmExcluiLogTabelas.bbtnCancelarClick(Sender: TObject);
begin
  inherited;
  Case RgTabela.ItemIndex Of
       0: Cds.Data := LogTabelas.ListaLogTabelas( -1 );
       1: Cds.Data := LogTabelasIndx.ListaLogTabelasIndx( -1 );
       2: Cds.Data := RetLogTabelas.ListaRetLogTabelas( -1 );
  End;
end;

procedure TFrmExcluiLogTabelas.TmrProgressoTimer(Sender: TObject);
begin
  inherited;
  If PbExclusao.Position = 100 Then
     PbExclusao.Position := 0;

  PbExclusao.StepIt;
  Application.ProcessMessages;
end;

procedure TFrmExcluiLogTabelas.bbtnConfirmarClick(Sender: TObject);
begin
  inherited;
  If DtpDataExclui.Date >= ( Date - 30 ) Then Begin
     MsgDlg( 'Data Não pode ser maior que 30 dias da data de hoje!', 'Atenção', mtWarning, [mbOK], 0 );
     DtpDataExclui.SetFocus;
     Exit;
  End;

  If MessageDlg( 'Tem certeza da Exclusão?', mtConfirmation, [mbYes, mbNo], 0 ) <> mrYes Then
     Exit;

  TmrProgresso.Enabled := True;
  Application.ProcessMessages;

  Case RgTabela.ItemIndex Of
       0: LogTabelas.ApagarLogTabelas( DtpDataExclui.Date );
       1: LogTabelasIndx.ApagarLogTabelasIndx( DtpDataExclui.Date );
       2: RetLogTabelas.ApagarRetLogTabelas( DtpDataExclui.Date );
  End;

  Cds.Data := LogTabelas.ListaLogTabelas( -1 );
  TmrProgresso.Enabled := False;
  MessageDlg( 'Informação Excluída do Banco!', mtinformation, [mbOk], 0 );
  PbExclusao.Position  := 0;
end;

end.

