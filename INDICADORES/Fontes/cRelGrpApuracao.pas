unit cRelGrpApuracao;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  fParamReports_Padrao, CmParamReport, IvDictio, IvMulti, IvEMulti,
  MAHlpBtn, StdCtrls, Buttons, TB97Tlbr, TB97, ExtCtrls, fcCombo,
  fcColorCombo, Mask, wwdbedit, Wwdotdot, Wwdbcomb;

type
  TcfgRelGrpApuracao = class(TfrmParamReports_Padrao)
    Label1: TLabel;
    cboGrupo: TwwDBComboBox;
    chkLinhas: TCheckBox;
    chkCorLinha: TCheckBox;
    cboCorLinha: TfcColorCombo;
    procedure bbtnConfirmarClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  cfgRelGrpApuracao: TcfgRelGrpApuracao;

implementation

uses uComunsImobiliario, uVerificaPreenchimento;

{$R *.DFM}

procedure TcfgRelGrpApuracao.bbtnConfirmarClick(Sender: TObject);
var CorLinha : TColor;
    iPosCor  : Integer;
begin
  inherited;
  cmp_Padrao.ParamByName('sGrupo').AsString := cboGrupo.Value;

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

end.
