inherited frmParamCrachaAux: TfrmParamCrachaAux
  Left = 199
  Top = 182
  BorderIcons = [biSystemMenu, biMinimize]
  BorderStyle = bsToolWindow
  Caption = 'Seleção para Emissão de Crachá'
  ClientHeight = 280
  ClientWidth = 369
  Font.Style = []
  FormStyle = fsNormal
  Visible = False
  PixelsPerInch = 96
  TextHeight = 13
  inherited pnlFundo: TPanel
    Width = 369
    Height = 241
    BorderWidth = 2
    object rgSelecao: TRadioGroup
      Left = 14
      Top = 10
      Width = 341
      Height = 37
      Caption = 'Listar'
      Columns = 2
      ItemIndex = 0
      Items.Strings = (
        'Uma Só Pessoa'
        'A Selecionar')
      TabOrder = 0
      OnClick = rgSelecaoClick
    end
    object dblcFunc: TwwDBLookupCombo
      Left = 14
      Top = 75
      Width = 341
      Height = 21
      DropDownAlignment = taLeftJustify
      Selected.Strings = (
        'NOME'#9'60'#9'NOME')
      LookupTable = qry
      LookupField = 'NOME'
      Style = csDropDownList
      TabOrder = 1
      AutoDropDown = False
      ShowButton = True
      AllowClearKey = False
    end
    object rgImprDescr: TRadioGroup
      Left = 14
      Top = 100
      Width = 341
      Height = 37
      Caption = 'Solicita Nome de Guerra ou Apelido para Impresão'
      Columns = 2
      ItemIndex = 0
      Items.Strings = (
        'Sim'
        'Não')
      ParentShowHint = False
      ShowHint = False
      TabOrder = 2
    end
    object rgCodBarra: TRadioGroup
      Left = 14
      Top = 142
      Width = 341
      Height = 37
      Caption = 'Imprime Código de Barras'
      Columns = 3
      ItemIndex = 1
      Items.Strings = (
        'Com Matrícula'
        'Outro Documento'
        'Não Imprime')
      ParentShowHint = False
      ShowHint = False
      TabOrder = 3
      OnClick = rgCodBarraClick
    end
    object gbxCodBar: TGroupBox
      Left = 14
      Top = 183
      Width = 341
      Height = 48
      Caption = 'Documento Código de Barras'
      TabOrder = 4
      object dblckcmbDocCodBarr: TwwDBLookupCombo
        Left = 10
        Top = 19
        Width = 321
        Height = 21
        DropDownAlignment = taLeftJustify
        Selected.Strings = (
          'NOMEDOCUMENTO'#9'30'#9'NOMEDOCUMENTO'#9'F')
        LookupTable = qryDocCodBarr
        LookupField = 'IDDOCUMENTO'
        Style = csDropDownList
        TabOrder = 0
        AutoDropDown = False
        ShowButton = True
        AllowClearKey = False
      end
    end
    object cbxCargoAltern: TCheckBox
      Left = 14
      Top = 52
      Width = 200
      Height = 17
      Caption = 'Cargo Alternativo para Quem Tiver'
      Checked = True
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -9
      Font.Name = 'MS Sans Serif'
      Font.Style = []
      ParentFont = False
      State = cbChecked
      TabOrder = 5
    end
  end
  inherited Dock971: TDock97
    Top = 241
    Width = 369
    inherited tb97Fundo: TToolbar97
      Left = 121
      DockPos = 216
      inherited sep1: TToolbarSep97
        Left = 162
      end
      object ToolbarSep971: TToolbarSep97 [1]
        Left = 80
        Top = 0
        Blank = True
        SizeHorz = 2
      end
      inherited bbtnSair: TBitBtn
        Left = 82
      end
      inherited bbtnAjuda: TmaHelpBitBtn
        Left = 164
      end
      object bbtnConfirmar: TBitBtn
        Left = 0
        Top = 0
        Width = 80
        Height = 33
        Caption = '&OK'
        Default = True
        ModalResult = 1
        TabOrder = 2
        OnClick = bbtnConfirmarClick
        Glyph.Data = {
          76010000424D7601000000000000760000002800000020000000100000000100
          0400000000000001000000000000000000001000000000000000000000000000
          8000008000000080800080000000800080008080000080808000C0C0C0000000
          FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00888888888888
          8888888888FFFFF8888888888000008888888888F777778FF888888002222200
          88888887788888778F88887222222222088888788888888878F887A228822222
          208887F88FFF888887F887A2FFF8222220888788777FF888878F7A22FFFF8222
          22087F887777FF88887F7A22FFFFF82222087F8877777FF8887F7A22FF8FFF82
          22087F8877F777FF887F7A22FF82FFF822087F8877F8777F887F7A22FF222FF8
          220878F87788877FF87887A2222222FF208887F88888887787F887A222222222
          2088878F888888888788887AA222222208888878FF88888F788888877AAAAA77
          8888888778FFFF77888888888777778888888888877777888888}
        NumGlyphs = 2
      end
    end
  end
  inherited ivTradutor: TIvExtendedTranslator
    Left = 326
    Top = 206
    TargetsData = (
      1
      1
      (
        ''
        'Text'
        0))
  end
  object qry: TwwQuery
    DatabaseName = 'BaseDados'
    ValidateWithMask = True
    Left = 7
    Top = 213
  end
  object qryDocCodBarr: TQuery
    DatabaseName = 'BaseDados'
    SQL.Strings = (
      'SELECT'
      '  IDDOCUMENTO, NOMEDOCUMENTO'
      'FROM'
      '  TIPODOCPESSOA')
    Left = 64
    Top = 212
  end
  object qryParam: TwwQuery
    DatabaseName = 'BaseDados'
    ValidateWithMask = True
    Left = 239
    Top = 45
  end
end
