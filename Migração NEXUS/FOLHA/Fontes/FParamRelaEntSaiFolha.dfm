inherited frmParamRelaEntSaiFolha: TfrmParamRelaEntSaiFolha
  Left = 144
  Top = 198
  Caption = 'Parâmetro do Relatório de Entradas/Saídas da Folha'
  ClientHeight = 275
  ClientWidth = 521
  FormStyle = fsNormal
  Visible = False
  PixelsPerInch = 96
  TextHeight = 13
  inherited pnlFundo: TPanel
    Width = 521
    Height = 236
    object Patrocinadora: TLabel
      Left = 16
      Top = 64
      Width = 80
      Height = 13
      Caption = 'Patrocinadora'
    end
    object Plano: TLabel
      Left = 16
      Top = 120
      Width = 33
      Height = 13
      Caption = 'Plano'
    end
    object Beneficio: TLabel
      Left = 16
      Top = 168
      Width = 54
      Height = 13
      Caption = 'Beneficio'
    end
    object Bevel1: TBevel
      Left = 10
      Top = 59
      Width = 500
      Height = 159
      Shape = bsFrame
    end
    object grpMesRef: TGroupBox
      Left = 10
      Top = 8
      Width = 399
      Height = 49
      Caption = 'Mês e Ano de Pagamento'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = [fsBold]
      ParentFont = False
      TabOrder = 0
      object cbMes: TComboBox
        Left = 6
        Top = 18
        Width = 200
        Height = 21
        ItemHeight = 13
        TabOrder = 0
        Text = ' '
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
      object dbseAno: TwwDBSpinEdit
        Left = 253
        Top = 18
        Width = 84
        Height = 21
        Increment = 1
        TabOrder = 1
        UnboundDataType = wwDefault
      end
    end
    object cmbPatrocinadora: TwwDBLookupCombo
      Left = 16
      Top = 87
      Width = 485
      Height = 21
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = []
      DropDownAlignment = taLeftJustify
      Selected.Strings = (
        'NOME'#9'60'#9'NOME')
      DataField = 'IDPESSOA'
      LookupTable = QryPatrocinadora
      LookupField = 'IDPESSOA'
      Options = [loTitles]
      ParentFont = False
      TabOrder = 1
      AutoDropDown = True
      ShowButton = True
      AllowClearKey = True
    end
    object cmbPlano: TwwDBLookupCombo
      Left = 16
      Top = 135
      Width = 485
      Height = 21
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = []
      DropDownAlignment = taLeftJustify
      Selected.Strings = (
        'NOME'#9'50'#9'NOME')
      LookupTable = qryPlano
      LookupField = 'IDPLANOPREV'
      Options = [loTitles]
      ParentFont = False
      TabOrder = 2
      AutoDropDown = True
      ShowButton = True
      AllowClearKey = True
    end
    object cmbBeneficio: TwwDBLookupCombo
      Left = 16
      Top = 183
      Width = 485
      Height = 21
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = []
      DropDownAlignment = taLeftJustify
      Selected.Strings = (
        'NOME'#9'60'#9'NOME')
      LookupTable = QryBeneficio
      LookupField = 'IDBENEFICIO'
      Options = [loTitles]
      ParentFont = False
      TabOrder = 3
      AutoDropDown = True
      ShowButton = True
      AllowClearKey = True
    end
  end
  inherited Dock971: TDock97
    Top = 236
    Width = 521
    inherited tb97Fundo: TToolbar97
      Left = 351
      DockPos = 351
    end
    inherited TB97oKCancelar: TToolbar97
      Left = 162
      DockPos = 162
      inherited ToolbarSep971: TToolbarSep97
        Left = 101
      end
      inherited bbtnConfirmar: TBitBtn
        Width = 101
        Caption = '&Visualizar'
        OnClick = bbtnConfirmarClick
      end
      inherited bbtnCancelar: TBitBtn
        Left = 104
      end
    end
  end
  inherited ivTradutor: TIvExtendedTranslator
    Left = 528
    Top = 165
    TargetsData = (
      1
      1
      (
        ''
        'Text'
        0))
  end
  object QryPatrocinadora: TwwQuery
    DatabaseName = 'BaseDados'
    SQL.Strings = (
      'SELECT PAT.NOME, PAT.IDPESSOA'
      'FROM PESSOA PAT, PATRO'
      'WHERE PAT.IDPESSOA = PATRO.IDPESSOA'
      'ORDER BY PAT.NOME')
    ValidateWithMask = True
    Left = 67
    Top = 77
  end
  object dsPatrocinadora: TwwDataSource
    DataSet = QryPatrocinadora
    Left = 131
    Top = 81
  end
  object qryPlano: TwwQuery
    DatabaseName = 'BaseDados'
    SQL.Strings = (
      'SELECT IDPLANOPREV, NOME FROM PLANPREV ORDER BY NOME')
    ValidateWithMask = True
    Left = 267
    Top = 133
  end
  object dsPlano: TwwDataSource
    DataSet = qryPlano
    Left = 323
    Top = 137
  end
  object QryBeneficio: TwwQuery
    DatabaseName = 'BaseDados'
    SQL.Strings = (
      
        'SELECT BE.IDBENEFICIO, BE.NOME FROM BENEFICIO BE, BENEFPLANPATRO' +
        ' BP WHERE BE.IDBENEFICIO = BP.IDBENEFICIO ')
    ValidateWithMask = True
    Left = 131
    Top = 173
  end
  object dsBeneficio: TwwDataSource
    DataSet = QryBeneficio
    Left = 203
    Top = 177
  end
end
