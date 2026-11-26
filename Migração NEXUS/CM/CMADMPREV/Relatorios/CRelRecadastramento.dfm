inherited cfgRelRecadastramento: TcfgRelRecadastramento
  Left = 279
  Top = 99
  BorderStyle = bsSingle
  Caption = 'Recadastramento'
  ClientHeight = 259
  ClientWidth = 418
  FormStyle = fsNormal
  Visible = False
  PixelsPerInch = 96
  TextHeight = 13
  inherited pnlFundo: TPanel
    Width = 418
    Height = 220
    object chkSeparador: TCheckBox
      Left = 32
      Top = 184
      Width = 233
      Height = 17
      Caption = 'Imprimir separador entre linhas'
      TabOrder = 0
    end
    object rdgBeneficios: TRadioGroup
      Left = 24
      Top = 16
      Width = 153
      Height = 65
      Caption = ' Listar Benefícios '
      ItemIndex = 0
      Items.Strings = (
        'Pendentes'
        'Recadastrados')
      TabOrder = 1
    end
    object rdgOrdena: TRadioGroup
      Left = 192
      Top = 16
      Width = 201
      Height = 65
      Caption = ' Ordenação '
      ItemIndex = 0
      Items.Strings = (
        'por Matrícula do Titular'
        'por Nome do Beneficiário')
      TabOrder = 2
    end
    object GroupBox3: TGroupBox
      Left = 24
      Top = 88
      Width = 369
      Height = 81
      TabOrder = 3
      object Label8: TLabel
        Left = 72
        Top = 16
        Width = 178
        Height = 13
        Caption = 'Tipo de Documento referente à'
      end
      object Label9: TLabel
        Left = 72
        Top = 32
        Width = 127
        Height = 13
        Caption = 'Carteira de Identidade'
      end
      object DBcboDocumento: TwwDBLookupCombo
        Left = 72
        Top = 48
        Width = 225
        Height = 21
        DropDownAlignment = taLeftJustify
        Selected.Strings = (
          'NOMEDOCUMENTO'#9'30'#9'NOMEDOCUMENTO')
        LookupTable = qryTipoDoc
        LookupField = 'IDDOCUMENTO'
        Style = csDropDownList
        DropDownCount = 6
        DropDownWidth = 8
        TabOrder = 0
        AutoDropDown = True
        ShowButton = True
        AllowClearKey = False
      end
    end
  end
  inherited Dock971: TDock97
    Top = 220
    Width = 418
    inherited tb97Fundo: TToolbar97
      Left = 242
      DockPos = 242
    end
    inherited TB97oKCancelar: TToolbar97
      Left = 73
      DockPos = 73
      inherited bbtnConfirmar: TBitBtn
        OnClick = bbtnConfirmarClick
      end
    end
  end
  inherited ivTradutor: TIvExtendedTranslator
    Left = 65515
    Top = 65515
    TargetsData = (
      1
      1
      (
        ''
        'Text'
        0))
  end
  object qryTipoDoc: TwwQuery
    DatabaseName = 'BaseDados'
    SQL.Strings = (
      'SELECT'
      '   IDDOCUMENTO, NOMEDOCUMENTO'
      'FROM'
      '   TIPODOCPESSOA'
      'ORDER BY'
      '   NOMEDOCUMENTO')
    ValidateWithMask = True
    Left = 400
    Top = 65535
    object qryTipoDocNOMEDOCUMENTO: TStringField
      DisplayWidth = 30
      FieldName = 'NOMEDOCUMENTO'
      Origin = 'TIPODOCPESSOA.NOMEDOCUMENTO'
      Size = 30
    end
    object qryTipoDocIDDOCUMENTO: TFloatField
      FieldName = 'IDDOCUMENTO'
      Origin = 'TIPODOCPESSOA.IDDOCUMENTO'
      Visible = False
    end
  end
end
