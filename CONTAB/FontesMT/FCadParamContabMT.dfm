inherited frmCadParamContabMT: TfrmCadParamContabMT
  Left = 97
  Top = 120
  Caption = 'Parâmetros da Contabilidade'
  ClientHeight = 474
  ClientWidth = 762
  OnDestroy = FormDestroy
  PixelsPerInch = 96
  TextHeight = 13
  inherited pnlFundo: TPanel
    Width = 762
    Height = 388
    object pgc: TPageControl
      Left = 1
      Top = 1
      Width = 760
      Height = 386
      ActivePage = tbs2
      Align = alClient
      TabOrder = 0
      object tbs1: TTabSheet
        Caption = 'Com Dependência'
        object Label1: TLabel
          Left = 432
          Top = 145
          Width = 94
          Height = 13
          Caption = 'Plano de Contas'
        end
        object gbMoedas: TGroupBox
          Left = 13
          Top = 239
          Width = 692
          Height = 65
          Caption = ' Moedas '
          TabOrder = 4
          object Label16: TLabel
            Left = 16
            Top = 18
            Width = 37
            Height = 13
            Caption = 'Oficial'
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clWindowText
            Font.Height = -11
            Font.Name = 'MS Sans Serif'
            Font.Style = [fsBold]
            ParentFont = False
          end
          object Label17: TLabel
            Left = 184
            Top = 18
            Width = 66
            Height = 13
            Caption = 'Gerencial 1'
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clWindowText
            Font.Height = -11
            Font.Name = 'MS Sans Serif'
            Font.Style = [fsBold]
            ParentFont = False
          end
          object Label18: TLabel
            Left = 352
            Top = 18
            Width = 66
            Height = 13
            Caption = 'Gerencial 2'
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clWindowText
            Font.Height = -11
            Font.Name = 'MS Sans Serif'
            Font.Style = [fsBold]
            ParentFont = False
          end
          object Label19: TLabel
            Left = 520
            Top = 18
            Width = 66
            Height = 13
            Caption = 'Gerencial 3'
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clWindowText
            Font.Height = -11
            Font.Name = 'MS Sans Serif'
            Font.Style = [fsBold]
            ParentFont = False
          end
          object dblkMoedaGer1: TwwDBLookupCombo
            Left = 184
            Top = 34
            Width = 153
            Height = 21
            DropDownAlignment = taLeftJustify
            Selected.Strings = (
              'MOEDESC'#9'20'#9'Moeda')
            DataField = 'PACMOEDAGERENCIAL'
            DataSource = ds
            LookupTable = cdsMoedaGen1
            LookupField = 'MOECODIGO'
            Style = csDropDownList
            TabOrder = 1
            AutoDropDown = True
            ShowButton = True
            AllowClearKey = True
            ShowMatchText = True
          end
          object dblkMoedaOfi: TwwDBLookupCombo
            Left = 16
            Top = 34
            Width = 153
            Height = 21
            DropDownAlignment = taLeftJustify
            Selected.Strings = (
              'MOEDESC'#9'20'#9'Moeda')
            DataField = 'PACMOEDAOFICIAL'
            DataSource = ds
            LookupTable = cdsMoedaOfi
            LookupField = 'MOECODIGO'
            Style = csDropDownList
            TabOrder = 0
            AutoDropDown = True
            ShowButton = True
            AllowClearKey = True
            ShowMatchText = True
          end
          object dblkMoedaGer2: TwwDBLookupCombo
            Left = 352
            Top = 34
            Width = 153
            Height = 21
            DropDownAlignment = taLeftJustify
            Selected.Strings = (
              'MOEDESC'#9'20'#9'Moeda')
            DataField = 'PACMOEDAGEREN1'
            DataSource = ds
            LookupTable = cdsMoedaGen2
            LookupField = 'MOECODIGO'
            Style = csDropDownList
            TabOrder = 2
            AutoDropDown = True
            ShowButton = True
            AllowClearKey = True
            ShowMatchText = True
          end
          object dblkMoedaGer3: TwwDBLookupCombo
            Left = 520
            Top = 34
            Width = 153
            Height = 21
            DropDownAlignment = taLeftJustify
            Selected.Strings = (
              'MOEDESC'#9'20'#9'Moeda')
            DataField = 'PACMOEDAGEREN2'
            DataSource = ds
            LookupTable = cdsMoedaGen3
            LookupField = 'MOECODIGO'
            Style = csDropDownList
            TabOrder = 3
            AutoDropDown = True
            ShowButton = True
            AllowClearKey = True
            ShowMatchText = True
          end
        end
        object dblkPlano: TwwDBLookupCombo
          Left = 432
          Top = 161
          Width = 273
          Height = 21
          DropDownAlignment = taLeftJustify
          Selected.Strings = (
            'DESCPLANO'#9'20'#9'DESCPLANO')
          DataField = 'PLANO'
          DataSource = ds
          LookupTable = cdsPlanoContas
          LookupField = 'PLANO'
          Style = csDropDownList
          TabOrder = 2
          AutoDropDown = True
          ShowButton = True
          AllowClearKey = True
          ShowMatchText = True
          OnCloseUp = dblkPlanoCloseUp
        end
        object GroupBox2: TGroupBox
          Left = 13
          Top = 4
          Width = 404
          Height = 181
          Caption = ' Faixa de Códigos Reduzidos '
          TabOrder = 0
          object Label2: TLabel
            Left = 16
            Top = 17
            Width = 30
            Height = 13
            Caption = 'Ativo'
            Color = clBtnFace
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clWindowText
            Font.Height = -11
            Font.Name = 'MS Sans Serif'
            Font.Style = [fsBold]
            ParentColor = False
            ParentFont = False
          end
          object Label7: TLabel
            Left = 96
            Top = 38
            Width = 8
            Height = 13
            Caption = 'a'
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clWindowText
            Font.Height = -11
            Font.Name = 'MS Sans Serif'
            Font.Style = [fsBold]
            ParentFont = False
          end
          object Label3: TLabel
            Left = 216
            Top = 17
            Width = 45
            Height = 13
            Caption = 'Passivo'
            Color = clBtnFace
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clWindowText
            Font.Height = -11
            Font.Name = 'MS Sans Serif'
            Font.Style = [fsBold]
            ParentColor = False
            ParentFont = False
          end
          object Label8: TLabel
            Left = 296
            Top = 38
            Width = 8
            Height = 13
            Caption = 'a'
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clWindowText
            Font.Height = -11
            Font.Name = 'MS Sans Serif'
            Font.Style = [fsBold]
            ParentFont = False
          end
          object Label4: TLabel
            Left = 216
            Top = 57
            Width = 45
            Height = 13
            Caption = 'Receita'
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clWindowText
            Font.Height = -11
            Font.Name = 'MS Sans Serif'
            Font.Style = [fsBold]
            ParentFont = False
          end
          object Label9: TLabel
            Left = 296
            Top = 77
            Width = 8
            Height = 13
            Caption = 'a'
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clWindowText
            Font.Height = -11
            Font.Name = 'MS Sans Serif'
            Font.Style = [fsBold]
            ParentFont = False
          end
          object Label5: TLabel
            Left = 16
            Top = 57
            Width = 50
            Height = 13
            Caption = 'Despesa'
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clWindowText
            Font.Height = -11
            Font.Name = 'MS Sans Serif'
            Font.Style = [fsBold]
            ParentFont = False
          end
          object Label10: TLabel
            Left = 96
            Top = 117
            Width = 8
            Height = 13
            Caption = 'a'
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clWindowText
            Font.Height = -11
            Font.Name = 'MS Sans Serif'
            Font.Style = [fsBold]
            ParentFont = False
          end
          object Label6: TLabel
            Left = 16
            Top = 97
            Width = 33
            Height = 13
            Caption = 'Custo'
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clWindowText
            Font.Height = -11
            Font.Name = 'MS Sans Serif'
            Font.Style = [fsBold]
            ParentFont = False
          end
          object Label11: TLabel
            Left = 96
            Top = 77
            Width = 8
            Height = 13
            Caption = 'a'
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clWindowText
            Font.Height = -11
            Font.Name = 'MS Sans Serif'
            Font.Style = [fsBold]
            ParentFont = False
          end
          object Label22: TLabel
            Left = 216
            Top = 97
            Width = 38
            Height = 13
            Caption = 'Outros'
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clWindowText
            Font.Height = -11
            Font.Name = 'MS Sans Serif'
            Font.Style = [fsBold]
            ParentFont = False
          end
          object Label23: TLabel
            Left = 296
            Top = 117
            Width = 8
            Height = 13
            Caption = 'a'
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clWindowText
            Font.Height = -11
            Font.Name = 'MS Sans Serif'
            Font.Style = [fsBold]
            ParentFont = False
          end
          object Label25: TLabel
            Left = 16
            Top = 137
            Width = 68
            Height = 13
            Caption = 'Estatísticas'
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clWindowText
            Font.Height = -11
            Font.Name = 'MS Sans Serif'
            Font.Style = [fsBold]
            ParentFont = False
          end
          object Label28: TLabel
            Left = 96
            Top = 157
            Width = 8
            Height = 13
            Caption = 'a'
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clWindowText
            Font.Height = -11
            Font.Name = 'MS Sans Serif'
            Font.Style = [fsBold]
            ParentFont = False
          end
          object dbseAtivoIni: TwwDBSpinEdit
            Left = 16
            Top = 33
            Width = 73
            Height = 21
            Increment = 1
            MaxValue = 999999
            MinValue = 1
            Value = 1
            DataField = 'PACREDUAI'
            DataSource = ds
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clWindowText
            Font.Height = -11
            Font.Name = 'MS Sans Serif'
            Font.Style = []
            ParentFont = False
            TabOrder = 0
            UnboundDataType = wwDefault
          end
          object dbseAtivoFim: TwwDBSpinEdit
            Left = 112
            Top = 33
            Width = 73
            Height = 21
            Increment = 1
            MaxValue = 999999
            DataField = 'PACREDUAF'
            DataSource = ds
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clWindowText
            Font.Height = -11
            Font.Name = 'MS Sans Serif'
            Font.Style = []
            ParentFont = False
            TabOrder = 1
            UnboundDataType = wwDefault
          end
          object dbsePassivoIni: TwwDBSpinEdit
            Left = 216
            Top = 33
            Width = 73
            Height = 21
            Increment = 1
            MaxValue = 999999
            MinValue = 1
            Value = 1
            DataField = 'PACREDUPI'
            DataSource = ds
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clWindowText
            Font.Height = -11
            Font.Name = 'MS Sans Serif'
            Font.Style = []
            ParentFont = False
            TabOrder = 2
            UnboundDataType = wwDefault
          end
          object dbsePassivoFim: TwwDBSpinEdit
            Left = 312
            Top = 33
            Width = 73
            Height = 21
            Increment = 1
            MaxValue = 999999
            DataField = 'PACREDUPF'
            DataSource = ds
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clWindowText
            Font.Height = -11
            Font.Name = 'MS Sans Serif'
            Font.Style = []
            ParentFont = False
            TabOrder = 3
            UnboundDataType = wwDefault
          end
          object dbseDespesaIni: TwwDBSpinEdit
            Left = 16
            Top = 73
            Width = 73
            Height = 21
            Increment = 1
            MaxValue = 999999
            MinValue = 1
            Value = 1
            DataField = 'PACREDUDI'
            DataSource = ds
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clWindowText
            Font.Height = -11
            Font.Name = 'MS Sans Serif'
            Font.Style = []
            ParentFont = False
            TabOrder = 4
            UnboundDataType = wwDefault
          end
          object dbseDespesaFim: TwwDBSpinEdit
            Left = 112
            Top = 73
            Width = 73
            Height = 21
            Increment = 1
            MaxValue = 999999
            DataField = 'PACREDUDF'
            DataSource = ds
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clWindowText
            Font.Height = -11
            Font.Name = 'MS Sans Serif'
            Font.Style = []
            ParentFont = False
            TabOrder = 5
            UnboundDataType = wwDefault
          end
          object dbseReceitaIni: TwwDBSpinEdit
            Left = 216
            Top = 73
            Width = 73
            Height = 21
            Increment = 1
            MaxValue = 999999
            MinValue = 1
            Value = 1
            DataField = 'PACREDURI'
            DataSource = ds
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clWindowText
            Font.Height = -11
            Font.Name = 'MS Sans Serif'
            Font.Style = []
            ParentFont = False
            TabOrder = 6
            UnboundDataType = wwDefault
          end
          object dbseReceitaFim: TwwDBSpinEdit
            Left = 312
            Top = 73
            Width = 73
            Height = 21
            Increment = 1
            MaxValue = 999999
            DataField = 'PACREDURF'
            DataSource = ds
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clWindowText
            Font.Height = -11
            Font.Name = 'MS Sans Serif'
            Font.Style = []
            ParentFont = False
            TabOrder = 7
            UnboundDataType = wwDefault
          end
          object dbseCustoIni: TwwDBSpinEdit
            Left = 16
            Top = 113
            Width = 73
            Height = 21
            Increment = 1
            MaxValue = 999999
            MinValue = 1
            Value = 1
            DataField = 'PACREDUCI'
            DataSource = ds
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clWindowText
            Font.Height = -11
            Font.Name = 'MS Sans Serif'
            Font.Style = []
            ParentFont = False
            TabOrder = 8
            UnboundDataType = wwDefault
          end
          object dbseCustoFim: TwwDBSpinEdit
            Left = 112
            Top = 113
            Width = 73
            Height = 21
            Increment = 1
            MaxValue = 999999
            DataField = 'PACREDUCF'
            DataSource = ds
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clWindowText
            Font.Height = -11
            Font.Name = 'MS Sans Serif'
            Font.Style = []
            ParentFont = False
            TabOrder = 9
            UnboundDataType = wwDefault
          end
          object dbseOutrosini: TwwDBSpinEdit
            Left = 216
            Top = 113
            Width = 73
            Height = 21
            Increment = 1
            MaxValue = 999999
            MinValue = 1
            Value = 1
            DataField = 'PACREDUOI'
            DataSource = ds
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clWindowText
            Font.Height = -11
            Font.Name = 'MS Sans Serif'
            Font.Style = []
            ParentFont = False
            TabOrder = 10
            UnboundDataType = wwDefault
          end
          object dbseOutrosfim: TwwDBSpinEdit
            Left = 312
            Top = 113
            Width = 73
            Height = 21
            Increment = 1
            MaxValue = 999999
            DataField = 'PACREDUOF'
            DataSource = ds
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clWindowText
            Font.Height = -11
            Font.Name = 'MS Sans Serif'
            Font.Style = []
            ParentFont = False
            TabOrder = 11
            UnboundDataType = wwDefault
          end
          object dbseEstatisticaIni: TwwDBSpinEdit
            Left = 16
            Top = 153
            Width = 73
            Height = 21
            Increment = 1
            MaxValue = 999999
            MinValue = 1
            Value = 1
            DataField = 'PACREDUEI'
            DataSource = ds
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clWindowText
            Font.Height = -11
            Font.Name = 'MS Sans Serif'
            Font.Style = []
            ParentFont = False
            TabOrder = 12
            UnboundDataType = wwDefault
          end
          object dbseEstatisticaFim: TwwDBSpinEdit
            Left = 112
            Top = 153
            Width = 73
            Height = 21
            Increment = 1
            MaxValue = 999999
            DataField = 'PACREDUEF'
            DataSource = ds
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clWindowText
            Font.Height = -11
            Font.Name = 'MS Sans Serif'
            Font.Style = []
            ParentFont = False
            TabOrder = 13
            UnboundDataType = wwDefault
          end
        end
        object GroupBox7: TGroupBox
          Left = 432
          Top = 4
          Width = 273
          Height = 135
          Caption = 'Subgrupos'
          TabOrder = 1
          object dbedsub1: TwwDBEdit
            Left = 16
            Top = 17
            Width = 241
            Height = 21
            DataField = 'PACSUBGRP1'
            DataSource = ds
            TabOrder = 0
            UnboundDataType = wwDefault
            WantReturns = False
            WordWrap = False
          end
          object dbedsub2: TwwDBEdit
            Left = 16
            Top = 45
            Width = 241
            Height = 21
            DataField = 'PACSUBGRP2'
            DataSource = ds
            TabOrder = 2
            UnboundDataType = wwDefault
            WantReturns = False
            WordWrap = False
          end
          object dbedsub3: TwwDBEdit
            Left = 16
            Top = 73
            Width = 241
            Height = 21
            DataField = 'PACSUBGRP3'
            DataSource = ds
            TabOrder = 1
            UnboundDataType = wwDefault
            WantReturns = False
            WordWrap = False
          end
          object dbedsub4: TwwDBEdit
            Left = 16
            Top = 102
            Width = 241
            Height = 21
            DataField = 'PACSUBGRP4'
            DataSource = ds
            TabOrder = 3
            UnboundDataType = wwDefault
            WantReturns = False
            WordWrap = False
          end
        end
        object gbFechamento: TGroupBox
          Left = 14
          Top = 187
          Width = 403
          Height = 53
          Caption = ' Fechamento '
          TabOrder = 3
          object lblDataUltFecha: TLabel
            Left = 232
            Top = 10
            Width = 109
            Height = 13
            Caption = 'Último Fechamento'
          end
          object dbrgTipoFecha: TDBRadioGroup
            Left = 8
            Top = 13
            Width = 209
            Height = 33
            Caption = ' Tipo '
            Columns = 2
            DataField = 'FLGTIPOFECHAMENTO'
            DataSource = ds
            Items.Strings = (
              'por &Período'
              '&Diário')
            TabOrder = 0
            Values.Strings = (
              'P'
              'D')
            OnChange = dbrgTipoFechaChange
          end
          object dbedDataUltFecha: TCMDateTimePicker
            Left = 232
            Top = 25
            Width = 121
            Height = 21
            CalendarAttributes.Font.Charset = DEFAULT_CHARSET
            CalendarAttributes.Font.Color = clWindowText
            CalendarAttributes.Font.Height = -11
            CalendarAttributes.Font.Name = 'MS Sans Serif'
            CalendarAttributes.Font.Style = []
            ButtonStyle = cbsCustom
            DataField = 'DATAULTFECHA'
            DataSource = ds
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
      end
      object tbs2: TTabSheet
        Caption = 'Livres'
        object grbPla: TGroupBox
          Left = 15
          Top = 15
          Width = 245
          Height = 112
          Caption = ' Verificação de Planilhas '
          TabOrder = 0
          object Label12: TLabel
            Left = 17
            Top = 26
            Width = 172
            Height = 13
            Caption = 'Saldos de débitos com crédito'
            Color = clBtnFace
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clWindowText
            Font.Height = -11
            Font.Name = 'MS Sans Serif'
            Font.Style = [fsBold]
            ParentColor = False
            ParentFont = False
          end
          object Label13: TLabel
            Left = 17
            Top = 66
            Width = 165
            Height = 13
            Caption = 'Total digitado com informado'
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clWindowText
            Font.Height = -11
            Font.Name = 'MS Sans Serif'
            Font.Style = [fsBold]
            ParentFont = False
          end
          object lblPla: TLabel
            Left = 166
            Top = -1
            Width = 32
            Height = 13
            Caption = 'lblPla'
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clBlue
            Font.Height = -11
            Font.Name = 'MS Sans Serif'
            Font.Style = [fsBold]
            ParentFont = False
            Visible = False
          end
          object dbcbDebCre: TwwDBComboBox
            Left = 17
            Top = 40
            Width = 210
            Height = 21
            ShowButton = True
            Style = csDropDown
            MapList = True
            AllowClearKey = False
            DataField = 'PACDEBCRE'
            DataSource = ds
            DropDownCount = 8
            ItemHeight = 0
            Items.Strings = (
              'Validar'#9'S'
              'Não Validar'#9'N'
              'Bloquear'#9'B')
            Sorted = False
            TabOrder = 0
            UnboundDataType = wwDefault
          end
          object dbcbTotDig: TwwDBComboBox
            Left = 17
            Top = 80
            Width = 210
            Height = 21
            ShowButton = True
            Style = csDropDown
            MapList = True
            AllowClearKey = False
            DataField = 'PACTOTAIS'
            DataSource = ds
            DropDownCount = 8
            ItemHeight = 0
            Items.Strings = (
              'Validar'#9'S'
              'Não Validar'#9'N'
              'Bloquear'#9'B')
            Sorted = False
            TabOrder = 1
            UnboundDataType = wwDefault
          end
        end
        object GroupBox9: TGroupBox
          Left = 274
          Top = 14
          Width = 453
          Height = 113
          Caption = ' Tipo de Operação '
          TabOrder = 1
          object Label26: TLabel
            Left = 16
            Top = 24
            Width = 70
            Height = 13
            Caption = 'Lançamento'
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clWindowText
            Font.Height = -11
            Font.Name = 'MS Sans Serif'
            Font.Style = [fsBold]
            ParentFont = False
          end
          object Label27: TLabel
            Left = 16
            Top = 64
            Width = 126
            Height = 13
            Caption = 'Atualização de moeda'
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clWindowText
            Font.Height = -11
            Font.Name = 'MS Sans Serif'
            Font.Style = [fsBold]
            ParentFont = False
          end
          object Label15: TLabel
            Left = 230
            Top = 24
            Width = 167
            Height = 13
            Caption = 'Encerra Contas de Resultado'
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clWindowText
            Font.Height = -11
            Font.Name = 'MS Sans Serif'
            Font.Style = [fsBold]
            ParentFont = False
          end
          object Label29: TLabel
            Left = 230
            Top = 64
            Width = 64
            Height = 13
            Caption = 'Importação'
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clWindowText
            Font.Height = -11
            Font.Name = 'MS Sans Serif'
            Font.Style = [fsBold]
            ParentFont = False
          end
          object dblkTipOperLancam: TwwDBLookupCombo
            Left = 16
            Top = 40
            Width = 209
            Height = 21
            DropDownAlignment = taLeftJustify
            Selected.Strings = (
              'TIPDESCRICAO'#9'25'#9'TIPDESCRICAO')
            DataField = 'PACTIPOPERLANC'
            DataSource = ds
            LookupTable = cdsTipoLanc
            LookupField = 'TIPCODIGO'
            TabOrder = 0
            AutoDropDown = True
            ShowButton = True
            AllowClearKey = False
            OnChange = dblkTipOperLancamChange
            OnCloseUp = dblkTipOperLancamCloseUp
          end
          object dblkTipOperMoeda: TwwDBLookupCombo
            Left = 16
            Top = 80
            Width = 209
            Height = 21
            DropDownAlignment = taLeftJustify
            Selected.Strings = (
              'TIPDESCRICAO'#9'25'#9'TIPDESCRICAO')
            DataField = 'PACTIPOPERMOEDA'
            DataSource = ds
            LookupTable = cdsTipoAtuaMoeda
            LookupField = 'TIPCODIGO'
            TabOrder = 1
            AutoDropDown = True
            ShowButton = True
            AllowClearKey = False
            OnCloseUp = dblkTipOperMoedaCloseUp
          end
          object dblkTipOperResult: TwwDBLookupCombo
            Left = 230
            Top = 40
            Width = 209
            Height = 21
            DropDownAlignment = taLeftJustify
            Selected.Strings = (
              'TIPDESCRICAO'#9'25'#9'TIPDESCRICAO')
            DataField = 'PACTIPOPERRESULT'
            DataSource = ds
            LookupTable = cdsTipoOperContas
            LookupField = 'TIPCODIGO'
            TabOrder = 2
            AutoDropDown = True
            ShowButton = True
            AllowClearKey = False
          end
          object dblkTipOperImport: TwwDBLookupCombo
            Left = 230
            Top = 80
            Width = 209
            Height = 21
            DropDownAlignment = taLeftJustify
            Selected.Strings = (
              'TIPDESCRICAO'#9'25'#9'TIPDESCRICAO')
            DataField = 'PACTIPOPERIMPTXT'
            DataSource = ds
            LookupTable = cdsTipoOperImp
            LookupField = 'TIPCODIGO'
            TabOrder = 3
            AutoDropDown = True
            ShowButton = True
            AllowClearKey = False
            OnCloseUp = dblkTipOperImportCloseUp
          end
        end
        object GroupBox3: TGroupBox
          Left = 15
          Top = 137
          Width = 715
          Height = 216
          Caption = ' Miscelânea '
          TabOrder = 2
          object Label14: TLabel
            Left = 16
            Top = 21
            Width = 143
            Height = 13
            Caption = 'Numeração das planilhas'
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clWindowText
            Font.Height = -11
            Font.Name = 'MS Sans Serif'
            Font.Style = [fsBold]
            ParentFont = False
          end
          object Label20: TLabel
            Left = 16
            Top = 58
            Width = 139
            Height = 13
            Caption = 'Efetuar lançamentos por'
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clWindowText
            Font.Height = -11
            Font.Name = 'MS Sans Serif'
            Font.Style = [fsBold]
            ParentFont = False
          end
          object Label24: TLabel
            Left = 176
            Top = 21
            Width = 88
            Height = 13
            Caption = 'Exercício Atual'
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clWindowText
            Font.Height = -11
            Font.Name = 'MS Sans Serif'
            Font.Style = [fsBold]
            ParentFont = False
          end
          object Label33: TLabel
            Left = 16
            Top = 94
            Width = 112
            Height = 13
            Caption = 'Subconta ordenada'
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clWindowText
            Font.Height = -11
            Font.Name = 'MS Sans Serif'
            Font.Style = [fsBold]
            ParentFont = False
          end
          object Label39: TLabel
            Left = 362
            Top = 93
            Width = 103
            Height = 13
            Caption = 'contra a sua natureza'
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clWindowText
            Font.Height = -9
            Font.Name = 'MS Sans Serif'
            Font.Style = []
            ParentFont = False
          end
          object Label40: TLabel
            Left = 364
            Top = 125
            Width = 94
            Height = 13
            Caption = 'geradas no Período'
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clWindowText
            Font.Height = -9
            Font.Name = 'MS Sans Serif'
            Font.Style = []
            ParentFont = False
          end
          object Label46: TLabel
            Left = 16
            Top = 131
            Width = 130
            Height = 13
            Caption = 'Bloquear Lançamentos'
          end
          object Bevel2: TBevel
            Left = 318
            Top = 7
            Width = 2
            Height = 208
            Shape = bsLeftLine
          end
          object Label21: TLabel
            Left = 554
            Top = 154
            Width = 154
            Height = 13
            Caption = 'Planilhas na tela de Lançamento'
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clWindowText
            Font.Height = -9
            Font.Name = 'MS Sans Serif'
            Font.Style = []
            ParentFont = False
          end
          object chkCorrespond: TDBCheckBox
            Left = 344
            Top = 37
            Width = 177
            Height = 17
            Caption = 'Permite Conta Correspondente'
            DataField = 'PACCORRESPOND'
            DataSource = ds
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clWindowText
            Font.Height = -11
            Font.Name = 'MS Sans Serif'
            Font.Style = []
            ParentFont = False
            TabOrder = 5
            ValueChecked = 'S'
            ValueUnchecked = 'N'
          end
          object chkNatureza: TDBCheckBox
            Left = 344
            Top = 78
            Width = 185
            Height = 15
            Caption = 'Permite fechamento com contas '
            DataField = 'PACCONTRANATUR'
            DataSource = ds
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clWindowText
            Font.Height = -9
            Font.Name = 'MS Sans Serif'
            Font.Style = []
            ParentFont = False
            TabOrder = 7
            ValueChecked = 'S'
            ValueUnchecked = 'N'
          end
          object chkData: TDBCheckBox
            Left = 536
            Top = 69
            Width = 145
            Height = 17
            Caption = 'Obriga Digitação da Data'
            DataField = 'PACOBRIGADATA'
            DataSource = ds
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clWindowText
            Font.Height = -11
            Font.Name = 'MS Sans Serif'
            Font.Style = []
            ParentFont = False
            TabOrder = 12
            ValueChecked = 'S'
            ValueUnchecked = 'N'
          end
          object dbeExercicio: TwwDBEdit
            Left = 176
            Top = 35
            Width = 113
            Height = 21
            DataField = 'PACEXERCICIOATUAL'
            DataSource = ds
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clWindowText
            Font.Height = -9
            Font.Name = 'MS Sans Serif'
            Font.Style = [fsBold]
            ParentFont = False
            TabOrder = 1
            UnboundDataType = wwDefault
            WantReturns = False
            WordWrap = False
          end
          object chkDocumento: TDBCheckBox
            Left = 536
            Top = 52
            Width = 169
            Height = 17
            Caption = 'Obriga Número do Documento'
            DataField = 'PACNUMDOC'
            DataSource = ds
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clWindowText
            Font.Height = -11
            Font.Name = 'MS Sans Serif'
            Font.Style = []
            ParentFont = False
            TabOrder = 11
            ValueChecked = 'S'
            ValueUnchecked = 'N'
          end
          object chkAtivProj: TDBCheckBox
            Left = 536
            Top = 87
            Width = 169
            Height = 17
            Caption = 'Obriga Atividade/Projeto'
            DataField = 'PACATIVPROJ'
            DataSource = ds
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clWindowText
            Font.Height = -11
            Font.Name = 'MS Sans Serif'
            Font.Style = []
            ParentFont = False
            TabOrder = 13
            ValueChecked = 'S'
            ValueUnchecked = 'N'
          end
          object chkTipOper: TDBCheckBox
            Left = 536
            Top = 105
            Width = 169
            Height = 17
            Caption = 'Obriga Tipo de Operação'
            DataField = 'PACTIPOOPER'
            DataSource = ds
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clWindowText
            Font.Height = -11
            Font.Name = 'MS Sans Serif'
            Font.Style = []
            ParentFont = False
            TabOrder = 14
            ValueChecked = 'S'
            ValueUnchecked = 'N'
          end
          object chkVerificaPrePronta: TDBCheckBox
            Left = 344
            Top = 110
            Width = 169
            Height = 17
            Caption = 'Verifica se as Planilhas já foram'
            DataField = 'PACVALIDAPROC'
            DataSource = ds
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clWindowText
            Font.Height = -11
            Font.Name = 'MS Sans Serif'
            Font.Style = []
            ParentFont = False
            TabOrder = 8
            ValueChecked = 'S'
            ValueUnchecked = 'N'
          end
          object dbcbNumPlanil: TwwDBComboBox
            Left = 16
            Top = 35
            Width = 145
            Height = 21
            Hint = 
              'Este campo fica desabilitado se o parâmero "Planilhas Numeradas ' +
              'por Sequence" estiver habilitado.'
            ShowButton = True
            Style = csDropDown
            MapList = True
            AllowClearKey = False
            DataField = 'PACDIAMES'
            DataSource = ds
            DropDownCount = 8
            ItemHeight = 0
            Items.Strings = (
              'Dia'#9'D'
              'Período'#9'P'
              'Exercício'#9'E')
            Sorted = False
            TabOrder = 0
            UnboundDataType = wwDefault
          end
          object dbcbCadConta: TwwDBComboBox
            Left = 16
            Top = 72
            Width = 273
            Height = 21
            ShowButton = True
            Style = csDropDown
            MapList = True
            AllowClearKey = False
            DataField = 'PACCODRED'
            DataSource = ds
            DropDownCount = 8
            ItemHeight = 0
            Items.Strings = (
              'Código Reduzido'#9'R'
              'Conta Contábil'#9'C'
              'Conta Contábil + Dig.Verificador'#9'D'
              'Conta Correspondente'#9'P')
            Sorted = False
            TabOrder = 2
            UnboundDataType = wwDefault
          end
          object dbcbSubConta: TwwDBComboBox
            Left = 16
            Top = 108
            Width = 273
            Height = 21
            ShowButton = True
            Style = csDropDown
            MapList = True
            AllowClearKey = False
            DataField = 'PACORDEMSUBCONTA'
            DataSource = ds
            DropDownCount = 8
            ItemHeight = 0
            Items.Strings = (
              'Código'#9'C'
              'Descrição'#9'D')
            Sorted = False
            TabOrder = 3
            UnboundDataType = wwDefault
          end
          object chkEstorno: TDBCheckBox
            Left = 536
            Top = 16
            Width = 169
            Height = 17
            Caption = 'Obriga estorno de Lançamentos'
            Color = clBtnFace
            DataField = 'PACESTORNA'
            DataSource = ds
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clWindowText
            Font.Height = -9
            Font.Name = 'MS Sans Serif'
            Font.Style = []
            ParentColor = False
            ParentFont = False
            TabOrder = 9
            ValueChecked = 'S'
            ValueUnchecked = 'N'
          end
          object chkDobrada: TDBCheckBox
            Left = 344
            Top = 16
            Width = 177
            Height = 17
            Caption = 'Obriga Partida Dobrada'
            Color = clBtnFace
            DataField = 'PACDOBRADA'
            DataSource = ds
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clWindowText
            Font.Height = -9
            Font.Name = 'MS Sans Serif'
            Font.Style = []
            ParentColor = False
            ParentFont = False
            TabOrder = 4
            ValueChecked = 'S'
            ValueUnchecked = 'N'
          end
          object chkHisto: TDBCheckBox
            Left = 536
            Top = 35
            Width = 154
            Height = 17
            Caption = 'Obriga Código do Histórico'
            Color = clBtnFace
            DataField = 'PACOBRIGAHIST'
            DataSource = ds
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clWindowText
            Font.Height = -9
            Font.Name = 'MS Sans Serif'
            Font.Style = []
            ParentColor = False
            ParentFont = False
            TabOrder = 10
            ValueChecked = 'S'
            ValueUnchecked = 'N'
          end
          object chkMantem: TDBCheckBox
            Left = 344
            Top = 57
            Width = 185
            Height = 17
            Caption = 'Mantém último Lançamento na tela'
            Color = clBtnFace
            DataField = 'PACMANTEM'
            DataSource = ds
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clWindowText
            Font.Height = -9
            Font.Name = 'MS Sans Serif'
            Font.Style = []
            ParentColor = False
            ParentFont = False
            TabOrder = 6
            ValueChecked = 'S'
            ValueUnchecked = 'N'
          end
          object CMDateTimePicker1: TCMDateTimePicker
            Left = 16
            Top = 145
            Width = 121
            Height = 21
            CalendarAttributes.Font.Charset = DEFAULT_CHARSET
            CalendarAttributes.Font.Color = clWindowText
            CalendarAttributes.Font.Height = -11
            CalendarAttributes.Font.Name = 'MS Sans Serif'
            CalendarAttributes.Font.Style = []
            ButtonStyle = cbsCustom
            DataField = 'PACDATABLOQ'
            DataSource = ds
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
            TabOrder = 15
          end
          object chkPermiteZero: TDBCheckBox
            Left = 344
            Top = 141
            Width = 169
            Height = 17
            Caption = 'Permite Lanç. com Valor Zero'
            DataField = 'FLGPERMITEZERO'
            DataSource = ds
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clWindowText
            Font.Height = -11
            Font.Name = 'MS Sans Serif'
            Font.Style = []
            ParentFont = False
            TabOrder = 16
            ValueChecked = 'S'
            ValueUnchecked = 'N'
          end
          object chkHistCaixaAlta: TDBCheckBox
            Left = 536
            Top = 122
            Width = 175
            Height = 17
            Caption = 'Histórico sempre em Maiúsculas'
            DataField = 'FLGHISTCAIXAALTA'
            DataSource = ds
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clWindowText
            Font.Height = -11
            Font.Name = 'MS Sans Serif'
            Font.Style = []
            ParentFont = False
            TabOrder = 17
            ValueChecked = 'S'
            ValueUnchecked = 'N'
          end
          object DBCheckBox1: TDBCheckBox
            Left = 536
            Top = 139
            Width = 174
            Height = 17
            Caption = 'Exibe Consulta Resumida das'
            DataField = 'PACPESQPLALANC'
            DataSource = ds
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clWindowText
            Font.Height = -11
            Font.Name = 'MS Sans Serif'
            Font.Style = []
            ParentFont = False
            TabOrder = 18
            ValueChecked = 'S'
            ValueUnchecked = 'N'
          end
          object DBCFlgSeq: TDBCheckBox
            Left = 344
            Top = 162
            Width = 200
            Height = 17
            Hint = 
              'Este parâmero não é editável, é ativado no processo da tela \Uti' +
              'litários\Ativar Numeração de Planilhas Por Seqüence'
            Caption = 'Planilhas Numeradas por Sequence'
            DataField = 'FLGPLNSEQUENCE'
            DataSource = ds
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clWindowText
            Font.Height = -11
            Font.Name = 'MS Sans Serif'
            Font.Style = []
            ParentFont = False
            ParentShowHint = False
            ShowHint = True
            TabOrder = 19
            ValueChecked = 'S'
            ValueUnchecked = 'N'
          end
          object dbchkUsaSproc: TDBCheckBox
            Left = 344
            Top = 183
            Width = 241
            Height = 17
            Hint = 
              'Ativa a utilização de Stored Procedure para alualização de saldo' +
              's de contas sintéticas e analíticas em tempo real.'
            Caption = 'Utiliza Stored Procedure para Atualizar Saldos'
            DataField = 'FLGUSASPLANCASLD'
            DataSource = ds
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clWindowText
            Font.Height = -11
            Font.Name = 'MS Sans Serif'
            Font.Style = []
            ParentFont = False
            ParentShowHint = False
            ShowHint = True
            TabOrder = 20
            ValueChecked = 'S'
            ValueUnchecked = 'N'
          end
        end
      end
      object tbs3: TTabSheet
        Caption = 'Contas de Referência / Apuração de Resultados'
        object Label38: TLabel
          Left = 560
          Top = 107
          Width = 174
          Height = 13
          Caption = 'Histór. para apurar o resultado'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'MS Sans Serif'
          Font.Style = [fsBold]
          ParentFont = False
        end
        object Bevel1: TBevel
          Left = 368
          Top = 236
          Width = 337
          Height = 9
          Shape = bsTopLine
        end
        object dblkHistorico: TwwDBLookupCombo
          Left = 560
          Top = 121
          Width = 179
          Height = 21
          DropDownAlignment = taLeftJustify
          Selected.Strings = (
            'HITDESCR1'#9'200'#9'HITDESCR1')
          DataField = 'PACHISTDEFSUP'
          DataSource = ds
          LookupTable = cdsHistorico
          LookupField = 'HITCODHIST'
          DropDownWidth = 8
          TabOrder = 0
          AutoDropDown = True
          ShowButton = True
          AllowClearKey = False
        end
        object pcAtualAnterior: TPageControl
          Left = 0
          Top = 194
          Width = 744
          Height = 118
          ActivePage = tbsAtual
          TabOrder = 1
          object tbsAtual: TTabSheet
            Caption = 'Exercício Atual'
            object cmpConta8: TCMProcuraMaskContabil
              Left = 4
              Top = 10
              Width = 176
              Height = 79
              Caption = 'Result do Prog. Previdencial'
              TabOrder = 0
              OnExit = cmpConta8Exit
              MostraMensagens = True
              MostraDescricao = True
              DataSource = ds
              DataField = 'PACPROGPREV'
              Mensagens.EmBranco = 'Conta não pode estar em branco'
              Mensagens.NaoExiste = 'Conta não existe'
              Mensagens.Sintetica = 'Conta não pode ser sintética'
              Mensagens.Analitica = 'Conta não pode ser analítica'
              PermiteChaveInvalida = False
              PermiteChaveEmBranco = True
              AceitaTipoConta = Indiferente
              Plano = 0
              Status = scAmbas
            end
            object cmpConta9: TCMProcuraMaskContabil
              Left = 187
              Top = 10
              Width = 176
              Height = 79
              Caption = 'Reserva de Contingência'
              TabOrder = 1
              OnExit = cmpConta9Exit
              MostraMensagens = True
              MostraDescricao = True
              DataSource = ds
              DataField = 'PACRESECONT'
              Mensagens.EmBranco = 'Conta não pode estar em branco'
              Mensagens.NaoExiste = 'Conta não existe'
              Mensagens.Sintetica = 'Conta não pode ser sintética'
              Mensagens.Analitica = 'Conta não pode ser analítica'
              PermiteChaveInvalida = False
              PermiteChaveEmBranco = True
              AceitaTipoConta = Indiferente
              Plano = 0
              Status = scAmbas
            end
            object cmpConta10: TCMProcuraMaskContabil
              Left = 368
              Top = 10
              Width = 176
              Height = 79
              Caption = 'Déficit Técnico'
              TabOrder = 2
              OnExit = cmpConta10Exit
              MostraMensagens = True
              MostraDescricao = True
              DataSource = ds
              DataField = 'PACDEFITECN'
              Mensagens.EmBranco = 'Conta não pode estar em branco'
              Mensagens.NaoExiste = 'Conta não existe'
              Mensagens.Sintetica = 'Conta não pode ser sintética'
              Mensagens.Analitica = 'Conta não pode ser analítica'
              PermiteChaveInvalida = False
              PermiteChaveEmBranco = True
              AceitaTipoConta = Indiferente
              Plano = 0
              Status = scAmbas
            end
            object cmpConta11: TCMProcuraMaskContabil
              Left = 553
              Top = 10
              Width = 176
              Height = 79
              Caption = 'Formação Superáv Técnico'
              TabOrder = 3
              OnExit = cmpConta11Exit
              MostraMensagens = True
              MostraDescricao = True
              DataSource = ds
              DataField = 'PACFORMSUPETECN'
              Mensagens.EmBranco = 'Conta não pode estar em branco'
              Mensagens.NaoExiste = 'Conta não existe'
              Mensagens.Sintetica = 'Conta não pode ser sintética'
              Mensagens.Analitica = 'Conta não pode ser analítica'
              PermiteChaveInvalida = False
              PermiteChaveEmBranco = True
              AceitaTipoConta = SoAnalitica
              Plano = 0
              Status = scAmbas
            end
          end
          object tbsAnterior: TTabSheet
            Caption = 'Exercícios Anteriores'
            ImageIndex = 1
            object cmpConta12: TCMProcuraMaskContabil
              Left = 11
              Top = 10
              Width = 176
              Height = 79
              Caption = 'Reserva de Contingência'
              TabOrder = 0
              OnExit = cmpConta12Exit
              MostraMensagens = True
              MostraDescricao = True
              DataSource = ds
              DataField = 'PACRESECONTA'
              Mensagens.EmBranco = 'Conta não pode estar em branco'
              Mensagens.NaoExiste = 'Conta não existe'
              Mensagens.Sintetica = 'Conta não pode ser sintética'
              Mensagens.Analitica = 'Conta não pode ser analítica'
              PermiteChaveInvalida = False
              PermiteChaveEmBranco = True
              AceitaTipoConta = SoAnalitica
              Plano = 0
              Status = scAmbas
            end
            object cmpConta13: TCMProcuraMaskContabil
              Left = 194
              Top = 10
              Width = 176
              Height = 79
              Caption = 'Déficit Técnico'
              TabOrder = 1
              OnExit = cmpConta13Exit
              MostraMensagens = True
              MostraDescricao = True
              DataSource = ds
              DataField = 'PACDEFITECNA'
              Mensagens.EmBranco = 'Conta não pode estar em branco'
              Mensagens.NaoExiste = 'Conta não existe'
              Mensagens.Sintetica = 'Conta não pode ser sintética'
              Mensagens.Analitica = 'Conta não pode ser analítica'
              PermiteChaveInvalida = False
              PermiteChaveEmBranco = True
              AceitaTipoConta = SoAnalitica
              Plano = 0
              Status = scAmbas
            end
            object cmpConta14: TCMProcuraMaskContabil
              Left = 377
              Top = 10
              Width = 181
              Height = 79
              Caption = 'Fundo Cob. Oscilação Riscos'
              TabOrder = 2
              OnExit = cmpConta14Exit
              MostraMensagens = True
              MostraDescricao = True
              DataSource = ds
              DataField = 'PACFDOCOBOSCRISCA'
              Mensagens.EmBranco = 'Conta não pode estar em branco'
              Mensagens.NaoExiste = 'Conta não existe'
              Mensagens.Sintetica = 'Conta não pode ser sintética'
              Mensagens.Analitica = 'Conta não pode ser analítica'
              PermiteChaveInvalida = False
              PermiteChaveEmBranco = True
              AceitaTipoConta = SoAnalitica
              Plano = 0
              Status = scAmbas
            end
          end
        end
        object cmpConta1: TCMProcuraMaskContabil
          Left = 10
          Top = 17
          Width = 176
          Height = 79
          Caption = 'Conta de Gan/Per Cambiais'
          TabOrder = 2
          OnExit = cmpConta1Exit
          MostraMensagens = True
          MostraDescricao = True
          DataSource = ds
          DataField = 'PACPERDAGANHO'
          Mensagens.EmBranco = 'Conta não pode estar em branco'
          Mensagens.NaoExiste = 'Conta não existe'
          Mensagens.Sintetica = 'Conta não pode ser sintética'
          Mensagens.Analitica = 'Conta não pode ser analítica'
          PermiteChaveInvalida = False
          PermiteChaveEmBranco = True
          AceitaTipoConta = SoAnalitica
          Plano = 0
          Status = scAmbas
        end
        object cmpConta2: TCMProcuraMaskContabil
          Left = 194
          Top = 17
          Width = 176
          Height = 79
          Caption = 'Encerra Conta de Resultado '
          TabOrder = 3
          OnExit = cmpConta2Exit
          MostraMensagens = True
          MostraDescricao = True
          DataSource = ds
          DataField = 'PACCONRESULT'
          Mensagens.EmBranco = 'Conta não pode estar em branco'
          Mensagens.NaoExiste = 'Conta não existe'
          Mensagens.Sintetica = 'Conta não pode ser sintética'
          Mensagens.Analitica = 'Conta não pode ser analítica'
          PermiteChaveInvalida = False
          PermiteChaveEmBranco = True
          AceitaTipoConta = SoAnalitica
          Plano = 0
          Status = scAmbas
        end
        object cmpConta3: TCMProcuraMaskContabil
          Left = 378
          Top = 17
          Width = 176
          Height = 79
          Caption = 'Reversão Superávit Técnico'
          TabOrder = 4
          OnExit = cmpConta3Exit
          MostraMensagens = True
          MostraDescricao = True
          DataSource = ds
          DataField = 'PACREVESUPETECN'
          Mensagens.EmBranco = 'Conta não pode estar em branco'
          Mensagens.NaoExiste = 'Conta não existe'
          Mensagens.Sintetica = 'Conta não pode ser sintética'
          Mensagens.Analitica = 'Conta não pode ser analítica'
          PermiteChaveInvalida = False
          PermiteChaveEmBranco = True
          AceitaTipoConta = Indiferente
          Plano = 0
          Status = scAmbas
        end
        object cmpConta4: TCMProcuraMaskContabil
          Left = 562
          Top = 17
          Width = 176
          Height = 79
          Caption = 'Formação Déficit Técnico'
          TabOrder = 5
          OnExit = cmpConta4Exit
          MostraMensagens = True
          MostraDescricao = True
          DataSource = ds
          DataField = 'PACFORMDEFITECN'
          Mensagens.EmBranco = 'Conta não pode estar em branco'
          Mensagens.NaoExiste = 'Conta não existe'
          Mensagens.Sintetica = 'Conta não pode ser sintética'
          Mensagens.Analitica = 'Conta não pode ser analítica'
          PermiteChaveInvalida = False
          PermiteChaveEmBranco = True
          AceitaTipoConta = SoAnalitica
          Plano = 0
          Status = scAmbas
        end
        object cmpConta5: TCMProcuraMaskContabil
          Left = 10
          Top = 105
          Width = 176
          Height = 79
          Caption = 'Reversão do Déficit Técnico'
          TabOrder = 6
          OnExit = cmpConta5Exit
          MostraMensagens = True
          MostraDescricao = True
          DataSource = ds
          DataField = 'PACREVEDEFITECN'
          Mensagens.EmBranco = 'Conta não pode estar em branco'
          Mensagens.NaoExiste = 'Conta não existe'
          Mensagens.Sintetica = 'Conta não pode ser sintética'
          Mensagens.Analitica = 'Conta não pode ser analítica'
          PermiteChaveInvalida = False
          PermiteChaveEmBranco = True
          AceitaTipoConta = SoAnalitica
          Plano = 0
          Status = scAmbas
        end
        object cmpConta6: TCMProcuraMaskContabil
          Left = 194
          Top = 105
          Width = 176
          Height = 79
          Caption = 'Reservas Matemáticas'
          TabOrder = 7
          OnExit = cmpConta6Exit
          MostraMensagens = True
          MostraDescricao = True
          DataSource = ds
          DataField = 'PACRESEMAT'
          Mensagens.EmBranco = 'Conta não pode estar em branco'
          Mensagens.NaoExiste = 'Conta não existe'
          Mensagens.Sintetica = 'Conta não pode ser sintética'
          Mensagens.Analitica = 'Conta não pode ser analítica'
          PermiteChaveInvalida = False
          PermiteChaveEmBranco = True
          AceitaTipoConta = SoAnalitica
          Plano = 0
          Status = scAmbas
        end
        object cmpConta7: TCMProcuraMaskContabil
          Left = 378
          Top = 106
          Width = 176
          Height = 79
          Caption = 'Fundo Cob. Oscilação Riscos'
          TabOrder = 8
          OnExit = cmpConta7Exit
          MostraMensagens = True
          MostraDescricao = True
          DataSource = ds
          DataField = 'PACFDOCOBOSCRISC'
          Mensagens.EmBranco = 'Conta não pode estar em branco'
          Mensagens.NaoExiste = 'Conta não existe'
          Mensagens.Sintetica = 'Conta não pode ser sintética'
          Mensagens.Analitica = 'Conta não pode ser analítica'
          PermiteChaveInvalida = False
          PermiteChaveEmBranco = True
          AceitaTipoConta = SoAnalitica
          Plano = 0
          Status = scAmbas
        end
      end
      object TabSheet1: TTabSheet
        Caption = 'Clientes'
        ImageIndex = 3
        object GroupBox4: TGroupBox
          Left = 10
          Top = 24
          Width = 395
          Height = 118
          Caption = 'Contas Padrão Para o Cadastro de Cliente'
          TabOrder = 0
          object cmpConta15: TCMProcuraMaskContabil
            Left = 12
            Top = 26
            Width = 176
            Height = 79
            Caption = 'Conta Contábil do Cliente'
            TabOrder = 0
            OnExit = cmpConta1Exit
            MostraMensagens = True
            MostraDescricao = True
            DataSource = ds
            DataField = 'CONTACONTABCLI'
            Mensagens.EmBranco = 'Conta não pode estar em branco'
            Mensagens.NaoExiste = 'Conta não existe'
            Mensagens.Sintetica = 'Conta não pode ser sintética'
            Mensagens.Analitica = 'Conta não pode ser analítica'
            PermiteChaveInvalida = False
            PermiteChaveEmBranco = True
            AceitaTipoConta = SoAnalitica
            Plano = 0
            Status = scAmbas
          end
          object cmpConta16: TCMProcuraMaskContabil
            Left = 205
            Top = 26
            Width = 176
            Height = 79
            Caption = 'Conta a Crédito do Cliente'
            TabOrder = 1
            OnExit = cmpConta2Exit
            MostraMensagens = True
            MostraDescricao = True
            DataSource = ds
            DataField = 'CONTACREDCLI'
            Mensagens.EmBranco = 'Conta não pode estar em branco'
            Mensagens.NaoExiste = 'Conta não existe'
            Mensagens.Sintetica = 'Conta não pode ser sintética'
            Mensagens.Analitica = 'Conta não pode ser analítica'
            PermiteChaveInvalida = False
            PermiteChaveEmBranco = True
            AceitaTipoConta = SoAnalitica
            Plano = 0
            Status = scAmbas
          end
        end
        object GroupBox1: TGroupBox
          Left = 9
          Top = 159
          Width = 395
          Height = 122
          Caption = 'Lançamento Contabil '
          TabOrder = 1
          object Label30: TLabel
            Left = 17
            Top = 26
            Width = 168
            Height = 13
            Caption = 'Plano Previdenciário Contabil'
            Color = clBtnFace
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clWindowText
            Font.Height = -11
            Font.Name = 'MS Sans Serif'
            Font.Style = [fsBold]
            ParentColor = False
            ParentFont = False
          end
          object Label31: TLabel
            Left = 17
            Top = 66
            Width = 80
            Height = 13
            Caption = 'Patrocinadora'
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clWindowText
            Font.Height = -11
            Font.Name = 'MS Sans Serif'
            Font.Style = [fsBold]
            ParentFont = False
          end
        end
        object lkPATRO: TCMDBLookupCombo
          Left = 26
          Top = 240
          Width = 361
          Height = 21
          DropDownAlignment = taLeftJustify
          Selected.Strings = (
            'NOMEPATRO'#9'40'#9'Patrocinadora'#9'F')
          DataField = 'IDPATRO'
          DataSource = ds
          LookupTable = cdsPatro
          LookupField = 'IDPATRO'
          Options = [loTitles]
          Style = csDropDownList
          TabOrder = 2
          AutoDropDown = True
          ShowButton = True
          AllowClearKey = True
          ShowMatchText = True
        end
        object lkPlanoprev: TCMDBLookupCombo
          Left = 26
          Top = 200
          Width = 361
          Height = 21
          DropDownAlignment = taLeftJustify
          Selected.Strings = (
            'NOMEPLANO'#9'40'#9'Plano Previdenciário'#9'F')
          DataField = 'IDPLANOPREV'
          DataSource = ds
          LookupTable = cdsPlanoPrev
          LookupField = 'IDPLANOPREV'
          Options = [loTitles]
          Style = csDropDownList
          TabOrder = 3
          AutoDropDown = True
          ShowButton = True
          AllowClearKey = True
          ShowMatchText = True
        end
      end
    end
  end
  inherited Dock972: TDock97
    Width = 762
  end
  inherited Dock971: TDock97
    Top = 435
    Width = 762
    inherited tb97Fundo: TToolbar97
      Left = 367
    end
    inherited TB97oKCancelar: TToolbar97
      Left = 190
    end
  end
  inherited ivTradutor: TIvExtendedTranslator
    Left = 490
    Top = 7
  end
  inherited ds: TwwDataSource
    Left = 310
    Top = 7
  end
  inherited ImlPadrao: TImageList
    Left = 440
    Top = 7
  end
  inherited CmeCadastro: TCmEventosCadastro
    BeforeConfirma = CmeCadastroBeforeConfirma
    ApplyInsert = CmeCadastroApplyInsert
    ApplyEdit = CmeCadastroApplyEdit
    ApplyDelete = CmeCadastroApplyDelete
    OnAbortConfirma = CmeCadastroAbortConfirma
    Left = 264
    Top = 7
  end
  inherited Cds: TCMClientDataSet
    Left = 340
    Top = 7
  end
  inherited MontaSelect: TMontaSelect
    Left = 384
    Top = 7
  end
  object cdsTipoLanc: TCMClientDataSet
    Aggregates = <>
    Params = <>
    Left = 617
  end
  object cdsTipoAtuaMoeda: TCMClientDataSet
    Aggregates = <>
    Params = <>
    Left = 561
    Top = 16
  end
  object cdsMoedaOfi: TCMClientDataSet
    Aggregates = <>
    Params = <>
    Left = 632
    Top = 40
  end
  object cdsMoedaGen1: TCMClientDataSet
    Aggregates = <>
    Params = <>
    Left = 542
    Top = 67
  end
  object cdsMoedaGen2: TCMClientDataSet
    Aggregates = <>
    Params = <>
    Left = 718
    Top = 59
  end
  object cdsMoedaGen3: TCMClientDataSet
    Aggregates = <>
    Params = <>
    Left = 686
    Top = 67
  end
  object cdsTipoOperContas: TCMClientDataSet
    Aggregates = <>
    Params = <>
    Left = 729
    Top = 16
  end
  object cdsTipoOperImp: TCMClientDataSet
    Aggregates = <>
    Params = <>
    Left = 657
    Top = 16
  end
  object cdsHistorico: TCMClientDataSet
    Aggregates = <>
    Params = <>
    Left = 505
    Top = 68
  end
  object cdsPlanoContas: TCMClientDataSet
    Aggregates = <>
    Params = <>
    Left = 585
    Top = 68
  end
  object sqlPla: TCMSqlParams
    SQL.Strings = (
      'SELECT PLNPLANIL FROM PLANILHA'
      'WHERE PLNCODIGO = :PLNCODIGO '
      '   ')
    ClientDataSet = cdsPla
    Left = 503
  end
  object cdsPla: TCMClientDataSet
    Aggregates = <>
    Params = <>
    Left = 536
    Top = 1
  end
  object qryaux: TCMSqlParams
    SQL.Strings = (
      'SELECT PLNPLANIL FROM PLANILHA'
      'WHERE PLNCODIGO = :PLNCODIGO '
      '   ')
    ClientDataSet = cdsaux
    Left = 471
    Top = 32
  end
  object cdsaux: TCMClientDataSet
    Aggregates = <>
    Params = <>
    Left = 377
    Top = 52
  end
  object cdsPlanoPrev: TCMClientDataSet
    Aggregates = <>
    Params = <>
    Left = 445
    Top = 248
  end
  object cdsPatro: TCMClientDataSet
    Aggregates = <>
    Params = <>
    Left = 445
    Top = 304
  end
end
