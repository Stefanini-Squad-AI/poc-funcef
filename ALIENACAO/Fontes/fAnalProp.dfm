inherited frmAnalProp: TfrmAnalProp
  Left = 61
  Top = 87
  HelpContext = 1350032
  Caption = 'Analise da Proposta '
  ClientHeight = 407
  ClientWidth = 701
  PixelsPerInch = 96
  TextHeight = 13
  inherited pnlFundo: TPanel
    Width = 701
    Height = 368
    object Panel1: TPanel
      Left = 1
      Top = 1
      Width = 699
      Height = 52
      Align = alTop
      TabOrder = 0
      inline molProposta1: TmolProposta
        Left = 16
        Top = 4
        Width = 657
        inherited Label1: TLabel
          Left = 0
        end
        inherited Label2: TLabel
          Left = 162
        end
        inherited edtNomProp: TEdit
          Left = 160
          Width = 417
        end
        inherited btnBuscaProp: TBitBtn
          Left = 578
          OnClick = molProposta1btnBuscaPropClick
        end
        inherited btnLimpaProp: TBitBtn
          Left = 602
          OnClick = molProposta1btnLimpaPropClick
        end
        inherited edtNumProp: TEdit
          Left = 0
          Width = 161
        end
      end
    end
    object Panel2: TPanel
      Left = 1
      Top = 53
      Width = 699
      Height = 48
      Align = alTop
      Enabled = False
      TabOrder = 1
      object Label24: TLabel
        Left = 16
        Top = 4
        Width = 76
        Height = 13
        Caption = 'Avaliação  + '
      end
      object lbTxCorret: TDBText
        Left = 96
        Top = 4
        Width = 33
        Height = 17
        Alignment = taRightJustify
        DataField = 'CONTAXAADMIN'
        DataSource = dsProp
      end
      object Label25: TLabel
        Left = 128
        Top = 4
        Width = 22
        Height = 13
        Caption = ' %  '
      end
      object lblAluguel: TLabel
        Left = 235
        Top = 4
        Width = 53
        Height = 13
        Caption = 'Aluguel /'
      end
      object lbPercAlug: TDBText
        Left = 299
        Top = 4
        Width = 41
        Height = 17
        Alignment = taRightJustify
        DataField = 'PERALUGUELIDEAL'
        DataSource = dsProp
      end
      object Label27: TLabel
        Left = 342
        Top = 4
        Width = 26
        Height = 13
        Caption = ' %   '
      end
      object Label28: TLabel
        Left = 454
        Top = 4
        Width = 84
        Height = 13
        Caption = 'Valor Presente'
      end
      object edValorAvali: TRealEdit
        Left = 16
        Top = 20
        Width = 124
        Height = 21
        TabStop = False
        Alignment = taRightJustify
        Color = clGray
        Ctl3D = True
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWhite
        Font.Height = -9
        Font.Name = 'MS Sans Serif'
        Font.Style = [fsBold]
        Lines.Strings = (
          '      0,00')
        ParentCtl3D = False
        ParentFont = False
        ReadOnly = True
        TabOrder = 0
        WordWrap = False
        IntDigits = 10
        DecDigits = 2
        NumberFormat = fNumber
        Signal = False
      end
      object edValorAlug: TRealEdit
        Left = 235
        Top = 20
        Width = 121
        Height = 21
        TabStop = False
        Alignment = taRightJustify
        Color = clGray
        Ctl3D = True
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWhite
        Font.Height = -9
        Font.Name = 'MS Sans Serif'
        Font.Style = [fsBold]
        Lines.Strings = (
          '      0,00')
        ParentCtl3D = False
        ParentFont = False
        ReadOnly = True
        TabOrder = 1
        WordWrap = False
        IntDigits = 10
        DecDigits = 2
        NumberFormat = fNumber
        Signal = False
      end
      object edValPresAnal: TRealEdit
        Left = 454
        Top = 20
        Width = 139
        Height = 21
        TabStop = False
        Alignment = taRightJustify
        Color = clGray
        Ctl3D = True
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWhite
        Font.Height = -9
        Font.Name = 'MS Sans Serif'
        Font.Style = [fsBold]
        Lines.Strings = (
          '      0,00')
        ParentCtl3D = False
        ParentFont = False
        ReadOnly = True
        TabOrder = 2
        WordWrap = False
        IntDigits = 10
        DecDigits = 2
        NumberFormat = fNumber
        Signal = False
      end
    end
    object grd: TwwDBGrid
      Left = 1
      Top = 101
      Width = 699
      Height = 215
      Selected.Strings = (
        'MES'#9'6'#9'Nº de ~Meses'#9'F'
        'MESREF'#9'8'#9'Mês Ref.'#9'F'
        'VLRRECEBTO'#9'12'#9'Fluxo do ~Recebimento'#9'F'
        'VLRRENDRECEBTO'#9'14'#9'Rend. do Fluxo ~do Recebimento'#9'F'
        'VLRRECEBTOACUM'#9'19'#9'Fluxo do Recebimento ~Aplicado Acumulado'#9'F'
        'VLREVOLUCAOVENDA'#9'16'#9'Evolução Aplicação ~do Valor Presente'#9'F'
        'VLRENDIMENTO'#9'15'#9'Rend. Aplicação ~do Valor Presente'#9'F'
        'VLRALUGUEL'#9'10'#9'Valor do ~Aluguel'#9'F'
        'VLRRENDALUGAPLIC'#9'14'#9'Rend. Aplicação ~do Aluguel'#9'F'
        'VLRRENDALUGACUM'#9'13'#9'Aluguel Aplicado~Acumulado'#9'F')
      IniAttributes.Delimiter = ';;'
      TitleColor = clBtnFace
      FixedCols = 0
      ShowHorzScrollBar = True
      Align = alClient
      DataSource = dsGrid
      Options = [dgTitles, dgColumnResize, dgColLines, dgRowLines, dgTabs, dgRowSelect, dgConfirmDelete, dgCancelOnExit, dgWordWrap]
      TabOrder = 2
      TitleAlignment = taLeftJustify
      TitleFont.Charset = DEFAULT_CHARSET
      TitleFont.Color = clWindowText
      TitleFont.Height = -9
      TitleFont.Name = 'MS Sans Serif'
      TitleFont.Style = [fsBold]
      TitleLines = 2
      TitleButtons = False
      OnCalcCellColors = grdCalcCellColors
      IndicatorColor = icBlack
      OnTopRowChanged = grdTopRowChanged
    end
    object Panel3: TPanel
      Left = 1
      Top = 316
      Width = 699
      Height = 51
      Align = alBottom
      BevelOuter = bvLowered
      TabOrder = 3
      object Label9: TLabel
        Left = 6
        Top = 4
        Width = 54
        Height = 13
        Caption = 'TOTAIS :'
      end
      object Label1: TLabel
        Left = 228
        Top = 4
        Width = 120
        Height = 13
        Caption = 'Aplic. Valor Presente'
      end
      object Label2: TLabel
        Left = 383
        Top = 4
        Width = 79
        Height = 13
        Caption = 'Aplic. Aluguel'
      end
      object Label3: TLabel
        Left = 539
        Top = 4
        Width = 113
        Height = 13
        Caption = 'Custo Oportunidade'
      end
      object Label4: TLabel
        Left = 72
        Top = 4
        Width = 111
        Height = 13
        Caption = 'Aplic. Recebimento'
      end
      object Label5: TLabel
        Left = 362
        Top = 19
        Width = 8
        Height = 24
        Caption = '-'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -19
        Font.Name = 'MS Sans Serif'
        Font.Style = [fsBold]
        ParentFont = False
      end
      object Label6: TLabel
        Left = 515
        Top = 20
        Width = 13
        Height = 24
        Caption = '='
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -19
        Font.Name = 'MS Sans Serif'
        Font.Style = [fsBold]
        ParentFont = False
      end
      object edTotRend: TRealEdit
        Left = 228
        Top = 22
        Width = 121
        Height = 21
        TabStop = False
        Alignment = taRightJustify
        Color = clInfoBk
        Enabled = False
        Lines.Strings = (
          '      0,00')
        ReadOnly = True
        TabOrder = 0
        WordWrap = False
        IntDigits = 10
        DecDigits = 2
        NumberFormat = fNumber
        Signal = False
      end
      object edTotDif: TRealEdit
        Left = 539
        Top = 22
        Width = 121
        Height = 21
        TabStop = False
        Alignment = taRightJustify
        Color = clInfoBk
        Enabled = False
        Lines.Strings = (
          '      0,00')
        ReadOnly = True
        TabOrder = 1
        WordWrap = False
        IntDigits = 10
        DecDigits = 2
        NumberFormat = fNumber
        Signal = False
      end
      object edTotAlug: TRealEdit
        Left = 383
        Top = 22
        Width = 121
        Height = 21
        TabStop = False
        Alignment = taRightJustify
        Color = clInfoBk
        Enabled = False
        Lines.Strings = (
          '      0,00')
        ReadOnly = True
        TabOrder = 2
        WordWrap = False
        IntDigits = 10
        DecDigits = 2
        NumberFormat = fNumber
        Signal = False
      end
      object edTotReceb: TRealEdit
        Left = 72
        Top = 22
        Width = 121
        Height = 21
        TabStop = False
        Alignment = taRightJustify
        Color = clInfoBk
        Enabled = False
        Lines.Strings = (
          '      0,00')
        ReadOnly = True
        TabOrder = 3
        WordWrap = False
        IntDigits = 10
        DecDigits = 2
        NumberFormat = fNumber
        Signal = False
      end
    end
  end
  inherited Dock971: TDock97
    Top = 368
    Width = 701
    inherited tb97Fundo: TToolbar97
      Left = 368
      DockPos = 368
      inherited sep1: TToolbarSep97
        Left = 246
      end
      object ToolbarSep971: TToolbarSep97 [1]
        Left = 160
        Top = 0
        Blank = True
        SizeHorz = 5
      end
      inherited bbtnSair: TBitBtn
        Left = 165
      end
      inherited bbtnAjuda: TmaHelpBitBtn
        Left = 248
      end
      object btnCalcular: TBitBtn
        Left = 0
        Top = 0
        Width = 80
        Height = 33
        Caption = '&Calcular'
        TabOrder = 2
        OnClick = btnCalcularClick
        Glyph.Data = {
          76010000424D7601000000000000760000002800000020000000100000000100
          04000000000000010000120B0000120B00001000000000000000000000000000
          800000800000008080008000000080008000808000007F7F7F00BFBFBF000000
          FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00337000000000
          73333337777777773F333308888888880333337F3F3F3FFF7F33330808089998
          0333337F737377737F333308888888880333337F3F3F3F3F7F33330808080808
          0333337F737373737F333308888888880333337F3F3F3F3F7F33330808080808
          0333337F737373737F333308888888880333337F3F3F3F3F7F33330808080808
          0333337F737373737F333308888888880333337F3FFFFFFF7F33330800000008
          0333337F7777777F7F333308000E0E080333337F7FFFFF7F7F33330800000008
          0333337F777777737F333308888888880333337F333333337F33330888888888
          03333373FFFFFFFF733333700000000073333337777777773333}
        NumGlyphs = 2
      end
      object btnImprime: TBitBtn
        Left = 80
        Top = 0
        Width = 80
        Height = 33
        Caption = '&Imprimir'
        TabOrder = 3
        OnClick = btnImprimeClick
        Glyph.Data = {
          76010000424D7601000000000000760000002800000020000000100000000100
          04000000000000010000120B0000120B00001000000000000000000000000000
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
    Left = 771
    Top = 65515
    TargetsData = (
      1
      1
      (
        'TRealEdit'
        'Text'
        0))
  end
  object dsProp: TwwDataSource
    AutoEdit = False
    DataSet = qryProp
    Left = 587
    Top = 172
  end
  object qryGrid: TwwQuery
    CachedUpdates = True
    DatabaseName = 'BaseDados'
    SQL.Strings = (
      'SELECT'
      '   '#39'       '#39' AS MESREF,'
      '   (0) AS VLRRECEBTO,'
      '   (0) AS VLRRENDRECEBTO,'
      '   (0) AS VLRRECEBTOACUM,'
      '   (0) AS VLREVOLUCAOVENDA,'
      '   (0) AS VLRENDIMENTO,'
      '   (0) AS VLRALUGUEL,'
      '   (0) AS VLRRENDALUG,'
      '   (0) AS VLRRENDALUGAPLIC,'
      '   (0) AS VLRRENDALUGACUM,'
      '   (0) AS MES'
      'FROM'
      '     CONTRATOIMOVEL'
      'WHERE'
      '     (1=2)'
      ''
      '')
    UpdateObject = updGrid
    ValidateWithMask = True
    Left = 336
    Top = 176
    object qryGridMES: TFloatField
      DisplayLabel = 'Nº de ~Meses'
      DisplayWidth = 6
      FieldName = 'MES'
    end
    object qryGridMESREF: TStringField
      DisplayLabel = 'Mês Ref.'
      DisplayWidth = 8
      FieldName = 'MESREF'
      Size = 7
    end
    object qryGridVLRRECEBTO: TFloatField
      DisplayLabel = 'Fluxo do ~Recebimento'
      DisplayWidth = 12
      FieldName = 'VLRRECEBTO'
      DisplayFormat = '#,##0.00'
    end
    object qryGridVLRRENDRECEBTO: TFloatField
      DisplayLabel = 'Rend. do Fluxo ~do Recebimento'
      DisplayWidth = 14
      FieldName = 'VLRRENDRECEBTO'
      DisplayFormat = '#,##0.00'
    end
    object qryGridVLRRECEBTOACUM: TFloatField
      DisplayLabel = 'Fluxo do Recebimento ~Aplicado Acumulado'
      DisplayWidth = 19
      FieldName = 'VLRRECEBTOACUM'
      DisplayFormat = '#,##0.00'
    end
    object qryGridVLREVOLUCAOVENDA: TFloatField
      DisplayLabel = 'Evolução Aplicação ~do Valor Presente'
      DisplayWidth = 16
      FieldName = 'VLREVOLUCAOVENDA'
      DisplayFormat = '#,##0.00'
    end
    object qryGridVLRENDIMENTO: TFloatField
      DisplayLabel = 'Rend. Aplicação ~do Valor Presente'
      DisplayWidth = 15
      FieldName = 'VLRENDIMENTO'
      DisplayFormat = '#,##0.00'
    end
    object qryGridVLRALUGUEL: TFloatField
      DisplayLabel = 'Valor do ~Aluguel'
      DisplayWidth = 10
      FieldName = 'VLRALUGUEL'
      DisplayFormat = '#,##0.00'
    end
    object qryGridVLRRENDALUGAPLIC: TFloatField
      DisplayLabel = 'Rend. Aplicação ~do Aluguel'
      DisplayWidth = 14
      FieldName = 'VLRRENDALUGAPLIC'
      DisplayFormat = '#,##0.00'
    end
    object qryGridVLRRENDALUGACUM: TFloatField
      DisplayLabel = 'Aluguel Aplicado~Acumulado'
      DisplayWidth = 13
      FieldName = 'VLRRENDALUGACUM'
      DisplayFormat = '#,##0.00'
    end
    object qryGridVLRRENDALUG: TFloatField
      DisplayLabel = 'Rend. Aplicação ~do Aluguel'
      DisplayWidth = 14
      FieldName = 'VLRRENDALUG'
      Visible = False
      DisplayFormat = '#,##0.00'
    end
  end
  object dsGrid: TwwDataSource
    AutoEdit = False
    DataSet = qryGrid
    Left = 427
    Top = 176
  end
  object updGrid: TUpdateSQL
    Left = 384
    Top = 176
  end
  object qryProp: TwwQuery
    CachedUpdates = True
    DatabaseName = 'BaseDados'
    SQL.Strings = (
      'SELECT'
      '     CI.IDCONTRATOIMOVEL,'
      '     CI.CONNUMERO,'
      '     CI.CONNOME,'
      '     CI.DATAOPERACAO,'
      '     CI.CONDATAINICIO,'
      '     CI.FLGTIPOCONTRATO,'
      '     CI.PERCTXJURMERC,'
      '     CI.PERITXJURMERC,'
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
      '     CI.CONPERREAJUSTE'
      'FROM'
      '     CONTRATOIMOVEL CI'
      'WHERE'
      '     (CI.IDCONTRATOIMOVEL = :IDCONTRATOIMOVEL)'
      ''
      '')
    ValidateWithMask = True
    Left = 541
    Top = 172
    ParamData = <
      item
        DataType = ftFloat
        Name = 'IDCONTRATOIMOVEL'
        ParamType = ptUnknown
      end>
    object qryPropIDCONTRATOIMOVEL: TFloatField
      FieldName = 'IDCONTRATOIMOVEL'
      Origin = '"CM.CONTRATOIMOVEL".IDCONTRATOIMOVEL'
    end
    object qryPropCONNUMERO: TStringField
      FieldName = 'CONNUMERO'
      Origin = '"CM.CONTRATOIMOVEL".CONNUMERO'
    end
    object qryPropCONNOME: TStringField
      FieldName = 'CONNOME'
      Origin = '"CM.CONTRATOIMOVEL".CONNOME'
      Size = 60
    end
    object qryPropCONDATAINICIO: TDateTimeField
      FieldName = 'CONDATAINICIO'
      Origin = '"CM.CONTRATOIMOVEL".CONDATAINICIO'
    end
    object qryPropFLGTIPOCONTRATO: TStringField
      FieldName = 'FLGTIPOCONTRATO'
      Origin = '"CM.CONTRATOIMOVEL".FLGTIPOCONTRATO'
      Size = 1
    end
    object qryPropCONTAXAADMIN: TFloatField
      FieldName = 'CONTAXAADMIN'
      Origin = '"CM.CONTRATOIMOVEL".CONTAXAADMIN'
    end
    object qryPropCONVLRAJUSTADO: TFloatField
      FieldName = 'CONVLRAJUSTADO'
      Origin = '"CM.CONTRATOIMOVEL".CONVLRAJUSTADO'
    end
    object qryPropCONVLRTOTAL: TFloatField
      FieldName = 'CONVLRTOTAL'
      Origin = '"CM.CONTRATOIMOVEL".CONVLRTOTAL'
    end
    object qryPropCONDESCRICAO: TMemoField
      FieldName = 'CONDESCRICAO'
      Origin = '"CM.CONTRATOIMOVEL".CONDESCRICAO'
      BlobType = ftMemo
      Size = 2000
    end
    object qryPropVLRPROPOSTA: TFloatField
      FieldName = 'VLRPROPOSTA'
      Origin = '"CM.CONTRATOIMOVEL".VLRPROPOSTA'
    end
    object qryPropVLRPRESENTE: TFloatField
      FieldName = 'VLRPRESENTE'
      Origin = '"CM.CONTRATOIMOVEL".VLRPRESENTE'
    end
    object qryPropVLRCONTABIL: TFloatField
      FieldName = 'VLRCONTABIL'
      Origin = '"CM.CONTRATOIMOVEL".VLRCONTABIL'
    end
    object qryPropCONINDICEMORA: TFloatField
      FieldName = 'CONINDICEMORA'
      Origin = '"CM.CONTRATOIMOVEL".CONINDICEMORA'
    end
    object qryPropCONINDICEREAJUSTE: TFloatField
      FieldName = 'CONINDICEREAJUSTE'
      Origin = 'CONTRATOIMOVEL.CONINDICEREAJUSTE'
    end
    object qryPropCONDATAREAJUSTE: TDateTimeField
      FieldName = 'CONDATAREAJUSTE'
      Origin = 'CONTRATOIMOVEL.CONDATAREAJUSTE'
    end
    object qryPropPERALUGUELIDEAL: TFloatField
      FieldName = 'PERALUGUELIDEAL'
      Origin = 'BASEDADOS.CONTRATOIMOVEL.PERALUGUELIDEAL'
    end
    object qryPropPERCTXJURMERC: TFloatField
      FieldName = 'PERCTXJURMERC'
    end
    object qryPropPERITXJURMERC: TStringField
      FieldName = 'PERITXJURMERC'
      FixedChar = True
      Size = 1
    end
    object qryPropDATAOPERACAO: TDateTimeField
      FieldName = 'DATAOPERACAO'
      Origin = 'BASEDADOS.CONTRATOIMOVEL.DATAOPERACAO'
    end
    object qryPropCONPERREAJUSTE: TFloatField
      FieldName = 'CONPERREAJUSTE'
      Origin = 'BASEDADOS.CONTRATOIMOVEL.CONPERREAJUSTE'
    end
  end
  object pplGrid: TppBDEPipeline
    DataSource = dsGrid
    UserName = 'lGrid'
    Left = 336
    Top = 232
    object pplGridppField1: TppField
      Alignment = taRightJustify
      FieldAlias = 'MES'
      FieldName = 'MES'
      FieldLength = 0
      DataType = dtDouble
      DisplayWidth = 6
      Position = 0
    end
    object pplGridppField2: TppField
      FieldAlias = 'MESREF'
      FieldName = 'MESREF'
      FieldLength = 7
      DisplayWidth = 8
      Position = 1
    end
    object pplGridppField3: TppField
      Alignment = taRightJustify
      FieldAlias = 'VLRRECEBTO'
      FieldName = 'VLRRECEBTO'
      FieldLength = 0
      DataType = dtDouble
      DisplayWidth = 12
      Position = 2
    end
    object pplGridppField4: TppField
      Alignment = taRightJustify
      FieldAlias = 'VLRRENDRECEBTO'
      FieldName = 'VLRRENDRECEBTO'
      FieldLength = 0
      DataType = dtDouble
      DisplayWidth = 14
      Position = 3
    end
    object pplGridppField5: TppField
      Alignment = taRightJustify
      FieldAlias = 'VLRRECEBTOACUM'
      FieldName = 'VLRRECEBTOACUM'
      FieldLength = 0
      DataType = dtDouble
      DisplayWidth = 19
      Position = 4
    end
    object pplGridppField6: TppField
      Alignment = taRightJustify
      FieldAlias = 'VLREVOLUCAOVENDA'
      FieldName = 'VLREVOLUCAOVENDA'
      FieldLength = 0
      DataType = dtDouble
      DisplayWidth = 16
      Position = 5
    end
    object pplGridppField7: TppField
      Alignment = taRightJustify
      FieldAlias = 'VLRENDIMENTO'
      FieldName = 'VLRENDIMENTO'
      FieldLength = 0
      DataType = dtDouble
      DisplayWidth = 15
      Position = 6
    end
    object pplGridppField8: TppField
      Alignment = taRightJustify
      FieldAlias = 'VLRALUGUEL'
      FieldName = 'VLRALUGUEL'
      FieldLength = 0
      DataType = dtDouble
      DisplayWidth = 10
      Position = 7
    end
    object pplGridppField9: TppField
      Alignment = taRightJustify
      FieldAlias = 'VLRRENDALUGAPLIC'
      FieldName = 'VLRRENDALUGAPLIC'
      FieldLength = 0
      DataType = dtDouble
      DisplayWidth = 14
      Position = 8
    end
    object pplGridppField10: TppField
      Alignment = taRightJustify
      FieldAlias = 'VLRRENDALUGACUM'
      FieldName = 'VLRRENDALUGACUM'
      FieldLength = 0
      DataType = dtDouble
      DisplayWidth = 13
      Position = 9
    end
    object pplGridppField11: TppField
      Alignment = taRightJustify
      FieldAlias = 'VLRRENDALUG'
      FieldName = 'VLRRENDALUG'
      FieldLength = 0
      DataType = dtDouble
      DisplayWidth = 14
      Position = 10
    end
  end
  object rpAnalProp: TppReport
    AutoStop = False
    DataPipeline = pplGrid
    PassSetting = psTwoPass
    PrinterSetup.BinName = 'Default'
    PrinterSetup.DocumentName = 'PpModeloReport1'
    PrinterSetup.PaperName = 'A4'
    PrinterSetup.PrinterName = 'Default'
    PrinterSetup.mmMarginBottom = 6350
    PrinterSetup.mmMarginLeft = 6350
    PrinterSetup.mmMarginRight = 6350
    PrinterSetup.mmMarginTop = 6350
    PrinterSetup.mmPaperHeight = 297000
    PrinterSetup.mmPaperWidth = 210000
    PrinterSetup.PaperSize = 9
    Template.SaveTo = stDatabase
    AllowPrintToArchive = True
    AllowPrintToFile = True
    BeforePrint = rpAnalPropBeforePrint
    DeviceType = 'Screen'
    ModalPreview = False
    OutlineSettings.CreateNode = True
    OutlineSettings.CreatePageNodes = True
    OutlineSettings.Enabled = False
    OutlineSettings.Visible = False
    TextSearchSettings.DefaultString = '<FindText>'
    TextSearchSettings.Enabled = False
    Left = 386
    Top = 232
    Version = '7.04'
    mmColumnWidth = 197300
    DataPipelineName = 'pplGrid'
    object HeaderBand1: TppHeaderBand
      mmBottomOffset = 0
      mmHeight = 37835
      mmPrintPosition = 0
      object Label11: TppLabel
        UserName = 'Label11'
        Caption = 'Analise da Proposta'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 12
        Font.Style = [fsBold]
        TextAlignment = taCentered
        Transparent = True
        mmHeight = 5292
        mmLeft = 79375
        mmTop = 8731
        mmWidth = 40746
        BandType = 0
      end
      object Line1: TppLine
        UserName = 'Line1'
        ParentWidth = True
        Weight = 0.75
        mmHeight = 1058
        mmLeft = 0
        mmTop = 27252
        mmWidth = 197300
        BandType = 0
      end
      object LblEmpresa: TppLabel
        UserName = 'LblEmpresa'
        Caption = 'LblEmpresa'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 14
        Font.Style = [fsBold]
        TextAlignment = taCentered
        Transparent = True
        mmHeight = 5821
        mmLeft = 84138
        mmTop = 1588
        mmWidth = 29633
        BandType = 0
      end
      object ppLabel1: TppLabel
        UserName = 'Label1'
        Caption = 'Parc'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = [fsBold]
        Transparent = True
        mmHeight = 3175
        mmLeft = 0
        mmTop = 29104
        mmWidth = 6085
        BandType = 0
      end
      object ppLabel2: TppLabel
        UserName = 'Label2'
        Caption = 'Mês Ref.'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = [fsBold]
        Transparent = True
        mmHeight = 3704
        mmLeft = 9525
        mmTop = 28575
        mmWidth = 12700
        BandType = 0
      end
      object ppLabel4: TppLabel
        UserName = 'Label4'
        Caption = 'Evolução'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = [fsBold]
        Transparent = True
        mmHeight = 3175
        mmLeft = 98690
        mmTop = 33602
        mmWidth = 12435
        BandType = 0
      end
      object ppLabel5: TppLabel
        UserName = 'Label5'
        Caption = 'Rendimentos'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = [fsBold]
        Transparent = True
        mmHeight = 3175
        mmLeft = 114829
        mmTop = 33602
        mmWidth = 19579
        BandType = 0
      end
      object ppLine1: TppLine
        UserName = 'Line3'
        ParentWidth = True
        Weight = 0.75
        mmHeight = 794
        mmLeft = 0
        mmTop = 37041
        mmWidth = 197300
        BandType = 0
      end
      object ppLabel6: TppLabel
        UserName = 'Label6'
        Caption = 'Aplicação do Aluguel'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 9
        Font.Style = [fsBold]
        Transparent = True
        mmHeight = 3969
        mmLeft = 151871
        mmTop = 28310
        mmWidth = 31221
        BandType = 0
      end
      object ppLabel7: TppLabel
        UserName = 'Label7'
        Caption = 'Valor'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = [fsBold]
        Transparent = True
        mmHeight = 3175
        mmLeft = 144463
        mmTop = 33602
        mmWidth = 7673
        BandType = 0
      end
      object ppLabel8: TppLabel
        UserName = 'Label8'
        Caption = 'Rendimentos'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = [fsBold]
        Transparent = True
        mmHeight = 3175
        mmLeft = 157163
        mmTop = 33602
        mmWidth = 17198
        BandType = 0
      end
      object ppLabel9: TppLabel
        UserName = 'Label9'
        Caption = 'Acumulado'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = [fsBold]
        Transparent = True
        mmHeight = 3175
        mmLeft = 182298
        mmTop = 33602
        mmWidth = 14817
        BandType = 0
      end
      object ppLabel3: TppLabel
        UserName = 'Label3'
        Caption = 'Aplicação do Valor Presente'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 9
        Font.Style = [fsBold]
        Transparent = True
        mmHeight = 3969
        mmLeft = 93134
        mmTop = 28310
        mmWidth = 42598
        BandType = 0
      end
      object ppLine2: TppLine
        UserName = 'Line4'
        ParentWidth = True
        Weight = 0.75
        mmHeight = 1058
        mmLeft = 0
        mmTop = 15610
        mmWidth = 197300
        BandType = 0
      end
      object ppLabel10: TppLabel
        UserName = 'Label10'
        Caption = 'Fluxo do Recebimento'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 9
        Font.Style = [fsBold]
        Transparent = True
        mmHeight = 3969
        mmLeft = 44450
        mmTop = 28310
        mmWidth = 33073
        BandType = 0
      end
      object ppLabel11: TppLabel
        UserName = 'Label12'
        Caption = 'Valor'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = [fsBold]
        Transparent = True
        mmHeight = 3175
        mmLeft = 38894
        mmTop = 33602
        mmWidth = 7144
        BandType = 0
      end
      object ppLabel12: TppLabel
        UserName = 'Label13'
        Caption = 'Rendimentos'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = [fsBold]
        Transparent = True
        mmHeight = 3175
        mmLeft = 51329
        mmTop = 33602
        mmWidth = 17992
        BandType = 0
      end
      object ppLabel13: TppLabel
        UserName = 'Label14'
        Caption = 'Acumulado'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = [fsBold]
        Transparent = True
        mmHeight = 3175
        mmLeft = 74877
        mmTop = 33602
        mmWidth = 14817
        BandType = 0
      end
      object lblProposta: TppLabel
        UserName = 'Label15'
        Caption = 'Label15'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 12
        Font.Style = [fsBold]
        Transparent = True
        mmHeight = 5292
        mmLeft = 0
        mmTop = 19050
        mmWidth = 15875
        BandType = 0
      end
    end
    object DetailBand1: TppDetailBand
      mmBottomOffset = 0
      mmHeight = 3175
      mmPrintPosition = 0
      object ppDBText2: TppDBText
        UserName = 'DBText2'
        DataField = 'MES'
        DataPipeline = pplGrid
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = []
        Transparent = True
        DataPipelineName = 'pplGrid'
        mmHeight = 3175
        mmLeft = 265
        mmTop = 0
        mmWidth = 6350
        BandType = 4
      end
      object ppDBText1: TppDBText
        UserName = 'DBText1'
        DataField = 'MESREF'
        DataPipeline = pplGrid
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = []
        Transparent = True
        DataPipelineName = 'pplGrid'
        mmHeight = 3175
        mmLeft = 9260
        mmTop = 0
        mmWidth = 17198
        BandType = 4
      end
      object ppDBText3: TppDBText
        UserName = 'DBText3'
        DataField = 'VLRENDIMENTO'
        DataPipeline = pplGrid
        DisplayFormat = '#,##0.00'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = []
        TextAlignment = taRightJustified
        Transparent = True
        DataPipelineName = 'pplGrid'
        mmHeight = 3175
        mmLeft = 115094
        mmTop = 0
        mmWidth = 17198
        BandType = 4
      end
      object ppDBText4: TppDBText
        UserName = 'DBText4'
        DataField = 'VLREVOLUCAOVENDA'
        DataPipeline = pplGrid
        DisplayFormat = '#,##0.00'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = []
        TextAlignment = taRightJustified
        Transparent = True
        DataPipelineName = 'pplGrid'
        mmHeight = 3175
        mmLeft = 93927
        mmTop = 0
        mmWidth = 17198
        BandType = 4
      end
      object ppDBText5: TppDBText
        UserName = 'DBText5'
        DataField = 'VLRALUGUEL'
        DataPipeline = pplGrid
        DisplayFormat = '#,##0.00'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = []
        TextAlignment = taRightJustified
        Transparent = True
        DataPipelineName = 'pplGrid'
        mmHeight = 3175
        mmLeft = 136261
        mmTop = 0
        mmWidth = 16933
        BandType = 4
      end
      object ppDBText6: TppDBText
        UserName = 'DBText6'
        DataField = 'VLRRENDALUGAPLIC'
        DataPipeline = pplGrid
        DisplayFormat = '#,##0.00'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = []
        TextAlignment = taRightJustified
        Transparent = True
        DataPipelineName = 'pplGrid'
        mmHeight = 3175
        mmLeft = 157427
        mmTop = 0
        mmWidth = 16933
        BandType = 4
      end
      object ppDBText7: TppDBText
        UserName = 'DBText7'
        DataField = 'VLRRENDALUGACUM'
        DataPipeline = pplGrid
        DisplayFormat = '#,##0.00'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = []
        TextAlignment = taRightJustified
        Transparent = True
        DataPipelineName = 'pplGrid'
        mmHeight = 3175
        mmLeft = 180182
        mmTop = 0
        mmWidth = 16933
        BandType = 4
      end
      object ppDBText8: TppDBText
        UserName = 'DBText8'
        DataField = 'VLRRECEBTO'
        DataPipeline = pplGrid
        DisplayFormat = '#,##0.00'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = []
        TextAlignment = taRightJustified
        Transparent = True
        DataPipelineName = 'pplGrid'
        mmHeight = 3175
        mmLeft = 30427
        mmTop = 0
        mmWidth = 16933
        BandType = 4
      end
      object ppDBText9: TppDBText
        UserName = 'DBText9'
        DataField = 'VLRRENDRECEBTO'
        DataPipeline = pplGrid
        DisplayFormat = '#,##0.00'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = []
        TextAlignment = taRightJustified
        Transparent = True
        DataPipelineName = 'pplGrid'
        mmHeight = 3175
        mmLeft = 51594
        mmTop = 0
        mmWidth = 16933
        BandType = 4
      end
      object ppDBText10: TppDBText
        UserName = 'DBText10'
        DataField = 'VLRRECEBTOACUM'
        DataPipeline = pplGrid
        DisplayFormat = '#,##0.00'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = []
        TextAlignment = taRightJustified
        Transparent = True
        DataPipelineName = 'pplGrid'
        mmHeight = 3175
        mmLeft = 72761
        mmTop = 0
        mmWidth = 16933
        BandType = 4
      end
    end
    object FooterBand1: TppFooterBand
      mmBottomOffset = 0
      mmHeight = 13229
      mmPrintPosition = 0
      object Line2: TppLine
        UserName = 'Line2'
        ParentWidth = True
        Weight = 0.75
        mmHeight = 1588
        mmLeft = 0
        mmTop = 1852
        mmWidth = 197300
        BandType = 8
      end
      object LblSistema: TppLabel
        UserName = 'LblSistema'
        AutoSize = False
        Caption = 'Nome do Sistema'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = [fsBold]
        Transparent = True
        mmHeight = 3704
        mmLeft = 265
        mmTop = 3175
        mmWidth = 197909
        BandType = 8
      end
      object Calc2: TppSystemVariable
        UserName = 'Calc2'
        VarType = vtPageSetDesc
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = [fsBold]
        TextAlignment = taCentered
        Transparent = True
        mmHeight = 3704
        mmLeft = 265
        mmTop = 3175
        mmWidth = 197380
        BandType = 8
      end
      object Calc1: TppSystemVariable
        UserName = 'Calc1'
        VarType = vtDateTime
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = [fsBold]
        TextAlignment = taRightJustified
        Transparent = True
        mmHeight = 3704
        mmLeft = 171450
        mmTop = 3175
        mmWidth = 26194
        BandType = 8
      end
    end
    object ppSummaryBand1: TppSummaryBand
      mmBottomOffset = 0
      mmHeight = 29104
      mmPrintPosition = 0
      object ppRegion1: TppRegion
        UserName = 'Region1'
        Brush.Style = bsClear
        Transparent = True
        mmHeight = 22754
        mmLeft = 109538
        mmTop = 6350
        mmWidth = 83873
        BandType = 7
        mmBottomOffset = 0
        mmOverFlowOffset = 0
        mmStopPosition = 0
        object ppLabel15: TppLabel
          UserName = 'Label17'
          Caption = 'Aplicação do Aluguel'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 8
          Font.Style = [fsBold]
          Transparent = True
          mmHeight = 3704
          mmLeft = 111125
          mmTop = 17727
          mmWidth = 30163
          BandType = 7
        end
        object ppLabel14: TppLabel
          UserName = 'Label16'
          Caption = 'Aplicação do Valor Presente'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 8
          Font.Style = [fsBold]
          Transparent = True
          mmHeight = 3175
          mmLeft = 111125
          mmTop = 13229
          mmWidth = 38365
          BandType = 7
        end
        object ppLabel16: TppLabel
          UserName = 'Label18'
          Caption = 'Custo Oportunidade'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 8
          Font.Style = [fsBold]
          Transparent = True
          mmHeight = 3175
          mmLeft = 111125
          mmTop = 22754
          mmWidth = 26723
          BandType = 7
        end
        object lblVlrPresente: TppLabel
          UserName = 'Label19'
          AutoSize = False
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 8
          Font.Style = [fsBold]
          TextAlignment = taRightJustified
          Transparent = True
          mmHeight = 3704
          mmLeft = 163248
          mmTop = 13229
          mmWidth = 26194
          BandType = 7
        end
        object lblVlrAluguel: TppLabel
          UserName = 'Label20'
          AutoSize = False
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 8
          Font.Style = [fsBold]
          TextAlignment = taRightJustified
          Transparent = True
          mmHeight = 3704
          mmLeft = 163248
          mmTop = 17727
          mmWidth = 26194
          BandType = 7
        end
        object lblVlrDif: TppLabel
          UserName = 'Label201'
          AutoSize = False
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 8
          Font.Style = [fsBold]
          TextAlignment = taRightJustified
          Transparent = True
          mmHeight = 3704
          mmLeft = 163248
          mmTop = 22754
          mmWidth = 26194
          BandType = 7
        end
        object ppLabel17: TppLabel
          UserName = 'Label24'
          Caption = 'Aplicação do Fluxo de Recebimento'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 8
          Font.Style = [fsBold]
          Transparent = True
          mmHeight = 3175
          mmLeft = 111125
          mmTop = 8202
          mmWidth = 48683
          BandType = 7
        end
        object lblVlrReceb: TppLabel
          UserName = 'Label25'
          AutoSize = False
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 8
          Font.Style = [fsBold]
          TextAlignment = taRightJustified
          Transparent = True
          mmHeight = 3704
          mmLeft = 163248
          mmTop = 8467
          mmWidth = 26194
          BandType = 7
        end
      end
      object ppRegion2: TppRegion
        UserName = 'Region2'
        Brush.Style = bsClear
        Transparent = True
        mmHeight = 22753
        mmLeft = 2910
        mmTop = 6350
        mmWidth = 83873
        BandType = 7
        mmBottomOffset = 0
        mmOverFlowOffset = 0
        mmStopPosition = 0
        object lblAlug: TppLabel
          UserName = 'Label21'
          Caption = 'Aluguel / %'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 8
          Font.Style = [fsBold]
          Transparent = True
          mmHeight = 3704
          mmLeft = 4763
          mmTop = 14817
          mmWidth = 15875
          BandType = 7
        end
        object lblAval: TppLabel
          UserName = 'Label22'
          Caption = 'Avaliação + %'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 8
          Font.Style = [fsBold]
          Transparent = True
          mmHeight = 3704
          mmLeft = 4763
          mmTop = 7938
          mmWidth = 19050
          BandType = 7
        end
        object lblPres: TppLabel
          UserName = 'Label23'
          Caption = 'Valor Presente'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 8
          Font.Style = [fsBold]
          Transparent = True
          mmHeight = 3704
          mmLeft = 4763
          mmTop = 21696
          mmWidth = 21960
          BandType = 7
        end
        object lblVlrAval: TppLabel
          UserName = 'Label202'
          AutoSize = False
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 8
          Font.Style = [fsBold]
          TextAlignment = taRightJustified
          Transparent = True
          mmHeight = 3704
          mmLeft = 54768
          mmTop = 7938
          mmWidth = 26194
          BandType = 7
        end
        object lblVlrAlug: TppLabel
          UserName = 'Label203'
          AutoSize = False
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 8
          Font.Style = [fsBold]
          TextAlignment = taRightJustified
          Transparent = True
          mmHeight = 3704
          mmLeft = 54769
          mmTop = 14817
          mmWidth = 26194
          BandType = 7
        end
        object lblVlrPres: TppLabel
          UserName = 'lblVlrPres'
          AutoSize = False
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 8
          Font.Style = [fsBold]
          TextAlignment = taRightJustified
          Transparent = True
          mmHeight = 3704
          mmLeft = 55033
          mmTop = 21696
          mmWidth = 26194
          BandType = 7
        end
      end
    end
  end
  object qryCondPag: TwwQuery
    CachedUpdates = True
    DatabaseName = 'BaseDados'
    SQL.Strings = (
      'SELECT'
      '     CPI.IDCONTRATOIMOVEL,'
      '     CPI.IDCONDPAGIMOVEL,'
      '     CPI.INDCORRECAO,'
      '     CPI.IDINDCORRPROJ,'
      '     CPI.VLRFINANC,'
      '     CPI.FLGREAJMENSAL,'
      '     CPI.DATAVENCIMENTO,'
      '     CPI.PRAZO,'
      '     CPI.PERIODO,'
      '     CPI.TAXAJUROS,'
      '     CPI.PERIODOTAXA,'
      '     CPI.NUMPARCELAS,'
      '     CPI.TIPOCONDPAG,'
      '     M.FLGPERCVALOR'
      'FROM'
      '     CONDPAGIMOVEL CPI,'
      '     MOEDA M'
      'WHERE (M.MOECODIGO(+) = CPI.INDCORRECAO)    '
      '      AND (CPI.IDCONTRATOIMOVEL = :IDCONTRATOIMOVEL)'
      ''
      ' ')
    ValidateWithMask = True
    Left = 541
    Top = 228
    ParamData = <
      item
        DataType = ftInteger
        Name = 'IDCONTRATOIMOVEL'
        ParamType = ptUnknown
      end>
    object qryCondPagIDCONTRATOIMOVEL: TFloatField
      FieldName = 'IDCONTRATOIMOVEL'
    end
    object qryCondPagIDCONDPAGIMOVEL: TFloatField
      FieldName = 'IDCONDPAGIMOVEL'
    end
    object qryCondPagINDCORRECAO: TFloatField
      FieldName = 'INDCORRECAO'
    end
    object qryCondPagVLRFINANC: TFloatField
      FieldName = 'VLRFINANC'
    end
    object qryCondPagPRAZO: TStringField
      FieldName = 'PRAZO'
      FixedChar = True
      Size = 1
    end
    object qryCondPagPERIODO: TFloatField
      FieldName = 'PERIODO'
    end
    object qryCondPagTAXAJUROS: TFloatField
      FieldName = 'TAXAJUROS'
    end
    object qryCondPagPERIODOTAXA: TStringField
      FieldName = 'PERIODOTAXA'
      FixedChar = True
      Size = 1
    end
    object qryCondPagNUMPARCELAS: TFloatField
      FieldName = 'NUMPARCELAS'
    end
    object qryCondPagFLGPERCVALOR: TStringField
      FieldName = 'FLGPERCVALOR'
      FixedChar = True
      Size = 1
    end
    object qryCondPagFLGREAJMENSAL: TStringField
      FieldName = 'FLGREAJMENSAL'
      FixedChar = True
      Size = 1
    end
    object qryCondPagIDINDCORRPROJ: TFloatField
      FieldName = 'IDINDCORRPROJ'
    end
    object qryCondPagDATAVENCIMENTO: TDateTimeField
      FieldName = 'DATAVENCIMENTO'
    end
    object qryCondPagTIPOCONDPAG: TStringField
      FieldName = 'TIPOCONDPAG'
      FixedChar = True
      Size = 1
    end
  end
end
