inherited frmCadGrdValorHist: TfrmCadGrdValorHist
  Left = 216
  Top = 130
  Width = 508
  Height = 324
  Caption = 'Base de Histórico  - Valores'
  PixelsPerInch = 96
  TextHeight = 13
  inherited pnlFundo: TPanel
    Width = 500
    Height = 211
    inherited dbGrd: TwwDBGrid [0]
      Width = 490
      Height = 201
      Selected.Strings = (
        'DS_TIPO_VALOR'#9'45'#9'Tipo do Valor'
        'VL_PARTICIPANTE'#9'10'#9'Valor')
      Color = clSilver
      ReadOnly = True
    end
    inherited pnlControles: TPanel [1]
      Width = 490
      Height = 201
      object Label8: TLabel
        Left = 40
        Top = 80
        Width = 30
        Height = 13
        Caption = 'Valor'
      end
      object Label4: TLabel
        Left = 40
        Top = 28
        Width = 77
        Height = 13
        Caption = 'Tipo de Valor'
      end
      object LkcTbTipoValor: TwwDBLookupCombo
        Left = 40
        Top = 43
        Width = 296
        Height = 21
        DropDownAlignment = taLeftJustify
        Selected.Strings = (
          'DS_TIPO_VALOR'#9'60'#9'Tipo de Valor')
        DataField = 'CD_TIPO_VALOR'
        DataSource = ds
        LookupTable = qryTipoValor
        LookupField = 'CD_TIPO_VALOR'
        Options = [loColLines, loRowLines]
        TabOrder = 0
        AutoDropDown = True
        ShowButton = True
        AllowClearKey = False
        ShowMatchText = True
      end
      object EdtValor: TEdit
        Left = 40
        Top = 95
        Width = 121
        Height = 21
        TabOrder = 1
      end
    end
  end
  inherited Dock972: TDock97
    Width = 500
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
    Top = 258
    Width = 500
    inherited tb97Fundo: TToolbar97
      Left = 330
      DockPos = 330
    end
    inherited TB97oKCancelar: TToolbar97
      Left = 162
      DockPos = 162
    end
    inherited dbnav: TDBNavigator
      Left = 34
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
    Left = 398
    Top = 16
  end
  inherited seldlgProcuraQry: TcmSelectDlg
    Left = 429
    Top = 14
  end
  object qryTipoValor: TwwQuery
    DatabaseName = 'BaseDados'
    SQL.Strings = (
      'Select *'
      'from FI_TIPO_VALOR'
      'order by DS_TIPO_VALOR')
    ValidateWithMask = True
    Left = 228
    Top = 90
    object qryTipoValorDS_TIPO_VALOR: TStringField
      DisplayLabel = 'Tipo de Valor'
      DisplayWidth = 60
      FieldName = 'DS_TIPO_VALOR'
      Origin = 'FI_TIPO_VALOR.DS_TIPO_VALOR'
      Size = 60
    end
    object qryTipoValorCD_TIPO_VALOR: TFloatField
      FieldName = 'CD_TIPO_VALOR'
      Origin = 'FI_TIPO_VALOR.CD_TIPO_VALOR'
      Visible = False
    end
  end
  object dsTipoValor: TwwDataSource
    AutoEdit = False
    DataSet = qryTipoValor
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
      'Select b.DS_TIPO_VALOR, a.*'
      'from FI_BK_VALOR_PARTICIPANTE a, FI_TIPO_VALOR b'
      'where a.CD_VERSAO = :CD_VERSAO'
      '   and a.CD_PARTIC = :CD_PARTIC'
      '   and a.CD_TIPO_VALOR = b.CD_TIPO_VALOR'
      'order by b.DS_TIPO_VALOR, a.VL_PARTICIPANTE')
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
      end>
    object qryPrincipalDS_TIPO_VALOR: TStringField
      FieldName = 'DS_TIPO_VALOR'
      Origin = 'FI_BK_VALOR_PARTICIPANTE.CD_VERSAO'
      Size = 60
    end
    object qryPrincipalCD_VERSAO: TFloatField
      FieldName = 'CD_VERSAO'
      Origin = 'FI_BK_VALOR_PARTICIPANTE.CD_PARTIC'
    end
    object qryPrincipalCD_PARTIC: TFloatField
      FieldName = 'CD_PARTIC'
      Origin = 'FI_BK_VALOR_PARTICIPANTE.CD_TIPO_VALOR'
    end
    object qryPrincipalCD_TIPO_VALOR: TFloatField
      FieldName = 'CD_TIPO_VALOR'
      Origin = 'FI_BK_VALOR_PARTICIPANTE.VL_PARTICIPANTE'
    end
    object qryPrincipalVL_PARTICIPANTE: TFloatField
      FieldName = 'VL_PARTICIPANTE'
      Origin = 'FI_TIPO_VALOR.DS_TIPO_VALOR'
      DisplayFormat = '#,###,###,##0.00000000'
    end
  end
  object UpdtSQLPrincipal: TUpdateSQL
    ModifySQL.Strings = (
      'update FI_BK_VALOR_PARTICIPANTE'
      'set'
      '  VL_PARTICIPANTE = :VL_PARTICIPANTE'
      'where'
      '  CD_VERSAO = :OLD_CD_VERSAO and'
      '  CD_PARTIC = :OLD_CD_PARTIC and'
      '  CD_TIPO_VALOR = :OLD_CD_TIPO_VALOR')
    InsertSQL.Strings = (
      'insert into FI_BK_VALOR_PARTICIPANTE'
      '  (CD_VERSAO, CD_PARTIC, CD_TIPO_VALOR, VL_PARTICIPANTE)'
      'values'
      '  (:CD_VERSAO, :CD_PARTIC, :CD_TIPO_VALOR, :VL_PARTICIPANTE)')
    DeleteSQL.Strings = (
      'delete from FI_BK_VALOR_PARTICIPANTE'
      'where'
      '  CD_VERSAO = :OLD_CD_VERSAO and'
      '  CD_PARTIC = :OLD_CD_PARTIC and'
      '  CD_TIPO_VALOR = :OLD_CD_TIPO_VALOR')
    Left = 300
    Top = 23
  end
  object MontaSelect: TMontaSelect
    Template.IdConsulta = 0
    Caption = 'Seleciona'
    Colunas.Strings = (
      'FI_TIPO_VALOR.DS_TIPO_VALOR')
    TipodeDado.Strings = (
      'C')
    Descricao.Strings = (
      'Tipo de Valor')
    SensivelACaixa.Strings = (
      'N')
    Tabelas.Strings = (
      'FI_BK_VALOR_PARTICIPANTE'
      'FI_TIPO_VALOR')
    CamposChave.Strings = (
      'FI_BK_VALOR_PARTICIPANTE.CD_VERSAO'
      'FI_BK_VALOR_PARTICIPANTE.CD_PARTIC'
      'FI_BK_VALOR_PARTICIPANTE.CD_TIPO_VALOR')
    Filtro.Strings = (
      
        'FI_BK_VALOR_PARTICIPANTE.CD_TIPO_VALOR = FI_TIPO_VALOR.CD_TIPO_V' +
        'ALOR')
    Mascaras.Strings = (
      '')
    Larguras.Strings = (
      '60')
    DataBaseName = 'BaseDados'
    RepeteConsulta = False
    UsaDistinct = False
    SalvaConsulta = False
    ExibePergunta = True
    Left = 205
    Top = 60
  end
end
