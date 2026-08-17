unit FSQL;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  FSairAjuda, ComCtrls, IvDictio, IvMulti, IvEMulti, MAHlpBtn, StdCtrls,
  Buttons, TB97Tlbr, TB97, ExtCtrls, Db, Wwdatsrc, DBTables, Wwquery,
  CMSQLScript, Grids, DBGrids, FSairAjudaImob;

type
  TfrmSQL = class(TFrmSairAjudaImob)
    pgcSQL: TPageControl;
    tbsExec: TTabSheet;
    tbsScript: TTabSheet;
    tbsResult: TTabSheet;
    Panel1: TPanel;
    tbsHistorico: TTabSheet;
    btnExec: TBitBtn;
    btnScript: TBitBtn;
    btnSelect: TBitBtn;
    btnLimpa: TBitBtn;
    btnCommit: TBitBtn;
    btnStart: TBitBtn;
    btnRollback: TBitBtn;
    memExec: TMemo;
    memScript: TMemo;
    memHistorico: TMemo;
    qryExec: TwwQuery;
    qrySelect: TwwQuery;
    dsSelect: TwwDataSource;
    scrScript: TCMSQLScript;
    DBgrdSelect: TDBGrid;
    lblTransacao: TLabel;

    procedure btnExecClick(Sender: TObject);
    procedure btnScriptClick(Sender: TObject);
    procedure btnLimpaClick(Sender: TObject);
    procedure btnStartClick(Sender: TObject);
    procedure btnCommitClick(Sender: TObject);
    procedure btnRollbackClick(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure FormShow(Sender: TObject);
    procedure btnSelectClick(Sender: TObject);

  private { Private declarations }
   procedure MostraTransacao;

  public { Public declarations }

  end;


var
  frmSQL: TfrmSQL;


implementation
{$R *.DFM}
uses
   uDataBase, dBaseDados, uMensErro;



procedure TfrmSQL.MostraTransacao;
begin
   lblTransacao.Visible := dtmBaseDados.dbBaseDados.inTransaction;
end;



procedure TfrmSQL.btnExecClick(Sender: TObject);
begin
   inherited;

   if not(dtmBaseDados.dbBaseDados.inTransaction) then btnStartClick(self);

   memHistorico.Lines.Add(memExec.Lines.Text);
   memHistorico.Lines.Add('-------------------------------------------------------------------------');

   qryExec.SQL := memExec.Lines;

   try
      qryExec.ExecSQL;
   except
      btnRollbackClick(self);
      Raise;
      Repaint;
   end;

   Application.ProcessMessages;
end;



procedure TfrmSQL.btnScriptClick(Sender: TObject);
begin
   inherited;

   if not(dtmBaseDados.dbBaseDados.inTransaction) then btnStartClick(self);

   scrScript.Script := memScript.Lines;
   try
      scrScript.Execute;
   except
      btnRollbackClick(self);
      Raise;
      Repaint;
   end;

   Application.ProcessMessages;
end;



procedure TfrmSQL.btnLimpaClick(Sender: TObject);
begin
   inherited;
   memExec.Clear;
end;



procedure TfrmSQL.btnStartClick(Sender: TObject);
begin
   if not(dtmBaseDados.dbBaseDados.inTransaction) then StartTransacao;
   MostraTransacao;
end;



procedure TfrmSQL.btnCommitClick(Sender: TObject);
begin
   inherited;
   if dtmBaseDados.dbBaseDados.inTransaction then CommitTransacao;
   MostraTransacao;
end;



procedure TfrmSQL.btnRollbackClick(Sender: TObject);
begin
   inherited;
   if dtmBaseDados.dbBaseDados.inTransaction then RollBackTransacao;
   MostraTransacao;
end;



procedure TfrmSQL.FormClose(Sender: TObject; var Action: TCloseAction);
begin
   if dtmBaseDados.dbBaseDados.inTransaction then RollBackTransacao;

   qrySelect.Close;
   qryExec.Close;

   inherited;
end;



procedure TfrmSQL.FormShow(Sender: TObject);
begin
   inherited;

   qrySelect.Close;
   qryExec.Close;

   pgcSQL.ActivePage := tbsExec;
end;


procedure TfrmSQL.btnSelectClick(Sender: TObject);
begin
   inherited;

   memHistorico.Lines.Add(memExec.Lines.Text);
   memHistorico.Lines.Add('-------------------------------------------------------------------------');

   qrySelect.SQL := memExec.Lines;
   try
      qrySelect.Open;
      pgcSQL.ActivePage := tbsResult;
   except
      Raise;
      Repaint;
   end;

   Application.ProcessMessages;
end;



end.
