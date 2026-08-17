unit fParamExtratoBH;
// 4108
interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs, DB,
  DBClient, fSelPessoalMT, uCmSqlParams, uCMClientDataSet, Wwdatsrc, CmParamReport, IvDictio,
  IvMulti, MAHlpBtn, StdCtrls, Buttons, TB97Tlbr, TB97, ExtCtrls, wwdblook, CMDateTimePicker,
  wwdbdatetimepicker, Spin, TEdNum, ComCtrls, TREdit,  uCtrlPessoaFuncionario,uctrlfuncoesrh,
  CheckLst, ColorCheckListBox, IvEMulti;

type
  TfrmParamExtratoBH = class(TfrmSelPessoalMT)
    tbshRelatorio: TTabSheet;
    CdsFunc: TCMClientDataSet;
    rgSelecao: TRadioGroup;
    dblckFunc: TwwDBLookupCombo;
    gbxFaixaData: TGroupBox;
    Label9: TLabel;
    edData1: TCMDateTimePicker;
    edData2: TCMDateTimePicker;
    rgListaProcessados: TRadioGroup;
    rgSimulacao: TRadioGroup;
    gbxSimulacao: TGroupBox;
    Label10: TLabel;
    Label11: TLabel;
    Label12: TLabel;
    Label13: TLabel;
    Label14: TLabel;
    Label15: TLabel;
    redPositivo: TRealEdit;
    redNegativo: TRealEdit;
    procedure FormCreate(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure rgSelecaoClick(Sender: TObject);
    procedure bbtnConfirmarClick(Sender: TObject);
    procedure rgSimulacaoClick(Sender: TObject);
  private
    CtrlPessoaFuncionario: TCtrlPessoaFuncionario;

    procedure HabilitaBtOk;
    procedure HabilitaOpcoes(Habilita: boolean);
  end;

var
  frmParamExtratoBH: TfrmParamExtratoBH;

implementation

uses uMensErro, fAguarde, uSistema, uCtrlPadroes, uCtrlUsoGeralRH;

{$R *.dfm}

procedure TfrmParamExtratoBH.FormCreate(Sender: TObject);
begin
  inherited;
  CtrlPessoaFuncionario := TCtrlPessoaFuncionario.Create(CtrlUsoGeralRH.UsuXFilial,
    CtrlUsoGeralRH.UsuXCCusto, CtrlUsoGeralRH.IdUsuarioGeral);
  CtrlPessoaFuncionario.InitializeAs(Padroes);

  CdsFunc.Data := CtrlPessoaFuncionario.ListEmpresaFuncionario(Sistema.IdEmpresa,
    'F.IDPESSOA, F.FLGMARCAPONTO, P.NOME', '', 'A,F');
  CdsFunc.Filter := 'FLGMARCAPONTO = 1';
  CdsFunc.Filtered := true;
  dblckFunc.Text := CdsFunc.FieldByName('NOME').asString;

  //AbrirQueryPrincipal := false;
  IrPaginaResult := false;
  rgSelecaoClick(Sender);
  edData1.Date := (Date - 30);
  edData2.Date := Date;
end;

procedure TfrmParamExtratoBH.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  FreeAndNil(CtrlPessoaFuncionario);
  inherited;
end;

procedure TfrmParamExtratoBH.rgSelecaoClick(Sender: TObject);
begin
  dblckFunc.Visible := (rgSelecao.ItemIndex = 0);
  HabilitaOpcoes(not(dblckFunc.Visible));
  HabilitaBtOk;
end;

procedure TfrmParamExtratoBH.bbtnConfirmarClick(Sender: TObject);
var
  sListaIdPessoa: string;
begin
  frmAguarde.Mostra(fu.CMTranslate('Extrato do Banco de Horas'));
  frmAguarde.Pos := 0;

  if (rgSelecao.ItemIndex = 1) then
  begin
    CdsPrincipal.DisableControls;

    inherited;
    sListaIdPessoa := '';
    while not(CdsPrincipal.EOF) do
    begin
      if (CdsPrincipal.FieldByName('FLGMARCAPONTO').asInteger = 1) then
      begin
        if (sListaIdPessoa = '') then
          sListaIdPessoa := CdsPrincipal.FieldByName('IDPESSOA').asString
        else
          sListaIdPessoa := sListaIdPessoa +','+ CdsPrincipal.FieldByName('IDPESSOA').asString;
      end;
      CdsPrincipal.Next;
    end;

    CdsPrincipal.EnableControls;

    if (sListaIdPessoa = '') then
    begin
      frmAguarde.Apaga;
      MsgDlg(fu.CMTranslate('Nenhuma pessoa selecionada com os parâmetros indicados.'),
        fu.CMTranslate('Aviso'), mtInformation, [mbOk,mbHelp], 0);
      ModalResult := mrNone;
      exit;
    end;
  end
  else
    sListaIdPessoa := CdsFunc.FieldByName('IDPESSOA').asString;

  Cmp_Padrao.ParamByName('NomeEmpresa').asString := Sistema.NomeEmpresa;
  Cmp_Padrao.ParamByName('ListaIdPessoa').asString := sListaIdPessoa;
  Cmp_Padrao.ParamByName('DataInicial').asDateTime := edData1.Date;
  Cmp_Padrao.ParamByName('DataFinal').asDateTime := edData2.Date;
  Cmp_Padrao.ParamByName('ListaProcessados').asBoolean := (rgListaProcessados.ItemIndex = 0);
  Cmp_Padrao.ParamByName('Simula').asBoolean := (rgSimulacao.ItemIndex = 0);
  Cmp_Padrao.ParamByName('PercPos').asFloat := redPositivo.Value;
  Cmp_Padrao.ParamByName('PercNeg').asFloat := redNegativo.Value;
end;

// -------------------------------------------------------------------------------------
// Funções do Form
// -------------------------------------------------------------------------------------

procedure TfrmParamExtratoBH.HabilitaBtOk;
begin
  bbtnConfirmar.Enabled := ((rgSelecao.ItemIndex = 0) and (Trim(dblckFunc.Text) <> '')) or
    (rgSelecao.ItemIndex = 1);
end;

procedure TfrmParamExtratoBH.HabilitaOpcoes(Habilita: boolean);
begin
  tsDadosFunc.TabVisible := Habilita;
  tsDadosPess.TabVisible := Habilita;
  tsDadosOutros.TabVisible := Habilita;
  tbsDemit.TabVisible := Habilita;
end;

procedure TfrmParamExtratoBH.rgSimulacaoClick(Sender: TObject);
begin
  inherited;
  gbxSimulacao.Visible := rgSimulacao.ItemIndex = 0;
end;

end.
