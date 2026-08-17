inherited frmCadValorRegra: TfrmCadValorRegra
  Left = 196
  Top = 116
  HelpContext = 40206
  Caption = 'Cadastrar Relacionamento Valores / Regras'
  ClientHeight = 363
  ClientWidth = 530
  PixelsPerInch = 96
  TextHeight = 13
  inherited pnlFundo: TPanel
    Width = 530
    Height = 277
    object DBGrid1: TDBGrid
      Left = 5
      Top = 5
      Width = 520
      Height = 267
      Align = alClient
      DataSource = ds
      TabOrder = 0
      TitleFont.Charset = DEFAULT_CHARSET
      TitleFont.Color = clWindowText
      TitleFont.Height = -9
      TitleFont.Name = 'MS Sans Serif'
      TitleFont.Style = [fsBold]
      OnKeyDown = DBGrid1KeyDown
      Columns = <
        item
          Expanded = False
          FieldName = 'ds_tipo_valor'
          Width = 264
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'ds_regra'
          Width = 166
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'ds_importa'
          Visible = True
        end>
    end
  end
  inherited Dock972: TDock97
    Width = 530
  end
  inherited Dock971: TDock97
    Top = 324
    Width = 530
    inherited tb97Fundo: TToolbar97
      Left = 360
    end
    inherited TB97oKCancelar: TToolbar97
      Left = 190
    end
    inherited dbnav: TDBNavigator
      Hints.Strings = ()
    end
  end
  inherited ivTradutor: TIvExtendedTranslator
    Left = 348
    Top = 80
  end
  inherited ds: TwwDataSource
    DataSet = QryPrincipal
    Left = 262
    Top = 136
  end
  inherited ImlPadrao: TImageList
    Left = 317
    Top = 80
  end
  inherited srchdlgProcura: TwwSearchDialog
    Left = 236
    Top = 265
  end
  inherited seldlgProcuraQry: TcmSelectDlg
    Left = 277
    Top = 265
  end
  inherited CmeCadastro: TCmEventosCadastro
    Left = 195
    Top = 265
  end
  object qryTipoValor: TwwQuery
    DatabaseName = 'BaseDados'
    SQL.Strings = (
      'SELECT * '
      'FROM FI_TIPO_VALOR'
      'ORDER BY DS_TIPO_VALOR')
    ValidateWithMask = True
    Left = 234
    Top = 164
    object qryTipoValorDS_TIPO_VALOR: TStringField
      DisplayLabel = 'Tipo de Valores'
      DisplayWidth = 60
      FieldName = 'DS_TIPO_VALOR'
      Origin = 'BASEDADOS.FI_TIPO_VALOR.DS_TIPO_VALOR'
      FixedChar = True
      Size = 60
    end
    object qryTipoValorCD_TIPO_VALOR: TFloatField
      FieldName = 'CD_TIPO_VALOR'
      Origin = 'BASEDADOS.FI_TIPO_VALOR.CD_TIPO_VALOR'
      Visible = False
    end
  end
  object qryRegra: TwwQuery
    DatabaseName = 'BaseDados'
    SQL.Strings = (
      'SELECT IDREGRA, NOMEREGRA'
      'FROM REGRA'
      'ORDER BY NOMEREGRA')
    ValidateWithMask = True
    Left = 262
    Top = 164
    object qryRegraIDREGRA: TFloatField
      FieldName = 'IDREGRA'
      Origin = 'BASEDADOS.REGRA.IDREGRA'
    end
    object qryRegraNOMEREGRA: TStringField
      FieldName = 'NOMEREGRA'
      Origin = 'BASEDADOS.REGRA.NOMEREGRA'
      Size = 60
    end
  end
  object UpdtSQLPrincipal: TUpdateSQL
    ModifySQL.Strings = (
      'update FI_VALOR_REGRA'
      'set'
      '  IDREGRA = :IDREGRA,'
      '  NO_TABELA = :NO_TABELA,'
      '  NO_ATRIBUTO = :NO_ATRIBUTO,'
      '  IR_IMPORTA = :IR_IMPORTA'
      'where'
      '  CD_TIPO_VALOR = :OLD_CD_TIPO_VALOR and'
      '  CD_PESSOA_ENTID = :OLD_CD_PESSOA_ENTID')
    InsertSQL.Strings = (
      'insert into FI_VALOR_REGRA'
      '  (CD_TIPO_VALOR, CD_PESSOA_ENTID, IDREGRA, NO_TABELA, '
      'NO_ATRIBUTO, IR_IMPORTA)'
      'values'
      '  (:CD_TIPO_VALOR, :CD_PESSOA_ENTID, :IDREGRA, :NO_TABELA, '
      ':NO_ATRIBUTO, '
      '   :IR_IMPORTA)')
    DeleteSQL.Strings = (
      'delete from FI_VALOR_REGRA'
      'where'
      '  CD_TIPO_VALOR = :OLD_CD_TIPO_VALOR and'
      '  CD_PESSOA_ENTID = :OLD_CD_PESSOA_ENTID')
    Left = 290
    Top = 136
  end
  object QryPrincipal: TwwQuery
    CachedUpdates = True
    BeforePost = QryPrincipalBeforePost
    AfterPost = QryPrincipalAfterPost
    AfterDelete = QryPrincipalAfterDelete
    DatabaseName = 'BaseDados'
    SQL.Strings = (
      'SELECT * FROM'
      'FI_VALOR_REGRA')
    UpdateObject = UpdtSQLPrincipal
    ValidateWithMask = True
    Left = 234
    Top = 136
    object QryPrincipalds_tipo_valor: TStringField
      DisplayLabel = 'Tipo de Valor'
      DisplayWidth = 31
      FieldKind = fkLookup
      FieldName = 'ds_tipo_valor'
      LookupDataSet = qryTipoValor
      LookupKeyFields = 'CD_TIPO_VALOR'
      LookupResultField = 'DS_TIPO_VALOR'
      KeyFields = 'CD_TIPO_VALOR'
      Size = 60
      Lookup = True
    end
    object QryPrincipalds_regra: TStringField
      DisplayLabel = 'Regra'
      DisplayWidth = 21
      FieldKind = fkLookup
      FieldName = 'ds_regra'
      LookupDataSet = qryRegra
      LookupKeyFields = 'IDREGRA'
      LookupResultField = 'NOMEREGRA'
      KeyFields = 'IDREGRA'
      Size = 60
      Lookup = True
    end
    object QryPrincipalds_importa: TStringField
      DisplayLabel = 'Importar'
      DisplayWidth = 6
      FieldKind = fkLookup
      FieldName = 'ds_importa'
      LookupDataSet = QrySimNao
      LookupKeyFields = 'COD'
      LookupResultField = 'DESCR'
      KeyFields = 'IR_IMPORTA'
      Size = 60
      Lookup = True
    end
    object QryPrincipalCD_TIPO_VALOR: TFloatField
      DisplayWidth = 10
      FieldName = 'CD_TIPO_VALOR'
      Origin = 'BASEDADOS.FI_VALOR_REGRA.CD_TIPO_VALOR'
      Visible = False
    end
    object QryPrincipalCD_PESSOA_ENTID: TFloatField
      DisplayWidth = 10
      FieldName = 'CD_PESSOA_ENTID'
      Origin = 'BASEDADOS.FI_VALOR_REGRA.CD_PESSOA_ENTID'
      Visible = False
    end
    object QryPrincipalIDREGRA: TFloatField
      DisplayWidth = 10
      FieldName = 'IDREGRA'
      Origin = 'BASEDADOS.FI_VALOR_REGRA.IDREGRA'
      Visible = False
    end
    object QryPrincipalNO_TABELA: TStringField
      DisplayWidth = 60
      FieldName = 'NO_TABELA'
      Origin = 'BASEDADOS.FI_VALOR_REGRA.NO_TABELA'
      Visible = False
      FixedChar = True
      Size = 60
    end
    object QryPrincipalNO_ATRIBUTO: TStringField
      DisplayWidth = 60
      FieldName = 'NO_ATRIBUTO'
      Origin = 'BASEDADOS.FI_VALOR_REGRA.NO_ATRIBUTO'
      Visible = False
      FixedChar = True
      Size = 60
    end
    object QryPrincipalIR_IMPORTA: TStringField
      DisplayWidth = 1
      FieldName = 'IR_IMPORTA'
      Origin = 'BASEDADOS.FI_VALOR_REGRA.IR_IMPORTA'
      Visible = False
      FixedChar = True
      Size = 1
    end
  end
  object MontaSelect: TMontaSelect
    Template.IdConsulta = 0
    Caption = 'Seleciona'
    Colunas.Strings = (
      'FI_TIPO_VALOR.DS_TIPO_VALOR'
      'REGRA.NOMEREGRA')
    TipodeDado.Strings = (
      'C'
      'C')
    Descricao.Strings = (
      'Tipo de Valor'
      'Regra')
    SensivelACaixa.Strings = (
      'N'
      'N')
    Tabelas.Strings = (
      'FI_VALOR_REGRA'
      'FI_TIPO_VALOR'
      'REGRA')
    CamposChave.Strings = (
      'FI_VALOR_REGRA.CD_TIPO_VALOR'
      'FI_VALOR_REGRA.CD_PESSOA_ENTID')
    Filtro.Strings = (
      'FI_VALOR_REGRA.CD_TIPO_VALOR = FI_TIPO_VALOR.CD_TIPO_VALOR'
      'FI_VALOR_REGRA.IDREGRA = REGRA.IDREGRA')
    Mascaras.Strings = (
      ''
      '')
    Larguras.Strings = (
      '60'
      '60')
    DataBaseName = 'BaseDados'
    RepeteConsulta = False
    UsaDistinct = False
    SalvaConsulta = False
    ExibePergunta = True
    MultiSelect = False
    Left = 288
    Top = 79
  end
  object QrySimNao: TwwQuery
    DatabaseName = 'BaseDados'
    SQL.Strings = (
      'SELECT '#39'S'#39' COD, '#39'Sim'#39' DESCR'
      'FROM DUAL'
      ''
      'UNION'
      ''
      'SELECT '#39'N'#39' COD, '#39'Não'#39' DESCR'
      'FROM DUAL')
    ValidateWithMask = True
    Left = 290
    Top = 164
    object QrySimNaoCOD: TStringField
      FieldName = 'COD'
      FixedChar = True
      Size = 1
    end
    object QrySimNaoDESCR: TStringField
      FieldName = 'DESCR'
      FixedChar = True
      Size = 3
    end
  end
end
