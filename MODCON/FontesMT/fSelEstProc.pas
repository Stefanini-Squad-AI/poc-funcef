unit fSelEstProc;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs, fSelProcessoMT,
  DBTables, Db, Wwdatsrc, MAHlpBtn, StdCtrls, TEdNum, Spin, wwdblook, ExtCtrls, TB97, IvDictio,
  IvMulti, IvEMulti, TB97Tlbr, ComCtrls, Buttons, CheckLst, wwdbdatetimepicker, DBClient,
  CMDateTimePicker, uCmSqlParams, uCMClientDataSet, CmParamReport, frGraficoProcesso, TREdit,
  ColorCheckListBox;

type
  TfrmSelEstProc = class(TfrmSelProcessoMT)
    rgDataEncer: TRadioGroup;
    frameGraficoProcesso: TframeGraficoProcesso;
    procedure bbtnConfirmarClick(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
  end;

var
  frmSelEstProc: TfrmSelEstProc;

implementation

uses fAguarde, uSistema, uMensErro, uCtrlPadroes, uCtrlUsoGeralRH, uCtrlProcessoTrab,
  uCtrlCustomProcTrab;

{$R *.DFM}

procedure TfrmSelEstProc.FormCreate(Sender: TObject);
begin
  inherited;
  frameGraficoProcesso.CtrlProcessoTrab := TCtrlProcessoTrab.Create(Sistema.IdModulo,
    Sistema.IdUsuario, Sistema.IdEmpresa, Sistema.UsaPlanoPatro, CtrlUsoGeralRH.UsuXFilial,
    CtrlUsoGeralRH.UsuXCCusto, CtrlUsoGeralRH.IdUsuarioGeral);
  frameGraficoProcesso.CtrlProcessoTrab.InitializeAs(Padroes);

  frameGraficoProcesso.CtrlCustomProcTrab := TCtrlCustomProcTrab.Create(Sistema.IdEmpresa,
    Sistema.TipoEmpresa);
  frameGraficoProcesso.CtrlCustomProcTrab.InitializeAs(Padroes);

  frameGraficoProcesso.pgctrlGrafico.ActivePageIndex := 0;
  edDataAju1.Date := Date - Round(365.25*10);
  edDataNot1.Date := Date - Round(365.25*10);
  edDataEnc1.Date := Date - Round(365.25*10);
  edDataNot2.Date := Date;
  edDataAju2.Date := Date;
  edDataEnc2.Date := Date;
  IrPaginaResult := false;
end;

procedure TfrmSelEstProc.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  frameGraficoProcesso.CtrlProcessoTrab.Free;
  inherited;
end;

procedure TfrmSelEstProc.bbtnConfirmarClick(Sender: TObject);
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

  frmAguarde.Mostra('Montando Gráfico...');
  frmAguarde.Update;

  frameGraficoProcesso.CdsProcesso := CdsProcesso;
  frameGraficoProcesso.DataNot1 := edDataNot1.Text;
  frameGraficoProcesso.DataNot2 := edDataNot2.Text;
  frameGraficoProcesso.ConsiderarDataEncerramento := (rgDataEncer.ItemIndex = 1);
  frameGraficoProcesso.GerarGrafico;
  
  ExecutarIrPaginaResult;
end;

end.
