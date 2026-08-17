inherited FrmPRelAlteracaoBenefPagos: TFrmPRelAlteracaoBenefPagos
  Left = 139
  Top = 178
  HelpContext = 180081
  Caption = 'Relatório de Alteração de Benefícios Pagos'
  ClientHeight = 235
  ClientWidth = 550
  FormStyle = fsNormal
  Visible = False
  PixelsPerInch = 96
  TextHeight = 13
  inherited pnlFundo: TPanel
    Width = 550
    Height = 196
    object grpMesRef: TGroupBox
      Left = 11
      Top = 6
      Width = 529
      Height = 45
      Caption = ' Patrocinadora '
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = [fsBold]
      ParentFont = False
      TabOrder = 0
      object cmbPatrocinadora: TwwDBLookupCombo
        Left = 7
        Top = 15
        Width = 513
        Height = 21
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'MS Sans Serif'
        Font.Style = []
        DropDownAlignment = taLeftJustify
        Selected.Strings = (
          'NOME'#9'60'#9'NOME'
          'IDPESSOA'#9'10'#9'IDPESSOA')
        LookupTable = QryPatrocinadora
        LookupField = 'IDPESSOA'
        Options = [loTitles]
        ParentFont = False
        TabOrder = 0
        AutoDropDown = True
        ShowButton = True
        AllowClearKey = True
      end
    end
    object GroupBox1: TGroupBox
      Left = 11
      Top = 51
      Width = 529
      Height = 45
      Caption = ' Plano '
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = [fsBold]
      ParentFont = False
      TabOrder = 1
      OnEnter = GroupBox1Enter
      object cmbPlano: TwwDBLookupCombo
        Left = 7
        Top = 15
        Width = 513
        Height = 21
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'MS Sans Serif'
        Font.Style = []
        DropDownAlignment = taLeftJustify
        Selected.Strings = (
          'NOME'#9'50'#9'NOME'
          'IDPLANOPREV'#9'10'#9'IDPLANOPREV')
        LookupTable = qryPlano
        LookupField = 'IDPLANOPREV'
        Options = [loTitles]
        ParentFont = False
        TabOrder = 0
        AutoDropDown = True
        ShowButton = True
        AllowClearKey = True
      end
    end
    object GroupBox2: TGroupBox
      Left = 11
      Top = 96
      Width = 529
      Height = 45
      Caption = ' Benefício '
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = [fsBold]
      ParentFont = False
      TabOrder = 2
      OnEnter = GroupBox2Enter
      object cmbBeneficio: TwwDBLookupCombo
        Left = 7
        Top = 15
        Width = 513
        Height = 21
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'MS Sans Serif'
        Font.Style = []
        DropDownAlignment = taLeftJustify
        Selected.Strings = (
          'NOME'#9'60'#9'NOME'
          'IDBENEFICIO'#9'10'#9'IDBENEFICIO')
        LookupTable = QryBeneficio
        LookupField = 'IDBENEFICIO'
        Options = [loTitles]
        ParentFont = False
        TabOrder = 0
        AutoDropDown = True
        ShowButton = True
        AllowClearKey = True
      end
    end
    object GroupBox3: TGroupBox
      Left = 9
      Top = 141
      Width = 263
      Height = 43
      Caption = ' Mês e Ano Atual '
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = [fsBold]
      ParentFont = False
      TabOrder = 3
      object cmbMesAtual: TComboBox
        Left = 11
        Top = 15
        Width = 171
        Height = 21
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'MS Sans Serif'
        Font.Style = []
        ItemHeight = 13
        ParentFont = False
        TabOrder = 0
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
      end
      object spnedAnoAtual: TSpinEdit
        Left = 195
        Top = 15
        Width = 55
        Height = 22
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'MS Sans Serif'
        Font.Style = []
        MaxValue = 0
        MinValue = 0
        ParentFont = False
        TabOrder = 1
        Value = 2000
      end
    end
    object GroupBox4: TGroupBox
      Left = 276
      Top = 141
      Width = 263
      Height = 43
      Caption = ' Mês e Ano Anterior '
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = [fsBold]
      ParentFont = False
      TabOrder = 4
      object cmbMesAnterior: TComboBox
        Left = 11
        Top = 15
        Width = 171
        Height = 21
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'MS Sans Serif'
        Font.Style = []
        ItemHeight = 13
        ParentFont = False
        TabOrder = 0
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
      end
      object spnedAnoAnterior: TSpinEdit
        Left = 195
        Top = 15
        Width = 55
        Height = 22
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'MS Sans Serif'
        Font.Style = []
        MaxValue = 0
        MinValue = 0
        ParentFont = False
        TabOrder = 1
        Value = 2000
      end
    end
  end
  inherited Dock971: TDock97
    Top = 196
    Width = 550
    inherited tb97Fundo: TToolbar97
      Left = 367
    end
    inherited TB97oKCancelar: TToolbar97
      Left = 190
      inherited bbtnConfirmar: TBitBtn
        OnClick = bbtnConfirmarClick
      end
    end
  end
  inherited ivTradutor: TIvExtendedTranslator
    Left = 11
    Top = 235
    TargetsData = (
      1
      1
      (
        ''
        'Text'
        0))
  end
  object dsPatrocinadora: TwwDataSource
    DataSet = QryPatrocinadora
    Left = 379
    Top = 17
  end
  object QryPatrocinadora: TwwQuery
    DatabaseName = 'BaseDados'
    SQL.Strings = (
      'SELECT PAT.NOME, PAT.IDPESSOA'
      'FROM PESSOA PAT, PATRO'
      'WHERE PAT.IDPESSOA = PATRO.IDPESSOA'
      'ORDER BY PAT.NOME')
    ValidateWithMask = True
    Left = 339
    Top = 13
  end
  object dsPlano: TwwDataSource
    DataSet = qryPlano
    Left = 451
    Top = 65
  end
  object qryPlano: TwwQuery
    DatabaseName = 'BaseDados'
    SQL.Strings = (
      'SELECT IDPLANOPREV, NOME FROM PLANPREV ORDER BY NOME')
    ValidateWithMask = True
    Left = 411
    Top = 53
  end
  object dsBeneficio: TwwDataSource
    DataSet = QryBeneficio
    Left = 363
    Top = 105
  end
  object QryBeneficio: TwwQuery
    DatabaseName = 'BaseDados'
    SQL.Strings = (
      
        'SELECT BE.IDBENEFICIO, BE.NOME FROM BENEFICIO BE, BENEFPLANPATRO' +
        ' BP WHERE BE.IDBENEFICIO = BP.IDBENEFICIO ')
    ValidateWithMask = True
    Left = 323
    Top = 93
  end
end
