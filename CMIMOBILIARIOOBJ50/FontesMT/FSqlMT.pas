unit FSqlMT;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  FSairAjuda, ComCtrls, IvDictio, IvMulti, IvEMulti, MAHlpBtn, StdCtrls,
  Buttons, TB97Tlbr, TB97, ExtCtrls, Db, Wwdatsrc, DBTables,
  Grids, DBGrids, uComunsImobiliarioDB, DBClient, uCMClientDataSet;

type
  TfrmSqlMT = class(TfrmSairAjuda)
    pgcSQL: TPageControl;
    tbsExec: TTabSheet;
    tbsResult: TTabSheet;
    Panel1: TPanel;
    tbsHistorico: TTabSheet;
    btnExec: TBitBtn;
    btnSelect: TBitBtn;
    btnLimpa: TBitBtn;
    btnCommit: TBitBtn;
    btnStart: TBitBtn;
    btnRollback: TBitBtn;
    memExec: TMemo;
    memHistorico: TMemo;
    dsSelect: TwwDataSource;
    DBgrdSelect: TDBGrid;
    lblTransacao: TLabel;
    CdsSelect: TCMClientDataSet;

    procedure btnExecClick(Sender: TObject);
    procedure btnLimpaClick(Sender: TObject);
    procedure btnStartClick(Sender: TObject);
    procedure btnCommitClick(Sender: TObject);
    procedure btnRollbackClick(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure btnSelectClick(Sender: TObject);
    procedure FormCreate(Sender: TObject);

  private { Private declarations }
    ComunsImobiliarioDB : TComunsImobiliarioDB;
    bTransacao : Boolean;
    procedure MostraTransacao;

  public { Public declarations }

  end;


var frmSqlMT: TfrmSqlMT;

implementation

{$R *.DFM}

uses uDataBase, dBaseDados, uMensErro, uComunsImobiliario, uVerificaPreenchimento, uSistema;


procedure TfrmSqlMT.FormCreate(Sender: TObject);
begin
  inherited;
  // Cria e inicializa o CtrlObject do objeto Indicadores
  ComunsImobiliarioDB := TComunsImobiliarioDB.Create(Sistema.IDEmpresa,Sistema.IDModulo,Sistema.IDUsuario,Sistema.IDEspAcesso,Sistema.UsaPlanoPatro);
  ComunsImobiliarioDB.Initialize(DtmBaseDados.DbBaseDados, True, Sistema.ConnectionType,
                                 Sistema.ConnectionSide, Sistema.AppRemoteServer, True,
                                 ComunsImobiliario.MensErroMT);
  bTransacao := False;
  pgcSQL.ActivePage := tbsExec;
end;


procedure TfrmSqlMT.MostraTransacao;
begin
  lblTransacao.Visible := bTransacao;
end;


procedure TfrmSqlMT.btnExecClick(Sender: TObject);
begin
  inherited;
  if not bTransacao then btnStartClick(self);

  memHistorico.Lines.Add(memExec.Lines.Text);
  memHistorico.Lines.Add('-------------------------------------------------------------------------');

  try
    ComunsImobiliarioDB.ExecSQL( memExec.Text );
  except
    btnRollbackClick(self);
    Raise;
    Repaint;
  end;
  Application.ProcessMessages;
end;


procedure TfrmSqlMT.btnLimpaClick(Sender: TObject);
begin
  inherited;
  memExec.Clear;
end;


procedure TfrmSqlMT.btnStartClick(Sender: TObject);
begin
  if not bTransacao then begin
    ComunsImobiliarioDB.StartTransaction;
    memHistorico.Lines.Add('START TRANSACTION');
    memHistorico.Lines.Add('-------------------------------------------------------------------------');
    bTransacao := True;
  end;
  MostraTransacao;
end;


procedure TfrmSqlMT.btnCommitClick(Sender: TObject);
begin
  inherited;
  if bTransacao then begin
    ComunsImobiliarioDB.Commit;
    memHistorico.Lines.Add('COMMIT');
    memHistorico.Lines.Add('-------------------------------------------------------------------------');
    bTransacao := False;
  end;
  MostraTransacao;
end;


procedure TfrmSqlMT.btnRollbackClick(Sender: TObject);
begin
  inherited;
  if bTransacao then begin
    ComunsImobiliarioDB.Rollback;
    memHistorico.Lines.Add('ROLLBACK');
    memHistorico.Lines.Add('-------------------------------------------------------------------------');
    bTransacao := False;
  end;
  MostraTransacao;
end;



procedure TfrmSqlMT.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  if bTransacao then ComunsImobiliarioDB.Rollback;
  FreeAndNil( ComunsImobiliarioDB );
  inherited;
end;



procedure TfrmSqlMT.btnSelectClick(Sender: TObject);
var ifator : Extended;
begin
  inherited;
  memHistorico.Lines.Add(memExec.Lines.Text);
  memHistorico.Lines.Add('-------------------------------------------------------------------------');

  try
    cdsSelect.Data    := ComunsImobiliarioDB.GetDataPacket( memExec.Lines.Text );
    pgcSQL.ActivePage := tbsResult;
  except
    Raise;
    Repaint;
  end;
  Application.ProcessMessages;
end;


end.
