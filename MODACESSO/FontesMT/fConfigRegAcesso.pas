unit fConfigRegAcesso;

interface

uses
  Windows, Messages, SysUtils,  Classes, Graphics, Controls, Forms, Dialogs,
  FSairAjuda, StdCtrls, Spin, wwdbedit, Wwdotdot, Wwdbcomb, ExtCtrls, Mask, IvDictio,
  IvMulti, MAHlpBtn, Buttons, TB97Tlbr, TB97, IniFiles, Grids, 
  IvEMulti;

type
  TObjProcedure = procedure of object;

  TfrmConfigRegAcesso = class(TfrmSairAjuda)
    GroupBox1: TGroupBox;
    cbxVerificaHorario: TRadioButton;
    cbxNaoVerificaHorario: TRadioButton;
    stgdHorario: TStringGrid;
    gbxMin: TGroupBox;
    Label9: TLabel;
    cbxTolerancia: TCheckBox;
    spedMin: TSpinEdit;
    rgPontoAcesso: TRadioGroup;
    gbxSignificado: TGroupBox;
    gbxMensagem: TGroupBox;
    edMensagemPadrao: TEdit;
    gbxTempoEspera: TGroupBox;
    lblTempoCatraca: TLabel;
    lblTempo: TLabel;
    spedTempoCatraca: TSpinEdit;
    spedTempo: TSpinEdit;
    gbxSerial: TGroupBox;
    Label3: TLabel;
    lblAcionamento: TLabel;
    cmbVeloc: TComboBox;
    cmbAcionamento: TwwDBComboBox;
    rgSentido1: TRadioGroup;
    rgSentido2: TRadioGroup;
    rgPermiteAcessoOutraEmpProp: TRadioGroup;
    GroupBox2: TGroupBox;
    cmbGerarLog: TComboBox;
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure FormCreate(Sender: TObject);
    procedure cbxToleranciaClick(Sender: TObject);
    procedure FormDestroy(Sender: TObject);
    procedure stgdHorarioGetEditMask(Sender: TObject; ACol, ARow: Integer;
      var Value: String);
    procedure cbxVerificaHorarioClick(Sender: TObject);
    procedure FormCloseQuery(Sender: TObject; var CanClose: Boolean);
    procedure FormShow(Sender: TObject);
  private
    ArqConfig: TIniFile;

    procedure LeAlteracoes;
    procedure GravaAlteracoes;
    procedure MontarGridHorarios;
  public
    ExecIniciarConfig: TObjProcedure;
    ModeloCatraca: string;
  end;

var
  frmConfigRegAcesso: TfrmConfigRegAcesso;

implementation

uses uModulo, uCtrlFuncoesRH, fRegAcesso;

const
  COL_VAZIA = '  :  ';

  // Constantes que são concatenadas durante o processamento de uma função. Usadas desta
  // forma para a melhor tradução pelo padrão.
  MSG_SIGNIFICADO =
    'O significado do sentido do giro da catraca:1' +
    'deve ser diferente para cada direção.';

{$R *.dfm}

procedure TfrmConfigRegAcesso.FormCreate(Sender: TObject);
begin
  inherited;
  FU.HabilitarFilhos(gbxSignificado, Modulo.IndLiberacao in [ASSIST_COM_CATRACA, AUTOM_COM_CATRACA]);
  FU.HabilitarFilhos(gbxSerial, Modulo.IndLiberacao in [ASSIST_COM_CATRACA, AUTOM_COM_CATRACA]);
  FU.HabilitarFilhos(gbxMensagem, Modulo.IndLiberacao in [ASSIST_COM_CATRACA, AUTOM_COM_CATRACA]);
  lblTempoCatraca.Enabled := (Modulo.IndLiberacao in [ASSIST_COM_CATRACA, AUTOM_COM_CATRACA]);
  spedTempoCatraca.Enabled := lblTempoCatraca.Enabled;
//  lblTempo.Enabled := (Modulo.IndLiberacao in [AUTOM_SEM_CATRACA, AUTOM_COM_CATRACA]);
//  spedTempo.Enabled := lblTempo.Enabled;

 //* rgPontoAcesso.ItemIndex := FU.IFF(Modulo.TipoEstacao = 'P', 0, 1);
  rgPontoAcesso.Enabled := (rgPontoAcesso.ItemIndex = 0);
  cbxToleranciaClick(nil);

  MontarGridHorarios;

  // Carregar alterações nas opções feitas anteriormente
  LeAlteracoes;
end;

procedure TfrmConfigRegAcesso.FormDestroy(Sender: TObject);
begin
  inherited;
  // Gravar alterações nas opções feitas
  GravaAlteracoes;
end;

procedure TfrmConfigRegAcesso.FormCloseQuery(Sender: TObject; var CanClose: Boolean);
begin
  inherited;
  CanClose := (rgSentido1.ItemIndex <> rgSentido2.ItemIndex);
  if not(CanClose) then
  begin
    rgSentido1.SetFocus;
    MessageDlg(fu.CMTranslateMsg(MSG_SIGNIFICADO, [CR_LF]), mtInformation, [mbOK,mbHelp], 0);
  end;
end;

procedure TfrmConfigRegAcesso.FormShow(Sender: TObject);
begin
  inherited;
  lblAcionamento.Enabled := (ModeloCatraca = RODBEL_RBC_2801);
  cmbAcionamento.Enabled := lblAcionamento.Enabled;
end;

procedure TfrmConfigRegAcesso.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  inherited;
  Action := caHide;
  ExecIniciarConfig;
end;

procedure TfrmConfigRegAcesso.stgdHorarioGetEditMask(Sender: TObject; ACol,
  ARow: Integer; var Value: String);
begin
  if (ACol in [0,1]) and (ARow > 0) then
    Value := '00:00;1';
end;

procedure TfrmConfigRegAcesso.cbxVerificaHorarioClick(Sender: TObject);
begin
  stgdHorario.Enabled := cbxVerificaHorario.Checked;
  if (stgdHorario.Enabled) then
    stgdHorario.Font.Color := clWindowText
  else
    stgdHorario.Font.Color := clGray;
end;

procedure TfrmConfigRegAcesso.cbxToleranciaClick(Sender: TObject);
begin
  spedMin.Enabled := cbxTolerancia.Checked;
end;

procedure TfrmConfigRegAcesso.LeAlteracoes;
begin
  // Recupera as últimas alterações das opções
  ArqConfig := TIniFile.Create(FU.ArqConfig);
  rgSentido1.ItemIndex := StrToInt(ArqConfig.ReadString('ESTACESSO', 'rgSentido1', '0'));
  rgSentido2.ItemIndex := StrToInt(ArqConfig.ReadString('ESTACESSO', 'rgSentido2', '1'));
  cmbVeloc.ItemIndex := StrToInt(ArqConfig.ReadString('ESTACESSO', 'Velocidade', '0'));
  cmbAcionamento.ItemIndex := StrToInt(ArqConfig.ReadString('ESTACESSO', 'Acionamento', '0'));
  edMensagemPadrao.Text := ArqConfig.ReadString('ESTACESSO', 'MensagemPadrao', ' ');
  spedTempoCatraca.Value := StrToInt(ArqConfig.ReadString('ESTACESSO', 'TempoEsperaCatraca', '10'));
  spedTempo.Value := StrToInt(ArqConfig.ReadString('ESTACESSO', 'TempoEspera', '2'));
  spedMin.Value := StrToInt(ArqConfig.ReadString('ESTACESSO', 'TempoTolerancia', '0'));
  //*cbxTolerancia.Checked := StrToBool(ArqConfig.ReadString('ESTACESSO', 'ChecaTolerancia', 'True'));
  rgPermiteAcessoOutraEmpProp.ItemIndex := StrToInt(ArqConfig.ReadString('ESTACESSO', 'PermiteAcessoOutraEmpProp', '1'));

  if (StrToInt(ArqConfig.ReadString('ESTACESSO', 'ChecaHora', '0')) = 1) then
    cbxVerificaHorario.Checked := true
  else
    cbxNaoVerificaHorario.Checked := true;

  // Horário Linha 1
  stgdHorario.Cells[0,1] := ArqConfig.ReadString('RELACESSO', 'Inicio1', '00:00');
  stgdHorario.Cells[1,1] := ArqConfig.ReadString('RELACESSO', 'Final1', '00:00');
  stgdHorario.Cells[2,1] := ArqConfig.ReadString('RELACESSO', 'Nome1', ' ');

  // Horário Linha 2
  stgdHorario.Cells[0,2] := ArqConfig.ReadString('RELACESSO', 'Inicio2', '00:00');
  stgdHorario.Cells[1,2] := ArqConfig.ReadString('RELACESSO', 'Final2', '00:00');
  stgdHorario.Cells[2,2] := ArqConfig.ReadString('RELACESSO', 'Nome2', ' ');

  // Horário Linha 3
  stgdHorario.Cells[0,3] := ArqConfig.ReadString('RELACESSO', 'Inicio3', '00:00');
  stgdHorario.Cells[1,3] := ArqConfig.ReadString('RELACESSO', 'Final3', '00:00');
  stgdHorario.Cells[2,3] := ArqConfig.ReadString('RELACESSO', 'Nome3', ' ');
end;

procedure TfrmConfigRegAcesso.GravaAlteracoes;
begin
  // Grava as últimas alterações das Opções
  ArqConfig.WriteString('ESTACESSO', 'rgSentido1', IntToStr(rgSentido1.ItemIndex));
  ArqConfig.WriteString('ESTACESSO', 'rgSentido2', IntToStr(rgSentido2.ItemIndex));
  ArqConfig.WriteString('ESTACESSO', 'Velocidade', IntToStr(cmbVeloc.ItemIndex));
  ArqConfig.WriteString('ESTACESSO', 'Acionamento', IntToStr(cmbAcionamento.ItemIndex));
  ArqConfig.WriteString('ESTACESSO', 'MensagemPadrao', edMensagemPadrao.Text);
  ArqConfig.WriteString('ESTACESSO', 'TempoEsperaCatraca', IntToStr(spedTempoCatraca.Value));
  ArqConfig.WriteString('ESTACESSO', 'TempoEspera', IntToStr(spedTempo.Value));
  ArqConfig.WriteString('ESTACESSO', 'TempoTolerancia', IntToStr(spedMin.Value));
  //*ArqConfig.WriteString('ESTACESSO', 'ChecaTolerancia', BoolToStr(cbxTolerancia.Checked,True));
  ArqConfig.WriteString('ESTACESSO', 'PermiteAcessoOutraEmpProp', IntToStr(rgPermiteAcessoOutraEmpProp.ItemIndex));

  if (cbxVerificaHorario.Checked) then
    ArqConfig.WriteString('ESTACESSO', 'ChecaHora', '1')
  else
    ArqConfig.WriteString('ESTACESSO', 'ChecaHora', '0');

  // Horário Linha 1
  ArqConfig.WriteString('RELACESSO', 'Inicio1', stgdHorario.Cells[0,1]);
  ArqConfig.WriteString('RELACESSO', 'Final1', stgdHorario.Cells[1,1]);
  ArqConfig.WriteString('RELACESSO', 'Nome1', stgdHorario.Cells[2,1]);

  // Horário Linha 2
  ArqConfig.WriteString('RELACESSO', 'Inicio2', stgdHorario.Cells[0,2]);
  ArqConfig.WriteString('RELACESSO', 'Final2', stgdHorario.Cells[1,2]);
  ArqConfig.WriteString('RELACESSO', 'Nome2', stgdHorario.Cells[2,2]);

  // Horário Linha 3
  ArqConfig.WriteString('RELACESSO', 'Inicio3', stgdHorario.Cells[0,3]);
  ArqConfig.WriteString('RELACESSO', 'Final3', stgdHorario.Cells[1,3]);
  ArqConfig.WriteString('RELACESSO', 'Nome3', stgdHorario.Cells[2,3]);
end;

procedure TfrmConfigRegAcesso.MontarGridHorarios;
begin
  stgdHorario.Cells[0,0] := fu.CMTranslate('Das');
  stgdHorario.Cells[1,0] := fu.CMTranslate('Às');
  stgdHorario.Cells[2,0] := fu.CMTranslate('Nome');

  stgdHorario.ColWidths[0] := 40;
  stgdHorario.ColWidths[1] := 40;
  stgdHorario.ColWidths[2] := 111;
end;

end.
