inherited frmLancaHoraPonto: TfrmLancaHoraPonto
  Left = 129
  Top = 163
  BorderIcons = [biSystemMenu, biMinimize]
  BorderStyle = bsToolWindow
  Caption = 'Lançamento Coletivo do Ponto'
  ClientHeight = 475
  ClientWidth = 526
  PixelsPerInch = 96
  TextHeight = 13
  inherited pnlFundo: TPanel
    Width = 526
    Height = 436
    BorderWidth = 2
    object pgctrlPrincipal: TPageControl
      Left = 4
      Top = 4
      Width = 518
      Height = 402
      ActivePage = tbshParametros
      TabOrder = 0
      object tbshParametros: TTabSheet
        Caption = 'Parâmetros para os Lançamentos'
        object grpMesRef: TGroupBox
          Left = 271
          Top = 5
          Width = 224
          Height = 45
          Caption = ' Mês e Ano de Referência da Folha'
          TabOrder = 1
          object cmbMes: TComboBox
            Left = 11
            Top = 15
            Width = 122
            Height = 21
            Style = csDropDownList
            ItemHeight = 13
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
          object spnedAno: TSpinEdit
            Left = 142
            Top = 15
            Width = 71
            Height = 22
            MaxValue = 0
            MinValue = 0
            TabOrder = 1
            Value = 0
          end
        end
        object gbxIntervRef: TGroupBox
          Left = 15
          Top = 5
          Width = 249
          Height = 45
          Caption = 'Período de Apuração do Ponto'
          TabOrder = 0
          object Label6: TLabel
            Left = 123
            Top = 19
            Width = 19
            Height = 13
            Caption = 'até'
          end
          object Label7: TLabel
            Left = 7
            Top = 19
            Width = 17
            Height = 13
            Caption = 'De'
          end
          object dtedIni: TCMDateTimePicker
            Left = 27
            Top = 15
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
          object dtedFin: TCMDateTimePicker
            Left = 146
            Top = 15
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
            TabOrder = 1
          end
        end
        object gbxRubricas: TGroupBox
          Left = 15
          Top = 101
          Width = 480
          Height = 271
          Caption = 'Rubricas que Receberão os Valores Apurados'
          TabOrder = 3
          object Label5: TLabel
            Left = 28
            Top = 22
            Width = 110
            Height = 13
            Alignment = taRightJustify
            AutoSize = False
            Caption = 'Atrasos'
          end
          object Label1: TLabel
            Left = 28
            Top = 56
            Width = 110
            Height = 13
            Alignment = taRightJustify
            AutoSize = False
            Caption = 'Extras Diurnas'
          end
          object Label2: TLabel
            Left = 28
            Top = 89
            Width = 110
            Height = 13
            Alignment = taRightJustify
            AutoSize = False
            Caption = 'Extras Noturnas'
          end
          object Label3: TLabel
            Left = 28
            Top = 121
            Width = 110
            Height = 13
            Alignment = taRightJustify
            AutoSize = False
            Caption = 'Extraordinárias'
          end
          object Label9: TLabel
            Left = 28
            Top = 184
            Width = 110
            Height = 13
            Alignment = taRightJustify
            AutoSize = False
            Caption = 'Adicional Noturno'
          end
          object Label11: TLabel
            Left = 28
            Top = 217
            Width = 110
            Height = 13
            Alignment = taRightJustify
            AutoSize = False
            Caption = 'Faltas'
          end
          object Label4: TLabel
            Left = 28
            Top = 248
            Width = 110
            Height = 13
            Alignment = taRightJustify
            AutoSize = False
            Caption = 'Faltas Abonadas'
          end
          object Label10: TLabel
            Left = 28
            Top = 151
            Width = 110
            Height = 13
            Caption = 'Extras Transferidas'
          end
          object dblckRub2: TwwDBLookupCombo
            Left = 142
            Top = 52
            Width = 300
            Height = 21
            DropDownAlignment = taLeftJustify
            Selected.Strings = (
              'DESCRPROVDESC'#9'130'#9'DESCRPROVDESC'#9'F')
            LookupTable = CdsRub2
            LookupField = 'IDPROVENTO'
            Style = csDropDownList
            TabOrder = 0
            AutoDropDown = False
            ShowButton = True
            UseTFields = False
            AllowClearKey = True
          end
          object dblckRub3: TwwDBLookupCombo
            Left = 142
            Top = 85
            Width = 300
            Height = 21
            DropDownAlignment = taLeftJustify
            Selected.Strings = (
              'DESCRPROVDESC'#9'130'#9'DESCRPROVDESC'#9'F')
            LookupTable = CdsRub3
            LookupField = 'IDPROVENTO'
            Style = csDropDownList
            TabOrder = 1
            AutoDropDown = False
            ShowButton = True
            UseTFields = False
            AllowClearKey = True
          end
          object dblckRub4: TwwDBLookupCombo
            Left = 142
            Top = 118
            Width = 300
            Height = 21
            DropDownAlignment = taLeftJustify
            Selected.Strings = (
              'DESCRPROVDESC'#9'130'#9'DESCRPROVDESC'#9'F')
            LookupTable = CdsRub4
            LookupField = 'IDPROVENTO'
            Style = csDropDownList
            TabOrder = 2
            AutoDropDown = False
            ShowButton = True
            UseTFields = False
            AllowClearKey = True
          end
          object dblckRub5: TwwDBLookupCombo
            Left = 142
            Top = 181
            Width = 300
            Height = 21
            DropDownAlignment = taLeftJustify
            Selected.Strings = (
              'DESCRPROVDESC'#9'130'#9'DESCRPROVDESC'#9'F')
            LookupTable = CdsRub5
            LookupField = 'IDPROVENTO'
            Style = csDropDownList
            TabOrder = 3
            AutoDropDown = False
            ShowButton = True
            UseTFields = False
            AllowClearKey = True
          end
          object dblckRub6: TwwDBLookupCombo
            Left = 142
            Top = 214
            Width = 300
            Height = 21
            DropDownAlignment = taLeftJustify
            Selected.Strings = (
              'DESCRPROVDESC'#9'130'#9'DESCRPROVDESC'#9'F')
            LookupTable = CdsRub6
            LookupField = 'IDPROVENTO'
            Style = csDropDownList
            TabOrder = 4
            AutoDropDown = False
            ShowButton = True
            UseTFields = False
            AllowClearKey = True
          end
          object dblckRub7: TwwDBLookupCombo
            Left = 142
            Top = 245
            Width = 300
            Height = 21
            DropDownAlignment = taLeftJustify
            Selected.Strings = (
              'DESCRPROVDESC'#9'130'#9'DESCRPROVDESC'#9'F')
            LookupTable = CdsRub7
            LookupField = 'IDPROVENTO'
            Style = csDropDownList
            TabOrder = 5
            AutoDropDown = False
            ShowButton = True
            UseTFields = False
            AllowClearKey = True
          end
          object dblckRub1: TwwDBLookupCombo
            Left = 142
            Top = 17
            Width = 300
            Height = 21
            DropDownAlignment = taLeftJustify
            Selected.Strings = (
              'DESCRPROVDESC'#9'130'#9'DESCRPROVDESC'#9'F')
            LookupTable = CdsRub1
            LookupField = 'IDPROVENTO'
            Style = csDropDownList
            TabOrder = 6
            AutoDropDown = False
            ShowButton = True
            UseTFields = False
            AllowClearKey = True
          end
          object dblckRub8: TwwDBLookupCombo
            Left = 142
            Top = 148
            Width = 300
            Height = 21
            DropDownAlignment = taLeftJustify
            Selected.Strings = (
              'DESCRPROVDESC'#9'130'#9'DESCRPROVDESC'#9'F')
            LookupTable = CdsRub8
            LookupField = 'IDPROVENTO'
            Style = csDropDownList
            TabOrder = 7
            AutoDropDown = False
            ShowButton = True
            UseTFields = False
            AllowClearKey = True
          end
        end
        object gbxTolerancia: TGroupBox
          Left = 15
          Top = 51
          Width = 249
          Height = 46
          Caption = 'Tolerâncias (em minutos)'
          TabOrder = 2
          object Label8: TLabel
            Left = 12
            Top = 20
            Width = 45
            Height = 13
            Caption = 'Entrada'
          end
          object Label15: TLabel
            Left = 144
            Top = 20
            Width = 35
            Height = 13
            Caption = 'Saída'
          end
          object ednTolEntra: TSpinEdit
            Left = 62
            Top = 17
            Width = 46
            Height = 22
            MaxValue = 999
            MinValue = 0
            TabOrder = 0
            Value = 0
          end
          object ednTolSaida: TSpinEdit
            Left = 185
            Top = 17
            Width = 46
            Height = 22
            MaxValue = 0
            MinValue = 0
            TabOrder = 1
            Value = 0
          end
        end
      end
      object tbshEmpregados: TTabSheet
        Caption = 'Seleção de Empregados'
        ImageIndex = 1
        object gbxEstab: TGroupBox
          Left = 12
          Top = 21
          Width = 485
          Height = 46
          Caption = 'Estabelecimento'
          TabOrder = 0
          object dblkcbEstab: TwwDBLookupCombo
            Left = 11
            Top = 16
            Width = 463
            Height = 21
            DropDownAlignment = taLeftJustify
            Selected.Strings = (
              'NOME'#9'60'#9'Estabelecimento')
            LookupTable = CdsEstab
            LookupField = 'IDPESSOA'
            Style = csDropDownList
            TabOrder = 0
            AutoDropDown = True
            ShowButton = True
            AllowClearKey = True
            OnChange = dblkcbEstabChange
          end
        end
        object gbxFunc: TGroupBox
          Left = 12
          Top = 74
          Width = 485
          Height = 297
          Caption = 'Empregados'
          TabOrder = 1
          object pgctrlEmpregados: TPageControl
            Left = 7
            Top = 15
            Width = 471
            Height = 276
            ActivePage = tbshListaFunc
            HotTrack = True
            TabOrder = 0
            OnChange = pgctrlEmpregadosChange
            object tbshListaFunc: TTabSheet
              Caption = '&Lista'
              object chklstFunc: TColorCheckListBox
                Left = 1
                Top = 2
                Width = 323
                Height = 242
                OnClickCheck = chklstFuncClickCheck
                ItemHeight = 13
                Style = lbOwnerDrawFixed
                TabOrder = 0
              end
            end
            object tbshFiltroFunc: TTabSheet
              Caption = '&Tipos de Contrato / Situações'
              object gbxTipContra: TGroupBox
                Left = 29
                Top = 62
                Width = 260
                Height = 90
                Caption = 'Tipo de Contrato'
                ParentShowHint = False
                ShowHint = False
                TabOrder = 0
                OnEnter = gbxTipContraEnter
                OnExit = gbxTipContraExit
                object cbxEfetivos: TCheckBox
                  Left = 9
                  Top = 17
                  Width = 72
                  Height = 13
                  Caption = 'Efetivos'
                  Checked = True
                  ParentShowHint = False
                  ShowHint = False
                  State = cbChecked
                  TabOrder = 0
                end
                object cbxEspeciais: TCheckBox
                  Left = 9
                  Top = 35
                  Width = 109
                  Height = 13
                  Caption = 'Efet. Especiais'
                  Checked = True
                  ParentShowHint = False
                  ShowHint = False
                  State = cbChecked
                  TabOrder = 1
                end
                object cbxTemporarios: TCheckBox
                  Left = 9
                  Top = 52
                  Width = 96
                  Height = 13
                  Caption = 'Temporários'
                  ParentShowHint = False
                  ShowHint = False
                  TabOrder = 2
                end
                object cbxEstagiarios: TCheckBox
                  Left = 9
                  Top = 69
                  Width = 88
                  Height = 13
                  Caption = 'Estagiários'
                  ParentShowHint = False
                  ShowHint = False
                  TabOrder = 3
                end
                object cbxTerceiros: TCheckBox
                  Left = 121
                  Top = 17
                  Width = 78
                  Height = 13
                  Caption = 'Terceiros'
                  ParentShowHint = False
                  ShowHint = False
                  TabOrder = 4
                end
                object cbxPropDirSemVinc: TCheckBox
                  Left = 121
                  Top = 35
                  Width = 120
                  Height = 13
                  Caption = 'Prop/Dir s/ Vinc'
                  ParentShowHint = False
                  ShowHint = False
                  TabOrder = 5
                end
                object cbxAutonomos: TCheckBox
                  Left = 121
                  Top = 52
                  Width = 88
                  Height = 13
                  Caption = 'Autônomos'
                  ParentShowHint = False
                  ShowHint = False
                  TabOrder = 6
                end
              end
              object gbxSituacao: TGroupBox
                Left = 300
                Top = 62
                Width = 133
                Height = 90
                Caption = 'Situação Funcional'
                ParentShowHint = False
                ShowHint = False
                TabOrder = 1
                OnEnter = gbxSituacaoEnter
                OnExit = gbxSituacaoExit
                object cbxAtivos: TCheckBox
                  Left = 9
                  Top = 17
                  Width = 64
                  Height = 13
                  Caption = 'Ativos'
                  Checked = True
                  ParentShowHint = False
                  ShowHint = False
                  State = cbChecked
                  TabOrder = 0
                end
                object cbxAfastados: TCheckBox
                  Left = 9
                  Top = 41
                  Width = 69
                  Height = 13
                  Caption = 'Afastados'
                  Checked = True
                  ParentShowHint = False
                  ShowHint = False
                  State = cbChecked
                  TabOrder = 1
                end
                object cbxDemitidos: TCheckBox
                  Tag = 2
                  Left = 9
                  Top = 65
                  Width = 80
                  Height = 13
                  Caption = 'Demitidos'
                  Checked = True
                  ParentShowHint = False
                  ShowHint = False
                  State = cbChecked
                  TabOrder = 2
                end
              end
            end
            object tbshCCusto: TTabSheet
              Caption = '&Centros de Custo'
              ImageIndex = 2
              object chklstCCusto: TColorCheckListBox
                Left = 1
                Top = 2
                Width = 323
                Height = 241
                OnClickCheck = chklstCCustoClickCheck
                ItemHeight = 13
                Style = lbOwnerDrawFixed
                TabOrder = 0
              end
            end
          end
          object bbtnSelTodos: TBitBtn
            Left = 340
            Top = 42
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
            Left = 340
            Top = 69
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
      end
      object tbsBancoHoras: TTabSheet
        Caption = 'Banco de Horas'
        ImageIndex = 2
        object gbxBancoHoras: TGroupBox
          Left = 198
          Top = 33
          Width = 114
          Height = 138
          Caption = 'Abater'
          TabOrder = 0
          object cbxFaltas: TCheckBox
            Left = 7
            Top = 46
            Width = 80
            Height = 17
            Caption = 'Faltas'
            Checked = True
            State = cbChecked
            TabOrder = 0
          end
          object cbxAtrasos: TCheckBox
            Left = 7
            Top = 96
            Width = 80
            Height = 17
            Caption = 'Atrasos'
            Checked = True
            State = cbChecked
            TabOrder = 1
          end
        end
        object rgTransferir: TRadioGroup
          Left = 123
          Top = 229
          Width = 264
          Height = 76
          Caption = 'Transferir, se Data Limite Atingida'
          ItemIndex = 1
          Items.Strings = (
            'Saldo Anterior Apenas'
            'Saldo Anterior + Movimento do Período')
          ParentShowHint = False
          ShowHint = True
          TabOrder = 1
        end
      end
    end
    object pgbrProgresso: TProgressBar
      Left = 12
      Top = 413
      Width = 503
      Height = 16
      Min = 0
      Max = 6
      Step = 1
      TabOrder = 1
    end
  end
  inherited Dock971: TDock97
    Top = 436
    Width = 526
    inherited tb97Fundo: TToolbar97
      Left = 212
      inherited sep1: TToolbarSep97
        Left = 227
      end
      object ToolbarSep971: TToolbarSep97 [1]
        Left = 106
        Top = 0
        Blank = True
        SizeHorz = 40
      end
      inherited bbtnSair: TBitBtn
        Left = 146
        Cancel = True
      end
      inherited bbtnAjuda: TmaHelpBitBtn
        Left = 229
      end
      object bbtnExecutar: TBitBtn
        Left = 0
        Top = 0
        Width = 106
        Height = 33
        Caption = '&Executar'
        Default = True
        TabOrder = 2
        OnClick = bbtnExecutarClick
        Glyph.Data = {
          36010000424D3601000000000000760000002800000011000000100000000100
          040000000000C000000000000000000000001000000000000000000000000000
          8000008000000080800080000000800080008080000080808000C0C0C0000000
          FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00555555555555
          55555000000055555550005555555000000055800850B058005550000000553B
          03033000330550000000553B0333F0B3330550000000700BB0338303F8005000
          000003303FFBBFBB3033000000000333FB000008B033000000003F3FB77F7703
          FBFB000000003333F77F8707B800500000005503FF7F770FB30550000000553F
          BB7F8703FB05500000005553377877073755500000005555557FF80555555000
          0000555555577755555550000000555555555555555550000000}
      end
    end
    object bbtnRubrica: TBitBtn
      Left = 4
      Top = 2
      Width = 106
      Height = 33
      Caption = '&Criar Rubrica'
      Default = True
      TabOrder = 1
      OnClick = bbtnRubricaClick
      Glyph.Data = {
        76010000424D7601000000000000760000002800000020000000100000000100
        04000000000000010000120B0000120B00001000000000000000000000000000
        800000800000008080008000000080008000808000007F7F7F00BFBFBF000000
        FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00555550FF0559
        1950555FF75F7557F7F757000FF055591903557775F75557F77570FFFF055559
        1933575FF57F5557F7FF0F00FF05555919337F775F7F5557F7F700550F055559
        193577557F7F55F7577F07550F0555999995755575755F7FFF7F5570F0755011
        11155557F755F777777555000755033305555577755F75F77F55555555503335
        0555555FF5F75F757F5555005503335505555577FF75F7557F55505050333555
        05555757F75F75557F5505000333555505557F777FF755557F55000000355557
        07557777777F55557F5555000005555707555577777FF5557F55553000075557
        0755557F7777FFF5755555335000005555555577577777555555}
      NumGlyphs = 2
    end
  end
  inherited ivTradutor: TIvExtendedTranslator
    Left = 330
    Top = 391
  end
  object CdsRub1: TCMClientDataSet
    Aggregates = <>
    FieldDefs = <
      item
        Name = 'IDPROVENTO'
        DataType = ftFloat
      end
      item
        Name = 'CODPROVDESC'
        DataType = ftString
        Size = 15
      end
      item
        Name = 'DESCRPROVDESC'
        DataType = ftString
        Size = 130
      end
      item
        Name = 'CODRUBCLT'
        Attributes = [faFixed]
        DataType = ftString
        Size = 5
      end
      item
        Name = 'IDREGRA'
        DataType = ftFloat
      end>
    IndexDefs = <>
    Params = <>
    ProviderName = 'ds'
    ReadOnly = True
    StoreDefs = True
    Left = 172
    Top = 131
  end
  object CdsRub2: TCMClientDataSet
    Aggregates = <>
    FieldDefs = <
      item
        Name = 'NOME'
        DataType = ftString
        Size = 60
      end
      item
        Name = 'IDPESSOA'
        DataType = ftFloat
      end
      item
        Name = 'MATRICULA'
        DataType = ftString
        Size = 13
      end
      item
        Name = 'IDEMPRESA'
        DataType = ftFloat
      end
      item
        Name = 'IDESTAB'
        DataType = ftFloat
      end
      item
        Name = 'IDHORARIO'
        DataType = ftFloat
      end
      item
        Name = 'TIPOSIT'
        Attributes = [faFixed]
        DataType = ftString
        Size = 1
      end
      item
        Name = 'DATAREFHORARIO'
        DataType = ftDateTime
      end
      item
        Name = 'SITUACAO'
        DataType = ftString
        Size = 10
      end>
    IndexDefs = <>
    Params = <>
    ReadOnly = True
    StoreDefs = True
    Left = 213
    Top = 164
  end
  object CdsRub4: TCMClientDataSet
    Aggregates = <>
    FieldDefs = <
      item
        Name = 'NOME'
        DataType = ftString
        Size = 60
      end
      item
        Name = 'IDPESSOA'
        DataType = ftFloat
      end
      item
        Name = 'MATRICULA'
        DataType = ftString
        Size = 13
      end
      item
        Name = 'IDEMPRESA'
        DataType = ftFloat
      end
      item
        Name = 'IDESTAB'
        DataType = ftFloat
      end
      item
        Name = 'IDHORARIO'
        DataType = ftFloat
      end
      item
        Name = 'TIPOSIT'
        Attributes = [faFixed]
        DataType = ftString
        Size = 1
      end
      item
        Name = 'DATAREFHORARIO'
        DataType = ftDateTime
      end
      item
        Name = 'SITUACAO'
        DataType = ftString
        Size = 10
      end>
    IndexDefs = <>
    Params = <>
    ReadOnly = True
    StoreDefs = True
    Left = 294
    Top = 230
  end
  object CdsRub5: TCMClientDataSet
    Aggregates = <>
    FieldDefs = <
      item
        Name = 'NOME'
        DataType = ftString
        Size = 60
      end
      item
        Name = 'IDPESSOA'
        DataType = ftFloat
      end
      item
        Name = 'MATRICULA'
        DataType = ftString
        Size = 13
      end
      item
        Name = 'IDEMPRESA'
        DataType = ftFloat
      end
      item
        Name = 'IDESTAB'
        DataType = ftFloat
      end
      item
        Name = 'IDHORARIO'
        DataType = ftFloat
      end
      item
        Name = 'TIPOSIT'
        Attributes = [faFixed]
        DataType = ftString
        Size = 1
      end
      item
        Name = 'DATAREFHORARIO'
        DataType = ftDateTime
      end
      item
        Name = 'SITUACAO'
        DataType = ftString
        Size = 10
      end>
    IndexDefs = <>
    Params = <>
    ReadOnly = True
    StoreDefs = True
    Left = 335
    Top = 311
  end
  object CdsRub3: TCMClientDataSet
    Aggregates = <>
    FieldDefs = <
      item
        Name = 'NOME'
        DataType = ftString
        Size = 60
      end
      item
        Name = 'IDPESSOA'
        DataType = ftFloat
      end
      item
        Name = 'MATRICULA'
        DataType = ftString
        Size = 13
      end
      item
        Name = 'IDEMPRESA'
        DataType = ftFloat
      end
      item
        Name = 'IDESTAB'
        DataType = ftFloat
      end
      item
        Name = 'IDHORARIO'
        DataType = ftFloat
      end
      item
        Name = 'TIPOSIT'
        Attributes = [faFixed]
        DataType = ftString
        Size = 1
      end
      item
        Name = 'DATAREFHORARIO'
        DataType = ftDateTime
      end
      item
        Name = 'SITUACAO'
        DataType = ftString
        Size = 10
      end>
    IndexDefs = <>
    Params = <>
    ReadOnly = True
    StoreDefs = True
    Left = 253
    Top = 197
  end
  object CdsRub6: TCMClientDataSet
    Aggregates = <>
    FieldDefs = <
      item
        Name = 'NOME'
        DataType = ftString
        Size = 60
      end
      item
        Name = 'IDPESSOA'
        DataType = ftFloat
      end
      item
        Name = 'MATRICULA'
        DataType = ftString
        Size = 13
      end
      item
        Name = 'IDEMPRESA'
        DataType = ftFloat
      end
      item
        Name = 'IDESTAB'
        DataType = ftFloat
      end
      item
        Name = 'IDHORARIO'
        DataType = ftFloat
      end
      item
        Name = 'TIPOSIT'
        Attributes = [faFixed]
        DataType = ftString
        Size = 1
      end
      item
        Name = 'DATAREFHORARIO'
        DataType = ftDateTime
      end
      item
        Name = 'SITUACAO'
        DataType = ftString
        Size = 10
      end>
    IndexDefs = <>
    Params = <>
    ReadOnly = True
    StoreDefs = True
    Left = 377
    Top = 342
  end
  object CdsRub7: TCMClientDataSet
    Aggregates = <>
    FieldDefs = <
      item
        Name = 'NOME'
        DataType = ftString
        Size = 60
      end
      item
        Name = 'IDPESSOA'
        DataType = ftFloat
      end
      item
        Name = 'MATRICULA'
        DataType = ftString
        Size = 13
      end
      item
        Name = 'IDEMPRESA'
        DataType = ftFloat
      end
      item
        Name = 'IDESTAB'
        DataType = ftFloat
      end
      item
        Name = 'IDHORARIO'
        DataType = ftFloat
      end
      item
        Name = 'TIPOSIT'
        Attributes = [faFixed]
        DataType = ftString
        Size = 1
      end
      item
        Name = 'DATAREFHORARIO'
        DataType = ftDateTime
      end
      item
        Name = 'SITUACAO'
        DataType = ftString
        Size = 10
      end>
    IndexDefs = <>
    Params = <>
    ReadOnly = True
    StoreDefs = True
    Left = 418
    Top = 368
  end
  object CdsEstab: TCMClientDataSet
    Aggregates = <>
    Params = <>
    Left = 619
    Top = 74
  end
  object CdsRub8: TCMClientDataSet
    Aggregates = <>
    FieldDefs = <
      item
        Name = 'NOME'
        DataType = ftString
        Size = 60
      end
      item
        Name = 'IDPESSOA'
        DataType = ftFloat
      end
      item
        Name = 'MATRICULA'
        DataType = ftString
        Size = 13
      end
      item
        Name = 'IDEMPRESA'
        DataType = ftFloat
      end
      item
        Name = 'IDESTAB'
        DataType = ftFloat
      end
      item
        Name = 'IDHORARIO'
        DataType = ftFloat
      end
      item
        Name = 'TIPOSIT'
        Attributes = [faFixed]
        DataType = ftString
        Size = 1
      end
      item
        Name = 'DATAREFHORARIO'
        DataType = ftDateTime
      end
      item
        Name = 'SITUACAO'
        DataType = ftString
        Size = 10
      end>
    IndexDefs = <>
    Params = <>
    ReadOnly = True
    StoreDefs = True
    Left = 391
    Top = 271
  end
end
