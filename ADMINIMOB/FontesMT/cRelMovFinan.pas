unit cRelMovFinan;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  fParamReports_Padrao, CmParamReport, IvDictio, IvMulti, IvEMulti,
  MAHlpBtn, StdCtrls, Buttons, TB97Tlbr, TB97, ExtCtrls, Wwdbspin, Mask,
  wwdbedit, Wwdotdot, Wwdbcomb, Db, DBClient, uCMClientDataSet, wwdblook,
  fcCombo, fcColorCombo, uCtrlTipoImovel, wwdbdatetimepicker,
  CMDateTimePicker;

type
  TcfgRelMovFinan = class(TfrmParamReports_Padrao)
    chkLinhas: TCheckBox;
    chkCorLinha: TCheckBox;
    cboCorLinha: TfcColorCombo;
    Label3: TLabel;
    DBcboTipoImovel: TwwDBLookupCombo;
    CdsTipoImovel: TCMClientDataSet;
    CdsTipoImovelCODTIPIMOVEL: TStringField;
    CdsTipoImovelDESCTIPOIMOVEL: TStringField;
    GroupBox1: TGroupBox;
    Label5: TLabel;
    Label2: TLabel;
    cboMesIni: TwwDBComboBox;
    spnAnoIni: TwwDBSpinEdit;
    GroupBox2: TGroupBox;
    Label1: TLabel;
    Label4: TLabel;
    cboMesFim: TwwDBComboBox;
    spnAnoFim: TwwDBSpinEdit;
    GroupBox3: TGroupBox;
    edtDataSld: TCMDateTimePicker;
    rgRec: TRadioGroup;
    rgDesp: TRadioGroup;
    procedure FormCreate(Sender: TObject);
    procedure FormDestroy(Sender: TObject);
    procedure bbtnConfirmarClick(Sender: TObject);
  private
    { Private declarations }
    CtrlTipoImovel : TCtrlTipoImovel;

  public
    { Public declarations }
  end;

var
  cfgRelMovFinan: TcfgRelMovFinan;

implementation

uses uDiasUteis, UComunsImobiliario, uVerificaPreenchimento, uMensErro, uSistema, dBaseDados,
     uModuloImobiliario;

{$R *.DFM}

procedure TcfgRelMovFinan.FormCreate(Sender: TObject);
var iDia,iMes,iAno : Word;
begin
  inherited;
  // Inicializa os CtrlObjects
  CtrlTipoImovel := TCtrlTipoImovel.Create;
  CtrlTipoImovel.Initialize( dtmBaseDados.dbBaseDados, true, Sistema.ConnectionType,
                             Sistema.ConnectionSide, Sistema.AppRemoteServer, true,
                             ComunsImobiliario.MensErroMT );

  // Carrega Tabelas de Lookup
  cdsTipoImovel.Data := CtrlTipoImovel.LookupTipoImovel;

  // Carrega Defaults
  DecodeDate(Date, iAno, iMes, iDia);
  spnAnoIni.Value     := iAno;
  cboMesIni.ItemIndex := iMes -1;
  spnAnoFim.Value     := iAno;
  cboMesFim.ItemIndex := iMes -1;
  edtDataSld.Date     := Date;
end;

procedure TcfgRelMovFinan.FormDestroy(Sender: TObject);
begin
  FreeAndNil( CtrlTipoImovel );
  inherited;
end;

procedure TcfgRelMovFinan.bbtnConfirmarClick(Sender: TObject);
var CorLinha : TColor;
    iPosCor  : Integer;
begin
  inherited;
    if DBcboTipoImovel.Text = '' then
         cmp_Padrao.ParamByName('sTipoImovel').AsString := ''
    else cmp_Padrao.ParamByName('sTipoImovel').AsString := DBcboTipoImovel.lookupValue;

    cmp_Padrao.ParamByName('iMesIni').AsInteger  := cboMesIni.ItemIndex + 1;
    cmp_Padrao.ParamByName('iAnoIni').AsFloat    := spnAnoIni.Value;
    cmp_Padrao.ParamByName('iMesFim').AsInteger  := cboMesFim.ItemIndex + 1;
    cmp_Padrao.ParamByName('iAnoFim').AsFloat    := spnAnoFim.Value;
    cmp_Padrao.ParamByName('dSldCtb').AsDateTime := edtDataSld.Date;
    cmp_Padrao.ParamByName('bPrevRec').AsBoolean := (rgRec.ItemIndex = 0);
    cmp_Padrao.ParamByName('bPrevDesp').AsBoolean:= (rgDesp.ItemIndex = 0);

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
