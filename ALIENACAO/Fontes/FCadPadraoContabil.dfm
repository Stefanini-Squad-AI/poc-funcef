inherited frmCadPadraoContabil: TfrmCadPadraoContabil
  Left = 28
  Top = 104
  Caption = 'Cadastro de Padrões de Lançamento'
  ClientHeight = 409
  ClientWidth = 746
  PixelsPerInch = 96
  TextHeight = 13
  inherited pnlFundo: TPanel
    Width = 746
    Height = 370
    object Label1: TLabel
      Left = 16
      Top = 10
      Width = 107
      Height = 13
      Caption = 'Tipo de Operação '
    end
    object pgcIntegra: TPageControl
      Left = 5
      Top = 60
      Width = 736
      Height = 305
      ActivePage = tbsIntegra
      Align = alBottom
      Enabled = False
      TabOrder = 2
      object tbsIntegra: TTabSheet
        Caption = 'Padrão de Lançamento'
        TabVisible = False
        object Label4: TLabel
          Left = 392
          Top = 137
          Width = 57
          Height = 13
          Caption = 'Históricos'
        end
        object Label6: TLabel
          Left = 392
          Top = 78
          Width = 103
          Height = 13
          Caption = 'Credor / Debitado'
        end
        object Label2: TLabel
          Left = 392
          Top = 38
          Width = 85
          Height = 13
          Caption = 'Tipo de Imóvel'
        end
        object lblTipo: TLabel
          Left = 12
          Top = 38
          Width = 92
          Height = 13
          Caption = 'Tipo de Rubrica'
        end
        object Bevel1: TBevel
          Left = 392
          Top = 128
          Width = 321
          Height = 2
          Shape = bsTopLine
        end
        object Dock973: TDock97
          Left = 0
          Top = 0
          Width = 728
          Height = 31
          AllowDrag = False
          BoundLines = [blTop, blBottom, blLeft, blRight]
          object tb97BotoesDetalhe: TToolbar97
            Left = 0
            Top = 0
            BorderStyle = bsNone
            Caption = 'tb97BotoesDetalhe'
            DockPos = 0
            TabOrder = 0
            object sbtnInserir: TSpeedButton
              Left = 0
              Top = 0
              Width = 77
              Height = 25
              Hint = 'Inserir novo registro|'
              AllowAllUp = True
              GroupIndex = 1
              Caption = 'In&serir'
              Glyph.Data = {
                76010000424D7601000000000000760000002800000020000000100000000100
                0400000000000001000000000000000000001000000000000000000000000000
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
              ParentShowHint = False
              ShowHint = True
              OnClick = sbtnInserirClick
            end
            object sbtnAlterar: TSpeedButton
              Left = 77
              Top = 0
              Width = 77
              Height = 25
              Hint = 'Alterar o registro selecionado|'
              AllowAllUp = True
              GroupIndex = 1
              Caption = 'Alte&rar'
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
              ParentShowHint = False
              ShowHint = True
              OnClick = sbtnAlterarClick
            end
            object sbtnApagar: TSpeedButton
              Left = 154
              Top = 0
              Width = 77
              Height = 25
              Hint = 'Remover o registro selecionado|'
              AllowAllUp = True
              GroupIndex = 1
              Caption = 'E&xcluir'
              Glyph.Data = {
                76010000424D7601000000000000760000002800000020000000100000000100
                0400000000000001000000000000000000001000000000000000000000000000
                8000008000000080800080000000800080008080000080808000C0C0C0000000
                FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00888888888888
                88888888888888FF8888888888888778888888888888F77F8888888888800F08
                8888888888F7787F88888888800FFF0888888888F7788878F88888800FFFFFF0
                88888887788888F7F8888887FFFFFCF088888887FFF887878F888811111CCFFF
                08888877777F788F7F8881999991FFCF088887777777F87878F8999999991CFF
                F088777777777F88F78F998F9FF91FFCFF0877FF78877F8788789998FF991CCF
                FFF0777F88777F7888F7999FF8991FFFF77877788F777F88F778998F9FF91FF7
                788877FF7FF778F7788889999991777888888777777787788888889999988888
                8888887777788888888888888888888888888888888888888888}
              NumGlyphs = 2
              ParentShowHint = False
              ShowHint = True
              OnClick = sbtnApagarClick
            end
          end
        end
        object pgcPadraoLanc: TPageControl
          Left = 12
          Top = 83
          Width = 361
          Height = 198
          ActivePage = tbsDebito
          TabOrder = 1
          object tbsGeral: TTabSheet
            Caption = 'Geral'
            object Label15: TLabel
              Left = 16
              Top = 6
              Width = 142
              Height = 13
              Caption = 'Histórico do Lançamento'
            end
            object Label12: TLabel
              Left = 16
              Top = 44
              Width = 108
              Height = 13
              Caption = 'Atividade / Projeto'
            end
            object DBedtHistorico: TDBEdit
              Left = 16
              Top = 20
              Width = 321
              Height = 21
              DataField = 'HISTLANCINVEST'
              DataSource = ds
              TabOrder = 0
            end
            object DBcboUnidNegoc: TwwDBLookupCombo
              Left = 16
              Top = 58
              Width = 322
              Height = 21
              DropDownAlignment = taLeftJustify
              Selected.Strings = (
                'NOME'#9'25'#9'NOME')
              DataField = 'UNIDNEGOC'
              DataSource = ds
              LookupTable = qryLookUnidNegocio
              LookupField = 'UNIDNEGOC'
              Style = csDropDownList
              DropDownCount = 4
              DropDownWidth = 8
              TabOrder = 1
              AutoDropDown = True
              ShowButton = True
              AllowClearKey = False
            end
          end
          object tbsDebito: TTabSheet
            Caption = 'Débito'
            object Label8: TLabel
              Left = 16
              Top = 6
              Width = 84
              Height = 13
              Caption = 'Conta Contábil'
            end
            object Label9: TLabel
              Left = 16
              Top = 44
              Width = 55
              Height = 13
              Caption = 'Subconta'
            end
            object Label11: TLabel
              Left = 16
              Top = 82
              Width = 92
              Height = 13
              Caption = 'Centro de Custo'
            end
            object lblContaDebito: TLabel
              Left = 176
              Top = 24
              Width = 153
              Height = 13
              AutoSize = False
              Caption = 'Conta Contábil'
            end
            object Label3: TLabel
              Left = 16
              Top = 122
              Width = 161
              Height = 13
              Caption = 'Tipo de Operação (Contábil)'
            end
            object mskContaDebito: TMaskEdit
              Left = 16
              Top = 20
              Width = 129
              Height = 21
              TabOrder = 0
              OnExit = mskContaDebitoExit
            end
            object btnBuscaContaDebito: TBitBtn
              Left = 144
              Top = 19
              Width = 23
              Height = 22
              Hint = 'Busca um Locatário'
              TabOrder = 1
              OnClick = btnBuscaContaDebitoClick
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
            object DBcboSubContaD: TwwDBLookupCombo
              Left = 16
              Top = 58
              Width = 322
              Height = 21
              DropDownAlignment = taLeftJustify
              Selected.Strings = (
                'NOMESUBCONTA'#9'20'#9'NOMESUBCONTA')
              DataField = 'CODSUBCONTAD'
              DataSource = ds
              LookupTable = qryLookSubConta
              LookupField = 'CODSUBCONTA'
              Style = csDropDownList
              DropDownWidth = 8
              Enabled = False
              TabOrder = 2
              AutoDropDown = True
              ShowButton = True
              UseTFields = False
              AllowClearKey = False
            end
            object DBcboCentroCustoD: TwwDBLookupCombo
              Left = 16
              Top = 96
              Width = 322
              Height = 21
              DropDownAlignment = taLeftJustify
              Selected.Strings = (
                'NOME'#9'30'#9'NOME')
              DataField = 'CENCUSTDINVEST'
              DataSource = ds
              LookupTable = qryLookCentroCusto
              LookupField = 'CODCENTROCUSTO'
              Style = csDropDownList
              DropDownWidth = 8
              Enabled = False
              TabOrder = 3
              AutoDropDown = True
              ShowButton = True
              UseTFields = False
              AllowClearKey = False
            end
            object DBcboTipOper: TwwDBLookupCombo
              Left = 16
              Top = 136
              Width = 321
              Height = 21
              DropDownAlignment = taLeftJustify
              Selected.Strings = (
                'TIPDESCRICAO'#9'25'#9'TIPDESCRICAO')
              DataField = 'TIPCODIGO'
              DataSource = ds
              LookupTable = qryLookTipOper
              LookupField = 'TIPCODIGO'
              Style = csDropDownList
              DropDownCount = 4
              DropDownWidth = 8
              TabOrder = 4
              AutoDropDown = True
              ShowButton = True
              AllowClearKey = False
            end
          end
          object tbsCredito: TTabSheet
            Caption = 'Crédito'
            object Label5: TLabel
              Left = 16
              Top = 6
              Width = 84
              Height = 13
              Caption = 'Conta Contábil'
            end
            object Label7: TLabel
              Left = 16
              Top = 44
              Width = 56
              Height = 13
              Caption = 'SubConta'
            end
            object Label10: TLabel
              Left = 16
              Top = 82
              Width = 92
              Height = 13
              Caption = 'Centro de Custo'
            end
            object lblContaCredito: TLabel
              Left = 176
              Top = 24
              Width = 153
              Height = 13
              AutoSize = False
              Caption = 'Conta Contábil'
            end
            object Label13: TLabel
              Left = 16
              Top = 122
              Width = 161
              Height = 13
              Caption = 'Tipo de Operação (Contábil)'
            end
            object mskContaCredito: TMaskEdit
              Left = 16
              Top = 20
              Width = 129
              Height = 21
              TabOrder = 0
              OnExit = mskContaCreditoExit
            end
            object btnBuscaContaCredito: TBitBtn
              Left = 144
              Top = 19
              Width = 23
              Height = 22
              Hint = 'Busca um Locatário'
              TabOrder = 1
              OnClick = btnBuscaContaCreditoClick
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
            object DBcboSubContaC: TwwDBLookupCombo
              Left = 16
              Top = 58
              Width = 322
              Height = 21
              DropDownAlignment = taLeftJustify
              Selected.Strings = (
                'NOMESUBCONTA'#9'20'#9'NOMESUBCONTA')
              DataField = 'CODSUBCONTAC'
              DataSource = ds
              LookupTable = qryLookSubConta
              LookupField = 'CODSUBCONTA'
              Style = csDropDownList
              DropDownWidth = 8
              Enabled = False
              TabOrder = 2
              AutoDropDown = True
              ShowButton = True
              UseTFields = False
              AllowClearKey = False
            end
            object DBcboCentroCustoC: TwwDBLookupCombo
              Left = 16
              Top = 96
              Width = 322
              Height = 21
              DropDownAlignment = taLeftJustify
              Selected.Strings = (
                'NOME'#9'30'#9'NOME')
              DataField = 'CENCUSTCINVEST'
              DataSource = ds
              LookupTable = qryLookCentroCusto
              LookupField = 'CODCENTROCUSTO'
              Style = csDropDownList
              DropDownWidth = 8
              Enabled = False
              TabOrder = 3
              AutoDropDown = True
              ShowButton = True
              UseTFields = False
              AllowClearKey = False
            end
            object wwDBLookupCombo1: TwwDBLookupCombo
              Left = 16
              Top = 136
              Width = 321
              Height = 21
              DropDownAlignment = taLeftJustify
              Selected.Strings = (
                'TIPDESCRICAO'#9'25'#9'TIPDESCRICAO')
              DataField = 'TIPCODIGO'
              DataSource = ds
              LookupTable = qryLookTipOper
              LookupField = 'TIPCODIGO'
              Style = csDropDownList
              DropDownCount = 4
              DropDownWidth = 8
              TabOrder = 4
              AutoDropDown = True
              ShowButton = True
              AllowClearKey = False
            end
          end
          object tbsCAPCAR: TTabSheet
            Caption = 'CAP / CAR'
            object Label26: TLabel
              Left = 16
              Top = 44
              Width = 160
              Height = 13
              Caption = 'Centro de Responsabilidade'
            end
            object Label19: TLabel
              Left = 16
              Top = 6
              Width = 204
              Height = 13
              Caption = 'Tipo do Recebimento / Desembolso'
            end
            object DBcboCentroRespon: TwwDBLookupCombo
              Left = 16
              Top = 58
              Width = 321
              Height = 21
              DropDownAlignment = taLeftJustify
              Selected.Strings = (
                'NOME'#9'30'#9'NOME')
              DataField = 'CODCENTRORESPON'
              DataSource = ds
              LookupTable = qryLookCentroRespon
              LookupField = 'CODCENTRORESPON'
              Style = csDropDownList
              DropDownCount = 6
              DropDownWidth = 8
              TabOrder = 1
              AutoDropDown = False
              ShowButton = True
              AllowClearKey = False
            end
            object DBcboTipoRecDes: TwwDBLookupCombo
              Left = 16
              Top = 20
              Width = 321
              Height = 21
              DropDownAlignment = taLeftJustify
              Selected.Strings = (
                'DESCRICAO'#9'26'#9'DESCRICAO'
                'CODTIPRECDES'#9'11'#9'CODTIPRECDES')
              DataField = 'CODTIPRECDES'
              DataSource = ds
              LookupTable = qryLookTipoRecDes
              LookupField = 'CODTIPRECDES'
              Style = csDropDownList
              DropDownCount = 4
              DropDownWidth = 8
              TabOrder = 0
              AutoDropDown = True
              ShowButton = True
              AllowClearKey = False
            end
          end
        end
        object DBcboForCli: TwwDBLookupCombo
          Left = 392
          Top = 92
          Width = 321
          Height = 21
          DropDownAlignment = taLeftJustify
          Selected.Strings = (
            'NOME'#9'60'#9'NOME')
          DataField = 'IDFORCLI'
          DataSource = ds
          LookupField = 'IDPESSOA'
          Style = csDropDownList
          DropDownWidth = 8
          TabOrder = 3
          AutoDropDown = True
          ShowButton = True
          AllowClearKey = True
        end
        object DBgrdHistorico: TwwDBGrid
          Left = 392
          Top = 152
          Width = 321
          Height = 128
          Selected.Strings = (
            'HISTLANCINVEST'#9'42'#9'Histórico'
            'TIPCODIGO'#9'5'#9'Código')
          IniAttributes.Delimiter = ';;'
          TitleColor = clBtnFace
          FixedCols = 0
          ShowHorzScrollBar = True
          DataSource = ds
          KeyOptions = []
          Options = [dgTitles, dgIndicator, dgColumnResize, dgColLines, dgRowLines, dgTabs, dgRowSelect, dgAlwaysShowSelection, dgConfirmDelete, dgCancelOnExit, dgWordWrap, dgPerfectRowFit]
          TabOrder = 5
          TitleAlignment = taLeftJustify
          TitleFont.Charset = DEFAULT_CHARSET
          TitleFont.Color = clWindowText
          TitleFont.Height = -9
          TitleFont.Name = 'MS Sans Serif'
          TitleFont.Style = [fsBold]
          TitleLines = 1
          TitleButtons = False
          OnCalcCellColors = DBgrdHistoricoCalcCellColors
          OnDblClick = sbtnAlterarClick
          IndicatorColor = icBlack
          OnTopRowChanged = DBgrdHistoricoTopRowChanged
        end
        object DBcboTipoImovel: TwwDBLookupCombo
          Left = 392
          Top = 52
          Width = 321
          Height = 21
          DropDownAlignment = taLeftJustify
          Selected.Strings = (
            'DESCTIPOIMOVEL'#9'38'#9'Tipo do Imóvel')
          DataField = 'CODTIPTITULO'
          DataSource = ds
          LookupTable = qryLookTipoImovel
          LookupField = 'CODTIPIMOVEL'
          Style = csDropDownList
          DropDownWidth = 8
          TabOrder = 2
          AutoDropDown = True
          ShowButton = True
          AllowClearKey = True
        end
        object DBcboDespesa: TwwDBLookupCombo
          Left = 12
          Top = 52
          Width = 361
          Height = 21
          DropDownAlignment = taLeftJustify
          Selected.Strings = (
            'DESCTIPODESPINV'#9'35'#9'Despesa')
          DataField = 'IDTIPODESPINVEST'
          DataSource = ds
          LookupTable = qryLookDespXTipoOper
          LookupField = 'IDTIPODESPINVEST'
          Style = csDropDownList
          TabOrder = 0
          AutoDropDown = True
          ShowButton = True
          AllowClearKey = True
          OnCloseUp = DBcboDespesaCloseUp
        end
      end
    end
    object DBcboTipoOperacao: TwwDBLookupCombo
      Left = 16
      Top = 24
      Width = 353
      Height = 21
      DropDownAlignment = taLeftJustify
      Selected.Strings = (
        'DESCTIPOOPERACAO'#9'60'#9'DESCTIPOOPERACAO')
      LookupTable = qryLookTipoOperacao
      LookupField = 'IDTIPOOPERACAO'
      Style = csDropDownList
      DropDownWidth = 8
      TabOrder = 0
      AutoDropDown = True
      ShowButton = True
      AllowClearKey = False
      ShowMatchText = True
      OnCloseUp = DBcboTipoOperacaoCloseUp
    end
    object rdgRecPag: TDBRadioGroup
      Left = 448
      Top = 8
      Width = 281
      Height = 37
      Columns = 2
      DataField = 'RECPAG'
      Items.Strings = (
        'a Pagar'
        'a Receber')
      ReadOnly = True
      TabOrder = 1
      Values.Strings = (
        'P'
        'R')
    end
  end
  inherited Dock971: TDock97
    Top = 370
    Width = 746
    inherited tb97Fundo: TToolbar97
      Left = 367
    end
    inherited TB97oKCancelar: TToolbar97
      inherited bbtnConfirmar: TBitBtn
        OnClick = bbtnConfirmarClick
      end
      inherited bbtnCancelar: TBitBtn
        OnClick = bbtnCancelarClick
      end
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
  object qryConta: TwwQuery
    DatabaseName = 'BaseDados'
    SQL.Strings = (
      'SELECT '
      '  PLANO, PLANOME, PLACONTA, PLATIPO, PLACCUST, PLASUBCONTA'
      'FROM'
      '  PLANOCONTA'
      'WHERE'
      '  ( PLANO =:PLANO )')
    ValidateWithMask = True
    Left = 656
    Top = 97
    ParamData = <
      item
        DataType = ftInteger
        Name = 'PLANO'
        ParamType = ptUnknown
      end>
    object qryContaPLANO: TFloatField
      FieldName = 'PLANO'
      Origin = 'PLANOCONTA.PLANO'
    end
    object qryContaPLACONTA: TStringField
      FieldName = 'PLACONTA'
      Origin = 'PLANOCONTA.PLACONTA'
      Size = 18
    end
    object qryContaPLANOME: TStringField
      FieldName = 'PLANOME'
      Origin = 'PLANOCONTA.PLANOME'
      Size = 40
    end
    object qryContaPLATIPO: TStringField
      FieldName = 'PLATIPO'
      Origin = 'PLANOCONTA.PLATIPO'
      Size = 1
    end
    object qryContaPLACCUST: TStringField
      FieldName = 'PLACCUST'
      Origin = '"CM.PLANOCONTA".PLACCUST'
      Size = 1
    end
    object qryContaPLASUBCONTA: TStringField
      FieldName = 'PLASUBCONTA'
      Origin = '"CM.PLANOCONTA".PLASUBCONTA'
      Size = 1
    end
  end
  object qryLookTipoRecDes: TwwQuery
    DatabaseName = 'BaseDados'
    SQL.Strings = (
      'SELECT'
      '   CODTIPRECDES, RECPAG, DESCRICAO'
      'FROM'
      '   TIPORECEBDESEMB'
      'WHERE'
      '   ( IDPESSOA =:EMPRESAPROP ) AND'
      '   ( RECPAG =:RECPAG ) AND'
      '   ( ANASINT = '#39'A'#39' )'
      'ORDER BY'
      '   DESCRICAO')
    ValidateWithMask = True
    Left = 656
    Top = 84
    ParamData = <
      item
        DataType = ftInteger
        Name = 'EMPRESAPROP'
        ParamType = ptUnknown
      end
      item
        DataType = ftString
        Name = 'RECPAG'
        ParamType = ptUnknown
      end>
    object StringField1: TStringField
      DisplayWidth = 26
      FieldName = 'DESCRICAO'
      Origin = 'TIPORECEBDESEMB.DESCRICAO'
      Size = 35
    end
    object StringField2: TStringField
      DisplayWidth = 11
      FieldName = 'CODTIPRECDES'
      Origin = 'TIPORECEBDESEMB.CODTIPRECDES'
      Size = 15
    end
    object StringField3: TStringField
      DisplayWidth = 1
      FieldName = 'RECPAG'
      Origin = 'TIPORECEBDESEMB.RECPAG'
      Visible = False
      Size = 1
    end
  end
  object qryLookCentroCusto: TwwQuery
    DatabaseName = 'BaseDados'
    SQL.Strings = (
      'SELECT'
      '   X.CODCENTROCUSTO, C.NOME'
      'FROM'
      '   CONTASXCC X, CENTCUST C'
      'WHERE'
      '   ('
      '   ( X.PLANO =:PLANO ) AND'
      '   ( RTRIM(X.PLACONTA) =:CONTA ) AND'
      '   ( X.IDEMPRESA =:EMPRESAPROP )'
      '   )'
      '   AND'
      '   ('
      '   ( C.CODCENTROCUSTO = X.CODCENTROCUSTO )'
      '   )'
      'ORDER BY'
      '   C.NOME')
    ValidateWithMask = True
    Left = 656
    Top = 72
    ParamData = <
      item
        DataType = ftInteger
        Name = 'PLANO'
        ParamType = ptUnknown
      end
      item
        DataType = ftString
        Name = 'CONTA'
        ParamType = ptUnknown
      end
      item
        DataType = ftInteger
        Name = 'EMPRESAPROP'
        ParamType = ptUnknown
      end>
    object StringField6: TStringField
      DisplayWidth = 30
      FieldName = 'NOME'
      Origin = 'CENTCUST.NOME'
      Size = 30
    end
    object StringField7: TStringField
      DisplayWidth = 10
      FieldName = 'CODCENTROCUSTO'
      Origin = 'CENTCUST.CODCENTROCUSTO'
      Visible = False
      Size = 10
    end
  end
  object qryLookSubConta: TwwQuery
    DatabaseName = 'BaseDados'
    SQL.Strings = (
      'SELECT'
      '   CODSUBCONTA, NOMESUBCONTA'
      'FROM'
      '   SUBCONTA'
      'WHERE'
      '   IDPESSOA =:EMPRESAPROP'
      'ORDER BY'
      '   NOMESUBCONTA')
    ValidateWithMask = True
    Left = 656
    Top = 60
    ParamData = <
      item
        DataType = ftInteger
        Name = 'EMPRESAPROP'
        ParamType = ptUnknown
      end>
  end
  object qryLookCentroRespon: TwwQuery
    DatabaseName = 'BaseDados'
    SQL.Strings = (
      'SELECT'
      '   CODCENTRORESPON, NOME'
      'FROM'
      '   CENTRESPON'
      'WHERE'
      '   ( IDPESSOA =:EMPRESAPROP ) AND'
      '   ( ANALITICOSINTET = '#39'A'#39' )'
      'ORDER BY'
      '   NOME')
    ValidateWithMask = True
    Left = 656
    Top = 48
    ParamData = <
      item
        DataType = ftInteger
        Name = 'EMPRESAPROP'
        ParamType = ptUnknown
      end>
    object qryLookCentroResponNOME: TStringField
      DisplayWidth = 30
      FieldName = 'NOME'
      Origin = 'CENTRESPON.NOME'
      Size = 30
    end
    object qryLookCentroResponCODCENTRORESPON: TStringField
      DisplayWidth = 10
      FieldName = 'CODCENTRORESPON'
      Origin = 'CENTRESPON.CODCENTRORESPON'
      Visible = False
      Size = 10
    end
  end
  object qryLookUnidNegocio: TwwQuery
    DatabaseName = 'BaseDados'
    SQL.Strings = (
      'SELECT'
      '   UNIDNEGOC, NOME'
      'FROM'
      '   UNIDNEGOCIO'
      'WHERE'
      '   ( IDPESSOA =:EMPRESAPROP ) AND'
      '   ( UNETIPO = '#39'A'#39' )'
      'ORDER BY'
      '  NOME')
    ValidateWithMask = True
    Left = 656
    Top = 36
    ParamData = <
      item
        DataType = ftInteger
        Name = 'EMPRESAPROP'
        ParamType = ptUnknown
      end>
    object qryLookUnidNegocioNOME: TStringField
      DisplayWidth = 25
      FieldName = 'NOME'
      Origin = 'UNIDNEGOCIO.NOME'
      Size = 25
    end
    object qryLookUnidNegocioUNIDNEGOC: TFloatField
      DisplayWidth = 10
      FieldName = 'UNIDNEGOC'
      Origin = 'UNIDNEGOCIO.UNIDNEGOC'
      Visible = False
    end
  end
  object qry: TwwQuery
    CachedUpdates = True
    BeforeEdit = qryBeforeEdit
    AfterScroll = qryAfterScroll
    DatabaseName = 'BaseDados'
    SQL.Strings = (
      'SELECT'
      '   IDPADRLANCCONT,'
      '   IDTIPOINVEST, IDTIPOOPERACAO, IDTIPODESPINVEST,'
      '   IDCARTEIRAINVEST, CODTIPTITULO, IDFORCLI,'
      '   TIPLANCINVEST, TIPMOVCARTINV, RECPAG, IDPESSOA,'
      '   CODTIPRECDES, HISTLANCINVEST, FLGPAGRECNAO, '
      '   PLANO, CONTADOPERFIN, CONTACOPERFIN, IDEMPRESA,'
      '   CENCUSTDINVEST, CENCUSTCINVEST, CODSUBCONTAD,'
      '   CODSUBCONTAC,'
      '   CODCENTRORESPON, UNIDNEGOC, '
      '   TIPCODIGO'
      'FROM'
      '   PADRLANCCONTINV'
      'WHERE'
      '   ( IDTIPOINVEST =:INVEST ) AND'
      '   ( IDTIPOOPERACAO =:OPER )'
      'ORDER BY'
      '   HISTLANCINVEST')
    UpdateObject = upd
    ValidateWithMask = True
    Left = 296
    Top = 18
    ParamData = <
      item
        DataType = ftInteger
        Name = 'INVEST'
        ParamType = ptUnknown
      end
      item
        DataType = ftInteger
        Name = 'OPER'
        ParamType = ptUnknown
      end>
    object qryHISTLANCINVEST: TStringField
      DisplayLabel = 'Histórico'
      DisplayWidth = 42
      FieldName = 'HISTLANCINVEST'
      Origin = 'PADRLANCCONTINV.HISTLANCINVEST'
      Size = 60
    end
    object qryTIPCODIGO: TStringField
      DisplayLabel = 'Código'
      DisplayWidth = 5
      FieldName = 'TIPCODIGO'
      Origin = 'PADRLANCCONTINV.TIPCODIGO'
      Size = 2
    end
    object qryIDPADRLANCCONT: TFloatField
      FieldName = 'IDPADRLANCCONT'
      Origin = 'PADRLANCCONTINV.IDPADRLANCCONT'
      Visible = False
    end
    object qryIDTIPOINVEST: TFloatField
      FieldName = 'IDTIPOINVEST'
      Origin = 'PADRLANCCONTINV.IDTIPOINVEST'
      Visible = False
    end
    object qryIDTIPOOPERACAO: TFloatField
      FieldName = 'IDTIPOOPERACAO'
      Origin = 'PADRLANCCONTINV.IDTIPOOPERACAO'
      Visible = False
    end
    object qryIDTIPODESPINVEST: TFloatField
      FieldName = 'IDTIPODESPINVEST'
      Origin = 'PADRLANCCONTINV.IDTIPODESPINVEST'
      Visible = False
    end
    object qryIDCARTEIRAINVEST: TFloatField
      FieldName = 'IDCARTEIRAINVEST'
      Origin = 'PADRLANCCONTINV.IDCARTEIRAINVEST'
      Visible = False
    end
    object qryCODTIPTITULO: TStringField
      FieldName = 'CODTIPTITULO'
      Origin = 'PADRLANCCONTINV.CODTIPTITULO'
      Visible = False
      Size = 5
    end
    object qryIDFORCLI: TFloatField
      FieldName = 'IDFORCLI'
      Origin = 'PADRLANCCONTINV.IDFORCLI'
      Visible = False
    end
    object qryTIPLANCINVEST: TStringField
      FieldName = 'TIPLANCINVEST'
      Origin = 'PADRLANCCONTINV.TIPLANCINVEST'
      Visible = False
      Size = 1
    end
    object qryTIPMOVCARTINV: TStringField
      FieldName = 'TIPMOVCARTINV'
      Origin = 'PADRLANCCONTINV.TIPMOVCARTINV'
      Visible = False
      Size = 3
    end
    object qryRECPAG: TStringField
      FieldName = 'RECPAG'
      Origin = 'PADRLANCCONTINV.RECPAG'
      Visible = False
      Size = 1
    end
    object qryIDPESSOA: TFloatField
      FieldName = 'IDPESSOA'
      Origin = 'PADRLANCCONTINV.IDPESSOA'
      Visible = False
    end
    object qryCODTIPRECDES: TStringField
      FieldName = 'CODTIPRECDES'
      Origin = 'PADRLANCCONTINV.CODTIPRECDES'
      Visible = False
      Size = 15
    end
    object qryFLGPAGRECNAO: TStringField
      FieldName = 'FLGPAGRECNAO'
      Origin = 'PADRLANCCONTINV.FLGPAGRECNAO'
      Visible = False
      Size = 1
    end
    object qryPLANO: TFloatField
      FieldName = 'PLANO'
      Origin = 'PADRLANCCONTINV.PLANO'
      Visible = False
    end
    object qryCONTADOPERFIN: TStringField
      FieldName = 'CONTADOPERFIN'
      Origin = 'PADRLANCCONTINV.CONTADOPERFIN'
      Visible = False
      Size = 18
    end
    object qryCONTACOPERFIN: TStringField
      FieldName = 'CONTACOPERFIN'
      Origin = 'PADRLANCCONTINV.CONTACOPERFIN'
      Visible = False
      Size = 18
    end
    object qryIDEMPRESA: TFloatField
      FieldName = 'IDEMPRESA'
      Origin = 'PADRLANCCONTINV.IDEMPRESA'
      Visible = False
    end
    object qryCENCUSTDINVEST: TStringField
      FieldName = 'CENCUSTDINVEST'
      Origin = 'PADRLANCCONTINV.CENCUSTDINVEST'
      Visible = False
      Size = 10
    end
    object qryCENCUSTCINVEST: TStringField
      FieldName = 'CENCUSTCINVEST'
      Origin = 'PADRLANCCONTINV.CENCUSTCINVEST'
      Visible = False
      Size = 10
    end
    object qryCODSUBCONTAD: TFloatField
      FieldName = 'CODSUBCONTAD'
      Origin = 'PADRLANCCONTINV.CODSUBCONTAD'
      Visible = False
    end
    object qryCODSUBCONTAC: TFloatField
      FieldName = 'CODSUBCONTAC'
      Origin = 'PADRLANCCONTINV.CODSUBCONTAC'
      Visible = False
    end
    object qryCODCENTRORESPON: TStringField
      FieldName = 'CODCENTRORESPON'
      Origin = 'PADRLANCCONTINV.CODCENTRORESPON'
      Visible = False
      Size = 10
    end
    object qryUNIDNEGOC: TFloatField
      FieldName = 'UNIDNEGOC'
      Origin = 'PADRLANCCONTINV.UNIDNEGOC'
      Visible = False
    end
  end
  object upd: TUpdateSQL
    ModifySQL.Strings = (
      'update PADRLANCCONTINV'
      'set'
      '  IDPADRLANCCONT = :IDPADRLANCCONT,'
      '  IDTIPOINVEST = :IDTIPOINVEST,'
      '  IDTIPOOPERACAO = :IDTIPOOPERACAO,'
      '  IDTIPODESPINVEST = :IDTIPODESPINVEST,'
      '  IDCARTEIRAINVEST = :IDCARTEIRAINVEST,'
      '  CODTIPTITULO = :CODTIPTITULO,'
      '  IDFORCLI = :IDFORCLI,'
      '  TIPLANCINVEST = :TIPLANCINVEST,'
      '  TIPMOVCARTINV = :TIPMOVCARTINV,'
      '  RECPAG = :RECPAG,'
      '  IDPESSOA = :IDPESSOA,'
      '  CODTIPRECDES = :CODTIPRECDES,'
      '  HISTLANCINVEST = :HISTLANCINVEST,'
      '  FLGPAGRECNAO = :FLGPAGRECNAO,'
      '  PLANO = :PLANO,'
      '  CONTADOPERFIN = :CONTADOPERFIN,'
      '  CONTACOPERFIN = :CONTACOPERFIN,'
      '  IDEMPRESA = :IDEMPRESA,'
      '  CENCUSTDINVEST = :CENCUSTDINVEST,'
      '  CENCUSTCINVEST = :CENCUSTCINVEST,'
      '  CODSUBCONTAD = :CODSUBCONTAD,'
      '  CODSUBCONTAC = :CODSUBCONTAC,'
      '  CODCENTRORESPON = :CODCENTRORESPON,'
      '  UNIDNEGOC = :UNIDNEGOC,'
      '  TIPCODIGO = :TIPCODIGO'
      'where'
      '  IDPADRLANCCONT = :OLD_IDPADRLANCCONT')
    InsertSQL.Strings = (
      'insert into PADRLANCCONTINV'
      
        '  (IDPADRLANCCONT, IDTIPOINVEST, IDTIPOOPERACAO, IDTIPODESPINVES' +
        'T, IDCARTEIRAINVEST, '
      
        '   CODTIPTITULO, IDFORCLI, TIPLANCINVEST, TIPMOVCARTINV, RECPAG,' +
        ' IDPESSOA, '
      
        '   CODTIPRECDES, HISTLANCINVEST, FLGPAGRECNAO, PLANO, CONTADOPER' +
        'FIN, CONTACOPERFIN, '
      
        '   IDEMPRESA, CENCUSTDINVEST, CENCUSTCINVEST, CODSUBCONTAD, CODS' +
        'UBCONTAC, '
      '   CODCENTRORESPON, UNIDNEGOC, TIPCODIGO)'
      'values'
      
        '  (:IDPADRLANCCONT, :IDTIPOINVEST, :IDTIPOOPERACAO, :IDTIPODESPI' +
        'NVEST, '
      
        '   :IDCARTEIRAINVEST, :CODTIPTITULO, :IDFORCLI, :TIPLANCINVEST, ' +
        ':TIPMOVCARTINV, '
      
        '   :RECPAG, :IDPESSOA, :CODTIPRECDES, :HISTLANCINVEST, :FLGPAGRE' +
        'CNAO, :PLANO, '
      
        '   :CONTADOPERFIN, :CONTACOPERFIN, :IDEMPRESA, :CENCUSTDINVEST, ' +
        ':CENCUSTCINVEST, '
      
        '   :CODSUBCONTAD, :CODSUBCONTAC, :CODCENTRORESPON, :UNIDNEGOC, :' +
        'TIPCODIGO)')
    DeleteSQL.Strings = (
      'delete from PADRLANCCONTINV'
      'where'
      '  IDPADRLANCCONT = :OLD_IDPADRLANCCONT')
    Left = 264
    Top = 18
  end
  object ds: TwwDataSource
    DataSet = qry
    Left = 328
    Top = 18
  end
  object qryLookDespXTipoOper: TwwQuery
    CachedUpdates = True
    DatabaseName = 'BaseDados'
    SQL.Strings = (
      'SELECT'
      '   X.IDTIPOINVEST, X.IDTIPOOPERACAO, X.IDTIPODESPINVEST,'
      '   X.IDREGRACALCDESP, X.IDREGRADATAVENC, X.FLGCALCDIARIO,'
      '   X.FLGGERACONTAB, X.FLGGERACAPCAR, X.RECPAG,'
      '   D.DESCTIPODESPINV, D.NATUREZAOPERACAO'
      'FROM'
      '   DESPESASXTIPOOPER X, TIPODESPINVEST D'
      'WHERE'
      '   ('
      '   ( IDTIPOINVEST =:INVEST ) AND'
      '   ( IDTIPOOPERACAO =:OPER )'
      '   )'
      '   AND'
      '   ( X.IDTIPODESPINVEST = D.IDTIPODESPINVEST )'
      'ORDER BY'
      '   D.DESCTIPODESPINV')
    ValidateWithMask = True
    Left = 656
    Top = 24
    ParamData = <
      item
        DataType = ftInteger
        Name = 'INVEST'
        ParamType = ptUnknown
      end
      item
        DataType = ftInteger
        Name = 'OPER'
        ParamType = ptUnknown
      end>
    object StringField8: TStringField
      DisplayLabel = 'Despesa'
      DisplayWidth = 35
      FieldName = 'DESCTIPODESPINV'
      Origin = '"CM.TIPODESPINVEST".DESCTIPODESPINV'
      Size = 60
    end
    object FloatField2: TFloatField
      FieldName = 'IDTIPOINVEST'
      Origin = 'DESPESASXTIPOOPER.IDTIPOINVEST'
      Visible = False
    end
    object FloatField3: TFloatField
      FieldName = 'IDTIPOOPERACAO'
      Origin = 'DESPESASXTIPOOPER.IDTIPOOPERACAO'
      Visible = False
    end
    object FloatField4: TFloatField
      FieldName = 'IDTIPODESPINVEST'
      Origin = 'DESPESASXTIPOOPER.IDTIPODESPINVEST'
      Visible = False
    end
    object FloatField5: TFloatField
      FieldName = 'IDREGRACALCDESP'
      Origin = 'DESPESASXTIPOOPER.IDREGRACALCDESP'
      Visible = False
    end
    object FloatField6: TFloatField
      FieldName = 'IDREGRADATAVENC'
      Origin = 'DESPESASXTIPOOPER.IDREGRADATAVENC'
      Visible = False
    end
    object FloatField7: TFloatField
      FieldName = 'FLGCALCDIARIO'
      Origin = 'DESPESASXTIPOOPER.FLGCALCDIARIO'
      Visible = False
    end
    object FloatField8: TFloatField
      FieldName = 'FLGGERACONTAB'
      Origin = 'DESPESASXTIPOOPER.FLGGERACONTAB'
      Visible = False
    end
    object FloatField9: TFloatField
      FieldName = 'FLGGERACAPCAR'
      Origin = 'DESPESASXTIPOOPER.FLGGERACAPCAR'
      Visible = False
    end
    object qryLookDespXTipoOperNATUREZAOPERACAO: TStringField
      FieldName = 'NATUREZAOPERACAO'
      Origin = 'TIPODESPINVEST.NATUREZAOPERACAO'
      Visible = False
      Size = 1
    end
    object qryLookDespXTipoOperRECPAG: TStringField
      FieldName = 'RECPAG'
      Origin = 'DESPESASXTIPOOPER.RECPAG'
      Size = 1
    end
  end
  object MontaSelectConta: TMontaSelect
    Template.IdConsulta = 0
    Caption = 'Seleciona'
    Colunas.Strings = (
      'PLANOCONTA.PLACONTA'
      'PLANOCONTA.PLANOME'
      'PLANOCONTA.PLAREDUZ')
    TipodeDado.Strings = (
      'C'
      'C'
      'N')
    Descricao.Strings = (
      'Código'
      'Nome'
      'Código Reduzido')
    SensivelACaixa.Strings = (
      'N'
      'N'
      'N')
    Tabelas.Strings = (
      'PLANOCONTA')
    CamposChave.Strings = (
      'PLANOCONTA.PLACONTA'
      'PLANOCONTA.PLANOME'
      'PLANOCONTA.PLASUBCONTA'
      'PLANOCONTA.PLACCUST')
    Filtro.Strings = (
      'PLANOCONTA.PLATIPO = '#39'A'#39)
    Mascaras.Strings = (
      ''
      ''
      '')
    Larguras.Strings = (
      '18'
      '40'
      '10')
    DataBaseName = 'BaseDados'
    RepeteConsulta = False
    UsaDistinct = False
    SalvaConsulta = False
    ExibePergunta = True
    Left = 192
    Top = 18
  end
  object qryLookTipoImovel: TwwQuery
    CachedUpdates = True
    DatabaseName = 'BaseDados'
    SQL.Strings = (
      'SELECT'
      '   CODTIPIMOVEL, DESCTIPOIMOVEL   '
      'FROM '
      '   TIPOIMOVEL'
      'ORDER BY'
      '   DESCTIPOIMOVEL')
    ValidateWithMask = True
    Left = 656
    Top = 12
    object qryCODTIPIMOVEL: TStringField
      DisplayLabel = 'Código'
      DisplayWidth = 6
      FieldName = 'CODTIPIMOVEL'
      Origin = 'TIPOIMOVEL.CODTIPIMOVEL'
      Visible = False
      Size = 5
    end
    object qryLookTipoImovelDESCTIPOIMOVEL: TStringField
      FieldName = 'DESCTIPOIMOVEL'
      Origin = 'TIPOIMOVEL.DESCTIPOIMOVEL'
      Size = 25
    end
  end
  object qryLookTipOper: TwwQuery
    DatabaseName = 'BaseDados'
    SQL.Strings = (
      'SELECT'
      '   TIPCODIGO, TIPDESCRICAO'
      'FROM'
      '   TIPOPER'
      'ORDER BY'
      '   TIPDESCRICAO')
    ValidateWithMask = True
    Left = 656
    object qryLookTipOperTIPDESCRICAO: TStringField
      DisplayWidth = 25
      FieldName = 'TIPDESCRICAO'
      Origin = 'TIPOPER.TIPDESCRICAO'
      Size = 25
    end
    object qryLookTipOperTIPCODIGO: TStringField
      DisplayWidth = 2
      FieldName = 'TIPCODIGO'
      Origin = 'TIPOPER.TIPCODIGO'
      Visible = False
      Size = 2
    end
  end
  object qryVerificaConta: TwwQuery
    DatabaseName = 'BaseDados'
    SQL.Strings = (
      'SELECT'
      '   PLACONTA, PLANOME, PLASUBCONTA, PLACCUST'
      'FROM'
      '  PLANOCONTA'
      'WHERE'
      '  ( PLANO =:PLANO ) AND'
      '  ( RTRIM(PLACONTA) =:CONTA ) AND'
      '  ( PLATIPO = '#39'A'#39')'
      '')
    ValidateWithMask = True
    Left = 488
    Top = 44
    ParamData = <
      item
        DataType = ftInteger
        Name = 'PLANO'
        ParamType = ptUnknown
      end
      item
        DataType = ftString
        Name = 'CONTA'
        ParamType = ptUnknown
      end>
  end
  object dsTipoOperacao: TwwDataSource
    DataSet = qryLookTipoOperacao
    Left = 488
    Top = 32
  end
  object qryLookTipoOperacao: TwwQuery
    CachedUpdates = True
    DatabaseName = 'BaseDados'
    SQL.Strings = (
      'SELECT'
      '   IDTIPOINVEST, IDTIPOOPERACAO, DESCTIPOOPERACAO, RECPAG, '
      '   NATUREZAOPERACAO, FLGGERACONTAB, FLGGERACAPCAR'
      'FROM'
      '   TIPOOPERACAO'
      'WHERE'
      '   IDTIPOINVEST = 3'
      'ORDER BY'
      '   DESCTIPOOPERACAO')
    ValidateWithMask = True
    Left = 488
    Top = 20
    object qryLookTipoOperacaoDESCTIPOOPERACAO: TStringField
      DisplayWidth = 60
      FieldName = 'DESCTIPOOPERACAO'
      Origin = 'TIPOOPERACAO.DESCTIPOOPERACAO'
      Size = 60
    end
    object qryLookTipoOperacaoIDTIPOINVEST: TFloatField
      DisplayWidth = 10
      FieldName = 'IDTIPOINVEST'
      Origin = 'TIPOOPERACAO.IDTIPOINVEST'
      Visible = False
    end
    object qryLookTipoOperacaoIDTIPOOPERACAO: TFloatField
      DisplayWidth = 10
      FieldName = 'IDTIPOOPERACAO'
      Origin = 'TIPOOPERACAO.IDTIPOOPERACAO'
      Visible = False
    end
    object qryLookTipoOperacaoRECPAG: TStringField
      FieldName = 'RECPAG'
      Origin = 'TIPOOPERACAO.RECPAG'
      Size = 1
    end
    object qryLookTipoOperacaoNATUREZAOPERACAO: TStringField
      FieldName = 'NATUREZAOPERACAO'
      Origin = 'TIPOOPERACAO.NATUREZAOPERACAO'
      Size = 1
    end
    object qryLookTipoOperacaoFLGGERACONTAB: TFloatField
      FieldName = 'FLGGERACONTAB'
      Origin = 'TIPOOPERACAO.FLGGERACONTAB'
    end
    object qryLookTipoOperacaoFLGGERACAPCAR: TFloatField
      FieldName = 'FLGGERACAPCAR'
      Origin = 'TIPOOPERACAO.FLGGERACAPCAR'
    end
  end
  object qryLookForCli: TwwQuery
    DatabaseName = 'BaseDados'
    SQL.Strings = (
      'SELECT'
      '   P.IDPESSOA, P.NOME,'
      '   C.IDTIPOCLIENTE'
      'FROM'
      '   PESSOA P, CLIENTEPESS C'
      'WHERE'
      '   ('
      '   ( FLGFORNSERV = 1 ) OR'
      '   ( FLGCLIENTE = 1 )'
      '   )'
      '   AND'
      '   ( P.IDPESSOA = C.IDPESSOA(+) )'
      'ORDER BY'
      '   P.NOME')
    ValidateWithMask = True
    Left = 488
    Top = 8
    object qryLookForCliNOME: TStringField
      DisplayWidth = 60
      FieldName = 'NOME'
      Origin = 'PESSOA.NOME'
      Size = 60
    end
    object qryLookForCliIDPESSOA: TFloatField
      FieldName = 'IDPESSOA'
      Origin = 'PESSOA.IDPESSOA'
      Visible = False
    end
  end
end
