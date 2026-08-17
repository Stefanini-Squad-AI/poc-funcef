inherited FrmConsTipoContrato: TFrmConsTipoContrato
  Left = 293
  Top = 71
  BorderIcons = [biSystemMenu, biMinimize]
  Caption = 'Contratos de Renda Variavel'
  ClientHeight = 456
  ClientWidth = 414
  OnCloseQuery = nil
  OnKeyDown = FormKeyDown
  PixelsPerInch = 96
  TextHeight = 13
  inherited pnlFundo: TPanel
    Width = 414
    Height = 370
    object Label2: TLabel
      Left = 11
      Top = 18
      Width = 128
      Height = 13
      Caption = 'Descrição do Contrato'
      FocusControl = DbDescContrato
    end
    object DbDescContrato: TDBEdit
      Left = 11
      Top = 33
      Width = 390
      Height = 21
      DataField = 'DESCTIPOCTINVEST'
      DataSource = DsTipoContrato
      TabOrder = 0
    end
    object PageControl1: TPageControl
      Left = 5
      Top = 59
      Width = 404
      Height = 306
      ActivePage = TbDados
      Align = alBottom
      HotTrack = True
      TabOrder = 1
      object TbDados: TTabSheet
        Caption = 'Dados do Contrato'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Height = -9
        Font.Name = 'MS Sans Serif'
        Font.Style = [fsBold]
        ParentFont = False
        object Bevel1: TBevel
          Left = 0
          Top = 0
          Width = 396
          Height = 278
          Align = alClient
        end
        object Label4: TLabel
          Left = 10
          Top = 3
          Width = 73
          Height = 13
          Caption = 'Investimento'
        end
        object Label11: TLabel
          Left = 10
          Top = 42
          Width = 121
          Height = 13
          Caption = 'Corretora de Valores '
        end
        object Label6: TLabel
          Left = 10
          Top = 82
          Width = 100
          Height = 13
          Caption = 'Bolsa de Valores '
        end
        object Lable1: TLabel
          Left = 10
          Top = 119
          Width = 30
          Height = 13
          Caption = 'Série'
        end
        object Label7: TLabel
          Left = 201
          Top = 119
          Width = 126
          Height = 13
          Caption = 'Identificação do Lote '
        end
        object Label12: TLabel
          Left = 10
          Top = 159
          Width = 116
          Height = 13
          Caption = 'Data de Vencimento'
        end
        object Label15: TLabel
          Left = 201
          Top = 159
          Width = 156
          Height = 13
          Caption = 'Preço de Exercício p/ Lote'
          FocusControl = DbPrecoVenc
        end
        object Label10: TLabel
          Left = 201
          Top = 199
          Width = 103
          Height = 13
          Caption = 'Saldo do Contrato'
          FocusControl = DbPrecoVenc
        end
        object Label14: TLabel
          Left = 10
          Top = 199
          Width = 102
          Height = 13
          Caption = 'Carteira de Lastro'
        end
        object Label16: TLabel
          Left = 10
          Top = 239
          Width = 92
          Height = 13
          Caption = 'Carteira a Vista '
        end
        object LkcInvestimento: TwwDBLookupCombo
          Left = 10
          Top = 17
          Width = 375
          Height = 21
          DropDownAlignment = taLeftJustify
          Selected.Strings = (
            'DESCINVESTIMENTO'#9'40'#9'Investimento')
          DataField = 'IDINVESTIMENTO'
          DataSource = ds
          LookupTable = QryInvestimento
          LookupField = 'IDINVESTIMENTO'
          Options = [loColLines, loRowLines, loTitles]
          Style = csDropDownList
          TabOrder = 0
          AutoDropDown = True
          ShowButton = True
          AllowClearKey = False
          ShowMatchText = True
          OnChange = LkcInvestimentoChange
        end
        object DbLkcBuscaCorretor: TwwDBLookupCombo
          Left = 10
          Top = 56
          Width = 375
          Height = 21
          DropDownAlignment = taLeftJustify
          Selected.Strings = (
            'SGLCORRETVALORES'#9'40'#9'Sigla da Corretora ')
          DataField = 'IDCORRETVALORES'
          DataSource = ds
          LookupTable = QryBuscaCorretora
          LookupField = 'IDCORRETVALORES'
          Options = [loColLines, loRowLines, loTitles]
          TabOrder = 1
          AutoDropDown = True
          ShowButton = True
          AllowClearKey = False
          ShowMatchText = True
        end
        object DbLkcBolsa: TwwDBLookupCombo
          Left = 9
          Top = 96
          Width = 376
          Height = 21
          DropDownAlignment = taLeftJustify
          Selected.Strings = (
            'SGLBOLSAVALORES'#9'40'#9'Sigla da Bolsa')
          DataField = 'IDBOLSAVALORES'
          DataSource = ds
          LookupTable = QryBolsaValores
          LookupField = 'IDBOLSAVALORES'
          Options = [loColLines, loRowLines, loTitles]
          TabOrder = 2
          AutoDropDown = True
          ShowButton = True
          AllowClearKey = False
          ShowMatchText = True
        end
        object DbSerie: TDBEdit
          Left = 10
          Top = 134
          Width = 184
          Height = 21
          CharCase = ecUpperCase
          DataField = 'SERIE'
          DataSource = ds
          TabOrder = 3
          OnExit = DbSerieExit
        end
        object DbIdLote: TDBEdit
          Left = 201
          Top = 134
          Width = 159
          Height = 21
          DataField = 'IDLOTE'
          DataSource = ds
          TabOrder = 4
          OnExit = DbIdLoteExit
        end
        object DbDtVencimento: TCMDateTimePicker
          Left = 10
          Top = 173
          Width = 184
          Height = 21
          CalendarAttributes.Font.Charset = DEFAULT_CHARSET
          CalendarAttributes.Font.Color = clWindowText
          CalendarAttributes.Font.Height = -11
          CalendarAttributes.Font.Name = 'MS Sans Serif'
          CalendarAttributes.Font.Style = []
          ButtonStyle = cbsCustom
          DataField = 'DATAVENCIM'
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
          TabOrder = 5
        end
        object DbPrecoVenc: TDBEdit
          Left = 201
          Top = 173
          Width = 184
          Height = 21
          Color = clWhite
          DataField = 'PRECOVENCIM'
          DataSource = ds
          TabOrder = 6
          OnKeyPress = DbVlrCompraKeyPress
        end
        object PnlSaldoContrato: TPanel
          Left = 201
          Top = 213
          Width = 184
          Height = 21
          Alignment = taRightJustify
          BevelOuter = bvNone
          BevelWidth = 2
          BorderStyle = bsSingle
          Caption = '0,00 '
          TabOrder = 7
        end
        object DbLkcCartLastro: TwwDBLookupCombo
          Left = 10
          Top = 213
          Width = 183
          Height = 21
          DropDownAlignment = taLeftJustify
          Selected.Strings = (
            'DESCCARTINVEST'#9'40'#9'Carteira')
          DataField = 'IDCARTLASTRO'
          DataSource = ds
          LookupTable = QryBuscaCarteira
          LookupField = 'IDCARTEIRAINVEST'
          Options = [loColLines, loRowLines, loTitles]
          TabOrder = 8
          AutoDropDown = True
          ShowButton = True
          AllowClearKey = False
          ShowMatchText = True
        end
        object DbLkcCartaVista: TwwDBLookupCombo
          Left = 10
          Top = 253
          Width = 184
          Height = 21
          DropDownAlignment = taLeftJustify
          Selected.Strings = (
            'DESCCARTINVEST'#9'40'#9'Carteira')
          DataField = 'IDCARTAVISTA'
          DataSource = ds
          LookupTable = QryBuscaCarteira
          LookupField = 'IDCARTEIRAINVEST'
          Options = [loColLines, loRowLines, loTitles]
          TabOrder = 9
          AutoDropDown = True
          ShowButton = True
          AllowClearKey = False
          ShowMatchText = True
        end
        object BtNovoDoc: TBitBtn
          Left = 362
          Top = 134
          Width = 23
          Height = 22
          Hint = 'Gera Número do Lote'
          ParentShowHint = False
          ShowHint = True
          TabOrder = 10
          OnClick = BtNovoDocClick
          Glyph.Data = {
            76010000424D7601000000000000760000002800000020000000100000000100
            0400000000000001000000000000000000001000000010000000000000000000
            8000008000000080800080000000800080008080000080808000C0C0C0000000
            FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00888888888888
            88888888888888FF8888888888888778888888888888F77F8888888888800F08
            8888888888F7787F88888888800FFF0888888888F7788878F88888800FFFFFF0
            88888887788888F7F8888887FFFFFFF088888887F88888878F888887FFFFFFFF
            08888887FF88888F7F88888B7FFFFFFF088888F77F88888878F88B8B7BFFFFFF
            F088878778F88888F78F888B87FFFFFFFF0888F7F7F8888888788BBBBBFFFFFF
            FFF08777778F888888F7888B887FFFFFF77888F7F878F888F7788B8B8B87FFF7
            78888787F7878FF77888888B8888777888888887888877788888888888888888
            8888888888888888888888888888888888888888888888888888}
          NumGlyphs = 2
        end
      end
      object TbEtapas: TTabSheet
        Caption = 'Etapas do Contrato'
        object Panel1: TPanel
          Left = 0
          Top = 31
          Width = 396
          Height = 247
          Align = alClient
          TabOrder = 2
          object Bevel2: TBevel
            Left = 1
            Top = 1
            Width = 394
            Height = 245
            Align = alClient
          end
          object Label1: TLabel
            Left = 16
            Top = 8
            Width = 44
            Height = 25
            Caption = 'Texto'
            Font.Charset = ANSI_CHARSET
            Font.Color = clNavy
            Font.Height = -21
            Font.Name = 'Arial Narrow'
            Font.Style = [fsUnderline]
            ParentFont = False
          end
          object Panel2: TPanel
            Left = 7
            Top = 33
            Width = 433
            Height = 169
            BevelOuter = bvNone
            TabOrder = 0
            Visible = False
            object Label3: TLabel
              Left = 361
              Top = 75
              Width = 92
              Height = 13
              Caption = 'Nome da Etapa:'
              FocusControl = dbeNomeEtapa
              Visible = False
            end
            object Label5: TLabel
              Left = 14
              Top = 6
              Width = 103
              Height = 13
              Caption = 'Tipo de Operação'
            end
            object Label8: TLabel
              Left = 14
              Top = 46
              Width = 143
              Height = 13
              Caption = 'Regra Data de Operação'
            end
            object Label9: TLabel
              Left = 14
              Top = 86
              Width = 145
              Height = 13
              Caption = 'Regra Valor da Operação'
            end
            object dbeNomeEtapa: TDBEdit
              Left = 361
              Top = 91
              Width = 415
              Height = 21
              DataField = 'DESCETAPACONTRATO'
              DataSource = DsEtapas
              TabOrder = 0
              Visible = False
            end
            object dblcTipoOper: TwwDBLookupCombo
              Left = 14
              Top = 22
              Width = 361
              Height = 21
              DropDownAlignment = taLeftJustify
              Selected.Strings = (
                'DESCTIPOOPERACAO'#9'40'#9'Tipo de Operação'
                'DESCMERCADO'#9'40'#9'Mercado ')
              DataField = 'IDTIPOOPERACAO'
              DataSource = DsEtapas
              LookupTable = qryTipoOperacao
              LookupField = 'IDTIPOOPERACAO'
              Options = [loColLines, loRowLines, loTitles]
              Enabled = False
              TabOrder = 1
              AutoDropDown = True
              ShowButton = True
              AllowClearKey = False
            end
            object DBLkRegraData: TwwDBLookupCombo
              Left = 14
              Top = 62
              Width = 329
              Height = 21
              DropDownAlignment = taLeftJustify
              Selected.Strings = (
                'NOMEREGRA'#9'40'#9'Regras')
              DataField = 'IDREGRADATAOPER'
              DataSource = DsEtapas
              LookupTable = qryRegraData
              LookupField = 'IDREGRA'
              Options = [loColLines, loRowLines, loTitles]
              Style = csDropDownList
              Enabled = False
              TabOrder = 2
              AutoDropDown = True
              ShowButton = True
              AllowClearKey = True
              OnChange = DBLkRegraDataChange
            end
            object DBLKRegraValor: TwwDBLookupCombo
              Left = 14
              Top = 102
              Width = 329
              Height = 21
              DropDownAlignment = taLeftJustify
              Selected.Strings = (
                'NOMEREGRA'#9'40'#9'Regras')
              DataField = 'IDREGRAVALOROPER'
              DataSource = DsEtapas
              LookupTable = QryRegraValor
              LookupField = 'IDREGRA'
              Options = [loColLines, loRowLines, loTitles]
              Style = csDropDownList
              Enabled = False
              TabOrder = 3
              AutoDropDown = True
              ShowButton = True
              AllowClearKey = True
              OnChange = DBLKRegraValorChange
            end
            object bbtnRegraValor: TBitBtn
              Left = 350
              Top = 100
              Width = 25
              Height = 24
              Hint = 'Descrição dos Passos da Regra'
              ParentShowHint = False
              ShowHint = True
              TabOrder = 4
              OnClick = bbtnRegraDataClick
              Glyph.Data = {
                76010000424D7601000000000000760000002800000020000000100000000100
                0400000000000001000000000000000000001000000010000000000000000000
                800000800000008080008000000080008000808000007F7F7F00BFBFBF000000
                FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00333300000000
                0000333377777777777733330FFFFFFFFFF033337F3FFF3F3FF733330F000F0F
                00F033337F777373773733330FFFFFFFFFF033337F3FF3FF3FF733330F00F00F
                00F033337F773773773733330FFFFFFFFFF033337FF3333FF3F7333300FFFF00
                F0F03333773FF377F7373330FB00F0F0FFF0333733773737F3F7330FB0BF0FB0
                F0F0337337337337373730FBFBF0FB0FFFF037F333373373333730BFBF0FB0FF
                FFF037F3337337333FF700FBFBFB0FFF000077F333337FF37777E0BFBFB000FF
                0FF077FF3337773F7F37EE0BFB0BFB0F0F03777FF3733F737F73EEE0BFBF00FF
                00337777FFFF77FF7733EEEE0000000003337777777777777333}
              NumGlyphs = 2
            end
            object bbtnRegraData: TBitBtn
              Left = 350
              Top = 60
              Width = 25
              Height = 24
              Hint = 'Descrição dos Passos da Regra'
              ParentShowHint = False
              ShowHint = True
              TabOrder = 5
              OnClick = bbtnRegraDataClick
              Glyph.Data = {
                76010000424D7601000000000000760000002800000020000000100000000100
                0400000000000001000000000000000000001000000010000000000000000000
                800000800000008080008000000080008000808000007F7F7F00BFBFBF000000
                FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00333300000000
                0000333377777777777733330FFFFFFFFFF033337F3FFF3F3FF733330F000F0F
                00F033337F777373773733330FFFFFFFFFF033337F3FF3FF3FF733330F00F00F
                00F033337F773773773733330FFFFFFFFFF033337FF3333FF3F7333300FFFF00
                F0F03333773FF377F7373330FB00F0F0FFF0333733773737F3F7330FB0BF0FB0
                F0F0337337337337373730FBFBF0FB0FFFF037F333373373333730BFBF0FB0FF
                FFF037F3337337333FF700FBFBFB0FFF000077F333337FF37777E0BFBFB000FF
                0FF077FF3337773F7F37EE0BFB0BFB0F0F03777FF3733F737F73EEE0BFBF00FF
                00337777FFFF77FF7733EEEE0000000003337777777777777333}
              NumGlyphs = 2
            end
          end
          object bbtnOkDet: TBitBtn
            Left = 87
            Top = 166
            Width = 80
            Height = 27
            Caption = '&OK'
            Default = True
            TabOrder = 1
            Visible = False
            Glyph.Data = {
              BE060000424DBE06000000000000360400002800000024000000120000000100
              0800000000008802000000000000000000000001000000010000000000000000
              80000080000000808000800000008000800080800000C0C0C000C0DCC000F0CA
              A600000000000000000000000000000000000000000000000000000000000000
              0000000000000000000000000000000000000000000000000000000000000000
              0000000000000000000000000000000000000000000000000000000000000000
              0000000000000000000000000000000000000000000000000000000000000000
              0000000000000000000000000000000000000000000000000000000000000000
              0000000000000000000000000000000000000000000000000000000000000000
              0000000000000000000000000000000000000000000000000000000000000000
              0000000000000000000000000000000000000000000000000000000000000000
              0000000000000000000000000000000000000000000000000000000000000000
              0000000000000000000000000000000000000000000000000000000000000000
              0000000000000000000000000000000000000000000000000000000000000000
              0000000000000000000000000000000000000000000000000000000000000000
              0000000000000000000000000000000000000000000000000000000000000000
              0000000000000000000000000000000000000000000000000000000000000000
              0000000000000000000000000000000000000000000000000000000000000000
              0000000000000000000000000000000000000000000000000000000000000000
              0000000000000000000000000000000000000000000000000000000000000000
              0000000000000000000000000000000000000000000000000000000000000000
              0000000000000000000000000000000000000000000000000000000000000000
              0000000000000000000000000000000000000000000000000000000000000000
              0000000000000000000000000000000000000000000000000000000000000000
              0000000000000000000000000000000000000000000000000000000000000000
              0000000000000000000000000000000000000000000000000000000000000000
              0000000000000000000000000000000000000000000000000000000000000000
              0000000000000000000000000000000000000000000000000000000000000000
              0000000000000000000000000000000000000000000000000000000000000000
              0000000000000000000000000000000000000000000000000000000000000000
              0000000000000000000000000000000000000000000000000000000000000000
              0000000000000000000000000000000000000000000000000000000000000000
              000000000000000000000000000000000000F0FBFF00A4A0A000808080000000
              FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00030303030303
              0303030303030303030303030303030303030303030303030303030303030303
              03030303030303030303030303030303030303030303FF030303030303030303
              03030303030303040403030303030303030303030303030303F8F8FF03030303
              03030303030303030303040202040303030303030303030303030303F80303F8
              FF030303030303030303030303040202020204030303030303030303030303F8
              03030303F8FF0303030303030303030304020202020202040303030303030303
              0303F8030303030303F8FF030303030303030304020202FA0202020204030303
              0303030303F8FF0303F8FF030303F8FF03030303030303020202FA03FA020202
              040303030303030303F8FF03F803F8FF0303F8FF03030303030303FA02FA0303
              03FA0202020403030303030303F8FFF8030303F8FF0303F8FF03030303030303
              FA0303030303FA0202020403030303030303F80303030303F8FF0303F8FF0303
              0303030303030303030303FA0202020403030303030303030303030303F8FF03
              03F8FF03030303030303030303030303FA020202040303030303030303030303
              0303F8FF0303F8FF03030303030303030303030303FA02020204030303030303
              03030303030303F8FF0303F8FF03030303030303030303030303FA0202020403
              030303030303030303030303F8FF0303F8FF03030303030303030303030303FA
              0202040303030303030303030303030303F8FF03F8FF03030303030303030303
              03030303FA0202030303030303030303030303030303F8FFF803030303030303
              030303030303030303FA0303030303030303030303030303030303F803030303
              0303030303030303030303030303030303030303030303030303030303030303
              0303}
            NumGlyphs = 2
            Spacing = 0
          end
          object bbtnCancelarDet: TBitBtn
            Left = 283
            Top = 165
            Width = 95
            Height = 30
            Cancel = True
            Caption = '&Voltar'
            TabOrder = 2
            OnClick = bbtnCancelarDetClick
            Glyph.Data = {
              BE060000424DBE06000000000000360400002800000024000000120000000100
              0800000000008802000000000000000000000001000000010000000000000000
              80000080000000808000800000008000800080800000C0C0C000C0DCC000F0CA
              A600000000000000000000000000000000000000000000000000000000000000
              0000000000000000000000000000000000000000000000000000000000000000
              0000000000000000000000000000000000000000000000000000000000000000
              0000000000000000000000000000000000000000000000000000000000000000
              0000000000000000000000000000000000000000000000000000000000000000
              0000000000000000000000000000000000000000000000000000000000000000
              0000000000000000000000000000000000000000000000000000000000000000
              0000000000000000000000000000000000000000000000000000000000000000
              0000000000000000000000000000000000000000000000000000000000000000
              0000000000000000000000000000000000000000000000000000000000000000
              0000000000000000000000000000000000000000000000000000000000000000
              0000000000000000000000000000000000000000000000000000000000000000
              0000000000000000000000000000000000000000000000000000000000000000
              0000000000000000000000000000000000000000000000000000000000000000
              0000000000000000000000000000000000000000000000000000000000000000
              0000000000000000000000000000000000000000000000000000000000000000
              0000000000000000000000000000000000000000000000000000000000000000
              0000000000000000000000000000000000000000000000000000000000000000
              0000000000000000000000000000000000000000000000000000000000000000
              0000000000000000000000000000000000000000000000000000000000000000
              0000000000000000000000000000000000000000000000000000000000000000
              0000000000000000000000000000000000000000000000000000000000000000
              0000000000000000000000000000000000000000000000000000000000000000
              0000000000000000000000000000000000000000000000000000000000000000
              0000000000000000000000000000000000000000000000000000000000000000
              0000000000000000000000000000000000000000000000000000000000000000
              0000000000000000000000000000000000000000000000000000000000000000
              0000000000000000000000000000000000000000000000000000000000000000
              0000000000000000000000000000000000000000000000000000000000000000
              000000000000000000000000000000000000F0FBFF00A4A0A000808080000000
              FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00030303030303
              0303030303030303030303030303030303030303030303030303030303030303
              0303F8F80303030303030303030303030303030303FF03030303030303030303
              0303030303F90101F80303030303F9F80303030303030303F8F8FF0303030303
              03FF03030303030303F9010101F8030303F90101F8030303030303F8FF03F8FF
              030303FFF8F8FF030303030303F901010101F803F901010101F80303030303F8
              FF0303F8FF03FFF80303F8FF030303030303F901010101F80101010101F80303
              030303F8FF030303F8FFF803030303F8FF030303030303F90101010101010101
              F803030303030303F8FF030303F803030303FFF80303030303030303F9010101
              010101F8030303030303030303F8FF030303030303FFF8030303030303030303
              030101010101F80303030303030303030303F8FF0303030303F8030303030303
              0303030303F901010101F8030303030303030303030303F8FF030303F8030303
              0303030303030303F90101010101F8030303030303030303030303F803030303
              F8FF030303030303030303F9010101F8010101F803030303030303030303F803
              03030303F8FF0303030303030303F9010101F803F9010101F803030303030303
              03F8030303F8FF0303F8FF03030303030303F90101F8030303F9010101F80303
              03030303F8FF0303F803F8FF0303F8FF03030303030303F9010303030303F901
              0101030303030303F8FFFFF8030303F8FF0303F8FF0303030303030303030303
              030303F901F903030303030303F8F80303030303F8FFFFFFF803030303030303
              03030303030303030303030303030303030303030303030303F8F8F803030303
              0303030303030303030303030303030303030303030303030303030303030303
              0303}
            NumGlyphs = 2
            Spacing = 0
          end
        end
        object TvDetalhe: TTreeView
          Left = 0
          Top = 31
          Width = 396
          Height = 247
          Align = alClient
          HideSelection = False
          Images = ImageList1
          Indent = 19
          ReadOnly = True
          ShowButtons = False
          TabOrder = 0
          OnChange = TvDetalheChange
          OnCollapsing = TvDetalheCollapsing
        end
        object Dock973: TDock97
          Left = 0
          Top = 0
          Width = 396
          Height = 31
          AllowDrag = False
          BoundLines = [blTop, blBottom, blLeft, blRight]
          object Label13: TLabel
            Left = 46
            Top = 6
            Width = 50
            Height = 13
            Caption = 'Etapa .: '
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clNavy
            Font.Height = -12
            Font.Name = 'MS Sans Serif'
            Font.Style = [fsBold]
            ParentFont = False
          end
          object tb97BotoesDetalhe: TToolbar97
            Left = 0
            Top = 0
            Caption = 'tb97BotoesDetalhe'
            DockPos = 0
            TabOrder = 0
            object BtInserir: TSpeedButton
              Left = 0
              Top = 0
              Width = 25
              Height = 25
              Hint = 'Ver Detalhes'
              AllowAllUp = True
              GroupIndex = 1
              Glyph.Data = {
                F6000000424DF600000000000000760000002800000010000000100000000100
                0400000000008000000000000000000000001000000010000000000000000000
                80000080000000808000800000008000800080800000C0C0C000808080000000
                FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00777777777777
                7777777777777777777700000777770000070F000777770F00070F000777770F
                0007000000070000000700F000000F00000700F000700F00000700F000700F00
                00077000000000000077770F00070F0007777700000700000777777000777000
                77777770F07770F0777777700077700077777777777777777777}
              Layout = blGlyphTop
              ParentShowHint = False
              ShowHint = True
              Spacing = 0
              OnClick = BtInserirClick
            end
            object BtAlterar: TSpeedButton
              Left = 25
              Top = 0
              Width = 25
              Height = 25
              Hint = 'Alterar o registro selecionado|'
              AllowAllUp = True
              GroupIndex = 1
              Glyph.Data = {
                76010000424D7601000000000000760000002800000020000000100000000100
                0400000000000001000000000000000000001000000010000000000000000000
                800000800000008080008000000080008000808000007F7F7F00BFBFBF000000
                FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00333333000000
                000033333377777777773333330FFFFFFFF03FF3FF7FF33F3FF700300000FF0F
                00F077F777773F737737E00BFBFB0FFFFFF07773333F7F3333F7E0BFBF000FFF
                F0F077F3337773F3F737E0FBFBFBF0F00FF077F3333FF7F77F37E0BFBF00000B
                0FF077F3337777737337E0FBFBFBFBF0FFF077F33FFFFFF73337E0BF0000000F
                FFF077FF777777733FF7000BFB00B0FF00F07773FF77373377373330000B0FFF
                FFF03337777373333FF7333330B0FFFF00003333373733FF777733330B0FF00F
                0FF03333737F37737F373330B00FFFFF0F033337F77F33337F733309030FFFFF
                00333377737FFFFF773333303300000003333337337777777333}
              Layout = blGlyphTop
              NumGlyphs = 2
              ParentShowHint = False
              ShowHint = True
              Spacing = 0
              Visible = False
            end
            object BtExcluir: TSpeedButton
              Left = 50
              Top = 0
              Width = 25
              Height = 25
              Hint = 'Remover o registro selecionado|'
              AllowAllUp = True
              GroupIndex = 1
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
              Visible = False
            end
          end
          object Panel3: TPanel
            Left = 193
            Top = 0
            Width = 199
            Height = 29
            BevelInner = bvLowered
            Caption = '`'
            TabOrder = 1
            object BtExecutarOperacao: TBitBtn
              Left = 99
              Top = 2
              Width = 97
              Height = 25
              Hint = 'Executa Operação Selecionada'
              Caption = 'Executar'
              ParentShowHint = False
              ShowHint = True
              TabOrder = 0
              OnClick = BtExecutarOperacaoClick
              Glyph.Data = {
                66010000424D6601000000000000760000002800000014000000140000000100
                040000000000F000000000000000000000001000000010000000000000000000
                8000008000000080800080000000800080008080000080808000C0C0C0000000
                FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00888888888888
                8888888800008088877777777777778800008088444444444444478800008088
                4FFFFFFFFFFF4788000080004FFFFFFFFFFF4788000080884FFFFFFFFFFF4788
                0000808844444444444448880000808888888888888888880000808888880000
                000008880000808800000FBFBFBF088800008088088800000000088800008088
                08888888888888880000808808880000000008880000800000000FBFBFBF0888
                0000808888880000000008880000808888888888888888880000808800000000
                08888888000080000FBFBFBF0888888800008088000000000888888800008888
                88888888888888880000}
            end
            object BtFecharBoleta: TBitBtn
              Left = 2
              Top = 2
              Width = 97
              Height = 25
              Hint = 'Fecha Boleta Informada'
              Caption = 'Fechar'
              ParentShowHint = False
              ShowHint = True
              TabOrder = 1
              OnClick = BtFecharBoletaClick
              Glyph.Data = {
                42010000424D4201000000000000760000002800000011000000110000000100
                040000000000CC00000000000000000000001000000010000000000000000000
                BF0000BF000000BFBF00BF000000BF00BF00BFBF0000C0C0C000808080000000
                FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00777777777777
                7777700000007777777777777777700000007777777774F77777700000007777
                7777444F77777000000077777774444F777770000000700000444F44F7777000
                000070FFF444F0744F777000000070F8884FF0774F777000000070FFFFFFF077
                74F77000000070F88888F077774F7000000070FFFFFFF0777774F000000070F8
                8777F07777774000000070FFFF00007777777000000070F88707077777777000
                000070FFFF007777777770000000700000077777777770000000777777777777
                777770000000}
            end
          end
        end
      end
    end
  end
  inherited Dock972: TDock97
    Width = 414
  end
  inherited Dock971: TDock97
    Top = 417
    Width = 414
    inherited tb97Fundo: TToolbar97
      Left = 188
      DockPos = 188
    end
    inherited TB97oKCancelar: TToolbar97
      Left = 20
      DockPos = 20
    end
  end
  inherited qry: TwwQuery
    AfterScroll = qryAfterScroll
    SQL.Strings = (
      
        'SELECT '#9'CIN.IDCONTRATOINVEST,CIN.IDTIPOCONTRINVEST, CIN.IDINVEST' +
        'IMENTO,  CIN.IDEMISSOR,'
      
        #9'CIN.IDCORRETVALORES, CIN.IDBOLSAVALORES,    CIN.SERIE,         ' +
        '  CIN.IDLOTE, '
      
        '       '#9'CIN.DATACOMPRALOTE,  CIN.DATAVENCIM,        CIN.VLRCOMPR' +
        'ATITLOTE,CIN.PRECOVENCIM,    '
      
        ' '#9'CIN.QTDETITLOTE,     CIN.SALDOTITLOTE,      CIN.VLRRESGATE,   ' +
        '   INV.IDTIPOINVEST,'
      
        #9'CIN.IDCARTLASTRO, CIN.IDCARTAVISTA, CIN.IDCONTRATOMESTRE, BSA.I' +
        'DCUSTODIANTE'
      ''
      'FROM CM.CONTRATOINVESTIM CIN, INVESTIMENTO INV, BOLSAVALORES BSA'
      ''
      'WHERE '#9'CIN.IDINVESTIMENTO = INV.IDINVESTIMENTO'#9'AND '
      '                CIN.IDBOLSAVALORES = BSA.IDBOLSAVALORES AND'
      #9'INV.IDTIPOINVEST = 2  '
      #9
      '')
    Left = 194
    Top = 11
    object qryIDCONTRATOINVEST: TFloatField
      FieldName = 'IDCONTRATOINVEST'
      Origin = 'CONTRATOINVESTIM.IDCONTRATOINVEST'
    end
    object qryIDTIPOCONTRINVEST: TFloatField
      FieldName = 'IDTIPOCONTRINVEST'
      Origin = 'CONTRATOINVESTIM.IDTIPOCONTRINVEST'
    end
    object qryIDINVESTIMENTO: TFloatField
      FieldName = 'IDINVESTIMENTO'
      Origin = 'CONTRATOINVESTIM.IDINVESTIMENTO'
    end
    object qryIDEMISSOR: TFloatField
      FieldName = 'IDEMISSOR'
      Origin = 'CONTRATOINVESTIM.IDEMISSOR'
    end
    object qryIDCORRETVALORES: TFloatField
      FieldName = 'IDCORRETVALORES'
      Origin = 'CONTRATOINVESTIM.IDCORRETVALORES'
    end
    object qryIDBOLSAVALORES: TFloatField
      FieldName = 'IDBOLSAVALORES'
      Origin = 'CONTRATOINVESTIM.IDBOLSAVALORES'
    end
    object qrySERIE: TStringField
      FieldName = 'SERIE'
      Origin = 'CONTRATOINVESTIM.SERIE'
      Size = 60
    end
    object qryIDLOTE: TStringField
      FieldName = 'IDLOTE'
      Origin = 'CONTRATOINVESTIM.IDLOTE'
      Size = 10
    end
    object qryDATACOMPRALOTE: TDateTimeField
      FieldName = 'DATACOMPRALOTE'
      Origin = 'CONTRATOINVESTIM.DATACOMPRALOTE'
    end
    object qryDATAVENCIM: TDateTimeField
      FieldName = 'DATAVENCIM'
      Origin = 'CONTRATOINVESTIM.DATAVENCIM'
    end
    object qryVLRCOMPRATITLOTE: TFloatField
      FieldName = 'VLRCOMPRATITLOTE'
      Origin = 'CONTRATOINVESTIM.VLRCOMPRATITLOTE'
    end
    object qryPRECOVENCIM: TFloatField
      FieldName = 'PRECOVENCIM'
      Origin = 'CONTRATOINVESTIM.PRECOVENCIM'
      DisplayFormat = '###,###,##0.000000'
      EditFormat = '#######0.000000'
    end
    object qryQTDETITLOTE: TFloatField
      FieldName = 'QTDETITLOTE'
      Origin = 'CONTRATOINVESTIM.QTDETITLOTE'
    end
    object qrySALDOTITLOTE: TFloatField
      FieldName = 'SALDOTITLOTE'
      Origin = 'CONTRATOINVESTIM.SALDOTITLOTE'
    end
    object qryVLRRESGATE: TFloatField
      FieldName = 'VLRRESGATE'
      Origin = 'CONTRATOINVESTIM.VLRRESGATE'
    end
    object qryIDTIPOINVEST: TFloatField
      FieldName = 'IDTIPOINVEST'
      Origin = 'INVESTIMENTO.IDTIPOINVEST'
    end
    object qryDESCTIPOCONTRATO: TStringField
      FieldKind = fkLookup
      FieldName = 'DESCTIPOCONTRATO'
      LookupDataSet = QryTipoContrato
      LookupKeyFields = 'IDTIPOCONTRINVEST'
      LookupResultField = 'DESCTIPOCTINVEST'
      KeyFields = 'IDTIPOCONTRINVEST'
      Size = 40
      Lookup = True
    end
    object qryIDCARTLASTRO: TFloatField
      FieldName = 'IDCARTLASTRO'
      Origin = 'CONTRATOINVESTIM.IDCARTLASTRO'
    end
    object qryIDCARTAVISTA: TFloatField
      FieldName = 'IDCARTAVISTA'
      Origin = 'CONTRATOINVESTIM.IDCARTAVISTA'
    end
    object qryIDCONTRATOMESTRE: TFloatField
      FieldName = 'IDCONTRATOMESTRE'
      Origin = 'CONTRATOINVESTIM.IDCONTRATOMESTRE'
    end
    object qryIDCUSTODIANTE: TFloatField
      FieldName = 'IDCUSTODIANTE'
      Origin = 'BOLSAVALORES.IDCUSTODIANTE'
    end
  end
  inherited upd: TUpdateSQL
    ModifySQL.Strings = (
      'update CM.CONTRATOINVESTIM'
      'set'
      '  IDCONTRATOINVEST = :IDCONTRATOINVEST,'
      '  IDTIPOCONTRINVEST = :IDTIPOCONTRINVEST,'
      '  IDINVESTIMENTO = :IDINVESTIMENTO,'
      '  IDEMISSOR = :IDEMISSOR,'
      '  IDCORRETVALORES = :IDCORRETVALORES,'
      '  IDBOLSAVALORES = :IDBOLSAVALORES,'
      '  SERIE = :SERIE,'
      '  IDLOTE = :IDLOTE,'
      '  DATACOMPRALOTE = :DATACOMPRALOTE,'
      '  DATAVENCIM = :DATAVENCIM,'
      '  VLRCOMPRATITLOTE = :VLRCOMPRATITLOTE,'
      '  PRECOVENCIM = :PRECOVENCIM,'
      '  QTDETITLOTE = :QTDETITLOTE,'
      '  SALDOTITLOTE = :SALDOTITLOTE,'
      '  VLRRESGATE = :VLRRESGATE,'
      '  IDCARTLASTRO = :IDCARTLASTRO,'
      '  IDCARTAVISTA = :IDCARTAVISTA,'
      '  IDCONTRATOMESTRE = :IDCONTRATOMESTRE'
      'where'
      '  IDCONTRATOINVEST = :OLD_IDCONTRATOINVEST')
    InsertSQL.Strings = (
      'insert into CM.CONTRATOINVESTIM'
      
        '  (IDCONTRATOINVEST, IDTIPOCONTRINVEST, IDINVESTIMENTO, IDEMISSO' +
        'R, IDCORRETVALORES, '
      
        '   IDBOLSAVALORES, SERIE, IDLOTE, DATACOMPRALOTE, DATAVENCIM, VL' +
        'RCOMPRATITLOTE, '
      
        '   PRECOVENCIM, QTDETITLOTE, SALDOTITLOTE, VLRRESGATE, IDCARTLAS' +
        'TRO, IDCARTAVISTA, '
      '   IDCONTRATOMESTRE)'
      'values'
      
        '  (:IDCONTRATOINVEST, :IDTIPOCONTRINVEST, :IDINVESTIMENTO, :IDEM' +
        'ISSOR, '
      
        '   :IDCORRETVALORES, :IDBOLSAVALORES, :SERIE, :IDLOTE, :DATACOMP' +
        'RALOTE, '
      
        '   :DATAVENCIM, :VLRCOMPRATITLOTE, :PRECOVENCIM, :QTDETITLOTE, :' +
        'SALDOTITLOTE, '
      '   :VLRRESGATE, :IDCARTLASTRO, :IDCARTAVISTA, :IDCONTRATOMESTRE)')
    DeleteSQL.Strings = (
      'delete from CM.CONTRATOINVESTIM'
      'where'
      '  IDCONTRATOINVEST = :OLD_IDCONTRATOINVEST')
    Left = 255
    Top = 11
  end
  inherited MontaSelect: TMontaSelect
    Colunas.Strings = (
      'TIPOCONTRINVEST.DESCTIPOCTINVEST'
      'INVESTIMENTO.DESCINVESTIMENTO'
      'CONTRATOINVESTIM.IDLOTE'
      'CONTRATOINVESTIM.SERIE'
      'CONTRATOINVESTIM.DATAVENCIM')
    TipodeDado.Strings = (
      'C'
      'C'
      'C'
      'C'
      'C')
    Descricao.Strings = (
      'Tipo de Contrato'
      'Investimento'
      'Lote'
      'Série'
      'Data de Liquidação')
    Tabelas.Strings = (
      'CONTRATOINVESTIM'
      'INVESTIMENTO'
      'TIPOCONTRINVEST')
    CamposChave.Strings = (
      'CONTRATOINVESTIM.IDCONTRATOINVEST'
      'CONTRATOINVESTIM.IDTIPOCONTRINVEST')
    Filtro.Strings = (
      'CONTRATOINVESTIM.IDINVESTIMENTO=INVESTIMENTO.IDINVESTIMENTO'
      'INVESTIMENTO.IDTIPOINVEST = 2'
      
        'CONTRATOINVESTIM.IDTIPOCONTRINVEST=TIPOCONTRINVEST.IDTIPOCONTRIN' +
        'VEST')
    Mascaras.Strings = (
      ''
      ''
      ''
      ''
      '')
    Larguras.Strings = (
      '40'
      '30'
      '10'
      '20'
      '10')
    Left = 306
    Top = 336
  end
  inherited ds: TwwDataSource
    Left = 224
    Top = 11
  end
  inherited CmeCadastro: TCmEventosCadastro
    OnFind = CmeCadastroFind
    Left = 270
    Top = 162
  end
  object QryAux: TwwQuery
    AutoCalcFields = False
    DatabaseName = 'BaseDados'
    ValidateWithMask = True
    Left = 245
    Top = 336
  end
  object DsEtapas: TwwDataSource
    DataSet = qryEtapas
    Left = 321
    Top = 11
  end
  object ImageList1: TImageList
    Left = 211
    Top = 335
    Bitmap = {
      494C010104000500040010001000FFFFFFFFFF10FFFFFFFFFFFFFFFF424D3600
      0000000000003600000028000000400000002000000001001000000000000010
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000000000000000007C007C007C007C
      007C007C007C0000000000000000000000000000000000001F001F001F001F00
      1F001F001F00000000000000000000000000000000000000FF7FFF7FFF7FFF7F
      FF7FFF7FFF7FFF7FFF7F00000000000000000000000000000000000000000000
      00000000000000000000000000000000000000000000007C007C007C007C007C
      007C007C007C000000400000000000000000000000001F001F001F001F001F00
      1F001F001F00000010000000000000000000000000000000FF7FFF7FFF7FFF7F
      FF7FFF7FFF7FFF7FFF7F00000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000400040004000400040
      0040004000400000004000400000000000000000000010001000100010001000
      100010001000000010001000000000000000000000000000FF7F000000000000
      0000000000000000FF7F00000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000400040000000000000000000000000000000000000
      000000000000000000001000100000000000000000000000FF7FFF7FFF7FFF7F
      FF7FFF7FFF7FFF7FFF7F00000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000010420000FF7FFF7FFF7F
      FF7FFF7FFF7F0000FF7F00000040004000000000000010420000FF7FFF7FFF7F
      FF7FFF7FFF7F0000FF7F0000100010000000000000000000FF7F000000000000
      0000000000000000FF7F00000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000FF7FFF7FFF7F
      FF7FFF7FFF7F0000FF7F00000000004000000000000000000000FF7FFF7FFF7F
      FF7FFF7FFF7F0000FF7FFF7F000010000000000000000000FF7FFF7FFF7FFF7F
      FF7FFF7FFF7FFF7FFF7F00000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000FF7FFF7F1042
      0000000000000000FF7F0000FF7F000000000000000000000000FF7FFF7F1042
      000000000000000018631863FF7F00000000000000000000FF7F000000000000
      0000FF7FFF7FFF7FFF7F00000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      FF7FFF7FFF7FFF7FFF7F0000FF7F000000000000000000000000000000000000
      186318631863186318631863FF7F00000000000000000000FF7FFF7FFF7FFF7F
      FF7FFF7FFF7FFF7FFF7F00000000000000000000000000000000000000000000
      000000000000000000000000000000000000000000000000000000000000FF7F
      FF7F10420000000000000000FF7F000000000000000000000000000000000000
      000000000000000000000000FF7F00000000000000000000FF7F000000000000
      000000000000FF7FFF7F00000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000FF7FFF7FFF7FFF7FFF7F00000000000000000000000000000000FF7F
      FF7FFF7FFF7FFF7FFF7F0000FF7F00000000000000000000FF7FFF7FFF7FFF7F
      FF7FFF7FFF7FFF7FFF7F00000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000FF7FFF7F104200000000000000000000000000000000000000000000FF7F
      000000000000FF7FFF7F0000000000000000000000000000FF7F000000000000
      0000FF7FFF7F0000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000000000000000000000000000FF7F
      FF7FFF7FFF7FFF7FFF7F0000000000000000000000000000FF7FFF7FFF7FFF7F
      FF7FFF7FFF7F0000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000000000000000000000000000FF7F
      FF7F104200000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000424D3E000000000000003E000000
      2800000040000000200000000100010000000000000100000000000000000000
      000000000000000000000000FFFFFF0000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000000000000000FFFFFFFFFFFFFFFFFFFFE01FE01FC007
      FFFFC00FC00FC007FFFF80078007C007FFFF00030003C007FFFF00010001C007
      FFFF80008000C007FFFFC000C000C007FFFFE000E000C007FFFFF000F000C007
      FFFFF801F801C007FFFFFC01F801C007FFFFFE01F801C007FFFFFF1FF807C01F
      FFFFFFFFF807C01FFFFFFFFFFC7FFFFF00000000000000000000000000000000
      000000000000}
  end
  object DsAux: TwwDataSource
    DataSet = QryAux
    Left = 275
    Top = 336
  end
  object DsEtapaAnteced: TwwDataSource
    DataSet = QryEtapaAnteced
    Left = 338
    Top = 365
  end
  object qryTipoOperacao: TwwQuery
    DatabaseName = 'BaseDados'
    SQL.Strings = (
      'SELECT '#9'T.IDTIPOOPERACAO,'
      '       '#9'T.IDTIPOINVEST,'
      '       '#9'T.IDMERCADO,'
      '       '#9'T.DESCTIPOOPERACAO,'
      '       '#9'M.DESCMERCADO'
      'FROM   '#9'CM.TIPOOPERACAO T,CM.MERCADO M  '
      'WHERE  '#9'T.IDMERCADO = M.IDMERCADO '
      'ORDER BY M.DESCMERCADO,T.DESCTIPOOPERACAO')
    ValidateWithMask = True
    Left = 209
    Top = 365
  end
  object qryEtapas: TwwQuery
    DatabaseName = 'BaseDados'
    RequestLive = True
    SQL.Strings = (
      
        'SELECT '#9'IDTIPOCONTRINVEST,SEQCONTRATOINVEST,IDREGRADATAOPER,    ' +
        '           '
      #9'IDTIPOINVEST,IDTIPOOPERACAO,DESCETAPACONTRATO,     '
      #9'IDREGRAVALOROPER          '
      ''
      'FROM CM.ETAPACONTRATOINV'
      ''
      'WHERE  IDTIPOCONTRINVEST  =:IDTIPOCONTRINVEST '
      ''
      'ORDER BY SEQCONTRATOINVEST')
    ValidateWithMask = True
    Left = 291
    Top = 11
    ParamData = <
      item
        DataType = ftInteger
        Name = 'IDTIPOCONTRINVEST'
        ParamType = ptUnknown
      end>
  end
  object QryRegraValor: TwwQuery
    DatabaseName = 'basedados'
    SQL.Strings = (
      'Select     A.IDREGRA, '
      '               A.NOMEREGRA'
      ''
      'From       CM.REGRA A'
      ''
      'Order by A.NOMEREGRA'
      '')
    ValidateWithMask = True
    Left = 274
    Top = 368
  end
  object qryRegraData: TwwQuery
    DatabaseName = 'basedados'
    SQL.Strings = (
      'Select     A.IDREGRA, '
      '               A.NOMEREGRA'
      ''
      'From       CM.REGRA A'
      ''
      'Order by A.NOMEREGRA'
      '')
    ValidateWithMask = True
    Left = 242
    Top = 365
  end
  object QryEtapaAnteced: TwwQuery
    DatabaseName = 'BaseDados'
    RequestLive = True
    SQL.Strings = (
      'Select IDTIPOCONTRINVEST,SEQOPERANTECED,SEQCONTRATOINVEST,'
      '           INDICEPAI,INDICE,DESCETAPA'
      ''
      'From CM.OPERANTECEDENTE'
      ''
      'Where  IDTIPOCONTRINVEST  =:IDTIPOCONTRINVEST '
      ''
      'Order By INDICE')
    ValidateWithMask = True
    Left = 306
    Top = 365
    ParamData = <
      item
        DataType = ftInteger
        Name = 'IDTIPOCONTRINVEST'
        ParamType = ptUnknown
      end>
  end
  object MSBuscaTipoContrato: TMontaSelect
    Template.IdConsulta = 0
    Caption = 'Seleciona'
    Colunas.Strings = (
      'DESCTIPOCTINVEST')
    TipodeDado.Strings = (
      'C')
    Descricao.Strings = (
      'Descrição do Contrato')
    Tabelas.Strings = (
      'TIPOCONTRINVEST')
    CamposChave.Strings = (
      'IDTIPOCONTRINVEST')
    Filtro.Strings = (
      'TIPOCONTRINVEST.IDTIPOINVEST = 2')
    Mascaras.Strings = (
      '')
    Larguras.Strings = (
      '60')
    DataBaseName = 'BaseDados'
    RepeteConsulta = False
    UsaDistinct = False
    SalvaConsulta = False
    ExibePergunta = True
    Left = 338
    Top = 336
  end
  object QryTipoContrato: TwwQuery
    CachedUpdates = True
    DatabaseName = 'BaseDados'
    SQL.Strings = (
      'SELECT * FROM CM.TIPOCONTRINVEST')
    ValidateWithMask = True
    Left = 354
    Top = 11
    object QryTipoContratoIDTIPOCONTRINVEST: TFloatField
      FieldName = 'IDTIPOCONTRINVEST'
      Origin = 'TIPOCONTRINVEST.IDHISTCARTINV'
    end
    object QryTipoContratoDESCTIPOCTINVEST: TStringField
      FieldName = 'DESCTIPOCTINVEST'
      Origin = 'TIPOCONTRINVEST.IDDESPCARTINVEST'
      Size = 60
    end
  end
  object DsTipoContrato: TwwDataSource
    AutoEdit = False
    DataSet = QryTipoContrato
    Left = 384
    Top = 11
  end
  object QryInvestimento: TwwQuery
    DatabaseName = 'BaseDados'
    SQL.Strings = (
      'SELECT  IDINVESTIMENTO, DESCINVESTIMENTO, IDEMISSOR '
      ''
      'FROM CM.INVESTIMENTO'
      ''
      'WHERE IDTIPOINVEST = 2'
      ''
      'ORDER BY DESCINVESTIMENTO')
    ValidateWithMask = True
    Left = 174
    Top = 365
    object QryInvestimentoIDINVESTIMENTO: TFloatField
      FieldName = 'IDINVESTIMENTO'
    end
    object QryInvestimentoDESCINVESTIMENTO: TStringField
      DisplayLabel = 'Investimento'
      DisplayWidth = 40
      FieldName = 'DESCINVESTIMENTO'
      Size = 60
    end
    object QryInvestimentoIDEMISSOR: TFloatField
      FieldName = 'IDEMISSOR'
    end
  end
  object QryBuscaCorretora: TwwQuery
    DatabaseName = 'BaseDados'
    SQL.Strings = (
      'SELECT '#9'IDCORRETVALORES, SGLCORRETVALORES'
      ''
      'FROM CM.CORRETVALORES'
      ''
      'ORDER BY SGLCORRETVALORES')
    ValidateWithMask = True
    Left = 140
    Top = 365
    object QryBuscaCorretoraIDCORRETVALORES: TFloatField
      FieldName = 'IDCORRETVALORES'
      Origin = 'CORRETVALORES.IDCORRETVALORES'
    end
    object QryBuscaCorretoraSGLCORRETVALORES: TStringField
      FieldName = 'SGLCORRETVALORES'
      Origin = 'CORRETVALORES.SGLCORRETVALORES'
      Size = 10
    end
  end
  object QryBolsaValores: TwwQuery
    DatabaseName = 'BaseDados'
    SQL.Strings = (
      'SELECT IDBOLSAVALORES, SGLBOLSAVALORES, MOECODIGO'
      ''
      'FROM CM.BOLSAVALORES '
      ''
      'ORDER BY SGLBOLSAVALORES ')
    ValidateWithMask = True
    Left = 107
    Top = 365
    object QryBolsaValoresSGLBOLSAVALORES: TStringField
      DisplayLabel = 'Sigla da Bolsa'
      DisplayWidth = 40
      FieldName = 'SGLBOLSAVALORES'
      Origin = 'BOLSAVALORES.SGLBOLSAVALORES'
      Size = 10
    end
    object QryBolsaValoresIDBOLSAVALORES: TFloatField
      DisplayLabel = 'Código'
      DisplayWidth = 10
      FieldName = 'IDBOLSAVALORES'
      Origin = 'BOLSAVALORES.IDBOLSAVALORES'
      Visible = False
    end
    object QryBolsaValoresMOECODIGO: TFloatField
      FieldName = 'MOECODIGO'
      Origin = 'BOLSAVALORES.MOECODIGO'
    end
  end
  object QryBuscaCarteira: TwwQuery
    DatabaseName = 'BaseDados'
    SQL.Strings = (
      'SELECT  IDCARTEIRAINVEST, DESCCARTINVEST '
      ''
      'FROM CM.CARTEIRAINVEST'
      ''
      'ORDER BY DESCCARTINVEST')
    ValidateWithMask = True
    Left = 76
    Top = 365
    object QryBuscaCarteiraDESCCARTINVEST: TStringField
      DisplayLabel = 'Carteira'
      DisplayWidth = 40
      FieldName = 'DESCCARTINVEST'
      Origin = 'CARTEIRAINVEST.DESCCARTINVEST'
      Size = 60
    end
    object QryBuscaCarteiraIDCARTEIRAINVEST: TFloatField
      FieldName = 'IDCARTEIRAINVEST'
      Origin = 'CARTEIRAINVEST.IDCARTEIRAINVEST'
      Visible = False
    end
  end
end
