inherited frmPRelCredBenef: TfrmPRelCredBenef
  Left = 85
  Top = 200
  HelpContext = 180101
  Caption = 'Relação de Crédito de Beneficiários - analítico'
  ClientHeight = 233
  ClientWidth = 628
  FormStyle = fsMDIForm
  Visible = False
  PixelsPerInch = 96
  TextHeight = 13
  inherited pnlFundo: TPanel
    Width = 628
    Height = 194
    object pnlOpcoes: TPanel
      Left = 16
      Top = 62
      Width = 595
      Height = 123
      BorderStyle = bsSingle
      TabOrder = 1
      object Label2: TLabel
        Left = 420
        Top = 82
        Width = 66
        Height = 13
        Caption = 'Assinaturas'
        Visible = False
      end
      object edass2: TEdit
        Left = 222
        Top = 101
        Width = 171
        Height = 21
        CharCase = ecUpperCase
        TabOrder = 1
        Visible = False
      end
      object edass1: TEdit
        Left = 414
        Top = 98
        Width = 171
        Height = 21
        CharCase = ecUpperCase
        TabOrder = 0
        Visible = False
      end
      object cboxBanco: TCheckBox
        Left = 24
        Top = 24
        Width = 65
        Height = 17
        Caption = 'Banco'
        TabOrder = 2
        OnClick = cboxBancoClick
      end
      object cboxAgencia: TCheckBox
        Left = 24
        Top = 70
        Width = 65
        Height = 17
        Caption = 'Agência'
        Enabled = False
        TabOrder = 3
        OnClick = cboxAgenciaClick
      end
      object lkpBanco: TwwDBLookupCombo
        Left = 104
        Top = 22
        Width = 472
        Height = 21
        DropDownAlignment = taLeftJustify
        Selected.Strings = (
          'NOME'#9'60'#9'NOME')
        LookupTable = qryBanco
        LookupField = 'IDPESSOA'
        TabOrder = 4
        AutoDropDown = False
        ShowButton = True
        AllowClearKey = False
        OnCloseUp = lkpBancoCloseUp
      end
      object lkpAgencia: TwwDBLookupCombo
        Left = 104
        Top = 68
        Width = 472
        Height = 21
        DropDownAlignment = taLeftJustify
        Selected.Strings = (
          'NOME'#9'60'#9'NOME')
        LookupTable = qryAgencia
        LookupField = 'NUMAGENCIA'
        Enabled = False
        TabOrder = 5
        AutoDropDown = False
        ShowButton = True
        AllowClearKey = False
        OnCloseUp = lkpAgenciaCloseUp
      end
    end
    object grpMesRef: TGroupBox
      Left = 17
      Top = 8
      Width = 594
      Height = 48
      Caption = 'Histórico'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = [fsBold]
      ParentFont = False
      TabOrder = 0
      object dblkfolha: TwwDBLookupCombo
        Left = 16
        Top = 16
        Width = 561
        Height = 21
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'MS Sans Serif'
        Font.Style = []
        DropDownAlignment = taLeftJustify
        Selected.Strings = (
          'HISTORICO'#9'50'#9'Histórico'#9'F')
        LookupTable = qryHist
        LookupField = 'IDHSTFOLHABENEF'
        Options = [loTitles]
        ParentFont = False
        TabOrder = 0
        AutoDropDown = True
        ShowButton = True
        AllowClearKey = True
      end
    end
  end
  inherited Dock971: TDock97
    Top = 194
    Width = 628
    inherited tb97Fundo: TToolbar97
      Left = 367
    end
    inherited TB97oKCancelar: TToolbar97
      Left = 190
      inherited bbtnConfirmar: TBitBtn
        OnClick = rbtnVisualizarClick
      end
    end
  end
  inherited ivTradutor: TIvExtendedTranslator
    Left = 11
    TargetsData = (
      1
      1
      (
        ''
        'Text'
        0))
  end
  object qryHist: TwwQuery
    DatabaseName = 'BaseDados'
    SQL.Strings = (
      'SELECT'
      '  IDHSTFOLHABENEF,'
      '  IDHSTFOLHABENEF||'#39' - '#39'||HISTORICO AS HISTORICO,'
      '  MESREFERENCIA'
      ''
      'FROM'
      '  HSTFOLHABENEF'
      ''
      'WHERE'
      '  FLGESTADO <> 2'
      ''
      'ORDER BY'
      '  IDHSTFOLHABENEF DESC')
    ValidateWithMask = True
    Left = 144
    Top = 173
  end
  object qryBanco: TwwQuery
    DatabaseName = 'BaseDados'
    SQL.Strings = (
      'SELECT'
      '      B.IDPESSOA,'
      '      P.NOME'
      'FROM'
      '      PESSOA P,'
      '      BANCO B'
      'WHERE'
      '      P.IDPESSOA = B.IDPESSOA '
      'ORDER BY'
      '      P.NOME'
      ''
      ''
      ''
      ''
      '')
    ValidateWithMask = True
    Left = 150
    Top = 145
    object qryBancoNOME: TStringField
      DisplayWidth = 60
      FieldName = 'NOME'
      Origin = 'PESSOA.NOME'
      Size = 60
    end
    object qryBancoIDPESSOA: TFloatField
      FieldName = 'IDPESSOA'
      Origin = 'BANCO.IDPESSOA'
    end
  end
  object MontaSelectBanco: TMontaSelect
    Template.IdConsulta = 0
    Caption = 'Seleciona'
    Colunas.Strings = (
      'BANCO.NUMBANCO'
      'PESSOA.NOME')
    TipodeDado.Strings = (
      'C'
      'C')
    Descricao.Strings = (
      'Número do Banco'
      'Nome do Banco')
    SensivelACaixa.Strings = (
      'N'
      'N')
    Tabelas.Strings = (
      'PESSOA'
      'BANCO')
    CamposChave.Strings = (
      'PESSOA.NOME'
      'BANCO.IDPESSOA')
    Filtro.Strings = (
      'PESSOA.IDPESSOA = BANCO.IDPESSOA')
    Mascaras.Strings = (
      ''
      '')
    Larguras.Strings = (
      '10'
      '60')
    DataBaseName = 'BaseDados'
    RepeteConsulta = False
    UsaDistinct = False
    SalvaConsulta = False
    ExibePergunta = True
    MultiSelect = False
    Left = 549
    Top = 78
  end
  object qryRefBen: TwwQuery
    DatabaseName = 'BaseDados'
    SQL.Strings = (
      'SELECT DISTINCT B.IDBENEFICIO,B.NOME'
      'FROM HSTFOLHABENEFCAP HCAP, HSTBENEFBFCIARIO HSB, '
      '     BENEFICIO B'
      'WHERE HCAP.IDHSTFOLHABENEF = :idhstfolhaben AND'
      '      HCAP.CODDOCUMENTO = HSB.CODDOCUMENTO AND'
      '      HSB.IDBENEFICIO = B.IDBENEFICIO'
      ''
      '')
    ValidateWithMask = True
    Left = 38
    Top = 169
    ParamData = <
      item
        DataType = ftInteger
        Name = 'idhstfolhaben'
        ParamType = ptUnknown
        Value = 8
      end>
  end
  object qryAgencia: TwwQuery
    DatabaseName = 'BaseDados'
    SQL.Strings = (
      '  SELECT'
      #9'AG.NUMAGENCIA,'
      #9'PA.NOME'
      'FROM'
      #9'PESSOA PA,'
      #9'AGENCIABANCARIA AG,'
      #9'BANCO B'
      'WHERE'
      #9'PA.IDPESSOA = AG.IDPESSOA'
      '   AND AG.IDBANCO = B.IDPESSOA'
      '   AND B.IDPESSOA =:P1'
      'ORDER BY'
      '   PA.NOME'
      ''
      ''
      '')
    ValidateWithMask = True
    Left = 154
    Top = 64
    ParamData = <
      item
        DataType = ftString
        Name = 'P1'
        ParamType = ptUnknown
      end>
    object qryAgenciaNOME: TStringField
      DisplayWidth = 60
      FieldName = 'NOME'
      Origin = 'PESSOA.NOME'
      Size = 60
    end
    object qryAgenciaNUMAGENCIA: TStringField
      FieldName = 'NUMAGENCIA'
      Origin = 'AGENCIABANCARIA.NUMAGENCIA'
      Visible = False
      Size = 15
    end
  end
end
