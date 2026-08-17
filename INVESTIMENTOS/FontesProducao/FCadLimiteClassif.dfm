inherited FrmCadLimiteClassif: TFrmCadLimiteClassif
  Left = 537
  Top = 282
  Caption = 'Cadastro de Limites por Classificação'
  ClientHeight = 442
  ClientWidth = 425
  PixelsPerInch = 96
  TextHeight = 13
  inherited pnlFundo: TPanel
    Width = 425
    Height = 356
    object Label1: TLabel
      Left = 60
      Top = 72
      Width = 200
      Height = 13
      Caption = 'Indique a Carteira de Investimento '
    end
    object Label2: TLabel
      Left = 60
      Top = 115
      Width = 141
      Height = 13
      Caption = 'Tabela de Classificação '
    end
    object RG1: TRadioGroup
      Left = 24
      Top = 16
      Width = 378
      Height = 49
      Caption = ' Limite Por '
      Columns = 3
      ItemIndex = 0
      Items.Strings = (
        'Carteira '
        'Fundo '
        'Plano')
      TabOrder = 0
      OnClick = RG1Click
    end
    object DbLkcDados: TwwDBLookupCombo
      Left = 60
      Top = 88
      Width = 305
      Height = 21
      DropDownAlignment = taLeftJustify
      DataSource = ds
      LookupTable = QryDados
      Options = [loColLines, loRowLines, loTitles]
      TabOrder = 1
      AutoDropDown = True
      ShowButton = True
      AllowClearKey = True
      ShowMatchText = True
      OnChange = DbLkcDadosChange
    end
    object DbLkcTabClassif: TwwDBLookupCombo
      Left = 60
      Top = 131
      Width = 305
      Height = 21
      DropDownAlignment = taLeftJustify
      Selected.Strings = (
        'DESCTABCLASSINV'#9'40'#9'Tabela de Classificação')
      DataField = 'CODTABCLASSINV'
      DataSource = ds
      LookupTable = QryBuscaTabClassif
      LookupField = 'CODTABCLASSINV'
      Options = [loColLines, loRowLines, loTitles]
      TabOrder = 2
      AutoDropDown = True
      ShowButton = True
      AllowClearKey = True
      ShowMatchText = True
      OnChange = DbLkcTabClassifChange
    end
    object GroupBox1: TGroupBox
      Left = 24
      Top = 160
      Width = 378
      Height = 188
      Caption = ' Parâmetros do Limite '
      TabOrder = 3
      object Label3: TLabel
        Left = 70
        Top = 100
        Width = 164
        Height = 13
        Caption = 'Classificação de Referência '
      end
      object Label4: TLabel
        Left = 16
        Top = 18
        Width = 129
        Height = 13
        Caption = 'Classificação Principal'
      end
      object Label5: TLabel
        Left = 16
        Top = 57
        Width = 60
        Height = 13
        Caption = 'Operação '
      end
      object SB1: TSpeedButton
        Left = 340
        Top = 33
        Width = 22
        Height = 23
        Hint = 'Busca Classificação '
        Enabled = False
        Glyph.Data = {
          4E010000424D4E01000000000000760000002800000012000000120000000100
          040000000000D800000000000000000000001000000010000000000000000000
          BF0000BF000000BFBF00BF000000BF00BF00BFBF0000C0C0C000808080000000
          FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00DDDDDDDDDDDD
          DDDDDD000000DDDDDDDDDDDDDDDDDD000000D000000000000DD00D000000D0FF
          FFFFFFFF0D000D000000D0FFFFFFF0000800DD000000D0FFFFFF0877808DDD00
          0000D0FFFFF0877E880DDD000000D0FFFFF07777870DDD000000D0FFFFF07E77
          870DDD000000D0FFFFF08EE7880DDD000000D0FFFFFF087780DDDD000000D0FF
          FFFFF0000DDDDD000000D0FFFFFFFFFF0DDDDD000000D0FFFFFFF0000DDDDD00
          0000D0FFFFFFF070DDDDDD000000D0FFFFFFF00DDDDDDD000000DD00000000DD
          DDDDDD000000DDDDDDDDDDDDDDDDDD000000}
        ParentShowHint = False
        ShowHint = True
        OnClick = SB1Click
      end
      object SB2: TSpeedButton
        Left = 340
        Top = 115
        Width = 22
        Height = 23
        Hint = 'Busca Classificação '
        Enabled = False
        Glyph.Data = {
          4E010000424D4E01000000000000760000002800000012000000120000000100
          040000000000D800000000000000000000001000000010000000000000000000
          BF0000BF000000BFBF00BF000000BF00BF00BFBF0000C0C0C000808080000000
          FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00DDDDDDDDDDDD
          DDDDDD000000DDDDDDDDDDDDDDDDDD000000D000000000000DD00D000000D0FF
          FFFFFFFF0D000D000000D0FFFFFFF0000800DD000000D0FFFFFF0877808DDD00
          0000D0FFFFF0877E880DDD000000D0FFFFF07777870DDD000000D0FFFFF07E77
          870DDD000000D0FFFFF08EE7880DDD000000D0FFFFFF087780DDDD000000D0FF
          FFFFF0000DDDDD000000D0FFFFFFFFFF0DDDDD000000D0FFFFFFF0000DDDDD00
          0000D0FFFFFFF070DDDDDD000000D0FFFFFFF00DDDDDDD000000DD00000000DD
          DDDDDD000000DDDDDDDDDDDDDDDDDD000000}
        ParentShowHint = False
        ShowHint = True
        OnClick = SB2Click
      end
      object Label6: TLabel
        Left = 209
        Top = 57
        Width = 66
        Height = 13
        Caption = 'Percentual '
      end
      object Label7: TLabel
        Left = 16
        Top = 143
        Width = 39
        Height = 13
        Caption = 'Regra '
      end
      object DbLkcBuscaClassif: TwwDBLookupCombo
        Left = 16
        Top = 34
        Width = 323
        Height = 21
        DropDownAlignment = taLeftJustify
        Selected.Strings = (
          'DESCCLASSINVEST'#9'40'#9'Classificação')
        DataField = 'CODCLASSINVEST'
        DataSource = ds
        LookupTable = QryBuscaClassif
        LookupField = 'CODCLASSINVEST'
        Options = [loColLines, loRowLines, loTitles]
        TabOrder = 0
        AutoDropDown = True
        ShowButton = True
        AllowClearKey = True
        ShowMatchText = True
      end
      object DbLkcBuscaClassifRef: TwwDBLookupCombo
        Left = 70
        Top = 116
        Width = 269
        Height = 21
        DropDownAlignment = taLeftJustify
        Selected.Strings = (
          'DESCCLASSINVEST'#9'40'#9'Classificação')
        DataField = 'CODCLASSREF'
        DataSource = ds
        LookupTable = QryBuscaClassifRef
        LookupField = 'CODCLASSINVEST'
        Options = [loColLines, loRowLines, loTitles]
        Enabled = False
        TabOrder = 1
        AutoDropDown = True
        ShowButton = True
        AllowClearKey = True
        ShowMatchText = True
      end
      object DbCmbOperacao: TwwDBComboBox
        Left = 16
        Top = 73
        Width = 161
        Height = 21
        ShowButton = True
        Style = csDropDown
        MapList = True
        AllowClearKey = True
        AutoDropDown = True
        ShowMatchText = True
        DataField = 'OPLIMCLASSINV'
        DataSource = ds
        DropDownCount = 8
        ItemHeight = 0
        Items.Strings = (
          'Maior Que'#9'>'
          'Menor Que '#9'<'
          'Igual a '#9'='
          'Maior ou Igual à'#9'>='
          'Menor ou Igual à'#9'<=')
        Sorted = False
        TabOrder = 2
        UnboundDataType = wwDefault
      end
      object DBEdit1: TDBEdit
        Left = 208
        Top = 73
        Width = 129
        Height = 21
        DataField = 'PERCLIMCLASSINV'
        DataSource = ds
        TabOrder = 3
      end
      object DbLkcRegra: TwwDBLookupCombo
        Left = 16
        Top = 158
        Width = 321
        Height = 21
        DropDownAlignment = taLeftJustify
        Selected.Strings = (
          'NOMEREGRA'#9'40'#9'Regra')
        DataField = 'IDREGRALIMCLASS'
        DataSource = ds
        LookupTable = QryBuscaRegra
        LookupField = 'IDREGRA'
        Options = [loColLines, loRowLines, loTitles]
        TabOrder = 4
        AutoDropDown = True
        ShowButton = True
        AllowClearKey = True
        ShowMatchText = True
      end
      object CheckBox1: TCheckBox
        Left = 16
        Top = 120
        Width = 50
        Height = 17
        Caption = 'Total'
        Checked = True
        Enabled = False
        State = cbChecked
        TabOrder = 5
        OnClick = CheckBox1Click
      end
    end
  end
  inherited Dock972: TDock97
    Width = 425
  end
  inherited Dock971: TDock97
    Top = 403
    Width = 425
    inherited tb97Fundo: TToolbar97
      Left = 252
      DockPos = 252
    end
    inherited TB97oKCancelar: TToolbar97
      Left = 83
      DockPos = 83
    end
  end
  inherited upd: TUpdateSQL
    ModifySQL.Strings = (
      'update LIMITECLASSINV'
      'set'
      '  CODTABCLASSINV = :CODTABCLASSINV,'
      '  IDCARTEIRAINVEST = :IDCARTEIRAINVEST,'
      '  IDFUNDOINVEST = :IDFUNDOINVEST,'
      '  CODCLASSINVEST = :CODCLASSINVEST,'
      '  CODCLASSREF = :CODCLASSREF,'
      '  IDPLANOINVEST = :IDPLANOINVEST,'
      '  PERCLIMCLASSINV = :PERCLIMCLASSINV,'
      '  IDREGRALIMCLASS = :IDREGRALIMCLASS,'
      '  OPLIMCLASSINV = :OPLIMCLASSINV'
      'where'
      '  IDLIMCLASSINV = :OLD_IDLIMCLASSINV  ')
    InsertSQL.Strings = (
      'insert into LIMITECLASSINV'
      
        '  (IDLIMCLASSINV, CODTABCLASSINV, IDCARTEIRAINVEST, IDFUNDOINVES' +
        'T, CODCLASSINVEST, '
      
        '   CODCLASSREF, IDPLANOINVEST, PERCLIMCLASSINV, IDREGRALIMCLASS,' +
        ' OPLIMCLASSINV)'
      'values'
      
        '  (:IDLIMCLASSINV, :CODTABCLASSINV, :IDCARTEIRAINVEST, :IDFUNDOI' +
        'NVEST, '
      
        '   :CODCLASSINVEST, :CODCLASSREF, :IDPLANOINVEST, :PERCLIMCLASSI' +
        'NV, :IDREGRALIMCLASS, '
      '   :OPLIMCLASSINV)')
    DeleteSQL.Strings = (
      'delete from LIMITECLASSINV'
      'where'
      '  IDLIMCLASSINV = :OLD_IDLIMCLASSINV')
  end
  inherited MontaSelect: TMontaSelect
    Colunas.Strings = (
      'CLASSIFINVEST.DESCCLASSINVEST')
    TipodeDado.Strings = (
      'C')
    Descricao.Strings = (
      'Classificação')
    Tabelas.Strings = (
      'LIMITECLASSINV'
      'CLASSIFINVEST')
    CamposChave.Strings = (
      'LIMITECLASSINV.IDLIMCLASSINV')
    Filtro.Strings = (
      'LIMITECLASSINV.CODCLASSINVEST = CLASSIFINVEST.CODCLASSINVEST'
      'LIMITECLASSINV.CODTABCLASSINV = CLASSIFINVEST.CODTABCLASSINV ')
    Mascaras.Strings = (
      '')
    Larguras.Strings = (
      '40')
    Left = 373
  end
  inherited qry: TwwQuery
    AfterScroll = qryAfterScroll
    SQL.Strings = (
      
        'SELECT '#9'IDLIMCLASSINV, CODTABCLASSINV, IDCARTEIRAINVEST, IDFUNDO' +
        'INVEST, '
      #9'CODCLASSINVEST, CODCLASSREF, IDPLANOINVEST, PERCLIMCLASSINV,'
      #9'IDREGRALIMCLASS, OPLIMCLASSINV'
      ''
      'FROM LIMITECLASSINV')
    object qryIDLIMCLASSINV: TFloatField
      FieldName = 'IDLIMCLASSINV'
      Origin = 'LIMITECLASSINV.IDLIMCLASSINV'
    end
    object qryCODTABCLASSINV: TStringField
      FieldName = 'CODTABCLASSINV'
      Origin = 'LIMITECLASSINV.CODTABCLASSINV'
      Size = 10
    end
    object qryIDCARTEIRAINVEST: TFloatField
      FieldName = 'IDCARTEIRAINVEST'
      Origin = 'LIMITECLASSINV.IDCARTEIRAINVEST'
    end
    object qryIDFUNDOINVEST: TFloatField
      FieldName = 'IDFUNDOINVEST'
      Origin = 'LIMITECLASSINV.IDFUNDOINVEST'
    end
    object qryCODCLASSINVEST: TStringField
      FieldName = 'CODCLASSINVEST'
      Origin = 'LIMITECLASSINV.CODCLASSINVEST'
      Size = 8
    end
    object qryCODCLASSREF: TStringField
      FieldName = 'CODCLASSREF'
      Origin = 'LIMITECLASSINV.CODCLASSREF'
      Size = 8
    end
    object qryIDPLANOINVEST: TFloatField
      FieldName = 'IDPLANOINVEST'
      Origin = 'LIMITECLASSINV.IDPLANOINVEST'
    end
    object qryPERCLIMCLASSINV: TFloatField
      FieldName = 'PERCLIMCLASSINV'
      Origin = 'LIMITECLASSINV.PERCLIMCLASSINV'
      DisplayFormat = '####0.0000'
      EditFormat = '####0.0000'
    end
    object qryIDREGRALIMCLASS: TFloatField
      FieldName = 'IDREGRALIMCLASS'
      Origin = 'LIMITECLASSINV.IDREGRALIMCLASS'
    end
    object qryOPLIMCLASSINV: TStringField
      FieldName = 'OPLIMCLASSINV'
      Origin = 'LIMITECLASSINV.OPLIMCLASSINV'
      Size = 2
    end
  end
  object QryDados: TwwQuery
    DatabaseName = 'BaseDados'
    ValidateWithMask = True
    Left = 154
    Top = 55
  end
  object DsDados: TwwDataSource
    AutoEdit = False
    DataSet = QryDados
    Left = 184
    Top = 55
  end
  object QryBuscaTabClassif: TwwQuery
    DatabaseName = 'BaseDados'
    SQL.Strings = (
      'SELECT '#9'CODTABCLASSINV, DESCTABCLASSINV'
      ''
      'FROM TABCLASSIFINVEST'
      ''
      'ORDER BY DESCTABCLASSINV')
    ValidateWithMask = True
    Left = 218
    Top = 55
  end
  object QryBuscaClassif: TwwQuery
    DatabaseName = 'BaseDados'
    DataSource = DsBuscaTabClassif
    SQL.Strings = (
      'SELECT '#9'CODTABCLASSINV, CODCLASSINVEST, DESCCLASSINVEST,'
      #9'CLASSIFANALIT'
      ''
      'FROM CLASSIFINVEST'
      ''
      'WHERE CODTABCLASSINV = :CODTABCLASSINV '
      ''
      'ORDER BY DESCCLASSINVEST')
    ValidateWithMask = True
    Left = 328
    Top = 367
    ParamData = <
      item
        DataType = ftString
        Name = 'CODTABCLASSINV'
        ParamType = ptUnknown
      end>
  end
  object QryBuscaClassifRef: TwwQuery
    DatabaseName = 'BaseDados'
    DataSource = DsBuscaTabClassif
    SQL.Strings = (
      'SELECT '#9'CODTABCLASSINV, CODCLASSINVEST, DESCCLASSINVEST,'
      #9'CLASSIFANALIT'
      ''
      'FROM CLASSIFINVEST'
      ''
      'WHERE CODTABCLASSINV = :CODTABCLASSINV '
      ''
      'ORDER BY DESCCLASSINVEST')
    ValidateWithMask = True
    Left = 360
    Top = 367
    ParamData = <
      item
        DataType = ftString
        Name = 'CODTABCLASSINV'
        ParamType = ptUnknown
      end>
  end
  object QryBuscaRegra: TwwQuery
    DatabaseName = 'BaseDados'
    SQL.Strings = (
      'SELECT '#9'IDREGRA, NOMEREGRA '
      ''
      'FROM REGRA '
      ''
      'ORDER BY NOMEREGRA ')
    ValidateWithMask = True
    Left = 392
    Top = 367
  end
  object DsBuscaTabClassif: TwwDataSource
    DataSet = QryBuscaTabClassif
    Left = 248
    Top = 55
  end
end
