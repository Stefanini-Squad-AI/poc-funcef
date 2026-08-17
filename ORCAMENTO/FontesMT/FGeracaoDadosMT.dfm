inherited FrmGeracaoDadosMT: TFrmGeracaoDadosMT
  Left = 601
  Top = 163
  HelpContext = 520078
  Caption = 'Geração de Dados'
  ClientHeight = 444
  ClientWidth = 538
  PixelsPerInch = 96
  TextHeight = 13
  inherited pnlFundo: TPanel
    Width = 538
    Height = 405
    object Panel1: TPanel
      Left = 1
      Top = 1
      Width = 536
      Height = 72
      Align = alTop
      TabOrder = 0
      object Label1: TLabel
        Left = 4
        Top = 16
        Width = 84
        Height = 13
        Caption = 'Período Inicial'
      end
      object Label2: TLabel
        Left = 136
        Top = 16
        Width = 77
        Height = 13
        Caption = 'Período Final'
      end
      object Label3: TLabel
        Left = 471
        Top = 16
        Width = 55
        Height = 13
        Caption = 'Exercício'
      end
      object Label5: TLabel
        Left = 264
        Top = 16
        Width = 112
        Height = 13
        Caption = 'Plano Orçamentário'
      end
      object cboPerIni: TComboBox
        Left = 4
        Top = 32
        Width = 123
        Height = 22
        Style = csOwnerDrawFixed
        ItemHeight = 16
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
      object cboPerFim: TComboBox
        Left = 136
        Top = 32
        Width = 123
        Height = 22
        Style = csOwnerDrawFixed
        ItemHeight = 16
        TabOrder = 1
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
      object reExercicio: TDBRealEdit
        Left = 471
        Top = 33
        Width = 56
        Height = 21
        Alignment = taRightJustify
        Lines.Strings = (
          '0')
        TabOrder = 3
        WordWrap = False
        IntDigits = 10
        DecDigits = 0
        NumberFormat = iNumber
        Signal = False
      end
      object cboPlanoOrc: TCMDBLookupCombo
        Left = 264
        Top = 32
        Width = 200
        Height = 21
        DropDownAlignment = taLeftJustify
        Selected.Strings = (
          'NOMEPLANOORC'#9'25'#9'Plano Orçamentário'#9'F'
          'ANO'#9'3'#9'Ano'#9'F')
        LookupTable = cdsPlanoOrc
        LookupField = 'IDPLANOORCAMEN'
        Options = [loColLines, loRowLines, loTitles]
        Style = csDropDownList
        ParentShowHint = False
        ShowHint = False
        TabOrder = 2
        AutoDropDown = True
        ShowButton = True
        AllowClearKey = True
        ShowMatchText = True
        OnChange = cboPlanoOrcChange
      end
    end
    object Panel2: TPanel
      Left = 1
      Top = 73
      Width = 536
      Height = 224
      Align = alTop
      TabOrder = 1
      object Label4: TLabel
        Left = 260
        Top = 131
        Width = 44
        Height = 13
        Caption = 'Cenário'
      end
      object rgTipoCalculo: TRadioGroup
        Left = 20
        Top = 16
        Width = 205
        Height = 108
        Caption = ' Geração dos dados: '
        ItemIndex = 0
        Items.Strings = (
          'Calcular somente Orçados'
          'Calcular somente Realizados'
          'Calcular Orçados && Realizados')
        TabOrder = 0
        OnClick = rgTipoCalculoClick
      end
      object chkCalculaSaldoAnterior: TCheckBox
        Left = 261
        Top = 169
        Width = 204
        Height = 18
        Caption = 'Calcular saldo anterior'
        TabOrder = 5
      end
      object rgCalcContaxGrupo: TRadioGroup
        Left = 260
        Top = 16
        Width = 254
        Height = 44
        Caption = ' Cálculos por: '
        Columns = 2
        ItemIndex = 0
        Items.Strings = (
          'Conta'
          'Grupo de conta')
        TabOrder = 1
        OnClick = rgCalcContaxGrupoClick
      end
      object Panel3: TPanel
        Left = 260
        Top = 58
        Width = 254
        Height = 66
        BevelInner = bvSpace
        BevelOuter = bvLowered
        TabOrder = 2
        object Label7: TLabel
          Left = 10
          Top = 13
          Width = 35
          Height = 13
          Caption = 'Inicial'
        end
        object Label8: TLabel
          Left = 71
          Top = 13
          Width = 42
          Height = 13
          Caption = 'Dígitos'
        end
        object lbConteudo: TLabel
          Left = 128
          Top = 13
          Width = 113
          Height = 13
          Caption = 'Conta Orçamentária'
        end
        object spPosIni: TwwDBSpinEdit
          Left = 11
          Top = 29
          Width = 49
          Height = 21
          Increment = 1
          MaxValue = 99999
          MinValue = 1
          TabOrder = 0
          UnboundDataType = wwDefault
        end
        object spQtdDigitos: TwwDBSpinEdit
          Left = 72
          Top = 29
          Width = 49
          Height = 21
          Increment = 1
          Color = clBtnFace
          ReadOnly = True
          TabOrder = 1
          UnboundDataType = wwDefault
        end
        object edConteudo: TEdit
          Left = 128
          Top = 29
          Width = 105
          Height = 21
          TabOrder = 2
          OnChange = edConteudoChange
        end
      end
      object cboCenario: TwwDBLookupCombo
        Left = 260
        Top = 147
        Width = 254
        Height = 21
        DropDownAlignment = taLeftJustify
        Selected.Strings = (
          'NOMECENARIO'#9'30'#9'Descrição'#9'F')
        LookupTable = CdsCenarios
        LookupField = 'IDCENARIOORCAMEN'
        Options = [loTitles]
        TabOrder = 4
        AutoDropDown = False
        ShowButton = True
        AllowClearKey = False
      end
      object rgModoCalculo: TRadioGroup
        Left = 20
        Top = 136
        Width = 205
        Height = 73
        Caption = 'Modo de cálculo: '
        Columns = 2
        ItemIndex = 1
        Items.Strings = (
          'Dia a dia'
          'Por período')
        TabOrder = 3
        OnClick = rgModoCalculoClick
      end
      object chkCommit: TCheckBox
        Left = 261
        Top = 186
        Width = 249
        Height = 17
        Caption = 'Commitar a cada período processado'
        TabOrder = 6
      end
      object chkValidacaoFDO: TCheckBox
        Left = 261
        Top = 203
        Width = 249
        Height = 17
        Caption = 'Validação de valores realizados (FDO)'
        TabOrder = 7
        OnClick = chkValidacaoFDOClick
      end
    end
    object Panel4: TPanel
      Left = 1
      Top = 297
      Width = 536
      Height = 23
      Align = alTop
      Caption = 'Log de erros'
      Color = clNavy
      Font.Charset = ANSI_CHARSET
      Font.Color = clWhite
      Font.Height = -16
      Font.Name = 'Arial'
      Font.Style = [fsBold, fsItalic]
      ParentFont = False
      TabOrder = 2
    end
    object mmErros: TMemo
      Left = 1
      Top = 320
      Width = 536
      Height = 84
      Align = alClient
      ScrollBars = ssBoth
      TabOrder = 3
    end
  end
  inherited Dock971: TDock97
    Top = 405
    Width = 538
    inherited tb97Fundo: TToolbar97
      Left = 366
      inherited bbtnAjuda: TmaHelpBitBtn
        HelpContext = 520078
      end
    end
    inherited TB97oKCancelar: TToolbar97
      Left = 190
      inherited bbtnConfirmar: TBitBtn
        OnClick = bbtnConfirmarClick
      end
    end
  end
  inherited ivTradutor: TIvExtendedTranslator
    Left = 51
    Top = 339
    TargetsData = (
      1
      2
      (
        'TDBRealEdit'
        'Text'
        0)
      (
        'TMemo'
        'Text'
        0))
  end
  object CdsCenarios: TCMClientDataSet
    Aggregates = <>
    Params = <>
    Left = 113
    Top = 337
  end
  object cdsPlanoOrc: TCMClientDataSet
    Aggregates = <>
    Params = <>
    Left = 193
    Top = 337
  end
end
