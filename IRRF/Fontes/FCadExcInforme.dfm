inherited frmCadExcInforme: TfrmCadExcInforme
  Left = 156
  Top = 146
  Caption = 'Cadastro de Exceções para o Informe'
  ClientHeight = 314
  ClientWidth = 486
  PixelsPerInch = 96
  TextHeight = 13
  inherited pnlFundo: TPanel
    Width = 486
    Height = 228
    object lblRubPrin: TLabel
      Left = 32
      Top = 24
      Width = 98
      Height = 13
      Caption = 'Rubrica Principal'
    end
    object Label1: TLabel
      Left = 32
      Top = 72
      Width = 49
      Height = 13
      Caption = 'Rubrica '
    end
    object Label2: TLabel
      Left = 32
      Top = 120
      Width = 118
      Height = 13
      Caption = 'Linha para o Informe'
    end
    object lblPrioridade: TLabel
      Left = 32
      Top = 168
      Width = 58
      Height = 13
      Caption = 'Prioridade'
    end
    object dblcRubPrinc: TCMDBLookupCombo
      Left = 32
      Top = 40
      Width = 364
      Height = 21
      DropDownAlignment = taLeftJustify
      Selected.Strings = (
        'DESCRICAO'#9'130'#9'Descrição'
        'IDPROVENTO'#9'10'#9'Código')
      DataField = 'IDRUBRICAPRIN'
      DataSource = ds
      LookupTable = qryRubricaPrin
      LookupField = 'IDPROVENTO'
      Options = [loTitles]
      Style = csDropDownList
      TabOrder = 0
      AutoDropDown = True
      ShowButton = True
      AllowClearKey = True
      ShowMatchText = True
    end
    object dblcRubrica: TCMDBLookupCombo
      Left = 32
      Top = 88
      Width = 364
      Height = 21
      DropDownAlignment = taLeftJustify
      Selected.Strings = (
        'DESCRICAO'#9'130'#9'Descrição'
        'IDPROVENTO'#9'10'#9'Código')
      DataField = 'IDRUBRICA'
      DataSource = ds
      LookupTable = qryRubrica
      LookupField = 'IDPROVENTO'
      Options = [loTitles]
      Style = csDropDownList
      TabOrder = 1
      AutoDropDown = True
      ShowButton = True
      AllowClearKey = True
      ShowMatchText = True
    end
    object dblcLinhaInforme: TwwDBLookupCombo
      Left = 32
      Top = 136
      Width = 364
      Height = 21
      DropDownAlignment = taLeftJustify
      Selected.Strings = (
        'NOMEINFORME'#9'60'#9'Linha'
        'CODINFORME'#9'10'#9'Código'
        'IDINFORME'#9'10'#9'Identificador')
      DataField = 'IDINFORME'
      DataSource = ds
      LookupTable = qryLinhaInforme
      LookupField = 'IDINFORME'
      Options = [loTitles]
      Style = csDropDownList
      TabOrder = 2
      AutoDropDown = True
      ShowButton = True
      AllowClearKey = True
      ShowMatchText = True
    end
    object dbedPrioridade: TwwDBEdit
      Left = 32
      Top = 184
      Width = 121
      Height = 21
      DataField = 'PRIORIDADE'
      DataSource = ds
      TabOrder = 3
      UnboundDataType = wwDefault
      WantReturns = False
      WordWrap = False
    end
  end
  inherited Dock972: TDock97
    Width = 486
  end
  inherited Dock971: TDock97
    Top = 275
    Width = 486
    inherited tb97Fundo: TToolbar97
      Left = 266
      DockPos = 266
    end
    inherited TB97oKCancelar: TToolbar97
      Left = 98
      DockPos = 98
    end
  end
  inherited qry: TwwQuery
    SQL.Strings = (
      'SELECT IDRUBRICAPRIN, IDINFORME, PRIORIDADE, IDRUBRICA'
      'FROM RUBRICAXINFORME'
      'WHERE (IDRUBRICA = :IDRUBRICA)'
      '  AND (IDRUBRICAPRIN = :IDRUBRICAPRIN)'
      '')
    Left = 354
    Top = 6
    ParamData = <
      item
        DataType = ftFloat
        Name = 'IDRUBRICA'
        ParamType = ptUnknown
      end
      item
        DataType = ftFloat
        Name = 'IDRUBRICAPRIN'
        ParamType = ptUnknown
      end>
    object qryIDRUBRICAPRIN: TFloatField
      FieldName = 'IDRUBRICAPRIN'
      Origin = 'RUBRICAXINFORME.IDRUBRICAPRIN'
    end
    object qryIDINFORME: TFloatField
      FieldName = 'IDINFORME'
      Origin = 'RUBRICAXINFORME.IDINFORME'
    end
    object qryPRIORIDADE: TFloatField
      FieldName = 'PRIORIDADE'
      Origin = 'RUBRICAXINFORME.PRIORIDADE'
    end
    object qryIDRUBRICA: TFloatField
      FieldName = 'IDRUBRICA'
      Origin = 'RUBRICAXINFORME.IDRUBRICA'
    end
  end
  inherited ivTradutor: TIvExtendedTranslator
    Left = 272
    Top = 6
  end
  inherited upd: TUpdateSQL
    ModifySQL.Strings = (
      'update RUBRICAXINFORME'
      'set'
      '  IDRUBRICAPRIN = :IDRUBRICAPRIN,'
      '  IDINFORME = :IDINFORME,'
      '  PRIORIDADE = :PRIORIDADE,'
      '  IDRUBRICA = :IDRUBRICA'
      'where'
      '  IDRUBRICAPRIN = :OLD_IDRUBRICAPRIN and'
      '  IDRUBRICA = :OLD_IDRUBRICA')
    InsertSQL.Strings = (
      'insert into RUBRICAXINFORME'
      '  (IDRUBRICAPRIN, IDINFORME, PRIORIDADE, IDRUBRICA)'
      'values'
      '  (:IDRUBRICAPRIN, :IDINFORME, :PRIORIDADE, :IDRUBRICA)')
    DeleteSQL.Strings = (
      'delete from RUBRICAXINFORME'
      'where'
      '  IDRUBRICAPRIN = :OLD_IDRUBRICAPRIN and'
      '  IDRUBRICA = :OLD_IDRUBRICA')
    Left = 435
    Top = 6
  end
  inherited MontaSelect: TMontaSelect
    Colunas.Strings = (
      'PROVDESC1.DESCRICAO'
      'PROVDESC2.DESCRICAO'
      'INFORME.NOMEINFORME'
      'RUBRICAXINFORME.PRIORIDADE')
    TipodeDado.Strings = (
      'C'
      'C'
      'C'
      'N')
    Descricao.Strings = (
      'Rubrica Principal'
      'Rubrica'
      'Informe'
      'Prioridade')
    SensivelACaixa.Strings = (
      'N'
      'N'
      'N'
      'N')
    Tabelas.Strings = (
      'INFORME'
      'RUBRICAXINFORME'
      'PROVDESC PROVDESC1'
      'PROVDESC PROVDESC2')
    CamposChave.Strings = (
      'RUBRICAXINFORME.IDRUBRICAPRIN'
      'RUBRICAXINFORME.IDRUBRICA')
    Filtro.Strings = (
      'RUBRICAXINFORME.IDINFORME = INFORME.IDINFORME'
      'RUBRICAXINFORME.IDRUBRICAPRIN = PROVDESC1.IDPROVENTO'
      'RUBRICAXINFORME.IDRUBRICA = PROVDESC2.IDPROVENTO')
    Mascaras.Strings = (
      ''
      ''
      ''
      '')
    Larguras.Strings = (
      '30'
      '30'
      '60'
      '10')
    Left = 333
  end
  inherited ds: TwwDataSource
    Left = 395
    Top = 6
  end
  inherited ImlPadrao: TImageList
    Left = 313
    Top = 6
  end
  inherited CmeCadastro: TCmEventosCadastro
    OnFind = CmeCadastroFind
    Left = 174
    Top = 42
  end
  object qryRubricaPrin: TwwQuery
    Tag = 5
    DatabaseName = 'BaseDados'
    SQL.Strings = (
      'SELECT IDPROVENTO, DESCRICAO '
      'FROM PROVDESC'
      'ORDER BY DESCRICAO ')
    ValidateWithMask = True
    Left = 248
    Top = 39
  end
  object qryLinhaInforme: TwwQuery
    Tag = 5
    DatabaseName = 'BaseDados'
    SQL.Strings = (
      'SELECT IDINFORME, NOMEINFORME, CODINFORME '
      'FROM INFORME '
      'ORDER BY NOMEINFORME'
      '')
    ValidateWithMask = True
    Left = 426
    Top = 61
    object qryLinhaInformeNOMEINFORME: TStringField
      DisplayLabel = 'Linha'
      DisplayWidth = 60
      FieldName = 'NOMEINFORME'
      Origin = 'INFORME.NOMEINFORME'
      Size = 60
    end
    object qryLinhaInformeCODINFORME: TFloatField
      DisplayLabel = 'Código'
      DisplayWidth = 10
      FieldName = 'CODINFORME'
      Origin = '"CM.INFORME".CODINFORME'
    end
    object qryLinhaInformeIDINFORME: TFloatField
      DisplayLabel = 'Identificador'
      DisplayWidth = 10
      FieldName = 'IDINFORME'
      Origin = 'INFORME.IDINFORME'
    end
  end
  object qryRubrica: TwwQuery
    Tag = 5
    DatabaseName = 'BaseDados'
    SQL.Strings = (
      'SELECT IDPROVENTO, DESCRICAO '
      'FROM PROVDESC'
      'ORDER BY DESCRICAO ')
    ValidateWithMask = True
    Left = 424
    Top = 127
  end
end
