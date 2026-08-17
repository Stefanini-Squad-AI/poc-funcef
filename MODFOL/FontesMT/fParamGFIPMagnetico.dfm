inherited frmParamGFIPMagnetico: TfrmParamGFIPMagnetico
  Left = 132
  Top = 70
  HelpContext = 210086
  BorderIcons = [biSystemMenu, biMinimize]
  BorderStyle = bsToolWindow
  Caption = 'GFIP (Meio Magnético)'
  ClientHeight = 464
  ClientWidth = 562
  Font.Style = []
  FormStyle = fsNormal
  Visible = False
  PixelsPerInch = 96
  TextHeight = 13
  inherited pnlFundo: TPanel
    Width = 562
    Height = 425
    BorderWidth = 2
    object pnlHorario: TPanel
      Left = 5
      Top = 4
      Width = 553
      Height = 21
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
      Left = 4
      Top = 25
      Width = 553
      Height = 396
      ActivePage = tbshDadosPrinc
      HotTrack = True
      TabOrder = 1
      object tbshDadosPrinc: TTabSheet
        Caption = 'Informações &Principais'
        object pgctrlSel: TPageControl
          Left = 6
          Top = 4
          Width = 532
          Height = 104
          ActivePage = tbshEstab
          HotTrack = True
          TabOrder = 0
          object tbshEstab: TTabSheet
            Caption = '&Estabelecimentos'
            object chklstEstab: TColorCheckListBox
              Left = 1
              Top = 1
              Width = 382
              Height = 73
              OnClickCheck = chklstEstabClickCheck
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clWindowText
              Font.Height = -11
              Font.Name = 'MS Sans Serif'
              Font.Style = []
              ItemHeight = 13
              ParentFont = False
              ParentShowHint = False
              ShowHint = False
              Style = lbOwnerDrawFixed
              TabOrder = 0
            end
          end
          object tbshCCusto: TTabSheet
            Caption = '&Centros de Custo'
            ImageIndex = 1
            object chklstCCusto: TColorCheckListBox
              Left = 1
              Top = 1
              Width = 382
              Height = 73
              OnClickCheck = chklstEstabClickCheck
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clWindowText
              Font.Height = -11
              Font.Name = 'MS Sans Serif'
              Font.Style = []
              ItemHeight = 13
              ParentFont = False
              ParentShowHint = False
              ShowHint = False
              Style = lbOwnerDrawFixed
              TabOrder = 0
            end
          end
        end
        object bbtnSelTodos: TBitBtn
          Left = 399
          Top = 30
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
          Left = 399
          Top = 57
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
        object gbxAnoMesRef: TGroupBox
          Left = 6
          Top = 112
          Width = 180
          Height = 65
          Caption = 'Mês e Ano de Referência'
          TabOrder = 3
          object cmbMes: TComboBox
            Left = 11
            Top = 26
            Width = 90
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
          object speAno: TSpinEdit
            Left = 111
            Top = 25
            Width = 56
            Height = 22
            MaxLength = 4
            MaxValue = 3000
            MinValue = 1967
            TabOrder = 1
            Value = 1967
            OnChange = dtVencimentoChange
          end
        end
        object rgGera13: TRadioGroup
          Left = 196
          Top = 112
          Width = 97
          Height = 65
          Caption = '13º Salário?'
          ItemIndex = 1
          Items.Strings = (
            'Sim'
            'Não')
          ParentShowHint = False
          ShowHint = False
          TabOrder = 4
        end
        object gbxDataProcess: TGroupBox
          Left = 303
          Top = 112
          Width = 235
          Height = 65
          Caption = 'Datas para Processamento'
          TabOrder = 5
          object Label1: TLabel
            Left = 23
            Top = 19
            Width = 56
            Height = 13
            Caption = 'Vencimento'
          end
          object Label2: TLabel
            Left = 25
            Top = 41
            Width = 54
            Height = 13
            Caption = 'Pagamento'
          end
          object dtVencimento: TCMDateTimePicker
            Left = 97
            Top = 15
            Width = 113
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
            ParentShowHint = False
            ShowHint = True
            ShowButton = True
            TabOrder = 0
            OnChange = dtVencimentoChange
          end
          object dtPagamento: TCMDateTimePicker
            Left = 97
            Top = 37
            Width = 113
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
            ParentShowHint = False
            ShowHint = False
            ShowButton = True
            TabOrder = 1
            OnChange = dtVencimentoChange
          end
        end
        object gbxResponsavel: TGroupBox
          Left = 6
          Top = 179
          Width = 287
          Height = 43
          Caption = 'Responsável pela informação'
          TabOrder = 6
          object dblkcbResponsavel: TwwDBLookupCombo
            Left = 9
            Top = 14
            Width = 269
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
            UseTFields = False
            AllowClearKey = True
            OnChange = dtVencimentoChange
          end
        end
        object rgGeraReg14: TRadioGroup
          Left = 303
          Top = 179
          Width = 235
          Height = 43
          Caption = 'Gerar Registro de Alterações de Endereço?'
          Columns = 2
          ItemIndex = 1
          Items.Strings = (
            'Sim'
            'Não')
          TabOrder = 7
        end
        object rgTipoInscricaoResp: TRadioGroup
          Left = 6
          Top = 225
          Width = 287
          Height = 43
          Caption = 'Utilizar como Documento Identificador'
          Columns = 2
          ItemIndex = 0
          Items.Strings = (
            'CPF do Responsável'
            'CNPJ da Empresa')
          TabOrder = 8
        end
        object rgTipoBusca: TRadioGroup
          Left = 303
          Top = 225
          Width = 235
          Height = 43
          Caption = 'Buscar pessoas com base na Situação:'
          Columns = 2
          ItemIndex = 0
          Items.Strings = (
            'Atual'
            'da Época')
          TabOrder = 9
        end
        object gbxCodRec: TGroupBox
          Left = 6
          Top = 270
          Width = 141
          Height = 45
          Caption = 'Código de Recolhimento'
          TabOrder = 10
          object speCodRec: TSpinEdit
            Left = 31
            Top = 15
            Width = 79
            Height = 22
            MaxLength = 4
            MaxValue = 0
            MinValue = 0
            ParentShowHint = False
            ShowHint = False
            TabOrder = 0
            Value = 115
            OnChange = dtVencimentoChange
            OnExit = speCodRecExit
          end
        end
        object gbxCodEmprCAIXA: TGroupBox
          Left = 157
          Top = 270
          Width = 136
          Height = 45
          Caption = 'Código Empresa CAIXA'
          TabOrder = 11
          object mkedCodEmpreCAIXA: TMaskEdit
            Left = 19
            Top = 16
            Width = 97
            Height = 21
            EditMask = '99999999999999;1;_'
            MaxLength = 14
            TabOrder = 0
            Text = '              '
          end
        end
        object gbxDiaLimiteGRFC: TGroupBox
          Left = 6
          Top = 318
          Width = 287
          Height = 44
          Caption = 'Dia Limite Próx. Mês Recolhido por GRFC'
          TabOrder = 12
          object spedDiaLimiteGRFC: TSpinEdit
            Left = 104
            Top = 15
            Width = 79
            Height = 22
            MaxLength = 4
            MaxValue = 31
            MinValue = 0
            ParentShowHint = False
            ShowHint = False
            TabOrder = 0
            Value = 0
            OnChange = dtVencimentoChange
          end
        end
        object rgSimples: TRadioGroup
          Left = 303
          Top = 270
          Width = 235
          Height = 92
          Caption = 'Simples'
          ItemIndex = 0
          Items.Strings = (
            'Não Optante'
            'Optante - até valor limite'
            'Optante - acima valor limite'
            'Não Optante - Produtor Rural')
          TabOrder = 13
        end
      end
      object tbshRubricas: TTabSheet
        Caption = 'Seleção de &Rubricas'
        ImageIndex = 1
        object pgctrlRubricas: TPageControl
          Left = 0
          Top = 0
          Width = 545
          Height = 368
          ActivePage = tbshSelRub7
          Align = alClient
          HotTrack = True
          MultiLine = True
          Style = tsFlatButtons
          TabOrder = 0
          OnChange = pgctrlRubricasChange
          object tbshSelRub0: TTabSheet
            Caption = 'Valor do Salário Família'
            object chklstRubrica0: TColorCheckListBox
              Left = 6
              Top = 0
              Width = 525
              Height = 246
              OnClickCheck = chklstRubrica0ClickCheck
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clWindowText
              Font.Height = -11
              Font.Name = 'MS Sans Serif'
              Font.Style = []
              ItemHeight = 13
              ParentFont = False
              ParentShowHint = False
              ShowHint = False
              Style = lbOwnerDrawFixed
              TabOrder = 0
            end
          end
          object tbshSelRub1: TTabSheet
            Caption = 'Valor do Salário Maternidade'
            ImageIndex = 1
            object chklstRubrica1: TColorCheckListBox
              Left = 6
              Top = 0
              Width = 525
              Height = 246
              OnClickCheck = chklstRubrica0ClickCheck
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clWindowText
              Font.Height = -11
              Font.Name = 'MS Sans Serif'
              Font.Style = []
              ItemHeight = 13
              ParentFont = False
              ParentShowHint = False
              ShowHint = False
              Style = lbOwnerDrawFixed
              TabOrder = 0
            end
          end
          object tbshSelRub2: TTabSheet
            Caption = 'Valor do INSS do 13º'
            ImageIndex = 2
            object chklstRubrica2: TColorCheckListBox
              Left = 6
              Top = 0
              Width = 525
              Height = 246
              OnClickCheck = chklstRubrica0ClickCheck
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clWindowText
              Font.Height = -11
              Font.Name = 'MS Sans Serif'
              Font.Style = []
              ItemHeight = 13
              ParentFont = False
              ParentShowHint = False
              ShowHint = False
              Style = lbOwnerDrawFixed
              TabOrder = 0
            end
          end
          object tbshSelRub3: TTabSheet
            Caption = 'Base do Salário SEM 13º Salário'
            ImageIndex = 3
            object chklstRubrica3: TColorCheckListBox
              Left = 6
              Top = 0
              Width = 525
              Height = 246
              OnClickCheck = chklstRubrica0ClickCheck
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clWindowText
              Font.Height = -11
              Font.Name = 'MS Sans Serif'
              Font.Style = []
              ItemHeight = 13
              ParentFont = False
              ParentShowHint = False
              ShowHint = False
              Style = lbOwnerDrawFixed
              TabOrder = 0
            end
          end
          object tbshSelRub4: TTabSheet
            Caption = 'Base do 13º Salário'
            ImageIndex = 4
            object chklstRubrica4: TColorCheckListBox
              Left = 6
              Top = 0
              Width = 525
              Height = 246
              OnClickCheck = chklstRubrica0ClickCheck
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clWindowText
              Font.Height = -11
              Font.Name = 'MS Sans Serif'
              Font.Style = []
              ItemHeight = 13
              ParentFont = False
              ParentShowHint = False
              ShowHint = False
              Style = lbOwnerDrawFixed
              TabOrder = 0
            end
          end
          object tbshSelRub5: TTabSheet
            Caption = 'Valor Retido Segurado'
            ImageIndex = 5
            object chklstRubrica5: TColorCheckListBox
              Left = 6
              Top = 0
              Width = 525
              Height = 246
              OnClickCheck = chklstRubrica0ClickCheck
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clWindowText
              Font.Height = -11
              Font.Name = 'MS Sans Serif'
              Font.Style = []
              ItemHeight = 13
              ParentFont = False
              ParentShowHint = False
              ShowHint = False
              Style = lbOwnerDrawFixed
              TabOrder = 0
            end
          end
          object tbshSelRub6: TTabSheet
            Caption = 'Base INSS Especial'
            ImageIndex = 6
            object chklstRubrica6: TColorCheckListBox
              Left = 6
              Top = 0
              Width = 525
              Height = 246
              OnClickCheck = chklstRubrica0ClickCheck
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clWindowText
              Font.Height = -11
              Font.Name = 'MS Sans Serif'
              Font.Style = []
              ItemHeight = 13
              ParentFont = False
              ParentShowHint = False
              ShowHint = False
              Style = lbOwnerDrawFixed
              TabOrder = 0
            end
          end
          object tbshSelRub7: TTabSheet
            Caption = 'Base INSS do 13º Salário (Movimento)'
            ImageIndex = 7
            object chklstRubrica7: TColorCheckListBox
              Left = 6
              Top = 0
              Width = 525
              Height = 246
              OnClickCheck = chklstRubrica0ClickCheck
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clWindowText
              Font.Height = -11
              Font.Name = 'MS Sans Serif'
              Font.Style = []
              ItemHeight = 13
              ParentFont = False
              ParentShowHint = False
              ShowHint = False
              Style = lbOwnerDrawFixed
              TabOrder = 0
            end
          end
          object tbshSelRub8: TTabSheet
            Caption = 'Base INSS do 13º Salário'
            ImageIndex = 8
            object chklstRubrica8: TColorCheckListBox
              Left = 6
              Top = 0
              Width = 525
              Height = 246
              OnClickCheck = chklstRubrica0ClickCheck
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clWindowText
              Font.Height = -11
              Font.Name = 'MS Sans Serif'
              Font.Style = []
              ItemHeight = 13
              ParentFont = False
              ParentShowHint = False
              ShowHint = False
              Style = lbOwnerDrawFixed
              TabOrder = 0
            end
          end
        end
        object sbtnMarcarRub: TBitBtn
          Left = 390
          Top = 332
          Width = 104
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
          TabOrder = 2
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
        object StaticText1: TStaticText
          Left = 10
          Top = 321
          Width = 163
          Height = 17
          Caption = 'Procura por Rubricas pelo Código'
          TabOrder = 3
        end
        object edCodRubricas: TEdit
          Left = 10
          Top = 336
          Width = 375
          Height = 21
          Hint = 
            'Digite aqui o código das Rubricas a procurar separados por vírgu' +
            'la'
          ParentShowHint = False
          ShowHint = True
          TabOrder = 1
        end
        object bbtnDicaSelRubricas: TBitBtn
          Left = 500
          Top = 332
          Width = 35
          Height = 28
          Hint = 'Mostra dicas para a seleção das Rubricas'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clNavy
          Font.Height = -12
          Font.Name = 'MS Sans Serif'
          Font.Style = []
          ParentFont = False
          ParentShowHint = False
          ShowHint = True
          TabOrder = 4
          TabStop = False
          OnClick = bbtnDicaSelRubricasClick
          Glyph.Data = {
            76010000424D7601000000000000760000002800000020000000100000000100
            04000000000000010000120B0000120B00001000000000000000000000000000
            800000800000008080008000000080008000808000007F7F7F00BFBFBF000000
            FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00333333303333
            333333333337FF3333333333330003333333333333777F333333333333080333
            3333333F33777FF33F3333B33B000B33B3333373F777773F7333333BBB0B0BBB
            33333337737F7F77F333333BBB0F0BBB33333337337373F73F3333BBB0F7F0BB
            B333337F3737F73F7F3333BB0FB7BF0BB3333F737F37F37F73FFBBBB0BF7FB0B
            BBB3773F7F37337F377333BB0FBFBF0BB333337F73F333737F3333BBB0FBF0BB
            B3333373F73FF7337333333BBB000BBB33333337FF777337F333333BBBBBBBBB
            3333333773FF3F773F3333B33BBBBB33B33333733773773373333333333B3333
            333333333337F33333333333333B333333333333333733333333}
          NumGlyphs = 2
          Spacing = 0
        end
      end
    end
  end
  inherited Dock971: TDock97
    Top = 425
    Width = 562
    inherited tb97Fundo: TToolbar97
      Left = 257
      DockPos = 260
      inherited sep1: TToolbarSep97
        Left = 219
      end
      object ToolbarSep972: TToolbarSep97 [1]
        Left = 109
        Top = 0
        Blank = True
        SizeHorz = 30
      end
      inherited bbtnSair: TBitBtn
        Left = 139
        TabOrder = 1
      end
      inherited bbtnAjuda: TmaHelpBitBtn
        Left = 221
        TabOrder = 2
      end
      object rbtnGerar: TBitBtn
        Left = 0
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
    end
  end
  object pnlProgresso: TPanel [2]
    Left = 34
    Top = 449
    Width = 497
    Height = 105
    BevelInner = bvRaised
    BevelOuter = bvNone
    BevelWidth = 2
    TabOrder = 2
    Visible = False
    object fclblTitulo: TfcLabel
      Left = 10
      Top = 5
      Width = 477
      Height = 26
      AutoSize = False
      Caption = 'Gerando SEFIP.RE ...'
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
      Left = 10
      Top = 34
      Width = 477
      Height = 6
      Shape = bsTopLine
      Style = bsRaised
    end
    object lblProcesso: TLabel
      Left = 10
      Top = 37
      Width = 477
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
      Left = 12
      Top = 56
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
      Left = 12
      Top = 74
      Width = 476
      Height = 19
    end
    object gagTotal: TGauge
      Left = 13
      Top = 75
      Width = 473
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
      Left = 267
      Top = 56
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
      Left = 400
      Top = 56
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
  object townDica: TToolWindow97 [3]
    Left = 530
    Top = 88
    Caption = 'Dica'
    CloseButton = False
    ClientAreaHeight = 155
    ClientAreaWidth = 424
    Resizable = False
    TabOrder = 3
    Visible = False
    object Label3: TLabel
      Left = 7
      Top = 97
      Width = 404
      Height = 13
      Caption = 
        'Se nenhuma Rubrica for indicada, o Sistema irá considerar as Rub' +
        'ricas que estiverem'
    end
    object Label4: TLabel
      Left = 7
      Top = 115
      Width = 265
      Height = 13
      Caption = 'parametrizadas com uma da(s) Rubrica(s) CLT(s) abaixo:'
    end
    object lblRubCLT: TLabel
      Left = 18
      Top = 135
      Width = 279
      Height = 13
      AutoSize = False
      Caption = 'lblRubCLT'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -9
      Font.Name = 'MS Sans Serif'
      Font.Style = [fsBold]
      ParentFont = False
    end
    object btnFecharDica: TBitBtn
      Left = 321
      Top = 122
      Width = 99
      Height = 30
      Caption = ' &Fechar'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -9
      Font.Name = 'MS Sans Serif'
      Font.Style = [fsBold]
      ParentFont = False
      TabOrder = 0
      OnClick = btnFecharDicaClick
      Glyph.Data = {
        F6000000424DF600000000000000760000002800000010000000100000000100
        0400000000008000000000000000000000001000000000000000000000000000
        80000080000000808000800000008000800080800000C0C0C000808080000000
        FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00777777000007
        7777777700919190077777789919191910777789919191919107778918F919F8
        190778919FFF9FFF9190789919FFFFF919107891919FFF919190789919FFFFF9
        191078919FFF9FFF9190778918F919F819077789919191919107777899191919
        1077777788999998877777777788888777777777777777777777}
      Spacing = 2
    end
    object MemoDica: TMemo
      Left = 0
      Top = 0
      Width = 424
      Height = 93
      Align = alTop
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -9
      Font.Name = 'MS Sans Serif'
      Font.Style = [fsBold]
      Lines.Strings = (
        ''
        ''
        ' ')
      ParentFont = False
      ReadOnly = True
      ScrollBars = ssVertical
      TabOrder = 1
    end
  end
  inherited ivTradutor: TIvExtendedTranslator
    Left = 162
    Top = 405
    TargetsData = (
      1
      1
      (
        'TMemo'
        'Text'
        0))
  end
  object svdlgDialogo: TOpenDialog
    DefaultExt = '*.RE'
    FileName = 'C:\SEFIP\SEFIP.RE'
    Filter = 'SEFIP.RE|SEFIP.RE|Todos|*.*'
    InitialDir = 'C:\SEFIP'
    Options = [ofHideReadOnly, ofPathMustExist, ofNoNetworkButton]
    Title = 'Escolha a Pasta para a Geração do GFIP Magnético'
    Left = 97
    Top = 405
  end
  object CdsNomeResp: TCMClientDataSet
    Aggregates = <>
    Params = <>
    Left = 27
    Top = 405
  end
end
