inherited frmSelRelProg2: TfrmSelRelProg2
  Left = 221
  Top = 179
  Caption = 'Seleção para Relatório de Programação de Exames'
  ClientHeight = 273
  ClientWidth = 500
  PixelsPerInch = 96
  TextHeight = 13
  inherited pnlFundo: TPanel
    Width = 500
    Height = 234
    inherited PageControl1: TPageControl
      Width = 490
      Height = 224
      ActivePage = TabSheet1
      object TabSheet1: TTabSheet [0]
        Caption = 'Seleção da Impressão'
        object rgPrograma: TRadioGroup
          Left = 1
          Top = 112
          Width = 247
          Height = 84
          Caption = 'Cria Registro Para os Não Programados ?'
          ItemIndex = 1
          Items.Strings = (
            'Sim'
            'Não')
          TabOrder = 0
        end
        object gbxFaixaData: TGroupBox
          Left = 1
          Top = 54
          Width = 247
          Height = 49
          Caption = 'Faixa de Datas'
          TabOrder = 1
          object Label1: TLabel
            Left = 119
            Top = 22
            Width = 8
            Height = 13
            Caption = 'a'
          end
          object edData1: TCMDateTimePicker
            Left = 8
            Top = 19
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
            OnChange = edData1Change
          end
          object edData2: TCMDateTimePicker
            Left = 139
            Top = 19
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
            OnChange = edData1Change
          end
        end
        object rgSelTudo: TRadioGroup
          Left = 251
          Top = 0
          Width = 228
          Height = 49
          Caption = 'Considerar'
          Columns = 2
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'MS Sans Serif'
          Font.Style = [fsBold]
          ItemIndex = 0
          Items.Strings = (
            'Todos os Tipos'
            'A Selecionar')
          ParentFont = False
          TabOrder = 2
          OnClick = rgSelTudoClick
        end
        object gbxOcorr: TGroupBox
          Left = 251
          Top = 54
          Width = 229
          Height = 143
          Caption = 'Tipos de Ocorrência'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'MS Sans Serif'
          Font.Style = [fsBold]
          ParentFont = False
          ParentShowHint = False
          ShowHint = False
          TabOrder = 3
          Visible = False
          object dblcOcorr: TwwDBLookupCombo
            Left = 9
            Top = 14
            Width = 211
            Height = 21
            Hint = 'Informe Grupo(s) Desejado(s)'
            DropDownAlignment = taLeftJustify
            Selected.Strings = (
              'DESCRTIPOOCMED'#9'40'#9'DESCRTIPOOCMED')
            LookupTable = qryOcorr
            LookupField = 'DESCRTIPOOCMED'
            ParentShowHint = False
            ShowHint = True
            TabOrder = 0
            AutoDropDown = False
            ShowButton = True
            SeqSearchOptions = [ssoEnabled, ssoCaseSensitive]
            AllowClearKey = False
            OnCloseUp = dblcOcorrCloseUp
          end
          object lstOcorr: TListBox
            Left = 9
            Top = 41
            Width = 211
            Height = 95
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
            OnKeyDown = lstOcorrKeyDown
          end
          object lstCodOcorr: TListBox
            Left = 27
            Top = 56
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
        object rgSelPeriodo: TRadioGroup
          Left = 1
          Top = 0
          Width = 247
          Height = 49
          Caption = 'Seleciona Período'
          Columns = 2
          ItemIndex = 0
          Items.Strings = (
            'Sim'
            'Não')
          TabOrder = 4
          OnClick = rgSelPeriodoClick
        end
      end
      inherited TabSheet2: TTabSheet
        inherited BitBtn1: TBitBtn
          Left = 132
          Top = 103
        end
        inherited BitBtn2: TBitBtn
          Left = 132
          Top = 43
        end
      end
    end
  end
  inherited Dock971: TDock97
    Top = 234
    Width = 500
    inherited tb97Fundo: TToolbar97
      Left = 170
      DockPos = 178
      inherited bbtnSair: TBitBtn
        Visible = True
      end
      inherited bbtnAjuda: TmaHelpBitBtn
        Visible = True
      end
      inherited rbtnVisualizar: TBitBtn
        OnClick = rbtnVisualizarClick
      end
      inherited rbtnImprimir: TBitBtn
        OnClick = rbtnImprimirClick
      end
    end
  end
  inherited ivTradutor: TIvExtendedTranslator
    Left = 195
    Top = 155
  end
  inherited cdMestre: TColorDialog
    Left = 73
    Top = 220
  end
  inherited cdCabecalho: TColorDialog
    Left = 14
    Top = 221
  end
  object qryOcorr: TwwQuery
    DatabaseName = 'BaseDados'
    SQL.Strings = (
      'Select Distinct TIPOCMED.CODTIPOOCMED, '
      'TIPOCMED.DESCRTIPOOCMED, PEREXAME.CODTIPOOCMED '
      'from TIPOCMED, PEREXAME '
      'where TIPOCMED.CODTIPOOCMED = PEREXAME.CODTIPOOCMED '
      'order by TIPOCMED.DESCRTIPOOCMED')
    ValidateWithMask = True
    Left = 124
    Top = 219
  end
end
