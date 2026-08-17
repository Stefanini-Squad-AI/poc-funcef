unit cRelVendaFranquiaShop;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  fParamReports_Padrao, CmParamReport, IvDictio, IvMulti, IvEMulti,
  MAHlpBtn, StdCtrls, Buttons, TB97Tlbr, TB97, ExtCtrls, Mask,
  wwdbedit, Wwdbspin, fcCombo, fcColorCombo, Db, DBClient,
  uCMClientDataSet, wwdblook, uCtrlMarcas;

type
  TcfgRelVendaFranquiaShop = class(TfrmParamReports_Padrao)
    GroupBox1: TGroupBox;
    Label1: TLabel;
    Label2: TLabel;
    cboMes: TComboBox;
    spnAno: TwwDBSpinEdit;
    chkLinhas: TCheckBox;
    chkCorLinha: TCheckBox;
    cboCorLinha: TfcColorCombo;
    Label7: TLabel;
    DBcboMarca: TwwDBLookupCombo;
    cdsMarca: TCMClientDataSet;
    cdsMarcaIDMARCA: TFloatField;
    cdsMarcaMRCNOME: TStringField;
    procedure FormCreate(Sender: TObject);
    procedure bbtnConfirmarClick(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
  private
    { Private declarations }
    CtrlMarcas : TCtrlMarcas;

    function VerificaPreenchimento : Boolean;
  public
    { Public declarations }
  end;

var
  cfgRelVendaFranquiaShop: TcfgRelVendaFranquiaShop;

implementation

uses dBaseDados, usistema, uDiasUteis, uComunsImobiliario, uVerificaPreenchimento, uMensErro, uModuloIndicadores;

{$R *.DFM}

procedure TcfgRelVendaFranquiaShop.FormCreate(Sender: TObject);
begin
  inherited;
  // Cria e inicializa o CtrlObject de Marcas
  CtrlMarcas := TCtrlMarcas.Create;
  CtrlMarcas.Initialize(DtmBaseDados.DbBaseDados, True, Sistema.ConnectionType,
                      Sistema.ConnectionSide, Sistema.AppRemoteServer, True,
                      ComunsImobiliario.MensErroMT);

  cdsMarca.Data     := CtrlMarcas.LookupMarcas;
  spnAno.Value      := DiasUteis.ExtraiAno(Date);
  cboMes.ItemIndex  := DiasUteis.ExtraiMes(Date) -1;
end;

function TcfgRelVendaFranquiaShop.VerificaPreenchimento: Boolean;
begin
  Result := False;
  try
    if ModuloIndicadores.iIdIndVenda = -1 then
        raise EValidacao.CreateVal('Parâmetro de Vendas não foi definido',DBcboMarca);
    if ModuloIndicadores.iIdIndOverage = -1 then
        raise EValidacao.CreateVal('Parâmetro de Overage não foi definido',DBcboMarca);
    if ModuloIndicadores.iIdIndAluguel = -1 then
        raise EValidacao.CreateVal('Parâmetro de Aluguel Mínimo não foi definido',DBcboMarca);
    if ModuloIndicadores.iIdIndABL = -1 then
        raise EValidacao.CreateVal('Parâmetro de ABL não foi definido',DBcboMarca);
    if ModuloIndicadores.iMoeCodigoUPV = -1 then
        raise EValidacao.CreateVal('Parâmetro de UPV não foi definido',DBcboMarca);
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

procedure TcfgRelVendaFranquiaShop.bbtnConfirmarClick(Sender: TObject);
var CorLinha : TColor;
    iPosCor  : Integer;
begin
  inherited;
  if VerificaPreenchimento then begin
    if DBcboMarca.Text <> '' then
         cmp_Padrao.ParamByName('idMarca').AsInteger := StrToInt(DBcboMarca.lookupValue)
    else cmp_Padrao.ParamByName('idMarca').AsInteger := -1;
    cmp_Padrao.ParamByName('iMes').AsInteger         := cboMes.ItemIndex + 1;
    cmp_Padrao.ParamByName('iAno').AsFloat           := spnAno.Value;

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

procedure TcfgRelVendaFranquiaShop.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  inherited;
  FreeAndNil( CtrlMarcas );
end;

end.
