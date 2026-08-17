inherited FrmFiltraSqlRelat: TFrmFiltraSqlRelat
  Left = 222
  Top = 189
  BorderStyle = bsDialog
  Caption = 'Filtra Consulta'
  ClientHeight = 365
  ClientWidth = 554
  FormStyle = fsNormal
  Visible = False
  PixelsPerInch = 96
  TextHeight = 13
  inherited pnlFundo: TPanel
    Width = 554
    Height = 326
    object Panel1: TPanel
      Left = 5
      Top = 5
      Width = 544
      Height = 102
      Align = alTop
      BevelOuter = bvNone
      TabOrder = 0
      object Label1: TLabel
        Left = 7
        Top = 4
        Width = 130
        Height = 13
        Caption = 'Campos Para Pesquisa'
      end
      object Label2: TLabel
        Left = 182
        Top = 4
        Width = 81
        Height = 13
        Caption = 'Comparadores'
      end
      object Label3: TLabel
        Left = 337
        Top = 4
        Width = 33
        Height = 13
        Caption = 'Texto'
      end
      object Bevel1: TBevel
        Left = 263
        Top = 54
        Width = 132
        Height = 40
        Shape = bsFrame
      end
      object Bevel2: TBevel
        Left = 399
        Top = 53
        Width = 138
        Height = 41
        Shape = bsFrame
      end
      object EdtDate: TCMDateTimePicker
        Left = 337
        Top = 21
        Width = 199
        Height = 21
        CalendarAttributes.Font.Charset = DEFAULT_CHARSET
        CalendarAttributes.Font.Color = clWindowText
        CalendarAttributes.Font.Height = -11
        CalendarAttributes.Font.Name = 'MS Sans Serif'
        CalendarAttributes.Font.Style = []
        ButtonStyle = cbsCustom
        Epoch = 1950
        ButtonGlyph.Data = {
          06050000424D06050000000000003604000028000000100000000D0000000100
          080000000000D000000000000000000000000001000000000000000000000000
          80000080000000808000800000008000800080800000C0C0C000C0DCC000F0CA
          A6000020400000206000002080000020A0000020C0000020E000004000000040
          20000040400000406000004080000040A0000040C0000040E000006000000060
          20000060400000606000006080000060A0000060C0000060E000008000000080
          20000080400000806000008080000080A0000080C0000080E00000A0000000A0
          200000A0400000A0600000A0800000A0A00000A0C00000A0E00000C0000000C0
          200000C0400000C0600000C0800000C0A00000C0C00000C0E00000E0000000E0
          200000E0400000E0600000E0800000E0A00000E0C00000E0E000400000004000
          20004000400040006000400080004000A0004000C0004000E000402000004020
          20004020400040206000402080004020A0004020C0004020E000404000004040
          20004040400040406000404080004040A0004040C0004040E000406000004060
          20004060400040606000406080004060A0004060C0004060E000408000004080
          20004080400040806000408080004080A0004080C0004080E00040A0000040A0
          200040A0400040A0600040A0800040A0A00040A0C00040A0E00040C0000040C0
          200040C0400040C0600040C0800040C0A00040C0C00040C0E00040E0000040E0
          200040E0400040E0600040E0800040E0A00040E0C00040E0E000800000008000
          20008000400080006000800080008000A0008000C0008000E000802000008020
          20008020400080206000802080008020A0008020C0008020E000804000008040
          20008040400080406000804080008040A0008040C0008040E000806000008060
          20008060400080606000806080008060A0008060C0008060E000808000008080
          20008080400080806000808080008080A0008080C0008080E00080A0000080A0
          200080A0400080A0600080A0800080A0A00080A0C00080A0E00080C0000080C0
          200080C0400080C0600080C0800080C0A00080C0C00080C0E00080E0000080E0
          200080E0400080E0600080E0800080E0A00080E0C00080E0E000C0000000C000
          2000C0004000C0006000C0008000C000A000C000C000C000E000C0200000C020
          2000C0204000C0206000C0208000C020A000C020C000C020E000C0400000C040
          2000C0404000C0406000C0408000C040A000C040C000C040E000C0600000C060
          2000C0604000C0606000C0608000C060A000C060C000C060E000C0800000C080
          2000C0804000C0806000C0808000C080A000C080C000C080E000C0A00000C0A0
          2000C0A04000C0A06000C0A08000C0A0A000C0A0C000C0A0E000C0C00000C0C0
          2000C0C04000C0C06000C0C08000C0C0A000F0FBFF00A4A0A000808080000000
          FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00010000000000
          000000000000000000FFFF00FFFFFFFFFFFFFFFFFFFFFFFF00FFFF00FF07A407
          A407A4F9A407A4FF00FFFF00FFA407A407A4F9A4F9A407FF00FFFF00FF07A407
          A407A4F9A407A4FF00FFFF00FFA407A407A407A407A407FF00FFFF00FF07A407
          A407A407A407A4FF00FFFF00FFA407A407A407A407A407FF00FFFF00FFFFFFFF
          FFFFFFFFFFFFFFFF00FFFF00FF04FC04FC04FCA4A4A4A4FF00FFFF00FFFC04FC
          04FC04A4A4A4A4FF00FFFF00FFFFFFFFFFFFFFFFFFFFFFFF00FFFF0000000000
          000000000000000000FF}
        ShowButton = True
        TabOrder = 8
        Visible = False
      end
      object EdtNum: TRealEdit
        Left = 337
        Top = 21
        Width = 199
        Height = 21
        Alignment = taRightJustify
        Lines.Strings = (
          '      0,00')
        TabOrder = 9
        Visible = False
        WordWrap = False
        IntDigits = 10
        DecDigits = 0
        NumberFormat = fNumber
        Signal = False
      end
      object EdtValoresCondicao: TMaskEdit
        Left = 337
        Top = 21
        Width = 199
        Height = 21
        TabOrder = 4
      end
      object BtnInclui: TBitBtn
        Left = 409
        Top = 61
        Width = 60
        Height = 25
        Caption = 'Add'
        TabOrder = 0
        OnClick = BtnIncluiClick
        Glyph.Data = {
          76010000424D7601000000000000760000002800000020000000100000000100
          0400000000000001000000000000000000001000000010000000000000000000
          8000008000000080800080000000800080008080000080808000C0C0C0000000
          FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00888888888888
          8888888888FFFFF8888888888777778888888888F777778FF888888776666677
          88888887788888778F88887666666666088888788888F88878F887E6666F6666
          608887F888878F8887F887E666FFF66660888788887778F8878F7E666FFFFF66
          66087F888777778F887F7E66FFFFFFF666087F8877777778F87F7E6FFFFFFFFF
          66087F8777777777887F7E6666FFF66666087F8888777F88887F7E6666FFF666
          660878F888777F88887887E666FFF666608887F888777F8887F887E666FFF666
          6088878F887778888788887EE666666608888878FF888888788888800EEEEE00
          8888888778FFFF77888888888000008888888888877777888888}
        NumGlyphs = 2
      end
      object BtnExclui: TBitBtn
        Left = 472
        Top = 61
        Width = 60
        Height = 25
        Caption = 'Del'
        TabOrder = 1
        OnClick = BtnExcluiClick
        Glyph.Data = {
          76010000424D7601000000000000760000002800000020000000100000000100
          0400000000000001000000000000000000001000000010000000000000000000
          8000008000000080800080000000800080008080000080808000C0C0C0000000
          FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00888888888888
          8888888888FFFFF8888888888000008888888888F777778FF888888006666600
          88888887788888778F8888766666666608888878888FFF8878F887E666FFF666
          608887F888777F8887F887E666FFF6666088878888777F88878F7E6666FFF666
          66087F8888777F88887F7E6666FFF66666087F8888777FFFF87F7E6FFFFFFFFF
          66087F8777777777887F7E66FFFFFFF666087F8877777778887F7E666FFFFF66
          660878F887777788887887E666FFF666608887F88877788887F887E6666F6666
          6088878F888788888788887EE666666608888878FF888888788888877EEEEE77
          8888888778FFFF77888888888777778888888888877777888888}
        NumGlyphs = 2
      end
      object RgJuncoes: TRadioGroup
        Left = 9
        Top = 49
        Width = 91
        Height = 46
        Caption = ' Junções '
        ItemIndex = 0
        Items.Strings = (
          'E'
          'OU')
        TabOrder = 2
      end
      object RgParentesis: TRadioGroup
        Left = 104
        Top = 49
        Width = 155
        Height = 46
        Caption = ' Parênteses '
        Columns = 2
        ItemIndex = 0
        Items.Strings = (
          'Nenhum'
          'Início'
          'Fim')
        TabOrder = 3
      end
      object Cmbcampos: TComboBox
        Left = 7
        Top = 21
        Width = 171
        Height = 21
        Style = csDropDownList
        ItemHeight = 13
        TabOrder = 5
        OnChange = CmbcamposChange
      end
      object CmbComparadores: TComboBox
        Left = 182
        Top = 21
        Width = 151
        Height = 21
        Style = csDropDownList
        ItemHeight = 13
        TabOrder = 6
        Items.Strings = (
          'Igual a'
          'Diferente de'
          'Menor Que'
          'Menor Ou Igual a'
          'Maior Que'
          'Maior Ou Igual a'
          'Começando Com'
          'Possui o Texto')
      end
      object CkbCaixa: TCheckBox
        Left = 269
        Top = 66
        Width = 121
        Height = 17
        Caption = 'Sensível a Caixa'
        Checked = True
        State = cbChecked
        TabOrder = 7
      end
    end
    object Panel2: TPanel
      Left = 5
      Top = 107
      Width = 544
      Height = 26
      Align = alTop
      BevelInner = bvLowered
      BevelWidth = 2
      Caption = 'Condições Para Pesquisa'
      Color = clGray
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWhite
      Font.Height = -13
      Font.Name = 'MS Sans Serif'
      Font.Style = [fsBold]
      ParentFont = False
      TabOrder = 1
    end
    object Panel3: TPanel
      Left = 5
      Top = 133
      Width = 544
      Height = 188
      Align = alClient
      BevelOuter = bvNone
      TabOrder = 2
      object LstCondicoes: TListBox
        Left = 0
        Top = 0
        Width = 513
        Height = 188
        Align = alClient
        ItemHeight = 13
        TabOrder = 0
      end
      object Panel4: TPanel
        Left = 513
        Top = 0
        Width = 31
        Height = 188
        Align = alRight
        BevelOuter = bvNone
        TabOrder = 1
        object BtnUp: TBitBtn
          Tag = 1
          Left = 3
          Top = 48
          Width = 26
          Height = 28
          TabOrder = 0
          OnClick = BtnUpClick
          Glyph.Data = {
            76010000424D7601000000000000760000002800000020000000100000000100
            0400000000000001000000000000000000001000000010000000000000000000
            8000008000000080800080000000800080008080000080808000C0C0C0000000
            FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00888888888888
            8888888888FFFFF8888888888000008888888888F777778FF888888006666600
            88888887788888778F8888766666666608888878888FFF8878F887E666FFF666
            608887F888777F8887F887E666FFF6666088878888777F88878F7E6666FFF666
            66087F8888777F88887F7E6666FFF66666087F8888777FFFF87F7E6FFFFFFFFF
            66087F8777777777887F7E66FFFFFFF666087F8877777778887F7E666FFFFF66
            660878F887777788887887E666FFF666608887F88877788887F887E6666F6666
            6088878F888788888788887EE666666608888878FF888888788888877EEEEE77
            8888888778FFFF77888888888777778888888888877777888888}
          NumGlyphs = 2
        end
        object BtnDow: TBitBtn
          Left = 3
          Top = 96
          Width = 26
          Height = 28
          TabOrder = 1
          OnClick = BtnUpClick
          Glyph.Data = {
            76010000424D7601000000000000760000002800000020000000100000000100
            0400000000000001000000000000000000001000000010000000000000000000
            8000008000000080800080000000800080008080000080808000C0C0C0000000
            FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00888888888888
            8888888888FFFFF8888888888777778888888888F777778FF888888776666677
            88888887788888778F88887666666666088888788888F88878F887E6666F6666
            608887F888878F8887F887E666FFF66660888788887778F8878F7E666FFFFF66
            66087F888777778F887F7E66FFFFFFF666087F8877777778F87F7E6FFFFFFFFF
            66087F8777777777887F7E6666FFF66666087F8888777F88887F7E6666FFF666
            660878F888777F88887887E666FFF666608887F888777F8887F887E666FFF666
            6088878F887778888788887EE666666608888878FF888888788888800EEEEE00
            8888888778FFFF77888888888000008888888888877777888888}
          NumGlyphs = 2
        end
      end
    end
  end
  inherited Dock971: TDock97
    Top = 326
    Width = 554
    inherited tb97Fundo: TToolbar97
      Left = 323
      DockPos = 323
      inherited bbtnSair: TBitBtn
        ModalResult = 1
      end
    end
    inherited TB97oKCancelar: TToolbar97
      Left = 155
      DockPos = 155
      inherited bbtnConfirmar: TBitBtn
        OnClick = bbtnConfirmarClick
      end
      inherited bbtnCancelar: TBitBtn
        OnClick = bbtnCancelarClick
      end
    end
  end
  inherited ivTradutor: TIvExtendedTranslator
    Left = 95
    Top = 167
    TargetsData = (
      1
      1
      (
        ''
        'Text'
        0))
  end
  object QryAux: TwwQuery
    DatabaseName = 'BaseDados'
    Filtered = True
    ValidateWithMask = True
    Left = 336
    Top = 176
  end
end
