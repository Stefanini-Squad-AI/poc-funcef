inherited frmPRelListaBeneficio: TfrmPRelListaBeneficio
  Left = 227
  Top = 174
  Caption = 'Relação Mensal de Benefícios Pagos'
  ClientHeight = 261
  ClientWidth = 447
  FormStyle = fsNormal
  Visible = False
  PixelsPerInch = 96
  TextHeight = 13
  inherited pnlFundo: TPanel
    Width = 447
    Height = 222
    object grpMesAnoRef: TGroupBox
      Left = 41
      Top = 134
      Width = 265
      Height = 64
      Caption = ' Mês e Ano de Pagamento '
      TabOrder = 1
      object cmbMesRef: TComboBox
        Left = 6
        Top = 21
        Width = 187
        Height = 21
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -9
        Font.Name = 'MS Sans Serif'
        Font.Style = []
        ItemHeight = 13
        ParentFont = False
        TabOrder = 0
        Text = 'cmbMesRef'
        Items.Strings = (
          'janeiro'
          'fevereiro'
          'março'
          'abril'
          'maio'
          'junho'
          'julho'
          'agosto'
          'setembro '
          'outubro'
          'novembro'
          'dezembro'
          'Contribuição sobre 13º')
      end
      object spedAnoRef: TSpinEdit
        Left = 198
        Top = 21
        Width = 55
        Height = 22
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -9
        Font.Name = 'MS Sans Serif'
        Font.Style = []
        MaxLength = 4
        MaxValue = 0
        MinValue = 0
        ParentFont = False
        TabOrder = 1
        Value = 1998
      end
    end
    object GroupBox1: TGroupBox
      Left = 42
      Top = 21
      Width = 352
      Height = 105
      TabOrder = 0
      object Label1: TLabel
        Left = 9
        Top = 18
        Width = 118
        Height = 13
        Caption = 'Plano Previdenciário'
      end
      object Label2: TLabel
        Left = 9
        Top = 62
        Width = 56
        Height = 13
        Caption = 'Benefício'
      end
      object dblkpcmbPlano: TwwDBLookupCombo
        Left = 9
        Top = 33
        Width = 334
        Height = 21
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -9
        Font.Name = 'MS Sans Serif'
        Font.Style = []
        DropDownAlignment = taLeftJustify
        Selected.Strings = (
          'NOME'#9'50'#9'Plano Previdenciário')
        LookupTable = qryPlano
        LookupField = 'IDPLANOPREV'
        Options = [loTitles]
        ParentFont = False
        TabOrder = 0
        AutoDropDown = True
        ShowButton = True
        AllowClearKey = True
        OnCloseUp = dblkpcmbPlanoCloseUp
      end
      object dblkpcmbBeneficio: TwwDBLookupCombo
        Left = 9
        Top = 75
        Width = 334
        Height = 21
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -9
        Font.Name = 'MS Sans Serif'
        Font.Style = []
        DropDownAlignment = taLeftJustify
        Selected.Strings = (
          'NOME'#9'60'#9'Benefício')
        LookupTable = qryBeneficio
        LookupField = 'IDBENEFICIO'
        Options = [loTitles]
        ParentFont = False
        TabOrder = 1
        AutoDropDown = True
        ShowButton = True
        AllowClearKey = True
      end
    end
  end
  inherited Dock971: TDock97
    Top = 222
    Width = 447
    inherited tb97Fundo: TToolbar97
      Left = 257
      DockPos = 257
    end
    inherited TB97oKCancelar: TToolbar97
      Left = 89
      DockPos = 89
      inherited bbtnConfirmar: TBitBtn
        OnClick = bbtnConfirmarClick
      end
    end
  end
  inherited ivTradutor: TIvExtendedTranslator
    Left = 0
    Top = 252
    TargetsData = (
      1
      1
      (
        ''
        'Text'
        0))
  end
  object qryPlano: TwwQuery
    DatabaseName = 'BaseDados'
    SQL.Strings = (
      'SELECT IDPLANOPREV, NOME FROM PLANPREV'
      'WHERE  IDPLANOPREV IN (SELECT PLP.IDPLANOPREV'
      '                       FROM   PLANPREVPATRO PLP, PATRO PT'
      '                       WHERE  PT.IDFUNDACAO = :IDFUNDACAO'
      '                       AND    PLP.IDPESSJUR = PT.IDPESSOA )'
      'ORDER BY NOME'
      ' ')
    ValidateWithMask = True
    Left = 408
    Top = 33
    ParamData = <
      item
        DataType = ftInteger
        Name = 'IDFUNDACAO'
        ParamType = ptUnknown
      end>
  end
  object qryBeneficio: TwwQuery
    DatabaseName = 'BaseDados'
    SQL.Strings = (
      'SELECT B.IDBENEFICIO, B.NOME, M.MOEDESC, M.MOESIGLA'
      'FROM BENEFICIO B, BENEFPLANPREV BP, MOEDA M'
      'WHERE BP.IDPLANOPREV = :IDPLANOPREV'
      'AND BP.IDBENEFICIO = B.IDBENEFICIO'
      'AND BP.INDICEREAJBENEF = M.MOECODIGO(+)')
    ValidateWithMask = True
    Left = 414
    Top = 135
    ParamData = <
      item
        DataType = ftFloat
        Name = 'IDPLANOPREV'
        ParamType = ptUnknown
      end>
  end
  object dsPlano: TwwDataSource
    DataSet = qryPlano
    Left = 408
    Top = 84
  end
end
