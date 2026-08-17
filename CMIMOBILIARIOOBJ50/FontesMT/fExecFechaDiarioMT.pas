unit fExecFechaDiarioMT;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  FWizardMT, IvDictio, IvMulti, IvEMulti, fcButton, fcImgBtn, fcShapeBtn,
  MAHlpBtn, StdCtrls, Buttons, TB97Tlbr, TB97, fcLabel, ComCtrls, ExtCtrls,
  Wwdbspin, Mask, wwdbedit, Wwdotdot, Wwdbcomb,
  uFuncoesImob, uComunsImobiliario, uVerificaPreenchimento, uSistema, uDataBase, fProgresso,
  uMensErro, uModuloImobiliario, dBaseDados, uCtrlPrevImob, wwriched, Menus,
  uCtrlParamIntegra;

type
  TfrmExecFechaDiarioMT = class(TfrmWizardMT)
    GroupBox1: TGroupBox;
    chkFecha: TCheckBox;
    chkConsolida: TCheckBox;
    chkIntegra: TCheckBox;
    Bevel1: TBevel;
    Label1: TLabel;
    Label5: TLabel;
    cboMes: TwwDBComboBox;
    DBspnAno: TwwDBSpinEdit;
    SaveDialog1: TSaveDialog;
    PrintDialog1: TPrintDialog;
    PopupMenu1: TPopupMenu;
    mnuSalvar: TMenuItem;
    mnuImprimir: TMenuItem;
    memResultado: TwwDBRichEdit;
    procedure FormCreate(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure btnContinuarClick(Sender: TObject);
    procedure mnuSalvarClick(Sender: TObject);
    procedure mnuImprimirClick(Sender: TObject);
  private
    { Private declarations }
    CtrlPrevImob: TCtrlPrevImob;
    procedure Progresso (vParams: array of variant);
    procedure SetCompetencia;
  public
    { Public declarations }
  end;

var
  frmExecFechaDiarioMT: TfrmExecFechaDiarioMT;

implementation

{$R *.DFM}

procedure TfrmExecFechaDiarioMT.FormCreate(Sender: TObject);
begin
  inherited;
  SetCompetencia;

  CtrlPrevImob := TCtrlPrevImob.Create( Sistema.IdEmpresa,
                                        Sistema.IdModulo,
                                        Sistema.IdUsuario,
                                        Sistema.IdEspAcesso,
                                        Sistema.UsaPlanoPatro );
  CtrlPrevImob.Initialize (dtmBaseDados.dbBaseDados, true, Sistema.ConnectionType,
                           Sistema.ConnectionSide, Sistema.AppRemoteServer, true);
  CtrlPrevImob.Progresso := Progresso;
end;

procedure TfrmExecFechaDiarioMT.Progresso(vParams: array of variant);
begin
  frmProgresso.AndaFormProgresso(vParams[1], vParams[2]);
  if (High (vParams) = 3) then
    if vParams[3] <> '' then memResultado.Lines.Add ( vParams[3] ) ;
end;

procedure TfrmExecFechaDiarioMT.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
  inherited;
  FreeAndNil (CtrlPrevImob);
end;

procedure TfrmExecFechaDiarioMT.btnContinuarClick(Sender: TObject);
var
  iAno, iMes: integer;
  sCompetencia: string;
begin
  inherited;
  memResultado.Clear;

  iAno := word(trunc(DBspnAno.Value));
  iMes := cboMes.ItemIndex + 1;
  sCompetencia := cboMes.Text + '/' + DBspnAno.Text;

  try
    CtrlPrevImob.CreateThreadProgresso;

    frmProgresso.MostraFormProgresso('Ajustando previsão mensal - Mês: ' + sCompetencia );
    if not CtrlPrevImob.AjustaPrevImob (CtrlPrevImob.ProgressFileName, True,
                                        'M', Sistema.IdModulo,
                                        iAno, iMes, -1, -1, -1, true) then begin
      ComunsImobiliario.MensErroMT (CtrlPrevImob.MessageInfo);
      exit;
    end else begin
      memResultado.Lines.Add ('Previsão mensal: ' + sCompetencia + ' ajustada com sucesso! ');
      memResultado.Lines.Add ('===========================================================');
    end;

    // se for fechamento anual
    if iMes = 12 then begin
      frmProgresso.MostraFormProgresso('Ajustando previsão anual - Ano: ' + DBspnAno.Text );
      if not CtrlPrevImob.AjustaPrevImob (CtrlPrevImob.ProgressFileName, True,
                                          'A', Sistema.IdModulo,
                                          iAno, iMes, -1, -1, -1, true) then begin
        ComunsImobiliario.MensErroMT (CtrlPrevImob.MessageInfo);
        exit;
      end else begin
        memResultado.Lines.Add ('Previsão anual: ' + DBspnAno.Text + ' ajustada com sucesso! ');
        memResultado.Lines.Add ('===========================================================');
      end;
    end;

    frmProgresso.MostraFormProgresso('Consolidando Previsão Diária - Mês: ' + sCompetencia );
    if not CtrlPrevImob.ConsolidaLancPrevImob(CtrlPrevImob.ProgressFileName, true,
                               Sistema.UsaPlanoPatro, Sistema.IdModulo, Sistema.IdUsuario,
                               iAno, iMes, -1) then begin
      ComunsImobiliario.MensErroMT (CtrlPrevImob.MessageInfo);
      exit;
    end else begin
      memResultado.Lines.Add ('Previsão consolidada com sucesso - Mês: ' + sCompetencia);
      memResultado.Lines.Add ('===========================================================');
    end;


    // integra previsão diária
    memResultado.Lines.Add ('Resultado da Integração da Previsão: Mês: ' + sCompetencia);
    memResultado.Lines.Add ('===========================================================');
    frmProgresso.MostraFormProgresso('Integrando Previsão Diária - Mês: ' + sCompetencia);
    if not CtrlPrevImob.IntegraLancDiario(CtrlPrevImob.ProgressFileName,
                                          Sistema.IdEmpresa, 
                                          Sistema.IdModulo, Sistema.IdUsuario,
                                          iAno, iMes,
                                          ParamIntegra.PlanoPrevGlobal,
                                          ParamIntegra.PatroGlobal,
                                          ModuloImobiliario.Global.sPlanoPrev,
                                          ModuloImobiliario.Global.sPatro,
                                          Sistema.UsaPlanoPatro, -1) then begin
      ComunsImobiliario.MensErroMT ('Todos os erros de integação devem ser resolvidos para continuar com o encerramento!');
      exit;
    end;

    // executar o fechamento propriamente dito
    frmProgresso.MostraFormProgresso('Fechando Previsão Diária - Mês: ' + sCompetencia);
    if not CtrlPrevImob.EncerraCompetencia(CtrlPrevImob.ProgressFileName, true,
                                           Sistema.IdEmpresa, Sistema.IdModulo, iAno, iMes) then begin
      ComunsImobiliario.MensErroMT ('Erro ao se executar o encerramento do mês!' + #13 +
                                    CtrlPrevImob.MessageInfo);
      exit;
    end else begin
      // atualiza o mês de competência na tela
      if Sistema.IdModulo = 64 then
           ModuloImobiliario.AdminImob.GetParam( Sistema.IdEmpresa )
      else ModuloImobiliario.Alienacao.GetParam( Sistema.IdEmpresa );
      SetCompetencia;
      iAno := word(trunc(DBspnAno.Value));
      iMes := cboMes.ItemIndex + 1;

      memResultado.Lines.Add ('===========================================================');
      memResultado.Lines.Add ('===========================================================');
      memResultado.Lines.Add ('Encerramento Mês: ' + sCompetencia + ' efetuado com sucesso');
      memResultado.Lines.Add ('===========================================================');
      memResultado.Lines.Add ('===========================================================');

      sCompetencia := cboMes.Text + '/' + DBspnAno.Text;
    end;

    // consolida a previsão diária
    if chkConsolida.Checked then begin
      frmProgresso.MostraFormProgresso('Consolidando Previsão Diária - Mês: ' + sCompetencia );

      if not CtrlPrevImob.ConsolidaLancPrevImob(CtrlPrevImob.ProgressFileName, true,
                                 Sistema.UsaPlanoPatro, Sistema.IdModulo, Sistema.IdUsuario,
                                 iAno, iMes, -1) then begin
        ComunsImobiliario.MensErroMT (CtrlPrevImob.MessageInfo);
        exit;
      end else begin
        memResultado.Lines.Add ('Previsão consolidada com sucesso - Mês: ' + sCompetencia);
        memResultado.Lines.Add ('===========================================================');
      end;
    end;

    // integra previsão diária
    if chkIntegra.Checked then begin
      memResultado.Lines.Add ('Resultado da Integração da Previsão: Mês: ' + sCompetencia);
      memResultado.Lines.Add ('===========================================================');
      frmProgresso.MostraFormProgresso('Integrando Previsão Diária: Mês: ' + sCompetencia);
      CtrlPrevImob.IntegraLancDiario(CtrlPrevImob.ProgressFileName,
                                     Sistema.IdEmpresa,
                                     Sistema.IdModulo, Sistema.IdUsuario,
                                     iAno, iMes,
                                     ParamIntegra.PlanoPrevGlobal,
                                     ParamIntegra.PatroGlobal,
                                     ModuloImobiliario.Global.sPlanoPrev,
                                     ModuloImobiliario.Global.sPatro,
                                     Sistema.UsaPlanoPatro, -1);
    end;


  finally
    frmProgresso.EscondeFormProgresso;
    CtrlPrevImob.FreeThreadProgresso;
  end;
end;

procedure TfrmExecFechaDiarioMT.SetCompetencia;
var
  dDiaAux: TDate;
  vDia, vMes, vAno: word;
begin
  inherited;
  if Sistema.IdModulo = 64 then begin
    dDiaAux := EncodeDate (ModuloImobiliario.AdminImob.iAnoCompetencia,
                           ModuloImobiliario.AdminImob.iMesCompetencia, 1);
  end else begin
    dDiaAux := EncodeDate (ModuloImobiliario.Alienacao.iAnoCompetencia,
                           ModuloImobiliario.Alienacao.iMesCompetencia, 1);
  end;
  dDiaAux := IncMonth (dDiaAux, 1);
  DecodeDate (dDiaAux, vAno, vMes, vDia);
  cboMes.ItemIndex := vMes - 1;
  DBspnAno.Value   := vAno;
end;

procedure TfrmExecFechaDiarioMT.mnuSalvarClick(Sender: TObject);
begin
  inherited;
  SaveDialog1.Execute;
  if SaveDialog1.FileName <> '' then
    memResultado.Lines.SaveToFile(SaveDialog1.FileName);
end;

procedure TfrmExecFechaDiarioMT.mnuImprimirClick(Sender: TObject);
begin
  inherited;
  memResultado.Print('');
end;

end.
