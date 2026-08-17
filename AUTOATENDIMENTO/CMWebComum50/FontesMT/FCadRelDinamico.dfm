inherited frmCadRelDinamico: TfrmCadRelDinamico
  Left = 317
  Top = 135
  HelpContext = 4650008
  Caption = 'Cadastro de Relatórios Dinâmicos'
  ClientHeight = 400
  ClientWidth = 596
  OnDestroy = FormDestroy
  PixelsPerInch = 96
  TextHeight = 13
  inherited pnlFundo: TPanel
    Width = 596
    Height = 90
    Align = alTop
    object lblIdRelDinamico: TLabel
      Left = 8
      Top = 8
      Width = 201
      Height = 13
      AutoSize = False
      Caption = 'Código do Relatório Dinâmico:'
      FocusControl = dbedtIdRelDinamico
    end
    object lblDESCRELDINAMICO: TLabel
      Left = 8
      Top = 45
      Width = 233
      Height = 13
      AutoSize = False
      Caption = 'Descrição do Relatório Dinâmico:'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clBlack
      Font.Height = -9
      Font.Name = 'MS Sans Serif'
      Font.Style = [fsBold]
      ParentFont = False
    end
    object dbchkFLGROLLBACK: TDBCheckBox
      Left = 8
      Top = 96
      Width = 577
      Height = 17
      Caption = 
        'Cancelar alterações no banco de dados após cada etapa da simulaç' +
        'ão.'
      DataField = 'FLGROLLBACK'
      DataSource = ds
      TabOrder = 2
      ValueChecked = '1'
      ValueUnchecked = '0'
      Visible = False
    end
    object dbedtIdRelDinamico: TDBEdit
      Left = 9
      Top = 21
      Width = 176
      Height = 21
      Color = clBtnFace
      DataField = 'IDRELDINAMICO'
      DataSource = ds
      ReadOnly = True
      TabOrder = 0
    end
    object dbchkFLGATIVO: TDBCheckBox
      Left = 535
      Top = 23
      Width = 50
      Height = 17
      Caption = 'Ativo'
      DataField = 'FLGATIVO'
      DataSource = ds
      TabOrder = 1
      ValueChecked = '1'
      ValueUnchecked = '0'
    end
    object dbedtDESCRELDINAMICO: TDBEdit
      Left = 8
      Top = 58
      Width = 553
      Height = 21
      DataField = 'DESCRELDINAMICO'
      DataSource = ds
      TabOrder = 3
    end
  end
  inherited Dock972: TDock97
    Width = 596
  end
  inherited Dock971: TDock97
    Top = 361
    Width = 596
    inherited tb97Fundo: TToolbar97
      Left = 424
      DockPos = 455
    end
    inherited TB97oKCancelar: TToolbar97
      Left = 255
      DockPos = 286
    end
  end
  object PageControl: TPageControl [3]
    Left = 8
    Top = 136
    Width = 579
    Height = 217
    ActivePage = tbsQuery
    MultiLine = True
    TabOrder = 3
    object tbsQuery: TTabSheet
      Caption = 'Query Inicial'
      object lblObs: TLabel
        Left = 2
        Top = 213
        Width = 559
        Height = 17
        AutoSize = False
        Caption = 
          '• Para filtrar pelo campo IDPESSOA na query, utilize a palavra-c' +
          'have [IDPESSOA].'
        Font.Charset = ANSI_CHARSET
        Font.Color = clNavy
        Font.Height = -11
        Font.Name = 'Arial'
        Font.Style = [fsBold]
        ParentFont = False
      end
      object dbmemQUERYINICIAL: TDBMemo
        Left = 2
        Top = 3
        Width = 567
        Height = 206
        DataField = 'QUERYINICIAL'
        DataSource = ds
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Height = -13
        Font.Name = 'Courier New'
        Font.Style = []
        ParentFont = False
        ScrollBars = ssBoth
        TabOrder = 0
      end
    end
    object tbsCampos: TTabSheet
      Caption = 'Campos Filtro'
      ImageIndex = 1
      object lbCampos: TListBox
        Left = 2
        Top = 29
        Width = 541
        Height = 197
        DragMode = dmAutomatic
        Font.Charset = ANSI_CHARSET
        Font.Color = clWindowText
        Font.Height = -13
        Font.Name = 'Courier New'
        Font.Style = []
        ItemHeight = 16
        ParentFont = False
        TabOrder = 0
        OnDblClick = lbCamposDblClick
        OnDragDrop = lbCamposDragDrop
        OnDragOver = lbCamposDragOver
      end
      object Panel1: TPanel
        Left = 2
        Top = 1
        Width = 48
        Height = 26
        BevelOuter = bvLowered
        TabOrder = 1
        object spbCamposPlus: TSpeedButton
          Left = 2
          Top = 2
          Width = 21
          Height = 22
          Glyph.Data = {
            9E020000424D9E0200000000000036000000280000000E0000000E0000000100
            18000000000068020000C40E0000C40E00000000000000000000C0C0C0C0C0C0
            C0C0C0C0C0C0C0C0C0C0C0C0808080808080808080C0C0C0C0C0C0C0C0C0C0C0
            C0C0C0C00000C0C0C0C0C0C0C0C0C0C0C0C0C0C0C08000008000008000008080
            80C0C0C0C0C0C0C0C0C0C0C0C0C0C0C00000C0C0C0C0C0C0C0C0C0C0C0C0C0C0
            C0FFFF00FF0000800000808080C0C0C0C0C0C0C0C0C0C0C0C0C0C0C00000C0C0
            C0C0C0C0C0C0C0C0C0C0C0C0C0FFFF00FF0000800000808080C0C0C0C0C0C0C0
            C0C0C0C0C0C0C0C00000C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0FFFF00FF000080
            0000808080C0C0C0C0C0C0C0C0C0C0C0C0C0C0C00000C0C0C080808080808080
            8080808080FFFF00FF0000800000808080808080808080808080808080808080
            0000800000800000800000800000800000FFFF00FF0000800000800000800000
            8000008000008000008080800000FFFF00FF0000FF0000FF0000FF0000FF0000
            FF0000FF0000FF0000FF0000FF0000FF00008000008080800000FFFF00FFFF00
            FFFF00FFFF00FFFF00FFFF00FF0000FFFF00FFFF00FFFF00FFFF00FFFF008000
            00C0C0C00000C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0FFFF00FF00008000008080
            80C0C0C0C0C0C0C0C0C0C0C0C0C0C0C00000C0C0C0C0C0C0C0C0C0C0C0C0C0C0
            C0FFFF00FF0000800000808080C0C0C0C0C0C0C0C0C0C0C0C0C0C0C00000C0C0
            C0C0C0C0C0C0C0C0C0C0C0C0C0FFFF00FF0000800000808080C0C0C0C0C0C0C0
            C0C0C0C0C0C0C0C00000C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0FFFF00FF000080
            0000808080C0C0C0C0C0C0C0C0C0C0C0C0C0C0C00000C0C0C0C0C0C0C0C0C0C0
            C0C0C0C0C0FFFF00FFFF00800000C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0
            0000}
          OnClick = spbCamposPlusClick
        end
        object spbCamposMinus: TSpeedButton
          Left = 24
          Top = 2
          Width = 21
          Height = 22
          Glyph.Data = {
            9E020000424D9E0200000000000036000000280000000E0000000E0000000100
            18000000000068020000C40E0000C40E00000000000000000000C0C0C0C0C0C0
            C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0
            C0C0C0C00000C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0
            C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C00000C0C0C0C0C0C0C0C0C0C0C0C0C0C0
            C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C00000C0C0
            C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0
            C0C0C0C0C0C0C0C00000C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0
            C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C00000C0C0C0C0C0C080808080
            8080808080808080808080808080808080808080808080808080808080C0C0C0
            0000C0C0C0404000404000404000404000404000404000404000404000404000
            404000404000808080C0C0C00000C0C0C000FF00008000008000008000008000
            008000008000008000008000008000404000808080C0C0C00000C0C0C000FF00
            00FF0000FF0000FF0000FF0000FF0000FF0000FF0000FF0000FF00404000C0C0
            C0C0C0C00000C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0
            C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C00000C0C0C0C0C0C0C0C0C0C0C0C0C0C0
            C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C00000C0C0
            C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0
            C0C0C0C0C0C0C0C00000C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0
            C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C00000C0C0C0C0C0C0C0C0C0C0
            C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0
            0000}
          OnClick = spbCamposMinusClick
        end
      end
      object Panel2: TPanel
        Left = 544
        Top = 104
        Width = 25
        Height = 49
        BevelOuter = bvLowered
        TabOrder = 2
        object spbCamposUp: TSpeedButton
          Left = 2
          Top = 2
          Width = 21
          Height = 22
          Glyph.Data = {
            9E020000424D9E0200000000000036000000280000000E0000000E0000000100
            18000000000068020000C40E0000C40E00000000000000000000C0C0C0C0C0C0
            C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0
            C0C0C0C00000C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0
            C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C00000C0C0C0C0C0C0C0C0C0C0C0C0C0C0
            C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C00000C0C0
            C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0
            C0C0C0C0C0C0C0C00000C0C0C0C0C0C0C0C0C080808080808080808080808080
            8080808080808080808080808080C0C0C0C0C0C00000C0C0C0C0C0C000008000
            0080000080000080000080000080000080000080000080000080C0C0C0C0C0C0
            0000C0C0C0C0C0C0C0C0C07575FF0000FF0000FF0000FF0000FF0000FF0000FF
            000080C0C0C0C0C0C0C0C0C00000C0C0C0C0C0C0C0C0C0C0C0C07575FF0000FF
            0000FF0000FF0000FF000080C0C0C0C0C0C0C0C0C0C0C0C00000C0C0C0C0C0C0
            C0C0C0C0C0C0C0C0C07575FF0000FF0000FF000080C0C0C0C0C0C0C0C0C0C0C0
            C0C0C0C00000C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C07575FF7575FFC0C0
            C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C00000C0C0C0C0C0C0C0C0C0C0C0C0C0C0
            C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C00000C0C0
            C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0
            C0C0C0C0C0C0C0C00000C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0
            C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C00000C0C0C0C0C0C0C0C0C0C0
            C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0
            0000}
          OnClick = spbCamposUpClick
        end
        object spbCamposDown: TSpeedButton
          Left = 2
          Top = 25
          Width = 21
          Height = 22
          Glyph.Data = {
            9E020000424D9E0200000000000036000000280000000E0000000E0000000100
            18000000000068020000C40E0000C40E00000000000000000000C0C0C0C0C0C0
            C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0
            C0C0C0C00000C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0
            C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C00000C0C0C0C0C0C0C0C0C0C0C0C0C0C0
            C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C00000C0C0
            C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0808080C0C0C0C0C0C0C0C0C0C0
            C0C0C0C0C0C0C0C00000C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C000008000
            0080808080C0C0C0C0C0C0C0C0C0C0C0C0C0C0C00000C0C0C0C0C0C0C0C0C0C0
            C0C0C0C0C00000800000FF0000FF7575FF808080C0C0C0C0C0C0C0C0C0C0C0C0
            0000C0C0C0C0C0C0C0C0C0C0C0C00000800000FF0000FF0000FF0000FF7575FF
            808080C0C0C0C0C0C0C0C0C00000C0C0C0C0C0C0C0C0C00000800000FF0000FF
            0000FF0000FF0000FF0000FF7575FF808080C0C0C0C0C0C00000C0C0C0C0C0C0
            7575FF7575FF7575FF7575FF7575FF7575FF7575FF7575FF7575FF7575FF8080
            80C0C0C00000C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0
            C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C00000C0C0C0C0C0C0C0C0C0C0C0C0C0C0
            C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C00000C0C0
            C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0
            C0C0C0C0C0C0C0C00000C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0
            C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C00000C0C0C0C0C0C0C0C0C0C0
            C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0
            0000}
          OnClick = spbCamposDownClick
        end
      end
    end
    object tbsDemonstrativo: TTabSheet
      Caption = 'Demonstrativo'
      ImageIndex = 3
      object pnlHTML: TPanel
        Left = 2
        Top = 128
        Width = 567
        Height = 57
        BevelOuter = bvNone
        TabOrder = 0
        Visible = False
        object lblHTMLFile: TLabel
          Left = 8
          Top = 4
          Width = 86
          Height = 13
          AutoSize = False
          Caption = 'Arquivo HTML:'
        end
        object btnHTMLFile: TSpeedButton
          Left = 538
          Top = 20
          Width = 23
          Height = 21
          Glyph.Data = {
            76010000424D7601000000000000760000002800000020000000100000000100
            04000000000000010000120B0000120B00001000000000000000000000000000
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
          OnClick = btnHTMLFileClick
        end
        object dbedtHTMLFile: TDBEdit
          Left = 8
          Top = 20
          Width = 529
          Height = 21
          DataField = 'HTMLDEMONSTRA'
          DataSource = ds
          TabOrder = 0
        end
      end
      object pnlGerador: TPanel
        Left = 2
        Top = 128
        Width = 567
        Height = 57
        BevelOuter = bvNone
        TabOrder = 1
        Visible = False
        object lblReport: TLabel
          Left = 8
          Top = 4
          Width = 85
          Height = 13
          AutoSize = False
          Caption = 'Template:'
        end
        object btnReport: TSpeedButton
          Left = 538
          Top = 20
          Width = 23
          Height = 22
          Glyph.Data = {
            0E030000424D0E030000000000003600000028000000110000000E0000000100
            180000000000D8020000C40E0000C40E00000000000000000000FFFFFFFFFFFF
            FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
            FFFFFFFFFFFFFFFFFFFFFFFFFF00FFFFFF000000636363212121000000000000
            FFFFFFFFFFFFFFFFFFFFFFFFFFFFFF000000636363212121000000000000FFFF
            FF00FFFFFF000000C6C6C6424242000000000000FFFFFFFFFFFFFFFFFFFFFFFF
            FFFFFF000000C6C6C6424242000000000000FFFFFF00FFFFFF00000063636321
            2121000000000000000000000000FFFFFF000000000000000000636363212121
            000000000000FFFFFF00FFFFFF00000063636300000000000000000000000000
            0000FFFFFF000000313131313131000000000000000000000000FFFFFF00FFFF
            FF000000C6C6C642424200000000000000000031313100000000000063636363
            6363424242000000000000000000FFFFFF00FFFFFF000000C6C6C64242420000
            0000000000000063636300000000000063636363636342424200000000000000
            0000FFFFFF00FFFFFF0000006363634242420000000000000000003131310000
            00000000313131313131424242000000000000000000FFFFFF00FFFFFFFFFFFF
            0000002121210000000000000000000000000000000000000000000000002121
            21000000000000000000FFFFFF00FFFFFFFFFFFFFFFFFF000000636363525252
            000000000000FFFFFF000000636363525252000000000000FFFFFFFFFFFFFFFF
            FF00FFFFFFFFFFFFFFFFFF000000000000000000000000000000FFFFFF000000
            000000000000000000000000FFFFFFFFFFFFFFFFFF00FFFFFFFFFFFFFFFFFFFF
            FFFF424242424242000000000000FFFFFFFFFFFF424242424242000000000000
            FFFFFFFFFFFFFFFFFF00FFFFFFFFFFFFFFFFFFFFFFFF21212121212100000000
            0000FFFFFFFFFFFF212121212121000000000000FFFFFFFFFFFFFFFFFF00FFFF
            FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
            FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF00}
          OnClick = btnReportClick
        end
        object edtReport: TEdit
          Left = 8
          Top = 20
          Width = 529
          Height = 21
          Color = clBtnFace
          ReadOnly = True
          TabOrder = 0
        end
      end
      object rgrpFlgReportType: TRadioGroup
        Left = 8
        Top = 8
        Width = 185
        Height = 105
        Caption = 'Origem do Demonstrativo'
        Items.Strings = (
          'Nenhum'
          'HTML'
          'Gerador de Relatórios')
        TabOrder = 2
        OnClick = rgrpFlgReportTypeClick
      end
    end
  end
  inherited ivTradutor: TIvExtendedTranslator
    Left = 426
    Top = 7
    TargetsData = (
      1
      2
      (
        'TDBMemo'
        'Text'
        0)
      (
        'TMemo'
        'Text'
        0))
  end
  inherited ds: TwwDataSource
    Left = 326
    Top = 7
  end
  inherited ImlPadrao: TImageList
    Left = 392
    Top = 7
  end
  inherited CmeCadastro: TCmEventosCadastro
    OnFind = CmeCadastroFind
    ApplyInsert = CmeCadastroApplyInsert
    ApplyEdit = CmeCadastroApplyEdit
    ApplyDelete = CmeCadastroApplyDelete
    Left = 280
    Top = 7
  end
  inherited Cds: TCMClientDataSet
    Left = 356
    Top = 7
    object CdsIDRELDINAMICO: TFloatField
      FieldName = 'IDRELDINAMICO'
    end
    object CdsDESCRELDINAMICO: TStringField
      FieldName = 'DESCRELDINAMICO'
      Size = 80
    end
    object CdsFLGATIVO: TFloatField
      FieldName = 'FLGATIVO'
    end
    object CdsQUERYINICIAL: TBlobField
      FieldName = 'QUERYINICIAL'
      BlobType = ftBlob
      Size = 1
    end
    object CdsFLGROLLBACK: TFloatField
      FieldName = 'FLGROLLBACK'
    end
    object CdsFLGTIPODEMONSTRA: TStringField
      FieldName = 'FLGTIPODEMONSTRA'
      Size = 1
    end
    object CdsHTMLDEMONSTRA: TStringField
      DisplayWidth = 250
      FieldName = 'HTMLDEMONSTRA'
      Size = 250
    end
    object CdsIDREPORTS: TFloatField
      FieldName = 'IDREPORTS'
    end
    object CdsORIGEMCM: TFloatField
      FieldName = 'ORIGEMCM'
    end
  end
  inherited MontaSelect: TMontaSelect
    Caption = 'Seleciona Relatório Dinâmico'
    Colunas.Strings = (
      'RELDINAMICO.IDRELDINAMICO'
      'RELDINAMICO.DESCRELDINAMICO'
      'decode( RELDINAMICO.FLGATIVO, 1, '#39'Sim'#39', '#39'Não'#39')')
    TipodeDado.Strings = (
      'N'
      'C'
      'C')
    Descricao.Strings = (
      'Identificador do Relatório'
      'Descrição do Relatório'
      'Ativo')
    SensivelACaixa.Strings = (
      'N'
      'N'
      'N')
    Tabelas.Strings = (
      'RELDINAMICO')
    CamposChave.Strings = (
      'RELDINAMICO.IDRELDINAMICO'
      'RELDINAMICO.DESCRELDINAMICO')
    Mascaras.Strings = (
      ''
      ''
      '')
    Larguras.Strings = (
      '10'
      '80'
      '10')
    OperComparador.Strings = (
      '-1'
      '-1'
      '-1')
    LookupSQL.Strings = (
      ''
      ''
      '')
    LookupCampoChave.Strings = (
      ''
      ''
      '')
    LookupCampoExibe.Strings = (
      ''
      ''
      '')
    Left = 552
    Top = 7
  end
  object msInput: TMontaSelect
    Template.IdConsulta = 0
    Caption = 'Seleciona Campo do Relatório Dinâmico'
    Colunas.Strings = (
      'INPUTSIMULABENEF.IDINPUT'
      'INPUTSIMULABENEF.TITULO'
      'INPUTSIMULABENEF.NOMEPARAREGRA'
      
        'DECODE( INPUTSIMULABENEF.TIPODADO, '#39'D'#39', '#39'Data'#39', '#39'N'#39', '#39'Número'#39', '#39 +
        'T'#39',  '#39'Texto'#39', '#39#39' )'
      
        'DECODE( INPUTSIMULABENEF.ORIGEMDADO, '#39'C'#39', '#39'Campo de Query'#39', '#39'R'#39',' +
        ' '#39'Resultado de Regra'#39', '#39'V'#39', '#39'Valor Default'#39', '#39#39' )'
      
        'DECODE( INPUTSIMULABENEF.FLGPODEALTERAR, '#39'1'#39', '#39'S'#39', '#39'0'#39', '#39'N'#39', '#39#39' ' +
        ')'
      'DECODE( INPUTSIMULABENEF.FLGATIVO, '#39'1'#39', '#39'S'#39', '#39'0'#39', '#39'N'#39', '#39#39' )')
    TipodeDado.Strings = (
      'N'
      'C'
      'C'
      'C'
      'C'
      'C'
      'C')
    Descricao.Strings = (
      'Id. Input'
      'Título'
      'Nome para Regra'
      'Tipo de Dado'
      'Origem do Dado'
      'Pode alterar'
      'Ativo')
    SensivelACaixa.Strings = (
      'N'
      'N'
      'N'
      'N'
      'N'
      'N'
      'N')
    Tabelas.Strings = (
      'INPUTSIMULABENEF')
    CamposChave.Strings = (
      'INPUTSIMULABENEF.IDINPUT'
      'INPUTSIMULABENEF.TITULO')
    Mascaras.Strings = (
      ''
      ''
      ''
      ''
      ''
      ''
      '')
    Larguras.Strings = (
      '10'
      '60'
      '20'
      '1'
      '1'
      '1'
      '1')
    OperComparador.Strings = (
      '-1'
      '-1'
      '-1'
      '-1'
      '-1'
      '-1'
      '-1')
    DataBaseName = 'BaseDados'
    RepeteConsulta = False
    UsaDistinct = False
    SalvaConsulta = False
    ExibePergunta = True
    MultiSelect = False
    LookupSQL.Strings = (
      ''
      ''
      ''
      ''
      ''
      ''
      '')
    LookupCampoChave.Strings = (
      ''
      ''
      ''
      ''
      ''
      ''
      '')
    LookupCampoExibe.Strings = (
      ''
      ''
      ''
      ''
      ''
      ''
      '')
    Left = 519
    Top = 9
  end
  object cdsRelDinamicoXInput: TCMClientDataSet
    Aggregates = <>
    Params = <>
    Left = 472
    Top = 7
    object cdsRelDinamicoXInputIDRELDINAMICO: TFloatField
      FieldName = 'IDRELDINAMICO'
    end
    object cdsRelDinamicoXInputIDINPUT: TFloatField
      FieldName = 'IDINPUT'
    end
    object cdsRelDinamicoXInputORDEM: TFloatField
      FieldName = 'ORDEM'
    end
  end
  object msReport: TMontaSelect
    Template.IdConsulta = 0
    Caption = 'Seleciona'
    Colunas.Strings = (
      'REPORTS.NAME'
      'REPORTS.IDREPORTS'
      'REPORTS.ORIGEMCM')
    TipodeDado.Strings = (
      'C'
      'N'
      'N')
    Descricao.Strings = (
      'Nome do Relatório'
      'Id. Reports'
      'Origem CM')
    SensivelACaixa.Strings = (
      'N'
      'N'
      'N')
    Tabelas.Strings = (
      'REPORTS')
    CamposChave.Strings = (
      'REPORTS.NAME'
      'REPORTS.IDREPORTS'
      'REPORTS.ORIGEMCM')
    Mascaras.Strings = (
      ''
      ''
      '')
    Larguras.Strings = (
      '100'
      '10'
      '10')
    DataBaseName = 'BaseDados'
    RepeteConsulta = False
    UsaDistinct = False
    SalvaConsulta = False
    ExibePergunta = True
    MultiSelect = False
    Left = 504
    Top = 264
  end
  object dlgHTMLFile: TOpenDialog
    DefaultExt = '*.htm; *.html'
    Filter = 
      'Arquivos HTML|*.htm; *.html|Arquivos Texto|*.txt|Todos os arquiv' +
      'os|*.*'
    Left = 464
    Top = 264
  end
end
