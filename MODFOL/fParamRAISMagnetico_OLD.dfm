inherited frmParamRAISMagnetico: TfrmParamRAISMagnetico
  Left = 88
  Top = 70
  HelpContext = 210089
  BorderIcons = [biSystemMenu, biMinimize]
  BorderStyle = bsToolWindow
  Caption = 'RAIS (Meio Magnético)'
  ClientHeight = 460
  ClientWidth = 617
  Font.Style = []
  FormStyle = fsNormal
  Visible = False
  PixelsPerInch = 96
  TextHeight = 13
  inherited pnlFundo: TPanel
    Width = 617
    Height = 421
    BorderWidth = 2
    object pnlResult: TPanel
      Left = 4
      Top = 4
      Width = 609
      Height = 413
      Align = alClient
      BevelOuter = bvNone
      BorderWidth = 3
      Caption = 'pnlResult'
      TabOrder = 0
      object memResult: TMemo
        Left = 3
        Top = 3
        Width = 603
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
      Left = 4
      Top = 4
      Width = 609
      Height = 413
      Align = alClient
      BevelOuter = bvNone
      BorderWidth = 3
      TabOrder = 1
      object pnlHorario: TPanel
        Left = 3
        Top = 3
        Width = 603
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
        Width = 603
        Height = 386
        ActivePage = tbshValDiversos
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
              IntDigits = 3
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
              Caption = 'Efet. Especiais'
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
              Caption = 'Temporários'
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
              Caption = 'Terceiros'
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
            Width = 448
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
            Left = 460
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
            Top = 304
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
              ActivePage = tbshHoristas
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
              object tbshHoristas: TTabSheet
                Caption = 'Quant. Horas Mensais p/ Horistas'
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
            Left = 6
            Top = 231
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
    Top = 421
    Width = 617
    inherited tb97Fundo: TToolbar97
      Left = 189
      DockPos = 309
      inherited sep1: TToolbarSep97
        Left = 342
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
        Left = 344
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
    Left = 25
    Top = 445
    Width = 557
    Height = 105
    BevelInner = bvRaised
    BevelOuter = bvNone
    BevelWidth = 2
    TabOrder = 2
    Visible = False
    object fclblTitulo: TfcLabel
      Left = 16
      Top = 3
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
      Left = 16
      Top = 35
      Width = 524
      Height = 19
      Alignment = taCenter
      AutoSize = False
      Caption = 'lblProcesso'
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
    InitialDir = 'C:\CAGED'
    Options = [ofHideReadOnly, ofPathMustExist, ofNoNetworkButton]
    Title = 'Escolha a Pasta para a Geração do CAGED Magnético'
    Left = 367
    Top = 416
  end
  object CdsNomeResp: TCMClientDataSet
    Aggregates = <>
    Params = <>
    Left = 188
    Top = 416
  end
  object CdsTipoFolha: TCMClientDataSet
    Aggregates = <>
    Params = <>
    Left = 260
    Top = 416
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
end
