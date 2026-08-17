inherited frmExecDesmembraObra: TfrmExecDesmembraObra
  Left = 274
  Top = 216
  HelpContext = 540067
  Caption = 'Desmembramento de Obras'
  ClientHeight = 318
  ClientWidth = 685
  OnDestroy = FormDestroy
  PixelsPerInch = 96
  TextHeight = 13
  inherited pnlFundo: TPanel
    Width = 685
    Height = 279
    inherited PagControle: TPageControl
      Width = 683
      Height = 277
      inherited tabSelecao: TTabSheet
        inherited lblTitulo: TfcLabel
          Width = 675
          Caption = 'Desmembramento de Obras [ Seleção ]'
        end
        object Label2: TLabel
          Left = 15
          Top = 79
          Width = 107
          Height = 13
          Caption = 'Descrição da Obra'
        end
        object Label1: TLabel
          Left = 533
          Top = 36
          Width = 83
          Height = 13
          Caption = 'Data de Início'
        end
        inline molImovelObra1: TmolImovelObra
          Left = 6
          Top = 36
          Width = 515
          Height = 39
          inherited edtImovel: TEdit
            Width = 441
          end
          inherited btnBuscaImovel: TBitBtn
            Left = 448
            OnClick = molImovelObra1btnBuscaImovelClick
          end
          inherited btnLimpaImovel: TBitBtn
            Left = 472
          end
        end
        object dbmemObra: TDBMemo
          Left = 15
          Top = 96
          Width = 639
          Height = 37
          DataField = 'DESCCAFOBRA'
          DataSource = dsSomaLancObra
          ReadOnly = True
          TabOrder = 1
        end
        object DtaInicioObra: TCMDateTimePicker
          Left = 533
          Top = 52
          Width = 121
          Height = 21
          CalendarAttributes.Font.Charset = DEFAULT_CHARSET
          CalendarAttributes.Font.Color = clWindowText
          CalendarAttributes.Font.Height = -11
          CalendarAttributes.Font.Name = 'MS Sans Serif'
          CalendarAttributes.Font.Style = []
          ButtonStyle = cbsCustom
          DataField = 'DTAINICIOOBRA'
          DataSource = dsSomaLancObra
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
          ReadOnly = True
          ShowButton = False
          TabOrder = 2
        end
        object GroupBox1: TGroupBox
          Left = 16
          Top = 149
          Width = 177
          Height = 104
          TabOrder = 3
          object Panel1: TPanel
            Left = 12
            Top = 34
            Width = 162
            Height = 51
            BevelOuter = bvNone
            TabOrder = 0
            object Label3: TLabel
              Left = 3
              Top = -1
              Width = 119
              Height = 16
              Caption = 'Desmembrar em '
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clBlue
              Font.Height = -13
              Font.Name = 'MS Sans Serif'
              Font.Style = [fsBold]
              ParentFont = False
            end
            object Label8: TLabel
              Left = 67
              Top = 28
              Width = 87
              Height = 16
              Caption = 'novas obras'
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clBlue
              Font.Height = -13
              Font.Name = 'MS Sans Serif'
              Font.Style = [fsBold]
              ParentFont = False
            end
            object edtNumObras: TRealEdit
              Left = 3
              Top = 23
              Width = 57
              Height = 21
              Alignment = taRightJustify
              Lines.Strings = (
                '0')
              TabOrder = 0
              WordWrap = False
              IntDigits = 10
              DecDigits = 0
              NumberFormat = iNumber
              Signal = False
            end
          end
        end
        object GroupBox2: TGroupBox
          Left = 203
          Top = 149
          Width = 166
          Height = 49
          Caption = 'Saldo Atual da Obra'
          TabOrder = 4
          object edtTotObra1: TDBRealEdit
            Left = 21
            Top = 18
            Width = 121
            Height = 21
            Alignment = taRightJustify
            Enabled = False
            Lines.Strings = (
              '0,00')
            ReadOnly = True
            TabOrder = 0
            WordWrap = False
            IntDigits = 10
            DecDigits = 2
            NumberFormat = fNumber
            Signal = False
            DataField = 'SOMAVALOFI'
            DataSource = dsSomaLancObra
          end
        end
        object GroupBox3: TGroupBox
          Left = 203
          Top = 205
          Width = 166
          Height = 49
          Caption = 'Data da Operação'
          TabOrder = 5
          object edtDataOper: TCMDateTimePicker
            Left = 21
            Top = 19
            Width = 126
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
            DisplayFormat = 'dd/mm/yyyy'
          end
        end
        object GroupBox4: TGroupBox
          Left = 382
          Top = 149
          Width = 271
          Height = 105
          Caption = 'Descrição do Evento'
          TabOrder = 6
          object memEvento: TMemo
            Left = 8
            Top = 17
            Width = 253
            Height = 80
            TabOrder = 0
          end
        end
      end
      inherited TabSheet1: TTabSheet
        inherited fcLabel1: TfcLabel
          Width = 445
          Caption = 'Desmembramento de Obras [ Confirmação ]'
        end
        object lblTerreno: TLabel
          Left = 32
          Top = 220
          Width = 593
          Height = 33
          AutoSize = False
          Caption = 
            'Esta obra possui um Terreno associado, que também será desmembra' +
            'do na mesma proporção'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clNavy
          Font.Height = -13
          Font.Name = 'MS Sans Serif'
          Font.Style = [fsBold]
          ParentFont = False
          WordWrap = True
        end
        object Panel7: TPanel
          Left = 8
          Top = 48
          Width = 647
          Height = 27
          BevelInner = bvRaised
          BevelOuter = bvLowered
          Caption = 'Obras Resultantes'
          Color = clNavy
          Font.Charset = ANSI_CHARSET
          Font.Color = clWhite
          Font.Height = -19
          Font.Name = 'Courier New'
          Font.Style = [fsBold]
          ParentFont = False
          TabOrder = 0
        end
        object dbgObras: TwwDBGrid
          Left = 8
          Top = 72
          Width = 647
          Height = 137
          Selected.Strings = (
            'NOME_OBRA'#9'45'#9'Descrição da Obra'#9'F'
            'NOME_IMOVEL'#9'45'#9'Nome do Imóvel / Terreno'#9'F'
            'PERCENT_DESMEMBRA'#9'10'#9'       %'#9'F')
          IniAttributes.Delimiter = ';;'
          TitleColor = clBtnFace
          FixedCols = 0
          ShowHorzScrollBar = True
          DataSource = dsObraResult
          Font.Charset = ANSI_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'Arial'
          Font.Style = []
          KeyOptions = []
          Options = [dgEditing, dgTitles, dgIndicator, dgColumnResize, dgColLines, dgRowLines, dgTabs, dgAlwaysShowSelection, dgConfirmDelete, dgCancelOnExit, dgWordWrap, dgPerfectRowFit]
          ParentFont = False
          TabOrder = 1
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
    Top = 279
    Width = 685
    inherited tb97Fundo: TToolbar97
      Left = 270
      inherited btnConfirmar: TfcShapeBtn
        OnClick = btnConfirmarClick
      end
    end
  end
  inherited ivTradutor: TIvExtendedTranslator
    TargetsData = (
      1
      4
      (
        'TDBMemo'
        'Text'
        0)
      (
        'TRealEdit'
        'Text'
        0)
      (
        'TDBRealEdit'
        'Text'
        0)
      (
        'TMemo'
        'Text'
        0))
  end
  object qrySomaLancObra: TwwQuery
    CachedUpdates = True
    DatabaseName = 'BaseDados'
    SQL.Strings = (
      'SELECT O.DESCCAFOBRA,'
      '       O.DTAINICIOOBRA,'
      '       O.DTAENCERRAOBRA,'
      '       O.CODSUBCONTA,'
      '       O.UNIDNEGOC,'
      '       I.FLGSTATUS,'
      '       MAX(OL.DTALANCAMENTO) AS DTAULTIMOLANC,'
      '       SUM(OL.VALOFI) AS SOMAVALOFI'
      ''
      'FROM   CAFOBRALANC OL,'
      '       CAFOBRA O,'
      '       IMOVEL I'
      ''
      'WHERE  (O.IDCAFOBRA = :PIDCAFOBRA)'
      '  AND  (O.IDPESSOA  = :PIDPESSOA)'
      '  AND  (O.IDCAFOBRA = OL.IDCAFOBRA(+))'
      '  AND  (O.IDPESSOA  = OL.IDPESSOA(+))'
      '  AND  (O.IDIMOVEL  = I.IDIMOVEL)'
      ''
      
        'GROUP BY O.DESCCAFOBRA, O.DTAINICIOOBRA, O.DTAENCERRAOBRA, O.COD' +
        'SUBCONTA,'
      '         O.UNIDNEGOC, I.FLGSTATUS'
      ''
      ' '
      ' '
      ' '
      ' ')
    UpdateMode = upWhereKeyOnly
    ValidateWithMask = True
    Left = 472
    Top = 7
    ParamData = <
      item
        DataType = ftInteger
        Name = 'PIDCAFOBRA'
        ParamType = ptUnknown
      end
      item
        DataType = ftInteger
        Name = 'PIDPESSOA'
        ParamType = ptUnknown
      end>
    object qrySomaLancObraSOMAVALOFI: TFloatField
      FieldName = 'SOMAVALOFI'
      Origin = 'BASEDADOS.CAFOBRALANC.VALOFI'
      DisplayFormat = '#,0.00;(#,0.00)'
    end
    object qrySomaLancObraDESCCAFOBRA: TStringField
      FieldName = 'DESCCAFOBRA'
      Origin = 'BASEDADOS.CAFOBRA.DESCCAFOBRA'
      Size = 250
    end
    object qrySomaLancObraDTAINICIOOBRA: TDateTimeField
      FieldName = 'DTAINICIOOBRA'
      Origin = 'BASEDADOS.CAFOBRA.DTAINICIOOBRA'
    end
    object qrySomaLancObraCODSUBCONTA: TFloatField
      FieldName = 'CODSUBCONTA'
      Origin = 'BASEDADOS.CAFOBRA.CODSUBCONTA'
    end
    object qrySomaLancObraUNIDNEGOC: TFloatField
      FieldName = 'UNIDNEGOC'
      Origin = 'BASEDADOS.CAFOBRA.UNIDNEGOC'
    end
    object qrySomaLancObraDTAENCERRAOBRA: TDateTimeField
      FieldName = 'DTAENCERRAOBRA'
      Origin = 'BASEDADOS.CAFOBRA.DTAENCERRAOBRA'
    end
    object qrySomaLancObraFLGSTATUS: TStringField
      FieldName = 'FLGSTATUS'
      Origin = 'BASEDADOS.IMOVEL.FLGSTATUS'
      FixedChar = True
      Size = 1
    end
    object qrySomaLancObraDTAULTIMOLANC: TDateTimeField
      FieldName = 'DTAULTIMOLANC'
      Origin = 'BASEDADOS.CAFOBRALANC.DTALANCAMENTO'
    end
  end
  object dsSomaLancObra: TwwDataSource
    AutoEdit = False
    DataSet = qrySomaLancObra
    Left = 472
    Top = 21
  end
  object updObraResult: TUpdateSQL
    Left = 576
    Top = 36
  end
  object dsObraResult: TwwDataSource
    DataSet = qryObraResult
    Left = 576
    Top = 24
  end
  object qryObraResult: TwwQuery
    CachedUpdates = True
    DatabaseName = 'BaseDados'
    SQL.Strings = (
      'SELECT'
      '   0 AS IDOBRA,'
      '   0 AS IDOBRA_RESULT,'
      '   0 AS IDIMOVEL_RESULT,'
      '   0 AS IDCONJUNTO_RESULT,'
      '   0 AS IDIMOVELMESTRE,'
      '   0 AS NUM_OBRA_RESULT,'
      
        '   '#39'                                                            ' +
        '                                                       '#39' AS NOME' +
        '_OBRA,'
      
        '   '#39'                                                            ' +
        '                                                       '#39' AS NOME' +
        '_IMOVEL,'
      '   0 AS PERCENT_DESMEMBRA'
      ''
      'FROM'
      '   CAFOBRA'
      ''
      'WHERE'
      '   IDCAFOBRA = 0'
      ' '
      ' '
      ' '
      ' ')
    UpdateObject = updObraResult
    ValidateWithMask = True
    Left = 576
    Top = 8
    object qryObraResultIDOBRA: TFloatField
      FieldName = 'IDOBRA'
    end
    object qryObraResultIDOBRA_RESULT: TFloatField
      FieldName = 'IDOBRA_RESULT'
    end
    object qryObraResultNOME_OBRA: TStringField
      DisplayLabel = 'Descrição da Obra'
      FieldName = 'NOME_OBRA'
      FixedChar = True
      Size = 115
    end
    object qryObraResultPERCENT_DESMEMBRA: TFloatField
      DisplayLabel = '%'
      FieldName = 'PERCENT_DESMEMBRA'
      DisplayFormat = '##0.0000 %'
      EditFormat = '##0.0000'
    end
    object qryObraResultNUM_OBRA_RESULT: TFloatField
      FieldName = 'NUM_OBRA_RESULT'
    end
    object qryObraResultIDIMOVEL_RESULT: TFloatField
      FieldName = 'IDIMOVEL_RESULT'
    end
    object qryObraResultNOME_IMOVEL: TStringField
      FieldName = 'NOME_IMOVEL'
      FixedChar = True
      Size = 115
    end
    object qryObraResultIDIMOVELMESTRE: TFloatField
      FieldName = 'IDIMOVELMESTRE'
    end
    object qryObraResultIDCONJUNTO_RESULT: TFloatField
      FieldName = 'IDCONJUNTO_RESULT'
    end
  end
  object cdsPlanoPatroxImovel: TCMClientDataSet
    Aggregates = <>
    Params = <>
    Left = 536
    Top = 192
  end
end
