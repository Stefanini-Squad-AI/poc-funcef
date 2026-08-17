inherited frmParamRAISMagnetico: TfrmParamRAISMagnetico
  Left = 312
  Top = 102
  HelpContext = 210089
  BorderIcons = [biSystemMenu, biMinimize]
  BorderStyle = bsToolWindow
  Caption = 'RAIS (Meio Magnético)'
  ClientHeight = 477
  ClientWidth = 617
  Font.Style = []
  FormStyle = fsNormal
  Visible = False
  PixelsPerInch = 96
  TextHeight = 13
  inherited pnlFundo: TPanel
    Width = 617
    Height = 438
    BorderWidth = 2
    object pnlResult: TPanel
      Left = 2
      Top = 2
      Width = 613
      Height = 434
      Align = alClient
      BevelOuter = bvNone
      BorderWidth = 3
      Caption = 'pnlResult'
      TabOrder = 0
      object memResult: TMemo
        Left = 3
        Top = 3
        Width = 607
        Height = 329
        Align = alTop
        Color = clBlack
        Font.Charset = ANSI_CHARSET
        Font.Color = clLime
        Font.Height = -13
        Font.Name = 'Courier New'
        Font.Style = [fsBold]
        ParentFont = False
        ReadOnly = True
        ScrollBars = ssVertical
        TabOrder = 0
      end
      object bbtnVoltar: TBitBtn
        Left = 5
        Top = 335
        Width = 92
        Height = 31
        Caption = '&Voltar'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'MS Sans Serif'
        Font.Style = [fsBold]
        ParentFont = False
        TabOrder = 1
        OnClick = bbtnVoltarClick
        Glyph.Data = {
          E6000000424DE60000000000000076000000280000000E0000000E0000000100
          0400000000007000000000000000000000001000000010000000000000000000
          BF0000BF000000BFBF00BF000000BF00BF00BFBF0000C0C0C000808080000000
          FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00DDDDDDDDDDDD
          DD00DDDDD4444DDDDD00DDD44444444DDD00DD444DDDD444DD00DD44DDDDDD44
          DD00D44DDDDDDDD44D00D44DDDDDDDD44D00D44DDDDDDDD44D00D44DDDDDDDD4
          4D00DD44DDDD4D44DD00DD44DDDD4444DD00DDDDDDDD444DDD00DDDDDDDD4444
          DD00DDDDDDDDDDDDDD00}
      end
      object bbtnSalvar: TBitBtn
        Left = 109
        Top = 335
        Width = 92
        Height = 31
        Caption = 'S&alvar'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Height = -11
        Font.Name = 'MS Sans Serif'
        Font.Style = [fsBold]
        ParentFont = False
        TabOrder = 2
        OnClick = bbtnSalvarClick
        Glyph.Data = {
          76010000424D7601000000000000760000002800000020000000100000000100
          0400000000000001000000000000000000001000000010000000000000000000
          800000800000008080008000000080008000808000007F7F7F00BFBFBF000000
          FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00333333330070
          7700333333337777777733333333008088003333333377F73377333333330088
          88003333333377FFFF7733333333000000003FFFFFFF77777777000000000000
          000077777777777777770FFFFFFF0FFFFFF07F3333337F3333370FFFFFFF0FFF
          FFF07F3FF3FF7FFFFFF70F00F0080CCC9CC07F773773777777770FFFFFFFF039
          99337F3FFFF3F7F777F30F0000F0F09999937F7777373777777F0FFFFFFFF999
          99997F3FF3FFF77777770F00F000003999337F773777773777F30FFFF0FF0339
          99337F3FF7F3733777F30F08F0F0337999337F7737F73F7777330FFFF0039999
          93337FFFF7737777733300000033333333337777773333333333}
        NumGlyphs = 2
      end
    end
    object pnlSelecao: TPanel
      Left = 2
      Top = 2
      Width = 613
      Height = 434
      Align = alClient
      BevelOuter = bvNone
      BorderWidth = 3
      TabOrder = 1
      object pnlHorario: TPanel
        Left = 3
        Top = 3
        Width = 607
        Height = 21
        Align = alTop
        BevelInner = bvLowered
        Caption = 'Tempo Decorrido'
        Color = clGray
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWhite
        Font.Height = -11
        Font.Name = 'MS Sans Serif'
        Font.Style = []
        ParentFont = False
        TabOrder = 0
      end
      object pgctrlPrincipal: TPageControl
        Left = 3
        Top = 24
        Width = 607
        Height = 407
        ActivePage = tbshPrincipal
        Align = alClient
        HotTrack = True
        TabOrder = 1
        OnChange = pgctrlRubricasChange
        object tbshPrincipal: TTabSheet
          Caption = 'Principal'
          object gbxEstab: TGroupBox
            Left = 6
            Top = 1
            Width = 448
            Height = 89
            Caption = 'Estabelecimento(s)'
            TabOrder = 0
            object chklstEstab: TColorCheckListBox
              Left = 8
              Top = 14
              Width = 297
              Height = 67
              OnClickCheck = chklstEstabClickCheck
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clWindowText
              Font.Height = -11
              Font.Name = 'MS Sans Serif'
              Font.Style = []
              ItemHeight = 13
              ParentFont = False
              Style = lbOwnerDrawFixed
              TabOrder = 0
            end
            object bbtnSelTodos: TBitBtn
              Left = 310
              Top = 14
              Width = 131
              Height = 25
              Caption = '   Seleciona Todos'
              TabOrder = 1
              TabStop = False
              OnClick = bbtnSelTodosClick
              Glyph.Data = {
                76010000424D7601000000000000760000002800000020000000100000000100
                0400000000000001000000000000000000001000000010000000000000000000
                80000080000000808000800000008000800080800000C0C0C000808080000000
                FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00333333333333
                3333333333333333333333333333333333333333333333333333333333300000
                0003333333388888888333333330FF9FFF0333333338FF7FFF8333333000F999
                FF0333333888F777FF83333330F099F99F03333338F877F77F83333000F09FFF
                9903333888F87FFF77833330F090FFFFF9933338F878FFFFF7733000F0900000
                00993888F8788888887730F090FFFFF9933338F878FFFFF7733330F090000000
                993338F87888888877333090FFFFF99333333878FFFFF7733333309000000099
                3333387888888877333330FFFFF99333333338FFFFF773333333300000009933
                3333388888887733333333333333333333333333333333333333}
              NumGlyphs = 2
              Spacing = 0
            end
            object bbtnInverteSel: TBitBtn
              Left = 310
              Top = 41
              Width = 131
              Height = 25
              Caption = '   Inverte Seleção'
              TabOrder = 2
              TabStop = False
              OnClick = bbtnInverteSelClick
              Glyph.Data = {
                76010000424D7601000000000000760000002800000020000000100000000100
                0400000000000001000000000000000000001000000010000000000000000000
                80000080000000808000800000008000800080800000C0C0C000808080000000
                FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00333333333333
                3333333333333333333333333333000000003333333388888888333333330FFF
                FFF0333333338FFFFFF8333000330FFFFFF0333788338FFFFFF8333033330FFF
                FFF0333833338FFFFFF8330003330FFFFFF0337783338FFFFFF8333033330FFF
                FFF0333833338FFFFFF833333333000000003333333388888888000000003333
                333388888888333333330FF9FFF0333303338FF7FFF8333383330F999FF03330
                00338F777FF833387733099F99F033330333877F77F83333833309FFF9903300
                033387FFF778338873330FFFFF99333333338FFFFF7733333333000000099333
                3333888888877333333333333333333333333333333333333333}
              NumGlyphs = 2
              Spacing = 0
            end
          end
          object gbxAnoMesRef: TGroupBox
            Left = 460
            Top = 1
            Width = 128
            Height = 44
            Caption = 'Ano de Referência'
            TabOrder = 1
            object speAno: TSpinEdit
              Left = 31
              Top = 15
              Width = 66
              Height = 22
              MaxLength = 4
              MaxValue = 3000
              MinValue = 1990
              TabOrder = 0
              Value = 1990
            end
          end
          object gbxMesDataBase: TGroupBox
            Left = 460
            Top = 46
            Width = 128
            Height = 44
            Caption = 'Mês da data-base'
            TabOrder = 2
            object cmbMesDataBase: TComboBox
              Left = 25
              Top = 16
              Width = 79
              Height = 21
              Style = csDropDownList
              ItemHeight = 13
              ParentShowHint = False
              ShowHint = False
              TabOrder = 0
              Items.Strings = (
                'Janeiro'
                'Fevereiro'
                'Março'
                'Abril'
                'Maio'
                'Junho'
                'Julho'
                'Agosto'
                'Setembro'
                'Outubro'
                'Novembro'
                'Dezembro')
            end
          end
          object gbxResp: TGroupBox
            Left = 6
            Top = 97
            Width = 348
            Height = 45
            Caption = 'Estabelecimento Responsável pela Informação'
            TabOrder = 3
            object dblkcbResp: TwwDBLookupCombo
              Left = 8
              Top = 16
              Width = 332
              Height = 21
              DropDownAlignment = taLeftJustify
              Selected.Strings = (
                'NOME'#9'60'#9'NOME')
              LookupTable = CdsNomeResp
              LookupField = 'IDPESSOA'
              Style = csDropDownList
              TabOrder = 0
              AutoDropDown = True
              ShowButton = True
              AllowClearKey = False
            end
          end
          object rgTipoInf: TRadioGroup
            Left = 360
            Top = 97
            Width = 110
            Height = 45
            Caption = 'Tipo de Informação'
            ItemIndex = 0
            Items.Strings = (
              'Normal'
              'Acerto')
            TabOrder = 4
            TabStop = True
            OnClick = rgTipoInfExit
            OnExit = rgTipoInfExit
          end
          object gbxDataRetif: TGroupBox
            Left = 478
            Top = 97
            Width = 110
            Height = 45
            Caption = 'Data da Retificação'
            Ctl3D = True
            Enabled = False
            ParentCtl3D = False
            ParentShowHint = False
            ShowHint = False
            TabOrder = 5
            object dtedRetif: TCMDateTimePicker
              Left = 8
              Top = 16
              Width = 93
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
          end
          object rgTipoDeclarac: TRadioGroup
            Left = 6
            Top = 149
            Width = 169
            Height = 45
            Caption = 'Tipo de Declaração'
            ItemIndex = 0
            Items.Strings = (
              'Normal'
              'Encerramento de Atividades')
            TabOrder = 6
            TabStop = True
            OnClick = rgTipoDeclaracExit
            OnExit = rgTipoDeclaracExit
          end
          object gbxDataEncerr: TGroupBox
            Left = 182
            Top = 149
            Width = 111
            Height = 45
            Caption = 'Data da Encerr.'
            Ctl3D = True
            Enabled = False
            ParentCtl3D = False
            ParentShowHint = False
            ShowHint = False
            TabOrder = 7
            object dtedDataEncerr: TCMDateTimePicker
              Left = 8
              Top = 16
              Width = 95
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
          end
          object rgIndicador1: TRadioGroup
            Left = 300
            Top = 149
            Width = 288
            Height = 45
            Caption = 'O recibo definitivo será enviado pelo correio para:'
            ItemIndex = 1
            Items.Strings = (
              'O endereço do Estabelecimento'
              'O endereço do Estabelecimento Responsável')
            TabOrder = 8
            TabStop = True
          end
          object gbxSalMinAtual: TGroupBox
            Left = 6
            Top = 201
            Width = 115
            Height = 52
            Caption = 'Salário Mínimo atual'
            TabOrder = 9
            object redSalMinAtual: TRealEdit
              Left = 16
              Top = 19
              Width = 81
              Height = 21
              Alignment = taRightJustify
              Ctl3D = True
              Lines.Strings = (
                '      0,00')
              ParentCtl3D = False
              ParentShowHint = False
              ShowHint = False
              TabOrder = 0
              WantReturns = False
              WordWrap = False
              OnChange = redSalMinAtualChange
              IntDigits = 10
              DecDigits = 2
              NumberFormat = fNumber
              Signal = False
            end
          end
          object gbxTipContra: TGroupBox
            Left = 128
            Top = 201
            Width = 460
            Height = 52
            Caption = 'Tipos de Contrato'
            ParentShowHint = False
            ShowHint = False
            TabOrder = 10
            object cbxEfetivos: TCheckBox
              Left = 14
              Top = 14
              Width = 64
              Height = 13
              Caption = 'Efetivos'
              Checked = True
              ParentShowHint = False
              ShowHint = False
              State = cbChecked
              TabOrder = 0
            end
            object cbxEspeciais: TCheckBox
              Left = 14
              Top = 31
              Width = 90
              Height = 13
              Caption = 'LEF'
              Checked = True
              ParentShowHint = False
              ShowHint = False
              State = cbChecked
              TabOrder = 1
            end
            object cbxTemporarios: TCheckBox
              Left = 131
              Top = 14
              Width = 80
              Height = 13
              Caption = 'Terceirizados'
              Checked = True
              ParentShowHint = False
              ShowHint = False
              State = cbChecked
              TabOrder = 2
            end
            object cbxEstagiarios: TCheckBox
              Left = 131
              Top = 31
              Width = 74
              Height = 13
              Caption = 'Estagiários'
              ParentShowHint = False
              ShowHint = False
              TabOrder = 3
            end
            object cbxTerceiros: TCheckBox
              Left = 237
              Top = 14
              Width = 66
              Height = 13
              Caption = 'Cessão'
              ParentShowHint = False
              ShowHint = False
              TabOrder = 4
            end
            object cbxPropDirSemVinc: TCheckBox
              Left = 237
              Top = 31
              Width = 97
              Height = 13
              Caption = 'Prop/Dir s/ Vinc'
              ParentShowHint = False
              ShowHint = False
              TabOrder = 5
            end
            object cbxAutonomos: TCheckBox
              Left = 356
              Top = 14
              Width = 75
              Height = 13
              Caption = 'Autônomos'
              ParentShowHint = False
              ShowHint = False
              TabOrder = 6
            end
          end
          object rgMicroEmpr: TRadioGroup
            Left = 6
            Top = 257
            Width = 259
            Height = 95
            Caption = 'Indicador de Porte'
            ItemIndex = 2
            Items.Strings = (
              'Micro-empresa'
              'Empresa de Pequeno Porte'
              'Empresa não classificada nos ítens anteriores')
            TabOrder = 11
            TabStop = True
          end
          object gbxNumProp: TGroupBox
            Left = 292
            Top = 257
            Width = 128
            Height = 47
            Caption = 'Nº de Proprietários'
            TabOrder = 12
            object spedNumProp: TSpinEdit
              Left = 26
              Top = 16
              Width = 76
              Height = 22
              MaxValue = 99
              MinValue = 0
              TabOrder = 0
              Value = 0
            end
          end
          object rgSimples: TRadioGroup
            Left = 460
            Top = 257
            Width = 128
            Height = 48
            Caption = 'Optante pelo Simples?'
            Columns = 2
            ItemIndex = 1
            Items.Strings = (
              'Sim'
              'Não')
            ParentShowHint = False
            ShowHint = False
            TabOrder = 13
            TabStop = True
          end
          object gbxResponsavel: TGroupBox
            Left = 272
            Top = 307
            Width = 316
            Height = 45
            Caption = 'Nome do Responsável'
            TabOrder = 14
            object dblkNomeResp: TwwDBLookupCombo
              Left = 8
              Top = 16
              Width = 297
              Height = 21
              DropDownAlignment = taLeftJustify
              Selected.Strings = (
                'NOME'#9'40'#9'Funcionário'#9'F')
              LookupTable = cdsListaResp
              LookupField = 'IDPESSOA'
              TabOrder = 0
              AutoDropDown = False
              ShowButton = True
              AllowClearKey = False
            end
          end
        end
        object tbshAdmDem: TTabSheet
          Caption = 'Admissões / Demissões'
          ImageIndex = 4
          object gbxAdm: TGroupBox
            Left = 12
            Top = 8
            Width = 569
            Height = 161
            Caption = 'Admissões'
            TabOrder = 0
            object chklstMotivoAdm: TColorCheckListBox
              Left = 11
              Top = 16
              Width = 547
              Height = 137
              OnClickCheck = speAnoChange
              ItemHeight = 13
              Style = lbOwnerDrawFixed
              TabOrder = 0
            end
          end
          object gbxDem: TGroupBox
            Left = 12
            Top = 184
            Width = 569
            Height = 161
            Caption = 'Demissões'
            TabOrder = 1
            object chklstMotivoDem: TColorCheckListBox
              Left = 11
              Top = 16
              Width = 547
              Height = 137
              OnClickCheck = speAnoChange
              ItemHeight = 13
              Style = lbOwnerDrawFixed
              TabOrder = 0
            end
          end
        end
        object tbshAfast: TTabSheet
          Caption = 'Afastamentos'
          ImageIndex = 2
          object gbxAfast: TGroupBox
            Left = 12
            Top = 8
            Width = 569
            Height = 161
            Caption = 'Início dos Afastamentos'
            TabOrder = 0
            object chklstMotivoAfast: TColorCheckListBox
              Left = 11
              Top = 16
              Width = 547
              Height = 137
              OnClickCheck = speAnoChange
              ItemHeight = 13
              Style = lbOwnerDrawFixed
              TabOrder = 0
            end
          end
          object gbxRet: TGroupBox
            Left = 12
            Top = 184
            Width = 569
            Height = 161
            Caption = 'Final dos Afastamentos'
            TabOrder = 1
            object chklstMotivoRetorno: TColorCheckListBox
              Left = 11
              Top = 16
              Width = 547
              Height = 137
              OnClickCheck = speAnoChange
              ItemHeight = 13
              Style = lbOwnerDrawFixed
              TabOrder = 0
            end
          end
        end
        object tbshValDiversos: TTabSheet
          Caption = 'Valores Normais'
          ImageIndex = 1
          object gbxRubSal: TGroupBox
            Left = 7
            Top = 2
            Width = 579
            Height = 347
            Caption = 'Rubricas que compõem:'
            ParentShowHint = False
            ShowHint = False
            TabOrder = 0
            object lblDescricao1: TLabel
              Left = 8
              Top = 300
              Width = 159
              Height = 13
              Caption = 'Procura por Rubricas pelo Código'
            end
            object edCodRubricas: TEdit
              Left = 8
              Top = 314
              Width = 460
              Height = 21
              Hint = 
                'Digite aqui o código das Rubricas a procurar separados por vírgu' +
                'la'
              ParentShowHint = False
              ShowHint = True
              TabOrder = 0
            end
            object sbtnMarcarRub: TBitBtn
              Left = 476
              Top = 311
              Width = 95
              Height = 28
              Caption = '   &Marcar'
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clNavy
              Font.Height = -12
              Font.Name = 'MS Sans Serif'
              Font.Style = []
              ParentFont = False
              ParentShowHint = False
              ShowHint = False
              TabOrder = 1
              TabStop = False
              OnClick = sbtnMarcarRubClick
              Glyph.Data = {
                76010000424D7601000000000000760000002800000020000000100000000100
                0400000000000001000000000000000000001000000010000000000000000000
                8000008000000080800080000000800080008080000080808000C0C0C0000000
                FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00888888888888
                88888888888888FF8888888888888778888888888888F77F8888888888800F08
                8888888888F7787F88888888800FFF0888888888F7788878F88888800FFFFFF0
                88888887788888F7F8888887FFFFFCF088888887FFF887878F888811111CCFFF
                08888877777F788F7F8881999991FFCF088887777777F87878F8998999991CFF
                F088778777777F88F78F99F899991FFCFF0877F877777F87887899FF89991CCF
                FFF077FF87777F7888F799F9F8891FFFF77877F7F8877F88F77899F99FF81FF7
                788877F77FF878F7788889999991777888888777777787788888889999988888
                8888887777788888888888888888888888888888888888888888}
              NumGlyphs = 2
              Spacing = 0
            end
            object pgctrlRubricas: TPageControl
              Left = 8
              Top = 15
              Width = 563
              Height = 282
              ActivePage = tbshFolhaNormal
              HotTrack = True
              MultiLine = True
              TabOrder = 2
              OnChange = pgctrlRubricasChange
              object tbshFolhaNormal: TTabSheet
                Caption = 'Salário Normal'
                object chklstRub1: TColorCheckListBox
                  Left = 1
                  Top = 2
                  Width = 415
                  Height = 223
                  OnClickCheck = chklstRub1ClickCheck
                  Font.Charset = DEFAULT_CHARSET
                  Font.Color = clBlack
                  Font.Height = -11
                  Font.Name = 'MS Sans Serif'
                  Font.Style = []
                  ItemHeight = 13
                  ParentFont = False
                  Style = lbOwnerDrawFixed
                  TabOrder = 0
                  OnClick = chklstRub1Click
                  OnKeyDown = chklstRub1KeyDown
                end
              end
              object tbsh1Parc13: TTabSheet
                Caption = '1º Parcela do 13º'
                object chklstRub2: TColorCheckListBox
                  Left = 1
                  Top = 2
                  Width = 415
                  Height = 223
                  OnClickCheck = chklstRub1ClickCheck
                  Font.Charset = DEFAULT_CHARSET
                  Font.Color = clBlack
                  Font.Height = -11
                  Font.Name = 'MS Sans Serif'
                  Font.Style = []
                  ItemHeight = 13
                  ParentFont = False
                  Style = lbOwnerDrawFixed
                  TabOrder = 0
                  OnClick = chklstRub1Click
                  OnKeyDown = chklstRub1KeyDown
                end
              end
              object tbsh2Parc13: TTabSheet
                Caption = '2º Parcela do 13º'
                object chklstRub3: TColorCheckListBox
                  Left = 1
                  Top = 2
                  Width = 415
                  Height = 223
                  OnClickCheck = chklstRub1ClickCheck
                  Font.Charset = DEFAULT_CHARSET
                  Font.Color = clBlack
                  Font.Height = -11
                  Font.Name = 'MS Sans Serif'
                  Font.Style = []
                  ItemHeight = 13
                  ParentFont = False
                  Style = lbOwnerDrawFixed
                  TabOrder = 0
                  OnClick = chklstRub1Click
                  OnKeyDown = chklstRub1KeyDown
                end
              end
              object tbshSalContratual: TTabSheet
                Caption = 'Salário Contratual'
                ImageIndex = 5
                object chklstRub4: TColorCheckListBox
                  Left = 1
                  Top = 2
                  Width = 415
                  Height = 223
                  OnClickCheck = chklstRub1ClickCheck
                  Font.Charset = DEFAULT_CHARSET
                  Font.Color = clBlack
                  Font.Height = -11
                  Font.Name = 'MS Sans Serif'
                  Font.Style = []
                  ItemHeight = 13
                  ParentFont = False
                  Style = lbOwnerDrawFixed
                  TabOrder = 0
                  OnClick = chklstRub1Click
                  OnKeyDown = chklstRub1KeyDown
                end
              end
              object tbshQuantHorasExtras: TTabSheet
                Caption = 'Quant. Horas Extras Mensais'
                ImageIndex = 4
                object chklstRub5: TColorCheckListBox
                  Left = 1
                  Top = 2
                  Width = 415
                  Height = 223
                  OnClickCheck = chklstRub1ClickCheck
                  Font.Charset = DEFAULT_CHARSET
                  Font.Color = clBlack
                  Font.Height = -11
                  Font.Name = 'MS Sans Serif'
                  Font.Style = []
                  ItemHeight = 13
                  ParentFont = False
                  Style = lbOwnerDrawFixed
                  TabOrder = 0
                  OnClick = chklstRub1Click
                  OnKeyDown = chklstRub1KeyDown
                end
              end
            end
            object bbtnSelTodasRub: TBitBtn
              Left = 432
              Top = 41
              Width = 132
              Height = 25
              Caption = '   Seleciona Todas'
              TabOrder = 3
              TabStop = False
              OnClick = bbtnSelTodasRubClick
              Glyph.Data = {
                76010000424D7601000000000000760000002800000020000000100000000100
                0400000000000001000000000000000000001000000010000000000000000000
                80000080000000808000800000008000800080800000C0C0C000808080000000
                FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00333333333333
                3333333333333333333333333333333333333333333333333333333333300000
                0003333333388888888333333330FF9FFF0333333338FF7FFF8333333000F999
                FF0333333888F777FF83333330F099F99F03333338F877F77F83333000F09FFF
                9903333888F87FFF77833330F090FFFFF9933338F878FFFFF7733000F0900000
                00993888F8788888887730F090FFFFF9933338F878FFFFF7733330F090000000
                993338F87888888877333090FFFFF99333333878FFFFF7733333309000000099
                3333387888888877333330FFFFF99333333338FFFFF773333333300000009933
                3333388888887733333333333333333333333333333333333333}
              NumGlyphs = 2
              Spacing = 0
            end
            object bbtnInverteSelRub: TBitBtn
              Left = 432
              Top = 68
              Width = 132
              Height = 25
              Caption = '   Inverte Seleção'
              TabOrder = 4
              TabStop = False
              OnClick = bbtnInverteSelRubClick
              Glyph.Data = {
                76010000424D7601000000000000760000002800000020000000100000000100
                0400000000000001000000000000000000001000000010000000000000000000
                80000080000000808000800000008000800080800000C0C0C000808080000000
                FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00333333333333
                3333333333333333333333333333000000003333333388888888333333330FFF
                FFF0333333338FFFFFF8333000330FFFFFF0333788338FFFFFF8333033330FFF
                FFF0333833338FFFFFF8330003330FFFFFF0337783338FFFFFF8333033330FFF
                FFF0333833338FFFFFF833333333000000003333333388888888000000003333
                333388888888333333330FF9FFF0333303338FF7FFF8333383330F999FF03330
                00338F777FF833387733099F99F033330333877F77F83333833309FFF9903300
                033387FFF778338873330FFFFF99333333338FFFFF7733333333000000099333
                3333888888877333333333333333333333333333333333333333}
              NumGlyphs = 2
              Spacing = 0
            end
            object stxtTipoFolha: TStaticText
              Left = 20
              Top = 271
              Width = 69
              Height = 17
              Caption = 'Tipo de Folha'
              TabOrder = 5
            end
            object dblkcbTipoFolha: TwwDBLookupCombo
              Left = 92
              Top = 269
              Width = 337
              Height = 21
              DropDownAlignment = taLeftJustify
              Selected.Strings = (
                'DESCRICAO'#9'50'#9'DESCRICAO'#9'F')
              LookupTable = CdsTipoFolha
              LookupField = 'IDMOTIVO'
              Style = csDropDownList
              ParentShowHint = False
              ShowHint = False
              TabOrder = 6
              AutoDropDown = True
              ShowButton = True
              AllowClearKey = True
              OnChange = dblkcbTipoFolhaChange
            end
          end
        end
        object tbshContribuicao: TTabSheet
          Caption = 'Contribuições'
          ImageIndex = 3
          object GroupBox1: TGroupBox
            Left = 7
            Top = 1
            Width = 579
            Height = 352
            Caption = 'Rubricas que compõem as contribuições:'
            ParentShowHint = False
            ShowHint = False
            TabOrder = 0
            object Label7: TLabel
              Left = 8
              Top = 304
              Width = 159
              Height = 13
              Caption = 'Procura por Rubricas pelo Código'
            end
            object pgctrlTipoContrib: TPageControl
              Left = 8
              Top = 19
              Width = 563
              Height = 324
              ActivePage = tbshEmpregados
              TabOrder = 4
              OnChange = pgctrlContribChange
              object tbshEmpregados: TTabSheet
                Caption = 'Dos Empregados'
                ImageIndex = 1
                object pgctrlContrib: TPageControl
                  Left = 4
                  Top = 2
                  Width = 546
                  Height = 290
                  ActivePage = tbshContribAssoc
                  HotTrack = True
                  MultiLine = True
                  TabOrder = 0
                  OnChange = pgctrlContribChange
                  object tbshContribAssoc: TTabSheet
                    Caption = 'Associativa'
                    object chklstRubContrib1: TColorCheckListBox
                      Left = 1
                      Top = 2
                      Width = 397
                      Height = 228
                      OnClickCheck = chklstRubContrib1ClickCheck
                      Font.Charset = DEFAULT_CHARSET
                      Font.Color = clBlack
                      Font.Height = -11
                      Font.Name = 'MS Sans Serif'
                      Font.Style = []
                      ItemHeight = 13
                      ParentFont = False
                      Style = lbOwnerDrawFixed
                      TabOrder = 0
                    end
                  end
                  object tbshContribSind: TTabSheet
                    Caption = 'Sindical'
                    object chklstRubContrib2: TColorCheckListBox
                      Left = 1
                      Top = 2
                      Width = 397
                      Height = 228
                      OnClickCheck = chklstRubContrib1ClickCheck
                      Font.Charset = DEFAULT_CHARSET
                      Font.Color = clBlack
                      Font.Height = -11
                      Font.Name = 'MS Sans Serif'
                      Font.Style = []
                      ItemHeight = 13
                      ParentFont = False
                      Style = lbOwnerDrawFixed
                      TabOrder = 0
                    end
                  end
                  object tbshContribAssist: TTabSheet
                    Caption = 'Assistencial'
                    object chklstRubContrib3: TColorCheckListBox
                      Left = 1
                      Top = 2
                      Width = 397
                      Height = 228
                      OnClickCheck = chklstRubContrib1ClickCheck
                      Font.Charset = DEFAULT_CHARSET
                      Font.Color = clBlack
                      Font.Height = -11
                      Font.Name = 'MS Sans Serif'
                      Font.Style = []
                      ItemHeight = 13
                      ParentFont = False
                      Style = lbOwnerDrawFixed
                      TabOrder = 0
                    end
                  end
                  object tbshContribConf: TTabSheet
                    Caption = 'Confederativa'
                    ImageIndex = 3
                    object chklstRubContrib4: TColorCheckListBox
                      Left = 1
                      Top = 2
                      Width = 397
                      Height = 228
                      OnClickCheck = chklstRubContrib1ClickCheck
                      Font.Charset = DEFAULT_CHARSET
                      Font.Color = clBlack
                      Font.Height = -11
                      Font.Name = 'MS Sans Serif'
                      Font.Style = []
                      ItemHeight = 13
                      ParentFont = False
                      Style = lbOwnerDrawFixed
                      TabOrder = 0
                    end
                  end
                end
              end
              object tbshPatronal: TTabSheet
                Caption = 'Patronal'
                object pgctrlContribPatronal: TPageControl
                  Left = 4
                  Top = 2
                  Width = 546
                  Height = 290
                  ActivePage = tbshContribAssocPatronal
                  HotTrack = True
                  MultiLine = True
                  TabOrder = 0
                  OnChange = pgctrlContribChange
                  object tbshContribAssocPatronal: TTabSheet
                    Caption = 'Associativa'
                    object chklstRubContribPatronal1: TColorCheckListBox
                      Left = 1
                      Top = 2
                      Width = 397
                      Height = 228
                      OnClickCheck = chklstRubContrib1ClickCheck
                      Font.Charset = DEFAULT_CHARSET
                      Font.Color = clBlack
                      Font.Height = -11
                      Font.Name = 'MS Sans Serif'
                      Font.Style = []
                      ItemHeight = 13
                      ParentFont = False
                      Style = lbOwnerDrawFixed
                      TabOrder = 0
                    end
                  end
                  object tbshContribSindPatronal: TTabSheet
                    Caption = 'Sindical'
                    object chklstRubContribPatronal2: TColorCheckListBox
                      Left = 1
                      Top = 2
                      Width = 397
                      Height = 228
                      OnClickCheck = chklstRubContrib1ClickCheck
                      Font.Charset = DEFAULT_CHARSET
                      Font.Color = clBlack
                      Font.Height = -11
                      Font.Name = 'MS Sans Serif'
                      Font.Style = []
                      ItemHeight = 13
                      ParentFont = False
                      Style = lbOwnerDrawFixed
                      TabOrder = 0
                    end
                  end
                  object tbshContribAssistPatronal: TTabSheet
                    Caption = 'Assistencial'
                    object chklstRubContribPatronal3: TColorCheckListBox
                      Left = 1
                      Top = 2
                      Width = 397
                      Height = 228
                      OnClickCheck = chklstRubContrib1ClickCheck
                      Font.Charset = DEFAULT_CHARSET
                      Font.Color = clBlack
                      Font.Height = -11
                      Font.Name = 'MS Sans Serif'
                      Font.Style = []
                      ItemHeight = 13
                      ParentFont = False
                      Style = lbOwnerDrawFixed
                      TabOrder = 0
                    end
                  end
                  object tbshContribConfPatronal: TTabSheet
                    Caption = 'Confederativa'
                    ImageIndex = 3
                    object chklstRubContribPatronal4: TColorCheckListBox
                      Left = 1
                      Top = 2
                      Width = 397
                      Height = 228
                      OnClickCheck = chklstRubContrib1ClickCheck
                      Font.Charset = DEFAULT_CHARSET
                      Font.Color = clBlack
                      Font.Height = -11
                      Font.Name = 'MS Sans Serif'
                      Font.Style = []
                      ItemHeight = 13
                      ParentFont = False
                      Style = lbOwnerDrawFixed
                      TabOrder = 0
                    end
                  end
                end
              end
            end
            object edCodRubricasContrib: TEdit
              Left = 21
              Top = 304
              Width = 435
              Height = 21
              Hint = 
                'Digite aqui o código das Rubricas a procurar separados por vírgu' +
                'la'
              ParentShowHint = False
              ShowHint = True
              TabOrder = 0
            end
            object sbtnMarcarRubContrib: TBitBtn
              Left = 460
              Top = 301
              Width = 95
              Height = 28
              Caption = '   &Marcar'
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clNavy
              Font.Height = -12
              Font.Name = 'MS Sans Serif'
              Font.Style = []
              ParentFont = False
              ParentShowHint = False
              ShowHint = False
              TabOrder = 1
              TabStop = False
              OnClick = sbtnMarcarRubContribClick
              Glyph.Data = {
                76010000424D7601000000000000760000002800000020000000100000000100
                0400000000000001000000000000000000001000000010000000000000000000
                8000008000000080800080000000800080008080000080808000C0C0C0000000
                FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00888888888888
                88888888888888FF8888888888888778888888888888F77F8888888888800F08
                8888888888F7787F88888888800FFF0888888888F7788878F88888800FFFFFF0
                88888887788888F7F8888887FFFFFCF088888887FFF887878F888811111CCFFF
                08888877777F788F7F8881999991FFCF088887777777F87878F8998999991CFF
                F088778777777F88F78F99F899991FFCFF0877F877777F87887899FF89991CCF
                FFF077FF87777F7888F799F9F8891FFFF77877F7F8877F88F77899F99FF81FF7
                788877F77FF878F7788889999991777888888777777787788888889999988888
                8888887777788888888888888888888888888888888888888888}
              NumGlyphs = 2
              Spacing = 0
            end
            object bbtnSelTodasRubContrib: TBitBtn
              Left = 423
              Top = 72
              Width = 132
              Height = 25
              Caption = '   Seleciona Todas'
              TabOrder = 2
              TabStop = False
              OnClick = bbtnSelTodasRubContribClick
              Glyph.Data = {
                76010000424D7601000000000000760000002800000020000000100000000100
                0400000000000001000000000000000000001000000010000000000000000000
                80000080000000808000800000008000800080800000C0C0C000808080000000
                FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00333333333333
                3333333333333333333333333333333333333333333333333333333333300000
                0003333333388888888333333330FF9FFF0333333338FF7FFF8333333000F999
                FF0333333888F777FF83333330F099F99F03333338F877F77F83333000F09FFF
                9903333888F87FFF77833330F090FFFFF9933338F878FFFFF7733000F0900000
                00993888F8788888887730F090FFFFF9933338F878FFFFF7733330F090000000
                993338F87888888877333090FFFFF99333333878FFFFF7733333309000000099
                3333387888888877333330FFFFF99333333338FFFFF773333333300000009933
                3333388888887733333333333333333333333333333333333333}
              NumGlyphs = 2
              Spacing = 0
            end
            object bbtnInverteSelRubContrib: TBitBtn
              Left = 423
              Top = 99
              Width = 132
              Height = 25
              Caption = '   Inverte Seleção'
              TabOrder = 3
              TabStop = False
              OnClick = bbtnInverteSelRubContribClick
              Glyph.Data = {
                76010000424D7601000000000000760000002800000020000000100000000100
                0400000000000001000000000000000000001000000010000000000000000000
                80000080000000808000800000008000800080800000C0C0C000808080000000
                FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00333333333333
                3333333333333333333333333333000000003333333388888888333333330FFF
                FFF0333333338FFFFFF8333000330FFFFFF0333788338FFFFFF8333033330FFF
                FFF0333833338FFFFFF8330003330FFFFFF0337783338FFFFFF8333033330FFF
                FFF0333833338FFFFFF833333333000000003333333388888888000000003333
                333388888888333333330FF9FFF0333303338FF7FFF8333383330F999FF03330
                00338F777FF833387733099F99F033330333877F77F83333833309FFF9903300
                033387FFF778338873330FFFFF99333333338FFFFF7733333333000000099333
                3333888888877333333333333333333333333333333333333333}
              NumGlyphs = 2
              Spacing = 0
            end
          end
        end
        object tbshPAT: TTabSheet
          Caption = 'PAT'
          ImageIndex = 5
          object GroupBox2: TGroupBox
            Left = 7
            Top = 2
            Width = 579
            Height = 207
            Caption = 'Rubricas que compõem o Vale Alimentação'
            ParentShowHint = False
            ShowHint = False
            TabOrder = 0
            object Label8: TLabel
              Left = 10
              Top = 159
              Width = 159
              Height = 13
              Caption = 'Procura por Rubricas pelo Código'
            end
            object chklstRubPAT: TColorCheckListBox
              Left = 10
              Top = 15
              Width = 426
              Height = 140
              OnClickCheck = chklstRubPATClickCheck
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clBlack
              Font.Height = -11
              Font.Name = 'MS Sans Serif'
              Font.Style = []
              ItemHeight = 13
              ParentFont = False
              Style = lbOwnerDrawFixed
              TabOrder = 0
            end
            object bbtnSelTodasRubPAT: TBitBtn
              Left = 440
              Top = 15
              Width = 132
              Height = 25
              Caption = '   Seleciona Todas'
              TabOrder = 1
              TabStop = False
              OnClick = bbtnSelTodasRubPATClick
              Glyph.Data = {
                76010000424D7601000000000000760000002800000020000000100000000100
                0400000000000001000000000000000000001000000010000000000000000000
                80000080000000808000800000008000800080800000C0C0C000808080000000
                FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00333333333333
                3333333333333333333333333333333333333333333333333333333333300000
                0003333333388888888333333330FF9FFF0333333338FF7FFF8333333000F999
                FF0333333888F777FF83333330F099F99F03333338F877F77F83333000F09FFF
                9903333888F87FFF77833330F090FFFFF9933338F878FFFFF7733000F0900000
                00993888F8788888887730F090FFFFF9933338F878FFFFF7733330F090000000
                993338F87888888877333090FFFFF99333333878FFFFF7733333309000000099
                3333387888888877333330FFFFF99333333338FFFFF773333333300000009933
                3333388888887733333333333333333333333333333333333333}
              NumGlyphs = 2
              Spacing = 0
            end
            object bbtnInverteSelRubPAT: TBitBtn
              Left = 440
              Top = 42
              Width = 132
              Height = 25
              Caption = '   Inverte Seleção'
              TabOrder = 2
              TabStop = False
              OnClick = bbtnInverteSelRubPATClick
              Glyph.Data = {
                76010000424D7601000000000000760000002800000020000000100000000100
                0400000000000001000000000000000000001000000010000000000000000000
                80000080000000808000800000008000800080800000C0C0C000808080000000
                FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00333333333333
                3333333333333333333333333333000000003333333388888888333333330FFF
                FFF0333333338FFFFFF8333000330FFFFFF0333788338FFFFFF8333033330FFF
                FFF0333833338FFFFFF8330003330FFFFFF0337783338FFFFFF8333033330FFF
                FFF0333833338FFFFFF833333333000000003333333388888888000000003333
                333388888888333333330FF9FFF0333303338FF7FFF8333383330F999FF03330
                00338F777FF833387733099F99F033330333877F77F83333833309FFF9903300
                033387FFF778338873330FFFFF99333333338FFFFF7733333333000000099333
                3333888888877333333333333333333333333333333333333333}
              NumGlyphs = 2
              Spacing = 0
            end
            object edCodRubricasPAT: TEdit
              Left = 10
              Top = 173
              Width = 426
              Height = 21
              Hint = 
                'Digite aqui o código das Rubricas a procurar separados por vírgu' +
                'la'
              ParentShowHint = False
              ShowHint = True
              TabOrder = 3
            end
            object sbtnMarcarRubPAT: TBitBtn
              Left = 440
              Top = 170
              Width = 132
              Height = 28
              Caption = '   &Marcar'
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clNavy
              Font.Height = -12
              Font.Name = 'MS Sans Serif'
              Font.Style = []
              ParentFont = False
              ParentShowHint = False
              ShowHint = False
              TabOrder = 4
              TabStop = False
              OnClick = sbtnMarcarRubPATClick
              Glyph.Data = {
                76010000424D7601000000000000760000002800000020000000100000000100
                0400000000000001000000000000000000001000000010000000000000000000
                8000008000000080800080000000800080008080000080808000C0C0C0000000
                FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00888888888888
                88888888888888FF8888888888888778888888888888F77F8888888888800F08
                8888888888F7787F88888888800FFF0888888888F7788878F88888800FFFFFF0
                88888887788888F7F8888887FFFFFCF088888887FFF887878F888811111CCFFF
                08888877777F788F7F8881999991FFCF088887777777F87878F8998999991CFF
                F088778777777F88F78F99F899991FFCFF0877F877777F87887899FF89991CCF
                FFF077FF87777F7888F799F9F8891FFFF77877F7F8877F88F77899F99FF81FF7
                788877F77FF878F7788889999991777888888777777787788888889999988888
                8888887777788888888888888888888888888888888888888888}
              NumGlyphs = 2
              Spacing = 0
            end
          end
          object gbxPorcent: TGroupBox
            Left = 7
            Top = 269
            Width = 579
            Height = 100
            Caption = 
              'Percentual da(s) modalidade(s) utilizada(s) pela empresa, em rel' +
              'ação ao número total de beneficiados pelo PAT:'
            ParentShowHint = False
            ShowHint = False
            TabOrder = 1
            object Label1: TLabel
              Left = 54
              Top = 16
              Width = 71
              Height = 13
              Caption = 'Serviço próprio'
            end
            object Label2: TLabel
              Left = 232
              Top = 16
              Width = 121
              Height = 13
              Caption = 'Administração de cozinha'
            end
            object Label3: TLabel
              Left = 416
              Top = 16
              Width = 90
              Height = 13
              Caption = 'Refeição convênio'
            end
            object Label4: TLabel
              Left = 54
              Top = 56
              Width = 114
              Height = 13
              Caption = 'Refeição transportadora'
            end
            object Label5: TLabel
              Left = 232
              Top = 56
              Width = 69
              Height = 13
              Caption = 'Cesta alimento'
            end
            object Label6: TLabel
              Left = 416
              Top = 56
              Width = 105
              Height = 13
              Caption = 'Alimentação convênio'
            end
            object redPorc1: TRealEdit
              Left = 54
              Top = 30
              Width = 59
              Height = 21
              Alignment = taRightJustify
              Ctl3D = True
              Lines.Strings = (
                '0')
              ParentCtl3D = False
              ParentShowHint = False
              ShowHint = False
              TabOrder = 0
              WordWrap = False
              IntDigits = 3
              DecDigits = 0
              NumberFormat = iNumber
              Signal = False
            end
            object redPorc2: TRealEdit
              Left = 232
              Top = 30
              Width = 59
              Height = 21
              Hint = 'Percentual a ser aplicado aos valores a recolher'
              Alignment = taRightJustify
              Ctl3D = True
              Lines.Strings = (
                '0')
              ParentCtl3D = False
              ParentShowHint = False
              ShowHint = False
              TabOrder = 1
              WordWrap = False
              IntDigits = 3
              DecDigits = 0
              NumberFormat = iNumber
              Signal = False
            end
            object redPorc3: TRealEdit
              Left = 416
              Top = 30
              Width = 59
              Height = 21
              Hint = 'Percentual a ser aplicado aos valores a recolher'
              Alignment = taRightJustify
              Ctl3D = True
              Lines.Strings = (
                '0')
              ParentCtl3D = False
              ParentShowHint = False
              ShowHint = False
              TabOrder = 2
              WordWrap = False
              IntDigits = 3
              DecDigits = 0
              NumberFormat = iNumber
              Signal = False
            end
            object redPorc4: TRealEdit
              Left = 54
              Top = 71
              Width = 59
              Height = 21
              Hint = 'Percentual a ser aplicado aos valores a recolher'
              Alignment = taRightJustify
              Ctl3D = True
              Lines.Strings = (
                '0')
              ParentCtl3D = False
              ParentShowHint = False
              ShowHint = False
              TabOrder = 3
              WordWrap = False
              IntDigits = 3
              DecDigits = 0
              NumberFormat = iNumber
              Signal = False
            end
            object redPorc5: TRealEdit
              Left = 232
              Top = 71
              Width = 59
              Height = 21
              Hint = 'Percentual a ser aplicado aos valores a recolher'
              Alignment = taRightJustify
              Ctl3D = True
              Lines.Strings = (
                '0')
              ParentCtl3D = False
              ParentShowHint = False
              ShowHint = False
              TabOrder = 4
              WordWrap = False
              IntDigits = 3
              DecDigits = 0
              NumberFormat = iNumber
              Signal = False
            end
            object redPorc6: TRealEdit
              Left = 416
              Top = 71
              Width = 59
              Height = 21
              Hint = 'Percentual a ser aplicado aos valores a recolher'
              Alignment = taRightJustify
              Ctl3D = True
              Lines.Strings = (
                '0')
              ParentCtl3D = False
              ParentShowHint = False
              ShowHint = False
              TabOrder = 5
              WordWrap = False
              IntDigits = 3
              DecDigits = 0
              NumberFormat = iNumber
              Signal = False
            end
          end
          object rgIndPAT: TRadioGroup
            Left = 7
            Top = 217
            Width = 282
            Height = 44
            Caption = 'Indicador de participação no PAT'
            Columns = 2
            ItemIndex = 0
            Items.Strings = (
              'Participa'
              'Não Participa')
            TabOrder = 2
          end
        end
        object tbshRescisao: TTabSheet
          Caption = 'Rescisão'
          ImageIndex = 6
          object GroupBox4: TGroupBox
            Left = 7
            Top = 0
            Width = 579
            Height = 121
            Caption = 'Tipos de Folha'
            TabOrder = 0
            object chklstMotivoResc: TColorCheckListBox
              Left = 8
              Top = 15
              Width = 563
              Height = 97
              OnClickCheck = speAnoChange
              ItemHeight = 13
              Style = lbOwnerDrawFixed
              TabOrder = 0
            end
          end
          object GroupBox3: TGroupBox
            Left = 7
            Top = 124
            Width = 579
            Height = 231
            Caption = 'Rubricas que compõem:'
            ParentShowHint = False
            ShowHint = False
            TabOrder = 1
            object Label9: TLabel
              Left = 8
              Top = 186
              Width = 159
              Height = 13
              Caption = 'Procura por Rubricas pelo Código'
            end
            object edCodRubricasResc: TEdit
              Left = 8
              Top = 200
              Width = 460
              Height = 21
              Hint = 
                'Digite aqui o código das Rubricas a procurar separados por vírgu' +
                'la'
              ParentShowHint = False
              ShowHint = True
              TabOrder = 0
            end
            object sbtnMarcarRubResc: TBitBtn
              Left = 476
              Top = 197
              Width = 95
              Height = 28
              Caption = '   &Marcar'
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clNavy
              Font.Height = -12
              Font.Name = 'MS Sans Serif'
              Font.Style = []
              ParentFont = False
              ParentShowHint = False
              ShowHint = False
              TabOrder = 1
              TabStop = False
              OnClick = sbtnMarcarRubRescClick
              Glyph.Data = {
                76010000424D7601000000000000760000002800000020000000100000000100
                0400000000000001000000000000000000001000000010000000000000000000
                8000008000000080800080000000800080008080000080808000C0C0C0000000
                FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00888888888888
                88888888888888FF8888888888888778888888888888F77F8888888888800F08
                8888888888F7787F88888888800FFF0888888888F7788878F88888800FFFFFF0
                88888887788888F7F8888887FFFFFCF088888887FFF887878F888811111CCFFF
                08888877777F788F7F8881999991FFCF088887777777F87878F8998999991CFF
                F088778777777F88F78F99F899991FFCFF0877F877777F87887899FF89991CCF
                FFF077FF87777F7888F799F9F8891FFFF77877F7F8877F88F77899F99FF81FF7
                788877F77FF878F7788889999991777888888777777787788888889999988888
                8888887777788888888888888888888888888888888888888888}
              NumGlyphs = 2
              Spacing = 0
            end
            object pgctrlRubricasResc: TPageControl
              Left = 8
              Top = 15
              Width = 563
              Height = 168
              ActivePage = tbshAvisoPrevio
              HotTrack = True
              MultiLine = True
              TabOrder = 2
              OnChange = pgctrlRubricasRescChange
              object tbshAvisoPrevio: TTabSheet
                Caption = 'Aviso Prévio Indenizado'
                ImageIndex = 4
                object chklstRubResc1: TColorCheckListBox
                  Left = 1
                  Top = 2
                  Width = 415
                  Height = 135
                  OnClickCheck = chklstRubResc1ClickCheck
                  Font.Charset = DEFAULT_CHARSET
                  Font.Color = clBlack
                  Font.Height = -11
                  Font.Name = 'MS Sans Serif'
                  Font.Style = []
                  ItemHeight = 13
                  ParentFont = False
                  Style = lbOwnerDrawFixed
                  TabOrder = 0
                end
              end
              object tbshFeriasIndeniz: TTabSheet
                Caption = 'Férias Indenizadas'
                object chklstRubResc2: TColorCheckListBox
                  Left = 1
                  Top = 2
                  Width = 415
                  Height = 135
                  OnClickCheck = chklstRubResc1ClickCheck
                  Font.Charset = DEFAULT_CHARSET
                  Font.Color = clBlack
                  Font.Height = -11
                  Font.Name = 'MS Sans Serif'
                  Font.Style = []
                  ItemHeight = 13
                  ParentFont = False
                  Style = lbOwnerDrawFixed
                  TabOrder = 0
                end
              end
              object tbshBancoHoras: TTabSheet
                Caption = 'Banco de Horas'
                object chklstRubResc3: TColorCheckListBox
                  Left = 1
                  Top = 2
                  Width = 415
                  Height = 135
                  OnClickCheck = chklstRubResc1ClickCheck
                  Font.Charset = DEFAULT_CHARSET
                  Font.Color = clBlack
                  Font.Height = -11
                  Font.Name = 'MS Sans Serif'
                  Font.Style = []
                  ItemHeight = 13
                  ParentFont = False
                  Style = lbOwnerDrawFixed
                  TabOrder = 0
                end
              end
              object tbshDissidio: TTabSheet
                Caption = 'Dissídio'
                object chklstRubResc4: TColorCheckListBox
                  Left = 1
                  Top = 2
                  Width = 415
                  Height = 135
                  OnClickCheck = chklstRubResc1ClickCheck
                  Font.Charset = DEFAULT_CHARSET
                  Font.Color = clBlack
                  Font.Height = -11
                  Font.Name = 'MS Sans Serif'
                  Font.Style = []
                  ItemHeight = 13
                  ParentFont = False
                  Style = lbOwnerDrawFixed
                  TabOrder = 0
                end
              end
              object tbshGratif: TTabSheet
                Caption = 'Gratificações'
                ImageIndex = 5
                object chklstRubResc5: TColorCheckListBox
                  Left = 1
                  Top = 2
                  Width = 415
                  Height = 135
                  OnClickCheck = chklstRubResc1ClickCheck
                  Font.Charset = DEFAULT_CHARSET
                  Font.Color = clBlack
                  Font.Height = -11
                  Font.Name = 'MS Sans Serif'
                  Font.Style = []
                  ItemHeight = 13
                  ParentFont = False
                  Style = lbOwnerDrawFixed
                  TabOrder = 0
                end
              end
              object tbshMultaResc: TTabSheet
                Caption = 'Multa Rescisória'
                ImageIndex = 5
                object chklstRubResc6: TColorCheckListBox
                  Left = 1
                  Top = 2
                  Width = 415
                  Height = 135
                  OnClickCheck = chklstRubResc1ClickCheck
                  Font.Charset = DEFAULT_CHARSET
                  Font.Color = clBlack
                  Font.Height = -11
                  Font.Name = 'MS Sans Serif'
                  Font.Style = []
                  ItemHeight = 13
                  ParentFont = False
                  Style = lbOwnerDrawFixed
                  TabOrder = 0
                end
              end
            end
            object bbtnSelTodasRubResc: TBitBtn
              Left = 432
              Top = 41
              Width = 132
              Height = 25
              Caption = '   Seleciona Todas'
              TabOrder = 3
              TabStop = False
              OnClick = bbtnSelTodasRubRescClick
              Glyph.Data = {
                76010000424D7601000000000000760000002800000020000000100000000100
                0400000000000001000000000000000000001000000010000000000000000000
                80000080000000808000800000008000800080800000C0C0C000808080000000
                FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00333333333333
                3333333333333333333333333333333333333333333333333333333333300000
                0003333333388888888333333330FF9FFF0333333338FF7FFF8333333000F999
                FF0333333888F777FF83333330F099F99F03333338F877F77F83333000F09FFF
                9903333888F87FFF77833330F090FFFFF9933338F878FFFFF7733000F0900000
                00993888F8788888887730F090FFFFF9933338F878FFFFF7733330F090000000
                993338F87888888877333090FFFFF99333333878FFFFF7733333309000000099
                3333387888888877333330FFFFF99333333338FFFFF773333333300000009933
                3333388888887733333333333333333333333333333333333333}
              NumGlyphs = 2
              Spacing = 0
            end
            object bbtnInverteSelRubResc: TBitBtn
              Left = 432
              Top = 68
              Width = 132
              Height = 25
              Caption = '   Inverte Seleção'
              TabOrder = 4
              TabStop = False
              OnClick = bbtnInverteSelRubRescClick
              Glyph.Data = {
                76010000424D7601000000000000760000002800000020000000100000000100
                0400000000000001000000000000000000001000000010000000000000000000
                80000080000000808000800000008000800080800000C0C0C000808080000000
                FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00333333333333
                3333333333333333333333333333000000003333333388888888333333330FFF
                FFF0333333338FFFFFF8333000330FFFFFF0333788338FFFFFF8333033330FFF
                FFF0333833338FFFFFF8330003330FFFFFF0337783338FFFFFF8333033330FFF
                FFF0333833338FFFFFF833333333000000003333333388888888000000003333
                333388888888333333330FF9FFF0333303338FF7FFF8333383330F999FF03330
                00338F777FF833387733099F99F033330333877F77F83333833309FFF9903300
                033387FFF778338873330FFFFF99333333338FFFFF7733333333000000099333
                3333888888877333333333333333333333333333333333333333}
              NumGlyphs = 2
              Spacing = 0
            end
          end
        end
      end
    end
  end
  inherited Dock971: TDock97
    Top = 438
    Width = 617
    inherited tb97Fundo: TToolbar97
      Left = 187
      DockPos = 309
      inherited sep1: TToolbarSep97
        Left = 343
      end
      object ToolbarSep972: TToolbarSep97 [1]
        Left = 93
        Top = 0
        Blank = True
        SizeHorz = 30
      end
      object ToolbarSep971: TToolbarSep97 [2]
        Left = 232
        Top = 0
        Blank = True
        SizeHorz = 30
      end
      inherited bbtnSair: TBitBtn
        Left = 262
        TabOrder = 1
      end
      inherited bbtnAjuda: TmaHelpBitBtn
        Left = 345
        TabOrder = 2
      end
      object rbtnGerar: TBitBtn
        Left = 123
        Top = 0
        Width = 109
        Height = 33
        Caption = '  &Gerar Arquivo'
        Default = True
        TabOrder = 0
        OnClick = rbtnGerarClick
        Glyph.Data = {
          76010000424D7601000000000000760000002800000020000000100000000100
          0400000000000001000000000000000000001000000010000000000000000000
          800000800000008080008000000080008000808000007F7F7F00BFBFBF000000
          FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00333333330070
          7700333333337777777733333333008088003333333377F73377333333330088
          88003333333377FFFF7733333333000000003FFFFFFF77777777000000000000
          000077777777777777770FFFFFFF0FFFFFF07F3333337F3333370FFFFFFF0FFF
          FFF07F3FF3FF7FFFFFF70F00F0080CCC9CC07F773773777777770FFFFFFFF039
          99337F3FFFF3F7F777F30F0000F0F09999937F7777373777777F0FFFFFFFF999
          99997F3FF3FFF77777770F00F000003999337F773777773777F30FFFF0FF0339
          99337F3FF7F3733777F30F08F0F0337999337F7737F73F7777330FFFF0039999
          93337FFFF7737777733300000033333333337777773333333333}
        NumGlyphs = 2
        Spacing = 2
      end
      object bbtnVerResultado: TBitBtn
        Left = 0
        Top = 0
        Width = 93
        Height = 33
        Hint = 'Ir para tela de resultado '
        Caption = ' Resultado'
        ParentShowHint = False
        ShowHint = True
        TabOrder = 3
        OnClick = bbtnVerResultadoClick
        Glyph.Data = {
          E6000000424DE60000000000000076000000280000000E0000000E0000000100
          0400000000007000000000000000000000001000000010000000000000000000
          BF0000BF000000BFBF00BF000000BF00BF00BFBF0000C0C0C000808080000000
          FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00DDDDDDDDDDDD
          DD00DD4444DDDDDDDD00DDD444DDDDDDDD00DD4444DDDD44DD00DD44D4DDDD44
          DD00D44DDDDDDDD44D00D44DDDDDDDD44D00D44DDDDDDDD44D00D44DDDDDDDD4
          4D00DD44DDDDDD44DD00DD444DDDD444DD00DDD44444444DDD00DDDDD4444DDD
          DD00DDDDDDDDDDDDDD00}
      end
    end
  end
  object pnlProgresso: TPanel [2]
    Left = 57
    Top = 442
    Width = 557
    Height = 105
    BevelInner = bvRaised
    BevelOuter = bvNone
    BevelWidth = 2
    TabOrder = 2
    Visible = False
    object fclblTitulo: TfcLabel
      Left = 8
      Top = 4
      Width = 524
      Height = 26
      AutoSize = False
      Caption = 'Gerando RAIS ...'
      Font.Charset = ANSI_CHARSET
      Font.Color = clWhite
      Font.Height = -24
      Font.Name = 'Times New Roman'
      Font.Style = [fsBold]
      ParentFont = False
      TextOptions.Alignment = taCenter
      TextOptions.LineSpacing = 1
      TextOptions.Shadow.Enabled = True
      TextOptions.Shadow.XOffset = 2
      TextOptions.Shadow.YOffset = 2
      TextOptions.VAlignment = vaTop
      Transparent = True
    end
    object Bevel11: TBevel
      Left = 9
      Top = 32
      Width = 538
      Height = 6
      Shape = bsTopLine
      Style = bsRaised
    end
    object lblProcesso: TLabel
      Left = -17
      Top = 35
      Width = 524
      Height = 19
      Alignment = taCenter
      AutoSize = False
      Caption = 'Iniciando Processamento...'
      Font.Charset = ANSI_CHARSET
      Font.Color = clNavy
      Font.Height = -13
      Font.Name = 'Arial'
      Font.Style = [fsBold]
      ParentFont = False
    end
    object lblHoraIni: TLabel
      Left = 16
      Top = 54
      Width = 177
      Height = 15
      AutoSize = False
      Caption = 'Hora de Início: hh:mm:ss'
      Font.Charset = ANSI_CHARSET
      Font.Color = clMaroon
      Font.Height = -15
      Font.Name = 'Times New Roman'
      Font.Style = [fsBold]
      ParentFont = False
    end
    object Bevel1: TBevel
      Left = 16
      Top = 72
      Width = 524
      Height = 19
    end
    object gagTotal: TGauge
      Left = 17
      Top = 73
      Width = 522
      Height = 17
      BorderStyle = bsNone
      Color = clBlack
      ForeColor = clNavy
      Font.Charset = ANSI_CHARSET
      Font.Color = clLime
      Font.Height = -11
      Font.Name = 'Arial'
      Font.Style = [fsBold]
      ParentColor = False
      ParentFont = False
      Progress = 50
    end
    object Label18: TLabel
      Left = 327
      Top = 54
      Width = 127
      Height = 15
      AutoSize = False
      Caption = 'Tempo Decorrido:'
      Font.Charset = ANSI_CHARSET
      Font.Color = clMaroon
      Font.Height = -15
      Font.Name = 'Times New Roman'
      Font.Style = [fsBold]
      ParentFont = False
    end
    object lblTempoDecorr: TLabel
      Left = 460
      Top = 54
      Width = 77
      Height = 15
      AutoSize = False
      Caption = '00:00:00'
      Font.Charset = ANSI_CHARSET
      Font.Color = clMaroon
      Font.Height = -15
      Font.Name = 'Times New Roman'
      Font.Style = [fsBold]
      ParentFont = False
    end
  end
  inherited ivTradutor: TIvExtendedTranslator
    Left = 122
    Top = 399
    TargetsData = (
      1
      3
      (
        '*'
        'Filter'
        0)
      (
        'TMemo'
        'Text'
        0)
      (
        'TRealEdit'
        'Text'
        0))
  end
  object svdlgDialogo: TOpenDialog
    Filter = 'Arquivos Texto|*.TXT|Todos|*.*'
    InitialDir = 'C:\RAIS'
    Options = [ofHideReadOnly, ofPathMustExist, ofNoNetworkButton]
    Title = 'Escolha a Pasta para a Geração da RAIS'
    Left = 367
    Top = 416
  end
  object CdsNomeResp: TCMClientDataSet
    Aggregates = <>
    Params = <>
    Left = 68
    Top = 400
  end
  object CdsTipoFolha: TCMClientDataSet
    Aggregates = <>
    Params = <>
    Left = 156
    Top = 392
  end
  object CdsAux: TCMClientDataSet
    Aggregates = <>
    Params = <>
    Left = 314
    Top = 416
  end
  object svdlgResult: TOpenDialog
    DefaultExt = '*.TXT'
    Filter = 'Arquivos Texto|*.TXT|Todos|*.*'
    InitialDir = 'C:\'
    Options = [ofHideReadOnly, ofPathMustExist, ofNoNetworkButton]
    Title = 'Indique o Arquivo que conterá o Resultado da Geração'
    Left = 428
    Top = 416
  end
  object cdsListaResp: TCMClientDataSet
    Active = True
    Aggregates = <>
    Params = <>
    Left = 241
    Top = 394
    Data = {
      823A00009619E0BD01000000180000000200E201000003000000690008494450
      4553534F410800040000000000044E4F4D450100490000000100055749445448
      020002003C0002000D44454641554C545F4F5244455202008200010000000200
      044C4349440400010009080000000000000000F60D27411E4341524C4F532041
      55475553544F205041434845434F205045524549524100000000000000FEA440
      11534F465454454B20544553544520313134000000000000BC9B264112534F46
      5454454B20544553544520313237350000000000006A9A264112534F46545445
      4B2054455354452031333339000000000000CC78264114534F465454454B2054
      45535445203137313835330000000000007677264114534F465454454B205445
      535445203137313837380000000000006077264114534F465454454B20544553
      544520313731383930000000000000707E124114534F465454454B2054455354
      4520313936353131000000000000347D124114534F465454454B205445535445
      20323033363432000000000000307F124114534F465454454B20544553544520
      323136333437000000000000407F124114534F465454454B2054455354452032
      3136333439000000000000D0871A4114534F465454454B205445535445203231
      38343535000000000000787C124114534F465454454B20544553544520323230
      3533300000000000007C7C124114534F465454454B2054455354452032323035
      3331000000000000707C124114534F465454454B205445535445203232323038
      34000000000000E4CF194114534F465454454B20544553544520323239333333
      00000000000000A6B54011534F465454454B2054455354452032333300000000
      00005846194114534F465454454B205445535445203233373435310000000000
      009CB1184114534F465454454B20544553544520323436323537000000000000
      00D4B64011534F465454454B2054455354452032343700000000000074411841
      14534F465454454B2054455354452032353332303000000000000024EA174114
      534F465454454B20544553544520323538353735000000000000C0D1E0401353
      4F465454454B20544553544520323633313800000000000020DA114114534F46
      5454454B2054455354452032363430383100000000000088BA124114534F4654
      54454B2054455354452032373037393700000000000030BA124114534F465454
      454B2054455354452032373038323000000000000020B9124114534F46545445
      4B2054455354452032373130343400000000000028B3124114534F465454454B
      20544553544520323731323635000000000000F4AE124114534F465454454B20
      54455354452032373135333500000000000030AE124114534F465454454B2054
      455354452032373135363000000000000060AD124114534F465454454B205445
      535445203237313630340000000000009080124114534F465454454B20544553
      5445203237323438380000000000009C83124114534F465454454B2054455354
      45203237323631360000000000002C84124114534F465454454B205445535445
      203237323734310000000000009089124114534F465454454B20544553544520
      3237323734380000000000009C89124114534F465454454B2054455354452032
      3732373531000000000000A089124114534F465454454B205445535445203237
      32373532000000000000AC89124114534F465454454B20544553544520323732
      373535000000000000C089124114534F465454454B2054455354452032373237
      36300000000000000097124114534F465454454B205445535445203237333234
      360000000000004498124114534F465454454B20544553544520323733323730
      00000000000088A9124114534F465454454B2054455354452032373430363700
      00000000006CAA124114534F465454454B205445535445203237343039330000
      0000000040AB124114534F465454454B20544553544520323734313131000000
      00000074AB124114534F465454454B2054455354452032373431313300000000
      0000241C134114534F465454454B205445535445203237353032350000000000
      00741C134114534F465454454B20544553544520323735303238000000000000
      141D134114534F465454454B20544553544520323735303338000000000000F8
      1E134114534F465454454B205445535445203237353035370000000000000820
      134114534F465454454B20544553544520323735303733000000000000EC2613
      4114534F465454454B20544553544520323735313337000000000000F0261341
      14534F465454454B205445535445203237353133380000000000008428134114
      534F465454454B20544553544520323735313730000000000000342913411453
      4F465454454B20544553544520323735313834000000000000A829134114534F
      465454454B20544553544520323735313933000000000000702E134114534F46
      5454454B205445535445203237353233300000000000009033134114534F4654
      54454B20544553544520323735323837000000000000BC33134114534F465454
      454B205445535445203237353239320000000000004C37134114534F46545445
      4B20544553544520323735333930000000000000143D134114534F465454454B
      20544553544520323735363232000000000000B48D174114534F465454454B20
      544553544520323735383330000000000000FC8E174114534F465454454B2054
      45535445203237353836310000000000002CBA264114534F465454454B205445
      535445203237363130350000000000004EBB264114534F465454454B20544553
      5445203237363131330000000000004ABC264114534F465454454B2054455354
      452032373631333000000000000012BD264114534F465454454B205445535445
      20323736313336000000000000B6C1264114534F465454454B20544553544520
      323736313734000000000000EEC1264114534F465454454B2054455354452032
      373631383700000000000030C7264114534F465454454B205445535445203237
      363236390000000000008AC7264114534F465454454B20544553544520323736
      323734000000000000DAC8264114534F465454454B2054455354452032373633
      3235000000000000DCC8264114534F465454454B205445535445203237363332
      3600000000000098C9264114534F465454454B20544553544520323736333537
      00000000000024CA264114534F465454454B2054455354452032373633363600
      000000000068CD264114534F465454454B205445535445203237363430360000
      0000000068D0264114534F465454454B20544553544520323736343435000000
      00000046D4264114534F465454454B2054455354452032373635303000000000
      0000FAD7264114534F465454454B205445535445203237363538380000000000
      002CDA264114534F465454454B20544553544520323736363039000000000000
      6CDB264114534F465454454B2054455354452032373636323700000000000092
      DB264114534F465454454B2054455354452032373636333300000000000040E4
      264114534F465454454B2054455354452032373637393600000000000076E626
      4114534F465454454B2054455354452032373638343100000000000078E62641
      14534F465454454B205445535445203237363834320000000000002AEF264114
      534F465454454B20544553544520323737303033000000000000ACF126411453
      4F465454454B2054455354452032373730333500000000000078F2264114534F
      465454454B2054455354452032373730353200000000000038F6264114534F46
      5454454B20544553544520323737303934000000000000AAFE264114534F4654
      54454B205445535445203237373239360000000000007601274114534F465454
      454B205445535445203237373334330000000000007801274114534F46545445
      4B205445535445203237373334340000000000009804274114534F465454454B
      205445535445203237373339350000000000004007274114534F465454454B20
      5445535445203237373434300000000000008E0C274114534F465454454B2054
      45535445203237373530300000000000002E0D274114534F465454454B205445
      53544520323737353038000000000000880F274114534F465454454B20544553
      5445203237373534350000000000004613274114534F465454454B2054455354
      4520323737353935000000000000F015274114534F465454454B205445535445
      2032373736323500000000000080E3E14013534F465454454B20544553544520
      32383831390000000000005CC41A4114534F465454454B205445535445203332
      333237300000000000002691284114534F465454454B20544553544520333234
      3131360000000000002891284114534F465454454B2054455354452033323431
      313700000000000056152A4114534F465454454B205445535445203334393038
      3900000000000080152A4114534F465454454B20544553544520333439303931
      000000000000981A2A4114534F465454454B2054455354452033343932373000
      0000000000001B2A4114534F465454454B205445535445203334393238380000
      00000000301B2A4114534F465454454B20544553544520333439323936000000
      00000096282A4114534F465454454B2054455354452033353036373900000000
      0000D8D4184114534F465454454B205445535445203335303933330000000000
      00007ECC4012534F465454454B2054455354452033353233000000000000BE46
      2A4114534F465454454B20544553544520333532373331000000000000909117
      4114534F465454454B205445535445203335333435320000000000007C6F1B41
      14534F465454454B205445535445203335353034370000000000002A692A4114
      534F465454454B20544553544520333537353034000000000000C49B2A411453
      4F465454454B205445535445203336313838380000000000003E9F2A4114534F
      465454454B20544553544520333631393831000000000000789F2A4114534F46
      5454454B2054455354452033363139383900000000000000BB2A4114534F4654
      54454B2054455354452033363337333700000000000002BB2A4114534F465454
      454B2054455354452033363337333800000000000056BB2A4114534F46545445
      4B20544553544520333633373434000000000000AED52A4114534F465454454B
      205445535445203336353834360000000000009CDC2A4114534F465454454B20
      54455354452033363630313300000000000070DE2A4114534F465454454B2054
      455354452033363630383000000000000052E02A4114534F465454454B205445
      5354452033363631333300000000000008F52A4114534F465454454B20544553
      544520333637383230000000000000000EE64013534F465454454B2054455354
      45203338353433000000000000603EE64013534F465454454B20544553544520
      333839373800000000000086522C4114534F465454454B205445535445203431
      31363734000000000000265D2C4114534F465454454B20544553544520343131
      38393400000000000008612C4114534F465454454B2054455354452034313230
      3833000000000000D4622C4114534F465454454B205445535445203431323233
      39000000000000D6622C4114534F465454454B20544553544520343132323430
      00000000000010632C4114534F465454454B2054455354452034313232363100
      00000000007A642C4114534F465454454B205445535445203431323435320000
      0000000080642C4114534F465454454B20544553544520343132343535000000
      000000AA672C4114534F465454454B2054455354452034313238303900000000
      00006A682C4114534F465454454B205445535445203431323835360000000000
      00BE682C4114534F465454454B20544553544520343132383839000000000000
      266B2C4114534F465454454B20544553544520343134383832000000000000DA
      6B2C4114534F465454454B20544553544520343134393234000000000000166C
      2C4114534F465454454B20544553544520343134393338000000000000FC6C2C
      4114534F465454454B205445535445203431353030330000000000007A6D2C41
      14534F465454454B20544553544520343135303535000000000000986E2C4114
      534F465454454B205445535445203431353133370000000000006062E7401353
      4F465454454B2054455354452034313632310000000000005E7A2C4114534F46
      5454454B20544553544520343136343635000000000000647A2C4114534F4654
      54454B20544553544520343136343637000000000000167B2C4114534F465454
      454B20544553544520343136353136000000000000809CCD4012534F46545445
      4B2054455354452034313734000000000000A0832C4114534F465454454B2054
      4553544520343137343733000000000000C6842C4114534F465454454B205445
      53544520343137353532000000000000CC9B2C4114534F465454454B20544553
      544520343230343031000000000000A4AA2C4114534F465454454B2054455354
      45203432323236320000000000003EC92C4114534F465454454B205445535445
      20343236303434000000000000BEC92C4114534F465454454B20544553544520
      3432363038370000000000006CCA2C4114534F465454454B2054455354452034
      323631333500000000000082CA2C4114534F465454454B205445535445203432
      3631343300000000000086CA2C4114534F465454454B20544553544520343236
      313435000000000000A6CA2C4114534F465454454B2054455354452034323631
      3534000000000000AECA2C4114534F465454454B205445535445203432363135
      38000000000000B2CA2C4114534F465454454B20544553544520343236313630
      000000000000C4CA2C4114534F465454454B2054455354452034323631363600
      00000000003ADD2C4114534F465454454B205445535445203432383331320000
      0000000050DD2C4114534F465454454B20544553544520343238333136000000
      000000BCE22C4114534F465454454B2054455354452034323838353200000000
      000066F12C4114534F465454454B205445535445203433303439370000000000
      001AF22C4114534F465454454B20544553544520343330353436000000000000
      28F22C4114534F465454454B20544553544520343330353530000000000000C6
      092D4114534F465454454B20544553544520343333333933000000000000140A
      2D4114534F465454454B205445535445203433333432300000000000005C0B2D
      4114534F465454454B205445535445203433333531350000000000000E182D41
      14534F465454454B205445535445203433353035310000000000008A182D4114
      534F465454454B2054455354452034333530383000000000000002192D411453
      4F465454454B2054455354452034333531303900000000000036192D4114534F
      465454454B205445535445203433353132350000000000004A192D4114534F46
      5454454B205445535445203433353132390000000000003C6E2D4114534F4654
      54454B205445535445203434353837360000000000008E7A2D4114534F465454
      454B20544553544520343437323137000000000000A27A2D4114534F46545445
      4B2054455354452034343732323100000000000052EE2D4114534F465454454B
      2054455354452034363139303400000000000064EE2D4114534F465454454B20
      544553544520343631393039000000000000AAEE2D4114534F465454454B2054
      4553544520343631393237000000000000BEEE2D4114534F465454454B205445
      53544520343631393336000000000000DAF22D4114534F465454454B20544553
      5445203436323431350000000000007CFE2D4114534F465454454B2054455354
      45203436333830380000000000008AFE2D4114534F465454454B205445535445
      20343633383133000000000000260B2E4114534F465454454B20544553544520
      343635323933000000000000320B2E4114534F465454454B2054455354452034
      3635323936000000000000040C2E4114534F465454454B205445535445203436
      35333834000000000000340C2E4114534F465454454B20544553544520343635
      3430350000000000006A0D2E4114534F465454454B2054455354452034363535
      32300000000000006E0D2E4114534F465454454B205445535445203436353532
      3200000000000000232E4114534F465454454B20544553544520343638303835
      0000000000009E232E4114534F465454454B2054455354452034363831353900
      0000000000B6232E4114534F465454454B205445535445203436383136390000
      0000000064302E4114534F465454454B20544553544520343639363838000000
      000000C4362E4114534F465454454B2054455354452034373031323200000000
      00003A372E4114534F465454454B205445535445203437303136370000000000
      0038382E4114534F465454454B20544553544520343730323431000000000000
      7A392E4114534F465454454B205445535445203437303334370000000000000A
      3A2E4114534F465454454B20544553544520343730333834000000000000F049
      2E4114534F465454454B20544553544520343732323434000000000000504D2E
      4114534F465454454B20544553544520343732353037000000000000524D2E41
      14534F465454454B20544553544520343732353038000000000000E0DAE94013
      534F465454454B205445535445203437333933000000000000F65A2E4114534F
      465454454B205445535445203437343035380000000000004C732E4114534F46
      5454454B20544553544520343736373432000000000000B4742E4114534F4654
      54454B2054455354452034373638333700000000000060752E4114534F465454
      454B20544553544520343737313136000000000000CC8E2E4114534F46545445
      4B20544553544520343831323032000000000000BA8F2E4114534F465454454B
      20544553544520343831323837000000000000EC8F2E4114534F465454454B20
      54455354452034383133303500000000000036902E4114534F465454454B2054
      45535445203438313332370000000000001C952E4114534F465454454B205445
      535445203438313836370000000000001E952E4114534F465454454B20544553
      544520343831383638000000000000E8A42E4114534F465454454B2054455354
      452034383337303600000000000006A52E4114534F465454454B205445535445
      2034383337313800000000000030A52E4114534F465454454B20544553544520
      34383337323900000000000032A52E4114534F465454454B2054455354452034
      3833373330000000000000B6B02E4114534F465454454B205445535445203438
      35303230000000000000DCBA2E4114534F465454454B20544553544520343836
      32323700000000000042BB2E4114534F465454454B2054455354452034383632
      353400000000000044BB2E4114534F465454454B205445535445203438363235
      3500000000000080BB2E4114534F465454454B20544553544520343836323637
      0000000000008EBB2E4114534F465454454B2054455354452034383632373200
      0000000000A6BC2E4114534F465454454B205445535445203438363334320000
      00000000C4BC2E4114534F465454454B20544553544520343836333532000000
      00000082C32E4114534F465454454B2054455354452034383730303300000000
      00001EC42E4114534F465454454B205445535445203438373034370000000000
      00A8C42E4114534F465454454B20544553544520343837303833000000000000
      AAC42E4114534F465454454B2054455354452034383730383400000000000036
      C52E4114534F465454454B20544553544520343837313138000000000000A0CA
      2E4114534F465454454B2054455354452034383736393000000000000076CB2E
      4114534F465454454B20544553544520343837373539000000000000FACB2E41
      14534F465454454B2054455354452034383737393700000000000012CE2E4114
      534F465454454B20544553544520343837393431000000000000BCD02E411453
      4F465454454B20544553544520343838313135000000000000A6DF2E4114534F
      465454454B2054455354452034383932383800000000000006E02E4114534F46
      5454454B205445535445203438393331340000000000001AE02E4114534F4654
      54454B2054455354452034383933323200000000000034E02E4114534F465454
      454B2054455354452034383933323800000000000062E02E4114534F46545445
      4B205445535445203438393333390000000000006AE02E4114534F465454454B
      205445535445203438393334330000000000006CE02E4114534F465454454B20
      54455354452034383933343400000000000070E02E4114534F465454454B2054
      45535445203438393334360000000000007CE02E4114534F465454454B205445
      5354452034383933343900000000000092E02E4114534F465454454B20544553
      5445203438393335330000000000009AE02E4114534F465454454B2054455354
      45203438393335380000000000003EE12E4114534F465454454B205445535445
      20343839343037000000000000AAE52E4114534F465454454B20544553544520
      34383937303900000000000008F82E4114534F465454454B2054455354452034
      393130373900000000000096FD2E4114534F465454454B205445535445203439
      3134363100000000000044152F4114534F465454454B20544553544520343934
      343030000000000000981C2F4114534F465454454B2054455354452034393439
      3335000000000000CA1D2F4114534F465454454B205445535445203439353032
      30000000000000E61D2F4114534F465454454B20544553544520343935303330
      000000000000EC1D2F4114534F465454454B2054455354452034393530333300
      0000000000B81F2F4114534F465454454B205445535445203439353135380000
      0000000028212F4114534F465454454B20544553544520343935323539000000
      000000E0212F4114534F465454454B2054455354452034393533323200000000
      000094262F4114534F465454454B205445535445203439353833360000000000
      0042272F4114534F465454454B20544553544520343935383930000000000000
      BE272F4114534F465454454B2054455354452034393539333300000000000044
      2E2F4114534F465454454B205445535445203439363631380000000000004A2E
      2F4114534F465454454B20544553544520343936363230000000000000522E2F
      4114534F465454454B20544553544520343936363233000000000000542E2F41
      14534F465454454B205445535445203439363632340000000000007C2E2F4114
      534F465454454B20544553544520343936363337000000000000082F2F411453
      4F465454454B2054455354452034393636373500000000000052342F4114534F
      465454454B20544553544520343937313039000000000000E83C2F4114534F46
      5454454B20544553544520343937393038000000000000523D2F4114534F4654
      54454B20544553544520343937393337000000000000EE3D2F4114534F465454
      454B205445535445203439373938360000000000007E432F4114534F46545445
      4B205445535445203439383732320000000000009E432F4114534F465454454B
      20544553544520343938373331000000000000A4432F4114534F465454454B20
      544553544520343938373334000000000000A6432F4114534F465454454B2054
      4553544520343938373335000000000000B4432F4114534F465454454B205445
      53544520343938373431000000000000B8432F4114534F465454454B20544553
      544520343938373433000000000000BE432F4114534F465454454B2054455354
      4520343938373436000000000000C0432F4114534F465454454B205445535445
      20343938373437000000000000C6432F4114534F465454454B20544553544520
      343938373439000000000000CC432F4114534F465454454B2054455354452034
      3938373532000000000000CE432F4114534F465454454B205445535445203439
      38373533000000000000D2432F4114534F465454454B20544553544520343938
      373535000000000000D4432F4114534F465454454B2054455354452034393837
      3536000000000000D6432F4114534F465454454B205445535445203439383735
      37000000000000DE432F4114534F465454454B20544553544520343938373631
      000000000000E0432F4114534F465454454B2054455354452034393837363200
      0000000000E2432F4114534F465454454B205445535445203439383736330000
      00000000E8432F4114534F465454454B20544553544520343938373636000000
      000000EA432F4114534F465454454B2054455354452034393837363700000000
      0000EC432F4114534F465454454B205445535445203439383736380000000000
      00F4432F4114534F465454454B20544553544520343938373732000000000000
      14442F4114534F465454454B205445535445203439383738330000000000001C
      442F4114534F465454454B205445535445203439383738360000000000002644
      2F4114534F465454454B205445535445203439383739310000000000002E442F
      4114534F465454454B2054455354452034393837393500000000000036442F41
      14534F465454454B2054455354452034393837393900000000000040442F4114
      534F465454454B2054455354452034393838303400000000000046442F411453
      4F465454454B205445535445203439383830370000000000004A442F4114534F
      465454454B2054455354452034393838303900000000000052442F4114534F46
      5454454B205445535445203439383831330000000000005C442F4114534F4654
      54454B2054455354452034393838313800000000000060442F4114534F465454
      454B2054455354452034393838323000000000000062442F4114534F46545445
      4B205445535445203439383832310000000000006A442F4114534F465454454B
      205445535445203439383832350000000000006E442F4114534F465454454B20
      54455354452034393838323700000000000070442F4114534F465454454B2054
      455354452034393838323800000000000076442F4114534F465454454B205445
      5354452034393838333100000000000078442F4114534F465454454B20544553
      544520343938383332000000000000BA442F4114534F465454454B2054455354
      4520343938383630000000000000BE442F4114534F465454454B205445535445
      20343938383631000000000000C2442F4114534F465454454B20544553544520
      343938383632000000000000CE442F4114534F465454454B2054455354452034
      3938383637000000000000D0442F4114534F465454454B205445535445203439
      38383639000000000000D6442F4114534F465454454B20544553544520343938
      3837320000000000000A482F4114534F465454454B2054455354452034393931
      3433000000000000404C2F4114534F465454454B205445535445203439393531
      38000000000000684D2F4114534F465454454B20544553544520343939363133
      000000000000D64F2F4114534F465454454B2054455354452034393938313000
      00000000000A502F4114534F465454454B205445535445203439393832390000
      000000004C502F4114534F465454454B20544553544520343939383737000000
      0000008A522F4114534F465454454B2054455354452035303031373500000000
      0000AA522F4114534F465454454B205445535445203530303139300000000000
      00A6532F4114534F465454454B20544553544520353030323734000000000000
      045C2F4114534F465454454B2054455354452035303039343600000000000018
      5C2F4114534F465454454B205445535445203530303935330000000000001E5C
      2F4114534F465454454B20544553544520353030393535000000000000265C2F
      4114534F465454454B20544553544520353030393539000000000000765C2F41
      14534F465454454B2054455354452035303039383500000000000004642F4114
      534F465454454B2054455354452035303138333500000000000040642F411453
      4F465454454B2054455354452035303138353400000000000046642F4114534F
      465454454B2054455354452035303138353700000000000094642F4114534F46
      5454454B20544553544520353031383830000000000000D06B2F4114534F4654
      54454B205445535445203530323433390000000000000A6D2F4114534F465454
      454B20544553544520353032353430000000000000E26F2F4114534F46545445
      4B20544553544520353032373738000000000000EE712F4114534F465454454B
      20544553544520353032393333000000000000E8752F4114534F465454454B20
      544553544520353033343038000000000000FA782F4114534F465454454B2054
      4553544520353033363438000000000000FE782F4114534F465454454B205445
      53544520353033363530000000000000C4792F4114534F465454454B20544553
      544520353033373037000000000000D87F2F4114534F465454454B2054455354
      45203530343232300000000000000C842F4114534F465454454B205445535445
      203530343734320000000000009A872F4114534F465454454B20544553544520
      353035303233000000000000A8872F4114534F465454454B2054455354452035
      3035303330000000000000F6872F4114534F465454454B205445535445203530
      35303537000000000000AC902F4114534F465454454B20544553544520353035
      373137000000000000DA922F4114534F465454454B2054455354452035303538
      383700000000000008932F4114534F465454454B205445535445203530353930
      30000000000000869B2F4114534F465454454B20544553544520353036353535
      0000000000004EA92F4114534F465454454B2054455354452035303830303300
      000000000050A92F4114534F465454454B205445535445203530383030340000
      000000005CA92F4114534F465454454B20544553544520353038303039000000
      00000070A92F4114534F465454454B2054455354452035303830313600000000
      000000B22F4114534F465454454B205445535445203530383636380000000000
      0032B32F4114534F465454454B20544553544520353038373538000000000000
      80B52F4114534F465454454B20544553544520353038393336000000000000A6
      B52F4114534F465454454B2054455354452035303839383800000000000004B7
      2F4114534F465454454B2054455354452035303931303800000000000000C092
      4010534F465454454B205445535445203531000000000000E0AC264111534F46
      5454454B205445535445203531300000000000008EC62F4114534F465454454B
      2054455354452035313130393400000000000090C62F4114534F465454454B20
      5445535445203531313039350000000000007CCA2F4114534F465454454B2054
      4553544520353131333838000000000000B8CA2F4114534F465454454B205445
      53544520353131343039000000000000A8CC2F4114534F465454454B20544553
      5445203531313536340000000000009CCE2F4114534F465454454B2054455354
      4520353131373138000000000000C0CE2F4114534F465454454B205445535445
      20353131373239000000000000A4D12F4114534F465454454B20544553544520
      35313139393100000000000078D52F4114534F465454454B2054455354452035
      31323239310000000000001CE32F4114534F465454454B205445535445203531
      33363637000000000000C0E82F4114534F465454454B20544553544520353134
      313034000000000000E0E92F4114534F465454454B2054455354452035313431
      393500000000000082EA2F4114534F465454454B205445535445203531343233
      3800000000000076EB2F4114534F465454454B20544553544520353134333230
      0000000000005601304114534F465454454B2054455354452035313636303700
      00000000004C04304114534F465454454B205445535445203531373035330000
      000000004D04304114534F465454454B20544553544520353137303534000000
      0000002A07304114534F465454454B2054455354452035313734333300000000
      00005008304114534F465454454B205445535445203531373630380000000000
      00F40B304114534F465454454B20544553544520353138313139000000000000
      350C304114534F465454454B20544553544520353138313638000000000000D3
      0E304114534F465454454B20544553544520353138353831000000000000540F
      304114534F465454454B20544553544520353138363532000000000000131230
      4114534F465454454B20544553544520353139303434000000000000BE123041
      14534F465454454B205445535445203531393133370000000000001913304114
      534F465454454B20544553544520353139313836000000000000221330411453
      4F465454454B205445535445203531393139350000000000002613304114534F
      465454454B20544553544520353139313938000000000000BD14304114534F46
      5454454B20544553544520353139343730000000000000BE14304114534F4654
      54454B20544553544520353139343731000000000000BF14304114534F465454
      454B20544553544520353139343732000000000000C014304114534F46545445
      4B20544553544520353139343733000000000000C114304114534F465454454B
      205445535445203531393437340000000000000016304114534F465454454B20
      5445535445203531393733350000000000004016304114534F465454454B2054
      45535445203531393737370000000000008B16304114534F465454454B205445
      535445203531393832340000000000008F16304114534F465454454B20544553
      5445203531393832380000000000009617304114534F465454454B2054455354
      4520353139393630000000000000AF19304114534F465454454B205445535445
      20353230333130000000000000BC19304114534F465454454B20544553544520
      353230333138000000000000D619304114534F465454454B2054455354452035
      3230333332000000000000601C304114534F465454454B205445535445203532
      30383435000000000000631C304114534F465454454B20544553544520353230
      383438000000000000661C304114534F465454454B2054455354452035323038
      3530000000000000681C304114534F465454454B205445535445203532303835
      32000000000000691C304114534F465454454B20544553544520353230383533
      0000000000006C1C304114534F465454454B2054455354452035323038353500
      00000000006F1C304114534F465454454B205445535445203532303835380000
      00000000701C304114534F465454454B20544553544520353230383539000000
      000000711C304114534F465454454B2054455354452035323038363000000000
      0000721C304114534F465454454B205445535445203532303836310000000000
      00741C304114534F465454454B20544553544520353230383633000000000000
      F21C304114534F465454454B20544553544520353230393334000000000000F4
      1C304114534F465454454B20544553544520353230393336000000000000F51C
      304114534F465454454B20544553544520353230393337000000000000F61C30
      4114534F465454454B20544553544520353230393338000000000000F71C3041
      14534F465454454B20544553544520353230393339000000000000F91C304114
      534F465454454B20544553544520353230393431000000000000FA1C30411453
      4F465454454B20544553544520353230393432000000000000FB1C304114534F
      465454454B20544553544520353230393433000000000000FD1C304114534F46
      5454454B20544553544520353230393435000000000000AD1D304114534F4654
      54454B205445535445203532313034330000000000000C20304114534F465454
      454B205445535445203532313338310000000000003521304114534F46545445
      4B205445535445203532313533380000000000006321304114534F465454454B
      205445535445203532313537390000000000002B22304114534F465454454B20
      5445535445203532313830370000000000005322304114534F465454454B2054
      45535445203532313833360000000000007C23304114534F465454454B205445
      53544520353231393936000000000000E523304114534F465454454B20544553
      544520353232303536000000000000E723304114534F465454454B2054455354
      4520353232303537000000000000E823304114534F465454454B205445535445
      203532323035380000000000000A24304114534F465454454B20544553544520
      353232303737000000000000E327304114534F465454454B2054455354452035
      3232363033000000000000F329304114534F465454454B205445535445203532
      32393430000000000000EF2A304114534F465454454B20544553544520353233
      303836000000000000BB2B304114534F465454454B2054455354452035323331
      3939000000000000E056EC4013534F465454454B205445535445203533353730
      0000000000004779304114534F465454454B2054455354452035343239373800
      0000000000417E304114534F465454454B205445535445203534333636390000
      000000005980304114534F465454454B20544553544520353433393631000000
      0000005B81304114534F465454454B2054455354452035343430393500000000
      0000B285304114534F465454454B205445535445203534343732390000000000
      00DB85304114534F465454454B20544553544520353434373939000000000000
      A087304114534F465454454B2054455354452035343530373400000000000053
      8E304114534F465454454B205445535445203534363334350000000000001890
      304114534F465454454B20544553544520353436363039000000000000C99530
      4114534F465454454B20544553544520353437343533000000000000CC953041
      14534F465454454B20544553544520353437343535000000000000849A304114
      534F465454454B20544553544520353438363233000000000000A99A30411453
      4F465454454B20544553544520353438363531000000000000279B304114534F
      465454454B205445535445203534383731390000000000002E9B304114534F46
      5454454B205445535445203534383732340000000000006B9B304114534F4654
      54454B205445535445203534383736330000000000006E9B304114534F465454
      454B205445535445203534383736360000000000007D9B304114534F46545445
      4B205445535445203534383737370000000000007E9B304114534F465454454B
      20544553544520353438373738000000000000C59B304114534F465454454B20
      544553544520353438383233000000000000139C304114534F465454454B2054
      4553544520353438393033000000000000409C304114534F465454454B205445
      53544520353438393236000000000000FC9F304114534F465454454B20544553
      544520353439383136000000000000FF9F304114534F465454454B2054455354
      452035343938313800000000000002A0304114534F465454454B205445535445
      2035343938323100000000000010A0304114534F465454454B20544553544520
      3534393833330000000000003EA0304114534F465454454B2054455354452035
      34393836350000000000003FA0304114534F465454454B205445535445203534
      3938363600000000000040A0304114534F465454454B20544553544520353439
      38363700000000000040AAEE4013534F465454454B2054455354452035393039
      33000000000000B6A9264111534F465454454B20544553544520363331000000
      00000050A6F14013534F465454454B2054455354452036393835320000000000
      0000C1F14013534F465454454B20544553544520373033343600000000000046
      A6264111534F465454454B20544553544520373133000000000000C0AFF24013
      534F465454454B205445535445203734373431000000000000002C9E4010534F
      465454454B20544553544520373900000000000008A4264111534F465454454B
      205445535445203834390000000000009000F74013534F465454454B20544553
      5445203932353731000000000000200CF74013534F465454454B205445535445
      203932363630000000000000D00CF74013534F465454454B2054455354452039
      3236363200000000000049A030410554455354450000000000004AA030410754
      455354452033}
  end
  object CMSqlParams1: TCMSqlParams
    SQL.Strings = (
      'SELECT'
      '  PES.IDPESSOA,'
      '  PES.NOME'
      ''
      'FROM '
      '  PESSOA      PES,'
      '  FUNCIONARIO FUN,'
      '  SITFUNC     STF'
      ''
      'WHERE FUN.IDSITFUNC = STF.IDSITFUNC'
      '  AND STF.TIPOSIT   = '#39'A'#39
      '  AND FUN.IDPESSOA  = PES.IDPESSOA'
      ''
      'ORDER BY'
      '  PES.NOME')
    ClientDataSet = cdsListaResp
    Left = 233
    Top = 330
  end
end
