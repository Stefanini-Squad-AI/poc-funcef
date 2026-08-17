inherited frmSelOrigem: TfrmSelOrigem
  Left = 231
  Top = 343
  BorderIcons = [biSystemMenu]
  BorderStyle = bsSingle
  Caption = 'Cópia de Seleção de Dados'
  ClientHeight = 209
  ClientWidth = 424
  FormStyle = fsNormal
  Visible = False
  PixelsPerInch = 96
  TextHeight = 13
  inherited pnlFundo: TPanel
    Width = 424
    Height = 170
    object lblTipoUsuario: TLabel
      Left = 13
      Top = 99
      Width = 100
      Height = 13
      Alignment = taRightJustify
      AutoSize = False
      Caption = 'Tipo de Usuário:'
    end
    object lblInterface: TLabel
      Left = 52
      Top = 131
      Width = 60
      Height = 13
      Alignment = taRightJustify
      AutoSize = False
      Caption = 'Interface:'
    end
    object dblkpInterface: TDBLookupComboBox
      Left = 115
      Top = 128
      Width = 294
      Height = 21
      KeyField = 'IDWEBINTERFACE'
      ListField = 'NOMEINTERFACE'
      ListSource = dtsInterface
      TabOrder = 1
    end
    object grpAtencao: TGroupBox
      Left = 16
      Top = 16
      Width = 393
      Height = 65
      Caption = 'ATENÇÃO'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clMaroon
      Font.Height = -9
      Font.Name = 'MS Sans Serif'
      Font.Style = [fsBold]
      ParentFont = False
      TabOrder = 2
      object lblMsg: TLabel
        Left = 8
        Top = 16
        Width = 379
        Height = 42
        AutoSize = False
        Caption = 
          'Esta operação irá destruir todas as configurações específicas pa' +
          'ra este tipo de usuário e interface, substituindo-as pelas confi' +
          'gurações do tipo de usuário e interface abaixo selecionados.'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clNavy
        Font.Height = -9
        Font.Name = 'MS Sans Serif'
        Font.Style = [fsBold]
        ParentFont = False
        WordWrap = True
      end
    end
    object cmbTipoUsuario: TComboBox
      Left = 115
      Top = 96
      Width = 293
      Height = 21
      Style = csDropDownList
      ItemHeight = 13
      TabOrder = 0
      Items.Strings = (
        'Participante'
        'Dependente'
        'Beneficiário'
        'Elegível')
    end
  end
  inherited Dock971: TDock97
    Top = 170
    Width = 424
    inherited tb97Fundo: TToolbar97
      Left = 83
      DockPos = 86
      Visible = False
      inherited bbtnSair: TBitBtn
        Visible = False
      end
      inherited bbtnAjuda: TmaHelpBitBtn
        Visible = False
      end
    end
    inherited TB97oKCancelar: TToolbar97
      Left = 255
      DockPos = 319
      inherited bbtnConfirmar: TBitBtn
        ModalResult = 0
        OnClick = bbtnConfirmarClick
      end
    end
  end
  inherited ivTradutor: TIvExtendedTranslator
    Left = 363
    Top = 5
  end
  object cdsInterface: TCMClientDataSet
    Aggregates = <>
    Params = <>
    ProviderName = 'DataSetProvider1'
    Left = 308
    Top = 5
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
  end
  object dtsTipoUsuario: TDataSource
    Left = 175
    Top = 6
  end
  object dtsInterface: TDataSource
    DataSet = cdsInterface
    Left = 246
    Top = 5
  end
end
