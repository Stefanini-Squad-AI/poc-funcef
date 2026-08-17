inherited frmExecOperImovel: TfrmExecOperImovel
  Left = 88
  Top = 181
  Caption = 'frmExecOperImovel'
  ClientHeight = 482
  ClientWidth = 804
  PixelsPerInch = 96
  TextHeight = 13
  inherited pnlFundo: TPanel
    Width = 804
    Height = 396
    inherited pnlMestre: TPanel
      Width = 802
      Height = 0
    end
    inherited tbcDetalhe: TTabControlDetalhe
      Top = 1
      Width = 802
      Height = 394
      Tabs.Strings = (
        'Operação'
        'Bens'
        'Rubricas da Operação'
        'Parcelas')
      detdbGrids.Strings = (
        ''
        'dbgrdDet'
        'DBgrdRubrica'
        'DBgrdParcela')
      inherited pgctrlDetalhe: TPageControl
        Width = 704
        Height = 335
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
            Left = 568
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
            Left = 224
            Top = 170
            Width = 39
            Height = 13
            Caption = 'Moeda'
          end
          object Label13: TLabel
            Left = 360
            Top = 170
            Width = 107
            Height = 13
            Caption = 'Valor da Operação'
          end
          object Label15: TLabel
            Left = 568
            Top = 10
            Width = 87
            Height = 13
            Caption = 'Data Operação'
          end
          object Label14: TLabel
            Left = 16
            Top = 130
            Width = 103
            Height = 13
            Caption = 'Credor / Debitado'
          end
          object Label12: TLabel
            Left = 16
            Top = 90
            Width = 145
            Height = 13
            Caption = 'Carteira de Investimentos'
          end
          object Label1: TLabel
            Left = 368
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
          object lblLucroPreju: TLabel
            Left = 384
            Top = 250
            Width = 273
            Height = 13
            Caption = 'Rubrica usada para registro do Lucro / Prejuízo'
            Visible = False
          end
          object btnBuscaImovel: TBitBtn
            Left = 649
            Top = 63
            Width = 24
            Height = 22
            TabOrder = 4
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
            Left = 224
            Top = 184
            Width = 121
            Height = 21
            DropDownAlignment = taLeftJustify
            Selected.Strings = (
              'MOESIGLA'#9'10'#9'MOESIGLA')
            DataField = 'MOECODIGO'
            DataSource = ds
            LookupTable = qryLookMoeda
            LookupField = 'MOECODIGO'
            Style = csDropDownList
            DropDownWidth = 8
            TabOrder = 10
            AutoDropDown = True
            ShowButton = True
            AllowClearKey = True
            OnCloseUp = DBcboMoedaCloseUp
            OnEnter = DBcboMoedaEnter
            OnExit = DBcboMoedaExit
          end
          object DBcboImovel: TwwDBLookupCombo
            Left = 248
            Top = 64
            Width = 401
            Height = 21
            DropDownAlignment = taLeftJustify
            Selected.Strings = (
              'IMONOME'#9'60'#9'Nome do Imóvel')
            DataField = 'IDINVESTIMENTO'
            DataSource = ds
            LookupTable = qryLookImovel
            LookupField = 'IDIMOVEL'
            Style = csDropDownList
            DropDownWidth = 8
            Enabled = False
            TabOrder = 3
            AutoDropDown = False
            ShowButton = False
            AllowClearKey = True
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
            LookupTable = qryLookTipoOper
            LookupField = 'IDTIPOOPERACAO'
            Style = csDropDownList
            DropDownWidth = 8
            TabOrder = 0
            AutoDropDown = True
            ShowButton = True
            AllowClearKey = True
            OnCloseUp = DBcboTipoOperCloseUp
          end
          object DBedtDataVenc: TCMDateTimePicker
            Left = 568
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
            TabOrder = 12
          end
          object DBedtDataOper: TCMDateTimePicker
            Left = 568
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
          end
          object DBcboForCliOper: TwwDBLookupCombo
            Left = 16
            Top = 144
            Width = 657
            Height = 21
            DropDownAlignment = taLeftJustify
            Selected.Strings = (
              'NOME'#9'60'#9'NOME')
            DataField = 'IDFORCLI'
            DataSource = ds
            LookupTable = qryLookForCli
            LookupField = 'IDFORCLI'
            Style = csDropDownList
            DropDownWidth = 8
            TabOrder = 8
            AutoDropDown = True
            ShowButton = True
            UseTFields = False
            AllowClearKey = True
            ShowMatchText = True
          end
          object DBcboImovelMestre: TwwDBLookupCombo
            Left = 16
            Top = 64
            Width = 233
            Height = 21
            DropDownAlignment = taLeftJustify
            Selected.Strings = (
              'NOMEMESTRE'#9'60'#9'NOMEMESTRE')
            LookupTable = qryLookImovel
            LookupField = 'IDIMOVELMESTRE'
            Style = csDropDownList
            DropDownWidth = 8
            Enabled = False
            TabOrder = 2
            AutoDropDown = False
            ShowButton = False
            AllowClearKey = True
          end
          object DBcboCarteira: TwwDBLookupCombo
            Left = 16
            Top = 104
            Width = 313
            Height = 21
            DropDownAlignment = taLeftJustify
            Selected.Strings = (
              'DESCCARTINVEST'#9'60'#9'DESCCARTINVEST')
            DataField = 'IDCARTEIRAINVEST'
            DataSource = ds
            LookupTable = qryLookCarteira
            LookupField = 'IDCARTEIRAINVEST'
            Style = csDropDownList
            DropDownWidth = 8
            Enabled = False
            TabOrder = 5
            AutoDropDown = False
            ShowButton = False
            AllowClearKey = True
            ShowMatchText = True
          end
          object btnBuscaCarteira: TBitBtn
            Left = 329
            Top = 103
            Width = 23
            Height = 22
            Enabled = False
            TabOrder = 6
            OnClick = btnBuscaCarteiraClick
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
          object DBcboTipoImovel: TwwDBLookupCombo
            Left = 368
            Top = 104
            Width = 305
            Height = 21
            DropDownAlignment = taLeftJustify
            Selected.Strings = (
              'DESCTIPOIMOVEL'#9'25'#9'DESCTIPOIMOVEL')
            LookupTable = qryLookTipoImovel
            LookupField = 'CODTIPIMOVEL'
            Style = csDropDownList
            DropDownWidth = 8
            Enabled = False
            TabOrder = 7
            AutoDropDown = True
            ShowButton = True
            AllowClearKey = True
            ShowMatchText = True
          end
          object DBedtObsOper: TDBEdit
            Left = 16
            Top = 224
            Width = 657
            Height = 21
            DataField = 'OBSERVACAO'
            DataSource = ds
            TabOrder = 13
          end
          object DBcboLucroPreju: TwwDBLookupCombo
            Left = 384
            Top = 264
            Width = 289
            Height = 21
            DropDownAlignment = taLeftJustify
            Selected.Strings = (
              'DESCTIPODESPINV'#9'60'#9'DESCTIPODESPINV')
            LookupTable = qryLookTipoDespesa
            LookupField = 'IDTIPODESPINVEST'
            Style = csDropDownList
            DropDownCount = 4
            DropDownWidth = 8
            TabOrder = 14
            Visible = False
            AutoDropDown = True
            ShowButton = True
            AllowClearKey = True
          end
          object DBedtVlrOM: TDBEdit
            Left = 16
            Top = 184
            Width = 193
            Height = 21
            DataField = 'VLROPERACAOOM'
            DataSource = ds
            TabOrder = 9
            OnExit = DBedtVlrOMExit
          end
          object DBedtVlrOper: TDBEdit
            Left = 360
            Top = 184
            Width = 193
            Height = 21
            DataField = 'VLROPERACAO'
            DataSource = ds
            Enabled = False
            TabOrder = 11
          end
        end
        inherited tbsDet: TTabSheet
          Caption = 'Bens'
          inherited dbgrdDet: TwwDBGrid
            Width = 696
            Height = 307
            Selected.Strings = (
              'Placa'#9'12'#9'Nº Tombamento'
              'Desc'#9'44'#9'Descrição'
              'Grupo'#9'22'#9'Grupo'
              'IXBPERCENT'#9'8'#9'%')
            Options = [dgTitles, dgIndicator, dgColumnResize, dgColLines, dgRowLines, dgTabs, dgRowSelect, dgConfirmDelete, dgCancelOnExit, dgWordWrap]
            ParentCtl3D = False
          end
          inherited pnlControlesDet: TPanel
            Width = 696
            Height = 307
            object Label49: TLabel
              Left = 16
              Top = 10
              Width = 35
              Height = 13
              Caption = 'Grupo'
            end
            object Label36: TLabel
              Left = 496
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
            object Label9: TLabel
              Left = 359
              Top = 112
              Width = 162
              Height = 13
              Alignment = taRightJustify
              Caption = 'Percentual de rateio do Bem'
            end
            object Label22: TLabel
              Left = 352
              Top = 128
              Width = 169
              Height = 13
              Alignment = taRightJustify
              Caption = 'em relação ao total do Imóvel'
            end
            object Label45: TLabel
              Left = 627
              Top = 118
              Width = 16
              Height = 20
              Caption = '%'
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clWindowText
              Font.Height = -16
              Font.Name = 'MS Sans Serif'
              Font.Style = [fsBold]
              ParentFont = False
            end
            object btnBuscaBem: TBitBtn
              Left = 618
              Top = 24
              Width = 23
              Height = 22
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
              Width = 625
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
              ItemHeight = 0
              Items.Strings = (
                'Edificacão'#9'E'
                'Terreno'#9'T'
                'Instalações Gerais'#9'I'
                'Instalações Elétricas'#9'L')
              Sorted = False
              TabOrder = 0
              UnboundDataType = wwDefault
            end
            object DBedtPlaca: TDBEdit
              Left = 496
              Top = 24
              Width = 122
              Height = 21
              DataField = 'Placa'
              DataSource = dsDet
              Enabled = False
              TabOrder = 1
            end
            object DBedtRateioBem: TDBEdit
              Left = 532
              Top = 117
              Width = 89
              Height = 21
              DataField = 'IXBPERCENT'
              DataSource = dsDet
              TabOrder = 4
              OnExit = DBedtRateioBemExit
            end
          end
        end
        object tbsRubrica: TTabSheet
          Caption = 'Rubricas da Operação'
          object DBgrdRubrica: TwwDBGrid
            Left = 0
            Top = 0
            Width = 696
            Height = 307
            Selected.Strings = (
              'DESCTIPODESPINV'#9'35'#9'Rubrica'
              'DATAVENC'#9'10'#9'Vencimento'
              'VLROM'#9'17'#9'Valor OM'
              'MOEDA'#9'14'#9'Moeda'
              'VLR'#9'17'#9'Valor')
            IniAttributes.Delimiter = ';;'
            TitleColor = clBtnFace
            FixedCols = 0
            ShowHorzScrollBar = True
            Align = alClient
            DataSource = dsDespXTipoOper
            Options = [dgTitles, dgIndicator, dgColumnResize, dgColLines, dgRowLines, dgTabs, dgRowSelect, dgConfirmDelete, dgCancelOnExit, dgWordWrap]
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
          object Panel1: TPanel
            Left = 0
            Top = 0
            Width = 696
            Height = 307
            Align = alClient
            BevelOuter = bvNone
            TabOrder = 1
            object Label2: TLabel
              Left = 16
              Top = 58
              Width = 119
              Height = 13
              Caption = 'Valor OM da Rubrica'
            end
            object Label4: TLabel
              Left = 192
              Top = 58
              Width = 39
              Height = 13
              Caption = 'Moeda'
            end
            object Label6: TLabel
              Left = 352
              Top = 58
              Width = 96
              Height = 13
              Caption = 'Valor da Rubrica'
            end
            object Label7: TLabel
              Left = 16
              Top = 10
              Width = 124
              Height = 13
              Caption = 'Descrição da Rubrica'
            end
            object Label8: TLabel
              Left = 528
              Top = 58
              Width = 116
              Height = 13
              Caption = 'Data de Vencimento'
            end
            object Label10: TLabel
              Left = 16
              Top = 106
              Width = 103
              Height = 13
              Caption = 'Credor / Debitado'
            end
            object DBcboMoedaRubrica: TwwDBLookupCombo
              Left = 192
              Top = 72
              Width = 145
              Height = 21
              DropDownAlignment = taLeftJustify
              Selected.Strings = (
                'MOESIGLA'#9'10'#9'MOESIGLA')
              DataField = 'MOEDA'
              DataSource = dsDespXTipoOper
              LookupTable = qryLookMoeda
              LookupField = 'MOECODIGO'
              Style = csDropDownList
              DropDownWidth = 8
              TabOrder = 2
              AutoDropDown = True
              ShowButton = True
              UseTFields = False
              AllowClearKey = True
              OnCloseUp = DBcboMoedaRubricaCloseUp
              OnEnter = DBcboMoedaRubricaEnter
              OnExit = DBcboMoedaRubricaExit
            end
            object DBedtRubrica: TDBEdit
              Left = 16
              Top = 24
              Width = 625
              Height = 21
              DataField = 'DESCTIPODESPINV'
              DataSource = dsDespXTipoOper
              Enabled = False
              ReadOnly = True
              TabOrder = 0
            end
            object DBedtDataDesp: TCMDateTimePicker
              Left = 528
              Top = 72
              Width = 113
              Height = 21
              CalendarAttributes.Font.Charset = DEFAULT_CHARSET
              CalendarAttributes.Font.Color = clWindowText
              CalendarAttributes.Font.Height = -11
              CalendarAttributes.Font.Name = 'MS Sans Serif'
              CalendarAttributes.Font.Style = []
              ButtonStyle = cbsCustom
              DataField = 'DATAVENC'
              DataSource = dsDespXTipoOper
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
              TabOrder = 4
            end
            object DBcboForCliDesp: TwwDBLookupCombo
              Left = 16
              Top = 120
              Width = 625
              Height = 21
              DropDownAlignment = taLeftJustify
              Selected.Strings = (
                'NOME'#9'60'#9'NOME')
              DataField = 'FORCLI'
              DataSource = dsDespXTipoOper
              LookupTable = qryLookForCli
              LookupField = 'IDPESSOA'
              Style = csDropDownList
              DropDownWidth = 8
              TabOrder = 5
              AutoDropDown = True
              ShowButton = True
              UseTFields = False
              AllowClearKey = True
              ShowMatchText = True
            end
            object DBedtVlrOMRubrica: TDBEdit
              Left = 16
              Top = 72
              Width = 161
              Height = 21
              DataField = 'VLROM'
              DataSource = dsDespXTipoOper
              TabOrder = 1
              OnExit = DBedtVlrOMRubricaExit
            end
            object DBedtVlrRubrica: TDBEdit
              Left = 352
              Top = 72
              Width = 161
              Height = 21
              DataField = 'VLR'
              DataSource = dsDespXTipoOper
              Enabled = False
              TabOrder = 3
            end
          end
        end
        object tbsParcelas: TTabSheet
          Caption = 'Parcelas'
          object DBgrdParcela: TwwDBGrid
            Left = 0
            Top = 0
            Width = 696
            Height = 307
            Selected.Strings = (
              'PARNUMERO'#9'6'#9'Nº'
              'PARPARCELA'#9'25'#9'Descrição da Parcela'
              'PARVLROM'#9'16'#9'Valor OM'
              'PARVLR'#9'16'#9'Valor'
              'PARDATAVENC'#9'12'#9'Vencimento')
            IniAttributes.Delimiter = ';;'
            TitleColor = clBtnFace
            FixedCols = 0
            ShowHorzScrollBar = True
            Align = alClient
            DataSource = dsParcelas
            Options = [dgEditing, dgTitles, dgIndicator, dgColumnResize, dgColLines, dgRowLines, dgTabs, dgRowSelect, dgConfirmDelete, dgCancelOnExit, dgWordWrap]
            TabOrder = 1
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
          object Panel2: TPanel
            Left = 0
            Top = 0
            Width = 696
            Height = 307
            Align = alClient
            BevelOuter = bvNone
            TabOrder = 0
            object Label11: TLabel
              Left = 96
              Top = 10
              Width = 105
              Height = 13
              Caption = 'Descrição Parcela'
            end
            object Label17: TLabel
              Left = 16
              Top = 106
              Width = 75
              Height = 13
              Caption = 'Observações'
            end
            object Label16: TLabel
              Left = 16
              Top = 58
              Width = 118
              Height = 13
              Caption = 'Valor OM da Parcela'
            end
            object Label18: TLabel
              Left = 192
              Top = 58
              Width = 39
              Height = 13
              Caption = 'Moeda'
            end
            object Label19: TLabel
              Left = 352
              Top = 58
              Width = 95
              Height = 13
              Caption = 'Valor da Parcela'
            end
            object Label20: TLabel
              Left = 528
              Top = 58
              Width = 116
              Height = 13
              Caption = 'Data de Vencimento'
            end
            object Label21: TLabel
              Left = 376
              Top = 10
              Width = 103
              Height = 13
              Caption = 'Tipo de Operação'
            end
            object Label24: TLabel
              Left = 16
              Top = 10
              Width = 62
              Height = 13
              Caption = 'Nº Parcela'
            end
            object DBcboMoedaParcela: TwwDBLookupCombo
              Left = 192
              Top = 72
              Width = 145
              Height = 21
              DropDownAlignment = taLeftJustify
              Selected.Strings = (
                'MOESIGLA'#9'10'#9'MOESIGLA')
              DataField = 'MOECODIGO'
              DataSource = dsParcelas
              LookupTable = qryLookMoeda
              LookupField = 'MOECODIGO'
              Style = csDropDownList
              DropDownWidth = 8
              Enabled = False
              TabOrder = 4
              AutoDropDown = True
              ShowButton = True
              UseTFields = False
              AllowClearKey = True
            end
            object DBedtDataParcela: TCMDateTimePicker
              Left = 528
              Top = 72
              Width = 113
              Height = 21
              CalendarAttributes.Font.Charset = DEFAULT_CHARSET
              CalendarAttributes.Font.Color = clWindowText
              CalendarAttributes.Font.Height = -11
              CalendarAttributes.Font.Name = 'MS Sans Serif'
              CalendarAttributes.Font.Style = []
              ButtonStyle = cbsCustom
              DataField = 'PARDATAVENC'
              DataSource = dsParcelas
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
            end
            object DBedtObservacao: TDBEdit
              Left = 16
              Top = 120
              Width = 625
              Height = 21
              DataField = 'PAROBSERVACAO'
              DataSource = dsParcelas
              TabOrder = 7
            end
            object DBcboTipoOperParcela: TwwDBLookupCombo
              Left = 376
              Top = 24
              Width = 265
              Height = 21
              DropDownAlignment = taLeftJustify
              Selected.Strings = (
                'DESCTIPOOPERACAO'#9'60'#9'DESCTIPOOPERACAO')
              DataField = 'TIPOOPER'
              DataSource = dsParcelas
              LookupTable = qryLookTipoOperParcela
              LookupField = 'IDTIPOOPERACAO'
              Style = csDropDownList
              DropDownWidth = 8
              TabOrder = 2
              AutoDropDown = True
              ShowButton = True
              AllowClearKey = True
              OnCloseUp = DBcboTipoOperParcelaCloseUp
            end
            object DBedtParcela: TDBEdit
              Left = 96
              Top = 24
              Width = 265
              Height = 21
              DataField = 'PARPARCELA'
              DataSource = dsParcelas
              TabOrder = 1
            end
            object DBedtNoParcela: TDBEdit
              Left = 16
              Top = 24
              Width = 65
              Height = 21
              DataField = 'PARNUMERO'
              DataSource = dsParcelas
              TabOrder = 0
            end
            object DBedtVlrOMParcela: TDBEdit
              Left = 16
              Top = 72
              Width = 161
              Height = 21
              DataField = 'PARVLROM'
              DataSource = dsParcelas
              TabOrder = 3
              OnExit = DBedtVlrOMParcelaExit
            end
            object DBedtVlrParcela: TDBEdit
              Left = 352
              Top = 72
              Width = 161
              Height = 21
              DataField = 'PARVLR'
              DataSource = dsParcelas
              Enabled = False
              TabOrder = 5
            end
          end
        end
      end
      inherited Dock973: TDock97
        Width = 794
      end
      inherited Dock974: TDock97
        Left = 708
        Height = 335
      end
    end
  end
  inherited Dock972: TDock97
    Width = 804
    inherited Toolbar971: TToolbar97
      inherited sbtnInserir: TToolbarButton97
        Width = 73
        Caption = '&Nova'
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
        Left = 73
        Width = 73
        Enabled = False
        Visible = False
      end
      inherited sbtnProcurar: TToolbarButton97
        Left = 219
        Width = 73
        Enabled = False
        Visible = False
      end
      inherited sbtnApagar: TToolbarButton97
        Left = 146
        Width = 73
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
      object sbtnNovoBem: TToolbarButton97
        Left = 292
        Top = 0
        Width = 73
        Height = 41
        AllowAllUp = True
        GroupIndex = 1
        Caption = '&Bem Novo'
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
        Layout = blGlyphTop
        NumGlyphs = 2
        Opaque = False
        Spacing = 0
        OnClick = sbtnNovoBemClick
      end
    end
  end
  inherited Dock971: TDock97
    Top = 443
    Width = 804
    inherited tb97Fundo: TToolbar97
      Left = 546
      DockPos = 546
    end
    inherited TB97oKCancelar: TToolbar97
      Left = 377
      DockPos = 377
    end
  end
  inherited ivTradutor: TIvExtendedTranslator
    Left = 65499
    Top = 65499
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
    Left = 224
    Top = 363
  end
  inherited ds: TwwDataSource
    Left = 440
    Top = 0
  end
  inherited upd: TUpdateSQL
    ModifySQL.Strings = (
      'update OPERACAOINVEST'
      'set'
      '  IDOPERACAOINVEST = :IDOPERACAOINVEST,'
      '  IDINVESTIMENTO = :IDINVESTIMENTO,'
      '  EMPRESAPROP = :EMPRESAPROP,'
      '  IDCARTEIRAINVEST = :IDCARTEIRAINVEST,'
      '  IDTIPOINVEST = :IDTIPOINVEST,'
      '  IDTIPOOPERACAO = :IDTIPOOPERACAO,'
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
      
        '  (IDOPERACAOINVEST, IDINVESTIMENTO, EMPRESAPROP, IDCARTEIRAINVE' +
        'ST, IDTIPOINVEST, '
      
        '   IDTIPOOPERACAO, DATAOPERACAO, NUMDOCUMENTO, QTDEOPERACAO, PRE' +
        'COUNITOPERACAO, '
      
        '   VLROPERACAO, IDCUSTODIANTE, IDINSTFIN, DATAVENCOPER, IDFORCLI' +
        ', VLROPERACAOOM, '
      '   MOECODIGO, OBSERVACAO)'
      'values'
      
        '  (:IDOPERACAOINVEST, :IDINVESTIMENTO, :EMPRESAPROP, :IDCARTEIRA' +
        'INVEST, '
      
        '   :IDTIPOINVEST, :IDTIPOOPERACAO, :DATAOPERACAO, :NUMDOCUMENTO,' +
        ' :QTDEOPERACAO, '
      
        '   :PRECOUNITOPERACAO, :VLROPERACAO, :IDCUSTODIANTE, :IDINSTFIN,' +
        ' :DATAVENCOPER, '
      '   :IDFORCLI, :VLROPERACAOOM, :MOECODIGO, :OBSERVACAO)')
    DeleteSQL.Strings = (
      'delete from OPERACAOINVEST'
      'where'
      '  IDOPERACAOINVEST = :OLD_IDOPERACAOINVEST')
    Left = 376
    Top = 0
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
    Left = 687
    Top = 36
  end
  inherited ImlPadrao: TImageList
    Left = 529
    Top = 66
  end
  inherited CmeCadastro: TCmEventosCadastro
    OnFind = CmeCadastroFind
    Left = 382
  end
  inherited qry: TwwQuery
    SQL.Strings = (
      'SELECT'
      '   IDOPERACAOINVEST, IDINVESTIMENTO, EMPRESAPROP,'
      '   IDCARTEIRAINVEST, IDTIPOINVEST, IDTIPOOPERACAO,'
      '   DATAOPERACAO, NUMDOCUMENTO, QTDEOPERACAO,'
      '   PRECOUNITOPERACAO, VLROPERACAO, IDCUSTODIANTE,'
      '   IDINSTFIN, DATAVENCOPER, IDFORCLI, VLROPERACAOOM,'
      '   MOECODIGO, OBSERVACAO'
      'FROM'
      '   OPERACAOINVEST'
      'WHERE'
      '   IDOPERACAOINVEST =:OPERACAO')
    Left = 408
    Top = 0
    ParamData = <
      item
        DataType = ftInteger
        Name = 'OPERACAO'
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
    object qryNUMDOCUMENTO: TStringField
      FieldName = 'NUMDOCUMENTO'
      Origin = 'OPERACAOINVEST.NUMDOCUMENTO'
      Size = 30
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
      DisplayFormat = '###,###,###,##0.00;(###,###,###,##0.00)'
      EditFormat = '###,###,###,##0.00;(###,###,###,##0.00)'
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
      DisplayFormat = '###,###,###,##0.00;(###,###,###,##0.00)'
      EditFormat = '###,###,###,##0.00;(###,###,###,##0.00)'
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
  end
  inherited CmeDetalhe: TCmEventosCadastro
    Left = 464
    Top = 68
  end
  object MontaSelectImovel: TMontaSelect
    Template.IdConsulta = 0
    Caption = 'Seleciona'
    Colunas.Strings = (
      'IM.IMONOME'
      'I.IMONOME'
      'I.IMONOMEENDERECO'
      'I.IMOLOGRADOURO'
      'I.IMOBAIRRO'
      'I.IMOCIDADE')
    TipodeDado.Strings = (
      'C'
      'C'
      'C'
      'C'
      'C'
      'C')
    Descricao.Strings = (
      'Imóvel Mestre'
      'Nome do Imóvel'
      'Nome do Endereço'
      'Logradouro'
      'Bairro'
      'Cidade')
    Tabelas.Strings = (
      'IMOVEL I'
      'IMOVEL IM')
    CamposChave.Strings = (
      'I.IDIMOVEL'
      'I.IDIMOVELMESTRE')
    Filtro.Strings = (
      'I.IDIMOVELMESTRE = IM.IDIMOVEL (+)'
      'I.FLGTIPOIMOVEL = 1')
    Mascaras.Strings = (
      ''
      ''
      ''
      ''
      ''
      '')
    Larguras.Strings = (
      '30'
      '30'
      '30'
      '10'
      '20'
      '20')
    DataBaseName = 'BaseDados'
    RepeteConsulta = False
    UsaDistinct = False
    SalvaConsulta = False
    ExibePergunta = True
    MultiSelect = False
    Left = 688
    Top = 24
  end
  object MontaSelectCarteira: TMontaSelect
    Template.IdConsulta = 0
    Caption = 'Seleciona'
    Colunas.Strings = (
      'C.DESCCARTINVEST')
    TipodeDado.Strings = (
      'C')
    Descricao.Strings = (
      'Nome')
    Tabelas.Strings = (
      'CARTEIRAINVEST C')
    CamposChave.Strings = (
      'C.IDCARTEIRAINVEST')
    Mascaras.Strings = (
      '')
    Larguras.Strings = (
      '60')
    DataBaseName = 'BaseDados'
    RepeteConsulta = False
    UsaDistinct = False
    SalvaConsulta = False
    ExibePergunta = True
    MultiSelect = False
    Left = 688
    Top = 12
  end
  object MontaSelectBem: TMontaSelect
    Template.IdConsulta = 0
    Caption = 'Seleciona'
    Colunas.Strings = (
      'B.PLACA'
      'B.DESBEM'
      'C.DESCCONJUNTO'
      'L.NOME')
    TipodeDado.Strings = (
      'N'
      'C'
      'C'
      'C')
    Descricao.Strings = (
      'Nº de Tombamento'
      'Descrição'
      'Conjunto'
      'Localização')
    Tabelas.Strings = (
      'BEM B'
      'CONJUNTO C'
      'LOCALIZACAO L')
    CamposChave.Strings = (
      'B.IDBEM')
    Filtro.Strings = (
      'B.IDCONJUNTO = C.IDCONJUNTO (+)'
      'C.IDLOCALIZACAO = L.IDLOCALIZACAO (+)')
    Mascaras.Strings = (
      ''
      ''
      ''
      '')
    Larguras.Strings = (
      '14'
      '40'
      '40'
      '45')
    DataBaseName = 'BaseDados'
    RepeteConsulta = False
    UsaDistinct = False
    SalvaConsulta = False
    ExibePergunta = True
    MultiSelect = False
    Left = 688
  end
  object qryLookForCli: TwwQuery
    DatabaseName = 'BaseDados'
    ValidateWithMask = True
    Left = 736
    Top = 332
  end
  object qryLookMoeda: TwwQuery
    DatabaseName = 'BaseDados'
    SQL.Strings = (
      'SELECT'
      '  MOECODIGO, MOEDESC, MOESIGLA'
      'FROM'
      '  MOEDA'
      'ORDER BY '
      '  MOESIGLA')
    ValidateWithMask = True
    Left = 736
    Top = 320
    object qryLookMoedaMOESIGLA: TStringField
      DisplayWidth = 10
      FieldName = 'MOESIGLA'
      Size = 10
    end
    object qryLookMoedaMOECODIGO: TFloatField
      DisplayWidth = 10
      FieldName = 'MOECODIGO'
      Visible = False
    end
    object qryLookMoedaMOEDESC: TStringField
      DisplayWidth = 20
      FieldName = 'MOEDESC'
      Visible = False
    end
  end
  object qryLookCarteira: TwwQuery
    DatabaseName = 'BaseDados'
    SQL.Strings = (
      'SELECT'
      '   IDCARTEIRAINVEST, DESCCARTINVEST, IDGESTORCARTEIRA'
      'FROM'
      '   CARTEIRAINVEST'
      'WHERE'
      '   IDCARTEIRAINVEST =:CARTEIRA'
      'ORDER BY'
      '   DESCCARTINVEST')
    ValidateWithMask = True
    Left = 736
    Top = 308
    ParamData = <
      item
        DataType = ftInteger
        Name = 'CARTEIRA'
        ParamType = ptUnknown
      end>
    object qryLookCarteiraDESCCARTINVEST: TStringField
      DisplayWidth = 60
      FieldName = 'DESCCARTINVEST'
      Origin = 'CARTEIRAINVEST.DESCCARTINVEST'
      Size = 60
    end
    object qryLookCarteiraIDCARTEIRAINVEST: TFloatField
      DisplayWidth = 10
      FieldName = 'IDCARTEIRAINVEST'
      Origin = 'CARTEIRAINVEST.IDCARTEIRAINVEST'
      Visible = False
    end
    object qryLookCarteiraIDGESTORCARTEIRA: TFloatField
      DisplayWidth = 10
      FieldName = 'IDGESTORCARTEIRA'
      Origin = 'CARTEIRAINVEST.IDGESTORCARTEIRA'
      Visible = False
    end
  end
  object qryLookTipoOper: TwwQuery
    DatabaseName = 'BaseDados'
    SQL.Strings = (
      'SELECT'
      '   IDTIPOOPERACAO, DESCTIPOOPERACAO, NATUREZAOPERACAO,'
      '   FLGGERACAF, FLGGERACAPCAR, RECPAG'
      'FROM'
      '   TIPOOPERACAO'
      'WHERE'
      '   IDTIPOINVEST = 3'
      'ORDER BY'
      '   DESCTIPOOPERACAO')
    ValidateWithMask = True
    Left = 736
    Top = 296
    object qryLookTipoOperDESCTIPOOPERACAO: TStringField
      DisplayWidth = 60
      FieldName = 'DESCTIPOOPERACAO'
      Origin = 'TIPOOPERACAO.DESCTIPOOPERACAO'
      Size = 60
    end
    object qryLookTipoOperIDTIPOOPERACAO: TFloatField
      FieldName = 'IDTIPOOPERACAO'
      Origin = 'TIPOOPERACAO.IDTIPOOPERACAO'
      Visible = False
    end
    object qryLookTipoOperNATUREZAOPERACAO: TStringField
      FieldName = 'NATUREZAOPERACAO'
      Origin = 'TIPOOPERACAO.NATUREZAOPERACAO'
      Visible = False
      Size = 1
    end
    object qryLookTipoOperFLGGERACAF: TFloatField
      DisplayWidth = 10
      FieldName = 'FLGGERACAF'
      Origin = 'TIPOOPERACAO.FLGGERACAF'
      Visible = False
    end
    object qryLookTipoOperFLGGERACAPCAR: TFloatField
      DisplayWidth = 10
      FieldName = 'FLGGERACAPCAR'
      Origin = 'TIPOOPERACAO.FLGGERACAPCAR'
      Visible = False
    end
    object qryLookTipoOperRECPAG: TStringField
      FieldName = 'RECPAG'
      Origin = 'TIPOOPERACAO.RECPAG'
      Size = 1
    end
  end
  object qryLookImovel: TwwQuery
    CachedUpdates = True
    DatabaseName = 'BaseDados'
    SQL.Strings = (
      'SELECT'
      '   I.IDIMOVEL, I.IMONOME, I.IDCARTEIRAINVEST, I.CODTIPIMOVEL,'
      '   I.IDIMOVELMESTRE, I.CODSUBCONTA,'
      '   IM.IMONOME AS NOMEMESTRE '
      'FROM'
      '   IMOVEL I, IMOVEL IM'
      'WHERE'
      '   ( I.IDIMOVEL =:IMOVEL )'
      '   AND'#9
      '   ( I.IDIMOVELMESTRE = IM.IDIMOVEL (+) )')
    ValidateWithMask = True
    Left = 736
    Top = 284
    ParamData = <
      item
        DataType = ftInteger
        Name = 'IMOVEL'
        ParamType = ptUnknown
      end>
    object qryLookImovelIMONOME: TStringField
      DisplayLabel = 'Nome do Imóvel'
      DisplayWidth = 60
      FieldName = 'IMONOME'
      Size = 60
    end
    object qryLookImovelNOMEMESTRE: TStringField
      DisplayWidth = 60
      FieldName = 'NOMEMESTRE'
      Visible = False
      Size = 60
    end
    object qryLookImovelIDIMOVEL: TFloatField
      FieldName = 'IDIMOVEL'
      Visible = False
    end
    object qryLookImovelIDCARTEIRAINVEST: TFloatField
      FieldName = 'IDCARTEIRAINVEST'
      Visible = False
    end
    object qryLookImovelCODTIPIMOVEL: TStringField
      FieldName = 'CODTIPIMOVEL'
      Visible = False
      Size = 5
    end
    object qryLookImovelIDIMOVELMESTRE: TFloatField
      FieldName = 'IDIMOVELMESTRE'
      Visible = False
    end
    object qryLookImovelCODSUBCONTA: TFloatField
      FieldName = 'CODSUBCONTA'
    end
  end
  object qryDespesasXTipoOper: TwwQuery
    CachedUpdates = True
    DatabaseName = 'BaseDados'
    SQL.Strings = (
      'SELECT'
      '   X.IDTIPODESPINVEST, X.CODTIPDOC,'
      '   X.FLGGERACONTAB, X.FLGGERACAPCAR,'
      '   X.FLGGERACAF, X.RECPAG,'
      '   T.DESCTIPODESPINV, T.NATUREZAOPERACAO,'
      '   (0) AS VLROM, (0) AS MOEDA, (0) AS VLR,'
      
        '   (0) AS FORCLI, to_date('#39'01/01/1980'#39', '#39'dd/mm/yyyy'#39') AS DATAVEN' +
        'C'
      'FROM'
      '   DESPESASXTIPOOPER X, TIPODESPINVEST T'
      'WHERE'
      '   ('
      '   ( X.IDTIPOINVEST = 3 ) AND'
      '   ( X.IDTIPOOPERACAO =:TIPOOPER )'
      '   )'
      '   AND'
      '   ( X.IDTIPODESPINVEST = T.IDTIPODESPINVEST )')
    UpdateObject = updDespXTipoOper
    ValidateWithMask = True
    Left = 320
    Top = 364
    ParamData = <
      item
        DataType = ftInteger
        Name = 'TIPOOPER'
        ParamType = ptUnknown
      end>
    object qryDespesasXTipoOperDESCTIPODESPINV: TStringField
      DisplayLabel = 'Rubrica'
      DisplayWidth = 35
      FieldName = 'DESCTIPODESPINV'
      Size = 60
    end
    object qryDespesasXTipoOperVLROM: TFloatField
      DisplayLabel = 'Valor OM'
      DisplayWidth = 17
      FieldName = 'VLROM'
      DisplayFormat = '###,###,###,##0.00;(###,###,###,##0.00)'
      EditFormat = '###,###,###,##0.00;(###,###,###,##0.00)'
    end
    object qryDespesasXTipoOperMOEDA: TFloatField
      DisplayLabel = 'Moeda'
      DisplayWidth = 14
      FieldName = 'MOEDA'
    end
    object qryDespesasXTipoOperVLR: TFloatField
      DisplayLabel = 'Valor'
      DisplayWidth = 17
      FieldName = 'VLR'
      DisplayFormat = '###,###,###,##0.00;(###,###,###,##0.00)'
      EditFormat = '###,###,###,##0.00;(###,###,###,##0.00)'
    end
    object qryDespesasXTipoOperIDTIPODESPINVEST: TFloatField
      FieldName = 'IDTIPODESPINVEST'
      Visible = False
    end
    object qryDespesasXTipoOperRECPAG: TStringField
      FieldName = 'RECPAG'
      Visible = False
      Size = 1
    end
    object qryDespesasXTipoOperCODTIPDOC: TFloatField
      FieldName = 'CODTIPDOC'
      Visible = False
    end
    object qryDespesasXTipoOperFLGGERACONTAB: TFloatField
      FieldName = 'FLGGERACONTAB'
      Visible = False
    end
    object qryDespesasXTipoOperFLGGERACAPCAR: TFloatField
      FieldName = 'FLGGERACAPCAR'
      Visible = False
    end
    object qryDespesasXTipoOperFLGGERACAF: TFloatField
      FieldName = 'FLGGERACAF'
      Visible = False
    end
    object qryDespesasXTipoOperNATUREZAOPERACAO: TStringField
      FieldName = 'NATUREZAOPERACAO'
      Visible = False
      Size = 1
    end
    object qryDespesasXTipoOperFORCLI: TFloatField
      FieldName = 'FORCLI'
      Visible = False
    end
    object qryDespesasXTipoOperDATAVENC: TDateTimeField
      FieldName = 'DATAVENC'
    end
  end
  object updImovelxBem: TUpdateSQL
    ModifySQL.Strings = (
      'update IMOVELXBEM'
      'set'
      '  IDBEM = :IDBEM,'
      '  IDIMOVEL = :IDIMOVEL,'
      '  IDPESSOA = :IDPESSOA,'
      '  IXBGRUPO = :IXBGRUPO,'
      '  IXBPERCENT = :IXBPERCENT'
      'where'
      '  IDBEM = :OLD_IDBEM and'
      '  IDPESSOA = :OLD_IDPESSOA')
    InsertSQL.Strings = (
      'insert into IMOVELXBEM'
      '  (IDBEM, IDIMOVEL, IDPESSOA, IXBGRUPO, IXBPERCENT)'
      'values'
      '  (:IDBEM, :IDIMOVEL, :IDPESSOA, :IXBGRUPO, :IXBPERCENT)')
    DeleteSQL.Strings = (
      'delete from IMOVELXBEM'
      'where'
      '  IDBEM = :OLD_IDBEM and'
      '  IDPESSOA = :OLD_IDPESSOA')
    Left = 224
    Top = 351
  end
  object qryImovelxBem: TwwQuery
    CachedUpdates = True
    OnCalcFields = qryImovelxBemCalcFields
    DatabaseName = 'BaseDados'
    SQL.Strings = (
      'SELECT'
      '   IXB.IDBEM, IXB.IDIMOVEL, IXB.IDPESSOA, IXB.IXBGRUPO,'
      '   IXB.IXBPERCENT'
      'FROM'
      '   IMOVELXBEM IXB'
      'WHERE'
      '   ( IXB.IDPESSOA =:EMPRESAPROP ) AND'
      '   ( IXB.IDIMOVEL =:IMOVEL )')
    UpdateObject = updImovelxBem
    ValidateWithMask = True
    Left = 224
    Top = 339
    ParamData = <
      item
        DataType = ftInteger
        Name = 'EMPRESAPROP'
        ParamType = ptUnknown
      end
      item
        DataType = ftInteger
        Name = 'IMOVEL'
        ParamType = ptUnknown
      end>
    object qryImovelxBemPLACA: TFloatField
      DisplayLabel = 'Nº Tombamento'
      DisplayWidth = 12
      FieldKind = fkCalculated
      FieldName = 'Placa'
      DisplayFormat = '###########0'
      EditFormat = '###########0'
      Calculated = True
    end
    object qryImovelxBemDESC: TStringField
      DisplayLabel = 'Descrição'
      DisplayWidth = 44
      FieldKind = fkCalculated
      FieldName = 'Desc'
      Size = 200
      Calculated = True
    end
    object qryImovelxBemGRUPO: TStringField
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
      DisplayFormat = '##0.00'
      EditFormat = '##0.00'
    end
    object qryImovelxBemIDBEM: TFloatField
      Tag = 1
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
  end
  object qryPreencheBem: TwwQuery
    CachedUpdates = True
    DatabaseName = 'BaseDados'
    SQL.Strings = (
      'SELECT'
      '   IDBEM, IDPESSOA, PLACA, DESBEM'
      'FROM'
      '   BEM'
      'WHERE'
      '   ( IDBEM =:BEM )'
      '')
    ValidateWithMask = True
    Left = 736
    Top = 272
    ParamData = <
      item
        DataType = ftInteger
        Name = 'BEM'
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
  object qryLookTipoImovel: TwwQuery
    DatabaseName = 'BaseDados'
    SQL.Strings = (
      'SELECT'
      '   CODTIPIMOVEL, DESCTIPOIMOVEL'
      'FROM'
      '   TIPOIMOVEL'
      'ORDER BY'
      '   DESCTIPOIMOVEL')
    ValidateWithMask = True
    Left = 736
    Top = 260
    object qryLookTipoImovelDESCTIPOIMOVEL: TStringField
      DisplayWidth = 25
      FieldName = 'DESCTIPOIMOVEL'
      Origin = 'TIPOIMOVEL.DESCTIPOIMOVEL'
      Size = 25
    end
    object qryLookTipoImovelCODTIPIMOVEL: TStringField
      DisplayWidth = 5
      FieldName = 'CODTIPIMOVEL'
      Origin = 'TIPOIMOVEL.CODTIPIMOVEL'
      Visible = False
      Size = 5
    end
  end
  object qryAtualizaImovel: TwwQuery
    DatabaseName = 'BaseDados'
    SQL.Strings = (
      'UPDATE'
      '   IMOVEL'
      'SET'
      '   IDCARTEIRAINVEST =:CARTEIRA,'
      '   CODTIPIMOVEL =:TIPO'
      'WHERE'
      '   IDIMOVEL =:IMOVEL')
    ValidateWithMask = True
    Left = 736
    Top = 248
    ParamData = <
      item
        DataType = ftInteger
        Name = 'CARTEIRA'
        ParamType = ptUnknown
      end
      item
        DataType = ftString
        Name = 'TIPO'
        ParamType = ptUnknown
      end
      item
        DataType = ftInteger
        Name = 'IMOVEL'
        ParamType = ptUnknown
      end>
  end
  object dsDespXTipoOper: TwwDataSource
    DataSet = qryDespesasXTipoOper
    Left = 320
    Top = 352
  end
  object updDespXTipoOper: TUpdateSQL
    ModifySQL.Strings = (
      'update DESPESASXTIPOOPER'
      'set'
      '  IDTIPOINVEST = :IDTIPOINVEST,'
      '  IDTIPOOPERACAO = :IDTIPOOPERACAO,'
      '  IDTIPODESPINVEST = :IDTIPODESPINVEST'
      'where'
      '  IDTIPOINVEST = :OLD_IDTIPOINVEST and'
      '  IDTIPOOPERACAO = :OLD_IDTIPOOPERACAO and'
      '  IDTIPODESPINVEST = :OLD_IDTIPODESPINVEST')
    InsertSQL.Strings = (
      'insert into DESPESASXTIPOOPER'
      '  (IDTIPOINVEST, IDTIPOOPERACAO, IDTIPODESPINVEST)'
      'values'
      '  (:IDTIPOINVEST, :IDTIPOOPERACAO, :IDTIPODESPINVEST)')
    DeleteSQL.Strings = (
      'delete from DESPESASXTIPOOPER'
      'where'
      '  IDTIPOINVEST = :OLD_IDTIPOINVEST and'
      '  IDTIPOOPERACAO = :OLD_IDTIPOOPERACAO and'
      '  IDTIPODESPINVEST = :OLD_IDTIPODESPINVEST')
    Left = 320
    Top = 340
  end
  object qryInsertRubrica: TwwQuery
    DatabaseName = 'BaseDados'
    SQL.Strings = (
      'INSERT INTO DESPOPERINVEST'
      '   ('
      '   IDDESPOPERINVEST, MOECODIGO, IDFORCLI,'
      '   EMPRESAPROP, IDREGRACALCUSADA, IDTIPOINVEST,'
      '   IDTIPOOPERACAO, IDTIPODESPINVEST, IDOPERACAOINVEST,'
      '   VLRDESPOPER, DATAVENCDESPOPER, IDREGRAVENCUSADA,'
      '   FLGCALCDIARIO, VLRDESPOPEROM, DATAOPERACAO'
      '   )'
      'VALUES'
      '   ('
      '   :IDRUBRICA, :MOEDA, :FORCLI,'
      '   :EMPRESAPROP, NULL, 3,'
      '   :TIPOOPER, :TIPORUBRICA, :IDOPERACAO,'
      '   :VALOR, :DATAVENC, NULL,'
      '   0, :VALOROM, :DATAOPER'
      '   )')
    ValidateWithMask = True
    Left = 736
    Top = 236
    ParamData = <
      item
        DataType = ftInteger
        Name = 'IDRUBRICA'
        ParamType = ptUnknown
      end
      item
        DataType = ftInteger
        Name = 'MOEDA'
        ParamType = ptUnknown
      end
      item
        DataType = ftInteger
        Name = 'FORCLI'
        ParamType = ptUnknown
      end
      item
        DataType = ftInteger
        Name = 'EMPRESAPROP'
        ParamType = ptUnknown
      end
      item
        DataType = ftInteger
        Name = 'TIPOOPER'
        ParamType = ptUnknown
      end
      item
        DataType = ftInteger
        Name = 'TIPORUBRICA'
        ParamType = ptUnknown
      end
      item
        DataType = ftInteger
        Name = 'IDOPERACAO'
        ParamType = ptUnknown
      end
      item
        DataType = ftFloat
        Name = 'VALOR'
        ParamType = ptUnknown
      end
      item
        DataType = ftDate
        Name = 'DATAVENC'
        ParamType = ptUnknown
      end
      item
        DataType = ftFloat
        Name = 'VALOROM'
        ParamType = ptUnknown
      end
      item
        DataType = ftDate
        Name = 'DATAOPER'
        ParamType = ptUnknown
      end>
  end
  object qryInsertOperParcela: TwwQuery
    DatabaseName = 'BaseDados'
    SQL.Strings = (
      'INSERT INTO OPERACAOINVEST'
      '   ('
      '   IDOPERACAOINVEST, IDCUSTODIANTE, IDCARTEIRAINVEST,'
      '   IDTIPOINVEST, IDTIPOOPERACAO, IDINSTFIN,'
      '   DATAOPERACAO, NUMDOCUMENTO, QTDEOPERACAO,'
      '   PRECOUNITOPERACAO, VLROPERACAO, EMPRESAPROP,'
      '   IDINVESTIMENTO, DATAVENCOPER, IDMODULO,'
      '   MOECODIGO, VLROPERACAOOM, IDFORCLI,'
      '   IDCORRETVALORES, IDCONTRATOIMOVEL, OBSERVACAO'
      '   )'
      'VALUES'
      '   ('
      '   :IDOPERACAO, NULL, :CARTEIRA,'
      '   3, :TIPOOPER, NULL,'
      '   :DATAOPER, NULL, :QTDE,'
      '   :PRECOUNITOPERACAO, :VLROPERACAO, :EMPRESAPROP,'
      '   :IDINVESTIMENTO, :DATAVENCOPER, :IDMODULO,'
      '   :MOECODIGO, :VLROPERACAOOM, :IDFORCLI,'
      '   NULL, NULL, :OBSERVACAO'
      '   )')
    ValidateWithMask = True
    Left = 736
    Top = 224
    ParamData = <
      item
        DataType = ftInteger
        Name = 'IDOPERACAO'
        ParamType = ptUnknown
      end
      item
        DataType = ftInteger
        Name = 'CARTEIRA'
        ParamType = ptUnknown
      end
      item
        DataType = ftInteger
        Name = 'TIPOOPER'
        ParamType = ptUnknown
      end
      item
        DataType = ftDate
        Name = 'DATAOPER'
        ParamType = ptUnknown
      end
      item
        DataType = ftFloat
        Name = 'QTDE'
        ParamType = ptUnknown
      end
      item
        DataType = ftFloat
        Name = 'PRECOUNITOPERACAO'
        ParamType = ptUnknown
      end
      item
        DataType = ftFloat
        Name = 'VLROPERACAO'
        ParamType = ptUnknown
      end
      item
        DataType = ftInteger
        Name = 'EMPRESAPROP'
        ParamType = ptUnknown
      end
      item
        DataType = ftInteger
        Name = 'IDINVESTIMENTO'
        ParamType = ptUnknown
      end
      item
        DataType = ftDate
        Name = 'DATAVENCOPER'
        ParamType = ptUnknown
      end
      item
        DataType = ftInteger
        Name = 'IDMODULO'
        ParamType = ptUnknown
      end
      item
        DataType = ftInteger
        Name = 'MOECODIGO'
        ParamType = ptUnknown
      end
      item
        DataType = ftFloat
        Name = 'VLROPERACAOOM'
        ParamType = ptUnknown
      end
      item
        DataType = ftInteger
        Name = 'IDFORCLI'
        ParamType = ptUnknown
      end
      item
        DataType = ftString
        Name = 'OBSERVACAO'
        ParamType = ptUnknown
      end>
  end
  object updParcelas: TUpdateSQL
    ModifySQL.Strings = (
      'update PARCELASIMOB'
      'set'
      '  IDPARCELA = :IDPARCELA,'
      '  PARNUMERO = :PARNUMERO,'
      '  PARPARCELA = :PARPARCELA,'
      '  IDOPERACAOINVEST = :IDOPERACAOINVEST,'
      '  IDOPERPARCELA = :IDOPERPARCELA,'
      '  IDIMOVEL = :IDIMOVEL,'
      '  MOECODIGO = :MOECODIGO,'
      '  PARVLROM = :PARVLROM,'
      '  PARVLR = :PARVLR,'
      '  PARDATAVENC = :PARDATAVENC,'
      '  PAROBSERVACAO = :PAROBSERVACAO'
      'where'
      '  IDPARCELA = :OLD_IDPARCELA')
    InsertSQL.Strings = (
      'insert into PARCELASIMOB'
      
        '  (IDPARCELA, PARNUMERO, PARPARCELA, IDOPERACAOINVEST, IDOPERPAR' +
        'CELA, IDIMOVEL, '
      '   MOECODIGO, PARVLROM, PARVLR, PARDATAVENC, PAROBSERVACAO)'
      'values'
      
        '  (:IDPARCELA, :PARNUMERO, :PARPARCELA, :IDOPERACAOINVEST, :IDOP' +
        'ERPARCELA, '
      
        '   :IDIMOVEL, :MOECODIGO, :PARVLROM, :PARVLR, :PARDATAVENC, :PAR' +
        'OBSERVACAO)')
    DeleteSQL.Strings = (
      'delete from PARCELASIMOB'
      'where'
      '  IDPARCELA = :OLD_IDPARCELA')
    Left = 136
    Top = 364
  end
  object dsParcelas: TwwDataSource
    DataSet = qryParcelas
    Left = 136
    Top = 352
  end
  object qryParcelas: TwwQuery
    CachedUpdates = True
    DatabaseName = 'BaseDados'
    SQL.Strings = (
      'SELECT'
      '   P.IDPARCELA, P.PARNUMERO, P.PARPARCELA,'
      '   P.IDOPERACAOINVEST, P.IDOPERPARCELA, P.IDCONTRATOIMOVEL,'
      '   P.IDIMOVEL, P.MOECODIGO, P.PARVLROM, P.PARVLR,'
      '   P.PARDATAVENC, P.PAROBSERVACAO, '#39' '#39' AS NATUREZA,'
      '   M.MOESIGLA, 0 AS TIPOOPER, 0 AS PARQTDE, '#39' '#39' AS RECPAG'
      'FROM'
      '   PARCELASIMOB P, MOEDA M'
      'WHERE'
      '   ( IDOPERACAOINVEST =:OPERACAO )'
      '   AND'
      '   ( P.MOECODIGO = M.MOECODIGO )'
      'ORDER BY '
      '   P.PARNUMERO')
    UpdateObject = updParcelas
    ValidateWithMask = True
    Left = 136
    Top = 340
    ParamData = <
      item
        DataType = ftInteger
        Name = 'OPERACAO'
        ParamType = ptUnknown
      end>
    object qryParcelasPARNUMERO: TFloatField
      DisplayLabel = 'Nº'
      DisplayWidth = 6
      FieldName = 'PARNUMERO'
      DisplayFormat = '000'
      EditFormat = '000'
    end
    object qryParcelasPARPARCELA: TStringField
      DisplayLabel = 'Descrição da Parcela'
      DisplayWidth = 25
      FieldName = 'PARPARCELA'
    end
    object qryParcelasPARVLROM: TFloatField
      DisplayLabel = 'Valor OM'
      DisplayWidth = 16
      FieldName = 'PARVLROM'
      DisplayFormat = '###,###,###,##0.00;(###,###,###,##0.00)'
      EditFormat = '###,###,###,##0.00;(###,###,###,##0.00)'
    end
    object qryParcelasPARVLR: TFloatField
      DisplayLabel = 'Valor'
      DisplayWidth = 16
      FieldName = 'PARVLR'
      DisplayFormat = '###,###,###,##0.00;(###,###,###,##0.00)'
      EditFormat = '###,###,###,##0.00;(###,###,###,##0.00)'
    end
    object qryParcelasPARDATAVENC: TDateTimeField
      DisplayLabel = 'Vencimento'
      DisplayWidth = 12
      FieldName = 'PARDATAVENC'
    end
    object qryParcelasMOESIGLA: TStringField
      FieldName = 'MOESIGLA'
      Visible = False
      Size = 10
    end
    object qryParcelasPAROBSERVACAO: TStringField
      DisplayWidth = 200
      FieldName = 'PAROBSERVACAO'
      Visible = False
      Size = 200
    end
    object qryParcelasNATUREZA: TStringField
      DisplayWidth = 1
      FieldName = 'NATUREZA'
      Visible = False
      Size = 1
    end
    object qryParcelasIDPARCELA: TFloatField
      DisplayWidth = 10
      FieldName = 'IDPARCELA'
      Visible = False
    end
    object qryParcelasIDOPERACAOINVEST: TFloatField
      DisplayWidth = 10
      FieldName = 'IDOPERACAOINVEST'
      Visible = False
    end
    object qryParcelasIDOPERPARCELA: TFloatField
      DisplayWidth = 10
      FieldName = 'IDOPERPARCELA'
      Visible = False
    end
    object qryParcelasMOECODIGO: TFloatField
      DisplayWidth = 10
      FieldName = 'MOECODIGO'
      Visible = False
    end
    object qryParcelasIDIMOVEL: TFloatField
      DisplayWidth = 10
      FieldName = 'IDIMOVEL'
      Visible = False
    end
    object qryParcelasIDCONTRATOIMOVEL: TFloatField
      FieldName = 'IDCONTRATOIMOVEL'
    end
    object qryParcelasTIPOOPER: TFloatField
      FieldName = 'TIPOOPER'
    end
    object qryParcelasPARQTDE: TFloatField
      FieldName = 'PARQTDE'
    end
    object qryParcelasRECPAG: TStringField
      FieldName = 'RECPAG'
      Size = 1
    end
  end
  object qryLookTipoDespesa: TwwQuery
    CachedUpdates = True
    DatabaseName = 'BaseDados'
    SQL.Strings = (
      'SELECT'
      '   TD.IDTIPODESPINVEST, TD.DESCTIPODESPINV,'
      '   TD.NATUREZAOPERACAO, '
      '   TP.IDTIPOOPERACAO,'
      '   DX.RECPAG'
      'FROM'
      '   TIPOOPERACAO TP,'
      '   TIPODESPINVEST TD, DESPESASXTIPOOPER DX'
      'WHERE'
      '   ('
      '   ( TP.IDTIPOINVEST = 3 ) AND'
      '   ( TP.IDTIPOOPERACAO =:TIPOOPER )'
      '   )'
      '   AND'
      '   ('
      '   ( TP.IDTIPOOPERACAO = DX.IDTIPOOPERACAO ) AND'
      '   ( DX.IDTIPODESPINVEST = TD.IDTIPODESPINVEST )'
      '   )'
      'ORDER BY'
      '  TD.DESCTIPODESPINV')
    ValidateWithMask = True
    Left = 736
    Top = 212
    ParamData = <
      item
        DataType = ftInteger
        Name = 'TIPOOPER'
        ParamType = ptUnknown
      end>
    object qryLookTipoDespesaDESCTIPODESPINV: TStringField
      DisplayWidth = 60
      FieldName = 'DESCTIPODESPINV'
      Origin = '"CM.TIPODESPINVEST".DESCTIPODESPINV'
      Size = 60
    end
    object qryLookTipoDespesaIDTIPODESPINVEST: TFloatField
      DisplayWidth = 10
      FieldName = 'IDTIPODESPINVEST'
      Origin = '"CM.TIPODESPINVEST".IDTIPODESPINVEST'
      Visible = False
    end
    object qryLookTipoDespesaIDTIPOOPERACAO: TFloatField
      FieldName = 'IDTIPOOPERACAO'
    end
    object qryLookTipoDespesaNATUREZAOPERACAO: TStringField
      FieldName = 'NATUREZAOPERACAO'
      Size = 1
    end
    object qryLookTipoDespesaRECPAG: TStringField
      FieldName = 'RECPAG'
      Origin = 'DESPESASXTIPOOPER.RECPAG'
      Size = 1
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
    Left = 736
    Top = 200
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
  object qryLookTipoOperParcela: TwwQuery
    DatabaseName = 'BaseDados'
    SQL.Strings = (
      'SELECT'
      '   IDTIPOOPERACAO, DESCTIPOOPERACAO, NATUREZAOPERACAO,'
      '   FLGGERACAF, FLGGERACAPCAR, RECPAG'
      'FROM'
      '   TIPOOPERACAO'
      'WHERE'
      '   IDTIPOINVEST = 3'
      'ORDER BY'
      '   DESCTIPOOPERACAO')
    ValidateWithMask = True
    Left = 544
    object qryLookTipoOperParcelaIDTIPOOPERACAO: TFloatField
      FieldName = 'IDTIPOOPERACAO'
      Origin = 'TIPOOPERACAO.IDTIPOOPERACAO'
    end
    object qryLookTipoOperParcelaDESCTIPOOPERACAO: TStringField
      FieldName = 'DESCTIPOOPERACAO'
      Origin = 'TIPOOPERACAO.DESCTIPOOPERACAO'
      Size = 60
    end
    object qryLookTipoOperParcelaNATUREZAOPERACAO: TStringField
      FieldName = 'NATUREZAOPERACAO'
      Origin = 'TIPOOPERACAO.NATUREZAOPERACAO'
      Size = 1
    end
    object qryLookTipoOperParcelaFLGGERACAF: TFloatField
      FieldName = 'FLGGERACAF'
      Origin = 'TIPOOPERACAO.FLGGERACAF'
    end
    object qryLookTipoOperParcelaFLGGERACAPCAR: TFloatField
      FieldName = 'FLGGERACAPCAR'
      Origin = 'TIPOOPERACAO.FLGGERACAPCAR'
    end
    object qryLookTipoOperParcelaRECPAG: TStringField
      FieldName = 'RECPAG'
      Origin = 'TIPOOPERACAO.RECPAG'
      Size = 1
    end
  end
end
