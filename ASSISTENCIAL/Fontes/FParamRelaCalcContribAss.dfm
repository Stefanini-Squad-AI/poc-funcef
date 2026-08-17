inherited frmParamRelaCalcContribAss: TfrmParamRelaCalcContribAss
  Left = 213
  Top = 165
  Caption = 'Demonstrativo do Cálculo de Contribuições'
  ClientHeight = 244
  ClientWidth = 357
  FormStyle = fsNormal
  Visible = False
  PixelsPerInch = 96
  TextHeight = 13
  object Label2: TLabel [0]
    Left = 18
    Top = 133
    Width = 45
    Height = 13
    Caption = 'Produto'
  end
  inherited pnlFundo: TPanel
    Width = 357
    Height = 205
    object Patrocinadora: TLabel
      Left = 32
      Top = 67
      Width = 80
      Height = 13
      Caption = 'Patrocinadora'
    end
    object label1: TLabel
      Left = 32
      Top = 109
      Width = 45
      Height = 13
      Caption = 'Produto'
    end
    object Label3: TLabel
      Left = 32
      Top = 148
      Width = 27
      Height = 13
      Caption = 'Filial'
    end
    object dblcpatro: TCMDBLookupCombo
      Left = 32
      Top = 84
      Width = 292
      Height = 21
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -9
      Font.Name = 'MS Sans Serif'
      Font.Style = []
      DropDownAlignment = taLeftJustify
      Selected.Strings = (
        'NOME'#9'40'#9'NOME')
      LookupTable = qrypatro
      LookupField = 'IDPESSOA'
      Options = [loColLines, loRowLines, loTitles]
      Style = csDropDownList
      ParentFont = False
      TabOrder = 1
      AutoDropDown = True
      ShowButton = True
      AllowClearKey = True
      ShowMatchText = True
    end
    object dblcproduto: TCMDBLookupCombo
      Left = 32
      Top = 123
      Width = 292
      Height = 21
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -9
      Font.Name = 'MS Sans Serif'
      Font.Style = []
      DropDownAlignment = taLeftJustify
      Selected.Strings = (
        'NOME'#9'40'#9'Produto')
      LookupTable = qryproduto
      LookupField = 'IDPLANASS'
      Options = [loTitles]
      Style = csDropDownList
      ParentFont = False
      TabOrder = 2
      AutoDropDown = True
      ShowButton = True
      AllowClearKey = True
      ShowMatchText = True
    end
    object GroupBox1: TGroupBox
      Left = 18
      Top = 9
      Width = 169
      Height = 49
      Caption = 'Mês de Referência'
      TabOrder = 0
      object dbsAno: TwwDBSpinEdit
        Left = 108
        Top = 18
        Width = 50
        Height = 21
        Increment = 1
        Value = 2001
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -9
        Font.Name = 'MS Sans Serif'
        Font.Style = []
        ParentFont = False
        TabOrder = 1
        UnboundDataType = wwDefault
      end
      object cbmes: TComboBox
        Left = 9
        Top = 18
        Width = 94
        Height = 21
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -9
        Font.Name = 'MS Sans Serif'
        Font.Style = []
        ItemHeight = 13
        Items.Strings = (
          'Janeiro'
          'Fevereiro'
          'Março'
          'Abril'
          'Maio'
          'Junho'
          'Julho'
          'Agosto'
          'Setembro'
          'Outubro'
          'Novembro'
          'Dezembro')
        ParentFont = False
        TabOrder = 0
      end
    end
    object rdgFormaPgto: TRadioGroup
      Left = 192
      Top = 9
      Width = 139
      Height = 49
      Caption = ' Forma '
      Columns = 2
      Items.Strings = (
        'Folha'
        'Banco')
      TabOrder = 3
      OnClick = rdgFormaPgtoClick
    end
    object dblcfilial: TCMDBLookupCombo
      Left = 32
      Top = 162
      Width = 292
      Height = 21
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -9
      Font.Name = 'MS Sans Serif'
      Font.Style = []
      DropDownAlignment = taLeftJustify
      Selected.Strings = (
        'NOME'#9'40'#9'NOME')
      LookupTable = qryfilial
      LookupField = 'IDPESSOA'
      Options = [loColLines, loRowLines, loTitles]
      Style = csDropDownList
      ParentFont = False
      TabOrder = 4
      AutoDropDown = True
      ShowButton = True
      AllowClearKey = True
      ShowMatchText = True
    end
  end
  inherited Dock971: TDock97
    Top = 205
    Width = 357
    inherited tb97Fundo: TToolbar97
      Left = 187
      DockPos = 187
    end
    inherited TB97oKCancelar: TToolbar97
      Left = 19
      DockPos = 19
      inherited bbtnConfirmar: TBitBtn
        OnClick = bbtnConfirmarClick
      end
      inherited bbtnCancelar: TBitBtn
        OnClick = bbtnCancelarClick
      end
    end
  end
  inherited ivTradutor: TIvExtendedTranslator
    Left = 324
    Top = 15
    TargetsData = (
      1
      1
      (
        ''
        'Text'
        0))
  end
  object qrymes: TwwQuery
    DatabaseName = 'BaseDados'
    SQL.Strings = (
      'SELECT DISTINCT'
      '               H.MES AS MESREFERENCIA'
      'FROM'
      '              HSTCONTRIBASS  H'
      'ORDER BY'
      '              H.MES')
    ValidateWithMask = True
    Left = 30
    Top = 18
  end
  object qrypatro: TwwQuery
    DatabaseName = 'BaseDados'
    SQL.Strings = (
      'SELECT DISTINCT P.IDPESSOA, P.NOME  '
      ''
      'FROM CM.PESSOA P'
      ''
      'WHERE P.FLGPATROCINADORA = 1 '
      ''
      'ORDER BY P.NOME ')
    ValidateWithMask = True
    Left = 327
    Top = 66
  end
  object qryproduto: TwwQuery
    DatabaseName = 'BaseDados'
    Constrained = True
    SQL.Strings = (
      'SELECT DISTINCT'
      '               PA.NOME,PA.IDPLANASS'
      'FROM'
      '               PLANASS PA'
      'ORDER BY'
      '               PA.NOME')
    ValidateWithMask = True
    Left = 327
    Top = 108
  end
  object qryfilial: TwwQuery
    DatabaseName = 'BaseDados'
    SQL.Strings = (
      'SELECT DISTINCT P.IDPESSOA, P.NOME'
      'FROM PESSOA P'
      'WHERE FLGFILIALPESSOA = '#39'1'#39
      'ORDER BY P.NOME')
    ValidateWithMask = True
    Left = 327
    Top = 150
  end
end
