inherited frmCadPlanoContabPatro: TfrmCadPlanoContabPatro
  Left = 293
  Top = 198
  Caption = 'Cadastro de Plano Contábil por Patrocinadora'
  ClientHeight = 216
  ClientWidth = 343
  PixelsPerInch = 96
  TextHeight = 13
  inherited pnlFundo: TPanel
    Width = 343
    Height = 130
    object lblPlanoContabil: TLabel
      Left = 16
      Top = 16
      Width = 83
      Height = 13
      Caption = 'Plano Contábil'
    end
    object lblPatrocinadora: TLabel
      Left = 16
      Top = 64
      Width = 80
      Height = 13
      Caption = 'Patrocinadora'
    end
    object dblPlanoContabil: TwwDBLookupCombo
      Left = 16
      Top = 33
      Width = 305
      Height = 21
      DropDownAlignment = taLeftJustify
      Selected.Strings = (
        'NOME'#9'50'#9'Nome'#9'F')
      DataField = 'IDPLANOPREV'
      DataSource = ds
      LookupTable = QryPlanoContabil
      LookupField = 'IDPLANOPREV'
      Options = [loColLines, loRowLines, loTitles]
      Style = csDropDownList
      TabOrder = 0
      AutoDropDown = True
      ShowButton = True
      AllowClearKey = False
      ShowMatchText = True
    end
    object dblPatrocinadora: TwwDBLookupCombo
      Left = 16
      Top = 81
      Width = 305
      Height = 21
      DropDownAlignment = taLeftJustify
      Selected.Strings = (
        'NOME'#9'60'#9'Nome'#9'F')
      DataField = 'IDPATRO'
      DataSource = ds
      LookupTable = QryPatrocinadora
      LookupField = 'IDPESSOA'
      Options = [loColLines, loRowLines, loTitles]
      Style = csDropDownList
      TabOrder = 1
      AutoDropDown = True
      ShowButton = True
      AllowClearKey = False
      ShowMatchText = True
    end
  end
  inherited Dock972: TDock97
    Width = 343
    inherited Toolbar971: TToolbar97
      inherited sbtnAlterar: TToolbarButton97
        Visible = False
      end
    end
  end
  inherited Dock971: TDock97
    Top = 177
    Width = 343
    inherited tb97Fundo: TToolbar97
      Left = 173
    end
    inherited TB97oKCancelar: TToolbar97
      Left = 6
    end
  end
  inherited qry: TwwQuery
    SQL.Strings = (
      'SELECT'
      '   PA.IDPLANPREVCTBPATR,'
      '   PA.IDPLANOPREV,'
      '   PA.IDPATRO'
      'FROM'
      '   PESSOA PE,'
      '   PLANPREVCONTABPATRO PA,'
      '   PLANPREVCONTABIL PL,'
      '   PATRO PT'
      'WHERE'
      '   (PA.IDPLANPREVCTBPATR = :IDPLANPREVCTBPATR) AND'
      '   (PA.IDPATRO = PE.IDPESSOA)  AND'
      '   (PA.IDPLANOPREV = PL.IDPLANOPREV)'
      ' '
      ' ')
    Top = 6
    ParamData = <
      item
        DataType = ftInteger
        Name = 'IDPLANPREVCTBPATR'
        ParamType = ptUnknown
      end>
    object qryIDPLANPREVCTBPATR: TFloatField
      FieldName = 'IDPLANPREVCTBPATR'
      Origin = 'BASEDADOS.PLANPREVCONTABPATRO.IDPLANPREVCTBPATR'
    end
    object qryIDPLANOPREV: TFloatField
      FieldName = 'IDPLANOPREV'
      Origin = 'BASEDADOS.PLANPREVCONTABPATRO.IDPLANOPREV'
    end
    object qryIDPATRO: TFloatField
      FieldName = 'IDPATRO'
      Origin = 'BASEDADOS.PLANPREVCONTABPATRO.IDPATRO'
    end
  end
  inherited ivTradutor: TIvExtendedTranslator
    Top = 6
  end
  inherited upd: TUpdateSQL
    ModifySQL.Strings = (
      'update PLANPREVCONTABPATRO'
      'set'
      '  IDPLANPREVCTBPATR = :IDPLANPREVCTBPATR,'
      '  IDPLANOPREV = :IDPLANOPREV,'
      '  IDPATRO = :IDPATRO'
      'where'
      '  IDPLANPREVCTBPATR = :OLD_IDPLANPREVCTBPATR')
    InsertSQL.Strings = (
      'insert into PLANPREVCONTABPATRO'
      '  (IDPLANPREVCTBPATR, IDPLANOPREV, IDPATRO)'
      'values'
      '  (:IDPLANPREVCTBPATR, :IDPLANOPREV, :IDPATRO)')
    DeleteSQL.Strings = (
      'delete from PLANPREVCONTABPATRO'
      'where'
      '  IDPLANPREVCTBPATR = :OLD_IDPLANPREVCTBPATR')
    Top = 6
  end
  inherited MontaSelect: TMontaSelect
    Colunas.Strings = (
      'PLANPREVCONTABIL.NOME'
      'PESSOA.NOME')
    TipodeDado.Strings = (
      'C'
      'C')
    Descricao.Strings = (
      'Plano'
      'Patrocinadora')
    SensivelACaixa.Strings = (
      'N'
      'N')
    Tabelas.Strings = (
      'PESSOA'
      'PLANPREVCONTABIL'
      'PLANPREVCONTABPATRO')
    CamposChave.Strings = (
      'PLANPREVCONTABPATRO.IDPLANPREVCTBPATR')
    Filtro.Strings = (
      'PLANPREVCONTABPATRO.IDPATRO = PESSOA.IDPESSOA'
      'PLANPREVCONTABPATRO.IDPLANOPREV = PLANPREVCONTABIL.IDPLANOPREV')
    Mascaras.Strings = (
      ''
      '')
    Larguras.Strings = (
      '50'
      '60')
    Top = 6
  end
  inherited ds: TwwDataSource
    Top = 6
  end
  inherited ImlPadrao: TImageList
    Top = 6
  end
  inherited CmeCadastro: TCmEventosCadastro
    OnFind = CmeCadastroFind
    BeforeConfirma = CmeCadastroBeforeConfirma
    Top = 6
  end
  object QryPlanoContabil: TwwQuery
    CachedUpdates = True
    DatabaseName = 'BaseDados'
    SQL.Strings = (
      'SELECT '
      '     IDPLANOPREV,NOME '
      'FROM '
      '     CM.PLANPREVCONTABIL')
    ValidateWithMask = True
    Left = 26
    Top = 46
    object QryPlanoContabilNOME: TStringField
      DisplayLabel = 'Nome'
      DisplayWidth = 50
      FieldName = 'NOME'
      Origin = 'BASEDADOS.PLANPREVCONTABIL.NOME'
      Size = 50
    end
    object QryPlanoContabilIDPLANOPREV: TFloatField
      DisplayWidth = 10
      FieldName = 'IDPLANOPREV'
      Origin = 'BASEDADOS.PLANPREVCONTABIL.IDPLANOPREV'
      Visible = False
    end
  end
  object QryPatrocinadora: TwwQuery
    CachedUpdates = True
    DatabaseName = 'BaseDados'
    SQL.Strings = (
      'SELECT '
      '     PA.IDPESSOA,'
      '     PE.NOME'
      'FROM '
      '     PESSOA PE,'
      '     PATRO PA'
      'WHERE '
      '     PE.IDPESSOA = PA.IDPESSOA')
    ValidateWithMask = True
    Left = 26
    Top = 102
    object QryPatrocinadoraNOME: TStringField
      DisplayLabel = 'Nome'
      DisplayWidth = 60
      FieldName = 'NOME'
      Origin = 'BASEDADOS.PESSOA.NOME'
      Size = 60
    end
    object QryPatrocinadoraIDPESSOA: TFloatField
      DisplayWidth = 10
      FieldName = 'IDPESSOA'
      Origin = 'BASEDADOS.PATRO.IDPESSOA'
      Visible = False
    end
  end
end
