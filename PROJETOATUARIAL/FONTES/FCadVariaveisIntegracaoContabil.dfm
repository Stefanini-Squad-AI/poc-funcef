inherited frmCadVariaveisIntegracaoContabil: TfrmCadVariaveisIntegracaoContabil
  Left = 0
  Top = 81
  HelpContext = 40341
  Caption = 'Integração Contábil - Parâmetros'
  ClientHeight = 432
  ClientWidth = 760
  PixelsPerInch = 96
  TextHeight = 13
  inherited pnlFundo: TPanel
    Width = 760
    Height = 346
    object PageControl: TPageControl
      Left = 1
      Top = 1
      Width = 758
      Height = 344
      ActivePage = TabSheet2
      Align = alClient
      TabOrder = 0
      object TabSheet1: TTabSheet
        Caption = 'TabSheet1'
        TabVisible = False
        object DBGrdCadastro: TDBGrid
          Left = 0
          Top = 0
          Width = 750
          Height = 334
          Align = alClient
          DataSource = ds
          Options = [dgEditing, dgTitles, dgIndicator, dgColumnResize, dgColLines, dgRowLines, dgTabs, dgConfirmDelete]
          TabOrder = 0
          TitleFont.Charset = DEFAULT_CHARSET
          TitleFont.Color = clWindowText
          TitleFont.Height = -9
          TitleFont.Name = 'MS Sans Serif'
          TitleFont.Style = [fsBold]
          Columns = <
            item
              Expanded = False
              FieldName = 'lkpPatrocinadora'
              Title.Caption = 'Patrocinadora'
              Width = 96
              Visible = True
            end
            item
              Expanded = False
              FieldName = 'lkpPlano'
              Title.Caption = 'Plano'
              Width = 96
              Visible = True
            end
            item
              Expanded = False
              FieldName = 'lkpGrupo'
              Title.Caption = 'Grupo'
              Width = 183
              Visible = True
            end
            item
              Expanded = False
              FieldName = 'lkpVariavel'
              Title.Caption = 'Sub Grupo'
              Width = 133
              Visible = True
            end
            item
              Expanded = False
              FieldName = 'lkpContaContabil'
              Title.Caption = 'Conta'
              Width = 307
              Visible = True
            end
            item
              Alignment = taCenter
              Expanded = False
              FieldName = 'lkpTipoConta'
              Title.Caption = 'Tipo Conta'
              Width = 84
              Visible = True
            end
            item
              Expanded = False
              FieldName = 'DS_HISTORICO_PADRAO'
              Title.Caption = 'Histórico'
              Width = 123
              Visible = True
            end>
        end
      end
      object TabSheet2: TTabSheet
        Caption = 'TabSheet2'
        ImageIndex = 1
        TabVisible = False
        object Label3: TLabel
          Left = 74
          Top = 139
          Width = 61
          Height = 13
          Caption = 'Sub Grupo'
        end
        object Label4: TLabel
          Left = 100
          Top = 102
          Width = 35
          Height = 13
          Caption = 'Grupo'
        end
        object Label5: TLabel
          Left = 51
          Top = 175
          Width = 84
          Height = 13
          Caption = 'Conta Contábil'
        end
        object Label6: TLabel
          Left = 72
          Top = 211
          Width = 63
          Height = 13
          Caption = 'Tipo Conta'
        end
        object Label7: TLabel
          Left = 40
          Top = 247
          Width = 95
          Height = 13
          Caption = 'Histórico Padrão'
        end
        object Label1: TLabel
          Left = 53
          Top = 33
          Width = 80
          Height = 13
          Caption = 'Patrocinadora'
        end
        object Label2: TLabel
          Left = 100
          Top = 68
          Width = 33
          Height = 13
          Caption = 'Plano'
        end
        object DBLkpCmbSubGrupo: TwwDBLookupCombo
          Left = 136
          Top = 135
          Width = 360
          Height = 21
          DropDownAlignment = taLeftJustify
          Selected.Strings = (
            'NO_VARIAVEL'#9'60'#9'VARIÁVEL'#9'F')
          DataField = 'NO_VARIAVEL'
          DataSource = ds
          LookupTable = QryLkpVariavel
          LookupField = 'NO_VARIAVEL'
          Options = [loColLines, loRowLines]
          TabOrder = 3
          AutoDropDown = True
          ShowButton = True
          AllowClearKey = True
          ShowMatchText = True
        end
        object DBLkpCmbGrupo: TwwDBLookupCombo
          Left = 136
          Top = 98
          Width = 360
          Height = 21
          DropDownAlignment = taLeftJustify
          Selected.Strings = (
            'DS_GRUPO_CONTABIL'#9'50'#9'GRUPO'#9'F')
          DataField = 'CD_GRUPO_CONTABIL'
          DataSource = ds
          LookupTable = QryLkpGrupo
          LookupField = 'CD_GRUPO_CONTABIL'
          Options = [loColLines, loRowLines]
          TabOrder = 2
          AutoDropDown = True
          ShowButton = True
          AllowClearKey = True
          ShowMatchText = True
        end
        object DBLkpCmbContaContabil: TwwDBLookupCombo
          Left = 136
          Top = 171
          Width = 360
          Height = 21
          DropDownAlignment = taLeftJustify
          Selected.Strings = (
            'DESCRICAO'#9'61'#9'DESCRIÇÃO'#9'F')
          DataField = 'CD_CONTA_CONTABIL'
          DataSource = ds
          LookupTable = QryLkpContaContabil
          LookupField = 'PLACONTA'
          Options = [loColLines, loRowLines]
          TabOrder = 4
          AutoDropDown = True
          ShowButton = True
          AllowClearKey = True
          ShowMatchText = True
        end
        object DBLkpCmbTipoConta: TwwDBLookupCombo
          Left = 136
          Top = 207
          Width = 117
          Height = 21
          DropDownAlignment = taLeftJustify
          Selected.Strings = (
            'DESCRICAO'#9'7'#9'TIPO CONTA'#9'F')
          DataField = 'IR_TIPO_CONTA'
          DataSource = ds
          LookupTable = QryLkpTipoConta
          LookupField = 'CODIGO'
          Options = [loColLines, loRowLines]
          TabOrder = 5
          AutoDropDown = True
          ShowButton = True
          AllowClearKey = True
          ShowMatchText = True
        end
        object DBLkpCmbBxPatrocinadora: TwwDBLookupCombo
          Left = 136
          Top = 29
          Width = 360
          Height = 21
          DropDownAlignment = taLeftJustify
          Selected.Strings = (
            'NO_PESSOA'#9'60'#9'PATROCINADORA'#9'F')
          DataField = 'CD_PESSOA_PATROC'
          DataSource = ds
          LookupTable = QryLkpPatrocinadora
          LookupField = 'CD_PESSOA_PATROC'
          Options = [loColLines, loRowLines]
          TabOrder = 0
          AutoDropDown = True
          ShowButton = True
          AllowClearKey = True
          ShowMatchText = True
        end
        object DBLkpCmbBxPlano: TwwDBLookupCombo
          Left = 136
          Top = 64
          Width = 360
          Height = 21
          DropDownAlignment = taLeftJustify
          Selected.Strings = (
            'NO_PLANO'#9'60'#9'PLANO'#9'F')
          DataField = 'CD_PLANO'
          DataSource = ds
          LookupTable = QryLkpPlano
          LookupField = 'CD_PLANO'
          Options = [loColLines, loRowLines]
          TabOrder = 1
          AutoDropDown = True
          ShowButton = True
          AllowClearKey = True
          ShowMatchText = True
        end
        object wwDBLookupCombo1: TwwDBLookupCombo
          Left = 136
          Top = 245
          Width = 360
          Height = 21
          DropDownAlignment = taLeftJustify
          Selected.Strings = (
            'HITCODHIST'#9'4'#9'CÓDIGO'#9'F'
            'HITDESCR1'#9'200'#9'DESCRIÇÃO'#9'F')
          DataField = 'DS_HISTORICO_PADRAO'
          DataSource = ds
          LookupTable = QryLkpHistorico
          LookupField = 'HITCODHIST'
          Options = [loColLines, loRowLines]
          TabOrder = 6
          AutoDropDown = True
          ShowButton = True
          AllowClearKey = True
          ShowMatchText = True
        end
      end
    end
  end
  inherited Dock972: TDock97
    Width = 760
  end
  inherited Dock971: TDock97
    Top = 393
    Width = 760
    inherited tb97Fundo: TToolbar97
      Left = 588
      DockPos = 633
    end
    inherited TB97oKCancelar: TToolbar97
      Left = 419
      DockPos = 464
    end
    inherited dbnav: TDBNavigator
      Hints.Strings = ()
    end
  end
  inherited ivTradutor: TIvExtendedTranslator
    Left = 554
    Top = 139
    TargetsData = (
      1
      1
      (
        'TDBMemo'
        'Text'
        0))
  end
  inherited ds: TwwDataSource
    DataSet = QryPrincipal
    OnStateChange = dsStateChange
    Left = 554
    Top = 167
  end
  inherited ImlPadrao: TImageList
    Left = 526
    Top = 139
  end
  inherited CmeCadastro: TCmEventosCadastro
    Left = 582
    Top = 139
  end
  inherited srchdlgProcura: TwwSearchDialog
    Left = 610
    Top = 139
  end
  inherited seldlgProcuraQry: TcmSelectDlg
    Left = 638
    Top = 139
  end
  object QryPrincipal: TwwQuery
    CachedUpdates = True
    BeforePost = QryPrincipalBeforePost
    AfterPost = QryPrincipalAfterPost
    AfterDelete = QryPrincipalAfterPost
    DatabaseName = 'BaseDados'
    SQL.Strings = (
      'SELECT FI_CONTA_INTEGRACAO_CONTABIL.CD_PESSOA_PATROC,'
      '       FI_CONTA_INTEGRACAO_CONTABIL.CD_PESSOA_ENTID,'
      '       FI_CONTA_INTEGRACAO_CONTABIL.CD_PLANO,'
      '       FI_CONTA_INTEGRACAO_CONTABIL.CD_GRUPO_CONTABIL,'
      '       FI_CONTA_INTEGRACAO_CONTABIL.NO_VARIAVEL,'
      
        '       TRIM(FI_CONTA_INTEGRACAO_CONTABIL.CD_CONTA_CONTABIL) AS C' +
        'D_CONTA_CONTABIL,'
      '       FI_CONTA_INTEGRACAO_CONTABIL.IR_TIPO_CONTA,'
      '       FI_CONTA_INTEGRACAO_CONTABIL.DS_HISTORICO_PADRAO,'
      '       FI_CONTA_INTEGRACAO_CONTABIL.TRGDTINCLUSAO,'
      '       FI_CONTA_INTEGRACAO_CONTABIL.TRGUSERINCLUSAO'
      'FROM FI_CONTA_INTEGRACAO_CONTABIL,'
      '     FI_GRUPO_INTEGRACAO_CONTABIL,'
      '     FI_PLANO_PATRONAL'
      
        'WHERE FI_CONTA_INTEGRACAO_CONTABIL.CD_GRUPO_CONTABIL = FI_GRUPO_' +
        'INTEGRACAO_CONTABIL.CD_GRUPO_CONTABIL'
      
        '  AND FI_CONTA_INTEGRACAO_CONTABIL.CD_PESSOA_PATROC = FI_PLANO_P' +
        'ATRONAL.CD_PESSOA_PATROC'
      
        '  AND FI_CONTA_INTEGRACAO_CONTABIL.CD_PESSOA_ENTID = FI_PLANO_PA' +
        'TRONAL.CD_PESSOA_ENTID'
      
        '  AND FI_CONTA_INTEGRACAO_CONTABIL.CD_PLANO = FI_PLANO_PATRONAL.' +
        'CD_PLANO'
      'ORDER BY FI_PLANO_PATRONAL.NO_PLANO,'
      '         FI_GRUPO_INTEGRACAO_CONTABIL.DS_GRUPO_CONTABIL,'
      '         FI_CONTA_INTEGRACAO_CONTABIL.NO_VARIAVEL'
      ' '
      ' ')
    UpdateObject = UpdtSQLPrincipal
    ValidateWithMask = True
    Left = 526
    Top = 167
    object QryPrincipallkpPatrocinadora: TStringField
      FieldKind = fkLookup
      FieldName = 'lkpPatrocinadora'
      LookupDataSet = QryLkpPatrocinadora
      LookupKeyFields = 'CD_PESSOA_PATROC'
      LookupResultField = 'NO_PESSOA'
      KeyFields = 'CD_PESSOA_PATROC'
      Size = 100
      Lookup = True
    end
    object QryPrincipallkpPlano: TStringField
      FieldKind = fkLookup
      FieldName = 'lkpPlano'
      LookupDataSet = QryLkpPlano
      LookupKeyFields = 'CD_PLANO'
      LookupResultField = 'NO_PLANO'
      KeyFields = 'CD_PLANO'
      Size = 100
      Lookup = True
    end
    object QryPrincipallkpGrupo: TStringField
      FieldKind = fkLookup
      FieldName = 'lkpGrupo'
      LookupDataSet = QryLkpGrupo
      LookupKeyFields = 'CD_GRUPO_CONTABIL'
      LookupResultField = 'DS_GRUPO_CONTABIL'
      KeyFields = 'CD_GRUPO_CONTABIL'
      Size = 50
      Lookup = True
    end
    object QryPrincipallkpTipoConta: TStringField
      FieldKind = fkLookup
      FieldName = 'lkpTipoConta'
      LookupDataSet = QryLkpTipoConta
      LookupKeyFields = 'CODIGO'
      LookupResultField = 'DESCRICAO'
      KeyFields = 'IR_TIPO_CONTA'
      Size = 10
      Lookup = True
    end
    object QryPrincipallkpVariavel: TStringField
      FieldKind = fkLookup
      FieldName = 'lkpVariavel'
      LookupDataSet = QryLkpVariavel
      LookupKeyFields = 'NO_VARIAVEL'
      LookupResultField = 'NO_VARIAVEL'
      KeyFields = 'NO_VARIAVEL'
      Lookup = True
    end
    object QryPrincipallkpContaContabil: TStringField
      FieldKind = fkLookup
      FieldName = 'lkpContaContabil'
      LookupDataSet = QryLkpContaContabil
      LookupKeyFields = 'PLACONTA'
      LookupResultField = 'DESCRICAO'
      KeyFields = 'CD_CONTA_CONTABIL'
      Size = 100
      Lookup = True
    end
    object QryPrincipalCD_PESSOA_PATROC: TFloatField
      FieldName = 'CD_PESSOA_PATROC'
      Origin = 'BASEDADOS.FI_CONTA_INTEGRACAO_CONTABIL.CD_PESSOA_PATROC'
    end
    object QryPrincipalCD_PESSOA_ENTID: TFloatField
      FieldName = 'CD_PESSOA_ENTID'
      Origin = 'BASEDADOS.FI_CONTA_INTEGRACAO_CONTABIL.CD_PESSOA_ENTID'
    end
    object QryPrincipalCD_PLANO: TFloatField
      FieldName = 'CD_PLANO'
      Origin = 'BASEDADOS.FI_CONTA_INTEGRACAO_CONTABIL.CD_PLANO'
    end
    object QryPrincipalCD_GRUPO_CONTABIL: TFloatField
      FieldName = 'CD_GRUPO_CONTABIL'
      Origin = 'BASEDADOS.FI_CONTA_INTEGRACAO_CONTABIL.CD_GRUPO_CONTABIL'
    end
    object QryPrincipalNO_VARIAVEL: TStringField
      FieldName = 'NO_VARIAVEL'
      Origin = 'BASEDADOS.FI_CONTA_INTEGRACAO_CONTABIL.NO_VARIAVEL'
      FixedChar = True
    end
    object QryPrincipalCD_CONTA_CONTABIL: TStringField
      FieldName = 'CD_CONTA_CONTABIL'
      Origin = 'BASEDADOS.FI_CONTA_INTEGRACAO_CONTABIL.CD_CONTA_CONTABIL'
    end
    object QryPrincipalIR_TIPO_CONTA: TStringField
      FieldName = 'IR_TIPO_CONTA'
      Origin = 'BASEDADOS.FI_CONTA_INTEGRACAO_CONTABIL.IR_TIPO_CONTA'
      FixedChar = True
      Size = 1
    end
    object QryPrincipalDS_HISTORICO_PADRAO: TStringField
      FieldName = 'DS_HISTORICO_PADRAO'
      Origin = 'BASEDADOS.FI_CONTA_INTEGRACAO_CONTABIL.DS_HISTORICO_PADRAO'
      FixedChar = True
      Size = 4
    end
    object QryPrincipalTRGDTINCLUSAO: TDateTimeField
      FieldName = 'TRGDTINCLUSAO'
      Origin = 'BASEDADOS.FI_CONTA_INTEGRACAO_CONTABIL.TRGDTINCLUSAO'
    end
    object QryPrincipalTRGUSERINCLUSAO: TStringField
      FieldName = 'TRGUSERINCLUSAO'
      Origin = 'BASEDADOS.FI_CONTA_INTEGRACAO_CONTABIL.TRGUSERINCLUSAO'
      Size = 30
    end
  end
  object UpdtSQLPrincipal: TUpdateSQL
    ModifySQL.Strings = (
      'update FI_CONTA_INTEGRACAO_CONTABIL'
      'set'
      '  CD_PESSOA_PATROC = :CD_PESSOA_PATROC,'
      '  CD_PESSOA_ENTID = :CD_PESSOA_ENTID,'
      '  CD_PLANO = :CD_PLANO,'
      '  CD_GRUPO_CONTABIL = :CD_GRUPO_CONTABIL,'
      '  NO_VARIAVEL = :NO_VARIAVEL,'
      '  CD_CONTA_CONTABIL = :CD_CONTA_CONTABIL,'
      '  IR_TIPO_CONTA = :IR_TIPO_CONTA,'
      '  DS_HISTORICO_PADRAO = :DS_HISTORICO_PADRAO,'
      '  TRGDTINCLUSAO = :TRGDTINCLUSAO,'
      '  TRGUSERINCLUSAO = :TRGUSERINCLUSAO'
      'where'
      '  CD_PESSOA_PATROC = :OLD_CD_PESSOA_PATROC and'
      '  CD_PESSOA_ENTID = :OLD_CD_PESSOA_ENTID and'
      '  CD_PLANO = :OLD_CD_PLANO and'
      '  CD_GRUPO_CONTABIL = :OLD_CD_GRUPO_CONTABIL and'
      '  NO_VARIAVEL = :OLD_NO_VARIAVEL and'
      '  CD_CONTA_CONTABIL = :OLD_CD_CONTA_CONTABIL')
    InsertSQL.Strings = (
      'insert into FI_CONTA_INTEGRACAO_CONTABIL'
      
        '  (CD_PESSOA_PATROC, CD_PESSOA_ENTID, CD_PLANO, CD_GRUPO_CONTABI' +
        'L, NO_VARIAVEL, '
      
        '   CD_CONTA_CONTABIL, IR_TIPO_CONTA, DS_HISTORICO_PADRAO, TRGDTI' +
        'NCLUSAO, '
      '   TRGUSERINCLUSAO)'
      'values'
      
        '  (:CD_PESSOA_PATROC, :CD_PESSOA_ENTID, :CD_PLANO, :CD_GRUPO_CON' +
        'TABIL, '
      
        '   :NO_VARIAVEL, :CD_CONTA_CONTABIL, :IR_TIPO_CONTA, :DS_HISTORI' +
        'CO_PADRAO, '
      '   :TRGDTINCLUSAO, :TRGUSERINCLUSAO)')
    DeleteSQL.Strings = (
      'delete from FI_CONTA_INTEGRACAO_CONTABIL'
      'where'
      '  CD_PESSOA_PATROC = :OLD_CD_PESSOA_PATROC and'
      '  CD_PESSOA_ENTID = :OLD_CD_PESSOA_ENTID and'
      '  CD_PLANO = :OLD_CD_PLANO and'
      '  CD_GRUPO_CONTABIL = :OLD_CD_GRUPO_CONTABIL and'
      '  NO_VARIAVEL = :OLD_NO_VARIAVEL and'
      '  CD_CONTA_CONTABIL = :OLD_CD_CONTA_CONTABIL')
    Left = 582
    Top = 167
  end
  object QryLkpPlano: TwwQuery
    DatabaseName = 'BaseDados'
    DataSource = dsLkpPatrocinadora
    SQL.Strings = (
      'SELECT DISTINCT CD_PESSOA_PATROC,'
      '       CD_PESSOA_ENTID,'
      '       CD_PLANO,'
      '       NO_PLANO'
      'FROM FI_PLANO_PATRONAL'
      'WHERE CD_PESSOA_PATROC = :CD_PESSOA_PATROC'
      'ORDER BY NO_PLANO'
      ' ')
    ValidateWithMask = True
    Left = 639
    Top = 195
    ParamData = <
      item
        DataType = ftFloat
        Name = 'CD_PESSOA_PATROC'
        ParamType = ptUnknown
      end>
    object QryLkpPlanoNO_PLANO: TStringField
      DisplayLabel = 'PLANO'
      DisplayWidth = 60
      FieldName = 'NO_PLANO'
      Origin = 'BASEDADOS.FI_PLANO_PATRONAL.NO_PLANO'
      FixedChar = True
      Size = 60
    end
    object QryLkpPlanoCD_PESSOA_PATROC: TFloatField
      FieldName = 'CD_PESSOA_PATROC'
      Origin = 'BASEDADOS.FI_PLANO_PATRONAL.CD_PESSOA_PATROC'
      Visible = False
    end
    object QryLkpPlanoCD_PESSOA_ENTID: TFloatField
      FieldName = 'CD_PESSOA_ENTID'
      Origin = 'BASEDADOS.FI_PLANO_PATRONAL.CD_PESSOA_ENTID'
      Visible = False
    end
    object QryLkpPlanoCD_PLANO: TFloatField
      FieldName = 'CD_PLANO'
      Origin = 'BASEDADOS.FI_PLANO_PATRONAL.CD_PLANO'
      Visible = False
    end
  end
  object QryLkpGrupo: TwwQuery
    DatabaseName = 'BaseDados'
    SQL.Strings = (
      'SELECT FI_GRUPO_INTEGRACAO_CONTABIL.CD_GRUPO_CONTABIL,'
      '       FI_GRUPO_INTEGRACAO_CONTABIL.DS_GRUPO_CONTABIL'
      'FROM FI_GRUPO_INTEGRACAO_CONTABIL'
      'ORDER BY DS_GRUPO_CONTABIL'
      ' ')
    ValidateWithMask = True
    Left = 611
    Top = 195
    object QryLkpGrupoDS_GRUPO_CONTABIL: TStringField
      DisplayLabel = 'GRUPO'
      DisplayWidth = 50
      FieldName = 'DS_GRUPO_CONTABIL'
      Origin = 'BASEDADOS.FI_GRUPO_INTEGRACAO_CONTABIL.DS_GRUPO_CONTABIL'
      Size = 50
    end
    object QryLkpGrupoCD_GRUPO_CONTABIL: TFloatField
      FieldName = 'CD_GRUPO_CONTABIL'
      Origin = 'BASEDADOS.FI_GRUPO_INTEGRACAO_CONTABIL.CD_GRUPO_CONTABIL'
      Visible = False
    end
  end
  object QryLkpTipoConta: TwwQuery
    DatabaseName = 'BaseDados'
    SQL.Strings = (
      'SELECT '#39'C'#39' AS CODIGO, '#39'CREDITO'#39' AS DESCRICAO'
      'FROM DUAL'
      ''
      'UNION'
      ''
      'SELECT '#39'D'#39' AS CODIGO, '#39'DEBITO'#39' AS DESCRICAO'
      'FROM DUAL')
    ValidateWithMask = True
    Left = 526
    Top = 195
    object QryLkpTipoContaDESCRICAO: TStringField
      DisplayLabel = 'TIPO CONTA'
      DisplayWidth = 7
      FieldName = 'DESCRICAO'
      Size = 7
    end
    object QryLkpTipoContaCODIGO: TStringField
      FieldName = 'CODIGO'
      Visible = False
      FixedChar = True
      Size = 1
    end
  end
  object QryLkpVariavel: TwwQuery
    DatabaseName = 'BaseDados'
    SQL.Strings = (
      'SELECT NO_VARIAVEL'
      'FROM FI_VARIAVEL'
      'ORDER BY NO_VARIAVEL')
    ValidateWithMask = True
    Left = 554
    Top = 195
    object QryLkpVariavelNO_VARIAVEL: TStringField
      DisplayLabel = 'VARIÁVEL'
      DisplayWidth = 60
      FieldName = 'NO_VARIAVEL'
      Origin = 'BASEDADOS.FI_VARIAVEL.NO_VARIAVEL'
      Size = 60
    end
  end
  object QryLkpContaContabil: TwwQuery
    DatabaseName = 'BaseDados'
    SQL.Strings = (
      
        'SELECT DISTINCT TRIM(PLACONTA) AS PLACONTA, TRIM(PLACONTA) ||'#39' -' +
        ' '#39'|| PLANOME AS DESCRICAO'
      'FROM PLANOCONTA'
      'WHERE PLANO = :CD_PLANO_CONTA'
      'ORDER BY PLACONTA'
      ' ')
    ValidateWithMask = True
    Left = 583
    Top = 195
    ParamData = <
      item
        DataType = ftInteger
        Name = 'CD_PLANO_CONTA'
        ParamType = ptInput
      end>
    object QryLkpContaContabilDESCRICAO: TStringField
      DisplayLabel = 'DESCRIÇÃO'
      DisplayWidth = 61
      FieldName = 'DESCRICAO'
      Origin = 'BASEDADOS.PLANOCONTA.PLACONTA'
      Size = 61
    end
    object QryLkpContaContabilPLACONTA: TStringField
      FieldName = 'PLACONTA'
      Origin = 'BASEDADOS.PLANOCONTA.PLACONTA'
      Visible = False
      FixedChar = True
      Size = 18
    end
  end
  object QryLkpPatrocinadora: TwwQuery
    DatabaseName = 'BaseDados'
    SQL.Strings = (
      'SELECT CD_PESSOA_PATROC, NO_PESSOA '
      'FROM FI_PESSOA_JURIDICA, FI_PATROCINADORA'
      'WHERE CD_PESSOA = CD_PESSOA_PATROC'
      'ORDER BY NO_PESSOA')
    ValidateWithMask = True
    Left = 611
    Top = 167
    object QryLkpPatrocinadoraNO_PESSOA: TStringField
      DisplayLabel = 'PATROCINADORA'
      DisplayWidth = 60
      FieldName = 'NO_PESSOA'
      Origin = 'BASEDADOS.FI_PESSOA_JURIDICA.NO_PESSOA'
      FixedChar = True
      Size = 60
    end
    object QryLkpPatrocinadoraCD_PESSOA_PATROC: TFloatField
      FieldName = 'CD_PESSOA_PATROC'
      Origin = 'BASEDADOS.FI_PATROCINADORA.CD_PESSOA_PATROC'
      Visible = False
    end
  end
  object dsLkpPatrocinadora: TwwDataSource
    DataSet = QryLkpPatrocinadora
    Left = 639
    Top = 167
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
    Left = 526
    Top = 111
  end
  object QryLkpHistorico: TwwQuery
    Active = True
    DatabaseName = 'BaseDados'
    SQL.Strings = (
      'SELECT HITCODHIST, HITDESCR1'
      'FROM HISTOPADRAO'
      'ORDER BY HITCODHIST')
    ValidateWithMask = True
    Left = 526
    Top = 223
    object QryLkpHistoricoHITCODHIST: TStringField
      DisplayLabel = 'CÓDIGO'
      DisplayWidth = 4
      FieldName = 'HITCODHIST'
      Origin = 'BASEDADOS.HISTOPADRAO.HITCODHIST'
      FixedChar = True
      Size = 4
    end
    object QryLkpHistoricoHITDESCR1: TStringField
      DisplayLabel = 'DESCRIÇÃO'
      DisplayWidth = 200
      FieldName = 'HITDESCR1'
      Origin = 'BASEDADOS.HISTOPADRAO.HITDESCR1'
      Size = 200
    end
  end
end
