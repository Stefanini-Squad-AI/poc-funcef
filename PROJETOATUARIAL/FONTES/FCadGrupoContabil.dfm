inherited frmCadGrupoContabil: TfrmCadGrupoContabil
  HelpContext = 40340
  Caption = 'Integração Contábil - Cadastro de Grupos'
  ClientWidth = 447
  PixelsPerInch = 96
  TextHeight = 13
  inherited pnlFundo: TPanel
    Width = 447
    object DBGrdGrupo: TDBGrid
      Left = 1
      Top = 1
      Width = 445
      Height = 199
      Align = alClient
      DataSource = ds
      TabOrder = 0
      TitleFont.Charset = DEFAULT_CHARSET
      TitleFont.Color = clWindowText
      TitleFont.Height = -9
      TitleFont.Name = 'MS Sans Serif'
      TitleFont.Style = [fsBold]
      Columns = <
        item
          Expanded = False
          FieldName = 'DS_GRUPO_CONTABIL'
          Title.Caption = 'Grupo'
          Width = 402
          Visible = True
        end>
    end
  end
  inherited Dock972: TDock97
    Width = 447
  end
  inherited Dock971: TDock97
    Width = 447
    inherited tb97Fundo: TToolbar97
      Left = 275
    end
    inherited TB97oKCancelar: TToolbar97
      Left = 106
    end
    inherited dbnav: TDBNavigator
      Hints.Strings = ()
    end
  end
  inherited ivTradutor: TIvExtendedTranslator
    Left = 197
    Top = 106
  end
  inherited ds: TwwDataSource
    DataSet = QryPrincipal
    Left = 197
    Top = 134
  end
  inherited ImlPadrao: TImageList
    Left = 169
    Top = 106
  end
  inherited CmeCadastro: TCmEventosCadastro
    Left = 225
    Top = 106
  end
  inherited srchdlgProcura: TwwSearchDialog
    Left = 253
    Top = 106
  end
  inherited seldlgProcuraQry: TcmSelectDlg
    Left = 281
    Top = 106
  end
  object QryPrincipal: TwwQuery
    CachedUpdates = True
    BeforePost = QryPrincipalBeforePost
    AfterPost = QryPrincipalAfterPost
    AfterDelete = QryPrincipalAfterPost
    DatabaseName = 'BaseDados'
    SQL.Strings = (
      'SELECT CD_GRUPO_CONTABIL,'
      '       DS_GRUPO_CONTABIL'
      'FROM FI_GRUPO_INTEGRACAO_CONTABIL'
      'ORDER BY DS_GRUPO_CONTABIL  ')
    UpdateObject = UpdtSQLPrincipal
    ValidateWithMask = True
    Left = 169
    Top = 134
    object QryPrincipalCD_GRUPO_CONTABIL: TFloatField
      FieldName = 'CD_GRUPO_CONTABIL'
      Origin = 'BASEDADOS.FI_GRUPO_INTEGRACAO_CONTABIL.CD_GRUPO_CONTABIL'
    end
    object QryPrincipalDS_GRUPO_CONTABIL: TStringField
      FieldName = 'DS_GRUPO_CONTABIL'
      Origin = 'BASEDADOS.FI_GRUPO_INTEGRACAO_CONTABIL.DS_GRUPO_CONTABIL'
      Size = 50
    end
  end
  object UpdtSQLPrincipal: TUpdateSQL
    ModifySQL.Strings = (
      'update FI_GRUPO_INTEGRACAO_CONTABIL'
      'set'
      '  DS_GRUPO_CONTABIL = :DS_GRUPO_CONTABIL'
      'where'
      '  CD_GRUPO_CONTABIL = :OLD_CD_GRUPO_CONTABIL')
    InsertSQL.Strings = (
      'insert into FI_GRUPO_INTEGRACAO_CONTABIL'
      '  (CD_GRUPO_CONTABIL, DS_GRUPO_CONTABIL)'
      'values'
      '  (:CD_GRUPO_CONTABIL, :DS_GRUPO_CONTABIL)')
    DeleteSQL.Strings = (
      'delete from FI_GRUPO_INTEGRACAO_CONTABIL'
      'where'
      '  CD_GRUPO_CONTABIL = :OLD_CD_GRUPO_CONTABIL')
    Left = 225
    Top = 134
  end
  object QryMaxCodGrupo: TwwQuery
    DatabaseName = 'BaseDados'
    SQL.Strings = (
      'SELECT MAX(CD_GRUPO_CONTABIL) AS MAX_COD'
      'FROM FI_GRUPO_INTEGRACAO_CONTABIL '
      ' ')
    ValidateWithMask = True
    Left = 253
    Top = 134
    object QryMaxCodGrupoMAX_COD: TFloatField
      FieldName = 'MAX_COD'
      Origin = 'BASEDADOS.FI_GRUPO_INTEGRACAO_CONTABIL.CD_GRUPO_CONTABIL'
    end
  end
end
