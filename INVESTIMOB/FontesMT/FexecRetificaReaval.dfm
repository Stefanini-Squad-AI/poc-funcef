inherited frmExecRetificaReaval: TfrmExecRetificaReaval
  Left = 258
  Top = 141
  HelpContext = 540075
  Caption = 'Retificação de Reavaliação'
  ClientHeight = 437
  ClientWidth = 763
  OnDestroy = FormDestroy
  PixelsPerInch = 96
  TextHeight = 13
  inherited pnlFundo: TPanel
    Width = 763
    Height = 398
    inherited PagControle: TPageControl
      Width = 761
      Height = 396
      inherited tabSelecao: TTabSheet
        Caption = ''
        inherited lblTitulo: TfcLabel
          Width = 753
          Caption = 'Retificação de Reavaliação [ Seleção ]'
        end
        object Label15: TLabel
          Left = 576
          Top = 43
          Width = 114
          Height = 13
          Caption = 'Data Movimentação'
        end
        object Label7: TLabel
          Left = 16
          Top = 295
          Width = 137
          Height = 13
          Caption = 'Observações do Evento'
        end
        inline molImovelouMestre: TmolImovelouMestre
          Left = 8
          Top = 40
          Width = 553
          inherited edtImovel: TEdit
            Width = 489
          end
          inherited btnBuscaImovel: TBitBtn
            Left = 496
            OnClick = molImovelouMestre1btnBuscaImovelClick
          end
          inherited btnLimpaImovel: TBitBtn
            Left = 520
          end
        end
        object edtDataReavalia: TCMDateTimePicker
          Left = 576
          Top = 58
          Width = 113
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
        object dbgBens: TwwDBGrid
          Left = 16
          Top = 115
          Width = 721
          Height = 110
          Selected.Strings = (
            'DESBEM'#9'31'#9'Descrição do Bem'#9'T'
            'DATAREAVALIACAO'#9'10'#9'Ult. Reaval.'#9'F'
            'VLR_REAVALIA'#9'10'#9'Reavaliação'#9'F'
            'VIDAUTIL'#9'8'#9'Vida Útil'#9'F'
            'DEPRECIACAO'#9'10'#9'Vl. Deprec.'#9'F'
            'VLR_CONTABIL'#9'11'#9'Saldo Atual'#9'F'
            'NOVOVLR_REAVALIA'#9'14'#9'Nova Reavaliação'#9'F'
            'NOVAVIDAUTIL'#9'12'#9'Nova Vida Útil'#9'F')
          IniAttributes.Delimiter = ';;'
          TitleColor = clBtnFace
          FixedCols = 0
          ShowHorzScrollBar = True
          DataSource = dsBem
          Font.Charset = ANSI_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'Arial'
          Font.Style = []
          KeyOptions = []
          Options = [dgEditing, dgTitles, dgIndicator, dgColumnResize, dgColLines, dgRowLines, dgTabs, dgAlwaysShowSelection, dgConfirmDelete, dgCancelOnExit, dgWordWrap, dgPerfectRowFit]
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
          OnCalcCellColors = dbgBensCalcCellColors
          IndicatorColor = icBlack
          OnTopRowChanged = dbgBensTopRowChanged
        end
        object Panel3: TPanel
          Left = 15
          Top = 88
          Width = 722
          Height = 27
          BevelInner = bvRaised
          BevelOuter = bvLowered
          Caption = 'Bens para Retificação'
          Color = clNavy
          Font.Charset = ANSI_CHARSET
          Font.Color = clWhite
          Font.Height = -19
          Font.Name = 'Courier New'
          Font.Style = [fsBold]
          ParentFont = False
          TabOrder = 3
        end
        inline molFornecedor: TmolFornecedor
          Left = 9
          Top = 248
          Width = 425
          TabOrder = 4
          inherited Label5: TLabel
            Width = 54
            Caption = 'Avaliador'
          end
          inherited btnBuscaForn: TBitBtn
            Left = 375
          end
          inherited btnLimpaForn: TBitBtn
            Left = 399
          end
          inherited edtNomeFantasia: TEdit
            Width = 366
          end
          inherited edtRazaoSocial: TEdit
            Left = 23
            Width = 81
            Visible = False
          end
        end
        object meObsEvento: TMemo
          Left = 16
          Top = 310
          Width = 417
          Height = 70
          Lines.Strings = (
            '')
          MaxLength = 2000
          TabOrder = 5
        end
      end
      inherited TabSheet1: TTabSheet
        inherited fcLabel1: TfcLabel
          Width = 406
          Caption = 'Retificação de Reavaliação [ Resultado ]'
        end
        object dbgBemResult: TwwDBGrid
          Left = 13
          Top = 67
          Width = 721
          Height = 110
          Selected.Strings = (
            'DESBEM'#9'63'#9'Nome do Bem'#9'F'
            'VLRREAVALIA'#9'13'#9'Vlr. Reavaliação'#9'F'
            'VIDAUTIL'#9'10'#9'Vida Útil'#9'F'
            'AJUSTEDEP'#9'12'#9'Ajuste Deprec.'#9'F'
            'NOVOSALDO'#9'11'#9'Novo Saldo'#9'F')
          IniAttributes.Delimiter = ';;'
          TitleColor = clBtnFace
          FixedCols = 0
          ShowHorzScrollBar = True
          DataSource = dsBemResult
          Font.Charset = ANSI_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'Arial'
          Font.Style = []
          KeyOptions = []
          Options = [dgTitles, dgIndicator, dgColumnResize, dgColLines, dgRowLines, dgTabs, dgRowSelect, dgAlwaysShowSelection, dgConfirmDelete, dgCancelOnExit, dgWordWrap, dgPerfectRowFit]
          ParentFont = False
          TabOrder = 0
          TitleAlignment = taLeftJustify
          TitleFont.Charset = ANSI_CHARSET
          TitleFont.Color = clWindowText
          TitleFont.Height = -9
          TitleFont.Name = 'Small Fonts'
          TitleFont.Style = [fsBold]
          TitleLines = 1
          TitleButtons = False
          UseTFields = False
          OnCalcCellColors = dbgBemResultCalcCellColors
          IndicatorColor = icBlack
          OnTopRowChanged = dbgBensTopRowChanged
        end
        object Panel1: TPanel
          Left = 13
          Top = 40
          Width = 721
          Height = 27
          BevelInner = bvRaised
          BevelOuter = bvLowered
          Caption = 'Bens Retificados'
          Color = clNavy
          Font.Charset = ANSI_CHARSET
          Font.Color = clWhite
          Font.Height = -19
          Font.Name = 'Courier New'
          Font.Style = [fsBold]
          ParentFont = False
          TabOrder = 1
        end
      end
    end
  end
  inherited Dock971: TDock97
    Top = 398
    Width = 763
    inherited tb97Fundo: TToolbar97
      Left = 323
      inherited btnConfirmar: TfcShapeBtn
        OnClick = btnConfirmarClick
      end
    end
  end
  inherited ivTradutor: TIvExtendedTranslator
    TargetsData = (
      1
      2
      (
        'TMemo'
        'Text'
        0)
      (
        ''
        'DisplayLabel'
        0))
  end
  object cdsImovel: TClientDataSet
    Aggregates = <>
    FieldDefs = <
      item
        Name = 'IMOVEL_EXTENSO'
        DataType = ftString
        Size = 123
      end
      item
        Name = 'PERCENTUAL'
        DataType = ftFloat
      end
      item
        Name = 'VLR_REAVALIA'
        DataType = ftFloat
      end
      item
        Name = 'VIDAUTIL'
        DataType = ftFloat
      end
      item
        Name = 'IDIMOVEL'
        DataType = ftFloat
      end
      item
        Name = 'ALT'
        DataType = ftFloat
      end
      item
        Name = 'VLR_CONTABIL'
        DataType = ftFloat
      end>
    IndexDefs = <
      item
        Name = 'cdsImovelInd1'
        Fields = 'IMOVEL_EXTENSO; IDIMOVEL'
        Options = [ixUnique]
      end>
    IndexName = 'cdsImovelInd1'
    Params = <>
    ProviderName = 'dspImovel'
    StoreDefs = True
    Left = 520
    Top = 343
    object cdsImovelIMOVEL_EXTENSO: TStringField
      FieldName = 'IMOVEL_EXTENSO'
      Size = 123
    end
    object cdsImovelPERCENTUAL: TFloatField
      FieldName = 'PERCENTUAL'
      DisplayFormat = '##0.0000%'
      EditFormat = '##0.0000%'
    end
    object cdsImovelVLR_REAVALIA: TFloatField
      DisplayLabel = 'Reavaliação'
      FieldName = 'VLR_REAVALIA'
      DisplayFormat = '###,##0.00'
      EditFormat = '###,##0.00'
    end
    object cdsImovelVIDAUTIL: TFloatField
      FieldName = 'VIDAUTIL'
    end
    object cdsImovelIDIMOVEL: TFloatField
      FieldName = 'IDIMOVEL'
    end
    object cdsImovelALT: TFloatField
      FieldName = 'ALT'
    end
    object cdsImovelVLR_CONTABIL: TFloatField
      DisplayLabel = 'Valor Contábil'
      FieldName = 'VLR_CONTABIL'
      DisplayFormat = '###,##0.00'
      EditFormat = '###,##0.00'
    end
  end
  object dspImovel: TDataSetProvider
    DataSet = qryImovel
    Constraints = True
    Left = 520
    Top = 317
  end
  object updImovel: TUpdateSQL
    Left = 520
    Top = 300
  end
  object dsImovel: TwwDataSource
    DataSet = cdsImovel
    Left = 520
    Top = 282
  end
  object qryImovel: TwwQuery
    CachedUpdates = True
    DatabaseName = 'BaseDados'
    Constrained = True
    SQL.Strings = (
      'SELECT DISTINCT'
      '   I.IDIMOVEL,'
      '   IM.IMONOME || '#39' - '#39' || I.IMONOME AS IMOVEL_EXTENSO,'
      '   0 AS PERCENTUAL,'
      '   0 AS VLR_CONTABIL,'
      '   0 AS VLR_REAVALIA,'
      '   0 AS VIDAUTIL,'
      '   0 AS ALT'
      'FROM'
      '   IMOVEL I,'
      '   IMOVEL IM,'
      '   GRUPOXIMOVEL GI'
      'WHERE'
      '       ( I.IDIMOVELMESTRE = IM.IDIMOVEL )'
      '   AND ( I.FLGATIVO = 1 )'
      '   AND ( I.IDIMOVEL = GI.IDIMOVEL(+) )'
      
        '   AND ( (:PIDPESSOA IS NULL)       OR (I.IDPESSOA =:PIDPESSOA) ' +
        ')'
      
        '   AND ( (:PIDIMOVELMESTRE IS NULL) OR (I.IDIMOVELMESTRE =:PIDIM' +
        'OVELMESTRE) )'
      
        '   AND ( (:PIDIMOVEL IS NULL)       OR (I.IDIMOVEL =:PIDIMOVEL) ' +
        ')'
      
        '   AND ( (:PIDGRUPORATEIO  IS NULL) OR (GI.IDGRUPORATEIO =:PIDGR' +
        'UPORATEIO) )'
      '   AND ( (:PVAZIA IS NULL)          OR (1=2) )'
      ''
      'ORDER BY'
      '   IMOVEL_EXTENSO')
    UpdateObject = updImovel
    ValidateWithMask = True
    Left = 520
    Top = 264
    ParamData = <
      item
        DataType = ftInteger
        Name = 'PIDPESSOA'
        ParamType = ptUnknown
      end
      item
        DataType = ftInteger
        Name = 'PIDPESSOA'
        ParamType = ptUnknown
      end
      item
        DataType = ftInteger
        Name = 'PIDIMOVELMESTRE'
        ParamType = ptUnknown
      end
      item
        DataType = ftInteger
        Name = 'PIDIMOVELMESTRE'
        ParamType = ptUnknown
      end
      item
        DataType = ftInteger
        Name = 'PIDIMOVEL'
        ParamType = ptUnknown
      end
      item
        DataType = ftInteger
        Name = 'PIDIMOVEL'
        ParamType = ptUnknown
      end
      item
        DataType = ftInteger
        Name = 'PIDGRUPORATEIO'
        ParamType = ptUnknown
      end
      item
        DataType = ftInteger
        Name = 'PIDGRUPORATEIO'
        ParamType = ptUnknown
      end
      item
        DataType = ftString
        Name = 'PVAZIA'
        ParamType = ptUnknown
      end>
    object qryImovelIMOVEL_EXTENSO: TStringField
      DisplayLabel = 'Imóvel'
      DisplayWidth = 58
      FieldName = 'IMOVEL_EXTENSO'
      Size = 123
    end
    object qryImovelPERCENTUAL: TFloatField
      DisplayLabel = 'Percentual'
      DisplayWidth = 12
      FieldName = 'PERCENTUAL'
      DisplayFormat = '##0.0000%'
    end
    object qryImovelVLR_REAVALIA: TFloatField
      DisplayLabel = 'Valor Reavaliação'
      DisplayWidth = 16
      FieldName = 'VLR_REAVALIA'
      DisplayFormat = '###,##0.00'
    end
    object qryImovelVIDAUTIL: TFloatField
      DisplayLabel = 'Vida Útil'
      DisplayWidth = 8
      FieldName = 'VIDAUTIL'
    end
    object qryImovelIDIMOVEL: TFloatField
      FieldName = 'IDIMOVEL'
      Visible = False
    end
    object qryImovelALT: TFloatField
      FieldName = 'ALT'
    end
    object qryImovelVLR_CONTABIL: TFloatField
      DisplayLabel = 'Valor Contábil'
      FieldName = 'VLR_CONTABIL'
      DisplayFormat = '###,##0.00'
    end
  end
  object cdsBem: TClientDataSet
    Aggregates = <>
    FieldDefs = <
      item
        Name = 'IDIMOVEL'
        DataType = ftFloat
      end
      item
        Name = 'IDBEM'
        DataType = ftFloat
      end
      item
        Name = 'DESBEM'
        DataType = ftString
        Size = 200
      end
      item
        Name = 'DATAREAVALIACAO'
        DataType = ftDateTime
      end
      item
        Name = 'VLR_REAVALIA'
        DataType = ftFloat
      end
      item
        Name = 'VIDAUTIL'
        DataType = ftFloat
      end
      item
        Name = 'VLR_CONTABIL'
        DataType = ftFloat
      end
      item
        Name = 'NOVAVIDAUTIL'
        DataType = ftFloat
      end
      item
        Name = 'NOVOVLR_REAVALIA'
        DataType = ftFloat
      end
      item
        Name = 'DEPRECIACAO'
        DataType = ftFloat
      end
      item
        Name = 'IDRETIFICREAV'
        DataType = ftFloat
      end
      item
        Name = 'IDPESSOA'
        DataType = ftFloat
      end>
    IndexDefs = <
      item
        Name = 'cdsBemIndex2'
        Fields = 'DESBEM'
      end>
    IndexName = 'cdsBemIndex2'
    Params = <>
    ProviderName = 'dspBem'
    StoreDefs = True
    Left = 720
    Top = 335
    object cdsBemIDIMOVEL: TFloatField
      FieldName = 'IDIMOVEL'
    end
    object cdsBemIDBEM: TFloatField
      FieldName = 'IDBEM'
    end
    object cdsBemDESBEM: TStringField
      FieldName = 'DESBEM'
      Size = 200
    end
    object cdsBemDATAREAVALIACAO: TDateTimeField
      FieldName = 'DATAREAVALIACAO'
    end
    object cdsBemVLR_REAVALIA: TFloatField
      FieldName = 'VLR_REAVALIA'
      DisplayFormat = ',0.00'
      EditFormat = ',0.00'
    end
    object cdsBemVIDAUTIL: TFloatField
      FieldName = 'VIDAUTIL'
    end
    object cdsBemVLR_CONTABIL: TFloatField
      FieldName = 'VLR_CONTABIL'
      DisplayFormat = ',0.00'
      EditFormat = ',0.00'
    end
    object cdsBemNOVAVIDAUTIL: TFloatField
      FieldName = 'NOVAVIDAUTIL'
    end
    object cdsBemNOVOVLR_REAVALIA: TFloatField
      FieldName = 'NOVOVLR_REAVALIA'
      DisplayFormat = ',0.00'
      EditFormat = ',0.00'
    end
    object cdsBemDEPRECIACAO: TFloatField
      FieldName = 'DEPRECIACAO'
      DisplayFormat = ',0.00'
      EditFormat = ',0.00'
    end
    object cdsBemIDRETIFICREAV: TFloatField
      FieldName = 'IDRETIFICREAV'
    end
    object cdsBemIDPESSOA: TFloatField
      FieldName = 'IDPESSOA'
    end
    object cdsBemIXBGRUPO: TStringField
      FieldName = 'IXBGRUPO'
      Size = 1
    end
  end
  object dspBem: TDataSetProvider
    DataSet = qryBem
    Constraints = True
    Left = 720
    Top = 317
  end
  object updBem: TUpdateSQL
    Left = 720
    Top = 300
  end
  object dsBem: TwwDataSource
    DataSet = cdsBem
    Left = 720
    Top = 281
  end
  object qryBem: TwwQuery
    CachedUpdates = True
    DatabaseName = 'BaseDados'
    SQL.Strings = (
      'SELECT DISTINCT'
      '   REAV.IDPESSOA,'
      '   REAV.IDREAVALIACAO AS IDRETIFICREAV,'
      '   VW.IDIMOVEL,'
      '   VW.IDBEM,'
      '   VW.DESBEM,'
      '   NVL(DEP.DEPRECIACAO,0) AS DEPRECIACAO,'
      '   REAV.DATAREAVALIACAO,'
      '   REAV.VLRREAVALIA AS VLR_REAVALIA,'
      '   REAV.VIDAUTIL,'
      '   0 AS VLR_CONTABIL,'
      '   REAV.VIDAUTIL AS NOVAVIDAUTIL,'
      '   REAV.VLRREAVALIA AS NOVOVLR_REAVALIA,'
      '   VW.IXBGRUPO'
      'FROM'
      '   VWBEMXIMOVEL VW,'
      '   REAVALIAXREAVALIA REAV,'
      '   ('
      '    SELECT HM.IDBEM,SUM(VM.VALOR) AS DEPRECIACAO'
      '      FROM'
      '          VLRHISTMOVBEM VM,'
      '          TIPOMOVIMENTACAO TM,'
      '          HISTORICOMOVIMENTACAO HM,'
      '          IMOVELXBEM IB'
      '    WHERE HM.DATAMOVIMENTACAO > (SELECT MAX(R.DATAREAVALIACAO)'
      '                                  FROM   REAVALIAXREAVALIA R'
      '                                 WHERE   R.IDBEM    = HM.IDBEM'
      
        '                                   AND   R.IDIMOVEL = IB.IDIMOVE' +
        'L'
      
        '                                   AND   R.DATAREAVALIACAO <= :D' +
        'DATAPROCESSO)'
      '      AND IB.IDIMOVEL = :PIDIMOVEL'
      '      AND HM.IDBEM    = IB.IDBEM'
      '      AND TM.IDTIPOMOVIMENTACAO = HM.IDTIPOMOVIMENTACAO + 0'
      '      AND HM.IDMOVIMENTACAO = VM.IDMOVIMENTACAO (+)'
      '      AND TM.IDTIPOMOVIMENTACAO IN (14,18,69,33,35)'
      '    GROUP BY HM.IDBEM'
      '  ) DEP'
      'WHERE'
      '      ( VW.FLGATIVO   = 1 )'
      '  AND ( VW.BAIXATOTAL = '#39'N'#39' )'
      '  AND ( (:PIDIMOVEL IS NULL) OR (VW.IDIMOVEL = :PIDIMOVEL) )'
      '  AND ( REAV.IDIMOVEL = VW.IDIMOVEL )'
      '  AND ( REAV.IDBEM    = VW.IDBEM )'
      '  AND ( REAV.DATAREAVALIACAO = (SELECT MAX(R.DATAREAVALIACAO)'
      '                                FROM   REAVALIAXREAVALIA R'
      
        '                                WHERE  R.IDIMOVEL = REAV.IDIMOVE' +
        'L'
      '                                AND    R.IDBEM    = REAV.IDBEM'
      
        '                                AND    R.DATAREAVALIACAO <= :DDA' +
        'TAPROCESSO) )'
      '  AND REAV.IDBEM = DEP.IDBEM(+)'
      'ORDER BY'
      '   VW.DESBEM'
      ''
      ' ')
    ValidateWithMask = True
    Left = 720
    Top = 272
    ParamData = <
      item
        DataType = ftDate
        Name = 'dDataProcesso'
        ParamType = ptInput
      end
      item
        DataType = ftInteger
        Name = 'PIDIMOVEL'
        ParamType = ptUnknown
      end
      item
        DataType = ftInteger
        Name = 'PIDIMOVEL'
        ParamType = ptUnknown
      end
      item
        DataType = ftInteger
        Name = 'PIDIMOVEL'
        ParamType = ptUnknown
      end
      item
        DataType = ftDate
        Name = 'DDATAPROCESSO'
        ParamType = ptInput
      end>
    object qryBemIDIMOVEL: TFloatField
      FieldName = 'IDIMOVEL'
    end
    object qryBemIDBEM: TFloatField
      FieldName = 'IDBEM'
    end
    object qryBemDESBEM: TStringField
      FieldName = 'DESBEM'
      Size = 200
    end
    object qryBemDATAREAVALIACAO: TDateTimeField
      FieldName = 'DATAREAVALIACAO'
    end
    object qryBemVLR_REAVALIA: TFloatField
      FieldName = 'VLR_REAVALIA'
    end
    object qryBemVIDAUTIL: TFloatField
      FieldName = 'VIDAUTIL'
    end
    object qryBemVLR_CONTABIL: TFloatField
      FieldName = 'VLR_CONTABIL'
    end
    object qryBemNOVAVIDAUTIL: TFloatField
      FieldName = 'NOVAVIDAUTIL'
    end
    object qryBemNOVOVLR_REAVALIA: TFloatField
      FieldName = 'NOVOVLR_REAVALIA'
    end
    object qryBemDEPRECIACAO: TFloatField
      FieldName = 'DEPRECIACAO'
    end
    object qryBemIDRETIFICREAV: TFloatField
      FieldName = 'IDRETIFICREAV'
    end
    object qryBemIDPESSOA: TFloatField
      FieldName = 'IDPESSOA'
    end
    object qryBemIXBGRUPO: TStringField
      FieldName = 'IXBGRUPO'
      Size = 1
    end
  end
  object cdsBemResult: TClientDataSet
    Aggregates = <>
    FieldDefs = <
      item
        Name = 'IDBEM'
        DataType = ftFloat
      end
      item
        Name = 'IDIMOVEL'
        DataType = ftFloat
      end
      item
        Name = 'IDPESSOA'
        DataType = ftFloat
      end
      item
        Name = 'IDREAVALIACAO'
        DataType = ftFloat
      end
      item
        Name = 'DATAREAVALIACAO'
        DataType = ftDateTime
      end
      item
        Name = 'IDAVALIADOR'
        DataType = ftFloat
      end
      item
        Name = 'VLRREAVALIA'
        DataType = ftFloat
      end
      item
        Name = 'VIDAUTIL'
        DataType = ftFloat
      end
      item
        Name = 'AJUSTEDEP'
        DataType = ftFloat
      end
      item
        Name = 'NOVOSALDO'
        DataType = ftFloat
      end
      item
        Name = 'DESBEM'
        Attributes = [faFixed]
        DataType = ftString
        Size = 128
      end
      item
        Name = 'FLGRETIFICA'
        DataType = ftFloat
      end>
    IndexDefs = <
      item
        Name = 'cdsBemResultIndex2'
        Fields = 'DESBEM'
      end>
    IndexName = 'cdsBemResultIndex2'
    Params = <>
    ProviderName = 'dspBemResult'
    StoreDefs = True
    Left = 632
    Top = 335
    object cdsBemResultIDBEM: TFloatField
      FieldName = 'IDBEM'
    end
    object cdsBemResultIDIMOVEL: TFloatField
      FieldName = 'IDIMOVEL'
    end
    object cdsBemResultIDPESSOA: TFloatField
      FieldName = 'IDPESSOA'
    end
    object cdsBemResultIDREAVALIACAO: TFloatField
      FieldName = 'IDREAVALIACAO'
    end
    object cdsBemResultDATAREAVALIACAO: TDateTimeField
      FieldName = 'DATAREAVALIACAO'
    end
    object cdsBemResultIDAVALIADOR: TFloatField
      FieldName = 'IDAVALIADOR'
    end
    object cdsBemResultVLRREAVALIA: TFloatField
      FieldName = 'VLRREAVALIA'
      DisplayFormat = ',0.00'
      EditFormat = ',0.00'
    end
    object cdsBemResultVIDAUTIL: TFloatField
      FieldName = 'VIDAUTIL'
    end
    object cdsBemResultAJUSTEDEP: TFloatField
      FieldName = 'AJUSTEDEP'
      DisplayFormat = ',0.00'
      EditFormat = ',0.00'
    end
    object cdsBemResultNOVOSALDO: TFloatField
      FieldName = 'NOVOSALDO'
      DisplayFormat = ',0.00'
      EditFormat = ',0.00'
    end
    object cdsBemResultDESBEM: TStringField
      FieldName = 'DESBEM'
      FixedChar = True
      Size = 128
    end
    object cdsBemResultFLGRETIFICA: TFloatField
      FieldName = 'FLGRETIFICA'
    end
  end
  object dspBemResult: TDataSetProvider
    DataSet = qryBemResult
    Constraints = True
    Left = 632
    Top = 317
  end
  object updBemResult: TUpdateSQL
    Left = 632
    Top = 300
  end
  object dsBemResult: TwwDataSource
    DataSet = cdsBemResult
    Left = 632
    Top = 281
  end
  object qryBemResult: TwwQuery
    CachedUpdates = True
    DatabaseName = 'BaseDados'
    SQL.Strings = (
      'SELECT'
      
        '    '#39'                                                           ' +
        ' '#39' AS DESBEM,'
      '    IDBEM,'
      '    IDIMOVEL,'
      '    IDPESSOA,'
      '    IDREAVALIACAO,'
      '    DATAREAVALIACAO,'
      '    IDAVALIADOR,'
      '    VLRREAVALIA,'
      '    VIDAUTIL,'
      '    FLGRETIFICA,'
      '    0 AS AJUSTEDEP,'
      '    0 AS NOVOSALDO'
      'FROM REAVALIAXREAVALIA'
      'WHERE 1 = 2'
      ' '
      ' ')
    UpdateObject = updBemResult
    ValidateWithMask = True
    Left = 632
    Top = 264
    object qryBemResultIDBEM: TFloatField
      FieldName = 'IDBEM'
    end
    object qryBemResultIDIMOVEL: TFloatField
      FieldName = 'IDIMOVEL'
    end
    object qryBemResultIDPESSOA: TFloatField
      FieldName = 'IDPESSOA'
    end
    object qryBemResultIDREAVALIACAO: TFloatField
      FieldName = 'IDREAVALIACAO'
    end
    object qryBemResultDATAREAVALIACAO: TDateTimeField
      FieldName = 'DATAREAVALIACAO'
    end
    object qryBemResultIDAVALIADOR: TFloatField
      FieldName = 'IDAVALIADOR'
    end
    object qryBemResultVLRREAVALIA: TFloatField
      FieldName = 'VLRREAVALIA'
    end
    object qryBemResultVIDAUTIL: TFloatField
      FieldName = 'VIDAUTIL'
    end
    object qryBemResultAJUSTEDEP: TFloatField
      FieldName = 'AJUSTEDEP'
    end
    object qryBemResultNOVOSALDO: TFloatField
      FieldName = 'NOVOSALDO'
    end
    object qryBemResultDESBEM: TStringField
      FieldName = 'DESBEM'
      FixedChar = True
      Size = 128
    end
    object qryBemResultFLGRETIFICA: TFloatField
      FieldName = 'FLGRETIFICA'
    end
  end
  object qryInsReavalia: TwwQuery
    DatabaseName = 'BaseDados'
    SQL.Strings = (
      'INSERT INTO REAVALIAXREAVALIA'
      ' ( IDPESSOA,'
      '   IDIMOVEL,'
      '   IDBEM,'
      '   IDREAVALIACAO,'
      '   IDAVALIADOR,'
      '   DATAREAVALIACAO,'
      '   VLRREAVALIA,'
      '   VIDAUTIL,'
      '   FLGRETIFICA )'
      'VALUES'
      ' ( :PIDPESSOA,'
      '   :PIDIMOVEL,'
      '   :PIDBEM,'
      '   :PIDREAVALIACAO,'
      '   :PIDAVALIADOR,'
      '   :PDATAREAVALIACAO,'
      '   :PVLRREAVALIA,'
      '   :PVIDAUTIL,'
      '   :PFLGRETIFICA )'
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
    Left = 512
    Top = 157
    ParamData = <
      item
        DataType = ftInteger
        Name = 'PIDPESSOA'
        ParamType = ptInput
      end
      item
        DataType = ftInteger
        Name = 'PIDIMOVEL'
        ParamType = ptInput
      end
      item
        DataType = ftInteger
        Name = 'PIDBEM'
        ParamType = ptInput
      end
      item
        DataType = ftInteger
        Name = 'PIDREAVALIACAO'
        ParamType = ptInput
      end
      item
        DataType = ftInteger
        Name = 'PIDAVALIADOR'
        ParamType = ptInput
      end
      item
        DataType = ftDateTime
        Name = 'PDATAREAVALIACAO'
        ParamType = ptInput
      end
      item
        DataType = ftFloat
        Name = 'PVLRREAVALIA'
        ParamType = ptInput
      end
      item
        DataType = ftInteger
        Name = 'PVIDAUTIL'
        ParamType = ptInput
      end
      item
        DataType = ftInteger
        Name = 'PFLGRETIFICA'
        ParamType = ptInput
      end>
  end
  object qryValCalculado: TwwQuery
    CachedUpdates = True
    DatabaseName = 'BaseDados'
    SQL.Strings = (
      'SELECT sum(VM.VALOR) AS VALOR'
      'from'
      '     VLRHISTMOVBEM VM,'
      '     TIPOMOVIMENTACAO TM,'
      '     HISTORICOMOVIMENTACAO HM'
      'WHERE HM.IDBEM = :PIDBEM'
      '  AND HM.DATAMOVIMENTACAO = :PDATAMOVIMENTACAO'
      '  AND TM.IDTIPOMOVIMENTACAO = HM.IDTIPOMOVIMENTACAO + 0'
      '  AND HM.IDMOVIMENTACAO = VM.IDMOVIMENTACAO (+)'
      '  AND TM.IDTIPOMOVIMENTACAO IN (14,18)'
      '')
    UpdateObject = updBem
    ValidateWithMask = True
    Left = 616
    Top = 136
    ParamData = <
      item
        DataType = ftInteger
        Name = 'PIDBEM'
        ParamType = ptInput
      end
      item
        DataType = ftDate
        Name = 'PDATAMOVIMENTACAO'
        ParamType = ptInput
      end>
    object qryValCalculadoVALOR: TFloatField
      FieldName = 'VALOR'
    end
  end
end
