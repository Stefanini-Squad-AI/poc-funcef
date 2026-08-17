inherited frmCadTempoRegra: TfrmCadTempoRegra
  Left = 460
  Top = 283
  HelpContext = 40178
  Caption = 'Cadastrar Relacionamento Tempos / Regras'
  ClientHeight = 362
  ClientWidth = 527
  PixelsPerInch = 96
  TextHeight = 13
  inherited pnlFundo: TPanel
    Width = 527
    Height = 276
    object DBGrid1: TDBGrid
      Left = 5
      Top = 5
      Width = 517
      Height = 266
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
          FieldName = 'ds_tipo_tempo'
          Width = 231
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'ds_regra'
          Width = 195
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
    Width = 527
  end
  inherited Dock971: TDock97
    Top = 323
    Width = 527
    inherited tb97Fundo: TToolbar97
      Left = 357
    end
    inherited TB97oKCancelar: TToolbar97
      Left = 190
    end
    inherited dbnav: TDBNavigator
      Hints.Strings = ()
    end
  end
  inherited ivTradutor: TIvExtendedTranslator
    Left = 353
  end
  inherited ds: TwwDataSource
    DataSet = QryPrincipal
    Left = 327
    Top = 111
  end
  inherited ImlPadrao: TImageList
    Left = 312
  end
  inherited srchdlgProcura: TwwSearchDialog
    Left = 336
    Top = 200
  end
  inherited seldlgProcuraQry: TcmSelectDlg
    Left = 377
    Top = 200
  end
  inherited CmeCadastro: TCmEventosCadastro
    Left = 295
    Top = 200
  end
  object qryTipoTempo: TwwQuery
    DatabaseName = 'BaseDados'
    SQL.Strings = (
      'SELECT * '
      'FROM FI_TIPO_TEMPO'
      'ORDER BY DS_TIPO_TEMPO')
    ValidateWithMask = True
    Left = 299
    Top = 139
    object qryTipoTempoDS_TIPO_TEMPO: TStringField
      DisplayLabel = 'Tipo de Tempos'
      DisplayWidth = 60
      FieldName = 'DS_TIPO_TEMPO'
      Origin = 'BASEDADOS.FI_TIPO_TEMPO.DS_TIPO_TEMPO'
      FixedChar = True
      Size = 60
    end
    object qryTipoTempoCD_TIPO_TEMPO: TFloatField
      FieldName = 'CD_TIPO_TEMPO'
      Origin = 'BASEDADOS.FI_TIPO_TEMPO.CD_TIPO_TEMPO'
      Visible = False
    end
    object qryTipoTempoIR_DOMINIO_SISTEMA: TStringField
      FieldName = 'IR_DOMINIO_SISTEMA'
      Origin = 'BASEDADOS.FI_TIPO_TEMPO.IR_DOMINIO_SISTEMA'
      Visible = False
      FixedChar = True
      Size = 3
    end
  end
  object qryRegra: TwwQuery
    DatabaseName = 'BaseDados'
    SQL.Strings = (
      'SELECT IDREGRA, NOMEREGRA'
      'FROM REGRA'
      'ORDER BY NOMEREGRA')
    ValidateWithMask = True
    Left = 327
    Top = 139
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
      'update FI_TEMPO_REGRA'
      'set'
      '  IDREGRA = :IDREGRA,'
      '  NO_TABELA = :NO_TABELA,'
      '  NO_ATRIBUTO = :NO_ATRIBUTO,'
      '  IR_IMPORTA = :IR_IMPORTA'
      'where'
      '  CD_TIPO_TEMPO = :OLD_CD_TIPO_TEMPO and'
      '  CD_PESSOA_ENTID = :OLD_CD_PESSOA_ENTID')
    InsertSQL.Strings = (
      'insert into FI_TEMPO_REGRA'
      '  (CD_TIPO_TEMPO, CD_PESSOA_ENTID, IDREGRA, NO_TABELA, '
      'NO_ATRIBUTO, IR_IMPORTA)'
      'values'
      '  (:CD_TIPO_TEMPO, :CD_PESSOA_ENTID, :IDREGRA, :NO_TABELA, '
      ':NO_ATRIBUTO, '
      '   :IR_IMPORTA)')
    DeleteSQL.Strings = (
      'delete from FI_TEMPO_REGRA'
      'where'
      '  CD_TIPO_TEMPO = :OLD_CD_TIPO_TEMPO and'
      '  CD_PESSOA_ENTID = :OLD_CD_PESSOA_ENTID')
    Left = 355
    Top = 111
  end
  object QryPrincipal: TwwQuery
    CachedUpdates = True
    BeforePost = QryPrincipalBeforePost
    AfterPost = QryPrincipalAfterPost
    AfterDelete = QryPrincipalAfterDelete
    DatabaseName = 'BaseDados'
    SQL.Strings = (
      'SELECT * FROM'
      'FI_TEMPO_REGRA')
    UpdateObject = UpdtSQLPrincipal
    ValidateWithMask = True
    Left = 299
    Top = 111
    object QryPrincipalds_tipo_tempo: TStringField
      DisplayLabel = 'Tipo de Tempo'
      DisplayWidth = 30
      FieldKind = fkLookup
      FieldName = 'ds_tipo_tempo'
      LookupDataSet = qryTipoTempo
      LookupKeyFields = 'CD_TIPO_TEMPO'
      LookupResultField = 'DS_TIPO_TEMPO'
      KeyFields = 'CD_TIPO_TEMPO'
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
      DisplayWidth = 7
      FieldKind = fkLookup
      FieldName = 'ds_importa'
      LookupDataSet = QrySimNao
      LookupKeyFields = 'COD'
      LookupResultField = 'DESCR'
      KeyFields = 'IR_IMPORTA'
      Size = 60
      Lookup = True
    end
    object QryPrincipalCD_TIPO_TEMPO: TFloatField
      DisplayWidth = 10
      FieldName = 'CD_TIPO_TEMPO'
      Origin = 'BASEDADOS.FI_TEMPO_REGRA.CD_TIPO_TEMPO'
      Visible = False
    end
    object QryPrincipalCD_PESSOA_ENTID: TFloatField
      DisplayWidth = 10
      FieldName = 'CD_PESSOA_ENTID'
      Origin = 'BASEDADOS.FI_TEMPO_REGRA.CD_PESSOA_ENTID'
      Visible = False
    end
    object QryPrincipalIDREGRA: TFloatField
      DisplayWidth = 10
      FieldName = 'IDREGRA'
      Origin = 'BASEDADOS.FI_TEMPO_REGRA.IDREGRA'
      Visible = False
    end
    object QryPrincipalNO_TABELA: TStringField
      DisplayWidth = 60
      FieldName = 'NO_TABELA'
      Origin = 'BASEDADOS.FI_TEMPO_REGRA.NO_TABELA'
      Visible = False
      FixedChar = True
      Size = 60
    end
    object QryPrincipalNO_ATRIBUTO: TStringField
      DisplayWidth = 60
      FieldName = 'NO_ATRIBUTO'
      Origin = 'BASEDADOS.FI_TEMPO_REGRA.NO_ATRIBUTO'
      Visible = False
      FixedChar = True
      Size = 60
    end
    object QryPrincipalIR_IMPORTA: TStringField
      DisplayWidth = 1
      FieldName = 'IR_IMPORTA'
      Origin = 'BASEDADOS.FI_TEMPO_REGRA.IR_IMPORTA'
      Visible = False
      FixedChar = True
      Size = 1
    end
  end
  object MontaSelect: TMontaSelect
    Template.IdConsulta = 0
    Caption = 'Seleciona'
    Colunas.Strings = (
      'FI_TIPO_TEMPO.DS_TIPO_TEMPO'
      'REGRA.NOMEREGRA')
    TipodeDado.Strings = (
      'C'
      'C')
    Descricao.Strings = (
      'Tipo de Tempo'
      'Regra')
    SensivelACaixa.Strings = (
      'N'
      'N')
    Tabelas.Strings = (
      'FI_TEMPO_REGRA'
      'FI_TIPO_TEMPO'
      'REGRA')
    CamposChave.Strings = (
      'FI_TEMPO_REGRA.CD_TIPO_TEMPO'
      'FI_TEMPO_REGRA.CD_PESSOA_ENTID')
    Filtro.Strings = (
      'FI_TEMPO_REGRA.CD_TIPO_TEMPO = FI_TIPO_TEMPO.CD_TIPO_TEMPO'
      'FI_TEMPO_REGRA.IDREGRA = REGRA.IDREGRA')
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
    Left = 355
    Top = 139
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
