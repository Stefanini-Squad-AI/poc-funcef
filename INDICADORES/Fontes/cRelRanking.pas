unit cRelRanking;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  fParamReports_Padrao, CmParamReport, IvDictio, IvMulti, IvEMulti,
  MAHlpBtn, StdCtrls, Buttons, TB97Tlbr, TB97, ExtCtrls, Mask, wwdbedit,
  Wwdbspin, mImovel, fcCombo, fcColorCombo;

type
  TcfgRelRanking = class(TfrmParamReports_Padrao)
    molImovel1: TmolImovel;
    GroupBox1: TGroupBox;
    Label1: TLabel;
    Label2: TLabel;
    cboMes: TComboBox;
    spnAno: TwwDBSpinEdit;
    rgOrdem: TRadioGroup;
    chkLinhas: TCheckBox;
    chkCorLinha: TCheckBox;
    cboCorLinha: TfcColorCombo;
    procedure FormCreate(Sender: TObject);
    procedure bbtnConfirmarClick(Sender: TObject);
  private
    { Private declarations }
    function VerificaPreenchimento : Boolean;    
  public
    { Public declarations }
  end;

var
  cfgRelRanking: TcfgRelRanking;

implementation

uses uSistema, uComunsImobiliario, uVerificaPreenchimento, uMensErro, uModuloIndicadores;

{$R *.DFM}

procedure TcfgRelRanking.FormCreate(Sender: TObject);
begin
  inherited;
  molImovel1.iImovel := -1;
  spnAno.Value       := DiasUteis.ExtraiAno(Date);
  cboMes.ItemIndex   := DiasUteis.ExtraiMes(Date) -1;
end;

function TcfgRelRanking.VerificaPreenchimento: Boolean;
begin
  Result := False;
  try
    if ModuloIndicadores.iIdIndVenda = -1 then
        raise EValidacao.CreateVal('Parâmetro de Vendas não foi definido',molImovel1.btnBuscaImovel);
    if ModuloIndicadores.iIdIndAluguel = -1 then
        raise EValidacao.CreateVal('Parâmetro de Aluguel Mínimo não foi definido',molImovel1.btnBuscaImovel);
    if ModuloIndicadores.iIdIndABL = -1 then
        raise EValidacao.CreateVal('Parâmetro de ABL não foi definido',molImovel1.btnBuscaImovel);
    if ModuloIndicadores.iMoeCodigoUPV = -1 then
        raise EValidacao.CreateVal('Parâmetro de UPV não foi definido',molImovel1.btnBuscaImovel);
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

procedure TcfgRelRanking.bbtnConfirmarClick(Sender: TObject);
var CorLinha : TColor;
    iPosCor  : Integer;
begin
  inherited;
  if VerificaPreenchimento then begin
    cmp_Padrao.ParamByName('idImovel').AsInteger := molImovel1.iImovel;
    cmp_Padrao.ParamByName('iMes').AsInteger     := cboMes.ItemIndex + 1;
    cmp_Padrao.ParamByName('iAno').AsFloat       := spnAno.Value;
    cmp_Padrao.ParamByName('iOrdem').AsInteger   := rgOrdem.ItemIndex + 1;

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
