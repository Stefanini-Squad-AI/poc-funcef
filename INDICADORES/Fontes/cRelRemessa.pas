unit cRelRemessa;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  fParamReports_Padrao, CmParamReport, IvDictio, IvMulti, IvEMulti,
  MAHlpBtn, StdCtrls, Buttons, TB97Tlbr, TB97, ExtCtrls, Mask, wwdbedit,
  Wwdbspin, mImovel, fcCombo, fcColorCombo;

type
  TcfgRelRemessa = class(TfrmParamReports_Padrao)
    molImovel1: TmolImovel;
    GroupBox1: TGroupBox;
    Label1: TLabel;
    Label2: TLabel;
    cboMes: TComboBox;
    spnAno: TwwDBSpinEdit;
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
  cfgRelRemessa: TcfgRelRemessa;

implementation

uses uSistema, uComunsImobiliario, uVerificaPreenchimento, uMensErro;

{$R *.DFM}

procedure TcfgRelRemessa.FormCreate(Sender: TObject);
begin
  inherited;
  molImovel1.iImovel := -1;
  spnAno.Value       := DiasUteis.ExtraiAno(Date);
  cboMes.ItemIndex   := DiasUteis.ExtraiMes(Date) -1;
end;

function TcfgRelRemessa.VerificaPreenchimento: Boolean;
begin
  Result := False;
  try
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

procedure TcfgRelRemessa.bbtnConfirmarClick(Sender: TObject);
var CorLinha : TColor;
    iPosCor  : Integer;
begin
  inherited;
  if VerificaPreenchimento then begin
    cmp_Padrao.ParamByName('idImovel').AsInteger := molImovel1.iImovel;
    cmp_Padrao.ParamByName('iMes').AsInteger     := cboMes.ItemIndex + 1;
    cmp_Padrao.ParamByName('iAno').AsFloat       := spnAno.Value;

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
