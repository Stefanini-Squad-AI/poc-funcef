inherited frmCadContribuicaoCS: TfrmCadContribuicaoCS
  Left = 509
  Top = 289
  HelpContext = 160108
  Caption = 'Cadastro de Contribuição'
  ClientHeight = 432
  ClientWidth = 492
  OnActivate = FormActivate
  PixelsPerInch = 96
  TextHeight = 13
  inherited pnlFundo: TPanel
    Width = 492
    Height = 346
    object lbPeriodicidade: TLabel
      Left = 39
      Top = 139
      Width = 78
      Height = 13
      Caption = 'Periodicidade'
    end
    object lbqtdeParcelas: TLabel
      Left = 288
      Top = 183
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
    object Label4: TLabel
      Left = 39
      Top = 224
      Width = 119
      Height = 13
      Caption = 'Tipo de Contribuição'
    end
    object dbedQtdParcela: TwwDBEdit
      Left = 362
      Top = 185
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
      TabOrder = 6
      UnboundDataType = wwDefault
      WantReturns = False
      WordWrap = False
      OnEnter = dbedQtdParcelaEnter
      OnKeyPress = dbedQtdParcelaKeyPress
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
      Top = 185
      Width = 232
      Height = 17
      Alignment = taLeftJustify
      Caption = 'Tempo de Contribuição Determinado'
      TabOrder = 5
      OnClick = chkTmpContribClick
      OnEnter = chkTmpContribEnter
    end
    object dbrgrpFormaCont: TDBRadioGroup
      Left = 39
      Top = 92
      Width = 366
      Height = 40
      Caption = 'Forma da Contribuição'
      Columns = 3
      DataField = 'FLGOBRIGATORIA'
      DataSource = ds
      Items.Strings = (
        '&Obrigatória'
        'O&pcional'
        '&Esporádica')
      TabOrder = 3
      TabStop = True
      Values.Strings = (
        'O'
        'P'
        'E')
      OnChange = dbrgrpFormaContChange
    end
    object dblkcmbPeriodicidade: TwwDBLookupCombo
      Left = 39
      Top = 154
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
      TabOrder = 4
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
      TabOrder = 9
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
    object dbrgrpRisco: TDBRadioGroup
      Left = 177
      Top = 51
      Width = 226
      Height = 37
      Caption = 'Para Cobrir Benefício de Risco ?'
      Columns = 2
      DataField = 'FLGRISCO'
      DataSource = ds
      Items.Strings = (
        'Não'
        'Sim')
      TabOrder = 2
      TabStop = True
      Values.Strings = (
        '0'
        '1')
    end
    object dblckTpContrib: TwwDBLookupCombo
      Left = 39
      Top = 239
      Width = 366
      Height = 21
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -9
      Font.Name = 'MS Sans Serif'
      Font.Style = []
      DropDownAlignment = taLeftJustify
      Selected.Strings = (
        'NOME'#9'30'#9'Tipo Contribuição')
      DataField = 'IDTPCONTRIBUICAO'
      DataSource = ds
      LookupTable = qryTpContrib
      LookupField = 'IDTPCONTRIBUICAO'
      ParentFont = False
      TabOrder = 7
      AutoDropDown = True
      ShowButton = True
      AllowClearKey = False
    end
    object cbAltSituacao: TCheckBox
      Left = 39
      Top = 265
      Width = 365
      Height = 17
      Hint = 
        'Altera a situação da contribuição para "Enviada e Não Recebida" ' +
        'no processo de Desfazer na funcionalidade de Recebimento via Fol' +
        'ha do módulo Contribuição Previdenciária'
      Alignment = taLeftJustify
      Caption = 'Altera a Situação da Contribuição no Desfazer Recebimento '
      ParentShowHint = False
      ShowHint = True
      TabOrder = 8
      OnClick = chkTmpContribClick
      OnEnter = chkTmpContribEnter
    end
    object dbrgTipoPortab: TDBRadioGroup
      Left = 39
      Top = 290
      Width = 366
      Height = 44
      Columns = 2
      DataField = 'TIPOPORTABILIDADE'
      DataSource = ds
      Enabled = False
      Items.Strings = (
        '&Aberta'
        '&Fechada')
      TabOrder = 10
      TabStop = True
      Values.Strings = (
        'A'
        'F')
      OnChange = dbrgrpFormaContChange
    end
    object chkTipoPortab: TCheckBox
      Left = 46
      Top = 288
      Width = 148
      Height = 17
      Caption = ' Tipo de Portabilidade '
      TabOrder = 11
      OnClick = chkTipoPortabClick
    end
  end
  inherited Dock972: TDock97
    Width = 492
  end
  inherited Dock971: TDock97
    Top = 393
    Width = 492
    inherited tb97Fundo: TToolbar97
      Left = 270
      DockPos = 270
    end
    inherited TB97oKCancelar: TToolbar97
      Left = 101
      DockPos = 101
    end
  end
  inherited ivTradutor: TIvExtendedTranslator
    Left = 457
    Top = 391
  end
  inherited ds: TwwDataSource
    Left = 348
    Top = 4
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
      '  FLGRISCO = :FLGRISCO,'
      '  IDTPCONTRIBUICAO = :IDTPCONTRIBUICAO,'
      '  FLGALTERASITRECEB = :FLGALTERASITRECEB,'
      '  TIPOPORTABILIDADE = :TIPOPORTABILIDADE'
      'where'
      '  IDCONTRIBUICAO = :OLD_IDCONTRIBUICAO')
    InsertSQL.Strings = (
      'insert into CONTRIBUICAO'
      '  (IDCONTRIBUICAO, IDTPPERIODICIDADE,  NOME, QTDEPARCELAS, '
      '   FLGOBRIGATORIA,  NOMERESUM, FLGRISCO, IDTPCONTRIBUICAO,'
      '  FLGALTERASITRECEB, TIPOPORTABILIDADE)'
      'values'
      '  (:IDCONTRIBUICAO, :IDTPPERIODICIDADE, :NOME, :QTDEPARCELAS, '
      '   :FLGOBRIGATORIA, :NOMERESUM, :FLGRISCO, :IDTPCONTRIBUICAO,'
      '   :FLGALTERASITRECEB, :TIPOPORTABILIDADE)')
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
    SensivelACaixa.Strings = (
      'N')
    Tabelas.Strings = (
      'CONTRIBUICAO')
    CamposChave.Strings = (
      'IDCONTRIBUICAO')
    Mascaras.Strings = (
      '')
    Larguras.Strings = (
      '60')
    OperComparador.Strings = (
      '-1')
    Left = 399
    Top = 5
  end
  inherited ImlPadrao: TImageList
    Left = 26
    Top = 390
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
    Top = 187
  end
  inherited CmeCadastro: TCmEventosCadastro
    OnFind = CmeCadastroFind
    OpenDsAutomatico = True
    Left = 429
    Top = 118
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
      'FLGRISCO,'
      'IDTPCONTRIBUICAO,'
      'FLGALTERASITRECEB,'
      'TIPOPORTABILIDADE'
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
  object qryTpContrib: TwwQuery
    Tag = 5
    DatabaseName = 'BaseDados'
    SQL.Strings = (
      'SELECT idtpcontribuicao, NOME '
      'FROM TPCONTRIBUICAO '
      'ORDER BY NOME')
    ValidateWithMask = True
    Left = 433
    Top = 267
  end
end
