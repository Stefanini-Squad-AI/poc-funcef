unit fParamFormAvalBranco;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs, DBTables, Db,
  Wwdatsrc, MAHlpBtn, StdCtrls, Buttons, TEdNum, Spin, wwdblook, ExtCtrls, TB97, ComCtrls,
  FTelaAut, TB97Tlbr, IvDictio, IvMulti, IvEMulti, wwdbdatetimepicker, CMDateTimePicker,
  fSelPessoalMT, uCmSqlParams, DBClient, uCMClientDataSet, CmParamReport, uCtrlTipAval,
  uCtrlPessoaFuncionario;

type
  TfrmParamFormAvalBranco = class(TfrmSelPessoalMT)
    tbshRelat: TTabSheet;
    lblNomeEmp: TLabel;
    dblckNome: TwwDBLookupCombo;
    lblTipoAval: TLabel;
    dblckTipAval: TwwDBLookupCombo;
    gbxOrdem: TGroupBox;
    cmbOrderBy: TComboBox;
    rgSelecao: TRadioGroup;
    rgObserv: TRadioGroup;
    CdsTipAval: TCMClientDataSet;
    CdsPessoal: TCMClientDataSet;
    procedure bbtnConfirmarClick(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure rgSelecaoClick(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
  private
    CtrlTipAval: TCtrlTipAval;
    CtrlPessoaFuncionario: TCtrlPessoaFuncionario;
  end;

var
  frmParamFormAvalBranco: TfrmParamFormAvalBranco;

implementation

uses uMensErro, uSistema, uCtrlPadroes, uCtrlUsoGeralRH, uCtrlFuncoesRH;

{$R *.DFM}

procedure TfrmParamFormAvalBranco.FormCreate(Sender: TObject);
begin
  inherited;
  CtrlTipAval := TCtrlTipAval.Create;
  CtrlTipAval.InitializeAs(Padroes);

  CtrlPessoaFuncionario := TCtrlPessoaFuncionario.Create(CtrlUsoGeralRH.UsuXFilial,
    CtrlUsoGeralRH.UsuXCCusto, CtrlUsoGeralRH.IdUsuarioGeral);
  CtrlPessoaFuncionario.InitializeAs(Padroes);

  CdsTipAval.Data := CtrlTipAval.ListTipoAval(0, '0,1');
  dblckTipAval.SelText := CdsTipAval.FieldByName('DESCRTIPOAVAL').asString;

  CdsPessoal.Data := CtrlPessoaFuncionario.ListEmpresaFuncionario(Sistema.IdEmpresa,
    'P.NOME, F.MATRICULA, F.IDPESSOA');
  dblckNome.SelText := CdsPessoal.FieldByName('NOME').asString;

  cmbOrderBy.ItemIndex := 0;
  IrPaginaResult := false;
end;

procedure TfrmParamFormAvalBranco.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  FreeAndNil(CtrlTipAval);
  FreeAndNil(CtrlPessoaFuncionario);
  inherited;
end;

procedure TfrmParamFormAvalBranco.rgSelecaoClick(Sender: TObject);
begin
  dblckNome.Visible := (rgSelecao.ItemIndex <> 1);
  lblNomeEmp.Visible := (rgSelecao.ItemIndex <> 1);
end;

procedure TfrmParamFormAvalBranco.bbtnConfirmarClick(Sender: TObject);
var
  sListaIdFunc: string;
begin
  if (rgSelecao.ItemIndex = 1) then
  begin
    inherited;

    sListaIdFunc := '';
    while not(CdsPrincipal.EOF) do
    begin
      if (sListaIdFunc = '') then
        sListaIdFunc := CdsPrincipal.FieldByName('IDPESSOA').asString
      else
        sListaIdFunc := sListaIdFunc +','+ CdsPrincipal.FieldByName('IDPESSOA').asString;

      CdsPrincipal.Next;
    end;

    if (sListaIdFunc = '') then
    begin
      ModalResult := mrNone;
      MsgDlg('Não há dados a serem exibidos.'+CR_LF+
             'Verifique.', 'Aviso', mtInformation, [mbOk,mbHelp], 0);
      exit;
    end;
  end
  else
    sListaIdFunc := CdsPessoal.FieldByName('IDPESSOA').asString;

  Cmp_Padrao.ParamByName('ListaIdFunc').asString := sListaIdFunc;
  Cmp_Padrao.ParamByName('ComObserv').asInteger := rgObserv.ItemIndex;
  Cmp_Padrao.ParamByName('SeqRelat').asInteger := cmbSequencia.ItemIndex;
  Cmp_Padrao.ParamByName('SeqAval').asInteger := cmbOrderBy.ItemIndex;
  Cmp_Padrao.ParamByName('TipoAval').asString := CdsTipAval.FieldByName('CODTIPOAVAL').asString;
end;

end.
