inherited cfgRelParamAtivo: TcfgRelParamAtivo
  Left = 313
  Top = 111
  BorderIcons = [biSystemMenu, biMinimize]
  Caption = 'Parâmetros de Ativo'
  ClientHeight = 422
  ClientWidth = 447
  PixelsPerInch = 96
  TextHeight = 13
  inherited pnlFundo: TPanel
    Width = 447
    Height = 383
    object rdgTipoMov: TRadioGroup
      Left = 16
      Top = 213
      Width = 417
      Height = 85
      Caption = ' Tipo de Movimentação '
      Columns = 3
      ItemIndex = 0
      Items.Strings = (
        'Rentabiliza'
        'Cotiza'
        'Não Afeta'
        'Todos'
        'Não-Parametrizados')
      TabOrder = 0
    end
    object rdgAtivo: TRadioGroup
      Left = 16
      Top = 20
      Width = 417
      Height = 64
      Caption = ' Ativos '
      Columns = 3
      ItemIndex = 0
      Items.Strings = (
        'Empréstimo'
        'Imobiliário'
        'Investimento')
      TabOrder = 1
      OnClick = rdgAtivoClick
    end
    object GroupBox1: TGroupBox
      Left = 15
      Top = 307
      Width = 418
      Height = 65
      TabOrder = 2
      object chkCorLinha: TCheckBox
        Left = 15
        Top = 40
        Width = 233
        Height = 17
        Caption = 'Imprimir linhas com cores alternadas: '
        Checked = True
        State = cbChecked
        TabOrder = 1
      end
      object cboCorLinha: TfcColorCombo
        Left = 266
        Top = 38
        Width = 107
        Height = 21
        AlignmentVertical = fcavCenter
        AutoSelect = False
        ColorDialogOptions = []
        ColorListOptions.ColorWidth = 119
        ColorListOptions.Font.Charset = DEFAULT_CHARSET
        ColorListOptions.Font.Color = clWindowText
        ColorListOptions.Font.Height = -11
        ColorListOptions.Font.Name = 'MS Sans Serif'
        ColorListOptions.Font.Style = []
        ColorListOptions.GreyScaleIncrement = 1
        ColorListOptions.Options = [ccoShowCustomColors]
        CustomColors.Strings = (
          'ColorA=FFFFFF'
          'ColorC=00C0FFFF'
          'ColorD=00C6F9CC'
          'ColorE=00F3E6CD'
          'ColorF=00A0A0A0'
          'ColorG=00BEBEBE'
          'ColorH=00D2D2D2'
          'ColorI=00E3E3E3')
        DropDownCount = 8
        DropDownWidth = 8
        ReadOnly = False
        ShowMatchText = False
        SelectedColor = clWhite
        TabOrder = 2
      end
      object chkLinhas: TCheckBox
        Left = 15
        Top = 16
        Width = 321
        Height = 17
        Caption = 'Imprimir linhas separadoras'
        TabOrder = 0
      end
    end
    object Panel1: TPanel
      Left = 16
      Top = 96
      Width = 417
      Height = 89
      BevelInner = bvRaised
      BevelOuter = bvLowered
      TabOrder = 3
      object pgcFiltros: TPageControl
        Left = 2
        Top = 2
        Width = 413
        Height = 85
        ActivePage = pgEmprestimo
        Align = alClient
        Style = tsButtons
        TabOrder = 0
        object pgEmprestimo: TTabSheet
          Caption = 'pgEmprestimo'
          TabVisible = False
          object Label1: TLabel
            Left = 24
            Top = 16
            Width = 41
            Height = 13
            Caption = 'Evento'
          end
          object cmbEvento: TwwDBComboBox
            Left = 24
            Top = 33
            Width = 353
            Height = 21
            ShowButton = True
            Style = csDropDown
            MapList = False
            AllowClearKey = False
            AutoDropDown = True
            DropDownCount = 8
            ItemHeight = 0
            Items.Strings = (
              '0 - Concessão / Renovação'
              '1 - Prestação'
              '2 - Amortização / Refinanciamento'
              '3 - Quitação'
              '4 - Atualização de Débito'
              '5 - Atualização de Saldo (Diária)'
              '6 - Improtação / Migração'
              '7 - Ajustes (Cobrança / Devolução)'
              '8 - Ajustes (Saldo Devedor)')
            Sorted = False
            TabOrder = 0
            UnboundDataType = wwDefault
          end
        end
        object pgImobiliario: TTabSheet
          Caption = 'pgImobiliario'
          ImageIndex = 1
          TabVisible = False
          object Label2: TLabel
            Left = 24
            Top = 16
            Width = 96
            Height = 13
            Caption = 'Nome do Módulo'
          end
          object cboModulo: TCMDBLookupCombo
            Left = 24
            Top = 33
            Width = 353
            Height = 21
            DropDownAlignment = taLeftJustify
            Selected.Strings = (
              'NOMEMODULO'#9'40'#9'Descrição'#9'F')
            LookupTable = CdsModulo
            LookupField = 'IDMODULO'
            Options = [loTitles]
            Style = csDropDownList
            TabOrder = 0
            AutoDropDown = True
            ShowButton = True
            AllowClearKey = True
            ShowMatchText = True
          end
        end
        object pgInvestimento: TTabSheet
          Caption = 'pgInvestimento'
          ImageIndex = 2
          TabVisible = False
          object Label3: TLabel
            Left = 23
            Top = 16
            Width = 120
            Height = 13
            Caption = 'Tipo de Investimento'
          end
          object cboTipoInvest: TCMDBLookupCombo
            Left = 24
            Top = 33
            Width = 353
            Height = 21
            DropDownAlignment = taLeftJustify
            Selected.Strings = (
              'DESCTIPOINVEST'#9'40'#9'Descrição'#9'F')
            LookupTable = CdsTipoInvest
            LookupField = 'IDTIPOINVEST'
            Options = [loTitles]
            Style = csDropDownList
            TabOrder = 0
            AutoDropDown = True
            ShowButton = True
            AllowClearKey = True
            ShowMatchText = True
          end
        end
      end
    end
  end
  inherited Dock971: TDock97
    Top = 383
    Width = 447
    inherited tb97Fundo: TToolbar97
      Left = 277
    end
    inherited TB97oKCancelar: TToolbar97
      Left = 110
    end
  end
  object CdsModulo: TCMClientDataSet
    Aggregates = <>
    Params = <>
    Left = 392
    Top = 176
    object CdsModuloNOMEMODULO: TStringField
      DisplayLabel = 'Descrição'
      DisplayWidth = 40
      FieldName = 'NOMEMODULO'
      FixedChar = True
      Size = 50
    end
    object CdsModuloIDMODULO: TFloatField
      FieldName = 'IDMODULO'
      Visible = False
    end
    object CdsModuloDESCRICAOMODULO: TStringField
      FieldName = 'DESCRICAOMODULO'
      Visible = False
      Size = 200
    end
  end
  object CdsTipoInvest: TCMClientDataSet
    Aggregates = <>
    Params = <>
    Left = 392
    Top = 256
    object CdsTipoInvestDESCTIPOINVEST: TStringField
      DisplayLabel = 'Descrição'
      DisplayWidth = 40
      FieldName = 'DESCTIPOINVEST'
      Size = 60
    end
    object CdsTipoInvestIDTIPOINVEST: TFloatField
      FieldName = 'IDTIPOINVEST'
      Visible = False
    end
  end
end
