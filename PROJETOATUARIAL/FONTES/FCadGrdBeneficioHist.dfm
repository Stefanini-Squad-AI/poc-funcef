inherited frmCadGrdBeneficioHist: TfrmCadGrdBeneficioHist
  Left = 186
  Top = 145
  Width = 582
  Height = 367
  Caption = 'Base de Histórico  - Benefícios'
  PixelsPerInch = 96
  TextHeight = 13
  inherited pnlFundo: TPanel
    Width = 574
    Height = 254
    inherited pnlControles: TPanel
      Width = 564
      Height = 244
    end
    inherited dbGrd: TwwDBGrid
      Width = 564
      Height = 244
      Selected.Strings = (
        'DS_TIPO_BENEF'#9'45'#9'Tipo do Benefício'
        'PC_CONTRIBUICAO'#9'10'#9'Percentual de Contribuição')
      Color = clSilver
      ReadOnly = True
    end
  end
  inherited Dock972: TDock97
    Width = 574
    inherited Toolbar971: TToolbar97
      inherited sbtnInserir: TToolbarButton97
        Width = 18
        Visible = False
      end
      inherited sbtnAlterar: TToolbarButton97
        Left = 18
        Width = 18
        Visible = False
      end
      inherited sbtnProcurar: TToolbarButton97
        Left = 54
      end
      inherited sbtnApagar: TToolbarButton97
        Left = 36
        Width = 18
        Visible = False
      end
    end
  end
  inherited Dock971: TDock97
    Top = 301
    Width = 574
    inherited tb97Fundo: TToolbar97
      Left = 404
      DockPos = 404
      TabOrder = 2
    end
    inherited TB97oKCancelar: TToolbar97
      Left = 236
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
  object qryPrincipal: TwwQuery
    CachedUpdates = True
    AfterOpen = qryPrincipalAfterOpen
    BeforePost = qryPrincipalBeforePost
    AfterPost = qryPrincipalAfterPost
    DatabaseName = 'BaseDados'
    SQL.Strings = (
      'Select b.DS_TIPO_BENEF, a.*'
      'from FI_BK_BENEFICIO_CONCEDIDO a, FI_TIPO_BENEFICIO b'
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
      Origin = 'FI_BK_BENEFICIO_CONCEDIDO.CD_VERSAO'
      Size = 60
    end
    object qryPrincipalCD_VERSAO: TFloatField
      FieldName = 'CD_VERSAO'
      Origin = 'FI_BK_BENEFICIO_CONCEDIDO.CD_PARTIC'
    end
    object qryPrincipalCD_PARTIC: TFloatField
      FieldName = 'CD_PARTIC'
      Origin = 'FI_BK_BENEFICIO_CONCEDIDO.CD_TIPO_BENEF'
    end
    object qryPrincipalCD_TIPO_BENEF: TFloatField
      FieldName = 'CD_TIPO_BENEF'
      Origin = 'FI_BK_BENEFICIO_CONCEDIDO.CD_PESSOA_PATROC'
    end
    object qryPrincipalCD_PESSOA_PATROC: TFloatField
      FieldName = 'CD_PESSOA_PATROC'
      Origin = 'FI_BK_BENEFICIO_CONCEDIDO.CD_PESSOA_ENTID'
    end
    object qryPrincipalCD_PESSOA_ENTID: TFloatField
      FieldName = 'CD_PESSOA_ENTID'
      Origin = 'FI_BK_BENEFICIO_CONCEDIDO.CD_PLANO'
    end
    object qryPrincipalCD_PLANO: TFloatField
      FieldName = 'CD_PLANO'
      Origin = 'FI_TIPO_BENEFICIO.DS_TIPO_BENEF'
    end
  end
  object UpdtSQLPrincipal: TUpdateSQL
    ModifySQL.Strings = (
      'update FI_BK_BENEFICIO_CONCEDIDO'
      'set'
      '  PC_CONTRIBUICAO = :PC_CONTRIBUICAO'
      'where'
      '  CD_VERSAO = :OLD_CD_VERSAO and'
      '  CD_PARTIC = :OLD_CD_PARTIC')
    InsertSQL.Strings = (
      'insert into FI_BK_BENEFICIO_CONCEDIDO'
      '  (CD_VERSAO, CD_PARTIC, CD_PESSOA_PATROC, CD_PESSOA_ENTID, '
      '   CD_PLANO, CD_TIPO_BENEF, PC_CONTRIBUICAO)'
      'values'
      '  (:CD_VERSAO, :CD_PARTIC, :CD_PESSOA_PATROC, :CD_PESSOA_ENTID, '
      '   :CD_PLANO, :CD_TIPO_BENEF, :PC_CONTRIBUICAO)')
    DeleteSQL.Strings = (
      'delete from FI_BK_BENEFICIO_CONCEDIDO'
      'where'
      '  CD_VERSAO = :OLD_CD_VERSAO and'
      '  CD_PARTIC = :OLD_CD_PARTIC')
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
      'FI_BK_BENEFICIO_CONCEDIDO'
      'FI_TIPO_BENEFICIO')
    CamposChave.Strings = (
      'FI_BK_BENEFICIO_CONCEDIDO.CD_VERSAO'
      'FI_BK_BENEFICIO_CONCEDIDO.CD_PARTIC'
      'FI_BK_BENEFICIO_CONCEDIDO.CD_TIPO_BENEF')
    Filtro.Strings = (
      
        'FI_BK_BENEFICIO_CONCEDIDO.CD_TIPO_BENEF = FI_TIPO_BENEFICIO.CD_T' +
        'IPO_BENEF')
    Mascaras.Strings = (
      '')
    Larguras.Strings = (
      '60')
    DataBaseName = 'BaseDados'
    RepeteConsulta = False
    UsaDistinct = False
    SalvaConsulta = False
    ExibePergunta = True
    Left = 192
    Top = 63
  end
end
