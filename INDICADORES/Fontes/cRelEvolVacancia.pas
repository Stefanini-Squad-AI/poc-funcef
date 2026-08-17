unit cRelEvolVacancia;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  fParamReports_Padrao, CmParamReport, IvDictio, IvMulti, IvEMulti,
  MAHlpBtn, StdCtrls, Buttons, TB97Tlbr, TB97, ExtCtrls, Mask, wwdbedit,
  Wwdbspin, fcCombo, fcColorCombo;

type
  TcfgRelEvolVacancia = class(TfrmParamReports_Padrao)
    chkLinhas: TCheckBox;
    chkCorLinha: TCheckBox;
    cboCorLinha: TfcColorCombo;
    gbMesIni: TGroupBox;
    cboMes: TComboBox;
    spnAno: TwwDBSpinEdit;
    procedure FormCreate(Sender: TObject);
    procedure bbtnConfirmarClick(Sender: TObject);
  private
    { Private declarations }
    function VerificaPreenchimento : Boolean;
  public
    { Public declarations }
  end;

var
  cfgRelEvolVacancia: TcfgRelEvolVacancia;

implementation

uses uComunsImobiliario, uVerificaPreenchimento, uMensErro, uSistema;

{$R *.DFM}

procedure TcfgRelEvolVacancia.FormCreate(Sender: TObject);
begin
  inherited;
  cboMes.ItemIndex := 0;
  spnAno.Value     := DiasUteis.ExtraiAno(Date);
end;

function TcfgRelEvolVacancia.VerificaPreenchimento: Boolean;
begin
  Result := False;
  try
     if cboMes.ItemIndex = -1 then
        raise EValidacao.CreateVal('Informe o Mês de Competência',cboMes);
     if spnAno.Value <= 0 then
        raise EValidacao.CreateVal('Informe o Ano de Competência',spnAno);
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

procedure TcfgRelEvolVacancia.bbtnConfirmarClick(Sender: TObject);
var CorLinha : TColor;
    iPosCor  : Integer;
begin
  inherited;
  if VerificaPreenchimento then begin
    cmp_Padrao.ParamByName('iMes').AsInteger := cboMes.ItemIndex + 1;
    cmp_Padrao.ParamByName('iAno').AsFloat   := spnAno.Value;

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
