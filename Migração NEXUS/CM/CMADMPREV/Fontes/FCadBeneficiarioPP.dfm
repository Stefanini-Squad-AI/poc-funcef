inherited FrmCadBeneficiarioPP: TFrmCadBeneficiarioPP
  Left = 5
  Top = 55
  Caption = 'Cadastro de Beneficiários Não Participantes'
  PixelsPerInch = 96
  TextHeight = 13
  inherited pnlFundo: TPanel
    inherited tbcDetalhe: TTabControlDetalhe
      Top = 58
      Height = 321
      Tabs.Strings = (
        'Documentação'
        'Endereços'
        'Telefones'
        'Contatos'
        'Dados do Beneficiário'
        'Benefícios do Beneficiário'
        'Histórico de Benefícios')
      detdbGrids.Strings = (
        ''
        'dbGrdDet'
        'dbgTelefone'
        'dbgContato'
        ''
        'DbgBeneficios'
        'dbgHstBenef')
      inherited pgctrlDetalhe: TPageControl
        Height = 262
        ActivePage = TbOutrosDados
        inherited tbsDocumento: TTabSheet
          inherited PgCtrlPesFisica_Padrao: TPageControl
            Height = 234
          end
          inherited PnlDocumentos_Padrao: TPanel
            Height = 234
            inherited pnlItemsDoc: TPanel
              Height = 232
            end
            inherited pnlFoto: TPanel
              Height = 232
              inherited Bevel1: TBevel
                Height = 201
              end
              inherited PnlAssociaFoto_Padrao: TPanel
                Top = 201
                Width = 198
              end
              inherited SbImagePessoa_Padrao: TScrollBox
                Width = 196
                Height = 201
              end
            end
            inherited lstDocumentos: TListView
              Height = 232
            end
          end
        end
        inherited tbsDet: TTabSheet
          inherited pnlControlesDet: TPanel
            Height = 234
            inherited grpTipoEnd: TGroupBox
              Height = 234
            end
          end
          inherited dbgrdDet: TwwDBGrid
            Height = 234
          end
        end
        inherited tbsTelefone: TTabSheet
          inherited dbgTelefone: TwwDBGrid
            Height = 234
          end
          inherited Panel1: TPanel
            Height = 234
          end
        end
        inherited tbsContato: TTabSheet
          inherited dbgContato: TwwDBGrid [0]
            Height = 234
          end
          inherited Panel2: TPanel [1]
            Height = 234
          end
        end
        object TbOutrosDados: TTabSheet
          Caption = 'Dados do Beneficiário'
          object Label11: TLabel
            Left = 8
            Top = 24
            Width = 118
            Height = 13
            Caption = 'Numero de Matricula'
          end
          object Label12: TLabel
            Left = 8
            Top = 121
            Width = 203
            Height = 13
            Caption = 'Empresa Vinculada ( Mantenedora )'
          end
          object Label13: TLabel
            Left = 8
            Top = 73
            Width = 145
            Height = 13
            Caption = 'Plano Contábil Associado'
          end
          object DbLkcEmpresa: TwwDBLookupCombo
            Left = 8
            Top = 136
            Width = 329
            Height = 21
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clWindowText
            Font.Height = -9
            Font.Name = 'MS Sans Serif'
            Font.Style = []
            DropDownAlignment = taLeftJustify
            Selected.Strings = (
              'NOME'#9'40'#9'Mantenedora'#9'F'
              'CODMANTENEDORA'#9'10'#9'Código'#9'F')
            DataField = 'CODMANTENEDORA'
            DataSource = dsSubTipo
            LookupTable = qryMantenedora
            LookupField = 'CODMANTENEDORA'
            Style = csDropDownList
            ParentFont = False
            TabOrder = 1
            AutoDropDown = True
            ShowButton = True
            AllowClearKey = True
            ShowMatchText = True
          end
          object dbedMatricula: TwwDBEdit
            Left = 8
            Top = 40
            Width = 121
            Height = 21
            DataField = 'MATRICULA'
            DataSource = dsSubTipo
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clWindowText
            Font.Height = -9
            Font.Name = 'MS Sans Serif'
            Font.Style = []
            ParentFont = False
            TabOrder = 0
            UnboundDataType = wwDefault
            WantReturns = False
            WordWrap = False
          end
          object wwDBLookupCombo1: TwwDBLookupCombo
            Left = 8
            Top = 88
            Width = 329
            Height = 21
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clWindowText
            Font.Height = -9
            Font.Name = 'MS Sans Serif'
            Font.Style = []
            DropDownAlignment = taLeftJustify
            Selected.Strings = (
              'NOME'#9'40'#9'Mantenedora'#9'F'
              'CODMANTENEDORA'#9'10'#9'Código'#9'F')
            DataField = 'CODMANTENEDORA'
            DataSource = dsSubTipo
            LookupTable = qryMantenedora
            LookupField = 'CODMANTENEDORA'
            Style = csDropDownList
            ParentFont = False
            TabOrder = 2
            AutoDropDown = True
            ShowButton = True
            AllowClearKey = True
            ShowMatchText = True
          end
        end
        object TbBeneficios: TTabSheet
          Caption = 'Benefícios do Beneficiário'
          object DbgBeneficios: TwwDBGrid
            Left = 0
            Top = 0
            Width = 688
            Height = 234
            Selected.Strings = (
              'DESCBENEF'#9'40'#9'Beneficio'
              'NUMPROCINSS'#9'10'#9'Processo'
              'DATAINICIO'#9'10'#9'Inicio'
              'DATAFINALPREVISTA'#9'10'#9'Final Previsto'
              'VALORATUAL'#9'10'#9'Valor'
              'ULTMESREAJUSTE'#9'7'#9'Ultimo Reajuste'
              'DESCSITBENEFICIO'#9'40'#9'Situação')
            IniAttributes.Delimiter = ';;'
            TitleColor = clBtnFace
            FixedCols = 0
            ShowHorzScrollBar = True
            Align = alClient
            DataSource = DsBeneficio
            Options = [dgTitles, dgIndicator, dgColumnResize, dgColLines, dgRowLines, dgTabs, dgRowSelect, dgAlwaysShowSelection, dgCancelOnExit, dgWordWrap, dgPerfectRowFit]
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
          object PnlBeneficio: TPanel
            Left = 0
            Top = 0
            Width = 688
            Height = 234
            Align = alClient
            BevelOuter = bvLowered
            TabOrder = 1
            object Label2: TLabel
              Left = 16
              Top = 13
              Width = 54
              Height = 13
              Caption = 'Beneficio'
            end
            object Label3: TLabel
              Left = 16
              Top = 58
              Width = 92
              Height = 13
              Caption = 'Nº do Benefício'
            end
            object Label4: TLabel
              Left = 16
              Top = 101
              Width = 128
              Height = 13
              Caption = 'Situação do Benefício'
            end
            object Label5: TLabel
              Left = 143
              Top = 58
              Width = 22
              Height = 13
              Caption = 'DIB'
            end
            object Label6: TLabel
              Left = 270
              Top = 58
              Width = 78
              Height = 13
              Caption = 'Final Previsto'
            end
            object Label7: TLabel
              Left = 397
              Top = 58
              Width = 72
              Height = 13
              Caption = 'Final Efetivo'
            end
            object Label8: TLabel
              Left = 397
              Top = 101
              Width = 78
              Height = 13
              Caption = 'Valor a Pagar'
            end
            object Label9: TLabel
              Left = 16
              Top = 144
              Width = 111
              Height = 13
              Caption = 'Tipo de Pagamento'
            end
            object Label10: TLabel
              Left = 16
              Top = 186
              Width = 120
              Height = 13
              Caption = 'Forma de Pagamento'
            end
            object DbLkcBeneficio: TwwDBLookupCombo
              Left = 16
              Top = 29
              Width = 345
              Height = 21
              DropDownAlignment = taLeftJustify
              Selected.Strings = (
                'NOME'#9'40'#9'Beneficio')
              DataField = 'IDBENEFICIO'
              DataSource = DsBeneficio
              LookupTable = QryBuscaBeneficio
              LookupField = 'IDBENEFICIO'
              TabOrder = 0
              AutoDropDown = True
              ShowButton = True
              AllowClearKey = False
              ShowMatchText = True
            end
            object DbLkcSituacao: TwwDBLookupCombo
              Left = 16
              Top = 117
              Width = 345
              Height = 21
              DropDownAlignment = taLeftJustify
              Selected.Strings = (
                'DESCRICAO'#9'40'#9'DESCRICAO')
              DataField = 'IDSITBENEFICIO'
              DataSource = DsBeneficio
              LookupTable = QryBuscaSituacao
              LookupField = 'IDSITBENEFICIO'
              TabOrder = 4
              AutoDropDown = True
              ShowButton = True
              AllowClearKey = False
            end
            object DBDateEdit3: TCMDateTimePicker
              Left = 143
              Top = 74
              Width = 121
              Height = 21
              CalendarAttributes.Font.Charset = DEFAULT_CHARSET
              CalendarAttributes.Font.Color = clWindowText
              CalendarAttributes.Font.Height = -11
              CalendarAttributes.Font.Name = 'MS Sans Serif'
              CalendarAttributes.Font.Style = []
              ButtonStyle = cbsCustom
              DataField = 'DATAINICIO'
              DataSource = DsBeneficio
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
            object DBDateEdit4: TCMDateTimePicker
              Left = 270
              Top = 74
              Width = 121
              Height = 21
              CalendarAttributes.Font.Charset = DEFAULT_CHARSET
              CalendarAttributes.Font.Color = clWindowText
              CalendarAttributes.Font.Height = -11
              CalendarAttributes.Font.Name = 'MS Sans Serif'
              CalendarAttributes.Font.Style = []
              ButtonStyle = cbsCustom
              DataField = 'DATAFINALPREVISTA'
              DataSource = DsBeneficio
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
            object DBDateEdit5: TCMDateTimePicker
              Left = 397
              Top = 74
              Width = 121
              Height = 21
              CalendarAttributes.Font.Charset = DEFAULT_CHARSET
              CalendarAttributes.Font.Color = clWindowText
              CalendarAttributes.Font.Height = -11
              CalendarAttributes.Font.Name = 'MS Sans Serif'
              CalendarAttributes.Font.Style = []
              ButtonStyle = cbsCustom
              DataField = 'DATAFINAL'
              DataSource = DsBeneficio
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
            object DbLkcPortForma: TwwDBLookupCombo
              Left = 16
              Top = 202
              Width = 345
              Height = 21
              DropDownAlignment = taLeftJustify
              Selected.Strings = (
                'DESCRICAO'#9'40'#9'DESCRICAO')
              DataField = 'CODPORTFORMA'
              DataSource = DsBeneficio
              LookupTable = QryBuscaPortForma
              LookupField = 'CODPORTFORMA'
              TabOrder = 7
              AutoDropDown = True
              ShowButton = True
              AllowClearKey = False
            end
            object DbLkcTipoPagto: TwwDBLookupCombo
              Left = 16
              Top = 160
              Width = 345
              Height = 21
              DropDownAlignment = taLeftJustify
              Selected.Strings = (
                'NOME'#9'40'#9'NOME')
              DataField = 'IDTPPAGTOBENEFIC'
              DataSource = DsBeneficio
              LookupTable = QryBuscaTpPagto
              LookupField = 'IDTPPAGTOBENEFIC'
              TabOrder = 6
              AutoDropDown = True
              ShowButton = True
              AllowClearKey = False
            end
            object dbedValor: TwwDBEdit
              Left = 397
              Top = 117
              Width = 121
              Height = 21
              DataField = 'VALORATUAL'
              DataSource = DsBeneficio
              TabOrder = 5
              UnboundDataType = wwDefault
              WantReturns = False
              WordWrap = False
            end
            object dbedNumProc: TwwDBEdit
              Left = 16
              Top = 73
              Width = 121
              Height = 21
              DataField = 'NUMPROCINSS'
              DataSource = DsBeneficio
              MaxLength = 10
              TabOrder = 8
              UnboundDataType = wwDefault
              WantReturns = False
              WordWrap = False
              OnExit = dbedNumProcExit
            end
          end
        end
        object tbsHstBenef: TTabSheet
          Caption = 'Histórico de Benefícios'
          ImageIndex = 6
          object dbgHstBenef: TwwDBGrid
            Left = 0
            Top = 0
            Width = 688
            Height = 234
            Selected.Strings = (
              'MESREFERENCIA'#9'15'#9'Mês Ref.'
              'NUMPROCINSS'#9'20'#9'Nº Processo'
              'VALORCALCULADO'#9'20'#9'Vlr. Fundação'
              'VALORPAGO'#9'20'#9'Vlr INSS'#9'F')
            IniAttributes.Delimiter = ';;'
            TitleColor = clBtnFace
            FixedCols = 0
            ShowHorzScrollBar = True
            Align = alClient
            DataSource = dsHstBenef
            Options = [dgTitles, dgIndicator, dgColumnResize, dgColLines, dgRowLines, dgTabs, dgRowSelect, dgAlwaysShowSelection, dgCancelOnExit, dgWordWrap, dgPerfectRowFit]
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
      end
      inherited Dock974: TDock97
        Height = 262
      end
    end
    inherited pnlMestre: TPanel
      Height = 53
      inherited lblNome: TLabel
        Width = 33
        Caption = 'Nome'
      end
    end
  end
  inherited ivTradutor: TIvExtendedTranslator
    Top = 113
  end
  inherited upd: TUpdateSQL
    Left = 605
  end
  inherited MontaSelect: TMontaSelect
    Caption = 'Seleciona Beneficiário'
    Colunas.Strings = (
      'PESSOA.NOME'
      'PESSOA.NUMDOCUMENTO'
      'BENEFICIARIOPP.MATRICULA')
    Descricao.Strings = (
      'Nome do Beneficiário'
      'CPF'
      'Matricula')
    SensivelACaixa.Strings = (
      'N'
      'N'
      'N')
    Tabelas.Strings = (
      'PESSOA'
      'BENEFICIARIOPP')
    CamposChave.Strings = (
      'PESSOA.IDPESSOA')
    Filtro.Strings = (
      'PESSOA.IDPESSOA = BENEFICIARIOPP.IDBENEFICIARIOPP')
    Larguras.Strings = (
      '60'
      '18'
      '13')
  end
  inherited ds: TwwDataSource
    Left = 636
  end
  inherited CmeCadastro: TCmEventosCadastro
    Left = 354
  end
  inherited updSubTipo: TUpdateSQL
    ModifySQL.Strings = (
      'update BENEFICIARIOPP'
      'set'
      '  MATRICULA = :MATRICULA,'
      '  CODMANTENEDORA = :CODMANTENEDORA'
      'where'
      '  IDBENEFICIARIOPP = :OLD_IDBENEFICIARIOPP')
    InsertSQL.Strings = (
      'insert into BENEFICIARIOPP'
      '  (IDBENEFICIARIOPP, MATRICULA, CODMANTENEDORA)'
      'values'
      '  (:IDBENEFICIARIOPP, :MATRICULA, :CODMANTENEDORA)')
    DeleteSQL.Strings = (
      'delete from BENEFICIARIOPP'
      'where'
      '  IDBENEFICIARIOPP = :OLD_IDBENEFICIARIOPP')
    Left = 605
    Top = 40
  end
  inherited qrySubTipo: TwwQuery
    SQL.Strings = (
      'SELECT'
      '  IDBENEFICIARIOPP AS IDPESSOA, '
      '  IDBENEFICIARIOPP,'
      '  MATRICULA,'
      '  CODMANTENEDORA'
      'FROM'
      '  BENEFICIARIOPP'
      'WHERE'
      '  IDBENEFICIARIOPP = :IDPESSOA'
      ' '
      ' ')
    Left = 573
    Top = 40
    ParamData = <
      item
        DataType = ftInteger
        Name = 'IDPESSOA'
        ParamType = ptUnknown
      end>
  end
  inherited dsSubTipo: TwwDataSource
    Left = 636
    Top = 40
  end
  inherited ImageList1: TImageList
    Left = 48
    Top = 62
  end
  inherited dsEndereco: TwwDataSource
    Left = 746
    Top = 252
  end
  inherited updEndereco: TUpdateSQL
    Left = 707
    Top = 257
  end
  inherited qryEndereco: TwwQuery
    Left = 670
    Top = 264
  end
  inherited qryContato: TwwQuery
    Left = 681
    Top = 301
  end
  inherited updContato: TUpdateSQL
    Left = 715
    Top = 293
  end
  inherited dsContato: TwwDataSource
    Left = 746
    Top = 293
  end
  inherited qryRamal: TwwQuery
    Left = 683
    Top = 346
  end
  inherited updRamal: TUpdateSQL
    Left = 715
    Top = 346
  end
  inherited dsRamal: TwwDataSource
    Left = 746
    Top = 346
  end
  inherited qryDocumento: TwwQuery
    Left = 489
    Top = 90
  end
  inherited dsDocumento: TwwDataSource
    Left = 615
    Top = 90
  end
  inherited updDocumento: TUpdateSQL
    Left = 558
    Top = 90
  end
  inherited Pessoa: TPessoa
    MudaCaption = False
    TipoPessoa = tpFisica
    SubTipo = stBeneficiarioPP
    FormCaption = 'Cadastro de Beneficiários Não Participantes'
    UsaPessoaFisica = True
    SaveModuloRespon = True
    OnChangeSubtipo = PessoaChangeSubtipo
    OnSaveSubtipo = PessoaSaveSubtipo
    Left = 316
    Top = 8
  end
  inherited OpenPictureDialog1: TOpenPictureDialog
    Left = 105
    Top = 62
  end
  inherited qryImagem: TwwQuery
    Left = 528
    Top = 96
  end
  inherited updImagem: TUpdateSQL
    Left = 658
    Top = 120
  end
  inherited updImagensDoc: TUpdateSQL
    Left = 630
    Top = 186
  end
  inherited qryImagensDoc: TwwQuery
    Left = 540
    Top = 95
  end
  inherited dsImagem: TwwDataSource
    Left = 659
    Top = 144
  end
  inherited dsImagensDoc: TwwDataSource
    Left = 661
    Top = 115
  end
  inherited qryTipoDoc: TwwQuery
    Left = 749
    Top = 403
  end
  object QryEmpresa: TwwQuery [46]
    DatabaseName = 'BaseDados'
    SQL.Strings = (
      'SELECT '
      '      PATRO.IDPESSOA AS IDPESSOA, PESSOA.NOME'
      'FROM'
      '      PESSOA, PATRO'
      'WHERE'
      '      (PATRO.IDPESSOA =PESSOA.IDPESSOA )'
      'UNION'
      'SELECT'
      '      EMP.IDEMPCOLIGADA AS IDPESSOA, PESSOA.NOME'
      'FROM'
      '      PESSOA, EMPCOLIGADA EMP'
      'WHERE'
      '      (EMP.IDEMPCOLIGADA=PESSOA.IDPESSOA )'
      'ORDER BY NOME'
      '')
    ValidateWithMask = True
    Left = 524
    Top = 420
  end
  object QryBeneficio: TwwQuery [47]
    CachedUpdates = True
    DatabaseName = 'BaseDados'
    SQL.Strings = (
      'SELECT'
      
        #9'    BEN.IDBENEFICIARIOPP  , BEN.NUMPROCINSS    , BEN.IDBENEFICI' +
        'O       , BEN.CODPORTFORMA      ,'
      
        #9'    BEN.IDTPPAGTOBENEFIC  , BEN.IDSITBENEFICIO    , BEN.DATAINI' +
        'CIO        , BEN.DATAFINALPREVISTA ,'
      
        #9'    BEN.DATAFINAL         , BEN.VALORATUAL        , BEN.ULTMESR' +
        'EAJUSTE    , BEN.ULTMESPREPARO     ,'
      #9'    BEN.ULTVALORBRUTO     , BEN.FLGDATAPREVISTA   , B.NOME'
      'FROM'
      '     CM.BENEFBFPP BEN,'
      '     CM.BENEFICIO B'
      'WHERE'
      '     (BEN.IDBENEFICIARIOPP = :IDPESSOA)     AND'
      '     (BEN.IDBENEFICIO      = B.IDBENEFICIO)'
      ''
      ''
      ''
      ''
      ' '
      ' ')
    UpdateMode = upWhereKeyOnly
    UpdateObject = UpdBeneficio
    ValidateWithMask = True
    Left = 323
    Top = 316
    ParamData = <
      item
        DataType = ftFloat
        Name = 'IDPESSOA'
        ParamType = ptUnknown
      end>
    object QryBeneficioDESCBENEF: TStringField
      DisplayLabel = 'Beneficio'
      DisplayWidth = 40
      FieldKind = fkLookup
      FieldName = 'DESCBENEF'
      LookupDataSet = QryBuscaBeneficio
      LookupKeyFields = 'IDBENEFICIO'
      LookupResultField = 'NOME'
      KeyFields = 'IDBENEFICIO'
      Size = 60
      Lookup = True
    end
    object QryBeneficioDATAINICIO: TDateTimeField
      DisplayLabel = 'Inicio'
      DisplayWidth = 10
      FieldName = 'DATAINICIO'
      Origin = '"CM.BENEFBFPP".DATAINICIO'
    end
    object QryBeneficioDATAFINALPREVISTA: TDateTimeField
      DisplayLabel = 'Final Previsto'
      DisplayWidth = 10
      FieldName = 'DATAFINALPREVISTA'
      Origin = '"CM.BENEFBFPP".DATAFINALPREVISTA'
    end
    object QryBeneficioVALORATUAL: TFloatField
      DisplayLabel = 'Valor'
      DisplayWidth = 10
      FieldName = 'VALORATUAL'
      Origin = '"CM.BENEFBFPP".VALORATUAL'
      DisplayFormat = '###,###,###,##0.00'
      EditFormat = '###########0.00'
    end
    object QryBeneficioULTMESREAJUSTE: TStringField
      DisplayLabel = 'Ultimo Reajuste'
      DisplayWidth = 7
      FieldName = 'ULTMESREAJUSTE'
      Origin = '"CM.BENEFBFPP".ULTMESREAJUSTE'
      Size = 7
    end
    object QryBeneficioDESCSITBENEFICIO: TStringField
      DisplayLabel = 'Situação'
      DisplayWidth = 40
      FieldKind = fkLookup
      FieldName = 'DESCSITBENEFICIO'
      LookupDataSet = QryBuscaSituacao
      LookupKeyFields = 'IDSITBENEFICIO'
      LookupResultField = 'DESCRICAO'
      KeyFields = 'IDSITBENEFICIO'
      Size = 40
      Lookup = True
    end
    object QryBeneficioIDBENEFICIARIOPP: TFloatField
      FieldName = 'IDBENEFICIARIOPP'
      Origin = '"CM.BENEFBFPP".IDBENEFICIARIOPP'
      Visible = False
    end
    object QryBeneficioIDBENEFICIO: TFloatField
      FieldName = 'IDBENEFICIO'
      Origin = '"CM.BENEFBFPP".IDBENEFICIO'
      Visible = False
    end
    object QryBeneficioCODPORTFORMA: TFloatField
      FieldName = 'CODPORTFORMA'
      Origin = '"CM.BENEFBFPP".CODPORTFORMA'
      Visible = False
    end
    object QryBeneficioIDTPPAGTOBENEFIC: TFloatField
      FieldName = 'IDTPPAGTOBENEFIC'
      Origin = '"CM.BENEFBFPP".IDTPPAGTOBENEFIC'
      Visible = False
    end
    object QryBeneficioIDSITBENEFICIO: TFloatField
      FieldName = 'IDSITBENEFICIO'
      Origin = '"CM.BENEFBFPP".IDSITBENEFICIO'
      Visible = False
    end
    object QryBeneficioDATAFINAL: TDateTimeField
      FieldName = 'DATAFINAL'
      Origin = '"CM.BENEFBFPP".DATAFINAL'
      Visible = False
    end
    object QryBeneficioULTMESPREPARO: TStringField
      FieldName = 'ULTMESPREPARO'
      Origin = '"CM.BENEFBFPP".ULTMESPREPARO'
      Visible = False
      Size = 7
    end
    object QryBeneficioULTVALORBRUTO: TFloatField
      FieldName = 'ULTVALORBRUTO'
      Origin = '"CM.BENEFBFPP".ULTVALORBRUTO'
      Visible = False
    end
    object QryBeneficioFLGDATAPREVISTA: TFloatField
      FieldName = 'FLGDATAPREVISTA'
      Origin = '"CM.BENEFBFPP".FLGDATAPREVISTA'
      Visible = False
    end
    object QryBeneficioNOME: TStringField
      FieldName = 'NOME'
      Origin = '"CM.BENEFICIO".NOME'
      Visible = False
      Size = 60
    end
    object QryBeneficioNUMPROCINSS: TStringField
      FieldName = 'NUMPROCINSS'
      Origin = 'BASEDADOS."CM.BENEFBFPP".NUMPROCINSS'
      Size = 15
    end
  end
  object DsBeneficio: TwwDataSource [48]
    DataSet = QryBeneficio
    OnDataChange = dsEnderecoDataChange
    Left = 337
    Top = 380
  end
  object UpdBeneficio: TUpdateSQL [49]
    ModifySQL.Strings = (
      'update CM.BENEFBFPP'
      'set'
      '  IDBENEFICIARIOPP = :IDBENEFICIARIOPP,'
      '  NUMPROCINSS = :NUMPROCINSS,'
      '  IDBENEFICIO = :IDBENEFICIO,'
      '  CODPORTFORMA = :CODPORTFORMA,'
      '  IDTPPAGTOBENEFIC = :IDTPPAGTOBENEFIC,'
      '  IDSITBENEFICIO = :IDSITBENEFICIO,'
      '  DATAINICIO = :DATAINICIO,'
      '  DATAFINALPREVISTA = :DATAFINALPREVISTA,'
      '  DATAFINAL = :DATAFINAL,'
      '  VALORATUAL = :VALORATUAL,'
      '  ULTMESREAJUSTE = :ULTMESREAJUSTE,'
      '  ULTMESPREPARO = :ULTMESPREPARO,'
      '  ULTVALORBRUTO = :ULTVALORBRUTO,'
      '  FLGDATAPREVISTA = :FLGDATAPREVISTA'
      'where'
      '  IDBENEFICIARIOPP = :OLD_IDBENEFICIARIOPP and'
      '  NUMPROCINSS = :OLD_NUMPROCINSS and'
      '  IDBENEFICIO = :OLD_IDBENEFICIO')
    InsertSQL.Strings = (
      'insert into CM.BENEFBFPP'
      '  (IDBENEFICIARIOPP, NUMPROCINSS, IDBENEFICIO, CODPORTFORMA, '
      'IDTPPAGTOBENEFIC, '
      '   IDSITBENEFICIO, DATAINICIO, DATAFINALPREVISTA, DATAFINAL, '
      'VALORATUAL, '
      '   ULTMESREAJUSTE, ULTMESPREPARO, ULTVALORBRUTO, '
      'FLGDATAPREVISTA)'
      'values'
      
        '  (:IDBENEFICIARIOPP, :NUMPROCINSS, :IDBENEFICIO, :CODPORTFORMA,' +
        ' '
      ':IDTPPAGTOBENEFIC, '
      
        '   :IDSITBENEFICIO, :DATAINICIO, :DATAFINALPREVISTA, :DATAFINAL,' +
        ' '
      ':VALORATUAL, '
      '   :ULTMESREAJUSTE, :ULTMESPREPARO, :ULTVALORBRUTO, '
      ':FLGDATAPREVISTA)')
    DeleteSQL.Strings = (
      'delete from CM.BENEFBFPP'
      'where'
      '  IDBENEFICIARIOPP = :OLD_IDBENEFICIARIOPP and'
      '  NUMPROCINSS = :OLD_NUMEROPROCESSO and'
      '  IDBENEFICIO = :OLD_IDBENEFICIO')
    Left = 285
    Top = 421
  end
  object QryBuscaBeneficio: TwwQuery [50]
    DatabaseName = 'BaseDados'
    SQL.Strings = (
      'SELECT'
      
        '  BEN.IDBENEFICIO       , BEN.IDEVENTOGERADOR   , BEN.CODNATUREZ' +
        'A       ,'
      
        '  BEN.IDTPPAGTOBENEFIC  , BEN.NOME              , BEN.FLGDESTBEN' +
        'EF      , BEN.FLGBENEFOBRIGATO  ,'
      '  BEN.CODBENEFICIO      , BEN.NUMORDEMEVENTO    ,'
      
        '  BEN.FLGRESGATE        , BEN.TRGDTINCLUSAO     , BEN.TRGUSERINC' +
        'LUSAO   , BEN.FLGBENEFTEMP      ,'
      
        '  BEN.FLGBENEFPROV      , BEN.FLGPECULIO        , BEN.CODBENEFSP' +
        'C       , BEN.FLGVOLTASITANT    ,'
      
        '  BEN.PRAZOPROVISORIO   , BEN.DESCRUB           , BEN.TIPOBENEFI' +
        'CIO     , BEN.FLGUSADTPREVISAO'
      'FROM'
      '   BENEFICIO BEN'
      'ORDER BY'
      '  BEN.NOME'
      ' ')
    ValidateWithMask = True
    Left = 397
    Top = 420
  end
  object QryBuscaSituacao: TwwQuery [51]
    DatabaseName = 'BaseDados'
    SQL.Strings = (
      'SELECT'
      '       SIT.IDSITBENEFICIO, SIT.DESCRICAO'
      ''
      'FROM'
      '       SITBENEFICIO SIT'
      ''
      'ORDER BY'
      '      SIT.DESCRICAO')
    ValidateWithMask = True
    Left = 429
    Top = 420
  end
  object QryBuscaTpPagto: TwwQuery [52]
    DatabaseName = 'BaseDados'
    SQL.Strings = (
      'SELECT'
      
        '      TPP.IDTPPAGTOBENEFIC  , TPP.NOME              , TPP.IDTPPE' +
        'RIODICIDADE , TPP.FLGFREQUENCIA     ,'
      
        #9'     TPP.FLGPRAZOCERTO     , TPP.TRGDTINCLUSAO     , TPP.TRGUSE' +
        'RINCLUSAO'
      'FROM'
      '      TPPAGTOBENEFICIO TPP'
      ''
      'ORDER BY'
      '      TPP.NOME')
    ValidateWithMask = True
    Left = 461
    Top = 420
  end
  object QryBuscaPortForma: TwwQuery [53]
    DatabaseName = 'BaseDados'
    SQL.Strings = (
      'SELECT'
      
        '      POR.CODPORTFORMA      , POR.PLANO             , POR.IDTEMP' +
        'LCHEQUE     , POR.IDPESSOA          ,'
      
        '      POR.IDEMPRESA         , POR.PLACONTA          , POR.CODCEN' +
        'TROCUSTO    , POR.CODBLOQCHE        ,'
      
        '      POR.CODPORTADOR       , POR.CODFORMA          , POR.RECPAG' +
        '            , POR.LANCAFINANC       ,'
      
        '      POR.DMAIS             , POR.IDUSUARIOINCLUSAO , POR.DESCRI' +
        'CAO         , POR.NUMEMPRESABANCO   ,'
      
        '      POR.NOSSONUMERO       , POR.JUROSPORDIA       , POR.PRAZOP' +
        'ROTESTO     , POR.CONTROLEREMESSA   ,'
      
        '      POR.DATACONTRREMESSA  , POR.CODARQUIVOREMESSA , POR.PATHAR' +
        'QUIVOREM    , POR.PATHARQUIVORET    ,'
      
        '      POR.CODTIPOPAGTO      , POR.CODFORMAPAGTO     , POR.FLGEMI' +
        'TEAVISO     , POR.NUMRAZAOCC        ,'
      
        '      POR.LOTETRANSMISSAO   , POR.TRGDTINCLUSAO     , POR.TRGUSE' +
        'RINCLUSAO   , POR.DESCFINAN         ,'
      
        '      POR.UNIDNEGOC         , POR.CODSUBCONTA       , POR.FLGCHE' +
        'QUEDIFERIDO , POR.FLGCONTABEMISCHQ  ,'
      
        '      POR.PLACONTACONTABCHQ , POR.PLANOCONTABCHQ    , POR.IDFORC' +
        'LI          , POR.IDCONFIGBARRAS    ,'
      
        '      POR.DIASEMANALANCTO   , POR.DIASUTEISLANCTO   , POR.FLGOBR' +
        'IGAFAV'
      'FROM'
      '      PORTADORFORMA POR'
      ''
      'ORDER BY'
      '      POR.DESCRICAO')
    ValidateWithMask = True
    Left = 493
    Top = 420
  end
  inherited qryEstado: TwwQuery
    Left = 241
    Top = 348
  end
  inherited qryNaturalidade_Padrao: TwwQuery
    Left = 681
    Top = 229
  end
  inherited DsNaturalidade_Padrao: TwwDataSource
    Left = 679
    Top = 276
  end
  object qryMantenedora: TwwQuery
    DatabaseName = 'BaseDados'
    SQL.Strings = (
      'SELECT CODMANTENEDORA, NOME FROM MANTENEDORA ORDER BY NOME')
    ValidateWithMask = True
    Left = 581
    Top = 224
  end
  object dsHstBenef: TwwDataSource
    DataSet = qryHstBenef
    Left = 485
    Top = 246
  end
  object qryHstBenef: TwwQuery
    DatabaseName = 'BaseDados'
    SQL.Strings = (
      'SELECT *'
      'FROM HSTBENEFBFPP'
      'WHERE IDBENEFICIARIOPP = :IDPESSOA'
      '  AND IDBENEFICIO      = :IDBENEFICIO'
      'ORDER BY MESREFERENCIA')
    ValidateWithMask = True
    Left = 96
    Top = 350
    ParamData = <
      item
        DataType = ftInteger
        Name = 'IDPESSOA'
        ParamType = ptUnknown
      end
      item
        DataType = ftInteger
        Name = 'IDBENEFICIO'
        ParamType = ptUnknown
      end>
  end
end
