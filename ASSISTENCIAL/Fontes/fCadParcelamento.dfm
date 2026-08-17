inherited frmCadParcelamento: TfrmCadParcelamento
  Left = 78
  Top = 43
  Caption = 'Dados de Parcelamento'
  ClientHeight = 472
  ClientWidth = 637
  PixelsPerInch = 96
  TextHeight = 13
  inherited pnlFundo: TPanel
    Width = 637
    Height = 386
    inherited tbcDetalhe: TTabControlDetalhe [0]
      Top = 161
      Width = 627
      Height = 220
      Tabs.Strings = (
        'Alteradores'
        'Contribuições'
        'Parcelas'
        'Outras Informações')
      detdbGrids.Strings = (
        'dbgrdDet'
        ''
        ''
        ''
        '')
      inherited pgctrlDetalhe: TPageControl
        Width = 534
        Height = 161
        ActivePage = tabOutras
        inherited tbsDet: TTabSheet
          Caption = 'Alteradores'
          inherited dbgrdDet: TwwDBGrid [0]
            Width = 526
            Height = 133
            Selected.Strings = (
              'DESCRICAO'#9'30'#9'Alterador'
              'NOMEREGRA'#9'30'#9'Regra')
            ParentFont = False
          end
          inherited pnlControlesDet: TPanel [1]
            Width = 526
            Height = 133
            object Label8: TLabel
              Left = 16
              Top = 12
              Width = 60
              Height = 13
              Caption = 'Alterador :'
            end
            object Label9: TLabel
              Left = 16
              Top = 48
              Width = 43
              Height = 13
              Caption = 'Regra :'
            end
            object dbcbAlterador: TwwDBLookupCombo
              Left = 81
              Top = 8
              Width = 251
              Height = 21
              DropDownAlignment = taLeftJustify
              Selected.Strings = (
                'DESCRICAO'#9'35'#9'Alterador')
              DataField = 'CODALTERADOR'
              DataSource = dsDet
              LookupTable = qryAlterador
              LookupField = 'CODALTERADOR'
              TabOrder = 0
              AutoDropDown = True
              ShowButton = True
              AllowClearKey = False
              ShowMatchText = True
            end
            object dbcbIdRegra2: TwwDBLookupCombo
              Left = 81
              Top = 44
              Width = 251
              Height = 21
              DropDownAlignment = taLeftJustify
              Selected.Strings = (
                'NOMEREGRA'#9'60'#9'Regra')
              DataField = 'IDREGRA'
              DataSource = dsDet
              LookupTable = qryRegra2
              LookupField = 'IDREGRA'
              TabOrder = 1
              AutoDropDown = True
              ShowButton = True
              AllowClearKey = False
              ShowMatchText = True
            end
          end
        end
        object tabContribuicoes: TTabSheet
          Caption = 'Contribuições'
          object dbgrdContrib: TwwDBGrid
            Left = 0
            Top = 0
            Width = 526
            Height = 133
            Hint = 'Duplo-click para marcar/desmarcar como parcela.'
            Selected.Strings = (
              'FLGCONTRIBUICAO'#9'10'#9'Parcela?'
              'MOTIVO'#9'30'#9'Motivo'
              'DEPENDENTE'#9'40'#9'Dependente'
              'CONTRIBUICAO'#9'30'#9'Contribuição'
              'VALORESPERADO'#9'10'#9'Valor'
              'DATAPREVISAO'#9'10'#9'Vencimento')
            IniAttributes.Delimiter = ';;'
            TitleColor = clBtnFace
            FixedCols = 0
            ShowHorzScrollBar = True
            Align = alClient
            DataSource = dsContrib
            Enabled = False
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clWindowText
            Font.Height = -9
            Font.Name = 'MS Sans Serif'
            Font.Style = [fsBold]
            Options = [dgEditing, dgTitles, dgIndicator, dgColumnResize, dgColLines, dgRowLines, dgTabs, dgRowSelect, dgConfirmDelete, dgCancelOnExit, dgWordWrap]
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
            OnDblClick = dbgrdContribDblClick
            IndicatorColor = icBlack
          end
        end
        object tabParcelas: TTabSheet
          Caption = 'Parcelas'
          object dbgrdParcelas: TwwDBGrid
            Left = 0
            Top = 0
            Width = 526
            Height = 133
            Selected.Strings = (
              'ORDEM'#9'5'#9'Ordem'
              'MES'#9'7'#9'Mês Referência'
              'MESCOBRANCA'#9'7'#9'Mês Cobrança'
              'VALORESPERADO'#9'10'#9'Valor'
              'DATAPREVISAO'#9'10'#9'Vencimento'
              'MOTIVO'#9'20'#9'Motivo'
              'CONTRIBUICAO'#9'30'#9'Contribuição')
            IniAttributes.Delimiter = ';;'
            TitleColor = clBtnFace
            FixedCols = 0
            ShowHorzScrollBar = True
            Align = alClient
            DataSource = dsParcelas
            Enabled = False
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clWindowText
            Font.Height = -9
            Font.Name = 'MS Sans Serif'
            Font.Style = [fsBold]
            Options = [dgTitles, dgIndicator, dgColumnResize, dgColLines, dgRowLines, dgTabs, dgConfirmDelete, dgCancelOnExit, dgWordWrap]
            ParentFont = False
            ReadOnly = True
            TabOrder = 0
            TitleAlignment = taLeftJustify
            TitleFont.Charset = DEFAULT_CHARSET
            TitleFont.Color = clWindowText
            TitleFont.Height = -9
            TitleFont.Name = 'MS Sans Serif'
            TitleFont.Style = [fsBold]
            TitleLines = 1
            TitleButtons = False
            IndicatorColor = icBlack
          end
        end
        object tabOutras: TTabSheet
          Caption = 'Outras Informações'
          object Label21: TLabel
            Left = 12
            Top = 44
            Width = 117
            Height = 13
            Caption = 'Local de Pagamento'
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clBlack
            Font.Height = -11
            Font.Name = 'MS Sans Serif'
            Font.Style = [fsBold]
            ParentFont = False
          end
          object GroupBox5: TGroupBox
            Left = 270
            Top = 8
            Width = 111
            Height = 57
            Caption = 'Data Prevista (*)'
            Enabled = False
            TabOrder = 2
            object Label10: TLabel
              Left = 8
              Top = 40
              Width = 87
              Height = 13
              Caption = '(*) primeira parcela'
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clBlack
              Font.Height = -11
              Font.Name = 'MS Sans Serif'
              Font.Style = []
              ParentFont = False
            end
            object dtPrevisao: TCMDateTimePicker
              Left = 6
              Top = 16
              Width = 99
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
          object rgFlgCobCarne: TRadioGroup
            Left = 10
            Top = 7
            Width = 245
            Height = 33
            Caption = 'Forma de Pagamento'
            Columns = 2
            Enabled = False
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clBlack
            Font.Height = -11
            Font.Name = 'MS Sans Serif'
            Font.Style = [fsBold]
            ItemIndex = 0
            Items.Strings = (
              'Folha'
              'Outros')
            ParentFont = False
            TabOrder = 0
            TabStop = True
            OnClick = rgFlgCobCarneClick
          end
          object cmbFormaPag: TwwDBLookupCombo
            Left = 10
            Top = 60
            Width = 247
            Height = 21
            DropDownAlignment = taLeftJustify
            Selected.Strings = (
              'DESCRICAO'#9'40'#9'Descrição')
            LookupTable = qryPortForm
            LookupField = 'CODPORTFORMA'
            Enabled = False
            TabOrder = 1
            AutoDropDown = True
            ShowButton = True
            AllowClearKey = False
            ShowMatchText = True
          end
          object GroupBox3: TGroupBox
            Left = 392
            Top = 8
            Width = 125
            Height = 57
            Caption = 'Dívida'
            TabOrder = 3
            object lbDivida: TLabel
              Left = 8
              Top = 20
              Width = 109
              Height = 13
              Alignment = taRightJustify
              AutoSize = False
            end
          end
        end
      end
      inherited Dock973: TDock97
        Width = 619
      end
      inherited Dock974: TDock97
        Left = 538
        Height = 161
        inherited tb97Detalhe: TToolbar97
          inherited bbtnOkDet: TBitBtn
            Margin = 3
          end
          inherited bbtnCancelarDet: TBitBtn
            Margin = 2
          end
          inherited bbtnVoltarDet: TBitBtn
            Margin = 3
          end
        end
      end
    end
    inherited pnlMestre: TPanel [1]
      Width = 627
      Height = 156
      object GroupBox1: TGroupBox
        Left = 16
        Top = 0
        Width = 513
        Height = 81
        Caption = 'Participante'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -9
        Font.Name = 'MS Sans Serif'
        Font.Style = [fsBold]
        ParentFont = False
        TabOrder = 0
        object Label1: TLabel
          Left = 16
          Top = 12
          Width = 33
          Height = 13
          Caption = 'Nome'
        end
        object Label2: TLabel
          Left = 16
          Top = 44
          Width = 80
          Height = 13
          Caption = 'Patrocinadora'
        end
        object Label3: TLabel
          Left = 264
          Top = 12
          Width = 118
          Height = 13
          Caption = 'Plano Previdenciário'
        end
        object Label4: TLabel
          Left = 264
          Top = 44
          Width = 104
          Height = 13
          Caption = 'Plano Assistencial'
        end
        object dbedPartAss: TwwDBEdit
          Left = 24
          Top = 24
          Width = 217
          Height = 19
          BorderStyle = bsNone
          Color = clBtnFace
          Ctl3D = False
          DataField = 'PARTASS'
          DataSource = ds
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -9
          Font.Name = 'MS Sans Serif'
          Font.Style = []
          ParentCtl3D = False
          ParentFont = False
          TabOrder = 0
          UnboundDataType = wwDefault
          WantReturns = False
          WordWrap = False
        end
        object dbedPatro: TwwDBEdit
          Left = 24
          Top = 56
          Width = 217
          Height = 19
          BorderStyle = bsNone
          Color = clBtnFace
          Ctl3D = False
          DataField = 'PESSJUR'
          DataSource = ds
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -9
          Font.Name = 'MS Sans Serif'
          Font.Style = []
          ParentCtl3D = False
          ParentFont = False
          TabOrder = 1
          UnboundDataType = wwDefault
          WantReturns = False
          WordWrap = False
        end
        object dbedPlanPrev: TwwDBEdit
          Left = 272
          Top = 24
          Width = 217
          Height = 19
          BorderStyle = bsNone
          Color = clBtnFace
          Ctl3D = False
          DataField = 'PLANPREV'
          DataSource = ds
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -9
          Font.Name = 'MS Sans Serif'
          Font.Style = []
          ParentCtl3D = False
          ParentFont = False
          TabOrder = 2
          UnboundDataType = wwDefault
          WantReturns = False
          WordWrap = False
        end
        object dbedPlanAss: TwwDBEdit
          Left = 272
          Top = 56
          Width = 217
          Height = 19
          BorderStyle = bsNone
          Color = clBtnFace
          Ctl3D = False
          DataField = 'PLANASS'
          DataSource = ds
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -9
          Font.Name = 'MS Sans Serif'
          Font.Style = []
          ParentCtl3D = False
          ParentFont = False
          TabOrder = 3
          UnboundDataType = wwDefault
          WantReturns = False
          WordWrap = False
        end
      end
      object GroupBox2: TGroupBox
        Left = 16
        Top = 84
        Width = 513
        Height = 69
        Caption = 'Condições de Parcelamento'
        TabOrder = 1
        object Label5: TLabel
          Left = 16
          Top = 16
          Width = 41
          Height = 13
          Caption = 'Plano :'
        end
        object spdApagaPlano: TSpeedButton
          Left = 286
          Top = 12
          Width = 31
          Height = 25
          Hint = 'Apaga plano selecionado'
          AllowAllUp = True
          GroupIndex = 1
          Enabled = False
          Glyph.Data = {
            76010000424D7601000000000000760000002800000020000000100000000100
            0400000000000001000000000000000000001000000010000000000000000000
            800000800000008080008000000080008000808000007F7F7F00BFBFBF000000
            FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00500005000555
            555557777F777555F55500000000555055557777777755F75555005500055055
            555577F5777F57555555005550055555555577FF577F5FF55555500550050055
            5555577FF77577FF555555005050110555555577F757777FF555555505099910
            555555FF75777777FF555005550999910555577F5F77777775F5500505509990
            3055577F75F77777575F55005055090B030555775755777575755555555550B0
            B03055555F555757575755550555550B0B335555755555757555555555555550
            BBB35555F55555575F555550555555550BBB55575555555575F5555555555555
            50BB555555555555575F555555555555550B5555555555555575}
          Layout = blGlyphTop
          NumGlyphs = 2
          ParentShowHint = False
          ShowHint = True
          Spacing = 0
          OnClick = spdApagaPlanoClick
        end
        object Label6: TLabel
          Left = 16
          Top = 44
          Width = 43
          Height = 13
          Caption = 'Regra :'
        end
        object Label7: TLabel
          Left = 336
          Top = 44
          Width = 58
          Height = 13
          Caption = 'Parcelas :'
        end
        object dbcbIdRegra: TwwDBLookupCombo
          Left = 65
          Top = 40
          Width = 251
          Height = 21
          DropDownAlignment = taLeftJustify
          Selected.Strings = (
            'NOMEREGRA'#9'40'#9'NOMEREGRA')
          DataField = 'IDREGRAPRINCIPAL'
          DataSource = ds
          LookupTable = qryRegra
          LookupField = 'IDREGRA'
          TabOrder = 0
          AutoDropDown = True
          ShowButton = True
          AllowClearKey = False
          ShowMatchText = True
        end
        object spNumParcelas: TwwDBSpinEdit
          Left = 404
          Top = 40
          Width = 49
          Height = 21
          EditorEnabled = False
          Increment = 1
          MaxValue = 99
          MinValue = 2
          Value = 2
          DataField = 'NUMPARCELAS'
          DataSource = ds
          TabOrder = 1
          UnboundDataType = wwDefault
        end
        object dbchkFlgRecalcular: TDBCheckBox
          Left = 336
          Top = 16
          Width = 173
          Height = 17
          Caption = 'Recalcular na cobrança?'
          DataField = 'FLGRECALCULAR'
          DataSource = ds
          TabOrder = 2
          ValueChecked = '1'
          ValueUnchecked = '0'
        end
        object dblcPlano: TwwDBLookupCombo
          Left = 65
          Top = 16
          Width = 216
          Height = 21
          DropDownAlignment = taLeftJustify
          Selected.Strings = (
            'DESCRICAO'#9'30'#9'Descrição'
            'NUMPARCELAS'#9'5'#9'Parcelas')
          DataField = 'IDPARCASSTIPOS'
          DataSource = ds
          LookupTable = qryPlano
          LookupField = 'IDPARCASSTIPOS'
          TabOrder = 3
          AutoDropDown = True
          ShowButton = True
          AllowClearKey = False
          ShowMatchText = True
          OnChange = dblcPlanoChange
        end
      end
      object btnProcurar: TBitBtn
        Left = 536
        Top = 21
        Width = 86
        Height = 37
        Hint = 'Procurar participante'
        Caption = '&Procurar'
        Enabled = False
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'MS Sans Serif'
        Font.Style = [fsBold]
        ParentFont = False
        ParentShowHint = False
        ShowHint = True
        TabOrder = 2
        OnClick = btnProcurarClick
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
        Margin = 3
      end
      object btnCalcularParcelas: TBitBtn
        Left = 536
        Top = 117
        Width = 86
        Height = 37
        Hint = 'Calcular valores das parcelas'
        Caption = '&Parcelas'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'MS Sans Serif'
        Font.Style = [fsBold]
        ParentFont = False
        ParentShowHint = False
        ShowHint = True
        TabOrder = 3
        OnClick = btnCalcularParcelasClick
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
        Margin = 3
        NumGlyphs = 2
      end
      object btnCalcularDivida: TBitBtn
        Left = 536
        Top = 79
        Width = 86
        Height = 37
        Hint = 'Calcular valor da dívida atualizada'
        Caption = '&Dívida'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'MS Sans Serif'
        Font.Style = [fsBold]
        ParentFont = False
        ParentShowHint = False
        ShowHint = True
        TabOrder = 4
        OnClick = btnCalcularDividaClick
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
        Margin = 3
        NumGlyphs = 2
      end
    end
  end
  inherited Dock972: TDock97
    Width = 637
  end
  inherited Dock971: TDock97
    Top = 433
    Width = 637
    inherited tb97Fundo: TToolbar97
      Left = 467
      DockPos = 467
    end
    inherited TB97oKCancelar: TToolbar97
      Left = 299
      DockPos = 299
      inherited ToolbarSep971: TToolbarSep97
        Left = 76
      end
      inherited bbtnConfirmar: TBitBtn
        Width = 76
      end
      inherited bbtnCancelar: TBitBtn
        Left = 79
      end
    end
  end
  inherited qry: TwwQuery
    SQL.Strings = (
      'select'
      
        ' p.nome partass, pj.nome pessjur, pp.nome planprev, pn.nome plan' +
        'ass,'
      'pc.*'
      'from'
      
        ' parcass pc, partass pa, pessoa p, pessoa pj, planprev pp, plana' +
        'ss pn'
      'where'
      ' (pc.idparcass = :idparcass) and'
      ' (pc.idpessoa = pa.idpessoa) and'
      ' (pc.idpessjur = pa.idpessjur) and'
      ' (pc.idplanoprev = pa.idplanoprev) and'
      ' (pc.idplanass = pa.idplanass) and'
      ' (pc.idpessoa = p.idpessoa) and'
      ' (pc.idpessjur = pj.idpessoa) and'
      ' (pc.idplanoprev = pp.idplanoprev) and'
      ' (pc.idplanass = pn.idplanass)')
    Left = 275
    ParamData = <
      item
        DataType = ftInteger
        Name = 'idparcass'
        ParamType = ptUnknown
      end>
  end
  inherited dsDet: TwwDataSource
    DataSet = qryDet
    Left = 299
    Top = 243
  end
  inherited ivTradutor: TIvExtendedTranslator
    Left = 603
    Top = 7
    TargetsData = (
      1
      1
      (
        ''
        'Text'
        0))
  end
  inherited upd: TUpdateSQL
    ModifySQL.Strings = (
      'update PARCASS'
      'set'
      '  IDPARCASS = :IDPARCASS,'
      '  IDREGRAPRINCIPAL = :IDREGRAPRINCIPAL,'
      '  IDPESSJUR = :IDPESSJUR,'
      '  SEQPROPOSTA = :SEQPROPOSTA,'
      '  IDPLANOPREV = :IDPLANOPREV,'
      '  IDPLANASS = :IDPLANASS,'
      '  IDPESSOA = :IDPESSOA,'
      '  IDPARCASSTIPOS = :IDPARCASSTIPOS,'
      '  NUMPARCELAS = :NUMPARCELAS,'
      '  TOTALCONTRIB = :TOTALCONTRIB,'
      '  TOTALALTERADORES = :TOTALALTERADORES,'
      '  FLGPAROK = :FLGPAROK,'
      '  FLGRECALCULAR = :FLGRECALCULAR'
      'where'
      '  IDPARCASS = :OLD_IDPARCASS')
    InsertSQL.Strings = (
      'insert into PARCASS'
      
        '  (IDPARCASS, IDREGRAPRINCIPAL, IDPESSJUR, SEQPROPOSTA, IDPLANOP' +
        'REV, IDPLANASS, '
      
        '   IDPESSOA, IDPARCASSTIPOS, NUMPARCELAS, TOTALCONTRIB, TOTALALT' +
        'ERADORES, '
      '   FLGPAROK, FLGRECALCULAR)'
      'values'
      
        '  (:IDPARCASS, :IDREGRAPRINCIPAL, :IDPESSJUR, :SEQPROPOSTA, :IDP' +
        'LANOPREV, '
      
        '   :IDPLANASS, :IDPESSOA, :IDPARCASSTIPOS, :NUMPARCELAS, :TOTALC' +
        'ONTRIB, '
      '   :TOTALALTERADORES, :FLGPAROK, :FLGRECALCULAR)')
    DeleteSQL.Strings = (
      'delete from PARCASS'
      'where'
      '  IDPARCASS = :OLD_IDPARCASS')
    Left = 305
  end
  inherited MontaSelect: TMontaSelect
    Colunas.Strings = (
      'PPP.INSCRICAONUMERO'
      'P.NOME'
      'PP.NOME'
      'PN.NOME'
      'PJ.NOME')
    TipodeDado.Strings = (
      'N'
      'C'
      'C'
      'C'
      'C')
    Descricao.Strings = (
      'Inscrição Previdenciária'
      'Participante'
      'Plano Previdenciário'
      'Plano Assistencial'
      'Patrocinadora')
    SensivelACaixa.Strings = (
      'N'
      'N'
      'N'
      'N'
      'N')
    Tabelas.Strings = (
      'PARTASS PA'
      'PESSOA P'
      'PESSOA PJ'
      'PLANPREV PP'
      'PLANASS PN'
      'PARTPREVPLAN PPP'
      'PARCASS PC'
      'SITPART S')
    CamposChave.Strings = (
      'PC.IDPARCASS'
      'S.FLGINTERNO')
    Filtro.Strings = (
      'PA.IDPESSOA = P.IDPESSOA'
      'PA.IDPESSJUR = PJ.IDPESSOA'
      'PA.IDPLANOPREV = PP.IDPLANOPREV'
      'PA.IDPLANASS = PN.IDPLANASS'
      'PA.IDPESSJUR = PPP.IDPESSJUR'
      'PA.IDPLANOPREV = PPP.IDPLANOPREV'
      'PA.IDPESSOA = PPP.IDPESSOA'
      'PA.IDPESSJUR = PC.IDPESSJUR'
      'PA.IDPLANOPREV = PC.IDPLANOPREV'
      'PA.IDPLANASS = PC.IDPLANASS'
      'PA.IDPESSOA = PC.IDPESSOA'
      'PPP.IDSITPART = S.IDSITPART')
    Mascaras.Strings = (
      ''
      ''
      ''
      ''
      '')
    Larguras.Strings = (
      '10'
      '60'
      '50'
      '40'
      '60')
    Left = 349
  end
  inherited CmeCadastro: TCmEventosCadastro
    OnFind = CmeCadastroFind
    BeforeConfirma = CmeCadastroBeforeConfirma
    Left = 358
  end
  inherited CmeDetalhe: TCmEventosCadastro
    Left = 408
    Top = 108
  end
  object qryPlano: TwwQuery
    CachedUpdates = True
    DatabaseName = 'BaseDados'
    SQL.Strings = (
      'select'
      ' idparcasstipos, idregraprincipal, descricao, numparcelas'
      'from'
      '  parcasstipos'
      'order by descricao')
    ValidateWithMask = True
    Left = 251
    Top = 140
  end
  object qryRegra: TwwQuery
    DatabaseName = 'BaseDados'
    SQL.Strings = (
      'SELECT'
      ' NOMEREGRA, IDREGRA'
      'FROM'
      ' REGRA'
      'ORDER BY NOMEREGRA')
    ValidateWithMask = True
    Left = 289
    Top = 175
  end
  object MontaSelect1: TMontaSelect
    Template.IdConsulta = 0
    Caption = 'Seleciona'
    Colunas.Strings = (
      'PPP.INSCRICAONUMERO'
      'P.NOME'
      'PP.NOME'
      'PN.NOME'
      'PJ.NOME')
    TipodeDado.Strings = (
      'N'
      'C'
      'C'
      'C'
      'C')
    Descricao.Strings = (
      'Inscrição Previdenciária'
      'Participante'
      'Plano Previdenciário'
      'Plano Assistencial'
      'Patrocinadora')
    SensivelACaixa.Strings = (
      'N'
      'N'
      'N'
      'N'
      'N')
    Tabelas.Strings = (
      'PARTASS PA'
      'PESSOA P'
      'PESSOA PJ'
      'PLANPREV PP'
      'PLANASS PN'
      'PARTPREVPLAN PPP'
      'SITPART S')
    CamposChave.Strings = (
      'PA.IDPESSOA'
      'PA.IDPESSJUR'
      'PA.IDPLANOPREV'
      'PA.IDPLANASS'
      'P.NOME'
      'PJ.NOME'
      'PP.NOME'
      'PN.NOME'
      'S.FLGINTERNO')
    Filtro.Strings = (
      'PA.IDPESSOA = P.IDPESSOA'
      'PA.IDPESSJUR = PJ.IDPESSOA'
      'PA.IDPLANOPREV = PP.IDPLANOPREV'
      'PA.IDPLANASS = PN.IDPLANASS'
      'PA.IDPESSJUR = PPP.IDPESSJUR'
      'PA.IDPLANOPREV = PPP.IDPLANOPREV'
      'PA.IDPESSOA = PPP.IDPESSOA'
      'PPP.IDSITPART = S.IDSITPART')
    Mascaras.Strings = (
      ''
      ''
      ''
      ''
      '')
    Larguras.Strings = (
      '10'
      '60'
      '50'
      '40'
      '60')
    DataBaseName = 'BaseDados'
    RepeteConsulta = False
    UsaDistinct = False
    SalvaConsulta = False
    ExibePergunta = True
    Left = 488
    Top = 56
  end
  object qryRegra2: TwwQuery
    DatabaseName = 'BaseDados'
    SQL.Strings = (
      'SELECT'
      ' NOMEREGRA, IDREGRA'
      'FROM'
      ' REGRA'
      'ORDER BY NOMEREGRA')
    ValidateWithMask = True
    Left = 73
    Top = 427
  end
  object updDet: TUpdateSQL
    ModifySQL.Strings = (
      'update alterxparcass'
      'set'
      '  IDPARCASS = :IDPARCASS,'
      '  CODALTERADOR = :CODALTERADOR,'
      '  IDREGRA = :IDREGRA'
      'where'
      '  IDPARCASS = :OLD_IDPARCASS and'
      '  CODALTERADOR = :OLD_CODALTERADOR and'
      '  IDREGRA = :OLD_IDREGRA')
    InsertSQL.Strings = (
      'insert into alterxparcass'
      '  (IDPARCASS, CODALTERADOR, IDREGRA)'
      'values'
      '  (:IDPARCASS, :CODALTERADOR, :IDREGRA)')
    DeleteSQL.Strings = (
      'delete from alterxparcass'
      'where'
      '  IDPARCASS = :OLD_IDPARCASS and'
      '  CODALTERADOR = :OLD_CODALTERADOR and'
      '  IDREGRA = :OLD_IDREGRA')
    Left = 369
    Top = 244
  end
  object qryDet: TwwQuery
    CachedUpdates = True
    BeforePost = qryDetBeforePost
    DatabaseName = 'BaseDados'
    SQL.Strings = (
      'select'
      ' ta.descricao, rg.nomeregra, ap.*'
      'from'
      ' alterxparcass ap, regra rg, tipoalterador ta'
      'where'
      ' (ap.idparcass = :idparcass) and'
      ' (ap.idregra = rg.idregra) and'
      ' (ap.codalterador = ta.codalterador)'
      'order by ta.descricao')
    UpdateObject = updDet
    ValidateWithMask = True
    Left = 333
    Top = 244
    ParamData = <
      item
        DataType = ftFloat
        Name = 'IDPARCASS'
        ParamType = ptUnknown
      end>
  end
  object qryAlterador: TwwQuery
    DatabaseName = 'BaseDados'
    SQL.Strings = (
      'SELECT CODALTERADOR,DESCRICAO'
      'FROM TIPOALTERADOR'
      'WHERE (RECPAG = '#39'R'#39')'
      'ORDER BY DESCRICAO')
    ValidateWithMask = True
    Left = 14
    Top = 429
  end
  object qryContrib: TwwQuery
    CachedUpdates = True
    DatabaseName = 'BaseDados'
    SQL.Strings = (
      'select'
      ' pi.*,'
      ' m.descricao motivo, pd.nome dependente, c.nome contribuicao,'
      ' h.valoresperado, h.dataprevisao, h.flgcobcarne'
      'from'
      
        ' parcassitens pi, hstcontribass h, motivo m, pessoa pd, contribu' +
        'icao c'
      'where'
      ' (pi.idparcass = :idparcass) and'
      ' (pi.tipo = '#39'C'#39') and'
      ' (pi.seqproposta = h.seqproposta) and'
      ' (pi.mes = h.mes) and'
      ' (pi.idmotivo = h.idmotivo) and'
      ' (pi.mescobranca = h.mescobranca) and'
      ' (pi.idplanass = h.idplanass) and'
      ' (pi.idplanoprev = h.idplanoprev) and'
      ' (pi.idpessjur = h.idpessjur) and'
      ' (pi.idtitular = h.idtitular) and'
      ' (pi.iddependente = h.iddependente) and'
      ' (pi.idcontass = h.idcontass) and'
      ' (pi.idcontass = h.idcontass) and'
      ' (h.idmotivo = m.idmotivo) and'
      ' (h.iddependente = pd.idpessoa) and'
      ' (h.idcontass = c.idcontribuicao)'
      'order by h.mes, h.mescobranca')
    UpdateObject = updContrib
    ControlType.Strings = (
      'FLGCOBCARNE;CheckBox;Yes;No'
      'FLGCONTRIBUICAO;CheckBox;1;0')
    ValidateWithMask = True
    Left = 460
    Top = 240
    ParamData = <
      item
        DataType = ftInteger
        Name = 'idparcass'
        ParamType = ptUnknown
      end>
  end
  object dsContrib: TwwDataSource
    AutoEdit = False
    DataSet = qryContrib
    Left = 411
    Top = 243
  end
  object qryParcAssItens: TwwQuery
    CachedUpdates = True
    DatabaseName = 'BaseDados'
    SQL.Strings = (
      'select'
      ' idparcassitens'
      'from'
      ' parcassitens'
      'where'
      ' (tipo = '#39'C'#39') and'
      ' (idparcass = :idparcass) and'
      ' (mes = :mes) and'
      ' (idmotivo = :idmotivo) and'
      ' (mescobranca = :mescobranca) and'
      ' (idplanass = :idplanass) and'
      ' (idplanoprev = :idplanoprev) and'
      ' (idpessjur = :idpessjur) and'
      ' (idtitular = :idtitular) and'
      ' (iddependente = :iddependente) and'
      ' (idcontass = :idcontass)')
    ControlType.Strings = (
      'flgDivida;CheckBox;1;0'
      'FLGCOBCARNE;CheckBox;Yes;No')
    ValidateWithMask = True
    Left = 569
    Top = 376
    ParamData = <
      item
        DataType = ftInteger
        Name = 'idparcass'
        ParamType = ptUnknown
      end
      item
        DataType = ftString
        Name = 'mes'
        ParamType = ptUnknown
      end
      item
        DataType = ftInteger
        Name = 'idmotivo'
        ParamType = ptUnknown
      end
      item
        DataType = ftString
        Name = 'mescobranca'
        ParamType = ptUnknown
      end
      item
        DataType = ftInteger
        Name = 'idplanass'
        ParamType = ptUnknown
      end
      item
        DataType = ftInteger
        Name = 'idplanoprev'
        ParamType = ptUnknown
      end
      item
        DataType = ftInteger
        Name = 'idpessjur'
        ParamType = ptUnknown
      end
      item
        DataType = ftInteger
        Name = 'idtitular'
        ParamType = ptUnknown
      end
      item
        DataType = ftInteger
        Name = 'iddependente'
        ParamType = ptUnknown
      end
      item
        DataType = ftInteger
        Name = 'idcontass'
        ParamType = ptUnknown
      end>
  end
  object updContrib: TUpdateSQL
    ModifySQL.Strings = (
      'update parcassitens'
      'set'
      '  IDPARCASSITENS = :IDPARCASSITENS,'
      '  SEQPROPOSTA = :SEQPROPOSTA,'
      '  MES = :MES,'
      '  IDMOTIVO = :IDMOTIVO,'
      '  MESCOBRANCA = :MESCOBRANCA,'
      '  IDPLANASS = :IDPLANASS,'
      '  IDPLANOPREV = :IDPLANOPREV,'
      '  IDPESSJUR = :IDPESSJUR,'
      '  IDTITULAR = :IDTITULAR,'
      '  IDDEPENDENTE = :IDDEPENDENTE,'
      '  IDCONTASS = :IDCONTASS,'
      '  IDPARCASS = :IDPARCASS,'
      '  TIPO = :TIPO,'
      '  FLGCONTRIBUICAO = :FLGCONTRIBUICAO'
      'where'
      '  IDPARCASSITENS = :OLD_IDPARCASSITENS')
    InsertSQL.Strings = (
      'insert into parcassitens'
      '  (IDPARCASSITENS, SEQPROPOSTA, MES, IDMOTIVO, MESCOBRANCA, '
      'IDPLANASS, '
      '   IDPLANOPREV, IDPESSJUR, IDTITULAR, IDDEPENDENTE, IDCONTASS, '
      'IDPARCASS, '
      '   TIPO, FLGCONTRIBUICAO)'
      'values'
      
        '  (:IDPARCASSITENS, :SEQPROPOSTA, :MES, :IDMOTIVO, :MESCOBRANCA,' +
        ' '
      ':IDPLANASS, '
      
        '   :IDPLANOPREV, :IDPESSJUR, :IDTITULAR, :IDDEPENDENTE, :IDCONTA' +
        'SS, '
      ':IDPARCASS, '
      '   :TIPO, :FLGCONTRIBUICAO)')
    DeleteSQL.Strings = (
      'delete from parcassitens'
      'where'
      '  IDPARCASSITENS = :OLD_IDPARCASSITENS')
    Left = 513
    Top = 244
  end
  object qryParcelas: TwwQuery
    CachedUpdates = True
    DatabaseName = 'BaseDados'
    SQL.Strings = (
      'select'
      
        ' pi.ordem, h.mes, h.idmotivo, h.mescobranca, h.idplanass, h.idpl' +
        'anoprev,'
      
        ' h.idpessjur, h.idtitular, h.idcontass, m.descricao motivo, c.no' +
        'me contribuicao,'
      ' h.valoresperado, h.dataprevisao'
      'from'
      ' parcassitens pi, hstcontribass h, motivo m, contribuicao c'
      'where'
      ' (pi.idparcass = :idparcass) and'
      ' (pi.tipo = '#39'R'#39') and'
      ' (pi.idpessjur = h.idpessjur) and'
      ' (pi.idplanoprev = h.idplanoprev) and'
      ' (pi.idplanass = h.idplanass) and'
      ' (pi.idtitular = h.idtitular) and'
      ' (h.idmotivo = m.idmotivo) and'
      ' (h.idcontass = c.idcontribuicao) and'
      ' (h.sitrecebimento = 1)'
      'order by h.mes, h.mescobranca')
    ValidateWithMask = True
    Left = 244
    Top = 428
    ParamData = <
      item
        DataType = ftInteger
        Name = 'idparcass'
        ParamType = ptUnknown
      end>
  end
  object dsParcelas: TwwDataSource
    AutoEdit = False
    DataSet = qryParcelas
    Left = 187
    Top = 427
  end
  object qryPortForm: TwwQuery
    DatabaseName = 'BaseDados'
    SQL.Strings = (
      'SELECT'
      ' CODARQUIVOREMESSA,CODBLOQCHE,CODCENTROCUSTO,'
      ' CODFORMA,CODFORMAPAGTO,CODPORTADOR,CODPORTFORMA,'
      ' CODTIPOPAGTO,CONTROLEREMESSA,DATACONTRREMESSA,'
      ' DESCFINAN,DESCRICAO,DMAIS,FLGEMITEAVISO,IDEMPRESA,'
      ' IDPESSOA,IDTEMPLCHEQUE,IDUSUARIOINCLUSAO,JUROSPORDIA,'
      ' LANCAFINANC,LOTETRANSMISSAO,NOSSONUMERO,'
      ' NUMEMPRESABANCO,NUMRAZAOCC,PATHARQUIVOREM,'
      ' PATHARQUIVORET,PLACONTA,PLANO,PRAZOPROTESTO,RECPAG'
      'FROM'
      ' PORTADORFORMA'
      'WHERE'
      ' RECPAG = '#39'R'#39)
    ValidateWithMask = True
    Left = 131
    Top = 427
  end
  object RegCalculo: TRegra
    DatabaseName = 'BaseDados'
    IdCalculo = 0
    IdEmpresa = 0
    Left = 446
    Top = 9
  end
end
