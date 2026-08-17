inherited frmCadTpBonusTrabCS: TfrmCadTpBonusTrabCS
  Left = 135
  Top = 93
  Caption = 'Cadastro de Tipos de Bônus Trabalhistas'
  ClientHeight = 376
  ClientWidth = 442
  OnActivate = FormActivate
  PixelsPerInch = 96
  TextHeight = 13
  inherited pnlFundo: TPanel
    Width = 442
    Height = 290
    object Label1: TLabel
      Left = 28
      Top = 20
      Width = 40
      Height = 13
      Caption = 'Código'
    end
    object Label2: TLabel
      Left = 28
      Top = 65
      Width = 58
      Height = 13
      Caption = 'Descrição'
    end
    object Label5: TLabel
      Left = 28
      Top = 114
      Width = 179
      Height = 13
      Caption = 'Tempo de Permanência Mínimo'
    end
    object Label3: TLabel
      Left = 148
      Top = 134
      Width = 36
      Height = 13
      Caption = 'meses'
    end
    object lblRegra: TLabel
      Left = 26
      Top = 191
      Width = 267
      Height = 13
      Caption = 'Regra de cálculo do bônus - Período usufruido'
    end
    object Label4: TLabel
      Left = 26
      Top = 235
      Width = 293
      Height = 13
      Caption = 'Regra de Cálculo do bônus - Período não usufruido'
    end
    object dbedCodBonusTrab: TwwDBEdit
      Left = 28
      Top = 33
      Width = 121
      Height = 21
      DataField = 'CODBONUSTRAB'
      DataSource = ds
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -9
      Font.Name = 'MS Sans Serif'
      Font.Style = []
      ParentFont = False
      TabOrder = 0
      UnboundDataType = wwDefault
      WantReturns = False
      WordWrap = False
    end
    object dbedDescricao: TwwDBEdit
      Left = 28
      Top = 78
      Width = 378
      Height = 21
      DataField = 'DESCRICAO'
      DataSource = ds
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -9
      Font.Name = 'MS Sans Serif'
      Font.Style = []
      ParentFont = False
      TabOrder = 1
      UnboundDataType = wwDefault
      WantReturns = False
      WordWrap = False
    end
    object dbedTempoPermanMinimo: TwwDBEdit
      Left = 28
      Top = 127
      Width = 115
      Height = 21
      DataField = 'TEMPOPERMANMINIMO'
      DataSource = ds
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -9
      Font.Name = 'MS Sans Serif'
      Font.Style = []
      ParentFont = False
      TabOrder = 2
      UnboundDataType = wwDefault
      WantReturns = False
      WordWrap = False
    end
    object dbchkFlgTempoContinuo: TDBCheckBox
      Left = 28
      Top = 162
      Width = 255
      Height = 17
      Caption = 'Período para bônus deve ser contínuo'
      DataField = 'FLGTEMPOCONTINUO'
      DataSource = ds
      TabOrder = 3
      ValueChecked = '1'
      ValueUnchecked = '0'
    end
    object dblkpcmbIdRegraUsado: TwwDBLookupCombo
      Left = 26
      Top = 204
      Width = 378
      Height = 21
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -9
      Font.Name = 'MS Sans Serif'
      Font.Style = []
      DropDownAlignment = taLeftJustify
      Selected.Strings = (
        'NOMEREGRA'#9'60'#9'Regra')
      DataField = 'IDREGRAUSADA'
      DataSource = ds
      LookupTable = qryRegra
      LookupField = 'IDREGRA'
      ParentFont = False
      TabOrder = 4
      AutoDropDown = True
      ShowButton = True
      AllowClearKey = True
    end
    object dblkpcmbIdRegraNaoUsado: TwwDBLookupCombo
      Left = 26
      Top = 248
      Width = 378
      Height = 21
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -9
      Font.Name = 'MS Sans Serif'
      Font.Style = []
      DropDownAlignment = taLeftJustify
      Selected.Strings = (
        'NOMEREGRA'#9'60'#9'Regra')
      DataField = 'IDREGRANAOUSADO'
      DataSource = ds
      LookupTable = qryRegra
      LookupField = 'IDREGRA'
      ParentFont = False
      TabOrder = 5
      AutoDropDown = True
      ShowButton = True
      AllowClearKey = True
    end
  end
  inherited Dock972: TDock97
    Width = 442
  end
  inherited Dock971: TDock97
    Top = 337
    Width = 442
    inherited tb97Fundo: TToolbar97
      Left = 269
      DockPos = 269
    end
    inherited TB97oKCancelar: TToolbar97
      Left = 100
      DockPos = 100
    end
  end
  inherited ds: TwwDataSource
    OnStateChange = dsStateChange
    Left = 339
    Top = 6
  end
  inherited upd: TUpdateSQL
    ModifySQL.Strings = (
      'update TPBONUSTRAB'
      'set'
      '  DESCRICAO = :DESCRICAO,'
      '  TEMPOPERMANMINIMO = :TEMPOPERMANMINIMO,'
      '  FLGTEMPOCONTINUO = :FLGTEMPOCONTINUO,'
      '  IDREGRAUSADA = :IDREGRAUSADA,'
      '  IDREGRANAOUSADO = :IDREGRANAOUSADO'
      'where'
      '  CODBONUSTRAB = :OLD_CODBONUSTRAB')
    InsertSQL.Strings = (
      'insert into TPBONUSTRAB'
      '  (CODBONUSTRAB, DESCRICAO, TEMPOPERMANMINIMO, '
      'FLGTEMPOCONTINUO, IDREGRAUSADA, '
      '   IDREGRANAOUSADO)'
      'values'
      '  (:CODBONUSTRAB, :DESCRICAO, :TEMPOPERMANMINIMO, '
      ':FLGTEMPOCONTINUO, :IDREGRAUSADA, '
      '   :IDREGRANAOUSADO)')
    DeleteSQL.Strings = (
      'delete from TPBONUSTRAB'
      'where'
      '  CODBONUSTRAB = :OLD_CODBONUSTRAB')
    Left = 259
    Top = 4
  end
  inherited MontaSelect: TMontaSelect
    Colunas.Strings = (
      'CODBONUSTRAB'
      'DESCRICAO')
    TipodeDado.Strings = (
      'C'
      'C')
    Descricao.Strings = (
      'Código'
      'Descrição')
    Tabelas.Strings = (
      'TPBONUSTRAB')
    CamposChave.Strings = (
      'CODBONUSTRAB')
    Mascaras.Strings = (
      ''
      '')
    Larguras.Strings = (
      '10'
      '60')
    Top = 6
  end
  inherited CmeCadastro: TCmEventosCadastro
    OnFind = CmeCadastroFind
    Left = 358
    Top = 58
  end
  inherited qry: TwwQuery
    AfterInsert = qryAfterInsert
    BeforePost = qryBeforePost
    SQL.Strings = (
      'SELECT CODBONUSTRAB, DESCRICAO,  TEMPOPERMANMINIMO,'
      '               FLGTEMPOCONTINUO, IDREGRAUSADA, IDREGRANAOUSADO'
      'FROM TPBONUSTRAB'
      'WHERE CODBONUSTRAB =:pCodBonusTrab')
    Left = 301
    Top = 4
    ParamData = <
      item
        DataType = ftString
        Name = 'pCodBonusTrab'
        ParamType = ptUnknown
      end>
  end
  object qryRegra: TwwQuery
    DatabaseName = 'BaseDados'
    SQL.Strings = (
      'SELECT IDREGRA, NOMEREGRA  FROM REGRA '
      'ORDER BY NOMEREGRA')
    ValidateWithMask = True
    Left = 13
    Top = 332
  end
  object qryAux: TwwQuery
    DatabaseName = 'BaseDados'
    ValidateWithMask = True
    Left = 62
    Top = 331
  end
end
