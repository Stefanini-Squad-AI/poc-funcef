inherited frmSelRelMapaTrein: TfrmSelRelMapaTrein
  Left = 57
  Top = 110
  Caption = 'Seleção para o Relatório Mapa de Treinamento'
  ClientHeight = 438
  ClientWidth = 707
  PixelsPerInch = 96
  TextHeight = 13
  inherited pnlFundo: TPanel
    Width = 707
    Height = 399
    inherited PageControl1: TPageControl
      Width = 697
      Height = 389
      ActivePage = TabSheet1
      object TabSheet1: TTabSheet [0]
        Caption = 'Seleção da Impressão'
        object gbxFaixaData: TGroupBox
          Left = 17
          Top = 2
          Width = 139
          Height = 120
          Caption = 'Faixa de Datas'
          TabOrder = 0
          object Label1: TLabel
            Left = 61
            Top = 56
            Width = 8
            Height = 13
            Caption = 'a'
          end
          object EdData1: TCMDateTimePicker
            Left = 19
            Top = 20
            Width = 100
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
            TabOrder = 0
            OnChange = EdData1Change
          end
          object EdData2: TCMDateTimePicker
            Left = 19
            Top = 83
            Width = 100
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
            TabOrder = 1
            OnChange = EdData1Change
          end
        end
        object gbxSelEstado: TGroupBox
          Left = 416
          Top = 2
          Width = 257
          Height = 120
          Caption = 'Seleção de Cursos'
          TabOrder = 1
          object cbxRealProgr: TCheckBox
            Left = 9
            Top = 18
            Width = 166
            Height = 17
            Caption = 'Realizados Programados'
            Checked = True
            State = cbChecked
            TabOrder = 0
          end
          object cbxRealNaoProgr: TCheckBox
            Left = 9
            Top = 38
            Width = 240
            Height = 17
            Caption = 'Realizados Não Programados'
            Checked = True
            State = cbChecked
            TabOrder = 1
          end
          object cbxNaoRealProgr: TCheckBox
            Left = 9
            Top = 58
            Width = 166
            Height = 17
            Caption = 'A Realizar Programados'
            Checked = True
            State = cbChecked
            TabOrder = 2
          end
          object cbxNaoRealNaoProgr: TCheckBox
            Left = 9
            Top = 78
            Width = 230
            Height = 17
            Caption = 'A Realizar Não Programados'
            Checked = True
            State = cbChecked
            TabOrder = 3
          end
          object cbxNada: TCheckBox
            Left = 10
            Top = 98
            Width = 230
            Height = 17
            Caption = 'Não Realizados e Não Programados'
            TabOrder = 4
          end
        end
        object gbxCurso: TGroupBox
          Left = 361
          Top = 158
          Width = 312
          Height = 197
          Caption = 'Cursos'
          ParentShowHint = False
          ShowHint = False
          TabOrder = 2
          object dblcCurso: TwwDBLookupCombo
            Left = 9
            Top = 14
            Width = 295
            Height = 21
            Hint = 'Informe Grupo(s) Desejado(s)'
            DropDownAlignment = taRightJustify
            Selected.Strings = (
              'DESCRICAO'#9'60'#9'DESCRICAO')
            LookupTable = qryCurso
            LookupField = 'DESCRICAO'
            ParentShowHint = False
            ShowHint = True
            TabOrder = 0
            AutoDropDown = True
            ShowButton = True
            SeqSearchOptions = [ssoEnabled, ssoCaseSensitive]
            AllowClearKey = True
            OnCloseUp = dblcCursoCloseUp
          end
          object lstCurso: TListBox
            Left = 9
            Top = 41
            Width = 295
            Height = 147
            Color = clTeal
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clWhite
            Font.Height = -11
            Font.Name = 'MS Sans Serif'
            Font.Style = [fsBold]
            IntegralHeight = True
            ItemHeight = 13
            ParentFont = False
            TabOrder = 1
            OnKeyDown = lstCursoKeyDown
          end
          object lstCodCurso: TListBox
            Left = 231
            Top = 70
            Width = 40
            Height = 30
            Color = clTeal
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clWhite
            Font.Height = -11
            Font.Name = 'MS Sans Serif'
            Font.Style = [fsBold]
            IntegralHeight = True
            ItemHeight = 13
            ParentFont = False
            TabOrder = 2
            Visible = False
          end
        end
        object gbxPacote: TGroupBox
          Left = 17
          Top = 158
          Width = 312
          Height = 197
          Caption = 'Pacotes'
          ParentShowHint = False
          ShowHint = False
          TabOrder = 3
          object dblcPacote: TwwDBLookupCombo
            Left = 9
            Top = 14
            Width = 295
            Height = 21
            Hint = 'Informe Grupo(s) Desejado(s)'
            DropDownAlignment = taLeftJustify
            Selected.Strings = (
              'DESCRICAO'#9'30'#9'DESCRICAO')
            LookupTable = qryPacote
            LookupField = 'DESCRICAO'
            ParentShowHint = False
            ShowHint = True
            TabOrder = 0
            AutoDropDown = True
            ShowButton = True
            SeqSearchOptions = [ssoEnabled, ssoCaseSensitive]
            AllowClearKey = True
            OnCloseUp = dblcPacoteCloseUp
          end
          object lstPacote: TListBox
            Left = 9
            Top = 41
            Width = 295
            Height = 147
            Color = clBlue
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clWhite
            Font.Height = -11
            Font.Name = 'MS Sans Serif'
            Font.Style = [fsBold]
            IntegralHeight = True
            ItemHeight = 13
            ParentFont = False
            TabOrder = 1
            OnKeyDown = lstPacoteKeyDown
          end
          object lstCodPacote: TListBox
            Left = 231
            Top = 70
            Width = 40
            Height = 30
            Color = clBlue
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clWhite
            Font.Height = -11
            Font.Name = 'MS Sans Serif'
            Font.Style = [fsBold]
            IntegralHeight = True
            ItemHeight = 13
            ParentFont = False
            TabOrder = 2
            Visible = False
          end
        end
        object Memo1: TMemo
          Left = 168
          Top = 8
          Width = 233
          Height = 118
          TabStop = False
          BorderStyle = bsNone
          Color = clBtnFace
          Enabled = False
          Lines.Strings = (
            ''
            ''
            '   Você vai obter, no relatório, até 10 '
            '   (dez) cursos, sejam eles parte do(s)  '
            '   pacote(s)  que você indique abaixo '
            '  (à esquerda), ou os cursos que você '
            '              liste abaixo (à direita).')
          ReadOnly = True
          TabOrder = 4
        end
        object rgPacote: TRadioGroup
          Left = 17
          Top = 125
          Width = 312
          Height = 33
          Caption = 'Seleciona Pacotes'
          Columns = 2
          ItemIndex = 0
          Items.Strings = (
            'Sim'
            'Não')
          TabOrder = 5
          OnClick = rgPacoteClick
        end
        object rgCurso: TRadioGroup
          Left = 361
          Top = 125
          Width = 312
          Height = 33
          Caption = 'Seleciona Cursos'
          Columns = 2
          ItemIndex = 0
          Items.Strings = (
            'Sim'
            'Não')
          TabOrder = 6
          OnClick = rgCursoClick
        end
      end
      inherited TabSheet2: TTabSheet
        inherited BitBtn1: TBitBtn
          Left = 100
          Top = 139
        end
        inherited BitBtn2: TBitBtn
          Left = 100
          Top = 79
        end
      end
    end
  end
  inherited Dock971: TDock97
    Top = 399
    Width = 707
    inherited tb97Fundo: TToolbar97
      Left = 377
      DockPos = 385
      inherited bbtnSair: TBitBtn
        Visible = True
      end
      inherited bbtnAjuda: TmaHelpBitBtn
        Visible = True
      end
      inherited rbtnVisualizar: TBitBtn
        Enabled = False
        OnClick = rbtnVisualizarClick
      end
      inherited rbtnImprimir: TBitBtn
        Enabled = False
        OnClick = rbtnImprimirClick
      end
    end
  end
  object qryCurso: TwwQuery
    DatabaseName = 'BaseDados'
    SQL.Strings = (
      'Select IDCURSO, DESCRICAO'
      'from CURSO '
      'order by upper(DESCRICAO)')
    ValidateWithMask = True
    Left = 466
    Top = 263
  end
  object qryPacote: TwwQuery
    DatabaseName = 'BaseDados'
    SQL.Strings = (
      'Select IDPACOTE, DESCRICAO'
      'from PACOTE '
      'order by upper(DESCRICAO)')
    ValidateWithMask = True
    Left = 162
    Top = 239
  end
end
