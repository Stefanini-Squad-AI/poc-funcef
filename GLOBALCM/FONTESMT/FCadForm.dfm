inherited FrmCadForm: TFrmCadForm
  Left = 496
  Top = 254
  Caption = 'Cadastro de Form'
  ClientHeight = 240
  ClientWidth = 399
  PixelsPerInch = 96
  TextHeight = 13
  inherited pnlFundo: TPanel
    Width = 399
    Height = 154
    object lblModulo: TLabel
      Left = 24
      Top = 18
      Width = 42
      Height = 13
      Caption = 'Módulo'
    end
    object lblNomeForm: TLabel
      Left = 24
      Top = 59
      Width = 28
      Height = 13
      Caption = 'Form'
    end
    object lblDescForm: TLabel
      Left = 24
      Top = 100
      Width = 107
      Height = 13
      Caption = 'Descrição do Form'
    end
    object dbedtForm: TwwDBEdit
      Left = 24
      Top = 73
      Width = 345
      Height = 21
      DataField = 'NOMEFORM'
      DataSource = ds
      TabOrder = 1
      UnboundDataType = wwDefault
      WantReturns = False
      WordWrap = False
    end
    object dblkpModulo: TCMDBLookupCombo
      Left = 24
      Top = 32
      Width = 345
      Height = 21
      DropDownAlignment = taLeftJustify
      Selected.Strings = (
        'NOME_ID'#9'30'#9'Módulo - ID'#9'F')
      DataField = 'IDMODULO'
      DataSource = ds
      LookupTable = CdsModulo
      LookupField = 'IDMODULO'
      Options = [loTitles]
      Style = csDropDownList
      TabOrder = 0
      AutoDropDown = True
      ShowButton = True
      AllowClearKey = True
      ShowMatchText = True
    end
    object dbedtDescForm: TwwDBEdit
      Left = 24
      Top = 114
      Width = 345
      Height = 21
      DataField = 'DESCFORM'
      DataSource = ds
      TabOrder = 2
      UnboundDataType = wwDefault
      WantReturns = False
      WordWrap = False
    end
  end
  inherited Dock972: TDock97
    Width = 399
  end
  inherited Dock971: TDock97
    Top = 201
    Width = 399
    inherited tb97Fundo: TToolbar97
      Left = 227
    end
    inherited TB97oKCancelar: TToolbar97
      Left = 58
    end
  end
  inherited ivTradutor: TIvExtendedTranslator
    Left = 472
    Top = 7
  end
  inherited ds: TwwDataSource
    Left = 349
    Top = 13
  end
  inherited ImlPadrao: TImageList
    Left = 471
    Top = 65530
  end
  inherited CmeCadastro: TCmEventosCadastro
    OnFind = CmeCadastroFind
    ApplyInsert = CmeCadastroApplyInsert
    ApplyEdit = CmeCadastroApplyEdit
    ApplyDelete = CmeCadastroApplyDelete
    OnAbortConfirma = CmeCadastroAbortConfirma
    Left = 257
    Top = 14
  end
  inherited Cds: TCMClientDataSet
    Left = 349
    Top = 1
  end
  inherited MontaSelect: TMontaSelect
    Colunas.Strings = (
      'MODULO.NOMEMODULO'
      'FORM.NOMEFORM')
    TipodeDado.Strings = (
      'C'
      'C')
    Descricao.Strings = (
      'Módulo'
      'Form')
    SensivelACaixa.Strings = (
      'N'
      'N')
    Tabelas.Strings = (
      'FORM'
      'MODULO')
    CamposChave.Strings = (
      'FORM.IDFORM')
    Filtro.Strings = (
      'FORM.IDMODULO = MODULO.IDMODULO')
    Mascaras.Strings = (
      ''
      '')
    Larguras.Strings = (
      '40'
      '30')
    OperComparador.Strings = (
      '0'
      '0')
    ApenasLetraENum.Strings = (
      'N'
      'N')
    ComparaMaiuscula.Strings = (
      ''
      '')
    LookupSQL.Strings = (
      ''
      '')
    LookupCampoChave.Strings = (
      ''
      '')
    LookupCampoExibe.Strings = (
      ''
      '')
    Left = 256
    Top = 1
  end
  object CdsModulo: TCMClientDataSet
    Aggregates = <>
    Params = <>
    Left = 86
    Top = 65
  end
  object sqlModulo: TCMSqlParams
    SQL.Strings = (
      'SELECT IDMODULO, TRIM(NOMEMODULO) NOMEMODULO, '
      '       TRIM(NOMEMODULO) || '#39' - '#39' || IDMODULO NOME_ID'
      '  FROM MODULO'
      ' ORDER BY NOMEMODULO')
    ClientDataSet = CdsModulo
    Left = 86
    Top = 51
  end
end
