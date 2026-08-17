inherited frmExecReavaliaNovo: TfrmExecReavaliaNovo
  Left = 213
  Top = 186
  Caption = 'Reavaliação de Imóveis'
  ClientHeight = 436
  ClientWidth = 737
  PixelsPerInch = 96
  TextHeight = 13
  inherited pnlFundo: TPanel
    Width = 737
    Height = 354
    object lblTitulo: TfcLabel
      Left = 16
      Top = 8
      Width = 265
      Height = 24
      Caption = 'Reavaliação de Imóveis [ ]'
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
      Width = 737
      Height = 321
      Align = alBottom
      TabOrder = 0
      object TPage
        Left = 0
        Top = 0
        Caption = 'pagSelecao'
        object Label7: TLabel
          Left = 16
          Top = 226
          Width = 132
          Height = 13
          Caption = 'Observações do Laudo'
        end
        object Bevel2: TBevel
          Left = 16
          Top = 272
          Width = 706
          Height = 3
          Shape = bsTopLine
        end
        object Label42: TLabel
          Left = 26
          Top = 124
          Width = 354
          Height = 13
          Alignment = taRightJustify
          Caption = 'Tipo de Operação de Investimento para Reavaliação Positiva:'
        end
        object Label15: TLabel
          Left = 616
          Top = 186
          Width = 103
          Height = 13
          Caption = 'Data Reavaliação'
        end
        object Label6: TLabel
          Left = 16
          Top = 186
          Width = 208
          Height = 13
          Caption = 'Avaliador / Responsável pelo Laudo'
        end
        object Label1: TLabel
          Left = 16
          Top = 58
          Width = 100
          Height = 13
          Caption = 'Grupo de Imóveis'
        end
        object Bevel1: TBevel
          Left = 16
          Top = 104
          Width = 706
          Height = 3
          Shape = bsTopLine
        end
        object Label2: TLabel
          Left = 20
          Top = 148
          Width = 360
          Height = 13
          Alignment = taRightJustify
          Caption = 'Tipo de Operação de Investimento para Reavaliação Negativa:'
        end
        object Bevel4: TBevel
          Left = 16
          Top = 176
          Width = 706
          Height = 3
          Shape = bsTopLine
        end
        object btnContinuaSelecao: TfcShapeBtn
          Left = 536
          Top = 284
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
          TabOrder = 0
          TabStop = True
          TextOptions.Alignment = taCenter
          TextOptions.ExtrudeEffects.Depth = 4
          TextOptions.ExtrudeEffects.Orientation = fcTopRight
          TextOptions.VAlignment = vaVCenter
        end
        object btnAtualizar: TfcShapeBtn
          Left = 16
          Top = 284
          Width = 89
          Height = 29
          Caption = 'Atualizar'
          Color = clBtnFace
          DitherColor = clWhite
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'MS Sans Serif'
          Font.Style = [fsBold]
          Glyph.Data = {
            DE010000424DDE01000000000000760000002800000024000000120000000100
            0400000000006801000000000000000000001000000000000000000000000000
            8000008000000080800080000000800080008080000080808000C0C0C0000000
            FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00888888888888
            888888888888FFFFFF88888800008888844444488888888F88F7777778F88888
            000024884222222448888877FF788888877F888800002244222222222488887F
            7788FFFFF887F8880000222222AAAAA22248887F888F77777F887F8800002222
            2A88888A2224887F88F7888887F887F80000222228888888A224887F8878F888
            887FF7F80000222222888888A444887FFFF78F88887777880000AAAAAAA88888
            8888887777777888888888880000888888888888888888888888888888FFFFFF
            00008888888888844444488FFFF888888777777F0000A444888888A222224877
            77F888887F88887F0000A2248888888A2222487F878F888887F8887F00008A22
            48888844222248878878FFFF7788887F00008A222444442222224887F8877777
            888FF87F000088A2222222222AA248887FF888888FF77F780000888AA222222A
            A88A8888877FFFFFF7788788000088888AAAAAA8888888888887777778888888
            0000}
          NumGlyphs = 2
          Options = [boFocusable, boFocusRect]
          Offsets.GlyphY = 1
          Offsets.TextDownX = 2
          Offsets.TextDownY = 2
          ParentClipping = True
          ParentFont = False
          RoundRectBias = 25
          ShadeStyle = fbsHighlight
          TabOrder = 1
          TabStop = True
          TextOptions.Alignment = taCenter
          TextOptions.ExtrudeEffects.Depth = 4
          TextOptions.ExtrudeEffects.Orientation = fcTopRight
          TextOptions.VAlignment = vaVCenter
        end
        object DBcboTipoOperacao: TwwDBLookupCombo
          Left = 384
          Top = 120
          Width = 337
          Height = 21
          DropDownAlignment = taLeftJustify
          Selected.Strings = (
            'DESCTIPOOPERACAO'#9'60'#9'DESCTIPOOPERACAO')
          LookupField = 'IDTIPOOPERACAO'
          Style = csDropDownList
          DropDownWidth = 8
          TabOrder = 2
          AutoDropDown = False
          ShowButton = True
          AllowClearKey = True
        end
        object DBedtDataOper: TCMDateTimePicker
          Left = 616
          Top = 200
          Width = 105
          Height = 21
          CalendarAttributes.Font.Charset = DEFAULT_CHARSET
          CalendarAttributes.Font.Color = clWindowText
          CalendarAttributes.Font.Height = -11
          CalendarAttributes.Font.Name = 'MS Sans Serif'
          CalendarAttributes.Font.Style = []
          ButtonStyle = cbsCustom
          DataField = 'DATAREAVALIACAO'
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
        object edtFavorecido: TEdit
          Left = 16
          Top = 200
          Width = 473
          Height = 21
          Enabled = False
          TabOrder = 4
        end
        object btnBuscaForCli: TBitBtn
          Left = 488
          Top = 200
          Width = 24
          Height = 22
          Hint = 'Busca um Fornecedor / Favorecido'
          TabOrder = 5
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
        object Edit1: TEdit
          Left = 16
          Top = 240
          Width = 705
          Height = 21
          Enabled = False
          TabOrder = 6
        end
        object DBcboGrupo: TwwDBLookupCombo
          Left = 16
          Top = 72
          Width = 401
          Height = 21
          DropDownAlignment = taLeftJustify
          Selected.Strings = (
            'GRRDESCRICAO'#9'60'#9'Descrição')
          LookupTable = dtmLookImobiliario.qryLookGrupoRateio
          LookupField = 'IDGRUPORATEIO'
          Style = csDropDownList
          DropDownWidth = 8
          TabOrder = 7
          AutoDropDown = True
          ShowButton = True
          AllowClearKey = True
          OnCloseUp = DBcboGrupoCloseUp
        end
        inline molImovelouMestre1: TmolImovelouMestre
          Left = 8
          Top = 8
          Width = 689
          TabOrder = 8
          inherited lblImovelouMestre: TLabel
            Left = 584
          end
          inherited edtImovel: TEdit
            Width = 513
          end
          inherited btnBuscaImovel: TBitBtn
            Left = 520
            OnClick = molImovelouMestre1btnBuscaImovelClick
          end
          inherited btnLimpaImovel: TBitBtn
            Left = 544
          end
        end
        object wwDBLookupCombo1: TwwDBLookupCombo
          Left = 384
          Top = 144
          Width = 337
          Height = 21
          DropDownAlignment = taLeftJustify
          Selected.Strings = (
            'DESCTIPOOPERACAO'#9'60'#9'DESCTIPOOPERACAO')
          LookupField = 'IDTIPOOPERACAO'
          Style = csDropDownList
          DropDownWidth = 8
          TabOrder = 9
          AutoDropDown = False
          ShowButton = True
          AllowClearKey = True
        end
      end
      object TPage
        Left = 0
        Top = 0
        Caption = 'pagLancamentos'
        object Bevel3: TBevel
          Left = 16
          Top = 272
          Width = 706
          Height = 3
          Shape = bsTopLine
        end
        object DBgrdLancamentos: TwwDBGrid
          Left = 16
          Top = 35
          Width = 705
          Height = 225
          Selected.Strings = (
            'IMOCODIGO'#9'10'#9'Código'#9'F'
            'IMOVEL_EXTENSO'#9'37'#9'Imóvel '#9'F'
            'CODTIPIMOVEL'#9'6'#9'Tipo'#9'F'
            '_CONTRATOEXTENSO'#9'23'#9'Contrato'#9'F'
            'GXIPERCENTRATEIO'#9'9'#9'Rateio (I)'#9'F'
            'PERCENT_RATEIO'#9'9'#9'Rateio (C)'#9'F'
            'VALOR'#9'11'#9'Valor'#9'F')
          IniAttributes.Delimiter = ';;'
          TitleColor = clBtnFace
          FixedCols = 0
          ShowHorzScrollBar = True
          Font.Charset = ANSI_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'Arial'
          Font.Style = []
          KeyOptions = []
          Options = [dgEditing, dgTitles, dgIndicator, dgColumnResize, dgColLines, dgRowLines, dgTabs, dgAlwaysShowSelection, dgConfirmDelete, dgCancelOnExit, dgWordWrap, dgPerfectRowFit]
          ParentFont = False
          TabOrder = 4
          TitleAlignment = taLeftJustify
          TitleFont.Charset = ANSI_CHARSET
          TitleFont.Color = clWindowText
          TitleFont.Height = -9
          TitleFont.Name = 'Small Fonts'
          TitleFont.Style = [fsBold]
          TitleLines = 1
          TitleButtons = False
          IndicatorColor = icBlack
        end
        object btnConfirma: TfcShapeBtn
          Left = 632
          Top = 284
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
          TabOrder = 0
          TabStop = True
          TextOptions.Alignment = taCenter
          TextOptions.ExtrudeEffects.Depth = 4
          TextOptions.ExtrudeEffects.Orientation = fcTopRight
          TextOptions.VAlignment = vaVCenter
        end
        object btnVoltar: TfcShapeBtn
          Left = 440
          Top = 284
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
            0400000000000001000000000000000000001000000010000000000000000000
            8000008000000080800080000000800080008080000080808000C0C0C0000000
            FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00888888888888
            8888888888FFFFF8888888888000008888888888F777778FF88888800BBBBB00
            88888887788888778F88887BBBBBBBBB088888788888888878F887FBBBBBBBBB
            B08887F8888F888887F887FBBB0BBBBBB0888788887F8888878F7FBBB00BBBBB
            BB087F88877FFFFFF87F7FBB00000000BB087F8877777777F87F7FB000000000
            BB087F8777777777F87F7FBB00000000BB087F8877777777887F7FBBB00BBBBB
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
          TabOrder = 2
          TabStop = True
          TextOptions.Alignment = taCenter
          TextOptions.ExtrudeEffects.Depth = 4
          TextOptions.ExtrudeEffects.Orientation = fcTopRight
          TextOptions.VAlignment = vaVCenter
        end
        object Panel3: TPanel
          Left = 16
          Top = 8
          Width = 705
          Height = 27
          BevelInner = bvRaised
          BevelOuter = bvLowered
          Caption = 'Imóveis e Bens'
          Color = clNavy
          Font.Charset = ANSI_CHARSET
          Font.Color = clWhite
          Font.Height = -19
          Font.Name = 'Courier New'
          Font.Style = [fsBold]
          ParentFont = False
          TabOrder = 3
        end
        object btnContinuarLanc: TfcShapeBtn
          Left = 536
          Top = 284
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
          Enabled = False
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
          TabOrder = 1
          TabStop = True
          TextOptions.Alignment = taCenter
          TextOptions.ExtrudeEffects.Depth = 4
          TextOptions.ExtrudeEffects.Orientation = fcTopRight
          TextOptions.VAlignment = vaVCenter
        end
      end
    end
  end
  inherited Dock971: TDock97
    Top = 403
    Width = 737
    inherited tb97Fundo: TToolbar97
      Left = 565
      DockPos = 613
    end
  end
  object Panel2: TPanel [2]
    Left = 0
    Top = 354
    Width = 737
    Height = 49
    Align = alBottom
    TabOrder = 2
    object lblProgress: TLabel
      Left = 16
      Top = 10
      Width = 140
      Height = 13
      Caption = 'Gerando Lançamentos...'
      Visible = False
    end
    object lblContador: TLabel
      Left = 628
      Top = 10
      Width = 93
      Height = 13
      Alignment = taRightJustify
      Caption = '00000 de 00000'
      Visible = False
    end
    object ProgressBar: TProgressBar
      Left = 16
      Top = 24
      Width = 705
      Height = 16
      Min = 0
      Max = 100
      Step = 1
      TabOrder = 0
      Visible = False
    end
  end
  inherited ivTradutor: TIvExtendedTranslator
    Left = 1011
    TargetsData = (
      1
      2
      (
        'TRealEdit'
        'Text'
        0)
      (
        'TMemo'
        'Text'
        0))
  end
  object qryBemResult: TwwQuery
    CachedUpdates = True
    DatabaseName = 'BaseDados'
    SQL.Strings = (
      'SELECT'
      '   0 AS IDIMOVEL_RESULT,'
      '   0 AS NO_IMOVEL_RESULT,'
      '   0 AS IDBEM_ORIGEM,'
      
        '   '#39'                                                            ' +
        #39' AS NOME_IMOVEL,'
      
        '   '#39'                                                            ' +
        '                                                                ' +
        '                                                                ' +
        '            '#39' AS DESBEM,'
      '   '#39' '#39' AS IXBGRUPO,'
      '   0 AS PERCENT_DESMEMBRA,'
      '   0 AS CC_ORIGINAL,'
      '   0 AS CC_DESMEMBRA,'
      '   0 AS IDBEM_RESULT,'
      '   0 AS IDMOVIMENTACAO_DESMEMBRA,'
      '   0 AS PLACA_RESULT'
      ''
      'FROM'
      '   IMOVEL'
      ''
      'WHERE'
      '   IDIMOVEL = 0')
    UpdateObject = updBemResult
    ValidateWithMask = True
    Left = 208
    Top = 380
    object qryBemResultNOME_IMOVEL: TStringField
      DisplayWidth = 39
      FieldName = 'NOME_IMOVEL'
      FixedChar = True
      Size = 60
    end
    object qryBemResult_GRUPO: TStringField
      FieldKind = fkCalculated
      FieldName = '_GRUPO'
      Size = 25
      Calculated = True
    end
    object qryBemResultDESBEM: TStringField
      DisplayLabel = 'Bem'
      DisplayWidth = 39
      FieldName = 'DESBEM'
      FixedChar = True
      Size = 200
    end
    object qryBemResultPERCENT_DESMEMBRA: TFloatField
      DisplayLabel = ' %'
      DisplayWidth = 8
      FieldName = 'PERCENT_DESMEMBRA'
      DisplayFormat = '##0.0000 %'
      EditFormat = '##0.0000'
    end
    object qryBemResultIDIMOVEL_RESULT: TFloatField
      FieldName = 'IDIMOVEL_RESULT'
      Visible = False
    end
    object qryBemResultIDBEM_ORIGEM: TFloatField
      FieldName = 'IDBEM_ORIGEM'
      Visible = False
    end
    object qryBemResultIXBGRUPO: TStringField
      FieldName = 'IXBGRUPO'
      Visible = False
      FixedChar = True
      Size = 1
    end
    object qryBemResultCC_ORIGINAL: TFloatField
      FieldName = 'CC_ORIGINAL'
    end
    object qryBemResultCC_DESMEMBRA: TFloatField
      FieldName = 'CC_DESMEMBRA'
    end
    object qryBemResultIDBEM_RESULT: TFloatField
      FieldName = 'IDBEM_RESULT'
    end
    object qryBemResultIDMOVIMENTACAO_DESMEMBRA: TFloatField
      FieldName = 'IDMOVIMENTACAO_DESMEMBRA'
    end
    object qryBemResultNO_IMOVEL_RESULT: TFloatField
      FieldName = 'NO_IMOVEL_RESULT'
    end
    object qryBemResultPLACA_RESULT: TFloatField
      FieldName = 'PLACA_RESULT'
      Visible = False
    end
  end
  object dsBemResult: TwwDataSource
    DataSet = qryBemResult
    Left = 208
    Top = 368
  end
  object updBemResult: TUpdateSQL
    Left = 208
    Top = 356
  end
end
