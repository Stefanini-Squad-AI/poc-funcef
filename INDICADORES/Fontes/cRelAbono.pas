unit cRelAbono;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  fParamReports_Padrao, CmParamReport, IvDictio, IvMulti, IvEMulti,
  MAHlpBtn, StdCtrls, Buttons, TB97Tlbr, TB97, ExtCtrls, mImovel, uCtrlGrpApuracao,
  Db, DBClient, uCMClientDataSet, wwdblook, wwdbdatetimepicker,
  CMDateTimePicker, fcCombo, fcColorCombo;

type
  TcfgRelAbono = class(TfrmParamReports_Padrao)
    molImovel1: TmolImovel;
    Label3: TLabel;
    dblcGrpApuracao: TwwDBLookupCombo;
    cdsGrpApuracao: TCMClientDataSet;
    cdsGrpApuracaoDESCRICAO: TStringField;
    cdsGrpApuracaoIDGRPAPURACAO: TFloatField;
    GroupBox1: TGroupBox;
    Label1: TLabel;
    Label2: TLabel;
    cmdtIni: TCMDateTimePicker;
    cmdtFim: TCMDateTimePicker;
    chkLinhas: TCheckBox;
    chkCorLinha: TCheckBox;
    cboCorLinha: TfcColorCombo;
    procedure FormCreate(Sender: TObject);
    procedure bbtnConfirmarClick(Sender: TObject);
  private
    { Private declarations }
    CtrlGrpApuracao : TCtrlGrpApuracao;
    function VerificaPreenchimento : Boolean;    
  public
    { Public declarations }
  end;

var
  cfgRelAbono: TcfgRelAbono;

implementation

uses uDiasUteis, uComunsImobiliario, uVerificaPreenchimento, uMensErro, uSistema, dBaseDados, uModuloIndicadores;

{$R *.DFM}

procedure TcfgRelAbono.FormCreate(Sender: TObject);
begin
  inherited;
  CtrlGrpApuracao := TCtrlGrpApuracao.Create;
  CtrlGrpApuracao.Initialize (dtmBaseDados.dbBaseDados, true, Sistema.ConnectionType,
                            Sistema.ConnectionSide, Sistema.AppRemoteServer, true,
                            ComunsImobiliario.MensErroMT);

  cdsGrpApuracao.Data := CtrlGrpApuracao.LookupGrpApuracao(-1,'A');

  molImovel1.iImovel := -1;
end;

function TcfgRelAbono.VerificaPreenchimento: Boolean;
begin
  Result := False;
  try
    if ModuloIndicadores.iIdIndAbDtVencto = -1 then
        raise EValidacao.CreateVal('Parâmetro da Data de Vencimento do Abono não foi definido',molImovel1.btnBuscaImovel);
    if ModuloIndicadores.iIdIndAbDtPagto = -1 then
        raise EValidacao.CreateVal('Parâmetro da Data de Pagamento do Abono não foi definido',molImovel1.btnBuscaImovel);
    if ModuloIndicadores.iIdIndAbVlrFaturado = -1 then
        raise EValidacao.CreateVal('Parâmetro de Valor Faturado do Abono não foi definido',molImovel1.btnBuscaImovel);
    if ModuloIndicadores.iIdIndAbVlrCM = -1 then
        raise EValidacao.CreateVal('Parâmetro de Correção Monetária do Abono não foi definido',molImovel1.btnBuscaImovel);
    if ModuloIndicadores.iIdIndAbVlrJuros = -1 then
        raise EValidacao.CreateVal('Parâmetro de Juros do Abono não foi definido',molImovel1.btnBuscaImovel);
    if ModuloIndicadores.iIdIndAbVlrPagto = -1 then
        raise EValidacao.CreateVal('Parâmetro de Valor Pago do Abono não foi definido',molImovel1.btnBuscaImovel);
     if cmDtIni.Text = '' then
        raise EValidacao.CreateVal('Informe a data inicial',cmDtIni);
     if cmDtFim.Text = '' then
        raise EValidacao.CreateVal('Informe o data final',cmDtFim);
     if cmDtFim.Date < cmDtIni.Date then
        raise EValidacao.CreateVal('Data final deve ser superior a inicial',cmDtFim);
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

procedure TcfgRelAbono.bbtnConfirmarClick(Sender: TObject);
var CorLinha : TColor;
    iPosCor  : Integer;
begin
  inherited;
  if VerificaPreenchimento then begin
    cmp_Padrao.ParamByName('idImovel').AsInteger := molImovel1.iImovel;
    cmp_Padrao.ParamByName('dtIni').AsDateTime   := cmdtIni.Date;
    cmp_Padrao.ParamByName('dtFim').AsDateTime   := cmdtFim.Date;
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

end.
