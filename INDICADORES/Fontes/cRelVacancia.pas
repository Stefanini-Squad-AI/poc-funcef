unit cRelVacancia;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  fParamReports_Padrao, CmParamReport, IvDictio, IvMulti, IvEMulti,
  MAHlpBtn, StdCtrls, Buttons, TB97Tlbr, TB97, ExtCtrls, Mask, wwdbedit,
  Wwdbspin, fcCombo, fcColorCombo, uCtrlTipoImovel, wwdblook, Db, DBClient,
  uCMClientDataSet;

type
  TcfgRelVacancia = class(TfrmParamReports_Padrao)
    chkLinhas: TCheckBox;
    chkCorLinha: TCheckBox;
    cboCorLinha: TfcColorCombo;
    gbMesIni: TGroupBox;
    cboMes: TComboBox;
    spnAno: TwwDBSpinEdit;
    GroupBox1: TGroupBox;
    DBcboTipoImovel: TwwDBLookupCombo;
    cdsTipoImovel: TCMClientDataSet;
    procedure FormCreate(Sender: TObject);
    procedure bbtnConfirmarClick(Sender: TObject);
    procedure FormDestroy(Sender: TObject);
  private
    { Private declarations }
    CtrlTipoImovel : TctrlTipoImovel;

    function VerificaPreenchimento : Boolean;
  public
    { Public declarations }
  end;

var
  cfgRelVacancia: TcfgRelVacancia;

implementation

uses uComunsImobiliario, uVerificaPreenchimento, dBaseDados, uMensErro, uSistema;

{$R *.DFM}

procedure TcfgRelVacancia.FormCreate(Sender: TObject);
begin
  inherited;
  cboMes.ItemIndex := DiasUteis.ExtraiMes(Date) - 1;
  spnAno.Value     := DiasUteis.ExtraiAno(Date);

  CtrlTipoImovel := tCtrlTipoImovel.Create;
  CtrlTipoImovel.Initialize (dtmBaseDados.dbBaseDados, true, Sistema.ConnectionType,
                            Sistema.ConnectionSide, Sistema.AppRemoteServer, true,
                            ComunsImobiliario.MensErroMT);
  cdsTipoImovel.Data := CtrlTipoImovel.LookupTipoImovel;
end;

function TcfgRelVacancia.VerificaPreenchimento: Boolean;
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

procedure TcfgRelVacancia.bbtnConfirmarClick(Sender: TObject);
var CorLinha : TColor;
    iPosCor  : Integer;
begin
  inherited;
  if VerificaPreenchimento then begin
    cmp_Padrao.ParamByName('iMes').AsInteger := cboMes.ItemIndex + 1;
    cmp_Padrao.ParamByName('iAno').AsFloat   := spnAno.Value;
    if DBcboTipoImovel.LookupValue <> '' then
       cmp_Padrao.ParamByName('CodTipImovel').AsString := DBcboTipoImovel.LookupValue;

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

procedure TcfgRelVacancia.FormDestroy(Sender: TObject);
begin
  FreeAndNil( CtrlTipoImovel );
  inherited;
end;

end.
