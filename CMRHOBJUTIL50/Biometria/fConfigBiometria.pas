unit fConfigBiometria;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms,
  Dialogs, FOkCancelar, IvDictio, IvMulti, MAHlpBtn, StdCtrls, Buttons,
  TB97Tlbr, TB97, ExtCtrls, DbClient, uBiometria, uBiometriaTypes, IvEMulti;

type
  TFrmConfigBiometriaBSP = class(TfrmOkCancelar)
    GpbGeral: TGroupBox;
    Label1: TLabel;
    Label2: TLabel;
    Label3: TLabel;
    Label4: TLabel;
    txtEnrollImageQuality: TEdit;
    txtVerifyImageQuality: TEdit;
    txtTimeout: TEdit;
    comboSecurityLevel: TComboBox;
    btnGetInfo: TButton;
    btnSetInfo: TButton;
    GpbEstacao: TGroupBox;
    Label5: TLabel;
    ComboDevice: TComboBox;
    btnOpen: TButton;
    btnEnroll: TButton;
    btnVerify: TButton;
    RgSkin: TRadioGroup;
    Image1: TImage;
    Bevel1: TBevel;
    procedure FormCreate(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure btnOpenClick(Sender: TObject);
    procedure btnGetInfoClick(Sender: TObject);
    procedure btnSetInfoClick(Sender: TObject);
    procedure btnEnrollClick(Sender: TObject);
    procedure btnVerifyClick(Sender: TObject);
    procedure bbtnConfirmarClick(Sender: TObject);
    procedure bbtnCancelarClick(Sender: TObject);
  private
    { Private declarations }
    _CMBiometria: TCMBSP;
    _CpuName: String;
    procedure ShowErrorMessage(sMens: String);
  public
    { Public declarations }
  end;

var
  FrmConfigBiometriaBSP: TFrmConfigBiometriaBSP;

implementation

Uses uMensErro, uSistema, uCtrlPadroes, JclSysInfo;

{$R *.dfm}

procedure TFrmConfigBiometriaBSP.FormCreate(Sender: TObject);
begin
  inherited;
  _CpuName := GetLocalComputerName;
  _CMBiometria := TCMBSP.Create;
  ComboDevice.Items.Text := _CMBiometria.Devices.Text;
  ComboDevice.ItemIndex := 0;

  _CMBiometria.LoadFromDB(Sistema.IdUsuario);

  RgSkin.ItemIndex := Integer(_CMBiometria.TipoSkin);
  ComboDevice.ItemIndex := ComboDevice.Items.IndexOf(_CMBiometria.DeviceName);

  btnGetInfo.Click;
end;

procedure TFrmConfigBiometriaBSP.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
  _CMBiometria.Free;
  inherited;
end;

procedure TFrmConfigBiometriaBSP.btnOpenClick(Sender: TObject);
begin
  inherited;
  btnEnroll.Enabled := False;
  btnVerify.Enabled := False;

  _CMBiometria.DeviceName := ComboDevice.Text;
  if _CMBiometria.Open then
  begin
    btnEnroll.Enabled := True;
    btnVerify.Enabled := True;
  end
  else
    ShowErrorMessage(_CMBiometria.ErrorMessage);
end;

procedure TFrmConfigBiometriaBSP.btnGetInfoClick(Sender: TObject);
begin
  inherited;
  txtEnrollImageQuality.Text := _CMBiometria.EnrollImageQuality;
  txtVerifyImageQuality.Text := _CMBiometria.VerifyImageQuality;
  txtTimeout.Text := _CMBiometria.Timeout;
  comboSecurityLevel.ItemIndex := (_CMBiometria.SecurityLevel - 1);
end;

procedure TFrmConfigBiometriaBSP.btnSetInfoClick(Sender: TObject);
begin
  inherited;
  try
    _CMBiometria.EnrollImageQuality := txtEnrollImageQuality.Text;
    _CMBiometria.VerifyImageQuality := txtVerifyImageQuality.Text;
    _CMBiometria.Timeout := txtTimeout.Text;
    _CMBiometria.SecurityLevel := (comboSecurityLevel.ItemIndex + 1);
  except
    on e: Exception do
      ShowErrorMessage(e.Message);
  end;
end;

procedure TFrmConfigBiometriaBSP.btnEnrollClick(Sender: TObject);
begin
  inherited;
  _CMBiometria.TipoSkin := TTipoSkin(RgSkin.ItemIndex);
  
  if _CMBiometria.Capturar(Sistema.NomeUsuario) then
    MsgDlg('FIR capturado com sucesso!', 'Aviso', mtInformation, [mbOk], 0)
  else
    ShowErrorMessage(_CMBiometria.ErrorMessage);
end;

procedure TFrmConfigBiometriaBSP.btnVerifyClick(Sender: TObject);
begin
  inherited;
  _CMBiometria.TipoSkin := TTipoSkin(RgSkin.ItemIndex);
  
  if _CMBiometria.Verificar(Sistema.NomeUsuario) then
    MsgDlg('FIR verificado com sucesso!', 'Aviso', mtInformation, [mbOk], 0)
  else
    ShowErrorMessage(_CMBiometria.ErrorMessage);
end;

procedure TFrmConfigBiometriaBSP.ShowErrorMessage(sMens: String);
begin
  MsgDlg(sMens, 'Atenção', mtError, [mbOk], 0);
end;

procedure TFrmConfigBiometriaBSP.bbtnConfirmarClick(Sender: TObject);
Var
  sSQL: String;
  bExisteBSPCongig: Boolean;
begin
  inherited;
  if GpbGeral.Enabled then
  begin
     sSQL := 'UPDATE SEGURANCA SET ' +
             ' BSPENROLLQUALITY = ' + txtEnrollImageQuality.Text + ', ' +
             ' BSPVERIFYQUALITY = ' + txtVerifyImageQuality.Text + ', ' +
             ' BSPTIMEOUT = ' + txtTimeout.Text + ', ' +
             ' BSPSECURITYLEVEL = ' + IntToStr(comboSecurityLevel.ItemIndex + 1) + ', ' +
             ' BSPDEVICETYPE = ' + QuotedStr(ComboDevice.Text) + ', ' +
             ' BSPIDSKIN = ' + IntToStr(RgSkin.ItemIndex);

     if not Padroes.ExecSqlAndCommit(sSQL) then
       raise Exception.Create(Padroes.MessageInfo);
  end;

  if Sistema.IdUsuario > 0 then
  begin
    with TClientDataSet.Create(nil) do                      
      try
        Data := Padroes.GetDataPacket(' SELECT ' +
                                      '  IDUSUARIO ' +
                                      ' FROM ' +
                                      '  BSPCONFIG ' +
                                      ' WHERE ' +
                                      '  IDUSUARIO = ' + IntToStr(Sistema.IdUsuario) + ' AND ' +
                                      '  CPUNAME = ' + QuotedStr(_CpuName));

        bExisteBSPCongig := Not IsEmpty;
      finally
        Free;
      end;

      if bExisteBSPCongig then
        sSQL := 'UPDATE BSPCONFIG SET BSPDEVICETYPE = ' + QuotedStr(ComboDevice.Text) + ', BSPIDSKIN = ' + IntToStr(RgSkin.ItemIndex)
      else
        sSQL := 'INSERT INTO BSPCONFIG (IDUSUARIO, CPUNAME, BSPDEVICETYPE, BSPIDSKIN) VALUES ' +
                '( ' + IntToStr(Sistema.IdUsuario) + ', ' +
                      QuotedStr(_CpuName) + ', ' +
                      QuotedStr(ComboDevice.Text) + ', ' +
                      IntToStr(RgSkin.ItemIndex) + ')';

     if not Padroes.ExecSqlAndCommit(sSQL) then
       raise Exception.Create(Padroes.MessageInfo);

     MsgDlg('Dados atualizados com sucesso !', 'Atenção', mtInformation, [MbOk], 0);
     Close;
  end;
end;

procedure TFrmConfigBiometriaBSP.bbtnCancelarClick(Sender: TObject);
begin
  inherited;
  btnGetInfo.Click;
end;

end.

