inherited frmCadImpostoInvest: TfrmCadImpostoInvest
  Left = 101
  Top = 164
  Caption = 'Tipos de Imposto'
  ClientHeight = 244
  ClientWidth = 388
  OnCloseQuery = nil
  OnCreate = nil
  OnPaint = nil
  OnResize = nil
  PixelsPerInch = 96
  TextHeight = 13
  inherited pnlFundo: TPanel
    Width = 388
    Height = 158
    object LbLDescParamEmissor: TLabel
      Left = 12
      Top = 13
      Width = 62
      Height = 13
      Caption = 'Descrição '
    end
    object LblIdRegra: TLabel
      Left = 12
      Top = 54
      Width = 39
      Height = 13
      Caption = 'Moeda'
    end
    object Label15: TLabel
      Left = 12
      Top = 102
      Width = 84
      Height = 13
      AutoSize = False
      Caption = 'Tipo Credor '
      Visible = False
    end
    object DbLkcCredor: TwwDBLookupCombo
      Left = 12
      Top = 126
      Width = 361
      Height = 21
      DropDownAlignment = taLeftJustify
      Selected.Strings = (
        'RAZAOSOCIAL'#9'40'#9'Fornecedor')
      DataField = 'CREDOR'
      DataSource = ds
      LookupTable = QryCredor
      LookupField = 'IDPESSOA'
      Options = [loColLines, loRowLines, loTitles]
      TabOrder = 3
      AutoDropDown = True
      ShowButton = True
      AllowClearKey = False
      ShowMatchText = True
    end
    object wwDBEDescricao: TwwDBEdit
      Left = 12
      Top = 27
      Width = 363
      Height = 21
      DataField = 'DESCIMPOSTOINVEST'
      DataSource = ds
      TabOrder = 0
      UnboundDataType = wwDefault
      WantReturns = False
      WordWrap = False
    end
    object DBLkMoeda: TwwDBLookupCombo
      Left = 12
      Top = 70
      Width = 197
      Height = 21
      DropDownAlignment = taLeftJustify
      Selected.Strings = (
        'MOEDESC'#9'40'#9'Moedas')
      DataField = 'MOECODIGO'
      DataSource = ds
      LookupTable = qryMoeda
      LookupField = 'MOECODIGO'
      Options = [loColLines, loRowLines, loTitles]
      TabOrder = 1
      AutoDropDown = False
      ShowButton = True
      AllowClearKey = False
    end
    object DbCmbTipoCredor: TwwDBComboBox
      Left = 12
      Top = 118
      Width = 154
      Height = 21
      ShowButton = True
      Style = csDropDown
      MapList = True
      AllowClearKey = False
      DataField = 'TIPCREDOR'
      DataSource = ds
      DropDownCount = 8
      ItemHeight = 0
      Items.Strings = (
        'Corretor'#9'CO'
        'Emissor'#9'EM')
      Sorted = False
      TabOrder = 2
      UnboundDataType = wwDefault
      Visible = False
    end
    object RgTipoCred: TRadioGroup
      Left = 216
      Top = 56
      Width = 159
      Height = 35
      Caption = ' Credor por '
      Columns = 2
      Items.Strings = (
        'Tipo'
        'R.Social')
      TabOrder = 4
      OnClick = RgTipoCredClick
    end
  end
  inherited Dock972: TDock97
    Width = 388
  end
  inherited Dock971: TDock97
    Top = 205
    Width = 388
    inherited tb97Fundo: TToolbar97
      Left = 216
      DockPos = 216
    end
    inherited TB97oKCancelar: TToolbar97
      Left = 47
      DockPos = 47
      inherited bbtnConfirmar: TBitBtn
        Enabled = False
      end
      inherited bbtnCancelar: TBitBtn
        Enabled = False
      end
    end
  end
  inherited ds: TwwDataSource
    Left = 287
  end
  inherited upd: TUpdateSQL
    ModifySQL.Strings = (
      'update CM.ImpostoInvest'
      'set'
      '  IDIMPOSTOINVEST = :IDIMPOSTOINVEST,'
      '  DESCIMPOSTOINVEST = :DESCIMPOSTOINVEST,'
      '  MOECODIGO = :MOECODIGO,'
      '  TIPCREDOR = :TIPCREDOR,'
      '  CREDOR = :CREDOR'
      'where'
      '  IDIMPOSTOINVEST = :OLD_IDIMPOSTOINVEST')
    InsertSQL.Strings = (
      'insert into CM.ImpostoInvest'
      
        '  (IDIMPOSTOINVEST, DESCIMPOSTOINVEST, MOECODIGO, TIPCREDOR, CRE' +
        'DOR)'
      'values'
      
        '  (:IDIMPOSTOINVEST, :DESCIMPOSTOINVEST, :MOECODIGO, :TIPCREDOR,' +
        ' :CREDOR)')
    DeleteSQL.Strings = (
      'delete from CM.ImpostoInvest'
      'where'
      '  IDIMPOSTOINVEST = :OLD_IDIMPOSTOINVEST')
    Left = 225
  end
  inherited MontaSelect: TMontaSelect
    Colunas.Strings = (
      'DESCIMPOSTOINVEST')
    TipodeDado.Strings = (
      'C')
    Descricao.Strings = (
      'Descrição do Imposto')
    Tabelas.Strings = (
      'CM.IMPOSTOINVEST')
    CamposChave.Strings = (
      'IDIMPOSTOINVEST')
    Mascaras.Strings = (
      ''
      '')
    Larguras.Strings = (
      '100')
    Left = 349
  end
  inherited qry: TwwQuery
    AfterScroll = qryAfterScroll
    SQL.Strings = (
      'SELECT '#9'IDIMPOSTOINVEST, MOECODIGO, DESCIMPOSTOINVEST, '
      #9'TIPCREDOR, CREDOR '
      ''
      'FROM CM.IMPOSTOINVEST')
    Left = 256
  end
  object qryAux: TwwQuery
    DatabaseName = 'basedados'
    ValidateWithMask = True
    Left = 318
    Top = 8
  end
  object qryMoeda: TwwQuery
    DatabaseName = 'basedados'
    SQL.Strings = (
      'select    M.Moecodigo, '
      '             M.Moedesc,'
      '             M.Moesigla'
      ''
      'from     CM.MOEDA M')
    ValidateWithMask = True
    Left = 292
    Top = 56
  end
  object QryCredor: TwwQuery
    DatabaseName = 'BaseDados'
    SQL.Strings = (
      'SELECT IDPESSOA, RAZAOSOCIAL, FLGFORNSERV'
      ''
      'FROM CM.PESSOA'
      ''
      'WHERE (FLGFORNSERV = 1) ')
    ValidateWithMask = True
    Left = 328
    Top = 56
    object QryCredorRAZAOSOCIAL: TStringField
      DisplayLabel = 'Fornecedor'
      DisplayWidth = 40
      FieldName = 'RAZAOSOCIAL'
      Origin = 'PESSOA.RAZAOSOCIAL'
      Size = 60
    end
    object QryCredorIDPESSOA: TFloatField
      FieldName = 'IDPESSOA'
      Origin = 'PESSOA.IDPESSOA'
      Visible = False
    end
    object QryCredorFLGFORNSERV: TFloatField
      FieldName = 'FLGFORNSERV'
      Origin = 'PESSOA.FLGFORNSERV'
      Visible = False
    end
  end
end
