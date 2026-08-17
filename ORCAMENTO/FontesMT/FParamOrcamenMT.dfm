inherited frmParamOrcamenMT: TfrmParamOrcamenMT
  Left = 343
  Top = 50
  HelpContext = 230005
  BorderIcons = [biSystemMenu, biMinimize, biMaximize, biHelp]
  Caption = 'Parâmetros do Orçamento'
  ClientHeight = 618
  ClientWidth = 827
  PixelsPerInch = 96
  TextHeight = 13
  inherited pnlFundo: TPanel
    Width = 827
    Height = 532
    object pgcParametros: TPageControl
      Left = 1
      Top = 1
      Width = 825
      Height = 530
      ActivePage = tbsGeral
      Align = alClient
      TabOrder = 0
      object tbsGeral: TTabSheet
        Caption = 'Geral'
        object Label1: TLabel
          Left = 47
          Top = 26
          Width = 205
          Height = 13
          Caption = 'Moeda para Cadastro do Orçamento'
        end
        object Label2: TLabel
          Left = 31
          Top = 378
          Width = 112
          Height = 13
          Caption = 'Plano Orçamentário'
          Visible = False
        end
        object Label3: TLabel
          Left = 31
          Top = 426
          Width = 202
          Height = 13
          Caption = 'Máscara dos Grupos Orçamentários'
          Visible = False
        end
        object Label4: TLabel
          Left = 47
          Top = 98
          Width = 210
          Height = 13
          Caption = 'Tratamento do Saldo para Processos'
        end
        object Label5: TLabel
          Left = 67
          Top = 219
          Width = 117
          Height = 13
          Caption = 'de grupos diferentes'
        end
        object dblcMoeda: TwwDBLookupCombo
          Left = 47
          Top = 40
          Width = 365
          Height = 21
          DropDownAlignment = taLeftJustify
          Selected.Strings = (
            'MOEDESC'#9'20'#9'MOEDESC')
          DataField = 'MOECODIGO'
          DataSource = ds
          LookupTable = cdsMoeda
          LookupField = 'MOECODIGO'
          Style = csDropDownList
          TabOrder = 0
          AutoDropDown = True
          ShowButton = True
          AllowClearKey = True
          ShowMatchText = True
        end
        object dblcPlanoOrc: TwwDBLookupCombo
          Left = 31
          Top = 392
          Width = 365
          Height = 21
          DropDownAlignment = taLeftJustify
          Selected.Strings = (
            'NOMEPLANOORC'#9'60'#9'NOMEPLANOORC')
          DataField = 'IDPLANOORCAMEN'
          DataSource = ds
          LookupTable = cdsPlanoOrc
          LookupField = 'IDPLANOORCAMEN'
          Style = csDropDownList
          TabOrder = 1
          Visible = False
          AutoDropDown = True
          ShowButton = True
          AllowClearKey = True
          ShowMatchText = True
          OnCloseUp = dblcPlanoOrcCloseUp
          OnExit = dblcPlanoOrcExit
        end
        object edMascara: TwwDBEdit
          Left = 31
          Top = 440
          Width = 202
          Height = 21
          DataField = 'MASCGRUPOORC'
          DataSource = ds
          Enabled = False
          TabOrder = 2
          UnboundDataType = wwDefault
          Visible = False
          WantReturns = False
          WordWrap = False
        end
        object dbcboSaldos: TwwDBComboBox
          Left = 47
          Top = 112
          Width = 365
          Height = 21
          ShowButton = True
          Style = csDropDown
          MapList = True
          AllowClearKey = False
          DataField = 'FLGTIPOSALDO'
          DataSource = ds
          DropDownCount = 8
          ItemHeight = 0
          Items.Strings = (
            'Por Período'#9'P'
            'Acumulado do Exercício'#9'E'
            'Acumulado até o Período'#9'A')
          Sorted = False
          TabOrder = 3
          UnboundDataType = wwDefault
        end
        object dbchkPermite: TDBCheckBox
          Left = 47
          Top = 171
          Width = 289
          Height = 17
          Caption = 'Permite processos com valores acima do saldo'
          DataField = 'FLGVERIFICASALDO'
          DataSource = ds
          TabOrder = 4
          ValueChecked = 'S'
          ValueUnchecked = 'N'
        end
        object dbchkTransfGrupos: TDBCheckBox
          Left = 47
          Top = 203
          Width = 305
          Height = 17
          Caption = 'Permite transferências entre contas orçamentárias'
          DataField = 'FLGPERMITETRANSF'
          DataSource = ds
          TabOrder = 5
          ValueChecked = 'S'
          ValueUnchecked = 'N'
        end
      end
      object tbsCodConta: TTabSheet
        Caption = 'Contas Orçamentárias'
        ImageIndex = 1
        object GroupBox1: TGroupBox
          Left = 32
          Top = 16
          Width = 516
          Height = 377
          Caption = ' Regra de formação do código das Contas Orçamentárias '
          TabOrder = 0
          object Bevel8: TBevel
            Left = 102
            Top = 24
            Width = 9
            Height = 351
            Shape = bsLeftLine
          end
          object Label7: TLabel
            Left = 24
            Top = 25
            Width = 42
            Height = 13
            Caption = 'Dígitos'
          end
          object Label8: TLabel
            Left = 128
            Top = 25
            Width = 55
            Height = 13
            Caption = 'Conteúdo'
          end
          object Bevel1: TBevel
            Left = 17
            Top = 40
            Width = 483
            Height = 9
            Shape = bsTopLine
          end
          object Bevel3: TBevel
            Left = 17
            Top = 79
            Width = 483
            Height = 9
            Shape = bsTopLine
          end
          object Bevel4: TBevel
            Left = 17
            Top = 119
            Width = 483
            Height = 9
            Shape = bsTopLine
          end
          object Bevel5: TBevel
            Left = 17
            Top = 159
            Width = 483
            Height = 9
            Shape = bsTopLine
          end
          object Bevel6: TBevel
            Left = 17
            Top = 199
            Width = 483
            Height = 9
            Shape = bsTopLine
          end
          object Bevel2: TBevel
            Left = 17
            Top = 239
            Width = 483
            Height = 9
            Shape = bsTopLine
          end
          object Bevel7: TBevel
            Left = 17
            Top = 279
            Width = 483
            Height = 9
            Shape = bsTopLine
          end
          object Bevel9: TBevel
            Left = 17
            Top = 327
            Width = 483
            Height = 9
            Shape = bsTopLine
          end
          object spnTam1: TwwDBSpinEdit
            Left = 24
            Top = 50
            Width = 57
            Height = 21
            Increment = 1
            MaxValue = 25
            DataField = 'TAMCOD1'
            DataSource = ds
            TabOrder = 0
            UnboundDataType = wwDefault
          end
          object spnTam2: TwwDBSpinEdit
            Left = 24
            Top = 90
            Width = 57
            Height = 21
            Increment = 1
            MaxValue = 25
            DataField = 'TAMCOD2'
            DataSource = ds
            TabOrder = 2
            UnboundDataType = wwDefault
          end
          object spnTam3: TwwDBSpinEdit
            Left = 24
            Top = 130
            Width = 57
            Height = 21
            Increment = 1
            MaxValue = 25
            DataField = 'TAMCOD3'
            DataSource = ds
            TabOrder = 4
            UnboundDataType = wwDefault
          end
          object spnTam4: TwwDBSpinEdit
            Left = 24
            Top = 170
            Width = 57
            Height = 21
            Increment = 1
            MaxValue = 25
            DataField = 'TAMCOD4'
            DataSource = ds
            TabOrder = 6
            UnboundDataType = wwDefault
          end
          object DBcboTipoCod1: TwwDBComboBox
            Left = 128
            Top = 50
            Width = 359
            Height = 21
            ShowButton = True
            Style = csDropDownList
            MapList = True
            AllowClearKey = True
            AutoDropDown = True
            DataField = 'FLGTIPOCOD1'
            DataSource = ds
            DropDownCount = 8
            ItemHeight = 0
            Items.Strings = (
              'Grupo Orçamentário'#9'1'
              'Centro de Custo'#9'2'
              'Atividade/Projeto'#9'3'
              'Plano Previdenciário'#9'4'
              'Patrocinadora'#9'5'
              'Centro de Responsabilidade'#9'6'
              'Programa'#9'7'
              'Tipo de Despesa'#9'8')
            Sorted = False
            TabOrder = 1
            UnboundDataType = wwDefault
          end
          object DBcboTipoCod2: TwwDBComboBox
            Left = 128
            Top = 90
            Width = 359
            Height = 21
            ShowButton = True
            Style = csDropDownList
            MapList = True
            AllowClearKey = True
            AutoDropDown = True
            DataField = 'FLGTIPOCOD2'
            DataSource = ds
            DropDownCount = 8
            ItemHeight = 0
            Items.Strings = (
              'Grupo Orçamentário'#9'1'
              'Centro de Custo'#9'2'
              'Atividade/Projeto'#9'3'
              'Plano Previdenciário'#9'4'
              'Patrocinadora'#9'5'
              'Centro de Responsabilidade'#9'6'
              'Programa'#9'7'
              'Tipo de Despesa'#9'8')
            Sorted = False
            TabOrder = 3
            UnboundDataType = wwDefault
          end
          object DBcboTipoCod3: TwwDBComboBox
            Left = 128
            Top = 130
            Width = 359
            Height = 21
            ShowButton = True
            Style = csDropDownList
            MapList = True
            AllowClearKey = True
            AutoDropDown = True
            DataField = 'FLGTIPOCOD3'
            DataSource = ds
            DropDownCount = 8
            ItemHeight = 0
            Items.Strings = (
              'Grupo Orçamentário'#9'1'
              'Centro de Custo'#9'2'
              'Atividade/Projeto'#9'3'
              'Plano Previdenciário'#9'4'
              'Patrocinadora'#9'5'
              'Centro de Responsabilidade'#9'6'
              'Programa'#9'7'
              'Tipo de Despesa'#9'8')
            Sorted = False
            TabOrder = 5
            UnboundDataType = wwDefault
          end
          object DBcboTipoCod4: TwwDBComboBox
            Left = 128
            Top = 170
            Width = 359
            Height = 21
            ShowButton = True
            Style = csDropDownList
            MapList = True
            AllowClearKey = True
            AutoDropDown = True
            DataField = 'FLGTIPOCOD4'
            DataSource = ds
            DropDownCount = 8
            ItemHeight = 0
            Items.Strings = (
              'Grupo Orçamentário'#9'1'
              'Centro de Custo'#9'2'
              'Atividade/Projeto'#9'3'
              'Plano Previdenciário'#9'4'
              'Patrocinadora'#9'5'
              'Centro de Responsabilidade'#9'6'
              'Programa'#9'7'
              'Tipo de Despesa'#9'8')
            Sorted = False
            TabOrder = 7
            UnboundDataType = wwDefault
          end
          object spnTam5: TwwDBSpinEdit
            Left = 24
            Top = 210
            Width = 57
            Height = 21
            Increment = 1
            MaxValue = 25
            DataField = 'TAMCOD5'
            DataSource = ds
            TabOrder = 8
            UnboundDataType = wwDefault
          end
          object DBcboTipoCod5: TwwDBComboBox
            Left = 128
            Top = 210
            Width = 359
            Height = 21
            ShowButton = True
            Style = csDropDownList
            MapList = True
            AllowClearKey = True
            AutoDropDown = True
            DataField = 'FLGTIPOCOD5'
            DataSource = ds
            DropDownCount = 8
            ItemHeight = 0
            Items.Strings = (
              'Grupo Orçamentário'#9'1'
              'Centro de Custo'#9'2'
              'Atividade/Projeto'#9'3'
              'Plano Previdenciário'#9'4'
              'Patrocinadora'#9'5'
              'Centro de Responsabilidade'#9'6'
              'Programa'#9'7'
              'Tipo de Despesa'#9'8')
            Sorted = False
            TabOrder = 9
            UnboundDataType = wwDefault
          end
          object spnTam6: TwwDBSpinEdit
            Left = 24
            Top = 250
            Width = 57
            Height = 21
            Increment = 1
            MaxValue = 25
            DataField = 'TAMCOD6'
            DataSource = ds
            TabOrder = 10
            UnboundDataType = wwDefault
          end
          object DBcboTipoCod6: TwwDBComboBox
            Left = 128
            Top = 250
            Width = 359
            Height = 21
            ShowButton = True
            Style = csDropDownList
            MapList = True
            AllowClearKey = True
            AutoDropDown = True
            DataField = 'FLGTIPOCOD6'
            DataSource = ds
            DropDownCount = 8
            ItemHeight = 0
            Items.Strings = (
              'Grupo Orçamentário'#9'1'
              'Centro de Custo'#9'2'
              'Atividade/Projeto'#9'3'
              'Plano Previdenciário'#9'4'
              'Patrocinadora'#9'5'
              'Centro de Responsabilidade'#9'6'
              'Programa'#9'7'
              'Tipo de Despesa'#9'8')
            Sorted = False
            TabOrder = 11
            UnboundDataType = wwDefault
          end
          object spnTam8: TwwDBSpinEdit
            Left = 24
            Top = 340
            Width = 57
            Height = 21
            Increment = 1
            MaxValue = 25
            DataField = 'TAMCOD8'
            DataSource = ds
            TabOrder = 12
            UnboundDataType = wwDefault
          end
          object DBcboTipoCod8: TwwDBComboBox
            Left = 128
            Top = 340
            Width = 359
            Height = 21
            ShowButton = True
            Style = csDropDownList
            MapList = True
            AllowClearKey = True
            AutoDropDown = True
            DataField = 'FLGTIPOCOD8'
            DataSource = ds
            DropDownCount = 8
            ItemHeight = 0
            Items.Strings = (
              'Grupo Orçamentário'#9'1'
              'Centro de Custo'#9'2'
              'Atividade/Projeto'#9'3'
              'Plano Previdenciário'#9'4'
              'Patrocinadora'#9'5'
              'Centro de Responsabilidade'#9'6'
              'Programa'#9'7'
              'Tipo de Despesa'#9'8')
            Sorted = False
            TabOrder = 13
            UnboundDataType = wwDefault
          end
          object DBcboTipoCod7: TwwDBComboBox
            Left = 128
            Top = 298
            Width = 359
            Height = 21
            ShowButton = True
            Style = csDropDownList
            MapList = True
            AllowClearKey = True
            AutoDropDown = True
            DataField = 'FLGTIPOCOD7'
            DataSource = ds
            DropDownCount = 8
            ItemHeight = 0
            Items.Strings = (
              'Grupo Orçamentário'#9'1'
              'Centro de Custo'#9'2'
              'Atividade/Projeto'#9'3'
              'Plano Previdenciário'#9'4'
              'Patrocinadora'#9'5'
              'Centro de Responsabilidade'#9'6'
              'Programa'#9'7'
              'Tipo de Despesa'#9'8')
            Sorted = False
            TabOrder = 14
            UnboundDataType = wwDefault
          end
          object spnTam7: TwwDBSpinEdit
            Left = 24
            Top = 298
            Width = 57
            Height = 21
            Increment = 1
            MaxValue = 25
            DataField = 'TAMCOD7'
            DataSource = ds
            TabOrder = 15
            UnboundDataType = wwDefault
          end
        end
      end
      object tbsCodOrcamento: TTabSheet
        Caption = 'Códigos para Orçamento'
        ImageIndex = 2
        object Label9: TLabel
          Left = 16
          Top = 16
          Width = 119
          Height = 13
          Caption = 'Planos Previdenciais'
        end
        object Label10: TLabel
          Left = 16
          Top = 178
          Width = 86
          Height = 13
          Caption = 'Patrocinadoras'
        end
        object Label6: TLabel
          Left = 346
          Top = 16
          Width = 108
          Height = 13
          Caption = 'Atividade / Projeto'
        end
        object Label11: TLabel
          Left = 346
          Top = 176
          Width = 54
          Height = 13
          Caption = 'Programa'
        end
        object Label12: TLabel
          Left = 18
          Top = 336
          Width = 97
          Height = 13
          Caption = 'Tipo de Despesa'
        end
        object wwDBGrid1: TwwDBGrid
          Left = 16
          Top = 32
          Width = 313
          Height = 124
          ControlType.Strings = (
            'FLGORCAMENTO;CheckBox;1;0')
          Selected.Strings = (
            'NOME'#9'23'#9'Plano'#9'F'
            'CODORCAMENTO'#9'6'#9'Código'#9'F'
            'CODSPC'#9'10'#9'Código SPC'#9'F'
            'SIGLAORCAMENTO'#9'10'#9'Sigla SPC'#9'F')
          IniAttributes.Delimiter = ';;'
          TitleColor = clBtnFace
          FixedCols = 0
          ShowHorzScrollBar = True
          DataSource = dtsPlano
          TabOrder = 0
          TitleAlignment = taLeftJustify
          TitleFont.Charset = DEFAULT_CHARSET
          TitleFont.Color = clWindowText
          TitleFont.Height = -9
          TitleFont.Name = 'MS Sans Serif'
          TitleFont.Style = [fsBold]
          TitleLines = 1
          TitleButtons = False
          UseTFields = False
          OnCalcCellColors = GridAtivProjCalcCellColors
          IndicatorColor = icBlack
          OnTopRowChanged = GridAtivProjTopRowChanged
        end
        object wwDBGrid2: TwwDBGrid
          Left = 16
          Top = 192
          Width = 313
          Height = 124
          ControlType.Strings = (
            'FLGORCAMENTO;CheckBox;1;0')
          Selected.Strings = (
            'NOME'#9'23'#9'Patrocinadora'#9'F'
            'CODORCAMENTO'#9'6'#9'Código'#9'F'
            'CODSPC'#9'10'#9'Código SPC'#9'F'
            'SIGLAORCAMENTO'#9'10'#9'Sigla SPC'#9'F')
          IniAttributes.Delimiter = ';;'
          TitleColor = clBtnFace
          FixedCols = 0
          ShowHorzScrollBar = True
          DataSource = dtsPatro
          TabOrder = 4
          TitleAlignment = taLeftJustify
          TitleFont.Charset = DEFAULT_CHARSET
          TitleFont.Color = clWindowText
          TitleFont.Height = -9
          TitleFont.Name = 'MS Sans Serif'
          TitleFont.Style = [fsBold]
          TitleLines = 1
          TitleButtons = False
          UseTFields = False
          OnCalcCellColors = GridAtivProjCalcCellColors
          IndicatorColor = icBlack
          OnTopRowChanged = GridAtivProjTopRowChanged
        end
        object btnAlteraPlano: TBitBtn
          Left = 260
          Top = 10
          Width = 23
          Height = 22
          Hint = 'Inverte a Seleção de Patrocinadoras'
          Enabled = False
          ParentShowHint = False
          ShowHint = True
          TabOrder = 1
          Visible = False
          OnClick = btnAlteraPlanoClick
          Glyph.Data = {
            76010000424D7601000000000000760000002800000020000000100000000100
            0400000000000001000000000000000000001000000000000000000000000000
            80000080000000808000800000008000800080800000C0C0C000808080000000
            FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00777777770007
            77777777777F8887F77777777788FF08777777777F887778F777777788FFFFF0
            7777777788777FF8F7777778FFFF88F077777778F77F88F87F777778FF00F0FF
            077777787F8878F78F77777700FFF0FF0777777F8877787F87F77700FFFFFF0F
            F077778877777F8F787F778FFFFFCF0FFF07778F77FF8787F787778FFCCCFFF0
            FFF07787F88877F8F7F87778FFFFFCF0F8877778F77FF87878877778FFCCCFFF
            077777787F88877F87F777778FFFFFCFF07777778F77FF87787F77778FFCCCFF
            FF07777787F888777F87777778FFFFFF88777777787F777F88777777778FFF88
            777777777787FF88777777777778887777777777777888777777}
          NumGlyphs = 2
        end
        object btnCancelaPlano: TBitBtn
          Left = 283
          Top = 10
          Width = 23
          Height = 22
          Hint = 'Cancela as alterações correntes nos Plano'
          Enabled = False
          ParentShowHint = False
          ShowHint = True
          TabOrder = 2
          Visible = False
          OnClick = btnCancelaPlanoClick
          Glyph.Data = {
            76010000424D7601000000000000760000002800000020000000100000000100
            0400000000000001000000000000000000001000000000000000000000000000
            8000008000000080800080000000800080008080000080808000C0C0C0000000
            FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00888888888888
            8888888888FFFFF8888888888000008888888888F777778FF888888009191900
            88888887788888778F88887991919191088888788888888878F8879919191919
            108887F888F888F887F887917F919F719088878887FF87FF878F7919FFF9FFF9
            19087F88777F7778887F79919FFFFF9191087F8887777788887F791919FFF919
            19087F8888777FF8887F79919FFFFF9191087F88877777FF887F7919FFF9FFF9
            190878F877787778887887917F919F71908887F88788878887F8879919191919
            1088878F88888888878888799191919108888878FF88888F7888888779999977
            8888888778FFFF77888888888777778888888888877777888888}
          NumGlyphs = 2
        end
        object btnConfirmaPlano: TBitBtn
          Left = 306
          Top = 10
          Width = 23
          Height = 22
          Hint = 'Inverte a Seleção de Patrocinadoras'
          Enabled = False
          ParentShowHint = False
          ShowHint = True
          TabOrder = 3
          Visible = False
          OnClick = btnConfirmaPlanoClick
          Glyph.Data = {
            76010000424D7601000000000000760000002800000020000000100000000100
            0400000000000001000000000000000000001000000000000000000000000000
            8000008000000080800080000000800080008080000080808000C0C0C0000000
            FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00888888888888
            8888888888FFFFF8888888888000008888888888F777778FF888888002222200
            88888887788888778F88887222222222088888788888888878F887A228822222
            208887F88FFF888887F887A2FFF8222220888788777FF888878F7A22FFFF8222
            22087F887777FF88887F7A22FFFFF82222087F8877777FF8887F7A22FF8FFF82
            22087F8877F777FF887F7A22FF82FFF822087F8877F8777F887F7A22FF222FF8
            220878F87788877FF87887A2222222FF208887F88888887787F887A222222222
            2088878F888888888788887AA222222208888878FF88888F788888877AAAAA77
            8888888778FFFF77888888888777778888888888877777888888}
          NumGlyphs = 2
        end
        object btnConfirmaPatro: TBitBtn
          Left = 306
          Top = 170
          Width = 23
          Height = 22
          Hint = 'Inverte a Seleção de Patrocinadoras'
          Enabled = False
          ParentShowHint = False
          ShowHint = True
          TabOrder = 7
          Visible = False
          OnClick = btnConfirmaPatroClick
          Glyph.Data = {
            76010000424D7601000000000000760000002800000020000000100000000100
            0400000000000001000000000000000000001000000000000000000000000000
            8000008000000080800080000000800080008080000080808000C0C0C0000000
            FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00888888888888
            8888888888FFFFF8888888888000008888888888F777778FF888888002222200
            88888887788888778F88887222222222088888788888888878F887A228822222
            208887F88FFF888887F887A2FFF8222220888788777FF888878F7A22FFFF8222
            22087F887777FF88887F7A22FFFFF82222087F8877777FF8887F7A22FF8FFF82
            22087F8877F777FF887F7A22FF82FFF822087F8877F8777F887F7A22FF222FF8
            220878F87788877FF87887A2222222FF208887F88888887787F887A222222222
            2088878F888888888788887AA222222208888878FF88888F788888877AAAAA77
            8888888778FFFF77888888888777778888888888877777888888}
          NumGlyphs = 2
        end
        object btnCancelaPatro: TBitBtn
          Left = 283
          Top = 170
          Width = 23
          Height = 22
          Hint = 'Cancela as alterações correntes nas Patrocinadoras'
          Enabled = False
          ParentShowHint = False
          ShowHint = True
          TabOrder = 6
          Visible = False
          OnClick = btnCancelaPatroClick
          Glyph.Data = {
            76010000424D7601000000000000760000002800000020000000100000000100
            0400000000000001000000000000000000001000000000000000000000000000
            8000008000000080800080000000800080008080000080808000C0C0C0000000
            FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00888888888888
            8888888888FFFFF8888888888000008888888888F777778FF888888009191900
            88888887788888778F88887991919191088888788888888878F8879919191919
            108887F888F888F887F887917F919F719088878887FF87FF878F7919FFF9FFF9
            19087F88777F7778887F79919FFFFF9191087F8887777788887F791919FFF919
            19087F8888777FF8887F79919FFFFF9191087F88877777FF887F7919FFF9FFF9
            190878F877787778887887917F919F71908887F88788878887F8879919191919
            1088878F88888888878888799191919108888878FF88888F7888888779999977
            8888888778FFFF77888888888777778888888888877777888888}
          NumGlyphs = 2
        end
        object btnAlteraPatro: TBitBtn
          Left = 260
          Top = 170
          Width = 23
          Height = 22
          Hint = 'Inverte a Seleção de Patrocinadoras'
          Enabled = False
          ParentShowHint = False
          ShowHint = True
          TabOrder = 5
          Visible = False
          OnClick = btnAlteraPatroClick
          Glyph.Data = {
            76010000424D7601000000000000760000002800000020000000100000000100
            0400000000000001000000000000000000001000000000000000000000000000
            80000080000000808000800000008000800080800000C0C0C000808080000000
            FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00777777770007
            77777777777F8887F77777777788FF08777777777F887778F777777788FFFFF0
            7777777788777FF8F7777778FFFF88F077777778F77F88F87F777778FF00F0FF
            077777787F8878F78F77777700FFF0FF0777777F8877787F87F77700FFFFFF0F
            F077778877777F8F787F778FFFFFCF0FFF07778F77FF8787F787778FFCCCFFF0
            FFF07787F88877F8F7F87778FFFFFCF0F8877778F77FF87878877778FFCCCFFF
            077777787F88877F87F777778FFFFFCFF07777778F77FF87787F77778FFCCCFF
            FF07777787F888777F87777778FFFFFF88777777787F777F88777777778FFF88
            777777777787FF88777777777778887777777777777888777777}
          NumGlyphs = 2
        end
        object GridAtivProj: TwwDBGrid
          Left = 346
          Top = 31
          Width = 313
          Height = 124
          ControlType.Strings = (
            'FLGORCAMENTO;CheckBox;1;0')
          Selected.Strings = (
            'NOME'#9'21'#9'Atividade / Projeto'#9'F'
            'TIPO'#9'9'#9'Analítico/~Sintético'#9'F'
            'CODORCAMEN'#9'7'#9'Código'#9'F')
          IniAttributes.Delimiter = ';;'
          TitleColor = clBtnFace
          FixedCols = 0
          ShowHorzScrollBar = True
          DataSource = dsAtivProj
          TabOrder = 8
          TitleAlignment = taLeftJustify
          TitleFont.Charset = DEFAULT_CHARSET
          TitleFont.Color = clWindowText
          TitleFont.Height = -9
          TitleFont.Name = 'MS Sans Serif'
          TitleFont.Style = [fsBold]
          TitleLines = 2
          TitleButtons = False
          UseTFields = False
          OnCalcCellColors = GridAtivProjCalcCellColors
          OnExit = GridAtivProjExit
          IndicatorColor = icBlack
          OnTopRowChanged = GridAtivProjTopRowChanged
        end
        object GridPrograma: TwwDBGrid
          Left = 346
          Top = 191
          Width = 313
          Height = 124
          ControlType.Strings = (
            'FLGORCAMENTO;CheckBox;1;0')
          Selected.Strings = (
            'DESCRICAO_PROGRAMAORCAMEN'#9'21'#9'Programa'#9'F'
            'IDPROGRAMAORCAMEN'#9'9'#9'Código'#9'F'
            'CODORCAMEN'#9'7'#9'Código'#9'F')
          IniAttributes.Delimiter = ';;'
          TitleColor = clBtnFace
          FixedCols = 0
          ShowHorzScrollBar = True
          DataSource = ds_Programa
          TabOrder = 9
          TitleAlignment = taLeftJustify
          TitleFont.Charset = DEFAULT_CHARSET
          TitleFont.Color = clWindowText
          TitleFont.Height = -9
          TitleFont.Name = 'MS Sans Serif'
          TitleFont.Style = [fsBold]
          TitleLines = 2
          TitleButtons = False
          UseTFields = False
          OnCalcCellColors = GridProgramaCalcCellColors
          OnExit = GridProgramaExit
          IndicatorColor = icBlack
          OnTopRowChanged = GridProgramaTopRowChanged
        end
        object GridTipoDespesa: TwwDBGrid
          Left = 18
          Top = 351
          Width = 313
          Height = 124
          ControlType.Strings = (
            'FLGORCAMENTO;CheckBox;1;0')
          Selected.Strings = (
            'DESCRICAO_TIPO_DEPESAOCAMEN'#9'21'#9'Tipo de Despesa'#9'F'
            'IDTIPO_DEPESAORCAMEN'#9'9'#9'Código'#9'F')
          IniAttributes.Delimiter = ';;'
          TitleColor = clBtnFace
          FixedCols = 0
          ShowHorzScrollBar = True
          DataSource = ds_Tipo_Despesa
          TabOrder = 10
          TitleAlignment = taLeftJustify
          TitleFont.Charset = DEFAULT_CHARSET
          TitleFont.Color = clWindowText
          TitleFont.Height = -9
          TitleFont.Name = 'MS Sans Serif'
          TitleFont.Style = [fsBold]
          TitleLines = 2
          TitleButtons = False
          UseTFields = False
          OnCalcCellColors = GridTipoDespesaCalcCellColors
          OnExit = GridTipoDespesaExit
          IndicatorColor = icBlack
          OnTopRowChanged = GridTipoDespesaTopRowChanged
        end
      end
    end
  end
  inherited Dock972: TDock97
    Width = 827
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
    Top = 579
    Width = 827
    inherited tb97Fundo: TToolbar97
      Left = 169
      DockPos = 169
      inherited bbtnAjuda: TmaHelpBitBtn
        HelpContext = 230005
      end
    end
    inherited TB97oKCancelar: TToolbar97
      Left = 0
      DockPos = 0
    end
  end
  inherited ivTradutor: TIvExtendedTranslator
    Left = 666
    Top = 15
    TargetsData = (
      1
      1
      (
        'TDBRealEdit'
        'Text'
        0))
  end
  inherited ds: TwwDataSource
    Left = 280
    Top = 0
  end
  inherited ImlPadrao: TImageList
    Left = 608
    Top = 15
  end
  inherited CmeCadastro: TCmEventosCadastro
    OnFind = CmeCadastroFind
    BeforeConfirma = CmeCadastroBeforeConfirma
    ApplyEdit = CmeCadastroApplyEdit
    Left = 320
    Top = 16
  end
  inherited Cds: TCMClientDataSet
    Left = 248
    Top = 0
  end
  inherited MontaSelect: TMontaSelect
    Left = 376
    Top = 0
  end
  object cdsMoeda: TCMClientDataSet
    Aggregates = <>
    Params = <>
    ProviderName = 'Dsp'
    Left = 416
    Top = 32
  end
  object cdsPlanoOrc: TCMClientDataSet
    Aggregates = <>
    Params = <>
    ProviderName = 'Dsp'
    Left = 416
    Top = 16
  end
  object sqlTeste: TCMSqlParams
    SQL.Strings = (
      'select * from'
      'paramorcamento')
    ClientDataSet = Cds
    Left = 776
    Top = 136
  end
  object cdsPlano: TCMClientDataSet
    Aggregates = <>
    Params = <>
    AfterOpen = cdsPlanoAfterOpen
    Left = 776
    Top = 248
  end
  object cdsPatro: TCMClientDataSet
    Aggregates = <>
    Params = <>
    AfterOpen = cdsPlanoAfterOpen
    Left = 776
    Top = 320
  end
  object dtsPlano: TwwDataSource
    DataSet = cdsPlano
    Left = 776
    Top = 176
  end
  object dtsPatro: TwwDataSource
    DataSet = cdsPatro
    Left = 808
    Top = 320
  end
  object sqlPAtro: TCMSqlParams
    SQL.Strings = (
      'SELECT'
      '   PPA.NOME,'
      '   PTR.*'
      'FROM'
      '   PESSOA PPA,'
      '   PATRO  PTR'
      'WHERE'
      '   PTR.IDPESSOA = PPA.IDPESSOA')
    ClientDataSet = cdsPatro
    Left = 9
    Top = 260
  end
  object CdsAtivProj: TCMClientDataSet
    Aggregates = <>
    FieldDefs = <>
    IndexDefs = <>
    Params = <>
    StoreDefs = True
    AfterOpen = CdsAtivProjAfterOpen
    BeforePost = CdsAtivProjBeforePost
    AfterPost = CdsAtivProjAfterPost
    AfterScroll = CdsAtivProjAfterScroll
    Left = 781
    Top = 88
  end
  object dsAtivProj: TDataSource
    DataSet = CdsAtivProj
    Left = 821
    Top = 88
  end
  object ds_Programa: TwwDataSource
    DataSet = cdsPrograma
    Left = 504
    Top = 432
  end
  object ds_Tipo_Despesa: TwwDataSource
    DataSet = CdsTipoDespesa
    Left = 504
    Top = 496
  end
  object cdsPrograma: TClientDataSet
    Aggregates = <>
    Params = <>
    Left = 408
    Top = 432
  end
  object CdsTipoDespesa: TClientDataSet
    Aggregates = <>
    Params = <>
    Left = 416
    Top = 496
  end
end
