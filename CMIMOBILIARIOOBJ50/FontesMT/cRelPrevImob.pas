unit cRelPrevImob;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  fParamReports_Padrao, CmParamReport, IvDictio, IvMulti, IvEMulti,
  MAHlpBtn, StdCtrls, Buttons, TB97Tlbr, TB97, ExtCtrls, fcCombo,
  fcColorCombo, Wwdbspin, Mask, wwdbedit, Wwdotdot, Wwdbcomb, Db, DBClient,
  uCMClientDataSet, wwdblook, uCtrlTipoCustoRecImov, uCtrlTipoImovel;

type
  TcfgRelPrevImob = class(TfrmParamReports_Padrao)
    Label1: TLabel;
    dbCboTipoCustoRecImov: TwwDBLookupCombo;
    CdsTipoCustoRecImov: TCMClientDataSet;
    CdsTipoCustoRecImovDESCCUSTORECIMO: TStringField;
    CdsTipoCustoRecImovFLGDIARIO: TStringField;
    CdsTipoCustoRecImovIDTIPOCUSTORECIMO: TFloatField;
    CdsTipoCustoRecImovRECCUSTO: TStringField;
    GroupBox1: TGroupBox;
    Label5: TLabel;
    cboMes: TwwDBComboBox;
    spnAno: TwwDBSpinEdit;
    Label2: TLabel;
    Label3: TLabel;
    rgOrdem: TRadioGroup;
    GroupBox2: TGroupBox;
    chkMestre: TCheckBox;
    chkImovel: TCheckBox;
    chkLinhas: TCheckBox;
    chkCorLinha: TCheckBox;
    cboCorLinha: TfcColorCombo;
    CdsTipoImovel: TCMClientDataSet;
    CdsTipoImovelCODTIPIMOVEL: TStringField;
    CdsTipoImovelDESCTIPOIMOVEL: TStringField;
    DBcboTipoImovel: TwwDBLookupCombo;
    procedure FormCreate(Sender: TObject);
    procedure FormDestroy(Sender: TObject);
    procedure bbtnConfirmarClick(Sender: TObject);
  private
    { Private declarations }
    CtrlTipoImovel       : TCtrlTipoImovel;
    CtrlTipoCustoRecImov : TCtrlTipoCustoRecImov;

    function VerificaPreenchimento : Boolean;
  public
    { Public declarations }
  end;

var
  cfgRelPrevImob: TcfgRelPrevImob;

implementation

uses uDiasUteis, uComunsImobiliario, uMensErro, uSistema, dBaseDados,
     uModuloImobiliario, uVerificaPreenchimento;

{$R *.DFM}

procedure TcfgRelPrevImob.FormCreate(Sender: TObject);
var iMes,iAno : Integer;
begin
  inherited;
  // Inicializa os CtrlObjects
  CtrlTipoImovel := TCtrlTipoImovel.Create;
  CtrlTipoCustoRecImov := TCtrlTipoCustoRecImov.Create;
  CtrlTipoImovel.Initialize( dtmBaseDados.dbBaseDados, true, Sistema.ConnectionType,
                             Sistema.ConnectionSide, Sistema.AppRemoteServer, true,
                             ComunsImobiliario.MensErroMT );
  CtrlTipoCustoRecImov.InitializeAs( CtrlTipoImovel );

  // Carrega Tabelas de Lookup
  cdsTipoImovel.Data       := CtrlTipoImovel.LookupTipoImovel;
  CdsTipoCustoRecImov.Data := CtrlTipoCustoRecImov.LookupTipoCustoRecImov(Sistema.IdModulo,'',-1,'S');

  if Sistema.IdModulo = 64 then begin
    iMes := ModuloImobiliario.AdminImob.iMesCompetencia + 1;
    iAno := ModuloImobiliario.AdminImob.iAnoCompetencia;
  end else begin
    iMes := ModuloImobiliario.Alienacao.iMesCompetencia + 1;
    iAno := ModuloImobiliario.Alienacao.iAnoCompetencia;
  end;
  if iMes > 12 then begin
    iMes := 1;
    iAno := iAno + 1;
  end;

  spnAno.Value     := iAno;
  cboMes.ItemIndex := iMes -1;
end;

procedure TcfgRelPrevImob.FormDestroy(Sender: TObject);
begin
  FreeAndNil( CtrlTipoImovel );
  FreeAndNil( CtrlTipoCustoRecImov );
  inherited;
end;

procedure TcfgRelPrevImob.bbtnConfirmarClick(Sender: TObject);
var CorLinha : TColor;
    iPosCor  : Integer;
begin
  inherited;
  if VerificaPreenchimento then begin
    if dbCboTipoCustoRecImov.Text = '' then
         cmp_Padrao.ParamByName('iTipoCusto').AsInteger := -1
    else cmp_Padrao.ParamByName('iTipoCusto').AsInteger := StrToInt(dbCboTipoCustoRecImov.lookupValue);
    if DBcboTipoImovel.Text = '' then
         cmp_Padrao.ParamByName('sTipoImovel').AsString := ''
    else cmp_Padrao.ParamByName('sTipoImovel').AsString := DBcboTipoImovel.lookupValue;

    cmp_Padrao.ParamByName('iMes').AsInteger    := cboMes.ItemIndex + 1;
    cmp_Padrao.ParamByName('iAno').AsFloat      := spnAno.Value;
    cmp_Padrao.ParamByName('iOrdem').AsInteger  := rgOrdem.ItemIndex + 1;
    cmp_Padrao.ParamByName('bMestre').AsBoolean := chkMestre.Checked;
    cmp_Padrao.ParamByName('bImovel').AsBoolean := chkImovel.Checked;

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

function TcfgRelPrevImob.VerificaPreenchimento: Boolean;
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

end.
