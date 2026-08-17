unit fParamQuantAcessos;
// 4058
interface

uses
  Windows, Messages, SysUtils,  Classes, Graphics, Controls, Forms, Dialogs,
  fSelPessoalMT, uCmSqlParams, DB, DBClient, uCMClientDataSet, Wwdatsrc, CmParamReport,
  IvDictio, IvMulti, MAHlpBtn, StdCtrls, Buttons, TB97Tlbr, TB97, ExtCtrls, wwdblook,
  wwdbdatetimepicker, CMDateTimePicker, Spin, TEdNum, ComCtrls, TREdit,uctrlfuncoesrh, 
  uCtrlPessoaFuncionario, CheckLst, ColorCheckListBox, IvEMulti,uctrlselpessoal;

type
  TfrmParamQuantAcessos = class(TfrmSelPessoalMT)
    tbshRelatorio: TTabSheet;
    CdsFunc: TCMClientDataSet;
    rgSelecao: TRadioGroup;
    dblckFunc: TwwDBLookupCombo;
    gbxFaixaData: TGroupBox;
    Label9: TLabel;
    edData1: TCMDateTimePicker;
    edData2: TCMDateTimePicker;
    procedure FormCreate(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure rgSelecaoClick(Sender: TObject);
    procedure bbtnConfirmarClick(Sender: TObject);
  private
    CtrlPessoaFuncionario: TCtrlPessoaFuncionario;
    CtrlSelPessoal : TCtrlSelPessoal;

    procedure HabilitaBtOk;
    procedure HabilitaOpcoes(Habilita: boolean);
  end;

var
  frmParamQuantAcessos: TfrmParamQuantAcessos;

implementation

uses uMensErro, fAguarde, uSistema, uCtrlPadroes, uCtrlUsoGeralRH;

{$R *.dfm}

procedure TfrmParamQuantAcessos.FormCreate(Sender: TObject);
begin
  inherited;
  CtrlPessoaFuncionario := TCtrlPessoaFuncionario.Create(CtrlUsoGeralRH.UsuXFilial,
    CtrlUsoGeralRH.UsuXCCusto, CtrlUsoGeralRH.IdUsuarioGeral);
  CtrlPessoaFuncionario.InitializeAs(Padroes);

  CdsFunc.Data := CtrlPessoaFuncionario.ListEmpresaFuncionario(
    Sistema.IdEmpresa, '', '', 'A,F');
  dblckFunc.Text := CdsFunc.FieldByName('NOME').asString;

  AbrirQueryPrincipal := false;
  IrPaginaResult := false;
  rgSelecaoClick(Sender);
  edData1.Date := (Date - 30);
  edData2.Date := (Date);
end;

procedure TfrmParamQuantAcessos.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  FreeAndNil(CtrlPessoaFuncionario);
  inherited;
end;

procedure TfrmParamQuantAcessos.rgSelecaoClick(Sender: TObject);
begin
  dblckFunc.Visible := (rgSelecao.ItemIndex = 0);
  HabilitaOpcoes(not(dblckFunc.Visible));
  HabilitaBtOk;
end;

procedure TfrmParamQuantAcessos.bbtnConfirmarClick(Sender: TObject);
var
  sListaIdPessoa: string;
begin
  frmAguarde.Mostra(fu.CMTranslate('Quantidade de Acessos'));
  frmAguarde.Pos := 0;

  inherited;

  if (rgSelecao.ItemIndex = 1) then
  begin
    CdsPrincipal.DisableControls;
    //*AbrirCdsPrincipal;

    sListaIdPessoa := '';
    while not(CdsPrincipal.EOF) do
    begin
      if (sListaIdPessoa = '') then
        sListaIdPessoa := CdsPrincipal.FieldByName('IDPESSOA').asString
      else
        sListaIdPessoa := sListaIdPessoa +','+ CdsPrincipal.FieldByName('IDPESSOA').asString;
      CdsPrincipal.Next;
    end;

    CdsPrincipal.EnableControls;

    if (sListaIdPessoa = '') then
    begin
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
end;

// -------------------------------------------------------------------------------------
// Funções do Form
// -------------------------------------------------------------------------------------

procedure TfrmParamQuantAcessos.HabilitaBtOk;
begin
  bbtnConfirmar.Enabled := ((rgSelecao.ItemIndex = 0) and (Trim(dblckFunc.Text) <> '')) or
    (rgSelecao.ItemIndex = 1);
end;

procedure TfrmParamQuantAcessos.HabilitaOpcoes(Habilita: boolean);
begin
  tsDadosFunc.TabVisible := Habilita;
  tsDadosPess.TabVisible := Habilita;
  tsDadosOutros.TabVisible := Habilita;
  tbsDemit.TabVisible := Habilita;
end;

end.
