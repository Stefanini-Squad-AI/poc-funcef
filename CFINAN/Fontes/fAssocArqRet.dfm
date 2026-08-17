inherited frmAssocArqRet: TfrmAssocArqRet
  Left = 635
  Top = 397
  BorderIcons = []
  Caption = 'Associação de Arquivo de Retorno'
  ClientHeight = 129
  ClientWidth = 381
  OnShow = FormShow
  PixelsPerInch = 96
  TextHeight = 13
  object pnlArqRet: TPanel [0]
    Left = 0
    Top = 0
    Width = 381
    Height = 129
    Align = alClient
    BevelInner = bvLowered
    TabOrder = 0
    object btnAssocArqRet: TSpeedButton
      Left = 352
      Top = 64
      Width = 23
      Height = 22
      Hint = 'Localizar arquivo de retorno, formato .RET'
      Glyph.Data = {
        86050000424D8605000000000000360000002800000016000000140000000100
        18000000000050050000C40E0000C40E00000000000000000000848284000000
        0000000000000000000000000000000000000000000000000000000000000000
        0000000000000000000000000000000000000000000000000000000000008482
        84C6C3C6FFFFFFC6C3C6FFFFFFC6C3C6FFFFFFC6C3C6FFFFFFC6C3C6FFFFFFC6
        C3C6FFFFFFC6C3C6FFFFFFC6C3C6FFFFFFC6C3C6FFFFFFC6C3C6FFFFFF000000
        0000848284FFFFFFC6C3C6FFFFFFC6C3C6FFFFFFC6C3C6FFFFFFC6C3C6FFFFFF
        C6C3C6FFFFFFC6C3C6FFFFFFC6C3C6FFFFFFC6C3C6FFFFFFC6C3C6FFFFFFC6C3
        C60000000000848284C6C3C6FFFFFFC6C3C60000000000000000000000000000
        00000000000000000000000000000000000000000000FFFFFFC6C3C6FFFFFFC6
        C3C6FFFFFF0000000000848284FFFFFFC6C3C600000000000000FFFFC6C3C600
        FFFFC6C3C600FFFFC6C3C600FFFFC6C3C600FFFFC6C3C600FFFF000000FFFFFF
        C6C3C6FFFFFFC6C3C60000000000848284C6C3C6FFFFFF00000000FFFF000000
        00FFFFC6C3C600FFFFC6C3C600FFFFC6C3C600FFFFC6C3C600FFFFC6C3C600FF
        FF000000FFFFFFC6C3C6FFFFFF0000000000848284FFFFFFC6C3C6000000FFFF
        FF000000C6C3C600FFFFC6C3C600FFFFC6C3C600FFFFC6C3C600FFFFC6C3C600
        FFFFC6C3C6000000C6C3C6FFFFFFC6C3C60000000000848284C6C3C6FFFFFF00
        000000FFFFFFFFFF000000C6C3C600FFFFC6C3C600FFFFC6C3C600FFFFC6C3C6
        00FFFFC6C3C600FFFFC6C3C6000000C6C3C6FFFFFF0000000000848284FFFFFF
        C6C3C6000000FFFFFF00FFFFFFFFFF000000000000000000000000000000C6C3
        C600FFFFC6C3C600FFFFC6C3C600FFFF000000FFFFFFC6C3C600000000008482
        84C6C3C6FFFFFF00000000FFFFFFFFFF00FFFFFFFFFF00FFFFFFFFFF00FFFFFF
        FFFF000000000000000000000000000000000000FFFFFFC6C3C6FFFFFF000000
        0000848284FFFFFFC6C3C6000000FFFFFF00FFFFFFFFFF00FFFFFFFFFF00FFFF
        FFFFFF00FFFFFFFFFF00FFFFFFFFFF00FFFF000000FFFFFFC6C3C6FFFFFFC6C3
        C60000000000848284C6C3C6FFFFFF00000000FFFFFFFFFF00FFFFFFFFFF00FF
        FFFFFFFF00FFFFFFFFFF00FFFFFFFFFF00FFFFFFFFFF000000C6C3C6FFFFFFC6
        C3C6FFFFFF0000000000848284FFFFFFC6C3C6000000FFFFFF00FFFFFFFFFF00
        FFFFFFFFFF00FFFFFFFFFF00FFFFFFFFFF00FFFFFFFFFF00FFFF000000FFFFFF
        C6C3C6FFFFFFC6C3C60000000000848284C6C3C6FFFFFF00000000FFFFFFFFFF
        00FFFFFFFFFF00FFFF000000000000000000000000000000000000000000FFFF
        FFC6C3C6FFFFFFC6C3C6FFFFFF0000000000848284FFFFFFC6C3C6FFFFFF0000
        00000000000000000000000000FFFFFFC6C3C6FFFFFFC6C3C6FFFFFFC6C3C6FF
        FFFFC6C3C6FFFFFFC6C3C6FFFFFFC6C3C60000000000848284C6C3C6FFFFFFC6
        C3C6FFFFFFC6C3C6FFFFFFC6C3C6FFFFFFC6C3C6FFFFFFC6C3C6FFFFFFC6C3C6
        FFFFFFC6C3C6FFFFFFC6C3C6FFFFFFC6C3C6FFFFFF0000000000848284FFFFFF
        C6C3C6FFFFFFC6C3C6FFFFFFC6C3C6FFFFFFC6C3C6FFFFFFC6C3C6FFFFFFC6C3
        C6FFFFFFC6C3C6FFFFFFC6C3C6FFFFFFC6C3C6FFFFFFC6C3C600000000008482
        8400000000000000000000000000000000000000000000000000000000000000
        0000000000000000000000000000000000000000000000000000000000000000
        0000848284FFFFFF000000FF0000FF0000FF0000FF0000FF0000FF0000FF0000
        FF0000FF0000FF0000FF0000FF0000FF0000FF0000000000FFFFFF000000FFFF
        FF00000000008482848482848482848482848482848482848482848482848482
        8484828484828484828484828484828484828484828484828484828484828484
        82848482848482840000}
      ParentShowHint = False
      ShowHint = True
      OnClick = btnAssocArqRetClick
    end
    object lblArqRet: TLabel
      Left = 6
      Top = 51
      Width = 181
      Height = 13
      Caption = 'Caminho do Arquivo de Retorno'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = [fsBold]
      ParentFont = False
    end
    object lblTipoCobranca: TLabel
      Left = 6
      Top = 8
      Width = 156
      Height = 13
      Caption = 'Tipo de Cobrança Bancária'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = [fsBold]
      ParentFont = False
    end
    object edtArqRet: TEdit
      Left = 6
      Top = 66
      Width = 342
      Height = 21
      Color = clSilver
      Enabled = False
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clNavy
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = [fsBold]
      ParentFont = False
      TabOrder = 1
    end
    object btnAbrirArq: TBitBtn
      Left = 6
      Top = 99
      Width = 99
      Height = 25
      Caption = 'Carregar'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = [fsBold]
      ParentFont = False
      TabOrder = 2
      OnClick = btnAbrirArqClick
      Kind = bkOK
    end
    object btnSair: TBitBtn
      Left = 119
      Top = 99
      Width = 99
      Height = 25
      Caption = 'Cancelar'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = [fsBold]
      ParentFont = False
      TabOrder = 3
      OnClick = btnSairClick
      Kind = bkCancel
    end
    object lkpTipoCobranca: TwwDBLookupCombo
      Left = 6
      Top = 23
      Width = 371
      Height = 21
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = [fsBold]
      DropDownAlignment = taLeftJustify
      Selected.Strings = (
        'DESCRICAO'#9'60'#9'Tipo Cobrança'#9'F')
      LookupTable = cdsModelosCNAB
      LookupField = 'IDMODELOSCNAB'
      ParentFont = False
      TabOrder = 0
      AutoDropDown = True
      ShowButton = True
      AllowClearKey = False
    end
  end
  inherited ivTradutor: TIvExtendedTranslator
    Left = 292
    Top = 65521
    TargetsData = (
      1
      2
      (
        ''
        'Filter'
        0)
      (
        ''
        'Title'
        0))
  end
  object dlgOpenRet: TOpenDialog
    DefaultExt = 'ret'
    Filter = 'RET - Arquivo Bancário|*.ret'
    FilterIndex = 0
    Options = [ofEnableSizing]
    Title = 'Arquivo de Retorno Bancário'
    Left = 244
    Top = 65532
  end
  object cdsModelosCNAB: TCMClientDataSet
    Aggregates = <>
    Params = <>
    Left = 90
    Top = 8
  end
  object sqlTipoCobranca: TCMSqlParams
    ClientDataSet = cdsModelosCNAB
    Left = 194
    Top = 44
  end
end
