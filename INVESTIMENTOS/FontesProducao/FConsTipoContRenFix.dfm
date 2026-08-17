inherited FrmConsTipoContRenFix: TFrmConsTipoContRenFix
  Left = 110
  Top = 39
  BorderIcons = [biSystemMenu, biMinimize]
  Caption = 'Contratos de Renda Fixa'
  ClientHeight = 512
  ClientWidth = 656
  FormStyle = fsNormal
  Visible = False
  OnCloseQuery = nil
  PixelsPerInch = 96
  TextHeight = 13
  object Label31: TLabel [0]
    Left = 520
    Top = 338
    Width = 109
    Height = 13
    Caption = 'Número Alternativo'
  end
  inherited pnlFundo: TPanel
    Top = 58
    Width = 656
    Height = 415
    object Label2: TLabel
      Left = 11
      Top = 9
      Width = 128
      Height = 13
      Caption = 'Descrição do Contrato'
      FocusControl = DbDescContrato
    end
    object DbDescContrato: TDBEdit
      Left = 11
      Top = 24
      Width = 506
      Height = 21
      DataField = 'DESCTIPOCTINVEST'
      DataSource = DsTipoContrato
      TabOrder = 0
      OnExit = DbDescContratoExit
    end
    object PageControl1: TPageControl
      Left = 5
      Top = 52
      Width = 646
      Height = 358
      ActivePage = TbEtapas
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
        TabVisible = False
        object Bevel1: TBevel
          Left = 0
          Top = 0
          Width = 638
          Height = 330
          Align = alClient
        end
        object Label11: TLabel
          Left = 10
          Top = 13
          Width = 121
          Height = 13
          Caption = 'Corretora de Valores '
        end
        object Lable1: TLabel
          Left = 10
          Top = 53
          Width = 30
          Height = 13
          Caption = 'Série'
        end
        object Label7: TLabel
          Left = 201
          Top = 53
          Width = 99
          Height = 13
          Caption = 'Lote (Certificado)'
        end
        object Label6: TLabel
          Left = 10
          Top = 94
          Width = 116
          Height = 13
          Caption = 'Data de Vencimento'
        end
        object Label15: TLabel
          Left = 201
          Top = 94
          Width = 122
          Height = 13
          Caption = 'Preço no Vencimento'
          FocusControl = DbPrecoVenc
        end
        object DbLkcBuscaCorretor: TwwDBLookupCombo
          Left = 10
          Top = 28
          Width = 363
          Height = 21
          DropDownAlignment = taLeftJustify
          Selected.Strings = (
            'SGLCORRETVALORES'#9'40'#9'Sigla da Corretora ')
          DataField = 'IDCORRETVALORES'
          DataSource = ds
          LookupTable = QryBuscaCorretora
          LookupField = 'IDCORRETVALORES'
          Options = [loColLines, loRowLines, loTitles]
          Style = csDropDownList
          TabOrder = 0
          AutoDropDown = True
          ShowButton = True
          AllowClearKey = True
          ShowMatchText = True
        end
        object DbSerie: TDBEdit
          Left = 10
          Top = 68
          Width = 184
          Height = 21
          DataField = 'SERIE'
          DataSource = ds
          TabOrder = 1
          OnExit = DbSerieExit
        end
        object DbIdLote: TDBEdit
          Left = 201
          Top = 110
          Width = 172
          Height = 21
          DataField = 'PRECOVENCIM'
          DataSource = ds
          TabOrder = 4
          OnKeyPress = DbIdLoteKeyPress
        end
        object DbDtVencimento: TCMDateTimePicker
          Left = 10
          Top = 110
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
          TabOrder = 3
          OnExit = DbDtVencimentoExit
        end
        object DbPrecoVenc: TDBEdit
          Left = 201
          Top = 68
          Width = 172
          Height = 21
          Color = clWhite
          DataField = 'IDLOTE'
          DataSource = ds
          TabOrder = 2
        end
      end
      object TbDadosTitulo: TTabSheet
        Caption = 'Dados do Titulo'
        object Bevel3: TBevel
          Left = 0
          Top = 0
          Width = 638
          Height = 330
          Align = alClient
        end
        object Label21: TLabel
          Left = 546
          Top = 245
          Width = 87
          Height = 39
          Alignment = taCenter
          AutoSize = False
          Caption = 'O B S E R V A Ç Õ E S'
          Color = 16777088
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -8
          Font.Name = 'MS Sans Serif'
          Font.Style = [fsBold]
          ParentColor = False
          ParentFont = False
          WordWrap = True
        end
        object Label10: TLabel
          Left = 8
          Top = 4
          Width = 86
          Height = 13
          Caption = 'Tipo de Título '
        end
        object Label14: TLabel
          Left = 511
          Top = 3
          Width = 48
          Height = 13
          Caption = 'Emissor '
        end
        object Label16: TLabel
          Left = 144
          Top = 80
          Width = 108
          Height = 13
          Caption = 'Moeda de Registro'
        end
        object Label17: TLabel
          Left = 267
          Top = 41
          Width = 118
          Height = 13
          Caption = 'Descrição do Título '
        end
        object Label18: TLabel
          Left = 376
          Top = 4
          Width = 99
          Height = 13
          Caption = 'Número de Série '
        end
        object Label19: TLabel
          Left = 320
          Top = 80
          Width = 107
          Height = 13
          Caption = 'Emissão do Título '
        end
        object Label20: TLabel
          Left = 513
          Top = 80
          Width = 123
          Height = 13
          Caption = 'Vencimento do Título'
        end
        object Label22: TLabel
          Left = 276
          Top = 122
          Width = 102
          Height = 13
          Caption = 'Data Inicio Indice'
        end
        object Label23: TLabel
          Left = 127
          Top = 122
          Width = 117
          Height = 13
          Caption = 'Indexador do Título '
        end
        object Label24: TLabel
          Left = 8
          Top = 161
          Width = 48
          Height = 13
          Caption = '% Juros '
        end
        object Label25: TLabel
          Left = 109
          Top = 161
          Width = 85
          Height = 13
          Caption = 'Taxa de Juros '
        end
        object Label26: TLabel
          Left = 276
          Top = 161
          Width = 88
          Height = 13
          Caption = 'Inicio do Juros '
        end
        object Label27: TLabel
          Left = 8
          Top = 200
          Width = 39
          Height = 13
          Caption = 'Prêmio'
        end
        object Label28: TLabel
          Left = 109
          Top = 200
          Width = 93
          Height = 13
          Caption = 'Taxa de Prêmio '
        end
        object Label29: TLabel
          Left = 8
          Top = 122
          Width = 109
          Height = 13
          Caption = 'Número Alternativo'
        end
        object Label30: TLabel
          Left = 398
          Top = 200
          Width = 99
          Height = 13
          Caption = 'Valor no Resgate'
        end
        object LbCustodiante: TLabel
          Left = 8
          Top = 41
          Width = 68
          Height = 13
          Caption = 'Custodiante'
        end
        object Image1: TImage
          Left = 583
          Top = 272
          Width = 13
          Height = 13
          AutoSize = True
          Picture.Data = {
            07544269746D6170DE000000424DDE0000000000000076000000280000000D00
            00000D0000000100040000000000680000000000000000000000100000001000
            0000000000000000BF0000BF000000BFBF00BF000000BF00BF00BFBF0000C0C0
            C000808080000000FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFF
            FF00777777777777700077777777777770007777770777777000777770607777
            7000777706660777700077706666607770007706666666077000700006660000
            7000777706660777700077770666077770007777066607777000777700000777
            70007777777777777000}
          Transparent = True
        end
        object Label3: TLabel
          Left = 8
          Top = 80
          Width = 99
          Height = 13
          Caption = 'Lote (Certificado)'
        end
        object LbPrazo: TLabel
          Left = 439
          Top = 80
          Width = 18
          Height = 13
          Caption = 'DC'
        end
        object Label4: TLabel
          Left = 276
          Top = 200
          Width = 84
          Height = 13
          Caption = 'Valor do Titulo'
        end
        object LbPerInd: TLabel
          Left = 520
          Top = 122
          Width = 101
          Height = 13
          Caption = 'Percentual Índice'
        end
        object Label12: TLabel
          Left = 400
          Top = 162
          Width = 51
          Height = 13
          Caption = 'Carência'
        end
        object Label32: TLabel
          Left = 520
          Top = 200
          Width = 78
          Height = 13
          Caption = 'Periodicidade'
        end
        object Label33: TLabel
          Left = 8
          Top = 242
          Width = 64
          Height = 13
          Caption = 'Aniversário'
        end
        object Label34: TLabel
          Left = 520
          Top = 162
          Width = 100
          Height = 13
          Caption = 'Data de Carência'
        end
        object Label35: TLabel
          Left = 231
          Top = 242
          Width = 143
          Height = 13
          Caption = 'Carteira de Investimento '
        end
        object Label36: TLabel
          Left = 398
          Top = 242
          Width = 85
          Height = 13
          Caption = 'Qtd. Comprada'
        end
        object DbLkcTipTit: TwwDBLookupCombo
          Left = 8
          Top = 18
          Width = 361
          Height = 21
          DropDownAlignment = taLeftJustify
          Selected.Strings = (
            'DESCTIPRENFIXA'#9'40'#9'Tipo de Titulo'
            'CODTIPRENFIXA'#9'10'#9'Código')
          DataField = 'CODTIPRENFIXA'
          DataSource = DsSubTipo
          LookupTable = QryTipTit
          LookupField = 'CODTIPRENFIXA'
          Options = [loColLines, loRowLines, loTitles]
          TabOrder = 0
          AutoDropDown = True
          ShowButton = True
          AllowClearKey = False
          OnChange = DbLkcTipTitChange
        end
        object DbLkcEmissor: TwwDBLookupCombo
          Left = 511
          Top = 18
          Width = 121
          Height = 21
          DropDownAlignment = taLeftJustify
          Selected.Strings = (
            'SIGLAEMISSOR'#9'40'#9'Sigla do Emissor ')
          DataField = 'IDEMISSOR'
          DataSource = DsTitlulo
          LookupTable = QryEmissor
          LookupField = 'IDEMISSOR'
          Options = [loColLines, loRowLines, loTitles]
          Style = csDropDownList
          TabOrder = 2
          AutoDropDown = True
          ShowButton = True
          AllowClearKey = True
          ShowMatchText = True
          OnChange = DbLkcEmissorChange
        end
        object DbLkcMoeda: TwwDBLookupCombo
          Left = 144
          Top = 96
          Width = 171
          Height = 21
          DropDownAlignment = taLeftJustify
          Selected.Strings = (
            'MOEDESC'#9'40'#9'Moeda')
          DataField = 'IDMOEDACONTAB'
          DataSource = DsTitlulo
          LookupTable = QryMoeda
          LookupField = 'MOECODIGO'
          Options = [loColLines, loRowLines, loTitles]
          Color = clBtnFace
          Enabled = False
          TabOrder = 7
          AutoDropDown = True
          ShowButton = True
          AllowClearKey = False
        end
        object DBEdit1: TDBEdit
          Left = 267
          Top = 56
          Width = 365
          Height = 21
          DataField = 'DESCINVESTIMENTO'
          DataSource = DsTitlulo
          TabOrder = 4
        end
        object DbEdit2: TDBEdit
          Left = 376
          Top = 18
          Width = 125
          Height = 21
          DataField = 'SERIETITRENFIX'
          DataSource = DsSubTipo
          TabOrder = 1
        end
        object DBDateEdit1: TCMDateTimePicker
          Left = 320
          Top = 96
          Width = 113
          Height = 21
          CalendarAttributes.Font.Charset = DEFAULT_CHARSET
          CalendarAttributes.Font.Color = clWindowText
          CalendarAttributes.Font.Height = -11
          CalendarAttributes.Font.Name = 'MS Sans Serif'
          CalendarAttributes.Font.Style = []
          ButtonStyle = cbsCustom
          DataField = 'DATAEMTITRENFIX'
          DataSource = DsSubTipo
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
          TabOrder = 8
          OnExit = DBDateEdit1Exit
        end
        object DBDateEdit2: TCMDateTimePicker
          Left = 520
          Top = 96
          Width = 113
          Height = 21
          CalendarAttributes.Font.Charset = DEFAULT_CHARSET
          CalendarAttributes.Font.Color = clWindowText
          CalendarAttributes.Font.Height = -11
          CalendarAttributes.Font.Name = 'MS Sans Serif'
          CalendarAttributes.Font.Style = []
          ButtonStyle = cbsCustom
          DataField = 'DATAVENCTITRENFIX'
          DataSource = DsSubTipo
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
          TabOrder = 10
          OnChange = DBDateEdit2Change
          OnExit = DBDateEdit2Exit
        end
        object DBDateEdit4: TCMDateTimePicker
          Left = 276
          Top = 136
          Width = 113
          Height = 21
          CalendarAttributes.Font.Charset = DEFAULT_CHARSET
          CalendarAttributes.Font.Color = clWindowText
          CalendarAttributes.Font.Height = -11
          CalendarAttributes.Font.Name = 'MS Sans Serif'
          CalendarAttributes.Font.Style = []
          ButtonStyle = cbsCustom
          DataField = 'DATABASEINDRENFIX'
          DataSource = DsSubTipo
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
          TabOrder = 13
        end
        object DbLkcIndexTit: TwwDBLookupCombo
          Left = 127
          Top = 136
          Width = 141
          Height = 21
          DropDownAlignment = taLeftJustify
          Selected.Strings = (
            'MOEDESC'#9'40'#9'Moeda')
          DataField = 'INDEXRENFIX'
          DataSource = DsSubTipo
          LookupTable = QryMoeda
          LookupField = 'MOECODIGO'
          Options = [loColLines, loRowLines, loTitles]
          Style = csDropDownList
          TabOrder = 12
          AutoDropDown = True
          ShowButton = True
          AllowClearKey = True
          OnExit = DbLkcIndexTitExit
        end
        object DBEdit3: TDBEdit
          Left = 8
          Top = 176
          Width = 94
          Height = 21
          DataField = 'JUROSRENFIX'
          DataSource = DsSubTipo
          TabOrder = 15
          OnKeyPress = DBEdit3KeyPress
        end
        object DbLkcTipoJuros: TwwDBLookupCombo
          Left = 109
          Top = 176
          Width = 159
          Height = 21
          DropDownAlignment = taLeftJustify
          Selected.Strings = (
            'DESCTIPJUROS'#9'40'#9'Tipo de Juros ')
          DataField = 'CODTIPTXJUROS'
          DataSource = DsSubTipo
          LookupTable = QryTipoJuros
          LookupField = 'CODTIPTXJUROS'
          Options = [loColLines, loRowLines, loTitles]
          TabOrder = 16
          AutoDropDown = True
          ShowButton = True
          AllowClearKey = True
          OnExit = DbLkcTipoJurosExit
        end
        object DBDateEdit3: TCMDateTimePicker
          Left = 276
          Top = 175
          Width = 113
          Height = 21
          CalendarAttributes.Font.Charset = DEFAULT_CHARSET
          CalendarAttributes.Font.Color = clWindowText
          CalendarAttributes.Font.Height = -11
          CalendarAttributes.Font.Name = 'MS Sans Serif'
          CalendarAttributes.Font.Style = []
          ButtonStyle = cbsCustom
          DataField = 'DATAINIJURRENFIX'
          DataSource = DsSubTipo
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
          TabOrder = 17
        end
        object DBEdit5: TDBEdit
          Left = 8
          Top = 215
          Width = 94
          Height = 21
          DataField = 'PREMIORENFIX'
          DataSource = DsSubTipo
          TabOrder = 20
          OnKeyPress = DBEdit5KeyPress
        end
        object DbLkcTipoPremio: TwwDBLookupCombo
          Left = 109
          Top = 215
          Width = 159
          Height = 21
          DropDownAlignment = taLeftJustify
          Selected.Strings = (
            'DESCTIPJUROS'#9'40'#9'Tipo de Juros ')
          DataField = 'CODTIPTXPREMIO'
          DataSource = DsSubTipo
          LookupTable = QryTipoJuros
          LookupField = 'CODTIPTXJUROS'
          Options = [loColLines, loRowLines, loTitles]
          TabOrder = 21
          AutoDropDown = True
          ShowButton = True
          AllowClearKey = True
        end
        object DBEdit4: TDBEdit
          Left = 8
          Top = 136
          Width = 113
          Height = 21
          DataField = 'IDALTTITRENFIX'
          DataSource = DsSubTipo
          TabOrder = 11
        end
        object DBEdit6: TDBEdit
          Left = 398
          Top = 215
          Width = 113
          Height = 21
          DataField = 'VLRRESGATE'
          DataSource = DsSubTipo
          TabOrder = 23
          OnKeyPress = DBEdit6KeyPress
        end
        object Inativo: TDBCheckBox
          Left = 109
          Top = 245
          Width = 61
          Height = 17
          Caption = 'Inativo'
          DataField = 'FLGATIVO'
          DataSource = DsTitlulo
          TabOrder = 26
          ValueChecked = 'N'
          ValueUnchecked = 'S'
        end
        object DBMemo1: TDBMemo
          Left = 8
          Top = 289
          Width = 625
          Height = 38
          DataField = 'OBSINVESTIMENTO'
          DataSource = DsTitlulo
          TabOrder = 30
        end
        object DbLkcCustodiante: TwwDBLookupCombo
          Left = 8
          Top = 56
          Width = 249
          Height = 21
          DropDownAlignment = taLeftJustify
          Selected.Strings = (
            'SGLCUSTODIANTE'#9'40'#9'Custodiante')
          DataField = 'IDCUSTODIANTE'
          DataSource = DsSubTipo
          LookupTable = QryCustodiante
          LookupField = 'IDCUSTODIANTE'
          Options = [loColLines, loRowLines, loTitles]
          Style = csDropDownList
          TabOrder = 3
          AutoDropDown = True
          ShowButton = True
          AllowClearKey = True
          ShowMatchText = True
        end
        object DBEdit7: TDBEdit
          Left = 8
          Top = 96
          Width = 106
          Height = 21
          Color = clWhite
          DataField = 'IDLOTE'
          DataSource = ds
          TabOrder = 5
          OnChange = DBEdit7Change
          OnExit = DBEdit7Exit
        end
        object DbEdPrazo: TDBEdit
          Left = 439
          Top = 96
          Width = 76
          Height = 21
          DataField = 'PRZVENC'
          DataSource = ds
          TabOrder = 9
          OnExit = DbEdPrazoExit
        end
        object DBEdit8: TDBEdit
          Left = 276
          Top = 215
          Width = 113
          Height = 21
          DataField = 'VLRCOMPRATITLOTE'
          DataSource = ds
          TabOrder = 22
          OnExit = DBEdit8Exit
          OnKeyPress = DBEdit6KeyPress
        end
        object DbEdPerInd: TDBEdit
          Left = 520
          Top = 135
          Width = 113
          Height = 21
          DataField = 'PERCINDEX'
          DataSource = DsSubTipo
          TabOrder = 14
          OnExit = DBEdit8Exit
          OnKeyPress = DBEdit6KeyPress
        end
        object ChkSaque: TDBCheckBox
          Left = 109
          Top = 264
          Width = 108
          Height = 17
          Caption = 'Saque Parcial'
          DataField = 'FLGSAQUEPARCIAL'
          DataSource = DsSubTipo
          TabOrder = 27
          ValueChecked = 'S'
          ValueUnchecked = 'N'
        end
        object edtCarencia: TDBEdit
          Left = 400
          Top = 176
          Width = 113
          Height = 21
          DataField = 'CARENCIA'
          DataSource = DsSubTipo
          TabOrder = 18
        end
        object edtAniversario: TDBEdit
          Left = 8
          Top = 258
          Width = 94
          Height = 21
          Color = clWhite
          DataField = 'ANIVERSARIO'
          DataSource = ds
          TabOrder = 25
          OnChange = DBEdit7Change
          OnExit = DBEdit7Exit
        end
        object DBDateEdit5: TCMDateTimePicker
          Left = 520
          Top = 176
          Width = 113
          Height = 21
          CalendarAttributes.Font.Charset = DEFAULT_CHARSET
          CalendarAttributes.Font.Color = clWindowText
          CalendarAttributes.Font.Height = -11
          CalendarAttributes.Font.Name = 'MS Sans Serif'
          CalendarAttributes.Font.Style = []
          ButtonStyle = cbsCustom
          DataField = 'DATACARENCIA'
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
          TabOrder = 19
          OnExit = DBDateEdit1Exit
        end
        object DbLkcCarteira: TwwDBLookupCombo
          Left = 231
          Top = 258
          Width = 159
          Height = 21
          Ctl3D = True
          DropDownAlignment = taLeftJustify
          Selected.Strings = (
            'DESCCARTINVEST'#9'40'#9'Carteira de Investimento')
          DataField = 'IDCARTLASTRO'
          DataSource = ds
          LookupTable = QryBuscaCarteira
          LookupField = 'IDCARTEIRAINVEST'
          Options = [loColLines, loRowLines, loTitles]
          ParentCtl3D = False
          TabOrder = 28
          AutoDropDown = True
          ShowButton = True
          AllowClearKey = False
          ShowMatchText = True
        end
        object DBEdit9: TDBEdit
          Left = 398
          Top = 258
          Width = 114
          Height = 21
          DataField = 'QTDECOMPRATITLOTE'
          DataSource = ds
          TabOrder = 29
          OnKeyPress = DBEdit6KeyPress
        end
        object BtNovoDoc: TBitBtn
          Left = 116
          Top = 96
          Width = 23
          Height = 22
          Hint = 'Gera Número do Lote'
          ParentShowHint = False
          ShowHint = True
          TabOrder = 6
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
        object DbLkpPeriodicidade: TwwDBLookupCombo
          Left = 520
          Top = 215
          Width = 113
          Height = 21
          DropDownAlignment = taLeftJustify
          Selected.Strings = (
            'NOME'#9'30'#9'NOME'
            'IDTPPERIODICIDADE'#9'10'#9'IDTPPERIODICIDADE')
          DataField = 'PERIODICIDADE'
          DataSource = DsSubTipo
          LookupTable = qryTpPeriodicidade
          LookupField = 'IDTPPERIODICIDADE'
          Options = [loColLines, loRowLines, loTitles]
          Style = csDropDownList
          TabOrder = 24
          AutoDropDown = True
          ShowButton = True
          AllowClearKey = True
          ShowMatchText = True
          OnChange = DbLkcEmissorChange
        end
      end
      object TbOutrosDados: TTabSheet
        Caption = 'Outros Dados do Título'
        object Bevel2: TBevel
          Left = 0
          Top = 0
          Width = 638
          Height = 330
          Align = alClient
        end
        object LblPzAnbid: TLabel
          Left = 12
          Top = 123
          Width = 75
          Height = 13
          Caption = 'Prazo ANBID'
          Visible = False
        end
        object LblPzTJLP: TLabel
          Left = 92
          Top = 123
          Width = 66
          Height = 13
          Caption = 'Prazo TJLP'
          Visible = False
        end
        object LblDtIniTR: TLabel
          Left = 164
          Top = 123
          Width = 53
          Height = 13
          Caption = 'Inicio TR'
          Visible = False
        end
        object DBDateEditDtIniTR: TCMDateTimePicker
          Left = 164
          Top = 137
          Width = 114
          Height = 21
          CalendarAttributes.Font.Charset = DEFAULT_CHARSET
          CalendarAttributes.Font.Color = clWindowText
          CalendarAttributes.Font.Height = -11
          CalendarAttributes.Font.Name = 'MS Sans Serif'
          CalendarAttributes.Font.Style = []
          ButtonStyle = cbsCustom
          DataField = 'DATAINITR'
          DataSource = DsSubTipo
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
          Visible = False
        end
        object DBEditPzAnbid: TDBEdit
          Left = 12
          Top = 137
          Width = 58
          Height = 21
          DataField = 'DIASPRAZOANBID'
          DataSource = DsSubTipo
          TabOrder = 1
          Visible = False
          OnExit = DBEdit8Exit
          OnKeyPress = DBEdit6KeyPress
        end
        object DBEditPzTJLP: TDBEdit
          Left = 92
          Top = 137
          Width = 58
          Height = 21
          DataField = 'DIASPRAZOANBID2'
          DataSource = DsSubTipo
          TabOrder = 2
          Visible = False
          OnExit = DBEdit8Exit
          OnKeyPress = DBEdit6KeyPress
        end
        object GroupBox1: TGroupBox
          Left = 4
          Top = 8
          Width = 405
          Height = 105
          Caption = 'Segundo Indexador'
          TabOrder = 3
          object Label37: TLabel
            Left = 8
            Top = 19
            Width = 117
            Height = 13
            Caption = 'Indexador do Título '
          end
          object Label41: TLabel
            Left = 8
            Top = 58
            Width = 85
            Height = 13
            Caption = 'Taxa de Juros '
          end
          object Label42: TLabel
            Left = 159
            Top = 58
            Width = 88
            Height = 13
            Caption = 'Inicio do Juros '
          end
          object Label38: TLabel
            Left = 159
            Top = 19
            Width = 102
            Height = 13
            Caption = 'Data Inicio Indice'
          end
          object Label39: TLabel
            Left = 282
            Top = 19
            Width = 62
            Height = 13
            Caption = 'Percentual'
          end
          object Label40: TLabel
            Left = 282
            Top = 58
            Width = 48
            Height = 13
            Caption = '% Juros '
          end
          object DbLkcIndexTit2: TwwDBLookupCombo
            Left = 8
            Top = 33
            Width = 141
            Height = 21
            DropDownAlignment = taLeftJustify
            Selected.Strings = (
              'MOEDESC'#9'40'#9'Moeda')
            DataField = 'INDEXRENFIX2'
            DataSource = DsSubTipo
            LookupTable = QryMoeda
            LookupField = 'MOECODIGO'
            Options = [loColLines, loRowLines, loTitles]
            Style = csDropDownList
            TabOrder = 0
            AutoDropDown = True
            ShowButton = True
            AllowClearKey = True
            OnExit = DbLkcIndexTit2Exit
          end
          object wwDBLookupCombo2: TwwDBLookupCombo
            Left = 8
            Top = 73
            Width = 141
            Height = 21
            DropDownAlignment = taLeftJustify
            Selected.Strings = (
              'DESCTIPJUROS'#9'40'#9'Tipo de Juros ')
            DataField = 'CODTIPTXJUROS2'
            DataSource = DsSubTipo
            LookupTable = QryTipoJuros
            LookupField = 'CODTIPTXJUROS'
            Options = [loColLines, loRowLines, loTitles]
            TabOrder = 1
            AutoDropDown = True
            ShowButton = True
            AllowClearKey = True
            OnExit = DbLkcTipoJurosExit
          end
          object DBDateEdit7: TCMDateTimePicker
            Left = 159
            Top = 73
            Width = 113
            Height = 21
            CalendarAttributes.Font.Charset = DEFAULT_CHARSET
            CalendarAttributes.Font.Color = clWindowText
            CalendarAttributes.Font.Height = -11
            CalendarAttributes.Font.Name = 'MS Sans Serif'
            CalendarAttributes.Font.Style = []
            ButtonStyle = cbsCustom
            DataField = 'DATAINIJURRENFIX2'
            DataSource = DsSubTipo
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
          object DBDateEdit6: TCMDateTimePicker
            Left = 159
            Top = 33
            Width = 113
            Height = 21
            CalendarAttributes.Font.Charset = DEFAULT_CHARSET
            CalendarAttributes.Font.Color = clWindowText
            CalendarAttributes.Font.Height = -11
            CalendarAttributes.Font.Name = 'MS Sans Serif'
            CalendarAttributes.Font.Style = []
            ButtonStyle = cbsCustom
            DataField = 'DATABASEINDRENFX2'
            DataSource = DsSubTipo
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
          object DbEdPerInd2: TDBEdit
            Left = 282
            Top = 33
            Width = 113
            Height = 21
            DataField = 'PERCINDEX2'
            DataSource = DsSubTipo
            TabOrder = 4
            OnExit = DBEdit8Exit
            OnKeyPress = DBEdit6KeyPress
          end
          object DBEdit11: TDBEdit
            Left = 282
            Top = 73
            Width = 113
            Height = 21
            DataField = 'JUROSRENFIX2'
            DataSource = DsSubTipo
            TabOrder = 5
            OnExit = DbLkcTipoJurosExit
            OnKeyPress = DBEdit3KeyPress
          end
        end
      end
      object TbEtapas: TTabSheet
        Caption = 'Etapas do Contrato'
        object Panel1: TPanel
          Left = 0
          Top = 31
          Width = 638
          Height = 299
          Align = alClient
          BevelInner = bvLowered
          TabOrder = 2
          object Label1: TLabel
            Left = 18
            Top = 6
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
            Left = 46
            Top = 48
            Width = 417
            Height = 149
            BevelOuter = bvNone
            TabOrder = 0
            Visible = False
            object Label5: TLabel
              Left = 28
              Top = 6
              Width = 103
              Height = 13
              Caption = 'Tipo de Operação'
            end
            object Label8: TLabel
              Left = 28
              Top = 46
              Width = 143
              Height = 13
              Caption = 'Regra Data de Operação'
            end
            object Label9: TLabel
              Left = 28
              Top = 86
              Width = 145
              Height = 13
              Caption = 'Regra Valor da Operação'
            end
            object dblcTipoOper: TwwDBLookupCombo
              Left = 28
              Top = 22
              Width = 361
              Height = 21
              DropDownAlignment = taLeftJustify
              Selected.Strings = (
                'DESCTIPOOPERACAO'#9'40'#9'Tipo de Operação'
                'DESCMERCADO'#9'40'#9'Mercado ')
              DataField = 'IDTIPOOPERACAO'
              DataSource = DsEtapas
              LookupTable = QryTipoOperacao
              LookupField = 'IDTIPOOPERACAO'
              Options = [loColLines, loRowLines, loTitles]
              Enabled = False
              TabOrder = 0
              AutoDropDown = True
              ShowButton = True
              AllowClearKey = False
            end
            object DBLkRegraData: TwwDBLookupCombo
              Left = 28
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
              TabOrder = 1
              AutoDropDown = True
              ShowButton = True
              AllowClearKey = True
              OnChange = DBLkRegraDataChange
            end
            object DBLKRegraValor: TwwDBLookupCombo
              Left = 28
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
              TabOrder = 2
              AutoDropDown = True
              ShowButton = True
              AllowClearKey = True
              OnChange = DBLKRegraValorChange
            end
            object bbtnRegraValor: TBitBtn
              Left = 364
              Top = 100
              Width = 25
              Height = 24
              Hint = 'Descrição dos Passos da Regra'
              ParentShowHint = False
              ShowHint = True
              TabOrder = 3
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
              Left = 364
              Top = 60
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
          end
          object bbtnOkDet: TBitBtn
            Left = 327
            Top = 270
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
            Left = 310
            Top = 197
            Width = 95
            Height = 30
            Cancel = True
            Caption = ' &Voltar'
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
          Width = 638
          Height = 299
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
          Width = 638
          Height = 31
          AllowDrag = False
          BoundLines = [blTop, blBottom, blLeft, blRight]
          object Label13: TLabel
            Left = 38
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
            Left = 511
            Top = 0
            Width = 129
            Height = 29
            BevelInner = bvLowered
            Caption = '`'
            TabOrder = 1
            object BtExecutarOperacao: TBitBtn
              Left = 3
              Top = 2
              Width = 123
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
          end
        end
      end
    end
  end
  inherited Dock972: TDock97
    Width = 656
    Height = 58
    inherited Toolbar971: TToolbar97
      inherited sbtnInserir: TToolbarButton97
        Width = 67
        Height = 52
      end
      inherited sbtnAlterar: TToolbarButton97
        Left = 67
        Width = 67
        Height = 52
      end
      inherited sbtnProcurar: TToolbarButton97
        Left = 201
        Width = 67
        Height = 52
        Caption = '&Procurar Contrato'
        WordWrap = True
      end
      inherited sbtnApagar: TToolbarButton97
        Left = 134
        Width = 67
        Height = 52
      end
      object BtProcOperacao: TToolbarButton97
        Left = 268
        Top = 0
        Width = 67
        Height = 52
        AllowAllUp = True
        GroupIndex = 1
        Caption = 'Procurar &Operação'
        Glyph.Data = {
          76010000424D7601000000000000760000002800000020000000100000000100
          0400000000000001000000000000000000001000000010000000000000000000
          800000800000008080008000000080008000808000007F7F7F00BFBFBF000000
          FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF0033333CCCCC33
          33333FFFF77777FFFFFFCCCCCC808CCCCCC3777777F7F777777F008888070888
          8003777777777777777F0F0770F7F0770F0373F33337F333337370FFFFF7FFFF
          F07337F33337F33337F370FFFB99FBFFF07337F33377F33337F330FFBF99BFBF
          F033373F337733333733370BFBF7FBFB0733337F333FF3337F33370FBF98BFBF
          0733337F3377FF337F333B0BFB990BFB03333373FF777FFF73333FB000B99000
          B33333377737777733333BFBFBFB99FBF33333333FF377F333333FBF99BF99BF
          B333333377F377F3333333FB99FB99FB3333333377FF77333333333FB9999FB3
          333333333777733333333333FBFBFB3333333333333333333333}
        Layout = blGlyphTop
        NumGlyphs = 2
        Opaque = False
        Spacing = 0
        WordWrap = True
        OnClick = BtProcOperacaoClick
      end
    end
  end
  inherited Dock971: TDock97
    Top = 473
    Width = 656
    inherited tb97Fundo: TToolbar97
      Left = 188
      DockPos = 188
    end
    inherited TB97oKCancelar: TToolbar97
      Left = 20
      DockPos = 20
      inherited bbtnCancelar: TBitBtn
        ModalResult = 0
      end
    end
  end
  inherited qry: TwwQuery
    AfterScroll = qryAfterScroll
    SQL.Strings = (
      
        'SELECT '#9'CIN.IDCONTRATOINVEST, CIN.IDTIPOCONTRINVEST, CIN.IDINVES' +
        'TIMENTO,'
      
        '        CIN.IDEMISSOR,    CIN.IDCORRETVALORES, CIN.IDBOLSAVALORE' +
        'S, CIN.SERIE,'
      
        '        CIN.IDLOTE,       CIN.DATACOMPRALOTE,  CIN.DATAVENCIM,  ' +
        '   CIN.VLRCOMPRATITLOTE,'
      
        '        CIN.PRECOVENCIM,  CIN.QTDETITLOTE,     CIN.SALDOTITLOTE,' +
        '   CIN.VLRRESGATE,'
      
        '        CIN.PRZVENC,      CIN.DATACARENCIA,    CIN.ANIVERSARIO, ' +
        '   CIN.QTDECOMPRATITLOTE,'
      
        '        CIN.IDCARTAVISTA, CIN.IDCARTLASTRO,    CIN.IDCONTRATOMES' +
        'TRE, INV.IDTIPOINVEST'
      ''
      'FROM CM.CONTRATOINVESTIM CIN, CM.INVESTIMENTO INV'
      ''
      'WHERE '#9'INV.IDTIPOINVEST   = 1 AND'
      #9'CIN.IDINVESTIMENTO = INV.IDINVESTIMENTO')
    Left = 210
    Top = 3
    object qryIDCONTRATOINVEST: TFloatField
      FieldName = 'IDCONTRATOINVEST'
      Origin = '"CM.CONTRATOINVESTIM".IDCONTRATOINVEST'
    end
    object qryIDTIPOCONTRINVEST: TFloatField
      FieldName = 'IDTIPOCONTRINVEST'
      Origin = '"CM.CONTRATOINVESTIM".IDTIPOCONTRINVEST'
    end
    object qryIDINVESTIMENTO: TFloatField
      FieldName = 'IDINVESTIMENTO'
      Origin = '"CM.CONTRATOINVESTIM".IDINVESTIMENTO'
    end
    object qryIDEMISSOR: TFloatField
      FieldName = 'IDEMISSOR'
      Origin = '"CM.CONTRATOINVESTIM".IDEMISSOR'
    end
    object qryIDCORRETVALORES: TFloatField
      FieldName = 'IDCORRETVALORES'
      Origin = '"CM.CONTRATOINVESTIM".IDCORRETVALORES'
    end
    object qryIDBOLSAVALORES: TFloatField
      FieldName = 'IDBOLSAVALORES'
      Origin = '"CM.CONTRATOINVESTIM".IDBOLSAVALORES'
    end
    object qrySERIE: TStringField
      FieldName = 'SERIE'
      Origin = '"CM.CONTRATOINVESTIM".SERIE'
      Size = 60
    end
    object qryIDLOTE: TStringField
      FieldName = 'IDLOTE'
      Origin = '"CM.CONTRATOINVESTIM".IDLOTE'
      Size = 10
    end
    object qryDATACOMPRALOTE: TDateTimeField
      FieldName = 'DATACOMPRALOTE'
      Origin = '"CM.CONTRATOINVESTIM".DATACOMPRALOTE'
    end
    object qryDATAVENCIM: TDateTimeField
      FieldName = 'DATAVENCIM'
      Origin = '"CM.CONTRATOINVESTIM".DATAVENCIM'
    end
    object qryVLRCOMPRATITLOTE: TFloatField
      FieldName = 'VLRCOMPRATITLOTE'
      Origin = '"CM.CONTRATOINVESTIM".VLRCOMPRATITLOTE'
      DisplayFormat = '###,###,###,###,###,##0.00'
      EditFormat = '###############0.00'
    end
    object qryPRECOVENCIM: TFloatField
      FieldName = 'PRECOVENCIM'
      Origin = '"CM.CONTRATOINVESTIM".PRECOVENCIM'
      DisplayFormat = '###,###,###,##0.00'
    end
    object qryQTDETITLOTE: TFloatField
      FieldName = 'QTDETITLOTE'
      Origin = '"CM.CONTRATOINVESTIM".QTDETITLOTE'
      DisplayFormat = '###,###,###,###,###,###.############'
      EditFormat = '##################.############'
    end
    object qrySALDOTITLOTE: TFloatField
      FieldName = 'SALDOTITLOTE'
      Origin = '"CM.CONTRATOINVESTIM".SALDOTITLOTE'
    end
    object qryVLRRESGATE: TFloatField
      FieldName = 'VLRRESGATE'
      Origin = '"CM.CONTRATOINVESTIM".VLRRESGATE'
      DisplayFormat = '###,###,###,##0.00'
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
    object qryIDTIPOINVEST: TFloatField
      FieldName = 'IDTIPOINVEST'
      Origin = '"CM.INVESTIMENTO".IDTIPOINVEST'
    end
    object qryPRZVENC: TFloatField
      FieldName = 'PRZVENC'
      Origin = 'CONTRATOINVESTIM.PRZVENC'
    end
    object qryDATACARENCIA: TDateTimeField
      FieldName = 'DATACARENCIA'
      Origin = 'CONTRATOINVESTIM.DATACARENCIA'
    end
    object qryANIVERSARIO: TFloatField
      FieldName = 'ANIVERSARIO'
      Origin = 'CONTRATOINVESTIM.ANIVERSARIO'
    end
    object qryQTDECOMPRATITLOTE: TFloatField
      FieldName = 'QTDECOMPRATITLOTE'
      Origin = '"CM.CONTRATOINVESTIM".QTDECOMPRATITLOTE'
      DisplayFormat = '###,###,###,###,###,###.############'
      EditFormat = '##################.############'
    end
    object qryIDCARTAVISTA: TFloatField
      FieldName = 'IDCARTAVISTA'
      Origin = '"CM.CONTRATOINVESTIM".IDCARTAVISTA'
    end
    object qryIDCARTLASTRO: TFloatField
      FieldName = 'IDCARTLASTRO'
      Origin = '"CM.CONTRATOINVESTIM".IDCARTLASTRO'
    end
    object qryIDCONTRATOMESTRE: TFloatField
      FieldName = 'IDCONTRATOMESTRE'
      Origin = 'CONTRATOINVESTIM.IDCONTRATOMESTRE'
    end
  end
  inherited ivTradutor: TIvExtendedTranslator
    Left = 274
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
      '  PRZVENC = :PRZVENC,'
      '  DATACARENCIA = :DATACARENCIA,'
      '  ANIVERSARIO = :ANIVERSARIO,'
      '  QTDECOMPRATITLOTE = :QTDECOMPRATITLOTE,'
      '  IDCARTAVISTA = :IDCARTAVISTA,'
      '  IDCARTLASTRO = :IDCARTLASTRO'
      'where'
      '  IDCONTRATOINVEST = :OLD_IDCONTRATOINVEST')
    InsertSQL.Strings = (
      'insert into CM.CONTRATOINVESTIM'
      
        '  (IDCONTRATOINVEST, IDTIPOCONTRINVEST, IDINVESTIMENTO, IDEMISSO' +
        'R, IDCORRETVALORES, '
      
        '   IDBOLSAVALORES, SERIE, IDLOTE, DATACOMPRALOTE, DATAVENCIM, VL' +
        'RCOMPRATITLOTE, '
      
        '   PRECOVENCIM, QTDETITLOTE, SALDOTITLOTE, VLRRESGATE, PRZVENC, ' +
        'DATACARENCIA, '
      '   ANIVERSARIO, QTDECOMPRATITLOTE, IDCARTAVISTA, IDCARTLASTRO)'
      'values'
      
        '  (:IDCONTRATOINVEST, :IDTIPOCONTRINVEST, :IDINVESTIMENTO, :IDEM' +
        'ISSOR, '
      
        '   :IDCORRETVALORES, :IDBOLSAVALORES, :SERIE, :IDLOTE, :DATACOMP' +
        'RALOTE, '
      
        '   :DATAVENCIM, :VLRCOMPRATITLOTE, :PRECOVENCIM, :QTDETITLOTE, :' +
        'SALDOTITLOTE, '
      
        '   :VLRRESGATE, :PRZVENC, :DATACARENCIA, :ANIVERSARIO, :QTDECOMP' +
        'RATITLOTE, '
      '   :IDCARTAVISTA, :IDCARTLASTRO)')
    DeleteSQL.Strings = (
      'delete from CM.CONTRATOINVESTIM'
      'where'
      '  IDCONTRATOINVEST = :OLD_IDCONTRATOINVEST')
    Left = 177
    Top = 3
  end
  inherited MontaSelect: TMontaSelect
    Colunas.Strings = (
      'INVESTIMENTO.DESCINVESTIMENTO'
      'CONTRATOINVESTIM.IDLOTE'
      'CONTRATOINVESTIM.SERIE'
      'CONTRATOINVESTIM.DATACOMPRALOTE'
      'CONTRATOINVESTIM.DATAVENCIM'
      'TIPOCONTRINVEST.DESCTIPOCTINVEST'
      'EMISSOR.SIGLAEMISSOR'
      'CONTRATOINVESTIM.VLRCOMPRATITLOTE')
    TipodeDado.Strings = (
      'C'
      'C'
      'C'
      'D'
      'D'
      'C'
      'C'
      'N')
    Descricao.Strings = (
      'Investimento '
      'Lote'
      '# de Série'
      'Compra'
      'Vencimento'
      'Tipo de Contrato'
      'Emissor'
      'Valor do Título')
    SensivelACaixa.Strings = (
      'N'
      'N'
      'N'
      'N'
      'N'
      'N'
      'N'
      'N')
    Tabelas.Strings = (
      'CONTRATOINVESTIM'
      'INVESTIMENTO'
      'TIPOCONTRINVEST'
      'EMISSOR'
      'TITRENFIXA'
      'TIPOTITRENFIXA')
    CamposChave.Strings = (
      'CONTRATOINVESTIM.IDCONTRATOINVEST'
      'CONTRATOINVESTIM.IDTIPOCONTRINVEST')
    Filtro.Strings = (
      'CONTRATOINVESTIM.IDINVESTIMENTO=INVESTIMENTO.IDINVESTIMENTO'
      'INVESTIMENTO.IDTIPOINVEST = 1'
      
        'CONTRATOINVESTIM.IDTIPOCONTRINVEST = TIPOCONTRINVEST.IDTIPOCONTR' +
        'INVEST'
      'INVESTIMENTO.IDEMISSOR=EMISSOR.IDEMISSOR'
      'INVESTIMENTO.IDINVESTIMENTO = TITRENFIXA.IDTITRENFIXA'
      'TITRENFIXA.CODTIPRENFIXA = TIPOTITRENFIXA.CODTIPRENFIXA')
    Mascaras.Strings = (
      ''
      ''
      ''
      ''
      ''
      ''
      ''
      '###,###,###,###,##0.00')
    Larguras.Strings = (
      '40'
      '10'
      '10'
      '10'
      '10'
      '40'
      '15'
      '18')
    Left = 525
    Top = 2
  end
  inherited ds: TwwDataSource
    Left = 241
    Top = 3
  end
  inherited CmeCadastro: TCmEventosCadastro
    OnFind = CmeCadastroFind
    Left = 270
    Top = 146
  end
  object QryAux: TwwQuery
    AutoCalcFields = False
    DatabaseName = 'BaseDados'
    ValidateWithMask = True
    Left = 462
    Top = 3
  end
  object DsEtapas: TwwDataSource
    DataSet = qryEtapas
    Left = 336
    Top = 3
  end
  object ImageList1: TImageList
    Left = 431
    Top = 3
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
    Left = 494
    Top = 3
  end
  object DsEtapaAnteced: TwwDataSource
    DataSet = QryEtapaAnteced
    Left = 482
    Top = 35
  end
  object QryTipoOperacao: TwwQuery
    DatabaseName = 'BaseDados'
    SQL.Strings = (
      'SELECT '#9'T.IDTIPOOPERACAO, T.IDTIPOINVEST, T.IDMERCADO,'
      '       '#9'T.DESCTIPOOPERACAO, M.DESCMERCADO, T.NATUREZAOPERACAO'
      ''
      'FROM   '#9'CM.TIPOOPERACAO T,  CM.MERCADO M  '
      ''
      'WHERE  '#9'T.IDMERCADO = M.IDMERCADO(+)'
      ''
      'ORDER BY M.DESCMERCADO,T.DESCTIPOOPERACAO')
    ValidateWithMask = True
    Left = 353
    Top = 35
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
    Left = 304
    Top = 3
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
    Left = 418
    Top = 35
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
    Left = 410
    Top = 59
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
    Left = 450
    Top = 35
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
    SensivelACaixa.Strings = (
      'N')
    Tabelas.Strings = (
      'TIPOCONTRINVEST')
    CamposChave.Strings = (
      'IDTIPOCONTRINVEST')
    Filtro.Strings = (
      'TIPOCONTRINVEST.IDTIPOINVEST = 1 ')
    Mascaras.Strings = (
      '')
    Larguras.Strings = (
      '60')
    DataBaseName = 'BaseDados'
    RepeteConsulta = False
    UsaDistinct = False
    SalvaConsulta = False
    ExibePergunta = True
    Left = 557
    Top = 3
  end
  object QryTipoContrato: TwwQuery
    CachedUpdates = True
    DatabaseName = 'BaseDados'
    SQL.Strings = (
      'SELECT * FROM CM.TIPOCONTRINVEST')
    ValidateWithMask = True
    Left = 368
    Top = 3
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
    Left = 399
    Top = 3
  end
  object QryInvestimento: TwwQuery
    DatabaseName = 'BaseDados'
    SQL.Strings = (
      'SELECT  IDINVESTIMENTO, DESCINVESTIMENTO, IDEMISSOR '
      ''
      'FROM CM.INVESTIMENTO'
      ''
      'WHERE IDTIPOINVEST IN (1,2)'
      ''
      'ORDER BY DESCINVESTIMENTO')
    ValidateWithMask = True
    Left = 318
    Top = 35
    object QryInvestimentoIDINVESTIMENTO: TFloatField
      FieldName = 'IDINVESTIMENTO'
    end
    object QryInvestimentoDESCINVESTIMENTO: TStringField
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
    Left = 284
    Top = 35
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
    Left = 251
    Top = 35
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
  object QryTipoJuros: TwwQuery
    DatabaseName = 'BaseDados'
    SQL.Strings = (
      'SELECT CODTIPTXJUROS, DESCTIPJUROS, TAMPERJUROS,  EFETNOMI'
      ''
      'FROM TIPOJUROS '
      ''
      'ORDER BY DESCTIPJUROS')
    ValidateWithMask = True
    Left = 482
    Top = 71
  end
  object QryMoeda: TwwQuery
    DatabaseName = 'BaseDados'
    SQL.Strings = (
      'SELECT MOECODIGO, MOEDESC  '
      ''
      'FROM MOEDA '
      ''
      'ORDER BY MOEDESC')
    ValidateWithMask = True
    Left = 450
    Top = 71
  end
  object QryTipTit: TwwQuery
    AfterScroll = QryTipTitAfterScroll
    DatabaseName = 'BaseDados'
    SQL.Strings = (
      
        'SELECT  TIP.CODTIPRENFIXA, TIP.DESCTIPRENFIXA, TIP.IDMOEDAREG, T' +
        'IP.IDREGRACALCAGIO, TIP.FLGSERTITFIX, '
      
        #9'TIP.FLGIDALTTITFIX, TIP.FLGDTEMITITFIX, TIP.FLGDTVENCTITFIX, TI' +
        'P.FLGINDREAJFIX, '
      
        #9'TIP.FLGDTINIJURFIX, TIP.FLGDTBASEINDFIX, TIP.FLGJURFIX, TIP.FLG' +
        'CODTPTXJUR, TIP.FLGPREMIOFIX, '
      
        #9'TIP.FLGCODTPTXPRE, TIP.FLGVLRAGIOOPER, TIP.FLGIDLOTEFIX, TIP.FL' +
        'GDTCOMPRALOTE, TIP.FLGQTDTITLOTE, '
      
        #9'TIP.FLGSLDTITLOTE, TIP.FLGVLRCOMPLOTE, TIP.FLGINDSWAPFIX, TIP.T' +
        'RGDTINCLUSAO, TIP.TRGUSERINCLUSAO, '
      
        #9'TIP.CODTIPTXJUROS, TIP.FLGDIASCOMPRA, TIP.FLGDIASVENDA, TIP.IDC' +
        'LASSETIT, TIP.FLGPU, '
      
        #9'TIP.DIASCOMPRA, TIP.DIASVENDA, TIP.FLLGPRORATA, TIP.FLGINTERPOL' +
        'A, TIP.IDCUSTODIANTE, '
      
        #9'TIP.FLGPERCINDEX, TIP.PERCINDEX, TIP.FLGINSTFIN, TIP.FLGCARENCI' +
        'A, TIP.FLGPERIODICIDADE, '
      
        #9'TIP.FLGANIVERSARIO, TIP.IDTRATAIND, TIP.NUMCASASDEC, TIP.FLGDTI' +
        'NITR, TIP.FLGINDICE2 ,'
      '                TIP.IDTRATAIND,TRA.CODTRATAIND'
      ''
      'FROM CM.TIPOTITRENFIXA TIP , CM.TRATAINDICE TRA'
      ''
      'WHERE (TIP.IDCLASSETIT = :IDCLASSETIT)  AND'
      '               (TIP.IDTRATAIND  = TRA.IDTRATAIND(+))          '
      ''
      'ORDER BY TIP.DESCTIPRENFIXA')
    ValidateWithMask = True
    Left = 444
    Top = 159
    ParamData = <
      item
        DataType = ftInteger
        Name = 'IDCLASSETIT'
        ParamType = ptUnknown
      end>
  end
  object QryEmissor: TwwQuery
    DatabaseName = 'BaseDados'
    SQL.Strings = (
      'SELECT IDEMISSOR, SIGLAEMISSOR'
      ''
      'FROM EMISSOR '
      ''
      'ORDER BY SIGLAEMISSOR')
    ValidateWithMask = True
    Left = 445
    Top = 303
    object QryEmissorIDEMISSOR: TFloatField
      FieldName = 'IDEMISSOR'
      Visible = False
    end
    object QryEmissorSIGLAEMISSOR: TStringField
      FieldName = 'SIGLAEMISSOR'
      Size = 15
    end
  end
  object DsSubTipo: TwwDataSource
    AutoEdit = False
    DataSet = QrySubTipo
    Left = 351
    Top = 88
  end
  object QrySubTipo: TwwQuery
    CachedUpdates = True
    DatabaseName = 'BaseDados'
    SQL.Strings = (
      
        'SELECT  TIT.IDTITRENFIXA,  TIT.CODTIPTXPREMIO,  TIT.INDEXRENFIX,' +
        '    TIT.CODTIPRENFIXA,'
      
        '        TIT.CODTIPTXJUROS, TIT.SERIETITRENFIX,  TIT.IDALTTITRENF' +
        'IX, TIT.DATAEMTITRENFIX,'
      
        '        TIT.DATAVENCTITRENFIX, TIT.DATAINIJURRENFIX,    TIT.DATA' +
        'BASEINDRENFIX, TIT.JUROSRENFIX,'
      
        '        TIT.PREMIORENFIX,  TIT.JUROSDIA, TIT.PREMIODIA, TIT.IDIN' +
        'DSWAPFIX,  TIT.VLRRESGATE,'
      
        '        TIT.TRGDTINCLUSAO, TIT.TRGUSERINCLUSAO, TIT.IDCUSTODIANT' +
        'E, TIT.DIASCOTACOMPRA,'
      
        '        TIT.DIASCOTAVENDA, TIT.PERCINDEX, TIT.CARENCIA, TIT.PERI' +
        'ODICIDADE, TIT.FLGSAQUEPARCIAL,'
      
        '        TIT.SALDOVLRRESGATE,   TIT.NUMCASASDEC, TIT.DATAINITR,  ' +
        '   TIT.INDEXRENFIX2,'
      
        '        TIT.DATABASEINDRENFX2, TIT.PERCINDEX2,  TIT.JUROSRENFIX2' +
        ',  TIT.CODTIPTXJUROS2,'
      
        '        TIT.DATAINIJURRENFIX2, TIT.FLGINDICE2, TIT.DIASPRAZOANBI' +
        'D, TIT.DIASPRAZOANBID2'
      ''
      'FROM CM.TITRENFIXA TIT'
      ''
      'WHERE 1 = 2')
    UpdateObject = UpdSubTipo
    ValidateWithMask = True
    Left = 504
    Top = 168
    object QrySubTipoIDTITRENFIXA: TFloatField
      FieldName = 'IDTITRENFIXA'
      Origin = 'TITRENFIXA.IDTITRENFIXA'
    end
    object QrySubTipoCODTIPRENFIXA: TStringField
      FieldName = 'CODTIPRENFIXA'
      Origin = 'TITRENFIXA.CODTIPRENFIXA'
      Size = 5
    end
    object QrySubTipoSERIETITRENFIX: TStringField
      FieldName = 'SERIETITRENFIX'
      Origin = 'TITRENFIXA.SERIETITRENFIX'
      Size = 15
    end
    object QrySubTipoIDALTTITRENFIX: TStringField
      FieldName = 'IDALTTITRENFIX'
      Origin = 'TITRENFIXA.IDALTTITRENFIX'
      Size = 30
    end
    object QrySubTipoDATAEMTITRENFIX: TDateTimeField
      FieldName = 'DATAEMTITRENFIX'
      Origin = 'TITRENFIXA.DATAEMTITRENFIX'
    end
    object QrySubTipoDATAVENCTITRENFIX: TDateTimeField
      FieldName = 'DATAVENCTITRENFIX'
      Origin = 'TITRENFIXA.DATAVENCTITRENFIX'
    end
    object QrySubTipoINDEXRENFIX: TFloatField
      FieldName = 'INDEXRENFIX'
      Origin = 'TITRENFIXA.INDEXRENFIX'
    end
    object QrySubTipoDATAINIJURRENFIX: TDateTimeField
      FieldName = 'DATAINIJURRENFIX'
      Origin = 'TITRENFIXA.DATAINIJURRENFIX'
    end
    object QrySubTipoDATABASEINDRENFIX: TDateTimeField
      FieldName = 'DATABASEINDRENFIX'
      Origin = 'TITRENFIXA.DATABASEINDRENFIX'
    end
    object QrySubTipoJUROSRENFIX: TFloatField
      FieldName = 'JUROSRENFIX'
      Origin = 'TITRENFIXA.JUROSRENFIX'
      DisplayFormat = '####,###,###,##0.00######'
      EditFormat = '############0.00######'
    end
    object QrySubTipoCODTIPTXJUROS: TFloatField
      FieldName = 'CODTIPTXJUROS'
      Origin = 'TITRENFIXA.CODTIPTXJUROS'
    end
    object QrySubTipoPREMIORENFIX: TFloatField
      FieldName = 'PREMIORENFIX'
      Origin = 'TITRENFIXA.PREMIORENFIX'
      DisplayFormat = '###,###,###,##0.00######'
      EditFormat = '############0.00######'
    end
    object QrySubTipoCODTIPTXPREMIO: TFloatField
      FieldName = 'CODTIPTXPREMIO'
      Origin = 'TITRENFIXA.CODTIPTXPREMIO'
    end
    object QrySubTipoIDINDSWAPFIX: TFloatField
      FieldName = 'IDINDSWAPFIX'
      Origin = 'TITRENFIXA.IDINDSWAPFIX'
    end
    object QrySubTipoVLRRESGATE: TFloatField
      FieldName = 'VLRRESGATE'
      DisplayFormat = '###,###,###,###,##0.00'
      EditFormat = '###############0.00'
    end
    object QrySubTipoIDCUSTODIANTE: TFloatField
      FieldName = 'IDCUSTODIANTE'
      Origin = 'TITRENFIXA.IDCUSTODIANTE'
    end
    object QrySubTipoPERCINDEX: TFloatField
      FieldName = 'PERCINDEX'
      Origin = 'TITRENFIXA.PERCINDEX'
      DisplayFormat = '###,###,###,##0.00######'
      EditFormat = '############0.00######'
    end
    object QrySubTipoJUROSDIA: TFloatField
      FieldName = 'JUROSDIA'
      Origin = 'TITRENFIXA.JUROSDIA'
    end
    object QrySubTipoCARENCIA: TFloatField
      FieldName = 'CARENCIA'
      Origin = 'TITRENFIXA.CARENCIA'
    end
    object QrySubTipoPERIODICIDADE: TFloatField
      FieldName = 'PERIODICIDADE'
      Origin = 'TITRENFIXA.PERIODICIDADE'
    end
    object QrySubTipoFLGSAQUEPARCIAL: TStringField
      FieldName = 'FLGSAQUEPARCIAL'
      Origin = 'TITRENFIXA.FLGSAQUEPARCIAL'
      Size = 1
    end
    object QrySubTipoDIASCOTACOMPRA: TFloatField
      FieldName = 'DIASCOTACOMPRA'
      Origin = 'TITRENFIXA.DIASCOTACOMPRA'
    end
    object QrySubTipoDIASCOTAVENDA: TFloatField
      FieldName = 'DIASCOTAVENDA'
      Origin = 'TITRENFIXA.DIASCOTAVENDA'
    end
    object QrySubTipoSALDOVLRRESGATE: TFloatField
      FieldName = 'SALDOVLRRESGATE'
      Origin = 'TITRENFIXA.SALDOVLRRESGATE'
    end
    object QrySubTipoNUMCASASDEC: TFloatField
      FieldName = 'NUMCASASDEC'
      Origin = 'TITRENFIXA.NUMCASASDEC'
    end
    object QrySubTipoDATAINITR: TDateTimeField
      FieldName = 'DATAINITR'
      Origin = 'TITRENFIXA.DATAINITR'
    end
    object QrySubTipoINDEXRENFIX2: TFloatField
      FieldName = 'INDEXRENFIX2'
      Origin = 'TITRENFIXA.INDEXRENFIX2'
    end
    object QrySubTipoDATABASEINDRENFX2: TDateTimeField
      FieldName = 'DATABASEINDRENFX2'
      Origin = 'TITRENFIXA.DATABASEINDRENFX2'
    end
    object QrySubTipoPERCINDEX2: TFloatField
      FieldName = 'PERCINDEX2'
      Origin = 'TITRENFIXA.PERCINDEX2'
    end
    object QrySubTipoJUROSRENFIX2: TFloatField
      FieldName = 'JUROSRENFIX2'
      Origin = 'TITRENFIXA.JUROSRENFIX2'
    end
    object QrySubTipoCODTIPTXJUROS2: TFloatField
      FieldName = 'CODTIPTXJUROS2'
      Origin = 'TITRENFIXA.CODTIPTXJUROS2'
    end
    object QrySubTipoDATAINIJURRENFIX2: TDateTimeField
      FieldName = 'DATAINIJURRENFIX2'
      Origin = 'TITRENFIXA.DATAINIJURRENFIX2'
    end
    object QrySubTipoPREMIODIA: TFloatField
      FieldName = 'PREMIODIA'
      Origin = 'TITRENFIXA.PREMIODIA'
    end
    object QrySubTipoFLGINDICE2: TStringField
      FieldName = 'FLGINDICE2'
      Size = 1
    end
    object QrySubTipoDIASPRAZOANBID: TFloatField
      FieldName = 'DIASPRAZOANBID'
    end
    object QrySubTipoDIASPRAZOANBID2: TFloatField
      FieldName = 'DIASPRAZOANBID2'
    end
  end
  object UpdSubTipo: TUpdateSQL
    ModifySQL.Strings = (
      'update CM.TITRENFIXA'
      'set'
      '  IDTITRENFIXA = :IDTITRENFIXA,'
      '  CODTIPTXPREMIO = :CODTIPTXPREMIO,'
      '  INDEXRENFIX = :INDEXRENFIX,'
      '  CODTIPRENFIXA = :CODTIPRENFIXA,'
      '  CODTIPTXJUROS = :CODTIPTXJUROS,'
      '  SERIETITRENFIX = :SERIETITRENFIX,'
      '  IDALTTITRENFIX = :IDALTTITRENFIX,'
      '  DATAEMTITRENFIX = :DATAEMTITRENFIX,'
      '  DATAVENCTITRENFIX = :DATAVENCTITRENFIX,'
      '  DATAINIJURRENFIX = :DATAINIJURRENFIX,'
      '  DATABASEINDRENFIX = :DATABASEINDRENFIX,'
      '  JUROSRENFIX = :JUROSRENFIX,'
      '  PREMIORENFIX = :PREMIORENFIX,'
      '  JUROSDIA = :JUROSDIA,'
      '  PREMIODIA = :PREMIODIA,'
      '  IDINDSWAPFIX = :IDINDSWAPFIX,'
      '  VLRRESGATE = :VLRRESGATE,'
      '  IDCUSTODIANTE = :IDCUSTODIANTE,'
      '  DIASCOTACOMPRA = :DIASCOTACOMPRA,'
      '  DIASCOTAVENDA = :DIASCOTAVENDA,'
      '  PERCINDEX = :PERCINDEX,'
      '  CARENCIA = :CARENCIA,'
      '  PERIODICIDADE = :PERIODICIDADE,'
      '  FLGSAQUEPARCIAL = :FLGSAQUEPARCIAL,'
      '  SALDOVLRRESGATE = :SALDOVLRRESGATE,'
      '  NUMCASASDEC = :NUMCASASDEC,'
      '  DATAINITR = :DATAINITR,'
      '  INDEXRENFIX2 = :INDEXRENFIX2,'
      '  DATABASEINDRENFX2 = :DATABASEINDRENFX2,'
      '  PERCINDEX2 = :PERCINDEX2,'
      '  JUROSRENFIX2 = :JUROSRENFIX2,'
      '  CODTIPTXJUROS2 = :CODTIPTXJUROS2,'
      '  DATAINIJURRENFIX2 = :DATAINIJURRENFIX2,'
      '  FLGINDICE2 = :FLGINDICE2,'
      '  DIASPRAZOANBID = :DIASPRAZOANBID,'
      '  DIASPRAZOANBID2 = :DIASPRAZOANBID2'
      'where'
      '  IDTITRENFIXA = :OLD_IDTITRENFIXA')
    InsertSQL.Strings = (
      'insert into CM.TITRENFIXA'
      '  (IDTITRENFIXA, CODTIPTXPREMIO, INDEXRENFIX, CODTIPRENFIXA, '
      'CODTIPTXJUROS, '
      '   SERIETITRENFIX, IDALTTITRENFIX, DATAEMTITRENFIX, '
      'DATAVENCTITRENFIX, '
      
        '   DATAINIJURRENFIX, DATABASEINDRENFIX, JUROSRENFIX, PREMIORENFI' +
        'X, '
      'JUROSDIA, '
      '   PREMIODIA, IDINDSWAPFIX, VLRRESGATE, IDCUSTODIANTE, '
      'DIASCOTACOMPRA, '
      '   DIASCOTAVENDA, PERCINDEX, CARENCIA, PERIODICIDADE, '
      'FLGSAQUEPARCIAL, '
      '   SALDOVLRRESGATE, NUMCASASDEC, DATAINITR, INDEXRENFIX2, '
      'DATABASEINDRENFX2, '
      '   PERCINDEX2, JUROSRENFIX2, CODTIPTXJUROS2, DATAINIJURRENFIX2, '
      'FLGINDICE2, '
      '   DIASPRAZOANBID, DIASPRAZOANBID2)'
      'values'
      
        '  (:IDTITRENFIXA, :CODTIPTXPREMIO, :INDEXRENFIX, :CODTIPRENFIXA,' +
        ' '
      ':CODTIPTXJUROS, '
      '   :SERIETITRENFIX, :IDALTTITRENFIX, :DATAEMTITRENFIX, '
      ':DATAVENCTITRENFIX, '
      '   :DATAINIJURRENFIX, :DATABASEINDRENFIX, :JUROSRENFIX, '
      ':PREMIORENFIX, '
      
        '   :JUROSDIA, :PREMIODIA, :IDINDSWAPFIX, :VLRRESGATE, :IDCUSTODI' +
        'ANTE, '
      ':DIASCOTACOMPRA, '
      '   :DIASCOTAVENDA, :PERCINDEX, :CARENCIA, :PERIODICIDADE, '
      ':FLGSAQUEPARCIAL, '
      '   :SALDOVLRRESGATE, :NUMCASASDEC, :DATAINITR, :INDEXRENFIX2, '
      ':DATABASEINDRENFX2, '
      
        '   :PERCINDEX2, :JUROSRENFIX2, :CODTIPTXJUROS2, :DATAINIJURRENFI' +
        'X2, '
      ':FLGINDICE2, '
      '   :DIASPRAZOANBID, :DIASPRAZOANBID2)')
    DeleteSQL.Strings = (
      'delete from CM.TITRENFIXA'
      'where'
      '  IDTITRENFIXA = :OLD_IDTITRENFIXA')
    Left = 297
    Top = 72
  end
  object UpdTitulo: TUpdateSQL
    ModifySQL.Strings = (
      'update CM.INVESTIMENTO'
      'set'
      '  IDINVESTIMENTO = :IDINVESTIMENTO,'
      '  IDTIPOINVEST = :IDTIPOINVEST,'
      '  IDEMISSOR = :IDEMISSOR,'
      '  IDMOEDACONTAB = :IDMOEDACONTAB,'
      '  DESCINVESTIMENTO = :DESCINVESTIMENTO,'
      '  FLGATIVO = :FLGATIVO,'
      '  OBSINVESTIMENTO = :OBSINVESTIMENTO'
      'where'
      '  IDINVESTIMENTO = :OLD_IDINVESTIMENTO')
    InsertSQL.Strings = (
      'insert into CM.INVESTIMENTO'
      '  (IDINVESTIMENTO, IDTIPOINVEST, IDEMISSOR, IDMOEDACONTAB, '
      'DESCINVESTIMENTO, '
      '   FLGATIVO, OBSINVESTIMENTO)'
      'values'
      '  (:IDINVESTIMENTO, :IDTIPOINVEST, :IDEMISSOR, :IDMOEDACONTAB, '
      ':DESCINVESTIMENTO, '
      '   :FLGATIVO, :OBSINVESTIMENTO)')
    DeleteSQL.Strings = (
      'delete from CM.INVESTIMENTO'
      'where'
      '  IDINVESTIMENTO = :OLD_IDINVESTIMENTO')
    Left = 206
    Top = 72
  end
  object QryTitulo: TwwQuery
    CachedUpdates = True
    AfterScroll = QryTituloAfterScroll
    DatabaseName = 'BaseDados'
    SQL.Strings = (
      'SELECT '#9'IDINVESTIMENTO, IDTIPOINVEST, IDEMISSOR, IDMOEDACONTAB,'
      #9'DESCINVESTIMENTO, FLGATIVO, OBSINVESTIMENTO'
      ''
      'FROM CM.INVESTIMENTO '
      ''
      'WHERE IDTIPOINVEST = 1'
      ''
      'ORDER BY DESCINVESTIMENTO')
    UpdateObject = UpdTitulo
    ValidateWithMask = True
    Left = 236
    Top = 72
  end
  object DsTitlulo: TwwDataSource
    AutoEdit = False
    DataSet = QryTitulo
    Left = 267
    Top = 72
  end
  object QryCustodiante: TwwQuery
    DatabaseName = 'BaseDados'
    SQL.Strings = (
      'SELECT IDCUSTODIANTE, SGLCUSTODIANTE'
      ''
      'FROM CUSTODIANTE'
      ''
      'ORDER BY SGLCUSTODIANTE')
    ValidateWithMask = True
    Left = 220
    Top = 35
    object QryCustodianteSGLCUSTODIANTE: TStringField
      DisplayLabel = 'Custodiante'
      DisplayWidth = 40
      FieldName = 'SGLCUSTODIANTE'
      Origin = 'CUSTODIANTE.SGLCUSTODIANTE'
      Size = 10
    end
    object QryCustodianteIDCUSTODIANTE: TFloatField
      DisplayWidth = 10
      FieldName = 'IDCUSTODIANTE'
      Origin = 'CUSTODIANTE.IDCUSTODIANTE'
      Visible = False
    end
  end
  object MSProcOperacao: TMontaSelect
    Template.IdConsulta = 0
    Caption = 'Seleciona'
    Colunas.Strings = (
      'INVESTIMENTO.DESCINVESTIMENTO'
      'OPERACAOINVEST.DATAOPERACAO'
      'OPERACAOINVEST.NUMDOCUMENTO'
      'INVESTIMENTO.FLGATIVO')
    TipodeDado.Strings = (
      'C'
      'D'
      'C'
      'C')
    Descricao.Strings = (
      'Titulo de Renda Fixa'
      'Data da Operação '
      'Número do Documento '
      'Ativa')
    Tabelas.Strings = (
      'OPERACAOINVEST'
      'INVESTIMENTO')
    CamposChave.Strings = (
      'OPERACAOINVEST.IDOPERACAOINVEST')
    Filtro.Strings = (
      'OPERACAOINVEST.IDTIPOINVEST = 1 '
      'OPERACAOINVEST.IDINVESTIMENTO = INVESTIMENTO.IDINVESTIMENTO')
    Mascaras.Strings = (
      ''
      ''
      ''
      '')
    Larguras.Strings = (
      '35'
      '8'
      '19'
      '1')
    DataBaseName = 'BaseDados'
    RepeteConsulta = False
    UsaDistinct = False
    SalvaConsulta = False
    ExibePergunta = True
    Left = 587
    Top = 3
  end
  object QryClass: TwwQuery
    DatabaseName = 'BaseDados'
    SQL.Strings = (
      'SELECT  CLA.CODTIPTITULO, CLA.CODCLASSINVEST, CLA.IDTIPOINVEST, '
      '                CLA.DTENQUADRA, CLA.CODTABCLASSINV'
      ''
      'FROM      CM.CLASSINVXTIPTIT CLA'
      ''
      'WHERE CODTIPTITULO = :CODTIPTITULO')
    ValidateWithMask = True
    Left = 545
    Top = 71
    ParamData = <
      item
        DataType = ftString
        Name = 'CODTIPTITULO'
        ParamType = ptUnknown
      end>
    object QryClassCODTIPTITULO: TStringField
      FieldName = 'CODTIPTITULO'
      Origin = 'CLASSINVXTIPTIT.CODTIPTITULO'
      Size = 5
    end
    object QryClassCODCLASSINVEST: TStringField
      FieldName = 'CODCLASSINVEST'
      Origin = 'CLASSINVXTIPTIT.CODCLASSINVEST'
      Size = 8
    end
    object QryClassIDTIPOINVEST: TFloatField
      FieldName = 'IDTIPOINVEST'
      Origin = 'CLASSINVXTIPTIT.IDTIPOINVEST'
    end
    object QryClassDTENQUADRA: TDateTimeField
      FieldName = 'DTENQUADRA'
      Origin = 'CLASSINVXTIPTIT.DTENQUADRA'
    end
    object QryClassCODTABCLASSINV: TStringField
      FieldName = 'CODTABCLASSINV'
      Origin = 'CLASSINVXTIPTIT.CODTABCLASSINV'
      Size = 10
    end
  end
  object QryCLASSINVXINVEST: TwwQuery
    CachedUpdates = True
    DatabaseName = 'BaseDados'
    SQL.Strings = (
      'INSERT INTO CLASSINVXINVEST'
      '              (CODTABCLASSINV, CODCLASSINVEST, '
      '               IDINVESTIMENTO, DTENQUADRA) '
      'VALUES  '
      '               (:CODTABCLASSINV, :CODCLASSINVEST, '
      '               :IDINVESTIMENTO, :DTENQUADRA) ')
    ValidateWithMask = True
    Left = 513
    Top = 72
    ParamData = <
      item
        DataType = ftString
        Name = 'CODTABCLASSINV'
        ParamType = ptUnknown
      end
      item
        DataType = ftString
        Name = 'CODCLASSINVEST'
        ParamType = ptUnknown
      end
      item
        DataType = ftInteger
        Name = 'IDINVESTIMENTO'
        ParamType = ptUnknown
      end
      item
        DataType = ftDateTime
        Name = 'DTENQUADRA'
        ParamType = ptUnknown
      end>
  end
  object QryBuscaCarteira: TwwQuery
    DatabaseName = 'BaseDados'
    SQL.Strings = (
      'SELECT '#9'IDCARTEIRAINVEST, DESCCARTINVEST, IDGESTORCARTEIRA, '
      #9'TRGDTINCLUSAO, TRGUSERINCLUSAO'
      ''
      'FROM CM.CARTEIRAINVEST'
      ''
      'ORDER BY DESCCARTINVEST')
    ValidateWithMask = True
    Left = 577
    Top = 71
  end
  object qryTpPeriodicidade: TwwQuery
    AfterScroll = QryTipTitAfterScroll
    DatabaseName = 'BaseDados'
    SQL.Strings = (
      'SELECT '
      '      IDTPPERIODICIDADE,NOME '
      'FROM '
      '      TPPERIODICIDADE')
    ValidateWithMask = True
    Left = 444
    Top = 255
    object qryTpPeriodicidadeNOME: TStringField
      DisplayWidth = 30
      FieldName = 'NOME'
      Origin = 'TPPERIODICIDADE.NOME'
      Size = 30
    end
    object qryTpPeriodicidadeIDTPPERIODICIDADE: TFloatField
      DisplayWidth = 10
      FieldName = 'IDTPPERIODICIDADE'
      Origin = 'TPPERIODICIDADE.IDTPPERIODICIDADE'
    end
  end
end
