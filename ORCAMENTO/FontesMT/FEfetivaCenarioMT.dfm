inherited frmEfetivaCenarioMT: TfrmEfetivaCenarioMT
  Left = 74
  Top = 44
  HelpContext = 520003
  Caption = 'Efetiva Cenário'
  ClientHeight = 366
  ClientWidth = 481
  OnActivate = FormActivate
  PixelsPerInch = 96
  TextHeight = 13
  inherited pnlFundo: TPanel
    Width = 481
    Height = 327
    object lblExercicio: TLabel
      Left = 33
      Top = 86
      Width = 55
      Height = 13
      Anchors = [akLeft, akBottom]
      Caption = 'Exercício'
    end
    object Label4: TLabel
      Left = 124
      Top = 86
      Width = 84
      Height = 13
      Anchors = [akLeft, akBottom]
      Caption = 'Período Inicial'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = [fsBold]
      ParentFont = False
    end
    object Label6: TLabel
      Left = 291
      Top = 86
      Width = 77
      Height = 13
      Anchors = [akLeft, akBottom]
      Caption = 'Período Final'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = [fsBold]
      ParentFont = False
    end
    object spnedExercicio: TSpinEdit
      Left = 33
      Top = 102
      Width = 81
      Height = 22
      Anchors = [akLeft, akBottom]
      MaxValue = 0
      MinValue = 0
      TabOrder = 0
      Value = 0
      OnExit = spnedExercicioExit
    end
    object mmExplicacao: TMemo
      Left = 1
      Top = 1
      Width = 479
      Height = 60
      TabStop = False
      Align = alTop
      Alignment = taCenter
      Color = clBtnFace
      Ctl3D = True
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clNavy
      Font.Height = -21
      Font.Name = 'MS Sans Serif'
      Font.Style = [fsBold]
      Lines.Strings = (
        'Os valores do Cenário escolhido serão '
        'copiados para ser o seu efetivo valor orçado.'
        '')
      ParentCtl3D = False
      ParentFont = False
      ReadOnly = True
      TabOrder = 1
    end
    object pbAguarde: TProgressBar
      Left = 1
      Top = 305
      Width = 479
      Height = 21
      Align = alBottom
      Min = 0
      Max = 100
      TabOrder = 2
    end
    object gbSalvar: TGroupBox
      Left = 33
      Top = 187
      Width = 415
      Height = 55
      Anchors = [akLeft, akBottom]
      Caption = ' Salvar o Orçado Atual para o Cenário '
      TabOrder = 3
      object dblcSalvaCenario: TCMDBLookupCombo
        Left = 9
        Top = 21
        Width = 394
        Height = 21
        DropDownAlignment = taLeftJustify
        Selected.Strings = (
          'NOMECENARIO'#9'60'#9'Nome do Cenário')
        LookupTable = CdsCenario
        LookupField = 'IDCENARIOORCAMEN'
        Options = [loTitles]
        Style = csDropDownList
        TabOrder = 0
        AutoDropDown = True
        ShowButton = True
        AllowClearKey = True
        ShowMatchText = True
      end
    end
    object gbCenarioEfet: TGroupBox
      Left = 33
      Top = 130
      Width = 415
      Height = 55
      Anchors = [akLeft, akBottom]
      Caption = ' Cenário a ser Efetivado '
      TabOrder = 4
      object dblcCenario: TCMDBLookupCombo
        Left = 9
        Top = 22
        Width = 394
        Height = 21
        DropDownAlignment = taLeftJustify
        Selected.Strings = (
          'NOMECENARIO'#9'60'#9'Nome do Cenário')
        LookupTable = CdsCenario
        LookupField = 'IDCENARIOORCAMEN'
        Options = [loTitles]
        Style = csDropDownList
        TabOrder = 0
        AutoDropDown = True
        ShowButton = True
        AllowClearKey = True
        ShowMatchText = True
      end
    end
    object dblkPeriodoIni: TwwDBLookupCombo
      Left = 124
      Top = 102
      Width = 157
      Height = 21
      Anchors = [akLeft, akBottom]
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = [fsBold]
      DropDownAlignment = taLeftJustify
      Selected.Strings = (
        'NOMEPERIODO'#9'60'#9'NOMEPERIODO')
      DataField = 'PEREXERCI'
      LookupTable = CdsPeriodoIni
      LookupField = 'PERIODO'
      Style = csDropDownList
      DropDownWidth = 8
      ParentFont = False
      TabOrder = 5
      AutoDropDown = True
      ShowButton = True
      AllowClearKey = False
    end
    object dblkPeriodoFim: TwwDBLookupCombo
      Left = 291
      Top = 102
      Width = 157
      Height = 21
      Anchors = [akLeft, akBottom]
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = [fsBold]
      DropDownAlignment = taLeftJustify
      Selected.Strings = (
        'NOMEPERIODO'#9'60'#9'NOMEPERIODO')
      DataField = 'PEREXERCI'
      LookupTable = CdsPeriodoFim
      LookupField = 'PERIODO'
      Style = csDropDownList
      DropDownWidth = 8
      ParentFont = False
      TabOrder = 6
      AutoDropDown = True
      ShowButton = True
      AllowClearKey = False
    end
    object cbSaldoAnterior: TCheckBox
      Left = 33
      Top = 250
      Width = 313
      Height = 17
      Anchors = [akLeft, akBottom]
      Caption = 'Busca Saldo Anterior'
      Checked = True
      State = cbChecked
      TabOrder = 7
    end
    object EdtLegenda: TEdit
      Left = 20
      Top = 280
      Width = 440
      Height = 21
      TabStop = False
      Color = clBtnFace
      Enabled = False
      ReadOnly = True
      TabOrder = 8
      Text = 'EdtLegenda'
      Visible = False
      OnChange = EdtLegendaChange
    end
  end
  inherited Dock971: TDock97
    Top = 327
    Width = 481
    inherited tb97Fundo: TToolbar97
      Left = 150
      DockPos = 229
      inherited sep1: TToolbarSep97
        Left = 244
      end
      object ToolbarSep971: TToolbarSep97 [1]
        Left = 161
        Top = 0
        Blank = True
        SizeHorz = 2
      end
      inherited bbtnSair: TBitBtn
        Left = 163
      end
      inherited bbtnAjuda: TmaHelpBitBtn
        Left = 246
        HelpContext = 520076
      end
      object bbtnEfetiva: TBitBtn
        Left = 0
        Top = 0
        Width = 81
        Height = 33
        Caption = '&Efetivar'
        TabOrder = 2
        OnClick = bbtnEfetivaClick
        Glyph.Data = {
          42010000424D4201000000000000760000002800000011000000110000000100
          040000000000CC00000000000000000000001000000010000000000000000000
          8000008000000080800080000000800080008080000080808000C0C0C0000000
          FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00555555205555
          5555500000005555522205555555500000005555522205555555500000005555
          22222055555550000000555222A220755555500000005522AA5A220555555000
          000052AA5555A20755555000000055555055A220555550000000555500055A20
          7555500000005550505055A207555000000055555050555A2055500000005555
          00055555A207500000005550505555555AAA0000000055505050555555555000
          0000555500055555555550000000555550555555555550000000555555555555
          555550000000}
        Spacing = 2
      end
      object bbtnCancelar: TBitBtn
        Left = 81
        Top = 0
        Width = 80
        Height = 33
        Cancel = True
        Caption = '&Cancelar'
        ModalResult = 2
        TabOrder = 3
        OnClick = bbtnCancelarClick
        Glyph.Data = {
          76010000424D7601000000000000760000002800000020000000100000000100
          0400000000000001000000000000000000001000000000000000000000000000
          8000008000000080800080000000800080008080000080808000C0C0C0000000
          FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00888888888888
          8888888888FFFFF8888888888000008888888888F777778FF888888009191900
          88888887788888778F88887991919191088888788888888878F8879919191919
          108887F888F888F887F887917F919F719088878887FF87FF878F7919FFF9FFF9
          19087F88777F7778887F79919FFFFF9191087F8887777788887F791919FFF919
          19087F8888777FF8887F79919FFFFF9191087F88877777FF887F7919FFF9FFF9
          190878F877787778887887917F919F71908887F88788878887F8879919191919
          1088878F88888888878888799191919108888878FF88888F7888888779999977
          8888888778FFFF77888888888777778888888888877777888888}
        NumGlyphs = 2
      end
    end
  end
  inherited ivTradutor: TIvExtendedTranslator
    Left = 446
    Top = 159
  end
  object CdsPeriodo: TCMClientDataSet
    Aggregates = <>
    Params = <>
    Left = 16
    Top = 296
  end
  object CdsPeriodoIni: TCMClientDataSet
    Aggregates = <>
    Params = <>
    Left = 62
    Top = 296
  end
  object CdsTestaOrcAnt: TCMClientDataSet
    Aggregates = <>
    Params = <>
    Left = 154
    Top = 296
  end
  object CdsOrcado: TCMClientDataSet
    Aggregates = <>
    Params = <>
    Left = 200
    Top = 296
  end
  object CdsPeriodoFim: TCMClientDataSet
    Aggregates = <>
    Params = <>
    Left = 108
    Top = 296
  end
  object CdsOrcadoAnt: TCMClientDataSet
    Aggregates = <>
    Params = <>
    Left = 246
    Top = 296
  end
  object CdsCenario: TCMClientDataSet
    Aggregates = <>
    Params = <>
    Left = 292
    Top = 296
  end
  object CdsSaldoCenario: TCMClientDataSet
    Aggregates = <>
    Params = <>
    Left = 338
    Top = 296
  end
  object CdsSaldoCenarioAnt: TCMClientDataSet
    Aggregates = <>
    Params = <>
    Left = 384
    Top = 296
  end
  object CdsTestaOrc: TCMClientDataSet
    Aggregates = <>
    Params = <>
    Left = 440
    Top = 296
  end
end
