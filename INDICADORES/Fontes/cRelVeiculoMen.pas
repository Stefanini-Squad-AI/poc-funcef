unit cRelVeiculoMen;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  fParamReports_Padrao, CmParamReport, IvDictio, IvMulti, IvEMulti,
  MAHlpBtn, StdCtrls, Buttons, TB97Tlbr, TB97, ExtCtrls, Mask, wwdbedit,
  Wwdbspin, mImovel;

type
  TcfgRelVeiculoMen = class(TfrmParamReports_Padrao)
    molImovel1: TmolImovel;
    GroupBox1: TGroupBox;
    Label2: TLabel;
    spnAnoIni: TwwDBSpinEdit;
    Label1: TLabel;
    spnAnoFim: TwwDBSpinEdit;
    procedure FormCreate(Sender: TObject);
    procedure bbtnConfirmarClick(Sender: TObject);
  private
    { Private declarations }
    function VerificaPreenchimento : Boolean;
  public
    { Public declarations }
  end;

var
  cfgRelVeiculoMen: TcfgRelVeiculoMen;

implementation

uses uSistema, uComunsImobiliario, uVerificaPreenchimento, uMensErro, uModuloIndicadores;

{$R *.DFM}

{ TcfgRelVeiculoMen }

function TcfgRelVeiculoMen.VerificaPreenchimento: Boolean;
begin
  Result := False;
  try
    if spnAnoIni.Value <= 0 then
        raise EValidacao.CreateVal('Informe o Ano Inicial de Referência',spnAnoIni);
    if spnAnoFim.Value <= 0 then
        raise EValidacao.CreateVal('Informe o Ano Final de Referência',spnAnoFim);
    if spnAnoFim.Value < spnAnoIni.Value then
        raise EValidacao.CreateVal('Período inválido',spnAnoIni);
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

procedure TcfgRelVeiculoMen.FormCreate(Sender: TObject);
begin
  inherited;
  molImovel1.iImovel := -1;
  spnAnoIni.Value    := DiasUteis.ExtraiAno(Date);
  spnAnoFim.Value    := DiasUteis.ExtraiAno(Date);
end;

procedure TcfgRelVeiculoMen.bbtnConfirmarClick(Sender: TObject);
begin
  inherited;
  if VerificaPreenchimento then begin
    cmp_Padrao.ParamByName('idImovel').AsInteger := molImovel1.iImovel;
    cmp_Padrao.ParamByName('iAnoIni').AsFloat    := spnAnoIni.Value;
    cmp_Padrao.ParamByName('iAnoFim').AsFloat    := spnAnoFim.Value;

    if bbtnConfirmar.ModalResult <> mrOk then begin
       bbtnConfirmar.ModalResult := mrOk;
       bbtnConfirmar.Click;
    end;
  end;
end;

end.
