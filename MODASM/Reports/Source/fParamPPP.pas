unit fParamPPP;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs, fSelPessoalMT,
  DBTables, Db, Wwdatsrc, MAHlpBtn, StdCtrls, Buttons, TEdNum, Spin, wwdblook, ExtCtrls,
  Qrctrls, quickrpt, TB97, ComCtrls, TB97Tlbr, IvDictio, IvMulti, IvEMulti, CMDateTimePicker,
  CheckLst, wwdbdatetimepicker, MontaSelect, uCmSqlParams, DBClient, uCMClientDataSet,
  CmParamReport, uCtrlPessoaFuncionario;

type
  TfrmParamPPP = class(TfrmSelPessoalMT)
    tbshRelatorio: TTabSheet;
    gbxFaixaData: TGroupBox;
    edData1: TCMDateTimePicker;
    edData2: TCMDateTimePicker;
    Label9: TLabel;
    MontaSelect: TMontaSelect;
    gbxAssinante: TGroupBox;
    Label10: TLabel;
    edAssinante: TEdit;
    bbtnBuscaEmpregado: TBitBtn;
    Label11: TLabel;
    edCargoAssinante: TEdit;
    CdsFunc: TCMClientDataSet;
    rgSelecao: TRadioGroup;
    dblckFunc: TwwDBLookupCombo;
    gbxObservacao: TGroupBox;
    memObservacao: TMemo;
    rgImprimir3: TRadioGroup;
    procedure FormCreate(Sender: TObject);
    procedure bbtnConfirmarClick(Sender: TObject);
    procedure edData1Exit(Sender: TObject);
    procedure bbtnBuscaEmpregadoClick(Sender: TObject);
    procedure rgSelecaoClick(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
  private
    CtrlPessoaFuncionario: TCtrlPessoaFuncionario;

    procedure HabilitaBtOk;
    procedure HabilitaOpcoes(Habilita: boolean);
  end;

var
  frmParamPPP: TfrmParamPPP;

implementation

uses fAguarde, uCtrlUsoGeralRH, uCtrlPadroes, uSistema;

{$R *.DFM}

procedure TfrmParamPPP.FormCreate(Sender: TObject);
begin
  inherited;
  CtrlPessoaFuncionario := TCtrlPessoaFuncionario.Create(CtrlUsoGeralRH.UsuXFilial,
    CtrlUsoGeralRH.UsuXCCusto, CtrlUsoGeralRH.IdUsuarioGeral);
  CtrlPessoaFuncionario.InitializeAs(Padroes);
  CdsFunc.Data := CtrlPessoaFuncionario.ListEmpresaFuncionario(Sistema.IdEmpresa);
  dblckFunc.LookupValue := CdsFunc.FieldByName('IDPESSOA').asString;
  dblckFunc.Update;

  tsDadosFunc.TabVisible := False;
  tsDadosPess.TabVisible := False;
  tsDadosOutros.TabVisible := False;
  tbsDemit.TabVisible := False;

  edData1.Date := (Date - 365);
  edData2.Date := (Date);
  pgctrlPrincipal.ActivePageIndex := 0;
  IrPaginaResult := false;
end;

procedure TfrmParamPPP.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
  inherited;
  FreeAndNil(CtrlPessoaFuncionario);
end;

procedure TfrmParamPPP.edData1Exit(Sender: TObject);
begin
  HabilitaBtOk;
end;

procedure TfrmParamPPP.bbtnBuscaEmpregadoClick(Sender: TObject);
begin
  MontaSelect.Executar;
  if (MontaSelect.RetornouValor) then
  begin
    edAssinante.Text := MontaSelect.ValoresChave[1];
    edCargoAssinante.Text := MontaSelect.ValoresChave[3];
  end;
end;

procedure TfrmParamPPP.bbtnConfirmarClick(Sender: TObject);
var
  sListaIdFuncSel: string;
begin
  frmAguarde.Mostra('PPP - Perfil Profissiográfico Previdenciário');
  frmAguarde.Pos := 0;

  inherited;

  if (rgSelecao.ItemIndex = 1) then
  begin
    sListaIdFuncSel := '';
    while not(CdsPrincipal.EOF) do
    begin
      if (sListaIdFuncSel = '') then
        sListaIdFuncSel := CdsPrincipal.FieldByName('IDPESSOA').asString
      else
        sListaIdFuncSel := sListaIdFuncSel +','+ CdsPrincipal.FieldByName('IDPESSOA').asString;

      CdsPrincipal.Next;
    end;
  end
  else
    sListaIdFuncSel := CdsFunc.FieldByName('IDPESSOA').asString;

  Cmp_Padrao.ParamByName('NomeAssinante').asString := edAssinante.Text;
  Cmp_Padrao.ParamByName('ListaIdFunc').asString := sListaIdFuncSel;
  Cmp_Padrao.ParamByName('DataInicial').asDateTime := edData1.Date;
  Cmp_Padrao.ParamByName('DataFinal').asDateTime := edData2.Date;
  Cmp_Padrao.ParamByName('CargoAssinante').asString := edCargoAssinante.Text;
  Cmp_Padrao.ParamByName('Observacao').asString := memObservacao.Text;
  Cmp_Padrao.ParamByName('ImprimirSecao3').asBoolean := rgImprimir3.ItemIndex = 0;
end;

// ------------------------------------------------------------------------------------------
// Funções do Form
// ------------------------------------------------------------------------------------------

procedure TfrmParamPPP.HabilitaBtOk;
begin
  bbtnConfirmar.Enabled := (Trim(edData1.Text) <> '') and (Trim(edData2.Text) <> '') and
    (edData1.Date <= edData2.Date);
end;

procedure TfrmParamPPP.rgSelecaoClick(Sender: TObject);
begin
  inherited;
  dblckFunc.Visible := (rgSelecao.ItemIndex = 0);
  HabilitaOpcoes(not(dblckFunc.Visible));
  HabilitaBtOk;
end;

procedure TfrmParamPPP.HabilitaOpcoes(Habilita: boolean);
begin
  tsDadosFunc.TabVisible := Habilita;
  tsDadosPess.TabVisible := Habilita;
  tsDadosOutros.TabVisible := Habilita;
  tbsDemit.TabVisible := Habilita;
end;

end.
