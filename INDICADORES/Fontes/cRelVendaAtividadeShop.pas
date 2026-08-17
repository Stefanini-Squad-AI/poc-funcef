unit cRelVendaAtividadeShop;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  fParamReports_Padrao, CmParamReport, IvDictio, IvMulti, IvEMulti,
  MAHlpBtn, StdCtrls, Buttons, TB97Tlbr, TB97, ExtCtrls, Mask,
  wwdbedit, Wwdbspin, fcCombo, fcColorCombo, Db, DBClient,
  uCMClientDataSet, wwdblook, uCtrlAtividade;

type
  TcfgRelVendaAtividadeShop = class(TfrmParamReports_Padrao)
    GroupBox1: TGroupBox;
    Label1: TLabel;
    Label2: TLabel;
    cboMes: TComboBox;
    spnAno: TwwDBSpinEdit;
    chkLinhas: TCheckBox;
    chkCorLinha: TCheckBox;
    cboCorLinha: TfcColorCombo;
    Label7: TLabel;
    DBcboAtividade: TwwDBLookupCombo;
    cdsAtividade: TCMClientDataSet;
    cdsAtividadeATVDESCRICAO: TStringField;
    cdsAtividadeIDATIVIDADE: TFloatField;
    procedure FormCreate(Sender: TObject);
    procedure bbtnConfirmarClick(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
  private
    { Private declarations }
    CtrlAtividade : TCtrlAtividade;

    function VerificaPreenchimento : Boolean;
  public
    { Public declarations }
  end;

var
  cfgRelVendaAtividadeShop: TcfgRelVendaAtividadeShop;

implementation

uses dBaseDados, usistema, uDiasUteis, uComunsImobiliario, uVerificaPreenchimento, uMensErro, uModuloIndicadores;

{$R *.DFM}

procedure TcfgRelVendaAtividadeShop.FormCreate(Sender: TObject);
begin
  inherited;
  // Cria e inicializa o CtrlObject de Atividades
  CtrlAtividade := TCtrlAtividade.Create;
  CtrlAtividade.Initialize(DtmBaseDados.DbBaseDados, True, Sistema.ConnectionType,
                      Sistema.ConnectionSide, Sistema.AppRemoteServer, True,
                      ComunsImobiliario.MensErroMT);

  cdsAtividade.Data := CtrlAtividade.LookupAtividade;
  spnAno.Value      := DiasUteis.ExtraiAno(Date);
  cboMes.ItemIndex  := DiasUteis.ExtraiMes(Date) -1;
end;

function TcfgRelVendaAtividadeShop.VerificaPreenchimento: Boolean;
begin
  Result := False;
  try
    if ModuloIndicadores.iIdIndVenda = -1 then
        raise EValidacao.CreateVal('Parâmetro de Vendas não foi definido',dbCboAtividade);
    if ModuloIndicadores.iIdIndOverage = -1 then
        raise EValidacao.CreateVal('Parâmetro de Overage não foi definido',dbCboAtividade);
    if ModuloIndicadores.iIdIndAluguel = -1 then
        raise EValidacao.CreateVal('Parâmetro de Aluguel Mínimo não foi definido',dbCboAtividade);
    if ModuloIndicadores.iIdIndABL = -1 then
        raise EValidacao.CreateVal('Parâmetro de ABL não foi definido',dbCboAtividade);
    if ModuloIndicadores.iMoeCodigoUPV = -1 then
        raise EValidacao.CreateVal('Parâmetro de UPV não foi definido',dbCboAtividade);
     if cboMes.ItemIndex = -1 then
        raise EValidacao.CreateVal('Informe o Mês de Referência',cboMes);
     if spnAno.Value <= 0 then
        raise EValidacao.CreateVal('Informe o Ano de Referência',spnAno);
  except
     on ev : EValidacao do begin
        if ev.Show then MsgDlg(ev.message, 'Aviso', mtWarning, [mbOk], 0);
        Repaint;
        if ev.Control.CanFocus then ev.Control.SetFocus;
        Exit;
     end;
  end;
  Result := True;
end;

procedure TcfgRelVendaAtividadeShop.bbtnConfirmarClick(Sender: TObject);
var CorLinha : TColor;
    iPosCor  : Integer;
begin
  inherited;
  if VerificaPreenchimento then begin
    if DBcboAtividade.Text <> '' then
         cmp_Padrao.ParamByName('idAtividade').AsInteger := StrToInt(DBcboAtividade.lookupValue)
    else cmp_Padrao.ParamByName('idAtividade').AsInteger := -1;
    cmp_Padrao.ParamByName('iMes').AsInteger        := cboMes.ItemIndex + 1;
    cmp_Padrao.ParamByName('iAno').AsFloat          := spnAno.Value;

    // Carrega variáveis com os parametros de cores de linha e separadores
    iPosCor  := 0;
    CorLinha := cboCorLinha.SelectedColor;
    ComunsImobiliario.BuscaCorLinha(iPosCor, CorLinha);
    cmp_Padrao.ParamByName('bSeparador').AsBoolean := chkLinhas.Checked;
    cmp_Padrao.ParamByName('bCorLinha').AsBoolean  := chkCorLinha.Checked;
    cmp_Padrao.ParamByName('iCorLinha').AsInteger  := iPosCor;

    if bbtnConfirmar.ModalResult <> mrOk then begin
       bbtnConfirmar.ModalResult := mrOk;
       bbtnConfirmar.Click;
    end;
  end;
end;

procedure TcfgRelVendaAtividadeShop.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  inherited;
  FreeAndNil( CtrlAtividade );
end;

end.
