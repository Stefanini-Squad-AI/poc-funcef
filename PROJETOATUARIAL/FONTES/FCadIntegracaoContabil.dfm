inherited frmCadIntegracaoContabil: TfrmCadIntegracaoContabil
  Left = 4
  Top = 80
  HelpContext = 40338
  Caption = 'Integração Contábil - Cadastro'
  ClientHeight = 432
  ClientWidth = 766
  PixelsPerInch = 96
  TextHeight = 13
  inherited pnlFundo: TPanel
    Width = 766
    Height = 346
    object PageControl: TPageControl
      Left = 1
      Top = 1
      Width = 764
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
          Width = 756
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
              FieldName = 'DT_REFERENCIA'
              Title.Caption = 'Referência'
              Width = 81
              Visible = True
            end
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
              Title.Caption = 'SubGrupo'
              Width = 133
              Visible = True
            end
            item
              Expanded = False
              FieldName = 'lkpContaContabil'
              Title.Caption = 'Conta Contábil'
              Width = 307
              Visible = True
            end
            item
              Expanded = False
              FieldName = 'VL_VARIAVEL'
              Title.Caption = 'Valor'
              Width = 99
              Visible = True
            end>
        end
      end
      object TabSheet2: TTabSheet
        Caption = 'TabSheet2'
        ImageIndex = 1
        TabVisible = False
        object Label4: TLabel
          Left = 74
          Top = 171
          Width = 61
          Height = 13
          Caption = 'Sub Grupo'
        end
        object Label5: TLabel
          Left = 100
          Top = 136
          Width = 35
          Height = 13
          Caption = 'Grupo'
        end
        object Label6: TLabel
          Left = 51
          Top = 207
          Width = 84
          Height = 13
          Caption = 'Conta Contábil'
        end
        object Label7: TLabel
          Left = 105
          Top = 242
          Width = 30
          Height = 13
          Caption = 'Valor'
        end
        object Label2: TLabel
          Left = 69
          Top = 32
          Width = 63
          Height = 13
          Caption = 'Referência'
        end
        object Label3: TLabel
          Left = 53
          Top = 64
          Width = 80
          Height = 13
          Caption = 'Patrocinadora'
        end
        object Label1: TLabel
          Left = 100
          Top = 99
          Width = 33
          Height = 13
          Caption = 'Plano'
        end
        object DBLkpCmbSubGrupo: TwwDBLookupCombo
          Left = 136
          Top = 167
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
          TabOrder = 4
          AutoDropDown = True
          ShowButton = True
          AllowClearKey = True
          ShowMatchText = True
        end
        object DBLkpCmbGrupo: TwwDBLookupCombo
          Left = 136
          Top = 132
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
          TabOrder = 3
          AutoDropDown = True
          ShowButton = True
          AllowClearKey = True
          ShowMatchText = True
        end
        object DBLkpCmbContaContabil: TwwDBLookupCombo
          Left = 136
          Top = 203
          Width = 360
          Height = 21
          DropDownAlignment = taLeftJustify
          Selected.Strings = (
            'DESCRICAO'#9'61'#9'DESCRIÇÃO'#9'F')
          DataField = 'CD_CONTA_CONTABIL'
          DataSource = ds
          LookupTable = QryLkpContaContabil
          LookupField = 'CD_CONTA_CONTABIL'
          Options = [loColLines, loRowLines]
          TabOrder = 5
          AutoDropDown = True
          ShowButton = True
          AllowClearKey = True
          ShowMatchText = True
        end
        object DBEdit5: TDBEdit
          Left = 136
          Top = 238
          Width = 102
          Height = 21
          AutoSelect = False
          DataField = 'VL_VARIAVEL'
          DataSource = ds
          TabOrder = 6
        end
        object DtEdtReferencia: TCMDateTimePicker
          Left = 136
          Top = 28
          Width = 113
          Height = 21
          CalendarAttributes.Font.Charset = DEFAULT_CHARSET
          CalendarAttributes.Font.Color = clWindowText
          CalendarAttributes.Font.Height = -11
          CalendarAttributes.Font.Name = 'MS Sans Serif'
          CalendarAttributes.Font.Style = []
          ButtonStyle = cbsCustom
          DataField = 'DT_REFERENCIA'
          DataSource = ds
          Epoch = 1950
          ButtonGlyph.Data = {
            06050000424D06050000000000003604000028000000100000000D0000000100
            080000000000D000000000000000000000000001000000000000000000000000
            80000080000000808000800000008000800080800000C0C0C000C0DCC000F0CA
            A6000020400000206000002080000020A0000020C0000020E000004000000040
            20000040400000406000004080000040A0000040C0000040E000006000000060
            20000060400000606000006080000060A0000060C0000060E000008000000080
            20000080400000806000008080000080A0000080C0000080E00000A0000000A0
            200000A0400000A0600000A0800000A0A00000A0C00000A0E00000C0000000C0
            200000C0400000C0600000C0800000C0A00000C0C00000C0E00000E0000000E0
            200000E0400000E0600000E0800000E0A00000E0C00000E0E000400000004000
            20004000400040006000400080004000A0004000C0004000E000402000004020
            20004020400040206000402080004020A0004020C0004020E000404000004040
            20004040400040406000404080004040A0004040C0004040E000406000004060
            20004060400040606000406080004060A0004060C0004060E000408000004080
            20004080400040806000408080004080A0004080C0004080E00040A0000040A0
            200040A0400040A0600040A0800040A0A00040A0C00040A0E00040C0000040C0
            200040C0400040C0600040C0800040C0A00040C0C00040C0E00040E0000040E0
            200040E0400040E0600040E0800040E0A00040E0C00040E0E000800000008000
            20008000400080006000800080008000A0008000C0008000E000802000008020
            20008020400080206000802080008020A0008020C0008020E000804000008040
            20008040400080406000804080008040A0008040C0008040E000806000008060
            20008060400080606000806080008060A0008060C0008060E000808000008080
            20008080400080806000808080008080A0008080C0008080E00080A0000080A0
            200080A0400080A0600080A0800080A0A00080A0C00080A0E00080C0000080C0
            200080C0400080C0600080C0800080C0A00080C0C00080C0E00080E0000080E0
            200080E0400080E0600080E0800080E0A00080E0C00080E0E000C0000000C000
            2000C0004000C0006000C0008000C000A000C000C000C000E000C0200000C020
            2000C0204000C0206000C0208000C020A000C020C000C020E000C0400000C040
            2000C0404000C0406000C0408000C040A000C040C000C040E000C0600000C060
            2000C0604000C0606000C0608000C060A000C060C000C060E000C0800000C080
            2000C0804000C0806000C0808000C080A000C080C000C080E000C0A00000C0A0
            2000C0A04000C0A06000C0A08000C0A0A000C0A0C000C0A0E000C0C00000C0C0
            2000C0C04000C0C06000C0C08000C0C0A000F0FBFF00A4A0A000808080000000
            FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00010000000000
            000000000000000000FFFF00FFFFFFFFFFFFFFFFFFFFFFFF00FFFF00FF07A407
            A407A4F9A407A4FF00FFFF00FFA407A407A4F9A4F9A407FF00FFFF00FF07A407
            A407A4F9A407A4FF00FFFF00FFA407A407A407A407A407FF00FFFF00FF07A407
            A407A407A407A4FF00FFFF00FFA407A407A407A407A407FF00FFFF00FFFFFFFF
            FFFFFFFFFFFFFFFF00FFFF00FF04FC04FC04FCA4A4A4A4FF00FFFF00FFFC04FC
            04FC04A4A4A4A4FF00FFFF00FFFFFFFFFFFFFFFFFFFFFFFF00FFFF0000000000
            000000000000000000FF}
          ShowButton = True
          TabOrder = 0
        end
        object DBLkpCmbBxPatrocinadora: TwwDBLookupCombo
          Left = 136
          Top = 60
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
          TabOrder = 1
          AutoDropDown = True
          ShowButton = True
          AllowClearKey = True
          ShowMatchText = True
        end
        object DBLkpCmbBxPlano: TwwDBLookupCombo
          Left = 136
          Top = 95
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
          TabOrder = 2
          AutoDropDown = True
          ShowButton = True
          AllowClearKey = True
          ShowMatchText = True
        end
      end
    end
  end
  inherited Dock972: TDock97
    Width = 766
  end
  inherited Dock971: TDock97
    Top = 393
    Width = 766
    inherited tb97Fundo: TToolbar97
      Left = 594
      DockPos = 673
    end
    inherited TB97oKCancelar: TToolbar97
      Left = 425
      DockPos = 504
    end
    inherited dbnav: TDBNavigator
      Hints.Strings = ()
    end
  end
  inherited ivTradutor: TIvExtendedTranslator
    Left = 281
    Top = 187
  end
  inherited ds: TwwDataSource
    DataSet = QryPrincipal
    OnStateChange = dsStateChange
    Left = 281
    Top = 215
  end
  inherited ImlPadrao: TImageList
    Left = 253
    Top = 187
  end
  inherited CmeCadastro: TCmEventosCadastro
    Left = 309
    Top = 187
  end
  inherited srchdlgProcura: TwwSearchDialog
    Left = 337
    Top = 187
  end
  inherited seldlgProcuraQry: TcmSelectDlg
    Left = 365
    Top = 187
  end
  object QryPrincipal: TwwQuery
    CachedUpdates = True
    BeforePost = QryPrincipalBeforePost
    AfterPost = QryPrincipalAfterPost
    AfterDelete = QryPrincipalAfterPost
    DatabaseName = 'BaseDados'
    SQL.Strings = (
      'SELECT FI_INTEGRACAO_CONTABIL.*'
      'FROM FI_INTEGRACAO_CONTABIL,'
      '     FI_PLANO_PATRONAL,'
      '     FI_VARIAVEL,'
      '     FI_GRUPO_INTEGRACAO_CONTABIL'
      
        'WHERE FI_INTEGRACAO_CONTABIL.CD_PESSOA_PATROC = FI_PLANO_PATRONA' +
        'L.CD_PESSOA_PATROC'
      
        '  AND FI_INTEGRACAO_CONTABIL.CD_PESSOA_ENTID = FI_PLANO_PATRONAL' +
        '.CD_PESSOA_ENTID'
      
        '  AND FI_INTEGRACAO_CONTABIL.CD_PLANO = FI_PLANO_PATRONAL.CD_PLA' +
        'NO'
      
        '  AND FI_INTEGRACAO_CONTABIL.NO_VARIAVEL = FI_VARIAVEL.NO_VARIAV' +
        'EL'
      
        '  AND FI_INTEGRACAO_CONTABIL.CD_GRUPO_CONTABIL = FI_GRUPO_INTEGR' +
        'ACAO_CONTABIL.CD_GRUPO_CONTABIL'
      'ORDER BY FI_INTEGRACAO_CONTABIL.DT_REFERENCIA,'
      '         FI_PLANO_PATRONAL.NO_PLANO,'
      '         FI_GRUPO_INTEGRACAO_CONTABIL.DS_GRUPO_CONTABIL,'
      '         FI_VARIAVEL.NO_VARIAVEL')
    UpdateObject = UpdtSQLPrincipal
    ValidateWithMask = True
    Left = 253
    Top = 215
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
      LookupDataSet = QryLkpGrupoGeral
      LookupKeyFields = 'CD_GRUPO_CONTABIL'
      LookupResultField = 'DS_GRUPO_CONTABIL'
      KeyFields = 'CD_GRUPO_CONTABIL'
      Size = 50
      Lookup = True
    end
    object QryPrincipallkpVariavel: TStringField
      FieldKind = fkLookup
      FieldName = 'lkpVariavel'
      LookupDataSet = QryLkpVariavelGeral
      LookupKeyFields = 'NO_VARIAVEL'
      LookupResultField = 'NO_VARIAVEL'
      KeyFields = 'NO_VARIAVEL'
      Size = 30
      Lookup = True
    end
    object QryPrincipallkpContaContabil: TStringField
      FieldKind = fkLookup
      FieldName = 'lkpContaContabil'
      LookupDataSet = QryLkpContaContabilGeral
      LookupKeyFields = 'CD_CONTA_CONTABIL'
      LookupResultField = 'DESCRICAO'
      KeyFields = 'CD_CONTA_CONTABIL'
      Size = 100
      Lookup = True
    end
    object QryPrincipalCD_PESSOA_PATROC: TFloatField
      FieldName = 'CD_PESSOA_PATROC'
      Origin = 'BASEDADOS.FI_INTEGRACAO_CONTABIL.CD_PESSOA_PATROC'
    end
    object QryPrincipalCD_PESSOA_ENTID: TFloatField
      FieldName = 'CD_PESSOA_ENTID'
      Origin = 'BASEDADOS.FI_INTEGRACAO_CONTABIL.CD_PESSOA_ENTID'
    end
    object QryPrincipalCD_PLANO: TFloatField
      FieldName = 'CD_PLANO'
      Origin = 'BASEDADOS.FI_INTEGRACAO_CONTABIL.CD_PLANO'
    end
    object QryPrincipalCD_GRUPO_CONTABIL: TFloatField
      FieldName = 'CD_GRUPO_CONTABIL'
      Origin = 'BASEDADOS.FI_INTEGRACAO_CONTABIL.CD_GRUPO_CONTABIL'
    end
    object QryPrincipalCD_CONTA_CONTABIL: TStringField
      FieldName = 'CD_CONTA_CONTABIL'
      Origin = 'BASEDADOS.FI_INTEGRACAO_CONTABIL.CD_CONTA_CONTABIL'
    end
    object QryPrincipalNO_VARIAVEL: TStringField
      FieldName = 'NO_VARIAVEL'
      Origin = 'BASEDADOS.FI_INTEGRACAO_CONTABIL.NO_VARIAVEL'
      FixedChar = True
    end
    object QryPrincipalDT_REFERENCIA: TDateTimeField
      FieldName = 'DT_REFERENCIA'
      Origin = 'BASEDADOS.FI_INTEGRACAO_CONTABIL.DT_REFERENCIA'
    end
    object QryPrincipalVL_VARIAVEL: TFloatField
      FieldName = 'VL_VARIAVEL'
      Origin = 'BASEDADOS.FI_INTEGRACAO_CONTABIL.VL_VARIAVEL'
      DisplayFormat = '#,###,###,##0.00'
    end
    object QryPrincipalTRGDTINCLUSAO: TDateTimeField
      FieldName = 'TRGDTINCLUSAO'
      Origin = 'BASEDADOS.FI_INTEGRACAO_CONTABIL.TRGDTINCLUSAO'
    end
    object QryPrincipalTRGUSERINCLUSAO: TStringField
      FieldName = 'TRGUSERINCLUSAO'
      Origin = 'BASEDADOS.FI_INTEGRACAO_CONTABIL.TRGUSERINCLUSAO'
      Size = 30
    end
  end
  object UpdtSQLPrincipal: TUpdateSQL
    ModifySQL.Strings = (
      'update FI_INTEGRACAO_CONTABIL'
      'set'
      '  CD_PESSOA_PATROC = :CD_PESSOA_PATROC,'
      '  CD_PESSOA_ENTID = :CD_PESSOA_ENTID,'
      '  CD_PLANO = :CD_PLANO,'
      '  CD_GRUPO_CONTABIL = :CD_GRUPO_CONTABIL,'
      '  NO_VARIAVEL = :NO_VARIAVEL,'
      '  CD_CONTA_CONTABIL = :CD_CONTA_CONTABIL,'
      '  DT_REFERENCIA = :DT_REFERENCIA,'
      '  VL_VARIAVEL = :VL_VARIAVEL'
      'where'
      '  CD_PESSOA_PATROC = :OLD_CD_PESSOA_PATROC and'
      '  CD_PESSOA_ENTID = :OLD_CD_PESSOA_ENTID and'
      '  CD_PLANO = :OLD_CD_PLANO and'
      '  CD_GRUPO_CONTABIL = :OLD_CD_GRUPO_CONTABIL and'
      '  NO_VARIAVEL = :OLD_NO_VARIAVEL and'
      '  CD_CONTA_CONTABIL = :OLD_CD_CONTA_CONTABIL and'
      '  DT_REFERENCIA = :OLD_DT_REFERENCIA')
    InsertSQL.Strings = (
      'insert into FI_INTEGRACAO_CONTABIL'
      '  (CD_PESSOA_PATROC, CD_PESSOA_ENTID, CD_PLANO, '
      'CD_GRUPO_CONTABIL, NO_VARIAVEL, '
      '   CD_CONTA_CONTABIL, DT_REFERENCIA, VL_VARIAVEL)'
      'values'
      '  (:CD_PESSOA_PATROC, :CD_PESSOA_ENTID, :CD_PLANO, '
      ':CD_GRUPO_CONTABIL, '
      
        '   :NO_VARIAVEL, :CD_CONTA_CONTABIL, :DT_REFERENCIA, :VL_VARIAVE' +
        'L)')
    DeleteSQL.Strings = (
      'delete from FI_INTEGRACAO_CONTABIL'
      'where'
      '  CD_PESSOA_PATROC = :OLD_CD_PESSOA_PATROC and'
      '  CD_PESSOA_ENTID = :OLD_CD_PESSOA_ENTID and'
      '  CD_PLANO = :OLD_CD_PLANO and'
      '  CD_GRUPO_CONTABIL = :OLD_CD_GRUPO_CONTABIL and'
      '  NO_VARIAVEL = :OLD_NO_VARIAVEL and'
      '  CD_CONTA_CONTABIL = :OLD_CD_CONTA_CONTABIL and'
      '  DT_REFERENCIA = :OLD_DT_REFERENCIA')
    Left = 309
    Top = 215
  end
  object dsLkpGrupo: TwwDataSource
    DataSet = QryLkpGrupo
    Left = 337
    Top = 243
  end
  object QryLkpGrupo: TwwQuery
    DatabaseName = 'BaseDados'
    DataSource = dsLkpPlano
    SQL.Strings = (
      'SELECT DISTINCT FI_CONTA_INTEGRACAO_CONTABIL.CD_PESSOA_PATROC,'
      '       FI_CONTA_INTEGRACAO_CONTABIL.CD_PLANO,'
      '       FI_GRUPO_INTEGRACAO_CONTABIL.CD_GRUPO_CONTABIL,'
      '       FI_GRUPO_INTEGRACAO_CONTABIL.DS_GRUPO_CONTABIL'
      'FROM FI_GRUPO_INTEGRACAO_CONTABIL, FI_CONTA_INTEGRACAO_CONTABIL'
      
        'WHERE FI_GRUPO_INTEGRACAO_CONTABIL.CD_GRUPO_CONTABIL = FI_CONTA_' +
        'INTEGRACAO_CONTABIL.CD_GRUPO_CONTABIL'
      
        '  AND FI_CONTA_INTEGRACAO_CONTABIL.CD_PESSOA_PATROC = :CD_PESSOA' +
        '_PATROC'
      '  AND FI_CONTA_INTEGRACAO_CONTABIL.CD_PLANO = :CD_PLANO'
      'ORDER BY DS_GRUPO_CONTABIL'
      ' '
      ' '
      ' '
      ' ')
    ValidateWithMask = True
    Left = 309
    Top = 243
    ParamData = <
      item
        DataType = ftFloat
        Name = 'CD_PESSOA_PATROC'
        ParamType = ptUnknown
      end
      item
        DataType = ftFloat
        Name = 'CD_PLANO'
        ParamType = ptUnknown
      end>
    object QryLkpGrupoCD_PESSOA_PATROC: TFloatField
      FieldName = 'CD_PESSOA_PATROC'
      Origin = 'BASEDADOS.FI_CONTA_INTEGRACAO_CONTABIL.CD_PESSOA_PATROC'
    end
    object QryLkpGrupoCD_PLANO: TFloatField
      FieldName = 'CD_PLANO'
      Origin = 'BASEDADOS.FI_CONTA_INTEGRACAO_CONTABIL.CD_PLANO'
    end
    object QryLkpGrupoCD_GRUPO_CONTABIL: TFloatField
      FieldName = 'CD_GRUPO_CONTABIL'
      Origin = 'BASEDADOS.FI_GRUPO_INTEGRACAO_CONTABIL.CD_GRUPO_CONTABIL'
    end
    object QryLkpGrupoDS_GRUPO_CONTABIL: TStringField
      DisplayLabel = 'GRUPO'
      DisplayWidth = 50
      FieldName = 'DS_GRUPO_CONTABIL'
      Origin = 'BASEDADOS.FI_GRUPO_INTEGRACAO_CONTABIL.DS_GRUPO_CONTABIL'
      Size = 50
    end
  end
  object QryLkpVariavel: TwwQuery
    DatabaseName = 'BaseDados'
    DataSource = dsLkpGrupo
    SQL.Strings = (
      'SELECT DISTINCT CD_PESSOA_PATROC,'
      '       CD_PLANO,'
      '       CD_GRUPO_CONTABIL,'
      '       NO_VARIAVEL'
      'FROM FI_CONTA_INTEGRACAO_CONTABIL'
      'WHERE CD_PESSOA_PATROC = :CD_PESSOA_PATROC'
      '  AND CD_PLANO = :CD_PLANO'
      '  AND CD_GRUPO_CONTABIL = :CD_GRUPO_CONTABIL'
      'ORDER BY NO_VARIAVEL'
      ' '
      ' ')
    ValidateWithMask = True
    Left = 365
    Top = 243
    ParamData = <
      item
        DataType = ftFloat
        Name = 'CD_PESSOA_PATROC'
        ParamType = ptUnknown
      end
      item
        DataType = ftFloat
        Name = 'CD_PLANO'
        ParamType = ptUnknown
      end
      item
        DataType = ftFloat
        Name = 'CD_GRUPO_CONTABIL'
        ParamType = ptUnknown
      end>
    object QryLkpVariavelCD_PESSOA_PATROC: TFloatField
      FieldName = 'CD_PESSOA_PATROC'
      Origin = 'BASEDADOS.FI_CONTA_INTEGRACAO_CONTABIL.CD_PESSOA_PATROC'
    end
    object QryLkpVariavelCD_PLANO: TFloatField
      FieldName = 'CD_PLANO'
      Origin = 'BASEDADOS.FI_CONTA_INTEGRACAO_CONTABIL.CD_PLANO'
    end
    object QryLkpVariavelCD_GRUPO_CONTABIL: TFloatField
      FieldName = 'CD_GRUPO_CONTABIL'
      Origin = 'BASEDADOS.FI_CONTA_INTEGRACAO_CONTABIL.CD_GRUPO_CONTABIL'
    end
    object QryLkpVariavelNO_VARIAVEL: TStringField
      DisplayLabel = 'VARIÁVEL'
      DisplayWidth = 60
      FieldName = 'NO_VARIAVEL'
      Origin = 'BASEDADOS.FI_CONTA_INTEGRACAO_CONTABIL.NO_VARIAVEL'
      FixedChar = True
    end
  end
  object QryLkpContaContabil: TwwQuery
    DatabaseName = 'BaseDados'
    DataSource = dsLkpVariavel
    SQL.Strings = (
      
        'SELECT DISTINCT TRIM(CD_CONTA_CONTABIL) AS CD_CONTA_CONTABIL, TR' +
        'IM(CD_CONTA_CONTABIL) ||'#39' - '#39'|| PLANOCONTA.PLANOME AS DESCRICAO'
      'FROM FI_CONTA_INTEGRACAO_CONTABIL, PLANOCONTA'
      
        'WHERE TRIM(FI_CONTA_INTEGRACAO_CONTABIL.CD_CONTA_CONTABIL) = TRI' +
        'M(PLANOCONTA.PLACONTA)'
      '/* linha [3] */'
      '  AND CD_PESSOA_PATROC = :CD_PESSOA_PATROC'
      '  AND CD_PLANO = :CD_PLANO'
      '  AND CD_GRUPO_CONTABIL = :CD_GRUPO_CONTABIL'
      '  AND NO_VARIAVEL = :NO_VARIAVEL'
      'ORDER BY CD_CONTA_CONTABIL'
      ''
      ' '
      ' ')
    ValidateWithMask = True
    Left = 393
    Top = 215
    ParamData = <
      item
        DataType = ftFloat
        Name = 'CD_PESSOA_PATROC'
        ParamType = ptUnknown
      end
      item
        DataType = ftFloat
        Name = 'CD_PLANO'
        ParamType = ptUnknown
      end
      item
        DataType = ftFloat
        Name = 'CD_GRUPO_CONTABIL'
        ParamType = ptUnknown
      end
      item
        DataType = ftFixedChar
        Name = 'NO_VARIAVEL'
        ParamType = ptUnknown
      end>
    object QryLkpContaContabilCD_CONTA_CONTABIL: TStringField
      FieldName = 'CD_CONTA_CONTABIL'
      Origin = 'BASEDADOS.FI_CONTA_INTEGRACAO_CONTABIL.CD_CONTA_CONTABIL'
    end
    object QryLkpContaContabilDESCRICAO: TStringField
      FieldName = 'DESCRICAO'
      Origin = 'BASEDADOS.FI_CONTA_INTEGRACAO_CONTABIL.CD_CONTA_CONTABIL'
      Size = 63
    end
  end
  object dsLkpVariavel: TwwDataSource
    DataSet = QryLkpVariavel
    Left = 393
    Top = 243
  end
  object QryLkpPatrocinadora: TwwQuery
    DatabaseName = 'BaseDados'
    SQL.Strings = (
      'SELECT CD_PESSOA_PATROC, NO_PESSOA '
      'FROM FI_PESSOA_JURIDICA, FI_PATROCINADORA'
      'WHERE CD_PESSOA = CD_PESSOA_PATROC'
      'ORDER BY NO_PESSOA')
    ValidateWithMask = True
    Left = 337
    Top = 215
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
    Left = 365
    Top = 215
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
    Left = 253
    Top = 243
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
  object dsLkpPlano: TwwDataSource
    DataSet = QryLkpPlano
    Left = 281
    Top = 243
  end
  object QryLkpGrupoGeral: TwwQuery
    DatabaseName = 'BaseDados'
    SQL.Strings = (
      'SELECT DISTINCT FI_CONTA_INTEGRACAO_CONTABIL.CD_PESSOA_PATROC,'
      '       FI_CONTA_INTEGRACAO_CONTABIL.CD_PLANO,'
      '       FI_GRUPO_INTEGRACAO_CONTABIL.CD_GRUPO_CONTABIL,'
      '       FI_GRUPO_INTEGRACAO_CONTABIL.DS_GRUPO_CONTABIL'
      'FROM FI_GRUPO_INTEGRACAO_CONTABIL, FI_CONTA_INTEGRACAO_CONTABIL'
      
        'WHERE FI_GRUPO_INTEGRACAO_CONTABIL.CD_GRUPO_CONTABIL = FI_CONTA_' +
        'INTEGRACAO_CONTABIL.CD_GRUPO_CONTABIL'
      'ORDER BY DS_GRUPO_CONTABIL ')
    ValidateWithMask = True
    Left = 253
    Top = 271
    object FloatField1: TFloatField
      FieldName = 'CD_PESSOA_PATROC'
      Origin = 'BASEDADOS.FI_CONTA_INTEGRACAO_CONTABIL.CD_PESSOA_PATROC'
    end
    object FloatField2: TFloatField
      FieldName = 'CD_PLANO'
      Origin = 'BASEDADOS.FI_CONTA_INTEGRACAO_CONTABIL.CD_PLANO'
    end
    object FloatField3: TFloatField
      FieldName = 'CD_GRUPO_CONTABIL'
      Origin = 'BASEDADOS.FI_GRUPO_INTEGRACAO_CONTABIL.CD_GRUPO_CONTABIL'
    end
    object StringField1: TStringField
      FieldName = 'DS_GRUPO_CONTABIL'
      Origin = 'BASEDADOS.FI_GRUPO_INTEGRACAO_CONTABIL.DS_GRUPO_CONTABIL'
      Size = 50
    end
  end
  object QryLkpVariavelGeral: TwwQuery
    DatabaseName = 'BaseDados'
    SQL.Strings = (
      'SELECT DISTINCT CD_PESSOA_PATROC,'
      '       CD_PLANO,'
      '       CD_GRUPO_CONTABIL,'
      '       NO_VARIAVEL'
      'FROM FI_CONTA_INTEGRACAO_CONTABIL'
      'ORDER BY NO_VARIAVEL')
    ValidateWithMask = True
    Left = 281
    Top = 271
    object FloatField4: TFloatField
      FieldName = 'CD_PESSOA_PATROC'
      Origin = 'BASEDADOS.FI_CONTA_INTEGRACAO_CONTABIL.CD_PESSOA_PATROC'
    end
    object FloatField5: TFloatField
      FieldName = 'CD_PLANO'
      Origin = 'BASEDADOS.FI_CONTA_INTEGRACAO_CONTABIL.CD_PLANO'
    end
    object FloatField6: TFloatField
      FieldName = 'CD_GRUPO_CONTABIL'
      Origin = 'BASEDADOS.FI_CONTA_INTEGRACAO_CONTABIL.CD_GRUPO_CONTABIL'
    end
    object StringField2: TStringField
      FieldName = 'NO_VARIAVEL'
      Origin = 'BASEDADOS.FI_CONTA_INTEGRACAO_CONTABIL.NO_VARIAVEL'
      FixedChar = True
    end
  end
  object QryLkpContaContabilGeral: TwwQuery
    DatabaseName = 'BaseDados'
    SQL.Strings = (
      
        'SELECT DISTINCT TRIM(CD_CONTA_CONTABIL) AS CD_CONTA_CONTABIL, TR' +
        'IM(PLACONTA) ||'#39' - '#39'|| PLANOME AS DESCRICAO'
      'FROM FI_CONTA_INTEGRACAO_CONTABIL, PLANOCONTA'
      
        'WHERE TRIM(FI_CONTA_INTEGRACAO_CONTABIL.CD_CONTA_CONTABIL) = TRI' +
        'M(PLANOCONTA.PLACONTA)'
      'ORDER BY CD_CONTA_CONTABIL'
      ' ')
    ValidateWithMask = True
    Left = 309
    Top = 271
    object StringField3: TStringField
      FieldName = 'CD_CONTA_CONTABIL'
      Origin = 'BASEDADOS.FI_CONTA_INTEGRACAO_CONTABIL.CD_CONTA_CONTABIL'
    end
    object StringField4: TStringField
      FieldName = 'DESCRICAO'
      Origin = 'BASEDADOS.PLANOCONTA.PLACONTA'
      Size = 61
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
    Left = 393
    Top = 187
  end
end
