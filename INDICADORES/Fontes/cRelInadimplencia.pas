unit cRelInadimplencia;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  fParamReports_Padrao, CmParamReport, IvDictio, IvMulti, IvEMulti,
  MAHlpBtn, StdCtrls, Buttons, TB97Tlbr, TB97, ExtCtrls, mImovel, Mask,
  wwdbedit, Wwdbspin, Db, DBClient, uCMClientDataSet, wwdblook,
  uCtrlGrpApuracao, fcCombo, fcColorCombo;

type
  TcfgRelInadimplencia = class(TfrmParamReports_Padrao)
    molImovel1: TmolImovel;
    GroupBox1: TGroupBox;
    Label1: TLabel;
    Label2: TLabel;
    cboMes: TComboBox;
    spnAno: TwwDBSpinEdit;
    Label3: TLabel;
    dblcGrpApuracao: TwwDBLookupCombo;
    cdsGrpApuracao: TCMClientDataSet;
    cdsGrpApuracaoIDGRPAPURACAO: TFloatField;
    cdsGrpApuracaoDESCRICAO: TStringField;
    chkLinhas: TCheckBox;
    chkCorLinha: TCheckBox;
    cboCorLinha: TfcColorCombo;
    procedure FormCreate(Sender: TObject);
    procedure bbtnConfirmarClick(Sender: TObject);
    procedure FormDestroy(Sender: TObject);
  private
    { Private declarations }
    CtrlGrpApuracao : TCtrlGrpApuracao;
    function VerificaPreenchimento : Boolean;
  public
    { Public declarations }
  end;

var
  cfgRelInadimplencia: TcfgRelInadimplencia;

implementation

uses uDiasUteis, uComunsImobiliario, uVerificaPreenchimento, uMensErro, uSistema, dBaseDados, uModuloIndicadores;

{$R *.DFM}

procedure TcfgRelInadimplencia.FormCreate(Sender: TObject);
begin
  inherited;
  CtrlGrpApuracao := TCtrlGrpApuracao.Create;
  CtrlGrpApuracao.Initialize (dtmBaseDados.dbBaseDados, true, Sistema.ConnectionType,
                            Sistema.ConnectionSide, Sistema.AppRemoteServer, true,
                            ComunsImobiliario.MensErroMT);

  cdsGrpApuracao.Data := CtrlGrpApuracao.LookupGrpApuracao(-1,'I');

  molImovel1.iImovel := -1;
  spnAno.Value       := DiasUteis.ExtraiAno(Date);
  cboMes.ItemIndex   := DiasUteis.ExtraiMes(Date) -1;
end;

function TcfgRelInadimplencia.VerificaPreenchimento: Boolean;
begin
  Result := False;
  try
    if ModuloIndicadores.iIdIndNDMeses = -1 then
        raise EValidacao.CreateVal('Parâmetro da Meses de Inadimplência não foi definido',molImovel1.btnBuscaImovel);
    if ModuloIndicadores.iIdIndNDAluguel = -1 then
        raise EValidacao.CreateVal('Parâmetro de Valor de Aluguel de Inadimplência não foi definido',molImovel1.btnBuscaImovel);
    if ModuloIndicadores.iIdIndNDEncargos = -1 then
        raise EValidacao.CreateVal('Parâmetro de Valor de Encargos de Inadimplência não foi definido',molImovel1.btnBuscaImovel);
    if ModuloIndicadores.iIdIndNDFundo = -1 then
        raise EValidacao.CreateVal('Parâmetro de Valor de Fundos de Inadimplência não foi definido',molImovel1.btnBuscaImovel);
    if ModuloIndicadores.iIdIndNDLuva = -1 then
        raise EValidacao.CreateVal('Parâmetro de Valor de Luvas de Inadimplência não foi definido',molImovel1.btnBuscaImovel);
    if ModuloIndicadores.iIdIndNDTpProvidencia = -1 then
        raise EValidacao.CreateVal('Parâmetro de Tipo de Providência de Inadimplência não foi definido',molImovel1.btnBuscaImovel);
    if ModuloIndicadores.iIdIndNDDtProvidencia = -1 then
        raise EValidacao.CreateVal('Parâmetro de Data da Providência de Inadimplência não foi definido',molImovel1.btnBuscaImovel);
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

procedure TcfgRelInadimplencia.bbtnConfirmarClick(Sender: TObject);
var CorLinha : TColor;
    iPosCor  : Integer;
begin
  inherited;
  if VerificaPreenchimento then begin
    cmp_Padrao.ParamByName('idImovel').AsInteger := molImovel1.iImovel;
    cmp_Padrao.ParamByName('iMes').AsInteger     := cboMes.ItemIndex + 1;
    cmp_Padrao.ParamByName('iAno').AsFloat       := spnAno.Value;
    if dblcGrpApuracao.LookupValue <> '' then
      cmp_Padrao.ParamByName('idGrpApuracao').AsInteger := StrToInt(dblcGrpApuracao.LookupValue);

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

procedure TcfgRelInadimplencia.FormDestroy(Sender: TObject);
begin
  inherited;
  FreeAndNil(CtrlGrpApuracao);
end;

end.

