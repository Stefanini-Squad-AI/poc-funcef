inherited frmCadParam: TfrmCadParam
  Left = 241
  Top = 124
  Caption = 'Parâmetros do Sistema'
  ClientHeight = 403
  ClientWidth = 336
  OnCloseQuery = nil
  PixelsPerInch = 96
  TextHeight = 13
  inherited pnlFundo: TPanel
    Width = 336
    Height = 317
    BorderWidth = 2
    object PageControl1: TPageControl
      Left = 2
      Top = 2
      Width = 332
      Height = 313
      ActivePage = tbshIdentificacao
      Align = alClient
      TabOrder = 0
      object tbshIdentificacao: TTabSheet
        Caption = 'Identificação'
        object gbxPosDoc: TGroupBox
          Left = 16
          Top = 33
          Width = 289
          Height = 97
          Caption = 'Posição do Documento no Crachá'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -9
          Font.Name = 'MS Sans Serif'
          Font.Style = [fsBold]
          ParentFont = False
          TabOrder = 0
          object Label1: TLabel
            Left = 39
            Top = 29
            Width = 40
            Height = 13
            Caption = 'Coluna'
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clWindowText
            Font.Height = -9
            Font.Name = 'MS Sans Serif'
            Font.Style = [fsBold]
            ParentFont = False
          end
          object Label2: TLabel
            Left = 167
            Top = 29
            Width = 53
            Height = 13
            Caption = 'Tamanho'
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clWindowText
            Font.Height = -9
            Font.Name = 'MS Sans Serif'
            Font.Style = [fsBold]
            ParentFont = False
          end
          object dbspedColDoc: TwwDBSpinEdit
            Left = 39
            Top = 45
            Width = 82
            Height = 21
            Increment = 1
            DataField = 'COLDOCUMENTO'
            DataSource = ds
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clWindowText
            Font.Height = -9
            Font.Name = 'MS Sans Serif'
            Font.Style = [fsBold]
            MaxLength = 3
            ParentFont = False
            TabOrder = 0
            UnboundDataType = wwDefault
          end
          object dbspedTamDoc: TwwDBSpinEdit
            Left = 167
            Top = 45
            Width = 82
            Height = 21
            Increment = 1
            DataField = 'TAMDOCUMENTO'
            DataSource = ds
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clWindowText
            Font.Height = -9
            Font.Name = 'MS Sans Serif'
            Font.Style = [fsBold]
            MaxLength = 2
            ParentFont = False
            TabOrder = 1
            UnboundDataType = wwDefault
          end
        end
        object gbxDoc: TGroupBox
          Left = 16
          Top = 154
          Width = 289
          Height = 69
          Caption = 'Documento Identificador'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -9
          Font.Name = 'MS Sans Serif'
          Font.Style = [fsBold]
          ParentFont = False
          ParentShowHint = False
          ShowHint = False
          TabOrder = 1
          object Label13: TLabel
            Left = 21
            Top = 47
            Width = 246
            Height = 13
            Caption = '(Ao deixar em branco, será considerada a matrícula)'
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clWindowText
            Font.Height = -9
            Font.Name = 'MS Sans Serif'
            Font.Style = []
            ParentFont = False
          end
          object dblckDoc: TwwDBLookupCombo
            Left = 21
            Top = 19
            Width = 246
            Height = 21
            DropDownAlignment = taLeftJustify
            Selected.Strings = (
              'NOMEDOCUMENTO'#9'30'#9'NOMEDOCUMENTO'#9'F')
            DataField = 'IDDOCUMENTO'
            DataSource = ds
            LookupTable = CdsTipoDocPessoa
            LookupField = 'IDDOCUMENTO'
            Style = csDropDownList
            ParentShowHint = False
            ShowHint = False
            TabOrder = 0
            AutoDropDown = True
            ShowButton = True
            AllowClearKey = True
          end
        end
      end
      object tbshPonto: TTabSheet
        Caption = 'Ponto Eletrônico'
        ImageIndex = 1
        object gbxNormal: TGroupBox
          Left = 16
          Top = 5
          Width = 289
          Height = 75
          Caption = 'Período Aberto para Lançamento do Ponto'
          TabOrder = 0
          object Label10: TLabel
            Left = 56
            Top = 21
            Width = 34
            Height = 13
            Caption = 'Início'
          end
          object Label11: TLabel
            Left = 56
            Top = 45
            Width = 28
            Height = 13
            Caption = 'Final'
          end
          object dbedNorIni: TCMDateTimePicker
            Left = 119
            Top = 18
            Width = 100
            Height = 21
            CalendarAttributes.Font.Charset = DEFAULT_CHARSET
            CalendarAttributes.Font.Color = clWindowText
            CalendarAttributes.Font.Height = -11
            CalendarAttributes.Font.Name = 'MS Sans Serif'
            CalendarAttributes.Font.Style = []
            ButtonStyle = cbsCustom
            DataField = 'PONTOINI'
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
            TabOrder = 0
          end
          object dbedNorFim: TCMDateTimePicker
            Left = 119
            Top = 45
            Width = 100
            Height = 21
            CalendarAttributes.Font.Charset = DEFAULT_CHARSET
            CalendarAttributes.Font.Color = clWindowText
            CalendarAttributes.Font.Height = -11
            CalendarAttributes.Font.Name = 'MS Sans Serif'
            CalendarAttributes.Font.Style = []
            ButtonStyle = cbsCustom
            DataField = 'PONTOFIM'
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
        object gbxRegIndiv: TGroupBox
          Left = 16
          Top = 148
          Width = 289
          Height = 129
          Caption = 'No Registro Individual de Acesso'
          TabOrder = 2
          object dbcbxFlgFerias: TDBCheckBox
            Left = 16
            Top = 29
            Width = 264
            Height = 17
            Caption = 'A Pessoa Pode Marcar Estando em Férias'
            DataField = 'FLGMARCAFERIAS'
            DataSource = ds
            TabOrder = 0
            ValueChecked = '1'
            ValueUnchecked = '0'
          end
          object dbcbxFlgAfast: TDBCheckBox
            Left = 16
            Top = 69
            Width = 258
            Height = 17
            Caption = 'A Pessoa Pode Marcar Estando Afastada'
            DataField = 'FLGMARCAAFAST'
            DataSource = ds
            TabOrder = 1
            ValueChecked = '1'
            ValueUnchecked = '0'
          end
          object dbcbxFlgAltera: TDBCheckBox
            Left = 16
            Top = 103
            Width = 250
            Height = 17
            Caption = 'A Pessoa Pode Alterar Sua Batida'
            DataField = 'FLGALTERAPONTO'
            DataSource = ds
            TabOrder = 2
            ValueChecked = '1'
            ValueUnchecked = '0'
          end
        end
        object gbxPrazo: TGroupBox
          Left = 16
          Top = 88
          Width = 289
          Height = 48
          Caption = 'Prazo para Fechamento do Ponto (em dias)'
          TabOrder = 1
          object dbspePrazoPonto: TwwDBSpinEdit
            Left = 116
            Top = 18
            Width = 57
            Height = 21
            Increment = 1
            DataField = 'PRAZOPONTO'
            DataSource = ds
            TabOrder = 0
            UnboundDataType = wwDefault
          end
        end
      end
      object tbshBancoHoras: TTabSheet
        Caption = 'Banco de Horas'
        ImageIndex = 2
        object dbrgBancoHoras: TDBRadioGroup
          Left = 16
          Top = 3
          Width = 289
          Height = 42
          Caption = 'Utiliza Banco de Horas ?'
          Columns = 2
          DataField = 'FLGBANCOHORAS'
          DataSource = ds
          Items.Strings = (
            'Sim'
            'Não')
          TabOrder = 0
          Values.Strings = (
            '1'
            '0')
          OnChange = dbrgBancoHorasChange
        end
        object gbxBancoHoras: TGroupBox
          Left = 16
          Top = 49
          Width = 289
          Height = 226
          Caption = 'Parâmetros do Banco de Horas'
          TabOrder = 1
          Visible = False
          object Label3: TLabel
            Left = 23
            Top = 26
            Width = 136
            Height = 13
            Caption = 'Período de acumulação'
          end
          object Label4: TLabel
            Left = 217
            Top = 26
            Width = 44
            Height = 13
            Caption = '(meses)'
          end
          object Label5: TLabel
            Left = 23
            Top = 56
            Width = 134
            Height = 13
            Caption = 'Máximo de horas extras'
          end
          object Label6: TLabel
            Left = 217
            Top = 56
            Width = 48
            Height = 13
            Caption = '(por dia)'
          end
          object Label7: TLabel
            Left = 23
            Top = 113
            Width = 125
            Height = 13
            Caption = 'Fator de Equivalência'
          end
          object Label8: TLabel
            Left = 217
            Top = 114
            Width = 35
            Height = 13
            Caption = '(DSR)'
          end
          object Label9: TLabel
            Left = 23
            Top = 84
            Width = 125
            Height = 13
            Caption = 'Fator de Equivalência'
          end
          object Label12: TLabel
            Left = 217
            Top = 85
            Width = 46
            Height = 13
            Caption = '(normal)'
          end
          object dbredPer: TwwDBSpinEdit
            Left = 163
            Top = 24
            Width = 50
            Height = 21
            Increment = 1
            DataField = 'PERBANCOHORAS'
            DataSource = ds
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clWindowText
            Font.Height = -9
            Font.Name = 'MS Sans Serif'
            Font.Style = [fsBold]
            MaxLength = 3
            ParentFont = False
            TabOrder = 0
            UnboundDataType = wwDefault
          end
          object dbredLim: TwwDBSpinEdit
            Left = 163
            Top = 54
            Width = 50
            Height = 21
            Increment = 1
            DataField = 'LIMBANCOHORAS'
            DataSource = ds
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clWindowText
            Font.Height = -9
            Font.Name = 'MS Sans Serif'
            Font.Style = [fsBold]
            MaxLength = 3
            ParentFont = False
            TabOrder = 1
            UnboundDataType = wwDefault
          end
          object dbredDSR: TDBRealEdit
            Left = 163
            Top = 112
            Width = 50
            Height = 21
            Hint = 
              'Fator de Equivalência das Horas Extras em DSR (Ex: 2,00 = cada h' +
              'ora vale 2 de folga; 0,00 = não pode em DSR)'
            Alignment = taRightJustify
            Lines.Strings = (
              '0,00')
            ParentShowHint = False
            ShowHint = True
            TabOrder = 3
            WordWrap = False
            IntDigits = 2
            DecDigits = 2
            NumberFormat = fNumber
            Signal = False
            DataField = 'DSRBANCOHORAS'
            DataSource = ds
          end
          object dbredNormal: TDBRealEdit
            Left = 163
            Top = 83
            Width = 50
            Height = 21
            Hint = 
              'Fator de Equivalência das Horas Extras em Dia Normal (Ex: 1,50 =' +
              ' cada hora vale 1,5 de folga)'
            Alignment = taRightJustify
            Lines.Strings = (
              '0,00')
            ParentShowHint = False
            ShowHint = True
            TabOrder = 2
            WordWrap = False
            IntDigits = 2
            DecDigits = 2
            NumberFormat = fNumber
            Signal = False
            DataField = 'NORBANCOHORAS'
            DataSource = ds
          end
          object dbrgIndPeriodo: TDBRadioGroup
            Left = 25
            Top = 136
            Width = 240
            Height = 35
            Caption = 'Indicador do Período de Acumulação'
            Columns = 2
            DataField = 'INDPERBCHORAS'
            DataSource = ds
            Items.Strings = (
              'Coletivo'
              'Individual')
            TabOrder = 4
            Values.Strings = (
              '1'
              '2')
            OnChange = dbrgIndPeriodoChange
          end
          object gbxDataBancoHoras: TGroupBox
            Left = 25
            Top = 174
            Width = 240
            Height = 45
            Caption = 'Data Base do Banco de Horas'
            TabOrder = 5
            object CMDateTimePicker1: TCMDateTimePicker
              Left = 70
              Top = 16
              Width = 100
              Height = 21
              CalendarAttributes.Font.Charset = DEFAULT_CHARSET
              CalendarAttributes.Font.Color = clWindowText
              CalendarAttributes.Font.Height = -11
              CalendarAttributes.Font.Name = 'MS Sans Serif'
              CalendarAttributes.Font.Style = []
              ButtonStyle = cbsCustom
              DataField = 'DATBANCOHORAS'
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
              TabOrder = 0
            end
          end
        end
      end
    end
  end
  inherited Dock972: TDock97
    Width = 336
    inherited Toolbar971: TToolbar97
      inherited sbtnInserir: TToolbarButton97
        Enabled = False
        Visible = False
      end
      inherited sbtnProcurar: TToolbarButton97
        Enabled = False
        Visible = False
      end
      inherited sbtnApagar: TToolbarButton97
        Enabled = False
        Visible = False
      end
    end
  end
  inherited Dock971: TDock97
    Top = 364
    Width = 336
    inherited tb97Fundo: TToolbar97
      Left = 169
      DockPos = 437
    end
    inherited TB97oKCancelar: TToolbar97
      Left = 0
      DockPos = 268
    end
  end
  inherited ivTradutor: TIvExtendedTranslator
    Top = 1
    TargetsData = (
      1
      2
      (
        'TDBRealEdit'
        'Text'
        0)
      (
        '*'
        'Filter'
        0))
  end
  inherited ds: TwwDataSource
    AutoEdit = False
    Left = 270
    Top = 1
  end
  inherited ImlPadrao: TImageList
    Left = 129
    Top = 14
  end
  inherited CmeCadastro: TCmEventosCadastro
    ApplyEdit = CmeCadastroApplyEdit
    Left = 194
    Top = 1
  end
  inherited Cds: TCMClientDataSet
    Left = 242
    Top = 1
  end
  inherited MontaSelect: TMontaSelect
    Left = 129
    Top = 1
  end
  object CdsTipoDocPessoa: TCMClientDataSet
    Aggregates = <>
    FieldDefs = <
      item
        Name = 'IDDOCUMENTO'
        DataType = ftFloat
      end
      item
        Name = 'NOMEDOCUMENTO'
        DataType = ftString
        Size = 30
      end
      item
        Name = 'FISICAJURIDICA'
        Attributes = [faFixed]
        DataType = ftString
        Size = 1
      end
      item
        Name = 'MASCARA'
        Attributes = [faFixed]
        DataType = ftString
        Size = 30
      end>
    IndexDefs = <>
    Params = <>
    ProviderName = 'Dsp'
    StoreDefs = True
    Left = 234
    Top = 310
  end
  object CdsParamRHDatas: TCMClientDataSet
    Aggregates = <>
    Params = <>
    Left = 250
    Top = 190
  end
end
