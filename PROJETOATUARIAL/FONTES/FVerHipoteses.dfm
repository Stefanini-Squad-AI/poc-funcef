inherited FrmVerHipoteses: TFrmVerHipoteses
  Left = 290
  Top = 223
  Caption = 'Hípoteses para recalculo'
  ClientHeight = 294
  ClientWidth = 476
  PixelsPerInch = 96
  TextHeight = 13
  inherited pnlFundo: TPanel
    Width = 476
    Height = 255
    object dbgHipoteses: TDBGrid
      Left = 1
      Top = 1
      Width = 474
      Height = 253
      Align = alClient
      DataSource = dsHipoteses
      Options = [dgEditing, dgTitles, dgColumnResize, dgColLines, dgRowLines, dgTabs, dgConfirmDelete, dgCancelOnExit]
      TabOrder = 0
      TitleFont.Charset = DEFAULT_CHARSET
      TitleFont.Color = clWindowText
      TitleFont.Height = -9
      TitleFont.Name = 'MS Sans Serif'
      TitleFont.Style = [fsBold]
      Columns = <
        item
          Expanded = False
          FieldName = 'DS_ITEM_HIPOTESE'
          ReadOnly = True
          Title.Caption = 'Items da hipotese'
          Width = 302
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'NO_VARIAVEL'
          ReadOnly = True
          Title.Caption = 'Variável'
          Width = 60
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'VL_HIPOTESE'
          Title.Caption = 'Valor'
          Width = 85
          Visible = True
        end>
    end
  end
  inherited Dock971: TDock97
    Top = 255
    Width = 476
    inherited tb97Fundo: TToolbar97
      Left = 304
      inherited bbtnAjuda: TmaHelpBitBtn
        Visible = False
      end
    end
    inherited TB97oKCancelar: TToolbar97
      Left = 135
      inherited bbtnConfirmar: TBitBtn
        OnClick = bbtnConfirmarClick
      end
      inherited bbtnCancelar: TBitBtn
        Visible = False
      end
    end
  end
  object wwQryHipoteses: TwwQuery
    DatabaseName = 'BaseDados'
    SQL.Strings = (
      'SELECT '
      '  HI.CD_HIPOTESE,'
      '  HI.DS_HIPOTESE,'
      '  HI.DT_GERACAO,'
      '  HI.IDREGRA,'
      '  '
      '  IT.CD_ITEM_HIPOTESE,'
      '  IT.DS_ITEM_HIPOTESE,'
      '  IT.NO_VARIAVEL,'
      '  '
      '  CH.VL_HIPOTESE,'
      '  CH.SQ_VERSAO_COMUTACAO_MAS,'
      '  CH.SQ_VERSAO_COMUTACAO_FEM,'
      '  CH.SQ_VERSAO_COMUTACAO_PEN'
      'FROM '
      '  FI_COMPOSICAO_HIPOTESE CH,'
      '  FI_HIPOTESE HI,'
      '  FI_ITEM_HIPOTESE IT'
      'WHERE'
      '  HI.CD_HIPOTESE = :CD_HIPOTESE AND '
      '  HI.CD_HIPOTESE = CH.CD_HIPOTESE AND'
      '  IT.CD_ITEM_HIPOTESE = CH.CD_ITEM_HIPOTESE  '
      'ORDER BY CD_HIPOTESE  ')
    ValidateWithMask = True
    Left = 56
    Top = 19
    ParamData = <
      item
        DataType = ftInteger
        Name = 'CD_HIPOTESE'
        ParamType = ptUnknown
      end>
  end
  object dsHipoteses: TDataSource
    DataSet = cdsHipotese
    Left = 85
    Top = 48
  end
  object cdsHipotese: TClientDataSet
    Aggregates = <>
    Params = <>
    BeforePost = cdsHipoteseBeforePost
    Left = 56
    Top = 48
  end
  object qryHipotese: TwwQuery
    CachedUpdates = True
    DatabaseName = 'BaseDados'
    SQL.Strings = (
      'INSERT INTO '
      '     FI_HIPOTESE '
      '          (CD_HIPOTESE, DS_HIPOTESE, DT_GERACAO, '
      '           NR_IDADE_MIN_TB_SERV, '
      '           NR_IDADE_MAX_TB_SERV, '
      '           IDREGRA) '
      'VALUES '
      '     (:CD_HIPOTESE,  :DS_HIPOTESE,  :DT_GERACAO, '
      '      :NR_IDADE_MIN_TB_SERV, :NR_IDADE_MAX_TB_SERV, '
      '      :IDREGRA)')
    ValidateWithMask = True
    Left = 57
    Top = 96
    ParamData = <
      item
        DataType = ftUnknown
        Name = 'CD_HIPOTESE'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'DS_HIPOTESE'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'DT_GERACAO'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'NR_IDADE_MIN_TB_SERV'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'NR_IDADE_MAX_TB_SERV'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'IDREGRA'
        ParamType = ptUnknown
      end>
    object qryHipoteseDS_HIPOTESE: TStringField
      DisplayLabel = 'Hipótese de Cálculo'
      DisplayWidth = 50
      FieldName = 'DS_HIPOTESE'
      Origin = 'FI_HIPOTESE.DS_HIPOTESE'
      Size = 50
    end
    object qryHipoteseDT_GERACAO: TDateTimeField
      DisplayLabel = 'Data de Geração'
      DisplayWidth = 10
      FieldName = 'DT_GERACAO'
      Origin = 'FI_HIPOTESE.DT_GERACAO'
    end
    object qryHipoteseCD_HIPOTESE: TFloatField
      DisplayWidth = 10
      FieldName = 'CD_HIPOTESE'
      Origin = 'FI_HIPOTESE.CD_HIPOTESE'
      Visible = False
    end
    object qryHipoteseNR_IDADE_MIN_TB_SERV: TFloatField
      DisplayWidth = 10
      FieldName = 'NR_IDADE_MIN_TB_SERV'
      Origin = 'FI_HIPOTESE.NR_IDADE_MIN_TB_SERV'
      Visible = False
    end
    object qryHipoteseNR_IDADE_MAX_TB_SERV: TFloatField
      DisplayWidth = 10
      FieldName = 'NR_IDADE_MAX_TB_SERV'
      Origin = 'FI_HIPOTESE.NR_IDADE_MAX_TB_SERV'
      Visible = False
    end
    object qryHipoteseIDREGRA: TFloatField
      FieldName = 'IDREGRA'
      Origin = 'BASEDADOS.FI_HIPOTESE.IDREGRA'
    end
  end
  object qryComposicao_Hipotese: TwwQuery
    CachedUpdates = True
    DatabaseName = 'BaseDados'
    SQL.Strings = (
      'INSERT INTO '
      '   FI_COMPOSICAO_HIPOTESE '
      '       (CD_HIPOTESE, CD_ITEM_HIPOTESE, '
      '        VL_HIPOTESE, IR_GERA_TAB_SERVICO, '
      '        SQ_VERSAO_COMUTACAO_MAS, '
      '        SQ_VERSAO_COMUTACAO_FEM, '
      '        SQ_VERSAO_COMUTACAO_PEN) '
      ''
      'VALUES '
      '      (:CD_HIPOTESE, :CD_ITEM_HIPOTESE, '
      '       :VL_HIPOTESE, :IR_GERA_TAB_SERVICO, '
      '       :SQ_VERSAO_COMUTACAO_MAS, '
      '       :SQ_VERSAO_COMUTACAO_FEM, '
      '       :SQ_VERSAO_COMUTACAO_PEN)'
      ' ')
    ValidateWithMask = True
    Left = 86
    Top = 96
    ParamData = <
      item
        DataType = ftUnknown
        Name = 'CD_HIPOTESE'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'CD_ITEM_HIPOTESE'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'VL_HIPOTESE'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'IR_GERA_TAB_SERVICO'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'SQ_VERSAO_COMUTACAO_MAS'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'SQ_VERSAO_COMUTACAO_FEM'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'SQ_VERSAO_COMUTACAO_PEN'
        ParamType = ptUnknown
      end>
    object qryComposicao_HipoteseDS_ITEM_HIPOTESE: TStringField
      DisplayLabel = 'Item de Hipótese'
      DisplayWidth = 36
      FieldName = 'DS_ITEM_HIPOTESE'
      FixedChar = True
      Size = 50
    end
    object qryComposicao_HipoteseDS_VERSAO_COMUTACAO_MAS: TStringField
      FieldName = 'DS_VERSAO_COMUTACAO_MAS'
      Size = 100
    end
    object qryComposicao_HipoteseDS_VERSAO_COMUTACAO_FEM: TStringField
      FieldName = 'DS_VERSAO_COMUTACAO_FEM'
      Size = 100
    end
    object qryComposicao_HipoteseDS_VERSAO_COMUTACAO_PEN: TStringField
      FieldName = 'DS_VERSAO_COMUTACAO_PEN'
      Size = 100
    end
    object qryComposicao_HipoteseVL_HIPOTESE: TFloatField
      DisplayLabel = 'Valor'
      DisplayWidth = 10
      FieldName = 'VL_HIPOTESE'
      DisplayFormat = '###,##0.000000'
    end
    object qryComposicao_HipoteseCD_HIPOTESE: TFloatField
      DisplayWidth = 10
      FieldName = 'CD_HIPOTESE'
      Visible = False
    end
    object qryComposicao_HipoteseCD_ITEM_HIPOTESE: TFloatField
      DisplayWidth = 10
      FieldName = 'CD_ITEM_HIPOTESE'
      Visible = False
    end
    object qryComposicao_HipoteseIR_GERA_TAB_SERVICO: TStringField
      DisplayWidth = 1
      FieldName = 'IR_GERA_TAB_SERVICO'
      Visible = False
      FixedChar = True
      Size = 1
    end
    object qryComposicao_HipoteseSQ_VERSAO_COMUTACAO_MAS: TFloatField
      FieldName = 'SQ_VERSAO_COMUTACAO_MAS'
    end
    object qryComposicao_HipoteseSQ_VERSAO_COMUTACAO_FEM: TFloatField
      FieldName = 'SQ_VERSAO_COMUTACAO_FEM'
    end
    object qryComposicao_HipoteseSQ_VERSAO_COMUTACAO_PEN: TFloatField
      FieldName = 'SQ_VERSAO_COMUTACAO_PEN'
    end
    object qryComposicao_HipoteseIR_ITEM_HIPOTESE: TStringField
      FieldName = 'IR_ITEM_HIPOTESE'
      FixedChar = True
      Size = 1
    end
  end
  object qryAux: TwwQuery
    DatabaseName = 'BaseDados'
    SQL.Strings = (
      'Select max(CD_HIPOTESE) as Max_CD'
      'from FI_HIPOTESE')
    ValidateWithMask = True
    Left = 117
    Top = 97
  end
  object qryItemAux: TwwQuery
    DatabaseName = 'BaseDados'
    SQL.Strings = (
      'Select max(CD_ITEM_HIPOTESE) as Max_CD'
      'from FI_ITEM_HIPOTESE')
    ValidateWithMask = True
    Left = 148
    Top = 97
  end
end
