inherited frmCadGrdValorBeneficiario: TfrmCadGrdValorBeneficiario
  Left = 136
  Top = 126
  Width = 565
  Height = 324
  Caption = 'Valores'
  PixelsPerInch = 96
  TextHeight = 13
  inherited pnlFundo: TPanel
    Width = 557
    Height = 211
    inherited pnlControles: TPanel
      Width = 555
      Height = 209
      object Label8: TLabel
        Left = 23
        Top = 80
        Width = 30
        Height = 13
        Caption = 'Valor'
      end
      object Label4: TLabel
        Left = 23
        Top = 28
        Width = 77
        Height = 13
        Caption = 'Tipo de Valor'
      end
      object LkcTbTipoValor: TwwDBLookupCombo
        Left = 23
        Top = 43
        Width = 413
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
        Left = 23
        Top = 95
        Width = 168
        Height = 21
        TabOrder = 1
      end
    end
    inherited dbGrd: TwwDBGrid
      Width = 555
      Height = 209
      Selected.Strings = (
        'DS_TIPO_VALOR'#9'45'#9'Tipo do Valor'
        'VL_PARTICIPANTE'#9'18'#9'Valor')
    end
  end
  inherited Dock972: TDock97
    Width = 557
  end
  inherited Dock971: TDock97
    Top = 258
    Width = 557
    inherited tb97Fundo: TToolbar97
      Left = 331
      DockPos = 331
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
    Left = 253
    Top = 80
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
    Left = 253
    Top = 140
  end
  inherited ImlPadrao: TImageList
    Left = 225
    Top = 80
  end
  inherited srchdlgProcura: TwwSearchDialog
    Left = 225
    Top = 110
  end
  inherited seldlgProcuraQry: TcmSelectDlg
    Left = 253
    Top = 110
  end
  inherited CmeCadastro: TCmEventosCadastro
    Left = 281
    Top = 80
  end
  object qryTipoValor: TwwQuery
    DatabaseName = 'BaseDados'
    SQL.Strings = (
      'Select *'
      'from FI_TIPO_VALOR'
      'order by DS_TIPO_VALOR')
    ValidateWithMask = True
    Left = 225
    Top = 168
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
    Left = 253
    Top = 168
  end
  object qryPrincipal: TwwQuery
    CachedUpdates = True
    AfterOpen = qryPrincipalAfterOpen
    BeforePost = qryPrincipalBeforePost
    AfterPost = qryPrincipalAfterPost
    DatabaseName = 'BaseDados'
    SQL.Strings = (
      'SELECT FI_TIPO_VALOR.DS_TIPO_VALOR, FI_VALOR_BENEFICIARIO.*'
      'FROM FI_VALOR_BENEFICIARIO, FI_TIPO_VALOR'
      'WHERE FI_VALOR_BENEFICIARIO.CD_VERSAO = :CD_VERSAO'
      '   AND FI_VALOR_BENEFICIARIO.CD_PARTIC = :CD_PARTIC'
      
        '   AND FI_VALOR_BENEFICIARIO.CD_TIPO_VALOR = FI_TIPO_VALOR.CD_TI' +
        'PO_VALOR'
      'ORDER BY FI_TIPO_VALOR.DS_TIPO_VALOR')
    UpdateObject = UpdtSQLPrincipal
    ValidateWithMask = True
    Left = 225
    Top = 140
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
      Origin = 'BASEDADOS.FI_VALOR_BENEFICIARIO.CD_VERSAO'
      FixedChar = True
      Size = 60
    end
    object qryPrincipalCD_VERSAO: TFloatField
      FieldName = 'CD_VERSAO'
      Origin = 'BASEDADOS.FI_VALOR_BENEFICIARIO.CD_PARTIC'
    end
    object qryPrincipalCD_PARTIC: TFloatField
      FieldName = 'CD_PARTIC'
      Origin = 'BASEDADOS.FI_VALOR_BENEFICIARIO.CD_BENEF_TITULAR'
    end
    object qryPrincipalCD_BENEF_TITULAR: TFloatField
      FieldName = 'CD_BENEF_TITULAR'
      Origin = 'BASEDADOS.FI_VALOR_BENEFICIARIO.CD_BENEFICIARIO'
    end
    object qryPrincipalCD_BENEFICIARIO: TFloatField
      FieldName = 'CD_BENEFICIARIO'
      Origin = 'BASEDADOS.FI_VALOR_BENEFICIARIO.CD_TIPO_VALOR'
    end
    object qryPrincipalCD_TIPO_VALOR: TFloatField
      FieldName = 'CD_TIPO_VALOR'
      Origin = 'BASEDADOS.FI_VALOR_BENEFICIARIO.VL_PARTICIPANTE'
    end
    object qryPrincipalVL_PARTICIPANTE: TFloatField
      FieldName = 'VL_PARTICIPANTE'
      Origin = 'BASEDADOS.FI_VALOR_BENEFICIARIO.TRGDTINCLUSAO'
    end
    object qryPrincipalTRGDTINCLUSAO: TDateTimeField
      FieldName = 'TRGDTINCLUSAO'
      Origin = 'BASEDADOS.FI_VALOR_BENEFICIARIO.TRGUSERINCLUSAO'
    end
    object qryPrincipalTRGUSERINCLUSAO: TStringField
      FieldName = 'TRGUSERINCLUSAO'
      Origin = 'BASEDADOS.FI_TIPO_VALOR.DS_TIPO_VALOR'
      Size = 30
    end
  end
  object UpdtSQLPrincipal: TUpdateSQL
    ModifySQL.Strings = (
      'update FI_VALOR_BENEFICIARIO'
      'set'
      '  CD_VERSAO = :CD_VERSAO,'
      '  CD_PARTIC = :CD_PARTIC,'
      '  CD_BENEF_TITULAR = :CD_BENEF_TITULAR,'
      '  CD_BENEFICIARIO = :CD_BENEFICIARIO,'
      '  CD_TIPO_VALOR = :CD_TIPO_VALOR,'
      '  VL_PARTICIPANTE = :VL_PARTICIPANTE'
      'where'
      '  CD_VERSAO = :OLD_CD_VERSAO and'
      '  CD_PARTIC = :OLD_CD_PARTIC and'
      '  CD_BENEF_TITULAR = :OLD_CD_BENEF_TITULAR and'
      '  CD_BENEFICIARIO = :OLD_CD_BENEFICIARIO and'
      '  CD_TIPO_VALOR = :OLD_CD_TIPO_VALOR')
    InsertSQL.Strings = (
      'insert into FI_VALOR_BENEFICIARIO'
      '  (CD_VERSAO, CD_PARTIC, CD_BENEF_TITULAR, CD_BENEFICIARIO, '
      'CD_TIPO_VALOR, '
      '   VL_PARTICIPANTE)'
      'values'
      '  (:CD_VERSAO, :CD_PARTIC, :CD_BENEF_TITULAR, :CD_BENEFICIARIO, '
      ':CD_TIPO_VALOR, '
      '   :VL_PARTICIPANTE)')
    DeleteSQL.Strings = (
      'delete from FI_VALOR_BENEFICIARIO'
      'where'
      '  CD_VERSAO = :OLD_CD_VERSAO and'
      '  CD_PARTIC = :OLD_CD_PARTIC and'
      '  CD_BENEF_TITULAR = :OLD_CD_BENEF_TITULAR and'
      '  CD_BENEFICIARIO = :OLD_CD_BENEFICIARIO and'
      '  CD_TIPO_VALOR = :OLD_CD_TIPO_VALOR')
    Left = 281
    Top = 140
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
      'FI_VALOR_PARTICIPANTE'
      'FI_TIPO_VALOR')
    CamposChave.Strings = (
      'FI_VALOR_PARTICIPANTE.CD_VERSAO'
      'FI_VALOR_PARTICIPANTE.CD_PARTIC'
      'FI_VALOR_PARTICIPANTE.CD_TIPO_VALOR')
    Filtro.Strings = (
      
        'FI_VALOR_PARTICIPANTE.CD_TIPO_VALOR = FI_TIPO_VALOR.CD_TIPO_VALO' +
        'R')
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
    Left = 281
    Top = 110
  end
end
