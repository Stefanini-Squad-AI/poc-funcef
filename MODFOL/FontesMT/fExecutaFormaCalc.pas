unit fExecutaFormaCalc;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs, fSairAjuda,
  StdCtrls, IvDictio, IvMulti, IvEMulti, MAHlpBtn, Buttons, TB97Tlbr, uSistema, TB97,
  ExtCtrls, MontaSelect, Menus, TREdit, fcLabel, Db, DBTables, uCtrlCadRegra, uCtrlCalcRub,
  uCtrlPessoaFuncionario, uCtrlListTerceirosRH;

type
  TfrmExecutaFormaCalc = class(TfrmSairAjuda)
    MontaSelectFormaCalc: TMontaSelect;
    MontaSelectFunc: TMontaSelect;
    fcLabel1: TfcLabel;
    bbtnLimpar: TBitBtn;
    rgRescisao: TRadioGroup;
    rgTemLanc: TRadioGroup;
    Label11: TLabel;
    edNome: TEdit;
    sbtnProcurarEmpregado: TSpeedButton;
    Bevel2: TBevel;
    fcLabel2: TfcLabel;
    edtResultRegra: TEdit;
    Bevel3: TBevel;
    Label9: TLabel;
    Label3: TLabel;
    Bevel1: TBevel;
    Label12: TLabel;
    Label13: TLabel;
    btnConsultar: TBitBtn;
    bbtnExecutar: TBitBtn;
    bbtnPassoAPasso: TBitBtn;
    edtTipo: TPanel;
    edtNome: TPanel;
    cbxRegra: TCheckBox;
    cbxForma: TCheckBox;
    bbtnPassos: TBitBtn;
    Label2: TLabel;
    edtNumero: TEdit;
    Label1: TLabel;
    edMatric: TEdit;
    Label5: TLabel;
    redValorInfo: TRealEdit;
    Label7: TLabel;
    redValorBase: TRealEdit;
    Label8: TLabel;
    redParcelas: TRealEdit;
    Label10: TLabel;
    redOcorrencias: TRealEdit;
    Label14: TLabel;
    redTotProv: TRealEdit;
    Label15: TLabel;
    redTotDesc: TRealEdit;
    procedure btnConsultarClick(Sender: TObject);
    procedure bbtnExecutarClick(Sender: TObject);
    procedure edtNumeroExit(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure FormCreate(Sender: TObject);
    procedure bbtnLimparClick(Sender: TObject);
    procedure sbtnProcurarEmpregadoClick(Sender: TObject);
    procedure edMatricExit(Sender: TObject);
    procedure FormShow(Sender: TObject);
  private
    CtrlCalcRub: TCtrlCalcRub;
    CtrlCadRegra: TCtrlCadRegra;
    CtrlPessoaFuncionario: TCtrlPessoaFuncionario;
    CtrlListTerceirosRH: TCtrlListTerceirosRH;

    IdTipoRegra: integer;
    IdPessoa: double;

    function  SelEmpregado: boolean;
    procedure ExecutarFormaCalculo(Tipo: TTipoExecucaoFormaCalc);
    procedure PreencherTipo;
  end;

var
  frmExecutaFormaCalc: TfrmExecutaFormaCalc;

implementation

uses uMensErro, uCtrlPadroes, fPassosFormaCalc, fAguarde, uCtrlUsoGeralRH,
  uCtrlFuncoesRH, dCds;

{$R *.DFM}

procedure TfrmExecutaFormaCalc.FormCreate(Sender: TObject);
begin
  inherited;
  CtrlCalcRub := TCtrlCalcRub.Create;
  CtrlCalcRub.InitializeAs(Padroes);

  CtrlCadRegra := TCtrlCadRegra.Create;
  CtrlCadRegra.InitializeAs(Padroes);

  CtrlPessoaFuncionario := TCtrlPessoaFuncionario.Create(CtrlUsoGeralRH.UsuXFilial,
    CtrlUsoGeralRH.UsuXCCusto, CtrlUsoGeralRH.IdUsuarioGeral);
  CtrlPessoaFuncionario.InitializeAs(Padroes);

  CtrlListTerceirosRH := TCtrlListTerceirosRH.Create(CtrlUsoGeralRH.UsuXFilial,
    CtrlUsoGeralRH.UsuXCCusto, CtrlUsoGeralRH.IdUsuarioGeral);
  CtrlListTerceirosRH.InitializeAs(Padroes);
end;

procedure TfrmExecutaFormaCalc.FormShow(Sender: TObject);
begin
  inherited;
  edtNumero.SetFocus;
end;

procedure TfrmExecutaFormaCalc.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  FreeAndNil(CtrlCadRegra);
  FreeAndNil(CtrlPessoaFuncionario);
  FreeAndNil(CtrlListTerceirosRH);
  FreeAndNil(CtrlCalcRub);
  inherited;
end;

procedure TfrmExecutaFormaCalc.edtNumeroExit(Sender: TObject);
begin
  if (Trim(edtNumero.Text) <> '') then
  begin
    // Procura e Preenche a tela com os dados da Regra caso exista.
    dmCds.Cds.Data := CtrlListTerceirosRH.ListRegraXGrupo(StrToFloat(edtNumero.Text));
    if not(dmCds.Cds.IsEmpty) then
    begin
      edtNome.Caption := ' '+ dmCds.Cds.FieldByName('NOMEREGRA').asString;
      edtTipo.Caption := ' '+ dmCds.Cds.FieldByName('DESCREGRA').asString;
      IdTipoRegra := dmCds.Cds.FieldByName('IDTIPOREGRA').asInteger;
      PreencherTipo;
    end
    else
    begin
      MsgDlg('Regra/Forma de Cálculo não Encontrada.', 'Aviso', mtWarning, [mbOk, mbHelp], 0);
      edtNome.Caption := '';
      edtTipo.Caption := '';
      edtNumero.SetFocus;
    end;
  end;
end;

procedure TfrmExecutaFormaCalc.edMatricExit(Sender: TObject);
begin
  SelEmpregado;
end;

procedure TfrmExecutaFormaCalc.btnConsultarClick(Sender: TObject);
begin
  MontaSelectFormaCalc.Executar;
  if (MontaSelectFormaCalc.RetornouValor) then
  begin
    edtNumero.Text := MontaSelectFormaCalc.ValoresChave[0];
    edtNome.Caption := ' '+ MontaSelectFormaCalc.ValoresChave[1];
    edtTipo.Caption := ' '+ MontaSelectFormaCalc.ValoresChave[2];
    IdTipoRegra := StrToInt(MontaSelectFormaCalc.ValoresChave[4]);
    PreencherTipo;
  end
  else
    edtNumero.SetFocus;
end;

procedure TfrmExecutaFormaCalc.bbtnExecutarClick(Sender: TObject);
begin
  if (TComponent(Sender).Name = 'bbtnExecutar') then
    ExecutarFormaCalculo(texNormal)
  else
  if (TComponent(Sender).Name = 'bbtnPassoAPasso') then
    ExecutarFormaCalculo(texPassoAPasso)
  else
  if (TComponent(Sender).Name = 'bbtnPassos') then
    ExecutarFormaCalculo(texExecucaoPassos);
end;

procedure TfrmExecutaFormaCalc.bbtnLimparClick(Sender: TObject);
begin
  edMatric.Text := '';
  edNome.Text := '';
  edtResultRegra.Text := '';
  redValorInfo.Value := 0;
  redValorBase.Value := 0;
  rgTemLanc.ItemIndex := 1;
  rgRescisao.ItemIndex := 1;
  redParcelas.Value := 0;
  redOcorrencias.Value := 0;
end;

procedure TfrmExecutaFormaCalc.sbtnProcurarEmpregadoClick(Sender: TObject);
begin
  MontaSelectFunc.Executar;
  if (MontaSelectFunc.RetornouValor) then
  begin
    edMatric.Text := MontaSelectFunc.ValoresChave[1];
    edNome.Text := MontaSelectFunc.ValoresChave[0];
    IdPessoa := StrToFloat(MontaSelectFunc.ValoresChave[6]);
  end
  else
    edMatric.SetFocus;
end;

// -----------------------------------------------------------------------------------------
// Funções do Form
// -----------------------------------------------------------------------------------------

procedure TfrmExecutaFormaCalc.PreencherTipo;
begin
  dmCds.Cds.Data := CtrlCadRegra.ListRegra(StrToFloat(edtNumero.Text));
  cbxRegra.Checked := dmCds.Cds.IsEmpty;
  cbxForma.Checked := not(dmCds.Cds.IsEmpty);
end;

function TfrmExecutaFormaCalc.SelEmpregado: boolean;
begin
  dmCds.Cds.Data := CtrlPessoaFuncionario.ListEmpresaFuncionario(0, '', '', '', '',
    '', '', '', '', '', false, 0, 0, -1, -1, '', 0, 0, 0, 0, false, edMatric.Text);
  IdPessoa := dmCds.Cds.FieldByName('IDPESSOA').asFloat;
  edNome.Text := dmCds.Cds.FieldByName('NOME').asString;

  Result := not(dmCds.Cds.IsEmpty);
  if not(Result) then
  begin
    MsgDlg('Não Existe Empregado com esta Matrícula.', 'Erro', mtError, [mbOk, mbHelp], 0);
    edMatric.SetFocus;
  end;
end;

procedure TfrmExecutaFormaCalc.ExecutarFormaCalculo(Tipo: TTipoExecucaoFormaCalc);
var
  VarCalc: double;
begin
  if (Trim(edtNumero.Text) = '') then
  begin
    MsgDlg('Informe a Regra/Forma de Cálculo.', 'Aviso', mtWarning, [mbOk,mbHelp], 0);
    edtNumero.SetFocus;
  end
  else
  if (Trim(edMatric.Text) = '') then
  begin
    MsgDlg('Informe a Matrícula de um Empregado.', 'Aviso', mtWarning, [mbOk,mbHelp], 0);
    edMatric.SetFocus;
  end
  else
  begin
    if (Tipo in [texNormal, texExecucaoPassos]) then
      frmAguarde.Mostra('Gerando Regra / Forma de Cálculo...');
                               
    CtrlCalcRub.IdPessoa := '';
    CtrlCalcRub.IdEmpresa := Sistema.IdEmpresa;
    CtrlCalcRub.TipoEmpresa := Sistema.TipoEmpresa;
    CtrlCalcRub.TipoExecucao := Tipo;
    VarCalc := redValorInfo.Value;

    CtrlCalcRub.IniFormaCalc(FU.IFF(rgRescisao.ItemIndex=0, GERACAO_RESCISAO, GERACAO_NORMAL));
    CtrlCalcRub.CalcBeneficio(0, edtNumero.Text, FloatToStr(IdPessoa), VarCalc,
      redValorBase.Value, 1 - rgTemLanc.ItemIndex, Round(redParcelas.Value),
      Round(redOcorrencias.Value), redTotProv.Value, redTotDesc.Value);

    edtResultRegra.Text := FloatToStr(VarCalc);

    if (Tipo in [texNormal, texExecucaoPassos]) then
      frmAguarde.Apaga;

    if (CtrlCalcRub.ErroExecucao) then
      MsgDlg(CtrlCalcRub.MessageInfo, 'Erro', mtError, [mbOk, mbHelp], 0)
    else
    if (CtrlCalcRub.TipoExecucao = texExecucaoPassos) then
    begin
      with TfrmPassosFormaCalc.Create(Application) do
      begin
        NumeroRegra := StrToFloat(edtNumero.Text);
        Expressao := CtrlCalcRub.ExecucaoPassos;
        ShowModal;
        Free;
      end;
    end;
  end;
end;

end.
