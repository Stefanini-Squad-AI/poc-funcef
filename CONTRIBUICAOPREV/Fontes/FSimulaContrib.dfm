inherited frmSimulaContrib: TfrmSimulaContrib
  Left = 0
  Top = 0
  HelpContext = 160067
  Caption = 'Simulação de Contribuição'
  ClientHeight = 536
  ClientWidth = 792
  WindowState = wsMaximized
  PixelsPerInch = 96
  TextHeight = 13
  inherited pnlFundo: TPanel
    Width = 792
    Height = 497
    object pnlDadosSimulacao: TPanel
      Left = 1
      Top = 1
      Width = 790
      Height = 117
      Align = alTop
      BevelOuter = bvLowered
      TabOrder = 0
      object grpPlano: TGroupBox
        Left = 371
        Top = 1
        Width = 299
        Height = 115
        Align = alLeft
        TabOrder = 0
        object Label2: TLabel
          Left = 6
          Top = 57
          Width = 81
          Height = 13
          Caption = 'Para o evento'
        end
        object Label3: TLabel
          Left = 6
          Top = 15
          Width = 287
          Height = 13
          Caption = 'Simular contribuições para o Plano Previdenciário '
        end
        object dblkpcmbPlano: TwwDBLookupCombo
          Left = 6
          Top = 30
          Width = 285
          Height = 21
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -9
          Font.Name = 'MS Sans Serif'
          Font.Style = []
          DropDownAlignment = taLeftJustify
          Selected.Strings = (
            'NOME'#9'50'#9'Plano Previdenciário')
          LookupTable = qryPlanPrev
          LookupField = 'IDPLANOPREV'
          Options = [loTitles]
          ParentFont = False
          TabOrder = 0
          AutoDropDown = True
          ShowButton = True
          AllowClearKey = True
          OnCloseUp = dblkpcmbPlanoCloseUp
        end
        object dblkpcmbEvento: TwwDBLookupCombo
          Left = 6
          Top = 72
          Width = 285
          Height = 21
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -9
          Font.Name = 'MS Sans Serif'
          Font.Style = []
          DropDownAlignment = taLeftJustify
          Selected.Strings = (
            'NOME'#9'60'#9'Evento Gerador')
          LookupTable = qryEvento
          LookupField = 'IDEVENTOGERADOR'
          Options = [loTitles]
          ParentFont = False
          TabOrder = 1
          AutoDropDown = True
          ShowButton = True
          AllowClearKey = True
          OnCloseUp = dblkpcmbEventoCloseUp
        end
      end
      object GroupBox1: TGroupBox
        Left = 1
        Top = 1
        Width = 370
        Height = 115
        Align = alLeft
        TabOrder = 1
        object Label1: TLabel
          Left = 9
          Top = 32
          Width = 55
          Height = 13
          Caption = 'Matrícula'
        end
        object Label4: TLabel
          Left = 9
          Top = 74
          Width = 33
          Height = 13
          Caption = 'Nome'
        end
        object Label5: TLabel
          Left = 151
          Top = 32
          Width = 116
          Height = 13
          Caption = 'Data de Nascimento'
        end
        object sbtnProcParticip: TSpeedButton
          Left = 115
          Top = 43
          Width = 31
          Height = 30
          Hint = 'Procurar novo participante'
          Flat = True
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'MS Sans Serif'
          Font.Style = []
          Glyph.Data = {
            4E010000424D4E01000000000000760000002800000012000000120000000100
            040000000000D800000000000000000000001000000010000000000000000000
            BF0000BF000000BFBF00BF000000BF00BF00BFBF0000C0C0C000808080000000
            FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00DDDDDDDDDDDD
            DDDDDD000000DDDDDDDDDDDDDDDDDD000000D000000000000DD00D000000D0FF
            FFFFFFFF0D000D000000D0FFFFFFF0000800DD000000D0FFFFFF0877808DDD00
            0000D0FFFFF0877E880DDD000000D0FFFFF07777870DDD000000D0FFFFF07E77
            870DDD000000D0FFFFF08EE7880DDD000000D0FFFFFF087780DDDD000000D0FF
            FFFFF0000DDDDD000000D0FFFFFFFFFF0DDDDD000000D0FFFFFFF0000DDDDD00
            0000D0FFFFFFF070DDDDDD000000D0FFFFFFF00DDDDDDD000000DD00000000DD
            DDDDDD000000DDDDDDDDDDDDDDDDDD000000}
          ParentFont = False
          ParentShowHint = False
          ShowHint = True
          OnClick = sbtnProcParticipClick
        end
        object dtDataNasc: TCMDateTimePicker
          Left = 151
          Top = 47
          Width = 121
          Height = 21
          CalendarAttributes.Font.Charset = DEFAULT_CHARSET
          CalendarAttributes.Font.Color = clWindowText
          CalendarAttributes.Font.Height = -11
          CalendarAttributes.Font.Name = 'MS Sans Serif'
          CalendarAttributes.Font.Style = []
          Color = clMenu
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
          Enabled = False
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -9
          Font.Name = 'MS Sans Serif'
          Font.Style = []
          ParentFont = False
          ShowButton = True
          TabOrder = 1
          OnExit = dtDataNascExit
        end
        object edMatricula: TEdit
          Left = 9
          Top = 47
          Width = 104
          Height = 21
          Color = clMenu
          Enabled = False
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -9
          Font.Name = 'MS Sans Serif'
          Font.Style = []
          ParentFont = False
          TabOrder = 0
          Text = 'edMatricula'
          OnEnter = edMatriculaEnter
          OnExit = edMatriculaExit
        end
        object edNome: TEdit
          Left = 9
          Top = 89
          Width = 353
          Height = 21
          Color = clMenu
          Enabled = False
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -9
          Font.Name = 'MS Sans Serif'
          Font.Style = []
          ParentFont = False
          TabOrder = 3
          Text = 'edNome'
        end
        object rgrpSexo: TRadioGroup
          Left = 273
          Top = 32
          Width = 90
          Height = 52
          Caption = 'Sexo'
          Enabled = False
          Items.Strings = (
            'Masculino'
            'Feminino')
          TabOrder = 2
          TabStop = True
        end
        object rdgrpMat: TRadioGroup
          Left = 19
          Top = -5
          Width = 283
          Height = 28
          Columns = 2
          ItemIndex = 0
          Items.Strings = (
            'Matrícula existente'
            'Nova matrícula')
          TabOrder = 4
          OnClick = rdgrpMatClick
        end
      end
      object bbtnSimular: TBitBtn
        Left = 673
        Top = 18
        Width = 99
        Height = 40
        Hint = 'Executar simulação de contribuições'
        Caption = '&Simular'
        ParentShowHint = False
        ShowHint = True
        TabOrder = 2
        OnClick = bbtnSimularClick
        Glyph.Data = {
          76010000424D7601000000000000760000002800000020000000100000000100
          0400000000000001000000000000000000001000000010000000000000000000
          800000800000008080008000000080008000808000007F7F7F00BFBFBF000000
          FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00337000000000
          73333337777777773F333308888888880333337F3F3F3FFF7F33330808089998
          0333337F737377737F333308888888880333337F3F3F3F3F7F33330808080808
          0333337F737373737F333308888888880333337F3F3F3F3F7F33330808080808
          0333337F737373737F333308888888880333337F3F3F3F3F7F33330808080808
          0333337F737373737F333308888888880333337F3FFFFFFF7F33330800000008
          0333337F7777777F7F333308000E0E080333337F7FFFFF7F7F33330800000008
          0333337F777777737F333308888888880333337F333333337F33330888888888
          03333373FFFFFFFF733333700000000073333337777777773333}
        NumGlyphs = 2
      end
      object bbtnLimpar: TBitBtn
        Left = 673
        Top = 61
        Width = 99
        Height = 40
        Hint = 'Executar simulação de contribuições'
        Caption = '&Limpar'
        ParentShowHint = False
        ShowHint = True
        TabOrder = 3
        OnClick = bbtnLimparClick
        Glyph.Data = {
          76010000424D7601000000000000760000002800000020000000100000000100
          0400000000000001000000000000000000001000000010000000000000000000
          800000800000008080008000000080008000808000007F7F7F00BFBFBF000000
          FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00333000000000
          3333333777777777F3333330F77777703333333733F3F3F73F33330FF0808077
          0333337F37F7F7F37F33330FF0807077033333733737F73F73F330FF77808707
          703337F37F37F37F37F330FF08807807703037F37F37F37F37F700FF08808707
          700377F37337F37F377330FF778078077033373F73F7F3733733330FF0808077
          0333337F37F7F7F37F33330FF08070770333337FF7F7F7FF7F33330000000000
          03333377777777777F33330F888777770333337FFFFFFFFF7F33330000000000
          033333777777777773333333307770333333333337FFF7F33333333330000033
          3333333337777733333333333333333333333333333333333333}
        NumGlyphs = 2
      end
    end
    object pgctrlSimula: TPageControl
      Left = 1
      Top = 118
      Width = 790
      Height = 378
      ActivePage = tbsManutencao
      Align = alClient
      TabOrder = 1
      object tbsInscricao: TTabSheet
        Caption = 'Dados da Inscrição do Participante'
        object Panel1: TPanel
          Left = 0
          Top = 0
          Width = 782
          Height = 350
          Align = alClient
          BevelOuter = bvLowered
          TabOrder = 0
          object Label6: TLabel
            Left = 12
            Top = 9
            Width = 54
            Height = 13
            Caption = 'Admissão'
          end
          object Label7: TLabel
            Left = 219
            Top = 9
            Width = 53
            Height = 13
            Caption = 'Inscrição'
          end
          object Label8: TLabel
            Left = 12
            Top = 37
            Width = 77
            Height = 13
            Caption = 'Desligamento'
          end
          object Label9: TLabel
            Left = 219
            Top = 37
            Width = 68
            Height = 13
            Caption = 'Reinscrição'
          end
          object Label10: TLabel
            Left = 12
            Top = 61
            Width = 40
            Height = 13
            Caption = 'Salário'
          end
          object Label11: TLabel
            Left = 12
            Top = 87
            Width = 79
            Height = 28
            AutoSize = False
            Caption = 'Tempo de Serviço Ant.'
            WordWrap = True
          end
          object meses: TLabel
            Left = 216
            Top = 96
            Width = 36
            Height = 13
            Caption = 'meses'
          end
          object dtDataAdmissao: TCMDateTimePicker
            Left = 92
            Top = 9
            Width = 121
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
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clWindowText
            Font.Height = -9
            Font.Name = 'MS Sans Serif'
            Font.Style = []
            ParentFont = False
            ShowButton = True
            TabOrder = 0
            OnExit = dtDataAdmissaoExit
          end
          object dtDataDesligamento: TCMDateTimePicker
            Left = 92
            Top = 37
            Width = 121
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
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clWindowText
            Font.Height = -9
            Font.Name = 'MS Sans Serif'
            Font.Style = []
            ParentFont = False
            ShowButton = True
            TabOrder = 1
          end
          object edSalario: TEditNum
            Left = 92
            Top = 61
            Width = 121
            Height = 21
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clWindowText
            Font.Height = -9
            Font.Name = 'MS Sans Serif'
            Font.Style = []
            ParentFont = False
            TabOrder = 2
            Text = 'edSalario'
            IntDigits = 10
            Signal = False
            DecDigits = 2
            Numeric = True
          end
          object grpMesAnoContrib: TGroupBox
            Left = 8
            Top = 184
            Width = 313
            Height = 57
            Caption = 'Último mês de contribuição'
            TabOrder = 3
            object cmbMesRef: TComboBox
              Left = 6
              Top = 21
              Width = 187
              Height = 21
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clWindowText
              Font.Height = -9
              Font.Name = 'MS Sans Serif'
              Font.Style = []
              ItemHeight = 13
              ParentFont = False
              TabOrder = 0
              Text = 'cmbMesRef'
              Items.Strings = (
                'janeiro'
                'fevereiro'
                'março'
                'abril'
                'maio'
                'junho'
                'julho'
                'agosto'
                'setembro '
                'outubro'
                'novembro'
                'dezembro'
                'Contribuição sobre 13º')
            end
            object spedAnoRef: TSpinEdit
              Left = 198
              Top = 21
              Width = 55
              Height = 22
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clWindowText
              Font.Height = -9
              Font.Name = 'MS Sans Serif'
              Font.Style = []
              MaxLength = 4
              MaxValue = 0
              MinValue = 0
              ParentFont = False
              TabOrder = 1
              Value = 1998
            end
          end
          object edTempoServAnt: TEditNum
            Left = 92
            Top = 87
            Width = 121
            Height = 21
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clWindowText
            Font.Height = -9
            Font.Name = 'MS Sans Serif'
            Font.Style = []
            ParentFont = False
            TabOrder = 4
            Text = 'edTempoServAnt'
            IntDigits = 10
            Signal = False
            DecDigits = 0
            Numeric = True
          end
          object dtDataInscricao: TCMDateTimePicker
            Left = 290
            Top = 9
            Width = 121
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
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clWindowText
            Font.Height = -9
            Font.Name = 'MS Sans Serif'
            Font.Style = []
            ParentFont = False
            ShowButton = True
            TabOrder = 5
          end
          object dtDataReinscricao: TCMDateTimePicker
            Left = 290
            Top = 37
            Width = 121
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
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clWindowText
            Font.Height = -9
            Font.Name = 'MS Sans Serif'
            Font.Style = []
            ParentFont = False
            ShowButton = True
            TabOrder = 6
          end
          object GroupBox2: TGroupBox
            Left = 8
            Top = 120
            Width = 313
            Height = 57
            TabOrder = 7
            object chkResgPoupanca: TCheckBox
              Left = 12
              Top = 10
              Width = 280
              Height = 17
              Alignment = taLeftJustify
              Caption = 'Participante recebeu Reserva de Poupança'
              TabOrder = 0
            end
            object chkContribuiu: TCheckBox
              Left = 12
              Top = 34
              Width = 280
              Height = 17
              Alignment = taLeftJustify
              Caption = 'Participante já contribuiu para Fundação'
              TabOrder = 1
              OnClick = chkContribuiuClick
            end
          end
        end
      end
      object tbsManutencao: TTabSheet
        Caption = 'Dados da Manutenção do Participante'
        object Panel2: TPanel
          Left = 0
          Top = 0
          Width = 782
          Height = 350
          Align = alClient
          BevelOuter = bvLowered
          TabOrder = 0
          object lblSitNovaPatro: TLabel
            Left = 7
            Top = 177
            Width = 186
            Height = 13
            Caption = 'Nova Situação na Patrocinadora'
          end
          object Label12: TLabel
            Left = 7
            Top = 213
            Width = 139
            Height = 13
            Caption = 'Nova Situação no Plano'
          end
          object Label13: TLabel
            Left = 7
            Top = 38
            Width = 90
            Height = 13
            Caption = 'Data do Evento'
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clWindowText
            Font.Height = -9
            Font.Name = 'MS Sans Serif'
            Font.Style = [fsBold]
            ParentFont = False
          end
          object Label14: TLabel
            Left = 7
            Top = 249
            Width = 163
            Height = 13
            Caption = 'Nova Situação na Fundação'
          end
          object Label15: TLabel
            Left = 7
            Top = 85
            Width = 32
            Height = 13
            Caption = 'Nível'
          end
          object Label16: TLabel
            Left = 98
            Top = 85
            Width = 34
            Height = 13
            Caption = 'Cargo'
          end
          object lblBeneficio: TLabel
            Left = 703
            Top = 68
            Width = 229
            Height = 13
            Caption = 'Benefício a Requerer Após Manutenção'
            Visible = False
          end
          object Label17: TLabel
            Left = 7
            Top = 121
            Width = 32
            Height = 13
            Caption = 'Nível'
          end
          object Label18: TLabel
            Left = 98
            Top = 121
            Width = 113
            Height = 13
            Caption = 'Cargo de Confiança'
          end
          object Label19: TLabel
            Left = 481
            Top = 72
            Width = 115
            Height = 13
            Caption = 'Sal. de Manutenção'
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clWindowText
            Font.Height = -9
            Font.Name = 'MS Sans Serif'
            Font.Style = [fsBold]
            ParentFont = False
          end
          object lblDataDemissao: TLabel
            Left = 111
            Top = 38
            Width = 104
            Height = 13
            Caption = 'Data de Demissão'
          end
          object Label20: TLabel
            Left = 7
            Top = 2
            Width = 80
            Height = 13
            Caption = 'Patrocinadora'
          end
          object Label21: TLabel
            Left = 224
            Top = 39
            Width = 48
            Height = 13
            Caption = 'Reserva'
          end
          object lblItemSal: TLabel
            Left = 355
            Top = 111
            Width = 180
            Height = 13
            Caption = 'Itens de Composição do Salário'
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clWindowText
            Font.Height = -9
            Font.Name = 'MS Sans Serif'
            Font.Style = [fsBold]
            ParentFont = False
          end
          object PnlOpcao: TPanel
            Left = 349
            Top = 60
            Width = 109
            Height = 49
            BevelOuter = bvNone
            TabOrder = 15
            object Label23: TLabel
              Left = 8
              Top = 14
              Width = 91
              Height = 13
              Caption = 'noturno (meses)'
            end
            object Label22: TLabel
              Left = 8
              Top = 1
              Width = 93
              Height = 13
              Caption = 'Opção adicional'
            end
            object EdtOpcao: TEdit
              Left = 8
              Top = 28
              Width = 87
              Height = 21
              TabOrder = 0
            end
          end
          object dblkpcmbSitFunc: TwwDBLookupCombo
            Left = 7
            Top = 191
            Width = 321
            Height = 21
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clWindowText
            Font.Height = -9
            Font.Name = 'MS Sans Serif'
            Font.Style = []
            DropDownAlignment = taLeftJustify
            Selected.Strings = (
              'DESCRICAO'#9'50'#9'Situação do Participante na Patrocinadora')
            DataField = 'IDSITFUNC'
            LookupTable = qrySitFunc
            LookupField = 'IDSITFUNC'
            Options = [loTitles]
            ParentFont = False
            TabOrder = 9
            AutoDropDown = True
            ShowButton = True
            AllowClearKey = True
          end
          object dblkpcmbSitPlanoPrev: TwwDBLookupCombo
            Left = 7
            Top = 227
            Width = 321
            Height = 21
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clWindowText
            Font.Height = -9
            Font.Name = 'MS Sans Serif'
            Font.Style = []
            DropDownAlignment = taLeftJustify
            Selected.Strings = (
              'DESCRICAO'#9'50'#9'Situação do Participante no Plano')
            DataField = 'IDSITPLANOPREV'
            LookupTable = qrySitPlanoPrev
            LookupField = 'IDSITPLANOPREV'
            Options = [loTitles]
            ParentFont = False
            TabOrder = 10
            AutoDropDown = True
            ShowButton = True
            AllowClearKey = True
          end
          object dtEvento: TCMDateTimePicker
            Left = 7
            Top = 51
            Width = 98
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
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clWindowText
            Font.Height = -9
            Font.Name = 'MS Sans Serif'
            Font.Style = []
            ParentFont = False
            ShowButton = True
            TabOrder = 1
          end
          object dblkpcmbSitPart: TwwDBLookupCombo
            Left = 7
            Top = 263
            Width = 321
            Height = 21
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clWindowText
            Font.Height = -9
            Font.Name = 'MS Sans Serif'
            Font.Style = []
            DropDownAlignment = taLeftJustify
            Selected.Strings = (
              'DESCRICAO'#9'50'#9'Situação do Participante na Fundação')
            DataField = 'IDSITPART'
            LookupTable = qrySitPart
            LookupField = 'IDSITPART'
            Options = [loTitles]
            ParentFont = False
            TabOrder = 11
            AutoDropDown = True
            ShowButton = True
            AllowClearKey = True
          end
          object dblkpcmbCargo: TwwDBLookupCombo
            Left = 98
            Top = 98
            Width = 243
            Height = 21
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clWindowText
            Font.Height = -9
            Font.Name = 'MS Sans Serif'
            Font.Style = []
            DropDownAlignment = taLeftJustify
            Selected.Strings = (
              'TITULO'#9'30'#9'Cargo'
              'IDCARGOEXT'#9'5'#9'Identificador')
            LookupTable = qryCargoExt
            LookupField = 'TITULO'
            Options = [loTitles]
            ParentFont = False
            TabOrder = 4
            AutoDropDown = True
            ShowButton = True
            AllowClearKey = True
          end
          object dblkpcmbBeneficio: TwwDBLookupCombo
            Left = 703
            Top = 82
            Width = 320
            Height = 21
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clWindowText
            Font.Height = -9
            Font.Name = 'MS Sans Serif'
            Font.Style = []
            DropDownAlignment = taLeftJustify
            Selected.Strings = (
              'NOME'#9'60'#9'Benefício'
              'IDBENEFICIO'#9'3'#9'Identificador')
            LookupTable = qryBenef
            LookupField = 'IDBENEFICIO'
            Options = [loTitles]
            ParentFont = False
            TabOrder = 12
            Visible = False
            AutoDropDown = True
            ShowButton = True
            AllowClearKey = True
          end
          object dblkpcmbCargoConf: TwwDBLookupCombo
            Left = 98
            Top = 134
            Width = 243
            Height = 21
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clWindowText
            Font.Height = -9
            Font.Name = 'MS Sans Serif'
            Font.Style = []
            DropDownAlignment = taLeftJustify
            Selected.Strings = (
              'TITULO'#9'30'#9'Cargo de Confiançc')
            LookupTable = qryCargoConf
            LookupField = 'TITULO'
            Options = [loTitles]
            ParentFont = False
            TabOrder = 6
            AutoDropDown = True
            ShowButton = True
            AllowClearKey = True
          end
          object reSalarioManut: TcmMaskEditDlg
            Left = 481
            Top = 88
            Width = 158
            Height = 21
            Hint = 
              'Clique no botão à direita para calcular o valor do Salário de Ma' +
              'nutenção'
            ParentShowHint = False
            ShowHint = True
            TabOrder = 7
            OnBtnClick = reSalarioManutBtnClick
            BtnGlyph.Data = {
              76010000424D7601000000000000760000002800000020000000100000000100
              0400000000000001000000000000000000001000000010000000000000000000
              800000800000008080008000000080008000808000007F7F7F00BFBFBF000000
              FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00337000000000
              73333337777777773F333308888888880333337F3F3F3FFF7F33330808089998
              0333337F737377737F333308888888880333337F3F3F3F3F7F33330808080808
              0333337F737373737F333308888888880333337F3F3F3F3F7F33330808080808
              0333337F737373737F333308888888880333337F3F3F3F3F7F33330808080808
              0333337F737373737F333308888888880333337F3FFFFFFF7F33330800000008
              0333337F7777777F7F333308000E0E080333337F7FFFFF7F7F33330800000008
              0333337F777777737F333308888888880333337F333333337F33330888888888
              03333373FFFFFFFF733333700000000073333337777777773333}
            BtnNumGlyphs = 2
            BtnWidth = 17
          end
          object edNivel: TEdit
            Left = 7
            Top = 98
            Width = 89
            Height = 21
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clWindowText
            Font.Height = -9
            Font.Name = 'MS Sans Serif'
            Font.Style = []
            ParentFont = False
            TabOrder = 3
            Text = 'edNivel'
          end
          object edNivelConf: TEdit
            Left = 7
            Top = 134
            Width = 89
            Height = 21
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clWindowText
            Font.Height = -9
            Font.Name = 'MS Sans Serif'
            Font.Style = []
            ParentFont = False
            TabOrder = 5
            Text = 'edNivelConf'
          end
          object dtDataDemissao: TCMDateTimePicker
            Left = 111
            Top = 51
            Width = 103
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
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clWindowText
            Font.Height = -9
            Font.Name = 'MS Sans Serif'
            Font.Style = []
            ParentFont = False
            ShowButton = True
            TabOrder = 2
          end
          object grpOpcoesElegivel: TGroupBox
            Left = 355
            Top = 5
            Width = 388
            Height = 53
            Caption = 'Opções do Elegível'
            TabOrder = 8
            TabStop = True
            object lblNomeValorBase1: TLabel
              Left = 10
              Top = 13
              Width = 49
              Height = 13
              Caption = 'Opção 1'
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clWindowText
              Font.Height = -9
              Font.Name = 'MS Sans Serif'
              Font.Style = [fsBold]
              ParentFont = False
            end
            object lblNomeValorBase3: TLabel
              Left = 247
              Top = 13
              Width = 49
              Height = 13
              Caption = 'Opção 3'
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clWindowText
              Font.Height = -9
              Font.Name = 'MS Sans Serif'
              Font.Style = [fsBold]
              ParentFont = False
            end
            object lblNomeValorBase2: TLabel
              Left = 129
              Top = 13
              Width = 49
              Height = 13
              Caption = 'Opção 2'
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clWindowText
              Font.Height = -9
              Font.Name = 'MS Sans Serif'
              Font.Style = [fsBold]
              ParentFont = False
            end
            object edOpcao1: TcmMaskEditDlg
              Left = 10
              Top = 29
              Width = 111
              Height = 21
              Hint = 'Clique no botão à direita para calcular o valor da Opção'
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clWindowText
              Font.Height = -9
              Font.Name = 'MS Sans Serif'
              Font.Style = []
              ParentFont = False
              ParentShowHint = False
              ShowHint = True
              TabOrder = 0
              BtnGlyph.Data = {
                76010000424D7601000000000000760000002800000020000000100000000100
                0400000000000001000000000000000000001000000010000000000000000000
                800000800000008080008000000080008000808000007F7F7F00BFBFBF000000
                FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00337000000000
                73333337777777773F333308888888880333337F3F3F3FFF7F33330808089998
                0333337F737377737F333308888888880333337F3F3F3F3F7F33330808080808
                0333337F737373737F333308888888880333337F3F3F3F3F7F33330808080808
                0333337F737373737F333308888888880333337F3F3F3F3F7F33330808080808
                0333337F737373737F333308888888880333337F3FFFFFFF7F33330800000008
                0333337F7777777F7F333308000E0E080333337F7FFFFF7F7F33330800000008
                0333337F777777737F333308888888880333337F333333337F33330888888888
                03333373FFFFFFFF733333700000000073333337777777773333}
              BtnNumGlyphs = 2
              BtnWidth = 17
            end
            object edOpcao2: TcmMaskEditDlg
              Left = 129
              Top = 29
              Width = 111
              Height = 21
              Hint = 'Clique no botão à direita para calcular o valor da Opção'
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clWindowText
              Font.Height = -9
              Font.Name = 'MS Sans Serif'
              Font.Style = []
              ParentFont = False
              ParentShowHint = False
              ShowHint = True
              TabOrder = 1
              BtnGlyph.Data = {
                76010000424D7601000000000000760000002800000020000000100000000100
                0400000000000001000000000000000000001000000010000000000000000000
                800000800000008080008000000080008000808000007F7F7F00BFBFBF000000
                FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00337000000000
                73333337777777773F333308888888880333337F3F3F3FFF7F33330808089998
                0333337F737377737F333308888888880333337F3F3F3F3F7F33330808080808
                0333337F737373737F333308888888880333337F3F3F3F3F7F33330808080808
                0333337F737373737F333308888888880333337F3F3F3F3F7F33330808080808
                0333337F737373737F333308888888880333337F3FFFFFFF7F33330800000008
                0333337F7777777F7F333308000E0E080333337F7FFFFF7F7F33330800000008
                0333337F777777737F333308888888880333337F333333337F33330888888888
                03333373FFFFFFFF733333700000000073333337777777773333}
              BtnNumGlyphs = 2
              BtnWidth = 17
            end
            object edOpcao3: TcmMaskEditDlg
              Left = 247
              Top = 29
              Width = 111
              Height = 21
              Hint = 'Clique no botão à direita para calcular o valor da Opção'
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clWindowText
              Font.Height = -9
              Font.Name = 'MS Sans Serif'
              Font.Style = []
              ParentFont = False
              ParentShowHint = False
              ShowHint = True
              TabOrder = 2
              BtnGlyph.Data = {
                76010000424D7601000000000000760000002800000020000000100000000100
                0400000000000001000000000000000000001000000010000000000000000000
                800000800000008080008000000080008000808000007F7F7F00BFBFBF000000
                FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00337000000000
                73333337777777773F333308888888880333337F3F3F3FFF7F33330808089998
                0333337F737377737F333308888888880333337F3F3F3F3F7F33330808080808
                0333337F737373737F333308888888880333337F3F3F3F3F7F33330808080808
                0333337F737373737F333308888888880333337F3F3F3F3F7F33330808080808
                0333337F737373737F333308888888880333337F3FFFFFFF7F33330800000008
                0333337F7777777F7F333308000E0E080333337F7FFFFF7F7F33330800000008
                0333337F777777737F333308888888880333337F333333337F33330888888888
                03333373FFFFFFFF733333700000000073333337777777773333}
              BtnNumGlyphs = 2
              BtnWidth = 17
            end
          end
          object dblkpcmbPatro: TwwDBLookupCombo
            Left = 7
            Top = 16
            Width = 333
            Height = 21
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clWindowText
            Font.Height = -9
            Font.Name = 'MS Sans Serif'
            Font.Style = []
            DropDownAlignment = taLeftJustify
            Selected.Strings = (
              'NOME'#9'60'#9'Patrocinadora')
            LookupTable = qryPatro
            LookupField = 'IDPESSOA'
            Options = [loTitles]
            ParentFont = False
            TabOrder = 0
            AutoDropDown = True
            ShowButton = True
            AllowClearKey = True
            OnCloseUp = dblkpcmbPatroCloseUp
          end
          object edReserva: TcmMaskEditDlg
            Left = 223
            Top = 53
            Width = 117
            Height = 21
            Hint = 'Clique no botão à direita para calcular o valor da Reserva'
            ParentShowHint = False
            ShowHint = True
            TabOrder = 13
            OnBtnClick = edReservaBtnClick
            BtnGlyph.Data = {
              76010000424D7601000000000000760000002800000020000000100000000100
              0400000000000001000000000000000000001000000010000000000000000000
              800000800000008080008000000080008000808000007F7F7F00BFBFBF000000
              FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00337000000000
              73333337777777773F333308888888880333337F3F3F3FFF7F33330808089998
              0333337F737377737F333308888888880333337F3F3F3F3F7F33330808080808
              0333337F737373737F333308888888880333337F3F3F3F3F7F33330808080808
              0333337F737373737F333308888888880333337F3F3F3F3F7F33330808080808
              0333337F737373737F333308888888880333337F3FFFFFFF7F33330800000008
              0333337F7777777F7F333308000E0E080333337F7FFFFF7F7F33330800000008
              0333337F777777737F333308888888880333337F333333337F33330888888888
              03333373FFFFFFFF733333700000000073333337777777773333}
            BtnNumGlyphs = 2
            BtnWidth = 17
          end
          object grdItensSal: TwwDBGrid
            Left = 356
            Top = 125
            Width = 409
            Height = 162
            Selected.Strings = (
              'FLGSELECIONADO'#9'10'#9'Selecionar'
              'descricao'#9'28'#9'Descrição'
              'FUNCAO'#9'27'#9'Função'
              'percentual'#9'10'#9'Percentual'
              'VALOR'#9'10'#9'Valor'
              'DATAINICIO'#9'10'#9'Dt. Inicio'
              'DATAFINAL'#9'10'#9'Dt. Final'
              'MODO'#9'21'#9'Modo'
              'QTDEMINUTOS'#9'10'#9'Qtd. Minutos')
            IniAttributes.Delimiter = ';;'
            TitleColor = clBtnFace
            FixedCols = 0
            ShowHorzScrollBar = True
            DataSource = dsitenssal
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clWindowText
            Font.Height = -9
            Font.Name = 'MS Sans Serif'
            Font.Style = []
            ParentFont = False
            TabOrder = 14
            TitleAlignment = taLeftJustify
            TitleFont.Charset = DEFAULT_CHARSET
            TitleFont.Color = clWindowText
            TitleFont.Height = -9
            TitleFont.Name = 'MS Sans Serif'
            TitleFont.Style = []
            TitleLines = 1
            TitleButtons = False
            IndicatorColor = icBlack
          end
        end
      end
      object tbsResultado: TTabSheet
        Caption = 'Resultado da Simulação'
        object memResult: TRichEdit
          Left = 0
          Top = 0
          Width = 782
          Height = 350
          Align = alClient
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -12
          Font.Name = 'Courier New'
          Font.Style = []
          ParentFont = False
          ReadOnly = True
          ScrollBars = ssVertical
          TabOrder = 0
        end
      end
    end
  end
  inherited Dock971: TDock97
    Top = 497
    Width = 792
    inherited tb97Fundo: TToolbar97
      Left = 454
      DockPos = 454
      inherited sep1: TToolbarSep97
        Left = 241
      end
      inherited bbtnSair: TBitBtn
        Left = 160
      end
      inherited bbtnAjuda: TmaHelpBitBtn
        Left = 243
      end
      object bbtnSalvar: TBitBtn
        Left = 0
        Top = 0
        Width = 80
        Height = 33
        Hint = 'Salvar a Consulta como arquivo'
        Caption = '&Salvar'
        Default = True
        Enabled = False
        ParentShowHint = False
        ShowHint = True
        TabOrder = 2
        OnClick = bbtnSalvarClick
        Glyph.Data = {
          76010000424D7601000000000000760000002800000020000000100000000100
          0400000000000001000000000000000000001000000010000000000000000000
          800000800000008080008000000080008000808000007F7F7F00BFBFBF000000
          FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00333333333333
          333333FFFFFFFFFFFFF33000077777770033377777777777773F000007888888
          00037F3337F3FF37F37F00000780088800037F3337F77F37F37F000007800888
          00037F3337F77FF7F37F00000788888800037F3337777777337F000000000000
          00037F3FFFFFFFFFFF7F00000000000000037F77777777777F7F000FFFFFFFFF
          00037F7F333333337F7F000FFFFFFFFF00037F7F333333337F7F000FFFFFFFFF
          00037F7F333333337F7F000FFFFFFFFF00037F7F333333337F7F000FFFFFFFFF
          00037F7F333333337F7F000FFFFFFFFF07037F7F33333333777F000FFFFFFFFF
          0003737FFFFFFFFF7F7330099999999900333777777777777733}
        NumGlyphs = 2
        Spacing = 2
      end
      object bbtnImprimir: TBitBtn
        Left = 80
        Top = 0
        Width = 80
        Height = 33
        Hint = 'Imprimir a Consulta'
        Caption = '&Imprimir'
        Default = True
        Enabled = False
        ParentShowHint = False
        ShowHint = True
        TabOrder = 3
        OnClick = bbtnImprimirClick
        Glyph.Data = {
          76010000424D7601000000000000760000002800000020000000100000000100
          0400000000000001000000000000000000001000000010000000000000000000
          800000800000008080008000000080008000808000007F7F7F00BFBFBF000000
          FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00300000000000
          00033FFFFFFFFFFFFFFF0888888888888880777777777777777F088888888888
          8880777777777777777F0000000000000000FFFFFFFFFFFFFFFF0F8F8F8F8F8F
          8F80777777777777777F08F8F8F8F8F8F9F0777777777777777F0F8F8F8F8F8F
          8F807777777777777F7F0000000000000000777777777777777F3330FFFFFFFF
          03333337F3FFFF3F7F333330F0000F0F03333337F77773737F333330FFFFFFFF
          03333337F3FF3FFF7F333330F00F000003333337F773777773333330FFFF0FF0
          33333337F3FF7F3733333330F08F0F0333333337F7737F7333333330FFFF0033
          33333337FFFF7733333333300000033333333337777773333333}
        NumGlyphs = 2
        Spacing = 2
      end
    end
  end
  inherited ivTradutor: TIvExtendedTranslator
    Left = 91
    Top = 3
    TargetsData = (
      1
      1
      (
        ''
        'Text'
        0))
  end
  object qryPlanPrev: TwwQuery
    DatabaseName = 'BaseDados'
    SQL.Strings = (
      'SELECT IDPLANOPREV,NOME'
      'FROM   PLANPREV'
      
        'WHERE  IDPLANOPREV IN (SELECT PLP.IDPLANOPREV FROM PLANPREVPATRO' +
        ' PLP, PATRO P'
      '                       WHERE   P.IDFUNDACAO  = :IDFUNDACAO'
      '                       AND     PLP.IDPESSJUR = P.IDPESSOA )'
      'ORDER BY NOME'
      ' '
      ' ')
    ValidateWithMask = True
    Left = 381
    Top = 32
    ParamData = <
      item
        DataType = ftInteger
        Name = 'IDFUNDACAO'
        ParamType = ptUnknown
      end>
  end
  object qryAux: TwwQuery
    DatabaseName = 'BaseDados'
    ValidateWithMask = True
    Left = 150
    Top = 235
  end
  object qryContribAPagar: TwwQuery
    CachedUpdates = True
    DatabaseName = 'BaseDados'
    SQL.Strings = (
      
        'SELECT CPP.IDCONTRIBUICAO,    CPP.VALORBASE1,  CPP.VALORBASE2,  ' +
        '      CPP.VALORBASE3,'
      '       C.NOME,          -1.00 AS IDEVENTOGERADOR,'
      
        '       '#39'                                                        ' +
        '    '#39' AS NOMEEVENTOGERADOR,'
      
        '       '#39'                                                        ' +
        '    '#39' AS NOMEVALORBASE1,'
      
        '       '#39'                                                        ' +
        '    '#39' AS NOMEVALORBASE2,'
      
        '       '#39'                                                        ' +
        '    '#39' AS NOMEVALORBASE3,'
      '       '#39'          '#39' AS DATAFINAL,'
      '       1.00 AS ELEGIBILIDADE,'
      '       '#39'0000/00'#39' AS MESREFERENCIA,'
      
        '       '#39'                                                        ' +
        '    '#39' AS NOMEALTERADOR1,'
      
        '       '#39'                                                        ' +
        '    '#39' AS NOMEALTERADOR2,'
      
        '       '#39'                                                        ' +
        '    '#39' AS NOMEALTERADOR3,'
      '       0.00 AS VALORALTERADOR1,'
      '       0.00 AS VALORALTERADOR2,'
      '       0.00 AS VALORALTERADOR3,'
      '       0.00 AS VLRCONTCALCULADO'
      'FROM  CONTRIBPREVPARTP CPP, CONTRIBUICAO C'
      'WHERE CPP.IDPLANOPREV = -1'
      'AND   CPP.IDPESSJUR   = -1'
      'AND   CPP.IDPESSOA    = -1'
      'AND   CPP.SEQPROPOSTA = -1'
      'AND   C.IDCONTRIBUICAO = CPP.IDCONTRIBUICAO'
      'ORDER BY NOMEEVENTOGERADOR'
      ' '
      ' '
      ' ')
    UpdateObject = updContribAPagar
    ValidateWithMask = True
    Left = 197
    Top = 37
    object qryContribAPagarIDCONTRIBUICAO: TFloatField
      FieldName = 'IDCONTRIBUICAO'
    end
    object qryContribAPagarVALORBASE1: TFloatField
      FieldName = 'VALORBASE1'
    end
    object qryContribAPagarVALORBASE2: TFloatField
      FieldName = 'VALORBASE2'
    end
    object qryContribAPagarVALORBASE3: TFloatField
      FieldName = 'VALORBASE3'
    end
    object qryContribAPagarNOME: TStringField
      FieldName = 'NOME'
      Size = 60
    end
    object qryContribAPagarNOMEEVENTOGERADOR: TStringField
      FieldName = 'NOMEEVENTOGERADOR'
      Size = 60
    end
    object qryContribAPagarIDEVENTOGERADOR: TFloatField
      FieldName = 'IDEVENTOGERADOR'
    end
    object qryContribAPagarNOMEVALORBASE1: TStringField
      DisplayWidth = 60
      FieldName = 'NOMEVALORBASE1'
      Size = 60
    end
    object qryContribAPagarNOMEVALORBASE2: TStringField
      FieldName = 'NOMEVALORBASE2'
      Size = 60
    end
    object qryContribAPagarNOMEVALORBASE3: TStringField
      FieldName = 'NOMEVALORBASE3'
      Size = 60
    end
    object qryContribAPagarELEGIBILIDADE: TFloatField
      FieldName = 'ELEGIBILIDADE'
    end
    object qryContribAPagarDATAFINAL: TStringField
      FieldName = 'DATAFINAL'
      Size = 10
    end
    object qryContribAPagarMESREFERENCIA: TStringField
      FieldName = 'MESREFERENCIA'
      Size = 7
    end
    object qryContribAPagarNOMEALTERADOR1: TStringField
      FieldName = 'NOMEALTERADOR1'
      Size = 60
    end
    object qryContribAPagarNOMEALTERADOR2: TStringField
      FieldName = 'NOMEALTERADOR2'
      Size = 60
    end
    object qryContribAPagarNOMEALTERADOR3: TStringField
      FieldName = 'NOMEALTERADOR3'
      Size = 60
    end
    object qryContribAPagarVALORALTERADOR1: TFloatField
      FieldName = 'VALORALTERADOR1'
    end
    object qryContribAPagarVALORALTERADOR2: TFloatField
      FieldName = 'VALORALTERADOR2'
    end
    object qryContribAPagarVALORALTERADOR3: TFloatField
      FieldName = 'VALORALTERADOR3'
    end
    object qryContribAPagarVLRCONTCALCULADO: TFloatField
      FieldName = 'VLRCONTCALCULADO'
    end
  end
  object updContribAPagar: TUpdateSQL
    ModifySQL.Strings = (
      'update CONTRIBPREVPARTP'
      'set'
      '  IDCONTRIBUICAO = :IDCONTRIBUICAO,'
      '  VALORBASE1 = :VALORBASE1,'
      '  VALORBASE2 = :VALORBASE2,'
      '  VALORBASE3 = :VALORBASE3,'
      '  NOME = :NOME,'
      '  IDEVENTOGERADOR = :IDEVENTOGERADOR,'
      '  NOMEEVENTOGERADOR = :NOMEEVENTOGERADOR,'
      '  NOMEVALORBASE1 = :NOMEVALORBASE1,'
      '  NOMEVALORBASE2 = :NOMEVALORBASE2,'
      '  NOMEVALORBASE3 = :NOMEVALORBASE3,'
      '  DATAFINAL = :DATAFINAL,'
      '  ELEGIBILIDADE = :ELEGIBILIDADE,'
      '  MESREFERENCIA = :MESREFERENCIA,'
      '  NOMEALTERADOR1 = :NOMEALTERADOR1,'
      '  NOMEALTERADOR2 = :NOMEALTERADOR2,'
      '  NOMEALTERADOR3 = :NOMEALTERADOR3,'
      '  VALORALTERADOR1 = :VALORALTERADOR1,'
      '  VALORALTERADOR2 = :VALORALTERADOR2,'
      '  VALORALTERADOR3 = :VALORALTERADOR3'
      'where'
      '  IDCONTRIBUICAO = :OLD_IDCONTRIBUICAO'
      ' ')
    InsertSQL.Strings = (
      'insert into CONTRIBPREVPARTP'
      '  (IDCONTRIBUICAO, VALORBASE1, VALORBASE2, VALORBASE3,  '
      
        '   NOME, IDEVENTOGERADOR, NOMEEVENTOGERADOR, NOMEVALORBASE1, NOM' +
        'EVALORBASE2, '
      
        '   NOMEVALORBASE3, DATAFINAL, ELEGIBILIDADE, MESREFERENCIA, NOME' +
        'ALTERADOR1, '
      
        '   NOMEALTERADOR2, NOMEALTERADOR3, VALORALTERADOR1, VALORALTERAD' +
        'OR2, VALORALTERADOR3)'
      'values'
      '  (:IDCONTRIBUICAO, :VALORBASE1, :VALORBASE2, :VALORBASE3,  '
      
        '   :NOME, :IDEVENTOGERADOR, :NOMEEVENTOGERADOR, :NOMEVALORBASE1,' +
        ' :NOMEVALORBASE2, '
      
        '   :NOMEVALORBASE3, :DATAFINAL, :ELEGIBILIDADE, :MESREFERENCIA, ' +
        ':NOMEALTERADOR1, '
      
        '   :NOMEALTERADOR2, :NOMEALTERADOR3, :VALORALTERADOR1, :VALORALT' +
        'ERADOR2, '
      '   :VALORALTERADOR3)'
      ' ')
    DeleteSQL.Strings = (
      'delete from CONTRIBPREVPARTP'
      'where'
      '  IDCONTRIBUICAO = :OLD_IDCONTRIBUICAO')
    Left = 138
    Top = 65530
  end
  object savedlg: TSaveDialog
    Left = 13
    Top = 439
  end
  object printdlg: TPrintDialog
    Left = 55
    Top = 434
  end
  object qrySitPart: TwwQuery
    DatabaseName = 'BaseDados'
    SQL.Strings = (
      'SELECT SIT.DESCRICAO , SIT.IDSITPART, SIT.FLGINTERNO'
      'FROM   SITPART SIT , EVENTOXSITPART E'
      'WHERE  SIT.IDSITPART = E.IDSITPART'
      'AND    E.IDEVENTOGERADOR  = :IDEVENTOGERADOR'
      'ORDER BY SIT.DESCRICAO')
    ValidateWithMask = True
    Left = 729
    Top = 420
    ParamData = <
      item
        DataType = ftInteger
        Name = 'IDEVENTOGERADOR'
        ParamType = ptUnknown
      end>
  end
  object qrySitPlanoPrev: TwwQuery
    DatabaseName = 'BaseDados'
    SQL.Strings = (
      'SELECT SIT.DESCRICAO , SIT.IDSITPLANOPREV, SIT.FLGINTERNO'
      'FROM   SITPLANOPREV SIT , EVENTOXSITPLAPREV E'
      'WHERE  SIT.IDSITPLANOPREV = E.IDSITPLANOPREV'
      'AND    E.IDEVENTOGERADOR  = :IDEVENTOGERADOR'
      'ORDER BY SIT.DESCRICAO'
      '')
    ValidateWithMask = True
    Left = 726
    Top = 367
    ParamData = <
      item
        DataType = ftInteger
        Name = 'IDEVENTOGERADOR'
        ParamType = ptUnknown
      end>
  end
  object qrySitFunc: TwwQuery
    DatabaseName = 'BaseDados'
    SQL.Strings = (
      
        'SELECT DISTINCT SIT.DESCRICAO , SIT.IDSITFUNC, SIT.FLGINTERNO, S' +
        'IT.TIPOSIT'
      'FROM   SITFUNC SIT , EVENTOXSITFUNC E'
      'WHERE  SIT.IDSITFUNC = E.IDSITFUNC'
      'AND    E.IDEVENTOGERADOR = :IDEVENTOGERADOR'
      'oRDER BY SIT.DESCRICAO'
      '')
    ValidateWithMask = True
    Left = 728
    Top = 320
    ParamData = <
      item
        DataType = ftInteger
        Name = 'IDEVENTOGERADOR'
        ParamType = ptUnknown
      end>
  end
  object qryCargoConf: TwwQuery
    DatabaseName = 'BaseDados'
    SQL.Strings = (
      'SELECT IDCARGOEXT, TITULO'
      'FROM    CARGOEXT'
      'ORDER BY IDCARGOEXT')
    ValidateWithMask = True
    Left = 733
    Top = 230
  end
  object qryCargoExt: TwwQuery
    DatabaseName = 'BaseDados'
    SQL.Strings = (
      'SELECT IDCARGOEXT, TITULO'
      'FROM    CARGOEXT'
      'ORDER BY IDCARGOEXT')
    ValidateWithMask = True
    Left = 729
    Top = 279
  end
  object qryBenef: TwwQuery
    DatabaseName = 'BaseDados'
    SQL.Strings = (
      'SELECT B.IDBENEFICIO, B.NOME, B.TIPOBENEFICIO '
      'FROM   BENEFICIO B, BENEFPLANPREV BP'
      'WHERE  BP.IDPLANOPREV = :IDPLANOPREV'
      'AND    BP.IDBENEFICIO = B.IDBENEFICIO'
      'AND    B.FLGDESTBENEF = '#39'P'#39
      'AND    BP.FLGREFERENCIA = 0'
      'AND    NOT (LOWER(B.NOME) LIKE '#39'%abono%'#39')'
      'AND    B.TIPOBENEFICIO IN (0, 8, 9, 10, 11, 12)'
      'ORDER BY B.NOME'
      '')
    ValidateWithMask = True
    Left = 731
    Top = 183
    ParamData = <
      item
        DataType = ftInteger
        Name = 'IDPLANOPREV'
        ParamType = ptUnknown
      end>
  end
  object qryPatro: TwwQuery
    DatabaseName = 'BaseDados'
    SQL.Strings = (
      
        'SELECT P.NOME, P.IDPESSOA,   PT.NOMEVALORBASE1,   PT.NOMEVALORBA' +
        'SE2,   PT.NOMEVALORBASE3,'
      
        '       PT.FLGOBRIGAOP2,      PT.FLGOBRIGAOP1,     PT.FLGOBRIGAOP' +
        '3,     PT.FLGEDITAOP1,'
      
        '       PT.FLGEDITAOP2,       PT.FLGEDITAOP3,      PT.IDREGRACALC' +
        'OP1,   PT.IDREGRACALCOP2,'
      
        '       PT.IDREGRACALCOP3,    PT.IDREGRAVALIDAOP1, PT.IDREGRAVALI' +
        'DAOP2, PT.IDREGRAVALIDAOP3,'
      '       PT.NUMOPCOES,         PT.IDRUBSALPARTICIP'
      'FROM PESSOA P, PATRO PT'
      'WHERE PT.IDPESSOA = P.IDPESSOA'
      'AND   PT.IDFUNDACAO = :IDFUNDACAO'
      'ORDER BY P.NOME'
      ' '
      ' ')
    ValidateWithMask = True
    Left = 741
    Top = 109
    ParamData = <
      item
        DataType = ftInteger
        Name = 'IDFUNDACAO'
        ParamType = ptUnknown
      end>
  end
  object qryParticipante: TwwQuery
    DatabaseName = 'BaseDados'
    SQL.Strings = (
      'SELECT P.NOME, PF.DATANASC, PF.SEXO,'
      '       EL.IDPESSOA, EL.IDPESSJUR, EL.MATRICULA, EL.DATAADMISSAO,'
      
        '       EL.TEMPOSERVANTERIOR, EL.VALORBASE1, EL.VALORBASE2, EL.VA' +
        'LORBASE3,'
      '       EL.IDCARGOEXT, EL.NIVEL,'
      '       PP.IDPLANOPREV, PP.SEQPROPOSTA, PP.DTINICIOINSC,'
      
        '       PP.DATACANCELAMENTO, PP.INSCRICAODATA, PP.SALPARTICIPACAO' +
        ', PP.INSCRICAONUMERO,'
      
        '       SP.FLGINTERNO, PP.IDSITPART, PP.IDSITPLANOPREV, EL.IDSITF' +
        'UNC, EL.FLGDIRETOR'
      
        'FROM   PESSOA P, PESSOAFISICA PF, ELEGPATRO EL, PARTPREVPLAN PP,' +
        ' SITPART SP'
      'WHERE  (EL.IDPESSJUR = :IDPESSJUR)'
      'AND    (EL.IDPESSOA = :IDPESSOA)'
      'AND    (PP.IDPLANOPREV = :IDPLANOPREV)'
      'AND    (EL.IDPESSOA     = PF.IDPESSOA)'
      'AND    (PF.IDPESSOA     = P.IDPESSOA)'
      'AND    (PP.IDPESSOA(+)  = EL.IDPESSOA)'
      'AND    (PP.IDPESSJUR(+) = EL.IDPESSJUR)'
      'AND    (SP.IDSITPART(+)    = PP.IDSITPART)'
      ' '
      ' '
      ' '
      ' ')
    ValidateWithMask = True
    Left = 661
    Top = 13
    ParamData = <
      item
        DataType = ftInteger
        Name = 'IDPESSJUR'
        ParamType = ptUnknown
      end
      item
        DataType = ftInteger
        Name = 'IDPESSOA'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'IDPLANOPREV'
        ParamType = ptUnknown
      end>
  end
  object qryEventosPlano: TwwQuery
    CachedUpdates = True
    DatabaseName = 'BaseDados'
    SQL.Strings = (
      'SELECT IDEVENTOGERADOR,IDREGRADTFIMEV, '#39'          '#39' AS DATAFINAL'
      'FROM   EVENTOSPLANO'
      'WHERE  IDPLANOPREV = :IDPLANOPREV')
    UpdateObject = updEventosPlano
    ValidateWithMask = True
    Left = 605
    Top = 109
    ParamData = <
      item
        DataType = ftInteger
        Name = 'IDPLANOPREV'
        ParamType = ptUnknown
      end>
  end
  object updEventosPlano: TUpdateSQL
    ModifySQL.Strings = (
      'update EVENTOSPLANO'
      'set'
      '  IDEVENTOGERADOR = :IDEVENTOGERADOR,'
      '  IDREGRADTFIMEV = :IDREGRADTFIMEV,'
      '  DATAFINAL = :DATAFINAL'
      'where'
      '  IDEVENTOGERADOR = :OLD_IDEVENTOGERADOR')
    InsertSQL.Strings = (
      'insert into EVENTOSPLANO'
      '  (IDEVENTOGERADOR, IDREGRADTFIMEV, DATAFINAL)'
      'values'
      '  (:IDEVENTOGERADOR, :IDREGRADTFIMEV, :DATAFINAL)')
    DeleteSQL.Strings = (
      'delete from EVENTOSPLANO'
      'where'
      '  IDEVENTOGERADOR = :OLD_IDEVENTOGERADOR')
    Left = 651
    Top = 43
  end
  object qryEvento: TwwQuery
    DatabaseName = 'BaseDados'
    SQL.Strings = (
      'SELECT IDEVENTOGERADOR, NOME, FLGINTERNO'
      'FROM EVENTOGERADOR'
      
        'WHERE FLGINTERNO IN ('#39'DC'#39','#39'DM'#39','#39'DS'#39','#39'MP'#39','#39'AF'#39','#39'AR'#39','#39'RA'#39','#39'IP'#39','#39'RM' +
        #39','#39'PD'#39' )'
      'AND   IDFUNDACAO = :IDFUNDACAO'
      'ORDER BY NOME'
      ' ')
    ValidateWithMask = True
    Left = 13
    Top = 117
    ParamData = <
      item
        DataType = ftInteger
        Name = 'IDFUNDACAO'
        ParamType = ptUnknown
      end>
  end
  object qryContribuicoes: TwwQuery
    DatabaseName = 'BaseDados'
    ValidateWithMask = True
    Left = 733
    Top = 21
  end
  object qryAlteradores: TwwQuery
    DatabaseName = 'BaseDados'
    ValidateWithMask = True
    Left = 137
    Top = 105
  end
  object qrySalarios: TwwQuery
    CachedUpdates = True
    DatabaseName = 'BASEDADOS'
    SQL.Strings = (
      
        'SELECT '#39'0000/00'#39'  AS MESREFERENCIA, 0 AS SALARIO, 0 AS SALATIVOM' +
        'P'
      'FROM PARTPREVPLAN'
      'WHERE IDPESSJUR = :IDPESSJUR'
      'AND IDPLANOPREV = :IDPLANOPREV'
      'AND IDPESSOA = :IDPESSOA'
      'AND SEQPROPOSTA = :SEQPROPOSTA')
    UpdateObject = updSalarios
    ValidateWithMask = True
    Left = 665
    Top = 281
    ParamData = <
      item
        DataType = ftInteger
        Name = 'IDPESSJUR'
        ParamType = ptUnknown
        Value = 255
      end
      item
        DataType = ftInteger
        Name = 'IDPLANOPREV'
        ParamType = ptUnknown
        Value = 255
      end
      item
        DataType = ftInteger
        Name = 'IDPESSOA'
        ParamType = ptUnknown
        Value = 255
      end
      item
        DataType = ftInteger
        Name = 'SEQPROPOSTA'
        ParamType = ptUnknown
        Value = 255
      end>
  end
  object updSalarios: TUpdateSQL
    Left = 641
    Top = 321
  end
  object updHstAtrasoContrib: TUpdateSQL
    ModifySQL.Strings = (
      'update HSTATRASOCONTRIB'
      'set'
      '  IDCONTRIBUICAO = :IDCONTRIBUICAO,'
      '  DESCRICAO = :DESCRICAO,'
      '  MESREFERENCIA = :MESREFERENCIA,'
      '  MESCOBRANCA = :MESCOBRANCA,'
      '  FLGTIPO  = :FLGTIPO ,'
      '  VALOR = :VALOR'
      'where'
      '  IDCONTRIBUICAO = :OLD_IDCONTRIBUICAO'
      'AND MESREFERENCIA  = :OLD_MESREFERENCIA')
    InsertSQL.Strings = (
      'insert into HSTATRASOCONTRIB'
      '  (IDCONTRIBUICAO, DESCRICAO,'
      '  MESREFERENCIA,  MESCOBRANCA,  FLGTIPO,  VALOR)'
      'values'
      '  (:IDCONTRIBUICAO, :DESCRICAO,'
      '  :MESREFERENCIA,  :MESCOBRANCA,  :FLGTIPO,  :VALOR)')
    Left = 50
    Top = 58
  end
  object qryHstAtrasoContrib: TwwQuery
    CachedUpdates = True
    DatabaseName = 'BaseDados'
    SQL.Strings = (
      'SELECT 0 IDCONTRIBUICAO,'
      '       '#39'                                        '#39' AS DESCRICAO,'
      '       HST.MESREFERENCIA,'
      '       HST.MESCOBRANCA,'
      '       HST.FLGTIPO,'
      '       HST.VALOR'
      'FROM  HSTATRASOCONTRIB HST'
      'WHERE HST.MESREFERENCIA = '#39'0000/00'#39
      'AND   HST.MESCOBRANCA   = '#39'0000/00'#39
      'AND   HST.NUMRECEBIMENTO    = -1'
      'AND   HST.CODALTERADOR = -1'
      'ORDER BY IDCONTRIBUICAO , MESREFERENCIA'
      ''
      ''
      ''
      ' ')
    UpdateObject = updHstAtrasoContrib
    ValidateWithMask = True
    Left = 61
    Top = 101
    object qryHstAtrasoContribIDCONTRIBUICAO: TFloatField
      FieldName = 'IDCONTRIBUICAO'
    end
    object qryHstAtrasoContribDESCRICAO: TStringField
      FieldName = 'DESCRICAO'
      FixedChar = True
      Size = 40
    end
    object qryHstAtrasoContribMESREFERENCIA: TStringField
      FieldName = 'MESREFERENCIA'
      FixedChar = True
      Size = 7
    end
    object qryHstAtrasoContribMESCOBRANCA: TStringField
      FieldName = 'MESCOBRANCA'
      FixedChar = True
      Size = 7
    end
    object qryHstAtrasoContribFLGTIPO: TStringField
      FieldName = 'FLGTIPO'
      FixedChar = True
      Size = 1
    end
    object qryHstAtrasoContribVALOR: TFloatField
      FieldName = 'VALOR'
    end
  end
  object MontaSelectPart: TMontaSelect
    Template.IdConsulta = 0
    Caption = 'Seleciona'
    Colunas.Strings = (
      'ELEGPATRO.MATRICULA'
      'PESSOA.NOME'
      'PARTPREVPLAN.INSCRICAONUMERO'
      'PLANPREV.NOME')
    TipodeDado.Strings = (
      'C'
      'C'
      'N'
      'C')
    Descricao.Strings = (
      'Matrícula'
      'Participante'
      'N° de Inscrição'
      '')
    SensivelACaixa.Strings = (
      'S'
      'N'
      'N'
      'N')
    Tabelas.Strings = (
      'PESSOA'
      'ELEGPATRO'
      'PARTPREVPLAN'
      'SITPART'
      'PESSOAFISICA'
      'PLANPREV')
    CamposChave.Strings = (
      'ELEGPATRO.IDPESSOA'
      'ELEGPATRO.IDPESSJUR'
      'PESSOA.NOME'
      'ELEGPATRO.MATRICULA'
      'PESSOAFISICA.DATANASC'
      'ELEGPATRO.DATAINICIOAFAST'
      'ELEGPATRO.DATAFIMAFAST'
      'PARTPREVPLAN.IDPLANOPREV')
    Filtro.Strings = (
      'PESSOA.IDPESSOA = ELEGPATRO.IDPESSOA'
      'ELEGPATRO.IDPESSOA = PARTPREVPLAN.IDPESSOA(+)'
      'ELEGPATRO.IDPESSJUR = PARTPREVPLAN.IDPESSJUR(+)'
      'PARTPREVPLAN.IDSITPART = SITPART.IDSITPART(+)'
      'PESSOA.IDPESSOA = PESSOAFISICA.IDPESSOA'
      ' PARTPREVPLAN.IDPLANOPREV = PLANPREV.IDPLANOPREV(+)')
    Mascaras.Strings = (
      ''
      ''
      ''
      '')
    Larguras.Strings = (
      '10'
      '50'
      '10'
      '50')
    DataBaseName = 'BaseDados'
    RepeteConsulta = False
    UsaDistinct = True
    SalvaConsulta = False
    ExibePergunta = True
    MultiSelect = False
    Left = 432
    Top = 292
  end
  object qryItensSal: TwwQuery
    CachedUpdates = True
    OnCalcFields = qryItensSalCalcFields
    DatabaseName = 'BaseDados'
    SQL.Strings = (
      
        'SELECT  DECODE(EV.DATAFINAL,NULL,1,0) AS FLGSELECIONADO, EV.SEQH' +
        'ISTFUNC,'
      
        '        EV.DATAINICIO, EV.DATAFINAL, NVL(CF.FLGPCC,0) FLGPCC, PC' +
        'S.NOME NOMEPCS,'
      
        '        TRUNC((NVL(EV.DATAFINAL,SYSDATE) - EV.DATAINICIO)) DIFDI' +
        'AS,'
      '        DECODE(EV.MODOFUNCAO, '#39'EF'#39', '#39'EFETIVA'#39' ,'
      '                              '#39'AS'#39', '#39'ASSEGURADA'#39','
      '                              '#39'ES'#39', '#39'EVENTUAL/SUBSTITUIÇÃO'#39','
      '                              '#39'DP'#39', '#39'DESIGNAÇÃO POR PRAZO'#39','
      '                              '#39'FA'#39', '#39'FACULTATIVA'#39','
      '                              '#39'BF'#39', '#39'BOLSA DE FUNÇÃO'#39','
      '                              '#39'ET'#39', '#39'ESTRATÉGICA'#39','
      
        '                              '#39'NE'#39', '#39'NÃO EFETIVA'#39') AS MODO, /*Br' +
        'uno Bastos - Pend. 22599*/'
      '        EV.MODOFUNCAO,'
      
        '        EV.IDPESSOA, EV.IDPESSJUR, EV.IDFUNCAO, CF.TITULO FUNCAO' +
        ', NVL(PERCFUNCAO,0) PERCFUNCAO,'
      
        '        NVL(PERC1AC,0) PERC1AC, NVL(PERCATS,0) PERCATS, NVL(PERC' +
        'INSALUB,0) PERCINSALUB,'
      '        NVL(PERCPERICUL,0) PERCPERICUL ,'
      
        '        NVL(PERCADNOT,0) PERCADNOT, NVL(QTDEMINUTOS,0) QTDEMINUT' +
        'OS,'
      '        EV.DATAFINAL, VL.DATAEFETIVACAO, VL.VALOR'
      'FROM    EVOLFUNCPREV EV , CARGOEXT CF , PCS,'
      
        '      ( SELECT CN.IDCARGOEXT, CN.IDPESSJUR,  N.CODIGO, FN.DATAEF' +
        'ETIVACAO, FN.VALOR'
      '        FROM   NIVEL N, CARGOXNIVEL CN, FAIXANIVEL FN'
      '        WHERE  CN.IDPESSJUR  = :IDPESSJUR'
      '        AND    CN.IDCARGOEXT = CN.IDCARGOEXT'
      '        AND    N.IDNIVEL     = CN.IDNIVEL'
      '        AND    N.IDPESSJUR   = CN.IDPESSJUR'
      '        AND    FN.IDPESSJUR  = CN.IDPESSJUR'
      '        AND    FN.IDNIVEL    = CN.IDNIVEL ) VL'
      'WHERE EV.IDPESSJUR     = :IDPESSJUR'
      'AND   EV.IDPESSOA      = :IDPESSOA'
      'AND   EV.IDFUNCAO      = CF.IDCARGOEXT(+)'
      'AND   PCS.IDPCS(+)     = CF.IDPCS'
      'AND   EV.IDCARGOEXT    IS NULL'
      'AND   VL.IDPESSJUR(+)  = EV.IDPESSJUR'
      'AND   VL.IDCARGOEXT(+) = EV.IDFUNCAO'
      'AND   NVL(EV.PERCADNOT,0) = 0'
      'ORDER BY  PERC1AC, EV.IDFUNCAO, VL.DATAEFETIVACAO DESC'
      ''
      ' '
      ''
      ' '
      ' ')
    UpdateObject = updItensSal
    ControlType.Strings = (
      'FLGSELECIONADO;CheckBox;1;0')
    ValidateWithMask = True
    Left = 398
    Top = 346
    ParamData = <
      item
        DataType = ftString
        Name = 'IDPESSJUR'
        ParamType = ptUnknown
        Value = '91008'
      end
      item
        DataType = ftString
        Name = 'IDPESSJUR'
        ParamType = ptUnknown
      end
      item
        DataType = ftString
        Name = 'IDPESSOA'
        ParamType = ptUnknown
        Value = '456771'
      end>
    object qryItensSalFLGSELECIONADO: TFloatField
      DisplayLabel = 'Selecionar'
      DisplayWidth = 10
      FieldName = 'FLGSELECIONADO'
    end
    object qryItensSaldescricao: TStringField
      DisplayLabel = 'Descrição'
      DisplayWidth = 28
      FieldKind = fkCalculated
      FieldName = 'descricao'
      Size = 50
      Calculated = True
    end
    object qryItensSalFUNCAO: TStringField
      DisplayLabel = 'Função'
      DisplayWidth = 27
      FieldName = 'FUNCAO'
      Size = 40
    end
    object qryItensSalpercentual: TFloatField
      DisplayLabel = 'Percentual'
      DisplayWidth = 10
      FieldKind = fkCalculated
      FieldName = 'percentual'
      Calculated = True
    end
    object qryItensSalVALOR: TFloatField
      DisplayLabel = 'Valor'
      DisplayWidth = 10
      FieldName = 'VALOR'
      currency = True
    end
    object qryItensSalDATAINICIO: TDateTimeField
      DisplayLabel = 'Dt. Inicio'
      DisplayWidth = 10
      FieldName = 'DATAINICIO'
    end
    object qryItensSalDATAFINAL: TDateTimeField
      DisplayLabel = 'Dt. Final'
      DisplayWidth = 10
      FieldName = 'DATAFINAL'
    end
    object qryItensSalMODO: TStringField
      DisplayLabel = 'Modo'
      DisplayWidth = 21
      FieldName = 'MODO'
      Size = 21
    end
    object qryItensSalQTDEMINUTOS: TFloatField
      DisplayLabel = 'Qtd. Minutos'
      DisplayWidth = 10
      FieldName = 'QTDEMINUTOS'
    end
    object qryItensSalMODOFUNCAO: TStringField
      DisplayLabel = 'Modo'
      DisplayWidth = 17
      FieldName = 'MODOFUNCAO'
      Visible = False
      FixedChar = True
      Size = 2
    end
    object qryItensSaltipo: TIntegerField
      DisplayWidth = 10
      FieldKind = fkCalculated
      FieldName = 'tipo'
      Visible = False
      Calculated = True
    end
    object qryItensSalPERCFUNCAO: TFloatField
      DisplayWidth = 10
      FieldName = 'PERCFUNCAO'
      Visible = False
    end
    object qryItensSalPERC1AC: TFloatField
      DisplayWidth = 10
      FieldName = 'PERC1AC'
      Visible = False
    end
    object qryItensSalPERCATS: TFloatField
      DisplayWidth = 10
      FieldName = 'PERCATS'
      Visible = False
    end
    object qryItensSalPERCINSALUB: TFloatField
      DisplayWidth = 10
      FieldName = 'PERCINSALUB'
      Visible = False
    end
    object qryItensSalPERCPERICUL: TFloatField
      DisplayWidth = 10
      FieldName = 'PERCPERICUL'
      Visible = False
    end
    object qryItensSalPERCADNOT: TFloatField
      DisplayWidth = 10
      FieldName = 'PERCADNOT'
      Visible = False
    end
    object qryItensSalIDPESSOA: TFloatField
      DisplayWidth = 10
      FieldName = 'IDPESSOA'
      Visible = False
    end
    object qryItensSalIDPESSJUR: TFloatField
      DisplayWidth = 10
      FieldName = 'IDPESSJUR'
      Visible = False
    end
    object qryItensSalIDFUNCAO: TFloatField
      DisplayWidth = 10
      FieldName = 'IDFUNCAO'
      Visible = False
    end
    object qryItensSalDATAFINAL_1: TDateTimeField
      DisplayWidth = 18
      FieldName = 'DATAFINAL_1'
      Visible = False
    end
    object qryItensSalSEQHISTFUNC: TFloatField
      DisplayWidth = 10
      FieldName = 'SEQHISTFUNC'
      Visible = False
    end
  end
  object qryRubSalarial: TwwQuery
    CachedUpdates = True
    DatabaseName = 'BaseDados'
    SQL.Strings = (
      
        'SELECT H.CODPROVDESC, H.FLGCOMPOEREMTOTAL, H.FLGCOMPOESALBENEF, ' +
        'H.FLGCOMPOESALPART,'
      
        '       H.FLGCONCESSAO, H.FLGIRRF, H.FLGPREVIA, H.FLGSALBENEFRETR' +
        'O, H.FLGSALPARTATUARIA,'
      
        '       H.FLGSALPARTRETRO, H.FLGSRB, H.IDMODULO, H.IDMOTIVO, H.ID' +
        'PATRO, H.IDPESSJUR,'
      
        '       H.IDPESSOA, H.IDREGRACALCULO, H.IDRUBRICA, H.MES, H.MESCO' +
        'BRANCA, H.REFERENCIA,'
      
        '       H.SEQRUBRICA, H.VALORPROVENTO, H.VALORNADIB, H.PERCENTUAL' +
        'NADIB, H.FLGEQUIPARACAO,'
      '       H.TIPOITEMPCS,'
      
        '       DECODE(H.IDMODULO, 16, '#39'AdmPREV'#39', 32, '#39'CCP'#39', 21, '#39'Folha d' +
        'e Pagamento CM'#39', '#39'Outros'#39') AS MODULO,'
      '       R.DESCRPROVDESC'
      'FROM   RUBRICAXPESS R, HISTRUBSAL H'
      'WHERE  H.IDPESSJUR = :IDPESSJUR'
      'AND    H.IDPESSOA  = :IDPESSOA'
      'AND    H.FLGEQUIPARACAO = 1'
      'AND    H.IDPESSJUR  = R.IDPESSOA'
      'AND    H.IDRUBRICA  = R.IDRUBRICA'
      'AND   H.TIPOITEMPCS = 1'
      'ORDER BY H.MES DESC, H.CODPROVDESC ')
    PictureMasks.Strings = (
      'MES'#9'####/##'#9'T'#9'F')
    ValidateWithMask = True
    Left = 448
    Top = 37
    ParamData = <
      item
        DataType = ftString
        Name = 'IDPESSJUR'
        ParamType = ptUnknown
        Value = '1'
      end
      item
        DataType = ftString
        Name = 'IDPESSOA'
        ParamType = ptUnknown
      end>
  end
  object dsitenssal: TwwDataSource
    DataSet = qryItensSal
    Left = 273
    Top = 158
  end
  object updItensSal: TUpdateSQL
    ModifySQL.Strings = (
      'update EVOLFUNCPREV'
      'set'
      'FLGSELECIONADO = :FLGSELECIONADO,'
      'SEQHISTFUNC = :SEQHISTFUNC ,'
      'DATAINICIO = :DATAINICIO ,'
      'DATAFINAL = :DATAFINAL ,'
      'MODOFUNCAO = :MODOFUNCAO ,'
      'IDPESSOA = :IDPESSOA ,'
      'IDPESSJUR = :IDPESSOA ,'
      'IDFUNCAO = :IDFUNCAO ,'
      'FUNCAOPERCFUNCAO = :FUNCAOPERCFUNCAO ,'
      'PERC1AC = :PERC1AC ,'
      'PERCATS = :PERCATS ,'
      'PERCINSALUB = :PERCINSALUB ,'
      'PERCPERICUL = :PERCPERICUL ,'
      'PERCADNOT = :PERCADNOT ,'
      'QTDEMINUTOS = :QTDEMINUTOS ,'
      'VALOR = :VALOR '
      'WHERE  '
      'SEQHISTFUNC = :OLD_SEQHISTFUNC '
      'IDPESSOA = :OLD_IDPESSOA'
      'IDPESSJUR = :OLD_IDPESSJUR'
      '')
    InsertSQL.Strings = (
      'insert into dual'
      'values(1)')
    DeleteSQL.Strings = (
      'delete from dual'
      '')
    Left = 323
    Top = 210
  end
end
