inherited frmStatus: TfrmStatus
  BorderIcons = [biSystemMenu, biMinimize]
  BorderStyle = bsSingle
  Caption = 'Status do Sistema'
  ClientHeight = 153
  ClientWidth = 368
  OnDestroy = FormDestroy
  PixelsPerInch = 96
  TextHeight = 13
  inherited pnlFundo: TPanel
    Width = 368
    Height = 114
    object lblInterface: TLabel
      Left = 6
      Top = 14
      Width = 60
      Height = 13
      Alignment = taRightJustify
      AutoSize = False
      Caption = 'Interface:'
    end
    object Bevel1: TBevel
      Left = 11
      Top = 41
      Width = 346
      Height = 6
      Shape = bsTopLine
    end
    object lblTxQtde: TLabel
      Left = 8
      Top = 56
      Width = 209
      Height = 13
      Alignment = taRightJustify
      Caption = 'Quantidade de usuários conectados:'
    end
    object lblTxUltAcesso: TLabel
      Left = 8
      Top = 88
      Width = 209
      Height = 13
      Alignment = taRightJustify
      Caption = 'Último acesso:'
    end
    object lblQtde: TLabel
      Left = 224
      Top = 57
      Width = 3
      Height = 13
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -9
      Font.Name = 'MS Sans Serif'
      Font.Style = []
      ParentFont = False
    end
    object lblUltAcesso: TLabel
      Left = 224
      Top = 89
      Width = 3
      Height = 13
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -9
      Font.Name = 'MS Sans Serif'
      Font.Style = []
      ParentFont = False
    end
    object dblkpInterface: TDBLookupComboBox
      Left = 70
      Top = 11
      Width = 289
      Height = 21
      KeyField = 'IDWEBINTERFACE'
      ListField = 'NOMEINTERFACE'
      ListSource = dtsInterface
      TabOrder = 0
      OnClick = dblkpInterfaceClick
    end
  end
  inherited Dock971: TDock97
    Top = 114
    Width = 368
    inherited tb97Fundo: TToolbar97
      Left = 196
    end
    inherited TB97oKCancelar: TToolbar97
      Left = 27
      Visible = False
    end
  end
  inherited ivTradutor: TIvExtendedTranslator
    Left = 243
    Top = 3
  end
  object cdsInterface: TCMClientDataSet
    Aggregates = <>
    Params = <>
    Left = 276
    Top = 3
    object cdsInterfaceIDWEBINTERFACE: TFloatField
      FieldName = 'IDWEBINTERFACE'
    end
    object cdsInterfaceNOMEINTERFACE: TStringField
      FieldName = 'NOMEINTERFACE'
      Size = 50
    end
    object cdsInterfaceENDLOGIN: TStringField
      FieldName = 'ENDLOGIN'
      Size = 100
    end
    object cdsInterfaceEMAIL: TStringField
      FieldName = 'EMAIL'
      Size = 50
    end
    object cdsInterfaceTIMEOUT: TFloatField
      FieldName = 'TIMEOUT'
    end
    object cdsInterfaceMENUALTURA: TFloatField
      FieldName = 'MENUALTURA'
    end
    object cdsInterfaceMENULARGURA: TFloatField
      FieldName = 'MENULARGURA'
    end
    object cdsInterfaceMENUTAMFONTE: TFloatField
      FieldName = 'MENUTAMFONTE'
    end
    object cdsInterfaceMENUPOSX: TFloatField
      FieldName = 'MENUPOSX'
    end
    object cdsInterfaceMENUPOSY: TFloatField
      FieldName = 'MENUPOSY'
    end
    object cdsInterfaceMENUDISTANCIA: TFloatField
      FieldName = 'MENUDISTANCIA'
    end
    object cdsInterfaceMENUNOMEFONTE: TStringField
      FieldName = 'MENUNOMEFONTE'
      Size = 50
    end
    object cdsInterfaceMENUCORFONTE: TStringField
      FieldName = 'MENUCORFONTE'
    end
    object cdsInterfaceMENUCORFONTESEL: TStringField
      FieldName = 'MENUCORFONTESEL'
    end
    object cdsInterfaceMENUCORFUNDO: TStringField
      FieldName = 'MENUCORFUNDO'
    end
    object cdsInterfaceMENUCORFUNDOSEL: TStringField
      FieldName = 'MENUCORFUNDOSEL'
    end
    object cdsInterfaceFLGUSAMENU: TStringField
      FieldName = 'FLGUSAMENU'
      FixedChar = True
      Size = 1
    end
    object cdsInterfaceFLGUSALAYERS: TStringField
      FieldName = 'FLGUSALAYERS'
      FixedChar = True
      Size = 1
    end
    object cdsInterfaceFLGDEMO: TStringField
      FieldName = 'FLGDEMO'
      FixedChar = True
      Size = 1
    end
    object cdsInterfaceFLGJANELARELAT: TStringField
      FieldName = 'FLGJANELARELAT'
      Size = 1
    end
  end
  object dtsInterface: TDataSource
    DataSet = cdsInterface
    Left = 309
    Top = 3
  end
end
