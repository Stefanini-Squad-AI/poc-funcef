inherited frmCadTrataIndice: TfrmCadTrataIndice
  Left = 288
  Top = 154
  Caption = 'Cadastro de Tratamento d˜'
  ClientHeight = 244
  ClientWidth = 349
  PixelsPerInch = 96
  TextHeight = 13
  inherited pnlFundo: TPanel
    Width = 349
    Height = 158
    object Label4: TLabel
      Left = 16
      Top = 11
      Width = 58
      Height = 13
      Caption = 'Descrição'
    end
    object Label1: TLabel
      Left = 16
      Top = 52
      Width = 122
      Height = 13
      Caption = 'Tratamento de Índice'
    end
    object Label2: TLabel
      Left = 16
      Top = 92
      Width = 39
      Height = 13
      Caption = 'Moeda'
    end
    object DblkcMoeda: TwwDBLookupCombo
      Left = 17
      Top = 106
      Width = 128
      Height = 21
      DropDownAlignment = taLeftJustify
      Selected.Strings = (
        'MOESIGLA'#9'10'#9'MOESIGLA')
      DataField = 'MOECODIGO'
      DataSource = ds
      LookupTable = qryMoeda
      LookupField = 'MOECODIGO'
      Options = [loColLines, loRowLines, loTitles]
      TabOrder = 2
      AutoDropDown = True
      ShowButton = True
      AllowClearKey = True
      ShowMatchText = True
    end
    object dbeDescricao: TDBEdit
      Left = 16
      Top = 26
      Width = 313
      Height = 21
      DataField = 'DESCTRATAIND'
      DataSource = ds
      TabOrder = 0
    end
    object wwDBComboBox1: TwwDBComboBox
      Left = 16
      Top = 66
      Width = 129
      Height = 21
      ShowButton = True
      Style = csDropDown
      MapList = False
      AllowClearKey = False
      DataField = 'CODTRATAIND'
      DataSource = ds
      DropDownCount = 8
      ItemHeight = 0
      Items.Strings = (
        'ANBID'
        'CDI'
        'DI'
        'IGPDI'
        'IGPM'
        'INPC'
        'MOEDA'
        'PU'
        'SELIC'
        'TJLP'
        'TR ')
      Sorted = False
      TabOrder = 1
      UnboundDataType = wwDefault
    end
  end
  inherited Dock971: TDock97
    Top = 205
    Width = 349
    inherited tb97Fundo: TToolbar97
      Left = 168
      DockPos = 168
    end
    inherited TB97oKCancelar: TToolbar97
      Left = 0
      DockPos = 0
    end
  end
  inherited Dock972: TDock97
    Width = 349
  end
  inherited qry: TwwQuery
    SQL.Strings = (
      'SELECT'
      '     IDTRATAIND,MOECODIGO,DESCTRATAIND,CODTRATAIND'
      'FROM'
      '     TRATAINDICE'
      'WHERE'
      '     IDTRATAIND =:IDTRATAIND')
    Params.Data = {010001000A49445452415441494E4400030400000000000000}
    Left = 207
    Top = 64
    object qryIDTRATAIND: TFloatField
      FieldName = 'IDTRATAIND'
      Origin = 'TRATAINDICE.IDTRATAIND'
    end
    object qryMOECODIGO: TFloatField
      FieldName = 'MOECODIGO'
      Origin = 'TRATAINDICE.MOECODIGO'
    end
    object qryDESCTRATAIND: TStringField
      FieldName = 'DESCTRATAIND'
      Origin = 'TRATAINDICE.DESCTRATAIND'
      Size = 60
    end
    object qryCODTRATAIND: TStringField
      FieldName = 'CODTRATAIND'
      Size = 5
    end
  end
  inherited ds: TwwDataSource
    Left = 237
    Top = 64
  end
  inherited upd: TUpdateSQL
    ModifySQL.Strings = (
      'update TRATAINDICE'
      'set'
      '  IDTRATAIND = :IDTRATAIND,'
      '  MOECODIGO = :MOECODIGO,'
      '  DESCTRATAIND = :DESCTRATAIND,'
      '  CODTRATAIND = :CODTRATAIND'
      'where'
      '  IDTRATAIND = :OLD_IDTRATAIND')
    InsertSQL.Strings = (
      'insert into TRATAINDICE'
      '  (IDTRATAIND, MOECODIGO, DESCTRATAIND, CODTRATAIND)'
      'values'
      '  (:IDTRATAIND, :MOECODIGO, :DESCTRATAIND, :CODTRATAIND)')
    DeleteSQL.Strings = (
      'delete from TRATAINDICE'
      'where'
      '  IDTRATAIND = :OLD_IDTRATAIND')
    Left = 177
    Top = 64
  end
  inherited MontaSelect: TMontaSelect
    Colunas.Strings = (
      'TRATAINDICE.DESCTRATAIND'
      'TRATAINDICE.CODTRATAIND')
    TipodeDado.Strings = (
      'C'
      'C')
    Descricao.Strings = (
      'Descrição'
      'Sigla')
    SensivelACaixa.Strings = (
      'N'
      'N')
    Tabelas.Strings = (
      'TRATAINDICE')
    CamposChave.Strings = (
      'TRATAINDICE.IDTRATAIND')
    Mascaras.Strings = (
      ''
      '')
    Larguras.Strings = (
      '60'
      '6')
    Left = 285
    Top = 64
  end
  inherited ivTradutor: TIvExtendedTranslator
    TargetsData = (
      1
      1
      (
        ''
        'Text'
        0))
  end
  object qryMoeda: TwwQuery
    CachedUpdates = True
    DatabaseName = 'BaseDados'
    SQL.Strings = (
      'SELECT '
      '     MOECODIGO,MOESIGLA'
      'FROM MOEDA'
      'ORDER BY MOESIGLA')
    ValidateWithMask = True
    Left = 255
    Top = 112
    object qryMoedaMOESIGLA: TStringField
      DisplayWidth = 10
      FieldName = 'MOESIGLA'
      Origin = 'MOEDA.MOESIGLA'
      Size = 10
    end
    object qryMoedaMOECODIGO: TFloatField
      DisplayWidth = 10
      FieldName = 'MOECODIGO'
      Origin = 'MOEDA.MOECODIGO'
      Visible = False
    end
  end
  object dsMoeda: TwwDataSource
    AutoEdit = False
    DataSet = qryMoeda
    Left = 293
    Top = 112
  end
inherited CmeCadastro: TCmEventosCadastro
     OnInsert = CmeCadastroInsert
     OnEdit = CmeCadastroEdit
     OnFind = CmeCadastroFind
  Left = 358
  Top = 58
end
end
