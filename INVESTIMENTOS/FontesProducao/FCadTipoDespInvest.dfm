inherited frmCadTipoDespInvest: TfrmCadTipoDespInvest
  Left = 378
  Top = 179
  Caption = 'Tipos de Rubrica'
  ClientHeight = 314
  ClientWidth = 414
  PixelsPerInch = 96
  TextHeight = 13
  inherited pnlFundo: TPanel
    Width = 414
    Height = 228
    object Label15: TLabel
      Left = 12
      Top = 102
      Width = 84
      Height = 13
      AutoSize = False
      Caption = 'Tipo Credor '
      Visible = False
    end
    object LbLDescParamEmissor: TLabel
      Left = 12
      Top = 15
      Width = 62
      Height = 13
      Caption = 'Descrição '
    end
    object LblIdRegra: TLabel
      Left = 12
      Top = 55
      Width = 39
      Height = 13
      Caption = 'Moeda'
    end
    object Label1: TLabel
      Left = 336
      Top = 15
      Width = 40
      Height = 13
      Caption = 'Código'
    end
    object DbLkcCredor: TwwDBLookupCombo
      Left = 12
      Top = 118
      Width = 387
      Height = 21
      DropDownAlignment = taLeftJustify
      Selected.Strings = (
        'RAZAOSOCIAL'#9'40'#9'Fornecedor')
      LookupTable = QryCredor
      LookupField = 'IDPESSOA'
      Options = [loColLines, loRowLines, loTitles]
      TabOrder = 3
      AutoDropDown = True
      ShowButton = True
      AllowClearKey = False
      ShowMatchText = True
    end
    object DbCmbTipoCredor: TwwDBComboBox
      Left = 12
      Top = 118
      Width = 154
      Height = 21
      ShowButton = True
      Style = csDropDown
      MapList = True
      AllowClearKey = True
      AutoDropDown = True
      ShowMatchText = True
      DataField = 'TIPCREDOR'
      DataSource = ds
      DropDownCount = 8
      ItemHeight = 0
      Items.Strings = (
        'Corretor'#9'CO'
        'Emissor'#9'EM')
      Sorted = False
      TabOrder = 4
      UnboundDataType = wwDefault
      Visible = False
    end
    object wwDBEDescricao: TwwDBEdit
      Left = 12
      Top = 29
      Width = 317
      Height = 21
      DataField = 'DESCTIPODESPINV'
      DataSource = ds
      TabOrder = 0
      UnboundDataType = wwDefault
      WantReturns = False
      WordWrap = False
    end
    object DBLkMoeda: TwwDBLookupCombo
      Left = 12
      Top = 71
      Width = 221
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
      AutoDropDown = True
      ShowButton = True
      AllowClearKey = True
      ShowMatchText = True
      OnEnter = DBLkMoedaEnter
    end
    object RgTipoCred: TRadioGroup
      Left = 241
      Top = 57
      Width = 159
      Height = 35
      Caption = ' Credor por '
      Columns = 2
      Items.Strings = (
        'Tipo'
        'R.Social')
      TabOrder = 2
      OnClick = RgTipoCredClick
    end
    object DBRadioGroup2: TDBRadioGroup
      Left = 12
      Top = 144
      Width = 389
      Height = 73
      Caption = ' Atualizações na Carteira '
      DataField = 'NATUREZAOPERACAO'
      DataSource = ds
      Items.Strings = (
        'D&espesa'
        '&Lucro'
        '&Não Altera')
      TabOrder = 5
      Values.Strings = (
        'E'
        'L'
        'N')
    end
    object dbeCodigo: TwwDBEdit
      Left = 335
      Top = 29
      Width = 63
      Height = 21
      TabStop = False
      Color = clBtnFace
      DataField = 'IDTIPODESPINVEST'
      DataSource = ds
      TabOrder = 6
      UnboundDataType = wwDefault
      WantReturns = False
      WordWrap = False
    end
  end
  inherited Dock972: TDock97
    Width = 414
  end
  inherited Dock971: TDock97
    Top = 275
    Width = 414
    inherited tb97Fundo: TToolbar97
      Left = 241
      DockPos = 241
    end
    inherited TB97oKCancelar: TToolbar97
      Left = 72
      DockPos = 72
    end
  end
  inherited ivTradutor: TIvExtendedTranslator
    Left = 376
    Top = 0
  end
  inherited ds: TwwDataSource
    Left = 301
    Top = 0
  end
  inherited upd: TUpdateSQL
    ModifySQL.Strings = (
      'update TIPODESPINVEST'
      'set'
      '  IDTIPODESPINVEST = :IDTIPODESPINVEST,'
      '  MOECODIGO = :MOECODIGO,'
      '  DESCTIPODESPINV = :DESCTIPODESPINV,'
      '  TIPCREDOR = :TIPCREDOR,'
      '  NATUREZAOPERACAO = :NATUREZAOPERACAO'
      'where'
      '  IDTIPODESPINVEST = :OLD_IDTIPODESPINVEST')
    InsertSQL.Strings = (
      'insert into TIPODESPINVEST'
      '  (IDTIPODESPINVEST, MOECODIGO, DESCTIPODESPINV, TIPCREDOR, '
      'NATUREZAOPERACAO)'
      'values'
      '  (:IDTIPODESPINVEST, :MOECODIGO, :DESCTIPODESPINV, :TIPCREDOR, '
      ':NATUREZAOPERACAO)')
    DeleteSQL.Strings = (
      'delete from TIPODESPINVEST'
      'where'
      '  IDTIPODESPINVEST = :OLD_IDTIPODESPINVEST')
    Left = 241
    Top = 0
  end
  inherited MontaSelect: TMontaSelect
    Colunas.Strings = (
      'TipoDespInvest.DescTipoDespInv')
    TipodeDado.Strings = (
      'C')
    Descricao.Strings = (
      'Descrição da Rubrica')
    SensivelACaixa.Strings = (
      'N')
    Tabelas.Strings = (
      'TipoDespInvest')
    CamposChave.Strings = (
      'TipoDespInvest.IdTipoDespInvest')
    Mascaras.Strings = (
      '')
    Larguras.Strings = (
      '100')
    OperComparador.Strings = (
      '-1')
    Left = 338
    Top = 0
  end
  inherited ImlPadrao: TImageList
    Left = 377
    Top = 0
  end
  inherited CmeCadastro: TCmEventosCadastro
    Left = 378
    Top = 0
  end
  inherited qry: TwwQuery
    AfterScroll = qryAfterScroll
    SQL.Strings = (
      'SELECT IDTIPODESPINVEST, MOECODIGO, DESCTIPODESPINV,'
      #9' TIPCREDOR, NATUREZAOPERACAO, SIGN(IDTIPODESPINVEST) AS ORDEM'
      ''
      'FROM TIPODESPINVEST'
      ''
      'ORDER BY ORDEM DESC, DESCTIPODESPINV')
    Left = 271
    Top = 0
    object qryIDTIPODESPINVEST: TFloatField
      FieldName = 'IDTIPODESPINVEST'
      Origin = 'TIPODESPINVEST.IDTIPODESPINVEST'
    end
    object qryMOECODIGO: TFloatField
      FieldName = 'MOECODIGO'
      Origin = 'TIPODESPINVEST.MOECODIGO'
    end
    object qryDESCTIPODESPINV: TStringField
      FieldName = 'DESCTIPODESPINV'
      Origin = 'TIPODESPINVEST.DESCTIPODESPINV'
      Size = 60
    end
    object qryTIPCREDOR: TStringField
      FieldName = 'TIPCREDOR'
      Origin = 'TIPODESPINVEST.TIPCREDOR'
      Size = 2
    end
    object qryNATUREZAOPERACAO: TStringField
      FieldName = 'NATUREZAOPERACAO'
      Origin = 'TIPODESPINVEST.NATUREZAOPERACAO'
      Size = 1
    end
  end
  object qryAux: TwwQuery
    DatabaseName = 'basedados'
    ValidateWithMask = True
    Left = 16
    Top = 280
  end
  object qryMoeda: TwwQuery
    DatabaseName = 'basedados'
    SQL.Strings = (
      'select    M.Moecodigo, '
      '             M.Moedesc,'
      '             M.Moesigla'
      ''
      'from     MOEDA M')
    ValidateWithMask = True
    Left = 188
    Top = 110
  end
  object QryCredor: TwwQuery
    DatabaseName = 'BaseDados'
    SQL.Strings = (
      'SELECT PS.IDPESSOA, PS.RAZAOSOCIAL'
      ''
      'FROM PESSOA PS, EMPRESAFORN EF'
      ''
      'WHERE EF.IDFORCLI = PS.IDPESSOA '
      ''
      'ORDER BY PS.RAZAOSOCIAL')
    ValidateWithMask = True
    Left = 354
    Top = 157
    object QryCredorIDPESSOA: TFloatField
      FieldName = 'IDPESSOA'
      Origin = 'PESSOA.IDPESSOA'
    end
    object QryCredorRAZAOSOCIAL: TStringField
      FieldName = 'RAZAOSOCIAL'
      Origin = 'PESSOA.RAZAOSOCIAL'
      Size = 60
    end
  end
  object QrySubTipo: TwwQuery
    DatabaseName = 'BaseDados'
    SQL.Strings = (
      'SELECT IDTIPODESPINVEST, IDFORCLI'
      ''
      'FROM FORCLIXDESPINVEST'
      ''
      'WHERE'#9'IDTIPODESPINVEST = :IDTIPODESPINVEST '#9'AND'
      '                EMPRESAPROP   '#9'    = :EMPRESAPROP')
    ValidateWithMask = True
    Left = 121
    Top = 157
    ParamData = <
      item
        DataType = ftInteger
        Name = 'IDTIPODESPINVEST'
        ParamType = ptUnknown
      end
      item
        DataType = ftInteger
        Name = 'EMPRESAPROP'
        ParamType = ptUnknown
      end>
  end
  object DsSubTipo: TwwDataSource
    DataSet = QrySubTipo
    Left = 93
    Top = 157
  end
end
