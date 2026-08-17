{-------------------------------------------------------------------------------
ALTERAÇÕES / IMPLEMENTAÇÕES ----------------------------------------------------
--------------------------------------------------------------------------------
Padrão       : 5.10.18 em diante
Pendência    : 27573
Responsável  : Daniel Simões
Data         : 17/03/2008
Descrição    : Ajuste do Help Context...
--------------------------------------------------------------------------------
-------------------------------------------------------------------------------}

unit cRelReavalia;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  fParamReports_Padrao, StdCtrls, wwdbdatetimepicker, CMDateTimePicker,
  mImovelouMestre, CmParamReport, IvDictio, IvMulti, IvEMulti, MAHlpBtn,
  Buttons, TB97Tlbr, TB97, ExtCtrls, fcCombo, fcColorCombo, mImovelMestre,
  Db, uCmSqlParams, wwdblook, DBClient, uCMClientDataSet, uCtrlTipoImovel,
  Mask, wwdbedit, Wwdbspin;

type
  TcfgRelReavalia = class(TfrmParamReports_Padrao)
    chkLinhas: TCheckBox;
    chkCorLinha: TCheckBox;
    cboCorLinha: TfcColorCombo;
    molImovelMestre1: TmolImovelMestre;
    CDS_TpImovel: TCMClientDataSet;
    DBLTipoImovel: TwwDBLookupCombo;
    Label5: TLabel;
    DataSource1: TDataSource;
    CMSqlParams1: TCMSqlParams;
    ChkBNaoReavalia: TCheckBox;
    DBSpinAno: TwwDBSpinEdit;
    Label1: TLabel;
    edtReavalia: TCMDateTimePicker;
    procedure bbtnConfirmarClick(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure molImovelMestre1btnBuscaImovelClick(Sender: TObject);
    procedure ChkBNaoReavaliaClick(Sender: TObject);
  private
    { Private declarations }
    CtrlTipoImovel : TCtrlTipoImovel;
  public
    { Public declarations }
  end;

var
  cfgRelReavalia: TcfgRelReavalia;

implementation

uses uComunsImobiliario, uVerificaPreenchimento, uMensErro, uSistema, dBaseDados;

{$R *.DFM}

{ TcfgRelSaldoImovel }

procedure TcfgRelReavalia.FormCreate(Sender: TObject);
begin
  inherited;
  // Limpa o Frame
  molImovelMestre1.btnLimpaImovelClick( Self );

  CtrlTipoImovel := tCtrlTipoImovel.Create;
  CtrlTipoImovel.Initialize(DtmBaseDados.DbBaseDados, True, Sistema.ConnectionType,
                        Sistema.ConnectionSide, Sistema.AppRemoteServer, True,
                        ComunsImobiliario.MensErroMT);
  CDS_TpImovel.data := CtrlTipoImovel.LookupTipoImovel;

  DBSpinAno.Value := StrToInt(FormatDateTime('YYYY', Date));
end;


procedure TcfgRelReavalia.bbtnConfirmarClick(Sender: TObject);
var CorLinha : TColor;
    iPosCor  : Integer;
begin
  if edtReavalia.Text = '' then begin
     MsgDlg('Informe a data da Reavaliação','Aviso',mtWarning,[mbok],0);
     Exit;
  end;

  inherited;
  
  cmp_Padrao.ParamByName('idMestre').AsInteger   := molImovelMestre1.iMestre;
  cmp_Padrao.ParamByName('dReavalia').AsDateTime := edtReavalia.Date;

  If trim(DBLTipoImovel.Text) <> '' then
    cmp_Padrao.ParamByName('sCodTipImovel').AsString  := CDS_TpImovel.FieldByname('CODTIPIMOVEL').AsString;

  If ChkBNaoReavalia.Checked then
    cmp_Padrao.ParamByName('iAno').AsInteger := StrToInt(DBSpinAno.Text);

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


procedure TcfgRelReavalia.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
  inherited;
  FreeAndNil(CtrlTipoImovel);
end;

procedure TcfgRelReavalia.molImovelMestre1btnBuscaImovelClick(
  Sender: TObject);
begin
  inherited;
  molImovelMestre1.btnBuscaImovelClick(Sender);
end;

procedure TcfgRelReavalia.ChkBNaoReavaliaClick(Sender: TObject);
begin
  inherited;

  if ChkBNaoReavalia.Checked then
   begin
    DBSpinAno.Enabled := ChkBNaoReavalia.Checked;
    DBSpinAno.SetFocus
   end
  else
    begin
     DBSpinAno.Clear;
     DBSpinAno.Enabled := false
    end
end;

end.
