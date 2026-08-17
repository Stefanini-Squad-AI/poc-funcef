object FrmAcessoaDados: TFrmAcessoaDados
  Left = 174
  Top = 103
  Width = 544
  Height = 375
  Caption = 'FrmAcessoaDados'
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'MS Sans Serif'
  Font.Style = []
  OldCreateOrder = False
  OnClose = FormClose
  OnCreate = FormCreate
  PixelsPerInch = 96
  TextHeight = 13
  object CdsCliente: TClientDataSet
    Aggregates = <>
    Params = <>
    ProviderName = 'DspCliente'
    RemoteServer = Skt
    BeforeOpen = CdsClienteBeforeOpen
    Left = 56
    Top = 64
    object CdsClienteNOMEDM_CLIENTE: TStringField
      FieldName = 'NOMEDM_CLIENTE'
      Size = 60
    end
    object CdsClienteIDDM_CLIENTE: TFloatField
      FieldName = 'IDDM_CLIENTE'
    end
  end
  object CdsTipoCliente: TClientDataSet
    Aggregates = <>
    Params = <>
    ProviderName = 'DspTipoCliente'
    RemoteServer = Skt
    BeforeOpen = CdsTipoClienteBeforeOpen
    Left = 56
    Top = 16
    object CdsTipoClienteIDDM_TIPOCLIENTE: TFloatField
      FieldName = 'IDDM_TIPOCLIENTE'
    end
    object CdsTipoClienteDESCDM_TIPOCLIENTE: TStringField
      FieldName = 'DESCDM_TIPOCLIENTE'
      Size = 60
    end
  end
  object CdsClientexTipo: TClientDataSet
    Aggregates = <>
    Params = <>
    ProviderName = 'DsClienteXTipo'
    RemoteServer = Skt
    BeforeOpen = CdsClientexTipoBeforeOpen
    Left = 56
    Top = 112
    object CdsClientexTipoDESCDM_TIPOCLIENTE: TStringField
      FieldName = 'DESCDM_TIPOCLIENTE'
      Size = 60
    end
    object CdsClientexTipoIDDM_TIPOCLIENTE: TFloatField
      FieldName = 'IDDM_TIPOCLIENTE'
    end
    object CdsClientexTipoIDDM_CLIENTE: TFloatField
      FieldName = 'IDDM_CLIENTE'
    end
  end
  object DbLocal: TDatabase
    DatabaseName = 'DbnLocal'
    DriverName = 'ORACLE'
    LoginPrompt = False
    Params.Strings = (
      'SERVER NAME=LOC'
      'USER NAME=CM'
      'NET PROTOCOL=TNS'
      'OPEN MODE=READ/WRITE'
      'SCHEMA CACHE SIZE=8'
      'LANGDRIVER='
      'SQLQRYMODE=SERVER'
      'SQLPASSTHRU MODE=SHARED AUTOCOMMIT'
      'SCHEMA CACHE TIME=-1'
      'MAX ROWS=-1'
      'BATCH COUNT=200'
      'ENABLE SCHEMA CACHE=FALSE'
      'SCHEMA CACHE DIR='
      'ENABLE BCD=FALSE'
      'ENABLE INTEGERS=FALSE'
      'LIST SYNONYMS=NONE'
      'ROWSET SIZE=20'
      'BLOBS TO CACHE=64'
      'BLOB SIZE=32'
      'OBJECT MODE=TRUE'
      'PASSWORD=cmsol')
    SessionName = 'Default'
    Left = 376
    Top = 56
  end
  object Skt: TSocketConnection
    ServerGUID = '{CEF59534-D9D1-11D5-B185-000000000000}'
    ServerName = 'ServerDemoBO.DmDemoBO'
    Host = 'LOCALHOST'
    Left = 416
    Top = 56
  end
  object CdsAllClienteXTipo: TClientDataSet
    Aggregates = <>
    Params = <>
    ProviderName = 'DspAllClienteXTipo'
    RemoteServer = Skt
    BeforeOpen = CdsAllClienteXTipoBeforeOpen
    Left = 56
    Top = 160
  end
end
