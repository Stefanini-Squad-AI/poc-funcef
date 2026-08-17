unit fParamCracha;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs, CmParamReport,
  fSelPessoalMT, Db, DBTables, Wwdatsrc, IvDictio, IvMulti, IvEMulti, MAHlpBtn, StdCtrls,
  Spin, Buttons, TB97Tlbr, TB97, ExtCtrls, wwdblook, TEdNum, wwdbdatetimepicker, ComCtrls,
  CMDateTimePicker, uCmSqlParams, DBClient, uCMClientDataSet, uCtrlListTerceirosRH,
  uCtrlPessoaFuncionario;

type
  TfrmParamCracha = class(TfrmSelPessoalMT)
    tbshRelatorio: TTabSheet;
    rgSelecao: TRadioGroup;
    dblckFunc: TwwDBLookupCombo;
    rgImprimirApelido: TRadioGroup;
    rgCodBarra: TRadioGroup;
    gbxCodBar: TGroupBox;
    dblckDocCodBar: TwwDBLookupCombo;
    cbxCargoAlternativo: TCheckBox;
    CdsFunc: TCMClientDataSet;
    CdsDocPessoa: TCMClientDataSet;
    procedure bbtnConfirmarClick(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure rgSelecaoClick(Sender: TObject);
    procedure rgCodBarraClick(Sender: TObject);
  private
    CtrlListTerceirosRH: TCtrlListTerceirosRH;
    CtrlPessoaFuncionario: TCtrlPessoaFuncionario;

    procedure HabilitaBtOk;
    procedure HabilitaOpcoes(Habilita: boolean);
  end;

var
  frmParamCracha: TfrmParamCracha;

implementation

uses uMensErro, fAguarde, uSistema, uCtrlPadroes, uCtrlUsoGeralRH;

{$R *.DFM}

procedure TfrmParamCracha.FormCreate(Sender: TObject);
begin
  inherited;
  CtrlListTerceirosRH := TCtrlListTerceirosRH.Create(CtrlUsoGeralRH.UsuXFilial,
    CtrlUsoGeralRH.UsuXCCusto, CtrlUsoGeralRH.IdUsuarioGeral);
  CtrlListTerceirosRH.InitializeAs(Padroes);

  CtrlPessoaFuncionario := TCtrlPessoaFuncionario.Create(CtrlUsoGeralRH.UsuXFilial,
    CtrlUsoGeralRH.UsuXCCusto, CtrlUsoGeralRH.IdUsuarioGeral);
  CtrlPessoaFuncionario.InitializeAs(Padroes);

  cbxCargoAltern.Visible := false;
  cbxCargoAlternativo.Visible := (CdsParamRH.FieldByName('FLGDOISCARGOS').asInteger = 1);
  cbxCargoAlternativo.Checked := (CdsParamRH.FieldByName('FLGDOISCARGOS').asInteger = 1);

  CdsDocPessoa.Data := CtrlListTerceirosRH.ListTipoDocPessoa;
  CdsFunc.Data := CtrlPessoaFuncionario.ListEmpresaFuncionario(Sistema.IdEmpresa, '', '', 'A,F');
  dblckFunc.Text := CdsFunc.FieldByName('NOME').asString;
  AbrirQueryPrincipal := false;
  IrPaginaResult := false;
  rgSelecaoClick(Sender);
end;

procedure TfrmParamCracha.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  FreeAndNil(CtrlListTerceirosRH);
  FreeAndNil(CtrlPessoaFuncionario);
  inherited;
end;

procedure TfrmParamCracha.rgSelecaoClick(Sender: TObject);
begin
  dblckFunc.Visible := (rgSelecao.ItemIndex = 0);
  HabilitaOpcoes(not(dblckFunc.Visible));
  HabilitaBtOk;
end;

procedure TfrmParamCracha.rgCodBarraClick(Sender: TObject);
begin
  gbxCodBar.Visible := (rgCodBarra.ItemIndex = 1);
end;

procedure TfrmParamCracha.bbtnConfirmarClick(Sender: TObject);
var
  sListaIdPessoa: string;
begin
  frmAguarde.Mostra('Emissão de Crachá');
  frmAguarde.Pos := 0;

  inherited;

  if (rgSelecao.ItemIndex = 1) then
  begin
    CdsPrincipal.DisableControls;
    sqlPrincipal.Open;

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
      MsgDlg('Nenhuma pessoa selecionada com os parâmetros indicados.', 'Aviso',
        mtWarning, [mbOk,mbHelp], 0);
      ModalResult := mrNone;
      exit;
    end;
  end
  else
    sListaIdPessoa := CdsFunc.FieldByName('IDPESSOA').asString;

  Cmp_Padrao.ParamByName('ListaIdPessoa').asString := sListaIdPessoa;
  Cmp_Padrao.ParamByName('IdDocumentoCodBar').asFloat := CdsDocPessoa.FieldByName('IDDOCUMENTO').asFloat;
  Cmp_Padrao.ParamByName('ImpressaoCodBar').asInteger := rgCodBarra.ItemIndex;
  Cmp_Padrao.ParamByName('ImprimirCargoAlternativo').asBoolean := cbxCargoAltern.Checked;
  Cmp_Padrao.ParamByName('ImprimirApelido').asBoolean := (rgImprimirApelido.ItemIndex = 0);
end;

procedure TfrmParamCracha.HabilitaBtOk;
begin
  bbtnConfirmar.Enabled := ((rgSelecao.ItemIndex = 0) and (Trim(dblckFunc.Text) <> '')) or
    (rgSelecao.ItemIndex = 1);
end;

procedure TfrmParamCracha.HabilitaOpcoes(Habilita: boolean);
begin
  tsDadosFunc.TabVisible := Habilita;
  tsDadosPess.TabVisible := Habilita;
  tsDadosOutros.TabVisible := Habilita;
  tbsDemit.TabVisible := Habilita;
end;

end.
