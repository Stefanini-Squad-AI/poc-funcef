inherited frmExecParcelas: TfrmExecParcelas
  Left = 411
  HelpContext = 1350005
  Caption = 'Geração de Parcelas'
  ClientHeight = 416
  ClientWidth = 644
  PixelsPerInch = 96
  TextHeight = 13
  inherited pnlFundo: TPanel
    Width = 644
    Height = 383
    object lblTitulo: TfcLabel
      Left = 0
      Top = 0
      Width = 644
      Height = 24
      Align = alTop
      Caption = 'Geração de Parcelas [Seleção]'
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
    object ntbFolha: TNotebook
      Left = 0
      Top = 33
      Width = 644
      Height = 350
      Align = alBottom
      TabOrder = 0
      OnPageChanged = ntbFolhaPageChanged
      object TPage
        Left = 0
        Top = 0
        Caption = 'Selecao'
        inline molProposta1: TmolProposta
          Left = 32
          Top = 16
          inherited Label1: TLabel
            Width = 85
            Caption = 'Nº do Contrato'
          end
          inherited Label2: TLabel
            Width = 103
            Caption = 'Nome do Contrato'
          end
          inherited btnBuscaProp: TBitBtn
            OnClick = molProposta1btnBuscaPropClick
          end
        end
        inline molComprador1: TmolComprador
          Left = 33
          Top = 120
          Width = 516
          TabOrder = 1
          inherited edtRazaoSocial: TEdit
            Width = 449
          end
          inherited btnBuscaForn: TBitBtn
            Left = 456
            OnClick = molComprador1btnBuscaFornClick
          end
          inherited btnLimpaForn: TBitBtn
            Left = 480
          end
        end
        object btnContinua1: TfcShapeBtn
          Left = 487
          Top = 304
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
          TabOrder = 2
          TabStop = True
          TextOptions.Alignment = taCenter
          TextOptions.ExtrudeEffects.Depth = 4
          TextOptions.ExtrudeEffects.Orientation = fcTopRight
          TextOptions.VAlignment = vaVCenter
          OnClick = btnContinua1Click
        end
        inline molResponsavel1: TmolResponsavel
          Left = 32
          Top = 67
          Width = 533
          TabOrder = 3
          inherited edtResponsavel: TEdit
            Width = 449
          end
          inherited btnBuscaResponsavel: TBitBtn
            Left = 458
          end
          inherited btnLimpaResponsavel: TBitBtn
            Left = 482
          end
          inherited btnAbrePessoa: TBitBtn
            Visible = False
          end
        end
        object GroupBox1: TGroupBox
          Left = 40
          Top = 219
          Width = 281
          Height = 73
          Caption = 'Competência'
          TabOrder = 4
          object Label15: TLabel
            Left = 16
            Top = 22
            Width = 24
            Height = 13
            Caption = 'Mês'
          end
          object Label1: TLabel
            Left = 200
            Top = 22
            Width = 23
            Height = 13
            Caption = 'Ano'
          end
          object cboMes: TComboBox
            Left = 16
            Top = 36
            Width = 161
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
          object DBspnAno: TwwDBSpinEdit
            Left = 200
            Top = 36
            Width = 65
            Height = 21
            Increment = 1
            TabOrder = 1
            UnboundDataType = wwDefault
          end
        end
        inline molAdministradora1: TmolAdministradora
          Left = 32
          Top = 173
          Width = 529
          TabOrder = 5
          inherited edtAdministradora: TEdit
            Width = 449
          end
          inherited btnBuscaAdministradora: TBitBtn
            Left = 456
          end
          inherited btnLimpaAdministradora: TBitBtn
            Left = 480
          end
          inherited btnAbrePessoa: TBitBtn
            Visible = False
          end
        end
        object cbRecalculo: TCheckBox
          Left = 40
          Top = 323
          Width = 337
          Height = 17
          Caption = 'Recalcula as condições de pagamento já encerradas'
          TabOrder = 6
        end
        object cbSalva: TCheckBox
          Left = 40
          Top = 303
          Width = 361
          Height = 17
          Caption = 'Salva parcelas ao final do calculo de cada contrato'
          TabOrder = 7
        end
        object GroupBox2: TGroupBox
          Left = 328
          Top = 219
          Width = 209
          Height = 73
          Caption = ' Tipo '
          TabOrder = 8
          object cbContrato: TCheckBox
            Left = 48
            Top = 24
            Width = 97
            Height = 17
            Caption = 'Contrato'
            Checked = True
            State = cbChecked
            TabOrder = 0
          end
          object cbAcordo: TCheckBox
            Left = 48
            Top = 48
            Width = 97
            Height = 17
            Caption = 'Acordo'
            Checked = True
            State = cbChecked
            TabOrder = 1
          end
        end
      end
      object TPage
        Left = 0
        Top = 0
        Caption = 'Confirma'
        object pcParcelas: TPageControl
          Left = 0
          Top = 27
          Width = 644
          Height = 277
          ActivePage = tsContrato
          Align = alClient
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -9
          Font.Name = 'MS Sans Serif'
          Font.Style = []
          ParentFont = False
          TabOrder = 2
          TabPosition = tpBottom
          OnChange = pcParcelasChange
          object tsContrato: TTabSheet
            Caption = 'Contratos'
            object grdContrato: TwwDBGrid
              Left = 0
              Top = 0
              Width = 636
              Height = 249
              IniAttributes.Delimiter = ';;'
              TitleColor = clBtnFace
              FixedCols = 0
              ShowHorzScrollBar = True
              Align = alClient
              BorderStyle = bsNone
              DataSource = dsProp
              Options = [dgTitles, dgIndicator, dgColumnResize, dgColLines, dgRowLines, dgTabs, dgRowSelect, dgConfirmDelete, dgCancelOnExit, dgWordWrap]
              TabOrder = 0
              TitleAlignment = taLeftJustify
              TitleFont.Charset = DEFAULT_CHARSET
              TitleFont.Color = clWindowText
              TitleFont.Height = -9
              TitleFont.Name = 'MS Sans Serif'
              TitleFont.Style = []
              TitleLines = 1
              TitleButtons = False
              OnCalcCellColors = grdContratoCalcCellColors
              IndicatorColor = icBlack
              OnTopRowChanged = grdContratoTopRowChanged
            end
          end
          object tsParcela: TTabSheet
            Caption = 'Parcelas'
            ImageIndex = 1
            object grdParcelas: TwwDBGrid
              Left = 0
              Top = 0
              Width = 636
              Height = 249
              IniAttributes.Delimiter = ';;'
              TitleColor = clBtnFace
              FixedCols = 0
              ShowHorzScrollBar = True
              Align = alClient
              BorderStyle = bsNone
              DataSource = dsParcGlobal
              Options = [dgTitles, dgIndicator, dgColumnResize, dgColLines, dgRowLines, dgTabs, dgRowSelect, dgConfirmDelete, dgCancelOnExit, dgWordWrap]
              TabOrder = 0
              TitleAlignment = taCenter
              TitleFont.Charset = DEFAULT_CHARSET
              TitleFont.Color = clWindowText
              TitleFont.Height = -9
              TitleFont.Name = 'MS Sans Serif'
              TitleFont.Style = []
              TitleLines = 2
              TitleButtons = False
              OnCalcCellColors = grdContratoCalcCellColors
              IndicatorColor = icBlack
              OnTopRowChanged = grdContratoTopRowChanged
            end
          end
        end
        object Panel4: TPanel
          Left = 0
          Top = 0
          Width = 644
          Height = 27
          Align = alTop
          BevelInner = bvRaised
          BevelOuter = bvLowered
          Caption = 'Parcelas Geradas'
          Color = clNavy
          Font.Charset = ANSI_CHARSET
          Font.Color = clWhite
          Font.Height = -19
          Font.Name = 'Courier New'
          Font.Style = [fsBold]
          ParentFont = False
          TabOrder = 0
        end
        object Panel1: TPanel
          Left = 0
          Top = 304
          Width = 644
          Height = 46
          Align = alBottom
          TabOrder = 1
          object btnContinua2: TfcShapeBtn
            Left = 517
            Top = 10
            Width = 89
            Height = 29
            Caption = 'Salvar'
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
            ParentShowHint = False
            RoundRectBias = 25
            ShadeStyle = fbsHighlight
            ShowHint = True
            TabOrder = 0
            TabStop = True
            TextOptions.Alignment = taCenter
            TextOptions.ExtrudeEffects.Depth = 4
            TextOptions.ExtrudeEffects.Orientation = fcTopRight
            TextOptions.VAlignment = vaVCenter
            OnClick = btnContinua2Click
          end
          object btnCancela2: TfcShapeBtn
            Left = 427
            Top = 10
            Width = 89
            Height = 29
            Caption = 'Cancelar'
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
              8888888888FFFFF8888888888000008888888888F777778FF888888009191900
              88888887788888778F88887991919191088888788888888878F8879919191919
              108887F88888888887F88791919191919088878888888888878F791919191919
              19087F88FFFFFFFFF87F79988888888891087F8777777777F87F791FFFFFFFF8
              19087F8777777777F87F799FFFFFFFF891087F8777777777887F791919191919
              190878F8888888888878879191919191908887F88888888887F8879919191919
              1088878F88888888878888799191919108888878FF88888F7888888779999977
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
            TabOrder = 1
            TabStop = True
            TextOptions.Alignment = taCenter
            TextOptions.ExtrudeEffects.Depth = 4
            TextOptions.ExtrudeEffects.Orientation = fcTopRight
            TextOptions.VAlignment = vaVCenter
            OnClick = btnCancela2Click
          end
          object cbSaldoInicial: TCheckBox
            Left = 8
            Top = 7
            Width = 185
            Height = 17
            Caption = 'Exibe Saldo Devedor Inicial'
            TabOrder = 2
            OnClick = pcParcelasChange
          end
          object cbProj: TCheckBox
            Left = 8
            Top = 24
            Width = 193
            Height = 17
            Caption = 'Exibe as Parcelas Projetadas'
            Checked = True
            State = cbChecked
            TabOrder = 3
            OnClick = pcParcelasChange
          end
          object cbIntegra: TCheckBox
            Left = 208
            Top = 7
            Width = 193
            Height = 17
            Caption = 'Exibe as Parcelas Integradas'
            Checked = True
            State = cbChecked
            TabOrder = 4
            OnClick = pcParcelasChange
          end
        end
      end
    end
  end
  inherited Dock971: TDock97
    Top = 383
    Width = 644
    inherited tb97Fundo: TToolbar97
      Left = 424
      DockPos = 424
      inherited sep1: TToolbarSep97
        Left = 91
      end
      inherited ToolbarSep972: TToolbarSep97
        Left = 182
      end
      inherited bbtnSair: TBitBtn
        Width = 89
      end
      inherited bbtnAjuda: TmaHelpBitBtn
        Left = 93
        Width = 89
      end
    end
  end
  object dsParcGlobal: TwwDataSource
    AutoEdit = False
    DataSet = qryParcGlobal
    Left = 576
    Top = 224
  end
  object qryProp: TwwQuery
    CachedUpdates = True
    DatabaseName = 'BaseDados'
    SQL.Strings = (
      'SELECT'
      '     CI.IDCONTRATOIMOVEL,'
      '     CI.CONNUMERO,'
      '     CI.CONNOME,'
      '     CI.CONDATAINICIO,'
      '     CI.FLGTIPOCONTRATO,'
      '     CI.CONTAXAADMIN,'
      '     CI.CONVLRAJUSTADO,'
      '     CI.PERALUGUELIDEAL,'
      '     CI.CONVLRTOTAL,'
      '     CI.CONDESCRICAO,'
      '     CI.VLRPROPOSTA,'
      '     CI.VLRPRESENTE,'
      '     CI.VLRCONTABIL,'
      '     CI.CONINDICEMORA,'
      '     CI.CONINDICEREAJUSTE,'
      '     CI.CONDATAREAJUSTE,'
      '     P.RAZAOSOCIAL'
      'FROM'
      '     CONTRATOIMOVEL CI,'
      '     PESSOA P'
      'WHERE'
      '         (CI.FLGSTATUS = '#39'V'#39')'
      '     AND (CI.IDLOCATARIO = P.IDPESSOA)'
      
        '     AND ((:pIDCONTRATOIMOVEL IS NULL) OR (CI.IDCONTRATOIMOVEL =' +
        ' :pIDCONTRATOIMOVEL))'
      
        '     AND ((:pIDLOCATARIO IS NULL) OR (CI.IDLOCATARIO = :pIDLOCAT' +
        'ARIO))'
      
        '     AND ((:pIDRESPONSAVEL IS NULL) OR (CI.IDRESPONSAVEL = :pIDR' +
        'ESPONSAVEL))'
      
        '     AND ((:pIDADMINIMOVEL IS NULL) OR (CI.IDADMINIMOVEL = :pIDA' +
        'DMINIMOVEL))'
      
        '     AND (   ((:pFLGCONTRATO = '#39'S'#39') AND (CI.FLGTIPOCONTRATO = '#39'C' +
        #39'))'
      
        '          OR ((:pFLGACORDO   = '#39'S'#39') AND (CI.FLGTIPOCONTRATO = '#39'A' +
        #39'))  )'
      ''
      ''
      ' '
      ' '
      ' ')
    ValidateWithMask = True
    Left = 317
    Top = 36
    ParamData = <
      item
        DataType = ftInteger
        Name = 'pIDCONTRATOIMOVEL'
        ParamType = ptUnknown
      end
      item
        DataType = ftInteger
        Name = 'pIDCONTRATOIMOVEL'
        ParamType = ptUnknown
      end
      item
        DataType = ftInteger
        Name = 'pIDLOCATARIO'
        ParamType = ptUnknown
      end
      item
        DataType = ftInteger
        Name = 'pIDLOCATARIO'
        ParamType = ptUnknown
      end
      item
        DataType = ftInteger
        Name = 'pIDRESPONSAVEL'
        ParamType = ptUnknown
      end
      item
        DataType = ftInteger
        Name = 'pIDRESPONSAVEL'
        ParamType = ptUnknown
      end
      item
        DataType = ftInteger
        Name = 'pIDADMINIMOVEL'
        ParamType = ptUnknown
      end
      item
        DataType = ftInteger
        Name = 'pIDADMINIMOVEL'
        ParamType = ptUnknown
      end
      item
        DataType = ftString
        Name = 'pFLGCONTRATO'
        ParamType = ptInput
      end
      item
        DataType = ftString
        Name = 'pFLGACORDO'
        ParamType = ptInput
      end>
    object qryPropCONNUMERO: TStringField
      DisplayLabel = 'Nr. Contrato'
      DisplayWidth = 16
      FieldName = 'CONNUMERO'
      Origin = '"CM.CONTRATOIMOVEL".CONNUMERO'
    end
    object qryPropCONNOME: TStringField
      DisplayLabel = 'Nome do Contrato'
      DisplayWidth = 55
      FieldName = 'CONNOME'
      Origin = '"CM.CONTRATOIMOVEL".CONNOME'
      Size = 60
    end
    object qryPropRAZAOSOCIAL: TStringField
      DisplayLabel = 'Comprador'
      DisplayWidth = 60
      FieldName = 'RAZAOSOCIAL'
      Origin = 'BASEDADOS.PESSOA.RAZAOSOCIAL'
      Size = 60
    end
    object qryPropIDCONTRATOIMOVEL: TFloatField
      FieldName = 'IDCONTRATOIMOVEL'
      Origin = '"CM.CONTRATOIMOVEL".IDCONTRATOIMOVEL'
      Visible = False
    end
    object qryPropCONDATAINICIO: TDateTimeField
      FieldName = 'CONDATAINICIO'
      Origin = '"CM.CONTRATOIMOVEL".CONDATAINICIO'
      Visible = False
    end
    object qryPropFLGTIPOCONTRATO: TStringField
      FieldName = 'FLGTIPOCONTRATO'
      Origin = '"CM.CONTRATOIMOVEL".FLGTIPOCONTRATO'
      Visible = False
      Size = 1
    end
    object qryPropCONTAXAADMIN: TFloatField
      FieldName = 'CONTAXAADMIN'
      Origin = '"CM.CONTRATOIMOVEL".CONTAXAADMIN'
      Visible = False
    end
    object qryPropCONVLRAJUSTADO: TFloatField
      FieldName = 'CONVLRAJUSTADO'
      Origin = '"CM.CONTRATOIMOVEL".CONVLRAJUSTADO'
      Visible = False
    end
    object qryPropCONVLRTOTAL: TFloatField
      FieldName = 'CONVLRTOTAL'
      Origin = '"CM.CONTRATOIMOVEL".CONVLRTOTAL'
      Visible = False
    end
    object qryPropCONDESCRICAO: TMemoField
      FieldName = 'CONDESCRICAO'
      Origin = '"CM.CONTRATOIMOVEL".CONDESCRICAO'
      Visible = False
      BlobType = ftMemo
      Size = 2000
    end
    object qryPropVLRPROPOSTA: TFloatField
      FieldName = 'VLRPROPOSTA'
      Origin = '"CM.CONTRATOIMOVEL".VLRPROPOSTA'
      Visible = False
    end
    object qryPropVLRPRESENTE: TFloatField
      FieldName = 'VLRPRESENTE'
      Origin = '"CM.CONTRATOIMOVEL".VLRPRESENTE'
      Visible = False
    end
    object qryPropVLRCONTABIL: TFloatField
      FieldName = 'VLRCONTABIL'
      Origin = '"CM.CONTRATOIMOVEL".VLRCONTABIL'
      Visible = False
    end
    object qryPropCONINDICEMORA: TFloatField
      FieldName = 'CONINDICEMORA'
      Origin = '"CM.CONTRATOIMOVEL".CONINDICEMORA'
      Visible = False
    end
    object qryPropCONINDICEREAJUSTE: TFloatField
      FieldName = 'CONINDICEREAJUSTE'
      Origin = 'CONTRATOIMOVEL.CONINDICEREAJUSTE'
      Visible = False
    end
    object qryPropCONDATAREAJUSTE: TDateTimeField
      FieldName = 'CONDATAREAJUSTE'
      Origin = 'CONTRATOIMOVEL.CONDATAREAJUSTE'
      Visible = False
    end
    object qryPropPERALUGUELIDEAL: TFloatField
      FieldName = 'PERALUGUELIDEAL'
      Origin = 'BASEDADOS.CONTRATOIMOVEL.PERALUGUELIDEAL'
      Visible = False
    end
  end
  object dsProp: TwwDataSource
    AutoEdit = False
    DataSet = qryProp
    Left = 363
    Top = 52
  end
  object qryCondPag: TwwQuery
    CachedUpdates = True
    DatabaseName = 'BaseDados'
    SQL.Strings = (
      'SELECT'
      '     CP.IDCONTRATOIMOVEL,'
      '     CP.IDCONDPAGIMOVEL,'
      '     CP.IDCONDINICIAL,'
      '     CP.TIPOCONDPAG,'
      ''
      '     CPI.DATAVENCIMENTO AS DATAVENCTOINICIAL'
      'FROM'
      '     CONDPAGIMOVEL CP,'
      '     CONDPAGIMOVEL CPI'
      'WHERE'
      '      (CP.TIPOCONDPAG IN ('#39'S'#39','#39'P'#39','#39'R'#39','#39'V'#39') )'
      '  AND (CP.IDREPACTUA IS NULL)'
      
        '  AND ( (:pDATAFIM IS NULL) OR (:pDATAFIM BETWEEN TO_CHAR(CP.DAT' +
        'AINI,'#39'YYYYMM'#39') AND TO_CHAR(CP.DATAFIM,'#39'YYYYMM'#39') ) )'
      '  AND (CP.IDCONDINICIAL = CPI.IDCONDPAGIMOVEL)'
      '  AND (CP.IDCONTRATOIMOVEL = :pIDCONTRATOIMOVEL)'
      ''
      ' '
      ' '
      ' '
      ' '
      ' '
      ' '
      ' '
      ' ')
    ValidateWithMask = True
    Left = 565
    Top = 148
    ParamData = <
      item
        DataType = ftString
        Name = 'pDATAFIM'
        ParamType = ptInput
      end
      item
        DataType = ftString
        Name = 'pDATAFIM'
        ParamType = ptInput
      end
      item
        DataType = ftInteger
        Name = 'pIDCONTRATOIMOVEL'
        ParamType = ptInput
      end>
    object qryCondPagIDCONTRATOIMOVEL: TFloatField
      FieldName = 'IDCONTRATOIMOVEL'
    end
    object qryCondPagIDCONDPAGIMOVEL: TFloatField
      FieldName = 'IDCONDPAGIMOVEL'
    end
    object qryCondPagIDCONDINICIAL: TFloatField
      FieldName = 'IDCONDINICIAL'
    end
    object qryCondPagDATAVENCTOINICIAL: TDateTimeField
      FieldName = 'DATAVENCTOINICIAL'
    end
    object qryCondPagTIPOCONDPAG: TStringField
      FieldName = 'TIPOCONDPAG'
      FixedChar = True
      Size = 1
    end
  end
  object qryParcGlobal: TwwQuery
    CachedUpdates = True
    OnCalcFields = qryParcGlobalCalcFields
    DatabaseName = 'BaseDados'
    SQL.Strings = (
      'SELECT'
      '     IDPARCFINANCIMOV,'
      '     CODDOCUMENTO,'
      '     PLNCODIGO,'
      '     IDCONDPAGIMOVEL,'
      '     NUMPARCELA,'
      '     DATAVENCIMENTO,'
      '     VLRPRESTACAO,'
      '     VLRNOMINAL,'
      '     VLRJUROS,'
      '     VLRJUROSPARC,'
      '     VLRAMORTIZACAO,'
      '     VLRSALDODEVEDOR,'
      '     VLRSALDOATUAL,'
      '     VLRPRESTATUALIZADA,'
      '     VLRRESIDUO,'
      '     VLRRESIDUOATUALI,'
      '     VLRCORRSALDO,'
      '     VLRCORRIGIDOATRASO,'
      '     VLRMULTAATRASO,'
      '     VLRMORAATRASO,'
      '     NVL(FLGRESIDUOINCORP,'#39'N'#39') AS FLGRESIDUOINCORP,'
      '     FLGTIPOLANC,'
      '     FLGLANCINTEGRA,'
      '     FLGCONCILIADO,'
      '     IDINDCORRECAO,'
      '     FATORCORRECAO,'
      '     (0) AS IDCONTRATOIMOVEL'
      'FROM'
      '     PARCFINANCIMOV'
      'WHERE'
      '     IDCONDPAGIMOVEL IN(1,2,3)'
      ''
      'ORDER BY IDCONDPAGIMOVEL, DATAVENCIMENTO, FLGTIPOLANC'
      ''
      ''
      ''
      ' '
      ' '
      ' '
      ' '
      ' '
      ' ')
    UpdateObject = updParcGlobal
    ValidateWithMask = True
    Left = 581
    Top = 212
    object qryParcGlobalNUMPARCELA: TFloatField
      DisplayLabel = 'Parcela'
      DisplayWidth = 7
      FieldName = 'NUMPARCELA'
    end
    object qryParcGlobalDATAVENCIMENTO: TDateTimeField
      DisplayLabel = 'Vencimento'
      DisplayWidth = 11
      FieldName = 'DATAVENCIMENTO'
      DisplayFormat = 'dd/mm/yyyy'
    end
    object qryParcGlobalCAL_TIPO: TStringField
      DisplayLabel = 'Tipo de Parcela'
      DisplayWidth = 14
      FieldKind = fkCalculated
      FieldName = 'CAL_TIPO'
      Calculated = True
    end
    object qryParcGlobalVLRSALDOATUAL: TFloatField
      DisplayLabel = 'Saldo Devedor ~Atualizado'
      DisplayWidth = 14
      FieldName = 'VLRSALDOATUAL'
      DisplayFormat = '#,##0.00'
    end
    object qryParcGlobalVLRNOMINAL: TFloatField
      DisplayLabel = 'Prestação ~Nominal'
      DisplayWidth = 12
      FieldName = 'VLRNOMINAL'
      DisplayFormat = '#,##0.00'
    end
    object qryParcGlobalVLRAMORTIZACAO: TFloatField
      DisplayLabel = 'Amortização'
      DisplayWidth = 12
      FieldName = 'VLRAMORTIZACAO'
      DisplayFormat = '#,##0.00'
    end
    object qryParcGlobalVLRJUROS: TFloatField
      DisplayLabel = 'Juros ~ do Saldo'
      DisplayWidth = 12
      FieldName = 'VLRJUROS'
      DisplayFormat = '#,##0.00'
    end
    object qryParcGlobalVLRJUROSPARC: TFloatField
      DisplayLabel = 'Juros ~da Parcela'
      DisplayWidth = 10
      FieldName = 'VLRJUROSPARC'
      DisplayFormat = '#,##0.00'
    end
    object qryParcGlobalVLRCORRSALDO: TFloatField
      DisplayLabel = 'Correção ~do Saldo'
      DisplayWidth = 13
      FieldName = 'VLRCORRSALDO'
      DisplayFormat = '#,##0.00'
    end
    object qryParcGlobalVLRRESIDUO: TFloatField
      DisplayLabel = 'Corr / Resíduo ~da Parcela'
      DisplayWidth = 12
      FieldName = 'VLRRESIDUO'
      DisplayFormat = '#,##0.00'
    end
    object qryParcGlobalVLRPRESTACAO: TFloatField
      DisplayLabel = 'Prestação ~Efetiva'
      DisplayWidth = 13
      FieldName = 'VLRPRESTACAO'
      DisplayFormat = '#,##0.00'
    end
    object qryParcGlobalVLRSALDODEVEDOR: TFloatField
      DisplayLabel = 'Saldo Devedor ~Amortizado'
      DisplayWidth = 15
      FieldName = 'VLRSALDODEVEDOR'
      DisplayFormat = '#,##0.00'
    end
    object qryParcGlobalVLRPRESTATUALIZADA: TFloatField
      DisplayLabel = 'Prestação ~Atualizada'
      DisplayWidth = 13
      FieldName = 'VLRPRESTATUALIZADA'
      DisplayFormat = '#,##0.00'
    end
    object qryParcGlobalVLRRESIDUOATUALI: TFloatField
      DisplayLabel = 'Resíduo ~Atualizado'
      DisplayWidth = 12
      FieldName = 'VLRRESIDUOATUALI'
      DisplayFormat = '#,##0.00'
    end
    object qryParcGlobalFATORCORRECAO: TFloatField
      DisplayLabel = 'Fator de ~Correção'
      DisplayWidth = 10
      FieldName = 'FATORCORRECAO'
      DisplayFormat = '#0.0000'
    end
    object qryParcGlobalIDPARCFINANCIMOV: TFloatField
      FieldName = 'IDPARCFINANCIMOV'
      Visible = False
    end
    object qryParcGlobalCODDOCUMENTO: TFloatField
      FieldName = 'CODDOCUMENTO'
      Visible = False
    end
    object qryParcGlobalPLNCODIGO: TFloatField
      FieldName = 'PLNCODIGO'
      Visible = False
    end
    object qryParcGlobalIDCONDPAGIMOVEL: TFloatField
      FieldName = 'IDCONDPAGIMOVEL'
      Visible = False
    end
    object qryParcGlobalVLRCORRIGIDOATRASO: TFloatField
      FieldName = 'VLRCORRIGIDOATRASO'
      Visible = False
    end
    object qryParcGlobalVLRMULTAATRASO: TFloatField
      FieldName = 'VLRMULTAATRASO'
      Visible = False
    end
    object qryParcGlobalVLRMORAATRASO: TFloatField
      FieldName = 'VLRMORAATRASO'
      Visible = False
    end
    object qryParcGlobalFLGRESIDUOINCORP: TStringField
      FieldName = 'FLGRESIDUOINCORP'
      Visible = False
      FixedChar = True
      Size = 1
    end
    object qryParcGlobalFLGTIPOLANC: TFloatField
      FieldName = 'FLGTIPOLANC'
      Visible = False
    end
    object qryParcGlobalFLGLANCINTEGRA: TFloatField
      FieldName = 'FLGLANCINTEGRA'
      Visible = False
    end
    object qryParcGlobalFLGCONCILIADO: TStringField
      FieldName = 'FLGCONCILIADO'
      Visible = False
      FixedChar = True
      Size = 1
    end
    object qryParcGlobalIDINDCORRECAO: TFloatField
      FieldName = 'IDINDCORRECAO'
      Visible = False
    end
    object qryParcGlobalIDCONTRATOIMOVEL: TFloatField
      FieldName = 'IDCONTRATOIMOVEL'
      Visible = False
    end
  end
  object updParcGlobal: TUpdateSQL
    ModifySQL.Strings = (
      'update PARCFINANCIMOV'
      'set'
      '  CODDOCUMENTO = :CODDOCUMENTO,'
      '  PLNCODIGO = :PLNCODIGO,'
      '  IDCONDPAGIMOVEL = :IDCONDPAGIMOVEL,'
      '  NUMPARCELA = :NUMPARCELA,'
      '  DATAVENCIMENTO = :DATAVENCIMENTO,'
      '  VLRPRESTACAO = :VLRPRESTACAO,'
      '  VLRNOMINAL = :VLRNOMINAL,'
      '  VLRJUROS = :VLRJUROS,'
      '  VLRJUROSPARC = :VLRJUROSPARC,'
      '  VLRAMORTIZACAO = :VLRAMORTIZACAO,'
      '  VLRSALDODEVEDOR = :VLRSALDODEVEDOR,'
      '  VLRSALDOATUAL = :VLRSALDOATUAL,'
      '  VLRPRESTATUALIZADA = :VLRPRESTATUALIZADA,'
      '  VLRRESIDUO = :VLRRESIDUO,'
      '  VLRRESIDUOATUALI = :VLRRESIDUOATUALI,'
      '  VLRCORRSALDO = :VLRCORRSALDO,'
      '  VLRCORRIGIDOATRASO = :VLRCORRIGIDOATRASO,'
      '  VLRMULTAATRASO = :VLRMULTAATRASO,'
      '  VLRMORAATRASO = :VLRMORAATRASO,'
      '  FLGRESIDUOINCORP = :FLGRESIDUOINCORP,'
      '  FLGTIPOLANC = :FLGTIPOLANC,'
      '  FLGLANCINTEGRA = :FLGLANCINTEGRA,'
      '  FLGCONCILIADO = :FLGCONCILIADO,'
      '  IDINDCORRECAO = :IDINDCORRECAO,'
      '  FATORCORRECAO = :FATORCORRECAO'
      'where'
      '  IDPARCFINANCIMOV = :OLD_IDPARCFINANCIMOV')
    InsertSQL.Strings = (
      'insert into PARCFINANCIMOV'
      
        '  (IDPARCFINANCIMOV, CODDOCUMENTO, PLNCODIGO, IDCONDPAGIMOVEL, N' +
        'UMPARCELA, '
      
        '   DATAVENCIMENTO, VLRPRESTACAO, VLRNOMINAL, VLRJUROS, VLRJUROSP' +
        'ARC, VLRAMORTIZACAO, '
      
        '   VLRSALDODEVEDOR, VLRSALDOATUAL, VLRPRESTATUALIZADA, VLRRESIDU' +
        'O, VLRRESIDUOATUALI, '
      
        '   VLRCORRSALDO, VLRCORRIGIDOATRASO, VLRMULTAATRASO, VLRMORAATRA' +
        'SO, FLGRESIDUOINCORP, '
      
        '   FLGTIPOLANC, FLGLANCINTEGRA, FLGCONCILIADO, IDINDCORRECAO, FA' +
        'TORCORRECAO)'
      'values'
      
        '  (:IDPARCFINANCIMOV, :CODDOCUMENTO, :PLNCODIGO, :IDCONDPAGIMOVE' +
        'L, :NUMPARCELA, '
      
        '   :DATAVENCIMENTO, :VLRPRESTACAO, :VLRNOMINAL, :VLRJUROS, :VLRJ' +
        'UROSPARC, '
      
        '   :VLRAMORTIZACAO, :VLRSALDODEVEDOR, :VLRSALDOATUAL, :VLRPRESTA' +
        'TUALIZADA, '
      
        '   :VLRRESIDUO, :VLRRESIDUOATUALI, :VLRCORRSALDO, :VLRCORRIGIDOA' +
        'TRASO, '
      
        '   :VLRMULTAATRASO, :VLRMORAATRASO, :FLGRESIDUOINCORP, :FLGTIPOL' +
        'ANC, :FLGLANCINTEGRA, '
      '   :FLGCONCILIADO, :IDINDCORRECAO, :FATORCORRECAO)')
    DeleteSQL.Strings = (
      'delete from PARCFINANCIMOV'
      'where'
      '  IDPARCFINANCIMOV = :OLD_IDPARCFINANCIMOV')
    Left = 577
    Top = 200
  end
  object qryAux: TwwQuery
    CachedUpdates = True
    DatabaseName = 'BaseDados'
    SQL.Strings = (
      'SELECT'
      '     CI.IDCONTRATOIMOVEL,'
      '     CI.CONNUMERO,'
      '     CI.CONNOME,'
      '     CI.CONDATAINICIO,'
      '     CI.FLGTIPOCONTRATO,'
      '     CI.CONTAXAADMIN,'
      '     CI.CONVLRAJUSTADO,'
      '     CI.PERALUGUELIDEAL,'
      '     CI.CONVLRTOTAL,'
      '     CI.CONDESCRICAO,'
      '     CI.VLRPROPOSTA,'
      '     CI.VLRPRESENTE,'
      '     CI.VLRCONTABIL,'
      '     CI.CONINDICEMORA,'
      '     CI.CONINDICEREAJUSTE,'
      '     CI.CONDATAREAJUSTE,'
      '     P.RAZAOSOCIAL'
      'FROM'
      '     CONTRATOIMOVEL CI,'
      '     PESSOA P'
      'WHERE'
      '         (CI.FLGSTATUS = '#39'V'#39')'
      '     AND (CI.IDLOCATARIO = P.IDPESSOA)'
      
        '     AND ((:pIDCONTRATOIMOVEL IS NULL) OR (CI.IDCONTRATOIMOVEL =' +
        ' :pIDCONTRATOIMOVEL))'
      
        '     AND ((:pIDLOCATARIO IS NULL) OR (CI.IDLOCATARIO = :pIDLOCAT' +
        'ARIO))'
      
        '     AND ((:pIDRESPONSAVEL IS NULL) OR (CI.IDRESPONSAVEL = :pIDR' +
        'ESPONSAVEL))'
      
        '     AND ((:pIDADMINIMOVEL IS NULL) OR (CI.IDADMINIMOVEL = :pIDA' +
        'DMINIMOVEL))'
      
        '     AND (   ((:pFLGCONTRATO = '#39'S'#39') AND (CI.FLGTIPOCONTRATO = '#39'C' +
        #39'))'
      
        '          OR ((:pFLGACORDO   = '#39'S'#39') AND (CI.FLGTIPOCONTRATO = '#39'A' +
        #39'))  )'
      ''
      ''
      ' '
      ' '
      ' ')
    ValidateWithMask = True
    Left = 325
    Top = 132
    ParamData = <
      item
        DataType = ftInteger
        Name = 'pIDCONTRATOIMOVEL'
        ParamType = ptUnknown
      end
      item
        DataType = ftInteger
        Name = 'pIDCONTRATOIMOVEL'
        ParamType = ptUnknown
      end
      item
        DataType = ftInteger
        Name = 'pIDLOCATARIO'
        ParamType = ptUnknown
      end
      item
        DataType = ftInteger
        Name = 'pIDLOCATARIO'
        ParamType = ptUnknown
      end
      item
        DataType = ftInteger
        Name = 'pIDRESPONSAVEL'
        ParamType = ptUnknown
      end
      item
        DataType = ftInteger
        Name = 'pIDRESPONSAVEL'
        ParamType = ptUnknown
      end
      item
        DataType = ftInteger
        Name = 'pIDADMINIMOVEL'
        ParamType = ptUnknown
      end
      item
        DataType = ftInteger
        Name = 'pIDADMINIMOVEL'
        ParamType = ptUnknown
      end
      item
        DataType = ftString
        Name = 'pFLGCONTRATO'
        ParamType = ptInput
      end
      item
        DataType = ftString
        Name = 'pFLGACORDO'
        ParamType = ptInput
      end>
    object StringField1: TStringField
      DisplayLabel = 'Nr. Contrato'
      DisplayWidth = 16
      FieldName = 'CONNUMERO'
      Origin = '"CM.CONTRATOIMOVEL".CONNUMERO'
    end
    object StringField2: TStringField
      DisplayLabel = 'Nome do Contrato'
      DisplayWidth = 55
      FieldName = 'CONNOME'
      Origin = '"CM.CONTRATOIMOVEL".CONNOME'
      Size = 60
    end
    object StringField3: TStringField
      DisplayLabel = 'Comprador'
      DisplayWidth = 60
      FieldName = 'RAZAOSOCIAL'
      Origin = 'BASEDADOS.PESSOA.RAZAOSOCIAL'
      Size = 60
    end
    object FloatField1: TFloatField
      FieldName = 'IDCONTRATOIMOVEL'
      Origin = '"CM.CONTRATOIMOVEL".IDCONTRATOIMOVEL'
      Visible = False
    end
    object DateTimeField1: TDateTimeField
      FieldName = 'CONDATAINICIO'
      Origin = '"CM.CONTRATOIMOVEL".CONDATAINICIO'
      Visible = False
    end
    object StringField4: TStringField
      FieldName = 'FLGTIPOCONTRATO'
      Origin = '"CM.CONTRATOIMOVEL".FLGTIPOCONTRATO'
      Visible = False
      Size = 1
    end
    object FloatField2: TFloatField
      FieldName = 'CONTAXAADMIN'
      Origin = '"CM.CONTRATOIMOVEL".CONTAXAADMIN'
      Visible = False
    end
    object FloatField3: TFloatField
      FieldName = 'CONVLRAJUSTADO'
      Origin = '"CM.CONTRATOIMOVEL".CONVLRAJUSTADO'
      Visible = False
    end
    object FloatField4: TFloatField
      FieldName = 'CONVLRTOTAL'
      Origin = '"CM.CONTRATOIMOVEL".CONVLRTOTAL'
      Visible = False
    end
    object MemoField1: TMemoField
      FieldName = 'CONDESCRICAO'
      Origin = '"CM.CONTRATOIMOVEL".CONDESCRICAO'
      Visible = False
      BlobType = ftMemo
      Size = 2000
    end
    object FloatField5: TFloatField
      FieldName = 'VLRPROPOSTA'
      Origin = '"CM.CONTRATOIMOVEL".VLRPROPOSTA'
      Visible = False
    end
    object FloatField6: TFloatField
      FieldName = 'VLRPRESENTE'
      Origin = '"CM.CONTRATOIMOVEL".VLRPRESENTE'
      Visible = False
    end
    object FloatField7: TFloatField
      FieldName = 'VLRCONTABIL'
      Origin = '"CM.CONTRATOIMOVEL".VLRCONTABIL'
      Visible = False
    end
    object FloatField8: TFloatField
      FieldName = 'CONINDICEMORA'
      Origin = '"CM.CONTRATOIMOVEL".CONINDICEMORA'
      Visible = False
    end
    object FloatField9: TFloatField
      FieldName = 'CONINDICEREAJUSTE'
      Origin = 'CONTRATOIMOVEL.CONINDICEREAJUSTE'
      Visible = False
    end
    object DateTimeField2: TDateTimeField
      FieldName = 'CONDATAREAJUSTE'
      Origin = 'CONTRATOIMOVEL.CONDATAREAJUSTE'
      Visible = False
    end
    object FloatField10: TFloatField
      FieldName = 'PERALUGUELIDEAL'
      Origin = 'BASEDADOS.CONTRATOIMOVEL.PERALUGUELIDEAL'
      Visible = False
    end
  end
end
