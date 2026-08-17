inherited FrmExecLiberaSuspensao: TFrmExecLiberaSuspensao
  Left = 24
  Top = 87
  HelpContext = 150036
  BorderIcons = [biSystemMenu, biMaximize]
  BorderStyle = bsSingle
  Caption = 'Liberação de Suspensão'
  ClientHeight = 432
  ClientWidth = 763
  PixelsPerInch = 96
  TextHeight = 13
  inherited pnlFundo: TPanel
    Width = 763
    Height = 399
    object lblTitulo: TfcLabel
      Left = 16
      Top = 8
      Width = 251
      Height = 24
      Caption = 'Liberação de Suspensão'
      Color = clBtnFace
      Font.Charset = ANSI_CHARSET
      Font.Color = clNavy
      Font.Height = -21
      Font.Name = 'Arial'
      Font.Style = [fsBold]
      ParentColor = False
      ParentFont = False
      TextOptions.Alignment = taLeftJustify
      TextOptions.Style = fclsRaised
      TextOptions.VAlignment = vaTop
    end
    object ntbPrincipal: TNotebook
      Left = 0
      Top = 33
      Width = 763
      Height = 366
      Align = alBottom
      TabOrder = 0
      object TPage
        Left = 0
        Top = 0
        Caption = 'Selecao'
        object Label5: TLabel
          Left = 376
          Top = 58
          Width = 96
          Height = 13
          Caption = 'Tipo de Contrato'
        end
        object Label1: TLabel
          Left = 16
          Top = 98
          Width = 110
          Height = 13
          Caption = 'Tipo de Suspensão'
        end
        object Label7: TLabel
          Left = 16
          Top = 58
          Width = 112
          Height = 13
          Caption = 'Tipo de Empréstimo'
        end
        object btnContinuaSelecao: TfcShapeBtn
          Left = 656
          Top = 320
          Width = 89
          Height = 29
          Caption = 'Continuar'
          Color = clBtnFace
          DitherColor = clWhite
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'MS Sans Serif'
          Font.Style = [fsBold]
          Glyph.Data = {
            76010000424D7601000000000000760000002800000020000000100000000100
            0400000000000001000000000000000000001000000010000000000000000000
            8000008000000080800080000000800080008080000080808000C0C0C0000000
            FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00888888888888
            8888888888FFFFF8888888888000008888888888F777778FF88888800BBBBB00
            88888887788888778F88887BBBBBBBBB088888788888888878F887FBBBBBBBBB
            B08887F88888888887F887FBBBBB0BBBB088878888887F88878F7FBBBBBB00BB
            BB087F88FFFF77F8887F7FB00000000BBB087F877777777F887F7FB000000000
            BB087F8777777777887F7FB00000000BBB087F8777777778887F7FBBBBBB00BB
            BB0878F888887788887887FBBBBB0BBBB08887F88888788887F887FBBBBBBBBB
            B088878F888888888788887FFBBBBBBB08888878FF88888F788888877FFFFF77
            8888888778FFFF77888888888777778888888888877777888888}
          Layout = blGlyphRight
          NumGlyphs = 2
          Options = [boFocusable, boFocusRect]
          Offsets.GlyphY = 1
          Offsets.TextDownX = 2
          Offsets.TextDownY = 2
          ParentClipping = True
          ParentFont = False
          ParentShowHint = False
          RoundRectBias = 25
          ShadeStyle = fbsHighlight
          ShowHint = True
          TabOrder = 4
          TabStop = True
          TextOptions.Alignment = taCenter
          TextOptions.ExtrudeEffects.Depth = 4
          TextOptions.ExtrudeEffects.Orientation = fcTopRight
          TextOptions.VAlignment = vaVCenter
          OnClick = btnContinuaSelecaoClick
        end
        object DBcboTipoContrato: TwwDBLookupCombo
          Left = 376
          Top = 72
          Width = 369
          Height = 21
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'MS Sans Serif'
          Font.Style = []
          DropDownAlignment = taLeftJustify
          Selected.Strings = (
            'TCEDESCRICAO'#9'60'#9'TCEDESCRICAO'#9'F')
          LookupTable = dtmLookEmptmo.qryLookTipoContrato
          LookupField = 'IDTipoContrEmptmo'
          DropDownWidth = 8
          Enabled = False
          ParentFont = False
          TabOrder = 2
          AutoDropDown = False
          ShowButton = True
          UseTFields = False
          AllowClearKey = True
          ShowMatchText = True
          OnCloseUp = DBcboTipoContratoCloseUp
        end
        object DBcboSuspensao: TwwDBLookupCombo
          Left = 16
          Top = 112
          Width = 345
          Height = 21
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'MS Sans Serif'
          Font.Style = []
          DropDownAlignment = taLeftJustify
          Selected.Strings = (
            'TSEDESCRICAO'#9'60'#9'Descrição'#9'F')
          LookupTable = dtmLookEmptmo.qryLookTipoSusp
          LookupField = 'IDTIPOSUSPEMPTMO'
          DropDownWidth = 8
          ParentFont = False
          TabOrder = 3
          AutoDropDown = False
          ShowButton = True
          UseTFields = False
          AllowClearKey = False
          ShowMatchText = True
        end
        inline molContratoEmptmo: TmolContratoEmptmo
          Left = 8
          Top = 16
          Width = 761
          inherited Label1: TLabel
            Left = 112
          end
          inherited Label3: TLabel
            Left = 112
          end
          inherited edtNome: TEdit
            Left = 208
            Width = 478
          end
          inherited btnBuscaContrato: TBitBtn
            Left = 687
            OnClick = molContratoEmptmo1btnBuscaContratoClick
          end
          inherited btnLimpaContrato: TBitBtn
            Left = 711
            OnClick = molContratoEmptmo1btnLimpaContratoClick
          end
          inherited edtIdContrato: TEdit
            Width = 105
          end
          inherited edtMatricula: TEdit
            Left = 112
          end
        end
        object DBcboTipoEmptmo: TwwDBLookupCombo
          Left = 16
          Top = 72
          Width = 345
          Height = 21
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'MS Sans Serif'
          Font.Style = []
          DropDownAlignment = taLeftJustify
          Selected.Strings = (
            'DESCTIPOEMPTMO'#9'30'#9'Tipo de Empréstimo'#9'F')
          LookupTable = dtmLookEmptmo.qryLookTipoEmptmo
          LookupField = 'IDTIPOEMPTMO'
          DropDownWidth = 8
          ParentFont = False
          TabOrder = 1
          AutoDropDown = False
          ShowButton = True
          UseTFields = False
          AllowClearKey = True
          ShowMatchText = True
          OnCloseUp = DBcboTipoEmptmoCloseUp
          OnExit = DBcboTipoEmptmoExit
        end
      end
      object TPage
        Left = 0
        Top = 0
        Caption = 'ValoresAtualizados'
        object btnCancelaAltera: TfcShapeBtn
          Left = 576
          Top = 320
          Width = 89
          Height = 29
          Caption = 'Voltar'
          Color = clBtnFace
          DitherColor = clWhite
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'MS Sans Serif'
          Font.Style = [fsBold]
          Glyph.Data = {
            76010000424D7601000000000000760000002800000020000000100000000100
            0400000000000001000000000000000000001000000000000000000000000000
            8000008000000080800080000000800080008080000080808000C0C0C0000000
            FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00888888888888
            8888888888888888888888888000008888888888F777778FF88888800BBBBB00
            88888887788888778F88887BBBBBBBBB088888788888888878F887FBBBBBBBBB
            B08887F8888F888887F887FBBB0BBBBBB0888788887F888887887FBBB00BBBBB
            BB087F88877FFFFFF8787FBB00000000BB087F8877777777F8787FB000000000
            BB087F8777777777F8787FBB00000000BB087F887777777788787FBBB00BBBBB
            BB0878F8877F8888887887FBBB0BBBBBB08887F88878888887F887FBBBBBBBBB
            B088878F888888888788887FFBBBBBBB08888878FF88888F788888877FFFFF77
            8888888778FFFF77888888888777778888888888877777888888}
          NumGlyphs = 2
          Options = [boFocusable, boFocusRect]
          Offsets.GlyphY = 1
          Offsets.TextDownX = 2
          Offsets.TextDownY = 2
          ParentClipping = True
          ParentFont = False
          RoundRectBias = 25
          ShadeStyle = fbsHighlight
          TabOrder = 3
          TabStop = True
          TextOptions.Alignment = taCenter
          TextOptions.ExtrudeEffects.Depth = 4
          TextOptions.ExtrudeEffects.Orientation = fcTopRight
          TextOptions.VAlignment = vaVCenter
          OnClick = btnCancelaAlteraClick
        end
        object btnContinuaEncerra: TfcShapeBtn
          Left = 672
          Top = 320
          Width = 89
          Height = 29
          Caption = 'Continuar'
          Color = clBtnFace
          DitherColor = clWhite
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'MS Sans Serif'
          Font.Style = [fsBold]
          Glyph.Data = {
            76010000424D7601000000000000760000002800000020000000100000000100
            0400000000000001000000000000000000001000000010000000000000000000
            8000008000000080800080000000800080008080000080808000C0C0C0000000
            FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00888888888888
            8888888888FFFFF8888888888000008888888888F777778FF88888800BBBBB00
            88888887788888778F88887BBBBBBBBB088888788888888878F887FBBBBBBBBB
            B08887F88888888887F887FBBBBB0BBBB088878888887F88878F7FBBBBBB00BB
            BB087F88FFFF77F8887F7FB00000000BBB087F877777777F887F7FB000000000
            BB087F8777777777887F7FB00000000BBB087F8777777778887F7FBBBBBB00BB
            BB0878F888887788887887FBBBBB0BBBB08887F88888788887F887FBBBBBBBBB
            B088878F888888888788887FFBBBBBBB08888878FF88888F788888877FFFFF77
            8888888778FFFF77888888888777778888888888877777888888}
          Layout = blGlyphRight
          NumGlyphs = 2
          Options = [boFocusable, boFocusRect]
          Offsets.GlyphY = 1
          Offsets.TextDownX = 2
          Offsets.TextDownY = 2
          ParentClipping = True
          ParentFont = False
          RoundRectBias = 25
          ShadeStyle = fbsHighlight
          TabOrder = 2
          TabStop = True
          TextOptions.Alignment = taCenter
          TextOptions.ExtrudeEffects.Depth = 4
          TextOptions.ExtrudeEffects.Orientation = fcTopRight
          TextOptions.VAlignment = vaVCenter
          OnClick = btnContinuaEncerraClick
        end
        object DBgrdHistMov: TwwDBGrid
          Left = 16
          Top = 35
          Width = 729
          Height = 230
          Selected.Strings = (
            'FLGESCOLHA'#9'3'#9'Lib.'#9'F'
            'IDCONTRATOEMPTMO'#9'10'#9'Nº Contrato'#9'F'
            'NOME'#9'40'#9'Mutuário'#9'F'
            'TSEDESCRICAO'#9'40'#9'Tipo Suspensão'#9'F'
            'DATAINICIOSUSP'#9'10'#9'Início'#9'F'
            'DATAFIMSUSP'#9'10'#9'Final'#9'F')
          IniAttributes.Delimiter = ';;'
          TitleColor = clBtnFace
          FixedCols = 0
          ShowHorzScrollBar = True
          EditControlOptions = [ecoCheckboxSingleClick, ecoSearchOwnerForm]
          DataSource = dtsHistMov
          KeyOptions = []
          Options = [dgEditing, dgTitles, dgIndicator, dgColumnResize, dgColLines, dgRowLines, dgTabs, dgRowSelect, dgConfirmDelete, dgCancelOnExit, dgWordWrap, dgPerfectRowFit]
          TabOrder = 1
          TitleAlignment = taCenter
          TitleFont.Charset = DEFAULT_CHARSET
          TitleFont.Color = clWindowText
          TitleFont.Height = -9
          TitleFont.Name = 'MS Sans Serif'
          TitleFont.Style = [fsBold]
          TitleLines = 1
          TitleButtons = False
          UseTFields = False
          OnCalcCellColors = DBgrdVlrAtualizadosCalcCellColors
          IndicatorColor = icBlack
          OnTopRowChanged = DBgrdVlrAtualizadosTopRowChanged
        end
        object Panel1: TPanel
          Left = 15
          Top = 8
          Width = 730
          Height = 27
          BevelInner = bvRaised
          BevelOuter = bvLowered
          Caption = 'Contratos Suspensos'
          Color = clNavy
          Font.Charset = ANSI_CHARSET
          Font.Color = clWhite
          Font.Height = -19
          Font.Name = 'Courier New'
          Font.Style = [fsBold]
          ParentFont = False
          TabOrder = 0
          object btnInverteSelecao: TBitBtn
            Left = 675
            Top = 1
            Width = 27
            Height = 25
            Hint = 'Inverte a Seleção'
            ParentShowHint = False
            ShowHint = True
            TabOrder = 0
            OnClick = btnInverteSelecaoClick
            Glyph.Data = {
              F6000000424DF600000000000000760000002800000010000000100000000100
              0400000000008000000000000000000000001000000000000000000000000000
              8000008000000080800080000000800080008080000080808000C0C0C0000000
              FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00888888888888
              8888888888488888888888888844888888888888444448888888888444444488
              1888884444444888118884448844888881188448884888888118844888888188
              8118844888881188111888448881111111888884881111111888888888811111
              8888888888881188888888888888818888888888888888888888}
          end
          object btnMarcaTodos: TBitBtn
            Left = 702
            Top = 1
            Width = 27
            Height = 25
            Hint = 'Seleciona Todos'
            ParentShowHint = False
            ShowHint = True
            TabOrder = 1
            OnClick = btnMarcaTodosClick
            Glyph.Data = {
              D6000000424DD60000000000000076000000280000000C0000000C0000000100
              0400000000006000000000000000000000001000000000000000000000000000
              8000008000000080800080000000800080008080000080808000C0C0C0000000
              FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00888848888888
              0000888224888888000088222248888800008822822488880000882848224888
              0000888224822488000088222248228800008822822482880000882888224888
              0000888888822488000088888888228800008888888882880000}
          end
        end
        object grpCompetencia: TGroupBox
          Left = 16
          Top = 272
          Width = 369
          Height = 73
          Caption = ' Dados para Liberação '
          TabOrder = 4
          object Label15: TLabel
            Left = 16
            Top = 26
            Width = 171
            Height = 13
            Caption = 'Início de Cobrança (mês/ano)'
          end
          object Label2: TLabel
            Left = 240
            Top = 26
            Width = 88
            Height = 13
            Caption = 'Data Liberação'
          end
          object DBspnAno: TwwDBSpinEdit
            Left = 160
            Top = 40
            Width = 65
            Height = 21
            Increment = 1
            TabOrder = 0
            UnboundDataType = wwDefault
            OnExit = cboMesExit
          end
          object cboMes: TComboBox
            Left = 16
            Top = 40
            Width = 145
            Height = 21
            Style = csDropDownList
            ItemHeight = 13
            TabOrder = 1
            OnExit = cboMesExit
            Items.Strings = (
              'Janeiro'
              'Fevereiro'
              'Março'
              'Abril'
              'Maio'
              'Junho'
              'Julho'
              'Agosto'
              'Setembro'
              'Outubro'
              'Novembro'
              'Dezembro')
          end
          object edtDataLancamento: TwwDBDateTimePicker
            Left = 240
            Top = 40
            Width = 105
            Height = 21
            CalendarAttributes.Font.Charset = DEFAULT_CHARSET
            CalendarAttributes.Font.Color = clWindowText
            CalendarAttributes.Font.Height = -11
            CalendarAttributes.Font.Name = 'MS Sans Serif'
            CalendarAttributes.Font.Style = []
            ButtonStyle = cbsCustom
            Epoch = 1950
            ButtonWidth = 20
            ButtonGlyph.Data = {
              F6000000424DF600000000000000760000002800000010000000100000000100
              0400000000008000000000000000000000001000000000000000000000000000
              8000008000000080800080000000800080008080000080808000C0C0C0000000
              FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00888888888888
              88888888888888888888800000000000000880FFFFFFFFFFFF0880F878787978
              7F0880F7878797978F0880F8787879787F0880F7878787878F0880F878787878
              7F0880F7878787878F0880FFFFFFFFFFFF0880F4C4C4C7777F0880FC4C4C4777
              7F0880FFFFFFFFFFFF0880000000000000088888888888888888}
            ShowButton = True
            TabOrder = 2
            UnboundDataType = wwDTEdtDate
            DisplayFormat = 'dd/mm/yyyy'
          end
        end
      end
      object TPage
        Left = 0
        Top = 0
        Caption = 'HistoricoMovimentacao'
        object DBgrdHistMovVirtual: TwwDBGrid
          Left = 16
          Top = 35
          Width = 729
          Height = 262
          Selected.Strings = (
            'IDCONTRATOEMPTMO'#9'10'#9'Nº Contrato'#9'F'
            'NOME'#9'40'#9'Mutuário'#9'F'
            'DESCRICAO'#9'40'#9'Tipo Suspensão'#9'F'
            'DATAINICIOSUSP'#9'10'#9'Início'#9'F'
            'DATAFIMSUSP'#9'10'#9'Fim'#9'F'
            'DATALIBSUSP'#9'10'#9'Liberado'#9'F')
          IniAttributes.Delimiter = ';;'
          TitleColor = clBtnFace
          FixedCols = 0
          ShowHorzScrollBar = True
          DataSource = dtsHistMovVirtual
          KeyOptions = []
          Options = [dgTitles, dgIndicator, dgColumnResize, dgColLines, dgRowLines, dgTabs, dgRowSelect, dgAlwaysShowSelection, dgConfirmDelete, dgCancelOnExit, dgWordWrap, dgPerfectRowFit]
          TabOrder = 1
          TitleAlignment = taCenter
          TitleFont.Charset = DEFAULT_CHARSET
          TitleFont.Color = clWindowText
          TitleFont.Height = -9
          TitleFont.Name = 'MS Sans Serif'
          TitleFont.Style = [fsBold]
          TitleLines = 1
          TitleButtons = False
          UseTFields = False
          OnCalcCellColors = DBgrdVlrAtualizadosCalcCellColors
          IndicatorColor = icBlack
          OnTopRowChanged = DBgrdVlrAtualizadosTopRowChanged
        end
        object Panel4: TPanel
          Left = 15
          Top = 8
          Width = 730
          Height = 27
          BevelInner = bvRaised
          BevelOuter = bvLowered
          Caption = 'Contratos a serem Liberados'
          Color = clNavy
          Font.Charset = ANSI_CHARSET
          Font.Color = clWhite
          Font.Height = -19
          Font.Name = 'Courier New'
          Font.Style = [fsBold]
          ParentFont = False
          TabOrder = 0
        end
        object btnConfirmar: TfcShapeBtn
          Left = 656
          Top = 320
          Width = 89
          Height = 29
          Caption = 'Confirmar'
          Color = clBtnFace
          DitherColor = clWhite
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'MS Sans Serif'
          Font.Style = [fsBold]
          Glyph.Data = {
            76010000424D7601000000000000760000002800000020000000100000000100
            0400000000000001000000000000000000001000000010000000000000000000
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
          Layout = blGlyphRight
          NumGlyphs = 2
          Options = [boFocusable, boFocusRect]
          Offsets.GlyphY = 1
          Offsets.TextDownX = 2
          Offsets.TextDownY = 2
          ParentClipping = True
          ParentFont = False
          RoundRectBias = 25
          ShadeStyle = fbsHighlight
          TabOrder = 2
          TabStop = True
          TextOptions.Alignment = taCenter
          TextOptions.ExtrudeEffects.Depth = 4
          TextOptions.ExtrudeEffects.Orientation = fcTopRight
          TextOptions.VAlignment = vaVCenter
          OnClick = btnConfirmarClick
        end
        object btnVoltar: TfcShapeBtn
          Left = 560
          Top = 320
          Width = 89
          Height = 29
          Caption = 'Voltar'
          Color = clBtnFace
          DitherColor = clWhite
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'MS Sans Serif'
          Font.Style = [fsBold]
          Glyph.Data = {
            76010000424D7601000000000000760000002800000020000000100000000100
            0400000000000001000000000000000000001000000000000000000000000000
            8000008000000080800080000000800080008080000080808000C0C0C0000000
            FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00888888888888
            8888888888888888888888888000008888888888F777778FF88888800BBBBB00
            88888887788888778F88887BBBBBBBBB088888788888888878F887FBBBBBBBBB
            B08887F8888F888887F887FBBB0BBBBBB0888788887F888887887FBBB00BBBBB
            BB087F88877FFFFFF8787FBB00000000BB087F8877777777F8787FB000000000
            BB087F8777777777F8787FBB00000000BB087F887777777788787FBBB00BBBBB
            BB0878F8877F8888887887FBBB0BBBBBB08887F88878888887F887FBBBBBBBBB
            B088878F888888888788887FFBBBBBBB08888878FF88888F788888877FFFFF77
            8888888778FFFF77888888888777778888888888877777888888}
          NumGlyphs = 2
          Options = [boFocusable, boFocusRect]
          Offsets.GlyphY = 1
          Offsets.TextDownX = 2
          Offsets.TextDownY = 2
          ParentClipping = True
          ParentFont = False
          RoundRectBias = 25
          ShadeStyle = fbsHighlight
          TabOrder = 3
          TabStop = True
          TextOptions.Alignment = taCenter
          TextOptions.ExtrudeEffects.Depth = 4
          TextOptions.ExtrudeEffects.Orientation = fcTopRight
          TextOptions.VAlignment = vaVCenter
          OnClick = btnVoltarClick
        end
      end
    end
  end
  inherited Dock971: TDock97
    Top = 399
    Width = 763
    inherited tb97Fundo: TToolbar97
      Left = 591
      DockPos = 610
      inherited bbtnAjuda: TmaHelpBitBtn
        ClickHelpContext = 150025
      end
    end
  end
  object qry: TwwQuery
    CachedUpdates = True
    DatabaseName = 'BaseDados'
    SQL.Strings = (
      'SELECT'
      '  '#39'0'#39' AS FLGESCOLHA,'
      '  INS.IDINSCRICAOEMPTMO AS INSCRICAO,'
      '  PPP.INSCRICAONUMERO,'
      '  DECODE(CNT.FLGSITUACAO,'#39'A'#39','#39'Ativo'#39','
      '                         '#39'C'#39','#39'Cancelado'#39','
      '                         '#39'E'#39','#39'Encerrado'#39','
      '                         '#39'Q'#39','#39'Quitado'#39','
      '                         '#39'R'#39','#39'Refinanciado'#39','
      '                         '#39'S'#39','#39'Suspenso'#39','
      
        '                         '#39'K'#39','#39'Pendente de Quitação'#39') AS DESCSITC' +
        'ONTRATO,'
      ''
      '  SIT.IDSITPART,'
      '  SIT.DESCRICAO AS SITUACAO,'
      '  SIT.FLGINTERNO,'
      '  PLV.NOME      AS PLANOPREV,'
      '  JUR.NOME      AS PATRO,'
      '  ELP.MATRICULA,'
      '  TIT.NOME      AS TITULAR,'
      '  BEN.NOME      AS BENEFICIARIO,'
      ''
      '  TIP.TCEDESCRICAO, TIP.IDTIPOEMPTMO,'
      ''
      '  TEM.DESCTIPOEMPTMO,'
      '  INS.DATAINSC,'
      '  BAN.NOME AS BANCO,'
      '  CTB.CONTACORRENTE, AGB.NUMAGENCIA,'
      ''
      
        '  CNT.IDCONTRATOEMPTMO , CNT.IDCONTRQUITACAO, CNT.IDPESSOA      ' +
        ' , CNT.IDBENEF     ,'
      
        '  CNT.IDINSCRICAOEMPTMO, CNT.IDPLANOPREV    , CNT.IDPATRO       ' +
        ' , CNT.IDVERBA     ,'
      '  CNT.IDTIPOCONTREMPTMO, CNT.IDCBANCARIA    , CNT.NUMPARCELAS ,'
      
        '  CNT.CODFORMAPAG      , CNT.PORTFORMAPAG   , CNT.PORTFORMAREC  ' +
        ' , CNT.DATACANC    ,'
      
        '  CNT.DATACREDITO      , CNT.DATASITUACAO   , CNT.DATAASSINATURA' +
        ' , CNT.DATAPRIMPARC,'
      
        '  CNT.VLRCONTRATO      , CNT.VLRPARCELA     , CNT.TXJUROS       ' +
        ' ,'
      
        '  CNT.FLGSITUACAO      , CNT.FLGFORMAREC    , CNT.FLGFORMAPAG   ' +
        ' , CNT.MOECODIGO   ,'
      
        '  CNT.VLRSALBASE       , CNT.VLRMARGEM      , CNT.VLRMAXPERMIT  ' +
        ' ,'
      
        '  CNT.IDTIPOSUSPEMPTMO , CNT.DATAINICIOSUSP , CNT.DATAFIMSUSP   ' +
        ' , CNT.USUARIOLIBSUSP ,'
      
        '  CNT.DATALIBSUSP      , CNT.HORALIBSUSP    , CNT.IDPLANOORIGEM ' +
        ' , CNT.IDCBANCARIADEB ,'
      '  CNT.ANOSUSPENSAO     , CNT.MESSUSPENSAO   , '
      ''
      '  MOE.MOESIGLA'
      ''
      'FROM'
      '   PESSOA          JUR,'
      '   PESSOA          TIT,'
      '   PESSOA          BEN,'
      '   PESSOA          BAN,'
      '   AGENCIABANCARIA AGB,'
      '   CONTABANCARIA   CTB,'
      '   PARTPREVPLAN    PPP,'
      '   ELEGPATRO       ELP,'
      '   MOEDA           MOE,'
      '   TIPOCONTREMPTMO TIP,'
      '   TIPOEMPTMO      TEM,'
      '   SITPART         SIT,'
      '   CONTRATOEMPTMO  CNT,'
      '   INSCRICAOEMPTMO INS,'
      '   PLANPREV        PLV'
      ''
      ''
      'WHERE'
      '   CNT.IDCONTRATOEMPTMO      = :PIDCONTRATOEMPTMO'
      ''
      '   AND CNT.IDPATRO           = PPP.IDPESSJUR'
      '   AND CNT.IDPESSOA          = PPP.IDPESSOA'
      '   AND SIT.IDSITPART         = PPP.IDSITPART'
      '   AND PPP.FLGDESATIVADO     = 0 '
      '   AND CNT.IDPATRO           = JUR.IDPESSOA'
      '   AND CNT.IDPESSOA          = ELP.IDPESSOA'
      '   AND CNT.IDPATRO           = ELP.IDPESSJUR'
      '   AND CNT.IDPESSOA          = TIT.IDPESSOA'
      '   AND CNT.IDBENEF           = BEN.IDPESSOA'
      '   AND CNT.IDTIPOCONTREMPTMO = TIP.IDTIPOCONTREMPTMO'
      '   AND TIP.IDTIPOEMPTMO      = TEM.IDTIPOEMPTMO'
      '   AND CNT.IDINSCRICAOEMPTMO = INS.IDINSCRICAOEMPTMO(+)'
      '   AND INS.IDCBANCARIA       = CTB.IDCBANCARIA(+)'
      '   AND CTB.IDAGENCIA         = AGB.IDPESSOA(+)'
      '   AND AGB.IDBANCO           = BAN.IDPESSOA(+)'
      '   AND CNT.MOECODIGO         = MOE.MOECODIGO(+)'
      ' ')
    ValidateWithMask = True
    Left = 312
    ParamData = <
      item
        DataType = ftInteger
        Name = 'PIDContratoEmptmo'
        ParamType = ptInput
      end>
    object qryINSCRICAO: TFloatField
      FieldName = 'INSCRICAO'
    end
    object qryINSCRICAONUMERO: TFloatField
      FieldName = 'INSCRICAONUMERO'
    end
    object qryDESCSITCONTRATO: TStringField
      FieldName = 'DESCSITCONTRATO'
    end
    object qryIDSITPART: TFloatField
      FieldName = 'IDSITPART'
    end
    object qrySITUACAO: TStringField
      FieldName = 'SITUACAO'
      Size = 50
    end
    object qryFLGINTERNO: TStringField
      FieldName = 'FLGINTERNO'
      FixedChar = True
      Size = 2
    end
    object qryPLANOPREV: TStringField
      FieldName = 'PLANOPREV'
      Size = 50
    end
    object qryPATRO: TStringField
      FieldName = 'PATRO'
      Size = 60
    end
    object qryMATRICULA: TStringField
      FieldName = 'MATRICULA'
      Size = 13
    end
    object qryTITULAR: TStringField
      FieldName = 'TITULAR'
      Size = 60
    end
    object qryBENEFICIARIO: TStringField
      FieldName = 'BENEFICIARIO'
      Size = 60
    end
    object qryDESCTIPOEMPTMO: TStringField
      FieldName = 'DESCTIPOEMPTMO'
      Size = 60
    end
    object qryDATAINSC: TDateTimeField
      FieldName = 'DATAINSC'
    end
    object qryBANCO: TStringField
      FieldName = 'BANCO'
      Size = 60
    end
    object qryCONTACORRENTE: TStringField
      FieldName = 'CONTACORRENTE'
      Size = 15
    end
    object qryNUMAGENCIA: TStringField
      FieldName = 'NUMAGENCIA'
      FixedChar = True
      Size = 15
    end
    object qryIDCONTRQUITACAO: TFloatField
      FieldName = 'IDCONTRQUITACAO'
    end
    object qryIDPESSOA: TFloatField
      FieldName = 'IDPESSOA'
    end
    object qryIDPLANOPREV: TFloatField
      FieldName = 'IDPLANOPREV'
    end
    object qryIDPATRO: TFloatField
      FieldName = 'IDPATRO'
    end
    object qryIDVERBA: TFloatField
      FieldName = 'IDVERBA'
    end
    object qryIDBENEF: TFloatField
      FieldName = 'IDBENEF'
    end
    object qryIDCBANCARIA: TFloatField
      FieldName = 'IDCBANCARIA'
    end
    object qryCODFORMAPAG: TFloatField
      FieldName = 'CODFORMAPAG'
    end
    object qryPORTFORMAPAG: TFloatField
      FieldName = 'PORTFORMAPAG'
    end
    object qryPORTFORMAREC: TFloatField
      FieldName = 'PORTFORMAREC'
    end
    object qryNUMPARCELAS: TFloatField
      FieldName = 'NUMPARCELAS'
    end
    object qryDATACREDITO: TDateTimeField
      FieldName = 'DATACREDITO'
    end
    object qryDATASITUACAO: TDateTimeField
      FieldName = 'DATASITUACAO'
    end
    object qryDATAASSINATURA: TDateTimeField
      FieldName = 'DATAASSINATURA'
    end
    object qryDATAPRIMPARC: TDateTimeField
      FieldName = 'DATAPRIMPARC'
    end
    object qryDATACANC: TDateTimeField
      FieldName = 'DATACANC'
    end
    object qryVLRCONTRATO: TFloatField
      FieldName = 'VLRCONTRATO'
      DisplayFormat = '#,##0.00'
      EditFormat = '#,##0.00'
    end
    object qryVLRPARCELA: TFloatField
      FieldName = 'VLRPARCELA'
      DisplayFormat = '#,##0.00'
      EditFormat = '#,##0.00'
    end
    object qryTXJUROS: TFloatField
      FieldName = 'TXJUROS'
      DisplayFormat = '#,##0.0000 %'
      EditFormat = '#,##0.0000 %'
    end
    object qryFLGSITUACAO: TStringField
      FieldName = 'FLGSITUACAO'
      FixedChar = True
      Size = 1
    end
    object qryFLGFORMAREC: TStringField
      FieldName = 'FLGFORMAREC'
      FixedChar = True
      Size = 1
    end
    object qryFLGFORMAPAG: TStringField
      FieldName = 'FLGFORMAPAG'
      FixedChar = True
      Size = 1
    end
    object qryIDTIPOEMPTMO: TFloatField
      FieldName = 'IDTIPOEMPTMO'
    end
    object qryTCEDESCRICAO: TStringField
      FieldName = 'TCEDESCRICAO'
      Size = 60
    end
    object qryIDCONTRATOEMPTMO: TFloatField
      FieldName = 'IDCONTRATOEMPTMO'
    end
    object qryIDINSCRICAOEMPTMO: TFloatField
      FieldName = 'IDINSCRICAOEMPTMO'
    end
    object qryIDTIPOCONTREMPTMO: TFloatField
      FieldName = 'IDTIPOCONTREMPTMO'
    end
    object qryMOECODIGO: TFloatField
      FieldName = 'MOECODIGO'
    end
    object qryVLRSALBASE: TFloatField
      FieldName = 'VLRSALBASE'
    end
    object qryVLRMARGEM: TFloatField
      FieldName = 'VLRMARGEM'
    end
    object qryVLRMAXPERMIT: TFloatField
      FieldName = 'VLRMAXPERMIT'
    end
    object qryMOESIGLA: TStringField
      FieldName = 'MOESIGLA'
      Size = 10
    end
    object qryIDTIPOSUSPEMPTMO: TFloatField
      FieldName = 'IDTIPOSUSPEMPTMO'
    end
    object qryDATAINICIOSUSP: TDateTimeField
      FieldName = 'DATAINICIOSUSP'
    end
    object qryDATAFIMSUSP: TDateTimeField
      FieldName = 'DATAFIMSUSP'
    end
    object qryUSUARIOLIBSUSP: TStringField
      FieldName = 'USUARIOLIBSUSP'
      Size = 30
    end
    object qryDATALIBSUSP: TDateTimeField
      FieldName = 'DATALIBSUSP'
    end
    object qryHORALIBSUSP: TStringField
      FieldName = 'HORALIBSUSP'
      Size = 8
    end
    object qryFLGESCOLHA: TStringField
      FieldName = 'FLGESCOLHA'
      FixedChar = True
      Size = 1
    end
    object qryIDPLANOORIGEM: TFloatField
      FieldName = 'IDPLANOORIGEM'
    end
    object qryIDCBANCARIADEB: TFloatField
      FieldName = 'IDCBANCARIADEB'
    end
    object qryANOSUSPENSAO: TFloatField
      FieldName = 'ANOSUSPENSAO'
    end
    object qryMESSUSPENSAO: TFloatField
      FieldName = 'MESSUSPENSAO'
    end
  end
  object dts: TwwDataSource
    AutoEdit = False
    DataSet = qry
    Left = 344
  end
  object dtsHistMovVirtual: TwwDataSource
    AutoEdit = False
    DataSet = qryHistMovVirtual
    Left = 584
    Top = 24
  end
  object qryHistMovVirtual: TwwQuery
    CachedUpdates = True
    DatabaseName = 'BaseDados'
    SQL.Strings = (
      'SELECT'
      '    0 AS IDCONTRATOEMPTMO,'
      '    '#39'1234567890123456789012345678901234567890'#39' AS NOME,'
      '    '#39'1234567890123456789012345678901234567890'#39' AS DESCRICAO,'
      '    '#39'99/99/9999'#39' AS DATAINICIOSUSP,'
      '    '#39'99/99/9999'#39' AS DATAFIMSUSP,'
      '    '#39'99/99/9999'#39' AS DATALIBSUSP,'
      '    '#39'99:99:99'#39'   AS HORALIBSUSP,'
      
        '    '#39'1234567890123456789012345678901234567890'#39' AS USUARIOLIBSUSP' +
        ','
      '    0            AS ANOCOBRANCA,'
      '    0            AS MESCOBRANCA,'
      '    0            AS IDTIPOSUSPEMPTMO,'
      '    0            AS IDREGRARECALCIOF,'
      '    0            AS IDREGRARECALCSEG,'
      '    0            AS TSEMESES,'
      '    '#39'99/99/9999'#39' AS DATACREDITO,'
      '    0            AS NUMPARCELAS'
      ''
      'FROM'
      '    DUAL'
      ''
      'WHERE'
      '    1 = 2'
      ''
      ' '
      ''
      ' '
      ' '
      ' '
      ' '
      ' '
      ' ')
    UpdateObject = updHistMovVirtual
    ValidateWithMask = True
    Left = 584
    Top = 108
    object qryHistMovVirtualNOME: TStringField
      FieldName = 'NOME'
      FixedChar = True
      Size = 40
    end
    object qryHistMovVirtualDESCRICAO: TStringField
      FieldName = 'DESCRICAO'
      FixedChar = True
      Size = 40
    end
    object qryHistMovVirtualDATAINICIOSUSP: TStringField
      FieldName = 'DATAINICIOSUSP'
      FixedChar = True
      Size = 10
    end
    object qryHistMovVirtualDATAFIMSUSP: TStringField
      FieldName = 'DATAFIMSUSP'
      FixedChar = True
      Size = 10
    end
    object qryHistMovVirtualDATALIBSUSP: TStringField
      FieldName = 'DATALIBSUSP'
      FixedChar = True
      Size = 10
    end
    object qryHistMovVirtualHORALIBSUSP: TStringField
      FieldName = 'HORALIBSUSP'
      FixedChar = True
      Size = 8
    end
    object qryHistMovVirtualUSUARIOLIBSUSP: TStringField
      FieldName = 'USUARIOLIBSUSP'
      FixedChar = True
      Size = 40
    end
    object qryHistMovVirtualIDCONTRATOEMPTMO: TFloatField
      FieldName = 'IDCONTRATOEMPTMO'
    end
    object qryHistMovVirtualANOCOBRANCA: TFloatField
      FieldName = 'ANOCOBRANCA'
    end
    object qryHistMovVirtualMESCOBRANCA: TFloatField
      FieldName = 'MESCOBRANCA'
    end
    object qryHistMovVirtualIDTIPOSUSPEMPTMO: TFloatField
      FieldName = 'IDTIPOSUSPEMPTMO'
    end
    object qryHistMovVirtualIDREGRARECALCIOF: TFloatField
      FieldName = 'IDREGRARECALCIOF'
    end
    object qryHistMovVirtualIDREGRARECALCSEG: TFloatField
      FieldName = 'IDREGRARECALCSEG'
    end
    object qryHistMovVirtualTSEMESES: TFloatField
      FieldName = 'TSEMESES'
    end
    object qryHistMovVirtualDATACREDITO: TStringField
      FieldName = 'DATACREDITO'
      FixedChar = True
      Size = 10
    end
    object qryHistMovVirtualNUMPARCELAS: TFloatField
      FieldName = 'NUMPARCELAS'
    end
  end
  object qryHistMov: TwwQuery
    CachedUpdates = True
    DatabaseName = 'BaseDados'
    SQL.Strings = (
      'SELECT'
      '    '#39'0'#39' AS FLGESCOLHA,'
      '    CNT.IDCONTRATOEMPTMO,'
      '    PES.NOME,'
      '    TSE.TSEDESCRICAO,'
      '    CNT.DATAINICIOSUSP,'
      '    CNT.DATAFIMSUSP,'
      '    CNT.IDTIPOSUSPEMPTMO,'
      '    TSE.IDREGRARECALCSEG,'
      '    TSE.IDREGRARECALCIOF,'
      '    TSE.TSEMESES,'
      '    CNT.DATACREDITO,'
      '    CNT.NUMPARCELAS'
      ''
      'FROM'
      '    PESSOA PES,'
      '    CONTRATOEMPTMO CNT,'
      '    TIPOSUSPEMPTMO TSE'
      ''
      'WHERE'
      '    CNT.IDTIPOSUSPEMPTMO IS NOT NULL'
      'AND CNT.DATALIBSUSP      IS NULL'
      'AND PES.IDPESSOA         = CNT.IDBENEF'
      'AND TSE.IDTIPOSUSPEMPTMO = CNT.IDTIPOSUSPEMPTMO'
      ''
      'ORDER BY'
      '    CNT.IDCONTRATOEMPTMO'
      ' '
      ' '
      ' ')
    UpdateObject = UpdHistMov
    ControlType.Strings = (
      'FLGESCOLHA;CheckBox;1;0')
    ValidateWithMask = True
    Left = 488
    Top = 8
    object qryHistMovFLGESCOLHA: TStringField
      FieldName = 'FLGESCOLHA'
      FixedChar = True
      Size = 1
    end
    object qryHistMovIDCONTRATOEMPTMO: TFloatField
      FieldName = 'IDCONTRATOEMPTMO'
    end
    object qryHistMovNOME: TStringField
      FieldName = 'NOME'
      Size = 60
    end
    object qryHistMovTSEDESCRICAO: TStringField
      FieldName = 'TSEDESCRICAO'
      Size = 60
    end
    object qryHistMovDATAINICIOSUSP: TDateTimeField
      FieldName = 'DATAINICIOSUSP'
    end
    object qryHistMovDATAFIMSUSP: TDateTimeField
      FieldName = 'DATAFIMSUSP'
    end
    object qryHistMovIDTIPOSUSPEMPTMO: TFloatField
      FieldName = 'IDTIPOSUSPEMPTMO'
    end
    object qryHistMovIDREGRARECALCSEG: TFloatField
      FieldName = 'IDREGRARECALCSEG'
    end
    object qryHistMovIDREGRARECALCIOF: TFloatField
      FieldName = 'IDREGRARECALCIOF'
    end
    object qryHistMovTSEMESES: TFloatField
      FieldName = 'TSEMESES'
    end
    object qryHistMovDATACREDITO: TDateTimeField
      FieldName = 'DATACREDITO'
    end
    object qryHistMovNUMPARCELAS: TFloatField
      FieldName = 'NUMPARCELAS'
    end
  end
  object dtsHistMov: TwwDataSource
    DataSet = qryHistMov
    Left = 416
    Top = 12
  end
  object updHistMovVirtual: TUpdateSQL
    ModifySQL.Strings = (
      'update DUAL'
      'set'
      '  IDCONTRATOEMPTMO = :IDCONTRATOEMPTMO,'
      '  NOME = :NOME,'
      '  DESCRICAO = :DESCRICAO,'
      '  DATAINICIOSUSP = :DATAINICIOSUSP,'
      '  DATAFIMSUSP = :DATAFIMSUSP,'
      '  DATALIBSUSP = :DATALIBSUSP,'
      '  HORALIBSUSP = :HORALIBSUSP,'
      '  USUARIOLIBSUSP = :USUARIOLIBSUSP,'
      '  ANOCOBRANCA = :ANOCOBRANCA,'
      '  MESCOBRANCA = :MESCOBRANCA,'
      '  IDTIPOSUSPEMPTMO = :IDTIPOSUSPEMPTMO,'
      '  IDREGRARECALCIOF = :IDREGRARECALCIOF,'
      '  IDREGRARECALCSEG = :IDREGRARECALCSEG,'
      '  TSEMESES = :TSEMESES,'
      '  DATACREDITO = :DATACREDITO,'
      '  NUMPARCELAS = :NUMPARCELAS'
      'where'
      '  IDCONTRATOEMPTMO = :OLD_IDCONTRATOEMPTMO and'
      '  NOME = :OLD_NOME and'
      '  DESCRICAO = :OLD_DESCRICAO and'
      '  DATAINICIOSUSP = :OLD_DATAINICIOSUSP and'
      '  DATAFIMSUSP = :OLD_DATAFIMSUSP and'
      '  DATALIBSUSP = :OLD_DATALIBSUSP and'
      '  HORALIBSUSP = :OLD_HORALIBSUSP and'
      '  USUARIOLIBSUSP = :OLD_USUARIOLIBSUSP and'
      '  ANOCOBRANCA = :OLD_ANOCOBRANCA and'
      '  MESCOBRANCA = :OLD_MESCOBRANCA and'
      '  IDTIPOSUSPEMPTMO = :OLD_IDTIPOSUSPEMPTMO and'
      '  IDREGRARECALCIOF = :OLD_IDREGRARECALCIOF and'
      '  IDREGRARECALCSEG = :OLD_IDREGRARECALCSEG and'
      '  TSEMESES = :OLD_TSEMESES and'
      '  DATACREDITO = :OLD_DATACREDITO and'
      '  NUMPARCELAS = :OLD_NUMPARCELAS')
    InsertSQL.Strings = (
      'insert into DUAL'
      
        '  (IDCONTRATOEMPTMO, NOME, DESCRICAO, DATAINICIOSUSP, DATAFIMSUS' +
        'P, DATALIBSUSP, '
      
        '   HORALIBSUSP, USUARIOLIBSUSP, ANOCOBRANCA, MESCOBRANCA, IDTIPO' +
        'SUSPEMPTMO, '
      
        '   IDREGRARECALCIOF, IDREGRARECALCSEG, TSEMESES, DATACREDITO, NU' +
        'MPARCELAS)'
      'values'
      
        '  (:IDCONTRATOEMPTMO, :NOME, :DESCRICAO, :DATAINICIOSUSP, :DATAF' +
        'IMSUSP, '
      
        '   :DATALIBSUSP, :HORALIBSUSP, :USUARIOLIBSUSP, :ANOCOBRANCA, :M' +
        'ESCOBRANCA, '
      
        '   :IDTIPOSUSPEMPTMO, :IDREGRARECALCIOF, :IDREGRARECALCSEG, :TSE' +
        'MESES, '
      '   :DATACREDITO, :NUMPARCELAS)')
    DeleteSQL.Strings = (
      'delete from DUAL'
      'where'
      '  IDCONTRATOEMPTMO = :OLD_IDCONTRATOEMPTMO and'
      '  NOME = :OLD_NOME and'
      '  DESCRICAO = :OLD_DESCRICAO and'
      '  DATAINICIOSUSP = :OLD_DATAINICIOSUSP and'
      '  DATAFIMSUSP = :OLD_DATAFIMSUSP and'
      '  DATALIBSUSP = :OLD_DATALIBSUSP and'
      '  HORALIBSUSP = :OLD_HORALIBSUSP and'
      '  USUARIOLIBSUSP = :OLD_USUARIOLIBSUSP and'
      '  ANOCOBRANCA = :OLD_ANOCOBRANCA and'
      '  MESCOBRANCA = :OLD_MESCOBRANCA and'
      '  IDTIPOSUSPEMPTMO = :OLD_IDTIPOSUSPEMPTMO and'
      '  IDREGRARECALCIOF = :OLD_IDREGRARECALCIOF and'
      '  IDREGRARECALCSEG = :OLD_IDREGRARECALCSEG and'
      '  TSEMESES = :OLD_TSEMESES and'
      '  DATACREDITO = :OLD_DATACREDITO and'
      '  NUMPARCELAS = :OLD_NUMPARCELAS')
    Left = 584
  end
  object QryAux: TwwQuery
    CachedUpdates = True
    DatabaseName = 'BaseDados'
    ValidateWithMask = True
    Left = 648
  end
  object UpdHistMov: TUpdateSQL
    ModifySQL.Strings = (
      'update CONTRATOEMPTMO'
      'set'
      '  FLGESCOLHA = :FLGESCOLHA,'
      '  IDCONTRATOEMPTMO = :IDCONTRATOEMPTMO,'
      '  NOME = :NOME,'
      '  TSEDESCRICAO = :TSEDESCRICAO,'
      '  DATAINICIOSUSP = :DATAINICIOSUSP,'
      '  DATAFIMSUSP = :DATAFIMSUSP,'
      '  IDTIPOSUSPEMPTMO = :IDTIPOSUSPEMPTMO,'
      '  IDREGRARECALCSEG = :IDREGRARECALCSEG,'
      '  IDREGRARECALCIOF = :IDREGRARECALCIOF,'
      '  TSEMESES = :TSEMESES,'
      '  DATACREDITO = :DATACREDITO,'
      '  NUMPARCELAS = :NUMPARCELAS'
      'where'
      '  IDCONTRATOEMPTMO = :OLD_IDCONTRATOEMPTMO')
    InsertSQL.Strings = (
      'insert into CONTRATOEMPTMO'
      
        '  (FLGESCOLHA, IDCONTRATOEMPTMO, NOME, TSEDESCRICAO, DATAINICIOS' +
        'USP, DATAFIMSUSP, '
      
        '   IDTIPOSUSPEMPTMO, IDREGRARECALCSEG, IDREGRARECALCIOF, TSEMESE' +
        'S, DATACREDITO, '
      '   NUMPARCELAS)'
      'values'
      
        '  (:FLGESCOLHA, :IDCONTRATOEMPTMO, :NOME, :TSEDESCRICAO, :DATAIN' +
        'ICIOSUSP, '
      
        '   :DATAFIMSUSP, :IDTIPOSUSPEMPTMO, :IDREGRARECALCSEG, :IDREGRAR' +
        'ECALCIOF, '
      '   :TSEMESES, :DATACREDITO, :NUMPARCELAS)')
    DeleteSQL.Strings = (
      'delete from CONTRATOEMPTMO'
      'where'
      '  IDCONTRATOEMPTMO = :OLD_IDCONTRATOEMPTMO')
    Left = 416
  end
  object qrySaldoAnt: TwwQuery
    DatabaseName = 'BaseDados'
    SQL.Strings = (
      'SELECT'
      '      HMESALDODEV, HMENUMPARCELAS'
      '   FROM'
      '      HISTMOVEMPTMO HST'
      'WHERE'
      '   HST.IDHISTMOVEMPTMO ='
      '   (SELECT'
      '       MAX(IDHISTMOVEMPTMO) AS IDHISTMOVEMPTMO'
      '    FROM'
      '       HISTMOVEMPTMO HME, CONTRATOEMPTMO CON,'
      '       ITEMXTIPOCONTR ITC, TIPOCONTREMPTMO TCE'
      '    WHERE'
      '        ( CON.IDCONTRATOEMPTMO   =:PIDCONTRATOEMPTMO )'
      '    AND ( ITC.ITCTRATASALDODEV  <> 0 )'
      
        '    AND ( (HME.FLGESTORNADO      = 0) OR (HME.FLGESTORNADO IS NU' +
        'LL) )'
      '    AND ( HME.IDCONTRATOEMPTMO   = CON.IDCONTRATOEMPTMO )'
      '    AND ( HME.IDCONTRATOEMPTMO   = CON.IDCONTRATOEMPTMO )'
      '    AND ( CON.IDTIPOCONTREMPTMO  = TCE.IDTIPOCONTREMPTMO )'
      '    AND ( TCE.IDTIPOCONTREMPTMO  = ITC.IDTIPOCONTREMPTMO )'
      '    AND ( HME.IDITEMEMPTMO       = ITC.IDITEMEMPTMO )'
      '     )'
      ''
      ' '
      ' '
      ' ')
    ValidateWithMask = True
    Left = 144
    Top = 352
    ParamData = <
      item
        DataType = ftInteger
        Name = 'PIDCONTRATOEMPTMO'
        ParamType = ptInput
      end>
    object qrySaldoAntHMESALDODEV: TFloatField
      FieldName = 'HMESALDODEV'
    end
    object qrySaldoAntHMENUMPARCELAS: TFloatField
      FieldName = 'HMENUMPARCELAS'
    end
  end
  object qryContratosGeracao: TwwQuery
    DatabaseName = 'BaseDados'
    SQL.Strings = (
      'SELECT'
      '   C.IDCONTRATOEMPTMO,'
      '   C.IDCONTRQUITACAO, TCE.IDTIPOEMPTMO,'
      '   C.IDINSCRICAOEMPTMO, C.IDTIPOCONTREMPTMO,'
      '   C.IDPATRO, C.IDPLANOPREV, C.IDVERBA, I.DATAINSC,'
      '   C.IDPESSOA, C.IDBENEF,'
      '   C.FLGSITUACAO, C.FLGFORMAREC, C.FLGFORMAPAG,'
      '   C.CODFORMAPAG, C.PORTFORMAREC, C.PORTFORMAPAG,'
      '   C.IDCBANCARIA,'
      '   C.DATAASSINATURA, C.DATASITUACAO,'
      '   C.DATACREDITO, C.DATAPRIMPARC,'
      '   C.DATACANC, C.MOECODIGO,'
      '   C.VLRCONTRATO, C.VLRPARCELA, C.TXJUROS,'
      '   C.NUMPARCELAS,'
      '   C.IDTIPOSUSPEMPTMO,'
      '   C.DATALIBSUSP,'
      '   M.MOESIGLA'
      'FROM'
      '   CONTRATOEMPTMO  C,'
      '   INSCRICAOEMPTMO I,'
      '   TIPOCONTREMPTMO TCE,'
      '   MOEDA M'
      'WHERE'
      '    ( C.IDCONTRATOEMPTMO  = :PIDCONTRATOEMPTMO )'
      'AND ( C.MOECODIGO         = M.MOECODIGO(+) )'
      'AND ( C.IDTIPOCONTREMPTMO = TCE.IDTIPOCONTREMPTMO )'
      'AND ( C.IDINSCRICAOEMPTMO = I.IDINSCRICAOEMPTMO )'
      ''
      ' '
      ' '
      ' '
      ' ')
    ValidateWithMask = True
    Left = 464
    Top = 320
    ParamData = <
      item
        DataType = ftInteger
        Name = 'PIDCONTRATOEMPTMO'
        ParamType = ptInput
      end>
    object qryContratosGeracaoIDCONTRATOEMPTMO: TFloatField
      FieldName = 'IDCONTRATOEMPTMO'
    end
    object qryContratosGeracaoIDCONTRQUITACAO: TFloatField
      FieldName = 'IDCONTRQUITACAO'
    end
    object qryContratosGeracaoIDINSCRICAOEMPTMO: TFloatField
      FieldName = 'IDINSCRICAOEMPTMO'
    end
    object qryContratosGeracaoIDTIPOCONTREMPTMO: TFloatField
      FieldName = 'IDTIPOCONTREMPTMO'
    end
    object qryContratosGeracaoIDPATRO: TFloatField
      FieldName = 'IDPATRO'
    end
    object qryContratosGeracaoIDPLANOPREV: TFloatField
      FieldName = 'IDPLANOPREV'
    end
    object qryContratosGeracaoIDVERBA: TFloatField
      FieldName = 'IDVERBA'
    end
    object qryContratosGeracaoIDPESSOA: TFloatField
      FieldName = 'IDPESSOA'
    end
    object qryContratosGeracaoIDBENEF: TFloatField
      FieldName = 'IDBENEF'
    end
    object qryContratosGeracaoFLGSITUACAO: TStringField
      FieldName = 'FLGSITUACAO'
      FixedChar = True
      Size = 1
    end
    object qryContratosGeracaoFLGFORMAREC: TStringField
      FieldName = 'FLGFORMAREC'
      FixedChar = True
      Size = 1
    end
    object qryContratosGeracaoFLGFORMAPAG: TStringField
      FieldName = 'FLGFORMAPAG'
      FixedChar = True
      Size = 1
    end
    object qryContratosGeracaoCODFORMAPAG: TFloatField
      FieldName = 'CODFORMAPAG'
    end
    object qryContratosGeracaoPORTFORMAREC: TFloatField
      FieldName = 'PORTFORMAREC'
    end
    object qryContratosGeracaoPORTFORMAPAG: TFloatField
      FieldName = 'PORTFORMAPAG'
    end
    object qryContratosGeracaoIDCBANCARIA: TFloatField
      FieldName = 'IDCBANCARIA'
    end
    object qryContratosGeracaoDATAASSINATURA: TDateTimeField
      FieldName = 'DATAASSINATURA'
    end
    object qryContratosGeracaoDATASITUACAO: TDateTimeField
      FieldName = 'DATASITUACAO'
    end
    object qryContratosGeracaoDATACREDITO: TDateTimeField
      FieldName = 'DATACREDITO'
    end
    object qryContratosGeracaoDATAPRIMPARC: TDateTimeField
      FieldName = 'DATAPRIMPARC'
    end
    object qryContratosGeracaoDATACANC: TDateTimeField
      FieldName = 'DATACANC'
    end
    object qryContratosGeracaoMOECODIGO: TFloatField
      FieldName = 'MOECODIGO'
    end
    object qryContratosGeracaoVLRCONTRATO: TFloatField
      FieldName = 'VLRCONTRATO'
    end
    object qryContratosGeracaoVLRPARCELA: TFloatField
      FieldName = 'VLRPARCELA'
    end
    object qryContratosGeracaoTXJUROS: TFloatField
      FieldName = 'TXJUROS'
    end
    object qryContratosGeracaoNUMPARCELAS: TFloatField
      FieldName = 'NUMPARCELAS'
    end
    object qryContratosGeracaoIDTIPOSUSPEMPTMO: TFloatField
      FieldName = 'IDTIPOSUSPEMPTMO'
    end
    object qryContratosGeracaoDATALIBSUSP: TDateTimeField
      FieldName = 'DATALIBSUSP'
    end
    object qryContratosGeracaoMOESIGLA: TStringField
      FieldName = 'MOESIGLA'
      Size = 10
    end
    object qryContratosGeracaoIDTIPOEMPTMO: TFloatField
      FieldName = 'IDTIPOEMPTMO'
    end
    object qryContratosGeracaoDATAINSC: TDateTimeField
      FieldName = 'DATAINSC'
    end
  end
  object qryItemEmprestimo: TwwQuery
    DatabaseName = 'BaseDados'
    SQL.Strings = (
      'SELECT'
      '   IDITEMEMPTMO, ITEDESCRICAO'
      'FROM'
      '   ITEMEMPTMO'
      'WHERE'
      '   IDITEMEMPTMO = :PIDITEMEMPTMO')
    ValidateWithMask = True
    Left = 184
    Top = 208
    ParamData = <
      item
        DataType = ftInteger
        Name = 'PIDITEMEMPTMO'
        ParamType = ptInput
      end>
    object qryItemEmprestimoITEDESCRICAO: TStringField
      DisplayLabel = 'Descrição'
      DisplayWidth = 40
      FieldName = 'ITEDESCRICAO'
      Origin = 'BASEDADOS.ITEMEMPTMO.ITEDESCRICAO'
      Size = 40
    end
    object qryItemEmprestimoIDITEMEMPTMO: TFloatField
      DisplayLabel = 'Código do Item'
      DisplayWidth = 10
      FieldName = 'IDITEMEMPTMO'
      Origin = 'BASEDADOS.ITEMEMPTMO.IDITEMEMPTMO'
      Visible = False
    end
  end
end
