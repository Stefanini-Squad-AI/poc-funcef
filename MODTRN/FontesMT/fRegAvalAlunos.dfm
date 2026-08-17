inherited frmRegAvalAlunos: TfrmRegAvalAlunos
  Left = 34
  Top = 83
  HelpContext = 720102
  BorderIcons = [biSystemMenu, biMinimize]
  BorderStyle = bsSingle
  Caption = 'Registro das Avaliações dos Participantes em um Treinamento'
  ClientHeight = 472
  ClientWidth = 722
  Constraints.MinHeight = 480
  Constraints.MinWidth = 730
  PixelsPerInch = 96
  TextHeight = 13
  inherited pnlFundo: TPanel
    Width = 722
    Height = 433
    BorderWidth = 2
    object tbntbDados: TNotebook
      Left = 4
      Top = 217
      Width = 713
      Height = 212
      PageIndex = 1
      TabOrder = 0
      object TPage
        Left = 0
        Top = 0
        Caption = 'Historico'
        object dbgdHistoricoTreinamento: TwwDBGrid
          Left = 3
          Top = 2
          Width = 643
          Height = 208
          Selected.Strings = (
            'DATPLINI'#9'10'#9'Data Plan. Início'
            'DATPLFIM'#9'10'#9'Data Plan. Final'
            'DATREINI'#9'10'#9'Data Real Início'
            'DATREFIM'#9'10'#9'Data Real Final'
            'NOME'#9'60'#9'Entidade ou Instrutor')
          IniAttributes.Delimiter = ';;'
          TitleColor = clBtnFace
          FixedCols = 0
          ShowHorzScrollBar = True
          DataSource = dsHstTrn
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -9
          Font.Name = 'MS Sans Serif'
          Font.Style = []
          Options = [dgTitles, dgIndicator, dgColumnResize, dgColLines, dgRowLines, dgTabs, dgWordWrap]
          ParentFont = False
          TabOrder = 0
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
        object bbtnApanha: TBitBtn
          Left = 650
          Top = 84
          Width = 61
          Height = 45
          Hint = 'Apanhar o Evento Selecionado deste Curso'
          Caption = '&Apanha'
          Enabled = False
          ModalResult = 1
          ParentShowHint = False
          ShowHint = True
          TabOrder = 1
          OnClick = bbtnApanhaClick
          Glyph.Data = {
            76010000424D7601000000000000760000002800000020000000100000000100
            0400000000000001000000000000000000001000000000000000000000000000
            8000008000000080800080000000800080008080000080808000C0C0C0000000
            FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00888888888888
            8888888888FFFFF8888888888000008888888888F777778FF888888006666600
            88888887788888778F88880666666666088888788888F88878F880E6666F6666
            608887F888878F8887F880E6666FF66660888788888778F8878F0E66666FFF66
            66087F88FFF7778F887F0E6FFFFFFFF666087F8777777778F87F0E6FFFFFFFFF
            66087F8777777777887F0E6FFFFFFFF666087F8777777778887F0E66666FFF66
            660878F888877788887880E6666FF666608887F88887788887F880E6666F6666
            6088878F888788888788880EE666666608888878FF888888788888800EEEEE00
            8888888778FFFF77888888888000008888888888877777888888}
          Layout = blGlyphTop
          NumGlyphs = 2
          Spacing = 2
        end
      end
      object TPage
        Left = 0
        Top = 0
        Caption = 'EscolheEmpregados'
        object pnlPessoasInscritas: TPanel
          Left = 3
          Top = 2
          Width = 707
          Height = 28
          BevelInner = bvLowered
          Caption = 'Pessoas Inscritas'
          Color = clGray
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWhite
          Font.Height = -13
          Font.Name = 'MS Sans Serif'
          Font.Style = [fsBold]
          ParentFont = False
          TabOrder = 0
          object sbtnImprimirPlanilha: TSpeedButton
            Left = 2
            Top = 2
            Width = 24
            Height = 24
            Hint = 'Imprimir a Planilha para Preenchimento pelo Instrutor'
            Glyph.Data = {
              DE010000424DDE01000000000000760000002800000024000000120000000100
              0400000000006801000000000000000000001000000010000000000000000000
              8000008000000080800080000000800080008080000080808000C0C0C0000000
              FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00888888880008
              8888888888888F7778FF8888000088888800877008888888888F7787F778FF88
              0000888800880007700888888F778F7778F778FF000088008800877007700888
              778F7787F778F778000080880088877770077087FF778887F88778F700008700
              888887777770008777888887FF888777000080888888F77777777087F8888F77
              78FF88870000878888FF888777777087F88F77888778FF8700008788FF888888
              87777087FF778888888778F7000087FF88899888888770877788888888888777
              000087888AA88888808880878FF8888888FFF8F700008877F888888FF0877888
              778FF88FF77787780000888877F87FFFFF08888888778F77788878F800008888
              88777FFFFFF088888888777FF888878F00008888888877FFFFFF008888888877
              8F888F77000088888888887FFF7788888888888878FF77880000888888888887
              7788888888888888877788880000888888888888888888888888888888888888
              0000}
            Margin = 0
            NumGlyphs = 2
            ParentShowHint = False
            ShowHint = True
            OnClick = sbtnImprimirPlanilhaClick
          end
        end
        object dbgdAvaliacoes: TwwDBGrid
          Left = 3
          Top = 31
          Width = 707
          Height = 180
          ControlInfoInDataset = False
          ControlType.Strings = (
            'FLGCURSOALUNO;CustomEdit;')
          IniAttributes.Delimiter = ';;'
          TitleColor = clBtnFace
          FixedCols = 1
          ShowHorzScrollBar = True
          DataSource = dsPrincipal
          KeyOptions = []
          Options = [dgEditing, dgTitles, dgIndicator, dgColumnResize, dgColLines, dgRowLines, dgTabs]
          TabOrder = 1
          TitleAlignment = taCenter
          TitleFont.Charset = DEFAULT_CHARSET
          TitleFont.Color = clWindowText
          TitleFont.Height = -9
          TitleFont.Name = 'MS Sans Serif'
          TitleFont.Style = [fsBold]
          TitleLines = 1
          TitleButtons = False
          UseTFields = False
          OnCalcCellColors = dbgdAvaliacoesCalcCellColors
          OnExit = dbgdAvaliacoesExit
          IndicatorColor = icBlack
          OnFieldChanged = dbgdAvaliacoesFieldChanged
        end
      end
    end
    object PageControl1: TPageControl
      Left = 4
      Top = 4
      Width = 714
      Height = 213
      ActivePage = tbshDadosBasicos
      Align = alTop
      TabOrder = 1
      object tbshDadosBasicos: TTabSheet
        Caption = 'Dados Básicos'
        object gbxCurso: TGroupBox
          Left = 6
          Top = 6
          Width = 328
          Height = 158
          Caption = 'Curso'
          TabOrder = 0
          object Label3: TLabel
            Left = 12
            Top = 38
            Width = 158
            Height = 13
            Caption = 'Empresa/Entidade/Instrutor'
          end
          object Label1: TLabel
            Left = 12
            Top = 75
            Width = 174
            Height = 13
            Caption = 'Instrutor da Empresa/Entidade'
          end
          object dblckCurso: TwwDBLookupCombo
            Left = 12
            Top = 14
            Width = 304
            Height = 21
            DropDownAlignment = taLeftJustify
            Selected.Strings = (
              'DESCRICAO'#9'60'#9'DESCRICAO')
            LookupTable = CdsCurso
            LookupField = 'IDCURSO'
            Style = csDropDownList
            TabOrder = 0
            AutoDropDown = True
            ShowButton = True
            UseTFields = False
            AllowClearKey = True
            OnCloseUp = dblckCursoCloseUp
          end
          object dblckEntid: TwwDBLookupCombo
            Left = 12
            Top = 52
            Width = 304
            Height = 21
            DropDownAlignment = taLeftJustify
            Selected.Strings = (
              'NOME'#9'60'#9'NOME')
            LookupTable = CdsEntid
            LookupField = 'IDPESSOA'
            Style = csDropDownList
            TabOrder = 1
            AutoDropDown = True
            ShowButton = True
            UseTFields = False
            AllowClearKey = True
            OnChange = dblckEntidChange
            OnEnter = dblckEntidEnter
          end
          object dblckInstrutor: TwwDBLookupCombo
            Left = 12
            Top = 89
            Width = 304
            Height = 21
            DropDownAlignment = taLeftJustify
            Selected.Strings = (
              'NOME'#9'60'#9'NOME'#9'F')
            LookupTable = CdsInstrutor
            LookupField = 'IDPESSOA'
            Style = csDropDownList
            TabOrder = 2
            AutoDropDown = True
            ShowButton = True
            UseTFields = False
            AllowClearKey = True
          end
          object rgControle: TRadioGroup
            Left = 12
            Top = 114
            Width = 147
            Height = 35
            Caption = 'É Parte dos Controles?'
            Columns = 2
            Items.Strings = (
              'Sim'
              'Não')
            TabOrder = 3
          end
          object rgAvalCurs: TRadioGroup
            Left = 169
            Top = 114
            Width = 147
            Height = 35
            Caption = 'Avaliação do Curso?'
            Columns = 2
            ItemIndex = 1
            Items.Strings = (
              'Sim'
              'Não')
            TabOrder = 4
          end
        end
        object gbxDatas: TGroupBox
          Left = 345
          Top = 6
          Width = 120
          Height = 158
          Caption = 'Datas'
          TabOrder = 1
          object Label6: TLabel
            Left = 10
            Top = 12
            Width = 94
            Height = 13
            Caption = 'Início Planejado'
          end
          object Label7: TLabel
            Left = 10
            Top = 47
            Width = 88
            Height = 13
            Caption = 'Final Planejado'
          end
          object Label8: TLabel
            Left = 10
            Top = 83
            Width = 78
            Height = 13
            Caption = 'Início Efetivo'
          end
          object Label9: TLabel
            Left = 10
            Top = 118
            Width = 72
            Height = 13
            Caption = 'Final Efetivo'
          end
          object dtedIniPlan: TCMDateTimePicker
            Left = 10
            Top = 26
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
          end
          object dtedFimPlan: TCMDateTimePicker
            Left = 10
            Top = 61
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
          end
          object dtedIniReal: TCMDateTimePicker
            Left = 10
            Top = 96
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
            TabOrder = 2
          end
          object dtedFimReal: TCMDateTimePicker
            Left = 10
            Top = 131
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
            TabOrder = 3
          end
        end
        object gbxCarga: TGroupBox
          Left = 475
          Top = 6
          Width = 102
          Height = 158
          Caption = 'Carga Horária'
          TabOrder = 2
          object Label11: TLabel
            Left = 11
            Top = 20
            Width = 37
            Height = 13
            Caption = 'Teoria'
          end
          object Label12: TLabel
            Left = 11
            Top = 65
            Width = 41
            Height = 13
            Caption = 'Prática'
          end
          object Label13: TLabel
            Left = 11
            Top = 110
            Width = 30
            Height = 13
            Caption = 'Total'
          end
          object redTeoria: TRealEdit
            Left = 11
            Top = 34
            Width = 80
            Height = 21
            Alignment = taRightJustify
            Lines.Strings = (
              '      0,00')
            TabOrder = 0
            WordWrap = False
            IntDigits = 10
            DecDigits = 2
            NumberFormat = fNumber
            Signal = False
          end
          object redPratica: TRealEdit
            Left = 11
            Top = 79
            Width = 80
            Height = 21
            Alignment = taRightJustify
            Lines.Strings = (
              '      0,00')
            TabOrder = 1
            WordWrap = False
            IntDigits = 10
            DecDigits = 2
            NumberFormat = fNumber
            Signal = False
          end
          object redTotal: TRealEdit
            Left = 11
            Top = 124
            Width = 80
            Height = 21
            Alignment = taRightJustify
            Lines.Strings = (
              '      0,00')
            TabOrder = 2
            WordWrap = False
            IntDigits = 10
            DecDigits = 2
            NumberFormat = fNumber
            Signal = False
          end
        end
        object gbxDespesas: TGroupBox
          Left = 582
          Top = 6
          Width = 117
          Height = 158
          Caption = 'Despesas'
          TabOrder = 3
          object Label14: TLabel
            Left = 9
            Top = 12
            Width = 33
            Height = 13
            Caption = 'Curso'
          end
          object Label15: TLabel
            Left = 9
            Top = 47
            Width = 42
            Height = 13
            Caption = 'Viagem'
          end
          object Label16: TLabel
            Left = 9
            Top = 83
            Width = 74
            Height = 13
            Caption = 'Hospedagem'
          end
          object Label17: TLabel
            Left = 9
            Top = 118
            Width = 38
            Height = 13
            Caption = 'Outras'
          end
          object redValCurso: TRealEdit
            Left = 9
            Top = 26
            Width = 100
            Height = 21
            Alignment = taRightJustify
            Lines.Strings = (
              '      0,00')
            TabOrder = 0
            WordWrap = False
            IntDigits = 10
            DecDigits = 2
            NumberFormat = fNumber
            Signal = False
          end
          object redValViagem: TRealEdit
            Left = 9
            Top = 61
            Width = 100
            Height = 21
            Alignment = taRightJustify
            Lines.Strings = (
              '      0,00')
            TabOrder = 1
            WordWrap = False
            IntDigits = 10
            DecDigits = 2
            NumberFormat = fNumber
            Signal = False
          end
          object redValHosp: TRealEdit
            Left = 9
            Top = 96
            Width = 100
            Height = 21
            Alignment = taRightJustify
            Lines.Strings = (
              '      0,00')
            TabOrder = 2
            WordWrap = False
            IntDigits = 10
            DecDigits = 2
            NumberFormat = fNumber
            Signal = False
          end
          object redValOutras: TRealEdit
            Left = 9
            Top = 131
            Width = 100
            Height = 21
            Alignment = taRightJustify
            Lines.Strings = (
              '      0,00')
            TabOrder = 3
            WordWrap = False
            IntDigits = 10
            DecDigits = 2
            NumberFormat = fNumber
            Signal = False
          end
        end
      end
      object tbshDadosComplementares: TTabSheet
        Caption = 'Dados Complementares'
        ImageIndex = 1
        object Label2: TLabel
          Left = 10
          Top = 160
          Width = 117
          Height = 13
          Caption = 'Local e/ou Diretivas'
        end
        object Label5: TLabel
          Left = 10
          Top = 11
          Width = 88
          Height = 13
          Caption = 'Dias e Horários'
        end
        object Label10: TLabel
          Left = 367
          Top = 11
          Width = 102
          Height = 13
          Caption = 'Outros Instrutores'
        end
        object edLocalCurso: TEdit
          Left = 136
          Top = 156
          Width = 560
          Height = 21
          TabOrder = 0
        end
        object edDataHora: TwwDBEdit
          Left = 10
          Top = 24
          Width = 329
          Height = 128
          AutoSize = False
          DataField = 'DATAHORA'
          DataSource = dsHstTrn
          ReadOnly = True
          ShowVertScrollBar = True
          TabOrder = 1
          UnboundDataType = wwDefault
          WantReturns = True
          WordWrap = True
        end
        object edInstrutores: TwwDBEdit
          Left = 367
          Top = 24
          Width = 329
          Height = 128
          AutoSize = False
          DataField = 'INSTRUTORES'
          DataSource = dsHstTrn
          ReadOnly = True
          ShowVertScrollBar = True
          TabOrder = 2
          UnboundDataType = wwDefault
          WantReturns = True
          WordWrap = True
        end
      end
    end
  end
  inherited Dock971: TDock97
    Top = 433
    Width = 722
    inherited tb97Fundo: TToolbar97
      Left = 556
      DockPos = 564
    end
  end
  inherited ivTradutor: TIvExtendedTranslator
    Left = 27
    Top = 355
    TargetsData = (
      1
      1
      (
        ''
        'Text'
        0))
  end
  object dsHstTrn: TwwDataSource
    AutoEdit = False
    DataSet = CdsHstTrn
    Left = 127
    Top = 355
  end
  object CdsCurso: TCMClientDataSet
    Aggregates = <>
    Params = <>
    Left = 29
    Top = 308
  end
  object CdsInstrutor: TCMClientDataSet
    Aggregates = <>
    Params = <>
    Left = 125
    Top = 308
  end
  object CdsEntid: TCMClientDataSet
    Aggregates = <>
    Params = <>
    Left = 74
    Top = 308
  end
  object CdsHstTrn: TCMClientDataSet
    Aggregates = <>
    Params = <>
    Left = 78
    Top = 355
  end
  object CdsPrincipal: TCMClientDataSet
    Aggregates = <>
    FieldDefs = <>
    IndexDefs = <>
    Params = <>
    StoreDefs = True
    BeforePost = CdsPrincipalBeforePost
    AfterPost = CdsPrincipalAfterPost
    Left = 36
    Top = 261
  end
  object dsPrincipal: TwwDataSource
    DataSet = CdsPrincipal
    Left = 101
    Top = 261
  end
end
