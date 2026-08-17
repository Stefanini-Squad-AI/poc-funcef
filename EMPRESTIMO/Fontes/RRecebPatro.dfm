inherited frmRelRecebPatro: TfrmRelRecebPatro
  Left = 104
  Top = 108
  HelpContext = 150012
  Caption = 'Histórico de Recebimentos da(s)s Patrocinadora(s)'
  ClientHeight = 427
  ClientWidth = 566
  PixelsPerInch = 96
  TextHeight = 13
  inherited pnlFundo: TPanel
    Width = 566
    Height = 394
    object pgc: TPageControl
      Left = 0
      Top = 0
      Width = 566
      Height = 394
      ActivePage = tbsParametros
      Align = alClient
      BiDiMode = bdLeftToRight
      ParentBiDiMode = False
      TabOrder = 0
      object tbsPrincipal: TTabSheet
        Caption = 'tbsPrincipal'
        TabVisible = False
        object Label1: TLabel
          Left = 8
          Top = 10
          Width = 80
          Height = 13
          Caption = 'Patrocinadora'
        end
        object Bevel1: TBevel
          Left = 8
          Top = 328
          Width = 537
          Height = 2
          Shape = bsTopLine
        end
        object Label4: TLabel
          Left = 10
          Top = 300
          Width = 69
          Height = 13
          Caption = 'Documento:'
        end
        object Label6: TLabel
          Left = 264
          Top = 300
          Width = 50
          Height = 13
          Caption = 'Planilha:'
        end
        object DBcboPatroHist: TwwDBLookupCombo
          Left = 8
          Top = 24
          Width = 377
          Height = 21
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'MS Sans Serif'
          Font.Style = []
          DropDownAlignment = taLeftJustify
          Selected.Strings = (
            'NOME'#9'60'#9'NOME'#9'F')
          LookupTable = dtmLookEmptmo.qryLookPatro
          LookupField = 'IDPESSOA'
          Style = csDropDownList
          ParentFont = False
          TabOrder = 0
          AutoDropDown = False
          ShowButton = True
          UseTFields = False
          AllowClearKey = True
          ShowMatchText = True
          OnCloseUp = DBcboPatroHistCloseUp
          OnKeyDown = DBcboPatroHistKeyUp
          OnKeyUp = DBcboPatroHistKeyUp
        end
        object DBgrdItensConcessao: TwwDBGrid
          Left = 8
          Top = 82
          Width = 537
          Height = 199
          Selected.Strings = (
            'NOME'#9'40'#9'Patrocinadora'
            'MES_EXTENSO'#9'11'#9'      Mês'
            'RPEANOCOBRANCA'#9'5'#9' Ano'
            'RPEVLR'#9'13'#9'Valor')
          IniAttributes.Delimiter = ';;'
          TitleColor = clBtnFace
          FixedCols = 0
          ShowHorzScrollBar = True
          DataSource = dtsHistRecPatro
          Options = [dgTitles, dgIndicator, dgColumnResize, dgColLines, dgRowLines, dgTabs, dgRowSelect, dgAlwaysShowSelection, dgConfirmDelete, dgCancelOnExit, dgWordWrap]
          TabOrder = 2
          TitleAlignment = taLeftJustify
          TitleFont.Charset = DEFAULT_CHARSET
          TitleFont.Color = clWindowText
          TitleFont.Height = -9
          TitleFont.Name = 'MS Sans Serif'
          TitleFont.Style = [fsBold]
          TitleLines = 1
          TitleButtons = False
          OnCalcCellColors = DBgrdItensConcessaoCalcCellColors
          IndicatorColor = icBlack
          OnTopRowChanged = DBgrdItensConcessaoTopRowChanged
        end
        object btnExcluiDocumento: TBitBtn
          Left = 8
          Top = 344
          Width = 233
          Height = 29
          Caption = 'Excluir Documento de Recebimento'
          TabOrder = 3
          OnClick = btnExcluiDocumentoClick
        end
        object btnNovoDocumento: TBitBtn
          Left = 312
          Top = 344
          Width = 233
          Height = 29
          Caption = 'Novo Documento de Recebimento'
          TabOrder = 4
          OnClick = btnNovoDocumentoClick
        end
        object Panel3: TPanel
          Left = 8
          Top = 56
          Width = 537
          Height = 27
          BevelInner = bvRaised
          BevelOuter = bvLowered
          Caption = 'Histórico de Recebimentos'
          Color = clNavy
          Font.Charset = ANSI_CHARSET
          Font.Color = clWhite
          Font.Height = -16
          Font.Name = 'Arial'
          Font.Style = [fsBold]
          ParentFont = False
          TabOrder = 1
        end
        object DBEdit1: TDBEdit
          Left = 320
          Top = 296
          Width = 121
          Height = 21
          DataField = 'PLNCODIGO'
          DataSource = dtsHistRecPatro
          Enabled = False
          TabOrder = 5
        end
        object DBEdit2: TDBEdit
          Left = 88
          Top = 296
          Width = 121
          Height = 21
          DataField = 'CODDOCUMENTO'
          DataSource = dtsHistRecPatro
          Enabled = False
          TabOrder = 6
        end
        object DBEdit3: TDBEdit
          Left = 440
          Top = 296
          Width = 105
          Height = 21
          DataField = 'PLNPLANIL'
          DataSource = dtsHistRecPatro
          Enabled = False
          TabOrder = 7
        end
      end
      object tbsParametros: TTabSheet
        Caption = 'tbsParametros'
        ImageIndex = 1
        TabVisible = False
        object Bevel2: TBevel
          Left = 8
          Top = 328
          Width = 537
          Height = 2
          Shape = bsTopLine
        end
        object Label2: TLabel
          Left = 40
          Top = 90
          Width = 80
          Height = 13
          Caption = 'Patrocinadora'
        end
        object btnVoltar: TfcShapeBtn
          Left = 360
          Top = 344
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
          TabOrder = 0
          TabStop = True
          TextOptions.Alignment = taCenter
          TextOptions.ExtrudeEffects.Depth = 4
          TextOptions.ExtrudeEffects.Orientation = fcTopRight
          TextOptions.VAlignment = vaVCenter
          OnClick = btnVoltarClick
        end
        object DBcboPatroLanc: TwwDBLookupCombo
          Left = 40
          Top = 104
          Width = 481
          Height = 21
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'MS Sans Serif'
          Font.Style = []
          DropDownAlignment = taLeftJustify
          Selected.Strings = (
            'NOME'#9'60'#9'NOME'#9'F')
          LookupTable = dtmLookEmptmo.qryLookPatro
          LookupField = 'IDPESSOA'
          Style = csDropDownList
          ParentFont = False
          TabOrder = 1
          AutoDropDown = False
          ShowButton = True
          UseTFields = False
          AllowClearKey = False
          ShowMatchText = True
        end
        object Panel1: TPanel
          Left = 40
          Top = 160
          Width = 481
          Height = 65
          TabOrder = 2
          object Label15: TLabel
            Left = 16
            Top = 14
            Width = 148
            Height = 13
            Caption = 'Mês/Ano de Recebimento'
          end
          object Label5: TLabel
            Left = 240
            Top = 14
            Width = 101
            Height = 13
            Caption = 'Data Lançamento'
          end
          object Label3: TLabel
            Left = 360
            Top = 14
            Width = 98
            Height = 13
            Caption = 'Data Vencimento'
          end
          object DBspnAno: TwwDBSpinEdit
            Left = 160
            Top = 28
            Width = 65
            Height = 21
            Increment = 1
            TabOrder = 1
            UnboundDataType = wwDefault
          end
          object cboMes: TComboBox
            Left = 16
            Top = 28
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
          object edtDataLancto: TwwDBDateTimePicker
            Left = 240
            Top = 28
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
          object edtDataVencto: TwwDBDateTimePicker
            Left = 360
            Top = 28
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
            TabOrder = 3
            UnboundDataType = wwDTEdtDate
            DisplayFormat = 'dd/mm/yyyy'
          end
        end
        object btnConfirma: TBitBtn
          Left = 456
          Top = 344
          Width = 89
          Height = 29
          Caption = 'Confirma'
          TabOrder = 3
          OnClick = btnConfirmaClick
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
          Layout = blGlyphRight
          NumGlyphs = 2
        end
      end
    end
  end
  inherited Dock971: TDock97
    Top = 394
    Width = 566
    inherited tb97Fundo: TToolbar97
      Left = 394
    end
  end
  object qryHistRecPatro: TwwQuery
    DatabaseName = 'BaseDados'
    SQL.Strings = (
      'SELECT'
      '   RPE.IDHISTRECPATROEP,'
      '   RPE.IDPATRO,'
      '   RPE.CODDOCUMENTO,'
      '   RPE.PLNCODIGO,'
      '   RPE.RPEDATA,'
      '   RPE.RPEVLR,'
      '   RPE.RPEMESCOBRANCA,'
      '   RPE.RPEANOCOBRANCA,'
      ''
      '   DECODE(RPE.RPEMESCOBRANCA,   1, '#39'Janeiro'#39','
      '                              2, '#39'Fevereiro'#39','
      '                              3, '#39'Março'#39','
      '                              4, '#39'Abril'#39','
      '                              5, '#39'Maio'#39','
      '                              6, '#39'Junho'#39','
      '                              7, '#39'Julho'#39','
      '                              8, '#39'Agosto'#39','
      '                              9, '#39'Setembro'#39','
      '                             10, '#39'Outubro'#39','
      '                             11, '#39'Novembro'#39','
      '                             12, '#39'Dezembro'#39') AS MES_EXTENSO,'
      ''
      '   PES.NOME,'
      ''
      '   PLN.PLNPLANIL,'
      ''
      '   DOC.DATAVENCTO'
      ''
      'FROM'
      
        '   PESSOA PES, PLANILHA PLN, DOCUMENTO DOC, HISTRECPATROEP RPE, ' +
        'PATRO PTR'
      ''
      ''
      'WHERE'
      '       ( (:PIDPATRO       IS NULL) OR (IDPATRO =:PIDPATRO) )'
      '   AND ( RPE.IDPATRO      = PTR.IDPESSOA )'
      '   AND ( PTR.IDPESSOA     = PES.IDPESSOA )'
      '   AND ( RPE.CODDOCUMENTO = DOC.CODDOCUMENTO(+) )'
      '   AND ( RPE.PLNCODIGO    = PLN.PLNCODIGO )'
      '   AND ( PLN.IDMODULO     = :PIDMODULO )'
      '   AND ( PLN.IDPESSOA     = :PIDEMPRESAPROP)'
      ''
      'ORDER BY'
      '   RPE.RPEANOCOBRANCA, RPE.RPEMESCOBRANCA, PES.NOME')
    ValidateWithMask = True
    Left = 440
    ParamData = <
      item
        DataType = ftInteger
        Name = 'PIDPATRO'
        ParamType = ptInput
      end
      item
        DataType = ftInteger
        Name = 'PIDPATRO'
        ParamType = ptInput
      end
      item
        DataType = ftInteger
        Name = 'PIDMODULO'
        ParamType = ptInput
      end
      item
        DataType = ftInteger
        Name = 'PIDEMPRESAPROP'
        ParamType = ptInput
      end>
    object qryHistRecPatroNOME: TStringField
      DisplayLabel = 'Patrocinadora'
      DisplayWidth = 40
      FieldName = 'NOME'
      Origin = 'BASEDADOS."CM.PESSOA".NOME'
      Size = 60
    end
    object qryHistRecPatroMES_EXTENSO: TStringField
      DisplayLabel = '      Mês'
      DisplayWidth = 11
      FieldName = 'MES_EXTENSO'
      Size = 9
    end
    object qryHistRecPatroRPEANOCOBRANCA: TFloatField
      DisplayLabel = ' Ano'
      DisplayWidth = 5
      FieldName = 'RPEANOCOBRANCA'
      Origin = 'BASEDADOS.HISTRECPATROEP.RPEANOCOBRANCA'
    end
    object qryHistRecPatroRPEVLR: TFloatField
      DisplayLabel = 'Valor'
      DisplayWidth = 13
      FieldName = 'RPEVLR'
      Origin = 'BASEDADOS.HISTRECPATROEP.RPEVLR'
    end
    object qryHistRecPatroRPEMESCOBRANCA: TFloatField
      DisplayLabel = '      Mês'
      DisplayWidth = 11
      FieldName = 'RPEMESCOBRANCA'
      Origin = 'BASEDADOS.HISTRECPATROEP.RPEMESCOBRANCA'
      Visible = False
    end
    object qryHistRecPatroIDHISTRECPATROEP: TFloatField
      FieldName = 'IDHISTRECPATROEP'
      Origin = 'BASEDADOS.HISTRECPATROEP.IDHISTRECPATROEP'
      Visible = False
    end
    object qryHistRecPatroIDPATRO: TFloatField
      FieldName = 'IDPATRO'
      Origin = 'BASEDADOS.HISTRECPATROEP.IDPATRO'
      Visible = False
    end
    object qryHistRecPatroCODDOCUMENTO: TFloatField
      FieldName = 'CODDOCUMENTO'
      Origin = 'BASEDADOS.HISTRECPATROEP.CODDOCUMENTO'
      Visible = False
    end
    object qryHistRecPatroPLNCODIGO: TFloatField
      FieldName = 'PLNCODIGO'
      Origin = 'BASEDADOS.HISTRECPATROEP.PLNCODIGO'
      Visible = False
    end
    object qryHistRecPatroDATAVENCTO: TDateTimeField
      FieldName = 'DATAVENCTO'
      Origin = 'BASEDADOS.DOCUMENTO.DATAVENCTO'
      Visible = False
    end
    object qryHistRecPatroRPEDATA: TDateTimeField
      FieldName = 'RPEDATA'
      Visible = False
    end
    object qryHistRecPatroPLNPLANIL: TFloatField
      FieldName = 'PLNPLANIL'
      Visible = False
    end
  end
  object dtsHistRecPatro: TwwDataSource
    DataSet = qryHistRecPatro
    Left = 440
    Top = 14
  end
end
