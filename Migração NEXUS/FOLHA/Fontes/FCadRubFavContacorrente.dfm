inherited frmCadRubFavContacorrente: TfrmCadRubFavContacorrente
  Left = 267
  Top = 79
  Width = 1005
  Height = 618
  HelpContext = 180042
  BorderIcons = [biSystemMenu, biMinimize, biMaximize, biHelp]
  BorderStyle = bsSizeable
  Caption = 'Associação de Rubricas e Conta Bancária de Favorecido'
  PixelsPerInch = 96
  TextHeight = 13
  inherited pnlFundo: TPanel
    Width = 989
    Height = 494
    inherited tbcDetalhe: TTabControlDetalhe [0]
      Top = 35
      Width = 987
      Height = 458
      Tabs.Strings = (
        'Rubricas Associadas')
      inherited pgctrlDetalhe: TPageControl
        Width = 889
        Height = 399
        inherited tbsDet: TTabSheet
          Caption = 'Rubricas Associadas'
          object pnlTerceiro: TPanel [0]
            Left = 0
            Top = 0
            Width = 881
            Height = 371
            Align = alClient
            TabOrder = 2
            Visible = False
            object lbDataInicio: TLabel
              Left = 24
              Top = 60
              Width = 65
              Height = 13
              Caption = 'Data Início'
            end
            object lbDataFim: TLabel
              Left = 24
              Top = 111
              Width = 59
              Height = 13
              Caption = 'Data Final'
            end
            object lbPercentual: TLabel
              Left = 24
              Top = 162
              Width = 62
              Height = 13
              Caption = 'Percentual'
            end
            object lblNome: TLabel
              Left = 24
              Top = 12
              Width = 33
              Height = 13
              Caption = 'Nome'
            end
            object dbdtInicio: TCMDateTimePicker
              Left = 24
              Top = 74
              Width = 96
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
              UnboundDataType = wwDTEdtDate
            end
            object dbdtFinal: TCMDateTimePicker
              Left = 24
              Top = 125
              Width = 96
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
              TabOrder = 2
              UnboundDataType = wwDTEdtDate
            end
            object dbPercentual: TDBRealEdit
              Left = 24
              Top = 176
              Width = 42
              Height = 20
              Alignment = taRightJustify
              Lines.Strings = (
                '0,00')
              TabOrder = 3
              WordWrap = False
              IntDigits = 10
              DecDigits = 2
              NumberFormat = fNumber
              Signal = False
            end
            object edtNomeTerceiro: TDBEdit
              Left = 24
              Top = 27
              Width = 553
              Height = 21
              TabStop = False
              Color = clWhite
              Enabled = False
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clWindowText
              Font.Height = -8
              Font.Name = 'MS Sans Serif'
              Font.Style = [fsBold]
              ParentFont = False
              ReadOnly = True
              TabOrder = 4
            end
            object BtnProcura: TBitBtn
              Left = 587
              Top = 22
              Width = 90
              Height = 29
              Anchors = [akTop, akRight]
              Caption = '&Procura'
              Default = True
              ModalResult = 1
              TabOrder = 0
              OnClick = BtnProcuraClick
              Glyph.Data = {
                76010000424D7601000000000000760000002800000020000000100000000100
                0400000000000001000000000000000000001000000000000000000000000000
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
              Spacing = 2
            end
          end
          inherited dbgrdDet: TwwDBGrid
            Width = 881
            Height = 371
            ControlInfoInDataset = False
            ControlType.Strings = (
              'FLGUSAABONO;CheckBox;1;0'
              'FLGANTECIPABONO;CheckBox;1;0'
              'FLGANTECIPAABONOINSS;CheckBox;1;0'
              'PAGTOTERC;CheckBox;1;0')
            PictureMaskFromDataSet = False
            Selected.Strings = (
              'DESCRICAO'#9'45'#9'Código / Descrição'#9'F'
              'IDREGRA'#9'7'#9'Regra'#9'F'
              'IDCBANCARIA'#9'7'#9'Banco'#9'F'
              'NUMAGENCIA'#9'10'#9'Nº~Agencia'#9'F'
              'CONTACORRENTE'#9'10'#9'Nº Conta~Corrente'#9'F'
              'LIMITEMINIMO'#9'10'#9'Limite~Minimo'#9'F'
              'LIMITEMAXIMO'#9'10'#9'Limite~Maximo'#9'F'
              'PERCENTUAL'#9'12'#9'Percentual~para Cálculo'#9'F'
              'NUMOCORMAX'#9'12'#9'Maxímo de~Ocorrências'#9'F'
              'FLGUSAABONO'#9'14'#9'Incide Abono~Funcef'#9'F'
              'FLGANTECIPABONO'#9'14'#9'Incide Antec.~Abono Funcef'#9'F'
              'FLGANTECIPAABONOINSS'#9'14'#9'Incide Antec.~Abono INSS'#9'F'
              'PAGTOTERC'#9'14'#9'Pagamento~Terceiro'#9'F')
            MemoAttributes = []
            IniAttributes.CheckNewFields = True
            Font.Style = []
            KeyOptions = []
            Options = [dgTitles, dgIndicator, dgColumnResize, dgColLines, dgRowLines, dgTabs, dgConfirmDelete, dgCancelOnExit, dgWordWrap, dgTrailingEllipsis, dgShowCellHint]
            ParentFont = False
            TitleLines = 2
          end
          inherited pnlControlesDet: TPanel
            Width = 881
            Height = 371
            object Label4: TLabel
              Left = 17
              Top = 92
              Width = 108
              Height = 13
              Caption = 'Rubrica a Associar'
            end
            object Label2: TLabel
              Left = 19
              Top = 177
              Width = 87
              Height = 13
              Caption = 'Limite Mínimo :'
            end
            object Label3: TLabel
              Left = 307
              Top = 177
              Width = 88
              Height = 13
              Caption = 'Limite Máximo :'
            end
            object Label5: TLabel
              Left = 19
              Top = 203
              Width = 113
              Height = 13
              Caption = 'Percentual / Valor :'
            end
            object Label6: TLabel
              Left = 307
              Top = 203
              Width = 141
              Height = 13
              Caption = 'Máximo de Ocorrências :'
            end
            object lblRegra: TLabel
              Left = 17
              Top = 132
              Width = 98
              Height = 13
              Caption = 'Regra a Associar'
            end
            object Bevel1: TBevel
              Left = 16
              Top = 0
              Width = 561
              Height = 87
            end
            object DBRealEdit2: TDBRealEdit
              Left = 459
              Top = 197
              Width = 41
              Height = 20
              Alignment = taRightJustify
              Lines.Strings = (
                '0')
              TabOrder = 5
              WordWrap = False
              IntDigits = 10
              DecDigits = 0
              NumberFormat = fNumber
              Signal = False
              DataField = 'NUMOCORMAX'
              DataSource = dsDet
            end
            object dbreValorMaximo: TDBRealEdit
              Left = 400
              Top = 173
              Width = 100
              Height = 20
              Alignment = taRightJustify
              Lines.Strings = (
                '0,00000000')
              TabOrder = 3
              WordWrap = False
              IntDigits = 10
              DecDigits = 8
              NumberFormat = fNumber
              Signal = False
              DataField = 'LIMITEMAXIMO'
              DataSource = dsDet
            end
            object DbCbRubrica: TwwDBLookupCombo
              Left = 17
              Top = 104
              Width = 490
              Height = 21
              DropDownAlignment = taLeftJustify
              Selected.Strings = (
                'DESCRICAO_RUBRICA'#9'60'#9'Código / Descrição da Rubrica'#9'F')
              DataField = 'IDRUBRICA'
              DataSource = dsDet
              LookupTable = QryRubrica
              LookupField = 'IDPROVENTO'
              Options = [loColLines, loRowLines, loTitles]
              TabOrder = 0
              AutoDropDown = True
              ShowButton = True
              AllowClearKey = False
              OnChange = DbCbRubricaChange
              OnCloseUp = DbCbRubricaCloseUp
            end
            object dbgContasBancarias: TwwDBGrid
              Left = 17
              Top = 1
              Width = 560
              Height = 85
              Selected.Strings = (
                'BANCO'#9'51'#9'Banco'
                'NUMAGENCIA'#9'9'#9'Nº Agencia'
                'CONTACORRENTE'#9'14'#9'Nº Conta Corrente')
              MemoAttributes = []
              IniAttributes.Delimiter = ';;'
              TitleColor = clBtnFace
              FixedCols = 0
              ShowHorzScrollBar = True
              DataSource = dsContaBancaria
              KeyOptions = []
              Options = [dgTitles, dgColumnResize, dgColLines, dgRowLines, dgTabs, dgRowSelect, dgAlwaysShowSelection, dgConfirmDelete, dgCancelOnExit, dgWordWrap, dgTrailingEllipsis, dgShowCellHint]
              TabOrder = 10
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
            object dbreValorMinimo: TDBRealEdit
              Left = 111
              Top = 173
              Width = 100
              Height = 20
              Alignment = taRightJustify
              Lines.Strings = (
                '0,00000000')
              TabOrder = 2
              WordWrap = False
              IntDigits = 10
              DecDigits = 8
              NumberFormat = fNumber
              Signal = False
              DataField = 'LIMITEMINIMO'
              DataSource = dsDet
            end
            object DBRealEdit1: TDBRealEdit
              Left = 169
              Top = 199
              Width = 42
              Height = 20
              Alignment = taRightJustify
              Lines.Strings = (
                '0,00')
              TabOrder = 4
              WordWrap = False
              IntDigits = 10
              DecDigits = 2
              NumberFormat = fNumber
              Signal = False
              DataField = 'PERCENTUAL'
              DataSource = dsDet
            end
            object dblkRegra: TwwDBLookupCombo
              Left = 17
              Top = 144
              Width = 490
              Height = 21
              DropDownAlignment = taLeftJustify
              Selected.Strings = (
                'NOMEREGRA'#9'30'#9'Descrição da Regra'#9'F')
              DataField = 'IDREGRA'
              DataSource = dsDet
              LookupTable = qryRegra
              LookupField = 'IDREGRA'
              Options = [loColLines, loRowLines, loTitles]
              TabOrder = 1
              AutoDropDown = True
              ShowButton = True
              AllowClearKey = False
            end
            object dbchkAntecpAbonoFuncef: TDBCheckBox
              Left = 573
              Top = 150
              Width = 281
              Height = 17
              Caption = 'Utilizada no Antecipação de Abono FUNCEF'
              DataField = 'FLGANTECIPABONO'
              DataSource = dsDet
              TabOrder = 7
              ValueChecked = '1'
              ValueUnchecked = '0'
              OnMouseDown = dbchkAntecpAbonoFuncefMouseDown
            end
            object dbchkAbonoAnual: TDBCheckBox
              Left = 573
              Top = 126
              Width = 177
              Height = 17
              Caption = 'Utilizada no Abono Anual'
              DataField = 'FLGUSAABONO'
              DataSource = dsDet
              TabOrder = 6
              ValueChecked = '1'
              ValueUnchecked = '0'
              OnMouseDown = dbchkAbonoAnualMouseDown
            end
            object dbchkAntecipAbonoINSS: TDBCheckBox
              Left = 573
              Top = 174
              Width = 265
              Height = 17
              Caption = 'Utilizada no Antecipação de Abono INSS'
              DataField = 'FLGANTECIPAABONOINSS'
              DataSource = dsDet
              TabOrder = 8
              ValueChecked = '1'
              ValueUnchecked = '0'
              OnMouseDown = dbchkAntecipAbonoINSSMouseDown
            end
            object dbchkPagtoTerc: TDBCheckBox
              Left = 573
              Top = 199
              Width = 265
              Height = 17
              Caption = 'Pagamento para terceiros'
              DataField = 'PAGTOTERC'
              DataSource = dsDet
              TabOrder = 9
              ValueChecked = '1'
              ValueUnchecked = '0'
              OnClick = dbchkPagtoTercClick
            end
            object pnlPagtoTerc: TPanel
              Left = 0
              Top = 225
              Width = 881
              Height = 146
              Align = alBottom
              TabOrder = 11
              object dockTerceiro: TDock97
                Left = 1
                Top = 1
                Width = 879
                Height = 31
                AllowDrag = False
                BoundLines = [blTop, blBottom, blLeft, blRight]
                object Toolbar972: TToolbar97
                  Left = 0
                  Top = 0
                  Caption = 'tb97BotoesDetalhe'
                  DockPos = 0
                  TabOrder = 0
                  object sbtnInsTerc: TToolbarButton97
                    Left = 0
                    Top = 0
                    Width = 25
                    Height = 25
                    Hint = 'Inserir'
                    AllowAllUp = True
                    GroupIndex = 2
                    Enabled = False
                    ImageIndex = 0
                    Images = ImlPadrao
                    ParentShowHint = False
                    ShowHint = True
                    OnClick = sbtnInsTercClick
                  end
                  object sbtnAltTerc: TToolbarButton97
                    Left = 25
                    Top = 0
                    Width = 25
                    Height = 25
                    Hint = 'Alterar'
                    AllowAllUp = True
                    GroupIndex = 2
                    Enabled = False
                    ImageIndex = 1
                    Images = ImlPadrao
                    ParentShowHint = False
                    ShowHint = True
                    OnClick = sbtnAltTercClick
                  end
                  object sbtnExcTerc: TToolbarButton97
                    Left = 50
                    Top = 0
                    Width = 25
                    Height = 25
                    Hint = 'Excluir'
                    AllowAllUp = True
                    Enabled = False
                    ImageIndex = 2
                    Images = ImlPadrao
                    ParentShowHint = False
                    ShowHint = True
                    OnClick = sbtnExcTercClick
                  end
                end
              end
              object pnlAssocia: TPanel
                Left = 1
                Top = 32
                Width = 879
                Height = 113
                Align = alClient
                BevelOuter = bvNone
                TabOrder = 1
                object dbgrDadosTerc: TwwDBGrid
                  Left = 0
                  Top = 0
                  Width = 879
                  Height = 113
                  Selected.Strings = (
                    'NOME'#9'45'#9'Nome'#9'F'
                    'DTINICIO'#9'15'#9'Data Início'#9'F'
                    'DTFIM'#9'15'#9'Data Fim'#9'F'
                    'PERCENTUAL'#9'10'#9'Percentual'#9'F')
                  IniAttributes.Delimiter = ';;'
                  TitleColor = clBtnFace
                  FixedCols = 0
                  ShowHorzScrollBar = True
                  Align = alClient
                  DataSource = dsDetTerc
                  KeyOptions = []
                  Options = [dgTitles, dgIndicator, dgColLines, dgRowLines, dgTabs, dgConfirmDelete, dgCancelOnExit, dgWordWrap]
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
            end
          end
        end
      end
      inherited Dock973: TDock97
        Width = 979
        inherited tb97BotoesDetalhe: TToolbar97
          inherited sbtnInsDet: TToolbarButton97
            Enabled = False
          end
          inherited sbtnAltDet: TToolbarButton97
            Enabled = False
          end
          inherited sbtnExcluiDet: TToolbarButton97
            Enabled = False
          end
        end
      end
      inherited Dock974: TDock97
        Left = 893
        Height = 399
      end
    end
    inherited pnlMestre: TPanel [1]
      Width = 987
      Height = 34
      object Label1: TLabel
        Left = 4
        Top = 7
        Width = 64
        Height = 13
        Caption = 'Favorecido'
      end
      object dbeFavorecido: TDBEdit
        Left = 72
        Top = 4
        Width = 625
        Height = 21
        DataField = 'NOME'
        DataSource = ds
        ReadOnly = True
        TabOrder = 0
      end
    end
  end
  inherited Dock972: TDock97
    Width = 989
    inherited Toolbar971: TToolbar97
      inherited sbtnInserir: TToolbarButton97
        Visible = False
      end
      inherited sbtnApagar: TToolbarButton97
        Visible = False
      end
    end
  end
  inherited Dock971: TDock97
    Top = 541
    Width = 989
  end
  inherited ivTradutor: TIvExtendedTranslator
    Left = 888
    Top = 322
    TargetsData = (
      1
      2
      (
        'TDBRealEdit'
        'Text'
        0)
      (
        ''
        'Filter'
        0))
  end
  inherited dsDet: TwwDataSource
    AutoEdit = True
    DataSet = QryDet
    Left = 529
    Top = 2
  end
  inherited ds: TwwDataSource
    Left = 417
    Top = 2
  end
  inherited upd: TUpdateSQL
    ModifySQL.Strings = (
      'update PESSOA'
      'set'
      '  NOME = :NOME'
      'where'
      '  IDPESSOA = :OLD_IDPESSOA')
    InsertSQL.Strings = (
      'insert into PESSOA'
      '  (IDPESSOA, NOME)'
      'values'
      '  (:IDPESSOA, :NOME)')
    DeleteSQL.Strings = (
      'delete from PESSOA'
      'where'
      '  IDPESSOA = :OLD_IDPESSOA')
    Left = 389
    Top = 2
  end
  inherited MontaSelect: TMontaSelect
    Caption = ''
    Colunas.Strings = (
      'PESSOA.NOME'
      'PESSOA.NUMDOCUMENTO')
    TipodeDado.Strings = (
      'C'
      'C')
    Descricao.Strings = (
      'Favorecido'
      'CNPJ/CPF')
    SensivelACaixa.Strings = (
      'S'
      'S')
    Tabelas.Strings = (
      'PESSOA')
    CamposChave.Strings = (
      'PESSOA.NOME'
      'PESSOA.NUMDOCUMENTO'
      'PESSOA.IDPESSOA')
    Mascaras.Strings = (
      ''
      '')
    Larguras.Strings = (
      '60'
      '18')
    OperComparador.Strings = (
      '-1'
      '-1')
    ApenasLetraENum.Strings = (
      'N'
      'N')
    ComparaMaiuscula.Strings = (
      ''
      '')
    UsaDistinct = True
    LookupSQL.Strings = (
      ''
      '')
    LookupCampoChave.Strings = (
      ''
      '')
    LookupCampoExibe.Strings = (
      ''
      '')
    Left = 291
    Top = 10
  end
  inherited ImlPadrao: TImageList
    Left = 889
    Top = 274
  end
  inherited CmeCadastro: TCmEventosCadastro
    OnFind = CmeCadastroFind
    Left = 445
    Top = 2
  end
  inherited qry: TwwQuery
    SQL.Strings = (
      'SELECT IDPESSOA, NOME'
      'FROM PESSOA'
      'WHERE IDPESSOA = :IDPESSOA'
      ' ')
    Left = 361
    Top = 2
    ParamData = <
      item
        DataType = ftFloat
        Name = 'IDPESSOA'
        ParamType = ptUnknown
      end>
  end
  inherited CmeDetalhe: TCmEventosCadastro
    BeforeConfirma = CmeDetalheBeforeConfirma
    Left = 557
    Top = 2
  end
  object qryContaBancaria: TwwQuery
    DatabaseName = 'BaseDados'
    SQL.Strings = (
      
        'SELECT AG.IDPESSOA, AG.IDBANCO, P.NOME AS BANCO, CB.IDCBANCARIA,' +
        ' AG.NUMAGENCIA, CB.CONTACORRENTE'
      'FROM CONTABANCARIA CB, AGENCIABANCARIA AG, PESSOA P'
      'WHERE CB.IDPESSOA = :PESSOA'
      'AND CB.IDAGENCIA = AG.IDPESSOA'
      'AND AG.IDBANCO = P.IDPESSOA'
      ' '
      ' ')
    ValidateWithMask = True
    Left = 585
    Top = 2
    ParamData = <
      item
        DataType = ftInteger
        Name = 'PESSOA'
        ParamType = ptUnknown
      end>
  end
  object UpdDet: TUpdateSQL
    ModifySQL.Strings = (
      'update RUBRICAXCONTABANCARIA'
      'set'
      '  IDPESSOA = :IDPESSOA,'
      '  IDCBANCARIA = :IDCBANCARIA,'
      '  IDRUBRICA = :IDRUBRICA,'
      '  LIMITEMINIMO = :LIMITEMINIMO,'
      '  LIMITEMAXIMO = :LIMITEMAXIMO,'
      '  PERCENTUAL = :PERCENTUAL,'
      '  NUMOCORMAX = :NUMOCORMAX,'
      '  IDREGRA = :IDREGRA,'
      '  PAGTOTERC = :PAGTOTERC'
      'where'
      '  IDPESSOA = :OLD_IDPESSOA and'
      '  IDCBANCARIA = :OLD_IDCBANCARIA and'
      '  IDRUBRICA = :OLD_IDRUBRICA')
    InsertSQL.Strings = (
      'insert into RUBRICAXCONTABANCARIA'
      
        '  (IDPESSOA, IDCBANCARIA, IDRUBRICA, LIMITEMINIMO, LIMITEMAXIMO,' +
        ' '
      'PERCENTUAL, '
      '   NUMOCORMAX, IDREGRA, PAGTOTERC)'
      'values'
      
        '  (:IDPESSOA, :IDCBANCARIA, :IDRUBRICA, :LIMITEMINIMO, :LIMITEMA' +
        'XIMO, '
      ':PERCENTUAL, '
      '   :NUMOCORMAX, :IDREGRA, :PAGTOTERC)')
    DeleteSQL.Strings = (
      'delete from RUBRICAXCONTABANCARIA'
      'where'
      '  IDPESSOA = :OLD_IDPESSOA and'
      '  IDCBANCARIA = :OLD_IDCBANCARIA and'
      '  IDRUBRICA = :OLD_IDRUBRICA')
    Left = 501
    Top = 2
  end
  object QryDet: TwwQuery
    CachedUpdates = True
    AfterOpen = QryDetAfterOpen
    BeforePost = QryDetBeforePost
    DatabaseName = 'BaseDados'
    SQL.Strings = (
      'SELECT'
      '  PES.NOME,'
      '  ABC.NUMAGENCIA,'
      '  CBC.IDCBANCARIA AS CC,'
      '  CBC.CONTACORRENTE,'
      '  RXB.IDRUBRICA,'
      '  RXB.IDPESSOA,'
      '  RXB.IDCBANCARIA,'
      '  PRV.DESCRICAO,'
      '  RXB.LIMITEMINIMO,'
      '  RXB.LIMITEMAXIMO,'
      '  RXB.PERCENTUAL,'
      '  RXB.NUMOCORMAX,'
      '  RXB.IDREGRA,'
      '  R.NOMEREGRA,'
      
        ' (SELECT FLGUSAABONO FROM RUBRICAINDIV WHERE IDPESSOA = CBC.IDPE' +
        'SSOA AND IDRUBRICA = RXB.IDRUBRICA and rownum = 1) as FLGUSAABON' +
        'O,'
      
        ' (SELECT FLGANTECIPABONO FROM RUBRICAINDIV WHERE IDPESSOA = CBC.' +
        'IDPESSOA AND IDRUBRICA = RXB.IDRUBRICA and rownum = 1) as FLGANT' +
        'ECIPABONO,'
      
        ' (SELECT FLGANTECIPAABONOINSS FROM RUBRICAINDIV WHERE IDPESSOA =' +
        ' CBC.IDPESSOA AND IDRUBRICA = RXB.IDRUBRICA and rownum = 1) as F' +
        'LGANTECIPAABONOINSS'
      ''
      'FROM'
      '  CONTABANCARIA CBC,'
      '  RUBRICAXCONTABANCARIA RXB,'
      '  PROVDESC PRV,'
      '  AGENCIABANCARIA ABC,'
      '  PESSOA PES,'
      '  REGRA R'
      ''
      'WHERE CBC.IDPESSOA = :IDPESSOA'
      '  AND CBC.IDCBANCARIA = RXB.IDCBANCARIA'
      '  AND RXB.IDRUBRICA = PRV.IDPROVENTO'
      '  AND CBC.IDAGENCIA = ABC.IDPESSOA'
      '  AND ABC.IDBANCO = PES.IDPESSOA'
      '  AND RXB.IDREGRA = R.IDREGRA(+)'
      ''
      ''
      ''
      ''
      ' '
      ' ')
    UpdateObject = UpdDet
    ValidateWithMask = True
    Left = 473
    Top = 2
    ParamData = <
      item
        DataType = ftFloat
        Name = 'IDPESSOA'
        ParamType = ptUnknown
      end>
  end
  object QryRubrica: TwwQuery
    CachedUpdates = True
    DatabaseName = 'BaseDados'
    SQL.Strings = (
      'SELECT'
      '  PRV.IDPROVENTO, '
      '  DECODE(PRM.FLGUSACODRUBEXT, 0, PRV.DESCRICAO,'
      '  PRV.DESCRPROVDESC) AS DESCRICAO_RUBRICA'
      'FROM '
      '  PROVDESC PRV, PARAMAPREV PRM'
      'WHERE'
      #9'PRV.FLGTPRUBRICA LIKE '#39'%B%'#39
      'ORDER BY '
      '  PRV.DESCRICAO'
      ''
      ' '
      ' '
      ' '
      ' '
      ' ')
    ValidateWithMask = True
    Left = 641
    Top = 2
  end
  object dsContaBancaria: TwwDataSource
    DataSet = qryContaBancaria
    Left = 613
    Top = 2
  end
  object qryAtualizaRubIndiv: TwwQuery
    DatabaseName = 'BaseDados'
    SQL.Strings = (
      'UPDATE RUBRICAINDIV'
      'SET'
      '  VALORRUBRICA = :PPERCCALC,'
      '  IDREGRACALCULO = :PIDREGRACALC'
      'WHERE'
      '  IDFAVORECIDO = :PIDFAVOREC   AND'
      '  IDRUBRICA    = :PIDRUB'
      ' '
      ' ')
    ValidateWithMask = True
    Left = 637
    Top = 96
    ParamData = <
      item
        DataType = ftFloat
        Name = 'PPERCCALC'
        ParamType = ptUnknown
      end
      item
        DataType = ftInteger
        Name = 'PIDREGRACALC'
        ParamType = ptUnknown
      end
      item
        DataType = ftInteger
        Name = 'PIDFAVOREC'
        ParamType = ptUnknown
      end
      item
        DataType = ftInteger
        Name = 'PIDRUB'
        ParamType = ptUnknown
      end>
  end
  object qryRegra: TwwQuery
    DatabaseName = 'BaseDados'
    SQL.Strings = (
      'SELECT'
      '  IDREGRA,'
      '  NOMEREGRA'
      ''
      'FROM'
      '  REGRA'
      ''
      'WHERE'
      ' 1 = 2')
    ValidateWithMask = True
    Left = 672
    Top = 1
  end
  object dsRubIndiv: TwwDataSource
    DataSet = qryRubIndiv
    Left = 753
    Top = 122
  end
  object qryRubIndiv: TwwQuery
    CachedUpdates = True
    DatabaseName = 'BaseDados'
    SQL.Strings = (
      'SELECT R.*,count(1) Over() as Qtde FROM RUBRICAINDIV R'
      'WHERE'
      '  IDFAVORECIDO = :PIDFAVOREC   AND'
      '  IDRUBRICA    = :PIDRUB')
    ValidateWithMask = True
    Left = 753
    Top = 74
    ParamData = <
      item
        DataType = ftInteger
        Name = 'PIDFAVOREC'
        ParamType = ptUnknown
      end
      item
        DataType = ftInteger
        Name = 'PIDRUB'
        ParamType = ptUnknown
      end>
  end
  object MSTerceiro: TMontaSelect
    Template.IdConsulta = 0
    Caption = 'Seleciona'
    Colunas.Strings = (
      'PESSOA.NOME'
      'PESSOA.NUMDOCUMENTO')
    TipodeDado.Strings = (
      'C'
      'C')
    Descricao.Strings = (
      'Favorecido'
      'CNPJ/CPF')
    SensivelACaixa.Strings = (
      'S'
      'S')
    Tabelas.Strings = (
      'PESSOA')
    CamposChave.Strings = (
      'PESSOA.NOME'
      'PESSOA.NUMDOCUMENTO'
      'PESSOA.IDPESSOA')
    Mascaras.Strings = (
      ''
      '')
    Larguras.Strings = (
      '60'
      '18')
    OperComparador.Strings = (
      '-1'
      '-1')
    ApenasLetraENum.Strings = (
      'N'
      'N')
    ComparaMaiuscula.Strings = (
      ''
      '')
    DataBaseName = 'BaseDados'
    RepeteConsulta = False
    UsaDistinct = True
    SalvaConsulta = False
    ExibePergunta = True
    MultiSelect = False
    LookupSQL.Strings = (
      ''
      '')
    LookupCampoChave.Strings = (
      ''
      '')
    LookupCampoExibe.Strings = (
      ''
      '')
    Left = 691
    Top = 490
  end
  object qryCtaTerceiro: TwwQuery
    DatabaseName = 'BaseDados'
    SQL.Strings = (
      
        'SELECT AG.IDPESSOA, AG.IDBANCO, P.NOME AS BANCO, CB.IDCBANCARIA,' +
        ' AG.NUMAGENCIA, CB.CONTACORRENTE'
      'FROM CONTABANCARIA CB, AGENCIABANCARIA AG, PESSOA P'
      'WHERE CB.IDPESSOA = :IDPESSOA'
      'AND CB.IDAGENCIA = AG.IDPESSOA'
      'AND AG.IDBANCO = P.IDPESSOA'
      ' '
      ' ')
    ValidateWithMask = True
    Left = 617
    Top = 498
    ParamData = <
      item
        DataType = ftUnknown
        Name = 'IDPESSOA'
        ParamType = ptUnknown
      end>
  end
  object qryDetTerc: TwwQuery
    CachedUpdates = True
    DatabaseName = 'BaseDados'
    SQL.Strings = (
      'SELECT '
      '        TERC.IDRUBRICAXCONTABANCARIATERC,'
      '       TRUNC(TERC.TRGDTINCLUSAO) AS DATACADASTRO,'
      '       TERC.IDPESSOATERC,'
      '       P.NOME,'
      '       TERC.DTINICIO,'
      '       TERC.DTFIM,'
      '       TERC.PERCENTUAL,       '
      '       TERC.IDCBANCARIATERC,'
      '       TERC.IDPESSOA,'
      '       TERC.IDCBANCARIA,'
      '       TERC.IDRUBRICA      '
      '  FROM RUBRICAXCONTABANCARIATERC TERC'
      '  JOIN PESSOA P ON P.IDPESSOA = TERC.IDPESSOATERC'
      ' WHERE TERC.IDPESSOA = :IDPESSOA'
      '')
    UpdateObject = updDetTerc
    ValidateWithMask = True
    Left = 865
    Top = 426
    ParamData = <
      item
        DataType = ftFloat
        Name = 'IDPESSOA'
        ParamType = ptUnknown
      end>
  end
  object dsDetTerc: TwwDataSource
    DataSet = qryDetTerc
    Left = 865
    Top = 386
  end
  object qryAux: TwwQuery
    CachedUpdates = True
    DatabaseName = 'BaseDados'
    ValidateWithMask = True
    Left = 805
    Top = 474
  end
  object qryValidaPerc: TwwQuery
    CachedUpdates = True
    DatabaseName = 'BaseDados'
    ValidateWithMask = True
    Left = 749
    Top = 466
  end
  object updDetTerc: TUpdateSQL
    ModifySQL.Strings = (
      'update RUBRICAXCONTABANCARIATERC'
      'set'
      '  IDPESSOATERC = :IDPESSOATERC,'
      '  DTINICIO = :DTINICIO,'
      '  DTFIM = :DTFIM,'
      '  PERCENTUAL = :PERCENTUAL,'
      '  IDCBANCARIATERC = :IDCBANCARIATERC,'
      '  IDPESSOA = :IDPESSOA,'
      '  IDCBANCARIA = :IDCBANCARIA,'
      '  IDRUBRICA = :IDRUBRICA'
      'where'
      '  IDRUBRICAXCONTABANCARIATERC = '
      ':OLD_IDRUBRICAXCONTABANCARIATERC')
    InsertSQL.Strings = (
      'insert into RUBRICAXCONTABANCARIATERC'
      ' (IDRUBRICAXCONTABANCARIATERC, '
      ' IDPESSOATERC, DTINICIO, DTFIM, PERCENTUAL, '
      'IDCBANCARIATERC, '
      '   IDPESSOA, IDCBANCARIA, IDRUBRICA)'
      'values'
      '  ( :IDRUBRICAXCONTABANCARIATERC,'
      ' :IDPESSOATERC, :DTINICIO, :DTFIM, :PERCENTUAL, '
      ':IDCBANCARIATERC, '
      '   :IDPESSOA, :IDCBANCARIA, :IDRUBRICA)')
    DeleteSQL.Strings = (
      'delete from RUBRICAXCONTABANCARIATERC'
      'where'
      '  IDRUBRICAXCONTABANCARIATERC = '
      ':OLD_IDRUBRICAXCONTABANCARIATERC')
    Left = 863
    Top = 473
  end
end
