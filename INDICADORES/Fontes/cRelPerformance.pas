unit cRelPerformance;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  fParamReports_Padrao, CmParamReport, IvDictio, IvMulti, IvEMulti,
  MAHlpBtn, StdCtrls, Buttons, TB97Tlbr, TB97, ExtCtrls, mImovel, Mask,
  wwdbedit, Wwdbspin, fcCombo, fcColorCombo;

type
  TcfgRelPerformance = class(TfrmParamReports_Padrao)
    GroupBox1: TGroupBox;
    Label1: TLabel;
    Label2: TLabel;
    cboMesIni: TComboBox;
    spnAnoIni: TwwDBSpinEdit;
    molImovel1: TmolImovel;
    GroupBox2: TGroupBox;
    Label3: TLabel;
    Label4: TLabel;
    cboMesFim: TComboBox;
    spnAnoFim: TwwDBSpinEdit;
    chkLinhas: TCheckBox;
    chkCorLinha: TCheckBox;
    cboCorLinha: TfcColorCombo;
    procedure FormCreate(Sender: TObject);
    procedure bbtnConfirmarClick(Sender: TObject);
  private
    { Private declarations }
    function VerificaPreenchimento: Boolean;
  public
    { Public declarations }
  end;

var
  cfgRelPerformance: TcfgRelPerformance;

implementation

uses uSistema, uComunsImobiliario, uVerificaPreenchimento, uMensErro, uModuloIndicadores;

{$R *.DFM}

procedure TcfgRelPerformance.FormCreate(Sender: TObject);
begin
  inherited;
  molImovel1.iImovel  := -1;
  spnAnoIni.Value     := DiasUteis.ExtraiAno(Date);
  cboMesIni.ItemIndex := DiasUteis.ExtraiMes(Date) -1;
  spnAnoFim.Value     := DiasUteis.ExtraiAno(Date);
  cboMesFim.ItemIndex := DiasUteis.ExtraiMes(Date) -1;
end;

function TcfgRelPerformance.VerificaPreenchimento: Boolean;
begin
  Result := False;
  try
    if ModuloIndicadores.iIdIndVenda = -1 then
        raise EValidacao.CreateVal('Parâmetro de Vendas não foi definido',molImovel1.btnBuscaImovel);
    if ModuloIndicadores.iIdIndAluguel = -1 then
        raise EValidacao.CreateVal('Parâmetro de Aluguel Mínimo não foi definido',molImovel1.btnBuscaImovel);
    if ModuloIndicadores.iIdIndOverage = -1 then
        raise EValidacao.CreateVal('Parâmetro de Overage não foi definido',molImovel1.btnBuscaImovel);
    if ModuloIndicadores.iIdIndABL = -1 then
        raise EValidacao.CreateVal('Parâmetro de ABL não foi definido',molImovel1.btnBuscaImovel);
    if cboMesIni.ItemIndex = -1 then
        raise EValidacao.CreateVal('Informe o Mês Inicial de Referência',cboMesIni);
    if spnAnoIni.Value <= 0 then
        raise EValidacao.CreateVal('Informe o Ano Inicial de Referência',spnAnoIni);
    if cboMesFim.ItemIndex = -1 then
        raise EValidacao.CreateVal('Informe o Mês Final de Referência',cboMesFim);
    if spnAnoFim.Value <= 0 then
        raise EValidacao.CreateVal('Informe o Ano Final de Referência',spnAnoFim);
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

procedure TcfgRelPerformance.bbtnConfirmarClick(Sender: TObject);
var CorLinha : TColor;
    iPosCor  : Integer;
begin
  inherited;
  if VerificaPreenchimento then begin
    cmp_Padrao.ParamByName('idImovel').AsInteger := molImovel1.iImovel;
    cmp_Padrao.ParamByName('iMesIni').AsInteger  := cboMesIni.ItemIndex + 1;
    cmp_Padrao.ParamByName('iAnoIni').AsFloat    := spnAnoIni.Value;
    cmp_Padrao.ParamByName('iMesFim').AsInteger  := cboMesFim.ItemIndex + 1;
    cmp_Padrao.ParamByName('iAnoFim').AsFloat    := spnAnoFim.Value;

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

end.
