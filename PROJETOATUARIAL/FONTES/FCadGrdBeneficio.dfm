inherited frmCadGrdBeneficio: TfrmCadGrdBeneficio
  Left = 186
  Top = 145
  Width = 582
  Height = 367
  Caption = 'Benefícios'
  PixelsPerInch = 96
  TextHeight = 13
  inherited pnlFundo: TPanel
    Width = 574
    Height = 254
    inherited dbGrd: TwwDBGrid [0]
      Width = 572
      Height = 252
      Selected.Strings = (
        'DS_TIPO_BENEF'#9'45'#9'Tipo do Benefício')
    end
    inherited pnlControles: TPanel [1]
      Width = 572
      Height = 252
      object Label4: TLabel
        Left = 40
        Top = 28
        Width = 103
        Height = 13
        Caption = 'Tipo de Benefício'
      end
      object LkcTbBeneficio: TwwDBLookupCombo
        Left = 40
        Top = 43
        Width = 391
        Height = 21
        DropDownAlignment = taLeftJustify
        Selected.Strings = (
          'DS_TIPO_BENEF'#9'60'#9'Tipo do Benefício')
        DataField = 'CD_TIPO_BENEF'
        DataSource = ds
        LookupTable = qryBeneficio
        LookupField = 'CD_TIPO_BENEF'
        Options = [loColLines, loRowLines]
        TabOrder = 0
        AutoDropDown = True
        ShowButton = True
        AllowClearKey = False
        ShowMatchText = True
      end
    end
  end
  inherited Dock972: TDock97
    Width = 574
  end
  inherited Dock971: TDock97
    Top = 301
    Width = 574
    inherited tb97Fundo: TToolbar97
      Left = 402
      DockPos = 405
      TabOrder = 2
    end
    inherited TB97oKCancelar: TToolbar97
      Left = 233
      DockPos = 236
      TabOrder = 1
    end
    inherited dbnav: TDBNavigator
      Left = 64
      Hints.Strings = ()
    end
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
  inherited ds: TwwDataSource
    DataSet = qryPrincipal
    Left = 268
    Top = 23
  end
  inherited srchdlgProcura: TwwSearchDialog
    Left = 413
    Top = 11
  end
  inherited seldlgProcuraQry: TcmSelectDlg
    Left = 449
    Top = 14
  end
  object qryBeneficio: TwwQuery
    DatabaseName = 'BaseDados'
    DataSource = ds
    SQL.Strings = (
      'Select a.*'
      'from FI_TIPO_BENEFICIO a, FI_PLANO_BENEFICIO b'
      'where a.CD_TIPO_BENEF = b.CD_TIPO_BENEF'
      '   and b.CD_PESSOA_PATROC = :CD_PESSOA_PATROC'
      '   and b.CD_PESSOA_ENTID = :CD_PESSOA_ENTID'
      '   and b.CD_PLANO = :CD_PLANO'
      'order by DS_TIPO_BENEF')
    ValidateWithMask = True
    Left = 228
    Top = 90
    ParamData = <
      item
        DataType = ftFloat
        Name = 'CD_PESSOA_PATROC'
        ParamType = ptUnknown
      end
      item
        DataType = ftFloat
        Name = 'CD_PESSOA_ENTID'
        ParamType = ptUnknown
      end
      item
        DataType = ftFloat
        Name = 'CD_PLANO'
        ParamType = ptUnknown
      end>
    object qryBeneficioCD_TIPO_BENEF: TFloatField
      FieldName = 'CD_TIPO_BENEF'
      Origin = 'FI_TIPO_BENEFICIO.CD_TIPO_BENEF'
    end
    object qryBeneficioSG_TIPO_BENEF: TStringField
      FieldName = 'SG_TIPO_BENEF'
      Origin = 'FI_TIPO_BENEFICIO.SG_TIPO_BENEF'
      Size = 5
    end
    object qryBeneficioDS_TIPO_BENEF: TStringField
      FieldName = 'DS_TIPO_BENEF'
      Origin = 'FI_TIPO_BENEFICIO.DS_TIPO_BENEF'
      Size = 60
    end
  end
  object dsBeneficio: TwwDataSource
    AutoEdit = False
    DataSet = qryBeneficio
    Left = 261
    Top = 90
  end
  object qryPrincipal: TwwQuery
    CachedUpdates = True
    AfterOpen = qryPrincipalAfterOpen
    BeforePost = qryPrincipalBeforePost
    AfterPost = qryPrincipalAfterPost
    DatabaseName = 'BaseDados'
    SQL.Strings = (
      'Select b.DS_TIPO_BENEF, a.*'
      'from FI_BENEFICIO_CONCEDIDO a, FI_TIPO_BENEFICIO b'
      'where a.CD_VERSAO = :CD_VERSAO'
      '   and a.CD_PARTIC = :CD_PARTIC'
      '   and a.CD_PESSOA_PATROC = :CD_PESSOA_PATROC'
      '   and a.CD_PESSOA_ENTID = :CD_PESSOA_ENTID'
      '   and a.CD_TIPO_BENEF = b.CD_TIPO_BENEF'
      'order by b.DS_TIPO_BENEF')
    UpdateObject = UpdtSQLPrincipal
    ValidateWithMask = True
    Left = 238
    Top = 23
    ParamData = <
      item
        DataType = ftInteger
        Name = 'CD_VERSAO'
        ParamType = ptUnknown
      end
      item
        DataType = ftInteger
        Name = 'CD_PARTIC'
        ParamType = ptUnknown
      end
      item
        DataType = ftInteger
        Name = 'CD_PESSOA_PATROC'
        ParamType = ptUnknown
      end
      item
        DataType = ftInteger
        Name = 'CD_PESSOA_ENTID'
        ParamType = ptUnknown
      end>
    object qryPrincipalDS_TIPO_BENEF: TStringField
      FieldName = 'DS_TIPO_BENEF'
      Origin = 'FI_BENEFICIO_CONCEDIDO.CD_VERSAO'
      Size = 60
    end
    object qryPrincipalCD_VERSAO: TFloatField
      FieldName = 'CD_VERSAO'
      Origin = 'FI_BENEFICIO_CONCEDIDO.CD_PARTIC'
    end
    object qryPrincipalCD_PARTIC: TFloatField
      FieldName = 'CD_PARTIC'
      Origin = 'FI_BENEFICIO_CONCEDIDO.CD_TIPO_BENEF'
    end
    object qryPrincipalCD_TIPO_BENEF: TFloatField
      FieldName = 'CD_TIPO_BENEF'
      Origin = 'FI_BENEFICIO_CONCEDIDO.CD_PESSOA_PATROC'
    end
    object qryPrincipalCD_PESSOA_PATROC: TFloatField
      FieldName = 'CD_PESSOA_PATROC'
      Origin = 'FI_BENEFICIO_CONCEDIDO.CD_PESSOA_ENTID'
    end
    object qryPrincipalCD_PESSOA_ENTID: TFloatField
      FieldName = 'CD_PESSOA_ENTID'
      Origin = 'FI_BENEFICIO_CONCEDIDO.CD_PLANO'
    end
    object qryPrincipalCD_PLANO: TFloatField
      FieldName = 'CD_PLANO'
      Origin = 'FI_TIPO_BENEFICIO.DS_TIPO_BENEF'
    end
  end
  object UpdtSQLPrincipal: TUpdateSQL
    ModifySQL.Strings = (
      'update FI_BENEFICIO_CONCEDIDO'
      'set'
      '  CD_PESSOA_PATROC = :CD_PESSOA_PATROC,'
      '  CD_PESSOA_ENTID = :CD_PESSOA_ENTID,'
      '  CD_PLANO = :CD_PLANO'
      'where'
      '  CD_VERSAO = :OLD_CD_VERSAO and'
      '  CD_PARTIC = :OLD_CD_PARTIC and'
      '  CD_TIPO_BENEF = :OLD_CD_TIPO_BENEF')
    InsertSQL.Strings = (
      'insert into FI_BENEFICIO_CONCEDIDO'
      '  (CD_VERSAO, CD_PARTIC, CD_TIPO_BENEF, CD_PESSOA_PATROC, '
      '   CD_PESSOA_ENTID, CD_PLANO)'
      'values'
      '  (:CD_VERSAO, :CD_PARTIC, :CD_TIPO_BENEF, :CD_PESSOA_PATROC, '
      '   :CD_PESSOA_ENTID, :CD_PLANO)')
    DeleteSQL.Strings = (
      'delete from FI_BENEFICIO_CONCEDIDO'
      'where'
      '  CD_VERSAO = :OLD_CD_VERSAO and'
      '  CD_PARTIC = :OLD_CD_PARTIC and'
      '  CD_TIPO_BENEF = :OLD_CD_TIPO_BENEF')
    Left = 300
    Top = 23
  end
  object MontaSelect: TMontaSelect
    Template.IdConsulta = 0
    Caption = 'Seleciona'
    Colunas.Strings = (
      'FI_TIPO_BENEFICIO.DS_TIPO_BENEF')
    TipodeDado.Strings = (
      'C')
    Descricao.Strings = (
      'Tipo de Beneficio')
    SensivelACaixa.Strings = (
      'N')
    Tabelas.Strings = (
      'FI_BENEFICIO_CONCEDIDO'
      'FI_TIPO_BENEFICIO')
    CamposChave.Strings = (
      'FI_BENEFICIO_CONCEDIDO.CD_VERSAO'
      'FI_BENEFICIO_CONCEDIDO.CD_PARTIC'
      'FI_BENEFICIO_CONCEDIDO.CD_TIPO_BENEF')
    Filtro.Strings = (
      
        'FI_BENEFICIO_CONCEDIDO.CD_TIPO_BENEF = FI_TIPO_BENEFICIO.CD_TIPO' +
        '_BENEF')
    Mascaras.Strings = (
      '')
    Larguras.Strings = (
      '60')
    DataBaseName = 'BaseDados'
    RepeteConsulta = False
    UsaDistinct = False
    SalvaConsulta = False
    ExibePergunta = True
    MultiSelect = False
    Left = 240
    Top = 128
  end
end
