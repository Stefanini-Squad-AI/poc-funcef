unit cRelRdsHotel;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  fParamReports_Padrao, CmParamReport, IvDictio, IvMulti, IvEMulti,
  MAHlpBtn, StdCtrls, Buttons, TB97Tlbr, TB97, ExtCtrls, Db, DBClient,
  uCMClientDataSet, fcCombo, fcColorCombo, wwdbdatetimepicker,
  CMDateTimePicker, wwdblook, mImovel, uCtrlGrpApuracao, mImovelouMestre;

type
  TcfgRelRdsHotel = class(TfrmParamReports_Padrao)
    Label3: TLabel;
    dblcGrpApuracao: TwwDBLookupCombo;
    GroupBox1: TGroupBox;
    cmdtIni: TCMDateTimePicker;
    chkLinhas: TCheckBox;
    chkCorLinha: TCheckBox;
    cboCorLinha: TfcColorCombo;
    cdsGrpApuracao: TCMClientDataSet;
    cdsGrpApuracaoDESCRICAO: TStringField;
    cdsGrpApuracaoIDGRPAPURACAO: TFloatField;
    molImovelouMestre1: TmolImovelouMestre;
    procedure FormCreate(Sender: TObject);
    procedure FormDestroy(Sender: TObject);
    procedure bbtnConfirmarClick(Sender: TObject);
  private
    { Private declarations }
    CtrlGrpApuracao : TCtrlGrpApuracao;
    function VerificaPreenchimento : Boolean;
  public
    { Public declarations }
  end;

var
  cfgRelRdsHotel: TcfgRelRdsHotel;

implementation

uses uDiasUteis, uComunsImobiliario, uVerificaPreenchimento, uMensErro, uSistema, dBaseDados, uModuloIndicadores;

{$R *.DFM}

procedure TcfgRelRdsHotel.FormCreate(Sender: TObject);
begin
  inherited;
  CtrlGrpApuracao := TCtrlGrpApuracao.Create;
  CtrlGrpApuracao.Initialize (dtmBaseDados.dbBaseDados, true, Sistema.ConnectionType,
                              Sistema.ConnectionSide, Sistema.AppRemoteServer, true,
                              ComunsImobiliario.MensErroMT);

  cdsGrpApuracao.Data := CtrlGrpApuracao.LookupGrpApuracao(-1,'H');
  molImovelouMestre1.iImovel  := -1;
end;

procedure TcfgRelRdsHotel.FormDestroy(Sender: TObject);
begin
  inherited;
  FreeAndNil( CtrlGrpApuracao );
end;

function TcfgRelRdsHotel.VerificaPreenchimento: Boolean;
begin
  Result := False;
  try
    if ModuloIndicadores.iIdIndUHHotel = -1 then
        raise EValidacao.CreateVal('Parâmetro de UH´s do Hotel não foi definido',molImovelouMestre1.btnBuscaImovel);
     if cmDtIni.Text = '' then
        raise EValidacao.CreateVal('Informe a data inicial',cmDtIni);
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

procedure TcfgRelRdsHotel.bbtnConfirmarClick(Sender: TObject);
var CorLinha : TColor;
    iPosCor  : Integer;
begin
  inherited;
  if VerificaPreenchimento then begin
    cmp_Padrao.ParamByName('idImovel').AsInteger := molImovelouMestre1.iImovel;
    cmp_Padrao.ParamByName('dtIni').AsDateTime   := cmdtIni.Date;
    if dblcGrpApuracao.LookupValue <> '' then
         cmp_Padrao.ParamByName('idGrpApuracao').AsInteger := StrToInt(dblcGrpApuracao.LookupValue)
    else cmp_Padrao.ParamByName('idGrpApuracao').AsInteger := -1;

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
