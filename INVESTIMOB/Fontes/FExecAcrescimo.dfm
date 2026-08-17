inherited frmExecAcrescimoValor: TfrmExecAcrescimoValor
  Left = 82
  Top = 222
  Caption = 'Acréscimo de Valor'
  ClientHeight = 407
  ClientWidth = 767
  PixelsPerInch = 96
  TextHeight = 13
  inherited pnlFundo: TPanel
    Width = 767
    Height = 339
    inherited pnlMestre: TPanel
      Width = 767
      Height = 0
    end
    inherited tbcDetalhe: TTabControlDetalhe
      Top = 0
      Width = 767
      Height = 339
      Tabs.Strings = (
        'Operação'
        'Bens'
        'Dados da AP')
      detdbGrids.Strings = (
        ''
        'dbgrdDet'
        '')
      inherited pgctrlDetalhe: TPageControl
        Width = 669
        Height = 282
        ActivePage = tbsOperacao
        object tbsOperacao: TTabSheet [0]
          Caption = 'Operação'
          object Label5: TLabel
            Left = 16
            Top = 50
            Width = 38
            Height = 13
            Caption = 'Imóvel'
          end
          object lblData: TLabel
            Left = 544
            Top = 170
            Width = 98
            Height = 13
            Caption = 'Data Vencimento'
          end
          object Label3: TLabel
            Left = 16
            Top = 170
            Width = 130
            Height = 13
            Caption = 'Valor OM da Operação'
          end
          object Label42: TLabel
            Left = 16
            Top = 10
            Width = 103
            Height = 13
            Caption = 'Tipo de Operação'
          end
          object Label43: TLabel
            Left = 168
            Top = 170
            Width = 39
            Height = 13
            Caption = 'Moeda'
          end
          object Label13: TLabel
            Left = 272
            Top = 170
            Width = 107
            Height = 13
            Caption = 'Valor da Operação'
          end
          object Label14: TLabel
            Left = 16
            Top = 130
            Width = 103
            Height = 13
            Caption = 'Credor / Debitado'
          end
          object Label12: TLabel
            Left = 336
            Top = 90
            Width = 145
            Height = 13
            Caption = 'Carteira de Investimentos'
          end
          object Label1: TLabel
            Left = 16
            Top = 90
            Width = 85
            Height = 13
            Caption = 'Tipo de Imóvel'
          end
          object Label23: TLabel
            Left = 16
            Top = 210
            Width = 75
            Height = 13
            Caption = 'Observações'
          end
          object Label15: TLabel
            Left = 544
            Top = 10
            Width = 105
            Height = 13
            Caption = 'Data da Operação'
          end
          object btnBuscaImovel: TBitBtn
            Left = 624
            Top = 64
            Width = 24
            Height = 22
            Hint = 'Busca um Imóvel'
            ParentShowHint = False
            ShowHint = True
            TabOrder = 2
            OnClick = btnBuscaImovelClick
            Glyph.Data = {
              76010000424D7601000000000000760000002800000020000000100000000100
              0400000000000001000000000000000000001000000010000000000000000000
              80000080000000808000800000008000800080800000C0C0C000808080000000
              FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00777777777887
              777777777777F88F7777777777700F077777777777F8878F77777777700FFF07
              77777777F8877787F77777700FFFFFF077777778877777F8F7777778FFFFFCF0
              77777F78F77FF8787F771778FFCCCFFF07778FF87F88877F8F7711778FFFFFCF
              077788FF8F77FF8787F711178FFCCCFFF077888F8FF88877F87F71110000FFFC
              FF07788888887FF877877710E7E706CFFFF077887777888777F8770E7E7E70FF
              F887778F777778F7F8877707E7E7E0F88777778F777778F88777770E7E7E7087
              7777778F7777788777777707E7E7E07777777787F7777877777777707E7E0777
              777777787FFF8777777777770000777777777777888877777777}
            NumGlyphs = 2
          end
          object DBcboMoeda: TwwDBLookupCombo
            Left = 168
            Top = 184
            Width = 89
            Height = 21
            DropDownAlignment = taLeftJustify
            Selected.Strings = (
              'MOESIGLA'#9'10'#9'MOESIGLA')
            DataField = 'MOECODIGO'
            DataSource = ds
            LookupTable = dtmLookImobiliario.qryLookMoeda
            LookupField = 'MOECODIGO'
            Style = csDropDownList
            DropDownWidth = 8
            TabOrder = 4
            AutoDropDown = True
            ShowButton = True
            AllowClearKey = True
            OnCloseUp = DBcboMoedaCloseUp
            OnEnter = DBcboMoedaEnter
            OnExit = DBcboMoedaExit
          end
          object DBcboTipoOper: TwwDBLookupCombo
            Left = 16
            Top = 24
            Width = 289
            Height = 21
            DropDownAlignment = taLeftJustify
            Selected.Strings = (
              'DESCTIPOOPERACAO'#9'60'#9'DESCTIPOOPERACAO')
            DataField = 'IDTIPOOPERACAO'
            DataSource = ds
            LookupField = 'IDTIPOOPERACAO'
            Style = csDropDownList
            DropDownWidth = 8
            TabOrder = 0
            AutoDropDown = True
            ShowButton = True
            UseTFields = False
            AllowClearKey = True
            OnCloseUp = DBcboTipoOperCloseUp
          end
          object DBedtDataVenc: TCMDateTimePicker
            Left = 544
            Top = 184
            Width = 105
            Height = 21
            CalendarAttributes.Font.Charset = DEFAULT_CHARSET
            CalendarAttributes.Font.Color = clWindowText
            CalendarAttributes.Font.Height = -11
            CalendarAttributes.Font.Name = 'MS Sans Serif'
            CalendarAttributes.Font.Style = []
            ButtonStyle = cbsCustom
            DataField = 'DATAVENCOPER'
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
            TabOrder = 6
            OnExit = DBedtDataVencExit
          end
          object DBedtObsOper: TDBEdit
            Left = 16
            Top = 224
            Width = 633
            Height = 21
            DataField = 'OBSERVACAO'
            DataSource = ds
            MaxLength = 60
            TabOrder = 7
          end
          object DBedtDataOper: TCMDateTimePicker
            Left = 544
            Top = 24
            Width = 105
            Height = 21
            CalendarAttributes.Font.Charset = DEFAULT_CHARSET
            CalendarAttributes.Font.Color = clWindowText
            CalendarAttributes.Font.Height = -11
            CalendarAttributes.Font.Name = 'MS Sans Serif'
            CalendarAttributes.Font.Style = []
            ButtonStyle = cbsCustom
            DataField = 'DATAOPERACAO'
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
            OnExit = DBedtDataOperExit
          end
          object btnBuscaForCli: TBitBtn
            Left = 625
            Top = 144
            Width = 24
            Height = 22
            Hint = 'Busca um Credor ou Debitado'
            ParentShowHint = False
            ShowHint = True
            TabOrder = 11
            OnClick = btnBuscaForCliClick
            Glyph.Data = {
              76010000424D7601000000000000760000002800000020000000100000000100
              0400000000000001000000000000000000001000000010000000000000000000
              80000080000000808000800000008000800080800000C0C0C000808080000000
              FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00777777777887
              777777777777F88F7777777777700F077777777777F8878F77777777700FFF07
              77777777F8877787F77777700FFFFFF077777778877777F8F7777778FFFFFCF0
              77777F78F77FF8787F771778FFCCCFFF07778FF87F88877F8F7711778FFFFFCF
              077788FF8F77FF8787F711178FFCCCFFF077888F8FF88877F87F71110000FFFC
              FF07788888887FF877877710E7E706CFFFF077887777888777F8770E7E7E70FF
              F887778F777778F7F8877707E7E7E0F88777778F777778F88777770E7E7E7087
              7777778F7777788777777707E7E7E07777777787F7777877777777707E7E0777
              777777787FFF8777777777770000777777777777888877777777}
            NumGlyphs = 2
          end
          object DBedtImovel: TDBEdit
            Left = 16
            Top = 64
            Width = 609
            Height = 21
            DataField = 'IMOVEL_EXTENSO'
            DataSource = ds
            Enabled = False
            TabOrder = 8
          end
          object edtCarteira: TDBEdit
            Left = 336
            Top = 104
            Width = 313
            Height = 21
            DataField = 'DESCCARTINVEST'
            DataSource = ds
            Enabled = False
            TabOrder = 9
          end
          object edtTipoImovel: TDBEdit
            Left = 16
            Top = 104
            Width = 305
            Height = 21
            DataField = 'DESCTIPOIMOVEL'
            DataSource = ds
            Enabled = False
            TabOrder = 10
          end
          object DBedtForCli: TDBEdit
            Left = 16
            Top = 144
            Width = 281
            Height = 21
            DataField = 'NF_FORCLI'
            DataSource = ds
            Enabled = False
            TabOrder = 12
          end
          object DBedtVlrOM: TDBEdit
            Left = 16
            Top = 184
            Width = 137
            Height = 21
            DataField = 'VLROPERACAOOM'
            DataSource = ds
            TabOrder = 3
            OnExit = DBedtVlrOMExit
          end
          object DBedtVlrOper: TDBEdit
            Left = 272
            Top = 184
            Width = 137
            Height = 21
            DataField = 'VLROPERACAO'
            DataSource = ds
            Enabled = False
            TabOrder = 5
          end
          object DBEdit1: TDBEdit
            Left = 296
            Top = 144
            Width = 329
            Height = 21
            DataField = 'RS_FORCLI'
            DataSource = ds
            Enabled = False
            TabOrder = 13
          end
        end
        inherited tbsDet: TTabSheet
          Caption = 'Bens'
          inherited pnlControlesDet: TPanel
            Width = 661
            Height = 254
            object Label49: TLabel
              Left = 16
              Top = 10
              Width = 35
              Height = 13
              Caption = 'Grupo'
            end
            object Label36: TLabel
              Left = 384
              Top = 10
              Width = 113
              Height = 13
              Caption = 'Nº de Tombamento '
            end
            object Label48: TLabel
              Left = 16
              Top = 58
              Width = 58
              Height = 13
              Caption = 'Descrição'
            end
            object Label2: TLabel
              Left = 392
              Top = 114
              Width = 110
              Height = 13
              Caption = 'Valor do Acréscimo'
            end
            object Label4: TLabel
              Left = 224
              Top = 114
              Width = 39
              Height = 13
              Caption = 'Moeda'
            end
            object Label6: TLabel
              Left = 16
              Top = 114
              Width = 133
              Height = 13
              Caption = 'Valor OM do Acréscimo'
            end
            object btnBuscaBem: TBitBtn
              Left = 506
              Top = 24
              Width = 23
              Height = 22
              Enabled = False
              TabOrder = 2
              OnClick = btnBuscaBemClick
              Glyph.Data = {
                76010000424D7601000000000000760000002800000020000000100000000100
                0400000000000001000000000000000000001000000010000000000000000000
                80000080000000808000800000008000800080800000C0C0C000808080000000
                FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00777777777887
                777777777777F88F7777777777700F077777777777F8878F77777777700FFF07
                77777777F8877787F77777700FFFFFF077777778877777F8F7777778FFFFFCF0
                77777F78F77FF8787F771778FFCCCFFF07778FF87F88877F8F7711778FFFFFCF
                077788FF8F77FF8787F711178FFCCCFFF077888F8FF88877F87F71110000FFFC
                FF07788888887FF877877710E7E706CFFFF077887777888777F8770E7E7E70FF
                F887778F777778F7F8877707E7E7E0F88777778F777778F88777770E7E7E7087
                7777778F7777788777777707E7E7E07777777787F7777877777777707E7E0777
                777777787FFF8777777777770000777777777777888877777777}
              NumGlyphs = 2
            end
            object DBedtDescricaoBem: TDBEdit
              Left = 16
              Top = 72
              Width = 513
              Height = 21
              DataField = 'Desc'
              DataSource = dsDet
              Enabled = False
              TabOrder = 3
            end
            object DBcboGrupo: TwwDBComboBox
              Left = 16
              Top = 24
              Width = 273
              Height = 21
              ShowButton = True
              Style = csDropDownList
              MapList = True
              AllowClearKey = False
              DataField = 'IXBGRUPO'
              DataSource = dsDet
              DropDownCount = 8
              Enabled = False
              ItemHeight = 0
              Items.Strings = (
                'Ar-Condicionado'#9'A'
                'Edificacão'#9'E'
                'Terreno'#9'T'
                'Instalações Gerais'#9'I'
                'Instalações Elétricas'#9'L'
                'Máquinas e Equipamentos'#9'M'
                'Veículos'#9'V')
              Sorted = False
              TabOrder = 0
              UnboundDataType = wwDefault
            end
            object DBedtPlaca: TDBEdit
              Left = 384
              Top = 24
              Width = 122
              Height = 21
              DataField = 'Placa'
              DataSource = dsDet
              Enabled = False
              TabOrder = 1
            end
            object DBRealEdit1: TDBRealEdit
              Left = 392
              Top = 128
              Width = 137
              Height = 21
              Alignment = taRightJustify
              Enabled = False
              Lines.Strings = (
                '           0,00')
              TabOrder = 4
              WordWrap = False
              IntDigits = 15
              DecDigits = 2
              NumberFormat = fNumber
              Signal = False
              DataField = 'VLRBEM'
              DataSource = dsDet
            end
            object DBedtVlrOMBem: TDBRealEdit
              Left = 16
              Top = 128
              Width = 137
              Height = 21
              Alignment = taRightJustify
              Lines.Strings = (
                '           0,00')
              TabOrder = 5
              WordWrap = False
              OnExit = DBedtVlrOMBemExit
              IntDigits = 15
              DecDigits = 2
              NumberFormat = fNumber
              Signal = False
              DataField = 'VLROMBEM'
              DataSource = dsDet
            end
            object edtMoedaBem: TEdit
              Left = 224
              Top = 128
              Width = 105
              Height = 21
              Enabled = False
              TabOrder = 6
            end
          end
          inherited dbgrdDet: TwwDBGrid
            Width = 661
            Height = 254
            Selected.Strings = (
              'Placa'#9'12'#9'Nº Tombamento'
              'Desc'#9'40'#9'Descrição'
              'VLRBEM'#9'15'#9'Valor'
              'Grupo'#9'22'#9'Grupo')
            Options = [dgTitles, dgIndicator, dgColumnResize, dgColLines, dgRowLines, dgTabs, dgRowSelect, dgConfirmDelete, dgCancelOnExit, dgWordWrap]
            ParentCtl3D = False
          end
        end
        object tbsAP: TTabSheet
          Caption = 'Dados da AP'
          object Label8: TLabel
            Left = 336
            Top = 58
            Width = 92
            Height = 13
            Caption = 'Centro de Custo'
          end
          object Label7: TLabel
            Left = 16
            Top = 106
            Width = 75
            Height = 13
            Caption = 'Observações'
          end
          object Label10: TLabel
            Left = 16
            Top = 58
            Width = 120
            Height = 13
            Caption = 'Forma de Pagamento'
          end
          object Label9: TLabel
            Left = 16
            Top = 10
            Width = 129
            Height = 13
            Caption = 'Referência / Processo'
          end
          object Label11: TLabel
            Left = 432
            Top = 10
            Width = 83
            Height = 13
            Caption = 'Nº Documento'
          end
          object DBcboCentroCustoAP: TwwDBLookupCombo
            Left = 336
            Top = 72
            Width = 289
            Height = 21
            DropDownAlignment = taLeftJustify
            Selected.Strings = (
              'NOME'#9'30'#9'NOME')
            LookupTable = dtmLookImobiliario.qryLookCentroCusto
            LookupField = 'CODCENTROCUSTO'
            Style = csDropDownList
            DropDownWidth = 113
            TabOrder = 3
            AutoDropDown = True
            ShowButton = True
            AllowClearKey = False
          end
          object memObs: TMemo
            Left = 16
            Top = 119
            Width = 609
            Height = 57
            MaxLength = 200
            TabOrder = 4
          end
          object DBcboFormaRecPag: TwwDBLookupCombo
            Left = 16
            Top = 72
            Width = 305
            Height = 21
            DropDownAlignment = taLeftJustify
            Selected.Strings = (
              'DESCRICAO'#9'30'#9'DESCRICAO')
            LookupTable = dtmLookImobiliario.qryLookFormaRecPag
            LookupField = 'CODFORMA'
            Style = csDropDownList
            DropDownWidth = 113
            TabOrder = 2
            AutoDropDown = True
            ShowButton = True
            AllowClearKey = False
          end
          object edtReferenciaAP: TEdit
            Left = 16
            Top = 24
            Width = 361
            Height = 21
            MaxLength = 30
            TabOrder = 0
          end
          object edtNumDocumento: TDBEdit
            Left = 432
            Top = 24
            Width = 193
            Height = 21
            TabStop = False
            DataField = 'NUMDOCUMENTO'
            DataSource = ds
            MaxLength = 21
            TabOrder = 1
          end
        end
      end
      inherited Dock973: TDock97
        Width = 759
      end
      inherited Dock974: TDock97
        Left = 673
        Height = 282
      end
    end
  end
  inherited Dock972: TDock97
    Width = 767
    inherited Toolbar971: TToolbar97
      inherited sbtnInserir: TToolbarButton97
        Caption = '&Novo'
        Glyph.Data = {
          76010000424D7601000000000000760000002800000020000000100000000100
          0400000000000001000000000000000000001000000010000000000000000000
          8000008000000080800080000000800080008080000080808000C0C0C0000000
          FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF008B88888BCB88
          888B888888887888888888BB888BCB888BB8888888887888888888BBBB8CCC8B
          BBB88888888777888888888B8CCCCCCC8B888888877777778888888BCC88C88C
          CB8888887788788778888888CC88C88CC888888877887887788888888888C88C
          C8888888888878877888888B888CCCCC8B8888888887777788888BBB8CCCCC88
          8BBB8888877777888888888BCC88C8888B8888887788788888888888CC88C88C
          C8888888778878877888888BCC88C88CCB888888778878877888888B8CCCCCCC
          8B88888887777777888888BBBB8CCC8BBBB8888888877788888888BB888BCB88
          8BB888888888788888888B88888BCB88888B8888888878888888}
      end
      inherited sbtnAlterar: TToolbarButton97
        Enabled = False
        Visible = False
      end
      inherited sbtnProcurar: TToolbarButton97
        Enabled = False
        Visible = False
      end
      inherited sbtnApagar: TToolbarButton97
        Caption = '&Estornar'
        Enabled = False
        Glyph.Data = {
          6E020000424D6E02000000000000760000002800000036000000120000000100
          040000000000F801000000000000000000001000000010000000000000000000
          80000080000000808000800000008000800080800000C0C0C000808080000000
          FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00777777777777
          7777777777777FFFFFF777777777777777777777770077777770000007777777
          777FF888888F7777777777777777777777007777700111111077017777F88777
          77787F8777777700000077777700777701111111110011777F877FFFFF7788F8
          7777004444440770470077701119999911111177F877F88888F777F877704444
          4444400447007701119777779111117F877F8777778F77F8770444CCCCC44444
          47007701197777777111117F87F87777777877F870444C77777C444447007700
          0977777711111177888877777F8FFFF87044C777777744444700777777777779
          99999977FFFFF777788888887000C77777744444470070000007777777777778
          888887777777FFF77777777777CCCCCCC7007044444C777777000C787777F877
          7777888800000077777777777700704444C7777777044C7877778777777F87F8
          011111C77777700097007044440077777044C778777788FFFFF8778701111C77
          7777701197007044444400000444C7787FF7778888877F870111100777770119
          7700704CC4444444444C7778F88FF777777FF8770111111000001119770077C7
          7CC444444CC7777787788FFFFFF88777019911111111119777007777777CCCCC
          C777777777777888888777777977991111119977770077777777777777777777
          777777777777777777777799999977777700}
        Visible = False
      end
      inherited btnRefresh: TToolbarButton97
        Left = 453
        Enabled = False
        Visible = False
      end
      inherited btnTrazer: TToolbarButton97
        Left = 538
      end
      inherited ToolbarSep972: TToolbarSep97
        Left = 447
        Visible = False
      end
      object sbtnNovoBem: TToolbarButton97
        Left = 346
        Top = 0
        Width = 101
        Height = 29
        AllowAllUp = True
        GroupIndex = 1
        Caption = 'Novo &Bem'
        Glyph.Data = {
          76010000424D7601000000000000760000002800000020000000100000000100
          0400000000000001000000000000000000001000000010000000000000000000
          8000008000000080800080000000800080008080000080808000C0C0C0000000
          FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF008888888B8888
          8888888888888F8888888B8888BB778888B88888888F77F8888888BB8800F088
          BB8888888F7787F8888888BB00FFF0BBBB88888F7788878F88888800FFFFFF0B
          B888887788888F7F8888887FFFFFCF0B8888887F88FF7878F888887FFCCCFFF0
          B8888878F77788F7F88888B7FFFFFCF0BB888887F88FF7878F88BBB7FFCCCFFF
          0BBB88878F77788F78F888BB7FFFFFCFF08888887F88FF78878F888B7FFCCCFF
          FF08888878F777888F78888BB7FFFFFF77888888878F888F778888BBBB7FFF77
          BB8888888878FF77888888BB88B77788BB8888888887778888888B88888B8888
          88B888888888888888888888888B888888888888888888888888}
        NumGlyphs = 2
        Opaque = False
        OnClick = sbtnNovoBemClick
      end
      object ToolbarSep976: TToolbarSep97
        Left = 340
        Top = 0
      end
    end
  end
  inherited Dock971: TDock97
    Top = 374
    Width = 767
    inherited tb97Fundo: TToolbar97
      Left = 563
      DockPos = 563
      inherited sep1: TToolbarSep97
        Left = 0
      end
      inherited ToolbarSep973: TToolbarSep97
        Left = 83
      end
    end
    inherited TB97oKCancelar: TToolbar97
      Left = 377
      DockPos = 377
      inherited ToolbarSep971: TToolbarSep97
        Left = 166
      end
      inherited ToolbarSep974: TToolbarSep97
        Left = 83
      end
    end
  end
  inherited ivTradutor: TIvExtendedTranslator
    TargetsData = (
      1
      1
      (
        ''
        'Text'
        0))
  end
  inherited dsDet: TwwDataSource
    DataSet = qryImovelxBem
    Left = 456
    Top = 64
  end
  inherited ds: TwwDataSource
    Left = 336
    Top = 40
  end
  inherited upd: TUpdateSQL
    ModifySQL.Strings = (
      'update OPERACAOINVEST'
      'set'
      '  IDINVESTIMENTO = :IDINVESTIMENTO,'
      '  IDCARTEIRAINVEST = :IDCARTEIRAINVEST,'
      '  IDTIPOINVEST = :IDTIPOINVEST,'
      '  IDTIPOOPERACAO = :IDTIPOOPERACAO,'
      '  EMPRESAPROP = :EMPRESAPROP,'
      '  DATAOPERACAO = :DATAOPERACAO,'
      '  NUMDOCUMENTO = :NUMDOCUMENTO,'
      '  QTDEOPERACAO = :QTDEOPERACAO,'
      '  PRECOUNITOPERACAO = :PRECOUNITOPERACAO,'
      '  VLROPERACAO = :VLROPERACAO,'
      '  IDCUSTODIANTE = :IDCUSTODIANTE,'
      '  IDINSTFIN = :IDINSTFIN,'
      '  DATAVENCOPER = :DATAVENCOPER,'
      '  IDFORCLI = :IDFORCLI,'
      '  VLROPERACAOOM = :VLROPERACAOOM,'
      '  MOECODIGO = :MOECODIGO,'
      '  OBSERVACAO = :OBSERVACAO'
      'where'
      '  IDOPERACAOINVEST = :OLD_IDOPERACAOINVEST')
    InsertSQL.Strings = (
      'insert into OPERACAOINVEST'
      
        '  (IDOPERACAOINVEST, IDINVESTIMENTO, IDCARTEIRAINVEST, IDTIPOINV' +
        'EST, IDTIPOOPERACAO, '
      
        '   EMPRESAPROP, DATAOPERACAO, NUMDOCUMENTO, QTDEOPERACAO, PRECOU' +
        'NITOPERACAO, '
      
        '   VLROPERACAO, IDCUSTODIANTE, IDINSTFIN, DATAVENCOPER, IDFORCLI' +
        ', VLROPERACAOOM, '
      '   MOECODIGO, OBSERVACAO)'
      'values'
      
        '  (:IDOPERACAOINVEST, :IDINVESTIMENTO, :IDCARTEIRAINVEST, :IDTIP' +
        'OINVEST, '
      
        '   :IDTIPOOPERACAO, :EMPRESAPROP, :DATAOPERACAO, :NUMDOCUMENTO, ' +
        ':QTDEOPERACAO, '
      
        '   :PRECOUNITOPERACAO, :VLROPERACAO, :IDCUSTODIANTE, :IDINSTFIN,' +
        ' :DATAVENCOPER, '
      '   :IDFORCLI, :VLROPERACAOOM, :MOECODIGO, :OBSERVACAO)')
    DeleteSQL.Strings = (
      'delete from OPERACAOINVEST'
      'where'
      '  IDOPERACAOINVEST = :OLD_IDOPERACAOINVEST')
    Left = 272
    Top = 40
  end
  inherited MontaSelect: TMontaSelect
    Colunas.Strings = (
      'IM.IMONOME'
      'V.DATAOPERACAO')
    TipodeDado.Strings = (
      'C'
      'D')
    Descricao.Strings = (
      'Imóvel'
      'Data')
    Tabelas.Strings = (
      'OPRIMOVEL I'
      'OPERACAOINVEST V'
      'IMOVEL IM')
    CamposChave.Strings = (
      'I.IDOPERACAOINVEST')
    Filtro.Strings = (
      'V.IDINVESTIMENTO = IM.IDIMOVEL'
      'I.IDOPERACAOINVEST = V.IDOPERACAOINVEST')
    Mascaras.Strings = (
      ''
      '')
    Larguras.Strings = (
      '40'
      '13')
    Left = 984
    Top = 48
  end
  inherited ImlPadrao: TImageList
    Left = 984
    Top = 0
  end
  inherited CmeCadastro: TCmEventosCadastro
    OnFind = CmeCadastroFind
    Left = 928
    Top = 48
  end
  inherited qry: TwwQuery
    SQL.Strings = (
      'SELECT'
      '   O.IDOPERACAOINVEST,'
      '   O.IDINVESTIMENTO,'
      '   O.IDCARTEIRAINVEST,'
      '   O.IDTIPOINVEST,'
      '   O.IDTIPOOPERACAO,'
      '   O.EMPRESAPROP,'
      ''
      
        '   O.DATAOPERACAO, O.NUMDOCUMENTO AS DOCUMENTO_INVEST, O.QTDEOPE' +
        'RACAO,'
      '   O.PRECOUNITOPERACAO, O.VLROPERACAO, O.IDCUSTODIANTE,'
      '   O.IDINSTFIN, O.DATAVENCOPER, O.IDFORCLI, O.VLROPERACAOOM,'
      '   O.MOECODIGO, O.OBSERVACAO,'
      ''
      '   (IM.IMONOME||'#39' - '#39'||I.IMONOME) AS IMOVEL_EXTENSO,'
      '   C.DESCCARTINVEST,'
      '   T.DESCTIPOIMOVEL,'
      ''
      '   PF.NOME AS NF_FORCLI, PF.RAZAOSOCIAL AS RS_FORCLI,'
      ''
      '   0 AS NUMDOCUMENTO'
      ''
      'FROM'
      '   PESSOA PF,'
      '   OPERACAOINVEST O,'
      '   IMOVEL I, IMOVEL IM,'
      '   CARTEIRAINVEST C, TIPOIMOVEL T'
      ''
      'WHERE'
      '   ( O.IDOPERACAOINVEST =:PIDOPERACAOINVEST )'
      '   AND ( O.IDINVESTIMENTO = I.IDIMOVEL )'
      '   AND ( I.IDIMOVELMESTRE = IM.IDIMOVEL )'
      '   AND ( O.IDCARTEIRAINVEST = C.IDCARTEIRAINVEST )'
      '   AND ( I.CODTIPIMOVEL = T.CODTIPIMOVEL )'
      '   AND ( O.IDFORCLI = PF.IDPESSOA(+) )')
    Left = 304
    Top = 40
    ParamData = <
      item
        DataType = ftInteger
        Name = 'PIDOPERACAOINVEST'
        ParamType = ptUnknown
      end>
    object qryIDOPERACAOINVEST: TFloatField
      FieldName = 'IDOPERACAOINVEST'
      Origin = 'OPERACAOINVEST.IDOPERACAOINVEST'
    end
    object qryIDINVESTIMENTO: TFloatField
      FieldName = 'IDINVESTIMENTO'
      Origin = 'OPERACAOINVEST.IDINVESTIMENTO'
    end
    object qryEMPRESAPROP: TFloatField
      FieldName = 'EMPRESAPROP'
      Origin = 'OPERACAOINVEST.EMPRESAPROP'
    end
    object qryIDCARTEIRAINVEST: TFloatField
      FieldName = 'IDCARTEIRAINVEST'
      Origin = 'OPERACAOINVEST.IDCARTEIRAINVEST'
    end
    object qryIDTIPOINVEST: TFloatField
      FieldName = 'IDTIPOINVEST'
      Origin = 'OPERACAOINVEST.IDTIPOINVEST'
    end
    object qryIDTIPOOPERACAO: TFloatField
      FieldName = 'IDTIPOOPERACAO'
      Origin = 'OPERACAOINVEST.IDTIPOOPERACAO'
    end
    object qryDATAOPERACAO: TDateTimeField
      FieldName = 'DATAOPERACAO'
      Origin = 'OPERACAOINVEST.DATAOPERACAO'
    end
    object qryQTDEOPERACAO: TFloatField
      FieldName = 'QTDEOPERACAO'
      Origin = 'OPERACAOINVEST.QTDEOPERACAO'
    end
    object qryPRECOUNITOPERACAO: TFloatField
      FieldName = 'PRECOUNITOPERACAO'
      Origin = 'OPERACAOINVEST.PRECOUNITOPERACAO'
    end
    object qryVLROPERACAO: TFloatField
      FieldName = 'VLROPERACAO'
      Origin = 'OPERACAOINVEST.VLROPERACAO'
      DisplayFormat = '###,###,###,###,##0.00;(###,###,###,###,##0.00)'
      EditFormat = '#0'
    end
    object qryIDCUSTODIANTE: TFloatField
      FieldName = 'IDCUSTODIANTE'
      Origin = 'OPERACAOINVEST.IDCUSTODIANTE'
    end
    object qryIDINSTFIN: TFloatField
      FieldName = 'IDINSTFIN'
      Origin = 'OPERACAOINVEST.IDINSTFIN'
    end
    object qryDATAVENCOPER: TDateTimeField
      FieldName = 'DATAVENCOPER'
      Origin = 'OPERACAOINVEST.DATAVENCOPER'
    end
    object qryIDFORCLI: TFloatField
      FieldName = 'IDFORCLI'
      Origin = 'OPERACAOINVEST.IDFORCLI'
    end
    object qryVLROPERACAOOM: TFloatField
      FieldName = 'VLROPERACAOOM'
      Origin = 'OPERACAOINVEST.VLROPERACAOOM'
      DisplayFormat = '###,###,###,###,##0.00;(###,###,###,###,##0.00)'
      EditFormat = '#0'
    end
    object qryMOECODIGO: TFloatField
      FieldName = 'MOECODIGO'
      Origin = 'OPERACAOINVEST.MOECODIGO'
    end
    object qryOBSERVACAO: TStringField
      FieldName = 'OBSERVACAO'
      Origin = 'OPERACAOINVEST.OBSERVACAO'
      Size = 200
    end
    object qryDESCCARTINVEST: TStringField
      FieldName = 'DESCCARTINVEST'
      Origin = 'CARTEIRAINVEST.DESCCARTINVEST'
      Size = 60
    end
    object qryDESCTIPOIMOVEL: TStringField
      FieldName = 'DESCTIPOIMOVEL'
      Origin = 'TIPOIMOVEL.DESCTIPOIMOVEL'
      Size = 25
    end
    object qryIMOVEL_EXTENSO: TStringField
      FieldName = 'IMOVEL_EXTENSO'
      Origin = '"CM.IMOVEL".IMONOME'
      Size = 123
    end
    object qryNF_FORCLI: TStringField
      FieldName = 'NF_FORCLI'
      Size = 60
    end
    object qryRS_FORCLI: TStringField
      FieldName = 'RS_FORCLI'
      Size = 60
    end
    object qryDOCUMENTO_INVEST: TStringField
      FieldName = 'DOCUMENTO_INVEST'
      Size = 30
    end
    object qryNUMDOCUMENTO: TFloatField
      FieldName = 'NUMDOCUMENTO'
      DisplayFormat = '#0'
      EditFormat = '#0'
    end
  end
  inherited CmeDetalhe: TCmEventosCadastro
    Left = 928
    Top = 0
  end
  object updImovelxBem: TUpdateSQL
    ModifySQL.Strings = (
      'update IMOVELXBEM'
      'set'
      '  IDBEM = :IDBEM,'
      '  IDIMOVEL = :IDIMOVEL,'
      '  IDPESSOA = :IDPESSOA,'
      '  IXBGRUPO = :IXBGRUPO'
      'where'
      '  IDBEM = :OLD_IDBEM and'
      '  IDIMOVEL = :OLD_IDIMOVEL and'
      '  IDPESSOA = :OLD_IDPESSOA')
    InsertSQL.Strings = (
      'insert into IMOVELXBEM'
      '  (IDBEM, IDIMOVEL, IDPESSOA, IXBGRUPO)'
      'values'
      '  (:IDBEM, :IDIMOVEL, :IDPESSOA, :IXBGRUPO)')
    DeleteSQL.Strings = (
      'delete from IMOVELXBEM'
      'where'
      '  IDBEM = :OLD_IDBEM and'
      '  IDIMOVEL = :OLD_IDIMOVEL and'
      '  IDPESSOA = :OLD_IDPESSOA')
    Left = 456
    Top = 52
  end
  object qryImovelxBem: TwwQuery
    CachedUpdates = True
    OnCalcFields = qryImovelxBemCalcFields
    DatabaseName = 'BaseDados'
    SQL.Strings = (
      'SELECT'
      '   IXB.IDBEM, IXB.IDIMOVEL, IXB.IDPESSOA, IXB.IXBGRUPO,'
      '   IXB.IXBPERCENT,'
      ''
      '   (0) AS VLROMBEM, (0) AS VLRBEM,'
      ''
      '   B.CONTROLE, B.REGISTRO'
      ''
      'FROM'
      '   IMOVELXBEM IXB, BEM B'
      ''
      'WHERE'
      '   ( IXB.IDPESSOA =:PIDPESSOA )'
      '   AND ( IXB.IDIMOVEL =:PIDIMOVEL )'
      '   AND ( IXB.IDBEM = B.IDBEM )'
      '')
    UpdateObject = updImovelxBem
    ValidateWithMask = True
    Left = 456
    Top = 40
    ParamData = <
      item
        DataType = ftUnknown
        Name = 'PIDPESSOA'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'PIDIMOVEL'
        ParamType = ptUnknown
      end>
    object qryImovelxBemPlaca: TFloatField
      DisplayLabel = 'Nº Tombamento'
      DisplayWidth = 12
      FieldKind = fkCalculated
      FieldName = 'Placa'
      DisplayFormat = '#0'
      EditFormat = '#0'
      Calculated = True
    end
    object qryImovelxBemDesc: TStringField
      DisplayLabel = 'Descrição'
      DisplayWidth = 40
      FieldKind = fkCalculated
      FieldName = 'Desc'
      Size = 200
      Calculated = True
    end
    object qryImovelxBemVLRBEM: TFloatField
      DisplayLabel = 'Valor'
      DisplayWidth = 15
      FieldName = 'VLRBEM'
      DisplayFormat = '###,###,###,###.00;(###,###,###,###.00)'
      EditFormat = '###,###,###,###.00;(###,###,###,###.00)'
    end
    object qryImovelxBemGrupo: TStringField
      DisplayWidth = 22
      FieldKind = fkCalculated
      FieldName = 'Grupo'
      Size = 25
      Calculated = True
    end
    object qryImovelxBemIXBPERCENT: TFloatField
      DisplayLabel = '%'
      DisplayWidth = 8
      FieldName = 'IXBPERCENT'
      Origin = 'IMOVELXBEM.IXBPERCENT'
      Visible = False
      DisplayFormat = '##0.0000'
      EditFormat = '##0.0000'
    end
    object qryImovelxBemIDBEM: TFloatField
      FieldName = 'IDBEM'
      Origin = 'IMOVELXBEM.IDBEM'
      Visible = False
    end
    object qryImovelxBemIDIMOVEL: TFloatField
      FieldName = 'IDIMOVEL'
      Origin = 'IMOVELXBEM.IDIMOVEL'
      Visible = False
    end
    object qryImovelxBemIDPESSOA: TFloatField
      FieldName = 'IDPESSOA'
      Origin = 'IMOVELXBEM.IDPESSOA'
      Visible = False
    end
    object qryImovelxBemIXBGRUPO: TStringField
      FieldName = 'IXBGRUPO'
      Origin = 'IMOVELXBEM.IXBGRUPO'
      Visible = False
      Size = 1
    end
    object qryImovelxBemVLROMBEM: TFloatField
      FieldName = 'VLROMBEM'
      Visible = False
      DisplayFormat = '###,###,###,###.00;(###,###,###,###.00)'
      EditFormat = '###,###,###,###.00;(###,###,###,###.00)'
    end
    object qryImovelxBemCONTROLE: TStringField
      FieldName = 'CONTROLE'
      Visible = False
      Size = 1
    end
    object qryImovelxBemREGISTRO: TStringField
      FieldName = 'REGISTRO'
      Visible = False
      Size = 1
    end
  end
  object qryPreencheBem: TwwQuery
    CachedUpdates = True
    DatabaseName = 'BaseDados'
    SQL.Strings = (
      'SELECT'
      '   IDBEM, IDPESSOA, PLACA, DESBEM'
      ''
      'FROM'
      '   BEM'
      ''
      'WHERE'
      '   ( IDBEM =:PIDBEM )'
      '')
    ValidateWithMask = True
    Left = 648
    Top = 36
    ParamData = <
      item
        DataType = ftUnknown
        Name = 'PIDBEM'
        ParamType = ptUnknown
      end>
    object qryPreencheBemIDBEM: TFloatField
      FieldName = 'IDBEM'
      Origin = 'BEM.IDBEM'
    end
    object qryPreencheBemIDPESSOA: TFloatField
      FieldName = 'IDPESSOA'
      Origin = 'BEM.IDPESSOA'
    end
    object qryPreencheBemPLACA: TFloatField
      FieldName = 'PLACA'
      Origin = 'BEM.PLACA'
    end
    object qryPreencheBemDESBEM: TStringField
      FieldName = 'DESBEM'
      Origin = 'BEM.DESBEM'
      Size = 200
    end
  end
  object qryForCliXTipoOper: TwwQuery
    CachedUpdates = True
    DatabaseName = 'BaseDados'
    SQL.Strings = (
      'SELECT'
      '   X.IDTIPOINVEST, X.IDTIPOOPERACAO, X.EMPRESAPROP,'
      '   X.IDFORCLI,'
      '   C.IDTIPOCLIENTE'
      'FROM'
      '   FORCLIXTIPOPER X, CLIENTEPESS C'
      'WHERE'
      '   ('
      '   ( EMPRESAPROP =:EMPRESAPROP ) AND'
      '   ( IDTIPOINVEST = 3 ) AND'
      '   ( IDTIPOOPERACAO =:TIPOOPER )'
      '   )'
      '   AND'
      '   ( X.IDFORCLI = C.IDPESSOA(+) ) ')
    ValidateWithMask = True
    Left = 648
    Top = 24
    ParamData = <
      item
        DataType = ftInteger
        Name = 'EMPRESAPROP'
        ParamType = ptUnknown
      end
      item
        DataType = ftInteger
        Name = 'TIPOOPER'
        ParamType = ptUnknown
      end>
    object qryForCliXTipoOperIDTIPOINVEST: TFloatField
      FieldName = 'IDTIPOINVEST'
      Origin = 'FORCLIXTIPOPER.IDTIPOINVEST'
    end
    object qryForCliXTipoOperIDTIPOOPERACAO: TFloatField
      FieldName = 'IDTIPOOPERACAO'
      Origin = 'FORCLIXTIPOPER.IDTIPOOPERACAO'
    end
    object qryForCliXTipoOperEMPRESAPROP: TFloatField
      FieldName = 'EMPRESAPROP'
      Origin = 'FORCLIXTIPOPER.EMPRESAPROP'
    end
    object qryForCliXTipoOperIDFORCLI: TFloatField
      FieldName = 'IDFORCLI'
      Origin = 'FORCLIXTIPOPER.IDFORCLI'
    end
    object qryForCliXTipoOperIDTIPOCLIENTE: TFloatField
      FieldName = 'IDTIPOCLIENTE'
    end
  end
  object qryRegistraOperXAcrescimo: TwwQuery
    DatabaseName = 'BaseDados'
    SQL.Strings = (
      'INSERT INTO OPERXACRESC'
      '(IDOPERACAOINVEST, IDACRESCIMO)'
      'VALUES(:OPERACAO, :ACRESCIMO)')
    ValidateWithMask = True
    Left = 648
    Top = 12
    ParamData = <
      item
        DataType = ftInteger
        Name = 'OPERACAO'
        ParamType = ptUnknown
      end
      item
        DataType = ftInteger
        Name = 'ACRESCIMO'
        ParamType = ptUnknown
      end>
  end
end
