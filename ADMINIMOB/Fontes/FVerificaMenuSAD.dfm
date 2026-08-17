inherited frmVerificaMenuSAD: TfrmVerificaMenuSAD
  Left = 149
  Top = 109
  Caption = 'Verificação de Menu'
  ClientHeight = 433
  ClientWidth = 581
  PixelsPerInch = 96
  TextHeight = 13
  inherited pnlFundo: TPanel
    Width = 581
    Height = 394
    object pgCtrlVerificaMenu: TPageControl
      Left = 1
      Top = 58
      Width = 579
      Height = 335
      ActivePage = tbsResultado
      Align = alClient
      TabOrder = 0
      object tbsResultado: TTabSheet
        Caption = 'Resultado da Verificação'
        ImageIndex = 1
        object memResult: TMemo
          Left = 0
          Top = 0
          Width = 571
          Height = 307
          Align = alClient
          TabOrder = 0
        end
      end
    end
    object pnlDados: TPanel
      Left = 1
      Top = 1
      Width = 579
      Height = 57
      Align = alTop
      TabOrder = 1
      object lbNomDescricao: TfcLabel
        Left = 16
        Top = 16
        Width = 81
        Height = 24
        Caption = 'Módulo:'
        Color = clBtnFace
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Height = -21
        Font.Name = 'Arial'
        Font.Style = [fsBold]
        ParentColor = False
        ParentFont = False
        TextOptions.Alignment = taLeftJustify
        TextOptions.Style = fclsRaised
        TextOptions.VAlignment = vaTop
      end
      object lblModulo: TfcLabel
        Left = 112
        Top = 16
        Width = 170
        Height = 24
        Caption = 'Nome do Módulo'
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
    end
  end
  inherited Dock971: TDock97
    Top = 394
    Width = 581
    inherited tb97Fundo: TToolbar97
      Left = 409
      DockPos = 850
    end
    inherited TB97oKCancelar: TToolbar97
      Left = 159
      DockPos = 600
      inherited ToolbarSep971: TToolbarSep97
        Visible = False
      end
      inherited bbtnConfirmar: TBitBtn
        Caption = '&Verificar'
        OnClick = bbtnConfirmarClick
      end
      inherited bbtnCancelar: TBitBtn
        Visible = False
      end
      object btImprimir: TBitBtn
        Left = 165
        Top = 0
        Width = 81
        Height = 33
        Caption = '&Imprimir'
        TabOrder = 2
        OnClick = btImprimirClick
        Glyph.Data = {
          76010000424D7601000000000000760000002800000020000000100000000100
          0400000000000001000000000000000000001000000010000000000000000000
          800000800000008080008000000080008000808000007F7F7F00BFBFBF000000
          FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00300000000000
          0003377777777777777308888888888888807F33333333333337088888888888
          88807FFFFFFFFFFFFFF7000000000000000077777777777777770F8F8F8F8F8F
          8F807F333333333333F708F8F8F8F8F8F9F07F333333333337370F8F8F8F8F8F
          8F807FFFFFFFFFFFFFF7000000000000000077777777777777773330FFFFFFFF
          03333337F3FFFF3F7F333330F0000F0F03333337F77773737F333330FFFFFFFF
          03333337F3FF3FFF7F333330F00F000003333337F773777773333330FFFF0FF0
          33333337F3F37F3733333330F08F0F0333333337F7337F7333333330FFFF0033
          33333337FFFF7733333333300000033333333337777773333333}
        NumGlyphs = 2
      end
    end
  end
  inherited ivTradutor: TIvExtendedTranslator
    Left = 386
    Top = 15
    TargetsData = (
      1
      1
      (
        'TMemo'
        'Text'
        0))
  end
  object qryModulo: TwwQuery
    DatabaseName = 'BaseDados'
    SQL.Strings = (
      'SELECT IDMODULO, NOMEMODULO'
      'FROM MODULO'
      'ORDER BY NOMEMODULO')
    ValidateWithMask = True
    Left = 33
    Top = 94
  end
  object qryMenu: TwwQuery
    DatabaseName = 'BaseDados'
    SQL.Strings = (
      'SELECT IDFUNCAO, NOMEFUNCAO'
      'FROM FUNCAO'
      'WHERE IDMODULO = :IDMODULO'
      'AND UPPER(NOMEFUNCAO) = UPPER(:NOMEFUNCAO)')
    ValidateWithMask = True
    Left = 153
    Top = 95
    ParamData = <
      item
        DataType = ftInteger
        Name = 'IDMODULO'
        ParamType = ptUnknown
      end
      item
        DataType = ftString
        Name = 'NOMEFUNCAO'
        ParamType = ptUnknown
      end>
    object qryMenuIDFUNCAO: TFloatField
      FieldName = 'IDFUNCAO'
      Origin = 'BASEDADOS."CM.FUNCAO".IDFUNCAO'
    end
    object qryMenuNOMEFUNCAO: TStringField
      FieldName = 'NOMEFUNCAO'
      Origin = 'BASEDADOS."CM.FUNCAO".NOMEFUNCAO'
      Size = 60
    end
  end
  object qryBanco: TwwQuery
    DatabaseName = 'BaseDados'
    SQL.Strings = (
      
        'SELECT FUP.NOMEFUNCAO AS FUNCAOPAI, FU.NOMEFUNCAO AS FUNCAO, OB.' +
        'NOMEOBJETO AS OBJETO, OB.IDOBJETO, FU.IDFUNCAO'
      'FROM OBJETO OB, FROBFNOP FP, OPERFUNC OP, FUNCAO FU,'
      '     (SELECT IDFUNCAO, NOMEFUNCAO'
      '             FROM FUNCAO) FUP'
      'WHERE FU.IDMODULO = :IDMODULO'
      '  AND OB.IDOBJETO = FP.IDOBJETO'
      '  AND FP.IDOPERFUNC = OP.IDOPERFUNC'
      '  AND OP.IDFUNCAO = FU.IDFUNCAO'
      '  AND FU.IDFUNCAOPAI = FUP.IDFUNCAO'
      ''
      ' '
      ' ')
    ValidateWithMask = True
    Left = 92
    Top = 94
    ParamData = <
      item
        DataType = ftInteger
        Name = 'IDMODULO'
        ParamType = ptUnknown
      end>
    object qryBancoFUNCAOPAI: TStringField
      FieldName = 'FUNCAOPAI'
      Size = 60
    end
    object qryBancoFUNCAO: TStringField
      FieldName = 'FUNCAO'
      Size = 60
    end
    object qryBancoOBJETO: TStringField
      FieldName = 'OBJETO'
      FixedChar = True
      Size = 100
    end
    object qryBancoIDOBJETO: TFloatField
      FieldName = 'IDOBJETO'
    end
    object qryBancoIDFUNCAO: TFloatField
      FieldName = 'IDFUNCAO'
    end
  end
  object rptRelatorio: TppReport
    AutoStop = False
    DataPipeline = pplRelatorio
    PrinterSetup.BinName = 'Default'
    PrinterSetup.DocumentName = 'Diferenças de Menu - SAD'
    PrinterSetup.PaperName = 'A4'
    PrinterSetup.PrinterName = 'Default'
    PrinterSetup.mmMarginBottom = 6350
    PrinterSetup.mmMarginLeft = 6350
    PrinterSetup.mmMarginRight = 6350
    PrinterSetup.mmMarginTop = 6350
    PrinterSetup.mmPaperHeight = 297000
    PrinterSetup.mmPaperWidth = 210000
    PrinterSetup.PaperSize = 9
    DeviceType = 'Screen'
    OutlineSettings.CreateNode = True
    OutlineSettings.CreatePageNodes = True
    OutlineSettings.Enabled = False
    OutlineSettings.Visible = False
    TextSearchSettings.DefaultString = '<FindText>'
    TextSearchSettings.Enabled = False
    Left = 445
    Top = 13
    Version = '7.04'
    mmColumnWidth = 0
    DataPipelineName = 'pplRelatorio'
    object ppHeaderBand1: TppHeaderBand
      mmBottomOffset = 0
      mmHeight = 8467
      mmPrintPosition = 0
      object ppLabel1: TppLabel
        UserName = 'Label1'
        Caption = 'Divergências de Menu '
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 14
        Font.Style = [fsBold]
        TextAlignment = taCentered
        Transparent = True
        mmHeight = 5821
        mmLeft = 74083
        mmTop = 1058
        mmWidth = 52917
        BandType = 0
      end
      object ppLine1: TppLine
        UserName = 'Line1'
        ParentWidth = True
        Weight = 0.75
        mmHeight = 529
        mmLeft = 0
        mmTop = 7938
        mmWidth = 197300
        BandType = 0
      end
    end
    object ppDetailBand1: TppDetailBand
      PrintHeight = phDynamic
      mmBottomOffset = 0
      mmHeight = 5292
      mmPrintPosition = 0
      object ppDBText2: TppDBText
        UserName = 'DBText2'
        DataField = 'NOMEFUNCAO'
        DataPipeline = pplRelatorio
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 10
        Font.Style = [fsBold]
        Transparent = True
        DataPipelineName = 'pplRelatorio'
        mmHeight = 4233
        mmLeft = 1058
        mmTop = 529
        mmWidth = 64558
        BandType = 4
      end
      object ppDBText3: TppDBText
        UserName = 'DBText3'
        DataField = 'ITEMMENU'
        DataPipeline = pplRelatorio
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 10
        Font.Style = [fsBold]
        Transparent = True
        DataPipelineName = 'pplRelatorio'
        mmHeight = 4233
        mmLeft = 125148
        mmTop = 529
        mmWidth = 62177
        BandType = 4
      end
      object ppDBText4: TppDBText
        UserName = 'DBText4'
        DataField = 'FUNCAOPAI'
        DataPipeline = pplRelatorio
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 10
        Font.Style = [fsBold]
        Transparent = True
        DataPipelineName = 'pplRelatorio'
        mmHeight = 4233
        mmLeft = 67733
        mmTop = 529
        mmWidth = 55298
        BandType = 4
      end
      object ppDBText5: TppDBText
        UserName = 'DBText5'
        DataField = 'TEMITEM'
        DataPipeline = pplRelatorio
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 10
        Font.Style = [fsBold]
        TextAlignment = taRightJustified
        Transparent = True
        DataPipelineName = 'pplRelatorio'
        mmHeight = 4233
        mmLeft = 188913
        mmTop = 529
        mmWidth = 7144
        BandType = 4
      end
    end
    object ppFooterBand1: TppFooterBand
      mmBottomOffset = 0
      mmHeight = 0
      mmPrintPosition = 0
    end
    object ppGroup1: TppGroup
      BreakName = 'TIPO'
      DataPipeline = pplRelatorio
      OutlineSettings.CreateNode = True
      UserName = 'Group1'
      mmNewColumnThreshold = 0
      mmNewPageThreshold = 0
      DataPipelineName = 'pplRelatorio'
      object ppGroupHeaderBand1: TppGroupHeaderBand
        mmBottomOffset = 0
        mmHeight = 11906
        mmPrintPosition = 0
        object ppShape1: TppShape
          UserName = 'Shape1'
          Brush.Color = clSilver
          ParentWidth = True
          mmHeight = 6085
          mmLeft = 0
          mmTop = 0
          mmWidth = 197300
          BandType = 3
          GroupNo = 0
        end
        object ppDBText1: TppDBText
          UserName = 'DBText1'
          DataField = 'TIPO'
          DataPipeline = pplRelatorio
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 10
          Font.Style = [fsBold]
          Transparent = True
          DataPipelineName = 'pplRelatorio'
          mmHeight = 4233
          mmLeft = 1058
          mmTop = 794
          mmWidth = 109538
          BandType = 3
          GroupNo = 0
        end
        object ppLine2: TppLine
          UserName = 'Line2'
          Weight = 0.75
          mmHeight = 1323
          mmLeft = 794
          mmTop = 11377
          mmWidth = 196057
          BandType = 3
          GroupNo = 0
        end
        object lblCaption: TppLabel
          UserName = 'lblCaption'
          Caption = 'Caption do Menu'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 10
          Font.Style = [fsBold]
          Transparent = True
          mmHeight = 4233
          mmLeft = 794
          mmTop = 7144
          mmWidth = 29104
          BandType = 3
          GroupNo = 0
        end
        object lblItem: TppLabel
          UserName = 'lblItem'
          Caption = 'Nome do Item de Menu'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 10
          Font.Style = [fsBold]
          Transparent = True
          mmHeight = 4233
          mmLeft = 125148
          mmTop = 7144
          mmWidth = 39158
          BandType = 3
          GroupNo = 0
        end
        object lblFuncaoPai: TppLabel
          UserName = 'lblFuncaoPai'
          Caption = 'Função Pai'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 10
          Font.Style = [fsBold]
          Transparent = True
          mmHeight = 4233
          mmLeft = 67733
          mmTop = 7144
          mmWidth = 19050
          BandType = 3
          GroupNo = 0
        end
        object lblCadastrado: TppLabel
          UserName = 'lblCadastrado'
          Caption = 'Cadastrado'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 10
          Font.Style = [fsBold]
          Transparent = True
          mmHeight = 4233
          mmLeft = 177271
          mmTop = 7144
          mmWidth = 19579
          BandType = 3
          GroupNo = 0
        end
      end
      object ppGroupFooterBand1: TppGroupFooterBand
        mmBottomOffset = 0
        mmHeight = 0
        mmPrintPosition = 0
      end
    end
  end
  object qryRelatorio: TwwQuery
    CachedUpdates = True
    DatabaseName = 'BaseDados'
    SQL.Strings = (
      'SELECT '#39'                                      '#39' AS TIPO,'
      '       NOMEFUNCAO,'
      
        '       '#39'                                                        ' +
        '    '#39' AS ITEMMENU,'
      
        '       '#39'                                                        ' +
        '    '#39' AS FUNCAOPAI,'
      '       '#39' '#39' AS TEMITEM'
      'FROM FUNCAO'
      'WHERE 1=2'
      ' '
      ' '
      ' ')
    UpdateObject = updRelatorio
    ValidateWithMask = True
    Left = 289
    Top = 110
    object qryRelatorioTIPO: TStringField
      FieldName = 'TIPO'
      FixedChar = True
      Size = 38
    end
    object qryRelatorioNOMEFUNCAO: TStringField
      FieldName = 'NOMEFUNCAO'
      Origin = 'BASEDADOS.FUNCAO.NOMEFUNCAO'
      Size = 60
    end
    object qryRelatorioITEMMENU: TStringField
      FieldName = 'ITEMMENU'
      FixedChar = True
      Size = 60
    end
    object qryRelatorioFUNCAOPAI: TStringField
      FieldName = 'FUNCAOPAI'
      FixedChar = True
      Size = 60
    end
    object qryRelatorioTEMITEM: TStringField
      FieldName = 'TEMITEM'
      FixedChar = True
      Size = 1
    end
  end
  object updRelatorio: TUpdateSQL
    ModifySQL.Strings = (
      'update FUNCAO'
      'set'
      '  TIPO = :TIPO,'
      '  NOMEFUNCAO = :NOMEFUNCAO,'
      '  ITEMMENU = :ITEMMENU,'
      '  FUNCAOPAI = :FUNCAOPAI,'
      '  TEMITEM = :TEMITEM'
      'where'
      '  TIPO = :OLD_TIPO and'
      '  NOMEFUNCAO = :OLD_NOMEFUNCAO and'
      '  ITEMMENU = :OLD_ITEMMENU and'
      '  FUNCAOPAI = :OLD_FUNCAOPAI and'
      '  TEMITEM = :OLD_TEMITEM')
    InsertSQL.Strings = (
      'insert into FUNCAO'
      '  (TIPO, NOMEFUNCAO, ITEMMENU, FUNCAOPAI, TEMITEM)'
      'values'
      '  (:TIPO, :NOMEFUNCAO, :ITEMMENU, :FUNCAOPAI, :TEMITEM)')
    DeleteSQL.Strings = (
      'delete from FUNCAO'
      'where'
      '  TIPO = :OLD_TIPO and'
      '  NOMEFUNCAO = :OLD_NOMEFUNCAO and'
      '  ITEMMENU = :OLD_ITEMMENU and'
      '  FUNCAOPAI = :OLD_FUNCAOPAI and'
      '  TEMITEM = :OLD_TEMITEM')
    Left = 289
    Top = 166
  end
  object pplRelatorio: TppBDEPipeline
    DataSource = dsRelatorio
    UserName = 'lRelatorio'
    Left = 289
    Top = 262
    object pplRelatorioppField1: TppField
      FieldAlias = 'TIPO'
      FieldName = 'TIPO'
      FieldLength = 0
      DisplayWidth = 0
      Position = 0
    end
    object pplRelatorioppField2: TppField
      FieldAlias = 'NOMEFUNCAO'
      FieldName = 'NOMEFUNCAO'
      FieldLength = 60
      DisplayWidth = 60
      Position = 1
    end
    object pplRelatorioppField3: TppField
      FieldAlias = 'ITEMMENU'
      FieldName = 'ITEMMENU'
      FieldLength = 60
      DisplayWidth = 60
      Position = 2
    end
    object pplRelatorioppField4: TppField
      FieldAlias = 'FUNCAOPAI'
      FieldName = 'FUNCAOPAI'
      FieldLength = 60
      DisplayWidth = 60
      Position = 3
    end
    object pplRelatorioppField5: TppField
      FieldAlias = 'TEMITEM'
      FieldName = 'TEMITEM'
      FieldLength = 1
      DisplayWidth = 1
      Position = 4
    end
  end
  object dsRelatorio: TwwDataSource
    AutoEdit = False
    DataSet = qryRelatorio
    Left = 289
    Top = 214
  end
  object qryObjeto: TwwQuery
    DatabaseName = 'BaseDados'
    SQL.Strings = (
      
        'SELECT FUP.NOMEFUNCAO AS FUNCAOPAI, FU.NOMEFUNCAO AS FUNCAO, OB.' +
        'NOMEOBJETO AS OBJETO, OB.IDOBJETO, FU.IDFUNCAO'
      'FROM OBJETO OB, FROBFNOP FP, OPERFUNC OP, FUNCAO FU,'
      '     (SELECT IDFUNCAO, NOMEFUNCAO'
      '             FROM FUNCAO) FUP'
      'WHERE UPPER(OB.NOMEOBJETO) = UPPER(:NOMEOBJETO)'
      '  AND FU.IDMODULO = :IDMODULO'
      '  AND OB.IDOBJETO = FP.IDOBJETO'
      '  AND FP.IDOPERFUNC = OP.IDOPERFUNC'
      '  AND OP.IDFUNCAO = FU.IDFUNCAO'
      '  AND FU.IDFUNCAOPAI = FUP.IDFUNCAO'
      ' ')
    ValidateWithMask = True
    Left = 209
    Top = 94
    ParamData = <
      item
        DataType = ftString
        Name = 'NOMEOBJETO'
        ParamType = ptInput
      end
      item
        DataType = ftInteger
        Name = 'IDMODULO'
        ParamType = ptInput
      end>
    object qryObjetoFUNCAOPAI: TStringField
      FieldName = 'FUNCAOPAI'
      Size = 60
    end
    object qryObjetoFUNCAO: TStringField
      FieldName = 'FUNCAO'
      Size = 60
    end
    object qryObjetoOBJETO: TStringField
      FieldName = 'OBJETO'
      FixedChar = True
      Size = 100
    end
    object qryObjetoIDOBJETO: TFloatField
      FieldName = 'IDOBJETO'
    end
    object qryObjetoIDFUNCAO: TFloatField
      FieldName = 'IDFUNCAO'
    end
  end
end
