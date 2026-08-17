inherited frmRelHistCarteira: TfrmRelHistCarteira
  Left = -9
  Top = 112
  BorderStyle = bsSingle
  Caption = 
    'Histórico de Movimentações por Investimento por Carteira de Inve' +
    'stimentos'
  ClientHeight = 376
  ClientWidth = 788
  WindowState = wsMaximized
  PixelsPerInch = 96
  TextHeight = 13
  inherited pnlFundo: TPanel
    Width = 788
    Height = 343
    BevelOuter = bvNone
    object Panel1: TPanel
      Left = 0
      Top = 0
      Width = 788
      Height = 108
      Align = alTop
      TabOrder = 0
      object Label1: TLabel
        Left = 16
        Top = 56
        Width = 145
        Height = 13
        Caption = 'Carteira de Investimentos'
      end
      object Label5: TLabel
        Left = 16
        Top = 8
        Width = 38
        Height = 13
        Caption = 'Imóvel'
      end
      object DBcboCarteira: TwwDBLookupCombo
        Left = 16
        Top = 72
        Width = 361
        Height = 21
        DropDownAlignment = taLeftJustify
        Selected.Strings = (
          'DESCCARTINVEST'#9'40'#9'Carteira de Investimentos ')
        LookupTable = qryLookCarteira
        LookupField = 'IDCARTEIRAINVEST'
        Options = [loColLines, loRowLines]
        Style = csDropDownList
        DropDownWidth = 8
        TabOrder = 0
        AutoDropDown = True
        ShowButton = True
        AllowClearKey = False
        OnCloseUp = DBcboCarteiraCloseUp
      end
      object btnAcendente: TfcShapeBtn
        Left = 416
        Top = 56
        Width = 177
        Height = 37
        Caption = 'Ordem ascendente '#13#10'de datas'
        Color = clBtnFace
        DitherColor = clWhite
        Glyph.Data = {
          76060000424D7606000000000000760000002800000060000000200000000100
          0400000000000006000000000000000000001000000010000000000000000000
          8000008000000080800080000000800080008080000080808000C0C0C0000000
          FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00888888888888
          8888888888888888888888888888888888888888888888888888888888888888
          8888888888888888888888888888888888888888888888888888888888888888
          8888888888888888888888888888888888888888888888888888888888888888
          88888888888888888888888888888888FFFFFFFFFFF888888888888888888888
          8888888888888888888888888888888000000000008888888888888888888887
          77777777778F8888888888888888888888888888888888888888888888888804
          4444444444088888888888888888887F88888888887F88888888888888888800
          0000000008888888888888888888880FCCCCCCCCC4088888888888888888887F
          88888888887F888888888888888880444444444440888888888888888888880F
          CCCCCCCCC4088888888888888888887F88888888887F888888888888888880FC
          CCCCCCCC40888888888888888888880FCCCCCCCCC4088888888888888888887F
          88888888887F888888888888888880FCCCCCCCCC40888888888888888888880F
          CCCCCCCCC4088888888888888888887F88888888887F888888888888888880FC
          CCCCCCCC40888888888888888888880FCCCCCCCCC4088888888888888888887F
          88888888887F888888888888888880FCCCCCCCCC40888888888888888888880F
          CCCCCCCCC4088888888888888888887F88888888887F888888888888888880FC
          CCCCCCCC40888888888888888888880FCCCCCCCCC4088888888888888888887F
          88888888887F888888888888888880FCCCCCCCCC40888888888888888888880F
          CCCCCCCCC4088888888888888888887F88888888887F888888888888888880FC
          CCCCCCCC40888888888888888888880FCCCCCCCCC4088888888888888888887F
          88888888887F888888888888888880FCCCCCCCCC40888888888888888888880F
          CCCCCCCCC40888888888888FFFFFFF7F88888888887FFFFFFFF88888888880FC
          CCCCCCCC40888888888888000000000FCCCCCCCCC40000000088887777777778
          888888888877777777F88888888880FCCCCCCCCC408888888888880444444444
          CCCCCCCCC444444440888878F8888888888888888888888887888000000000FC
          CCCCCCCC4000000008888880FCCCCCCCCCCCCCCCCCCCCC44088888878F888888
          8888888888888888788880444444444CCCCCCCCC44444444088888880FCCCCCC
          CCCCCCCCCCCCC4408888888878F8888888888888888888878888880FCCCCCCCC
          CCCCCCCCCCCCC4408888888880FCCCCCCCCCCCCCCCCC440888888888878F8888
          888888888888887888888880FCCCCCCCCCCCCCCCCCCC440888888888880FCCCC
          CCCCCCCCCCC44088888888888878F8888888888888888788888888880FCCCCCC
          CCCCCCCCCCC44088888888888880FCCCCCCCCCCCCC4408888888888888878F88
          88888888888878888888888880FCCCCCCCCCCCCCCC4408888888888888880FCC
          CCCCCCCCC440888888888888888878F8888888888887888888888888880FCCCC
          CCCCCCCCC440888888888888888880FCCCCCCCCC44088888888888888888878F
          8888888888788888888888888880FCCCCCCCCCCC44088888888888888888880F
          CCCCCCC4408888888888888888888878F8888888878888888888888888880FCC
          CCCCCCC4408888888888888888888880FCCCCC44088888888888888888888887
          8F8888887888888888888888888880FCCCCCCC44088888888888888888888888
          0FCCC44088888888888888888888888878F8888788888888888888888888880F
          CCCCC44088888888888888888888888880FC4408888888888888888888888888
          878F8878888888888888888888888880FCCC4408888888888888888888888888
          880F40888888888888888888888888888878F788888888888888888888888888
          0FC4408888888888888888888888888888800888888888888888888888888888
          8887788888888888888888888888888880F40888888888888888888888888888
          8888888888888888888888888888888888888888888888888888888888888888
          8800888888888888888888888888888888888888888888888888888888888888
          8888888888888888888888888888888888888888888888888888}
        GroupIndex = 1
        Margin = 6
        NumGlyphs = 3
        ParentClipping = True
        RoundRectBias = 25
        ShadeColors.Btn3DLight = 14671839
        ShadeColors.BtnHighlight = 15724527
        ShadeColors.BtnShadow = 6316128
        ShadeColors.BtnBlack = 3158064
        ShadeStyle = fbsHighlight
        Spacing = 6
        TabOrder = 1
        TextOptions.Alignment = taLeftJustify
        TextOptions.LineSpacing = 2
        TextOptions.OutlineColor = clNone
        TextOptions.VAlignment = vaVCenter
        TextOptions.WordWrap = True
        OnClick = btnAcendenteClick
      end
      object btnDescendente: TfcShapeBtn
        Left = 592
        Top = 56
        Width = 177
        Height = 37
        Caption = 'Ordem descendente'#13#10'de datas'
        Color = clBtnFace
        DitherColor = clWhite
        Down = True
        Glyph.Data = {
          76060000424D7606000000000000760000002800000060000000200000000100
          0400000000000006000000000000000000001000000010000000000000000000
          8000008000000080800080000000800080008080000080808000C0C0C0000000
          FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00888888888888
          8888888888888888888888888888888888888888888888888888888888888888
          8888888888888888888888888888888888888888888888888888888888888888
          8888888888888888888888888888888888888888888888888888888888888888
          888888888888888888888888888888888888FF88888888888888888888888888
          8888888888888888888888888888888888800888888888888888888888888888
          888778F888888888888888888888888888888888888888888888888888888888
          880110888888888888888888888888888878878F888888888888888888888888
          8800888888888888888888888888888880111108888888888888888888888888
          87888878F8888888888888888888888880110888888888888888888888888888
          01999110888888888888888888888888788888878F8888888888888888888888
          0111108888888888888888888888888019999911088888888888888888888887
          8888888878F88888888888888888888019991108888888888888888888888801
          9999999110888888888888888888887888888888878F88888888888888888801
          9999911088888888888888888888801999999999110888888888888888888788
          888888888878F888888888888888801999999911088888888888888888880199
          999999999110888888888888888878888888888888878F888888888888880199
          9999999110888888888888888880199999999999991108888888888888878888
          88888888888878F8888888888880199999999999110888888888888888019999
          99999999999110888888888888788888888888888888878F8888888888019999
          9999999991108888888888888019999999999999999911088888888887888888
          8888888888888878F88888888019999999999999991108888888888801999999
          9999999999999110888888887888888888888888888888878F88888801999999
          9999999999911088888888801999999999999999999999110888888788888888
          888888888888888878F888801999999999999999999911088888880FFFFFFFF9
          99999999911111111088887FFFFFFFFF88888888888FFFFFF7F8880199999999
          9999999999999110888888000000000F9999999991000000008888777777777F
          8888888888777777778880FFFFFFFF999999999911111111088888888888880F
          9999999991088888888888888888887F88888888887F888888888000000000F9
          9999999910000000088888888888880F9999999991088888888888888888887F
          88888888887F888888888888888880F99999999910888888888888888888880F
          9999999991088888888888888888887F88888888887F888888888888888880F9
          9999999910888888888888888888880F9999999991088888888888888888887F
          88888888887F888888888888888880F99999999910888888888888888888880F
          9999999991088888888888888888887F88888888887F888888888888888880F9
          9999999910888888888888888888880F9999999991088888888888888888887F
          88888888887F888888888888888880F99999999910888888888888888888880F
          9999999991088888888888888888887F88888888887F888888888888888880F9
          9999999910888888888888888888880F9999999991088888888888888888887F
          88888888887F888888888888888880F99999999910888888888888888888880F
          9999999991088888888888888888887F88888888887F888888888888888880F9
          9999999910888888888888888888880F9999999991088888888888888888887F
          88888888887F888888888888888880F99999999910888888888888888888880F
          FFFFFFFFF10888888888888888888878FFFFFFFFFF78888888888888888880F9
          9999999910888888888888888888888000000000008888888888888888888887
          777777777788888888888888888880FFFFFFFFFF108888888888888888888888
          8888888888888888888888888888888888888888888888888888888888888800
          0000000008888888888888888888888888888888888888888888888888888888
          8888888888888888888888888888888888888888888888888888}
        GroupIndex = 1
        Margin = 6
        NumGlyphs = 3
        ParentClipping = True
        RoundRectBias = 25
        ShadeColors.Btn3DLight = 14671839
        ShadeColors.BtnHighlight = 15724527
        ShadeColors.BtnShadow = 6316128
        ShadeColors.BtnBlack = 3158064
        ShadeStyle = fbsHighlight
        Spacing = 6
        TabOrder = 2
        TextOptions.Alignment = taLeftJustify
        TextOptions.LineSpacing = 2
        TextOptions.OutlineColor = clNone
        TextOptions.VAlignment = vaVCenter
        TextOptions.WordWrap = True
        OnClick = btnDescendenteClick
      end
      object btnBuscaImovel: TBitBtn
        Left = 721
        Top = 23
        Width = 24
        Height = 22
        TabOrder = 3
        OnClick = btnBuscaImovelClick
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
      object edtMestre: TEdit
        Left = 16
        Top = 24
        Width = 289
        Height = 21
        Enabled = False
        ReadOnly = True
        TabOrder = 4
      end
      object edtImovel: TEdit
        Left = 304
        Top = 24
        Width = 417
        Height = 21
        Enabled = False
        ReadOnly = True
        TabOrder = 5
      end
      object btnLimpaContrato: TBitBtn
        Left = 745
        Top = 23
        Width = 23
        Height = 22
        Hint = 'Limpa Contrato selecionado'
        TabOrder = 6
        OnClick = btnLimpaContratoClick
        Glyph.Data = {
          76010000424D7601000000000000760000002800000020000000100000000100
          0400000000000001000000000000000000001000000010000000000000000000
          8000008000000080800080000000800080008080000080808000C0C0C0000000
          FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00888888888888
          888888888888FF8888888888888778888888888888F77F8888888888800F0888
          88888888F7787F88888888800FFF0888888888F7788878F88888800FFF8FF088
          888887788888F7F8888887FF888FF088888887F88888878F888887FF8888FF08
          8888878F88888F7F8888887F88888F088888887F88888878F888887FF8800FF0
          88888878F88778F78F888887FF0910FF08888887F87F878878F88887FF09910F
          F08888878F7F8878F78888887FF090307888888878F7F7F77F88888887FF0BB3
          08888888878F7F8878F88888887770BB30888888887777F8878F88888888880B
          B30888888888887F887888888888888888888888888888888888}
        NumGlyphs = 2
      end
    end
    object Panel2: TPanel
      Left = 0
      Top = 108
      Width = 788
      Height = 235
      Align = alClient
      TabOrder = 1
      object Panel3: TPanel
        Left = 772
        Top = 13
        Width = 15
        Height = 209
        Align = alRight
        BevelOuter = bvNone
        TabOrder = 0
      end
      object Panel4: TPanel
        Left = 1
        Top = 13
        Width = 15
        Height = 209
        Align = alLeft
        BevelOuter = bvNone
        TabOrder = 1
      end
      object Panel5: TPanel
        Left = 1
        Top = 222
        Width = 786
        Height = 12
        Align = alBottom
        BevelOuter = bvNone
        TabOrder = 2
      end
      object Panel6: TPanel
        Left = 1
        Top = 1
        Width = 786
        Height = 12
        Align = alTop
        BevelOuter = bvNone
        TabOrder = 3
      end
      object DBgrdHistorico: TDBGrid
        Left = 16
        Top = 13
        Width = 756
        Height = 209
        Align = alClient
        DataSource = dsHist
        Options = [dgTitles, dgColumnResize, dgColLines, dgRowLines, dgRowSelect, dgConfirmDelete, dgCancelOnExit]
        TabOrder = 4
        TitleFont.Charset = DEFAULT_CHARSET
        TitleFont.Color = clWindowText
        TitleFont.Height = -9
        TitleFont.Name = 'MS Sans Serif'
        TitleFont.Style = [fsBold]
      end
    end
  end
  inherited Dock971: TDock97
    Top = 343
    Width = 788
    inherited tb97Fundo: TToolbar97
      Left = 421
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
  object dsHist: TwwDataSource
    AutoEdit = False
    Left = 472
    Top = 168
  end
  object qryHistCarteiraDesc: TwwQuery
    DatabaseName = 'BaseDados'
    SQL.Strings = (
      'SELECT'
      '   HC.IDCARTEIRAINVEST, HC.DATAMOVCARTINV,'
      '   HC.VLRMOVCARTINV, HC.COTASMOVCARTINV,'
      '   HC.SALDOVLRCARTINV, HC.SALDOCOTASCARTINV,'
      '   HC.IDINVESTIMENTO, HC.IDTIPOOPERACAO,'
      '   HC.HISTMOVCARTINV, HC.TIPMOVCARTINV,'
      '   HC.QTDEMOVINVCART, HC.SALDOQTDEINVCART,'
      '   HC.SALDOVLRINVCART                         '
      'FROM'
      '   HISTCARTINV HC'
      'WHERE'
      '   HC.IDCARTEIRAINVEST = :CARTEIRA'
      'ORDER BY'
      '   HC.DATAMOVCARTINV DESC, IDHISTCARTINV DESC')
    ValidateWithMask = True
    Left = 376
    Top = 192
    ParamData = <
      item
        DataType = ftInteger
        Name = 'CARTEIRA'
        ParamType = ptUnknown
        Value = 1
      end>
    object qryHistCarteiraDescDATAMOVCARTINV: TDateTimeField
      Alignment = taCenter
      DisplayLabel = 'Data'
      DisplayWidth = 10
      FieldName = 'DATAMOVCARTINV'
      Origin = 'HISTCARTINV.DATAMOVCARTINV'
    end
    object qryHistCarteiraDescHISTMOVCARTINV: TStringField
      DisplayLabel = 'Histórico'
      DisplayWidth = 20
      FieldName = 'HISTMOVCARTINV'
      Origin = 'HISTCARTINV.HISTMOVCARTINV'
      Size = 60
    end
    object qryHistCarteiraDescVLRMOVCARTINV: TFloatField
      DisplayLabel = 'Valor Movimentado'
      DisplayWidth = 17
      FieldName = 'VLRMOVCARTINV'
      Origin = 'HISTCARTINV.VLRMOVCARTINV'
      DisplayFormat = '###,###,###,##0.00;(###,###,###,##0.00)'
      EditFormat = '###,###,###,##0.00;(###,###,###,##0.00)'
    end
    object qryHistCarteiraDescCOTASMOVCARTINV: TFloatField
      DisplayLabel = 'Cotas Movimentadas'
      DisplayWidth = 18
      FieldName = 'COTASMOVCARTINV'
      Origin = 'HISTCARTINV.COTASMOVCARTINV'
      DisplayFormat = '###,###,###,##0.000000;(###,###,###,##0.000000)'
      EditFormat = '###,###,###,##0.000000;(###,###,###,##0.000000)'
    end
    object qryHistCarteiraDescSALDOVLRINVCART: TFloatField
      DisplayLabel = 'Saldo Investimento'
      DisplayWidth = 17
      FieldName = 'SALDOVLRINVCART'
      Origin = 'HISTCARTINV.SALDOVLRINVCART'
      Visible = False
    end
    object qryHistCarteiraDescSALDOVLRCARTINV: TFloatField
      DisplayLabel = 'Saldo Carteira'
      DisplayWidth = 17
      FieldName = 'SALDOVLRCARTINV'
      Origin = 'HISTCARTINV.SALDOVLRCARTINV'
      DisplayFormat = '###,###,###,##0.00;(###,###,###,##0.00)'
      EditFormat = '###,###,###,##0.00;(###,###,###,##0.00)'
    end
    object qryHistCarteiraDescSALDOCOTASCARTINV: TFloatField
      DisplayLabel = 'Saldo (em Cotas)'
      DisplayWidth = 18
      FieldName = 'SALDOCOTASCARTINV'
      Origin = 'HISTCARTINV.SALDOCOTASCARTINV'
      DisplayFormat = '###,###,###,##0.000000;(###,###,###,##0.000000)'
      EditFormat = '###,###,###,##0.000000;(###,###,###,##0.000000)'
    end
    object qryHistCarteiraDescIDINVESTIMENTO: TFloatField
      DisplayWidth = 10
      FieldName = 'IDINVESTIMENTO'
      Origin = 'HISTCARTINV.IDINVESTIMENTO'
      Visible = False
    end
    object qryHistCarteiraDescIDCARTEIRAINVEST: TFloatField
      FieldName = 'IDCARTEIRAINVEST'
      Origin = 'HISTCARTINV.IDCARTEIRAINVEST'
      Visible = False
    end
    object qryHistCarteiraDescIDTIPOOPERACAO: TFloatField
      DisplayWidth = 10
      FieldName = 'IDTIPOOPERACAO'
      Origin = 'HISTCARTINV.IDTIPOOPERACAO'
      Visible = False
    end
    object qryHistCarteiraDescTIPMOVCARTINV: TStringField
      DisplayWidth = 3
      FieldName = 'TIPMOVCARTINV'
      Origin = 'HISTCARTINV.TIPMOVCARTINV'
      Visible = False
      Size = 3
    end
    object qryHistCarteiraDescQTDEMOVINVCART: TFloatField
      FieldName = 'QTDEMOVINVCART'
      Origin = 'HISTCARTINV.QTDEMOVINVCART'
      Visible = False
    end
    object qryHistCarteiraDescSALDOQTDEINVCART: TFloatField
      FieldName = 'SALDOQTDEINVCART'
      Origin = 'HISTCARTINV.SALDOQTDEINVCART'
      Visible = False
    end
  end
  object qryLookCarteira: TwwQuery
    DatabaseName = 'BaseDados'
    SQL.Strings = (
      'SELECT  '
      '   IDCARTEIRAINVEST, DESCCARTINVEST'
      'FROM '
      '   CARTEIRAINVEST  '
      'ORDER BY '
      '   DESCCARTINVEST')
    ValidateWithMask = True
    Left = 328
    Top = 68
    object qryLookCarteiraIDCARTEIRAINVEST: TFloatField
      FieldName = 'IDCARTEIRAINVEST'
      Origin = 'CARTEIRAINVEST.IDCARTEIRAINVEST'
    end
    object qryLookCarteiraDESCCARTINVEST: TStringField
      FieldName = 'DESCCARTINVEST'
      Origin = 'CARTEIRAINVEST.DESCCARTINVEST'
      Size = 60
    end
  end
  object qryHistInvestDesc: TwwQuery
    DatabaseName = 'BaseDados'
    SQL.Strings = (
      'SELECT'
      '   HC.IDCARTEIRAINVEST, HC.DATAMOVCARTINV,'
      '   HC.VLRMOVCARTINV, HC.COTASMOVCARTINV,'
      '   HC.SALDOVLRCARTINV, HC.SALDOCOTASCARTINV,'
      '   HC.IDINVESTIMENTO, HC.IDTIPOOPERACAO,'
      '   HC.HISTMOVCARTINV, HC.TIPMOVCARTINV,'
      '   HC.QTDEMOVINVCART, HC.SALDOQTDEINVCART,'
      '   HC.SALDOVLRINVCART                         '
      'FROM'
      '   HISTCARTINV HC'
      'WHERE'
      '   HC.IDCARTEIRAINVEST =:CARTEIRA AND'
      '   HC.IDINVESTIMENTO =:INVEST'
      'ORDER BY'
      '   HC.DATAMOVCARTINV DESC, IDHISTCARTINV DESC')
    ValidateWithMask = True
    Left = 272
    Top = 192
    ParamData = <
      item
        DataType = ftInteger
        Name = 'CARTEIRA'
        ParamType = ptUnknown
        Value = 1
      end
      item
        DataType = ftInteger
        Name = 'INVEST'
        ParamType = ptUnknown
        Value = 49
      end>
    object DateTimeField3: TDateTimeField
      Alignment = taCenter
      DisplayLabel = 'Data'
      DisplayWidth = 10
      FieldName = 'DATAMOVCARTINV'
      Origin = 'HISTCARTINV.DATAMOVCARTINV'
    end
    object StringField6: TStringField
      DisplayLabel = 'Histórico'
      DisplayWidth = 21
      FieldName = 'HISTMOVCARTINV'
      Origin = 'HISTCARTINV.HISTMOVCARTINV'
      Size = 60
    end
    object FloatField19: TFloatField
      DisplayLabel = 'Valor Movimentado'
      DisplayWidth = 17
      FieldName = 'VLRMOVCARTINV'
      Origin = 'HISTCARTINV.VLRMOVCARTINV'
      DisplayFormat = '###,###,###,##0.00;(###,###,###,##0.00)'
      EditFormat = '###,###,###,##0.00;(###,###,###,##0.00)'
    end
    object FloatField20: TFloatField
      DisplayLabel = 'Cotas Movimentadas'
      DisplayWidth = 18
      FieldName = 'COTASMOVCARTINV'
      Origin = 'HISTCARTINV.COTASMOVCARTINV'
      DisplayFormat = '###,###,###,##0.000000;(###,###,###,##0.000000)'
      EditFormat = '###,###,###,##0.000000;(###,###,###,##0.000000)'
    end
    object FloatField22: TFloatField
      DisplayLabel = 'Saldo (em Cotas)'
      DisplayWidth = 18
      FieldName = 'SALDOCOTASCARTINV'
      Origin = 'HISTCARTINV.SALDOCOTASCARTINV'
      Visible = False
      DisplayFormat = '###,###,###,##0.000000;(###,###,###,##0.000000)'
      EditFormat = '###,###,###,##0.000000;(###,###,###,##0.000000)'
    end
    object FloatField28: TFloatField
      DisplayLabel = 'Saldo Investimento'
      DisplayWidth = 17
      FieldName = 'SALDOVLRINVCART'
      Origin = 'HISTCARTINV.SALDOVLRINVCART'
      DisplayFormat = '###,###,###,##0.00;(###,###,###,##0.00)'
      EditFormat = '###,###,###,##0.00;(###,###,###,##0.00)'
    end
    object FloatField21: TFloatField
      DisplayLabel = 'Saldo Carteira'
      DisplayWidth = 17
      FieldName = 'SALDOVLRCARTINV'
      Origin = 'HISTCARTINV.SALDOVLRCARTINV'
      DisplayFormat = '###,###,###,##0.00;(###,###,###,##0.00)'
      EditFormat = '###,###,###,##0.00;(###,###,###,##0.00)'
    end
    object FloatField26: TFloatField
      DisplayLabel = 'Qtde.Mov'
      DisplayWidth = 7
      FieldName = 'QTDEMOVINVCART'
      Origin = 'HISTCARTINV.QTDEMOVINVCART'
      Visible = False
      DisplayFormat = '###,###,###,##0.000000;(###,###,###,##0.000000)'
      EditFormat = '###,###,###,##0.000000;(###,###,###,##0.000000)'
    end
    object FloatField27: TFloatField
      DisplayLabel = 'Saldo (Qtde.)'
      DisplayWidth = 10
      FieldName = 'SALDOQTDEINVCART'
      Origin = 'HISTCARTINV.SALDOQTDEINVCART'
      Visible = False
      DisplayFormat = '###,###,###,##0.000000;(###,###,###,##0.000000)'
      EditFormat = '###,###,###,##0.000000;(###,###,###,##0.000000)'
    end
    object FloatField23: TFloatField
      FieldName = 'IDCARTEIRAINVEST'
      Origin = 'HISTCARTINV.IDCARTEIRAINVEST'
      Visible = False
    end
    object FloatField24: TFloatField
      DisplayWidth = 10
      FieldName = 'IDINVESTIMENTO'
      Origin = 'HISTCARTINV.IDINVESTIMENTO'
      Visible = False
    end
    object FloatField25: TFloatField
      DisplayWidth = 10
      FieldName = 'IDTIPOOPERACAO'
      Origin = 'HISTCARTINV.IDTIPOOPERACAO'
      Visible = False
    end
    object StringField7: TStringField
      DisplayWidth = 3
      FieldName = 'TIPMOVCARTINV'
      Origin = 'HISTCARTINV.TIPMOVCARTINV'
      Visible = False
      Size = 3
    end
  end
  object qryHistCarteiraAsc: TwwQuery
    DatabaseName = 'BaseDados'
    SQL.Strings = (
      'SELECT'
      '   HC.IDCARTEIRAINVEST, HC.DATAMOVCARTINV,'
      '   HC.VLRMOVCARTINV, HC.COTASMOVCARTINV,'
      '   HC.SALDOVLRCARTINV, HC.SALDOCOTASCARTINV,'
      '   HC.IDINVESTIMENTO, HC.IDTIPOOPERACAO,'
      '   HC.HISTMOVCARTINV, HC.TIPMOVCARTINV,'
      '   HC.QTDEMOVINVCART, HC.SALDOQTDEINVCART,'
      '   HC.SALDOVLRINVCART                         '
      'FROM'
      '   HISTCARTINV HC'
      'WHERE'
      '   HC.IDCARTEIRAINVEST = :CARTEIRA'
      'ORDER BY'
      '   HC.DATAMOVCARTINV, IDHISTCARTINV')
    ValidateWithMask = True
    Left = 376
    Top = 240
    ParamData = <
      item
        DataType = ftInteger
        Name = 'CARTEIRA'
        ParamType = ptUnknown
        Value = 1
      end>
    object DateTimeField1: TDateTimeField
      Alignment = taCenter
      DisplayLabel = 'Data'
      DisplayWidth = 10
      FieldName = 'DATAMOVCARTINV'
      Origin = 'HISTCARTINV.DATAMOVCARTINV'
    end
    object StringField1: TStringField
      DisplayLabel = 'Histórico'
      DisplayWidth = 20
      FieldName = 'HISTMOVCARTINV'
      Origin = 'HISTCARTINV.HISTMOVCARTINV'
      Size = 60
    end
    object FloatField1: TFloatField
      DisplayLabel = 'Valor Movimentado'
      DisplayWidth = 17
      FieldName = 'VLRMOVCARTINV'
      Origin = 'HISTCARTINV.VLRMOVCARTINV'
      DisplayFormat = '###,###,###,##0.00;(###,###,###,##0.00)'
      EditFormat = '###,###,###,##0.00;(###,###,###,##0.00)'
    end
    object FloatField2: TFloatField
      DisplayLabel = 'Cotas Movimentadas'
      DisplayWidth = 18
      FieldName = 'COTASMOVCARTINV'
      Origin = 'HISTCARTINV.COTASMOVCARTINV'
      DisplayFormat = '###,###,###,##0.000000;(###,###,###,##0.000000)'
      EditFormat = '###,###,###,##0.000000;(###,###,###,##0.000000)'
    end
    object FloatField3: TFloatField
      DisplayLabel = 'Saldo Investimento'
      DisplayWidth = 17
      FieldName = 'SALDOVLRINVCART'
      Origin = 'HISTCARTINV.SALDOVLRINVCART'
      Visible = False
    end
    object FloatField4: TFloatField
      DisplayLabel = 'Saldo Carteira'
      DisplayWidth = 17
      FieldName = 'SALDOVLRCARTINV'
      Origin = 'HISTCARTINV.SALDOVLRCARTINV'
      DisplayFormat = '###,###,###,##0.00;(###,###,###,##0.00)'
      EditFormat = '###,###,###,##0.00;(###,###,###,##0.00)'
    end
    object FloatField5: TFloatField
      DisplayLabel = 'Saldo (em Cotas)'
      DisplayWidth = 18
      FieldName = 'SALDOCOTASCARTINV'
      Origin = 'HISTCARTINV.SALDOCOTASCARTINV'
      DisplayFormat = '###,###,###,##0.000000;(###,###,###,##0.000000)'
      EditFormat = '###,###,###,##0.000000;(###,###,###,##0.000000)'
    end
    object FloatField6: TFloatField
      DisplayWidth = 10
      FieldName = 'IDINVESTIMENTO'
      Origin = 'HISTCARTINV.IDINVESTIMENTO'
      Visible = False
    end
    object FloatField7: TFloatField
      FieldName = 'IDCARTEIRAINVEST'
      Origin = 'HISTCARTINV.IDCARTEIRAINVEST'
      Visible = False
    end
    object FloatField8: TFloatField
      DisplayWidth = 10
      FieldName = 'IDTIPOOPERACAO'
      Origin = 'HISTCARTINV.IDTIPOOPERACAO'
      Visible = False
    end
    object StringField2: TStringField
      DisplayWidth = 3
      FieldName = 'TIPMOVCARTINV'
      Origin = 'HISTCARTINV.TIPMOVCARTINV'
      Visible = False
      Size = 3
    end
    object FloatField9: TFloatField
      FieldName = 'QTDEMOVINVCART'
      Origin = 'HISTCARTINV.QTDEMOVINVCART'
      Visible = False
    end
    object FloatField10: TFloatField
      FieldName = 'SALDOQTDEINVCART'
      Origin = 'HISTCARTINV.SALDOQTDEINVCART'
      Visible = False
    end
  end
  object qryHistInvestAsc: TwwQuery
    DatabaseName = 'BaseDados'
    SQL.Strings = (
      'SELECT'
      '   HC.IDCARTEIRAINVEST, HC.DATAMOVCARTINV,'
      '   HC.VLRMOVCARTINV, HC.COTASMOVCARTINV,'
      '   HC.SALDOVLRCARTINV, HC.SALDOCOTASCARTINV,'
      '   HC.IDINVESTIMENTO, HC.IDTIPOOPERACAO,'
      '   HC.HISTMOVCARTINV, HC.TIPMOVCARTINV,'
      '   HC.QTDEMOVINVCART, HC.SALDOQTDEINVCART,'
      '   HC.SALDOVLRINVCART                         '
      'FROM'
      '   HISTCARTINV HC'
      'WHERE'
      '   HC.IDCARTEIRAINVEST =:CARTEIRA AND'
      '   HC.IDINVESTIMENTO =:INVEST'
      'ORDER BY'
      '   HC.DATAMOVCARTINV, IDHISTCARTINV')
    ValidateWithMask = True
    Left = 272
    Top = 240
    ParamData = <
      item
        DataType = ftInteger
        Name = 'CARTEIRA'
        ParamType = ptUnknown
        Value = 1
      end
      item
        DataType = ftInteger
        Name = 'INVEST'
        ParamType = ptUnknown
        Value = 49
      end>
    object DateTimeField2: TDateTimeField
      Alignment = taCenter
      DisplayLabel = 'Data'
      DisplayWidth = 10
      FieldName = 'DATAMOVCARTINV'
      Origin = 'HISTCARTINV.DATAMOVCARTINV'
    end
    object StringField3: TStringField
      DisplayLabel = 'Histórico'
      DisplayWidth = 21
      FieldName = 'HISTMOVCARTINV'
      Origin = 'HISTCARTINV.HISTMOVCARTINV'
      Size = 60
    end
    object FloatField11: TFloatField
      DisplayLabel = 'Valor Movimentado'
      DisplayWidth = 17
      FieldName = 'VLRMOVCARTINV'
      Origin = 'HISTCARTINV.VLRMOVCARTINV'
      DisplayFormat = '###,###,###,##0.00;(###,###,###,##0.00)'
      EditFormat = '###,###,###,##0.00;(###,###,###,##0.00)'
    end
    object FloatField12: TFloatField
      DisplayLabel = 'Cotas Movimentadas'
      DisplayWidth = 18
      FieldName = 'COTASMOVCARTINV'
      Origin = 'HISTCARTINV.COTASMOVCARTINV'
      DisplayFormat = '###,###,###,##0.000000;(###,###,###,##0.000000)'
      EditFormat = '###,###,###,##0.000000;(###,###,###,##0.000000)'
    end
    object FloatField13: TFloatField
      DisplayLabel = 'Saldo (em Cotas)'
      DisplayWidth = 18
      FieldName = 'SALDOCOTASCARTINV'
      Origin = 'HISTCARTINV.SALDOCOTASCARTINV'
      Visible = False
      DisplayFormat = '###,###,###,##0.000000;(###,###,###,##0.000000)'
      EditFormat = '###,###,###,##0.000000;(###,###,###,##0.000000)'
    end
    object FloatField14: TFloatField
      DisplayLabel = 'Saldo Investimento'
      DisplayWidth = 17
      FieldName = 'SALDOVLRINVCART'
      Origin = 'HISTCARTINV.SALDOVLRINVCART'
      DisplayFormat = '###,###,###,##0.00;(###,###,###,##0.00)'
      EditFormat = '###,###,###,##0.00;(###,###,###,##0.00)'
    end
    object FloatField15: TFloatField
      DisplayLabel = 'Saldo Carteira'
      DisplayWidth = 17
      FieldName = 'SALDOVLRCARTINV'
      Origin = 'HISTCARTINV.SALDOVLRCARTINV'
      DisplayFormat = '###,###,###,##0.00;(###,###,###,##0.00)'
      EditFormat = '###,###,###,##0.00;(###,###,###,##0.00)'
    end
    object FloatField16: TFloatField
      DisplayLabel = 'Qtde.Mov'
      DisplayWidth = 7
      FieldName = 'QTDEMOVINVCART'
      Origin = 'HISTCARTINV.QTDEMOVINVCART'
      Visible = False
      DisplayFormat = '###,###,###,##0.000000;(###,###,###,##0.000000)'
      EditFormat = '###,###,###,##0.000000;(###,###,###,##0.000000)'
    end
    object FloatField17: TFloatField
      DisplayLabel = 'Saldo (Qtde.)'
      DisplayWidth = 10
      FieldName = 'SALDOQTDEINVCART'
      Origin = 'HISTCARTINV.SALDOQTDEINVCART'
      Visible = False
      DisplayFormat = '###,###,###,##0.000000;(###,###,###,##0.000000)'
      EditFormat = '###,###,###,##0.000000;(###,###,###,##0.000000)'
    end
    object FloatField18: TFloatField
      FieldName = 'IDCARTEIRAINVEST'
      Origin = 'HISTCARTINV.IDCARTEIRAINVEST'
      Visible = False
    end
    object FloatField29: TFloatField
      DisplayWidth = 10
      FieldName = 'IDINVESTIMENTO'
      Origin = 'HISTCARTINV.IDINVESTIMENTO'
      Visible = False
    end
    object FloatField30: TFloatField
      DisplayWidth = 10
      FieldName = 'IDTIPOOPERACAO'
      Origin = 'HISTCARTINV.IDTIPOOPERACAO'
      Visible = False
    end
    object StringField4: TStringField
      DisplayWidth = 3
      FieldName = 'TIPMOVCARTINV'
      Origin = 'HISTCARTINV.TIPMOVCARTINV'
      Visible = False
      Size = 3
    end
  end
end
