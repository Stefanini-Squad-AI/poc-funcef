unit cRelLancForaComp;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  fParamReports_Padrao, CmParamReport, IvDictio, IvMulti, IvEMulti,
  MAHlpBtn, StdCtrls, Buttons, TB97Tlbr, TB97, ExtCtrls,
  wwdbdatetimepicker, CMDateTimePicker, wwdblook, mCliente, mUsuario,
  mFornecedor, Db, DBClient, uCMClientDataSet, uCtrlTipoCustoRecImov,
  fcCombo, fcColorCombo;

type
  TcfgRelLancForaComp = class(TfrmParamReports_Padrao)
    GroupBox1: TGroupBox;
    GroupBox2: TGroupBox;
    GroupBox3: TGroupBox;
    GroupBox4: TGroupBox;
    GroupBox5: TGroupBox;
    cmdDataLibInicial: TCMDateTimePicker;
    cmdDataLibFinal: TCMDateTimePicker;
    Label1: TLabel;
    Label2: TLabel;
    Label3: TLabel;
    cmdDataLancInicial: TCMDateTimePicker;
    Label4: TLabel;
    cmdDataLancFinal: TCMDateTimePicker;
    DBcboTipoRecDesp: TwwDBLookupCombo;
    MolUsuario: TMolUsuario;
    rdbFornecedor: TRadioButton;
    RdbCliente: TRadioButton;
    molCliente: TmolCliente;
    molFornecedor: TmolFornecedor;
    CdsTipoRecDesp: TCMClientDataSet;
    CdsTipoRecDespIDTIPOCUSTORECIMO: TFloatField;
    CdsTipoRecDespDESCCUSTORECIMO: TStringField;
    cboCorLinha: TfcColorCombo;
    chkLinhas: TCheckBox;
    chkCorLinha: TCheckBox;
    procedure bbtnConfirmarClick(Sender: TObject);
    procedure RdbClienteClick(Sender: TObject);
    procedure rdbFornecedorClick(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure FormDestroy(Sender: TObject);

  private
    CtrlTipoCustoRecImov : TCtrlTipoCustoRecImov;
    
    function VerificaPreenchimento : boolean;

  public

    { Public declarations }

  end;

var
  cfgRelLancForaComp: TcfgRelLancForaComp;

implementation

uses
  uVerificaPreenchimento, UMensErro, dBaseDados, uSistema, uComunsImobiliario;

{$R *.DFM}

{ TcfgRelLancForaComp }

function TcfgRelLancForaComp.VerificaPreenchimento: boolean;
begin
  Result := False;
  try
    // Trata a data de Liberação
    if ((cmdDataLibInicial.Text <> '') and (cmdDataLibFinal.Text = '')) then
      raise EValidacao.CreateVal('A data de liberação final não foi preenchida', cmdDataLibFinal);

    if ((cmdDataLibInicial.Text = '') and (cmdDataLibFinal.Text <> '')) then
      raise EValidacao.CreateVal('A data de liberação inicial não foi preenchida', cmdDataLibInicial);

    if (cmdDataLibFinal.DateTime < cmdDataLibInicial.DateTime) then
      raise EValidacao.CreateVal('A data de liberação inicial está maior que a data de liberação final.', cmdDataLibInicial);

    // Trata a data de Lançamento
    if ((cmdDataLancInicial.Text <> '') and (cmdDataLancFinal.Text = '')) then
      raise EValidacao.CreateVal('A data de Lançamento final não foi preenchida', cmdDataLancFinal);

    if ((cmdDataLancInicial.Text = '') and (cmdDataLancFinal.Text <> '')) then
      raise EValidacao.CreateVal('A data de Lançamento inicial não foi preenchida', cmdDataLancInicial);

    if (cmdDataLancFinal.DateTime < cmdDataLancInicial.DateTime) then
      raise EValidacao.CreateVal('A data de lançamento inicial está maior que a data de lançamento final.', cmdDataLancInicial);

  except
    on ev : EValidacao do
      begin
        if ev.Show then
          MsgDlg(ev.message, 'Aviso', mtWarning, [mbOk], 0);

        Repaint;

        if ev.Control.CanFocus then
          ev.Control.SetFocus;

        Exit;
      end;
  end;

  Result := True;
end;

procedure TcfgRelLancForaComp.bbtnConfirmarClick(Sender: TObject);
var
  CorLinha : TColor;
  iPosCor  : Integer;
begin
  inherited;

  if VerificaPreenchimento then
    begin
      // Atribui as datas de Liberação
      if cmdDataLibInicial.Text <> '' then begin
        cmp_Padrao.ParamByName('DataIniLib').AsDateTime := cmdDataLibInicial.DateTime;
        cmp_Padrao.ParamByName('DataFimLib').AsDateTime := cmdDataLibFinal.DateTime;
      end
      else begin
        cmp_Padrao.ParamByName('DataIniLib').AsDateTime := -1;
        cmp_Padrao.ParamByName('DataFimLib').AsDateTime := -1;
      end;

      // Atribui as datas de Lançamento
      if cmdDataLancInicial.Text <> '' then begin
        cmp_Padrao.ParamByName('DataIniLanc').AsDateTime := cmdDataLancInicial.DateTime;
        cmp_Padrao.ParamByName('DataFimLanc').AsDateTime := cmdDataLancFinal.DateTime;
      end
      else begin
        cmp_Padrao.ParamByName('DataIniLanc').AsDateTime := -1;
        cmp_Padrao.ParamByName('DataFimLanc').AsDateTime := -1;
      end;

      // Atribui Cliente ou Fornecedor
      if rdbCliente.Checked then begin
        if molCliente.edtRazaoSocial.Text <> '' then
          cmp_Padrao.ParamByName('iIdFavorecido').AsInteger := molCliente.iCliente
        else
          cmp_Padrao.ParamByName('iIdFavorecido').AsInteger := -1;
      end
      else begin
        if molFornecedor.edtRazaoSocial.Text <> '' then
          cmp_Padrao.ParamByName('iIdFavorecido').AsInteger := molFornecedor.iFornecedor
        else
          cmp_Padrao.ParamByName('iIdFavorecido').AsInteger := -1;
      end;

      // Atribui tipo de Receita ou Despesa
      if DBcboTipoRecDesp.Text <> '' then
        cmp_Padrao.ParamByName('iIdTipoRecDesp').AsInteger := StrToInt(DBcboTipoRecDesp.LookupValue)
      else
        cmp_Padrao.ParamByName('iIdTipoRecDesp').AsInteger := -1;

      // Atribui o Usuário
      if molUsuario.edtUsuario.Text <> '' then
        cmp_Padrao.ParamByName('iIdUsuario').AsInteger := molUsuario.iUsuario
      else
        cmp_Padrao.ParamByName('iIdUsuario').AsInteger := -1;

      // Carrega variáveis com os parametros de cores de linha e separadores
      iPosCor  := 0;
      CorLinha := cboCorLinha.SelectedColor;

      ComunsImobiliario.BuscaCorLinha(iPosCor, CorLinha);

      cmp_Padrao.ParamByName('bSeparador').AsBoolean := chkLinhas.Checked;
      cmp_Padrao.ParamByName('bCorLinha').AsBoolean  := chkCorLinha.Checked;
      cmp_Padrao.ParamByName('iCorLinha').AsInteger  := iPosCor;

      // Acerto no Padrão CM
      if bbtnConfirmar.ModalResult <> mrOk then begin
         bbtnConfirmar.ModalResult := mrOk;
         bbtnConfirmar.Click;
      end;

    end;
end;

procedure TcfgRelLancForaComp.RdbClienteClick(Sender: TObject);
begin
  inherited;
  molCliente.Visible := rdbCliente.Checked;
  molFornecedor.Visible := rdbFornecedor.Checked;
  molFornecedor.btnLimpaForn.OnClick(Self);
end;

procedure TcfgRelLancForaComp.rdbFornecedorClick(Sender: TObject);
begin
  inherited;
  molCliente.Visible := rdbCliente.Checked;
  molFornecedor.Visible := rdbFornecedor.Checked;
  molCliente.btnLimpaCli.OnClick(Self);
end;

procedure TcfgRelLancForaComp.FormCreate(Sender: TObject);
begin
  inherited;
  CtrlTipoCustoRecImov := TCtrlTipoCustoRecImov.Create;
  CtrlTipoCustoRecImov.Initialize(dtmBaseDados.dbBaseDados, true, Sistema.ConnectionType,
                                  Sistema.ConnectionSide, Sistema.AppRemoteServer, true,
                                  ComunsImobiliario.MensErroMT);

  CdsTipoRecDesp.Data := CtrlTipoCustoRecImov.LookupTipoCustoRecImov(Sistema.IdModulo);
end;

procedure TcfgRelLancForaComp.FormDestroy(Sender: TObject);
begin
  FreeAndNil(CtrlTipoCustoRecImov);
  inherited;
end;

end.
