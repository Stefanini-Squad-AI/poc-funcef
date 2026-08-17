inherited frmExecCalcCota: TfrmExecCalcCota
  Left = 276
  Top = 212
  HelpContext = 545024
  Caption = 'Cálculo de Cotas'
  ClientHeight = 432
  PixelsPerInch = 96
  TextHeight = 13
  inherited pnlFundo: TPanel
    Height = 393
    inherited PagControle: TPageControl
      Height = 391
      inherited tabSelecao: TTabSheet
        inherited lblTitulo: TfcLabel
          Caption = 'Cálculo de Cotas [ página 1 ]'
        end
        object Label3: TLabel
          Left = 244
          Top = 340
          Width = 121
          Height = 13
          Caption = 'Calcular Cotas até:   '
        end
        object grpCalculo: TGroupBox
          Left = 112
          Top = 40
          Width = 353
          Height = 281
          Caption = ' Calcular Cotas de: '
          TabOrder = 2
          object Label1: TLabel
            Left = 35
            Top = 96
            Width = 87
            Height = 13
            Caption = 'Investimentos: '
          end
          object Label2: TLabel
            Left = 147
            Top = 168
            Width = 46
            Height = 13
            Caption = 'Fundos:'
          end
          object chkManual: TCheckBox
            Left = 16
            Top = 24
            Width = 137
            Height = 17
            Caption = 'Cotas Manuais'
            TabOrder = 0
          end
          object chkEP: TCheckBox
            Left = 16
            Top = 48
            Width = 137
            Height = 17
            Caption = 'Empréstimo'
            TabOrder = 1
          end
          object chkImob: TCheckBox
            Left = 16
            Top = 72
            Width = 137
            Height = 17
            Caption = 'Imobiliário'
            TabOrder = 2
          end
          object chkRF: TCheckBox
            Left = 128
            Top = 96
            Width = 137
            Height = 17
            Caption = 'Renda Fixa'
            TabOrder = 3
          end
          object chkRV: TCheckBox
            Left = 128
            Top = 120
            Width = 137
            Height = 17
            Caption = 'Renda Variável'
            TabOrder = 4
          end
          object chkBMF: TCheckBox
            Left = 128
            Top = 144
            Width = 137
            Height = 17
            Caption = 'BM&&F'
            Enabled = False
            TabOrder = 5
          end
          object chkFundoRF: TCheckBox
            Left = 208
            Top = 168
            Width = 137
            Height = 17
            Caption = 'Renda Fixa'
            TabOrder = 6
          end
          object chkFundoRV: TCheckBox
            Left = 208
            Top = 192
            Width = 137
            Height = 17
            Caption = 'Renda Variável'
            TabOrder = 7
          end
          object chkFundoImob: TCheckBox
            Left = 208
            Top = 216
            Width = 137
            Height = 17
            Caption = 'Imobiliário'
            TabOrder = 8
          end
          object chkFundoDIC: TCheckBox
            Left = 208
            Top = 240
            Width = 137
            Height = 17
            Caption = 'Direito Creditório'
            TabOrder = 9
          end
        end
        object edtDataFim: TCMDateTimePicker
          Left = 360
          Top = 336
          Width = 105
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
          TabOrder = 3
        end
        object btnInverte: TBitBtn
          Left = 423
          Top = 36
          Width = 21
          Height = 20
          Hint = 'Inverte a seleção'
          ParentShowHint = False
          ShowHint = True
          TabOrder = 0
          OnClick = btnInverteClick
          Glyph.Data = {
            F6000000424DF600000000000000760000002800000010000000100000000100
            0400000000008000000000000000000000001000000000000000000000000000
            8000008000000080800080000000800080008080000080808000C0C0C0000000
            FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00888888888888
            8888888888488888888888888844888888888888444448888888888444444488
            1888884444444888118884448844888881188448884888888118844888888188
            8118844888881188111888448881111111888884881111111888888888811111
            8888888888881188888888888888818888888888888888888888}
        end
        object btnMarcaTodos: TBitBtn
          Left = 444
          Top = 36
          Width = 21
          Height = 20
          Hint = 'Seleciona todos'
          ParentShowHint = False
          ShowHint = True
          TabOrder = 1
          OnClick = btnMarcaTodosClick
          Glyph.Data = {
            D6000000424DD60000000000000076000000280000000C0000000C0000000100
            0400000000006000000000000000000000001000000000000000000000000000
            8000008000000080800080000000800080008080000080808000C0C0C0000000
            FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00888848888888
            0000888224888888000088222248888800008822822488880000882848224888
            0000888224822488000088222248228800008822822482880000882888224888
            0000888888822488000088888888228800008888888882880000}
        end
      end
      inherited TabSheet1: TTabSheet
        inherited fcLabel1: TfcLabel
          Width = 578
          Caption = 'Cálculo de Cotas [ página 2 ]'
        end
        object Label5: TLabel
          Left = 0
          Top = 42
          Width = 69
          Height = 13
          Caption = 'Ocorrências'
        end
        object memResult: TwwDBRichEdit
          Left = 0
          Top = 64
          Width = 578
          Height = 317
          ScrollBars = ssBoth
          Align = alBottom
          AutoURLDetect = False
          PrintJobName = 'Delphi 5'
          TabOrder = 0
          EditorCaption = 'Edit Rich Text'
          EditorPosition.Left = 0
          EditorPosition.Top = 0
          EditorPosition.Width = 0
          EditorPosition.Height = 0
          MeasurementUnits = muCentimeters
          PrintMargins.Top = 1
          PrintMargins.Bottom = 1
          PrintMargins.Left = 1
          PrintMargins.Right = 1
          RichEditVersion = 2
          Data = {
            830000007B5C727466315C616E73695C616E7369637067313235325C64656666
            305C6465666C616E67313034367B5C666F6E7474626C7B5C66305C666E696C20
            4D532053616E732053657269663B7D7D0D0A5C766965776B696E64345C756331
            5C706172645C736C3336305C736C6D756C74315C625C66305C667331345C7061
            720D0A7D0D0A00}
        end
      end
    end
  end
  inherited Dock971: TDock97
    Top = 393
    inherited tb97Fundo: TToolbar97
      Left = 204
      inherited sep1: TToolbarSep97
        Left = 297
      end
      inherited CMSeparaWizard2: TToolbarSep97
        Left = 164
      end
      inherited CMSeparaWizard1: TToolbarSep97
        Left = 191
      end
      inherited bbtnSair: TBitBtn
        Left = 216
      end
      inherited bbtnAjuda: TmaHelpBitBtn
        Left = 299
      end
      inherited btnContinuar: TfcShapeBtn
        Left = 83
      end
      inherited btnConfirmar: TfcShapeBtn
        Left = 166
        Width = 25
        Visible = False
      end
    end
  end
  inherited ivTradutor: TIvExtendedTranslator
    Left = 971
    Top = 65531
    TargetsData = (
      1
      2
      (
        'TMemo'
        'Text'
        0)
      (
        'TwwDBRichEdit'
        'Text'
        0))
  end
end
