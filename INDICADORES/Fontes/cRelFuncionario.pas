unit cRelFuncionario;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  fParamReports_Padrao, CmParamReport, IvDictio, IvMulti, IvEMulti,
  MAHlpBtn, StdCtrls, Buttons, TB97Tlbr, TB97, ExtCtrls, mImovel, Mask,
  wwdbedit, Wwdbspin, mIndicador, DBTables, Provider, Db, DBClient,
  uCMClientDataSet, wwdblook, uCtrlIndicador, fcCombo, fcColorCombo;

type
  TcfgRelFuncionario = class(TfrmParamReports_Padrao)
    molImovel1: TmolImovel;
    GroupBox1: TGroupBox;
    spnAno: TwwDBSpinEdit;
    Label1: TLabel;
    cdsIndicador: TCMClientDataSet;
    cdsIndicadorIDINDICADOR: TFloatField;
    cdsIndicadorDESCRICAO: TStringField;
    dblcIndicador: TwwDBLookupCombo;
    chkLinhas: TCheckBox;
    chkCorLinha: TCheckBox;
    cboCorLinha: TfcColorCombo;
    procedure FormCreate(Sender: TObject);
    procedure bbtnConfirmarClick(Sender: TObject);
  private
    { Private declarations }
    CtrlIndicador : TCtrlIndicador;
    function VerificaPreenchimento : Boolean;
  public
    { Public declarations }
  end;

var
  cfgRelFuncionario: TcfgRelFuncionario;

implementation

uses uComunsImobiliario, uVerificaPreenchimento, uMensErro, uSistema, dBaseDados, uDiasUteis;

{$R *.DFM}

procedure TcfgRelFuncionario.FormCreate(Sender: TObject);
begin
  inherited;
  CtrlIndicador := TCtrlIndicador.Create;
  CtrlIndicador.Initialize (dtmBaseDados.dbBaseDados, true, Sistema.ConnectionType,
                            Sistema.ConnectionSide, Sistema.AppRemoteServer, true,
                            ComunsImobiliario.MensErroMT);

  cdsIndicador.Data  := CtrlIndicador.LookupIndicador(-1,'',3441);
  molImovel1.iImovel := -1;
  spnAno.Value := DiasUteis.ExtraiAno(Date);
end;

procedure TcfgRelFuncionario.bbtnConfirmarClick(Sender: TObject);
var CorLinha : TColor;
    iPosCor  : Integer;
begin
  inherited;
  if VerificaPreenchimento then begin
    cmp_Padrao.ParamByName('idImovel').AsInteger := molImovel1.iImovel;
    cmp_Padrao.ParamByName('iAno').AsFloat       := spnAno.Value;
    if dblcIndicador.LookupValue <> '' then
         cmp_Padrao.ParamByName('idIndicador').AsInteger := cdsIndicadorIDINDICADOR.AsInteger
    else cmp_Padrao.ParamByName('idIndicador').AsInteger := -1;

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

function TcfgRelFuncionario.VerificaPreenchimento: Boolean;
begin
  Result := False;
  try
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

end.
