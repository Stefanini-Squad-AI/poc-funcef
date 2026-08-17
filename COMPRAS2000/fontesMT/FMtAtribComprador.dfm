inherited FrmMtAtribComprador: TFrmMtAtribComprador
  Left = 219
  Top = 231
  HelpContext = 1130009
  Caption = 'Atribuição de Comprador'
  ClientHeight = 425
  ClientWidth = 736
  PixelsPerInch = 96
  TextHeight = 13
  inherited pnlFundo: TPanel
    Width = 736
    Height = 386
    object Bevel1: TBevel
      Left = 621
      Top = 12
      Width = 108
      Height = 86
      Shape = bsLeftLine
    end
    object Label1: TLabel
      Left = 16
      Top = 16
      Width = 69
      Height = 13
      Caption = 'Nº da S.C.I.'
    end
    object Label3: TLabel
      Left = 16
      Top = 56
      Width = 34
      Height = 13
      Caption = 'Artigo'
    end
    object Label2: TLabel
      Left = 184
      Top = 16
      Width = 107
      Height = 13
      Caption = 'Grupo de Produtos'
    end
    object BtnLimpar: TSpeedButton
      Left = 627
      Top = 55
      Width = 98
      Height = 41
      Caption = '&Limpar'
      Flat = True
      Glyph.Data = {
        66010000424D6601000000000000760000002800000012000000140000000100
        040000000000F000000000000000000000001000000010000000000000000000
        8000008000000080800080000000800080008080000080808000C0C0C0000000
        FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00888888888888
        888888000000888888078888888888000000888880D078888888880000008888
        0DD507888888880000008880DD705078888888000000880DD7DD050788888800
        000080DD7DDDD05078888800000080D7DDDDDD05078888000000807DDDDDDDD0
        607888000000880DDDDDDDDD0607880000008880DDDDDDD7E060780000008888
        0DDDDD7E6E0608000000888880DDD7E6E6E0080000008888880D7E6E6E6E0800
        000088888880E6E6E6E088000000888888880E6E6E08880000008888888880E6
        E0888800000088888888880E0888880000008888888888808888880000008888
        88888888888888000000}
      Margin = 7
      OnClick = BtnLimparClick
    end
    object BtnSelecinar: TSpeedButton
      Left = 627
      Top = 13
      Width = 98
      Height = 41
      Caption = '&Selecionar'
      Flat = True
      Glyph.Data = {
        76010000424D7601000000000000760000002800000020000000100000000100
        0400000000000001000000000000000000001000000010000000000000000000
        80000080000000808000800000008000800080800000C0C0C000808080000000
        FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00777777777887
        777777777777F88F7777777777700F077777777777F8878F77777777700FFF07
        77777777F8877787F77777700FFFFFF077777778877777F8F7777778FFFFFCF0
        77777F78F77FF8787F771778FFCCCFFF07778FF87F88877F8F7711778FFFFFCF
        077788FF8F77FF8787F711178FFCCCFFF077888F8FF88877F87F71110000FFFC
        FF07788888887FF877877710E7E706CFFFF077887777888777F8770E7E7E70FF
        F887778F777778F7F8877707E7E7E0F88777778F777778F88777770E7E7E7087
        7777778F7777788777777707E7E7E07777777787F7777877777777707E7E0777
        777777787FFF8777777777770000777777777777888877777777}
      Margin = 7
      NumGlyphs = 2
      OnClick = BtnSelecinarClick
    end
    object TPanel
      Left = 1
      Top = 104
      Width = 734
      Height = 281
      Align = alBottom
      Anchors = [akLeft, akTop, akRight, akBottom]
      BevelOuter = bvNone
      TabOrder = 0
      object plnBar: TPanel
        Left = 186
        Top = 28
        Width = 48
        Height = 253
        Align = alLeft
        BevelOuter = bvNone
        TabOrder = 0
        object btnAdiciona: TSpeedButton
          Left = 8
          Top = 80
          Width = 35
          Height = 31
          Hint = 'Atribuir ao comprador'
          Flat = True
          Glyph.Data = {
            76030000424D7603000000000000360000002800000011000000100000000100
            1800000000004003000000000000000000000000000000000000C0C0C0C0C0C0
            BEBEB0A1A18F6D70AD6C6EBC6262AF80806F9191806E6E6E696969C0C0C0C0C0
            C0C0C0C0C0C0C0C0C0C0C0C0C000C0C0C08989A57374B35D5ECD5B54D76962C8
            66669D6363A35454CB1F1F3E404039C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0
            C0006262B75B5BDC5148DD7B76BD8197B057DBD5567D764239603A3C62373737
            C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C000292ADC443DE3498FC78C
            E9DF7FFFFB85FFFF5A7B7D25271E7F827AC0C0C0C2C2C2C0C0C0C0C0C0C0C0C0
            C0C0C0C0C0C0C0C0C000C0C0C06D669F8DD4C773FFFF7CF6F888FDFD536B6BC0
            C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C000C0C0
            C0C0C0C033232646838388FFFF60BBBB5C74745F8080517070C0C0C0C2C2C2C0
            C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C000C0C0C04042443934341B34346FEE
            EE80FBFB7DFFFF7FFFFF75FFFF4D6F6FC0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0
            C0C0C0C0C000545454353535494A4A17111116727288FEFE7CF8F87EF9F97EFB
            FB415858C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0004E4E4E3C3E3E
            3F383831515170EDED7FF8F87CFAFA7EFDFD89FFFF4FBBBB517071C0C0C0C0C0
            C0C4C2C5C0C0C0C0C0C0C0C0C0004E4E4E3C3E3E3D363623434382FFFF86FFFF
            7FFFFF81E0E0687575699191C0C0C0C0C0C0C0C0C0008000008000C0C0C0C0C0
            C0004E4E4E3B3B3B4343431F1F1F4365653148486CABAB7EFFFF71D0D049625F
            C0C0C0C0C0C000FF0000FF00008000C0C0C0C0C0C0004E4E4E38383840404041
            41412A23232C272726181870AAAA91FFFF2E4747C0C0C000800000FF0000FF00
            00800000800000800000C0C0C04141413F3F3F3E3E3E4345454446463F404029
            2323243A390E0B0E00FF0000FF0000FF0000FF0000FF0000FF0000800000C4C4
            C45656563636364343433F3F3F3F3F3F4141414142422C2A2705000500FF0000
            FF0000FF0000FF0000FF0000FF00C0C0C000C2C2C2C0C0C04242423535353737
            3736363636363637373738393A474947C0C0C0C0C0C000FF0000FF00008000C0
            C0C0C0C0C000C0C0C0C0C0C0C0C0C0000000000000000000000000000000C0C0
            C0C0C0C0C0C0C0C0C0C000FF0000FF00008000C0C0C0C0C0C000}
          ParentShowHint = False
          ShowHint = True
          OnClick = btnAdicionaClick
        end
        object BtnRemove: TSpeedButton
          Left = 8
          Top = 128
          Width = 35
          Height = 31
          Hint = 'Desatribuir ao comprador'
          Flat = True
          Glyph.Data = {
            36030000424D3603000000000000360000002800000010000000100000000100
            1800000000000003000000000000000000000000000000000000C0C0C0C0C0C0
            BEBEB0A1A18F6D70AD6C6EBC6262AF80806F9191806E6E6E696969C0C0C0C0C0
            C0C0C0C0C0C0C0C0C0C0C0C0C08989A57374B35D5ECD5B54D76962C866669D63
            63A35454CB1F1F3E404039C0C0C0C0C0C0C0C0C0C0C0C0C0C0C06262B75B5BDC
            5148DD7B76BD8197B057DBD5567D764239603A3C62373737C0C0C0C0C0C0C0C0
            C0C0C0C0C0C0C0C0C0C0292ADC443DE3498FC78CE9DF7FFFFB85FFFF5A7B7D25
            271E7F827AC0C0C0C2C2C2C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C06D669F
            8DD4C773FFFF7CF6F888FDFD536B6BC0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0
            C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C033232646838388FFFF60BBBB5C74745F
            8080517070C0C0C0C2C2C2C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0404244
            3934341B34346FEEEE80FBFB7DFFFF7FFFFF75FFFF4D6F6FC0C0C0C0C0C0C0C0
            C0C0C0C0C0C0C0C0C0C0545454353535494A4A17111116727288FEFE7CF8F87E
            F9F97EFBFB415858C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C04E4E4E3C3E3E
            3F383831515170EDED7FF8F87CFAFA7EFDFD89FFFF4FBBBB517071C0C0C0C0C0
            C0C4C2C5C0C0C0C0C0C04E4E4E3C3E3E3D363623434382FFFF86FFFF7FFFFF81
            E0E0687575699191C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C04E4E4E3B3B3B
            4343431F1F1F4365653148486CABAB7EFFFF71D0D049625FC0C0C0C0C0C0C0C0
            C0C0C0C0C0C0C0C0C0C04E4E4E3838384040404141412A23232C272726181870
            AAAA91FFFF2E4747C0C0C0008000008000008000008000008000C0C0C0414141
            3F3F3F3E3E3E4345454446463F4040292323243A390E0B0E00FF0000FF0000FF
            0000FF0000FF00008000C4C4C45656563636364343433F3F3F3F3F3F41414141
            42422C2A2705000500FF0000FF0000FF0000FF0000FF00C0C0C0C2C2C2C0C0C0
            42424235353537373736363636363637373738393A474947C0C0C0C0C0C0C0C0
            C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C000000000000000000000000000
            0000C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0}
          ParentShowHint = False
          ShowHint = True
          OnClick = BtnRemoveClick
        end
      end
      object plnComp: TPanel
        Left = 234
        Top = 28
        Width = 500
        Height = 253
        Align = alClient
        BevelOuter = bvNone
        TabOrder = 1
        object Splitter1: TSplitter
          Left = 0
          Top = 137
          Width = 500
          Height = 7
          Cursor = crVSplit
          Align = alTop
        end
        object Panel2: TPanel
          Left = 0
          Top = 144
          Width = 500
          Height = 26
          Align = alTop
          BevelInner = bvLowered
          Caption = 'Itens já Atribuidos'
          Color = clGray
          Font.Charset = ANSI_CHARSET
          Font.Color = clWhite
          Font.Height = -16
          Font.Name = 'Arial'
          Font.Style = [fsBold, fsItalic]
          ParentFont = False
          TabOrder = 0
        end
        object GrdItem: TwwDBGrid
          Left = 0
          Top = 26
          Width = 500
          Height = 111
          Selected.Strings = (
            'CODARTIGO'#9'14'#9'Código'#9'F'
            'DESCRICAO'#9'35'#9'Descrição'#9'F'
            'NUMSOLCOMPRA'#9'10'#9'Nº da S.C.I.'#9'F'
            'QTDEPEDIDA'#9'10'#9'Qtde~Pedida'#9'F'
            'CODMEDIDA'#9'4'#9'Unidade'#9'F'
            'NECESSIDADE'#9'10'#9'Necessidade'#9'F')
          IniAttributes.Delimiter = ';;'
          TitleColor = clBtnFace
          FixedCols = 0
          ShowHorzScrollBar = True
          Align = alTop
          DataSource = dsItens
          MultiSelectOptions = [msoAutoUnselect, msoShiftSelect]
          Options = [dgTitles, dgColumnResize, dgColLines, dgRowLines, dgTabs, dgRowSelect, dgConfirmDelete, dgCancelOnExit, dgWordWrap, dgMultiSelect]
          TabOrder = 1
          TitleAlignment = taLeftJustify
          TitleFont.Charset = DEFAULT_CHARSET
          TitleFont.Color = clWindowText
          TitleFont.Height = -9
          TitleFont.Name = 'MS Sans Serif'
          TitleFont.Style = [fsBold]
          TitleLines = 1
          TitleButtons = True
          UseTFields = False
          OnTitleButtonClick = GrdItemTitleButtonClick
          IndicatorColor = icBlack
        end
        object Panel3: TPanel
          Left = 0
          Top = 0
          Width = 500
          Height = 26
          Align = alTop
          BevelInner = bvLowered
          Caption = 'Itens não Atribuidos'
          Color = clGray
          Font.Charset = ANSI_CHARSET
          Font.Color = clWhite
          Font.Height = -16
          Font.Name = 'Arial'
          Font.Style = [fsBold, fsItalic]
          ParentFont = False
          TabOrder = 2
        end
        object grdItemAtrib: TwwDBGrid
          Left = 0
          Top = 170
          Width = 500
          Height = 83
          Selected.Strings = (
            'CODARTIGO'#9'14'#9'Código'#9'F'
            'DESCRICAO'#9'35'#9'Descrição'#9'F'
            'NUMSOLCOMPRA'#9'10'#9'Nº da S.C.I.'#9'F'
            'QTDEPEDIDA'#9'10'#9'Qtde~Pedida'#9'F'
            'CODMEDIDA'#9'4'#9'Unidade'#9'F'
            'NECESSIDADE'#9'10'#9'Necessidade'#9'F')
          IniAttributes.Delimiter = ';;'
          TitleColor = clBtnFace
          FixedCols = 0
          ShowHorzScrollBar = True
          Align = alClient
          DataSource = dsItensAtrib
          MultiSelectOptions = [msoAutoUnselect, msoShiftSelect]
          Options = [dgTitles, dgColumnResize, dgColLines, dgRowLines, dgTabs, dgRowSelect, dgConfirmDelete, dgCancelOnExit, dgWordWrap, dgMultiSelect]
          TabOrder = 3
          TitleAlignment = taLeftJustify
          TitleFont.Charset = DEFAULT_CHARSET
          TitleFont.Color = clWindowText
          TitleFont.Height = -9
          TitleFont.Name = 'MS Sans Serif'
          TitleFont.Style = [fsBold]
          TitleLines = 1
          TitleButtons = False
          UseTFields = False
          IndicatorColor = icBlack
        end
      end
      object plnItem: TPanel
        Left = 0
        Top = 28
        Width = 186
        Height = 253
        Align = alLeft
        BevelOuter = bvNone
        Caption = 'plnItem'
        TabOrder = 2
        object GrdComp: TwwDBGrid
          Left = 0
          Top = 0
          Width = 186
          Height = 253
          Selected.Strings = (
            'NOME'#9'20'#9'NOME')
          IniAttributes.Delimiter = ';;'
          TitleColor = clBtnFace
          FixedCols = 0
          ShowHorzScrollBar = True
          Align = alClient
          DataSource = dsComprador
          Options = [dgColumnResize, dgColLines, dgRowLines, dgTabs, dgRowSelect, dgAlwaysShowSelection, dgConfirmDelete, dgCancelOnExit, dgWordWrap]
          TabOrder = 0
          TitleAlignment = taCenter
          TitleFont.Charset = DEFAULT_CHARSET
          TitleFont.Color = clWindowText
          TitleFont.Height = -9
          TitleFont.Name = 'MS Sans Serif'
          TitleFont.Style = [fsBold]
          TitleLines = 2
          TitleButtons = False
          UseTFields = False
          IndicatorColor = icBlack
        end
      end
      object Panel1: TPanel
        Left = 0
        Top = 0
        Width = 734
        Height = 28
        Align = alTop
        Alignment = taLeftJustify
        BevelInner = bvLowered
        Caption = '  Atribuição de Compradores '
        Color = clGray
        Font.Charset = ANSI_CHARSET
        Font.Color = clWhite
        Font.Height = -16
        Font.Name = 'Arial'
        Font.Style = [fsBold, fsItalic]
        ParentFont = False
        TabOrder = 3
      end
    end
    object RgEmpresa: TRadioGroup
      Left = 484
      Top = 14
      Width = 125
      Height = 80
      Caption = ' Pela Empresa '
      ItemIndex = 0
      Items.Strings = (
        'Login'
        'Todas')
      TabOrder = 1
    end
    object dblcGrupo: TCMDBLookupCombo
      Left = 184
      Top = 32
      Width = 289
      Height = 21
      DropDownAlignment = taLeftJustify
      Selected.Strings = (
        'DESCGRUPOPROD'#9'30'#9'Descrição')
      LookupTable = cdsGrupoProd
      LookupField = 'CODGRUPOPROD'
      Options = [loTitles]
      Style = csDropDownList
      TabOrder = 2
      AutoDropDown = True
      ShowButton = True
      AllowClearKey = True
      ShowMatchText = True
    end
    object dblcArt: TwwDBLookupCombo
      Left = 16
      Top = 72
      Width = 457
      Height = 21
      DropDownAlignment = taLeftJustify
      Selected.Strings = (
        'DESCRICAO'#9'50'#9'Descrição'
        'CODARTIGO'#9'14'#9'Código')
      LookupTable = cdsArtigo
      LookupField = 'CODARTIGO'
      Options = [loTitles]
      Style = csDropDownList
      TabOrder = 3
      AutoDropDown = True
      ShowButton = True
      AllowClearKey = True
      ShowMatchText = True
    end
    object dblcSCI: TCMDBLookupCombo
      Left = 16
      Top = 32
      Width = 153
      Height = 21
      DropDownAlignment = taLeftJustify
      Selected.Strings = (
        'NUMSOLCOMPRA'#9'10'#9'Nº da SCI')
      LookupTable = cdsSCI
      LookupField = 'NUMSOLCOMPRA'
      Options = [loTitles]
      Style = csDropDownList
      TabOrder = 4
      AutoDropDown = True
      ShowButton = True
      AllowClearKey = True
      ShowMatchText = True
    end
  end
  inherited Dock971: TDock97
    Top = 386
    Width = 736
    inherited tb97Fundo: TToolbar97
      Left = 568
      DockPos = 581
      inherited bbtnAjuda: TmaHelpBitBtn
        HelpContext = 1130009
      end
    end
  end
  inherited ivTradutor: TIvExtendedTranslator
    Left = 779
    Top = 65523
  end
  object cdsArtigo: TCMClientDataSet
    Aggregates = <>
    Params = <>
    Left = 112
    Top = 71
  end
  object cdsComprador: TCMClientDataSet
    Aggregates = <>
    Params = <>
    Left = 104
    Top = 151
  end
  object cdsSCI: TCMClientDataSet
    Aggregates = <>
    Params = <>
    Left = 168
    Top = 32
  end
  object cdsGrupoProd: TCMClientDataSet
    Aggregates = <>
    Params = <>
    Left = 240
    Top = 24
  end
  object cdsItens: TCMClientDataSet
    Aggregates = <>
    FieldDefs = <>
    IndexDefs = <>
    Params = <>
    StoreDefs = True
    Left = 511
    Top = 160
  end
  object cdsItensAtrib: TCMClientDataSet
    Aggregates = <>
    Params = <>
    Left = 511
    Top = 296
  end
  object dsComprador: TwwDataSource
    AutoEdit = False
    DataSet = cdsComprador
    OnDataChange = dsCompradorDataChange
    Left = 33
    Top = 149
  end
  object dsItensAtrib: TwwDataSource
    AutoEdit = False
    DataSet = cdsItensAtrib
    Left = 457
    Top = 293
  end
  object dsItens: TwwDataSource
    AutoEdit = False
    DataSet = cdsItens
    Left = 472
    Top = 160
  end
end
