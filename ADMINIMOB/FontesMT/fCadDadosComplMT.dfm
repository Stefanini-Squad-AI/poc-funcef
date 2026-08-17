inherited frmCadDadosComplMT: TfrmCadDadosComplMT
  Left = 302
  Top = 148
  Caption = 'frmCadDadosComplMT'
  ClientHeight = 463
  ClientWidth = 693
  PixelsPerInch = 96
  TextHeight = 13
  inherited pnlFundo: TPanel
    Width = 693
    Height = 377
    object pnlArvore: TPanel
      Left = 1
      Top = 1
      Width = 346
      Height = 375
      BevelInner = bvLowered
      TabOrder = 0
      object Panel3: TPanel
        Left = 2
        Top = 2
        Width = 342
        Height = 34
        Align = alTop
        BevelInner = bvLowered
        Color = clGray
        TabOrder = 0
        object LbLDadosComplemento: TLabel
          Left = 61
          Top = 6
          Width = 220
          Height = 22
          Caption = 'Dados Complementares'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWhite
          Font.Height = -19
          Font.Name = 'Courier New'
          Font.Style = [fsBold]
          ParentFont = False
        end
      end
      object treeDadosComplemento: TCMTreeViewMT
        Left = 2
        Top = 36
        Width = 342
        Height = 337
        PodeNavegar = True
        Align = alClient
      end
    end
    object pnlDadosCompl: TPanel
      Left = 345
      Top = 1
      Width = 347
      Height = 375
      Align = alRight
      BevelInner = bvLowered
      TabOrder = 1
      object lblCodigo: TLabel
        Left = 9
        Top = 32
        Width = 40
        Height = 13
        Caption = 'Código'
      end
      object lblDescricao: TLabel
        Left = 114
        Top = 32
        Width = 58
        Height = 13
        Caption = 'Descrição'
        FocusControl = dbedDescricao
      end
      object lblOpcoes: TLabel
        Left = 150
        Top = 152
        Width = 48
        Height = 13
        Caption = 'Opções:'
      end
      object dbedCod: TwwDBEdit
        Left = 9
        Top = 47
        Width = 102
        Height = 21
        DataSource = ds
        TabOrder = 0
        UnboundDataType = wwDefault
        WantReturns = False
        WordWrap = False
      end
      object dbedDescricao: TDBEdit
        Left = 113
        Top = 47
        Width = 224
        Height = 21
        DataField = 'DESCRICAO'
        DataSource = ds
        TabOrder = 1
      end
      object pnAnaSint: TPanel
        Left = 9
        Top = 91
        Width = 328
        Height = 43
        BevelInner = bvLowered
        BevelOuter = bvNone
        TabOrder = 2
        object sbtnAnalitico: TSpeedButton
          Left = 29
          Top = 4
          Width = 130
          Height = 34
          GroupIndex = 1
          Caption = '&Analítico'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'MS Sans Serif'
          Font.Style = [fsBold]
          Glyph.Data = {
            76010000424D7601000000000000760000002800000020000000100000000100
            0400000000000001000000000000000000001000000010000000000000000000
            800000800000008080008000000080008000808000007F7F7F00BFBFBF000000
            FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00555555555555
            5555555FFFFFFFFFF5555550000000000555557777777777F5555550FFFFFFFF
            0555557F5FFFF557F5555550F0000FFF0555557F77775557F5555550FFFFFFFF
            0555557F5FFFFFF7F5555550F000000F0555557F77777757F5555550FFFFFFFF
            0555557F5FFFFFF7F5555550F000000F0555557F77777757F5555550FFFFFFFF
            0555557F5FFF5557F5555550F000FFFF0555557F77755FF7F5555550FFFFF000
            0555557F5FF5777755555550F00FF0F05555557F77557F7555555550FFFFF005
            5555557FFFFF7755555555500000005555555577777775555555555555555555
            5555555555555555555555555555555555555555555555555555}
          NumGlyphs = 2
          ParentFont = False
        end
        object sbtnSintetico: TSpeedButton
          Left = 170
          Top = 4
          Width = 130
          Height = 34
          GroupIndex = 1
          Caption = 'Sin&tético'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'MS Sans Serif'
          Font.Style = [fsBold]
          Glyph.Data = {
            76010000424D7601000000000000760000002800000020000000100000000100
            0400000000000001000000000000000000001000000010000000000000000000
            800000800000008080008000000080008000808000007F7F7F00BFBFBF000000
            FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00555555555555
            5555555555555555555555555555555555555555555555555555555555555555
            555555555555555555555555555555555555555FFFFFFFFFF555550000000000
            55555577777777775F55500B8B8B8B8B05555775F555555575F550F0B8B8B8B8
            B05557F75F555555575F50BF0B8B8B8B8B0557F575FFFFFFFF7F50FBF0000000
            000557F557777777777550BFBFBFBFB0555557F555555557F55550FBFBFBFBF0
            555557F555555FF7555550BFBFBF00055555575F555577755555550BFBF05555
            55555575FFF75555555555700007555555555557777555555555555555555555
            5555555555555555555555555555555555555555555555555555}
          NumGlyphs = 2
          ParentFont = False
        end
      end
      object DBrdgTipoDado: TDBRadioGroup
        Left = 9
        Top = 147
        Width = 125
        Height = 129
        Caption = 'Tipo de Dado:'
        Items.Strings = (
          'Caracter'
          'Numérico'
          'Data'
          'Seleção')
        TabOrder = 3
        Values.Strings = (
          '0'
          '1')
      end
      object dbmOpcoes: TDBMemo
        Left = 148
        Top = 169
        Width = 189
        Height = 107
        TabOrder = 4
      end
    end
  end
  inherited Dock972: TDock97
    Width = 693
  end
  inherited Dock971: TDock97
    Top = 424
    Width = 693
    inherited tb97Fundo: TToolbar97
      Left = 367
    end
    inherited TB97oKCancelar: TToolbar97
      Left = 190
    end
  end
  inherited ivTradutor: TIvExtendedTranslator
    Left = 0
    Top = 434
    TargetsData = (
      1
      2
      (
        ''
        'Items'
        0)
      (
        'TDBMemo'
        'Text'
        0))
  end
  inherited ds: TwwDataSource
    Left = 261
    Top = 14
  end
  inherited ImlPadrao: TImageList
    Left = 28
    Top = 434
  end
  inherited CmeCadastro: TCmEventosCadastro
    Left = 312
    Top = 7
  end
  inherited Cds: TCMClientDataSet
    Left = 252
    Top = 7
  end
  inherited MontaSelect: TMontaSelect
    Left = 376
    Top = 7
  end
end
