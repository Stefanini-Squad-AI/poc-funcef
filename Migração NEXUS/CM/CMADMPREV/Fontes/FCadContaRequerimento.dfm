inherited frmCadContaRequerimento: TfrmCadContaRequerimento
  Left = 347
  Top = 162
  Caption = 'Conta Bancária do Beneficiário'
  ClientHeight = 275
  ClientWidth = 559
  FormStyle = fsNormal
  Visible = False
  PixelsPerInch = 96
  TextHeight = 13
  inherited pnlFundo: TPanel
    Width = 559
    Height = 236
    TabOrder = 1
    object Label1: TLabel
      Left = 14
      Top = 10
      Width = 131
      Height = 13
      Caption = 'Dados Bancários de ...'
    end
    object edNOME: TEdit
      Left = 14
      Top = 28
      Width = 382
      Height = 21
      TabStop = False
      Color = clSilver
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -9
      Font.Name = 'MS Sans Serif'
      Font.Style = []
      ParentFont = False
      ReadOnly = True
      TabOrder = 1
    end
    object grpAgencia: TGroupBox
      Left = 13
      Top = 53
      Width = 383
      Height = 169
      TabOrder = 0
      object Label38: TLabel
        Left = 90
        Top = 71
        Width = 47
        Height = 13
        Caption = 'Agência'
      end
      object Label2: TLabel
        Left = 11
        Top = 69
        Width = 65
        Height = 13
        Caption = 'Agência Nº'
      end
      object Label3: TLabel
        Left = 9
        Top = 16
        Width = 55
        Height = 13
        Caption = 'Banco Nº'
      end
      object Label4: TLabel
        Left = 92
        Top = 16
        Width = 37
        Height = 13
        Caption = 'Banco'
      end
      object Label40: TLabel
        Left = 90
        Top = 116
        Width = 86
        Height = 13
        Caption = 'Conta Corrente'
      end
      object dblkpcmbAgenciaNome: TwwDBLookupCombo
        Left = 90
        Top = 84
        Width = 282
        Height = 21
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -9
        Font.Name = 'MS Sans Serif'
        Font.Style = []
        DropDownAlignment = taLeftJustify
        Selected.Strings = (
          'AGENCIA'#9'40'#9'Agência'#9'F'
          'NUMAGENCIA'#9'15'#9'Número')
        LookupTable = qryAgenciaNome
        LookupField = 'IDPESSOA'
        Options = [loTitles]
        ParentFont = False
        TabOrder = 2
        AutoDropDown = True
        ShowButton = True
        AllowClearKey = True
        OnCloseUp = dblkpcmbAgenciaNomeCloseUp
      end
      object dblkpcmbBanco: TwwDBLookupCombo
        Left = 91
        Top = 30
        Width = 281
        Height = 21
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -9
        Font.Name = 'MS Sans Serif'
        Font.Style = []
        DropDownAlignment = taLeftJustify
        Selected.Strings = (
          'BANCO'#9'40'#9'Banco'#9'F'
          'NUMBANCO'#9'10'#9'Nº')
        LookupTable = qryBanco
        LookupField = 'BANCO'
        Options = [loTitles]
        ParentFont = False
        TabOrder = 0
        AutoDropDown = True
        ShowButton = True
        AllowClearKey = True
        OnCloseUp = dblkpcmbBancoCloseUp
        OnExit = dblkpcmbBancoExit
      end
      object edDigAgencia: TEditNum
        Left = 10
        Top = 83
        Width = 64
        Height = 21
        Hint = 'Digite este campo caso deseje procurar a agência por número'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -9
        Font.Name = 'MS Sans Serif'
        Font.Style = []
        ParentFont = False
        ParentShowHint = False
        ShowHint = True
        TabOrder = 1
        OnExit = edDigAgenciaExit
        IntDigits = 0
        Signal = False
        DecDigits = 0
        Numeric = False
      end
      object edContaCorrente: TwwDBEdit
        Left = 90
        Top = 132
        Width = 137
        Height = 21
        DataField = 'CONTACORRENTE'
        DataSource = dsCBancaria
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -9
        Font.Name = 'MS Sans Serif'
        Font.Style = []
        ParentFont = False
        TabOrder = 3
        UnboundDataType = wwDefault
        WantReturns = False
        WordWrap = False
        OnExit = edContaCorrenteExit
      end
    end
    object rgrpTipoConta: TRadioGroup
      Left = 405
      Top = 54
      Width = 140
      Height = 69
      Caption = 'Tipo'
      Items.Strings = (
        'Conta Corrente'
        'Conta Salário'
        'Poupança')
      TabOrder = 2
    end
    object dbgrpContaPref: TRadioGroup
      Left = 405
      Top = 129
      Width = 140
      Height = 45
      Caption = 'Conta Preferencial'
      Columns = 2
      Items.Strings = (
        'Não'
        'Sim')
      TabOrder = 3
    end
    object dbgrpContaConj: TRadioGroup
      Left = 406
      Top = 178
      Width = 139
      Height = 44
      Caption = 'Conta Conjunta'
      Columns = 2
      Items.Strings = (
        'Não'
        'Sim')
      TabOrder = 4
    end
  end
  inherited Dock971: TDock97
    Top = 236
    Width = 559
    inherited tb97Fundo: TToolbar97
      Left = 233
      DockPos = 233
      inherited bbtnSair: TBitBtn
        ModalResult = 2
      end
    end
    inherited TB97oKCancelar: TToolbar97
      Left = 64
      DockPos = 64
      inherited bbtnConfirmar: TBitBtn
        OnClick = bbtnConfirmarClick
      end
    end
  end
  object edDigBanco: TEditNum [2]
    Left = 22
    Top = 82
    Width = 64
    Height = 21
    Hint = 'Digite este campo caso deseje procurar o banco por número'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -9
    Font.Name = 'MS Sans Serif'
    Font.Style = []
    ParentFont = False
    ParentShowHint = False
    ShowHint = True
    TabOrder = 0
    OnExit = edDigBancoExit
    IntDigits = 0
    Signal = False
    DecDigits = 0
    Numeric = False
  end
  inherited ivTradutor: TIvExtendedTranslator
    Left = 7
    Top = 334
    TargetsData = (
      1
      2
      (
        ''
        'Text'
        0)
      (
        ''
        'Filter'
        0))
  end
  object qryBanco: TwwQuery
    DatabaseName = 'BaseDados'
    SQL.Strings = (
      'SELECT BANCO.IDPESSOA, PESSOA.NOME AS BANCO, '
      'BANCO.NUMBANCO, BANCO.FLGVALIDACC, '
      '       BANCO.MASCARACC'
      'FROM PESSOA, BANCO'
      'WHERE BANCO.IDPESSOA = PESSOA.IDPESSOA '
      'ORDER BY BANCO')
    ValidateWithMask = True
    Left = 376
    Top = 6
  end
  object qryAgenciaNome: TwwQuery
    DatabaseName = 'BaseDados'
    SQL.Strings = (
      'SELECT  AGENCIABANCARIA.IDPESSOA,'
      '               AGENCIA.NOME AS AGENCIA, '
      '               AGENCIABANCARIA.NUMAGENCIA,'
      '               AGENCIABANCARIA.IDBANCO'
      'FROM  PESSOA AGENCIA, AGENCIABANCARIA'
      'WHERE AGENCIABANCARIA.IDPESSOA  = AGENCIA.IDPESSOA AND'
      '               AGENCIABANCARIA.IDBANCO=:pIdBanco'
      'ORDER BY AGENCIA.NOME'
      '')
    ValidateWithMask = True
    Left = 459
    Top = 14
    ParamData = <
      item
        DataType = ftInteger
        Name = 'pIdBanco'
        ParamType = ptUnknown
      end>
  end
  object qryAgenciaNumero: TwwQuery
    DatabaseName = 'BaseDados'
    SQL.Strings = (
      'SELECT  AGENCIABANCARIA.IDPESSOA,'
      '               AGENCIA.NOME AS AGENCIA,'
      '               AGENCIABANCARIA.NUMAGENCIA,'
      '               AGENCIABANCARIA.IDBANCO'
      'FROM AGENCIABANCARIA, PESSOA AGENCIA'
      'WHERE AGENCIABANCARIA.IDPESSOA  = AGENCIA.IDPESSOA AND'
      '              AGENCIABANCARIA.IDBANCO=:pIdBanco'
      'ORDER BY AGENCIABANCARIA.NUMAGENCIA')
    ValidateWithMask = True
    Left = 427
    Top = 14
    ParamData = <
      item
        DataType = ftInteger
        Name = 'pIdBanco'
        ParamType = ptUnknown
      end>
  end
  object qryBancoNumero: TwwQuery
    DatabaseName = 'BaseDados'
    SQL.Strings = (
      'SELECT BANCO.IDPESSOA, PESSOA.NOME AS BANCO,'
      '       BANCO.NUMBANCO, BANCO.FLGVALIDACC, '
      '       BANCO.MASCARACC'
      'FROM PESSOA, BANCO'
      'WHERE BANCO.IDPESSOA = PESSOA.IDPESSOA '
      'ORDER BY BANCO.NUMBANCO'
      ' '
      ' ')
    ValidateWithMask = True
    Left = 341
    Top = 5
  end
  object updCBancaria: TUpdateSQL
    Left = 276
    Top = 196
  end
  object qryCBancaria: TwwQuery
    CachedUpdates = True
    DatabaseName = 'BaseDados'
    SQL.Strings = (
      'SELECT CB.IDCBANCARIA,CB.FLGCONTAPREF,'
      '       AGENCIA.NOME AS NOMEAGENCIA,'
      '       BANCO.NOME   AS BANCO,'
      '       CB.IDAGENCIA,'
      '       CB.CONTACORRENTE,'
      '       CB.TIPOCONTA,'
      '       CB.FLGCONTACONJUNTA,'
      '       B.NUMBANCO,'
      '       AB.NUMAGENCIA, B.IDPESSOA AS IDBANCO'
      ''
      'FROM  PESSOA AGENCIA, PESSOA BANCO, CONTABANCARIA CB,'
      '      AGENCIABANCARIA AB,  BANCO B'
      'WHERE CB.IDPESSOA        = :IDPESSOA'
      'AND   CB.FLGCONTAPREF     = 1'
      'AND   AB.IDPESSOA(+)      = CB.IDAGENCIA'
      'AND   AGENCIA.IDPESSOA(+) = AB.IDPESSOA'
      'AND   BANCO.IDPESSOA(+)   = AB.IDBANCO'
      'AND   B.IDPESSOA(+)       = AB.IDBANCO'
      'AND   CB.IDCBANCARIA = ( SELECT MAX(IDCBANCARIA) '
      '                         FROM   CONTABANCARIA'
      '                         WHERE  IDPESSOA     = :IDPESSOA'
      '                         AND    FLGCONTAPREF = 1 )'
      ''
      ' ')
    UpdateObject = updCBancaria
    ValidateWithMask = True
    Left = 318
    Top = 189
    ParamData = <
      item
        DataType = ftInteger
        Name = 'IDPESSOA'
        ParamType = ptUnknown
      end
      item
        DataType = ftInteger
        Name = 'IDPESSOA'
        ParamType = ptUnknown
      end>
  end
  object dsCBancaria: TwwDataSource
    AutoEdit = False
    DataSet = qryCBancaria
    Left = 342
    Top = 202
  end
end
