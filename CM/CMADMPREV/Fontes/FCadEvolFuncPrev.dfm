inherited frmCadEvolFuncPrev: TfrmCadEvolFuncPrev
  Left = 385
  Top = 80
  HelpContext = 160041
  BorderIcons = [biSystemMenu, biMinimize, biMaximize, biHelp]
  Caption = 'Cadastro de Evolução Funcional'
  ClientHeight = 522
  ClientWidth = 784
  FormStyle = fsNormal
  PixelsPerInch = 96
  TextHeight = 13
  inherited pnlFundo: TPanel
    Width = 784
    Height = 436
    inherited pnlMestre: TPanel
      Width = 782
      Height = 116
      object lblnome: TLabel
        Left = 8
        Top = 6
        Width = 33
        Height = 13
        Caption = 'Nome'
      end
      object dbedNomeParticipante: TDBText
        Left = 8
        Top = 22
        Width = 108
        Height = 13
        AutoSize = True
        DataField = 'NOME'
        DataSource = ds
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -9
        Font.Name = 'MS Sans Serif'
        Font.Style = []
        ParentFont = False
      end
      object Label3: TLabel
        Left = 8
        Top = 41
        Width = 80
        Height = 13
        Caption = 'Patrocinadora'
      end
      object DBText2: TDBText
        Left = 8
        Top = 57
        Width = 42
        Height = 13
        AutoSize = True
        DataField = 'NOMEPATRO'
        DataSource = ds
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -9
        Font.Name = 'MS Sans Serif'
        Font.Style = []
        ParentFont = False
      end
      object Label8: TLabel
        Left = 8
        Top = 75
        Width = 118
        Height = 13
        Caption = 'Plano Previdenciário'
      end
      object DBText3: TDBText
        Left = 8
        Top = 91
        Width = 42
        Height = 13
        AutoSize = True
        DataField = 'NOMEPLANO'
        DataSource = ds
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -9
        Font.Name = 'MS Sans Serif'
        Font.Style = []
        ParentFont = False
      end
      object lblmat: TLabel
        Left = 304
        Top = 41
        Width = 55
        Height = 13
        Caption = 'Matrícula'
      end
      object DBText5: TDBText
        Left = 304
        Top = 57
        Width = 42
        Height = 13
        AutoSize = True
        DataField = 'MATRICULA'
        DataSource = ds
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -9
        Font.Name = 'MS Sans Serif'
        Font.Style = []
        ParentFont = False
      end
      object Label7: TLabel
        Left = 304
        Top = 75
        Width = 71
        Height = 13
        Caption = 'Inscrição Nº'
      end
      object DBText6: TDBText
        Left = 304
        Top = 91
        Width = 42
        Height = 13
        AutoSize = True
        DataField = 'INSCRICAONUMERO'
        DataSource = ds
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -9
        Font.Name = 'MS Sans Serif'
        Font.Style = []
        ParentFont = False
      end
      object Label32: TLabel
        Left = 597
        Top = 41
        Width = 140
        Height = 13
        Caption = 'Valor do Enquadramento'
      end
      object DBText1: TDBText
        Left = 695
        Top = 57
        Width = 42
        Height = 13
        Alignment = taRightJustify
        AutoSize = True
        DataField = 'VLRENQUADRAMENTO'
        DataSource = ds
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -9
        Font.Name = 'MS Sans Serif'
        Font.Style = []
        ParentFont = False
      end
      object sbtnCalcEnquadramento: TSpeedButton
        Left = 745
        Top = 48
        Width = 23
        Height = 22
        Hint = 'Calcular Enquadramento com data de HOJE'
        Glyph.Data = {
          76010000424D7601000000000000760000002800000020000000100000000100
          04000000000000010000120B0000120B00001000000000000000000000000000
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
        NumGlyphs = 2
        ParentShowHint = False
        ShowHint = True
        OnClick = sbtnCalcEnquadramentoClick
      end
      object lblTitSalMantido: TLabel
        Left = 605
        Top = 77
        Width = 132
        Height = 13
        Caption = 'Salário de Manutenção'
        Visible = False
      end
      object sbCalcSalMantido: TSpeedButton
        Left = 745
        Top = 84
        Width = 23
        Height = 22
        Hint = 'Calcular Salário de Manutenção'
        Glyph.Data = {
          76010000424D7601000000000000760000002800000020000000100000000100
          04000000000000010000120B0000120B00001000000000000000000000000000
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
        NumGlyphs = 2
        ParentShowHint = False
        ShowHint = True
        Visible = False
        OnClick = sbCalcSalMantidoClick
      end
      object dbSalMantido: TLabel
        Left = 672
        Top = 91
        Width = 65
        Height = 13
        Caption = 'dbSalMantido'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -9
        Font.Name = 'MS Sans Serif'
        Font.Style = []
        ParentFont = False
        Visible = False
      end
      object dbcSituacao: TwwDBComboBox
        Left = 424
        Top = 8
        Width = 145
        Height = 21
        ShowButton = True
        Style = csDropDown
        MapList = True
        AllowClearKey = False
        DataField = 'FLGSITPART'
        DataSource = dsDet
        DropDownCount = 8
        ButtonWidth = 1
        ItemHeight = 0
        Items.Strings = (
          'Ativo'#9'AT'
          'Ativo Especial'#9'AE'
          'Mantido'#9'MA'
          'Mantido Parcial'#9'MP'
          'Assistido'#9'AS'
          'Manutenção de Saldo de Conta'#9'MS'
          'Cancelado'#9'CA'
          'Pendente'#9'PE'
          'Pensionista'#9'PS')
        Sorted = False
        TabOrder = 0
        UnboundDataType = wwDefault
      end
    end
    inherited tbcDetalhe: TTabControlDetalhe
      Top = 117
      Width = 782
      Height = 318
      Tabs.Strings = (
        'Cargos'
        'Funções'
        'Adic. Compensatório'
        'Adic. por Tempo de Serviço'
        'Adic. Insalubridade'
        'Adic. Noturno'
        'Adic. Incorporação'
        'Adic. Periculosidade'
        'Outras Rubricas Salariais')
      detdbGrids.Strings = (
        'dbgrdDet'
        'dbgrdFuncao'
        'dbgrdAdicCompens'
        'dbgrdATS'
        'dbgrdAdicInsalub'
        'dbgrdAdicNoturno'
        'dbgrdAdicIncorp'
        'dbgrdAdicPericul'
        'dbgrdRubSal')
      inherited pgctrlDetalhe: TPageControl
        Width = 684
        Height = 259
        inherited tbsDet: TTabSheet
          Caption = 'Cargos'
          inherited dbgrdDet: TwwDBGrid
            Width = 676
            Height = 231
            Selected.Strings = (
              'CODIGO'#9'12'#9'Código'#9'F'
              'CARGO'#9'40'#9'Cargo'#9'F'
              'DATAINICIO'#9'12'#9'Data de ~Início'#9'F'
              'DATAFINAL'#9'12'#9'Data de ~Término'#9'F'
              'DESCMODO'#9'14'#9'Modo'#9'F'
              'DESCORIGEM'#9'20'#9'Origem'#9'F'
              'DESCSITCADASTRADA'#9'10'#9'Situação ~Cadastrada'#9'F'
              'DESCSIT'#9'10'#9'Situação na~Época'#9'F')
            Font.Style = []
            KeyOptions = []
            ParentFont = False
            TitleLines = 2
            OnCalcCellColors = dbgrdDetCalcCellColors
          end
          inherited pnlControlesDet: TPanel
            Width = 676
            Height = 231
            BevelInner = bvLowered
            object Label4: TLabel
              Left = 246
              Top = 9
              Width = 83
              Height = 13
              Caption = 'Data de Início'
            end
            object lblTituloTipo: TLabel
              Left = 8
              Top = 9
              Width = 34
              Height = 13
              Caption = 'Cargo'
            end
            object Label5: TLabel
              Left = 498
              Top = 9
              Width = 32
              Height = 13
              Caption = 'Modo'
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clWindowText
              Font.Height = -9
              Font.Name = 'MS Sans Serif'
              Font.Style = [fsBold]
              ParentFont = False
            end
            object Label33: TLabel
              Left = 639
              Top = 9
              Width = 117
              Height = 13
              Caption = 'Situação (Categoria)'
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clWindowText
              Font.Height = -9
              Font.Name = 'MS Sans Serif'
              Font.Style = [fsBold]
              ParentFont = False
            end
            object Label46: TLabel
              Left = 371
              Top = 9
              Width = 77
              Height = 13
              Caption = 'Data de Final'
            end
            object dbDataInicio: TCMDateTimePicker
              Left = 246
              Top = 24
              Width = 121
              Height = 21
              CalendarAttributes.Font.Charset = DEFAULT_CHARSET
              CalendarAttributes.Font.Color = clWindowText
              CalendarAttributes.Font.Height = -11
              CalendarAttributes.Font.Name = 'MS Sans Serif'
              CalendarAttributes.Font.Style = []
              ButtonStyle = cbsCustom
              DataField = 'DATAINICIO'
              DataSource = dsDet
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
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clWindowText
              Font.Height = -9
              Font.Name = 'MS Sans Serif'
              Font.Style = []
              ParentFont = False
              ShowButton = True
              TabOrder = 0
            end
            object dblkpcmbModoCargo: TwwDBLookupCombo
              Left = 498
              Top = 24
              Width = 137
              Height = 21
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clWindowText
              Font.Height = -9
              Font.Name = 'MS Sans Serif'
              Font.Style = []
              DropDownAlignment = taLeftJustify
              Selected.Strings = (
                'DESCRICAO'#9'21'#9'Modo'#9'F')
              DataField = 'MODOFUNCAO'
              DataSource = dsDet
              LookupTable = qryModoCargo
              LookupField = 'CODIGO'
              Options = [loTitles]
              ParentFont = False
              TabOrder = 1
              AutoDropDown = True
              ShowButton = True
              AllowClearKey = True
            end
            object dblkpcmbSitCargo: TwwDBLookupCombo
              Left = 639
              Top = 24
              Width = 137
              Height = 21
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clWindowText
              Font.Height = -9
              Font.Name = 'MS Sans Serif'
              Font.Style = []
              DropDownAlignment = taLeftJustify
              Selected.Strings = (
                'SITUACAO'#9'9'#9'Situação'#9'F')
              DataField = 'FLGSITPART'
              DataSource = dsDet
              LookupTable = qrySitPart
              LookupField = 'FLGSITPART'
              ParentFont = False
              TabOrder = 2
              AutoDropDown = True
              ShowButton = True
              AllowClearKey = True
            end
            object dblkpcmbCargoxNivel: TwwDBLookupCombo
              Left = 8
              Top = 24
              Width = 236
              Height = 21
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clWindowText
              Font.Height = -9
              Font.Name = 'MS Sans Serif'
              Font.Style = []
              DropDownAlignment = taLeftJustify
              Selected.Strings = (
                'CODCARGO'#9'15'#9'Código'#9'F'
                'TITULO'#9'40'#9'Cargo'#9'F')
              DataField = 'IDCARGOEXT'
              DataSource = dsDet
              LookupTable = qryCargoxNivel
              LookupField = 'IDCARGOEXT'
              Options = [loTitles]
              ParentFont = False
              TabOrder = 3
              AutoDropDown = True
              ShowButton = True
              AllowClearKey = True
            end
            object CMDateTimePicker2: TCMDateTimePicker
              Left = 371
              Top = 24
              Width = 121
              Height = 21
              CalendarAttributes.Font.Charset = DEFAULT_CHARSET
              CalendarAttributes.Font.Color = clWindowText
              CalendarAttributes.Font.Height = -11
              CalendarAttributes.Font.Name = 'MS Sans Serif'
              CalendarAttributes.Font.Style = []
              ButtonStyle = cbsCustom
              DataField = 'DATAFINAL'
              DataSource = dsDet
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
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clWindowText
              Font.Height = -9
              Font.Name = 'MS Sans Serif'
              Font.Style = []
              ParentFont = False
              ShowButton = True
              TabOrder = 4
            end
          end
        end
        object tbsFuncao: TTabSheet
          Caption = 'Funções'
          object dbgrdFuncao: TwwDBGrid
            Left = 0
            Top = 0
            Width = 676
            Height = 231
            Selected.Strings = (
              'CODIGO'#9'15'#9'Código'#9'F'
              'GRUPO'#9'15'#9'Grupo'#9'F'
              'FUNCAO'#9'40'#9'Função'#9'F'
              'DATAINICIO'#9'12'#9'Data de ~Início'#9'F'
              'DATAFINAL'#9'12'#9'Data de ~Término'#9'F'
              'PERCFUNCAO'#9'11'#9'Percentual%'#9'F'
              'DESCMODO'#9'21'#9'Modo'#9'F'
              'DESCORIGEM'#9'23'#9'Origem'#9'F'
              'DESCSITCADASTRADA'#9'10'#9'Situação ~Cadastrada'#9'F'
              'DESCSIT'#9'10'#9'Situação na ~Época'#9'F')
            IniAttributes.Delimiter = ';;'
            TitleColor = clBtnFace
            FixedCols = 0
            ShowHorzScrollBar = True
            Align = alClient
            DataSource = dsFuncao
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clWindowText
            Font.Height = -9
            Font.Name = 'MS Sans Serif'
            Font.Style = []
            KeyOptions = []
            Options = [dgTitles, dgIndicator, dgColumnResize, dgColLines, dgRowLines, dgTabs, dgConfirmDelete, dgCancelOnExit, dgWordWrap]
            ParentFont = False
            TabOrder = 1
            TitleAlignment = taLeftJustify
            TitleFont.Charset = DEFAULT_CHARSET
            TitleFont.Color = clWindowText
            TitleFont.Height = -9
            TitleFont.Name = 'MS Sans Serif'
            TitleFont.Style = [fsBold]
            TitleLines = 2
            TitleButtons = False
            OnCalcCellColors = dbgrdFuncaoCalcCellColors
            IndicatorColor = icBlack
          end
          object pnlControlesFuncao: TPanel
            Left = 0
            Top = 0
            Width = 676
            Height = 231
            Align = alClient
            BevelOuter = bvLowered
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clWindowText
            Font.Height = -9
            Font.Name = 'MS Sans Serif'
            Font.Style = []
            ParentFont = False
            TabOrder = 0
            object Label11: TLabel
              Left = 10
              Top = 54
              Width = 83
              Height = 13
              Caption = 'Data de Início'
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clWindowText
              Font.Height = -9
              Font.Name = 'MS Sans Serif'
              Font.Style = [fsBold]
              ParentFont = False
            end
            object Label12: TLabel
              Left = 10
              Top = 9
              Width = 43
              Height = 13
              Caption = 'Função'
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clWindowText
              Font.Height = -9
              Font.Name = 'MS Sans Serif'
              Font.Style = [fsBold]
              ParentFont = False
            end
            object Label18: TLabel
              Left = 259
              Top = 54
              Width = 32
              Height = 13
              Caption = 'Modo'
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clWindowText
              Font.Height = -9
              Font.Name = 'MS Sans Serif'
              Font.Style = [fsBold]
              ParentFont = False
            end
            object Label19: TLabel
              Left = 135
              Top = 54
              Width = 59
              Height = 13
              Caption = 'Data Final'
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clWindowText
              Font.Height = -9
              Font.Name = 'MS Sans Serif'
              Font.Style = [fsBold]
              ParentFont = False
            end
            object Label20: TLabel
              Left = 405
              Top = 54
              Width = 62
              Height = 13
              Caption = 'Percentual'
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clWindowText
              Font.Height = -9
              Font.Name = 'MS Sans Serif'
              Font.Style = [fsBold]
              ParentFont = False
            end
            object Label34: TLabel
              Left = 487
              Top = 54
              Width = 117
              Height = 13
              Caption = 'Situação (Categoria)'
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clWindowText
              Font.Height = -9
              Font.Name = 'MS Sans Serif'
              Font.Style = [fsBold]
              ParentFont = False
            end
            object dblkpcmbFuncao: TwwDBLookupCombo
              Left = 10
              Top = 24
              Width = 245
              Height = 21
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clWindowText
              Font.Height = -9
              Font.Name = 'MS Sans Serif'
              Font.Style = []
              DropDownAlignment = taLeftJustify
              Selected.Strings = (
                'CODIGO'#9'15'#9'Código'
                'TITULO'#9'40'#9'Funções'#9'F')
              DataField = 'IDFUNCAO'
              DataSource = dsFuncao
              LookupTable = qryFuncoes
              LookupField = 'IDCARGOEXT'
              Options = [loTitles]
              ParentFont = False
              TabOrder = 0
              AutoDropDown = True
              ShowButton = True
              AllowClearKey = True
            end
            object dbDataInicioFuncao: TCMDateTimePicker
              Left = 10
              Top = 69
              Width = 121
              Height = 21
              CalendarAttributes.Font.Charset = DEFAULT_CHARSET
              CalendarAttributes.Font.Color = clWindowText
              CalendarAttributes.Font.Height = -11
              CalendarAttributes.Font.Name = 'MS Sans Serif'
              CalendarAttributes.Font.Style = []
              ButtonStyle = cbsCustom
              DataField = 'DATAINICIO'
              DataSource = dsFuncao
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
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clWindowText
              Font.Height = -9
              Font.Name = 'MS Sans Serif'
              Font.Style = []
              ParentFont = False
              ShowButton = True
              TabOrder = 1
            end
            object CMDateTimePicker1: TCMDateTimePicker
              Left = 135
              Top = 69
              Width = 121
              Height = 21
              CalendarAttributes.Font.Charset = DEFAULT_CHARSET
              CalendarAttributes.Font.Color = clWindowText
              CalendarAttributes.Font.Height = -11
              CalendarAttributes.Font.Name = 'MS Sans Serif'
              CalendarAttributes.Font.Style = []
              ButtonStyle = cbsCustom
              DataField = 'DATAFINAL'
              DataSource = dsFuncao
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
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clWindowText
              Font.Height = -9
              Font.Name = 'MS Sans Serif'
              Font.Style = []
              ParentFont = False
              ShowButton = True
              TabOrder = 2
            end
            object dblkpcmbModoFuncao: TwwDBLookupCombo
              Left = 259
              Top = 69
              Width = 137
              Height = 21
              DropDownAlignment = taLeftJustify
              Selected.Strings = (
                'DESCRICAO'#9'21'#9'Modo'#9'F')
              DataField = 'MODOFUNCAO'
              DataSource = dsFuncao
              LookupTable = qryModoFuncao
              LookupField = 'CODIGO'
              Options = [loTitles]
              TabOrder = 3
              AutoDropDown = True
              ShowButton = True
              AllowClearKey = True
            end
            object wwDBEdit1: TwwDBEdit
              Left = 405
              Top = 69
              Width = 76
              Height = 21
              DataField = 'PERCFUNCAO'
              DataSource = dsFuncao
              TabOrder = 4
              UnboundDataType = wwDefault
              WantReturns = False
              WordWrap = False
            end
            object qrySitPartFUNCAO: TwwDBLookupCombo
              Left = 487
              Top = 69
              Width = 137
              Height = 21
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clWindowText
              Font.Height = -9
              Font.Name = 'MS Sans Serif'
              Font.Style = []
              DropDownAlignment = taLeftJustify
              Selected.Strings = (
                'SITUACAO'#9'9'#9'Situação'#9'F')
              DataField = 'FLGSITPART'
              DataSource = dsFuncao
              LookupTable = qrySitPart
              LookupField = 'FLGSITPART'
              Options = [loTitles]
              ParentFont = False
              TabOrder = 5
              AutoDropDown = True
              ShowButton = True
              AllowClearKey = True
            end
          end
        end
        object tbsAdicCompens: TTabSheet
          Caption = 'Adic. Compensatório'
          ImageIndex = 6
          object dbgrdAdicCompens: TwwDBGrid
            Left = 0
            Top = 0
            Width = 676
            Height = 231
            Selected.Strings = (
              'CODIGO'#9'15'#9'Código'
              'GRUPO'#9'15'#9'Grupo'
              'FUNCAO'#9'40'#9'Função Base'
              'DATAINICIO'#9'12'#9'Data de ~Início'
              'DATAFINAL'#9'12'#9'Data de ~Término'
              'PERC1AC'#9'10'#9'Percentual (%)'
              'DESCORIGEM'#9'23'#9'Origem'
              'DESCSITCADASTRADA'#9'10'#9'Situação ~Cadastrada'
              'DESCSIT'#9'10'#9'Situação na ~Época'#9'F')
            IniAttributes.Delimiter = ';;'
            TitleColor = clBtnFace
            FixedCols = 0
            ShowHorzScrollBar = True
            Align = alClient
            DataSource = dsAdicCompens
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clWindowText
            Font.Height = -9
            Font.Name = 'MS Sans Serif'
            Font.Style = []
            KeyOptions = []
            Options = [dgTitles, dgIndicator, dgColumnResize, dgColLines, dgRowLines, dgTabs, dgConfirmDelete, dgCancelOnExit, dgWordWrap]
            ParentFont = False
            TabOrder = 1
            TitleAlignment = taLeftJustify
            TitleFont.Charset = DEFAULT_CHARSET
            TitleFont.Color = clWindowText
            TitleFont.Height = -9
            TitleFont.Name = 'MS Sans Serif'
            TitleFont.Style = [fsBold]
            TitleLines = 2
            TitleButtons = False
            OnCalcCellColors = dbgrdAdicCompensCalcCellColors
            IndicatorColor = icBlack
          end
          object pnlAdicCompensatorio: TPanel
            Left = 0
            Top = 0
            Width = 676
            Height = 231
            Align = alClient
            BevelOuter = bvLowered
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clWindowText
            Font.Height = -9
            Font.Name = 'MS Sans Serif'
            Font.Style = []
            ParentFont = False
            TabOrder = 0
            object Label6: TLabel
              Left = 369
              Top = 9
              Width = 83
              Height = 13
              Caption = 'Data de Início'
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clWindowText
              Font.Height = -9
              Font.Name = 'MS Sans Serif'
              Font.Style = [fsBold]
              ParentFont = False
            end
            object Label9: TLabel
              Left = 10
              Top = 9
              Width = 236
              Height = 13
              Caption = 'Função Base do Adicional Compensatório'
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clWindowText
              Font.Height = -9
              Font.Name = 'MS Sans Serif'
              Font.Style = [fsBold]
              ParentFont = False
            end
            object Label21: TLabel
              Left = 562
              Top = 9
              Width = 59
              Height = 13
              Caption = 'Data Final'
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clWindowText
              Font.Height = -9
              Font.Name = 'MS Sans Serif'
              Font.Style = [fsBold]
              ParentFont = False
            end
            object Label22: TLabel
              Left = 11
              Top = 81
              Width = 62
              Height = 13
              Caption = 'Percentual'
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clWindowText
              Font.Height = -9
              Font.Name = 'MS Sans Serif'
              Font.Style = [fsBold]
              ParentFont = False
            end
            object Label35: TLabel
              Left = 315
              Top = 81
              Width = 117
              Height = 13
              Caption = 'Situação (Categoria)'
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clWindowText
              Font.Height = -9
              Font.Name = 'MS Sans Serif'
              Font.Style = [fsBold]
              ParentFont = False
            end
            object Label40: TLabel
              Left = 587
              Top = 81
              Width = 78
              Height = 13
              Caption = '2º Percentual'
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clWindowText
              Font.Height = -9
              Font.Name = 'MS Sans Serif'
              Font.Style = [fsBold]
              ParentFont = False
            end
            object dblkpcmbFuncaoAdicCompens: TwwDBLookupCombo
              Left = 10
              Top = 24
              Width = 245
              Height = 21
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clWindowText
              Font.Height = -9
              Font.Name = 'MS Sans Serif'
              Font.Style = []
              DropDownAlignment = taLeftJustify
              Selected.Strings = (
                'CODIGO'#9'15'#9'Código'
                'TITULO'#9'40'#9'Funções'#9'F')
              DataField = 'IDFUNCAO'
              DataSource = dsAdicCompens
              LookupTable = qryFuncoes
              LookupField = 'IDCARGOEXT'
              Options = [loTitles]
              ParentFont = False
              TabOrder = 0
              AutoDropDown = True
              ShowButton = True
              AllowClearKey = True
            end
            object dtInicioAdicCompens: TCMDateTimePicker
              Left = 369
              Top = 24
              Width = 102
              Height = 21
              CalendarAttributes.Font.Charset = DEFAULT_CHARSET
              CalendarAttributes.Font.Color = clWindowText
              CalendarAttributes.Font.Height = -11
              CalendarAttributes.Font.Name = 'MS Sans Serif'
              CalendarAttributes.Font.Style = []
              ButtonStyle = cbsCustom
              DataField = 'DATAINICIO'
              DataSource = dsAdicCompens
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
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clWindowText
              Font.Height = -9
              Font.Name = 'MS Sans Serif'
              Font.Style = []
              ParentFont = False
              ShowButton = True
              TabOrder = 1
            end
            object dtFimAdicCompens: TCMDateTimePicker
              Left = 562
              Top = 24
              Width = 102
              Height = 21
              CalendarAttributes.Font.Charset = DEFAULT_CHARSET
              CalendarAttributes.Font.Color = clWindowText
              CalendarAttributes.Font.Height = -11
              CalendarAttributes.Font.Name = 'MS Sans Serif'
              CalendarAttributes.Font.Style = []
              ButtonStyle = cbsCustom
              DataField = 'DATAFINAL'
              DataSource = dsAdicCompens
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
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clWindowText
              Font.Height = -9
              Font.Name = 'MS Sans Serif'
              Font.Style = []
              ParentFont = False
              ShowButton = True
              TabOrder = 2
            end
            object edPercAdicCompens: TwwDBEdit
              Left = 11
              Top = 96
              Width = 65
              Height = 21
              DataField = 'PERC1AC'
              DataSource = dsAdicCompens
              TabOrder = 3
              UnboundDataType = wwDefault
              WantReturns = False
              WordWrap = False
            end
            object dblkpcmbSitPartAdicCompens: TwwDBLookupCombo
              Left = 315
              Top = 96
              Width = 137
              Height = 21
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clWindowText
              Font.Height = -9
              Font.Name = 'MS Sans Serif'
              Font.Style = []
              DropDownAlignment = taLeftJustify
              Selected.Strings = (
                'SITUACAO'#9'9'#9'Situação'#9'F')
              DataField = 'FLGSITPART'
              DataSource = dsAdicCompens
              LookupTable = qrySitPart
              LookupField = 'FLGSITPART'
              Options = [loTitles]
              ParentFont = False
              TabOrder = 4
              AutoDropDown = True
              ShowButton = True
              AllowClearKey = True
            end
            object ed2PercAdicCompens: TwwDBEdit
              Left = 587
              Top = 96
              Width = 78
              Height = 21
              DataField = 'PERC2AC'
              DataSource = dsAdicCompens
              TabOrder = 5
              UnboundDataType = wwDefault
              WantReturns = False
              WordWrap = False
            end
          end
        end
        object tbsATS: TTabSheet
          Caption = 'Adic. por Tempo de Serviço'
          object dbgrdATS: TwwDBGrid
            Left = 0
            Top = 0
            Width = 676
            Height = 231
            Selected.Strings = (
              'DATAINICIO'#9'15'#9'Data de ~Início'
              'DATAFINAL'#9'15'#9'Data de ~Término'
              'PERCATS'#9'20'#9'Percentual (%)'#9'F'
              'DESCORIGEM'#9'30'#9'Origem'
              'DESCSITCADASTRADA'#9'10'#9'Situação ~Cadastrada'#9'F'
              'DESCSIT'#9'10'#9'Situação na ~Época'#9'F')
            IniAttributes.Delimiter = ';;'
            TitleColor = clBtnFace
            FixedCols = 0
            ShowHorzScrollBar = True
            Align = alClient
            DataSource = dsATS
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clWindowText
            Font.Height = -9
            Font.Name = 'MS Sans Serif'
            Font.Style = []
            KeyOptions = []
            Options = [dgTitles, dgIndicator, dgColumnResize, dgColLines, dgRowLines, dgTabs, dgConfirmDelete, dgCancelOnExit, dgWordWrap]
            ParentFont = False
            TabOrder = 0
            TitleAlignment = taLeftJustify
            TitleFont.Charset = DEFAULT_CHARSET
            TitleFont.Color = clWindowText
            TitleFont.Height = -9
            TitleFont.Name = 'MS Sans Serif'
            TitleFont.Style = [fsBold]
            TitleLines = 2
            TitleButtons = False
            UseTFields = False
            OnCalcCellColors = dbgrdATSCalcCellColors
            IndicatorColor = icBlack
          end
          object pnlATS: TPanel
            Left = 0
            Top = 0
            Width = 676
            Height = 231
            Align = alClient
            BevelInner = bvLowered
            BevelOuter = bvNone
            TabOrder = 1
            object Label14: TLabel
              Left = 9
              Top = 15
              Width = 83
              Height = 13
              Caption = 'Data de Início'
            end
            object Label15: TLabel
              Left = 135
              Top = 15
              Width = 95
              Height = 13
              Caption = 'Data de Término'
            end
            object Label16: TLabel
              Left = 263
              Top = 15
              Width = 83
              Height = 13
              Caption = 'Percentual (%)'
            end
            object spbtnCalcPercATS: TSpeedButton
              Left = 387
              Top = 29
              Width = 23
              Height = 22
              Hint = 'Calcular Percentual do Adicional'
              Glyph.Data = {
                76010000424D7601000000000000760000002800000020000000100000000100
                04000000000000010000120B0000120B00001000000000000000000000000000
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
              NumGlyphs = 2
              ParentShowHint = False
              ShowHint = True
              Visible = False
            end
            object Label36: TLabel
              Left = 416
              Top = 15
              Width = 117
              Height = 13
              Caption = 'Situação (Categoria)'
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clWindowText
              Font.Height = -9
              Font.Name = 'MS Sans Serif'
              Font.Style = [fsBold]
              ParentFont = False
            end
            object dbDataInicioATS: TCMDateTimePicker
              Left = 9
              Top = 30
              Width = 121
              Height = 21
              CalendarAttributes.Font.Charset = DEFAULT_CHARSET
              CalendarAttributes.Font.Color = clWindowText
              CalendarAttributes.Font.Height = -11
              CalendarAttributes.Font.Name = 'MS Sans Serif'
              CalendarAttributes.Font.Style = []
              ButtonStyle = cbsCustom
              DataField = 'DATAINICIO'
              DataSource = dsATS
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
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clWindowText
              Font.Height = -9
              Font.Name = 'MS Sans Serif'
              Font.Style = []
              ParentFont = False
              ShowButton = True
              TabOrder = 0
            end
            object dbDataFinalATS: TCMDateTimePicker
              Left = 135
              Top = 30
              Width = 121
              Height = 21
              CalendarAttributes.Font.Charset = DEFAULT_CHARSET
              CalendarAttributes.Font.Color = clWindowText
              CalendarAttributes.Font.Height = -11
              CalendarAttributes.Font.Name = 'MS Sans Serif'
              CalendarAttributes.Font.Style = []
              ButtonStyle = cbsCustom
              DataField = 'DATAFINAL'
              DataSource = dsATS
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
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clWindowText
              Font.Height = -9
              Font.Name = 'MS Sans Serif'
              Font.Style = []
              ParentFont = False
              ShowButton = True
              TabOrder = 1
            end
            object dbedValorATS: TDBEdit2
              Left = 263
              Top = 30
              Width = 121
              Height = 21
              DataField = 'PERCATS'
              DataSource = dsATS
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clWindowText
              Font.Height = -9
              Font.Name = 'MS Sans Serif'
              Font.Style = []
              MaxLength = 15
              ParentFont = False
              TabOrder = 3
              IntDigits = 10
              DecDigits = 5
            end
            object wwDBLookupCombo1: TwwDBLookupCombo
              Left = 416
              Top = 30
              Width = 137
              Height = 21
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clWindowText
              Font.Height = -9
              Font.Name = 'MS Sans Serif'
              Font.Style = []
              DropDownAlignment = taLeftJustify
              Selected.Strings = (
                'SITUACAO'#9'9'#9'Situação'#9'F')
              DataField = 'FLGSITPART'
              DataSource = dsATS
              LookupTable = qrySitPart
              LookupField = 'FLGSITPART'
              Options = [loTitles]
              ParentFont = False
              TabOrder = 2
              AutoDropDown = True
              ShowButton = True
              AllowClearKey = True
            end
          end
        end
        object tbsAdicInsalub: TTabSheet
          Caption = 'Adic. Insalubridade'
          ImageIndex = 4
          object dbgrdAdicInsalub: TwwDBGrid
            Left = 0
            Top = 0
            Width = 676
            Height = 231
            Selected.Strings = (
              'DATAINICIO'#9'15'#9'Data de ~Início'
              'DATAFINAL'#9'15'#9'Data de ~Término'
              'PERCINSALUB'#9'20'#9'Percentual (%)'
              'DESCORIGEM'#9'30'#9'Origem'
              'DESCSITCADASTRADA'#9'10'#9'Situação ~Cadastrada'
              'DESCSIT'#9'10'#9'Situação na ~época')
            IniAttributes.Delimiter = ';;'
            TitleColor = clBtnFace
            FixedCols = 0
            ShowHorzScrollBar = True
            Align = alClient
            DataSource = dsAdicInsalub
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clWindowText
            Font.Height = -9
            Font.Name = 'MS Sans Serif'
            Font.Style = []
            KeyOptions = []
            Options = [dgTitles, dgIndicator, dgColumnResize, dgColLines, dgRowLines, dgTabs, dgConfirmDelete, dgCancelOnExit, dgWordWrap]
            ParentFont = False
            TabOrder = 0
            TitleAlignment = taLeftJustify
            TitleFont.Charset = DEFAULT_CHARSET
            TitleFont.Color = clWindowText
            TitleFont.Height = -9
            TitleFont.Name = 'MS Sans Serif'
            TitleFont.Style = [fsBold]
            TitleLines = 2
            TitleButtons = False
            OnCalcCellColors = dbgrdAdicInsalubCalcCellColors
            IndicatorColor = icBlack
          end
          object Panel1: TPanel
            Left = 0
            Top = 0
            Width = 676
            Height = 231
            Align = alClient
            BevelInner = bvLowered
            BevelOuter = bvNone
            TabOrder = 1
            object Label13: TLabel
              Left = 9
              Top = 15
              Width = 83
              Height = 13
              Caption = 'Data de Início'
            end
            object Label23: TLabel
              Left = 135
              Top = 15
              Width = 95
              Height = 13
              Caption = 'Data de Término'
            end
            object Label24: TLabel
              Left = 263
              Top = 15
              Width = 83
              Height = 13
              Caption = 'Percentual (%)'
            end
            object SpeedButton1: TSpeedButton
              Left = 387
              Top = 29
              Width = 23
              Height = 22
              Hint = 'Calcular Percentual do Adicional'
              Glyph.Data = {
                76010000424D7601000000000000760000002800000020000000100000000100
                04000000000000010000120B0000120B00001000000000000000000000000000
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
              NumGlyphs = 2
              ParentShowHint = False
              ShowHint = True
              Visible = False
            end
            object Label37: TLabel
              Left = 416
              Top = 15
              Width = 117
              Height = 13
              Caption = 'Situação (Categoria)'
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clWindowText
              Font.Height = -9
              Font.Name = 'MS Sans Serif'
              Font.Style = [fsBold]
              ParentFont = False
            end
            object dtInicioAdicInsalub: TCMDateTimePicker
              Left = 9
              Top = 30
              Width = 121
              Height = 21
              CalendarAttributes.Font.Charset = DEFAULT_CHARSET
              CalendarAttributes.Font.Color = clWindowText
              CalendarAttributes.Font.Height = -11
              CalendarAttributes.Font.Name = 'MS Sans Serif'
              CalendarAttributes.Font.Style = []
              ButtonStyle = cbsCustom
              DataField = 'DATAINICIO'
              DataSource = dsAdicInsalub
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
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clWindowText
              Font.Height = -9
              Font.Name = 'MS Sans Serif'
              Font.Style = []
              ParentFont = False
              ShowButton = True
              TabOrder = 0
            end
            object dtFimAdicInsalub: TCMDateTimePicker
              Left = 135
              Top = 30
              Width = 121
              Height = 21
              CalendarAttributes.Font.Charset = DEFAULT_CHARSET
              CalendarAttributes.Font.Color = clWindowText
              CalendarAttributes.Font.Height = -11
              CalendarAttributes.Font.Name = 'MS Sans Serif'
              CalendarAttributes.Font.Style = []
              ButtonStyle = cbsCustom
              DataField = 'DATAFINAL'
              DataSource = dsAdicInsalub
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
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clWindowText
              Font.Height = -9
              Font.Name = 'MS Sans Serif'
              Font.Style = []
              ParentFont = False
              ShowButton = True
              TabOrder = 1
            end
            object dbedPercInsalub: TDBEdit2
              Left = 263
              Top = 30
              Width = 121
              Height = 21
              DataField = 'PERCINSALUB'
              DataSource = dsAdicInsalub
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clWindowText
              Font.Height = -9
              Font.Name = 'MS Sans Serif'
              Font.Style = []
              MaxLength = 15
              ParentFont = False
              TabOrder = 3
              IntDigits = 10
              DecDigits = 5
            end
            object wwDBLookupCombo2: TwwDBLookupCombo
              Left = 416
              Top = 30
              Width = 137
              Height = 21
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clWindowText
              Font.Height = -9
              Font.Name = 'MS Sans Serif'
              Font.Style = []
              DropDownAlignment = taLeftJustify
              Selected.Strings = (
                'SITUACAO'#9'9'#9'Situação'#9'F')
              DataField = 'FLGSITPART'
              DataSource = dsAdicInsalub
              LookupTable = qrySitPart
              LookupField = 'FLGSITPART'
              Options = [loTitles]
              ParentFont = False
              TabOrder = 2
              AutoDropDown = True
              ShowButton = True
              AllowClearKey = True
            end
          end
        end
        object tbsAdicNoturno: TTabSheet
          Caption = 'Adic. Noturno'
          ImageIndex = 7
          object dbgrdAdicNoturno: TwwDBGrid
            Left = 0
            Top = 0
            Width = 676
            Height = 231
            Selected.Strings = (
              'DATAINICIO'#9'12'#9'Data de ~Início'
              'DATAFINAL'#9'12'#9'Data de ~Término'
              'QTDIAS'#9'15'#9'Dias'
              'DESCRICAO'#9'15'#9'Descrição'
              'QTDEMINUTOS'#9'5'#9'Minutos'
              'PERCADNOT'#9'10'#9'Percentual (%)'
              'DESCMODO'#9'40'#9'Modo'
              'DESCORIGEM'#9'23'#9'Origem'
              'DESCSITCADASTRADA,'#9'10'#9'Situação ~Cadastrada'
              'DESCSIT'#9'20'#9'Situação na ~Época')
            IniAttributes.Delimiter = ';;'
            TitleColor = clBtnFace
            FixedCols = 0
            ShowHorzScrollBar = True
            Align = alClient
            DataSource = dsAdicNoturno
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clWindowText
            Font.Height = -9
            Font.Name = 'MS Sans Serif'
            Font.Style = []
            KeyOptions = []
            Options = [dgTitles, dgIndicator, dgColumnResize, dgColLines, dgRowLines, dgTabs, dgConfirmDelete, dgCancelOnExit, dgWordWrap]
            ParentFont = False
            TabOrder = 0
            TitleAlignment = taLeftJustify
            TitleFont.Charset = DEFAULT_CHARSET
            TitleFont.Color = clWindowText
            TitleFont.Height = -9
            TitleFont.Name = 'MS Sans Serif'
            TitleFont.Style = [fsBold]
            TitleLines = 2
            TitleButtons = False
            OnCalcCellColors = dbgrdAdicNoturnoCalcCellColors
            IndicatorColor = icBlack
          end
          object pnlAdicNoturno: TPanel
            Left = 0
            Top = 0
            Width = 676
            Height = 231
            Align = alClient
            BevelInner = bvLowered
            BevelOuter = bvNone
            TabOrder = 1
            object Label28: TLabel
              Left = 9
              Top = 15
              Width = 83
              Height = 13
              Caption = 'Data de Início'
            end
            object Label29: TLabel
              Left = 135
              Top = 15
              Width = 95
              Height = 13
              Caption = 'Data de Término'
            end
            object Label30: TLabel
              Left = 522
              Top = 15
              Width = 83
              Height = 13
              Caption = 'Percentual (%)'
            end
            object Label31: TLabel
              Left = 396
              Top = 15
              Width = 80
              Height = 13
              Caption = 'Qtde. Minutos'
            end
            object Label38: TLabel
              Left = 756
              Top = 15
              Width = 117
              Height = 13
              Caption = 'Situação (Categoria)'
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clWindowText
              Font.Height = -9
              Font.Name = 'MS Sans Serif'
              Font.Style = [fsBold]
              ParentFont = False
            end
            object Label47: TLabel
              Left = 259
              Top = 15
              Width = 26
              Height = 13
              Caption = 'Dias'
            end
            object Label48: TLabel
              Left = 292
              Top = 15
              Width = 58
              Height = 13
              Caption = 'Descrição'
            end
            object Label49: TLabel
              Left = 650
              Top = 14
              Width = 32
              Height = 13
              Caption = 'Modo'
            end
            object dtInicioAdicNoturno: TCMDateTimePicker
              Left = 9
              Top = 30
              Width = 121
              Height = 21
              CalendarAttributes.Font.Charset = DEFAULT_CHARSET
              CalendarAttributes.Font.Color = clWindowText
              CalendarAttributes.Font.Height = -11
              CalendarAttributes.Font.Name = 'MS Sans Serif'
              CalendarAttributes.Font.Style = []
              ButtonStyle = cbsCustom
              DataField = 'DATAINICIO'
              DataSource = dsAdicNoturno
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
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clWindowText
              Font.Height = -9
              Font.Name = 'MS Sans Serif'
              Font.Style = []
              ParentFont = False
              ShowButton = True
              TabOrder = 0
            end
            object dtFimAdicNoturno: TCMDateTimePicker
              Left = 134
              Top = 30
              Width = 121
              Height = 21
              CalendarAttributes.Font.Charset = DEFAULT_CHARSET
              CalendarAttributes.Font.Color = clWindowText
              CalendarAttributes.Font.Height = -11
              CalendarAttributes.Font.Name = 'MS Sans Serif'
              CalendarAttributes.Font.Style = []
              ButtonStyle = cbsCustom
              DataField = 'DATAFINAL'
              DataSource = dsAdicNoturno
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
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clWindowText
              Font.Height = -9
              Font.Name = 'MS Sans Serif'
              Font.Style = []
              ParentFont = False
              ShowButton = True
              TabOrder = 1
            end
            object dbedPercAdicNoturno: TDBEdit2
              Left = 522
              Top = 30
              Width = 121
              Height = 21
              DataField = 'PERCADNOT'
              DataSource = dsAdicNoturno
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clWindowText
              Font.Height = -9
              Font.Name = 'MS Sans Serif'
              Font.Style = []
              MaxLength = 15
              ParentFont = False
              TabOrder = 5
              IntDigits = 10
              DecDigits = 5
            end
            object dbedQtdeMinutos: TDBEdit2
              Left = 396
              Top = 30
              Width = 121
              Height = 21
              DataField = 'QTDEMINUTOS'
              DataSource = dsAdicNoturno
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clWindowText
              Font.Height = -9
              Font.Name = 'MS Sans Serif'
              Font.Style = []
              MaxLength = 15
              ParentFont = False
              TabOrder = 4
              IntDigits = 10
              DecDigits = 5
            end
            object wwDBLookupComboSit: TwwDBLookupCombo
              Left = 756
              Top = 30
              Width = 137
              Height = 21
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clWindowText
              Font.Height = -9
              Font.Name = 'MS Sans Serif'
              Font.Style = []
              DropDownAlignment = taLeftJustify
              DataField = 'DESCSITCADASTRADA'
              DataSource = dsAdicNoturno
              LookupTable = qrySitPart
              LookupField = 'SITUACAO'
              Options = [loTitles]
              ParentFont = False
              TabOrder = 7
              AutoDropDown = True
              ShowButton = True
              SeqSearchOptions = []
              AllowClearKey = True
            end
            object DBEdDias: TDBEdit
              Left = 260
              Top = 30
              Width = 30
              Height = 21
              DataField = 'QTDIAS'
              DataSource = dsAdicNoturno
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clWindowText
              Font.Height = -9
              Font.Name = 'MS Sans Serif'
              Font.Style = []
              ParentFont = False
              TabOrder = 2
              OnEnter = DBEdDiasEnter
              OnExit = DBEdDiasExit
            end
            object wwDBCBDescricao: TwwDBComboBox
              Left = 293
              Top = 30
              Width = 100
              Height = 21
              ShowButton = True
              Style = csDropDown
              MapList = False
              AllowClearKey = False
              DataField = 'DESCRICAO'
              DataSource = dsAdicNoturno
              DropDownCount = 8
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clWindowText
              Font.Height = -9
              Font.Name = 'MS Sans Serif'
              Font.Style = []
              ItemHeight = 0
              Items.Strings = (
                'ADN 6H'
                'ADN 8H')
              ParentFont = False
              Sorted = False
              TabOrder = 3
              UnboundDataType = wwDefault
            end
            object wwDBCBModo: TwwDBComboBox
              Left = 649
              Top = 30
              Width = 98
              Height = 21
              ShowButton = True
              Style = csDropDown
              MapList = True
              AllowClearKey = False
              DataField = 'MODO'
              DataSource = dsAdicNoturno
              DropDownCount = 8
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clWindowText
              Font.Height = -9
              Font.Name = 'MS Sans Serif'
              Font.Style = []
              ItemHeight = 0
              Items.Strings = (
                'Efetivo'#9'E'
                'Facultativo'#9'F')
              ParentFont = False
              Sorted = False
              TabOrder = 6
              UnboundDataType = wwDefault
            end
          end
        end
        object tbsAdicIncorp: TTabSheet
          Caption = 'Adic. Incorporação'
          ImageIndex = 8
          object dbgrdAdicIncorp: TwwDBGrid
            Left = 0
            Top = 0
            Width = 676
            Height = 231
            Selected.Strings = (
              'CODIGO'#9'15'#9'Código'
              'GRUPO'#9'15'#9'Grupo'
              'FUNCAO'#9'40'#9'Função Base'
              'DATAINICIO'#9'12'#9'Data de ~Início'
              'DATAFINAL'#9'12'#9'Data de ~Término'
              'PERCINCORP'#9'10'#9'Percentual (%)'
              'DESCORIGEM'#9'23'#9'Origem'
              'DESCSITCADASTRADA'#9'10'#9'Situação ~Cadastrada')
            IniAttributes.Delimiter = ';;'
            TitleColor = clBtnFace
            FixedCols = 0
            ShowHorzScrollBar = True
            Align = alClient
            DataSource = dsAdicIncorp
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clWindowText
            Font.Height = -9
            Font.Name = 'MS Sans Serif'
            Font.Style = []
            KeyOptions = []
            Options = [dgTitles, dgIndicator, dgColumnResize, dgColLines, dgRowLines, dgTabs, dgConfirmDelete, dgCancelOnExit, dgWordWrap]
            ParentFont = False
            TabOrder = 1
            TitleAlignment = taLeftJustify
            TitleFont.Charset = DEFAULT_CHARSET
            TitleFont.Color = clWindowText
            TitleFont.Height = -9
            TitleFont.Name = 'MS Sans Serif'
            TitleFont.Style = [fsBold]
            TitleLines = 2
            TitleButtons = False
            OnCalcCellColors = dbgrdAdicIncorpCalcCellColors
            IndicatorColor = icBlack
          end
          object Panel3: TPanel
            Left = 0
            Top = 0
            Width = 676
            Height = 231
            Align = alClient
            BevelOuter = bvLowered
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clWindowText
            Font.Height = -9
            Font.Name = 'MS Sans Serif'
            Font.Style = []
            ParentFont = False
            TabOrder = 0
            object Label41: TLabel
              Left = 369
              Top = 9
              Width = 83
              Height = 13
              Caption = 'Data de Início'
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clWindowText
              Font.Height = -9
              Font.Name = 'MS Sans Serif'
              Font.Style = [fsBold]
              ParentFont = False
            end
            object Label42: TLabel
              Left = 10
              Top = 9
              Width = 228
              Height = 13
              Caption = 'Função Base do Adicional Incorporação'
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clWindowText
              Font.Height = -9
              Font.Name = 'MS Sans Serif'
              Font.Style = [fsBold]
              ParentFont = False
            end
            object Label43: TLabel
              Left = 562
              Top = 9
              Width = 59
              Height = 13
              Caption = 'Data Final'
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clWindowText
              Font.Height = -9
              Font.Name = 'MS Sans Serif'
              Font.Style = [fsBold]
              ParentFont = False
            end
            object Label44: TLabel
              Left = 11
              Top = 81
              Width = 62
              Height = 13
              Caption = 'Percentual'
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clWindowText
              Font.Height = -9
              Font.Name = 'MS Sans Serif'
              Font.Style = [fsBold]
              ParentFont = False
            end
            object Label45: TLabel
              Left = 531
              Top = 81
              Width = 117
              Height = 13
              Caption = 'Situação (Categoria)'
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clWindowText
              Font.Height = -9
              Font.Name = 'MS Sans Serif'
              Font.Style = [fsBold]
              ParentFont = False
            end
            object dblkpcmbFuncaoAdicIncorp: TwwDBLookupCombo
              Left = 10
              Top = 24
              Width = 245
              Height = 21
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clWindowText
              Font.Height = -9
              Font.Name = 'MS Sans Serif'
              Font.Style = []
              DropDownAlignment = taLeftJustify
              Selected.Strings = (
                'CODIGO'#9'15'#9'Código'
                'TITULO'#9'40'#9'Funções'#9'F')
              DataField = 'IDFUNCAO'
              DataSource = dsAdicIncorp
              LookupTable = qryFuncoes
              LookupField = 'IDCARGOEXT'
              Options = [loTitles]
              ParentFont = False
              TabOrder = 0
              AutoDropDown = True
              ShowButton = True
              AllowClearKey = True
            end
            object dtInicioAdicIncorp: TCMDateTimePicker
              Left = 369
              Top = 24
              Width = 102
              Height = 21
              CalendarAttributes.Font.Charset = DEFAULT_CHARSET
              CalendarAttributes.Font.Color = clWindowText
              CalendarAttributes.Font.Height = -11
              CalendarAttributes.Font.Name = 'MS Sans Serif'
              CalendarAttributes.Font.Style = []
              ButtonStyle = cbsCustom
              DataField = 'DATAINICIO'
              DataSource = dsAdicIncorp
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
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clWindowText
              Font.Height = -9
              Font.Name = 'MS Sans Serif'
              Font.Style = []
              ParentFont = False
              ShowButton = True
              TabOrder = 1
            end
            object CMDateTimePicker3: TCMDateTimePicker
              Left = 562
              Top = 24
              Width = 102
              Height = 21
              CalendarAttributes.Font.Charset = DEFAULT_CHARSET
              CalendarAttributes.Font.Color = clWindowText
              CalendarAttributes.Font.Height = -11
              CalendarAttributes.Font.Name = 'MS Sans Serif'
              CalendarAttributes.Font.Style = []
              ButtonStyle = cbsCustom
              DataField = 'DATAFINAL'
              DataSource = dsAdicIncorp
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
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clWindowText
              Font.Height = -9
              Font.Name = 'MS Sans Serif'
              Font.Style = []
              ParentFont = False
              ShowButton = True
              TabOrder = 2
            end
            object edPercAdicIncorp: TwwDBEdit
              Left = 11
              Top = 96
              Width = 65
              Height = 21
              DataField = 'PERCINCORP'
              DataSource = dsAdicIncorp
              TabOrder = 3
              UnboundDataType = wwDefault
              WantReturns = False
              WordWrap = False
            end
            object dblkpcmbSitPartAdicIncorp: TwwDBLookupCombo
              Left = 531
              Top = 96
              Width = 137
              Height = 21
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clWindowText
              Font.Height = -9
              Font.Name = 'MS Sans Serif'
              Font.Style = []
              DropDownAlignment = taLeftJustify
              Selected.Strings = (
                'SITUACAO'#9'9'#9'Situação'#9'F')
              DataField = 'FLGSITPART'
              DataSource = dsAdicIncorp
              LookupTable = qrySitPart
              LookupField = 'FLGSITPART'
              Options = [loTitles]
              ParentFont = False
              TabOrder = 4
              AutoDropDown = True
              ShowButton = True
              AllowClearKey = True
            end
          end
        end
        object tbsAdicPericul: TTabSheet
          Caption = 'Adic. Periculosidade'
          ImageIndex = 5
          object Panel2: TPanel
            Left = 0
            Top = 0
            Width = 676
            Height = 231
            Align = alClient
            BevelInner = bvLowered
            BevelOuter = bvNone
            TabOrder = 1
            object Label25: TLabel
              Left = 9
              Top = 15
              Width = 83
              Height = 13
              Caption = 'Data de Início'
            end
            object Label26: TLabel
              Left = 135
              Top = 15
              Width = 95
              Height = 13
              Caption = 'Data de Término'
            end
            object Label27: TLabel
              Left = 263
              Top = 15
              Width = 83
              Height = 13
              Caption = 'Percentual (%)'
            end
            object SpeedButton2: TSpeedButton
              Left = 387
              Top = 29
              Width = 23
              Height = 22
              Hint = 'Calcular Percentual do Adicional'
              Glyph.Data = {
                76010000424D7601000000000000760000002800000020000000100000000100
                04000000000000010000120B0000120B00001000000000000000000000000000
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
              NumGlyphs = 2
              ParentShowHint = False
              ShowHint = True
              Visible = False
            end
            object Label39: TLabel
              Left = 416
              Top = 15
              Width = 117
              Height = 13
              Caption = 'Situação (Categoria)'
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clWindowText
              Font.Height = -9
              Font.Name = 'MS Sans Serif'
              Font.Style = [fsBold]
              ParentFont = False
            end
            object dtIniAdicPericul: TCMDateTimePicker
              Left = 9
              Top = 30
              Width = 121
              Height = 21
              CalendarAttributes.Font.Charset = DEFAULT_CHARSET
              CalendarAttributes.Font.Color = clWindowText
              CalendarAttributes.Font.Height = -11
              CalendarAttributes.Font.Name = 'MS Sans Serif'
              CalendarAttributes.Font.Style = []
              ButtonStyle = cbsCustom
              DataField = 'DATAINICIO'
              DataSource = dsAdicPericul
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
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clWindowText
              Font.Height = -9
              Font.Name = 'MS Sans Serif'
              Font.Style = []
              ParentFont = False
              ShowButton = True
              TabOrder = 0
            end
            object dtFIMAdicPericul: TCMDateTimePicker
              Left = 135
              Top = 30
              Width = 121
              Height = 21
              CalendarAttributes.Font.Charset = DEFAULT_CHARSET
              CalendarAttributes.Font.Color = clWindowText
              CalendarAttributes.Font.Height = -11
              CalendarAttributes.Font.Name = 'MS Sans Serif'
              CalendarAttributes.Font.Style = []
              ButtonStyle = cbsCustom
              DataField = 'DATAFINAL'
              DataSource = dsAdicPericul
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
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clWindowText
              Font.Height = -9
              Font.Name = 'MS Sans Serif'
              Font.Style = []
              ParentFont = False
              ShowButton = True
              TabOrder = 1
            end
            object dbedPercPericul: TDBEdit2
              Left = 263
              Top = 30
              Width = 121
              Height = 21
              DataField = 'PERCPERICUL'
              DataSource = dsAdicPericul
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clWindowText
              Font.Height = -9
              Font.Name = 'MS Sans Serif'
              Font.Style = []
              MaxLength = 15
              ParentFont = False
              TabOrder = 3
              IntDigits = 10
              DecDigits = 5
            end
            object wwDBLookupCombo4: TwwDBLookupCombo
              Left = 416
              Top = 30
              Width = 137
              Height = 21
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clWindowText
              Font.Height = -9
              Font.Name = 'MS Sans Serif'
              Font.Style = []
              DropDownAlignment = taLeftJustify
              Selected.Strings = (
                'SITUACAO'#9'9'#9'Situação'#9'F')
              DataField = 'FLGSITPART'
              DataSource = dsAdicPericul
              LookupTable = qrySitPart
              LookupField = 'FLGSITPART'
              Options = [loTitles]
              ParentFont = False
              TabOrder = 2
              AutoDropDown = True
              ShowButton = True
              AllowClearKey = True
            end
          end
          object dbgrdAdicPericul: TwwDBGrid
            Left = 0
            Top = 0
            Width = 676
            Height = 231
            Selected.Strings = (
              'DATAINICIO'#9'15'#9'Data de ~Início'
              'DATAFINAL'#9'15'#9'Data de ~Término'
              'PERCPERICUL'#9'20'#9'Percentual (%)'
              'DESCORIGEM'#9'30'#9'Origem'
              'DESCSITCADASTRADA'#9'10'#9'Situação ~Cadastrada'
              'DESCSIT'#9'20'#9'Situação na ~Época')
            IniAttributes.Delimiter = ';;'
            TitleColor = clBtnFace
            FixedCols = 0
            ShowHorzScrollBar = True
            Align = alClient
            DataSource = dsAdicPericul
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clWindowText
            Font.Height = -9
            Font.Name = 'MS Sans Serif'
            Font.Style = []
            KeyOptions = []
            Options = [dgTitles, dgIndicator, dgColumnResize, dgColLines, dgRowLines, dgTabs, dgConfirmDelete, dgCancelOnExit, dgWordWrap]
            ParentFont = False
            TabOrder = 0
            TitleAlignment = taLeftJustify
            TitleFont.Charset = DEFAULT_CHARSET
            TitleFont.Color = clWindowText
            TitleFont.Height = -9
            TitleFont.Name = 'MS Sans Serif'
            TitleFont.Style = [fsBold]
            TitleLines = 2
            TitleButtons = False
            OnCalcCellColors = dbgrdAdicPericulCalcCellColors
            IndicatorColor = icBlack
          end
        end
        object tbsRubSal: TTabSheet
          Caption = 'Outras Rubricas Salariais'
          object dbgrdRubSal: TwwDBGrid
            Left = 0
            Top = 0
            Width = 676
            Height = 231
            Selected.Strings = (
              'CODPROVDESC'#9'7'#9'Código ~da Rubrica'#9'F'
              'MES'#9'7'#9'Mês de ~Referência'#9'F'
              'MESCOBRANCA'#9'7'#9'Mês de ~Cobrança'#9'F'
              'VALORPROVENTO'#9'10'#9'Valor da ~Rubrica'#9'F'
              'VALORNADIB'#9'10'#9'Valor na ~Data  Ref.'#9'F'
              'PERCENTUALNADIB'#9'10'#9'Percentual ~na Data Ref.'#9'F'
              'MODULO'#9'21'#9'Módulo'#9'F'
              'DESCRPROVDESC'#9'60'#9'Nome da Rubrica'#9'F')
            IniAttributes.Delimiter = ';;'
            TitleColor = clBtnFace
            FixedCols = 0
            ShowHorzScrollBar = True
            Align = alClient
            DataSource = dsRubSalarial
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clWindowText
            Font.Height = -9
            Font.Name = 'MS Sans Serif'
            Font.Style = []
            KeyOptions = []
            Options = [dgTitles, dgIndicator, dgColumnResize, dgColLines, dgRowLines, dgTabs, dgConfirmDelete, dgCancelOnExit, dgWordWrap]
            ParentFont = False
            TabOrder = 0
            TitleAlignment = taLeftJustify
            TitleFont.Charset = DEFAULT_CHARSET
            TitleFont.Color = clWindowText
            TitleFont.Height = -9
            TitleFont.Name = 'MS Sans Serif'
            TitleFont.Style = [fsBold]
            TitleLines = 2
            TitleButtons = False
            IndicatorColor = icBlack
          end
          object pnlControlesRubSalarial: TPanel
            Left = 0
            Top = 0
            Width = 676
            Height = 231
            Align = alClient
            BevelInner = bvLowered
            BevelOuter = bvNone
            TabOrder = 1
            object GroupBox2: TGroupBox
              Left = 336
              Top = 6
              Width = 316
              Height = 94
              Caption = 'Informações da Rubrica'
              TabOrder = 2
              object Label10: TLabel
                Left = 7
                Top = 15
                Width = 45
                Height = 13
                Caption = 'Rubrica'
              end
              object Label17: TLabel
                Left = 7
                Top = 53
                Width = 30
                Height = 13
                Caption = 'Valor'
              end
              object dbedValor: TwwDBEdit
                Left = 7
                Top = 66
                Width = 121
                Height = 21
                DataField = 'VALORPROVENTO'
                DataSource = dsRubSalarial
                Font.Charset = DEFAULT_CHARSET
                Font.Color = clWindowText
                Font.Height = -9
                Font.Name = 'MS Sans Serif'
                Font.Style = []
                ParentFont = False
                TabOrder = 1
                UnboundDataType = wwDefault
                WantReturns = False
                WordWrap = False
              end
              object dblkpcmbRubrica: TwwDBLookupCombo
                Left = 7
                Top = 29
                Width = 286
                Height = 21
                Font.Charset = DEFAULT_CHARSET
                Font.Color = clWindowText
                Font.Height = -9
                Font.Name = 'MS Sans Serif'
                Font.Style = []
                DropDownAlignment = taLeftJustify
                Selected.Strings = (
                  'DESCRPROVDESC'#9'130'#9'Rubrica'
                  'CODPROVDESC'#9'7'#9'Código')
                DataField = 'IDRUBRICA'
                DataSource = dsRubSalarial
                LookupTable = qryProvDesc
                LookupField = 'IDRUBRICA'
                ParentFont = False
                TabOrder = 0
                AutoDropDown = True
                ShowButton = True
                AllowClearKey = False
                OnEnter = dblkpcmbRubricaEnter
              end
            end
            object grpMesAnoRef: TGroupBox
              Left = 6
              Top = 6
              Width = 160
              Height = 52
              Caption = 'Ano e Mês de Referência'
              TabOrder = 0
              object dbedAnoMesRefRubSal: TwwDBEdit
                Left = 9
                Top = 22
                Width = 121
                Height = 21
                DataField = 'MES'
                DataSource = dsRubSalarial
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
                OnExit = dbedAnoMesRefRubSalExit
              end
            end
            object GroupBox1: TGroupBox
              Left = 171
              Top = 6
              Width = 160
              Height = 52
              Caption = 'Ano e Mês de Cobr/Pgmto'
              TabOrder = 1
              object dbedAnoMesCobRubSal: TwwDBEdit
                Left = 9
                Top = 22
                Width = 121
                Height = 21
                DataField = 'MESCOBRANCA'
                DataSource = dsRubSalarial
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
            end
          end
        end
      end
      inherited Dock973: TDock97
        Width = 774
        object Shape5: TShape [0]
          Left = 232
          Top = 7
          Width = 16
          Height = 12
          Brush.Color = 13303807
        end
        object Label1: TLabel [1]
          Left = 260
          Top = 7
          Width = 54
          Height = 15
          AutoSize = False
          Caption = 'Assistido'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -9
          Font.Name = 'MS Sans Serif'
          Font.Style = []
          ParentFont = False
          WordWrap = True
        end
        object Shape1: TShape [2]
          Left = 108
          Top = 7
          Width = 17
          Height = 12
          Brush.Color = clWindow
        end
        object Label2: TLabel [3]
          Left = 128
          Top = 7
          Width = 56
          Height = 15
          AutoSize = False
          Caption = 'Ativo'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -9
          Font.Name = 'MS Sans Serif'
          Font.Style = []
          ParentFont = False
          WordWrap = True
        end
        inherited tb97BotoesDetalhe: TToolbar97
          Left = 9
          DockPos = 9
        end
      end
      inherited Dock974: TDock97
        Left = 688
        Height = 259
      end
    end
  end
  inherited Dock972: TDock97
    Width = 784
    inherited Toolbar971: TToolbar97
      inherited sbtnInserir: TToolbarButton97
        Left = 60
        Visible = False
      end
      inherited sbtnAlterar: TToolbarButton97
        Left = 0
      end
      inherited sbtnApagar: TToolbarButton97
        Visible = False
      end
    end
  end
  inherited Dock971: TDock97
    Top = 483
    Width = 784
  end
  inherited ivTradutor: TIvExtendedTranslator
    Left = 1032
    Top = 65498
  end
  inherited dsDet: TwwDataSource
    AutoEdit = True
    DataSet = qryDet
    Left = 560
    Top = 0
  end
  inherited ds: TwwDataSource
    Left = 312
    Top = 0
  end
  inherited upd: TUpdateSQL
    ModifySQL.Strings = (
      'update PESSOAFISICA'
      'set'
      '  VLRENQUADRAMENTO = :VLRENQUADRAMENTO'
      'where'
      '  IDPESSOA = :OLD_IDPESSOA')
    InsertSQL.Strings = (
      'insert into PESSOAFISICA'
      '  (VLRENQUADRAMENTO)'
      'values'
      '  (:VLRENQUADRAMENTO)')
    DeleteSQL.Strings = (
      'delete from PESSOAFISICA'
      'where'
      '  IDPESSOA = :OLD_IDPESSOA')
    Left = 248
    Top = 0
  end
  inherited MontaSelect: TMontaSelect
    Caption = ''
    Colunas.Strings = (
      'DECODE(P.IDPESSOA, DP.IDPESSOA, EL.MATRICULA, NULL)'
      'P.NOME'
      'DP.MATRICULA'
      'PD.NOME'
      'PP.INSCRICAONUMERO'
      'PAT.NOME'
      'PL.NOME')
    TipodeDado.Strings = (
      'C'
      'C'
      'C'
      'C'
      'N'
      'C'
      'C')
    Descricao.Strings = (
      'Matrícula Titular'
      'Nome do Participante'
      'Matrícula Depen./Benef.'
      'Nome do Depen./Benef.'
      'Inscrição '
      'Patrocinadora'
      'Plano Previdenciário')
    SensivelACaixa.Strings = (
      'S'
      'N'
      'N'
      'N'
      'N'
      'N'
      'N')
    Tabelas.Strings = (
      'PESSOA P'
      'PESSOA PD'
      'PESSOA PAT'
      'ELEGPATRO EL'
      'DEPENTIT DP'
      'PARTPREVPLAN PP'
      'PLANPREV PL')
    CamposChave.Strings = (
      'EL.IDPESSJUR'
      'NVL(PD.IDPESSOA,P.IDPESSOA)'
      'NVL(PP.IDPLANOPREV,0)')
    Filtro.Strings = (
      'PAT.IDPESSOA      = EL.IDPESSJUR'
      'P.IDPESSOA        = EL.IDPESSOA'
      'PP.IDPESSJUR(+)   = EL.IDPESSJUR'
      'PP.IDPESSOA(+)    = EL.IDPESSOA'
      'PL.IDPLANOPREV(+) = PP.IDPLANOPREV'
      'DP.IDTITULAR(+)   = EL.IDPESSOA'
      'PD.IDPESSOA(+)    = DP.IDPESSOA    ')
    Mascaras.Strings = (
      ''
      ''
      ''
      ''
      ''
      ''
      '')
    Larguras.Strings = (
      '15'
      '60'
      '15'
      '60'
      '10'
      '60'
      '50')
    OperComparador.Strings = (
      '-1'
      '-1'
      '-1'
      '-1'
      '-1'
      '-1'
      '-1')
    LookupSQL.Strings = (
      ''
      ''
      ''
      ''
      ''
      ''
      '')
    LookupCampoChave.Strings = (
      ''
      ''
      ''
      ''
      ''
      ''
      '')
    LookupCampoExibe.Strings = (
      ''
      ''
      ''
      ''
      ''
      ''
      '')
    Left = 340
    Top = 19
  end
  inherited ImlPadrao: TImageList
    Left = 1033
    Top = 65498
  end
  inherited CmeCadastro: TCmEventosCadastro
    OnFind = CmeCadastroFind
    Left = 416
    Top = 16
  end
  inherited qry: TwwQuery
    SQL.Strings = (
      
        'SELECT 1 TITULAR, EL.IDPESSOA AS IDTITULAR,  EL.IDPESSOA, EL.IDP' +
        'ESSJUR, PP.IDPLANOPREV, PP.SEQPROPOSTA, P.NOME, EL.MATRICULA,'
      '       PAT.NOME AS NOMEPATRO, PL.NOME AS NOMEPLANO,'
      
        '       PP.INSCRICAONUMERO, PF.VLRENQUADRAMENTO, SP.FLGINTERNO AS' +
        ' FLGSITPART,'
      '       DECODE(FLGINTERNO, '#39'AT'#39', '#39'Ativo'#39','
      '                          '#39'AE'#39', '#39'Ativo Especial'#39','
      '                          '#39'MA'#39', '#39'Mantido'#39','
      '                          '#39'MP'#39', '#39'Mantido Parcial'#39','
      '                          '#39'AS'#39', '#39'Assistido'#39','
      '                          '#39'MS'#39', '#39'Manutenção de Saldo de Conta'#39','
      '                          '#39'CA'#39', '#39'Cancelado'#39','
      '                          '#39'PE'#39', '#39'Pendente'#39') AS SITUACAO,'
      '       DECODE(FLGINTERNO, '#39'AT'#39', '#39'A'#39','
      '                          '#39'AE'#39', '#39'A'#39','
      '                          '#39'MA'#39', '#39'M'#39','
      '                          '#39'MP'#39', '#39'M'#39','
      '                          '#39'AS'#39', '#39'T'#39','
      '                          '#39'MS'#39', '#39'M'#39','
      '                          '#39'CA'#39', '#39'A'#39','
      '                          '#39'PE'#39', '#39'A'#39') AS SIT,'
      
        '       PP.SALMANTIDO, PLP.IDRGSALMANUT, PLP.IDRGSALMANUTPART, PP' +
        '.INSCRICAODATA, PP.DATAINICIOMANUT,'
      
        '       EL.NIVEL, EL.IDCARGOEXT, EL.SALTOTAL, SUM(R.VALORRESERVA)' +
        ' AS VALORRESERVA'
      'FROM   PESSOA P, PESSOA PAT, PESSOAFISICA PF,'
      
        '       PLANPREV PL, ELEGPATRO EL, PARTPREVPLAN PP, SITPART SP, P' +
        'LANPREVPATRO PLP,'
      '       RESERVAPART R, RESERVAXPLANO RP'
      'WHERE  EL.IDPESSJUR        = :IDPESSJUR'
      'AND    EL.IDPESSOA         = :IDPESSOA'
      'AND    PP.IDPESSJUR(+)     = EL.IDPESSJUR'
      'AND    PP.IDPESSOA(+)      = EL.IDPESSOA'
      '--AND    PP.FLGDESATIVADO(+) = 0'
      'AND    P.IDPESSOA          = EL.IDPESSOA'
      'AND    PAT.IDPESSOA        = EL.IDPESSJUR'
      'AND    PF.IDPESSOA         = EL.IDPESSOA'
      'AND    PL.IDPLANOPREV(+)   = PP.IDPLANOPREV'
      'AND    PP.IDPLANOPREV(+)   = :IDPLANOPREV'
      'AND    PP.IDSITPART        = SP.IDSITPART(+)'
      'AND    PLP.IDPESSJUR(+)       = PP.IDPESSJUR'
      'AND    PLP.IDPLANOPREV(+)     = PP.IDPLANOPREV'
      'AND    R.IDPESSJUR(+)      = PP.IDPESSJUR'
      'AND    R.IDPLANOPREV(+)    = PP.IDPLANOPREV'
      'AND    R.IDPESSOA(+)       = PP.IDPESSOA'
      'AND    R.SEQPROPOSTA(+)    = PP.SEQPROPOSTA'
      'AND    RP.IDPLANOPREV(+)   = R.IDPLANOPREV'
      'AND    RP.IDTIPORESERVA(+) = R.IDTIPORESERVA'
      
        'GROUP BY EL.IDPESSOA, EL.IDPESSJUR, PP.IDPLANOPREV, PP.SEQPROPOS' +
        'TA, P.NOME, EL.MATRICULA,'
      '       PAT.NOME, PL.NOME,'
      '       PP.INSCRICAONUMERO, PF.VLRENQUADRAMENTO, SP.FLGINTERNO,'
      
        '       PP.SALMANTIDO, PLP.IDRGSALMANUT, PLP.IDRGSALMANUTPART, PP' +
        '.INSCRICAODATA, PP.DATAINICIOMANUT,'
      '       EL.NIVEL, EL.IDCARGOEXT, EL.SALTOTAL'
      'UNION ALL'
      
        'SELECT 0 TITULAR, DP.IDTITULAR,  DP.IDPESSOA, EL.IDPESSJUR, PP.I' +
        'DPLANOPREV, PP.SEQPROPOSTA, P.NOME, DP.MATRICULA,'
      '       PAT.NOME AS NOMEPATRO, PL.NOME AS NOMEPLANO,'
      
        '       PP.INSCRICAONUMERO, PF.VLRENQUADRAMENTO, '#39'PS'#39' AS FLGSITPA' +
        'RT,'
      
        '       '#39'Pensionista'#39' AS SITUACAO, '#39'T'#39' SIT, 0 AS SALMANTIDO, -1 A' +
        'S IDRGSALMANUT, -1 AS IDRGSALMANUTPART,'
      '       PP.INSCRICAODATA, PP.DATAINICIOMANUT,'
      '       EL.NIVEL, EL.IDCARGOEXT, EL.SALTOTAL, 0 AS VALORRESERVA'
      'FROM   PESSOA P, PESSOA PAT, PESSOAFISICA PF,'
      '       PLANPREV PL, ELEGPATRO EL, PARTPREVPLAN PP, DEPENTIT DP'
      'WHERE  EL.IDPESSJUR        = :IDPESSJUR'
      'AND    EL.IDPESSOA         = PP.IDPESSOA'
      'AND    PP.IDPESSJUR(+)     = EL.IDPESSJUR'
      'AND    PP.IDPESSOA(+)      = EL.IDPESSOA'
      '--AND    PP.FLGDESATIVADO(+) = 0'
      'AND    P.IDPESSOA          = DP.IDPESSOA'
      'AND    PAT.IDPESSOA        = EL.IDPESSJUR'
      'AND    PF.IDPESSOA         = DP.IDPESSOA'
      'AND    PL.IDPLANOPREV(+)   = PP.IDPLANOPREV'
      'AND    PP.IDPLANOPREV(+)   = :IDPLANOPREV'
      'AND    DP.IDTITULAR        = EL.IDPESSOA'
      'AND    DP.IDPESSOA         = :IDPESSOA'
      ''
      ' '
      ' '
      ' '
      ' '
      ' '
      ''
      ' '
      ' '
      ' ')
    Left = 280
    Top = 0
    ParamData = <
      item
        DataType = ftInteger
        Name = 'IDPESSJUR'
        ParamType = ptUnknown
        Value = 1
      end
      item
        DataType = ftInteger
        Name = 'IDPESSOA'
        ParamType = ptUnknown
        Value = 3010
      end
      item
        DataType = ftUnknown
        Name = 'IDPLANOPREV'
        ParamType = ptUnknown
      end
      item
        DataType = ftInteger
        Name = 'IDPESSJUR'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'IDPLANOPREV'
        ParamType = ptUnknown
      end
      item
        DataType = ftInteger
        Name = 'IDPESSOA'
        ParamType = ptUnknown
      end>
  end
  inherited CmeDetalhe: TCmEventosCadastro
    BeforeConfirma = CmeDetalheBeforeConfirma
    Left = 528
    Top = 88
  end
  object qryDet: TwwQuery
    CachedUpdates = True
    AfterInsert = qryDetAfterInsert
    BeforePost = qryDetBeforePost
    OnCalcFields = qryDetCalcFields
    AutoRefresh = True
    DatabaseName = 'BaseDados'
    SQL.Strings = (
      'SELECT DISTINCT E.IDPESSJUR,       E.IDPESSOA,'
      '       E.IDPESSJURCG,     E.IDCARGOEXT,'
      '       E.IDPESSJURFG,     E.IDFUNCAO,'
      '       E.DATAINICIO,      E.DATAFINAL,'
      '       E.PERC1AC,         E.PERC2AC,'
      '       E.PERCATS,         E.PERCINSALUB,'
      '       E.PERCPERICUL,     E.PERCFUNCAO,'
      '       E.MODOFUNCAO,'
      '       E.SEQHISTFUNC,'
      '       E.ORIGEM, CE.CODIGO,'
      '       DECODE(E.ORIGEM, '#39'I'#39', '#39'Interface'#39','
      '                        '#39'C'#39', '#39'Cadastrado'#39','
      '                        '#39'E'#39', '#39'Evento de Manutenção'#39','
      '                        '#39'R'#39', '#39'Retroativo'#39') AS DESCORIGEM,'
      '       DECODE(E.MODOFUNCAO, '#39'EF'#39', '#39'EFETIVO'#39','
      '                          '#39'BC'#39' , '#39'BOLSA DE CARGO'#39','
      
        '                          '#39'DJ'#39' , '#39'DECISÃO JUDICIAL'#39' ) AS DESCMOD' +
        'O,'
      '       DECODE(E.FLGSITPART,'#39'AS'#39', '#39'Assistido'#39','
      '                           '#39'AT'#39', '#39'Ativo'#39','
      '                                 '#39'Outros'#39') AS DESCSITCADASTRADA,'
      '       CE.TITULO AS CARGO,'
      '       E.FLGSITPART  '
      'FROM EVOLFUNCPREV E, CARGOEXT CE, CARGOXNIVEL CN, NIVEL N'
      'WHERE E.IDPESSOA     = :IDPESSOA'
      '  AND E.IDPESSJUR    = :IDPESSJUR'
      '  AND CE.IDCARGOEXT  = E.IDCARGOEXT'
      '  AND CE.IDPESSJUR   = E.IDPESSJUR'
      '  AND CN.IDPESSJUR   = CE.IDPESSJUR'
      '  AND CN.IDCARGOEXT  = CE.IDCARGOEXT'
      '  AND N.IDNIVEL      = CN.IDNIVEL'
      '  AND N.IDPESSJUR    = CN.IDPESSJUR'
      'ORDER BY E.DATAINICIO DESC'
      ''
      ''
      ''
      ' '
      ' ')
    UpdateObject = updDet
    ControlType.Strings = (
      'FLGSITPART;CustomEdit;dbcSituacao')
    ValidateWithMask = True
    Left = 520
    ParamData = <
      item
        DataType = ftInteger
        Name = 'IDPESSOA'
        ParamType = ptUnknown
        Value = 313933
      end
      item
        DataType = ftInteger
        Name = 'IDPESSJUR'
        ParamType = ptUnknown
        Value = 1
      end>
    object qryDetCODIGO: TStringField
      DisplayLabel = 'Código'
      DisplayWidth = 12
      FieldName = 'CODIGO'
      Size = 15
    end
    object qryDetCARGO: TStringField
      DisplayLabel = 'Cargo'
      DisplayWidth = 40
      FieldName = 'CARGO'
      Size = 40
    end
    object qryDetDATAINICIO: TDateTimeField
      DisplayLabel = 'Data de ~Início'
      DisplayWidth = 12
      FieldName = 'DATAINICIO'
    end
    object qryDetDATAFINAL: TDateTimeField
      DisplayLabel = 'Data de ~Término'
      DisplayWidth = 12
      FieldName = 'DATAFINAL'
    end
    object qryDetDESCMODO: TStringField
      DisplayLabel = 'Modo'
      DisplayWidth = 14
      FieldName = 'DESCMODO'
      Size = 14
    end
    object qryDetDESCORIGEM: TStringField
      DisplayLabel = 'Origem'
      DisplayWidth = 20
      FieldName = 'DESCORIGEM'
    end
    object qryDetDESCSITCADASTRADA: TStringField
      DisplayLabel = 'Situação ~Cadastrada'
      DisplayWidth = 10
      FieldName = 'DESCSITCADASTRADA'
      Size = 9
    end
    object qryDetDESCSIT: TStringField
      DisplayLabel = 'Situação na~Época'
      DisplayWidth = 10
      FieldKind = fkCalculated
      FieldName = 'DESCSIT'
      Size = 40
      Calculated = True
    end
    object qryDetIDPESSJUR: TFloatField
      DisplayWidth = 10
      FieldName = 'IDPESSJUR'
      Visible = False
    end
    object qryDetIDPESSOA: TFloatField
      DisplayWidth = 10
      FieldName = 'IDPESSOA'
      Visible = False
    end
    object qryDetIDPESSJURCG: TFloatField
      DisplayWidth = 10
      FieldName = 'IDPESSJURCG'
      Visible = False
    end
    object qryDetIDCARGOEXT: TFloatField
      DisplayWidth = 10
      FieldName = 'IDCARGOEXT'
      Visible = False
    end
    object qryDetIDPESSJURFG: TFloatField
      DisplayWidth = 10
      FieldName = 'IDPESSJURFG'
      Visible = False
    end
    object qryDetIDFUNCAO: TFloatField
      DisplayWidth = 10
      FieldName = 'IDFUNCAO'
      Visible = False
    end
    object qryDetPERC1AC: TFloatField
      DisplayWidth = 10
      FieldName = 'PERC1AC'
      Visible = False
    end
    object qryDetPERC2AC: TFloatField
      DisplayWidth = 10
      FieldName = 'PERC2AC'
      Visible = False
    end
    object qryDetPERCATS: TFloatField
      DisplayWidth = 10
      FieldName = 'PERCATS'
      Visible = False
    end
    object qryDetPERCINSALUB: TFloatField
      DisplayWidth = 10
      FieldName = 'PERCINSALUB'
      Visible = False
    end
    object qryDetPERCPERICUL: TFloatField
      DisplayWidth = 10
      FieldName = 'PERCPERICUL'
      Visible = False
    end
    object qryDetPERCFUNCAO: TFloatField
      DisplayWidth = 10
      FieldName = 'PERCFUNCAO'
      Visible = False
    end
    object qryDetMODOFUNCAO: TStringField
      DisplayWidth = 2
      FieldName = 'MODOFUNCAO'
      Visible = False
      FixedChar = True
      Size = 2
    end
    object qryDetORIGEM: TStringField
      DisplayWidth = 1
      FieldName = 'ORIGEM'
      Visible = False
      FixedChar = True
      Size = 1
    end
    object qryDetFLGSITPART: TStringField
      DisplayWidth = 2
      FieldName = 'FLGSITPART'
      Visible = False
      FixedChar = True
      Size = 2
    end
    object qryDetSIT: TStringField
      FieldKind = fkCalculated
      FieldName = 'SIT'
      Visible = False
      Calculated = True
    end
    object qryDetSEQHISTFUNC: TFloatField
      FieldName = 'SEQHISTFUNC'
      Visible = False
    end
  end
  object updDet: TUpdateSQL
    ModifySQL.Strings = (
      'update EVOLFUNCPREV'
      'set'
      '  IDPESSOA = :IDPESSOA,'
      '  IDPESSJUR = :IDPESSJUR,'
      '  SEQHISTFUNC = :SEQHISTFUNC,'
      '  IDCARGOEXT = :IDCARGOEXT,'
      '  IDFUNCAO = :IDFUNCAO,'
      '  IDPESSJURCG = :IDPESSJURCG,'
      '  IDPESSJURFG = :IDPESSJURFG,'
      '  PERC1AC = :PERC1AC,'
      '  PERC2AC = :PERC2AC,'
      '  PERCATS = :PERCATS,'
      '  PERCINSALUB = :PERCINSALUB,'
      '  PERCPERICUL = :PERCPERICUL,'
      '  PERCFUNCAO = :PERCFUNCAO,'
      '  MODOFUNCAO = :MODOFUNCAO,'
      '  DATAINICIO = :DATAINICIO,'
      '  DATAFINAL = :DATAFINAL,'
      '  ORIGEM = :ORIGEM,'
      '  FLGSITPART = :FLGSITPART'
      'where'
      '  IDPESSOA = :OLD_IDPESSOA and'
      '  IDPESSJUR = :OLD_IDPESSJUR and'
      '  SEQHISTFUNC = :OLD_SEQHISTFUNC'
      ' '
      ' ')
    InsertSQL.Strings = (
      'insert into EVOLFUNCPREV'
      
        '  (IDPESSOA, IDPESSJUR, SEQHISTFUNC, IDCARGOEXT, IDFUNCAO, IDPES' +
        'SJURCG,'
      
        '   IDPESSJURFG, PERC1AC, PERC2AC, PERCATS, PERCINSALUB, PERCPERI' +
        'CUL, PERCFUNCAO,'
      '   MODOFUNCAO, DATAINICIO, DATAFINAL, ORIGEM, FLGSITPART)'
      'values'
      
        '  (:IDPESSOA, :IDPESSJUR, :SEQHISTFUNC, :IDCARGOEXT, :IDFUNCAO, ' +
        ':IDPESSJURCG,'
      
        '   :IDPESSJURFG, :PERC1AC, :PERC2AC, :PERCATS, :PERCINSALUB, :PE' +
        'RCPERICUL,'
      
        '   :PERCFUNCAO, :MODOFUNCAO, :DATAINICIO, :DATAFINAL, :ORIGEM, :' +
        'FLGSITPART)'
      ' '
      ' '
      ' ')
    DeleteSQL.Strings = (
      'delete from EVOLFUNCPREV'
      'where'
      '  IDPESSOA = :OLD_IDPESSOA and'
      '  IDPESSJUR = :OLD_IDPESSJUR and'
      '  SEQHISTFUNC = :OLD_SEQHISTFUNC')
    Left = 480
  end
  object qryFuncoes: TwwQuery
    DatabaseName = 'BaseDados'
    SQL.Strings = (
      'SELECT F.IDPESSJUR, F.IDCARGOEXT, F.CODIGO, F.TITULO'
      'FROM   CARGOEXT F'
      'WHERE  F.IDPESSJUR = :IDPESSJUR'
      'AND    F.TIPO = '#39'F'#39
      'ORDER BY F.CODIGO')
    ValidateWithMask = True
    Left = 472
    Top = 344
    ParamData = <
      item
        DataType = ftInteger
        Name = 'IDPESSJUR'
        ParamType = ptUnknown
      end>
  end
  object qryCargoxNivel: TwwQuery
    DatabaseName = 'BaseDados'
    SQL.Strings = (
      
        'SELECT DISTINCT C.CODIGO AS CODCARGO, CN.IDCARGOEXT, CN.IDNIVEL,' +
        ' CN.IDPESSJUR, C.TITULO, N.CODIGO'
      'FROM   CARGOEXT C, NIVEL N, CARGOXNIVEL CN'
      'WHERE  C.IDPESSJUR   = :IDPESSJUR'
      'AND    CN.IDPESSJUR  = C.IDPESSJUR'
      'AND    CN.IDCARGOEXT = C.IDCARGOEXT'
      'AND    CN.IDPESSJUR  = N.IDPESSJUR'
      'AND    CN.IDNIVEL    = N.IDNIVEL'
      'ORDER BY C.CODIGO, C.TITULO, N.CODIGO')
    ValidateWithMask = True
    Left = 304
    Top = 344
    ParamData = <
      item
        DataType = ftInteger
        Name = 'IDPESSJUR'
        ParamType = ptUnknown
      end>
  end
  object qryVigenciaNivel: TwwQuery
    DatabaseName = 'BaseDados'
    SQL.Strings = (
      'SELECT IDNIVEL, IDPESSJUR,IDCARGOEXT, DATAVIGENCIA'
      'FROM   CARGOXNIVEL'
      'WHERE  IDPESSJUR   = :IDPESSJUR'
      'AND    IDCARGOEXT  = :IDCARGOEXT'
      'AND    DATAVIGENCIA <= :DATAINICIO'
      'AND    ( (DATAFIM >= :DATAINICIO) OR (DATAFIM IS NULL))'
      '')
    ValidateWithMask = True
    Left = 632
    Top = 304
    ParamData = <
      item
        DataType = ftInteger
        Name = 'IDPESSJUR'
        ParamType = ptUnknown
      end
      item
        DataType = ftInteger
        Name = 'IDCARGOEXT'
        ParamType = ptUnknown
      end
      item
        DataType = ftDate
        Name = 'DATAINICIO'
        ParamType = ptUnknown
      end
      item
        DataType = ftDate
        Name = 'DATAINICIO'
        ParamType = ptUnknown
      end>
  end
  object qryVigenciaFuncao: TwwQuery
    DatabaseName = 'BaseDados'
    SQL.Strings = (
      
        'SELECT F.IDGRUPOFUNC, F.IDFAIXASALEXT, F.DATAEFETIVACAO, F.IDPES' +
        'SJUR'
      'FROM   FAIXAGRUPO F, GRUPOCARGOEXT GC'
      'WHERE  GC.IDPESSJUR   = :IDPESSJUR'
      'AND    GC.IDCARGOEXT  = :IDCARGOEXT'
      'AND    F.IDPESSJUR    = GC.IDPESSJUR'
      'AND    F.IDGRUPOFUNC  = GC.IDGRUPOFUNC'
      'AND    GC.DATAVIGENCIA <= :DATAINICIO'
      'AND    ( (GC.DATAFIM >= :DATAINICIO) OR (GC.DATAFIM IS NULL))'
      'AND    F.DATAEFETIVACAO <= :DATAINICIO'
      ''
      ' ')
    ValidateWithMask = True
    Left = 640
    Top = 352
    ParamData = <
      item
        DataType = ftInteger
        Name = 'IDPESSJUR'
        ParamType = ptUnknown
      end
      item
        DataType = ftInteger
        Name = 'IDCARGOEXT'
        ParamType = ptUnknown
      end
      item
        DataType = ftDate
        Name = 'DATAINICIO'
        ParamType = ptUnknown
      end
      item
        DataType = ftDate
        Name = 'DATAINICIO'
        ParamType = ptUnknown
      end
      item
        DataType = ftDate
        Name = 'DATAINICIO'
        ParamType = ptUnknown
      end>
  end
  object dsFuncao: TwwDataSource
    AutoEdit = False
    DataSet = qryFuncao
    Left = 544
    Top = 432
  end
  object updFuncao: TUpdateSQL
    ModifySQL.Strings = (
      'update EVOLFUNCPREV'
      'set'
      '  IDPESSOA = :IDPESSOA,'
      '  IDPESSJUR = :IDPESSJUR,'
      '  SEQHISTFUNC = :SEQHISTFUNC,'
      '  IDCARGOEXT = :IDCARGOEXT,'
      '  IDFUNCAO = :IDFUNCAO,'
      '  IDPESSJURCG = :IDPESSJURCG,'
      '  IDPESSJURFG = :IDPESSJURFG,'
      '  PERC1AC = :PERC1AC,'
      '  PERC2AC = :PERC2AC,'
      '  PERCATS = :PERCATS,'
      '  PERCINSALUB = :PERCINSALUB,'
      '  PERCPERICUL = :PERCPERICUL,'
      '  PERCFUNCAO = :PERCFUNCAO,'
      '  MODOFUNCAO = :MODOFUNCAO,'
      '  DATAINICIO = :DATAINICIO,'
      '  DATAFINAL = :DATAFINAL,'
      '  ORIGEM = :ORIGEM,'
      '  FLGSITPART = :FLGSITPART'
      'where'
      '  IDPESSOA = :OLD_IDPESSOA and'
      '  IDPESSJUR = :OLD_IDPESSJUR and'
      '  SEQHISTFUNC = :OLD_SEQHISTFUNC'
      ' ')
    InsertSQL.Strings = (
      'insert into EVOLFUNCPREV'
      
        '  (IDPESSOA, IDPESSJUR, SEQHISTFUNC, IDCARGOEXT, IDFUNCAO, IDPES' +
        'SJURCG,'
      
        '   IDPESSJURFG, PERC1AC, PERC2AC, PERCATS, PERCINSALUB, PERCPERI' +
        'CUL, PERCFUNCAO,'
      '   MODOFUNCAO, DATAINICIO, DATAFINAL, ORIGEM, FLGSITPART)'
      'values'
      
        '  (:IDPESSOA, :IDPESSJUR, :SEQHISTFUNC, :IDCARGOEXT, :IDFUNCAO, ' +
        ':IDPESSJURCG,'
      
        '   :IDPESSJURFG, :PERC1AC, :PERC2AC, :PERCATS, :PERCINSALUB, :PE' +
        'RCPERICUL,'
      
        '   :PERCFUNCAO, :MODOFUNCAO, :DATAINICIO, :DATAFINAL, :ORIGEM, :' +
        'FLGSITPART)'
      ' ')
    DeleteSQL.Strings = (
      'delete from EVOLFUNCPREV'
      'where'
      '  IDPESSOA = :OLD_IDPESSOA and'
      '  IDPESSJUR = :OLD_IDPESSJUR and'
      '  SEQHISTFUNC = :OLD_SEQHISTFUNC')
    Left = 544
    Top = 416
  end
  object qryFuncao: TwwQuery
    CachedUpdates = True
    BeforePost = qryFuncaoBeforePost
    OnCalcFields = qryFuncaoCalcFields
    DatabaseName = 'BaseDados'
    SQL.Strings = (
      'SELECT E.IDPESSJUR,       E.IDPESSOA,       E.SEQHISTFUNC,'
      '       E.IDPESSJURCG,     E.IDCARGOEXT,'
      '       E.IDPESSJURFG,     E.IDFUNCAO,'
      '       E.DATAINICIO,      E.DATAFINAL,'
      '       E.PERC1AC,         E.PERC2AC,'
      '       E.PERCATS,         E.PERCINSALUB,'
      '       E.PERCPERICUL,     E.PERCFUNCAO,'
      '       E.MODOFUNCAO,'
      '       E.ORIGEM,'
      '       E.FLGSITPART,'
      '       DECODE(E.ORIGEM, '#39'I'#39', '#39'Interface'#39','
      '                        '#39'C'#39', '#39'Cadastrado'#39','
      '                        '#39'E'#39', '#39'Evento de Manutenção'#39','
      '                        '#39'R'#39', '#39'Retroativo'#39') AS DESCORIGEM,'
      '       DECODE(E.MODOFUNCAO, '#39'EF'#39', '#39'EFETIVA'#39','
      '                            '#39'AS'#39', '#39'ASSEGURADA'#39','
      '                            '#39'ES'#39', '#39'EVENTUAL/SUBSTITUIÇÃO'#39','
      '                            '#39'DP'#39', '#39'DESIGNAÇÃO POR PRAZO'#39','
      '                            '#39'FA'#39', '#39'FACULTATIVA'#39','
      
        '                            '#39'BF'#39', '#39'BOLSA DE FUNÇÃO'#39',        /*Br' +
        'uno Bastos - Pend. 22599*/'
      '                            '#39'ET'#39', '#39'ESTRATÉGICA'#39','
      
        '                            '#39'NE'#39', '#39'NÃO EFETIVA'#39',            /*Br' +
        'uno Bastos - Pend. 22599*/'
      
        '                            '#39'DJ'#39', '#39'DECISÃO JUDICIAL'#39',       /*JR' +
        'M6 - SOL 175221 KTN 1609812*/'
      '                            '#39'NÃO INFORMADO'#39') AS DESCMODO,'
      '       DECODE(E.FLGSITPART,'#39'AS'#39', '#39'Assistido'#39','
      '                           '#39'AT'#39', '#39'Ativo'#39','
      '                                 '#39'Outros'#39') AS DESCSITCADASTRADA,'
      ''
      '       F.CODIGO AS CODIGO,'
      '       GF.CODIGO GRUPO,'
      '       F.TITULO AS FUNCAO'
      'FROM   CARGOEXT F, EVOLFUNCPREV E,'
      '       GRUPOCARGOEXT GCE, GRUPOFUNC GF,'
      '       PARTPREVPLAN PP, SITPART SIT'
      ''
      'WHERE  E.IDPESSJUR      = :IDPESSJUR'
      'AND    E.IDPESSOA       = :IDPESSOA'
      'AND    PP.IDPLANOPREV(+)= :IDPLANOPREV'
      'AND    E.IDPESSJURFG    = F.IDPESSJUR'
      'AND    E.IDFUNCAO       = F.IDCARGOEXT'
      
        'AND   ((GCE.DATAFIM  IS NULL AND E.DATAINICIO >= GCE.DATAVIGENCI' +
        'A )  OR '
      
        '           (E.DATAINICIO BETWEEN GCE.DATAVIGENCIA AND  GCE.DATAF' +
        'IM )) '
      'AND    GCE.IDCARGOEXT   = E.IDFUNCAO'
      'AND    GF.IDGRUPOFUNC   = GCE.IDGRUPOFUNC'
      'AND    PP.IDPESSOA(+)      = E.IDPESSOA'
      'AND    PP.IDPESSJUR(+)      = E.IDPESSJUR'
      'AND    SIT.IDSITPART(+)    = PP.IDSITPART'
      'AND    E.IDFUNCAO IS NOT NULL'
      'AND    E.PERC1AC  IS NULL'
      'ORDER BY E.DATAINICIO DESC'
      ''
      ''
      ''
      ''
      ''
      ''
      ''
      ' '
      ' '
      ' ')
    UpdateObject = updFuncao
    ControlType.Strings = (
      'FLGSITPART;CustomEdit;dbcSituacao')
    ValidateWithMask = True
    Left = 544
    Top = 376
    ParamData = <
      item
        DataType = ftInteger
        Name = 'IDPESSJUR'
        ParamType = ptUnknown
        Value = 1
      end
      item
        DataType = ftInteger
        Name = 'IDPESSOA'
        ParamType = ptUnknown
        Value = 76644
      end
      item
        DataType = ftInteger
        Name = 'IDPLANOPREV'
        ParamType = ptUnknown
      end>
    object qryFuncaoCODIGO: TStringField
      DisplayLabel = 'Código'
      DisplayWidth = 15
      FieldName = 'CODIGO'
      Size = 15
    end
    object qryFuncaoGRUPO: TStringField
      DisplayLabel = 'Grupo'
      DisplayWidth = 15
      FieldName = 'GRUPO'
      FixedChar = True
      Size = 15
    end
    object qryFuncaoFUNCAO: TStringField
      DisplayLabel = 'Função'
      DisplayWidth = 40
      FieldName = 'FUNCAO'
      Size = 40
    end
    object qryFuncaoDATAINICIO: TDateTimeField
      DisplayLabel = 'Data de ~Início'
      DisplayWidth = 12
      FieldName = 'DATAINICIO'
    end
    object qryFuncaoDATAFINAL: TDateTimeField
      DisplayLabel = 'Data de ~Término'
      DisplayWidth = 12
      FieldName = 'DATAFINAL'
    end
    object qryFuncaoPERCFUNCAO: TFloatField
      DisplayLabel = 'Percentual%'
      DisplayWidth = 11
      FieldName = 'PERCFUNCAO'
    end
    object qryFuncaoDESCMODO: TStringField
      DisplayLabel = 'Modo'
      DisplayWidth = 21
      FieldName = 'DESCMODO'
      Size = 21
    end
    object qryFuncaoDESCORIGEM: TStringField
      DisplayLabel = 'Origem'
      DisplayWidth = 23
      FieldName = 'DESCORIGEM'
    end
    object qryFuncaoDESCSITCADASTRADA: TStringField
      DisplayLabel = 'Situação ~Cadastrada'
      DisplayWidth = 10
      FieldName = 'DESCSITCADASTRADA'
      Size = 9
    end
    object qryFuncaoDESCSIT: TStringField
      DisplayLabel = 'Situação na ~Época'
      DisplayWidth = 10
      FieldKind = fkCalculated
      FieldName = 'DESCSIT'
      Calculated = True
    end
    object qryFuncaoFLGSITPART: TStringField
      DisplayLabel = 'Situação'
      DisplayWidth = 24
      FieldName = 'FLGSITPART'
      Visible = False
      FixedChar = True
      Size = 2
    end
    object qryFuncaoIDPESSJUR: TFloatField
      FieldName = 'IDPESSJUR'
      Visible = False
    end
    object qryFuncaoIDPESSOA: TFloatField
      FieldName = 'IDPESSOA'
      Visible = False
    end
    object qryFuncaoSEQHISTFUNC: TFloatField
      FieldName = 'SEQHISTFUNC'
      Visible = False
    end
    object qryFuncaoIDPESSJURCG: TFloatField
      FieldName = 'IDPESSJURCG'
      Visible = False
    end
    object qryFuncaoIDCARGOEXT: TFloatField
      FieldName = 'IDCARGOEXT'
      Visible = False
    end
    object qryFuncaoIDPESSJURFG: TFloatField
      FieldName = 'IDPESSJURFG'
      Visible = False
    end
    object qryFuncaoIDFUNCAO: TFloatField
      FieldName = 'IDFUNCAO'
      Visible = False
    end
    object qryFuncaoPERC1AC: TFloatField
      FieldName = 'PERC1AC'
      Visible = False
    end
    object qryFuncaoPERC2AC: TFloatField
      FieldName = 'PERC2AC'
      Visible = False
    end
    object qryFuncaoPERCATS: TFloatField
      FieldName = 'PERCATS'
      Visible = False
    end
    object qryFuncaoPERCINSALUB: TFloatField
      FieldName = 'PERCINSALUB'
      Visible = False
    end
    object qryFuncaoPERCPERICUL: TFloatField
      FieldName = 'PERCPERICUL'
      Visible = False
    end
    object qryFuncaoMODOFUNCAO: TStringField
      FieldName = 'MODOFUNCAO'
      Visible = False
      FixedChar = True
      Size = 2
    end
    object qryFuncaoORIGEM: TStringField
      FieldName = 'ORIGEM'
      Visible = False
      FixedChar = True
      Size = 1
    end
    object qryFuncaoSIT: TStringField
      FieldKind = fkCalculated
      FieldName = 'SIT'
      Visible = False
      Calculated = True
    end
  end
  object dsATS: TwwDataSource
    AutoEdit = False
    DataSet = qryATS
    Left = 600
    Top = 432
  end
  object updATS: TUpdateSQL
    ModifySQL.Strings = (
      'update EVOLFUNCPREV'
      'set'
      '  IDPESSOA = :IDPESSOA,'
      '  IDPESSJUR = :IDPESSJUR,'
      '  SEQHISTFUNC = :SEQHISTFUNC,'
      '  IDCARGOEXT = :IDCARGOEXT,'
      '  IDFUNCAO = :IDFUNCAO,'
      '  IDPESSJURCG = :IDPESSJURCG,'
      '  IDPESSJURFG = :IDPESSJURFG,'
      '  PERC1AC = :PERC1AC,'
      '  PERC2AC = :PERC2AC,'
      '  PERCATS = :PERCATS,'
      '  PERCINSALUB = :PERCINSALUB,'
      '  PERCPERICUL = :PERCPERICUL,'
      '  PERCFUNCAO = :PERCFUNCAO,'
      '  MODOFUNCAO = :MODOFUNCAO,'
      '  DATAINICIO = :DATAINICIO,'
      '  DATAFINAL = :DATAFINAL,'
      '  ORIGEM = :ORIGEM,'
      '  FLGSITPART = :FLGSITPART'
      'where'
      '  IDPESSOA = :OLD_IDPESSOA and'
      '  IDPESSJUR = :OLD_IDPESSJUR and'
      '  SEQHISTFUNC = :OLD_SEQHISTFUNC'
      ' ')
    InsertSQL.Strings = (
      'insert into EVOLFUNCPREV'
      
        '  (IDPESSOA, IDPESSJUR, SEQHISTFUNC, IDCARGOEXT, IDFUNCAO, IDPES' +
        'SJURCG, '
      
        '   IDPESSJURFG, PERC1AC, PERC2AC, PERCATS, PERCINSALUB, PERCPERI' +
        'CUL, PERCFUNCAO, '
      '   MODOFUNCAO, DATAINICIO, DATAFINAL, ORIGEM, FLGSITPART)'
      'values'
      
        '  (:IDPESSOA, :IDPESSJUR, :SEQHISTFUNC, :IDCARGOEXT, :IDFUNCAO, ' +
        ':IDPESSJURCG,'
      
        '   :IDPESSJURFG, :PERC1AC, :PERC2AC, :PERCATS, :PERCINSALUB, :PE' +
        'RCPERICUL,'
      
        '   :PERCFUNCAO, :MODOFUNCAO, :DATAINICIO, :DATAFINAL, :ORIGEM, :' +
        'FLGSITPART)'
      ' ')
    DeleteSQL.Strings = (
      'delete from EVOLFUNCPREV'
      'where'
      '  IDPESSOA = :OLD_IDPESSOA and'
      '  IDPESSJUR = :OLD_IDPESSJUR and'
      '  SEQHISTFUNC = :OLD_SEQHISTFUNC')
    Left = 600
    Top = 416
  end
  object qryATS: TwwQuery
    CachedUpdates = True
    BeforePost = qryATSBeforePost
    OnCalcFields = qryATSCalcFields
    DatabaseName = 'BaseDados'
    SQL.Strings = (
      'SELECT E.IDPESSJUR,       E.IDPESSOA,       E.SEQHISTFUNC,'
      '       E.IDPESSJURCG,     E.IDCARGOEXT,'
      '       E.IDPESSJURFG,     E.IDFUNCAO,'
      '       E.DATAINICIO,      E.DATAFINAL,'
      '       E.PERC1AC,         E.PERC2AC,'
      '       E.PERCATS,         E.PERCINSALUB,'
      '       E.PERCPERICUL,     E.PERCFUNCAO,'
      '       E.MODOFUNCAO,'
      '       E.ORIGEM,'
      '       E.FLGSITPART,'
      '       DECODE(E.ORIGEM, '#39'I'#39', '#39'Interface'#39','
      '                        '#39'C'#39', '#39'Cadastrado'#39','
      '                        '#39'E'#39', '#39'Evento de Manutenção'#39','
      '                        '#39'R'#39', '#39'Retroativo'#39') AS DESCORIGEM,'
      '       DECODE(E.FLGSITPART,'#39'AS'#39', '#39'Assistido'#39','
      '                           '#39'AT'#39', '#39'Ativo'#39','
      '                                 '#39'Outros'#39') AS DESCSITCADASTRADA'
      ''
      'FROM   EVOLFUNCPREV E'
      'WHERE  E.IDPESSJUR      = :IDPESSJUR'
      'AND    E.IDPESSOA       = :IDPESSOA'
      'AND    PERCATS IS NOT NULL'
      'AND    PERCATS > 0'
      'ORDER BY E.DATAINICIO DESC '
      ''
      ' '
      ' '
      ' ')
    UpdateObject = updATS
    ControlType.Strings = (
      'FLGSITPART;CustomEdit;dbcSituacao')
    ValidateWithMask = True
    Left = 600
    Top = 400
    ParamData = <
      item
        DataType = ftInteger
        Name = 'IDPESSJUR'
        ParamType = ptUnknown
        Value = 1
      end
      item
        DataType = ftInteger
        Name = 'IDPESSOA'
        ParamType = ptUnknown
        Value = 76644
      end>
    object qryATSIDPESSJUR: TFloatField
      FieldName = 'IDPESSJUR'
    end
    object qryATSIDPESSOA: TFloatField
      FieldName = 'IDPESSOA'
    end
    object qryATSSEQHISTFUNC: TFloatField
      FieldName = 'SEQHISTFUNC'
    end
    object qryATSIDPESSJURCG: TFloatField
      FieldName = 'IDPESSJURCG'
    end
    object qryATSIDCARGOEXT: TFloatField
      FieldName = 'IDCARGOEXT'
    end
    object qryATSIDPESSJURFG: TFloatField
      FieldName = 'IDPESSJURFG'
    end
    object qryATSIDFUNCAO: TFloatField
      FieldName = 'IDFUNCAO'
    end
    object qryATSDATAINICIO: TDateTimeField
      FieldName = 'DATAINICIO'
    end
    object qryATSDATAFINAL: TDateTimeField
      FieldName = 'DATAFINAL'
    end
    object qryATSPERC1AC: TFloatField
      FieldName = 'PERC1AC'
    end
    object qryATSPERC2AC: TFloatField
      FieldName = 'PERC2AC'
    end
    object qryATSPERCATS: TFloatField
      FieldName = 'PERCATS'
    end
    object qryATSPERCINSALUB: TFloatField
      FieldName = 'PERCINSALUB'
    end
    object qryATSPERCPERICUL: TFloatField
      FieldName = 'PERCPERICUL'
    end
    object qryATSPERCFUNCAO: TFloatField
      FieldName = 'PERCFUNCAO'
    end
    object qryATSMODOFUNCAO: TStringField
      FieldName = 'MODOFUNCAO'
      FixedChar = True
      Size = 2
    end
    object qryATSORIGEM: TStringField
      FieldName = 'ORIGEM'
      FixedChar = True
      Size = 1
    end
    object qryATSFLGSITPART: TStringField
      FieldName = 'FLGSITPART'
      FixedChar = True
      Size = 2
    end
    object qryATSDESCORIGEM: TStringField
      FieldName = 'DESCORIGEM'
    end
    object qryATSSIT: TStringField
      FieldKind = fkCalculated
      FieldName = 'SIT'
      Calculated = True
    end
    object qryATSDESCSIT: TStringField
      FieldKind = fkCalculated
      FieldName = 'DESCSIT'
      Calculated = True
    end
    object qryATSDESCSITCADASTRADA: TStringField
      FieldName = 'DESCSITCADASTRADA'
      Size = 9
    end
  end
  object dsRubSalarial: TwwDataSource
    AutoEdit = False
    DataSet = qryRubSalarial
    Left = 48
    Top = 432
  end
  object updRubSalarial: TUpdateSQL
    ModifySQL.Strings = (
      'update HISTRUBSAL'
      'set'
      '  MES = :MES,'
      '  MESCOBRANCA = :MESCOBRANCA,'
      '  IDPESSJUR = :IDPESSJUR,'
      '  IDRUBRICA = :IDRUBRICA,'
      '  IDMOTIVO = :IDMOTIVO,'
      '  REFERENCIA = :REFERENCIA,'
      '  IDPESSOA = :IDPESSOA,'
      '  SEQRUBRICA = :SEQRUBRICA,'
      '  IDPATRO = :IDPATRO,'
      '  IDREGRACALCULO = :IDREGRACALCULO,'
      '  CODPROVDESC = :CODPROVDESC,'
      '  VALORPROVENTO = :VALORPROVENTO,'
      '  FLGCOMPOESALPART = :FLGCOMPOESALPART,'
      '  FLGCOMPOESALBENEF = :FLGCOMPOESALBENEF,'
      '  FLGIRRF = :FLGIRRF,'
      '  FLGCOMPOEREMTOTAL = :FLGCOMPOEREMTOTAL,'
      '  FLGPREVIA = :FLGPREVIA,'
      '  FLGSRB = :FLGSRB,'
      '  FLGCONCESSAO = :FLGCONCESSAO,'
      '  FLGSALPARTRETRO = :FLGSALPARTRETRO,'
      '  FLGSALPARTATUARIA = :FLGSALPARTATUARIA,'
      '  FLGSALBENEFRETRO = :FLGSALBENEFRETRO,'
      '  IDMODULO = :IDMODULO,'
      '  VALORNADIB = :VALORNADIB,'
      '  TIPOITEMPCS = :TIPOITEMPCS,'
      '  FLGEQUIPARACAO = :FLGEQUIPARACAO,'
      '  PERCENTUALNADIB = :PERCENTUALNADIB'
      'where'
      '  MES = :OLD_MES and'
      '  MESCOBRANCA = :OLD_MESCOBRANCA and'
      '  IDPESSJUR = :OLD_IDPESSJUR and'
      '  IDRUBRICA = :OLD_IDRUBRICA and'
      '  IDMOTIVO = :OLD_IDMOTIVO and'
      '  REFERENCIA = :OLD_REFERENCIA and'
      '  IDPESSOA = :OLD_IDPESSOA and'
      '  SEQRUBRICA = :OLD_SEQRUBRICA')
    InsertSQL.Strings = (
      'insert into HISTRUBSAL'
      
        '  (MES, MESCOBRANCA, IDPESSJUR, IDRUBRICA, IDMOTIVO, REFERENCIA,' +
        ' '
      'IDPESSOA, '
      '   SEQRUBRICA, IDPATRO, IDREGRACALCULO, CODPROVDESC, '
      'VALORPROVENTO, FLGCOMPOESALPART, '
      '   FLGCOMPOESALBENEF, FLGIRRF, FLGCOMPOEREMTOTAL, FLGPREVIA, '
      'FLGSRB, FLGCONCESSAO, '
      '   FLGSALPARTRETRO, FLGSALPARTATUARIA, FLGSALBENEFRETRO, '
      'IDMODULO, VALORNADIB, '
      '   TIPOITEMPCS, FLGEQUIPARACAO, PERCENTUALNADIB,IDTITULAR)'
      'values'
      
        '  (:MES, :MESCOBRANCA, :IDPESSJUR, :IDRUBRICA, :IDMOTIVO, :REFER' +
        'ENCIA, '
      
        '   :IDPESSOA, :SEQRUBRICA, :IDPATRO, :IDREGRACALCULO, :CODPROVDE' +
        'SC, '
      ':VALORPROVENTO, '
      '   :FLGCOMPOESALPART, :FLGCOMPOESALBENEF, :FLGIRRF, '
      ':FLGCOMPOEREMTOTAL, '
      '   :FLGPREVIA, :FLGSRB, :FLGCONCESSAO, :FLGSALPARTRETRO, '
      ':FLGSALPARTATUARIA, '
      '   :FLGSALBENEFRETRO, :IDMODULO, :VALORNADIB, :TIPOITEMPCS, '
      ':FLGEQUIPARACAO, '
      '   :PERCENTUALNADIB,:IDPESSOA)')
    DeleteSQL.Strings = (
      'DELETE FROM HISTRUBSAL'
      'WHERE'
      '  MES = :OLD_MES and'
      '  MESCOBRANCA = :OLD_MESCOBRANCA and'
      '  IDPESSJUR = :OLD_IDPESSJUR and'
      '  IDRUBRICA = :OLD_IDRUBRICA and'
      '  IDMOTIVO = :OLD_IDMOTIVO and'
      '  REFERENCIA = :OLD_REFERENCIA and'
      '  IDPESSOA = :OLD_IDPESSOA and'
      '  SEQRUBRICA = :OLD_SEQRUBRICA')
    Left = 48
    Top = 416
  end
  object qryRubSalarial: TwwQuery
    CachedUpdates = True
    BeforePost = qryRubSalarialBeforePost
    DatabaseName = 'BaseDados'
    SQL.Strings = (
      
        'SELECT H.CODPROVDESC, H.FLGCOMPOEREMTOTAL, H.FLGCOMPOESALBENEF, ' +
        'H.FLGCOMPOESALPART,'
      
        '       H.FLGCONCESSAO, H.FLGIRRF, H.FLGPREVIA, H.FLGSALBENEFRETR' +
        'O, H.FLGSALPARTATUARIA,'
      
        '       H.FLGSALPARTRETRO, H.FLGSRB, H.IDMODULO, H.IDMOTIVO, H.ID' +
        'PATRO, H.IDPESSJUR,'
      
        '       H.IDPESSOA, H.IDREGRACALCULO, H.IDRUBRICA, H.MES, H.MESCO' +
        'BRANCA, H.REFERENCIA,'
      
        '       H.SEQRUBRICA, H.VALORPROVENTO, H.VALORNADIB, H.PERCENTUAL' +
        'NADIB, H.FLGEQUIPARACAO,'
      '       H.TIPOITEMPCS,'
      
        '       DECODE(H.IDMODULO, 16, '#39'AdmPREV'#39', 32, '#39'CCP'#39', 21, '#39'Folha d' +
        'e Pagamento CM'#39', '#39'Outros'#39') AS MODULO,'
      '       R.DESCRPROVDESC'
      'FROM   RUBRICAXPESS R, HISTRUBSAL H'
      'WHERE  H.IDPESSJUR = :IDPESSJUR'
      'AND    H.IDPESSOA  = :IDPESSOA'
      'AND   ( H.FLGEQUIPARACAO = 1  or H.CODPROVDESC='#39'MG30'#39')'
      'AND    H.IDPESSJUR  = R.IDPESSOA'
      'AND    H.IDRUBRICA  = R.IDRUBRICA'
      'ORDER BY H.MES DESC, H.CODPROVDESC '
      ' ')
    UpdateObject = updRubSalarial
    PictureMasks.Strings = (
      'MES'#9'####/##'#9'T'#9'F')
    ValidateWithMask = True
    Left = 48
    Top = 400
    ParamData = <
      item
        DataType = ftInteger
        Name = 'IDPESSJUR'
        ParamType = ptUnknown
        Value = 1
      end
      item
        DataType = ftInteger
        Name = 'IDPESSOA'
        ParamType = ptUnknown
        Value = 76644
      end>
  end
  object qryProvDesc: TwwQuery
    DatabaseName = 'BaseDados'
    SQL.Strings = (
      'SELECT RP.IDRUBRICA,RP.CODPROVDESC,RP.DESCRPROVDESC,'
      '       P.FLGCOMPOESALPART,  P.FLGCOMPOESALBENEF, P.FLGIRRF,'
      '       P.FLGCOMPOEREMTOTAL,  '
      
        '       P.FLGSALBENEFRETRO,  P.FLGSALPARTATUARIA, P.FLGSALPARTRET' +
        'RO'
      'FROM   RUBRICAXPESS RP, PROVDESC P'
      'WHERE  RP.IDPESSOA    = :IDPESSJUR'
      'AND    RP.IDRUBRICA   = P.IDPROVENTO'
      'AND    P.FLGTPRUBRICA LIKE '#39'%P%'#39
      'ORDER  BY RP.DESCRPROVDESC'
      ' ')
    ValidateWithMask = True
    Left = 392
    Top = 333
    ParamData = <
      item
        DataType = ftInteger
        Name = 'IDPESSJUR'
        ParamType = ptUnknown
      end>
  end
  object qryModoFuncao: TwwQuery
    DatabaseName = 'BaseDados'
    SQL.Strings = (
      
        'SELECT 1 AS ORDEM, '#39'EF'#39' AS CODIGO, '#39'EFETIVA'#39'                AS D' +
        'ESCRICAO FROM DUAL UNION'
      
        'SELECT 2 AS ORDEM, '#39'NE'#39' AS CODIGO, '#39'NÃO EFETIVA'#39'            AS D' +
        'ESCRICAO FROM DUAL UNION'
      
        'SELECT 3 AS ORDEM, '#39'AS'#39' AS CODIGO, '#39'ASSEGURADA'#39'             AS D' +
        'ESCRICAO FROM DUAL UNION'
      
        'SELECT 4 AS ORDEM, '#39'ES'#39' AS CODIGO, '#39'EVENTUAL/SUBSTITUIÇÃO'#39'  AS D' +
        'ESCRICAO FROM DUAL UNION'
      
        'SELECT 5 AS ORDEM, '#39'DP'#39' AS CODIGO, '#39'DESIGNAÇÃO POR PRAZO'#39'   AS D' +
        'ESCRICAO FROM DUAL UNION'
      
        'SELECT 6 AS ORDEM, '#39'FA'#39' AS CODIGO, '#39'FACULTATIVA'#39'            AS D' +
        'ESCRICAO FROM DUAL UNION'
      
        'SELECT 7 AS ORDEM, '#39'BF'#39' AS CODIGO, '#39'BOLSA DE FUNÇÃO'#39'        AS D' +
        'ESCRICAO FROM DUAL UNION'
      
        'SELECT 8 AS ORDEM, '#39'ET'#39' AS CODIGO, '#39'ESTRATÉGICA'#39'            AS D' +
        'ESCRICAO FROM DUAL UNION'
      
        'SELECT 9 AS ORDEM, '#39'DJ'#39' AS CODIGO, '#39'DECISÃO JUDICIAL'#39'       AS D' +
        'ESCRICAO FROM DUAL ')
    ValidateWithMask = True
    Left = 72
    Top = 336
  end
  object qryModoCargo: TwwQuery
    DatabaseName = 'BaseDados'
    SQL.Strings = (
      'SELECT '#39'EF'#39' AS CODIGO, '#39'EFETIVO'#39' AS DESCRICAO'
      'FROM DUAL'
      'UNION'
      'SELECT '#39'BC'#39' AS CODIGO, '#39'BOLSA DE CARGO'#39' AS DESCRICAO'
      'FROM DUAL '
      'UNION'
      'SELECT '#39'DJ'#39' AS CODIGO, '#39'DECISÃO JUDICIAL'#39' AS DESCRICAO'
      'FROM DUAL '
      ''
      ''
      ' ')
    ValidateWithMask = True
    Left = 160
    Top = 320
  end
  object dsAdicCompens: TwwDataSource
    AutoEdit = False
    DataSet = qryAdicCompens
    Left = 224
    Top = 432
  end
  object updAdicCompens: TUpdateSQL
    ModifySQL.Strings = (
      'update EVOLFUNCPREV'
      'set'
      '  IDPESSOA = :IDPESSOA,'
      '  IDPESSJUR = :IDPESSJUR,'
      '  SEQHISTFUNC = :SEQHISTFUNC,'
      '  IDCARGOEXT = :IDCARGOEXT,'
      '  IDFUNCAO = :IDFUNCAO,'
      '  IDPESSJURCG = :IDPESSJURCG,'
      '  IDPESSJURFG = :IDPESSJURFG,'
      '  PERC1AC = :PERC1AC,'
      '  PERC2AC = :PERC2AC,'
      '  PERCATS = :PERCATS,'
      '  PERCINSALUB = :PERCINSALUB,'
      '  PERCPERICUL = :PERCPERICUL,'
      '  PERCFUNCAO = :PERCFUNCAO,'
      '  MODOFUNCAO = :MODOFUNCAO,'
      '  DATAINICIO = :DATAINICIO,'
      '  DATAFINAL = :DATAFINAL,'
      '  ORIGEM = :ORIGEM,'
      '  FLGSITPART = :FLGSITPART'
      'where'
      '  IDPESSOA = :OLD_IDPESSOA and'
      '  IDPESSJUR = :OLD_IDPESSJUR and'
      '  SEQHISTFUNC = :OLD_SEQHISTFUNC'
      ' ')
    InsertSQL.Strings = (
      'insert into EVOLFUNCPREV'
      
        '  (IDPESSOA, IDPESSJUR, SEQHISTFUNC, IDCARGOEXT, IDFUNCAO, IDPES' +
        'SJURCG, '
      
        '   IDPESSJURFG, PERC1AC, PERC2AC, PERCATS, PERCINSALUB, PERCPERI' +
        'CUL, PERCFUNCAO, '
      '   MODOFUNCAO, DATAINICIO, DATAFINAL, ORIGEM, FLGSITPART)'
      'values'
      
        '  (:IDPESSOA, :IDPESSJUR, :SEQHISTFUNC, :IDCARGOEXT, :IDFUNCAO, ' +
        ':IDPESSJURCG,'
      
        '   :IDPESSJURFG, :PERC1AC, :PERC2AC, :PERCATS, :PERCINSALUB, :PE' +
        'RCPERICUL,'
      
        '   :PERCFUNCAO, :MODOFUNCAO, :DATAINICIO, :DATAFINAL, :ORIGEM, :' +
        'FLGSITPART)'
      ' ')
    DeleteSQL.Strings = (
      'delete from EVOLFUNCPREV'
      'where'
      '  IDPESSOA = :OLD_IDPESSOA and'
      '  IDPESSJUR = :OLD_IDPESSJUR and'
      '  SEQHISTFUNC = :OLD_SEQHISTFUNC')
    Left = 224
    Top = 416
  end
  object qryAdicCompens: TwwQuery
    CachedUpdates = True
    BeforePost = qryAdicCompensBeforePost
    OnCalcFields = qryAdicCompensCalcFields
    DatabaseName = 'BaseDados'
    SQL.Strings = (
      'SELECT'
      '  E.IDPESSJUR,       E.IDPESSOA,       E.SEQHISTFUNC,'
      '  E.IDPESSJURCG,     E.IDCARGOEXT,'
      '  E.IDPESSJURFG,     E.IDFUNCAO,'
      '  E.DATAINICIO,      E.DATAFINAL,'
      '  E.PERC1AC,         E.PERC2AC,'
      '  E.PERCATS,         E.PERCINSALUB,'
      '  E.PERCPERICUL,     E.PERCFUNCAO,'
      '  E.MODOFUNCAO,'
      '  E.ORIGEM,'
      '  E.FLGSITPART,'
      ''
      '  DECODE(E.ORIGEM, '#39'I'#39', '#39'Interface'#39','
      '                   '#39'C'#39', '#39'Cadastrado'#39','
      '                   '#39'E'#39', '#39'Evento de Manutenção'#39','
      '                   '#39'R'#39', '#39'Retroativo'#39
      '        ) AS DESCORIGEM,'
      ''
      '  DECODE(E.MODOFUNCAO, '#39'EF'#39', '#39'EFETIVA'#39','
      '                       '#39'AS'#39', '#39'ASSEGURADA'#39','
      '                       '#39'ES'#39', '#39'EVENTUAL/SUBSTITUIÇÃO'#39','
      '                       '#39'DP'#39', '#39'DESIGNAÇÃO POR PRAZO'#39','
      '                       '#39'FA'#39', '#39'FACULTATIVA'#39','
      '                       '#39'BF'#39', '#39'BOLSA DE FUNÇÃO'#39','
      '                       '#39'ET'#39', '#39'ESTRATÉGICA'#39','
      '                       '#39'NE'#39', '#39'NÃO EFETIVA'#39','
      '                       '#39'NÃO INFORMADO'#39
      '        ) AS DESCMODO,'
      ''
      '  DECODE(E.FLGSITPART, '#39'AS'#39', '#39'Assistido'#39','
      '                       '#39'AT'#39', '#39'Ativo'#39','
      '                       '#39'Outros'#39
      '        ) AS DESCSITCADASTRADA,'
      ''
      '  F.CODIGO,'
      '  F.TITULO AS FUNCAO,'
      '  GF.CODIGO AS GRUPO'
      ''
      'FROM'
      '  CARGOEXT      F,'
      '  EVOLFUNCPREV  E,'
      '  GRUPOCARGOEXT GCE,'
      '  GRUPOFUNC     GF'
      ''
      'WHERE'
      '      E.IDPESSJUR       = :IDPESSJUR'
      '  AND E.IDPESSOA        = :IDPESSOA'
      '  AND E.IDPESSJURFG     = F.IDPESSJUR(+)'
      '  AND E.IDFUNCAO        = F.IDCARGOEXT(+)'
      '  AND GCE.IDCARGOEXT(+) = E.IDFUNCAO'
      '  AND GF.IDGRUPOFUNC(+) = GCE.IDGRUPOFUNC'
      ''
      '  AND GCE.DATAVIGENCIA  = ('
      '                          SELECT'
      '                            MAX(G.DATAVIGENCIA)'
      '                          FROM'
      '                            GRUPOCARGOEXT G'
      '                          WHERE'
      '                                G.IDPESSJUR   = E.IDPESSJUR'
      '                            AND G.IDCARGOEXT  = E.IDFUNCAO'
      '                          )'
      ''
      '  AND E.PERC1AC IS NOT NULL'
      '  AND E.PERC1AC > 0'
      ''
      'ORDER BY'
      '  E.DATAINICIO DESC')
    UpdateObject = updAdicCompens
    ControlType.Strings = (
      'FLGSITPART;CustomEdit;dbcSituacao')
    ValidateWithMask = True
    Left = 224
    Top = 400
    ParamData = <
      item
        DataType = ftInteger
        Name = 'IDPESSJUR'
        ParamType = ptUnknown
        Value = 1
      end
      item
        DataType = ftInteger
        Name = 'IDPESSOA'
        ParamType = ptUnknown
        Value = 76644
      end>
    object qryAdicCompensCODIGO: TStringField
      DisplayLabel = 'Código'
      DisplayWidth = 15
      FieldName = 'CODIGO'
      Size = 15
    end
    object qryAdicCompensGRUPO: TStringField
      DisplayLabel = 'Grupo'
      DisplayWidth = 15
      FieldName = 'GRUPO'
      FixedChar = True
      Size = 15
    end
    object qryAdicCompensFUNCAO: TStringField
      DisplayLabel = 'Função Base'
      DisplayWidth = 40
      FieldName = 'FUNCAO'
      Size = 40
    end
    object qryAdicCompensDATAINICIO: TDateTimeField
      DisplayLabel = 'Data de ~Início'
      DisplayWidth = 12
      FieldName = 'DATAINICIO'
    end
    object qryAdicCompensDATAFINAL: TDateTimeField
      DisplayLabel = 'Data de ~Término'
      DisplayWidth = 12
      FieldName = 'DATAFINAL'
    end
    object qryAdicCompensPERC1AC: TFloatField
      DisplayLabel = 'Percentual (%)'
      DisplayWidth = 10
      FieldName = 'PERC1AC'
    end
    object qryAdicCompensDESCORIGEM: TStringField
      DisplayLabel = 'Origem'
      DisplayWidth = 23
      FieldName = 'DESCORIGEM'
    end
    object qryAdicCompensDESCSITCADASTRADA: TStringField
      DisplayLabel = 'Situação ~Cadastrada'
      DisplayWidth = 10
      FieldName = 'DESCSITCADASTRADA'
      Size = 9
    end
    object qryAdicCompensDESCSIT: TStringField
      DisplayLabel = 'Situação na ~Época'
      DisplayWidth = 10
      FieldKind = fkCalculated
      FieldName = 'DESCSIT'
      Calculated = True
    end
    object qryAdicCompensFLGSITPART: TStringField
      DisplayLabel = 'Situação'
      DisplayWidth = 24
      FieldName = 'FLGSITPART'
      Visible = False
      FixedChar = True
      Size = 2
    end
    object qryAdicCompensIDPESSJUR: TFloatField
      FieldName = 'IDPESSJUR'
      Visible = False
    end
    object qryAdicCompensIDPESSOA: TFloatField
      FieldName = 'IDPESSOA'
      Visible = False
    end
    object qryAdicCompensSEQHISTFUNC: TFloatField
      FieldName = 'SEQHISTFUNC'
      Visible = False
    end
    object qryAdicCompensIDPESSJURCG: TFloatField
      FieldName = 'IDPESSJURCG'
      Visible = False
    end
    object qryAdicCompensIDCARGOEXT: TFloatField
      FieldName = 'IDCARGOEXT'
      Visible = False
    end
    object qryAdicCompensIDPESSJURFG: TFloatField
      FieldName = 'IDPESSJURFG'
      Visible = False
    end
    object qryAdicCompensIDFUNCAO: TFloatField
      FieldName = 'IDFUNCAO'
      Visible = False
    end
    object qryAdicCompensPERC2AC: TFloatField
      FieldName = 'PERC2AC'
      Visible = False
    end
    object qryAdicCompensPERCATS: TFloatField
      FieldName = 'PERCATS'
      Visible = False
    end
    object qryAdicCompensPERCINSALUB: TFloatField
      FieldName = 'PERCINSALUB'
      Visible = False
    end
    object qryAdicCompensPERCPERICUL: TFloatField
      FieldName = 'PERCPERICUL'
      Visible = False
    end
    object qryAdicCompensPERCFUNCAO: TFloatField
      FieldName = 'PERCFUNCAO'
      Visible = False
    end
    object qryAdicCompensMODOFUNCAO: TStringField
      FieldName = 'MODOFUNCAO'
      Visible = False
      FixedChar = True
      Size = 2
    end
    object qryAdicCompensORIGEM: TStringField
      FieldName = 'ORIGEM'
      Visible = False
      FixedChar = True
      Size = 1
    end
    object qryAdicCompensDESCMODO: TStringField
      FieldName = 'DESCMODO'
      Visible = False
      Size = 21
    end
    object qryAdicCompensSIT: TStringField
      FieldKind = fkCalculated
      FieldName = 'SIT'
      Visible = False
      Calculated = True
    end
  end
  object dsAdicInsalub: TwwDataSource
    AutoEdit = False
    DataSet = qryAdicInsalub
    Left = 392
    Top = 432
  end
  object updAdicInsalub: TUpdateSQL
    ModifySQL.Strings = (
      'update EVOLFUNCPREV'
      'set'
      '  IDPESSOA = :IDPESSOA,'
      '  IDPESSJUR = :IDPESSJUR,'
      '  SEQHISTFUNC = :SEQHISTFUNC,'
      '  IDCARGOEXT = :IDCARGOEXT,'
      '  IDFUNCAO = :IDFUNCAO,'
      '  IDPESSJURCG = :IDPESSJURCG,'
      '  IDPESSJURFG = :IDPESSJURFG,'
      '  PERC1AC = :PERC1AC,'
      '  PERC2AC = :PERC2AC,'
      '  PERCATS = :PERCATS,'
      '  PERCINSALUB = :PERCINSALUB,'
      '  PERCPERICUL = :PERCPERICUL,'
      '  PERCFUNCAO = :PERCFUNCAO,'
      '  MODOFUNCAO = :MODOFUNCAO,'
      '  DATAINICIO = :DATAINICIO,'
      '  DATAFINAL = :DATAFINAL,'
      '  ORIGEM = :ORIGEM,'
      '  FLGSITPART = :FLGSITPART'
      'where'
      '  IDPESSOA = :OLD_IDPESSOA and'
      '  IDPESSJUR = :OLD_IDPESSJUR and'
      '  SEQHISTFUNC = :OLD_SEQHISTFUNC'
      ' ')
    InsertSQL.Strings = (
      'insert into EVOLFUNCPREV'
      
        '  (IDPESSOA, IDPESSJUR, SEQHISTFUNC, IDCARGOEXT, IDFUNCAO, IDPES' +
        'SJURCG, '
      
        '   IDPESSJURFG, PERC1AC, PERC2AC, PERCATS, PERCINSALUB, PERCPERI' +
        'CUL, PERCFUNCAO, '
      '   MODOFUNCAO, DATAINICIO, DATAFINAL, ORIGEM, FLGSITPART)'
      'values'
      
        '  (:IDPESSOA, :IDPESSJUR, :SEQHISTFUNC, :IDCARGOEXT, :IDFUNCAO, ' +
        ':IDPESSJURCG,'
      
        '   :IDPESSJURFG, :PERC1AC, :PERC2AC, :PERCATS, :PERCINSALUB, :PE' +
        'RCPERICUL,'
      
        '   :PERCFUNCAO, :MODOFUNCAO, :DATAINICIO, :DATAFINAL, :ORIGEM, :' +
        'FLGSITPART)'
      ' ')
    DeleteSQL.Strings = (
      'delete from EVOLFUNCPREV'
      'where'
      '  IDPESSOA = :OLD_IDPESSOA and'
      '  IDPESSJUR = :OLD_IDPESSJUR and'
      '  SEQHISTFUNC = :OLD_SEQHISTFUNC')
    Left = 392
    Top = 416
  end
  object qryAdicInsalub: TwwQuery
    CachedUpdates = True
    BeforePost = qryAdicInsalubBeforePost
    OnCalcFields = qryAdicInsalubCalcFields
    DatabaseName = 'BaseDados'
    SQL.Strings = (
      'SELECT E.IDPESSJUR,       E.IDPESSOA,       E.SEQHISTFUNC,'
      '       E.IDPESSJURCG,     E.IDCARGOEXT,'
      '       E.IDPESSJURFG,     E.IDFUNCAO,'
      '       E.DATAINICIO,      E.DATAFINAL,'
      '       E.PERC1AC,         E.PERC2AC,'
      '       E.PERCATS,         E.PERCINSALUB,'
      '       E.PERCPERICUL,     E.PERCFUNCAO,'
      '       E.MODOFUNCAO,'
      '       E.ORIGEM,'
      '       E.FLGSITPART,'
      '       DECODE(E.ORIGEM, '#39'I'#39', '#39'Interface'#39','
      '                        '#39'C'#39', '#39'Cadastrado'#39','
      '                        '#39'E'#39', '#39'Evento de Manutenção'#39','
      '                        '#39'R'#39', '#39'Retroativo'#39') AS DESCORIGEM,'
      '       DECODE(E.FLGSITPART,'#39'AS'#39', '#39'Assistido'#39','
      '                           '#39'AT'#39', '#39'Ativo'#39','
      '                                 '#39'Outros'#39') AS DESCSITCADASTRADA'
      ''
      'FROM   EVOLFUNCPREV E'
      'WHERE  E.IDPESSJUR      = :IDPESSJUR'
      'AND    E.IDPESSOA       = :IDPESSOA'
      'AND    PERCINSALUB IS NOT NULL'
      'AND    PERCINSALUB > 0'
      'ORDER BY E.DATAINICIO DESC '
      ''
      ' '
      ' '
      ' '
      ' '
      ' '
      ' ')
    UpdateObject = updAdicInsalub
    ControlType.Strings = (
      'FLGSITPART;CustomEdit;dbcSituacao')
    ValidateWithMask = True
    Left = 392
    Top = 400
    ParamData = <
      item
        DataType = ftInteger
        Name = 'IDPESSJUR'
        ParamType = ptUnknown
        Value = 1
      end
      item
        DataType = ftInteger
        Name = 'IDPESSOA'
        ParamType = ptUnknown
        Value = 76644
      end>
    object qryAdicInsalubDATAINICIO: TDateTimeField
      DisplayLabel = 'Data de ~Início'
      DisplayWidth = 15
      FieldName = 'DATAINICIO'
    end
    object qryAdicInsalubDATAFINAL: TDateTimeField
      DisplayLabel = 'Data de ~Término'
      DisplayWidth = 15
      FieldName = 'DATAFINAL'
    end
    object qryAdicInsalubPERCINSALUB: TFloatField
      DisplayLabel = 'Percentual (%)'
      DisplayWidth = 20
      FieldName = 'PERCINSALUB'
    end
    object qryAdicInsalubDESCORIGEM: TStringField
      DisplayLabel = 'Origem'
      DisplayWidth = 30
      FieldName = 'DESCORIGEM'
    end
    object qryAdicInsalubDESCSITCADASTRADA: TStringField
      DisplayLabel = 'Situação ~Cadastrada'
      DisplayWidth = 10
      FieldName = 'DESCSITCADASTRADA'
      Size = 9
    end
    object qryAdicInsalubDESCSIT: TStringField
      DisplayLabel = 'Situação na ~época'
      DisplayWidth = 10
      FieldKind = fkCalculated
      FieldName = 'DESCSIT'
      Calculated = True
    end
    object qryAdicInsalubFLGSITPART: TStringField
      DisplayLabel = 'Situação'
      DisplayWidth = 24
      FieldName = 'FLGSITPART'
      Visible = False
      FixedChar = True
      Size = 2
    end
    object qryAdicInsalubIDPESSJUR: TFloatField
      FieldName = 'IDPESSJUR'
      Visible = False
    end
    object qryAdicInsalubIDPESSOA: TFloatField
      FieldName = 'IDPESSOA'
      Visible = False
    end
    object qryAdicInsalubSEQHISTFUNC: TFloatField
      FieldName = 'SEQHISTFUNC'
      Visible = False
    end
    object qryAdicInsalubIDPESSJURCG: TFloatField
      FieldName = 'IDPESSJURCG'
      Visible = False
    end
    object qryAdicInsalubIDCARGOEXT: TFloatField
      FieldName = 'IDCARGOEXT'
      Visible = False
    end
    object qryAdicInsalubIDPESSJURFG: TFloatField
      FieldName = 'IDPESSJURFG'
      Visible = False
    end
    object qryAdicInsalubIDFUNCAO: TFloatField
      FieldName = 'IDFUNCAO'
      Visible = False
    end
    object qryAdicInsalubPERC1AC: TFloatField
      FieldName = 'PERC1AC'
      Visible = False
    end
    object qryAdicInsalubPERC2AC: TFloatField
      FieldName = 'PERC2AC'
      Visible = False
    end
    object qryAdicInsalubPERCATS: TFloatField
      FieldName = 'PERCATS'
      Visible = False
    end
    object qryAdicInsalubPERCPERICUL: TFloatField
      FieldName = 'PERCPERICUL'
      Visible = False
    end
    object qryAdicInsalubPERCFUNCAO: TFloatField
      FieldName = 'PERCFUNCAO'
      Visible = False
    end
    object qryAdicInsalubMODOFUNCAO: TStringField
      FieldName = 'MODOFUNCAO'
      Visible = False
      FixedChar = True
      Size = 2
    end
    object qryAdicInsalubORIGEM: TStringField
      FieldName = 'ORIGEM'
      Visible = False
      FixedChar = True
      Size = 1
    end
    object qryAdicInsalubSIT: TStringField
      FieldKind = fkCalculated
      FieldName = 'SIT'
      Visible = False
      Calculated = True
    end
  end
  object dsAdicPericul: TwwDataSource
    AutoEdit = False
    DataSet = qryAdicPericul
    Left = 312
    Top = 432
  end
  object updAdicPericul: TUpdateSQL
    ModifySQL.Strings = (
      'update EVOLFUNCPREV'
      'set'
      '  IDPESSJUR = :IDPESSJUR,'
      '  IDPESSOA = :IDPESSOA,'
      '  SEQHISTFUNC = :SEQHISTFUNC,'
      '  IDPESSJURCG = :IDPESSJURCG,'
      '  IDCARGOEXT = :IDCARGOEXT,'
      '  IDPESSJURFG = :IDPESSJURFG,'
      '  IDFUNCAO = :IDFUNCAO,'
      '  DATAINICIO = :DATAINICIO,'
      '  DATAFINAL = :DATAFINAL,'
      '  PERC1AC = :PERC1AC,'
      '  PERC2AC = :PERC2AC,'
      '  PERCATS = :PERCATS,'
      '  PERCINSALUB = :PERCINSALUB,'
      '  PERCPERICUL = :PERCPERICUL,'
      '  PERCFUNCAO = :PERCFUNCAO,'
      '  MODOFUNCAO = :MODOFUNCAO,'
      '  ORIGEM = :ORIGEM,'
      '  FLGSITPART = :FLGSITPART'
      'where'
      '  IDPESSJUR = :OLD_IDPESSJUR and'
      '  IDPESSOA = :OLD_IDPESSOA and'
      '  SEQHISTFUNC = :OLD_SEQHISTFUNC'
      ' ')
    InsertSQL.Strings = (
      'insert into EVOLFUNCPREV'
      
        '  (IDPESSJUR, IDPESSOA, SEQHISTFUNC, IDPESSJURCG, IDCARGOEXT, ID' +
        'PESSJURFG, '
      
        '   IDFUNCAO, DATAINICIO, DATAFINAL, PERC1AC, PERC2AC, PERCATS, P' +
        'ERCINSALUB, '
      '   PERCPERICUL, PERCFUNCAO, MODOFUNCAO, ORIGEM, FLGSITPART)'
      'values'
      
        '  (:IDPESSJUR, :IDPESSOA, :SEQHISTFUNC, :IDPESSJURCG, :IDCARGOEX' +
        'T, :IDPESSJURFG,'
      
        '   :IDFUNCAO, :DATAINICIO, :DATAFINAL, :PERC1AC, :PERC2AC, :PERC' +
        'ATS, :PERCINSALUB,'
      '   :PERCPERICUL, :PERCFUNCAO, :MODOFUNCAO, :ORIGEM, :FLGSITPART)'
      ' ')
    DeleteSQL.Strings = (
      'delete from EVOLFUNCPREV'
      'where'
      '  IDPESSJUR = :OLD_IDPESSJUR and'
      '  IDPESSOA = :OLD_IDPESSOA and'
      '  SEQHISTFUNC = :OLD_SEQHISTFUNC')
    Left = 312
    Top = 416
  end
  object qryAdicPericul: TwwQuery
    CachedUpdates = True
    BeforePost = qryAdicPericulBeforePost
    OnCalcFields = qryAdicPericulCalcFields
    DatabaseName = 'BaseDados'
    SQL.Strings = (
      'SELECT E.IDPESSJUR,       E.IDPESSOA,       E.SEQHISTFUNC,'
      '       E.IDPESSJURCG,     E.IDCARGOEXT,'
      '       E.IDPESSJURFG,     E.IDFUNCAO,'
      '       E.DATAINICIO,      E.DATAFINAL,'
      '       E.PERC1AC,         E.PERC2AC,'
      '       E.PERCATS,         E.PERCINSALUB,'
      '       E.PERCPERICUL,     E.PERCFUNCAO,'
      '       E.MODOFUNCAO,'
      '       E.ORIGEM,'
      '       E.FLGSITPART,'
      '       DECODE(E.ORIGEM, '#39'I'#39', '#39'Interface'#39','
      '                        '#39'C'#39', '#39'Cadastrado'#39','
      '                        '#39'E'#39', '#39'Evento de Manutenção'#39','
      '                        '#39'R'#39', '#39'Retroativo'#39') AS DESCORIGEM,'
      '       DECODE(E.FLGSITPART,'#39'AS'#39', '#39'Assistido'#39','
      '                           '#39'AT'#39', '#39'Ativo'#39','
      '                                 '#39'Outros'#39') AS DESCSITCADASTRADA'
      'FROM   EVOLFUNCPREV E'
      'WHERE  E.IDPESSJUR      = :IDPESSJUR'
      'AND    E.IDPESSOA       = :IDPESSOA'
      'AND    PERCPERICUL IS NOT NULL'
      'AND    PERCPERICUL > 0'
      'ORDER BY E.DATAINICIO DESC '
      ''
      ' '
      ' '
      ' '
      ' '
      ' '
      ' '
      ' ')
    UpdateObject = updAdicPericul
    ControlType.Strings = (
      'FLGSITPART;CustomEdit;dbcSituacao')
    ValidateWithMask = True
    Left = 312
    Top = 400
    ParamData = <
      item
        DataType = ftInteger
        Name = 'IDPESSJUR'
        ParamType = ptUnknown
        Value = 1
      end
      item
        DataType = ftInteger
        Name = 'IDPESSOA'
        ParamType = ptUnknown
        Value = 76644
      end>
    object qryAdicPericulDATAINICIO: TDateTimeField
      DisplayLabel = 'Data de ~Início'
      DisplayWidth = 15
      FieldName = 'DATAINICIO'
    end
    object qryAdicPericulDATAFINAL: TDateTimeField
      DisplayLabel = 'Data de ~Término'
      DisplayWidth = 15
      FieldName = 'DATAFINAL'
    end
    object qryAdicPericulPERCPERICUL: TFloatField
      DisplayLabel = 'Percentual (%)'
      DisplayWidth = 20
      FieldName = 'PERCPERICUL'
    end
    object qryAdicPericulDESCORIGEM: TStringField
      DisplayLabel = 'Origem'
      DisplayWidth = 30
      FieldName = 'DESCORIGEM'
    end
    object qryAdicPericulDESCSITCADASTRADA: TStringField
      DisplayLabel = 'Situação ~Cadastrada'
      DisplayWidth = 10
      FieldName = 'DESCSITCADASTRADA'
      Size = 9
    end
    object qryAdicPericulDESCSIT: TStringField
      DisplayLabel = 'Situação na ~Época'
      DisplayWidth = 20
      FieldKind = fkCalculated
      FieldName = 'DESCSIT'
      Calculated = True
    end
    object qryAdicPericulFLGSITPART: TStringField
      DisplayLabel = 'Situação'
      DisplayWidth = 24
      FieldName = 'FLGSITPART'
      Visible = False
      FixedChar = True
      Size = 2
    end
    object qryAdicPericulIDPESSJUR: TFloatField
      FieldName = 'IDPESSJUR'
      Visible = False
    end
    object qryAdicPericulIDPESSOA: TFloatField
      FieldName = 'IDPESSOA'
      Visible = False
    end
    object qryAdicPericulSEQHISTFUNC: TFloatField
      FieldName = 'SEQHISTFUNC'
      Visible = False
    end
    object qryAdicPericulIDPESSJURCG: TFloatField
      FieldName = 'IDPESSJURCG'
      Visible = False
    end
    object qryAdicPericulIDCARGOEXT: TFloatField
      FieldName = 'IDCARGOEXT'
      Visible = False
    end
    object qryAdicPericulIDPESSJURFG: TFloatField
      FieldName = 'IDPESSJURFG'
      Visible = False
    end
    object qryAdicPericulIDFUNCAO: TFloatField
      FieldName = 'IDFUNCAO'
      Visible = False
    end
    object qryAdicPericulPERC1AC: TFloatField
      FieldName = 'PERC1AC'
      Visible = False
    end
    object qryAdicPericulPERC2AC: TFloatField
      FieldName = 'PERC2AC'
      Visible = False
    end
    object qryAdicPericulPERCATS: TFloatField
      FieldName = 'PERCATS'
      Visible = False
    end
    object qryAdicPericulPERCINSALUB: TFloatField
      FieldName = 'PERCINSALUB'
      Visible = False
    end
    object qryAdicPericulPERCFUNCAO: TFloatField
      FieldName = 'PERCFUNCAO'
      Visible = False
    end
    object qryAdicPericulMODOFUNCAO: TStringField
      FieldName = 'MODOFUNCAO'
      Visible = False
      FixedChar = True
      Size = 2
    end
    object qryAdicPericulORIGEM: TStringField
      FieldName = 'ORIGEM'
      Visible = False
      FixedChar = True
      Size = 1
    end
    object qryAdicPericulSIT: TStringField
      FieldKind = fkCalculated
      FieldName = 'SIT'
      Visible = False
      Calculated = True
    end
  end
  object dsAdicNoturno: TwwDataSource
    AutoEdit = False
    DataSet = qryAdicNoturno
    Left = 136
    Top = 432
  end
  object updAdicNoturno: TUpdateSQL
    ModifySQL.Strings = (
      'update EVOLFUNCPREV'
      'set'
      '  IDPESSOA = :IDPESSOA,'
      '  IDPESSJUR = :IDPESSJUR,'
      '  SEQHISTFUNC = :SEQHISTFUNC,'
      '  IDCARGOEXT = :IDCARGOEXT,'
      '  IDFUNCAO = :IDFUNCAO,'
      '  IDPESSJURCG = :IDPESSJURCG,'
      '  IDPESSJURFG = :IDPESSJURFG,'
      '  PERC1AC = :PERC1AC,'
      '  PERC2AC = :PERC2AC,'
      '  PERCATS = :PERCATS,'
      '  PERCINSALUB = :PERCINSALUB,'
      '  PERCPERICUL = :PERCPERICUL,'
      '  PERCFUNCAO = :PERCFUNCAO,'
      '  MODOFUNCAO = :MODOFUNCAO,'
      '  DATAINICIO = :DATAINICIO,'
      '  DATAFINAL = :DATAFINAL,'
      '  ORIGEM = :ORIGEM,'
      '  PERCADNOT = :PERCADNOT,'
      '  QTDEMINUTOS = :QTDEMINUTOS,'
      '  FLGSITPART = :FLGSITPART,'
      '  QTDIAS = :QTDIAS,'
      '  DESCRICAO = :DESCRICAO,'
      '  MODO = :MODO'
      'where'
      '  IDPESSOA = :OLD_IDPESSOA and'
      '  IDPESSJUR = :OLD_IDPESSJUR and'
      '  SEQHISTFUNC = :OLD_SEQHISTFUNC'
      ' ')
    InsertSQL.Strings = (
      'insert into EVOLFUNCPREV'
      
        '  (IDPESSOA, IDPESSJUR, SEQHISTFUNC, IDCARGOEXT, IDFUNCAO, IDPES' +
        'SJURCG, '
      
        '   IDPESSJURFG, PERC1AC, PERC2AC, PERCATS, PERCINSALUB, PERCPERI' +
        'CUL, '
      
        '   PERCFUNCAO, MODOFUNCAO, DATAINICIO, DATAFINAL, ORIGEM, PERCAD' +
        'NOT, '
      '   QTDEMINUTOS, FLGSITPART, QTDIAS, DESCRICAO, MODO)'
      'values'
      
        '  (:IDPESSOA, :IDPESSJUR, :SEQHISTFUNC, :IDCARGOEXT, :IDFUNCAO, ' +
        ':IDPESSJURCG,'
      
        '   :IDPESSJURFG, :PERC1AC, :PERC2AC, :PERCATS, :PERCINSALUB, :PE' +
        'RCPERICUL,'
      
        '   :PERCFUNCAO, :MODOFUNCAO, :DATAINICIO, :DATAFINAL, :ORIGEM, :' +
        'PERCADNOT,'
      '   :QTDEMINUTOS, :FLGSITPART, :QTDIAS, :DESCRICAO, :MODO)'
      ' ')
    DeleteSQL.Strings = (
      'delete from EVOLFUNCPREV'
      'where'
      '  IDPESSOA = :OLD_IDPESSOA and'
      '  IDPESSJUR = :OLD_IDPESSJUR and'
      '  SEQHISTFUNC = :OLD_SEQHISTFUNC')
    Left = 136
    Top = 416
  end
  object qryAdicNoturno: TwwQuery
    CachedUpdates = True
    BeforePost = qryAdicNoturnoBeforePost
    OnCalcFields = qryAdicNoturnoCalcFields
    DatabaseName = 'BaseDados'
    SQL.Strings = (
      'SELECT E.IDPESSJUR,       E.IDPESSOA,       E.SEQHISTFUNC,'
      '       E.IDPESSJURCG,     E.IDCARGOEXT,'
      '       E.IDPESSJURFG,     E.IDFUNCAO,'
      '       E.DATAINICIO,      E.DATAFINAL,'
      '       E.QTDIAS,          E.DESCRICAO,      '
      '       E.PERC1AC,         E.PERC2AC,'
      '       E.PERCATS,         E.PERCINSALUB,'
      '       E.PERCPERICUL,     E.PERCFUNCAO,'
      '       E.PERCADNOT,       E.QTDEMINUTOS, '
      '       E.MODOFUNCAO,'
      '       (DECODE(E.MODO,   '#39'E'#39',  '#39'Efetivo'#39','
      '                         '#39'F'#39',  '#39'Facultativo'#39')) AS DESCMODO , '
      '       E.ORIGEM,'
      '       E.FLGSITPART,'
      '       DECODE(E.ORIGEM, '#39'I'#39', '#39'Interface'#39','
      '                        '#39'C'#39', '#39'Cadastrado'#39','
      '                        '#39'E'#39', '#39'Evento de Manutenção'#39','
      '                        '#39'R'#39', '#39'Retroativo'#39') AS DESCORIGEM,'
      '       (DECODE(E.FLGSITPART,'#39'AS'#39', '#39'Assistido'#39','
      '                            '#39'AT'#39', '#39'Ativo'#39','
      '                            '#39'Outros'#39')) AS DESCSITCADASTRADA ,'
      '       E.MODO'
      'FROM   EVOLFUNCPREV E'
      'WHERE  E.IDPESSJUR      = :IDPESSJUR'
      'AND    E.IDPESSOA       = :IDPESSOA'
      
        'AND    ( ( (PERCADNOT IS NOT NULL) AND      (PERCADNOT > 0) )  O' +
        'R'
      
        '         ( (QTDEMINUTOS  IS NOT NULL) AND    (QTDEMINUTOS  > 0) ' +
        ')'
      '       )'
      'ORDER BY E.DATAINICIO DESC ')
    UpdateObject = updAdicNoturno
    ControlType.Strings = (
      'FLGSITPART;CustomEdit;dbcSituacao')
    ValidateWithMask = True
    Left = 136
    Top = 408
    ParamData = <
      item
        DataType = ftInteger
        Name = 'IDPESSJUR'
        ParamType = ptUnknown
        Value = 1
      end
      item
        DataType = ftInteger
        Name = 'IDPESSOA'
        ParamType = ptUnknown
        Value = 76644
      end>
    object qryAdicNoturnoDATAINICIO: TDateTimeField
      DisplayLabel = 'Data de ~Início'
      DisplayWidth = 15
      FieldName = 'DATAINICIO'
    end
    object qryAdicNoturnoDATAFINAL: TDateTimeField
      DisplayLabel = 'Data de ~Término'
      DisplayWidth = 15
      FieldName = 'DATAFINAL'
    end
    object qryAdicNoturnoQTDIAS: TFloatField
      DisplayLabel = 'Dias'
      DisplayWidth = 5
      FieldName = 'QTDIAS'
      ProviderFlags = [pfInUpdate]
    end
    object qryAdicNoturnoDESCRICAO: TStringField
      DisplayLabel = 'Descrição'
      DisplayWidth = 10
      FieldName = 'DESCRICAO'
      FixedChar = True
      Size = 6
    end
    object qryAdicNoturnoQTDEMINUTOS: TFloatField
      DisplayLabel = 'Qtde. Minutos'
      DisplayWidth = 10
      FieldName = 'QTDEMINUTOS'
    end
    object qryAdicNoturnoPERCADNOT: TFloatField
      DisplayLabel = 'Percentual (%)'
      DisplayWidth = 10
      FieldName = 'PERCADNOT'
    end
    object qryAdicNoturnoDESCMODO: TStringField
      DisplayLabel = 'Modo'
      DisplayWidth = 11
      FieldName = 'DESCMODO'
      Size = 11
    end
    object qryAdicNoturnoDESCORIGEM: TStringField
      DisplayLabel = 'Origem'
      DisplayWidth = 30
      FieldName = 'DESCORIGEM'
    end
    object qryAdicNoturnoDESCSITCADASTRADA: TStringField
      DisplayLabel = 'Situação ~Cadastrada'
      DisplayWidth = 10
      FieldName = 'DESCSITCADASTRADA'
      Size = 9
    end
    object qryAdicNoturnoDESCSIT: TStringField
      DisplayLabel = 'Situação na ~Época'
      DisplayWidth = 10
      FieldKind = fkCalculated
      FieldName = 'DESCSIT'
      Calculated = True
    end
    object qryAdicNoturnoFLGSITPART: TStringField
      DisplayLabel = 'Situação'
      DisplayWidth = 24
      FieldName = 'FLGSITPART'
      Visible = False
      FixedChar = True
      Size = 2
    end
    object qryAdicNoturnoIDPESSJUR: TFloatField
      FieldName = 'IDPESSJUR'
      Visible = False
    end
    object qryAdicNoturnoIDPESSOA: TFloatField
      FieldName = 'IDPESSOA'
      Visible = False
    end
    object qryAdicNoturnoSEQHISTFUNC: TFloatField
      FieldName = 'SEQHISTFUNC'
      Visible = False
    end
    object qryAdicNoturnoIDPESSJURCG: TFloatField
      FieldName = 'IDPESSJURCG'
      Visible = False
    end
    object qryAdicNoturnoIDCARGOEXT: TFloatField
      FieldName = 'IDCARGOEXT'
      Visible = False
    end
    object qryAdicNoturnoIDPESSJURFG: TFloatField
      FieldName = 'IDPESSJURFG'
      Visible = False
    end
    object qryAdicNoturnoIDFUNCAO: TFloatField
      FieldName = 'IDFUNCAO'
      Visible = False
    end
    object qryAdicNoturnoPERC1AC: TFloatField
      FieldName = 'PERC1AC'
      Visible = False
    end
    object qryAdicNoturnoPERC2AC: TFloatField
      FieldName = 'PERC2AC'
      Visible = False
    end
    object qryAdicNoturnoPERCATS: TFloatField
      FieldName = 'PERCATS'
      Visible = False
    end
    object qryAdicNoturnoPERCINSALUB: TFloatField
      FieldName = 'PERCINSALUB'
      Visible = False
    end
    object qryAdicNoturnoPERCPERICUL: TFloatField
      FieldName = 'PERCPERICUL'
      Visible = False
    end
    object qryAdicNoturnoPERCFUNCAO: TFloatField
      FieldName = 'PERCFUNCAO'
      Visible = False
    end
    object qryAdicNoturnoMODOFUNCAO: TStringField
      FieldName = 'MODOFUNCAO'
      Visible = False
      FixedChar = True
      Size = 2
    end
    object qryAdicNoturnoORIGEM: TStringField
      FieldName = 'ORIGEM'
      Visible = False
      FixedChar = True
      Size = 1
    end
    object qryAdicNoturnoSIT: TStringField
      FieldKind = fkCalculated
      FieldName = 'SIT'
      Visible = False
      Calculated = True
    end
    object qryAdicNoturnoMODO: TStringField
      FieldName = 'MODO'
      Visible = False
      FixedChar = True
      Size = 1
    end
  end
  object qryeventos: TwwQuery
    CachedUpdates = True
    BeforePost = qryFuncaoBeforePost
    DatabaseName = 'BaseDados'
    SQL.Strings = (
      'SELECT E.IDSITPARTNOVO, E.DATAEVENTO,'
      '       DECODE(SIT.FLGINTERNO, '#39'AT'#39', '#39'Ativo'#39','
      '                          '#39'AE'#39', '#39'Ativo Especial'#39','
      '                          '#39'MA'#39', '#39'Mantido'#39','
      '                          '#39'MP'#39', '#39'Mantido Parcial'#39','
      '                          '#39'AS'#39', '#39'Assistido'#39','
      '                          '#39'MS'#39', '#39'Manutenção de Saldo de Conta'#39','
      '                          '#39'CA'#39', '#39'Cancelado'#39','
      '                          '#39'PE'#39', '#39'Pendente'#39') AS SITUACAO,'
      '       DECODE(SIT.FLGINTERNO, '#39'AT'#39', '#39'A'#39','
      '                          '#39'AE'#39', '#39'A'#39','
      '                          '#39'MA'#39', '#39'M'#39','
      '                          '#39'MP'#39', '#39'M'#39','
      '                          '#39'AS'#39', '#39'T'#39','
      '                          '#39'MS'#39', '#39'M'#39','
      '                          '#39'CA'#39', '#39'A'#39','
      '                          '#39'PE'#39', '#39'A'#39') AS SIT'
      'FROM EVENTOSPREV E , SITPART SIT'
      'WHERE '
      'E.IDPESSJUR = :idpessjur AND'
      'E.IDPESSOA = :idpessoa AND'
      'SIT.IDSITPART = E.IDSITPARTNOVO'
      'ORDER BY  E.DATAEVENTO'
      ' ')
    ValidateWithMask = True
    Left = 368
    Top = 88
    ParamData = <
      item
        DataType = ftString
        Name = 'idpessjur'
        ParamType = ptUnknown
      end
      item
        DataType = ftString
        Name = 'idpessoa'
        ParamType = ptUnknown
      end>
  end
  object qryaux: TwwQuery
    CachedUpdates = True
    BeforePost = qryFuncaoBeforePost
    DatabaseName = 'BaseDados'
    SQL.Strings = (
      ''
      ' '
      ' '
      ' '
      ' '
      ' ')
    ValidateWithMask = True
    Left = 480
    Top = 104
  end
  object qrySitPart: TwwQuery
    CachedUpdates = True
    BeforePost = qryFuncaoBeforePost
    DatabaseName = 'BaseDados'
    SQL.Strings = (
      
        'SELECT '#39'AT'#39' AS FLGSITPART, '#39'Ativo'#39'     AS SITUACAO FROM DUAL UNI' +
        'ON'
      
        'SELECT '#39'AS'#39' AS FLGSITPART, '#39'Assistido'#39' AS SITUACAO FROM DUAL UNI' +
        'ON'
      'SELECT '#39'XX'#39' AS FLGSITPART, '#39'Outros'#39'    AS SITUACAO FROM DUAL')
    ValidateWithMask = True
    Left = 432
    Top = 104
  end
  object updSalManut: TUpdateSQL
    ModifySQL.Strings = (
      'update PARTPREVPLAN'
      'set'
      '  SALMANTIDO          = :SALMANTIDO,'
      '  SALPARTICIPACAO = :SALPARTICIPACAO'
      'where'
      '  IDPESSJUR = :OLD_IDPESSJUR and'
      '  IDPLANOPREV = :OLD_IDPLANOPREV and'
      '  IDPESSOA = :OLD_IDPESSOA and'
      '  SEQPROPOSTA = :OLD_SEQPROPOSTA')
    InsertSQL.Strings = (
      'insert into PARTPREVPLAN'
      '  (SALMANTIDO, SALPARTICIPACAO)'
      'values'
      '  (:SALMANTIDO, :SALPARTICIPACAO)')
    DeleteSQL.Strings = (
      'delete from PARTPREVPLAN'
      'where'
      '  IDPESSJUR = :OLD_IDPESSJUR and'
      '  IDPESSOA = :OLD_IDPESSOA and'
      '  IDPLANOPREV = :OLD_IDPLANOPREV and'
      '  SEQPROPOSTA = :OLD_SEQPROPOSTA')
    Left = 224
    Top = 344
  end
  object qrySalManut: TwwQuery
    CachedUpdates = True
    DatabaseName = 'BaseDados'
    SQL.Strings = (
      
        'SELECT IDPESSJUR, IDPLANOPREV, IDPESSOA, SEQPROPOSTA, SALMANTIDO' +
        ', SALPARTICIPACAO'
      'FROM   PARTPREVPLAN'
      'WHERE  IDPESSJUR = :IDPESSJUR'
      'AND    IDPLANOPREV = :IDPLANOPREV'
      'AND    IDPESSOA = :IDPESSOA'
      'AND    SEQPROPOSTA = :SEQPROPOSTA'
      ' '
      ' ')
    UpdateObject = updSalManut
    ValidateWithMask = True
    Left = 264
    Top = 304
    ParamData = <
      item
        DataType = ftInteger
        Name = 'IDPESSJUR'
        ParamType = ptUnknown
        Value = 1
      end
      item
        DataType = ftInteger
        Name = 'IDPLANOPREV'
        ParamType = ptUnknown
      end
      item
        DataType = ftInteger
        Name = 'IDPESSOA'
        ParamType = ptUnknown
        Value = 3010
      end
      item
        DataType = ftInteger
        Name = 'SEQPROPOSTA'
        ParamType = ptUnknown
      end>
  end
  object qryAdicIncorp: TwwQuery
    CachedUpdates = True
    BeforePost = qryAdicIncorpBeforePost
    OnCalcFields = qryAdicIncorpCalcFields
    DatabaseName = 'BaseDados'
    SQL.Strings = (
      'SELECT'
      '  E.IDPESSJUR,       E.IDPESSOA,       E.SEQHISTFUNC,'
      '  E.IDPESSJURCG,     E.IDCARGOEXT,'
      '  E.IDPESSJURFG,     E.IDFUNCAO,'
      '  E.DATAINICIO,      E.DATAFINAL,'
      '  E.PERC1AC,         E.PERC2AC,'
      '  E.PERCATS,         E.PERCINSALUB,'
      '  E.PERCPERICUL,     E.PERCFUNCAO,'
      '  E.MODOFUNCAO,      E.PERCINCORP,'
      '  E.ORIGEM,'
      '  E.FLGSITPART,'
      ''
      '  DECODE(E.ORIGEM, '#39'I'#39', '#39'Interface'#39','
      '                   '#39'C'#39', '#39'Cadastrado'#39','
      '                   '#39'E'#39', '#39'Evento de Manutenção'#39','
      '                   '#39'R'#39', '#39'Retroativo'#39
      '        ) AS DESCORIGEM,'
      ''
      '  DECODE(E.MODOFUNCAO, '#39'EF'#39', '#39'EFETIVA'#39','
      '                       '#39'AS'#39', '#39'ASSEGURADA'#39','
      '                       '#39'ES'#39', '#39'EVENTUAL/SUBSTITUIÇÃO'#39','
      '                       '#39'DP'#39', '#39'DESIGNAÇÃO POR PRAZO'#39','
      '                       '#39'FA'#39', '#39'FACULTATIVA'#39','
      '                       '#39'BF'#39', '#39'BOLSA DE FUNÇÃO'#39','
      '                       '#39'ET'#39', '#39'ESTRATÉGICA'#39','
      '                       '#39'NE'#39', '#39'NÃO EFETIVA'#39','
      '                       '#39'NÃO INFORMADO'#39
      '        ) AS DESCMODO,'
      ''
      '  DECODE(E.FLGSITPART, '#39'AS'#39', '#39'Assistido'#39','
      '                       '#39'AT'#39', '#39'Ativo'#39','
      '                       '#39'Outros'#39
      '        ) AS DESCSITCADASTRADA,'
      ''
      '  F.CODIGO, F.TITULO AS FUNCAO, GF.CODIGO GRUPO'
      ''
      ''
      'FROM'
      '  CARGOEXT      F,'
      '  EVOLFUNCPREV  E,'
      '  GRUPOCARGOEXT GCE,'
      '  GRUPOFUNC     GF'
      ''
      'WHERE'
      '      E.IDPESSJUR       = :IDPESSJUR'
      '  AND E.IDPESSOA        = :IDPESSOA'
      '  AND E.IDPESSJURFG     = F.IDPESSJUR(+)'
      '  AND E.IDFUNCAO        = F.IDCARGOEXT(+)'
      '  AND GCE.IDCARGOEXT(+) = E.IDFUNCAO'
      '  AND GF.IDGRUPOFUNC(+) = GCE.IDGRUPOFUNC'
      ''
      '  AND GCE.DATAVIGENCIA  = ('
      '                          SELECT'
      '                            MAX(G.DATAVIGENCIA)'
      '                          FROM'
      '                            GRUPOCARGOEXT G'
      '                          WHERE'
      '                                G.IDPESSJUR   = E.IDPESSJUR'
      '                            AND G.IDCARGOEXT  = E.IDFUNCAO'
      '                          )'
      ''
      '  AND E.PERCINCORP      IS NOT NULL'
      '  AND E.PERCINCORP      > 0'
      ''
      'ORDER BY'
      '  E.DATAINICIO DESC')
    UpdateObject = updAdicIncorp
    ControlType.Strings = (
      'FLGSITPART;CustomEdit;dbcSituacao')
    ValidateWithMask = True
    Left = 472
    Top = 432
    ParamData = <
      item
        DataType = ftInteger
        Name = 'IDPESSJUR'
        ParamType = ptUnknown
        Value = 1
      end
      item
        DataType = ftInteger
        Name = 'IDPESSOA'
        ParamType = ptUnknown
        Value = 76644
      end>
    object qryAdicIncorpCODIGO: TStringField
      DisplayLabel = 'Código'
      DisplayWidth = 15
      FieldName = 'CODIGO'
      Size = 15
    end
    object qryAdicIncorpGRUPO: TStringField
      DisplayLabel = 'Grupo'
      DisplayWidth = 15
      FieldName = 'GRUPO'
      FixedChar = True
      Size = 15
    end
    object qryAdicIncorpFUNCAO: TStringField
      DisplayLabel = 'Função Base'
      DisplayWidth = 40
      FieldName = 'FUNCAO'
      Size = 40
    end
    object qryAdicIncorpDATAINICIO: TDateTimeField
      DisplayLabel = 'Data de ~Início'
      DisplayWidth = 12
      FieldName = 'DATAINICIO'
    end
    object qryAdicIncorpDATAFINAL: TDateTimeField
      DisplayLabel = 'Data de ~Término'
      DisplayWidth = 12
      FieldName = 'DATAFINAL'
    end
    object qryAdicIncorpPERCINCORP: TFloatField
      DisplayLabel = 'Percentual (%)'
      DisplayWidth = 10
      FieldName = 'PERCINCORP'
    end
    object qryAdicIncorpDESCORIGEM: TStringField
      DisplayLabel = 'Origem'
      DisplayWidth = 23
      FieldName = 'DESCORIGEM'
    end
    object qryAdicIncorpDESCSITCADASTRADA: TStringField
      DisplayLabel = 'Situação ~Cadastrada'
      DisplayWidth = 10
      FieldName = 'DESCSITCADASTRADA'
      Size = 9
    end
    object qryAdicIncorpPERC1AC: TFloatField
      DisplayLabel = 'Percentual (%)'
      DisplayWidth = 10
      FieldName = 'PERC1AC'
      Visible = False
    end
    object qryAdicIncorpIDPESSJUR: TFloatField
      FieldName = 'IDPESSJUR'
      Visible = False
    end
    object qryAdicIncorpIDPESSOA: TFloatField
      FieldName = 'IDPESSOA'
      Visible = False
    end
    object qryAdicIncorpSEQHISTFUNC: TFloatField
      FieldName = 'SEQHISTFUNC'
      Visible = False
    end
    object qryAdicIncorpIDPESSJURCG: TFloatField
      FieldName = 'IDPESSJURCG'
      Visible = False
    end
    object qryAdicIncorpIDCARGOEXT: TFloatField
      FieldName = 'IDCARGOEXT'
      Visible = False
    end
    object qryAdicIncorpIDPESSJURFG: TFloatField
      FieldName = 'IDPESSJURFG'
      Visible = False
    end
    object qryAdicIncorpIDFUNCAO: TFloatField
      FieldName = 'IDFUNCAO'
      Visible = False
    end
    object qryAdicIncorpPERC2AC: TFloatField
      FieldName = 'PERC2AC'
      Visible = False
    end
    object qryAdicIncorpPERCATS: TFloatField
      FieldName = 'PERCATS'
      Visible = False
    end
    object qryAdicIncorpPERCINSALUB: TFloatField
      FieldName = 'PERCINSALUB'
      Visible = False
    end
    object qryAdicIncorpPERCPERICUL: TFloatField
      FieldName = 'PERCPERICUL'
      Visible = False
    end
    object qryAdicIncorpPERCFUNCAO: TFloatField
      FieldName = 'PERCFUNCAO'
      Visible = False
    end
    object qryAdicIncorpMODOFUNCAO: TStringField
      FieldName = 'MODOFUNCAO'
      Visible = False
      FixedChar = True
      Size = 2
    end
    object qryAdicIncorpORIGEM: TStringField
      FieldName = 'ORIGEM'
      Visible = False
      FixedChar = True
      Size = 1
    end
    object qryAdicIncorpFLGSITPART: TStringField
      FieldName = 'FLGSITPART'
      Visible = False
      FixedChar = True
      Size = 2
    end
    object qryAdicIncorpDESCMODO: TStringField
      FieldName = 'DESCMODO'
      Visible = False
      Size = 21
    end
  end
  object dsAdicIncorp: TwwDataSource
    AutoEdit = False
    DataSet = qryAdicIncorp
    Left = 472
    Top = 416
  end
  object updAdicIncorp: TUpdateSQL
    ModifySQL.Strings = (
      'update EVOLFUNCPREV'
      'set'
      '  IDPESSJUR = :IDPESSJUR,'
      '  IDPESSOA = :IDPESSOA,'
      '  SEQHISTFUNC = :SEQHISTFUNC,'
      '  IDPESSJURCG = :IDPESSJURCG,'
      '  IDCARGOEXT = :IDCARGOEXT,'
      '  IDPESSJURFG = :IDPESSJURFG,'
      '  IDFUNCAO = :IDFUNCAO,'
      '  DATAINICIO = :DATAINICIO,'
      '  DATAFINAL = :DATAFINAL,'
      '  PERC1AC = :PERC1AC,'
      '  PERC2AC = :PERC2AC,'
      '  PERCATS = :PERCATS,'
      '  PERCINSALUB = :PERCINSALUB,'
      '  PERCPERICUL = :PERCPERICUL,'
      '  PERCFUNCAO = :PERCFUNCAO,'
      '  MODOFUNCAO = :MODOFUNCAO,'
      '  PERCINCORP = :PERCINCORP,'
      '  ORIGEM = :ORIGEM,'
      '  FLGSITPART = :FLGSITPART'
      'where'
      '  IDPESSJUR = :OLD_IDPESSJUR and'
      '  IDPESSOA = :OLD_IDPESSOA and'
      '  SEQHISTFUNC = :OLD_SEQHISTFUNC')
    InsertSQL.Strings = (
      'insert into EVOLFUNCPREV'
      
        '  (IDPESSJUR, IDPESSOA, SEQHISTFUNC, IDPESSJURCG, IDCARGOEXT, ID' +
        'PESSJURFG, '
      
        '   IDFUNCAO, DATAINICIO, DATAFINAL, PERC1AC, PERC2AC, PERCATS, P' +
        'ERCINSALUB, '
      
        '   PERCPERICUL, PERCFUNCAO, MODOFUNCAO, PERCINCORP, ORIGEM, FLGS' +
        'ITPART)'
      'values'
      
        '  (:IDPESSJUR, :IDPESSOA, :SEQHISTFUNC, :IDPESSJURCG, :IDCARGOEX' +
        'T, :IDPESSJURFG, '
      
        '   :IDFUNCAO, :DATAINICIO, :DATAFINAL, :PERC1AC, :PERC2AC, :PERC' +
        'ATS, :PERCINSALUB, '
      
        '   :PERCPERICUL, :PERCFUNCAO, :MODOFUNCAO, :PERCINCORP, :ORIGEM,' +
        ' :FLGSITPART)')
    DeleteSQL.Strings = (
      'delete from EVOLFUNCPREV'
      'where'
      '  IDPESSJUR = :OLD_IDPESSJUR and'
      '  IDPESSOA = :OLD_IDPESSOA and'
      '  SEQHISTFUNC = :OLD_SEQHISTFUNC')
    Left = 472
    Top = 400
  end
end
