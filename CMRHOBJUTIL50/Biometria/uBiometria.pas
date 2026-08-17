unit uBiometria;

interface

uses Classes, SysUtils, Comobj, Graphics, DbClient, uBiometriaTypes;

Type
  TCMBSP = Class
  private
    _DeviceID : longint;
    _objSecuBsp : variant;
    //_szFIRTextData : wideString;
    FDevices: TStrings;
    FDeviceName: String;
    FTextData: String;
    FErrorMessage: String;
    FErrorCode: integer;
    FTipoSkin: TTipoSkin;
    procedure SetSecurityLevel(const Value: Integer);
    procedure SetEnrollImageQuality(const Value: String);
    procedure SetTimeout(const Value: String);
    procedure SetVerifyImageQuality(const Value: String);
    procedure SetDeviceName(const Value: String);
    function GetEnrollImageQuality: String;
    function GetTimeout: String;
    function GetVerifyImageQuality: String;
    function GetSecurityLevel: Integer;
    function GetVersion: String;
    procedure SetTextData(const Value: String);
    procedure SetTipoSkin(const Value: TTipoSkin);
  protected

  public
    constructor Create;
    destructor Destroy; Override;

    class procedure ShowFormConfig(EnableAll: Boolean = True);
    class Function Exists: Boolean;

    function Open: Boolean;
    function Capturar(sPayLoad: String): Boolean;
    function Verificar(sPayLoad: String): Boolean;
    function CapturarParaComparar: Boolean;
    function Comparar(sFIR: String): Boolean;
    procedure LoadFromDB(IdUsuario: Double);


    property Version: String read GetVersion;
    property Devices: TStrings read FDevices;
    property ErrorMessage: String read FErrorMessage;
    property ErrorCode: integer read FErrorCode;

    property DeviceName: String read FDeviceName write SetDeviceName;
    property TipoSkin: TTipoSkin read FTipoSkin write SetTipoSkin;
    property SecurityLevel: Integer read GetSecurityLevel write SetSecurityLevel;
    property EnrollImageQuality: String read GetEnrollImageQuality write SetEnrollImageQuality;
    property VerifyImageQuality: String read GetVerifyImageQuality write SetVerifyImageQuality;
    property Timeout: String read GetTimeout write SetTimeout;
    property TextData: String read FTextData write SetTextData;        
  end;

implementation

uses fConfigBiometria, uFormManager, uCMFileUtils, uCtrlPadroes, JclSysInfo;

{ TCMBSP }

function TCMBSP.Capturar(sPayLoad: String): Boolean;
begin
  FTextData := '';
  _objSecuBSP.Enroll(sPayLoad);

  result := _objSecuBSP.ErrorCode = SecuBSPERROR_NONE;

  if result then
    FTextData := _objSecuBSP.FIRTextData
  else
  begin
    FErrorCode := _objSecuBSP.ErrorCode;
    FErrorMessage := 'A função de captura falhou. Erro nº ' + inttostr(FErrorCode);
  end;
end;

function TCMBSP.CapturarParaComparar: Boolean;
begin
  _objSecuBSP.Capture;
  result := _objSecuBSP.ErrorCode = SecuBSPERROR_NONE;
  if result then
    FTextData := _objSecuBSP.FIRTextData
  else
  begin
    FErrorCode := _objSecuBSP.ErrorCode;
    FErrorMessage := 'A função de captura falhou. Erro nº ' + inttostr(FErrorCode);
    FTextData := '';
  end;
end;

function TCMBSP.Comparar(sFIR: String): Boolean;
begin
  _objSecuBSP.VerifyMatch(FTextData, sFIR);
  result := (_objSecuBSP.IsMatched = SecuBSP_TRUE)
end;

constructor TCMBSP.Create;
var
  i : longint;
begin
  FTipoSkin := tsPortuguese;
  FErrorMessage := '';
  
  _objSecuBsp := CreateOleObject('SecuBSPCOM.APIInterface');

  FDeviceName := 'Auto_Detect';
  _DeviceID := SecuBSP_DEVICE_ID_AUTO_DETECT;

  FDevices := TStringList.Create;
  FDevices.Add('Auto_Detect');
  
  _objSecuBSP.EnumerateDevice;
  for i := 0 To _objSecuBSP.DeviceNum - 1 do
  begin
      Case _objSecuBSP.DeviceID[i] of
          1 :  FDevices.Append('FDP02');
          2 :  FDevices.Append('FDU01');
      End;
  end;
end;

destructor TCMBSP.Destroy;
begin
  FDevices.Free;

  if not VarIsEmpty(_objSecuBSP) then
  begin
     _objSecuBSP.CloseDevice(_DeviceID);
     _objSecuBSP :=null;
  end;

  inherited;
end;

class function TCMBSP.Exists: Boolean;
begin
  Try
    with TCMBSP.Create do
    begin
      result := Open;             
      Free;
    end;
  Except
    result := False;
  end;
end;

function TCMBSP.GetEnrollImageQuality: String;
begin
  result := _objSecuBSP.EnrollImageQuality;
end;

function TCMBSP.GetSecurityLevel: Integer;
begin
  Result := _objSecuBSP.SecurityLevel;
end;

function TCMBSP.GetTimeout: String;
begin
  Result := _objSecuBSP.CaptureTimeout;
end;

function TCMBSP.GetVerifyImageQuality: String;
begin
  Result := _objSecuBSP.VerifyImageQuality;
end;

function TCMBSP.GetVersion: String;
begin
  result := _objSecuBSP.Version;
end;

procedure TCMBSP.LoadFromDB(IdUsuario: Double);              
begin
  if Padroes <> nil then
  begin
     with TClientDataSet.Create(nil) do
       Try
         Data := Padroes.GetDataPacket(' SELECT ' +
                                       ' BSPENROLLQUALITY, ' +
                                       ' BSPVERIFYQUALITY, ' +
                                       ' BSPTIMEOUT, ' +
                                       ' BSPSECURITYLEVEL, ' +
                                       ' BSPDEVICETYPE, ' +
                                       ' BSPIDSKIN ' +
                                     ' FROM SEGURANCA ');

         if not IsEmpty then
         begin
           if FieldByName('BSPENROLLQUALITY').AsFloat > 0 then
             EnrollImageQuality := FieldByName('BSPENROLLQUALITY').AsString;

           if FieldByName('BSPVERIFYQUALITY').AsFloat > 0 then
             VerifyImageQuality := FieldByName('BSPVERIFYQUALITY').AsString;

           if FieldByName('BSPTIMEOUT').AsFloat > 0 then
             Timeout := FieldByName('BSPTIMEOUT').AsString;

           if FieldByName('BSPSECURITYLEVEL').AsInteger > 0 then
             SecurityLevel := FieldByName('BSPSECURITYLEVEL').AsInteger;

           if Trim(FieldByName('BSPDEVICETYPE').AsString) <> '' then
             DeviceName := FieldByName('BSPDEVICETYPE').AsString;

           if FieldByName('BSPIDSKIN').AsInteger >= 0 then
             TipoSkin := TTipoSkin(FieldByName('BSPIDSKIN').AsInteger);
         end;

         Close;

         //Busca Parâmetros específicos para o Usuário / Máquina
         Data := Padroes.GetDataPacket(' SELECT ' +
                                      '  BSPDEVICETYPE , ' +
                                      '  BSPIDSKIN  ' +
                                      ' FROM ' +
                                      '  BSPCONFIG ' +
                                      ' WHERE ' +
                                      '  IDUSUARIO = ' + FloatToStr(IdUsuario) + ' AND ' +
                                      '  CPUNAME = ' + QuotedStr(GetLocalComputerName));

         if not IsEmpty then
         begin
           if Trim(FieldByName('BSPDEVICETYPE').AsString) <> '' then
             DeviceName := FieldByName('BSPDEVICETYPE').AsString;

           if FieldByName('BSPIDSKIN').AsInteger >= 0 then
             TipoSkin := TTipoSkin(FieldByName('BSPIDSKIN').AsInteger);
         end;
       finally
         Free;
       end;
  end;
end;

function TCMBSP.Open: Boolean;
begin
  _objSecuBSP.CloseDevice(_DeviceID);
  _objSecuBSP.OpenDevice(_DeviceID);

  result := (_objSecuBSP.ErrorCode = SecuBSPERROR_NONE);

  if not result then
  begin
    FErrorCode := _objSecuBSP.ErrorCode;
    FErrorMessage := 'Não foi possível abrir o dispositivo. Erro nº: ' + IntToStr(FErrorCode);
  end;
end;

procedure TCMBSP.SetDeviceName(const Value: String);
begin
  FDeviceName := Value;

  _DeviceID := SecuBSP_DEVICE_ID_AUTO_DETECT;
  
  if Trim(UpperCase(FDeviceName)) = 'AUTO_DETECT' then
    _DeviceID := SecuBSP_DEVICE_ID_AUTO_DETECT
  else
    if Trim(UpperCase(FDeviceName)) = 'FDP02' then
      _DeviceID := SecuBSP_DEVICE_ID_FDP02_0
    else
      if Trim(UpperCase(FDeviceName)) = 'FDU01' then
        _DeviceID := SecuBSP_DEVICE_ID_FDU01_0
end;

procedure TCMBSP.SetEnrollImageQuality(const Value: String);
Var
  iValue: Integer;
begin
  iValue := strtoint64(Value);

  if (iValue > 2000000000) Or (iValue < 0) then
    raise Exception.Create('Erro ao atualizar a "Qualidade de Captura da Imagem" no BSP: Valor fora da Faixa.')
  else
  begin
    _objSecuBSP.EnrollImageQuality := Value;
    If _objSecuBSP.ErrorCode <> SecuBSPERROR_NONE Then
      raise Exception.Create('Erro ao atualizar a "Qualidade de Captura da Imagem" no BSP.');
  end;
end;

procedure TCMBSP.SetSecurityLevel(const Value: Integer);
begin
  _objSecuBSP.SecurityLevel := Value;
  If _objSecuBSP.ErrorCode <> SecuBSPERROR_NONE Then
    raise Exception.Create('Erro ao atualizar o ScurityLevel no BSP.');
end;

procedure TCMBSP.SetTextData(const Value: String);
begin
  FTextData := Value;
end;

procedure TCMBSP.SetTimeout(const Value: String);
Var
  iValue: Integer;
begin
  iValue := strtoint64(Value);

  if (iValue > 2000000000) Or (iValue < 0) then
    raise Exception.Create('Erro ao atualizar o TimeOut no BSP: Valor fora da Faixa.')
  else
  begin
    _objSecuBSP.CaptureTimeout := Value;
    If _objSecuBSP.ErrorCode <> SecuBSPERROR_NONE Then
      raise Exception.Create('Erro ao atualizar o TimeOut no BSP.');
  end;
end;

procedure TCMBSP.SetTipoSkin(const Value: TTipoSkin);
var
  SkinFileName: String;
  sDllName: String;
  ret: Integer;
begin
  FTipoSkin := Value;

  Case FTipoSkin of
    tsPortuguese: sDllName := SecuBSP_SKIN_PORT;
    tsEnglish: sDllName := SecuBSP_SKIN_ENG;
    tsEnglish2: sDllName := SecuBSP_SKIN_ENG_2;
    tsKorean: sDllName := SecuBSP_SKIN_KOR;
    tsKorean2: sDllName := SecuBSP_SKIN_KOR_2;
  end;

  SkinFileName := CMApplicationPath + 'Skin-BSP\' + sDllName;

  if FileExists(SkinFileName) then
  begin
    ret := _objSecuBSP.SetSkinResource(SkinFileName);

    if ret <> SecuBSPERROR_NONE then
      raise Exception.Create('Não foi possível carregar o Skin selecionado.');
  end;
end;

procedure TCMBSP.SetVerifyImageQuality(const Value: String);
Var
  iValue: Integer;
begin
  iValue := strtoint64(Value);

  if (iValue > 2000000000) Or (iValue < 0) then
    raise Exception.Create('Erro ao atualizar a "Qualidade de Verificação da Imagem" no BSP: Valor fora da Faixa.')
  else
  begin
    _objSecuBSP.VerifyImageQuality := Value;
    If _objSecuBSP.ErrorCode <> SecuBSPERROR_NONE Then
      raise Exception.Create('Erro ao atualizar a "Qualidade de Verificação da Imagem" no BSP.');
  end;
end;

class procedure TCMBSP.ShowFormConfig(EnableAll: Boolean = True);
begin
  AbrirForm(FrmConfigBiometriaBSP, TFrmConfigBiometriaBSP, false);

  FrmConfigBiometriaBSP.GpbGeral.Enabled := EnableAll;
  FrmConfigBiometriaBSP.GpbEstacao.Enabled := True;

  if not FrmConfigBiometriaBSP.GpbGeral.Enabled then
     FrmConfigBiometriaBSP.GpbGeral.Font.Color := ClGray;
end;

function TCMBSP.Verificar(sPayLoad: String): Boolean;
begin
  result := false;
  if Trim(FTextData) = '' then
    FErrorMessage := 'Não foram encontrados dados para verificação'
  else
  begin
    _objSecuBSP.Verify(FTextData);

    result := (_objSecuBSP.ErrorCode = SecuBSPERROR_NONE);

    if not result then
    begin
      FErrorCode := _objSecuBSP.ErrorCode;
      FErrorMessage := 'A função de verificação falhou. Erro nº ' + inttostr(ErrorCode);
    end
    else
    begin
      result := (_objSecuBSP.IsMatched = SecuBSP_TRUE) And
                (Trim(UpperCase(_objSecuBSP.PayloadData)) = Trim(UpperCase(sPayLoad)));

      if not result then
        FErrorMessage := 'FIR não combina. Tente novamente.';
    end;
  end;
end;

end.
