unit fExecDesfazDiarioMT;
{-------------------------------------------------------------------------------
ALTERAÇÕES / IMPLEMENTAÇÕES ----------------------------------------------------
--------------------------------------------------------------------------------
Rotina......: -
Nº SOL......: 172902
Nº KINTANA..: 1577381
Data........: 14/03/2012
Responsável.: Helen V. Bianchi
Descrição...: Não deixar fazer lançamentos com Período contabil Bloqueado
-------------------------------------------------------------------------------}

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  FOkCancelar, Wwdbspin, StdCtrls, Mask, wwdbedit, Wwdotdot, Wwdbcomb,
  IvDictio, IvMulti, IvEMulti, MAHlpBtn, Buttons, TB97Tlbr, TB97, ExtCtrls,
  uCtrlPrevImob, uModuloImobiliario, dBaseDados, uSistema, fProgresso,
  uMensErro, uComunsImobiliario, uVerificaPreenchimento,
  // Helen - SOL: 172902 KTN: 1577381
  uCtrlContab;

type
  TfrmExecDesfazDiarioMT = class(TfrmOkCancelar)
    Label5: TLabel;
    cboMes: TwwDBComboBox;
    DBspnAno: TwwDBSpinEdit;
    Label2: TLabel;
    chkPlanilha: TCheckBox;
    procedure FormCreate(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure bbtnConfirmarClick(Sender: TObject);
    procedure Label2Click(Sender: TObject);
  private
    { Private declarations }
    CtrlPrevImob : TCtrlPrevImob;
    CtrlContab   : TCtrlContab; // Helen - SOL: 172902 KTN: 1577381
    procedure Progresso (vParams: array of variant);
  public
    { Public declarations }
  end;

var
  frmExecDesfazDiarioMT: TfrmExecDesfazDiarioMT;

implementation

{$R *.DFM}

procedure TfrmExecDesfazDiarioMT.FormCreate(Sender: TObject);
begin
  inherited;
  CtrlPrevImob := TCtrlPrevImob.Create( Sistema.IdEmpresa,
                                        Sistema.IdModulo,
                                        Sistema.IdUsuario,
                                        Sistema.IdEspAcesso,
                                        Sistema.UsaPlanoPatro );
  CtrlPrevImob.Initialize (dtmBaseDados.dbBaseDados, true, Sistema.ConnectionType,
                           Sistema.ConnectionSide, Sistema.AppRemoteServer, true);
  CtrlPrevImob.Progresso := Progresso;

  if Sistema.IdModulo = 64 then begin
    cboMes.ItemIndex := ModuloImobiliario.AdminImob.iMesCompetencia - 1;
    DBspnAno.Value   := ModuloImobiliario.AdminImob.iAnoCompetencia;
  end else begin
    cboMes.ItemIndex := ModuloImobiliario.Alienacao.iMesCompetencia - 1;
    DBspnAno.Value   := ModuloImobiliario.Alienacao.iAnoCompetencia;
  end;
  // Helen - SOL: 172902 KTN: 1577381
  CtrlContab     := TCtrlContab.Create;
  CtrlContab.InitializeAs(CtrlPrevImob);
end;

procedure TfrmExecDesfazDiarioMT.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
  inherited;
  FreeAndNil ( CtrlPrevImob );
  FreeAndNil(CtrlContab);// Helen - SOL: 172902 KTN: 1577381
end;

procedure TfrmExecDesfazDiarioMT.Progresso(vParams: array of variant);
begin
  frmProgresso.AndaFormProgresso(vParams[1], vParams[2]);
end;

procedure TfrmExecDesfazDiarioMT.bbtnConfirmarClick(Sender: TObject);
var
  iAno, iMes: integer;
begin
  inherited;
  if chkPlanilha.Checked then begin
    if MsgDlg ('Você selecionou a exclusão das planilhas contábeis. O sistema não necessita que as mesmas sejam excluídas! Continua?', 'Exclui Planilhas', mtConfirmation, [mbyes,mbno], 0) = mrno then exit
    else
      if MsgDlg ('Com a exclusão das planilhas o processo ficará mais lento e a periodicidade não será levada em conta, tem certeza?', 'Exclui Planilhas', mtConfirmation, [mbyes,mbno], 0) = mrno then exit;
  end;

  if Sistema.IdModulo = 64 then begin
    iMes := ModuloImobiliario.AdminImob.iMesCompetencia + 1;
    iAno := ModuloImobiliario.AdminImob.iAnoCompetencia;
  end else begin
    iMes := ModuloImobiliario.Alienacao.iMesCompetencia + 1;
    iAno := ModuloImobiliario.Alienacao.iAnoCompetencia;
  end;
  // Helen - SOL: 172902 KTN: 1577381 - Inicio
   if not CtrlContab.TestaDataBloqueadaProc(Sistema.idEmpresa,Sistema.idModulo,('01/'+ IntToStr(cboMes.ItemIndex + 1 ) +'/'+ DBspnAno.Text)) then
   begin
      MsgDlg('Período contábil bloqueado.','Aviso',mtWarning,[mbOk],0);
      Exit;
   end;
   // Helen - SOL: 172902 KTN: 1577381 - Fim
  if iMes = 13 then begin
    iMes := 1;
    iAno := iAno + 1;
  end;

  try
    frmProgresso.MostraFormProgresso('Desfazendo Encerramento ...');
    CtrlPrevImob.CreateThreadProgresso;

    if not CtrlPrevImob.DesfazEncerraCompetencia (CtrlPrevImob.ProgressFileName,
               true, Sistema.IdEmpresa, Sistema.IdModulo, Sistema.IdUsuario,
               iAno, iMes, Sistema.UsaPlanoPatro, chkPlanilha.Checked) then
      ComunsImobiliario.MensErroMT (CtrlPrevImob.MessageInfo);

    if Sistema.IdModulo = 64 then begin
      ModuloImobiliario.AdminImob.GetParam( Sistema.IdEmpresa );
      cboMes.ItemIndex := ModuloImobiliario.AdminImob.iMesCompetencia - 1;
      DBspnAno.Value   := ModuloImobiliario.AdminImob.iAnoCompetencia;
    end else begin
      ModuloImobiliario.Alienacao.GetParam( Sistema.IdEmpresa );
      cboMes.ItemIndex := ModuloImobiliario.Alienacao.iMesCompetencia - 1;
      DBspnAno.Value   := ModuloImobiliario.Alienacao.iAnoCompetencia;
    end;

  finally
    frmProgresso.EscondeFormProgresso;
    CtrlPrevImob.FreeThreadProgresso;
  end;
end;

procedure TfrmExecDesfazDiarioMT.Label2Click(Sender: TObject);
begin
  inherited;
  chkPlanilha.Checked := not(chkPlanilha.Checked);
end;

end.
