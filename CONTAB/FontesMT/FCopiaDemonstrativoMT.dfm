inherited frmCopiaDemonstrativomt: TfrmCopiaDemonstrativomt
  Left = 204
  Top = 204
  Caption = 'Copiar Demonstrativos'
  ClientWidth = 394
  FormStyle = fsNormal
  Visible = False
  OnActivate = FormActivate
  PixelsPerInch = 96
  TextHeight = 13
  inherited pnlFundo: TPanel
    Width = 394
    object Label4: TLabel
      Left = 24
      Top = 71
      Width = 143
      Height = 13
      Caption = 'Demonstrativo de Origem'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = [fsBold]
      ParentFont = False
    end
    object rgEscolha: TRadioGroup
      Left = 22
      Top = 15
      Width = 352
      Height = 46
      Caption = ' Opção '
      ItemIndex = 0
      Items.Strings = (
        'de uma &Empresa para outra Empresa'
        'um &Demonstrativo para outro dentro da mesma empresa')
      TabOrder = 0
      OnClick = rgEscolhaClick
    end
    object dblkDemoOri: TwwDBLookupCombo
      Left = 24
      Top = 87
      Width = 351
      Height = 21
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = [fsBold]
      DropDownAlignment = taLeftJustify
      Selected.Strings = (
        'DEMDESCDEMONSTRAT'#9'60'#9'Descrição')
      LookupTable = CdsDemonstrativo
      LookupField = 'IDDEMONSTRATIVO'
      Style = csDropDownList
      DropDownWidth = 8
      ParentFont = False
      TabOrder = 1
      AutoDropDown = True
      ShowButton = True
      AllowClearKey = True
      ShowMatchText = True
    end
    object gbDestino: TGroupBox
      Left = 15
      Top = 117
      Width = 364
      Height = 105
      Caption = ' Destino '
      TabOrder = 2
      object Label1: TLabel
        Left = 8
        Top = 16
        Width = 49
        Height = 13
        Caption = 'Empresa'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'MS Sans Serif'
        Font.Style = [fsBold]
        ParentFont = False
      end
      object lblDemoDest: TLabel
        Left = 8
        Top = 57
        Width = 82
        Height = 13
        Caption = 'Demonstrativo'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'MS Sans Serif'
        Font.Style = [fsBold]
        ParentFont = False
      end
      object dblkDemoDest: TwwDBLookupCombo
        Left = 8
        Top = 72
        Width = 348
        Height = 21
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'MS Sans Serif'
        Font.Style = [fsBold]
        DropDownAlignment = taLeftJustify
        Selected.Strings = (
          'DEMDESCDEMONSTRAT'#9'60'#9'Descrição')
        LookupTable = CdsDemonstrativo2
        LookupField = 'IDDEMONSTRATIVO'
        Style = csDropDownList
        DropDownWidth = 8
        ParentFont = False
        TabOrder = 0
        AutoDropDown = True
        ShowButton = True
        AllowClearKey = True
        ShowMatchText = True
      end
      object dblkEmpresaDest: TwwDBLookupCombo
        Left = 9
        Top = 30
        Width = 347
        Height = 21
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'MS Sans Serif'
        Font.Style = [fsBold]
        DropDownAlignment = taLeftJustify
        Selected.Strings = (
          'NOMEEMPRESA'#9'60'#9'Nome da Empresa'#9'F')
        LookupTable = CdsEmpresaProp
        LookupField = 'IDPESSOA'
        Style = csDropDownList
        DropDownWidth = 8
        ParentFont = False
        TabOrder = 1
        AutoDropDown = True
        ShowButton = True
        AllowClearKey = True
        ShowMatchText = True
      end
    end
  end
  inherited Dock971: TDock97
    Width = 394
    inherited tb97Fundo: TToolbar97
      Left = 224
    end
    inherited TB97oKCancelar: TToolbar97
      Left = 57
      inherited bbtnConfirmar: TBitBtn
        OnClick = bbtnConfirmarClick
      end
    end
  end
  inherited ivTradutor: TIvExtendedTranslator
    Left = 19
    Top = 235
  end
  object CdsEmpresaProp: TCMClientDataSet
    Aggregates = <>
    Params = <>
    Left = 144
    Top = 136
  end
  object CdsDemonstrativo: TCMClientDataSet
    Aggregates = <>
    Params = <>
    Left = 144
    Top = 88
  end
  object CdsDemonstrativo2: TCMClientDataSet
    Aggregates = <>
    Params = <>
    Left = 143
    Top = 197
  end
end
