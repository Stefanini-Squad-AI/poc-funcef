inherited frmCadContribuicaoCS: TfrmCadContribuicaoCS
  Left = 182
  Top = 108
  Caption = 'Cadastro de Contribuições Assistenciais'
  ClientHeight = 270
  ClientWidth = 493
  OnActivate = FormActivate
  PixelsPerInch = 96
  TextHeight = 13
  inherited pnlFundo: TPanel
    Width = 493
    Height = 184
    object lbPeriodicidade: TLabel
      Left = 39
      Top = 95
      Width = 78
      Height = 13
      Caption = 'Periodicidade'
    end
    object lbqtdeParcelas: TLabel
      Left = 288
      Top = 139
      Width = 73
      Height = 27
      AutoSize = False
      Caption = 'Quantidade de Parcelas'
      WordWrap = True
    end
    object Label1: TLabel
      Left = 39
      Top = 12
      Width = 72
      Height = 13
      Caption = 'Contribuição'
    end
    object Label2: TLabel
      Left = 411
      Top = 12
      Width = 40
      Height = 13
      Caption = 'Código'
    end
    object Label3: TLabel
      Left = 39
      Top = 52
      Width = 92
      Height = 13
      Caption = 'Nome Resumido'
    end
    object dbedQtdParcela: TwwDBEdit
      Left = 362
      Top = 141
      Width = 44
      Height = 21
      DataField = 'QTDEPARCELAS'
      DataSource = ds
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -9
      Font.Name = 'MS Sans Serif'
      Font.Style = []
      ParentFont = False
      TabOrder = 4
      UnboundDataType = wwDefault
      WantReturns = False
      WordWrap = False
      OnEnter = dbedQtdParcelaEnter
    end
    object dbedNomeContrib: TwwDBEdit
      Left = 39
      Top = 27
      Width = 366
      Height = 21
      DataField = 'NOME'
      DataSource = ds
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -9
      Font.Name = 'MS Sans Serif'
      Font.Style = []
      MaxLength = 60
      ParentFont = False
      TabOrder = 0
      UnboundDataType = wwDefault
      WantReturns = False
      WordWrap = False
    end
    object chkTmpContrib: TCheckBox
      Left = 39
      Top = 141
      Width = 232
      Height = 17
      Alignment = taLeftJustify
      Caption = 'Tempo de Contribuição Determinado'
      TabOrder = 3
      OnClick = chkTmpContribClick
      OnEnter = chkTmpContribEnter
    end
    object dblkcmbPeriodicidade: TwwDBLookupCombo
      Left = 39
      Top = 110
      Width = 366
      Height = 21
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -9
      Font.Name = 'MS Sans Serif'
      Font.Style = []
      DropDownAlignment = taLeftJustify
      Selected.Strings = (
        'NOME'#9'30'#9'Periodicidade')
      DataField = 'IDTPPERIODICIDADE'
      DataSource = ds
      LookupTable = qryTpPer
      LookupField = 'IDTPPERIODICIDADE'
      Options = [loTitles]
      ParentFont = False
      TabOrder = 2
      AutoDropDown = True
      ShowButton = True
      AllowClearKey = False
    end
    object DBEdit1: TDBEdit
      Left = 411
      Top = 27
      Width = 64
      Height = 21
      Color = clSilver
      DataField = 'IDCONTRIBUICAO'
      DataSource = ds
      Enabled = False
      ReadOnly = True
      TabOrder = 5
    end
    object dbedNomeResum: TwwDBEdit
      Left = 39
      Top = 67
      Width = 121
      Height = 21
      DataField = 'NOMERESUM'
      DataSource = ds
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -9
      Font.Name = 'MS Sans Serif'
      Font.Style = []
      MaxLength = 10
      ParentFont = False
      TabOrder = 1
      UnboundDataType = wwDefault
      WantReturns = False
      WordWrap = False
    end
  end
  inherited Dock972: TDock97
    Width = 493
  end
  inherited Dock971: TDock97
    Top = 231
    Width = 493
    inherited tb97Fundo: TToolbar97
      Left = 269
      DockPos = 269
    end
    inherited TB97oKCancelar: TToolbar97
      Left = 101
      DockPos = 101
    end
  end
  inherited qry: TwwQuery
    Tag = 5
    BeforePost = qryBeforePost
    SQL.Strings = (
      'SELECT IDCONTRIBUICAO ,'
      'IDTPPERIODICIDADE ,'
      'NOME ,'
      'QTDEPARCELAS ,'
      'FLGOBRIGATORIA ,'
      'NOMERESUM,'
      'FLGRISCO'
      'FROM CONTRIBUICAO'
      'WHERE CONTRIBUICAO.IDCONTRIBUICAO = :IDCONTRIBUICAO'
      ' ')
    Left = 303
    Top = 2
    ParamData = <
      item
        DataType = ftFloat
        Name = 'IDCONTRIBUICAO'
        ParamType = ptUnknown
      end>
  end
  inherited ivTradutor: TIvExtendedTranslator
    Left = 9
    Top = 247
  end
  inherited upd: TUpdateSQL
    ModifySQL.Strings = (
      'update CONTRIBUICAO'
      'set'
      '  IDCONTRIBUICAO = :IDCONTRIBUICAO,'
      '  IDTPPERIODICIDADE = :IDTPPERIODICIDADE,'
      '  NOME = :NOME,'
      '  QTDEPARCELAS = :QTDEPARCELAS,'
      '  FLGOBRIGATORIA = :FLGOBRIGATORIA,'
      '  NOMERESUM = :NOMERESUM,'
      '  FLGRISCO = :FLGRISCO'
      'where'
      '  IDCONTRIBUICAO = :OLD_IDCONTRIBUICAO')
    InsertSQL.Strings = (
      'insert into CONTRIBUICAO'
      '  (IDCONTRIBUICAO, IDTPPERIODICIDADE,  NOME, QTDEPARCELAS, '
      '   FLGOBRIGATORIA,  NOMERESUM, FLGRISCO)'
      'values'
      '  (:IDCONTRIBUICAO, :IDTPPERIODICIDADE, :NOME, :QTDEPARCELAS, '
      '   :FLGOBRIGATORIA, :NOMERESUM, :FLGRISCO)')
    DeleteSQL.Strings = (
      'delete from CONTRIBUICAO'
      'where'
      '  IDCONTRIBUICAO = :OLD_IDCONTRIBUICAO')
    Left = 258
    Top = 2
  end
  inherited MontaSelect: TMontaSelect
    Colunas.Strings = (
      'NOME')
    TipodeDado.Strings = (
      'C')
    Descricao.Strings = (
      'Contribuição')
    Tabelas.Strings = (
      'CONTRIBUICAO')
    CamposChave.Strings = (
      'IDCONTRIBUICAO')
    Filtro.Strings = (
      '( IDCONTRIBUICAO NOT IN (SELECT IDCONTRIBUICAO FROM CONTPREV) )')
    Left = 399
    Top = 5
  end
  inherited ds: TwwDataSource
    Left = 348
    Top = 4
  end
  object dsTpPer: TwwDataSource [8]
    DataSet = qryTpPer
    Left = 527
    Top = 48
  end
  object qryTpPer: TwwQuery [9]
    Tag = 5
    DatabaseName = 'BaseDados'
    SQL.Strings = (
      'SELECT * FROM TPPERIODICIDADE')
    ValidateWithMask = True
    Left = 433
    Top = 195
  end
  inherited ImlPadrao: TImageList
    Left = 50
    Top = 262
  end
  inherited CmeCadastro: TCmEventosCadastro
    OnFind = CmeCadastroFind
    OpenDsAutomatico = True
    Left = 429
    Top = 126
  end
end
