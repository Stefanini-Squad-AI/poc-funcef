inherited FrmMTApagaItemSCI: TFrmMTApagaItemSCI
  Left = 18
  Top = 91
  HelpContext = 50018
  Caption = 'Exclusão de Itens Pendentes da SCI'
  ClientHeight = 374
  ClientWidth = 739
  PixelsPerInch = 96
  TextHeight = 13
  inherited pnlFundo: TPanel
    Width = 739
    Height = 335
    object Panel1: TPanel
      Left = 5
      Top = 5
      Width = 729
      Height = 108
      Align = alTop
      TabOrder = 0
      object Bevel1: TBevel
        Left = 615
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
      object BtnSelecinar: TSpeedButton
        Left = 625
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
      object BtnLimpar: TSpeedButton
        Left = 625
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
      object dblcSCI: TCMDBLookupCombo
        Left = 16
        Top = 32
        Width = 153
        Height = 21
        DropDownAlignment = taLeftJustify
        Selected.Strings = (
          'NUMSOLCOMPRA'#9'10'#9'Nº da SCI')
        LookupTable = cdsSCICombo
        LookupField = 'NUMSOLCOMPRA'
        Options = [loTitles]
        Style = csDropDownList
        TabOrder = 0
        AutoDropDown = True
        ShowButton = True
        AllowClearKey = True
        ShowMatchText = True
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
        TabOrder = 1
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
        LookupTable = CdsArtigo
        LookupField = 'CODARTIGO'
        Options = [loTitles]
        Style = csDropDownList
        TabOrder = 2
        AutoDropDown = True
        ShowButton = True
        AllowClearKey = True
        ShowMatchText = True
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
        TabOrder = 3
      end
    end
    object GrdItem: TwwDBGrid
      Left = 5
      Top = 143
      Width = 729
      Height = 187
      Selected.Strings = (
        'FLAG'#9'2'#9' '#9'F'
        'NUMSOLCOMPRA'#9'10'#9'Nº da S.C.I.'#9'F'
        'CODARTIGO'#9'14'#9'Código'#9'F'
        'DESCRICAO'#9'35'#9'Descrição'#9'F'
        'QTDEPEDIDA'#9'10'#9'Qtde~Pedida'#9'F'
        'CODMEDIDA'#9'4'#9'Unidade'#9'F'
        'NECESSIDADE'#9'10'#9'Necessidade'#9'F')
      IniAttributes.Delimiter = ';;'
      TitleColor = clBtnFace
      FixedCols = 0
      ShowHorzScrollBar = True
      Align = alClient
      DataSource = dsItem
      MultiSelectOptions = [msoAutoUnselect, msoShiftSelect]
      Options = [dgTitles, dgColumnResize, dgColLines, dgRowLines, dgTabs, dgRowSelect, dgConfirmDelete, dgCancelOnExit, dgWordWrap]
      TabOrder = 1
      TitleAlignment = taLeftJustify
      TitleFont.Charset = DEFAULT_CHARSET
      TitleFont.Color = clWindowText
      TitleFont.Height = -9
      TitleFont.Name = 'MS Sans Serif'
      TitleFont.Style = [fsBold]
      TitleLines = 1
      TitleButtons = False
      UseTFields = False
      OnDblClick = GrdItemDblClick
      IndicatorColor = icBlack
    end
    object plnTitulo: TPanel
      Left = 5
      Top = 113
      Width = 729
      Height = 30
      Align = alTop
      BevelInner = bvRaised
      BevelOuter = bvLowered
      Caption = 'Itens da S.C.I.'
      Color = clGray
      Font.Charset = ANSI_CHARSET
      Font.Color = clWhite
      Font.Height = -16
      Font.Name = 'Arial'
      Font.Style = [fsBold, fsItalic]
      ParentFont = False
      TabOrder = 2
    end
  end
  inherited Dock971: TDock97
    Top = 335
    Width = 739
    object lbBar: TLabel [0]
      Left = 16
      Top = 8
      Width = 80
      Height = 16
      Caption = 'Excluindo...'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -13
      Font.Name = 'MS Sans Serif'
      Font.Style = [fsBold]
      ParentFont = False
      Transparent = True
      Visible = False
    end
    inherited tb97Fundo: TToolbar97
      Left = 491
      DockPos = 573
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
        HelpContext = 50018
      end
      object btnExcluir: TBitBtn
        Left = 0
        Top = 0
        Width = 80
        Height = 33
        Caption = '&Excluir'
        TabOrder = 2
        OnClick = btnExcluirClick
        Glyph.Data = {
          76010000424D7601000000000000760000002800000020000000100000000100
          0400000000000001000000000000000000001000000000000000000000000000
          8000008000000080800080000000800080008080000080808000C0C0C0000000
          FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00888888888888
          88888888888888FF8888888888888778888888888888F77F8888888888800F08
          8888888888F7787F88888888800FFF0888888888F7788878F88888800FFFFFF0
          88888887788888F7F8888887FFFFFCF088888887FFF887878F888811111CCFFF
          08888877777F788F7F8881999991FFCF088887777777F87878F8999999991CFF
          F088777777777F88F78F998F9FF91FFCFF0877FF78877F8788789998FF991CCF
          FFF0777F88777F7888F7999FF8991FFFF77877788F777F88F778998F9FF91FF7
          788877FF7FF778F7788889999991777888888777777787788888889999988888
          8888887777788888888888888888888888888888888888888888}
        NumGlyphs = 2
      end
    end
    object pgBar: TProgressBar
      Left = 96
      Top = 8
      Width = 377
      Height = 20
      Min = 0
      Max = 100
      TabOrder = 1
      Visible = False
    end
  end
  inherited ivTradutor: TIvExtendedTranslator
    Left = 787
    Top = 65523
  end
  object dsItem: TwwDataSource
    AutoEdit = False
    DataSet = CdsItem
    Left = 584
    Top = 112
  end
  object cdsSCICombo: TCMClientDataSet
    Aggregates = <>
    Params = <>
    Left = 144
    Top = 24
  end
  object cdsGrupoProd: TCMClientDataSet
    Aggregates = <>
    Params = <>
    Left = 413
    Top = 21
  end
  object CdsArtigo: TCMClientDataSet
    Aggregates = <>
    Params = <>
    Left = 341
    Top = 77
  end
  object CdsItem: TwwClientDataSet
    Aggregates = <>
    Params = <>
    ValidateWithMask = True
    Left = 493
    Top = 145
  end
end
