unit fSelFolUp;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs, fSelProcessoMT, Db,
  DBTables, Wwdatsrc, MAHlpBtn, StdCtrls, TEdNum, Spin, wwdblook, ExtCtrls, IvDictio, Grids,
  IvMulti, IvEMulti, TB97Tlbr, ComCtrls, Buttons, wwdbdatetimepicker, CMDateTimePicker, TB97,
  CheckLst, uCmSqlParams, DBClient, uCMClientDataSet, CmParamReport, TREdit, Wwdbigrd,
  Wwdbgrid, frFollowUp, ColorCheckListBox;

type
  TfrmSelFolUp = class(TfrmSelProcessoMT)
    frameFollowUp: TframeFollowUp;
    procedure FormCreate(Sender: TObject);
    procedure bbtnConfirmarClick(Sender: TObject);
  end;

var
  frmSelFolUp: TfrmSelFolUp;

implementation

uses uMensErro, fAguarde;

{$R *.DFM}

procedure TfrmSelFolUp.FormCreate(Sender: TObject);
begin
  inherited;
  IrPaginaResult := false;
  edDataEnc1.Date := Date;
  edDataEnc2.Date := Date + 30;
  rgSitProc.ItemIndex := 0;
  gbxDataEnc.Visible := true;
end;

procedure TfrmSelFolUp.bbtnConfirmarClick(Sender: TObject);
begin
  frmAguarde.Mostra('Selecionando Dados...');
  frmAguarde.Pos := 0;
  frmAguarde.Min := 0;
  inherited;
  if not(bSelOk) then
  begin
    frmAguarde.Apaga;
    exit;
  end;

  if (CdsProcesso.IsEmpty) then
  begin
    frmAguarde.Apaga;
    MsgDlg('Não há dados a exibidos com os parâmetros selecionados.', 'Aviso',
      mtWarning, [mbOk, mbHelp], 0);
    exit;
  end;

  frmAguarde.Mostra('Montando FollowUp...');
  frmAguarde.Max := 0;
  frmAguarde.Update;

  frameFollowUp.CdsProcesso := CdsProcesso;
  frameFollowUp.DataEnc1 := edDataEnc1.Text;
  frameFollowUp.DataEnc2 := edDataEnc2.Text;
  frameFollowUp.GerarFollowUp;

  frmAguarde.Apaga;
  ExecutarIrPaginaResult;
end;

end.
