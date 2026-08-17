inherited frmCadInputSimulaBenef: TfrmCadInputSimulaBenef
  Left = 47
  Top = 149
  HelpContext = 4650009
  Caption = 'Cadastro de Campo da Simulação de Benefício'
  ClientHeight = 472
  ClientWidth = 731
  OnDestroy = FormDestroy
  PixelsPerInch = 96
  TextHeight = 13
  inherited pnlFundo: TPanel
    Width = 731
    Height = 386
    Caption = 'd'
    object lblIdInput: TLabel
      Left = 9
      Top = 14
      Width = 109
      Height = 13
      Alignment = taRightJustify
      AutoSize = False
      Caption = 'Código do Campo:'
      FocusControl = dbedtIdInput
    end
    object lblTitulo: TLabel
      Left = 9
      Top = 46
      Width = 109
      Height = 13
      Alignment = taRightJustify
      AutoSize = False
      Caption = 'Título:'
      FocusControl = dbedtTitulo
    end
    object lblNomeParaRegra: TLabel
      Left = 9
      Top = 78
      Width = 109
      Height = 13
      Alignment = taRightJustify
      AutoSize = False
      Caption = 'Nome para Regra:'
      FocusControl = dbedtNomeParaRegra
    end
    object lblTipoDado: TLabel
      Left = 297
      Top = 78
      Width = 83
      Height = 13
      Alignment = taRightJustify
      AutoSize = False
      Caption = 'Tipo de Dado:'
      FocusControl = dbedtNomeParaRegra
    end
    object lblORIGEMDADO: TLabel
      Left = 18
      Top = 110
      Width = 99
      Height = 13
      Alignment = taRightJustify
      AutoSize = False
      Caption = 'Origem do Dado:'
      FocusControl = dbedtNomeParaRegra
    end
    object lblFormato: TLabel
      Left = 297
      Top = 110
      Width = 82
      Height = 13
      Alignment = taRightJustify
      AutoSize = False
      Caption = 'Formato:'
      FocusControl = dbedtFormato
    end
    object spbFormato: TSpeedButton
      Left = 497
      Top = 108
      Width = 23
      Height = 22
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clBlack
      Font.Height = -9
      Font.Name = 'MS Sans Serif'
      Font.Style = [fsBold]
      Glyph.Data = {
        76010000424D7601000000000000760000002800000020000000100000000100
        0400000000000001000000000000000000001000000000000000000000000000
        8000008000000080800080000000800080008080000080808000C0C0C0000000
        FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00888888888888
        8888888888FFFFF8888888888000008888888888F777778FF888888004444400
        888888877888F8778F888874447F7444088888788887FF8878F8874444FFF444
        408887F88877788887F88744447F74444088878888878888878F7C4444444444
        44087F888888F888887F7C44444F844444087F888887F888887F7C44444F8444
        44087F8888878FF8887F7C444448FF4444087F888FF877FF887F7C44FF448FF4
        440878F877F8877F887887C4FF848FF4408887F877FFF77887F887C44FFFFF84
        4088878F877777888788887CC4FFF44408888878FF77788F788888877CCCCC77
        8888888778FFFF77888888888777778888888888877777888888}
      NumGlyphs = 2
      ParentFont = False
      OnClick = spbFormatoClick
    end
    object dbedtIdInput: TDBEdit
      Left = 122
      Top = 11
      Width = 176
      Height = 21
      Color = clBtnFace
      DataField = 'IDINPUT'
      DataSource = ds
      ReadOnly = True
      TabOrder = 0
    end
    object dbedtTitulo: TDBEdit
      Left = 122
      Top = 44
      Width = 596
      Height = 21
      DataField = 'TITULO'
      DataSource = ds
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clNavy
      Font.Height = -9
      Font.Name = 'MS Sans Serif'
      Font.Style = [fsBold]
      ParentFont = False
      TabOrder = 3
    end
    object dbedtNomeParaRegra: TDBEdit
      Left = 122
      Top = 76
      Width = 160
      Height = 21
      CharCase = ecUpperCase
      DataField = 'NOMEPARAREGRA'
      DataSource = ds
      TabOrder = 4
    end
    object cmbTIPODADO: TComboBox
      Left = 385
      Top = 76
      Width = 137
      Height = 21
      Style = csDropDownList
      ItemHeight = 13
      TabOrder = 5
      OnClick = cmbTIPODADOClick
      Items.Strings = (
        'Data'
        'Número'
        'Texto'
        'Lista')
    end
    object dbchkFLGPODEALTERAR: TDBCheckBox
      Left = 122
      Top = 139
      Width = 129
      Height = 17
      Caption = 'Pode ser alterado'
      DataField = 'FLGPODEALTERAR'
      DataSource = ds
      TabOrder = 8
      ValueChecked = '1'
      ValueUnchecked = '0'
    end
    object grpPreenchimento: TGroupBox
      Left = 121
      Top = 165
      Width = 601
      Height = 103
      Caption = 'Preenchimento'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clNavy
      Font.Height = -9
      Font.Name = 'MS Sans Serif'
      Font.Style = [fsBold]
      ParentFont = False
      TabOrder = 11
      object pnlDefault: TPanel
        Left = 2
        Top = 15
        Width = 597
        Height = 86
        Align = alClient
        BevelOuter = bvNone
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Height = -9
        Font.Name = 'MS Sans Serif'
        Font.Style = [fsBold]
        ParentFont = False
        TabOrder = 1
        object lblVALORDEFAULT: TLabel
          Left = 6
          Top = 3
          Width = 109
          Height = 13
          Alignment = taRightJustify
          AutoSize = False
          Caption = 'Conteúdo Fixo:'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -9
          Font.Name = 'MS Sans Serif'
          Font.Style = [fsBold]
          ParentFont = False
        end
        object dbedtVALORDEFAULT: TDBEdit
          Left = 120
          Top = 0
          Width = 471
          Height = 21
          DataField = 'VALORDEFAULT'
          DataSource = ds
          TabOrder = 0
        end
      end
      object pnlQueryPreenche: TPanel
        Left = 2
        Top = 15
        Width = 597
        Height = 86
        Align = alClient
        BevelOuter = bvNone
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Height = -9
        Font.Name = 'MS Sans Serif'
        Font.Style = [fsBold]
        ParentFont = False
        TabOrder = 0
        object lblQUERYPREENCHE: TLabel
          Left = 6
          Top = 31
          Width = 109
          Height = 13
          Alignment = taRightJustify
          AutoSize = False
          Caption = 'Query de Entrada:'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -9
          Font.Name = 'MS Sans Serif'
          Font.Style = [fsBold]
          ParentFont = False
        end
        object pnlRegra: TPanel
          Left = 0
          Top = 0
          Width = 433
          Height = 23
          BevelOuter = bvNone
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -9
          Font.Name = 'MS Sans Serif'
          Font.Style = [fsBold]
          ParentFont = False
          TabOrder = 0
          object lblIDREGRAPREENCHE: TLabel
            Left = 6
            Top = 3
            Width = 109
            Height = 13
            Alignment = taRightJustify
            AutoSize = False
            Caption = 'Regra:'
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clBlack
            Font.Height = -9
            Font.Name = 'MS Sans Serif'
            Font.Style = [fsBold]
            ParentFont = False
          end
          object spbRegraPreenche: TSpeedButton
            Left = 385
            Top = 1
            Width = 23
            Height = 22
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clBlack
            Font.Height = -9
            Font.Name = 'MS Sans Serif'
            Font.Style = [fsBold]
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
            ParentFont = False
            OnClick = spbRegraPreencheClick
          end
          object spbLimpaPreenche: TSpeedButton
            Left = 408
            Top = 1
            Width = 22
            Height = 22
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clBlack
            Font.Height = -9
            Font.Name = 'MS Sans Serif'
            Font.Style = [fsBold]
            Glyph.Data = {
              76010000424D7601000000000000760000002800000020000000100000000100
              04000000000000010000120B0000120B00001000000000000000000000000000
              800000800000008080008000000080008000808000007F7F7F00BFBFBF000000
              FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00500005000555
              555557777F777555F55500000000555055557777777755F75555005500055055
              555577F5777F57555555005550055555555577FF577F5FF55555500550050055
              5555577FF77577FF555555005050110555555577F757777FF555555505099910
              555555FF75777777FF555005550999910555577F5F77777775F5500505509990
              3055577F75F77777575F55005055090B030555775755777575755555555550B0
              B03055555F555757575755550555550B0B335555755555757555555555555550
              BBB35555F55555575F555550555555550BBB55575555555575F5555555555555
              50BB555555555555575F555555555555550B5555555555555575}
            NumGlyphs = 2
            ParentFont = False
            OnClick = spbLimpaPreencheClick
          end
          object edtNOMEREGRAPreenche: TEdit
            Left = 118
            Top = 0
            Width = 267
            Height = 21
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clBlack
            Font.Height = -9
            Font.Name = 'MS Sans Serif'
            Font.Style = [fsBold]
            ParentFont = False
            ReadOnly = True
            TabOrder = 0
          end
        end
        object dbchkFLGQUERYPREENCHE: TDBCheckBox
          Left = 454
          Top = 3
          Width = 139
          Height = 17
          Caption = 'Utiliza query própria'
          DataField = 'FLGQUERYPREENCHE'
          DataSource = ds
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -9
          Font.Name = 'MS Sans Serif'
          Font.Style = [fsBold]
          ParentFont = False
          TabOrder = 2
          ValueChecked = '1'
          ValueUnchecked = '0'
          OnClick = dbchkFLGQUERYPREENCHEClick
        end
        object dbmemQUERYPREENCHE: TDBMemo
          Left = 118
          Top = 27
          Width = 473
          Height = 56
          DataField = 'QUERYPREENCHE'
          DataSource = ds
          Font.Charset = ANSI_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Courier New'
          Font.Style = []
          ParentFont = False
          ScrollBars = ssVertical
          TabOrder = 3
        end
        object pnlCampo: TPanel
          Left = 0
          Top = 0
          Width = 433
          Height = 23
          BevelOuter = bvNone
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -9
          Font.Name = 'MS Sans Serif'
          Font.Style = [fsBold]
          ParentFont = False
          TabOrder = 1
          object lblCAMPO: TLabel
            Left = 32
            Top = 2
            Width = 83
            Height = 13
            Alignment = taRightJustify
            AutoSize = False
            Caption = 'Campo:'
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clBlack
            Font.Height = -9
            Font.Name = 'MS Sans Serif'
            Font.Style = [fsBold]
            ParentFont = False
          end
          object dbedtCAMPO: TDBEdit
            Left = 118
            Top = 0
            Width = 313
            Height = 21
            CharCase = ecUpperCase
            DataField = 'CAMPO'
            DataSource = ds
            TabOrder = 0
          end
        end
      end
    end
    object grpValidacao: TGroupBox
      Left = 121
      Top = 270
      Width = 601
      Height = 106
      Caption = 'Validação'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clNavy
      Font.Height = -9
      Font.Name = 'MS Sans Serif'
      Font.Style = [fsBold]
      ParentFont = False
      TabOrder = 12
      object lblIDREGRAVALIDA: TLabel
        Left = 8
        Top = 18
        Width = 109
        Height = 13
        Alignment = taRightJustify
        AutoSize = False
        Caption = 'Regra:'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Height = -9
        Font.Name = 'MS Sans Serif'
        Font.Style = [fsBold]
        ParentFont = False
      end
      object lblQUERYVALIDA: TLabel
        Left = 8
        Top = 42
        Width = 109
        Height = 13
        Alignment = taRightJustify
        AutoSize = False
        Caption = 'Query de Entrada:'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Height = -9
        Font.Name = 'MS Sans Serif'
        Font.Style = [fsBold]
        ParentFont = False
      end
      object spbRegraValida: TSpeedButton
        Left = 385
        Top = 16
        Width = 23
        Height = 22
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Height = -9
        Font.Name = 'MS Sans Serif'
        Font.Style = [fsBold]
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
        ParentFont = False
        OnClick = spbRegraValidaClick
      end
      object spbLimpaValida: TSpeedButton
        Left = 408
        Top = 16
        Width = 22
        Height = 22
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Height = -9
        Font.Name = 'MS Sans Serif'
        Font.Style = [fsBold]
        Glyph.Data = {
          76010000424D7601000000000000760000002800000020000000100000000100
          04000000000000010000120B0000120B00001000000000000000000000000000
          800000800000008080008000000080008000808000007F7F7F00BFBFBF000000
          FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00500005000555
          555557777F777555F55500000000555055557777777755F75555005500055055
          555577F5777F57555555005550055555555577FF577F5FF55555500550050055
          5555577FF77577FF555555005050110555555577F757777FF555555505099910
          555555FF75777777FF555005550999910555577F5F77777775F5500505509990
          3055577F75F77777575F55005055090B030555775755777575755555555550B0
          B03055555F555757575755550555550B0B335555755555757555555555555550
          BBB35555F55555575F555550555555550BBB55575555555575F5555555555555
          50BB555555555555575F555555555555550B5555555555555575}
        NumGlyphs = 2
        ParentFont = False
        OnClick = spbLimpaValidaClick
      end
      object dbchkFLGQUERYVALIDA: TDBCheckBox
        Left = 456
        Top = 18
        Width = 137
        Height = 17
        Caption = 'Utiliza query própria'
        DataField = 'FLGQUERYVALIDA'
        DataSource = ds
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Height = -9
        Font.Name = 'MS Sans Serif'
        Font.Style = [fsBold]
        ParentFont = False
        TabOrder = 1
        ValueChecked = '1'
        ValueUnchecked = '0'
        OnClick = dbchkFLGQUERYVALIDAClick
      end
      object edtNOMEREGRAValida: TEdit
        Left = 120
        Top = 15
        Width = 265
        Height = 21
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Height = -9
        Font.Name = 'MS Sans Serif'
        Font.Style = [fsBold]
        ParentFont = False
        ReadOnly = True
        TabOrder = 0
      end
      object dbmemQUERYVALIDA: TDBMemo
        Left = 120
        Top = 42
        Width = 473
        Height = 56
        DataField = 'QUERYVALIDA'
        DataSource = ds
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Height = -13
        Font.Name = 'Courier New'
        Font.Style = []
        ParentFont = False
        ScrollBars = ssVertical
        TabOrder = 2
      end
    end
    object cmbORIGEMDADO: TComboBox
      Left = 122
      Top = 107
      Width = 160
      Height = 21
      Style = csDropDownList
      ItemHeight = 13
      TabOrder = 6
      OnClick = cmbORIGEMDADOClick
      Items.Strings = (
        ''
        'Campo de Query'
        'Resultado de Regra'
        'Conteúdo Fixo')
    end
    object dbchkFLGATIVO: TDBCheckBox
      Left = 385
      Top = 14
      Width = 65
      Height = 17
      Caption = 'Ativo'
      DataField = 'FLGATIVO'
      DataSource = ds
      TabOrder = 1
      ValueChecked = '1'
      ValueUnchecked = '0'
    end
    object dbedtFormato: TDBEdit
      Left = 385
      Top = 108
      Width = 113
      Height = 21
      DataField = 'FORMATO'
      DataSource = ds
      TabOrder = 7
    end
    object dbchkFLGVISIVEL: TDBCheckBox
      Left = 529
      Top = 14
      Width = 64
      Height = 17
      Caption = 'Visível'
      DataField = 'FLGVISIVEL'
      DataSource = ds
      TabOrder = 2
      ValueChecked = '1'
      ValueUnchecked = '0'
    end
    object pnlItems: TPanel
      Left = 529
      Top = 70
      Width = 189
      Height = 97
      BevelOuter = bvLowered
      TabOrder = 10
      object lbITENS: TListBox
        Left = 3
        Top = 21
        Width = 167
        Height = 72
        DragMode = dmAutomatic
        Font.Charset = ANSI_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'Arial'
        Font.Style = []
        ItemHeight = 14
        ParentFont = False
        TabOrder = 0
        OnDragDrop = lbITENSDragDrop
        OnDragOver = lbITENSDragOver
      end
      object Panel2: TPanel
        Left = 4
        Top = 4
        Width = 33
        Height = 15
        BevelOuter = bvNone
        TabOrder = 1
        object spbPlus: TSpeedButton
          Left = 0
          Top = 0
          Width = 15
          Height = 15
          Flat = True
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
          OnClick = spbPlusClick
        end
        object spnMinus: TSpeedButton
          Left = 16
          Top = 0
          Width = 17
          Height = 15
          Flat = True
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
          OnClick = spnMinusClick
        end
      end
      object Panel3: TPanel
        Left = 170
        Top = 40
        Width = 16
        Height = 33
        AutoSize = True
        BevelOuter = bvNone
        TabOrder = 2
        object spbUp: TSpeedButton
          Left = 0
          Top = 0
          Width = 16
          Height = 16
          Flat = True
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
          OnClick = spbUpClick
        end
        object spbDown: TSpeedButton
          Left = 0
          Top = 16
          Width = 16
          Height = 17
          Flat = True
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
          OnClick = spbDownClick
        end
      end
      object pnlNovoItem: TPanel
        Left = 65
        Top = 2
        Width = 104
        Height = 18
        AutoSize = True
        BevelOuter = bvNone
        TabOrder = 3
        Visible = False
        object spbOkItem: TSpeedButton
          Left = 73
          Top = 2
          Width = 15
          Height = 15
          Flat = True
          Font.Charset = SYMBOL_CHARSET
          Font.Color = clWindowText
          Font.Height = -9
          Font.Name = 'Wingdings'
          Font.Style = [fsBold]
          Glyph.Data = {
            C6000000424DC60000000000000076000000280000000B0000000A0000000100
            04000000000050000000C40E0000C40E00001000000000000000000000000000
            800000800000008080008000000080008000808000007F7F7F00BFBFBF000000
            FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00555555555550
            0000555AA0555550000055AAAA05555000005AA5AA05555000007A555AA05550
            0000A0555AA055500000555555AA05500000555555AA055000005555555AA050
            000055555555AA000000}
          ParentFont = False
          OnClick = spbOkItemClick
        end
        object spbCancelItem: TSpeedButton
          Left = 89
          Top = 2
          Width = 15
          Height = 15
          Flat = True
          Font.Charset = SYMBOL_CHARSET
          Font.Color = clWindowText
          Font.Height = -9
          Font.Name = 'Wingdings'
          Font.Style = [fsBold]
          Glyph.Data = {
            C6000000424DC60000000000000076000000280000000B0000000A0000000100
            04000000000050000000C40E0000C40E00001000000000000000000000000000
            800000800000008080008000000080008000808000007F7F7F00BFBFBF000000
            FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00555555555550
            0000555905555000000055999050990000005559900995500000555099995550
            0000500999055550000099999990555000009995599055500000595555990550
            00005555555990500000}
          ParentFont = False
          OnClick = spbCancelItemClick
        end
        object edtNovoItem: TEdit
          Left = 0
          Top = 0
          Width = 73
          Height = 18
          AutoSize = False
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'Arial'
          Font.Style = []
          ParentFont = False
          TabOrder = 0
          OnExit = edtNovoItemExit
        end
      end
    end
    object dbchkFLGREQUERIDO: TDBCheckBox
      Left = 385
      Top = 139
      Width = 129
      Height = 17
      Caption = 'Requerido'
      DataField = 'FLGREQUERIDO'
      DataSource = ds
      TabOrder = 9
      ValueChecked = '1'
      ValueUnchecked = '0'
    end
  end
  inherited Dock972: TDock97
    Width = 731
  end
  inherited Dock971: TDock97
    Top = 433
    Width = 731
    inherited tb97Fundo: TToolbar97
      Left = 390
      DockPos = 431
    end
    inherited TB97oKCancelar: TToolbar97
      Left = 562
      DockPos = 606
    end
  end
  inherited ivTradutor: TIvExtendedTranslator
    Left = 354
    Top = 7
    TargetsData = (
      1
      2
      (
        'TMemo'
        'Text'
        0)
      (
        'TDBMemo'
        'Text'
        0))
  end
  inherited ds: TwwDataSource
    Left = 246
    Top = 7
  end
  inherited ImlPadrao: TImageList
    Left = 328
    Top = 7
  end
  inherited CmeCadastro: TCmEventosCadastro
    OnFind = CmeCadastroFind
    ApplyInsert = CmeCadastroApplyInsert
    ApplyEdit = CmeCadastroApplyEdit
    ApplyDelete = CmeCadastroApplyDelete
    Left = 272
    Top = 7
  end
  inherited Cds: TCMClientDataSet
    Left = 380
    Top = 8
    object CdsIDINPUT: TFloatField
      FieldName = 'IDINPUT'
    end
    object CdsTITULO: TStringField
      FieldName = 'TITULO'
      Size = 60
    end
    object CdsNOMEPARAREGRA: TStringField
      FieldName = 'NOMEPARAREGRA'
    end
    object CdsFLGATIVO: TFloatField
      FieldName = 'FLGATIVO'
    end
    object CdsFLGVISIVEL: TFloatField
      FieldName = 'FLGVISIVEL'
    end
    object CdsFLGREQUERIDO: TFloatField
      FieldName = 'FLGREQUERIDO'
    end
    object CdsTIPODADO: TStringField
      FieldName = 'TIPODADO'
      FixedChar = True
      Size = 1
    end
    object CdsFORMATO: TStringField
      FieldName = 'FORMATO'
    end
    object CdsORIGEMDADO: TStringField
      FieldName = 'ORIGEMDADO'
      FixedChar = True
      Size = 1
    end
    object CdsIDREGRAPREENCHE: TFloatField
      FieldName = 'IDREGRAPREENCHE'
    end
    object CdsFLGQUERYPREENCHE: TFloatField
      FieldName = 'FLGQUERYPREENCHE'
    end
    object CdsQUERYPREENCHE: TBlobField
      FieldName = 'QUERYPREENCHE'
      BlobType = ftBlob
      Size = 1
    end
    object CdsCAMPO: TStringField
      FieldName = 'CAMPO'
    end
    object CdsVALORDEFAULT: TStringField
      FieldName = 'VALORDEFAULT'
      Size = 100
    end
    object CdsFLGPODEALTERAR: TFloatField
      FieldName = 'FLGPODEALTERAR'
    end
    object CdsIDREGRAVALIDA: TFloatField
      FieldName = 'IDREGRAVALIDA'
    end
    object CdsFLGQUERYVALIDA: TFloatField
      FieldName = 'FLGQUERYVALIDA'
    end
    object CdsQUERYVALIDA: TBlobField
      FieldName = 'QUERYVALIDA'
      BlobType = ftBlob
      Size = 1
    end
    object CdsLISTAITENS: TBlobField
      FieldName = 'LISTAITENS'
      BlobType = ftBlob
      Size = 1
    end
  end
  inherited MontaSelect: TMontaSelect
    Caption = 'Seleciona Campo da Simulação de Benefício'
    Colunas.Strings = (
      'INPUTSIMULABENEF.IDINPUT'
      'INPUTSIMULABENEF.TITULO'
      'INPUTSIMULABENEF.NOMEPARAREGRA'
      
        'DECODE( INPUTSIMULABENEF.TIPODADO, '#39'D'#39', '#39'Data'#39', '#39'N'#39', '#39'Número'#39', '#39 +
        'T'#39',  '#39'Texto'#39', '#39'L'#39', '#39'Lista'#39', '#39#39' )'
      
        'DECODE( INPUTSIMULABENEF.ORIGEMDADO, '#39'C'#39', '#39'Campo de Query'#39', '#39'R'#39',' +
        ' '#39'Resultado de Regra'#39', '#39'V'#39', '#39'Conteúdo Fixo'#39', '#39#39' )'
      
        'DECODE( INPUTSIMULABENEF.FLGPODEALTERAR, '#39'1'#39', '#39'S'#39', '#39'0'#39', '#39'N'#39', '#39#39' ' +
        ')'
      'DECODE( INPUTSIMULABENEF.FLGATIVO, '#39'1'#39', '#39'S'#39', '#39'0'#39', '#39'N'#39', '#39#39' )'
      'DECODE( INPUTSIMULABENEF.FLGVISIVEL, '#39'1'#39', '#39'S'#39', '#39'0'#39', '#39'N'#39', '#39#39' )'
      'DECODE( INPUTSIMULABENEF.FLGREQUERIDO, '#39'1'#39', '#39'S'#39', '#39'0'#39', '#39'N'#39', '#39#39' )')
    TipodeDado.Strings = (
      'N'
      'C'
      'C'
      'C'
      'C'
      'C'
      'C'
      'C'
      'C')
    Descricao.Strings = (
      'Código do Campo'
      'Título'
      'Nome para Regra'
      'Tipo de Dado'
      'Origem do Dado'
      'Pode alterar'
      'Ativo'
      'Visível'
      'Requerido')
    SensivelACaixa.Strings = (
      'N'
      'N'
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
      'INPUTSIMULABENEF.IDINPUT')
    Mascaras.Strings = (
      ''
      ''
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
      '1'
      '1'
      '1')
    Left = 304
    Top = 7
  end
  object msRegra: TMontaSelect
    Template.IdConsulta = 0
    Caption = 'Seleciona Regra'
    Colunas.Strings = (
      'REGRA.IDREGRA'
      'REGRA.NOMEREGRA')
    TipodeDado.Strings = (
      'N'
      'C')
    Descricao.Strings = (
      'Id. Regra'
      'Nome da Regra')
    SensivelACaixa.Strings = (
      'N'
      'N')
    Tabelas.Strings = (
      'REGRA')
    CamposChave.Strings = (
      'REGRA.IDREGRA'
      'REGRA.NOMEREGRA')
    Mascaras.Strings = (
      ''
      '')
    Larguras.Strings = (
      '10'
      '60')
    DataBaseName = 'BaseDados'
    RepeteConsulta = False
    UsaDistinct = False
    SalvaConsulta = False
    ExibePergunta = True
    MultiSelect = False
    Left = 648
    Top = 7
  end
end
