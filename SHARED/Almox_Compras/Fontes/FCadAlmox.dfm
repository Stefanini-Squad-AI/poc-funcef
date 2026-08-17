inherited FrmCadAlmox: TFrmCadAlmox
  Top = 162
  Caption = 'Cadastro de Almoxarifado'
  ClientHeight = 256
  ClientWidth = 451
  PixelsPerInch = 96
  TextHeight = 13
  inherited pnlFundo: TPanel
    Width = 451
    Height = 170
    object Label1: TLabel
      Left = 24
      Top = 64
      Width = 112
      Height = 13
      Caption = 'Unidade de Custeio'
    end
    object Label3: TLabel
      Left = 24
      Top = 112
      Width = 92
      Height = 13
      Caption = 'Centro de Custo'
    end
    object edAlmoxa: TLabel
      Left = 24
      Top = 16
      Width = 73
      Height = 13
      Caption = 'Almoxarifado'
    end
    object dblkcmbUnCusteio: TwwDBLookupCombo
      Left = 24
      Top = 80
      Width = 258
      Height = 21
      DropDownAlignment = taLeftJustify
      Selected.Strings = (
        'DESCCUSTEIO'#9'30'#9'Descrição'
        'UCCONTABIL'#9'10'#9'Contábil')
      DataField = 'CODCUSTEIO'
      DataSource = ds
      LookupTable = qryUnCusteio
      LookupField = 'CODCUSTEIO'
      Options = [loTitles]
      Style = csDropDownList
      DropDownCount = 10
      TabOrder = 1
      AutoDropDown = True
      ShowButton = True
      AllowClearKey = True
      ShowMatchText = True
    end
    object dblkcmbCentroCusto: TwwDBLookupCombo
      Left = 24
      Top = 128
      Width = 258
      Height = 21
      DropDownAlignment = taLeftJustify
      Selected.Strings = (
        'NOME'#9'30'#9'Nome'
        'CODCENTROCUSTO'#9'10'#9'Código')
      DataField = 'CODCENTROCUSTO'
      DataSource = ds
      LookupTable = qryCentroCusto
      LookupField = 'CODCENTROCUSTO'
      Options = [loTitles]
      Style = csDropDownList
      TabOrder = 2
      AutoDropDown = True
      ShowButton = True
      AllowClearKey = True
      ShowMatchText = True
    end
    object dbedDesc: TDBEdit
      Left = 24
      Top = 32
      Width = 258
      Height = 21
      DataField = 'DESCALMOX'
      DataSource = ds
      TabOrder = 0
    end
    object rgrpTipoAlmox: TDBRadioGroup
      Left = 292
      Top = 25
      Width = 136
      Height = 124
      Caption = 'Tipo de Almoxarifado'
      DataField = 'PRINCIPSECUND'
      DataSource = ds
      Items.Strings = (
        'Principal'
        'Secundário')
      TabOrder = 3
      Values.Strings = (
        'P'
        'S')
    end
  end
  inherited Dock972: TDock97
    Width = 451
  end
  inherited Dock971: TDock97
    Top = 217
    Width = 451
    inherited tb97Fundo: TToolbar97
      Left = 274
      DockPos = 274
    end
    inherited TB97oKCancelar: TToolbar97
      Left = 106
      DockPos = 106
    end
  end
  inherited qry: TwwQuery
    SQL.Strings = (
      'SELECT'
      '     CODALMOXARIFADO,'
      '     CODCUSTEIO,'
      '     IDPESSOA,'
      '     CODCENTROCUSTO,'
      '     IDEMPRESA,'
      '     DESCALMOX,'
      '     PRINCIPSECUND,'
      '     CONTABIL'
      'FROM'
      '    ALMOX'
      'WHERE'
      '    (CODALMOXARIFADO = :pCODALMOX)')
    Left = 286
    Top = 3
    ParamData = <
      item
        DataType = ftInteger
        Name = 'pCODALMOX'
        ParamType = ptUnknown
      end>
    object qryCODALMOXARIFADO: TFloatField
      FieldName = 'CODALMOXARIFADO'
      Origin = 'ALMOX.CODALMOXARIFADO'
    end
    object qryCODCUSTEIO: TFloatField
      FieldName = 'CODCUSTEIO'
      Origin = 'ALMOX.CODCUSTEIO'
    end
    object qryIDPESSOA: TFloatField
      FieldName = 'IDPESSOA'
      Origin = 'ALMOX.IDPESSOA'
    end
    object qryCODCENTROCUSTO: TStringField
      FieldName = 'CODCENTROCUSTO'
      Origin = 'ALMOX.CODCENTROCUSTO'
      Size = 10
    end
    object qryIDEMPRESA: TFloatField
      FieldName = 'IDEMPRESA'
      Origin = 'ALMOX.IDEMPRESA'
    end
    object qryDESCALMOX: TStringField
      FieldName = 'DESCALMOX'
      Origin = 'ALMOX.DESCALMOX'
      Size = 40
    end
    object qryPRINCIPSECUND: TStringField
      FieldName = 'PRINCIPSECUND'
      Origin = 'ALMOX.PRINCIPSECUND'
      Size = 1
    end
    object qryCONTABIL: TStringField
      FieldName = 'CONTABIL'
      Origin = 'ALMOX.CONTABIL'
      Size = 1
    end
  end
  inherited ivTradutor: TIvExtendedTranslator
    Left = 763
  end
  inherited upd: TUpdateSQL
    ModifySQL.Strings = (
      'update ALMOX'
      'set'
      '  CODALMOXARIFADO = :CODALMOXARIFADO,'
      '  CODCUSTEIO = :CODCUSTEIO,'
      '  IDPESSOA = :IDPESSOA,'
      '  CODCENTROCUSTO = :CODCENTROCUSTO,'
      '  IDEMPRESA = :IDEMPRESA,'
      '  DESCALMOX = :DESCALMOX,'
      '  PRINCIPSECUND = :PRINCIPSECUND,'
      '  CONTABIL = :CONTABIL'
      'where'
      '  CODALMOXARIFADO = :OLD_CODALMOXARIFADO')
    InsertSQL.Strings = (
      'insert into ALMOX'
      '  (CODALMOXARIFADO, CODCUSTEIO, IDPESSOA, CODCENTROCUSTO, '
      'IDEMPRESA, DESCALMOX, '
      '   PRINCIPSECUND, CONTABIL)'
      'values'
      '  (:CODALMOXARIFADO, :CODCUSTEIO, :IDPESSOA, :CODCENTROCUSTO, '
      ':IDEMPRESA, '
      '   :DESCALMOX, :PRINCIPSECUND, :CONTABIL)')
    DeleteSQL.Strings = (
      'delete from ALMOX'
      'where'
      '  CODALMOXARIFADO = :OLD_CODALMOXARIFADO')
    Left = 256
    Top = 3
  end
  inherited MontaSelect: TMontaSelect
    Colunas.Strings = (
      'ALMOX.DESCALMOX'
      'CENTCUST.NOME'
      'UNCUSTEI.DESCCUSTEIO')
    TipodeDado.Strings = (
      'C'
      'C'
      '')
    Descricao.Strings = (
      'Descrição'
      'Centro de Custo'
      'Unidade de Custeio')
    Tabelas.Strings = (
      'ALMOX'
      'CENTCUST'
      'UNCUSTEI')
    CamposChave.Strings = (
      'ALMOX.CODALMOXARIFADO')
    Filtro.Strings = (
      'ALMOX.CODCENTROCUSTO = CENTCUST.CODCENTROCUSTO'
      'ALMOX.IDEMPRESA = CENTCUST.IDEMPRESA'
      'ALMOX.CODCUSTEIO = UNCUSTEI.CODCUSTEIO')
    Mascaras.Strings = (
      ''
      ''
      '')
    Larguras.Strings = (
      '40'
      '30'
      '10')
    Top = 3
  end
  inherited ds: TwwDataSource
    Left = 316
    Top = 3
  end
  inherited CmeCadastro: TCmEventosCadastro
    OnFind = CmeCadastroFind
    Left = 380
  end
  object qryUnCusteio: TwwQuery
    DatabaseName = 'BaseDados'
    Constrained = True
    SQL.Strings = (
      'SELECT  '
      '           CODCUSTEIO,'
      '           DESCCUSTEIO,'
      '           UCCONTABIL'
      'FROM '
      '        UNCUSTEI '
      'WHERE '
      '       ( IDPESSOA = :IDPESSOA )'
      'ORDER  BY DESCCUSTEIO')
    ControlType.Strings = (
      'UCCONTABIL;CheckBox;T;F')
    ValidateWithMask = True
    Left = 382
    Top = 116
    ParamData = <
      item
        DataType = ftInteger
        Name = 'IDPESSOA'
        ParamType = ptUnknown
        Value = 1
      end>
    object qryUnCusteioCODCUSTEIO: TFloatField
      FieldName = 'CODCUSTEIO'
      Origin = 'UNCUSTEI.CODCUSTEIO'
    end
    object qryUnCusteioDESCCUSTEIO: TStringField
      FieldName = 'DESCCUSTEIO'
      Origin = 'UNCUSTEI.DESCCUSTEIO'
      Size = 30
    end
    object qryUnCusteioUCCONTABIL: TStringField
      FieldName = 'UCCONTABIL'
      Origin = 'UNCUSTEI.UCCONTABIL'
      Size = 1
    end
  end
  object qryCentroCusto: TwwQuery
    DatabaseName = 'BaseDados'
    SQL.Strings = (
      'SELECT '
      '          NOME,'
      '          CODCENTROCUSTO  '
      'FROM '
      '         CENTCUST '
      'WHERE '
      '         (IDEMPRESA = :IDEMPRESA)'
      '     AND (STATUSGRUPOCDC = '#39'A'#39')'
      '     AND (ATIVO = '#39'S'#39')'
      'ORDER BY NOME')
    ValidateWithMask = True
    OnFilterOptions = []
    Left = 382
    Top = 66
    ParamData = <
      item
        DataType = ftInteger
        Name = 'IDEMPRESA'
        ParamType = ptUnknown
        Value = 1
      end>
  end
end
