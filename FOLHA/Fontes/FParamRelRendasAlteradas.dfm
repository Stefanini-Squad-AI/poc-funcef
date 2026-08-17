inherited frmPRelRendasAlteradas: TfrmPRelRendasAlteradas
  Left = 46
  Top = 115
  HelpContext = 180085
  BorderIcons = [biSystemMenu, biMinimize]
  Caption = 'Relação de Rendas Alteradas'
  ClientHeight = 455
  ClientWidth = 727
  FormStyle = fsNormal
  Visible = False
  PixelsPerInch = 96
  TextHeight = 13
  inherited pnlFundo: TPanel
    Width = 727
    Height = 416
    object grbPatrocinadora: TGroupBox
      Left = 1
      Top = 325
      Width = 725
      Height = 45
      Align = alBottom
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
        Width = 700
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
        LookupTable = qryPatrocinadora
        LookupField = 'IDPESSOA'
        Options = [loTitles]
        ParentFont = False
        TabOrder = 0
        AutoDropDown = True
        ShowButton = True
        AllowClearKey = True
      end
    end
    object grbPlano: TGroupBox
      Left = 1
      Top = 370
      Width = 725
      Height = 45
      Align = alBottom
      Caption = ' Plano '
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = [fsBold]
      ParentFont = False
      TabOrder = 1
      OnEnter = grbPlanoEnter
      object cmbPlano: TwwDBLookupCombo
        Left = 7
        Top = 15
        Width = 700
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
    object pnlVersao: TPanel
      Left = 1
      Top = 1
      Width = 725
      Height = 324
      Align = alClient
      TabOrder = 2
      object rdgVlrPerc: TRadioGroup
        Left = 1
        Top = 190
        Width = 351
        Height = 40
        Caption = ' Apuração da Base de Comparação pelo valor... '
        Columns = 3
        ItemIndex = 0
        Items.Strings = (
          'Bruto'
          'Líquido'
          'Líquido do Mês')
        TabOrder = 2
      end
      object grbMesBase: TGroupBox
        Left = 1
        Top = 5
        Width = 350
        Height = 183
        Caption = ' Mês e Ano Base para Comparação '
        TabOrder = 0
        object lbVersaoMesBase: TLabel
          Left = 8
          Top = 49
          Width = 175
          Height = 13
          Caption = 'Versão Base para Comparação'
        end
        object cmbMesBase: TComboBox
          Left = 8
          Top = 21
          Width = 217
          Height = 21
          ItemHeight = 13
          TabOrder = 0
          OnChange = cmbMesBaseChange
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
        object speAnoBase: TSpinEdit
          Left = 248
          Top = 21
          Width = 90
          Height = 22
          MaxValue = 0
          MinValue = 0
          TabOrder = 1
          Value = 0
          OnChange = speAnoBaseChange
        end
        object chklstVersaoMesBase: TCheckListBox
          Left = 8
          Top = 61
          Width = 330
          Height = 114
          ItemHeight = 13
          TabOrder = 2
        end
      end
      object grbMesPagto: TGroupBox
        Left = 364
        Top = 5
        Width = 350
        Height = 269
        Caption = ' Mês e Ano de Pagamento '
        TabOrder = 1
        object lbVersaoMesPagto: TLabel
          Left = 8
          Top = 81
          Width = 131
          Height = 13
          Caption = 'Versões de Pagamento'
        end
        object cmbMesPagto: TComboBox
          Left = 8
          Top = 21
          Width = 217
          Height = 21
          ItemHeight = 13
          TabOrder = 0
          OnChange = cmbMesPagtoChange
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
        object speAnoPagto: TSpinEdit
          Left = 248
          Top = 21
          Width = 90
          Height = 22
          MaxValue = 0
          MinValue = 0
          TabOrder = 1
          Value = 0
          OnChange = speAnoPagtoChange
        end
        object chklstLoteOuVersaoMesPagto: TCheckListBox
          Left = 8
          Top = 93
          Width = 330
          Height = 169
          ItemHeight = 13
          TabOrder = 2
        end
        object rdoEscolheTabela: TRadioGroup
          Left = 8
          Top = 44
          Width = 329
          Height = 32
          Columns = 2
          ItemIndex = 0
          Items.Strings = (
            'Prévia'
            'Efetivada')
          TabOrder = 3
          OnClick = rdoEscolheTabelaClick
        end
      end
      object grbPercentual: TGroupBox
        Left = 1
        Top = 232
        Width = 351
        Height = 87
        Caption = ' Percentual Aplicado Sobre Base de Comparação '
        TabOrder = 3
        object lblFiltro: TLabel
          Left = 12
          Top = 15
          Width = 45
          Height = 13
          Caption = 'Filtrar...'
        end
        object lblPerc: TLabel
          Left = 252
          Top = 15
          Width = 62
          Height = 13
          Caption = 'Percentual'
        end
        object Label1: TLabel
          Left = 326
          Top = 31
          Width = 10
          Height = 13
          Caption = '%'
        end
        object lblFiltro2: TLabel
          Left = 12
          Top = 49
          Width = 45
          Height = 13
          Caption = 'Filtrar...'
          Enabled = False
        end
        object lblPerc2: TLabel
          Left = 252
          Top = 49
          Width = 62
          Height = 13
          Caption = 'Percentual'
          Enabled = False
        end
        object Label2: TLabel
          Left = 326
          Top = 65
          Width = 10
          Height = 13
          Caption = '%'
          Enabled = False
        end
        object cboTipoFiltro: TComboBox
          Left = 12
          Top = 27
          Width = 225
          Height = 21
          ItemHeight = 13
          TabOrder = 0
          OnChange = cboTipoFiltroChange
          Items.Strings = (
            'Diferente de'
            'Igual a'
            'Maior que'
            'Maior ou Igual que'
            'Menor que'
            'Menor ou Igual que')
        end
        object rdtValPerc: TRealEdit
          Left = 252
          Top = 27
          Width = 72
          Height = 21
          Alignment = taRightJustify
          Lines.Strings = (
            '0,0000')
          TabOrder = 1
          WordWrap = False
          OnExit = rdtValPercExit
          IntDigits = 17
          DecDigits = 4
          NumberFormat = fNumber
          Signal = False
        end
        object cboTipoFiltro2: TComboBox
          Left = 12
          Top = 61
          Width = 225
          Height = 21
          Enabled = False
          ItemHeight = 13
          TabOrder = 2
        end
        object rdtValPerc2: TDBRealEdit
          Left = 252
          Top = 61
          Width = 72
          Height = 21
          Alignment = taRightJustify
          Enabled = False
          Lines.Strings = (
            '0,0000')
          TabOrder = 3
          WordWrap = False
          OnExit = rdtValPerc2Exit
          IntDigits = 10
          DecDigits = 4
          NumberFormat = fNumber
          Signal = False
        end
      end
      object rdgOrdena: TRadioGroup
        Left = 364
        Top = 276
        Width = 350
        Height = 43
        Caption = ' Ordenação por critério de valor '
        Columns = 2
        ItemIndex = 0
        Items.Strings = (
          'Crescente'
          'Decrescente')
        TabOrder = 4
      end
    end
  end
  inherited Dock971: TDock97
    Top = 416
    Width = 727
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
    Left = 91
    Top = 371
    TargetsData = (
      1
      1
      (
        ''
        'Text'
        0))
  end
  object qryPatrocinadora: TwwQuery
    DatabaseName = 'BaseDados'
    SQL.Strings = (
      'SELECT PAT.NOME, PAT.IDPESSOA'
      'FROM PESSOA PAT, PATRO'
      'WHERE PAT.IDPESSOA = PATRO.IDPESSOA'
      'ORDER BY PAT.NOME')
    ValidateWithMask = True
    Left = 379
    Top = 333
  end
  object qryPlano: TwwQuery
    DatabaseName = 'BaseDados'
    SQL.Strings = (
      'SELECT IDPLANOPREV, NOME FROM PLANPREV ORDER BY NOME')
    ValidateWithMask = True
    Left = 291
    Top = 333
  end
  object qryVersaoMesBase: TwwQuery
    DatabaseName = 'BaseDados'
    SQL.Strings = (
      'SELECT'
      '  IDHSTFOLHABENEF,'
      '  IDHSTFOLHABENEF||'#39' - '#39'||HISTORICO AS HISTORICO'
      ''
      'FROM'
      '  HSTFOLHABENEF'
      ''
      'WHERE'
      '  MESREFERENCIA = :PMESREF'
      '  AND FLGESTADO <> 2'
      ''
      'ORDER BY'
      '  IDHSTFOLHABENEF DESC'
      ' ')
    ValidateWithMask = True
    Left = 233
    Top = 146
    ParamData = <
      item
        DataType = ftString
        Name = 'PMESREF'
        ParamType = ptUnknown
      end>
  end
  object qryLoteOuVersaoMesPagto: TwwQuery
    DatabaseName = 'BaseDados'
    ValidateWithMask = True
    Left = 460
    Top = 162
  end
end
