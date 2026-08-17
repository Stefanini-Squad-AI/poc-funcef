inherited frmExecAnaliseLancto: TfrmExecAnaliseLancto
  Left = 22
  Top = 92
  HelpContext = 640026
  Caption = 'Análise de Lançamentos'
  ClientHeight = 443
  ClientWidth = 740
  PixelsPerInch = 96
  TextHeight = 13
  inherited pnlFundo: TPanel
    Width = 740
    Height = 361
    inherited lblTitulo: TfcLabel
      Width = 359
      Caption = 'Análise de Lançamentos [ seleção ]'
    end
    object ntbPrincipal: TNotebook
      Left = 1
      Top = 40
      Width = 738
      Height = 320
      Align = alBottom
      PageIndex = 1
      TabOrder = 0
      object TPage
        Left = 0
        Top = 0
        Caption = 'Parametros'
        object Label2: TLabel
          Left = 416
          Top = 55
          Width = 163
          Height = 13
          Caption = 'Tipo de Receita ou Despesa'
        end
        object btnContinuaSelecao: TfcShapeBtn
          Left = 632
          Top = 280
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
          OnClick = btnContinuaSelecaoClick
        end
        inline MolUsuario1: TMolUsuario
          Left = 8
          Top = 8
          TabOrder = 1
        end
        inline molContrato1: TmolContrato
          Left = 8
          Top = 52
          TabOrder = 2
        end
        object grpDatas: TGroupBox
          Left = 16
          Top = 112
          Width = 257
          Height = 49
          Caption = ' Período de Datas '
          TabOrder = 3
          object Label5: TLabel
            Left = 124
            Top = 24
            Width = 8
            Height = 13
            Caption = 'a'
          end
          object edtDataIni: TCMDateTimePicker
            Left = 16
            Top = 20
            Width = 97
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
            TabOrder = 0
          end
          object edtDataFim: TCMDateTimePicker
            Left = 144
            Top = 20
            Width = 97
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
          end
        end
        object grpCompetencia: TGroupBox
          Left = 16
          Top = 176
          Width = 257
          Height = 57
          Caption = ' Mês de Competência '
          TabOrder = 4
          object DBspnAnoCompetencia: TwwDBSpinEdit
            Left = 160
            Top = 24
            Width = 65
            Height = 21
            Increment = 1
            MaxValue = 2050
            MinValue = 1980
            TabOrder = 1
            UnboundDataType = wwDefault
          end
          object cboMesCompetencia: TComboBox
            Left = 16
            Top = 24
            Width = 145
            Height = 21
            Style = csDropDownList
            ItemHeight = 13
            TabOrder = 0
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
        end
        object chkCompetencia: TCheckBox
          Left = 32
          Top = 242
          Width = 225
          Height = 17
          Caption = 'NÃO levar em conta a competência'
          Checked = True
          State = cbChecked
          TabOrder = 5
        end
        object DBcboTipoRecDes: TwwDBLookupCombo
          Left = 416
          Top = 69
          Width = 289
          Height = 21
          DropDownAlignment = taLeftJustify
          Selected.Strings = (
            'DESCCUSTORECIMO'#9'60'#9'DESCCUSTORECIMO')
          LookupTable = dtmLookImobiliario.qryLookTipoRecDes
          LookupField = 'IDTIPOCUSTORECIMO'
          Style = csDropDownList
          DropDownWidth = 8
          TabOrder = 6
          AutoDropDown = True
          ShowButton = True
          AllowClearKey = True
        end
        object rdgTipoData: TRadioGroup
          Left = 336
          Top = 120
          Width = 369
          Height = 41
          Caption = ' Tipo de Datas '
          Columns = 3
          ItemIndex = 2
          Items.Strings = (
            'de Inclusão'
            'de Lançamento'
            'de Vencimento')
          TabOrder = 7
          TabStop = True
        end
        inline molOrigemLanc1: TmolOrigemLanc
          Left = 329
          Top = 182
          TabOrder = 8
        end
      end
      object TPage
        Left = 0
        Top = 0
        Caption = 'Resultados'
        object Panel1: TPanel
          Left = 16
          Top = 8
          Width = 705
          Height = 27
          BevelInner = bvRaised
          BevelOuter = bvLowered
          Caption = ' Lançamentos não Integrados '
          Color = clNavy
          Font.Charset = ANSI_CHARSET
          Font.Color = clWhite
          Font.Height = -19
          Font.Name = 'Courier New'
          Font.Style = [fsBold]
          ParentFont = False
          TabOrder = 0
        end
        object Panel4: TPanel
          Left = 16
          Top = 120
          Width = 705
          Height = 27
          BevelInner = bvRaised
          BevelOuter = bvLowered
          Caption = ' Detalhe dos Lançamentos não Integrados '
          Color = clNavy
          Font.Charset = ANSI_CHARSET
          Font.Color = clWhite
          Font.Height = -19
          Font.Name = 'Courier New'
          Font.Style = [fsBold]
          ParentFont = False
          TabOrder = 1
        end
        object wwDBGrid4: TwwDBGrid
          Left = 16
          Top = 144
          Width = 705
          Height = 105
          Selected.Strings = (
            'CONTRATO_EXTENSO'#9'46'#9'Contrato'#9'F'
            'IMOVEL_EXTENSO'#9'52'#9'Imóvel'#9'F'
            'CODTIPIMOVEL'#9'13'#9'Tipo Imóvel'#9'F'
            'VALOR_LANC'#9'19'#9'Valor Lançamento'#9'F')
          IniAttributes.Delimiter = ';;'
          TitleColor = clBtnFace
          FixedCols = 0
          ShowHorzScrollBar = True
          DataSource = dsLancamentos
          Font.Charset = ANSI_CHARSET
          Font.Color = clWindowText
          Font.Height = -9
          Font.Name = 'Arial'
          Font.Style = []
          Options = [dgTitles, dgIndicator, dgColumnResize, dgColLines, dgRowLines, dgTabs, dgRowSelect, dgConfirmDelete, dgCancelOnExit, dgPerfectRowFit]
          ParentFont = False
          TabOrder = 2
          TitleAlignment = taLeftJustify
          TitleFont.Charset = ANSI_CHARSET
          TitleFont.Color = clWindowText
          TitleFont.Height = -9
          TitleFont.Name = 'Small Fonts'
          TitleFont.Style = [fsBold]
          TitleLines = 1
          TitleButtons = False
          UseTFields = False
          IndicatorColor = icBlack
        end
        object wwDBRichEdit1: TwwDBRichEdit
          Left = 16
          Top = 251
          Width = 705
          Height = 33
          AutoURLDetect = False
          DataField = '_DESCERRO'
          DataSource = dsDocumento
          PrintJobName = 'Delphi 5'
          TabOrder = 3
          EditorCaption = 'Edit Rich Text'
          EditorPosition.Left = 0
          EditorPosition.Top = 0
          EditorPosition.Width = 0
          EditorPosition.Height = 0
          MeasurementUnits = muInches
          PrintMargins.Top = 1
          PrintMargins.Bottom = 1
          PrintMargins.Left = 1
          PrintMargins.Right = 1
          RichEditVersion = 2
          Data = {
            830000007B5C727466315C616E73695C616E7369637067313235325C64656666
            305C6465666C616E67313034367B5C666F6E7474626C7B5C66305C666E696C20
            4D532053616E732053657269663B7D7D0D0A5C766965776B696E64345C756331
            5C706172645C625C66305C6673313420777744425269636845646974315C7061
            720D0A7D0D0A00}
        end
        object wwDBRichEdit2: TwwDBRichEdit
          Left = 16
          Top = 280
          Width = 705
          Height = 33
          AutoURLDetect = False
          DataField = 'MSGERROINTEGRA'
          DataSource = dsLancamentos
          PrintJobName = 'Delphi 5'
          TabOrder = 4
          EditorCaption = 'Edit Rich Text'
          EditorPosition.Left = 0
          EditorPosition.Top = 0
          EditorPosition.Width = 0
          EditorPosition.Height = 0
          MeasurementUnits = muInches
          PrintMargins.Top = 1
          PrintMargins.Bottom = 1
          PrintMargins.Left = 1
          PrintMargins.Right = 1
          RichEditVersion = 2
          Data = {
            830000007B5C727466315C616E73695C616E7369637067313235325C64656666
            305C6465666C616E67313034367B5C666F6E7474626C7B5C66305C666E696C20
            4D532053616E732053657269663B7D7D0D0A5C766965776B696E64345C756331
            5C706172645C625C66305C6673313420777744425269636845646974325C7061
            720D0A7D0D0A00}
        end
        object wwDBGrid1: TwwDBGrid
          Left = 16
          Top = 33
          Width = 704
          Height = 92
          Selected.Strings = (
            'DESCCUSTORECIMO'#9'36'#9'Receita / Despesa'#9'F'
            '_RECPAG'#9'14'#9'Rec.Desp.'#9'F'
            'MESCOMPETENCIA'#9'6'#9'Mês'#9'F'
            'ANOCOMPETENCIA'#9'6'#9'Ano'#9'F'
            'TOTAL_LANC'#9'20'#9'Tot. Lançamento'#9'F'
            'DATAVENCIMENTO'#9'14'#9'Vencimento'#9'F'
            '_ORIGEMLANC'#9'31'#9'Origem Lançamento'#9'F')
          IniAttributes.Delimiter = ';;'
          TitleColor = clBtnFace
          FixedCols = 0
          ShowHorzScrollBar = True
          DataSource = dsDocumento
          Font.Charset = ANSI_CHARSET
          Font.Color = clWindowText
          Font.Height = -9
          Font.Name = 'Arial'
          Font.Style = []
          Options = [dgTitles, dgIndicator, dgColumnResize, dgColLines, dgRowLines, dgTabs, dgRowSelect, dgConfirmDelete, dgCancelOnExit, dgPerfectRowFit]
          ParentFont = False
          PopupMenu = pupmLibera
          TabOrder = 5
          TitleAlignment = taLeftJustify
          TitleFont.Charset = ANSI_CHARSET
          TitleFont.Color = clWindowText
          TitleFont.Height = -9
          TitleFont.Name = 'Small Fonts'
          TitleFont.Style = [fsBold]
          TitleLines = 1
          TitleButtons = False
          UseTFields = False
          IndicatorColor = icBlack
        end
      end
    end
  end
  inherited Dock971: TDock97
    Top = 410
    Width = 740
    inherited tb97Fundo: TToolbar97
      Left = 557
      DockPos = 557
    end
  end
  inherited Panel2: TPanel
    Top = 361
    Width = 740
  end
  inherited ivTradutor: TIvExtendedTranslator
    TargetsData = (
      1
      1
      (
        'TwwDBRichEdit'
        'Text'
        0))
  end
  object dsDocumento: TwwDataSource
    AutoEdit = False
    DataSet = qryDocumento
    Left = 576
  end
  object qryDocumento: TwwQuery
    CachedUpdates = True
    OnCalcFields = qryDocumentoCalcFields
    DatabaseName = 'BaseDados'
    SQL.Strings = (
      'SELECT'
      '   IDDOCUMENTO, NODOCUMENTO, FLGORIGEMLANC, MESCOMPETENCIA,'
      
        '   ANOCOMPETENCIA, DATAVENCIMENTO, DESCCUSTORECIMO, FLGERRO, REC' +
        'PAG,'
      
        '   SUM(VALOR_LANC) AS TOTAL_LANC, SUM(VALOR_OM_LANC) AS TOTAL_OM' +
        '_LANC'
      ''
      'FROM'
      '   VWLANCAMENTO'
      ''
      'WHERE'
      '   ( FLGINTEGRADO = 0 )'
      '   AND ( FLGERRO < 0 )'
      '   AND (IDPESSOA = :PIDPESSOA)'
      
        '   AND ((:PIDUSUARIOSISTEMA IS NULL) OR (IDUSUARIOSISTEMA = :PID' +
        'USUARIOSISTEMA))'
      
        '   AND ((:PIDCONTRATOIMOVEL IS NULL) OR (IDCONTRATOIMOVEL = :PID' +
        'CONTRATOIMOVEL))'
      
        '   AND ((:PIDTIPOCUSTORECIMO IS NULL) OR (IDTIPOCUSTORECIMO = :P' +
        'IDTIPOCUSTORECIMO))'
      
        '   AND ((:PTRGDTINCLUSAO IS NULL) OR (TRGDTINCLUSAO BETWEEN :PTR' +
        'GDTINCLUSAO1 AND :PTRGDTINCLUSAO2))'
      
        '   AND ((:PDATALANCAMENTO IS NULL) OR (DATALANCAMENTO BETWEEN :P' +
        'DATALANCAMENTO1 AND :PDATALANCAMENTO2))'
      
        '   AND ((:PDATAVENCIMENTO IS NULL) OR (DATAVENCIMENTO BETWEEN :P' +
        'DATAVENCIMENTO1 AND :PDATAVENCIMENTO2))'
      
        '   AND ((:PMESCOMPETENCIA IS NULL) OR (MESCOMPETENCIA = :PMESCOM' +
        'PETENCIA))'
      
        '   AND ((:PANOCOMPETENCIA IS NULL) OR (ANOCOMPETENCIA = :PANOCOM' +
        'PETENCIA))'
      
        '   AND ((:PFLGORIGEMLANC IS NULL) OR (FLGORIGEMLANC = :PFLGORIGE' +
        'MLANC))'
      ''
      'GROUP BY'
      '   IDDOCUMENTO, NODOCUMENTO, FLGORIGEMLANC, MESCOMPETENCIA,'
      
        '   ANOCOMPETENCIA, DATAVENCIMENTO, DESCCUSTORECIMO, FLGERRO, REC' +
        'PAG'
      ''
      ' ')
    PictureMasks.Strings = (
      'TOTAL_LANC'#9'#,##0.00'#9'T'#9'T'
      'NODOCUMENTO'#9'#,##0'#9'T'#9'T')
    ValidateWithMask = True
    Left = 575
    Top = 12
    ParamData = <
      item
        DataType = ftInteger
        Name = 'PIDPESSOA'
        ParamType = ptUnknown
      end
      item
        DataType = ftInteger
        Name = 'PIDUSUARIOSISTEMA'
        ParamType = ptUnknown
      end
      item
        DataType = ftInteger
        Name = 'PIDUSUARIOSISTEMA'
        ParamType = ptUnknown
      end
      item
        DataType = ftInteger
        Name = 'PIDCONTRATOIMOVEL'
        ParamType = ptUnknown
      end
      item
        DataType = ftInteger
        Name = 'PIDCONTRATOIMOVEL'
        ParamType = ptUnknown
      end
      item
        DataType = ftInteger
        Name = 'PIDTIPOCUSTORECIMO'
        ParamType = ptUnknown
      end
      item
        DataType = ftInteger
        Name = 'PIDTIPOCUSTORECIMO'
        ParamType = ptUnknown
      end
      item
        DataType = ftDateTime
        Name = 'PTRGDTINCLUSAO'
        ParamType = ptUnknown
      end
      item
        DataType = ftDateTime
        Name = 'PTRGDTINCLUSAO1'
        ParamType = ptUnknown
      end
      item
        DataType = ftDateTime
        Name = 'PTRGDTINCLUSAO2'
        ParamType = ptUnknown
      end
      item
        DataType = ftDateTime
        Name = 'PDATALANCAMENTO'
        ParamType = ptUnknown
      end
      item
        DataType = ftDateTime
        Name = 'PDATALANCAMENTO1'
        ParamType = ptUnknown
      end
      item
        DataType = ftDateTime
        Name = 'PDATALANCAMENTO2'
        ParamType = ptUnknown
      end
      item
        DataType = ftDateTime
        Name = 'PDATAVENCIMENTO'
        ParamType = ptUnknown
      end
      item
        DataType = ftDateTime
        Name = 'PDATAVENCIMENTO1'
        ParamType = ptUnknown
      end
      item
        DataType = ftDateTime
        Name = 'PDATAVENCIMENTO2'
        ParamType = ptUnknown
      end
      item
        DataType = ftInteger
        Name = 'PMESCOMPETENCIA'
        ParamType = ptUnknown
      end
      item
        DataType = ftInteger
        Name = 'PMESCOMPETENCIA'
        ParamType = ptUnknown
      end
      item
        DataType = ftInteger
        Name = 'PANOCOMPETENCIA'
        ParamType = ptUnknown
      end
      item
        DataType = ftInteger
        Name = 'PANOCOMPETENCIA'
        ParamType = ptUnknown
      end
      item
        DataType = ftString
        Name = 'PFLGORIGEMLANC'
        ParamType = ptUnknown
      end
      item
        DataType = ftString
        Name = 'PFLGORIGEMLANC'
        ParamType = ptUnknown
      end>
    object qryDocumento_ORIGEMLANC: TStringField
      FieldKind = fkCalculated
      FieldName = '_ORIGEMLANC'
      Calculated = True
    end
    object qryDocumento_DESCERRO: TStringField
      DisplayWidth = 200
      FieldKind = fkCalculated
      FieldName = '_DESCERRO'
      Size = 200
      Calculated = True
    end
    object qryDocumento_RECPAG: TStringField
      FieldKind = fkCalculated
      FieldName = '_RECPAG'
      Calculated = True
    end
    object qryDocumentoIDDOCUMENTO: TFloatField
      FieldName = 'IDDOCUMENTO'
    end
    object qryDocumentoNODOCUMENTO: TFloatField
      FieldName = 'NODOCUMENTO'
      Origin = 'VWLANCAMENTO.NODOCUMENTO'
    end
    object qryDocumentoTOTAL_LANC: TFloatField
      FieldName = 'TOTAL_LANC'
      Origin = '"CM.VWLANCAMENTO".VALOR_LANC'
      DisplayFormat = '#,##0.00'
      EditFormat = '#,##0.00'
    end
    object qryDocumentoTOTAL_OM_LANC: TFloatField
      FieldName = 'TOTAL_OM_LANC'
      Origin = '"CM.VWLANCAMENTO".VALOR_OM_LANC'
    end
    object qryDocumentoFLGORIGEMLANC: TStringField
      FieldName = 'FLGORIGEMLANC'
      Origin = 'BASEDADOS.VWLANCAMENTO.FLGORIGEMLANC'
      FixedChar = True
      Size = 1
    end
    object qryDocumentoMESCOMPETENCIA: TFloatField
      FieldName = 'MESCOMPETENCIA'
      Origin = 'BASEDADOS.VWLANCAMENTO.MESCOMPETENCIA'
    end
    object qryDocumentoANOCOMPETENCIA: TFloatField
      FieldName = 'ANOCOMPETENCIA'
      Origin = 'BASEDADOS.VWLANCAMENTO.ANOCOMPETENCIA'
    end
    object qryDocumentoDATAVENCIMENTO: TDateTimeField
      FieldName = 'DATAVENCIMENTO'
      Origin = 'BASEDADOS.VWLANCAMENTO.DATAVENCIMENTO'
    end
    object qryDocumentoDESCCUSTORECIMO: TStringField
      FieldName = 'DESCCUSTORECIMO'
      Origin = 'BASEDADOS.VWLANCAMENTO.DESCCUSTORECIMO'
      Size = 60
    end
    object qryDocumentoFLGERRO: TFloatField
      FieldName = 'FLGERRO'
      Origin = 'BASEDADOS.VWLANCAMENTO.FLGERRO'
    end
    object qryDocumentoRECPAG: TStringField
      FieldName = 'RECPAG'
      Origin = 'BASEDADOS.VWLANCAMENTO.RECPAG'
      FixedChar = True
      Size = 1
    end
  end
  object dsLancamentos: TwwDataSource
    DataSet = qryLancamentos
    Left = 657
  end
  object qryLancamentos: TwwQuery
    DatabaseName = 'BaseDados'
    DataSource = dsDocumento
    SQL.Strings = (
      'SELECT'
      '   IMOVEL_EXTENSO,'
      '   CONTRATO_EXTENSO,'
      '   VALOR_LANC,'
      '   MSGERROINTEGRA,'
      '   CODTIPIMOVEL'
      ''
      'FROM '
      '   VWLANCAMENTO'
      ''
      'WHERE'
      '   IDDOCUMENTO = :IDDOCUMENTO'
      ' '
      ' ')
    ValidateWithMask = True
    Left = 657
    Top = 12
    ParamData = <
      item
        DataType = ftFloat
        Name = 'IDDOCUMENTO'
        ParamType = ptInput
      end>
    object qryLancamentosIMOVEL_EXTENSO: TStringField
      FieldName = 'IMOVEL_EXTENSO'
      Origin = 'BASEDADOS.VWLANCAMENTO.IMOVEL_EXTENSO'
      Size = 123
    end
    object qryLancamentosCONTRATO_EXTENSO: TStringField
      FieldName = 'CONTRATO_EXTENSO'
      Origin = 'BASEDADOS.VWLANCAMENTO.CONTRATO_EXTENSO'
      Size = 83
    end
    object qryLancamentosVALOR_LANC: TFloatField
      FieldName = 'VALOR_LANC'
      Origin = 'BASEDADOS.VWLANCAMENTO.VALOR_LANC'
      DisplayFormat = '#,##0.00'
      EditFormat = '#,##0.00'
    end
    object qryLancamentosMSGERROINTEGRA: TStringField
      FieldName = 'MSGERROINTEGRA'
      FixedChar = True
      Size = 120
    end
    object qryLancamentosCODTIPIMOVEL: TStringField
      FieldName = 'CODTIPIMOVEL'
      Origin = 'BASEDADOS."CM.VWLANCAMENTO".CODTIPIMOVEL'
      Size = 5
    end
  end
  object pupmLibera: TPopupMenu
    OnPopup = pupmLiberaPopup
    Left = 497
    object miLibera: TMenuItem
      Caption = 'Libera Responsabilidade'
      OnClick = miLiberaClick
    end
    object VoltaraoIncio1: TMenuItem
      Caption = 'Voltar ao Início'
      OnClick = VoltaraoIncio1Click
    end
  end
  object qryUpdLancImovel: TwwQuery
    DatabaseName = 'BaseDados'
    SQL.Strings = (
      'UPDATE'
      '   LANCAMENTOSIMOVEL'
      'SET'
      '   FLGERRO = :PFLGERRO'
      'WHERE'
      '   IDDOCUMENTO = :PIDDOCUMENTO')
    ValidateWithMask = True
    Left = 408
    ParamData = <
      item
        DataType = ftInteger
        Name = 'PFLGERRO'
        ParamType = ptUnknown
      end
      item
        DataType = ftInteger
        Name = 'PIDDOCUMENTO'
        ParamType = ptUnknown
      end>
  end
end
